#include <stdlib.h>

int
main (void)
{
  char *ptr = malloc (1024);
  ptr[1024] = 'a';
  free (ptr);
  return 0;
}
