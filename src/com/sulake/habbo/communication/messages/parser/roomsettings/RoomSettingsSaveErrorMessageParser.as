package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1396:int = 9;
      
      public static const const_1525:int = 4;
      
      public static const const_1471:int = 1;
      
      public static const const_1318:int = 10;
      
      public static const const_1399:int = 2;
      
      public static const const_1167:int = 7;
      
      public static const const_1278:int = 11;
      
      public static const const_1480:int = 3;
      
      public static const const_1197:int = 8;
      
      public static const const_1287:int = 5;
      
      public static const const_1434:int = 6;
      
      public static const const_1251:int = 12;
       
      
      private var var_1974:String;
      
      private var _roomId:int;
      
      private var var_1128:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1974;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1128 = param1.readInteger();
         var_1974 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1128;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
