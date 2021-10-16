package springmvc.util;

import org.springframework.stereotype.Component;

@Component
public class Policy {
	private String name;
	private String nomineename;
	private String dob;
	private String relationship;
	private String gender;
	private String address;
	private String policyname;
	private String tenure;
	private String paymentmode;
	private String premium;
	private String total;
	private String nextdob;
	private String policynumber;
	private String purchaseDate;
	private String topay;
	
	public Policy() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNomineename() {
		return nomineename;
	}
	public void setNomineename(String nomineename) {
		this.nomineename = nomineename;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getRelationship() {
		return relationship;
	}
	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPolicyname() {
		return policyname;
	}
	public void setPolicyname(String policyname) {
		this.policyname = policyname;
	}
	public String getTenure() {
		return tenure;
	}
	public void setTenure(String tenure) {
		this.tenure = tenure;
	}
	public String getPaymentmode() {
		return paymentmode;
	}
	public void setPaymentmode(String paymentmode) {
		this.paymentmode = paymentmode;
	}
	public String getPremium() {
		return premium;
	}
	public void setPremium(String premium) {
		this.premium = premium;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getNextdob() {
		return nextdob;
	}
	public void setNextdob(String nextdob) {
		this.nextdob = nextdob;
	}
	public String getPolicynumber() {
		return policynumber;
	}
	public void setPolicynumber(String policynumber) {
		this.policynumber = policynumber;
	}
	public String getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public String getTopay() {
		return topay;
	}
	public void setTopay(String topay) {
		this.topay = topay;
	}
	@Override
	public String toString() {
		return "Policy [name=" + name + ", nomineename=" + nomineename + ", dob=" + dob + ", relationship="
				+ relationship + ", gender=" + gender + ", address=" + address + ", policyname=" + policyname
				+ ", tenure=" + tenure + ", paymentmode=" + paymentmode + ", premium=" + premium + ", total=" + total
				+ ", nextdob=" + nextdob + ", policynumber=" + policynumber + ", purchaseDate=" + purchaseDate
				+ ", topay=" + topay + "]";
	}
	public Policy(String policyname, String tenure, String paymentmode, String premium, String nextdob,
			String policynumber) {
		super();
		this.policyname = policyname;
		this.tenure = tenure;
		this.paymentmode = paymentmode;
		this.premium = premium;
		this.nextdob = nextdob;
		this.policynumber = policynumber;
	}
		
	
}
