#!/bin/sh

#rm -rf BLD/build/vmkdriver-r8152-2.11.0-CUR

# Use gcc version 4.8.4
# Below is the internal VMWare location.  Please change as required for your
# installed location.
CC=/build/toolchain/lin64/gcc-4.8.4/bin/x86_64-linux-gcc

# Use ld from binutils-2.22
# Below is the internal VMWare location.  Please change as required for your
# installed location.
LD=/build/toolchain/lin64/binutils-2.22/bin/x86_64-linux-ld

# PR# 976913 requested that OSS binaries be stripped of debug
LD_OPTS=--strip-debug

SYS_ROOT=/nowhere

I_SYSTEM=/usr/lib/gcc/x86_64-redhat-linux/4.8.5/include

# Use GNU grep 2.5.1
GREP=grep
# Use GNU sed 4.5.1
SED=sed
# Use GNU xargs 4.2.27
XARGS=xargs
# Use mkdir from GNU coreutils 5.97
MKDIR=mkdir

# Create output directories
$GREP -v -e "SED" build-r8152-2.11.0_u65.sh \
| $GREP -o -e "-o [^ ]*\."            \
| $SED -e 's?-o \(.*\)/[^/]*\.?\1?'   \
| $GREP -v -e "\*"                    \
| $XARGS $MKDIR -p

$CC --sysroot=$SYS_ROOT -fwrapv -pipe -fno-strict-aliasing -mcld -Wno-unused-but-set-variable -fno-working-directory -g -ggdb3 -O2 -mcmodel=smallhigh -Wall -Werror -Wstrict-prototypes -freg-struct-return -falign-jumps=1 -falign-functions=4 -falign-loops=1 -m64 -mno-red-zone -mpreferred-stack-boundary=4 -minline-all-stringops -mno-mmx -mno-3dnow -mno-sse -mno-sse2 -mcld -finline-limit=2000 -fno-common -ffreestanding -nostdinc -fomit-frame-pointer -nostdlib -Wdeclaration-after-statement -Wno-pointer-sign -Wno-strict-prototypes -Wno-enum-compare -Wno-switch -Wno-declaration-after-statement -Wno-declaration-after-statement -Wno-declaration-after-statement -DCONFIG_COMPAT -DCONFIG_PM -DCONFIG_PM_RUNTIME -DCONFIG_USB_SUSPEND -DCPU=x86-64 -DEXPORT_SYMTAB -DGPLED_CODE -DKBUILD_MODNAME=\"r8152\" -DLINUX_MODULE_AUX_HEAP_NAME=vmklnx_r8152 -DLINUX_MODULE_HEAP_INITIAL=256*1024 -DLINUX_MODULE_HEAP_MAX=4*1024*1024 -DLINUX_MODULE_HEAP_NAME=vmklnx_r8152 -DLINUX_MODULE_SKB_HEAP -DLINUX_MODULE_SKB_HEAP_INITIAL=512*1024 -DLINUX_MODULE_SKB_HEAP_MAX=22*1024*1024 -DLINUX_MODULE_VERSION=\"2.11.0-1\" -DMODULE -DNO_FLOATING_POINT -DVMKERNEL -DVMKERNEL_MODULE -DVMKLNX_ALLOW_DEPRECATED -DVMK_DEVKIT_HAS_API_VMKAPI_BASE -DVMK_DEVKIT_HAS_API_VMKAPI_DEVICE -DVMK_DEVKIT_HAS_API_VMKAPI_ISCSI -DVMK_DEVKIT_HAS_API_VMKAPI_NET -DVMK_DEVKIT_HAS_API_VMKAPI_RDMA -DVMK_DEVKIT_HAS_API_VMKAPI_SCSI -DVMK_DEVKIT_HAS_API_VMKAPI_SOCKETS -DVMK_DEVKIT_IS_DDK -DVMK_DEVKIT_USES_BINARY_COMPATIBLE_APIS -DVMK_DEVKIT_USES_PUBLIC_APIS -DVMNIX -DVMX86_RELEASE -DVMX86_SERVER -D_LINUX -D_VMKDRVEI -D__KERNEL__ -D__VMKERNEL_MODULE__ -D__VMKERNEL__ -D__VMKLNX__ -D__VMK_GCC_BUG_ALIGNMENT_PADDING__ -D__VMWARE__ -isystem $I_SYSTEM -Ivmkdrivers/src_92/drivers/usb/net -IBLD/build/HEADERS/vmkdrivers-vmkernel/vmkernel64/release -IBLD/build/version -Ivmkdrivers/src_92/include -Ivmkdrivers/src_92/include/vmklinux_92 -IBLD/build/HEADERS/92-vmkdrivers-asm-x64/vmkernel64/obj -IBLD/build/HEADERS/vmkapi-v2_3_0_0-all-public-bincomp/generic/obj -IBLD/build/HEADERS/92-vmkdrivers-namespace/vmkernel64/obj/r8152-2.11.0 -include vmkdrivers/src_92/include/linux/autoconf.h -c -o BLD/build/vmkdriver-r8152-2.11.0-CUR/release/vmkernel64/SUBDIRS/vmkdrivers/src_92/common/vmklinux_module.o vmkdrivers/src_92/common/vmklinux_module.c

