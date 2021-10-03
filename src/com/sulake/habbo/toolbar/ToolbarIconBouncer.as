package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1993:Number;
      
      private var var_557:Number = 0;
      
      private var var_1992:Number;
      
      private var var_556:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1993 = param1;
         var_1992 = param2;
      }
      
      public function update() : void
      {
         var_556 += var_1992;
         var_557 += var_556;
         if(var_557 > 0)
         {
            var_557 = 0;
            var_556 = var_1993 * -1 * var_556;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_556 = param1;
         var_557 = 0;
      }
      
      public function get location() : Number
      {
         return var_557;
      }
   }
}
