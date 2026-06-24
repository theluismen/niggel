#include "vga.h"
#include "types.h"

void vga_print_char ( uint8_t row, uint8_t col, uint8_t bg, uint8_t fg, uint16_t ch ) {

    volatile uint16_t * const textbuffer = (volatile uint16_t *) VGA_TEXTBUFFER_ADDRESS; 

    if ( row >= 25 || col >= 80 ) {
        return;
    }
    
    textbuffer[row*80 + col] = bg << 12 | fg << 8 | ch;
}