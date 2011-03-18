// ActionScript file
package
{
	import com.riaspace.un.IUnFramework;

	public function get $():IUnFramework
	{
		return instance;
	}
}
import com.riaspace.un.IUnFramework;
import com.riaspace.un.UnFramework;

internal var instance:IUnFramework = new UnFramework;