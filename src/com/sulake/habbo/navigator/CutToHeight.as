package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToHeight implements BinarySearchTest
   {
       
      
      private var var_171:String;
      
      private var var_381:int;
      
      private var var_200:ITextWindow;
      
      public function CutToHeight()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_171 = param1;
         var_200 = param2;
         var_381 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_200.text = var_171.substring(0,param1) + "...";
         return var_200.textHeight > var_381;
      }
   }
}
