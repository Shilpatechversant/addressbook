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
        <cfset artists = entityLoad("users")> 
        <cfdump var ="#artists#">
        <cfabort>

        <cfset contactObj = EntityNew("users")>      
            <cfset contactObj.setUser_id(#Session.userId#)>  
            <cfset contactObj.setTitle(#arguments.title#)>  
            <cfset contactObj.setFname(#arguments.fname#)>  
            <cfset contactObj.setLname(#arguments.lname#)>
            <cfset contactObj.setGender(#arguments.gender#)>
            <cfset contactObj.setDob(#arguments.dob#)>
            <cfset contactObj.setImage(#img#)>
            <cfset contactObj.setAddress(#arguments.address#)>
            <cfset contactObj.setStreet(#arguments.street#)>
            <cfset contactObj.setEmail(#arguments.email#)>
            <cfset contactObj.setPhone(#arguments.phone#)>
        <cfset EntitySave(contactObj)>
       <cfset  ormflush()>
            <cfset message = "Contact Added Successfully.">
            <cflocation url="../dashboard.cfm?message=#message#" addtoken="no">
       
</cffunction>

</cfcomponent>