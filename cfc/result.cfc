<cfcomponent name="result">
  <cffunction  name="addContact" access="remote">
                <cfargument  name="title" type="string">
                <cfargument  name="fname" type="string">
                <cfargument  name="lname" type="string">
                <cfargument  name="gender" type="string">
                <cfargument  name="dob" type="string">
                <cfargument  name="address" type="string">
                <cfargument  name="street" type="string">
                <cfargument  name="email" type="string">
                <cfargument  name="phone" type="string">
        <cfif structKeyExists(form,'id')>
            <cfif form.id GT 0>            
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
                            <cfset img = "#arguments.old_image#">
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
                    <cfset local.msg=hash('8','sha')>
                    <cflocation url="../dashboard.cfm?message=#local.msg#">       
            <cfelse>
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
            </cfif>
        </cfif>
    </cffunction>

</cfcomponent>