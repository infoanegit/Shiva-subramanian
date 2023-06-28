<cffunction  name = "randomize" returnType = "string">
    <cfset length = "5" />
    <cfset theString = "" />
    <cfloop index="index" from="1" to="#length#">
        <cfset theString = theString & chr(randRange(65, 90, "CFMX_COMPAT")) />
    </cfloop>
    <cfreturn theString />
</cffunction>