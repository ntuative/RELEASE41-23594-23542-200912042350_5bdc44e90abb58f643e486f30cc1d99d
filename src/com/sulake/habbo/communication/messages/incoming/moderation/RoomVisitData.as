package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_585:String;
      
      private var var_1754:int;
      
      private var var_1312:Boolean;
      
      private var _roomId:int;
      
      private var var_1755:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1312 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_585 = param1.readString();
         var_1755 = param1.readInteger();
         var_1754 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1312;
      }
      
      public function get roomName() : String
      {
         return var_585;
      }
      
      public function get enterMinute() : int
      {
         return var_1754;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1755;
      }
   }
}
