package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_936:PetData;
      
      private var var_1358:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1358 = param1.readBoolean();
         var_936 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1358 + ", " + var_936.id + ", " + var_936.name + ", " + pet.figure + ", " + var_936.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1358;
      }
      
      public function get pet() : PetData
      {
         return var_936;
      }
   }
}
