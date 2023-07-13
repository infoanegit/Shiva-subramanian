<cfcomponent>
    <cffunction name = "check" access="remote" returntype="string">
        <!--- get the users with form.username and form.password --->
        <cfset checkLogin = application.userObj.getData(username = form.userName, password = form.password)>

        <!--- 
            If username and password combination exist, then redirect to table.cfm page 
            Else an error message will be shown to the user
        ---> 
        <cfif checkLogin.recordcount>
            <cfset session.username = checkLogin.username />
            <cfset session.role = checkLogin.role />
            <!--- <cflocation url = "table.cfm" addToken = "false" /> --->
            <cfreturn true />
        </cfif>
        <cfreturn false />
    </cffunction>
</cfcomponent>