#include <stdio.h>
#include <glib.h>

void main(int argc, char **argv)
{
g_printf("mod: %s\n", g_utf8_collate_key_for_filename(argv[1], 8));


}
