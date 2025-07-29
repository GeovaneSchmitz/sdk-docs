# datallog push

The `datallog push` command deploys the current state of your deployment to the Datallog cloud service.

This command packages your applications, dependencies, and configuration from `datallog.yml` and uploads them to the platform, making them available to be run as a distributed cloud application. You must be logged in to use this command.

## Usage

```sh
datallog push
```

This command currently has no specific options, but you may need to be authenticated via `datallog login` first.

---

## Related Commands

### datallog sdk-update

The `datallog sdk-update` command checks for and installs the latest version of the Datallog CLI and SDK. It's good practice to run this periodically to ensure you have the newest features and bug fixes.

**Usage**

```sh
datallog sdk-update [options]
```
