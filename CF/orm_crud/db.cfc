<cfcomponent>
    <!--- insert page data --->
    <cffunction name = "insertData" access = "public" returnType = "void">
        <cfargument name = "pageName" required = "true" type = "string"/>
        <cfargument name = "pageDesc" required = "true" type = "string"/>  
        <cfset newPage = entityNew("page") />
        <cfset newPage.setPageName(pageName) />
        <cfset newPage.setPageDesc(pageDesc) />
        <cfset entitySave(newPage) />
    </cffunction>

    <!--- insert new user data / create new user --->
    <cffunction name = "insertUser" access = "public" returnType = "void">
        <cfargument name = "username" required = "true" type = "string"/>
        <cfargument name = "password" required = "true" type = "string"/>  
        <cfset user = entityNew("user") />
        <cfset user.setUserName(username) />
        <cfset user.setPassword(password) />
        <cfset user.setRole("user") />
        <cfset entitySave(user) />
    </cffunction>

    <!--- get the user data for given username and password --->
    <cffunction name = "getData" access = "public" returnType = "query">
        <cfargument name = "username" required = "true" type = "string">
        <cfargument name = "password" required = "true" type = "string">
        <cfset userEntity = entityLoadByPK("user", username) />
        <cfset userQuery = entityToQuery(userEntity) />
        <cfif userQuery.password EQ password >
            <cfreturn userQuery />
        </cfif>
        <cfreturn query() />
    </cffunction>

    <!--- get the user data for given username --->
    <cffunction name = "checkUsername" access = "public" returnType = "query">
        <cfargument name = "username" required = "true" type = "string"/>
        <cfset userEntity = entityLoadByPK("user", username) />
        <cfset userQuery = entityToQuery(userEntity) />
        <cfreturn userQuery />
    </cffunction>

    <!--- get all page data --->
    <cffunction name = "retrieveData" access = "public" returnType = "query">
        <cfset page = entityLoad("page") />
        <cfset pageQuery = entityToQuery(page) />
        <cfreturn pageQuery />
    </cffunction>

    <!--- update page data for a given pageId --->
    <cffunction name = "updateData" access = "public" returnType = "void">
        <cfargument name = "pageid" required = "yes" type = "numeric"/>
        <cfargument name = "pagename" required = "yes" type = "string"/>
        <cfargument name = "pagedesc" required = "yes" type = "string"/>
        <cfset page = entityLoadByPK("page", pageid) />
        <cfset page.setPageName(pagename) />
        <cfset page.setPageDesc(pagedesc) />
        <cfset entitySave(page) />
    </cffunction>

    <!--- delete page data for a given pageId --->
    <cffunction name = "deleteData" access = "public" returnType = "void">
        <cfargument name = "pageid" required = "yes" type = "numeric"/>
        <cfset page = entityLoadByPK("page", pageid) />
        <cfset entityDelete(page)/>
    </cffunction>
</cfcomponent>



