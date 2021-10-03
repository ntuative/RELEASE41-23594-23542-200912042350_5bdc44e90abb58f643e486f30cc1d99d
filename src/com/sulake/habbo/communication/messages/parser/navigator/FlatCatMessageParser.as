package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCatMessageParser implements IMessageParser
   {
       
      
      private var var_392:int;
      
      private var var_1235:int;
      
      public function FlatCatMessageParser()
      {
         super();
      }
      
      public function get flatId() : int
      {
         return var_392;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_392 = param1.readInteger();
         var_1235 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_392 = 0;
         var_1235 = 0;
         return true;
      }
      
      public function get nodeId() : int
      {
         return var_1235;
      }
   }
}
