#
# (C) Tenable Network Security, Inc.
#

# Ref:
# From: "dong-h0un yoU" <xploit@hackermail.com>
# To: vulnwatch@vulnwatch.org
# Date: Tue, 07 Jan 2003 16:59:11 +0800
# Subject: [VulnWatch] [INetCop Security Advisory] Remote format string vulnerability in
#    Tanne.


include("compat.inc");

if(description)
{
 script_id(11495);
 script_version ("$Revision: 1.11 $");
 script_cve_id("CVE-2003-1236");
 script_bugtraq_id(6553);
 script_xref(name:"OSVDB", value:"56913");
 
 script_name(english:"Tanne netzio.c logger Function Remote Format String");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote service is affected by a format string vulnerability." );
 script_set_attribute(attribute:"description", value:
"The remote tanned server contains a format string vulnerability.  An
attacker may use this flaw to gain a shell on this host." );
 script_set_attribute(attribute:"see_also", value:"http://archives.neohapsis.com/archives/vulnwatch/2003-q1/0011.html" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to tanned 0.7.1 or disable this service." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C" );
script_end_attributes();


 script_summary(english:"Sends a format string to the remote host");
 script_category(ACT_DESTRUCTIVE_ATTACK);
 script_copyright(english:"This script is Copyright (C) 2003-2009 Tenable Network Security, Inc.");
 script_family(english:"Gain a shell remotely");
 script_require_ports(14002, "Services/tanned");
 exit(0);
}

include("global_settings.inc");

if (report_paranoia < 2) exit(0);


port = get_kb_item("Services/tanned");
if(!port)port = 14002;
if(!get_port_state(port))exit(0);

soc = open_sock_tcp(port);
if(!soc)exit(0);

send(socket:soc, data:string("%d%d%d%d\r\n"));
r = recv_line(socket:soc, length:4096);
if("|F|" >< r)
{
  close(soc);
  soc = open_sock_tcp(port);
  if(!soc)exit(0);

  send(socket:soc, data:string("%n%n%n%n\r\n"));
  r = recv_line(socket:soc, length:4096);
  if(!r)security_hole(port);
}
