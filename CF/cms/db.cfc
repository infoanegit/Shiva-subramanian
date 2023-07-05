<cfcomponent>
    <!--- insert page data --->
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

    <!--- insert new user data / create new user --->
    <cffunction name="insertUser" access="public" returnType="void">
        <cfargument name="username" required="true" type="string"/>
        <cfargument name="password" required="true" type="string"/>  
         <cfquery name="credTbl">
            INSERT INTO userTableCMS("username", "password", "role")
            values
            (
                <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar"/>,
                <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar"/>,
                'user'
            )
        </cfquery>
    </cffunction>

    <!--- get the user data for given username and password --->
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

    <!--- get the user data for given username --->
    <cffunction name="checkUsername" access="public" returnType="query">
        <cfargument name="username" required="true" type="string"/>

        <cfquery name="credTbl">
            SELECT * FROM userTableCMS
            WHERE username= <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar"/>
        </cfquery>

        <cfreturn credTbl />
    </cffunction>

    <!--- get all page data --->
    <cffunction name="retrieveData" access="public" returnType="query">

        <cfquery name="credTbl">
            SELECT * FROM pageTableCMS
        </cfquery>

        <cfreturn credTbl />
    </cffunction>

    <!--- update page data for a given pageId --->
    <cffunction name="updateData" access="public" returnType="void">
        <cfargument name="pageid" required="yes" type="numeric"/>
        <cfargument name="pagename" required="yes" type="string"/>
        <cfargument name="pagedesc" required="yes" type="string"/>
        <cfquery name = "rset">
            UPDATE pageTableCMS
            SET pageName = <cfqueryparam value="#arguments.pagename#" cfsqltype="CF_SQL_VARCHAR" />,
                pageDesc = <cfqueryparam value="#arguments.pagedesc#" cfsqltype="CF_SQL_VARCHAR" />
            WHERE pageId = <cfqueryparam value="#arguments.pageid#" cfsqltype="CF_SQL_INTEGER" />
        </cfquery>  
    </cffunction>

    <!--- delete page data for a given pageId --->
    <cffunction name="deleteData" access="public" returnType="void">
        <cfargument name="pageid" required="yes" type="numeric"/>
        <cfquery name = "rset">
            DELETE FROM pageTableCMS
            WHERE pageId = <cfqueryparam value="#arguments.pageid#" cfsqltype="CF_SQL_INTEGER" />
        </cfquery>  
    </cffunction>
</cfcomponent>



