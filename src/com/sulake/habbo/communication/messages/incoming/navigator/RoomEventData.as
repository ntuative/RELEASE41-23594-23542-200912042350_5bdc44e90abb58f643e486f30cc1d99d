package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1684:String;
      
      private var var_392:int;
      
      private var var_1681:String;
      
      private var var_1682:String;
      
      private var var_1679:int;
      
      private var var_1680:String;
      
      private var var_1683:int;
      
      private var var_580:Array;
      
      private var var_1014:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_580 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1014 = false;
            return;
         }
         this.var_1014 = true;
         var_1679 = int(_loc2_);
         var_1681 = param1.readString();
         var_392 = int(param1.readString());
         var_1683 = param1.readInteger();
         var_1684 = param1.readString();
         var_1682 = param1.readString();
         var_1680 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_580.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_1683;
      }
      
      public function get eventName() : String
      {
         return var_1684;
      }
      
      public function get eventDescription() : String
      {
         return var_1682;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_1681;
      }
      
      public function get tags() : Array
      {
         return var_580;
      }
      
      public function get creationTime() : String
      {
         return var_1680;
      }
      
      public function get exists() : Boolean
      {
         return var_1014;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_1679;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
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
      
      public function get flatId() : int
      {
         return var_392;
      }
   }
}
