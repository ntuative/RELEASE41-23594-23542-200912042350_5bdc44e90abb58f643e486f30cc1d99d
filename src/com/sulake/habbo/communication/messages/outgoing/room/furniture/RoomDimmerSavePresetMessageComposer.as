package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1549:int;
      
      private var var_1552:int;
      
      private var var_1550:Boolean;
      
      private var var_1551:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1548:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1552 = param1;
         var_1549 = param2;
         var_1551 = param3;
         var_1548 = param4;
         var_1550 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1552,var_1549,var_1551,var_1548,int(var_1550)];
      }
      
      public function dispose() : void
      {
      }
   }
}
