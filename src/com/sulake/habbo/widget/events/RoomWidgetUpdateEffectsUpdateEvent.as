package com.sulake.habbo.widget.events
{
   public class RoomWidgetUpdateEffectsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_555:String = "RWUEUE_UPDATE_EFFECTS";
       
      
      private var var_258:Array;
      
      public function RoomWidgetUpdateEffectsUpdateEvent(param1:Array = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_555,param2,param3);
         var_258 = param1;
      }
      
      public function get effects() : Array
      {
         return var_258;
      }
   }
}