$CC --sysroot=$SYS_ROOT -fwrapv -pipe -fno-strict-aliasing -mcld -Wno-unused-but-set-variable -fno-working-directory -g -ggdb3 -O2 -mcmodel=smallhigh -Wall -Werror -Wstrict-prototypes -freg-struct-return -falign-jumps=1 -falign-functions=4 -falign-loops=1 -m64 -mno-red-zone -mpreferred-stack-boundary=4 -minline-all-stringops -mno-mmx -mno-3dnow -mno-sse -mno-sse2 -mcld -finline-limit=2000 -fno-common -ffreestanding -nostdinc -fomit-frame-pointer -nostdlib -Wdeclaration-after-statement -Wno-pointer-sign -Wno-strict-prototypes -Wno-enum-compare -Wno-switch -Wno-declaration-after-statement -Wno-declaration-after-statement -Wno-declaration-after-statement -DCONFIG_COMPAT -DCONFIG_PM -DCONFIG_PM_RUNTIME -DCONFIG_USB_SUSPEND -DCPU=x86-64 -DEXPORT_SYMTAB -DGPLED_CODE -DKBUILD_MODNAME=\"r8152\" -DLINUX_MODULE_AUX_HEAP_NAME=vmklnx_r8152 -DLINUX_MODULE_HEAP_INITIAL=256*1024 -DLINUX_MODULE_HEAP_MAX=4*1024*1024 -DLINUX_MODULE_HEAP_NAME=vmklnx_r8152 -DLINUX_MODULE_SKB_HEAP -DLINUX_MODULE_SKB_HEAP_INITIAL=512*1024 -DLINUX_MODULE_SKB_HEAP_MAX=22*1024*1024 -DLINUX_MODULE_VERSION=\"2.11.0-1\" -DMODULE -DNO_FLOATING_POINT -DUSB_DRIVER -DVMKERNEL -DVMKERNEL_MODULE -DVMK_DEVKIT_HAS_API_VMKAPI_BASE -DVMK_DEVKIT_HAS_API_VMKAPI_DEVICE -DVMK_DEVKIT_HAS_API_VMKAPI_ISCSI -DVMK_DEVKIT_HAS_API_VMKAPI_NET -DVMK_DEVKIT_HAS_API_VMKAPI_RDMA -DVMK_DEVKIT_HAS_API_VMKAPI_SCSI -DVMK_DEVKIT_HAS_API_VMKAPI_SOCKETS -DVMK_DEVKIT_IS_DDK -DVMK_DEVKIT_USES_BINARY_COMPATIBLE_APIS -DVMK_DEVKIT_USES_PUBLIC_APIS -DVMNIX -DVMX86_RELEASE -DVMX86_SERVER -D_LINUX -D_VMKDRVEI -D__KERNEL__ -D__VMKERNEL_MODULE__ -D__VMKERNEL__ -D__VMKLNX__ -D__VMK_GCC_BUG_ALIGNMENT_PADDING__ -D__VMWARE__ -isystem $I_SYSTEM -Ivmkdrivers/src_92/drivers/usb/net -Ivmkdrivers/src_92/drivers/usb/host/xhci/compat -IBLD/build/HEADERS/vmkdrivers-vmkernel/vmkernel64/release -IBLD/build/version -Ivmkdrivers/src_92/include -Ivmkdrivers/src_92/include/vmklinux_92 -IBLD/build/HEADERS/92-vmkdrivers-asm-x64/vmkernel64/obj -IBLD/build/HEADERS/vmkapi-v2_3_0_0-all-public-bincomp/generic/obj -Ivmkdrivers/src_92/drivers/usb/core -IBLD/build/HEADERS/92-vmkdrivers-namespace/vmkernel64/obj/r8152-2.11.0 -include vmkdrivers/src_92/include/linux/autoconf.h -c -o BLD/build/vmkdriver-r8152-2.11.0-CUR/release/vmkernel64/SUBDIRS/vmkdrivers/src_92/drivers/usb/net/r8152-2.11.0/r8152.o vmkdrivers/src_92/drivers/usb/net/r8152-2.11.0/r8152.c

$LD $LD_OPTS -r -o BLD/build/vmkdriver-r8152-2.11.0-CUR/release/vmkernel64/r8152 --whole-archive BLD/build/vmkdriver-r8152-2.11.0-CUR/release/vmkernel64/SUBDIRS/vmkdrivers/src_92/drivers/usb/net/r8152-2.11.0/r8152.o BLD/build/vmkdriver-r8152-2.11.0-CUR/release/vmkernel64/SUBDIRS/vmkdrivers/src_92/common/vmklinux_module.o
