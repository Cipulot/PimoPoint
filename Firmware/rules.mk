# Place other makefile rules here

PIMORONI_TRACKBALL_ENABLE = yes
ifeq ($(strip $(PIMORONI_TRACKBALL_ENABLE)), yes)
    POINTING_DEVICE_ENABLE = yes
    SRC += pimoroni_trackball.c
    OPT_DEFS += -DPIMORONI_TRACKBALL_ENABLE
    OPT_DEFS += -DPIMORONI_TRACKBALL_CLICK
    QUANTUM_LIB_SRC += i2c_master.c
endif
