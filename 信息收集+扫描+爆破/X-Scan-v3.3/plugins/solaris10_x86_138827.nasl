#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);
include("compat.inc");

if(description)
{
 script_id(39558);
 script_version("$Revision: 1.3 $");

 script_name(english: "Solaris 10 (x86) : 138827-05");
 script_set_attribute(attribute: "synopsis", value:
"The remote host is missing Sun Security Patch number 138827-05");
 script_set_attribute(attribute: "description", value:
'SunOS 5.10_x86: PostgreSQL 8.3 core patch.
Date this patch was last updated by Sun : Oct/16/09');
 script_set_attribute(attribute: "solution", value:
"You should install this patch for your system to be up-to-date.");
 script_set_attribute(attribute: "see_also", value:
"http://sunsolve.sun.com/search/document.do?assetkey=1-21-138827-05-1");
 script_set_attribute(attribute: "risk_factor", value: "High");
 script_end_attributes();

 script_summary(english: "Check for patch 138827-05");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"138827-05", obsoleted_by:"", package:"SUNWpostgr-83-client", version:"11.10.0,REV=2008.06.05.07.06");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"138827-05", obsoleted_by:"", package:"SUNWpostgr-83-contrib", version:"11.10.0,REV=2008.06.05.07.06");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"138827-05", obsoleted_by:"", package:"SUNWpostgr-83-devel", version:"11.10.0,REV=2008.06.05.07.06");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"138827-05", obsoleted_by:"", package:"SUNWpostgr-83-libs", version:"11.10.0,REV=2008.06.16.07.06");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"138827-05", obsoleted_by:"", package:"SUNWpostgr-83-pl", version:"11.10.0,REV=2008.06.05.07.06");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"138827-05", obsoleted_by:"", package:"SUNWpostgr-83-server", version:"11.10.0,REV=2008.06.05.07.06");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"138827-05", obsoleted_by:"", package:"SUNWpostgr-83-tcl", version:"11.10.0,REV=2008.06.05.07.06");
if ( e < 0 ) { 
	if ( NASL_LEVEL < 3000 ) 
	   security_hole(0);
	else  
	   security_hole(port:0, extra:solaris_get_report());
	exit(0); 
} 
exit(0, "Host is not affected");
