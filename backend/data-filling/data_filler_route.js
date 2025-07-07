import { Router } from 'express';
import {userFiller, populateCommittees, updateUserCommittees, assignMembersToCommittees, updateUsersMembers, deleteExtraComms} from './data_filler_controller.js';

const router = Router();

router.get('/adding-users', userFiller);

router.get('/adding-Committees', populateCommittees);

router.get('/update-user-committees', updateUserCommittees);

router.get('/adding-user-committees', assignMembersToCommittees)

router.get('/abc', updateUsersMembers);

router.put('/delete', deleteExtraComms);

export default router;