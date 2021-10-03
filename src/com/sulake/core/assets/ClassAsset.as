package com.sulake.core.assets
{
   public class ClassAsset implements IAsset
   {
       
      
      private var var_33:Class;
      
      private var _disposed:Boolean = false;
      
      private var var_1078:AssetTypeDeclaration;
      
      public function ClassAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_1078 = param1;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function get url() : String
      {
         return null;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is Class)
         {
            var_33 = param1 as Class;
         }
      }
      
      public function get content() : Object
      {
         return var_33 as Object;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is ClassAsset)
         {
            var_33 = ClassAsset(param1).var_33;
            return;
         }
         throw new Error("Provided asset should be of type ClassAsset!");
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_1078;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_1078 = null;
            var_33 = null;
            _disposed = true;
         }
      }
   }
}
