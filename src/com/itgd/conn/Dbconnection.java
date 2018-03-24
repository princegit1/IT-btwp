package com.itgd.conn;

import java.io.*;
import java.net.URL;
import java.sql.*;
import java.util.Properties;

public class Dbconnection
{
    private static Dbconnection instance;
    Connection conn;

    private Dbconnection()
    {
        init();
    }

    public static synchronized Dbconnection getInstance()
    {
        if(instance == null)
            instance = new Dbconnection();
        return instance;
    }

    private void init()
    {
        ClassLoader classloader = (Dbconnection.class).getClassLoader();
        URL url = classloader.getResource("db.properties");
        Properties properties = new Properties();
        try
        {
            java.io.InputStream inputstream = url.openStream();
            properties.load(inputstream);
            Class.forName(properties.getProperty("drivers"));
            conn = DriverManager.getConnection(properties.getProperty("intoday.url"), properties.getProperty("intoday.user"), properties.getProperty("intoday.password"));
        }
        catch(IOException ioexception)
        {
            System.out.println(ioexception.toString());
        }
        catch(SQLException sqlexception)
        {
            System.out.println(sqlexception.toString());
        }
        catch(ClassNotFoundException classnotfoundexception)
        {
            System.out.println(classnotfoundexception.toString());
        }
    }

    public Connection getConnection()
    {
		try
        {
			init();
        }
        catch(Exception sqlexception)
        {
			System.out.println(sqlexception.toString());
        }
        return conn;
    }
}