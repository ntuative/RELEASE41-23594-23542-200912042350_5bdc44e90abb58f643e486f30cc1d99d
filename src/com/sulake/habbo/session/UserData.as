package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_505:String = "";
      
      private var var_1645:String = "";
      
      private var var_1649:int = 0;
      
      private var var_1648:int = 0;
      
      private var _type:int = 0;
      
      private var var_1647:String = "";
      
      private var var_1258:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_1646:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         var_1649 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         var_1647 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set figure(param1:String) : void
      {
         var_505 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         var_1258 = param1;
      }
      
      public function get groupStatus() : int
      {
         return var_1649;
      }
      
      public function set webID(param1:int) : void
      {
         var_1646 = param1;
      }
      
      public function get groupID() : String
      {
         return var_1647;
      }
      
      public function set custom(param1:String) : void
      {
         var_1645 = param1;
      }
      
      public function get figure() : String
      {
         return var_505;
      }
      
      public function get sex() : String
      {
         return var_1258;
      }
      
      public function get custom() : String
      {
         return var_1645;
      }
      
      public function get webID() : int
      {
         return var_1646;
      }
      
      public function set xp(param1:int) : void
      {
         var_1648 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get xp() : int
      {
         return var_1648;
      }
   }
}
