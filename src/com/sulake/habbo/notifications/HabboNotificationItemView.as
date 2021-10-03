package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.ICoreUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class HabboNotificationItemView implements ICoreUpdateReceiver
   {
      
      private static const const_340:int = 0;
      
      private static const const_339:Number = 50;
      
      public static const const_688:int = 70;
      
      private static const const_755:int = 2;
      
      public static const const_384:int = 4;
      
      private static const const_756:int = 3;
      
      private static const const_461:int = 1;
       
      
      private var var_1206:Boolean = false;
      
      private var var_550:int;
      
      private var _window:IWindow;
      
      private var var_1447:int;
      
      private var var_394:Number;
      
      private var var_1967:Map;
      
      private var _state:int;
      
      private var var_988:uint;
      
      private var var_1207:int;
      
      private var var_805:uint;
      
      private var var_395:Map;
      
      private var var_804:uint;
      
      private var var_232:HabboNotificationItem;
      
      private var var_203:IHabboToolbar;
      
      public function HabboNotificationItemView(param1:IAsset, param2:IHabboWindowManager, param3:Map, param4:Map, param5:IHabboToolbar)
      {
         super();
         var_1967 = param3;
         var_395 = param4;
         var _loc6_:XmlAsset = param1 as XmlAsset;
         if(_loc6_ == null)
         {
            return;
         }
         _window = ICoreWindowManager(param2).buildFromXML(_loc6_.content as XML,1);
         _window.tags.push("notificationview");
         _window.context.getDesktopWindow().addEventListener(WindowEvent.const_43,onRoomViewResized);
         _window.procedure = onWindowEvent;
         _window.blend = 0;
         _window.visible = false;
         var _loc7_:ITextWindow = IWindowContainer(_window).findChildByTag("notification_text") as ITextWindow;
         if(_loc7_ != null)
         {
            var_1207 = 0 - _loc7_.rectangle.bottom;
         }
         else
         {
            var_1207 = 15;
         }
         var_1447 = _window.height;
         var_550 = 4;
         var_394 = 0;
         _state = const_340;
         var_203 = param5;
      }
      
      private function startDisplay() : void
      {
         var_988 = 0;
         _state = const_755;
      }
      
      private function setNotificationText(param1:String) : void
      {
         var _loc2_:ITextWindow = IWindowContainer(_window).findChildByTag("notification_text") as ITextWindow;
         if(_loc2_ == null || param1 == null)
         {
            return;
         }
         _window.height = 0;
         _loc2_.text = param1;
         _loc2_.height = _loc2_.textHeight + var_1207;
         if(_window.height < var_1447)
         {
            _window.height = var_1447;
         }
      }
      
      private function startFadeIn() : void
      {
         var_805 = 0;
         _state = const_461;
         _window.visible = true;
      }
      
      private function setNotificationIcon(param1:BitmapData) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:IBitmapWrapperWindow = IWindowContainer(_window).findChildByTag("notification_icon") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            _loc2_.bitmap = null;
            return;
         }
         if(param1.width < _loc2_.width && param1.height < _loc2_.height)
         {
            _loc3_ = new BitmapData(_loc2_.width,_loc2_.height,true,0);
            _loc5_ = (_loc2_.width - param1.width) / 2;
            _loc6_ = (_loc2_.height - param1.height) / 2;
            _loc3_.copyPixels(param1,param1.rect,new Point(_loc5_,_loc6_));
         }
         else if(param1.width < param1.height)
         {
            _loc3_ = new BitmapData(param1.height,param1.height,true,0);
            _loc4_ = (param1.height * _loc2_.width - param1.width * _loc2_.width) / 2 / _loc2_.width;
            _loc3_.copyPixels(param1,param1.rect,new Point(_loc4_,0));
         }
         else if(param1.width > param1.height)
         {
            _loc3_ = new BitmapData(param1.width,param1.width,true,0);
            _loc4_ = (param1.width * _loc2_.height - param1.height * _loc2_.height) / 2 / _loc2_.height;
            _loc3_.copyPixels(param1,param1.rect,new Point(0,_loc4_));
         }
         else
         {
            _loc3_ = new BitmapData(param1.width,param1.height);
            _loc3_.copyPixels(param1,param1.rect,new Point(0,0));
         }
         _loc2_.bitmap = _loc3_;
      }
      
      private function startFadeOut() : void
      {
         var_804 = 0;
         _state = const_756;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         switch(_state)
         {
            case const_340:
               break;
            case const_461:
               var_805 += param1;
               _loc2_ = Number(var_805) / Number(var_395["time_fade_in"]);
               if(var_805 > int(var_395["time_fade_in"]))
               {
                  startDisplay();
               }
               adjustBlend(_loc2_);
               break;
            case const_755:
               var_988 += param1;
               if(var_988 > int(var_395["time_display"]) && !var_1206)
               {
                  startFadeOut();
               }
               break;
            case const_756:
               var_804 += param1;
               _loc3_ = 1 - Number(var_804) / Number(var_395["time_fade_out"]);
               adjustBlend(_loc3_);
               if(var_804 > int(var_395["time_fade_in"]))
               {
                  startIdling();
               }
         }
      }
      
      private function startIdling() : void
      {
         _state = const_340;
         _window.visible = false;
      }
      
      public function reposition(param1:int = -1) : void
      {
         if(_window == null)
         {
            return;
         }
         if(var_203 == null)
         {
            return;
         }
         var _loc2_:IDesktopWindow = _window.context.getDesktopWindow();
         if(_loc2_ == null)
         {
            return;
         }
         if(param1 != -1)
         {
            var_550 = param1;
         }
         var _loc3_:int = var_203.orientation == "TOP" ? int(const_339) : 0;
         var _loc4_:int = var_203.orientation == "BOTTOM" ? int(_loc2_.height - const_339) : int(_loc2_.height);
         var _loc5_:int = var_203.orientation == "LEFT" ? int(const_339) : 0;
         var _loc6_:int = var_203.orientation == "RIGHT" ? int(_loc2_.width - const_339) : int(_loc2_.width);
         if(false)
         {
            if(false)
            {
               _window.x = _loc5_ + const_384;
            }
            else
            {
               _window.x = _loc6_ - 0 - const_384;
            }
         }
         else if(false)
         {
            _window.x = _loc5_ + const_384;
         }
         else
         {
            _window.x = _loc6_ - 0 - const_384;
         }
         if(false)
         {
            if(false)
            {
               _window.y = _loc3_ + var_550;
            }
            else
            {
               _window.y = _loc4_ - 0 - var_550;
            }
         }
         else if(false)
         {
            _window.y = _loc3_ + var_550;
         }
         else
         {
            _window.y = _loc4_ - 0 - var_550;
         }
      }
      
      public function onWindowEvent(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            var_1206 = true;
            Logger.log("notifications - hover on");
         }
         else if(param1.type == WindowMouseEvent.const_28)
         {
            var_1206 = false;
            Logger.log("notifications - hover off");
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(var_232 != null)
            {
               var_232.ExecuteUiLinks();
            }
         }
      }
      
      public function replaceIcon(param1:BadgeImageReadyEvent) : void
      {
         if(param1.badgeId != var_232.style.iconSrc)
         {
            return;
         }
         if(param1.badgeImage != null)
         {
            setNotificationIcon(param1.badgeImage);
         }
      }
      
      private function onRoomViewResized(param1:WindowEvent) : void
      {
         reposition();
      }
      
      public function get ready() : Boolean
      {
         return _state == const_340;
      }
      
      public function get disposed() : Boolean
      {
         return _window == null;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function showItem(param1:HabboNotificationItem) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:String = param1.content;
         setNotificationText(_loc2_);
         var _loc3_:BitmapData = param1.style.icon;
         setNotificationIcon(_loc3_);
         var_232 = param1;
         reposition();
         startFadeIn();
      }
      
      private function adjustBlend(param1:Number) : void
      {
         var_394 = param1;
         if(var_394 > 1)
         {
            var_394 = 1;
         }
         if(var_394 < 0)
         {
            var_394 = 0;
         }
         _window.blend = var_394;
      }
      
      public function get verticalPosition() : int
      {
         return var_550;
      }
   }
}
