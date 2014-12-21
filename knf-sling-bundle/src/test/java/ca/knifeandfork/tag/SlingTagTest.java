package ca.knifeandfork.tag;

import static org.mockito.Mockito.*;

import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.JspFragment;

import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.resource.ResourceResolver;

public abstract class SlingTagTest {

	protected SlingTag subject;
	PageContext context;
	JspFragment body;
	SlingHttpServletRequest request;
	ResourceResolver resourceResolver;

	public SlingTagTest() {
		super();
	}

	protected abstract SlingTag createSubject();

	protected void injectTagMocks() {
		context = mock(PageContext.class);
		body = mock(JspFragment.class);
		request = mock(SlingHttpServletRequest.class);
		resourceResolver = mock(ResourceResolver.class);
		
		when(context.getRequest()).thenReturn(request);
		when(request.getResourceResolver()).thenReturn(resourceResolver);
		
		subject.setJspContext(context);
		subject.setJspBody(body);
	}

}