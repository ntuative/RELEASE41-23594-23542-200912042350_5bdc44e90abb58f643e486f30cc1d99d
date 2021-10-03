package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetBadgeImageUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetCommandsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserFigureUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserTagsUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class InfostandWidget extends RoomWidgetBase
   {
       
      
      private var var_1838:Array;
      
      private const const_1357:String = "infostand_user_view";
      
      private var var_292:InfoStandPetView;
      
      private var var_1163:InfoStandPetData;
      
      private var var_134:Timer;
      
      private var var_771:InfoStandFurniView;
      
      private var var_401:InfostandFurniData;
      
      private var var_334:InfoStandBotView;
      
      private var _mainContainer:IWindowContainer;
      
      private const const_1355:String = "infostand_bot_view";
      
      private var _config:IHabboConfigurationManager;
      
      private const const_1358:String = "infostand_pet_view";
      
      private const const_1356:String = "infostand_furni_view";
      
      private const const_1564:int = 3000;
      
      private var var_195:InfoStandUserView;
      
      private var var_407:InfostandUserData;
      
      public function InfostandWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param4;
         var_771 = new InfoStandFurniView(this,const_1356);
         var_195 = new InfoStandUserView(this,const_1357);
         var_292 = new InfoStandPetView(this,const_1358);
         var_334 = new InfoStandBotView(this,const_1355);
         var_407 = new InfostandUserData();
         var_401 = new InfostandFurniData();
         var_1163 = new InfoStandPetData();
         var_134 = new Timer(const_1564);
         var_134.addEventListener(TimerEvent.TIMER,onUpdateTimer);
         mainContainer.visible = false;
      }
      
      private function onUserTags(param1:RoomWidgetUserTagsUpdateEvent) : void
      {
         if(param1.isOwnUser)
         {
            var_1838 = param1.tags;
         }
         if(param1.userId != userData.userId)
         {
            return;
         }
         if(param1.isOwnUser)
         {
            var_195.setTags(param1.tags);
         }
         else
         {
            var_195.setTags(param1.tags,var_1838);
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_318,onRoomObjectSelected);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_191,onClose);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_247,onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_109,onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_201,onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_192,onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,onBotInfo);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_490,onFurniInfo);
         param1.addEventListener(RoomWidgetUserTagsUpdateEvent.const_145,onUserTags);
         param1.addEventListener(RoomWidgetUserFigureUpdateEvent.const_138,onUserFigureUpdate);
         param1.addEventListener(RoomWidgetUserBadgesUpdateEvent.const_115,onUserBadges);
         param1.addEventListener(RoomWidgetBadgeImageUpdateEvent.const_725,onBadgeImage);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.const_136,onPetInfo);
         param1.addEventListener(RoomWidgetPetCommandsUpdateEvent.const_148,onPetCommands);
         super.registerUpdateEvents(param1);
      }
      
      override public function get mainWindow() : IWindow
      {
         return mainContainer;
      }
      
      private function onPetInfo(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         petData.setData(param1);
         userData.petRespectLeft = param1.petRespectLeft;
         var_292.update(petData);
         selectView(const_1358);
         if(var_134)
         {
            var_134.start();
         }
      }
      
      public function get userData() : InfostandUserData
      {
         return var_407;
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         userData.setData(param1);
         var_195.update(param1);
         selectView(const_1357);
         if(var_134)
         {
            var_134.stop();
         }
      }
      
      private function onUpdateTimer(param1:TimerEvent) : void
      {
         if(var_292 == null)
         {
            return;
         }
         messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_437,var_292.getCurrentPetId()));
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_318,onRoomObjectSelected);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_191,onClose);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_247,onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_109,onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_201,onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_192,onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,onBotInfo);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_490,onFurniInfo);
         param1.removeEventListener(RoomWidgetUserTagsUpdateEvent.const_145,onUserTags);
         param1.removeEventListener(RoomWidgetUserFigureUpdateEvent.const_138,onUserFigureUpdate);
         param1.removeEventListener(RoomWidgetUserBadgesUpdateEvent.const_115,onUserBadges);
         param1.removeEventListener(RoomWidgetBadgeImageUpdateEvent.const_725,onBadgeImage);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.const_136,onPetInfo);
         param1.removeEventListener(RoomWidgetPetCommandsUpdateEvent.const_148,onPetCommands);
      }
      
      override public function dispose() : void
      {
         if(var_134)
         {
            var_134.stop();
         }
         var_134 = null;
         if(var_195)
         {
            var_195.dispose();
         }
         var_195 = null;
         if(var_771)
         {
            var_771.dispose();
         }
         var_771 = null;
         if(var_334)
         {
            var_334.dispose();
         }
         var_334 = null;
         if(var_292)
         {
            var_292.dispose();
         }
         var_292 = null;
         super.dispose();
      }
      
      private function onUserBadges(param1:RoomWidgetUserBadgesUpdateEvent) : void
      {
         if(param1.userId != userData.userId)
         {
            return;
         }
         userData.badges = param1.badges;
         var_195.clearBadges();
      }
      
      private function onFurniInfo(param1:RoomWidgetFurniInfoUpdateEvent) : void
      {
         furniData.setData(param1);
         var_771.update(param1);
         selectView(const_1356);
         if(var_134)
         {
            var_134.stop();
         }
      }
      
      private function onBotInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         userData.setData(param1);
         var_334.update(param1);
         selectView(const_1355);
         if(var_134)
         {
            var_134.stop();
         }
      }
      
      private function onUserFigureUpdate(param1:RoomWidgetUserFigureUpdateEvent) : void
      {
         if(!param1.isOwnUser)
         {
         }
         if(param1.userId != userData.userId)
         {
            return;
         }
         if(userData.isBot())
         {
            var_334.image = param1.image;
         }
         else
         {
            var_195.image = param1.image;
         }
      }
      
      private function onBadgeImage(param1:RoomWidgetBadgeImageUpdateEvent) : void
      {
         var _loc2_:int = userData.badges.indexOf(param1.badgeID);
         if(_loc2_ >= 0)
         {
            if(userData.isBot())
            {
               var_334.setBadgeImage(_loc2_,param1.badgeImage);
            }
            else
            {
               var_195.setBadgeImage(_loc2_,param1.badgeImage);
            }
            return;
         }
         if(param1.badgeID == userData.groupBadgeId)
         {
            var_195.setGroupBadgeImage(param1.badgeImage);
         }
      }
      
      private function selectView(param1:String) : void
      {
         hideChildren();
         var _loc2_:IWindow = mainContainer.getChildByName(param1) as IWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = true;
         mainContainer.visible = true;
         mainContainer.width = _loc2_.width;
         mainContainer.height = _loc2_.height;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("infostand_main_container","",HabboWindowType.const_54,HabboWindowStyle.const_40,HabboWindowParam.const_40,new Rectangle(0,0,50,100)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_infostand");
            _mainContainer.background = true;
            _mainContainer.color = 0;
         }
         return _mainContainer;
      }
      
      public function get furniData() : InfostandFurniData
      {
         return var_401;
      }
      
      private function onClose(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         close();
         if(var_134)
         {
            var_134.stop();
         }
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function onRoomObjectRemoved(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:* = false;
         switch(param1.type)
         {
            case RoomWidgetRoomObjectUpdateEvent.const_109:
               _loc2_ = param1.id == var_401.id;
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_247:
               if(var_195 != null && false && var_195.window.visible)
               {
                  _loc2_ = param1.id == var_407.userRoomId;
                  break;
               }
               if(var_292 != null && false && var_292.window.visible)
               {
                  _loc2_ = param1.id == var_1163.roomIndex;
                  break;
               }
               if(var_334 != null && false && var_334.window.visible)
               {
                  _loc2_ = param1.id == var_407.userRoomId;
                  break;
               }
         }
         if(_loc2_)
         {
            close();
         }
      }
      
      public function get petData() : InfoStandPetData
      {
         return var_1163;
      }
      
      public function refreshContainer() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < mainContainer.numChildren)
         {
            _loc1_ = mainContainer.getChildAt(_loc2_);
            if(_loc1_.visible)
            {
               mainContainer.width = _loc1_.width;
               mainContainer.height = _loc1_.height;
            }
            _loc2_++;
         }
      }
      
      private function hideChildren() : void
      {
         var _loc1_:int = 0;
         if(_mainContainer != null)
         {
            _loc1_ = 0;
            while(_loc1_ < _mainContainer.numChildren)
            {
               _mainContainer.getChildAt(_loc1_).visible = false;
               _loc1_++;
            }
         }
      }
      
      private function onPetCommands(param1:RoomWidgetPetCommandsUpdateEvent) : void
      {
         var_292.updateEnabledTrainingCommands(param1.id,param1.enabledCommands);
      }
      
      public function close() : void
      {
         hideChildren();
         if(var_134)
         {
            var_134.stop();
         }
      }
      
      private function onRoomObjectSelected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_296,param1.id,param1.category);
         messageListener.processWidgetMessage(_loc2_);
      }
   }
}
