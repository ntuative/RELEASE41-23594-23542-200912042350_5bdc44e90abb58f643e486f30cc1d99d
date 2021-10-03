package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_605:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_605 = new ByteArray();
         var_605.writeShort(param1);
         var_605.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_605.position = 0;
         if(false)
         {
            _loc1_ = var_605.readShort();
            var_605.position = 0;
         }
         return _loc1_;
      }
   }
}
