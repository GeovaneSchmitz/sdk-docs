# datallog init

The `datallog init` command initializes a new Datallog deployment in the current directory.

This command creates the core `datallog.yml` configuration file, which tracks all applications and settings for your deployment.

## Usage

```bash
datallog init [options] [<name>]
```

## Arguments

### `<name>`

- **Type:** `string`
- **Required:** No
- **Default:** `""` (empty string)

The optional name for the deployment. This name is used for identification purposes within the Datallog platform. If not provided, a default name will be assigned or can be set later in the `datallog.yml` file.

## Example

Initialize a new deployment in the current directory:

```bash
datallog init
```

Initialize a new deployment and give it a specific name:

```bash
datallog init my-awesome-deployment
```
