// Math.m
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

#import "Math.h"

#import <GLKit/GLKit.h>

#pragma mark - Internal hacks

static inline TDVector2 _TDV2(GLKVector2 vec) {
    return (TDVector2)(*((TDVector2*)vec.v));
}

static inline GLKVector2 _GLKV2(TDVector2 vec) {
    return (GLKVector2)(*((GLKVector2*)vec.v));
}

static inline TDVector3 _TDV3(GLKVector3 vec) {
    return (TDVector3)(*((TDVector3*)vec.v));
}

static inline GLKVector3 _GLKV3(TDVector3 vec) {
    return (GLKVector3)(*((GLKVector3*)vec.v));
}

static inline TDVector4 _TDV4(GLKVector4 vec) {
    return (TDVector4)(*((TDVector4*)vec.v));
}

static inline GLKVector4 _GLKV4(TDVector4 vec) {
    return (GLKVector4)(*((GLKVector4*)vec.v));
}

static inline TDMatrix3 _TDM3(GLKMatrix3 mat) {
    return (TDMatrix3)(*((TDMatrix3*)mat.m));
}

static inline GLKMatrix2 _GLKM2(TDMatrix2 mat) {
    return (GLKMatrix2)(*((GLKMatrix2*)mat.m));
}

static inline TDMatrix2 _TDM2(GLKMatrix2 mat) {
    return (TDMatrix2)(*((TDMatrix2*)mat.m));
}

static inline GLKMatrix3 _GLKM3(TDMatrix3 mat) {
    return (GLKMatrix3)(*((GLKMatrix3*)mat.m));
}

static inline TDMatrix4 _TDM4(GLKMatrix4 mat) {
    return (TDMatrix4)(*((TDMatrix4*)mat.m));
}

static inline GLKMatrix4 _GLKM4(TDMatrix4 mat) {
    return (GLKMatrix4)(*((GLKMatrix4*)mat.m));
}

static inline TDQuaternion _TDQ(GLKQuaternion q) {
    return (TDQuaternion)(*((TDQuaternion*)q.q));
}

static inline GLKQuaternion _GLKQ(TDQuaternion q) {
    return (GLKQuaternion)(*((GLKQuaternion*)q.q));
}

#pragma mark - Constants

const TDMatrix2 TDMatrix2Identity = {1, 0, 0, 1};

const TDMatrix3 TDMatrix3Identity = {1, 0, 0,
                                     0, 1, 0,
                                     0, 0, 1};

const TDMatrix4 TDMatrix4Identity = {1, 0, 0, 0,
                                     0, 1, 0, 0,
                                     0, 0, 1, 0,
                                     0, 0, 0, 1};

const GLboolean TDFalse = GL_FALSE;
const GLboolean TDTrue = GL_TRUE;

#pragma mark - Pointer access

GLfloat * TDMatrix2Pointer(TDMatrix2 * matrix) {
    return (GLfloat*)matrix;
}

GLfloat * TDMatrix3Pointer(TDMatrix3 * matrix) {
    return (GLfloat*)matrix;
}

GLfloat * TDMatrix4Pointer(TDMatrix4 * matrix) {
    return (GLfloat*)matrix;
}

GLfloat * TDVector2Pointer(TDVector2 * vector) {
    return (GLfloat*)vector;
}

GLfloat * TDVector3Pointer(TDVector3 * vector) {
    return (GLfloat*)vector;
}

GLfloat * TDVector4Pointer(TDVector4 * vector) {
    return (GLfloat*)vector;
}

#pragma mark - Mapped GLKit functions

inline TDMatrix4 TDMatrix4Make(float m00, float m01, float m02, float m03, float m10, float m11, float m12, float m13, float m20, float m21, float m22, float m23, float m30, float m31, float m32, float m33) {
    return _TDM4(GLKMatrix4Make(m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33));
}

inline TDMatrix4 TDMatrix4MakeAndTranspose(float m00, float m01, float m02, float m03, float m10, float m11, float m12, float m13, float m20, float m21, float m22, float m23, float m30, float m31, float m32, float m33) {
    return _TDM4(GLKMatrix4MakeAndTranspose(m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33));
}

inline TDMatrix4 TDMatrix4MakeWithArray(float values[16]) {
    return _TDM4(GLKMatrix4MakeWithArray(values));
}

inline TDMatrix4 TDMatrix4MakeWithArrayAndTranspose(float values[16]) {
    return _TDM4(GLKMatrix4MakeWithArrayAndTranspose(values));
}

inline TDMatrix4 TDMatrix4MakeWithRows(TDVector4 row0, TDVector4 row1, TDVector4 row2, TDVector4 row3) {
    return _TDM4(GLKMatrix4MakeWithRows(_GLKV4(row0) , _GLKV4(row1) , _GLKV4(row2) , _GLKV4(row3) ));
}

inline TDMatrix4 TDMatrix4MakeWithColumns(TDVector4 column0, TDVector4 column1, TDVector4 column2, TDVector4 column3) {
    return _TDM4(GLKMatrix4MakeWithColumns(_GLKV4(column0) , _GLKV4(column1) , _GLKV4(column2) , _GLKV4(column3) ));
}

inline TDMatrix4 TDMatrix4MakeWithQuaternion(TDQuaternion quaternion) {
    return _TDM4(GLKMatrix4MakeWithQuaternion(_GLKQ(quaternion) ));
}

inline TDMatrix4 TDMatrix4MakeTranslation(float tx, float ty, float tz) {
    return _TDM4(GLKMatrix4MakeTranslation(tx, ty, tz));
}

inline TDMatrix4 TDMatrix4MakeScale(float sx, float sy, float sz) {
    return _TDM4(GLKMatrix4MakeScale(sx, sy, sz));
}

inline TDMatrix4 TDMatrix4MakeRotation(float radians, float x, float y, float z) {
    return _TDM4(GLKMatrix4MakeRotation(radians, x, y, z));
}

inline TDMatrix4 TDMatrix4MakeXRotation(float radians) {
    return _TDM4(GLKMatrix4MakeXRotation(radians));
}

inline TDMatrix4 TDMatrix4MakeYRotation(float radians) {
    return _TDM4(GLKMatrix4MakeYRotation(radians));
}

