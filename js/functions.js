async function buy(type){
  const resposta = await fetch("controllers/buy.php?type=" + type);
  const respostaTxt = await resposta.text();
  document.getElementById("message").innerHTML = respostaTxt;
}

async function info(type){
  const resposta = await fetch("controllers/info.php?type=" + type);
  const respostaTxt = await resposta.text();
  document.getElementById("message").innerHTML = respostaTxt;

}

function clearMessage(){

  document.getElementById("message").innerHTML="";
}
function clearCart(){

  document.getElementById("cart").innerHTML="";
}

async function cart(){
  clearMessage();
  const resposta = await fetch("controllers/cart.php");
  const respostaTxt = await resposta.text();
  document.getElementById("cart").innerHTML = respostaTxt;

}

/*===========================================*/

