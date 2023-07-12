<cfcomponent>
    <cfset this.name = "s28sh" />
    <cfset this.sessionmanagement = true />
    <cfset this.dataSource = "ssubramanian_dsn" />
    <cfset this.ormEnabled = "true" />
    <cfset this.ormSettings = { datasource : 'ssubramanian_dsn' , dbcreate : 'update' } />

    <cffunction name = "onApplicationStart">
        <cfset application.userObj = createObject("component","db") />
    </cffunction>

    <cffunction name = "onRequestStart">
        
        <!--- If the user is already logged in, then redirect from the login page to the table page --->
        <cfif structKeyExists(session,'username') AND listToArray(cgi.SCRIPT_NAME, '/')[-1] EQ 'index.cfm'>
            <cflocation  url = "./table.cfm" addtoken="false" />
        </cfif>

        <!--- If the user is not logged in already, then redirect from the table page to the login page --->
        <cfif NOT structKeyExists(session,'username') AND listToArray(cgi.SCRIPT_NAME, '/')[-1] EQ 'table.cfm'>
            <cflocation  url = "./" addtoken="false" />
        </cfif>
    </cffunction>
</cfcomponent>