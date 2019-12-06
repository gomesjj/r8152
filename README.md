# USB NIC Driver for ESXi 5.1/5.5/6.0/6.5/6.7 (Realtek)   

Realtek r8152 driver for ESXi

<div class="notice--warning" markdown="1">
**Update (12/02/19)**  
<li>Modules compiled for ESXi 6.5 will work on ESXi 6.7 without modification</li>
<li>Source code updated to version 2.11.0 (latest)</li>
<li>Version 2.11.0 adds support for the upcoming 2.5G USB C Ethernet adapters (RTL8156)</li>
<li>Build script for ESXi 6.5 added</li>
<p></p>
</div>  

Key features:

* Supports Realtek RTL8153 and RTL8152
* TCP, UDP and IPv4 checksum offload (RX and TX)
* TCP, UDP and IPv6 checksum offload (RX and TX)
* Scatter-Gather support
* TCP Segmentation Offload support
* Wake on LAN support
* VLAN support
* Jumbo Frames (9k)
* Energy Efficient Ethernet (EEE)

Known issues

* Unloading the module manually is not supported
	* The following message appears on vmkernel.log:  
	   Failed to close vmnic32: not ready. Flags 0x1140  
	   
This message can be safely ignored, however,  if the module is reloaded, the vmnic number will change

###Table of Contents  

