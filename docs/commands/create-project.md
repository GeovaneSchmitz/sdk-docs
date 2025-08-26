# datallog create-project

The `datallog create-project` command initializes a new Datallog project in the current directory.

This command creates the core `project.yml` configuration file, which tracks all applications and settings for your project.

## Usage

```bash
datallog create-project [options] [<name>]
```

## Arguments

### `<name>`

- **Type:** `string`
- **Required:** No
- **Default:** `""` (empty string)

The optional name for the project. This name is used for identification purposes within the Datallog platform. If not provided, a default name will be assigned or can be set later in the `datallog.yml` file.

## Example

Initialize a new project in the current directory:

```bash
datallog create-project
```

Initialize a new project and give it a specific name:

```bash
datallog create-project my-awesome-project
```
