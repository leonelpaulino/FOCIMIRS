function selectprov() {
    //Cambiar cuando se vaya poner en el sevidor  a /focimirs/focimirs/Cuestinario/ChangeProv?id=
    window.location.href = "/focimirs/focimirs/Cuestionario/Index?prov=" + document.getElementById("InProvincia").value;
}
function selectdml() {
    //Cambiar cuando se vaya poner en el sevidor  a /focimirs/focimirs/Cuestinario/ChangeDm?id=
    window.location.href = "/focimirs/focimirs/Cuestionario/Index?prov=" + document.getElementById("InProvincia").value + "&mun=" + document.getElementById("InMunicipio").value;
}