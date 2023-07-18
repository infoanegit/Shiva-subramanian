<cfif cgi.request_method IS "post">  
    <cfset userObj = createObject("component","db") />
    <cffile action = "upload" fileField = "FORM.FILEUPLOAD" destination = "#expandPath('./assets/images/')#" result = "imgFile" nameconflict="overwrite" />
    <cfset userObj.insertFormData(FORM, imgFile) />
    <cflocation url = "table.cfm" addToken = "false" />
</cfif> 

<!DOCTYPE html>
<html>
    <head>
        <title>File Upload and Image Functions</title>
        <meta name = "viewport" content = "width = device-width, maximum-scale = 8, initial-scale = 1">
        <link rel="icon" href="../assignment-logo.jpg" type="image/x-icon" />
        <link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
        <link rel = "stylesheet" href = "./assets/css/index.css" />
        <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src = "https://code.jquery.com/jquery-3.7.0.min.js"></script>
    </head>

    <body class = "indexbg">
        <div class = "container w-50">
            <div class = " shadow rounded bg-light mb-3 py-2 fs-2 fw-bolder d-flex align-content-center justify-content-center">
                File Upload and Image Functions
            </div>
            <form method = "post" enctype = "multipart/form-data" class = "card shadow form-body p-2 px-4 rounded border border-none " style = "background-color:#ADD8E6">
                <div class = "row">
                    <div class = "col form-group mt-3">
                        <label for = "title" class = "form-label">Title*</label>
                        <input type = "text" class = "form-control" name = "title" id = "title" data-bs-toggle = "tooltip" title = "255 characters only [letters, numbers and underscore]" autofocus/>
                    </div>
                </div>
                <div class = "row">
                    <div class = "col form-group mb-3">
                        <label for = "description" class = "form-label">Description*</label>
                        <textarea class = "form-control" name = "description" id = "description" rows = "3" data-bs-toggle = "tooltip" title = "255 characters only [letters, numbers and underscore]" ></textarea>
                    </div>
                </div>
                <div class = "row">
                    <div class = "col form-group mb-3">
                        <label for = "fileUpload" class = " form-label">Image ( .jpeg, .png )*</label>
                        <input type = "file" class = "form-control"  id = "fileUpload" name = "fileUpload" accept = ".png, .jpg, .jpeg" /> 
                    </div>
                </div>
                <div class = "row">
                    <div class = "col form-group mb-3">
                        <button type = "submit" class = "btn btn-primary">Submit</button>
                    </div>
                </div>
                <div id = "error" class = "row">

                </div>
            </form>
        </div>

        <div class = "container  w-50 mt-3 d-flex justify-content-end card-btn">
            <div class="shadow">
                <a href = "table.cfm" class= "btn btn-primary p-2 rounded  " >
                    show table 
                    <img class="svg-collection-img" src = "./assets/css/album-svgrepo-com.svg" width="20" height="20" />
                </a>
            </div>
        </div>

    </body>
    <script src = "./assets/js/index.js"></script>

</html>