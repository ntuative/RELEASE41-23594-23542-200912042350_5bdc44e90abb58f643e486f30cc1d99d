package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_950:int;
      
      private var var_1829:int;
      
      private var var_1390:int;
      
      private var var_116:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1390 = param1.readInteger();
         var_1829 = param1.readInteger();
         var_950 = param1.readInteger();
         var_116 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1390);
      }
      
      public function get reportedUserId() : int
      {
         return var_950;
      }
      
      public function get callerUserId() : int
      {
         return var_1829;
      }
      
      public function get callId() : int
      {
         return var_1390;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_116;
      }
   }
}
