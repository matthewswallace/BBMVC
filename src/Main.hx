package;

import org.bbmvc.views.IBBView;
import example.model.MainDM;

class Main implements IBBView
{	
	public var name:String;
	public var viewId:String;
	private var dm:MainDM;
	
	public function new()
	{
		dm = new MainDM();
		dm.registerView(this);
	}
	
	public function destroy():Void
	{
		
	}
	
	public function update(?updateType:String="", ?data:Dynamic=null):Void
	{
			
	}
	public static function main() 
	{
		trace("Hello From FDT haXe !");
		new Main();
	}
}
