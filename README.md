# comp2521-revision-session-questions

Practice problems for the 23T2 CSESoc COMP2521 revision session. Includes a mix of theory-based multiple choice questions and practical programming problems.

## Setup

This repository integrates with the [CSE Autotest system](https://github.com/COMP1511UNSW/autotest) as the problems are intended to be run through tests hosted on CSE servers using CSE Autotest.

To set up this repository locally for writing Autotest-compatible tests:

First clone the repository:

```bash
$ git clone https://github.com/Allynixtor/comp2521-revision-session.git
$ cd comp2521-revision-session
```

Then, run the following command to set up your environment:

```bash
$ ./setup.sh
```

This will attempt to install the [Autotest source code](https://github.com/COMP1511UNSW/autotest) in `/usr/local/bin/autotest`.

It will also create a symlink at `/usr/local/bin/autotest.sh` to the `autotest.sh` in this repo script so you can run it from anywhere. **Make sure you have `/usr/local/bin` in your `PATH`.**

## Problem Writing

To write a problem, go into the `./problems` directory, copy-paste the `problem_template` folder and rename it.

Let's look at each component of the problem folder:

```
problem_template
├── autotest
│   ├── other_files.c
│   ├── other_files.h
│   ├── test_problem_template.c
│   └── tests.txt
├── files
│   ├── Makefile
│   ├── other_files.c
│   ├── other_files.h
│   ├── problem_template.c
│   └── test_problem_template.c
├── solution
│   └── problem_template.c
└── main.md
```

The `autotest` directory contains the files that will be used to run autotest. It contains:

- `autotest/other_files.c`: A file containing functions you use to set up and run the problem and handle tasks that are not specific to the problem e.g. taking input from stdin, printing to stdout. You should modify or replace this file.
- `autotest/other_files.h`: A header for `other_files.c`. May include things like `#include`, `#define`, function prototypes etc. Links the `other_files.c` file to the `test_problem_template.c` file. You should modify or replace this file.
- `autotest/test_problem_template.c`: A file used to run the solver's code and get its result. The stdout outpu of this file will be used by autotest to compare the output of the solver with the expected output. You should modify this file.
- `autotest/tests.txt`: A file containing the tests for the problem. Used by autotest. You should add your tests to this file.

The `files` directory is the directory that will be made available to students to solve your problem. It contains:

- `files/other_files.c`, `files/other_files.h` and `files/test_problem_template.c`, all of which should be the same as the files in `autotest`. Make sure you keep them identical to the corresponding file in `autotest`.
- `files/Makefile`: Optional. You can delete this if you don't want to use it.
- `files/problem_template.c`: A template file for students to put their code in to solve the problem. You do not need to modify this file, but make sure you call the function inside this file in your `test_problem_template.c` file.

The `solution` directory contains a single file `problem_template.c` which looks like the `files/problem_template.c` file, but has a working solution to your problem. It is not made available to students. It is used by autotest to generate expected outputs from your test cases which will be used to test students' solutions. Code up your solution to your problem in this file.

The `main.md` file explains your problem to students attempting to solve it, input input format, output format, samples, how to run the program, and solution.

## Writing Test Cases

Once you have coded up your solution in `solution/problem_template.c`, write up test cases in `autotest/tests.txt`.

Then, generate expected outputs for your test cases:

```bash
$ cd solution
$ autotest.sh <problem_template> --generate_expected_output
```

where `<problem_template>` is the name of the directory containing your problem. If you are happy with the generated expected outputs, copy-paste the output into your `autotest/tests.txt` file.

Then try running autotest on your solution:

```bash
$ cd solution
$ autotest.sh <problem_template>
```

Students will run the same command, but from the `files` directory instead of the `solution` directory.
