package un.dez.easybuy.dao;


import java.util.HashMap;
import java.util.Map;

import un.dez.easybuy.entity.*;
import un.dez.easybuy.util.Pager;

public class Commentdao extends Basedao<Comment> implements ICommentdao {
	public Commentdao(){
		super(Comment.class);
	}
	
	/*�������*/
	
	public int addComment(Comment comment) {
		return super.add(comment);
	}

	/*ɾ������*/
	
	public int delComment(int ecid) {
		return super.del("delete", ecid);
	}

	/*��ҳ*/
	
	public Pager<Comment> getAllComments() {
		Map<String,Object> m = new HashMap<String, Object>();
		return super.getPages("list", m);
	}

	/*public int getCommentCount(int ecId) {
		return 0;
	}
*/
	
	public Comment load(int id) {
		return super.loadById("load", id);
	}

	
	public int update(int ecId, String ecReply) {
		Comment comment = new Comment();
		comment.setEcId(ecId);
		comment.setEcReply(ecReply);
		return super.update("update", comment);
	}
	
	
}
