package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_1909:Number = 1;
      
      private var var_188:Number = 1;
      
      private var var_1914:String = "";
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         var_1914 = param1;
         var_188 = param2;
         var_1909 = param3;
      }
      
      public function get scale() : Number
      {
         return var_188;
      }
      
      public function get heightScale() : Number
      {
         return var_1909;
      }
   }
}
