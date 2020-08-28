use v6;
use lib 'lib';
use Win32::DrivesAndTypes;    

say "Drive Type";

for Win32_Drives() { 

	say $_ ~ "     " ~ Win32_DriveType($_) 
}