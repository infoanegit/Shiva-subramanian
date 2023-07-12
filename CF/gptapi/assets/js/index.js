$(
    function(){
        $("form").submit(
            
            function(){
                var userText = `<div class = "" >
                <div class = "d-flex flex-row" style = "margin-left:25%" >
                    <div class = "text-light">
                        <p class = "bg-danger text-center" style = "width:90px;">
                        <span class = "fs-5">👤</span>  USER
                        </p>
                    </div>
                    <div class = "p-2">
                        <pre>
${$("#userQueryId").val()}
                        </pre>
                    </div>
                </div>
            </div>`;

                $("#content").append(userText);
                $(".spinner-border").show();

                $.post(
                    "data.cfm", 

                    {userQuery:$("#userQueryId").val()},
                    
                    function (data) {
                        $("#content").append(data);
                        $(".spinner-border").hide();
                    },

                );

                //form is not allowed to be submitted
                return false;
            }
        );
    }
);