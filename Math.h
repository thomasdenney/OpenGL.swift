// Math.h
//
// Copyright 2014 Programming Thomas
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import <GLKit/GLKit.h>

typedef struct {
    GLfloat v[2];
} TDVector2;

typedef struct {
    GLfloat v[3];
} TDVector3;

typedef struct {
    GLfloat v[4];
} TDVector4;

typedef struct {
    GLfloat q[4];
} TDQuaternion;

typedef struct {
    GLfloat m[4];
} TDMatrix2;

typedef struct {
    GLfloat m[9];
} TDMatrix3;

typedef struct {
    GLfloat m[16];
} TDMatrix4;

extern const TDMatrix2 TDMatrix2Identity;
extern const TDMatrix3 TDMatrix3Identity;
extern const TDMatrix4 TDMatrix4Identity;

extern const GLboolean TDFalse;
extern const GLboolean TDTrue;

GLfloat * TDVector2Pointer(TDVector2 * vector);
GLfloat * TDVector3Pointer(TDVector3 * vector);
GLfloat * TDVector4Pointer(TDVector4 * vector);

GLfloat * TDMatrix2Pointer(TDMatrix2 * matrix);
GLfloat * TDMatrix3Pointer(TDMatrix3 * matrix);
GLfloat * TDMatrix4Pointer(TDMatrix4 * matrix);

