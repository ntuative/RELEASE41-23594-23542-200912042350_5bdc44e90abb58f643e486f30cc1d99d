package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_571:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1522:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_571);
         var_1522 = param1;
      }
      
      public function get tag() : String
      {
         return var_1522;
      }
   }
}
