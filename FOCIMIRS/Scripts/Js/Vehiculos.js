function delRow(elem) {
    document.getElementById('table').removeChild(document.getElementById(elem.id.substring(0, elem.id.lastIndexOf('-')).toString()));
    document.getElementById('table').removeChild(document.getElementById(elem.id.substring(0, elem.id.lastIndexOf('-')).toString()+'b'));
}

function addnewRow() {
    var newrow = document.createElement("div");
    var elem = document.getElementById("table");
    var newbr = document.createElement("br");
    var tipovehiculo = document.getElementById("tipovehiculo").innerHTML;
    newrow.className = "row";
    newrow.id = (parseInt(elem.lastElementChild.previousElementSibling.id) + 1).toString();
    newbr.id = newrow.id + 'b';
    tipovehiculo.replace("1-", newrow.id);
    if (document.getElementById("tabla").value != "m3") {
        newrow.innerHTML =
           '<div class="col-md-2"><select  name = "' + newrow.id + '-1" class="form-control" style="width:120px"><option value="Recoleccion">Recoleccion</option><option value="Directa">Directa</option></select></div>\
            <div class="col-md-2">\
       <select name="'+ newrow.id + '-2" class="form-control" style="width:130px">' +
       tipovehiculo +
      '</select>' +
    '</div>\
    <div class="col-md-3"><input name = "' + newrow.id + '-3"type="text" class="form-control" required title = "Debe llenar este campo"/></div>\
    <div class="col-md-1"><input name = "' + newrow.id + '-8" style="width:60px" type="text" class="form-control"required title = "Debe llenar este campo" /></div>\
    <div class = "col-md-1" id = "' + newrow.id + '-4"><input name = "' + newrow.id + '-4" type="number" class="form-control" value="0"  style="width:60px" onchange="sumCantR(this) required title = "Debe llenar este campo""/></div>\
    <div class="col-md-1"><input name = "' + newrow.id + '-5" type="number" class="form-control" value="0" onchange="sumCantR(this)"  style="width:60px" required title = "Debe llenar este campo" /></div>\
    <div class="col-md-1" id = "' + newrow.id + '-6">0</div>' +
     '<div class="col-md-3" id="delrow-' + newrow.id + '">\
        <br\>\
        <input type="button" class="btn btn-danger" onclick="delRow(this)" id ="'+ newrow.id + '-9" value="Eliminar" />\
    </div>';

    }
    else {
        newrow.innerHTML =
             '<div class="col-md-2"><select  name = "' + newrow.id + '-1" class="form-control" style="width:120px"><option value="Recoleccion">Recoleccion</option><option value="Directa">Directa</option></select></div>\
    <div class="col-md-2">\
       <select name="'+ newrow.id + '-2" class="form-control" style="width:130px">' +
       tipovehiculo +
      '</select>' +
    '</div>\
    <div class="col-md-3"><input name = "' + newrow.id + '-3"type="text" class="form-control" required title = "Debe llenar este campo"/></div>\
    <div class="col-md-1"><input name = "' + newrow.id + '-8" style="width:60px" type="text" class="form-control" required title = "Debe llenar este campo"/></div>\
    <div class = "col-md-1"  id = "' + newrow.id + '-7" ><input name = "' + newrow.id + '-7" type="number" class="form-control" value="0.5" readonly onchange="sumCantR(this)"  style="width:60px" required title = "Debe llenar este campo"/></div>\
    <div class = "col-md-1" id = "' + newrow.id + '-4"><input name = "' + newrow.id + '-4" type="number" class="form-control" value="0" onchange="sumCantR(this)"  style="width:60px" required title = "Debe llenar este campo"/></div>\
    <div class="col-md-1"><input name = "' + newrow.id + '-5" type="number" class="form-control" value="0" onchange="sumCantR(this)"  style="width:60px" required title = "Debe llenar este campo"/></div>\
    <div class="col-md-1" id = "' + newrow.id + '-6">0</div>' +
     '<div class="col-md-2" id="delrow-' + newrow.id + '">\
        <br\>\
        <input type="button" class="btn btn-danger" onclick="delRow(this)" id ="'+ newrow.id + '-9" value="Eliminar" />\
    </div>';
    }

    elem.appendChild(newrow);
    elem.appendChild(newbr);
}
function cambiarTabla() {
    if (document.getElementById("tabla").value == "m3") {
        var newcolumn = document.createElement("div");
        newcolumn.className = "col-md-1";
        newcolumn.id = "densidad"
        newcolumn.innerHTML = "Densidad Aparente (ton/m3)*4";
        document.getElementById("cantidadR").innerHTML = "Cantidad de residuos (ton/mes) (=*3x*4x*5)";
        document.getElementById("numviaje").innerHTML = "Numero de Viaje/mes *5";
        document.getElementById("capacidad").innerHTML = "Capacidad (m3) *3";
        var h = document.getElementById("capacidad");
        h.parentNode.insertBefore(newcolumn, h);
        var divs = document.getElementById("table").childNodes;
        for (i = 1; i < divs.length; i++) {
            if (!isNaN(divs[i].id) && divs[i].id != "") {
                var newcolumnin = document.createElement("div");
                var elem = document.getElementById(divs[i].id + '-4');
                newcolumnin.id = divs[i].id + '-7';
                newcolumnin.innerHTML = '<input name = "' + divs[i].id + '-7" type="number" class="form-control" value= "0.5" readonly onchange="sumCantR(this)"  style="width:60px" required title = "Debe llenar este campo" value = "0"/>';
                newcolumnin.className = "col-md-1";
                elem.parentNode.insertBefore(newcolumnin, elem);
            }
        }
    }
    else {
        document.getElementById("cantidadR").innerHTML = "Cantidad de residuos (ton/mes) (=*1x*2)";
        document.getElementById("numviaje").innerHTML = "Numero de Viaje/mes *2";
        document.getElementById("capacidad").innerHTML = "Capacidad (ton) *1";
        document.getElementById("densidad").parentElement.removeChild(document.getElementById("densidad"));
        var j = 1;
        for (i = 1;; i++) {
            var re = document.getElementById(i.toString()+'-7');
            if (re == null){
                break;
            }
            re.parentElement.removeChild(re);
            }
        }

}

function sumCantR(x) {
    var cant = document.getElementById(x.name[0] + '-6');
    if (document.getElementById("tabla").value == "m3") {
        cant.innerHTML = (parseFloat(document.getElementsByName(x.name[0] + '-4')[0].value) * parseFloat(document.getElementsByName(x.name[0] + '-5')[0].value) *
                     parseFloat(document.getElementsByName(x.name[0] + '-7')[0].value)).toString();
    }
    else {
        cant.innerHTML = (parseFloat(document.getElementsByName(x.name[0] + '-4')[0].value) * parseFloat(document.getElementsByName(x.name[0] + '-5')[0].value)).toString();

    }
    if (cant.innerHTML.toString() == "NaN") {
        cant.innerHTML = "0";
    }
}
function selectdm() {
    window.location.href = "/focimirs/focimirs/vehiculos/ChangeDm?id=" + document.getElementById("InMunicipio").value;
    
}
function list() {
    window.location.href = "/focimirs/focimirs/vehiculos/list?dm=" + document.getElementById("InMunicipio").value;
}