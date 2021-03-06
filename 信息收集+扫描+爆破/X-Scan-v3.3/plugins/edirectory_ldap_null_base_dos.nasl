#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if (description)
{
  script_id(42412);
  script_version("$Revision: 1.2 $");

  script_cve_id("CVE-2009-3862");
  script_bugtraq_id(36902);
  script_xref(name:"OSVDB", value:"59722");

  script_name(english:"Novell eDirectory < 8.8.5 ftf1/8.7.3.10 ftf2 NULL Base DN DoS");
  script_summary(english:"Checks version from an ldap search");
 
  script_set_attribute(attribute:"synopsis", value:
"The remote directory service is affected by a denial of service
vulnerability." );
  script_set_attribute(attribute:"description", value:
"The remote host is running eDirectory, a directory service software
from Novell. 

The installed version of eDirectory is affected by a denial of service
issue. By sending a search request with an undefined BaseDN, it may be
possible for an attacker to make the directory server unresponsive." );
  script_set_attribute(attribute:"see_also", value:"http://www.zerodayinitiative.com/advisories/ZDI-09-075/" );
  script_set_attribute(attribute:"see_also", value:"http://www.novell.com/support/viewContent.do?externalId=7004721" );
  script_set_attribute(attribute:"solution", value:
"Upgrade to eDirectory 8.8.5 ftf1 / 8.7.3.10 ftf2 or later." );
  script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P" );

  script_set_attribute(attribute:"vuln_publication_date", value:"2009/11/02");
  script_set_attribute(attribute:"patch_publication_date", value:"2009/10/21");
  script_set_attribute(attribute:"plugin_publication_date",value:"2009/11/06");
  script_end_attributes();
 
  script_category(ACT_GATHER_INFO);
  script_family(english:"Denial of Service");
  script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");

  script_dependencies("ldap_search.nasl");
  script_require_ports("Services/ldap", 389);

  exit(0);
}

include("global_settings.inc");

ldap_port = get_kb_item("Services/ldap");
if(isnull(ldap_port)) 
  ldap_port = 389;

if (!get_port_state(ldap_port)) exit(1,"Port "+ ldap_port + " is not open.");

edir_ldap = get_kb_item(string("LDAP/",ldap_port,"/vendorVersion"));

if(isnull(edir_ldap)) 
  exit(1,"The 'KB LDAP/"+ldap_port+"/vendorVersion' KB item is missing.");

if("Novell eDirectory" >< edir_ldap)
{
  edir_product = strstr(edir_ldap,"Novell eDirectory");
  edir_product = edir_product - strstr(edir_product , "(");
}
else
  exit(0,"The remote directory service does not appear to be from Novell.");

info = NULL;

if ("Novell eDirectory 8.8" >< edir_ldap)
{
 # KB entries
 # LDAP Agent for Novell eDirectory 8.8 SP5 (20219.14) - unpatched
 # LDAP Agent for Novell eDirectory 8.8 SP5 (20501.00) - patched
 
 if(ereg(pattern:"^LDAP Agent for Novell eDirectory 8.8 *SP[0-4][^0-9]",string:edir_ldap) || 
    ereg(pattern:"^LDAP Agent for Novell eDirectory 8.8 *\(([0-9]+)\.([0-9]+)\)$",string:edir_ldap))
    info = string(" ",edir_product," is installed on the remote host.\n");

 else if (ereg(pattern:"LDAP Agent for Novell eDirectory 8.8 SP5",string:edir_ldap))
  { 
    build = NULL;
    matches = eregmatch(pattern:"^LDAP Agent for Novell eDirectory 8.8 *SP5 *\(([0-9]+)\.([0-9]+)\)$",string:edir_ldap);
    build = matches[1];

    if(isnull(build) || int(build) < 20501) 
      info = string(" ",edir_product," is installed on the remote host.\n");
  } 
}
else if ("LDAP Agent for Novell eDirectory 8.7.3.10 " >< edir_ldap)
{
  build = rev = NULL;
  matches = eregmatch(pattern:"^LDAP Agent for Novell eDirectory 8.7.3.10 *\(([0-9]+)\.([0-9]+)\)$",string:edir_ldap);
  build = matches[1];
  rev = matches[2];

  if((isnull(build) || (int(build) < 10557) ) ||
     (int(build) == 10557 && isnull(rev)) || 
     (int(build) == 10557 && int(rev) < 28) 
    )
   info = string(" ",edir_product," is installed on the remote host.\n");
}
else if (ereg(pattern:"^LDAP Agent for Novell eDirectory ([0-7]\.|8\.([0-6][^0-9]|7\.([0-2]|3[^.0-9]|3\.[0-9][^0-9])))",string:edir_ldap))
  info = string(" ",edir_product," is installed on the remote host.\n");

if(!isnull(info))
{
  if (report_verbosity > 0)
  {       
    report = string(
      "\n",
      info
    );
    security_warning(port:ldap_port, extra:report);
  }
  else security_warning(ldap_port);
}
else exit(0, "The installed version of Novell eDirectory "+ edir_product + " is not vulnerable." );
