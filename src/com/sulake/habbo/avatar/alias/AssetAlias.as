package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_935:Boolean;
      
      private var _name:String;
      
      private var var_1626:String;
      
      private var var_934:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_1626 = String(param1.@link);
         var_934 = Boolean(parseInt(param1.@fliph));
         var_935 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_934;
      }
      
      public function get flipV() : Boolean
      {
         return var_935;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_1626;
      }
   }
}
