package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1743:int;
      
      private var var_505:String;
      
      private var var_1734:int;
      
      private var var_1925:int;
      
      private var var_1745:int;
      
      private var var_2136:int;
      
      private var _nutrition:int;
      
      private var var_1184:int;
      
      private var var_2133:int;
      
      private var var_2135:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1746:int;
      
      private var var_2134:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1734;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_2136;
      }
      
      public function flush() : Boolean
      {
         var_1184 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_2133;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_2135;
      }
      
      public function get maxNutrition() : int
      {
         return var_2134;
      }
      
      public function get figure() : String
      {
         return var_505;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1925;
      }
      
      public function get petId() : int
      {
         return var_1184;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1184 = param1.readInteger();
         _name = param1.readString();
         var_1734 = param1.readInteger();
         var_2133 = param1.readInteger();
         var_1745 = param1.readInteger();
         var_2135 = param1.readInteger();
         _energy = param1.readInteger();
         var_2136 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_2134 = param1.readInteger();
         var_505 = param1.readString();
         var_1925 = param1.readInteger();
         var_1746 = param1.readInteger();
         var_1743 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1745;
      }
      
      public function get ownerId() : int
      {
         return var_1746;
      }
      
      public function get age() : int
      {
         return var_1743;
      }
   }
}
