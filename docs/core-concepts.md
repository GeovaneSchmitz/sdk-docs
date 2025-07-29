# Core Concepts

Understanding these two concepts is key to building with Datallog.

### Steps

A Datallog application is a workflow composed of one or more **steps**.

  - Each step is a Python function decorated with either `@core_step` or `@step`.
  - The `@core_step` decorator marks the entry point of your application.
  - Steps pass data to each other by returning a serializable JSON object. The output of one step becomes the input (`seed`) of the next.

### Automatic Parallelization

Datallog can automatically parallelize your workflow.

  - If a step returns a **list** of items, Datallog will invoke the next step for **each item in parallel**.
  - This "forking" behavior allows you to process large datasets efficiently without writing any complex concurrency code.

To deploy your application to the cloud, you would use the `datallog login` and `datallog push` commands. Check the command help (`datallog <command> --help`) for more details. Happy coding\! ✨