extern inline TDMatrix4 TDMatrix4Make(float m00, float m01, float m02, float m03, float m10, float m11, float m12, float m13, float m20, float m21, float m22, float m23, float m30, float m31, float m32, float m33);
extern inline TDMatrix4 TDMatrix4MakeAndTranspose(float m00, float m01, float m02, float m03, float m10, float m11, float m12, float m13, float m20, float m21, float m22, float m23, float m30, float m31, float m32, float m33);
extern inline TDMatrix4 TDMatrix4MakeWithArray(float values[16]);
extern inline TDMatrix4 TDMatrix4MakeWithArrayAndTranspose(float values[16]);
extern inline TDMatrix4 TDMatrix4MakeWithRows(TDVector4 row0, TDVector4 row1, TDVector4 row2, TDVector4 row3);
extern inline TDMatrix4 TDMatrix4MakeWithColumns(TDVector4 column0, TDVector4 column1, TDVector4 column2, TDVector4 column3);
extern inline TDMatrix4 TDMatrix4MakeWithQuaternion(TDQuaternion quaternion);
extern inline TDMatrix4 TDMatrix4MakeTranslation(float tx, float ty, float tz);
extern inline TDMatrix4 TDMatrix4MakeScale(float sx, float sy, float sz);
extern inline TDMatrix4 TDMatrix4MakeRotation(float radians, float x, float y, float z);
extern inline TDMatrix4 TDMatrix4MakeXRotation(float radians);
extern inline TDMatrix4 TDMatrix4MakeYRotation(float radians);
extern inline TDMatrix4 TDMatrix4MakeZRotation(float radians);
extern inline TDMatrix4 TDMatrix4MakePerspective(float fovyRadians, float aspect, float nearZ, float farZ);
extern inline TDMatrix4 TDMatrix4MakeFrustum(float left, float right, float bottom, float top, float nearZ, float farZ);
extern inline TDMatrix4 TDMatrix4MakeOrtho(float left, float right, float bottom, float top, float nearZ, float farZ);
extern inline TDMatrix4 TDMatrix4MakeLookAt(float eyeX, float eyeY, float eyeZ, float centerX, float centerY, float centerZ, float upX, float upY, float upZ);
extern inline TDMatrix3 TDMatrix4GetMatrix3(TDMatrix4 matrix);
extern inline TDMatrix2 TDMatrix4GetMatrix2(TDMatrix4 matrix);
extern inline TDVector4 TDMatrix4GetRow(TDMatrix4 matrix, int row);
extern inline TDVector4 TDMatrix4GetColumn(TDMatrix4 matrix, int column);
extern inline TDMatrix4 TDMatrix4SetRow(TDMatrix4 matrix, int row, TDVector4 vector);
extern inline TDMatrix4 TDMatrix4SetColumn(TDMatrix4 matrix, int column, TDVector4 vector);
extern inline TDMatrix4 TDMatrix4Transpose(TDMatrix4 matrix);
extern inline TDMatrix4 TDMatrix4Invert(TDMatrix4 matrix, bool *isInvertible);
extern inline TDMatrix4 TDMatrix4InvertAndTranspose(TDMatrix4 matrix, bool *isInvertible);
extern inline TDMatrix4 TDMatrix4Multiply(TDMatrix4 matrixLeft, TDMatrix4 matrixRight);
extern inline TDMatrix4 TDMatrix4Add(TDMatrix4 matrixLeft, TDMatrix4 matrixRight);
extern inline TDMatrix4 TDMatrix4Subtract(TDMatrix4 matrixLeft, TDMatrix4 matrixRight);
extern inline TDMatrix4 TDMatrix4Translate(TDMatrix4 matrix, float tx, float ty, float tz);
extern inline TDMatrix4 TDMatrix4TranslateWithVector3(TDMatrix4 matrix, TDVector3 translationVector);
extern inline TDMatrix4 TDMatrix4TranslateWithVector4(TDMatrix4 matrix, TDVector4 translationVector);
extern inline TDMatrix4 TDMatrix4Scale(TDMatrix4 matrix, float sx, float sy, float sz);
extern inline TDMatrix4 TDMatrix4ScaleWithVector3(TDMatrix4 matrix, TDVector3 scaleVector);
extern inline TDMatrix4 TDMatrix4ScaleWithVector4(TDMatrix4 matrix, TDVector4 scaleVector);
extern inline TDMatrix4 TDMatrix4Rotate(TDMatrix4 matrix, float radians, float x, float y, float z);
extern inline TDMatrix4 TDMatrix4RotateWithVector3(TDMatrix4 matrix, float radians, TDVector3 axisVector);
extern inline TDMatrix4 TDMatrix4RotateWithVector4(TDMatrix4 matrix, float radians, TDVector4 axisVector);
extern inline TDMatrix4 TDMatrix4RotateX(TDMatrix4 matrix, float radians);
extern inline TDMatrix4 TDMatrix4RotateY(TDMatrix4 matrix, float radians);
extern inline TDMatrix4 TDMatrix4RotateZ(TDMatrix4 matrix, float radians);
extern inline TDVector3 TDMatrix4MultiplyVector3(TDMatrix4 matrixLeft, TDVector3 vectorRight);
extern inline TDVector3 TDMatrix4MultiplyVector3WithTranslation(TDMatrix4 matrixLeft, TDVector3 vectorRight);
extern inline TDVector3 TDMatrix4MultiplyAndProjectVector3(TDMatrix4 matrixLeft, TDVector3 vectorRight);
extern inline void TDMatrix4MultiplyVector3Array(TDMatrix4 matrix, TDVector3 *vectors, size_t vectorCount);
extern inline void TDMatrix4MultiplyVector3ArrayWithTranslation(TDMatrix4 matrix, TDVector3 *vectors, size_t vectorCount);
extern inline void TDMatrix4MultiplyAndProjectVector3Array(TDMatrix4 matrix, TDVector3 *vectors, size_t vectorCount);
extern inline TDVector4 TDMatrix4MultiplyVector4(TDMatrix4 matrixLeft, TDVector4 vectorRight);
extern inline void TDMatrix4MultiplyVector4Array(TDMatrix4 matrix, TDVector4 *vectors, size_t vectorCount);
extern inline TDMatrix3 TDMatrix3Make(float m00, float m01, float m02, float m10, float m11, float m12, float m20, float m21, float m22);
extern inline TDMatrix3 TDMatrix3MakeAndTranspose(float m00, float m01, float m02, float m10, float m11, float m12, float m20, float m21, float m22);
extern inline TDMatrix3 TDMatrix3MakeWithArray(float values[9]);
extern inline TDMatrix3 TDMatrix3MakeWithArrayAndTranspose(float values[9]);
extern inline TDMatrix3 TDMatrix3MakeWithRows(TDVector3 row0, TDVector3 row1, TDVector3 row2);
extern inline TDMatrix3 TDMatrix3MakeWithColumns(TDVector3 column0, TDVector3 column1, TDVector3 column2);
extern inline TDMatrix3 TDMatrix3MakeWithQuaternion(TDQuaternion quaternion);
extern inline TDMatrix3 TDMatrix3MakeScale(float sx, float sy, float sz);
extern inline TDMatrix3 TDMatrix3MakeRotation(float radians, float x, float y, float z);
extern inline TDMatrix3 TDMatrix3MakeXRotation(float radians);
extern inline TDMatrix3 TDMatrix3MakeYRotation(float radians);
extern inline TDMatrix3 TDMatrix3MakeZRotation(float radians);
extern inline TDMatrix2 TDMatrix3GetMatrix2(TDMatrix3 matrix);
extern inline TDVector3 TDMatrix3GetRow(TDMatrix3 matrix, int row);
extern inline TDVector3 TDMatrix3GetColumn(TDMatrix3 matrix, int column);
extern inline TDMatrix3 TDMatrix3SetRow(TDMatrix3 matrix, int row, TDVector3 vector);
extern inline TDMatrix3 TDMatrix3SetColumn(TDMatrix3 matrix, int column, TDVector3 vector);
extern inline TDMatrix3 TDMatrix3Transpose(TDMatrix3 matrix);
extern inline TDMatrix3 TDMatrix3Invert(TDMatrix3 matrix, bool *isInvertible);
extern inline TDMatrix3 TDMatrix3InvertAndTranspose(TDMatrix3 matrix, bool *isInvertible);
extern inline TDMatrix3 TDMatrix3Multiply(TDMatrix3 matrixLeft, TDMatrix3 matrixRight);
extern inline TDMatrix3 TDMatrix3Add(TDMatrix3 matrixLeft, TDMatrix3 matrixRight);
extern inline TDMatrix3 TDMatrix3Subtract(TDMatrix3 matrixLeft, TDMatrix3 matrixRight);
extern inline TDMatrix3 TDMatrix3Scale(TDMatrix3 matrix, float sx, float sy, float sz);
extern inline TDMatrix3 TDMatrix3ScaleWithVector3(TDMatrix3 matrix, TDVector3 scaleVector);
extern inline TDMatrix3 TDMatrix3ScaleWithVector4(TDMatrix3 matrix, TDVector4 scaleVector);
extern inline TDMatrix3 TDMatrix3Rotate(TDMatrix3 matrix, float radians, float x, float y, float z);
extern inline TDMatrix3 TDMatrix3RotateWithVector3(TDMatrix3 matrix, float radians, TDVector3 axisVector);
extern inline TDMatrix3 TDMatrix3RotateWithVector4(TDMatrix3 matrix, float radians, TDVector4 axisVector);
extern inline TDMatrix3 TDMatrix3RotateX(TDMatrix3 matrix, float radians);
extern inline TDMatrix3 TDMatrix3RotateY(TDMatrix3 matrix, float radians);
extern inline TDMatrix3 TDMatrix3RotateZ(TDMatrix3 matrix, float radians);
extern inline TDVector3 TDMatrix3MultiplyVector3(TDMatrix3 matrixLeft, TDVector3 vectorRight);
extern inline void TDMatrix3MultiplyVector3Array(TDMatrix3 matrix, TDVector3 *vectors, size_t vectorCount);
extern inline TDVector2 TDVector2Make(float x, float y);
extern inline TDVector2 TDVector2MakeWithArray(float values[2]);
extern inline TDVector2 TDVector2Negate(TDVector2 vector);
extern inline TDVector2 TDVector2Add(TDVector2 vectorLeft, TDVector2 vectorRight);
extern inline TDVector2 TDVector2Subtract(TDVector2 vectorLeft, TDVector2 vectorRight);
extern inline TDVector2 TDVector2Multiply(TDVector2 vectorLeft, TDVector2 vectorRight);
extern inline TDVector2 TDVector2Divide(TDVector2 vectorLeft, TDVector2 vectorRight);
extern inline TDVector2 TDVector2AddScalar(TDVector2 vector, float value);
extern inline TDVector2 TDVector2SubtractScalar(TDVector2 vector, float value);
extern inline TDVector2 TDVector2MultiplyScalar(TDVector2 vector, float value);
extern inline TDVector2 TDVector2DivideScalar(TDVector2 vector, float value);
extern inline TDVector2 TDVector2Maximum(TDVector2 vectorLeft, TDVector2 vectorRight);
extern inline TDVector2 TDVector2Minimum(TDVector2 vectorLeft, TDVector2 vectorRight);
extern inline bool TDVector2AllEqualToVector2(TDVector2 vectorLeft, TDVector2 vectorRight);
extern inline bool TDVector2AllEqualToScalar(TDVector2 vector, float value);
extern inline bool TDVector2AllGreaterThanVector2(TDVector2 vectorLeft, TDVector2 vectorRight);
extern inline bool TDVector2AllGreaterThanScalar(TDVector2 vector, float value);
extern inline bool TDVector2AllGreaterThanOrEqualToVector2(TDVector2 vectorLeft, TDVector2 vectorRight);
extern inline bool TDVector2AllGreaterThanOrEqualToScalar(TDVector2 vector, float value);
extern inline TDVector2 TDVector2Normalize(TDVector2 vector);
extern inline float TDVector2DotProduct(TDVector2 vectorLeft, TDVector2 vectorRight);
extern inline float TDVector2Length(TDVector2 vector);
extern inline float TDVector2Distance(TDVector2 vectorStart, TDVector2 vectorEnd);
extern inline TDVector2 TDVector2Lerp(TDVector2 vectorStart, TDVector2 vectorEnd, float t);
extern inline TDVector2 TDVector2Project(TDVector2 vectorToProject, TDVector2 projectionVector);
extern inline TDVector3 TDVector3Make(float x, float y, float z);
extern inline TDVector3 TDVector3MakeWithArray(float values[3]);
extern inline TDVector3 TDVector3Negate(TDVector3 vector);
extern inline TDVector3 TDVector3Add(TDVector3 vectorLeft, TDVector3 vectorRight);
extern inline TDVector3 TDVector3Subtract(TDVector3 vectorLeft, TDVector3 vectorRight);
extern inline TDVector3 TDVector3Multiply(TDVector3 vectorLeft, TDVector3 vectorRight);
extern inline TDVector3 TDVector3Divide(TDVector3 vectorLeft, TDVector3 vectorRight);
extern inline TDVector3 TDVector3AddScalar(TDVector3 vector, float value);
extern inline TDVector3 TDVector3SubtractScalar(TDVector3 vector, float value);
extern inline TDVector3 TDVector3MultiplyScalar(TDVector3 vector, float value);
extern inline TDVector3 TDVector3DivideScalar(TDVector3 vector, float value);
extern inline TDVector3 TDVector3Maximum(TDVector3 vectorLeft, TDVector3 vectorRight);
extern inline TDVector3 TDVector3Minimum(TDVector3 vectorLeft, TDVector3 vectorRight);
extern inline bool TDVector3AllEqualToVector3(TDVector3 vectorLeft, TDVector3 vectorRight);
extern inline bool TDVector3AllEqualToScalar(TDVector3 vector, float value);
extern inline bool TDVector3AllGreaterThanVector3(TDVector3 vectorLeft, TDVector3 vectorRight);
extern inline bool TDVector3AllGreaterThanScalar(TDVector3 vector, float value);
extern inline bool TDVector3AllGreaterThanOrEqualToVector3(TDVector3 vectorLeft, TDVector3 vectorRight);
extern inline bool TDVector3AllGreaterThanOrEqualToScalar(TDVector3 vector, float value);
extern inline TDVector3 TDVector3Normalize(TDVector3 vector);
extern inline float TDVector3DotProduct(TDVector3 vectorLeft, TDVector3 vectorRight);
extern inline float TDVector3Length(TDVector3 vector);
extern inline float TDVector3Distance(TDVector3 vectorStart, TDVector3 vectorEnd);
extern inline TDVector3 TDVector3Lerp(TDVector3 vectorStart, TDVector3 vectorEnd, float t);
extern inline TDVector3 TDVector3CrossProduct(TDVector3 vectorLeft, TDVector3 vectorRight);
extern inline TDVector3 TDVector3Project(TDVector3 vectorToProject, TDVector3 projectionVector);
extern inline TDVector4 TDVector4Make(float x, float y, float z, float w);
extern inline TDVector4 TDVector4MakeWithArray(float values[4]);
extern inline TDVector4 TDVector4MakeWithVector3(TDVector3 vector, float w);
extern inline TDVector4 TDVector4Negate(TDVector4 vector);
extern inline TDVector4 TDVector4Add(TDVector4 vectorLeft, TDVector4 vectorRight);
extern inline TDVector4 TDVector4Subtract(TDVector4 vectorLeft, TDVector4 vectorRight);
extern inline TDVector4 TDVector4Multiply(TDVector4 vectorLeft, TDVector4 vectorRight);
extern inline TDVector4 TDVector4Divide(TDVector4 vectorLeft, TDVector4 vectorRight);
extern inline TDVector4 TDVector4AddScalar(TDVector4 vector, float value);
extern inline TDVector4 TDVector4SubtractScalar(TDVector4 vector, float value);
extern inline TDVector4 TDVector4MultiplyScalar(TDVector4 vector, float value);
extern inline TDVector4 TDVector4DivideScalar(TDVector4 vector, float value);
extern inline TDVector4 TDVector4Maximum(TDVector4 vectorLeft, TDVector4 vectorRight);
extern inline TDVector4 TDVector4Minimum(TDVector4 vectorLeft, TDVector4 vectorRight);
extern inline bool TDVector4AllEqualToVector4(TDVector4 vectorLeft, TDVector4 vectorRight);
extern inline bool TDVector4AllEqualToScalar(TDVector4 vector, float value);
extern inline bool TDVector4AllGreaterThanVector4(TDVector4 vectorLeft, TDVector4 vectorRight);
extern inline bool TDVector4AllGreaterThanScalar(TDVector4 vector, float value);
extern inline bool TDVector4AllGreaterThanOrEqualToVector4(TDVector4 vectorLeft, TDVector4 vectorRight);
extern inline bool TDVector4AllGreaterThanOrEqualToScalar(TDVector4 vector, float value);
extern inline TDVector4 TDVector4Normalize(TDVector4 vector);
extern inline float TDVector4DotProduct(TDVector4 vectorLeft, TDVector4 vectorRight);
extern inline float TDVector4Length(TDVector4 vector);
extern inline float TDVector4Distance(TDVector4 vectorStart, TDVector4 vectorEnd);
extern inline TDVector4 TDVector4Lerp(TDVector4 vectorStart, TDVector4 vectorEnd, float t);
extern inline TDVector4 TDVector4CrossProduct(TDVector4 vectorLeft, TDVector4 vectorRight);
extern inline TDVector4 TDVector4Project(TDVector4 vectorToProject, TDVector4 projectionVector);
extern inline TDQuaternion TDQuaternionMake(float x, float y, float z, float w);
extern inline TDQuaternion TDQuaternionMakeWithVector3(TDVector3 vector, float scalar);
extern inline TDQuaternion TDQuaternionMakeWithArray(float values[4]);
extern inline TDQuaternion TDQuaternionMakeWithAngleAndAxis(float radians, float x, float y, float z);
extern inline TDQuaternion TDQuaternionMakeWithAngleAndVector3Axis(float radians, TDVector3 axisVector);
extern inline TDQuaternion TDQuaternionMakeWithMatrix3(TDMatrix3 matrix);
extern inline TDQuaternion TDQuaternionMakeWithMatrix4(TDMatrix4 matrix);
extern inline float TDQuaternionAngle(TDQuaternion quaternion);
extern inline TDVector3 TDQuaternionAxis(TDQuaternion quaternion);
extern inline TDQuaternion TDQuaternionAdd(TDQuaternion quaternionLeft, TDQuaternion quaternionRight);
extern inline TDQuaternion TDQuaternionSubtract(TDQuaternion quaternionLeft, TDQuaternion quaternionRight);
extern inline TDQuaternion TDQuaternionMultiply(TDQuaternion quaternionLeft, TDQuaternion quaternionRight);
extern inline TDQuaternion TDQuaternionSlerp(TDQuaternion quaternionStart, TDQuaternion quaternionEnd, float t);
extern inline float TDQuaternionLength(TDQuaternion quaternion);
extern inline TDQuaternion TDQuaternionConjugate(TDQuaternion quaternion);
extern inline TDQuaternion TDQuaternionInvert(TDQuaternion quaternion);
extern inline TDQuaternion TDQuaternionNormalize(TDQuaternion quaternion);
extern inline TDVector3 TDQuaternionRotateVector3(TDQuaternion quaternion, TDVector3 vector);
extern inline void TDQuaternionRotateVector3Array(TDQuaternion quaternion, TDVector3 *vectors, size_t vectorCount);
extern inline TDVector4 TDQuaternionRotateVector4(TDQuaternion quaternion, TDVector4 vector);
extern inline void TDQuaternionRotateVector4Array(TDQuaternion quaternion, TDVector4 *vectors, size_t vectorCount);
extern inline NSString* NSStringFromTDMatrix2(TDMatrix2 matrix);
extern inline NSString* NSStringFromTDMatrix3(TDMatrix3 matrix);
extern inline NSString* NSStringFromTDMatrix4(TDMatrix4 matrix);
extern inline NSString* NSStringFromTDVector2(TDVector2 vector);
extern inline NSString* NSStringFromTDVector3(TDVector3 vector);
extern inline NSString* NSStringFromTDVector4(TDVector4 vector);
extern inline NSString* NSStringFromTDQuaternion(TDQuaternion quaternion);
extern inline float TDMathDegreesToRadians(float degrees);
extern inline float TDMathRadiansToDegrees(float radians);
extern inline TDVector3 TDMathProject(TDVector3 object, TDMatrix4 model, TDMatrix4 projection, int *viewport);
extern inline TDVector3 TDMathUnproject(TDVector3 window, TDMatrix4 model, TDMatrix4 projection, int *viewport, bool *success);