* [Tested Devices](#tested-devices)
* [Required Software](#required-software)
* [Setup](#setup)
	* [Prepare the build environment](#prepare-the-build-environment) 
	*  [Building the driver](#building-the-driver)

### Tested Devices

* [ANKER Aluminum USB 3.0 to Ethernet Adapter](https://www.amazon.co.uk/Anker-AK-A7611011-USB-1000Mbit-networking/dp/B00PC0P2DI?ie=UTF8&*Version*=1&*entries*=0)

* [ANKER USB 3.0 to RJ45 Gigabit Ethernet Adapter](https://www.amazon.co.uk/dp/B00NPJP33M/ref=pd_lpo_sbs_dp_ss_1?pf_rd_p=569136327&pf_rd_s=lpo-top-stripe&pf_rd_t=201&pf_rd_i=B00DNU8Y20&pf_rd_m=A3P5ROKL5A1OLE&pf_rd_r=C5N2DD7H2D7AVRXM1VHP)

* [TP-LINK UE300 USB 3.0 to Gigabit Ethernet Network Adapter](https://www.amazon.co.uk/gp/product/B00YOKMKE6/ref=pe_1959711_130662621_em_1p_0_ti)

* [Rankie SuperSpeed USB 3.0 to RJ45 Gigabit Ethernet Network Adapter](https://www.amazon.co.uk/gp/product/B010SEARPU/ref=ox_sc_act_title_1?ie=UTF8&psc=1&smid=A7ZMMLW05YAY7)

Tested by Glen Kemp

* [Anker Unibody 3-Port USB 3.0 and Ethernet Hub](https://www.amazon.co.uk/Anker®-Unibody-Ethernet-RTL8153-Chipset/dp/B00PC0J1VC/ref=sr_1_1?s=computers&ie=UTF8&qid=1464184877&sr=1-1&keywords=Anker+Unibody+3-Port+USB+3.0+and+Ethernet+Hub)

USB 2.0 Adapter (RTL8152B Chipset)

* [TP-LINK UE200 USB 2.0 to 100 Mbps Ethernet Network Adapter](https://www.amazon.co.uk/TP-LINK-UE200-Ethernet-Foldable-Ultrabook/dp/B01GRY7RHG)  

Tested by Glen Kemp  

* [Smays 3-Port OTG USB-HUB and USB2.0 RJ45 Ethernet Network Adapter](https://www.amazon.co.uk/gp/product/B00WR6A57S/ref=as_li_ss_tl?ie=UTF8&psc=1&linkCode=sl1&tag=s0517-21&linkId=5815c60c53524b534b98dcd596eab09c)

### Required Software

CentOS 5.3-x86 64 bit DVD ISO - <http://mirror.ash.fastserv.com/centos/5.3/isos/x86_64/CentOS-5.3-x86_64-bin-DVD.iso>

<u>*ESXi 6.0 and 6.5*</u>  

VMware ESXi 6.0 source code (VMware-ESXI-60U2-ODP.iso) and build toolchain (VMware-TOOLCHAIN-ODP-vsphere60u2-Mar-01-2016.iso) 

* ESXi 6.0 Update 2 OSS Download - <https://my.vmware.com/web/vmware/details?downloadGroup=ESXI60U2_OSS&productId=491>  

<u>*ESXi 5.5*</u>

VMware ESXi 5.5 source code (VMware-ESX-5.5.0u03-ODP.iso) and build toolchain (VMware-550u3-TOOLCHAIN-ODP_21_July_2015.iso)

* ESXi 5.5 Update 3 OSS Download - <https://my.vmware.com/web/vmware/details?downloadGroup=ESXI55U3_OSS&productId=353>  

<u>*ESXi 5.1*</u>

VMware ESXi 5.1 source code and build toolchain are both included in a single file (VMware-esx-open-source-5.1.0u2.oss.tar).

* ESXi 5.1 Update 2 OSS Download - <https://my.vmware.com/group/vmware/details?downloadGroup=VSPHERE_51U2_OSS&productId=290#>

### Setup

The embedded documentation for the ESXi open source disclosure packages recommends the build should be performed on a CentOS 5.3 x64 system to produce 64-bit packages. There are other systems mentioned (CentOS 32-bit, Red Hat, FreeBSD and Windows), so take your pick! 

To make life easier, I customised the Kickstart file provided with the ESXi 5.5 Toolchain ISO (under the **config** folder) to build a CentOS 5.3 x64 server VM. Once it is up and running, we deviate a bit from the instructions provided by VMware.

The initial build directory structure should be:

~~~sh
mkdir -p /build/{vsphere,toolchain}
~~~

The next steps are a bit different, depending on whether the build environment is being prepared for ESXi 5.1 or later versions:

#### Prepare the build environment

<u>*ESXi 5.1*</u>

Extract the contents of the compressed tar archive to /build/vsphere:

~~~sh
cd /build/vsphere
tar xvf /path/to/VMware-esx-open-source-5.1.0u2.oss.tar --strip-components=1 server/vmkdrivers-gpl
cd vmkdrivers-gpl
~~~
You are now ready to compile the build toolchain:

_glibc_

~~~sh
cd glibc-2.3.2-95.44
bash ./BUILD.txt
cd ..
~~~

_binutils_

~~~sh
cd binutils-2.17.50.0.15-modcall
bash ./BUILD.txt
cd ..
~~~

_gcc_

~~~sh	
cd gcc-4.1.2-9
bash ./BUILD.txt
cd ..		
~~~


Unlike ESXi 5.1, the ODP source code and the build toolchain for 5.5 and 6.0 are distributed as two separate ISO images. The two ISOs include hundreds of packages, but only a small subset is actually required to build the drivers.

<u>*ESXi 5.5*</u>

Copy the **vmkdrivers-gpl** folder from the ODP ISO (VMware-ESX-5.5.0u03-ODP.iso) to /build/vsphere/

```sh
cp -r /cdrom/vmkdrivers-gpl /build/vsphere
umount /cdrom
```

**Note:** The above assumes that */cdrom* is the mount point for the ISO/Physical DVD — your environment might differ.

The toolchain ISO (VMware-550u3-TOOLCHAIN-ODP_21_July_2015.iso) includes the source for multiple libraries and tools, but only glibc, binutils and gcc at specific versions are required.

```sh
cd /build/toolchain
tar xvf /cdrom/tc-src.tar src/gcc-4.4.3-2 src/glibc-2.3.2-95.44 src/binutils-2.20.1-1 src/common/functions
umount /cdrom
```

**Note:** The above assumes that */cdrom* is the mount point for the ISO/Physical DVD — your environment might differ.

Compile the build toolchain:

*glibc*

```sh
cd /build/toolchain/src/glibc-2.3.2-95.44
bash ./install.sh
```

*binutils*

```sh
cd /build/toolchain/src/binutils-2.20.1-1
bash ./install.sh
```

*gcc*

```sh
cd /build/toolchain/src/gcc-4.4.3-2
bash ./install.sh
```

<u>*ESXi 6.0*</u>  

Copy the **vmkdrivers-gpl** folder from the ODP ISO (VMware-ESXI-60U2-ODP.iso) to /build/vsphere/

```sh
cp -r /cdrom/vmkdrivers-gpl /build/vsphere
umount /cdrom
```

**Note:** The above assumes that */cdrom* is the mount point for the ISO/Physical DVD — your environment might differ.

The toolchain ISO (VMware-TOOLCHAIN-ODP-vsphere60u2-Mar-01-2016.iso) includes the source for multiple libraries and tools, but only glibc, binutils and gcc at specific versions are required.

```sh
cd /build/toolchain
tar xvf /cdrom/tc-src.tar src/gcc-4.4.3-2 src/glibc-2.3.2-95.44 src/binutils-2.22 src/common/functions
umount /cdrom
```

**Note:** The above assumes that */cdrom* is the mount point for the ISO/Physical DVD — your environment might differ.

Compile the build toolchain:

*glibc*

```sh
cd /build/toolchain/src/glibc-2.3.2-95.44
bash ./install.sh
```

*binutils*

```sh
cd /build/toolchain/src/binutils-2.22
bash ./install.sh
```

*gcc*

```sh
cd /build/toolchain/src/gcc-4.4.3-2
```
Be sure to correct the BUVER var in build.sh to point to the correct version of binutils...
```sh
sed -i 's/export BUVER=2.20.1-1/export BUVER=2.22/g' build.sh
bash ./install.sh
```

<u>*ESXi 6.5*</u>

The ODB source and toolchain for 6.5 are completely broken and won't produce a working driver. However, there are no differences between the 6.0 and 6.5 source files, as VMware is preparing to drop support for legacy drivers.

Please follow the instructions as if compiling for ESXi 6.0, noting the changes highlighted in the sections below. 
 

#### Building the driver

There is a little bit more preparation to be done to build the driver. Again, some of the steps are different depending on the version of ESXi.

<u>*Common*</u>

```sh
cd /build/vsphere/vmkdrivers-gpl
tar zxvf vmkdrivers-gpl.tgz
```

Create the directory for the driver's source code. The same source files are used to build the driver on all environments.

```sh
cd /build/vsphere/vmkdrivers-gpl
mkdir vmkdrivers/src_92/drivers/usb/net/r8152-2.06.0
cp /path/to/source/r8152.c vmkdrivers/src_92/drivers/usb/net/r8152-2.06.0/
cp /path/to/source/compatibility.h vmkdrivers/src_92/drivers/usb/net/r8152-2.06.0/
```

Create the directory that will hold the driver's namespace dependencies map:

<u>*ESXi 5.1*</u>

```sh
cd /build/vsphere/vmkdrivers-gpl
mkdir BLD/build/HEADERS/CUR-92-vmkdrivers-namespace/vmkernel64/release/r8152-2.06.0
echo -e "VMK_NAMESPACE_REQUIRED(\"com.vmware.usb\", \"9.2.1.0\");\
\nVMK_NAMESPACE_REQUIRED(\"com.vmware.usbnet\", \"9.2.1.0\");"\
> BLD/build/HEADERS/CUR-92-vmkdrivers-namespace/vmkernel64/release/r8152-2.06.0/__namespace.h
```

<u>*ESXi 5.5*</u>

```sh
cd /build/vsphere/vmkdrivers-gpl
mkdir BLD/build/HEADERS/CUR-92-vmkdrivers-namespace/vmkernel64/release/r8152-2.06.0
echo -e "VMK_NAMESPACE_REQUIRED(\"com.vmware.usb\", \"9.2.2.0\");\
\nVMK_NAMESPACE_REQUIRED(\"com.vmware.usbnet\", \"9.2.2.0\");"\
> BLD/build/HEADERS/CUR-92-vmkdrivers-namespace/vmkernel64/release/r8152-2.06.0/__namespace.h
```

<u>*ESXi 6.0*</u>

```sh
cd /build/vsphere/vmkdrivers-gpl
mkdir BLD/build/HEADERS/92-vmkdrivers-namespace/vmkernel64/release/r8152-2.06.0
echo -e "VMK_NAMESPACE_REQUIRED(\"com.vmware.usb\", \"9.2.3.0\");\
\nVMK_NAMESPACE_REQUIRED(\"com.vmware.usbnet\", \"9.2.3.0\");"\
> BLD/build/HEADERS/92-vmkdrivers-namespace/vmkernel64/release/r8152-2.06.0/__namespace.h
```
<u>*ESXi 6.5*</u>

```sh
cd /build/vsphere/vmkdrivers-gpl
mkdir BLD/build/HEADERS/92-vmkdrivers-namespace/vmkernel64/release/r8152-2.06.0
echo -e "VMK_NAMESPACE_REQUIRED(\"com.vmware.usb\", \"10.0\");\
\nVMK_NAMESPACE_REQUIRED(\"com.vmware.usbnet\", \"9.2.3.0\");"\
> BLD/build/HEADERS/92-vmkdrivers-namespace/vmkernel64/release/r8152-2.06.0/__namespace.h
```

Finally, copy the appropriate build script to **/build/vsphere/vmkdrivers-gpl** and compile the driver.

<u>*ESXi 5.1*</u>

```sh
cd /build/vsphere/vmkdrivers-gpl
cp /path/to/scripts/build-r8152-2.06.0_u51.sh .
chmod a+x build-r8152-2.06.0_u51.sh
./build-r8152-2.06.0_u51.sh
```

<u>*ESXi 5.5*</u>

```sh
cd /build/vsphere/vmkdrivers-gpl
cp /path/to/scripts/build-r8152-2.06.0_u55.sh .
chmod a+x build-r8152-2.06.0_u55.sh
./build-r8152-2.06.0_u55.sh
```

<u>*ESXi 6.0 and 6.5*</u>

```sh
cd /build/vsphere/vmkdrivers-gpl
cp /path/to/scripts/build-r8152-2.06.0_u60.sh .
chmod a+x build-r8152-2.06.0_u60.sh
./build-r8152-2.06.0_u60.sh
```
  

