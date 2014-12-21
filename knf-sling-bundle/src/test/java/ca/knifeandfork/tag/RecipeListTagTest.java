package ca.knifeandfork.tag;

import static org.junit.Assert.assertEquals;
import static org.mockito.Matchers.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.Iterator;
import java.util.LinkedList;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ValueMap;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class RecipeListTagTest extends SlingTagTest {
	
	@Mock Resource recipeListRes;
	@Mock Resource resA;
	@Mock Resource resB;
	@Mock Resource resC;
	@Mock ValueMap mapA;
	@Mock ValueMap mapB;
	@Mock ValueMap mapC;
	@Mock Iterator<Resource> iter;
	@Captor ArgumentCaptor<LinkedList<Resource>> resourceListCaptor;
	
	@Before
	public void setup() {
		subject = createSubject();
		injectTagMocks();
		
		when(resourceResolver.getResource(RecipeListTag.RECIPE_LIST_URI)).thenReturn(recipeListRes);
		when(recipeListRes.listChildren()).thenReturn(iter);
		when(iter.hasNext()).thenReturn(true, true, true, false);
		when(iter.next()).thenReturn(resB, resC, resA);
		when(resA.adaptTo(ValueMap.class)).thenReturn(mapA);
		when(resB.adaptTo(ValueMap.class)).thenReturn(mapB);
		when(resC.adaptTo(ValueMap.class)).thenReturn(mapC);
		when(mapA.get("title", String.class)).thenReturn("A");
		when(mapB.get("title", String.class)).thenReturn("B");
		when(mapC.get("title", String.class)).thenReturn("C");
	}

	protected final SlingTag createSubject() {
		RecipeListTag tag = new RecipeListTag();
		tag.setVar("foo");
		return tag;
	}

	@Test
	public void test() throws Exception {
		subject.doTag();
	
		verify(context).setAttribute(eq("foo"), resourceListCaptor.capture());
		assertEquals("A",resA, resourceListCaptor.getValue().get(0));
		assertEquals("B",resB, resourceListCaptor.getValue().get(1));
		assertEquals("C",resC, resourceListCaptor.getValue().get(2));
	}

}
