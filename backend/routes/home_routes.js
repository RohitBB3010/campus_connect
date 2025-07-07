import { Router } from 'express';
import { fetchHomeData,uploadUserProfile, editProfile, fetchHomeEvents, fetchHomeAnnouncements, fetchBasicUserData } from '../controllers/home_controller.js';

const router = Router();

router.get('/fetch-basic-user-data', fetchBasicUserData);

router.post('/upload-image', uploadUserProfile);

router.put('/edit-profile', editProfile);

router.get('/fetch-home-events', fetchHomeEvents);

router.get('/fetch-home-announcements', fetchHomeAnnouncements);

router.get('/fetch-home', fetchHomeData);

export default router;