inline TDMatrix4 TDMatrix4MakeZRotation(float radians) {
    return _TDM4(GLKMatrix4MakeZRotation(radians));
}

inline TDMatrix4 TDMatrix4MakePerspective(float fovyRadians, float aspect, float nearZ, float farZ) {
    return _TDM4(GLKMatrix4MakePerspective(fovyRadians, aspect, nearZ, farZ));
}

inline TDMatrix4 TDMatrix4MakeFrustum(float left, float right, float bottom, float top, float nearZ, float farZ) {
    return _TDM4(GLKMatrix4MakeFrustum(left, right, bottom, top, nearZ, farZ));
}

inline TDMatrix4 TDMatrix4MakeOrtho(float left, float right, float bottom, float top, float nearZ, float farZ) {
    return _TDM4(GLKMatrix4MakeOrtho(left, right, bottom, top, nearZ, farZ));
}

inline TDMatrix4 TDMatrix4MakeLookAt(float eyeX, float eyeY, float eyeZ, float centerX, float centerY, float centerZ, float upX, float upY, float upZ) {
    return _TDM4(GLKMatrix4MakeLookAt(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ));
}

inline TDMatrix3 TDMatrix4GetMatrix3(TDMatrix4 matrix) {
    return _TDM3(GLKMatrix4GetMatrix3(_GLKM4(matrix) ));
}

inline TDMatrix2 TDMatrix4GetMatrix2(TDMatrix4 matrix) {
    return _TDM2(GLKMatrix4GetMatrix2(_GLKM4(matrix) ));
}

inline TDVector4 TDMatrix4GetRow(TDMatrix4 matrix, int row) {
    return _TDV4(GLKMatrix4GetRow(_GLKM4(matrix) , row));
}

inline TDVector4 TDMatrix4GetColumn(TDMatrix4 matrix, int column) {
    return _TDV4(GLKMatrix4GetColumn(_GLKM4(matrix) , column));
}

inline TDMatrix4 TDMatrix4SetRow(TDMatrix4 matrix, int row, TDVector4 vector) {
    return _TDM4(GLKMatrix4SetRow(_GLKM4(matrix) , row, _GLKV4(vector) ));
}

inline TDMatrix4 TDMatrix4SetColumn(TDMatrix4 matrix, int column, TDVector4 vector) {
    return _TDM4(GLKMatrix4SetColumn(_GLKM4(matrix) , column, _GLKV4(vector) ));
}

inline TDMatrix4 TDMatrix4Transpose(TDMatrix4 matrix) {
    return _TDM4(GLKMatrix4Transpose(_GLKM4(matrix) ));
}

inline TDMatrix4 TDMatrix4Invert(TDMatrix4 matrix, bool *isInvertible) {
    return _TDM4(GLKMatrix4Invert(_GLKM4(matrix) , (bool *) isInvertible));
}

inline TDMatrix4 TDMatrix4InvertAndTranspose(TDMatrix4 matrix, bool *isInvertible) {
    return _TDM4(GLKMatrix4InvertAndTranspose(_GLKM4(matrix) , (bool *) isInvertible));
}

inline TDMatrix4 TDMatrix4Multiply(TDMatrix4 matrixLeft, TDMatrix4 matrixRight) {
    return _TDM4(GLKMatrix4Multiply(_GLKM4(matrixLeft) , _GLKM4(matrixRight) ));
}

inline TDMatrix4 TDMatrix4Add(TDMatrix4 matrixLeft, TDMatrix4 matrixRight) {
    return _TDM4(GLKMatrix4Add(_GLKM4(matrixLeft) , _GLKM4(matrixRight) ));
}

inline TDMatrix4 TDMatrix4Subtract(TDMatrix4 matrixLeft, TDMatrix4 matrixRight) {
    return _TDM4(GLKMatrix4Subtract(_GLKM4(matrixLeft) , _GLKM4(matrixRight) ));
}

inline TDMatrix4 TDMatrix4Translate(TDMatrix4 matrix, float tx, float ty, float tz) {
    return _TDM4(GLKMatrix4Translate(_GLKM4(matrix) , tx, ty, tz));
}

inline TDMatrix4 TDMatrix4TranslateWithVector3(TDMatrix4 matrix, TDVector3 translationVector) {
    return _TDM4(GLKMatrix4TranslateWithVector3(_GLKM4(matrix) , _GLKV3(translationVector) ));
}

inline TDMatrix4 TDMatrix4TranslateWithVector4(TDMatrix4 matrix, TDVector4 translationVector) {
    return _TDM4(GLKMatrix4TranslateWithVector4(_GLKM4(matrix) , _GLKV4(translationVector) ));
}

inline TDMatrix4 TDMatrix4Scale(TDMatrix4 matrix, float sx, float sy, float sz) {
    return _TDM4(GLKMatrix4Scale(_GLKM4(matrix) , sx, sy, sz));
}

inline TDMatrix4 TDMatrix4ScaleWithVector3(TDMatrix4 matrix, TDVector3 scaleVector) {
    return _TDM4(GLKMatrix4ScaleWithVector3(_GLKM4(matrix) , _GLKV3(scaleVector) ));
}

inline TDMatrix4 TDMatrix4ScaleWithVector4(TDMatrix4 matrix, TDVector4 scaleVector) {
    return _TDM4(GLKMatrix4ScaleWithVector4(_GLKM4(matrix) , _GLKV4(scaleVector) ));
}

inline TDMatrix4 TDMatrix4Rotate(TDMatrix4 matrix, float radians, float x, float y, float z) {
    return _TDM4(GLKMatrix4Rotate(_GLKM4(matrix) , radians, x, y, z));
}

inline TDMatrix4 TDMatrix4RotateWithVector3(TDMatrix4 matrix, float radians, TDVector3 axisVector) {
    return _TDM4(GLKMatrix4RotateWithVector3(_GLKM4(matrix) , radians, _GLKV3(axisVector) ));
}

inline TDMatrix4 TDMatrix4RotateWithVector4(TDMatrix4 matrix, float radians, TDVector4 axisVector) {
    return _TDM4(GLKMatrix4RotateWithVector4(_GLKM4(matrix) , radians, _GLKV4(axisVector) ));
}

