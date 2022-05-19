<cfcomponent>

    <cffunction name="insertData" access="remote">

        <cfargument name="fullName" type="string" required="true" />
        <cfargument name="emailId" type="string" required="true"/>
        <cfargument name="userName" type="string" required="true" />
        <cfargument name="passWord" type="string" required="true"/>
        <cfargument name="confirmPassWord" type="string" required="true"/>

        <cfif arguments.fullName eq "">
            <cfset local.variable = "Please fill the name">
            <cflocation url="../register.cfm?message=#local.variable#">
        </cfif>

        <cfif arguments.emailId eq "" >
            <cfset local.variable = "Please fill the Email field">
            <cflocation url="../register.cfm?message=#local.variable#">
        </cfif>

        <cfif arguments.userName eq "">
            <cfset local.variable = "Please fill the Username field">
            <cflocation url="../register.cfm?message=#local.variable#">
        </cfif>

        <cfif arguments.passWord neq arguments.confirmPassWord>
            <cfset local.variable = "Please fill the password and confirm password as same">
            <cflocation url="./register.cfm?message=#local.variable#">
        </cfif>

        <cfquery name="emailcheck" datasource="newtech">
            select email 
            from coldfusion.login
            where email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.emailId#" >
        </cfquery>
        
        <cfif emailcheck.recordcount >
            <cfset local.variable = "already existing this email">
            <cflocation url="../register.cfm?message=#local.variable#">
        <cfelse>
            <cfset local.status_info="active">
            <cfquery datasource="newtech" result="result">
                INSERT INTO coldfusion.login (fullname, email, username, password,status) VALUES (
                    <cfqueryparam value="#arguments.fullName#" cfsqltype="cf_sql_varchar">, 
                    <cfqueryparam value="#arguments.emailId#" cfsqltype="cf_sql_varchar">, 
                    <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">, 
                    <cfqueryparam value="#hash(arguments.passWord,'SHA')#" cfsqltype="cf_sql_varchar">,
                    #local.status_info#)
            </cfquery>
            <cfif result.generatedkey>
                <cflocation url="../index.cfm" >
            <cfelse>
                <cfset local.variable = "Please try after some time...">
                <cflocation url="../register.cfm?message=#local.variable#">
            </cfif>
        </cfif>
    </cffunction>
</cfcomponent>