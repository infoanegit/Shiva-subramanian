<cfif structKeyExists(URL, "id")>
    <cfset application.userObj.deleteData(URL.id) />
    <cflocation url = "./table.cfm" addtoken="false" statusCode="301" />
</cfif>
<cfif cgi.request_method IS "post">  
    <cfif structKeyExists(FORM, "logOutBtn")>
        <cfset structClear(session) />
        <cflocation url = "./" addtoken="false" statusCode="301" />
    <cfelseif structKeyExists(FORM, "submitBtn")>
        <cfset application.userObj.updateData(FORM.pageId, FORM.pageName, FORM.pageDesc) />
        <cflocation url = "./table.cfm" addtoken="false" statusCode="301" />
    <cfelseif structKeyExists(FORM, "signUpBtn")>
        <cflocation url = "./signup.cfm" addtoken="false" statusCode="301" />
    <cfelseif structKeyExists(FORM, "insertDataBtn")>
        <cfset application.userObj.insertData(FORM.pageName, FORM.pageDesc) />
        <cflocation url = "./table.cfm" addtoken="false" statusCode="301" />
    </cfif>
</cfif>

<!DOCTYPE html>
<html>
    <head>
        <title>
            Table
        </title>
        <meta charset = "UTF-8" />
 		<meta name = "viewport" content = "width = device-width, initial-scale = 1" />
		<link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
		<link rel = "icon" href = "../assignment-logo.jpg" type = "image/x-icon" />
        <link rel = "stylesheet" href = "./assets/css/index.css" />
		<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		<script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src = "./assets/js/table.js"></script>
    </head>
    <body>
        <div class = "container w-50 mt-5 ">
            <div class = "d-flex justify-content-end mb-2">
                <form method = "post">
                    <button class = "btn btn-primary me-2" type = "submit" name = "signUpBtn">
                        Sign Up
                    </button>
                    <button class = "btn btn-danger" type = "submit" name = "logOutBtn">
                        Log Out
                    </button>
                </form>
            </div>
           <table class = "table table-borderless ">
                <thead class = "table-dark">
                    <th>
                        Page Name
                    </th>
                    <th colspan = "3">
                        Page Description
                    </th>   
                </thead>
                <tbody class = "table-light">
                    <cfset tableData = application.userObj.retrieveData() />
                    <cfloop query = "tableData">
                        <cfoutput>
                            <tr>
                                <td>
                                    #tableData.pageName#
                                </td>
                                <td>
                                    #tableData.pageDesc#
                                </td>
                                <td>
                                    <cfif session.role EQ "editor" OR session.role EQ "admin">
                                        <button name = "edit" id = "editButtonId" class = "btn btn-success" data-bs-toggle="modal" data-bs-target="##myModal" >
                                            Edit
                                        </button>

                                         <!-- The Modal -->
                                         <div class="modal fade" id="myModal">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">
                                                            Edit Data
                                                        </h4>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form method = "post">
                                                            <input type = "text" value = "#tableData.pageId#" name = "pageId" hidden />
                                                            <div class = "form-floating  mb-3">
                                                                <input type = "text" value = "#tableData.pageName#" id = "pageNameId" name = "pageName" class = "form-control" placeholder = "Enter User Name"/>
                                                                <label for = "pageNameId" class="text-dark" style="background-color:none;">
                                                                    Page Name
                                                                </label>
                                                            </div>
                                                            <div class = "form-floating  mb-3">
                                                                <input type = "text" value = "#tableData.pageDesc#" id = "pageDescId" name = "pageDesc" class = "form-control" placeholder = "Enter User Name"/>
                                                                <label for = "pageDescId" class="text-dark" style="background-color:none;">
                                                                    Page Description
                                                                </label>
                                                            </div>
                                                            <div class = "form-floating text-center mb-3">
                                                                <button type = "submit" name = "submitBtn" class = "btn btn-primary">
                                                                    update
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </cfif>
                                </td>
                                <td>
                                    <cfif session.role EQ "admin">
                                        <a href = "./table.cfm?id=#tableData.pageId#" name = "delete" class = "btn btn-danger" >
                                            Delete
                                        </a>
                                    </cfif>     
                                </td>
                            </tr>
                        </cfoutput>
                    </cfloop>
                    <cfif session.role EQ "admin" OR session.role EQ "editor">
                        <tr>
                            <form method = "post" >
                                <tr>
                                    <td>
                                        <input class = "me-4" name = "pageName" id = "pageNameId" type = "text" required />
                                    </td>
                                    <td>
                                        <input class = "me-4" name = "pageDesc" id = "pageDescId" type = "text" required />
                                    </td>
                                    <td colspan="4">
                                        <button type = "submit" name = "insertDataBtn" id = "editButtonId" class = " w-100 btn btn-success me-5" >
                                            Insert
                                        </button>
                                    </td>
                                </tr>
                            </form>
                        </tr>
                    </cfif>
                </tbody>
           </table>
        </div>
    </body>
</html>