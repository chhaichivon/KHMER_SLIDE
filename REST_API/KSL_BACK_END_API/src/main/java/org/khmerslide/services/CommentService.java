package org.khmerslide.services;

import java.util.ArrayList;

import org.khmerslide.entities.Comment;
import org.khmerslide.entities.User;
import org.khmerslide.filter.FilterComment;
import org.khmerslide.utilities.Pagination;

public interface CommentService {
	public ArrayList<Comment> getComment(
			FilterComment  filter,
			Pagination pagination
			);
	public boolean addComment(Comment comment);
	public boolean updateComment(Comment comment);
	public boolean deleteComment(int cmt_id);
	public ArrayList<Comment> getCommentById(int cmt_id);
	public ArrayList<Comment> getCommentByDocId(int id);
}
