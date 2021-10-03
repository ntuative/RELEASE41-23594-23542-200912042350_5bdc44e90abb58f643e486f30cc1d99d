package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_116:String = "RSPE_VOTE_RESULT";
      
      public static const const_120:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1284:int = 0;
      
      private var var_982:String = "";
      
      private var var_655:Array;
      
      private var var_909:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_909 = [];
         var_655 = [];
         super(param1,param2,param7,param8);
         var_982 = param3;
         var_909 = param4;
         var_655 = param5;
         if(var_655 == null)
         {
            var_655 = [];
         }
         var_1284 = param6;
      }
      
      public function get votes() : Array
      {
         return var_655.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1284;
      }
      
      public function get question() : String
      {
         return var_982;
      }
      
      public function get choices() : Array
      {
         return var_909.slice();
      }
   }
}
