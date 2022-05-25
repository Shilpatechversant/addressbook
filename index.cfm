<cfinclude  template = "include/header.cfm"  runOnce = "true"> 
     <cfset artists = entityLoad("users")> 
        <cfdump var ="#artists#">
        <cfabort>
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
                                    Don't have an account? <a href="register.cfm">Register Here</a>
                                </div>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
<cfinclude  template = "include/footer.cfm"  runOnce = "true">          
