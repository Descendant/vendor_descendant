echo "
                                                                                 ,
                                                                                 .
                                                                                ,
                                                                                (
                                                                             **   **,
                                                                            *       *
                                                                            *.     .*
                                                                             *././.*
                                                                             *(
                                                                           *(
                                                                    ./*//.//.
                                                                   /*        /,
                                                    _ ... _        /         ./
                                                 ,/*        */.    /         /*
                                               ///,          ///   //       /*
                                              //,              ///( ((*.///*
                                             //                 //,
                                            *//                  //
                                            */*                  //
                                            .//                 */*
                                           .,///               ,//
             .,,***,,.,,**/((((/*.___*//.---  ///             ///
                                                ////*.     ,////
                                                   */*----*/*

                                              D-e-s-c-e-n-d-a-n-t


"

jobs=$(nproc)

echo "What you want to build?"
echo "arm64-a"
echo "arm64-ab"
echo "arm-a"
read -p "Choice:" choice

case $choice in
	arm64-a)
		treble_target=treble_arm64_avN-userdebug
		;;
	arm64-ab)
		treble_target=treble_arm64_bvN-userdebug
		;;
	arm-a)
		treble_target=treble_arm_avN-userdebug
		;;
	*)
		echo "I do not understand your query, quitting."
		exit 1
		;;
esac

echo "Repo initing.."
repo init -u https://github.com/Descendant/manifest.git -b NineDotZero_GSI
echo "Repo syncing.."
rm -rf device/phh/treble
repo sync -f --force-sync --no-clone-bundle -j$jobs

echo "Setting up the device tree for Descendant.."
chmod +x device/phh/treble/generate.sh
(cd device/phh/treble/ && ./generate.sh descendant)
cp vendor/descendant/GSI/buildsupport/descendant.mk device/phh/treble/

echo "Applying GSI patches.."
bash "apply-patch.sh" patches

echo "Exporting CCACHE vars.."
export USE_CCACHE=1
export CCACHE_COMPRESS=1

read -p "Do you want to include GApps in this image? " gapps
if [[ $gapps == "y"* ]];then
echo '$(call-inherit vendor/gapps/config.mk)' >> device/phh/treble/descendant.mk
fi

echo "Build begins.."
. build/envsetup.sh

buildVariant() {
	lunch $treble_target
	make WITHOUT_CHECK_API=true BUILD_NUMBER=$rom_fp installclean
	make WITHOUT_CHECK_API=true BUILD_NUMBER=$rom_fp -j$jobs systemimage
	make WITHOUT_CHECK_API=true BUILD_NUMBER=$rom_fp vndk-test-sepolicy
}

buildVariant $treble_target
