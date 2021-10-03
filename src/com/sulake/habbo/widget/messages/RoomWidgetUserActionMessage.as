package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_697:String = "RWUAM_RESPECT_USER";
      
      public static const const_564:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_646:String = "RWUAM_START_TRADING";
      
      public static const const_509:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_597:String = "RWUAM_WHISPER_USER";
      
      public static const const_618:String = "RWUAM_IGNORE_USER";
      
      public static const const_437:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_605:String = "RWUAM_BAN_USER";
      
      public static const const_584:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_413:String = "RWUAM_KICK_USER";
      
      public static const const_554:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_658:String = " RWUAM_RESPECT_PET";
      
      public static const const_353:String = "RWUAM_KICK_BOT";
      
      public static const const_1230:String = "RWUAM_TRAIN_PET";
      
      public static const const_670:String = "RWUAM_PICKUP_PET";
      
      public static const const_504:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_623:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
