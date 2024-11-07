/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.Expense;

/**
 *
 * @author Tharindu Deshapriya
 */


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DbExpense {

    public static boolean addExpenseCategory(Connection con, int userId, String categoryName) throws SQLException {
    String query = "INSERT INTO expensecategories(userid, category_name) VALUES(?, ?)";
    PreparedStatement pstmt = con.prepareStatement(query);
    pstmt.setInt(1, userId);
    pstmt.setString(2, categoryName);
    int affectedRows = pstmt.executeUpdate();

    return (affectedRows > 0);
}

    public static boolean deleteExpenseCategory(Connection con, int categoryId) throws SQLException {
        String query = "DELETE FROM expensecategories WHERE id = ?";
        
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, categoryId);
        int affectedRows = pstmt.executeUpdate();

        String query2 = "DELETE FROM expenses WHERE category_id = ?";
        
        PreparedStatement pstmt2 = con.prepareStatement(query2);
        pstmt2.setInt(1, categoryId);
        int affectedRows2 = pstmt2.executeUpdate();
        
        return (affectedRows > 0);
        
        

        
    }
    
    public static boolean updateExpenseCategory(Connection con, int categoryId, String newCategoryName) throws SQLException {
        String query = "UPDATE expense_categories SET category_name = ? WHERE category_id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, newCategoryName);
        pstmt.setInt(2, categoryId);
        int affectedRows = pstmt.executeUpdate();

        return (affectedRows > 0);
    }

    public static List<ExpenseCategory> getExpenseCategoriesByUserId(Connection con, int userId) throws SQLException {
        List<ExpenseCategory> categories = new ArrayList<>();
        String query = "SELECT * FROM expensecategories WHERE userid = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, userId);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            int categoryId = rs.getInt("id");
            String categoryName = rs.getString("category_name");
            
            ExpenseCategory category = new ExpenseCategory(categoryId, categoryName, userId);
            categories.add(category);
        }

        return categories;
    }

    public static String getExpenseCategoryNameById(Connection con, int categoryId) throws SQLException {
    String categoryName = null;
    String query = "SELECT category_name FROM expensecategories WHERE id = ?";
    PreparedStatement pstmt = con.prepareStatement(query);
    pstmt.setInt(1, categoryId);
    ResultSet rs = pstmt.executeQuery();

    if (rs.next()) {
        categoryName = rs.getString("category_name");
    }

    return categoryName;
}


    public static boolean addExpense(Connection con, int userId, int categoryId,String categoryName, double amount, String description, Date date) throws SQLException {
        String query = "INSERT INTO expenses(userid, category_id, amount, description, date,category_name) VALUES(?, ?, ?, ?, ?,?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, userId);
        pstmt.setInt(2, categoryId);
        pstmt.setDouble(3, amount);
        pstmt.setString(4, description);
        pstmt.setDate(5, date);
        pstmt.setString(6, categoryName);
        int affectedRows = pstmt.executeUpdate();

        return (affectedRows > 0);
    }
    

    public static boolean deleteExpense(Connection con, int expenseId) throws SQLException {
        String query = "DELETE FROM expenses WHERE id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, expenseId);
        int affectedRows = pstmt.executeUpdate();

        return (affectedRows > 0);
    }
    
    public static boolean updateExpense(Connection con, int expenseId, int categoryId,String categoryName, double amount, String description, Date date) throws SQLException {
        String query = "UPDATE expenses SET category_id = ?,category_name=?,description = ? , amount = ?,date = ? WHERE id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        
        pstmt.setInt(1, categoryId);
        pstmt.setString(2, categoryName);
        pstmt.setString(3, description);
        pstmt.setDouble(4, amount);
        pstmt.setDate(5, date);
        
        pstmt.setInt(6, expenseId);
        int affectedRows = pstmt.executeUpdate();

        return (affectedRows > 0);
    }

    public static List<Expense> getExpensesByUserId(Connection con, int userId) throws SQLException {
        List<Expense> expenses = new ArrayList<>();
        String query = "SELECT * FROM expenses WHERE userid = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, userId);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            int expenseId = rs.getInt("id");
            int categoryId = rs.getInt("category_id");
            double amount = rs.getDouble("amount");
            String description = rs.getString("description");
            String categoryname = rs.getString("category_name");
            Date expenseDate = rs.getDate("date");
            
            Expense expense = new Expense(expenseId, categoryId, categoryname, amount, description, expenseDate);
            expenses.add(expense);
        }

        return expenses;
    }
    public static List<Expense> getExpensesByUserAndDate(Connection con,int userid, Date startDate, Date finishDate) throws Exception {
            List<Expense> expenses = new ArrayList<>();

    
        String query = "SELECT * FROM expenses WHERE userid = ? AND date BETWEEN ? AND ?";
        PreparedStatement statement = con.prepareStatement(query);
        statement.setInt(1, userid);
        statement.setDate(2, startDate);
        statement.setDate(3, finishDate);

        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            int expenseId = resultSet.getInt("id");
            double amount = resultSet.getDouble("amount");
            Date date = resultSet.getDate("date");
            String description = resultSet.getString("description");

            expenses.add(new Expense(expenseId, userid, amount, description, date));
        }
        return expenses;
    }
}

