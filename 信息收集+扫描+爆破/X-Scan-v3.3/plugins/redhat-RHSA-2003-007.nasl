
#
# (C) Tenable Network Security
#
# The text of this plugin is (C) Red Hat Inc.
#

include("compat.inc");
if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(12348);
 script_version ("$Revision: 1.7 $");
 script_name(english: "RHSA-2003-007: libpng");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory RHSA-2003-007");
 script_set_attribute(attribute: "description", value: '
  Updated libpng packages are available which fix a buffer overflow
  vulnerability.

  [Updated 06 Feb 2003]
  Added fixed packages for Advanced Workstation 2.1

  The libpng package contains a library of functions for creating and
  manipulating PNG (Portable Network Graphics) image format files. PNG
  is a bit-mapped graphics format similar to the GIF format.

  Unpatched versions of libpng 1.2.1 and earlier do not correctly calculate
  offsets, which leads to a buffer overflow and the possibility of arbitrary
  code execution. This could be exploited by an attacker creating a
  carefully crafted PNG file which could execute arbitrary code when the
  victim views it.

  Packages within Red Hat Linux Advanced Server, such as Mozilla, make use of
  the shared libpng library. All users are advised to upgrade to the errata
  packages, which contain libpng 1.0.14 with a backported patch that corrects
  this issue.


');
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "see_also", value: "http://rhn.redhat.com/errata/RHSA-2003-007.html");
script_set_attribute(attribute: "solution", value: "Get the newest RedHat Updates.");
script_end_attributes();

script_cve_id("CVE-2002-1363");
script_summary(english: "Check for the version of the libpng packages");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Red Hat Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/RedHat/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"libpng-1.0.14-0.7x.4", release:'RHEL2.1') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libpng-devel-1.0.14-0.7x.4", release:'RHEL2.1') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host if not affected");