inline TDMatrix4 TDMatrix4RotateX(TDMatrix4 matrix, float radians) {
    return _TDM4(GLKMatrix4RotateX(_GLKM4(matrix) , radians));
}

inline TDMatrix4 TDMatrix4RotateY(TDMatrix4 matrix, float radians) {
    return _TDM4(GLKMatrix4RotateY(_GLKM4(matrix) , radians));
}

inline TDMatrix4 TDMatrix4RotateZ(TDMatrix4 matrix, float radians) {
    return _TDM4(GLKMatrix4RotateZ(_GLKM4(matrix) , radians));
}

inline TDVector3 TDMatrix4MultiplyVector3(TDMatrix4 matrixLeft, TDVector3 vectorRight) {
    return _TDV3(GLKMatrix4MultiplyVector3(_GLKM4(matrixLeft) , _GLKV3(vectorRight) ));
}

inline TDVector3 TDMatrix4MultiplyVector3WithTranslation(TDMatrix4 matrixLeft, TDVector3 vectorRight) {
    return _TDV3(GLKMatrix4MultiplyVector3WithTranslation(_GLKM4(matrixLeft) , _GLKV3(vectorRight) ));
}

inline TDVector3 TDMatrix4MultiplyAndProjectVector3(TDMatrix4 matrixLeft, TDVector3 vectorRight) {
    return _TDV3(GLKMatrix4MultiplyAndProjectVector3(_GLKM4(matrixLeft) , _GLKV3(vectorRight) ));
}

inline void TDMatrix4MultiplyVector3Array(TDMatrix4 matrix, TDVector3 *vectors, size_t vectorCount) {
    return GLKMatrix4MultiplyVector3Array(_GLKM4(matrix) , (GLKVector3 *) vectors, vectorCount);
}

inline void TDMatrix4MultiplyVector3ArrayWithTranslation(TDMatrix4 matrix, TDVector3 *vectors, size_t vectorCount) {
    return GLKMatrix4MultiplyVector3ArrayWithTranslation(_GLKM4(matrix) , (GLKVector3 *) vectors, vectorCount);
}

inline void TDMatrix4MultiplyAndProjectVector3Array(TDMatrix4 matrix, TDVector3 *vectors, size_t vectorCount) {
    return GLKMatrix4MultiplyAndProjectVector3Array(_GLKM4(matrix) , (GLKVector3 *) vectors, vectorCount);
}

inline TDVector4 TDMatrix4MultiplyVector4(TDMatrix4 matrixLeft, TDVector4 vectorRight) {
    return _TDV4(GLKMatrix4MultiplyVector4(_GLKM4(matrixLeft) , _GLKV4(vectorRight) ));
}

inline void TDMatrix4MultiplyVector4Array(TDMatrix4 matrix, TDVector4 *vectors, size_t vectorCount) {
    return GLKMatrix4MultiplyVector4Array(_GLKM4(matrix) , (GLKVector4 *) vectors, vectorCount);
}

inline TDMatrix3 TDMatrix3Make(float m00, float m01, float m02, float m10, float m11, float m12, float m20, float m21, float m22) {
    return _TDM3(GLKMatrix3Make(m00, m01, m02, m10, m11, m12, m20, m21, m22));
}

inline TDMatrix3 TDMatrix3MakeAndTranspose(float m00, float m01, float m02, float m10, float m11, float m12, float m20, float m21, float m22) {
    return _TDM3(GLKMatrix3MakeAndTranspose(m00, m01, m02, m10, m11, m12, m20, m21, m22));
}

inline TDMatrix3 TDMatrix3MakeWithArray(float values[9]) {
    return _TDM3(GLKMatrix3MakeWithArray(values));
}

inline TDMatrix3 TDMatrix3MakeWithArrayAndTranspose(float values[9]) {
    return _TDM3(GLKMatrix3MakeWithArrayAndTranspose(values));
}

inline TDMatrix3 TDMatrix3MakeWithRows(TDVector3 row0, TDVector3 row1, TDVector3 row2) {
    return _TDM3(GLKMatrix3MakeWithRows(_GLKV3(row0) , _GLKV3(row1) , _GLKV3(row2) ));
}

inline TDMatrix3 TDMatrix3MakeWithColumns(TDVector3 column0, TDVector3 column1, TDVector3 column2) {
    return _TDM3(GLKMatrix3MakeWithColumns(_GLKV3(column0) , _GLKV3(column1) , _GLKV3(column2) ));
}

inline TDMatrix3 TDMatrix3MakeWithQuaternion(TDQuaternion quaternion) {
    return _TDM3(GLKMatrix3MakeWithQuaternion(_GLKQ(quaternion) ));
}

inline TDMatrix3 TDMatrix3MakeScale(float sx, float sy, float sz) {
    return _TDM3(GLKMatrix3MakeScale(sx, sy, sz));
}

inline TDMatrix3 TDMatrix3MakeRotation(float radians, float x, float y, float z) {
    return _TDM3(GLKMatrix3MakeRotation(radians, x, y, z));
}

inline TDMatrix3 TDMatrix3MakeXRotation(float radians) {
    return _TDM3(GLKMatrix3MakeXRotation(radians));
}

inline TDMatrix3 TDMatrix3MakeYRotation(float radians) {
    return _TDM3(GLKMatrix3MakeYRotation(radians));
}

inline TDMatrix3 TDMatrix3MakeZRotation(float radians) {
    return _TDM3(GLKMatrix3MakeZRotation(radians));
}

inline TDMatrix2 TDMatrix3GetMatrix2(TDMatrix3 matrix) {
    return _TDM2(GLKMatrix3GetMatrix2(_GLKM3(matrix) ));
}

inline TDVector3 TDMatrix3GetRow(TDMatrix3 matrix, int row) {
    return _TDV3(GLKMatrix3GetRow(_GLKM3(matrix) , row));
}

inline TDVector3 TDMatrix3GetColumn(TDMatrix3 matrix, int column) {
    return _TDV3(GLKMatrix3GetColumn(_GLKM3(matrix) , column));
}

inline TDMatrix3 TDMatrix3SetRow(TDMatrix3 matrix, int row, TDVector3 vector) {
    return _TDM3(GLKMatrix3SetRow(_GLKM3(matrix) , row, _GLKV3(vector) ));
}

