package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_548;
         param1["bitmap"] = const_522;
         param1["border"] = const_503;
         param1["border_notify"] = const_1238;
         param1["button"] = const_399;
         param1["button_thick"] = const_614;
         param1["button_icon"] = const_1142;
         param1["button_group_left"] = const_613;
         param1["button_group_center"] = const_715;
         param1["button_group_right"] = const_568;
         param1["canvas"] = const_723;
         param1["checkbox"] = const_592;
         param1["closebutton"] = const_789;
         param1["container"] = const_279;
         param1["container_button"] = const_589;
         param1["display_object_wrapper"] = const_653;
         param1["dropmenu"] = const_436;
         param1["dropmenu_item"] = const_425;
         param1["frame"] = const_292;
         param1["frame_notify"] = const_1157;
         param1["header"] = const_556;
         param1["icon"] = const_886;
         param1["itemgrid"] = const_934;
         param1["itemgrid_horizontal"] = const_416;
         param1["itemgrid_vertical"] = const_545;
         param1["itemlist"] = const_946;
         param1["itemlist_horizontal"] = const_287;
         param1["itemlist_vertical"] = const_280;
         param1["maximizebox"] = const_1154;
         param1["menu"] = const_1170;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_800;
         param1["minimizebox"] = const_1184;
         param1["notify"] = const_1102;
         param1["null"] = const_380;
         param1["password"] = const_638;
         param1["radiobutton"] = const_575;
         param1["region"] = const_378;
         param1["restorebox"] = const_1161;
         param1["scaler"] = const_835;
         param1["scaler_horizontal"] = const_1198;
         param1["scaler_vertical"] = const_1113;
         param1["scrollbar_horizontal"] = const_428;
         param1["scrollbar_vertical"] = const_710;
         param1["scrollbar_slider_button_up"] = const_827;
         param1["scrollbar_slider_button_down"] = const_969;
         param1["scrollbar_slider_button_left"] = const_777;
         param1["scrollbar_slider_button_right"] = const_923;
         param1["scrollbar_slider_bar_horizontal"] = const_988;
         param1["scrollbar_slider_bar_vertical"] = const_899;
         param1["scrollbar_slider_track_horizontal"] = const_780;
         param1["scrollbar_slider_track_vertical"] = const_849;
         param1["scrollable_itemlist"] = const_1255;
         param1["scrollable_itemlist_vertical"] = const_385;
         param1["scrollable_itemlist_horizontal"] = const_794;
         param1["selector"] = const_660;
         param1["selector_list"] = const_609;
         param1["submenu"] = const_800;
         param1["tab_button"] = const_632;
         param1["tab_container_button"] = const_786;
         param1["tab_context"] = const_351;
         param1["tab_content"] = const_922;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_600;
         param1["input"] = const_684;
         param1["toolbar"] = const_1294;
         param1["tooltip"] = WINDOW_TYPE_TOOLTIP;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
