package ca.knifeandfork.tag;

import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.sling.api.SlingHttpServletRequest;

public abstract class SlingTag extends SimpleTagSupport {

	public SlingTag() {
		super();
	}

	protected final SlingHttpServletRequest getRequest() {
		PageContext context = (PageContext) getJspContext();
		return (SlingHttpServletRequest) context.getRequest();
	}

}