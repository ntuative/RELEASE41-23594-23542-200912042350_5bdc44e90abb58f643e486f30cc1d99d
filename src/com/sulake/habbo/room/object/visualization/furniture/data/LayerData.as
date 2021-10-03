package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_346:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_537:int = 0;
      
      public static const const_947:int = 2;
      
      public static const const_782:int = 1;
      
      public static const const_501:Boolean = false;
      
      public static const const_578:String = "";
      
      public static const const_447:int = 0;
      
      public static const const_433:int = 0;
      
      public static const const_345:int = 0;
       
      
      private var var_1573:int = 0;
      
      private var var_1522:String = "";
      
      private var var_1320:int = 0;
      
      private var var_1575:int = 0;
      
      private var var_1576:Number = 0;
      
      private var var_1524:int = 255;
      
      private var var_1574:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1573;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1320 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1576;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1575 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1573 = param1;
      }
      
      public function get tag() : String
      {
         return var_1522;
      }
      
      public function get alpha() : int
      {
         return var_1524;
      }
      
      public function get ink() : int
      {
         return var_1320;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1576 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1575;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1574 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1574;
      }
      
      public function set tag(param1:String) : void
      {
         var_1522 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1524 = param1;
      }
   }
}
