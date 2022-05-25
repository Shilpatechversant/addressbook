<cfinclude template="include/header.cfm" runOnce="true">
    <div class="container-fluid">
        <div class="d-flex justify-content-end tab1">
            <div class="mr-auto p-2">
                <h4>Welcome Dashboard,</h4>
            </div>
            <div class="p-3">
                <a href="" class="btn-success">
                    <i class="fa fa-file-pdf"></i>
                </a>
            </div>
            <div class="p-3">
                <a href="" class=" ">
                    <i class="fa fa-file-excel"></i>
                </a>
            </div>
            <div class="p-3">
                <button onclick="">
                    <i class="fa fa-print"></i>
                </button>
            </div>
        </div>
        <cfif structKeyExists(url,"message")>
            <cfoutput>#url.message#</cfoutput>
        </cfif>
        <div class="row justify-content-md-center tab2">
            <div class="col col-lg-2 s-profile">
                <img src="assets/img/pro1.jpg" class="profile-section" />
                <h4>Shilpa S Pillai</h4>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter"> Create Contact</button>
            </div>
            <div class="col  col-lg-8">
                <cfinvoke component="cfc.userdata" method="getUserInfo" returnVariable="userData">
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
                        <cfoutput query="userData">
                            <tbody>
                                <tr>
                                    <th scope="row">
                                        <img src="#userData.image#" width="100px" height="100px" class="li-section" />
                                    </th>
                                    <td>#userData.fname# #userData.lname#</td>
                                    <td>#userData.email#</td>
                                    <td>#userData.phone#</td>
                                    <td>
                                        <button type="button" class="btn btn-sm btn-outline-primary">Edit</button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-sm btn-outline-primary">Delete</button>
                                    </td>
                                    <td>
                                      <button class="btn btn-primary" data-toggle="modal" data-target=".viewModal-#userData.id#">View</button>
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
                        </cfoutput>
                    </table>
            </div>
        </div>
        <cfinclude template="create_contact.cfm" runOnce="true">

</div>
    </div>
    <cfinclude template="include/footer.cfm" runOnce="true">