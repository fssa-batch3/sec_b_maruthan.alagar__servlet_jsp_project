package in.fssa.mambilling.model;

public class BillModal {
	
	private int productId;
	@Override
	public String toString() {
		return "BillModal [productID=" + productId + ", quantity=" + quantity + "]";
	}
	private int quantity;
	public int getProductID() {
		return productId;
	}
	public void setProductID(int productID) {
		this.productId = productID;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	

}
