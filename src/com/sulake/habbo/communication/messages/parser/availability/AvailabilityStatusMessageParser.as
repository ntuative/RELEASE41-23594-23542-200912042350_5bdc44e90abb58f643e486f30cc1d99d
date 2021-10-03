package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_896:Boolean;
      
      private var var_1152:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_896 = param1.readInteger() > 0;
         var_1152 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_896;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1152;
      }
      
      public function flush() : Boolean
      {
         var_896 = false;
         var_1152 = false;
         return true;
      }
   }
}
