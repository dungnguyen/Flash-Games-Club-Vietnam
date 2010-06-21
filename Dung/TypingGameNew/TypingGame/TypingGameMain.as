package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import lib.ui;
	import flash.events.*;
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import flash.utils.Timer;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.utils.*;
	import flash.display.SimpleButton;
	
	public class TypingGameMain extends MovieClip
	{
		private var createTextField:ui;
		private var count:int = 0; 
		private var totalPress:int = 0;
		private var rightPress:int = 0;
		private var gameFinish:Boolean = false;
		private var button:Sprite;
		private var btn_restart:Restart;
		private var btn_lession:Lession;
		
		private var lession:int = 1;
		
		private var arrText1:Array = ["f", " ", "f", " ", "f", " ", "f", " ", "f", " ", "f", " ", "f", " ", "f"]
		private var arrText2:Array = ["j", " ", "j", " ", "j", " ", "j", " ", "j", " ", "j", " ", "j", " ", "j"]
		private var arrText3:Array = ["f", " ", "j", " ", "f", " ", "j", " ", "f", " ", "j", " ", "f", " ", "j"]
		private var arrTextField:Array = new Array();
		private var statistic:TextField;
		private var score:TextField;
		private var time:TextField;
		private var start:int = 0;
		
		public function TypingGameMain() : void
		{
			btn_restart = new Restart();
			btn_restart.x = 100;
			btn_restart.y  = 200;
			addChild(btn_restart);
			
			btn_lession = new Lession();
			btn_lession.x = 100;
			btn_lession.y  = 230;
			addChild(btn_lession);
			
			btn_lession.addEventListener(MouseEvent.CLICK, lessionNumber);
			function lessionNumber(event:MouseEvent)
			{
					if (lession >= 3) lession = 1;
					else lession++;
			}
			
			/*btn_restart.addEventListener(MouseEvent.CLICK, start);
		    function start(event:MouseEvent)
			{
					createLession(arrText2);
					stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownFunction);
			}*/
			
		}
		
		function createLession(arrText:Array)
		{
				createTextField = new ui();
				var i:int;
				for (i = 0; i < arrText.length; i++ )
				{
					var textField:TextField;
					textField = createTextField.createInputField(50  + i * 25,10,25,25,false,"center");
					textField.appendText(arrText[i]);
					if (i / 2 == 0)  textField.backgroundColor = 0x00FF00;
					arrTextField.push(textField);
					addChild(textField);
				}
				
					statistic = createTextField.createInputField(400,50,25,145,false,"left");
					addChild(statistic);
					
					//score
					score = createTextField.createInputField(400,70,25,145,false,"left");
					addChild(score);
					
					//text
					statistic.text = "Typing        0 % ";	
					score.text = "Score        0/0";
					
					time = showOclockUseGetTimer(400, 90, 25, 145, false, "left");
					addChild(time);
		}
		
		function charCodeToChar(code:uint):String
		{
			var char:String;
			switch(code)
			{
				case 32 :
					char = " ";
					break;
				case 102:
					char = "f";
					break;
				case 106:
					char = "j";
					break;
			}
			return char;
		}
		
		function keyDownFunction(event:KeyboardEvent) 
		{
			if(gameFinish == false)
				totalPress++;
			
			if (count < 14)
			{
				var char:String = charCodeToChar(Number(event.charCode));
				var textField:TextField;
					textField = arrTextField[count];
				if (textField.text == char)
				{
					count++;
					var textField1:TextField;
					textField1 = arrTextField[count-1];
					textField1.backgroundColor = 0xCCCCCC;
					var textField2:TextField;
					textField2 = arrTextField[count];
					textField2.backgroundColor = 0x00FF00;
					if(gameFinish == false) rightPress++;

				}
				else 
				{
					var textField3:TextField;
					textField3 = arrTextField[count];
					textField3.backgroundColor = 0xFF0000;
				}
			}else 
			{
				gameFinish = true;
				trace("Cho choi da ket thuc");
				
			}
			statistic.text = "Typing        " + Math.floor (count * 100 / (14)) + " % ";	
			score.text = "Score        " + rightPress + "/" + totalPress;
			
			
				
				
			/*}else {
				
				count = 0;
				
				var textField3:TextField;
				
				textField3 = arrTextField[arrText.length - 1];
				textField3.backgroundColor = 0xCCCCCC;
				
				var textField4:TextField;
				textField4 = arrTextField[count];
				textField4.backgroundColor = 0xFF0000;
			}*/
		}
		public function showOclockUseGetTimer(x:uint, y:uint, height:uint, width:uint, border:Boolean, align:String):TextField
		{
			
			var inputFormat:TextFormat = new TextFormat();
			inputFormat.font = "Arial";
			inputFormat.size = 16;
			inputFormat.align = align;
			
			var timeDisplay:TextField = new TextField();
			
			var startTime:int = getTimer();
			addEventListener(Event.ENTER_FRAME, showClock);
			function showClock(event:Event) 
			{
				if(gameFinish != true){
						// milliseconds passed
					var timePassed:int = getTimer()-startTime;
						// compute minutes and seconds
					var seconds:int = Math.floor(timePassed/1000);
					var minutes:int = Math.floor(seconds/60);
					seconds -= minutes*60;
						// convert to clock string
					var timeString:String = minutes + " : " + String(seconds + 100).substr(1, 2);
			
						// show in text field
					timeDisplay.text = "Time :      " +  timeString;
				}
			}	
			timeDisplay.defaultTextFormat = inputFormat;
			timeDisplay.type = TextFieldType.DYNAMIC;
			timeDisplay.defaultTextFormat = inputFormat;
			timeDisplay.x = x;
			timeDisplay.y = y;
			timeDisplay.height = height;
			timeDisplay.width = width;
			timeDisplay.wordWrap = true;
			timeDisplay.border = border;
			timeDisplay.backgroundColor = 0xCCCCCC;
			timeDisplay.background = true;

			return timeDisplay;
		}
	}
	
}