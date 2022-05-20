<cfcomponent name="login" persistent="true">
    <cffunction name="loginAction" access="remote">
        <cfargument name="username" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfif arguments.username eq "">
            <cfset local.msg = "Please Fill Username">
            <cflocation url="../index.cfm?message=#local.msg#">
        </cfif>      
        <cfif arguments.password eq "">
            <cfset local.msg = "Please Fill Password">
               <cflocation url="../index.cfm?message=#local.msg#">
        </cfif>
        <cfquery  datasource="newtech" result="outputdata" name="loginResult">
            SELECT * FROM coldfusion.login WHERE 
            username= <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.username#">
            AND password=<cfqueryparam CFSQLType="cf_sql_varchar" value="#hash(arguments.passWord,'SHA')#"> 
            AND status="1"
        </cfquery>  
        
        <cfif outputdata.RECORDCOUNT GT 0>
            <cfset Session.userId = loginResult.id>
            <cfset Session.loggedin = true />
            <cfif Session.loggedin eq true>
                <cflocation url="../dashboard.cfm" >
            </cfif> 
        <cfelse>
            <cfset local.msg = "Please Enter Correct Username and Password">
            <cflocation url="../index.cfm?message=#local.msg#">
        </cfif>                 
    </cffunction>
</cfcomponent>
