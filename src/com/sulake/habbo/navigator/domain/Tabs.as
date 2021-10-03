package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_640:int = 6;
      
      public static const const_198:int = 5;
      
      public static const const_591:int = 2;
      
      public static const const_300:int = 9;
      
      public static const const_268:int = 4;
      
      public static const const_229:int = 2;
      
      public static const const_711:int = 4;
      
      public static const const_217:int = 8;
      
      public static const const_678:int = 7;
      
      public static const const_261:int = 3;
      
      public static const const_301:int = 1;
      
      public static const const_204:int = 5;
      
      public static const const_404:int = 12;
      
      public static const const_306:int = 1;
      
      public static const const_467:int = 11;
      
      public static const const_673:int = 3;
      
      public static const const_1452:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_365:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_365 = new Array();
         var_365.push(new Tab(_navigator,const_301,const_404,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_395));
         var_365.push(new Tab(_navigator,const_229,const_306,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_395));
         var_365.push(new Tab(_navigator,const_268,const_467,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_573));
         var_365.push(new Tab(_navigator,const_261,const_198,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_395));
         var_365.push(new Tab(_navigator,const_204,const_217,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_563));
         setSelectedTab(const_301);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_365)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_365)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_365)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_268;
      }
      
      public function get tabs() : Array
      {
         return var_365;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
