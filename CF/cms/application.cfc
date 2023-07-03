<cfcomponent>
    <cfset this.name = "s28225" />
    <cfset this.sessionmanagement = true />
    <cfset this.dataSource = "ssubramanian_dsn" />

    <cffunction name = "onApplicationStart">
        <cfset application.userObj = createObject("component","db") />
    </cffunction>

    <cffunction name = "onRequestStart">
        <cfif structKeyExists(session,'username') AND listToArray(cgi.SCRIPT_NAME, '/')[-1] EQ 'index.cfm'>
            <cflocation  url = "./table.cfm" addtoken="false" />
        </cfif>

        <cfif NOT structKeyExists(session,'username') AND listToArray(cgi.SCRIPT_NAME, '/')[-1] EQ 'table.cfm'>
            <cflocation  url = "./" addtoken="false" />
        </cfif>
    </cffunction>
</cfcomponent>