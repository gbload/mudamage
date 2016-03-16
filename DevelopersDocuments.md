# It is documents for developers.
# About MUDamage7 #
  * MUDamage is the damage calculation tool for mu online.
  * MUDamage7 is Flash, and developed in ActionScript.
  * MUDamage8 stopped developing.

# Envrionment #
  * Flex 4 SDK (required)

It is downloaded from Adobe site.

Adobe Flex SDK:
http://opensource.adobe.com/wiki/display/flexsdk/Downloads

# Build #
You can build MUDamage7 in Japanese as follow:
```
$ {Flex SDK}/flex_sdk_4.5.1.21328/bin/mxmlc -static-link-runtime-shared-libraries=true {MUDamage7}/src/MUDamage7.mxml -output {MUDamage7}/target/bin-debug/MUDamage7.swf
```
{Flex SDK} : The folder installed "Flex SDK".

{MUDamage7} : The folder downloaded "MUDamage7".

MUDamage7.swf will be generated in "{MUDamage7}/target/bin-debug/".

# Translation and Build in English #
You can translate and build MUDamage7 in English as follow:

0. Change directory in "{MUDamage7}/tool/translator/english/" as follow:
```
$ cd "{MUDamage7}/tool/translator/english/"
```
1. Extract japanese words from source codes as follow:
```
$ sh extract.sh
```
2. You add translations in "./translation\_text/ja2en.txt".
Then add it to ja2en\_all.txt as follow:
```
$ sh commit.sh
```
3. Embed it into source codes as follow:
```
$ sh en_embed.sh
```
And you can find "src\_en" directory.

4. Build MUDamage7 in English as follow:
```
$ sh build_en.sh
```