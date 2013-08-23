<?xml version="1.0" encoding="windows-1250"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ras="http://ras.lab">
  <xsl:output method="text" omit-xml-declaration="yes" />
  
  <xsl:template match="text()" />
  
  <xsl:template match="/config/interfaces">
  	<xsl:text>auto lo&#10;</xsl:text>
  	<xsl:text>iface lo inet loopback&#10;</xsl:text>
  	<xsl:text>&#10;</xsl:text>
  	
  	<xsl:apply-templates select="interface"/>
  	<xsl:apply-templates select="vlan"/>
  	<xsl:apply-templates select="bridge"/>
  	
  	<xsl:text>source /etc/network/interfaces.user&#10;</xsl:text>
  	<xsl:text>&#10;</xsl:text>
  	
  </xsl:template>
  
  <!-- Bridging -->
  <xsl:template match="/config/interfaces/bridge[@name]/ports">
  	<xsl:text>&#x9;bridge_ports </xsl:text>
  	<xsl:apply-templates select="port" />
  	<xsl:text>&#10;</xsl:text>
  </xsl:template>
  <xsl:template match="/config/interfaces/bridge[@name]/ports/port">
  	<xsl:value-of select="@name" /><xsl:text> </xsl:text>
  </xsl:template>
  
  <xsl:template match="/config/interfaces/*">
    <xsl:text>auto </xsl:text><xsl:value-of select="@name" /><xsl:text>&#10;</xsl:text>
  	<xsl:text>iface </xsl:text><xsl:value-of select="@name" /><xsl:text> inet manual&#10;</xsl:text>
	<xsl:apply-templates />
  	<xsl:text>&#10;</xsl:text>
  </xsl:template>
  
  <xsl:template match="/config/interfaces/interface[not(ipv4)]">
    <xsl:text>auto </xsl:text><xsl:value-of select="@name" /><xsl:text>&#10;</xsl:text>
  	<xsl:text>iface </xsl:text><xsl:value-of select="@name" /><xsl:text> inet manual&#10;</xsl:text>
  	<xsl:text>&#x9;pre-up ifconfig </xsl:text><xsl:value-of select="@name" /><xsl:text> up&#10;</xsl:text>
	<xsl:text>&#x9;pre-down ifconfig </xsl:text><xsl:value-of select="@name" /><xsl:text> down&#10;</xsl:text>
  	<xsl:apply-templates />
  	<xsl:text>&#10;</xsl:text>
  </xsl:template>
  
  <!-- IPv4 DHCP Mode -->
  <xsl:template match="/config/interfaces/*[ipv4]">
    <xsl:text>auto </xsl:text><xsl:value-of select="@name" /><xsl:text>&#10;</xsl:text>
  	<xsl:text>iface </xsl:text><xsl:value-of select="@name" /><xsl:text> inet dhcp&#10;</xsl:text>
  	<xsl:apply-templates />
  	<xsl:text>&#10;</xsl:text>
  </xsl:template>
  
  <!-- IPv4 Static IP Mode -->
  <xsl:template match="/config/interfaces/*[ipv4/address]">
    <xsl:text>auto </xsl:text><xsl:value-of select="@name" /><xsl:text>&#10;</xsl:text>
  	<xsl:text>iface </xsl:text><xsl:value-of select="@name" /><xsl:text> inet static&#10;</xsl:text>
  	<xsl:text>&#x9;address </xsl:text><xsl:value-of select="ipv4/address" /><xsl:text>&#10;</xsl:text>
  	<xsl:text>&#x9;netmask </xsl:text><xsl:value-of select="ipv4/netmask" /><xsl:text>&#10;</xsl:text>
  	<xsl:apply-templates /> 	
  	<xsl:text>&#10;</xsl:text>
  </xsl:template>
  
  <!-- Interface Routing -->
  <xsl:template match="/config/interfaces/*/route[@next-hop][@dest]">
  	<xsl:text>&#x9;up route add -net </xsl:text><xsl:value-of select="@dest" /><xsl:text> gw </xsl:text><xsl:value-of select="@next-hop" /><xsl:text>&#10;</xsl:text>
  </xsl:template>
  
</xsl:stylesheet>

