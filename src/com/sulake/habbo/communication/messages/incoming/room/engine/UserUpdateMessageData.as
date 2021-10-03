package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_90:Number = 0;
      
      private var var_214:int = 0;
      
      private var var_1814:int = 0;
      
      private var var_1810:Number = 0;
      
      private var var_1815:Number = 0;
      
      private var var_1812:Number = 0;
      
      private var var_1811:Number = 0;
      
      private var var_1813:Boolean = false;
      
      private var var_89:Number = 0;
      
      private var _id:int = 0;
      
      private var var_187:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_187 = [];
         super();
         _id = param1;
         var_89 = param2;
         _y = param3;
         var_90 = param4;
         var_1811 = param5;
         var_214 = param6;
         var_1814 = param7;
         var_1810 = param8;
         var_1815 = param9;
         var_1812 = param10;
         var_1813 = param11;
         var_187 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_90;
      }
      
      public function get dir() : int
      {
         return var_214;
      }
      
      public function get localZ() : Number
      {
         return var_1811;
      }
      
      public function get isMoving() : Boolean
      {
         return var_1813;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1814;
      }
      
      public function get targetX() : Number
      {
         return var_1810;
      }
      
      public function get targetY() : Number
      {
         return var_1815;
      }
      
      public function get targetZ() : Number
      {
         return var_1812;
      }
      
      public function get x() : Number
      {
         return var_89;
      }
      
      public function get actions() : Array
      {
         return var_187.slice();
      }
   }
}
