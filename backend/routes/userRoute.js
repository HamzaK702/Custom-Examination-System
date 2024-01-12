import express from 'express'
import { getWords, attemptWord } from '../controller/userController.js'
const router = express.Router();


//Get all words that user can attempt 
router.get("/getWords/:userId", getWords);

//Attempt a word
router.post("/attemptWord", attemptWord);

export default router;