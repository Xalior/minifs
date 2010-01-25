#!/bin/bash

TARGET_ARCH=arm
TARGET_FULL_ARCH=$TARGET_ARCH-minifs-linux-uclibcgnueabi
TARGET_KERNEL_NAME=uImage

# target has tiny memory, use thumb, it's smaller
TARGET_CFLAGS="-Os -march=armv4t -mtune=arm920t -mthumb-interwork -mthumb "

function board_prepare() {
	echo "board_prepare"
	TARGET_FS_SQUASH=0
	TARGET_INITRD=0
}

board_finish() {
	echo "board_finish"
}

board_compile() {
	echo "board_compile"

	cp "$BUILD"/kernel.ub "$ROOTFS"/linux
}
