$(() => {
  prevElem = null;

  function swapColors() {
    //swap color attribute
    temp = $(prevElem).attr("color");
    $(prevElem).attr("color", $(elem).attr("color"));
    $(elem).attr("color", temp);

    //swap bootstrap classes using color attribute 
    $(elem).toggleClass( $(prevElem).attr("color") + " " + $(elem).attr("color") );
    $(prevElem).toggleClass( $(elem).attr("color") + " " + $(prevElem).attr("color") );
  }

  //setting listener
  $("div").click((e) => {
    elem = e.target;
    if (prevElem != null) {
      if ($(prevElem).attr("color") != $(elem).attr("color")) {
        swapColors();
        e.stopPropagation();
        prevElem = null;
      }
    } else {
      prevElem = e.target;
    }
  });
});