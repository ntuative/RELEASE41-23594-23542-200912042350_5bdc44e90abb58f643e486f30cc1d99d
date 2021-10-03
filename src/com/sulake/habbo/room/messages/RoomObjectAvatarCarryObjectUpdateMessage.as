package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_908:int;
      
      private var var_1093:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_908 = param1;
         var_1093 = param2;
      }
      
      public function get itemType() : int
      {
         return var_908;
      }
      
      public function get itemName() : String
      {
         return var_1093;
      }
   }
}
