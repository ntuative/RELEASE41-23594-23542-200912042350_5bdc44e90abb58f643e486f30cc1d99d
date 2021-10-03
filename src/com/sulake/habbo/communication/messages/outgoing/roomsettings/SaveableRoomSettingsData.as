package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var var_1603:Boolean;
      
      private var var_1601:Array;
      
      private var var_1605:Boolean;
      
      private var var_1103:String;
      
      private var var_1609:Boolean;
      
      private var var_1608:int;
      
      private var var_1602:int;
      
      private var var_1045:int;
      
      private var var_1604:Boolean;
      
      private var _roomId:int;
      
      private var var_1600:Boolean;
      
      private var _name:String;
      
      private var _password:String;
      
      private var var_580:Array;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1603 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return var_1608;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1608 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_580;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1605;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1600;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1601 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_580 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1603;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function get categoryId() : int
      {
         return var_1045;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1605 = param1;
      }
      
      public function set allowTrading(param1:Boolean) : void
      {
         var_1600 = param1;
      }
      
      public function set showOwnerName(param1:Boolean) : void
      {
         var_1604 = param1;
      }
      
      public function set allowFurniMoving(param1:Boolean) : void
      {
         var_1609 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1601;
      }
      
      public function get showOwnerName() : Boolean
      {
         return var_1604;
      }
      
      public function get allowFurniMoving() : Boolean
      {
         return var_1609;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1602 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1602;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1045 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1103 = param1;
      }
      
      public function get description() : String
      {
         return var_1103;
      }
   }
}
