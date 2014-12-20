---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-2.528687, 1.38222, -0.3136611, 1, 0, 0, 1,
-2.484312, 1.142172, -0.9542455, 1, 0.007843138, 0, 1,
-2.353869, -1.515801, -2.397746, 1, 0.01176471, 0, 1,
-2.296556, -0.07847732, -2.607683, 1, 0.01960784, 0, 1,
-2.267079, -0.8278323, -3.156176, 1, 0.02352941, 0, 1,
-2.218184, 0.6366052, -1.282317, 1, 0.03137255, 0, 1,
-2.195055, -0.1499319, -1.852086, 1, 0.03529412, 0, 1,
-2.192262, -0.2911447, -0.01522729, 1, 0.04313726, 0, 1,
-2.191475, 0.584066, -2.857117, 1, 0.04705882, 0, 1,
-2.182208, -0.8797607, -2.687817, 1, 0.05490196, 0, 1,
-2.145314, 1.271316, -1.598628, 1, 0.05882353, 0, 1,
-2.139302, -0.4939453, -1.735131, 1, 0.06666667, 0, 1,
-2.126757, -0.7239001, -1.772156, 1, 0.07058824, 0, 1,
-2.109895, 0.4203621, -0.361822, 1, 0.07843138, 0, 1,
-2.099837, -0.2808305, -1.858385, 1, 0.08235294, 0, 1,
-2.021549, -0.02693845, -0.7101561, 1, 0.09019608, 0, 1,
-2.013341, 0.5771573, -1.178567, 1, 0.09411765, 0, 1,
-1.994804, -0.2008646, -4.073905, 1, 0.1019608, 0, 1,
-1.992233, -1.669767, -3.457791, 1, 0.1098039, 0, 1,
-1.99215, 1.756666, -0.6812539, 1, 0.1137255, 0, 1,
-1.986626, 0.1206796, -2.423014, 1, 0.1215686, 0, 1,
-1.95495, -0.2667256, -0.4245241, 1, 0.1254902, 0, 1,
-1.943876, 0.8915653, 0.8767622, 1, 0.1333333, 0, 1,
-1.926801, -0.5391608, -1.551391, 1, 0.1372549, 0, 1,
-1.922, 1.384979, -0.1499308, 1, 0.145098, 0, 1,
-1.894693, -0.4095093, -1.961891, 1, 0.1490196, 0, 1,
-1.888753, -0.1186417, -3.10163, 1, 0.1568628, 0, 1,
-1.880418, 0.3046701, -0.1222365, 1, 0.1607843, 0, 1,
-1.873433, 0.6578698, -2.439151, 1, 0.1686275, 0, 1,
-1.861796, -0.1433852, -2.789821, 1, 0.172549, 0, 1,
-1.858998, -1.006261, -2.221994, 1, 0.1803922, 0, 1,
-1.857227, 0.3403765, -1.25433, 1, 0.1843137, 0, 1,
-1.829452, -0.8251781, -0.9701072, 1, 0.1921569, 0, 1,
-1.812922, 0.1844303, 0.6547616, 1, 0.1960784, 0, 1,
-1.807985, 0.3879727, -1.470637, 1, 0.2039216, 0, 1,
-1.781911, -0.95938, -1.329031, 1, 0.2117647, 0, 1,
-1.769179, -0.3684776, -0.3473569, 1, 0.2156863, 0, 1,
-1.7504, 1.551496, 0.2182773, 1, 0.2235294, 0, 1,
-1.749715, 0.7260056, -1.424228, 1, 0.227451, 0, 1,
-1.736006, 1.163554, -0.6953362, 1, 0.2352941, 0, 1,
-1.732613, 0.5288782, -1.166096, 1, 0.2392157, 0, 1,
-1.686929, 0.3925648, -1.416623, 1, 0.2470588, 0, 1,
-1.682515, -0.7053961, -1.478752, 1, 0.2509804, 0, 1,
-1.681602, 0.220949, -3.238086, 1, 0.2588235, 0, 1,
-1.677928, -0.06270608, -0.5424406, 1, 0.2627451, 0, 1,
-1.674514, -2.003248, -1.68918, 1, 0.2705882, 0, 1,
-1.673205, -0.05841253, -4.832662, 1, 0.2745098, 0, 1,
-1.671578, 2.228483, 0.4904208, 1, 0.282353, 0, 1,
-1.660471, -0.01235274, -1.928084, 1, 0.2862745, 0, 1,
-1.653298, -1.361283, -2.870885, 1, 0.2941177, 0, 1,
-1.653004, 0.01490466, -3.564101, 1, 0.3019608, 0, 1,
-1.641477, 1.232267, -1.127017, 1, 0.3058824, 0, 1,
-1.637272, -1.080234, -3.75191, 1, 0.3137255, 0, 1,
-1.62938, 0.2426293, 1.021701, 1, 0.3176471, 0, 1,
-1.61593, 1.477775, -0.7680612, 1, 0.3254902, 0, 1,
-1.613495, -0.6737809, -0.9402482, 1, 0.3294118, 0, 1,
-1.606936, 1.370713, -1.242451, 1, 0.3372549, 0, 1,
-1.575817, -1.398542, -2.446965, 1, 0.3411765, 0, 1,
-1.574886, 0.9497413, -2.309531, 1, 0.3490196, 0, 1,
-1.569204, -0.4599592, 0.1618998, 1, 0.3529412, 0, 1,
-1.566614, -1.358969, -2.458593, 1, 0.3607843, 0, 1,
-1.556215, 0.02640717, -2.861399, 1, 0.3647059, 0, 1,
-1.552513, -1.743579, -1.419775, 1, 0.372549, 0, 1,
-1.53515, 0.3906027, -0.6780113, 1, 0.3764706, 0, 1,
-1.52165, 0.7018018, -0.3321922, 1, 0.3843137, 0, 1,
-1.492314, -1.270055, -0.8723214, 1, 0.3882353, 0, 1,
-1.489246, 0.1567651, -2.051006, 1, 0.3960784, 0, 1,
-1.481806, 1.463548, 1.362345, 1, 0.4039216, 0, 1,
-1.479714, 1.523539, 0.1145822, 1, 0.4078431, 0, 1,
-1.479001, 1.062646, -1.786194, 1, 0.4156863, 0, 1,
-1.478868, -1.043931, -3.55374, 1, 0.4196078, 0, 1,
-1.476125, 0.8730773, -2.358448, 1, 0.427451, 0, 1,
-1.464819, -0.01805439, -3.236906, 1, 0.4313726, 0, 1,
-1.464183, -0.6983735, -1.221473, 1, 0.4392157, 0, 1,
-1.462168, -1.505646, -1.926256, 1, 0.4431373, 0, 1,
-1.45322, 1.374733, 1.532561, 1, 0.4509804, 0, 1,
-1.432388, 0.9471651, -0.3444778, 1, 0.454902, 0, 1,
-1.424659, 0.6403383, -1.2976, 1, 0.4627451, 0, 1,
-1.419827, -2.262427, -2.722515, 1, 0.4666667, 0, 1,
-1.402772, -1.377127, -2.368076, 1, 0.4745098, 0, 1,
-1.398948, 1.333564, -1.582567, 1, 0.4784314, 0, 1,
-1.392736, -0.9027995, -1.708155, 1, 0.4862745, 0, 1,
-1.391199, 0.0536747, -0.805697, 1, 0.4901961, 0, 1,
-1.389668, -0.5074073, -2.312421, 1, 0.4980392, 0, 1,
-1.38124, 0.1251372, -1.550886, 1, 0.5058824, 0, 1,
-1.378747, 1.590705, 0.6211079, 1, 0.509804, 0, 1,
-1.377255, -1.516912, -2.75296, 1, 0.5176471, 0, 1,
-1.359581, 1.166969, -1.033091, 1, 0.5215687, 0, 1,
-1.358481, -1.557938, -3.075307, 1, 0.5294118, 0, 1,
-1.353831, 0.8939597, 1.127679, 1, 0.5333334, 0, 1,
-1.352314, -0.484624, -2.392185, 1, 0.5411765, 0, 1,
-1.343461, -1.429869, -4.408628, 1, 0.5450981, 0, 1,
-1.333611, -0.4783261, -2.531627, 1, 0.5529412, 0, 1,
-1.333094, -0.533839, -3.762574, 1, 0.5568628, 0, 1,
-1.331403, -0.5864689, -3.137676, 1, 0.5647059, 0, 1,
-1.323662, 1.111364, -1.083258, 1, 0.5686275, 0, 1,
-1.316306, 0.807802, -0.2817988, 1, 0.5764706, 0, 1,
-1.313613, -0.05863058, -2.138162, 1, 0.5803922, 0, 1,
-1.311091, 0.2074335, -1.668073, 1, 0.5882353, 0, 1,
-1.308789, 0.2263405, -1.533725, 1, 0.5921569, 0, 1,
-1.296787, -0.2428231, -2.67998, 1, 0.6, 0, 1,
-1.294947, 0.2231147, -0.476496, 1, 0.6078432, 0, 1,
-1.293376, -0.7747827, -5.20333, 1, 0.6117647, 0, 1,
-1.283832, 0.240021, -1.438082, 1, 0.6196079, 0, 1,
-1.281389, -1.299994, -1.31035, 1, 0.6235294, 0, 1,
-1.266621, 0.9129981, -0.7235681, 1, 0.6313726, 0, 1,
-1.265887, -0.8284011, -3.361492, 1, 0.6352941, 0, 1,
-1.251512, -0.9686643, -1.623996, 1, 0.6431373, 0, 1,
-1.251509, 0.7761593, -0.4967592, 1, 0.6470588, 0, 1,
-1.250098, -1.431099, -2.661809, 1, 0.654902, 0, 1,
-1.248578, 1.371953, -1.533967, 1, 0.6588235, 0, 1,
-1.237521, -0.3909687, -1.005591, 1, 0.6666667, 0, 1,
-1.221961, 1.31834, -1.809178, 1, 0.6705883, 0, 1,
-1.220854, -0.05034124, -1.410591, 1, 0.6784314, 0, 1,
-1.219488, 0.6649538, 0.6654253, 1, 0.682353, 0, 1,
-1.211903, 0.2246637, -2.479506, 1, 0.6901961, 0, 1,
-1.211638, 0.8289768, -1.343662, 1, 0.6941177, 0, 1,
-1.196815, -0.3815986, -2.947851, 1, 0.7019608, 0, 1,
-1.196239, -0.2899473, -1.620917, 1, 0.7098039, 0, 1,
-1.195694, -1.369177, -1.521213, 1, 0.7137255, 0, 1,
-1.194304, 1.6781, -0.7880592, 1, 0.7215686, 0, 1,
-1.192681, -0.3472502, -1.899971, 1, 0.7254902, 0, 1,
-1.154433, 0.7178653, -2.002672, 1, 0.7333333, 0, 1,
-1.152123, -1.295752, -2.532162, 1, 0.7372549, 0, 1,
-1.146654, 0.7941651, 0.3353834, 1, 0.7450981, 0, 1,
-1.145956, 0.3802267, -0.8289145, 1, 0.7490196, 0, 1,
-1.145694, -0.31653, -1.241927, 1, 0.7568628, 0, 1,
-1.142103, -1.033683, -0.5898205, 1, 0.7607843, 0, 1,
-1.140387, 1.661782, 0.2398909, 1, 0.7686275, 0, 1,
-1.136973, 0.07879711, -1.565746, 1, 0.772549, 0, 1,
-1.134549, 0.9561688, -0.4636405, 1, 0.7803922, 0, 1,
-1.127435, -2.147437, -1.856024, 1, 0.7843137, 0, 1,
-1.126297, 1.374955, 0.3329329, 1, 0.7921569, 0, 1,
-1.12051, 0.6062025, -1.564548, 1, 0.7960784, 0, 1,
-1.118659, 0.4404846, -2.095456, 1, 0.8039216, 0, 1,
-1.106388, 0.2165658, -1.533611, 1, 0.8117647, 0, 1,
-1.103232, 1.039163, -0.2616643, 1, 0.8156863, 0, 1,
-1.102672, -0.8388413, -3.154174, 1, 0.8235294, 0, 1,
-1.100346, 0.09025383, -0.5397366, 1, 0.827451, 0, 1,
-1.099515, -0.08785548, -0.6495565, 1, 0.8352941, 0, 1,
-1.097396, 0.3661144, -1.656759, 1, 0.8392157, 0, 1,
-1.094873, -1.466709, -2.700826, 1, 0.8470588, 0, 1,
-1.09449, 1.022913, -0.03452772, 1, 0.8509804, 0, 1,
-1.093593, -2.037932, -1.664563, 1, 0.8588235, 0, 1,
-1.091016, -1.215512, -3.505409, 1, 0.8627451, 0, 1,
-1.086211, -0.07712384, -0.4444211, 1, 0.8705882, 0, 1,
-1.079181, -1.567666, -2.424079, 1, 0.8745098, 0, 1,
-1.075771, -0.1186788, -1.213129, 1, 0.8823529, 0, 1,
-1.071772, -1.111577, -2.517633, 1, 0.8862745, 0, 1,
-1.064763, 0.5873511, -1.725173, 1, 0.8941177, 0, 1,
-1.061656, -0.111311, -2.140342, 1, 0.8980392, 0, 1,
-1.061498, -0.100347, -0.900003, 1, 0.9058824, 0, 1,
-1.045119, -0.6746153, -2.919959, 1, 0.9137255, 0, 1,
-1.044945, -0.6350168, -2.432677, 1, 0.9176471, 0, 1,
-1.042943, -0.844745, -0.9081311, 1, 0.9254902, 0, 1,
-1.039639, 0.5268533, -2.737604, 1, 0.9294118, 0, 1,
-1.028401, 0.883085, -1.915328, 1, 0.9372549, 0, 1,
-1.022342, 0.5636378, -0.06643006, 1, 0.9411765, 0, 1,
-1.020494, -0.5157537, -1.349946, 1, 0.9490196, 0, 1,
-1.014374, 0.4947732, -0.1467123, 1, 0.9529412, 0, 1,
-1.012924, 0.04510425, -2.529612, 1, 0.9607843, 0, 1,
-1.010309, -0.4170341, -2.438042, 1, 0.9647059, 0, 1,
-1.006409, -0.2294823, -2.369345, 1, 0.972549, 0, 1,
-1.00459, -2.304379, -2.216915, 1, 0.9764706, 0, 1,
-1.003912, -0.8889194, -2.002107, 1, 0.9843137, 0, 1,
-1.002671, -0.6959603, -1.209644, 1, 0.9882353, 0, 1,
-0.999746, 0.9661559, -0.5043831, 1, 0.9960784, 0, 1,
-0.990876, -2.471909, -3.870635, 0.9960784, 1, 0, 1,
-0.98646, -1.320846, -1.55229, 0.9921569, 1, 0, 1,
-0.9860863, 0.9892284, 0.09597085, 0.9843137, 1, 0, 1,
-0.9815065, 2.271153, 0.4726523, 0.9803922, 1, 0, 1,
-0.974501, -1.524009, -2.216778, 0.972549, 1, 0, 1,
-0.9742591, -0.08448401, -0.2791676, 0.9686275, 1, 0, 1,
-0.9727845, -0.6808715, -4.85216, 0.9607843, 1, 0, 1,
-0.9717519, -0.9071462, -1.396269, 0.9568627, 1, 0, 1,
-0.9701643, -1.055007, -1.767262, 0.9490196, 1, 0, 1,
-0.9652382, -0.8873206, -1.558874, 0.945098, 1, 0, 1,
-0.9573814, -0.648495, -2.011273, 0.9372549, 1, 0, 1,
-0.9570403, 0.4229234, -1.19425, 0.9333333, 1, 0, 1,
-0.9523162, -2.919868, -3.198791, 0.9254902, 1, 0, 1,
-0.9474295, -0.4272257, -1.562827, 0.9215686, 1, 0, 1,
-0.9449826, 1.651418, -1.082731, 0.9137255, 1, 0, 1,
-0.941996, -0.1854012, -0.9863576, 0.9098039, 1, 0, 1,
-0.9347405, -0.9078659, -4.009591, 0.9019608, 1, 0, 1,
-0.9339499, -1.310678, -0.9754246, 0.8941177, 1, 0, 1,
-0.9334123, -0.7275653, -3.01575, 0.8901961, 1, 0, 1,
-0.9277576, -0.9233696, -4.067169, 0.8823529, 1, 0, 1,
-0.9265795, 1.126317, -1.098061, 0.8784314, 1, 0, 1,
-0.9252676, -1.216243, -2.532191, 0.8705882, 1, 0, 1,
-0.9244887, 0.94762, 0.03345302, 0.8666667, 1, 0, 1,
-0.923919, 1.788623, -0.4934374, 0.8588235, 1, 0, 1,
-0.9231718, 0.4643794, -0.4666073, 0.854902, 1, 0, 1,
-0.9213262, -0.3361686, -2.734631, 0.8470588, 1, 0, 1,
-0.9151403, -1.111498, -4.859529, 0.8431373, 1, 0, 1,
-0.9069236, 1.582687, -0.03951927, 0.8352941, 1, 0, 1,
-0.905597, -0.2765256, -3.403295, 0.8313726, 1, 0, 1,
-0.9038605, -0.4576631, -3.278305, 0.8235294, 1, 0, 1,
-0.8931233, 0.9689397, -3.038649, 0.8196079, 1, 0, 1,
-0.8929881, -0.6455686, -1.56014, 0.8117647, 1, 0, 1,
-0.8910163, -0.1470615, -1.698642, 0.8078431, 1, 0, 1,
-0.8897535, -0.7330973, -3.327977, 0.8, 1, 0, 1,
-0.8896263, 0.1871605, -0.8703454, 0.7921569, 1, 0, 1,
-0.8859831, -0.2013173, -2.938089, 0.7882353, 1, 0, 1,
-0.8814513, -0.3205432, -2.427636, 0.7803922, 1, 0, 1,
-0.8777667, 0.7255277, -1.999642, 0.7764706, 1, 0, 1,
-0.8756193, -0.4938582, 0.06777003, 0.7686275, 1, 0, 1,
-0.8612044, -0.629675, -2.191838, 0.7647059, 1, 0, 1,
-0.8589872, 0.7929265, -1.24825, 0.7568628, 1, 0, 1,
-0.8552819, 0.2121378, -1.024148, 0.7529412, 1, 0, 1,
-0.8534808, -0.4814485, -4.227601, 0.7450981, 1, 0, 1,
-0.8528674, -0.2151978, 0.4224427, 0.7411765, 1, 0, 1,
-0.8507695, -0.5568478, -2.451285, 0.7333333, 1, 0, 1,
-0.8507304, 1.063381, -0.3882217, 0.7294118, 1, 0, 1,
-0.8406228, 1.668293, 0.6918603, 0.7215686, 1, 0, 1,
-0.8275163, -0.4372812, -1.527227, 0.7176471, 1, 0, 1,
-0.8245767, -0.3958449, -3.034006, 0.7098039, 1, 0, 1,
-0.8218523, -0.7353178, -3.477034, 0.7058824, 1, 0, 1,
-0.8191684, 0.0385471, -1.946368, 0.6980392, 1, 0, 1,
-0.8139259, 0.7095661, -0.7615564, 0.6901961, 1, 0, 1,
-0.8108016, 2.303963, 0.09255639, 0.6862745, 1, 0, 1,
-0.8096348, 0.4515386, -0.4216059, 0.6784314, 1, 0, 1,
-0.806202, -0.7955741, -3.76769, 0.6745098, 1, 0, 1,
-0.801109, 0.8459775, -1.109992, 0.6666667, 1, 0, 1,
-0.7947992, 0.4391091, -2.080425, 0.6627451, 1, 0, 1,
-0.7932621, 2.097106, 0.4064733, 0.654902, 1, 0, 1,
-0.7893324, -0.2865376, -2.546147, 0.6509804, 1, 0, 1,
-0.7889621, 0.6341758, -1.370706, 0.6431373, 1, 0, 1,
-0.7864167, -0.2005352, -3.010697, 0.6392157, 1, 0, 1,
-0.7851125, 1.071916, 0.4145777, 0.6313726, 1, 0, 1,
-0.7850517, 1.104188, -0.851626, 0.627451, 1, 0, 1,
-0.7806615, -0.05202685, -1.217274, 0.6196079, 1, 0, 1,
-0.7749515, -0.3031907, -1.037127, 0.6156863, 1, 0, 1,
-0.7719363, -0.2224115, -0.9921757, 0.6078432, 1, 0, 1,
-0.7599981, -0.1082031, -1.078408, 0.6039216, 1, 0, 1,
-0.7557253, -2.611359, -3.035122, 0.5960785, 1, 0, 1,
-0.7536643, 2.454149, 0.3651744, 0.5882353, 1, 0, 1,
-0.7519026, -0.06384674, -1.791673, 0.5843138, 1, 0, 1,
-0.7510883, 0.5280171, 0.4284897, 0.5764706, 1, 0, 1,
-0.7472737, 0.7119326, -0.9956916, 0.572549, 1, 0, 1,
-0.7465703, -1.112565, -2.39394, 0.5647059, 1, 0, 1,
-0.7458307, -0.6235477, -3.622783, 0.5607843, 1, 0, 1,
-0.7419869, -0.2840805, -2.661279, 0.5529412, 1, 0, 1,
-0.7417191, 0.0188231, -1.291464, 0.5490196, 1, 0, 1,
-0.735649, 1.03826, 0.4829992, 0.5411765, 1, 0, 1,
-0.7347463, -0.2216719, -2.158657, 0.5372549, 1, 0, 1,
-0.7171828, 0.08422981, -3.564227, 0.5294118, 1, 0, 1,
-0.7141957, -0.2346558, -3.165572, 0.5254902, 1, 0, 1,
-0.7125793, -1.015695, -0.913098, 0.5176471, 1, 0, 1,
-0.7122186, -2.134454, -3.448959, 0.5137255, 1, 0, 1,
-0.7043198, 1.784699, -0.7804479, 0.5058824, 1, 0, 1,
-0.7041759, 0.1750532, -3.141558, 0.5019608, 1, 0, 1,
-0.6982623, 0.4554451, -0.2003307, 0.4941176, 1, 0, 1,
-0.6981412, -1.779935, -1.155236, 0.4862745, 1, 0, 1,
-0.6972214, -0.6152416, -1.290676, 0.4823529, 1, 0, 1,
-0.6932248, -0.4983566, -2.484152, 0.4745098, 1, 0, 1,
-0.6857397, 1.173462, 2.09406, 0.4705882, 1, 0, 1,
-0.6828033, 1.58435, -1.139923, 0.4627451, 1, 0, 1,
-0.6790786, 0.07860769, -0.3047326, 0.4588235, 1, 0, 1,
-0.6737168, -0.4204242, -3.179635, 0.4509804, 1, 0, 1,
-0.6723369, -0.6973004, -2.474112, 0.4470588, 1, 0, 1,
-0.6716186, 0.004548656, -1.310499, 0.4392157, 1, 0, 1,
-0.6714754, -0.777003, -2.719781, 0.4352941, 1, 0, 1,
-0.6699948, 0.09082308, -1.545657, 0.427451, 1, 0, 1,
-0.6643308, 1.782898, 0.6039714, 0.4235294, 1, 0, 1,
-0.6639122, -0.7816966, -2.375642, 0.4156863, 1, 0, 1,
-0.6635681, -0.4738726, -1.229443, 0.4117647, 1, 0, 1,
-0.6557807, 0.126187, -0.955977, 0.4039216, 1, 0, 1,
-0.6527656, 0.1235497, -0.2577472, 0.3960784, 1, 0, 1,
-0.6520968, 0.04895797, -1.534304, 0.3921569, 1, 0, 1,
-0.6511105, -1.697434, -2.806838, 0.3843137, 1, 0, 1,
-0.6472453, 0.7922339, 0.6004835, 0.3803922, 1, 0, 1,
-0.6472234, 0.2495084, -2.757497, 0.372549, 1, 0, 1,
-0.6471955, 1.779689, -1.112168, 0.3686275, 1, 0, 1,
-0.6392012, -1.130096, -1.567966, 0.3607843, 1, 0, 1,
-0.6378771, -0.9259155, -2.394017, 0.3568628, 1, 0, 1,
-0.632338, 0.9227904, -0.2411109, 0.3490196, 1, 0, 1,
-0.6308327, 1.960244, -2.310665, 0.345098, 1, 0, 1,
-0.6300173, 0.04150705, -1.617587, 0.3372549, 1, 0, 1,
-0.6297439, -0.9407677, -1.113693, 0.3333333, 1, 0, 1,
-0.6270904, -1.184365, -1.947629, 0.3254902, 1, 0, 1,
-0.620381, 1.940673, 0.4774765, 0.3215686, 1, 0, 1,
-0.619781, -0.312273, -0.9419871, 0.3137255, 1, 0, 1,
-0.6123614, -0.09732466, -1.386173, 0.3098039, 1, 0, 1,
-0.6114458, 1.113476, 0.3069659, 0.3019608, 1, 0, 1,
-0.6078222, 0.7147544, -0.07842337, 0.2941177, 1, 0, 1,
-0.6062919, 0.6297563, -0.50855, 0.2901961, 1, 0, 1,
-0.5895282, 1.38295, -0.671441, 0.282353, 1, 0, 1,
-0.5854266, 1.490995, -0.5320035, 0.2784314, 1, 0, 1,
-0.580013, -0.6631008, -2.769343, 0.2705882, 1, 0, 1,
-0.5796299, 1.228187, -1.449003, 0.2666667, 1, 0, 1,
-0.5783315, 0.09810004, -1.002158, 0.2588235, 1, 0, 1,
-0.5778546, -0.2003318, -1.507303, 0.254902, 1, 0, 1,
-0.5771545, -0.3818046, -2.338591, 0.2470588, 1, 0, 1,
-0.5651055, 1.542528, -0.06072965, 0.2431373, 1, 0, 1,
-0.5632226, -0.3511455, -0.6119823, 0.2352941, 1, 0, 1,
-0.5630754, 1.161582, 0.5560018, 0.2313726, 1, 0, 1,
-0.5498872, -1.473697, -2.757361, 0.2235294, 1, 0, 1,
-0.545279, 0.5211035, -0.2941982, 0.2196078, 1, 0, 1,
-0.5408909, 0.02244379, 1.177852, 0.2117647, 1, 0, 1,
-0.5372368, 2.081682, -0.6955221, 0.2078431, 1, 0, 1,
-0.5306764, 0.9369631, -1.133127, 0.2, 1, 0, 1,
-0.5300984, -1.63415, -1.896054, 0.1921569, 1, 0, 1,
-0.5284951, 1.266666, -1.659454, 0.1882353, 1, 0, 1,
-0.5275039, 0.5566664, -0.2556738, 0.1803922, 1, 0, 1,
-0.5264159, -0.8107424, -4.080964, 0.1764706, 1, 0, 1,
-0.5254879, 0.527243, 0.09108586, 0.1686275, 1, 0, 1,
-0.5190121, 1.596485, -0.6840372, 0.1647059, 1, 0, 1,
-0.517648, -0.45776, -3.008783, 0.1568628, 1, 0, 1,
-0.5151391, -0.8771082, -2.515467, 0.1529412, 1, 0, 1,
-0.5109673, -0.2596743, -3.227247, 0.145098, 1, 0, 1,
-0.5092911, -0.7178795, -4.030653, 0.1411765, 1, 0, 1,
-0.5076358, 0.3293255, -0.04673254, 0.1333333, 1, 0, 1,
-0.5015275, 0.8981222, -0.5453015, 0.1294118, 1, 0, 1,
-0.4998522, 0.2185225, -1.205329, 0.1215686, 1, 0, 1,
-0.4989717, 1.133279, 0.04357376, 0.1176471, 1, 0, 1,
-0.4957991, 1.317829, -0.04188564, 0.1098039, 1, 0, 1,
-0.4890391, -2.032478, -3.139253, 0.1058824, 1, 0, 1,
-0.4874972, -1.973424, -1.916889, 0.09803922, 1, 0, 1,
-0.4873408, -0.1888261, -2.095291, 0.09019608, 1, 0, 1,
-0.4863376, 1.107188, 0.960792, 0.08627451, 1, 0, 1,
-0.4840999, 1.192754, -0.3725134, 0.07843138, 1, 0, 1,
-0.4836645, -0.4995059, -1.816222, 0.07450981, 1, 0, 1,
-0.4828534, -0.3560946, -2.170462, 0.06666667, 1, 0, 1,
-0.4772679, -0.4756293, -0.7829192, 0.0627451, 1, 0, 1,
-0.4762608, -0.1318595, -0.6740757, 0.05490196, 1, 0, 1,
-0.4747954, 1.303899, -1.414106, 0.05098039, 1, 0, 1,
-0.4724046, -1.192607, -3.208711, 0.04313726, 1, 0, 1,
-0.466742, -1.125892, -3.118546, 0.03921569, 1, 0, 1,
-0.4536344, 1.299447, 0.5548489, 0.03137255, 1, 0, 1,
-0.4529702, 0.03407165, -1.424393, 0.02745098, 1, 0, 1,
-0.4500477, 0.05312714, -1.007708, 0.01960784, 1, 0, 1,
-0.4423104, -1.369647, -3.113449, 0.01568628, 1, 0, 1,
-0.4361723, -1.279021, -2.740444, 0.007843138, 1, 0, 1,
-0.4327594, -1.250348, -2.68313, 0.003921569, 1, 0, 1,
-0.4306692, -0.629054, -3.950438, 0, 1, 0.003921569, 1,
-0.4298667, -0.07908341, -1.422925, 0, 1, 0.01176471, 1,
-0.4267292, 0.4739195, -0.5706056, 0, 1, 0.01568628, 1,
-0.4165275, 0.1164701, -3.068907, 0, 1, 0.02352941, 1,
-0.4155886, -1.554944, -4.201157, 0, 1, 0.02745098, 1,
-0.4129367, -0.4640709, -0.8239698, 0, 1, 0.03529412, 1,
-0.4092145, 0.5012587, -2.473142, 0, 1, 0.03921569, 1,
-0.4014731, 1.231104, 0.06242279, 0, 1, 0.04705882, 1,
-0.3953247, 0.3897043, -1.241549, 0, 1, 0.05098039, 1,
-0.3931994, 0.6416886, -0.2134477, 0, 1, 0.05882353, 1,
-0.3922322, -0.07210489, -2.568758, 0, 1, 0.0627451, 1,
-0.390862, 0.9949505, -1.517017, 0, 1, 0.07058824, 1,
-0.390632, 0.8320937, -0.05916362, 0, 1, 0.07450981, 1,
-0.3887947, 0.8386539, 0.2327976, 0, 1, 0.08235294, 1,
-0.3885726, 0.7582135, -0.611672, 0, 1, 0.08627451, 1,
-0.3873845, 0.37218, -1.205271, 0, 1, 0.09411765, 1,
-0.3845021, -0.2986322, -4.0819, 0, 1, 0.1019608, 1,
-0.3790741, -0.3794344, -1.289229, 0, 1, 0.1058824, 1,
-0.3789544, -1.254443, -3.710173, 0, 1, 0.1137255, 1,
-0.3766636, -0.4729522, -2.178481, 0, 1, 0.1176471, 1,
-0.3746146, 2.306387, 2.00926, 0, 1, 0.1254902, 1,
-0.3702483, -0.3474591, -2.584696, 0, 1, 0.1294118, 1,
-0.3654055, -0.6514062, -2.475676, 0, 1, 0.1372549, 1,
-0.362695, 0.7877852, -1.145195, 0, 1, 0.1411765, 1,
-0.3569311, 0.7098926, 0.7227941, 0, 1, 0.1490196, 1,
-0.3547913, 0.7356319, -0.5751683, 0, 1, 0.1529412, 1,
-0.3540667, 0.6545497, -0.7549374, 0, 1, 0.1607843, 1,
-0.3527065, -0.1097455, -2.826119, 0, 1, 0.1647059, 1,
-0.3524481, -0.296463, -2.61813, 0, 1, 0.172549, 1,
-0.3518326, -1.497442, -4.28688, 0, 1, 0.1764706, 1,
-0.3509748, 0.5826287, 0.8126163, 0, 1, 0.1843137, 1,
-0.3456968, 1.898051, 0.7933701, 0, 1, 0.1882353, 1,
-0.3422103, -0.3799654, -3.251055, 0, 1, 0.1960784, 1,
-0.3384606, 0.2077514, -0.8082781, 0, 1, 0.2039216, 1,
-0.3353328, 0.7513432, -0.06522582, 0, 1, 0.2078431, 1,
-0.3331087, -0.5054857, -3.086535, 0, 1, 0.2156863, 1,
-0.3327048, 0.8915461, -1.004907, 0, 1, 0.2196078, 1,
-0.3279053, 0.8311101, 0.6603137, 0, 1, 0.227451, 1,
-0.3223778, -1.434607, -2.481379, 0, 1, 0.2313726, 1,
-0.3214254, -1.454721, -2.721272, 0, 1, 0.2392157, 1,
-0.3060405, -0.4845014, -1.609524, 0, 1, 0.2431373, 1,
-0.3021, -1.286534, -3.439062, 0, 1, 0.2509804, 1,
-0.2985056, -0.06924236, -2.290831, 0, 1, 0.254902, 1,
-0.295497, 0.389939, 0.2393044, 0, 1, 0.2627451, 1,
-0.2951029, 0.3784504, -0.1027736, 0, 1, 0.2666667, 1,
-0.2944249, -1.150575, -4.534934, 0, 1, 0.2745098, 1,
-0.294115, -0.3012549, -1.77849, 0, 1, 0.2784314, 1,
-0.2927557, 1.341208, -0.4385998, 0, 1, 0.2862745, 1,
-0.2921935, -1.258838, -1.99235, 0, 1, 0.2901961, 1,
-0.2875604, 1.785616, -2.444406, 0, 1, 0.2980392, 1,
-0.2868145, 0.03110495, 1.971802, 0, 1, 0.3058824, 1,
-0.2863833, -0.04958859, -2.704109, 0, 1, 0.3098039, 1,
-0.2841531, -0.5845311, -3.579229, 0, 1, 0.3176471, 1,
-0.2830975, 0.1279513, -1.527096, 0, 1, 0.3215686, 1,
-0.2792831, -0.02420833, -1.955501, 0, 1, 0.3294118, 1,
-0.2783786, 0.2278984, -1.582602, 0, 1, 0.3333333, 1,
-0.2781671, 0.6027189, -0.973103, 0, 1, 0.3411765, 1,
-0.2775728, -0.1812785, -2.921353, 0, 1, 0.345098, 1,
-0.2750632, 0.6676025, 0.2288565, 0, 1, 0.3529412, 1,
-0.2748248, -0.8850266, -0.8447149, 0, 1, 0.3568628, 1,
-0.2738117, -0.9446567, -1.282793, 0, 1, 0.3647059, 1,
-0.2737503, 0.5456416, -1.515364, 0, 1, 0.3686275, 1,
-0.2724289, 0.949061, -0.5459363, 0, 1, 0.3764706, 1,
-0.2695372, -0.334001, -1.812159, 0, 1, 0.3803922, 1,
-0.2672678, -0.06689484, -1.350057, 0, 1, 0.3882353, 1,
-0.2627098, 1.078987, 1.416553, 0, 1, 0.3921569, 1,
-0.2575116, 0.7180473, 0.0843775, 0, 1, 0.4, 1,
-0.2516994, -0.1977867, -1.850469, 0, 1, 0.4078431, 1,
-0.2512677, 0.9436628, 1.180892, 0, 1, 0.4117647, 1,
-0.2500457, 1.210304, -0.1134028, 0, 1, 0.4196078, 1,
-0.248306, -1.453927, -3.468074, 0, 1, 0.4235294, 1,
-0.2402708, 0.1856363, -1.414408, 0, 1, 0.4313726, 1,
-0.2385404, -0.939211, -2.985119, 0, 1, 0.4352941, 1,
-0.2340848, -0.8568338, -1.851229, 0, 1, 0.4431373, 1,
-0.2299599, -0.1621727, -1.433196, 0, 1, 0.4470588, 1,
-0.2295949, -0.4986757, -1.444438, 0, 1, 0.454902, 1,
-0.2265878, 0.496546, -2.543626, 0, 1, 0.4588235, 1,
-0.2241577, 1.023343, -0.5246643, 0, 1, 0.4666667, 1,
-0.2218708, -0.6172372, -3.852895, 0, 1, 0.4705882, 1,
-0.2196972, -1.084493, -3.802403, 0, 1, 0.4784314, 1,
-0.2172229, 0.2743846, -0.3163476, 0, 1, 0.4823529, 1,
-0.2119718, 0.3199196, 1.014285, 0, 1, 0.4901961, 1,
-0.2074924, 0.05059226, -2.666227, 0, 1, 0.4941176, 1,
-0.2066555, 2.281282, 0.007116845, 0, 1, 0.5019608, 1,
-0.2063891, -0.4323738, -4.615469, 0, 1, 0.509804, 1,
-0.2050315, 0.9213081, 0.6639821, 0, 1, 0.5137255, 1,
-0.2020939, 0.313291, -1.257378, 0, 1, 0.5215687, 1,
-0.2013709, -0.3911248, -0.6505452, 0, 1, 0.5254902, 1,
-0.200829, -0.3799112, -2.932071, 0, 1, 0.5333334, 1,
-0.198394, 0.815511, 1.145505, 0, 1, 0.5372549, 1,
-0.1974775, 0.4445886, -1.340035, 0, 1, 0.5450981, 1,
-0.1967695, -1.090506, -1.215257, 0, 1, 0.5490196, 1,
-0.1961159, 1.221794, -1.37323, 0, 1, 0.5568628, 1,
-0.194225, -1.210496, -3.491347, 0, 1, 0.5607843, 1,
-0.1913287, -1.627405, -3.785654, 0, 1, 0.5686275, 1,
-0.1883334, 0.1945063, -0.5763291, 0, 1, 0.572549, 1,
-0.1864753, 0.4267466, -0.3880985, 0, 1, 0.5803922, 1,
-0.1832867, -0.2333451, -1.698143, 0, 1, 0.5843138, 1,
-0.1829823, -0.1062995, -2.762771, 0, 1, 0.5921569, 1,
-0.1811283, -0.9512626, -3.157631, 0, 1, 0.5960785, 1,
-0.1802013, 1.327878, -0.04300861, 0, 1, 0.6039216, 1,
-0.1718414, 1.225047, 0.9296424, 0, 1, 0.6117647, 1,
-0.1708547, 1.469452, -0.2453525, 0, 1, 0.6156863, 1,
-0.1690293, -0.6758775, -0.9450172, 0, 1, 0.6235294, 1,
-0.168718, -1.840282, -2.298828, 0, 1, 0.627451, 1,
-0.1683992, -1.604966, -2.560508, 0, 1, 0.6352941, 1,
-0.1656983, -0.245645, -2.314123, 0, 1, 0.6392157, 1,
-0.1633284, -2.113133, -4.2113, 0, 1, 0.6470588, 1,
-0.1612781, 1.014786, -0.5621082, 0, 1, 0.6509804, 1,
-0.1611108, 1.3133, 1.933096, 0, 1, 0.6588235, 1,
-0.1560232, -0.9520595, -2.574525, 0, 1, 0.6627451, 1,
-0.1551838, 0.2402655, -1.219036, 0, 1, 0.6705883, 1,
-0.1528979, 0.4936864, -0.03813027, 0, 1, 0.6745098, 1,
-0.1469284, 0.8794452, 0.6387842, 0, 1, 0.682353, 1,
-0.1422085, 0.8753236, 1.246129, 0, 1, 0.6862745, 1,
-0.1409056, -0.9754667, -4.714534, 0, 1, 0.6941177, 1,
-0.1403501, 1.118087, -0.4936379, 0, 1, 0.7019608, 1,
-0.139508, -0.02959182, -1.118709, 0, 1, 0.7058824, 1,
-0.1392052, -0.9318458, -3.28692, 0, 1, 0.7137255, 1,
-0.1386888, 1.580179, 0.06468878, 0, 1, 0.7176471, 1,
-0.1379545, -0.043961, -2.742834, 0, 1, 0.7254902, 1,
-0.1365002, 0.9064694, -2.017972, 0, 1, 0.7294118, 1,
-0.1352944, 0.3378762, 0.4403207, 0, 1, 0.7372549, 1,
-0.1331247, -0.5444394, -3.011024, 0, 1, 0.7411765, 1,
-0.1317303, 0.512049, -0.7428665, 0, 1, 0.7490196, 1,
-0.1300342, -0.8111786, -2.147827, 0, 1, 0.7529412, 1,
-0.1271333, -0.1828672, -1.754846, 0, 1, 0.7607843, 1,
-0.1268338, 0.07547743, -0.887631, 0, 1, 0.7647059, 1,
-0.12395, 0.1674911, 0.643172, 0, 1, 0.772549, 1,
-0.118657, 1.63371, -0.7616887, 0, 1, 0.7764706, 1,
-0.112226, -0.2840289, -1.918402, 0, 1, 0.7843137, 1,
-0.1122226, 0.1308289, -1.121982, 0, 1, 0.7882353, 1,
-0.1121141, 0.5403056, 0.1020117, 0, 1, 0.7960784, 1,
-0.1102149, -0.7119552, -2.122115, 0, 1, 0.8039216, 1,
-0.1049628, 0.5811926, 0.7907479, 0, 1, 0.8078431, 1,
-0.1011273, -0.7042142, -3.738009, 0, 1, 0.8156863, 1,
-0.09960414, -1.254412, -5.28467, 0, 1, 0.8196079, 1,
-0.09832156, 1.024305, 0.5051221, 0, 1, 0.827451, 1,
-0.09342353, -0.9349697, -3.555973, 0, 1, 0.8313726, 1,
-0.08885894, -1.297364, -4.815127, 0, 1, 0.8392157, 1,
-0.08798897, 0.5993122, -0.5791529, 0, 1, 0.8431373, 1,
-0.0851822, 0.198379, -0.1384843, 0, 1, 0.8509804, 1,
-0.08415399, -1.959668, -2.242989, 0, 1, 0.854902, 1,
-0.08130715, -0.06931553, -2.540407, 0, 1, 0.8627451, 1,
-0.07815807, 1.49508, -1.751492, 0, 1, 0.8666667, 1,
-0.07698894, -0.7717462, -4.162178, 0, 1, 0.8745098, 1,
-0.07233243, -1.395491, -2.837801, 0, 1, 0.8784314, 1,
-0.06791064, 0.5700426, -1.189917, 0, 1, 0.8862745, 1,
-0.06691859, 0.7075325, -0.06525719, 0, 1, 0.8901961, 1,
-0.06520778, -0.03541042, -2.306746, 0, 1, 0.8980392, 1,
-0.06441164, -0.08533885, -3.00741, 0, 1, 0.9058824, 1,
-0.06084342, -2.135967, -3.128783, 0, 1, 0.9098039, 1,
-0.06078967, -0.06211108, -3.470086, 0, 1, 0.9176471, 1,
-0.06044697, 0.602421, -1.199809, 0, 1, 0.9215686, 1,
-0.0586398, 0.2933974, -1.043439, 0, 1, 0.9294118, 1,
-0.05687873, -1.206253, -2.180402, 0, 1, 0.9333333, 1,
-0.05567305, 0.3890761, -0.5074788, 0, 1, 0.9411765, 1,
-0.05543067, -0.7154878, -3.838306, 0, 1, 0.945098, 1,
-0.04931064, -0.955305, -2.165662, 0, 1, 0.9529412, 1,
-0.04672681, 0.8475861, -1.559721, 0, 1, 0.9568627, 1,
-0.04617101, -0.3028869, -3.852132, 0, 1, 0.9647059, 1,
-0.0419523, 0.1774839, 0.09949688, 0, 1, 0.9686275, 1,
-0.04046145, -0.6143105, -3.679029, 0, 1, 0.9764706, 1,
-0.03953658, 0.8769499, 1.869033, 0, 1, 0.9803922, 1,
-0.03581074, 1.439829, -0.6144986, 0, 1, 0.9882353, 1,
-0.03265612, -0.8428275, -2.166337, 0, 1, 0.9921569, 1,
-0.0313235, 1.509142, 0.6955997, 0, 1, 1, 1,
-0.03128057, 0.3434488, -0.9835461, 0, 0.9921569, 1, 1,
-0.02720127, -1.128629, -3.000884, 0, 0.9882353, 1, 1,
-0.01087977, 0.541998, -0.5767967, 0, 0.9803922, 1, 1,
-0.009898612, -1.287109, -3.026974, 0, 0.9764706, 1, 1,
-0.00968302, 1.578797, -0.5051532, 0, 0.9686275, 1, 1,
-0.007740553, 0.1081309, 0.02787967, 0, 0.9647059, 1, 1,
-0.004567379, 1.651961, -0.2271447, 0, 0.9568627, 1, 1,
-0.0005213158, -0.6615203, -2.770804, 0, 0.9529412, 1, 1,
0.0002218301, -0.1118443, 2.659696, 0, 0.945098, 1, 1,
0.0008586373, 1.114162, 0.4315335, 0, 0.9411765, 1, 1,
0.004043228, -0.8911266, 2.569857, 0, 0.9333333, 1, 1,
0.007920842, 1.305118, -1.434236, 0, 0.9294118, 1, 1,
0.008359777, -0.4316725, 3.642885, 0, 0.9215686, 1, 1,
0.01157946, -1.132854, 2.117983, 0, 0.9176471, 1, 1,
0.01728625, 2.515104, 0.01907137, 0, 0.9098039, 1, 1,
0.01784449, 0.3483156, -0.3641334, 0, 0.9058824, 1, 1,
0.01803938, 0.2914643, -0.3207139, 0, 0.8980392, 1, 1,
0.01943212, -0.9462907, 2.749484, 0, 0.8901961, 1, 1,
0.0206938, 1.374642, -1.573593, 0, 0.8862745, 1, 1,
0.0258594, -0.951423, 2.593499, 0, 0.8784314, 1, 1,
0.02633394, 0.102864, 2.495681, 0, 0.8745098, 1, 1,
0.02684222, 0.6803965, -0.1857948, 0, 0.8666667, 1, 1,
0.02897226, 1.318308, 1.676535, 0, 0.8627451, 1, 1,
0.04004401, -0.05532116, 3.97705, 0, 0.854902, 1, 1,
0.04250346, 0.1053173, 0.1193648, 0, 0.8509804, 1, 1,
0.04433135, -0.9079428, 0.9310725, 0, 0.8431373, 1, 1,
0.0478755, -0.8605892, 2.216127, 0, 0.8392157, 1, 1,
0.0489395, -2.327049, 3.186553, 0, 0.8313726, 1, 1,
0.04932375, -1.028243, 3.733488, 0, 0.827451, 1, 1,
0.04937862, 0.9609867, 0.5723116, 0, 0.8196079, 1, 1,
0.05185393, -0.08813888, 2.517221, 0, 0.8156863, 1, 1,
0.05244229, 0.7743884, 0.4102119, 0, 0.8078431, 1, 1,
0.05491796, 0.7850447, -0.3359464, 0, 0.8039216, 1, 1,
0.0576518, 0.6592181, 1.538033, 0, 0.7960784, 1, 1,
0.06395549, 1.964455, -0.8973781, 0, 0.7882353, 1, 1,
0.07484749, 1.668686, -1.840874, 0, 0.7843137, 1, 1,
0.07895509, -1.5762, 3.078543, 0, 0.7764706, 1, 1,
0.07979974, 0.2611861, -0.6502145, 0, 0.772549, 1, 1,
0.08138856, -0.04934786, 0.5097813, 0, 0.7647059, 1, 1,
0.08449145, 0.6075464, 0.644328, 0, 0.7607843, 1, 1,
0.08610895, -0.2736599, 3.06752, 0, 0.7529412, 1, 1,
0.08798162, 0.06921477, 0.386146, 0, 0.7490196, 1, 1,
0.08997048, 0.7615971, -1.731755, 0, 0.7411765, 1, 1,
0.09150513, 0.3501887, -1.186702, 0, 0.7372549, 1, 1,
0.09727306, 1.035771, 0.02423234, 0, 0.7294118, 1, 1,
0.1211136, 0.3269326, 1.250293, 0, 0.7254902, 1, 1,
0.1288259, 1.459878, -0.3617843, 0, 0.7176471, 1, 1,
0.1297168, -0.2866372, 2.327181, 0, 0.7137255, 1, 1,
0.1310834, 0.7692236, 1.946267, 0, 0.7058824, 1, 1,
0.1322573, -0.1834931, 4.069282, 0, 0.6980392, 1, 1,
0.1373282, -0.2766984, 2.614863, 0, 0.6941177, 1, 1,
0.140688, -2.33195, 3.073225, 0, 0.6862745, 1, 1,
0.1419475, -1.358157, 2.052664, 0, 0.682353, 1, 1,
0.1453789, 0.3037555, 1.40362, 0, 0.6745098, 1, 1,
0.157967, -1.436599, 3.532274, 0, 0.6705883, 1, 1,
0.162844, 0.9391438, 1.573057, 0, 0.6627451, 1, 1,
0.1649018, 0.4146288, 2.178972, 0, 0.6588235, 1, 1,
0.165321, -0.163961, 1.261331, 0, 0.6509804, 1, 1,
0.1658961, -0.05692144, 2.58254, 0, 0.6470588, 1, 1,
0.1670181, 2.736642, -1.252254, 0, 0.6392157, 1, 1,
0.1679718, 1.259861, 0.1063117, 0, 0.6352941, 1, 1,
0.1685381, 0.5042989, 1.296119, 0, 0.627451, 1, 1,
0.1744693, 0.2100241, 0.2219869, 0, 0.6235294, 1, 1,
0.1757946, -0.6298076, 1.804234, 0, 0.6156863, 1, 1,
0.1762172, 0.9446214, -0.6797432, 0, 0.6117647, 1, 1,
0.1809344, 1.566013, 0.4167128, 0, 0.6039216, 1, 1,
0.184203, -0.4253675, 3.245855, 0, 0.5960785, 1, 1,
0.1851993, -0.3883375, 2.583658, 0, 0.5921569, 1, 1,
0.1881479, -1.903867, 2.404833, 0, 0.5843138, 1, 1,
0.1908708, 0.950304, 0.6223262, 0, 0.5803922, 1, 1,
0.1932193, 1.270624, -0.6601605, 0, 0.572549, 1, 1,
0.1999822, 0.1270487, -0.1760315, 0, 0.5686275, 1, 1,
0.2018192, 0.7973187, 2.425999, 0, 0.5607843, 1, 1,
0.205049, 1.000677, -0.6580887, 0, 0.5568628, 1, 1,
0.2050633, -0.9071556, 1.900585, 0, 0.5490196, 1, 1,
0.2052537, 0.3091539, 0.9221755, 0, 0.5450981, 1, 1,
0.2054668, 1.239951, -0.01507949, 0, 0.5372549, 1, 1,
0.2070646, 0.7406905, 0.2075211, 0, 0.5333334, 1, 1,
0.2077736, -0.6737561, 3.23154, 0, 0.5254902, 1, 1,
0.2089349, -0.01278674, 0.6472082, 0, 0.5215687, 1, 1,
0.2093836, 1.482873, -0.004598628, 0, 0.5137255, 1, 1,
0.2117622, 0.4778717, 1.68662, 0, 0.509804, 1, 1,
0.212663, -1.332464, 3.999668, 0, 0.5019608, 1, 1,
0.2148121, -0.1757408, 1.302405, 0, 0.4941176, 1, 1,
0.2176777, 0.07381421, 1.885322, 0, 0.4901961, 1, 1,
0.2189252, -0.3928924, 2.961523, 0, 0.4823529, 1, 1,
0.2225202, -0.3095515, 0.4309552, 0, 0.4784314, 1, 1,
0.2268157, -0.7182222, 3.073397, 0, 0.4705882, 1, 1,
0.2287093, -0.7387508, 4.702161, 0, 0.4666667, 1, 1,
0.232386, 1.294326, -1.692598, 0, 0.4588235, 1, 1,
0.2341061, -0.09779826, 0.3642957, 0, 0.454902, 1, 1,
0.2357519, 0.1702688, 0.7531813, 0, 0.4470588, 1, 1,
0.2411929, 0.5263928, 2.741905, 0, 0.4431373, 1, 1,
0.2441645, 0.5260193, 1.047943, 0, 0.4352941, 1, 1,
0.2441895, -0.9589528, 1.921878, 0, 0.4313726, 1, 1,
0.2453391, -0.2859612, 1.844748, 0, 0.4235294, 1, 1,
0.2460652, 0.6822029, 1.176062, 0, 0.4196078, 1, 1,
0.2501557, -0.330065, 0.4295183, 0, 0.4117647, 1, 1,
0.2564921, 0.1535831, -0.1850003, 0, 0.4078431, 1, 1,
0.2571843, -0.5710447, 2.456571, 0, 0.4, 1, 1,
0.2576875, -0.1170202, 2.491956, 0, 0.3921569, 1, 1,
0.257879, -0.09547623, 1.315369, 0, 0.3882353, 1, 1,
0.2580989, 0.8112524, 0.2353619, 0, 0.3803922, 1, 1,
0.2583165, -0.4079781, 2.31473, 0, 0.3764706, 1, 1,
0.2630186, 1.462185, 1.663302, 0, 0.3686275, 1, 1,
0.2666502, -0.3647709, 3.965634, 0, 0.3647059, 1, 1,
0.2673233, -0.3066172, 4.449594, 0, 0.3568628, 1, 1,
0.2704066, 0.5549264, 0.6547443, 0, 0.3529412, 1, 1,
0.2718817, 0.3997795, -1.011335, 0, 0.345098, 1, 1,
0.2766198, 0.2100146, 1.361822, 0, 0.3411765, 1, 1,
0.2773893, 0.9435548, 1.844919, 0, 0.3333333, 1, 1,
0.2774243, -0.5202184, 2.435036, 0, 0.3294118, 1, 1,
0.2784739, 1.22264, -0.001176066, 0, 0.3215686, 1, 1,
0.2787693, 1.033548, 0.161307, 0, 0.3176471, 1, 1,
0.2853268, -1.79775, 1.884036, 0, 0.3098039, 1, 1,
0.2876796, 0.2805963, -0.8384837, 0, 0.3058824, 1, 1,
0.2885891, -0.745964, -0.04376972, 0, 0.2980392, 1, 1,
0.2912081, 0.6928098, -0.9485987, 0, 0.2901961, 1, 1,
0.2916874, -0.6985182, 3.649557, 0, 0.2862745, 1, 1,
0.2929097, -0.06907383, 2.780573, 0, 0.2784314, 1, 1,
0.2937697, 0.7689638, 0.5629712, 0, 0.2745098, 1, 1,
0.2945487, 0.5710198, 1.162116, 0, 0.2666667, 1, 1,
0.2952757, 0.8308743, 0.4828856, 0, 0.2627451, 1, 1,
0.2956428, 1.948331, -0.8849469, 0, 0.254902, 1, 1,
0.2966935, 1.357482, -0.360276, 0, 0.2509804, 1, 1,
0.3014069, 0.5546242, 1.302399, 0, 0.2431373, 1, 1,
0.3027124, 0.005058974, 3.376742, 0, 0.2392157, 1, 1,
0.3031413, -0.3157702, 1.33872, 0, 0.2313726, 1, 1,
0.3039526, 0.8747814, -0.09998199, 0, 0.227451, 1, 1,
0.305498, -0.110498, 2.808251, 0, 0.2196078, 1, 1,
0.3062615, 0.1803998, 1.181405, 0, 0.2156863, 1, 1,
0.3067789, 1.019645, -1.510006, 0, 0.2078431, 1, 1,
0.313694, -0.6475375, -0.06811826, 0, 0.2039216, 1, 1,
0.3151109, -0.95178, 1.99894, 0, 0.1960784, 1, 1,
0.3164281, -1.135961, 2.491727, 0, 0.1882353, 1, 1,
0.3183886, 0.2755679, 0.3690702, 0, 0.1843137, 1, 1,
0.3195492, -2.020894, 1.995138, 0, 0.1764706, 1, 1,
0.3277319, 1.422552, 0.00670441, 0, 0.172549, 1, 1,
0.3281941, 0.2238496, 0.4375025, 0, 0.1647059, 1, 1,
0.3294261, 0.4099092, 0.5537806, 0, 0.1607843, 1, 1,
0.3298285, 1.685779, -1.352031, 0, 0.1529412, 1, 1,
0.3360163, 0.5476989, 1.464059, 0, 0.1490196, 1, 1,
0.33933, 0.2700306, 2.459861, 0, 0.1411765, 1, 1,
0.3417817, -0.212778, 1.67686, 0, 0.1372549, 1, 1,
0.3443813, -0.1112463, 1.459222, 0, 0.1294118, 1, 1,
0.3443994, -0.6867663, 2.041903, 0, 0.1254902, 1, 1,
0.3464062, -0.9560493, 2.099186, 0, 0.1176471, 1, 1,
0.3464799, 0.2354282, 2.967759, 0, 0.1137255, 1, 1,
0.3472326, 0.5951604, 2.154019, 0, 0.1058824, 1, 1,
0.3497823, 1.419039, 0.449939, 0, 0.09803922, 1, 1,
0.351898, 0.598296, 0.2189593, 0, 0.09411765, 1, 1,
0.3538851, -0.09233127, 1.349961, 0, 0.08627451, 1, 1,
0.3540674, 0.5438737, 0.5006505, 0, 0.08235294, 1, 1,
0.3544395, -1.402861, 2.437252, 0, 0.07450981, 1, 1,
0.3562638, 0.2378674, 1.333958, 0, 0.07058824, 1, 1,
0.3570597, 0.3378454, 0.6734731, 0, 0.0627451, 1, 1,
0.3578052, 1.021947, 0.2407488, 0, 0.05882353, 1, 1,
0.361252, -0.6619192, 1.527211, 0, 0.05098039, 1, 1,
0.3650888, -0.451359, 3.864812, 0, 0.04705882, 1, 1,
0.368288, -0.9654596, 1.81752, 0, 0.03921569, 1, 1,
0.3733269, 0.2316949, 0.8921757, 0, 0.03529412, 1, 1,
0.3744552, -0.02518468, 1.894235, 0, 0.02745098, 1, 1,
0.3770222, -0.3048235, 2.689953, 0, 0.02352941, 1, 1,
0.3805134, -0.2571642, 1.023355, 0, 0.01568628, 1, 1,
0.3882783, -0.4869076, 2.025042, 0, 0.01176471, 1, 1,
0.3962614, 0.02177402, 2.077373, 0, 0.003921569, 1, 1,
0.39743, 0.3742568, -0.7485899, 0.003921569, 0, 1, 1,
0.399571, 1.078704, -0.2269843, 0.007843138, 0, 1, 1,
0.4022018, 1.448144, -1.13988, 0.01568628, 0, 1, 1,
0.4049486, 0.0971464, 1.864266, 0.01960784, 0, 1, 1,
0.4056535, 0.2418243, 1.379659, 0.02745098, 0, 1, 1,
0.4061689, -1.501115, 3.178751, 0.03137255, 0, 1, 1,
0.4068919, 0.7259058, 0.2649371, 0.03921569, 0, 1, 1,
0.4129392, 0.02179472, 2.142844, 0.04313726, 0, 1, 1,
0.4200248, -2.437604, 3.065316, 0.05098039, 0, 1, 1,
0.4230073, -1.127808, 3.855603, 0.05490196, 0, 1, 1,
0.4238944, -0.9867761, 3.138422, 0.0627451, 0, 1, 1,
0.4247672, 0.02259349, 1.966042, 0.06666667, 0, 1, 1,
0.4373718, -0.1178805, 2.739355, 0.07450981, 0, 1, 1,
0.4384576, -0.4828319, 1.522133, 0.07843138, 0, 1, 1,
0.4395263, 0.008366459, 0.5951863, 0.08627451, 0, 1, 1,
0.4429063, 0.3075584, -1.872232, 0.09019608, 0, 1, 1,
0.4472298, 1.098285, -0.3153355, 0.09803922, 0, 1, 1,
0.4505005, -0.474127, 2.739258, 0.1058824, 0, 1, 1,
0.4671483, 0.7640927, 0.7590742, 0.1098039, 0, 1, 1,
0.4686503, 0.621817, -0.4504621, 0.1176471, 0, 1, 1,
0.4694135, -0.1704968, 1.427266, 0.1215686, 0, 1, 1,
0.4696614, 0.8922204, 0.2967938, 0.1294118, 0, 1, 1,
0.4723624, -0.4368479, 3.422119, 0.1333333, 0, 1, 1,
0.4742992, -1.591416, 3.722627, 0.1411765, 0, 1, 1,
0.4744249, 1.198881, 1.403594, 0.145098, 0, 1, 1,
0.476446, 0.7043791, 0.06396163, 0.1529412, 0, 1, 1,
0.4771426, -1.38077, 1.424978, 0.1568628, 0, 1, 1,
0.4800409, -1.869022, 2.295997, 0.1647059, 0, 1, 1,
0.4822354, 0.5709752, 1.435421, 0.1686275, 0, 1, 1,
0.4831556, 1.012184, -1.267842, 0.1764706, 0, 1, 1,
0.4839368, 1.287711, -0.2546969, 0.1803922, 0, 1, 1,
0.4862885, 1.055952, 0.7452165, 0.1882353, 0, 1, 1,
0.4865629, 0.3045642, 1.642195, 0.1921569, 0, 1, 1,
0.4886428, -0.3121801, 1.937853, 0.2, 0, 1, 1,
0.4895439, -0.1111818, 2.786066, 0.2078431, 0, 1, 1,
0.4912517, -1.230548, 3.488911, 0.2117647, 0, 1, 1,
0.4964713, 0.7968568, 0.5883444, 0.2196078, 0, 1, 1,
0.5027751, -0.4395557, 1.777431, 0.2235294, 0, 1, 1,
0.5042907, 0.2783428, 2.228166, 0.2313726, 0, 1, 1,
0.5045562, -1.584902, 2.173104, 0.2352941, 0, 1, 1,
0.5047856, 0.9712075, -0.2558567, 0.2431373, 0, 1, 1,
0.5048794, 0.6303833, 0.9666305, 0.2470588, 0, 1, 1,
0.5053512, -1.150442, 2.697454, 0.254902, 0, 1, 1,
0.5063893, 1.048578, -0.7749109, 0.2588235, 0, 1, 1,
0.5090883, 0.02621529, 2.077328, 0.2666667, 0, 1, 1,
0.5102195, -2.697753, 2.400829, 0.2705882, 0, 1, 1,
0.5119767, -2.142928, 3.442434, 0.2784314, 0, 1, 1,
0.523196, -0.7538046, 3.017258, 0.282353, 0, 1, 1,
0.5267129, 0.4898967, 1.49362, 0.2901961, 0, 1, 1,
0.5327251, -0.003491832, 3.062203, 0.2941177, 0, 1, 1,
0.5429044, 0.3451253, 1.157023, 0.3019608, 0, 1, 1,
0.5441875, 0.6632004, 0.03283761, 0.3098039, 0, 1, 1,
0.5475128, 0.2430057, 1.683891, 0.3137255, 0, 1, 1,
0.5497772, -0.5149149, 4.119093, 0.3215686, 0, 1, 1,
0.5529038, 0.8371381, -0.08174295, 0.3254902, 0, 1, 1,
0.5536572, 0.1508326, 1.835191, 0.3333333, 0, 1, 1,
0.5573441, 0.423344, 0.3259361, 0.3372549, 0, 1, 1,
0.5601383, -0.5790999, 3.885433, 0.345098, 0, 1, 1,
0.5677747, 1.202846, 1.080952, 0.3490196, 0, 1, 1,
0.5717114, -1.398505, 1.224724, 0.3568628, 0, 1, 1,
0.5736677, -1.735372, 2.348092, 0.3607843, 0, 1, 1,
0.5747075, -2.395165, 3.295161, 0.3686275, 0, 1, 1,
0.5749006, 0.4928877, 1.274024, 0.372549, 0, 1, 1,
0.5749068, 0.2637778, 1.879128, 0.3803922, 0, 1, 1,
0.5769045, -0.6080365, 3.579963, 0.3843137, 0, 1, 1,
0.5869434, -1.324305, 2.532795, 0.3921569, 0, 1, 1,
0.5898768, 0.09029075, 1.069015, 0.3960784, 0, 1, 1,
0.5944154, -0.04209577, -0.3563582, 0.4039216, 0, 1, 1,
0.5945694, 0.1504029, 1.978471, 0.4117647, 0, 1, 1,
0.5947068, -0.5565642, 4.014817, 0.4156863, 0, 1, 1,
0.5952666, -1.433026, 2.33691, 0.4235294, 0, 1, 1,
0.5987943, -1.414453, 2.452571, 0.427451, 0, 1, 1,
0.5998421, -0.4911456, 2.947401, 0.4352941, 0, 1, 1,
0.6016335, -0.8186458, 2.975542, 0.4392157, 0, 1, 1,
0.6022057, -1.645096, 3.395775, 0.4470588, 0, 1, 1,
0.6032302, 1.417645, 1.176686, 0.4509804, 0, 1, 1,
0.6052146, -0.01968957, -0.290127, 0.4588235, 0, 1, 1,
0.6125692, -1.751615, 3.948707, 0.4627451, 0, 1, 1,
0.6132427, -0.5761591, 2.928222, 0.4705882, 0, 1, 1,
0.6133654, -0.1555644, 2.268646, 0.4745098, 0, 1, 1,
0.6135955, -1.008494, 2.796736, 0.4823529, 0, 1, 1,
0.6224419, 1.684623, 0.9463393, 0.4862745, 0, 1, 1,
0.6240625, 0.29421, 1.910304, 0.4941176, 0, 1, 1,
0.625576, 9.697481e-05, 1.903725, 0.5019608, 0, 1, 1,
0.6278654, 0.8718249, 0.8913956, 0.5058824, 0, 1, 1,
0.6311143, -2.543276, 3.697802, 0.5137255, 0, 1, 1,
0.6317073, 0.2326964, 0.3297606, 0.5176471, 0, 1, 1,
0.6402285, -1.481373, 1.419603, 0.5254902, 0, 1, 1,
0.6495091, 0.746715, 1.862319, 0.5294118, 0, 1, 1,
0.6498644, -0.8207549, 2.081706, 0.5372549, 0, 1, 1,
0.6559558, -0.9673131, 3.287759, 0.5411765, 0, 1, 1,
0.6697375, 0.2824621, 2.29404, 0.5490196, 0, 1, 1,
0.6729283, -0.2255407, 2.999638, 0.5529412, 0, 1, 1,
0.6739886, -0.6620178, 2.715119, 0.5607843, 0, 1, 1,
0.6794945, -0.01067413, 0.4115645, 0.5647059, 0, 1, 1,
0.681617, 1.437107, 1.206504, 0.572549, 0, 1, 1,
0.6821041, -0.9338461, 2.307428, 0.5764706, 0, 1, 1,
0.6824378, 0.1759712, 1.71183, 0.5843138, 0, 1, 1,
0.683433, 1.657155, 1.768226, 0.5882353, 0, 1, 1,
0.6877322, -0.2762544, 0.9266535, 0.5960785, 0, 1, 1,
0.6905544, -0.1132101, 1.084988, 0.6039216, 0, 1, 1,
0.6906683, 1.971658, 0.6650569, 0.6078432, 0, 1, 1,
0.693072, -0.3059501, 2.156574, 0.6156863, 0, 1, 1,
0.6989403, -0.3827653, 0.3876811, 0.6196079, 0, 1, 1,
0.6992849, 0.7400585, -0.5562428, 0.627451, 0, 1, 1,
0.7008897, 0.2236022, 2.725653, 0.6313726, 0, 1, 1,
0.7026541, 1.705184, -0.6875184, 0.6392157, 0, 1, 1,
0.7033386, -2.490188, 2.786515, 0.6431373, 0, 1, 1,
0.704551, 1.087898, 1.235534, 0.6509804, 0, 1, 1,
0.7092097, 0.4837875, 0.9683226, 0.654902, 0, 1, 1,
0.7106724, 0.3990507, -0.4779018, 0.6627451, 0, 1, 1,
0.7151836, 0.7777178, 1.35506, 0.6666667, 0, 1, 1,
0.7162533, -0.3134252, 2.718016, 0.6745098, 0, 1, 1,
0.7200209, -0.6374086, 3.231483, 0.6784314, 0, 1, 1,
0.7218048, 0.8134071, 1.014374, 0.6862745, 0, 1, 1,
0.7281824, 0.7663615, 0.4369528, 0.6901961, 0, 1, 1,
0.7298621, 1.345305, -0.5905236, 0.6980392, 0, 1, 1,
0.732664, 0.7127229, 0.6093058, 0.7058824, 0, 1, 1,
0.7368789, -1.330739, 2.315096, 0.7098039, 0, 1, 1,
0.7373555, -0.8110555, 1.591936, 0.7176471, 0, 1, 1,
0.740106, 0.79172, 1.763541, 0.7215686, 0, 1, 1,
0.7415377, -1.330946, 2.436007, 0.7294118, 0, 1, 1,
0.7484751, -0.007828282, 1.298162, 0.7333333, 0, 1, 1,
0.7497215, 2.579358, 1.158842, 0.7411765, 0, 1, 1,
0.7507999, -1.111027, 2.001404, 0.7450981, 0, 1, 1,
0.7514096, -0.1094576, 1.697675, 0.7529412, 0, 1, 1,
0.7540857, 1.084026, 0.5135165, 0.7568628, 0, 1, 1,
0.7558981, -0.1365601, 2.028735, 0.7647059, 0, 1, 1,
0.7593086, -0.778796, 2.281957, 0.7686275, 0, 1, 1,
0.763373, 0.551516, 0.950811, 0.7764706, 0, 1, 1,
0.7732967, 0.07612889, 0.8005157, 0.7803922, 0, 1, 1,
0.7795359, 0.7952801, 2.490661, 0.7882353, 0, 1, 1,
0.7795666, -1.826918, 2.053523, 0.7921569, 0, 1, 1,
0.7841769, 0.7121481, 3.184117, 0.8, 0, 1, 1,
0.7905078, -1.043199, 2.763791, 0.8078431, 0, 1, 1,
0.7930834, 0.0023886, 2.569644, 0.8117647, 0, 1, 1,
0.7993764, -0.7655852, 0.9366947, 0.8196079, 0, 1, 1,
0.8058919, -1.162667, 1.20823, 0.8235294, 0, 1, 1,
0.8100101, -0.767669, 1.200957, 0.8313726, 0, 1, 1,
0.8109029, -0.5315511, 2.445144, 0.8352941, 0, 1, 1,
0.8182961, 0.3814616, 0.6534166, 0.8431373, 0, 1, 1,
0.8193926, -0.570035, 2.524026, 0.8470588, 0, 1, 1,
0.8289134, 0.5921978, -0.3641332, 0.854902, 0, 1, 1,
0.8342687, -0.7185881, 2.243938, 0.8588235, 0, 1, 1,
0.8365761, -0.1045994, 0.51037, 0.8666667, 0, 1, 1,
0.8419088, 0.05200347, 2.469149, 0.8705882, 0, 1, 1,
0.8449244, -0.1027939, 1.568765, 0.8784314, 0, 1, 1,
0.8481874, 1.503861, -0.296262, 0.8823529, 0, 1, 1,
0.8482325, 0.9688907, 1.249798, 0.8901961, 0, 1, 1,
0.8484666, 0.5018205, 1.818581, 0.8941177, 0, 1, 1,
0.8551042, -1.48657, 1.710437, 0.9019608, 0, 1, 1,
0.8589638, 0.1515153, 1.83016, 0.9098039, 0, 1, 1,
0.8613721, -0.6289284, 1.914908, 0.9137255, 0, 1, 1,
0.873064, -1.653439, 2.030239, 0.9215686, 0, 1, 1,
0.8739201, -0.7208561, 1.313465, 0.9254902, 0, 1, 1,
0.8747023, -0.09442931, 2.376749, 0.9333333, 0, 1, 1,
0.8869397, 0.4192897, 0.4270353, 0.9372549, 0, 1, 1,
0.8886994, 0.2459562, 0.412097, 0.945098, 0, 1, 1,
0.8946667, 0.463601, 1.186889, 0.9490196, 0, 1, 1,
0.9033265, -0.575105, 3.031495, 0.9568627, 0, 1, 1,
0.9063321, -0.5845968, 3.317579, 0.9607843, 0, 1, 1,
0.9087605, 0.8305708, 0.847316, 0.9686275, 0, 1, 1,
0.9139376, 3.269264, -0.5673217, 0.972549, 0, 1, 1,
0.9196686, -0.3155369, 0.7979316, 0.9803922, 0, 1, 1,
0.9205554, 0.9658575, 1.680009, 0.9843137, 0, 1, 1,
0.9210547, -1.338295, 2.866181, 0.9921569, 0, 1, 1,
0.9211984, -1.653829, 2.356945, 0.9960784, 0, 1, 1,
0.9251869, -0.6017774, 1.303191, 1, 0, 0.9960784, 1,
0.9261392, 0.1063239, 2.788571, 1, 0, 0.9882353, 1,
0.9270352, 0.2081021, 1.093071, 1, 0, 0.9843137, 1,
0.9348799, -0.7470677, 2.404492, 1, 0, 0.9764706, 1,
0.9421899, -0.9413017, 2.659561, 1, 0, 0.972549, 1,
0.9428139, -0.8701335, 1.569802, 1, 0, 0.9647059, 1,
0.9442226, -0.08903221, 0.4975848, 1, 0, 0.9607843, 1,
0.9447394, 0.09621987, -0.2194573, 1, 0, 0.9529412, 1,
0.9453945, -0.3023325, 2.733311, 1, 0, 0.9490196, 1,
0.9454931, 0.5905394, 2.624213, 1, 0, 0.9411765, 1,
0.9496954, -0.8693422, 1.557117, 1, 0, 0.9372549, 1,
0.9535045, -0.9518261, 2.496178, 1, 0, 0.9294118, 1,
0.9540648, 1.332694, -1.246476, 1, 0, 0.9254902, 1,
0.971836, -0.1778175, 2.547559, 1, 0, 0.9176471, 1,
0.9740068, 1.53781, 1.660188, 1, 0, 0.9137255, 1,
0.9765338, 1.367604, 1.539117, 1, 0, 0.9058824, 1,
0.9841611, -0.4990502, 2.021815, 1, 0, 0.9019608, 1,
0.9867301, -0.5909618, 2.690156, 1, 0, 0.8941177, 1,
0.9891784, 2.405814, 0.7991005, 1, 0, 0.8862745, 1,
0.9918082, 1.407739, 1.56535, 1, 0, 0.8823529, 1,
0.9928154, -0.1684497, -0.02502041, 1, 0, 0.8745098, 1,
0.9969487, -0.1793964, 1.667869, 1, 0, 0.8705882, 1,
0.9985768, -0.8809593, 2.067313, 1, 0, 0.8627451, 1,
1.002072, -0.8225968, 1.697249, 1, 0, 0.8588235, 1,
1.007201, 1.86781, 1.109684, 1, 0, 0.8509804, 1,
1.008905, -0.4290305, 0.4184934, 1, 0, 0.8470588, 1,
1.009348, 0.5803208, 1.936067, 1, 0, 0.8392157, 1,
1.018523, 0.3166161, 1.212033, 1, 0, 0.8352941, 1,
1.023539, 0.3834049, 0.9650462, 1, 0, 0.827451, 1,
1.026824, -0.1504977, 1.041517, 1, 0, 0.8235294, 1,
1.027585, 0.533134, 0.7957437, 1, 0, 0.8156863, 1,
1.029013, 0.8819609, -0.4605621, 1, 0, 0.8117647, 1,
1.029437, 0.70587, 0.6375002, 1, 0, 0.8039216, 1,
1.0303, 2.269928, -0.3763771, 1, 0, 0.7960784, 1,
1.037011, -1.700284, 2.269053, 1, 0, 0.7921569, 1,
1.040082, 0.3835797, -0.05126368, 1, 0, 0.7843137, 1,
1.041158, -0.7919556, 1.080457, 1, 0, 0.7803922, 1,
1.060877, -1.373808, 3.225977, 1, 0, 0.772549, 1,
1.063112, 1.039081, 1.272379, 1, 0, 0.7686275, 1,
1.071233, -0.06477895, -0.6158336, 1, 0, 0.7607843, 1,
1.083027, 1.011042, 2.354697, 1, 0, 0.7568628, 1,
1.089699, -0.7083541, 2.99044, 1, 0, 0.7490196, 1,
1.094562, -0.05092959, 1.318772, 1, 0, 0.7450981, 1,
1.098327, -0.328422, 2.660401, 1, 0, 0.7372549, 1,
1.098823, 0.3143664, 2.439376, 1, 0, 0.7333333, 1,
1.102405, -0.562119, 2.300008, 1, 0, 0.7254902, 1,
1.107926, -0.6797301, 2.189676, 1, 0, 0.7215686, 1,
1.10798, 0.3875222, 0.156682, 1, 0, 0.7137255, 1,
1.125181, -0.3326872, -0.06824143, 1, 0, 0.7098039, 1,
1.125459, -1.460146, 1.259088, 1, 0, 0.7019608, 1,
1.130149, -1.583443, 2.946372, 1, 0, 0.6941177, 1,
1.136848, -1.310559, 3.280367, 1, 0, 0.6901961, 1,
1.137773, -1.650705, 1.443553, 1, 0, 0.682353, 1,
1.138326, -0.08764794, 1.748713, 1, 0, 0.6784314, 1,
1.172108, -0.5095696, 1.517498, 1, 0, 0.6705883, 1,
1.179216, -0.3166153, 2.241808, 1, 0, 0.6666667, 1,
1.181065, -1.144362, 2.130574, 1, 0, 0.6588235, 1,
1.193951, -0.4857042, 0.9959908, 1, 0, 0.654902, 1,
1.197466, 0.3882859, 2.655583, 1, 0, 0.6470588, 1,
1.198321, 0.7369661, -0.01688992, 1, 0, 0.6431373, 1,
1.199145, 0.589914, 2.649091, 1, 0, 0.6352941, 1,
1.199793, -0.9083256, 2.196159, 1, 0, 0.6313726, 1,
1.206042, -0.8861662, 2.672024, 1, 0, 0.6235294, 1,
1.210841, -0.2647863, -0.01464383, 1, 0, 0.6196079, 1,
1.211131, -0.1518938, 2.468676, 1, 0, 0.6117647, 1,
1.224742, -0.7991419, 2.622466, 1, 0, 0.6078432, 1,
1.225155, 0.5561172, 1.343873, 1, 0, 0.6, 1,
1.22685, 1.011705, 0.8456005, 1, 0, 0.5921569, 1,
1.231913, -1.16104, 1.453902, 1, 0, 0.5882353, 1,
1.254633, -0.7171742, 1.78586, 1, 0, 0.5803922, 1,
1.257225, -0.5376411, 0.4746223, 1, 0, 0.5764706, 1,
1.261674, -0.1412467, 1.834139, 1, 0, 0.5686275, 1,
1.267535, 1.035084, 0.1488589, 1, 0, 0.5647059, 1,
1.267999, 0.8442365, 0.757377, 1, 0, 0.5568628, 1,
1.270496, 2.249721, -0.3280867, 1, 0, 0.5529412, 1,
1.281821, 0.9549545, 0.8888535, 1, 0, 0.5450981, 1,
1.283413, -1.167199, 2.456207, 1, 0, 0.5411765, 1,
1.289716, 0.0437111, 0.5962312, 1, 0, 0.5333334, 1,
1.295624, 0.06915575, 2.43482, 1, 0, 0.5294118, 1,
1.296116, 1.098461, -0.13921, 1, 0, 0.5215687, 1,
1.301111, -0.1651536, 0.7543438, 1, 0, 0.5176471, 1,
1.303341, -0.4066843, 1.369825, 1, 0, 0.509804, 1,
1.305058, -1.43631, 3.20929, 1, 0, 0.5058824, 1,
1.31792, 1.864776, 2.251033, 1, 0, 0.4980392, 1,
1.319588, -0.2200732, 1.3369, 1, 0, 0.4901961, 1,
1.322846, -0.7245417, 3.702158, 1, 0, 0.4862745, 1,
1.332944, -0.4224894, 4.03737, 1, 0, 0.4784314, 1,
1.345577, -0.2657824, 2.51813, 1, 0, 0.4745098, 1,
1.352458, -0.4630931, 3.274429, 1, 0, 0.4666667, 1,
1.357229, -0.7966806, 2.4738, 1, 0, 0.4627451, 1,
1.359831, -1.462275, 1.492474, 1, 0, 0.454902, 1,
1.366195, -0.8560929, 1.352362, 1, 0, 0.4509804, 1,
1.381029, -1.015801, 1.909964, 1, 0, 0.4431373, 1,
1.383627, 0.9177285, 0.5416113, 1, 0, 0.4392157, 1,
1.391867, 0.1633551, 2.526203, 1, 0, 0.4313726, 1,
1.399398, 1.016602, 0.003647608, 1, 0, 0.427451, 1,
1.400786, -0.08375392, 1.680218, 1, 0, 0.4196078, 1,
1.406754, -0.3649842, 1.360506, 1, 0, 0.4156863, 1,
1.408118, 0.5659699, -0.009992321, 1, 0, 0.4078431, 1,
1.409294, 0.3247905, 1.035078, 1, 0, 0.4039216, 1,
1.420866, 0.4260959, 2.022979, 1, 0, 0.3960784, 1,
1.42617, 0.7137416, 2.171536, 1, 0, 0.3882353, 1,
1.427606, 0.1386468, 1.054465, 1, 0, 0.3843137, 1,
1.428399, -0.1111125, 0.1698631, 1, 0, 0.3764706, 1,
1.443626, -1.102703, 1.262087, 1, 0, 0.372549, 1,
1.456043, 0.7682561, 0.6179201, 1, 0, 0.3647059, 1,
1.458515, 2.199286, 1.905359, 1, 0, 0.3607843, 1,
1.472926, 0.2727236, 0.7229837, 1, 0, 0.3529412, 1,
1.479154, -0.1379626, 1.459052, 1, 0, 0.3490196, 1,
1.491973, 0.3843613, 3.267458, 1, 0, 0.3411765, 1,
1.492565, 0.6096757, 2.688518, 1, 0, 0.3372549, 1,
1.496095, -0.1521738, 1.35367, 1, 0, 0.3294118, 1,
1.501248, 0.380116, 1.270285, 1, 0, 0.3254902, 1,
1.506552, 0.7714857, -0.479633, 1, 0, 0.3176471, 1,
1.512293, 0.3149201, 0.7762766, 1, 0, 0.3137255, 1,
1.518273, -0.08415172, 1.511999, 1, 0, 0.3058824, 1,
1.529328, -0.2460754, -0.05377988, 1, 0, 0.2980392, 1,
1.530591, 0.6345383, -0.5318452, 1, 0, 0.2941177, 1,
1.546028, -0.4390495, 1.328429, 1, 0, 0.2862745, 1,
1.549786, -0.9957339, 3.269878, 1, 0, 0.282353, 1,
1.558542, 0.4531285, -0.01046858, 1, 0, 0.2745098, 1,
1.56724, -0.2186353, 0.8198607, 1, 0, 0.2705882, 1,
1.593475, 0.2805986, 1.09832, 1, 0, 0.2627451, 1,
1.609558, -0.0006398992, 1.390767, 1, 0, 0.2588235, 1,
1.612036, 0.3741334, 1.01388, 1, 0, 0.2509804, 1,
1.612585, 1.108464, -0.436752, 1, 0, 0.2470588, 1,
1.62277, -1.115393, 3.169515, 1, 0, 0.2392157, 1,
1.625277, -0.1749443, 1.897379, 1, 0, 0.2352941, 1,
1.628681, 0.8107048, 2.551625, 1, 0, 0.227451, 1,
1.661059, 0.2315484, 1.270993, 1, 0, 0.2235294, 1,
1.682314, 1.095594, 1.584824, 1, 0, 0.2156863, 1,
1.683467, -0.5172766, 1.222379, 1, 0, 0.2117647, 1,
1.685106, 0.133235, 1.513734, 1, 0, 0.2039216, 1,
1.702735, -2.243383, 2.083179, 1, 0, 0.1960784, 1,
1.71202, -0.6786029, 2.812337, 1, 0, 0.1921569, 1,
1.721153, 1.192046, 1.973791, 1, 0, 0.1843137, 1,
1.729139, -0.5085101, 2.466111, 1, 0, 0.1803922, 1,
1.748902, 0.701328, 1.020329, 1, 0, 0.172549, 1,
1.75799, -0.1534996, 0.5476816, 1, 0, 0.1686275, 1,
1.759249, -0.8122537, 0.5840322, 1, 0, 0.1607843, 1,
1.765296, -1.03656, 2.508595, 1, 0, 0.1568628, 1,
1.768969, -0.1516496, 2.555156, 1, 0, 0.1490196, 1,
1.779516, -1.097164, 2.472413, 1, 0, 0.145098, 1,
1.791234, -0.6882948, 1.948371, 1, 0, 0.1372549, 1,
1.869088, 0.1084018, 0.9754793, 1, 0, 0.1333333, 1,
1.895058, -0.2160069, 0.6292821, 1, 0, 0.1254902, 1,
1.950507, -1.371161, 2.405743, 1, 0, 0.1215686, 1,
1.969284, 0.7404803, 1.618455, 1, 0, 0.1137255, 1,
1.997112, 0.3555912, 2.300477, 1, 0, 0.1098039, 1,
2.023449, -0.6270139, 2.476169, 1, 0, 0.1019608, 1,
2.057332, -2.033303, 3.819673, 1, 0, 0.09411765, 1,
2.078166, -1.64076, 2.583486, 1, 0, 0.09019608, 1,
2.078788, -0.210373, 1.798812, 1, 0, 0.08235294, 1,
2.160786, -0.09106037, 0.3481522, 1, 0, 0.07843138, 1,
2.169466, -0.8877923, 2.173859, 1, 0, 0.07058824, 1,
2.268898, 0.8760862, 1.53126, 1, 0, 0.06666667, 1,
2.305978, 0.3216626, 2.249073, 1, 0, 0.05882353, 1,
2.312896, 0.9260686, 1.021785, 1, 0, 0.05490196, 1,
2.397323, -0.618578, 2.184565, 1, 0, 0.04705882, 1,
2.398949, 0.4448457, 1.043603, 1, 0, 0.04313726, 1,
2.406423, -0.09205008, 3.447154, 1, 0, 0.03529412, 1,
2.461262, -1.269068, 2.283607, 1, 0, 0.03137255, 1,
2.631329, 0.6413165, 3.67715, 1, 0, 0.02352941, 1,
2.823539, -0.3406593, 2.446783, 1, 0, 0.01960784, 1,
2.859687, -0.06319232, 1.214303, 1, 0, 0.01176471, 1,
3.295682, 2.044898, 1.288449, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.3834977, -3.968926, -6.977438, 0, -0.5, 0.5, 0.5,
0.3834977, -3.968926, -6.977438, 1, -0.5, 0.5, 0.5,
0.3834977, -3.968926, -6.977438, 1, 1.5, 0.5, 0.5,
0.3834977, -3.968926, -6.977438, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.515917, 0.1746975, -6.977438, 0, -0.5, 0.5, 0.5,
-3.515917, 0.1746975, -6.977438, 1, -0.5, 0.5, 0.5,
-3.515917, 0.1746975, -6.977438, 1, 1.5, 0.5, 0.5,
-3.515917, 0.1746975, -6.977438, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.515917, -3.968926, -0.2912543, 0, -0.5, 0.5, 0.5,
-3.515917, -3.968926, -0.2912543, 1, -0.5, 0.5, 0.5,
-3.515917, -3.968926, -0.2912543, 1, 1.5, 0.5, 0.5,
-3.515917, -3.968926, -0.2912543, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -3.012706, -5.434473,
3, -3.012706, -5.434473,
-2, -3.012706, -5.434473,
-2, -3.172076, -5.691633,
-1, -3.012706, -5.434473,
-1, -3.172076, -5.691633,
0, -3.012706, -5.434473,
0, -3.172076, -5.691633,
1, -3.012706, -5.434473,
1, -3.172076, -5.691633,
2, -3.012706, -5.434473,
2, -3.172076, -5.691633,
3, -3.012706, -5.434473,
3, -3.172076, -5.691633
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -3.490816, -6.205955, 0, -0.5, 0.5, 0.5,
-2, -3.490816, -6.205955, 1, -0.5, 0.5, 0.5,
-2, -3.490816, -6.205955, 1, 1.5, 0.5, 0.5,
-2, -3.490816, -6.205955, 0, 1.5, 0.5, 0.5,
-1, -3.490816, -6.205955, 0, -0.5, 0.5, 0.5,
-1, -3.490816, -6.205955, 1, -0.5, 0.5, 0.5,
-1, -3.490816, -6.205955, 1, 1.5, 0.5, 0.5,
-1, -3.490816, -6.205955, 0, 1.5, 0.5, 0.5,
0, -3.490816, -6.205955, 0, -0.5, 0.5, 0.5,
0, -3.490816, -6.205955, 1, -0.5, 0.5, 0.5,
0, -3.490816, -6.205955, 1, 1.5, 0.5, 0.5,
0, -3.490816, -6.205955, 0, 1.5, 0.5, 0.5,
1, -3.490816, -6.205955, 0, -0.5, 0.5, 0.5,
1, -3.490816, -6.205955, 1, -0.5, 0.5, 0.5,
1, -3.490816, -6.205955, 1, 1.5, 0.5, 0.5,
1, -3.490816, -6.205955, 0, 1.5, 0.5, 0.5,
2, -3.490816, -6.205955, 0, -0.5, 0.5, 0.5,
2, -3.490816, -6.205955, 1, -0.5, 0.5, 0.5,
2, -3.490816, -6.205955, 1, 1.5, 0.5, 0.5,
2, -3.490816, -6.205955, 0, 1.5, 0.5, 0.5,
3, -3.490816, -6.205955, 0, -0.5, 0.5, 0.5,
3, -3.490816, -6.205955, 1, -0.5, 0.5, 0.5,
3, -3.490816, -6.205955, 1, 1.5, 0.5, 0.5,
3, -3.490816, -6.205955, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-2.616052, -2, -5.434473,
-2.616052, 3, -5.434473,
-2.616052, -2, -5.434473,
-2.76603, -2, -5.691633,
-2.616052, -1, -5.434473,
-2.76603, -1, -5.691633,
-2.616052, 0, -5.434473,
-2.76603, 0, -5.691633,
-2.616052, 1, -5.434473,
-2.76603, 1, -5.691633,
-2.616052, 2, -5.434473,
-2.76603, 2, -5.691633,
-2.616052, 3, -5.434473,
-2.76603, 3, -5.691633
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.065985, -2, -6.205955, 0, -0.5, 0.5, 0.5,
-3.065985, -2, -6.205955, 1, -0.5, 0.5, 0.5,
-3.065985, -2, -6.205955, 1, 1.5, 0.5, 0.5,
-3.065985, -2, -6.205955, 0, 1.5, 0.5, 0.5,
-3.065985, -1, -6.205955, 0, -0.5, 0.5, 0.5,
-3.065985, -1, -6.205955, 1, -0.5, 0.5, 0.5,
-3.065985, -1, -6.205955, 1, 1.5, 0.5, 0.5,
-3.065985, -1, -6.205955, 0, 1.5, 0.5, 0.5,
-3.065985, 0, -6.205955, 0, -0.5, 0.5, 0.5,
-3.065985, 0, -6.205955, 1, -0.5, 0.5, 0.5,
-3.065985, 0, -6.205955, 1, 1.5, 0.5, 0.5,
-3.065985, 0, -6.205955, 0, 1.5, 0.5, 0.5,
-3.065985, 1, -6.205955, 0, -0.5, 0.5, 0.5,
-3.065985, 1, -6.205955, 1, -0.5, 0.5, 0.5,
-3.065985, 1, -6.205955, 1, 1.5, 0.5, 0.5,
-3.065985, 1, -6.205955, 0, 1.5, 0.5, 0.5,
-3.065985, 2, -6.205955, 0, -0.5, 0.5, 0.5,
-3.065985, 2, -6.205955, 1, -0.5, 0.5, 0.5,
-3.065985, 2, -6.205955, 1, 1.5, 0.5, 0.5,
-3.065985, 2, -6.205955, 0, 1.5, 0.5, 0.5,
-3.065985, 3, -6.205955, 0, -0.5, 0.5, 0.5,
-3.065985, 3, -6.205955, 1, -0.5, 0.5, 0.5,
-3.065985, 3, -6.205955, 1, 1.5, 0.5, 0.5,
-3.065985, 3, -6.205955, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-2.616052, -3.012706, -4,
-2.616052, -3.012706, 4,
-2.616052, -3.012706, -4,
-2.76603, -3.172076, -4,
-2.616052, -3.012706, -2,
-2.76603, -3.172076, -2,
-2.616052, -3.012706, 0,
-2.76603, -3.172076, 0,
-2.616052, -3.012706, 2,
-2.76603, -3.172076, 2,
-2.616052, -3.012706, 4,
-2.76603, -3.172076, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.065985, -3.490816, -4, 0, -0.5, 0.5, 0.5,
-3.065985, -3.490816, -4, 1, -0.5, 0.5, 0.5,
-3.065985, -3.490816, -4, 1, 1.5, 0.5, 0.5,
-3.065985, -3.490816, -4, 0, 1.5, 0.5, 0.5,
-3.065985, -3.490816, -2, 0, -0.5, 0.5, 0.5,
-3.065985, -3.490816, -2, 1, -0.5, 0.5, 0.5,
-3.065985, -3.490816, -2, 1, 1.5, 0.5, 0.5,
-3.065985, -3.490816, -2, 0, 1.5, 0.5, 0.5,
-3.065985, -3.490816, 0, 0, -0.5, 0.5, 0.5,
-3.065985, -3.490816, 0, 1, -0.5, 0.5, 0.5,
-3.065985, -3.490816, 0, 1, 1.5, 0.5, 0.5,
-3.065985, -3.490816, 0, 0, 1.5, 0.5, 0.5,
-3.065985, -3.490816, 2, 0, -0.5, 0.5, 0.5,
-3.065985, -3.490816, 2, 1, -0.5, 0.5, 0.5,
-3.065985, -3.490816, 2, 1, 1.5, 0.5, 0.5,
-3.065985, -3.490816, 2, 0, 1.5, 0.5, 0.5,
-3.065985, -3.490816, 4, 0, -0.5, 0.5, 0.5,
-3.065985, -3.490816, 4, 1, -0.5, 0.5, 0.5,
-3.065985, -3.490816, 4, 1, 1.5, 0.5, 0.5,
-3.065985, -3.490816, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-2.616052, -3.012706, -5.434473,
-2.616052, 3.362101, -5.434473,
-2.616052, -3.012706, 4.851964,
-2.616052, 3.362101, 4.851964,
-2.616052, -3.012706, -5.434473,
-2.616052, -3.012706, 4.851964,
-2.616052, 3.362101, -5.434473,
-2.616052, 3.362101, 4.851964,
-2.616052, -3.012706, -5.434473,
3.383048, -3.012706, -5.434473,
-2.616052, -3.012706, 4.851964,
3.383048, -3.012706, 4.851964,
-2.616052, 3.362101, -5.434473,
3.383048, 3.362101, -5.434473,
-2.616052, 3.362101, 4.851964,
3.383048, 3.362101, 4.851964,
3.383048, -3.012706, -5.434473,
3.383048, 3.362101, -5.434473,
3.383048, -3.012706, 4.851964,
3.383048, 3.362101, 4.851964,
3.383048, -3.012706, -5.434473,
3.383048, -3.012706, 4.851964,
3.383048, 3.362101, -5.434473,
3.383048, 3.362101, 4.851964
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.212457;
var distance = 32.08904;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.3834977, -0.1746975, 0.2912543 );
mvMatrix.scale( 1.299903, 1.223292, 0.75811 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.08904);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Endrin<-read.table("Endrin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Endrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Endrin' not found
```

```r
y<-Endrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Endrin' not found
```

```r
z<-Endrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Endrin' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-2.528687, 1.38222, -0.3136611, 0, 0, 1, 1, 1,
-2.484312, 1.142172, -0.9542455, 1, 0, 0, 1, 1,
-2.353869, -1.515801, -2.397746, 1, 0, 0, 1, 1,
-2.296556, -0.07847732, -2.607683, 1, 0, 0, 1, 1,
-2.267079, -0.8278323, -3.156176, 1, 0, 0, 1, 1,
-2.218184, 0.6366052, -1.282317, 1, 0, 0, 1, 1,
-2.195055, -0.1499319, -1.852086, 0, 0, 0, 1, 1,
-2.192262, -0.2911447, -0.01522729, 0, 0, 0, 1, 1,
-2.191475, 0.584066, -2.857117, 0, 0, 0, 1, 1,
-2.182208, -0.8797607, -2.687817, 0, 0, 0, 1, 1,
-2.145314, 1.271316, -1.598628, 0, 0, 0, 1, 1,
-2.139302, -0.4939453, -1.735131, 0, 0, 0, 1, 1,
-2.126757, -0.7239001, -1.772156, 0, 0, 0, 1, 1,
-2.109895, 0.4203621, -0.361822, 1, 1, 1, 1, 1,
-2.099837, -0.2808305, -1.858385, 1, 1, 1, 1, 1,
-2.021549, -0.02693845, -0.7101561, 1, 1, 1, 1, 1,
-2.013341, 0.5771573, -1.178567, 1, 1, 1, 1, 1,
-1.994804, -0.2008646, -4.073905, 1, 1, 1, 1, 1,
-1.992233, -1.669767, -3.457791, 1, 1, 1, 1, 1,
-1.99215, 1.756666, -0.6812539, 1, 1, 1, 1, 1,
-1.986626, 0.1206796, -2.423014, 1, 1, 1, 1, 1,
-1.95495, -0.2667256, -0.4245241, 1, 1, 1, 1, 1,
-1.943876, 0.8915653, 0.8767622, 1, 1, 1, 1, 1,
-1.926801, -0.5391608, -1.551391, 1, 1, 1, 1, 1,
-1.922, 1.384979, -0.1499308, 1, 1, 1, 1, 1,
-1.894693, -0.4095093, -1.961891, 1, 1, 1, 1, 1,
-1.888753, -0.1186417, -3.10163, 1, 1, 1, 1, 1,
-1.880418, 0.3046701, -0.1222365, 1, 1, 1, 1, 1,
-1.873433, 0.6578698, -2.439151, 0, 0, 1, 1, 1,
-1.861796, -0.1433852, -2.789821, 1, 0, 0, 1, 1,
-1.858998, -1.006261, -2.221994, 1, 0, 0, 1, 1,
-1.857227, 0.3403765, -1.25433, 1, 0, 0, 1, 1,
-1.829452, -0.8251781, -0.9701072, 1, 0, 0, 1, 1,
-1.812922, 0.1844303, 0.6547616, 1, 0, 0, 1, 1,
-1.807985, 0.3879727, -1.470637, 0, 0, 0, 1, 1,
-1.781911, -0.95938, -1.329031, 0, 0, 0, 1, 1,
-1.769179, -0.3684776, -0.3473569, 0, 0, 0, 1, 1,
-1.7504, 1.551496, 0.2182773, 0, 0, 0, 1, 1,
-1.749715, 0.7260056, -1.424228, 0, 0, 0, 1, 1,
-1.736006, 1.163554, -0.6953362, 0, 0, 0, 1, 1,
-1.732613, 0.5288782, -1.166096, 0, 0, 0, 1, 1,
-1.686929, 0.3925648, -1.416623, 1, 1, 1, 1, 1,
-1.682515, -0.7053961, -1.478752, 1, 1, 1, 1, 1,
-1.681602, 0.220949, -3.238086, 1, 1, 1, 1, 1,
-1.677928, -0.06270608, -0.5424406, 1, 1, 1, 1, 1,
-1.674514, -2.003248, -1.68918, 1, 1, 1, 1, 1,
-1.673205, -0.05841253, -4.832662, 1, 1, 1, 1, 1,
-1.671578, 2.228483, 0.4904208, 1, 1, 1, 1, 1,
-1.660471, -0.01235274, -1.928084, 1, 1, 1, 1, 1,
-1.653298, -1.361283, -2.870885, 1, 1, 1, 1, 1,
-1.653004, 0.01490466, -3.564101, 1, 1, 1, 1, 1,
-1.641477, 1.232267, -1.127017, 1, 1, 1, 1, 1,
-1.637272, -1.080234, -3.75191, 1, 1, 1, 1, 1,
-1.62938, 0.2426293, 1.021701, 1, 1, 1, 1, 1,
-1.61593, 1.477775, -0.7680612, 1, 1, 1, 1, 1,
-1.613495, -0.6737809, -0.9402482, 1, 1, 1, 1, 1,
-1.606936, 1.370713, -1.242451, 0, 0, 1, 1, 1,
-1.575817, -1.398542, -2.446965, 1, 0, 0, 1, 1,
-1.574886, 0.9497413, -2.309531, 1, 0, 0, 1, 1,
-1.569204, -0.4599592, 0.1618998, 1, 0, 0, 1, 1,
-1.566614, -1.358969, -2.458593, 1, 0, 0, 1, 1,
-1.556215, 0.02640717, -2.861399, 1, 0, 0, 1, 1,
-1.552513, -1.743579, -1.419775, 0, 0, 0, 1, 1,
-1.53515, 0.3906027, -0.6780113, 0, 0, 0, 1, 1,
-1.52165, 0.7018018, -0.3321922, 0, 0, 0, 1, 1,
-1.492314, -1.270055, -0.8723214, 0, 0, 0, 1, 1,
-1.489246, 0.1567651, -2.051006, 0, 0, 0, 1, 1,
-1.481806, 1.463548, 1.362345, 0, 0, 0, 1, 1,
-1.479714, 1.523539, 0.1145822, 0, 0, 0, 1, 1,
-1.479001, 1.062646, -1.786194, 1, 1, 1, 1, 1,
-1.478868, -1.043931, -3.55374, 1, 1, 1, 1, 1,
-1.476125, 0.8730773, -2.358448, 1, 1, 1, 1, 1,
-1.464819, -0.01805439, -3.236906, 1, 1, 1, 1, 1,
-1.464183, -0.6983735, -1.221473, 1, 1, 1, 1, 1,
-1.462168, -1.505646, -1.926256, 1, 1, 1, 1, 1,
-1.45322, 1.374733, 1.532561, 1, 1, 1, 1, 1,
-1.432388, 0.9471651, -0.3444778, 1, 1, 1, 1, 1,
-1.424659, 0.6403383, -1.2976, 1, 1, 1, 1, 1,
-1.419827, -2.262427, -2.722515, 1, 1, 1, 1, 1,
-1.402772, -1.377127, -2.368076, 1, 1, 1, 1, 1,
-1.398948, 1.333564, -1.582567, 1, 1, 1, 1, 1,
-1.392736, -0.9027995, -1.708155, 1, 1, 1, 1, 1,
-1.391199, 0.0536747, -0.805697, 1, 1, 1, 1, 1,
-1.389668, -0.5074073, -2.312421, 1, 1, 1, 1, 1,
-1.38124, 0.1251372, -1.550886, 0, 0, 1, 1, 1,
-1.378747, 1.590705, 0.6211079, 1, 0, 0, 1, 1,
-1.377255, -1.516912, -2.75296, 1, 0, 0, 1, 1,
-1.359581, 1.166969, -1.033091, 1, 0, 0, 1, 1,
-1.358481, -1.557938, -3.075307, 1, 0, 0, 1, 1,
-1.353831, 0.8939597, 1.127679, 1, 0, 0, 1, 1,
-1.352314, -0.484624, -2.392185, 0, 0, 0, 1, 1,
-1.343461, -1.429869, -4.408628, 0, 0, 0, 1, 1,
-1.333611, -0.4783261, -2.531627, 0, 0, 0, 1, 1,
-1.333094, -0.533839, -3.762574, 0, 0, 0, 1, 1,
-1.331403, -0.5864689, -3.137676, 0, 0, 0, 1, 1,
-1.323662, 1.111364, -1.083258, 0, 0, 0, 1, 1,
-1.316306, 0.807802, -0.2817988, 0, 0, 0, 1, 1,
-1.313613, -0.05863058, -2.138162, 1, 1, 1, 1, 1,
-1.311091, 0.2074335, -1.668073, 1, 1, 1, 1, 1,
-1.308789, 0.2263405, -1.533725, 1, 1, 1, 1, 1,
-1.296787, -0.2428231, -2.67998, 1, 1, 1, 1, 1,
-1.294947, 0.2231147, -0.476496, 1, 1, 1, 1, 1,
-1.293376, -0.7747827, -5.20333, 1, 1, 1, 1, 1,
-1.283832, 0.240021, -1.438082, 1, 1, 1, 1, 1,
-1.281389, -1.299994, -1.31035, 1, 1, 1, 1, 1,
-1.266621, 0.9129981, -0.7235681, 1, 1, 1, 1, 1,
-1.265887, -0.8284011, -3.361492, 1, 1, 1, 1, 1,
-1.251512, -0.9686643, -1.623996, 1, 1, 1, 1, 1,
-1.251509, 0.7761593, -0.4967592, 1, 1, 1, 1, 1,
-1.250098, -1.431099, -2.661809, 1, 1, 1, 1, 1,
-1.248578, 1.371953, -1.533967, 1, 1, 1, 1, 1,
-1.237521, -0.3909687, -1.005591, 1, 1, 1, 1, 1,
-1.221961, 1.31834, -1.809178, 0, 0, 1, 1, 1,
-1.220854, -0.05034124, -1.410591, 1, 0, 0, 1, 1,
-1.219488, 0.6649538, 0.6654253, 1, 0, 0, 1, 1,
-1.211903, 0.2246637, -2.479506, 1, 0, 0, 1, 1,
-1.211638, 0.8289768, -1.343662, 1, 0, 0, 1, 1,
-1.196815, -0.3815986, -2.947851, 1, 0, 0, 1, 1,
-1.196239, -0.2899473, -1.620917, 0, 0, 0, 1, 1,
-1.195694, -1.369177, -1.521213, 0, 0, 0, 1, 1,
-1.194304, 1.6781, -0.7880592, 0, 0, 0, 1, 1,
-1.192681, -0.3472502, -1.899971, 0, 0, 0, 1, 1,
-1.154433, 0.7178653, -2.002672, 0, 0, 0, 1, 1,
-1.152123, -1.295752, -2.532162, 0, 0, 0, 1, 1,
-1.146654, 0.7941651, 0.3353834, 0, 0, 0, 1, 1,
-1.145956, 0.3802267, -0.8289145, 1, 1, 1, 1, 1,
-1.145694, -0.31653, -1.241927, 1, 1, 1, 1, 1,
-1.142103, -1.033683, -0.5898205, 1, 1, 1, 1, 1,
-1.140387, 1.661782, 0.2398909, 1, 1, 1, 1, 1,
-1.136973, 0.07879711, -1.565746, 1, 1, 1, 1, 1,
-1.134549, 0.9561688, -0.4636405, 1, 1, 1, 1, 1,
-1.127435, -2.147437, -1.856024, 1, 1, 1, 1, 1,
-1.126297, 1.374955, 0.3329329, 1, 1, 1, 1, 1,
-1.12051, 0.6062025, -1.564548, 1, 1, 1, 1, 1,
-1.118659, 0.4404846, -2.095456, 1, 1, 1, 1, 1,
-1.106388, 0.2165658, -1.533611, 1, 1, 1, 1, 1,
-1.103232, 1.039163, -0.2616643, 1, 1, 1, 1, 1,
-1.102672, -0.8388413, -3.154174, 1, 1, 1, 1, 1,
-1.100346, 0.09025383, -0.5397366, 1, 1, 1, 1, 1,
-1.099515, -0.08785548, -0.6495565, 1, 1, 1, 1, 1,
-1.097396, 0.3661144, -1.656759, 0, 0, 1, 1, 1,
-1.094873, -1.466709, -2.700826, 1, 0, 0, 1, 1,
-1.09449, 1.022913, -0.03452772, 1, 0, 0, 1, 1,
-1.093593, -2.037932, -1.664563, 1, 0, 0, 1, 1,
-1.091016, -1.215512, -3.505409, 1, 0, 0, 1, 1,
-1.086211, -0.07712384, -0.4444211, 1, 0, 0, 1, 1,
-1.079181, -1.567666, -2.424079, 0, 0, 0, 1, 1,
-1.075771, -0.1186788, -1.213129, 0, 0, 0, 1, 1,
-1.071772, -1.111577, -2.517633, 0, 0, 0, 1, 1,
-1.064763, 0.5873511, -1.725173, 0, 0, 0, 1, 1,
-1.061656, -0.111311, -2.140342, 0, 0, 0, 1, 1,
-1.061498, -0.100347, -0.900003, 0, 0, 0, 1, 1,
-1.045119, -0.6746153, -2.919959, 0, 0, 0, 1, 1,
-1.044945, -0.6350168, -2.432677, 1, 1, 1, 1, 1,
-1.042943, -0.844745, -0.9081311, 1, 1, 1, 1, 1,
-1.039639, 0.5268533, -2.737604, 1, 1, 1, 1, 1,
-1.028401, 0.883085, -1.915328, 1, 1, 1, 1, 1,
-1.022342, 0.5636378, -0.06643006, 1, 1, 1, 1, 1,
-1.020494, -0.5157537, -1.349946, 1, 1, 1, 1, 1,
-1.014374, 0.4947732, -0.1467123, 1, 1, 1, 1, 1,
-1.012924, 0.04510425, -2.529612, 1, 1, 1, 1, 1,
-1.010309, -0.4170341, -2.438042, 1, 1, 1, 1, 1,
-1.006409, -0.2294823, -2.369345, 1, 1, 1, 1, 1,
-1.00459, -2.304379, -2.216915, 1, 1, 1, 1, 1,
-1.003912, -0.8889194, -2.002107, 1, 1, 1, 1, 1,
-1.002671, -0.6959603, -1.209644, 1, 1, 1, 1, 1,
-0.999746, 0.9661559, -0.5043831, 1, 1, 1, 1, 1,
-0.990876, -2.471909, -3.870635, 1, 1, 1, 1, 1,
-0.98646, -1.320846, -1.55229, 0, 0, 1, 1, 1,
-0.9860863, 0.9892284, 0.09597085, 1, 0, 0, 1, 1,
-0.9815065, 2.271153, 0.4726523, 1, 0, 0, 1, 1,
-0.974501, -1.524009, -2.216778, 1, 0, 0, 1, 1,
-0.9742591, -0.08448401, -0.2791676, 1, 0, 0, 1, 1,
-0.9727845, -0.6808715, -4.85216, 1, 0, 0, 1, 1,
-0.9717519, -0.9071462, -1.396269, 0, 0, 0, 1, 1,
-0.9701643, -1.055007, -1.767262, 0, 0, 0, 1, 1,
-0.9652382, -0.8873206, -1.558874, 0, 0, 0, 1, 1,
-0.9573814, -0.648495, -2.011273, 0, 0, 0, 1, 1,
-0.9570403, 0.4229234, -1.19425, 0, 0, 0, 1, 1,
-0.9523162, -2.919868, -3.198791, 0, 0, 0, 1, 1,
-0.9474295, -0.4272257, -1.562827, 0, 0, 0, 1, 1,
-0.9449826, 1.651418, -1.082731, 1, 1, 1, 1, 1,
-0.941996, -0.1854012, -0.9863576, 1, 1, 1, 1, 1,
-0.9347405, -0.9078659, -4.009591, 1, 1, 1, 1, 1,
-0.9339499, -1.310678, -0.9754246, 1, 1, 1, 1, 1,
-0.9334123, -0.7275653, -3.01575, 1, 1, 1, 1, 1,
-0.9277576, -0.9233696, -4.067169, 1, 1, 1, 1, 1,
-0.9265795, 1.126317, -1.098061, 1, 1, 1, 1, 1,
-0.9252676, -1.216243, -2.532191, 1, 1, 1, 1, 1,
-0.9244887, 0.94762, 0.03345302, 1, 1, 1, 1, 1,
-0.923919, 1.788623, -0.4934374, 1, 1, 1, 1, 1,
-0.9231718, 0.4643794, -0.4666073, 1, 1, 1, 1, 1,
-0.9213262, -0.3361686, -2.734631, 1, 1, 1, 1, 1,
-0.9151403, -1.111498, -4.859529, 1, 1, 1, 1, 1,
-0.9069236, 1.582687, -0.03951927, 1, 1, 1, 1, 1,
-0.905597, -0.2765256, -3.403295, 1, 1, 1, 1, 1,
-0.9038605, -0.4576631, -3.278305, 0, 0, 1, 1, 1,
-0.8931233, 0.9689397, -3.038649, 1, 0, 0, 1, 1,
-0.8929881, -0.6455686, -1.56014, 1, 0, 0, 1, 1,
-0.8910163, -0.1470615, -1.698642, 1, 0, 0, 1, 1,
-0.8897535, -0.7330973, -3.327977, 1, 0, 0, 1, 1,
-0.8896263, 0.1871605, -0.8703454, 1, 0, 0, 1, 1,
-0.8859831, -0.2013173, -2.938089, 0, 0, 0, 1, 1,
-0.8814513, -0.3205432, -2.427636, 0, 0, 0, 1, 1,
-0.8777667, 0.7255277, -1.999642, 0, 0, 0, 1, 1,
-0.8756193, -0.4938582, 0.06777003, 0, 0, 0, 1, 1,
-0.8612044, -0.629675, -2.191838, 0, 0, 0, 1, 1,
-0.8589872, 0.7929265, -1.24825, 0, 0, 0, 1, 1,
-0.8552819, 0.2121378, -1.024148, 0, 0, 0, 1, 1,
-0.8534808, -0.4814485, -4.227601, 1, 1, 1, 1, 1,
-0.8528674, -0.2151978, 0.4224427, 1, 1, 1, 1, 1,
-0.8507695, -0.5568478, -2.451285, 1, 1, 1, 1, 1,
-0.8507304, 1.063381, -0.3882217, 1, 1, 1, 1, 1,
-0.8406228, 1.668293, 0.6918603, 1, 1, 1, 1, 1,
-0.8275163, -0.4372812, -1.527227, 1, 1, 1, 1, 1,
-0.8245767, -0.3958449, -3.034006, 1, 1, 1, 1, 1,
-0.8218523, -0.7353178, -3.477034, 1, 1, 1, 1, 1,
-0.8191684, 0.0385471, -1.946368, 1, 1, 1, 1, 1,
-0.8139259, 0.7095661, -0.7615564, 1, 1, 1, 1, 1,
-0.8108016, 2.303963, 0.09255639, 1, 1, 1, 1, 1,
-0.8096348, 0.4515386, -0.4216059, 1, 1, 1, 1, 1,
-0.806202, -0.7955741, -3.76769, 1, 1, 1, 1, 1,
-0.801109, 0.8459775, -1.109992, 1, 1, 1, 1, 1,
-0.7947992, 0.4391091, -2.080425, 1, 1, 1, 1, 1,
-0.7932621, 2.097106, 0.4064733, 0, 0, 1, 1, 1,
-0.7893324, -0.2865376, -2.546147, 1, 0, 0, 1, 1,
-0.7889621, 0.6341758, -1.370706, 1, 0, 0, 1, 1,
-0.7864167, -0.2005352, -3.010697, 1, 0, 0, 1, 1,
-0.7851125, 1.071916, 0.4145777, 1, 0, 0, 1, 1,
-0.7850517, 1.104188, -0.851626, 1, 0, 0, 1, 1,
-0.7806615, -0.05202685, -1.217274, 0, 0, 0, 1, 1,
-0.7749515, -0.3031907, -1.037127, 0, 0, 0, 1, 1,
-0.7719363, -0.2224115, -0.9921757, 0, 0, 0, 1, 1,
-0.7599981, -0.1082031, -1.078408, 0, 0, 0, 1, 1,
-0.7557253, -2.611359, -3.035122, 0, 0, 0, 1, 1,
-0.7536643, 2.454149, 0.3651744, 0, 0, 0, 1, 1,
-0.7519026, -0.06384674, -1.791673, 0, 0, 0, 1, 1,
-0.7510883, 0.5280171, 0.4284897, 1, 1, 1, 1, 1,
-0.7472737, 0.7119326, -0.9956916, 1, 1, 1, 1, 1,
-0.7465703, -1.112565, -2.39394, 1, 1, 1, 1, 1,
-0.7458307, -0.6235477, -3.622783, 1, 1, 1, 1, 1,
-0.7419869, -0.2840805, -2.661279, 1, 1, 1, 1, 1,
-0.7417191, 0.0188231, -1.291464, 1, 1, 1, 1, 1,
-0.735649, 1.03826, 0.4829992, 1, 1, 1, 1, 1,
-0.7347463, -0.2216719, -2.158657, 1, 1, 1, 1, 1,
-0.7171828, 0.08422981, -3.564227, 1, 1, 1, 1, 1,
-0.7141957, -0.2346558, -3.165572, 1, 1, 1, 1, 1,
-0.7125793, -1.015695, -0.913098, 1, 1, 1, 1, 1,
-0.7122186, -2.134454, -3.448959, 1, 1, 1, 1, 1,
-0.7043198, 1.784699, -0.7804479, 1, 1, 1, 1, 1,
-0.7041759, 0.1750532, -3.141558, 1, 1, 1, 1, 1,
-0.6982623, 0.4554451, -0.2003307, 1, 1, 1, 1, 1,
-0.6981412, -1.779935, -1.155236, 0, 0, 1, 1, 1,
-0.6972214, -0.6152416, -1.290676, 1, 0, 0, 1, 1,
-0.6932248, -0.4983566, -2.484152, 1, 0, 0, 1, 1,
-0.6857397, 1.173462, 2.09406, 1, 0, 0, 1, 1,
-0.6828033, 1.58435, -1.139923, 1, 0, 0, 1, 1,
-0.6790786, 0.07860769, -0.3047326, 1, 0, 0, 1, 1,
-0.6737168, -0.4204242, -3.179635, 0, 0, 0, 1, 1,
-0.6723369, -0.6973004, -2.474112, 0, 0, 0, 1, 1,
-0.6716186, 0.004548656, -1.310499, 0, 0, 0, 1, 1,
-0.6714754, -0.777003, -2.719781, 0, 0, 0, 1, 1,
-0.6699948, 0.09082308, -1.545657, 0, 0, 0, 1, 1,
-0.6643308, 1.782898, 0.6039714, 0, 0, 0, 1, 1,
-0.6639122, -0.7816966, -2.375642, 0, 0, 0, 1, 1,
-0.6635681, -0.4738726, -1.229443, 1, 1, 1, 1, 1,
-0.6557807, 0.126187, -0.955977, 1, 1, 1, 1, 1,
-0.6527656, 0.1235497, -0.2577472, 1, 1, 1, 1, 1,
-0.6520968, 0.04895797, -1.534304, 1, 1, 1, 1, 1,
-0.6511105, -1.697434, -2.806838, 1, 1, 1, 1, 1,
-0.6472453, 0.7922339, 0.6004835, 1, 1, 1, 1, 1,
-0.6472234, 0.2495084, -2.757497, 1, 1, 1, 1, 1,
-0.6471955, 1.779689, -1.112168, 1, 1, 1, 1, 1,
-0.6392012, -1.130096, -1.567966, 1, 1, 1, 1, 1,
-0.6378771, -0.9259155, -2.394017, 1, 1, 1, 1, 1,
-0.632338, 0.9227904, -0.2411109, 1, 1, 1, 1, 1,
-0.6308327, 1.960244, -2.310665, 1, 1, 1, 1, 1,
-0.6300173, 0.04150705, -1.617587, 1, 1, 1, 1, 1,
-0.6297439, -0.9407677, -1.113693, 1, 1, 1, 1, 1,
-0.6270904, -1.184365, -1.947629, 1, 1, 1, 1, 1,
-0.620381, 1.940673, 0.4774765, 0, 0, 1, 1, 1,
-0.619781, -0.312273, -0.9419871, 1, 0, 0, 1, 1,
-0.6123614, -0.09732466, -1.386173, 1, 0, 0, 1, 1,
-0.6114458, 1.113476, 0.3069659, 1, 0, 0, 1, 1,
-0.6078222, 0.7147544, -0.07842337, 1, 0, 0, 1, 1,
-0.6062919, 0.6297563, -0.50855, 1, 0, 0, 1, 1,
-0.5895282, 1.38295, -0.671441, 0, 0, 0, 1, 1,
-0.5854266, 1.490995, -0.5320035, 0, 0, 0, 1, 1,
-0.580013, -0.6631008, -2.769343, 0, 0, 0, 1, 1,
-0.5796299, 1.228187, -1.449003, 0, 0, 0, 1, 1,
-0.5783315, 0.09810004, -1.002158, 0, 0, 0, 1, 1,
-0.5778546, -0.2003318, -1.507303, 0, 0, 0, 1, 1,
-0.5771545, -0.3818046, -2.338591, 0, 0, 0, 1, 1,
-0.5651055, 1.542528, -0.06072965, 1, 1, 1, 1, 1,
-0.5632226, -0.3511455, -0.6119823, 1, 1, 1, 1, 1,
-0.5630754, 1.161582, 0.5560018, 1, 1, 1, 1, 1,
-0.5498872, -1.473697, -2.757361, 1, 1, 1, 1, 1,
-0.545279, 0.5211035, -0.2941982, 1, 1, 1, 1, 1,
-0.5408909, 0.02244379, 1.177852, 1, 1, 1, 1, 1,
-0.5372368, 2.081682, -0.6955221, 1, 1, 1, 1, 1,
-0.5306764, 0.9369631, -1.133127, 1, 1, 1, 1, 1,
-0.5300984, -1.63415, -1.896054, 1, 1, 1, 1, 1,
-0.5284951, 1.266666, -1.659454, 1, 1, 1, 1, 1,
-0.5275039, 0.5566664, -0.2556738, 1, 1, 1, 1, 1,
-0.5264159, -0.8107424, -4.080964, 1, 1, 1, 1, 1,
-0.5254879, 0.527243, 0.09108586, 1, 1, 1, 1, 1,
-0.5190121, 1.596485, -0.6840372, 1, 1, 1, 1, 1,
-0.517648, -0.45776, -3.008783, 1, 1, 1, 1, 1,
-0.5151391, -0.8771082, -2.515467, 0, 0, 1, 1, 1,
-0.5109673, -0.2596743, -3.227247, 1, 0, 0, 1, 1,
-0.5092911, -0.7178795, -4.030653, 1, 0, 0, 1, 1,
-0.5076358, 0.3293255, -0.04673254, 1, 0, 0, 1, 1,
-0.5015275, 0.8981222, -0.5453015, 1, 0, 0, 1, 1,
-0.4998522, 0.2185225, -1.205329, 1, 0, 0, 1, 1,
-0.4989717, 1.133279, 0.04357376, 0, 0, 0, 1, 1,
-0.4957991, 1.317829, -0.04188564, 0, 0, 0, 1, 1,
-0.4890391, -2.032478, -3.139253, 0, 0, 0, 1, 1,
-0.4874972, -1.973424, -1.916889, 0, 0, 0, 1, 1,
-0.4873408, -0.1888261, -2.095291, 0, 0, 0, 1, 1,
-0.4863376, 1.107188, 0.960792, 0, 0, 0, 1, 1,
-0.4840999, 1.192754, -0.3725134, 0, 0, 0, 1, 1,
-0.4836645, -0.4995059, -1.816222, 1, 1, 1, 1, 1,
-0.4828534, -0.3560946, -2.170462, 1, 1, 1, 1, 1,
-0.4772679, -0.4756293, -0.7829192, 1, 1, 1, 1, 1,
-0.4762608, -0.1318595, -0.6740757, 1, 1, 1, 1, 1,
-0.4747954, 1.303899, -1.414106, 1, 1, 1, 1, 1,
-0.4724046, -1.192607, -3.208711, 1, 1, 1, 1, 1,
-0.466742, -1.125892, -3.118546, 1, 1, 1, 1, 1,
-0.4536344, 1.299447, 0.5548489, 1, 1, 1, 1, 1,
-0.4529702, 0.03407165, -1.424393, 1, 1, 1, 1, 1,
-0.4500477, 0.05312714, -1.007708, 1, 1, 1, 1, 1,
-0.4423104, -1.369647, -3.113449, 1, 1, 1, 1, 1,
-0.4361723, -1.279021, -2.740444, 1, 1, 1, 1, 1,
-0.4327594, -1.250348, -2.68313, 1, 1, 1, 1, 1,
-0.4306692, -0.629054, -3.950438, 1, 1, 1, 1, 1,
-0.4298667, -0.07908341, -1.422925, 1, 1, 1, 1, 1,
-0.4267292, 0.4739195, -0.5706056, 0, 0, 1, 1, 1,
-0.4165275, 0.1164701, -3.068907, 1, 0, 0, 1, 1,
-0.4155886, -1.554944, -4.201157, 1, 0, 0, 1, 1,
-0.4129367, -0.4640709, -0.8239698, 1, 0, 0, 1, 1,
-0.4092145, 0.5012587, -2.473142, 1, 0, 0, 1, 1,
-0.4014731, 1.231104, 0.06242279, 1, 0, 0, 1, 1,
-0.3953247, 0.3897043, -1.241549, 0, 0, 0, 1, 1,
-0.3931994, 0.6416886, -0.2134477, 0, 0, 0, 1, 1,
-0.3922322, -0.07210489, -2.568758, 0, 0, 0, 1, 1,
-0.390862, 0.9949505, -1.517017, 0, 0, 0, 1, 1,
-0.390632, 0.8320937, -0.05916362, 0, 0, 0, 1, 1,
-0.3887947, 0.8386539, 0.2327976, 0, 0, 0, 1, 1,
-0.3885726, 0.7582135, -0.611672, 0, 0, 0, 1, 1,
-0.3873845, 0.37218, -1.205271, 1, 1, 1, 1, 1,
-0.3845021, -0.2986322, -4.0819, 1, 1, 1, 1, 1,
-0.3790741, -0.3794344, -1.289229, 1, 1, 1, 1, 1,
-0.3789544, -1.254443, -3.710173, 1, 1, 1, 1, 1,
-0.3766636, -0.4729522, -2.178481, 1, 1, 1, 1, 1,
-0.3746146, 2.306387, 2.00926, 1, 1, 1, 1, 1,
-0.3702483, -0.3474591, -2.584696, 1, 1, 1, 1, 1,
-0.3654055, -0.6514062, -2.475676, 1, 1, 1, 1, 1,
-0.362695, 0.7877852, -1.145195, 1, 1, 1, 1, 1,
-0.3569311, 0.7098926, 0.7227941, 1, 1, 1, 1, 1,
-0.3547913, 0.7356319, -0.5751683, 1, 1, 1, 1, 1,
-0.3540667, 0.6545497, -0.7549374, 1, 1, 1, 1, 1,
-0.3527065, -0.1097455, -2.826119, 1, 1, 1, 1, 1,
-0.3524481, -0.296463, -2.61813, 1, 1, 1, 1, 1,
-0.3518326, -1.497442, -4.28688, 1, 1, 1, 1, 1,
-0.3509748, 0.5826287, 0.8126163, 0, 0, 1, 1, 1,
-0.3456968, 1.898051, 0.7933701, 1, 0, 0, 1, 1,
-0.3422103, -0.3799654, -3.251055, 1, 0, 0, 1, 1,
-0.3384606, 0.2077514, -0.8082781, 1, 0, 0, 1, 1,
-0.3353328, 0.7513432, -0.06522582, 1, 0, 0, 1, 1,
-0.3331087, -0.5054857, -3.086535, 1, 0, 0, 1, 1,
-0.3327048, 0.8915461, -1.004907, 0, 0, 0, 1, 1,
-0.3279053, 0.8311101, 0.6603137, 0, 0, 0, 1, 1,
-0.3223778, -1.434607, -2.481379, 0, 0, 0, 1, 1,
-0.3214254, -1.454721, -2.721272, 0, 0, 0, 1, 1,
-0.3060405, -0.4845014, -1.609524, 0, 0, 0, 1, 1,
-0.3021, -1.286534, -3.439062, 0, 0, 0, 1, 1,
-0.2985056, -0.06924236, -2.290831, 0, 0, 0, 1, 1,
-0.295497, 0.389939, 0.2393044, 1, 1, 1, 1, 1,
-0.2951029, 0.3784504, -0.1027736, 1, 1, 1, 1, 1,
-0.2944249, -1.150575, -4.534934, 1, 1, 1, 1, 1,
-0.294115, -0.3012549, -1.77849, 1, 1, 1, 1, 1,
-0.2927557, 1.341208, -0.4385998, 1, 1, 1, 1, 1,
-0.2921935, -1.258838, -1.99235, 1, 1, 1, 1, 1,
-0.2875604, 1.785616, -2.444406, 1, 1, 1, 1, 1,
-0.2868145, 0.03110495, 1.971802, 1, 1, 1, 1, 1,
-0.2863833, -0.04958859, -2.704109, 1, 1, 1, 1, 1,
-0.2841531, -0.5845311, -3.579229, 1, 1, 1, 1, 1,
-0.2830975, 0.1279513, -1.527096, 1, 1, 1, 1, 1,
-0.2792831, -0.02420833, -1.955501, 1, 1, 1, 1, 1,
-0.2783786, 0.2278984, -1.582602, 1, 1, 1, 1, 1,
-0.2781671, 0.6027189, -0.973103, 1, 1, 1, 1, 1,
-0.2775728, -0.1812785, -2.921353, 1, 1, 1, 1, 1,
-0.2750632, 0.6676025, 0.2288565, 0, 0, 1, 1, 1,
-0.2748248, -0.8850266, -0.8447149, 1, 0, 0, 1, 1,
-0.2738117, -0.9446567, -1.282793, 1, 0, 0, 1, 1,
-0.2737503, 0.5456416, -1.515364, 1, 0, 0, 1, 1,
-0.2724289, 0.949061, -0.5459363, 1, 0, 0, 1, 1,
-0.2695372, -0.334001, -1.812159, 1, 0, 0, 1, 1,
-0.2672678, -0.06689484, -1.350057, 0, 0, 0, 1, 1,
-0.2627098, 1.078987, 1.416553, 0, 0, 0, 1, 1,
-0.2575116, 0.7180473, 0.0843775, 0, 0, 0, 1, 1,
-0.2516994, -0.1977867, -1.850469, 0, 0, 0, 1, 1,
-0.2512677, 0.9436628, 1.180892, 0, 0, 0, 1, 1,
-0.2500457, 1.210304, -0.1134028, 0, 0, 0, 1, 1,
-0.248306, -1.453927, -3.468074, 0, 0, 0, 1, 1,
-0.2402708, 0.1856363, -1.414408, 1, 1, 1, 1, 1,
-0.2385404, -0.939211, -2.985119, 1, 1, 1, 1, 1,
-0.2340848, -0.8568338, -1.851229, 1, 1, 1, 1, 1,
-0.2299599, -0.1621727, -1.433196, 1, 1, 1, 1, 1,
-0.2295949, -0.4986757, -1.444438, 1, 1, 1, 1, 1,
-0.2265878, 0.496546, -2.543626, 1, 1, 1, 1, 1,
-0.2241577, 1.023343, -0.5246643, 1, 1, 1, 1, 1,
-0.2218708, -0.6172372, -3.852895, 1, 1, 1, 1, 1,
-0.2196972, -1.084493, -3.802403, 1, 1, 1, 1, 1,
-0.2172229, 0.2743846, -0.3163476, 1, 1, 1, 1, 1,
-0.2119718, 0.3199196, 1.014285, 1, 1, 1, 1, 1,
-0.2074924, 0.05059226, -2.666227, 1, 1, 1, 1, 1,
-0.2066555, 2.281282, 0.007116845, 1, 1, 1, 1, 1,
-0.2063891, -0.4323738, -4.615469, 1, 1, 1, 1, 1,
-0.2050315, 0.9213081, 0.6639821, 1, 1, 1, 1, 1,
-0.2020939, 0.313291, -1.257378, 0, 0, 1, 1, 1,
-0.2013709, -0.3911248, -0.6505452, 1, 0, 0, 1, 1,
-0.200829, -0.3799112, -2.932071, 1, 0, 0, 1, 1,
-0.198394, 0.815511, 1.145505, 1, 0, 0, 1, 1,
-0.1974775, 0.4445886, -1.340035, 1, 0, 0, 1, 1,
-0.1967695, -1.090506, -1.215257, 1, 0, 0, 1, 1,
-0.1961159, 1.221794, -1.37323, 0, 0, 0, 1, 1,
-0.194225, -1.210496, -3.491347, 0, 0, 0, 1, 1,
-0.1913287, -1.627405, -3.785654, 0, 0, 0, 1, 1,
-0.1883334, 0.1945063, -0.5763291, 0, 0, 0, 1, 1,
-0.1864753, 0.4267466, -0.3880985, 0, 0, 0, 1, 1,
-0.1832867, -0.2333451, -1.698143, 0, 0, 0, 1, 1,
-0.1829823, -0.1062995, -2.762771, 0, 0, 0, 1, 1,
-0.1811283, -0.9512626, -3.157631, 1, 1, 1, 1, 1,
-0.1802013, 1.327878, -0.04300861, 1, 1, 1, 1, 1,
-0.1718414, 1.225047, 0.9296424, 1, 1, 1, 1, 1,
-0.1708547, 1.469452, -0.2453525, 1, 1, 1, 1, 1,
-0.1690293, -0.6758775, -0.9450172, 1, 1, 1, 1, 1,
-0.168718, -1.840282, -2.298828, 1, 1, 1, 1, 1,
-0.1683992, -1.604966, -2.560508, 1, 1, 1, 1, 1,
-0.1656983, -0.245645, -2.314123, 1, 1, 1, 1, 1,
-0.1633284, -2.113133, -4.2113, 1, 1, 1, 1, 1,
-0.1612781, 1.014786, -0.5621082, 1, 1, 1, 1, 1,
-0.1611108, 1.3133, 1.933096, 1, 1, 1, 1, 1,
-0.1560232, -0.9520595, -2.574525, 1, 1, 1, 1, 1,
-0.1551838, 0.2402655, -1.219036, 1, 1, 1, 1, 1,
-0.1528979, 0.4936864, -0.03813027, 1, 1, 1, 1, 1,
-0.1469284, 0.8794452, 0.6387842, 1, 1, 1, 1, 1,
-0.1422085, 0.8753236, 1.246129, 0, 0, 1, 1, 1,
-0.1409056, -0.9754667, -4.714534, 1, 0, 0, 1, 1,
-0.1403501, 1.118087, -0.4936379, 1, 0, 0, 1, 1,
-0.139508, -0.02959182, -1.118709, 1, 0, 0, 1, 1,
-0.1392052, -0.9318458, -3.28692, 1, 0, 0, 1, 1,
-0.1386888, 1.580179, 0.06468878, 1, 0, 0, 1, 1,
-0.1379545, -0.043961, -2.742834, 0, 0, 0, 1, 1,
-0.1365002, 0.9064694, -2.017972, 0, 0, 0, 1, 1,
-0.1352944, 0.3378762, 0.4403207, 0, 0, 0, 1, 1,
-0.1331247, -0.5444394, -3.011024, 0, 0, 0, 1, 1,
-0.1317303, 0.512049, -0.7428665, 0, 0, 0, 1, 1,
-0.1300342, -0.8111786, -2.147827, 0, 0, 0, 1, 1,
-0.1271333, -0.1828672, -1.754846, 0, 0, 0, 1, 1,
-0.1268338, 0.07547743, -0.887631, 1, 1, 1, 1, 1,
-0.12395, 0.1674911, 0.643172, 1, 1, 1, 1, 1,
-0.118657, 1.63371, -0.7616887, 1, 1, 1, 1, 1,
-0.112226, -0.2840289, -1.918402, 1, 1, 1, 1, 1,
-0.1122226, 0.1308289, -1.121982, 1, 1, 1, 1, 1,
-0.1121141, 0.5403056, 0.1020117, 1, 1, 1, 1, 1,
-0.1102149, -0.7119552, -2.122115, 1, 1, 1, 1, 1,
-0.1049628, 0.5811926, 0.7907479, 1, 1, 1, 1, 1,
-0.1011273, -0.7042142, -3.738009, 1, 1, 1, 1, 1,
-0.09960414, -1.254412, -5.28467, 1, 1, 1, 1, 1,
-0.09832156, 1.024305, 0.5051221, 1, 1, 1, 1, 1,
-0.09342353, -0.9349697, -3.555973, 1, 1, 1, 1, 1,
-0.08885894, -1.297364, -4.815127, 1, 1, 1, 1, 1,
-0.08798897, 0.5993122, -0.5791529, 1, 1, 1, 1, 1,
-0.0851822, 0.198379, -0.1384843, 1, 1, 1, 1, 1,
-0.08415399, -1.959668, -2.242989, 0, 0, 1, 1, 1,
-0.08130715, -0.06931553, -2.540407, 1, 0, 0, 1, 1,
-0.07815807, 1.49508, -1.751492, 1, 0, 0, 1, 1,
-0.07698894, -0.7717462, -4.162178, 1, 0, 0, 1, 1,
-0.07233243, -1.395491, -2.837801, 1, 0, 0, 1, 1,
-0.06791064, 0.5700426, -1.189917, 1, 0, 0, 1, 1,
-0.06691859, 0.7075325, -0.06525719, 0, 0, 0, 1, 1,
-0.06520778, -0.03541042, -2.306746, 0, 0, 0, 1, 1,
-0.06441164, -0.08533885, -3.00741, 0, 0, 0, 1, 1,
-0.06084342, -2.135967, -3.128783, 0, 0, 0, 1, 1,
-0.06078967, -0.06211108, -3.470086, 0, 0, 0, 1, 1,
-0.06044697, 0.602421, -1.199809, 0, 0, 0, 1, 1,
-0.0586398, 0.2933974, -1.043439, 0, 0, 0, 1, 1,
-0.05687873, -1.206253, -2.180402, 1, 1, 1, 1, 1,
-0.05567305, 0.3890761, -0.5074788, 1, 1, 1, 1, 1,
-0.05543067, -0.7154878, -3.838306, 1, 1, 1, 1, 1,
-0.04931064, -0.955305, -2.165662, 1, 1, 1, 1, 1,
-0.04672681, 0.8475861, -1.559721, 1, 1, 1, 1, 1,
-0.04617101, -0.3028869, -3.852132, 1, 1, 1, 1, 1,
-0.0419523, 0.1774839, 0.09949688, 1, 1, 1, 1, 1,
-0.04046145, -0.6143105, -3.679029, 1, 1, 1, 1, 1,
-0.03953658, 0.8769499, 1.869033, 1, 1, 1, 1, 1,
-0.03581074, 1.439829, -0.6144986, 1, 1, 1, 1, 1,
-0.03265612, -0.8428275, -2.166337, 1, 1, 1, 1, 1,
-0.0313235, 1.509142, 0.6955997, 1, 1, 1, 1, 1,
-0.03128057, 0.3434488, -0.9835461, 1, 1, 1, 1, 1,
-0.02720127, -1.128629, -3.000884, 1, 1, 1, 1, 1,
-0.01087977, 0.541998, -0.5767967, 1, 1, 1, 1, 1,
-0.009898612, -1.287109, -3.026974, 0, 0, 1, 1, 1,
-0.00968302, 1.578797, -0.5051532, 1, 0, 0, 1, 1,
-0.007740553, 0.1081309, 0.02787967, 1, 0, 0, 1, 1,
-0.004567379, 1.651961, -0.2271447, 1, 0, 0, 1, 1,
-0.0005213158, -0.6615203, -2.770804, 1, 0, 0, 1, 1,
0.0002218301, -0.1118443, 2.659696, 1, 0, 0, 1, 1,
0.0008586373, 1.114162, 0.4315335, 0, 0, 0, 1, 1,
0.004043228, -0.8911266, 2.569857, 0, 0, 0, 1, 1,
0.007920842, 1.305118, -1.434236, 0, 0, 0, 1, 1,
0.008359777, -0.4316725, 3.642885, 0, 0, 0, 1, 1,
0.01157946, -1.132854, 2.117983, 0, 0, 0, 1, 1,
0.01728625, 2.515104, 0.01907137, 0, 0, 0, 1, 1,
0.01784449, 0.3483156, -0.3641334, 0, 0, 0, 1, 1,
0.01803938, 0.2914643, -0.3207139, 1, 1, 1, 1, 1,
0.01943212, -0.9462907, 2.749484, 1, 1, 1, 1, 1,
0.0206938, 1.374642, -1.573593, 1, 1, 1, 1, 1,
0.0258594, -0.951423, 2.593499, 1, 1, 1, 1, 1,
0.02633394, 0.102864, 2.495681, 1, 1, 1, 1, 1,
0.02684222, 0.6803965, -0.1857948, 1, 1, 1, 1, 1,
0.02897226, 1.318308, 1.676535, 1, 1, 1, 1, 1,
0.04004401, -0.05532116, 3.97705, 1, 1, 1, 1, 1,
0.04250346, 0.1053173, 0.1193648, 1, 1, 1, 1, 1,
0.04433135, -0.9079428, 0.9310725, 1, 1, 1, 1, 1,
0.0478755, -0.8605892, 2.216127, 1, 1, 1, 1, 1,
0.0489395, -2.327049, 3.186553, 1, 1, 1, 1, 1,
0.04932375, -1.028243, 3.733488, 1, 1, 1, 1, 1,
0.04937862, 0.9609867, 0.5723116, 1, 1, 1, 1, 1,
0.05185393, -0.08813888, 2.517221, 1, 1, 1, 1, 1,
0.05244229, 0.7743884, 0.4102119, 0, 0, 1, 1, 1,
0.05491796, 0.7850447, -0.3359464, 1, 0, 0, 1, 1,
0.0576518, 0.6592181, 1.538033, 1, 0, 0, 1, 1,
0.06395549, 1.964455, -0.8973781, 1, 0, 0, 1, 1,
0.07484749, 1.668686, -1.840874, 1, 0, 0, 1, 1,
0.07895509, -1.5762, 3.078543, 1, 0, 0, 1, 1,
0.07979974, 0.2611861, -0.6502145, 0, 0, 0, 1, 1,
0.08138856, -0.04934786, 0.5097813, 0, 0, 0, 1, 1,
0.08449145, 0.6075464, 0.644328, 0, 0, 0, 1, 1,
0.08610895, -0.2736599, 3.06752, 0, 0, 0, 1, 1,
0.08798162, 0.06921477, 0.386146, 0, 0, 0, 1, 1,
0.08997048, 0.7615971, -1.731755, 0, 0, 0, 1, 1,
0.09150513, 0.3501887, -1.186702, 0, 0, 0, 1, 1,
0.09727306, 1.035771, 0.02423234, 1, 1, 1, 1, 1,
0.1211136, 0.3269326, 1.250293, 1, 1, 1, 1, 1,
0.1288259, 1.459878, -0.3617843, 1, 1, 1, 1, 1,
0.1297168, -0.2866372, 2.327181, 1, 1, 1, 1, 1,
0.1310834, 0.7692236, 1.946267, 1, 1, 1, 1, 1,
0.1322573, -0.1834931, 4.069282, 1, 1, 1, 1, 1,
0.1373282, -0.2766984, 2.614863, 1, 1, 1, 1, 1,
0.140688, -2.33195, 3.073225, 1, 1, 1, 1, 1,
0.1419475, -1.358157, 2.052664, 1, 1, 1, 1, 1,
0.1453789, 0.3037555, 1.40362, 1, 1, 1, 1, 1,
0.157967, -1.436599, 3.532274, 1, 1, 1, 1, 1,
0.162844, 0.9391438, 1.573057, 1, 1, 1, 1, 1,
0.1649018, 0.4146288, 2.178972, 1, 1, 1, 1, 1,
0.165321, -0.163961, 1.261331, 1, 1, 1, 1, 1,
0.1658961, -0.05692144, 2.58254, 1, 1, 1, 1, 1,
0.1670181, 2.736642, -1.252254, 0, 0, 1, 1, 1,
0.1679718, 1.259861, 0.1063117, 1, 0, 0, 1, 1,
0.1685381, 0.5042989, 1.296119, 1, 0, 0, 1, 1,
0.1744693, 0.2100241, 0.2219869, 1, 0, 0, 1, 1,
0.1757946, -0.6298076, 1.804234, 1, 0, 0, 1, 1,
0.1762172, 0.9446214, -0.6797432, 1, 0, 0, 1, 1,
0.1809344, 1.566013, 0.4167128, 0, 0, 0, 1, 1,
0.184203, -0.4253675, 3.245855, 0, 0, 0, 1, 1,
0.1851993, -0.3883375, 2.583658, 0, 0, 0, 1, 1,
0.1881479, -1.903867, 2.404833, 0, 0, 0, 1, 1,
0.1908708, 0.950304, 0.6223262, 0, 0, 0, 1, 1,
0.1932193, 1.270624, -0.6601605, 0, 0, 0, 1, 1,
0.1999822, 0.1270487, -0.1760315, 0, 0, 0, 1, 1,
0.2018192, 0.7973187, 2.425999, 1, 1, 1, 1, 1,
0.205049, 1.000677, -0.6580887, 1, 1, 1, 1, 1,
0.2050633, -0.9071556, 1.900585, 1, 1, 1, 1, 1,
0.2052537, 0.3091539, 0.9221755, 1, 1, 1, 1, 1,
0.2054668, 1.239951, -0.01507949, 1, 1, 1, 1, 1,
0.2070646, 0.7406905, 0.2075211, 1, 1, 1, 1, 1,
0.2077736, -0.6737561, 3.23154, 1, 1, 1, 1, 1,
0.2089349, -0.01278674, 0.6472082, 1, 1, 1, 1, 1,
0.2093836, 1.482873, -0.004598628, 1, 1, 1, 1, 1,
0.2117622, 0.4778717, 1.68662, 1, 1, 1, 1, 1,
0.212663, -1.332464, 3.999668, 1, 1, 1, 1, 1,
0.2148121, -0.1757408, 1.302405, 1, 1, 1, 1, 1,
0.2176777, 0.07381421, 1.885322, 1, 1, 1, 1, 1,
0.2189252, -0.3928924, 2.961523, 1, 1, 1, 1, 1,
0.2225202, -0.3095515, 0.4309552, 1, 1, 1, 1, 1,
0.2268157, -0.7182222, 3.073397, 0, 0, 1, 1, 1,
0.2287093, -0.7387508, 4.702161, 1, 0, 0, 1, 1,
0.232386, 1.294326, -1.692598, 1, 0, 0, 1, 1,
0.2341061, -0.09779826, 0.3642957, 1, 0, 0, 1, 1,
0.2357519, 0.1702688, 0.7531813, 1, 0, 0, 1, 1,
0.2411929, 0.5263928, 2.741905, 1, 0, 0, 1, 1,
0.2441645, 0.5260193, 1.047943, 0, 0, 0, 1, 1,
0.2441895, -0.9589528, 1.921878, 0, 0, 0, 1, 1,
0.2453391, -0.2859612, 1.844748, 0, 0, 0, 1, 1,
0.2460652, 0.6822029, 1.176062, 0, 0, 0, 1, 1,
0.2501557, -0.330065, 0.4295183, 0, 0, 0, 1, 1,
0.2564921, 0.1535831, -0.1850003, 0, 0, 0, 1, 1,
0.2571843, -0.5710447, 2.456571, 0, 0, 0, 1, 1,
0.2576875, -0.1170202, 2.491956, 1, 1, 1, 1, 1,
0.257879, -0.09547623, 1.315369, 1, 1, 1, 1, 1,
0.2580989, 0.8112524, 0.2353619, 1, 1, 1, 1, 1,
0.2583165, -0.4079781, 2.31473, 1, 1, 1, 1, 1,
0.2630186, 1.462185, 1.663302, 1, 1, 1, 1, 1,
0.2666502, -0.3647709, 3.965634, 1, 1, 1, 1, 1,
0.2673233, -0.3066172, 4.449594, 1, 1, 1, 1, 1,
0.2704066, 0.5549264, 0.6547443, 1, 1, 1, 1, 1,
0.2718817, 0.3997795, -1.011335, 1, 1, 1, 1, 1,
0.2766198, 0.2100146, 1.361822, 1, 1, 1, 1, 1,
0.2773893, 0.9435548, 1.844919, 1, 1, 1, 1, 1,
0.2774243, -0.5202184, 2.435036, 1, 1, 1, 1, 1,
0.2784739, 1.22264, -0.001176066, 1, 1, 1, 1, 1,
0.2787693, 1.033548, 0.161307, 1, 1, 1, 1, 1,
0.2853268, -1.79775, 1.884036, 1, 1, 1, 1, 1,
0.2876796, 0.2805963, -0.8384837, 0, 0, 1, 1, 1,
0.2885891, -0.745964, -0.04376972, 1, 0, 0, 1, 1,
0.2912081, 0.6928098, -0.9485987, 1, 0, 0, 1, 1,
0.2916874, -0.6985182, 3.649557, 1, 0, 0, 1, 1,
0.2929097, -0.06907383, 2.780573, 1, 0, 0, 1, 1,
0.2937697, 0.7689638, 0.5629712, 1, 0, 0, 1, 1,
0.2945487, 0.5710198, 1.162116, 0, 0, 0, 1, 1,
0.2952757, 0.8308743, 0.4828856, 0, 0, 0, 1, 1,
0.2956428, 1.948331, -0.8849469, 0, 0, 0, 1, 1,
0.2966935, 1.357482, -0.360276, 0, 0, 0, 1, 1,
0.3014069, 0.5546242, 1.302399, 0, 0, 0, 1, 1,
0.3027124, 0.005058974, 3.376742, 0, 0, 0, 1, 1,
0.3031413, -0.3157702, 1.33872, 0, 0, 0, 1, 1,
0.3039526, 0.8747814, -0.09998199, 1, 1, 1, 1, 1,
0.305498, -0.110498, 2.808251, 1, 1, 1, 1, 1,
0.3062615, 0.1803998, 1.181405, 1, 1, 1, 1, 1,
0.3067789, 1.019645, -1.510006, 1, 1, 1, 1, 1,
0.313694, -0.6475375, -0.06811826, 1, 1, 1, 1, 1,
0.3151109, -0.95178, 1.99894, 1, 1, 1, 1, 1,
0.3164281, -1.135961, 2.491727, 1, 1, 1, 1, 1,
0.3183886, 0.2755679, 0.3690702, 1, 1, 1, 1, 1,
0.3195492, -2.020894, 1.995138, 1, 1, 1, 1, 1,
0.3277319, 1.422552, 0.00670441, 1, 1, 1, 1, 1,
0.3281941, 0.2238496, 0.4375025, 1, 1, 1, 1, 1,
0.3294261, 0.4099092, 0.5537806, 1, 1, 1, 1, 1,
0.3298285, 1.685779, -1.352031, 1, 1, 1, 1, 1,
0.3360163, 0.5476989, 1.464059, 1, 1, 1, 1, 1,
0.33933, 0.2700306, 2.459861, 1, 1, 1, 1, 1,
0.3417817, -0.212778, 1.67686, 0, 0, 1, 1, 1,
0.3443813, -0.1112463, 1.459222, 1, 0, 0, 1, 1,
0.3443994, -0.6867663, 2.041903, 1, 0, 0, 1, 1,
0.3464062, -0.9560493, 2.099186, 1, 0, 0, 1, 1,
0.3464799, 0.2354282, 2.967759, 1, 0, 0, 1, 1,
0.3472326, 0.5951604, 2.154019, 1, 0, 0, 1, 1,
0.3497823, 1.419039, 0.449939, 0, 0, 0, 1, 1,
0.351898, 0.598296, 0.2189593, 0, 0, 0, 1, 1,
0.3538851, -0.09233127, 1.349961, 0, 0, 0, 1, 1,
0.3540674, 0.5438737, 0.5006505, 0, 0, 0, 1, 1,
0.3544395, -1.402861, 2.437252, 0, 0, 0, 1, 1,
0.3562638, 0.2378674, 1.333958, 0, 0, 0, 1, 1,
0.3570597, 0.3378454, 0.6734731, 0, 0, 0, 1, 1,
0.3578052, 1.021947, 0.2407488, 1, 1, 1, 1, 1,
0.361252, -0.6619192, 1.527211, 1, 1, 1, 1, 1,
0.3650888, -0.451359, 3.864812, 1, 1, 1, 1, 1,
0.368288, -0.9654596, 1.81752, 1, 1, 1, 1, 1,
0.3733269, 0.2316949, 0.8921757, 1, 1, 1, 1, 1,
0.3744552, -0.02518468, 1.894235, 1, 1, 1, 1, 1,
0.3770222, -0.3048235, 2.689953, 1, 1, 1, 1, 1,
0.3805134, -0.2571642, 1.023355, 1, 1, 1, 1, 1,
0.3882783, -0.4869076, 2.025042, 1, 1, 1, 1, 1,
0.3962614, 0.02177402, 2.077373, 1, 1, 1, 1, 1,
0.39743, 0.3742568, -0.7485899, 1, 1, 1, 1, 1,
0.399571, 1.078704, -0.2269843, 1, 1, 1, 1, 1,
0.4022018, 1.448144, -1.13988, 1, 1, 1, 1, 1,
0.4049486, 0.0971464, 1.864266, 1, 1, 1, 1, 1,
0.4056535, 0.2418243, 1.379659, 1, 1, 1, 1, 1,
0.4061689, -1.501115, 3.178751, 0, 0, 1, 1, 1,
0.4068919, 0.7259058, 0.2649371, 1, 0, 0, 1, 1,
0.4129392, 0.02179472, 2.142844, 1, 0, 0, 1, 1,
0.4200248, -2.437604, 3.065316, 1, 0, 0, 1, 1,
0.4230073, -1.127808, 3.855603, 1, 0, 0, 1, 1,
0.4238944, -0.9867761, 3.138422, 1, 0, 0, 1, 1,
0.4247672, 0.02259349, 1.966042, 0, 0, 0, 1, 1,
0.4373718, -0.1178805, 2.739355, 0, 0, 0, 1, 1,
0.4384576, -0.4828319, 1.522133, 0, 0, 0, 1, 1,
0.4395263, 0.008366459, 0.5951863, 0, 0, 0, 1, 1,
0.4429063, 0.3075584, -1.872232, 0, 0, 0, 1, 1,
0.4472298, 1.098285, -0.3153355, 0, 0, 0, 1, 1,
0.4505005, -0.474127, 2.739258, 0, 0, 0, 1, 1,
0.4671483, 0.7640927, 0.7590742, 1, 1, 1, 1, 1,
0.4686503, 0.621817, -0.4504621, 1, 1, 1, 1, 1,
0.4694135, -0.1704968, 1.427266, 1, 1, 1, 1, 1,
0.4696614, 0.8922204, 0.2967938, 1, 1, 1, 1, 1,
0.4723624, -0.4368479, 3.422119, 1, 1, 1, 1, 1,
0.4742992, -1.591416, 3.722627, 1, 1, 1, 1, 1,
0.4744249, 1.198881, 1.403594, 1, 1, 1, 1, 1,
0.476446, 0.7043791, 0.06396163, 1, 1, 1, 1, 1,
0.4771426, -1.38077, 1.424978, 1, 1, 1, 1, 1,
0.4800409, -1.869022, 2.295997, 1, 1, 1, 1, 1,
0.4822354, 0.5709752, 1.435421, 1, 1, 1, 1, 1,
0.4831556, 1.012184, -1.267842, 1, 1, 1, 1, 1,
0.4839368, 1.287711, -0.2546969, 1, 1, 1, 1, 1,
0.4862885, 1.055952, 0.7452165, 1, 1, 1, 1, 1,
0.4865629, 0.3045642, 1.642195, 1, 1, 1, 1, 1,
0.4886428, -0.3121801, 1.937853, 0, 0, 1, 1, 1,
0.4895439, -0.1111818, 2.786066, 1, 0, 0, 1, 1,
0.4912517, -1.230548, 3.488911, 1, 0, 0, 1, 1,
0.4964713, 0.7968568, 0.5883444, 1, 0, 0, 1, 1,
0.5027751, -0.4395557, 1.777431, 1, 0, 0, 1, 1,
0.5042907, 0.2783428, 2.228166, 1, 0, 0, 1, 1,
0.5045562, -1.584902, 2.173104, 0, 0, 0, 1, 1,
0.5047856, 0.9712075, -0.2558567, 0, 0, 0, 1, 1,
0.5048794, 0.6303833, 0.9666305, 0, 0, 0, 1, 1,
0.5053512, -1.150442, 2.697454, 0, 0, 0, 1, 1,
0.5063893, 1.048578, -0.7749109, 0, 0, 0, 1, 1,
0.5090883, 0.02621529, 2.077328, 0, 0, 0, 1, 1,
0.5102195, -2.697753, 2.400829, 0, 0, 0, 1, 1,
0.5119767, -2.142928, 3.442434, 1, 1, 1, 1, 1,
0.523196, -0.7538046, 3.017258, 1, 1, 1, 1, 1,
0.5267129, 0.4898967, 1.49362, 1, 1, 1, 1, 1,
0.5327251, -0.003491832, 3.062203, 1, 1, 1, 1, 1,
0.5429044, 0.3451253, 1.157023, 1, 1, 1, 1, 1,
0.5441875, 0.6632004, 0.03283761, 1, 1, 1, 1, 1,
0.5475128, 0.2430057, 1.683891, 1, 1, 1, 1, 1,
0.5497772, -0.5149149, 4.119093, 1, 1, 1, 1, 1,
0.5529038, 0.8371381, -0.08174295, 1, 1, 1, 1, 1,
0.5536572, 0.1508326, 1.835191, 1, 1, 1, 1, 1,
0.5573441, 0.423344, 0.3259361, 1, 1, 1, 1, 1,
0.5601383, -0.5790999, 3.885433, 1, 1, 1, 1, 1,
0.5677747, 1.202846, 1.080952, 1, 1, 1, 1, 1,
0.5717114, -1.398505, 1.224724, 1, 1, 1, 1, 1,
0.5736677, -1.735372, 2.348092, 1, 1, 1, 1, 1,
0.5747075, -2.395165, 3.295161, 0, 0, 1, 1, 1,
0.5749006, 0.4928877, 1.274024, 1, 0, 0, 1, 1,
0.5749068, 0.2637778, 1.879128, 1, 0, 0, 1, 1,
0.5769045, -0.6080365, 3.579963, 1, 0, 0, 1, 1,
0.5869434, -1.324305, 2.532795, 1, 0, 0, 1, 1,
0.5898768, 0.09029075, 1.069015, 1, 0, 0, 1, 1,
0.5944154, -0.04209577, -0.3563582, 0, 0, 0, 1, 1,
0.5945694, 0.1504029, 1.978471, 0, 0, 0, 1, 1,
0.5947068, -0.5565642, 4.014817, 0, 0, 0, 1, 1,
0.5952666, -1.433026, 2.33691, 0, 0, 0, 1, 1,
0.5987943, -1.414453, 2.452571, 0, 0, 0, 1, 1,
0.5998421, -0.4911456, 2.947401, 0, 0, 0, 1, 1,
0.6016335, -0.8186458, 2.975542, 0, 0, 0, 1, 1,
0.6022057, -1.645096, 3.395775, 1, 1, 1, 1, 1,
0.6032302, 1.417645, 1.176686, 1, 1, 1, 1, 1,
0.6052146, -0.01968957, -0.290127, 1, 1, 1, 1, 1,
0.6125692, -1.751615, 3.948707, 1, 1, 1, 1, 1,
0.6132427, -0.5761591, 2.928222, 1, 1, 1, 1, 1,
0.6133654, -0.1555644, 2.268646, 1, 1, 1, 1, 1,
0.6135955, -1.008494, 2.796736, 1, 1, 1, 1, 1,
0.6224419, 1.684623, 0.9463393, 1, 1, 1, 1, 1,
0.6240625, 0.29421, 1.910304, 1, 1, 1, 1, 1,
0.625576, 9.697481e-05, 1.903725, 1, 1, 1, 1, 1,
0.6278654, 0.8718249, 0.8913956, 1, 1, 1, 1, 1,
0.6311143, -2.543276, 3.697802, 1, 1, 1, 1, 1,
0.6317073, 0.2326964, 0.3297606, 1, 1, 1, 1, 1,
0.6402285, -1.481373, 1.419603, 1, 1, 1, 1, 1,
0.6495091, 0.746715, 1.862319, 1, 1, 1, 1, 1,
0.6498644, -0.8207549, 2.081706, 0, 0, 1, 1, 1,
0.6559558, -0.9673131, 3.287759, 1, 0, 0, 1, 1,
0.6697375, 0.2824621, 2.29404, 1, 0, 0, 1, 1,
0.6729283, -0.2255407, 2.999638, 1, 0, 0, 1, 1,
0.6739886, -0.6620178, 2.715119, 1, 0, 0, 1, 1,
0.6794945, -0.01067413, 0.4115645, 1, 0, 0, 1, 1,
0.681617, 1.437107, 1.206504, 0, 0, 0, 1, 1,
0.6821041, -0.9338461, 2.307428, 0, 0, 0, 1, 1,
0.6824378, 0.1759712, 1.71183, 0, 0, 0, 1, 1,
0.683433, 1.657155, 1.768226, 0, 0, 0, 1, 1,
0.6877322, -0.2762544, 0.9266535, 0, 0, 0, 1, 1,
0.6905544, -0.1132101, 1.084988, 0, 0, 0, 1, 1,
0.6906683, 1.971658, 0.6650569, 0, 0, 0, 1, 1,
0.693072, -0.3059501, 2.156574, 1, 1, 1, 1, 1,
0.6989403, -0.3827653, 0.3876811, 1, 1, 1, 1, 1,
0.6992849, 0.7400585, -0.5562428, 1, 1, 1, 1, 1,
0.7008897, 0.2236022, 2.725653, 1, 1, 1, 1, 1,
0.7026541, 1.705184, -0.6875184, 1, 1, 1, 1, 1,
0.7033386, -2.490188, 2.786515, 1, 1, 1, 1, 1,
0.704551, 1.087898, 1.235534, 1, 1, 1, 1, 1,
0.7092097, 0.4837875, 0.9683226, 1, 1, 1, 1, 1,
0.7106724, 0.3990507, -0.4779018, 1, 1, 1, 1, 1,
0.7151836, 0.7777178, 1.35506, 1, 1, 1, 1, 1,
0.7162533, -0.3134252, 2.718016, 1, 1, 1, 1, 1,
0.7200209, -0.6374086, 3.231483, 1, 1, 1, 1, 1,
0.7218048, 0.8134071, 1.014374, 1, 1, 1, 1, 1,
0.7281824, 0.7663615, 0.4369528, 1, 1, 1, 1, 1,
0.7298621, 1.345305, -0.5905236, 1, 1, 1, 1, 1,
0.732664, 0.7127229, 0.6093058, 0, 0, 1, 1, 1,
0.7368789, -1.330739, 2.315096, 1, 0, 0, 1, 1,
0.7373555, -0.8110555, 1.591936, 1, 0, 0, 1, 1,
0.740106, 0.79172, 1.763541, 1, 0, 0, 1, 1,
0.7415377, -1.330946, 2.436007, 1, 0, 0, 1, 1,
0.7484751, -0.007828282, 1.298162, 1, 0, 0, 1, 1,
0.7497215, 2.579358, 1.158842, 0, 0, 0, 1, 1,
0.7507999, -1.111027, 2.001404, 0, 0, 0, 1, 1,
0.7514096, -0.1094576, 1.697675, 0, 0, 0, 1, 1,
0.7540857, 1.084026, 0.5135165, 0, 0, 0, 1, 1,
0.7558981, -0.1365601, 2.028735, 0, 0, 0, 1, 1,
0.7593086, -0.778796, 2.281957, 0, 0, 0, 1, 1,
0.763373, 0.551516, 0.950811, 0, 0, 0, 1, 1,
0.7732967, 0.07612889, 0.8005157, 1, 1, 1, 1, 1,
0.7795359, 0.7952801, 2.490661, 1, 1, 1, 1, 1,
0.7795666, -1.826918, 2.053523, 1, 1, 1, 1, 1,
0.7841769, 0.7121481, 3.184117, 1, 1, 1, 1, 1,
0.7905078, -1.043199, 2.763791, 1, 1, 1, 1, 1,
0.7930834, 0.0023886, 2.569644, 1, 1, 1, 1, 1,
0.7993764, -0.7655852, 0.9366947, 1, 1, 1, 1, 1,
0.8058919, -1.162667, 1.20823, 1, 1, 1, 1, 1,
0.8100101, -0.767669, 1.200957, 1, 1, 1, 1, 1,
0.8109029, -0.5315511, 2.445144, 1, 1, 1, 1, 1,
0.8182961, 0.3814616, 0.6534166, 1, 1, 1, 1, 1,
0.8193926, -0.570035, 2.524026, 1, 1, 1, 1, 1,
0.8289134, 0.5921978, -0.3641332, 1, 1, 1, 1, 1,
0.8342687, -0.7185881, 2.243938, 1, 1, 1, 1, 1,
0.8365761, -0.1045994, 0.51037, 1, 1, 1, 1, 1,
0.8419088, 0.05200347, 2.469149, 0, 0, 1, 1, 1,
0.8449244, -0.1027939, 1.568765, 1, 0, 0, 1, 1,
0.8481874, 1.503861, -0.296262, 1, 0, 0, 1, 1,
0.8482325, 0.9688907, 1.249798, 1, 0, 0, 1, 1,
0.8484666, 0.5018205, 1.818581, 1, 0, 0, 1, 1,
0.8551042, -1.48657, 1.710437, 1, 0, 0, 1, 1,
0.8589638, 0.1515153, 1.83016, 0, 0, 0, 1, 1,
0.8613721, -0.6289284, 1.914908, 0, 0, 0, 1, 1,
0.873064, -1.653439, 2.030239, 0, 0, 0, 1, 1,
0.8739201, -0.7208561, 1.313465, 0, 0, 0, 1, 1,
0.8747023, -0.09442931, 2.376749, 0, 0, 0, 1, 1,
0.8869397, 0.4192897, 0.4270353, 0, 0, 0, 1, 1,
0.8886994, 0.2459562, 0.412097, 0, 0, 0, 1, 1,
0.8946667, 0.463601, 1.186889, 1, 1, 1, 1, 1,
0.9033265, -0.575105, 3.031495, 1, 1, 1, 1, 1,
0.9063321, -0.5845968, 3.317579, 1, 1, 1, 1, 1,
0.9087605, 0.8305708, 0.847316, 1, 1, 1, 1, 1,
0.9139376, 3.269264, -0.5673217, 1, 1, 1, 1, 1,
0.9196686, -0.3155369, 0.7979316, 1, 1, 1, 1, 1,
0.9205554, 0.9658575, 1.680009, 1, 1, 1, 1, 1,
0.9210547, -1.338295, 2.866181, 1, 1, 1, 1, 1,
0.9211984, -1.653829, 2.356945, 1, 1, 1, 1, 1,
0.9251869, -0.6017774, 1.303191, 1, 1, 1, 1, 1,
0.9261392, 0.1063239, 2.788571, 1, 1, 1, 1, 1,
0.9270352, 0.2081021, 1.093071, 1, 1, 1, 1, 1,
0.9348799, -0.7470677, 2.404492, 1, 1, 1, 1, 1,
0.9421899, -0.9413017, 2.659561, 1, 1, 1, 1, 1,
0.9428139, -0.8701335, 1.569802, 1, 1, 1, 1, 1,
0.9442226, -0.08903221, 0.4975848, 0, 0, 1, 1, 1,
0.9447394, 0.09621987, -0.2194573, 1, 0, 0, 1, 1,
0.9453945, -0.3023325, 2.733311, 1, 0, 0, 1, 1,
0.9454931, 0.5905394, 2.624213, 1, 0, 0, 1, 1,
0.9496954, -0.8693422, 1.557117, 1, 0, 0, 1, 1,
0.9535045, -0.9518261, 2.496178, 1, 0, 0, 1, 1,
0.9540648, 1.332694, -1.246476, 0, 0, 0, 1, 1,
0.971836, -0.1778175, 2.547559, 0, 0, 0, 1, 1,
0.9740068, 1.53781, 1.660188, 0, 0, 0, 1, 1,
0.9765338, 1.367604, 1.539117, 0, 0, 0, 1, 1,
0.9841611, -0.4990502, 2.021815, 0, 0, 0, 1, 1,
0.9867301, -0.5909618, 2.690156, 0, 0, 0, 1, 1,
0.9891784, 2.405814, 0.7991005, 0, 0, 0, 1, 1,
0.9918082, 1.407739, 1.56535, 1, 1, 1, 1, 1,
0.9928154, -0.1684497, -0.02502041, 1, 1, 1, 1, 1,
0.9969487, -0.1793964, 1.667869, 1, 1, 1, 1, 1,
0.9985768, -0.8809593, 2.067313, 1, 1, 1, 1, 1,
1.002072, -0.8225968, 1.697249, 1, 1, 1, 1, 1,
1.007201, 1.86781, 1.109684, 1, 1, 1, 1, 1,
1.008905, -0.4290305, 0.4184934, 1, 1, 1, 1, 1,
1.009348, 0.5803208, 1.936067, 1, 1, 1, 1, 1,
1.018523, 0.3166161, 1.212033, 1, 1, 1, 1, 1,
1.023539, 0.3834049, 0.9650462, 1, 1, 1, 1, 1,
1.026824, -0.1504977, 1.041517, 1, 1, 1, 1, 1,
1.027585, 0.533134, 0.7957437, 1, 1, 1, 1, 1,
1.029013, 0.8819609, -0.4605621, 1, 1, 1, 1, 1,
1.029437, 0.70587, 0.6375002, 1, 1, 1, 1, 1,
1.0303, 2.269928, -0.3763771, 1, 1, 1, 1, 1,
1.037011, -1.700284, 2.269053, 0, 0, 1, 1, 1,
1.040082, 0.3835797, -0.05126368, 1, 0, 0, 1, 1,
1.041158, -0.7919556, 1.080457, 1, 0, 0, 1, 1,
1.060877, -1.373808, 3.225977, 1, 0, 0, 1, 1,
1.063112, 1.039081, 1.272379, 1, 0, 0, 1, 1,
1.071233, -0.06477895, -0.6158336, 1, 0, 0, 1, 1,
1.083027, 1.011042, 2.354697, 0, 0, 0, 1, 1,
1.089699, -0.7083541, 2.99044, 0, 0, 0, 1, 1,
1.094562, -0.05092959, 1.318772, 0, 0, 0, 1, 1,
1.098327, -0.328422, 2.660401, 0, 0, 0, 1, 1,
1.098823, 0.3143664, 2.439376, 0, 0, 0, 1, 1,
1.102405, -0.562119, 2.300008, 0, 0, 0, 1, 1,
1.107926, -0.6797301, 2.189676, 0, 0, 0, 1, 1,
1.10798, 0.3875222, 0.156682, 1, 1, 1, 1, 1,
1.125181, -0.3326872, -0.06824143, 1, 1, 1, 1, 1,
1.125459, -1.460146, 1.259088, 1, 1, 1, 1, 1,
1.130149, -1.583443, 2.946372, 1, 1, 1, 1, 1,
1.136848, -1.310559, 3.280367, 1, 1, 1, 1, 1,
1.137773, -1.650705, 1.443553, 1, 1, 1, 1, 1,
1.138326, -0.08764794, 1.748713, 1, 1, 1, 1, 1,
1.172108, -0.5095696, 1.517498, 1, 1, 1, 1, 1,
1.179216, -0.3166153, 2.241808, 1, 1, 1, 1, 1,
1.181065, -1.144362, 2.130574, 1, 1, 1, 1, 1,
1.193951, -0.4857042, 0.9959908, 1, 1, 1, 1, 1,
1.197466, 0.3882859, 2.655583, 1, 1, 1, 1, 1,
1.198321, 0.7369661, -0.01688992, 1, 1, 1, 1, 1,
1.199145, 0.589914, 2.649091, 1, 1, 1, 1, 1,
1.199793, -0.9083256, 2.196159, 1, 1, 1, 1, 1,
1.206042, -0.8861662, 2.672024, 0, 0, 1, 1, 1,
1.210841, -0.2647863, -0.01464383, 1, 0, 0, 1, 1,
1.211131, -0.1518938, 2.468676, 1, 0, 0, 1, 1,
1.224742, -0.7991419, 2.622466, 1, 0, 0, 1, 1,
1.225155, 0.5561172, 1.343873, 1, 0, 0, 1, 1,
1.22685, 1.011705, 0.8456005, 1, 0, 0, 1, 1,
1.231913, -1.16104, 1.453902, 0, 0, 0, 1, 1,
1.254633, -0.7171742, 1.78586, 0, 0, 0, 1, 1,
1.257225, -0.5376411, 0.4746223, 0, 0, 0, 1, 1,
1.261674, -0.1412467, 1.834139, 0, 0, 0, 1, 1,
1.267535, 1.035084, 0.1488589, 0, 0, 0, 1, 1,
1.267999, 0.8442365, 0.757377, 0, 0, 0, 1, 1,
1.270496, 2.249721, -0.3280867, 0, 0, 0, 1, 1,
1.281821, 0.9549545, 0.8888535, 1, 1, 1, 1, 1,
1.283413, -1.167199, 2.456207, 1, 1, 1, 1, 1,
1.289716, 0.0437111, 0.5962312, 1, 1, 1, 1, 1,
1.295624, 0.06915575, 2.43482, 1, 1, 1, 1, 1,
1.296116, 1.098461, -0.13921, 1, 1, 1, 1, 1,
1.301111, -0.1651536, 0.7543438, 1, 1, 1, 1, 1,
1.303341, -0.4066843, 1.369825, 1, 1, 1, 1, 1,
1.305058, -1.43631, 3.20929, 1, 1, 1, 1, 1,
1.31792, 1.864776, 2.251033, 1, 1, 1, 1, 1,
1.319588, -0.2200732, 1.3369, 1, 1, 1, 1, 1,
1.322846, -0.7245417, 3.702158, 1, 1, 1, 1, 1,
1.332944, -0.4224894, 4.03737, 1, 1, 1, 1, 1,
1.345577, -0.2657824, 2.51813, 1, 1, 1, 1, 1,
1.352458, -0.4630931, 3.274429, 1, 1, 1, 1, 1,
1.357229, -0.7966806, 2.4738, 1, 1, 1, 1, 1,
1.359831, -1.462275, 1.492474, 0, 0, 1, 1, 1,
1.366195, -0.8560929, 1.352362, 1, 0, 0, 1, 1,
1.381029, -1.015801, 1.909964, 1, 0, 0, 1, 1,
1.383627, 0.9177285, 0.5416113, 1, 0, 0, 1, 1,
1.391867, 0.1633551, 2.526203, 1, 0, 0, 1, 1,
1.399398, 1.016602, 0.003647608, 1, 0, 0, 1, 1,
1.400786, -0.08375392, 1.680218, 0, 0, 0, 1, 1,
1.406754, -0.3649842, 1.360506, 0, 0, 0, 1, 1,
1.408118, 0.5659699, -0.009992321, 0, 0, 0, 1, 1,
1.409294, 0.3247905, 1.035078, 0, 0, 0, 1, 1,
1.420866, 0.4260959, 2.022979, 0, 0, 0, 1, 1,
1.42617, 0.7137416, 2.171536, 0, 0, 0, 1, 1,
1.427606, 0.1386468, 1.054465, 0, 0, 0, 1, 1,
1.428399, -0.1111125, 0.1698631, 1, 1, 1, 1, 1,
1.443626, -1.102703, 1.262087, 1, 1, 1, 1, 1,
1.456043, 0.7682561, 0.6179201, 1, 1, 1, 1, 1,
1.458515, 2.199286, 1.905359, 1, 1, 1, 1, 1,
1.472926, 0.2727236, 0.7229837, 1, 1, 1, 1, 1,
1.479154, -0.1379626, 1.459052, 1, 1, 1, 1, 1,
1.491973, 0.3843613, 3.267458, 1, 1, 1, 1, 1,
1.492565, 0.6096757, 2.688518, 1, 1, 1, 1, 1,
1.496095, -0.1521738, 1.35367, 1, 1, 1, 1, 1,
1.501248, 0.380116, 1.270285, 1, 1, 1, 1, 1,
1.506552, 0.7714857, -0.479633, 1, 1, 1, 1, 1,
1.512293, 0.3149201, 0.7762766, 1, 1, 1, 1, 1,
1.518273, -0.08415172, 1.511999, 1, 1, 1, 1, 1,
1.529328, -0.2460754, -0.05377988, 1, 1, 1, 1, 1,
1.530591, 0.6345383, -0.5318452, 1, 1, 1, 1, 1,
1.546028, -0.4390495, 1.328429, 0, 0, 1, 1, 1,
1.549786, -0.9957339, 3.269878, 1, 0, 0, 1, 1,
1.558542, 0.4531285, -0.01046858, 1, 0, 0, 1, 1,
1.56724, -0.2186353, 0.8198607, 1, 0, 0, 1, 1,
1.593475, 0.2805986, 1.09832, 1, 0, 0, 1, 1,
1.609558, -0.0006398992, 1.390767, 1, 0, 0, 1, 1,
1.612036, 0.3741334, 1.01388, 0, 0, 0, 1, 1,
1.612585, 1.108464, -0.436752, 0, 0, 0, 1, 1,
1.62277, -1.115393, 3.169515, 0, 0, 0, 1, 1,
1.625277, -0.1749443, 1.897379, 0, 0, 0, 1, 1,
1.628681, 0.8107048, 2.551625, 0, 0, 0, 1, 1,
1.661059, 0.2315484, 1.270993, 0, 0, 0, 1, 1,
1.682314, 1.095594, 1.584824, 0, 0, 0, 1, 1,
1.683467, -0.5172766, 1.222379, 1, 1, 1, 1, 1,
1.685106, 0.133235, 1.513734, 1, 1, 1, 1, 1,
1.702735, -2.243383, 2.083179, 1, 1, 1, 1, 1,
1.71202, -0.6786029, 2.812337, 1, 1, 1, 1, 1,
1.721153, 1.192046, 1.973791, 1, 1, 1, 1, 1,
1.729139, -0.5085101, 2.466111, 1, 1, 1, 1, 1,
1.748902, 0.701328, 1.020329, 1, 1, 1, 1, 1,
1.75799, -0.1534996, 0.5476816, 1, 1, 1, 1, 1,
1.759249, -0.8122537, 0.5840322, 1, 1, 1, 1, 1,
1.765296, -1.03656, 2.508595, 1, 1, 1, 1, 1,
1.768969, -0.1516496, 2.555156, 1, 1, 1, 1, 1,
1.779516, -1.097164, 2.472413, 1, 1, 1, 1, 1,
1.791234, -0.6882948, 1.948371, 1, 1, 1, 1, 1,
1.869088, 0.1084018, 0.9754793, 1, 1, 1, 1, 1,
1.895058, -0.2160069, 0.6292821, 1, 1, 1, 1, 1,
1.950507, -1.371161, 2.405743, 0, 0, 1, 1, 1,
1.969284, 0.7404803, 1.618455, 1, 0, 0, 1, 1,
1.997112, 0.3555912, 2.300477, 1, 0, 0, 1, 1,
2.023449, -0.6270139, 2.476169, 1, 0, 0, 1, 1,
2.057332, -2.033303, 3.819673, 1, 0, 0, 1, 1,
2.078166, -1.64076, 2.583486, 1, 0, 0, 1, 1,
2.078788, -0.210373, 1.798812, 0, 0, 0, 1, 1,
2.160786, -0.09106037, 0.3481522, 0, 0, 0, 1, 1,
2.169466, -0.8877923, 2.173859, 0, 0, 0, 1, 1,
2.268898, 0.8760862, 1.53126, 0, 0, 0, 1, 1,
2.305978, 0.3216626, 2.249073, 0, 0, 0, 1, 1,
2.312896, 0.9260686, 1.021785, 0, 0, 0, 1, 1,
2.397323, -0.618578, 2.184565, 0, 0, 0, 1, 1,
2.398949, 0.4448457, 1.043603, 1, 1, 1, 1, 1,
2.406423, -0.09205008, 3.447154, 1, 1, 1, 1, 1,
2.461262, -1.269068, 2.283607, 1, 1, 1, 1, 1,
2.631329, 0.6413165, 3.67715, 1, 1, 1, 1, 1,
2.823539, -0.3406593, 2.446783, 1, 1, 1, 1, 1,
2.859687, -0.06319232, 1.214303, 1, 1, 1, 1, 1,
3.295682, 2.044898, 1.288449, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.070278;
var distance = 31.85896;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.3834976, -0.1746974, 0.2912543 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.85896);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
