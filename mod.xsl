<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/root" name="wurui.news-ifeng">
        
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-news-ifeng" ox-mod="news-ifeng">
            <ul>
                <xsl:if test="count(data/info-news/i) &lt; 1">
                    <li class="no-data">暂无数据!</li>
                </xsl:if>
                <xsl:for-each select="data/info-news/i">
                    
                    <xsl:variable name="images" select="media/i[type = 'image'][position() &lt; 4]"/>
                    

                    <xsl:variable name="mainpic" select="$images/src"/>
                    <!--
                    <xsl:variable name="vedio" select="media/i[type = 'vedio'][1]/src"/>
                    <xsl:variable name="vedio-count" select="count(media/i[type = 'vedio'])"/>
                -->

                    <xsl:variable name="img-count" select="count($images)"/>
                    
                    

                    

                    <xsl:variable name="showtype">
                        <xsl:choose><!--
                            <xsl:when test="$vedio-count &gt; 0">vedio</xsl:when>-->
                            <xsl:when test="$img-count &gt; 1">img</xsl:when>
                            <xsl:otherwise>news</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="fullpath" select="LINK/detail"/>

                    <li class="news-li news-li-{$showtype} img-count-{$img-count}">
                        <xsl:if test="$mainpic">
                            <span class="news-li-pic">
                                <a href="{$fullpath}">
                                    <img src="//a.oxm1.cc/img/blank.png" lazy-w="100" lazy-src="{normalize-space($mainpic)}" lazy-type="bg"/>
                                </a>
                            </span>
                        </xsl:if>

                        <xsl:if test="title !=''">
                            <h3 class="news-title">
                                <a href="{$fullpath}">
                                    <xsl:value-of select="title"/>
                                </a>
                            </h3>
                        </xsl:if>
                        <xsl:if test="$img-count > 1">
                            <div class="news-imgs">
                                <a href="{$fullpath}">
                                    <xsl:for-each select="$images">
                                        <img lazy-src="{src}" lazy-type="bg" lazy-w="300" src="//a.oxm1.cc/img/blank.png"/>
                                    </xsl:for-each>
                                </a>
                            </div>
                        </xsl:if>
                        
                        <div class="news-bottom">
                            <span class="news-bottom-left">
                                <xsl:value-of select="sort"/>
                            </span>
                            <span class="news-bottom-right">
                                <xsl:if test="time">
                                    <xsl:value-of select="time/M"/>-<xsl:value-of select="time/d"/>
                                    &#160;
                                    <xsl:value-of select="time/H"/>:<xsl:value-of select="time/m"/>
                                </xsl:if>
                            </span>
                            
                            
<!--
                                <xsl:value-of select="$commentlist[tid= $nid]/num"/>
                                -->
                                
                            
                        </div>

                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

</xsl:stylesheet>
