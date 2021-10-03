package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_338:Number = 0.5;
      
      private static const const_753:int = 3;
      
      private static const const_1062:Number = 1;
       
      
      private var var_1880:Boolean = false;
      
      private var var_1881:int = -2;
      
      private var _limitedLocX:Boolean = false;
      
      private var var_1877:Boolean = false;
      
      private var var_1876:Boolean = false;
      
      private var var_1878:int = -1;
      
      private var var_973:int = 0;
      
      private var var_257:Vector3d = null;
      
      private var var_390:Vector3d = null;
      
      private var var_1882:int = 0;
      
      private var var_1879:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function dispose() : void
      {
         var_390 = null;
         var_257 = null;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1880 = param1;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return _limitedLocX;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1877;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_390 != null && var_257 != null)
         {
            ++var_973;
            _loc2_ = Vector3d.dif(var_390,var_257);
            if(_loc2_.length <= const_338)
            {
               var_257 = var_390;
               var_390 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_338 * (const_753 + 1))
               {
                  _loc2_.mul(const_338);
               }
               else if(var_973 <= const_753)
               {
                  _loc2_.mul(const_338);
               }
               else
               {
                  _loc2_.mul(const_1062);
               }
               var_257 = Vector3d.sum(var_257,_loc2_);
            }
         }
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         _limitedLocX = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1882;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1876 = param1;
      }
      
      public function get targetId() : int
      {
         return var_1878;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1881 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_390 == null)
         {
            var_390 = new Vector3d();
         }
         var_390.assign(param1);
         var_973 = 0;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1877 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_257 != null)
         {
            return;
         }
         var_257 = new Vector3d();
         var_257.assign(param1);
      }
      
      public function get screenHt() : int
      {
         return var_1879;
      }
      
      public function get targetCategory() : int
      {
         return var_1881;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1882 = param1;
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1880;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1876;
      }
      
      public function get location() : IVector3d
      {
         return var_257;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1878 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1879 = param1;
      }
   }
}
