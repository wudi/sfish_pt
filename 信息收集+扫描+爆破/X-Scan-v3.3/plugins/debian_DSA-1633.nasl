# This script was automatically generated from the dsa-1633
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(34087);
 script_version("$Revision: 1.3 $");
 script_xref(name: "DSA", value: "1633");
 script_cve_id("CVE-2008-2231", "CVE-2008-2553");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1633 security update');
 script_set_attribute(attribute: 'description', value:
'It has been discovered that Slash, the Slashdot Like Automated
Storytelling Homepage suffers from two vulnerabilities related to
insufficient input sanitation, leading to execution of SQL commands 
(CVE-2008-2231) and cross-site scripting (CVE-2008-2553).
For the stable distribution (etch), these problems have been fixed in
version 2.2.6-8etch1.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2008/dsa-1633');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your slash package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1633] DSA-1633-1 slash");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1633-1 slash");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'slash', release: '4.0', reference: '2.2.6-8etch1');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
