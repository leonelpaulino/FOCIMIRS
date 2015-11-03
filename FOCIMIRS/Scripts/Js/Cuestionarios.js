var ele = document.getElementsByTagName('input');
var rad = [];
for (var i = 0; i < ele.length; i++) {
    if (ele[i].type == 'radio')
    {
        rad.push(ele[i]);
    }
    else if (ele[i].name[0] == 'd')
    {
        ele[i].onclick = function () {
            var ele = document.getElementsByTagName('input');
            for (var i = 0; i < ele.length; i++) {
                    if (ele[i].type == 'radio')
                    {
                        rad.push(ele[i]);
                    }
            }
            for (var i = 0; i < rad.length; i++) {
                var s1 = this.name.substr(0, this.name.indexOf('-', this.name.indexOf('-')+1));
                var s2 = 'd'+rad[i].name.substr(0, rad[i].name.indexOf('-', rad[i].name.indexOf('-') + 1));
            if (rad[i].type == 'radio' && rad[i].value.indexOf('d') != -1 && rad[i].checked && s1 == s2)
                rad[i].checked = false;
            }
  
        };
    }
}
function radclick(x) {

}
for (var j = 0; j < rad.length; j++) {
    rad[j].onclick = function () {
        if (this.value.substr(1) == '4' && document.getElementById(this.name.substr(0, this.name.indexOf('-'))) != null) {
            
            if (this.name[0] == '7') {
                document.getElementById(this.name.substr(0, this.name.indexOf('-'))).style.display = "block";
                document.getElementById('7-5').style.display = "block";
                document.getElementById('7-87').style.display = "none";
                document.getElementById('7-88').style.display = "none";
            }
            else {
                document.getElementById(this.name.substr(0, this.name.indexOf('-'))).style.display = "block";
            }
        }
        else if (this.value.substr(1) == '43' && document.getElementById(this.name.substr(0, this.name.indexOf('-'))) != null) {
            
            if (this.name[0] == '7') {
                document.getElementById('7-5').style.display = "none";
                document.getElementById('7-87').style.display = "block";
                document.getElementById('7-88').style.display = "block";
            }
            else {
                document.getElementById(this.name.substr(0, this.name.indexOf('-'))).style.display = "none";
            }
        }
        else if (this.value.substr(2) == '34')
        {
            document.getElementById('11-12').style.display = 'block';
            document.getElementById('11').style.display = 'block';
            document.getElementById('11-13').style.display = 'none';
        }
        else if (this.value.substr(2) == '35')
        {
            document.getElementById('11-13').style.display = 'block';
            document.getElementById('11-12').style.display = 'none';
            document.getElementById('11').style.display = 'block';
        }
        if (this.value.indexOf('d') != -1) {
            ClearTextBox('d' + this.name.substr(0, this.name.indexOf('-', this.name.indexOf('-') + 1)));
        }
    };
}
function ClearTextBox(p) {
    var ele = document.getElementsByTagName('input');
    for (var i = 0 ; i < ele.length; i++) {
        if (ele[i].type == 'text') {
            if (ele[i].name.substr(0, ele[i].name.indexOf('-', ele[i].name.indexOf('-')+1)) == p) {
                ele[i].value = '';
            }
        }
    }
}
function RemoveHidden() {
    var divs = document.getElementsByTagName("div");
    for (i = 0 ; i < divs.length; i++) {
        if (divs[i].style.display == 'none')
            divs[i].remove();
    }
    RemoveUncheked();
}
function RemoveUncheked() {
    var inputs = document.getElementsByTagName('input');
    var i = inputs.length;
    while (i--) {
        if (((inputs[i].type == 'radio' || inputs[i].type == 'checkbox') && !inputs[i].checked) ||
            (inputs[i].type == "text" && inputs[i].value.length == 0)) {
            inputs[i].remove();
        }
    }

}
function sumSubTotal(element) {
    var total = document.getElementById("total");
    if (parseInt(element.name.substr(0, 2)) >= 36 && parseInt(element.name.substr(0, 2)) <= 47) {
        var sub = document.getElementById("subtotal");
    }
    else if (parseInt(element.name.substr(0, 2)) >= 48 && parseInt(element.name.substr(0, 2)) <= 56) {
        var sub = document.getElementById("subtotal2");
    }
    else if (parseInt(element.name.substr(0, 2)) >= 57 && parseInt(element.name.substr(0, 2)) <= 78) {
        var sub = document.getElementById("subtotal3");
    }
    sub.innerHTML = (parseInt(sub.innerHTML) + parseInt(element.value) - parseInt(element.oldvalue)).toString();
    total.innerHTML = (parseInt(total.innerHTML) + parseInt(element.value) - parseInt(element.oldvalue)).toString();

    
}
function selectdm() {
    //Cambiar cuando se vaya poner en el sevidor  a /focimirs/focimirs/home/ChangeDm?id=
    window.location.href = "/focimirs/focimirs/home/ChangeDm?id=" + document.getElementById("InMunicipio").value;
}