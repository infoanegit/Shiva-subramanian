function isLeapYear(year) {
    if (year % 400 == 0)
        return true;
    if (year % 100 == 0)
        return false;
    if (year % 4 == 0)
        return true;
    return false;
}

function addValueWithDetermine(){
    if( (pastDate.day() > presentDate.day()) || (pastDate.month() > presentDate.month()) ){
        this.year = -1;
        if(pastDate.month() in [4,6,9,11]){
            this.day = 30
        }
        else if(pastDate.month() == 2){
            if(isLeapYear(presentDate.year())){
                this.day = 29;
            }
            else{
                this.day = 28;
            }
        }
        else{
            this.day = 31;
        }
    }
    else{
        //...
    }
    //for month
    if((pastDate.month() == presentDate.month()) && (pastDate.year() < presentDate.year())){
        this.month = 11
    }
    else if(pastDate.month() > presentDate.month()){
        this.month = 12
    }
}

$(()=>{
    presentDate = { 
        date: new Date(),
        //ERROR *arrow function didn't invoke Date's property function*
        day: function(){ return this.date.getDate(); },
        month: function(){ return this.date.getMonth(); },
        year: function(){ return this.date.getFullYear(); }
    };
    $("input[type=submit]").click(()=>{
        $("#error-message").hide();
  
        addValueWith = {
            day: 0,    
            month: 0,
            year: 0,
            determine : addValueWithDetermine
        };
        pastDate = {
            date: new Date($("input[type=date]").val()),
            day: function(){ return this.date.getDate() },
            month: function(){ return this.date.getMonth()},
            year: function(){ return this.date.getFullYear()}
        }; 
        newDate = {
            day: function(){ return presentDate.day() - pastDate.day() + addValueWith.day },
            month: function(){ return presentDate.month() - pastDate.month() + addValueWith.month },
            year: function(){ return presentDate.year() - pastDate.year() + addValueWith.year }
        };
        //validation
        if(pastDate.date > presentDate.date){
            $("#new-date").text("");
            $("#error-message").show();
        }
        else{
            addValueWith.determine();
            newDateString = " Day:" + newDate.day() + "  Month:" + newDate.month() + "  Year:" + newDate.year() 
            //display the date in UI
            $("#new-date").text(newDateString);
        }

    });
});

/*
https://collegevidya.com/tool/age-calculator/
*/