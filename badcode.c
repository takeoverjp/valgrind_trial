#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int
mem_leak (void)
{
  char *ptr = (char *)malloc (1024);
  return 0;
}

int
mem_double_free (void)
{
  char *ptr = (char *)malloc (1024);
  free (ptr);
  free (ptr);
  return 0;
}

int
mem_use_after_free (void)
{
  char *ptr = (char *)malloc (1024);
  ptr[0] = 'A';
  free (ptr);

  return ptr[0];
}

int
mem_out_of_range (void)
{
  char *ptr = (char *)malloc (1024);
  ptr[1024] = 'A';
  free (ptr);

  return 0;
}

int
fd_leak (void)
{
  int fd = open (".tmp", O_CREAT, 0666);
  return 0;
}
