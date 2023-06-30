<cfif structKeyExists(URL,"failed") >
    <cfif URL.failed EQ 0>
        <div style = "width:35%" class = "sticky-top mx-auto alert alert-success alert-dismissible">
            
            <!--- onclick button redirect it to current page with url query removed --->
            <button onclick = window.location="./" type = "button" class = "btn-close" data-bs-dismiss = "alert"></button>
            <strong>Success!</strong> Email has been Delivered.
        </div>
    </cfif>
</cfif>

<cfif cgi.REQUEST_METHOD EQ "post">
    <cfset fileDestination = #expandPath('#FORM.birthdayBabyName#.jpg')# />
    <cffile action="rename" source = "#FORM.FILEUPLOAD#" destination = "#fileDestination#" />
    <cfmail from = "ssubramanian@infoane.com" to = "#FORM.email#" subject = "BIRTHDAY WISH to #FORM.birthdayBabyName#" server = "smtp.example.com" >
        <cfmailparam file = "#fileDestination#" />
        #FORM.birthdayWish# <br />
        <cfimage action = "writeToBrowser" source = "#fileDestination#" width = "100" height = "100 "/>
    </cfmail> 
    <cflocation url = "index.cfm?failed=0" addToken = "false" statusCode = "301" />
</cfif>

<!DOCTYPE html>
<html>

    <head>
        <title>Email</title>
        <meta name = "author" content = "ssubramanian@infoane.com" />
        <meta name = "viewport" content = "width = device-width, initial-scale = 1" />
        <link rel="icon" href="../assignment-logo.jpg" type="image/x-icon" />
        <link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        <form class = "container" enctype = "multipart/form-data" name = "loginForm" method = "post">
            <div class = "row d-flex justify-content-center align-items-center" >
                <div class = "col-12 col-md-8 col-lg-6 col-xl-5 mt-3">
                    <div class = "card shadow bg-danger text-white" style = "border-radius: 1rem;">
                        <div class = "card-body p-5 text-center">
                            <h2 class = "fw-bold mb-2 text-uppercase">Email</h2>
                            <p class = "text-white-50 mb-3">Please enter the details!</p>      
                            <div class = "form-outline form-white mb-3">
                                <input type = "text" id = "birthDayBabyNameId" name = "birthDayBabyName" class = "form-control form-control-lg" placeholder = "Birthday Baby Name" required="required"/>
                            </div>
                            <div class = "form-outline form-white mb-3">
                                <input type = "email" id = "emailId" name = "email" class = "form-control form-control-lg" placeholder = "Email ID" required="required"/>
                            </div>
                            <div class = "form-outline form-white mb-3">
                                <textarea name = "birthdayWish" id = "birthDayWishId" class = "form-control form-control-lg" placeholder = "Birthday Wish"  required="required"></textarea>
                            </div>
                            <div class = "form-outline form-white mb-3">
                                <input type = "file" class = "form-control form-control-lg"  id = "fileUpload" name = "fileUpload" accept = ".png, .jpg, .jpeg"  required="required"/> 
                            </div>                                    
                            <button name = "sendBtn" class = "btn btn-outline-light btn-lg" type = "submit">SEND</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>

</html>