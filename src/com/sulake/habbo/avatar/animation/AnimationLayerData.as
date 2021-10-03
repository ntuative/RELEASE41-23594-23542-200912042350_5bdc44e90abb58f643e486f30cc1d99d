package com.sulake.habbo.avatar.animation
{
   import com.sulake.habbo.avatar.AvatarStructure;
   import com.sulake.habbo.avatar.actions.ActiveActionData;
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   
   public class AnimationLayerData implements IAnimationLayerData
   {
      
      public static const const_541:String = "bodypart";
      
      public static const const_391:String = "fx";
       
      
      private var _id:String;
      
      private var _dx:int;
      
      private var var_1417:IActiveActionData;
      
      private var _type:String;
      
      private var var_1875:int;
      
      private var var_426:int;
      
      private var var_972:String;
      
      private var var_1069:int;
      
      private var var_1280:int;
      
      private var var_1281:int;
      
      public function AnimationLayerData(param1:AvatarStructure, param2:XML, param3:String, param4:int, param5:IActionDefinition)
      {
         super();
         var_426 = param4;
         _id = String(param2.@id);
         var_1875 = parseInt(param2.@frame);
         _dx = parseInt(param2.@dx);
         var_1281 = parseInt(param2.@dy);
         var_1280 = parseInt(param2.@dz);
         var_1069 = parseInt(param2.@dd);
         _type = param3;
         var_972 = String(param2.@base);
         var _loc6_:String = "";
         if(var_972 != "")
         {
            _loc6_ = String(baseAsInt());
         }
         if(param5 != null)
         {
            var_1417 = new ActiveActionData(param5.state,_loc6_);
            var_1417.definition = param5;
         }
      }
      
      public function get animationFrame() : int
      {
         return var_1875;
      }
      
      public function baseAsInt() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < var_972.length)
         {
            _loc1_ += var_972.charCodeAt(_loc2_);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get frameCounter() : int
      {
         return var_426;
      }
      
      public function get base() : String
      {
         return var_972;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get dx() : int
      {
         return _dx;
      }
      
      public function get dz() : int
      {
         return var_1280;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get dy() : int
      {
         return var_1281;
      }
      
      public function get action() : IActiveActionData
      {
         return var_1417;
      }
      
      public function get directionOffset() : int
      {
         return var_1069;
      }
   }
}
