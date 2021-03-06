# This script was automatically generated from the dsa-1275
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(25009);
 script_version("$Revision: 1.5 $");
 script_xref(name: "DSA", value: "1275");
 script_cve_id("CVE-2007-0240");
 script_bugtraq_id(23084);

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1275 security update');
 script_set_attribute(attribute: 'description', value:
'A cross-site scripting vulnerability in zope, a web application
server, could allow an attacker to inject arbitrary HTML and/or
JavaScript into the victim\'s web browser.  This code would run within
the security context of the web browser, potentially allowing the
attacker to access private data such as authentication cookies, or to
affect the rendering or behavior of zope web pages.
For the stable distribution (sarge), this problem has been fixed in
version 2.7.5-2sarge4.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2007/dsa-1275');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your zope2.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1275] DSA-1275-1 zope2.7");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1275-1 zope2.7");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'zope2.7', release: '3.1', reference: '2.7.5-2sarge4');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
