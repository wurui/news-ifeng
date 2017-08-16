<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/root" name="news-ifeng">
        <xsl:param name="imgurl">imgs</xsl:param>
        <xsl:param name="detailurl">detail</xsl:param>
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-news-ifeng" ox-mod="news-ifeng">
            <ul>
                <xsl:if test="count(data/news/i) &lt; 1">
                    <li>NO Data!</li>
                </xsl:if>
                <xsl:for-each select="data/news/i">
                    <xsl:variable name="src-count" select="count(src/i)"/>
                    <xsl:variable name="fullpath">
                        <xsl:choose>
                            <xsl:when test=" type = 'img'"><xsl:value-of select="$imgurl"/>?id=<xsl:value-of select="id"/></xsl:when>
                            <xsl:otherwise><xsl:value-of select="$detailurl"/>?id=<xsl:value-of select="id"/></xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <li class="news-li news-li-{type} src-count-{$src-count}">
                        <xsl:if test="mainpic">
                            <span class="news-li-pic">
                                <a href="{$fullpath}">
                                    <img src="//a.oxm1.cc/img/blank.png" lazy-w="100" lazy-src="{normalize-space(mainpic)}" lazy-type="bg"/>
                                </a>
                            </span>
                        </xsl:if>
                        <h3 class="news-title">
                            <a href="{$fullpath}">
                                <xsl:value-of select="title"/>
                            </a>
                        </h3>
                        <xsl:if test="$src-count > 0">
                            <div class="news-imgs">
                                <a href="{$fullpath}">
                                    <xsl:for-each select="src/i">
                                        <img lazy-src="{.}" lazy-type="bg" lazy-w="300" src="//a.oxm1.cc/img/blank.png"/>
                                    </xsl:for-each>
                                </a>
                            </div>
                        </xsl:if>
                        <div class="news-bottom">
                            <nobr class="news-bottom-left">
                                <xsl:choose>
                                    <xsl:when test="not(tag) and type ='topic' ">
                                        <i class="topic-tag">专题</i>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <i class="news-tag">
                                            <xsl:value-of select="tag"/>
                                        </i>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </nobr>
                            <nobr class="news-bottom-right">
<!--
                                <xsl:value-of select="$commentlist[tid= $nid]/num"/>
                                -->
                                <xsl:value-of select="time"/>
                            </nobr>
                        </div>

                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

</xsl:stylesheet>
