<!DOCTYPE HTML>
<html>
    <head>
        <title>
            Divisible by 3
        </title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
        <link rel="icon" href="../assignment-logo.jpg" type="image/x-icon" />
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./assets/js/index.js"></script>
    </head>

    <body>
        <div class="container">
            <center>
                <h2>
                    <b>
                        Divisible by 3
                    </b>
                </h2>
            </center>
            <hr/>
            <div style="margin-left:24%; padding-left: 2%;" class="w-50" >
                <form method="post" action="index.cfm" class="row formBody bg-white" >  
                    <div class="row my-2">
                        <div class="col form-group">
                            <label for="listOfNumbers">
                                Enter the series of numbers(delimiter: ", ") 
                            </label>
                            <input type="text" class="form-control" name="listOfNumbers" id="listOfNumbers" />
                        </div>
                    </div>    
                    <div class="row my-2 ms-1">
                        <button type="submit" name="submitButton" class="btn btn-primary col-sm-2  mt-1">
                            Submit
                        </button>
                    </div>
                    <div class="row my-2 ms-1">
                    
                        <cfif cgi.request_method IS "post">
                            <cfset newList="">
                                <cfloop list="#form.LISTOFNUMBERS#" item="item">

                                    <!--- append values in newList which are divisible by 3 --->
                                    <cfif item MOD 3 EQ 0>
                                        <cfset newList = listAppend(newList, "#item#", ",")>
                                    </cfif>
                                </cfloop>
                            <cfdump var="#newList#">
                        </cfif>

                    </div>
                    <div class="row">
                        <div id="error" class="col alert alert-danger alert-dismissible fade hide">
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            <strong>
                                Warning!
                            </strong>
                            <p id="error-text">
                                This alert box could indicate a dangerous or potentially negative action.
                            </p>
                        </div>
                    </div>                    
                </form>
            </div>
        </div>
    </body>
</html>

