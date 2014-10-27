// Swift-Math.swift
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

// MARK: - Matrix 4 operations

func * (left: TDMatrix4, right: TDMatrix4) -> TDMatrix4 {
    return TDMatrix4Multiply(left, right)
}

func + (left: TDMatrix4, right: TDMatrix4) -> TDMatrix4 {
    return TDMatrix4Add(left, right)
}

func - (left: TDMatrix4, right: TDMatrix4) -> TDMatrix4 {
    return TDMatrix4Subtract(left, right);
}

func * (left: TDMatrix4, right: TDVector4) -> TDVector4 {
    return TDMatrix4MultiplyVector4(left, right)
}

func * (left: TDMatrix4, right: TDVector3) -> TDVector3 {
    return TDMatrix4MultiplyVector3(left, right)
}

// MARK: - Matrix 3 operations

func * (left: TDMatrix3, right: TDMatrix3) -> TDMatrix3 {
    return TDMatrix3Multiply(left, right)
}

func + (left: TDMatrix3, right: TDMatrix3) -> TDMatrix3 {
    return TDMatrix3Add(left, right)
}

func - (left: TDMatrix3, right: TDMatrix3) -> TDMatrix3 {
    return TDMatrix3Subtract(left, right);
}

func * (left: TDMatrix3, right: TDVector3) -> TDVector3 {
    return TDMatrix3MultiplyVector3(left, right)
}

// MARK: - Vector 2 operations

prefix func - (v: TDVector2) -> TDVector2 {
    return TDVector2Negate(v)
}

func + (left: TDVector2, right: TDVector2) -> TDVector2 {
    return TDVector2Add(left, right)
}

func - (left: TDVector2, right: TDVector2) -> TDVector2 {
    return TDVector2Subtract(left, right)
}

func * (left: TDVector2, right: TDVector2) -> TDVector2 {
    return TDVector2Multiply(left, right)
}

func / (left: TDVector2, right: TDVector2) -> TDVector2 {
    return TDVector2Divide(left, right)
}

func + (left: TDVector2, right: GLfloat) -> TDVector2 {
    return TDVector2AddScalar(left, right)
}

func - (left: TDVector2, right: GLfloat) -> TDVector2 {
    return TDVector2SubtractScalar(left, right)
}

func * (left: TDVector2, right: GLfloat) -> TDVector2 {
    return TDVector2MultiplyScalar(left, right)
}

func / (left: TDVector2, right: GLfloat) -> TDVector2 {
    return TDVector2DivideScalar(left, right)
}

func == (left: TDVector2, right: TDVector2) -> Bool {
    return TDVector2AllEqualToVector2(left, right)
}

func > (left: TDVector2, right: TDVector2) -> Bool {
    return TDVector2AllGreaterThanVector2(left, right)
}

func >= (left: TDVector2, right: TDVector2) -> Bool {
    return TDVector2AllGreaterThanOrEqualToVector2(left, right)
}

func == (left: TDVector2, right: GLfloat) -> Bool {
    return TDVector2AllEqualToScalar(left, right)
}

func > (left: TDVector2, right: GLfloat) -> Bool {
    return TDVector2AllGreaterThanScalar(left, right)
}

func >= (left: TDVector2, right: GLfloat) -> Bool {
    return TDVector2AllGreaterThanOrEqualToScalar(left, right)
}

// MARK: - Vector 3 operations

prefix func - (v: TDVector3) -> TDVector3 {
    return TDVector3Negate(v)
}

func + (left: TDVector3, right: TDVector3) -> TDVector3 {
    return TDVector3Add(left, right)
}

func - (left: TDVector3, right: TDVector3) -> TDVector3 {
    return TDVector3Subtract(left, right)
}

func * (left: TDVector3, right: TDVector3) -> TDVector3 {
    return TDVector3Multiply(left, right)
}

func / (left: TDVector3, right: TDVector3) -> TDVector3 {
    return TDVector3Divide(left, right)
}

func + (left: TDVector3, right: GLfloat) -> TDVector3 {
    return TDVector3AddScalar(left, right)
}

func - (left: TDVector3, right: GLfloat) -> TDVector3 {
    return TDVector3SubtractScalar(left, right)
}

func * (left: TDVector3, right: GLfloat) -> TDVector3 {
    return TDVector3MultiplyScalar(left, right)
}

func / (left: TDVector3, right: GLfloat) -> TDVector3 {
    return TDVector3DivideScalar(left, right)
}

func == (left: TDVector3, right: TDVector3) -> Bool {
    return TDVector3AllEqualToVector3(left, right)
}

func > (left: TDVector3, right: TDVector3) -> Bool {
    return TDVector3AllGreaterThanVector3(left, right)
}

func >= (left: TDVector3, right: TDVector3) -> Bool {
    return TDVector3AllGreaterThanOrEqualToVector3(left, right)
}

func == (left: TDVector3, right: GLfloat) -> Bool {
    return TDVector3AllEqualToScalar(left, right)
}

