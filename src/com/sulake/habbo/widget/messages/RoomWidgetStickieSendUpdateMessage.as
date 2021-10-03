package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStickieSendUpdateMessage extends RoomWidgetMessage
   {
      
      public static const const_454:String = "RWSUM_STICKIE_SEND_UPDATE";
      
      public static const const_547:String = "RWSUM_STICKIE_SEND_DELETE";
       
      
      private var var_595:String;
      
      private var var_156:int;
      
      private var var_200:String;
      
      public function RoomWidgetStickieSendUpdateMessage(param1:String, param2:int, param3:String = "", param4:String = "")
      {
         super(param1);
         var_156 = param2;
         var_200 = param3;
         var_595 = param4;
      }
      
      public function get objectId() : int
      {
         return var_156;
      }
      
      public function get text() : String
      {
         return var_200;
      }
      
      public function get colorHex() : String
      {
         return var_595;
      }
   }
}
