# This script was automatically generated from the dsa-1213
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(23662);
 script_version("$Revision: 1.7 $");
 script_xref(name: "DSA", value: "1213");
 script_cve_id("CVE-2006-0082", "CVE-2006-4144", "CVE-2006-5456", "CVE-2006-5868");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1213 security update');
 script_set_attribute(attribute: 'description', value:
'Several remote vulnerabilities have been discovered in Imagemagick,
a collection of image manipulation programs, which may lead to the
execution of arbitrary code. The Common Vulnerabilities and Exposures
project identifies the following problems:
CVE-2006-0082
    Daniel Kobras discovered that Imagemagick is vulnerable to format
    string attacks in the filename parsing code.
CVE-2006-4144
    Damian Put discovered that Imagemagick is vulnerable to buffer
    overflows in the module for SGI images.
CVE-2006-5456
    M Joonas Pihlaja discovered that Imagemagick is vulnerable to buffer
    overflows in the module for DCM and PALM images.
CVE-2006-5868
    Daniel Kobras discovered that Imagemagick is vulnerable to buffer
    overflows in the module for SGI images.
This update also addresses regressions in the XCF codec, which were
introduced in the previous security update.
For the stable distribution (sarge) these problems have been fixed in
version 6:6.0.6.2-2.8.
For the upcoming stable distribution (etch) these problems have been
fixed in version 7:6.2.4.5.dfsg1-0.11.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2006/dsa-1213');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your imagemagick packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1213] DSA-1213-1 imagemagick");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1213-1 imagemagick");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'imagemagick', release: '3.1', reference: '6.0.6.2-2.8');
deb_check(prefix: 'libmagick6', release: '3.1', reference: '6.0.6.2-2.8');
deb_check(prefix: 'libmagick6-dev', release: '3.1', reference: '6.0.6.2-2.8');
deb_check(prefix: 'perlmagick', release: '3.1', reference: '6.0.6.2-2.8');
deb_check(prefix: 'imagemagick', release: '4.0', reference: '6.2.4.5.dfsg1-0.11');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
