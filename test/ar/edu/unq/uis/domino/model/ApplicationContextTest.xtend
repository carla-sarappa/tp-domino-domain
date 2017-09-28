package ar.edu.unq.uis.domino.model

import org.junit.Before
import ar.edu.unq.uis.domino.repo.Repositories
import static org.mockito.Mockito.*
import org.uqbar.commons.applicationContext.ApplicationContext

class ApplicationContextTest {
	
	@Before
    def void setUp() {
    	Repositories.init
    	ApplicationContext.instance.configureSingleton(typeof(GmailSender), spy(mock(GmailSender)))    	
    }
	
}