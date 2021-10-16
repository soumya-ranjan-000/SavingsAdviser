package springmvc.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class AvailPolicy {
	
 private Map<String, Map<String, String>> list;
 
	public AvailPolicy() {
		super();
		list = new HashMap<String, Map<String, String>>();
		list.put("POL1", pol1());
		list.put("POL2", pol2());
		list.put("POL3", pol3());
	}

	public Map<String, String> pol1() {
		Map<String, String> m=new HashMap<String, String>();
//		    *tenure* *sum assured*
		m.put("5", "1500");
		m.put("10", "2000");
		m.put("15", "2500");
		m.put("20", "3000");
		m.put("25", "3500");
		return m;
	}

	public Map<String, String> pol2() {
		Map<String, String> m=new HashMap<String, String>();
		m.put("5", "2500");
		m.put("10", "3000");
		m.put("15", "4500");
		m.put("20", "5000");
		m.put("25", "6500");
		return m;
	}

	public Map<String, String> pol3() {
		Map<String, String> m=new HashMap<String, String>();
		m.put("5", "3500");
		m.put("10", "5000");
		m.put("15", "6500");
		m.put("20", "8000");
		m.put("25", "9500");
		return m;
	}
	
	public int getSumAssured(String p,String t) {
		Map<String, String> m=list.get(p.toUpperCase());
		String sum=m.get(t);
		return Integer.parseInt(sum);
	}

	@Override
	public String toString() {
		return "AvailPolicy [availpolicy=" + list + "]";
	}

	public Map<String, Map<String, String>> getList() {
		return list;
	}

	public void setList(Map<String, Map<String, String>> list) {
		this.list = list;
	}
	

}
