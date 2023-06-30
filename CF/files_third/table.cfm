<!DOCTYPE html>
<html>

    <head>
        <title>File Upload and Image Functions</title>
        <meta name = "author" content = "ssubramanian@infoane.com" />
        <meta name = "viewport" content = "width = device-width, maximum-scale = 8, initial-scale = 1">
        <link rel="icon" href="../assignment-logo.jpg" type="image/x-icon" />
        <link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
        <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        <cfquery name = "img" datasource = "ssubramanian_dsn">
            SELECT * FROM img
        </cfquery>

        <div class = "container w-50 mt-2 ">
            <table class = "table table-bordered">
                <thead class = "text-center">
                    <th>
                        ID
                    </th>
                    <th>
                        Description
                    </th>
                    <th >
                        Title
                    </th>
                    <th colspan = "2"></th>

                </thead>
                <cfset tempId = 0>
                <cfif img.recordcount EQ 0>
                 <cfoutput>
                    <tr>
                        <td colspan = "4">
                            <div class = "alert alert-danger alert-dismissible  show shadow fs-6">
                                <strong>No Data!</strong>
                            </div>
                        </td>
                    </tr>
                 </cfoutput>   
                </cfif>
                <cfloop query = "img">
                    <cfoutput>
                        <tr>
                            <td>
                                <cfset tempId  =  tempId + 1>
                                #tempId#
                            </td>
                            <td class = "text-wrap">
                                #img.description#
                            </td>
                            <td class = "text-wrap">
                                <!--- <cfdump var = "#expandPath('assets/images/sfcd.jpg')#" abort /> --->
                                <!--- reszize the image file and write to browser --->
                                <!--- <cfimage action = "read" name = "sourceImage" source = "assets/images/sfcd.jpg"> --->
                               <!---  <cfimage action = "resize" name = "sourceImage" width = "10" height = "10" source = "#expandPath('./assets/images/sfcd.jpg')#"> --->
                                <img src = "assets/images/#img.title#.jpg" width = 10 height = 10 />
                                <!--- <cfimage action = "writeToBrowser" source = "#sourceImage#"> --->
                                <i>#img.title#</i>
                            </td>
                            <td>
                                <!--- redirect to edit data --->
                                <a href = "edit.cfm?id=#img.imgId#">Edit</a>
                            </td>
                            <td>
                                <!--- redirect to delete data --->
                                <button id = "deleteButton" class = "link-danger" style = "border:none; background-color:inherit;" data-bs-toggle = "modal" data-bs-target = "##modalId"><u>Delete</u></button>
                            </td>
                        </tr>
                    </cfoutput>
                </cfloop>
            </table>
            <div class = "d-flex justify-content-center">
                <!--- redirect to main page for adding new data --->
                <a class = "px-5 btn btn-primary" href = "index.cfm">
                    <b style = "letter-spacing:2px">ADD</b>
                </a>
            </div>
            <div class = "modal fade" id = "modalId">
                <div class = "modal-dialog">
                    <div class = "modal-content">
                        <div class = "modal-body">
                                <b>Delete Confirmation!</b>
                                <button style = "float:right;" type = "button" class = "btn-close" data-bs-dismiss = "modal"></button>
                        </div>

                        <div class = "modal-footer">
                            <cfoutput>
                                <a id = "anchorDelete" class = "btn btn-danger text-white" href = "delete.cfm?id=#img.imgId#">Delete</a> 
                            </cfoutput>
                        </div>
                    </div>
                </div>
            </div>
        </div>       
    </body>
</html>