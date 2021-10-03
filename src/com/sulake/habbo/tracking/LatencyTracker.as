package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
   import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LatencyTracker
   {
       
      
      private var var_162:Array;
      
      private var _state:Boolean = false;
      
      private var var_1502:int = 0;
      
      private var var_1503:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_484:Map;
      
      private var var_2104:int = 0;
      
      private var var_1504:int = 0;
      
      private var var_173:IHabboConfigurationManager;
      
      private var var_1277:int = 0;
      
      private var _connection:IConnection;
      
      private var var_1505:int = 0;
      
      public function LatencyTracker()
      {
         super();
      }
      
      public function update(param1:uint) : void
      {
         if(!_state)
         {
            return;
         }
         if(getTimer() - var_1502 > var_1503)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         var_1502 = getTimer();
         var_484.add(var_1277,var_1502);
         _connection.send(new LatencyPingRequestMessageComposer(var_1277));
         ++var_1277;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function init() : void
      {
         if(var_173 == null || _communication == null || _connection == null)
         {
            return;
         }
         var_1503 = int(var_173.getKey("latencytest.interval"));
         var_1505 = int(var_173.getKey("latencytest.report.index"));
         var_2104 = int(var_173.getKey("latencytest.report.delta"));
         _communication.addHabboConnectionMessageEvent(new LatencyPingResponseMessageEvent(onPingResponse));
         if(var_1503 < 1)
         {
            return;
         }
         var_484 = new Map();
         var_162 = new Array();
         _state = true;
      }
      
      private function onPingResponse(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(var_484 == null || var_162 == null)
         {
            return;
         }
         var _loc2_:LatencyPingResponseMessageParser = (param1 as LatencyPingResponseMessageEvent).getParser();
         var _loc3_:int = var_484.getValue(_loc2_.requestId);
         var_484.remove(_loc2_.requestId);
         var _loc4_:int = getTimer() - _loc3_;
         var_162.push(_loc4_);
         if(var_162.length == var_1505 && var_1505 > 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_162.length)
            {
               _loc5_ += var_162[_loc8_];
               _loc8_++;
            }
            _loc9_ = _loc5_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_162.length)
            {
               if(var_162[_loc8_] < _loc9_ * 2)
               {
                  _loc6_ += var_162[_loc8_];
                  _loc7_++;
               }
               _loc8_++;
            }
            if(_loc7_ == 0)
            {
               var_162 = [];
               return;
            }
            _loc10_ = _loc6_ / _loc7_;
            if(Math.abs(_loc9_ - var_1504) > var_2104 || var_1504 == 0)
            {
               var_1504 = _loc9_;
               _loc11_ = new LatencyPingReportMessageComposer(_loc9_,_loc10_,var_162.length);
               _connection.send(_loc11_);
            }
            var_162 = [];
         }
      }
      
      public function dispose() : void
      {
         _state = false;
         var_173 = null;
         _communication = null;
         _connection = null;
         if(var_484 != null)
         {
            var_484.dispose();
            var_484 = null;
         }
         var_162 = null;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_173 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
