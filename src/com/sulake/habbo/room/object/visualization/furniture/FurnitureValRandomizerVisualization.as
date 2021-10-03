package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1053:int = 31;
      
      private static const const_1039:int = 32;
      
      private static const const_485:int = 30;
      
      private static const const_747:int = 20;
      
      private static const const_486:int = 10;
       
      
      private var var_544:Boolean = false;
      
      private var var_234:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_234 = new Array();
         super();
         super.setAnimation(const_485);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_544 = true;
            var_234 = new Array();
            var_234.push(const_1053);
            var_234.push(const_1039);
            return;
         }
         if(param1 > 0 && param1 <= const_486)
         {
            if(var_544)
            {
               var_544 = false;
               var_234 = new Array();
               if(_direction == 2)
               {
                  var_234.push(const_747 + 5 - param1);
                  var_234.push(const_486 + 5 - param1);
               }
               else
               {
                  var_234.push(const_747 + param1);
                  var_234.push(const_486 + param1);
               }
               var_234.push(const_485);
               return;
            }
            super.setAnimation(const_485);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
