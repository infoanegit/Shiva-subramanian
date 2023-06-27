<cfcomponent>
    <cfset this.name = "s005" />
    <cfset this.sessionmanagement = true />
    <cffunction name = "onSessionStart">
        <cfset application.captcha = createObject("component","func") />
        <cfset session.captchaWord = application.captcha.randomize(5) />
    </cffunction>
</cfcomponent>