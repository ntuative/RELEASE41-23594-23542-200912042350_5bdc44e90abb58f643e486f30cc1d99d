package com.sulake.habbo.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.utils.INotify;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class AlertDialog implements IAlertDialog, INotify
   {
      
      private static var var_583:uint = 0;
       
      
      protected var _disposed:Boolean = false;
      
      protected var _window:IFrameWindow;
      
      protected var _title:String = "";
      
      protected var var_185:Function = null;
      
      protected var var_1103:String = "";
      
      public function AlertDialog(param1:IHabboWindowManager, param2:XML, param3:String, param4:String, param5:uint, param6:Function)
      {
         super();
         ++var_583;
         _window = param1.buildFromXML(param2,2) as IFrameWindow;
         _window.procedure = dialogEventProc;
         _window.center();
         this.title = param3;
         this.description = param4;
         this.callback = param6;
      }
      
      public function get callback() : Function
      {
         return var_185;
      }
      
      public function set description(param1:String) : void
      {
         var_1103 = param1;
         if(_window)
         {
            ITextWindow(_window.findChildByTag("DESCRIPTION")).text = var_1103;
         }
      }
      
      public function get description() : String
      {
         return var_1103;
      }
      
      public function set callback(param1:Function) : void
      {
         var_185 = param1;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(_window && true)
            {
               _window.dispose();
               _window = null;
            }
            var_185 = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      protected function dialogEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "_alert_button_ok":
                  if(var_185 != null)
                  {
                     var_185(this,new WindowEvent(WindowEvent.const_187,null,null));
                  }
                  break;
               case "header_button_close":
                  if(var_185 != null)
                  {
                     var_185(this,new WindowEvent(WindowEvent.const_534,null,null));
                  }
            }
         }
      }
      
      public function set title(param1:String) : void
      {
         _title = param1;
         if(_window)
         {
            _window.caption = _title;
         }
      }
   }
}
