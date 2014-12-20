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
-3.667554, 0.5418107, -1.051433, 1, 0, 0, 1,
-2.825515, 1.593175, -0.3570338, 1, 0.007843138, 0, 1,
-2.704172, 0.6081921, -0.7637968, 1, 0.01176471, 0, 1,
-2.588045, 1.039518, -1.326005, 1, 0.01960784, 0, 1,
-2.468885, 1.569571, -0.2994691, 1, 0.02352941, 0, 1,
-2.348839, -0.5225565, -2.968294, 1, 0.03137255, 0, 1,
-2.269957, -1.101941, -0.0992919, 1, 0.03529412, 0, 1,
-2.221689, 1.350396, -1.615229, 1, 0.04313726, 0, 1,
-2.212214, 0.5412492, -0.7538918, 1, 0.04705882, 0, 1,
-2.133533, 0.3196442, -2.544137, 1, 0.05490196, 0, 1,
-2.113155, -0.1005052, 0.1168134, 1, 0.05882353, 0, 1,
-2.111943, -1.676774, -2.392922, 1, 0.06666667, 0, 1,
-2.090601, 1.144711, -1.878489, 1, 0.07058824, 0, 1,
-2.077295, -2.304302, -1.342569, 1, 0.07843138, 0, 1,
-2.060411, -0.2912283, -1.577079, 1, 0.08235294, 0, 1,
-2.057054, -0.3016776, -1.327106, 1, 0.09019608, 0, 1,
-2.050587, 0.4393633, -2.185053, 1, 0.09411765, 0, 1,
-2.031105, 0.5321973, -0.8939477, 1, 0.1019608, 0, 1,
-2.022851, 0.5846122, -0.1075152, 1, 0.1098039, 0, 1,
-2.022177, 0.2482504, -2.009544, 1, 0.1137255, 0, 1,
-2.009783, 1.642061, 0.08159191, 1, 0.1215686, 0, 1,
-2.009669, 0.4950185, -0.3291517, 1, 0.1254902, 0, 1,
-1.984895, -0.9062742, -2.67882, 1, 0.1333333, 0, 1,
-1.983923, -0.2028306, -2.070504, 1, 0.1372549, 0, 1,
-1.964736, 1.003909, -2.227655, 1, 0.145098, 0, 1,
-1.948443, 0.6052052, -1.078591, 1, 0.1490196, 0, 1,
-1.880389, -0.2746387, -0.9705765, 1, 0.1568628, 0, 1,
-1.853445, -1.338919, -2.250444, 1, 0.1607843, 0, 1,
-1.849771, 0.09375945, -2.105311, 1, 0.1686275, 0, 1,
-1.801437, -2.679439, -3.148278, 1, 0.172549, 0, 1,
-1.776213, -0.9837519, -1.499417, 1, 0.1803922, 0, 1,
-1.752804, 0.6943752, -2.233276, 1, 0.1843137, 0, 1,
-1.752286, 0.8720334, -1.123307, 1, 0.1921569, 0, 1,
-1.749857, -0.116728, -2.20706, 1, 0.1960784, 0, 1,
-1.725621, 0.4871731, -1.333698, 1, 0.2039216, 0, 1,
-1.699943, 0.2979586, -1.183187, 1, 0.2117647, 0, 1,
-1.691963, 0.7141805, -1.106486, 1, 0.2156863, 0, 1,
-1.683814, 1.194568, -0.1492674, 1, 0.2235294, 0, 1,
-1.66529, 1.289933, -2.418902, 1, 0.227451, 0, 1,
-1.663214, 0.3422384, -1.064278, 1, 0.2352941, 0, 1,
-1.662367, 0.6853774, -0.2725219, 1, 0.2392157, 0, 1,
-1.655231, 0.2863186, -1.073285, 1, 0.2470588, 0, 1,
-1.644281, -0.5649034, -1.567697, 1, 0.2509804, 0, 1,
-1.638712, 0.4716331, -2.701018, 1, 0.2588235, 0, 1,
-1.631307, -1.15569, -2.855876, 1, 0.2627451, 0, 1,
-1.627379, 0.3508759, -1.41048, 1, 0.2705882, 0, 1,
-1.622357, -0.3709951, -2.275956, 1, 0.2745098, 0, 1,
-1.608534, 0.4674511, -0.3909356, 1, 0.282353, 0, 1,
-1.589124, 0.1664695, -1.085016, 1, 0.2862745, 0, 1,
-1.587812, 0.327306, -0.07149339, 1, 0.2941177, 0, 1,
-1.585117, -2.213485, -1.806097, 1, 0.3019608, 0, 1,
-1.573809, -0.6971745, -1.167619, 1, 0.3058824, 0, 1,
-1.567548, -1.214781, -1.419163, 1, 0.3137255, 0, 1,
-1.564115, -0.05630701, -0.6926028, 1, 0.3176471, 0, 1,
-1.559334, 1.109427, -0.9700962, 1, 0.3254902, 0, 1,
-1.54991, 1.209077, -1.352624, 1, 0.3294118, 0, 1,
-1.545109, -0.5279174, -2.486365, 1, 0.3372549, 0, 1,
-1.537251, 1.23526, -2.062793, 1, 0.3411765, 0, 1,
-1.537104, 1.491924, 0.03450801, 1, 0.3490196, 0, 1,
-1.533909, -0.6722901, -1.986925, 1, 0.3529412, 0, 1,
-1.50836, -0.4573258, -2.837473, 1, 0.3607843, 0, 1,
-1.507644, -0.6934042, -2.460123, 1, 0.3647059, 0, 1,
-1.493845, -1.207814, -2.708888, 1, 0.372549, 0, 1,
-1.48761, -0.6600493, -1.748421, 1, 0.3764706, 0, 1,
-1.475303, 1.129895, -0.4709571, 1, 0.3843137, 0, 1,
-1.470617, 0.2031689, -1.642512, 1, 0.3882353, 0, 1,
-1.469387, 0.9625943, -0.2038947, 1, 0.3960784, 0, 1,
-1.451422, -0.09004869, -2.233494, 1, 0.4039216, 0, 1,
-1.44788, 0.4562742, -0.9400418, 1, 0.4078431, 0, 1,
-1.444381, -0.5855507, -2.055303, 1, 0.4156863, 0, 1,
-1.442124, 0.3718755, 0.3478101, 1, 0.4196078, 0, 1,
-1.431189, -0.1280804, 0.02415201, 1, 0.427451, 0, 1,
-1.403406, 0.8481499, -0.4900801, 1, 0.4313726, 0, 1,
-1.380748, -0.2121879, -2.327826, 1, 0.4392157, 0, 1,
-1.380113, -0.8237839, -0.03636543, 1, 0.4431373, 0, 1,
-1.37941, 1.275569, -2.251097, 1, 0.4509804, 0, 1,
-1.357493, 0.1719358, -2.246749, 1, 0.454902, 0, 1,
-1.352221, 1.011904, -2.242919, 1, 0.4627451, 0, 1,
-1.347614, 0.7764312, 0.5484642, 1, 0.4666667, 0, 1,
-1.334257, 0.828416, -0.3359013, 1, 0.4745098, 0, 1,
-1.323482, 0.5044274, -0.6340673, 1, 0.4784314, 0, 1,
-1.323333, 0.8745756, -1.256237, 1, 0.4862745, 0, 1,
-1.32246, -0.08289449, -3.4673, 1, 0.4901961, 0, 1,
-1.316473, 0.5516109, -1.154364, 1, 0.4980392, 0, 1,
-1.294216, 1.891843, -0.02218145, 1, 0.5058824, 0, 1,
-1.292337, 0.3783814, 0.04682676, 1, 0.509804, 0, 1,
-1.288577, 0.05311054, -1.490799, 1, 0.5176471, 0, 1,
-1.282873, -0.3240303, -0.842522, 1, 0.5215687, 0, 1,
-1.27879, -0.7131458, -2.024798, 1, 0.5294118, 0, 1,
-1.277996, -2.212439, -1.391676, 1, 0.5333334, 0, 1,
-1.264835, 1.066696, -1.69975, 1, 0.5411765, 0, 1,
-1.251948, -0.0313247, -1.105399, 1, 0.5450981, 0, 1,
-1.251314, 0.2394901, -1.590787, 1, 0.5529412, 0, 1,
-1.250362, -0.3988224, -1.624521, 1, 0.5568628, 0, 1,
-1.24946, -0.7123341, -1.688648, 1, 0.5647059, 0, 1,
-1.240825, 0.6929159, -0.9507896, 1, 0.5686275, 0, 1,
-1.237086, -0.1516833, -2.950668, 1, 0.5764706, 0, 1,
-1.226937, -0.9849924, -3.044743, 1, 0.5803922, 0, 1,
-1.221672, 2.978004, -0.7093201, 1, 0.5882353, 0, 1,
-1.220474, -0.9986735, -2.630032, 1, 0.5921569, 0, 1,
-1.218798, 0.6386247, -0.7968748, 1, 0.6, 0, 1,
-1.216442, 1.530616, -0.5098853, 1, 0.6078432, 0, 1,
-1.213902, -0.5417081, -2.38806, 1, 0.6117647, 0, 1,
-1.213265, -0.1498957, -2.427645, 1, 0.6196079, 0, 1,
-1.205317, -0.2960943, -3.978194, 1, 0.6235294, 0, 1,
-1.188572, 0.9446227, -1.734481, 1, 0.6313726, 0, 1,
-1.180281, -0.04796869, -2.510487, 1, 0.6352941, 0, 1,
-1.178091, -0.9531729, -2.538891, 1, 0.6431373, 0, 1,
-1.176176, -0.9418004, -1.886299, 1, 0.6470588, 0, 1,
-1.169356, -0.5939296, -0.670374, 1, 0.654902, 0, 1,
-1.165016, -0.8532776, -3.578782, 1, 0.6588235, 0, 1,
-1.164871, -0.1080221, -2.129848, 1, 0.6666667, 0, 1,
-1.163253, -1.192791, -2.102432, 1, 0.6705883, 0, 1,
-1.15991, -1.112542, -3.022284, 1, 0.6784314, 0, 1,
-1.158947, -0.8409569, -1.430501, 1, 0.682353, 0, 1,
-1.153005, 0.3959565, -0.1550179, 1, 0.6901961, 0, 1,
-1.147425, -0.947001, -3.66902, 1, 0.6941177, 0, 1,
-1.137519, 0.3076305, -1.358308, 1, 0.7019608, 0, 1,
-1.134209, -1.068011, -1.913078, 1, 0.7098039, 0, 1,
-1.128886, 0.3366065, 1.72843, 1, 0.7137255, 0, 1,
-1.1277, 1.558571, 0.2190034, 1, 0.7215686, 0, 1,
-1.121636, 0.5645056, -1.038814, 1, 0.7254902, 0, 1,
-1.120292, 0.2685488, -1.681142, 1, 0.7333333, 0, 1,
-1.111734, 1.230419, 0.5827345, 1, 0.7372549, 0, 1,
-1.109157, 2.34682, -1.325389, 1, 0.7450981, 0, 1,
-1.107485, -1.541249, -2.990483, 1, 0.7490196, 0, 1,
-1.106083, -1.043716, -3.581983, 1, 0.7568628, 0, 1,
-1.105961, 0.727577, 0.7949503, 1, 0.7607843, 0, 1,
-1.10587, -0.006195739, -3.202403, 1, 0.7686275, 0, 1,
-1.093039, 1.028838, -0.2406275, 1, 0.772549, 0, 1,
-1.086588, -0.6792664, 0.1577004, 1, 0.7803922, 0, 1,
-1.085639, -0.1076819, -2.613814, 1, 0.7843137, 0, 1,
-1.076519, 0.1908493, -1.758922, 1, 0.7921569, 0, 1,
-1.076374, -0.431843, -1.859329, 1, 0.7960784, 0, 1,
-1.06185, -0.9833667, -2.082561, 1, 0.8039216, 0, 1,
-1.04344, -0.5531957, -1.642743, 1, 0.8117647, 0, 1,
-1.039699, -0.005104928, -2.335101, 1, 0.8156863, 0, 1,
-1.030254, 0.4043629, -1.923398, 1, 0.8235294, 0, 1,
-1.024375, 1.607051, -2.583401, 1, 0.827451, 0, 1,
-1.023273, 1.180079, -0.3773615, 1, 0.8352941, 0, 1,
-1.019441, 1.425673, -1.075203, 1, 0.8392157, 0, 1,
-1.016207, -0.05696467, -1.424417, 1, 0.8470588, 0, 1,
-1.015445, -0.4190229, -2.593621, 1, 0.8509804, 0, 1,
-1.009795, -0.184995, -1.340261, 1, 0.8588235, 0, 1,
-0.9970076, 0.694027, -2.128813, 1, 0.8627451, 0, 1,
-0.9958094, -0.603567, 0.02994263, 1, 0.8705882, 0, 1,
-0.9855236, 0.6298552, -0.3166318, 1, 0.8745098, 0, 1,
-0.9740652, -0.5218932, -1.459818, 1, 0.8823529, 0, 1,
-0.9687883, -0.6001978, -2.488941, 1, 0.8862745, 0, 1,
-0.9684324, -1.397765, -3.105428, 1, 0.8941177, 0, 1,
-0.9649307, -0.7553365, -3.356954, 1, 0.8980392, 0, 1,
-0.9643182, -2.326609, -1.875865, 1, 0.9058824, 0, 1,
-0.9589642, -1.083908, -0.3519834, 1, 0.9137255, 0, 1,
-0.9580877, -1.237183, -4.092447, 1, 0.9176471, 0, 1,
-0.9580466, 0.2205341, -2.448809, 1, 0.9254902, 0, 1,
-0.9515591, -1.533013, -1.767346, 1, 0.9294118, 0, 1,
-0.9485314, 1.004116, -1.859351, 1, 0.9372549, 0, 1,
-0.9407161, 0.7681591, 0.3707458, 1, 0.9411765, 0, 1,
-0.9405971, -0.6093833, -1.512432, 1, 0.9490196, 0, 1,
-0.9360074, -2.217412, -3.198418, 1, 0.9529412, 0, 1,
-0.9343021, 0.09065133, -1.875729, 1, 0.9607843, 0, 1,
-0.9330733, 0.5203483, -2.059015, 1, 0.9647059, 0, 1,
-0.9229833, -0.8348684, -1.693522, 1, 0.972549, 0, 1,
-0.919141, -0.7982183, -3.180216, 1, 0.9764706, 0, 1,
-0.9105703, -0.629686, -3.590486, 1, 0.9843137, 0, 1,
-0.9095834, 0.1530434, -0.9783381, 1, 0.9882353, 0, 1,
-0.9073873, 0.5318179, -3.16982, 1, 0.9960784, 0, 1,
-0.9029049, -0.1027219, -1.403812, 0.9960784, 1, 0, 1,
-0.8930256, 0.2144327, -2.269571, 0.9921569, 1, 0, 1,
-0.88986, -0.39393, -2.091243, 0.9843137, 1, 0, 1,
-0.8896925, -0.06356029, -2.147321, 0.9803922, 1, 0, 1,
-0.8784239, -1.033564, -1.319125, 0.972549, 1, 0, 1,
-0.8773685, 0.4557718, -1.566217, 0.9686275, 1, 0, 1,
-0.8754623, 0.4664045, -1.354938, 0.9607843, 1, 0, 1,
-0.8754243, 1.040269, -0.5468138, 0.9568627, 1, 0, 1,
-0.8723074, -0.1024329, -2.555924, 0.9490196, 1, 0, 1,
-0.8672512, -1.371127, -1.399708, 0.945098, 1, 0, 1,
-0.8654838, 0.7158424, -2.033932, 0.9372549, 1, 0, 1,
-0.8628117, 0.5656794, -0.03328766, 0.9333333, 1, 0, 1,
-0.8609695, 0.3732685, -1.685502, 0.9254902, 1, 0, 1,
-0.8570966, -1.634549, -3.415289, 0.9215686, 1, 0, 1,
-0.8558533, -0.5072208, -2.722484, 0.9137255, 1, 0, 1,
-0.8524526, 0.9965985, -1.360468, 0.9098039, 1, 0, 1,
-0.852061, 0.7303683, -1.949843, 0.9019608, 1, 0, 1,
-0.8517414, -1.203745, -3.215246, 0.8941177, 1, 0, 1,
-0.8487884, -0.281293, -1.272636, 0.8901961, 1, 0, 1,
-0.8453567, 1.231687, -2.163456, 0.8823529, 1, 0, 1,
-0.8434728, -1.255628, -0.6880238, 0.8784314, 1, 0, 1,
-0.8382996, -2.260584, -3.708593, 0.8705882, 1, 0, 1,
-0.8369652, -1.606183, -3.443088, 0.8666667, 1, 0, 1,
-0.8356082, -0.3182677, -1.911163, 0.8588235, 1, 0, 1,
-0.8342289, 0.3996079, -1.508279, 0.854902, 1, 0, 1,
-0.8334688, -0.1253924, -1.547281, 0.8470588, 1, 0, 1,
-0.8326228, -0.746105, -2.360297, 0.8431373, 1, 0, 1,
-0.831786, -1.513239, -1.070615, 0.8352941, 1, 0, 1,
-0.8306625, 0.1156731, -0.9867389, 0.8313726, 1, 0, 1,
-0.8251053, -0.1153298, -2.566193, 0.8235294, 1, 0, 1,
-0.824444, 0.3028389, -1.659615, 0.8196079, 1, 0, 1,
-0.8200774, 0.1108328, -0.8293203, 0.8117647, 1, 0, 1,
-0.8143868, -0.7894845, -2.667485, 0.8078431, 1, 0, 1,
-0.8007845, -1.424269, -3.172685, 0.8, 1, 0, 1,
-0.7933958, -1.355856, -2.337613, 0.7921569, 1, 0, 1,
-0.791429, 0.6330285, -1.413919, 0.7882353, 1, 0, 1,
-0.7861748, 1.447315, 0.4685391, 0.7803922, 1, 0, 1,
-0.7851755, 1.473618, 0.1813061, 0.7764706, 1, 0, 1,
-0.785072, 0.855479, -0.7041361, 0.7686275, 1, 0, 1,
-0.7845414, 1.99949, 0.8014863, 0.7647059, 1, 0, 1,
-0.7797107, 0.1967671, -1.57095, 0.7568628, 1, 0, 1,
-0.776876, -1.628538, -2.477568, 0.7529412, 1, 0, 1,
-0.7759181, 0.7642326, -1.81647, 0.7450981, 1, 0, 1,
-0.7738319, -2.961004, -3.558908, 0.7411765, 1, 0, 1,
-0.7697524, 1.408681, -0.108937, 0.7333333, 1, 0, 1,
-0.7682194, 0.7918313, -0.4357219, 0.7294118, 1, 0, 1,
-0.7653469, -0.924753, -3.348369, 0.7215686, 1, 0, 1,
-0.7642384, -1.182356, -3.158906, 0.7176471, 1, 0, 1,
-0.760096, 0.05118111, -2.324851, 0.7098039, 1, 0, 1,
-0.7570201, -0.3462503, -0.4279039, 0.7058824, 1, 0, 1,
-0.7472684, -1.616044, -3.563635, 0.6980392, 1, 0, 1,
-0.7469093, 1.905399, 0.2678822, 0.6901961, 1, 0, 1,
-0.7455475, 0.3631482, -2.718588, 0.6862745, 1, 0, 1,
-0.7408067, 0.1958814, -2.077804, 0.6784314, 1, 0, 1,
-0.7263647, 0.5613821, -1.369384, 0.6745098, 1, 0, 1,
-0.7132463, -1.565362, -2.856291, 0.6666667, 1, 0, 1,
-0.7127879, -0.4494727, -3.86642, 0.6627451, 1, 0, 1,
-0.712664, 2.055753, -0.3766518, 0.654902, 1, 0, 1,
-0.7117274, -0.1497488, -3.44924, 0.6509804, 1, 0, 1,
-0.7100483, -0.1951679, -0.1079627, 0.6431373, 1, 0, 1,
-0.7066024, 0.1149869, -1.666986, 0.6392157, 1, 0, 1,
-0.7014102, -0.09558764, -1.197462, 0.6313726, 1, 0, 1,
-0.6994644, 0.513711, -0.3820642, 0.627451, 1, 0, 1,
-0.6971615, -1.03507, -1.984398, 0.6196079, 1, 0, 1,
-0.6960706, 0.2339815, -1.09838, 0.6156863, 1, 0, 1,
-0.6956484, -0.1618948, -2.82882, 0.6078432, 1, 0, 1,
-0.6953398, -0.7237117, -2.621495, 0.6039216, 1, 0, 1,
-0.6923694, 0.9207731, -0.8843045, 0.5960785, 1, 0, 1,
-0.6916682, -0.9866738, -1.668389, 0.5882353, 1, 0, 1,
-0.6884865, 0.8537865, 1.971314, 0.5843138, 1, 0, 1,
-0.6852161, -1.004925, -1.929814, 0.5764706, 1, 0, 1,
-0.6822782, 1.789906, -0.07085466, 0.572549, 1, 0, 1,
-0.6771584, -0.5764467, -2.238112, 0.5647059, 1, 0, 1,
-0.6690774, 0.5574526, -0.4084327, 0.5607843, 1, 0, 1,
-0.6688276, -0.02422425, -1.952644, 0.5529412, 1, 0, 1,
-0.6661101, 2.206371, -1.377885, 0.5490196, 1, 0, 1,
-0.665094, 1.37864, -0.7968607, 0.5411765, 1, 0, 1,
-0.6555562, -0.2706396, -2.206084, 0.5372549, 1, 0, 1,
-0.653142, -0.193066, -1.374424, 0.5294118, 1, 0, 1,
-0.645933, 0.3002966, -0.4958231, 0.5254902, 1, 0, 1,
-0.6420153, -0.3243382, 0.07453481, 0.5176471, 1, 0, 1,
-0.6410152, 0.07356834, -0.8841865, 0.5137255, 1, 0, 1,
-0.6398504, 1.236328, 0.02137339, 0.5058824, 1, 0, 1,
-0.639119, -0.1341086, -1.966204, 0.5019608, 1, 0, 1,
-0.6337154, 1.510412, -0.8103219, 0.4941176, 1, 0, 1,
-0.6333171, -0.06514864, -0.7943084, 0.4862745, 1, 0, 1,
-0.6311937, 0.8774274, -0.343734, 0.4823529, 1, 0, 1,
-0.6286579, 0.5892534, -1.093981, 0.4745098, 1, 0, 1,
-0.6201916, -2.162035, -3.618486, 0.4705882, 1, 0, 1,
-0.6190742, -0.02613658, -0.5538468, 0.4627451, 1, 0, 1,
-0.6182477, 0.3506295, -0.7156413, 0.4588235, 1, 0, 1,
-0.6115423, 0.2826723, -1.044736, 0.4509804, 1, 0, 1,
-0.6064997, -0.102551, -1.406732, 0.4470588, 1, 0, 1,
-0.6049685, 0.4267998, -1.819226, 0.4392157, 1, 0, 1,
-0.6017867, 2.60896, 1.944207, 0.4352941, 1, 0, 1,
-0.600243, -0.4915755, -1.541183, 0.427451, 1, 0, 1,
-0.5989602, -0.2275209, -3.768484, 0.4235294, 1, 0, 1,
-0.5946475, 0.4830048, -0.1280188, 0.4156863, 1, 0, 1,
-0.5938319, 0.1714294, -1.294199, 0.4117647, 1, 0, 1,
-0.5909576, -1.70244, 0.3542378, 0.4039216, 1, 0, 1,
-0.5878196, 0.2139702, -1.176554, 0.3960784, 1, 0, 1,
-0.5869529, 1.154753, -0.05876544, 0.3921569, 1, 0, 1,
-0.5840909, -1.603007, -3.982227, 0.3843137, 1, 0, 1,
-0.5829209, 0.2016959, -0.222638, 0.3803922, 1, 0, 1,
-0.5744908, -0.04611554, -1.438901, 0.372549, 1, 0, 1,
-0.5681671, -1.193331, -3.181463, 0.3686275, 1, 0, 1,
-0.562453, 0.4604722, 0.04079228, 0.3607843, 1, 0, 1,
-0.5584182, 0.5118812, -0.3939867, 0.3568628, 1, 0, 1,
-0.5568027, -0.2590855, -2.055462, 0.3490196, 1, 0, 1,
-0.554211, 0.9020497, -1.17942, 0.345098, 1, 0, 1,
-0.5526837, -0.1574509, -1.646425, 0.3372549, 1, 0, 1,
-0.5521477, -1.47249, -2.906054, 0.3333333, 1, 0, 1,
-0.5515895, -0.001653763, -1.733315, 0.3254902, 1, 0, 1,
-0.5493909, -0.05148953, -1.205615, 0.3215686, 1, 0, 1,
-0.5483832, 1.024204, 0.4755712, 0.3137255, 1, 0, 1,
-0.5475725, -0.5121987, -1.261129, 0.3098039, 1, 0, 1,
-0.543433, 0.3082168, 0.3009885, 0.3019608, 1, 0, 1,
-0.541846, -0.55488, -2.665823, 0.2941177, 1, 0, 1,
-0.5412593, -0.2943638, -2.746331, 0.2901961, 1, 0, 1,
-0.5408506, 0.8348825, -1.929927, 0.282353, 1, 0, 1,
-0.539987, -0.1379407, -1.186888, 0.2784314, 1, 0, 1,
-0.5371998, -0.1826544, -2.39498, 0.2705882, 1, 0, 1,
-0.5354031, 0.7478427, 1.028743, 0.2666667, 1, 0, 1,
-0.5324134, -0.3663862, -1.761342, 0.2588235, 1, 0, 1,
-0.5320706, -0.8838006, -1.690206, 0.254902, 1, 0, 1,
-0.5319843, 0.9077201, -0.7500108, 0.2470588, 1, 0, 1,
-0.5294741, -0.0233105, -0.5929409, 0.2431373, 1, 0, 1,
-0.5291836, -0.1586473, -0.4230787, 0.2352941, 1, 0, 1,
-0.5262983, 0.3488265, -1.333157, 0.2313726, 1, 0, 1,
-0.5249896, -0.3583582, -2.109628, 0.2235294, 1, 0, 1,
-0.5223742, -2.803154, -3.740953, 0.2196078, 1, 0, 1,
-0.5222521, -0.0352767, -2.475116, 0.2117647, 1, 0, 1,
-0.5207677, 1.307408, 0.1459227, 0.2078431, 1, 0, 1,
-0.5158304, 0.4916281, -2.233701, 0.2, 1, 0, 1,
-0.5148714, -0.4620425, -3.863587, 0.1921569, 1, 0, 1,
-0.5138291, -0.1418272, -2.300934, 0.1882353, 1, 0, 1,
-0.5119215, -0.6065725, -3.285392, 0.1803922, 1, 0, 1,
-0.5089633, 0.6711102, -1.594351, 0.1764706, 1, 0, 1,
-0.5071747, -0.2567395, -0.9496882, 0.1686275, 1, 0, 1,
-0.5060673, 0.6636295, -0.7684582, 0.1647059, 1, 0, 1,
-0.5046207, -0.6661112, -4.199829, 0.1568628, 1, 0, 1,
-0.5023336, -1.808032, -2.788237, 0.1529412, 1, 0, 1,
-0.4997583, 0.721861, 1.064416, 0.145098, 1, 0, 1,
-0.4868255, -0.2601992, -0.2067607, 0.1411765, 1, 0, 1,
-0.4863604, -1.474226, -2.123409, 0.1333333, 1, 0, 1,
-0.4861303, -0.6879467, -4.110541, 0.1294118, 1, 0, 1,
-0.4849918, -1.677558, -2.841053, 0.1215686, 1, 0, 1,
-0.4844348, 2.529164, 0.910552, 0.1176471, 1, 0, 1,
-0.4774659, 1.754665, 0.1719773, 0.1098039, 1, 0, 1,
-0.4766263, -1.281823, -2.23108, 0.1058824, 1, 0, 1,
-0.4727452, 0.203998, -0.108666, 0.09803922, 1, 0, 1,
-0.4702419, -0.9944513, -2.981995, 0.09019608, 1, 0, 1,
-0.4699317, -2.172692, -1.93549, 0.08627451, 1, 0, 1,
-0.4686652, 0.8538182, -1.52923, 0.07843138, 1, 0, 1,
-0.4685364, 0.5550178, -1.344171, 0.07450981, 1, 0, 1,
-0.4674566, -1.120302, -3.317161, 0.06666667, 1, 0, 1,
-0.4657424, -0.4034452, -1.908836, 0.0627451, 1, 0, 1,
-0.4624233, 0.1599283, -2.682729, 0.05490196, 1, 0, 1,
-0.4559698, 0.6694745, -2.128724, 0.05098039, 1, 0, 1,
-0.4553369, 0.5141528, -0.8364893, 0.04313726, 1, 0, 1,
-0.4517459, -0.286148, -2.36388, 0.03921569, 1, 0, 1,
-0.4507675, 1.087923, 0.7106569, 0.03137255, 1, 0, 1,
-0.4435976, -0.2712886, -1.75977, 0.02745098, 1, 0, 1,
-0.4425117, 0.2261467, 0.696174, 0.01960784, 1, 0, 1,
-0.4407944, -0.8428037, -2.267598, 0.01568628, 1, 0, 1,
-0.4391907, -0.1834905, -2.540119, 0.007843138, 1, 0, 1,
-0.4389777, 0.4655266, -0.4973269, 0.003921569, 1, 0, 1,
-0.4367694, 1.170349, 1.874263, 0, 1, 0.003921569, 1,
-0.4354389, -0.9265195, -2.257882, 0, 1, 0.01176471, 1,
-0.4289881, -0.2234282, -1.668222, 0, 1, 0.01568628, 1,
-0.428899, -2.213624, -2.176025, 0, 1, 0.02352941, 1,
-0.4286759, 0.6782097, -0.3758543, 0, 1, 0.02745098, 1,
-0.4240217, 0.6877646, 0.007097466, 0, 1, 0.03529412, 1,
-0.4236198, -0.4864003, -2.742532, 0, 1, 0.03921569, 1,
-0.4226102, 0.2609749, -2.696064, 0, 1, 0.04705882, 1,
-0.4221744, -0.4283883, -3.766817, 0, 1, 0.05098039, 1,
-0.4221058, -0.7415674, -2.239774, 0, 1, 0.05882353, 1,
-0.4135328, -1.208292, -4.209624, 0, 1, 0.0627451, 1,
-0.411705, -0.8811386, -3.03926, 0, 1, 0.07058824, 1,
-0.4101518, 0.3660638, 0.6240627, 0, 1, 0.07450981, 1,
-0.405998, 0.3085746, -0.1986984, 0, 1, 0.08235294, 1,
-0.405793, -0.488935, -3.576655, 0, 1, 0.08627451, 1,
-0.404997, -0.5941096, -2.945169, 0, 1, 0.09411765, 1,
-0.403682, 1.326996, -1.255772, 0, 1, 0.1019608, 1,
-0.3991706, -0.2124531, -2.941376, 0, 1, 0.1058824, 1,
-0.3962869, -0.7358875, -2.064888, 0, 1, 0.1137255, 1,
-0.3881482, -1.623139, -2.441888, 0, 1, 0.1176471, 1,
-0.387861, 1.521213, 3.087084, 0, 1, 0.1254902, 1,
-0.3872668, -0.1482943, -1.960801, 0, 1, 0.1294118, 1,
-0.3829962, 1.2495, -1.296162, 0, 1, 0.1372549, 1,
-0.3826939, 0.5053464, -0.8068914, 0, 1, 0.1411765, 1,
-0.3818148, 1.716918, -0.883675, 0, 1, 0.1490196, 1,
-0.3807959, -0.3097209, -2.621471, 0, 1, 0.1529412, 1,
-0.3782988, 0.2318266, -1.092095, 0, 1, 0.1607843, 1,
-0.376568, -0.4269041, -1.509766, 0, 1, 0.1647059, 1,
-0.3757993, 0.9986514, -0.6894039, 0, 1, 0.172549, 1,
-0.3732137, -1.074285, -2.065766, 0, 1, 0.1764706, 1,
-0.3690296, -0.1692907, -3.767334, 0, 1, 0.1843137, 1,
-0.3684884, -0.3508579, -2.329666, 0, 1, 0.1882353, 1,
-0.3683229, 0.3760967, -0.2539269, 0, 1, 0.1960784, 1,
-0.3665302, -1.779856, -2.598318, 0, 1, 0.2039216, 1,
-0.357829, -0.2191779, -2.65867, 0, 1, 0.2078431, 1,
-0.3565342, -0.2753423, -4.469326, 0, 1, 0.2156863, 1,
-0.3559886, 1.288811, -0.8711065, 0, 1, 0.2196078, 1,
-0.3537886, 0.325221, 0.2608997, 0, 1, 0.227451, 1,
-0.3499654, 1.962902, -0.4392606, 0, 1, 0.2313726, 1,
-0.3460082, -1.845484, -3.782795, 0, 1, 0.2392157, 1,
-0.3379783, 0.2079745, -0.05479265, 0, 1, 0.2431373, 1,
-0.337676, -0.5755424, -2.753567, 0, 1, 0.2509804, 1,
-0.3371905, 1.568706, 0.3292174, 0, 1, 0.254902, 1,
-0.3349733, -1.655578, -2.869228, 0, 1, 0.2627451, 1,
-0.3333294, 0.4596351, 1.831577, 0, 1, 0.2666667, 1,
-0.3299636, -0.6527185, -2.184331, 0, 1, 0.2745098, 1,
-0.3236237, 1.030992, 0.2369198, 0, 1, 0.2784314, 1,
-0.323318, -0.3709053, -3.879265, 0, 1, 0.2862745, 1,
-0.3171025, 0.1020544, -3.015611, 0, 1, 0.2901961, 1,
-0.3126003, -0.7779816, -2.520956, 0, 1, 0.2980392, 1,
-0.309821, 0.5386258, -1.05393, 0, 1, 0.3058824, 1,
-0.3091345, 0.4840665, 0.005140326, 0, 1, 0.3098039, 1,
-0.3079632, 0.0564422, -1.527144, 0, 1, 0.3176471, 1,
-0.3057787, 0.01018835, 0.04794956, 0, 1, 0.3215686, 1,
-0.3039815, -0.6908228, -2.915947, 0, 1, 0.3294118, 1,
-0.3017748, -0.5157358, -1.391502, 0, 1, 0.3333333, 1,
-0.2996118, -0.548041, -2.489972, 0, 1, 0.3411765, 1,
-0.2994745, 0.7369941, -1.591925, 0, 1, 0.345098, 1,
-0.2981554, -0.08493982, -0.7783657, 0, 1, 0.3529412, 1,
-0.2959467, -0.2806817, -2.48199, 0, 1, 0.3568628, 1,
-0.2951801, 0.8702849, 0.9288422, 0, 1, 0.3647059, 1,
-0.2944401, 1.620203, -1.206307, 0, 1, 0.3686275, 1,
-0.2943643, 1.86725, 0.8278348, 0, 1, 0.3764706, 1,
-0.2916557, -0.5036885, -3.297746, 0, 1, 0.3803922, 1,
-0.2857941, 1.091858, 0.3066117, 0, 1, 0.3882353, 1,
-0.285455, 0.2983139, -0.6686401, 0, 1, 0.3921569, 1,
-0.2841462, 0.02675718, 0.04481328, 0, 1, 0.4, 1,
-0.2832757, -0.02980993, -1.022097, 0, 1, 0.4078431, 1,
-0.2813314, -1.439717, -4.83273, 0, 1, 0.4117647, 1,
-0.2789203, 0.5216401, -0.5606393, 0, 1, 0.4196078, 1,
-0.2745036, -0.5778996, -1.656207, 0, 1, 0.4235294, 1,
-0.2731686, 0.1972329, -0.7011694, 0, 1, 0.4313726, 1,
-0.2676543, 0.2618787, -0.6049561, 0, 1, 0.4352941, 1,
-0.2670284, -2.871113, -4.510013, 0, 1, 0.4431373, 1,
-0.266633, 0.6498398, -0.4035771, 0, 1, 0.4470588, 1,
-0.2629765, 0.2734812, -0.001023394, 0, 1, 0.454902, 1,
-0.259764, 1.928354, -0.7187089, 0, 1, 0.4588235, 1,
-0.2594667, 1.306454, 0.2917355, 0, 1, 0.4666667, 1,
-0.2553669, -1.592997, -3.272702, 0, 1, 0.4705882, 1,
-0.2548943, -1.947926, -1.736948, 0, 1, 0.4784314, 1,
-0.2521137, 0.009088534, -2.513349, 0, 1, 0.4823529, 1,
-0.2519497, 0.4253607, -0.4460362, 0, 1, 0.4901961, 1,
-0.2514443, 0.1288951, -1.409659, 0, 1, 0.4941176, 1,
-0.2481693, 0.1273838, -0.3270714, 0, 1, 0.5019608, 1,
-0.2473168, -0.5463448, -1.931507, 0, 1, 0.509804, 1,
-0.2461368, -0.08983894, -1.753256, 0, 1, 0.5137255, 1,
-0.2455782, -0.9001506, -0.778585, 0, 1, 0.5215687, 1,
-0.2442941, -1.416868, -4.235138, 0, 1, 0.5254902, 1,
-0.2422122, -1.282109, -2.01621, 0, 1, 0.5333334, 1,
-0.2402512, -0.5017425, -2.5931, 0, 1, 0.5372549, 1,
-0.2380213, -0.8287199, -2.913182, 0, 1, 0.5450981, 1,
-0.2379216, -0.1635244, -1.8441, 0, 1, 0.5490196, 1,
-0.2365659, 0.816588, -2.927785, 0, 1, 0.5568628, 1,
-0.2329611, -0.6450809, -3.419996, 0, 1, 0.5607843, 1,
-0.2314956, -0.3681225, -2.497679, 0, 1, 0.5686275, 1,
-0.2308107, 0.09063189, 1.670554, 0, 1, 0.572549, 1,
-0.2211568, 0.3532097, -1.335891, 0, 1, 0.5803922, 1,
-0.2188303, -0.6456304, -2.593071, 0, 1, 0.5843138, 1,
-0.2156435, 1.541313, -1.73911, 0, 1, 0.5921569, 1,
-0.2136961, -0.1928416, -2.895635, 0, 1, 0.5960785, 1,
-0.2092411, 1.586526, -0.3478135, 0, 1, 0.6039216, 1,
-0.2055016, -1.033527, -4.23617, 0, 1, 0.6117647, 1,
-0.2023786, 0.8883466, -0.870186, 0, 1, 0.6156863, 1,
-0.2012192, -0.406652, -0.8525845, 0, 1, 0.6235294, 1,
-0.1994881, 0.08016152, -2.338653, 0, 1, 0.627451, 1,
-0.1986534, 0.4967973, -0.004035953, 0, 1, 0.6352941, 1,
-0.1960189, 0.9453168, 0.8523498, 0, 1, 0.6392157, 1,
-0.1922299, 0.5229354, -0.8205502, 0, 1, 0.6470588, 1,
-0.1914316, -0.190504, -3.91324, 0, 1, 0.6509804, 1,
-0.1860259, -0.3580161, -2.340461, 0, 1, 0.6588235, 1,
-0.1834119, 0.3511456, -0.4540349, 0, 1, 0.6627451, 1,
-0.1827451, 0.8389893, 1.025198, 0, 1, 0.6705883, 1,
-0.1824234, -2.346823, -2.996082, 0, 1, 0.6745098, 1,
-0.1757584, 0.6052418, -0.6292161, 0, 1, 0.682353, 1,
-0.1718116, 1.186303, -0.6740534, 0, 1, 0.6862745, 1,
-0.1692964, -0.2673471, -2.734491, 0, 1, 0.6941177, 1,
-0.1678817, 1.448536, 1.781433, 0, 1, 0.7019608, 1,
-0.1672871, 0.6544189, -0.9225371, 0, 1, 0.7058824, 1,
-0.1524858, -1.625211, -3.376805, 0, 1, 0.7137255, 1,
-0.1500578, 0.8649693, -0.6284071, 0, 1, 0.7176471, 1,
-0.1453146, 0.8657163, -0.3287508, 0, 1, 0.7254902, 1,
-0.144991, 0.7482865, 0.1121962, 0, 1, 0.7294118, 1,
-0.1378008, 1.036651, -1.27413, 0, 1, 0.7372549, 1,
-0.1375617, -0.6023751, -3.856137, 0, 1, 0.7411765, 1,
-0.1364713, -1.718584, -2.399091, 0, 1, 0.7490196, 1,
-0.1347722, 1.049831, 1.142676, 0, 1, 0.7529412, 1,
-0.1305498, -0.8306272, -2.891173, 0, 1, 0.7607843, 1,
-0.1249265, -0.4717221, -2.938445, 0, 1, 0.7647059, 1,
-0.1247373, 0.3845605, 0.1608876, 0, 1, 0.772549, 1,
-0.1185865, 0.7365453, -1.617132, 0, 1, 0.7764706, 1,
-0.1159413, 0.3663784, -1.489518, 0, 1, 0.7843137, 1,
-0.1158778, 0.7974233, 0.5525293, 0, 1, 0.7882353, 1,
-0.111411, 0.3931085, -1.223256, 0, 1, 0.7960784, 1,
-0.1101575, -1.427895, -3.333627, 0, 1, 0.8039216, 1,
-0.1074472, -1.184626, -3.868069, 0, 1, 0.8078431, 1,
-0.1050618, 1.225113, -1.480803, 0, 1, 0.8156863, 1,
-0.1027111, -0.07032627, -2.86751, 0, 1, 0.8196079, 1,
-0.1017459, 0.06695814, -2.304106, 0, 1, 0.827451, 1,
-0.09969074, -0.8582917, -3.704207, 0, 1, 0.8313726, 1,
-0.0943208, -1.997391, -4.262781, 0, 1, 0.8392157, 1,
-0.09385131, -1.439001, -2.913356, 0, 1, 0.8431373, 1,
-0.09202773, 0.6720048, 0.659196, 0, 1, 0.8509804, 1,
-0.09201506, -1.212217, -3.899743, 0, 1, 0.854902, 1,
-0.09177677, 1.189759, 0.01381483, 0, 1, 0.8627451, 1,
-0.0861857, 0.3297841, 2.260762, 0, 1, 0.8666667, 1,
-0.08577575, 0.1168764, -0.4406811, 0, 1, 0.8745098, 1,
-0.08157165, 0.6848662, 0.4519113, 0, 1, 0.8784314, 1,
-0.08067507, 0.8580723, 0.6673441, 0, 1, 0.8862745, 1,
-0.07875392, -0.5713367, -4.244642, 0, 1, 0.8901961, 1,
-0.07801874, 0.01500654, -1.370876, 0, 1, 0.8980392, 1,
-0.07764998, -0.6085369, -0.8501969, 0, 1, 0.9058824, 1,
-0.06934433, -1.082779, -3.99919, 0, 1, 0.9098039, 1,
-0.0621779, -0.3801643, -2.299429, 0, 1, 0.9176471, 1,
-0.06191711, 0.5388611, 0.2651393, 0, 1, 0.9215686, 1,
-0.05902023, 0.5948707, 1.342863, 0, 1, 0.9294118, 1,
-0.05441331, 0.2899538, -1.135325, 0, 1, 0.9333333, 1,
-0.05417721, 0.2587603, 0.9419528, 0, 1, 0.9411765, 1,
-0.05393236, 0.1179825, -0.4452705, 0, 1, 0.945098, 1,
-0.05331739, -0.2359944, -2.735615, 0, 1, 0.9529412, 1,
-0.05140858, 0.4375288, 0.3281858, 0, 1, 0.9568627, 1,
-0.04764894, 0.6057031, 1.226337, 0, 1, 0.9647059, 1,
-0.04612756, -0.2154053, -2.488317, 0, 1, 0.9686275, 1,
-0.04303996, 0.9866106, -0.1962863, 0, 1, 0.9764706, 1,
-0.03806435, -1.593212, -4.112508, 0, 1, 0.9803922, 1,
-0.03677281, 0.2835981, -1.12159, 0, 1, 0.9882353, 1,
-0.02876237, 1.170432, -1.281752, 0, 1, 0.9921569, 1,
-0.02484687, 0.5590014, 0.4549146, 0, 1, 1, 1,
-0.02470777, 1.426965, -0.3634202, 0, 0.9921569, 1, 1,
-0.0204364, 1.202695, -0.7246928, 0, 0.9882353, 1, 1,
-0.01915054, 0.3304025, 0.4716875, 0, 0.9803922, 1, 1,
-0.01774875, -0.3236263, -4.197479, 0, 0.9764706, 1, 1,
-0.0164772, -0.6041933, -5.385568, 0, 0.9686275, 1, 1,
-0.01299838, 0.3112805, -0.9106938, 0, 0.9647059, 1, 1,
-0.003614914, -0.9837646, -4.578726, 0, 0.9568627, 1, 1,
-0.002663072, 0.4260999, 0.2829306, 0, 0.9529412, 1, 1,
-0.002252321, -1.380131, -1.995502, 0, 0.945098, 1, 1,
0.0007417375, -1.223879, 4.407253, 0, 0.9411765, 1, 1,
0.002930185, 1.397113, -0.4881145, 0, 0.9333333, 1, 1,
0.00456582, -0.0464894, 3.943885, 0, 0.9294118, 1, 1,
0.01594339, -1.230756, 2.947375, 0, 0.9215686, 1, 1,
0.01946795, 1.211963, 0.7115299, 0, 0.9176471, 1, 1,
0.03120476, -0.2929473, -0.3283961, 0, 0.9098039, 1, 1,
0.03315222, -1.443277, 4.178336, 0, 0.9058824, 1, 1,
0.03486018, 0.6646446, -0.6383186, 0, 0.8980392, 1, 1,
0.03703194, -0.5575967, 2.797359, 0, 0.8901961, 1, 1,
0.03720269, 0.1772358, 1.708198, 0, 0.8862745, 1, 1,
0.04145015, 1.178298, -0.1608705, 0, 0.8784314, 1, 1,
0.0449874, 1.034468, -1.681181, 0, 0.8745098, 1, 1,
0.04872315, -0.4364551, 2.730635, 0, 0.8666667, 1, 1,
0.05086483, -1.269489, 1.639181, 0, 0.8627451, 1, 1,
0.0510521, -0.3656103, 3.826504, 0, 0.854902, 1, 1,
0.051297, -0.8143317, 4.014896, 0, 0.8509804, 1, 1,
0.05294678, 0.6427925, -0.375178, 0, 0.8431373, 1, 1,
0.05602423, -0.5840315, 1.420108, 0, 0.8392157, 1, 1,
0.05724347, -0.3791515, 2.62326, 0, 0.8313726, 1, 1,
0.06094931, 0.6787046, -0.07092731, 0, 0.827451, 1, 1,
0.06466466, -1.061566, 2.934265, 0, 0.8196079, 1, 1,
0.06596035, -0.776716, 2.568338, 0, 0.8156863, 1, 1,
0.06855699, 0.5322458, 0.4577072, 0, 0.8078431, 1, 1,
0.06944627, 0.44402, 0.3562986, 0, 0.8039216, 1, 1,
0.07507126, 1.928529, 1.254599, 0, 0.7960784, 1, 1,
0.07967736, 1.031041, -0.5731438, 0, 0.7882353, 1, 1,
0.08048952, 0.4914028, -2.442612, 0, 0.7843137, 1, 1,
0.08102217, -1.913411, 3.532403, 0, 0.7764706, 1, 1,
0.08192302, -0.7747054, 2.72018, 0, 0.772549, 1, 1,
0.08218817, -0.3856699, 2.52782, 0, 0.7647059, 1, 1,
0.08637511, 0.2940791, -1.75229, 0, 0.7607843, 1, 1,
0.09324897, -2.077522, 1.810328, 0, 0.7529412, 1, 1,
0.0955742, 0.344956, -1.186182, 0, 0.7490196, 1, 1,
0.09673589, -1.083286, 3.659084, 0, 0.7411765, 1, 1,
0.0992648, 0.4968968, 1.459396, 0, 0.7372549, 1, 1,
0.1053096, 0.995913, 0.5032566, 0, 0.7294118, 1, 1,
0.1103534, -0.5856836, 3.264334, 0, 0.7254902, 1, 1,
0.1125999, -1.143036, 3.874598, 0, 0.7176471, 1, 1,
0.1161142, -0.6596427, 2.073525, 0, 0.7137255, 1, 1,
0.1207973, 0.8195152, -1.446985, 0, 0.7058824, 1, 1,
0.1210974, 1.605004, -2.603545, 0, 0.6980392, 1, 1,
0.1214136, 2.046169, -0.3580444, 0, 0.6941177, 1, 1,
0.1237065, -0.4719253, 2.616814, 0, 0.6862745, 1, 1,
0.1289301, 0.4023713, -1.107318, 0, 0.682353, 1, 1,
0.1345972, -0.2473714, 2.892611, 0, 0.6745098, 1, 1,
0.1397318, 1.454969, 1.346819, 0, 0.6705883, 1, 1,
0.141105, 1.601408, -1.428792, 0, 0.6627451, 1, 1,
0.1419083, 0.08318885, -0.1229145, 0, 0.6588235, 1, 1,
0.1427063, 0.3117009, 1.389889, 0, 0.6509804, 1, 1,
0.1458684, -0.7736399, 3.817116, 0, 0.6470588, 1, 1,
0.1504026, -0.5513325, 2.246113, 0, 0.6392157, 1, 1,
0.1529176, -0.7463717, 4.049619, 0, 0.6352941, 1, 1,
0.1538111, 2.515753, -1.392342, 0, 0.627451, 1, 1,
0.1555715, 1.152405, -2.827567, 0, 0.6235294, 1, 1,
0.1556033, -0.7787422, 2.889995, 0, 0.6156863, 1, 1,
0.1586584, -0.9314012, 2.810487, 0, 0.6117647, 1, 1,
0.1588902, 1.619448, -1.182402, 0, 0.6039216, 1, 1,
0.1606481, 0.8071255, -0.5572922, 0, 0.5960785, 1, 1,
0.1612996, -0.6142626, 3.165387, 0, 0.5921569, 1, 1,
0.1626376, 0.9266088, -0.9661012, 0, 0.5843138, 1, 1,
0.1628024, -0.7529306, 3.366238, 0, 0.5803922, 1, 1,
0.1649905, -1.171933, 2.609794, 0, 0.572549, 1, 1,
0.1677422, -0.8862474, 3.993733, 0, 0.5686275, 1, 1,
0.1681815, -1.656767, 3.224775, 0, 0.5607843, 1, 1,
0.1720913, -1.461429, 3.309825, 0, 0.5568628, 1, 1,
0.173526, 1.036238, -1.099488, 0, 0.5490196, 1, 1,
0.174003, -0.3467129, 1.296382, 0, 0.5450981, 1, 1,
0.1764314, -0.1423397, 1.719904, 0, 0.5372549, 1, 1,
0.1800384, -0.2601166, 1.189904, 0, 0.5333334, 1, 1,
0.1832487, 0.2677273, 1.201037, 0, 0.5254902, 1, 1,
0.1863654, 1.305061, 1.292193, 0, 0.5215687, 1, 1,
0.1873994, -0.4816979, 1.448122, 0, 0.5137255, 1, 1,
0.1896835, 0.9315962, 1.565663, 0, 0.509804, 1, 1,
0.1897852, -0.05551141, 2.107388, 0, 0.5019608, 1, 1,
0.1922832, -0.5819185, 2.985367, 0, 0.4941176, 1, 1,
0.1926975, 1.236991, 0.6066081, 0, 0.4901961, 1, 1,
0.1964441, -1.678384, 2.92424, 0, 0.4823529, 1, 1,
0.1968013, -1.075223, 2.362712, 0, 0.4784314, 1, 1,
0.1996385, 0.08258542, 1.604188, 0, 0.4705882, 1, 1,
0.2014807, 1.337432, 0.05611606, 0, 0.4666667, 1, 1,
0.2151704, 0.02781943, 0.07335372, 0, 0.4588235, 1, 1,
0.2199926, 0.3172445, 0.8837469, 0, 0.454902, 1, 1,
0.2250228, -0.7905281, 3.063125, 0, 0.4470588, 1, 1,
0.2336895, -0.7466392, 1.985227, 0, 0.4431373, 1, 1,
0.2393361, 0.5982385, 0.7068547, 0, 0.4352941, 1, 1,
0.2409771, -0.2428269, 2.544, 0, 0.4313726, 1, 1,
0.2416472, -0.4069982, 0.6992313, 0, 0.4235294, 1, 1,
0.2444027, -1.304568, 1.368477, 0, 0.4196078, 1, 1,
0.2447828, 0.03856662, 1.393032, 0, 0.4117647, 1, 1,
0.2453567, 0.1425718, 0.5811461, 0, 0.4078431, 1, 1,
0.2458219, -1.449866, 3.157389, 0, 0.4, 1, 1,
0.2481442, 0.3090617, -0.8564886, 0, 0.3921569, 1, 1,
0.2518627, 0.515523, 1.628644, 0, 0.3882353, 1, 1,
0.2573171, 1.047266, 0.7158191, 0, 0.3803922, 1, 1,
0.2582051, 0.2297123, 0.8811358, 0, 0.3764706, 1, 1,
0.2583676, 0.3191318, 0.07799067, 0, 0.3686275, 1, 1,
0.2607009, 0.1345151, 0.9689134, 0, 0.3647059, 1, 1,
0.26497, -1.009128, 2.798285, 0, 0.3568628, 1, 1,
0.2680013, 1.193699, 1.474821, 0, 0.3529412, 1, 1,
0.268428, 0.2047934, 0.6804104, 0, 0.345098, 1, 1,
0.2717157, -1.289298, 4.055323, 0, 0.3411765, 1, 1,
0.2756806, -0.3293386, 1.577775, 0, 0.3333333, 1, 1,
0.2762406, 0.930844, 1.094174, 0, 0.3294118, 1, 1,
0.2851979, 0.02427332, 0.9109146, 0, 0.3215686, 1, 1,
0.2856484, -0.2731866, 3.171758, 0, 0.3176471, 1, 1,
0.2919162, -1.019821, 2.270251, 0, 0.3098039, 1, 1,
0.2921873, 0.2282484, -0.8654839, 0, 0.3058824, 1, 1,
0.3015953, 1.336729, -0.04424667, 0, 0.2980392, 1, 1,
0.3055016, -0.3737851, 2.187898, 0, 0.2901961, 1, 1,
0.3061282, -0.8252993, 2.255834, 0, 0.2862745, 1, 1,
0.3068089, 0.314191, -0.07625777, 0, 0.2784314, 1, 1,
0.3100403, -1.052572, 2.387713, 0, 0.2745098, 1, 1,
0.3116807, 1.3433, -0.3733805, 0, 0.2666667, 1, 1,
0.3124962, -1.086705, 2.076163, 0, 0.2627451, 1, 1,
0.3125491, 0.4394891, 0.4557051, 0, 0.254902, 1, 1,
0.3193814, 0.1995425, 2.816098, 0, 0.2509804, 1, 1,
0.3208141, 0.2946541, -0.3422629, 0, 0.2431373, 1, 1,
0.3222285, -0.1373939, 2.821181, 0, 0.2392157, 1, 1,
0.3243173, 0.3541843, -0.5619407, 0, 0.2313726, 1, 1,
0.3248149, -0.1296608, 0.8805989, 0, 0.227451, 1, 1,
0.3252108, -0.7993493, 2.674283, 0, 0.2196078, 1, 1,
0.325442, -0.6247142, 2.821656, 0, 0.2156863, 1, 1,
0.3266046, 0.003071968, 1.029544, 0, 0.2078431, 1, 1,
0.3273571, -0.1705908, 2.276839, 0, 0.2039216, 1, 1,
0.3293043, 0.1735019, 1.015027, 0, 0.1960784, 1, 1,
0.3303714, -0.7910231, 2.958409, 0, 0.1882353, 1, 1,
0.3311714, 2.216046, -1.712012, 0, 0.1843137, 1, 1,
0.3432865, -0.8678458, 3.037249, 0, 0.1764706, 1, 1,
0.3441873, -0.2331285, 0.7918718, 0, 0.172549, 1, 1,
0.3447901, -1.613884, 3.421247, 0, 0.1647059, 1, 1,
0.3526824, -0.4893337, 3.027287, 0, 0.1607843, 1, 1,
0.3715402, -0.6459953, 3.52862, 0, 0.1529412, 1, 1,
0.3715623, 0.6928204, 0.9177759, 0, 0.1490196, 1, 1,
0.3747675, 0.1938144, 1.563595, 0, 0.1411765, 1, 1,
0.3820974, -0.551823, 1.819454, 0, 0.1372549, 1, 1,
0.3846096, 0.5951331, -1.34476, 0, 0.1294118, 1, 1,
0.3858512, -0.24198, 2.988935, 0, 0.1254902, 1, 1,
0.3873724, -1.114599, 2.628612, 0, 0.1176471, 1, 1,
0.3873747, 0.2651311, 1.179749, 0, 0.1137255, 1, 1,
0.3879758, 0.9561741, 0.1934576, 0, 0.1058824, 1, 1,
0.389452, 0.6524982, 2.261947, 0, 0.09803922, 1, 1,
0.3962204, 2.188998, 0.7953386, 0, 0.09411765, 1, 1,
0.3980209, 1.066597, 0.482597, 0, 0.08627451, 1, 1,
0.3987614, 0.1694388, 1.127429, 0, 0.08235294, 1, 1,
0.401375, -1.006541, 5.195841, 0, 0.07450981, 1, 1,
0.4023647, -1.092235, 3.13616, 0, 0.07058824, 1, 1,
0.4033272, -0.2203235, 0.8758743, 0, 0.0627451, 1, 1,
0.4049128, -0.8091719, 4.271542, 0, 0.05882353, 1, 1,
0.4132246, -0.9272283, 1.410587, 0, 0.05098039, 1, 1,
0.4166651, -0.7207971, 3.140899, 0, 0.04705882, 1, 1,
0.4188453, 0.1300207, 0.3068305, 0, 0.03921569, 1, 1,
0.4224955, -0.008796652, 1.671546, 0, 0.03529412, 1, 1,
0.429545, -1.88967, 3.397839, 0, 0.02745098, 1, 1,
0.4323902, -0.135468, 2.282341, 0, 0.02352941, 1, 1,
0.433147, -0.9753369, 2.658008, 0, 0.01568628, 1, 1,
0.4341127, -0.07223327, 0.9302274, 0, 0.01176471, 1, 1,
0.4353873, 0.6588229, 2.280879, 0, 0.003921569, 1, 1,
0.4382892, -1.447522, 4.002562, 0.003921569, 0, 1, 1,
0.4384011, 0.09891535, 1.829269, 0.007843138, 0, 1, 1,
0.4406277, 1.332934, 1.203879, 0.01568628, 0, 1, 1,
0.4406881, 0.578604, 0.6692291, 0.01960784, 0, 1, 1,
0.443468, -0.9508011, 2.51438, 0.02745098, 0, 1, 1,
0.4539414, -1.339739, 2.345784, 0.03137255, 0, 1, 1,
0.4618048, -0.8798321, 1.076997, 0.03921569, 0, 1, 1,
0.4627187, 0.629749, 1.58949, 0.04313726, 0, 1, 1,
0.4633123, 0.6457608, -0.7666112, 0.05098039, 0, 1, 1,
0.4666434, 1.749056, -1.253736, 0.05490196, 0, 1, 1,
0.471603, -0.8635545, 1.290054, 0.0627451, 0, 1, 1,
0.4724686, -1.12697, 1.333523, 0.06666667, 0, 1, 1,
0.4755595, -1.683407, 2.194599, 0.07450981, 0, 1, 1,
0.4805662, -2.382744, 1.927307, 0.07843138, 0, 1, 1,
0.4811572, -1.042389, 2.917952, 0.08627451, 0, 1, 1,
0.486744, -0.2386916, 2.072224, 0.09019608, 0, 1, 1,
0.4879037, -0.001594676, 2.506376, 0.09803922, 0, 1, 1,
0.4916272, 1.859557, -0.5432485, 0.1058824, 0, 1, 1,
0.4935144, -0.7685657, 3.323041, 0.1098039, 0, 1, 1,
0.4972123, 0.07877418, 2.216433, 0.1176471, 0, 1, 1,
0.497988, -0.1941869, 0.8787971, 0.1215686, 0, 1, 1,
0.5053496, 0.7600213, 2.48233, 0.1294118, 0, 1, 1,
0.5070413, 1.627859, 0.7631607, 0.1333333, 0, 1, 1,
0.5086066, -1.220446, 5.137136, 0.1411765, 0, 1, 1,
0.5124722, -2.967588, 3.606855, 0.145098, 0, 1, 1,
0.5129366, 0.100278, 2.717471, 0.1529412, 0, 1, 1,
0.5136753, -0.4049733, 2.340293, 0.1568628, 0, 1, 1,
0.513908, -0.3481523, 2.581631, 0.1647059, 0, 1, 1,
0.5162153, -0.6838387, 3.294137, 0.1686275, 0, 1, 1,
0.5187159, 0.2182192, 1.543981, 0.1764706, 0, 1, 1,
0.5226265, 1.067372, 1.16519, 0.1803922, 0, 1, 1,
0.5236067, 0.9685975, -0.04643833, 0.1882353, 0, 1, 1,
0.5261436, 0.4204624, -0.02740389, 0.1921569, 0, 1, 1,
0.5285287, 0.8727466, -0.390011, 0.2, 0, 1, 1,
0.5292974, -1.641304, 0.532895, 0.2078431, 0, 1, 1,
0.5294625, -0.2808613, 1.5258, 0.2117647, 0, 1, 1,
0.5325759, -0.3153716, 1.632672, 0.2196078, 0, 1, 1,
0.5325853, 0.2337402, 2.786149, 0.2235294, 0, 1, 1,
0.535418, 0.976734, 0.07162808, 0.2313726, 0, 1, 1,
0.5431361, -1.117326, 3.280774, 0.2352941, 0, 1, 1,
0.5545374, 0.8944913, -0.08877258, 0.2431373, 0, 1, 1,
0.5551348, 0.448346, -0.01050144, 0.2470588, 0, 1, 1,
0.5602822, 0.8586362, -0.4328524, 0.254902, 0, 1, 1,
0.5649862, 0.8130886, 0.6021691, 0.2588235, 0, 1, 1,
0.5693915, -0.3279833, 0.8814514, 0.2666667, 0, 1, 1,
0.5766113, 0.8659399, 0.2683546, 0.2705882, 0, 1, 1,
0.5768712, 0.3896521, 0.8019173, 0.2784314, 0, 1, 1,
0.5804937, -0.6647831, 2.116955, 0.282353, 0, 1, 1,
0.5811974, -0.190175, 2.280202, 0.2901961, 0, 1, 1,
0.5832469, -0.9434544, 2.796169, 0.2941177, 0, 1, 1,
0.5872789, -0.7822319, 2.930381, 0.3019608, 0, 1, 1,
0.5895083, 0.8191216, -2.586161, 0.3098039, 0, 1, 1,
0.5943832, -0.738296, 2.664984, 0.3137255, 0, 1, 1,
0.5996162, 0.3619321, 0.4064969, 0.3215686, 0, 1, 1,
0.6008666, 1.149357, 0.6988234, 0.3254902, 0, 1, 1,
0.6050671, 1.918562, 0.8449612, 0.3333333, 0, 1, 1,
0.608255, 2.154394, 0.002269947, 0.3372549, 0, 1, 1,
0.6117151, 0.6143204, -0.9199797, 0.345098, 0, 1, 1,
0.6145247, 0.9526002, 0.02627278, 0.3490196, 0, 1, 1,
0.6174125, -0.5037219, 2.007367, 0.3568628, 0, 1, 1,
0.6175335, 0.3236043, 1.163541, 0.3607843, 0, 1, 1,
0.6222401, -1.108165, 1.888073, 0.3686275, 0, 1, 1,
0.6233501, 1.395427, 0.3761282, 0.372549, 0, 1, 1,
0.6234723, 1.091842, -0.4446945, 0.3803922, 0, 1, 1,
0.6263567, -1.634895, 1.111238, 0.3843137, 0, 1, 1,
0.6269478, 0.09708602, 1.388878, 0.3921569, 0, 1, 1,
0.6339447, 0.8738433, 1.076355, 0.3960784, 0, 1, 1,
0.6355011, -0.2773074, 2.061602, 0.4039216, 0, 1, 1,
0.6380526, 0.3680412, 1.070433, 0.4117647, 0, 1, 1,
0.6394526, 0.2138418, 1.06234, 0.4156863, 0, 1, 1,
0.6395445, -1.187543, 4.230693, 0.4235294, 0, 1, 1,
0.6469104, -0.7595434, 3.738097, 0.427451, 0, 1, 1,
0.6487075, 0.7062644, -0.1418925, 0.4352941, 0, 1, 1,
0.6530539, 0.9453587, 0.6313847, 0.4392157, 0, 1, 1,
0.654115, -0.1145773, 0.919261, 0.4470588, 0, 1, 1,
0.6581455, 0.7953902, 1.387602, 0.4509804, 0, 1, 1,
0.6585125, -0.5280478, 2.825011, 0.4588235, 0, 1, 1,
0.6634331, -0.0252856, 0.5927304, 0.4627451, 0, 1, 1,
0.664465, -0.5624455, 1.116245, 0.4705882, 0, 1, 1,
0.6685045, 0.4335242, 0.4916056, 0.4745098, 0, 1, 1,
0.6704075, 0.3053375, 1.082228, 0.4823529, 0, 1, 1,
0.6722856, 1.602798, 2.400526, 0.4862745, 0, 1, 1,
0.6767129, -2.782098, 2.49628, 0.4941176, 0, 1, 1,
0.6776248, 0.7083842, -0.6490473, 0.5019608, 0, 1, 1,
0.6789799, -0.05964474, 3.09674, 0.5058824, 0, 1, 1,
0.6803543, 0.2542935, -0.1016, 0.5137255, 0, 1, 1,
0.6811824, -0.6216287, 2.837375, 0.5176471, 0, 1, 1,
0.6837037, 0.8690075, 0.3699946, 0.5254902, 0, 1, 1,
0.688043, -1.080239, 1.901659, 0.5294118, 0, 1, 1,
0.6895998, 0.5986134, 0.8136516, 0.5372549, 0, 1, 1,
0.696919, -0.08011312, 3.829907, 0.5411765, 0, 1, 1,
0.7004294, 1.574769, 0.8654629, 0.5490196, 0, 1, 1,
0.7078686, 0.4372331, 0.4122654, 0.5529412, 0, 1, 1,
0.721891, -1.16535, 2.442922, 0.5607843, 0, 1, 1,
0.7270949, -0.0279469, 2.112717, 0.5647059, 0, 1, 1,
0.7304189, -1.651892, 3.642178, 0.572549, 0, 1, 1,
0.7315295, -0.4219168, 1.603272, 0.5764706, 0, 1, 1,
0.7367856, 1.429242, 1.268212, 0.5843138, 0, 1, 1,
0.7414984, 0.3914686, 1.066642, 0.5882353, 0, 1, 1,
0.745173, -1.796388, 3.13882, 0.5960785, 0, 1, 1,
0.7524184, 0.869127, 1.195578, 0.6039216, 0, 1, 1,
0.7552902, -1.695154, 4.307723, 0.6078432, 0, 1, 1,
0.7559711, 0.2764526, 0.9446878, 0.6156863, 0, 1, 1,
0.7570311, 0.1735579, 1.647434, 0.6196079, 0, 1, 1,
0.7587602, 0.3035191, 1.082907, 0.627451, 0, 1, 1,
0.7595816, 0.2481804, 1.059296, 0.6313726, 0, 1, 1,
0.760313, -0.4155926, 2.875866, 0.6392157, 0, 1, 1,
0.7607424, 1.41348, 0.9164987, 0.6431373, 0, 1, 1,
0.7673861, -0.5325585, 1.957633, 0.6509804, 0, 1, 1,
0.7685761, -0.8544156, 2.978752, 0.654902, 0, 1, 1,
0.7710302, -1.173878, 1.404481, 0.6627451, 0, 1, 1,
0.7753176, -0.6056494, 2.431024, 0.6666667, 0, 1, 1,
0.7754734, -0.5056871, 1.776078, 0.6745098, 0, 1, 1,
0.7772848, -0.829451, 0.7838836, 0.6784314, 0, 1, 1,
0.7812361, 0.07991451, 2.735464, 0.6862745, 0, 1, 1,
0.782585, -1.65192, 2.806869, 0.6901961, 0, 1, 1,
0.7831685, 1.011952, 0.8609468, 0.6980392, 0, 1, 1,
0.7843157, -1.067039, 3.971169, 0.7058824, 0, 1, 1,
0.7891726, -0.6910481, 1.927908, 0.7098039, 0, 1, 1,
0.7927231, 0.4105563, -0.2120759, 0.7176471, 0, 1, 1,
0.7927319, 0.04235577, 1.619391, 0.7215686, 0, 1, 1,
0.7978724, 0.9672632, -0.27382, 0.7294118, 0, 1, 1,
0.7996837, 0.03262829, 1.851956, 0.7333333, 0, 1, 1,
0.806503, -0.4818447, 2.221727, 0.7411765, 0, 1, 1,
0.8100306, -0.9350172, 2.598362, 0.7450981, 0, 1, 1,
0.8107299, -1.25541, 3.393689, 0.7529412, 0, 1, 1,
0.813475, -2.172777, 2.781284, 0.7568628, 0, 1, 1,
0.820417, 1.194703, 2.377794, 0.7647059, 0, 1, 1,
0.8219141, -1.077255, 1.731561, 0.7686275, 0, 1, 1,
0.8238516, 0.3861649, 0.3223438, 0.7764706, 0, 1, 1,
0.8293474, -0.2793438, 1.075382, 0.7803922, 0, 1, 1,
0.831093, -0.02750915, 1.259617, 0.7882353, 0, 1, 1,
0.8312234, -1.498923, 0.2485789, 0.7921569, 0, 1, 1,
0.834642, -0.7185091, 2.68203, 0.8, 0, 1, 1,
0.838303, -0.1966343, 1.633038, 0.8078431, 0, 1, 1,
0.8385864, -0.4160283, 1.692732, 0.8117647, 0, 1, 1,
0.8413953, -2.074801, 3.407564, 0.8196079, 0, 1, 1,
0.8463278, 1.045183, 0.07085802, 0.8235294, 0, 1, 1,
0.8562683, -0.8381548, 2.124523, 0.8313726, 0, 1, 1,
0.8649052, -0.8240539, 3.135281, 0.8352941, 0, 1, 1,
0.8659797, -0.8692755, 1.638902, 0.8431373, 0, 1, 1,
0.8673927, 1.991755, 0.7782332, 0.8470588, 0, 1, 1,
0.8766472, -0.7935753, 1.792271, 0.854902, 0, 1, 1,
0.8842687, 0.02139686, 3.051182, 0.8588235, 0, 1, 1,
0.8872792, 0.305519, 1.462574, 0.8666667, 0, 1, 1,
0.8892927, 1.195732, 1.240283, 0.8705882, 0, 1, 1,
0.8938435, -0.134076, 1.669537, 0.8784314, 0, 1, 1,
0.8977929, 0.7562712, 0.6980793, 0.8823529, 0, 1, 1,
0.8981779, -0.8792117, 2.661196, 0.8901961, 0, 1, 1,
0.8984407, -1.369994, 3.675487, 0.8941177, 0, 1, 1,
0.905561, -1.020746, 2.191454, 0.9019608, 0, 1, 1,
0.9062051, 0.7962564, 1.079318, 0.9098039, 0, 1, 1,
0.9068641, 0.2174409, 0.5860276, 0.9137255, 0, 1, 1,
0.9078466, 0.5894763, 0.9359464, 0.9215686, 0, 1, 1,
0.9098974, 0.3362403, 2.996687, 0.9254902, 0, 1, 1,
0.9102305, 0.06141005, 1.370174, 0.9333333, 0, 1, 1,
0.9113841, 0.2915596, 2.384588, 0.9372549, 0, 1, 1,
0.9191323, -0.8045847, 3.439255, 0.945098, 0, 1, 1,
0.9246343, -0.6302999, 1.731844, 0.9490196, 0, 1, 1,
0.9252734, 0.9924249, 1.545451, 0.9568627, 0, 1, 1,
0.9253346, -0.1163231, 2.310482, 0.9607843, 0, 1, 1,
0.9268433, 0.8184524, -0.8192895, 0.9686275, 0, 1, 1,
0.9294044, -0.2831875, 2.710659, 0.972549, 0, 1, 1,
0.9296045, -0.2584994, 1.942733, 0.9803922, 0, 1, 1,
0.9391342, 0.4431485, 0.06031591, 0.9843137, 0, 1, 1,
0.9391646, -0.8383601, 1.42022, 0.9921569, 0, 1, 1,
0.9460825, 0.4500749, 1.870267, 0.9960784, 0, 1, 1,
0.9510219, 0.04410351, 1.13821, 1, 0, 0.9960784, 1,
0.9543195, 0.2413761, 2.544378, 1, 0, 0.9882353, 1,
0.956656, -0.9329866, 0.2286273, 1, 0, 0.9843137, 1,
0.9663817, 0.8273339, 0.6927465, 1, 0, 0.9764706, 1,
0.9712785, 1.487284, -2.096878, 1, 0, 0.972549, 1,
0.9727281, -1.685936, 2.023761, 1, 0, 0.9647059, 1,
0.9759549, 1.068913, 0.981147, 1, 0, 0.9607843, 1,
0.9834409, -1.895868, 2.074164, 1, 0, 0.9529412, 1,
0.9880648, -0.2193159, 2.4583, 1, 0, 0.9490196, 1,
0.9973368, 0.4909905, 0.8116162, 1, 0, 0.9411765, 1,
1.000857, 0.4485718, 1.952616, 1, 0, 0.9372549, 1,
1.002272, 0.1012835, 0.3309879, 1, 0, 0.9294118, 1,
1.008106, 0.71257, 1.284296, 1, 0, 0.9254902, 1,
1.017093, -0.3234362, 1.847995, 1, 0, 0.9176471, 1,
1.017161, 2.17301, 0.06341008, 1, 0, 0.9137255, 1,
1.024718, -1.076303, 2.49463, 1, 0, 0.9058824, 1,
1.028246, 0.0636861, 0.5044959, 1, 0, 0.9019608, 1,
1.031689, 2.19692, 1.739358, 1, 0, 0.8941177, 1,
1.035835, -0.03844366, 2.263162, 1, 0, 0.8862745, 1,
1.037708, 0.02465899, 3.043024, 1, 0, 0.8823529, 1,
1.044775, -0.2900734, 1.88224, 1, 0, 0.8745098, 1,
1.060081, 2.622671, -1.092824, 1, 0, 0.8705882, 1,
1.063056, 0.6715161, 1.058663, 1, 0, 0.8627451, 1,
1.063142, 2.291172, 0.8924854, 1, 0, 0.8588235, 1,
1.064268, -0.1776161, 0.3948779, 1, 0, 0.8509804, 1,
1.068656, -1.288034, 3.661423, 1, 0, 0.8470588, 1,
1.068834, 0.08316015, 1.882635, 1, 0, 0.8392157, 1,
1.070177, 1.56668, 2.217898, 1, 0, 0.8352941, 1,
1.075459, -0.9224873, 1.878381, 1, 0, 0.827451, 1,
1.082214, 0.4453336, 2.052512, 1, 0, 0.8235294, 1,
1.08551, -0.5830189, 1.639004, 1, 0, 0.8156863, 1,
1.086416, -1.93376, 0.4443593, 1, 0, 0.8117647, 1,
1.086586, 0.1208521, -0.7475835, 1, 0, 0.8039216, 1,
1.091023, 0.2946554, 1.134021, 1, 0, 0.7960784, 1,
1.099956, 0.8722073, 0.9297646, 1, 0, 0.7921569, 1,
1.113229, 0.57934, -0.1394156, 1, 0, 0.7843137, 1,
1.118964, 0.01122748, 2.232103, 1, 0, 0.7803922, 1,
1.120556, 1.280814, 1.283648, 1, 0, 0.772549, 1,
1.121361, 0.2314167, 1.395331, 1, 0, 0.7686275, 1,
1.122779, 1.166542, -0.3561022, 1, 0, 0.7607843, 1,
1.124662, 2.341191, -0.005195436, 1, 0, 0.7568628, 1,
1.126373, 0.4244942, 1.449185, 1, 0, 0.7490196, 1,
1.128726, 0.2867355, 0.3736598, 1, 0, 0.7450981, 1,
1.132888, 0.8363565, 2.488761, 1, 0, 0.7372549, 1,
1.144204, 1.904873, -0.1985244, 1, 0, 0.7333333, 1,
1.159894, 0.8037263, 1.716158, 1, 0, 0.7254902, 1,
1.162578, 0.2434546, -0.2416852, 1, 0, 0.7215686, 1,
1.169556, -0.02953442, -0.6373215, 1, 0, 0.7137255, 1,
1.169713, 0.1981963, 1.912343, 1, 0, 0.7098039, 1,
1.170348, 0.5802655, 2.663406, 1, 0, 0.7019608, 1,
1.190175, 0.121662, 1.668495, 1, 0, 0.6941177, 1,
1.191147, 0.1067489, 0.9650477, 1, 0, 0.6901961, 1,
1.19827, -0.6126129, 2.119048, 1, 0, 0.682353, 1,
1.202637, 1.398154, 2.063365, 1, 0, 0.6784314, 1,
1.206016, -0.4340474, 1.865825, 1, 0, 0.6705883, 1,
1.212984, 1.304713, -0.07560243, 1, 0, 0.6666667, 1,
1.213675, 1.324068, -0.1488407, 1, 0, 0.6588235, 1,
1.21538, -0.6440036, 3.339057, 1, 0, 0.654902, 1,
1.219458, 0.7582136, 2.292587, 1, 0, 0.6470588, 1,
1.228575, -0.08538377, 1.036329, 1, 0, 0.6431373, 1,
1.229954, 0.7272761, 0.7188084, 1, 0, 0.6352941, 1,
1.239522, -0.05143385, 1.482286, 1, 0, 0.6313726, 1,
1.253963, -0.5538678, 2.551695, 1, 0, 0.6235294, 1,
1.25621, 0.1410185, -0.165338, 1, 0, 0.6196079, 1,
1.270303, -0.1708271, 1.866816, 1, 0, 0.6117647, 1,
1.275537, -0.1945058, 1.164197, 1, 0, 0.6078432, 1,
1.279076, 1.113693, 0.2907737, 1, 0, 0.6, 1,
1.280175, -1.303128, 2.179061, 1, 0, 0.5921569, 1,
1.288513, 1.128538, 1.093348, 1, 0, 0.5882353, 1,
1.289882, 1.419584, 0.3802327, 1, 0, 0.5803922, 1,
1.328708, 2.105776, -1.491989, 1, 0, 0.5764706, 1,
1.331653, -0.139251, 2.10873, 1, 0, 0.5686275, 1,
1.336597, 1.150729, 1.117006, 1, 0, 0.5647059, 1,
1.34676, -0.3505069, 1.792811, 1, 0, 0.5568628, 1,
1.349187, -2.096597, 2.796682, 1, 0, 0.5529412, 1,
1.355224, -0.7548217, 1.727624, 1, 0, 0.5450981, 1,
1.35997, 1.216444, 1.156029, 1, 0, 0.5411765, 1,
1.365194, 0.818181, 1.805553, 1, 0, 0.5333334, 1,
1.36786, -0.6493645, 1.569755, 1, 0, 0.5294118, 1,
1.369084, -0.2652217, 3.211488, 1, 0, 0.5215687, 1,
1.369937, 1.048501, 2.311566, 1, 0, 0.5176471, 1,
1.386376, 0.847048, 0.8708112, 1, 0, 0.509804, 1,
1.396939, -1.097135, 1.93639, 1, 0, 0.5058824, 1,
1.399317, -0.4065695, 1.176214, 1, 0, 0.4980392, 1,
1.404179, 0.008460729, 1.211158, 1, 0, 0.4901961, 1,
1.404765, -1.219937, 1.653692, 1, 0, 0.4862745, 1,
1.415767, 0.3193174, 0.2613503, 1, 0, 0.4784314, 1,
1.417829, 0.3629899, 3.695276, 1, 0, 0.4745098, 1,
1.418477, 0.1404367, 2.019295, 1, 0, 0.4666667, 1,
1.420003, -0.5056181, 2.353987, 1, 0, 0.4627451, 1,
1.420308, 0.8482347, -0.1867653, 1, 0, 0.454902, 1,
1.421167, -0.3954084, 2.698625, 1, 0, 0.4509804, 1,
1.428001, 0.02982039, 0.7782708, 1, 0, 0.4431373, 1,
1.428136, -1.295128, 2.902371, 1, 0, 0.4392157, 1,
1.43322, 0.490178, 1.25369, 1, 0, 0.4313726, 1,
1.436933, -0.9821454, 1.127532, 1, 0, 0.427451, 1,
1.445691, -0.7381766, 2.28525, 1, 0, 0.4196078, 1,
1.457237, -1.287294, 1.371819, 1, 0, 0.4156863, 1,
1.462761, 0.8058077, 0.7702312, 1, 0, 0.4078431, 1,
1.471578, 1.548609, 0.9880024, 1, 0, 0.4039216, 1,
1.473647, -1.042513, 4.924557, 1, 0, 0.3960784, 1,
1.481253, 0.294974, 0.9927117, 1, 0, 0.3882353, 1,
1.494924, 0.1083877, 2.054007, 1, 0, 0.3843137, 1,
1.506596, -0.5289177, 1.344568, 1, 0, 0.3764706, 1,
1.51008, -1.801011, 2.627078, 1, 0, 0.372549, 1,
1.516015, -1.176633, 3.706051, 1, 0, 0.3647059, 1,
1.523152, -0.5561609, 2.046688, 1, 0, 0.3607843, 1,
1.525209, 1.595187, 0.2245996, 1, 0, 0.3529412, 1,
1.580186, -0.1135235, 0.3417195, 1, 0, 0.3490196, 1,
1.588677, -0.1126911, 0.6807958, 1, 0, 0.3411765, 1,
1.594428, -0.7513092, 2.848032, 1, 0, 0.3372549, 1,
1.602647, 0.9747585, 2.262388, 1, 0, 0.3294118, 1,
1.607612, -1.755856, 1.601983, 1, 0, 0.3254902, 1,
1.635264, -1.004736, 2.979432, 1, 0, 0.3176471, 1,
1.638426, 0.04966802, 0.2840188, 1, 0, 0.3137255, 1,
1.665478, -1.12797, 1.855923, 1, 0, 0.3058824, 1,
1.687095, 1.676963, 0.8156959, 1, 0, 0.2980392, 1,
1.700698, 0.293407, 2.121804, 1, 0, 0.2941177, 1,
1.725105, -0.984933, 3.084582, 1, 0, 0.2862745, 1,
1.754134, -0.3613877, 0.7772697, 1, 0, 0.282353, 1,
1.765319, 0.9587791, 1.875977, 1, 0, 0.2745098, 1,
1.777944, 0.1704839, 1.839045, 1, 0, 0.2705882, 1,
1.794794, 1.427551, 0.4374662, 1, 0, 0.2627451, 1,
1.80172, 0.709322, 0.3086653, 1, 0, 0.2588235, 1,
1.858688, -0.9815105, 2.610188, 1, 0, 0.2509804, 1,
1.865512, 0.623971, 2.495847, 1, 0, 0.2470588, 1,
1.871836, 0.1040356, 2.000735, 1, 0, 0.2392157, 1,
1.897647, -0.0791434, 1.316958, 1, 0, 0.2352941, 1,
1.918372, 1.501371, 0.2662507, 1, 0, 0.227451, 1,
1.922567, -1.36293, 3.028032, 1, 0, 0.2235294, 1,
1.935902, 0.2942445, 1.99267, 1, 0, 0.2156863, 1,
1.952267, -1.064497, 1.762261, 1, 0, 0.2117647, 1,
1.964397, 0.5403246, 0.6366773, 1, 0, 0.2039216, 1,
1.966213, -0.8461067, 2.028058, 1, 0, 0.1960784, 1,
1.974704, 1.559791, 1.591258, 1, 0, 0.1921569, 1,
1.98362, 0.538034, 1.185242, 1, 0, 0.1843137, 1,
1.985957, -1.491744, 3.064644, 1, 0, 0.1803922, 1,
1.989667, 0.8733038, 2.043749, 1, 0, 0.172549, 1,
2.015759, -0.6711117, 0.8628851, 1, 0, 0.1686275, 1,
2.026113, 0.8492421, 2.532879, 1, 0, 0.1607843, 1,
2.06489, 0.3757989, 0.8848974, 1, 0, 0.1568628, 1,
2.078936, 1.449536, 1.334673, 1, 0, 0.1490196, 1,
2.108493, -1.645804, 1.673944, 1, 0, 0.145098, 1,
2.115997, -0.6061269, 2.475783, 1, 0, 0.1372549, 1,
2.136931, -1.211829, 3.146524, 1, 0, 0.1333333, 1,
2.159199, -1.66602, 1.05273, 1, 0, 0.1254902, 1,
2.16479, -1.653939, 1.263854, 1, 0, 0.1215686, 1,
2.167251, -0.23779, 2.860013, 1, 0, 0.1137255, 1,
2.172463, 0.5128622, 1.95397, 1, 0, 0.1098039, 1,
2.179476, 0.6016496, 2.268026, 1, 0, 0.1019608, 1,
2.21835, -0.3950607, 2.115739, 1, 0, 0.09411765, 1,
2.261464, 0.6753765, 0.1257059, 1, 0, 0.09019608, 1,
2.343305, 1.798882, 0.6998591, 1, 0, 0.08235294, 1,
2.354524, -1.10192, 1.137555, 1, 0, 0.07843138, 1,
2.356481, 0.416941, 0.7871112, 1, 0, 0.07058824, 1,
2.485709, -0.0489191, 0.7952735, 1, 0, 0.06666667, 1,
2.496295, -0.2546445, 3.746617, 1, 0, 0.05882353, 1,
2.505685, 2.204824, 0.4023231, 1, 0, 0.05490196, 1,
2.570042, 1.240583, 1.135811, 1, 0, 0.04705882, 1,
2.663922, -0.1431678, 2.516109, 1, 0, 0.04313726, 1,
2.679261, -0.07588276, 0.5299427, 1, 0, 0.03529412, 1,
2.7286, 0.5088284, 3.279274, 1, 0, 0.03137255, 1,
2.76536, 0.4685482, 3.451768, 1, 0, 0.02352941, 1,
2.827609, 1.356773, 0.3351849, 1, 0, 0.01960784, 1,
2.859898, 0.301997, 2.408363, 1, 0, 0.01176471, 1,
2.920867, -2.323221, 0.7397287, 1, 0, 0.007843138, 1
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
-0.3733435, -3.975366, -7.179117, 0, -0.5, 0.5, 0.5,
-0.3733435, -3.975366, -7.179117, 1, -0.5, 0.5, 0.5,
-0.3733435, -3.975366, -7.179117, 1, 1.5, 0.5, 0.5,
-0.3733435, -3.975366, -7.179117, 0, 1.5, 0.5, 0.5
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
-4.784292, 0.005207896, -7.179117, 0, -0.5, 0.5, 0.5,
-4.784292, 0.005207896, -7.179117, 1, -0.5, 0.5, 0.5,
-4.784292, 0.005207896, -7.179117, 1, 1.5, 0.5, 0.5,
-4.784292, 0.005207896, -7.179117, 0, 1.5, 0.5, 0.5
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
-4.784292, -3.975366, -0.09486365, 0, -0.5, 0.5, 0.5,
-4.784292, -3.975366, -0.09486365, 1, -0.5, 0.5, 0.5,
-4.784292, -3.975366, -0.09486365, 1, 1.5, 0.5, 0.5,
-4.784292, -3.975366, -0.09486365, 0, 1.5, 0.5, 0.5
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
-3, -3.056772, -5.544289,
2, -3.056772, -5.544289,
-3, -3.056772, -5.544289,
-3, -3.209871, -5.816761,
-2, -3.056772, -5.544289,
-2, -3.209871, -5.816761,
-1, -3.056772, -5.544289,
-1, -3.209871, -5.816761,
0, -3.056772, -5.544289,
0, -3.209871, -5.816761,
1, -3.056772, -5.544289,
1, -3.209871, -5.816761,
2, -3.056772, -5.544289,
2, -3.209871, -5.816761
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
"2"
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
-3, -3.516069, -6.361703, 0, -0.5, 0.5, 0.5,
-3, -3.516069, -6.361703, 1, -0.5, 0.5, 0.5,
-3, -3.516069, -6.361703, 1, 1.5, 0.5, 0.5,
-3, -3.516069, -6.361703, 0, 1.5, 0.5, 0.5,
-2, -3.516069, -6.361703, 0, -0.5, 0.5, 0.5,
-2, -3.516069, -6.361703, 1, -0.5, 0.5, 0.5,
-2, -3.516069, -6.361703, 1, 1.5, 0.5, 0.5,
-2, -3.516069, -6.361703, 0, 1.5, 0.5, 0.5,
-1, -3.516069, -6.361703, 0, -0.5, 0.5, 0.5,
-1, -3.516069, -6.361703, 1, -0.5, 0.5, 0.5,
-1, -3.516069, -6.361703, 1, 1.5, 0.5, 0.5,
-1, -3.516069, -6.361703, 0, 1.5, 0.5, 0.5,
0, -3.516069, -6.361703, 0, -0.5, 0.5, 0.5,
0, -3.516069, -6.361703, 1, -0.5, 0.5, 0.5,
0, -3.516069, -6.361703, 1, 1.5, 0.5, 0.5,
0, -3.516069, -6.361703, 0, 1.5, 0.5, 0.5,
1, -3.516069, -6.361703, 0, -0.5, 0.5, 0.5,
1, -3.516069, -6.361703, 1, -0.5, 0.5, 0.5,
1, -3.516069, -6.361703, 1, 1.5, 0.5, 0.5,
1, -3.516069, -6.361703, 0, 1.5, 0.5, 0.5,
2, -3.516069, -6.361703, 0, -0.5, 0.5, 0.5,
2, -3.516069, -6.361703, 1, -0.5, 0.5, 0.5,
2, -3.516069, -6.361703, 1, 1.5, 0.5, 0.5,
2, -3.516069, -6.361703, 0, 1.5, 0.5, 0.5
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
-3.766381, -2, -5.544289,
-3.766381, 2, -5.544289,
-3.766381, -2, -5.544289,
-3.936032, -2, -5.816761,
-3.766381, -1, -5.544289,
-3.936032, -1, -5.816761,
-3.766381, 0, -5.544289,
-3.936032, 0, -5.816761,
-3.766381, 1, -5.544289,
-3.936032, 1, -5.816761,
-3.766381, 2, -5.544289,
-3.936032, 2, -5.816761
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
-4.275336, -2, -6.361703, 0, -0.5, 0.5, 0.5,
-4.275336, -2, -6.361703, 1, -0.5, 0.5, 0.5,
-4.275336, -2, -6.361703, 1, 1.5, 0.5, 0.5,
-4.275336, -2, -6.361703, 0, 1.5, 0.5, 0.5,
-4.275336, -1, -6.361703, 0, -0.5, 0.5, 0.5,
-4.275336, -1, -6.361703, 1, -0.5, 0.5, 0.5,
-4.275336, -1, -6.361703, 1, 1.5, 0.5, 0.5,
-4.275336, -1, -6.361703, 0, 1.5, 0.5, 0.5,
-4.275336, 0, -6.361703, 0, -0.5, 0.5, 0.5,
-4.275336, 0, -6.361703, 1, -0.5, 0.5, 0.5,
-4.275336, 0, -6.361703, 1, 1.5, 0.5, 0.5,
-4.275336, 0, -6.361703, 0, 1.5, 0.5, 0.5,
-4.275336, 1, -6.361703, 0, -0.5, 0.5, 0.5,
-4.275336, 1, -6.361703, 1, -0.5, 0.5, 0.5,
-4.275336, 1, -6.361703, 1, 1.5, 0.5, 0.5,
-4.275336, 1, -6.361703, 0, 1.5, 0.5, 0.5,
-4.275336, 2, -6.361703, 0, -0.5, 0.5, 0.5,
-4.275336, 2, -6.361703, 1, -0.5, 0.5, 0.5,
-4.275336, 2, -6.361703, 1, 1.5, 0.5, 0.5,
-4.275336, 2, -6.361703, 0, 1.5, 0.5, 0.5
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
-3.766381, -3.056772, -4,
-3.766381, -3.056772, 4,
-3.766381, -3.056772, -4,
-3.936032, -3.209871, -4,
-3.766381, -3.056772, -2,
-3.936032, -3.209871, -2,
-3.766381, -3.056772, 0,
-3.936032, -3.209871, 0,
-3.766381, -3.056772, 2,
-3.936032, -3.209871, 2,
-3.766381, -3.056772, 4,
-3.936032, -3.209871, 4
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
-4.275336, -3.516069, -4, 0, -0.5, 0.5, 0.5,
-4.275336, -3.516069, -4, 1, -0.5, 0.5, 0.5,
-4.275336, -3.516069, -4, 1, 1.5, 0.5, 0.5,
-4.275336, -3.516069, -4, 0, 1.5, 0.5, 0.5,
-4.275336, -3.516069, -2, 0, -0.5, 0.5, 0.5,
-4.275336, -3.516069, -2, 1, -0.5, 0.5, 0.5,
-4.275336, -3.516069, -2, 1, 1.5, 0.5, 0.5,
-4.275336, -3.516069, -2, 0, 1.5, 0.5, 0.5,
-4.275336, -3.516069, 0, 0, -0.5, 0.5, 0.5,
-4.275336, -3.516069, 0, 1, -0.5, 0.5, 0.5,
-4.275336, -3.516069, 0, 1, 1.5, 0.5, 0.5,
-4.275336, -3.516069, 0, 0, 1.5, 0.5, 0.5,
-4.275336, -3.516069, 2, 0, -0.5, 0.5, 0.5,
-4.275336, -3.516069, 2, 1, -0.5, 0.5, 0.5,
-4.275336, -3.516069, 2, 1, 1.5, 0.5, 0.5,
-4.275336, -3.516069, 2, 0, 1.5, 0.5, 0.5,
-4.275336, -3.516069, 4, 0, -0.5, 0.5, 0.5,
-4.275336, -3.516069, 4, 1, -0.5, 0.5, 0.5,
-4.275336, -3.516069, 4, 1, 1.5, 0.5, 0.5,
-4.275336, -3.516069, 4, 0, 1.5, 0.5, 0.5
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
-3.766381, -3.056772, -5.544289,
-3.766381, 3.067188, -5.544289,
-3.766381, -3.056772, 5.354562,
-3.766381, 3.067188, 5.354562,
-3.766381, -3.056772, -5.544289,
-3.766381, -3.056772, 5.354562,
-3.766381, 3.067188, -5.544289,
-3.766381, 3.067188, 5.354562,
-3.766381, -3.056772, -5.544289,
3.019694, -3.056772, -5.544289,
-3.766381, -3.056772, 5.354562,
3.019694, -3.056772, 5.354562,
-3.766381, 3.067188, -5.544289,
3.019694, 3.067188, -5.544289,
-3.766381, 3.067188, 5.354562,
3.019694, 3.067188, 5.354562,
3.019694, -3.056772, -5.544289,
3.019694, 3.067188, -5.544289,
3.019694, -3.056772, 5.354562,
3.019694, 3.067188, 5.354562,
3.019694, -3.056772, -5.544289,
3.019694, -3.056772, 5.354562,
3.019694, 3.067188, -5.544289,
3.019694, 3.067188, 5.354562
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
var radius = 7.595649;
var distance = 33.7939;
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
mvMatrix.translate( 0.3733435, -0.005207896, 0.09486365 );
mvMatrix.scale( 1.210209, 1.341054, 0.7535257 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.7939);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Esfenvalerate<-read.table("Esfenvalerate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Esfenvalerate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Esfenvalerate' not found
```

```r
y<-Esfenvalerate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Esfenvalerate' not found
```

```r
z<-Esfenvalerate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Esfenvalerate' not found
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
-3.667554, 0.5418107, -1.051433, 0, 0, 1, 1, 1,
-2.825515, 1.593175, -0.3570338, 1, 0, 0, 1, 1,
-2.704172, 0.6081921, -0.7637968, 1, 0, 0, 1, 1,
-2.588045, 1.039518, -1.326005, 1, 0, 0, 1, 1,
-2.468885, 1.569571, -0.2994691, 1, 0, 0, 1, 1,
-2.348839, -0.5225565, -2.968294, 1, 0, 0, 1, 1,
-2.269957, -1.101941, -0.0992919, 0, 0, 0, 1, 1,
-2.221689, 1.350396, -1.615229, 0, 0, 0, 1, 1,
-2.212214, 0.5412492, -0.7538918, 0, 0, 0, 1, 1,
-2.133533, 0.3196442, -2.544137, 0, 0, 0, 1, 1,
-2.113155, -0.1005052, 0.1168134, 0, 0, 0, 1, 1,
-2.111943, -1.676774, -2.392922, 0, 0, 0, 1, 1,
-2.090601, 1.144711, -1.878489, 0, 0, 0, 1, 1,
-2.077295, -2.304302, -1.342569, 1, 1, 1, 1, 1,
-2.060411, -0.2912283, -1.577079, 1, 1, 1, 1, 1,
-2.057054, -0.3016776, -1.327106, 1, 1, 1, 1, 1,
-2.050587, 0.4393633, -2.185053, 1, 1, 1, 1, 1,
-2.031105, 0.5321973, -0.8939477, 1, 1, 1, 1, 1,
-2.022851, 0.5846122, -0.1075152, 1, 1, 1, 1, 1,
-2.022177, 0.2482504, -2.009544, 1, 1, 1, 1, 1,
-2.009783, 1.642061, 0.08159191, 1, 1, 1, 1, 1,
-2.009669, 0.4950185, -0.3291517, 1, 1, 1, 1, 1,
-1.984895, -0.9062742, -2.67882, 1, 1, 1, 1, 1,
-1.983923, -0.2028306, -2.070504, 1, 1, 1, 1, 1,
-1.964736, 1.003909, -2.227655, 1, 1, 1, 1, 1,
-1.948443, 0.6052052, -1.078591, 1, 1, 1, 1, 1,
-1.880389, -0.2746387, -0.9705765, 1, 1, 1, 1, 1,
-1.853445, -1.338919, -2.250444, 1, 1, 1, 1, 1,
-1.849771, 0.09375945, -2.105311, 0, 0, 1, 1, 1,
-1.801437, -2.679439, -3.148278, 1, 0, 0, 1, 1,
-1.776213, -0.9837519, -1.499417, 1, 0, 0, 1, 1,
-1.752804, 0.6943752, -2.233276, 1, 0, 0, 1, 1,
-1.752286, 0.8720334, -1.123307, 1, 0, 0, 1, 1,
-1.749857, -0.116728, -2.20706, 1, 0, 0, 1, 1,
-1.725621, 0.4871731, -1.333698, 0, 0, 0, 1, 1,
-1.699943, 0.2979586, -1.183187, 0, 0, 0, 1, 1,
-1.691963, 0.7141805, -1.106486, 0, 0, 0, 1, 1,
-1.683814, 1.194568, -0.1492674, 0, 0, 0, 1, 1,
-1.66529, 1.289933, -2.418902, 0, 0, 0, 1, 1,
-1.663214, 0.3422384, -1.064278, 0, 0, 0, 1, 1,
-1.662367, 0.6853774, -0.2725219, 0, 0, 0, 1, 1,
-1.655231, 0.2863186, -1.073285, 1, 1, 1, 1, 1,
-1.644281, -0.5649034, -1.567697, 1, 1, 1, 1, 1,
-1.638712, 0.4716331, -2.701018, 1, 1, 1, 1, 1,
-1.631307, -1.15569, -2.855876, 1, 1, 1, 1, 1,
-1.627379, 0.3508759, -1.41048, 1, 1, 1, 1, 1,
-1.622357, -0.3709951, -2.275956, 1, 1, 1, 1, 1,
-1.608534, 0.4674511, -0.3909356, 1, 1, 1, 1, 1,
-1.589124, 0.1664695, -1.085016, 1, 1, 1, 1, 1,
-1.587812, 0.327306, -0.07149339, 1, 1, 1, 1, 1,
-1.585117, -2.213485, -1.806097, 1, 1, 1, 1, 1,
-1.573809, -0.6971745, -1.167619, 1, 1, 1, 1, 1,
-1.567548, -1.214781, -1.419163, 1, 1, 1, 1, 1,
-1.564115, -0.05630701, -0.6926028, 1, 1, 1, 1, 1,
-1.559334, 1.109427, -0.9700962, 1, 1, 1, 1, 1,
-1.54991, 1.209077, -1.352624, 1, 1, 1, 1, 1,
-1.545109, -0.5279174, -2.486365, 0, 0, 1, 1, 1,
-1.537251, 1.23526, -2.062793, 1, 0, 0, 1, 1,
-1.537104, 1.491924, 0.03450801, 1, 0, 0, 1, 1,
-1.533909, -0.6722901, -1.986925, 1, 0, 0, 1, 1,
-1.50836, -0.4573258, -2.837473, 1, 0, 0, 1, 1,
-1.507644, -0.6934042, -2.460123, 1, 0, 0, 1, 1,
-1.493845, -1.207814, -2.708888, 0, 0, 0, 1, 1,
-1.48761, -0.6600493, -1.748421, 0, 0, 0, 1, 1,
-1.475303, 1.129895, -0.4709571, 0, 0, 0, 1, 1,
-1.470617, 0.2031689, -1.642512, 0, 0, 0, 1, 1,
-1.469387, 0.9625943, -0.2038947, 0, 0, 0, 1, 1,
-1.451422, -0.09004869, -2.233494, 0, 0, 0, 1, 1,
-1.44788, 0.4562742, -0.9400418, 0, 0, 0, 1, 1,
-1.444381, -0.5855507, -2.055303, 1, 1, 1, 1, 1,
-1.442124, 0.3718755, 0.3478101, 1, 1, 1, 1, 1,
-1.431189, -0.1280804, 0.02415201, 1, 1, 1, 1, 1,
-1.403406, 0.8481499, -0.4900801, 1, 1, 1, 1, 1,
-1.380748, -0.2121879, -2.327826, 1, 1, 1, 1, 1,
-1.380113, -0.8237839, -0.03636543, 1, 1, 1, 1, 1,
-1.37941, 1.275569, -2.251097, 1, 1, 1, 1, 1,
-1.357493, 0.1719358, -2.246749, 1, 1, 1, 1, 1,
-1.352221, 1.011904, -2.242919, 1, 1, 1, 1, 1,
-1.347614, 0.7764312, 0.5484642, 1, 1, 1, 1, 1,
-1.334257, 0.828416, -0.3359013, 1, 1, 1, 1, 1,
-1.323482, 0.5044274, -0.6340673, 1, 1, 1, 1, 1,
-1.323333, 0.8745756, -1.256237, 1, 1, 1, 1, 1,
-1.32246, -0.08289449, -3.4673, 1, 1, 1, 1, 1,
-1.316473, 0.5516109, -1.154364, 1, 1, 1, 1, 1,
-1.294216, 1.891843, -0.02218145, 0, 0, 1, 1, 1,
-1.292337, 0.3783814, 0.04682676, 1, 0, 0, 1, 1,
-1.288577, 0.05311054, -1.490799, 1, 0, 0, 1, 1,
-1.282873, -0.3240303, -0.842522, 1, 0, 0, 1, 1,
-1.27879, -0.7131458, -2.024798, 1, 0, 0, 1, 1,
-1.277996, -2.212439, -1.391676, 1, 0, 0, 1, 1,
-1.264835, 1.066696, -1.69975, 0, 0, 0, 1, 1,
-1.251948, -0.0313247, -1.105399, 0, 0, 0, 1, 1,
-1.251314, 0.2394901, -1.590787, 0, 0, 0, 1, 1,
-1.250362, -0.3988224, -1.624521, 0, 0, 0, 1, 1,
-1.24946, -0.7123341, -1.688648, 0, 0, 0, 1, 1,
-1.240825, 0.6929159, -0.9507896, 0, 0, 0, 1, 1,
-1.237086, -0.1516833, -2.950668, 0, 0, 0, 1, 1,
-1.226937, -0.9849924, -3.044743, 1, 1, 1, 1, 1,
-1.221672, 2.978004, -0.7093201, 1, 1, 1, 1, 1,
-1.220474, -0.9986735, -2.630032, 1, 1, 1, 1, 1,
-1.218798, 0.6386247, -0.7968748, 1, 1, 1, 1, 1,
-1.216442, 1.530616, -0.5098853, 1, 1, 1, 1, 1,
-1.213902, -0.5417081, -2.38806, 1, 1, 1, 1, 1,
-1.213265, -0.1498957, -2.427645, 1, 1, 1, 1, 1,
-1.205317, -0.2960943, -3.978194, 1, 1, 1, 1, 1,
-1.188572, 0.9446227, -1.734481, 1, 1, 1, 1, 1,
-1.180281, -0.04796869, -2.510487, 1, 1, 1, 1, 1,
-1.178091, -0.9531729, -2.538891, 1, 1, 1, 1, 1,
-1.176176, -0.9418004, -1.886299, 1, 1, 1, 1, 1,
-1.169356, -0.5939296, -0.670374, 1, 1, 1, 1, 1,
-1.165016, -0.8532776, -3.578782, 1, 1, 1, 1, 1,
-1.164871, -0.1080221, -2.129848, 1, 1, 1, 1, 1,
-1.163253, -1.192791, -2.102432, 0, 0, 1, 1, 1,
-1.15991, -1.112542, -3.022284, 1, 0, 0, 1, 1,
-1.158947, -0.8409569, -1.430501, 1, 0, 0, 1, 1,
-1.153005, 0.3959565, -0.1550179, 1, 0, 0, 1, 1,
-1.147425, -0.947001, -3.66902, 1, 0, 0, 1, 1,
-1.137519, 0.3076305, -1.358308, 1, 0, 0, 1, 1,
-1.134209, -1.068011, -1.913078, 0, 0, 0, 1, 1,
-1.128886, 0.3366065, 1.72843, 0, 0, 0, 1, 1,
-1.1277, 1.558571, 0.2190034, 0, 0, 0, 1, 1,
-1.121636, 0.5645056, -1.038814, 0, 0, 0, 1, 1,
-1.120292, 0.2685488, -1.681142, 0, 0, 0, 1, 1,
-1.111734, 1.230419, 0.5827345, 0, 0, 0, 1, 1,
-1.109157, 2.34682, -1.325389, 0, 0, 0, 1, 1,
-1.107485, -1.541249, -2.990483, 1, 1, 1, 1, 1,
-1.106083, -1.043716, -3.581983, 1, 1, 1, 1, 1,
-1.105961, 0.727577, 0.7949503, 1, 1, 1, 1, 1,
-1.10587, -0.006195739, -3.202403, 1, 1, 1, 1, 1,
-1.093039, 1.028838, -0.2406275, 1, 1, 1, 1, 1,
-1.086588, -0.6792664, 0.1577004, 1, 1, 1, 1, 1,
-1.085639, -0.1076819, -2.613814, 1, 1, 1, 1, 1,
-1.076519, 0.1908493, -1.758922, 1, 1, 1, 1, 1,
-1.076374, -0.431843, -1.859329, 1, 1, 1, 1, 1,
-1.06185, -0.9833667, -2.082561, 1, 1, 1, 1, 1,
-1.04344, -0.5531957, -1.642743, 1, 1, 1, 1, 1,
-1.039699, -0.005104928, -2.335101, 1, 1, 1, 1, 1,
-1.030254, 0.4043629, -1.923398, 1, 1, 1, 1, 1,
-1.024375, 1.607051, -2.583401, 1, 1, 1, 1, 1,
-1.023273, 1.180079, -0.3773615, 1, 1, 1, 1, 1,
-1.019441, 1.425673, -1.075203, 0, 0, 1, 1, 1,
-1.016207, -0.05696467, -1.424417, 1, 0, 0, 1, 1,
-1.015445, -0.4190229, -2.593621, 1, 0, 0, 1, 1,
-1.009795, -0.184995, -1.340261, 1, 0, 0, 1, 1,
-0.9970076, 0.694027, -2.128813, 1, 0, 0, 1, 1,
-0.9958094, -0.603567, 0.02994263, 1, 0, 0, 1, 1,
-0.9855236, 0.6298552, -0.3166318, 0, 0, 0, 1, 1,
-0.9740652, -0.5218932, -1.459818, 0, 0, 0, 1, 1,
-0.9687883, -0.6001978, -2.488941, 0, 0, 0, 1, 1,
-0.9684324, -1.397765, -3.105428, 0, 0, 0, 1, 1,
-0.9649307, -0.7553365, -3.356954, 0, 0, 0, 1, 1,
-0.9643182, -2.326609, -1.875865, 0, 0, 0, 1, 1,
-0.9589642, -1.083908, -0.3519834, 0, 0, 0, 1, 1,
-0.9580877, -1.237183, -4.092447, 1, 1, 1, 1, 1,
-0.9580466, 0.2205341, -2.448809, 1, 1, 1, 1, 1,
-0.9515591, -1.533013, -1.767346, 1, 1, 1, 1, 1,
-0.9485314, 1.004116, -1.859351, 1, 1, 1, 1, 1,
-0.9407161, 0.7681591, 0.3707458, 1, 1, 1, 1, 1,
-0.9405971, -0.6093833, -1.512432, 1, 1, 1, 1, 1,
-0.9360074, -2.217412, -3.198418, 1, 1, 1, 1, 1,
-0.9343021, 0.09065133, -1.875729, 1, 1, 1, 1, 1,
-0.9330733, 0.5203483, -2.059015, 1, 1, 1, 1, 1,
-0.9229833, -0.8348684, -1.693522, 1, 1, 1, 1, 1,
-0.919141, -0.7982183, -3.180216, 1, 1, 1, 1, 1,
-0.9105703, -0.629686, -3.590486, 1, 1, 1, 1, 1,
-0.9095834, 0.1530434, -0.9783381, 1, 1, 1, 1, 1,
-0.9073873, 0.5318179, -3.16982, 1, 1, 1, 1, 1,
-0.9029049, -0.1027219, -1.403812, 1, 1, 1, 1, 1,
-0.8930256, 0.2144327, -2.269571, 0, 0, 1, 1, 1,
-0.88986, -0.39393, -2.091243, 1, 0, 0, 1, 1,
-0.8896925, -0.06356029, -2.147321, 1, 0, 0, 1, 1,
-0.8784239, -1.033564, -1.319125, 1, 0, 0, 1, 1,
-0.8773685, 0.4557718, -1.566217, 1, 0, 0, 1, 1,
-0.8754623, 0.4664045, -1.354938, 1, 0, 0, 1, 1,
-0.8754243, 1.040269, -0.5468138, 0, 0, 0, 1, 1,
-0.8723074, -0.1024329, -2.555924, 0, 0, 0, 1, 1,
-0.8672512, -1.371127, -1.399708, 0, 0, 0, 1, 1,
-0.8654838, 0.7158424, -2.033932, 0, 0, 0, 1, 1,
-0.8628117, 0.5656794, -0.03328766, 0, 0, 0, 1, 1,
-0.8609695, 0.3732685, -1.685502, 0, 0, 0, 1, 1,
-0.8570966, -1.634549, -3.415289, 0, 0, 0, 1, 1,
-0.8558533, -0.5072208, -2.722484, 1, 1, 1, 1, 1,
-0.8524526, 0.9965985, -1.360468, 1, 1, 1, 1, 1,
-0.852061, 0.7303683, -1.949843, 1, 1, 1, 1, 1,
-0.8517414, -1.203745, -3.215246, 1, 1, 1, 1, 1,
-0.8487884, -0.281293, -1.272636, 1, 1, 1, 1, 1,
-0.8453567, 1.231687, -2.163456, 1, 1, 1, 1, 1,
-0.8434728, -1.255628, -0.6880238, 1, 1, 1, 1, 1,
-0.8382996, -2.260584, -3.708593, 1, 1, 1, 1, 1,
-0.8369652, -1.606183, -3.443088, 1, 1, 1, 1, 1,
-0.8356082, -0.3182677, -1.911163, 1, 1, 1, 1, 1,
-0.8342289, 0.3996079, -1.508279, 1, 1, 1, 1, 1,
-0.8334688, -0.1253924, -1.547281, 1, 1, 1, 1, 1,
-0.8326228, -0.746105, -2.360297, 1, 1, 1, 1, 1,
-0.831786, -1.513239, -1.070615, 1, 1, 1, 1, 1,
-0.8306625, 0.1156731, -0.9867389, 1, 1, 1, 1, 1,
-0.8251053, -0.1153298, -2.566193, 0, 0, 1, 1, 1,
-0.824444, 0.3028389, -1.659615, 1, 0, 0, 1, 1,
-0.8200774, 0.1108328, -0.8293203, 1, 0, 0, 1, 1,
-0.8143868, -0.7894845, -2.667485, 1, 0, 0, 1, 1,
-0.8007845, -1.424269, -3.172685, 1, 0, 0, 1, 1,
-0.7933958, -1.355856, -2.337613, 1, 0, 0, 1, 1,
-0.791429, 0.6330285, -1.413919, 0, 0, 0, 1, 1,
-0.7861748, 1.447315, 0.4685391, 0, 0, 0, 1, 1,
-0.7851755, 1.473618, 0.1813061, 0, 0, 0, 1, 1,
-0.785072, 0.855479, -0.7041361, 0, 0, 0, 1, 1,
-0.7845414, 1.99949, 0.8014863, 0, 0, 0, 1, 1,
-0.7797107, 0.1967671, -1.57095, 0, 0, 0, 1, 1,
-0.776876, -1.628538, -2.477568, 0, 0, 0, 1, 1,
-0.7759181, 0.7642326, -1.81647, 1, 1, 1, 1, 1,
-0.7738319, -2.961004, -3.558908, 1, 1, 1, 1, 1,
-0.7697524, 1.408681, -0.108937, 1, 1, 1, 1, 1,
-0.7682194, 0.7918313, -0.4357219, 1, 1, 1, 1, 1,
-0.7653469, -0.924753, -3.348369, 1, 1, 1, 1, 1,
-0.7642384, -1.182356, -3.158906, 1, 1, 1, 1, 1,
-0.760096, 0.05118111, -2.324851, 1, 1, 1, 1, 1,
-0.7570201, -0.3462503, -0.4279039, 1, 1, 1, 1, 1,
-0.7472684, -1.616044, -3.563635, 1, 1, 1, 1, 1,
-0.7469093, 1.905399, 0.2678822, 1, 1, 1, 1, 1,
-0.7455475, 0.3631482, -2.718588, 1, 1, 1, 1, 1,
-0.7408067, 0.1958814, -2.077804, 1, 1, 1, 1, 1,
-0.7263647, 0.5613821, -1.369384, 1, 1, 1, 1, 1,
-0.7132463, -1.565362, -2.856291, 1, 1, 1, 1, 1,
-0.7127879, -0.4494727, -3.86642, 1, 1, 1, 1, 1,
-0.712664, 2.055753, -0.3766518, 0, 0, 1, 1, 1,
-0.7117274, -0.1497488, -3.44924, 1, 0, 0, 1, 1,
-0.7100483, -0.1951679, -0.1079627, 1, 0, 0, 1, 1,
-0.7066024, 0.1149869, -1.666986, 1, 0, 0, 1, 1,
-0.7014102, -0.09558764, -1.197462, 1, 0, 0, 1, 1,
-0.6994644, 0.513711, -0.3820642, 1, 0, 0, 1, 1,
-0.6971615, -1.03507, -1.984398, 0, 0, 0, 1, 1,
-0.6960706, 0.2339815, -1.09838, 0, 0, 0, 1, 1,
-0.6956484, -0.1618948, -2.82882, 0, 0, 0, 1, 1,
-0.6953398, -0.7237117, -2.621495, 0, 0, 0, 1, 1,
-0.6923694, 0.9207731, -0.8843045, 0, 0, 0, 1, 1,
-0.6916682, -0.9866738, -1.668389, 0, 0, 0, 1, 1,
-0.6884865, 0.8537865, 1.971314, 0, 0, 0, 1, 1,
-0.6852161, -1.004925, -1.929814, 1, 1, 1, 1, 1,
-0.6822782, 1.789906, -0.07085466, 1, 1, 1, 1, 1,
-0.6771584, -0.5764467, -2.238112, 1, 1, 1, 1, 1,
-0.6690774, 0.5574526, -0.4084327, 1, 1, 1, 1, 1,
-0.6688276, -0.02422425, -1.952644, 1, 1, 1, 1, 1,
-0.6661101, 2.206371, -1.377885, 1, 1, 1, 1, 1,
-0.665094, 1.37864, -0.7968607, 1, 1, 1, 1, 1,
-0.6555562, -0.2706396, -2.206084, 1, 1, 1, 1, 1,
-0.653142, -0.193066, -1.374424, 1, 1, 1, 1, 1,
-0.645933, 0.3002966, -0.4958231, 1, 1, 1, 1, 1,
-0.6420153, -0.3243382, 0.07453481, 1, 1, 1, 1, 1,
-0.6410152, 0.07356834, -0.8841865, 1, 1, 1, 1, 1,
-0.6398504, 1.236328, 0.02137339, 1, 1, 1, 1, 1,
-0.639119, -0.1341086, -1.966204, 1, 1, 1, 1, 1,
-0.6337154, 1.510412, -0.8103219, 1, 1, 1, 1, 1,
-0.6333171, -0.06514864, -0.7943084, 0, 0, 1, 1, 1,
-0.6311937, 0.8774274, -0.343734, 1, 0, 0, 1, 1,
-0.6286579, 0.5892534, -1.093981, 1, 0, 0, 1, 1,
-0.6201916, -2.162035, -3.618486, 1, 0, 0, 1, 1,
-0.6190742, -0.02613658, -0.5538468, 1, 0, 0, 1, 1,
-0.6182477, 0.3506295, -0.7156413, 1, 0, 0, 1, 1,
-0.6115423, 0.2826723, -1.044736, 0, 0, 0, 1, 1,
-0.6064997, -0.102551, -1.406732, 0, 0, 0, 1, 1,
-0.6049685, 0.4267998, -1.819226, 0, 0, 0, 1, 1,
-0.6017867, 2.60896, 1.944207, 0, 0, 0, 1, 1,
-0.600243, -0.4915755, -1.541183, 0, 0, 0, 1, 1,
-0.5989602, -0.2275209, -3.768484, 0, 0, 0, 1, 1,
-0.5946475, 0.4830048, -0.1280188, 0, 0, 0, 1, 1,
-0.5938319, 0.1714294, -1.294199, 1, 1, 1, 1, 1,
-0.5909576, -1.70244, 0.3542378, 1, 1, 1, 1, 1,
-0.5878196, 0.2139702, -1.176554, 1, 1, 1, 1, 1,
-0.5869529, 1.154753, -0.05876544, 1, 1, 1, 1, 1,
-0.5840909, -1.603007, -3.982227, 1, 1, 1, 1, 1,
-0.5829209, 0.2016959, -0.222638, 1, 1, 1, 1, 1,
-0.5744908, -0.04611554, -1.438901, 1, 1, 1, 1, 1,
-0.5681671, -1.193331, -3.181463, 1, 1, 1, 1, 1,
-0.562453, 0.4604722, 0.04079228, 1, 1, 1, 1, 1,
-0.5584182, 0.5118812, -0.3939867, 1, 1, 1, 1, 1,
-0.5568027, -0.2590855, -2.055462, 1, 1, 1, 1, 1,
-0.554211, 0.9020497, -1.17942, 1, 1, 1, 1, 1,
-0.5526837, -0.1574509, -1.646425, 1, 1, 1, 1, 1,
-0.5521477, -1.47249, -2.906054, 1, 1, 1, 1, 1,
-0.5515895, -0.001653763, -1.733315, 1, 1, 1, 1, 1,
-0.5493909, -0.05148953, -1.205615, 0, 0, 1, 1, 1,
-0.5483832, 1.024204, 0.4755712, 1, 0, 0, 1, 1,
-0.5475725, -0.5121987, -1.261129, 1, 0, 0, 1, 1,
-0.543433, 0.3082168, 0.3009885, 1, 0, 0, 1, 1,
-0.541846, -0.55488, -2.665823, 1, 0, 0, 1, 1,
-0.5412593, -0.2943638, -2.746331, 1, 0, 0, 1, 1,
-0.5408506, 0.8348825, -1.929927, 0, 0, 0, 1, 1,
-0.539987, -0.1379407, -1.186888, 0, 0, 0, 1, 1,
-0.5371998, -0.1826544, -2.39498, 0, 0, 0, 1, 1,
-0.5354031, 0.7478427, 1.028743, 0, 0, 0, 1, 1,
-0.5324134, -0.3663862, -1.761342, 0, 0, 0, 1, 1,
-0.5320706, -0.8838006, -1.690206, 0, 0, 0, 1, 1,
-0.5319843, 0.9077201, -0.7500108, 0, 0, 0, 1, 1,
-0.5294741, -0.0233105, -0.5929409, 1, 1, 1, 1, 1,
-0.5291836, -0.1586473, -0.4230787, 1, 1, 1, 1, 1,
-0.5262983, 0.3488265, -1.333157, 1, 1, 1, 1, 1,
-0.5249896, -0.3583582, -2.109628, 1, 1, 1, 1, 1,
-0.5223742, -2.803154, -3.740953, 1, 1, 1, 1, 1,
-0.5222521, -0.0352767, -2.475116, 1, 1, 1, 1, 1,
-0.5207677, 1.307408, 0.1459227, 1, 1, 1, 1, 1,
-0.5158304, 0.4916281, -2.233701, 1, 1, 1, 1, 1,
-0.5148714, -0.4620425, -3.863587, 1, 1, 1, 1, 1,
-0.5138291, -0.1418272, -2.300934, 1, 1, 1, 1, 1,
-0.5119215, -0.6065725, -3.285392, 1, 1, 1, 1, 1,
-0.5089633, 0.6711102, -1.594351, 1, 1, 1, 1, 1,
-0.5071747, -0.2567395, -0.9496882, 1, 1, 1, 1, 1,
-0.5060673, 0.6636295, -0.7684582, 1, 1, 1, 1, 1,
-0.5046207, -0.6661112, -4.199829, 1, 1, 1, 1, 1,
-0.5023336, -1.808032, -2.788237, 0, 0, 1, 1, 1,
-0.4997583, 0.721861, 1.064416, 1, 0, 0, 1, 1,
-0.4868255, -0.2601992, -0.2067607, 1, 0, 0, 1, 1,
-0.4863604, -1.474226, -2.123409, 1, 0, 0, 1, 1,
-0.4861303, -0.6879467, -4.110541, 1, 0, 0, 1, 1,
-0.4849918, -1.677558, -2.841053, 1, 0, 0, 1, 1,
-0.4844348, 2.529164, 0.910552, 0, 0, 0, 1, 1,
-0.4774659, 1.754665, 0.1719773, 0, 0, 0, 1, 1,
-0.4766263, -1.281823, -2.23108, 0, 0, 0, 1, 1,
-0.4727452, 0.203998, -0.108666, 0, 0, 0, 1, 1,
-0.4702419, -0.9944513, -2.981995, 0, 0, 0, 1, 1,
-0.4699317, -2.172692, -1.93549, 0, 0, 0, 1, 1,
-0.4686652, 0.8538182, -1.52923, 0, 0, 0, 1, 1,
-0.4685364, 0.5550178, -1.344171, 1, 1, 1, 1, 1,
-0.4674566, -1.120302, -3.317161, 1, 1, 1, 1, 1,
-0.4657424, -0.4034452, -1.908836, 1, 1, 1, 1, 1,
-0.4624233, 0.1599283, -2.682729, 1, 1, 1, 1, 1,
-0.4559698, 0.6694745, -2.128724, 1, 1, 1, 1, 1,
-0.4553369, 0.5141528, -0.8364893, 1, 1, 1, 1, 1,
-0.4517459, -0.286148, -2.36388, 1, 1, 1, 1, 1,
-0.4507675, 1.087923, 0.7106569, 1, 1, 1, 1, 1,
-0.4435976, -0.2712886, -1.75977, 1, 1, 1, 1, 1,
-0.4425117, 0.2261467, 0.696174, 1, 1, 1, 1, 1,
-0.4407944, -0.8428037, -2.267598, 1, 1, 1, 1, 1,
-0.4391907, -0.1834905, -2.540119, 1, 1, 1, 1, 1,
-0.4389777, 0.4655266, -0.4973269, 1, 1, 1, 1, 1,
-0.4367694, 1.170349, 1.874263, 1, 1, 1, 1, 1,
-0.4354389, -0.9265195, -2.257882, 1, 1, 1, 1, 1,
-0.4289881, -0.2234282, -1.668222, 0, 0, 1, 1, 1,
-0.428899, -2.213624, -2.176025, 1, 0, 0, 1, 1,
-0.4286759, 0.6782097, -0.3758543, 1, 0, 0, 1, 1,
-0.4240217, 0.6877646, 0.007097466, 1, 0, 0, 1, 1,
-0.4236198, -0.4864003, -2.742532, 1, 0, 0, 1, 1,
-0.4226102, 0.2609749, -2.696064, 1, 0, 0, 1, 1,
-0.4221744, -0.4283883, -3.766817, 0, 0, 0, 1, 1,
-0.4221058, -0.7415674, -2.239774, 0, 0, 0, 1, 1,
-0.4135328, -1.208292, -4.209624, 0, 0, 0, 1, 1,
-0.411705, -0.8811386, -3.03926, 0, 0, 0, 1, 1,
-0.4101518, 0.3660638, 0.6240627, 0, 0, 0, 1, 1,
-0.405998, 0.3085746, -0.1986984, 0, 0, 0, 1, 1,
-0.405793, -0.488935, -3.576655, 0, 0, 0, 1, 1,
-0.404997, -0.5941096, -2.945169, 1, 1, 1, 1, 1,
-0.403682, 1.326996, -1.255772, 1, 1, 1, 1, 1,
-0.3991706, -0.2124531, -2.941376, 1, 1, 1, 1, 1,
-0.3962869, -0.7358875, -2.064888, 1, 1, 1, 1, 1,
-0.3881482, -1.623139, -2.441888, 1, 1, 1, 1, 1,
-0.387861, 1.521213, 3.087084, 1, 1, 1, 1, 1,
-0.3872668, -0.1482943, -1.960801, 1, 1, 1, 1, 1,
-0.3829962, 1.2495, -1.296162, 1, 1, 1, 1, 1,
-0.3826939, 0.5053464, -0.8068914, 1, 1, 1, 1, 1,
-0.3818148, 1.716918, -0.883675, 1, 1, 1, 1, 1,
-0.3807959, -0.3097209, -2.621471, 1, 1, 1, 1, 1,
-0.3782988, 0.2318266, -1.092095, 1, 1, 1, 1, 1,
-0.376568, -0.4269041, -1.509766, 1, 1, 1, 1, 1,
-0.3757993, 0.9986514, -0.6894039, 1, 1, 1, 1, 1,
-0.3732137, -1.074285, -2.065766, 1, 1, 1, 1, 1,
-0.3690296, -0.1692907, -3.767334, 0, 0, 1, 1, 1,
-0.3684884, -0.3508579, -2.329666, 1, 0, 0, 1, 1,
-0.3683229, 0.3760967, -0.2539269, 1, 0, 0, 1, 1,
-0.3665302, -1.779856, -2.598318, 1, 0, 0, 1, 1,
-0.357829, -0.2191779, -2.65867, 1, 0, 0, 1, 1,
-0.3565342, -0.2753423, -4.469326, 1, 0, 0, 1, 1,
-0.3559886, 1.288811, -0.8711065, 0, 0, 0, 1, 1,
-0.3537886, 0.325221, 0.2608997, 0, 0, 0, 1, 1,
-0.3499654, 1.962902, -0.4392606, 0, 0, 0, 1, 1,
-0.3460082, -1.845484, -3.782795, 0, 0, 0, 1, 1,
-0.3379783, 0.2079745, -0.05479265, 0, 0, 0, 1, 1,
-0.337676, -0.5755424, -2.753567, 0, 0, 0, 1, 1,
-0.3371905, 1.568706, 0.3292174, 0, 0, 0, 1, 1,
-0.3349733, -1.655578, -2.869228, 1, 1, 1, 1, 1,
-0.3333294, 0.4596351, 1.831577, 1, 1, 1, 1, 1,
-0.3299636, -0.6527185, -2.184331, 1, 1, 1, 1, 1,
-0.3236237, 1.030992, 0.2369198, 1, 1, 1, 1, 1,
-0.323318, -0.3709053, -3.879265, 1, 1, 1, 1, 1,
-0.3171025, 0.1020544, -3.015611, 1, 1, 1, 1, 1,
-0.3126003, -0.7779816, -2.520956, 1, 1, 1, 1, 1,
-0.309821, 0.5386258, -1.05393, 1, 1, 1, 1, 1,
-0.3091345, 0.4840665, 0.005140326, 1, 1, 1, 1, 1,
-0.3079632, 0.0564422, -1.527144, 1, 1, 1, 1, 1,
-0.3057787, 0.01018835, 0.04794956, 1, 1, 1, 1, 1,
-0.3039815, -0.6908228, -2.915947, 1, 1, 1, 1, 1,
-0.3017748, -0.5157358, -1.391502, 1, 1, 1, 1, 1,
-0.2996118, -0.548041, -2.489972, 1, 1, 1, 1, 1,
-0.2994745, 0.7369941, -1.591925, 1, 1, 1, 1, 1,
-0.2981554, -0.08493982, -0.7783657, 0, 0, 1, 1, 1,
-0.2959467, -0.2806817, -2.48199, 1, 0, 0, 1, 1,
-0.2951801, 0.8702849, 0.9288422, 1, 0, 0, 1, 1,
-0.2944401, 1.620203, -1.206307, 1, 0, 0, 1, 1,
-0.2943643, 1.86725, 0.8278348, 1, 0, 0, 1, 1,
-0.2916557, -0.5036885, -3.297746, 1, 0, 0, 1, 1,
-0.2857941, 1.091858, 0.3066117, 0, 0, 0, 1, 1,
-0.285455, 0.2983139, -0.6686401, 0, 0, 0, 1, 1,
-0.2841462, 0.02675718, 0.04481328, 0, 0, 0, 1, 1,
-0.2832757, -0.02980993, -1.022097, 0, 0, 0, 1, 1,
-0.2813314, -1.439717, -4.83273, 0, 0, 0, 1, 1,
-0.2789203, 0.5216401, -0.5606393, 0, 0, 0, 1, 1,
-0.2745036, -0.5778996, -1.656207, 0, 0, 0, 1, 1,
-0.2731686, 0.1972329, -0.7011694, 1, 1, 1, 1, 1,
-0.2676543, 0.2618787, -0.6049561, 1, 1, 1, 1, 1,
-0.2670284, -2.871113, -4.510013, 1, 1, 1, 1, 1,
-0.266633, 0.6498398, -0.4035771, 1, 1, 1, 1, 1,
-0.2629765, 0.2734812, -0.001023394, 1, 1, 1, 1, 1,
-0.259764, 1.928354, -0.7187089, 1, 1, 1, 1, 1,
-0.2594667, 1.306454, 0.2917355, 1, 1, 1, 1, 1,
-0.2553669, -1.592997, -3.272702, 1, 1, 1, 1, 1,
-0.2548943, -1.947926, -1.736948, 1, 1, 1, 1, 1,
-0.2521137, 0.009088534, -2.513349, 1, 1, 1, 1, 1,
-0.2519497, 0.4253607, -0.4460362, 1, 1, 1, 1, 1,
-0.2514443, 0.1288951, -1.409659, 1, 1, 1, 1, 1,
-0.2481693, 0.1273838, -0.3270714, 1, 1, 1, 1, 1,
-0.2473168, -0.5463448, -1.931507, 1, 1, 1, 1, 1,
-0.2461368, -0.08983894, -1.753256, 1, 1, 1, 1, 1,
-0.2455782, -0.9001506, -0.778585, 0, 0, 1, 1, 1,
-0.2442941, -1.416868, -4.235138, 1, 0, 0, 1, 1,
-0.2422122, -1.282109, -2.01621, 1, 0, 0, 1, 1,
-0.2402512, -0.5017425, -2.5931, 1, 0, 0, 1, 1,
-0.2380213, -0.8287199, -2.913182, 1, 0, 0, 1, 1,
-0.2379216, -0.1635244, -1.8441, 1, 0, 0, 1, 1,
-0.2365659, 0.816588, -2.927785, 0, 0, 0, 1, 1,
-0.2329611, -0.6450809, -3.419996, 0, 0, 0, 1, 1,
-0.2314956, -0.3681225, -2.497679, 0, 0, 0, 1, 1,
-0.2308107, 0.09063189, 1.670554, 0, 0, 0, 1, 1,
-0.2211568, 0.3532097, -1.335891, 0, 0, 0, 1, 1,
-0.2188303, -0.6456304, -2.593071, 0, 0, 0, 1, 1,
-0.2156435, 1.541313, -1.73911, 0, 0, 0, 1, 1,
-0.2136961, -0.1928416, -2.895635, 1, 1, 1, 1, 1,
-0.2092411, 1.586526, -0.3478135, 1, 1, 1, 1, 1,
-0.2055016, -1.033527, -4.23617, 1, 1, 1, 1, 1,
-0.2023786, 0.8883466, -0.870186, 1, 1, 1, 1, 1,
-0.2012192, -0.406652, -0.8525845, 1, 1, 1, 1, 1,
-0.1994881, 0.08016152, -2.338653, 1, 1, 1, 1, 1,
-0.1986534, 0.4967973, -0.004035953, 1, 1, 1, 1, 1,
-0.1960189, 0.9453168, 0.8523498, 1, 1, 1, 1, 1,
-0.1922299, 0.5229354, -0.8205502, 1, 1, 1, 1, 1,
-0.1914316, -0.190504, -3.91324, 1, 1, 1, 1, 1,
-0.1860259, -0.3580161, -2.340461, 1, 1, 1, 1, 1,
-0.1834119, 0.3511456, -0.4540349, 1, 1, 1, 1, 1,
-0.1827451, 0.8389893, 1.025198, 1, 1, 1, 1, 1,
-0.1824234, -2.346823, -2.996082, 1, 1, 1, 1, 1,
-0.1757584, 0.6052418, -0.6292161, 1, 1, 1, 1, 1,
-0.1718116, 1.186303, -0.6740534, 0, 0, 1, 1, 1,
-0.1692964, -0.2673471, -2.734491, 1, 0, 0, 1, 1,
-0.1678817, 1.448536, 1.781433, 1, 0, 0, 1, 1,
-0.1672871, 0.6544189, -0.9225371, 1, 0, 0, 1, 1,
-0.1524858, -1.625211, -3.376805, 1, 0, 0, 1, 1,
-0.1500578, 0.8649693, -0.6284071, 1, 0, 0, 1, 1,
-0.1453146, 0.8657163, -0.3287508, 0, 0, 0, 1, 1,
-0.144991, 0.7482865, 0.1121962, 0, 0, 0, 1, 1,
-0.1378008, 1.036651, -1.27413, 0, 0, 0, 1, 1,
-0.1375617, -0.6023751, -3.856137, 0, 0, 0, 1, 1,
-0.1364713, -1.718584, -2.399091, 0, 0, 0, 1, 1,
-0.1347722, 1.049831, 1.142676, 0, 0, 0, 1, 1,
-0.1305498, -0.8306272, -2.891173, 0, 0, 0, 1, 1,
-0.1249265, -0.4717221, -2.938445, 1, 1, 1, 1, 1,
-0.1247373, 0.3845605, 0.1608876, 1, 1, 1, 1, 1,
-0.1185865, 0.7365453, -1.617132, 1, 1, 1, 1, 1,
-0.1159413, 0.3663784, -1.489518, 1, 1, 1, 1, 1,
-0.1158778, 0.7974233, 0.5525293, 1, 1, 1, 1, 1,
-0.111411, 0.3931085, -1.223256, 1, 1, 1, 1, 1,
-0.1101575, -1.427895, -3.333627, 1, 1, 1, 1, 1,
-0.1074472, -1.184626, -3.868069, 1, 1, 1, 1, 1,
-0.1050618, 1.225113, -1.480803, 1, 1, 1, 1, 1,
-0.1027111, -0.07032627, -2.86751, 1, 1, 1, 1, 1,
-0.1017459, 0.06695814, -2.304106, 1, 1, 1, 1, 1,
-0.09969074, -0.8582917, -3.704207, 1, 1, 1, 1, 1,
-0.0943208, -1.997391, -4.262781, 1, 1, 1, 1, 1,
-0.09385131, -1.439001, -2.913356, 1, 1, 1, 1, 1,
-0.09202773, 0.6720048, 0.659196, 1, 1, 1, 1, 1,
-0.09201506, -1.212217, -3.899743, 0, 0, 1, 1, 1,
-0.09177677, 1.189759, 0.01381483, 1, 0, 0, 1, 1,
-0.0861857, 0.3297841, 2.260762, 1, 0, 0, 1, 1,
-0.08577575, 0.1168764, -0.4406811, 1, 0, 0, 1, 1,
-0.08157165, 0.6848662, 0.4519113, 1, 0, 0, 1, 1,
-0.08067507, 0.8580723, 0.6673441, 1, 0, 0, 1, 1,
-0.07875392, -0.5713367, -4.244642, 0, 0, 0, 1, 1,
-0.07801874, 0.01500654, -1.370876, 0, 0, 0, 1, 1,
-0.07764998, -0.6085369, -0.8501969, 0, 0, 0, 1, 1,
-0.06934433, -1.082779, -3.99919, 0, 0, 0, 1, 1,
-0.0621779, -0.3801643, -2.299429, 0, 0, 0, 1, 1,
-0.06191711, 0.5388611, 0.2651393, 0, 0, 0, 1, 1,
-0.05902023, 0.5948707, 1.342863, 0, 0, 0, 1, 1,
-0.05441331, 0.2899538, -1.135325, 1, 1, 1, 1, 1,
-0.05417721, 0.2587603, 0.9419528, 1, 1, 1, 1, 1,
-0.05393236, 0.1179825, -0.4452705, 1, 1, 1, 1, 1,
-0.05331739, -0.2359944, -2.735615, 1, 1, 1, 1, 1,
-0.05140858, 0.4375288, 0.3281858, 1, 1, 1, 1, 1,
-0.04764894, 0.6057031, 1.226337, 1, 1, 1, 1, 1,
-0.04612756, -0.2154053, -2.488317, 1, 1, 1, 1, 1,
-0.04303996, 0.9866106, -0.1962863, 1, 1, 1, 1, 1,
-0.03806435, -1.593212, -4.112508, 1, 1, 1, 1, 1,
-0.03677281, 0.2835981, -1.12159, 1, 1, 1, 1, 1,
-0.02876237, 1.170432, -1.281752, 1, 1, 1, 1, 1,
-0.02484687, 0.5590014, 0.4549146, 1, 1, 1, 1, 1,
-0.02470777, 1.426965, -0.3634202, 1, 1, 1, 1, 1,
-0.0204364, 1.202695, -0.7246928, 1, 1, 1, 1, 1,
-0.01915054, 0.3304025, 0.4716875, 1, 1, 1, 1, 1,
-0.01774875, -0.3236263, -4.197479, 0, 0, 1, 1, 1,
-0.0164772, -0.6041933, -5.385568, 1, 0, 0, 1, 1,
-0.01299838, 0.3112805, -0.9106938, 1, 0, 0, 1, 1,
-0.003614914, -0.9837646, -4.578726, 1, 0, 0, 1, 1,
-0.002663072, 0.4260999, 0.2829306, 1, 0, 0, 1, 1,
-0.002252321, -1.380131, -1.995502, 1, 0, 0, 1, 1,
0.0007417375, -1.223879, 4.407253, 0, 0, 0, 1, 1,
0.002930185, 1.397113, -0.4881145, 0, 0, 0, 1, 1,
0.00456582, -0.0464894, 3.943885, 0, 0, 0, 1, 1,
0.01594339, -1.230756, 2.947375, 0, 0, 0, 1, 1,
0.01946795, 1.211963, 0.7115299, 0, 0, 0, 1, 1,
0.03120476, -0.2929473, -0.3283961, 0, 0, 0, 1, 1,
0.03315222, -1.443277, 4.178336, 0, 0, 0, 1, 1,
0.03486018, 0.6646446, -0.6383186, 1, 1, 1, 1, 1,
0.03703194, -0.5575967, 2.797359, 1, 1, 1, 1, 1,
0.03720269, 0.1772358, 1.708198, 1, 1, 1, 1, 1,
0.04145015, 1.178298, -0.1608705, 1, 1, 1, 1, 1,
0.0449874, 1.034468, -1.681181, 1, 1, 1, 1, 1,
0.04872315, -0.4364551, 2.730635, 1, 1, 1, 1, 1,
0.05086483, -1.269489, 1.639181, 1, 1, 1, 1, 1,
0.0510521, -0.3656103, 3.826504, 1, 1, 1, 1, 1,
0.051297, -0.8143317, 4.014896, 1, 1, 1, 1, 1,
0.05294678, 0.6427925, -0.375178, 1, 1, 1, 1, 1,
0.05602423, -0.5840315, 1.420108, 1, 1, 1, 1, 1,
0.05724347, -0.3791515, 2.62326, 1, 1, 1, 1, 1,
0.06094931, 0.6787046, -0.07092731, 1, 1, 1, 1, 1,
0.06466466, -1.061566, 2.934265, 1, 1, 1, 1, 1,
0.06596035, -0.776716, 2.568338, 1, 1, 1, 1, 1,
0.06855699, 0.5322458, 0.4577072, 0, 0, 1, 1, 1,
0.06944627, 0.44402, 0.3562986, 1, 0, 0, 1, 1,
0.07507126, 1.928529, 1.254599, 1, 0, 0, 1, 1,
0.07967736, 1.031041, -0.5731438, 1, 0, 0, 1, 1,
0.08048952, 0.4914028, -2.442612, 1, 0, 0, 1, 1,
0.08102217, -1.913411, 3.532403, 1, 0, 0, 1, 1,
0.08192302, -0.7747054, 2.72018, 0, 0, 0, 1, 1,
0.08218817, -0.3856699, 2.52782, 0, 0, 0, 1, 1,
0.08637511, 0.2940791, -1.75229, 0, 0, 0, 1, 1,
0.09324897, -2.077522, 1.810328, 0, 0, 0, 1, 1,
0.0955742, 0.344956, -1.186182, 0, 0, 0, 1, 1,
0.09673589, -1.083286, 3.659084, 0, 0, 0, 1, 1,
0.0992648, 0.4968968, 1.459396, 0, 0, 0, 1, 1,
0.1053096, 0.995913, 0.5032566, 1, 1, 1, 1, 1,
0.1103534, -0.5856836, 3.264334, 1, 1, 1, 1, 1,
0.1125999, -1.143036, 3.874598, 1, 1, 1, 1, 1,
0.1161142, -0.6596427, 2.073525, 1, 1, 1, 1, 1,
0.1207973, 0.8195152, -1.446985, 1, 1, 1, 1, 1,
0.1210974, 1.605004, -2.603545, 1, 1, 1, 1, 1,
0.1214136, 2.046169, -0.3580444, 1, 1, 1, 1, 1,
0.1237065, -0.4719253, 2.616814, 1, 1, 1, 1, 1,
0.1289301, 0.4023713, -1.107318, 1, 1, 1, 1, 1,
0.1345972, -0.2473714, 2.892611, 1, 1, 1, 1, 1,
0.1397318, 1.454969, 1.346819, 1, 1, 1, 1, 1,
0.141105, 1.601408, -1.428792, 1, 1, 1, 1, 1,
0.1419083, 0.08318885, -0.1229145, 1, 1, 1, 1, 1,
0.1427063, 0.3117009, 1.389889, 1, 1, 1, 1, 1,
0.1458684, -0.7736399, 3.817116, 1, 1, 1, 1, 1,
0.1504026, -0.5513325, 2.246113, 0, 0, 1, 1, 1,
0.1529176, -0.7463717, 4.049619, 1, 0, 0, 1, 1,
0.1538111, 2.515753, -1.392342, 1, 0, 0, 1, 1,
0.1555715, 1.152405, -2.827567, 1, 0, 0, 1, 1,
0.1556033, -0.7787422, 2.889995, 1, 0, 0, 1, 1,
0.1586584, -0.9314012, 2.810487, 1, 0, 0, 1, 1,
0.1588902, 1.619448, -1.182402, 0, 0, 0, 1, 1,
0.1606481, 0.8071255, -0.5572922, 0, 0, 0, 1, 1,
0.1612996, -0.6142626, 3.165387, 0, 0, 0, 1, 1,
0.1626376, 0.9266088, -0.9661012, 0, 0, 0, 1, 1,
0.1628024, -0.7529306, 3.366238, 0, 0, 0, 1, 1,
0.1649905, -1.171933, 2.609794, 0, 0, 0, 1, 1,
0.1677422, -0.8862474, 3.993733, 0, 0, 0, 1, 1,
0.1681815, -1.656767, 3.224775, 1, 1, 1, 1, 1,
0.1720913, -1.461429, 3.309825, 1, 1, 1, 1, 1,
0.173526, 1.036238, -1.099488, 1, 1, 1, 1, 1,
0.174003, -0.3467129, 1.296382, 1, 1, 1, 1, 1,
0.1764314, -0.1423397, 1.719904, 1, 1, 1, 1, 1,
0.1800384, -0.2601166, 1.189904, 1, 1, 1, 1, 1,
0.1832487, 0.2677273, 1.201037, 1, 1, 1, 1, 1,
0.1863654, 1.305061, 1.292193, 1, 1, 1, 1, 1,
0.1873994, -0.4816979, 1.448122, 1, 1, 1, 1, 1,
0.1896835, 0.9315962, 1.565663, 1, 1, 1, 1, 1,
0.1897852, -0.05551141, 2.107388, 1, 1, 1, 1, 1,
0.1922832, -0.5819185, 2.985367, 1, 1, 1, 1, 1,
0.1926975, 1.236991, 0.6066081, 1, 1, 1, 1, 1,
0.1964441, -1.678384, 2.92424, 1, 1, 1, 1, 1,
0.1968013, -1.075223, 2.362712, 1, 1, 1, 1, 1,
0.1996385, 0.08258542, 1.604188, 0, 0, 1, 1, 1,
0.2014807, 1.337432, 0.05611606, 1, 0, 0, 1, 1,
0.2151704, 0.02781943, 0.07335372, 1, 0, 0, 1, 1,
0.2199926, 0.3172445, 0.8837469, 1, 0, 0, 1, 1,
0.2250228, -0.7905281, 3.063125, 1, 0, 0, 1, 1,
0.2336895, -0.7466392, 1.985227, 1, 0, 0, 1, 1,
0.2393361, 0.5982385, 0.7068547, 0, 0, 0, 1, 1,
0.2409771, -0.2428269, 2.544, 0, 0, 0, 1, 1,
0.2416472, -0.4069982, 0.6992313, 0, 0, 0, 1, 1,
0.2444027, -1.304568, 1.368477, 0, 0, 0, 1, 1,
0.2447828, 0.03856662, 1.393032, 0, 0, 0, 1, 1,
0.2453567, 0.1425718, 0.5811461, 0, 0, 0, 1, 1,
0.2458219, -1.449866, 3.157389, 0, 0, 0, 1, 1,
0.2481442, 0.3090617, -0.8564886, 1, 1, 1, 1, 1,
0.2518627, 0.515523, 1.628644, 1, 1, 1, 1, 1,
0.2573171, 1.047266, 0.7158191, 1, 1, 1, 1, 1,
0.2582051, 0.2297123, 0.8811358, 1, 1, 1, 1, 1,
0.2583676, 0.3191318, 0.07799067, 1, 1, 1, 1, 1,
0.2607009, 0.1345151, 0.9689134, 1, 1, 1, 1, 1,
0.26497, -1.009128, 2.798285, 1, 1, 1, 1, 1,
0.2680013, 1.193699, 1.474821, 1, 1, 1, 1, 1,
0.268428, 0.2047934, 0.6804104, 1, 1, 1, 1, 1,
0.2717157, -1.289298, 4.055323, 1, 1, 1, 1, 1,
0.2756806, -0.3293386, 1.577775, 1, 1, 1, 1, 1,
0.2762406, 0.930844, 1.094174, 1, 1, 1, 1, 1,
0.2851979, 0.02427332, 0.9109146, 1, 1, 1, 1, 1,
0.2856484, -0.2731866, 3.171758, 1, 1, 1, 1, 1,
0.2919162, -1.019821, 2.270251, 1, 1, 1, 1, 1,
0.2921873, 0.2282484, -0.8654839, 0, 0, 1, 1, 1,
0.3015953, 1.336729, -0.04424667, 1, 0, 0, 1, 1,
0.3055016, -0.3737851, 2.187898, 1, 0, 0, 1, 1,
0.3061282, -0.8252993, 2.255834, 1, 0, 0, 1, 1,
0.3068089, 0.314191, -0.07625777, 1, 0, 0, 1, 1,
0.3100403, -1.052572, 2.387713, 1, 0, 0, 1, 1,
0.3116807, 1.3433, -0.3733805, 0, 0, 0, 1, 1,
0.3124962, -1.086705, 2.076163, 0, 0, 0, 1, 1,
0.3125491, 0.4394891, 0.4557051, 0, 0, 0, 1, 1,
0.3193814, 0.1995425, 2.816098, 0, 0, 0, 1, 1,
0.3208141, 0.2946541, -0.3422629, 0, 0, 0, 1, 1,
0.3222285, -0.1373939, 2.821181, 0, 0, 0, 1, 1,
0.3243173, 0.3541843, -0.5619407, 0, 0, 0, 1, 1,
0.3248149, -0.1296608, 0.8805989, 1, 1, 1, 1, 1,
0.3252108, -0.7993493, 2.674283, 1, 1, 1, 1, 1,
0.325442, -0.6247142, 2.821656, 1, 1, 1, 1, 1,
0.3266046, 0.003071968, 1.029544, 1, 1, 1, 1, 1,
0.3273571, -0.1705908, 2.276839, 1, 1, 1, 1, 1,
0.3293043, 0.1735019, 1.015027, 1, 1, 1, 1, 1,
0.3303714, -0.7910231, 2.958409, 1, 1, 1, 1, 1,
0.3311714, 2.216046, -1.712012, 1, 1, 1, 1, 1,
0.3432865, -0.8678458, 3.037249, 1, 1, 1, 1, 1,
0.3441873, -0.2331285, 0.7918718, 1, 1, 1, 1, 1,
0.3447901, -1.613884, 3.421247, 1, 1, 1, 1, 1,
0.3526824, -0.4893337, 3.027287, 1, 1, 1, 1, 1,
0.3715402, -0.6459953, 3.52862, 1, 1, 1, 1, 1,
0.3715623, 0.6928204, 0.9177759, 1, 1, 1, 1, 1,
0.3747675, 0.1938144, 1.563595, 1, 1, 1, 1, 1,
0.3820974, -0.551823, 1.819454, 0, 0, 1, 1, 1,
0.3846096, 0.5951331, -1.34476, 1, 0, 0, 1, 1,
0.3858512, -0.24198, 2.988935, 1, 0, 0, 1, 1,
0.3873724, -1.114599, 2.628612, 1, 0, 0, 1, 1,
0.3873747, 0.2651311, 1.179749, 1, 0, 0, 1, 1,
0.3879758, 0.9561741, 0.1934576, 1, 0, 0, 1, 1,
0.389452, 0.6524982, 2.261947, 0, 0, 0, 1, 1,
0.3962204, 2.188998, 0.7953386, 0, 0, 0, 1, 1,
0.3980209, 1.066597, 0.482597, 0, 0, 0, 1, 1,
0.3987614, 0.1694388, 1.127429, 0, 0, 0, 1, 1,
0.401375, -1.006541, 5.195841, 0, 0, 0, 1, 1,
0.4023647, -1.092235, 3.13616, 0, 0, 0, 1, 1,
0.4033272, -0.2203235, 0.8758743, 0, 0, 0, 1, 1,
0.4049128, -0.8091719, 4.271542, 1, 1, 1, 1, 1,
0.4132246, -0.9272283, 1.410587, 1, 1, 1, 1, 1,
0.4166651, -0.7207971, 3.140899, 1, 1, 1, 1, 1,
0.4188453, 0.1300207, 0.3068305, 1, 1, 1, 1, 1,
0.4224955, -0.008796652, 1.671546, 1, 1, 1, 1, 1,
0.429545, -1.88967, 3.397839, 1, 1, 1, 1, 1,
0.4323902, -0.135468, 2.282341, 1, 1, 1, 1, 1,
0.433147, -0.9753369, 2.658008, 1, 1, 1, 1, 1,
0.4341127, -0.07223327, 0.9302274, 1, 1, 1, 1, 1,
0.4353873, 0.6588229, 2.280879, 1, 1, 1, 1, 1,
0.4382892, -1.447522, 4.002562, 1, 1, 1, 1, 1,
0.4384011, 0.09891535, 1.829269, 1, 1, 1, 1, 1,
0.4406277, 1.332934, 1.203879, 1, 1, 1, 1, 1,
0.4406881, 0.578604, 0.6692291, 1, 1, 1, 1, 1,
0.443468, -0.9508011, 2.51438, 1, 1, 1, 1, 1,
0.4539414, -1.339739, 2.345784, 0, 0, 1, 1, 1,
0.4618048, -0.8798321, 1.076997, 1, 0, 0, 1, 1,
0.4627187, 0.629749, 1.58949, 1, 0, 0, 1, 1,
0.4633123, 0.6457608, -0.7666112, 1, 0, 0, 1, 1,
0.4666434, 1.749056, -1.253736, 1, 0, 0, 1, 1,
0.471603, -0.8635545, 1.290054, 1, 0, 0, 1, 1,
0.4724686, -1.12697, 1.333523, 0, 0, 0, 1, 1,
0.4755595, -1.683407, 2.194599, 0, 0, 0, 1, 1,
0.4805662, -2.382744, 1.927307, 0, 0, 0, 1, 1,
0.4811572, -1.042389, 2.917952, 0, 0, 0, 1, 1,
0.486744, -0.2386916, 2.072224, 0, 0, 0, 1, 1,
0.4879037, -0.001594676, 2.506376, 0, 0, 0, 1, 1,
0.4916272, 1.859557, -0.5432485, 0, 0, 0, 1, 1,
0.4935144, -0.7685657, 3.323041, 1, 1, 1, 1, 1,
0.4972123, 0.07877418, 2.216433, 1, 1, 1, 1, 1,
0.497988, -0.1941869, 0.8787971, 1, 1, 1, 1, 1,
0.5053496, 0.7600213, 2.48233, 1, 1, 1, 1, 1,
0.5070413, 1.627859, 0.7631607, 1, 1, 1, 1, 1,
0.5086066, -1.220446, 5.137136, 1, 1, 1, 1, 1,
0.5124722, -2.967588, 3.606855, 1, 1, 1, 1, 1,
0.5129366, 0.100278, 2.717471, 1, 1, 1, 1, 1,
0.5136753, -0.4049733, 2.340293, 1, 1, 1, 1, 1,
0.513908, -0.3481523, 2.581631, 1, 1, 1, 1, 1,
0.5162153, -0.6838387, 3.294137, 1, 1, 1, 1, 1,
0.5187159, 0.2182192, 1.543981, 1, 1, 1, 1, 1,
0.5226265, 1.067372, 1.16519, 1, 1, 1, 1, 1,
0.5236067, 0.9685975, -0.04643833, 1, 1, 1, 1, 1,
0.5261436, 0.4204624, -0.02740389, 1, 1, 1, 1, 1,
0.5285287, 0.8727466, -0.390011, 0, 0, 1, 1, 1,
0.5292974, -1.641304, 0.532895, 1, 0, 0, 1, 1,
0.5294625, -0.2808613, 1.5258, 1, 0, 0, 1, 1,
0.5325759, -0.3153716, 1.632672, 1, 0, 0, 1, 1,
0.5325853, 0.2337402, 2.786149, 1, 0, 0, 1, 1,
0.535418, 0.976734, 0.07162808, 1, 0, 0, 1, 1,
0.5431361, -1.117326, 3.280774, 0, 0, 0, 1, 1,
0.5545374, 0.8944913, -0.08877258, 0, 0, 0, 1, 1,
0.5551348, 0.448346, -0.01050144, 0, 0, 0, 1, 1,
0.5602822, 0.8586362, -0.4328524, 0, 0, 0, 1, 1,
0.5649862, 0.8130886, 0.6021691, 0, 0, 0, 1, 1,
0.5693915, -0.3279833, 0.8814514, 0, 0, 0, 1, 1,
0.5766113, 0.8659399, 0.2683546, 0, 0, 0, 1, 1,
0.5768712, 0.3896521, 0.8019173, 1, 1, 1, 1, 1,
0.5804937, -0.6647831, 2.116955, 1, 1, 1, 1, 1,
0.5811974, -0.190175, 2.280202, 1, 1, 1, 1, 1,
0.5832469, -0.9434544, 2.796169, 1, 1, 1, 1, 1,
0.5872789, -0.7822319, 2.930381, 1, 1, 1, 1, 1,
0.5895083, 0.8191216, -2.586161, 1, 1, 1, 1, 1,
0.5943832, -0.738296, 2.664984, 1, 1, 1, 1, 1,
0.5996162, 0.3619321, 0.4064969, 1, 1, 1, 1, 1,
0.6008666, 1.149357, 0.6988234, 1, 1, 1, 1, 1,
0.6050671, 1.918562, 0.8449612, 1, 1, 1, 1, 1,
0.608255, 2.154394, 0.002269947, 1, 1, 1, 1, 1,
0.6117151, 0.6143204, -0.9199797, 1, 1, 1, 1, 1,
0.6145247, 0.9526002, 0.02627278, 1, 1, 1, 1, 1,
0.6174125, -0.5037219, 2.007367, 1, 1, 1, 1, 1,
0.6175335, 0.3236043, 1.163541, 1, 1, 1, 1, 1,
0.6222401, -1.108165, 1.888073, 0, 0, 1, 1, 1,
0.6233501, 1.395427, 0.3761282, 1, 0, 0, 1, 1,
0.6234723, 1.091842, -0.4446945, 1, 0, 0, 1, 1,
0.6263567, -1.634895, 1.111238, 1, 0, 0, 1, 1,
0.6269478, 0.09708602, 1.388878, 1, 0, 0, 1, 1,
0.6339447, 0.8738433, 1.076355, 1, 0, 0, 1, 1,
0.6355011, -0.2773074, 2.061602, 0, 0, 0, 1, 1,
0.6380526, 0.3680412, 1.070433, 0, 0, 0, 1, 1,
0.6394526, 0.2138418, 1.06234, 0, 0, 0, 1, 1,
0.6395445, -1.187543, 4.230693, 0, 0, 0, 1, 1,
0.6469104, -0.7595434, 3.738097, 0, 0, 0, 1, 1,
0.6487075, 0.7062644, -0.1418925, 0, 0, 0, 1, 1,
0.6530539, 0.9453587, 0.6313847, 0, 0, 0, 1, 1,
0.654115, -0.1145773, 0.919261, 1, 1, 1, 1, 1,
0.6581455, 0.7953902, 1.387602, 1, 1, 1, 1, 1,
0.6585125, -0.5280478, 2.825011, 1, 1, 1, 1, 1,
0.6634331, -0.0252856, 0.5927304, 1, 1, 1, 1, 1,
0.664465, -0.5624455, 1.116245, 1, 1, 1, 1, 1,
0.6685045, 0.4335242, 0.4916056, 1, 1, 1, 1, 1,
0.6704075, 0.3053375, 1.082228, 1, 1, 1, 1, 1,
0.6722856, 1.602798, 2.400526, 1, 1, 1, 1, 1,
0.6767129, -2.782098, 2.49628, 1, 1, 1, 1, 1,
0.6776248, 0.7083842, -0.6490473, 1, 1, 1, 1, 1,
0.6789799, -0.05964474, 3.09674, 1, 1, 1, 1, 1,
0.6803543, 0.2542935, -0.1016, 1, 1, 1, 1, 1,
0.6811824, -0.6216287, 2.837375, 1, 1, 1, 1, 1,
0.6837037, 0.8690075, 0.3699946, 1, 1, 1, 1, 1,
0.688043, -1.080239, 1.901659, 1, 1, 1, 1, 1,
0.6895998, 0.5986134, 0.8136516, 0, 0, 1, 1, 1,
0.696919, -0.08011312, 3.829907, 1, 0, 0, 1, 1,
0.7004294, 1.574769, 0.8654629, 1, 0, 0, 1, 1,
0.7078686, 0.4372331, 0.4122654, 1, 0, 0, 1, 1,
0.721891, -1.16535, 2.442922, 1, 0, 0, 1, 1,
0.7270949, -0.0279469, 2.112717, 1, 0, 0, 1, 1,
0.7304189, -1.651892, 3.642178, 0, 0, 0, 1, 1,
0.7315295, -0.4219168, 1.603272, 0, 0, 0, 1, 1,
0.7367856, 1.429242, 1.268212, 0, 0, 0, 1, 1,
0.7414984, 0.3914686, 1.066642, 0, 0, 0, 1, 1,
0.745173, -1.796388, 3.13882, 0, 0, 0, 1, 1,
0.7524184, 0.869127, 1.195578, 0, 0, 0, 1, 1,
0.7552902, -1.695154, 4.307723, 0, 0, 0, 1, 1,
0.7559711, 0.2764526, 0.9446878, 1, 1, 1, 1, 1,
0.7570311, 0.1735579, 1.647434, 1, 1, 1, 1, 1,
0.7587602, 0.3035191, 1.082907, 1, 1, 1, 1, 1,
0.7595816, 0.2481804, 1.059296, 1, 1, 1, 1, 1,
0.760313, -0.4155926, 2.875866, 1, 1, 1, 1, 1,
0.7607424, 1.41348, 0.9164987, 1, 1, 1, 1, 1,
0.7673861, -0.5325585, 1.957633, 1, 1, 1, 1, 1,
0.7685761, -0.8544156, 2.978752, 1, 1, 1, 1, 1,
0.7710302, -1.173878, 1.404481, 1, 1, 1, 1, 1,
0.7753176, -0.6056494, 2.431024, 1, 1, 1, 1, 1,
0.7754734, -0.5056871, 1.776078, 1, 1, 1, 1, 1,
0.7772848, -0.829451, 0.7838836, 1, 1, 1, 1, 1,
0.7812361, 0.07991451, 2.735464, 1, 1, 1, 1, 1,
0.782585, -1.65192, 2.806869, 1, 1, 1, 1, 1,
0.7831685, 1.011952, 0.8609468, 1, 1, 1, 1, 1,
0.7843157, -1.067039, 3.971169, 0, 0, 1, 1, 1,
0.7891726, -0.6910481, 1.927908, 1, 0, 0, 1, 1,
0.7927231, 0.4105563, -0.2120759, 1, 0, 0, 1, 1,
0.7927319, 0.04235577, 1.619391, 1, 0, 0, 1, 1,
0.7978724, 0.9672632, -0.27382, 1, 0, 0, 1, 1,
0.7996837, 0.03262829, 1.851956, 1, 0, 0, 1, 1,
0.806503, -0.4818447, 2.221727, 0, 0, 0, 1, 1,
0.8100306, -0.9350172, 2.598362, 0, 0, 0, 1, 1,
0.8107299, -1.25541, 3.393689, 0, 0, 0, 1, 1,
0.813475, -2.172777, 2.781284, 0, 0, 0, 1, 1,
0.820417, 1.194703, 2.377794, 0, 0, 0, 1, 1,
0.8219141, -1.077255, 1.731561, 0, 0, 0, 1, 1,
0.8238516, 0.3861649, 0.3223438, 0, 0, 0, 1, 1,
0.8293474, -0.2793438, 1.075382, 1, 1, 1, 1, 1,
0.831093, -0.02750915, 1.259617, 1, 1, 1, 1, 1,
0.8312234, -1.498923, 0.2485789, 1, 1, 1, 1, 1,
0.834642, -0.7185091, 2.68203, 1, 1, 1, 1, 1,
0.838303, -0.1966343, 1.633038, 1, 1, 1, 1, 1,
0.8385864, -0.4160283, 1.692732, 1, 1, 1, 1, 1,
0.8413953, -2.074801, 3.407564, 1, 1, 1, 1, 1,
0.8463278, 1.045183, 0.07085802, 1, 1, 1, 1, 1,
0.8562683, -0.8381548, 2.124523, 1, 1, 1, 1, 1,
0.8649052, -0.8240539, 3.135281, 1, 1, 1, 1, 1,
0.8659797, -0.8692755, 1.638902, 1, 1, 1, 1, 1,
0.8673927, 1.991755, 0.7782332, 1, 1, 1, 1, 1,
0.8766472, -0.7935753, 1.792271, 1, 1, 1, 1, 1,
0.8842687, 0.02139686, 3.051182, 1, 1, 1, 1, 1,
0.8872792, 0.305519, 1.462574, 1, 1, 1, 1, 1,
0.8892927, 1.195732, 1.240283, 0, 0, 1, 1, 1,
0.8938435, -0.134076, 1.669537, 1, 0, 0, 1, 1,
0.8977929, 0.7562712, 0.6980793, 1, 0, 0, 1, 1,
0.8981779, -0.8792117, 2.661196, 1, 0, 0, 1, 1,
0.8984407, -1.369994, 3.675487, 1, 0, 0, 1, 1,
0.905561, -1.020746, 2.191454, 1, 0, 0, 1, 1,
0.9062051, 0.7962564, 1.079318, 0, 0, 0, 1, 1,
0.9068641, 0.2174409, 0.5860276, 0, 0, 0, 1, 1,
0.9078466, 0.5894763, 0.9359464, 0, 0, 0, 1, 1,
0.9098974, 0.3362403, 2.996687, 0, 0, 0, 1, 1,
0.9102305, 0.06141005, 1.370174, 0, 0, 0, 1, 1,
0.9113841, 0.2915596, 2.384588, 0, 0, 0, 1, 1,
0.9191323, -0.8045847, 3.439255, 0, 0, 0, 1, 1,
0.9246343, -0.6302999, 1.731844, 1, 1, 1, 1, 1,
0.9252734, 0.9924249, 1.545451, 1, 1, 1, 1, 1,
0.9253346, -0.1163231, 2.310482, 1, 1, 1, 1, 1,
0.9268433, 0.8184524, -0.8192895, 1, 1, 1, 1, 1,
0.9294044, -0.2831875, 2.710659, 1, 1, 1, 1, 1,
0.9296045, -0.2584994, 1.942733, 1, 1, 1, 1, 1,
0.9391342, 0.4431485, 0.06031591, 1, 1, 1, 1, 1,
0.9391646, -0.8383601, 1.42022, 1, 1, 1, 1, 1,
0.9460825, 0.4500749, 1.870267, 1, 1, 1, 1, 1,
0.9510219, 0.04410351, 1.13821, 1, 1, 1, 1, 1,
0.9543195, 0.2413761, 2.544378, 1, 1, 1, 1, 1,
0.956656, -0.9329866, 0.2286273, 1, 1, 1, 1, 1,
0.9663817, 0.8273339, 0.6927465, 1, 1, 1, 1, 1,
0.9712785, 1.487284, -2.096878, 1, 1, 1, 1, 1,
0.9727281, -1.685936, 2.023761, 1, 1, 1, 1, 1,
0.9759549, 1.068913, 0.981147, 0, 0, 1, 1, 1,
0.9834409, -1.895868, 2.074164, 1, 0, 0, 1, 1,
0.9880648, -0.2193159, 2.4583, 1, 0, 0, 1, 1,
0.9973368, 0.4909905, 0.8116162, 1, 0, 0, 1, 1,
1.000857, 0.4485718, 1.952616, 1, 0, 0, 1, 1,
1.002272, 0.1012835, 0.3309879, 1, 0, 0, 1, 1,
1.008106, 0.71257, 1.284296, 0, 0, 0, 1, 1,
1.017093, -0.3234362, 1.847995, 0, 0, 0, 1, 1,
1.017161, 2.17301, 0.06341008, 0, 0, 0, 1, 1,
1.024718, -1.076303, 2.49463, 0, 0, 0, 1, 1,
1.028246, 0.0636861, 0.5044959, 0, 0, 0, 1, 1,
1.031689, 2.19692, 1.739358, 0, 0, 0, 1, 1,
1.035835, -0.03844366, 2.263162, 0, 0, 0, 1, 1,
1.037708, 0.02465899, 3.043024, 1, 1, 1, 1, 1,
1.044775, -0.2900734, 1.88224, 1, 1, 1, 1, 1,
1.060081, 2.622671, -1.092824, 1, 1, 1, 1, 1,
1.063056, 0.6715161, 1.058663, 1, 1, 1, 1, 1,
1.063142, 2.291172, 0.8924854, 1, 1, 1, 1, 1,
1.064268, -0.1776161, 0.3948779, 1, 1, 1, 1, 1,
1.068656, -1.288034, 3.661423, 1, 1, 1, 1, 1,
1.068834, 0.08316015, 1.882635, 1, 1, 1, 1, 1,
1.070177, 1.56668, 2.217898, 1, 1, 1, 1, 1,
1.075459, -0.9224873, 1.878381, 1, 1, 1, 1, 1,
1.082214, 0.4453336, 2.052512, 1, 1, 1, 1, 1,
1.08551, -0.5830189, 1.639004, 1, 1, 1, 1, 1,
1.086416, -1.93376, 0.4443593, 1, 1, 1, 1, 1,
1.086586, 0.1208521, -0.7475835, 1, 1, 1, 1, 1,
1.091023, 0.2946554, 1.134021, 1, 1, 1, 1, 1,
1.099956, 0.8722073, 0.9297646, 0, 0, 1, 1, 1,
1.113229, 0.57934, -0.1394156, 1, 0, 0, 1, 1,
1.118964, 0.01122748, 2.232103, 1, 0, 0, 1, 1,
1.120556, 1.280814, 1.283648, 1, 0, 0, 1, 1,
1.121361, 0.2314167, 1.395331, 1, 0, 0, 1, 1,
1.122779, 1.166542, -0.3561022, 1, 0, 0, 1, 1,
1.124662, 2.341191, -0.005195436, 0, 0, 0, 1, 1,
1.126373, 0.4244942, 1.449185, 0, 0, 0, 1, 1,
1.128726, 0.2867355, 0.3736598, 0, 0, 0, 1, 1,
1.132888, 0.8363565, 2.488761, 0, 0, 0, 1, 1,
1.144204, 1.904873, -0.1985244, 0, 0, 0, 1, 1,
1.159894, 0.8037263, 1.716158, 0, 0, 0, 1, 1,
1.162578, 0.2434546, -0.2416852, 0, 0, 0, 1, 1,
1.169556, -0.02953442, -0.6373215, 1, 1, 1, 1, 1,
1.169713, 0.1981963, 1.912343, 1, 1, 1, 1, 1,
1.170348, 0.5802655, 2.663406, 1, 1, 1, 1, 1,
1.190175, 0.121662, 1.668495, 1, 1, 1, 1, 1,
1.191147, 0.1067489, 0.9650477, 1, 1, 1, 1, 1,
1.19827, -0.6126129, 2.119048, 1, 1, 1, 1, 1,
1.202637, 1.398154, 2.063365, 1, 1, 1, 1, 1,
1.206016, -0.4340474, 1.865825, 1, 1, 1, 1, 1,
1.212984, 1.304713, -0.07560243, 1, 1, 1, 1, 1,
1.213675, 1.324068, -0.1488407, 1, 1, 1, 1, 1,
1.21538, -0.6440036, 3.339057, 1, 1, 1, 1, 1,
1.219458, 0.7582136, 2.292587, 1, 1, 1, 1, 1,
1.228575, -0.08538377, 1.036329, 1, 1, 1, 1, 1,
1.229954, 0.7272761, 0.7188084, 1, 1, 1, 1, 1,
1.239522, -0.05143385, 1.482286, 1, 1, 1, 1, 1,
1.253963, -0.5538678, 2.551695, 0, 0, 1, 1, 1,
1.25621, 0.1410185, -0.165338, 1, 0, 0, 1, 1,
1.270303, -0.1708271, 1.866816, 1, 0, 0, 1, 1,
1.275537, -0.1945058, 1.164197, 1, 0, 0, 1, 1,
1.279076, 1.113693, 0.2907737, 1, 0, 0, 1, 1,
1.280175, -1.303128, 2.179061, 1, 0, 0, 1, 1,
1.288513, 1.128538, 1.093348, 0, 0, 0, 1, 1,
1.289882, 1.419584, 0.3802327, 0, 0, 0, 1, 1,
1.328708, 2.105776, -1.491989, 0, 0, 0, 1, 1,
1.331653, -0.139251, 2.10873, 0, 0, 0, 1, 1,
1.336597, 1.150729, 1.117006, 0, 0, 0, 1, 1,
1.34676, -0.3505069, 1.792811, 0, 0, 0, 1, 1,
1.349187, -2.096597, 2.796682, 0, 0, 0, 1, 1,
1.355224, -0.7548217, 1.727624, 1, 1, 1, 1, 1,
1.35997, 1.216444, 1.156029, 1, 1, 1, 1, 1,
1.365194, 0.818181, 1.805553, 1, 1, 1, 1, 1,
1.36786, -0.6493645, 1.569755, 1, 1, 1, 1, 1,
1.369084, -0.2652217, 3.211488, 1, 1, 1, 1, 1,
1.369937, 1.048501, 2.311566, 1, 1, 1, 1, 1,
1.386376, 0.847048, 0.8708112, 1, 1, 1, 1, 1,
1.396939, -1.097135, 1.93639, 1, 1, 1, 1, 1,
1.399317, -0.4065695, 1.176214, 1, 1, 1, 1, 1,
1.404179, 0.008460729, 1.211158, 1, 1, 1, 1, 1,
1.404765, -1.219937, 1.653692, 1, 1, 1, 1, 1,
1.415767, 0.3193174, 0.2613503, 1, 1, 1, 1, 1,
1.417829, 0.3629899, 3.695276, 1, 1, 1, 1, 1,
1.418477, 0.1404367, 2.019295, 1, 1, 1, 1, 1,
1.420003, -0.5056181, 2.353987, 1, 1, 1, 1, 1,
1.420308, 0.8482347, -0.1867653, 0, 0, 1, 1, 1,
1.421167, -0.3954084, 2.698625, 1, 0, 0, 1, 1,
1.428001, 0.02982039, 0.7782708, 1, 0, 0, 1, 1,
1.428136, -1.295128, 2.902371, 1, 0, 0, 1, 1,
1.43322, 0.490178, 1.25369, 1, 0, 0, 1, 1,
1.436933, -0.9821454, 1.127532, 1, 0, 0, 1, 1,
1.445691, -0.7381766, 2.28525, 0, 0, 0, 1, 1,
1.457237, -1.287294, 1.371819, 0, 0, 0, 1, 1,
1.462761, 0.8058077, 0.7702312, 0, 0, 0, 1, 1,
1.471578, 1.548609, 0.9880024, 0, 0, 0, 1, 1,
1.473647, -1.042513, 4.924557, 0, 0, 0, 1, 1,
1.481253, 0.294974, 0.9927117, 0, 0, 0, 1, 1,
1.494924, 0.1083877, 2.054007, 0, 0, 0, 1, 1,
1.506596, -0.5289177, 1.344568, 1, 1, 1, 1, 1,
1.51008, -1.801011, 2.627078, 1, 1, 1, 1, 1,
1.516015, -1.176633, 3.706051, 1, 1, 1, 1, 1,
1.523152, -0.5561609, 2.046688, 1, 1, 1, 1, 1,
1.525209, 1.595187, 0.2245996, 1, 1, 1, 1, 1,
1.580186, -0.1135235, 0.3417195, 1, 1, 1, 1, 1,
1.588677, -0.1126911, 0.6807958, 1, 1, 1, 1, 1,
1.594428, -0.7513092, 2.848032, 1, 1, 1, 1, 1,
1.602647, 0.9747585, 2.262388, 1, 1, 1, 1, 1,
1.607612, -1.755856, 1.601983, 1, 1, 1, 1, 1,
1.635264, -1.004736, 2.979432, 1, 1, 1, 1, 1,
1.638426, 0.04966802, 0.2840188, 1, 1, 1, 1, 1,
1.665478, -1.12797, 1.855923, 1, 1, 1, 1, 1,
1.687095, 1.676963, 0.8156959, 1, 1, 1, 1, 1,
1.700698, 0.293407, 2.121804, 1, 1, 1, 1, 1,
1.725105, -0.984933, 3.084582, 0, 0, 1, 1, 1,
1.754134, -0.3613877, 0.7772697, 1, 0, 0, 1, 1,
1.765319, 0.9587791, 1.875977, 1, 0, 0, 1, 1,
1.777944, 0.1704839, 1.839045, 1, 0, 0, 1, 1,
1.794794, 1.427551, 0.4374662, 1, 0, 0, 1, 1,
1.80172, 0.709322, 0.3086653, 1, 0, 0, 1, 1,
1.858688, -0.9815105, 2.610188, 0, 0, 0, 1, 1,
1.865512, 0.623971, 2.495847, 0, 0, 0, 1, 1,
1.871836, 0.1040356, 2.000735, 0, 0, 0, 1, 1,
1.897647, -0.0791434, 1.316958, 0, 0, 0, 1, 1,
1.918372, 1.501371, 0.2662507, 0, 0, 0, 1, 1,
1.922567, -1.36293, 3.028032, 0, 0, 0, 1, 1,
1.935902, 0.2942445, 1.99267, 0, 0, 0, 1, 1,
1.952267, -1.064497, 1.762261, 1, 1, 1, 1, 1,
1.964397, 0.5403246, 0.6366773, 1, 1, 1, 1, 1,
1.966213, -0.8461067, 2.028058, 1, 1, 1, 1, 1,
1.974704, 1.559791, 1.591258, 1, 1, 1, 1, 1,
1.98362, 0.538034, 1.185242, 1, 1, 1, 1, 1,
1.985957, -1.491744, 3.064644, 1, 1, 1, 1, 1,
1.989667, 0.8733038, 2.043749, 1, 1, 1, 1, 1,
2.015759, -0.6711117, 0.8628851, 1, 1, 1, 1, 1,
2.026113, 0.8492421, 2.532879, 1, 1, 1, 1, 1,
2.06489, 0.3757989, 0.8848974, 1, 1, 1, 1, 1,
2.078936, 1.449536, 1.334673, 1, 1, 1, 1, 1,
2.108493, -1.645804, 1.673944, 1, 1, 1, 1, 1,
2.115997, -0.6061269, 2.475783, 1, 1, 1, 1, 1,
2.136931, -1.211829, 3.146524, 1, 1, 1, 1, 1,
2.159199, -1.66602, 1.05273, 1, 1, 1, 1, 1,
2.16479, -1.653939, 1.263854, 0, 0, 1, 1, 1,
2.167251, -0.23779, 2.860013, 1, 0, 0, 1, 1,
2.172463, 0.5128622, 1.95397, 1, 0, 0, 1, 1,
2.179476, 0.6016496, 2.268026, 1, 0, 0, 1, 1,
2.21835, -0.3950607, 2.115739, 1, 0, 0, 1, 1,
2.261464, 0.6753765, 0.1257059, 1, 0, 0, 1, 1,
2.343305, 1.798882, 0.6998591, 0, 0, 0, 1, 1,
2.354524, -1.10192, 1.137555, 0, 0, 0, 1, 1,
2.356481, 0.416941, 0.7871112, 0, 0, 0, 1, 1,
2.485709, -0.0489191, 0.7952735, 0, 0, 0, 1, 1,
2.496295, -0.2546445, 3.746617, 0, 0, 0, 1, 1,
2.505685, 2.204824, 0.4023231, 0, 0, 0, 1, 1,
2.570042, 1.240583, 1.135811, 0, 0, 0, 1, 1,
2.663922, -0.1431678, 2.516109, 1, 1, 1, 1, 1,
2.679261, -0.07588276, 0.5299427, 1, 1, 1, 1, 1,
2.7286, 0.5088284, 3.279274, 1, 1, 1, 1, 1,
2.76536, 0.4685482, 3.451768, 1, 1, 1, 1, 1,
2.827609, 1.356773, 0.3351849, 1, 1, 1, 1, 1,
2.859898, 0.301997, 2.408363, 1, 1, 1, 1, 1,
2.920867, -2.323221, 0.7397287, 1, 1, 1, 1, 1
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
var radius = 9.449526;
var distance = 33.19106;
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
mvMatrix.translate( 0.3733433, -0.005207896, 0.09486365 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.19106);
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
