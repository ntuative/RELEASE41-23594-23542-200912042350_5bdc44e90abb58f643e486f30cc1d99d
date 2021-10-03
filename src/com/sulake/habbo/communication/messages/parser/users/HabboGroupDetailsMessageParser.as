package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboGroupDetailsMessageParser implements IMessageParser
   {
       
      
      private var var_585:String = "";
      
      private var _name:String = "";
      
      private var _roomId:int = -1;
      
      private var var_952:int = -1;
      
      private var var_1103:String = "";
      
      public function HabboGroupDetailsMessageParser()
      {
         super();
      }
      
      public function get groupId() : int
      {
         return var_952;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_952 = param1.readInteger();
         if(var_952 != -1)
         {
            _name = param1.readString();
            var_1103 = param1.readString();
            _roomId = param1.readInteger();
            var_585 = param1.readString();
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_952 = -1;
         _name = "";
         var_1103 = "";
         _roomId = -1;
         var_585 = "";
         return true;
      }
      
      public function get roomName() : String
      {
         return var_585;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get description() : String
      {
         return var_1103;
      }
   }
}
