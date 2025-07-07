import mongoose from "mongoose";

const UserSchema = new mongoose.Schema({
    name : {
        type : String,
        required : true
    },
    emailId : {
        type : String,
        required : true
    },
    committees : [
        {
            committee_doc : { type : mongoose.Schema.Types.ObjectId, ref : 'Committee', required : true},
            committee_name : { type : String, required : true},
            position : { type : String, required : true }
        }
    ],
    imageUrl : {
        type : String,
        required : false,
        default : null
    }
}, { timestamps : true });

const User = mongoose.model('User', UserSchema);

export default User;