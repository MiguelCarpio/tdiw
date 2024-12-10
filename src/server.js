import express from 'express'
import userController from './app/controllers/user.js'
import path from 'path'
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express()
const port = 3000

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Something went wrong!' });
});

app.use(express.json())

app.use(express.static('public'))

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '/index.html'))
})
app.get('/users', userController.getUsers) //list all users
app.get('/', userController.addUser) //add a user
app.get('/', userController.modifyUser) //modify a user  
app.get('/', userController.deleteUser) //delete a user

app.listen(port, () => {
  console.log(`REST app listening on port ${port}`)
})