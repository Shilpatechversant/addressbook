<cfcomponent accessors="TRUE">
    <cffunction name="insertData" access="remote" output="true">
        <cfargument name="fullName" type="string" required="true" />
        <cfargument name="emailId" type="string" required="true"/>
        <cfargument name="userName" type="string" required="true" />
        <cfargument name="passWord" type="string" required="true"/>
        <cfargument name="confirmPassWord" type="string" required="true"/>

        <cfif arguments.fullName eq "">
            <cfset local.msg=hash('3','sha')>
            <cflocation url="../register.cfm?message=#local.msg#" addtoken ="no">
        </cfif>

        <cfif arguments.emailId eq "" >
            <cfset local.msg=hash('4','sha')>
            <cflocation url="../register.cfm?message=#local.msg#" addtoken ="no">
        </cfif>

        <cfif arguments.userName eq "">
            <cfset local.msg=hash('5','sha')>
            <cflocation url="../register.cfm?message=#local.msg#" addtoken ="no">
        </cfif>

        <cfif arguments.passWord neq arguments.confirmPassWord>
            <cfset local.msg=hash('6','sha')>
            <cflocation url="./register.cfm?message=#local.msg#" addtoken ="no">
        </cfif>

        <cfquery name="emailcheck" datasource="newtech">
            select email 
            from coldfusion.login
            where email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.emailId#" >
        </cfquery>
        <cfquery name="usernamecheck" datasource="newtech">
            select username 
            from coldfusion.login
            where username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.userName#" >
        </cfquery>
        <cfif usernamecheck.recordcount>
            <cfset local.msg=hash('7','sha')>
            <cflocation url="../register.cfm?message=#local.msg#" addtoken ="no">
        </cfif>    
        
        <cfif emailcheck.recordcount >
            <cfset local.msg=hash('8','sha')>
            <cflocation url="../register.cfm?message=#local.msg#" addtoken ="no">
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
                <cflocation url="../index.cfm?message=#local.msg#" addtoken ="no">
            <cfelse>
                <cfset local.msg=hash('2','sha')>
                <cflocation url="../register.cfm?message=#local.msg#" addtoken ="no">
            </cfif>
        </cfif>
    </cffunction>

<cffunction name="getEmailData" access="remote" returnFormat = "json" >
    <cfargument name="email" type="string" required="false" >
    <cfquery name="contacts"  datasource="newtech" result="email_res">
        SELECT * FROM coldfusion.login
        WHERE email=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>  
    <cfreturn email_res> 
</cffunction>

<cffunction name="getNameData" access="remote" returnFormat = "json" >
    <cfargument name="uname" type="string" required="false" >
    <cfquery name="contacts"  datasource="newtech" result="name_res">
        SELECT * FROM coldfusion.login
        WHERE username=<cfqueryparam value="#arguments.uname#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>  
    <cfreturn name_res> 
</cffunction>
</cfcomponent>