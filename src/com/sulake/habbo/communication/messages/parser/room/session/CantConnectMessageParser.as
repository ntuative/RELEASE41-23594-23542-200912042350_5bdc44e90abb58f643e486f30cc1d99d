package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1467:int = 2;
      
      public static const const_328:int = 4;
      
      public static const const_1100:int = 1;
      
      public static const const_1235:int = 3;
       
      
      private var var_1023:int = 0;
      
      private var var_846:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_1023;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1023 = param1.readInteger();
         if(var_1023 == 3)
         {
            var_846 = param1.readString();
         }
         else
         {
            var_846 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1023 = 0;
         var_846 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_846;
      }
   }
}
