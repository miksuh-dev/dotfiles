#!/bin/bash

if pactl list modules | grep -qF "module-null-sink"; then
  pactl unload-module module-null-sink
fi

if pactl list modules | grep -qF "module-loopback"; then
  pactl unload-module module-loopback
fi

if pactl list modules | grep -qF "module-remap-source"; then
  pactl unload-module module-remap-source
fi


pactl load-module module-null-sink sink_name="obs" sink_properties=device.description="obs"
pactl load-module module-loopback source=obs.monitor sink=alsa_output.usb-FiiO_DigiHug_USB_Audio-01.analog-stereo rate=44100

pactl load-module module-remap-source master="obs.monitor" source_name="obs-VirtualMic" source_properties=device.description=obs_VirtualMic
