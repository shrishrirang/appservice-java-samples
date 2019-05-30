<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.net.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Worker Info</title>
</head>
<body>
    <h1>Worker Info</h3>
    <font face="Segoe UI" size="4">
        <table width="750" frame="border" border="3">
            <tr>
                <th align="left" width="200">    Property  </th>  
                <th align="left" width="500">    Value  </th>
            </tr>
            <tr>
              <td>Worker / Instance computername</td>
              <td><%= InetAddress.getLocalHost().getHostName() %></td>
            </tr>
            <tr>
              <td>Host computername</td>
              <td><%= System.getenv("COMPUTERNAME") %></td>
            </tr>
            <tr>
              <td>Time</td>
              <td><%= (new SimpleDateFormat("dd-MM-yyyy hh:mm:ss:SSS")).format(new Date()) %></td>
            </tr>
        </table>
    </font>
</body>
</html>
