package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_802:LegacyWallGeometry = null;
      
      private var var_549:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_548:TileHeightMap = null;
      
      private var var_1914:String = null;
      
      private var _roomId:int = 0;
      
      private var var_803:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_802 = new LegacyWallGeometry();
         var_803 = new RoomCamera();
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_548 != null)
         {
            var_548.dispose();
         }
         var_548 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_1914 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_802;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_803;
      }
      
      public function dispose() : void
      {
         if(var_548 != null)
         {
            var_548.dispose();
            var_548 = null;
         }
         if(var_802 != null)
         {
            var_802.dispose();
            var_802 = null;
         }
         if(var_803 != null)
         {
            var_803.dispose();
            var_803 = null;
         }
         if(var_549 != null)
         {
            var_549.dispose();
            var_549 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_548;
      }
      
      public function get worldType() : String
      {
         return var_1914;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_549 != null)
         {
            var_549.dispose();
         }
         var_549 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_549;
      }
   }
}
