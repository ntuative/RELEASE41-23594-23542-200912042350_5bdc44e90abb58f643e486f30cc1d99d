package com.sulake.habbo.notifications
{
   public class HabboNotificationItem
   {
       
      
      private var var_87:HabboNotificationItemStyle;
      
      private var var_33:String;
      
      private var var_42:HabboNotifications;
      
      public function HabboNotificationItem(param1:String, param2:HabboNotificationItemStyle, param3:HabboNotifications)
      {
         super();
         var_33 = param1;
         var_87 = param2;
         var_42 = param3;
      }
      
      public function ExecuteUiLinks() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_87.componentLinks;
         for each(_loc2_ in _loc1_)
         {
            if(var_42 != null)
            {
               var_42.onExecuteLink(_loc2_);
            }
         }
      }
      
      public function get style() : HabboNotificationItemStyle
      {
         return var_87;
      }
      
      public function get content() : String
      {
         return var_33;
      }
   }
}
