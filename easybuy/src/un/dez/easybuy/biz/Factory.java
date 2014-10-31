package un.dez.easybuy.biz;

import un.dez.easybuy.dao.*;


public class Factory {
	public  static ICategorydao getCategorydao(){
		return new Categorydao();
	}
	public static INewsdao getNesdao(){
		return new Newsdao();
	}
public static ICommentdao getCommentdao(){
	return new Commentdao();
}
public static IOrderdao getOrderdao(){
	return new Orderdao();
}
public static IProductdao getProductdao(){
	return new Productdao();
}
public static IParentCategorydao getParentCategorydao(){
	return new ParentCategorydao();
}
public static IUserdao getUserdao(){
	return new Userdao();
}
}
