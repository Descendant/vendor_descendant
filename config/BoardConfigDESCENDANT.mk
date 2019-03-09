ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/descendant/config/BoardConfigQcom.mk
endif

include vendor/descendant/config/BoardConfigKernel.mk

include vendor/descendant/config/BoardConfigSoong.mk
