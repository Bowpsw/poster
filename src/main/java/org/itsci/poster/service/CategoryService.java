package org.itsci.poster.service;

import org.itsci.poster.model.Category;

import java.util.List;

public interface CategoryService {
    List<Category> getCategories();

    void saveCategory(Category poster);

    Category getCategory(int id);

    void deleteCategory(int id);

    Category getCategoryByCode(String code);

    void updateCategory(Category dbCategory, Category category);
}
