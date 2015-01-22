# Instabug Titanium Module

## Description

Instabug for Titanium is a Module that allows you to use all function of Instabug Framework for iOS inside your Titanium App.
The module is licensed under the MIT license.

## Quick Start

### Get it [![gitTio](http://gitt.io/badge.png)](http://gitt.io/component/itk.instabug)
Download the latest distribution ZIP-file and consult the [Titanium Documentation](http://docs.appcelerator.com/titanium/latest/#!/guide/Using_a_Module) on how install it, or simply use the [gitTio CLI](http://gitt.io/cli):

`$ gittio install itk.instabug`

**or Find the newest version in the dist folder**

### Use it
Explain how to use your module

## Referencing the module in your Ti mobile application

Simply add the following lines to your `tiapp.xml` file:

    <modules>
        <module platform="iphone">itk.instabug</module>
    </modules>

### startService

To Start Instabug Service, just call the startService method, and provide your Token, which you can obtain from [instabug.com](www.instabug.com). 

```javascript
var instabug = require("itk.instabug");
instabug.startService({
	token : "yourtoken"
});
```

## APIs

###Theme Customization

- setHeaderColor(value)
- setHeaderColor(value)
- setHeaderFontColor(value)
- setButtonsColor(value)
- setButtonsFontColor(value)
- setTextBackgroundColor(value)
- setTextFontColor(value)
- setDefaultEmail(value)
- setFeedbackHeaderText(value)
- setFeedbackSentAlertText(value)
- setFeedbackSentAlertTitle(value)

####Values are hex color codes

###Custom Logging

-IBGLog(value) Allows you to send custom Log to Instabug Report
-setUserData(value)
-attachFileAtLocation(filePath)

###Direct Invocation
- invoke
- invokeBugReporter
- invokeFeedbackSender
- invokeFeedbackSenderViaEmail

###Shaking Threshold
-setiPhoneShakingThreshold(value)
-setiPadShakingThreshold(value)

###Setting Locale

-setLocale(value)

####Locale Values
- IBGLocaleArabic
- IBGLocaleChineseSimplified
- IBGLocaleChineseTraditional
- IBGLocaleEnglish
- IBGLocaleFinnish
- IBGLocaleFrench
- IBGLocaleGerman
- IBGLocaleItalian
- IBGLocaleJapanese
- IBGLocaleKorean
- IBGLocalePolish
- IBGLocalePortuguese
- IBGLocalePortugueseBrazil
- IBGLocaleRussian
- IBGLocaleSlovenian
- IBGLocaleSpanish
- IBGLocaleSwedish
- IBGLocaleTurkish

## Initial Customization

You can customize the colors of the Instabug elements using the following properties

```javascript
instabug.startService({
	token : "yourtoken",
	buttonTextColor: "#HEXCOLOR",
	buttonBackgroundColor: "#HEXCOLOR",
	headerTextColor: "#HEXCOLOR",
	fromTextColor: "#HEXCOLOR",
	fromBackgroundColor: "#HEXCOLOR"
});
```

## Changelog
* v1.1.0
  * 64bit Support
  * New APIs
* v1.0.0
  * init


## Credits

All credits goes to [@instabug](http://github.com/instabug) for creating such an amazing library. :)

## Author

**InTheKloud Ltd.**
web: http://www.inthekloud.com


## License

    Copyright (c) 2015 InTheKloud

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
