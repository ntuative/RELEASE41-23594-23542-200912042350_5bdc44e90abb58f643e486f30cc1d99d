package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_599:String = "Rectangle";
      
      public static const const_61:String = "Boolean";
      
      public static const const_544:String = "Number";
      
      public static const const_87:String = "int";
      
      public static const const_227:String = "String";
      
      public static const const_712:String = "Point";
      
      public static const const_853:String = "Array";
      
      public static const const_1298:String = "uint";
      
      public static const const_356:String = "hex";
      
      public static const const_980:String = "Map";
       
      
      private var var_533:String;
      
      private var var_171:Object;
      
      private var var_2188:Boolean;
      
      private var _type:String;
      
      private var var_1792:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         var_533 = param1;
         var_171 = param2;
         _type = param3;
         var_1792 = param4;
         var_2188 = param3 == const_980 || param3 == const_853 || param3 == const_712 || param3 == const_599;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function toString() : String
      {
         switch(_type)
         {
            case const_356:
               return "0x" + uint(var_171).toString(16);
            case const_61:
               return Boolean(var_171) == true ? "UseObjectMessageEvent" : "false";
            case const_712:
               return "Point(" + Point(var_171).x + ", " + Point(var_171).y + ")";
            case const_599:
               return "Rectangle(" + Rectangle(var_171).x + ", " + Rectangle(var_171).y + ", " + Rectangle(var_171).width + ", " + Rectangle(var_171).height + ")";
            default:
               return String(value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(_type)
         {
            case const_980:
               _loc3_ = var_171 as Map;
               _loc1_ = "<var key=\"" + var_533 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_853:
               _loc4_ = var_171 as Array;
               _loc1_ = "<var key=\"" + var_533 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_712:
               _loc5_ = var_171 as Point;
               _loc1_ = "<var key=\"" + var_533 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_87 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_87 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_599:
               _loc6_ = var_171 as Rectangle;
               _loc1_ = "<var key=\"" + var_533 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_87 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_87 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_87 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_87 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_356:
               _loc1_ = "<var key=\"" + var_533 + "\" value=\"" + "0x" + uint(var_171).toString(16) + "\" type=\"" + _type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + var_533 + "\" value=\"" + var_171 + "\" type=\"" + _type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return var_171;
      }
      
      public function get valid() : Boolean
      {
         return var_1792;
      }
      
      public function get key() : String
      {
         return var_533;
      }
   }
}
