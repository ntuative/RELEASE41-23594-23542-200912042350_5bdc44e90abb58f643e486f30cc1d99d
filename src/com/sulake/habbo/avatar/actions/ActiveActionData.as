package com.sulake.habbo.avatar.actions
{
   public class ActiveActionData implements IActiveActionData
   {
       
      
      private var var_1105:String = "";
      
      private var var_727:IActionDefinition;
      
      private var _actionParameter:String = "";
      
      public function ActiveActionData(param1:String, param2:String = "")
      {
         super();
         var_1105 = param1;
         _actionParameter = param2;
      }
      
      public function set actionParameter(param1:String) : void
      {
         _actionParameter = param1;
      }
      
      public function dispose() : void
      {
         var_1105 = null;
         _actionParameter = null;
         var_727 = null;
      }
      
      public function get actionType() : String
      {
         return var_1105;
      }
      
      public function get actionParameter() : String
      {
         return _actionParameter;
      }
      
      public function set definition(param1:IActionDefinition) : void
      {
         var_727 = param1;
      }
      
      public function get definition() : IActionDefinition
      {
         return var_727;
      }
      
      public function get id() : String
      {
         if(var_727 == null)
         {
            return "";
         }
         return "undefined_" + _actionParameter;
      }
   }
}
