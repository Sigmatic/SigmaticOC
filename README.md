
<h1 align="center">Sigmatic Objective-C</h1>

<p align="center">
<a href="https://travis-ci.org/Sigmatic/SigmaticOC"><img src="https://travis-ci.org/Sigmatic/SigmaticOC.svg?style=flat" alt="CI Status" /></a>
<a href="https://github.com/Sigmatic/SigmaticOC/issues"><img src="https://img.shields.io/github/issues/Sigmatic/SigmaticOC.svg?style=flat" alt="Issues" /></a>
<a href="https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html"><img src="https://img.shields.io/badge/language-Objective--C-blue.svg" alt="Objective-C" /></a>
<a href="https://www.apple.com/ios/"><img src="https://img.shields.io/badge/Platform-iOS%7COSX-blue.svg" alt="iOS" /></a>
<a href="https://github.com/Sigmatic/SigmaticOC/blobs/master/LICENSE.md"><img src="https://img.shields.io/badge/license-MIT-lightgrey.svg" alt="MIT License" /></a>
</p>

## Overview

Buttersmooth Objective-C for the Brave. Simple utils and extensions.

## Installation

SigmaticOC is available through [CocoaPods](http://cocoapods.org). To install the library, simply add the following line to your Podfile:
```ruby
pod "SigmaticOC"
```
<br />
Or if you are only interested in a subspec, use 
<br />
```ruby
pod "SigmaticOC/<Subspec>"
#example
pod "SigmaticOC/JSON"
```
##### Available Subspecs
- Array
- Bool
- Date
- Dictionary
- JSON
- Number
- Protocol
- String

###### Array

Method                              | Description
------------------------------------|-----------------
`-[NSArray objectsWithClass:]`      | All objects that are kind of class 
`-[NSArray sortUsingIndicesArray]`  | Sort using a reference array (7,2,8, sorted using 1,2,3,4,5,6,7,8 returns 2,7,8)
`-[NSArray uniqueObjects]`          | Unique objects in an array. Using the [NSArray containsObject:] to test uniqueness
`-[NSArray reverseArray]`           | Reversed array 1,2,3 return 3,2,1 
`-[NSArray randomObject]`           | Any random object
`-[NSArray isMutable]`              | Is of type NSMutableArray

Yo


## Documentation
There will be more documentation in the coming days

## Contribution
Can't say no to that!