#OpenGL.swift

If you try to create a new OpenGL ES project in Xcode using Swift you will find that all of the code is commented out. This is primarily because Swift doesn't support [union structs](http://stackoverflow.com/questions/24399191/glkmatrix4-and-other-similar-missing-in-swift) as they are inherently unsafe, however GLKit's math utilities heavily rely on them.

This project provides a drop in replacement for GLKit's math functions and types (it still uses them under the hood though). Instead of using `GLK*` types and functions you can now use `TD*` in Swift. As well as this the project also covers:

* Operator overloading so that matrix math is really simple
* Properties added via class extensions to all of GLKit's classes
* Wrappers around common OpenGL functions for submitting vertex and uniform data using the `TD*` matrix and vector types

##Installation

You'll need to add **Math.h**, **Math.m** and **Math-Swift.swift** to your Xcode project. In order for these to compile properly you'll need to add `#import "Math.h"` to your [bridging header](https://developer.apple.com/library/ios/documentation/swift/conceptual/buildingcocoaapps/MixandMatch.html).

##Example

```swift
let aspect = GLfloat(CGRectGetWidth(self.view.bounds) / CGRectGetHeight(self.view.bounds))
let projectionMatrix = TDMatrix4MakePerspective(GLKMathDegreesToRadians(65.0), aspect, 0.1, 100.0)
var modelViewMatrix = TDMatrix4MakeTranslation(0.0, 0.0, 1.5)
modelViewMatrix = TDMatrix4Rotate(modelViewMatrix, rotation, 1.0, 1.0, 1.0)

//If using GLKit
self.effect?.transform.td_projectionMatrix = projectionMatrix
self.effect?.transform.td_modelviewMatrix = modelViewMatrix

//If using raw shaders
let mvpMatrix = projectionMatrix * modelViewMatrix
glUniformMatrix4fv(mvpMatrixSlot, TDFalse, mvpMatrix)
```

##Contact

Either create an issue on GitHub or email me@programmingthomas.com.

##License

Apache v2, see LICENSE file.