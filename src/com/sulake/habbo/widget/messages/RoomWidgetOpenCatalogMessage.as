package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_641:String = "RWOCM_CLUB_MAIN";
      
      public static const const_655:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1885:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_655);
         var_1885 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1885;
      }
   }
}
