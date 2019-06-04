#ifndef INCLUDED_BADCODE_H
#define INCLUDED_BADCODE_H

int mem_leak (void);
int mem_double_free (void);
int mem_use_after_free (void);
int mem_out_of_range (void);
int fd_leak (void);

#endif /* INCLUDED_BADCODE_H */
