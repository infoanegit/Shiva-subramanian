<cfcomponent>
    <cfset this.name = "s0014" />
    <cfset this.sessionmanagement = true />
    <cfset this.dataSource = "ssubramanian_dsn" />

    <cffunction name = "onApplicationStart">
        <cfset application.userObj = createObject("component","db") />
    </cffunction>
    
    <cffunction name = "onRequestStart">
        <cfif StructKeyExists(URL, "Reinit")>
            <cfset onApplicationStart() />
        </cfif>
        
        <cfif NOT structKeyExists(session,'username') AND listToArray(cgi.SCRIPT_NAME, '/')[-2] EQ 'welcome'>
            <cflocation  url = "../" addtoken="false" />
        
        <!--- after login, users not allowed to do that again but allowed to do signup --->
        <cfelseif ( structKeyExists(session,'username') AND listToArray(cgi.SCRIPT_NAME, '/')[-2] EQ 'session_login') > 
            <cflocation  url = "./welcome/" addtoken="false" />
        </cfif>
    </cffunction>

</cfcomponent>