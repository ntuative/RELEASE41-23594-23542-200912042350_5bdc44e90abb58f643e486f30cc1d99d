package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1666:Boolean = false;
      
      private var var_1661:Boolean = false;
      
      private var var_1565:String = "";
      
      private var _type:String = "";
      
      private var var_1660:Boolean = false;
      
      private var var_1667:Number = 0;
      
      private var var_1665:Number = 0;
      
      private var var_1664:Number = 0;
      
      private var var_1663:String = "";
      
      private var var_1662:Number = 0;
      
      private var var_1659:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_1663 = param2;
         var_1565 = param3;
         var_1665 = param4;
         var_1664 = param5;
         var_1667 = param6;
         var_1662 = param7;
         var_1659 = param8;
         var_1661 = param9;
         var_1660 = param10;
         var_1666 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1659;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1666;
      }
      
      public function get localX() : Number
      {
         return var_1667;
      }
      
      public function get localY() : Number
      {
         return var_1662;
      }
      
      public function get canvasId() : String
      {
         return var_1663;
      }
      
      public function get altKey() : Boolean
      {
         return var_1661;
      }
      
      public function get spriteTag() : String
      {
         return var_1565;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_1665;
      }
      
      public function get screenY() : Number
      {
         return var_1664;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1660;
      }
   }
}
