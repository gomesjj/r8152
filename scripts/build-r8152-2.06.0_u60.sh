#!/bin/sh

rm -rf BLD/build/vmkdriver-r8152-2.06.0-CUR

# Use gcc version 4.4.3-2
# Below is the internal VMWare location.  Please change as required for your
# installed location.
CC=/build/toolchain/lin64/gcc-4.4.3-2/bin/x86_64-linux-gcc

# Use ld from binutils-2.22
# Below is the internal VMWare location.  Please change as required for your
# installed location.
LD=/build/toolchain/lin64/binutils-2.22/bin/x86_64-linux-ld

# PR# 976913 requested that OSS binaries be stripped of debug
LD_OPTS=--strip-debug

# Use GNU grep 2.5.1
GREP=grep
# Use GNU sed 4.5.1
SED=sed
# Use GNU xargs 4.2.27
XARGS=xargs
# Use mkdir from GNU coreutils 5.97
MKDIR=mkdir

# Create output directories
$GREP -v -e "SED" build-r8152-2.06.0_u60.sh \
| $GREP -o -e "-o [^ ]*\."            \
| $SED -e 's?-o \(.*\)/[^/]*\.?\1?'   \
| $GREP -v -e "\*"                    \
| $XARGS $MKDIR -p

$CC -fwrapv -fno-working-directory -g -ggdb3 -O2 -fno-strict-aliasing -mcld -mcmodel=smallhigh -Wall -Werror -Wstrict-prototypes -falign-functions=4 -falign-jumps=4 -falign-loops=4 -ffreestanding -fno-common -fomit-frame-pointer -fno-strength-reduce -march=x86-64 -minline-all-stringops -mno-red-zone -nostartfiles -nostdlib -mno-mmx -mno-3dnow -mno-sse -mno-sse2 --sysroot=/nowhere -Wno-array-bounds -Wno-error -Wdeclaration-after-statement -Wno-unused-value -Wno-pointer-sign -Wno-strict-prototypes -Wno-switch -Wno-declaration-after-statement -Wno-declaration-after-statement -DBUILT_BY_kwanma -DCONFIG_COMPAT -DCONFIG_PM -DCONFIG_PM_RUNTIME -DCONFIG_USB_SUSPEND -DCPU=x86-64 -DDEBUG_STUB -DESX3_NETWORKING_NOT_DONE_YET -DEXPORT_SYMTAB -DGPLED_CODE -DKBUILD_MODNAME=\"r8152\" -DLINUX_MODULE_AUX_HEAP_NAME=vmklnx_r8152 -DLINUX_MODULE_HEAP_INITIAL=1024*100 -DLINUX_MODULE_HEAP_MAX=1024*4096 -DLINUX_MODULE_HEAP_NAME=vmklnx_r8152 -DLINUX_MODULE_SKB_HEAP -DLINUX_MODULE_SKB_HEAP_INITIAL=512*1024 -DLINUX_MODULE_SKB_HEAP_MAX=22*1024*1024 -DLINUX_MODULE_VERSION=\"2.06.0-4\" -DMODULE -DNET_DRIVER -DNO_FLOATING_POINT -DUSB_DRIVER -DVMKERNEL_MODULE -DVMK_DEVKIT_HAS_API_VMKAPI_BASE -DVMK_DEVKIT_HAS_API_VMKAPI_DEVICE -DVMK_DEVKIT_HAS_API_VMKAPI_ISCSI -DVMK_DEVKIT_HAS_API_VMKAPI_NET -DVMK_DEVKIT_HAS_API_VMKAPI_RDMA -DVMK_DEVKIT_HAS_API_VMKAPI_SCSI -DVMK_DEVKIT_HAS_API_VMKAPI_SOCKETS -DVMK_DEVKIT_IS_DDK -DVMK_DEVKIT_USES_BINARY_COMPATIBLE_APIS -DVMK_DEVKIT_USES_PUBLIC_APIS -DVMNIX -DVMX86_RELEASE -DVMX86_SERVER -DVMX86_VPROBES -D_LINUX -D_VMKDRVEI -D__KERNEL__ -D__VMKERNEL_MODULE__ -D__VMKERNEL__ -D__VMKLNX__ -D__VMK_GCC_BUG_ALIGNMENT_PADDING__ -D__VMWARE__ -Ivmkdrivers/src_92/drivers/usb/net -IBLD/build/version -IBLD/build/HEADERS/vmkdrivers-vmkernel/vmkernel64/release -Ivmkdrivers/src_92/include -Ivmkdrivers/src_92/include/vmklinux_92 -IBLD/build/HEADERS/92-vmkdrivers-asm-x64/vmkernel64/release -Ivmkdrivers/src_92/drivers/net -IBLD/build/HEADERS/vmkapi-current-all-public-bincomp/generic/release -IBLD/build/HEADERS/92-vmkdrivers-namespace/vmkernel64/release/r8152-2.06.0 -include vmkdrivers/src_92/include/linux/autoconf.h -c -o BLD/build/vmkdriver-r8152-2.06.0-CUR/release/vmkernel64/SUBDIRS/vmkdrivers/src_92/drivers/usb/net/r8152-2.06.0/r8152.o vmkdrivers/src_92/drivers/usb/net/r8152-2.06.0/r8152.c

