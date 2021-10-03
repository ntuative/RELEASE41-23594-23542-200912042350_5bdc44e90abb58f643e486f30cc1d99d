package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_742:Array;
      
      private var var_853:int;
      
      private var var_1271:String;
      
      private var var_1272:int;
      
      private var var_854:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         var_1272 = param1.readInteger();
         var_1271 = param1.readString();
         var_853 = param1.readInteger();
         var_854 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_742 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_742.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_742;
      }
      
      public function get priceInCredits() : int
      {
         return var_853;
      }
      
      public function get localizationId() : String
      {
         return var_1271;
      }
      
      public function get offerId() : int
      {
         return var_1272;
      }
      
      public function get priceInPixels() : int
      {
         return var_854;
      }
   }
}
