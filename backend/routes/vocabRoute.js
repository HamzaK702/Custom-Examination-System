import express from 'express'
import { addWord, updateWord, deleteWord } from '../controller/vocabController.js'
const router = express.Router();


router.post('/addWord', addWord);
router.put('/updateWord/:id', updateWord);
router.delete('/deleteWord/:id', deleteWord);

export default router;