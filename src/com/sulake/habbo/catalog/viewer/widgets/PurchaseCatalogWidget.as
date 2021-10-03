package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2048:XML;
      
      private var var_1483:ITextWindow;
      
      private var var_1485:ITextWindow;
      
      private var var_2049:XML;
      
      private var var_840:IWindowContainer;
      
      private var var_2213:ITextWindow;
      
      private var var_2047:String = "";
      
      private var var_2261:IButtonWindow;
      
      private var var_2046:XML;
      
      private var var_1484:ITextWindow;
      
      private var var_2050:XML;
      
      private var var_839:IButtonWindow;
      
      private var var_166:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_289:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2049) as IWindowContainer;
               break;
            case Offer.const_376:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2050) as IWindowContainer;
               break;
            case Offer.const_366:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2048) as IWindowContainer;
               break;
            case Offer.const_629:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2046) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_840 != null)
            {
               _window.removeChild(var_840);
               var_840.dispose();
            }
            var_840 = _loc2_;
            _window.addChild(_loc2_);
            var_840.x = 0;
            var_840.y = 0;
         }
         var_1484 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1485 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1483 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2213 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_839 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_839 != null)
         {
            var_839.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_839.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_166 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_166,page,var_2047);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_2049 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_2050 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_2048 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_2046 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_793,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_2047 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_166 = param1.offer;
         attachStub(var_166.priceType);
         if(var_1484 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_166.priceInCredits));
            var_1484.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1485 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_166.priceInPixels));
            var_1485.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1483 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_166.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_166.priceInPixels));
            var_1483.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_839 != null)
         {
            var_839.enable();
         }
      }
   }
}
