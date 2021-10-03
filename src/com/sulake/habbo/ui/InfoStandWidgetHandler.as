package com.sulake.habbo.ui
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.friendlist.IFriend;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectOperationEnum;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.session.IPetInfo;
   import com.sulake.habbo.session.IUserData;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.session.events.RoomSessionPetCommandsUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionPetInfoUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionUserBadgesEvent;
   import com.sulake.habbo.session.events.RoomSessionUserFigureUpdateEvent;
   import com.sulake.habbo.session.events.UserTagsReceivedEvent;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetBadgeImageUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetChatInputContentUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetCommandsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserFigureUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserTagsUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetFurniActionMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetBadgeDetailsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetPetCommandMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomTagSearchMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class InfoStandWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var _isDisposed:Boolean = false;
      
      private var var_519:Map;
      
      public function InfoStandWidgetHandler()
      {
         var_519 = new Map();
         super();
      }
      
      private function onUserTags(param1:UserTagsReceivedEvent) : void
      {
         dispatchUserTags(param1.userId,param1.tags);
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         if(_container != null)
         {
            if(false)
            {
               _container.sessionDataManager.events.removeEventListener(UserTagsReceivedEvent.const_145,onUserTags);
               _container.sessionDataManager.events.removeEventListener(BadgeImageReadyEvent.const_121,onBadgeImage);
            }
            if(false)
            {
               _container.roomSessionManager.events.removeEventListener(RoomSessionUserFigureUpdateEvent.const_138,onFigureUpdate);
               _container.roomSessionManager.events.removeEventListener(RoomSessionPetInfoUpdateEvent.const_136,onPetInfo);
               _container.roomSessionManager.events.removeEventListener(RoomSessionPetCommandsUpdateEvent.const_148,onPetCommands);
            }
         }
         _container = param1;
         if(param1 == null)
         {
            return;
         }
         if(false)
         {
            _container.sessionDataManager.events.addEventListener(UserTagsReceivedEvent.const_145,onUserTags);
            _container.sessionDataManager.events.addEventListener(BadgeImageReadyEvent.const_121,onBadgeImage);
         }
         if(false)
         {
            _container.roomSessionManager.events.addEventListener(RoomSessionUserFigureUpdateEvent.const_138,onFigureUpdate);
            _container.roomSessionManager.events.addEventListener(RoomSessionPetInfoUpdateEvent.const_136,onPetInfo);
            _container.roomSessionManager.events.addEventListener(RoomSessionPetCommandsUpdateEvent.const_148,onPetCommands);
         }
      }
      
      private function handleGetObjectInfoMessage(param1:RoomWidgetRoomObjectMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:Boolean = false;
         var _loc24_:* = false;
         var _loc25_:Boolean = false;
         var _loc26_:int = 0;
         var _loc27_:* = null;
         var _loc28_:* = null;
         var _loc29_:int = 0;
         var _loc30_:* = null;
         var _loc31_:* = null;
         _loc2_ = _container.roomSession.roomId;
         _loc3_ = _container.roomSession.roomCategory;
         switch(param1.category)
         {
            case RoomObjectCategoryEnum.const_33:
            case RoomObjectCategoryEnum.const_29:
               if(true || true)
               {
                  return null;
               }
               if(param1.id < 0)
               {
                  return null;
               }
               _loc4_ = 4282203453;
               _loc5_ = _container.roomEngine.getRoomObjectImage(_loc2_,_loc3_,param1.id,param1.category,new Vector3d(180),32,null,_loc4_);
               _loc6_ = new RoomWidgetFurniInfoUpdateEvent(RoomWidgetFurniInfoUpdateEvent.const_490);
               _loc6_.id = param1.id;
               _loc6_.category = param1.category;
               _loc7_ = _container.roomEngine.getRoomObject(_loc2_,_loc3_,param1.id,param1.category);
               if(_loc7_ == null || _loc7_.getModel() == null)
               {
                  return null;
               }
               _loc8_ = _loc7_.getType();
               if(_loc8_.indexOf("poster") == 0)
               {
                  _loc19_ = int(_loc8_.replace("poster",""));
                  _loc6_.name = "${poster_" + _loc19_ + "_name}";
                  _loc6_.description = "${poster_" + _loc19_ + "_desc}";
               }
               else
               {
                  _loc20_ = _loc7_.getModel().getNumber(RoomObjectVariableEnum.const_326);
                  _loc21_ = _container.sessionDataManager.getFurnitureData(_loc20_);
                  if(_loc21_ != null)
                  {
                     _loc6_.name = _loc21_.title;
                     _loc6_.description = _loc21_.description;
                  }
               }
               if(_loc8_.indexOf("post_it") > -1)
               {
                  _loc6_.isStickie = true;
               }
               _loc6_.image = _loc5_.data;
               _loc6_.isWallItem = param1.category == RoomObjectCategoryEnum.const_29;
               _loc6_.isRoomOwner = _container.roomSession.isRoomOwner;
               _loc6_.isRoomController = _container.roomSession.isRoomController;
               _loc6_.isAnyRoomController = _container.sessionDataManager.isAnyRoomController;
               _container.events.dispatchEvent(_loc6_);
               break;
            case RoomObjectCategoryEnum.const_37:
               if(true || true || true || true || true || true)
               {
                  return null;
               }
               _loc9_ = _container.roomSession.userDataManager.getUserDataByIndex(param1.id);
               if(_loc9_ == null)
               {
                  return null;
               }
               if(_loc9_.type == RoomObjectTypeEnum.const_304)
               {
                  _container.roomSession.userDataManager.requestPetInfo(_loc9_.webID);
                  return null;
               }
               if(_loc9_.type == RoomObjectTypeEnum.const_473)
               {
                  _loc10_ = "null";
                  if(_loc9_.webID != _container.sessionDataManager.userId)
                  {
                     _loc10_ = "null";
                  }
               }
               else
               {
                  if(_loc9_.type != RoomObjectTypeEnum.const_912)
                  {
                     return null;
                  }
                  _loc10_ = "null";
               }
               _loc11_ = new RoomWidgetUserInfoUpdateEvent(_loc10_);
               _loc11_.isSpectatorMode = _container.roomSession.isSpectatorMode;
               _loc11_.name = _loc9_.name;
               _loc11_.motto = _loc9_.custom;
               _loc11_.webID = _loc9_.webID;
               _loc11_.userRoomId = param1.id;
               _loc12_ = new Array();
               _loc14_ = _container.roomEngine.getRoomObject(_loc2_,_loc3_,param1.id,param1.category);
               if(_loc14_ != null)
               {
                  _loc11_.carryItem = _loc14_.getModel().getNumber(RoomObjectVariableEnum.const_639);
               }
               if(_loc10_ == RoomWidgetUserInfoUpdateEvent.const_201)
               {
                  _loc11_.realName = _container.sessionDataManager.realName;
               }
               if(_loc10_ == RoomWidgetUserInfoUpdateEvent.const_192)
               {
                  _loc11_.canBeAskedAsFriend = _container.friendList.canBeAskedForAFriend(_loc9_.webID);
                  _loc22_ = _container.friendList.getFriend(_loc9_.webID);
                  if(_loc22_ != null)
                  {
                     _loc11_.realName = _loc22_.realName;
                  }
                  if(_loc14_ != null)
                  {
                     _loc28_ = _loc14_.getModel().getString(RoomObjectVariableEnum.const_622);
                     _loc11_.hasFlatControl = _loc28_ == "onlyfurniture" || _loc28_ == "useradmin" || _loc28_ == "";
                     _loc11_.canBeKicked = _container.roomSession.isPrivateRoom;
                  }
                  _loc11_.isIgnored = _container.sessionDataManager.isIgnored(_loc9_.name);
                  _loc11_.amIOwner = _container.roomSession.isRoomOwner;
                  _loc11_.amIController = _container.roomSession.isRoomController;
                  _loc11_.amIAnyRoomController = _container.sessionDataManager.isAnyRoomController;
                  _loc11_.respectLeft = _container.sessionDataManager.respectLeft;
                  _loc23_ = _container.sessionDataManager.hasUserRight("fuse_trade");
                  _loc24_ = !_container.sessionDataManager.systemShutDown;
                  _loc25_ = _container.roomSession.isTradingRoom;
                  _loc11_.canTrade = _loc23_ && _loc24_ && _loc25_;
                  _loc11_.canTradeReason = RoomWidgetUserInfoUpdateEvent.const_1133;
                  if(!_loc23_)
                  {
                     _loc11_.canTradeReason = RoomWidgetUserInfoUpdateEvent.TRADE_REASON_NO_OWN_RIGHT;
                  }
                  if(!_loc24_)
                  {
                     _loc11_.canTradeReason = RoomWidgetUserInfoUpdateEvent.const_873;
                  }
                  if(!_loc25_)
                  {
                     _loc11_.canTradeReason = RoomWidgetUserInfoUpdateEvent.const_979;
                  }
                  _loc26_ = _container.sessionDataManager.userId;
                  _loc27_ = _container.sessionDataManager.getUserTags(_loc26_);
                  dispatchUserTags(_loc26_,_loc27_);
               }
               if(_loc10_ == RoomWidgetUserInfoUpdateEvent.BOT)
               {
                  _loc11_.canBeKicked = _container.roomSession.isRoomOwner;
                  _loc12_.push(RoomWidgetUserInfoUpdateEvent.const_1286);
               }
               else
               {
                  _loc12_ = _container.roomSession.userDataManager.getUserBadges(_loc9_.webID);
                  _loc13_ = _container.sessionDataManager.getGroupBadgeId(int(_loc9_.groupID));
                  _loc11_.groupId = int(_loc9_.groupID);
                  _loc11_.groupBadgeId = _loc13_;
               }
               _loc11_.badges = _loc12_;
               _loc15_ = _loc9_.figure;
               _loc16_ = _container.avatarRenderManager.createAvatarImage(_loc15_,AvatarScaleType.const_50);
               if(_loc16_ != null)
               {
                  _loc16_.setDirection(AvatarSetType.const_38,4);
                  _loc11_.image = _loc16_.getImage(AvatarSetType.const_38);
               }
               _container.events.dispatchEvent(_loc11_);
               _loc17_ = _container.sessionDataManager.getUserTags(_loc9_.webID);
               dispatchUserTags(_loc9_.webID,_loc17_);
               _loc29_ = 0;
               while(_loc29_ < _loc12_.length)
               {
                  _loc30_ = _loc12_[_loc29_];
                  _loc18_ = _container.sessionDataManager.getBadgeImage(_loc30_);
                  if(_loc18_ != null)
                  {
                     _container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(_loc30_,_loc18_));
                  }
                  _loc29_++;
               }
               if(_loc13_ != null)
               {
                  _loc31_ = _container.sessionDataManager.getGroupBadgeImage(_loc13_);
                  if(_loc31_ != null)
                  {
                     _container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(_loc13_,_loc31_));
                  }
               }
               break;
         }
         return null;
      }
      
      public function update() : void
      {
      }
      
      private function onFigureUpdate(param1:RoomSessionUserFigureUpdateEvent) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = false;
         if(_container == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param1.userId < 0)
         {
            return;
         }
         var _loc2_:IUserData = _container.roomSession.userDataManager.getUserDataByIndex(param1.userId);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = _loc2_.webID;
         var _loc4_:* = null;
         if(false)
         {
            _loc5_ = _container.avatarRenderManager.createAvatarImage(param1.figure,AvatarScaleType.const_50);
            if(_loc5_ != null)
            {
               _loc5_.setDirection(AvatarSetType.const_38,4);
               _loc4_ = _loc5_.getImage(AvatarSetType.const_38);
            }
            _loc6_ = _loc3_ == _container.sessionDataManager.userId;
            if(_container != null && false)
            {
               _container.events.dispatchEvent(new RoomWidgetUserFigureUpdateEvent(_loc3_,_loc4_,_loc6_));
            }
         }
      }
      
      private function onPetInfo(param1:RoomSessionPetInfoUpdateEvent) : void
      {
         var _loc8_:* = false;
         var _loc9_:* = null;
         var _loc10_:Boolean = false;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc2_:IPetInfo = param1.petInfo;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IUserData = _container.roomSession.userDataManager.getUserData(_loc2_.petId);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:String = _loc3_.figure;
         var _loc5_:IAvatarImage = var_519.getValue(_loc2_.petId) as IAvatarImage;
         if(_loc5_ == null)
         {
            _loc5_ = _container.avatarRenderManager.createPetImage(_loc4_,AvatarScaleType.const_50);
            var_519.add(_loc2_.petId,_loc5_);
         }
         var _loc6_:int = _loc5_.petType;
         var _loc7_:int = _loc5_.petRace;
         if(_loc5_ == null)
         {
            return;
         }
         _loc5_.setDirection(AvatarSetType.const_38,4);
         if(_container != null && false)
         {
            _loc8_ = _loc2_.ownerId == _container.sessionDataManager.userId;
            _loc9_ = new RoomWidgetPetInfoUpdateEvent(_loc6_,_loc7_,_loc3_.name,_loc2_.petId,_loc5_.getCroppedImage(AvatarSetType.const_38),_loc8_,_loc2_.ownerId,_loc2_.ownerName,_loc3_.id);
            _loc9_.level = _loc2_.level;
            _loc9_.levelMax = _loc2_.levelMax;
            _loc9_.experience = _loc2_.experience;
            _loc9_.experienceMax = _loc2_.experienceMax;
            _loc9_.energy = _loc2_.energy;
            _loc9_.energyMax = _loc2_.energyMax;
            _loc9_.nutrition = _loc2_.nutrition;
            _loc9_.nutritionMax = _loc2_.nutritionMax;
            _loc9_.petRespect = _loc2_.respect;
            _loc9_.petRespectLeft = _container.sessionDataManager.petRespectLeft;
            _loc9_.age = _loc2_.age;
            _loc10_ = false;
            _loc11_ = _container.roomSession.roomId;
            _loc12_ = _container.roomSession.roomCategory;
            _loc13_ = _container.roomSession.userDataManager.getUserData(_loc2_.ownerId);
            if(_loc13_ != null)
            {
               _loc14_ = _container.roomEngine.getRoomObject(_loc11_,_loc12_,_loc13_.id,RoomObjectCategoryEnum.const_37);
               if(_loc14_ != null)
               {
                  _loc15_ = _loc14_.getModel().getString(RoomObjectVariableEnum.const_622);
                  _loc10_ = (_container.roomSession.isRoomOwner || _container.roomSession.isRoomController || _container.sessionDataManager.isAnyRoomController) && _loc15_ != "useradmin" && _container.roomSession.isPrivateRoom && !_loc8_;
               }
            }
            _loc9_.canOwnerBeKicked = _loc10_;
            _container.events.dispatchEvent(_loc9_);
         }
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionUserBadgesEvent.const_115];
      }
      
      private function dispatchUserTags(param1:int, param2:Array) : void
      {
         if(param2 == null)
         {
            return;
         }
         var _loc3_:* = false;
         if(false)
         {
            _loc3_ = param1 == _container.sessionDataManager.userId;
         }
         if(_container != null && false)
         {
            _container.events.dispatchEvent(new RoomWidgetUserTagsUpdateEvent(param1,param2,_loc3_));
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetRoomObjectMessage.const_296);
         _loc1_.push(RoomWidgetUserActionMessage.const_554);
         _loc1_.push(RoomWidgetUserActionMessage.const_697);
         _loc1_.push(RoomWidgetUserActionMessage.const_597);
         _loc1_.push(RoomWidgetUserActionMessage.const_618);
         _loc1_.push(RoomWidgetUserActionMessage.const_584);
         _loc1_.push(RoomWidgetUserActionMessage.const_413);
         _loc1_.push(RoomWidgetUserActionMessage.const_605);
         _loc1_.push(RoomWidgetUserActionMessage.const_564);
         _loc1_.push(RoomWidgetUserActionMessage.const_509);
         _loc1_.push(RoomWidgetUserActionMessage.const_646);
         _loc1_.push(RoomWidgetUserActionMessage.const_504);
         _loc1_.push(RoomWidgetFurniActionMessage.const_219);
         _loc1_.push(RoomWidgetFurniActionMessage.const_566);
         _loc1_.push(RoomWidgetFurniActionMessage.const_593);
         _loc1_.push(RoomWidgetRoomTagSearchMessage.const_571);
         _loc1_.push(RoomWidgetGetBadgeDetailsMessage.const_714);
         _loc1_.push(RoomWidgetUserActionMessage.const_353);
         _loc1_.push(RoomWidgetUserActionMessage.const_623);
         _loc1_.push(RoomWidgetUserActionMessage.const_670);
         _loc1_.push(RoomWidgetUserActionMessage.const_1230);
         _loc1_.push(RoomWidgetPetCommandMessage.const_585);
         _loc1_.push(RoomWidgetPetCommandMessage.const_586);
         _loc1_.push(RoomWidgetUserActionMessage.const_658);
         _loc1_.push(RoomWidgetUserActionMessage.const_437);
         return _loc1_;
      }
      
      private function onPetCommands(param1:RoomSessionPetCommandsUpdateEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         if(_container != null && false)
         {
            _loc2_ = _container.roomSession.isRoomOwner;
            _loc3_ = new RoomWidgetPetCommandsUpdateEvent(param1.petId,param1.enabledCommands);
            _container.events.dispatchEvent(_loc3_);
         }
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         switch(param1.type)
         {
            case RoomSessionUserBadgesEvent.const_115:
               _loc2_ = param1 as RoomSessionUserBadgesEvent;
               if(_loc2_ == null)
               {
                  return;
               }
               _container.events.dispatchEvent(new RoomWidgetUserBadgesUpdateEvent(_loc2_.userId,_loc2_.badges));
               _loc4_ = 0;
               while(_loc4_ < _loc2_.badges.length)
               {
                  _loc5_ = _loc2_.badges[_loc4_];
                  _loc3_ = _container.sessionDataManager.getBadgeImage(_loc5_);
                  if(_loc3_ != null)
                  {
                     _container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(_loc5_,_loc3_));
                  }
                  _loc4_++;
               }
               break;
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_519 != null)
         {
            _loc1_ = var_519.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = var_519.getValue(_loc2_);
               if(_loc3_)
               {
                  _loc3_.dispose();
               }
               _loc3_ = null;
            }
            var_519 = null;
         }
         _isDisposed = true;
         container = null;
      }
      
      private function onBadgeImage(param1:BadgeImageReadyEvent) : void
      {
         if(_container != null && false)
         {
            _container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(param1.badgeId,param1.badgeImage));
         }
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_357;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         if(param1 == null)
         {
            return null;
         }
         if(_container == null)
         {
            return null;
         }
         var _loc2_:int = 0;
         _loc4_ = param1 as RoomWidgetUserActionMessage;
         if(_loc4_ != null)
         {
            _loc2_ = _loc4_.userId;
            if(_loc4_.type == RoomWidgetUserActionMessage.const_353)
            {
               _loc3_ = _container.roomSession.userDataManager.getUserDataByIndex(_loc2_);
            }
            else
            {
               _loc3_ = _container.roomSession.userDataManager.getUserData(_loc2_);
            }
            if(_loc3_ == null)
            {
               return null;
            }
         }
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:RoomWidgetFurniActionMessage = param1 as RoomWidgetFurniActionMessage;
         if(_loc7_ != null)
         {
            _loc5_ = _loc7_.furniId;
            _loc6_ = _loc7_.furniCategory;
         }
         switch(param1.type)
         {
            case RoomWidgetRoomObjectMessage.const_296:
               return handleGetObjectInfoMessage(param1 as RoomWidgetRoomObjectMessage);
            case RoomWidgetUserActionMessage.const_554:
               _container.friendList.askForAFriend(_loc2_,_loc3_.name);
               break;
            case RoomWidgetUserActionMessage.const_697:
               _container.sessionDataManager.giveRespect(_loc2_);
               break;
            case RoomWidgetUserActionMessage.const_658:
               _container.sessionDataManager.givePetRespect(_loc2_);
               break;
            case RoomWidgetUserActionMessage.const_597:
               _loc8_ = new RoomWidgetChatInputContentUpdateEvent(RoomWidgetChatInputContentUpdateEvent.const_898,_loc3_.name);
               _container.events.dispatchEvent(_loc8_);
               break;
            case RoomWidgetUserActionMessage.const_618:
               _container.sessionDataManager.ignoreUser(_loc3_.name);
               break;
            case RoomWidgetUserActionMessage.const_584:
               _container.sessionDataManager.unignoreUser(_loc3_.name);
               break;
            case RoomWidgetUserActionMessage.const_413:
               _container.roomSession.kickUser(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_605:
               _container.roomSession.banUser(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_564:
               _container.roomSession.assignRights(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_509:
               _container.roomSession.removeRights(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_646:
               _loc9_ = _container.roomSession.userDataManager.getUserData(_loc4_.userId);
               _container.inventory.setupTrading(_loc9_.id,_loc9_.name);
               break;
            case RoomWidgetUserActionMessage.const_504:
               _container.sessionDataManager.openHabboHomePage(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_670:
               _container.roomSession.pickUpPet(_loc2_);
               break;
            case RoomWidgetFurniActionMessage.const_566:
               _container.roomEngine.modifyRoomObject(_loc5_,_loc6_,RoomObjectOperationEnum.OBJECT_ROTATE_POSITIVE);
               break;
            case RoomWidgetFurniActionMessage.const_219:
               _container.roomEngine.modifyRoomObject(_loc5_,_loc6_,RoomObjectOperationEnum.OBJECT_MOVE);
               break;
            case RoomWidgetFurniActionMessage.const_593:
               _container.roomEngine.modifyRoomObject(_loc5_,_loc6_,RoomObjectOperationEnum.OBJECT_PICKUP);
               break;
            case RoomWidgetUserActionMessage.const_437:
               if(false && _container.roomSession.userDataManager != null)
               {
                  _container.roomSession.userDataManager.requestPetInfo(_loc2_);
               }
               break;
            case RoomWidgetRoomTagSearchMessage.const_571:
               _loc10_ = param1 as RoomWidgetRoomTagSearchMessage;
               if(_loc10_ == null)
               {
                  return null;
               }
               _container.navigator.performTagSearch(_loc10_.tag);
               break;
            case RoomWidgetGetBadgeDetailsMessage.const_714:
               _loc11_ = param1 as RoomWidgetGetBadgeDetailsMessage;
               if(_loc11_ == null)
               {
                  return null;
               }
               _container.sessionDataManager.showGroupBadgeInfo(_loc11_.groupId);
               break;
            case RoomWidgetUserActionMessage.const_353:
               _container.roomSession.kickBot(_loc2_);
               break;
            case RoomWidgetUserActionMessage.const_623:
               if(_container == null || true)
               {
                  break;
               }
               if(_loc3_ == null)
               {
                  break;
               }
               _container.habboHelp.reportUser(_loc2_,_loc3_.name);
               break;
            case RoomWidgetPetCommandMessage.const_586:
               _loc12_ = param1 as RoomWidgetPetCommandMessage;
               _container.roomSession.requestPetCommands(_loc12_.petId);
               break;
            case RoomWidgetPetCommandMessage.const_585:
               _loc13_ = param1 as RoomWidgetPetCommandMessage;
               _container.roomSession.sendChatMessage(_loc13_.value);
         }
         return null;
      }
   }
}