inline TDMatrix3 TDMatrix3SetColumn(TDMatrix3 matrix, int column, TDVector3 vector) {
    return _TDM3(GLKMatrix3SetColumn(_GLKM3(matrix) , column, _GLKV3(vector) ));
}

inline TDMatrix3 TDMatrix3Transpose(TDMatrix3 matrix) {
    return _TDM3(GLKMatrix3Transpose(_GLKM3(matrix) ));
}

inline TDMatrix3 TDMatrix3Invert(TDMatrix3 matrix, bool *isInvertible) {
    return _TDM3(GLKMatrix3Invert(_GLKM3(matrix) , (bool *) isInvertible));
}

inline TDMatrix3 TDMatrix3InvertAndTranspose(TDMatrix3 matrix, bool *isInvertible) {
    return _TDM3(GLKMatrix3InvertAndTranspose(_GLKM3(matrix) , (bool *) isInvertible));
}

inline TDMatrix3 TDMatrix3Multiply(TDMatrix3 matrixLeft, TDMatrix3 matrixRight) {
    return _TDM3(GLKMatrix3Multiply(_GLKM3(matrixLeft) , _GLKM3(matrixRight) ));
}

inline TDMatrix3 TDMatrix3Add(TDMatrix3 matrixLeft, TDMatrix3 matrixRight) {
    return _TDM3(GLKMatrix3Add(_GLKM3(matrixLeft) , _GLKM3(matrixRight) ));
}

inline TDMatrix3 TDMatrix3Subtract(TDMatrix3 matrixLeft, TDMatrix3 matrixRight) {
    return _TDM3(GLKMatrix3Subtract(_GLKM3(matrixLeft) , _GLKM3(matrixRight) ));
}

inline TDMatrix3 TDMatrix3Scale(TDMatrix3 matrix, float sx, float sy, float sz) {
    return _TDM3(GLKMatrix3Scale(_GLKM3(matrix) , sx, sy, sz));
}

inline TDMatrix3 TDMatrix3ScaleWithVector3(TDMatrix3 matrix, TDVector3 scaleVector) {
    return _TDM3(GLKMatrix3ScaleWithVector3(_GLKM3(matrix) , _GLKV3(scaleVector) ));
}

inline TDMatrix3 TDMatrix3ScaleWithVector4(TDMatrix3 matrix, TDVector4 scaleVector) {
    return _TDM3(GLKMatrix3ScaleWithVector4(_GLKM3(matrix) , _GLKV4(scaleVector) ));
}

inline TDMatrix3 TDMatrix3Rotate(TDMatrix3 matrix, float radians, float x, float y, float z) {
    return _TDM3(GLKMatrix3Rotate(_GLKM3(matrix) , radians, x, y, z));
}

inline TDMatrix3 TDMatrix3RotateWithVector3(TDMatrix3 matrix, float radians, TDVector3 axisVector) {
    return _TDM3(GLKMatrix3RotateWithVector3(_GLKM3(matrix) , radians, _GLKV3(axisVector) ));
}

inline TDMatrix3 TDMatrix3RotateWithVector4(TDMatrix3 matrix, float radians, TDVector4 axisVector) {
    return _TDM3(GLKMatrix3RotateWithVector4(_GLKM3(matrix) , radians, _GLKV4(axisVector) ));
}

inline TDMatrix3 TDMatrix3RotateX(TDMatrix3 matrix, float radians) {
    return _TDM3(GLKMatrix3RotateX(_GLKM3(matrix) , radians));
}

inline TDMatrix3 TDMatrix3RotateY(TDMatrix3 matrix, float radians) {
    return _TDM3(GLKMatrix3RotateY(_GLKM3(matrix) , radians));
}

inline TDMatrix3 TDMatrix3RotateZ(TDMatrix3 matrix, float radians) {
    return _TDM3(GLKMatrix3RotateZ(_GLKM3(matrix) , radians));
}

inline TDVector3 TDMatrix3MultiplyVector3(TDMatrix3 matrixLeft, TDVector3 vectorRight) {
    return _TDV3(GLKMatrix3MultiplyVector3(_GLKM3(matrixLeft) , _GLKV3(vectorRight) ));
}

inline void TDMatrix3MultiplyVector3Array(TDMatrix3 matrix, TDVector3 *vectors, size_t vectorCount) {
    return GLKMatrix3MultiplyVector3Array(_GLKM3(matrix) , (GLKVector3 *) vectors, vectorCount);
}

inline TDVector2 TDVector2Make(float x, float y) {
    return _TDV2(GLKVector2Make(x, y));
}

inline TDVector2 TDVector2MakeWithArray(float values[2]) {
    return _TDV2(GLKVector2MakeWithArray(values));
}

inline TDVector2 TDVector2Negate(TDVector2 vector) {
    return _TDV2(GLKVector2Negate(_GLKV2(vector) ));
}

inline TDVector2 TDVector2Add(TDVector2 vectorLeft, TDVector2 vectorRight) {
    return _TDV2(GLKVector2Add(_GLKV2(vectorLeft) , _GLKV2(vectorRight) ));
}

inline TDVector2 TDVector2Subtract(TDVector2 vectorLeft, TDVector2 vectorRight) {
    return _TDV2(GLKVector2Subtract(_GLKV2(vectorLeft) , _GLKV2(vectorRight) ));
}

inline TDVector2 TDVector2Multiply(TDVector2 vectorLeft, TDVector2 vectorRight) {
    return _TDV2(GLKVector2Multiply(_GLKV2(vectorLeft) , _GLKV2(vectorRight) ));
}

inline TDVector2 TDVector2Divide(TDVector2 vectorLeft, TDVector2 vectorRight) {
    return _TDV2(GLKVector2Divide(_GLKV2(vectorLeft) , _GLKV2(vectorRight) ));
}

inline TDVector2 TDVector2AddScalar(TDVector2 vector, float value) {
    return _TDV2(GLKVector2AddScalar(_GLKV2(vector) , value));
}

inline TDVector2 TDVector2SubtractScalar(TDVector2 vector, float value) {
    return _TDV2(GLKVector2SubtractScalar(_GLKV2(vector) , value));
}

