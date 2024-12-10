//AJAX examples
/* GET: 
  fetch('....') 
*/

/* POST / PUT / DELETE: 
  fetch('....', {
    method: 'POST', 
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      name: 'John Doe'})
    })  
*/

async function printResponse(response){
  const response_json = await response.json();
  document.getElementById('right').innerHTML = JSON.stringify(response_json);
} 

async function getUsers(){
  const response = await fetch('/users');
  printResponse(response);
}


async function addUser(name, age){
  const response = await fetch('/users', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({name, age}) //same as: {"name": name, "age": age}
  });
  printResponse(response);  
}

async function modifyUser(id, name, age){
  const response = await fetch('');
  printResponse(response);  
}

async function deleteUser(id){
  const response = await fetch('');
  printResponse(response);  
}