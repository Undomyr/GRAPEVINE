# W2ETK - Wetware Enterprises Tool Kit

## Menu-driven set of tools that can be of use to players of the game Hackmud.
The Wetware Enterprises Tool will be made in ZSH-shell script code, using dialog-creator packages available on (most) major Linux
distributions. 
It will consist of a menu-driven interface, with the tools being available as selectable options through these menu's. 

To create the menu's and other dialog windows to either communicate status and confirmation messages to the user or to take in
input for further processing and/or branching through the menu's. 
Initially it will be written using ZSH-style shell code using the KDE Plasma KDialog package to create the dialog-windows.
Once this version is complete and fully debugged (or to a point that major performance and stability issues are no longer present)
it will be ported to use the Zenity dialog-window creator to allow users that do not use the KDE Plasma desktop to use W2ETK as well. 

Finally, upon completion of this second version another port will be created that will utilize the Dialog package that is present by default in most standard-package lists of major distros (and always present in their main repositories otherwise) to make W2ETK available to users that do not employ a desktop environment at all since Dialog runs in any XTERM-enabled CLI.

Timeframes for the primary version is as of yet unknown. For the Zenity and Dialog ports the same applies. 

Updates to the timeframe will appear here once I have one figured out.

**Tools Included**
    Tools that are to be included are currently limited to;
*1  Encryption Function that takes in either a plaintext file or reads from STDIN directly, then uses GPG to encrypt the input.
    Output can be a text-file including gpg signature file and SHA512-Checksum for verification and to facilitate authentication.
    While an option to output the ciphertext to STDOUT directly, output to a file is the advised output method.
*2  Decryption Function, to reverse the processes done by the Encryption function. It will take in a text file containing the 
    cipher-text. The checksum will be used to verify the integrity of the file and the signature file to authenticate the user.
    It does not take input from STDIN.
*3  **[FUNCTION 3]**
*4  **[FUNCTION 4]**
*5  Termination and cleanup function that will ensure there are no files lingering, which could be intercepted and used to
    decrease the security of the tools, and because it's good hygiene to clean up after oneself. Will delete all temporary files
    created by functions and will uset all assigned variables used. This will ensure that physical access to the machine that ran
    the tools will not contain any information any longer in the shape of values assigned to variables.
    
 **TO DO:**
*1   Write README for each function, going into more detail about their functioning (where not a security risk) and describing
     its syntax, options and arguments.
*2   Port to Zenity
*3   Port to Dialog
