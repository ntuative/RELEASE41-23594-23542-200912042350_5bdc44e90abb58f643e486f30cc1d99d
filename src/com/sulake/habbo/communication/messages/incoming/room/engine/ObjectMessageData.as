package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_958:int = 0;
      
      private var var_957:int = 0;
      
      private var _data:String = "";
      
      private var var_2249:int = 0;
      
      private var _state:int = 0;
      
      private var _type:int = 0;
      
      private var var_2250:String = "";
      
      private var _id:int = 0;
      
      private var var_205:Boolean = false;
      
      private var var_214:int = 0;
      
      private var var_1869:String = null;
      
      private var var_89:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_90:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_205)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_205)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_214;
      }
      
      public function get x() : Number
      {
         return var_89;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_205)
         {
            var_214 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get z() : Number
      {
         return var_90;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_205)
         {
            _state = param1;
         }
      }
      
      public function get staticClass() : String
      {
         return var_1869;
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_205)
         {
            var_1869 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_205)
         {
            _data = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_205 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_205)
         {
            var_958 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_205)
         {
            var_957 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_205)
         {
            var_90 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return var_957;
      }
      
      public function get sizeX() : int
      {
         return var_958;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_205)
         {
            var_89 = param1;
         }
      }
   }
}
