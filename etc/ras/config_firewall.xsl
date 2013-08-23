<?xml version="1.0" encoding="windows-1250"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ras="http://ras.lab">
  <xsl:output method="text" omit-xml-declaration="yes" />
  
  <xsl:template match="text()" />
  
  <xsl:template match="/"># /etc/init/firewall.conf

description "Mini-RAS Firewall Config"
author      "Rich Bayliss"
<xsl:apply-templates select="/config/firewall" />
  </xsl:template>

	<xsl:template match="/config/firewall">
start on starting networking
stop on stoping networking

script
	iptables -F
	iptables -X
	iptables -t nat -F
	iptables -t nat -X
	iptables -t mangle -F
	iptables -t mangle -X
	iptables -P INPUT ACCEPT
	iptables -P FORWARD ACCEPT
	iptables -P OUTPUT ACCEPT

	# configured rules
	<xsl:apply-templates select="rule" />
end script
	
	</xsl:template>
  
  <!-- firewall rules (iptables) -->
  <xsl:template match="config/firewall/rule[@chain]">
	<xsl:text>iptables</xsl:text>
	<xsl:if test="@table">
		<xsl:text> -t </xsl:text><xsl:value-of select="@table" />
	</xsl:if>
	<xsl:text> -A </xsl:text><xsl:value-of select="@chain" />  	
	<xsl:if test="protocol">
		<xsl:text> -p </xsl:text><xsl:value-of select="protocol" />
	</xsl:if>

	<xsl:if test="source">
		<xsl:call-template name="firewallEndpoint">
			<xsl:with-param name="endpoint">source</xsl:with-param>
			<xsl:with-param name="address">
				<xsl:value-of select="source/address"/>
			</xsl:with-param>
			<xsl:with-param name="port">
				<xsl:value-of select="source/port"/>
			</xsl:with-param>			
	  </xsl:call-template>
	</xsl:if>

	<xsl:if test="destination">
		<xsl:call-template name="firewallEndpoint">
			<xsl:with-param name="endpoint">destination</xsl:with-param>
			<xsl:with-param name="address">
				<xsl:value-of select="destination/address"/>
			</xsl:with-param>
			<xsl:with-param name="port">
				<xsl:value-of select="destination/port"/>
			</xsl:with-param>			
	  </xsl:call-template>
	</xsl:if>

	<xsl:if test="ingress">
		<xsl:text> -i </xsl:text><xsl:value-of select="ingress" />
	</xsl:if>
	<xsl:if test="egress">
		<xsl:text> -o </xsl:text><xsl:value-of select="egress" />
	</xsl:if>
	<xsl:if test="target">
		<xsl:text> -j </xsl:text><xsl:value-of select="translate(target, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
	</xsl:if>
	<xsl:text>&#10;</xsl:text>
  </xsl:template>
  
  <xsl:template name="firewallEndpoint">
  	<xsl:param name="endpoint" />
  	<xsl:param name="address" />
  	<xsl:param name="port" />
    <xsl:if test="$address != ''">    
  		<xsl:text> --</xsl:text><xsl:value-of select="$endpoint" /><xsl:text> </xsl:text><xsl:value-of select="$address" />
  	</xsl:if>
    <xsl:if test="$port != ''">    
  		<xsl:text> --</xsl:text><xsl:value-of select="$endpoint" /><xsl:text>-port </xsl:text><xsl:value-of select="$port" />
  	</xsl:if>    
  </xsl:template>
  
</xsl:stylesheet>