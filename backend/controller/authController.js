import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import nodemailer from 'nodemailer';
import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

const transporter = nodemailer.createTransport({
    service: 'Gmail', 
    auth: {
      user: process.env.EMAIL_MED,
      pass: process.env.PASS_MED,
    },
  });
  

export const register = async (req, res) => {
    console.log("register  API hitted")
    const { name, email, password } = req.body
    const salt = await bcrypt.genSalt();
    const passwordHash = await bcrypt.hash(password , salt);
    console.log( name, email)
    
    try {
        const user = await prisma.user.create({
            data: {
                name: name,
                email: email,
                password: passwordHash
            },
        })

        const mailOptions = {
            from: process.env.EMAIL_MED,
            to: email,
            subject: 'Welcome to MentorE',
            text: `Welcome sir to mentor E, your vocab will now go boom boom!`,
          };
      
          await transporter.sendMail(mailOptions);
        
          res.status(201).json(user)
    } catch (error) {
        res.status(400).json({ msg: error.message })
    }
}


export const login = async (req,res) => {
    try{
        const {email , password} = req.body;
        const user = await prisma.user.findUnique({
            where: {
              email: email,
            },
          });
        if(!user) return res.status(400).json({msg:"User does not exist"});
        const isMatch = await bcrypt.compare(password , user.password);
        if(!isMatch) return res.status(400).json({msg:"Invalid credentials"});
        const token = jwt.sign({id:user.id} , process.env.JWT_SECRET);
        delete user.password;
        res.status(200).json({token , user});
    } catch(err){
        res.status(500).json({error:err.message});
    }
}


export const forgetPassword = async (req, res) => {
  try {
    const { email } = req.body;
    const user = await prisma.user.findUnique({
      where: {
        email: email,
      },
    });
      if (!user) {
      res.status(404).json({ error: "Student not found" });
      return;
    }
    console.log(user)
    const verificationCode = (Math.floor(1000 + Math.random() * 9000)+"");
    const updatedUser = await prisma.user.update({
      where: {
          email: email,
        },
      data: {
        verificationCode: verificationCode,
      },
    });
    console.log(updatedUser)
    const mailOptions = {
      from: process.env.EMAIL_MED,
      to: email,
      subject: 'Email Verification Code',
      text: `Your verification code is: ${verificationCode}`,
    };

    await transporter.sendMail(mailOptions);
  
    res.status(201).json(`Your verification code sent to ${email}`)
    
     
  } catch (err) {
    res.status(500).json({ error: "An error occurred while processing your request" });
  }
};

export const verifyCode = async (req, res) => {
  console.log("verifyCode called");
  try {
    const { id } = req.params;
    const { verificationCode } = req.body;

    const user = await prisma.user.findUnique({
      where: {
        id: parseInt(id),
      },
    });

    if (!user) {
      res.status(404).json({ error: "Student not found" });
      return;
    }

    if (user.verificationCode === verificationCode) {
      const updatedUser = await prisma.user.update({
        where: {
          id: parseInt(id),
        },
        data: {
          isVerified: true,
        },
      });
      res.status(200).json(updatedUser);
    } else {
      res.status(400).json({ error: "Invalid verification code" });
    }
  } catch (err) {
    res.status(500).json({ error: "An error occurred while processing your request" });
  }
}; 

//
export const updatePasswordUser = async (req, res) => {
  console.log("updatePasswordUser called");
  try {
    const { email } = req.body;
    const { password } = req.body;
    const salt = await bcrypt.genSalt();
    const passwordHash = await bcrypt.hash(password , salt);
    const updatePasswordUser = await prisma.user.update({
      where: {
          email: email,
        },
      data: {
        password: passwordHash,
      },
    });
     res.status(200).json(updatePasswordUser)
  } 
  catch (err) {
    res.status(500).json({ error: "An error occurred while processing your request" });
  }
};