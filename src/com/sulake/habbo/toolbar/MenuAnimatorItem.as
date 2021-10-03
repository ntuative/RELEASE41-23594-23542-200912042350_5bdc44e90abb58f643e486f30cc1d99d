package com.sulake.habbo.toolbar
{
   import com.sulake.core.window.IWindowContainer;
   import flash.geom.Point;
   
   public class MenuAnimatorItem
   {
       
      
      private var var_1678:String;
      
      private var var_1960:Array;
      
      private var _window:IWindowContainer;
      
      private var var_673:String;
      
      private var _icon:ToolbarIcon;
      
      private var _active:Boolean;
      
      private var var_1961:Point;
      
      private var _target:Point;
      
      private var var_335:Boolean;
      
      private var var_1962:Boolean;
      
      public function MenuAnimatorItem(param1:String, param2:ToolbarIcon)
      {
         super();
         var_1678 = param1;
         _icon = param2;
      }
      
      public function get visible() : Boolean
      {
         return var_335;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1962;
      }
      
      public function get offsetLoc() : Point
      {
         return var_1961;
      }
      
      public function get windowOffsetFromIcon() : int
      {
         return _icon.windowOffsetFromIcon;
      }
      
      public function get yieldList() : Array
      {
         return var_1960;
      }
      
      public function get active() : Boolean
      {
         return _active;
      }
      
      public function get target() : Point
      {
         return _target;
      }
      
      public function set lockToIcon(param1:Boolean) : void
      {
         var_1962 = param1;
      }
      
      public function get menuId() : String
      {
         return var_1678;
      }
      
      public function set active(param1:Boolean) : void
      {
         _active = param1;
      }
      
      public function set yieldList(param1:Array) : void
      {
         var_1960 = param1;
      }
      
      public function set offsetLoc(param1:Point) : void
      {
         var_1961 = param1;
      }
      
      public function set target(param1:Point) : void
      {
         _target = param1;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_335 = param1;
      }
      
      public function set window(param1:IWindowContainer) : void
      {
         _window = param1;
      }
      
      public function set iconId(param1:String) : void
      {
         var_673 = param1;
      }
      
      public function get iconId() : String
      {
         return var_673;
      }
      
      public function get margin() : int
      {
         return _icon.windowMargin;
      }
      
      public function get bottomMargin() : int
      {
         return _icon.group.windowBottomMargin;
      }
      
      public function get window() : IWindowContainer
      {
         return _window;
      }
   }
}
