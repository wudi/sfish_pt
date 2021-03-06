# This script was automatically generated from the dsa-1361
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(25961);
 script_version("$Revision: 1.7 $");
 script_xref(name: "DSA", value: "1361");
 script_cve_id("CVE-2007-3791");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1361 security update');
 script_set_attribute(attribute: 'description', value:
'It was discovered that postfix-policyd, an anti-spam plugin for postfix,
didn\'t correctly test lengths of incoming SMTP commands potentially allowing
the remote execution of arbitrary code.
For the old stable distribution (sarge), this package was not present.
For the stable distribution (etch), this problem has been fixed in version
1.80-2.1etch1.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2007/dsa-1361');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your postfix-policyd package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1361] DSA-1361-1 postfix-policyd");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1361-1 postfix-policyd");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'postfix-policyd', release: '4.0', reference: '1.80-2.1etch1');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
