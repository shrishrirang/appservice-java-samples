<!DOCTYPE html>
<html>
<head>
    <title>Windows KeyStore sample</title>
</head>
<body>
    <h1>Windows KeyStore sample</h3>
    <font face="Segoe UI" size="4">
        <%@ page import="java.util.*" %>
        <%@ page import="java.security.Security" %>
        <%@ page import="javax.crypto.Cipher" %>
        <%@ page import="java.security.Key" %>
        <%@ page import="java.security.cert.Certificate" %>
        <%@ page import="java.security.KeyStore" %>
        <%@ page import="java.util.Enumeration" %>
        <%@ page import="javax.xml.bind.DatatypeConverter" %>
        <%@ page import="java.security.MessageDigest" %>
        <%
            String keyStoreName = "Windows-MY";
            KeyStore keyStore = KeyStore.getInstance(keyStoreName);
            keyStore.load(null, null);
            Enumeration<String> certificateAliases = keyStore.aliases();
            Boolean certificatesFound = false;
            
            while (certificateAliases.hasMoreElements()) {
                certificatesFound = true;
                
                String certificateAlias = certificateAliases.nextElement();
                
                out.print("<table width=\"750\" frame=\"border\" border=\"3\">");
                out.print("<tr><th <th align=\"left\" width=\"200\">    Certificate Property  </th>  <th align=\"left\" width=\"500\">    Value  </th></tr>");
                out.print("<tr><td>Certificate alias</td><td>" + certificateAlias + "</td></tr>");
                
                Certificate certificate = keyStore.getCertificate(certificateAlias);
                String thumbprint = DatatypeConverter.printHexBinary(MessageDigest.getInstance("SHA-1").digest(certificate.getEncoded())).toUpperCase();
                out.print("<tr><td>Thumbprint</td><td>" + thumbprint + "</td></tr>");
                out.print("<tr><td>Format</td><td>" + certificate.getPublicKey().getFormat() + "</td></tr>");
                out.print("<tr><td>Algorithm</td><td>" + certificate.getPublicKey().getAlgorithm() + "</td></tr>");

                Key certificateKey = keyStore.getKey(certificateAlias, null);
                out.print("<tr><td>Has Private key</td><td>" + (certificateKey != null) + "</td></tr>");
                
                out.print("</table>");
                out.print("<br />");
                out.print("<br />");
            }
            
            if (!certificatesFound)
            {
                out.print("<b>No certificate found!</b>");
            }
          %>
        </table>
    </font>
</body>
</html>
