package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_192:String = "RWUIUE_PEER";
      
      public static const const_201:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1286:String = "BOT";
      
      public static const const_873:int = 2;
      
      public static const const_1133:int = 0;
      
      public static const const_979:int = 3;
       
      
      private var var_1046:String = "";
      
      private var var_1985:Boolean = false;
      
      private var var_1648:int = 0;
      
      private var var_1635:int = 0;
      
      private var var_1991:Boolean = false;
      
      private var var_1047:String = "";
      
      private var var_1990:Boolean = false;
      
      private var _respectLeft:int = 0;
      
      private var var_1983:Boolean = true;
      
      private var var_952:int = 0;
      
      private var var_1986:Boolean = false;
      
      private var var_1239:Boolean = false;
      
      private var var_1987:Boolean = false;
      
      private var var_1637:int = 0;
      
      private var var_1988:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_246:Array;
      
      private var var_1240:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1646:int = 0;
      
      private var var_1989:Boolean = false;
      
      private var var_1984:int = 0;
      
      private var var_1636:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_246 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1635;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1635 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_1985;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_1983;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_1983 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_1990 = param1;
      }
      
      public function get motto() : String
      {
         return var_1046;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_1986 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1239;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1046 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_1989;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1636;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1239 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_1988;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1637 = param1;
      }
      
      public function get badges() : Array
      {
         return var_246;
      }
      
      public function get amIController() : Boolean
      {
         return var_1991;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_1991 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_1989 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_1984 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1636 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1047 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_1990;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_1986;
      }
      
      public function get carryItem() : int
      {
         return var_1637;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1240;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1240 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         _respectLeft = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_1984;
      }
      
      public function get realName() : String
      {
         return var_1047;
      }
      
      public function set webID(param1:int) : void
      {
         var_1646 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_246 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_1987 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_1988 = param1;
      }
      
      public function get respectLeft() : int
      {
         return _respectLeft;
      }
      
      public function get webID() : int
      {
         return var_1646;
      }
      
      public function set groupId(param1:int) : void
      {
         var_952 = param1;
      }
      
      public function get xp() : int
      {
         return var_1648;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_1985 = param1;
      }
      
      public function get groupId() : int
      {
         return var_952;
      }
      
      public function get canTrade() : Boolean
      {
         return var_1987;
      }
      
      public function set xp(param1:int) : void
      {
         var_1648 = param1;
      }
   }
}
