<cfparam  name="message" default="v"> 
<cfparam  name="status" default="v">   
<cfif Not structKeyExists(Session,'userId')>
   <cflocation  url="index.cfm">
</cfif>
<ORMRelaod()>
<cfset test = entityLoad("contacts",{user_id="#Session.userId#"})>           
<cfset jsonise = serializeJSON( test)>
<cfset uData = deserializeJSON(jsonise)> 
<cfinclude template="include/header.cfm" runOnce="true">
<div class="container-fluid">
    <div class="d-flex justify-content-end tab1">
        <div class="mr-auto p-2">
            <h4>Welcome Dashboard,</h4>
        </div>
        <div class="p-3">
            <a href="contact_pdf.cfm" class="btn-success">                
            <i class="fa fa-file-pdf"></i>
            </a>
        </div>
        <div class="p-3">
            <a href="contact_exel.cfm">
            <i class="fa fa-file-excel"></i>
            </a>
        </div>
        <div class="p-3">
            <button>
            <cfoutput><a href="print.cfm?user_id=#Session.userId#"><i class="fa fa-print"></i></a></cfoutput>            
            </button>
        </div>
        </div>
        <cfif status EQ hash('1','sha')>
            <div class="alert alert-success alert-dismissible">
                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                   Contact Deleted Successfully!!
            </div> 
             <cfelseif status EQ hash('3','sha')>
            <div class="alert alert-success alert-dismissible">
                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    Deletion Failed!!
            </div>
        </cfif>
        <cfif message EQ hash('2','sha')>
            <div class="alert alert-success alert-dismissible">
                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                   Please Fill all the Fields!!
            </div> 
        <cfelseif message EQ hash('3','sha')>
            <div class="alert alert-success alert-dismissible">
                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    Email Already Exist!!
            </div>
        <cfelseif message EQ hash('4','sha')>
            <div class="alert alert-success alert-dismissible">
                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    Contact Added Successfully!!
            </div>  
        <cfelseif message EQ hash('5','sha')>
            <div class="alert alert-success alert-dismissible">
                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    Please Try After Some time!!
            </div> 
        <cfelseif message EQ hash('8','sha')>
            <div class="alert alert-success alert-dismissible">
                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    Contact Updated Successfully!!
            </div> 
        </cfif>                        
        
        <div class="row justify-content-md-center tab2">
            <div class="col col-lg-2 s-profile">
                <img src="assets/img/pro1.jpg" class="profile-section" />
                <h4><center>User</center></h4>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter"> Create Contact</button>
            </div>
            <div class="col  col-lg-8" id="tableDataView">              
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Phone Number</th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                    <cfoutput>
                        <cfloop array="#uData#" index="userData">
                            <tbody>
                                <tr>
                                    <th scope="row">
                                        <img src="#userData.image#" width="100px" height="100px" class="li-section" />
                                    </th>
                                    <td>#userData.fname# #userData.lname#</td>
                                    <td>#userData.email#</td>
                                    <td>#userData.phone#</td>
                                    <td>
                                    <button type="button" class="btn btn-sm btn-outline-primary" onClick="editData(#userData.id#)">Edit</button>
                                    </td>
                                    <td>
                                      <a href="delete.cfm?id=#userData.id#"><button type="button" class="btn btn-sm btn-outline-primary">Delete</button></a>  
                                    </td>
                                    <td>
                                      <button class="btn btn-primary" data-toggle="modal" data-target=".viewModal-#userData.id#">View</button>
                                         <div class="modal fade bd-example-modal-lg exampleModal-#userData.id#" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-lg" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form method="post" action="cfc/userdata.cfc?method=updateContact" enctype="multipart/form-data">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <h3>Personal Contact</h3>
                                                                    <hr>
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <label  for="tittle">Title*</label>
                                                                    <select  name="title" class="form-control" id="title" required>
                                                                        <option value="">Select</option>
                                                                        <option <cfif userData.title eq "Mr" >selected</cfif> value="Mr">Mr</option>
                                                                        <option <cfif userData.title eq "Mrs" >selected</cfif> value="Mrs">Mrs</option>
                                                                        <option <cfif userData.title eq "Miss" >selected</cfif> value="Miss">Miss</option>
                                                                        <option <cfif userData.title eq "Ms" >selected</cfif> value="Ms">Ms</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col-md-5">
                                                                        <label  for="firstName">First Name*</label>
                                                                        <input name="fname" value="#userData.fname#" type="text" id="firstName" class="form-control" required>
                                                                </div>
                                                                <div class="col-md-5">
                                                                        <label for="LastName">Last Name*</label>
                                                                        <input name="lname" value="#userData.lname#" type="text" id="LastName" class="form-control" required>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-4">
                                                                <div class="col-md-6">
                                                                    <label for="gender">Gender*</label>
                                                                    <select name="gender" class="form-control" id="gender" required>
                                                                        <option value="">Select</option>
                                                                        <option <cfif userData.gender eq "male" >selected</cfif> value="male">Male</option>
                                                                        <option <cfif userData.gender eq "female" >selected</cfif> value="female">Female</option>
                                                                    </select>
                                                                 </div>
                                                                <div class="col-md-6">
                                                                    <label for="DOB">Date Of Birth*</label>
                                                                    <input name="dob" value="#userData.dob#" type="date" id="DOB" class="form-control" required>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-4">
                                                                <div class="col-md-6">
                                                                    <label for="pImage">Upload Photo</label>
                                                                    <input name="file" type="file" id="pImage" class="form-control" /><img src="#userData.image#" width="100px" height="100px" />
                                                                    <input type="hidden" name="old_file" value="#userData.image#" />
                                                                </div>
                                                            </div>
                                                            <div class="row mt-4">
                                                                <div class="col-md-12">
                                                                    <h3>Contact Details</h3>
                                                                    <hr>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label for="address">Address</label>
                                                                    <input name="address" value="#userData.address#" type="text" id="address" class="form-control" />
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label for="street">Street</label>
                                                                    <input name="street" value="#userData.street#" type="text" id="street" class="form-control" />
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label for="email">Email*</label>
                                                                    <input name="email" value="#userData.email#" type="email" id="email" class="form-control" required/>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label for="phone">Phone*</label>
                                                                    <input name="phone" value="#userData.phone#" type="text" id="phone" class="form-control" required/>
                                                                </div>
                                                            </div>
                                                                    <input type="hidden" name="id" value="#userData.id#" />
                                                          
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                <button name="update_contact" type="submit" class="btn btn-primary">Save</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal fade bd-example-modal-lg viewModal-#userData.id#" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-md" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                    </div>
                                                    <div class="modal-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <h3>Personal Contact</h3>
                                                                    <hr>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    Name 
                                                                </div>
                                                                <div class="col-md-9">
                                                                    : #userData.title#  #userData.fname# #userData.lname#
                                                                </div>
                                                            </div>
                                                            <div class="row mt-4">
                                                                <div class="col-md-3">
                                                                    Gender 
                                                                </div>
                                                                <div class="col-md-9">
                                                                : #userData.gender#
                                                                </div>
                                                            </div>
                                                            <div class="row mt-4">
                                                                <div class="col-md-3">
                                                                    DOB 
                                                                </div>
                                                                <div class="col-md-9">
                                                                : #userData.dob#
                                                                </div>
                                                            </div>
                                                            <div class="row mt-4">
                                                                <div class="col-md-3">
                                                                    Address 
                                                                </div>
                                                            <div class="col-md-9">
                                                                    : #userData.address#, #userData.street#
                                                            </div>
                                                        </div> 
                                                        <div class="row mt-4">
                                                            <div class="col-md-3">
                                                                Email 
                                                            </div>
                                                            <div class="col-md-9">
                                                            : #userData.email#
                                                            </div>
                                                        </div>
                                                        <div class="row mt-4">
                                                            <div class="col-md-3">
                                                            Phone 
                                                            </div>
                                                            <div class="col-md-9">
                                                            : #userData.phone#
                                                            </div>
                                                        </div>
                                                        <div class="row mt-4">
                                                            <div class="col-md-3">
                                                                Image 
                                                                </div>
                                                            <div class="col-md-9">
                                                                : <img src="#userData.image#" width="100px" height="100px" >
                                                            </div>
                                                        </div>   
                                                    </div>                                                       
                                                    <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </cfloop>
                    </cfoutput>
                </table>
            </div>
        </div>
       <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header center">
                        <h4>Contact Form</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="cfc/result.cfc?method=addContact" name="contactform" enctype="multipart/form-data" onsubmit="return validateContactForm()">
                            <div class="row ">
                                <div class="col-md-12">
                                    <h5>Personal Contact</h5><hr class="border border-primary">     
                                </div>
                                <div class="col-md-2">
                                    <label  for="tittle">Title*</label>
                                    <select  name="title" class="form-control" id="tit1" required>
                                        <option value="">Select</option>
                                        <option value="Mr">Mr</option>
                                        <option value="Mrs">Mrs</option>
                                        <option value="Miss">Miss</option>
                                        <option value="Ms">Ms</option>
                                    </select>
                                </div>
                                <div class="col-md-5">
                                    <label  for="firstName">First Name*</label>
                                    <input name="fname" type="text" id="f1" class="form-control" required>
                                </div>
                                <div class="col-md-5">
                                    <label for="LastName">Last Name*</label>
                                    <input name="lname" type="text" id="lastName" class="form-control" required>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <label for="gender">Gender*</label>
                                    <select name="gender" class="form-control" id="gend1" required>
                                        <option value="">Select</option>
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="DOB">Date Of Birth*</label>
                                    <input name="dob" type="date" id="dob" class="form-control" required>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <label for="pImage">Upload Photo</label>
                                    <input name="file" type="file" accept=".jpeg,.png,.gif,.jpg" id="pImage" class="form-control" />
                                    <div id="imagecontent">
                                    </div>                            
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-12">
                                    <h5>Contact Details</h5><hr class="border border-primary">  
                                </div>
                                <div class="col-md-6">
                                    <label for="address">Address</label>
                                    <input name="address" type="text" id="ad1" class="form-control" />
                                </div>
                                <div class="col-md-6">
                                    <label for="street">Street</label>
                                    <input name="street" type="text" id="st1" class="form-control" />
                                </div>
                                <div class="col-md-6">
                                    <label for="email">Email*</label>
                                    <input name="email" type="email" id="email1" class="form-control" onchange="validateEmail();" required/>
                                     <p class="email_alert text-danger"></p>
                                </div>
                                <div class="col-md-6">
                                    <label for="phone">Phone*</label>
                                    <input name="phone" type="text" id="phone1" class="form-control" onchange="validatePhone();" required/>
                                       <p class="phone_alert text-danger"></p>
                                </div>
                                <input type="hidden" name="id"  id="id" value="0" /> 
                                  <input type="hidden" name="old_image"  id="old_image" value="0" /> 
                            </div>                               
                        </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" id="s_btn">Save changes</button>
                    </div>
                    </form>  
                </div>
            </div>
        </div>    
       <!-- Modal -->    
    </div>
