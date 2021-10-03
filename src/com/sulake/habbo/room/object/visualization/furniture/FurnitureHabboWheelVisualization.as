package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1053:int = 31;
      
      private static const const_1039:int = 32;
      
      private static const const_747:int = 10;
      
      private static const const_486:int = 20;
       
      
      private var var_544:Boolean = false;
      
      private var var_234:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_234 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_544 = true;
            var_234 = new Array();
            var_234.push(const_1053);
            var_234.push(const_1039);
            return;
         }
         if(param1 > 0 && param1 <= const_747)
         {
            if(var_544)
            {
               var_544 = false;
               var_234 = new Array();
               var_234.push(const_747 + param1);
               var_234.push(const_486 + param1);
               var_234.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
         {
            if(false)
            {
               super.setAnimation(var_234.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
