<cfcomponent>
    <cfset this.name = "s001" />
    <cfset this.sessionmanagement = true />
    <cfset this.dataSource = "ssubramanian_dsn" />
    <cfset session.user = "user" />

    <cffunction name = "onApplicationStart">
        <cfset application.userObj = createObject("component","db") />
    </cffunction>
    
    <cffunction name = "onRequestStart">
        <cfif StructKeyExists(URL, "Reinit")>
            <cfset onApplicationStart() />
        </cfif>

        <cfif NOT structKeyExists(session,'username') AND listToArray(cgi.SCRIPT_NAME, '/')[-2] EQ 'welcome'>
            <cflocation  url = "../login/" addtoken="false" />
                    
        <!--- after login, users not allowed to do that again but allowed to do signup --->
        <cfelseif ( structKeyExists(session,'username') AND listToArray(cgi.SCRIPT_NAME, '/')[-2] EQ 'login') > 
            <cflocation  url = "../welcome/" addtoken="false" />
        </cfif>
    </cffunction>


    <cffunction name="onMissingTemplate"> 
        <cfargument name="targetPage" type="string" required=true/> 

        <cfoutput> 
        <h3>#Arguments.targetPage# could not be found.</h3> 
        <p>You requested a non-existent ColdFusion page.<br /> 
        Please check the URL.</p> 
        </cfoutput> 
        <cfreturn true /> 
    </cffunction>

    <cffunction name = "onAbort">
        <cfoutput>
            abort <br />
        </cfoutput>
    </cffunction>

</cfcomponent>