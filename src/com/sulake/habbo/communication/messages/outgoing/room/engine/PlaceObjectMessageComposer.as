package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_156:int;
      
      private var var_214:int = 0;
      
      private var _roomId:int;
      
      private var var_89:int = 0;
      
      private var _y:int = 0;
      
      private var var_1539:int;
      
      private var var_1860:String;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         var_156 = param1;
         var_1539 = param2;
         var_1860 = param3;
         var_89 = param4;
         _y = param5;
         var_214 = param6;
         _roomId = param7;
         _roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(var_1539)
         {
            case RoomObjectCategoryEnum.const_33:
               return [var_156 + " " + var_89 + " " + _y + " " + var_214];
            case RoomObjectCategoryEnum.const_29:
               return [var_156 + " " + var_1860];
            default:
               return [];
         }
      }
   }
}
