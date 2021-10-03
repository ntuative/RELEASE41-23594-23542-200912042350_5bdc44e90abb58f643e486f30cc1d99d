package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1351:BigInteger;
      
      private var var_993:BigInteger;
      
      private var var_1717:BigInteger;
      
      private var var_1350:BigInteger;
      
      private var var_1718:BigInteger;
      
      private var var_1716:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1351 = param1;
         var_1717 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1718.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1350 = new BigInteger();
         var_1350.fromRadix(param1,param2);
         var_1718 = var_1350.modPow(var_993,var_1351);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1716.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         var_993 = new BigInteger();
         var_993.fromRadix(param1,param2);
         var_1716 = var_1717.modPow(var_993,var_1351);
         return true;
      }
   }
}
