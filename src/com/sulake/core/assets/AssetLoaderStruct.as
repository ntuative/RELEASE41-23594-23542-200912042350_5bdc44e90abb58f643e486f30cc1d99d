package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_662:IAssetLoader;
      
      private var var_1153:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1153 = param1;
         var_662 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_662;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_662 != null)
            {
               if(true)
               {
                  var_662.dispose();
                  var_662 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1153;
      }
   }
}
