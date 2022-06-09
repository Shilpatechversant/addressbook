<cfcomponent accessors="TRUE">
    <cffunction name="insertData" access="remote" output="true">
        <cfargument name="fullName" type="string" required="true" />
        <cfargument name="emailId" type="string" required="true"/>
        <cfargument name="userName" type="string" required="true" />
        <cfargument name="passWord" type="string" required="true"/>
        <cfargument name="confirmPassWord" type="string" required="true"/>

        <cfif arguments.fullName eq "">
            <cfset local.variable = "3">
            <cflocation url="../register.cfm?message=#local.variable#" addtoken ="no">
        </cfif>

        <cfif arguments.emailId eq "" >
            <cfset local.variable = "4">
            <cflocation url="../register.cfm?message=#local.variable#" addtoken ="no">
        </cfif>

        <cfif arguments.userName eq "">
            <cfset local.variable = "5">
            <cflocation url="../register.cfm?message=#local.variable#" addtoken ="no">
        </cfif>

        <cfif arguments.passWord neq arguments.confirmPassWord>
            <cfset local.variable = "6">
            <cflocation url="./register.cfm?message=#local.variable#" addtoken ="no">
        </cfif>

        <cfquery name="emailcheck" datasource="newtech">
            select email 
            from coldfusion.login
            where email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.emailId#" >
        </cfquery>
        
        <cfif emailcheck.recordcount >
            <cfset local.variable = "already existing this email">
            <cflocation url="../register.cfm?message=#local.variable#" addtoken ="no">
        <cfelse>           
            <cfquery datasource="newtech" result="result">
                INSERT INTO coldfusion.login (fullname, email, username, password,status) VALUES (
                    <cfqueryparam value="#arguments.fullName#" cfsqltype="cf_sql_varchar">, 
                    <cfqueryparam value="#arguments.emailId#" cfsqltype="cf_sql_varchar">, 
                    <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">, 
                    <cfqueryparam value="#hash(arguments.passWord,'SHA')#" cfsqltype="cf_sql_varchar">,
                   "1")
            </cfquery>
            <cfif result.generatedkey>
               <cfset local.msg=hash('1','sha')>
                <cflocation url="../index.cfm?message=#local.message#" addtoken ="no">
            <cfelse>
                <cfset local.msg=hash('2','sha')>
                <cflocation url="../register.cfm?message=#local.variable#" addtoken ="no">
            </cfif>
        </cfif>
    </cffunction>
</cfcomponent>