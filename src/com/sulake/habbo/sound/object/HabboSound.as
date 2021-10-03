package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1001:SoundChannel = null;
      
      private var var_814:Boolean;
      
      private var var_1002:Sound = null;
      
      private var var_667:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_1002 = param1;
         var_1002.addEventListener(Event.COMPLETE,onComplete);
         var_667 = 1;
         var_814 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_814;
      }
      
      public function stop() : Boolean
      {
         var_1001.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_814 = false;
         var_1001 = var_1002.play(0);
         this.volume = var_667;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_667;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_1001.position;
      }
      
      public function get length() : Number
      {
         return var_1002.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_667 = param1;
         if(var_1001 != null)
         {
            var_1001.soundTransform = new SoundTransform(var_667);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_814 = true;
      }
   }
}
