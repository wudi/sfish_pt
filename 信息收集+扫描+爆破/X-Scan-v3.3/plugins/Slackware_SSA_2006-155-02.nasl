# This script was automatically generated from the SSA-2006-155-02
# Slackware Security Advisory
# It is released under the Nessus Script Licence.
# Slackware Security Advisories are copyright 1999-2004 Slackware Linux, Inc.
# SSA2nasl Convertor is copyright 2004 Tenable Network Security, Inc.
# See http://www.slackware.com/about/ or http://www.slackware.com/security/
# Slackware(R) is a registered trademark of Slackware Linux, Inc.

if (! defined_func("bn_random")) exit(0);


include("compat.inc");

if (description) {
script_id(21640);
script_version("$Revision: 1.4 $");
script_category(ACT_GATHER_INFO);
script_family(english: "Slackware Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_copyright("This script is Copyright (C) 2006 Tenable Network Security, Inc.");
script_require_keys("Host/Slackware/release", "Host/Slackware/packages");
 script_set_attribute(attribute:"synopsis", value:
"The remote host is missing the SSA-2006-155-02 security update." );
 script_set_attribute(attribute:"description", value:
"New Firefox and Thunderbird packages are available for Slackware
10.2 and -current to fix security issues.  In addition, a new
Seamonkey package is available for Slackware -current to fix
similar issues.

More details about the issues may be found here:
  http://www.mozilla.org/projects/security/known-vulnerabilities.html#firefox
  http://www.mozilla.org/projects/security/known-vulnerabilities.html#thunderbird
  http://www.mozilla.org/projects/security/known-vulnerabilities.html#seamonkey" );
 script_set_attribute(attribute:"solution", value:
"Update the packages that are referenced in the security advisory." );
 script_set_attribute(attribute:"risk_factor", value:"High" );
script_end_attributes();


script_xref(name: "SSA", value: "2006-155-02");
script_summary("SSA-2006-155-02 firefox/thunderbird/seamonkey ");
name["english"] = "SSA-2006-155-02 firefox/thunderbird/seamonkey ";
script_name(english:name["english"]);
exit(0);
}

include('slackware.inc');
include('global_settings.inc');

desc="";
if (slackware_check(osver: "10.2", pkgname: "mozilla-firefox", pkgver: "1.5.0.4", pkgnum:  "1", pkgarch: "i686")) {
w++;
if (report_verbosity > 0) desc = strcat(desc, '
The package mozilla-firefox is vulnerable in Slackware 10.2
Upgrade to mozilla-firefox-1.5.0.4-i686-1 or newer.
');
}
if (slackware_check(osver: "10.2", pkgname: "mozilla-thunderbird", pkgver: "1.5.0.4", pkgnum:  "1", pkgarch: "i686")) {
w++;
if (report_verbosity > 0) desc = strcat(desc, '
The package mozilla-thunderbird is vulnerable in Slackware 10.2
Upgrade to mozilla-thunderbird-1.5.0.4-i686-1 or newer.
');
}
if (slackware_check(osver: "-current", pkgname: "mozilla-firefox", pkgver: "1.5.0.4", pkgnum:  "1", pkgarch: "i686")) {
w++;
if (report_verbosity > 0) desc = strcat(desc, '
The package mozilla-firefox is vulnerable in Slackware -current
Upgrade to mozilla-firefox-1.5.0.4-i686-1 or newer.
');
}
if (slackware_check(osver: "-current", pkgname: "mozilla-thunderbird", pkgver: "1.5.0.4", pkgnum:  "1", pkgarch: "i686")) {
w++;
if (report_verbosity > 0) desc = strcat(desc, '
The package mozilla-thunderbird is vulnerable in Slackware -current
Upgrade to mozilla-thunderbird-1.5.0.4-i686-1 or newer.
');
}
if (slackware_check(osver: "-current", pkgname: "seamonkey", pkgver: "1.0.2", pkgnum:  "1", pkgarch: "i486")) {
w++;
if (report_verbosity > 0) desc = strcat(desc, '
The package seamonkey is vulnerable in Slackware -current
Upgrade to seamonkey-1.0.2-i486-1 or newer.
');
}

if (w) { security_hole(port: 0, extra: desc); }
