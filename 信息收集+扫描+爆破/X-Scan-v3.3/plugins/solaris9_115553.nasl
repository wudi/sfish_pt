#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);
include("compat.inc");

if(description)
{
 script_id(13566);
 script_version("$Revision: 1.29 $");

 script_name(english: "Solaris 9 (sparc) : 115553-29");
 script_set_attribute(attribute: "synopsis", value:
"The remote host is missing Sun Security Patch number 115553-29");
 script_set_attribute(attribute: "description", value:
'SunOS 5.9: USB Drivers and Framework Patch.
Date this patch was last updated by Sun : Jan/31/08');
 script_set_attribute(attribute: "solution", value:
"You should install this patch for your system to be up-to-date.");
 script_set_attribute(attribute: "see_also", value:
"http://sunsolve.sun.com/search/document.do?assetkey=1-21-115553-29-1");
 script_set_attribute(attribute: "risk_factor", value: "High");
 script_end_attributes();

 script_summary(english: "Check for patch 115553-29");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWcar", version:"11.9.0,REV=2002.04.06.15.27");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWcar", version:"11.9.0,REV=2002.04.09.12.25");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWcarx", version:"11.9.0,REV=2002.04.06.15.27");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWcarx", version:"11.9.0,REV=2002.04.09.12.25");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWcpr", version:"11.9.0,REV=2002.04.06.15.27");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWcpr", version:"11.9.0,REV=2002.04.09.12.25");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWcprx", version:"11.9.0,REV=2002.04.06.15.27");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWcprx", version:"11.9.0,REV=2002.04.09.12.25");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWcsl", version:"11.9.0,REV=2002.04.06.15.27");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWcslx", version:"11.9.0,REV=2002.04.06.15.27");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWcstl", version:"11.9.0,REV=2002.04.06.15.27");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWcstlx", version:"11.9.0,REV=2002.04.06.15.27");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWcsu", version:"11.9.0,REV=2002.04.06.15.27");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWcsxu", version:"11.9.0,REV=2002.04.06.15.27");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWhea", version:"11.9.0,REV=2002.04.06.15.27");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWkey", version:"11.9.0,REV=2002.04.06.15.27");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWmdb", version:"11.9.0,REV=2002.04.06.15.27");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWmdbx", version:"11.9.0,REV=2002.04.06.15.27");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWusb", version:"11.9.0,REV=2002.04.06.15.27");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWusbu", version:"11.9.0,REV=2002.04.06.15.27");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"115553-29", obsoleted_by:"", package:"SUNWusbx", version:"11.9.0,REV=2002.04.06.15.27");
if ( e < 0 ) { 
	if ( NASL_LEVEL < 3000 ) 
	   security_hole(0);
	else  
	   security_hole(port:0, extra:solaris_get_report());
	exit(0); 
} 
exit(0, "Host is not affected");
