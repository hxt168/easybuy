package un.dez.easybuy.entity;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

public class Comment {
	private int ecId;
	private String ecReply;
	private String ecContent;
	private Date ecCreateTime;
	private Date ecReplyTime;
	private String ecNickName;
	
	public Comment(){
		
	}

	public String getShortContent() {
		String str=ecContent.length()>25?ecContent.substring(0, 24)+"...":ecContent;
		str=str.replace("<", "&lt;");
		str=str.replace(">", "&gt;");
			//str=java.net.URLEncoder.encode(str);
		
		return str;
	}
	
	
	public int getIsReply()
	{
		if("".equals(ecReply))
		{
			return 0;
		}else{
			return 1;
		}
	}
	
	public String getReplyStr()
	{
		if("".equals(ecReply))
		{
			return "Î´»Ø¸´";
		}else{
			return "ÒÑ»Ø¸´";
		}
	}
	
	public Comment(String ecReply, String ecContent, Date ecCreateTime,
			Date ecReplyTime, String ecNickName) {
		
		this.ecReply = ecReply;
		this.ecContent = ecContent;
		this.ecCreateTime = ecCreateTime;
		this.ecReplyTime = ecReplyTime;
		this.ecNickName = ecNickName;
	
	}
	
	
	public int getEcId() {
		return ecId;
	}
	public void setEcId(int ecId) {
		this.ecId = ecId;
	}
	public String getEcReply() {
		return ecReply;
	}
	public void setEcReply(String ecReply) {
		this.ecReply = ecReply;
	}

	public String getEcContent() {
		return ecContent;
	}
	public void setEcContent(String ecContent) {
		this.ecContent = ecContent;
	}
	public String getEcCreateTime() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		return sdf.format(ecCreateTime);
	}
	public void setEcCreateTime(Date ecCreateTime) {
		this.ecCreateTime = ecCreateTime;
	}
	public String getEcReplyTime() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		return sdf.format(ecReplyTime);
	}
	public void setEcReplyTime(Date ecReplyTime) {
		this.ecReplyTime = ecReplyTime;
	}
	public String getEcNickName() {
		return ecNickName;
	}
	public void setEcNickName(String ecNickName) {
		this.ecNickName = ecNickName;
	}

	
	

}
