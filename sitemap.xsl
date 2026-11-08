<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>XML Sitemap</title>
        <style>
          body { font-family: Arial, Helvetica, sans-serif; margin: 40px; color: #2B303A; background: #F8F9FA; }
          h1 { color: #0A5C36; font-size: 32px; border-bottom: 3px solid #C5A880; padding-bottom: 10px; }
          p { font-size: 16px; line-height: 1.6; }
          a { color: #0A5C36; text-decoration: none; }
          a:hover { text-decoration: underline; }
          table { border-collapse: collapse; width: 100%; margin-top: 20px; background: #ffffff; }
          th { text-align: left; padding: 10px 12px; border-bottom: 2px solid #0A5C36; color: #2B303A; }
          td { padding: 8px 12px; border-bottom: 1px solid #E8F5E9; }
          tr:nth-child(even) td { background: #E8F5E9; }
        </style>
      </head>
      <body>
        <h1>XML Sitemap</h1>
        <p>This is an XML Sitemap, meant for consumption by search engines.</p>
        <p>You can find more information about XML sitemaps on <a href="https://www.sitemaps.org/">sitemaps.org</a>.</p>
        <xsl:choose>
          <xsl:when test="sitemap:sitemapindex">
            <p>This XML Sitemap Index file contains <xsl:value-of select="count(sitemap:sitemapindex/sitemap:sitemap)"/> sitemaps.</p>
            <table>
              <tr><th>Sitemap</th><th>Last Modified</th></tr>
              <xsl:for-each select="sitemap:sitemapindex/sitemap:sitemap">
                <tr>
                  <td><a href="{sitemap:loc}"><xsl:value-of select="sitemap:loc"/></a></td>
                  <td><xsl:value-of select="sitemap:lastmod"/></td>
                </tr>
              </xsl:for-each>
            </table>
          </xsl:when>
          <xsl:otherwise>
            <p>This XML Sitemap contains <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/> URLs.</p>
            <table>
              <tr><th>URL</th><th>Last Modified</th></tr>
              <xsl:for-each select="sitemap:urlset/sitemap:url">
                <tr>
                  <td><a href="{sitemap:loc}"><xsl:value-of select="sitemap:loc"/></a></td>
                  <td><xsl:value-of select="sitemap:lastmod"/></td>
                </tr>
              </xsl:for-each>
            </table>
          </xsl:otherwise>
        </xsl:choose>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
