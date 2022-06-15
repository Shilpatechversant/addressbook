component {

    this.name = "addressBook";
    this.datasource = "newtech";
    this.sessionManagement  = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0);
    this.scriptProtect="all";
    this.ormEnabled = true;
    this.ormSettings = { 
        logsql : true,
        cflocation : ['cfc/contacts'],       
        dialect : "org.hibernate.dialect.MySQL5Dialect",
        datasource : "newtech",
        useDBForMapping : false
    };
    function OnApplicationStart(requestname)
    {
        application.obj=createObject('component','cfc.userdata');
        this.return=true;
    }
    
    function onRequestStart(requestname){      
        if(!structKeyExists(Session, "userId") ){
            if(findNoCase("/addressbook/create_contact.cfm",requestname) > 0 ||
            findNoCase("/addressbook/dashboard.cfm",requestname) > 0||
            findNoCase("/addressbook/delete.cfm",requestname) > 0 ||
            findNoCase("/addressbook/contact_excel.cfm",requestname) > 0 || 
            findNoCase("/addressbook/print.cfm",requestname) > 0 || 
            findNoCase("/addressbook/contact_pdf.cfm",requestname) > 0){
                writeOutput('<center><h1>Login Required</h1>
                <p>Please Login to yout account</p><br>
                  <a href="index.cfm">Click Here</a></center>');
                abort;
            }
        }
    }

    function onError(Exception,EventName){
        writeOutput('<center><h1>An error occurred</h1>
        <p>Please Contact the developer</p>
        <p>Error details: #Exception.message#</p></center>');
    } 

    function onMissingTemplate(targetPage){
        writeOutput('<center><h1>This Page is not avilable.</h1>
        <p>Please go back:</p></center>');
    }

    function onSessionEnd(sessionScope, applicationScope){
        writeOutput('<center>
                     <h1>Your session expired. Please login again</h1>
                     <a href="index.cfm">Click Here</a>
                     </center>');
    }
}