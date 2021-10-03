package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1690:int;
      
      private var var_1692:Boolean;
      
      private var var_1697:int;
      
      private var var_1691:String;
      
      private var var_1803:Boolean = false;
      
      private var var_1696:int;
      
      private var var_415:int;
      
      private var var_908:String;
      
      private var var_1693:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1113:int;
      
      private var var_1694:Boolean;
      
      private var var_1804:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1690 = param1;
         var_908 = param2;
         _objId = param3;
         var_1113 = param4;
         var_1691 = param5;
         var_1692 = param6;
         var_1694 = param7;
         var_1696 = param8;
         var_1693 = param9;
         var_1697 = param10;
         var_415 = -1;
      }
      
      public function get songId() : int
      {
         return var_1697;
      }
      
      public function get iconCallbackId() : int
      {
         return var_415;
      }
      
      public function get expiryTime() : int
      {
         return var_1696;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_1804 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1803 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_415 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1694;
      }
      
      public function get slotId() : String
      {
         return var_1693;
      }
      
      public function get classId() : int
      {
         return var_1113;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1692;
      }
      
      public function get stuffData() : String
      {
         return var_1691;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1690;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1803;
      }
      
      public function get prevCallbackId() : int
      {
         return var_1804;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_908;
      }
   }
}
