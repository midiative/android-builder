FROM openjdk:11 as apk-builder

# setup build environment
ENV ANDROID_SDK_MANAGER  /android-manager
ENV ANDROID_SDK_ROOT  /android-sdk
ENV GRADLE_HOME  /gradle

RUN mkdir -p $ANDROID_SDK_ROOT
RUN mkdir -p $ANDROID_SDK_MANAGER
RUN mkdir -p $GRADLE_HOME

# install sdkmanager
WORKDIR $ANDROID_SDK_MANAGER
RUN wget -O cmdtools.zip https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip
RUN unzip cmdtools.zip

# update $PATH
ENV PATH="$ANDROID_SDK_MANAGER/cmdline-tools/bin:${PATH}"

# install gradle
WORKDIR $GRADLE_HOME
RUN wget -O gradle.zip https://services.gradle.org/distributions/gradle-7.2-bin.zip
RUN unzip  gradle.zip
RUN mv gradle-7.2 gradle

# update $PATH
ENV PATH="$GRADLE_HOME/gradle/bin:${PATH}"