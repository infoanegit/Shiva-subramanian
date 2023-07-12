<cfcomponent persistent="true" table = "userTableCMS">
    <cfproperty name = "userName" fieldtype="id" generator="identity"/>
    <cfproperty name = "password" />
    <cfproperty name = "role" />
</cfcomponent>