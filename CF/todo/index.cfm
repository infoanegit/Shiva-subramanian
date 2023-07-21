<!DOCTYPE html>
<html>
    <head>
        <title>
            To Do
        </title>
        <meta name = "viewport" content = "width = device-width, initial-scale = 1">
        <link rel = "icon" href = "../assignment-logo.jpg" type = "image/x-icon" />
        <link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
        <link rel = "stylesheet" href = "./assets/css/index.css" />
        <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>    
        <script src = "./assets/js/index.js"></script>
    </head>
    <body>
        <div class = "container">
            <form method = "post" class = "mt-5 d-flex justify-content-center align-tems-center" >
                
                <div id = "todoListId" class = "border border-2 p-5" style = "position:relative; width:50%">
                    <div class="todo">
                        <div class="row mt-3 p-2 ">
                            <div class="col-1 form-check d-flex justify-content-center align-items-center">
                                <input id="checkAllId" type= "checkbox" class="form-check-input" />
                            </div>
                            <div class="col">
                                <input id="todoInputId" type = "text" class = "form-control form-control-lg" placeholder="Enter todos" autofocus />
                            </div>
                        </div>
                        <div class="row mt-3 border p-2">
                            <div class="col-1 form-check  d-flex justify-content-center align-items-center">
                                <input type = "checkbox" class="todo-check form-check-input" />
                            </div>
                            <div class="col-8 todo-text">
                                exap
                            </div>
                            <div class="col-1 mx-auto ">
                                <input type = "button" class=" todoClose btn btn-close" />
                            </div>
                        </div>
                    </div>
                    <div class="mb-5"></div>
                    <div class="w-100 row" style = "position:absolute; bottom:0; left:3%">
                        <div class="col bg-secondary d-flex justify-content-center align-items-center rounded">
                            <div class=" text-white">
                                <p class="d-inline ">3</p>
                                items left
                            </div>
                        </div>
                        <div class="col">
                            <div class="btn-group">
                                <input type="button" class="btn btn-primary " value="All" />
                                <input type="button" class="btn btn-primary" value="Active" />
                                <input type="button" class="btn btn-primary" value="completed" />
                            </div>
                        </div>
                        <div class="col ">
                            <input type="button" class="btn btn-outline-primary" value = "clear completed" />
                        </div>
                        <div class="mb-1"></div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>