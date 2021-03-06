# This script was automatically generated from the dsa-1329
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(25676);
 script_version("$Revision: 1.5 $");
 script_xref(name: "DSA", value: "1329");
 script_cve_id("CVE-2007-2839");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1329 security update');
 script_set_attribute(attribute: 'description', value:
'Steve Kemp from the Debian Security Audit project discovered that
gfax, a GNOME frontend for fax programs, uses temporary files in an
unsafe manner which may be exploited to execute arbitrary commands
with the privileges of the root user.
For the old stable distribution (sarge) this problem has been fixed
in version 0.4.2-11sarge1.
The stable distribution (etch) is not affected by this problem.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2007/dsa-1329');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your gfax package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1329] DSA-1329-1 gfax");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1329-1 gfax");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'gfax', release: '3.1', reference: '0.4.2-11sarge1');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
