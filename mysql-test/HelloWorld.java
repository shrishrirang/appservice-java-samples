import java.util.Arrays;
import java.util.Scanner;
import java.util.Vector;
import java.util.Scanner; 

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class HelloWorld {

    public static void main(String[] args) throws Throwable {
        
        try {
            // Class.forName("com.mysql.jdbc.Driver");
            Class.forName("org.apache.commons.dbcp2.cpdsadapter.DriverAdapterCPDS");
        } 
        catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 

        try {
            //set "connectionstring=jdbc:mysql://_NAME_.mysql.database.azure.com:3306/_DB_?verifyServerCertificate=false&useSSL=true&requireSSL=false"
            String url = System.getenv("connectionstring");
            
            // set username=_USER_@_NAME_
            String username = System.getenv("username");
            
            // set password=_PASSWORD_
            String password = System.getenv("password");
            
            Connection con = DriverManager.getConnection(url, username, password);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

}