# This script was automatically generated from the dsa-1307
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(25506);
 script_version("$Revision: 1.5 $");
 script_xref(name: "DSA", value: "1307");
 script_cve_id("CVE-2007-0245");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1307 security update');
 script_set_attribute(attribute: 'description', value:
'John Heasman discovered a heap overflow in the routines of OpenOffice.org
that parse RTF files.  A specially crafted RTF file could cause the
filter to overwrite data on the heap, which may lead to the execution
of arbitrary code.
For the old stable distribution (sarge) this problem has been fixed in
version 1.1.3-9sarge7.
For the stable distribution (etch) this problem has been fixed in
version 2.0.4.dfsg.2-7etch1.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2007/dsa-1307');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your openoffice.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1307] DSA-1307-1 openoffice.org");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1307-1 openoffice.org");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'openoffice.org', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-bin', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-dev', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-evolution', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-gtk-gnome', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-kde', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-af', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-ar', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-ca', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-cs', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-cy', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-da', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-de', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-el', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-en', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-es', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-et', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-eu', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-fi', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-fr', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-gl', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-he', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-hi', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-hu', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-it', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-ja', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-kn', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-ko', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-lt', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-nb', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-nl', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-nn', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-ns', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-pl', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-pt', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-pt-br', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-ru', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-sk', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-sl', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-sv', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-th', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-tn', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-tr', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-zh-cn', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-zh-tw', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-l10n-zu', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-mimelnk', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'openoffice.org-thesaurus-en-us', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'ttf-opensymbol', release: '3.1', reference: '1.1.3-9sarge7');
deb_check(prefix: 'broffice.org', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'libmythes-dev', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-base', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-calc', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-common', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-core', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-dbg', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-dev', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-dev-doc', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-draw', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-dtd-officedocument1.0', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-evolution', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-filter-mobiledev', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-filter-so52', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-gcj', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-gnome', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-gtk', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-gtk-gnome', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-cs', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-da', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-de', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-dz', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-en', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-en-gb', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-en-us', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-es', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-et', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-fr', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-hi-in', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-hu', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-it', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-ja', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-km', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-ko', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-nl', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-pl', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-pt-br', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-ru', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-sl', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-sv', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-zh-cn', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-help-zh-tw', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-impress', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-java-common', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-kde', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-af', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-as-in', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-be-by', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-bg', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-bn', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-br', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-bs', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-ca', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-cs', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-cy', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-da', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-de', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-dz', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-el', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-en-gb', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-en-za', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-eo', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-es', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-et', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-fa', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-fi', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-fr', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-ga', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-gu-in', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-he', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-hi', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-hi-in', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-hr', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-hu', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-in', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-it', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-ja', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-ka', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-km', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-ko', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-ku', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-lo', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-lt', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-lv', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-mk', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-ml-in', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-nb', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-ne', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-nl', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-nn', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-nr', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-ns', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-or-in', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-pa-in', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-pl', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-pt', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-pt-br', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-ru', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-rw', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-sk', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-sl', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-sr-cs', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-ss', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-st', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-sv', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-ta-in', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-te-in', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-tg', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-th', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-tn', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-tr', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-ts', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-uk', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-ve', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-vi', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-xh', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-za', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-zh-cn', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-zh-tw', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-l10n-zu', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-math', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-officebean', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-qa-api-tests', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-qa-tools', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'openoffice.org-writer', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'python-uno', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
deb_check(prefix: 'ttf-opensymbol', release: '4.0', reference: '2.0.4.dfsg.2-7etch1');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
