# BatchCord
BatchCord is a discord clone entirely made in batch!

## Table of contents

* [Install](#Install)
* [Server Setup](#Server-Setup)
* [Troubleshooting](#Troubleshooting)


### Install

1. Download the BatchCord V1.0 Release
2. Run the installer .EXE
3. Extract extract the following .ZIP files (keep the resulting folders with the rest!)
   - Prog.zip
   - Servers.zip
   - users.zip
4. Run BatchCordLauncher.exe
5. Create a user
6. Install Finished!

### Server-Setup

1. Create an FTP server
2. Login to the FTP server
3. Create a file named Chat.txt in the folder BatchCord is installed in (If it doesn't already exist)
4. Copy that file to the root directory of your FTP server
5. Run BatchCordLauncher.exe
6. Login
7. Enter the hostname, password and username for the FTP server
8. Type `[Server]` into the message box
9. Enter any number that isn't already linked to a server
10. Enter the hostname, password and username for the FTP server
11. Your server is ready to use!

### Troubleshooting

#### BatchCordLauncher.exe doesn't exist!
This happens because the EXE was written in batch and that makes Windows security think it's a virus so it deletes the file.
Here is how to solve this problem:
1. Open Windows security
2. Go to 'Protection history'
3. Click on the top threat
4. Select 'Allow on device'
5. Click on the Threat bellow that one
6. Select 'Restore'
7. The EXE should now be in your installation folder!

#### I get the ERROR 'Permission denied' in the console window
This can happen for two reasons:
 - Chat.txt doesn't exist on the FTP server
 - You don't have permission to upload/download files from the specified FTP server

To check which one it is do the following:
1. Open an FTP client
2. Connect to the specified FTP server
3. Check if there is the file 'Chat.txt' in the root directory
##### The file DOESN'T exist
1. Open an FTP client
2. Connect to the specified FTP server
3. Drag Chat.txt from your installation folder into the FTP server's root directory (Or create it if it doesn't exist)
##### The file DOES exist
You will need to update the permissions on the FTP server to allow read and write.
