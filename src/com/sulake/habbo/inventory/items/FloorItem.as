package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_1290:String;
      
      protected var var_2144:Boolean;
      
      protected var var_2005:int;
      
      protected var _type:int;
      
      protected var var_1998:int;
      
      protected var var_2142:Boolean;
      
      protected var var_1697:int;
      
      protected var var_2145:Boolean;
      
      protected var _id:int;
      
      protected var var_2141:int;
      
      protected var var_1693:String;
      
      protected var var_1999:Boolean;
      
      protected var _category:int;
      
      protected var var_2001:int;
      
      protected var var_2143:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:int, param11:int, param12:int, param13:String, param14:int)
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
         var_2143 = param9;
         var_2005 = param10;
         var_2001 = param11;
         var_1998 = param12;
         var_1693 = param13;
         var_1697 = param14;
      }
      
      public function get locked() : Boolean
      {
         return var_2142;
      }
      
      public function get songId() : int
      {
         return var_1697;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2142 = param1;
      }
      
      public function get ref() : int
      {
         return var_2141;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get slotId() : String
      {
         return var_1693;
      }
      
      public function get expires() : int
      {
         return var_2143;
      }
      
      public function get creationYear() : int
      {
         return var_1998;
      }
      
      public function get creationDay() : int
      {
         return var_2005;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2145;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get groupable() : Boolean
      {
         return var_1999;
      }
      
      public function get creationMonth() : int
      {
         return var_2001;
      }
      
      public function get extras() : String
      {
         return var_1290;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2144;
      }
   }
}
