 ## Using enroot to pull custom docker images
 
To import a custom image from the [standard docker repository](https://hub.docker.com/):
 ```Bash
 enroot import --output [FILENAME].sqsh docker://[USER NAME]@registry.hub.docker.com#[USERNAME]/[REPOSITORY]
 ```
