package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1211:String = "WN_CREATED";
      
      public static const const_821:String = "WN_DISABLE";
      
      public static const const_837:String = "WN_DEACTIVATED";
      
      public static const const_796:String = "WN_OPENED";
      
      public static const const_927:String = "WN_CLOSED";
      
      public static const const_940:String = "WN_DESTROY";
      
      public static const const_1493:String = "WN_ARRANGED";
      
      public static const const_375:String = "WN_PARENT_RESIZED";
      
      public static const const_847:String = "WN_ENABLE";
      
      public static const const_863:String = "WN_RELOCATE";
      
      public static const const_822:String = "WN_FOCUS";
      
      public static const const_976:String = "WN_PARENT_RELOCATED";
      
      public static const const_409:String = "WN_PARAM_UPDATED";
      
      public static const const_493:String = "WN_PARENT_ACTIVATED";
      
      public static const const_257:String = "WN_RESIZED";
      
      public static const const_823:String = "WN_CLOSE";
      
      public static const const_931:String = "WN_PARENT_REMOVED";
      
      public static const const_223:String = "WN_CHILD_RELOCATED";
      
      public static const const_686:String = "WN_ENABLED";
      
      public static const const_246:String = "WN_CHILD_RESIZED";
      
      public static const const_983:String = "WN_MINIMIZED";
      
      public static const const_552:String = "WN_DISABLED";
      
      public static const const_206:String = "WN_CHILD_ACTIVATED";
      
      public static const const_392:String = "WN_STATE_UPDATED";
      
      public static const const_657:String = "WN_UNSELECTED";
      
      public static const const_444:String = "WN_STYLE_UPDATED";
      
      public static const const_1518:String = "WN_UPDATE";
      
      public static const const_373:String = "WN_PARENT_ADDED";
      
      public static const const_651:String = "WN_RESIZE";
      
      public static const const_607:String = "WN_CHILD_REMOVED";
      
      public static const const_1404:String = "";
      
      public static const const_811:String = "WN_RESTORED";
      
      public static const const_284:String = "WN_SELECTED";
      
      public static const const_781:String = "WN_MINIMIZE";
      
      public static const const_795:String = "WN_FOCUSED";
      
      public static const const_1131:String = "WN_LOCK";
      
      public static const const_274:String = "WN_CHILD_ADDED";
      
      public static const const_939:String = "WN_UNFOCUSED";
      
      public static const const_432:String = "WN_RELOCATED";
      
      public static const const_875:String = "WN_DEACTIVATE";
      
      public static const const_1233:String = "WN_CRETAE";
      
      public static const const_883:String = "WN_RESTORE";
      
      public static const const_308:String = "WN_ACTVATED";
      
      public static const const_1316:String = "WN_LOCKED";
      
      public static const const_470:String = "WN_SELECT";
      
      public static const const_981:String = "WN_MAXIMIZE";
      
      public static const const_810:String = "WN_OPEN";
      
      public static const const_539:String = "WN_UNSELECT";
      
      public static const const_1524:String = "WN_ARRANGE";
      
      public static const const_1326:String = "WN_UNLOCKED";
      
      public static const const_1461:String = "WN_UPDATED";
      
      public static const const_888:String = "WN_ACTIVATE";
      
      public static const const_1231:String = "WN_UNLOCK";
      
      public static const const_792:String = "WN_MAXIMIZED";
      
      public static const const_770:String = "WN_DESTROYED";
      
      public static const const_890:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1515,cancelable);
      }
   }
}
