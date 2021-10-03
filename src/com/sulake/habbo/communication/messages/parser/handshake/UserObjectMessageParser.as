package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_505:String;
      
      private var var_2210:String;
      
      private var var_2208:int;
      
      private var var_2209:int;
      
      private var var_1258:String;
      
      private var var_1047:String;
      
      private var _name:String;
      
      private var var_778:int;
      
      private var _respectLeft:int;
      
      private var var_2211:int;
      
      private var var_1583:int;
      
      private var var_2207:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2209;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1047;
      }
      
      public function get customData() : String
      {
         return this.var_2210;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_778;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2208;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2207;
      }
      
      public function get figure() : String
      {
         return this.var_505;
      }
      
      public function get respectTotal() : int
      {
         return this.var_1583;
      }
      
      public function get sex() : String
      {
         return this.var_1258;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_505 = param1.readString();
         this.var_1258 = param1.readString();
         this.var_2210 = param1.readString();
         this.var_1047 = param1.readString();
         this.var_2211 = param1.readInteger();
         this.var_2207 = param1.readString();
         this.var_2208 = param1.readInteger();
         this.var_2209 = param1.readInteger();
         this.var_1583 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_778 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2211;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
   }
}
