import User from '../models/user_model.js';
import { validationResult, check } from 'express-validator';

export const checkUserExists = async (req, res, next) => {

    try{

        console.log("request recieved");
        
        const userEmail = req.query.email;
        const errors = validationResult(req);

        if(!errors.isEmpty()){
            return res.status(422).json({
                "message" : "Please enter a valid email",
                errors : errors.array()
            });
        }

        const user = await User.findOne({emailId : userEmail });

        if(!user){
            return res.status(404).json({
                "message" : "No user found for this email address"
            });
        }

        return res.status(200).json({
            "message" : "User exists!!",
            "user" : user
        });
    } catch (err) {

        return res.status(422).json({
            "message" : "Some error occured. Please try again",
            error : err
        });
    }
}

export const signUpUser = async (req, res, next) => {
    
    try{

        const errors = validationResult(req);

        if(!errors.isEmpty()){
            return res.status(422).json({
                message : "Encountered error with input",
                errors : errors.array()
            });
        }

        const email = req.body.email;
        const name = req.body.name;

        const userExist = await User.findOne({emailId : email});

        if(userExist != null){
            return res.status(409).json({
                message : "A user with this email already exists"
            });
        }

        const user = User({
            name : name,
            emailId : email,
            committees : [],
        });

        await user.save();

        return res.status(201).json({
            message : "User created",
            user : user
        });

    } catch(err) {
        return res.status(500).json({
            message : "Some internal server occured",
            error : err.message
        })
    }
}