</div>
<script>
    const editData = (id) => {
        $.ajax({
            url: "cfc/userdata.cfc",
            type: "post", 
            dataType: "json",
            data: {
                method: "getContact",
                id
            },
            success: function (data){
                if(data && data.length){  
                    $('#tit1').val(data[0].title);  
                    $('#f1').val(data[0].fname);
                    $('#lastName').val(data[0].lname);   
                    $('#gend1').val(data[0].gender);
                    $('#dob').val(data[0].dob); 
                    $('#ad1').val(data[0].address);
                    $('#st1').val(data[0].street);
                    $('#email1').val(data[0].email); 
                    $('#phone1').val(data[0].phone); 
                    $('#id').val(data[0].id);  
                    $('#old_image').val(data[0].image);                                                                            
                    $('#exampleModalCenter').modal('show');
                }
            }
        });
      }
    function validateEmail()
    {   
        var email_id= document.getElementById("email1").value;    
        $.ajax({   
            url: "./cfc/userdata.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"getEmailData",
            email:email_id              
            },
            success: function(data)
            {
                console.log(data);            
                if(data.RECORDCOUNT==1)
                {
                    $('.email_alert').text('Email Already Exists!!');
                    $('#s_btn').prop('disabled', true);
                }
                else{
                    $('.email_alert').text(" ");
                    $('#s_btn').prop('disabled', false);
                }                         
            }         
        });       
   }
    function validatePhone()
    {   
        var phone_id= document.getElementById("phone1").value;    
        $.ajax({   
            url: "./cfc/userdata.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"getPhoneData",
            phone:phone_id              
            },
            success: function(data)
            {
                console.log(data);            
                if(data.RECORDCOUNT != 0)
                {
                    $('.phone_alert').text('Phone Number Already Exists!!');
                    $('#s_btn').prop('disabled', true);
                }
                else{
                    $('.phone_alert').text(" ");
                    $('#s_btn').prop('disabled', false);
                }                         
            }         
        });       
   }   
</script>
<cfinclude template="include/footer.cfm" runOnce="true">