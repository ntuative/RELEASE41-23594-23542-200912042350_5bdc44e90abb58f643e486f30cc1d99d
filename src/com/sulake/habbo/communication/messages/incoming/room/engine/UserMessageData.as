package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1292:String = "F";
      
      public static const const_833:String = "M";
       
      
      private var var_89:Number = 0;
      
      private var var_505:String = "";
      
      private var var_2106:int = 0;
      
      private var var_1645:String = "";
      
      private var var_1649:int = 0;
      
      private var var_1648:int = 0;
      
      private var var_1647:String = "";
      
      private var var_1258:String = "";
      
      private var _id:int = 0;
      
      private var var_205:Boolean = false;
      
      private var var_214:int = 0;
      
      private var var_2107:String = "";
      
      private var _name:String = "";
      
      private var var_1646:int = 0;
      
      private var _y:Number = 0;
      
      private var var_90:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_90;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_214;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_205)
         {
            var_214 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_205)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2106;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_205)
         {
            var_1649 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2107;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_205)
         {
            var_1647 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_205)
         {
            var_2107 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_205)
         {
            var_1648 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_205)
         {
            var_505 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_205)
         {
            var_2106 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_205)
         {
            var_1258 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1649;
      }
      
      public function get groupID() : String
      {
         return var_1647;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_205)
         {
            var_1646 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_205)
         {
            var_1645 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_205 = true;
      }
      
      public function get sex() : String
      {
         return var_1258;
      }
      
      public function get figure() : String
      {
         return var_505;
      }
      
      public function get webID() : int
      {
         return var_1646;
      }
      
      public function get custom() : String
      {
         return var_1645;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_205)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_205)
         {
            var_90 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_205)
         {
            var_89 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_89;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1648;
      }
   }
}
