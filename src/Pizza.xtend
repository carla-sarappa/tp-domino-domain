import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Pizza {
	String nombre
	Double precioBase
	List<Ingrediente> ingredientes = new ArrayList<Ingrediente>
}