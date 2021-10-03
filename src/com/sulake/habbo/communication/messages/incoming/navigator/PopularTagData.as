package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PopularTagData
   {
       
      
      private var var_1538:int;
      
      private var var_1670:String;
      
      public function PopularTagData(param1:IMessageDataWrapper)
      {
         super();
         var_1670 = param1.readString();
         var_1538 = param1.readInteger();
      }
      
      public function get tagName() : String
      {
         return var_1670;
      }
      
      public function get userCount() : int
      {
         return var_1538;
      }
   }
}
