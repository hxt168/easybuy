package un.dez.easybuy.entity;

import java.util.List;

public class ParentCategory {
	private int epcParentId;
	private String epcParentName;
	private List<Category> list; // 在查询显示所有父分类和子目录是使用
	
	public ParentCategory() {
	
	}
	
	public ParentCategory(int epcParentId, String epcParentName) {
		this.epcParentId = epcParentId;
		this.epcParentName = epcParentName;
	}


	public int getEpcParentId() {
		return epcParentId;
	}


	public void setEpcParentId(int epcParentId) {
		this.epcParentId = epcParentId;
	}


	public String getEpcParentName() {
		return epcParentName;
	}


	public void setEpcParentName(String epcParentName) {
		this.epcParentName = epcParentName;
	}


	public List<Category> getList() {
		return list;
	}
	public void setList(List<Category> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "ParentCategory [epcParentId=" + epcParentId
				+ ", epcParentName=" + epcParentName + ", list=" + list + "]";
	}
	
	
	
	
	
}