inline TDVector2 TDVector2MultiplyScalar(TDVector2 vector, float value) {
    return _TDV2(GLKVector2MultiplyScalar(_GLKV2(vector) , value));
}

inline TDVector2 TDVector2DivideScalar(TDVector2 vector, float value) {
    return _TDV2(GLKVector2DivideScalar(_GLKV2(vector) , value));
}

inline TDVector2 TDVector2Maximum(TDVector2 vectorLeft, TDVector2 vectorRight) {
    return _TDV2(GLKVector2Maximum(_GLKV2(vectorLeft) , _GLKV2(vectorRight) ));
}

inline TDVector2 TDVector2Minimum(TDVector2 vectorLeft, TDVector2 vectorRight) {
    return _TDV2(GLKVector2Minimum(_GLKV2(vectorLeft) , _GLKV2(vectorRight) ));
}

inline bool TDVector2AllEqualToVector2(TDVector2 vectorLeft, TDVector2 vectorRight) {
    return GLKVector2AllEqualToVector2(_GLKV2(vectorLeft) , _GLKV2(vectorRight) );
}

inline bool TDVector2AllEqualToScalar(TDVector2 vector, float value) {
    return GLKVector2AllEqualToScalar(_GLKV2(vector) , value);
}

inline bool TDVector2AllGreaterThanVector2(TDVector2 vectorLeft, TDVector2 vectorRight) {
    return GLKVector2AllGreaterThanVector2(_GLKV2(vectorLeft) , _GLKV2(vectorRight) );
}

inline bool TDVector2AllGreaterThanScalar(TDVector2 vector, float value) {
    return GLKVector2AllGreaterThanScalar(_GLKV2(vector) , value);
}

inline bool TDVector2AllGreaterThanOrEqualToVector2(TDVector2 vectorLeft, TDVector2 vectorRight) {
    return GLKVector2AllGreaterThanOrEqualToVector2(_GLKV2(vectorLeft) , _GLKV2(vectorRight) );
}

inline bool TDVector2AllGreaterThanOrEqualToScalar(TDVector2 vector, float value) {
    return GLKVector2AllGreaterThanOrEqualToScalar(_GLKV2(vector) , value);
}

inline TDVector2 TDVector2Normalize(TDVector2 vector) {
    return _TDV2(GLKVector2Normalize(_GLKV2(vector) ));
}

inline float TDVector2DotProduct(TDVector2 vectorLeft, TDVector2 vectorRight) {
    return GLKVector2DotProduct(_GLKV2(vectorLeft) , _GLKV2(vectorRight) );
}

inline float TDVector2Length(TDVector2 vector) {
    return GLKVector2Length(_GLKV2(vector) );
}

inline float TDVector2Distance(TDVector2 vectorStart, TDVector2 vectorEnd) {
    return GLKVector2Distance(_GLKV2(vectorStart) , _GLKV2(vectorEnd) );
}

inline TDVector2 TDVector2Lerp(TDVector2 vectorStart, TDVector2 vectorEnd, float t) {
    return _TDV2(GLKVector2Lerp(_GLKV2(vectorStart) , _GLKV2(vectorEnd) , t));
}

inline TDVector2 TDVector2Project(TDVector2 vectorToProject, TDVector2 projectionVector) {
    return _TDV2(GLKVector2Project(_GLKV2(vectorToProject) , _GLKV2(projectionVector) ));
}

inline TDVector3 TDVector3Make(float x, float y, float z) {
    return _TDV3(GLKVector3Make(x, y, z));
}

inline TDVector3 TDVector3MakeWithArray(float values[3]) {
    return _TDV3(GLKVector3MakeWithArray(values));
}

inline TDVector3 TDVector3Negate(TDVector3 vector) {
    return _TDV3(GLKVector3Negate(_GLKV3(vector) ));
}

inline TDVector3 TDVector3Add(TDVector3 vectorLeft, TDVector3 vectorRight) {
    return _TDV3(GLKVector3Add(_GLKV3(vectorLeft) , _GLKV3(vectorRight) ));
}

inline TDVector3 TDVector3Subtract(TDVector3 vectorLeft, TDVector3 vectorRight) {
    return _TDV3(GLKVector3Subtract(_GLKV3(vectorLeft) , _GLKV3(vectorRight) ));
}

inline TDVector3 TDVector3Multiply(TDVector3 vectorLeft, TDVector3 vectorRight) {
    return _TDV3(GLKVector3Multiply(_GLKV3(vectorLeft) , _GLKV3(vectorRight) ));
}

inline TDVector3 TDVector3Divide(TDVector3 vectorLeft, TDVector3 vectorRight) {
    return _TDV3(GLKVector3Divide(_GLKV3(vectorLeft) , _GLKV3(vectorRight) ));
}

inline TDVector3 TDVector3AddScalar(TDVector3 vector, float value) {
    return _TDV3(GLKVector3AddScalar(_GLKV3(vector) , value));
}

inline TDVector3 TDVector3SubtractScalar(TDVector3 vector, float value) {
    return _TDV3(GLKVector3SubtractScalar(_GLKV3(vector) , value));
}

inline TDVector3 TDVector3MultiplyScalar(TDVector3 vector, float value) {
    return _TDV3(GLKVector3MultiplyScalar(_GLKV3(vector) , value));
}

inline TDVector3 TDVector3DivideScalar(TDVector3 vector, float value) {
    return _TDV3(GLKVector3DivideScalar(_GLKV3(vector) , value));
}

inline TDVector3 TDVector3Maximum(TDVector3 vectorLeft, TDVector3 vectorRight) {
    return _TDV3(GLKVector3Maximum(_GLKV3(vectorLeft) , _GLKV3(vectorRight) ));
}

inline TDVector3 TDVector3Minimum(TDVector3 vectorLeft, TDVector3 vectorRight) {
    return _TDV3(GLKVector3Minimum(_GLKV3(vectorLeft) , _GLKV3(vectorRight) ));
}

inline bool TDVector3AllEqualToVector3(TDVector3 vectorLeft, TDVector3 vectorRight) {
    return GLKVector3AllEqualToVector3(_GLKV3(vectorLeft) , _GLKV3(vectorRight) );
}

