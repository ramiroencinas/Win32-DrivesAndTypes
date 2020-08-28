Raku module - Provides a list of Win32 drives and drive types.

## OS Supported: ##
* Win32 by Native calls

## Installing the module ##

    zef update
    zef install Win32::DrivesAndTypes

## Win32_Drives() ##

    Returns a @list of Strings with the drives detected (A..Z).

## Win32_DriveType(Str) ##

    Accepts one string parameter with a letter drive (A..Z).
    Returns a Str with the drive type that can be:

* DRIVE_UNKNOWN: The type cannot be determined.
* DRIVE_NO_ROOT_DIR: Invalid drive.
* DRIVE_REMOVABLE: USB sticks, external HD, etc.
* DRIVE_FIXED: HardDisk.
* DRIVE_REMOTE: Remote network drive like a shared folder.
* DRIVE_CDROM: CD-ROM drive.
* DRIVE_RAMDISK: RAM disk.

## Example Usage: ##

```raku 
use v6;
use lib 'lib';
use Win32::DrivesAndTypes;    

say "Drive Type";

for Win32_Drives() { 

	say $_ ~ "     " ~ Win32_DriveType($_) 
```



