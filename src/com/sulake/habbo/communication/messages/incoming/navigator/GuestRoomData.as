package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1538:int;
      
      private var var_1653:String;
      
      private var var_1654:int;
      
      private var var_1651:int;
      
      private var var_633:Boolean;
      
      private var var_1605:Boolean;
      
      private var var_392:int;
      
      private var var_1103:String;
      
      private var var_1602:int;
      
      private var var_1045:int;
      
      private var _ownerName:String;
      
      private var var_585:String;
      
      private var var_1652:int;
      
      private var var_1650:RoomThumbnailData;
      
      private var var_1600:Boolean;
      
      private var var_580:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_580 = new Array();
         super();
         var_392 = param1.readInteger();
         var_633 = param1.readBoolean();
         var_585 = param1.readString();
         _ownerName = param1.readString();
         var_1602 = param1.readInteger();
         var_1538 = param1.readInteger();
         var_1652 = param1.readInteger();
         var_1103 = param1.readString();
         var_1654 = param1.readInteger();
         var_1600 = param1.readBoolean();
         var_1651 = param1.readInteger();
         var_1045 = param1.readInteger();
         var_1653 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_580.push(_loc4_);
            _loc3_++;
         }
         var_1650 = new RoomThumbnailData(param1);
         var_1605 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_1652;
      }
      
      public function get roomName() : String
      {
         return var_585;
      }
      
      public function get userCount() : int
      {
         return var_1538;
      }
      
      public function get score() : int
      {
         return var_1651;
      }
      
      public function get eventCreationTime() : String
      {
         return var_1653;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1600;
      }
      
      public function get tags() : Array
      {
         return var_580;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1605;
      }
      
      public function get event() : Boolean
      {
         return var_633;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_580 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1045;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_1654;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_1650;
      }
      
      public function get doorMode() : int
      {
         return var_1602;
      }
      
      public function get flatId() : int
      {
         return var_392;
      }
      
      public function get description() : String
      {
         return var_1103;
      }
   }
}
