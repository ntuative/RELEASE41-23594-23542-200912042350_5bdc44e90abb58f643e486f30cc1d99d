package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1732:int;
      
      private var var_391:Boolean;
      
      private var var_1731:Boolean;
      
      private var var_745:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1731 = param1.readBoolean();
         if(var_1731)
         {
            var_1732 = param1.readInteger();
            var_391 = param1.readBoolean();
         }
         else
         {
            var_745 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_745 != null)
         {
            var_745.dispose();
            var_745 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_1732;
      }
      
      public function get owner() : Boolean
      {
         return var_391;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_1731;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_745;
      }
   }
}
