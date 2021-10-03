package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2023:String;
      
      private var var_846:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_2023 = param1;
         var_846 = param2;
      }
      
      public function get postureType() : String
      {
         return var_2023;
      }
      
      public function get parameter() : String
      {
         return var_846;
      }
   }
}
