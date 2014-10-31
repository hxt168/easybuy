package un.dez.easybuy.entity;

import java.text.SimpleDateFormat;
import java.util.*;

public class Order {
	private int eoId;
	private User eoUser;  //用户
	private String eoRealName; //用户真实名，冗余点易于扩展
	private String eoUserAddress; //用户地址，冗余点易于扩展
	private Date eoCreateTime;  //创建时间
	private double eoCost; //总价格
	private int eoStatus; //状态： 1下单 2 审核通过 3 配货 4 送货中 5收获并确认
	private int eoType; //付款方式：1 货到付款 2 网上支付
	private String eoUserPhone; 
	private List<Detail> list; //订购的商品列表
	
	public Order() {
		
	}

	public Order(User eoUser, String eoRealName,
			String eoUserAddress, Date eoCreateTime, double eoCost,
			int eoStatus, int eoType, String eoUserPhone, List<Detail> list) {
		super();
		this.eoUser = eoUser;
		this.eoRealName = eoRealName;
		this.eoUserAddress = eoUserAddress;
		this.eoCreateTime = eoCreateTime;
		this.eoCost = eoCost;
		this.eoStatus = eoStatus;
		this.eoType = eoType;
		this.eoUserPhone = eoUserPhone;
		this.list = list;
	}
	
	public String getFormatDate()
	{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
		return sdf.format(eoCreateTime);
	}
	public String getStatus()
	{
		if(eoStatus==1)
			return "下单";
		if(eoStatus==2)
			return "审核通过";
		if(eoStatus==3)
			return "配货";
		if(eoStatus==4)
			return "送货中";
		if(eoStatus==5)
			return "收获并确认";
		return "";
	}
	public int getEoId() {
		return eoId;
	}

	public void setEoId(int eoId) {
		this.eoId = eoId;
	}

	public User getEoUser() {
		return eoUser;
	}

	public void setEoUser(User eoUser) {
		this.eoUser = eoUser;
	}

	public String getEoRealName() {
		return eoRealName;
	}

	public void setEoRealName(String eoRealName) {
		this.eoRealName = eoRealName;
	}

	public String getEoUserAddress() {
		return eoUserAddress;
	}

	public void setEoUserAddress(String eoUserAddress) {
		this.eoUserAddress = eoUserAddress;
	}

	public Date getEoCreateTime() {
		return eoCreateTime;
	}

	public void setEoCreateTime(Date eoCreateTime) {
		this.eoCreateTime = eoCreateTime;
	}

	public double getEoCost() {
		return eoCost;
	}

	public void setEoCost(double eoCost) {
		this.eoCost = eoCost;
	}

	public int getEoStatus() {
		return eoStatus;
	}

	public void setEoStatus(int eoStatus) {
		this.eoStatus = eoStatus;
	}

	public int getEoType() {
		return eoType;
	}

	public void setEoType(int eoType) {
		this.eoType = eoType;
	}

	public String getEoUserPhone() {
		return eoUserPhone;
	}

	public void setEoUserPhone(String eoUserPhone) {
		this.eoUserPhone = eoUserPhone;
	}

	public List<Detail> getList() {
		return list;
	}

	public void setList(List<Detail> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "Order [eoId=" + eoId + ", eoUser=" + eoUser + ", eoRealName="
				+ eoRealName + ", eoUserAddress=" + eoUserAddress
				+ ", eoCreateTime=" + eoCreateTime + ", eoCost=" + eoCost
				+ ", eoStatus=" + eoStatus + ", eoType=" + eoType
				+ ", eoUserPhone=" + eoUserPhone + ", list=" + list + "]";
	}
	
	
}
