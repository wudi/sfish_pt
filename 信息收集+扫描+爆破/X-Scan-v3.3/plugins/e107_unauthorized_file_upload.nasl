# @DEPRECATED@
#
# Disabled on 2004/12/29. Deprecated until version detection fixed.
exit(0); 


#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
 script_id(16061);
 script_version("$Revision: 1.11 $");
 script_cve_id("CVE-2004-2262");
 script_bugtraq_id(12111);
 script_xref(name:"OSVDB", value:"12586");

 script_name(english:"e107 Image Manager Unauthorized File Upload");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a PHP application that is prone to
arbitrary PHP code execution." );
 script_set_attribute(attribute:"description", value:
"There is a flaw in the remote version of e107 that may allow certain
users to upload arbitrary files on the remote host.  An attacker may
exploit this flaw to upload a PHP file to the remote host containing
arbitrary commands and have the remote web server execute it when
attempting to display it." );
 script_set_attribute(attribute:"see_also", value:"http://www.milw0rm.com/id.php?id=704" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to e107 0.617 or newer." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );

script_end_attributes();

 
 summary["english"] = "e107 flaw";
 
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2004-2009 Tenable Network Security, Inc.");
 script_family(english:"CGI abuses");
 script_dependencie("e107_detect.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

# Check starts here

include("http_func.inc");
include("http_keepalive.inc");


port = get_http_port(default:80);

if(!get_port_state(port))exit(0);
if( ! can_host_php(port:port) ) exit(0);

# Test an install.
install = get_kb_item(string("www/", port, "/e107"));
if (isnull(install)) exit(0);
matches = eregmatch(string:install, pattern:"^(.+) under (/.*)$");
if (!isnull(matches)) {
  # nb: the detection script doesn't have a way to identify the version number.
  ver = matches[1]; 
  dir = matches[2];

  if ( ereg(pattern:"^0\.([0-5]|60|61[0-6]\.)", string:ver) )
	{
	 security_hole(port);
	 exit(0);
	}
}
