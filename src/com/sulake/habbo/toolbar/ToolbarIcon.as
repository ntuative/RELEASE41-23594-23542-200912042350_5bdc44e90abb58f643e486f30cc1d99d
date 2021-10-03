package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_477:ToolbarIconGroup;
      
      private var var_1014:Boolean = false;
      
      private var var_2021:String;
      
      private var var_708:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1012:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var _state:String = "-1";
      
      private var var_104:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_673:String;
      
      private var var_1624:int;
      
      private var var_674:Timer;
      
      private var var_1477:Array;
      
      private var var_1015:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2212:Array;
      
      private var var_267:ToolbarBarMenuAnimator;
      
      private var var_399:ToolbarIconAnimator;
      
      private var var_561:Array;
      
      private var var_830:Array;
      
      private var var_829:String = "-1";
      
      private var var_2259:Boolean = true;
      
      private var var_1013:Array;
      
      private var var_1248:Timer;
      
      private var var_2022:int;
      
      private var var_89:Number = 0;
      
      private var _y:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         var_561 = new Array();
         var_830 = new Array();
         var_2212 = new Array();
         var_1015 = new ToolbarIconBouncer(0.8,1);
         super();
         var_477 = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         var_673 = param4;
         _events = param5;
         var_267 = param6;
         var_1248 = new Timer(40,40);
         var_1248.addEventListener(TimerEvent.TIMER,updateBouncer);
         var_104 = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_378,HabboWindowStyle.const_40,HabboWindowParam.const_35,new Rectangle(0,0,1,1),onMouseEvent) as IRegionWindow;
         var_104.background = true;
         var_104.alphaTreshold = 0;
         var_104.visible = false;
         _window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_40,HabboWindowParam.const_40,new Rectangle(0,0,1,1),onMouseEvent,0));
         var_104.addChild(_window);
         _window.addEventListener(WindowEvent.const_43,onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return var_1477[var_1013.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return var_2022;
      }
      
      public function get iconId() : String
      {
         return var_673;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         var_708 = param1;
         updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         exists = param1;
         setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         _state = param1;
         exists = true;
         setAnimator();
         setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(var_104 == null || _window == null)
         {
            return;
         }
         var_104.width = _window.width;
         var_104.height = _window.height;
         var _loc1_:Boolean = false;
         if(_loc1_)
         {
            var_89 = (0 - 0) / 2;
            _y = var_708 + (0 - 0) / 2;
         }
         else
         {
            var_89 = var_708 + (0 - 0) / 2;
            _y = (0 - 0) / 2;
         }
         var_104.x = var_89;
         var_104.y = _y;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_104 != null)
         {
            var_104.dispose();
            var_104 = null;
         }
         var_561 = null;
         var_830 = null;
         exists = false;
         _windowManager = null;
         _events = null;
         var_267 = null;
         var_399 = null;
         _bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(var_561.indexOf(param1) < 0)
         {
            var_561.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            var_830.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!var_1014)
         {
            return;
         }
         var _loc3_:StateItem = getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(var_267)
               {
                  var_267.repositionWindow(var_673,true);
               }
               if(_events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_63);
                  _loc4_.iconId = var_673;
                  _events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(false)
               {
                  if(_loc3_.hasStateOver)
                  {
                     state = _loc3_.stateOver;
                  }
                  else
                  {
                     state = var_1012;
                  }
               }
               break;
            case WindowMouseEvent.const_28:
               if(false)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     state = _loc3_.defaultState;
                  }
                  else
                  {
                     state = var_829;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return var_561.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = var_830[var_561.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         var_1014 = param1;
         if(var_104 != null)
         {
            var_104.visible = var_1014;
         }
      }
      
      private function setTooltip() : void
      {
         if(var_104 == null)
         {
            return;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            var_104.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            var_104.toolTipCaption = "${toolbar.icon.tooltip." + var_2021.toLowerCase() + "}";
         }
         var_104.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(var_267 != null)
         {
            var_267.animateWindowIn(this,param1,param2,var_673,param3,param4,getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(var_399 != null && _window != null)
         {
            var_399.update(_window);
            if(var_399.hasNextState())
            {
               state = var_399.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1477 = new Array();
         var_1013 = new Array();
         var_2021 = param1.@id;
         var_2022 = int(param1.@window_offset_from_icon);
         var_1624 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               var_1012 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               var_829 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               var_1013.push(_loc5_.id);
               var_1477.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(var_1012 == "-1")
                  {
                     var_1012 = _loc5_.id;
                  }
                  if(var_829 == "-1")
                  {
                     var_829 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         _state = var_829;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         exists = true;
         _bitmapData = param1;
         setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_267 != null)
         {
            var_267.hideWindow(param1,param2,var_673,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_267 != null)
         {
            var_267.positionWindow(this,param1,param2,var_673,param3,getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(var_267 != null)
         {
            var_267.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get exists() : Boolean
      {
         return var_1014;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(var_1015 != null && _window != null)
         {
            var_1015.update();
            _window.y = var_1015.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(var_674 != null)
         {
            var_674.stop();
            var_674 = null;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && var_1014)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            var_399 = new ToolbarIconAnimator(_loc1_,_assetLibrary,_window,var_89,_y,_bitmapData);
            if(false)
            {
               var_674 = new Timer(_loc1_.timer);
               var_674.addEventListener(TimerEvent.TIMER,updateAnimator);
               var_674.start();
            }
            if(_loc1_.bounce)
            {
               var_1015.reset(-7);
               var_1248.reset();
               var_1248.start();
            }
         }
         else
         {
            var_399 = null;
            _window.bitmap = null;
         }
      }
      
      public function get windowMargin() : Number
      {
         return var_1624 + var_477.windowMargin;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return getStateObject(_state);
      }
      
      public function get window() : IWindow
      {
         return var_104;
      }
      
      public function get x() : Number
      {
         return var_89;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = var_830[var_561.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return var_477;
      }
   }
}
