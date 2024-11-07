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



import java.sql.Date;

public class Expense {

    private int expenseId;
    private int categoryId;
    private double amount;
    private String description;
    private Date expenseDate;
    private String categoryName;
    
    public Expense(int expenseId, int categoryId, double amount, String description, Date expenseDate) {
        this.expenseId = expenseId;
        this.categoryId = categoryId;
        this.amount = amount;
        this.description = description;
        this.expenseDate = expenseDate;
    }
    public Expense(int expenseId, int categoryId,String categoryName, double amount, String description, Date expenseDate) {
        this.expenseId = expenseId;
        this.categoryId = categoryId;
        this.amount = amount;
        this.description = description;
        this.expenseDate = expenseDate;
        this.categoryName = categoryName;
    }

    public int getExpenseId() {
        return expenseId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public double getAmount() {
        return amount;
    }

    public String getDescription() {
        return description;
    }
    public String getCategoryName() {
        return categoryName;
    }

    public Date getExpenseDate() {
        return expenseDate;
    }
}

