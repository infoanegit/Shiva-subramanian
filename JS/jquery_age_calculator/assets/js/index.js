function getAge(currentDate, dob) {
    var age = {};
    var yearDiff = currentDate.getFullYear() - dob.getFullYear();
    var monthDiff = currentDate.getMonth() - dob.getMonth();
    var dayDiff = currentDate.getDate() - dob.getDate();
  
    if (monthDiff < 0 || (monthDiff === 0 && dayDiff < 0)) {
        yearDiff--;
        monthDiff += 12;
    }
  
    if (dayDiff < 0) {
        var lastMonthDate = new Date(
            currentDate.getFullYear(),
            currentDate.getMonth() - 1,
            0
        );
        dayDiff = lastMonthDate.getDate() - dob.getDate() + currentDate.getDate();
        monthDiff--;
    }
  
    age.years = yearDiff;
    age.months = monthDiff;
    age.days = dayDiff;
    return age;
}
      
$(()=>{
    $("form").submit(()=>{
        var currentDate = new Date();
        var dob = new Date($("input[type=date]").val());
        var age = getAge(currentDate, dob);
        $("#error-message").hide();

        //validation      
        if(dob > currentDate){
            $("#new-date").text("");
            $("#error-message").show();
        }
        else{
            newDateString = " Day:" + age.days + "  Month:" + age.months + "  Year:" + age.years; 

            //display the date in UI
            $("#new-date").text(newDateString);
        }  
        return false;
    });
});