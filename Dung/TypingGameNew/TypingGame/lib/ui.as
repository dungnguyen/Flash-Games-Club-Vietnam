package lib 
{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import flash.utils.Timer;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.utils.*;
	
	public class ui
	{
		
		public function ui() 
		{
			
		}
		
		public function createInputField (x:uint, y:uint, height:uint, width:uint, border:Boolean, align:String):TextField
		{
			var inputFormat:TextFormat = new TextFormat();
			inputFormat.font = "Arial";
			inputFormat.size = 16;
			inputFormat.align = align;
			
			var myInput:TextField = new TextField();
			myInput.type = TextFieldType.DYNAMIC;
			myInput.defaultTextFormat = inputFormat;
			myInput.x = x;
			myInput.y = y;
			myInput.height = height;
			myInput.width = width;
			myInput.wordWrap = true;
			myInput.border = border;
			myInput.backgroundColor = 0xCCCCCC;
			myInput.background = true;
	
			return myInput;
		}
		public function createButton():Sprite
		{
			var button:Sprite = new Sprite();
			button.graphics.lineStyle(2,0x000000);
			button.graphics.beginFill(0xCCCCCC);
			button.graphics.drawRect(30, 50, 50, 18);
			return button;
		}
		
	}

}