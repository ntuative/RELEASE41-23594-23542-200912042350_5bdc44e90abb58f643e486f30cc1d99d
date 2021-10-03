package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1697:int;
      
      private var var_2116:int = 0;
      
      private var var_2114:String;
      
      private var var_2115:int;
      
      private var var_2113:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1697 = param1;
         var_2115 = param2;
         var_2113 = param3;
         var_2114 = param4;
      }
      
      public function get length() : int
      {
         return var_2115;
      }
      
      public function get name() : String
      {
         return var_2113;
      }
      
      public function get creator() : String
      {
         return var_2114;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_2116;
      }
      
      public function get id() : int
      {
         return var_1697;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_2116 = param1;
      }
   }
}
