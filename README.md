# timestamp-cli-tools
Bash scripts to convert time between timestamp and various formats of datetime for Unix-like OS.

## Usage
1. Check help messages

   ```shell
   ./timestamp2date.sh -h
   # Usage: ./timestamp2date.sh <input>
   # <input>   A integer representing UNIX timestamp in unit of second or millisecond
   
   ./date2timestamp.sh -h
   # Usage: ./date2timestamp.sh <input>
   # <input>   A string representing date and time in the following formats: yyyymmdd, yyyymmddhhmmss, or yyyy-mm-dd hh:mm:ss
   ```
2. Some examples
   
   * timestamp2date.sh
   
     ```shell
     # convert a timestamp in unit of second to datetime
     ./timestamp2date.sh 1706190900
     # 2024-01-25 21:55:00
     
     # convert a timestamp in unit of millisecond to datetime, please be noticed that due to the limitations in os command `date` the millisecond part will be ignored
     ./timestamp2date.sh 1706190900001
     # 2024-01-25 21:55:00
     ```
   
   * date2timestamp.sh
   
     ```shell
     # get the current timestamp
     ./date2timestamp.sh
     # UNIX timestamp: 1706190900
     
     # convert a datetime string to timestamp
     ./date2timestamp.sh 20240125
     # UNIX timestamp: 1706112000
     ./date2timestamp.sh "2024-01-25 21:55:00"
     # UNIX timestamp: 1706190900
     ./date2timestamp.sh 20240125215500
     # UNIX timestamp: 1706190900
     ```
   
2. Move them to `/usr/local/bin` so you can reach them anywhere on the OS
   
   ```shell
   sudo mv ./timestamp2date.sh /usr/local/bin/timestamp2date
   sudo mv ./date2timestamp.sh /usr/local/bin/date2timestamp
   
   # now you can call them like
   timestamp2date -h
   date2timestamp -h
   ```
   
   
