package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeLevelMessageData
   {
       
      
      private var var_1871:int;
      
      private var var_1213:int;
      
      private var var_682:Array;
      
      public function PrizeLevelMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_1213 = param1.readInteger();
         var_1871 = param1.readInteger();
         var_682 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_682.push(new PrizeMessageData(param1));
            _loc3_++;
         }
      }
      
      public function get probabilityDenominator() : int
      {
         return var_1871;
      }
      
      public function get prizes() : Array
      {
         return var_682;
      }
      
      public function get prizeLevelId() : int
      {
         return var_1213;
      }
   }
}
