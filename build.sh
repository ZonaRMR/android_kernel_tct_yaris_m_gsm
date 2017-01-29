 #
 # Copyright © 2015, Varun Chitre "varun.chitre15" <varun.chitre15@gmail.com>
 #
 # Custom build script
 #
 # This software is licensed under the terms of the GNU General Public
 # License version 2, as published by the Free Software Foundation, and
 # may be copied, distributed, and modified under those terms.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 # Please maintain this if you use this script or any part of it
 #
toolchain=/home/kirito9/android/toolchain/arm-cortex-linux-gnueabi-linaro_5.2-2015.11-2/bin
kernel="Phoenix"
variant="v1"
toolchain2="arm-eabi-"
jobcount="-j$(grep -c ^processor /proc/cpuinfo)"
kerneltype="zImage"
codename="jrdhz72_we_jb3"
KERNEL_DIR=$PWD
ZIMAGE=$KERNEL_DIR/kernel/arch/arm/boot/zImage
BUILD_START=$(date +"%s")
blue='\033[0;34m'
cyan='\033[0;36m'
yellow='\033[0;33m'
red='\033[0;31m'
nocol='\033[0m'
# Modify the following variable if you want to build
export CROSS_COMPILE=$toolchain/"$toolchain2"

compile_kernel ()
{
echo -e "$blue***********************************************"
echo "          Compiling Phoenix kernel          "
echo -e "***********************************************$nocol"
export KBUILD_BUILD_USER="kirito9"
export KBUILD_BUILD_HOST="team-Panther"
cd kernel
export TARGET_PRODUCT=$codename MTK_ROOT_CUSTOM=../mediatek/custom/ MTK_PATH_PLATFORM=../mediatek/platform/mt6572/kernel/ MTK_PATH_SOURCE=../mediatek/kernel/
make $jobcount
$KERNEL_DIR/mediatek/build/tools/mkimage $KERNEL_DIR/kernel/arch/arm/boot/zImage KERNEL > $KERNEL_DIR/kernel/zip-creator/tools/zImage
if ! [ -a $ZIMAGE ];
then
echo -e "$red Kernel Compilation failed! Fix the errors! $nocol"
exit 1
fi

# Creating the zip file
if [ -a $ZIMAGE ]; 
then
rm -f zip-creator/kernel/$kerneltype

	find . -name *.ko | xargs cp -a --target-directory=zip-creator/system/lib/modules/

	zipfile="$kernel-$variant-$codename.zip"
	cd zip-creator
	rm -f *.zip
	zip -r $zipfile * -x *kernel/.gitignore*

	echo "zip saved to zip-creator/$zipfile"
	
else # [ -f arch/arm/boot/"$kerneltype" ]
    echo "the build failed so a zip won't be created"
fi # [ -f arch/arm/boot/"$kerneltype" ]

}

case $1 in
clean)
export TARGET_PRODUCT=$codename MTK_ROOT_CUSTOM=../mediatek/custom/ MTK_PATH_PLATFORM=../mediatek/platform/mt6572/kernel/ MTK_PATH_SOURCE=../mediatek/kernel/
rm -r mediatek/custom/out
cd kernel
make $jobcount clean mrproper
;;
*)
compile_kernel
;;
esac

BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))
echo -e "$yellow Build completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds.$nocol"
