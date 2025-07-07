import mongoose from "mongoose";
import Committee from "../models/committee_model.js";
import { upload } from "../utils/upload-image.js";
import Announcement from "../models/announcement_model.js";
import fs from 'fs';
import parentDir from "../utils/path_locals.js";
import multer from "multer";
import path from 'path';
import User from "../models/user_model.js";
import Event from "../models/events_model.js";
import { profile } from "console";

export const fetchMembers = async (req, res, next) => {

    try {


        let committeeId = req.query.commId;

        committeeId = new mongoose.Types.ObjectId(committeeId);

        const committee = await Committee.findById(committeeId).populate({ path : 'authorities.memberId'}).populate({ path : 'members'});

        let allMembers = committee.authorities.map((auth) => ({
            name : auth.memberId.name,
            email : auth.memberId.emailId,
            position : auth.position,
            imageUrl : auth.memberId.imageUrl ?? "images/constants/prof1.png"
        }));

        committee.members.forEach((member) => {
            allMembers.push({
                name : member.name,
                email : member.emailId,
                position : 'Member',
                imageUrl : member.imageUrl ?? "images/constants/prof1.png"
            });
        })
    return res.status(200).json({
        members : allMembers,
        totalMembers : allMembers.length
    });
    } catch (err) {
        return res.status(500).json({
            message : "Some internal server occured",
            error : err.message
        });
    }
} 

export const addAnnoucementWithImage = async (req, res, next) => {

    try {

        const diskStorage = multer.diskStorage({
            destination: async (req, file, cb) => {
                const folderPath = path.join(parentDir, 'images', 'committees', 'announcements');

                try {
                    await fs.promises.mkdir(folderPath, { recursive: true });
                    cb(null, folderPath);
                } catch (err) {
                    console.error(`Error creating directory: ${err.message}`);
                    cb(new Error('Failed to create directory'), false);
                }
            },
            filename: (req, file, cb) => {
                const extension = path.extname(file.originalname);
                const baseName = path.basename(file.originalname, extension);
                const fileName = `${baseName}-${Date.now()}${extension}`;
                cb(null, fileName);
            }
        });

        const fileFilter = (req, file, cb) => {
            if (file.mimetype === 'image/png' || file.mimetype === 'image/jpeg' || file.mimetype === 'image/jpg') {
                cb(null, true);
            } else {
                cb(new Error('Invalid file type. Only PNG and JPEG are allowed!'), false);
            }
        };

        const upload = multer({
            storage: diskStorage,
            fileFilter: fileFilter
        });

        upload.fields([{ name: 'image' }])(req, res, async (err) => {
            if (err) {
                return res.status(400).json({
                    message: "Multer error",
                    error: err.message
                });
            }

            let filePaths = [];
            if (req.files['image'] && req.files['image'].length > 0) {
                console.log(req.files.length);
                filePaths = req.files['image'].map(file => {
                    const relativePath = file.path.split('images')[1];
                    return path.join('images', relativePath).replace(/\\/g, '/');
                });
            }

            const title = req.body.title;
            const content = req.body.content;
            const tag = req.body.tag;
            const visibility = req.body.visibility;
            const committee_id = req.body.committee_id;
            const userEmail = req.body.userEmail;

            const userId = await User.findOneAndUpdate({ emailId: userEmail }, '_id');

            console.log(filePaths);

            const announcement = Announcement({
                title: title,
                content: content,
                tag: tag,
                visibility: visibility,
                committee_id: committee_id,
                author: userId,
                images: filePaths
            });

            await announcement.save();

            await Committee.findOneAndUpdate({ _id: committee_id }, { $push: { announcements: announcement._id } });

            return res.status(200).json({
                message: "Added announcement",
                announcement: announcement
            });
        });

    } catch (err) {

        console.log(err);
        return res.status(500).json({
            message: "Error encountered",
            error: err.message
        });
    }
};

export const fetchAnnouncements = async (req, res, next) => {

    try{

        const commId = req.query.commId;
        const userEmail = req.query.userEmail;

        const committeesObj = await User.findOne({emailId : userEmail}).select('committees -_id');

        const role = committeesObj.committees.find(committee => {
            return committee.committee_doc.toString() === commId.toString();
        }).position;

        let visibilityStatus;
        if(role === "Extended"){
            visibilityStatus = ["Members+Extended"];
        } else if(role === "Members"){
            visibilityStatus = ["Members", "Members+Extended"];
        } else{
            visibilityStatus = ["Head", "Members", "Members+Extended"];
        }

        const announcements = await Announcement.find({committee_id : commId, visibility : {$in : visibilityStatus}
        }).populate('committee_id', 'name -_id').populate('author', 'name imageUrl -_id');

        const announcementsMod = [];
        for(const ann of announcements){

            const announcement = {
                title : ann.title,
                content : ann.content,
                author : ann.author.name,
                committee : ann.committee_id.name,
                images : ann.images,
                tag : ann.tag,
                authorImage : ann.author.imageUrl || 'images/constants/prof2.png',
                visibility : ann.visibility
            };
            announcementsMod.push(announcement);
        }

        return res.status(200).json({
            message : "Announcements fetched",
            announcements : announcementsMod
        });


    } catch (err) { 
        return res.status(500).json({
            message : "Error faced",
            error : err.message
        });
    } 
}

