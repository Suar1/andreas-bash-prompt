Custom Bash Prompt
==================

This script configures a colorful, Powerline-inspired Bash prompt.
It shows success/failure of the last command, the hostname, and the current working directory in a structured format.

Features
--------
- Shows green [*] if the last command succeeded
- Shows red [x] if the last command failed
- Displays the hostname in green
- Displays the current working directory in blue
- Uses Unicode box-drawing characters for a clean, structured look
- Applied automatically on every new Bash session

Example:

[*]-[MyHost]-[/etc]
└──> _

Installation
------------
1. Copy the script to your Linux machine.
2. Make it executable:
   chmod +x setup_prompt.sh
3. Run it:
   ./setup_prompt.sh

The script appends the configuration to your ~/.bashrc and activates the new prompt immediately.

One-liner Install (if hosted online)
------------------------------------
If you host the script on GitHub or a Gist, users can install directly with:
   curl -sSL https://raw.githubusercontent.com/yourrepo/setup_prompt.sh | bash

Uninstallation
--------------
To remove the prompt configuration:
1. Edit ~/.bashrc
2. Delete the section between:
   # ---- Custom Bash Prompt ----
   ...
   # ---- End Custom Bash Prompt ----
3. Reload your shell:
   source ~/.bashrc

Notes
-----
- Works only with Bash. Other shells (zsh, fish, etc.) are not affected.
- Script is idempotent: running it twice will not duplicate the config.

Enjoy your new Bash prompt! 🎨
