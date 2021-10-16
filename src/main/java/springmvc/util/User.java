package springmvc.util;

import java.util.ArrayList;
import java.util.List;

public class User {
	private String username;
	private String password;
	private List<Policy> policyList;
	
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
		policyList=new ArrayList<Policy>();
	}

	public User() {
		super();
		policyList=new ArrayList<Policy>();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Policy> getPolicyList() {
		return policyList;
	}

	public void setPolicyList(ArrayList<Policy> policyList) {
		this.policyList = policyList;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", policyList=" + policyList + "]";
	}
	
	public void addPolicy(Policy p) {
		this.policyList.add(p);
	}
	
	public Policy getPolicy(String number) {
		for(Policy p:policyList) {
			if(p.getPolicynumber().equals(number)) {		
				return p;
			}
		}
		return null;
	}
	
	public boolean updatePolicyPayementMode(String number,String mode) {
		for(Policy p:policyList) 
		{
			if(p.getPolicynumber().equals(number)) {
				p.setPaymentmode(mode);
				return true;
			}
		}
		return false;
	}
	public boolean updatePolicyDate(Policy pol) {
		for(Policy p:policyList) 
		{
			if(p.getPolicynumber().equals(pol.getPolicynumber())) {
				p.setNextdob(pol.getNextdob());
				return true;
			}
		}
		return false;
	}
	
	public boolean updatePolicy(Policy pol, String num) {
		int i=0;
		for(Policy p:policyList) 
		{
			if(p.getPolicynumber().equals(num)) {
				policyList.set(i, pol);
				return true;
			}		
			i++;
		}
		return false;
	}
}
