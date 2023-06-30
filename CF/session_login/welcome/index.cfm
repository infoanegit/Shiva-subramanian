<cfif structKeyExists(form,"LogoutBtn")>
  <cfset StructClear(Session) />
  <cflocation url="../" addToken="false" />
</cfif>

<!DOCTYPE html>
<html>
  <head>
      <meta name="author" content="ssubramanian@infoane.com" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
      <link rel="icon" href="../assignment-logo.jpg" type="image/x-icon" />
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
      <style>
          .gradient-custom {
              background: linear-gradient(to right, rgba(106, 17, 203, 1), rgba(37, 117, 252, 1))
          }
      </style>
  </head>


  <body>
    <div class="vh-100 gradient-custom">
      <nav class="navbar navbar-expand-sm bg-dark ">
        <div class="container-fluid">
          <!-- Links -->
          <ul class="navbar-nav">
            <li class="nav-item">
              <cfoutput>
                <a class="nav-link text-white">Welcome <label class="fw-bold h4 text-warning">  #Session.username# </label></a>
              </cfoutput>
            </li>
          </ul>
          <span style="float:left;">
            <form method="post">
              <button type="submit" class="btn btn-primary" name="LogoutBtn">Sign Out</button>
            </form>
          </span>
        </div>
      </nav>
    </div>
  </body>
</html>