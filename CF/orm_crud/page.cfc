<cfcomponent persistent="yes" table = "pageTableCMS">
    <cfproperty name = "pageId" fieldtype="id" generator="identity"/>
    <cfproperty name = "pageName" />
    <cfproperty name = "pageDesc" />
</cfcomponent>