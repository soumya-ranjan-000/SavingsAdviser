package springmvc.controller;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import springmvc.util.AvailPolicy;
import springmvc.util.LocalDB;
import springmvc.util.ObjectToJSON;
import springmvc.util.Policy;
import springmvc.util.PolicyNumber;
import springmvc.util.User;

@Controller
@RequestMapping("/insure")
public class HomeController {
	
	
	private final Logger logger=Logger.getLogger(HomeController.class);
	
	@Autowired
	LocalDB db;
    
	@Autowired
	ObjectToJSON json;
	
	@Autowired
	AvailPolicy av;
	
	
	@Autowired
	Policy p;
	
	@Autowired
	PolicyNumber pn;
	
	String com;
	
	public void managePolicy(Policy p) {
		this.p=p;
	}

	@RequestMapping(value="/login",method = RequestMethod.GET)
	public String getLoginPage(Model m) {
	    if(this.p!=null) this.p=null;
	    com="NO";
	    logger.info("Serving Login page(Get Request)");
		return "loginPage";
	}
	
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String postFromLoginPage(User u,Model m,HttpServletRequest req) {
		HttpSession session=req.getSession();
		logger.info("Post request to Login page");
		User getuser=db.getUser(u.getUsername(), u.getPassword());
		if(getuser!=null) {
			session.setAttribute("user", getuser);
			logger.info("redirecting to home page from login page");
			return "redirect:home";
		}
		else {
			logger.info("user validation failed. loading login page.");
			String e="error";
			m.addAttribute("error", e);
			return "loginPage";
		}	
	}
	
	@RequestMapping(value="/home",method=RequestMethod.GET)
	public String getHome(Model m) {
		logger.info("inside home page (Get)");
		com="NO";
		if(this.p!=null) this.p=null;
		return "home";
	}
	
	@RequestMapping(value="/logout")
	public String logOut(HttpServletRequest req,Model m) {	
		logger.info("Logging Out.");
		com="NO";
		if(this.p!=null) this.p=null;
		HttpSession session=req.getSession();
		session.removeAttribute("user");
		logger.info("session cleared");
		logger.info("Going to login page");
		return "redirect:login";	
	}
	
	@RequestMapping(value="/buypolicy",method=RequestMethod.GET)
	public String viewBuyPolicyPage(Model m) {	
		logger.info("inside Buy Policy request page (Get)");
		if(this.p!=null) this.p=null;
		com="NO";
		return "buypolicyhome";
	}
	
	@RequestMapping(value="/buypolicy",method=RequestMethod.POST)
	public String postToBuyPolicyPage(Policy p) 
	{	
		logger.info("inside Buy Policy request page (Post)");
		String polNumber=pn.generateNumber(p.getPolicyname());
		p.setPolicynumber(polNumber);
		managePolicy(p);
		com="YES";
		return "redirect:paypremium";
	}
	
	@RequestMapping(value="/paypremium",method=RequestMethod.GET)
	public String getPayPremium(Model m,HttpServletRequest req) 
	{   
		logger.info("inside pay premium (Get)");
		
		String ty=req.getParameter("command");
		
		if(ty!=null) {
			String polNumber=req.getParameter("policynumber");
			HttpSession s=req.getSession();
			User u=(User)s.getAttribute("user");
			if(ty.equals("PAY")) {
				Policy pol=db.getPolicy(u, polNumber);
				logger.info("user: "+u+" policy: "+pol);
				managePolicy(pol);
				com="NO";
				m.addAttribute("type", "fromhome");
			}
		}
		
		m.addAttribute("command",com);
		m.addAttribute("policy",this.p);
		
		return "paypremium";
	}
	
	
	@RequestMapping(value="/paypremium",method=RequestMethod.POST)
	public String postPayPremium(Model m,HttpServletRequest req) 
	{   
		String ref=req.getParameter("type");
		HttpSession session=req.getSession();
		User u =(User)session.getAttribute("user");		
		
		if(ref!=null) {
			if(ref.equals("fromhome")) {
				String nxtdob=db.updateNextDate(this.p);
				this.p.setNextdob(nxtdob);
				u.updatePolicyDate(this.p);
			}
		}
		else {
			String nxtdob=db.getNextDate(this.p);
			this.p.setNextdob(nxtdob);		
			u.addPolicy(this.p);
		}

		session.setAttribute("user", u);
		m.addAttribute("status", "success");
		m.addAttribute("command","NO" );
		this.p=null;
		return "paypremium";
	}
	
	@RequestMapping(value="/changepaymentmode",method=RequestMethod.GET)
	public String updatePayModeGet(HttpServletRequest req,Model m) 
	{	
		String polNumber=req.getParameter("policynumber");
		m.addAttribute("polnum", polNumber);
		
		return "updatePayMode";
	}
	
	
	@RequestMapping(value="/changepaymentmode",method=RequestMethod.POST)
	public String updatePayModePost(HttpServletRequest req,Model m) 
	{	
		String polNumber=req.getParameter("polnumber");
		String paymode=req.getParameter("paymentMode");
		if(polNumber !=null && paymode !=null) 
		{
			HttpSession session=req.getSession();
			User u=(User)session.getAttribute("user");
			u=db.updatePolicyPayMode(u, polNumber, paymode);
			session.setAttribute("user", u);
			m.addAttribute("status", "success");
			
		}
		else {
			m.addAttribute("status", "NO");
		}
		
		return "updatePayMode";
	}
	
	@RequestMapping(value="/info")
	@ResponseBody
	public String info() {
		logger.info("Request for tennure details from 'info'");
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Map<String, String>> list=db.getAvilPolicy().getList();
		String j=null;
		try {
			j = objectMapper.writeValueAsString(list);
			logger.info("serving tennure details to buypolicy page");
			return j;
		} catch (JsonProcessingException e) {
			logger.info("Error in fatching details. serving null tennure details to buypolicy page");
			e.printStackTrace();
			return j;
		}
		
	}
}
