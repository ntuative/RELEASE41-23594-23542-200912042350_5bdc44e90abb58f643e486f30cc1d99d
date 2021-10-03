package com.sulake.habbo.session
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.availability.AvailabilityStatusMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UserChangeMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.UserNameChangedMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.ChatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.pets.RespectPetMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.RespectUserMessageComposer;
   import com.sulake.habbo.communication.messages.parser.availability.AvailabilityStatusMessageParser;
   import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
   import com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.session.furniture.FurnitureDataParser;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.session.product.ProductDataParser;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class SessionDataManager extends Component implements ISessionDataManager
   {
       
      
      private var var_505:String;
      
      private var var_1409:UserTagManager;
      
      private var var_646:Array;
      
      private var _respectLeft:int = 0;
      
      private var _furnitureIds:Dictionary;
      
      private var var_1408:GroupDetailsView;
      
      private var _name:String;
      
      private var var_778:int = 0;
      
      private var var_970:FurnitureDataParser;
      
      private var var_1178:Dictionary;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_34:IRoomSessionManager;
      
      private var var_1177:BadgeImageManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1047:String;
      
      private var var_1865:Boolean;
      
      private var _id:int;
      
      private var var_779:IgnoredUsersManager;
      
      private var var_742:Dictionary;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _gender:String;
      
      private var var_1864:Boolean;
      
      private var var_968:ProductDataParser;
      
      private var var_173:IHabboConfigurationManager;
      
      private var var_969:HabboGroupInfoManager;
      
      private var var_1583:int = 0;
      
      public function SessionDataManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         var_646 = [];
         var_1409 = new UserTagManager(events);
         var_969 = new HabboGroupInfoManager(this,events);
         var_779 = new IgnoredUsersManager(this);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),onHabboCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      private function onProductsReady(param1:Event = null) : void
      {
         var_968.removeEventListener(ProductDataParser.const_137,onProductsReady);
         var_968 = null;
         var_1178 = new Dictionary();
         _furnitureIds = new Dictionary();
         var _loc2_:String = var_173.getKey("furnidata.load.url");
         var _loc3_:String = var_173.getKey("external.hash");
         _loc2_ = _loc2_.replace("%hash%",_loc3_);
         var_970 = new FurnitureDataParser(_loc2_,var_1178,_furnitureIds,_localization);
         var_970.addEventListener(FurnitureDataParser.const_137,onFurnitureReady);
      }
      
      public function getUserTags(param1:int) : Array
      {
         return var_1409.getTags(param1);
      }
      
      private function onUserNameChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserNameChangedMessageEvent = param1 as UserNameChangedMessageEvent;
         if(_loc2_ == null || _loc2_.getParser() == null)
         {
            return;
         }
         var _loc3_:UserNameChangedMessageParser = _loc2_.getParser();
         if(_loc3_.webId == _id)
         {
            _name = _loc3_.newName;
         }
      }
      
      private function onConfigurationInit(param1:Event = null) : void
      {
         var_742 = new Dictionary();
         var _loc2_:String = var_173.getKey("productdata.load.url");
         var _loc3_:String = var_173.getKey("external.hash");
         _loc2_ = _loc2_.replace("%hash%",_loc3_);
         var_968 = new ProductDataParser(_loc2_,var_742);
         var_968.addEventListener(ProductDataParser.const_137,onProductsReady);
      }
      
      public function getProductData(param1:String) : IProductData
      {
         return var_742[param1];
      }
      
      public function getFurnitureData(param1:int) : IFurnitureData
      {
         if(var_1178 == null)
         {
            return null;
         }
         return var_1178[String(param1)];
      }
      
      private function sendPickAllFurnitureMessage() : void
      {
         var _loc1_:IConnection = _communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new ChatMessageComposer(":pickall"));
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return var_34;
      }
      
      public function getGroupBadgeId(param1:int) : String
      {
         return var_969.getBadgeId(param1);
      }
      
      public function unignoreUser(param1:String) : void
      {
         var_779.unignoreUser(param1);
      }
      
      public function get systemOpen() : Boolean
      {
         return var_1865;
      }
      
      public function getGroupBadgeImage(param1:String) : BitmapData
      {
         return var_1177.getBadgeImage(param1,BadgeImageManager.const_967);
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return var_173;
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:UserObjectEvent = param1 as UserObjectEvent;
         var _loc3_:UserObjectMessageParser = _loc2_.getParser();
         _id = _loc3_.id;
         _name = _loc3_.name;
         var_1583 = _loc3_.respectTotal;
         _respectLeft = _loc3_.respectLeft;
         var_778 = _loc3_.petRespectLeft;
         var_505 = _loc3_.figure;
         _gender = _loc3_.sex;
         var_1047 = _loc3_.realName;
         var_779.initIgnoreList();
         if(false && var_173.getKey("facebook.user").length == 0)
         {
            ExternalInterface.call("FlashExternalInterface.openHabblet","news");
         }
      }
      
      public function pickAllFurniture(param1:int, param2:int) : void
      {
         var roomId:int = param1;
         var roomCategory:int = param2;
         if(var_34 == null || _windowManager == null)
         {
            return;
         }
         var session:IRoomSession = var_34.getSession(roomId,roomCategory);
         if(session == null)
         {
            return;
         }
         if(session.isRoomOwner || isAnyRoomController)
         {
            _windowManager.confirm("${generic.alert.title}","${room.confirm.pick_all}",0,function(param1:IConfirmDialog, param2:Event):void
            {
               param1.dispose();
               if(param2.type == WindowEvent.const_187)
               {
                  sendPickAllFurnitureMessage();
               }
            });
         }
      }
      
      public function getFurnitureDataByName(param1:String) : IFurnitureData
      {
         if(_furnitureIds == null)
         {
            return null;
         }
         return getFurnitureData(int(_furnitureIds[param1]));
      }
      
      public function getGroupDetails(param1:int) : HabboGroupDetails
      {
         return var_969.getGroupDetails(param1);
      }
      
      public function get userId() : int
      {
         return _id;
      }
      
      public function get realName() : String
      {
         return var_1047;
      }
      
      private function onWindowManagerReady(param1:IID, param2:IUnknown) : void
      {
         _windowManager = param2 as IHabboWindowManager;
      }
      
      public function get petRespectLeft() : int
      {
         return var_778;
      }
      
      public function isIgnored(param1:String) : Boolean
      {
         return var_779.isIgnored(param1);
      }
      
      private function onLocalizationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         _localization = param2 as IHabboLocalizationManager;
         initBadgeImageManager();
      }
      
      private function onAvailabilityStatus(param1:IMessageEvent) : void
      {
         var _loc2_:AvailabilityStatusMessageParser = (param1 as AvailabilityStatusMessageEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1865 = _loc2_.isOpen;
         var_1864 = _loc2_.onShutDown;
      }
      
      public function getBadgeImage(param1:String) : BitmapData
      {
         return var_1177.getBadgeImage(param1);
      }
      
      public function giveRespect(param1:int) : void
      {
         var _loc2_:IConnection = _communication.getHabboMainConnection(null);
         if(param1 < 0 || _respectLeft < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to user: " + param1);
         }
         _loc2_.send(new RespectUserMessageComposer(param1));
         _respectLeft = _respectLeft - 1;
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         var_173 = param2 as IHabboConfigurationManager;
         initBadgeImageManager();
         (var_173 as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationInit);
      }
      
      public function showGroupBadgeInfo(param1:int) : void
      {
         if(var_1408 == null)
         {
            var_1408 = new GroupDetailsView(this);
         }
         var _loc2_:HabboGroupDetails = var_969.getGroupDetails(param1);
         if(_loc2_ != null)
         {
            var_1408.showGroupDetails(param1);
         }
      }
      
      private function onFurnitureReady(param1:Event = null) : void
      {
         var_970.removeEventListener(FurnitureDataParser.const_137,onFurnitureReady);
         var_970 = null;
      }
      
      public function hasUserRight(param1:String) : Boolean
      {
         if(var_646 == null)
         {
            return false;
         }
         return var_646.indexOf(param1) >= 0;
      }
      
      public function givePetRespect(param1:int) : void
      {
         var _loc2_:IConnection = _communication.getHabboMainConnection(null);
         if(param1 < 0 || var_778 < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to pet: " + param1);
         }
         _loc2_.send(new RespectPetMessageComposer(param1));
         var_778 = var_778 - 1;
      }
      
      private function onUserChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserChangeMessageEvent = param1 as UserChangeMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.id == -1)
         {
            var_505 = _loc2_.figure;
            _gender = _loc2_.sex;
            events.dispatchEvent(new HabboSessionFigureUpdatedEvent(_id,var_505));
         }
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function openHabboHomePage(param1:int) : void
      {
         var urlString:String = null;
         var userId:int = param1;
         if(var_173 != null)
         {
            urlString = var_173.getKey("link.format.userpage");
            urlString = urlString.replace("%ID%",String(userId));
            try
            {
               HabboWebTools.navigateToURL(urlString,"habboMain");
            }
            catch(e:Error)
            {
               Logger.log("Error occurred!");
            }
         }
      }
      
      public function ignoreUser(param1:String) : void
      {
         var_779.ignoreUser(param1);
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         var _loc2_:UserRightsMessageEvent = param1 as UserRightsMessageEvent;
         var_646 = _loc2_.rights;
      }
      
      private function onHabboCommunicationReady(param1:IID, param2:IUnknown) : void
      {
         _communication = param2 as IHabboCommunicationManager;
         if(_communication == null)
         {
            return;
         }
         _communication.addHabboConnectionMessageEvent(new UserRightsMessageEvent(onUserRights));
         _communication.addHabboConnectionMessageEvent(new UserObjectEvent(onUserObject));
         _communication.addHabboConnectionMessageEvent(new UserChangeMessageEvent(onUserChange));
         _communication.addHabboConnectionMessageEvent(new UserNameChangedMessageEvent(onUserNameChange));
         _communication.addHabboConnectionMessageEvent(new AvailabilityStatusMessageEvent(onAvailabilityStatus));
         var_1409.communication = _communication;
         var_969.communication = _communication;
         var_779.registerMessageEvents();
      }
      
      public function get systemShutDown() : Boolean
      {
         return var_1864;
      }
      
      public function get gender() : String
      {
         return _gender;
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return _communication;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         if(var_646 == null)
         {
            return false;
         }
         return var_646.indexOf("fuse_any_room_controller") >= 0;
      }
      
      private function initBadgeImageManager() : void
      {
         var _loc1_:* = null;
         if(var_1177 != null)
         {
            return;
         }
         if(var_173 == null || _localization == null)
         {
            return;
         }
         if(context is CoreComponent)
         {
            _loc1_ = (context as CoreComponent).assets;
         }
         var_1177 = new BadgeImageManager(_loc1_,events,var_173,_localization);
      }
      
      public function get respectLeft() : int
      {
         return _respectLeft;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_34 = param2 as IRoomSessionManager;
      }
      
      public function get userName() : String
      {
         return _name;
      }
      
      public function get figure() : String
      {
         return var_505;
      }
   }
}
