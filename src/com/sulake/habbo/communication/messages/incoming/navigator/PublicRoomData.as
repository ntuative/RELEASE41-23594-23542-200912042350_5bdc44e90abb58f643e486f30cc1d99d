package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1764:int;
      
      private var var_1932:String;
      
      private var var_1763:int;
      
      private var _disposed:Boolean;
      
      private var var_1933:int;
      
      private var var_1884:String;
      
      private var var_1235:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1884 = param1.readString();
         var_1764 = param1.readInteger();
         var_1763 = param1.readInteger();
         var_1932 = param1.readString();
         var_1933 = param1.readInteger();
         var_1235 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_1933;
      }
      
      public function get worldId() : int
      {
         return var_1763;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_1884;
      }
      
      public function get unitPort() : int
      {
         return var_1764;
      }
      
      public function get castLibs() : String
      {
         return var_1932;
      }
      
      public function get nodeId() : int
      {
         return var_1235;
      }
   }
}
