package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_245:uint = 1;
      
      public static const const_405:uint = 0;
      
      public static const const_790:uint = 8;
      
      public static const const_249:uint = 4;
      
      public static const const_450:uint = 2;
       
      
      private var var_394:uint;
      
      private var var_1794:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_1795:uint;
      
      private var var_104:Rectangle;
      
      private var var_580:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_104 = param3;
         _color = param4;
         var_394 = param5;
         var_1794 = param6;
         var_1795 = param7;
         var_580 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_1794;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_394;
      }
      
      public function get scaleV() : uint
      {
         return var_1795;
      }
      
      public function get tags() : Array
      {
         return var_580;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_104 = null;
         var_580 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_104;
      }
   }
}
