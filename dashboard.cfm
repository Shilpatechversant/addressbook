<cfinclude  template = "include/header.cfm"  runOnce = "true">  
<div class="container-fluid">
    <div class="d-flex justify-content-end tab1"> 
     <div class="mr-auto p-2"><h4>Welcome Dashboard,</h4></div>   
        <div class="p-3"><a href="" class="btn-success"><i class="fa fa-file-pdf"></i></a></div>
        <div class="p-3">  <a href="" class=" "><i class="fa fa-file-excel"></i></a></div>
        <div class="p-3">  <button onclick=""><i class="fa fa-print"></i></button></div>
    </div>
    <div class="row justify-content-md-center tab2">
            <div class="col col-lg-2 s-profile">
            <img src="assets/img/pro1.jpg" class="profile-section" />
            <h4>Shilpa S Pillai</h4>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
Create Contact</button>
           
            </div>
            <div class="col  col-lg-8">
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
                    <tbody>
                        <tr>
                        <th scope="row">   <img src="assets/img/pro2.jpg" class="li-section" /></th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td><button type="button" class="btn btn-sm btn-outline-primary">Edit</button></td>
                        <td><button type="button" class="btn btn-sm btn-outline-primary">Delete</button></td>
                        <td><button type="button" class="btn btn-sm btn-outline-primary">View</button></td>
                        </tr>
                        <tr>
                        <th scope="row">   <img src="assets/img/pro2.jpg" class="li-section" /></th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                        <td><button type="button" class="btn btn-sm btn-outline-primary">Edit</button></td>
                        <td><button type="button" class="btn btn-sm btn-outline-primary">Delete</button></td>
                        <td><button type="button" class="btn btn-sm btn-outline-primary">View</button></td>
                        </tr>
                        <tr>
                        <th scope="row">   <img src="assets/img/pro2.jpg" class="li-section" /></th>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                        <td><button type="button" class="btn btn-sm btn-outline-primary">Edit</button></td>
                        <td><button type="button" class="btn btn-sm btn-outline-primary">Delete</button></td>
                        <td><button type="button" class="btn btn-sm btn-outline-primary">View</button></td>
                        </tr>
                    </tbody>
            </table>
            </div>
           
        
    </div>
      <cfinclude  template = "create_contact.cfm"  runOnce = "true"> 

</div> 

<cfinclude  template = "include/footer.cfm"  runOnce = "true">  