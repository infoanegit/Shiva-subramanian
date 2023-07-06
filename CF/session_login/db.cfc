<cfcomponent>
    <!--- insert new username and password --->
    <cffunction name="insertData" access="public" returnType="void">
        <cfargument name="username" required="true" type="string"/>
        <cfargument name="password" required="true" type="string"/>

         <cfquery name="credTbl">
            INSERT INTO userTable(userName,password) 
            values
            (
                <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar"/>,
                <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar"/> 
            )
        </cfquery>
    </cffunction>

    <!--- get user data with particular username and password --->
    <cffunction name="getData" access="public" returnType="query">
        <cfargument name="username" required="true" type="string">
        <cfargument name="password" required="true" type="string">

        <cfquery name="credTbl">
            SELECT * FROM userTable
            WHERE username= <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar"/>
            AND   password= <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar"/> 
        </cfquery>

        <cfreturn credTbl />
    </cffunction>

    <!--- get user data with particular username --->
    <cffunction name="checkUsername" access="public" returnType="query">
        <cfargument name="username" required="true" type="string"/>

        <cfquery name="credTbl">
            SELECT * FROM userTable
            WHERE username= <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar"/>
        </cfquery>

        <cfreturn credTbl />
    </cffunction>
</cfcomponent>



