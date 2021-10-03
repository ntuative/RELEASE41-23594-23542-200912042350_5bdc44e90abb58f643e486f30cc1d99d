package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1409:String = "e";
      
      public static const const_1405:String = "i";
      
      public static const const_1503:String = "s";
       
      
      private var _id:int;
      
      private var _title:String;
      
      private var _type:String;
      
      private var var_1730:int;
      
      private var var_1089:Array;
      
      private var var_1729:int;
      
      private var var_1727:int;
      
      private var var_1728:int;
      
      private var _name:String;
      
      private var var_1726:int;
      
      private var var_1103:String;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String)
      {
         super();
         _type = param1;
         _id = param2;
         _name = param3;
         var_1730 = param4;
         var_1726 = param5;
         var_1729 = param6;
         var_1727 = param7;
         var_1728 = param8;
         var_1089 = param9;
         _title = param10;
         var_1103 = param11;
      }
      
      public function get tileSizeY() : int
      {
         return var_1727;
      }
      
      public function get tileSizeZ() : int
      {
         return var_1728;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function get revision() : int
      {
         return var_1726;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get colourIndex() : int
      {
         return var_1730;
      }
      
      public function get tileSizeX() : int
      {
         return var_1729;
      }
      
      public function get colours() : Array
      {
         return var_1089;
      }
      
      public function get description() : String
      {
         return var_1103;
      }
   }
}
