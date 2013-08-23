<?xml version="1.0" encoding="windows-1250"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ras="http://ras.lab">
  <xsl:output method="text" omit-xml-declaration="yes" />   
  
  <!-- prevent text being output without a matching template -->
  <xsl:template match="text()" />
  
  <!-- config entry point -->
  <xsl:template match="/"># /etc/init/pppoe.conf

description "Mini-RAS PPPoE Server"
author      "Rich Bayliss"

<xsl:apply-templates select="config/services" />
	</xsl:template>

	<xsl:template match="/config/services/pppoe-server">
start on starting networking
stop on stopping networking

# console none
expect daemon

env LOCAL_IP=<xsl:value-of select="local" />
env REMOTE_IP=<xsl:value-of select="remote" />
env CLIENTS=<xsl:value-of select="remote/@count" />
env MTU=<xsl:value-of select="mtu" />

script
exec pppoe-server -S isp -L $LOCAL_IP -R $REMOTE_IP -N $CLIENTS -m $MTU <xsl:apply-templates select="interface" />
end script
	</xsl:template>

	<xsl:template match="/config/services/pppoe-server/interface">
		<xsl:text>-I </xsl:text><xsl:value-of select="." /><xsl:text> </xsl:text>
	</xsl:template>
  
</xsl:stylesheet>
