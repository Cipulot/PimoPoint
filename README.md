# PimoTrack Extras

This repository contains code and custom mounting hardware files for the [Pimoroni Trackball Breakout](https://shop.pimoroni.com/products/trackball-breakout).

![Pimoroni on Planck](https://github.com/Cipulot/PimoPoint/blob/main/media/Pimoroni_on_Planck.jpg?raw=true)

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

The Pimoroni Trackball Breakout PCB is a small breakout board with exposed I²C pins and 4 mounting holes.

Dimensional measurements:
![Pimoroni on Planck](https://github.com/Cipulot/PimoPoint/blob/main/media/Mechanical_drawing.jpg?raw=true)

Unfortunately, while being relatively small, the PCB is not small enough to be used in a 1U sized space.

I've therefore designed an angled mounting bracket that can be used to mount the PCB in a 2U sized space.

It uses 2 Cherry MX style switches, without top casing and glued stems, as mounting points.
This allows for smaller and easier to print parts both with FDM and SLA printers, since smaller parts as the clips for plate clip-in would require high degree of accuracy.

![SLA_print_mounting_sys](https://github.com/Cipulot/PimoPoint/blob/main/media/SLA_print_mounting_sys.jpg?raw=true)

### Trackball support w_ fix holes

![w_ fix holes](https://github.com/Cipulot/PimoPoint/blob/main/media/3D_Trackball_support_w__fix_holes.jpg?raw=true)

### Trackball support w_o fix holes

![w_o fix holes](https://github.com/Cipulot/PimoPoint/blob/main/media/3D_Trackball_support_w_o_fix_holes.jpg?raw=true)

### Fabrication example

Here's a collection of printed parts using SLA print method.

Support w_ fix holes top view:
![SLA_print_top](https://github.com/Cipulot/PimoPoint/blob/main/media/SLA_print_top.jpg?raw=true)

Support w_ fix holes bot view:
![SLA_print_bot](https://github.com/Cipulot/PimoPoint/blob/main/media/SLA_print_bot.jpg?raw=true)

Support w_ fix holes with pin strip receptor:
![SLA_print_pin_strip_receptor](https://github.com/Cipulot/PimoPoint/blob/main/media/SLA_print_pin_strip.jpg?raw=true)

Planck with Trackball Breakout PCB mounted on support:
<p float="left">
  <img src="https://github.com/Cipulot/PimoPoint/blob/main/media/Module_mounted_front_view.jpg?raw=true" width="380" />
  <img src="https://github.com/Cipulot/PimoPoint/blob/main/media/Module_mounted_top_view.jpg?raw=true" width="290" />
  <img src="https://github.com/Cipulot/PimoPoint/blob/main/media/Module_mounted_profile_view.jpg?raw=true" width="200" />
</p>

## Future features and improvements

These are the things I'd like to improve in the future:

* 3D model a replacement cover for the trackball, for further customization.

* Create a new support for the Trackball Breakout with a different mounting system. This would allow for a more flexible and user friendly installation since it will not require the use of 2 "sacrificial" switches.

  The actual design wouldn't require much changes to the model in use today but considerations must be made in order to make it printable by the average FDM and SLA printers. Generally available FDM printers are not as good as SLA printers and therefore the design would need to be adjusted to make it printable. Durability is another concern that will be investigated once early design is done.

* Make a custom 1U sized space PCB, allowing for a more flexible use by the end user, since it will free up a 1U compared to today's standard 2U sized space.

  The challenging part is the sourcing of raw materials and the design of the PCB. The actual PCB is quite easy to design, since space can be saved by removing the mounting holes and the exposed I²C pins can be swapped for small solder pads. The actual firmware onboard the MCU doesn't appear to be public. This means that it would need to be provided by the Pimoroni team or dumped in some way from a genuine Pimoroni device and later flashed to virgin MCUs.
