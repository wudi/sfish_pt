#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if (description) {
  script_id(17309);
  script_version("$Revision: 1.9 $");

  script_cve_id("CVE-2005-0735");
  script_bugtraq_id(12761);
  script_xref(name:"OSVDB", value:"15731");

  script_name(english:"NewsScript newsscript.pl mode Parameter Privilege Escalation");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a CGI application that is affected by an
access validation vulnerability." );
 script_set_attribute(attribute:"description", value:
"The remote host is running a version of NewsScript.co.uk's NewsScript
that allows a remote attacker to bypass authentication simply by setting
the 'mode' parameter to 'admin', thereby allowing him to add, delete, or
modify news stories and headlines at will." );
 script_set_attribute(attribute:"see_also", value:"http://www.nessus.org/u?85aba152" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to a version of NewsScript released on or after March 22, 2005." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:P/A:P" );
script_end_attributes();

 
  summary["english"] = "Checks for access validation vulnerability in NewsScript";
  script_summary(english:summary["english"]);
 
  script_category(ACT_ATTACK);
  script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");

  family["english"] = "CGI abuses";
  script_family(english:family["english"]);

  script_dependencies("http_version.nasl");
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_require_ports("Services/www", 80);

  exit(0);
}


include("global_settings.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");


port = get_http_port(default:80);
if (get_kb_item("Services/www/"+port+"/embedded")) exit(0);


# Loop through directories.
if (thorough_tests) dirs = list_uniq(make_list("/news", cgi_dirs()));
else dirs = make_list(cgi_dirs());

foreach dir (dirs) {
  # Let's try the exploit.
  req = http_get(item:string(dir, "/newsscript.pl?mode=admin"), port:port);
  res = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);
  if (isnull(res)) exit(0);

  # If the results have a link to add a record, there's a problem.
  if (
    "?mode=admin&action=add" >< res &&
    egrep(string:res, pattern:"<a href=[^>]+/newsscript.pl\\?mode=admin&action=add")
  ) {
    security_warning(port);
    exit(0);
  }
}
