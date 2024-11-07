/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Tharindu Deshapriya
 */
public class Admin {
    public static List<User> getAllUsers(Connection con) throws SQLException {
        List<User> expenses = new ArrayList<>();
        String query = "SELECT * FROM users;";
        PreparedStatement pstmt = con.prepareStatement(query);
        
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            int userid = rs.getInt("userid");
            String firstname = rs.getString("firstName");
            String lastname = rs.getString("lastName");
            String username = rs.getString("userName");
            String role = rs.getString("role");
            User allusers = new User(userid, firstname, lastname, username, role);
            expenses.add(allusers);
        }

        return expenses;
    }
    public static boolean deleteUser(Connection con, int userid) throws SQLException {
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
            rowsAffected =+ pstmt.executeUpdate();
        }
        return rowsAffected > 0;
        
        
    }
}
