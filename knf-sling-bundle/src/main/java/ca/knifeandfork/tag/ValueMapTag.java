package ca.knifeandfork.tag;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ValueMap;

public class ValueMapTag extends SlingTag {
	
	private String path;
	private String var;
	
	@Override
	public void doTag() {
		Resource resource = getRequest().getResourceResolver().getResource(path);
		getJspContext().setAttribute(var, resource.adaptTo(ValueMap.class));
	}
	
	public final void setPath(String path){
		this.path = path;
	}
	
	public final void setVar(String var) {
		this.var = var;
	}

}
