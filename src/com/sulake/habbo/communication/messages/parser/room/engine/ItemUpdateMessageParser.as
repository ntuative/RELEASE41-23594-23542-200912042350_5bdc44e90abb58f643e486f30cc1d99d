package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.room.engine.ItemMessageData;
   
   public class ItemUpdateMessageParser implements IMessageParser
   {
       
      
      private var var_232:ItemMessageData = null;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function ItemUpdateMessageParser()
      {
         super();
      }
      
      public function get data() : ItemMessageData
      {
         var _loc1_:ItemMessageData = var_232;
         if(_loc1_ != null)
         {
            _loc1_.setReadOnly();
         }
         return _loc1_;
      }
      
      public function flush() : Boolean
      {
         var_232 = null;
         _roomId = 0;
         _roomCategory = 0;
         return true;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_232 = ItemDataParser.parseItemData(param1);
         return true;
      }
   }
}
