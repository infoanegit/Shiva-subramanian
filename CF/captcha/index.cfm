<cfset done_with_captcha = "yes" />
<cfset done_with_email = "yes" />
<cfif cgi.REQUEST_METHOD EQ "post">
    <cfif FORM.captcha NEQ session.captchaWord OR isdefined("FORM.captcha") NEQ true>
        <cfset done_with_captcha = "no" />
    </cfif>
    <cfif isValid("email", FORM.email) NEQ "YES" OR isdefined("FORM.email") NEQ "YES">
        <cfset done_with_email = "no" />
    </cfif>
</cfif>
<cfset session.captchaWord = application.captcha.randomize() />

<!DOCTYPE html>
<html>
    <head>
        <title>Captcha Validation</title>
        <meta name = "viewport" content = "width = device-width, initial-scale = 1" />
        <link rel="icon" href="../assignment-logo.jpg" type="image/x-icon" />
        <link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <link rel = "stylesheet" href = "./assets/css/index.css" />
    </head>
    <body>
        <div class="vh-100 bg-image" >
            <div class="mask d-flex align-items-center pt-5">
                <div class="container">
                    <div class="row d-flex justify-content-center align-items-center">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="card shadow">
                                <div class="card-body p-5">
                                    <h2 class="text-uppercase text-center mb-5">Captcha Validation</h2>
                                    <form method="post">
                                        <div class="form-floating">
                                            <input class="form-control" name="email" id="emailID" placeholder="name@example.com">
                                            <label for="emailID">Email address</label>
                                        </div>

                                        <!--- error message --->
                                        <cfif done_with_email EQ "no">
                                            <p class="text-danger">Wrong Email</p>
                                        </cfif>

                                        <div class = "mt-3">
                                            <cfimage action="captcha" width="100" height="50" text="#session.captchaWord#" difficulty="low" fontSize="18">
                                        </div>
                                        <div class="form-floating mt-3">
                                            <input type="text" class="form-control" name="captcha" id="captchaID" placeholder="captcha">
                                            <label for="captchaID">Captcha</label>
                                        </div>
 
                                        <!--- error message --->
                                        <cfif done_with_captcha EQ "no">
                                            <p class="text-danger"> 
                                                Wrong Captcha 
                                            </p>
                                        </cfif>
    
                                        <button type="submit" class="btn btn-primary mt-3">Submit</button>
                                    </form>
                                    
                                    <!--- success message --->
                                    <cfif structkeyexists(FORM, "captcha") AND structkeyexists(FORM, "email") >
                                        <cfif done_with_email EQ "yes" AND done_with_captcha EQ "yes" >
                                            <div class="alert alert-success alert-dismissible mt-3">
                                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                                <strong> Successfully Subscribed! </strong>
                                            </div>
                                        </cfif>
                                    </cfif>                                
                              <!---  <cfquery name="credTbl" datasource = "ssubramanian_dsn" timeout="0">
                                SELECT * FROM img
                            </cfquery> 
                            <cfdump var = "#credTbl#" />--->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>