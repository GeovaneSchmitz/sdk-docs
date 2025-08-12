# How to Uninstall Datallog

This guide provides step-by-step instructions to completely remove the Datallog SDK and all associated components installed by the official script. The process involves removing the application files, cleaning up shell configurations, and uninstalling dependencies like `pyenv` and Docker.

-----

## Step 1: Remove the Datallog Application Directory

The main application files, including the `datallog` executable, are located in the `~/.datallog` directory. This is the first and most important component to remove.

Open your terminal and run the following command:

```bash
rm -rf ~/.datallog
```

-----

## Step 2: Clean Up Your Shell Configuration

The installer script adds environment variables to your shell's startup files (`.bashrc`, `.zshrc`, etc.) to make the `datallog` command available. You need to remove these lines.

### For Bash Shell

Remove the Datallog lines from `~/.bashrc` and `~/.bash_profile`:

```bash
# The 'sed' command edits the file in place to delete the matching lines.
# For macOS, you might need to use sed -i '' ...
sed -i '/datallog/d' ~/.bashrc
sed -i '/datallog/d' ~/.bash_profile
```

### For Zsh Shell

Remove the Datallog lines from `~/.zshrc`:

```bash
sed -i '/datallog/d' ~/.zshrc
```

### For Fish Shell

Remove the Datallog path from your Fish config:

```bash
fish -c "fish_user_paths -e \$HOME/.datallog/bin"
```

-----

## Step 3: Uninstall `pyenv`

The installer uses `pyenv` to manage Python versions. If you do not use `pyenv` for other projects, you can remove it.

### For Linux

1.  **Remove the `pyenv` directory:**

    ```bash
    rm -rf ~/.pyenv
    ```

2.  **Remove the `pyenv` configuration from your shell files:**

    ```bash
    # For Bash
    sed -i '/pyenv/d' ~/.bashrc
    sed -i '/PYENV_ROOT/d' ~/.bashrc

    # For Zsh
    sed -i '/pyenv/d' ~/.zshrc
    sed -i '/PYENV_ROOT/d' ~/.zshrc
    ```

### For macOS

If `pyenv` was installed via Homebrew, use the following command:

```bash
brew uninstall pyenv
```

-----

## Step 4: Uninstall Docker

Uninstalling Docker is a significant step. **Proceed only if you are sure you no longer need Docker for other applications.** The commands differ based on your operating system.

### For Debian and Ubuntu

1.  **Purge the Docker packages:**

    ```bash
    sudo apt-get purge docker-ce docker-ce-cli docker-buildx-plugin -y
    ```

2.  **Remove unused dependencies and Docker data:**

    ```bash
    sudo apt-get autoremove -y --purge
    sudo rm -rf /var/lib/docker
    sudo rm -rf /var/lib/containerd
    ```

3.  **Remove the Docker repository and GPG key:**

    ```bash
    sudo rm /etc/apt/sources.list.d/docker.list
    sudo rm /etc/apt/keyrings/docker.asc
    sudo apt-get update
    ```

### For Arch Linux and Manjaro

1.  **Stop the Docker service:**

    ```bash
    sudo systemctl stop docker.service
    sudo systemctl disable docker.service
    ```

2.  **Remove Docker packages and their dependencies:**

    ```bash
    sudo pacman -Rns docker docker-buildx
    ```

### For macOS

1.  **Quit Docker Desktop.**

2.  Drag the **Docker.app** from your `/Applications` folder to the Trash.

3.  For a complete cleanup of all Docker data, you can use the `uninstall` command from the terminal.

    ```bash
    /Applications/Docker.app/Contents/MacOS/uninstall
    ```

### For Fedora

The script installs `podman` instead of Docker on Fedora. If you want to remove it:

  * **For Fedora Workstation (DNF):**
    ```bash
    sudo dnf remove podman
    ```
  * **For Fedora Silverblue (rpm-ostree):**
    ```bash
    sudo rpm-ostree uninstall podman
    ```
    You will need to reboot after running this command.

-----

## Step 5: (Optional) Remove Other Dependencies

The script installs common development packages. You can remove them if you are certain they are not needed by other software on your system.

  * **For Debian/Ubuntu:**

    ```bash
    # Warning: These are common packages. Only remove if you're sure.
    # sudo apt-get purge build-essential git curl zlib1g-dev ...
    ```

  * **For Arch/Manjaro:**

    ```bash
    # Warning: These are common packages. Only remove if you're sure.
    # sudo pacman -Rns base-devel git curl ...
    ```

  * **For Fedora:**

    ```bash
    # Warning: These are common packages. Only remove if you're sure.
    # sudo dnf remove gcc git curl make ...
    ```

-----

## Step 6: Finalize Uninstallation

To ensure all changes take effect, **close and reopen your terminal session**. If you uninstalled Docker or other system-level services, it is highly recommended to **reboot your computer**.

You have now successfully uninstalled Datallog and its components from your system.