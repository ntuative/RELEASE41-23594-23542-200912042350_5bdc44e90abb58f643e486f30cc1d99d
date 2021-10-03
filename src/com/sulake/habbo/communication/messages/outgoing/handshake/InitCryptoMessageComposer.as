package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class InitCryptoMessageComposer implements IMessageComposer
   {
       
      
      private var var_33:Array;
      
      public function InitCryptoMessageComposer(param1:int)
      {
         super();
         var_33 = new Array();
         var_33.push(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_33;
      }
   }
}
