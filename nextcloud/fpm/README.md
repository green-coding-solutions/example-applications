This benchmark runs the Nextcloud benchmark using the fpm proxy. You will need to run it with `--allow-unsafe` as
it relies on shared volumes to share data. This is not easily emulated in our tool.

You will also need to modify the `compose.yml` file under:
```
  web:
    volumes:
        - [PATH_TO_EXAMPLE_FOLDER]/nginx.conf:/etc/nginx/nginx.conf:ro

```
This is because when calling the GMT with `--allow-unsafe` we don't change anything on volume paths and this
will reference the tools directory.