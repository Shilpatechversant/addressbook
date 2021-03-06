<cfparam  name="message" default="v">
<cfinclude  template = "include/header.cfm"  runOnce = "true"> 
        <div class="container box-section">
            <div class="row d-flex justify-content-center">
                <div class="col-md-9">
                    <div class="card px-5 py-5 box-card">
                        <div class="row">
                            <div class="col-md-4 bblue">
                                <div class="logodiv">
                                   <image src="./assets/img/display1.webp" width="150" height="150"> 
                                </div>   
                            </div>
                            <div class="col-md-8">
                                <div class="form-data">
                                  <form method="post" name="registerForm" action="cfc/register.cfc?method=insertData" onsubmit="return validateRegisterForm()">
                                        <div class="text-center d-flex flex-column">
                                            <h1>Sign Up</h1>
                                         </div>
                                         <div class="row pt-5">
                                            <cfif message EQ hash('2','sha')>
                                                <div class="alert alert-danger alert-dismissible">
                                                    <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                        Registration failed!!
                                                </div>  
                                                <cfelseif message EQ hash('3','sha')>
                                                    <div class="alert alert-danger alert-dismissible">
                                                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            Please fill Fullname!!
                                                    </div>  
                                                <cfelseif message EQ hash('4','sha')>
                                                    <div class="alert alert-danger alert-dismissible">
                                                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            Please fill Email!!
                                                    </div>   
                                                <cfelseif message EQ hash('5','sha')>
                                                    <div class="alert alert-danger alert-dismissible">
                                                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            Please fill username!!
                                                    </div>  
                                                <cfelseif message EQ hash('6','sha')>
                                                    <div class="alert alert-danger alert-dismissible">
                                                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            Password and confirmpassowrd should be same!
                                                    </div> 
                                                <cfelseif message EQ hash('7','sha')>
                                                    <div class="alert alert-danger alert-dismissible">
                                                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            Username already exist!
                                                    </div>
                                                <cfelseif message EQ hash('8','sha')>
                                                    <div class="alert alert-danger alert-dismissible">
                                                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            Email already exist!
                                                    </div>                                                                    
                                            </cfif> 
                                        </div>

                                        <div class="form-group">
                                            <input name="fullName" class="t-field" autocomplete="off" type="text" placeholder="Full Name"/>
                                        </div>
                                        <div class="form-group">
                                             <input name="emailId" id="email1" class="t-field" autocomplete="off" type="email" placeholder="Email Id" onchange="validateRegEmail();" />
                                             <p class="email_alert text-danger"></p>
                                        </div>
                                        <div class="form-group">  
                                            <input name="userName" id="username1" class="t-field" autocomplete="off" type="text" placeholder="Username" required onchange="validateRegUsername();"/>
                                            <p class="username_alert text-danger"></p>
                                         </div>
                                        <div class="form-group">
                                              <input name="passWord" class="t-field" autocomplete="off" type="password" placeholder="Password" required/>
                                         </div>
                                        <div class="form-group">
                                             <input name="confirmPassWord" class="t-field" autocomplete="off" type="password" placeholder="Confirm Password" required/>
                                        </div>
                                        <div class="form-group text-center">
                                            <button type="submit" name="registerButton" id="r_btn" class="btn btn-lg btn-primary">Sign Up</button> 
                                        </div>
                                  </form>    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
      
<cfinclude  template = "include/footer.cfm" >