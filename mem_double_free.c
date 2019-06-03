#include <stdlib.h>

int
main (void)
{
  char *ptr = malloc (1024);
  free (ptr);
  free (ptr);
  return 0;
}
