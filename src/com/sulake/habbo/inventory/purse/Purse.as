package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1559:Boolean = false;
      
      private var var_1560:int = 0;
      
      private var var_1561:int = 0;
      
      private var var_1563:int = 0;
      
      private var var_1562:int = 0;
      
      private var var_1564:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1562 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_1560;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_1559;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_1559 = param1;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_1560 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1561 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1562;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_1563 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1561;
      }
      
      public function get pixelBalance() : int
      {
         return var_1563;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1564 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1564;
      }
   }
}
