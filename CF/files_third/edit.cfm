<!--- if 'url' is empty then the value of 'imgId' is '1' --->
<cfif structIsEmpty(url) NEQ true>
    <cfset imgId  =  url.id>
<cfelse>
    <cfset imgId  =  1>
</cfif>
<!--- <cfdump var = "#imgId#" abort /> --->
<cfset userObj = createObject("component","db") />
<cfset imgQuery = userObj.getData(imgId) />
<cfdump var = "#imgQuery#" abort />

<cfif cgi.request_method IS "post">  
    <cfset userObj = createObject("component","db") />
    <cfset userObj.updateImageData(FORM)>
    <cfset userObj.updateFormData()>

    <!-- finished updation, redirect to table.cfm -->
    <cflocation url = "table.cfm" addToken = "false" statusCode = "301"> 
</cfif>

<!DOCTYPE html>
<html>

    <head>
        <title>
            File Upload and Image Functions
        </title>
        <meta name = "viewport" content = "width = device-width, initial-scale = 1">
        <link rel="icon" href="../assignment-logo.jpg" type="image/x-icon" />
        <link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
        <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src = "./assets/js/edit.js"></script>
    </head>

    <body>
       
        <div class = "container w-50 mt-2">
            <form method = "post" enctype = "multipart/form-data">
                <table class = "table">
                    <thead class = "table-primary ">
                        <tr class  =  "rounded text-center">
                            <th>
                                Field Name
                            </th>
                            <th>
                                Data
                            </th>
                        </tr>
                    </thead>
                    <cfloop query = userObj.img>
                        <cfoutput>
                            <tr class = "d-none">
                                <td>
                                    <b>
                                        id
                                    </b>
                                </td>
                                
                                <td class  =  "d-flex justify-content-center align-content-center">
                                    <input type = "text" class = "form-control w-50" value = "#img.imgId#" name = "imgId" id = "imgId" readonly = "readonly" data-bs-toggle = "tooltip" title = "Read Only!" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>
                                        title*
                                    </b>
                                </td>
                                <td class  =  "d-flex justify-content-center align-content-center">
                                    <input type = "text" class = "form-control w-50" name = "title" id = "title" data-bs-toggle = "tooltip" title = "255 characters only [letters, numbers and underscore]" value = "#img.title#"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>
                                        description*
                                    </b>
                                </td>             
                                <td class  =  "d-flex justify-content-center align-content-center">
                                    <textarea class = "form-control w-50 "  name = "description" id = "description" data-bs-toggle = "tooltip" title = "255 characters only [letters, numbers and underscore]">#img.description#</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>
                                        image
                                    </b>
                                    <br/>
                                    <img src = "assets/images/#img.title#.jpg" width = 100 height = 100 />
                                </td>    
                                <td class  =  "d-flex justify-content-center align-content-center">   
                                    <div class = "d-flex align-content-center justify-content-center my-5 form-group">
                                        <label class = "btn btn-outline-primary form-label" for = "fileUpload">
                                            File Upload
                                        </label>
                                        <input type = "file" class = "btn btn-primary mt-3" style = "display:none;" id = "fileUpload" name = "fileUpload" accept = ".png, .jpg, .jpeg" /> 
                                    </div>
                                </td>
                            </tr>
                        </cfoutput>
                    </cfloop>
                </table>
                <div class = "d-flex justify-content-between w-100 px-2">
                    <button id = "submitButton" type = "submit" class = "btn btn-primary">
                        submit
                    </button>
                    <a  id = "cancelButton" class = "btn btn-outline-secondary" href  =  "table.cfm">
                        cancel
                    </a>
                </div>
            </form>
        <div id = "error" class = "row mt-3 px-3">
    </body>
</html>