#!/bin/bash
# https://github.com/Hyy2001X/AutoBuild-Actions
# AutoBuild Module by Hyy2001
# AutoBuild Functions

GET_TARGET_INFO() {
	[[ ${TARGET_PROFILE} == x86-64 ]] && {
		[[ `grep -c "CONFIG_TARGET_IMAGES_GZIP=y" ${Home}/.config` -ge '1' ]] && Firmware_sfxo=img.gz || Firmware_sfxo=img 
	}
	case "${REPO_BRANCH}" in
	"master")
		LUCI_Name="18.06"
		REPO_Name="lede"
		ZUOZHE="Lean's"
		if [[ "${TARGET_PROFILE}" == "x86-64" ]]; then
			export Legacy_Firmware="openwrt-x86-64-generic-squashfs-combined.${Firmware_sfxo}"
			export UEFI_Firmware="openwrt-x86-64-generic-squashfs-combined-efi.${Firmware_sfxo}"
			export Firmware_sfx="${Firmware_sfxo}"
		elif [[ "${TARGET_PROFILE}" =~ (phicomm_k3|phicomm-k3) ]]; then
			export TARGET_PROFILE="phicomm_k3"
			export Up_Firmware="openwrt-bcm53xx-generic-${TARGET_PROFILE}-squashfs.trx"
			export Firmware_sfx="trx"
		elif [[ "${TARGET_PROFILE}" =~ (phicomm_k2p|phicomm-k2p) ]]; then
			export TARGET_PROFILE="phicomm_k2p"
			export Up_Firmware="openwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		elif [[ "${TARGET_PROFILE}" =~ (xiaomi_mi-router-3g|xiaomi_mir3g) ]]; then
			export TARGET_PROFILE="xiaomi_mir3g"
			export Up_Firmware="openwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		elif [[ "${TARGET_PROFILE}" =~ (xiaomi_mi-router-3g-v2|xiaomi_mir3gv2) ]]; then
			export TARGET_PROFILE="xiaomi_mir3gv2"
			export Up_Firmware="openwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		elif [[ "${TARGET_PROFILE}" =~ (xiaomi_mi-router-3-pro|xiaomi_mir3p) ]]; then
			export TARGET_PROFILE="xxiaomi_mir3p"
			export Up_Firmware="openwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		else
			export Up_Firmware="openwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		fi
	;;
	"main")
		LUCI_Name="20.06"
		REPO_Name="lienol"
		ZUOZHE="Lienol's"
		if [[ "${TARGET_PROFILE}" == "x86-64" ]]; then
			Legacy_Firmware="openwrt-x86-64-generic-squashfs-combined.${Firmware_sfxo}"
			UEFI_Firmware="openwrt-x86-64-generic-squashfs-combined-efi.${Firmware_sfxo}"
			Firmware_sfx="${Firmware_sfxo}"
		elif [[ "${TARGET_PROFILE}" =~ (phicomm_k3|phicomm-k3) ]]; then
			export TARGET_PROFILE="phicomm_k3"
			export Up_Firmware="openwrt-bcm53xx-generic-${TARGET_PROFILE}-squashfs.trx"
			export Firmware_sfx="trx"
		elif [[ "${TARGET_PROFILE}" =~ (phicomm_k2p|phicomm-k2p) ]]; then
			export TARGET_PROFILE="phicomm_k2p"
			export Up_Firmware="openwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		elif [[ "${TARGET_PROFILE}" =~ (xiaomi_mi-router-3g|xiaomi_mir3g) ]]; then
			export TARGET_PROFILE="xiaomi_mir3g"
			export Up_Firmware="openwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		elif [[ "${TARGET_PROFILE}" =~ (xiaomi_mi-router-3g-v2|xiaomi_mir3gv2) ]]; then
			export TARGET_PROFILE="xiaomi_mir3gv2"
			export Up_Firmware="openwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		elif [[ "${TARGET_PROFILE}" =~ (xiaomi_mi-router-3-pro|xiaomi_mir3p) ]]; then
			export TARGET_PROFILE="xxiaomi_mir3p"
			export Up_Firmware="openwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		else
			export Up_Firmware="openwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		fi
	;;
	"openwrt-18.06")
		LUCI_Name="18.06_tl"
		REPO_Name="Tianling"
		ZUOZHE="ctcgfw"
		if [[ "${TARGET_PROFILE}" == "x86-64" ]]; then
			Legacy_Firmware="immortalwrt-x86-64-generic-squashfs-combined.${Firmware_sfxo}"
			UEFI_Firmware="immortalwrt-x86-64-generic-squashfs-combined-efi.${Firmware_sfxo}"
			Firmware_sfx="${Firmware_sfxo}"
		elif [[ "${TARGET_PROFILE}" =~ (phicomm_k3|phicomm-k3) ]]; then
			export TARGET_PROFILE="phicomm_k3"
			export Up_Firmware="immortalwrt-bcm53xx-generic-${TARGET_PROFILE}-squashfs.trx"
			export Firmware_sfx="trx"
		elif [[ "${TARGET_PROFILE}" =~ (phicomm_k2p|phicomm-k2p) ]]; then
			export TARGET_PROFILE="phicomm_k2p"
			export Up_Firmware="immortalwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		elif [[ "${TARGET_PROFILE}" =~ (xiaomi_mi-router-3g|xiaomi_mir3g) ]]; then
			export TARGET_PROFILE="xiaomi_mir3g"
			export Up_Firmware="immortalwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		elif [[ "${TARGET_PROFILE}" =~ (xiaomi_mi-router-3g-v2|xiaomi_mir3gv2) ]]; then
			export TARGET_PROFILE="xiaomi_mir3gv2"
			export Up_Firmware="immortalwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		elif [[ "${TARGET_PROFILE}" =~ (xiaomi_mi-router-3-pro|xiaomi_mir3p) ]]; then
			export TARGET_PROFILE="xxiaomi_mir3p"
			export Up_Firmware="immortalwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		else
			export Up_Firmware="immortalwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		fi
	;;
	"openwrt-21.02")
		LUCI_Name="21.02"
		REPO_Name="mortal"
		ZUOZHE="ctcgfw"
		if [[ "${TARGET_PROFILE}" == "x86-64" ]]; then
			Legacy_Firmware="immortalwrt-x86-64-generic-squashfs-combined.${Firmware_sfxo}"
			UEFI_Firmware="immortalwrt-x86-64-generic-squashfs-combined-efi.${Firmware_sfxo}"
			Firmware_sfx="${Firmware_sfxo}"
		elif [[ "${TARGET_PROFILE}" =~ (phicomm_k3|phicomm-k3) ]]; then
			export TARGET_PROFILE="phicomm_k3"
			export Up_Firmware="immortalwrt-bcm53xx-generic-${TARGET_PROFILE}-squashfs.trx"
			export Firmware_sfx="trx"
		elif [[ "${TARGET_PROFILE}" =~ (phicomm_k2p|phicomm-k2p) ]]; then
			export TARGET_PROFILE="phicomm_k2p"
			export Up_Firmware="immortalwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		elif [[ "${TARGET_PROFILE}" =~ (xiaomi_mi-router-3g|xiaomi_mir3g) ]]; then
			export TARGET_PROFILE="xiaomi_mir3g"
			export Up_Firmware="immortalwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		elif [[ "${TARGET_PROFILE}" =~ (xiaomi_mi-router-3g-v2|xiaomi_mir3gv2) ]]; then
			export TARGET_PROFILE="xiaomi_mir3gv2"
			export Up_Firmware="immortalwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		elif [[ "${TARGET_PROFILE}" =~ (xiaomi_mi-router-3-pro|xiaomi_mir3p) ]]; then
			export TARGET_PROFILE="xxiaomi_mir3p"
			export Up_Firmware="immortalwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		else
			export Up_Firmware="immortalwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			export Firmware_sfx="bin"
		fi
	;;
	esac
	if [[ ${REGULAR_UPDATE} == "true" ]]; then
		AutoUpdate_Version=$(egrep -o "V[0-9].+" ${Home}/package/base-files/files/bin/AutoUpdate.sh | awk 'END{print}')
	else
		 AutoUpdate_Version=OFF
	fi
	In_Firmware_Info="${Home}/package/base-files/files/bin/openwrt_info"
	Github_Release="${Github}/releases/download/AutoUpdate"
	Github_UP_RELEASE="${Github}/releases/AutoUpdate"
	Openwrt_Version="${REPO_Name}-${TARGET_PROFILE}-${Compile_Date}"
	Egrep_Firmware="${LUCI_Name}-${REPO_Name}-${TARGET_PROFILE}"
}

