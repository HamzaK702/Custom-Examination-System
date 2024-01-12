import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

export const getWords = async (req, res) => {
  const userId = parseInt(req.params.userId); 
  try {
    // Fetch the user's current word level, type, and correctAttempts
    const user = await prisma.user.findUnique({
      where: {
        id: userId,
      },
      select: {
        currentWordLevel: true,
        currentWordType: true,
        correctAttempts: {
          select: {
            id: true,
          },
        },
      }
    });

    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    const { currentWordLevel, currentWordType, correctAttempts } = user;

    // Convert correctAttempts to an array of word IDs
    const correctWordIds = correctAttempts.map(attempt => attempt.id);

    // Fetch the vocabulary words that match the user's current level and type
    // and are not in the user's correctAttempts
    const words = await prisma.vocab.findMany({
      where: {
        level: currentWordLevel,
        type: currentWordType,
        NOT: {
          id: {
            in: correctWordIds,
          },
        },
      },
    });

    // Return the fetched words
    res.status(200).json(words);
  } catch (error) {
    console.error("Error:", error);
    res.status(500).json({ message: 'Internal server error' });
  }
};


// export const getWords = async (req, res) => {
//   const userId = parseInt(req.params.userId); 
//   try {
//     // Fetch the user's current word level and type
//     const user = await prisma.user.findUnique({
//       where: {
//         id: userId,
//       },
//       select: {
//         currentWordLevel: true,
//         currentWordType: true,
//       }
//     });

//     if (!user) {
//       return res.status(404).json({ message: 'User not found' });
//     }

//     const { currentWordLevel, currentWordType } = user;

//     // Fetch the vocabulary words that match the user's current level and type
//     const words = await prisma.vocab.findMany({
//       where: {
//         level: currentWordLevel,
//         type: currentWordType,
//       },
//     });

//     // Return the fetched words
//     res.status(200).json(words);
//   } catch (error) {
//     console.error("Error:", error);
//     res.status(500).json({ message: 'Internal server error' });
//   }
// };


export const attemptWord = async (req, res) => {
    const { userId, wordId, attemptedMeaning } = req.body; // Get data from the request body
  
    try {
      // Fetch the user and the word from the database
      const user = await prisma.user.findUnique({
        where: { id: userId },
      });
  
      const word = await prisma.vocab.findUnique({
        where: { id: wordId },
      });
  
      if (!user || !word) {
        return res.status(404).json({ message: 'User or Word not found' });
      }
  
      // Check if the attempt is correct
      if (word.correctMeaning === attemptedMeaning) {
        // Update the user's correctAttempts array
        await prisma.user.update({
          where: { id: userId },
          data: {
            correctAttempts: {
              connect: { id: wordId }, // Add the word to the correctAttempts relation
            },
          },
        });
  
        await updateUserLevel(userId, user.currentWordLevel, user.currentWordType);
  
        return res.status(200).json({ message: 'Correct attempt' });
      } else {
        return res.status(200).json({ message: 'Incorrect attempt' });
      }
  
    } catch (error) {
      console.error("Error:", error);
      res.status(500).json({ message: 'Internal server error' });
    }
  };
  
  const updateUserLevel = async (userId, currentLevel, currentType) => {
    // Count the total words for the current level and type
    const totalWords = await prisma.vocab.count({
      where: {
        level: currentLevel,
        type: currentType,
      },
    });
  
    // Count the total correct attempts for the current level and type
    const correctAttempts = await prisma.user.findUnique({
      where: { id: userId },
      select: {
        correctAttempts: {
          where: {
            level: currentLevel,
            type: currentType,
          },
        },
      },
    });
  
    const correctAttemptsCount = correctAttempts.correctAttempts.length;
  
    // Check if the user has completed all words for the current level and type
    if (correctAttemptsCount >= totalWords) {
      // Update user's level or type
      let newLevel = currentLevel;
      let newType = currentType;
  
      if (currentLevel < 8) {
        newLevel++;
      } else {
        // Change to the next word type and reset level to 1
        newLevel = 1;
        if (currentType === 'Basic') {
          newType = 'Intermediate';
        } else if (currentType === 'Intermediate') {
          newType = 'Advanced';
        }
      }
  
      // Update the user's current level and type
      await prisma.user.update({
        where: { id: userId },
        data: {
          currentWordLevel: newLevel,
          currentWordType: newType,
        },
      });
    }
  };
  
  
 