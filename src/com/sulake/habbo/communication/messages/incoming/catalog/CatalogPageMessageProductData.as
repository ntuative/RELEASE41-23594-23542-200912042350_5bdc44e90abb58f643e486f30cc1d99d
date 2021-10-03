package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_275:String = "e";
      
      public static const const_129:String = "i";
      
      public static const const_152:String = "s";
       
      
      private var var_998:String;
      
      private var var_1226:String;
      
      private var var_1227:int;
      
      private var var_1796:int;
      
      private var var_999:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1226 = param1.readString();
         var_1796 = param1.readInteger();
         var_998 = param1.readString();
         var_999 = param1.readInteger();
         var_1227 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_999;
      }
      
      public function get productType() : String
      {
         return var_1226;
      }
      
      public function get expiration() : int
      {
         return var_1227;
      }
      
      public function get furniClassId() : int
      {
         return var_1796;
      }
      
      public function get extraParam() : String
      {
         return var_998;
      }
   }
}
