package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_219:String = "RWFAM_MOVE";
      
      public static const const_566:String = "RWFUAM_ROTATE";
      
      public static const const_593:String = "RWFAM_PICKUP";
       
      
      private var var_2139:int = 0;
      
      private var var_2138:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_2139 = param2;
         var_2138 = param3;
      }
      
      public function get furniId() : int
      {
         return var_2139;
      }
      
      public function get furniCategory() : int
      {
         return var_2138;
      }
   }
}
