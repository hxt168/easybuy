package un.dez.easybuy.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Product {
	private int epId;
	private String epName;
	private String epDescription;
	private float epPrice;
	private int epStock; //���
	private String epFileName; //ͼƬ·��
	private Category category; //��Ʒ����Ŀ¼
	private int epIsPromote;//�Ƿ�Ϊ���� 0�� ������  1 ����
	private int epSellAmount; //�۳�����
	private float epPromotePrice; //�����۸�	
	private Date epCreateTime; //��Ʒ����ʱ��
	private String epProductNum;//��Ʒ���
	
	public Product() {
	}
	
	//��ó��̱���
		public String getShortShortEpName() {
			
			return epName.length()>9?epName.substring(0, 8):epName;
	}
	
	//��ö̱���
	public String getShortEpName() {
		
		return epName.length()>20?epName.substring(0, 19):epName;
	}
	//��ø�ʽ������ʱ��
	public String getFormatDate()
	{
		SimpleDateFormat sdf=new SimpleDateFormat("yy-MM-dd hh:mm");
		return sdf.format(epCreateTime);
	}

	public int getEpId() {
		return epId;
	}
	public void setEpId(int epId) {
		this.epId = epId;
	}
	public String getEpName() {
		return epName;
	}
	public void setEpName(String epName) {
		this.epName = epName;
	}
	public String getEpDescription() {
		return epDescription;
	}
	public void setEpDescription(String epDescription) {
		this.epDescription = epDescription;
	}
	public float getEpPrice() {
		return epPrice;
	}
	public void setEpPrice(float epPrice) {
		this.epPrice = epPrice;
	}
	public int getEpStock() {
		return epStock;
	}
	public void setEpStock(int epStock) {
		this.epStock = epStock;
	}
	public String getFileName() {
		
		return epFileName;
	}
	public String getEpFileName() {
		
		return "/upload"+epFileName;
	}
	public void setEpFileName(String fileName) {
		this.epFileName = fileName;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}


	public int getEpIsPromote() {
		return epIsPromote;
	}


	public void setEpIsPromote(int epIsPromote) {
		this.epIsPromote = epIsPromote;
	}


	public int getEpSellAmount() {
		return epSellAmount;
	}


	public void setEpSellAmount(int epSellAmount) {
		this.epSellAmount = epSellAmount;
	}


	public float getEpPromotePrice() {
		return epPromotePrice;
	}


	public void setEpPromotePrice(float epPromotePrice) {
		this.epPromotePrice = epPromotePrice;
	}


	public Date getEpCreateTime() {
		return epCreateTime;
	}


	public void setEpCreateTime(Date epCreateTime) {
		this.epCreateTime = epCreateTime;
	}


	public String getEpProductNum() {
		return epProductNum;
	}


	public void setEpProductNum(String epProductNum) {
		this.epProductNum = epProductNum;
	}

	

	@Override
	public String toString() {
		return "Product [epId=" + epId + ", epName=" + epName
				+ ", epDescription=" + epDescription + ", epPrice=" + epPrice
				+ ", epStock=" + epStock + ", epFileName=" + epFileName
				+ ", category=" + category + ", epIsPromote=" + epIsPromote
				+ ", epSellAmount=" + epSellAmount + ", epPromotePrice="
				+ epPromotePrice + ", epCreateTime=" + epCreateTime
				+ ", epProductNum=" + epProductNum + "]";
	}
	
	
}