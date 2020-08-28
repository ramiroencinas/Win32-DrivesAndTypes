use v6;
use lib 'lib';
use Test;

plan 3;

use Win32::DrivesAndTypes;
ok 1, "use Win32::DrivesAndTypes worked!";
use-ok 'Win32::DrivesAndTypes';

ok ( $*KERNEL ~~ /win32/ ), "Kernel is win32";