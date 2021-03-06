# This script was automatically generated from the dsa-275
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(15112);
 script_version("$Revision: 1.11 $");
 script_xref(name: "DSA", value: "275");
 script_cve_id("CVE-2003-0144");
 script_bugtraq_id(7025);

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-275 security update');
 script_set_attribute(attribute: 'description', value:
'A buffer overflow has been discovered in lpr, a BSD lpr/lpd line
printer spooling system.  This problem can be exploited by a local
user to gain root privileges, even if the printer system is set up
properly.
For the stable distribution (woody) this problem has been fixed in
version 0.72-2.1.
The old stable distribution (potato) does not contain lpr-ppd packages.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2003/dsa-275');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your lpr-ppd package immediately.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA275] DSA-275-1 lpr-ppd");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-275-1 lpr-ppd");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'lpr-ppd', release: '3.0', reference: '0.72-2.1');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
