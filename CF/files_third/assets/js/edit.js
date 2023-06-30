function showError(content){
	//creating bootstrap error alert element
	errorElem = $('<div></div>').addClass('alert alert-danger alert-dismissible  show shadow fs-6');
	button = $('<button></button>').addClass('btn-close');
	button.attr('data-bs-dismiss', 'alert');
	button.attr('type', 'button');

	//adding error content
	errorElem.append(button, $('<strong></strong>').text('Warning! '), content);

	//showing error alert in ui
	$('#error').addClass('show');
	$('#error').html(errorElem);
}

$(()=>{
	const requiredFields = [$('#title'), $('#description')];

	$("form").submit(()=>{
		//required field should not be empty
	
		var result = true;
		requiredFields.forEach((e)=>{
            console.log(e.val());
			// ? any other way
			if(e.val() == ""){
				showError("please enter all the required* informations");
				result = false;
				return result;
			}
            else{
                if(!(
                    /^[A-Za-z0-9_-]{0,255}$/.test(requiredFields[0].val()) &&
                    /^[A-Za-z0-9_-]{0,255}$/.test(requiredFields[1].val())
                )){
                    showError("please enter correct information");
                    result = false;
                    return result;
                } 
            }
        });
		
        return result;
    });
});