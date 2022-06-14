<cfif Not structKeyExists(Session,'userId')>
   <cflocation  url="index.cfm">
</cfif>
<cfparam  name="user_id" default="v">
<cfset obj1=createObject("component","cfc.userdata")>
<cfset data=obj1.getAllContact(user_id)>
<cfinclude template="include/header.cfm" runOnce="true">
<body onload="printTable('print_div')">
    <cfdocument  format="pdf" filename="contact_data.pdf" overwrite="Yes" >        
            <h3 class="text-center">Contact List</h3> 
            <div id="p_div">       
                <table class="table table-bordered" >
                <thead>
                <tr>                    
                    <th scope="col">Name</th>
                    <th scope="col">Email Id</th>
                    <th scope="col">Phone Number</th>
                    <th scope="col">Address</th>
                    <th scope="col">Gender</th>
                    <th scope="col">DOB</th>
                </tr>
                </thead>
                <tbody>
                <cfoutput query="data">
                    <tr>              
                    <td>#fname# #lname#</td>
                    <td>#email#</td>
                    <td>#phone#</td>
                    <td>#address#, #street# </td>
                    <td>#gender#</td>
                    <td>#dob#</td>
                    </tr>
                </cfoutput>               
               </tbody>
              
                </table>
            </div>
    </cfdocument>
    <cfset path =expandPath('.') & '\' &'contact_data.pdf'>
    <cfprint type="pdf" source="#path#" printer="Fax">  
    <h3 class="text-center">Contact List</h3>    
    <div id="print_div">       
                <table class="table table-bordered">
                    <thead>
                     <tr>             
                    <th scope="col">Name</th>
                    <th scope="col">Email Id</th>
                    <th scope="col">Phone Number</th>
                    <th scope="col">Address</th>
                    <th scope="col">Gender</th>
                    <th scope="col">DOB</th>
                </tr>
                    </thead>
                 <cfoutput query="data">
                    <tr>              
                    <td>#fname# #lname#</td>
                    <td>#email#</td>
                    <td>#phone#</td>
                    <td>#address#, #street# </td>
                    <td>#gender#</td>
                    <td>#dob#</td>
                    </tr>
                </cfoutput>
                </table>
            </div>
</body>
<script>
    function printTable(divName) {
      var printContents = document.getElementById(divName).innerHTML;
      var originalContents = document.body.innerHTML;   
      document.body.innerHTML = printContents;   
      window.print();   
     // document.body.innerHTML = originalContents;
  }
</script>
<cfinclude template="include/footer.cfm" runOnce="true">

