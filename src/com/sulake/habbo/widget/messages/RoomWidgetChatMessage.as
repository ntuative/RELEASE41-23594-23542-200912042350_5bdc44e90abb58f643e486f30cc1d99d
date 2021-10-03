package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_118:int = 0;
      
      public static const const_125:int = 1;
      
      public static const const_96:int = 2;
      
      public static const const_525:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1054:int = 0;
      
      private var var_1577:String = "";
      
      private var var_200:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_200 = param2;
         var_1054 = param3;
         var_1577 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_1577;
      }
      
      public function get chatType() : int
      {
         return var_1054;
      }
      
      public function get text() : String
      {
         return var_200;
      }
   }
}
