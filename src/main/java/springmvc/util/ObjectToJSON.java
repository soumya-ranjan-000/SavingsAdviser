package springmvc.util;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
@Component
public class ObjectToJSON {
  ObjectMapper mapper;

public ObjectToJSON() {
	super();
	mapper=new ObjectMapper();
}

public String toJson( Object o) {
	  String postJson=null;
	try {
		postJson = mapper.writeValueAsString(o);
		return postJson;
	} catch (JsonProcessingException e) {
		System.out.println("Error in converting object to json string:--> "+e);
		e.printStackTrace();
		return postJson;
	}
	
  }
}
