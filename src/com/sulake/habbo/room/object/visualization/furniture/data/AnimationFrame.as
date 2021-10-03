package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_671:int = -1;
      
      public static const const_954:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_2096:int = -1;
      
      private var var_89:int = 0;
      
      private var var_1268:int = 1;
      
      private var var_852:int = 1;
      
      private var var_2097:Boolean = false;
      
      private var var_2098:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_89 = param2;
         _y = param3;
         var_2097 = param5;
         if(param4 < 0)
         {
            param4 = const_671;
         }
         var_852 = param4;
         var_1268 = param4;
         if(param6 >= 0)
         {
            var_2096 = param6;
            var_2098 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_852 > 0 && param1 > var_852)
         {
            param1 = var_852;
         }
         var_1268 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_852;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_2098;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_852 < 0)
         {
            return const_671;
         }
         return var_1268;
      }
      
      public function get activeSequence() : int
      {
         return var_2096;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_2097;
      }
      
      public function get x() : int
      {
         return var_89;
      }
   }
}
