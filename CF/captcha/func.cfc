<cffunction  name = "randomize" returnType = "string">
    <cfset length = "5" />
    <cfset theString = "" />
    <cfloop index="index" from="1" to="#length#">
        <cfswitch expression = "#randRange(0, 1)#">
            <cfcase value = "0">
                <cfset theString = theString & chr(randRange(65, 90)) />
            </cfcase>
            <cfcase value = "1">
                <cfset theString = theString & chr(randRange(97, 122)) />
            </cfcase>
        </cfswitch>
    </cfloop>
    <cfreturn theString />
</cffunction>