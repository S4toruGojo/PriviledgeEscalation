# PriviledgeEscalation
Priviledge Escalation scripts for CALDERA on Kathara'

This repository contains scripts and code designed to achieve privilege escalation in Ubuntu 18.04 environments. There are two main scripts: `autonameHiding.sh` and `sudoFIX.sh`.

- autonameHiding.sh automates the process of renaming a process that needs to be hidden. To use it, place the script in the same directory as the target file, modify the script to change the process name and the file to be hidden.
  
- sudoFIX.sh fixes a vulnerability in `sudo` that enables privilege escalation. This script automatically searches for and modifies the `sudoers` file, making it easy to secure the system. Just download the script onto the target machine, and it will handle the rest.

NB: Both scripts must be pre-stored on the system and ready to execute before starting the process. The agents cannot perform these tasks independently, nor can they execute the necessary operations on their own; they can only trigger these scripts. Therefore, ensure that the scripts are prepared before beginning any operation, as modifications won't be possible once the procedure starts.

Additionally, there are several `.txt` files included that represent the abilities required by Caldera agents to perform privilege escalation (almost) autonomously. Since Caldera does not support all the actions necessary for privilege escalation by default, we included two key files: `shellPython.txt` and `reverseShell.txt`. 

- shellPython.txt outlines how to elevate a basic shell to a more functional Python-based shell, which is useful for tasks like file modification or bypassing output restrictions.
- reverseShell.txt provides instructions for setting up a reverse shell between two machines, a task that Caldera agents cannot perform directly.

For the other `.txt` files, simply copy and paste the commands into Caldera as new abilities, one for each file.

### Steps to Achieve Privilege Escalation in Caldera:

1. Launch an agent on the attacker's machine in background mode.
2. Open a reverse shell manually, using the commands from the `reverseShell.txt` file.
3. Launch a second agent in the reverse shell.
4. Execute the ability created from the `linpeas.txt` file.
5. Execute the ability created from the `sudoPE.txt` file.
6. Kill the agents and the reverse shell, then manually elevate the shell using the commands from the `shellPython.txt` file.
7. Launch a new agent on the attacker's machine.
8. Reopen another reverse shell with the same commands from `reverseShell.txt`.
9. Launch a new agent in the new reverse shell.
10. Re-execute the ability from the `sudoPE.txt` file to ensure consistency with the pre-attack state.
11. Execute the ability created from the `libprocesshider.txt` file.
12. Use an ability to launch the `autonameHiding.sh` script.
13. Execute the ability created from the `libprochiderLibrary.txt` file.
14. If you want to fix the vulnerability, in the same way of the step 12, use an ability to launch the `sudoFIX.sh` script.

NB: If you don’t need to elevate the shell's functionality in this environment, skip directly to step 11 after step 5.
