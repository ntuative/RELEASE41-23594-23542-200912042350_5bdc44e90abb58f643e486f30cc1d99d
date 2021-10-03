package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1372:int = 10;
       
      
      private var var_1500:NavigatorSettingsMessageParser;
      
      private var var_1265:int;
      
      private var var_2092:Boolean;
      
      private var var_2089:int;
      
      private var var_850:Dictionary;
      
      private var var_2215:int;
      
      private var var_2091:int;
      
      private var var_1866:int;
      
      private var var_311:Array;
      
      private var var_2090:int;
      
      private var var_1256:Array;
      
      private var var_568:PublicRoomShortData;
      
      private var var_403:RoomEventData;
      
      private var var_145:MsgWithRequestId;
      
      private var var_1828:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_2088:Boolean;
      
      private var var_204:GuestRoomData;
      
      private var var_686:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_311 = new Array();
         var_850 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_2089;
      }
      
      public function get eventMod() : Boolean
      {
         return var_2088;
      }
      
      public function startLoading() : void
      {
         this.var_686 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_2088 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_403 != null)
         {
            var_403.dispose();
         }
         var_403 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_145 != null && var_145 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_145 != null && var_145 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_145 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_204;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_568 = null;
         var_204 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_568 = param1.publicSpace;
            var_403 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(var_403 != null)
         {
            var_403.dispose();
            var_403 = null;
         }
         if(var_568 != null)
         {
            var_568.dispose();
            var_568 = null;
         }
         if(var_204 != null)
         {
            var_204.dispose();
            var_204 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_145 = param1;
         var_686 = false;
         if(var_1256 == null)
         {
            var_1256 = param1.topLevelNodes;
         }
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1500;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_145 = param1;
         var_686 = false;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function getCategoryByIndex(param1:int) : FlatCategory
      {
         if(var_311.length > param1)
         {
            return var_311[param1] as FlatCategory;
         }
         return null;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2215 = param1.limit;
         this.var_1265 = param1.favouriteRoomIds.length;
         this.var_850 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_850[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_145 as PopularRoomTagsData;
      }
      
      public function get categories() : Array
      {
         return var_311;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_568;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1866 = param1;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_2092;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_145 = param1;
         var_686 = false;
      }
      
      public function getCategoryIndexById(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < var_311.length)
         {
            if((var_311[_loc2_] as FlatCategory).nodeId == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_204 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_686;
      }
      
      public function set categories(param1:Array) : void
      {
         var_311 = param1;
      }
      
      public function get currentRoomRating() : int
      {
         return var_2091;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_2090;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1500 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_145 == null)
         {
            return;
         }
         var_145.dispose();
         var_145 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_403;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_850[param1] = !!param2 ? "yes" : null;
         var_1265 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_145 as OfficialRoomsData;
      }
      
      public function get topLevelNodes() : Array
      {
         return var_1256;
      }
      
      public function get avatarId() : int
      {
         return var_1866;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_145 != null && var_145 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_2092 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_2091 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1828 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_204 != null)
         {
            var_204.dispose();
         }
         var_204 = param1;
      }
      
      public function getCategoryById(param1:int) : FlatCategory
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_311)
         {
            if(_loc2_.nodeId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_204 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1500.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1265 >= var_2215;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_2090 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1828;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_204 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_2089 = param1;
      }
   }
}
