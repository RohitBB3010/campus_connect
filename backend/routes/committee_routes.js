import express from 'express';
import { fetchMembers, addAnnoucementWithImage, fetchAnnouncements, addEvent, fetchEvents, fetchProfile } from '../controllers/committee_controller.js';

const router = express.Router();

router.get('/fetch-members', fetchMembers);

router.post('/add-announcement', addAnnoucementWithImage);

router.get('/fetch-announcements', fetchAnnouncements);

router.post('/add-event', addEvent);

router.get('/fetch-events', fetchEvents);

router.get('/fetch-profile', fetchProfile);

export default router;