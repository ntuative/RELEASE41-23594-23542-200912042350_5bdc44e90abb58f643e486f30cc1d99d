package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const const_124:String = "RSPE_POLL_CONTENT";
      
      public static const const_105:String = "RSPE_POLL_OFFER";
      
      public static const const_57:String = "RSPE_POLL_ERROR";
       
      
      private var var_996:Array = null;
      
      private var var_1223:String = "";
      
      private var var_1098:String;
      
      private var var_1222:String = "";
      
      private var var_997:int = 0;
      
      private var _id:int = -1;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         _id = param3;
         super(param1,param2);
      }
      
      public function get questionArray() : Array
      {
         return var_996;
      }
      
      public function get startMessage() : String
      {
         return var_1223;
      }
      
      public function get summary() : String
      {
         return var_1098;
      }
      
      public function set startMessage(param1:String) : void
      {
         var_1223 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_997 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1098 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_997;
      }
      
      public function set endMessage(param1:String) : void
      {
         var_1222 = param1;
      }
      
      public function get endMessage() : String
      {
         return var_1222;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         var_996 = param1;
      }
   }
}
