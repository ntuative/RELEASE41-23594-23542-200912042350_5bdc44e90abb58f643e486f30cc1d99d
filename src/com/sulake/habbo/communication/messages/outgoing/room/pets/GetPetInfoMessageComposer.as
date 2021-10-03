package com.sulake.habbo.communication.messages.outgoing.room.pets
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class GetPetInfoMessageComposer implements IMessageComposer
   {
       
      
      private var var_1184:int;
      
      public function GetPetInfoMessageComposer(param1:int)
      {
         super();
         var_1184 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1184];
      }
      
      public function dispose() : void
      {
      }
   }
}
