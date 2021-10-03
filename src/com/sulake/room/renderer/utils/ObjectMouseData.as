package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_1565:String = "";
      
      private var var_156:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         var_1565 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         var_156 = param1;
      }
      
      public function get spriteTag() : String
      {
         return var_1565;
      }
      
      public function get objectId() : String
      {
         return var_156;
      }
   }
}
