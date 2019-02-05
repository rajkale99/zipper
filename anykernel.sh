# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=RK_Kernel
do.devicecheck=0
do.modules=1
do.cleanup=1
do.cleanuponabort=1
device.name1=rimo02a
device.name2=Rimo02a
device.name3=srt
} # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot
is_slot_device=0;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel permissions
# set permissions for included ramdisk files
chmod -R 755 $ramdisk


## AnyKernel install
dump_boot;

# begin ramdisk changes
# end ramdisk changes

write_boot;

## end install

