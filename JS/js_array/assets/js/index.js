stringArrayElement = document.getElementById("aValues");
positionValueElement = document.getElementById("posValue");
replaceValueElement = document.getElementById("rValue");

document.getElementById("replaceButtonId").onclick = ()=>{
    const stringArray = stringArrayElement.value.split(",");
    positionValue = positionValueElement.value;
    replaceValue = replaceValueElement.value;
   
    if(validation(positionValue, replaceValue, stringArray) == false){
        return false;
    }
   
    //showing given array to the user
    document.getElementById('gArrayValue').innerText = stringArray;
    
    //changing the value at given position
    stringArray[positionValue - 1] = replaceValue;
    
    //showing modified array to the user
    document.getElementById("mArrayValue").innerText = stringArray;
};

document.getElementById("resetButtonId").onclick = ()=>{
    stringArrayElement.value = "";
    positionValueElement.value = "";
    replaceValueElement.value = "";
};

function validation(positionValue, replaceValue, stringArray){
    if(positionValue == ""){
        alert("Position Value should not be empty");
        return false;
    }
    if(replaceValue == ""){
        alert("Replace Value should not be empty");
        return false;
    }
    if(stringArrayElement.value.length < 1){
        alert("Array Value should not be empty");
        return false;
    }
    if(positionValue > stringArray.length || positionValue < 1){
        alert("position value should be an Integer and within [1" + ((stringArray.length != 1) ? (" .. " + stringArray.length) : "") + "]" );
        return false;
    }
    return true;
}