package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1373:String;
      
      private var var_1546:int;
      
      private var var_1543:int;
      
      private var var_1545:int;
      
      private var var_1544:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_1546 = param1.readInteger();
         var_1545 = param1.readInteger();
         var_1543 = param1.readInteger();
         var_1544 = param1.readString();
         var_1373 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1373;
      }
      
      public function get hour() : int
      {
         return var_1546;
      }
      
      public function get minute() : int
      {
         return var_1545;
      }
      
      public function get chatterName() : String
      {
         return var_1544;
      }
      
      public function get chatterId() : int
      {
         return var_1543;
      }
   }
}
