$(() => {
    var prevElem = null;

    function swapColors(elem) {
        //swap color attribute
        var temp = $(prevElem).attr("color");
        $(prevElem).attr("color", $(elem).attr("color"));
        $(elem).attr("color", temp);

        //swap bootstrap classes using color attribute 
        $(elem).toggleClass( $(prevElem).attr("color") + " " + $(elem).attr("color") );
        $(prevElem).toggleClass( $(elem).attr("color") + " " + $(prevElem).attr("color") );
    }

    //setting listener
    $("div").click((e) => {
        var elem = e.target;
        if (prevElem != null) {
            if ($(prevElem).attr("color") != $(elem).attr("color")) {
                swapColors(elem);
                e.stopPropagation();
                prevElem = null;
            }
        } else {
            prevElem = e.target;
        }
    });
});