import mongoose from "mongoose";

const AnnouncementSchema = mongoose.Schema({
    title : {
        type : String,
        required : true
    },
    content : {
        type : String,
        required : false,
        default : null
    },
    images : [
        { type : String }
    ],
    committee_id : {
        type : mongoose.Schema.Types.ObjectId,
        ref : 'Committee',
        required : true
    },
    visibility : {
        type : String,
        enum : ["Members", "Members+Extended", "All"],
        default : "Members"
    },
    tag : {
        type : String,
        enum : ["Event",
      "Important",
      "Urgent",
      "Meeting",
      "Update",
      "Casual",
      "Achievement",
      "Feedback"],
        default : null
    },
    author : {
        type : mongoose.Schema.Types.ObjectId,
        ref : 'User',
        required : true
    }
}, {timeStamps : true});

const Announcement = mongoose.model('Announcement', AnnouncementSchema);

export default Announcement;