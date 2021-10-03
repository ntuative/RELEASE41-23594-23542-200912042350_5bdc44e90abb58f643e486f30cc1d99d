package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1278:int;
      
      private var var_1128:int;
      
      private var var_1279:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1278;
      }
      
      public function flush() : Boolean
      {
         var_1128 = 0;
         var_1278 = 0;
         var_1279 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1128;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1278 = param1.readInteger();
         var_1128 = param1.readInteger();
         var_1279 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1279;
      }
   }
}
