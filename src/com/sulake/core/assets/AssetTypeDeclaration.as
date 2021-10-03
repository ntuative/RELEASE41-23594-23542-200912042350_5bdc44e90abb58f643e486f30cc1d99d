package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1791:Class;
      
      private var var_1790:Class;
      
      private var var_1789:String;
      
      private var var_1148:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_1789 = param1;
         var_1790 = param2;
         var_1791 = param3;
         if(rest == null)
         {
            var_1148 = new Array();
         }
         else
         {
            var_1148 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_1791;
      }
      
      public function get assetClass() : Class
      {
         return var_1790;
      }
      
      public function get mimeType() : String
      {
         return var_1789;
      }
      
      public function get fileTypes() : Array
      {
         return var_1148;
      }
   }
}
