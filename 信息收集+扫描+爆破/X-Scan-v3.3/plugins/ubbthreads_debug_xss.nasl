#
# (C) Tenable Network Security
#


include("compat.inc");

if (description)
{
  script_id(21618);
  script_version("$Revision: 1.9 $");

  script_cve_id("CVE-2006-2755");
  script_bugtraq_id(18152);
  script_xref(name:"OSVDB", value:"26120");

  script_name(english:"UBB.threads ubbthreads.php debug Parameter XSS");
  script_summary(english:"Tries to exploit an XSS flaw in UBB.threads");

 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a PHP script that is affected by a
cross- site scripting vulnerability." );
 script_set_attribute(attribute:"description", value:
"The version of UBB.threads installed on the remote host fails to
sanitize input to the 'debug' parameter before using it in the
'ubbthreads.php' script for dynamically-generated content.  Regardless
of any PHP settings, an unauthenticated attacker may be able to
exploit this flaw to inject arbitrary HTML and script code in a user's
browser in the context of the affected web site, resulting in theft of
authentication data or other such attacks." );
 script_set_attribute(attribute:"see_also", value:"http://www.securityfocus.com/archive/1/435288/30/0/threaded" );
 script_set_attribute(attribute:"see_also", value:"http://www.securityfocus.com/archive/1/435296/30/0/threaded" );
 script_set_attribute(attribute:"solution", value:
"Unknown at this time." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:P/I:N/A:N" );
script_end_attributes();


  script_category(ACT_ATTACK);
  script_family(english:"CGI abuses : XSS");

  script_copyright(english:"This script is Copyright (C) 2006-2009 Tenable Network Security, Inc.");

  script_dependencies("ubbthreads_detect.nasl", "cross_site_scripting.nasl");
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_require_ports("Services/www", 80);

  exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");
include("url_func.inc");

port = get_http_port(default:80);
if (!can_host_php(port:port)) exit(0);
if (get_kb_item("www/" + port + "/generic_xss")) exit(0);


# A simple alert.
xss = string('<script>alert("', SCRIPT_NAME, '")</script>');
# nb: the url-encoded version is what we need to pass in.
exss = urlencode(str:xss);


# Test an install.
install = get_kb_item(string("www/", port, "/ubbthreads"));
if (isnull(install)) exit(0);
matches = eregmatch(string:install, pattern:"^(.+) under (/.*)$");
if (!isnull(matches)) {
  dir = matches[2];

  # Try to exploit the flaw to read a file.
  r = http_send_recv3(method:"GET", port: port,
    item:string(dir, "/ubbthreads.php?", "debug=", exss));
  if (isnull(r)) exit(0);
  res = r[2];

  # There's a problem if we see our XSS.
  if (string(xss, "</body>") >< res)
  {
    security_warning(port);
    set_kb_item(name: 'www/'+port+'/XSS', value: TRUE);
    exit(0);
  }
}
