<!DOCTYPE html>
<html>
  <head>
      <meta name = "author" content = "ssubramanian@infoane.com" />
      <meta name = "viewport" content = "width = device-width, maximum-scale = 8, initial-scale = 1" />
      <link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
      <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
      <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
      <style>
          .gradient-custom {
              background: linear-gradient(to right, rgba(106, 17, 203, 1), rgba(37, 117, 252, 1))
          }
      </style>
  </head>

  <body>
    <div class = "vh-100 gradient-custom">
      <form class = "container " method = "post">
        <div class = "row d-flex justify-content-center align-items-center">
          <div class = "col-12 col-md-8 col-lg-6 col-xl-5 mt-3">
            <div class = "card bg-dark text-white" style = "border-radius: 1rem;">
              <div class = "card-body p-5 text-center">
                <div class = "mt-md-4 pb-5">
                  <h2 class = "fw-bold mb-2 text-uppercase">Sign up</h2>
                  <p class = "text-white-50 mb-5">Please enter your Details!</p>
                  <div class = "mb-3">
                    <input type = "text" id = "userNameId" name = "userName" class = "form-control form-control-lg" placeholder = "Enter User Name"  required = "required"/>
                  </div>
                  <div class = "mb-3">
                    <input type = "password" id = "passwordId" name = "password" class = "form-control form-control-lg" placeholder = "Enter Password" required = "required"/>
                  </div>
                  
                  <cfif structKeyExists(form,"signupBtn")>
                    <cfset checkuser = application.userObj.checkUsername(username = form.userName) / >
                    <cfif checkuser.recordcount == 0>
                      <cfset application.userObj.insertData(username = form.userName, password = form.password) />
                      <cflocation  url = "../login/" addToken = "false" />
                    <cfelse>
                      <div class = "text-danger mx-auto mb-2">user name already exist!</div>
                    </cfif>
                  </cfif>

                  <!---<div class = "form-outline form-white mb-3">
                    <input type = "password" id = "typePasswordX" class = "form-control form-control-lg" placeholder = "Enter Mobile Number" required = "required"/>
                  </div>--->
                  <button class = "btn btn-outline-primary btn-lg" type = "submit" name = "signupBtn">Sign Up</button>
                </div>
                <div>
                  <p>Have an account? <a href = "../login/" class = "text-white-50 fw-bold">Log in</a>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
  </body>
</html>