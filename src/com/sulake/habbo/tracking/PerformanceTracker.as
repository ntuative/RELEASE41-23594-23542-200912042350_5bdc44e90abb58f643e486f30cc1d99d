package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1318:GarbageMonitor = null;
      
      private var var_1074:int = 0;
      
      private var var_1091:Boolean = false;
      
      private var var_1591:String = "";
      
      private var var_1319:String = "";
      
      private var var_317:Number = 0;
      
      private var var_1073:int = 10;
      
      private var var_2175:Array;
      
      private var var_583:int = 0;
      
      private var var_1071:int = 60;
      
      private var var_898:int = 0;
      
      private var var_897:int = 0;
      
      private var var_1629:String = "";
      
      private var var_1589:Number = 0;
      
      private var var_1072:int = 1000;
      
      private var var_1593:Boolean = true;
      
      private var var_1590:Number = 0.15;
      
      private var var_173:IHabboConfigurationManager = null;
      
      private var var_1592:String = "";
      
      private var var_1075:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2175 = [];
         super();
         var_1319 = Capabilities.version;
         var_1591 = Capabilities.os;
         var_1091 = Capabilities.isDebugger;
         var_1592 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1318 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1074 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1318.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1318.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_317;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1071 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1319;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_897;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1072)
         {
            ++var_898;
            _loc3_ = true;
         }
         else
         {
            ++var_583;
            if(var_583 <= 1)
            {
               var_317 = param1;
            }
            else
            {
               _loc4_ = Number(var_583);
               var_317 = var_317 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1074 > var_1071 * 1000 && var_1075 < var_1073)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_317);
            _loc5_ = true;
            if(var_1593 && var_1075 > 0)
            {
               _loc6_ = differenceInPercents(var_1589,var_317);
               if(_loc6_ < var_1590)
               {
                  _loc5_ = false;
               }
            }
            var_1074 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_1589 = var_317;
               if(sendReport())
               {
                  ++var_1075;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1073 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1072 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1592,var_1319,var_1591,var_1629,var_1091,_loc4_,_loc3_,var_897,var_317,var_898);
            _connection.send(_loc1_);
            var_897 = 0;
            var_317 = 0;
            var_583 = 0;
            var_898 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_173 = param1;
         var_1071 = int(var_173.getKey("performancetest.interval","60"));
         var_1072 = int(var_173.getKey("performancetest.slowupdatelimit","1000"));
         var_1073 = int(var_173.getKey("performancetest.reportlimit","10"));
         var_1590 = Number(var_173.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_1593 = Boolean(int(var_173.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