inline bool TDVector3AllEqualToScalar(TDVector3 vector, float value) {
    return GLKVector3AllEqualToScalar(_GLKV3(vector) , value);
}

inline bool TDVector3AllGreaterThanVector3(TDVector3 vectorLeft, TDVector3 vectorRight) {
    return GLKVector3AllGreaterThanVector3(_GLKV3(vectorLeft) , _GLKV3(vectorRight) );
}

inline bool TDVector3AllGreaterThanScalar(TDVector3 vector, float value) {
    return GLKVector3AllGreaterThanScalar(_GLKV3(vector) , value);
}

inline bool TDVector3AllGreaterThanOrEqualToVector3(TDVector3 vectorLeft, TDVector3 vectorRight) {
    return GLKVector3AllGreaterThanOrEqualToVector3(_GLKV3(vectorLeft) , _GLKV3(vectorRight) );
}

inline bool TDVector3AllGreaterThanOrEqualToScalar(TDVector3 vector, float value) {
    return GLKVector3AllGreaterThanOrEqualToScalar(_GLKV3(vector) , value);
}

inline TDVector3 TDVector3Normalize(TDVector3 vector) {
    return _TDV3(GLKVector3Normalize(_GLKV3(vector) ));
}

inline float TDVector3DotProduct(TDVector3 vectorLeft, TDVector3 vectorRight) {
    return GLKVector3DotProduct(_GLKV3(vectorLeft) , _GLKV3(vectorRight) );
}

inline float TDVector3Length(TDVector3 vector) {
    return GLKVector3Length(_GLKV3(vector) );
}

inline float TDVector3Distance(TDVector3 vectorStart, TDVector3 vectorEnd) {
    return GLKVector3Distance(_GLKV3(vectorStart) , _GLKV3(vectorEnd) );
}

inline TDVector3 TDVector3Lerp(TDVector3 vectorStart, TDVector3 vectorEnd, float t) {
    return _TDV3(GLKVector3Lerp(_GLKV3(vectorStart) , _GLKV3(vectorEnd) , t));
}

inline TDVector3 TDVector3CrossProduct(TDVector3 vectorLeft, TDVector3 vectorRight) {
    return _TDV3(GLKVector3CrossProduct(_GLKV3(vectorLeft) , _GLKV3(vectorRight) ));
}

inline TDVector3 TDVector3Project(TDVector3 vectorToProject, TDVector3 projectionVector) {
    return _TDV3(GLKVector3Project(_GLKV3(vectorToProject) , _GLKV3(projectionVector) ));
}

inline TDVector4 TDVector4Make(float x, float y, float z, float w) {
    return _TDV4(GLKVector4Make(x, y, z, w));
}

inline TDVector4 TDVector4MakeWithArray(float values[4]) {
    return _TDV4(GLKVector4MakeWithArray(values));
}

inline TDVector4 TDVector4MakeWithVector3(TDVector3 vector, float w) {
    return _TDV4(GLKVector4MakeWithVector3(_GLKV3(vector) , w));
}

inline TDVector4 TDVector4Negate(TDVector4 vector) {
    return _TDV4(GLKVector4Negate(_GLKV4(vector) ));
}

inline TDVector4 TDVector4Add(TDVector4 vectorLeft, TDVector4 vectorRight) {
    return _TDV4(GLKVector4Add(_GLKV4(vectorLeft) , _GLKV4(vectorRight) ));
}

inline TDVector4 TDVector4Subtract(TDVector4 vectorLeft, TDVector4 vectorRight) {
    return _TDV4(GLKVector4Subtract(_GLKV4(vectorLeft) , _GLKV4(vectorRight) ));
}

inline TDVector4 TDVector4Multiply(TDVector4 vectorLeft, TDVector4 vectorRight) {
    return _TDV4(GLKVector4Multiply(_GLKV4(vectorLeft) , _GLKV4(vectorRight) ));
}

inline TDVector4 TDVector4Divide(TDVector4 vectorLeft, TDVector4 vectorRight) {
    return _TDV4(GLKVector4Divide(_GLKV4(vectorLeft) , _GLKV4(vectorRight) ));
}

inline TDVector4 TDVector4AddScalar(TDVector4 vector, float value) {
    return _TDV4(GLKVector4AddScalar(_GLKV4(vector) , value));
}

inline TDVector4 TDVector4SubtractScalar(TDVector4 vector, float value) {
    return _TDV4(GLKVector4SubtractScalar(_GLKV4(vector) , value));
}

inline TDVector4 TDVector4MultiplyScalar(TDVector4 vector, float value) {
    return _TDV4(GLKVector4MultiplyScalar(_GLKV4(vector) , value));
}

inline TDVector4 TDVector4DivideScalar(TDVector4 vector, float value) {
    return _TDV4(GLKVector4DivideScalar(_GLKV4(vector) , value));
}

inline TDVector4 TDVector4Maximum(TDVector4 vectorLeft, TDVector4 vectorRight) {
    return _TDV4(GLKVector4Maximum(_GLKV4(vectorLeft) , _GLKV4(vectorRight) ));
}

inline TDVector4 TDVector4Minimum(TDVector4 vectorLeft, TDVector4 vectorRight) {
    return _TDV4(GLKVector4Minimum(_GLKV4(vectorLeft) , _GLKV4(vectorRight) ));
}

inline bool TDVector4AllEqualToVector4(TDVector4 vectorLeft, TDVector4 vectorRight) {
    return GLKVector4AllEqualToVector4(_GLKV4(vectorLeft) , _GLKV4(vectorRight) );
}

inline bool TDVector4AllEqualToScalar(TDVector4 vector, float value) {
    return GLKVector4AllEqualToScalar(_GLKV4(vector) , value);
}

inline bool TDVector4AllGreaterThanVector4(TDVector4 vectorLeft, TDVector4 vectorRight) {
    return GLKVector4AllGreaterThanVector4(_GLKV4(vectorLeft) , _GLKV4(vectorRight) );
}

inline bool TDVector4AllGreaterThanScalar(TDVector4 vector, float value) {
    return GLKVector4AllGreaterThanScalar(_GLKV4(vector) , value);
}

