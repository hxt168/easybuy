package un.dez.easybuy.dao;

import un.dez.easybuy.entity.Comment;
import un.dez.easybuy.util.Pager;

public interface ICommentdao {
	public int addComment(Comment comment);
	public int delComment(int ecid);
	public Pager<Comment> getAllComments();
	public Comment load(int id);
	public int update(int ecId,String ecReply);
	/*public int getCommentCount(int ecId);*/
}
