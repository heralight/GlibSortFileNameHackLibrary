#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdio.h>
#include <glib.h>

gchar *
(*real_g_utf8_collate_key_for_filename)(const gchar *str,
				 gssize       len);

gchar *
g_utf8_collate_key_for_filename(const gchar *str,
				 gssize       len)
{
  return g_utf8_collate_key(str, len);
}


void _init(void)
{
// printf("Loading hack\n");
 real_g_utf8_collate_key_for_filename = dlsym(RTLD_NEXT, "g_utf8_collate_key_for_filename");
}
