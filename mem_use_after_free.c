#include <stdlib.h>

int
main (void)
{
  char *ptr = malloc (1024);
  free (ptr);
  ptr[0] = 'a';
  return 0;
}
