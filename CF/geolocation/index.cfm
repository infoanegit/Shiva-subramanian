<!DOCTYPE html>
<html>
    <head>
        <title>ipstack api</title>
        <meta name = "viewport" content = "width = device-width, initial-scale = 1" />
        <link rel="icon" href="../assignment-logo.jpg" type="image/x-icon" />
        <link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
        <script src = "https://code.jquery.com/jquery-1.11.3.min.js"></script>
        <script src = "./assets/js/index.js"></script>
    </head>
    <body>
        <form class = "container" name = "loginForm" method = "post">
            <div class = "row d-flex justify-content-center align-items-center " >
                <div class = "col-5 mt-3">
                    <div class = "card bg-light text-dark shadow" style = "border-radius: 1rem;">
                        <div class = "card-body p-5 text-center">
                            <div>
                                <input id = "ipAddressId" type = "text" class = "form-control-lg" name = "ipAddress" placeholder="Enter the IP Address" />
                            </div>
                            <button type = "submit" class = "mt-4 btn btn-success">Submit</button>
                            <div class = "mt-5 border border-dark text-start">
                                
                                <cfif cgi.REQUEST_METHOD EQ "post">
                                    <cfhttp result="result" method="GET" charset="utf-8" url="http://api.ipstack.com/#FORM.ipaddress#">
                                        <cfhttpparam name="access_key" type="url" value="60ea75c090f8ac5ff038a7ec4fbf8c84">
                                    </cfhttp>
                                    <cfset JSONdata = deserializeJSON(result.fileContent) />
                                    <cfoutput>
                                        <ol>
                                            <li>
                                                <b>
                                                    Continent:
                                                </b>
                                                #JSONdata.continent_name#
                                            </li>
                                            <li>
                                                <b>
                                                    Country:
                                                </b>
                                                #JSONdata.country_name#
                                            </li>
                                            <li>
                                                <b>
                                                    State: 
                                                </b>
                                                #JSONdata.region_name#
                                            </li>
                                            <li>
                                                <b>City: </b>
                                                #JSONdata.city#
                                            </li>
                                        </ol> 
                                    </cfoutput>
                                </cfif>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>