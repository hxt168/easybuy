package un.dez.easybuy.util;

import java.util.List;

public class Pager<E>{
	//第几页
	private int pageIndex;
	//每页显示几条数据
	private int pageSize;
	//基于pager框架的偏移量
	private int pageOffset;
	//总记录数
	private int totalRecord;

	//每页显示的数据
	private List<E> data;
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageOffset() {
		return pageOffset;
	}
	public void setPageOffset(int pageOffset) {
		this.pageOffset = pageOffset;
	}
	
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalpage() {
		return (totalRecord-1)/pageSize+1;
	}
	
	public List<E> getData() {
		return data;
	}
	public void setData(List<E> data) {
		this.data = data;
	}

}
