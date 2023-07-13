<cfset  newq = queryNew("") />
<cfdump var = "#newq#" />

<cfset n = 5 />
<cfset l = 1 />
<cfset n_temp = n />
<cfloop index="i" from="1" to = "#n#">
    <cfloop  index="k" from="1" to = "#(((n_temp*2)-1)/2)#">
        <cfoutput>&nbsp;</cfoutput>
    </cfloop>
    <cfset n_temp = n_temp - 1 />
    <cfoutput>*</cfoutput>
    <cfif i NEQ 1>
        <cfloop index="j" from="1" to="#l*2#">
            <cfoutput>*</cfoutput>
        </cfloop>
        <cfset l = l + 1 />
    </cfif>
    <br/>
</cfloop>

<cfset list = "1,3,5,7,9" />
<cfset n = listLen(list) />
<cfset n_temp = n />
<cfloop index = "i" list = "#list#" >
    <cfloop  index="k" from="1" to = "#(((n_temp*2)-1)/2)#">
        <cfoutput>&nbsp;</cfoutput>
    </cfloop>
    <cfset n_temp = n_temp - 1 />
    <cfloop index = "j" from = "1" to = "#i#" >
        <cfoutput>*</cfoutput>
    </cfloop>
    <br/>
</cfloop>