import mongoose, { mongo } from "mongoose";

const eventModel = mongoose.Schema({
    eventName : {
        type : String,
        required : true
    },
    description : {
        type : String,
        required : true
    },
    imageUrls : [
        {
            type : String
        }
    ],
    head : {
        type : mongoose.Schema.Types.ObjectId,
        ref : 'User',
        required : true,
    },
    coHead : {
        type : mongoose.Schema.Types.ObjectId,
        ref : 'User',
        required : true
    },
    committee_id : {
        type : mongoose.Schema.Types.ObjectId,
        ref : 'Committee',
        required : true
    },
    start_time : {
        type : Date,
        required : true
    },
    end_time : {
        type : Date,
        required : true
    },
    eligibility : {
        type : String,
        required : true,
    },
    registration_link : {
        type : String,
        required : false
    },
    venue : {
        type : String,
        required : true
    },
    tag : {
        type : String,
        required : true
    }
});

const Event = mongoose.model('Event', eventModel);

export default Event;