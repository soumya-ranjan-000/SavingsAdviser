package springmvc.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class PolicyNumber {
	
	public String generateNumber(String n) {
		String polName=n;
		String ranStr=getRandomString();
		String sortDate=getSortDate();
		return (ranStr+polName.toUpperCase()+sortDate);
	}
	
	private String getSortDate() {
		String dt;
		Date date = new Date();
		DateFormat formatter = new SimpleDateFormat("MM/dd/yy");
		dt = formatter.format(date);
		String[] str=dt.split("/");
		dt=str[0]+str[1]+str[2];
		return dt;
	}



	public String getRandomString() {
		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        int i = 0;
        Random rand = new Random();
        StringBuilder sb1 = new StringBuilder();
        StringBuilder sb2 = new StringBuilder();
        while (i < 2) {
            sb1.append(chars.charAt(rand.nextInt(chars.length())));
            i++;
        }  
        chars ="0123456789";
        i=0;
        while (i < 1) {
            sb2.append(chars.charAt(rand.nextInt(chars.length())));
            i++;
        } 
        sb1.append(sb2);
		return sb1.toString();
	}
}
