<!DOCTYPE html>
<html>
    <head>
        <title>table</title>
 		<meta name = "viewport" content = "width = device-width, initial-scale = 1">
		<link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
		<link rel = "icon" href = "../assignment-logo.jpg" type = "image/x-icon" />
        <link rel = "stylesheet" href = "./assets/css/index.css" />
		<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		<script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
		<script src = "./assets/js/table.js"></script>
    </head>
    <body>
        <div class = "container w-50 mt-5 ">
            <cfoutput>
               User Role : #session.role#
            </cfoutput>
           <table class = "table table-borderless ">
                <thead class = "table-dark">
                    <th>Page Name</th>
                    <th colspan = "3">Page Description</th>
                    
                </thead>
                <tbody class = "table-light">
                    <cfset tableData = application.userObj.retrieveData() />
                    <cfloop query = "tableData">
                        <cfoutput>
                            <tr>
                                <td>#tableData.pageName#</td>
                                <td>#tableData.pageDesc#</td>
                                <td>
                                    <button onclick = "editRow(this, '#tableData.pageName#', '#tableData.pageDesc#')" id = "editButtonId" class = "btn btn-success" 
                                    <cfif session.role NEQ "admin" AND session.role NEQ "editor">
                                        hidden
                                    </cfif>
                                    >Edit</button>
                                </td>
                                <td>
                                    <a class = "btn btn-danger" 
                                    <cfif session.role NEQ "admin" AND session.role NEQ "editor">
                                        hidden
                                    </cfif>
                                    >Delete</a>
                                </td>
                            </tr>
                        </cfoutput>
                    </cfloop>
                    <cfif session.role EQ "admin" OR session.role EQ "editor">
                        <tr>
                            <td colspan="4">
                                <a onclick = "addRow(this)" class = "btn btn-primary">Add New</a>
                            </td>
                        </tr>
                    </cfif>
                </tbody>
           </table>
        </div>
    </body>
</html>