<?xml version="1.0" encoding="windows-1250"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ras="http://ras.lab">
  <xsl:output method="text" omit-xml-declaration="yes" />
  
  <xsl:template match="text()" />

  <xsl:template match="/config/services">
#############################
# AUTO-GENERATED - DO NOT CHANGE
#############################
domain-needed
local=/labnet/
resolv-file=/etc/resolv.dnsmasq


# dns server
<xsl:apply-templates select="dns-server" />
# dhcp server
<xsl:apply-templates select="dhcp-server" />
  </xsl:template>
  
  <xsl:template match="/config/services/dhcp-server">
  	<xsl:apply-templates select="listenOn" />
  </xsl:template>
  
  <xsl:template match="/config/services/dhcp-server/listenOn[@interface]">
  	<xsl:text>dhcp-range=</xsl:text>
  	<xsl:value-of select="@interface" /><xsl:text>,</xsl:text>
  	<xsl:value-of select="range/@start" /><xsl:text>,</xsl:text>
  	<xsl:value-of select="range/@end" />
  	
  	<xsl:apply-templates select="range/leaseTime" />
  	<xsl:text>&#10;</xsl:text>
  	
  	<xsl:apply-templates select="range/option" />
  	
  </xsl:template>
  
  <xsl:template match="/config/services/dhcp-server/listenOn/range/option">
  	<xsl:text>dhcp-option=</xsl:text><xsl:value-of select="../../@interface" />
  	<xsl:text>,</xsl:text><xsl:value-of select="@id" />
  	<xsl:text>,</xsl:text><xsl:value-of select="." />
  	<xsl:text>&#10;</xsl:text>
  </xsl:template>
  
  <xsl:template match="/config/services/dhcp-server/listenOn/range/*">
  	<xsl:text>,</xsl:text><xsl:value-of select="." />
  </xsl:template>

</xsl:stylesheet>