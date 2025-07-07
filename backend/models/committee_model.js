import mongoose from "mongoose";

const CommitteeSchema = mongoose.Schema({
    name : {
        type : String,
        required : true
    },
    authorities : [
        {
            position : { type : String, required : true},
            memberId : { type : mongoose.Schema.Types.ObjectId, ref : 'User', required : true},
        }
    ],
    members : [
        {
            type : mongoose.Schema.Types.ObjectId,
            ref : 'User',
            required : true
        }
    ],
    events : [
        {
            type : mongoose.Schema.Types.ObjectId,
            ref : 'Event',
            required : true
        }
    ],
    announcements : [
        {
            type : mongoose.Schema.Types.ObjectId,
            ref : 'Announcement'
        }
    ],
    imageUrl : {
        type : String,
        required : false
    }
});

const Committee = mongoose.model('Committee', CommitteeSchema);

export default Committee;