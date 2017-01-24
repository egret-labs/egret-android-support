##Egret Android Support Release Notes 
---

### Egret Android Support 4.0.1 Release Notes
--
Updated: January 24, 2017

miniSDKVersion:14

- **[Add]** Added image picker feature(Please refer to the Developer Center to get instructions).
- **[Add]** Support for converting ArrayBuffer or Base64 to textures(Please refer to the Developer Center to get instructions).
- **[Fix]** Fixed setting the transparency of the vector illustration is invaild after opening CmdBatch.
- **[Fix]** Fixed issues related to hot update.
- **[Fix]** Fixed the filter shader can not be compiled on some phone models.
- **[Fix]** Fixed the input box may be obscured by the keyboard before starting editing.
- **[Fix]** Fixed WebSocket can not connect to a non-default port that appeared in the last version.
- **[Fix]** Fixed bugs.

### Egret Android Support 4.0.0 Release Notes
--
Updated: January 09, 2017

miniSDKVersion:14

- **[Add]** Added support for wss protocol.
- **[Fix]** Edit template for custom hot-update methods, set old version of hot-update as default.
- **[Fix]** Fixed game version record would be updated even if hot-update is not finished successfully.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.2.6 Release Notes
--
Updated: December 27, 2016

miniSDKVersion:14

- **[Update]** Add template for custom hot-update methods.
- **[Update]** Https request would not need to verificate certificates.
- **[Fix]** Fixed the application could not launch again after hot-update failed.
- **[Fix]** Fixed GameLoadingView doesn't show up if run game with local zip.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.2.5 Release Notes
--
Updated: December 13, 2016

miniSDKVersion:14

- **[Fix]** Fixed GameLoadingView doesn't show up if hot-update is not proceed appeared in 3.2.4.
- **[Fix]** Fixed input box is sheltered after changing the hierarchy of GLSurfaceView.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.2.4 Release Notes
--
Updated: November 29, 2016

miniSDKVersion:14

- **[Fix]** Fixed setting start time of audios sometimes invalid.
- **[Fix]** Fixed rendering of filters.
- **[Fix]** Override the hot update logic, consider the network disconnect and other cases.
- **[Fix]** Fixed setting input box to single line sometimes invalid.
- **[Add]** Added optimization switch for rendering textures.
- **[Add]** Added Splash features. Applications display a picture instantly at start. Usage is in the comments in SplashActivity.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.2.3 Release Notes
--
Updated: November 15, 2016

miniSDKVersion:14

- **[Fix]** Fixed setting volume of audios is useless.
- **[Fix]** Fixed part of audios could not play caused by actively stop audios repeatedly.
- **[Fix]** Fixed games crashed on some Android simulator.
- **[Fix]** Fixed cursor would not be the end of the text when input box got focus.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.2.2 Release Notes
--
Updated: November 01, 2016

miniSDKVersion:14

