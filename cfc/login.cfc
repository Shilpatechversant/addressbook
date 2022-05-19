<cfcomponent name="login" persistent="true">
    <cffunction name="loginAction" access="remote">
        <cfargument name="username" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfif argument.username eq "">
            <cfset local.msg = "Please Fill Username">
               <cflocation url="../login.cfm?message=#local.variable#">
        </cfif>
        <cfif argument.password eq "">
            <cfset local.message = "Please Fill Password">
               <cflocation url="../register.cfm?message=#local.variable#">
        </cfif>
        <cfquery  datasource="newtech" result="outputdata" name="loginQuery">
            SELECT * FROM coldfusion.login WHERE 
            username= <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.username#">
             AND password=<cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.password#"> AND status="active"
        </cfquery>

        <cfelse>
            <cfoutput>
            <cfset local.variable = "Please enter correct username and password">
                <cfreturn variable>     
    </cffunction>
</cfcomponent>
