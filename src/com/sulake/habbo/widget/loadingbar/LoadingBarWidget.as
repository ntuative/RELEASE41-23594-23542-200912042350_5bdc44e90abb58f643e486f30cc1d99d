package com.sulake.habbo.widget.loadingbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.components.IBorderWindow;
   import com.sulake.core.window.components.IDisplayObjectWrapper;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetInterstitialUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetLoadingBarUpdateEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   
   public class LoadingBarWidget extends RoomWidgetBase
   {
       
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1332:String = "";
      
      private var var_362:Sprite = null;
      
      private var _window:IBorderWindow;
      
      private var _image:BitmapData;
      
      public function LoadingBarWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param4;
      }
      
      private function showInterface() : void
      {
         if(!createWindow())
         {
            return;
         }
         _window.visible = true;
         _window.center();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetInterstitialUpdateEvent.const_84,onShowInterstitial);
         param1.addEventListener(RoomWidgetLoadingBarUpdateEvent.const_84,onShowLoadingBar);
         param1.addEventListener(RoomWidgetLoadingBarUpdateEvent.const_263,onHideLoadingBar);
         super.registerUpdateEvents(param1);
      }
      
      private function onShowInterstitial(param1:RoomWidgetInterstitialUpdateEvent) : void
      {
         var _loc5_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(!createWindow())
         {
            return;
         }
         if(_image != null)
         {
            _image.dispose();
         }
         _image = param1.image;
         var_1332 = param1.clickUrl;
         var _loc2_:IDisplayObjectWrapper = _window.findChildByName("image") as IDisplayObjectWrapper;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = Math.max(0,0 - _loc2_.width);
         var _loc4_:int = Math.max(0,0 - _loc2_.height);
         _window.scale(_loc3_,_loc4_);
         if(var_362 == null)
         {
            var_362 = new Sprite();
            var_362.addChild(new Bitmap(_image));
            var_362.addEventListener(MouseEvent.CLICK,clickHandler);
         }
         else
         {
            _loc5_ = var_362.getChildAt(0) as Bitmap;
            if(_loc5_ != null)
            {
               _loc5_.bitmapData = _image;
            }
         }
         _loc2_.setDisplayObject(var_362);
         _window.visible = true;
         _window.center();
      }
      
      private function clickHandler(param1:Event) : void
      {
         if(var_1332 != "")
         {
            HabboWebTools.openWebPage(var_1332);
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetInterstitialUpdateEvent.const_84,onShowInterstitial);
         param1.removeEventListener(RoomWidgetLoadingBarUpdateEvent.const_84,onShowLoadingBar);
         param1.removeEventListener(RoomWidgetLoadingBarUpdateEvent.const_263,onHideLoadingBar);
      }
      
      private function onHideLoadingBar(param1:RoomWidgetLoadingBarUpdateEvent) : void
      {
         if(param1 == null || param1.type != RoomWidgetLoadingBarUpdateEvent.const_263)
         {
            return;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      private function onShowLoadingBar(param1:RoomWidgetLoadingBarUpdateEvent) : void
      {
         if(param1 == null || param1.type != RoomWidgetLoadingBarUpdateEvent.const_84)
         {
            return;
         }
         if(!createWindow())
         {
            return;
         }
         _window.visible = true;
         _window.center();
      }
      
      private function createWindow() : Boolean
      {
         var _loc4_:int = 0;
         if(_window != null)
         {
            return true;
         }
         var _loc1_:XmlAsset = assets.getAssetByName("room_loading_bar") as XmlAsset;
         if(_loc1_ == null)
         {
            return false;
         }
         _window = windowManager.buildFromXML(_loc1_.content as XML) as IBorderWindow;
         if(_window == null)
         {
            return false;
         }
         _window.visible = false;
         var _loc2_:IRegionWindow = _window.findChildByName("region") as IRegionWindow;
         if(_loc2_ != null)
         {
         }
         var _loc3_:IDisplayObjectWrapper = _window.findChildByName("image") as IDisplayObjectWrapper;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.height;
            _window.scale(0,-_loc4_);
         }
         return true;
      }
      
      override public function dispose() : void
      {
         if(var_362 != null)
         {
            var_362.removeEventListener(MouseEvent.CLICK,clickHandler);
            var_362 = null;
         }
         if(_image != null)
         {
            _image.dispose();
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         _config = null;
         super.dispose();
      }
   }
}
