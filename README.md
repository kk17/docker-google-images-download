# docker image google-images-download

This repo is used to build a docker image for [forked version](https://github.com/Joeclinton1/google-images-download) of python package [google-images-download](https://github.com/hardikvasa/google-images-download).

## Build docker image

```bash
docker build -t googleimagesdownload .
```

or you can just use the pre-build docker image:

```bash
docker pull registry-intl.ap-southeast-1.aliyuncs.com/kk17-public/googleimagesdownload
docker tag registry-intl.ap-southeast-1.aliyuncs.com/kk17-public/googleimagesdownload googleimagesdownload
```
## Usage


Please check the [Examples](https://google-images-download.readthedocs.io/en/latest/examples.html) from the Google Images Download documentation first.

For all the commands in the examples you can just add `docker run -it --rm -v $(pwd):/workspace` before the command to run it.

1. Passing all arguments from command line
   
```bash
docker run -it --rm -v $(pwd):/workspace googleimagesdownload -k "car" -sk 'red,blue,white' -l 10
```

1. Passing arguments from a config file
```bash
docker run -it --rm -v $(pwd):/workspace googleimagesdownload -cf example.json
```

*NOTE:* 
1. If you pass all the passing arguments from a config file, you can only use `-cf` or `--config_file` in command line. All the input argement should be defined in config file.
For all the avialable input arguments please refer to [Input Arguments — Google Images Download documentation](https://google-images-download.readthedocs.io/en/latest/arguments.html).

2. If download limit is over 100, you need to specify the chromedriver path from arguments. The the chromedriver path in the image is `/chromedriver/chromedriver`. Take the `merlion.json` as an example:
```json
{
    "Records": [
        {
            "keywords": "merlion",
            "limit": 250,
            "size": "large",
            "print_urls": true,
            "format": "jpg",
            "chromedriver": "/chromedriver/chromedriver"
        }
    ]
}
```
