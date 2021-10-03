package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1308:int = -1;
      
      private var var_1055:Boolean;
      
      private var var_1056:String;
      
      private var var_1547:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_1547 = String(param1["set-type"]);
         var_1056 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1055 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1308 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1056;
      }
      
      public function get staticId() : int
      {
         return var_1308;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1308 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1055;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1055 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1056 = param1;
      }
      
      public function get setType() : String
      {
         return var_1547;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
