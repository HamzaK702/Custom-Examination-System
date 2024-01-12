import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

export const addWord = async (req, res) => {
    try{
    
        const {       
        word, 
        sentence, 
        meanings,  
        correctMeaning,  
        type,
        level,
        locked 
  
        } = req.body
        const vocab = await prisma.vocab.create({
            data: {
            word: word,  
            sentence: sentence,  
            meanings: meanings,  
            correctMeaning: correctMeaning, 
            type: type,  
            level:  level,
            locked: locked
            },
        })
        res.status(200).json(vocab);
        console.log("Word added to database: " + word)
    } catch(err){
        res.status(404).json({error:err.message});
    }
}

export const updateWord = async (req, res) => {
    const { id } = req.params; // Get the word ID from the URL parameter
    const updatedData = req.body; // Get the updated data from the request body
  
    try {
      const updatedWord = await prisma.vocab.update({
        where: { id: parseInt(id) },
        data: updatedData,
      });
      res.status(200).json(updatedWord);
      console.log(`Word with ID ${id} has been updated.`);
    } catch (err) {
      res.status(404).json({ error: err.message });
    }
  };

  
  export const deleteWord = async (req, res) => {
    const { id } = req.params; // Get the word ID from the URL parameter
  
    try {
      const deletedWord = await prisma.vocab.delete({
        where: { id: parseInt(id) },
      });
      res.status(200).json(deletedWord);
      console.log(`Word with ID ${id} has been deleted.`);
    } catch (err) {
      res.status(404).json({ error: err.message });
    }
  };
  