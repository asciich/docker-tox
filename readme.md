# tox container

Container to test Python packages using tox.

To test packages:

* Mount your directory to ```/test```
* Call the ```test_in_tox``` script with the path to the ```.tox``` file (relative to the /test/ directory)

Example for running tox in current directory:

```
docker run --rm -v $(pwd):/test/ -it asciich/tox test_in_tox .
```
