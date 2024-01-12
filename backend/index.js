import express from 'express'
import cors from 'cors'
import dotenv from 'dotenv'
import vocabRoute from './routes/vocabRoute.js'
import AuthRoute from './routes/AuthRoute.js'
import userRoute from './routes/userRoute.js'
import morgan from 'morgan'
dotenv.config()

const app = express()
const port = process.env.APP_PORT || 5000

app.use(morgan('dev'));
app.use(cors())
app.use(express.json())
app.get('/', (req, res) => {
    res.send('Hello World!')
    console.log("This was called")
})

app.use(userRoute)
app.use(AuthRoute)
app.use(vocabRoute)

app.listen(port, () => {
    console.log(`Listening on http://localhost:${port}/`)
})

export default app
