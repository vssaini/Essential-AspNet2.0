<%@ Application Language="C#" %>

<script runat="server">
    
    void Application_PreRequestHandlerExecute(object src, EventArgs e)
    {
        //Page p = this.Context.Handler as Page;
        //if (p != null)
        //{
        //    p.PreInit += new EventHandler(page_PreInit);
        //}
    }
    
    void page_PreInit(object sender, EventArgs e)
    {
        // Note that you could retrieve the theme from
        // anywhere at this point.
        // Theme applies to all pages from here at runtime.
        //Page p = this.Context.Handler as Page;
        //if (p != null)
        //{
        //    p.Theme = "global";
        //}
    }

    // Migrate user's anonymous data to their authenticated identity
    // by using the MigrateAnonymous event of the ProfileModule
    // It is declared in Global.asax    
    void Profile_MigrateAnonymous(object sender, ProfileMigrateEventArgs e)
    {
        // Note that the anonymous identifier previously associated with the client is available through 
        // the ProfileMigrateEventArgs parameter, and the actual profile for that identity is accessible
        // using the static GetProfile method of the Profile class
        ProfileCommon prof = Profile.GetProfile(e.AnonymousID);
        Profile.FavoriteColor = prof.FavoriteColor;
        Profile.FavoriteNumber = prof.FavoriteNumber;
        Profile.FavoriteHttpStatusCode = prof.FavoriteHttpStatusCode;
    }
    
    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        Application["Check"] = true;

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
