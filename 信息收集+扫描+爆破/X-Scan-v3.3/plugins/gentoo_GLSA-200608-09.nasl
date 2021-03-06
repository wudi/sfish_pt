# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200608-09.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2006 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description)
{
 script_id(22167);
 script_version("$Revision: 1.4 $");
 script_xref(name: "GLSA", value: "200608-09");
 script_cve_id("CVE-2006-3469");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200608-09 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200608-09
(MySQL: Denial of Service)


    Jean-David Maillefer discovered a format string vulnerability in
    time.cc where MySQL fails to properly handle specially formatted user
    input to the date_format function.
  
Impact

    By specifying a format string as the first parameter to the date_format
    function, an authenticated attacker could cause MySQL to crash,
    resulting in a Denial of Service.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All MySQL users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --verbose --oneshot ">=dev-db/mysql-4.1.21"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:S/C:N/I:N/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-3469');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200608-09.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200608-09] MySQL: Denial of Service');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'MySQL: Denial of Service');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "dev-db/mysql", unaffected: make_list("ge 4.1.21", "lt 4.1.0"), vulnerable: make_list("lt 4.1.21")
)) { security_warning(0); exit(0); }
exit(0, "Host is not affected");
