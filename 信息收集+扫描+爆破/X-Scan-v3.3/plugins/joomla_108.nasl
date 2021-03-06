#
# (C) Tenable Network Security
#



include("compat.inc");

if (description)
{
  script_id(21143);
  script_version("$Revision: 1.7 $");

  script_cve_id(
    "CVE-2006-1027", 
    "CVE-2006-1028", 
    "CVE-2006-1029", 
    "CVE-2006-1030", 
    "CVE-2006-1047", 
    "CVE-2006-1048", 
    "CVE-2006-1049"
  );
  if (defined_func("script_xref"))
  {
    script_xref(name:"OSVDB", value:"23815");
    script_xref(name:"OSVDB", value:"23816");
    script_xref(name:"OSVDB", value:"23817");
    script_xref(name:"OSVDB", value:"23818");
    script_xref(name:"OSVDB", value:"23819");
    script_xref(name:"OSVDB", value:"23820");
    script_xref(name:"OSVDB", value:"23821");
    script_xref(name:"OSVDB", value:"23822");
  }

  script_name(english:"Joomla! < 1.0.8 Multiple Vulnerabilities");
  script_summary(english:"Checks for path disclosure issue in Joomla!");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a PHP application that is affected by
multiple vulnerabilities." );
 script_set_attribute(attribute:"description", value:
"The version of Joomla! installed on the remote host reportedly can be
used to launch a denial of service attack against the web server
hosting the affected application and is affected by multiple
unspecified SQL injection flaws in its administration section as well
as information disclosure vulnerabilities." );
 script_set_attribute(attribute:"see_also", value:"http://www.securityfocus.com/archive/1/426538" );
 script_set_attribute(attribute:"see_also", value:"http://www.joomla.org/content/view/938/78/" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to Joomla! 1.0.8 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C" );
script_end_attributes();


  script_category(ACT_ATTACK);
  script_family(english:"CGI abuses");

  script_copyright(english:"This script is Copyright (C) 2006-2009 Tenable Network Security, Inc.");

  script_dependencies("joomla_detect.nasl");
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_require_ports("Services/www", 80);

  exit(0);
}


include("global_settings.inc");
include("http_func.inc");
include("http_keepalive.inc");


port = get_http_port(default:80);
if (!get_port_state(port)) exit(0);
if (!can_host_php(port:port)) exit(0);


# Test an install.
install = get_kb_item(string("www/", port, "/joomla"));
if (isnull(install)) exit(0);
matches = eregmatch(string:install, pattern:"^(.+) under (/.*)$");
if (!isnull(matches))
{
  dir = matches[2];

  # Try to get the full path.
  req = http_get(
    item:string(
      dir, "/index.php?",
      "option=com_rss&",
      # nb: the trailing slash prevents a file from being created in 
      #     Joomla's cache directory.
      "feed=", SCRIPT_NAME, "/&",
      "no_html=1"
    ), 
    port:port
  );
  res = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);
  if (res == NULL) exit(0);

  # There's a problem if the file can't be created.
  #
  # nb: 1.0.8 reports "You are not authorized to view this resource."
  if ("Error creating feed file, please check write permissions" >< res)
  {
    security_hole(port);
    set_kb_item(name: 'www/'+port+'/SQLInjection', value: TRUE);
  }
}
