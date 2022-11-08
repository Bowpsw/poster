package org.itsci.poster.dao;

import org.itsci.poster.model.Category;

import java.util.List;

public interface CategoryDao {

    List<Category> getCategories();

    void saveCategory(Category category);

    Category getCategory(int id);

    void deleteCategory(int id);

    Category getCategoryByCode(String code);
}
