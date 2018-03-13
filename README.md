# checkApp
Very simple bash script that verifies a service is listening on a particular port and notifies recipient(s) if down.

#### Usage:
```/bin/bash
./checkApp.sh ipAddress port email appName
./checkApp.sh localhost 8000 user@domain.com myApp
```

#### Usage with Crontab:
- Every two hours:
```/bin/bash
0 */2 * * * /root/checkApp/checkApp.sh localhost 8000 user@domain.com myApp
```
*Note: For cool info about configuring crontab, checkout https://crontab.guru/*
