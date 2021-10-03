package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2076:int;
      
      private var var_1096:String;
      
      private var var_2078:int;
      
      private var var_2077:int;
      
      private var var_2079:int;
      
      private var var_2075:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1096;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_2075;
      }
      
      public function get responseType() : int
      {
         return var_2077;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_2078;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1096 = param1.readString();
         var_2078 = param1.readInteger();
         var_2076 = param1.readInteger();
         var_2079 = param1.readInteger();
         var_2077 = param1.readInteger();
         var_2075 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_2076;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_2079;
      }
   }
}
