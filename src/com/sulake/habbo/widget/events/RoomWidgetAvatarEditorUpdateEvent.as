package com.sulake.habbo.widget.events
{
   public class RoomWidgetAvatarEditorUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_893:String = "RWAEUE_HIDE_CLUB_PROMO";
      
      public static const const_587:String = "RWUE_AVATAR_EDITOR_CLOSED";
      
      public static const const_1246:String = "RWAEUE_MODE_TRIAL";
      
      public static const const_913:String = "RWAEUE_MODE_FULL";
      
      public static const const_410:String = "RWAEUE_SHOW_CLUB_PROMO";
       
      
      private var var_1951:String;
      
      private var var_1952:String;
      
      public function RoomWidgetAvatarEditorUpdateEvent(param1:String, param2:String = "", param3:String = "RWAEUE_MODE_FULL", param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         var_1951 = param2;
         var_1952 = param3;
      }
      
      public function get promoMode() : String
      {
         return var_1952;
      }
      
      public function get promoImageUrl() : String
      {
         return var_1951;
      }
   }
}
