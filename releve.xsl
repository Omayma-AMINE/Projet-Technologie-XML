<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head><h3>Relevé Bancaire</h3></head>
            <body>
                <xsl:for-each select="/releve">
                    
                    <h5>RIB  : <xsl:value-of select="@RIB"></xsl:value-of></h5>
                    <h5>Solde : <xsl:value-of select="solde"></xsl:value-of> </h5>
                    <h5>Date Relevé : <xsl:value-of select="dateReleve"></xsl:value-of></h5>
                    <xsl:for-each select="operations">
                        <h4>Liste des opérations du <xsl:value-of select="@dateDebut"> </xsl:value-of> au <xsl:value-of select="@dateFin"></xsl:value-of></h4>
                        <table border="1" width="85%">
                            <tr>
                                <th>Date</th><th>Description</th><th>Montant</th>
                            </tr>
                            <xsl:for-each select="operation">
                                <tr>
                                    <td><xsl:value-of select="@date"></xsl:value-of></td>
                                    <td><xsl:value-of select="@description"></xsl:value-of></td>
                                    <td><xsl:value-of select="@montant"></xsl:value-of></td>
                                </tr>
                                
                            </xsl:for-each>
                            <tr>
                                <th colspan="2"> Total des opérations débits</th>
                                
                                <th><xsl:value-of select="sum(operation[@type='DEBIT']/@montant)"></xsl:value-of></th>
                                
                                
                            </tr>
                            <tr>
                                <th colspan="2"> Total des opérations crédtis</th>
                                <th><xsl:value-of select="sum(operation[@type='CREDIT']/@montant)"></xsl:value-of></th>
                            </tr>
                            <tr>
                                <th colspan="2"> Total des opérations  </th>
                                <th><xsl:value-of select="sum(operation[@type='CREDIT']/@montant)-sum(operation[@type='DEBIT']/@montant)"></xsl:value-of></th>
                            </tr>
                        </table>
                    </xsl:for-each>
                </xsl:for-each>
            
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>