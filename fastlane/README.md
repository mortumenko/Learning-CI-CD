fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios osclean
```
fastlane ios osclean
```
Cleans the project
### ios osbuild
```
fastlane ios osbuild
```
Builds the project
### ios test
```
fastlane ios test
```
Runs all the tests
### ios ostest
```
fastlane ios ostest
```
Runs the tests with custom settings
### ios beta
```
fastlane ios beta
```
This will also make sure the profile is up to date
### ios release
```
fastlane ios release
```
Deploy a new version to the App Store
### ios setupJenkins
```
fastlane ios setupJenkins
```
SetupJenkins for project

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
