package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_986:int = 4;
      
      public static const TYPE_PUBLIC_SPACE:int = 3;
      
      public static const const_647:int = 2;
      
      public static const const_966:int = 1;
       
      
      private var var_2027:String;
      
      private var _disposed:Boolean;
      
      private var var_1538:int;
      
      private var var_2026:Boolean;
      
      private var var_767:String;
      
      private var var_834:PublicRoomData;
      
      private var _index:int;
      
      private var var_2025:String;
      
      private var _type:int;
      
      private var var_1522:String;
      
      private var var_833:GuestRoomData;
      
      private var var_2028:String;
      
      private var var_2024:int;
      
      public function OfficialRoomEntryData(param1:int, param2:IMessageDataWrapper)
      {
         super();
         _index = param1;
         var_2027 = param2.readString();
         var_2028 = param2.readString();
         var_2026 = param2.readInteger() == 1;
         var_2025 = param2.readString();
         var_767 = param2.readString();
         var_1538 = param2.readInteger();
         _type = param2.readInteger();
         if(_type == const_966)
         {
            var_1522 = param2.readString();
         }
         else if(_type == TYPE_PUBLIC_SPACE)
         {
            var_834 = new PublicRoomData(param2);
         }
         else if(_type == const_647)
         {
            var_833 = new GuestRoomData(param2);
         }
         else if(_type == const_986)
         {
            var_2024 = param2.readInteger();
         }
      }
      
      public function get tag() : String
      {
         return var_1522;
      }
      
      public function get userCount() : int
      {
         return var_1538;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get showDetails() : Boolean
      {
         return var_2026;
      }
      
      public function get picText() : String
      {
         return var_2025;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_966)
         {
            return 0;
         }
         if(this.type == const_647)
         {
            return this.var_833.maxUserCount;
         }
         if(this.type == TYPE_PUBLIC_SPACE)
         {
            return this.var_834.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_2028;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_833 != null)
         {
            this.var_833.dispose();
            this.var_833 = null;
         }
         if(this.var_834 != null)
         {
            this.var_834.dispose();
            this.var_834 = null;
         }
      }
      
      public function get popupCaption() : String
      {
         return var_2027;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_833;
      }
      
      public function get picRef() : String
      {
         return var_767;
      }
      
      public function get flatCategoryId() : int
      {
         return var_2024;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_834;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
