```bash
#!/bin/bash

# Get computer serial number from BIOS
serial_number=$(dmidecode -s system-serial-number 2>/dev/null)

# Get IP address and MAC address of the Ethernet adapter
eth_adapter_info=$(ip addr show eno1 2>/dev/null)
ip_address=$(echo "$eth_adapter_info" | awk '/inet / {print $2}')
mac_address=$(echo "$eth_adapter_info" | awk '/link\/ether/ {print $2}')

# Get screen resolution if available
if [ -n "$DISPLAY" ]; then
    screen_resolution=$(xrandr | awk '/\*/ {print $1}')
else
    screen_resolution="Not available (no display)"
fi

# Check if aplay can play the sound file
aplay /home/lubuntu/readycade/1kHz.wav

# Check if headphone jacks are in use (assuming default sound cards)
front_headphone_status=$(aplay -L | grep -q 'front.*[plugged]' && echo "Headphones plugged into front jack" || echo "No headphones in front jack")
back_headphone_status=$(aplay -L | grep -q 'rear.*[plugged]' && echo "Headphones plugged into rear jack" || echo "No headphones in rear jack")

external_ip=$(curl -s ifconfig.me)

if [ -n "$external_ip" ]; then
    echo "External IP Address: $external_ip"

    # Get geolocation information using ipinfo.io
    geolocation=$(curl -s "https://ipinfo.io/$external_ip/json")

    if [ -n "$geolocation" ]; then
        echo "Geolocation Information:"
        echo "$geolocation"
    else
        echo "Unable to retrieve geolocation information"
    fi
else
    echo "Unable to retrieve external IP address"
fi

# Get the status of the Sata Drive 1
sata_drive_1_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/SATA Drive 1/current_value" 2>/dev/null)

# Get the status of the M.2 NVMe
m2_nvme_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/M.2 NVMe/current_value" 2>/dev/null)

# Get the status of the M.2 SATA
m2_sata_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/M.2 SATA/current_value" 2>/dev/null)

# Get the status of Core Multi-Processing
core_multi_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Core Multi-Processing/current_value" 2>/dev/null)

# Get the status of Intel Hyper-Threading Technology
intel_hyperthreading_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Intel(R) Hyper-Threading Technology/current_value" 2>/dev/null)

# Get the status of Turbo Mode
turbo_mode_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Turbo Mode/current_value" 2>/dev/null)

# Get the status of the internal speaker
secure_boot_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Secure Boot/current_value" 2>/dev/null)

# Get the status of the internal speaker
internal_speaker_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Internal Speaker/current_value" 2>/dev/null)

# Get the status of the Front USBs
front_usb_ports_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Front USB Ports/current_value" 2>/dev/null)

# Get the status of the Rear USBs
rear_usb_ports_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Rear USB Ports/current_value" 2>/dev/null)

# Get the status of USB Port 1
usb_port_1_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/USB Port 1/current_value" 2>/dev/null)

# Get the status of USB Port 2
usb_port_2_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/USB Port 2/current_value" 2>/dev/null)

# Get the status of USB Port 1
usb_port_3_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/USB Port 3/current_value" 2>/dev/null)

# Get the status of USB Port 1
usb_port_4_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/USB Port 4/current_value" 2>/dev/null)

# Get the status of USB Port 1
usb_port_5_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/USB Port 5/current_value" 2>/dev/null)

# Get the status of USB Port 1
usb_port_6_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/USB Port 6/current_value" 2>/dev/null)

# Get the status of OnBoard Ethernet Controller
onboard_ethernet_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Onboard Ethernet Controller/current_value" 2>/dev/null)

# Get the status of OnBoard Audio Controller
onboard_audio_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Onboard Audio Controller/current_value" 2>/dev/null)

# Get the status of Chassis Intrusion Detection
intrusion_detection_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Chassis Intrusion Detection/current_value" 2>/dev/null)

# Get the status of Dust Shield Alert
dust_shield_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Dust Shield Alert/current_value" 2>/dev/null)

# Get the status Boot Mode
boot_mode_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Boot Mode/current_value" 2>/dev/null)

# Get the status Boot Agent
boot_agent_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Boot Agent/current_value" 2>/dev/null)

# Get the status Boot Priority
boot_priority_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Boot Priority/current_value" 2>/dev/null)

# Get the status Configuration Change Detection
config_change_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Configuration Change Detection/current_value" 2>/dev/null)

# Get the status Console Type
console_type_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Console Type/current_value" 2>/dev/null)

# Get the status Enhanced Power Saving Mode
enhanced_power_saving_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Enhanced Power Saving Mode/current_value" 2>/dev/null)

# Get the status of CSM (EFI BOOT/LEGACY BOOT)
csm_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/CSM/current_value" 2>/dev/null)

# Get the status of ICE Performance Mode (CPU Fan)
cpu_fan_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/ICE Performance Mode/current_value" 2>/dev/null)

# Get the status of ICE Thermal Alert (CPU Fan)
cpu_fan_alert_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/ICE Thermal Alert/current_value" 2>/dev/null)

# Get the status of Intel(R) Virtualization Technology
intel_virtual_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Intel(R) Virtualization Technology/current_value" 2>/dev/null)

# Get the status of Keyboardless Operation
keyboardless_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Keyboardless Operation/current_value" 2>/dev/null)

# Get the status of Password Count Exceeded Error
password_count_exceeded_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Password Count Exceeded Error/current_value" 2>/dev/null)

# Get the status of Require Admin Pass for F12 Boot
admin_pass_f12_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Require Admin. Pass. For F12 Boot/current_value" 2>/dev/null)

# Get the status of Require Admin Pass when Flashing
admin_pass_when_flash_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Require Admin. Pass. when Flashing/current_value" 2>/dev/null)

# Get the status of Startup Sequence
startup_sequence_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Startup Sequence/current_value" 2>/dev/null)

# Get the status of Startup Device Menu Prompt
startup_device_menu_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Startup Device Menu Prompt/current_value" 2>/dev/null)

# Get the status of Smart Power On
smart_power_on_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Smart Power On/current_value" 2>/dev/null)

# Get the status of Smart USB Protection
smart_usb_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Smart USB Protection/current_value" 2>/dev/null)

# Get the status of USB Enumeration Delay
usb_enumeration_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/USB Enumeration Delay/current_value" 2>/dev/null)

# Get the status of USB Legacy Support
usb_legacy_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/USB Legacy Support/current_value" 2>/dev/null)

# Get the status of USB Legacy Support
usb_virtual_kbc_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/USB Virtual KBC Support/current_value" 2>/dev/null)

# Get the status of Wake from PCI Device
wake_pci_device_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Wake from PCI Device/current_value" 2>/dev/null)

# Get the status of Wake from PCI Modem
wake_pci_modem_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Wake from PCI Modem/current_value" 2>/dev/null)

# Get the status of Wake from PCI Serial Port Ring
wake_serial_ring_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Wake from Serial Port Ring/current_value" 2>/dev/null)

# Get the status of Wake on LAN
wake_on_lan_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Wake on LAN/current_value" 2>/dev/null)

# Get the status of Wake Up on Alarm
wake_on_alarm_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Wake Up on Alarm/current_value" 2>/dev/null)

# Get the status of Windows UEFI Firmware Update
windows_uefi_status=$(cat "/sys/class/firmware-attributes/thinklmi/attributes/Windows UEFI Firmware Update/current_value" 2>/dev/null)

# Print gathered information
echo "Readycade Serial Number: $serial_number"
echo "IP Address of Ethernet Adapter: $ip_address"
echo "MAC Address of Ethernet Adapter: $mac_address"
echo "Screen Resolution: $screen_resolution"
echo "Front Headphone Jack In Use: $front_headphone"
echo "Back Headphone Jack In Use: $back_headphone"
echo "Sata Drive 1: $sata_drive_1_status"
echo "M.2 NVMe: $m2_nvme_status"
echo "M.2 SATA: $m2_sata_status"
echo "Multi Core: $core_multi_status"
echo "Intel Hypertheading: $intel_hyperthreading_status"
echo "Turbo Mode: $turbo_mode_status"
echo "Secure Boot: $secure_boot_status"
echo "Boot Agent: $boot_agent_status"
echo "Boot Priority: $boot_priority_status"
echo "Configuration Change Detection: $config_change_status"
echo "Console Type: $console_type_status"
echo "Enhanced Power Saving: $enhanced_power_saving_status"
echo "Internal Speaker: $internal_speaker_status"
echo "Front USB Ports: $front_usb_ports_status"
echo "Rear USB Ports: $rear_usb_ports_status"
echo "USB Port 1: $usb_port_1_status"
echo "USB Port 2: $usb_port_2_status"
echo "USB Port 3: $usb_port_3_status"
echo "USB Port 4: $usb_port_4_status"
echo "USB Port 5: $usb_port_5_status"
echo "USB Port 6: $usb_port_6_status"
echo "OnBoard Ethernet: $onboard_ethernet_status"
echo "OnBoard Audio: $onboard_audio_status"
echo "Intrusion Detection: $intrusion_detection_status"
echo "Dust Shield: $dust_shield_status"
echo "Boot Mode: $boot_mode_status"
echo "CSM EFI/Legacy Boot: $csm_status"
echo "ICE Performance Mode (CPU Fan): $cpu_fan_status"
echo "ICE Thermal Alert (CPU Fan): $cpu_fan_alert_status"
echo "Intel(R) Virtual Technology: $intel_virtual_status"
echo "Keyboardless Operation: $keyboardless_status"
echo "Password Count Exceeded: $password_count_exceeded_status"
echo "Require Admin Pass for F12 Boot: $admin_pass_f12_status"
echo "Require Admin Pass when Flashing: $admin_pass_when_flash_status"
echo "Startup Sequence: $startup_sequence_status"
echo "Startup Device Menu Prompt: $startup_device_menu_status"
echo "Smart Power On: $smart_power_on_status"
echo "USB Enumeration Delay: $usb_enumeration_status"
echo "USB Legacy Support: $usb_legacy_status"
echo "USB Virual Keyboard: $usb_virtual_kbc_status"
echo "Wake from PCI Device: $wake_pci_device_status"
echo "Wake from PCI Modem: $wake_pci_modem_status"
echo "Wake from PCI Serial Port Ring: $wake_serial_ring_status"
echo "Wake on LAN: $wake_on_lan_status"
echo "Wake Up on Alarm: $wake_on_alarm_status"
echo "Windows UEFI: $windows_uefi_status"
```
