package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_625:IWindowContainer;
      
      private var var_946:ITextWindow;
      
      private var var_193:RoomSettingsCtrl;
      
      private var var_1142:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_442:Timer;
      
      private var var_1136:ITextWindow;
      
      private var var_326:IWindowContainer;
      
      private var var_1770:IWindowContainer;
      
      private var var_1771:ITextWindow;
      
      private var var_755:IWindowContainer;
      
      private var var_1370:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_585:ITextWindow;
      
      private var var_1368:IWindowContainer;
      
      private var var_1138:IWindowContainer;
      
      private var var_753:ITextWindow;
      
      private var var_947:ITextFieldWindow;
      
      private var var_287:IWindowContainer;
      
      private var var_752:ITextWindow;
      
      private var var_1372:IButtonWindow;
      
      private var var_948:ITextWindow;
      
      private var var_2186:int;
      
      private var var_1137:IContainerButtonWindow;
      
      private var var_754:IWindowContainer;
      
      private var var_1141:ITextWindow;
      
      private var var_1139:IContainerButtonWindow;
      
      private var var_1369:ITextWindow;
      
      private var var_1371:IButtonWindow;
      
      private var var_882:TagRenderer;
      
      private var var_1684:ITextWindow;
      
      private var var_327:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_626:ITextWindow;
      
      private var var_252:RoomThumbnailCtrl;
      
      private var var_1140:IContainerButtonWindow;
      
      private var var_1769:IWindowContainer;
      
      private var var_251:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_327 = new RoomEventViewCtrl(_navigator);
         var_193 = new RoomSettingsCtrl(_navigator,this,true);
         var_252 = new RoomThumbnailCtrl(_navigator);
         var_882 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_193);
         var_442 = new Timer(6000,1);
         var_442.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_193.active = true;
         this.var_327.active = false;
         this.var_252.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1370.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1371.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1368.visible = Util.hasVisibleChildren(var_1368);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_585.text = param1.roomName;
         var_585.height = NaN;
         _ownerName.text = param1.ownerName;
         var_753.text = param1.description;
         var_882.refreshTags(var_326,param1.tags);
         var_753.visible = false;
         if(param1.description != "")
         {
            var_753.height = NaN;
            var_753.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_326,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_326,"thumb_down",_loc3_,onThumbDown,0);
         var_1771.visible = _loc3_;
         var_752.visible = !_loc3_;
         var_1369.visible = !_loc3_;
         var_1369.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_326,"home",param2,null,0);
         _navigator.refreshButton(var_326,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_326,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_585.y,0);
         var_326.visible = true;
         var_326.height = Util.getLowestPoint(var_326);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_453,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1372.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1142.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1140.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1137.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1139.visible = _navigator.data.canEditRoomSettings && param1;
         var_1138.visible = Util.hasVisibleChildren(var_1138);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_442.reset();
         this.var_327.active = false;
         this.var_193.active = false;
         this.var_252.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_45,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_442.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_442.reset();
         this.var_327.active = false;
         this.var_193.active = false;
         this.var_252.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_45,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_453,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_287);
         var_287.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_193.refresh(var_287);
         this.var_252.refresh(var_287);
         Util.moveChildrenToColumn(var_287,["room_details","room_buttons"],0,2);
         var_287.height = Util.getLowestPoint(var_287);
         var_287.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_947.setSelection(0,var_947.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_251);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_327.refresh(var_251);
         if(Util.hasVisibleChildren(var_251) && !this.var_252.active)
         {
            Util.moveChildrenToColumn(var_251,["event_details","event_buttons"],0,2);
            var_251.height = Util.getLowestPoint(var_251);
            var_251.visible = true;
         }
         else
         {
            var_251.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_442.reset();
         this.var_327.active = true;
         this.var_193.active = false;
         this.var_252.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_442.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_946.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_946.height = NaN;
         var_1136.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1136.height = NaN;
         Util.moveChildrenToColumn(var_625,["public_space_name","public_space_desc"],var_946.y,0);
         var_625.visible = true;
         var_625.height = Math.max(86,Util.getLowestPoint(var_625));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "UseObjectMessageEvent";
         if(_loc1_ && true && true && true)
         {
            var_754.visible = true;
            var_947.text = this.getEmbedData();
         }
         else
         {
            var_754.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_442.reset();
         this.var_193.load(param1);
         this.var_193.active = true;
         this.var_327.active = false;
         this.var_252.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_442.reset();
         this.var_193.active = false;
         this.var_327.active = false;
         this.var_252.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_65,false);
         _window.setParamFlag(HabboWindowParam.const_1228,true);
         var_287 = IWindowContainer(find("room_info"));
         var_326 = IWindowContainer(find("room_details"));
         var_625 = IWindowContainer(find("public_space_details"));
         var_1769 = IWindowContainer(find("owner_name_cont"));
         var_1770 = IWindowContainer(find("rating_cont"));
         var_1138 = IWindowContainer(find("room_buttons"));
         var_585 = ITextWindow(find("room_name"));
         var_946 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_753 = ITextWindow(find("room_desc"));
         var_1136 = ITextWindow(find("public_space_desc"));
         var_948 = ITextWindow(find("owner_caption"));
         var_752 = ITextWindow(find("rating_caption"));
         var_1771 = ITextWindow(find("rate_caption"));
         var_1369 = ITextWindow(find("rating_txt"));
         var_251 = IWindowContainer(find("event_info"));
         var_755 = IWindowContainer(find("event_details"));
         var_1368 = IWindowContainer(find("event_buttons"));
         var_1684 = ITextWindow(find("event_name"));
         var_626 = ITextWindow(find("event_desc"));
         var_1142 = IContainerButtonWindow(find("add_favourite_button"));
         var_1140 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1137 = IContainerButtonWindow(find("make_home_button"));
         var_1139 = IContainerButtonWindow(find("unmake_home_button"));
         var_1372 = IButtonWindow(find("room_settings_button"));
         var_1370 = IButtonWindow(find("create_event_button"));
         var_1371 = IButtonWindow(find("edit_event_button"));
         var_754 = IWindowContainer(find("embed_info"));
         var_1141 = ITextWindow(find("embed_info_txt"));
         var_947 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1142,onAddFavouriteClick);
         Util.setProcDirectly(var_1140,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1372,onRoomSettingsClick);
         Util.setProcDirectly(var_1137,onMakeHomeClick);
         Util.setProcDirectly(var_1139,onUnmakeHomeClick);
         Util.setProcDirectly(var_1370,onEventSettingsClick);
         Util.setProcDirectly(var_1371,onEventSettingsClick);
         Util.setProcDirectly(var_947,onEmbedSrcClick);
         _navigator.refreshButton(var_1142,"favourite",true,null,0);
         _navigator.refreshButton(var_1140,"favourite",true,null,0);
         _navigator.refreshButton(var_1137,"home",true,null,0);
         _navigator.refreshButton(var_1139,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_287,onHover);
         Util.setProcDirectly(var_251,onHover);
         var_948.width = var_948.textWidth;
         Util.moveChildrenToRow(var_1769,["owner_caption","owner_name"],var_948.x,var_948.y,3);
         var_752.width = var_752.textWidth;
         Util.moveChildrenToRow(var_1770,["rating_caption","rating_txt"],var_752.x,var_752.y,3);
         var_1141.height = NaN;
         Util.moveChildrenToColumn(var_754,["embed_info_txt","embed_src_txt"],var_1141.y,2);
         var_754.height = Util.getLowestPoint(var_754) + 5;
         var_2186 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1684.text = param1.eventName;
         var_626.text = param1.eventDescription;
         var_882.refreshTags(var_755,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_626.visible = false;
         if(param1.eventDescription != "")
         {
            var_626.height = NaN;
            var_626.y = Util.getLowestPoint(var_755) + 2;
            var_626.visible = true;
         }
         var_755.visible = true;
         var_755.height = Util.getLowestPoint(var_755);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_771,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
