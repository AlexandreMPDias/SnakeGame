local function wifi_connected_callback(iptable)
  print("wifi_connected_callback")
  print("ip: " .. iptable.IP)
  dofile("controller.lua")
end

wificonf = {
  ssid = "HG2_Unifi",
  pwd = "123hangar456@",
  got_ip_cb = wifi_connected_callback,
  save = false,
}

wifi.setmode(wifi.STATION)
wifi.sta.config(wificonf)
