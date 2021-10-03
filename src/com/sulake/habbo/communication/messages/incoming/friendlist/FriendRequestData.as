package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_2016:int;
      
      private var var_2017:String;
      
      private var var_1262:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1262 = param1.readInteger();
         this.var_2017 = param1.readString();
         this.var_2016 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1262;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2016;
      }
      
      public function get requesterName() : String
      {
         return this.var_2017;
      }
   }
}
