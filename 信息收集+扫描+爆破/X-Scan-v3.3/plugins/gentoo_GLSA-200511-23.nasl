# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200511-23.xml
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
 script_id(20267);
 script_version("$Revision: 1.5 $");
 script_xref(name: "GLSA", value: "200511-23");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200511-23 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200511-23
(chmlib, KchmViewer: Stack-based buffer overflow)


    Sven Tantau reported about a buffer overflow vulnerability in
    chmlib. The function "_chm_decompress_block()" does not properly
    perform boundary checking, resulting in a stack-based buffer overflow.
  
Impact

    By convincing a user to open a specially crafted ITSS or CHM file,
    using KchmViewer or a program makes use of chmlib, a remote attacker
    could execute arbitrary code with the privileges of the user running
    the software.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All chmlib users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=dev-libs/chmlib-0.37.4"
    All KchmViewer users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=app-text/kchmviewer-1.1"
  ');
script_set_attribute(attribute: 'risk_factor', value: 'Medium');
script_set_attribute(attribute: 'see_also', value: 'http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2005-3318');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200511-23.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200511-23] chmlib, KchmViewer: Stack-based buffer overflow');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'chmlib, KchmViewer: Stack-based buffer overflow');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "app-text/kchmviewer", unaffected: make_list("ge 1.1"), vulnerable: make_list("lt 1.1")
)) { security_warning(0); exit(0); }
if (qpkg_check(package: "dev-libs/chmlib", unaffected: make_list("ge 0.37.4"), vulnerable: make_list("lt 0.37.4")
)) { security_warning(0); exit(0); }
exit(0, "Host is not affected");
