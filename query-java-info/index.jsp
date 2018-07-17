<!DOCTYPE html>
<html>
<head>
    <title>Java Stack Info</title>
</head>
<body>
    <h1>Java Stack Info</h3>
    <font face="Segoe UI" size="4">
        <table width="750" frame="border" border="3">
            <tr>
                <th align="left" width="200">    Java Property  </th>  
                <th align="left" width="500">    Value  </th>
            </tr>
        <%@ page import="java.util.*" %>
        <%@ page import="javax.crypto.Cipher" %>
        <%
            ArrayList<String> mainPageProps = new ArrayList<String>();
            mainPageProps.add("java.version");
            mainPageProps.add("java.vendor");
            mainPageProps.add("os.arch");
            mainPageProps.add("catalina.base");
            mainPageProps.add("jetty.base");
            for(String name : mainPageProps)
            {
                String value = System.getProperty(name);
                if(value != null)
                {
                    out.print("<tr><td>" + name);
                    out.print("</td><td>" + value );
                    out.print("</td></tr>");
                }
            }
            
            out.print("<tr><td>JCE strength</td><td>" + Cipher.getMaxAllowedKeyLength("AES") + "</td>");
          %>
        </table>
    </font>
</body>
</html>
