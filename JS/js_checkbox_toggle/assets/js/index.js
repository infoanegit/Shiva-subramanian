function toggleClass(remove, add){
    checkBoxes = document.getElementById("chkboxes");

    //getting nodeList of child nodes of #chkboxes
    checkBoxesChildNodes = checkBoxes.children;

    for(let i=0; i<(checkBoxesChildNodes.length); i++){
        checkBoxesChildNodes[i].classList.remove(remove);
        checkBoxesChildNodes[i].classList.add(add);
    }

    return true;
}

function chkboxesBtnclicked(element){
    element.classList.toggle("btn-outline-primary");
    element.classList.toggle("btn-primary");
    return true
}

function btnCheckAllClicked(){
    remove = "btn-outline-primary";
    add = "btn-primary";
    toggleClass(remove, add);
}

function btnUnCheckAllClicked(){
    remove = "btn-primary";
    add = "btn-outline-primary";
    toggleClass(remove, add);
}

function btnToggleClicked(){
    classA = "btn-primary";
    classB = "btn-outline-primary";
    Array.from(document.getElementById("chkboxes").children).forEach(
        (child)=>{
            child.classList.toggle(classA);
            child.classList.toggle(classB);
        }
    );
}