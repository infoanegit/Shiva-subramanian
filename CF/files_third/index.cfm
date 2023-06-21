<cfif cgi.request_method IS "post">  
    <cfoutput>here from post</cfoutput>
    <cfset fileDestination = #expandPath('./assets/images/#FORM.TITLE#.jpg')#>
    <cffile action="rename" source="#FORM.FILEUPLOAD#" destination="#fileDestination#" >
    <cfquery name="img" datasource="ssubramanian">
        INSERT INTO img VALUES(
            <cfqueryparam value='#FORM.TITLE#' cfsqltype="cf_sql_varchar">, 
            <cfqueryparam value='#FORM.DESCRIPTION#' cfsqltype="cf_sql_varchar">, 
            <cfqueryparam value='#fileDestination#' cfsqltype="cf_sql_longvarchar">
            )
    </cfquery>
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
    </head>

    <body>
        <div class="container w-50">
            <div class="mb-5 fs-2 fw-bolder d-flex align-content-center justify-content-center">
                File Upload and Image Functions
            </div>
            <form method="post" enctype="multipart/form-data" class="form-body p-2 px-4 rounded " style="background-color:#ADD8E6">
                <div class="row">
                    <div class="col form-group my-3">
                        <label for="title" class="form-label">Title*</label>
                        <input type="text" class="form-control" name="title" id="title" data-bs-toggle="tooltip" title="255 characters only [letters, numbers and underscore]" />
                    </div>
                </div>
                <div class="row">
                    <div class="col form-group mb-3">
                        <label for="description" class="form-label">Description*</label>
                        <textarea class="form-control" name="description" id="description" rows="3" data-bs-toggle="tooltip" title="255 characters only [letters, numbers and underscore]"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col form-group mb-3">
                        <label for="fileUpload" class=" form-label">Image ( .jpeg, .png )*</label>
                        <input type="file" class="form-control"  id="fileUpload" name="fileUpload" accept=".png, .jpg, .jpeg" /> 
                    </div>
                </div>
                <div class="row">
                    <div class="col form-group mb-3">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
                <div id="error" class="row">

                </div>
            </form>
        </div>
 <!---       <cfif isdefined(form.title) AND isdefined(form.description) AND isdefined(form.fileupload)>
            <cfif form.title NEQ "" AND form.DESCRIPTION NEQ "" AND form.FILEUPLOAD NEQ "">
                <cfdump  var="#form#">
            </cfif>
        </cfif> --->

        <div class="container w-50 mt-3 d-flex justify-content-end">
            <a href="table.cfm" class="">show table</a>
        </div>

    </body>
    <script src="./assets/js/index.js"></script>

</html>