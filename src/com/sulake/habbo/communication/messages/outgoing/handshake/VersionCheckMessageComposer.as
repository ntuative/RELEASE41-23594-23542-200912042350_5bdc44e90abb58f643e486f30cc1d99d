package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_1578:String;
      
      private var var_1182:String;
      
      private var var_1579:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_1579 = param1;
         var_1182 = param2;
         var_1578 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1579,var_1182,var_1578];
      }
      
      public function dispose() : void
      {
      }
   }
}
