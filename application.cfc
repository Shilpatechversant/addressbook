component {
    this.name = "Addressbook App";
    this.datasource = "newtech";
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0);
    this.ormEnabled = true;
    this.ormSettings = { logsql : true };  
    }
