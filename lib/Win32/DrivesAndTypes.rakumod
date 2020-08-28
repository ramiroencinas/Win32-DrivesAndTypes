use v6;

unit module Win32::DrivesAndTypes;

sub Win32_Drives ( ) is export {

	die "Only supports Win32 kernel" unless $*KERNEL ~~ /win32/;

	use NativeCall;

	# https://docs.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-getlogicaldrives

	sub GetLogicalDrives() is native('Kernel32') returns uint32 { * };

	my $bitmask = GetLogicalDrives();

	my @drives;
		
	for 0..25 {

		@drives.push((ord("A")+$_).chr) if $bitmask +& 2**$_;
    }

    return @drives;
}

sub Win32_DriveType (Str $drive) is export {

	die "Only supports Win32 kernel" unless $*KERNEL ~~ /win32/;

	# https://docs.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-getdrivetypea
	use NativeCall;

	my $ret;

	sub GetDriveTypeA(Str) is native('Kernel32') returns uint { * };

	my $type = GetDriveTypeA($drive ~ ":\\");

	given $type {
    	when 0  { $ret = "DRIVE_UNKNOWN" }
    	when 1  { $ret = "DRIVE_NO_ROOT_DIR" }
    	when 2  { $ret = "DRIVE_REMOVABLE" }
    	when 3  { $ret = "DRIVE_FIXED" }
    	when 4  { $ret = "DRIVE_REMOTE" }
    	when 5  { $ret = "DRIVE_CDROM" }
    	when 6  { $ret = "DRIVE_RAMDISK" }
    	default { $ret = "ERROR" }
	}
}