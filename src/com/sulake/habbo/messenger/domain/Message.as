package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_604:int = 2;
      
      public static const const_840:int = 6;
      
      public static const const_692:int = 1;
      
      public static const const_596:int = 3;
      
      public static const const_961:int = 4;
      
      public static const const_527:int = 5;
       
      
      private var var_1918:String;
      
      private var var_879:int;
      
      private var var_1566:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_879 = param2;
         var_1566 = param3;
         var_1918 = param4;
      }
      
      public function get time() : String
      {
         return var_1918;
      }
      
      public function get senderId() : int
      {
         return var_879;
      }
      
      public function get messageText() : String
      {
         return var_1566;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
