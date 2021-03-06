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
-3.462971, -0.2028847, -1.41842, 1, 0, 0, 1,
-3.437556, 1.053011, -1.953085, 1, 0.007843138, 0, 1,
-2.750514, -0.333165, -3.012661, 1, 0.01176471, 0, 1,
-2.7441, 0.08197921, -1.425095, 1, 0.01960784, 0, 1,
-2.627456, 0.0252876, -0.8566087, 1, 0.02352941, 0, 1,
-2.548795, -0.8379891, -1.73686, 1, 0.03137255, 0, 1,
-2.537897, -1.455721, -1.932423, 1, 0.03529412, 0, 1,
-2.506371, -1.266312, -0.6110424, 1, 0.04313726, 0, 1,
-2.366977, 1.158094, -2.338329, 1, 0.04705882, 0, 1,
-2.351505, 0.197357, -3.011171, 1, 0.05490196, 0, 1,
-2.339505, -1.150689, -2.594507, 1, 0.05882353, 0, 1,
-2.319691, 1.610618, -1.834935, 1, 0.06666667, 0, 1,
-2.293751, 0.2429008, -0.9473799, 1, 0.07058824, 0, 1,
-2.287686, -0.3424603, -1.425177, 1, 0.07843138, 0, 1,
-2.270902, -0.1743808, -0.7119692, 1, 0.08235294, 0, 1,
-2.237734, 0.8472826, 0.2681807, 1, 0.09019608, 0, 1,
-2.22058, 1.425598, -2.584289, 1, 0.09411765, 0, 1,
-2.207978, -0.3662768, -1.736922, 1, 0.1019608, 0, 1,
-2.197663, -0.001701109, -0.5970333, 1, 0.1098039, 0, 1,
-2.186207, -0.5124379, 0.1893525, 1, 0.1137255, 0, 1,
-2.180952, -0.3646434, -1.3107, 1, 0.1215686, 0, 1,
-2.108606, 0.5799888, -0.8546944, 1, 0.1254902, 0, 1,
-2.095755, -1.844872, -5.659548, 1, 0.1333333, 0, 1,
-2.047658, 0.2260804, -2.590132, 1, 0.1372549, 0, 1,
-2.041276, 1.295708, -0.658858, 1, 0.145098, 0, 1,
-2.034017, -0.2878383, -2.463859, 1, 0.1490196, 0, 1,
-2.029886, -0.3005931, -2.008836, 1, 0.1568628, 0, 1,
-2.027607, -0.2729836, -2.663383, 1, 0.1607843, 0, 1,
-2.020444, 0.5521966, 1.05769, 1, 0.1686275, 0, 1,
-2.010637, -0.7227319, -2.675156, 1, 0.172549, 0, 1,
-1.999719, -0.0537864, -1.69073, 1, 0.1803922, 0, 1,
-1.992104, 1.844878, 0.2342389, 1, 0.1843137, 0, 1,
-1.962468, 0.6642709, -2.207441, 1, 0.1921569, 0, 1,
-1.899763, -0.4234723, -1.695188, 1, 0.1960784, 0, 1,
-1.823747, -1.483719, -2.506239, 1, 0.2039216, 0, 1,
-1.763914, 1.980776, -1.121098, 1, 0.2117647, 0, 1,
-1.756685, 0.5971554, -0.4269038, 1, 0.2156863, 0, 1,
-1.744976, -0.5426623, -1.044865, 1, 0.2235294, 0, 1,
-1.740753, -1.556838, -2.995279, 1, 0.227451, 0, 1,
-1.730732, -1.385774, -2.148113, 1, 0.2352941, 0, 1,
-1.729169, 1.142054, -1.819022, 1, 0.2392157, 0, 1,
-1.725871, -0.7657237, -3.337812, 1, 0.2470588, 0, 1,
-1.725545, 1.567707, 0.1364704, 1, 0.2509804, 0, 1,
-1.680995, -0.5407361, -1.765521, 1, 0.2588235, 0, 1,
-1.646787, -0.1217292, -2.235271, 1, 0.2627451, 0, 1,
-1.645553, 0.5595554, -1.79707, 1, 0.2705882, 0, 1,
-1.633538, -0.8176793, -2.563347, 1, 0.2745098, 0, 1,
-1.620239, 0.5254378, -2.850586, 1, 0.282353, 0, 1,
-1.595459, 0.9482771, -1.891585, 1, 0.2862745, 0, 1,
-1.588991, 1.594291, -1.972611, 1, 0.2941177, 0, 1,
-1.562238, -0.1472134, -1.638479, 1, 0.3019608, 0, 1,
-1.555807, -0.09729806, -3.667811, 1, 0.3058824, 0, 1,
-1.552121, -0.537026, -0.9070551, 1, 0.3137255, 0, 1,
-1.536929, 1.436612, -0.944073, 1, 0.3176471, 0, 1,
-1.533803, -0.4475343, -1.846574, 1, 0.3254902, 0, 1,
-1.530135, -0.7329398, -2.818585, 1, 0.3294118, 0, 1,
-1.51236, 0.4714446, -1.49202, 1, 0.3372549, 0, 1,
-1.503065, -0.566924, -0.4206414, 1, 0.3411765, 0, 1,
-1.4923, -1.093504, -0.854481, 1, 0.3490196, 0, 1,
-1.490137, 0.7616063, -2.641765, 1, 0.3529412, 0, 1,
-1.470276, 0.856689, -0.4045066, 1, 0.3607843, 0, 1,
-1.451458, 0.08021332, 0.7362849, 1, 0.3647059, 0, 1,
-1.448788, -1.550334, -0.7101357, 1, 0.372549, 0, 1,
-1.441584, -2.18066, -4.149134, 1, 0.3764706, 0, 1,
-1.438329, 0.1370257, -2.255468, 1, 0.3843137, 0, 1,
-1.433362, -0.5878134, -0.5088989, 1, 0.3882353, 0, 1,
-1.428441, 0.254785, -0.6864228, 1, 0.3960784, 0, 1,
-1.427968, 0.2172466, -0.3474461, 1, 0.4039216, 0, 1,
-1.422874, 0.8013341, -2.353116, 1, 0.4078431, 0, 1,
-1.379252, 0.3429701, -1.106091, 1, 0.4156863, 0, 1,
-1.378957, -2.476731, -0.5956283, 1, 0.4196078, 0, 1,
-1.374968, -0.8178928, -3.037182, 1, 0.427451, 0, 1,
-1.372107, -0.9012078, -1.700031, 1, 0.4313726, 0, 1,
-1.34478, 0.233523, -1.93227, 1, 0.4392157, 0, 1,
-1.344465, -1.060251, -2.312602, 1, 0.4431373, 0, 1,
-1.320088, 0.09394652, -3.365661, 1, 0.4509804, 0, 1,
-1.310193, 0.9348991, -0.9916579, 1, 0.454902, 0, 1,
-1.30839, 0.8604882, -0.8692864, 1, 0.4627451, 0, 1,
-1.30794, 1.198042, -2.747175, 1, 0.4666667, 0, 1,
-1.304912, 2.222172, 1.956685, 1, 0.4745098, 0, 1,
-1.294448, 0.09849482, -1.75714, 1, 0.4784314, 0, 1,
-1.288965, 0.064569, -1.11874, 1, 0.4862745, 0, 1,
-1.27292, 1.725195, 0.3275327, 1, 0.4901961, 0, 1,
-1.26896, 0.8972421, -1.167825, 1, 0.4980392, 0, 1,
-1.259534, 0.6182605, -0.9336439, 1, 0.5058824, 0, 1,
-1.25711, -1.282263, -2.344486, 1, 0.509804, 0, 1,
-1.226369, 0.3227572, -1.102181, 1, 0.5176471, 0, 1,
-1.223977, 0.5590327, -0.424874, 1, 0.5215687, 0, 1,
-1.223795, 0.7530801, -1.488461, 1, 0.5294118, 0, 1,
-1.206808, 0.2954556, -3.897672, 1, 0.5333334, 0, 1,
-1.204422, -1.037353, -1.719771, 1, 0.5411765, 0, 1,
-1.201819, -0.5054493, -2.001658, 1, 0.5450981, 0, 1,
-1.20121, 0.3879799, -2.297418, 1, 0.5529412, 0, 1,
-1.198567, 0.3373334, -1.362485, 1, 0.5568628, 0, 1,
-1.195465, -0.6577192, -1.766562, 1, 0.5647059, 0, 1,
-1.190157, -0.733323, -0.7825301, 1, 0.5686275, 0, 1,
-1.183923, -0.4827936, -0.735987, 1, 0.5764706, 0, 1,
-1.181343, -0.7918966, -2.912385, 1, 0.5803922, 0, 1,
-1.173038, -1.48722, -3.633179, 1, 0.5882353, 0, 1,
-1.16972, -1.118789, -3.321998, 1, 0.5921569, 0, 1,
-1.162013, -0.2935442, -3.409146, 1, 0.6, 0, 1,
-1.160317, -0.9800079, -1.388069, 1, 0.6078432, 0, 1,
-1.152926, -1.470261, -2.029472, 1, 0.6117647, 0, 1,
-1.147147, 0.1440349, -2.026099, 1, 0.6196079, 0, 1,
-1.137592, -0.08262806, -2.107208, 1, 0.6235294, 0, 1,
-1.131055, -0.4270453, -0.6891348, 1, 0.6313726, 0, 1,
-1.124961, 0.6112266, -0.6269468, 1, 0.6352941, 0, 1,
-1.124872, -1.328241, -3.868362, 1, 0.6431373, 0, 1,
-1.12383, 0.1351079, -1.462741, 1, 0.6470588, 0, 1,
-1.120809, -1.862831, -1.65212, 1, 0.654902, 0, 1,
-1.115135, 0.09425823, -0.9769309, 1, 0.6588235, 0, 1,
-1.112468, -0.8302353, -2.571627, 1, 0.6666667, 0, 1,
-1.110296, 1.705836, 0.8603257, 1, 0.6705883, 0, 1,
-1.098172, 0.8255178, -0.803197, 1, 0.6784314, 0, 1,
-1.096087, 0.591422, -1.717403, 1, 0.682353, 0, 1,
-1.090294, -0.2048688, -1.147375, 1, 0.6901961, 0, 1,
-1.080988, -1.207336, -3.072778, 1, 0.6941177, 0, 1,
-1.080292, 0.415327, -1.135093, 1, 0.7019608, 0, 1,
-1.078055, -0.6281756, -2.037683, 1, 0.7098039, 0, 1,
-1.07795, 0.1178507, -3.683133, 1, 0.7137255, 0, 1,
-1.075892, -1.013923, -2.785303, 1, 0.7215686, 0, 1,
-1.072906, -1.917188, -1.563371, 1, 0.7254902, 0, 1,
-1.067587, -0.3933586, -1.441248, 1, 0.7333333, 0, 1,
-1.061172, 1.546831, -0.2205321, 1, 0.7372549, 0, 1,
-1.059085, 0.1787354, -2.484846, 1, 0.7450981, 0, 1,
-1.056916, 0.782208, -0.7093309, 1, 0.7490196, 0, 1,
-1.05411, 1.422208, 1.032739, 1, 0.7568628, 0, 1,
-1.053891, 0.4772678, 0.06604356, 1, 0.7607843, 0, 1,
-1.050302, -1.250331, -3.536359, 1, 0.7686275, 0, 1,
-1.048614, 1.312909, -2.16385, 1, 0.772549, 0, 1,
-1.047742, -1.025975, -3.038248, 1, 0.7803922, 0, 1,
-1.04597, 0.9806926, -0.9809418, 1, 0.7843137, 0, 1,
-1.045319, 1.00644, -0.5756109, 1, 0.7921569, 0, 1,
-1.043553, -0.5080879, -2.477207, 1, 0.7960784, 0, 1,
-1.039848, -0.8882294, -1.523782, 1, 0.8039216, 0, 1,
-1.036001, -1.645418, -3.071123, 1, 0.8117647, 0, 1,
-1.033862, 0.1007921, 0.0479505, 1, 0.8156863, 0, 1,
-1.032359, 0.1249285, -1.07367, 1, 0.8235294, 0, 1,
-1.028439, 0.5893393, 1.565936, 1, 0.827451, 0, 1,
-1.021831, 0.9042669, 0.07245731, 1, 0.8352941, 0, 1,
-1.012717, 0.1909067, -1.679395, 1, 0.8392157, 0, 1,
-1.000583, -1.877554, -3.265724, 1, 0.8470588, 0, 1,
-0.9954022, 0.9366136, -2.685042, 1, 0.8509804, 0, 1,
-0.9938512, 0.191849, -1.995409, 1, 0.8588235, 0, 1,
-0.9914817, 0.3144644, 0.5305953, 1, 0.8627451, 0, 1,
-0.9888575, -0.5590437, -2.132302, 1, 0.8705882, 0, 1,
-0.9858316, 0.6904191, -0.5479251, 1, 0.8745098, 0, 1,
-0.9787466, 0.648657, -1.074782, 1, 0.8823529, 0, 1,
-0.9662859, -0.3272888, -1.085456, 1, 0.8862745, 0, 1,
-0.9612721, 1.346968, -0.0736285, 1, 0.8941177, 0, 1,
-0.9585177, -0.8748971, -2.950308, 1, 0.8980392, 0, 1,
-0.9525941, 1.29831, -1.631554, 1, 0.9058824, 0, 1,
-0.9495023, 0.5965607, -2.145893, 1, 0.9137255, 0, 1,
-0.9432847, 0.9072075, -1.117471, 1, 0.9176471, 0, 1,
-0.9422126, 2.053133, -2.195434, 1, 0.9254902, 0, 1,
-0.9365361, -1.223477, -3.42236, 1, 0.9294118, 0, 1,
-0.9329176, 0.6241946, -0.9579349, 1, 0.9372549, 0, 1,
-0.9297765, -0.08869427, -0.6589581, 1, 0.9411765, 0, 1,
-0.926143, -0.697818, -2.36346, 1, 0.9490196, 0, 1,
-0.9253621, -1.313845, -4.452114, 1, 0.9529412, 0, 1,
-0.9241008, -1.335413, -0.2224772, 1, 0.9607843, 0, 1,
-0.9238024, 0.7033049, -1.462969, 1, 0.9647059, 0, 1,
-0.9199463, 0.873272, -1.830301, 1, 0.972549, 0, 1,
-0.9186832, -0.109081, -2.259628, 1, 0.9764706, 0, 1,
-0.9186106, 0.1162266, 0.01234352, 1, 0.9843137, 0, 1,
-0.9080384, -1.009703, 0.4064817, 1, 0.9882353, 0, 1,
-0.9070738, 0.2236241, -2.075927, 1, 0.9960784, 0, 1,
-0.9026604, 0.579424, -1.238036, 0.9960784, 1, 0, 1,
-0.8997623, 0.8088439, -1.306611, 0.9921569, 1, 0, 1,
-0.8979086, 0.7883576, -1.623579, 0.9843137, 1, 0, 1,
-0.8976877, -1.393632, -1.742719, 0.9803922, 1, 0, 1,
-0.8830311, -1.482618, -1.974189, 0.972549, 1, 0, 1,
-0.8815085, 0.3627465, -2.385293, 0.9686275, 1, 0, 1,
-0.8780156, -1.173089, -1.510158, 0.9607843, 1, 0, 1,
-0.8723137, -0.4792304, -2.204594, 0.9568627, 1, 0, 1,
-0.870665, 2.912062, -0.4902782, 0.9490196, 1, 0, 1,
-0.8465639, -2.200594, -2.437286, 0.945098, 1, 0, 1,
-0.8461851, -1.259841, -2.523326, 0.9372549, 1, 0, 1,
-0.8451931, 0.8081452, -2.255312, 0.9333333, 1, 0, 1,
-0.8445129, -0.006085902, -2.069256, 0.9254902, 1, 0, 1,
-0.8415669, 0.3891431, -1.120254, 0.9215686, 1, 0, 1,
-0.8402249, 0.5141492, -2.585155, 0.9137255, 1, 0, 1,
-0.8351898, 1.828633, 0.3497005, 0.9098039, 1, 0, 1,
-0.8328731, -0.3919078, 0.03707116, 0.9019608, 1, 0, 1,
-0.8301646, -1.196759, -2.129248, 0.8941177, 1, 0, 1,
-0.8299856, -1.771771, -1.418574, 0.8901961, 1, 0, 1,
-0.8281241, -0.8311834, -1.971412, 0.8823529, 1, 0, 1,
-0.8248692, 0.5951297, -1.061224, 0.8784314, 1, 0, 1,
-0.8237953, 0.2644268, -0.2163821, 0.8705882, 1, 0, 1,
-0.8177189, 1.090623, -1.768424, 0.8666667, 1, 0, 1,
-0.816374, 0.5432152, -0.3076901, 0.8588235, 1, 0, 1,
-0.8123641, -1.442122, -3.379057, 0.854902, 1, 0, 1,
-0.809047, -1.816369, -2.906211, 0.8470588, 1, 0, 1,
-0.8046843, 0.04038159, -1.761997, 0.8431373, 1, 0, 1,
-0.8043952, 0.1342781, -1.487165, 0.8352941, 1, 0, 1,
-0.8030871, 0.3903191, 0.1875492, 0.8313726, 1, 0, 1,
-0.8013961, 0.1806529, -1.981643, 0.8235294, 1, 0, 1,
-0.7983473, -0.7165473, -1.434747, 0.8196079, 1, 0, 1,
-0.7961309, -1.438913, -4.130731, 0.8117647, 1, 0, 1,
-0.794171, -1.368544, -1.806323, 0.8078431, 1, 0, 1,
-0.7882335, 0.4393072, -0.8532711, 0.8, 1, 0, 1,
-0.7847531, -0.2265734, -1.767843, 0.7921569, 1, 0, 1,
-0.7801587, -0.5658516, -4.049063, 0.7882353, 1, 0, 1,
-0.7785995, -0.6491778, -1.086738, 0.7803922, 1, 0, 1,
-0.7766427, -0.4005336, -1.324302, 0.7764706, 1, 0, 1,
-0.7718402, -0.2075876, -2.635884, 0.7686275, 1, 0, 1,
-0.7713029, -0.4154262, -2.89146, 0.7647059, 1, 0, 1,
-0.7607024, 2.631906, -0.1662453, 0.7568628, 1, 0, 1,
-0.7482172, -0.2821679, -0.7472522, 0.7529412, 1, 0, 1,
-0.7475145, -0.04928238, -1.505079, 0.7450981, 1, 0, 1,
-0.746042, -0.6545545, -1.546051, 0.7411765, 1, 0, 1,
-0.7403899, -1.007566, -2.540755, 0.7333333, 1, 0, 1,
-0.7373292, -0.4827522, -1.9008, 0.7294118, 1, 0, 1,
-0.7337328, 1.145002, -2.314116, 0.7215686, 1, 0, 1,
-0.7328909, 0.9727391, -0.8186413, 0.7176471, 1, 0, 1,
-0.7263295, -0.1531897, -3.647828, 0.7098039, 1, 0, 1,
-0.7239928, -0.6916553, -1.963188, 0.7058824, 1, 0, 1,
-0.7221767, 0.2601382, -1.812709, 0.6980392, 1, 0, 1,
-0.715201, -0.02270206, -1.168776, 0.6901961, 1, 0, 1,
-0.7128253, 1.693582, -0.9590006, 0.6862745, 1, 0, 1,
-0.7061932, 0.5287274, -1.238223, 0.6784314, 1, 0, 1,
-0.7053033, -0.211692, -1.529075, 0.6745098, 1, 0, 1,
-0.7039727, 0.680104, -2.52371, 0.6666667, 1, 0, 1,
-0.7011704, -0.9496421, -1.876516, 0.6627451, 1, 0, 1,
-0.6994742, -0.8822727, -4.496936, 0.654902, 1, 0, 1,
-0.6990632, -0.3507068, -1.305315, 0.6509804, 1, 0, 1,
-0.6981975, -1.034962, -3.431885, 0.6431373, 1, 0, 1,
-0.6961342, -0.2718138, -2.055239, 0.6392157, 1, 0, 1,
-0.688587, 1.617095, -1.069535, 0.6313726, 1, 0, 1,
-0.6852387, 0.5433474, 0.4717242, 0.627451, 1, 0, 1,
-0.6803353, -1.674516, -2.941765, 0.6196079, 1, 0, 1,
-0.668012, -0.7192601, -1.768787, 0.6156863, 1, 0, 1,
-0.6672685, 1.266958, -1.944607, 0.6078432, 1, 0, 1,
-0.6662078, -0.1479383, 0.4454153, 0.6039216, 1, 0, 1,
-0.6658772, 0.3429129, -0.9268698, 0.5960785, 1, 0, 1,
-0.6652833, 0.02591783, -1.110347, 0.5882353, 1, 0, 1,
-0.6598561, -0.3179525, -3.34274, 0.5843138, 1, 0, 1,
-0.6590721, -0.4853745, -2.079837, 0.5764706, 1, 0, 1,
-0.6561607, 0.4951533, -3.431707, 0.572549, 1, 0, 1,
-0.6536469, -0.5462486, -2.962953, 0.5647059, 1, 0, 1,
-0.653478, 0.5067616, -0.0810889, 0.5607843, 1, 0, 1,
-0.6519977, 0.2621997, -1.248614, 0.5529412, 1, 0, 1,
-0.6503754, -0.4696291, -2.262967, 0.5490196, 1, 0, 1,
-0.6490548, -0.303575, -2.12781, 0.5411765, 1, 0, 1,
-0.6422148, 0.03206269, 0.2623491, 0.5372549, 1, 0, 1,
-0.6397359, -2.056467, -1.095864, 0.5294118, 1, 0, 1,
-0.638846, 0.882705, -3.200751, 0.5254902, 1, 0, 1,
-0.632271, -1.236769, -2.491976, 0.5176471, 1, 0, 1,
-0.6234775, 0.5268495, -1.721271, 0.5137255, 1, 0, 1,
-0.6221988, -1.623355, -1.920698, 0.5058824, 1, 0, 1,
-0.6214318, 0.7973478, 0.8806714, 0.5019608, 1, 0, 1,
-0.617616, -1.164248, -2.390713, 0.4941176, 1, 0, 1,
-0.6148048, -0.4004571, -1.837691, 0.4862745, 1, 0, 1,
-0.6091751, 0.5649891, -0.7135976, 0.4823529, 1, 0, 1,
-0.6068156, 1.04622, -0.8014621, 0.4745098, 1, 0, 1,
-0.6066577, 0.1752056, 0.2344814, 0.4705882, 1, 0, 1,
-0.6064092, -1.454395, -2.369053, 0.4627451, 1, 0, 1,
-0.6059899, 0.08693909, -1.80357, 0.4588235, 1, 0, 1,
-0.6009387, -1.994751, -3.428353, 0.4509804, 1, 0, 1,
-0.6008853, 1.129196, -0.8591233, 0.4470588, 1, 0, 1,
-0.5983543, -0.2407996, -1.300099, 0.4392157, 1, 0, 1,
-0.5980877, -1.966191, -3.59868, 0.4352941, 1, 0, 1,
-0.5881963, -0.1935253, -1.516009, 0.427451, 1, 0, 1,
-0.5804007, -1.890182, -4.18388, 0.4235294, 1, 0, 1,
-0.5777484, -0.04245214, -2.040295, 0.4156863, 1, 0, 1,
-0.5697365, 0.0001891644, -1.206244, 0.4117647, 1, 0, 1,
-0.5641787, -0.8403258, -4.502297, 0.4039216, 1, 0, 1,
-0.5638603, 0.3198603, -1.1637, 0.3960784, 1, 0, 1,
-0.5606418, -1.117291, -1.080438, 0.3921569, 1, 0, 1,
-0.5552762, -0.8127034, -3.749433, 0.3843137, 1, 0, 1,
-0.5512719, 0.9266515, -1.687949, 0.3803922, 1, 0, 1,
-0.5488314, 0.004368858, -0.7591004, 0.372549, 1, 0, 1,
-0.5480635, -1.169107, -3.315256, 0.3686275, 1, 0, 1,
-0.5479925, -1.044167, -4.568863, 0.3607843, 1, 0, 1,
-0.5445558, 1.37842, 0.90592, 0.3568628, 1, 0, 1,
-0.5392009, 0.8672639, 0.3266927, 0.3490196, 1, 0, 1,
-0.5360011, 0.2142902, -0.2553703, 0.345098, 1, 0, 1,
-0.5338327, -1.569158, -3.686633, 0.3372549, 1, 0, 1,
-0.5334233, 0.6379987, -0.1538713, 0.3333333, 1, 0, 1,
-0.5331199, -0.9633385, -2.251374, 0.3254902, 1, 0, 1,
-0.531094, -0.4162374, -1.543723, 0.3215686, 1, 0, 1,
-0.528029, -0.9063016, -2.031159, 0.3137255, 1, 0, 1,
-0.5272148, -0.2309777, -1.632239, 0.3098039, 1, 0, 1,
-0.5247361, 1.235048, 0.3665827, 0.3019608, 1, 0, 1,
-0.5239372, -0.4207696, -2.79683, 0.2941177, 1, 0, 1,
-0.5195934, -0.1678432, -3.683752, 0.2901961, 1, 0, 1,
-0.5180597, 0.8629568, 0.08276574, 0.282353, 1, 0, 1,
-0.5178115, 1.240016, -1.253526, 0.2784314, 1, 0, 1,
-0.5146528, 0.03799615, -0.7546381, 0.2705882, 1, 0, 1,
-0.5101825, -1.385124, -1.818871, 0.2666667, 1, 0, 1,
-0.5098147, 0.9854516, -1.003742, 0.2588235, 1, 0, 1,
-0.5085046, 0.7447928, 0.06001108, 0.254902, 1, 0, 1,
-0.5067984, 0.3640749, -0.3595971, 0.2470588, 1, 0, 1,
-0.5027313, 1.805186, -0.9487984, 0.2431373, 1, 0, 1,
-0.5025931, -0.8398844, -2.273803, 0.2352941, 1, 0, 1,
-0.4861166, -0.682932, -3.186921, 0.2313726, 1, 0, 1,
-0.4824504, -1.619506, -3.431103, 0.2235294, 1, 0, 1,
-0.4802263, 0.02651892, -1.968657, 0.2196078, 1, 0, 1,
-0.4751721, -1.257373, -2.308569, 0.2117647, 1, 0, 1,
-0.4731874, 1.150174, 0.04720155, 0.2078431, 1, 0, 1,
-0.4723168, -0.635736, -1.854219, 0.2, 1, 0, 1,
-0.4707474, 0.7391074, -1.730929, 0.1921569, 1, 0, 1,
-0.4676408, 0.7433962, -2.313354, 0.1882353, 1, 0, 1,
-0.4661185, -1.017961, -1.249743, 0.1803922, 1, 0, 1,
-0.4594053, 0.7920008, -0.6273663, 0.1764706, 1, 0, 1,
-0.4584323, 0.6855747, 0.4064985, 0.1686275, 1, 0, 1,
-0.4575447, 0.3042495, -0.9971409, 0.1647059, 1, 0, 1,
-0.4567207, 0.7491619, 0.2600708, 0.1568628, 1, 0, 1,
-0.4552194, -0.5500249, -1.657459, 0.1529412, 1, 0, 1,
-0.4539208, -0.6572227, -3.018488, 0.145098, 1, 0, 1,
-0.4524825, -0.2994225, -1.387393, 0.1411765, 1, 0, 1,
-0.4516659, 0.5013662, -1.143463, 0.1333333, 1, 0, 1,
-0.4505307, 0.9833344, -0.7958581, 0.1294118, 1, 0, 1,
-0.4449423, -0.6602723, -2.84931, 0.1215686, 1, 0, 1,
-0.4448603, 0.7969697, -0.9333685, 0.1176471, 1, 0, 1,
-0.4368434, -2.050624, -3.641999, 0.1098039, 1, 0, 1,
-0.4343888, 1.012661, -2.699949, 0.1058824, 1, 0, 1,
-0.4324029, -0.08164797, -2.056019, 0.09803922, 1, 0, 1,
-0.4318047, 1.210928, 0.4627071, 0.09019608, 1, 0, 1,
-0.4277169, -0.2292945, -0.9983913, 0.08627451, 1, 0, 1,
-0.4167096, 0.6817936, -1.915613, 0.07843138, 1, 0, 1,
-0.4151405, -1.133374, -2.826928, 0.07450981, 1, 0, 1,
-0.4129779, -0.9936896, -3.546475, 0.06666667, 1, 0, 1,
-0.411796, -0.3614472, -1.977422, 0.0627451, 1, 0, 1,
-0.4092247, 0.1784992, -0.2417791, 0.05490196, 1, 0, 1,
-0.4030325, -0.5697721, -3.473975, 0.05098039, 1, 0, 1,
-0.4029178, -1.511816, -3.594538, 0.04313726, 1, 0, 1,
-0.4029031, -0.4286094, -0.7582916, 0.03921569, 1, 0, 1,
-0.4018048, -0.5148069, -2.947874, 0.03137255, 1, 0, 1,
-0.3982816, 0.3856453, 0.06894561, 0.02745098, 1, 0, 1,
-0.3943779, -0.4155009, -2.799859, 0.01960784, 1, 0, 1,
-0.3934156, -1.100442, -3.622504, 0.01568628, 1, 0, 1,
-0.3883632, 0.1510913, -1.351978, 0.007843138, 1, 0, 1,
-0.3823118, 1.725004, -0.4263174, 0.003921569, 1, 0, 1,
-0.3822612, -0.7369802, -1.910956, 0, 1, 0.003921569, 1,
-0.3801337, 0.5353264, -2.15627, 0, 1, 0.01176471, 1,
-0.3797812, 0.588913, 0.4768554, 0, 1, 0.01568628, 1,
-0.3732471, 0.4865841, -0.08517382, 0, 1, 0.02352941, 1,
-0.3710993, 0.1080112, -0.4104421, 0, 1, 0.02745098, 1,
-0.3702113, 0.8047161, 0.2015712, 0, 1, 0.03529412, 1,
-0.367675, 0.03704027, -3.493231, 0, 1, 0.03921569, 1,
-0.3657875, -0.6677834, -2.049059, 0, 1, 0.04705882, 1,
-0.364684, -1.301285, -2.833554, 0, 1, 0.05098039, 1,
-0.3631248, -1.725157, -3.817929, 0, 1, 0.05882353, 1,
-0.3570483, 0.1016428, -2.524977, 0, 1, 0.0627451, 1,
-0.3483501, 0.3168615, -0.2434292, 0, 1, 0.07058824, 1,
-0.3449423, 0.7901797, -0.5761379, 0, 1, 0.07450981, 1,
-0.3439026, 1.269212, -1.400108, 0, 1, 0.08235294, 1,
-0.3427594, -0.3206746, -3.758242, 0, 1, 0.08627451, 1,
-0.3425645, -0.1709402, -2.473734, 0, 1, 0.09411765, 1,
-0.3394088, 0.5324552, 0.4282444, 0, 1, 0.1019608, 1,
-0.3331515, -1.855029, -2.461614, 0, 1, 0.1058824, 1,
-0.3312574, 0.811223, -0.2570985, 0, 1, 0.1137255, 1,
-0.3288965, -0.5901761, -3.442288, 0, 1, 0.1176471, 1,
-0.327916, 0.6294159, 0.3993511, 0, 1, 0.1254902, 1,
-0.3264151, -1.067868, -2.979763, 0, 1, 0.1294118, 1,
-0.3263073, -2.094656, -2.715897, 0, 1, 0.1372549, 1,
-0.3220265, 0.2025777, -0.1912844, 0, 1, 0.1411765, 1,
-0.3153709, 0.9584429, 0.8571949, 0, 1, 0.1490196, 1,
-0.3109613, 0.115406, -1.437251, 0, 1, 0.1529412, 1,
-0.3088508, 1.074916, -0.2625186, 0, 1, 0.1607843, 1,
-0.3052564, -0.3072947, -0.9470735, 0, 1, 0.1647059, 1,
-0.3036655, 1.088416, -1.208499, 0, 1, 0.172549, 1,
-0.2969269, -2.565443, -3.831003, 0, 1, 0.1764706, 1,
-0.2945923, -0.1565934, -0.7137516, 0, 1, 0.1843137, 1,
-0.2921214, 1.691934, 0.06538241, 0, 1, 0.1882353, 1,
-0.2860406, -0.1508647, -2.34903, 0, 1, 0.1960784, 1,
-0.2795688, -0.01214991, -1.182418, 0, 1, 0.2039216, 1,
-0.2786666, 0.3032699, -1.520818, 0, 1, 0.2078431, 1,
-0.2782767, 0.2672385, 1.627729, 0, 1, 0.2156863, 1,
-0.272678, -2.75119, -4.610296, 0, 1, 0.2196078, 1,
-0.2719237, 0.9559245, 0.7580836, 0, 1, 0.227451, 1,
-0.2707953, 0.6295618, 1.0848, 0, 1, 0.2313726, 1,
-0.2662181, 1.587435, -1.225094, 0, 1, 0.2392157, 1,
-0.2613826, -1.29092, -2.291456, 0, 1, 0.2431373, 1,
-0.2604893, 0.3163315, -0.6142123, 0, 1, 0.2509804, 1,
-0.2599823, 1.446215, -1.938718, 0, 1, 0.254902, 1,
-0.2537233, 2.136881, -0.3428354, 0, 1, 0.2627451, 1,
-0.2520172, 0.4863763, -0.9377756, 0, 1, 0.2666667, 1,
-0.2519972, -1.644961, -3.800352, 0, 1, 0.2745098, 1,
-0.2514898, -1.531559, -2.483207, 0, 1, 0.2784314, 1,
-0.2512921, 0.8827842, 1.55051, 0, 1, 0.2862745, 1,
-0.247578, 0.6391435, -0.823598, 0, 1, 0.2901961, 1,
-0.2420717, 1.094224, 0.2645106, 0, 1, 0.2980392, 1,
-0.2404688, 0.7280388, -1.058732, 0, 1, 0.3058824, 1,
-0.2343905, -0.05049379, -1.495699, 0, 1, 0.3098039, 1,
-0.2340626, 0.6043911, 0.08238976, 0, 1, 0.3176471, 1,
-0.233734, 0.4470678, -0.8897071, 0, 1, 0.3215686, 1,
-0.2334888, -0.4424036, -1.676497, 0, 1, 0.3294118, 1,
-0.2328534, 1.89572, 0.9615878, 0, 1, 0.3333333, 1,
-0.2316151, 0.3929316, -0.7390729, 0, 1, 0.3411765, 1,
-0.224417, -0.07628347, -1.174385, 0, 1, 0.345098, 1,
-0.2242692, -0.06636167, -2.718011, 0, 1, 0.3529412, 1,
-0.2215322, 1.357166, -0.7423475, 0, 1, 0.3568628, 1,
-0.2195646, 0.4380848, -2.006455, 0, 1, 0.3647059, 1,
-0.2152595, 0.513522, -0.3370042, 0, 1, 0.3686275, 1,
-0.2150189, -1.213415, -2.473717, 0, 1, 0.3764706, 1,
-0.2149928, -1.215361, -2.897025, 0, 1, 0.3803922, 1,
-0.2098308, 0.5237329, -1.230768, 0, 1, 0.3882353, 1,
-0.2086599, -1.401522, -3.282624, 0, 1, 0.3921569, 1,
-0.2064828, 1.013529, 0.03107981, 0, 1, 0.4, 1,
-0.2025819, 1.265341, 0.3341651, 0, 1, 0.4078431, 1,
-0.1995755, -0.408123, -1.754696, 0, 1, 0.4117647, 1,
-0.1957039, -0.01160111, -2.265221, 0, 1, 0.4196078, 1,
-0.1952515, -1.678677, -2.659853, 0, 1, 0.4235294, 1,
-0.1904228, 0.5858554, -0.1152974, 0, 1, 0.4313726, 1,
-0.1884604, 0.6968439, 0.7091128, 0, 1, 0.4352941, 1,
-0.1883111, -0.7194957, -2.433516, 0, 1, 0.4431373, 1,
-0.1882865, -0.1145362, -2.519716, 0, 1, 0.4470588, 1,
-0.1882761, 1.786946, 0.6244653, 0, 1, 0.454902, 1,
-0.1857602, -0.4547703, -2.179608, 0, 1, 0.4588235, 1,
-0.1842635, -1.194194, -3.316158, 0, 1, 0.4666667, 1,
-0.1839768, -0.4942591, -3.326639, 0, 1, 0.4705882, 1,
-0.1835654, -0.4238884, -2.198275, 0, 1, 0.4784314, 1,
-0.1835632, -0.06975302, -1.587195, 0, 1, 0.4823529, 1,
-0.1801055, -0.8683672, -1.572639, 0, 1, 0.4901961, 1,
-0.1780045, -0.4282992, -3.038253, 0, 1, 0.4941176, 1,
-0.1773895, 0.1349338, 0.6066081, 0, 1, 0.5019608, 1,
-0.1749059, 0.1325462, -1.208352, 0, 1, 0.509804, 1,
-0.1736003, -0.238345, -1.929058, 0, 1, 0.5137255, 1,
-0.1718609, 0.968366, -0.8410022, 0, 1, 0.5215687, 1,
-0.1659651, -0.09016865, -4.597034, 0, 1, 0.5254902, 1,
-0.1630393, 1.404395, 0.7139543, 0, 1, 0.5333334, 1,
-0.1605826, 0.3585683, -0.8752263, 0, 1, 0.5372549, 1,
-0.1530292, 0.7183322, 1.454968, 0, 1, 0.5450981, 1,
-0.152422, -1.081664, -2.750584, 0, 1, 0.5490196, 1,
-0.1454282, 1.620858, 0.3474763, 0, 1, 0.5568628, 1,
-0.1448352, 0.1170452, -0.4827299, 0, 1, 0.5607843, 1,
-0.1423968, 0.4931251, 0.3122817, 0, 1, 0.5686275, 1,
-0.1401815, 0.9283527, 1.104977, 0, 1, 0.572549, 1,
-0.1331765, 1.724309, -0.9977436, 0, 1, 0.5803922, 1,
-0.1322839, -0.02783848, -2.221738, 0, 1, 0.5843138, 1,
-0.1290332, 1.001293, 0.06851029, 0, 1, 0.5921569, 1,
-0.1267866, -0.9031418, -2.797981, 0, 1, 0.5960785, 1,
-0.1227825, -2.077423, -4.007215, 0, 1, 0.6039216, 1,
-0.1204032, 1.815612, 1.357142, 0, 1, 0.6117647, 1,
-0.1143774, 1.745701, -0.8182226, 0, 1, 0.6156863, 1,
-0.1138781, 1.539155, 0.148391, 0, 1, 0.6235294, 1,
-0.1125825, -0.7039777, -2.057225, 0, 1, 0.627451, 1,
-0.1123314, -0.4188078, -1.533025, 0, 1, 0.6352941, 1,
-0.110625, -0.4803362, -3.018762, 0, 1, 0.6392157, 1,
-0.1103452, 0.5529062, -1.873301, 0, 1, 0.6470588, 1,
-0.1102306, -0.08071396, -3.181041, 0, 1, 0.6509804, 1,
-0.1076911, 0.05513173, -0.59411, 0, 1, 0.6588235, 1,
-0.1046135, 0.3689922, -1.510599, 0, 1, 0.6627451, 1,
-0.1041671, 1.521145, 0.2916521, 0, 1, 0.6705883, 1,
-0.1040446, -0.620509, -4.653244, 0, 1, 0.6745098, 1,
-0.1035901, 0.2859787, -0.02006128, 0, 1, 0.682353, 1,
-0.1031499, -0.9736217, -2.76099, 0, 1, 0.6862745, 1,
-0.1023785, -1.903118, -3.500982, 0, 1, 0.6941177, 1,
-0.1022746, 0.9969707, -0.5604126, 0, 1, 0.7019608, 1,
-0.09422575, -0.5111321, -2.725633, 0, 1, 0.7058824, 1,
-0.09408421, -0.5258672, -4.114524, 0, 1, 0.7137255, 1,
-0.09353033, 0.3618494, 1.071756, 0, 1, 0.7176471, 1,
-0.09195966, -0.8085161, -1.927261, 0, 1, 0.7254902, 1,
-0.09125575, -0.1954653, -2.630589, 0, 1, 0.7294118, 1,
-0.09073991, 0.4714561, 0.7445171, 0, 1, 0.7372549, 1,
-0.08523531, -0.8954557, -3.227393, 0, 1, 0.7411765, 1,
-0.08368969, -1.225365, -3.265518, 0, 1, 0.7490196, 1,
-0.07541267, -1.052636, -3.566016, 0, 1, 0.7529412, 1,
-0.06491397, -1.311957, -1.214778, 0, 1, 0.7607843, 1,
-0.06440134, 0.6980523, -0.55948, 0, 1, 0.7647059, 1,
-0.06309192, -0.8144328, -4.044167, 0, 1, 0.772549, 1,
-0.06119292, 1.593052, -1.028797, 0, 1, 0.7764706, 1,
-0.06042027, -0.7340748, -2.392422, 0, 1, 0.7843137, 1,
-0.0590058, -0.01131332, -1.696482, 0, 1, 0.7882353, 1,
-0.05858513, -1.202054, -3.049195, 0, 1, 0.7960784, 1,
-0.05747352, 1.527238, -0.195511, 0, 1, 0.8039216, 1,
-0.05426399, -0.1061927, -2.514031, 0, 1, 0.8078431, 1,
-0.05417028, 2.103326, -0.0863383, 0, 1, 0.8156863, 1,
-0.05257662, 0.8428996, 1.132362, 0, 1, 0.8196079, 1,
-0.05162593, -1.232388, -3.985423, 0, 1, 0.827451, 1,
-0.04798223, 0.01243623, -3.056403, 0, 1, 0.8313726, 1,
-0.04774935, -1.000547, -2.721318, 0, 1, 0.8392157, 1,
-0.04086872, 0.6609174, -1.21457, 0, 1, 0.8431373, 1,
-0.04009779, -0.7750355, -1.530128, 0, 1, 0.8509804, 1,
-0.03645073, -0.5482675, -2.411175, 0, 1, 0.854902, 1,
-0.03635339, 2.104665, -0.8903339, 0, 1, 0.8627451, 1,
-0.03416103, -2.353695, -2.294346, 0, 1, 0.8666667, 1,
-0.03256661, -0.3563875, -1.818282, 0, 1, 0.8745098, 1,
-0.0321846, -1.406515, -3.346623, 0, 1, 0.8784314, 1,
-0.03175187, -0.4827814, -4.044172, 0, 1, 0.8862745, 1,
-0.02659198, 0.0599051, -0.4437151, 0, 1, 0.8901961, 1,
-0.02226937, -0.007083997, -3.72079, 0, 1, 0.8980392, 1,
-0.0214511, -1.247175, -1.926145, 0, 1, 0.9058824, 1,
-0.01915355, -1.922255, -4.914536, 0, 1, 0.9098039, 1,
-0.01630416, -1.406815, -3.67692, 0, 1, 0.9176471, 1,
-0.01346875, -0.5514511, -2.777548, 0, 1, 0.9215686, 1,
-0.0110741, -0.2048013, -5.481037, 0, 1, 0.9294118, 1,
-0.01001555, 1.49496, 0.627329, 0, 1, 0.9333333, 1,
-0.008237211, 1.533547, 0.2264899, 0, 1, 0.9411765, 1,
-0.007655914, 0.6263209, 0.7743714, 0, 1, 0.945098, 1,
-0.006859073, -0.7743912, -3.043971, 0, 1, 0.9529412, 1,
-0.004627259, -0.2730174, -3.011368, 0, 1, 0.9568627, 1,
0.004037049, -0.9778677, 2.503102, 0, 1, 0.9647059, 1,
0.00460386, 1.274528, 0.01321965, 0, 1, 0.9686275, 1,
0.007834028, 0.8339791, 0.8190328, 0, 1, 0.9764706, 1,
0.009196522, -1.535843, 4.452403, 0, 1, 0.9803922, 1,
0.01039792, 0.5699408, -1.114163, 0, 1, 0.9882353, 1,
0.02759676, 0.4225725, 2.605837, 0, 1, 0.9921569, 1,
0.02786259, -1.034567, 3.176701, 0, 1, 1, 1,
0.02900328, -0.4601533, 4.091826, 0, 0.9921569, 1, 1,
0.03223778, 0.03239473, 0.6803506, 0, 0.9882353, 1, 1,
0.03481062, 0.2196492, 1.08135, 0, 0.9803922, 1, 1,
0.04329142, 0.3725949, 0.1027675, 0, 0.9764706, 1, 1,
0.04414294, 0.4453558, -1.348612, 0, 0.9686275, 1, 1,
0.04662937, 0.4547631, 0.05518384, 0, 0.9647059, 1, 1,
0.06168859, -1.280218, 3.773868, 0, 0.9568627, 1, 1,
0.06470533, 1.276201, 0.02184177, 0, 0.9529412, 1, 1,
0.06493047, -0.3354973, 4.777676, 0, 0.945098, 1, 1,
0.06690887, 0.03384553, 1.757848, 0, 0.9411765, 1, 1,
0.06806524, -1.545299, 5.168837, 0, 0.9333333, 1, 1,
0.06811887, 0.7860427, 0.459213, 0, 0.9294118, 1, 1,
0.07029402, 0.6362035, -0.2354535, 0, 0.9215686, 1, 1,
0.0748861, -1.044754, 2.750788, 0, 0.9176471, 1, 1,
0.08065085, -0.07645654, -0.3920702, 0, 0.9098039, 1, 1,
0.08425905, 0.1747451, 1.35467, 0, 0.9058824, 1, 1,
0.08563186, -0.2111935, 4.23405, 0, 0.8980392, 1, 1,
0.09293721, -0.2343235, 2.052815, 0, 0.8901961, 1, 1,
0.09551679, 0.5839805, -1.133082, 0, 0.8862745, 1, 1,
0.09830707, -1.035915, 3.428238, 0, 0.8784314, 1, 1,
0.0992315, 0.611349, 1.604913, 0, 0.8745098, 1, 1,
0.1056678, 0.2407783, -0.08305954, 0, 0.8666667, 1, 1,
0.1066772, 0.1943964, 1.340153, 0, 0.8627451, 1, 1,
0.1086117, 0.01302565, 0.8719289, 0, 0.854902, 1, 1,
0.1105214, 0.5192858, 0.08467891, 0, 0.8509804, 1, 1,
0.1119402, -0.9618953, 5.332135, 0, 0.8431373, 1, 1,
0.1188891, -0.01160702, 2.025182, 0, 0.8392157, 1, 1,
0.1305955, -0.6046519, 2.350539, 0, 0.8313726, 1, 1,
0.1323467, 1.683185, -1.418843, 0, 0.827451, 1, 1,
0.1415061, 0.05529308, 1.978902, 0, 0.8196079, 1, 1,
0.1425782, 0.5579483, 0.2151744, 0, 0.8156863, 1, 1,
0.1432083, 0.1706656, 0.360793, 0, 0.8078431, 1, 1,
0.1433071, 0.2837906, 0.9190716, 0, 0.8039216, 1, 1,
0.1444341, 2.630808, 0.769969, 0, 0.7960784, 1, 1,
0.147216, 1.034807, 1.257864, 0, 0.7882353, 1, 1,
0.1495741, 0.3022854, 0.3356637, 0, 0.7843137, 1, 1,
0.1513624, 1.610183, 0.5418528, 0, 0.7764706, 1, 1,
0.1549403, 0.3683073, 1.230558, 0, 0.772549, 1, 1,
0.1553105, 0.6301032, 1.133668, 0, 0.7647059, 1, 1,
0.1617916, -1.179437, 1.707792, 0, 0.7607843, 1, 1,
0.1635127, -0.1018702, 1.679631, 0, 0.7529412, 1, 1,
0.1635659, 0.0734323, 0.3121534, 0, 0.7490196, 1, 1,
0.169102, 0.8739083, 0.07663229, 0, 0.7411765, 1, 1,
0.1710282, 0.006692847, -0.1417798, 0, 0.7372549, 1, 1,
0.1767521, 1.139616, 1.348949, 0, 0.7294118, 1, 1,
0.1790701, 0.9343688, 0.8026838, 0, 0.7254902, 1, 1,
0.1797942, -0.8599504, 2.487693, 0, 0.7176471, 1, 1,
0.18076, -0.2297488, 2.95567, 0, 0.7137255, 1, 1,
0.185226, -0.7386349, 3.05549, 0, 0.7058824, 1, 1,
0.1918435, -0.3572775, 2.446629, 0, 0.6980392, 1, 1,
0.1960126, 0.5977606, 1.558707, 0, 0.6941177, 1, 1,
0.1995548, 1.293842, -0.3490708, 0, 0.6862745, 1, 1,
0.2081914, 0.02304704, 0.9823838, 0, 0.682353, 1, 1,
0.2125815, -0.02111844, 0.869094, 0, 0.6745098, 1, 1,
0.2130242, -0.05437949, 0.9486428, 0, 0.6705883, 1, 1,
0.2130741, 1.250202, -1.667178, 0, 0.6627451, 1, 1,
0.21365, -0.7242914, 3.720449, 0, 0.6588235, 1, 1,
0.2152263, -1.691333, 3.383105, 0, 0.6509804, 1, 1,
0.2181877, -0.462144, 2.200505, 0, 0.6470588, 1, 1,
0.2240949, 0.4737228, 2.008723, 0, 0.6392157, 1, 1,
0.2270407, 0.3230465, -0.6327626, 0, 0.6352941, 1, 1,
0.2277404, -0.4914682, 2.258528, 0, 0.627451, 1, 1,
0.2320709, 0.1914073, 0.04141698, 0, 0.6235294, 1, 1,
0.2332958, -0.943987, 2.818909, 0, 0.6156863, 1, 1,
0.2346855, 0.494112, 1.958603, 0, 0.6117647, 1, 1,
0.2368977, -0.3735304, 1.255714, 0, 0.6039216, 1, 1,
0.2404795, -0.7966272, 1.570721, 0, 0.5960785, 1, 1,
0.2426926, 0.03120576, 0.839795, 0, 0.5921569, 1, 1,
0.244976, 0.8571332, -1.746842, 0, 0.5843138, 1, 1,
0.246533, 0.3402747, 1.002868, 0, 0.5803922, 1, 1,
0.2473768, 0.4536486, 2.329308, 0, 0.572549, 1, 1,
0.2562183, -0.03365917, 1.447942, 0, 0.5686275, 1, 1,
0.2582283, -0.0343018, 1.69913, 0, 0.5607843, 1, 1,
0.2626958, -0.9040587, 2.905506, 0, 0.5568628, 1, 1,
0.2645151, 1.057754, 0.6712177, 0, 0.5490196, 1, 1,
0.2650674, -1.99403, 2.568271, 0, 0.5450981, 1, 1,
0.2654777, 0.8566119, 1.829839, 0, 0.5372549, 1, 1,
0.2666385, -1.235718, 3.278225, 0, 0.5333334, 1, 1,
0.2721168, -0.7934514, 2.872236, 0, 0.5254902, 1, 1,
0.2721382, -1.198332, 2.062769, 0, 0.5215687, 1, 1,
0.2734507, -0.4704581, 2.354528, 0, 0.5137255, 1, 1,
0.2784097, -0.451151, 5.308413, 0, 0.509804, 1, 1,
0.2842424, -0.4836555, 2.435095, 0, 0.5019608, 1, 1,
0.2868049, -0.6413979, 3.058445, 0, 0.4941176, 1, 1,
0.2889032, -0.1999581, 2.465501, 0, 0.4901961, 1, 1,
0.2893925, -0.4992743, 2.023122, 0, 0.4823529, 1, 1,
0.2943558, 2.570797, 1.679191, 0, 0.4784314, 1, 1,
0.2999647, -0.8986546, 3.581742, 0, 0.4705882, 1, 1,
0.3000739, -1.172823, 2.470456, 0, 0.4666667, 1, 1,
0.3034633, -1.848138, 1.659051, 0, 0.4588235, 1, 1,
0.3073103, 1.067284, 1.09948, 0, 0.454902, 1, 1,
0.3073792, -0.9833319, 2.942145, 0, 0.4470588, 1, 1,
0.3082693, 1.819998, 1.461125, 0, 0.4431373, 1, 1,
0.3084321, 1.094168, -0.8169052, 0, 0.4352941, 1, 1,
0.314779, -0.6693397, 2.550574, 0, 0.4313726, 1, 1,
0.31627, 0.0120354, 1.394418, 0, 0.4235294, 1, 1,
0.3224756, -1.116285, 3.426725, 0, 0.4196078, 1, 1,
0.3226358, -1.801582, 2.356222, 0, 0.4117647, 1, 1,
0.3285715, -0.02186215, 2.144046, 0, 0.4078431, 1, 1,
0.3287778, 1.02185, 1.175155, 0, 0.4, 1, 1,
0.3288911, -2.036391, 3.465278, 0, 0.3921569, 1, 1,
0.3292846, 1.435284, 0.01689846, 0, 0.3882353, 1, 1,
0.3323564, -0.6451086, 3.833802, 0, 0.3803922, 1, 1,
0.3326685, -1.007731, 2.930171, 0, 0.3764706, 1, 1,
0.3362852, 1.201741, 0.4166105, 0, 0.3686275, 1, 1,
0.3392553, 0.3632176, 0.6097494, 0, 0.3647059, 1, 1,
0.3404754, -0.9874225, 1.800319, 0, 0.3568628, 1, 1,
0.3406982, 1.11859, 0.3689134, 0, 0.3529412, 1, 1,
0.3411475, -1.586992, 2.737684, 0, 0.345098, 1, 1,
0.3413898, 0.9599023, -1.378018, 0, 0.3411765, 1, 1,
0.3486413, -1.038295, 2.698623, 0, 0.3333333, 1, 1,
0.3488312, 1.40544, 0.477027, 0, 0.3294118, 1, 1,
0.3543826, 0.5215508, 1.700718, 0, 0.3215686, 1, 1,
0.3544253, -0.07383673, -0.665795, 0, 0.3176471, 1, 1,
0.3547744, -0.7965679, 2.988838, 0, 0.3098039, 1, 1,
0.3575149, -0.6494861, 1.757246, 0, 0.3058824, 1, 1,
0.3579623, -1.192594, 3.05092, 0, 0.2980392, 1, 1,
0.3640242, -1.869834, 3.141021, 0, 0.2901961, 1, 1,
0.3668207, -0.8103396, 2.450698, 0, 0.2862745, 1, 1,
0.3673412, 2.44899, 0.4401651, 0, 0.2784314, 1, 1,
0.3702023, 1.436126, -0.7030132, 0, 0.2745098, 1, 1,
0.3710788, 0.6729352, 1.137098, 0, 0.2666667, 1, 1,
0.3736236, -1.04734, 1.857975, 0, 0.2627451, 1, 1,
0.3760757, 1.207559, 0.7451631, 0, 0.254902, 1, 1,
0.3786306, -0.8454279, 2.385623, 0, 0.2509804, 1, 1,
0.3794577, -0.1779281, 1.47568, 0, 0.2431373, 1, 1,
0.3820894, -0.2325193, 1.889337, 0, 0.2392157, 1, 1,
0.3823232, -0.5498946, 2.545179, 0, 0.2313726, 1, 1,
0.3860067, 1.125199, 1.095703, 0, 0.227451, 1, 1,
0.3875318, 0.02993922, 1.191833, 0, 0.2196078, 1, 1,
0.3876988, -0.444739, 0.1312517, 0, 0.2156863, 1, 1,
0.3907922, -1.371032, 2.066081, 0, 0.2078431, 1, 1,
0.3914128, -0.7153824, 2.638952, 0, 0.2039216, 1, 1,
0.3918374, -0.9299928, 1.977878, 0, 0.1960784, 1, 1,
0.39519, 0.6070185, -0.1666649, 0, 0.1882353, 1, 1,
0.397885, 1.423429, -0.03560213, 0, 0.1843137, 1, 1,
0.4018231, -0.3201667, 3.103855, 0, 0.1764706, 1, 1,
0.40247, 0.5535893, 2.829584, 0, 0.172549, 1, 1,
0.4026667, -0.2087766, 2.293158, 0, 0.1647059, 1, 1,
0.4028778, 0.5512372, 0.2335814, 0, 0.1607843, 1, 1,
0.4077102, 1.745933, 1.04508, 0, 0.1529412, 1, 1,
0.412082, 0.08669754, 0.8461965, 0, 0.1490196, 1, 1,
0.4130649, 0.2037246, 1.961458, 0, 0.1411765, 1, 1,
0.4137024, 0.01565807, 2.04162, 0, 0.1372549, 1, 1,
0.4153149, 0.6317466, 0.7816151, 0, 0.1294118, 1, 1,
0.4155761, 1.724106, 0.3386548, 0, 0.1254902, 1, 1,
0.4178068, -1.317227, 1.729085, 0, 0.1176471, 1, 1,
0.4188744, -0.209305, 1.547151, 0, 0.1137255, 1, 1,
0.4224547, 1.88008, 1.754778, 0, 0.1058824, 1, 1,
0.4234377, -1.289813, 2.958688, 0, 0.09803922, 1, 1,
0.4288408, -1.877682, 2.095455, 0, 0.09411765, 1, 1,
0.4290879, -0.08250753, 0.4365791, 0, 0.08627451, 1, 1,
0.4320851, -0.5134855, 3.709059, 0, 0.08235294, 1, 1,
0.4359863, -0.6885528, 3.628461, 0, 0.07450981, 1, 1,
0.4363503, 2.636247, -0.424279, 0, 0.07058824, 1, 1,
0.4397836, -1.51361, 3.711571, 0, 0.0627451, 1, 1,
0.440716, -0.5440021, 3.00234, 0, 0.05882353, 1, 1,
0.4444152, 0.4947922, 2.428906, 0, 0.05098039, 1, 1,
0.4496967, -1.567093, 2.768641, 0, 0.04705882, 1, 1,
0.4532443, 0.08508428, 2.56352, 0, 0.03921569, 1, 1,
0.4574834, 1.892555, 0.7812059, 0, 0.03529412, 1, 1,
0.4606432, 2.397912, 0.09841181, 0, 0.02745098, 1, 1,
0.4622727, -0.209604, 1.29548, 0, 0.02352941, 1, 1,
0.4635441, -0.9695907, 2.740993, 0, 0.01568628, 1, 1,
0.4641957, 2.160444, 0.3371823, 0, 0.01176471, 1, 1,
0.4651037, 0.9916858, -0.01815188, 0, 0.003921569, 1, 1,
0.4710901, 0.05594, -0.8043504, 0.003921569, 0, 1, 1,
0.4725322, 0.894937, 2.199171, 0.007843138, 0, 1, 1,
0.4755279, -0.6846113, 4.879447, 0.01568628, 0, 1, 1,
0.4764235, -0.7544726, 1.062323, 0.01960784, 0, 1, 1,
0.4788284, -0.7319015, 2.7482, 0.02745098, 0, 1, 1,
0.47923, 1.583194, 1.345966, 0.03137255, 0, 1, 1,
0.4861362, 2.350139, -0.1114898, 0.03921569, 0, 1, 1,
0.4955904, -0.7303953, 0.8556263, 0.04313726, 0, 1, 1,
0.499081, -1.481654, 2.434171, 0.05098039, 0, 1, 1,
0.5005265, -0.3994252, 2.350724, 0.05490196, 0, 1, 1,
0.508298, -1.467605, 3.349331, 0.0627451, 0, 1, 1,
0.5140245, -0.7659207, 1.859492, 0.06666667, 0, 1, 1,
0.5142193, -0.05412053, 1.033065, 0.07450981, 0, 1, 1,
0.5189811, -0.4273747, 2.918349, 0.07843138, 0, 1, 1,
0.5224749, 0.3082521, 0.02148232, 0.08627451, 0, 1, 1,
0.522535, -0.4969685, 3.806178, 0.09019608, 0, 1, 1,
0.5226162, -1.100044, 0.5917479, 0.09803922, 0, 1, 1,
0.5231673, 0.733303, -0.4880637, 0.1058824, 0, 1, 1,
0.526582, 0.4338416, -0.09942789, 0.1098039, 0, 1, 1,
0.5268335, -0.8140233, 1.683897, 0.1176471, 0, 1, 1,
0.5276425, -0.1032452, 2.522799, 0.1215686, 0, 1, 1,
0.529386, -0.937449, 3.203901, 0.1294118, 0, 1, 1,
0.5313461, -0.3370073, 3.52051, 0.1333333, 0, 1, 1,
0.5321896, -0.2133789, 1.433757, 0.1411765, 0, 1, 1,
0.5334594, 2.086114, 0.1534773, 0.145098, 0, 1, 1,
0.5496403, -1.195573, 3.623972, 0.1529412, 0, 1, 1,
0.550015, 1.326484, 0.964093, 0.1568628, 0, 1, 1,
0.550179, 0.5678871, 1.641136, 0.1647059, 0, 1, 1,
0.5516646, -0.4753325, 3.574622, 0.1686275, 0, 1, 1,
0.5523646, 0.815981, -0.5656599, 0.1764706, 0, 1, 1,
0.5526784, 0.893046, 1.066285, 0.1803922, 0, 1, 1,
0.5570226, 1.095311, 0.3717834, 0.1882353, 0, 1, 1,
0.5603327, 0.5265381, 0.1450209, 0.1921569, 0, 1, 1,
0.5620767, -1.269976, 3.028401, 0.2, 0, 1, 1,
0.5633389, 0.7542115, 0.1033006, 0.2078431, 0, 1, 1,
0.5636907, -0.5774581, -0.3501002, 0.2117647, 0, 1, 1,
0.5712029, 2.04297, 0.5707342, 0.2196078, 0, 1, 1,
0.5773432, -0.870419, 0.9792287, 0.2235294, 0, 1, 1,
0.5781856, -0.07077504, 2.353667, 0.2313726, 0, 1, 1,
0.5824649, 1.319713, 0.1065515, 0.2352941, 0, 1, 1,
0.5829917, -0.3599048, 2.146516, 0.2431373, 0, 1, 1,
0.5842009, 1.476356, 0.8282589, 0.2470588, 0, 1, 1,
0.5857314, -0.04560876, 2.947101, 0.254902, 0, 1, 1,
0.5868534, -0.1996304, 0.7778363, 0.2588235, 0, 1, 1,
0.5878639, 0.4661003, 3.296031, 0.2666667, 0, 1, 1,
0.5890231, -0.5484998, 1.620093, 0.2705882, 0, 1, 1,
0.5905352, 0.1595888, 2.099865, 0.2784314, 0, 1, 1,
0.5907626, -0.2449924, 3.140304, 0.282353, 0, 1, 1,
0.5949487, -0.5193268, 2.665464, 0.2901961, 0, 1, 1,
0.5961151, -1.107122, 2.634187, 0.2941177, 0, 1, 1,
0.6002935, -0.1322645, 1.236083, 0.3019608, 0, 1, 1,
0.6027275, -2.329744, 2.937997, 0.3098039, 0, 1, 1,
0.6067557, -1.373829, 3.330636, 0.3137255, 0, 1, 1,
0.6113845, -0.5726028, 1.778312, 0.3215686, 0, 1, 1,
0.6175988, 1.492753, 0.3068736, 0.3254902, 0, 1, 1,
0.61795, -1.074595, 2.204374, 0.3333333, 0, 1, 1,
0.6180519, -0.5240043, 3.962139, 0.3372549, 0, 1, 1,
0.6189864, 1.738196, 1.178266, 0.345098, 0, 1, 1,
0.6202812, 0.6002274, 1.778314, 0.3490196, 0, 1, 1,
0.6243476, 1.056797, 0.5434229, 0.3568628, 0, 1, 1,
0.6270853, 0.05711856, 2.99244, 0.3607843, 0, 1, 1,
0.6283813, 0.391567, -0.1895308, 0.3686275, 0, 1, 1,
0.6294574, 0.1795497, 1.117131, 0.372549, 0, 1, 1,
0.6386923, 0.5000496, -0.8401892, 0.3803922, 0, 1, 1,
0.6423312, -0.85691, 1.864793, 0.3843137, 0, 1, 1,
0.6424242, 0.4880048, 1.063016, 0.3921569, 0, 1, 1,
0.6471617, -1.05041, 3.139657, 0.3960784, 0, 1, 1,
0.6510031, 1.359021, 1.991426, 0.4039216, 0, 1, 1,
0.6597242, -1.080201, 3.527669, 0.4117647, 0, 1, 1,
0.6625234, 0.4162884, 1.819904, 0.4156863, 0, 1, 1,
0.6689702, -0.8546396, 1.673818, 0.4235294, 0, 1, 1,
0.6707064, -0.8986511, 2.409423, 0.427451, 0, 1, 1,
0.6728405, -0.4088735, 3.348737, 0.4352941, 0, 1, 1,
0.6753813, -0.5289366, 2.361894, 0.4392157, 0, 1, 1,
0.6762325, -0.3475336, 2.213304, 0.4470588, 0, 1, 1,
0.6803392, -0.3228819, 1.205252, 0.4509804, 0, 1, 1,
0.6935273, -0.356046, 2.333137, 0.4588235, 0, 1, 1,
0.6970983, 1.309503, 1.682425, 0.4627451, 0, 1, 1,
0.7035984, 0.0607435, 1.654891, 0.4705882, 0, 1, 1,
0.7063243, -1.458441, 3.949539, 0.4745098, 0, 1, 1,
0.7065558, 0.8302513, 1.28116, 0.4823529, 0, 1, 1,
0.7091303, 1.997082, 0.6033104, 0.4862745, 0, 1, 1,
0.7104382, -1.292022, 1.578931, 0.4941176, 0, 1, 1,
0.7164729, 0.9967018, 0.8940539, 0.5019608, 0, 1, 1,
0.7169768, -0.2278655, 3.021199, 0.5058824, 0, 1, 1,
0.720427, 0.8298818, 1.466976, 0.5137255, 0, 1, 1,
0.7232695, -1.075046, 1.995536, 0.5176471, 0, 1, 1,
0.7232988, -0.07533298, 2.548281, 0.5254902, 0, 1, 1,
0.7252162, 0.03278952, 2.211422, 0.5294118, 0, 1, 1,
0.7261167, -1.011341, 1.88634, 0.5372549, 0, 1, 1,
0.7262474, 0.9408147, 1.916616, 0.5411765, 0, 1, 1,
0.7273237, -1.246712, 3.204837, 0.5490196, 0, 1, 1,
0.7330855, -1.526891, 4.213946, 0.5529412, 0, 1, 1,
0.7380447, -0.5636633, 1.5683, 0.5607843, 0, 1, 1,
0.7386414, 0.8233687, 2.435546, 0.5647059, 0, 1, 1,
0.7386739, 0.1182727, 1.220291, 0.572549, 0, 1, 1,
0.7386813, 0.77829, 1.505694, 0.5764706, 0, 1, 1,
0.7409203, -0.8149488, 1.680894, 0.5843138, 0, 1, 1,
0.7412501, -0.5989351, 1.366573, 0.5882353, 0, 1, 1,
0.7481091, -0.8458338, 3.84911, 0.5960785, 0, 1, 1,
0.7485286, 0.2051913, 1.97556, 0.6039216, 0, 1, 1,
0.7509744, 0.1794705, 1.089146, 0.6078432, 0, 1, 1,
0.7595497, 0.5146542, -0.8455547, 0.6156863, 0, 1, 1,
0.7603837, -0.2803094, 2.276751, 0.6196079, 0, 1, 1,
0.7653453, 0.4944268, 2.717983, 0.627451, 0, 1, 1,
0.7680096, 1.396531, -0.474568, 0.6313726, 0, 1, 1,
0.7681093, 1.901891, 1.4404, 0.6392157, 0, 1, 1,
0.7702284, -0.1416652, 0.8179852, 0.6431373, 0, 1, 1,
0.7704203, -0.7970934, 1.775763, 0.6509804, 0, 1, 1,
0.774832, -0.6311879, 3.008302, 0.654902, 0, 1, 1,
0.7830542, -0.3555351, 2.9141, 0.6627451, 0, 1, 1,
0.785051, 0.5239949, -0.3101124, 0.6666667, 0, 1, 1,
0.7912433, -2.870351, 0.7610987, 0.6745098, 0, 1, 1,
0.7956515, -1.095111, 2.667206, 0.6784314, 0, 1, 1,
0.8053594, 0.5784996, 1.739363, 0.6862745, 0, 1, 1,
0.8101162, -3.089932, 1.855571, 0.6901961, 0, 1, 1,
0.8114989, -0.5484572, 2.682642, 0.6980392, 0, 1, 1,
0.8144506, -0.6929768, 0.8130831, 0.7058824, 0, 1, 1,
0.8190795, 1.155566, 1.701261, 0.7098039, 0, 1, 1,
0.8421232, -1.127476, 4.209249, 0.7176471, 0, 1, 1,
0.843915, 0.06197626, 1.321715, 0.7215686, 0, 1, 1,
0.8569817, -0.14534, 2.551819, 0.7294118, 0, 1, 1,
0.857536, 2.320969, 0.1785181, 0.7333333, 0, 1, 1,
0.8621724, -0.9998455, 1.12027, 0.7411765, 0, 1, 1,
0.8639861, -0.5659215, 0.4827845, 0.7450981, 0, 1, 1,
0.8653163, 1.039084, -0.01744597, 0.7529412, 0, 1, 1,
0.8681035, 1.046592, -0.05627339, 0.7568628, 0, 1, 1,
0.8687361, -0.5795084, 3.365863, 0.7647059, 0, 1, 1,
0.8697586, 0.1180068, 1.317915, 0.7686275, 0, 1, 1,
0.872205, 0.1105362, 1.087393, 0.7764706, 0, 1, 1,
0.874535, 1.024781, 1.136903, 0.7803922, 0, 1, 1,
0.8748466, 1.332717, 0.6929256, 0.7882353, 0, 1, 1,
0.875939, -1.352402, 1.781581, 0.7921569, 0, 1, 1,
0.8781445, 1.387305, 0.5839826, 0.8, 0, 1, 1,
0.8816666, 0.2876574, 1.338657, 0.8078431, 0, 1, 1,
0.8824145, -0.6203361, 2.390911, 0.8117647, 0, 1, 1,
0.8866078, -1.507718, 3.558545, 0.8196079, 0, 1, 1,
0.8916226, 1.519787, 0.1582815, 0.8235294, 0, 1, 1,
0.8971393, -1.689258, 3.098724, 0.8313726, 0, 1, 1,
0.9079014, 0.03301488, 1.614078, 0.8352941, 0, 1, 1,
0.9086763, -0.05746979, 1.529111, 0.8431373, 0, 1, 1,
0.9146324, -0.27072, 2.0324, 0.8470588, 0, 1, 1,
0.9240685, -0.8797618, 2.05067, 0.854902, 0, 1, 1,
0.9286217, -0.7310745, 2.700551, 0.8588235, 0, 1, 1,
0.9288947, 0.7467739, -1.311374, 0.8666667, 0, 1, 1,
0.9317389, 1.480253, 1.526508, 0.8705882, 0, 1, 1,
0.9327651, -1.443698, 2.317317, 0.8784314, 0, 1, 1,
0.9336417, -0.04690956, 0.8879273, 0.8823529, 0, 1, 1,
0.9381388, -1.253962, 2.297682, 0.8901961, 0, 1, 1,
0.9403764, -0.5748867, 4.217238, 0.8941177, 0, 1, 1,
0.9427392, 0.3020083, 3.160483, 0.9019608, 0, 1, 1,
0.9515769, -0.821316, 1.459502, 0.9098039, 0, 1, 1,
0.9534974, 0.01541319, 1.975646, 0.9137255, 0, 1, 1,
0.9560636, -1.199767, 3.036796, 0.9215686, 0, 1, 1,
0.9567805, 1.525772, 1.32811, 0.9254902, 0, 1, 1,
0.9611481, -0.06307468, 1.08644, 0.9333333, 0, 1, 1,
0.961924, 0.768396, 1.154166, 0.9372549, 0, 1, 1,
0.9621978, -0.4056146, 0.08059501, 0.945098, 0, 1, 1,
0.9636821, 0.1729679, 1.327797, 0.9490196, 0, 1, 1,
0.9684114, -1.324736, 2.28853, 0.9568627, 0, 1, 1,
0.9718176, -0.6213372, 2.482549, 0.9607843, 0, 1, 1,
0.9865566, -0.1663473, -0.01829172, 0.9686275, 0, 1, 1,
0.98682, 0.620285, -0.115066, 0.972549, 0, 1, 1,
0.991869, 0.193151, 3.158612, 0.9803922, 0, 1, 1,
0.9923815, 1.262149, 1.359191, 0.9843137, 0, 1, 1,
0.9946702, 0.0838036, 1.898748, 0.9921569, 0, 1, 1,
1.000362, 1.34061, 2.119827, 0.9960784, 0, 1, 1,
1.001003, -0.06785461, 0.44579, 1, 0, 0.9960784, 1,
1.004532, -1.617776, 2.054161, 1, 0, 0.9882353, 1,
1.007967, 0.6220981, 1.507209, 1, 0, 0.9843137, 1,
1.010518, 0.6133917, 0.09068494, 1, 0, 0.9764706, 1,
1.013259, -0.5399926, 2.6901, 1, 0, 0.972549, 1,
1.017813, 0.4893814, 1.771709, 1, 0, 0.9647059, 1,
1.018548, 0.6789806, 1.762199, 1, 0, 0.9607843, 1,
1.03761, 0.3074153, 1.84618, 1, 0, 0.9529412, 1,
1.038976, 0.8024859, 2.007298, 1, 0, 0.9490196, 1,
1.04551, 0.79169, 1.934803, 1, 0, 0.9411765, 1,
1.051155, -1.574208, 0.903423, 1, 0, 0.9372549, 1,
1.052457, 0.6471958, 1.607842, 1, 0, 0.9294118, 1,
1.054927, -0.01987457, 1.89592, 1, 0, 0.9254902, 1,
1.060202, 0.4367123, 0.8223619, 1, 0, 0.9176471, 1,
1.062599, -1.216314, 1.778614, 1, 0, 0.9137255, 1,
1.065268, -0.1516481, 2.493715, 1, 0, 0.9058824, 1,
1.068198, -0.8605318, 0.8482321, 1, 0, 0.9019608, 1,
1.072728, -0.8101634, 0.7725943, 1, 0, 0.8941177, 1,
1.074371, 0.3543982, 1.92145, 1, 0, 0.8862745, 1,
1.078431, 0.6431181, -0.2046458, 1, 0, 0.8823529, 1,
1.083408, -0.7053298, 2.689035, 1, 0, 0.8745098, 1,
1.0843, -0.2239372, 1.160784, 1, 0, 0.8705882, 1,
1.08476, -1.14739, 2.041298, 1, 0, 0.8627451, 1,
1.100037, 0.2616873, 2.580871, 1, 0, 0.8588235, 1,
1.108188, 0.05901248, 1.552634, 1, 0, 0.8509804, 1,
1.111115, -0.8975796, 2.805298, 1, 0, 0.8470588, 1,
1.113306, 0.6020322, 1.139637, 1, 0, 0.8392157, 1,
1.118916, 0.8157564, 2.269888, 1, 0, 0.8352941, 1,
1.120625, -1.166228, 2.201853, 1, 0, 0.827451, 1,
1.122004, -0.5401774, 2.442559, 1, 0, 0.8235294, 1,
1.124028, -0.08764154, 1.730189, 1, 0, 0.8156863, 1,
1.124792, -1.868011, 3.132702, 1, 0, 0.8117647, 1,
1.130895, 0.6924654, -0.195663, 1, 0, 0.8039216, 1,
1.133901, 0.04837722, 2.410024, 1, 0, 0.7960784, 1,
1.134395, -0.9625908, 1.904703, 1, 0, 0.7921569, 1,
1.13623, -0.3155707, 0.02877792, 1, 0, 0.7843137, 1,
1.151377, 0.515182, 1.828316, 1, 0, 0.7803922, 1,
1.153131, 1.05723, 0.5249333, 1, 0, 0.772549, 1,
1.155475, 0.7042665, 1.921619, 1, 0, 0.7686275, 1,
1.182417, 0.7733999, 0.7855325, 1, 0, 0.7607843, 1,
1.184284, 0.4321503, 0.1801483, 1, 0, 0.7568628, 1,
1.187194, -1.999574, 3.831664, 1, 0, 0.7490196, 1,
1.191542, -2.127843, 3.291714, 1, 0, 0.7450981, 1,
1.200426, 1.410958, -0.0373297, 1, 0, 0.7372549, 1,
1.208851, -0.5797815, 3.532921, 1, 0, 0.7333333, 1,
1.210178, -1.36134, 2.47626, 1, 0, 0.7254902, 1,
1.21231, 0.6113963, 0.4610017, 1, 0, 0.7215686, 1,
1.227205, 0.8443505, -0.767749, 1, 0, 0.7137255, 1,
1.22832, 0.9735296, 1.432039, 1, 0, 0.7098039, 1,
1.231046, 2.025987, 0.09538393, 1, 0, 0.7019608, 1,
1.233154, 0.5000536, 0.9968024, 1, 0, 0.6941177, 1,
1.2366, -1.047431, 2.343098, 1, 0, 0.6901961, 1,
1.239322, -0.2648502, 3.644823, 1, 0, 0.682353, 1,
1.239327, -1.068342, 1.369468, 1, 0, 0.6784314, 1,
1.251351, -0.4546076, 1.08407, 1, 0, 0.6705883, 1,
1.253651, -0.8045384, 0.432495, 1, 0, 0.6666667, 1,
1.261814, -1.20354, 1.790998, 1, 0, 0.6588235, 1,
1.264481, 0.311857, -0.6592041, 1, 0, 0.654902, 1,
1.269943, 0.3781094, 0.7186416, 1, 0, 0.6470588, 1,
1.272463, -1.879379, 1.471487, 1, 0, 0.6431373, 1,
1.275477, -0.6031402, 2.242817, 1, 0, 0.6352941, 1,
1.278591, 1.262599, 1.067898, 1, 0, 0.6313726, 1,
1.280701, 1.236152, -0.1142466, 1, 0, 0.6235294, 1,
1.28721, 0.3373239, 0.2436144, 1, 0, 0.6196079, 1,
1.289348, 1.379994, 0.4332352, 1, 0, 0.6117647, 1,
1.289946, 0.6821113, -0.2324649, 1, 0, 0.6078432, 1,
1.308097, 0.08519546, -0.3098426, 1, 0, 0.6, 1,
1.311697, 0.6034465, 1.34693, 1, 0, 0.5921569, 1,
1.317777, 1.101502, 1.184653, 1, 0, 0.5882353, 1,
1.325622, -0.526078, 2.328649, 1, 0, 0.5803922, 1,
1.327642, -1.002202, 2.64414, 1, 0, 0.5764706, 1,
1.328332, -0.2493698, 0.2989414, 1, 0, 0.5686275, 1,
1.335257, 0.3964622, 1.430954, 1, 0, 0.5647059, 1,
1.340297, 0.2902028, 1.369036, 1, 0, 0.5568628, 1,
1.34151, -0.01547742, 2.279303, 1, 0, 0.5529412, 1,
1.342647, -1.917336, 3.44026, 1, 0, 0.5450981, 1,
1.345581, -0.748669, 3.734056, 1, 0, 0.5411765, 1,
1.351085, 0.2081832, 2.740588, 1, 0, 0.5333334, 1,
1.3515, 0.3294004, -0.2306632, 1, 0, 0.5294118, 1,
1.356381, -0.3940395, 2.604282, 1, 0, 0.5215687, 1,
1.359345, -2.53416, 2.458759, 1, 0, 0.5176471, 1,
1.366986, -0.009668302, 1.993616, 1, 0, 0.509804, 1,
1.369414, -0.3208396, 0.8863923, 1, 0, 0.5058824, 1,
1.389772, -1.408079, 1.463293, 1, 0, 0.4980392, 1,
1.397128, 1.961213, -0.2290542, 1, 0, 0.4901961, 1,
1.41059, 0.2602973, 0.4936495, 1, 0, 0.4862745, 1,
1.436667, 0.5736061, 0.230356, 1, 0, 0.4784314, 1,
1.439226, 1.06653, 0.3638657, 1, 0, 0.4745098, 1,
1.450745, -0.9505451, 2.573071, 1, 0, 0.4666667, 1,
1.464103, 0.8797722, 1.585472, 1, 0, 0.4627451, 1,
1.465171, -0.2493159, 1.439409, 1, 0, 0.454902, 1,
1.477343, 0.860384, 0.941278, 1, 0, 0.4509804, 1,
1.485412, 0.1254642, 1.483896, 1, 0, 0.4431373, 1,
1.496698, -0.935501, 0.4527351, 1, 0, 0.4392157, 1,
1.497388, 0.8440467, 1.242212, 1, 0, 0.4313726, 1,
1.514289, 0.2604813, 0.9085708, 1, 0, 0.427451, 1,
1.53464, -0.3487439, 1.527054, 1, 0, 0.4196078, 1,
1.538121, -0.3646434, 1.024544, 1, 0, 0.4156863, 1,
1.549397, -0.6580629, 2.409791, 1, 0, 0.4078431, 1,
1.55191, 0.01906093, 2.264601, 1, 0, 0.4039216, 1,
1.57224, 1.495101, 0.7689426, 1, 0, 0.3960784, 1,
1.579538, 0.4445204, 2.103017, 1, 0, 0.3882353, 1,
1.580322, -0.5711769, 2.403962, 1, 0, 0.3843137, 1,
1.587666, -0.7992923, 1.572479, 1, 0, 0.3764706, 1,
1.595947, 1.914791, 0.05141272, 1, 0, 0.372549, 1,
1.603365, -0.3313701, 1.840243, 1, 0, 0.3647059, 1,
1.609473, -2.460606, 3.446183, 1, 0, 0.3607843, 1,
1.614213, 0.3141522, 2.261082, 1, 0, 0.3529412, 1,
1.615325, 0.1049326, 2.921186, 1, 0, 0.3490196, 1,
1.622487, 1.173423, 0.5618709, 1, 0, 0.3411765, 1,
1.622697, -0.1778695, 1.26502, 1, 0, 0.3372549, 1,
1.632979, 0.83404, 1.483274, 1, 0, 0.3294118, 1,
1.636619, -0.9930177, 1.783018, 1, 0, 0.3254902, 1,
1.639041, 2.690723, 2.688356, 1, 0, 0.3176471, 1,
1.649399, -0.1417669, 0.6929464, 1, 0, 0.3137255, 1,
1.657904, 0.02941099, 0.9517714, 1, 0, 0.3058824, 1,
1.660277, 0.6708594, 2.596073, 1, 0, 0.2980392, 1,
1.666573, 1.102042, 1.278773, 1, 0, 0.2941177, 1,
1.667885, 0.4048277, 1.758367, 1, 0, 0.2862745, 1,
1.669785, 0.03991903, 0.4407143, 1, 0, 0.282353, 1,
1.679247, -0.07151669, 2.33531, 1, 0, 0.2745098, 1,
1.686914, 1.098397, 2.037852, 1, 0, 0.2705882, 1,
1.697513, -0.6330807, 0.9614505, 1, 0, 0.2627451, 1,
1.713501, 1.500341, 1.268079, 1, 0, 0.2588235, 1,
1.734853, 0.4529906, 3.467679, 1, 0, 0.2509804, 1,
1.741665, 1.571072, 0.1541569, 1, 0, 0.2470588, 1,
1.742476, 0.932025, 2.242969, 1, 0, 0.2392157, 1,
1.750049, -1.55037, 2.058535, 1, 0, 0.2352941, 1,
1.754769, -1.056326, 1.121312, 1, 0, 0.227451, 1,
1.797255, 1.616436, 2.062335, 1, 0, 0.2235294, 1,
1.824677, 0.4189663, -0.02388768, 1, 0, 0.2156863, 1,
1.829156, -0.8477604, 3.226817, 1, 0, 0.2117647, 1,
1.832819, -0.8833899, 2.563636, 1, 0, 0.2039216, 1,
1.839716, -1.308412, 2.338168, 1, 0, 0.1960784, 1,
1.841442, -1.615971, 2.719063, 1, 0, 0.1921569, 1,
1.864933, -0.2531155, 3.691338, 1, 0, 0.1843137, 1,
1.879544, 1.119866, 0.8570198, 1, 0, 0.1803922, 1,
1.881444, -1.505671, 2.441163, 1, 0, 0.172549, 1,
1.887707, -1.019573, 0.4692698, 1, 0, 0.1686275, 1,
1.898073, 0.7433789, 0.395588, 1, 0, 0.1607843, 1,
1.915998, -1.344675, 3.517217, 1, 0, 0.1568628, 1,
1.929425, -1.003215, 1.64929, 1, 0, 0.1490196, 1,
1.949252, 0.8417785, -0.007669969, 1, 0, 0.145098, 1,
1.967585, 0.7352166, 1.395695, 1, 0, 0.1372549, 1,
2.0285, -1.770102, 4.026632, 1, 0, 0.1333333, 1,
2.056051, 2.29779, 1.444955, 1, 0, 0.1254902, 1,
2.093653, -0.055243, 1.917672, 1, 0, 0.1215686, 1,
2.098448, -1.254602, 0.4250402, 1, 0, 0.1137255, 1,
2.161658, 1.53674, -0.5559531, 1, 0, 0.1098039, 1,
2.170078, 0.09924711, 1.666386, 1, 0, 0.1019608, 1,
2.174517, -1.510704, 2.289783, 1, 0, 0.09411765, 1,
2.186135, -0.669438, 1.11556, 1, 0, 0.09019608, 1,
2.20706, 0.08857743, 2.234845, 1, 0, 0.08235294, 1,
2.26937, -1.073224, 2.146138, 1, 0, 0.07843138, 1,
2.313651, 0.9384519, 0.2331875, 1, 0, 0.07058824, 1,
2.330851, -0.5905417, 0.9885191, 1, 0, 0.06666667, 1,
2.391607, -0.04901951, 1.173091, 1, 0, 0.05882353, 1,
2.427072, -2.117567, 3.130298, 1, 0, 0.05490196, 1,
2.546318, 1.450496, 2.007705, 1, 0, 0.04705882, 1,
2.635763, -1.634233, 2.728689, 1, 0, 0.04313726, 1,
2.680954, 1.143084, 0.5313491, 1, 0, 0.03529412, 1,
2.731069, -1.607442, 1.650705, 1, 0, 0.03137255, 1,
2.934102, -1.164908, 0.5185595, 1, 0, 0.02352941, 1,
3.064398, 0.1528763, 2.652919, 1, 0, 0.01960784, 1,
3.186902, -0.2572656, 0.7748857, 1, 0, 0.01176471, 1,
3.356446, -0.238473, 1.787227, 1, 0, 0.007843138, 1
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
-0.05326271, -4.10727, -7.522638, 0, -0.5, 0.5, 0.5,
-0.05326271, -4.10727, -7.522638, 1, -0.5, 0.5, 0.5,
-0.05326271, -4.10727, -7.522638, 1, 1.5, 0.5, 0.5,
-0.05326271, -4.10727, -7.522638, 0, 1.5, 0.5, 0.5
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
-4.618863, -0.08893502, -7.522638, 0, -0.5, 0.5, 0.5,
-4.618863, -0.08893502, -7.522638, 1, -0.5, 0.5, 0.5,
-4.618863, -0.08893502, -7.522638, 1, 1.5, 0.5, 0.5,
-4.618863, -0.08893502, -7.522638, 0, 1.5, 0.5, 0.5
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
-4.618863, -4.10727, -0.1637068, 0, -0.5, 0.5, 0.5,
-4.618863, -4.10727, -0.1637068, 1, -0.5, 0.5, 0.5,
-4.618863, -4.10727, -0.1637068, 1, 1.5, 0.5, 0.5,
-4.618863, -4.10727, -0.1637068, 0, 1.5, 0.5, 0.5
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
-3, -3.179962, -5.824423,
3, -3.179962, -5.824423,
-3, -3.179962, -5.824423,
-3, -3.334513, -6.10746,
-2, -3.179962, -5.824423,
-2, -3.334513, -6.10746,
-1, -3.179962, -5.824423,
-1, -3.334513, -6.10746,
0, -3.179962, -5.824423,
0, -3.334513, -6.10746,
1, -3.179962, -5.824423,
1, -3.334513, -6.10746,
2, -3.179962, -5.824423,
2, -3.334513, -6.10746,
3, -3.179962, -5.824423,
3, -3.334513, -6.10746
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
"-3",
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
-3, -3.643616, -6.673531, 0, -0.5, 0.5, 0.5,
-3, -3.643616, -6.673531, 1, -0.5, 0.5, 0.5,
-3, -3.643616, -6.673531, 1, 1.5, 0.5, 0.5,
-3, -3.643616, -6.673531, 0, 1.5, 0.5, 0.5,
-2, -3.643616, -6.673531, 0, -0.5, 0.5, 0.5,
-2, -3.643616, -6.673531, 1, -0.5, 0.5, 0.5,
-2, -3.643616, -6.673531, 1, 1.5, 0.5, 0.5,
-2, -3.643616, -6.673531, 0, 1.5, 0.5, 0.5,
-1, -3.643616, -6.673531, 0, -0.5, 0.5, 0.5,
-1, -3.643616, -6.673531, 1, -0.5, 0.5, 0.5,
-1, -3.643616, -6.673531, 1, 1.5, 0.5, 0.5,
-1, -3.643616, -6.673531, 0, 1.5, 0.5, 0.5,
0, -3.643616, -6.673531, 0, -0.5, 0.5, 0.5,
0, -3.643616, -6.673531, 1, -0.5, 0.5, 0.5,
0, -3.643616, -6.673531, 1, 1.5, 0.5, 0.5,
0, -3.643616, -6.673531, 0, 1.5, 0.5, 0.5,
1, -3.643616, -6.673531, 0, -0.5, 0.5, 0.5,
1, -3.643616, -6.673531, 1, -0.5, 0.5, 0.5,
1, -3.643616, -6.673531, 1, 1.5, 0.5, 0.5,
1, -3.643616, -6.673531, 0, 1.5, 0.5, 0.5,
2, -3.643616, -6.673531, 0, -0.5, 0.5, 0.5,
2, -3.643616, -6.673531, 1, -0.5, 0.5, 0.5,
2, -3.643616, -6.673531, 1, 1.5, 0.5, 0.5,
2, -3.643616, -6.673531, 0, 1.5, 0.5, 0.5,
3, -3.643616, -6.673531, 0, -0.5, 0.5, 0.5,
3, -3.643616, -6.673531, 1, -0.5, 0.5, 0.5,
3, -3.643616, -6.673531, 1, 1.5, 0.5, 0.5,
3, -3.643616, -6.673531, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.565263, -3, -5.824423,
-3.565263, 2, -5.824423,
-3.565263, -3, -5.824423,
-3.740862, -3, -6.10746,
-3.565263, -2, -5.824423,
-3.740862, -2, -6.10746,
-3.565263, -1, -5.824423,
-3.740862, -1, -6.10746,
-3.565263, 0, -5.824423,
-3.740862, 0, -6.10746,
-3.565263, 1, -5.824423,
-3.740862, 1, -6.10746,
-3.565263, 2, -5.824423,
-3.740862, 2, -6.10746
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
"-3",
"-2",
"-1",
"0",
"1",
"2"
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
-4.092062, -3, -6.673531, 0, -0.5, 0.5, 0.5,
-4.092062, -3, -6.673531, 1, -0.5, 0.5, 0.5,
-4.092062, -3, -6.673531, 1, 1.5, 0.5, 0.5,
-4.092062, -3, -6.673531, 0, 1.5, 0.5, 0.5,
-4.092062, -2, -6.673531, 0, -0.5, 0.5, 0.5,
-4.092062, -2, -6.673531, 1, -0.5, 0.5, 0.5,
-4.092062, -2, -6.673531, 1, 1.5, 0.5, 0.5,
-4.092062, -2, -6.673531, 0, 1.5, 0.5, 0.5,
-4.092062, -1, -6.673531, 0, -0.5, 0.5, 0.5,
-4.092062, -1, -6.673531, 1, -0.5, 0.5, 0.5,
-4.092062, -1, -6.673531, 1, 1.5, 0.5, 0.5,
-4.092062, -1, -6.673531, 0, 1.5, 0.5, 0.5,
-4.092062, 0, -6.673531, 0, -0.5, 0.5, 0.5,
-4.092062, 0, -6.673531, 1, -0.5, 0.5, 0.5,
-4.092062, 0, -6.673531, 1, 1.5, 0.5, 0.5,
-4.092062, 0, -6.673531, 0, 1.5, 0.5, 0.5,
-4.092062, 1, -6.673531, 0, -0.5, 0.5, 0.5,
-4.092062, 1, -6.673531, 1, -0.5, 0.5, 0.5,
-4.092062, 1, -6.673531, 1, 1.5, 0.5, 0.5,
-4.092062, 1, -6.673531, 0, 1.5, 0.5, 0.5,
-4.092062, 2, -6.673531, 0, -0.5, 0.5, 0.5,
-4.092062, 2, -6.673531, 1, -0.5, 0.5, 0.5,
-4.092062, 2, -6.673531, 1, 1.5, 0.5, 0.5,
-4.092062, 2, -6.673531, 0, 1.5, 0.5, 0.5
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
-3.565263, -3.179962, -4,
-3.565263, -3.179962, 4,
-3.565263, -3.179962, -4,
-3.740862, -3.334513, -4,
-3.565263, -3.179962, -2,
-3.740862, -3.334513, -2,
-3.565263, -3.179962, 0,
-3.740862, -3.334513, 0,
-3.565263, -3.179962, 2,
-3.740862, -3.334513, 2,
-3.565263, -3.179962, 4,
-3.740862, -3.334513, 4
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
-4.092062, -3.643616, -4, 0, -0.5, 0.5, 0.5,
-4.092062, -3.643616, -4, 1, -0.5, 0.5, 0.5,
-4.092062, -3.643616, -4, 1, 1.5, 0.5, 0.5,
-4.092062, -3.643616, -4, 0, 1.5, 0.5, 0.5,
-4.092062, -3.643616, -2, 0, -0.5, 0.5, 0.5,
-4.092062, -3.643616, -2, 1, -0.5, 0.5, 0.5,
-4.092062, -3.643616, -2, 1, 1.5, 0.5, 0.5,
-4.092062, -3.643616, -2, 0, 1.5, 0.5, 0.5,
-4.092062, -3.643616, 0, 0, -0.5, 0.5, 0.5,
-4.092062, -3.643616, 0, 1, -0.5, 0.5, 0.5,
-4.092062, -3.643616, 0, 1, 1.5, 0.5, 0.5,
-4.092062, -3.643616, 0, 0, 1.5, 0.5, 0.5,
-4.092062, -3.643616, 2, 0, -0.5, 0.5, 0.5,
-4.092062, -3.643616, 2, 1, -0.5, 0.5, 0.5,
-4.092062, -3.643616, 2, 1, 1.5, 0.5, 0.5,
-4.092062, -3.643616, 2, 0, 1.5, 0.5, 0.5,
-4.092062, -3.643616, 4, 0, -0.5, 0.5, 0.5,
-4.092062, -3.643616, 4, 1, -0.5, 0.5, 0.5,
-4.092062, -3.643616, 4, 1, 1.5, 0.5, 0.5,
-4.092062, -3.643616, 4, 0, 1.5, 0.5, 0.5
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
-3.565263, -3.179962, -5.824423,
-3.565263, 3.002092, -5.824423,
-3.565263, -3.179962, 5.49701,
-3.565263, 3.002092, 5.49701,
-3.565263, -3.179962, -5.824423,
-3.565263, -3.179962, 5.49701,
-3.565263, 3.002092, -5.824423,
-3.565263, 3.002092, 5.49701,
-3.565263, -3.179962, -5.824423,
3.458737, -3.179962, -5.824423,
-3.565263, -3.179962, 5.49701,
3.458737, -3.179962, 5.49701,
-3.565263, 3.002092, -5.824423,
3.458737, 3.002092, -5.824423,
-3.565263, 3.002092, 5.49701,
3.458737, 3.002092, 5.49701,
3.458737, -3.179962, -5.824423,
3.458737, 3.002092, -5.824423,
3.458737, -3.179962, 5.49701,
3.458737, 3.002092, 5.49701,
3.458737, -3.179962, -5.824423,
3.458737, -3.179962, 5.49701,
3.458737, 3.002092, -5.824423,
3.458737, 3.002092, 5.49701
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
var radius = 7.842959;
var distance = 34.89421;
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
mvMatrix.translate( 0.05326271, 0.08893502, 0.1637068 );
mvMatrix.scale( 1.207284, 1.371706, 0.7490183 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.89421);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Endrin_ketone<-read.table("Endrin_ketone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Endrin_ketone$V2
```

```
## Error in eval(expr, envir, enclos): object 'Endrin_ketone' not found
```

```r
y<-Endrin_ketone$V3
```

```
## Error in eval(expr, envir, enclos): object 'Endrin_ketone' not found
```

```r
z<-Endrin_ketone$V4
```

```
## Error in eval(expr, envir, enclos): object 'Endrin_ketone' not found
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
-3.462971, -0.2028847, -1.41842, 0, 0, 1, 1, 1,
-3.437556, 1.053011, -1.953085, 1, 0, 0, 1, 1,
-2.750514, -0.333165, -3.012661, 1, 0, 0, 1, 1,
-2.7441, 0.08197921, -1.425095, 1, 0, 0, 1, 1,
-2.627456, 0.0252876, -0.8566087, 1, 0, 0, 1, 1,
-2.548795, -0.8379891, -1.73686, 1, 0, 0, 1, 1,
-2.537897, -1.455721, -1.932423, 0, 0, 0, 1, 1,
-2.506371, -1.266312, -0.6110424, 0, 0, 0, 1, 1,
-2.366977, 1.158094, -2.338329, 0, 0, 0, 1, 1,
-2.351505, 0.197357, -3.011171, 0, 0, 0, 1, 1,
-2.339505, -1.150689, -2.594507, 0, 0, 0, 1, 1,
-2.319691, 1.610618, -1.834935, 0, 0, 0, 1, 1,
-2.293751, 0.2429008, -0.9473799, 0, 0, 0, 1, 1,
-2.287686, -0.3424603, -1.425177, 1, 1, 1, 1, 1,
-2.270902, -0.1743808, -0.7119692, 1, 1, 1, 1, 1,
-2.237734, 0.8472826, 0.2681807, 1, 1, 1, 1, 1,
-2.22058, 1.425598, -2.584289, 1, 1, 1, 1, 1,
-2.207978, -0.3662768, -1.736922, 1, 1, 1, 1, 1,
-2.197663, -0.001701109, -0.5970333, 1, 1, 1, 1, 1,
-2.186207, -0.5124379, 0.1893525, 1, 1, 1, 1, 1,
-2.180952, -0.3646434, -1.3107, 1, 1, 1, 1, 1,
-2.108606, 0.5799888, -0.8546944, 1, 1, 1, 1, 1,
-2.095755, -1.844872, -5.659548, 1, 1, 1, 1, 1,
-2.047658, 0.2260804, -2.590132, 1, 1, 1, 1, 1,
-2.041276, 1.295708, -0.658858, 1, 1, 1, 1, 1,
-2.034017, -0.2878383, -2.463859, 1, 1, 1, 1, 1,
-2.029886, -0.3005931, -2.008836, 1, 1, 1, 1, 1,
-2.027607, -0.2729836, -2.663383, 1, 1, 1, 1, 1,
-2.020444, 0.5521966, 1.05769, 0, 0, 1, 1, 1,
-2.010637, -0.7227319, -2.675156, 1, 0, 0, 1, 1,
-1.999719, -0.0537864, -1.69073, 1, 0, 0, 1, 1,
-1.992104, 1.844878, 0.2342389, 1, 0, 0, 1, 1,
-1.962468, 0.6642709, -2.207441, 1, 0, 0, 1, 1,
-1.899763, -0.4234723, -1.695188, 1, 0, 0, 1, 1,
-1.823747, -1.483719, -2.506239, 0, 0, 0, 1, 1,
-1.763914, 1.980776, -1.121098, 0, 0, 0, 1, 1,
-1.756685, 0.5971554, -0.4269038, 0, 0, 0, 1, 1,
-1.744976, -0.5426623, -1.044865, 0, 0, 0, 1, 1,
-1.740753, -1.556838, -2.995279, 0, 0, 0, 1, 1,
-1.730732, -1.385774, -2.148113, 0, 0, 0, 1, 1,
-1.729169, 1.142054, -1.819022, 0, 0, 0, 1, 1,
-1.725871, -0.7657237, -3.337812, 1, 1, 1, 1, 1,
-1.725545, 1.567707, 0.1364704, 1, 1, 1, 1, 1,
-1.680995, -0.5407361, -1.765521, 1, 1, 1, 1, 1,
-1.646787, -0.1217292, -2.235271, 1, 1, 1, 1, 1,
-1.645553, 0.5595554, -1.79707, 1, 1, 1, 1, 1,
-1.633538, -0.8176793, -2.563347, 1, 1, 1, 1, 1,
-1.620239, 0.5254378, -2.850586, 1, 1, 1, 1, 1,
-1.595459, 0.9482771, -1.891585, 1, 1, 1, 1, 1,
-1.588991, 1.594291, -1.972611, 1, 1, 1, 1, 1,
-1.562238, -0.1472134, -1.638479, 1, 1, 1, 1, 1,
-1.555807, -0.09729806, -3.667811, 1, 1, 1, 1, 1,
-1.552121, -0.537026, -0.9070551, 1, 1, 1, 1, 1,
-1.536929, 1.436612, -0.944073, 1, 1, 1, 1, 1,
-1.533803, -0.4475343, -1.846574, 1, 1, 1, 1, 1,
-1.530135, -0.7329398, -2.818585, 1, 1, 1, 1, 1,
-1.51236, 0.4714446, -1.49202, 0, 0, 1, 1, 1,
-1.503065, -0.566924, -0.4206414, 1, 0, 0, 1, 1,
-1.4923, -1.093504, -0.854481, 1, 0, 0, 1, 1,
-1.490137, 0.7616063, -2.641765, 1, 0, 0, 1, 1,
-1.470276, 0.856689, -0.4045066, 1, 0, 0, 1, 1,
-1.451458, 0.08021332, 0.7362849, 1, 0, 0, 1, 1,
-1.448788, -1.550334, -0.7101357, 0, 0, 0, 1, 1,
-1.441584, -2.18066, -4.149134, 0, 0, 0, 1, 1,
-1.438329, 0.1370257, -2.255468, 0, 0, 0, 1, 1,
-1.433362, -0.5878134, -0.5088989, 0, 0, 0, 1, 1,
-1.428441, 0.254785, -0.6864228, 0, 0, 0, 1, 1,
-1.427968, 0.2172466, -0.3474461, 0, 0, 0, 1, 1,
-1.422874, 0.8013341, -2.353116, 0, 0, 0, 1, 1,
-1.379252, 0.3429701, -1.106091, 1, 1, 1, 1, 1,
-1.378957, -2.476731, -0.5956283, 1, 1, 1, 1, 1,
-1.374968, -0.8178928, -3.037182, 1, 1, 1, 1, 1,
-1.372107, -0.9012078, -1.700031, 1, 1, 1, 1, 1,
-1.34478, 0.233523, -1.93227, 1, 1, 1, 1, 1,
-1.344465, -1.060251, -2.312602, 1, 1, 1, 1, 1,
-1.320088, 0.09394652, -3.365661, 1, 1, 1, 1, 1,
-1.310193, 0.9348991, -0.9916579, 1, 1, 1, 1, 1,
-1.30839, 0.8604882, -0.8692864, 1, 1, 1, 1, 1,
-1.30794, 1.198042, -2.747175, 1, 1, 1, 1, 1,
-1.304912, 2.222172, 1.956685, 1, 1, 1, 1, 1,
-1.294448, 0.09849482, -1.75714, 1, 1, 1, 1, 1,
-1.288965, 0.064569, -1.11874, 1, 1, 1, 1, 1,
-1.27292, 1.725195, 0.3275327, 1, 1, 1, 1, 1,
-1.26896, 0.8972421, -1.167825, 1, 1, 1, 1, 1,
-1.259534, 0.6182605, -0.9336439, 0, 0, 1, 1, 1,
-1.25711, -1.282263, -2.344486, 1, 0, 0, 1, 1,
-1.226369, 0.3227572, -1.102181, 1, 0, 0, 1, 1,
-1.223977, 0.5590327, -0.424874, 1, 0, 0, 1, 1,
-1.223795, 0.7530801, -1.488461, 1, 0, 0, 1, 1,
-1.206808, 0.2954556, -3.897672, 1, 0, 0, 1, 1,
-1.204422, -1.037353, -1.719771, 0, 0, 0, 1, 1,
-1.201819, -0.5054493, -2.001658, 0, 0, 0, 1, 1,
-1.20121, 0.3879799, -2.297418, 0, 0, 0, 1, 1,
-1.198567, 0.3373334, -1.362485, 0, 0, 0, 1, 1,
-1.195465, -0.6577192, -1.766562, 0, 0, 0, 1, 1,
-1.190157, -0.733323, -0.7825301, 0, 0, 0, 1, 1,
-1.183923, -0.4827936, -0.735987, 0, 0, 0, 1, 1,
-1.181343, -0.7918966, -2.912385, 1, 1, 1, 1, 1,
-1.173038, -1.48722, -3.633179, 1, 1, 1, 1, 1,
-1.16972, -1.118789, -3.321998, 1, 1, 1, 1, 1,
-1.162013, -0.2935442, -3.409146, 1, 1, 1, 1, 1,
-1.160317, -0.9800079, -1.388069, 1, 1, 1, 1, 1,
-1.152926, -1.470261, -2.029472, 1, 1, 1, 1, 1,
-1.147147, 0.1440349, -2.026099, 1, 1, 1, 1, 1,
-1.137592, -0.08262806, -2.107208, 1, 1, 1, 1, 1,
-1.131055, -0.4270453, -0.6891348, 1, 1, 1, 1, 1,
-1.124961, 0.6112266, -0.6269468, 1, 1, 1, 1, 1,
-1.124872, -1.328241, -3.868362, 1, 1, 1, 1, 1,
-1.12383, 0.1351079, -1.462741, 1, 1, 1, 1, 1,
-1.120809, -1.862831, -1.65212, 1, 1, 1, 1, 1,
-1.115135, 0.09425823, -0.9769309, 1, 1, 1, 1, 1,
-1.112468, -0.8302353, -2.571627, 1, 1, 1, 1, 1,
-1.110296, 1.705836, 0.8603257, 0, 0, 1, 1, 1,
-1.098172, 0.8255178, -0.803197, 1, 0, 0, 1, 1,
-1.096087, 0.591422, -1.717403, 1, 0, 0, 1, 1,
-1.090294, -0.2048688, -1.147375, 1, 0, 0, 1, 1,
-1.080988, -1.207336, -3.072778, 1, 0, 0, 1, 1,
-1.080292, 0.415327, -1.135093, 1, 0, 0, 1, 1,
-1.078055, -0.6281756, -2.037683, 0, 0, 0, 1, 1,
-1.07795, 0.1178507, -3.683133, 0, 0, 0, 1, 1,
-1.075892, -1.013923, -2.785303, 0, 0, 0, 1, 1,
-1.072906, -1.917188, -1.563371, 0, 0, 0, 1, 1,
-1.067587, -0.3933586, -1.441248, 0, 0, 0, 1, 1,
-1.061172, 1.546831, -0.2205321, 0, 0, 0, 1, 1,
-1.059085, 0.1787354, -2.484846, 0, 0, 0, 1, 1,
-1.056916, 0.782208, -0.7093309, 1, 1, 1, 1, 1,
-1.05411, 1.422208, 1.032739, 1, 1, 1, 1, 1,
-1.053891, 0.4772678, 0.06604356, 1, 1, 1, 1, 1,
-1.050302, -1.250331, -3.536359, 1, 1, 1, 1, 1,
-1.048614, 1.312909, -2.16385, 1, 1, 1, 1, 1,
-1.047742, -1.025975, -3.038248, 1, 1, 1, 1, 1,
-1.04597, 0.9806926, -0.9809418, 1, 1, 1, 1, 1,
-1.045319, 1.00644, -0.5756109, 1, 1, 1, 1, 1,
-1.043553, -0.5080879, -2.477207, 1, 1, 1, 1, 1,
-1.039848, -0.8882294, -1.523782, 1, 1, 1, 1, 1,
-1.036001, -1.645418, -3.071123, 1, 1, 1, 1, 1,
-1.033862, 0.1007921, 0.0479505, 1, 1, 1, 1, 1,
-1.032359, 0.1249285, -1.07367, 1, 1, 1, 1, 1,
-1.028439, 0.5893393, 1.565936, 1, 1, 1, 1, 1,
-1.021831, 0.9042669, 0.07245731, 1, 1, 1, 1, 1,
-1.012717, 0.1909067, -1.679395, 0, 0, 1, 1, 1,
-1.000583, -1.877554, -3.265724, 1, 0, 0, 1, 1,
-0.9954022, 0.9366136, -2.685042, 1, 0, 0, 1, 1,
-0.9938512, 0.191849, -1.995409, 1, 0, 0, 1, 1,
-0.9914817, 0.3144644, 0.5305953, 1, 0, 0, 1, 1,
-0.9888575, -0.5590437, -2.132302, 1, 0, 0, 1, 1,
-0.9858316, 0.6904191, -0.5479251, 0, 0, 0, 1, 1,
-0.9787466, 0.648657, -1.074782, 0, 0, 0, 1, 1,
-0.9662859, -0.3272888, -1.085456, 0, 0, 0, 1, 1,
-0.9612721, 1.346968, -0.0736285, 0, 0, 0, 1, 1,
-0.9585177, -0.8748971, -2.950308, 0, 0, 0, 1, 1,
-0.9525941, 1.29831, -1.631554, 0, 0, 0, 1, 1,
-0.9495023, 0.5965607, -2.145893, 0, 0, 0, 1, 1,
-0.9432847, 0.9072075, -1.117471, 1, 1, 1, 1, 1,
-0.9422126, 2.053133, -2.195434, 1, 1, 1, 1, 1,
-0.9365361, -1.223477, -3.42236, 1, 1, 1, 1, 1,
-0.9329176, 0.6241946, -0.9579349, 1, 1, 1, 1, 1,
-0.9297765, -0.08869427, -0.6589581, 1, 1, 1, 1, 1,
-0.926143, -0.697818, -2.36346, 1, 1, 1, 1, 1,
-0.9253621, -1.313845, -4.452114, 1, 1, 1, 1, 1,
-0.9241008, -1.335413, -0.2224772, 1, 1, 1, 1, 1,
-0.9238024, 0.7033049, -1.462969, 1, 1, 1, 1, 1,
-0.9199463, 0.873272, -1.830301, 1, 1, 1, 1, 1,
-0.9186832, -0.109081, -2.259628, 1, 1, 1, 1, 1,
-0.9186106, 0.1162266, 0.01234352, 1, 1, 1, 1, 1,
-0.9080384, -1.009703, 0.4064817, 1, 1, 1, 1, 1,
-0.9070738, 0.2236241, -2.075927, 1, 1, 1, 1, 1,
-0.9026604, 0.579424, -1.238036, 1, 1, 1, 1, 1,
-0.8997623, 0.8088439, -1.306611, 0, 0, 1, 1, 1,
-0.8979086, 0.7883576, -1.623579, 1, 0, 0, 1, 1,
-0.8976877, -1.393632, -1.742719, 1, 0, 0, 1, 1,
-0.8830311, -1.482618, -1.974189, 1, 0, 0, 1, 1,
-0.8815085, 0.3627465, -2.385293, 1, 0, 0, 1, 1,
-0.8780156, -1.173089, -1.510158, 1, 0, 0, 1, 1,
-0.8723137, -0.4792304, -2.204594, 0, 0, 0, 1, 1,
-0.870665, 2.912062, -0.4902782, 0, 0, 0, 1, 1,
-0.8465639, -2.200594, -2.437286, 0, 0, 0, 1, 1,
-0.8461851, -1.259841, -2.523326, 0, 0, 0, 1, 1,
-0.8451931, 0.8081452, -2.255312, 0, 0, 0, 1, 1,
-0.8445129, -0.006085902, -2.069256, 0, 0, 0, 1, 1,
-0.8415669, 0.3891431, -1.120254, 0, 0, 0, 1, 1,
-0.8402249, 0.5141492, -2.585155, 1, 1, 1, 1, 1,
-0.8351898, 1.828633, 0.3497005, 1, 1, 1, 1, 1,
-0.8328731, -0.3919078, 0.03707116, 1, 1, 1, 1, 1,
-0.8301646, -1.196759, -2.129248, 1, 1, 1, 1, 1,
-0.8299856, -1.771771, -1.418574, 1, 1, 1, 1, 1,
-0.8281241, -0.8311834, -1.971412, 1, 1, 1, 1, 1,
-0.8248692, 0.5951297, -1.061224, 1, 1, 1, 1, 1,
-0.8237953, 0.2644268, -0.2163821, 1, 1, 1, 1, 1,
-0.8177189, 1.090623, -1.768424, 1, 1, 1, 1, 1,
-0.816374, 0.5432152, -0.3076901, 1, 1, 1, 1, 1,
-0.8123641, -1.442122, -3.379057, 1, 1, 1, 1, 1,
-0.809047, -1.816369, -2.906211, 1, 1, 1, 1, 1,
-0.8046843, 0.04038159, -1.761997, 1, 1, 1, 1, 1,
-0.8043952, 0.1342781, -1.487165, 1, 1, 1, 1, 1,
-0.8030871, 0.3903191, 0.1875492, 1, 1, 1, 1, 1,
-0.8013961, 0.1806529, -1.981643, 0, 0, 1, 1, 1,
-0.7983473, -0.7165473, -1.434747, 1, 0, 0, 1, 1,
-0.7961309, -1.438913, -4.130731, 1, 0, 0, 1, 1,
-0.794171, -1.368544, -1.806323, 1, 0, 0, 1, 1,
-0.7882335, 0.4393072, -0.8532711, 1, 0, 0, 1, 1,
-0.7847531, -0.2265734, -1.767843, 1, 0, 0, 1, 1,
-0.7801587, -0.5658516, -4.049063, 0, 0, 0, 1, 1,
-0.7785995, -0.6491778, -1.086738, 0, 0, 0, 1, 1,
-0.7766427, -0.4005336, -1.324302, 0, 0, 0, 1, 1,
-0.7718402, -0.2075876, -2.635884, 0, 0, 0, 1, 1,
-0.7713029, -0.4154262, -2.89146, 0, 0, 0, 1, 1,
-0.7607024, 2.631906, -0.1662453, 0, 0, 0, 1, 1,
-0.7482172, -0.2821679, -0.7472522, 0, 0, 0, 1, 1,
-0.7475145, -0.04928238, -1.505079, 1, 1, 1, 1, 1,
-0.746042, -0.6545545, -1.546051, 1, 1, 1, 1, 1,
-0.7403899, -1.007566, -2.540755, 1, 1, 1, 1, 1,
-0.7373292, -0.4827522, -1.9008, 1, 1, 1, 1, 1,
-0.7337328, 1.145002, -2.314116, 1, 1, 1, 1, 1,
-0.7328909, 0.9727391, -0.8186413, 1, 1, 1, 1, 1,
-0.7263295, -0.1531897, -3.647828, 1, 1, 1, 1, 1,
-0.7239928, -0.6916553, -1.963188, 1, 1, 1, 1, 1,
-0.7221767, 0.2601382, -1.812709, 1, 1, 1, 1, 1,
-0.715201, -0.02270206, -1.168776, 1, 1, 1, 1, 1,
-0.7128253, 1.693582, -0.9590006, 1, 1, 1, 1, 1,
-0.7061932, 0.5287274, -1.238223, 1, 1, 1, 1, 1,
-0.7053033, -0.211692, -1.529075, 1, 1, 1, 1, 1,
-0.7039727, 0.680104, -2.52371, 1, 1, 1, 1, 1,
-0.7011704, -0.9496421, -1.876516, 1, 1, 1, 1, 1,
-0.6994742, -0.8822727, -4.496936, 0, 0, 1, 1, 1,
-0.6990632, -0.3507068, -1.305315, 1, 0, 0, 1, 1,
-0.6981975, -1.034962, -3.431885, 1, 0, 0, 1, 1,
-0.6961342, -0.2718138, -2.055239, 1, 0, 0, 1, 1,
-0.688587, 1.617095, -1.069535, 1, 0, 0, 1, 1,
-0.6852387, 0.5433474, 0.4717242, 1, 0, 0, 1, 1,
-0.6803353, -1.674516, -2.941765, 0, 0, 0, 1, 1,
-0.668012, -0.7192601, -1.768787, 0, 0, 0, 1, 1,
-0.6672685, 1.266958, -1.944607, 0, 0, 0, 1, 1,
-0.6662078, -0.1479383, 0.4454153, 0, 0, 0, 1, 1,
-0.6658772, 0.3429129, -0.9268698, 0, 0, 0, 1, 1,
-0.6652833, 0.02591783, -1.110347, 0, 0, 0, 1, 1,
-0.6598561, -0.3179525, -3.34274, 0, 0, 0, 1, 1,
-0.6590721, -0.4853745, -2.079837, 1, 1, 1, 1, 1,
-0.6561607, 0.4951533, -3.431707, 1, 1, 1, 1, 1,
-0.6536469, -0.5462486, -2.962953, 1, 1, 1, 1, 1,
-0.653478, 0.5067616, -0.0810889, 1, 1, 1, 1, 1,
-0.6519977, 0.2621997, -1.248614, 1, 1, 1, 1, 1,
-0.6503754, -0.4696291, -2.262967, 1, 1, 1, 1, 1,
-0.6490548, -0.303575, -2.12781, 1, 1, 1, 1, 1,
-0.6422148, 0.03206269, 0.2623491, 1, 1, 1, 1, 1,
-0.6397359, -2.056467, -1.095864, 1, 1, 1, 1, 1,
-0.638846, 0.882705, -3.200751, 1, 1, 1, 1, 1,
-0.632271, -1.236769, -2.491976, 1, 1, 1, 1, 1,
-0.6234775, 0.5268495, -1.721271, 1, 1, 1, 1, 1,
-0.6221988, -1.623355, -1.920698, 1, 1, 1, 1, 1,
-0.6214318, 0.7973478, 0.8806714, 1, 1, 1, 1, 1,
-0.617616, -1.164248, -2.390713, 1, 1, 1, 1, 1,
-0.6148048, -0.4004571, -1.837691, 0, 0, 1, 1, 1,
-0.6091751, 0.5649891, -0.7135976, 1, 0, 0, 1, 1,
-0.6068156, 1.04622, -0.8014621, 1, 0, 0, 1, 1,
-0.6066577, 0.1752056, 0.2344814, 1, 0, 0, 1, 1,
-0.6064092, -1.454395, -2.369053, 1, 0, 0, 1, 1,
-0.6059899, 0.08693909, -1.80357, 1, 0, 0, 1, 1,
-0.6009387, -1.994751, -3.428353, 0, 0, 0, 1, 1,
-0.6008853, 1.129196, -0.8591233, 0, 0, 0, 1, 1,
-0.5983543, -0.2407996, -1.300099, 0, 0, 0, 1, 1,
-0.5980877, -1.966191, -3.59868, 0, 0, 0, 1, 1,
-0.5881963, -0.1935253, -1.516009, 0, 0, 0, 1, 1,
-0.5804007, -1.890182, -4.18388, 0, 0, 0, 1, 1,
-0.5777484, -0.04245214, -2.040295, 0, 0, 0, 1, 1,
-0.5697365, 0.0001891644, -1.206244, 1, 1, 1, 1, 1,
-0.5641787, -0.8403258, -4.502297, 1, 1, 1, 1, 1,
-0.5638603, 0.3198603, -1.1637, 1, 1, 1, 1, 1,
-0.5606418, -1.117291, -1.080438, 1, 1, 1, 1, 1,
-0.5552762, -0.8127034, -3.749433, 1, 1, 1, 1, 1,
-0.5512719, 0.9266515, -1.687949, 1, 1, 1, 1, 1,
-0.5488314, 0.004368858, -0.7591004, 1, 1, 1, 1, 1,
-0.5480635, -1.169107, -3.315256, 1, 1, 1, 1, 1,
-0.5479925, -1.044167, -4.568863, 1, 1, 1, 1, 1,
-0.5445558, 1.37842, 0.90592, 1, 1, 1, 1, 1,
-0.5392009, 0.8672639, 0.3266927, 1, 1, 1, 1, 1,
-0.5360011, 0.2142902, -0.2553703, 1, 1, 1, 1, 1,
-0.5338327, -1.569158, -3.686633, 1, 1, 1, 1, 1,
-0.5334233, 0.6379987, -0.1538713, 1, 1, 1, 1, 1,
-0.5331199, -0.9633385, -2.251374, 1, 1, 1, 1, 1,
-0.531094, -0.4162374, -1.543723, 0, 0, 1, 1, 1,
-0.528029, -0.9063016, -2.031159, 1, 0, 0, 1, 1,
-0.5272148, -0.2309777, -1.632239, 1, 0, 0, 1, 1,
-0.5247361, 1.235048, 0.3665827, 1, 0, 0, 1, 1,
-0.5239372, -0.4207696, -2.79683, 1, 0, 0, 1, 1,
-0.5195934, -0.1678432, -3.683752, 1, 0, 0, 1, 1,
-0.5180597, 0.8629568, 0.08276574, 0, 0, 0, 1, 1,
-0.5178115, 1.240016, -1.253526, 0, 0, 0, 1, 1,
-0.5146528, 0.03799615, -0.7546381, 0, 0, 0, 1, 1,
-0.5101825, -1.385124, -1.818871, 0, 0, 0, 1, 1,
-0.5098147, 0.9854516, -1.003742, 0, 0, 0, 1, 1,
-0.5085046, 0.7447928, 0.06001108, 0, 0, 0, 1, 1,
-0.5067984, 0.3640749, -0.3595971, 0, 0, 0, 1, 1,
-0.5027313, 1.805186, -0.9487984, 1, 1, 1, 1, 1,
-0.5025931, -0.8398844, -2.273803, 1, 1, 1, 1, 1,
-0.4861166, -0.682932, -3.186921, 1, 1, 1, 1, 1,
-0.4824504, -1.619506, -3.431103, 1, 1, 1, 1, 1,
-0.4802263, 0.02651892, -1.968657, 1, 1, 1, 1, 1,
-0.4751721, -1.257373, -2.308569, 1, 1, 1, 1, 1,
-0.4731874, 1.150174, 0.04720155, 1, 1, 1, 1, 1,
-0.4723168, -0.635736, -1.854219, 1, 1, 1, 1, 1,
-0.4707474, 0.7391074, -1.730929, 1, 1, 1, 1, 1,
-0.4676408, 0.7433962, -2.313354, 1, 1, 1, 1, 1,
-0.4661185, -1.017961, -1.249743, 1, 1, 1, 1, 1,
-0.4594053, 0.7920008, -0.6273663, 1, 1, 1, 1, 1,
-0.4584323, 0.6855747, 0.4064985, 1, 1, 1, 1, 1,
-0.4575447, 0.3042495, -0.9971409, 1, 1, 1, 1, 1,
-0.4567207, 0.7491619, 0.2600708, 1, 1, 1, 1, 1,
-0.4552194, -0.5500249, -1.657459, 0, 0, 1, 1, 1,
-0.4539208, -0.6572227, -3.018488, 1, 0, 0, 1, 1,
-0.4524825, -0.2994225, -1.387393, 1, 0, 0, 1, 1,
-0.4516659, 0.5013662, -1.143463, 1, 0, 0, 1, 1,
-0.4505307, 0.9833344, -0.7958581, 1, 0, 0, 1, 1,
-0.4449423, -0.6602723, -2.84931, 1, 0, 0, 1, 1,
-0.4448603, 0.7969697, -0.9333685, 0, 0, 0, 1, 1,
-0.4368434, -2.050624, -3.641999, 0, 0, 0, 1, 1,
-0.4343888, 1.012661, -2.699949, 0, 0, 0, 1, 1,
-0.4324029, -0.08164797, -2.056019, 0, 0, 0, 1, 1,
-0.4318047, 1.210928, 0.4627071, 0, 0, 0, 1, 1,
-0.4277169, -0.2292945, -0.9983913, 0, 0, 0, 1, 1,
-0.4167096, 0.6817936, -1.915613, 0, 0, 0, 1, 1,
-0.4151405, -1.133374, -2.826928, 1, 1, 1, 1, 1,
-0.4129779, -0.9936896, -3.546475, 1, 1, 1, 1, 1,
-0.411796, -0.3614472, -1.977422, 1, 1, 1, 1, 1,
-0.4092247, 0.1784992, -0.2417791, 1, 1, 1, 1, 1,
-0.4030325, -0.5697721, -3.473975, 1, 1, 1, 1, 1,
-0.4029178, -1.511816, -3.594538, 1, 1, 1, 1, 1,
-0.4029031, -0.4286094, -0.7582916, 1, 1, 1, 1, 1,
-0.4018048, -0.5148069, -2.947874, 1, 1, 1, 1, 1,
-0.3982816, 0.3856453, 0.06894561, 1, 1, 1, 1, 1,
-0.3943779, -0.4155009, -2.799859, 1, 1, 1, 1, 1,
-0.3934156, -1.100442, -3.622504, 1, 1, 1, 1, 1,
-0.3883632, 0.1510913, -1.351978, 1, 1, 1, 1, 1,
-0.3823118, 1.725004, -0.4263174, 1, 1, 1, 1, 1,
-0.3822612, -0.7369802, -1.910956, 1, 1, 1, 1, 1,
-0.3801337, 0.5353264, -2.15627, 1, 1, 1, 1, 1,
-0.3797812, 0.588913, 0.4768554, 0, 0, 1, 1, 1,
-0.3732471, 0.4865841, -0.08517382, 1, 0, 0, 1, 1,
-0.3710993, 0.1080112, -0.4104421, 1, 0, 0, 1, 1,
-0.3702113, 0.8047161, 0.2015712, 1, 0, 0, 1, 1,
-0.367675, 0.03704027, -3.493231, 1, 0, 0, 1, 1,
-0.3657875, -0.6677834, -2.049059, 1, 0, 0, 1, 1,
-0.364684, -1.301285, -2.833554, 0, 0, 0, 1, 1,
-0.3631248, -1.725157, -3.817929, 0, 0, 0, 1, 1,
-0.3570483, 0.1016428, -2.524977, 0, 0, 0, 1, 1,
-0.3483501, 0.3168615, -0.2434292, 0, 0, 0, 1, 1,
-0.3449423, 0.7901797, -0.5761379, 0, 0, 0, 1, 1,
-0.3439026, 1.269212, -1.400108, 0, 0, 0, 1, 1,
-0.3427594, -0.3206746, -3.758242, 0, 0, 0, 1, 1,
-0.3425645, -0.1709402, -2.473734, 1, 1, 1, 1, 1,
-0.3394088, 0.5324552, 0.4282444, 1, 1, 1, 1, 1,
-0.3331515, -1.855029, -2.461614, 1, 1, 1, 1, 1,
-0.3312574, 0.811223, -0.2570985, 1, 1, 1, 1, 1,
-0.3288965, -0.5901761, -3.442288, 1, 1, 1, 1, 1,
-0.327916, 0.6294159, 0.3993511, 1, 1, 1, 1, 1,
-0.3264151, -1.067868, -2.979763, 1, 1, 1, 1, 1,
-0.3263073, -2.094656, -2.715897, 1, 1, 1, 1, 1,
-0.3220265, 0.2025777, -0.1912844, 1, 1, 1, 1, 1,
-0.3153709, 0.9584429, 0.8571949, 1, 1, 1, 1, 1,
-0.3109613, 0.115406, -1.437251, 1, 1, 1, 1, 1,
-0.3088508, 1.074916, -0.2625186, 1, 1, 1, 1, 1,
-0.3052564, -0.3072947, -0.9470735, 1, 1, 1, 1, 1,
-0.3036655, 1.088416, -1.208499, 1, 1, 1, 1, 1,
-0.2969269, -2.565443, -3.831003, 1, 1, 1, 1, 1,
-0.2945923, -0.1565934, -0.7137516, 0, 0, 1, 1, 1,
-0.2921214, 1.691934, 0.06538241, 1, 0, 0, 1, 1,
-0.2860406, -0.1508647, -2.34903, 1, 0, 0, 1, 1,
-0.2795688, -0.01214991, -1.182418, 1, 0, 0, 1, 1,
-0.2786666, 0.3032699, -1.520818, 1, 0, 0, 1, 1,
-0.2782767, 0.2672385, 1.627729, 1, 0, 0, 1, 1,
-0.272678, -2.75119, -4.610296, 0, 0, 0, 1, 1,
-0.2719237, 0.9559245, 0.7580836, 0, 0, 0, 1, 1,
-0.2707953, 0.6295618, 1.0848, 0, 0, 0, 1, 1,
-0.2662181, 1.587435, -1.225094, 0, 0, 0, 1, 1,
-0.2613826, -1.29092, -2.291456, 0, 0, 0, 1, 1,
-0.2604893, 0.3163315, -0.6142123, 0, 0, 0, 1, 1,
-0.2599823, 1.446215, -1.938718, 0, 0, 0, 1, 1,
-0.2537233, 2.136881, -0.3428354, 1, 1, 1, 1, 1,
-0.2520172, 0.4863763, -0.9377756, 1, 1, 1, 1, 1,
-0.2519972, -1.644961, -3.800352, 1, 1, 1, 1, 1,
-0.2514898, -1.531559, -2.483207, 1, 1, 1, 1, 1,
-0.2512921, 0.8827842, 1.55051, 1, 1, 1, 1, 1,
-0.247578, 0.6391435, -0.823598, 1, 1, 1, 1, 1,
-0.2420717, 1.094224, 0.2645106, 1, 1, 1, 1, 1,
-0.2404688, 0.7280388, -1.058732, 1, 1, 1, 1, 1,
-0.2343905, -0.05049379, -1.495699, 1, 1, 1, 1, 1,
-0.2340626, 0.6043911, 0.08238976, 1, 1, 1, 1, 1,
-0.233734, 0.4470678, -0.8897071, 1, 1, 1, 1, 1,
-0.2334888, -0.4424036, -1.676497, 1, 1, 1, 1, 1,
-0.2328534, 1.89572, 0.9615878, 1, 1, 1, 1, 1,
-0.2316151, 0.3929316, -0.7390729, 1, 1, 1, 1, 1,
-0.224417, -0.07628347, -1.174385, 1, 1, 1, 1, 1,
-0.2242692, -0.06636167, -2.718011, 0, 0, 1, 1, 1,
-0.2215322, 1.357166, -0.7423475, 1, 0, 0, 1, 1,
-0.2195646, 0.4380848, -2.006455, 1, 0, 0, 1, 1,
-0.2152595, 0.513522, -0.3370042, 1, 0, 0, 1, 1,
-0.2150189, -1.213415, -2.473717, 1, 0, 0, 1, 1,
-0.2149928, -1.215361, -2.897025, 1, 0, 0, 1, 1,
-0.2098308, 0.5237329, -1.230768, 0, 0, 0, 1, 1,
-0.2086599, -1.401522, -3.282624, 0, 0, 0, 1, 1,
-0.2064828, 1.013529, 0.03107981, 0, 0, 0, 1, 1,
-0.2025819, 1.265341, 0.3341651, 0, 0, 0, 1, 1,
-0.1995755, -0.408123, -1.754696, 0, 0, 0, 1, 1,
-0.1957039, -0.01160111, -2.265221, 0, 0, 0, 1, 1,
-0.1952515, -1.678677, -2.659853, 0, 0, 0, 1, 1,
-0.1904228, 0.5858554, -0.1152974, 1, 1, 1, 1, 1,
-0.1884604, 0.6968439, 0.7091128, 1, 1, 1, 1, 1,
-0.1883111, -0.7194957, -2.433516, 1, 1, 1, 1, 1,
-0.1882865, -0.1145362, -2.519716, 1, 1, 1, 1, 1,
-0.1882761, 1.786946, 0.6244653, 1, 1, 1, 1, 1,
-0.1857602, -0.4547703, -2.179608, 1, 1, 1, 1, 1,
-0.1842635, -1.194194, -3.316158, 1, 1, 1, 1, 1,
-0.1839768, -0.4942591, -3.326639, 1, 1, 1, 1, 1,
-0.1835654, -0.4238884, -2.198275, 1, 1, 1, 1, 1,
-0.1835632, -0.06975302, -1.587195, 1, 1, 1, 1, 1,
-0.1801055, -0.8683672, -1.572639, 1, 1, 1, 1, 1,
-0.1780045, -0.4282992, -3.038253, 1, 1, 1, 1, 1,
-0.1773895, 0.1349338, 0.6066081, 1, 1, 1, 1, 1,
-0.1749059, 0.1325462, -1.208352, 1, 1, 1, 1, 1,
-0.1736003, -0.238345, -1.929058, 1, 1, 1, 1, 1,
-0.1718609, 0.968366, -0.8410022, 0, 0, 1, 1, 1,
-0.1659651, -0.09016865, -4.597034, 1, 0, 0, 1, 1,
-0.1630393, 1.404395, 0.7139543, 1, 0, 0, 1, 1,
-0.1605826, 0.3585683, -0.8752263, 1, 0, 0, 1, 1,
-0.1530292, 0.7183322, 1.454968, 1, 0, 0, 1, 1,
-0.152422, -1.081664, -2.750584, 1, 0, 0, 1, 1,
-0.1454282, 1.620858, 0.3474763, 0, 0, 0, 1, 1,
-0.1448352, 0.1170452, -0.4827299, 0, 0, 0, 1, 1,
-0.1423968, 0.4931251, 0.3122817, 0, 0, 0, 1, 1,
-0.1401815, 0.9283527, 1.104977, 0, 0, 0, 1, 1,
-0.1331765, 1.724309, -0.9977436, 0, 0, 0, 1, 1,
-0.1322839, -0.02783848, -2.221738, 0, 0, 0, 1, 1,
-0.1290332, 1.001293, 0.06851029, 0, 0, 0, 1, 1,
-0.1267866, -0.9031418, -2.797981, 1, 1, 1, 1, 1,
-0.1227825, -2.077423, -4.007215, 1, 1, 1, 1, 1,
-0.1204032, 1.815612, 1.357142, 1, 1, 1, 1, 1,
-0.1143774, 1.745701, -0.8182226, 1, 1, 1, 1, 1,
-0.1138781, 1.539155, 0.148391, 1, 1, 1, 1, 1,
-0.1125825, -0.7039777, -2.057225, 1, 1, 1, 1, 1,
-0.1123314, -0.4188078, -1.533025, 1, 1, 1, 1, 1,
-0.110625, -0.4803362, -3.018762, 1, 1, 1, 1, 1,
-0.1103452, 0.5529062, -1.873301, 1, 1, 1, 1, 1,
-0.1102306, -0.08071396, -3.181041, 1, 1, 1, 1, 1,
-0.1076911, 0.05513173, -0.59411, 1, 1, 1, 1, 1,
-0.1046135, 0.3689922, -1.510599, 1, 1, 1, 1, 1,
-0.1041671, 1.521145, 0.2916521, 1, 1, 1, 1, 1,
-0.1040446, -0.620509, -4.653244, 1, 1, 1, 1, 1,
-0.1035901, 0.2859787, -0.02006128, 1, 1, 1, 1, 1,
-0.1031499, -0.9736217, -2.76099, 0, 0, 1, 1, 1,
-0.1023785, -1.903118, -3.500982, 1, 0, 0, 1, 1,
-0.1022746, 0.9969707, -0.5604126, 1, 0, 0, 1, 1,
-0.09422575, -0.5111321, -2.725633, 1, 0, 0, 1, 1,
-0.09408421, -0.5258672, -4.114524, 1, 0, 0, 1, 1,
-0.09353033, 0.3618494, 1.071756, 1, 0, 0, 1, 1,
-0.09195966, -0.8085161, -1.927261, 0, 0, 0, 1, 1,
-0.09125575, -0.1954653, -2.630589, 0, 0, 0, 1, 1,
-0.09073991, 0.4714561, 0.7445171, 0, 0, 0, 1, 1,
-0.08523531, -0.8954557, -3.227393, 0, 0, 0, 1, 1,
-0.08368969, -1.225365, -3.265518, 0, 0, 0, 1, 1,
-0.07541267, -1.052636, -3.566016, 0, 0, 0, 1, 1,
-0.06491397, -1.311957, -1.214778, 0, 0, 0, 1, 1,
-0.06440134, 0.6980523, -0.55948, 1, 1, 1, 1, 1,
-0.06309192, -0.8144328, -4.044167, 1, 1, 1, 1, 1,
-0.06119292, 1.593052, -1.028797, 1, 1, 1, 1, 1,
-0.06042027, -0.7340748, -2.392422, 1, 1, 1, 1, 1,
-0.0590058, -0.01131332, -1.696482, 1, 1, 1, 1, 1,
-0.05858513, -1.202054, -3.049195, 1, 1, 1, 1, 1,
-0.05747352, 1.527238, -0.195511, 1, 1, 1, 1, 1,
-0.05426399, -0.1061927, -2.514031, 1, 1, 1, 1, 1,
-0.05417028, 2.103326, -0.0863383, 1, 1, 1, 1, 1,
-0.05257662, 0.8428996, 1.132362, 1, 1, 1, 1, 1,
-0.05162593, -1.232388, -3.985423, 1, 1, 1, 1, 1,
-0.04798223, 0.01243623, -3.056403, 1, 1, 1, 1, 1,
-0.04774935, -1.000547, -2.721318, 1, 1, 1, 1, 1,
-0.04086872, 0.6609174, -1.21457, 1, 1, 1, 1, 1,
-0.04009779, -0.7750355, -1.530128, 1, 1, 1, 1, 1,
-0.03645073, -0.5482675, -2.411175, 0, 0, 1, 1, 1,
-0.03635339, 2.104665, -0.8903339, 1, 0, 0, 1, 1,
-0.03416103, -2.353695, -2.294346, 1, 0, 0, 1, 1,
-0.03256661, -0.3563875, -1.818282, 1, 0, 0, 1, 1,
-0.0321846, -1.406515, -3.346623, 1, 0, 0, 1, 1,
-0.03175187, -0.4827814, -4.044172, 1, 0, 0, 1, 1,
-0.02659198, 0.0599051, -0.4437151, 0, 0, 0, 1, 1,
-0.02226937, -0.007083997, -3.72079, 0, 0, 0, 1, 1,
-0.0214511, -1.247175, -1.926145, 0, 0, 0, 1, 1,
-0.01915355, -1.922255, -4.914536, 0, 0, 0, 1, 1,
-0.01630416, -1.406815, -3.67692, 0, 0, 0, 1, 1,
-0.01346875, -0.5514511, -2.777548, 0, 0, 0, 1, 1,
-0.0110741, -0.2048013, -5.481037, 0, 0, 0, 1, 1,
-0.01001555, 1.49496, 0.627329, 1, 1, 1, 1, 1,
-0.008237211, 1.533547, 0.2264899, 1, 1, 1, 1, 1,
-0.007655914, 0.6263209, 0.7743714, 1, 1, 1, 1, 1,
-0.006859073, -0.7743912, -3.043971, 1, 1, 1, 1, 1,
-0.004627259, -0.2730174, -3.011368, 1, 1, 1, 1, 1,
0.004037049, -0.9778677, 2.503102, 1, 1, 1, 1, 1,
0.00460386, 1.274528, 0.01321965, 1, 1, 1, 1, 1,
0.007834028, 0.8339791, 0.8190328, 1, 1, 1, 1, 1,
0.009196522, -1.535843, 4.452403, 1, 1, 1, 1, 1,
0.01039792, 0.5699408, -1.114163, 1, 1, 1, 1, 1,
0.02759676, 0.4225725, 2.605837, 1, 1, 1, 1, 1,
0.02786259, -1.034567, 3.176701, 1, 1, 1, 1, 1,
0.02900328, -0.4601533, 4.091826, 1, 1, 1, 1, 1,
0.03223778, 0.03239473, 0.6803506, 1, 1, 1, 1, 1,
0.03481062, 0.2196492, 1.08135, 1, 1, 1, 1, 1,
0.04329142, 0.3725949, 0.1027675, 0, 0, 1, 1, 1,
0.04414294, 0.4453558, -1.348612, 1, 0, 0, 1, 1,
0.04662937, 0.4547631, 0.05518384, 1, 0, 0, 1, 1,
0.06168859, -1.280218, 3.773868, 1, 0, 0, 1, 1,
0.06470533, 1.276201, 0.02184177, 1, 0, 0, 1, 1,
0.06493047, -0.3354973, 4.777676, 1, 0, 0, 1, 1,
0.06690887, 0.03384553, 1.757848, 0, 0, 0, 1, 1,
0.06806524, -1.545299, 5.168837, 0, 0, 0, 1, 1,
0.06811887, 0.7860427, 0.459213, 0, 0, 0, 1, 1,
0.07029402, 0.6362035, -0.2354535, 0, 0, 0, 1, 1,
0.0748861, -1.044754, 2.750788, 0, 0, 0, 1, 1,
0.08065085, -0.07645654, -0.3920702, 0, 0, 0, 1, 1,
0.08425905, 0.1747451, 1.35467, 0, 0, 0, 1, 1,
0.08563186, -0.2111935, 4.23405, 1, 1, 1, 1, 1,
0.09293721, -0.2343235, 2.052815, 1, 1, 1, 1, 1,
0.09551679, 0.5839805, -1.133082, 1, 1, 1, 1, 1,
0.09830707, -1.035915, 3.428238, 1, 1, 1, 1, 1,
0.0992315, 0.611349, 1.604913, 1, 1, 1, 1, 1,
0.1056678, 0.2407783, -0.08305954, 1, 1, 1, 1, 1,
0.1066772, 0.1943964, 1.340153, 1, 1, 1, 1, 1,
0.1086117, 0.01302565, 0.8719289, 1, 1, 1, 1, 1,
0.1105214, 0.5192858, 0.08467891, 1, 1, 1, 1, 1,
0.1119402, -0.9618953, 5.332135, 1, 1, 1, 1, 1,
0.1188891, -0.01160702, 2.025182, 1, 1, 1, 1, 1,
0.1305955, -0.6046519, 2.350539, 1, 1, 1, 1, 1,
0.1323467, 1.683185, -1.418843, 1, 1, 1, 1, 1,
0.1415061, 0.05529308, 1.978902, 1, 1, 1, 1, 1,
0.1425782, 0.5579483, 0.2151744, 1, 1, 1, 1, 1,
0.1432083, 0.1706656, 0.360793, 0, 0, 1, 1, 1,
0.1433071, 0.2837906, 0.9190716, 1, 0, 0, 1, 1,
0.1444341, 2.630808, 0.769969, 1, 0, 0, 1, 1,
0.147216, 1.034807, 1.257864, 1, 0, 0, 1, 1,
0.1495741, 0.3022854, 0.3356637, 1, 0, 0, 1, 1,
0.1513624, 1.610183, 0.5418528, 1, 0, 0, 1, 1,
0.1549403, 0.3683073, 1.230558, 0, 0, 0, 1, 1,
0.1553105, 0.6301032, 1.133668, 0, 0, 0, 1, 1,
0.1617916, -1.179437, 1.707792, 0, 0, 0, 1, 1,
0.1635127, -0.1018702, 1.679631, 0, 0, 0, 1, 1,
0.1635659, 0.0734323, 0.3121534, 0, 0, 0, 1, 1,
0.169102, 0.8739083, 0.07663229, 0, 0, 0, 1, 1,
0.1710282, 0.006692847, -0.1417798, 0, 0, 0, 1, 1,
0.1767521, 1.139616, 1.348949, 1, 1, 1, 1, 1,
0.1790701, 0.9343688, 0.8026838, 1, 1, 1, 1, 1,
0.1797942, -0.8599504, 2.487693, 1, 1, 1, 1, 1,
0.18076, -0.2297488, 2.95567, 1, 1, 1, 1, 1,
0.185226, -0.7386349, 3.05549, 1, 1, 1, 1, 1,
0.1918435, -0.3572775, 2.446629, 1, 1, 1, 1, 1,
0.1960126, 0.5977606, 1.558707, 1, 1, 1, 1, 1,
0.1995548, 1.293842, -0.3490708, 1, 1, 1, 1, 1,
0.2081914, 0.02304704, 0.9823838, 1, 1, 1, 1, 1,
0.2125815, -0.02111844, 0.869094, 1, 1, 1, 1, 1,
0.2130242, -0.05437949, 0.9486428, 1, 1, 1, 1, 1,
0.2130741, 1.250202, -1.667178, 1, 1, 1, 1, 1,
0.21365, -0.7242914, 3.720449, 1, 1, 1, 1, 1,
0.2152263, -1.691333, 3.383105, 1, 1, 1, 1, 1,
0.2181877, -0.462144, 2.200505, 1, 1, 1, 1, 1,
0.2240949, 0.4737228, 2.008723, 0, 0, 1, 1, 1,
0.2270407, 0.3230465, -0.6327626, 1, 0, 0, 1, 1,
0.2277404, -0.4914682, 2.258528, 1, 0, 0, 1, 1,
0.2320709, 0.1914073, 0.04141698, 1, 0, 0, 1, 1,
0.2332958, -0.943987, 2.818909, 1, 0, 0, 1, 1,
0.2346855, 0.494112, 1.958603, 1, 0, 0, 1, 1,
0.2368977, -0.3735304, 1.255714, 0, 0, 0, 1, 1,
0.2404795, -0.7966272, 1.570721, 0, 0, 0, 1, 1,
0.2426926, 0.03120576, 0.839795, 0, 0, 0, 1, 1,
0.244976, 0.8571332, -1.746842, 0, 0, 0, 1, 1,
0.246533, 0.3402747, 1.002868, 0, 0, 0, 1, 1,
0.2473768, 0.4536486, 2.329308, 0, 0, 0, 1, 1,
0.2562183, -0.03365917, 1.447942, 0, 0, 0, 1, 1,
0.2582283, -0.0343018, 1.69913, 1, 1, 1, 1, 1,
0.2626958, -0.9040587, 2.905506, 1, 1, 1, 1, 1,
0.2645151, 1.057754, 0.6712177, 1, 1, 1, 1, 1,
0.2650674, -1.99403, 2.568271, 1, 1, 1, 1, 1,
0.2654777, 0.8566119, 1.829839, 1, 1, 1, 1, 1,
0.2666385, -1.235718, 3.278225, 1, 1, 1, 1, 1,
0.2721168, -0.7934514, 2.872236, 1, 1, 1, 1, 1,
0.2721382, -1.198332, 2.062769, 1, 1, 1, 1, 1,
0.2734507, -0.4704581, 2.354528, 1, 1, 1, 1, 1,
0.2784097, -0.451151, 5.308413, 1, 1, 1, 1, 1,
0.2842424, -0.4836555, 2.435095, 1, 1, 1, 1, 1,
0.2868049, -0.6413979, 3.058445, 1, 1, 1, 1, 1,
0.2889032, -0.1999581, 2.465501, 1, 1, 1, 1, 1,
0.2893925, -0.4992743, 2.023122, 1, 1, 1, 1, 1,
0.2943558, 2.570797, 1.679191, 1, 1, 1, 1, 1,
0.2999647, -0.8986546, 3.581742, 0, 0, 1, 1, 1,
0.3000739, -1.172823, 2.470456, 1, 0, 0, 1, 1,
0.3034633, -1.848138, 1.659051, 1, 0, 0, 1, 1,
0.3073103, 1.067284, 1.09948, 1, 0, 0, 1, 1,
0.3073792, -0.9833319, 2.942145, 1, 0, 0, 1, 1,
0.3082693, 1.819998, 1.461125, 1, 0, 0, 1, 1,
0.3084321, 1.094168, -0.8169052, 0, 0, 0, 1, 1,
0.314779, -0.6693397, 2.550574, 0, 0, 0, 1, 1,
0.31627, 0.0120354, 1.394418, 0, 0, 0, 1, 1,
0.3224756, -1.116285, 3.426725, 0, 0, 0, 1, 1,
0.3226358, -1.801582, 2.356222, 0, 0, 0, 1, 1,
0.3285715, -0.02186215, 2.144046, 0, 0, 0, 1, 1,
0.3287778, 1.02185, 1.175155, 0, 0, 0, 1, 1,
0.3288911, -2.036391, 3.465278, 1, 1, 1, 1, 1,
0.3292846, 1.435284, 0.01689846, 1, 1, 1, 1, 1,
0.3323564, -0.6451086, 3.833802, 1, 1, 1, 1, 1,
0.3326685, -1.007731, 2.930171, 1, 1, 1, 1, 1,
0.3362852, 1.201741, 0.4166105, 1, 1, 1, 1, 1,
0.3392553, 0.3632176, 0.6097494, 1, 1, 1, 1, 1,
0.3404754, -0.9874225, 1.800319, 1, 1, 1, 1, 1,
0.3406982, 1.11859, 0.3689134, 1, 1, 1, 1, 1,
0.3411475, -1.586992, 2.737684, 1, 1, 1, 1, 1,
0.3413898, 0.9599023, -1.378018, 1, 1, 1, 1, 1,
0.3486413, -1.038295, 2.698623, 1, 1, 1, 1, 1,
0.3488312, 1.40544, 0.477027, 1, 1, 1, 1, 1,
0.3543826, 0.5215508, 1.700718, 1, 1, 1, 1, 1,
0.3544253, -0.07383673, -0.665795, 1, 1, 1, 1, 1,
0.3547744, -0.7965679, 2.988838, 1, 1, 1, 1, 1,
0.3575149, -0.6494861, 1.757246, 0, 0, 1, 1, 1,
0.3579623, -1.192594, 3.05092, 1, 0, 0, 1, 1,
0.3640242, -1.869834, 3.141021, 1, 0, 0, 1, 1,
0.3668207, -0.8103396, 2.450698, 1, 0, 0, 1, 1,
0.3673412, 2.44899, 0.4401651, 1, 0, 0, 1, 1,
0.3702023, 1.436126, -0.7030132, 1, 0, 0, 1, 1,
0.3710788, 0.6729352, 1.137098, 0, 0, 0, 1, 1,
0.3736236, -1.04734, 1.857975, 0, 0, 0, 1, 1,
0.3760757, 1.207559, 0.7451631, 0, 0, 0, 1, 1,
0.3786306, -0.8454279, 2.385623, 0, 0, 0, 1, 1,
0.3794577, -0.1779281, 1.47568, 0, 0, 0, 1, 1,
0.3820894, -0.2325193, 1.889337, 0, 0, 0, 1, 1,
0.3823232, -0.5498946, 2.545179, 0, 0, 0, 1, 1,
0.3860067, 1.125199, 1.095703, 1, 1, 1, 1, 1,
0.3875318, 0.02993922, 1.191833, 1, 1, 1, 1, 1,
0.3876988, -0.444739, 0.1312517, 1, 1, 1, 1, 1,
0.3907922, -1.371032, 2.066081, 1, 1, 1, 1, 1,
0.3914128, -0.7153824, 2.638952, 1, 1, 1, 1, 1,
0.3918374, -0.9299928, 1.977878, 1, 1, 1, 1, 1,
0.39519, 0.6070185, -0.1666649, 1, 1, 1, 1, 1,
0.397885, 1.423429, -0.03560213, 1, 1, 1, 1, 1,
0.4018231, -0.3201667, 3.103855, 1, 1, 1, 1, 1,
0.40247, 0.5535893, 2.829584, 1, 1, 1, 1, 1,
0.4026667, -0.2087766, 2.293158, 1, 1, 1, 1, 1,
0.4028778, 0.5512372, 0.2335814, 1, 1, 1, 1, 1,
0.4077102, 1.745933, 1.04508, 1, 1, 1, 1, 1,
0.412082, 0.08669754, 0.8461965, 1, 1, 1, 1, 1,
0.4130649, 0.2037246, 1.961458, 1, 1, 1, 1, 1,
0.4137024, 0.01565807, 2.04162, 0, 0, 1, 1, 1,
0.4153149, 0.6317466, 0.7816151, 1, 0, 0, 1, 1,
0.4155761, 1.724106, 0.3386548, 1, 0, 0, 1, 1,
0.4178068, -1.317227, 1.729085, 1, 0, 0, 1, 1,
0.4188744, -0.209305, 1.547151, 1, 0, 0, 1, 1,
0.4224547, 1.88008, 1.754778, 1, 0, 0, 1, 1,
0.4234377, -1.289813, 2.958688, 0, 0, 0, 1, 1,
0.4288408, -1.877682, 2.095455, 0, 0, 0, 1, 1,
0.4290879, -0.08250753, 0.4365791, 0, 0, 0, 1, 1,
0.4320851, -0.5134855, 3.709059, 0, 0, 0, 1, 1,
0.4359863, -0.6885528, 3.628461, 0, 0, 0, 1, 1,
0.4363503, 2.636247, -0.424279, 0, 0, 0, 1, 1,
0.4397836, -1.51361, 3.711571, 0, 0, 0, 1, 1,
0.440716, -0.5440021, 3.00234, 1, 1, 1, 1, 1,
0.4444152, 0.4947922, 2.428906, 1, 1, 1, 1, 1,
0.4496967, -1.567093, 2.768641, 1, 1, 1, 1, 1,
0.4532443, 0.08508428, 2.56352, 1, 1, 1, 1, 1,
0.4574834, 1.892555, 0.7812059, 1, 1, 1, 1, 1,
0.4606432, 2.397912, 0.09841181, 1, 1, 1, 1, 1,
0.4622727, -0.209604, 1.29548, 1, 1, 1, 1, 1,
0.4635441, -0.9695907, 2.740993, 1, 1, 1, 1, 1,
0.4641957, 2.160444, 0.3371823, 1, 1, 1, 1, 1,
0.4651037, 0.9916858, -0.01815188, 1, 1, 1, 1, 1,
0.4710901, 0.05594, -0.8043504, 1, 1, 1, 1, 1,
0.4725322, 0.894937, 2.199171, 1, 1, 1, 1, 1,
0.4755279, -0.6846113, 4.879447, 1, 1, 1, 1, 1,
0.4764235, -0.7544726, 1.062323, 1, 1, 1, 1, 1,
0.4788284, -0.7319015, 2.7482, 1, 1, 1, 1, 1,
0.47923, 1.583194, 1.345966, 0, 0, 1, 1, 1,
0.4861362, 2.350139, -0.1114898, 1, 0, 0, 1, 1,
0.4955904, -0.7303953, 0.8556263, 1, 0, 0, 1, 1,
0.499081, -1.481654, 2.434171, 1, 0, 0, 1, 1,
0.5005265, -0.3994252, 2.350724, 1, 0, 0, 1, 1,
0.508298, -1.467605, 3.349331, 1, 0, 0, 1, 1,
0.5140245, -0.7659207, 1.859492, 0, 0, 0, 1, 1,
0.5142193, -0.05412053, 1.033065, 0, 0, 0, 1, 1,
0.5189811, -0.4273747, 2.918349, 0, 0, 0, 1, 1,
0.5224749, 0.3082521, 0.02148232, 0, 0, 0, 1, 1,
0.522535, -0.4969685, 3.806178, 0, 0, 0, 1, 1,
0.5226162, -1.100044, 0.5917479, 0, 0, 0, 1, 1,
0.5231673, 0.733303, -0.4880637, 0, 0, 0, 1, 1,
0.526582, 0.4338416, -0.09942789, 1, 1, 1, 1, 1,
0.5268335, -0.8140233, 1.683897, 1, 1, 1, 1, 1,
0.5276425, -0.1032452, 2.522799, 1, 1, 1, 1, 1,
0.529386, -0.937449, 3.203901, 1, 1, 1, 1, 1,
0.5313461, -0.3370073, 3.52051, 1, 1, 1, 1, 1,
0.5321896, -0.2133789, 1.433757, 1, 1, 1, 1, 1,
0.5334594, 2.086114, 0.1534773, 1, 1, 1, 1, 1,
0.5496403, -1.195573, 3.623972, 1, 1, 1, 1, 1,
0.550015, 1.326484, 0.964093, 1, 1, 1, 1, 1,
0.550179, 0.5678871, 1.641136, 1, 1, 1, 1, 1,
0.5516646, -0.4753325, 3.574622, 1, 1, 1, 1, 1,
0.5523646, 0.815981, -0.5656599, 1, 1, 1, 1, 1,
0.5526784, 0.893046, 1.066285, 1, 1, 1, 1, 1,
0.5570226, 1.095311, 0.3717834, 1, 1, 1, 1, 1,
0.5603327, 0.5265381, 0.1450209, 1, 1, 1, 1, 1,
0.5620767, -1.269976, 3.028401, 0, 0, 1, 1, 1,
0.5633389, 0.7542115, 0.1033006, 1, 0, 0, 1, 1,
0.5636907, -0.5774581, -0.3501002, 1, 0, 0, 1, 1,
0.5712029, 2.04297, 0.5707342, 1, 0, 0, 1, 1,
0.5773432, -0.870419, 0.9792287, 1, 0, 0, 1, 1,
0.5781856, -0.07077504, 2.353667, 1, 0, 0, 1, 1,
0.5824649, 1.319713, 0.1065515, 0, 0, 0, 1, 1,
0.5829917, -0.3599048, 2.146516, 0, 0, 0, 1, 1,
0.5842009, 1.476356, 0.8282589, 0, 0, 0, 1, 1,
0.5857314, -0.04560876, 2.947101, 0, 0, 0, 1, 1,
0.5868534, -0.1996304, 0.7778363, 0, 0, 0, 1, 1,
0.5878639, 0.4661003, 3.296031, 0, 0, 0, 1, 1,
0.5890231, -0.5484998, 1.620093, 0, 0, 0, 1, 1,
0.5905352, 0.1595888, 2.099865, 1, 1, 1, 1, 1,
0.5907626, -0.2449924, 3.140304, 1, 1, 1, 1, 1,
0.5949487, -0.5193268, 2.665464, 1, 1, 1, 1, 1,
0.5961151, -1.107122, 2.634187, 1, 1, 1, 1, 1,
0.6002935, -0.1322645, 1.236083, 1, 1, 1, 1, 1,
0.6027275, -2.329744, 2.937997, 1, 1, 1, 1, 1,
0.6067557, -1.373829, 3.330636, 1, 1, 1, 1, 1,
0.6113845, -0.5726028, 1.778312, 1, 1, 1, 1, 1,
0.6175988, 1.492753, 0.3068736, 1, 1, 1, 1, 1,
0.61795, -1.074595, 2.204374, 1, 1, 1, 1, 1,
0.6180519, -0.5240043, 3.962139, 1, 1, 1, 1, 1,
0.6189864, 1.738196, 1.178266, 1, 1, 1, 1, 1,
0.6202812, 0.6002274, 1.778314, 1, 1, 1, 1, 1,
0.6243476, 1.056797, 0.5434229, 1, 1, 1, 1, 1,
0.6270853, 0.05711856, 2.99244, 1, 1, 1, 1, 1,
0.6283813, 0.391567, -0.1895308, 0, 0, 1, 1, 1,
0.6294574, 0.1795497, 1.117131, 1, 0, 0, 1, 1,
0.6386923, 0.5000496, -0.8401892, 1, 0, 0, 1, 1,
0.6423312, -0.85691, 1.864793, 1, 0, 0, 1, 1,
0.6424242, 0.4880048, 1.063016, 1, 0, 0, 1, 1,
0.6471617, -1.05041, 3.139657, 1, 0, 0, 1, 1,
0.6510031, 1.359021, 1.991426, 0, 0, 0, 1, 1,
0.6597242, -1.080201, 3.527669, 0, 0, 0, 1, 1,
0.6625234, 0.4162884, 1.819904, 0, 0, 0, 1, 1,
0.6689702, -0.8546396, 1.673818, 0, 0, 0, 1, 1,
0.6707064, -0.8986511, 2.409423, 0, 0, 0, 1, 1,
0.6728405, -0.4088735, 3.348737, 0, 0, 0, 1, 1,
0.6753813, -0.5289366, 2.361894, 0, 0, 0, 1, 1,
0.6762325, -0.3475336, 2.213304, 1, 1, 1, 1, 1,
0.6803392, -0.3228819, 1.205252, 1, 1, 1, 1, 1,
0.6935273, -0.356046, 2.333137, 1, 1, 1, 1, 1,
0.6970983, 1.309503, 1.682425, 1, 1, 1, 1, 1,
0.7035984, 0.0607435, 1.654891, 1, 1, 1, 1, 1,
0.7063243, -1.458441, 3.949539, 1, 1, 1, 1, 1,
0.7065558, 0.8302513, 1.28116, 1, 1, 1, 1, 1,
0.7091303, 1.997082, 0.6033104, 1, 1, 1, 1, 1,
0.7104382, -1.292022, 1.578931, 1, 1, 1, 1, 1,
0.7164729, 0.9967018, 0.8940539, 1, 1, 1, 1, 1,
0.7169768, -0.2278655, 3.021199, 1, 1, 1, 1, 1,
0.720427, 0.8298818, 1.466976, 1, 1, 1, 1, 1,
0.7232695, -1.075046, 1.995536, 1, 1, 1, 1, 1,
0.7232988, -0.07533298, 2.548281, 1, 1, 1, 1, 1,
0.7252162, 0.03278952, 2.211422, 1, 1, 1, 1, 1,
0.7261167, -1.011341, 1.88634, 0, 0, 1, 1, 1,
0.7262474, 0.9408147, 1.916616, 1, 0, 0, 1, 1,
0.7273237, -1.246712, 3.204837, 1, 0, 0, 1, 1,
0.7330855, -1.526891, 4.213946, 1, 0, 0, 1, 1,
0.7380447, -0.5636633, 1.5683, 1, 0, 0, 1, 1,
0.7386414, 0.8233687, 2.435546, 1, 0, 0, 1, 1,
0.7386739, 0.1182727, 1.220291, 0, 0, 0, 1, 1,
0.7386813, 0.77829, 1.505694, 0, 0, 0, 1, 1,
0.7409203, -0.8149488, 1.680894, 0, 0, 0, 1, 1,
0.7412501, -0.5989351, 1.366573, 0, 0, 0, 1, 1,
0.7481091, -0.8458338, 3.84911, 0, 0, 0, 1, 1,
0.7485286, 0.2051913, 1.97556, 0, 0, 0, 1, 1,
0.7509744, 0.1794705, 1.089146, 0, 0, 0, 1, 1,
0.7595497, 0.5146542, -0.8455547, 1, 1, 1, 1, 1,
0.7603837, -0.2803094, 2.276751, 1, 1, 1, 1, 1,
0.7653453, 0.4944268, 2.717983, 1, 1, 1, 1, 1,
0.7680096, 1.396531, -0.474568, 1, 1, 1, 1, 1,
0.7681093, 1.901891, 1.4404, 1, 1, 1, 1, 1,
0.7702284, -0.1416652, 0.8179852, 1, 1, 1, 1, 1,
0.7704203, -0.7970934, 1.775763, 1, 1, 1, 1, 1,
0.774832, -0.6311879, 3.008302, 1, 1, 1, 1, 1,
0.7830542, -0.3555351, 2.9141, 1, 1, 1, 1, 1,
0.785051, 0.5239949, -0.3101124, 1, 1, 1, 1, 1,
0.7912433, -2.870351, 0.7610987, 1, 1, 1, 1, 1,
0.7956515, -1.095111, 2.667206, 1, 1, 1, 1, 1,
0.8053594, 0.5784996, 1.739363, 1, 1, 1, 1, 1,
0.8101162, -3.089932, 1.855571, 1, 1, 1, 1, 1,
0.8114989, -0.5484572, 2.682642, 1, 1, 1, 1, 1,
0.8144506, -0.6929768, 0.8130831, 0, 0, 1, 1, 1,
0.8190795, 1.155566, 1.701261, 1, 0, 0, 1, 1,
0.8421232, -1.127476, 4.209249, 1, 0, 0, 1, 1,
0.843915, 0.06197626, 1.321715, 1, 0, 0, 1, 1,
0.8569817, -0.14534, 2.551819, 1, 0, 0, 1, 1,
0.857536, 2.320969, 0.1785181, 1, 0, 0, 1, 1,
0.8621724, -0.9998455, 1.12027, 0, 0, 0, 1, 1,
0.8639861, -0.5659215, 0.4827845, 0, 0, 0, 1, 1,
0.8653163, 1.039084, -0.01744597, 0, 0, 0, 1, 1,
0.8681035, 1.046592, -0.05627339, 0, 0, 0, 1, 1,
0.8687361, -0.5795084, 3.365863, 0, 0, 0, 1, 1,
0.8697586, 0.1180068, 1.317915, 0, 0, 0, 1, 1,
0.872205, 0.1105362, 1.087393, 0, 0, 0, 1, 1,
0.874535, 1.024781, 1.136903, 1, 1, 1, 1, 1,
0.8748466, 1.332717, 0.6929256, 1, 1, 1, 1, 1,
0.875939, -1.352402, 1.781581, 1, 1, 1, 1, 1,
0.8781445, 1.387305, 0.5839826, 1, 1, 1, 1, 1,
0.8816666, 0.2876574, 1.338657, 1, 1, 1, 1, 1,
0.8824145, -0.6203361, 2.390911, 1, 1, 1, 1, 1,
0.8866078, -1.507718, 3.558545, 1, 1, 1, 1, 1,
0.8916226, 1.519787, 0.1582815, 1, 1, 1, 1, 1,
0.8971393, -1.689258, 3.098724, 1, 1, 1, 1, 1,
0.9079014, 0.03301488, 1.614078, 1, 1, 1, 1, 1,
0.9086763, -0.05746979, 1.529111, 1, 1, 1, 1, 1,
0.9146324, -0.27072, 2.0324, 1, 1, 1, 1, 1,
0.9240685, -0.8797618, 2.05067, 1, 1, 1, 1, 1,
0.9286217, -0.7310745, 2.700551, 1, 1, 1, 1, 1,
0.9288947, 0.7467739, -1.311374, 1, 1, 1, 1, 1,
0.9317389, 1.480253, 1.526508, 0, 0, 1, 1, 1,
0.9327651, -1.443698, 2.317317, 1, 0, 0, 1, 1,
0.9336417, -0.04690956, 0.8879273, 1, 0, 0, 1, 1,
0.9381388, -1.253962, 2.297682, 1, 0, 0, 1, 1,
0.9403764, -0.5748867, 4.217238, 1, 0, 0, 1, 1,
0.9427392, 0.3020083, 3.160483, 1, 0, 0, 1, 1,
0.9515769, -0.821316, 1.459502, 0, 0, 0, 1, 1,
0.9534974, 0.01541319, 1.975646, 0, 0, 0, 1, 1,
0.9560636, -1.199767, 3.036796, 0, 0, 0, 1, 1,
0.9567805, 1.525772, 1.32811, 0, 0, 0, 1, 1,
0.9611481, -0.06307468, 1.08644, 0, 0, 0, 1, 1,
0.961924, 0.768396, 1.154166, 0, 0, 0, 1, 1,
0.9621978, -0.4056146, 0.08059501, 0, 0, 0, 1, 1,
0.9636821, 0.1729679, 1.327797, 1, 1, 1, 1, 1,
0.9684114, -1.324736, 2.28853, 1, 1, 1, 1, 1,
0.9718176, -0.6213372, 2.482549, 1, 1, 1, 1, 1,
0.9865566, -0.1663473, -0.01829172, 1, 1, 1, 1, 1,
0.98682, 0.620285, -0.115066, 1, 1, 1, 1, 1,
0.991869, 0.193151, 3.158612, 1, 1, 1, 1, 1,
0.9923815, 1.262149, 1.359191, 1, 1, 1, 1, 1,
0.9946702, 0.0838036, 1.898748, 1, 1, 1, 1, 1,
1.000362, 1.34061, 2.119827, 1, 1, 1, 1, 1,
1.001003, -0.06785461, 0.44579, 1, 1, 1, 1, 1,
1.004532, -1.617776, 2.054161, 1, 1, 1, 1, 1,
1.007967, 0.6220981, 1.507209, 1, 1, 1, 1, 1,
1.010518, 0.6133917, 0.09068494, 1, 1, 1, 1, 1,
1.013259, -0.5399926, 2.6901, 1, 1, 1, 1, 1,
1.017813, 0.4893814, 1.771709, 1, 1, 1, 1, 1,
1.018548, 0.6789806, 1.762199, 0, 0, 1, 1, 1,
1.03761, 0.3074153, 1.84618, 1, 0, 0, 1, 1,
1.038976, 0.8024859, 2.007298, 1, 0, 0, 1, 1,
1.04551, 0.79169, 1.934803, 1, 0, 0, 1, 1,
1.051155, -1.574208, 0.903423, 1, 0, 0, 1, 1,
1.052457, 0.6471958, 1.607842, 1, 0, 0, 1, 1,
1.054927, -0.01987457, 1.89592, 0, 0, 0, 1, 1,
1.060202, 0.4367123, 0.8223619, 0, 0, 0, 1, 1,
1.062599, -1.216314, 1.778614, 0, 0, 0, 1, 1,
1.065268, -0.1516481, 2.493715, 0, 0, 0, 1, 1,
1.068198, -0.8605318, 0.8482321, 0, 0, 0, 1, 1,
1.072728, -0.8101634, 0.7725943, 0, 0, 0, 1, 1,
1.074371, 0.3543982, 1.92145, 0, 0, 0, 1, 1,
1.078431, 0.6431181, -0.2046458, 1, 1, 1, 1, 1,
1.083408, -0.7053298, 2.689035, 1, 1, 1, 1, 1,
1.0843, -0.2239372, 1.160784, 1, 1, 1, 1, 1,
1.08476, -1.14739, 2.041298, 1, 1, 1, 1, 1,
1.100037, 0.2616873, 2.580871, 1, 1, 1, 1, 1,
1.108188, 0.05901248, 1.552634, 1, 1, 1, 1, 1,
1.111115, -0.8975796, 2.805298, 1, 1, 1, 1, 1,
1.113306, 0.6020322, 1.139637, 1, 1, 1, 1, 1,
1.118916, 0.8157564, 2.269888, 1, 1, 1, 1, 1,
1.120625, -1.166228, 2.201853, 1, 1, 1, 1, 1,
1.122004, -0.5401774, 2.442559, 1, 1, 1, 1, 1,
1.124028, -0.08764154, 1.730189, 1, 1, 1, 1, 1,
1.124792, -1.868011, 3.132702, 1, 1, 1, 1, 1,
1.130895, 0.6924654, -0.195663, 1, 1, 1, 1, 1,
1.133901, 0.04837722, 2.410024, 1, 1, 1, 1, 1,
1.134395, -0.9625908, 1.904703, 0, 0, 1, 1, 1,
1.13623, -0.3155707, 0.02877792, 1, 0, 0, 1, 1,
1.151377, 0.515182, 1.828316, 1, 0, 0, 1, 1,
1.153131, 1.05723, 0.5249333, 1, 0, 0, 1, 1,
1.155475, 0.7042665, 1.921619, 1, 0, 0, 1, 1,
1.182417, 0.7733999, 0.7855325, 1, 0, 0, 1, 1,
1.184284, 0.4321503, 0.1801483, 0, 0, 0, 1, 1,
1.187194, -1.999574, 3.831664, 0, 0, 0, 1, 1,
1.191542, -2.127843, 3.291714, 0, 0, 0, 1, 1,
1.200426, 1.410958, -0.0373297, 0, 0, 0, 1, 1,
1.208851, -0.5797815, 3.532921, 0, 0, 0, 1, 1,
1.210178, -1.36134, 2.47626, 0, 0, 0, 1, 1,
1.21231, 0.6113963, 0.4610017, 0, 0, 0, 1, 1,
1.227205, 0.8443505, -0.767749, 1, 1, 1, 1, 1,
1.22832, 0.9735296, 1.432039, 1, 1, 1, 1, 1,
1.231046, 2.025987, 0.09538393, 1, 1, 1, 1, 1,
1.233154, 0.5000536, 0.9968024, 1, 1, 1, 1, 1,
1.2366, -1.047431, 2.343098, 1, 1, 1, 1, 1,
1.239322, -0.2648502, 3.644823, 1, 1, 1, 1, 1,
1.239327, -1.068342, 1.369468, 1, 1, 1, 1, 1,
1.251351, -0.4546076, 1.08407, 1, 1, 1, 1, 1,
1.253651, -0.8045384, 0.432495, 1, 1, 1, 1, 1,
1.261814, -1.20354, 1.790998, 1, 1, 1, 1, 1,
1.264481, 0.311857, -0.6592041, 1, 1, 1, 1, 1,
1.269943, 0.3781094, 0.7186416, 1, 1, 1, 1, 1,
1.272463, -1.879379, 1.471487, 1, 1, 1, 1, 1,
1.275477, -0.6031402, 2.242817, 1, 1, 1, 1, 1,
1.278591, 1.262599, 1.067898, 1, 1, 1, 1, 1,
1.280701, 1.236152, -0.1142466, 0, 0, 1, 1, 1,
1.28721, 0.3373239, 0.2436144, 1, 0, 0, 1, 1,
1.289348, 1.379994, 0.4332352, 1, 0, 0, 1, 1,
1.289946, 0.6821113, -0.2324649, 1, 0, 0, 1, 1,
1.308097, 0.08519546, -0.3098426, 1, 0, 0, 1, 1,
1.311697, 0.6034465, 1.34693, 1, 0, 0, 1, 1,
1.317777, 1.101502, 1.184653, 0, 0, 0, 1, 1,
1.325622, -0.526078, 2.328649, 0, 0, 0, 1, 1,
1.327642, -1.002202, 2.64414, 0, 0, 0, 1, 1,
1.328332, -0.2493698, 0.2989414, 0, 0, 0, 1, 1,
1.335257, 0.3964622, 1.430954, 0, 0, 0, 1, 1,
1.340297, 0.2902028, 1.369036, 0, 0, 0, 1, 1,
1.34151, -0.01547742, 2.279303, 0, 0, 0, 1, 1,
1.342647, -1.917336, 3.44026, 1, 1, 1, 1, 1,
1.345581, -0.748669, 3.734056, 1, 1, 1, 1, 1,
1.351085, 0.2081832, 2.740588, 1, 1, 1, 1, 1,
1.3515, 0.3294004, -0.2306632, 1, 1, 1, 1, 1,
1.356381, -0.3940395, 2.604282, 1, 1, 1, 1, 1,
1.359345, -2.53416, 2.458759, 1, 1, 1, 1, 1,
1.366986, -0.009668302, 1.993616, 1, 1, 1, 1, 1,
1.369414, -0.3208396, 0.8863923, 1, 1, 1, 1, 1,
1.389772, -1.408079, 1.463293, 1, 1, 1, 1, 1,
1.397128, 1.961213, -0.2290542, 1, 1, 1, 1, 1,
1.41059, 0.2602973, 0.4936495, 1, 1, 1, 1, 1,
1.436667, 0.5736061, 0.230356, 1, 1, 1, 1, 1,
1.439226, 1.06653, 0.3638657, 1, 1, 1, 1, 1,
1.450745, -0.9505451, 2.573071, 1, 1, 1, 1, 1,
1.464103, 0.8797722, 1.585472, 1, 1, 1, 1, 1,
1.465171, -0.2493159, 1.439409, 0, 0, 1, 1, 1,
1.477343, 0.860384, 0.941278, 1, 0, 0, 1, 1,
1.485412, 0.1254642, 1.483896, 1, 0, 0, 1, 1,
1.496698, -0.935501, 0.4527351, 1, 0, 0, 1, 1,
1.497388, 0.8440467, 1.242212, 1, 0, 0, 1, 1,
1.514289, 0.2604813, 0.9085708, 1, 0, 0, 1, 1,
1.53464, -0.3487439, 1.527054, 0, 0, 0, 1, 1,
1.538121, -0.3646434, 1.024544, 0, 0, 0, 1, 1,
1.549397, -0.6580629, 2.409791, 0, 0, 0, 1, 1,
1.55191, 0.01906093, 2.264601, 0, 0, 0, 1, 1,
1.57224, 1.495101, 0.7689426, 0, 0, 0, 1, 1,
1.579538, 0.4445204, 2.103017, 0, 0, 0, 1, 1,
1.580322, -0.5711769, 2.403962, 0, 0, 0, 1, 1,
1.587666, -0.7992923, 1.572479, 1, 1, 1, 1, 1,
1.595947, 1.914791, 0.05141272, 1, 1, 1, 1, 1,
1.603365, -0.3313701, 1.840243, 1, 1, 1, 1, 1,
1.609473, -2.460606, 3.446183, 1, 1, 1, 1, 1,
1.614213, 0.3141522, 2.261082, 1, 1, 1, 1, 1,
1.615325, 0.1049326, 2.921186, 1, 1, 1, 1, 1,
1.622487, 1.173423, 0.5618709, 1, 1, 1, 1, 1,
1.622697, -0.1778695, 1.26502, 1, 1, 1, 1, 1,
1.632979, 0.83404, 1.483274, 1, 1, 1, 1, 1,
1.636619, -0.9930177, 1.783018, 1, 1, 1, 1, 1,
1.639041, 2.690723, 2.688356, 1, 1, 1, 1, 1,
1.649399, -0.1417669, 0.6929464, 1, 1, 1, 1, 1,
1.657904, 0.02941099, 0.9517714, 1, 1, 1, 1, 1,
1.660277, 0.6708594, 2.596073, 1, 1, 1, 1, 1,
1.666573, 1.102042, 1.278773, 1, 1, 1, 1, 1,
1.667885, 0.4048277, 1.758367, 0, 0, 1, 1, 1,
1.669785, 0.03991903, 0.4407143, 1, 0, 0, 1, 1,
1.679247, -0.07151669, 2.33531, 1, 0, 0, 1, 1,
1.686914, 1.098397, 2.037852, 1, 0, 0, 1, 1,
1.697513, -0.6330807, 0.9614505, 1, 0, 0, 1, 1,
1.713501, 1.500341, 1.268079, 1, 0, 0, 1, 1,
1.734853, 0.4529906, 3.467679, 0, 0, 0, 1, 1,
1.741665, 1.571072, 0.1541569, 0, 0, 0, 1, 1,
1.742476, 0.932025, 2.242969, 0, 0, 0, 1, 1,
1.750049, -1.55037, 2.058535, 0, 0, 0, 1, 1,
1.754769, -1.056326, 1.121312, 0, 0, 0, 1, 1,
1.797255, 1.616436, 2.062335, 0, 0, 0, 1, 1,
1.824677, 0.4189663, -0.02388768, 0, 0, 0, 1, 1,
1.829156, -0.8477604, 3.226817, 1, 1, 1, 1, 1,
1.832819, -0.8833899, 2.563636, 1, 1, 1, 1, 1,
1.839716, -1.308412, 2.338168, 1, 1, 1, 1, 1,
1.841442, -1.615971, 2.719063, 1, 1, 1, 1, 1,
1.864933, -0.2531155, 3.691338, 1, 1, 1, 1, 1,
1.879544, 1.119866, 0.8570198, 1, 1, 1, 1, 1,
1.881444, -1.505671, 2.441163, 1, 1, 1, 1, 1,
1.887707, -1.019573, 0.4692698, 1, 1, 1, 1, 1,
1.898073, 0.7433789, 0.395588, 1, 1, 1, 1, 1,
1.915998, -1.344675, 3.517217, 1, 1, 1, 1, 1,
1.929425, -1.003215, 1.64929, 1, 1, 1, 1, 1,
1.949252, 0.8417785, -0.007669969, 1, 1, 1, 1, 1,
1.967585, 0.7352166, 1.395695, 1, 1, 1, 1, 1,
2.0285, -1.770102, 4.026632, 1, 1, 1, 1, 1,
2.056051, 2.29779, 1.444955, 1, 1, 1, 1, 1,
2.093653, -0.055243, 1.917672, 0, 0, 1, 1, 1,
2.098448, -1.254602, 0.4250402, 1, 0, 0, 1, 1,
2.161658, 1.53674, -0.5559531, 1, 0, 0, 1, 1,
2.170078, 0.09924711, 1.666386, 1, 0, 0, 1, 1,
2.174517, -1.510704, 2.289783, 1, 0, 0, 1, 1,
2.186135, -0.669438, 1.11556, 1, 0, 0, 1, 1,
2.20706, 0.08857743, 2.234845, 0, 0, 0, 1, 1,
2.26937, -1.073224, 2.146138, 0, 0, 0, 1, 1,
2.313651, 0.9384519, 0.2331875, 0, 0, 0, 1, 1,
2.330851, -0.5905417, 0.9885191, 0, 0, 0, 1, 1,
2.391607, -0.04901951, 1.173091, 0, 0, 0, 1, 1,
2.427072, -2.117567, 3.130298, 0, 0, 0, 1, 1,
2.546318, 1.450496, 2.007705, 0, 0, 0, 1, 1,
2.635763, -1.634233, 2.728689, 1, 1, 1, 1, 1,
2.680954, 1.143084, 0.5313491, 1, 1, 1, 1, 1,
2.731069, -1.607442, 1.650705, 1, 1, 1, 1, 1,
2.934102, -1.164908, 0.5185595, 1, 1, 1, 1, 1,
3.064398, 0.1528763, 2.652919, 1, 1, 1, 1, 1,
3.186902, -0.2572656, 0.7748857, 1, 1, 1, 1, 1,
3.356446, -0.238473, 1.787227, 1, 1, 1, 1, 1
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
var radius = 9.693082;
var distance = 34.04654;
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
mvMatrix.translate( 0.05326271, 0.0889349, 0.1637068 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.04654);
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
