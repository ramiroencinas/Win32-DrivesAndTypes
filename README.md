Raku module - Provides a list of Win32 drives and drive types.

## OS Supported: ##
Only Win32 by Native calls.

## Installing the module ##

    zef update
    zef install Win32::DrivesAndTypes

## Example Usage: ##

```raku 
use v6;
use Win32::DrivesAndTypes;    

say "Drive Type";

for Win32_Drives() { 

	say $_ ~ "     " ~ Win32_DriveType($_) 
```

## Win32_Drives() function ##

Returns a @list of Strings with detected drives (A..Z).

## Win32_DriveType(Str) function ##

Accepts one string parameter with a letter drive (A..Z) and returns a Str with the drive type that can be:

* DRIVE_UNKNOWN: The type cannot be determined.
* DRIVE_NO_ROOT_DIR: Invalid drive.
* DRIVE_REMOVABLE: USB sticks, external HD, etc.
* DRIVE_FIXED: HardDisk.
* DRIVE_REMOTE: Remote network drive like a shared folder.
* DRIVE_CDROM: CD-ROM drive.
* DRIVE_RAMDISK: RAM disk.
* or ERROR.
