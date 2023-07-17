<cfcomponent>

    <cffunction name = "getAllData" returnType="query">
        <cfquery name = "img" datasource = "ssubramanian_dsn">
            SELECT * FROM img
        </cfquery>
        <cfreturn img />
    </cffunction>

    <cffunction name = "getData" returnType="query">
        <cfargument name = "imgId" type = "numeric" required = "yes" />

        <!--- get the row of imgId --->
        <cfquery name = "img" datasource = "ssubramanian_dsn">
            SELECT * FROM img WHERE imgId  =  <cfqueryparam value = #arguments.imgId# cfsqltype = "cf_sql_integer" />
        </cfquery>
        <cfreturn img />
    </cffunction>

    <cffunction name = "insertFormData">
        <cfargument name = "FORM" type = "struct" required = "yes" />
        <cfargument name = "file" type = "struct" required = "yes" />
        <!--- <cfoutput>
            #fileDestination#
            <cfdump var = "#arguments.FORM#"/>
        </cfoutput>
        <cfabort/> --->
        
        <cfquery name = "img" datasource = "ssubramanian_dsn">
            INSERT INTO img VALUES(
                <cfqueryparam value = '#arguments.FORM.TITLE#' cfsqltype = "cf_sql_varchar">, 
                <cfqueryparam value = '#arguments.FORM.DESCRIPTION#' cfsqltype = "cf_sql_varchar">, 
                <cfqueryparam value = '#arguments.file.serverFile#' cfsqltype = "cf_sql_longvarchar">
            )
        </cfquery>
    </cffunction>

    <cffunction  name = "updateFormData">
        <cfargument name = "FORM" type = "struct" required = "yes" />
        <cfargument required="yes" type="query" name="img" />

        <!--- common column names --->
        <cfset columnNamesArray = ['imgId', 'title', 'description'] />
        <cfloop index = "index" from = "2" to = "#arrayLen(columnNamesArray)#">

            <!--- Form Field should not be equal to empty --->
            <cfif arguments.FORM[columnNamesArray[index]] NEQ "">

                <!--- For updation, Respective Form field value should not be equal to Query column value --->
                <cfif arguments.FORM[columnNamesArray[index]] NEQ arguments.img[columnNamesArray[index]][1]>
                    
                    <cfquery name = "imgTableUpdate" datasource = "ssubramanian_dsn">
                        UPDATE img SET #columnNamesArray[index]#  =  <cfqueryparam value = '#FORM[columnNamesArray[index]]#' cfsqltype = "cf_sql_varchar" /> WHERE imgId  =  <cfqueryparam value = '#FORM['imgId']#' cfsqltype = "cf_sql_integer" /> 
                    </cfquery>

                </cfif>
                
            </cfif>

        </cfloop>
    </cffunction>

    <cffunction name = "updateImageData">
        <cfargument required="yes" type="struct" name="FORM" />
        <cfargument required="yes" type="query" name="img" />
        <cfif arguments.FORM.fileupload NEQ "">
            <cfif arguments.FORM.fileupload NEQ img.fileupload>
                
                <!--- if FORM.title field is empty then the title taken from the query --->
                <cfif arguments.FORM.title EQ "">
                    <cfset newfilepath  =  arguments.img.fileupload />
                <cfelse>
                    <!--- we have to rename the file by using FORM.title --->
                    <cfset newfilepath  =  expandPath('./assets/images/#FORM.title#.jpg') />
                </cfif>    

                <!--- rename the file and put that in the current folder --->
                <cffile action = "rename" source = "#arguments.FORM.FILEUPLOAD#" destination = "#newfilepath#" />
                
                <!--- update the file path in img table --->
                <cfquery name = "imgUpdate" datasource = "ssubramanian_dsn">
                    UPDATE img SET fileupload  =  <cfqueryparam value = '#arguments.FORM.TITLE#.jpg' cfsqltype = "cf_sql_longvarchar" /> WHERE imgId  =  <cfqueryparam value = '#arguments.FORM.imgId#' cfsqltype = "cf_sql_integer" /> 
                </cfquery>                    
            </cfif>
        </cfif>
    </cffunction>
</cfcomponent>