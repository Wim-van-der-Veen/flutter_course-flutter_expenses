# flutter_expenses

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
"# flutter_course-flutter_expenses" 
"# flutter_course-flutter_expenses" 

## Running everything

From Android Studio, kebab menu, use (virtual) device manager to setup the available Android devices

### Android setup, option 1

From Android Studio, kebab menu, use (virtual) device manager to start available Android devices
From VScode edit and run with 'run/run without debugging' (you might wanna select the emulator bottom-right in the statusbar)

### Android setup, option 2

From windows prompt, in platform-tools folder (C:\dev\appdata\local\android\sdk\platform-tools), test-run 'adb devices', run 'adb -a -P 5037 nodaemon server'
_port 5037 must be available from outside_
_try 'set ADB_TRACE=all'_
__check from windows prompt with 'netstat -ab | findstr /c:5037' (admin privileges required)__
__check from linux prompt with 'telnet 192.168.178.52 5037'; then, in platform-tools folder (/mnt/c/devlinux/android/platform-tools), run './adb devices'__

From linux prompt, in flutter folder (/mnt/c/devlinux/flutter/bin), run 'emulator -list-avds' or 'emulator -avd Pixel_5_API_Tiramisu'
Windows platform-tools version (adb-server) and linux platform-tools version (adb-client) must be in sync!
_linux: 'wget https://dl.google.com/android/repository/platform-tools_r29.0.5-linux.zip' for version 41, 'cd /mnt/c/devlinux/android', 'unzip /mnt/e/werk/breingolf/sources/platform-tools_r29.0.5-linux.zip'_
_windows: see https://developer.android.com/studio#downloads_
_both windows and linux: test-run 'adb version'_

### iOS setup

(both Mac or virtualMac)
From Android Studio, kebab menu, use (virtual) device manager to start available Android devices
From VScode edit and run with 'run/run without debugging' (you might wanna select the emulator bottom-right in the statusbar)

### virtual Mac

run Oracle VirtualBox, then start _macOS Big Sur_
OR from windows prompt, in VirtualBox folder (C:\Program Files\Oracle\VirtualBox) 'vboxmanage startvm "macOS Big Sur"'

### linux

From bash prompt 'ubuntu -c zsh'


To turn Hyper-V off completely, do this:
1. Shut down all programs. You will have to reboot your host.
2. Find the Command Prompt icon, right click it and choose Run As Administrator.
3. Enter this command:
     bcdedit /set hypervisorlaunchtype off
4. Enter this command:
     shutdown -s -t 2
5. When the computer turns off, unplug it for 20 seconds. Then plug it in again and boot up Windows 10.
