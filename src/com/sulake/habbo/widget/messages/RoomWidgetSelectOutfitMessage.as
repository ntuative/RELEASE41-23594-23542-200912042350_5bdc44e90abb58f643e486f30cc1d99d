package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_951:String = "select_outfit";
       
      
      private var var_1973:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_951);
         var_1973 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_1973;
      }
   }
}
