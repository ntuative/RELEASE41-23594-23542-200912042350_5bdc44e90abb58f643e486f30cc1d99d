package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.ICoreUpdateReceiver;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.utils.IInternalWindowServices;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.InternalWindowServices;
   import com.sulake.core.window.utils.KeyboardEventQueue;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, ICoreUpdateReceiver
   {
      
      public static var var_858:MouseEventQueue;
      
      public static var var_1511:IMouseCursor;
      
      public static const const_1517:int = 2;
      
      private static var var_883:Factory;
      
      private static var var_127:IWindowRenderer;
      
      public static var var_1285:KeyboardEventQueue;
      
      public static const const_1403:int = 1;
      
      public static const ERROR_DURING_EVENT_HANDLING:int = 5;
      
      public static const const_1541:int = 0;
      
      public static const const_1542:int = 3;
      
      public static const const_1310:int = 4;
       
      
      protected var var_2148:IWindowFactory;
      
      private var _disposed:Boolean = false;
      
      private var var_592:WindowController;
      
      private var var_620:Date;
      
      protected var var_2146:IWindowParser;
      
      protected var var_860:Error;
      
      protected var var_2147:IInternalWindowServices;
      
      protected var var_101:WindowController;
      
      protected var var_1288:int = -1;
      
      protected var var_94:IDesktopWindow;
      
      private var var_1310:Boolean = false;
      
      protected var var_2232:Boolean = true;
      
      private var var_182:Boolean = false;
      
      protected var var_1034:SubstituteParentController;
      
      private var var_2172:Point;
      
      protected var var_302:DisplayObjectContainer;
      
      private var var_321:IWindowContextStateListener;
      
      private var _name:String;
      
      protected var _localization:ICoreLocalizationManager;
      
      private var var_502:Point;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         var_502 = new Point();
         var_2172 = new Point();
         super();
         _name = param1;
         var_127 = param2;
         _localization = param4;
         var_302 = param5;
         var_2147 = new InternalWindowServices(this,param5);
         var_2148 = param3;
         var_2146 = new WindowParser(this);
         var_620 = new Date();
         if(var_883 == null)
         {
            var_883 = new Factory();
         }
         if(var_858 == null)
         {
            var_858 = new MouseEventQueue(param5);
         }
         if(var_1285 == null)
         {
            var_1285 = new KeyboardEventQueue(param5);
         }
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         var_94 = new DesktopController("_CONTEXT_DESKTOP_" + _name,"Desktop " + _name,WindowType.const_380,WindowStyle.const_241,WindowParam.const_98,this,param6,null,null);
         var_302.addChild(var_94.getDisplayObject());
         var_302.doubleClickEnabled = true;
         var_302.addEventListener(Event.RESIZE,stageResizedHandler);
         var_101 = WindowController(var_94);
         var_1034 = new SubstituteParentController("WindowContext::SubstituteParent","",0,0,0,this,new Rectangle(0,0,0,0),null,null,null,null,0);
         var_321 = param7;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == var_94)
         {
            var_94 = null;
         }
         if(param1.state != WindowState.const_394)
         {
            param1.destroy();
         }
         var_127.removeRenderable(param1 as WindowController);
         return true;
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:Class = var_883.getWindowClassByType(param3);
         if(_loc12_ == null)
         {
            handleError(WindowContext.const_1310,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = var_1034;
            }
         }
         return new _loc12_(param1,param2,param3,param4,param5,this,param6,param8 != null ? param8 : var_94,param7,param10,param11,param9);
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return var_94;
      }
      
      public function render(param1:uint) : void
      {
         var_1310 = true;
         var_127.update(param1);
         var_1310 = false;
      }
      
      public function dispose() : void
      {
         _disposed = true;
         var_302.removeEventListener(Event.RESIZE,stageResizedHandler);
         var_302.removeChild(IGraphicContextHost(var_94).getGraphicContext(true) as DisplayObject);
         var_94.destroy();
         var_94 = null;
         var_1034.destroy();
         var_1034 = null;
         var_883 = null;
         var_127 = null;
         var_101 = null;
         var_620 = null;
         var_321 = null;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(var_94 != null && true)
         {
            if(var_302 is Stage)
            {
               var_94.width = Stage(var_302).stageWidth;
               var_94.height = Stage(var_302).stageHeight;
            }
            else
            {
               var_94.width = var_302.width;
               var_94.height = var_302.height;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         _localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : Boolean
      {
         var_127.addToRenderQueue(WindowController(param1),param2,param3);
         return true;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return var_2146;
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         _localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return var_2148;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_182 = true;
         if(var_860)
         {
            throw var_860;
         }
         var _loc6_:Point = new Point();
         var _loc7_:MouseEventQueue = WindowContext.var_858;
         _loc7_.begin();
         var_502.x = -1;
         var_502.y = -1;
         while(true)
         {
            _loc2_ = _loc7_.next() as MouseEvent;
            if(_loc2_ == null)
            {
               break;
            }
            if(_loc2_.stageX != var_502.x || _loc2_.stageY != var_502.y)
            {
               var_502.x = _loc2_.stageX;
               var_502.y = _loc2_.stageY;
               _loc5_ = new Array();
               var_94.groupChildrenUnderPoint(var_502,_loc5_);
            }
            _loc3_ = _loc5_ != null ? int(_loc5_.length) : 0;
            if(_loc3_ == 1)
            {
               if(_loc2_.type == MouseEvent.MOUSE_MOVE)
               {
                  if(var_101 != var_94 && true)
                  {
                     var_101.getGlobalPosition(_loc6_);
                     var_101.update(var_101,new MouseEvent(MouseEvent.MOUSE_OUT,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                     var_101 = WindowController(var_94);
                  }
               }
            }
            while(--_loc3_ > -1)
            {
               _loc4_ = passMouseEvent(WindowController(_loc5_[_loc3_]),_loc2_);
               if(_loc4_ != null && _loc4_.visible)
               {
                  if(_loc2_.type == MouseEvent.MOUSE_MOVE)
                  {
                     if(_loc4_ != var_101)
                     {
                        if(true)
                        {
                           var_101.getGlobalPosition(_loc6_);
                           var_101.update(var_101,new MouseEvent(MouseEvent.MOUSE_OUT,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                        }
                        if(!_loc4_.disposed)
                        {
                           _loc4_.getGlobalPosition(_loc6_);
                           _loc4_.update(_loc4_,new MouseEvent(MouseEvent.MOUSE_OVER,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                        }
                        if(!_loc4_.disposed)
                        {
                           var_101 = _loc4_;
                        }
                     }
                  }
                  else if(_loc2_.type == MouseEvent.MOUSE_UP || _loc2_.type == MouseEvent.CLICK)
                  {
                     if(var_101 && true)
                     {
                        if(var_321 != null)
                        {
                           var_321.mouseEventReceived(_loc2_.type,var_101);
                        }
                     }
                  }
                  if(_loc2_.altKey)
                  {
                     if(var_101)
                     {
                        Logger.log("HOVER: undefined");
                     }
                  }
                  if(_loc4_ != var_94)
                  {
                     _loc2_.stopPropagation();
                     _loc7_.remove();
                  }
                  break;
               }
            }
         }
         _loc7_.end();
         var_182 = false;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         var_860 = param2;
         var_1288 = param1;
         if(var_2232)
         {
            throw param2;
         }
      }
      
      public function getLastError() : Error
      {
         return var_860;
      }
      
      public function getMouseCursor() : IMouseCursor
      {
         if(var_1511 == null)
         {
            var_1511 = new MouseCursorControl(var_302 as Stage);
         }
         return var_1511;
      }
      
      public function flushError() : void
      {
         var_860 = null;
         var_1288 = -1;
      }
      
      public function getLastErrorCode() : int
      {
         return var_1288;
      }
      
      private function passMouseEvent(param1:WindowController, param2:MouseEvent) : WindowController
      {
         if(param1.disposed)
         {
            return null;
         }
         if(!param1.testParamFlag(WindowParam.const_46))
         {
            return null;
         }
         if(param1.testStateFlag(WindowState.const_66))
         {
            return null;
         }
         var _loc3_:Point = new Point(param2.stageX,param2.stageY);
         param1.convertPointFromGlobalToLocalSpace(_loc3_);
         var _loc4_:BitmapData = var_127.getDrawBufferForRenderable(param1);
         if(!param1.validateLocalPointIntersection(_loc3_,_loc4_))
         {
            return null;
         }
         if(param1.testParamFlag(WindowParam.const_398))
         {
            if(param1.parent != null)
            {
               return passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         var _loc5_:Boolean = true;
         switch(param2.type)
         {
            case MouseEvent.MOUSE_DOWN:
               var_592 = param1;
               break;
            case MouseEvent.CLICK:
               if(var_592 != param1)
               {
                  _loc5_ = false;
               }
               else
               {
                  var_592 = null;
               }
               break;
            case MouseEvent.DOUBLE_CLICK:
               if(var_592 != param1)
               {
                  _loc5_ = false;
               }
               else
               {
                  var_592 = null;
               }
         }
         if(_loc5_)
         {
            if(!param1.update(param1,param2))
            {
               if(param1.parent)
               {
                  return passMouseEvent(WindowController(param1.parent),param2);
               }
            }
         }
         return param1;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return var_94.findChildByName(param1);
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return var_2147;
      }
   }
}
