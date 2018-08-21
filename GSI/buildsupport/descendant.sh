bash "$(dirname "$0")/apply-patches.sh" patches

. build/envsetup.sh

buildVariant() {
	lunch treble_arm64_avN.mk
	make WITHOUT_CHECK_API=true BUILD_NUMBER=$rom_fp installclean
	make WITHOUT_CHECK_API=true BUILD_NUMBER=$rom_fp -j$jobs systemimage
	make WITHOUT_CHECK_API=true BUILD_NUMBER=$rom_fp vndk-test-sepolicy
}

buildVariant
