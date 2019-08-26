<?xml version="1.0" encoding="UTF-8"?>
<!-- Copyright (C) 2014 SoftCorporation LLC. All Rights Reserved. -->
<!DOCTYPE xsl:stylesheet [
<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <xsl:apply-templates select="neardup"/>
</xsl:template>

<xsl:template match="neardup">
<html>
  <xsl:apply-templates select="head"/>
  <xsl:apply-templates select="report"/>
</html>
</xsl:template>

<xsl:template match="head">
<head>
  <title><xsl:value-of select="software/@name"/> v.<xsl:value-of select="software/@version"/> Report.</title>
  <link rel="stylesheet" type="text/css" href="report.css"/>
  <script type='text/javascript'>
    function toggle(d)
    {
      var p = d.parentNode;
      var c = p.childNodes;
      for (var i = 0; i &lt; c.length; i++) if (c[i].className == 'subtree' &amp;&amp; c[i].childNodes.length == 0) return;
      p.className = (p.className == 'treehide') ? 'treeshow' : 'treehide';
      if (p.className == 'treeshow')
      {
        d.style.backgroundImage='url(document.png)';
        p.className = '';
      }
      else
      {
        d.style.backgroundImage='url(document2.png)';
      }
    }
  </script>
</head>
</xsl:template>

<xsl:template match="report">
<body>
  <h2><xsl:value-of select="../head/software/@name"/> v.<xsl:value-of select="../head/software/@version"/>. Params: <xsl:value-of select="../head/params"/></h2>
  <h3>Date: <xsl:value-of select="../head/date"/> Run: <xsl:value-of select="../head/run"/></h3>
  <xsl:apply-templates select="navigate"/>
  <xsl:apply-templates select="cluster"/>
  <xsl:apply-templates select="chain"/>
  <xsl:apply-templates select="navigate"/>
</body>
</xsl:template>

<xsl:template match="chain">
<ul class="tree">
  <xsl:apply-templates select="doc"/>
</ul>
<br/>
</xsl:template>

<xsl:template match="cluster">
<ul class="tree">
  <xsl:apply-templates select="doc"/>
</ul>
<br/>
</xsl:template>

<xsl:template match="doc">
<li>
  <div class="pic" onclick="toggle(this)">[<xsl:value-of select="@id"/>]</div>
  <div class="ref">
    <xsl:variable name="url"><xsl:value-of select="@href" disable-output-escaping="yes"/></xsl:variable>

    <a target="report">
      <xsl:attribute name="href"><xsl:value-of select="$url"/></xsl:attribute>
      <xsl:value-of select="$url"/> (<xsl:choose>
          <xsl:when test="../@size!=''">N:<xsl:value-of select="../@size"/></xsl:when>
          <xsl:otherwise>S:<xsl:value-of select="@score"/></xsl:otherwise>
        </xsl:choose> L:<xsl:value-of select="@length"/> D:<xsl:value-of select="@date"/>)
    </a>
  </div>
  <ul class="subtree"><xsl:apply-templates select="doc"/></ul>
</li>
</xsl:template>

<xsl:template match="navigate">
<b>
  <xsl:if test="@hrefprev != ''"><a><xsl:attribute name="href"><xsl:value-of select="@hrefprev" disable-output-escaping="yes"/></xsl:attribute>Previous</a>&nbsp;&nbsp;</xsl:if>
  Page:&nbsp;<xsl:value-of select="../@page"/>
  <xsl:if test="@hrefnext != ''">&nbsp;&nbsp;<a><xsl:attribute name="href"><xsl:value-of select="@hrefnext" disable-output-escaping="yes"/></xsl:attribute>Next</a></xsl:if>
</b><br/><br/>
</xsl:template>

</xsl:stylesheet>