$CC -fwrapv -fno-working-directory -g -ggdb3 -O2 -fno-strict-aliasing -mcld -mcmodel=smallhigh -Wall -Werror -Wstrict-prototypes -falign-functions=4 -falign-jumps=4 -falign-loops=4 -ffreestanding -fno-common -fomit-frame-pointer -fno-strength-reduce -march=x86-64 -minline-all-stringops -mno-red-zone -nostartfiles -nostdlib -mno-mmx -mno-3dnow -mno-sse -mno-sse2 --sysroot=/nowhere -Wno-array-bounds -Wno-error -Wdeclaration-after-statement -Wno-unused-value -Wno-pointer-sign -Wno-strict-prototypes -Wno-switch -Wno-declaration-after-statement -Wno-declaration-after-statement -DBUILT_BY_kwanma -DCONFIG_COMPAT -DCONFIG_PM -DCONFIG_PM_RUNTIME -DCONFIG_USB_SUSPEND -DCPU=x86-64 -DDEBUG_STUB -DESX3_NETWORKING_NOT_DONE_YET -DEXPORT_SYMTAB -DGPLED_CODE -DKBUILD_MODNAME=\"r8152\" -DLINUX_MODULE_AUX_HEAP_NAME=vmklnx_r8152 -DLINUX_MODULE_HEAP_INITIAL=1024*100 -DLINUX_MODULE_HEAP_MAX=1024*4096 -DLINUX_MODULE_HEAP_NAME=vmklnx_r8152 -DLINUX_MODULE_SKB_HEAP -DLINUX_MODULE_SKB_HEAP_INITIAL=512*1024 -DLINUX_MODULE_SKB_HEAP_MAX=22*1024*1024 -DLINUX_MODULE_VERSION=\"2.06.0-4\" -DMODULE -DNET_DRIVER -DNO_FLOATING_POINT -DUSB_DRIVER -DVMKERNEL_MODULE -DVMK_DEVKIT_HAS_API_VMKAPI_BASE -DVMK_DEVKIT_HAS_API_VMKAPI_DEVICE -DVMK_DEVKIT_HAS_API_VMKAPI_ISCSI -DVMK_DEVKIT_HAS_API_VMKAPI_NET -DVMK_DEVKIT_HAS_API_VMKAPI_RDMA -DVMK_DEVKIT_HAS_API_VMKAPI_SCSI -DVMK_DEVKIT_HAS_API_VMKAPI_SOCKETS -DVMK_DEVKIT_IS_DDK -DVMK_DEVKIT_USES_BINARY_COMPATIBLE_APIS -DVMK_DEVKIT_USES_PUBLIC_APIS -DVMNIX -DVMX86_RELEASE -DVMX86_SERVER -DVMX86_VPROBES -D_LINUX -D_VMKDRVEI -D__KERNEL__ -D__VMKERNEL_MODULE__ -D__VMKERNEL__ -D__VMKLNX__ -D__VMK_GCC_BUG_ALIGNMENT_PADDING__ -D__VMWARE__ -Ivmkdrivers/src_92/drivers/usb/net -IBLD/build/version -IBLD/build/HEADERS/vmkdrivers-vmkernel/vmkernel64/release -Ivmkdrivers/src_92/include -Ivmkdrivers/src_92/include/vmklinux_92 -IBLD/build/HEADERS/92-vmkdrivers-asm-x64/vmkernel64/release -Ivmkdrivers/src_92/drivers/net -IBLD/build/HEADERS/vmkapi-current-all-public-bincomp/generic/release -IBLD/build/HEADERS/92-vmkdrivers-namespace/vmkernel64/release/r8152-2.06.0 -include vmkdrivers/src_92/include/linux/autoconf.h -c -o BLD/build/vmkdriver-r8152-2.06.0-CUR/release/vmkernel64/SUBDIRS/vmkdrivers/src_92/common/vmklinux_module.o vmkdrivers/src_92/common/vmklinux_module.c

$LD $LD_OPTS -r -o BLD/build/vmkdriver-r8152-2.06.0-CUR/release/vmkernel64/r8152 --whole-archive BLD/build/vmkdriver-r8152-2.06.0-CUR/release/vmkernel64/SUBDIRS/vmkdrivers/src_92/drivers/usb/net/r8152-2.06.0/r8152.o BLD/build/vmkdriver-r8152-2.06.0-CUR/release/vmkernel64/SUBDIRS/vmkdrivers/src_92/common/vmklinux_module.o
