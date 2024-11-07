package classes.Income;

public class IncomeCategory {
    private int categoryId;
    private String categoryName;
    private int userId;

    public IncomeCategory(int categoryId, String categoryName, int userId) {
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
