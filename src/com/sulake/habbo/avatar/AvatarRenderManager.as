package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IIDLogger;
   import com.sulake.core.runtime.ILogger;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
   import com.sulake.habbo.avatar.enum.AvatarType;
   import com.sulake.habbo.avatar.palette.PaletteManager;
   import com.sulake.habbo.avatar.palette.PaletteMap;
   import com.sulake.habbo.avatar.pets.IPetDataManager;
   import com.sulake.habbo.avatar.pets.PetDataManager;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.utils.ByteArray;
   
   public class AvatarRenderManager extends Component implements IAvatarRenderManager
   {
       
      
      private var var_189:Stage;
      
      private var var_29:AssetAliasCollection;
      
      private var var_1388:PaletteManager;
      
      private var var_874:CoreComponent;
      
      private var var_1389:ILogger;
      
      private var var_1162:PetDataManager;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_536:Map;
      
      public function AvatarRenderManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_536 = new Map();
         super(param1,param2,param3);
         if(param1 is CoreComponent)
         {
            var_189 = CoreComponent(param1).root.stage;
            var_874 = CoreComponent(param1);
            var_874.events.addEventListener(Component.COMPONENT_EVENT_RUNNING,onComponentsRunning);
         }
         queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationReady);
         queueInterface(new IIDLogger(),receiveLoggerInterface);
      }
      
      private function onStructureInit(param1:Event = null) : void
      {
         this.events.dispatchEvent(new Event(AvatarRenderEvent.AVATAR_RENDER_READY));
      }
      
      private function onConfigurationInit(param1:Event = null) : void
      {
         var _loc2_:* = null;
         _loc2_ = var_536.getValue(AvatarType.const_92) as AvatarStructure;
         if(_loc2_ != null)
         {
            _loc2_.init(_habboConfiguration);
         }
         _loc2_ = var_536.getValue(AvatarType.PET) as AvatarStructure;
         if(_loc2_ != null)
         {
            _loc2_.init(_habboConfiguration);
         }
      }
      
      public function get petDataManager() : IPetDataManager
      {
         return var_1162 as IPetDataManager;
      }
      
      public function out(param1:String) : void
      {
         if(var_1389 != null)
         {
            var_1389.out(param1);
         }
      }
      
      public function getAssetByName(param1:String) : IAsset
      {
         return var_29.getAssetByName(param1);
      }
      
      public function createPetImage(param1:String, param2:String) : IAvatarImage
      {
         if(param1.indexOf(" ") == -1)
         {
            return null;
         }
         var _loc3_:Array = param1.split(" ");
         if(_loc3_.length == 0)
         {
            return null;
         }
         var _loc4_:int = int(_loc3_[0]);
         var _loc5_:int = int(_loc3_[1]);
         var _loc6_:uint = parseInt(_loc3_[2],16);
         return createPetImageNew(_loc4_,_loc5_,_loc6_,param2);
      }
      
      private function onHabboConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            _habboConfiguration = param2 as IHabboConfigurationManager;
            (_habboConfiguration as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationInit);
         }
      }
      
      public function createAvatarImage(param1:String, param2:String) : IAvatarImage
      {
         var _loc3_:AvatarStructure = var_536.getValue(AvatarType.const_92) as AvatarStructure;
         if(_loc3_ == null)
         {
            return null;
         }
         return new AvatarImage(_loc3_,var_29,param1,param2,AvatarType.const_92);
      }
      
      public function createPetImageNew(param1:int, param2:int, param3:uint, param4:String) : IAvatarImage
      {
         var _loc5_:String = var_1162.createAvatarFigureStringNew(param1,param2,param3);
         var _loc6_:AvatarStructure = var_536.getValue(AvatarType.PET) as AvatarStructure;
         if(_loc6_ == null)
         {
            return null;
         }
         return new AvatarImage(_loc6_,var_29,_loc5_,param4,AvatarType.PET);
      }
      
      private function onComponentsRunning(param1:Event = null) : void
      {
         var _loc6_:* = null;
         var _loc2_:AssetLibraryCollection = var_874.assets as AssetLibraryCollection;
         var _loc3_:int = 0;
         var _loc4_:Array = new Array();
         while(_loc2_.hasAssetLibrary("lib-" + _loc3_))
         {
            _loc4_.push("lib-" + _loc3_);
            _loc3_++;
         }
         var_29 = new AssetAliasCollection(_loc2_,_loc4_);
         var_1162 = new PetDataManager(_loc2_,_loc4_);
         var_1388 = new PaletteManager(_loc2_,_loc4_);
         var _loc5_:XML = _assets.getAssetByName("HabboAvatarPetFigure").content as XML;
         var_1162.populateFigureData(_loc5_);
         _loc6_ = new AvatarStructure(this,assets,_loc2_,AvatarType.const_92);
         _loc6_.addEventListener(AvatarStructure.AVATAR_STRUCTURE_INIT,onStructureInit);
         var_536.add(AvatarType.const_92,_loc6_);
         _loc6_ = new AvatarStructure(this,assets,_loc2_,AvatarType.PET);
         _loc6_.addEventListener(AvatarStructure.AVATAR_STRUCTURE_INIT,onStructureInit);
         var_536.add(AvatarType.PET,_loc6_);
         var_29.addAlias("h_crr_ri_419_0_0","h_std_fx5_1_1_0_0");
         var_29.addAlias("h_crr_ri_419_1_0","h_std_fx5_1_1_1_0");
         var_29.addAlias("h_crr_ri_419_2_0","h_std_fx5_1_1_2_0");
         var_29.addAlias("h_crr_ri_419_3_0","h_std_fx5_1_1_3_0");
         var_29.addAlias("h_crr_ri_419_4_0","h_std_fx5_1_1_4_0");
         var_29.addAlias("h_crr_ri_419_5_0","h_std_fx5_1_1_5_0");
         var_29.addAlias("h_drk_ri_469_0_0","h_std_fx16_1_1_0_0");
         var_29.addAlias("h_drk_ri_469_1_0","h_std_fx16_1_1_1_0");
         var_29.addAlias("h_drk_ri_469_2_0","h_std_fx16_1_1_2_0");
         var_29.addAlias("h_drk_ri_469_3_0","h_std_fx16_1_1_3_0");
         var_29.addAlias("h_drk_ri_469_4_0","h_std_fx16_1_1_4_0");
         var_29.addAlias("h_drk_ri_469_5_0","h_std_fx16_1_1_5_0");
         var_29.addAlias("h_drk_ri_469_6_0","h_std_fx16_1_1_6_0");
         var_29.addAlias("h_crr_ri_470_0_0","h_std_fx26_1_1_0_0");
         var_29.addAlias("h_crr_ri_470_1_0","h_std_fx26_1_1_1_0");
         var_29.addAlias("h_crr_ri_470_2_0","h_std_fx26_1_1_2_0");
         var_29.addAlias("h_crr_ri_470_3_0","h_std_fx26_1_1_3_0");
         var_29.addAlias("h_crr_ri_470_4_0","h_std_fx26_1_1_4_0");
         var_29.addAlias("h_crr_ri_470_5_0","h_std_fx26_1_1_5_0");
         var_29.addAlias("sh_crr_ri_419_0_0","sh_std_fx5_1_1_0_0");
         var_29.addAlias("sh_crr_ri_419_1_0","sh_std_fx5_1_1_1_0");
         var_29.addAlias("sh_crr_ri_419_2_0","sh_std_fx5_1_1_2_0");
         var_29.addAlias("sh_crr_ri_419_3_0","sh_std_fx5_1_1_3_0");
         var_29.addAlias("sh_crr_ri_419_4_0","sh_std_fx5_1_1_4_0");
         var_29.addAlias("sh_crr_ri_419_5_0","sh_std_fx5_1_1_5_0");
         var_29.addAlias("sh_drk_ri_469_0_0","sh_std_fx16_1_1_0_0");
         var_29.addAlias("sh_drk_ri_469_1_0","sh_std_fx16_1_1_1_0");
         var_29.addAlias("sh_drk_ri_469_2_0","sh_std_fx16_1_1_2_0");
         var_29.addAlias("sh_drk_ri_469_3_0","sh_std_fx16_1_1_3_0");
         var_29.addAlias("sh_drk_ri_469_4_0","sh_std_fx16_1_1_4_0");
         var_29.addAlias("sh_drk_ri_469_5_0","sh_std_fx16_1_1_5_0");
         var_29.addAlias("sh_drk_ri_469_6_0","sh_std_fx16_1_1_6_0");
         var_29.addAlias("sh_crr_ri_470_0_0","sh_std_fx26_1_1_0_0");
         var_29.addAlias("sh_crr_ri_470_1_0","sh_std_fx26_1_1_1_0");
         var_29.addAlias("sh_crr_ri_470_2_0","sh_std_fx26_1_1_2_0");
         var_29.addAlias("sh_crr_ri_470_3_0","sh_std_fx26_1_1_3_0");
         var_29.addAlias("sh_crr_ri_470_4_0","sh_std_fx26_1_1_4_0");
         var_29.addAlias("sh_crr_ri_470_5_0","sh_std_fx26_1_1_5_0");
         var_29.addAlias("h_drk_ri_fx16_1_0_0","h_std_fx16_1_1_0_0");
         var_29.addAlias("h_drk_ri_fx16_1_1_0","h_std_fx16_1_1_1_0");
         var_29.addAlias("h_drk_ri_fx16_1_2_0","h_std_fx16_1_1_2_0");
         var_29.addAlias("h_drk_ri_fx16_1_3_0","h_std_fx16_1_1_3_0");
         var_29.addAlias("h_drk_ri_fx16_1_4_0","h_std_fx16_1_1_4_0");
         var_29.addAlias("h_drk_ri_fx16_1_5_0","h_std_fx16_1_1_5_0");
         var_29.addAlias("h_drk_ri_fx16_1_6_0","h_std_fx16_1_1_6_0");
      }
      
      public function getFigureData(param1:String) : IFigureData
      {
         var _loc2_:AvatarStructure = var_536.getValue(param1) as AvatarStructure;
         if(_loc2_ != null)
         {
            return _loc2_.figureData;
         }
         return null;
      }
      
      public function get paletteManager() : PaletteManager
      {
         return var_1388;
      }
      
      private function paletteTest() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc1_:PaletteMap = var_1388.getPalette(0);
         var _loc2_:BitmapDataAsset = var_29.getAssetByName("h_lay_hrb_23_2_0") as BitmapDataAsset;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.content as BitmapData;
            _loc4_ = _loc3_.getPixels(_loc3_.rect);
            Logger.log(_loc3_.width * _loc3_.height + " " + _loc4_.length);
            _loc5_ = _loc1_.colorize(_loc4_);
            _loc6_ = new BitmapData(_loc3_.width,_loc3_.height);
            _loc6_.setPixels(_loc6_.rect,_loc5_);
            _loc7_ = new Bitmap(_loc6_);
            var_189.addChild(_loc7_);
         }
      }
      
      private function receiveLoggerInterface(param1:IID, param2:IUnknown) : void
      {
         var_1389 = param2 as ILogger;
      }
   }
}
