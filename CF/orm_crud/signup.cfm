<!DOCTYPE html>
<html>
    <head>
        <title>
            Sign Up 
        </title>
        <meta name = "viewport" content = "width = device-width, initial-scale = 1" />
        <link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
        <link rel = "icon" href = "../assignment-logo.jpg" type = "image/x-icon" />
        <link rel = "stylesheet" href = "./assets/css/index.css" />
        <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        <form class = "container" name="signupForm" method = "post">
            <div class = "row d-flex justify-content-center align-items-center">
                <div class = "col-12 col-md-8 col-lg-6 col-xl-5 mt-3">
                    <div class = "card bg-dark text-white shadow" style = "border-radius: 1rem;">
                        <div class = "card-body p-5 text-center">
                            <h2 class = "fw-bold mb-2 text-uppercase">
                                Sign up
                            </h2>
                            <p class = "text-white-50 mb-5">
                                Please enter your Details!
                            </p>
                            <div class = "form-floating  mb-3">
                                <input type = "text" id = "userNameId" name = "userName" class = "form-control form-control-lg" placeholder = "Enter User Name" required/>
                                <label for = "userNameId" class="text-dark" style="background-color:none;">
                                    User Name
                                </label>
                            </div>
                            <div class = "form-floating  mb-3">
                                <input type = "password" id = "passwordId" name = "password" class = "form-control form-control-lg" placeholder = "Enter Password" required/>
                                <label for = "passwordId" class = "text-dark">
                                    Password
                                </label>
                            </div> 
                            
                            <cfif cgi.request_method IS "post">  

                                <!--- get all users with form.username --->
                                <cfset checkuser = application.userObj.checkUsername(username = form.userName) />

                                <!--- 
                                    If username exist, then redirect to index.cfm( login ) page
                                    Else an error message will be shown to the user
                                ---> 
                                <cfif checkuser.recordcount EQ 0>
                                    <!--- insert username and password in DB --->
                                    <cfset application.userObj.insertUser(username = form.userName, password = form.password) />

                                    <!--- redirect to login page --->
                                    <cflocation  url = "./" addToken = "false" />
                                <cfelse>
                                    <div class = "text-danger mx-auto mb-2">
                                        user name already exist!
                                    </div>
                                </cfif>
                            </cfif>

                            <button class = "btn btn-outline-light btn-lg" type = "submit" name = "signupBtn">
                                Sign Up
                            </button>
                        </div>
                        <p class = "text-center">
                            Have an account? 
                            <a href = "./" class = "text-white-50 fw-bold">
                                Log in
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>