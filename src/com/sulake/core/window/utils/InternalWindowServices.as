package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_122:DisplayObject;
      
      private var var_2200:uint;
      
      private var var_818:IWindowToolTipAgentService;
      
      private var var_819:IWindowMouseScalingService;
      
      private var var_357:IWindowContext;
      
      private var var_815:IWindowFocusManagerService;
      
      private var var_816:IWindowMouseListenerService;
      
      private var var_817:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2200 = 0;
         var_122 = param2;
         var_357 = param1;
         var_817 = new WindowMouseDragger(param2);
         var_819 = new WindowMouseScaler(param2);
         var_816 = new WindowMouseListener(param2);
         var_815 = new FocusManager(param2);
         var_818 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_819;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_815;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_818;
      }
      
      public function dispose() : void
      {
         if(var_817 != null)
         {
            var_817.dispose();
            var_817 = null;
         }
         if(var_819 != null)
         {
            var_819.dispose();
            var_819 = null;
         }
         if(var_816 != null)
         {
            var_816.dispose();
            var_816 = null;
         }
         if(var_815 != null)
         {
            var_815.dispose();
            var_815 = null;
         }
         if(var_818 != null)
         {
            var_818.dispose();
            var_818 = null;
         }
         var_357 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_816;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_817;
      }
   }
}
