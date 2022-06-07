<cfcomponent persistent="true">
    <cffunction  name="googleLogin" access="remote">
        <cfoauth
        type="Google" 
        clientid="54278489352-3of4vfkj11fqen2stac846edjeqoast7.apps.googleusercontent.com" 
        scope="https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile"
        secretkey="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" 
        result="res"  
        redirecturi="http://127.0.0.1:8500/addressbook/cfc/google.cfc?method=googleLogin">

        <cfquery  datasource="newtech" result="outputquery" name="checkquery">
            SELECT * FROM coldfusion.login WHERE email=<cfqueryparam CFSQLType="cf_sql_varchar" value="#res.other.email#">
        </cfquery>

        <cfif outputquery.RECORDCOUNT GT 0>
            <cfset Session.userId = checkquery.id>
            <cfset Session.loggedin = true />
            <cfset Session.logwith = "google" />   
            <cflocation url ="http://127.0.0.1:8500/addressbook/dashboard.cfm">   
        <cfelse>
            <cfquery datasource="newtech" result="result">
                INSERT INTO coldfusion.login (fullname, email, username, password) VALUES (
                    <cfqueryparam value="#res.other.given_name#" CFSQLType="cf_sql_varchar">, 
                    <cfqueryparam value="#res.other.email#" CFSQLType="cf_sql_varchar">, 
                    <cfqueryparam value="#res.other.email#" CFSQLType="cf_sql_varchar">, 
                    <cfqueryparam value="">)
            </cfquery>
            <cfset Session.userId = result.generatedkey>
            <cfset Session.loggedin = true />
            <cfset Session.logwith = "google" /> 
            <cflocation url ="http://127.0.0.1:8500/addressbook/dashboard.cfm">
        </cfif> 
</cffunction>
</cfcomponent>
