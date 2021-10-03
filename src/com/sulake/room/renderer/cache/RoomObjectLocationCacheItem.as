package com.sulake.room.renderer.cache
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectLocationCacheItem
   {
       
      
      private var var_2011:int = -1;
      
      private var var_1253:int = -1;
      
      private var var_669:Vector3d = null;
      
      public function RoomObjectLocationCacheItem()
      {
         super();
         var_669 = new Vector3d();
      }
      
      public function get objectUpdateId() : int
      {
         return var_2011;
      }
      
      public function set objectUpdateId(param1:int) : void
      {
         var_2011 = param1;
      }
      
      public function set screenLoc(param1:IVector3d) : void
      {
         var_669.assign(param1);
         var_669.x = Math.round(var_669.x);
         var_669.y = Math.round(var_669.y);
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         var_1253 = param1;
      }
      
      public function get screenLoc() : IVector3d
      {
         return var_669;
      }
      
      public function get geometryUpdateId() : int
      {
         return var_1253;
      }
   }
}
