package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_111:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1123:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_111);
         var_1123 = param1;
      }
      
      public function get vote() : int
      {
         return var_1123;
      }
   }
}
