<cfset 
    body = '[{"model": "text-davinci-003","prompt": "Say this is a test","max_tokens": "7","temperature": "0"}]'
/>

<cfset body = structNew("ordered") />
<cfset body.model = "text-davinci-003" />
<cfset body.prompt = "Say this is a test" />
<cfset body.max_tokens = 7 />
<cfset body.temperature = 0 />
<cfset arr = arrayNew(1) />
<cfset arrayAppend(arr, body, true) />
<!--- <cfdump var = "#serializeJSON(arr)#" abort="true" /> --->
<cfhttp result="result" method="post" charset="utf-8" url = "https://api.openai.com/v1/completions" >
    <cfhttpparam type = "header" name = "Content-Type" value = "application/json" />
    <cfhttpparam type = "header" name = "Authorization" value = "Bearer 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" />
    <cfhttpparam type = "body" value = "#serializeJSON(arr)#" />
</cfhttp>

<cfdump var = "#result#" />