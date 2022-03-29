# Maintenance Utilities
This has been created to provide a space for all of our tooling.

## Create
To create a new utility:
1) Create a folder with a friendly name -- this name becomes the name of your script when it's time to run it.
2) Create a `run.mjs` which executes your code.
3) To utilize `zx`, add the following lines as the first couple within your `run.mjs`:
```javascript
#!/usr/bin/env zx
import 'zx/globals'
```
4) Each main `run.mjs` file needs to `export` as a `default` the main run function.


## Run
In order to run a maintenance script, make sure you are in the root folder and run:
```bash
$ yarn maintenance <script>
```

**Note:** `<script>` above refers to the top-level folder name within `/maintenance`.

## Example
There is a `hello` maintenance script that is created as a demonstration of the framework. Simply run the following to try it out:
```bash
$ yarn maintenance hello
```

The main `run.mjs` script takes the input from `/sources/someinput.txt`, uppercases it, and saves the final output in `/build/someoutput.txt`.

## Folder Structure
By default, everything within a script's folder is tracked by `git`, except for the `/build` folder. This is by design, as we don't necessarily need to track the final output of things if we have the source data + script to generate the output each time we need it. 
