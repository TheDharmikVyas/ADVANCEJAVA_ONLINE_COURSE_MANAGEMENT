package com.course.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        Connection con = null;
        try {
            System.out.println("Loading driver...");
            Class.forName("org.postgresql.Driver");

            System.out.println("Connecting to DB...");
            con = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/course_db",
                "postgres",
                "dv29"
            );

            System.out.println("DB CONNECTED SUCCESSFULLY");

        } catch (Exception e) {
            System.out.println("❌ DB ERROR");
            e.printStackTrace();   // VERY IMPORTANT
        }
        return con;
    }
}
