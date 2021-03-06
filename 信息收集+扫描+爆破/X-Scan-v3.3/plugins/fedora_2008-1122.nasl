
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2008-1122
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(30234);
 script_version ("$Revision: 1.3 $");
script_name(english: "Fedora 8 2008-1122: tk");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2008-1122 (tk)");
 script_set_attribute(attribute: "description", value: "When paired with the Tcl scripting language, Tk provides a fast and powerful
way to create cross-platform GUI applications.

-
Update Information:

The new version of tk, which brings some bug fixes f.e. better functionality on
64bits.    Fixed security issue - buffer overflow in gif parsing.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

 script_cve_id("CVE-2006-4484", "CVE-2008-0553");
script_summary(english: "Check for the version of the tk package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"tk-8.4.17-2.fc8", release:"FC8") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
