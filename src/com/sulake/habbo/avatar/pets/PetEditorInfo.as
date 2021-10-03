package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1757:Boolean;
      
      private var var_1756:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1757 = Boolean(parseInt(param1.@club));
         var_1756 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1757;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1756;
      }
   }
}