Diy_Part1() {
sed -i 's/DEFAULT_PACKAGES +=/DEFAULT_PACKAGES += luci-app-autoupdate luci-app-ttyd/g' target/linux/*/Makefile
}

Diy_Part2() {
	GET_TARGET_INFO
	cat >${In_Firmware_Info} <<-EOF
	Github=${Github}
	Luci_Edition=${OpenWrt_name}
	CURRENT_Version=${Openwrt_Version}
	DEFAULT_Device=${TARGET_PROFILE}
	Firmware_Type=${Firmware_sfx}
	LUCI_Name=${LUCI_Name}
	REPO_Name=${REPO_Name}
	Github_Release=${Github_Release}
	Egrep_Firmware=${Egrep_Firmware}
	Download_Path=/tmp/Downloads
	Version=${AutoUpdate_Version}
	Download_Tags=/tmp/Downloads/Github_Tags
	EOF
}

Diy_Part3() {
	GET_TARGET_INFO
	AutoBuild_Firmware="${LUCI_Name}-${Openwrt_Version}"
	Firmware_Path="${Home}/upgrade"
	Mkdir ${Home}/bin/Firmware
	if [[ `ls ${Firmware_Path} | grep -c "sysupgrade.bin"` -ge '1' ]]; then
		Up_BinFirmware="openwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
		mv ${Firmware_Path}/*sysupgrade.bin ${Home}/bin/Firmware/${Up_BinFirmware}
		mv ${Home}/bin/Firmware/${Up_BinFirmware} ${Firmware_Path}/${Up_BinFirmware}
	fi
	cd ${Firmware_Path}
	if [[ `ls | grep -c "xiaomi_mi-router-3g"` -ge '1' ]]; then
		rename -v "s/xiaomi_mi-router-3g/xiaomi_mir3g/" * > /dev/null 2>&1
	elif [[ `ls | grep -c "xiaomi_mi-router-3g-v2"` -ge '1' ]]; then
		rename -v "s/xiaomi_mi-router-3g-v2/xiaomi_mir3gv2/" * > /dev/null 2>&1
	elif [[ `ls | grep -c "xiaomi_mi-router-3-pro"` -ge '1' ]]; then
		rename -v "s/xiaomi_mi-router-3-pro/xiaomi_mir3p/" * > /dev/null 2>&1
	elif [[ `ls | grep -c "phicomm-k2p"` -ge '1' ]]; then
		rename -v "s/phicomm-k2p/phicomm_k2p/" * > /dev/null 2>&1
	elif [[ `ls | grep -c "phicomm-k3"` -ge '1' ]]; then
		rename -v "s/phicomm-k3/phicomm_k3/" * > /dev/null 2>&1
	fi
	case "${TARGET_PROFILE}" in
	x86-64)
		[[ -e ${Legacy_Firmware} ]] && {
			MD5=$(md5sum ${Legacy_Firmware} | cut -c1-3)
			SHA256=$(sha256sum ${Legacy_Firmware} | cut -c1-3)
			SHA5BIT="${MD5}${SHA256}"
			cp ${Legacy_Firmware} ${Home}/bin/Firmware/${AutoBuild_Firmware}-Legacy-${SHA5BIT}.${Firmware_sfx}
		}
		[[ -e ${UEFI_Firmware} ]] && {
			MD5=$(md5sum ${UEFI_Firmware} | cut -c1-3)
			SHA256=$(sha256sum ${UEFI_Firmware} | cut -c1-3)
			SHA5BIT="${MD5}${SHA256}"
			cp ${UEFI_Firmware} ${Home}/bin/Firmware/${AutoBuild_Firmware}-UEFI-${SHA5BIT}.${Firmware_sfx}
		}
	;;
	friendlyarm_nanopi-r2s | friendlyarm_nanopi-r4s | armvirt)
		echo "R2S/R4S/N1/晶晨系列,暂不支持定时更新固件!" > Update_Logs.json
		cp Update_Logs.json ${Home}/bin/Firmware/Update_Logs.json
	;;
	*)
		[[ -e ${Up_Firmware} ]] && {
			MD5=$(md5sum ${Up_Firmware} | cut -c1-3)
			SHA256=$(sha256sum ${Up_Firmware} | cut -c1-3)
			SHA5BIT="${MD5}${SHA256}"
			cp ${Up_Firmware} ${Home}/bin/Firmware/${AutoBuild_Firmware}-Sysupg-${SHA5BIT}.${Firmware_sfx}
		} || {
			echo "Firmware is not detected !"
		}
	;;
	esac
	cd ${Home}
}

Mkdir() {
	_DIR=${1}
	if [ ! -d "${_DIR}" ];then
		mkdir -p ${_DIR}
	fi
	unset _DIR
}