export const addEvent = async (req, res, next) => {

    try { 

        console.log(req.files);
        const diskStorage = multer.diskStorage({
            destination : async (req, file, cb) => {
                const folderPath = path.join(parentDir, 'images', 'committees', 'events');
                try {
                    await fs.promises.mkdir(folderPath, { recursive: true });
                    cb(null, folderPath);
                } catch (err) {
                    console.error(`Error creating directory: ${err.message}`);
                    cb(new Error('Failed to create directory'), false);
                }
            },
            filename : (req, file, cb) => {
                const extension = path.extname(file.originalname);
                const baseName = path.basename(file.originalname, extension);
                const fileName = `${baseName}=${Date.now()}${extension}`;
                cb(null, fileName);
            }
        });

        const fileFilter = (req, file, cb) => {
            if(file.mimetype === 'image/png' || file.mimetype === 'image/jpeg'){
                cb(null, true);
            } else {
                cb(null, false);
            }
        }

        const upload = multer({
            storage : diskStorage,
            fileFilter : fileFilter
        });

        upload.fields([{name : 'image'}])(req, res, async(err) => {

            if(err) {
                return res.status(400).json({
                    message : "Multer error",
                    error : err.message
                });
            }

            let filePaths = [];
            if(req.files['image'] && req.files['image'].length > 0){
                filePaths = req.files['image'].map(file => {
                    const relativePath = file.path.split('images')[1];
                    return path.join('images', relativePath).replace(/\\/g, '/');
                });
            };

            const name = req.body.name;
            const description = req.body.description;
            const tag = req.body.tag;
            const headEmail = req.body.headEmail;
            const coHeadEmail = req.body.coHeadEmail;
            const committeeId = req.body.committeeId;
            const authorEmail = req.body.authorEmail;
            const venue = req.body.venue;
            const startTime = req.body.startTime;
            const endTime = req.body.endTime;
            const registrationLink = req.body.registrationLink;
            const eligibility = req.body.eligibility;

            const authorId = await User.findOne({emailId : authorEmail}).select('_id');
            const headId = await User.findOne({emailId : headEmail}).select('_id');
            const coHeadId = await User.findOne({emailId : coHeadEmail}).select('_id');
            const startTimeForm = new Date(startTime);
            const endTimeForm = new Date(endTime);

            const event = Event({
                eventName : name,
                description : description,
                tag : tag,
                start_time : startTimeForm,
                end_time : endTimeForm,
                imageUrls : filePaths,
                venue : venue,
                eligibility : eligibility,
                registration_link : registrationLink,
                head : headId,
                coHead : coHeadId,
                committee_id : committeeId,
            });

            await event.save();

            await Committee.findOneAndUpdate({_id : committeeId}, { $push : { events : event._id }});

            return res.status(200).json({
                message : "Event added",
                event : event
            });
        });

    } catch (err) {
        return res.status(500).json({
            message : "Error encountered",
            error : err.message
        });
    }
}

export const fetchEvents = async (req, res, next) => {

    try {
        const committeeId = req.query.commId;

        const events = await Event.find({committee_id : committeeId}).populate({ path : 'committee_id', select : 'name -_id' }).populate({ path : 'head', select : 'name emailId -_id' }).populate({ path : 'coHead', select : 'name emailId -_id' }).sort({start_time : 1});

        const eventsList = [];
        for(const eventObj of events) {
            const event = {
                eventName : eventObj.eventName,
                description : eventObj.description,
                head : eventObj.head.name,
                coHead : eventObj.coHead.name,
                venue : eventObj.venue,
                tag : eventObj.tag,
                registrationLink : eventObj.registration_link,
                startTime : eventObj.start_time,
                endTime : eventObj.end_time,
                images : eventObj.imageUrls,
                eligibility : eventObj.eligibility,
                committeeId : eventObj.committee_id.name,
                headEmail : eventObj.head.emailId,
                coHeadEmail : eventObj.coHead.emailId
            };

            eventsList.push(event);
        }

        return res.status(200).json({
            message : "Events fetched",
            events : eventsList
        });

    } catch (err) {
        return res.status(500).json({
            message : "Some internal server error occured",
            error : err.message
        })
    }
}

export const fetchProfile = async (req, res, next) => {

    try {

    const userEmail = req.query.userEmail;
    let committeeId = req.query.commId;
    
    const user = await User.findOne({emailId : userEmail});

    const position = user.committees.find((committee) => {
        return committee.committee_doc.toString() === committeeId.toString()
    }).position;

    const events = await Event.find({committee_id : committeeId, $or : [
        { head : user._id}, {coHead : user._id}
    ]});

    const announcements = await Announcement.find({
        committee_id : committeeId, author : user._id
    });

    const profileEvents = [];
    for(const event of events){
        const profileEvent = {
            id : event.id,
            title : event.eventName,
            startDate : event.start_time,
            endDate : event.end_time
        }
        profileEvents.push(profileEvent);
    }
    
    const profileAnnouncements = [];
    for(const announcement of announcements){
        const profileAnnouncement = {
            id : announcement._id,
            title : announcement.title,
            visibility : announcement.visibility
        };
        profileAnnouncements.push(profileAnnouncement);
    }

    console.log(profileAnnouncements);

    return res.status(200).json({
        name : user.name,
        email : user.emailId,
        position : position,
        events : profileEvents,
        announcements : profileAnnouncements
    });

    } catch (err) {
        return res.status(500).json({
            statusCode : err.statusCode,
            message : err.message
        });
    }
}

//For variables -> camelcase
//for foldername, filenames and api -> always underscore
//for async -> async await
