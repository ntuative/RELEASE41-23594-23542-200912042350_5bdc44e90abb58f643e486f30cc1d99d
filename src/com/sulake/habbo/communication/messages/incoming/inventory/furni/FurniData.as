package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1691:String;
      
      private var var_908:String;
      
      private var var_1695:Boolean;
      
      private var var_1690:int;
      
      private var var_1692:Boolean;
      
      private var var_1693:String = "";
      
      private var _category:int;
      
      private var var_1113:int;
      
      private var var_1694:Boolean;
      
      private var var_1697:int = -1;
      
      private var _objId:int;
      
      private var var_1696:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:int)
      {
         super();
         var_1690 = param1;
         var_908 = param2;
         _objId = param3;
         var_1113 = param4;
         _category = param5;
         var_1691 = param6;
         var_1695 = param7;
         var_1692 = param8;
         var_1694 = param9;
         var_1696 = param10;
      }
      
      public function get classId() : int
      {
         return var_1113;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_1695;
      }
      
      public function get stripId() : int
      {
         return var_1690;
      }
      
      public function get stuffData() : String
      {
         return var_1691;
      }
      
      public function get songId() : int
      {
         return var_1697;
      }
      
      public function setSongData(param1:String, param2:int) : void
      {
         var_1693 = param1;
         var_1697 = param2;
      }
      
      public function get expiryTime() : int
      {
         return var_1696;
      }
      
      public function get itemType() : String
      {
         return var_908;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get slotId() : String
      {
         return var_1693;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1694;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1692;
      }
   }
}
