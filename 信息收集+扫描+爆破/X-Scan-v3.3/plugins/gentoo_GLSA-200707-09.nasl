# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200707-09.xml
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
 script_id(25791);
 script_version("$Revision: 1.4 $");
 script_xref(name: "GLSA", value: "200707-09");
 script_cve_id("CVE-2006-4519", "CVE-2007-2949");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200707-09 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200707-09
(GIMP: Multiple integer overflows)


    Sean Larsson from iDefense Labs discovered multiple integer overflows
    in various GIMP plugins (CVE-2006-4519). Stefan Cornelius from Secunia
    Research discovered an integer overflow in the
    seek_to_and_unpack_pixeldata() function when processing PSD files
    (CVE-2007-2949).
  
Impact

    A remote attacker could entice a user to open a specially crafted image
    file, possibly resulting in the execution of arbitrary code with the
    privileges of the user running GIMP.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All GIMP users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=media-gfx/gimp-2.2.16"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-4519');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-2949');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200707-09.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200707-09] GIMP: Multiple integer overflows');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'GIMP: Multiple integer overflows');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "media-gfx/gimp", unaffected: make_list("ge 2.2.16"), vulnerable: make_list("lt 2.2.16")
)) { security_warning(0); exit(0); }
exit(0, "Host is not affected");
