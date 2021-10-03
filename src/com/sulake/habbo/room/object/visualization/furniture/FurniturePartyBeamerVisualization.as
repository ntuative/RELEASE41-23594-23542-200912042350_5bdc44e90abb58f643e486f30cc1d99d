package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import flash.geom.Point;
   
   public class FurniturePartyBeamerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_735:int = 15;
      
      private static const const_1038:int = 2;
      
      private static const const_335:int = 2;
      
      private static const const_736:int = 31;
      
      private static const const_1037:int = 1;
       
      
      private var var_939:Array;
      
      private var var_940:Array;
      
      private var var_942:Array;
      
      private var _animOffsetIndex:Array;
      
      private var var_941:Array;
      
      public function FurniturePartyBeamerVisualization()
      {
         _animOffsetIndex = new Array();
         super();
      }
      
      override protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         if(param1 == 2 || param1 == 3)
         {
            if(false)
            {
               return _animOffsetIndex[param1 - 2].x;
            }
         }
         return super.getSpriteYOffset(param1,param2,param3);
      }
      
      override protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         if(param1 == 2 || param1 == 3)
         {
            if(false)
            {
               return _animOffsetIndex[param1 - 2].y;
            }
         }
         return super.getSpriteYOffset(param1,param2,param3);
      }
      
      private function getNewPoint(param1:int, param2:Number) : Point
      {
         var _loc7_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         if(param2 == 32)
         {
            _loc7_ = const_735;
         }
         else
         {
            _loc7_ = const_736;
         }
         if(Math.abs(_loc3_ + _loc4_ * _loc5_) >= _loc7_)
         {
            _loc4_ = -_loc4_;
            var_940[param1] = _loc4_;
         }
         var _loc8_:Number = (_loc7_ - Math.abs(_loc3_)) * _loc6_;
         var _loc9_:Number = _loc4_ * Math.sin(Math.abs(_loc3_ / 4)) * _loc8_;
         if(_loc4_ > 0)
         {
            _loc9_ -= _loc8_;
         }
         else
         {
            _loc9_ += _loc8_;
         }
         _loc3_ += _loc4_ * _loc5_;
         var_942[param1] = _loc3_;
         if(int(_loc9_) == 0)
         {
            var_941[param1] = getRandomAmplitudeFactor();
         }
         return new Point(_loc3_,_loc9_);
      }
      
      private function initItems(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 == 32)
         {
            _loc2_ = const_735;
         }
         else
         {
            _loc2_ = const_736;
         }
         var_942 = new Array();
         var_942.push(Math.random() * _loc2_ * 1.5);
         var_942.push(Math.random() * _loc2_ * 1.5);
         var_940 = new Array();
         var_940.push(1);
         var_940.push(-1);
         var_939 = new Array();
         var_939.push(const_1038);
         var_939.push(const_1037);
         var_941 = new Array();
         var_941.push(getRandomAmplitudeFactor());
         var_941.push(getRandomAmplitudeFactor());
      }
      
      private function getRandomAmplitudeFactor() : Number
      {
         return Math.random() * 30 / 100 + 0.15;
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         var _loc2_:* = null;
         if(var_939 == null)
         {
            initItems(param1);
         }
         _loc2_ = getSprite(2);
         if(_loc2_ != null)
         {
            _animOffsetIndex[0] = getNewPoint(0,param1);
         }
         _loc2_ = getSprite(3);
         if(_loc2_ != null)
         {
            _animOffsetIndex[1] = getNewPoint(1,param1);
         }
         return super.updateAnimation(param1);
      }
   }
}
