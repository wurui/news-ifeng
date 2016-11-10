<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="*" name="a">

    </xsl:template>

    <xsl:template match="/root" name="news-ifeng">
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-news-ifeng" ox-mod="news-ifeng">

            <ul>
                <xsl:for-each select="data/news/i">
                    <xsl:variable name="src-count" select="count(src/i)"/>
                    <li class="news-li news-li-{type} src-count-{$src-count}">
                    <xsl:choose>

                        <xsl:when test="type = 'vedio'">

                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="mainpic">
                                <span class="news-li-pic">
                                    <a href="{href}"><img src="{mainpic}"/></a>
                                </span>
                            </xsl:if>
                            <h3 class="news-title"><a href="{href}"><xsl:value-of select="title"/></a></h3>
                            <xsl:if test="$src-count &gt; 0">
                                <div class="news-imgs">
                                    <a href="{href}">
                                        <xsl:for-each select="src/i">
                                            <img src="{.}"/>
                                        </xsl:for-each>
                                    </a>
                                </div>
                            </xsl:if>
                            <div class="news-bottom">
                                <span class="news-bottom-left">
                                    <xsl:choose>
                                        <xsl:when test="not(tag) and type ='topic' ">
                                            <i class="topic-tag">专题</i>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <i class="news-tag"><xsl:value-of select="tag"/></i>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </span>
                                <span class="news-bottom-right">
                                    <xsl:value-of select="comment" />
                                </span>
                            </div>
                        </xsl:otherwise>
                    </xsl:choose>


                </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

</xsl:stylesheet>