inline bool TDVector4AllGreaterThanOrEqualToVector4(TDVector4 vectorLeft, TDVector4 vectorRight) {
    return GLKVector4AllGreaterThanOrEqualToVector4(_GLKV4(vectorLeft) , _GLKV4(vectorRight) );
}

inline bool TDVector4AllGreaterThanOrEqualToScalar(TDVector4 vector, float value) {
    return GLKVector4AllGreaterThanOrEqualToScalar(_GLKV4(vector) , value);
}

inline TDVector4 TDVector4Normalize(TDVector4 vector) {
    return _TDV4(GLKVector4Normalize(_GLKV4(vector) ));
}

inline float TDVector4DotProduct(TDVector4 vectorLeft, TDVector4 vectorRight) {
    return GLKVector4DotProduct(_GLKV4(vectorLeft) , _GLKV4(vectorRight) );
}

inline float TDVector4Length(TDVector4 vector) {
    return GLKVector4Length(_GLKV4(vector) );
}

inline float TDVector4Distance(TDVector4 vectorStart, TDVector4 vectorEnd) {
    return GLKVector4Distance(_GLKV4(vectorStart) , _GLKV4(vectorEnd) );
}

inline TDVector4 TDVector4Lerp(TDVector4 vectorStart, TDVector4 vectorEnd, float t) {
    return _TDV4(GLKVector4Lerp(_GLKV4(vectorStart) , _GLKV4(vectorEnd) , t));
}

inline TDVector4 TDVector4CrossProduct(TDVector4 vectorLeft, TDVector4 vectorRight) {
    return _TDV4(GLKVector4CrossProduct(_GLKV4(vectorLeft) , _GLKV4(vectorRight) ));
}

inline TDVector4 TDVector4Project(TDVector4 vectorToProject, TDVector4 projectionVector) {
    return _TDV4(GLKVector4Project(_GLKV4(vectorToProject) , _GLKV4(projectionVector) ));
}

inline TDQuaternion TDQuaternionMake(float x, float y, float z, float w) {
    return _TDQ(GLKQuaternionMake(x, y, z, w));
}

inline TDQuaternion TDQuaternionMakeWithVector3(TDVector3 vector, float scalar) {
    return _TDQ(GLKQuaternionMakeWithVector3(_GLKV3(vector) , scalar));
}

inline TDQuaternion TDQuaternionMakeWithArray(float values[4]) {
    return _TDQ(GLKQuaternionMakeWithArray(values));
}

inline TDQuaternion TDQuaternionMakeWithAngleAndAxis(float radians, float x, float y, float z) {
    return _TDQ(GLKQuaternionMakeWithAngleAndAxis(radians, x, y, z));
}

inline TDQuaternion TDQuaternionMakeWithAngleAndVector3Axis(float radians, TDVector3 axisVector) {
    return _TDQ(GLKQuaternionMakeWithAngleAndVector3Axis(radians, _GLKV3(axisVector) ));
}

inline TDQuaternion TDQuaternionMakeWithMatrix3(TDMatrix3 matrix) {
    return _TDQ(GLKQuaternionMakeWithMatrix3(_GLKM3(matrix) ));
}

inline TDQuaternion TDQuaternionMakeWithMatrix4(TDMatrix4 matrix) {
    return _TDQ(GLKQuaternionMakeWithMatrix4(_GLKM4(matrix) ));
}

inline float TDQuaternionAngle(TDQuaternion quaternion) {
    return GLKQuaternionAngle(_GLKQ(quaternion) );
}

inline TDVector3 TDQuaternionAxis(TDQuaternion quaternion) {
    return _TDV3(GLKQuaternionAxis(_GLKQ(quaternion) ));
}

inline TDQuaternion TDQuaternionAdd(TDQuaternion quaternionLeft, TDQuaternion quaternionRight) {
    return _TDQ(GLKQuaternionAdd(_GLKQ(quaternionLeft) , _GLKQ(quaternionRight) ));
}

inline TDQuaternion TDQuaternionSubtract(TDQuaternion quaternionLeft, TDQuaternion quaternionRight) {
    return _TDQ(GLKQuaternionSubtract(_GLKQ(quaternionLeft) , _GLKQ(quaternionRight) ));
}

inline TDQuaternion TDQuaternionMultiply(TDQuaternion quaternionLeft, TDQuaternion quaternionRight) {
    return _TDQ(GLKQuaternionMultiply(_GLKQ(quaternionLeft) , _GLKQ(quaternionRight) ));
}

inline TDQuaternion TDQuaternionSlerp(TDQuaternion quaternionStart, TDQuaternion quaternionEnd, float t) {
    return _TDQ(GLKQuaternionSlerp(_GLKQ(quaternionStart) , _GLKQ(quaternionEnd) , t));
}

inline float TDQuaternionLength(TDQuaternion quaternion) {
    return GLKQuaternionLength(_GLKQ(quaternion) );
}

inline TDQuaternion TDQuaternionConjugate(TDQuaternion quaternion) {
    return _TDQ(GLKQuaternionConjugate(_GLKQ(quaternion) ));
}

inline TDQuaternion TDQuaternionInvert(TDQuaternion quaternion) {
    return _TDQ(GLKQuaternionInvert(_GLKQ(quaternion) ));
}

inline TDQuaternion TDQuaternionNormalize(TDQuaternion quaternion) {
    return _TDQ(GLKQuaternionNormalize(_GLKQ(quaternion) ));
}

inline TDVector3 TDQuaternionRotateVector3(TDQuaternion quaternion, TDVector3 vector) {
    return _TDV3(GLKQuaternionRotateVector3(_GLKQ(quaternion) , _GLKV3(vector) ));
}

inline void TDQuaternionRotateVector3Array(TDQuaternion quaternion, TDVector3 *vectors, size_t vectorCount) {
    return GLKQuaternionRotateVector3Array(_GLKQ(quaternion) , (GLKVector3 *) vectors, vectorCount);
}

inline TDVector4 TDQuaternionRotateVector4(TDQuaternion quaternion, TDVector4 vector) {
    return _TDV4(GLKQuaternionRotateVector4(_GLKQ(quaternion) , _GLKV4(vector) ));
}

inline void TDQuaternionRotateVector4Array(TDQuaternion quaternion, TDVector4 *vectors, size_t vectorCount) {
    return GLKQuaternionRotateVector4Array(_GLKQ(quaternion) , (GLKVector4 *) vectors, vectorCount);
}

