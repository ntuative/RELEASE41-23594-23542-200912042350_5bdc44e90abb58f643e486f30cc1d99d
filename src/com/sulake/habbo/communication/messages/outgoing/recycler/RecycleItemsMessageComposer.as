package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_758:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_758 = new Array();
         var_758.push(param1.length);
         var_758 = var_758.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_758;
      }
   }
}
