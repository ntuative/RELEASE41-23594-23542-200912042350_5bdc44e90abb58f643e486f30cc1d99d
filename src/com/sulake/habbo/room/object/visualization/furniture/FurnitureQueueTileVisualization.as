package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1049:int = 1;
      
      private static const const_1039:int = 3;
      
      private static const const_1051:int = 2;
      
      private static const const_1050:int = 15;
       
      
      private var var_762:int;
      
      private var var_234:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_234 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1051)
         {
            var_234 = new Array();
            var_234.push(const_1049);
            var_762 = const_1050;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_762 > 0)
         {
            --var_762;
         }
         if(var_762 == 0)
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
