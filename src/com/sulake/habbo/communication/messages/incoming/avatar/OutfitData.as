package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1827:String;
      
      private var _gender:String;
      
      private var var_1693:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1693 = param1.readInteger();
         var_1827 = param1.readString();
         _gender = param1.readString();
      }
      
      public function get gender() : String
      {
         return _gender;
      }
      
      public function get figureString() : String
      {
         return var_1827;
      }
      
      public function get slotId() : int
      {
         return var_1693;
      }
   }
}
