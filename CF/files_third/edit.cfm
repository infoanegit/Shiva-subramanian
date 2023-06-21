<!--- common column names --->
<cfset columnNamesArray = ['imgId', 'title', 'description']>

<cffunction  name="updateFormData">
    <cfloop index="index" from="2" to="#arrayLen(columnNamesArray)#">

        <!-- Form Field should not be equal to empty -->
        <cfif FORM[columnNamesArray[index]] NEQ "">

            <!-- For updation, Respective Form field value should not be equal to Query column value -->
            <cfif FORM[columnNamesArray[index]] NEQ img[columnNamesArray[index]][1]>
                
                <cfquery name="imgTableUpdate" datasource="ssubramanian">
                    UPDATE img SET #columnNamesArray[index]# = <cfqueryparam value='#FORM[columnNamesArray[index]]#' cfsqltype="cf_sql_varchar"> WHERE imgId = <cfqueryparam value='#FORM['imgId']#' cfsqltype="cf_sql_integer"> 
                </cfquery>

            </cfif>
            
            </cfif>    
    </cfloop>
</cffunction>

<cffunction name="updateImageData">
    <cfif FORM.fileupload NEQ "">
        <cfif FORM.fileupload NEQ img.fileupload>
            
            <!--- if FORM.title field is empty then the title taken from the query --->
            <cfif FORM.title EQ "">
                <cfset newfilepath = img.fileupload>
            <cfelse>
                <!--- we have to rename the file by using FORM.title --->
                <cfset newfilepath = expandPath('./assets/images/#FORM.title#.jpg')>
            </cfif>    

            <!--- rename the file and put that in the current folder --->
            <cffile action="rename" source="#FORM.FILEUPLOAD#" destination="#newfilepath#" >
            
            <!--- update the file path in img table --->
            <cfquery name="imgUpdate" datasource="ssubramanian">
                UPDATE img SET fileupload = <cfqueryparam value='#newfilepath#' cfsqltype="cf_sql_longvarchar"> WHERE imgId = <cfqueryparam value='#FORM['imgId']#' cfsqltype="cf_sql_integer"> 
            </cfquery>                    
        </cfif>
    </cfif>
</cffunction>


<!--- if 'url' is empty then the value of 'imgId' is '1' --->
<cfif structIsEmpty(url) NEQ true>
    <cfset imgId = url.id>
<cfelse>
    <cfset imgId = 1>
</cfif>

<cfquery name="img" datasource="ssubramanian">
    SELECT * FROM img WHERE imgId = <cfqueryparam value="#imgId#" cfsqltype="cf_sql_integer">
</cfquery>

<cfif cgi.request_method IS "post">  
    <cfset updateImageData()>
    <cfset updateFormData()>

    <!-- finished updation, redirect to table.cfm -->
    <cflocation url="table.cfm" addToken="false" statusCode="301"> 
</cfif>



<!DOCTYPE html>
<html>

    <head>
        <title>File Upload and Image Functions</title>
        <meta name="author" content="ssubramanian@infoane.com" />
        <meta name="viewport" content="width=device-width, maximum-scale=8, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="./assets/js/edit.js"></script>
    </head>

    <body>
       
        <div class="container w-50 mt-2">
            <form method="post" enctype="multipart/form-data">
                    <table class="table">
                        <thead class="table-primary ">
                            <tr class = "rounded text-center">
                                <th>
                                    Field Name
                                </th>
                                <th>
                                    Data
                                </th>
                            </tr>
                        </thead>
                        <cfloop query="img">
                            <cfoutput>
                                <tr class="d-none">
                                    <td>
                                        <b>id</b>
                                    </td>
                                    
                                    <td class = "d-flex justify-content-center align-content-center">
                                        <input type="text" class="form-control w-50" value="#img.imgId#" name="imgId" id="imgId" readonly="readonly" data-bs-toggle="tooltip" title="Read Only!" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <b>title*</b>
                                    </td>
                                    <td class = "d-flex justify-content-center align-content-center">
                                        <input type="text" class="form-control w-50" name="title" id="title" data-bs-toggle="tooltip" title="255 characters only [letters, numbers and underscore]" value="#img.title#"/>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                        <b>description*</b>
                                    </td>
                                    
                                    <td class = "d-flex justify-content-center align-content-center">
                                        <textarea class="form-control w-50 "  name="description" id="description" data-bs-toggle="tooltip" title="255 characters only [letters, numbers and underscore]">#img.description#</textarea>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                        <b>image</b><br/>
                                        <cfimage action="read" name="sourceImage" source="#img.fileupload#">
                                        <cfimage action="resize" name="sourceImage" width="100" height="100" source="#sourceImage#">
                                        <cfimage action="writeToBrowser" source="#sourceImage#">
                                    </td>    
                                    <td class = "d-flex justify-content-center align-content-center">   
                                        <div class="d-flex align-content-center justify-content-center my-5 form-group">
                                            <label class="btn btn-outline-primary form-label" for="fileUpload">File Upload</label>
                                            <input type="file" class="btn btn-primary mt-3" style="display:none;" id="fileUpload" name="fileUpload" accept=".png, .jpg, .jpeg" /> 
                                        </div>
                                    </td>
                                </tr>
                            </cfoutput>
                        </cfloop>
                    </table>
                    <div class="d-flex justify-content-between w-100 px-2">
                        <button id="submitButton" type="submit" class="btn btn-primary">submit</button>
                        <a  id="cancelButton" class="btn btn-outline-secondary" href = "table.cfm">
                            cancel
                        </a>
                    </div>
            </form>
             
         <div id="error" class="row mt-3 px-3">
                
         </div>
         </div>
    </body>
</html>