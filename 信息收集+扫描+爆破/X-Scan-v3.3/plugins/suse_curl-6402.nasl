
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(41497);
 script_version ("$Revision: 1.1 $");
 script_name(english: "SuSE Security Update:  Security update for curl (curl-6402)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch curl-6402");
 script_set_attribute(attribute: "description", value: "This update of libcurl2 fixes the 0-character handling in
the subject name of a SSL certificate. This bug could be
used to execute an undetected man-in-the-middle-attack.
(CVE-2009-2417)
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "solution", value: "Install the security patch curl-6402");
script_end_attributes();

script_cve_id("CVE-2009-2417");
script_summary(english: "Check for the curl-6402 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");

if ( rpm_check( reference:"curl-7.15.1-19.14.2", release:"SLES10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"curl-devel-7.15.1-19.14.2", release:"SLES10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
# END OF TEST
exit(0,"Host is not affected");
