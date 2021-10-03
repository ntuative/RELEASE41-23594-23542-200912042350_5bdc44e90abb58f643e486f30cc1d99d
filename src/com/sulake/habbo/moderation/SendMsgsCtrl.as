package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModMessageMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class SendMsgsCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1329:String;
      
      private var var_1092:int;
      
      private var var_763:IDropMenuWindow;
      
      private var var_56:ModerationManager;
      
      private var var_360:ITextFieldWindow;
      
      private var var_58:IFrameWindow;
      
      private var var_290:Boolean = true;
      
      public function SendMsgsCtrl(param1:ModerationManager, param2:int, param3:String)
      {
         super();
         var_56 = param1;
         var_1092 = param2;
         var_1329 = param3;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_316)
         {
            return;
         }
         if(!var_290)
         {
            return;
         }
         var_360.text = "";
         var_290 = false;
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_58;
      }
      
      private function onSendMessageButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending message...");
         if(var_290 || false)
         {
            var_56.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return;
         }
         var_56.connection.send(new ModMessageMessageComposer(var_1092,var_360.text));
         this.dispose();
      }
      
      public function getId() : String
      {
         return var_1329;
      }
      
      private function prepareMsgSelect(param1:IDropMenuWindow) : void
      {
         Logger.log("MSG TEMPLATES: " + var_56.initMsg.messageTemplates.length);
         param1.populate(var_56.initMsg.messageTemplates);
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      private function onSelectTemplate(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_53)
         {
            return;
         }
         var _loc3_:String = var_56.initMsg.messageTemplates["null"];
         if(_loc3_ != null)
         {
            var_290 = false;
            var_360.text = _loc3_;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_58 != null)
         {
            var_58.destroy();
            var_58 = null;
         }
         var_763 = null;
         var_360 = null;
         var_56 = null;
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function show() : void
      {
         var_58 = IFrameWindow(var_56.getXmlWindow("send_msgs"));
         var_58.caption = "Msg To: " + var_1329;
         var_58.findChildByName("send_message_but").procedure = onSendMessageButton;
         var_360 = ITextFieldWindow(var_58.findChildByName("message_input"));
         var_360.procedure = onInputClick;
         var_763 = IDropMenuWindow(var_58.findChildByName("msgTemplatesSelect"));
         prepareMsgSelect(var_763);
         var_763.procedure = onSelectTemplate;
         var _loc1_:IWindow = var_58.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_58.visible = true;
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1309;
      }
   }
}
