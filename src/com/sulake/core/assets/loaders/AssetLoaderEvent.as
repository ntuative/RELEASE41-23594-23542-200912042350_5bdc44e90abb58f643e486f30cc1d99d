package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_903:String = "AssetLoaderEventUnload";
      
      public static const const_48:String = "AssetLoaderEventError";
      
      public static const const_879:String = "AssetLoaderEventOpen";
      
      public static const const_955:String = "AssetLoaderEventProgress";
      
      public static const const_937:String = "AssetLoaderEventStatus";
      
      public static const const_30:String = "AssetLoaderEventComplete";
       
      
      private var var_353:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_353 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_353;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_353);
      }
   }
}
