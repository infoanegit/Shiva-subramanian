<cfset botReply = "null" />
<cfif cgi.REQUEST_METHOD == "post">
    <cfset arr = arrayNew(1) />
    <cfset messageStruct = structNew("ordered") />
    <cfset messageStruct["role"] = "user" />
    <cfset messageStruct["content"] = "#FORM.userQuery#" />
    <cfset arrayAppend(arr, messageStruct) />
    <cfset bodyStruct = structNew("ordered") />
    <cfset bodyStruct["model"] = "gpt-3.5-turbo" />
    <cfset bodyStruct["messages"] = arr />

    <cfhttp result="result" method="post" charset="utf-8" url = "https://api.openai.com/v1/chat/completions" >
        <cfhttpparam type = "header" name = "Content-Type" value = "application/json" />
        <cfhttpparam type = "header" name = "Authorization" value = "Bearer 
        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" />
        <cfhttpparam type = "body" value = "#serializeJSON(bodyStruct)#" />
    </cfhttp>   

    <cfset resultStruct = deserializeJSON(result.fileContent) />
    <cfset botReply = resultStruct.choices[1].message.content />
</cfif>

<div class = "bg-light" >
    <div class = "d-flex flex-row " style = "margin-left:25%">
        <div class = "text-light">
            <p class = "bg-danger text-center px-4" style = "width:90px;">
                BOT
            </p>
        </div>
        <div class = "p-2 mb-5" style = "widht:80%" >
            <cfif result.ResponseHeader.Status_Code == "200" >
                <pre class="text-wrap" ><cfoutput>#botReply#</cfoutput></pre>
            <cfelse>
                <pre class="text-wrap text-danger" >something went wrong!</pre>
            </cfif>
        </div>
    </div>
</div>