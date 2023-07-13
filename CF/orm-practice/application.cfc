<cfcomponent>
    <cfset this.name = "#createUUID()#" />
    <cfset this.datasource = "ssubramanian_dsn" />
    <cfset this.ormEnabled = "true" />
    <cfset this.ormSettings = { datasource : 'ssubramanian_dsn' , dbcreate : 'update' } />
</cfcomponent>