#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if (description)
{
  script_id(31407);
  script_version("$Revision: 1.8 $");

  script_cve_id("CVE-2007-5000","CVE-2007-6203","CVE-2007-6388","CVE-2008-0005");
  script_bugtraq_id(26663, 26838, 27234, 27237);
  script_xref(name:"OSVDB", value:"39003");
  script_xref(name:"OSVDB", value:"39134");
  script_xref(name:"OSVDB", value:"40262");
  script_xref(name:"OSVDB", value:"42214");

  script_name(english:"Apache < 2.0.63 Multiple XSS Vulnerabilities");
  script_summary(english:"Checks version in Server response header");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server may be affected by several issues." );
 script_set_attribute(attribute:"description", value:
"According to its banner, the version of Apache 2.0 installed on the
remote host is older than 2.0.63.  Such versions may be affected by
several issues, including :

  - A cross-site scripting issue involving mod_imap.
    (CVE-2007-5000)

  - A cross-site scripting issue involving 413 error pages
    via a malformed HTTP method. (PR 44014 / CVE-2007-6203)

  - A cross-site scripting issue in mod_status involving the
    refresh parameter. (CVE-2007-6388)

  - A cross-site scripting issue using UTF-7 encoding in 
    mod_proxy_ftp exists because it does not define a
    charset. (CVE-2008-0005)

Note that the remote web server may not actually be affected by these
vulnerabilities.  Nessus did not try to determine whether the affected
modules are in use or to check for the issues themselves." );
 script_set_attribute(attribute:"see_also", value:"http://www.apache.org/dist/httpd/CHANGES_2.0.63" );
 script_set_attribute(attribute:"see_also", value:"http://httpd.apache.org/security/vulnerabilities_20.html" );
 script_set_attribute(attribute:"solution", value:
"Either ensure that the affected modules are not in use or upgrade to
Apache version 2.0.63 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N" );
script_end_attributes();

 
  script_category(ACT_GATHER_INFO);
  script_family(english:"Web Servers");

  script_copyright(english:"This script is Copyright (C) 2008-2009 Tenable Network Security, Inc.");

  script_dependencies("http_version.nasl");
  script_require_keys("www/apache");
  script_require_ports("Services/www", 80);

  exit(0);
}


include("global_settings.inc");
include("misc_func.inc");
include("http.inc");
include("backport.inc");


port = get_http_port(default:80);

banner = get_backport_banner(banner:get_http_banner(port:port));
if (banner && "Server:" >< banner)
{
  if ( report_paranoia < 2 && backported ) exit(0);
  server = strstr(banner, "Server:");

  pat = "^Server:.*Apache(-AdvancedExtranetServer)?/([0-9]+\.[^ ]+)";
  ver = NULL;
  matches = egrep(pattern:pat, string:server);
  if (matches)
  {
    foreach match (split(matches))
    {
      match = chomp(match);
      ver = eregmatch(pattern:pat, string:match);
      if (!isnull(ver))
      {
        ver = ver[2];
        break;
      }
    }
  }

  # nb: the vulnerabilities were actually fixed in 2.0.62, although
  #     the changelog reports that version was not released.
  if (!isnull(ver) && ver =~ "^2\.0\.([0-5][0-9]|6[01])($|[^0-9])")
  {
    if (report_verbosity)
    {
      report = string(
        "\n",
        "According to its banner, Apache version ", ver, " is installed on the\n",
        "remote host.\n"
      );
      security_warning(port:port, extra:report);
    }
    else security_warning(port);
    set_kb_item(name: 'www/'+port+'/XSS', value: TRUE);
  }
}
