package un.dez.easybuy.entity;

public class Category {
	private int epcId;
	private String epcName;
	private ParentCategory parentCategory;
	
	public Category() {
	}

	public Category(String epcName, ParentCategory parentCategory) {
		this.epcName = epcName;
		this.parentCategory = parentCategory;
	}

	public int getEpcId() {
		return epcId;
	}
	public void setEpcId(int epcId) {
		this.epcId = epcId;
	}
	public String getEpcName() {
		return epcName;
	}
	public void setEpcName(String epcName) {
		this.epcName = epcName;
	}
	public ParentCategory getParentCategory() {
		return parentCategory;
	}
	public void setParentCategory(ParentCategory parentCategory) {
		this.parentCategory = parentCategory;
	}

	@Override
	public String toString() {
		return "Category [epcId=" + epcId + ", epcName=" + epcName
				+ ", parentCategory=" + parentCategory + "]";
	}

	
}
