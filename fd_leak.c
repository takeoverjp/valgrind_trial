#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>

int
main (void)
{
  int fd = open (".tmp", O_CREAT, 0666);
  return 0;
}
