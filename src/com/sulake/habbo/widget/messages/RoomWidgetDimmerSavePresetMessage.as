package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_594:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1549:int;
      
      private var var_1552:int;
      
      private var var_1733:Boolean;
      
      private var var_915:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_594);
         var_1552 = param1;
         var_1549 = param2;
         _color = param3;
         var_915 = param4;
         var_1733 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1549;
      }
      
      public function get presetNumber() : int
      {
         return var_1552;
      }
      
      public function get brightness() : int
      {
         return var_915;
      }
      
      public function get apply() : Boolean
      {
         return var_1733;
      }
   }
}
