import { Router } from 'express';
import { checkUserExists, signUpUser } from '../controllers/auth_controller.js';
import { query, check, validationResult } from 'express-validator';

const router = Router();

router.get('/checkUserExists', 
    query('email').isEmail().withMessage('Please enter a valid email'),
    checkUserExists);

router.post('/signUpMember',
    [
        check('email').isEmail().withMessage('Please enter a valid email'),
        check('name').isLength({ min : 5 }).withMessage('Please enter full name')
    ],
    signUpUser
)

export default router;