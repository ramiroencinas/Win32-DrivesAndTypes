use v6;
use lib 'lib';
use Test;

plan 2;

use Win32::DrivesAndTypes;

my @drives = Win32_Drives();
ok ( @drives.elems > 0 ), "Almost 1 drive detected";

my $type = Win32_DriveType(@drives[0]);
ok ( $type ~~ /DRIVE/ ), "Almost 1 type drive detected";
