package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_98;
         param1["bound_to_parent_rect"] = const_77;
         param1["child_window"] = const_856;
         param1["embedded_controller"] = const_307;
         param1["resize_to_accommodate_children"] = const_58;
         param1["input_event_processor"] = const_46;
         param1["internal_event_handling"] = const_617;
         param1["mouse_dragging_target"] = const_212;
         param1["mouse_dragging_trigger"] = const_315;
         param1["mouse_scaling_target"] = const_255;
         param1["mouse_scaling_trigger"] = const_458;
         param1["horizontal_mouse_scaling_trigger"] = const_185;
         param1["vertical_mouse_scaling_trigger"] = const_218;
         param1["observe_parent_input_events"] = const_844;
         param1["optimize_region_to_layout_size"] = const_417;
         param1["parent_window"] = const_982;
         param1["relative_horizontal_scale_center"] = const_154;
         param1["relative_horizontal_scale_fixed"] = const_117;
         param1["relative_horizontal_scale_move"] = const_313;
         param1["relative_horizontal_scale_strech"] = const_238;
         param1["relative_scale_center"] = const_952;
         param1["relative_scale_fixed"] = const_569;
         param1["relative_scale_move"] = const_806;
         param1["relative_scale_strech"] = const_831;
         param1["relative_vertical_scale_center"] = const_158;
         param1["relative_vertical_scale_fixed"] = const_103;
         param1["relative_vertical_scale_move"] = const_290;
         param1["relative_vertical_scale_strech"] = const_264;
         param1["on_resize_align_left"] = const_700;
         param1["on_resize_align_right"] = const_439;
         param1["on_resize_align_center"] = const_443;
         param1["on_resize_align_top"] = const_497;
         param1["on_resize_align_bottom"] = const_451;
         param1["on_resize_align_middle"] = const_414;
         param1["on_accommodate_align_left"] = const_866;
         param1["on_accommodate_align_right"] = const_372;
         param1["on_accommodate_align_center"] = const_540;
         param1["on_accommodate_align_top"] = const_909;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_546;
         param1["route_input_events_to_parent"] = const_398;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_828;
         param1["scalable_with_mouse"] = const_941;
         param1["reflect_horizontal_resize_to_parent"] = const_442;
         param1["reflect_vertical_resize_to_parent"] = const_435;
         param1["reflect_resize_to_parent"] = const_252;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
