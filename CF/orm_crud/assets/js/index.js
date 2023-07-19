$(
    function(){
        $("form").submit(
            function(){
                $.ajax(
                    {
                        url: "login.cfc",
                        type: 'post',
                        dataType: "html",
                        data: {
                            method: "check",
                            userName: $("#userNameId").val(),
                            password: $("#passwordId").val()
                        },
                        success: function(data) {
                            if(data.indexOf("true") == -1){
                                $("#invalidMessageId").show();
                            }
                            else{
                                window.location.href = "table.cfm";
                            }
                        }
                    }
                );
                return false;
            }
        );
    }
);