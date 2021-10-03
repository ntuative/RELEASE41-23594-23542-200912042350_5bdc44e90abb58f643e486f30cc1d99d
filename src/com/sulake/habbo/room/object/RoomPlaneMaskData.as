package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_1846:Number = 0;
      
      private var var_1843:Number = 0;
      
      private var var_1844:Number = 0;
      
      private var var_1845:Number = 0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1843 = param1;
         var_1844 = param2;
         var_1846 = param3;
         var_1845 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1843;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1846;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1844;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1845;
      }
   }
}
