package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_77:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_214:Vector3d = null;
      
      private var var_1780:int = 0;
      
      private var var_2071:String = null;
      
      private var _category:int = 0;
      
      private var var_2070:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         _id = param1;
         _category = param2;
         var_2070 = param3;
         var_77 = new Vector3d();
         var_77.assign(param4);
         var_214 = new Vector3d();
         var_214.assign(param5);
         var_1780 = param6;
         var_2071 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return var_77;
      }
      
      public function get typeId() : int
      {
         return var_1780;
      }
      
      public function get dir() : Vector3d
      {
         return var_214;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get instanceData() : String
      {
         return var_2071;
      }
      
      public function get operation() : String
      {
         return var_2070;
      }
      
      public function dispose() : void
      {
         var_77 = null;
         var_214 = null;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
