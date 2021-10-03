package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1890:int;
      
      private var var_1891:int;
      
      private var var_1887:int;
      
      private var _userName:String;
      
      private var var_1889:int;
      
      private var var_1886:int;
      
      private var var_1888:int;
      
      private var _userId:int;
      
      private var var_640:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1886 = param1.readInteger();
         var_1889 = param1.readInteger();
         var_640 = param1.readBoolean();
         var_1887 = param1.readInteger();
         var_1891 = param1.readInteger();
         var_1890 = param1.readInteger();
         var_1888 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1888;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_640;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1889;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1891;
      }
      
      public function get cautionCount() : int
      {
         return var_1890;
      }
      
      public function get cfhCount() : int
      {
         return var_1887;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1886;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
