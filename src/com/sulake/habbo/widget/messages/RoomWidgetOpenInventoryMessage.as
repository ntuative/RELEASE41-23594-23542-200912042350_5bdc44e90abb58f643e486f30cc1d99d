package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_870:String = "inventory_badges";
      
      public static const const_1304:String = "inventory_clothes";
      
      public static const const_1268:String = "inventory_furniture";
      
      public static const const_663:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_905:String = "inventory_effects";
       
      
      private var var_1937:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_663);
         var_1937 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1937;
      }
   }
}
