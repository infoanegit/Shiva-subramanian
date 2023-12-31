<!DOCTYPE html>
<html>
	<head>
		<title>session login</title>
		<meta name = "viewport" content = "width = device-width, initial-scale = 1">
		<link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
		<link rel = "icon" href = "../assignment-logo.jpg" type = "image/x-icon" />
		<link rel = "stylesheet" href = "./assets/css/index.css" />
		<script src = "https://code.jquery.com/jquery-1.11.3.min.js"></script>
		<script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
		<form class = "container" name = "loginForm" method = "post">
			<div class = "row d-flex justify-content-center align-items-center" >
				<div class = "col-5 mt-3">
					<div class = "card bg-dark text-white" style = "border-radius: 1rem;">
						<div class = "card-body p-5 text-center">
							<div class = " mt-md-4 pb-5">      
								<h2 class = "fw-bold mb-2 text-uppercase">
									Login
								</h2>
								<p class = "text-white-50 mb-5">
									Please enter your username and password!
								</p>      
								<div class = "form-outline form-white mb-3">
									<input type = "text" id = "userNameId" name = "userName" class = "form-control form-control-lg" placeholder = "Enter User Name" required = "required" />
									</div>
									<div class = "form-outline form-white mb-3">
									<input type = "password" id = "passwordId" name = "password" class = "form-control form-control-lg" placeholder = "Enter Password" required = "required" />
								</div>
								<!--- 
									if username & password exists then redirect to welcome page 
									else display an error message
								--->
								<cfif structKeyExists(form,"loginBtn")>
									<cfset checkLogin = application.userObj.getData(username = form.userName, password = form.password)>
									<cfif checkLogin.recordcount>
										<cfset session.username = checkLogin.username />
										<cflocation url = "./welcome/" addToken = "false">
									<cfelse>
										<div class = "mt-2">
											<h5 class = "text-danger" id = "inval">
												INVALID LOGIN CREDENTIALS
											</h5>
										</div>
									</cfif>
								</cfif>
					
								<button name = "loginBtn" class = "btn btn-outline-primary btn-lg" type = "submit">
									Login
								</button>
							</div>
							<p>
								Don't have an account? 
								<a href = "./signup/" class = "text-white-50 fw-bold">
									Sign Up
								</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>