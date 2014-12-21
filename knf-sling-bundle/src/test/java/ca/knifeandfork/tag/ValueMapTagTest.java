package ca.knifeandfork.tag;

import static org.mockito.Mockito.*;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ValueMap;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class ValueMapTagTest  extends SlingTagTest {
	
	@Mock Resource resource;
	@Mock ValueMap valueMap;

	@Before
	public void setUp() throws Exception {
		
		subject = createSubject();
		injectTagMocks();
		
		when(resourceResolver.getResource("/content/test")).thenReturn(resource);
		when(resource.adaptTo(ValueMap.class)).thenReturn(valueMap);
	}

	@Test
	public void testDoTag() throws Exception {
		subject.doTag();
		verify(context).setAttribute("foo", valueMap);
	}

	@Override
	protected SlingTag createSubject() {
		ValueMapTag tag = new ValueMapTag();
		tag.setVar("foo");
		tag.setPath("/content/test");
		return tag;
	}

}
