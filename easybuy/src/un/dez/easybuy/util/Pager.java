package un.dez.easybuy.util;

import java.util.List;

public class Pager<E>{
	//�ڼ�ҳ
	private int pageIndex;
	//ÿҳ��ʾ��������
	private int pageSize;
	//����pager��ܵ�ƫ����
	private int pageOffset;
	//�ܼ�¼��
	private int totalRecord;

	//ÿҳ��ʾ������
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
