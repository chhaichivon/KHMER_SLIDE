package org.khmerslide.services;

import java.util.ArrayList;

import org.khmerslide.entities.Category;
import org.khmerslide.entities.Document;
import org.khmerslide.entities.User;
import org.khmerslide.model.UpdateCategory;
import org.khmerslide.utilities.Pagination;

public interface CategoryService {
	public ArrayList<Category> getCategory();
	public boolean addCategory(Category category);
	public boolean updateCategory(UpdateCategory category);
	public boolean deleteCategory(int cat_id);
	public ArrayList<Category> getCategoryById(int cate_id);
	public ArrayList<Category> getMainCategory();
	public ArrayList<Category> getSubCategoryByParentId(int id);
}