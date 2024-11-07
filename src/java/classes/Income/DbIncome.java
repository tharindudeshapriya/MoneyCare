package classes.Income;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DbIncome {
    public static boolean addIncomeCategory(Connection con, int userId, String categoryName) throws SQLException {
        String query = "INSERT INTO incomecategories(userid, category_name) VALUES(?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, userId);
        pstmt.setString(2, categoryName);
        int affectedRows = pstmt.executeUpdate();

        return (affectedRows > 0);
    }

    public static boolean deleteIncomeCategory(Connection con, int categoryId) throws SQLException {
        String query = "DELETE FROM incomecategories WHERE id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, categoryId);
        int affectedRows = pstmt.executeUpdate();

        String query2 = "DELETE FROM incomes WHERE category_id = ?";
        PreparedStatement pstmt2 = con.prepareStatement(query2);
        pstmt2.setInt(1, categoryId);
        int affectedRows2 = pstmt2.executeUpdate();

        return (affectedRows > 0);
    }

    public static boolean updateIncomeCategory(Connection con, int categoryId, String newCategoryName) throws SQLException {
        String query = "UPDATE incomecategories SET category_name = ? WHERE id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, newCategoryName);
        pstmt.setInt(2, categoryId);
        int affectedRows = pstmt.executeUpdate();

        return (affectedRows > 0);
    }

    public static List<IncomeCategory> getIncomeCategoriesByUserId(Connection con, int userId) throws SQLException {
        List<IncomeCategory> categories = new ArrayList<>();
        String query = "SELECT * FROM incomecategories WHERE userid = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, userId);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            int categoryId = rs.getInt("id");
            String categoryName = rs.getString("category_name");

            IncomeCategory category = new IncomeCategory(categoryId, categoryName, userId);
            categories.add(category);
        }

        return categories;
    }

    public static String getIncomeCategoryNameById(Connection con, int categoryId) throws SQLException {
        String categoryName = null;
        String query = "SELECT category_name FROM incomecategories WHERE id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, categoryId);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            categoryName = rs.getString("category_name");
        }

        return categoryName;
    }

    public static boolean addIncome(Connection con, int userId, int categoryId,String categoryName, double amount, String description, Date date) throws SQLException {
        String query = "INSERT INTO incomes(userid, category_id, amount, description, date,category_name) VALUES(?, ?, ?, ?, ?,?)";
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

    public static boolean deleteIncome(Connection con, int incomeId) throws SQLException {
        String query = "DELETE FROM incomes WHERE id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, incomeId);
        int affectedRows = pstmt.executeUpdate();

        return (affectedRows > 0);
    }

    public static boolean updateIncome(Connection con, int incomeId, int categoryId,String categoryName, double amount, String description, Date date) throws SQLException {
        String query = "UPDATE incomes SET category_id = ?,category_name=?,description = ? , amount = ?,date = ? WHERE id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        
        pstmt.setInt(1, categoryId);
        pstmt.setString(2, categoryName);
        pstmt.setString(3, description);
        pstmt.setDouble(4, amount);
        pstmt.setDate(5, date); 
        pstmt.setInt(6, incomeId);
        int affectedRows = pstmt.executeUpdate();

        return (affectedRows > 0);
    }

    public static List<Income> getIncomesByUserId(Connection con, int userId) throws SQLException {
        List<Income> incomes = new ArrayList<>();
        String query = "SELECT * FROM incomes WHERE userid = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, userId);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            int incomeId = rs.getInt("id");
            int categoryId = rs.getInt("category_id");
            double amount = rs.getDouble("amount");
            String categoryname = rs.getString("category_name");
            String description = rs.getString("description");
            Date incomeDate = rs.getDate("date");

            Income income = new Income(incomeId, categoryId, categoryname, amount, description, incomeDate);
            incomes.add(income);
        }

        return incomes;
    }

    public static List<Income> getIncomesByUserAndDate(Connection con, int userId, Date startDate, Date finishDate) throws SQLException {
        List<Income> incomes = new ArrayList<>();

        String query = "SELECT * FROM incomes WHERE userid = ? AND date BETWEEN ? AND ?";
        PreparedStatement statement = con.prepareStatement(query);
        statement.setInt(1, userId);
        statement.setDate(2, startDate);
        statement.setDate(3, finishDate);

        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            int incomeId = resultSet.getInt("id");
            int categoryId = resultSet.getInt("category_id");
            double amount = resultSet.getDouble("amount");
            Date date = resultSet.getDate("date");
            String description = resultSet.getString("description");

            incomes.add(new Income(incomeId, categoryId, amount, description, date));
        }
        return incomes;
    }
}
