package un.dez.easybuy.entity;

public class Detail {
	private int eodId;
	private int eoId; //����id
	private Product product; //��Ʒ
	private int eodQuantity; //��Ʒ����
	private float eodCost; //��Ʒ�۸�
	private Order order;   //ĳЩ�������
	
	public Detail() {
	}

	public Detail(int eodId, int eoId, Product product, int eodQuantity,
			float eodCost) {
		this.eodId = eodId;
		this.eoId = eoId;
		this.product = product;
		this.eodQuantity = eodQuantity;
		this.eodCost = eodCost;
	}



	public int getEodId() {
		return eodId;
	}

	public void setEodId(int eodId) {
		this.eodId = eodId;
	}

	public int getEoId() {
		return eoId;
	}

	public void setEoId(int eoId) {
		this.eoId = eoId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getEodQuantity() {
		return eodQuantity;
	}

	public void setEodQuantity(int eodQuantity) {
		this.eodQuantity = eodQuantity;
	}

	public float getEodCost() {
		return eodCost;
	}

	public void setEodCost(float eodCost) {
		this.eodCost = eodCost;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "Detail [eodId=" + eodId + ", eoId=" + eoId + ", product="
				+ product + ", eodQuantity=" + eodQuantity + ", eodCost="
				+ eodCost + ", order=" + order + "]";
	}
	


	
}
