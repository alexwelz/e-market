using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;


namespace CartWeb
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            
            bundles.Add(new StyleBundle("~/bundles/css").Include(
                "~/Content/*.css" 
            ));

            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
           "~/Scripts/*.js"));

          
        }
    }

}