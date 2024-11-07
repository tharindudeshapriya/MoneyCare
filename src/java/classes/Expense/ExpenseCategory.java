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



public class ExpenseCategory {

    private int categoryId;
    private String categoryName;
    private int userId;

    public ExpenseCategory(int categoryId, String categoryName, int userId) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.userId = userId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public int getUserId() {
        return userId;
    }
}
