<cfcomponent>
    <cffunction name="insertData" access="public" returnType="void">
        <cfargument name="pageName" required="true" type="string"/>
        <cfargument name="pageDesc" required="true" type="string"/>  
         <cfquery name="credTbl">
            INSERT INTO pageTableCMS
            values
            (
                <cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar"/>,
                <cfqueryparam value="#arguments.pageDesc#" cfsqltype="cf_sql_varchar"/> 
            )
        </cfquery>
    </cffunction>

    <cffunction name="getData" access="public" returnType="query">
        <cfargument name="username" required="true" type="string">
        <cfargument name="password" required="true" type="string">

        <cfquery name="credTbl">
            SELECT * FROM userTableCMS
            WHERE username= <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar"/>
            AND   password= <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar"/> 
        </cfquery>

        <cfreturn credTbl />
    </cffunction>

    <cffunction name="checkUsername" access="public" returnType="query">
        <cfargument name="username" required="true" type="string"/>

        <cfquery name="credTbl">
            SELECT * FROM userTableCMS
            WHERE username= <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar"/>
        </cfquery>

        <cfreturn credTbl />
    </cffunction>

    <cffunction name="retrieveData" access="public" returnType="query">

        <cfquery name="credTbl">
            SELECT * FROM pageTableCMS
        </cfquery>

        <cfreturn credTbl />
    </cffunction>
</cfcomponent>



