package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_505:String;
      
      private var var_1048:String;
      
      private var var_1046:String;
      
      private var var_1045:int;
      
      private var _gender:int;
      
      private var var_1047:String;
      
      private var _name:String;
      
      private var var_1044:Boolean;
      
      private var var_640:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this._gender = param1.readInteger();
         this.var_640 = param1.readBoolean();
         this.var_1044 = param1.readBoolean();
         this.var_505 = param1.readString();
         this.var_1045 = param1.readInteger();
         this.var_1046 = param1.readString();
         this.var_1048 = param1.readString();
         this.var_1047 = param1.readString();
      }
      
      public function get gender() : int
      {
         return _gender;
      }
      
      public function get realName() : String
      {
         return var_1047;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1046;
      }
      
      public function get categoryId() : int
      {
         return var_1045;
      }
      
      public function get online() : Boolean
      {
         return var_640;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1044;
      }
      
      public function get lastAccess() : String
      {
         return var_1048;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_505;
      }
   }
}
