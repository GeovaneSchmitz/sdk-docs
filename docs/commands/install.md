# datallog install

The `datallog install` command installs Python packages into the deployment's environment. Datallog ensures these packages are available to all applications when they are run locally or deployed to the cloud.

You can install packages individually by name or by providing a standard `requirements.txt` file.

## Usage

```sh
datallog install [options] <package> ...
```

## Arguments & Options

The command requires you to specify packages using one of the following mutually exclusive options.

### `<packages>`

- **Type:** `string` (list)
- **Required:** Yes (if `-r` is not used)

A space-separated list of one or more Python packages to install. You can specify versions just as you would with `pip`.

### `-r, --requirements <file>`

- **Type:** `string` (file path)
- **Required:** Yes (if packages are not listed directly)

The path to a requirements file (e.g., `requirements.txt`). This allows you to install a list of packages from a file, which is useful for managing projects with many dependencies.

## Examples

### Install packages directly

```sh
datallog install requests pandas
```

### Install a specific version of a package

```sh
datallog install "numpy==1.26.4"
```

### Install from a requirements file

Install all packages listed in a `requirements.txt` file located in the project root:

```sh
datallog install -r requirements.txt
```
