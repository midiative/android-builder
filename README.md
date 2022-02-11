# android-builder 

Build android apps in docker. This is usually used as a base image in multilayer builds. 

## Getting Started


### Usage

Update android sdk:

```shell
RUN sdkmanager --sdk_root=$ANDROID_SDK_ROOT  --update
```

Install sdk components: 
```shell
RUN sdkmanager --sdk_root=$ANDROID_SDK_ROOT  \
    "build-tools;32.0.0" \
    "build-tools;30.0.2" \
    "platforms;android-30" \
    "platforms;android-31" \
    "platform-tools"
```

Accept sdk license: 
```shell
RUN  yes | sdkmanager  --sdk_root=$ANDROID_SDK_ROOT --licenses
```


#### Environment Variables

* `ANDROID_SDK_MANAGER` - Android sdk manager root (default: /android-manager)
* `ANDROID_SDK_ROOT` - Android sdk root /android-sdk
* `GRADLE_HOME` - Gradle root /gradle

#### Volumes

* `/android-sdk` - Android sdk root 


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.