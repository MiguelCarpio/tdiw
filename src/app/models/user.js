const users = {
  1: {name: 'Ton', age: 19},
  2: {name: 'Sara',age: 20},
};

const userModel = {
  getUsers: () => {
    return users;
  },
  addUser: (name, age) => {
    const id = Object.keys(users).length + 1;
    users[id] = {name, age};
  },
  modifyUser: (id, name, age) => {
    users[id] = {name, age};
  },
  deleteUser: (id) => {
    delete users[id];
  }
}

export {userModel}; 