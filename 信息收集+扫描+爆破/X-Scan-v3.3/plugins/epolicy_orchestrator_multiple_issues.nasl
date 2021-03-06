# 
# (C) Tenable Network Security, Inc.
#


include("compat.inc");


if(description)
{
 script_id(11812);
 script_bugtraq_id(8316, 8318, 8319);
 script_version ("$Revision: 1.14 $");
 script_cve_id("CVE-2003-0148", "CVE-2003-0149", "CVE-2003-0616");
 script_xref(name:"OSVDB", value:"2351");
 script_xref(name:"OSVDB", value:"5636");
 script_xref(name:"OSVDB", value:"5637");

 script_name(english:"ePolicy Orchestrator Multiple Remote Vulnerabilities (OF, FS)");
 script_summary(english:"ePolicy Orchestrator vulnerable to several issues");
 
 script_set_attribute(
   attribute:"synopsis",
   value:"The remote web server has multiple vulnerabilities."
 );
 script_set_attribute(
   attribute:"description", 
   value:string(
     "According to its banner, the remote version of ePolicy Orchestrator\n",
     "has multiple vulnerabilities which may allow an attacker to gain\n",
     "information on the MSDE installation of this host, or even execute\n",
     "arbitrary code."
   )
 );
 script_set_attribute(
   attribute:"solution", 
   value:"Upgrade to the latest version of this software."
 );
 script_set_attribute(
   attribute:"cvss_vector", 
   value:"CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C"
 );
 script_end_attributes();

 script_category(ACT_GATHER_INFO);
 script_family(english:"Web Servers");

 script_copyright(english:"This script is Copyright (C) 2003-2009 Tenable Network Security, Inc.");

 script_require_ports("Services/www", 8081);
 script_dependencie("find_service1.nasl", "httpver.nasl", "http_version.nasl");

 exit(0);
}


include("global_settings.inc");
include("misc_func.inc");
include("http.inc");


function check(port)
{
 local_var banner, req, res;
 
 if ( get_kb_item("Services/www/" + port + "/broken") ) return 0;
 banner = get_http_banner(port:port);
 if ( ! banner || "Server: Spipe/1.0" >!< banner ) return 0;

 res = http_send_recv3(method:"GET", item:"/SERVER.INI", port:port);
 if (isnull(res)) exit(0);

 if(("DataSource" >< res && "AgentHttpPort" >< res && "MaxHttpConnection" >< res) ||
   ("Server: Spipe/1.0" >< res && "MIME-version: 1.0" >< res))
 {
  security_hole(port);
 }

 return(0);
}


#
# Execution begins here
#
ports = add_port_in_list(list:get_kb_list("Services/www"), port:8081);
foreach port (ports)
{
 if ( get_port_state(port) ) check(port:port);
}
