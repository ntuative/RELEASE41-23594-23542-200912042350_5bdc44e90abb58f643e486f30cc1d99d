package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectRoomMaskUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_1340:String = "door";
      
      public static const const_388:String = "window";
      
      public static const const_644:String = "RORMUM_ADD_MASK";
      
      public static const const_358:String = "RORMUM_ADD_MASK";
      
      public static const const_214:String = "hole";
       
      
      private var var_2109:String = "";
      
      private var var_2110:String = "";
      
      private var var_2111:String = "window";
      
      private var var_2108:Vector3d = null;
      
      private var _type:String = "";
      
      public function RoomObjectRoomMaskUpdateMessage(param1:String, param2:String, param3:String = null, param4:IVector3d = null, param5:String = "window")
      {
         super(null,null);
         _type = param1;
         var_2110 = param2;
         var_2109 = param3;
         if(param4 != null)
         {
            var_2108 = new Vector3d(param4.x,param4.y,param4.z);
         }
         var_2111 = param5;
      }
      
      public function get maskCategory() : String
      {
         return var_2111;
      }
      
      public function get maskId() : String
      {
         return var_2110;
      }
      
      public function get maskLocation() : IVector3d
      {
         return var_2108;
      }
      
      public function get maskType() : String
      {
         return var_2109;
      }
      
      public function get type() : String
      {
         return _type;
      }
   }
}
