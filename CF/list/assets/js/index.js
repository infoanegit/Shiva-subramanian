function showError(content){
	$("#error").addClass("show");
	$("#error-text").text(content);
}

$(()=>{

	$("form").submit(()=>{
		var result = true;
		if ($("#listOfNumbers").val() == "") {
			result = false;
			showError("textbox is empty");
		}
		else {
			$("#listOfNumbers").val().split(",").forEach((elem) => {
				if (isNaN(elem)) {
					result = false;
					showError("not a number");
					
				}
			});
		}
		return result;
	});

	$("#error > button").click(()=>{
		location.replace("./index.cfm");
	})
});