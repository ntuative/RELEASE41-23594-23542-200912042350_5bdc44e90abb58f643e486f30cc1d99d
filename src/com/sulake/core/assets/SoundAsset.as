package com.sulake.core.assets
{
   import flash.media.Sound;
   import flash.utils.ByteArray;
   
   public class SoundAsset implements IAsset
   {
       
      
      private var var_33:Sound = null;
      
      private var _disposed:Boolean = false;
      
      private var var_1078:AssetTypeDeclaration;
      
      private var var_861:String;
      
      public function SoundAsset(param1:AssetTypeDeclaration, param2:String = null)
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
         if(param1 is Sound)
         {
            if(var_33)
            {
               var_33.close();
            }
            var_33 = param1 as Sound;
            return;
         }
         if(param1 is ByteArray)
         {
         }
         if(param1 is Class)
         {
            if(var_33)
            {
               var_33.close();
            }
            var_33 = new param1() as Sound;
            return;
         }
         if(param1 is SoundAsset)
         {
            if(var_33)
            {
               var_33.close();
            }
            var_33 = SoundAsset(param1).var_33;
            return;
         }
      }
      
      public function get content() : Object
      {
         return var_33 as Object;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is SoundAsset)
         {
            var_33 = SoundAsset(param1).var_33;
         }
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
