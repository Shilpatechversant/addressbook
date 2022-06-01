<cfinclude  template = "include/header.cfm"  runOnce = "true">  
        <div class="container box-section">
            <div class="row d-flex justify-content-center">
                <div class="col-md-9">
                    <div class="card px-5 py-5 box-card">
                        <div class="row">
                            <div class="col-md-4  bblue">
                                <div class="ldiv">
                                    <image src="./assets/img/display1.webp" width="150" height="150">  
                                </div>                            
                            </div>
                            <div class="col-md-8">
                                <div class="form-data">
                                    <form method="post" name="loginForm" action="cfc/login.cfc?method=loginAction"> 
                                        <div class="text-center d-flex flex-column"> 
                                            <h1>Login</h1>
                                            <cfif structKeyExists(url,"message")>
                                                <cfoutput>#url.message#</cfoutput>
                                            </cfif>
                                        </div>
                                        <div class="forms-inputs mb-5">
                                            <input name="username" class="t-field" autocomplete="off" type="text" placeholder="Username"/>
                                        </div>
                                        <div class="forms-inputs mb-5"> 
                                            <input name="password" class="t-field" autocomplete="off" type="password" placeholder="Password"/>
                                        </div>
                                        <div class="mb-3">
                                            <button type="submit"  name="loginButton" class="btn btn-primary">Login</button>
                                        </div>
                                    </form>    
                                </div>
                                <div class="success-data">                                      
                                    <div class="text-center d-flex flex-column"> 
                                    <i class='bx bxs-badge-check'></i> 
                                    <span class="text-center fs-1">
                                    Or Sign in Using <br>
                                             <a href="cfc/login.cfc?method=facebookLogin"><button name="face-btn" class="social-btn"><i class="fab fa-facebook"></i></button> </a>  
                                    <form method="post" action="cfc/google.cfc?method=googleLogin"> 
                                                          
                                     <button type="submit" name="google-btn" class="social-btn">
                                     <i class="fab fa-google-plus"></i></button></form><br>                                                              
                                    Don't have an account? <a href="register.cfm">Register Here</a>
                                </div>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

</script>
<cfinclude  template = "include/footer.cfm"  runOnce = "true">          
