 <cfcomponent persistent="true">
    <cffunction  name="printpdfdoc" access="remote">           
        <ORMRelaod()>
        <cfset test = entityLoad("contacts",{user_id="#Session.userId#"})>           
        <cfset jsonise = serializeJSON( test)>
        <cfset contactprint = deserializeJSON(jsonise)> 
        <cfdocument format="PDF"  filename="../files/file.pdf" overwrite="Yes">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Phone Number</th>
                    </tr>
                </thead>
                <tbody>
                    <cfoutput>
                        <cfloop array="#contactprint#" index="i">
                            <tr>
                                <td>#i.fname#  #i.lname# </td>
                                <td>#i.email#</td>
                                <td>#i.phone#</td>
                            </tr>
                        </cfloop>
                    </cfoutput>
                </tbody>
            </table>
        </cfdocument> 
            <cfprint type="pdf" source="../files/file.pdf" printer=" Microsoft Print to PDF">
            <cfheader name="content-diposition" value="inline; filename=contact.pdf">
            <cfcontent type="application/pdf" file="C:\Coldfusion2021\cfusion\wwwroot\addressbook\files\file.pdf"/>          
            <cflocation url ="http://127.0.0.1:8500/addressbook/dashboard.cfm">
    </cffunction>
</cfcomponent>
