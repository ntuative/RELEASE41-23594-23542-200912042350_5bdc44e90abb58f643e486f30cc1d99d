package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2165:Boolean;
      
      private var var_2167:int;
      
      private var var_2166:Boolean;
      
      private var var_1395:String;
      
      private var var_1047:String;
      
      private var var_1866:int;
      
      private var var_1834:String;
      
      private var var_2168:String;
      
      private var var_1833:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1866 = param1.readInteger();
         this.var_1395 = param1.readString();
         this.var_1834 = param1.readString();
         this.var_2165 = param1.readBoolean();
         this.var_2166 = param1.readBoolean();
         param1.readString();
         this.var_2167 = param1.readInteger();
         this.var_1833 = param1.readString();
         this.var_2168 = param1.readString();
         this.var_1047 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1047;
      }
      
      public function get avatarName() : String
      {
         return this.var_1395;
      }
      
      public function get avatarId() : int
      {
         return this.var_1866;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2165;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2168;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1833;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2166;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1834;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2167;
      }
   }
}
