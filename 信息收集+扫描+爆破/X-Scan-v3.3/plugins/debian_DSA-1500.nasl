# This script was automatically generated from the dsa-1500
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(31144);
 script_version("$Revision: 1.5 $");
 script_xref(name: "DSA", value: "1500");
 script_cve_id("CVE-2008-0162");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1500 security update');
 script_set_attribute(attribute: 'description', value:
'Mike Ashton discovered that splitvt, a utility to run two programs in a
split screen, did not drop group privileges prior to executing <q>xprop</q>.
This could allow any local user to gain the privileges of group utmp.
For the stable distribution (etch), this problem has been fixed in version
1.6.5-9etch1.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2008/dsa-1500');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your splitvt package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1500] DSA-1500-1 splitvt");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1500-1 splitvt");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'splitvt', release: '4.0', reference: '1.6.5-9etch1');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
