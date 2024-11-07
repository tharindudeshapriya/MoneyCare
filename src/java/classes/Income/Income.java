package classes.Income;

import java.sql.Date;

public class Income {
    private int incomeId;
    private int categoryId;
    private double amount;
    private String description;
    private Date incomeDate;
    private String categoryName;

    public Income(int incomeId, int categoryId, double amount, String description, Date incomeDate) {
        this.incomeId = incomeId;
        this.categoryId = categoryId;
        this.amount = amount;
        this.description = description;
        this.incomeDate = incomeDate;
    }

    public Income(int incomeId, int categoryId, String categoryName, double amount, String description, Date incomeDate) {
        this.incomeId = incomeId;
        this.categoryId = categoryId;
        this.amount = amount;
        this.description = description;
        this.incomeDate = incomeDate;
        this.categoryName = categoryName;
    }

    public int getIncomeId() {
        return incomeId;
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

    public Date getIncomeDate() {
        return incomeDate;
    }
}
