<cfcomponent name="userdata">
  
    <cffunction  name="createContact" access="remote" output="true">
        <cfargument  name="title" type="string">
        <cfargument  name="fname" type="string">
        <cfargument  name="lname" type="string">
        <cfargument  name="gender" type="string">
        <cfargument  name="dob" type="string">
        <cfargument  name="address" type="string">
        <cfargument  name="street" type="string">
        <cfargument  name="email" type="string">
        <cfargument  name="phone" type="string">
            <cfif arguments.title eq "">
                <cfset local.msg=hash('2','sha')>
                <cflocation url="../dashboard.cfm?message=#local.msg#">
            </cfif>      
            <cfif arguments.fname eq "">
                <cfset local.msg=hash('2','sha')>
                <cflocation url="../dashboard.cfm?message=#local.msg#">
            </cfif>
            <cfif arguments.lname eq "">
                <cfset local.msg=hash('2','sha')>
                <cflocation url="../dashboard.cfm?message=#local.msg#">
            </cfif>
            <cfif arguments.gender eq "">
                <cfset local.msg=hash('2','sha')>
                <cflocation url="../dashboard.cfm?message=#local.msg#">
            </cfif>
            <cfif arguments.dob eq "">
                <cfset local.msg=hash('2','sha')>
                <cflocation url="../dashboard.cfm?message=#local.msg#">
            </cfif>
            <cfif arguments.address eq "">
                <cfset local.msg=hash('2','sha')>
                <cflocation url="../dashboard.cfm?message=#local.msg#">
            </cfif>
            <cfif arguments.street eq "">
                <cfset local.msg=hash('2','sha')>
                <cflocation url="../dashboard.cfm?message=#local.msg#">
            </cfif>
            <cfif arguments.email eq "">
                <cfset local.msg=hash('2','sha')>
                <cflocation url="../dashboard.cfm?message=#local.msg#">
            </cfif>
            <cfif arguments.phone eq "">
                <cfset local.msg=hash('2','sha')>
                <cflocation url="../dashboard.cfm?message=#local.msg#">
            </cfif>
            <cfquery name="address_email" datasource="newtech" result="email_res">
                SELECT * FROM coldfusion.contacts 
                WHERE email=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
            </cfquery>
             <cfif email_res.RecordCount GT 0>
                <cfset local.msg=hash('3','sha')>
                <cflocation url="../dashboard.cfm?message=#local.msg#">
            </cfif>

            <cfif form.file != "">
                <cffile action="upload"
                fileField="file"
                destination="C:\ColdFusion2021\cfusion\wwwroot\addressbook\assets\userImage"
                nameconflict="makeunique"
                 result="img">
                <cfset img = "assets/userImage/#img.clientFile#">
                <cfelse>
                <cfset img = "">
            </cfif>
            <cfquery datasource="newtech" result="result">
                    INSERT INTO coldfusion.contacts (user_id, title, fname, lname, gender, dob, image, address, street, email, phone) VALUES (
                        <cfqueryparam value="#Session.userId#" cfsqltype="CF_SQL_INTEGER">,
                        <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.fname#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.lname#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.gender#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.dob#" cfsqltype="cf_sql_date">,
                        <cfqueryparam value="#img#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.street#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">)
            </cfquery>
            <cfif result.generatedkey>
                <cfset local.msg=hash('4','sha')>
                <cflocation url="../dashboard.cfm?message=#local.msg#" addtoken="no">
            <cfelse>
                <cfset local.msg=hash('5','sha')>
                <cflocation url="../dashboard.cfm?message=#local.msg#">         
            </cfif>        
    </cffunction>

<cffunction name="getUserInfo" access="public" output="true">
    <cfquery name="usersData" datasource="newtech">
        SELECT * FROM coldfusion.users WHERE user_id= <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#Session.userId#">
    </cfquery>
<cfreturn usersData>
</cffunction>

<cffunction  name="updateContact" access="remote" output="true">
    <cfargument  name="title" type="string">
    <cfargument  name="fname" type="string">
    <cfargument  name="lname" type="string">
    <cfargument  name="gender" type="string">
    <cfargument  name="dob" type="string">
    <cfargument  name="address" type="string">
    <cfargument  name="street" type="string">
    <cfargument  name="email" type="string">
    <cfargument  name="phone" type="string">
        <cfif arguments.title eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>      
        <cfif arguments.fname eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.lname eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.gender eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.dob eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.address eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.street eq "">
           <cfset local.msg=hash('2','sha')>
            <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.email eq "">
           <cfset local.msg=hash('2','sha')>
            <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.phone eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>    
        <cfif form.file != "">
            <cffile action="upload"
            fileField="file"
            destination="C:\ColdFusion2021\cfusion\wwwroot\addressbook\assets\userImage"
            nameconflict="makeunique"
            result="img">
            <cfset img = "assets/userImage/#img.clientFile#">
                <cfelse>
                <cfset img = "#arguments.old_file#">
        </cfif>
        <cfquery datasource="newtech">
            UPDATE coldfusion.contacts 
            SET 
            title=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.title#">,
            fname=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fname#">,
            lname=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.lname#">,
            gender=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.gender#">,
            dob=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.dob#">,
            image = <cfqueryparam CFSQLType="cf_sql_varchar" value="#img#">,
            address=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address#">,
            street=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.street#">,
            email=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#">,
            phone=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.phone#">
            WHERE id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#"> 
        </cfquery>
       <cfset message = "Contact Updated Successfully.">
       <cflocation url="../dashboard.cfm?message=#message#" addtoken="no">
</cffunction>

<cffunction  name="deleteUser" access="public" output="true">
    <cfargument name="userId" type="any" required="true" />
    <cfquery datasource="newtech" name="delete_page">
        DELETE 
        FROM coldfusion.contacts
        WHERE id = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#userId#">
    </cfquery>
    <cfreturn>
</cffunction>

<cffunction  name="getAllContact" access="public"  output="true">
    <cfquery name="usersData" datasource="newtech">
        SELECT * FROM coldfusion.contacts WHERE user_id=<cfqueryparam value="#Session.userId#" CFSQLType="CF_SQL_INTEGER">
    </cfquery>
    <cfreturn usersData>
</cffunction>

 <cffunction name="printFunc" output="true" access="public">
    <cfargument  name="user_id" type="integer">
    <cfquery name="print_res" result="p_res">
        SELECT * FROM coldfusion.contacts WHERE 
        user_id=<cfqueryparam value="#arguments.user_id#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    <cfreturn print_res>
</cffunction>
<cffunction  name="getContact" access="remote" returnformat="json" output="false">
    <cfargument name="id" type="numeric" required="true" />
    <cfquery name="getItem" datasource="newtech" returntype="array">
    SELECT * FROM coldfusion.contacts 
    WHERE id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
    </cfquery>
    <cfreturn getItem />
</cffunction>

<cffunction name="getEmailData" access="remote" returnFormat = "json" >
    <cfargument name="email" type="string" required="false" >
    <cfquery name="contacts"  datasource="newtech" result="email_res">
        SELECT * FROM coldfusion.contacts
        WHERE email=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>  
    <cfreturn email_res> 
</cffunction>

<cffunction name="getPhoneData" access="remote" returnFormat = "json" >
    <cfargument name="phone" type="string" required="false" >
    <cfquery name="contacts"  datasource="newtech" result="phone_res">
        SELECT * FROM coldfusion.contacts
        WHERE phone=<cfqueryparam value="#arguments.phone#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>  
    <cfreturn phone_res> 
</cffunction>  

</cfcomponent>