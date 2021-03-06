#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);
include("compat.inc");

if(description)
{
 script_id(23498);
 script_version("$Revision: 1.7 $");

 script_name(english: "Solaris 5.9 (sparc) : 114795-05");
 script_set_attribute(attribute: "synopsis", value:
"The remote host is missing Sun Security Patch number 114795-05");
 script_set_attribute(attribute: "description", value:
'Crypto Accelerator 4000 - 1.0: product patch.
Date this patch was last updated by Sun : Feb/24/04');
 script_set_attribute(attribute: "solution", value:
"You should install this patch for your system to be up-to-date.");
 script_set_attribute(attribute: "see_also", value:
"http://sunsolve.sun.com/search/document.do?assetkey=1-21-114795-05-1");
 script_set_attribute(attribute: "risk_factor", value: "Medium");
 script_end_attributes();

 script_summary(english: "Check for patch 114795-05");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"114795-05", obsoleted_by:"", package:"SUNWkcl2r", version:"2.0.0,REV=2003.03.19.18.18");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"114795-05", obsoleted_by:"", package:"SUNWkcl2u", version:"2.0.0,REV=2003.03.19.18.18");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"114795-05", obsoleted_by:"", package:"SUNWvcaa", version:"1.0.0,REV=2003.03.19.18.25");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"114795-05", obsoleted_by:"", package:"SUNWvcafw", version:"1.0.0,REV=2003.03.19.18.46");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"114795-05", obsoleted_by:"", package:"SUNWvcar", version:"1.0.0,REV=2003.03.19.18.25");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"114795-05", obsoleted_by:"", package:"SUNWvcau", version:"1.0.0,REV=2003.03.19.18.25");
if ( e < 0 ) { 
	if ( NASL_LEVEL < 3000 ) 
	   security_warning(0);
	else  
	   security_warning(port:0, extra:solaris_get_report());
	exit(0); 
} 
exit(0, "Host is not affected");
