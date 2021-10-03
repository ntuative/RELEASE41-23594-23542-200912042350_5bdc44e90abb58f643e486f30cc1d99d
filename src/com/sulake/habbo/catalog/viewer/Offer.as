package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_904:String = "price_type_none";
      
      public static const const_464:String = "pricing_model_multi";
      
      public static const const_289:String = "price_type_credits";
      
      public static const const_366:String = "price_type_credits_and_pixels";
      
      public static const const_474:String = "pricing_model_bundle";
      
      public static const const_426:String = "pricing_model_single";
      
      public static const const_629:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1179:String = "pricing_model_unknown";
      
      public static const const_376:String = "price_type_pixels";
       
      
      private var var_853:int;
      
      private var var_1272:int;
      
      private var var_854:int;
      
      private var var_405:String;
      
      private var var_569:String;
      
      private var var_2100:int;
      
      private var var_611:ICatalogPage;
      
      private var var_1271:String;
      
      private var var_404:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         var_1272 = param1.offerId;
         var_1271 = param1.localizationId;
         var_853 = param1.priceInCredits;
         var_854 = param1.priceInPixels;
         var_611 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(_loc4_.productType);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_405;
      }
      
      public function get page() : ICatalogPage
      {
         return var_611;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_2100 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_404;
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
      
      public function dispose() : void
      {
         var_1272 = 0;
         var_1271 = "";
         var_853 = 0;
         var_854 = 0;
         var_611 = null;
         if(var_404 != null)
         {
            var_404.dispose();
            var_404 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_569;
      }
      
      public function get previewCallbackId() : int
      {
         return var_2100;
      }
      
      public function get priceInCredits() : int
      {
         return var_853;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_405 = const_426;
            }
            else
            {
               var_405 = const_464;
            }
         }
         else if(param1.length > 1)
         {
            var_405 = const_474;
         }
         else
         {
            var_405 = const_1179;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_405)
         {
            case const_426:
               var_404 = new SingleProductContainer(this,param1);
               break;
            case const_464:
               var_404 = new MultiProductContainer(this,param1);
               break;
            case const_474:
               var_404 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_405);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_853 > 0 && var_854 > 0)
         {
            var_569 = const_366;
         }
         else if(var_853 > 0)
         {
            var_569 = const_289;
         }
         else if(var_854 > 0)
         {
            var_569 = const_376;
         }
         else
         {
            var_569 = const_904;
         }
      }
   }
}
