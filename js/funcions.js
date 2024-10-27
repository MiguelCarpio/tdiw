function confirmaRegistre(){
    alert("registrant estudiant");
    document.getElementById("formDiv").innerHTML = "<p class='important'>T'has registrat amb èxit!</p>";
    console.log("registrant estudiant");
    return false;
}

async function carregaMencions(){
    var tagGraus = document.getElementById("graus");
    var resposta = await fetch("controladors/mencions.php?grau="+tagGraus.value);
    var respostaTxt = await resposta.text();
    document.getElementById("mencions").innerHTML = respostaTxt;
}

$(document).ready(function(){
    $("#graus").change(function(){
        $.ajax({url: "controladors/mencions.php?grau=" + $("#graus").val(), success:
        function(result){
            $("#mencions").html(result);
        }});
    });
});


