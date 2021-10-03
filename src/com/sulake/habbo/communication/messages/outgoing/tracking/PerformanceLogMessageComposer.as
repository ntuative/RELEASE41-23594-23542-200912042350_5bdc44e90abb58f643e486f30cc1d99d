package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_898:int = 0;
      
      private var var_1091:int = 0;
      
      private var var_1591:String = "";
      
      private var var_897:int = 0;
      
      private var var_1629:String = "";
      
      private var var_1628:int = 0;
      
      private var var_1319:String = "";
      
      private var var_1631:int = 0;
      
      private var var_1630:int = 0;
      
      private var var_1592:String = "";
      
      private var var_1632:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1631 = param1;
         var_1592 = param2;
         var_1319 = param3;
         var_1591 = param4;
         var_1629 = param5;
         if(param6)
         {
            var_1091 = 1;
         }
         else
         {
            var_1091 = 0;
         }
         var_1628 = param7;
         var_1630 = param8;
         var_897 = param9;
         var_1632 = param10;
         var_898 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1631,var_1592,var_1319,var_1591,var_1629,var_1091,var_1628,var_1630,var_897,var_1632,var_898];
      }
      
      public function dispose() : void
      {
      }
   }
}
