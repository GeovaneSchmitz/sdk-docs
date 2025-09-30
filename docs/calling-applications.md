# Start Application API

This page details the REST API endpoint for starting a Datallog application remotely. This is useful for integrating Datallog workflows with other services or triggering them programmatically.

## Endpoint

To start an application, send a `POST` request to the following endpoint:

```
POST https://mwm.datallog.com/api/start-application/<project_name>/<app_name>
```

### Authentication

All API requests must be authenticated using a bearer token. You must include an `Authorization` and `X-Api-Key` header with your API token.

```http
Authorization: Token <YOUR_AUTHORIZATION_TOKEN>
X-Api-Key: <YOUR_X_API_KEY>
```

::: tip
You can generate and manage your API tokens from the **[Settings](http://mwm.datallog.com/preferences/settings)** section of your Datallog dashboard.
:::

## Path Parameters

| Parameter        | Type     | Required | Description                                                                                              |
| ---------------- | -------- | -------- | -------------------------------------------------------------------------------------------------------- |
| `<project_name>` | `string` | Yes      | The name of your project, as created with the `datallog create-project` command.                           |
| `<app_name>`     | `string` | Yes      | The name of the application within the project, as created with the `datallog create-app` command. |

## Request Body

The request body must be a JSON object with the following optional fields:

```ts
interface StartApplication {
  webhook?: string;
  webhook_header?: Record<string, string>;
  seed?: Record<string, any>;
}
```

| Field              | Type                      | Required | Description                                                                                                                                                                                                              |
| ------------------ | ------------------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `webhook`          | `string`                  | No       | A specific URL to which the final result of this execution will be sent. If this field is omitted or left blank, the default webhook configured for the application will be used.                                           |
| `webhook_header`   | `Record<string, string>`  | No       | A JSON object of key-value pairs representing custom HTTP headers to be sent with the webhook request. This can be used for authentication or for passing metadata.                                                      |
| `seed`             | `Record<string, any>`     | No       | The initial JSON data passed as an argument to the application's `@core_step`. This is the API equivalent of using the `--seed` or `--seed-file` argument when running an application with the Datallog CLI. |

::: tip
The `seed` data you provide here is passed directly to the first argument of your `@core_step` function. For example, if you send `{"seed": {"message": "Hello from API"}}`, the `seed` parameter in your Python function will be `{'message': 'Hello from API'}`.
:::

## Examples

Let's assume we have a project named `my-first-datallog-project` and an application named `hello-app`, as shown in the [Quick Start](https://www.google.com/search?q=./quick-start) guide.

### Example 1: Basic execution with seed data

This example starts the application and provides initial data to the `core_step`.

#### cURL

```bash
curl -X POST \
  https://mwm.datallog.com/api/start-application/my-first-datallog-project/hello-app \
  -H "Authorization: <YOUR_AUTHORIZATION_TOKEN>" \
  -H "X-Api-Key: <YOUR_X_API_KEY>" \
  -H "Content-Type: application/json" \
  -d '{
    "seed": {
      "message": "Hello from the API!"
    }
  }'
```

#### Python (`requests`)

```python
import requests
import json

authorization_token = "<YOUR_AUTHORIZATION_TOKEN>"
x_api_key = "<YOUR_X_API_KEY>"
project_name = "my-first-datallog-project"
app_name = "hello-app"

url = f"https://mwm.datallog.com/api/start-application/{project_name}/{app_name}"

headers = {
    "Authorization": authorization_token,
    "X-Api-Key": x_api_key,
    "Content-Type": "application/json"
}

payload = {
    "seed": {
        "message": "Hello from the API!"
    }
}

response = requests.post(url, headers=headers, data=json.dumps(payload))

print(response.status_code)
print(response.json())
```

### Example 2: Execution with a custom webhook

This example starts the application and directs the final output to a custom endpoint with a specific authentication header.

#### cURL

```bash
curl -X POST \
  https://mwm.datallog.com/api/start-application/my-first-datallog-project/hello-app \
  -H "Authorization: <YOUR_AUTHORIZATION_TOKEN>" \
  -H "X-Api-Key: <YOUR_X_API_KEY>" \
  -H "Content-Type: application/json" \
  -d '{
    "webhook": "https://my-service.com/datallog-results",
    "webhook_header": {
      "x-api-key": "my-secret-service-key"
    },
    "seed": {
      "message": "Data for my custom webhook"
    }
  }'
```

## Responses

### Success Response

On a successful request to start the application, the API will return a `202 Accepted` status code. The body will contain a unique `execution_id` that you can use to track the run's status.

  - **Code:** `200 OK` <br>
    **Description:** The application has been successfully started.
  - **Body:**

<!-- end list -->

```json
{
  "status": "success",
  "message": "Application 'hello-app' started successfully.",
  "execution_id": "exec_abc123def456"
}
```

### Error Responses

If the request fails, the API will return an appropriate error code and a descriptive message.

  - **Code:** `403 Forbidden` <br>
    **Reason:** The user does not have permission to access the specified project or application.

    ```json
    {
      "message":"This Project does not exist. consult API"
    }
    ```

  - **Code:** `403 Forbidden` <br>
    **Reason:** The user does not have permission to access the specified project or application.

    ```json
    {
      "message": "This Application does not exist. consult API."
    }
    ```

  - **Code:** `401 Unauthorized` <br>
    **Reason:** The request did not include valid authentication credentials.

    ```json
    {
      "detail": "Authentication credentials were not provided."
    }
    ```