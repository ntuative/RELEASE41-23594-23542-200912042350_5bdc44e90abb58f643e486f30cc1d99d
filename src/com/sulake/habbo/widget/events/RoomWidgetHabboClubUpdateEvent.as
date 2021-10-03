package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_188:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2084:Boolean = false;
      
      private var var_2085:int = 0;
      
      private var var_2086:int = 0;
      
      private var var_2083:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_188,param5,param6);
         var_2083 = param1;
         var_2086 = param2;
         var_2085 = param3;
         var_2084 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_2085;
      }
      
      public function get periodsLeft() : int
      {
         return var_2086;
      }
      
      public function get daysLeft() : int
      {
         return var_2083;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2084;
      }
   }
}
