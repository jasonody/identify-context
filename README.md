# identify-context

As a mono-repo grows so does the end-to-end and integration test suites that are run during each release. Overtime, this can cause releases to take longer and increase the chances of intransient test failures (eg. when you're interacting with a 3rd party). A mono-repo doesn't doesn't contain bulkheads around what code is being deployed--it's all the code, every single time.

`identify.sh` is a shell script that uses the directory structure of the repo to identify what contexts contain changes in the most recent commit. The idea is to use this to determine what downstream testing in the pipeline needs to occur. If changes have occured outside of the contexts, an empty string it returned to indicate the whole test suite needs to be run. 

Give the latest commit (6d72ca2), executing `identify.sh` will return `accounts sales`.

Note: because this is a convention based approach, efforts will need to be taken (code reviews, linting, etc) to ensure code changes for a specific context are made in that context's folder.