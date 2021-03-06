
#
# (C) Tenable Network Security, Inc.
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(40273);
 script_version("$Revision: 1.4 $");
 script_name(english: "SuSE 11.1 Security Update:  libwmf (2009-05-12)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing a security patch for libwmf");
 script_set_attribute(attribute: "description", value: "A specially crafted WMF files could crash libwmf.
(CVE-2009-1364)
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "solution", value: "Run yast to install the security patch for libwmf");
script_set_attribute(attribute: "see_also", value: "https://bugzilla.novell.com/show_bug.cgi?id=495842");
script_end_attributes();

 script_cve_id("CVE-2009-1364");
script_summary(english: "Check for the libwmf package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"libwmf-0.2.8.4-206.24.4", release:"SUSE11.1", cpu:"i586") )
{
	security_hole(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"libwmf-0.2.8.4-206.24.4", release:"SUSE11.1", cpu:"x86_64") )
{
	security_hole(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"libwmf-32bit-0.2.8.4-206.24.4", release:"SUSE11.1", cpu:"x86_64") )
{
	security_hole(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"libwmf-devel-0.2.8.4-206.24.4", release:"SUSE11.1", cpu:"i586") )
{
	security_hole(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"libwmf-devel-0.2.8.4-206.24.4", release:"SUSE11.1", cpu:"x86_64") )
{
	security_hole(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"libwmf-gnome-0.2.8.4-206.24.4", release:"SUSE11.1", cpu:"i586") )
{
	security_hole(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"libwmf-gnome-0.2.8.4-206.24.4", release:"SUSE11.1", cpu:"x86_64") )
{
	security_hole(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"libwmf-gnome-32bit-0.2.8.4-206.24.4", release:"SUSE11.1", cpu:"x86_64") )
{
	security_hole(port:0, extra:rpm_report_get() );
	exit(0);
}
exit(0,"Host is not affected");
