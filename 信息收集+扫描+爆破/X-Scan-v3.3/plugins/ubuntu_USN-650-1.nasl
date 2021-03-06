# This script was automatically generated from the 650-1 Ubuntu Security Notice
# It is released under the Nessus Script Licence.
# Ubuntu Security Notices are (C) 2005 Canonical, Inc.
# USN2nasl Convertor is (C) 2005 Tenable Network Security, Inc.
# See http://www.ubuntulinux.org/usn/
# Ubuntu(R) is a registered trademark of Canonical, Inc.

if (! defined_func("bn_random")) exit(0);
include('compat.inc');

if (description) {
script_id(36256);
script_version("$Revision: 1.1 $");
script_copyright("Ubuntu Security Notice (C) 2009 Canonical, Inc. / NASL script (C) 2009 Tenable Network Security, Inc.");
script_category(ACT_GATHER_INFO);
script_family(english: "Ubuntu Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_require_keys("Host/Ubuntu", "Host/Ubuntu/release", "Host/Debian/dpkg-l");

script_xref(name: "USN", value: "650-1");
script_summary(english:"cpio vulnerability");
script_name(english:"USN650-1 : cpio vulnerability");
script_set_attribute(attribute:'synopsis', value: 'The remote package "cpio" is missing a security patch.');
script_set_attribute(attribute:'description', value: 'A buffer overflow was discovered in cpio. If a user were tricked into
opening a crafted cpio archive, an attacker could cause a denial of
service via application crash, or possibly execute code with the
privileges of the user invoking the program. (CVE-2007-4476)');
script_set_attribute(attribute:'solution', value: 'Upgrade to : 
- cpio-2.8-1ubuntu2.2 (Ubuntu 7.10)
');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_end_attributes();

script_cve_id("CVE-2007-4476");
exit(0);
}

include('ubuntu.inc');

if ( ! get_kb_item('Host/Ubuntu/release') ) exit(1, 'Could not gather the list of packages');

extrarep = NULL;

found = ubuntu_check(osver: "7.10", pkgname: "cpio", pkgver: "2.8-1ubuntu2.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package cpio-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to cpio-2.8-1ubuntu2.2
');
}

if (w) { security_hole(port: 0, extra: extrarep); }
else exit(0, "Host is not vulnerable");
