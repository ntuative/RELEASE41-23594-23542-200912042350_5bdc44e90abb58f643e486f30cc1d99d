package com.sulake.core.assets
{
   import flash.utils.ByteArray;
   
   public class XmlAsset implements IAsset
   {
       
      
      private var var_33:XML;
      
      private var _disposed:Boolean = false;
      
      private var var_1078:AssetTypeDeclaration;
      
      private var var_861:String;
      
      public function XmlAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_1078 = param1;
         var_861 = param2;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_1078;
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
         return var_861;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         var _loc2_:* = null;
         if(param1 is Class)
         {
            _loc2_ = new param1() as ByteArray;
            var_33 = new XML(_loc2_.readUTFBytes(_loc2_.length));
            return;
         }
         if(param1 is ByteArray)
         {
            _loc2_ = param1 as ByteArray;
            var_33 = new XML(_loc2_.readUTFBytes(_loc2_.length));
            return;
         }
         if(param1 is String)
         {
            var_33 = new XML(param1 as String);
            return;
         }
         if(param1 is XML)
         {
            var_33 = param1 as XML;
            return;
         }
         if(param1 is XmlAsset)
         {
            var_33 = XmlAsset(param1).var_33;
            return;
         }
      }
      
      public function get content() : Object
      {
         return var_33 as Object;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is XmlAsset)
         {
            var_33 = XmlAsset(param1).var_33;
            return;
         }
         throw Error("Provided asset is not of type XmlAsset!");
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            var_33 = null;
            var_1078 = null;
            var_861 = null;
         }
      }
   }
}
