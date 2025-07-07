import mongoose, { mongo } from 'mongoose';
import User from '../models/user_model.js';
import { upload }  from '../utils/upload-image.js';
import path from 'path';
import Event from '../models/events_model.js';
import Announcement from '../models/announcement_model.js';

export const fetchBasicUserData = async (req, res, next) => {
  try{

    console.log("Request recieved");
    const userEmail = req.query.userEmail;

    const userData = await User.findOne({
      emailId : userEmail
    }).select('name imageUrl');

    return res.status(200).json({
      message : "Data fetched",
      name : userData.name,
      imageUrl : userData.imageUrl ?? 'images/constants/prof1.png'
    });

  } catch (err){
    return res.status(500).json({
      message : "Error fetching user data",
      error : err.message
    })
  }
}

export const fetchHomeData = async (req, res, next) => {

    try{

        const emailId = req.query.email;

        const user = await User.findOne({emailId : emailId}).populate({path : 'committees.committee_doc'});

        let responseUser = user;

        if(user.committees.length > 0){
            const transformedCommittees = user.committees.map(comm => ({
                id : comm.committee_doc.id,
                committeeName: comm.committee_name,
                position: comm.position,
                logoUrl : comm.committee_doc.imageUrl
            }));

            responseUser = {...responseUser._doc, committees : transformedCommittees};
        }
        
        return res.status(200).json({
            message : "Data pulled",
            user : responseUser
        });

    } catch (err) {
        return res.status(500).json({
            message : "An internal server error occured",
            error : err.message
        });
    }
}

export const uploadUserProfile = async (req, res, next) => {
    try {
  
      await new Promise((resolve, reject) => {
        upload.single('image')(req, res, (err) => {
          if (err) {
            return reject(err); 
          }
          resolve();
        });
      });
  
      if (!req.file) {
        return res.status(400).json({
          message: "No file uploaded",
        });
      }
  
      const id = req.query.id;
      const objectId = new mongoose.Types.ObjectId(id);
  
      const relativePath = req.file.path.split('images')[1];
      const savedPath = path.join('images', relativePath).replace(/\\/g, '/');

      const updatedUser = await User.findOneAndUpdate(
         objectId,
        { $set: { imageUrl : savedPath } },
        { new: true } 
      );

  

      if (!updatedUser) {
        return res.status(404).json({
          message: "User not found",
        });
      }

      return res.status(200).json({
        message: 'Profile uploaded successfully',
        filePath: savedPath,
      });
    } catch (err) {
      console.error("Error in uploadUserProfile:", err.message);
      return res.status(500).json({
        message: "Internal server error occurred",
        error: err.message,
      });
    }
};

export const editProfile = async (req, res, next) => {

    try{

        const newName = req.body.name;
        const email = req.body.email;
        const setImageNull = req.body.setImageNull;

        console.log("Newname is :" + newName);
        console.log('Set image null is :' + setImageNull);

        let updatedUser;

        if(setImageNull == true){
            updatedUser = await User.findOneAndUpdate({emailId : email}, { $set : { name : newName, imageUrl : null }}, { new : true });
            console.log(updatedUser);
        } else {
            updatedUser = await User.findOneAndUpdate({emailId : email}, { $set : { name : newName}}, { new : true });
        }

        return res.status(200).json({
            message : "Name updated",
            user : updatedUser
        });
    } catch (err) {
        return res.status(500).json({
            message : "Some internal server occured",
            error : err.message
        });
    }
}

export const fetchHomeEvents = async (req, res, next) => {
  try{

    const userEmail = req.query.emailId;

    const user = await User.findOne({ emailId : userEmail }).select('name emailId');

    const currentDateTime = Date.now();

    const events = await Event.find({ end_time : {$gt : currentDateTime }}).populate('committee_id').populate('head').populate('coHead').sort({ start_time : 1});

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
                coHeadEmail : eventObj.coHead.emailId,
                committeeName : eventObj.committee_id.name,
            };

            eventsList.push(event);
        }

        return res.status(200).json({
          message : "Data fetched",
          userName : user.name,
          profileUrl : user.imageUrl ?? 'images/constants/prof2.png',
          events : eventsList
        });
        

  } catch (err){
    return res.status(500).json({
      message : "Some internal error occured",
      error : err.message
    });
  }
}

export const fetchHomeAnnouncements = async (req, res, next) => {
  try {

    const userEmail = req.query.userEmail;

    const announcementsData = await Announcement.find({
      visibility : 'All'
    }).populate({ path : 'committee_id', select : 'name'}).populate({ path : 'author', select : 'name imageUrl'});

    const announcementsList = [];

    for(const announcementObj of announcementsData){
      const announcement = {
        'title' : announcementObj.title,
        'content' : announcementObj.content,
        'tag' : announcementObj.tag,
        'author' : announcementObj.author.name,
        'authorImage' : announcementObj.author.imageUrl ?? 'images/consts/prof1.png',
        'committeeName' : announcementObj.committee_id.name
      };

      announcementsList.push(announcement);
    }

    return res.status(200).json({
      message : 'Announcements fetched',
      announcements : announcementsList
    });

  } catch (err) {
    return res.status(500).json({
      message : "Some unexpected occurred",
      error : err.message
    });
  }
}