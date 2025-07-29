# datallog run

The `datallog run` command executes a specific application locally within the current deployment. This is the primary way to test and debug your application's logic before pushing it to the cloud.

## Usage

```sh
datallog run [options] <app_name>
```

## Arguments

### `<app_name>`

- **Type:** `string`
- **Required:** Yes

The name of the application to run. This must match the name of an application created with `datallog create-app`.

## Options

### `-s, --seed <seed>`

- **Type:** `string`
- **Default:** `None`

An optional seed value to pass as the initial input to the application's `@core_step`. This is useful for providing a small piece of data directly from the command line. This option cannot be used with `--seed-file`.

### `-f, --seed-file <seed_file>`

- **Type:** `string` (file path)
- **Default:** `seed.json` in the application's directory. If this file exists, its content will be passed as the initial data to the `@core_step` when running the app locally.

The path to a file containing the seed data for the application. This is ideal for providing larger or more complex JSON data as the initial input. This option cannot be used with `--seed`.

### `-p, --parallelism <n>`

- **Type:** `integer`
- **Default:** `1`

The number of parallel workers to use when executing the application. If a step returns a list, Datallog will process the items in that list using this many parallel workers.

### `-l, --log-to-dir <log_to_dir>`

- **Type:** `string` (directory path)
- **Default:** `None`

Specifies a directory where the output logs of the application run should be stored. This is useful for capturing detailed execution logs for later analysis.

## Examples

**Run the `hello-app` application:**

```sh
datallog run hello-app
```

**Run the app with a simple string as the seed data:**

```sh
datallog run user-processor -s "user-id-123"
```

**Run the app using a JSON file as the seed data:**

```sh
datallog run data-pipeline -f ./initial-data.json
```

**Run the app with 8 parallel workers and save the logs to a `run_logs` directory:**

```sh
datallog run image-resizer -p 8 -l ./run_logs
```
