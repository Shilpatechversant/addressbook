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


    <cffunction name="facebookLogin" access="remote">
        <cfoauth
            type="Facebook"
            clientid="742288636814574"
            secretkey="ef6a3a089d972bec54affe6d8ccb35c0"
            result="resFb"
            redirecturi="http://localhost:8500/addressbook/cfc/login.cfc?method=facebookLogin">
           

            <cfquery name="outputquery" datasource="newtech">
            SELECT *FROM coldfusion.login WHERE 
            username = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#resFb.id#">AND
            fullname = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#resFb.name#">  
            </cfquery>
            
            <cfif outputquery.RECORDCOUNT GT 0>
                <cfset Session.userId = outputquery.id>
                <cfset Session.loggedin = true />
                <cfset Session.logwith = "facebook" />
                <cflocation  url="../dashboard.cfm" addtoken="false">    
            <cfelse>
                <cfquery datasource="newtech" result="result">
                    INSERT INTO coldfusion.login(fullname, email, username, password,status) VALUES (
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#resFb.name#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="facebook">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#resFb.name#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#resFb.access_token#">,
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                        )
                </cfquery>
                <cfset Session.userId = result.generatedkey>
                <cfset Session.loggedin = true />
                <cfset Session.logwith = "facebook"/>
                <cflocation  url="../dashboard.cfm" addtoken="false">
            </cfif>    
    </cffunction>
</cfcomponent>
