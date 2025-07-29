# datallog create-app

The `datallog create-app` command creates a new micro-application within an existing Datallog deployment.

:::info
This command should be run from the root directory of a deployment (i.e., where the `deploy.yml` file is located). It scaffolds a new directory under the `apps/` folder containing a boilerplate Python file for your application logic.
:::

## Usage

```sh
datallog create-app [options] <app_name>
```

## Arguments

### `<app_name>`

- **Type:** `string`
- **Required:** Yes

The name of the application you want to create. This name must be unique within the deployment. A directory with this name will be created to house the application's source code.

## Example

Create a new application named `process-invoices`:

```sh
datallog create-app process-invoices
```
After running this command, a new directory `apps/process-invoices/` will be created. It contains two files:
- `process-invoices.py`: The main file for your application logic.
- `seed.json`: A file where you can place the initial data to be passed to the `@core_step` when running the app locally.
