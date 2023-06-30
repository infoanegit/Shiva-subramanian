<cfcomponent>
    <cfset this.name = "s0145" />
    <cfset this.sessionmanagement = true />
    <cfset this.dataSource = "ssubramanian_dsn" />

    <cffunction name = "onApplicationStart">
        <cfset application.userObj = createObject("component","db") />
    </cffunction>
</cfcomponent>