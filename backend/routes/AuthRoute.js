import express from 'express'
import {  register, login, forgetPassword, verifyCode, updatePasswordUser  } from '../controller/authController.js'

const router = express.Router()

//Register API
router.post('/register', register)
//Login API
router.post('/login', login)
//forgetPassword ---> Sends code to user's email
router.post('/forget', forgetPassword)
//Verify code --> User sends the same code back this api verifies
router.post('/verify', verifyCode)
//updatePassword 
router.post('/updatePassword', updatePasswordUser)

export default router
 