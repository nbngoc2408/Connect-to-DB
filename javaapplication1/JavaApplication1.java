/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package javaapplication1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author nbngo
 */
public class JavaApplication1 {

    /**
     * @return 
     */
    public Connection GetJDBCConnection(){
        final String DB_Url = "jdbc:sqlserver://localhost:1433;databaseName=QLSV;encrypt=true;trustServerCertificate=true;";
        final String username = "bangoc";
        final String password = "12345";
        Connection conn = null;
        try{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn = DriverManager.getConnection(DB_Url, username, password);
        if ( conn != null){
            System.out.println("Success.");
        }
        }
        catch(ClassNotFoundException | SQLException e){
            //System.out.println("xyz");
            e.printStackTrace();
        }
        return conn;
    }
}