@interface GLKBaseEffect (TD)

@property (nonatomic) TDVector4 td_lightModelAmbientColor;
@property (nonatomic) TDVector4 td_constantColor;

@end

@interface GLKEffectPropertyTransform (TD)

@property (nonatomic, assign) TDMatrix4 td_modelviewMatrix;
@property (nonatomic, assign) TDMatrix4 td_projectionMatrix;
@property (readonly) TDMatrix3 td_normalMatrix;

@end

@interface GLKEffectPropertyLight (TD)

@property (nonatomic, assign) TDVector4 td_position;
@property (nonatomic, assign) TDVector4 td_ambientColor;
@property (nonatomic, assign) TDVector4 td_diffuseColor;
@property (nonatomic, assign) TDVector4 td_specularColor;
@property (nonatomic, assign) TDVector3 td_spotDirection;

@end

@interface GLKEffectPropertyMaterial (TD)

@property (nonatomic, assign) TDVector4 td_ambientColor;
@property (nonatomic, assign) TDVector4 td_diffuseColor;
@property (nonatomic, assign) TDVector4 td_specularColor;
@property (nonatomic, assign) TDVector4 td_emissiveColor;

@end

@interface GLKEffectPropertyFog (TD)

@property (nonatomic, assign) TDVector4 td_color;

@end

@interface GLKReflectionMapEffect (TD)

@property (nonatomic, assign) TDMatrix3 td_matrix;

@end

@interface GLKSkyboxEffect (TD)

@property (nonatomic, assign) TDVector3 td_center;

@end
