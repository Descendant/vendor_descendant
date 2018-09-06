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
	lunch treble_arm64_avN
	make WITHOUT_CHECK_API=true BUILD_NUMBER=$rom_fp installclean
	make WITHOUT_CHECK_API=true BUILD_NUMBER=$rom_fp -j$jobs systemimage
	make WITHOUT_CHECK_API=true BUILD_NUMBER=$rom_fp vndk-test-sepolicy
}

buildVariant treble_arm64_avN-userdebug