func > (left: TDVector3, right: GLfloat) -> Bool {
    return TDVector3AllGreaterThanScalar(left, right)
}

func >= (left: TDVector3, right: GLfloat) -> Bool {
    return TDVector3AllGreaterThanOrEqualToScalar(left, right)
}

// MARK: - Vector 4 operations

prefix func - (v: TDVector4) -> TDVector4 {
    return TDVector4Negate(v)
}

func + (left: TDVector4, right: TDVector4) -> TDVector4 {
    return TDVector4Add(left, right)
}

func - (left: TDVector4, right: TDVector4) -> TDVector4 {
    return TDVector4Subtract(left, right)
}

func * (left: TDVector4, right: TDVector4) -> TDVector4 {
    return TDVector4Multiply(left, right)
}

func / (left: TDVector4, right: TDVector4) -> TDVector4 {
    return TDVector4Divide(left, right)
}

func + (left: TDVector4, right: GLfloat) -> TDVector4 {
    return TDVector4AddScalar(left, right)
}

func - (left: TDVector4, right: GLfloat) -> TDVector4 {
    return TDVector4SubtractScalar(left, right)
}

func * (left: TDVector4, right: GLfloat) -> TDVector4 {
    return TDVector4MultiplyScalar(left, right)
}

func / (left: TDVector4, right: GLfloat) -> TDVector4 {
    return TDVector4DivideScalar(left, right)
}

func == (left: TDVector4, right: TDVector4) -> Bool {
    return TDVector4AllEqualToVector4(left, right)
}

func > (left: TDVector4, right: TDVector4) -> Bool {
    return TDVector4AllGreaterThanVector4(left, right)
}

func >= (left: TDVector4, right: TDVector4) -> Bool {
    return TDVector4AllGreaterThanOrEqualToVector4(left, right)
}

func == (left: TDVector4, right: GLfloat) -> Bool {
    return TDVector4AllEqualToScalar(left, right)
}

func > (left: TDVector4, right: GLfloat) -> Bool {
    return TDVector4AllGreaterThanScalar(left, right)
}

func >= (left: TDVector4, right: GLfloat) -> Bool {
    return TDVector4AllGreaterThanOrEqualToScalar(left, right)
}

// MARK: - Uniform vector functions

func FloatPointer<T>(array: [T]) -> UnsafePointer<GLfloat> {
    return UnsafePointer<GLfloat>(UnsafePointer<Void>(array))
}

func glUniform2fv(location: GLint, vector: TDVector2) {
    var copy = vector
    glUniform2fv(location, 1, TDVector2Pointer(&copy))
}

func glUniform2fv(location: GLint, vectors: [TDVector2]) {
    glUniform2fv(location, GLsizei(vectors.count), FloatPointer(vectors))
}

func glUniform3fv(location: GLint, vector: TDVector3) {
    var copy = vector
    glUniform3fv(location, 1, TDVector3Pointer(&copy))
}

func glUniform3fv(location: GLint, vectors: [TDVector3]) {
    glUniform3fv(location, GLsizei(vectors.count), FloatPointer(vectors))
}

func glUniform4fv(location: GLint, vector: TDVector4) {
    var copy = vector
    glUniform4fv(location, 1, TDVector4Pointer(&copy))
}

func glUniform4fv(location: GLint, vectors: [TDVector4]) {
    glUniform4fv(location, GLsizei(vectors.count), FloatPointer(vectors))
}

func glUniformMatrix2fv(location: GLint, transpose: GLboolean, matrix: TDMatrix2) {
    var copy = matrix
    glUniformMatrix2fv(location, 1, transpose, TDMatrix2Pointer(&copy))
}

func glUniformMatrix2fv(location: GLint, transpose: GLboolean, matrices: [TDMatrix2]) {
    glUniformMatrix2fv(location, GLsizei(matrices.count), transpose, FloatPointer(matrices))
}

func glUniformMatrix3fv(location: GLint, transpose: GLboolean, matrix: TDMatrix3) {
    var copy = matrix
    glUniformMatrix3fv(location, 1, transpose, TDMatrix3Pointer(&copy))
}

func glUniformMatrix3fv(location: GLint, transpose: GLboolean, matrices: [TDMatrix3]) {
    glUniformMatrix3fv(location, GLsizei(matrices.count), transpose, FloatPointer(matrices))
}

func glUniformMatrix4fv(location: GLint, transpose: GLboolean, matrix: TDMatrix4) {
    var copy = matrix
    glUniformMatrix4fv(location, 1, transpose, TDMatrix4Pointer(&copy))
}

func glUniformMatrix4fv(location: GLint, transpose: GLboolean, matrices: [TDMatrix4]) {
    glUniformMatrix4fv(location, GLsizei(matrices.count), transpose, FloatPointer(matrices))
}

// MARK - Buffer data

func glBufferData<T>(target: GLenum, data: [T], usage: GLenum) {
    let unsafePointerToData = UnsafePointer<Void>(data)
    glBufferData(target, sizeof(T) * data.count, unsafePointerToData, usage)
}