- **[Fix]** Fixed rendering problems under specific cases.
- **[Fix]** Fixed text shows wrong color when editting input box with prompt text at the first time.
- **[Update]** Add a switch to optimize rendering efficiency(details: http://developer.egret.com/cn/github/egret-docs/Engine2D/native/other/index.html ).
- **[Fix]** Fixed bugs.

### Egret Android Support 3.2.1 Release Notes
--
Updated: October 18, 2016

miniSDKVersion:14

- **[Note]** This release optimized efficiency of rendering, if exception occurred when rendering, please close the optimization.
- **[Update]** Support modifying the game View hierarchy.
- **[Fix]** Fixed rendering problems under specific cases .
- **[Fix]** Fixed text position offset in some models.
- **[Fix]** Handled situation that the number of audios is excessive.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.2.0 Release Notes
--
Update: September, 27 2016

miniSDKVersion:14

- **[Note]** This release optimized efficiency of rendering, if exception occurred when rendering, please close the optimization.
- **[Add]** Supported filter rendering.
- **[Add]** Supported mesh rendering.
- **[Update]** Improved efficiency of the scene rendering.
- **[Update]** Improved stability.
- **[Fix]** Fixed text position shifts upward when rendering default font in some models.
- **[Fix]** Fixed there must be a hot update when starting the game at the first time .
- **[Fix]** Fixed bugs.

### Egret Android Support 3.1.8 Release Notes
--
Update：September 02, 2016

miniSDKVersion:14

- **[Fix]** Fixed prompt text in InputBox dont disappear while editting.
- **[Fix]** Fixed crash on playing audios.
- **[Update]** Improved stability.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.1.7 Release Notes
--
Update：August 25, 2016

miniSDKVersion:14

- **[Fixed]** Fixed crash on setting illegal value of color.
- **[Fixed]** Fixed crash on playing audios.
- **[Fixed]** Fixed unable to load online audios.
- **[Fixed]** Fixed audios cannot been released completely.
- **[Add]** Support italic text.
- **[Add]** Add ColorTransform Filter.

### Egret Android Support 3.1.6 Release Notes
--
Update：August 08, 2016

miniSDKVersion:14

- **[Fix]** Fixed the position of input box is wrong when height of input box and line height is different.
- **[Fix]** Fixed lag problem when multi sound effect are simultaneously playing.
- **[Update]** Improved stability.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.1.5 Release Notes
--
Update：July 25, 2016

miniSDKVersion:14

- **[update]** MinSdkVersion Level14 .
- **[Update]** Improved stability.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.1.4 Release Notes
--
Update：July 12, 2016

- **[Add]** Get battery info of device. 
- **[Update]** Improved stability.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.1.3 Release Notes
Update：June 27, 2016

- **[Update]** Improved stability.
- **[Fix]** crash caused by characters replacing in EUI label.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.1.2 Release Notes
--
Update：June 14, 2016

- **[Update]** Best experience of text input.
- **[Update]** Improved stability.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.1.1 Release Notes
--
Update：May 31, 2016

- **[Add]** support Video playback.
- **[Update]** Improved stability.
- **[Fix]** Fixed sound bugs on android 6.0.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.1.0 Release Notes
--
Update：May 17, 2016

- **[Update]** Improved stability.

### Egret Android Support 3.0.8 Release Notes
--
Update：May 04, 2016

- **[Update]** Improve render performance of Font related.
- **[Update]** Improved stability.
- **[Fix]** Fixed rendering error when a object is cached as bitmap.
- **[Fix]** Crash fix for no texture data.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.0.7 Release Notes
--
Update：April 18, 2016

- **[Update]** Improve render performance of Texture related.
- **[Update]** Improved stability.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.0.6 Release Notes
--
Update：April 05, 2016

- **[Add]** Add `OPTION_GAME_BACKGROUND` of GameOption.
- **[Update]** Improved stability.
- **[Update]** Update anti-aliasing feature in stroke line. 

### Egret Android Support 3.0.5 Release Notes
--
Update：March 22, 2016

- **[Update]** Improved stability.
- **[Update]** Improved accuracy of Bezier rending.
- **[Fix]**  bugs on usage of  Mask .
- **[Fix]** irregular exceptions throwing .
- **[Fix]** Fixed bugs.

### Egret Android Support 3.0.4 Release Notes
--
Update：March 09, 2016

- **[Update]** Improved stability.
- **[Update]** Improved performance of font rendering.
- **[Fix]** bugs on HTTP callback.
- **[Fix]** bugs on usage of cacheAsBitmap.

### Egret Android Support 3.0.3 Release Notes
--
Update：February 22, 2016

- **[Update]** Improved stability.
- **[Fix]** bugs on setTimeOut.
- **[Fix]** bugs on font stoke.
- **[Fix]** error on mask used with sharp.

### Egret Android Support 3.0.2 Release Notes
--
Update：January 25, 2016

- **[refactor]** SoundEngine
- **[Update]** Improved stability.
- **[Fix]** "to many objects" error on sound engine.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.0.1 Release Notes
--
Update：January 11, 2016

- **[Update]** Improved performance of toDataURL.
- **[Update]** Improved stability.
- **[Fix]** Some bugs on usage of ArrayBuffer.
- **[Fix]** Improved performance of rounded rectangle rending.
- **[Fix]** Fixed bugs.

### Egret Android Support 3.0.0 Release Notes
--
Update：January 04, 2016

「Note:This release is only a match for the version of Egret Engine 3.0, not available for webgl.」


### Egret Android Support 2.5.8 Release Notes
--
Update：December 31, 2015

- **[Update]** Improved performance of text rending.
- **[Update]** Improved stability.
- **[Fix]** Some bugs on arm64-v8a.
- **[Fix]** Audio-related bug. 
- **[Fix]** JNI-related bug. 
- **[Fix]** Font-related bug. 
- **[Fix]** Some bugs on Android2.3.5。
- **[Fix]** Fixed bugs.
- 
### Egret Android Support 2.5.7 Release Notes
--
Update：December 11, 2015

- **[Add]**  support arm64-v8,x86。
- **[Update]** update v8 version.
- **[Update]** Improved performance of loading image files.
- **[Fix]** Some memory leak problems.
- **[Fix]** Fixed bugs.

### Egret Android Support 2.5.6 Release Notes
--
Update：November 27, 2015

- **[Add]** New sound engine based on OpenSLES.
- **[Update]** Optimized sound module. 
- **[Update]** Optimized editbox view。
- **[Update]** Optimized accurate of circle drawing。
- **[Update]** Improved stability.
- **[Fix]** Replace '\t' with the blank character when converting XML to JSON to avoid a JSON paresing error.
- **[Fix]** Fixed bugs.

### Egret Android Support 2.5.5 Release Notes
--
Update：November 13, 2015

- **[Update]** Modify text render.
- **[Fix]** Fixed bugs.

### Egret Android Support 2.5.4 Release Notes
--
Update：November 6th, 2015

- **[Update]** Removed useless codes. 
- **[Update]** Optimized saveToFile,toDataUrl.
- **[Update]** Improved the stability of dirty rectangle mode.
- **[Fix]** Matrix related bug in Canvas.
- **[Fix]** Text display anomaly in Canvas.
- **[Fix]** Mask related bug under dirty rectangle mode.
- **[Fix]** Some memory leak problems.

### Egret Android Support 2.5.1 Release Notes
--
Update: October 23, 2015

- **[Add]** Dirty rectangle is supported. 
- **[Add]** Added getPixels.
- **[Update]** Removed useless codes.
- **[Update]** Improved stability.
- **[Fix]** Fixed the display discrepancy of stroke text on runtime and html5.
- **[Fix]** Fixed the occasional clip anomaly that occurs during catching as bitmap. 

### Egret Android Support 2.5.0 hotfix Release Notes
--
Update: September, 30th, 2015

- **[Add]** Added parsing support to XML. 
- **[Update]** Removed useless codes.
- **[Fix]** Fixed bugs.

### Egret Android Support 2.5.0 Release Notes
--
Update: September, 25th, 2015

- **[Add]** Support for Egret Engine v2.5.0.
- **[Update]** Enhanced stability.
- **[Update]** Removed useless codes.
- **[Update]** Improved mask-related performance. 
- **[Fix]** Audio-related bug. 
- **[Fix]** Mask-related bug.

### Egret Android Support 2.0.5 Release Notes
--
Update: August, 27  2015

- **[Update]** More stable. 
- **[Update]** Removed useless codes.
- **[Fix]** Other bugs.

### Egret Android Support 2.0.4 Release Notes
--
Update: August, 13  2015

- **[Add]** Screenshot.
- **[Add]** Support the key event of peripheral. 
- **[Update]** More stable. 
- **[Fix]**  Unable to use custom font. 
- **[Fix]** If font is not set, getting font size will lead to crash. 

### Egret Android Support 2.0.3 Release Notes
--
Update: July, 31 2015

- **[Add]** Texture's releasing and reloading video memory functions. 
- **[Update]** Optimized Nest module.
- **[Fix]** Threads synchronyzation related bug.
- **[Fix]** Image loading anomaly during app resumption. 

### Egret Android Support 2.0_final Release Notes
--
Update: July, 16 2015

- **[Add]** Support on Egret's own compressed texture.
- **[Add]** New text input mode improves input experience. 
- **[Add]** Rewrote network module.
- **[Update]** Refactored touch response module.
- **[Update]** JNI related structure.
- **[Update]** Life cycle management.
- **[Update]** Game resource management.
- **[Update]** Texture asynchronous loading.
- **[Update]** Graphics performance.
- **[Update]** RenderTexture's use of video memory.
- **[Update]** Math library.
- **[Update]** Memory management.
- **[Update]** Reduced text module's use of memory.
- **[Update]** Optimized game downloading and unzipping.
- **[Update]** Optimized texture memory management.
- **[Update]** Enhanced rendering performance.
- **[Fix]** RenderTexture BUG。
- **[Fix]** Some Nest module bugs.
- **[Fix]** Text display anomaly on Android 5.X.X.
- **[Fix]** JNI related memory problem.
- **[Fix]** File downloading failures on some cellphone types.
- **[Fix]** RenderTexture creating failure on some cellphone types.
- **[Fix]** Other bugs.

### Egret Android Support 2.0.1 Release Notes
--
Update: July, 2 2015

- **[Update]** Improved performance and stability.
- **[Update]** Refactor network module.
- **[Update]** Refactor touch process module.
- **[Fix]** A bug in Download module.
- **[Fix]** Bugs in Nest module.

##Egret Android Support Release Notes 
---
### Egret Android Support 2.0.0 Release Notes
--
Update: June, 19 2015

- **[Add]** Support on Egret's own compressed texture.
- **[Update]** Improved Graphics performance.
- **[Update]** RenderTexture's use of video memory.
- **[Fix]** A drawing anomaly of RenderTexture.
- **[Fix]** A bug on ColorTransform.
- **[Fix]** Other bugs.

---
### Egret Android Support 1.7.3 Release Notes
--
Update: June, 02 2015

- **[UPDATE]** Game resource management. 
- **[UPDATE]** Texture asynchronous loading
- **[FIX]** Abnormal display of scale9Grid.  
- **[FIX]** Crash caused by texture release.
- **[FIX]** Crash caused by EgretNativeUI. 

### Egret Android Support 1.7.2 Release Notes
--
Update: May, 20 2015

- **[UPDATE]** Math library
- **[UPDATE]** Memory management
- **[FIX]** Crash caused by RenderTexture
- **[FIX]** Possible deadlocks caused by asynchronous texture loading
- **[FIX]** Text display anomaly in Android 5.X.X systems
- **[FIX]** JNI related memory problems

### Egret Android Support 1.7.1 Release Notes
--
Update: May, 07 2015
- **[UPDATE]** Reduced text module's usage of memory 
- **[UPDATE]** Optimized game downloading and unzipping 
- **[UPDATE]** Optimized texture memory management
- **[FIX]** Fixed the bug of multiple memory leaks
- **[FIX]** Fixed a thread lock bug
- **[FIX]** Downloading failure on some types of devices 
- **[FIX]** RenderTexture cannot be created on some types of devices.

### Egret Android Support 1.7.0 Release Notes
--
Update: April, 24 2015
(Note: 1.7.0 is the stable version from 1.6.0 to 1.6.2CE)
- **[ADD]** Add file operation interface
- **[ADD]** Add text stroke interface
- **[ADD]** Add log level control interface
- **[UPDATE]** Refactor GameManager structure
- **[UPDATE]** Refactor GameEngine interface
- **[UPDATE]** Improvement of WebView support
- **[UPDATE]** Improve render performance
- **[FIX]** Bugs fix for stability improvements
- **[FIX]** Bug fix of mask position error
- **[FIX]** Serveral other bug fix

### Egret Android support 1.6.2 Release Notes
--
Updated: April, 09 2015
- **[UPDATE]** Improve render performance
- **[FIX]** Bugs fix for stability improvements

### Egret Android Support 1.6.1 Release Notes
--
Updated: March, 27 2015
- **[ADD]** Add file operation interface
- **[ADD]** Add text stroke interface
- **[ADD]** Add log level control interface
- **[UPDATE]** Refactor GameManager structure
- **[UPDATE]** Refactor GameEngine interface
- **[UPDATE]** Improvement of WebView support
- **[FIX]** Bug fix of mask position error
- **[FIX]** Serveral other bug fix