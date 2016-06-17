type call_state =
  | Call_state_idle [@js 0]
  | Call_state_ringing [@js 1]
  | Call_state_offhook [@js 2]
  [@@js.enum]

type data_activity =
  | Data_activity_none [@js 0]
  | Data_activity_in [@js 1]
  | Data_activity_out [@js 2]
  | Data_activity_inout [@js 3]
  | Data_activity_dormant [@js 4]
  [@@js.enum]

type network_type =
  | Network_type_unknown [@js 0]
  | Network_type_gprs [@js 1]
  | Network_type_edge [@js 2]
  | Network_type_umts [@js 3]
  | Network_type_cdma [@js 4]
  | Network_type_evdo_0 [@js 5]
  | Network_type_evdo_a [@js 6]
  | Network_type_1Xrtt [@js 7]
  | Network_type_hsdpa [@js 8]
  | Network_type_hsupa [@js 9]
  | Network_type_hspa [@js 10]
  | Network_type_iden [@js 11]
  | Network_type_evdo_b [@js 12]
  | Network_type_lte [@js 13]
  | Network_type_ehrpd [@js 14]
  | Network_type_hspap [@js 15]
  [@@js.enum]

type phone_type =
  | Phone_type_none [@js 0]
  | Phone_type_gsm [@js 1]
  | Phone_type_cdma [@js 2]
  | Phone_type_sip [@js 3]
  [@@js.enum]

type sim_state =
  | Sim_state_unknown [@js 0]
  | Sim_state_absent [@js 1]
  | Sim_state_pin_required [@js 2]
  | Sim_state_puk_required [@js 3]
  | Sim_state_network_locked [@js 4]
  | Sim_state_ready [@js 5]
  [@@js.enum]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type result = private Ojs.t
(* ------------------------------------------ *)
(* General *)
val carrier_name : result -> string
val country_code : result -> string
val mcc : result -> string
val mnc : result -> string
(* ------------------------------------------ *)

(* ------------------------------------------ *)
(* Android *)
val phone_number : result -> string
val device_id : result -> string
val device_software_version : result -> string
val sim_serial_number : result -> string
val subscriber_id : result -> string
val call_state : result -> call_state
val data_activity : result -> data_activity
val network_type : result -> network_type
val phone_type : result -> phone_type
val sim_state : result -> sim_state
val is_network_roaming : result -> bool
(* ------------------------------------------ *)

(* ------------------------------------------ *)
(* iOS *)
val allows_VOIP : result -> bool
(* ------------------------------------------ *)

(* ------------------------------------------ *)
(* Windows Phone *)
val is_cellular_data_enabled : result -> bool
val is_cellular_data_roaming_enabled : result -> bool
(* IsNetworkAvailable or isNetworkAvailable ? *)
val is_network_available : result -> bool
val is_wifi_enabled : result -> bool
(* ------------------------------------------ *)
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val info : (result -> unit) -> (string -> unit) -> unit
[@@js.global "window.plugins.sim.getSimInfo"]
val has_read_permission : (bool -> unit) -> (string -> unit) -> unit
[@@js.global "window.plugins.sim.hasReadPermission"]
val request_read_permission : unit -> unit
[@@js.global "window.plugins.sim.requestReadPermission"]
(* -------------------------------------------------------------------------- *)
