package springmvc.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import springmvc.controller.HomeController;

// this is my local database
@Component
public class LocalDB {
	private List<User> userList;
	@Autowired
	AvailPolicy avilPolicy;
	private final Logger logger=Logger.getLogger(HomeController.class);
	
	public LocalDB() {
		super();
		userList = new ArrayList<User>();
		addStartUsers();
	}

	public void addStartUsers() {
		User u;	
		u = new User("testuser", "testuser123");
		userList.add(u);
		u = new User("sam", "sam123");
		userList.add(u);
	}

//	utill methods

	// 1. Fetch User from the list its username and password
	public User getUser(String uname, String pass) {
		for (User u : userList) {
			if (u.getUsername().equals(uname) && u.getPassword().equals(pass)) 
			{
				return u;
			}
		}
		return null;
	}
	
	//2. Fetch PolicyList of a user
	public List<Policy> getPolicyList(User u) {
		
		return u.getPolicyList();
	}

	//3. fetch policy from a policylist by its policynumber and user
	public Policy getPolicy(User u, String pnum) {
		return u.getPolicy(pnum);
	}

	//4. update policy payment mode
	public User updatePolicyPayMode(User u, String pnum, String mode) {
		Policy p=u.getPolicy(pnum);
		String date=null;;
		double total=Double.parseDouble(p.getTotal());
		int tennure=Integer.parseInt(p.getTenure());
		int time=0;
	
				if(mode.equals("Monthly")) 
				{
					time=12;
					date= getdate(1);
				}else if(mode.equals("Quarterly"))
				{	
					time=3;
					date= getdate(4);
				}
				else if(mode.equals("Yearly"))
				{	
					time=1;
					date= getdate(12);
				}
		double premium=(total/tennure)/time;
		p.setPaymentmode(mode);
		p.setPremium(premium+"");
		p.setNextdob(date);
		u.updatePolicy(p, pnum);
		updateUser(u);
		return u;
	}
	
	//5. add policy
	public void updateUser(User u) {
		User newuser=getUser(u.getUsername(), u.getPassword());
		int i=userList.indexOf(newuser);
		userList.set(i, u);
	}
	
	//6. get sum assured based on type of policy and tenure amount
	
	public int getSumAssured(String poltype, String ten) {
		return avilPolicy.getSumAssured(poltype, ten);
	}

	public AvailPolicy getAvilPolicy() {
		return avilPolicy;
	}

	
	public String getNextDate(Policy p) {
		String pay_mode=p.getPaymentmode();
		String date=null;
		if(pay_mode.equals("monthly")) 
		{
			date= getdate(1);
			
		}else if(pay_mode.equals("quarterly"))
		{
			date= getdate(4);
		}
		else if(pay_mode.equals("yearly"))
		{
			date= getdate(12);
		}
	return date;
	}
	
	public String getdate(int m)
	{
		SimpleDateFormat form=new SimpleDateFormat("MM/dd/yyyy");  
		Calendar cal = Calendar.getInstance();  
		cal.add(Calendar.MONTH, m);  
		String newDate = form.format(cal.getTime());  

		return newDate;
	}
	
	
	public String updateNextDate(Policy p)
	{ 	
		String curdate=p.getNextdob();
		String newDate=null;
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		Calendar cal = Calendar.getInstance();  
		try {
			Date date = formatter.parse(curdate);
			cal.setTime(date);
			String pay_mode=p.getPaymentmode();
			if(pay_mode.equals("monthly")) 
			{
				cal.add(Calendar.MONTH, 1);
				
			}else if(pay_mode.equals("quarterly"))
			{
				cal.add(Calendar.MONTH, 4);
			}
			else if(pay_mode.equals("yearly"))
			{
				cal.add(Calendar.MONTH, 12);
			}
		   newDate = formatter.format(cal.getTime()); 
		} catch (ParseException e) {
			logger.info(e);
			return null;
		}
		return newDate;
		
	}
}
