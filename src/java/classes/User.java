/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Tharindu Deshapriya
 */
public class User {

    private int id;
    private String firstName;
    private String lastName;
    private String username;
    private String password;
    private String role;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String firstName, String lastName, String username, String password, String role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.password = password;
        this.role = role;
    }
    public User(int userid,String firstName, String lastName, String username, String role) {
        this.id = userid;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.role = role;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getRole() {
        return role;
    }

    public String getUserName() {
        return username;
    }

    public String getUserPassword() {
        return password;
    }

    public boolean register(Connection con) throws SQLException {
        String query = "INSERT INTO users(firstName, lastName, userName, password, role) VALUES(?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, firstName);
        pstmt.setString(2, lastName);
        pstmt.setString(3, username);
        pstmt.setString(4, password);
        pstmt.setString(5, role);
        int a = pstmt.executeUpdate();

        return (a > 0);
    }

    public boolean authenticate(Connection con) throws SQLException {
        String query = "SELECT * FROM users WHERE userName = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            String db_password = rs.getString("password");
            if (password.equals(db_password)) {
                id = Integer.parseInt(rs.getString("userid"));
                firstName = rs.getString("firstName");
                lastName = rs.getString("lastName");
                role = rs.getString("role");
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }

    }

    public boolean updateBasicDetails(Connection con, String fname, String lname, String uname, int userid) throws SQLException {
        String query = "UPDATE users SET firstName = ?, lastName = ?, userName = ? WHERE userid = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, fname);
        pstmt.setString(2, lname);
        pstmt.setString(3, uname);

        pstmt.setInt(4, userid);

        int rowsAffected = pstmt.executeUpdate();
        return rowsAffected > 0;
    }

    public boolean updatePassword(Connection con, String password, int userid) throws SQLException {
        String query = "UPDATE users SET password = ? WHERE userid = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, password);
        pstmt.setInt(2, userid);

        int rowsAffected = pstmt.executeUpdate();
        return rowsAffected > 0;
    }

    public boolean deleteUserAndData(Connection con, String password, int userid) throws SQLException {
        String[] queries = {
            "DELETE FROM expensecategories WHERE userid = ?;",
            "DELETE FROM expenses WHERE userid = ?;",
            "DELETE FROM incomecategories WHERE userid = ?;",
            "DELETE FROM incomes WHERE userid = ?;",
            "DELETE FROM users WHERE userid = ?"
        };
        int rowsAffected = 0;
        for (String query : queries) {
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userid);
            rowsAffected = pstmt.executeUpdate();
        }
        return rowsAffected > 0;
    }
    

    

}

        
