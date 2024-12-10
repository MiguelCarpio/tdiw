import { userModel } from "./../models/user.js";

const userController = {
  getUsers: (req, res) => {
    res.json(userModel.getUsers());
  },
  
  addUser: (req, res) => {
    const {name, age} = req.body;
    userModel.addUser(name, age);
    userController.getUsers(req, res);
  },
  
  modifyUser: (req, res) => {  
    const id = req.params;
    const {name, age} = req.body;
    userModel.modifyUser(id, name, age);
    userController.getUsers(req, res);
  },
  
  deleteUser: (req, res) => { 
    const id = req.params;
    userModel.deleteUser(id);
    userController.getUsers(req, res);
  }
}


export default userController
