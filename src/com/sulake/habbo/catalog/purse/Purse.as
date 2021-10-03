package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1561:int = 0;
      
      private var var_1897:int = 0;
      
      private var var_1896:int = 0;
      
      private var var_1564:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get pixels() : int
      {
         return var_1897;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1897 = param1;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1561 = param1;
      }
      
      public function get credits() : int
      {
         return var_1896;
      }
      
      public function get clubDays() : int
      {
         return var_1561;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1564 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1896 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1564;
      }
   }
}
