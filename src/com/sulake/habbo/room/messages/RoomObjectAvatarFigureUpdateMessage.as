package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1698:String;
      
      private var var_505:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_505 = param1;
         var_1698 = param2;
      }
      
      public function get race() : String
      {
         return var_1698;
      }
      
      public function get figure() : String
      {
         return var_505;
      }
   }
}
