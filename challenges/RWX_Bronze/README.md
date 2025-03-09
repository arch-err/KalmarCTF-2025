# RWX_Bronze
*We give you file read, file write and code execution. But can you get the flag? Let's start out gently.*
*NOTE: If you get a 404 error, try using one of the endpoints described in the handout!*

## Solution
1. We're given a handout that includes the full container running on the server. After looking around we figure out that we need to execute the `/would` program with a certain argument.
2. The webserver we're interacting with allows us to run commands (with the limit of a 7 character long command), and we can also read and write files. After numerous approaches at getting around this 7-char limit we figure out that if we can upload a shellscript to the server via the write-functionality, we can then run way longer commands, if we can execute the file we uploaded.
3. The next problem, obvoiusly, was to actually execute a file that we uploaded. We only have write-access to the `/tmp` directory, and running `sh /tmp/uploadedfile` is obviously way over our character-limit of 7. An easy fix is to upload a single character filename, that would get us down to `sh /tmp/x`, but this still takes 9 characters...
4. The final solution, we figured out, was to replace `tmp` with a wildcard, `*`; `sh /*/x`

**Command to upload the file with curl:**
`curl -X POST --data "/would \"you be so kind to provide me with a flag\"" https:/<server-address>/write'?'filename=/tmp/x`

**Command to run the file**
`curl https:/<server-address>/exec'?'cmd=$((echo "sh /*/x" | urlencode))`


## Flag
**Flag:** `kalmar{ok_you_demonstrated_your_rwx_abilities_but_let_us_put_you_to_the_test_for_real_now}`