inline NSString* NSStringFromTDMatrix2(TDMatrix2 matrix) {
    return NSStringFromGLKMatrix2(_GLKM2(matrix) );
}

inline NSString* NSStringFromTDMatrix3(TDMatrix3 matrix) {
    return NSStringFromGLKMatrix3(_GLKM3(matrix) );
}

inline NSString* NSStringFromTDMatrix4(TDMatrix4 matrix) {
    return NSStringFromGLKMatrix4(_GLKM4(matrix) );
}

inline NSString* NSStringFromTDVector2(TDVector2 vector) {
    return NSStringFromGLKVector2(_GLKV2(vector) );
}

inline NSString* NSStringFromTDVector3(TDVector3 vector) {
    return NSStringFromGLKVector3(_GLKV3(vector) );
}

inline NSString* NSStringFromTDVector4(TDVector4 vector) {
    return NSStringFromGLKVector4(_GLKV4(vector) );
}

inline NSString* NSStringFromTDQuaternion(TDQuaternion quaternion) {
    return NSStringFromGLKQuaternion(_GLKQ(quaternion) );
}

inline float TDMathDegreesToRadians(float degrees) {
    return GLKMathDegreesToRadians(degrees);
}

inline float TDMathRadiansToDegrees(float radians) {
    return GLKMathRadiansToDegrees(radians);
}

inline TDVector3 TDMathProject(TDVector3 object, TDMatrix4 model, TDMatrix4 projection, int *viewport) {
    return _TDV3(GLKMathProject(_GLKV3(object) , _GLKM4(model) , _GLKM4(projection) , (int *) viewport));
}

inline TDVector3 TDMathUnproject(TDVector3 window, TDMatrix4 model, TDMatrix4 projection, int *viewport, bool *success) {
    return _TDV3(GLKMathUnproject(_GLKV3(window) , _GLKM4(model) , _GLKM4(projection) , (int *) viewport, (bool *) success));
}



@implementation GLKBaseEffect (TD)

- (void)setTd_lightModelAmbientColor:(TDVector4)td_lightModelAmbientColor {
    self.lightModelAmbientColor = _GLKV4(td_lightModelAmbientColor);
}

- (TDVector4)td_lightModelAmbientColor {
    return _TDV4(self.lightModelAmbientColor);
}

- (void)setTd_constantColor:(TDVector4)td_constantColor {
    self.constantColor = _GLKV4(td_constantColor);
}

- (TDVector4)td_constantColor {
    return _TDV4(self.constantColor);
}

@end

@implementation GLKEffectPropertyTransform (TD)

- (void)setTd_modelviewMatrix:(TDMatrix4)td_modelviewMatrix {
    self.modelviewMatrix = _GLKM4(td_modelviewMatrix);
}

- (TDMatrix4)td_modelviewMatrix {
    return _TDM4(self.modelviewMatrix);
}

- (void)setTd_projectionMatrix:(TDMatrix4)td_projectionMatrix {
    self.projectionMatrix = _GLKM4(td_projectionMatrix);
}

- (TDMatrix4)td_projectionMatrix {
    return _TDM4(self.projectionMatrix);
}

- (TDMatrix3)td_normalMatrix {
    return _TDM3(self.normalMatrix);
}

@end

@implementation GLKEffectPropertyLight (TD)

- (TDVector4)td_position {
    return _TDV4(self.position);
}

- (void)setTd_position:(TDVector4)td_position {
    self.position = _GLKV4(td_position);
}

- (TDVector4)td_ambientColor {
    return _TDV4(self.ambientColor);
}

- (void)setTd_ambientColor:(TDVector4)td_ambientColor {
    self.ambientColor = _GLKV4(td_ambientColor);
}

- (TDVector4)td_diffuseColor {
    return _TDV4(self.diffuseColor);
}

- (void)setTd_diffuseColor:(TDVector4)td_diffuseColor {
    self.diffuseColor = _GLKV4(td_diffuseColor);
}

- (TDVector4)td_specularColor {
    return _TDV4(self.specularColor);
}

- (void)setTd_specularColor:(TDVector4)td_specularColor {
    self.specularColor = _GLKV4(td_specularColor);
}

- (TDVector3)td_spotDirection {
    return _TDV3(self.spotDirection);
}

- (void)setTd_spotDirection:(TDVector3)td_spotDirection {
    self.spotDirection = _GLKV3(td_spotDirection);
}

@end

@implementation GLKEffectPropertyMaterial (TD)

- (TDVector4)td_ambientColor {
    return _TDV4(self.ambientColor);
}

- (void)setTd_ambientColor:(TDVector4)td_ambientColor {
    self.ambientColor = _GLKV4(td_ambientColor);
}

- (TDVector4)td_diffuseColor {
    return _TDV4(self.diffuseColor);
}

- (void)setTd_diffuseColor:(TDVector4)td_diffuseColor {
    self.diffuseColor = _GLKV4(td_diffuseColor);
}

- (TDVector4)td_specularColor {
    return _TDV4(self.specularColor);
}

- (void)setTd_specularColor:(TDVector4)td_specularColor {
    self.specularColor = _GLKV4(td_specularColor);
}

- (TDVector4)td_emissiveColor {
    return _TDV4(self.emissiveColor);
}

- (void)setTd_emissiveColor:(TDVector4)td_emissiveColor {
    self.emissiveColor = _GLKV4(td_emissiveColor);
}

@end

@implementation GLKEffectPropertyFog (TD)

- (TDVector4)td_color {
    return _TDV4(self.color);
}

- (void)setTd_color:(TDVector4)td_color {
    self.color = _GLKV4(td_color);
}

@end

@implementation GLKReflectionMapEffect (TD)

- (TDMatrix3)td_matrix {
    return _TDM3(self.matrix);
}

- (void)setTd_matrix:(TDMatrix3)td_matrix {
    self.matrix = _GLKM3(td_matrix);
}

@end

@implementation GLKSkyboxEffect (TD)

- (TDVector3)td_center {
    return _TDV3(self.center);
}

- (void)setTd_center:(TDVector3)td_center {
    self.center = _GLKV3(td_center);
}

@end
