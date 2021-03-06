# This script was automatically generated from the dsa-894
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(22760);
 script_version("$Revision: 1.6 $");
 script_xref(name: "DSA", value: "894");
 script_cve_id("CVE-2005-2964", "CVE-2005-2972");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-894 security update');
 script_set_attribute(attribute: 'description', value:
'Chris Evans discovered several buffer overflows in the RTF import
mechanism of AbiWord, a WYSIWYG word processor based on GTK 2.
Opening a specially crafted RTF file could lead to the execution of
arbitrary code.
For the old stable distribution (woody) these problems have been fixed in
version 1.0.2+cvs.2002.06.05-1woody3.
For the stable distribution (sarge) these problems have been fixed in
version 2.2.7-3sarge2.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2005/dsa-894');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your abiword package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA894] DSA-894-1 abiword");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-894-1 abiword");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'abiword', release: '3.0', reference: '1.0.2+cvs.2002.06.05-1woody3');
deb_check(prefix: 'abiword-common', release: '3.0', reference: '1.0.2+cvs.2002.06.05-1woody3');
deb_check(prefix: 'abiword-doc', release: '3.0', reference: '1.0.2+cvs.2002.06.05-1woody3');
deb_check(prefix: 'abiword-gnome', release: '3.0', reference: '1.0.2+cvs.2002.06.05-1woody3');
deb_check(prefix: 'abiword-gtk', release: '3.0', reference: '1.0.2+cvs.2002.06.05-1woody3');
deb_check(prefix: 'abiword-plugins', release: '3.0', reference: '1.0.2+cvs.2002.06.05-1woody3');
deb_check(prefix: 'xfonts-abi', release: '3.0', reference: '1.0.2+cvs.2002.06.05-1woody3');
deb_check(prefix: 'abiword', release: '3.1', reference: '2.2.7-3sarge2');
deb_check(prefix: 'abiword-common', release: '3.1', reference: '2.2.7-3sarge2');
deb_check(prefix: 'abiword-doc', release: '3.1', reference: '2.2.7-3sarge2');
deb_check(prefix: 'abiword-gnome', release: '3.1', reference: '2.2.7-3sarge2');
deb_check(prefix: 'abiword-help', release: '3.1', reference: '2.2.7-3sarge2');
deb_check(prefix: 'abiword-plugins', release: '3.1', reference: '2.2.7-3sarge2');
deb_check(prefix: 'abiword-plugins-gnome', release: '3.1', reference: '2.2.7-3sarge2');
deb_check(prefix: 'xfonts-abi', release: '3.1', reference: '2.2.7-3sarge2');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
