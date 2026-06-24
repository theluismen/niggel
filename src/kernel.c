#include "vga.h"
#include "types.h"

int kernel_main () {

    /* Prints some characters on the screen */
    for ( uint8_t i = 0; i < 6; i++ ) {
        vga_print_char(3, 3+i, VGA_COLOR_BLACK, VGA_COLOR_WHITE, '0'+i);
    }

    return 0;
}