package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1126:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_743:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1126 = param1;
         var_743 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_743;
      }
      
      public function get identifier() : IID
      {
         return var_1126;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1126 = null;
            while(false)
            {
               var_743.pop();
            }
            var_743 = null;
         }
      }
   }
}
