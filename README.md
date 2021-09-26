# PimoTrack Extras

This repository contains code and custom mounting hardware files for the Pimoroni Track Ball Breakout.

## Firmware

While QMK natively supports trackball modules over I²C, the base support is somewhat limited at the moment and requires a bit of tinkering to get other functions.
This is why I've created a custom set of firmware files for the Track Ball Breakout that include basic but user friendly features.

### `config.h`

Here you can specify the orientation of the module using `TRACKBALL_ORIENTATION` and the angle of the trackball using `TRACKBALL_ANGLE`.

### `pimoroni_trackball.c`

File containing the actual code for the trackball. Here you'll add code to your personally defined functions if you want to expand the functionality of the trackball. Remember to add function prototype to `pimoroni_trackball.h`.

### `pimoroni_trackball.h`

Header file for the trackball firmware. Contains defines for I²C address of the module, addresses for I²C write and read, along with other addresses, function prototypes and struct for trackball state.

If you changed the I²C address of the module, you'll need to change `#define TRACKBALL_ADDRESS 0x0A` to `#define TRACKBALL_ADDRESS 0x0B`.

### `keymap.c`

Example keymap that shows how to implement the trackball functionality into your keymap.
For further explanations see the comments in the code itself.

### `rules.mk`

Rules that you'll add to personal keymap.

Having `PIMORONI_TRACKBALL_ENABLE = yes` will automatically enable pointing device capabilities through `POINTING_DEVICE_ENABLE = yes` and add required files to the build process (`SRC += pimoroni_trackball.c` and the Quantum I²C lib, `QUANTUM_LIB_SRC += i2c_master.c`).

## Hardware


### Trackball support w_ fix holes


### Trackball support w_o fix holes
