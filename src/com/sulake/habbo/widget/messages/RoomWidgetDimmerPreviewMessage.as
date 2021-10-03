package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerPreviewMessage extends RoomWidgetMessage
   {
      
      public static const const_627:String = "RWDPM_PREVIEW_DIMMER_PRESET";
       
      
      private var var_915:int;
      
      private var _color:uint;
      
      private var var_2007:Boolean;
      
      public function RoomWidgetDimmerPreviewMessage(param1:uint, param2:int, param3:Boolean)
      {
         super(const_627);
         _color = param1;
         var_915 = param2;
         var_2007 = param3;
      }
      
      public function get brightness() : int
      {
         return var_915;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get bgOnly() : Boolean
      {
         return var_2007;
      }
   }
}
