# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200806-02.xml
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
 script_id(33085);
 script_version("$Revision: 1.5 $");
 script_xref(name: "GLSA", value: "200806-02");
 script_cve_id("CVE-2008-1767");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200806-02 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200806-02
(libxslt: Execution of arbitrary code)


    Anthony de Almeida Lopes reported a vulnerability in libxslt when
    handling XSL style-sheet files, which could be exploited to trigger the
    use of uninitialized memory, e.g. in a call to "free()".
  
Impact

    A remote attacker could entice a user or automated system to process an
    XML file using a specially crafted XSL transformation file, possibly
    resulting in the execution of arbitrary code or a Denial of Service.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All libxslt users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=dev-libs/libxslt-1.1.24"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-1767');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200806-02.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200806-02] libxslt: Execution of arbitrary code');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'libxslt: Execution of arbitrary code');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "dev-libs/libxslt", unaffected: make_list("ge 1.1.24"), vulnerable: make_list("lt 1.1.24")
)) { security_hole(0); exit(0); }
exit(0, "Host is not affected");
