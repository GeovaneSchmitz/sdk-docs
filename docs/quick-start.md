# Quick Start

Welcome to Datallog\! This guide will get you from zero to a running micro-application in just a few minutes. Datallog allows you to write simple Python functions, called **steps**, and run them as a distributed application in the cloud. It handles all the complex infrastructure, so you can focus on your code.

### Prerequisites

::: tip
Before installing, it's a good idea to update your system packages to ensure you have the latest security patches and dependencies.
#### Linux
You can update your system packages using the following commands based on your distribution:
##### Ubuntu/Debian

```bash
sudo apt-get update && sudo apt-get upgrade -y
```
##### Fedora/RHEL/CentOS

```bash
sudo dnf update -y
```

##### Arch Linux

```bash
sudo pacman -Syu
```


#### macOS
on macOS you can update Homebrew and installed packages with:
```bash
brew update && brew upgrade
```
:::

### Windows (via WSL)

Datallog runs in a Linux environment. On Windows, you can achieve this using the **Windows Subsystem for Linux (WSL)**.

1.  **Install WSL**: Follow the [official Microsoft guide to install WSL](https://learn.microsoft.com/en-us/windows/wsl/install). We recommend installing the **Ubuntu** distribution.

Once WSL and Docker are set up, open your WSL terminal (e.g., Ubuntu) and follow the **Linux** installation instructions below.

### macOS

Ensure you have the [Homebrew](https://brew.sh/) package manager installed. The installer script will use it to manage dependencies.


### Linux

Ensure you have either the `curl` or `wget` command available. You can install them using your system's package manager (e.g., `sudo apt install curl wget`).

## Installation

Installing the Datallog SDK is a simple one-liner. The script will automatically install all necessary dependencies, including `pyenv`, Docker, and the Datallog CLI.

Open your terminal (or your WSL terminal on Windows) and run one of the following commands:

```bash
curl -SsLf https://raw.githubusercontent.com/Datallog/mwm-sdk-datallog/master/install.sh | bash
```

Or, if you prefer `wget`:

```bash
wget -qO- https://raw.githubusercontent.com/Datallog/mwm-sdk-datallog/master/install.sh | bash
```

After the installation is complete, **restart your terminal** for the `PATH` changes to take effect.

Verify the installation by checking the version:

```bash
datallog --version
```


## Creating Your First Application

Let's build a simple "Hello, World\!" application. 🚀

### 1\. Initialize a Deployment

First, create a new directory for your project, navigate into it, and initialize a Datallog deployment.

```bash
mkdir my-first-deployment && cd my-first-deployment
datallog init
```

This command creates a `datallog.yml` file, which manages your project's configuration and applications.

### 2\. Create an Application

Now, let's create a new micro-application within the deployment. We'll call it `hello-app`.

```bash
datallog create-app hello-app
```

This will create a new directory named `hello-app` with a default Python file inside.

### 3\. Write the Code

Open the `apps/hello-app/hello-app.py` file and replace its contents with the following code:

```python
from datallog import core_step, step

# The first step in our application.
# The `next_step` argument tells Datallog where to send the output.
@core_step(next_step="second_step")
def first_step(seed):
  """
  This function is the entry point and returns a simple string.
  The 'seed' argument is the initial data passed when the app is run.
  """
return seed["message"] if seed else "Hello, World!"

# The second and final step.
@step()
def second_step(text_input):
  """
  This function receives the output from 'first_step'
  and returns an uppercase version of it.
  """
  return text_input.upper()
```

### 4\. Run the Application
::: tip
You can provide initial seed data to your application in two ways:
- Use `--seed` for small, direct JSON values from the command line (e.g., `datallog run hello-app --seed '{"message": "Hello!"}'`).
- Use `--seed-file` for larger or more complex JSON data stored in a file (e.g., `datallog run hello-app --seed-file seed.json`).  
If you don't specify either option but a `seed.json` file exists in your application's directory, it will be used automatically.  
**Note:** `--seed` and `--seed-file` cannot be used together.
:::

You can run your application locally to test it. Use the `run` command followed by the application name.

```bash
datallog run hello-app
```

You should see output indicating the steps are being executed, with the final result being printed to the console.
