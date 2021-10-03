package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LagWarningReportMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LagWarningLogger
   {
      
      public static const const_829:int = 0;
      
      public static const WARNING_TYPE_CHAT_DELAY:int = 1;
       
      
      private var var_1257:Boolean = true;
      
      private var var_1075:int = 0;
      
      private var var_794:int = 0;
      
      private var var_1074:int = 0;
      
      private var var_793:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1073:int = 15;
      
      private var var_173:IHabboConfigurationManager;
      
      private var _connection:IConnection;
      
      private var var_1071:int = 60;
      
      public function LagWarningLogger()
      {
         super();
         var_1074 = getTimer();
      }
      
      public function logWarnings() : void
      {
         if(!var_1257)
         {
            return;
         }
         if(nothingToReport)
         {
            return;
         }
         var _loc1_:LagWarningReportMessageComposer = new LagWarningReportMessageComposer(var_794,var_793);
         if(_connection != null)
         {
            _connection.send(_loc1_);
         }
         resetLog();
         ++var_1075;
      }
      
      private function get nothingToReport() : Boolean
      {
         return var_794 == 0 && var_793 == 0;
      }
      
      private function resetLog() : void
      {
         var_794 = 0;
         var_793 = 0;
      }
      
      public function update(param1:uint) : void
      {
         if(!var_1257)
         {
            return;
         }
         if(getTimer() - var_1074 > var_1071 * 1000 && var_1075 < var_1073)
         {
            var_1074 = getTimer();
            logWarnings();
         }
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_173 = param1;
         var_1071 = int(var_173.getKey("lagwarninglog.interval","60"));
         var_1073 = int(var_173.getKey("lagwarninglog.reportlimit","15"));
         var_1257 = Boolean(int(var_173.getKey("lagwarninglog.enabled","1")));
      }
      
      public function registerWarning(param1:int) : void
      {
         switch(param1)
         {
            case WARNING_TYPE_CHAT_DELAY:
               var_793 += 1;
            case const_829:
               var_794 += 1;
         }
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
