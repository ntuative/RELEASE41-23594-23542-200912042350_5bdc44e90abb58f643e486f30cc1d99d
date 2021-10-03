package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct
   {
       
      
      private var var_919:IID;
      
      private var var_364:uint;
      
      private var var_1107:IUnknown;
      
      private var var_1106:String;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_919 = param1;
         var_1106 = getQualifiedClassName(var_919);
         var_1107 = param2;
         var_364 = 0;
      }
      
      public function get iid() : IID
      {
         return var_919;
      }
      
      public function get references() : uint
      {
         return var_364;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_364) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1107;
      }
      
      public function get iis() : String
      {
         return var_1106;
      }
      
      public function reserve() : uint
      {
         return ++var_364;
      }
      
      public function dispose() : void
      {
         var_919 = null;
         var_1106 = null;
         var_1107 = null;
         var_364 = 0;
      }
   }
}
