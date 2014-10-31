package un.dez.easybuy.entity;

import java.text.SimpleDateFormat;
import java.util.*;


public class News {
	private int enId;
	private String enTitle;
	private String enContent;
	private Date enCreateTime;
	
	public News() {
	}
	
	public News(String enTitle, String enContent, Date enCreateTime) {
		
		this.enTitle = enTitle;
		this.enContent = enContent;
		this.enCreateTime = enCreateTime;
	}
	
	public String getFormatDate()
	{
		SimpleDateFormat sdf=new SimpleDateFormat("yy-MM-dd hh:mm:ss");
		return sdf.format(enCreateTime);
	}
	//获得短标题
	public String getShortTitle() {
			
			return enTitle.length()>17?enTitle.substring(0, 16):enTitle;
	}
	public int getEnId() {
		return enId;
	}
	public void setEnId(int enId) {
		this.enId = enId;
	}
	public String getEnTitle() {
		return enTitle;
	}
	public void setEnTitle(String enTitle) {
		this.enTitle = enTitle;
	}
	public String getEnContent() {
		return enContent;
	}
	public void setEnContent(String enContent) {
		this.enContent = enContent;
	}
	public Date getEnCreateTime() {
		return enCreateTime;
	}
	public void setEnCreateTime(Date enCreateTime) {
		this.enCreateTime = enCreateTime;
	}
	
}
