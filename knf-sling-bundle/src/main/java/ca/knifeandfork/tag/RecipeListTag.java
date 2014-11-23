package ca.knifeandfork.tag;

import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;

import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.api.resource.ValueMap;

public class RecipeListTag extends SimpleTagSupport {
	
	private String var;
	
	@Override
	public void doTag() {
		ResourceResolver resRes = getRequest().getResourceResolver();
		Iterator<Resource> i = resRes.getResource("/content/knifeandfork/recipes").listChildren();
		LinkedList<Resource> recipeList = new LinkedList<Resource>();
		while(i.hasNext()) {
			recipeList.add(i.next());
		}
		
		Collections.sort(recipeList, new Comparator<Resource>(){

			@Override
			public int compare(Resource arg0, Resource arg1) {
				ValueMap map0 = arg0.adaptTo(ValueMap.class);
				ValueMap map1 = arg1.adaptTo(ValueMap.class);
				return map0.get("title", String.class).compareTo(map1.get("title", String.class));
			}
		});
		
		getJspContext().setAttribute(var, recipeList);
		
	}
	
	
	public void setVar(String var) {
		this.var = var;
	}
	
	protected final SlingHttpServletRequest getRequest() {
		PageContext context = (PageContext) getJspContext();
		return (SlingHttpServletRequest) context.getRequest();
	}

}
