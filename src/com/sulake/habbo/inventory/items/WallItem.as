package com.sulake.habbo.inventory.items
{
   public class WallItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var var_1290:String;
      
      protected var var_2144:Boolean;
      
      protected var var_2141:int;
      
      protected var _type:int;
      
      protected var _category:int;
      
      protected var var_1999:Boolean;
      
      protected var var_2142:Boolean;
      
      protected var var_2145:Boolean;
      
      public function WallItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:String)
      {
         super();
         _id = param1;
         _type = param2;
         var_2141 = param3;
         _category = param4;
         var_1999 = param5;
         var_2145 = param6;
         var_2144 = param7;
         var_1290 = param8;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function set extras(param1:String) : void
      {
         var_1290 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get locked() : Boolean
      {
         return var_2142;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2145;
      }
      
      public function get ref() : int
      {
         return var_2141;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get extras() : String
      {
         return var_1290;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2144;
      }
      
      public function get groupable() : Boolean
      {
         return var_1999;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2142 = param1;
      }
   }
}
