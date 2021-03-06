# This script was automatically generated from the dsa-639
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(16165);
 script_version("$Revision: 1.8 $");
 script_xref(name: "DSA", value: "639");
 script_cve_id("CVE-2004-1004", "CVE-2004-1005", "CVE-2004-1009", "CVE-2004-1090", "CVE-2004-1091", "CVE-2004-1092", "CVE-2004-1093");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-639 security update');
 script_set_attribute(attribute: 'description', value:
'Andrew V. Samoilov has noticed that several bugfixes which were
applied to the source by upstream developers of mc, the midnight
commander, a file browser and manager, were not backported to the
current version of mc that Debian ships in their stable release.  The
Common Vulnerabilities and Exposures Project identifies the following
vulnerabilities:
    Multiple format string vulnerabilities
    Multiple buffer overflows
    One infinite loop vulnerability
    Denial of service via  corrupted section header
    Denial of service via null dereference
    Freeing unallocated memory
    Denial of service via use of already freed memory
    Denial of service via manipulating non-existing file handles
    Unintended program execution via insecure filename quoting
    Denial of service via a buffer underflow
For the stable distribution (woody) these problems have been fixed in
version 4.5.55-1.2woody5.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2005/dsa-639');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your mc package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA639] DSA-639-1 mc");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-639-1 mc");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'gmc', release: '3.0', reference: '4.5.55-1.2woody5');
deb_check(prefix: 'mc', release: '3.0', reference: '4.5.55-1.2woody5');
deb_check(prefix: 'mc-common', release: '3.0', reference: '4.5.55-1.2woody5');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
