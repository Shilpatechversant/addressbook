<cfif isDefined("url.id")>
    <cfinvoke component="cfc.userdata"  method="deleteUser" returnVariable="process" userId=#url.id#>
    <cfset local.msg=hash('1','sha')>    
    <cflocation url="dashboard.cfm?status=#local.msg#" addtoken="no">
<cfelse>
    <cfset local.msg=hash('2','sha')>    
    <cflocation url="dashboard.cfm?status=#local.msg#" addtoken="no">
</cfif>