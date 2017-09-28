package ar.edu.unq.uis.domino.model

import org.junit.Before
import ar.edu.unq.uis.domino.repo.Repositories

class ApplicationContextTest {
	
	@Before
    def void setUp() {
    	Repositories.init
    }
	
}