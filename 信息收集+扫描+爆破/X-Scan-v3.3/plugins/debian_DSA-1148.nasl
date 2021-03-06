# This script was automatically generated from the dsa-1148
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(22690);
 script_version("$Revision: 1.6 $");
 script_xref(name: "DSA", value: "1148");
 script_cve_id("CVE-2005-2734", "CVE-2006-0330", "CVE-2006-4030");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1148 security update');
 script_set_attribute(attribute: 'description', value:
'Several remote vulnerabilities have been discovered in gallery, a web-based
photo album. The Common Vulnerabilities and Exposures project identifies
the following problems:
CVE-2005-2734
    A cross-site scripting vulnerability allows injection of web script
    code through HTML or EXIF information.
CVE-2006-0330
    A cross-site scripting vulnerability in the user registration allows
    injection of web script code.
CVE-2006-4030
    Missing input sanitising in the stats modules allows information
    disclosure.
For the stable distribution (sarge) these problems have been fixed in
version 1.5-1sarge2.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2006/dsa-1148');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your gallery package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1148] DSA-1148-1 gallery");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1148-1 gallery");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'gallery', release: '3.1', reference: '1.5-1sarge2');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
