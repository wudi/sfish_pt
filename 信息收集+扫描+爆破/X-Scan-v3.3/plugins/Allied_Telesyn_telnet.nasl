#
#
# This script was written by Charles Thier <cthier@thethiers.net>
#
# GPLv2
#

include("compat.inc");

if(description)
{
    script_id(18414);
    script_version("$Revision: 1.8 $");
    script_cve_id("CVE-1999-0508");
    script_name(english:"Allied Telesyn Router/Switch Default Password");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote network device can be accessed with default credentials." );
 script_set_attribute(attribute:"description", value:
"The remote device appears to be an Allied Telesyn router or switch
that can be accessed using default credentials.  An attacker could
leverage this issue to gain administrative access to the affected
device.  This password could also be potentially used to gain other
sensitive information about the network from the device." );
 script_set_attribute(attribute:"see_also", value:"http://www.phenoelit-us.org/dpl/dpl.html" );
 script_set_attribute(attribute:"solution", value:
"Telnet to the device and change the default password." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C" );
 script_end_attributes();

 
   summary["english"] = "Logs into Allied Telesyn routers and switches with default password";
   script_summary(english:summary["english"]);
 
   script_category(ACT_GATHER_INFO);
 
   script_copyright(english:"This script is Copyright (C) 2005-2009 Charles Thier");
   script_family(english:"Misc.");
   script_require_ports(23);
 
   exit(0);
}


#
# The script code starts here
#

include("telnet_func.inc");
usrname = "manager";
password = "friend";

port = 23;
if(get_port_state(port))
{
        tnb = get_telnet_banner(port:port);
        if ( ! tnb ) exit(0);

        if ("TELNET session" >< tnb)
        {
                soc = open_sock_tcp(port);
                if(soc)
                {
                        answer = recv(socket:soc, length:4096);
                        if("ogin:" >< answer)
                        {
                                send(socket:soc, data:string(usrname, "\r\n"));
                                answer = recv(socket:soc, length:4096);
                                send(socket:soc, data:string(password, "\r\n"));
                                answer = recv(socket:soc, length:4096);
                                if("Manager" >< answer)
                                {
                                  report = string(
                                    "\n",
                                    "Nessus was able to gain access using the following credentials :\n",
                                    "\n",
                                    "  User     : ", usrname, "\n",
                                    "  Password : ", password, "\n"
                                  );
                                  security_hole(port:port, extra:report);
                                }
                        }
                close(soc);
                }

        }
}

