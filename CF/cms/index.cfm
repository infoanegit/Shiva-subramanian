<!DOCTYPE html>
<html>
	<head>
		<title>
            session login
        </title>
		<meta name = "author" content = "ssubramanian@infoane.com" />
		<meta name = "viewport" content = "width = device-width, initial-scale = 1">
		<link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
		<link rel = "icon" href = "../assignment-logo.jpg" type = "image/x-icon" />
		<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		<script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
		<link rel = "stylesheet" href = "./assets/css/index.css" />
	</head>
	<body>
        <form class = "container" name = "loginForm" method = "post">
            <div class = "row d-flex justify-content-center align-items-center " >
                <div class = "col-12 col-md-8 col-lg-6 col-xl-5 mt-3">
                    <div class = "card bg-dark text-white shadow" style = "border-radius: 1rem;">
                        <div class = "card-body p-5 text-center">
                            <h2 class = "fw-bold mb-2 text-uppercase">
                                Login
                            </h2>
                            <p class = "text-white-50 mb-5">
                                Please enter your username and password!
                            </p>      
                            <div class = "form-floating  mb-3">
                                <input type = "text" id = "userNameId" name = "userName" class = "form-control form-control-lg" placeholder = "Enter User Name"/>
                                <label for = "userNameId" class="text-dark" style="background-color:none;">
                                    User Name
                                </label>
                            </div>
                            <div class = "form-floating  mb-3">
                                <input type = "password" id = "passwordId" name = "password" class = "form-control form-control-lg" placeholder = "Enter Password"/>
                                <label for = "passwordId" class = "text-dark">
                                    Password
                                </label>
                            </div>
                            <div class = "form-floating mb-3">
                                <select class = "form-select form-select-lg" name = "role" id = "roleId" style="font-size:15px;">
                                    <option value = "user" >
                                        User
                                    </option>
                                    <option value = "admin">
                                        Admin
                                    </option>
                                    <option value = "editor">
                                        Editor
                                    </option>
                                </select>
                                <label for = "roleId">
                                    Select one option
                                </label>
                            </div>                     
                            <!--- <cfif structKeyExists(form,"loginBtn")> --->
                            <cfif cgi.request_method IS "post">  
                                <cfset checkLogin = application.userObj.getData(username = form.userName, password = form.password, role = form.role)>
                                <cfif checkLogin.recordcount>
                                    <cfset session.username = checkLogin.username />
                                    <cfset session.role = checkLogin.role />
                                    <cflocation url = "table.cfm" addToken = "false"  statusCode = "301" />
                                <cfelse>
                                    <div class = "mt-2">
                                        <h5 class = "text-danger" id = "inval">
                                            INVALID LOGIN CREDENTIALS
                                        </h5>
                                    </div>
                                </cfif>
                            </cfif>        
                            <button name = "loginBtn" class = "btn btn-outline-light btn-lg" type = "submit">
                                Login
                            </button>
                        </div>
                    <div>
                </div>
            </div>
        </form>
	</body>
</html>