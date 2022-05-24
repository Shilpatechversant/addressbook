<cfcomponent name="userdata">
<cffunction  name="createContact" access="remote">
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
            <cfset local.msg = "Please Fill Title">
            <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>      
        <cfif arguments.fname eq "">
            <cfset local.msg = "Please Fill First Name">
               <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.lname eq "">
            <cfset local.msg = "Please Fill Last Name">
               <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.gender eq "">
            <cfset local.msg = "Please Fill Gender">
               <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.dob eq "">
            <cfset local.msg = "Please Fill Date Of Birth">
               <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.address eq "">
            <cfset local.msg = "Please Fill Address">
               <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.street eq "">
            <cfset local.msg = "Please Fill Street">
               <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.email eq "">
            <cfset local.msg = "Please Fill email">
               <cflocation url="../dashboard.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.phone eq "">
            <cfset local.msg = "Please Fill phone">
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
                INSERT INTO coldfusion.users (user_id, title, fname, lname, gender, dob, image, address, street, email, phone) VALUES (
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
             <cfset message = "Contact Added Successfully.">
            <cflocation url="../dashboard.cfm?message=#message#" addtoken="no">
        <cfelse>
            <cfset message = "Please try after some time...">
            <cflocation url="../dashboard.cfm?message=#message#">         
        </cfif>     
</cffunction>

</cfcomponent>