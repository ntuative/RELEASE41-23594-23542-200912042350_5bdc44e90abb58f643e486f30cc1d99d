package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1412:String;
      
      private var var_1320:String;
      
      private var var_972:String;
      
      private var var_394:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1412 = String(param1.@align);
         var_972 = String(param1.@base);
         var_1320 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_394 = Number(_loc2_);
            if(var_394 > 1)
            {
               var_394 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1412;
      }
      
      public function get ink() : String
      {
         return var_1320;
      }
      
      public function get base() : String
      {
         return var_972;
      }
      
      public function get isBlended() : Boolean
      {
         return var_394 != 1;
      }
      
      public function get blend() : Number
      {
         return var_394;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
