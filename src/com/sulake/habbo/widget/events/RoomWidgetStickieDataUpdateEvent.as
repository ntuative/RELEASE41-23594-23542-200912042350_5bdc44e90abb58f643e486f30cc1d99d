package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_724:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_200:String;
      
      private var var_595:String;
      
      private var var_1313:String;
      
      private var var_156:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_156 = param2;
         var_1313 = param3;
         var_200 = param4;
         var_595 = param5;
         _controller = param6;
      }
      
      public function get objectType() : String
      {
         return var_1313;
      }
      
      public function get colorHex() : String
      {
         return var_595;
      }
      
      public function get text() : String
      {
         return var_200;
      }
      
      public function get objectId() : int
      {
         return var_156;
      }
      
      public function get controller() : Boolean
      {
         return _controller;
      }
   }
}
