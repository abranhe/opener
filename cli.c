//
// Opener CLI
// cli.c
//
// MIT licensed.
// Copyright (c) Abraham Hernandez <abraham@abranhe.com>
//

#include <stdio.h>
#include <string.h>
#include "opener.h"

const char*
show_help() {
 return "\n\
 Oooh, Open stuff from your terminal\n\n\
 Usage:\n\n\
   $ opener <url/flag> \n\n\
 Options:\n\n\
   -v,  --version     output version number\n\
   -h,  --help        output usage information\n\
   -f,  --feedback    send a feedback\n\n\
 Example:\n\n\
   $ opener https://abranhe.com\n\
   \n\n";
}

/* CLI. */
int
main(int argc, char **argv) {
  char *arg = argv[1];

  if (argc == 1 || argc > 2) {
		fprintf(stderr, "\033[31mSee help for details. [$ opener --help]\033[0m\n");
    return 1;
  }

  if (argc == 2) {
    if (!strcmp(arg, "-v") || !strcmp(arg, "--version")) {
      printf("%s", "cli 1.0.0 ~ opener v2.0.0\n");
      return 0;
    }

    if (!strcmp(arg, "-h") || !strcmp(arg, "--help")) {
			printf("%s", show_help());
      return 0;
    }

    if (!strcmp(arg, "-f") || !strcmp(arg, "--feedback")) {
			opener("https://feedback.abranhe.com/?project=opener");
      return 0;
    }
	}
  
	opener(arg);
  return 0;
}
