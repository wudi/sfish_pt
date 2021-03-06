#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
 script_id(16456);
 script_bugtraq_id(12545, 12543, 12572);
 script_cve_id("CVE-2005-0436", "CVE-2005-0437", "CVE-2005-0438");
 script_xref(name:"OSVDB", value:"13832");
 script_xref(name:"OSVDB", value:"13833");
 script_xref(name:"OSVDB", value:"13834");

 script_version("$Revision: 1.10 $");

 script_name(english:"AWStats Multiple Remote Vulnerabilities (Cmd Exec, Traversal, ID)");

 script_set_attribute(attribute:"synopsis", value:
"The remote host contains a CGI script that is affected by multiple
issues." );
 script_set_attribute(attribute:"description", value:
"The remote host is running AWStats, a free logfile analysis tool for
analyzing ftp, mail, web, ...  traffic. 

The remote version of this software is prone to a command execution
flaw as well as an information disclosure vulnerability.  An attacker
may exploit this feature to obtain more information about the setup of
the remote host or to execute arbitrary commands with the privileges
of the web server." );
 script_set_attribute(attribute:"solution", value:
"Unknown at this time." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );
script_end_attributes();

 
 summary["english"] = "Determines the presence of debug output in AWStats";

 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");
 script_family(english:"CGI abuses");
 
 script_dependencies("awstats_detect.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

function check(url)
{
 local_var r, res;
 global_var port;

 r = http_send_recv3(method:"GET", item:url +"/awstats.pl?debug=2", port:port);
 if (isnull(r)) exit(0);
 res = strcat(r[0], r[1], '\r\n', r[2]);
 if ( "DEBUG 2 - PluginMode=" >< res ) 
 {
        security_hole(port);
        exit(0);
 }
}

port = get_http_port(default:80);
if (get_kb_item("Services/www/"+port+"/embedded")) exit(0);


# Test an install.
install = get_kb_item(string("www/", port, "/AWStats"));
if (isnull(install)) exit(0);
matches = eregmatch(string:install, pattern:"^(.+) under (/.*)$");

if (!isnull(matches))
{
  dir = matches[2];
  check(url:dir);
}
