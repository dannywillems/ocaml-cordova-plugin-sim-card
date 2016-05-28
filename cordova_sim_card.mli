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
class result : Ojs.t ->
  object
    inherit Ojs.obj

    (* ------------------------------------------ *)
    (* General *)
    method carrier_name : string
    method country_code : string
    method mcc : string
    method mnc : string
    (* ------------------------------------------ *)

    (* ------------------------------------------ *)
    (* Android *)
    method phone_number : string
    method device_id : string
    method device_software_version : string
    method sim_serial_number : string
    method subscriber_id : string
    method call_state : call_state
    method data_activity : data_activity
    method network_type : network_type
    method phone_type : phone_type
    method sim_state : sim_state
    method is_network_roaming : bool
    (* ------------------------------------------ *)

    (* ------------------------------------------ *)
    (* iOS *)
    method allows_VOIP : bool
    (* ------------------------------------------ *)

    (* ------------------------------------------ *)
    (* Windows Phone *)
    method is_cellular_data_enabled : bool
    method is_cellular_data_roaming_enabled : bool
    (* IsNetworkAvailable or isNetworkAvailable ? *)
    method is_network_available : bool
    method is_wifi_enabled : bool
    (* ------------------------------------------ *)
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class sim_card : Ojs.t ->
  object
    inherit Ojs.obj

    method info : (result -> unit) -> (string -> unit) -> unit
    [@@js.call "getSimInfo"]
    method has_read_permission : (bool -> unit) -> (string -> unit) -> unit
    method request_read_permission : unit -> unit
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val t : unit -> sim_card
[@@js.get "window.plugins.sim"]
(* -------------------------------------------------------------------------- *)
