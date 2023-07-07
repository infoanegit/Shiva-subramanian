<html>
    <head>
        <title>
            Chat With BOT
        </title>
        <meta name = "viewport" content = "width = device-width, initial-scale = 1">
        <link rel = "icon" href = "../assignment-logo.jpg" type = "image/x-icon" />
        <link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
        <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src = "https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src = "./assets/js/index.js" ></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    </head>

    <body>
        <form class = "container-fluid">
            <div id = "content" class = "mb-4">
            </div>
            <div class="spinner-border mt-5" style="margin-left:25%; display:none;"></div>
        </div>
            <div class = "d-flex justify-content-center fixed-bottom mb-1">
                <input id = "userQueryId" type = "text" class = "form-control-lg w-50 bg-light" name = "userQuery" />
                <button type = "submit" class = "btn btn-primary mx-2">
                    <span class="material-symbols-outlined">
                    send
                    </span>
                </button>
            </div>
        </form>
    </body>
</html>