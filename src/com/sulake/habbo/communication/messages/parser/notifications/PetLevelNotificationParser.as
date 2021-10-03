package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_505:String;
      
      private var var_1734:int;
      
      private var var_1968:String;
      
      private var var_890:int;
      
      private var var_1184:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1184;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1184 = param1.readInteger();
         var_1968 = param1.readString();
         var_1734 = param1.readInteger();
         var_505 = param1.readString();
         var_890 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_1968;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_505;
      }
      
      public function get petType() : int
      {
         return var_890;
      }
      
      public function get level() : int
      {
         return var_1734;
      }
   }
}
