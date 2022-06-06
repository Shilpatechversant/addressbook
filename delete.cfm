<cfif isDefined("url.id")>
    <cfinvoke component="cfc.userdata"  method="deleteUser" returnVariable="process" userId=#url.id#>
    <cfset message = "Contact Delete Successfully.">
    <cflocation url="dashboard.cfm?message=#message#" addtoken="no">
<cfelse>
    <cfset message = "Contact Delete Failed.">
    <cflocation url="dashboard.cfm?message=#message#" addtoken="no">
</cfif>