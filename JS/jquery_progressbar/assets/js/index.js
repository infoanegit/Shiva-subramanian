function buttonControl(e){
    //getting width value of progress bar in %
    var pBarWidth = document.getElementById("pBar").style.width;
    var pBarWidth = parseInt(pBarWidth.replace("%", ""));
    var additionValue = 0;
    
    //finding which button got clicked and show error
    if(pBarWidth <= 0 && e.target.id == "minusButton"){
        $("#decrease-error").show();
    } 
    else if(pBarWidth >= 100 && e.target.id == "plusButton"){
        $("#increase-error").show();
    }
    else{
        //else hide error
        $("#increase-error").hide();
        $("#decrease-error").hide();

        //setting the value that has to be added with width of progress bar
        if(e.target.id == "minusButton") {
            additionValue = -10;
        }
        else {
            additionValue = 10;
        }

        //changing progress bar value in UI
        pBarWidth = pBarWidth + additionValue;
        pBarWidth = pBarWidth + "%";
        $("#pBar").css("width", pBarWidth);
        $("#pBar").text(pBarWidth);
    }
}
        
$(()=>{
    //setting progress bar to 0%
    $("#pBar").css("width", "0%");

    //hide errors
    $("#increase-error").hide();
    $("#decrease-error").hide();
    
    //setting listener for buttons
    $("#plusButton").click(
        (e)=>{
            buttonControl(e);
        }
    );

    $("#minusButton").click(
        (e)=>{
            buttonControl(e);
        }
    );
});