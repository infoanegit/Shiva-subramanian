<!--- 'url' and 'url.id' should not be empty --->
<cfif structIsEmpty(url) NEQ true>
    <cfif url.id NEQ "">
        <cfquery name = "img" datasource = "ssubramanian_dsn">     
            SELECT * FROM img WHERE imgId = <cfqueryparam value = "#url.id#" cfsqltype = "cf_sql_integer">
        </cfquery>

        <cffile action = "delete" file = "#expandpath('./assets/images/#img.TITLE#.jpg')#">
        <cfquery name = "img" datasource = "ssubramanian_dsn">     
            DELETE FROM img WHERE imgId  =  <cfqueryparam value = "#url.id#" cfsqltype = "cf_sql_integer">
        </cfquery>
    </cfif>
</cfif>

<!--- redirect to table --->
<cflocation url = "table.cfm" addToken = "false" statusCode = "301">