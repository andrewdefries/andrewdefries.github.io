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
-2.987783, -0.5703678, -2.536712, 1, 0, 0, 1,
-2.909219, -0.07784317, 0.6451421, 1, 0.007843138, 0, 1,
-2.839187, -0.2876269, -1.538384, 1, 0.01176471, 0, 1,
-2.833838, 0.3664449, -1.26077, 1, 0.01960784, 0, 1,
-2.778821, -1.287831, -2.99827, 1, 0.02352941, 0, 1,
-2.754246, -0.3425947, -0.6424534, 1, 0.03137255, 0, 1,
-2.739432, 0.5653512, -1.08461, 1, 0.03529412, 0, 1,
-2.7067, 0.9812309, -2.105685, 1, 0.04313726, 0, 1,
-2.671536, 0.07171573, -0.5819798, 1, 0.04705882, 0, 1,
-2.566937, 1.056332, -2.202087, 1, 0.05490196, 0, 1,
-2.521682, 1.15459, -0.4044083, 1, 0.05882353, 0, 1,
-2.424563, 0.7128408, -3.403131, 1, 0.06666667, 0, 1,
-2.32834, -1.009135, -2.61567, 1, 0.07058824, 0, 1,
-2.263894, -0.2185203, -0.8803782, 1, 0.07843138, 0, 1,
-2.155183, 0.1100913, -1.539055, 1, 0.08235294, 0, 1,
-2.154698, -0.4645703, -0.8288937, 1, 0.09019608, 0, 1,
-2.145772, 2.14749, -2.113996, 1, 0.09411765, 0, 1,
-2.141497, -0.03101495, -0.5102382, 1, 0.1019608, 0, 1,
-2.141367, -0.2581943, -1.330703, 1, 0.1098039, 0, 1,
-2.137364, 0.9695797, -0.4201583, 1, 0.1137255, 0, 1,
-2.125446, 0.2750378, -0.02264568, 1, 0.1215686, 0, 1,
-2.066354, -0.4593281, -1.733381, 1, 0.1254902, 0, 1,
-2.04761, 0.2817363, -3.021538, 1, 0.1333333, 0, 1,
-2.032243, -0.8438159, -0.3870538, 1, 0.1372549, 0, 1,
-2.023368, 1.053743, -0.2216973, 1, 0.145098, 0, 1,
-1.942634, 0.3040499, -0.1183734, 1, 0.1490196, 0, 1,
-1.911213, -0.2652179, -2.784154, 1, 0.1568628, 0, 1,
-1.867458, -2.123296, -2.834541, 1, 0.1607843, 0, 1,
-1.861034, -0.7063425, -2.425295, 1, 0.1686275, 0, 1,
-1.860594, -0.06938287, -2.451604, 1, 0.172549, 0, 1,
-1.849599, 0.227853, -0.5097907, 1, 0.1803922, 0, 1,
-1.847773, 0.2510815, 0.5862207, 1, 0.1843137, 0, 1,
-1.838481, -1.074819, -1.461991, 1, 0.1921569, 0, 1,
-1.832928, -1.898307, -2.6773, 1, 0.1960784, 0, 1,
-1.816429, 0.4036559, -0.09969064, 1, 0.2039216, 0, 1,
-1.815365, 0.05453873, 0.01520136, 1, 0.2117647, 0, 1,
-1.792301, -0.3953102, 0.01652847, 1, 0.2156863, 0, 1,
-1.781944, 0.9468704, -0.2799354, 1, 0.2235294, 0, 1,
-1.778784, 1.516937, 0.6611337, 1, 0.227451, 0, 1,
-1.756681, 0.3777673, 0.3101937, 1, 0.2352941, 0, 1,
-1.755799, -0.4354692, -1.078421, 1, 0.2392157, 0, 1,
-1.745291, -1.094632, -1.809247, 1, 0.2470588, 0, 1,
-1.744888, 0.1160543, -1.534907, 1, 0.2509804, 0, 1,
-1.732895, -0.8665466, -2.688691, 1, 0.2588235, 0, 1,
-1.728633, 0.6957073, -2.817798, 1, 0.2627451, 0, 1,
-1.725487, 1.545803, -1.907492, 1, 0.2705882, 0, 1,
-1.719477, -0.1221397, -1.117044, 1, 0.2745098, 0, 1,
-1.714009, -0.8878104, -2.04527, 1, 0.282353, 0, 1,
-1.7113, -0.2053916, -1.501938, 1, 0.2862745, 0, 1,
-1.695906, 0.8910065, 0.6124277, 1, 0.2941177, 0, 1,
-1.685993, -1.245283, -1.846854, 1, 0.3019608, 0, 1,
-1.675252, -0.6887012, -1.998638, 1, 0.3058824, 0, 1,
-1.645613, 0.2770757, -2.930622, 1, 0.3137255, 0, 1,
-1.640905, -1.256135, -0.7988046, 1, 0.3176471, 0, 1,
-1.634296, 1.151057, 1.483457, 1, 0.3254902, 0, 1,
-1.630561, 1.334546, -0.0111625, 1, 0.3294118, 0, 1,
-1.617992, -0.2894452, -0.7464204, 1, 0.3372549, 0, 1,
-1.6141, -0.4176098, -1.36711, 1, 0.3411765, 0, 1,
-1.608484, 0.09587934, -2.704135, 1, 0.3490196, 0, 1,
-1.604566, 0.04100375, -2.124128, 1, 0.3529412, 0, 1,
-1.602126, 1.16545, 1.06499, 1, 0.3607843, 0, 1,
-1.600032, -1.055941, -2.055515, 1, 0.3647059, 0, 1,
-1.567077, 1.924875, -0.9534707, 1, 0.372549, 0, 1,
-1.56313, 1.253483, -2.404812, 1, 0.3764706, 0, 1,
-1.55538, -0.7753153, -2.802474, 1, 0.3843137, 0, 1,
-1.506508, 0.6820773, -1.076627, 1, 0.3882353, 0, 1,
-1.49917, -0.1811029, -0.8488058, 1, 0.3960784, 0, 1,
-1.498856, 0.6660917, -0.8738791, 1, 0.4039216, 0, 1,
-1.49456, -0.2991774, -1.451464, 1, 0.4078431, 0, 1,
-1.494164, -0.9644307, -2.079295, 1, 0.4156863, 0, 1,
-1.485474, -0.6121887, -1.531475, 1, 0.4196078, 0, 1,
-1.475519, -0.3952263, -1.016217, 1, 0.427451, 0, 1,
-1.474962, 0.5335219, 0.07386174, 1, 0.4313726, 0, 1,
-1.463791, 0.4494755, 0.458299, 1, 0.4392157, 0, 1,
-1.46028, -1.815644, -3.06478, 1, 0.4431373, 0, 1,
-1.459393, -0.5811016, -0.3113261, 1, 0.4509804, 0, 1,
-1.45061, -0.2378643, -1.723834, 1, 0.454902, 0, 1,
-1.436735, 1.207927, 0.6567194, 1, 0.4627451, 0, 1,
-1.436173, -0.01786981, -1.088586, 1, 0.4666667, 0, 1,
-1.425485, -1.03192, -1.903886, 1, 0.4745098, 0, 1,
-1.422252, 1.902091, -1.371199, 1, 0.4784314, 0, 1,
-1.409958, -0.2272138, -3.699275, 1, 0.4862745, 0, 1,
-1.40549, -0.3076128, -0.4301434, 1, 0.4901961, 0, 1,
-1.402558, 1.944543, 1.019768, 1, 0.4980392, 0, 1,
-1.388836, -1.885652, -0.5504587, 1, 0.5058824, 0, 1,
-1.384011, 1.302991, -2.365676, 1, 0.509804, 0, 1,
-1.379422, 0.7045303, -1.269352, 1, 0.5176471, 0, 1,
-1.376169, 0.8392947, -2.384631, 1, 0.5215687, 0, 1,
-1.375347, 0.6082663, -1.471211, 1, 0.5294118, 0, 1,
-1.368009, 0.7598392, -2.165729, 1, 0.5333334, 0, 1,
-1.366162, 0.6901595, -0.09587291, 1, 0.5411765, 0, 1,
-1.366051, 1.236432, 0.7398698, 1, 0.5450981, 0, 1,
-1.365594, 0.1094673, -0.8037518, 1, 0.5529412, 0, 1,
-1.354636, -0.1250714, -0.9251176, 1, 0.5568628, 0, 1,
-1.35024, -0.3711294, -1.826667, 1, 0.5647059, 0, 1,
-1.337593, -0.2889731, -3.499695, 1, 0.5686275, 0, 1,
-1.334705, -0.7669693, -0.6258319, 1, 0.5764706, 0, 1,
-1.332118, -1.304886, -2.246836, 1, 0.5803922, 0, 1,
-1.318854, 0.7659315, -1.375684, 1, 0.5882353, 0, 1,
-1.317699, 1.004984, -1.51995, 1, 0.5921569, 0, 1,
-1.310274, -0.005777206, -1.653347, 1, 0.6, 0, 1,
-1.310227, 1.413529, -2.074892, 1, 0.6078432, 0, 1,
-1.309406, -0.164985, -1.834221, 1, 0.6117647, 0, 1,
-1.305512, -0.06298152, -2.064922, 1, 0.6196079, 0, 1,
-1.302617, -1.139933, -3.333599, 1, 0.6235294, 0, 1,
-1.297219, -1.465711, -4.317298, 1, 0.6313726, 0, 1,
-1.284798, 2.179849, 0.4617714, 1, 0.6352941, 0, 1,
-1.269652, 1.424315, 0.4277751, 1, 0.6431373, 0, 1,
-1.265108, 0.8390812, -1.903707, 1, 0.6470588, 0, 1,
-1.263625, 0.3721813, -0.4646031, 1, 0.654902, 0, 1,
-1.258744, -0.08664834, -3.344154, 1, 0.6588235, 0, 1,
-1.249975, -0.7381006, -1.813913, 1, 0.6666667, 0, 1,
-1.245019, -0.1299691, -2.656883, 1, 0.6705883, 0, 1,
-1.236442, -0.6583969, -2.625256, 1, 0.6784314, 0, 1,
-1.223781, -0.4737663, -2.727978, 1, 0.682353, 0, 1,
-1.221578, -0.1908721, -2.845147, 1, 0.6901961, 0, 1,
-1.217949, -1.171047, -1.507422, 1, 0.6941177, 0, 1,
-1.213121, -0.7248947, -2.051551, 1, 0.7019608, 0, 1,
-1.202831, -0.2388707, -2.205677, 1, 0.7098039, 0, 1,
-1.198004, -2.236311, -2.17461, 1, 0.7137255, 0, 1,
-1.192862, 0.4551381, 0.178194, 1, 0.7215686, 0, 1,
-1.192265, 0.1374716, -1.39315, 1, 0.7254902, 0, 1,
-1.186177, -1.544736, -2.437243, 1, 0.7333333, 0, 1,
-1.18564, 1.333444, -1.920251, 1, 0.7372549, 0, 1,
-1.164175, -0.300976, -1.190769, 1, 0.7450981, 0, 1,
-1.158154, 0.03817024, -0.160652, 1, 0.7490196, 0, 1,
-1.157509, -1.758573, -1.462268, 1, 0.7568628, 0, 1,
-1.15619, 1.788151, -1.453804, 1, 0.7607843, 0, 1,
-1.153762, 0.4277824, -0.1818785, 1, 0.7686275, 0, 1,
-1.152113, 0.1358226, -1.670223, 1, 0.772549, 0, 1,
-1.148565, -0.5932469, -2.549062, 1, 0.7803922, 0, 1,
-1.146221, -0.5193475, -2.235377, 1, 0.7843137, 0, 1,
-1.128646, 0.7767966, -1.057784, 1, 0.7921569, 0, 1,
-1.124589, -0.8332203, -3.337252, 1, 0.7960784, 0, 1,
-1.121593, 0.05408848, -3.091249, 1, 0.8039216, 0, 1,
-1.119373, -1.736735, -2.249273, 1, 0.8117647, 0, 1,
-1.113524, -0.05438691, -2.163072, 1, 0.8156863, 0, 1,
-1.112417, 0.9075021, -0.5352038, 1, 0.8235294, 0, 1,
-1.097446, 0.3583552, -0.2139437, 1, 0.827451, 0, 1,
-1.09295, -0.6583973, -4.331619, 1, 0.8352941, 0, 1,
-1.089858, -0.449874, -1.962266, 1, 0.8392157, 0, 1,
-1.079305, -1.265274, -1.860469, 1, 0.8470588, 0, 1,
-1.077571, -1.400047, -2.576456, 1, 0.8509804, 0, 1,
-1.075137, -1.16588, -3.703025, 1, 0.8588235, 0, 1,
-1.069741, 0.3792771, -0.2499589, 1, 0.8627451, 0, 1,
-1.067025, -0.3240052, -0.9151641, 1, 0.8705882, 0, 1,
-1.062465, -0.7678236, -2.994974, 1, 0.8745098, 0, 1,
-1.060757, -1.254075, -2.986621, 1, 0.8823529, 0, 1,
-1.058822, -0.7548019, -1.316026, 1, 0.8862745, 0, 1,
-1.057086, 1.691793, -0.9614069, 1, 0.8941177, 0, 1,
-1.056416, 0.2412255, -0.6404219, 1, 0.8980392, 0, 1,
-1.054297, 0.4846429, -2.168015, 1, 0.9058824, 0, 1,
-1.047519, 0.4899662, -1.027752, 1, 0.9137255, 0, 1,
-1.046932, -0.4132586, -2.069607, 1, 0.9176471, 0, 1,
-1.045996, 0.4036388, -1.894931, 1, 0.9254902, 0, 1,
-1.04208, 1.736512, 0.7338256, 1, 0.9294118, 0, 1,
-1.036413, 0.3081159, -1.764967, 1, 0.9372549, 0, 1,
-1.020273, -1.912359, -4.230728, 1, 0.9411765, 0, 1,
-1.01277, 0.2321433, -2.912683, 1, 0.9490196, 0, 1,
-1.010531, 2.849706, -0.7938884, 1, 0.9529412, 0, 1,
-1.007395, -0.4137771, -2.884524, 1, 0.9607843, 0, 1,
-0.9990372, -1.677049, -2.42557, 1, 0.9647059, 0, 1,
-0.9984846, -0.7889533, -1.046616, 1, 0.972549, 0, 1,
-0.9946583, 1.388513, -2.477216, 1, 0.9764706, 0, 1,
-0.994189, 0.8370254, -0.354623, 1, 0.9843137, 0, 1,
-0.9877416, 1.115566, -0.8115578, 1, 0.9882353, 0, 1,
-0.9815718, 0.1220303, -1.943272, 1, 0.9960784, 0, 1,
-0.9788787, 0.6552203, -1.347556, 0.9960784, 1, 0, 1,
-0.9767649, -1.596164, -2.54012, 0.9921569, 1, 0, 1,
-0.9704313, 0.6499003, -0.7155299, 0.9843137, 1, 0, 1,
-0.9671533, 0.1249489, -2.044395, 0.9803922, 1, 0, 1,
-0.9671199, -0.9584734, -1.799671, 0.972549, 1, 0, 1,
-0.9666047, -0.4032576, -2.687697, 0.9686275, 1, 0, 1,
-0.9650061, -0.8867731, -2.990968, 0.9607843, 1, 0, 1,
-0.9628398, 1.164411, -0.8110662, 0.9568627, 1, 0, 1,
-0.9613603, 0.08222625, -0.8250647, 0.9490196, 1, 0, 1,
-0.9526278, -1.184121, -2.724931, 0.945098, 1, 0, 1,
-0.9516833, -1.53881, -1.45387, 0.9372549, 1, 0, 1,
-0.9488468, 0.08844253, 0.317105, 0.9333333, 1, 0, 1,
-0.9376492, -1.092329, -1.716933, 0.9254902, 1, 0, 1,
-0.9310893, -0.9839997, -2.245032, 0.9215686, 1, 0, 1,
-0.9302166, -0.3120613, -3.244516, 0.9137255, 1, 0, 1,
-0.9291255, -1.145877, -2.189829, 0.9098039, 1, 0, 1,
-0.9263653, -0.9230853, 0.7208831, 0.9019608, 1, 0, 1,
-0.9247348, -0.7161512, -2.935209, 0.8941177, 1, 0, 1,
-0.9212667, 0.3592825, -1.297501, 0.8901961, 1, 0, 1,
-0.9212257, 0.6762751, -0.2154218, 0.8823529, 1, 0, 1,
-0.9154339, 0.9002084, -0.9422741, 0.8784314, 1, 0, 1,
-0.9081253, 0.5759108, -3.761605, 0.8705882, 1, 0, 1,
-0.9003126, 1.130445, -0.9647202, 0.8666667, 1, 0, 1,
-0.8996878, -0.1546331, -1.010255, 0.8588235, 1, 0, 1,
-0.8827037, 0.0744205, -1.980983, 0.854902, 1, 0, 1,
-0.8743841, -0.7595701, -2.18895, 0.8470588, 1, 0, 1,
-0.8723037, 1.144976, -0.9489793, 0.8431373, 1, 0, 1,
-0.8716321, 1.252627, -0.8372125, 0.8352941, 1, 0, 1,
-0.8697042, 0.9754211, -1.288574, 0.8313726, 1, 0, 1,
-0.8672855, -0.2968639, -1.184197, 0.8235294, 1, 0, 1,
-0.8668155, 1.067131, 0.5629529, 0.8196079, 1, 0, 1,
-0.8659819, -0.5209697, -3.395106, 0.8117647, 1, 0, 1,
-0.8638507, 0.5637338, -1.825882, 0.8078431, 1, 0, 1,
-0.8581145, -1.761745, -3.714953, 0.8, 1, 0, 1,
-0.854086, 0.7709971, -0.01201347, 0.7921569, 1, 0, 1,
-0.8531648, 1.53607, 0.3452795, 0.7882353, 1, 0, 1,
-0.8496549, 1.08751, -0.8874961, 0.7803922, 1, 0, 1,
-0.8477776, 0.3880699, -1.689682, 0.7764706, 1, 0, 1,
-0.8464314, -1.693675, -3.213036, 0.7686275, 1, 0, 1,
-0.8461559, -1.840398, -4.257582, 0.7647059, 1, 0, 1,
-0.8437739, 1.084864, -0.06965499, 0.7568628, 1, 0, 1,
-0.8375435, 0.08424024, -2.274138, 0.7529412, 1, 0, 1,
-0.8373144, -0.01195342, 0.2894052, 0.7450981, 1, 0, 1,
-0.8361015, 0.1212813, -0.7968175, 0.7411765, 1, 0, 1,
-0.8331236, 0.05313953, -1.62946, 0.7333333, 1, 0, 1,
-0.8331124, -0.3691381, -0.06809928, 0.7294118, 1, 0, 1,
-0.8251575, 0.9385556, 0.691982, 0.7215686, 1, 0, 1,
-0.8245161, -0.6771949, -1.477513, 0.7176471, 1, 0, 1,
-0.8178178, 0.1113986, -2.620322, 0.7098039, 1, 0, 1,
-0.8158491, 1.553816, -0.1564853, 0.7058824, 1, 0, 1,
-0.8124346, 0.4516945, -0.9760346, 0.6980392, 1, 0, 1,
-0.8116369, 0.6498793, -0.5847113, 0.6901961, 1, 0, 1,
-0.8105202, -2.131089, -2.601373, 0.6862745, 1, 0, 1,
-0.8058845, 0.3191261, -1.86666, 0.6784314, 1, 0, 1,
-0.7915474, 1.036656, -0.6468639, 0.6745098, 1, 0, 1,
-0.7907421, 0.2794848, -0.7413568, 0.6666667, 1, 0, 1,
-0.7813275, -0.6269871, -1.883117, 0.6627451, 1, 0, 1,
-0.780852, -0.03032044, -1.668202, 0.654902, 1, 0, 1,
-0.779784, 0.605188, -0.6791126, 0.6509804, 1, 0, 1,
-0.7778376, 0.6641127, -0.4603822, 0.6431373, 1, 0, 1,
-0.7769937, -0.665131, -2.863727, 0.6392157, 1, 0, 1,
-0.7714723, 2.031484, 0.3548847, 0.6313726, 1, 0, 1,
-0.7713417, 0.1701038, -2.090601, 0.627451, 1, 0, 1,
-0.7683317, 0.4042535, -1.942739, 0.6196079, 1, 0, 1,
-0.7681722, 0.9944001, 0.6997483, 0.6156863, 1, 0, 1,
-0.7671773, 0.822854, -0.8813409, 0.6078432, 1, 0, 1,
-0.7665336, -0.3341798, -2.658535, 0.6039216, 1, 0, 1,
-0.7614002, 0.1446983, -0.8237356, 0.5960785, 1, 0, 1,
-0.7593189, -0.4268799, -3.204627, 0.5882353, 1, 0, 1,
-0.7537434, 1.639223, -1.241439, 0.5843138, 1, 0, 1,
-0.728501, 0.4743721, -0.9573654, 0.5764706, 1, 0, 1,
-0.7221053, -0.5559468, -5.217743, 0.572549, 1, 0, 1,
-0.7204152, 1.59212, -1.094783, 0.5647059, 1, 0, 1,
-0.7202368, -0.1010424, -0.8604107, 0.5607843, 1, 0, 1,
-0.7191983, -1.250691, -2.171685, 0.5529412, 1, 0, 1,
-0.714939, -1.363932, -0.8755389, 0.5490196, 1, 0, 1,
-0.7108585, -1.980514, -1.800188, 0.5411765, 1, 0, 1,
-0.7104467, -0.3742244, -3.746696, 0.5372549, 1, 0, 1,
-0.7071655, 0.7902998, -0.6944883, 0.5294118, 1, 0, 1,
-0.7048613, 0.6607068, -0.8955485, 0.5254902, 1, 0, 1,
-0.7042948, 0.3647751, -1.86262, 0.5176471, 1, 0, 1,
-0.7021794, 1.104306, 0.6083508, 0.5137255, 1, 0, 1,
-0.7004067, -0.8871772, -0.7586797, 0.5058824, 1, 0, 1,
-0.6991763, 0.7377383, -1.02071, 0.5019608, 1, 0, 1,
-0.698217, -0.08778918, -0.4852335, 0.4941176, 1, 0, 1,
-0.6978502, -0.6155058, -1.647366, 0.4862745, 1, 0, 1,
-0.6945893, 0.4179647, -0.4932386, 0.4823529, 1, 0, 1,
-0.689833, 1.132023, -0.463048, 0.4745098, 1, 0, 1,
-0.6814487, -0.1029721, -2.331362, 0.4705882, 1, 0, 1,
-0.6799983, -0.6589977, -1.370845, 0.4627451, 1, 0, 1,
-0.6727044, 1.5092, -0.7073901, 0.4588235, 1, 0, 1,
-0.6697738, 0.976438, 0.4254895, 0.4509804, 1, 0, 1,
-0.6627008, -0.2650546, -1.113757, 0.4470588, 1, 0, 1,
-0.6477152, -1.064277, -2.549369, 0.4392157, 1, 0, 1,
-0.6463513, -0.1223606, -2.220243, 0.4352941, 1, 0, 1,
-0.6402577, -0.5990572, -2.472995, 0.427451, 1, 0, 1,
-0.6337863, -1.775306, -1.031645, 0.4235294, 1, 0, 1,
-0.6333163, -1.195164, -3.02109, 0.4156863, 1, 0, 1,
-0.6297705, -1.052534, -3.717804, 0.4117647, 1, 0, 1,
-0.6242837, 1.141557, -1.225702, 0.4039216, 1, 0, 1,
-0.6229073, 0.07501379, 0.7845238, 0.3960784, 1, 0, 1,
-0.620824, -1.669737, -2.717299, 0.3921569, 1, 0, 1,
-0.6130459, 2.103503, -0.9802169, 0.3843137, 1, 0, 1,
-0.6065647, 1.015229, -2.813099, 0.3803922, 1, 0, 1,
-0.6034063, -0.2732936, -3.110972, 0.372549, 1, 0, 1,
-0.601849, -0.1218325, -0.5190663, 0.3686275, 1, 0, 1,
-0.6000333, -0.7082399, -2.272882, 0.3607843, 1, 0, 1,
-0.5971097, -0.6201779, -2.504191, 0.3568628, 1, 0, 1,
-0.5947594, 2.120986, 1.769849, 0.3490196, 1, 0, 1,
-0.5942754, 0.1679935, -0.9952083, 0.345098, 1, 0, 1,
-0.5937961, 0.8804423, -0.2242902, 0.3372549, 1, 0, 1,
-0.5850853, -2.50157, -4.837847, 0.3333333, 1, 0, 1,
-0.5850133, -0.5988832, -2.704663, 0.3254902, 1, 0, 1,
-0.5822981, 1.068988, 0.4954014, 0.3215686, 1, 0, 1,
-0.5800616, 0.06271767, -1.716324, 0.3137255, 1, 0, 1,
-0.5776861, 1.176867, -0.8001811, 0.3098039, 1, 0, 1,
-0.5748881, -0.4981823, -3.065526, 0.3019608, 1, 0, 1,
-0.5662013, 0.2335851, -1.467251, 0.2941177, 1, 0, 1,
-0.5583679, 1.555568, -1.715895, 0.2901961, 1, 0, 1,
-0.5573108, 0.9358675, 0.1880038, 0.282353, 1, 0, 1,
-0.5536892, 1.295265, -2.585281, 0.2784314, 1, 0, 1,
-0.5536826, -0.720867, -2.617241, 0.2705882, 1, 0, 1,
-0.5524563, -0.5569794, -1.518349, 0.2666667, 1, 0, 1,
-0.550786, 0.5926183, -1.311902, 0.2588235, 1, 0, 1,
-0.5481918, 0.1671269, -0.7456885, 0.254902, 1, 0, 1,
-0.5450151, 0.1529276, -0.261876, 0.2470588, 1, 0, 1,
-0.544601, 0.8554127, -3.283476, 0.2431373, 1, 0, 1,
-0.5407102, -0.129763, -1.60535, 0.2352941, 1, 0, 1,
-0.5401334, -1.642906, -2.232601, 0.2313726, 1, 0, 1,
-0.5354632, -0.04764112, -1.276775, 0.2235294, 1, 0, 1,
-0.5299813, 0.400867, -1.99645, 0.2196078, 1, 0, 1,
-0.5297385, -0.07170848, -2.353358, 0.2117647, 1, 0, 1,
-0.5289863, -0.1344156, -0.8263859, 0.2078431, 1, 0, 1,
-0.5286546, -0.4881205, -1.034632, 0.2, 1, 0, 1,
-0.5263668, 0.2553667, -1.495699, 0.1921569, 1, 0, 1,
-0.5234236, 1.287736, -2.171645, 0.1882353, 1, 0, 1,
-0.5219137, 0.2092646, 1.890595, 0.1803922, 1, 0, 1,
-0.5193319, 1.654616, -0.8453901, 0.1764706, 1, 0, 1,
-0.5162593, 0.8837376, 1.056476, 0.1686275, 1, 0, 1,
-0.5044957, 1.102438, -0.6244754, 0.1647059, 1, 0, 1,
-0.4977283, 2.724777, -0.7724977, 0.1568628, 1, 0, 1,
-0.495919, -1.031878, -2.225883, 0.1529412, 1, 0, 1,
-0.4936693, -0.815432, -2.021408, 0.145098, 1, 0, 1,
-0.4927914, 0.3472739, -2.067006, 0.1411765, 1, 0, 1,
-0.4915775, 0.7392935, -0.4716183, 0.1333333, 1, 0, 1,
-0.4885956, 2.083225, -0.1501596, 0.1294118, 1, 0, 1,
-0.487325, 1.362631, 0.1652644, 0.1215686, 1, 0, 1,
-0.4857778, -0.1238529, -2.581037, 0.1176471, 1, 0, 1,
-0.4814122, 0.141937, -3.500277, 0.1098039, 1, 0, 1,
-0.4782658, 0.9125654, -1.0604, 0.1058824, 1, 0, 1,
-0.477172, 0.01186876, -2.346121, 0.09803922, 1, 0, 1,
-0.4731446, -0.2463003, -0.8742455, 0.09019608, 1, 0, 1,
-0.469045, -0.85405, -4.836244, 0.08627451, 1, 0, 1,
-0.4679324, 0.5956707, -1.692261, 0.07843138, 1, 0, 1,
-0.4677938, 0.06076295, -1.44892, 0.07450981, 1, 0, 1,
-0.4669963, 0.4374698, 0.2719235, 0.06666667, 1, 0, 1,
-0.4654781, -0.6422539, -3.493447, 0.0627451, 1, 0, 1,
-0.4633786, 1.311227, -1.336824, 0.05490196, 1, 0, 1,
-0.4616371, 2.072422, -0.1786435, 0.05098039, 1, 0, 1,
-0.4571863, 0.3463454, -1.367403, 0.04313726, 1, 0, 1,
-0.4556666, 1.467937, -1.704786, 0.03921569, 1, 0, 1,
-0.4548019, -1.348521, -2.354818, 0.03137255, 1, 0, 1,
-0.4547643, -0.6021304, -4.958157, 0.02745098, 1, 0, 1,
-0.4529617, -0.284326, -0.9594374, 0.01960784, 1, 0, 1,
-0.4526758, 0.701195, 0.7149549, 0.01568628, 1, 0, 1,
-0.452328, 0.3407436, -1.495269, 0.007843138, 1, 0, 1,
-0.4492354, -0.4878167, -2.769604, 0.003921569, 1, 0, 1,
-0.4415175, 2.099308, -2.114279, 0, 1, 0.003921569, 1,
-0.4382477, -0.8836141, -2.122317, 0, 1, 0.01176471, 1,
-0.437508, -0.5448956, -2.118537, 0, 1, 0.01568628, 1,
-0.4372285, -1.132271, -1.20685, 0, 1, 0.02352941, 1,
-0.435765, -1.855055, -3.530819, 0, 1, 0.02745098, 1,
-0.4350909, 0.5641001, -3.301194, 0, 1, 0.03529412, 1,
-0.4311614, 1.06479, -0.8255937, 0, 1, 0.03921569, 1,
-0.4278853, 0.8010172, 0.3457054, 0, 1, 0.04705882, 1,
-0.42567, -0.2608091, -1.145013, 0, 1, 0.05098039, 1,
-0.4204289, 0.2609085, -2.793389, 0, 1, 0.05882353, 1,
-0.4170383, -0.3398783, -2.167696, 0, 1, 0.0627451, 1,
-0.4145309, 1.008891, 0.4814289, 0, 1, 0.07058824, 1,
-0.4118616, 0.4750366, 0.7728953, 0, 1, 0.07450981, 1,
-0.4110456, 0.984434, 2.854439, 0, 1, 0.08235294, 1,
-0.4096774, 1.000885, -0.7641493, 0, 1, 0.08627451, 1,
-0.4012157, 0.8665346, -0.786777, 0, 1, 0.09411765, 1,
-0.4005699, 1.418321, -0.5730811, 0, 1, 0.1019608, 1,
-0.3973847, 1.477922, 1.109036, 0, 1, 0.1058824, 1,
-0.3890274, 0.4145704, -1.758291, 0, 1, 0.1137255, 1,
-0.3884252, 0.1658144, 0.1945037, 0, 1, 0.1176471, 1,
-0.3876685, 0.4933518, -0.8147902, 0, 1, 0.1254902, 1,
-0.3843377, 1.073476, -1.372274, 0, 1, 0.1294118, 1,
-0.3842762, 0.7875021, -0.4276041, 0, 1, 0.1372549, 1,
-0.3791272, -0.03929283, -3.999472, 0, 1, 0.1411765, 1,
-0.3789076, -0.6439136, -4.255484, 0, 1, 0.1490196, 1,
-0.3743604, -1.24923, -3.655089, 0, 1, 0.1529412, 1,
-0.3742863, 1.049352, -0.7012705, 0, 1, 0.1607843, 1,
-0.3715788, -1.338382, -1.728676, 0, 1, 0.1647059, 1,
-0.353383, 0.8734598, -0.7167089, 0, 1, 0.172549, 1,
-0.3531933, -0.2484218, -2.428948, 0, 1, 0.1764706, 1,
-0.3529874, -0.7316234, -1.436474, 0, 1, 0.1843137, 1,
-0.34756, -0.3005013, -2.248629, 0, 1, 0.1882353, 1,
-0.3464216, -0.1895258, -0.4542022, 0, 1, 0.1960784, 1,
-0.3445413, 1.133532, 0.08134872, 0, 1, 0.2039216, 1,
-0.3417982, -0.1010872, -1.575181, 0, 1, 0.2078431, 1,
-0.3291811, 1.18404, -2.603986, 0, 1, 0.2156863, 1,
-0.3272737, 1.102484, -0.7853414, 0, 1, 0.2196078, 1,
-0.3243519, -1.081589, -1.6825, 0, 1, 0.227451, 1,
-0.3238878, 0.04664407, -3.2196, 0, 1, 0.2313726, 1,
-0.3238146, -0.1265858, -4.17754, 0, 1, 0.2392157, 1,
-0.3195349, 0.6558695, -1.318423, 0, 1, 0.2431373, 1,
-0.3186346, 2.398327, 1.198171, 0, 1, 0.2509804, 1,
-0.3170348, -0.8637387, -2.897488, 0, 1, 0.254902, 1,
-0.3162634, 0.7246801, -1.381258, 0, 1, 0.2627451, 1,
-0.3140253, 0.09093681, -1.63102, 0, 1, 0.2666667, 1,
-0.3091051, -0.00394361, -0.8933266, 0, 1, 0.2745098, 1,
-0.3084654, -0.1417603, -2.471394, 0, 1, 0.2784314, 1,
-0.306751, -2.050789, -1.866709, 0, 1, 0.2862745, 1,
-0.3047385, -0.01015342, -2.455314, 0, 1, 0.2901961, 1,
-0.2996264, -1.433596, -2.035624, 0, 1, 0.2980392, 1,
-0.2975223, 1.083971, -1.425217, 0, 1, 0.3058824, 1,
-0.2946557, -1.127978, -3.876363, 0, 1, 0.3098039, 1,
-0.2926849, 1.325482, -1.448696, 0, 1, 0.3176471, 1,
-0.2917024, -0.5276339, -3.834909, 0, 1, 0.3215686, 1,
-0.286227, 0.6803499, -0.3692546, 0, 1, 0.3294118, 1,
-0.2782312, -1.885721, -1.940002, 0, 1, 0.3333333, 1,
-0.2747819, -0.6713554, -3.037957, 0, 1, 0.3411765, 1,
-0.2721974, -0.3512231, -0.8622622, 0, 1, 0.345098, 1,
-0.2697101, 0.5732478, -1.753449, 0, 1, 0.3529412, 1,
-0.264039, -1.172298, -2.434563, 0, 1, 0.3568628, 1,
-0.2640058, -0.4473524, -2.085291, 0, 1, 0.3647059, 1,
-0.2594997, -0.4823228, -2.032954, 0, 1, 0.3686275, 1,
-0.2575616, 0.5755137, 0.06110792, 0, 1, 0.3764706, 1,
-0.2525992, -0.617618, -1.345925, 0, 1, 0.3803922, 1,
-0.2446601, -0.5814571, -2.755205, 0, 1, 0.3882353, 1,
-0.2436804, 0.7830291, 1.003558, 0, 1, 0.3921569, 1,
-0.242559, 0.434177, 1.2291, 0, 1, 0.4, 1,
-0.2366732, -0.4026312, -2.564493, 0, 1, 0.4078431, 1,
-0.2307253, 1.045959, -0.03036199, 0, 1, 0.4117647, 1,
-0.2294434, -0.9196742, -0.6578218, 0, 1, 0.4196078, 1,
-0.2285282, 0.01388965, -2.17136, 0, 1, 0.4235294, 1,
-0.2284891, 1.29773, 1.124015, 0, 1, 0.4313726, 1,
-0.222657, 0.1117944, 0.01441519, 0, 1, 0.4352941, 1,
-0.2219058, -1.25943, -3.191257, 0, 1, 0.4431373, 1,
-0.2204225, -2.078144, -3.296978, 0, 1, 0.4470588, 1,
-0.2196889, -1.125632, -2.409774, 0, 1, 0.454902, 1,
-0.2167753, -1.305735, -3.589532, 0, 1, 0.4588235, 1,
-0.2019119, 1.000273, -1.153182, 0, 1, 0.4666667, 1,
-0.2009585, 0.6009726, 0.7000981, 0, 1, 0.4705882, 1,
-0.1982166, -0.03220264, 0.3886061, 0, 1, 0.4784314, 1,
-0.1959599, -1.76214, -2.720222, 0, 1, 0.4823529, 1,
-0.1951333, -0.2843377, -2.355069, 0, 1, 0.4901961, 1,
-0.1850601, 0.1989946, -2.092557, 0, 1, 0.4941176, 1,
-0.1837286, -0.2612571, -1.63009, 0, 1, 0.5019608, 1,
-0.1768337, 0.4652139, 0.7181219, 0, 1, 0.509804, 1,
-0.1765081, -0.5125813, -2.172698, 0, 1, 0.5137255, 1,
-0.1706976, -0.1401875, -2.702018, 0, 1, 0.5215687, 1,
-0.1678444, 0.2212719, -1.801855, 0, 1, 0.5254902, 1,
-0.165558, 2.074285, -1.570501, 0, 1, 0.5333334, 1,
-0.1649213, 0.7143718, -1.789527, 0, 1, 0.5372549, 1,
-0.1589265, 1.29668, -0.3105622, 0, 1, 0.5450981, 1,
-0.1517498, 0.6564357, -1.211245, 0, 1, 0.5490196, 1,
-0.1511953, -0.2760881, -3.370593, 0, 1, 0.5568628, 1,
-0.1506808, 0.1365741, -1.816907, 0, 1, 0.5607843, 1,
-0.1493554, -1.595792, -4.558322, 0, 1, 0.5686275, 1,
-0.1470473, -0.8832431, -1.294201, 0, 1, 0.572549, 1,
-0.1457526, -0.9316271, -2.279544, 0, 1, 0.5803922, 1,
-0.1451116, 1.757942, 1.265959, 0, 1, 0.5843138, 1,
-0.1439532, -0.2033335, -2.41664, 0, 1, 0.5921569, 1,
-0.1431982, 0.3028686, -0.5847059, 0, 1, 0.5960785, 1,
-0.1427933, 0.4643525, -0.1843082, 0, 1, 0.6039216, 1,
-0.1427192, -0.2509617, -4.16923, 0, 1, 0.6117647, 1,
-0.1357798, 0.4201112, -0.6787431, 0, 1, 0.6156863, 1,
-0.1353835, 1.332038, -0.5687537, 0, 1, 0.6235294, 1,
-0.1344394, 0.4461108, -1.12388, 0, 1, 0.627451, 1,
-0.1338528, 0.4538006, -0.4852751, 0, 1, 0.6352941, 1,
-0.1305865, -0.8078915, -2.494234, 0, 1, 0.6392157, 1,
-0.1298291, -1.23092, -2.491281, 0, 1, 0.6470588, 1,
-0.1286347, 0.03147295, -2.235198, 0, 1, 0.6509804, 1,
-0.126619, 0.4988854, -0.9377955, 0, 1, 0.6588235, 1,
-0.1225569, 0.4671352, -1.255355, 0, 1, 0.6627451, 1,
-0.1213982, 1.073498, -1.511152, 0, 1, 0.6705883, 1,
-0.1205911, 0.1819519, 0.3211896, 0, 1, 0.6745098, 1,
-0.116725, 0.1651585, 1.353502, 0, 1, 0.682353, 1,
-0.1095202, -0.7495339, -3.254797, 0, 1, 0.6862745, 1,
-0.1091457, -0.06369412, -1.712916, 0, 1, 0.6941177, 1,
-0.1009564, -0.150393, -2.822612, 0, 1, 0.7019608, 1,
-0.09632579, 0.2640685, 0.7226993, 0, 1, 0.7058824, 1,
-0.09100169, -0.09325645, -2.132047, 0, 1, 0.7137255, 1,
-0.09070837, -0.205332, -0.2005837, 0, 1, 0.7176471, 1,
-0.09028311, 0.2132112, -0.8693626, 0, 1, 0.7254902, 1,
-0.08551158, -0.2423438, -0.6798435, 0, 1, 0.7294118, 1,
-0.08400696, 0.7789336, 2.679522, 0, 1, 0.7372549, 1,
-0.08209469, -0.9309013, -3.063664, 0, 1, 0.7411765, 1,
-0.07821116, -0.5351038, -2.325867, 0, 1, 0.7490196, 1,
-0.07346196, -0.7552398, -3.591295, 0, 1, 0.7529412, 1,
-0.06400612, 0.4230275, 0.7329577, 0, 1, 0.7607843, 1,
-0.05809466, 0.09207086, -0.403098, 0, 1, 0.7647059, 1,
-0.05779603, 1.635792, -1.855435, 0, 1, 0.772549, 1,
-0.0528441, 1.301467, -0.8683941, 0, 1, 0.7764706, 1,
-0.0522134, -0.5446512, -2.547254, 0, 1, 0.7843137, 1,
-0.04583519, 1.032009, 1.139455, 0, 1, 0.7882353, 1,
-0.04436985, -2.230917, -3.34814, 0, 1, 0.7960784, 1,
-0.0436858, 1.065078, 1.215965, 0, 1, 0.8039216, 1,
-0.04321216, 0.1069957, 0.4025787, 0, 1, 0.8078431, 1,
-0.04176049, -0.5505867, -4.737873, 0, 1, 0.8156863, 1,
-0.03977438, 2.430725, 1.653209, 0, 1, 0.8196079, 1,
-0.0378528, -0.8680992, -4.632351, 0, 1, 0.827451, 1,
-0.03628286, 0.1815059, 0.8027896, 0, 1, 0.8313726, 1,
-0.03584231, 0.385506, 0.8352422, 0, 1, 0.8392157, 1,
-0.03527058, 0.6883928, 0.02461084, 0, 1, 0.8431373, 1,
-0.03482524, -0.4280929, -5.063904, 0, 1, 0.8509804, 1,
-0.03134029, 0.391576, 0.1680519, 0, 1, 0.854902, 1,
-0.02806167, 0.8665832, -0.01323822, 0, 1, 0.8627451, 1,
-0.02628918, -0.1779963, -2.994599, 0, 1, 0.8666667, 1,
-0.02227343, -0.05469145, -0.5133861, 0, 1, 0.8745098, 1,
-0.02187171, 1.335722, -1.058586, 0, 1, 0.8784314, 1,
-0.02162267, 0.2526101, -2.687811, 0, 1, 0.8862745, 1,
-0.02057492, 0.8775286, 0.4142278, 0, 1, 0.8901961, 1,
-0.01843585, 0.9531076, 0.07672567, 0, 1, 0.8980392, 1,
-0.01749806, 0.4953034, 0.136354, 0, 1, 0.9058824, 1,
-0.01396821, -0.1706598, -4.38406, 0, 1, 0.9098039, 1,
-0.007771851, 0.3822958, -0.1198407, 0, 1, 0.9176471, 1,
-0.005233719, -1.231145, -3.836893, 0, 1, 0.9215686, 1,
-0.00443693, 0.8632356, 0.4205274, 0, 1, 0.9294118, 1,
-0.0008667725, 0.1369097, -1.323852, 0, 1, 0.9333333, 1,
0.007221458, -0.1620528, 1.938821, 0, 1, 0.9411765, 1,
0.0107448, 0.7548917, 0.2508265, 0, 1, 0.945098, 1,
0.01427022, -0.7665696, 3.646352, 0, 1, 0.9529412, 1,
0.01793262, -0.5627844, 2.295634, 0, 1, 0.9568627, 1,
0.01912573, 1.728406, -2.771701, 0, 1, 0.9647059, 1,
0.02415093, 0.9826398, -0.5056955, 0, 1, 0.9686275, 1,
0.02558872, -1.649256, 3.802829, 0, 1, 0.9764706, 1,
0.02656266, 0.09629719, 0.1364074, 0, 1, 0.9803922, 1,
0.02941788, -0.1471663, 2.374603, 0, 1, 0.9882353, 1,
0.03006374, 0.7365213, 0.1452252, 0, 1, 0.9921569, 1,
0.03062293, -0.4587107, 4.713432, 0, 1, 1, 1,
0.03141114, 1.518555, 0.3194794, 0, 0.9921569, 1, 1,
0.03865072, 0.4035839, 2.72741, 0, 0.9882353, 1, 1,
0.04281246, 0.3764613, 1.257526, 0, 0.9803922, 1, 1,
0.04559052, 0.4631232, 1.125305, 0, 0.9764706, 1, 1,
0.04820096, -0.2080833, 1.445631, 0, 0.9686275, 1, 1,
0.04873262, 1.002517, -2.118619, 0, 0.9647059, 1, 1,
0.05445382, 0.7712199, 1.219386, 0, 0.9568627, 1, 1,
0.05601509, 0.2311007, -0.8666099, 0, 0.9529412, 1, 1,
0.05770122, 0.03251534, 0.5731199, 0, 0.945098, 1, 1,
0.06489622, 0.188661, 0.5535409, 0, 0.9411765, 1, 1,
0.07183719, -0.07899902, 2.045708, 0, 0.9333333, 1, 1,
0.07535975, 0.6357143, -0.5187837, 0, 0.9294118, 1, 1,
0.07579453, -0.8493767, 3.106944, 0, 0.9215686, 1, 1,
0.08207434, 0.1631811, -0.6456376, 0, 0.9176471, 1, 1,
0.08282075, 0.003133804, 0.9086394, 0, 0.9098039, 1, 1,
0.08342286, 0.6426114, -1.612895, 0, 0.9058824, 1, 1,
0.08581159, -0.391072, 4.726099, 0, 0.8980392, 1, 1,
0.0906029, -0.1326534, 1.607148, 0, 0.8901961, 1, 1,
0.09138264, 0.2563038, 1.002301, 0, 0.8862745, 1, 1,
0.09420999, -0.06568185, 2.829157, 0, 0.8784314, 1, 1,
0.09550114, -0.4924922, 2.642432, 0, 0.8745098, 1, 1,
0.09802756, 2.067017, -0.04081215, 0, 0.8666667, 1, 1,
0.1052309, 1.177784, -0.5658311, 0, 0.8627451, 1, 1,
0.1052867, 0.7517413, -0.2288689, 0, 0.854902, 1, 1,
0.1079673, 0.789618, -0.9716736, 0, 0.8509804, 1, 1,
0.1103108, -0.7785639, 3.26601, 0, 0.8431373, 1, 1,
0.1104026, -0.9641013, 4.016721, 0, 0.8392157, 1, 1,
0.114529, -1.50104, 3.350433, 0, 0.8313726, 1, 1,
0.1151721, -0.9277774, 3.396359, 0, 0.827451, 1, 1,
0.1189792, -1.169077, 4.431516, 0, 0.8196079, 1, 1,
0.1199484, 2.312653, -0.009403843, 0, 0.8156863, 1, 1,
0.1225547, 0.04770084, 1.233807, 0, 0.8078431, 1, 1,
0.1236224, 0.8233644, 2.379037, 0, 0.8039216, 1, 1,
0.1300138, 0.9556192, 1.221197, 0, 0.7960784, 1, 1,
0.1313839, -1.865743, 3.80027, 0, 0.7882353, 1, 1,
0.132793, -0.723576, 3.991849, 0, 0.7843137, 1, 1,
0.1351512, 0.8772438, 1.977938, 0, 0.7764706, 1, 1,
0.1452999, -0.227119, 3.02644, 0, 0.772549, 1, 1,
0.1510071, 0.4530884, -0.5256885, 0, 0.7647059, 1, 1,
0.1515711, -0.4597613, 1.771373, 0, 0.7607843, 1, 1,
0.1521021, -1.828831, 2.454657, 0, 0.7529412, 1, 1,
0.1555657, -0.4636465, 3.866722, 0, 0.7490196, 1, 1,
0.1556862, 0.5540947, 0.6992764, 0, 0.7411765, 1, 1,
0.1558287, 0.1377684, 1.63011, 0, 0.7372549, 1, 1,
0.1575253, -0.2110392, 3.432406, 0, 0.7294118, 1, 1,
0.1600659, -1.257625, 4.825422, 0, 0.7254902, 1, 1,
0.1619071, 0.9725413, 1.064303, 0, 0.7176471, 1, 1,
0.1678695, 1.462319, -1.163088, 0, 0.7137255, 1, 1,
0.1679084, -0.9016449, 1.679459, 0, 0.7058824, 1, 1,
0.1753135, 0.193706, 2.068746, 0, 0.6980392, 1, 1,
0.1769124, 0.9253179, -0.4038818, 0, 0.6941177, 1, 1,
0.182911, 1.243279, -0.1426682, 0, 0.6862745, 1, 1,
0.1861965, 0.3936258, -0.3673321, 0, 0.682353, 1, 1,
0.1882247, 0.6419782, 0.7498064, 0, 0.6745098, 1, 1,
0.1889266, -2.032317, 1.591026, 0, 0.6705883, 1, 1,
0.1897204, 2.221688, 1.013174, 0, 0.6627451, 1, 1,
0.1913954, 0.816844, 0.916957, 0, 0.6588235, 1, 1,
0.1952727, -0.3638467, 4.228742, 0, 0.6509804, 1, 1,
0.1984559, 0.6603357, 0.1154224, 0, 0.6470588, 1, 1,
0.20085, 0.3064044, 0.5780957, 0, 0.6392157, 1, 1,
0.2035603, 1.201871, 0.2738792, 0, 0.6352941, 1, 1,
0.2041567, -0.04061865, 3.002108, 0, 0.627451, 1, 1,
0.2053774, 0.02652076, -0.09036396, 0, 0.6235294, 1, 1,
0.2061918, -0.4198695, 4.589051, 0, 0.6156863, 1, 1,
0.2113567, 0.5767043, 0.2070053, 0, 0.6117647, 1, 1,
0.212291, 0.3717484, 1.332128, 0, 0.6039216, 1, 1,
0.212572, 0.9305232, -1.217395, 0, 0.5960785, 1, 1,
0.2130574, -0.9364362, 3.593727, 0, 0.5921569, 1, 1,
0.2141852, 0.7448069, 0.1351638, 0, 0.5843138, 1, 1,
0.2155717, -0.7970784, 3.519175, 0, 0.5803922, 1, 1,
0.2189747, -2.916312, 2.793909, 0, 0.572549, 1, 1,
0.2201923, -0.9097515, 2.003961, 0, 0.5686275, 1, 1,
0.2273923, 0.3820586, -0.5433958, 0, 0.5607843, 1, 1,
0.2281355, -0.05487603, 2.554223, 0, 0.5568628, 1, 1,
0.2287207, -1.199247, 3.611935, 0, 0.5490196, 1, 1,
0.2294398, -0.2337698, 3.437629, 0, 0.5450981, 1, 1,
0.233676, 0.9221407, 0.1007312, 0, 0.5372549, 1, 1,
0.2338348, 0.7980732, -0.3472272, 0, 0.5333334, 1, 1,
0.2364787, 1.524971, -1.693641, 0, 0.5254902, 1, 1,
0.242405, -0.3527507, 2.350223, 0, 0.5215687, 1, 1,
0.2427109, 0.03345206, 2.369855, 0, 0.5137255, 1, 1,
0.2435552, 0.1292118, 0.8559871, 0, 0.509804, 1, 1,
0.2467773, -0.5562748, 5.6222, 0, 0.5019608, 1, 1,
0.2539816, -0.7009643, 1.76792, 0, 0.4941176, 1, 1,
0.2562707, 0.8715492, 0.6347802, 0, 0.4901961, 1, 1,
0.2633485, -1.000957, 5.055048, 0, 0.4823529, 1, 1,
0.2659509, -0.6674199, 1.713519, 0, 0.4784314, 1, 1,
0.2669404, 1.730003, -0.3674143, 0, 0.4705882, 1, 1,
0.2672189, 1.134498, 1.663523, 0, 0.4666667, 1, 1,
0.2684851, 2.467429, -0.7789003, 0, 0.4588235, 1, 1,
0.2755615, 0.6647121, 0.2787167, 0, 0.454902, 1, 1,
0.2816235, -0.2443947, 1.471099, 0, 0.4470588, 1, 1,
0.2840194, -0.3279015, 2.260893, 0, 0.4431373, 1, 1,
0.2899813, 1.653588, -0.1896566, 0, 0.4352941, 1, 1,
0.2909599, 0.4094883, 1.190973, 0, 0.4313726, 1, 1,
0.2912278, -0.302097, 2.822678, 0, 0.4235294, 1, 1,
0.2922741, 0.8590744, -0.5756279, 0, 0.4196078, 1, 1,
0.2936819, 0.9932886, -0.1983261, 0, 0.4117647, 1, 1,
0.2946797, 0.742887, 0.6645444, 0, 0.4078431, 1, 1,
0.2981362, 0.6363696, 1.04187, 0, 0.4, 1, 1,
0.2984559, 2.196728, -0.009517991, 0, 0.3921569, 1, 1,
0.2995289, 0.2376238, 3.00327, 0, 0.3882353, 1, 1,
0.2996892, -0.8979689, 3.706821, 0, 0.3803922, 1, 1,
0.3022231, 0.4452453, 0.2665548, 0, 0.3764706, 1, 1,
0.3052705, 0.1294177, -2.014967, 0, 0.3686275, 1, 1,
0.3056346, 0.3562859, 1.247023, 0, 0.3647059, 1, 1,
0.3075089, -0.6575124, 3.28446, 0, 0.3568628, 1, 1,
0.3082366, -0.4261611, 2.398609, 0, 0.3529412, 1, 1,
0.3123351, 0.3245192, 0.06381659, 0, 0.345098, 1, 1,
0.3141143, -0.6410225, 2.771101, 0, 0.3411765, 1, 1,
0.3144645, 1.033831, -0.3059663, 0, 0.3333333, 1, 1,
0.3150945, -0.03313491, 2.701496, 0, 0.3294118, 1, 1,
0.3205176, 1.160538, 1.545975, 0, 0.3215686, 1, 1,
0.3217348, 0.7480195, 2.027005, 0, 0.3176471, 1, 1,
0.3243749, -0.6042911, 2.174295, 0, 0.3098039, 1, 1,
0.3272607, -1.464017, 2.362914, 0, 0.3058824, 1, 1,
0.3288548, -1.871023, 2.964719, 0, 0.2980392, 1, 1,
0.3294002, 0.2801978, 1.519123, 0, 0.2901961, 1, 1,
0.3335216, -1.420885, 3.693545, 0, 0.2862745, 1, 1,
0.3378102, -1.94751, 4.504957, 0, 0.2784314, 1, 1,
0.3405426, -0.8454974, 2.289964, 0, 0.2745098, 1, 1,
0.341134, -0.4227794, 3.548938, 0, 0.2666667, 1, 1,
0.3434391, 0.6587831, 0.8659432, 0, 0.2627451, 1, 1,
0.3452424, -0.494411, 2.723627, 0, 0.254902, 1, 1,
0.3460889, -1.075437, 2.102992, 0, 0.2509804, 1, 1,
0.3556153, -0.5288764, 2.548826, 0, 0.2431373, 1, 1,
0.3592013, 1.667808, -0.8412067, 0, 0.2392157, 1, 1,
0.3594142, 0.5144948, 1.987836, 0, 0.2313726, 1, 1,
0.3616156, 0.2786801, 1.226899, 0, 0.227451, 1, 1,
0.362253, 0.9834523, 1.019647, 0, 0.2196078, 1, 1,
0.375296, -0.8508782, 0.7266713, 0, 0.2156863, 1, 1,
0.3753157, 1.024826, 0.7814378, 0, 0.2078431, 1, 1,
0.3783992, -0.6649681, 2.142694, 0, 0.2039216, 1, 1,
0.3805169, -2.03999, 2.585654, 0, 0.1960784, 1, 1,
0.3806123, 1.153568, -1.114762, 0, 0.1882353, 1, 1,
0.3871141, 1.656616, -0.7729964, 0, 0.1843137, 1, 1,
0.3895664, 0.4346876, 0.9957413, 0, 0.1764706, 1, 1,
0.3980923, 0.5353653, -0.2549075, 0, 0.172549, 1, 1,
0.3988113, 0.4836008, -0.3206482, 0, 0.1647059, 1, 1,
0.3997665, 1.388428, 0.6299964, 0, 0.1607843, 1, 1,
0.4004599, -1.938629, 3.498162, 0, 0.1529412, 1, 1,
0.4092257, -1.871064, 1.471416, 0, 0.1490196, 1, 1,
0.4102993, 0.3608356, 0.9213981, 0, 0.1411765, 1, 1,
0.4146765, -0.6671348, 1.320111, 0, 0.1372549, 1, 1,
0.4149606, 0.5086471, 0.7781128, 0, 0.1294118, 1, 1,
0.4186006, 1.582039, 0.462085, 0, 0.1254902, 1, 1,
0.4188733, -0.5825216, 2.903489, 0, 0.1176471, 1, 1,
0.420858, -0.3658883, 0.9219177, 0, 0.1137255, 1, 1,
0.4233529, -0.8065336, 2.110925, 0, 0.1058824, 1, 1,
0.4286869, -0.5938526, 1.673758, 0, 0.09803922, 1, 1,
0.4292658, 0.2496664, 1.356048, 0, 0.09411765, 1, 1,
0.4296615, 1.34331, 1.47865, 0, 0.08627451, 1, 1,
0.4317576, -0.05309055, 1.298679, 0, 0.08235294, 1, 1,
0.4322134, -1.213361, 2.0799, 0, 0.07450981, 1, 1,
0.4344813, 1.552217, 0.5935563, 0, 0.07058824, 1, 1,
0.4359056, -0.8268744, 3.153306, 0, 0.0627451, 1, 1,
0.4397099, 1.347976, -0.4755545, 0, 0.05882353, 1, 1,
0.447997, 0.8402571, 1.586282, 0, 0.05098039, 1, 1,
0.4482976, -0.7819076, 3.157164, 0, 0.04705882, 1, 1,
0.4485755, -0.09513509, 1.795303, 0, 0.03921569, 1, 1,
0.4496102, 0.1126725, 1.777266, 0, 0.03529412, 1, 1,
0.4557815, -0.5342928, 3.61234, 0, 0.02745098, 1, 1,
0.4609647, 2.289297, 1.379617, 0, 0.02352941, 1, 1,
0.4611351, 0.7209927, -0.5190145, 0, 0.01568628, 1, 1,
0.4688995, 1.068799, 0.7778715, 0, 0.01176471, 1, 1,
0.4691316, -0.7504486, 1.312622, 0, 0.003921569, 1, 1,
0.4697248, 1.341653, 0.5219014, 0.003921569, 0, 1, 1,
0.4699794, -0.8271981, 3.074468, 0.007843138, 0, 1, 1,
0.4712131, -0.9825357, 1.978257, 0.01568628, 0, 1, 1,
0.472828, -0.2332589, 1.571536, 0.01960784, 0, 1, 1,
0.4761868, -1.619994, 2.871889, 0.02745098, 0, 1, 1,
0.4776504, -1.134587, 3.350739, 0.03137255, 0, 1, 1,
0.4790287, 2.055653, 1.705738, 0.03921569, 0, 1, 1,
0.4796005, 1.152374, 0.1135759, 0.04313726, 0, 1, 1,
0.4850337, 0.9272557, 1.797081, 0.05098039, 0, 1, 1,
0.4869415, 0.292832, -0.7114154, 0.05490196, 0, 1, 1,
0.4950631, 2.102311, 0.80254, 0.0627451, 0, 1, 1,
0.496877, 1.838718, -0.5902323, 0.06666667, 0, 1, 1,
0.4975157, -1.177499, 2.618433, 0.07450981, 0, 1, 1,
0.5015937, -0.1425167, 1.409391, 0.07843138, 0, 1, 1,
0.5023295, 0.3634298, -0.07043389, 0.08627451, 0, 1, 1,
0.502848, 0.8883604, 0.3737742, 0.09019608, 0, 1, 1,
0.5038701, 0.1656209, 1.574085, 0.09803922, 0, 1, 1,
0.5043092, 1.2334, 0.2449316, 0.1058824, 0, 1, 1,
0.5065053, -0.5632367, 2.238923, 0.1098039, 0, 1, 1,
0.5082377, -1.125511, 3.487814, 0.1176471, 0, 1, 1,
0.5082724, -0.9233831, 3.919027, 0.1215686, 0, 1, 1,
0.5082909, 2.443578, 1.144002, 0.1294118, 0, 1, 1,
0.5114132, 1.072268, -0.2678556, 0.1333333, 0, 1, 1,
0.5135015, 1.565771, 0.120351, 0.1411765, 0, 1, 1,
0.521244, -1.01396, 0.7847557, 0.145098, 0, 1, 1,
0.5218182, 0.2295668, -1.129797, 0.1529412, 0, 1, 1,
0.5219062, -0.3878182, 1.765439, 0.1568628, 0, 1, 1,
0.5265317, 0.834387, 0.02888808, 0.1647059, 0, 1, 1,
0.5285356, -1.794072, 2.441513, 0.1686275, 0, 1, 1,
0.5292072, 2.10763, 0.283931, 0.1764706, 0, 1, 1,
0.5313303, 1.036465, 1.058675, 0.1803922, 0, 1, 1,
0.5330052, 1.250546, 0.2112446, 0.1882353, 0, 1, 1,
0.5422347, 0.583549, 0.8415067, 0.1921569, 0, 1, 1,
0.5462902, 0.9065583, 0.2870284, 0.2, 0, 1, 1,
0.5485347, -1.035174, 1.442258, 0.2078431, 0, 1, 1,
0.5499667, 0.6740297, 1.478873, 0.2117647, 0, 1, 1,
0.5514348, -0.5842762, 2.132228, 0.2196078, 0, 1, 1,
0.5517215, -0.1032035, 1.256364, 0.2235294, 0, 1, 1,
0.5616628, -1.913208, 2.857977, 0.2313726, 0, 1, 1,
0.5653095, -0.7858414, 1.554798, 0.2352941, 0, 1, 1,
0.5782641, -0.1132905, 1.376575, 0.2431373, 0, 1, 1,
0.578488, -1.406964, 1.289987, 0.2470588, 0, 1, 1,
0.5831816, 0.8508264, 0.5541867, 0.254902, 0, 1, 1,
0.5836668, -0.4800583, 1.016167, 0.2588235, 0, 1, 1,
0.5870672, 2.693912, 0.04111506, 0.2666667, 0, 1, 1,
0.5945672, 0.4307454, -0.801798, 0.2705882, 0, 1, 1,
0.5963676, -0.973425, 1.900735, 0.2784314, 0, 1, 1,
0.5970232, -1.852872, 3.028113, 0.282353, 0, 1, 1,
0.600101, 0.02706437, 2.192058, 0.2901961, 0, 1, 1,
0.6052263, -1.382344, 4.551175, 0.2941177, 0, 1, 1,
0.6078433, -1.231628, 2.983556, 0.3019608, 0, 1, 1,
0.6096542, 0.5750498, 2.57342, 0.3098039, 0, 1, 1,
0.6109183, 0.6103849, 2.536397, 0.3137255, 0, 1, 1,
0.611277, 0.1891168, 2.281739, 0.3215686, 0, 1, 1,
0.6130016, -1.390437, 3.733378, 0.3254902, 0, 1, 1,
0.6167669, 0.8946934, 0.9790319, 0.3333333, 0, 1, 1,
0.6203727, -0.7472391, 2.5385, 0.3372549, 0, 1, 1,
0.6213771, 0.1539844, 1.218399, 0.345098, 0, 1, 1,
0.6241042, -0.03147215, 0.5255122, 0.3490196, 0, 1, 1,
0.6280028, 0.4193181, -0.4013637, 0.3568628, 0, 1, 1,
0.6280478, 0.5563359, 0.2137405, 0.3607843, 0, 1, 1,
0.629985, 0.06689568, 0.1112539, 0.3686275, 0, 1, 1,
0.6355752, 0.804444, 0.6676795, 0.372549, 0, 1, 1,
0.6390244, -0.5942941, 2.768572, 0.3803922, 0, 1, 1,
0.6413872, 2.077805, 1.218347, 0.3843137, 0, 1, 1,
0.6443539, 0.8357, -0.5586827, 0.3921569, 0, 1, 1,
0.6484386, 0.07414176, 1.604536, 0.3960784, 0, 1, 1,
0.6530885, 2.456412, 0.09691892, 0.4039216, 0, 1, 1,
0.6565254, 1.946481, 0.7770356, 0.4117647, 0, 1, 1,
0.6593013, 0.3834536, 1.876026, 0.4156863, 0, 1, 1,
0.661876, 0.6048379, 2.297817, 0.4235294, 0, 1, 1,
0.6638463, 0.9765557, 2.012056, 0.427451, 0, 1, 1,
0.6795474, -0.4910987, 0.3937107, 0.4352941, 0, 1, 1,
0.6797242, -0.1536113, -0.3803849, 0.4392157, 0, 1, 1,
0.6845893, 1.279063, 2.117335, 0.4470588, 0, 1, 1,
0.688437, 1.067334, 1.125699, 0.4509804, 0, 1, 1,
0.6900825, -0.04072643, 2.780833, 0.4588235, 0, 1, 1,
0.6956859, 0.8015464, 1.464034, 0.4627451, 0, 1, 1,
0.6966254, 1.617036, 0.8995932, 0.4705882, 0, 1, 1,
0.6972113, 0.5596582, 0.1874505, 0.4745098, 0, 1, 1,
0.7005503, -1.851684, 3.161981, 0.4823529, 0, 1, 1,
0.7084013, -1.228891, 1.831391, 0.4862745, 0, 1, 1,
0.7103547, 0.5716079, 0.8560161, 0.4941176, 0, 1, 1,
0.7109339, -0.7610682, 1.20319, 0.5019608, 0, 1, 1,
0.7193859, 0.3787562, 1.198731, 0.5058824, 0, 1, 1,
0.721442, -0.2584113, 1.807868, 0.5137255, 0, 1, 1,
0.7236761, 1.043367, 2.390373, 0.5176471, 0, 1, 1,
0.7282063, 0.4953118, 1.417045, 0.5254902, 0, 1, 1,
0.7312279, 0.05710788, 0.9138007, 0.5294118, 0, 1, 1,
0.7357598, 1.868216, -0.3510357, 0.5372549, 0, 1, 1,
0.7361868, -0.478164, 2.236231, 0.5411765, 0, 1, 1,
0.7403964, 0.3903897, -0.03206454, 0.5490196, 0, 1, 1,
0.7410411, 1.780213, 2.646418, 0.5529412, 0, 1, 1,
0.7415969, 0.1984987, 1.140867, 0.5607843, 0, 1, 1,
0.7504065, 0.9343534, -0.1175066, 0.5647059, 0, 1, 1,
0.7519736, 1.038993, -1.505084, 0.572549, 0, 1, 1,
0.7520462, -0.7750084, 1.918632, 0.5764706, 0, 1, 1,
0.7521592, 0.1871318, 1.129222, 0.5843138, 0, 1, 1,
0.7589048, -0.3000078, 1.706081, 0.5882353, 0, 1, 1,
0.7641913, 0.3144145, 1.306703, 0.5960785, 0, 1, 1,
0.7649426, 0.3234992, 2.761217, 0.6039216, 0, 1, 1,
0.7698905, 0.507782, 1.991547, 0.6078432, 0, 1, 1,
0.770226, 1.689741, 1.037864, 0.6156863, 0, 1, 1,
0.7796211, -0.6625649, 1.795897, 0.6196079, 0, 1, 1,
0.7816186, -0.5100703, 1.278975, 0.627451, 0, 1, 1,
0.7834019, 0.6477497, 0.1503185, 0.6313726, 0, 1, 1,
0.7875378, 0.304185, 3.172057, 0.6392157, 0, 1, 1,
0.7906002, 0.2499494, 3.243202, 0.6431373, 0, 1, 1,
0.7922624, 0.672013, 2.34827, 0.6509804, 0, 1, 1,
0.7924687, -0.7221327, 2.807428, 0.654902, 0, 1, 1,
0.7960048, 0.03528931, 3.60741, 0.6627451, 0, 1, 1,
0.8007375, -3.532525, 1.312595, 0.6666667, 0, 1, 1,
0.8032444, -1.147653, 2.694525, 0.6745098, 0, 1, 1,
0.8044783, 1.393871, 1.152412, 0.6784314, 0, 1, 1,
0.8081709, -0.9651188, 1.30788, 0.6862745, 0, 1, 1,
0.8098098, -0.2728518, 2.272089, 0.6901961, 0, 1, 1,
0.8157437, -1.213122, 2.12956, 0.6980392, 0, 1, 1,
0.8231488, 0.6774723, 1.90329, 0.7058824, 0, 1, 1,
0.8243094, 0.283855, 3.91216, 0.7098039, 0, 1, 1,
0.8273584, 0.4241167, -0.7618437, 0.7176471, 0, 1, 1,
0.8295884, -1.446253, 2.324263, 0.7215686, 0, 1, 1,
0.829917, 0.2071157, 0.5960629, 0.7294118, 0, 1, 1,
0.8320523, 0.7778089, -0.005186193, 0.7333333, 0, 1, 1,
0.8362331, 1.722604, 1.028507, 0.7411765, 0, 1, 1,
0.8366444, -1.814295, 2.544728, 0.7450981, 0, 1, 1,
0.8390846, -0.6941237, 2.608635, 0.7529412, 0, 1, 1,
0.8416438, 1.274127, 0.7640048, 0.7568628, 0, 1, 1,
0.8427578, -0.001839735, 2.311055, 0.7647059, 0, 1, 1,
0.8447793, 0.3913871, 2.119235, 0.7686275, 0, 1, 1,
0.8468145, -0.4963761, 3.045722, 0.7764706, 0, 1, 1,
0.8480914, 0.2150517, 0.3579583, 0.7803922, 0, 1, 1,
0.8492123, 1.49946, 2.047724, 0.7882353, 0, 1, 1,
0.8500193, -0.8373687, 1.488137, 0.7921569, 0, 1, 1,
0.851569, -0.04985615, 1.333569, 0.8, 0, 1, 1,
0.8576298, 1.166744, 0.721391, 0.8078431, 0, 1, 1,
0.8600616, 0.3349595, -0.1260071, 0.8117647, 0, 1, 1,
0.8620114, -1.806887, 3.279879, 0.8196079, 0, 1, 1,
0.8675143, 1.407353, -1.471932, 0.8235294, 0, 1, 1,
0.87067, -0.1192109, 2.855758, 0.8313726, 0, 1, 1,
0.8708958, -0.6831335, 2.934405, 0.8352941, 0, 1, 1,
0.8715923, -0.6385876, 3.111094, 0.8431373, 0, 1, 1,
0.8743933, -0.9542254, 1.656227, 0.8470588, 0, 1, 1,
0.8753487, -1.492738, 2.101827, 0.854902, 0, 1, 1,
0.8887733, 0.3839883, 1.772159, 0.8588235, 0, 1, 1,
0.8966671, 0.5795862, 2.476967, 0.8666667, 0, 1, 1,
0.8997647, -0.5361562, 1.592173, 0.8705882, 0, 1, 1,
0.9012935, -0.9020311, 1.599944, 0.8784314, 0, 1, 1,
0.9114909, -0.1168458, 2.122781, 0.8823529, 0, 1, 1,
0.9178228, -0.03140866, -0.002768695, 0.8901961, 0, 1, 1,
0.9212654, 0.2142958, 1.137094, 0.8941177, 0, 1, 1,
0.9245014, -0.4486953, 0.6406861, 0.9019608, 0, 1, 1,
0.9323329, 0.9137411, -1.431906, 0.9098039, 0, 1, 1,
0.9325575, 0.9653592, 1.668635, 0.9137255, 0, 1, 1,
0.9346583, -0.2327927, 0.3947962, 0.9215686, 0, 1, 1,
0.9387478, 1.49757, -0.1167285, 0.9254902, 0, 1, 1,
0.942444, 1.349358, -1.27143, 0.9333333, 0, 1, 1,
0.9441041, 0.01173003, 1.736025, 0.9372549, 0, 1, 1,
0.9448527, 0.7663034, 0.4278946, 0.945098, 0, 1, 1,
0.9453141, -1.534521, 2.61655, 0.9490196, 0, 1, 1,
0.9491223, -0.5256186, 2.057981, 0.9568627, 0, 1, 1,
0.9517208, -0.7937349, 4.001191, 0.9607843, 0, 1, 1,
0.9526175, -0.1524655, 0.1284159, 0.9686275, 0, 1, 1,
0.9537303, -0.908751, 1.459642, 0.972549, 0, 1, 1,
0.9634219, -0.3235121, 1.434423, 0.9803922, 0, 1, 1,
0.9656748, 0.1084351, 1.899379, 0.9843137, 0, 1, 1,
0.9688201, -0.4868462, 1.647762, 0.9921569, 0, 1, 1,
0.9827139, -0.8892251, 1.180993, 0.9960784, 0, 1, 1,
0.9943731, -0.3852764, 1.760163, 1, 0, 0.9960784, 1,
0.9958693, -1.430758, 3.16348, 1, 0, 0.9882353, 1,
1.001572, -1.176308, 0.4890797, 1, 0, 0.9843137, 1,
1.007282, 0.1982117, -0.02495453, 1, 0, 0.9764706, 1,
1.014606, -0.7617904, 2.883577, 1, 0, 0.972549, 1,
1.016493, -0.1653778, -0.02878744, 1, 0, 0.9647059, 1,
1.022996, 0.7726111, 2.222937, 1, 0, 0.9607843, 1,
1.025529, 1.868378, 0.3770683, 1, 0, 0.9529412, 1,
1.028113, -1.670418, 2.011917, 1, 0, 0.9490196, 1,
1.029215, -0.3707508, 3.271154, 1, 0, 0.9411765, 1,
1.02973, -0.7681373, 2.799161, 1, 0, 0.9372549, 1,
1.030336, 0.2396756, 3.401826, 1, 0, 0.9294118, 1,
1.037479, -0.8476188, -0.4719951, 1, 0, 0.9254902, 1,
1.049766, 1.532479, 1.376969, 1, 0, 0.9176471, 1,
1.050719, -0.2128654, 1.750269, 1, 0, 0.9137255, 1,
1.058513, 0.4194782, 1.00562, 1, 0, 0.9058824, 1,
1.061712, -0.1471457, 2.24647, 1, 0, 0.9019608, 1,
1.064924, 0.8278804, 0.6192554, 1, 0, 0.8941177, 1,
1.068758, 0.1579519, 2.647386, 1, 0, 0.8862745, 1,
1.078667, -0.7537071, 1.269448, 1, 0, 0.8823529, 1,
1.084538, -0.7232425, 2.860775, 1, 0, 0.8745098, 1,
1.086006, 1.247529, 2.151855, 1, 0, 0.8705882, 1,
1.087092, 0.7396414, 2.175529, 1, 0, 0.8627451, 1,
1.088115, 0.3233682, 0.2357626, 1, 0, 0.8588235, 1,
1.092878, -0.3227335, 2.164643, 1, 0, 0.8509804, 1,
1.097299, 0.4419982, 1.076838, 1, 0, 0.8470588, 1,
1.097745, 0.8375627, -0.4554443, 1, 0, 0.8392157, 1,
1.10172, -1.584054, 2.561926, 1, 0, 0.8352941, 1,
1.11177, 1.114178, -1.229135, 1, 0, 0.827451, 1,
1.112153, 0.7050754, 1.114624, 1, 0, 0.8235294, 1,
1.123814, 0.2304523, 1.284271, 1, 0, 0.8156863, 1,
1.128243, 0.918423, 1.027069, 1, 0, 0.8117647, 1,
1.13579, -1.422309, 2.961674, 1, 0, 0.8039216, 1,
1.136844, -0.1352742, 0.6764144, 1, 0, 0.7960784, 1,
1.138067, -0.855285, 3.557271, 1, 0, 0.7921569, 1,
1.139659, 0.4745184, 1.148585, 1, 0, 0.7843137, 1,
1.146644, -0.2542472, 1.520537, 1, 0, 0.7803922, 1,
1.150565, -0.6583351, 1.618176, 1, 0, 0.772549, 1,
1.154669, 1.071047, 0.6903523, 1, 0, 0.7686275, 1,
1.15693, -1.364388, 3.414081, 1, 0, 0.7607843, 1,
1.173194, 1.179864, 0.2425452, 1, 0, 0.7568628, 1,
1.175615, 0.2225399, 1.907635, 1, 0, 0.7490196, 1,
1.180515, 1.954134, 1.781915, 1, 0, 0.7450981, 1,
1.182708, -0.07547262, 3.655621, 1, 0, 0.7372549, 1,
1.190364, -0.7430753, 3.201092, 1, 0, 0.7333333, 1,
1.196879, 0.5763817, -0.0192364, 1, 0, 0.7254902, 1,
1.203127, 1.404775, 1.872438, 1, 0, 0.7215686, 1,
1.208028, -0.4002686, 0.9542081, 1, 0, 0.7137255, 1,
1.21891, 0.244842, 3.450256, 1, 0, 0.7098039, 1,
1.248246, -0.2081983, 1.738177, 1, 0, 0.7019608, 1,
1.252164, 0.389471, 1.591062, 1, 0, 0.6941177, 1,
1.252786, 1.615051, 0.6064175, 1, 0, 0.6901961, 1,
1.256604, -0.9104565, 1.044254, 1, 0, 0.682353, 1,
1.262641, 0.02123685, 1.866682, 1, 0, 0.6784314, 1,
1.263818, -0.5922706, 1.449791, 1, 0, 0.6705883, 1,
1.26843, 0.417246, 1.503353, 1, 0, 0.6666667, 1,
1.276172, -0.6670673, 0.5502437, 1, 0, 0.6588235, 1,
1.287803, -0.5370411, 1.636714, 1, 0, 0.654902, 1,
1.291074, -0.9156404, 2.521305, 1, 0, 0.6470588, 1,
1.291504, 0.6588399, 1.30662, 1, 0, 0.6431373, 1,
1.294704, -0.8209072, 2.95784, 1, 0, 0.6352941, 1,
1.294738, 1.381609, 1.86098, 1, 0, 0.6313726, 1,
1.306697, 0.03997368, 1.787557, 1, 0, 0.6235294, 1,
1.311342, -0.09444708, 0.1361014, 1, 0, 0.6196079, 1,
1.315103, 0.5812023, 2.076199, 1, 0, 0.6117647, 1,
1.319213, -0.2427431, 0.3085259, 1, 0, 0.6078432, 1,
1.332573, -0.9499967, 2.02916, 1, 0, 0.6, 1,
1.334165, -0.08852836, 2.808348, 1, 0, 0.5921569, 1,
1.337422, -0.3795056, 0.5950451, 1, 0, 0.5882353, 1,
1.339044, -1.4301, 1.377831, 1, 0, 0.5803922, 1,
1.344023, -0.1385479, 1.15381, 1, 0, 0.5764706, 1,
1.345137, 0.4970242, 0.6419199, 1, 0, 0.5686275, 1,
1.353606, 0.48695, 0.3145807, 1, 0, 0.5647059, 1,
1.354352, -0.3516572, 1.814357, 1, 0, 0.5568628, 1,
1.358888, 0.0722762, 0.2853487, 1, 0, 0.5529412, 1,
1.375414, 0.4603529, 1.503291, 1, 0, 0.5450981, 1,
1.380037, -0.7408392, 2.164462, 1, 0, 0.5411765, 1,
1.393728, -0.4387823, 0.5236884, 1, 0, 0.5333334, 1,
1.394499, 0.4810684, 1.349674, 1, 0, 0.5294118, 1,
1.398432, 0.4989151, -0.5475467, 1, 0, 0.5215687, 1,
1.403384, 0.1280591, 1.436443, 1, 0, 0.5176471, 1,
1.412645, 1.113569, 1.71912, 1, 0, 0.509804, 1,
1.421144, 0.3267125, 0.7035558, 1, 0, 0.5058824, 1,
1.423581, -1.098637, 2.971593, 1, 0, 0.4980392, 1,
1.425125, -0.1724326, 1.205998, 1, 0, 0.4901961, 1,
1.426133, 0.7810752, 0.5684545, 1, 0, 0.4862745, 1,
1.432285, -0.6351631, 2.185913, 1, 0, 0.4784314, 1,
1.434883, -1.78116, 2.701317, 1, 0, 0.4745098, 1,
1.436235, -1.056924, 1.263698, 1, 0, 0.4666667, 1,
1.448253, -0.8223456, 1.202136, 1, 0, 0.4627451, 1,
1.452183, 0.6530212, -0.6298966, 1, 0, 0.454902, 1,
1.472955, -1.941386, 3.452015, 1, 0, 0.4509804, 1,
1.473078, 1.519369, 1.771095, 1, 0, 0.4431373, 1,
1.480909, -2.205054, 2.704263, 1, 0, 0.4392157, 1,
1.494644, -0.5757764, 2.769111, 1, 0, 0.4313726, 1,
1.49742, -0.5491747, 2.062875, 1, 0, 0.427451, 1,
1.501289, 0.296078, 1.258196, 1, 0, 0.4196078, 1,
1.521202, -0.01871954, 4.225005, 1, 0, 0.4156863, 1,
1.525331, 0.330057, 1.251077, 1, 0, 0.4078431, 1,
1.525877, 1.146068, 0.7387558, 1, 0, 0.4039216, 1,
1.544866, 0.1428374, 0.6160732, 1, 0, 0.3960784, 1,
1.54532, -1.024499, 2.373348, 1, 0, 0.3882353, 1,
1.547324, -0.09219664, 2.043239, 1, 0, 0.3843137, 1,
1.558609, 1.74844, 2.579859, 1, 0, 0.3764706, 1,
1.570989, 1.160881, 2.519811, 1, 0, 0.372549, 1,
1.578813, 1.007418, 0.5699512, 1, 0, 0.3647059, 1,
1.58724, 0.5897989, 1.290042, 1, 0, 0.3607843, 1,
1.589149, -0.01857997, 0.5711811, 1, 0, 0.3529412, 1,
1.602562, 0.4019197, 0.5646752, 1, 0, 0.3490196, 1,
1.604654, 0.9450485, 0.8684735, 1, 0, 0.3411765, 1,
1.619527, 0.3831356, 3.269928, 1, 0, 0.3372549, 1,
1.630244, 0.8346038, 1.115623, 1, 0, 0.3294118, 1,
1.6333, -0.2895377, 2.169939, 1, 0, 0.3254902, 1,
1.635702, 1.112357, 1.08234, 1, 0, 0.3176471, 1,
1.64656, 0.656579, 1.643271, 1, 0, 0.3137255, 1,
1.657663, 0.5703865, 1.641633, 1, 0, 0.3058824, 1,
1.660773, 1.271654, 1.639639, 1, 0, 0.2980392, 1,
1.682997, -1.626795, 2.162723, 1, 0, 0.2941177, 1,
1.685488, -0.1119966, 1.809253, 1, 0, 0.2862745, 1,
1.690136, -0.01308657, 0.4427293, 1, 0, 0.282353, 1,
1.697115, -0.01744806, 0.4426091, 1, 0, 0.2745098, 1,
1.713336, -1.080966, 3.367099, 1, 0, 0.2705882, 1,
1.713884, 0.4203306, 4.433094, 1, 0, 0.2627451, 1,
1.718567, -1.130668, 1.255743, 1, 0, 0.2588235, 1,
1.737858, 1.202552, 2.15699, 1, 0, 0.2509804, 1,
1.743855, 0.5847369, 0.8877545, 1, 0, 0.2470588, 1,
1.754056, 0.2732956, 1.245056, 1, 0, 0.2392157, 1,
1.758595, -0.06639459, 1.076916, 1, 0, 0.2352941, 1,
1.763611, 0.5964352, 2.804045, 1, 0, 0.227451, 1,
1.779788, 0.4294476, 1.626627, 1, 0, 0.2235294, 1,
1.788219, -0.1685324, 0.6522369, 1, 0, 0.2156863, 1,
1.792035, 0.3782816, -0.8347785, 1, 0, 0.2117647, 1,
1.796116, -1.599106, 2.331122, 1, 0, 0.2039216, 1,
1.80606, -1.102574, 2.725507, 1, 0, 0.1960784, 1,
1.826178, 1.150133, 2.683486, 1, 0, 0.1921569, 1,
1.846025, 1.177489, 0.5929665, 1, 0, 0.1843137, 1,
1.850018, 0.6839294, 0.6371561, 1, 0, 0.1803922, 1,
1.852103, 0.07893615, 2.183626, 1, 0, 0.172549, 1,
1.856633, 0.9675845, 1.188922, 1, 0, 0.1686275, 1,
1.866466, 0.5341816, -0.3553382, 1, 0, 0.1607843, 1,
1.86732, -0.4674548, 3.013366, 1, 0, 0.1568628, 1,
1.872553, 0.2671921, 3.930964, 1, 0, 0.1490196, 1,
1.87964, -0.2691867, 1.878859, 1, 0, 0.145098, 1,
1.885287, 0.7874851, 0.8615493, 1, 0, 0.1372549, 1,
1.935261, 0.7775183, 1.045773, 1, 0, 0.1333333, 1,
1.940863, 1.601628, -0.2656224, 1, 0, 0.1254902, 1,
1.945742, -1.332138, 1.106386, 1, 0, 0.1215686, 1,
1.994288, 0.1580266, -0.01791528, 1, 0, 0.1137255, 1,
2.053494, 0.6926354, 0.009292627, 1, 0, 0.1098039, 1,
2.10553, -1.529889, 2.226585, 1, 0, 0.1019608, 1,
2.150543, -1.009488, 1.105489, 1, 0, 0.09411765, 1,
2.162085, 1.70341, 0.996285, 1, 0, 0.09019608, 1,
2.186975, 0.247534, -0.1999096, 1, 0, 0.08235294, 1,
2.227618, 0.4241987, 1.639992, 1, 0, 0.07843138, 1,
2.250101, 0.05743029, 3.243747, 1, 0, 0.07058824, 1,
2.265428, -1.482873, 2.124667, 1, 0, 0.06666667, 1,
2.271701, -0.6994562, 1.52413, 1, 0, 0.05882353, 1,
2.277926, 0.6103233, 1.903041, 1, 0, 0.05490196, 1,
2.371866, -0.1676205, 2.391504, 1, 0, 0.04705882, 1,
2.513233, -0.6918002, 0.8687866, 1, 0, 0.04313726, 1,
2.537724, 1.124442, 1.174855, 1, 0, 0.03529412, 1,
2.566377, -0.2871919, 0.7164086, 1, 0, 0.03137255, 1,
2.578291, 1.702918, -0.4916616, 1, 0, 0.02352941, 1,
2.654763, 0.1518747, 1.227192, 1, 0, 0.01960784, 1,
2.923576, 0.02801882, 1.708469, 1, 0, 0.01176471, 1,
3.523711, -0.4826528, 2.750865, 1, 0, 0.007843138, 1
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
0.267964, -4.614313, -7.055114, 0, -0.5, 0.5, 0.5,
0.267964, -4.614313, -7.055114, 1, -0.5, 0.5, 0.5,
0.267964, -4.614313, -7.055114, 1, 1.5, 0.5, 0.5,
0.267964, -4.614313, -7.055114, 0, 1.5, 0.5, 0.5
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
-4.091481, -0.3414092, -7.055114, 0, -0.5, 0.5, 0.5,
-4.091481, -0.3414092, -7.055114, 1, -0.5, 0.5, 0.5,
-4.091481, -0.3414092, -7.055114, 1, 1.5, 0.5, 0.5,
-4.091481, -0.3414092, -7.055114, 0, 1.5, 0.5, 0.5
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
-4.091481, -4.614313, 0.2022283, 0, -0.5, 0.5, 0.5,
-4.091481, -4.614313, 0.2022283, 1, -0.5, 0.5, 0.5,
-4.091481, -4.614313, 0.2022283, 1, 1.5, 0.5, 0.5,
-4.091481, -4.614313, 0.2022283, 0, 1.5, 0.5, 0.5
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
-2, -3.628258, -5.380342,
3, -3.628258, -5.380342,
-2, -3.628258, -5.380342,
-2, -3.7926, -5.659471,
-1, -3.628258, -5.380342,
-1, -3.7926, -5.659471,
0, -3.628258, -5.380342,
0, -3.7926, -5.659471,
1, -3.628258, -5.380342,
1, -3.7926, -5.659471,
2, -3.628258, -5.380342,
2, -3.7926, -5.659471,
3, -3.628258, -5.380342,
3, -3.7926, -5.659471
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
-2, -4.121285, -6.217728, 0, -0.5, 0.5, 0.5,
-2, -4.121285, -6.217728, 1, -0.5, 0.5, 0.5,
-2, -4.121285, -6.217728, 1, 1.5, 0.5, 0.5,
-2, -4.121285, -6.217728, 0, 1.5, 0.5, 0.5,
-1, -4.121285, -6.217728, 0, -0.5, 0.5, 0.5,
-1, -4.121285, -6.217728, 1, -0.5, 0.5, 0.5,
-1, -4.121285, -6.217728, 1, 1.5, 0.5, 0.5,
-1, -4.121285, -6.217728, 0, 1.5, 0.5, 0.5,
0, -4.121285, -6.217728, 0, -0.5, 0.5, 0.5,
0, -4.121285, -6.217728, 1, -0.5, 0.5, 0.5,
0, -4.121285, -6.217728, 1, 1.5, 0.5, 0.5,
0, -4.121285, -6.217728, 0, 1.5, 0.5, 0.5,
1, -4.121285, -6.217728, 0, -0.5, 0.5, 0.5,
1, -4.121285, -6.217728, 1, -0.5, 0.5, 0.5,
1, -4.121285, -6.217728, 1, 1.5, 0.5, 0.5,
1, -4.121285, -6.217728, 0, 1.5, 0.5, 0.5,
2, -4.121285, -6.217728, 0, -0.5, 0.5, 0.5,
2, -4.121285, -6.217728, 1, -0.5, 0.5, 0.5,
2, -4.121285, -6.217728, 1, 1.5, 0.5, 0.5,
2, -4.121285, -6.217728, 0, 1.5, 0.5, 0.5,
3, -4.121285, -6.217728, 0, -0.5, 0.5, 0.5,
3, -4.121285, -6.217728, 1, -0.5, 0.5, 0.5,
3, -4.121285, -6.217728, 1, 1.5, 0.5, 0.5,
3, -4.121285, -6.217728, 0, 1.5, 0.5, 0.5
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
-3.085455, -3, -5.380342,
-3.085455, 2, -5.380342,
-3.085455, -3, -5.380342,
-3.253126, -3, -5.659471,
-3.085455, -2, -5.380342,
-3.253126, -2, -5.659471,
-3.085455, -1, -5.380342,
-3.253126, -1, -5.659471,
-3.085455, 0, -5.380342,
-3.253126, 0, -5.659471,
-3.085455, 1, -5.380342,
-3.253126, 1, -5.659471,
-3.085455, 2, -5.380342,
-3.253126, 2, -5.659471
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
-3.588468, -3, -6.217728, 0, -0.5, 0.5, 0.5,
-3.588468, -3, -6.217728, 1, -0.5, 0.5, 0.5,
-3.588468, -3, -6.217728, 1, 1.5, 0.5, 0.5,
-3.588468, -3, -6.217728, 0, 1.5, 0.5, 0.5,
-3.588468, -2, -6.217728, 0, -0.5, 0.5, 0.5,
-3.588468, -2, -6.217728, 1, -0.5, 0.5, 0.5,
-3.588468, -2, -6.217728, 1, 1.5, 0.5, 0.5,
-3.588468, -2, -6.217728, 0, 1.5, 0.5, 0.5,
-3.588468, -1, -6.217728, 0, -0.5, 0.5, 0.5,
-3.588468, -1, -6.217728, 1, -0.5, 0.5, 0.5,
-3.588468, -1, -6.217728, 1, 1.5, 0.5, 0.5,
-3.588468, -1, -6.217728, 0, 1.5, 0.5, 0.5,
-3.588468, 0, -6.217728, 0, -0.5, 0.5, 0.5,
-3.588468, 0, -6.217728, 1, -0.5, 0.5, 0.5,
-3.588468, 0, -6.217728, 1, 1.5, 0.5, 0.5,
-3.588468, 0, -6.217728, 0, 1.5, 0.5, 0.5,
-3.588468, 1, -6.217728, 0, -0.5, 0.5, 0.5,
-3.588468, 1, -6.217728, 1, -0.5, 0.5, 0.5,
-3.588468, 1, -6.217728, 1, 1.5, 0.5, 0.5,
-3.588468, 1, -6.217728, 0, 1.5, 0.5, 0.5,
-3.588468, 2, -6.217728, 0, -0.5, 0.5, 0.5,
-3.588468, 2, -6.217728, 1, -0.5, 0.5, 0.5,
-3.588468, 2, -6.217728, 1, 1.5, 0.5, 0.5,
-3.588468, 2, -6.217728, 0, 1.5, 0.5, 0.5
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
-3.085455, -3.628258, -4,
-3.085455, -3.628258, 4,
-3.085455, -3.628258, -4,
-3.253126, -3.7926, -4,
-3.085455, -3.628258, -2,
-3.253126, -3.7926, -2,
-3.085455, -3.628258, 0,
-3.253126, -3.7926, 0,
-3.085455, -3.628258, 2,
-3.253126, -3.7926, 2,
-3.085455, -3.628258, 4,
-3.253126, -3.7926, 4
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
-3.588468, -4.121285, -4, 0, -0.5, 0.5, 0.5,
-3.588468, -4.121285, -4, 1, -0.5, 0.5, 0.5,
-3.588468, -4.121285, -4, 1, 1.5, 0.5, 0.5,
-3.588468, -4.121285, -4, 0, 1.5, 0.5, 0.5,
-3.588468, -4.121285, -2, 0, -0.5, 0.5, 0.5,
-3.588468, -4.121285, -2, 1, -0.5, 0.5, 0.5,
-3.588468, -4.121285, -2, 1, 1.5, 0.5, 0.5,
-3.588468, -4.121285, -2, 0, 1.5, 0.5, 0.5,
-3.588468, -4.121285, 0, 0, -0.5, 0.5, 0.5,
-3.588468, -4.121285, 0, 1, -0.5, 0.5, 0.5,
-3.588468, -4.121285, 0, 1, 1.5, 0.5, 0.5,
-3.588468, -4.121285, 0, 0, 1.5, 0.5, 0.5,
-3.588468, -4.121285, 2, 0, -0.5, 0.5, 0.5,
-3.588468, -4.121285, 2, 1, -0.5, 0.5, 0.5,
-3.588468, -4.121285, 2, 1, 1.5, 0.5, 0.5,
-3.588468, -4.121285, 2, 0, 1.5, 0.5, 0.5,
-3.588468, -4.121285, 4, 0, -0.5, 0.5, 0.5,
-3.588468, -4.121285, 4, 1, -0.5, 0.5, 0.5,
-3.588468, -4.121285, 4, 1, 1.5, 0.5, 0.5,
-3.588468, -4.121285, 4, 0, 1.5, 0.5, 0.5
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
-3.085455, -3.628258, -5.380342,
-3.085455, 2.94544, -5.380342,
-3.085455, -3.628258, 5.784799,
-3.085455, 2.94544, 5.784799,
-3.085455, -3.628258, -5.380342,
-3.085455, -3.628258, 5.784799,
-3.085455, 2.94544, -5.380342,
-3.085455, 2.94544, 5.784799,
-3.085455, -3.628258, -5.380342,
3.621383, -3.628258, -5.380342,
-3.085455, -3.628258, 5.784799,
3.621383, -3.628258, 5.784799,
-3.085455, 2.94544, -5.380342,
3.621383, 2.94544, -5.380342,
-3.085455, 2.94544, 5.784799,
3.621383, 2.94544, 5.784799,
3.621383, -3.628258, -5.380342,
3.621383, 2.94544, -5.380342,
3.621383, -3.628258, 5.784799,
3.621383, 2.94544, 5.784799,
3.621383, -3.628258, -5.380342,
3.621383, -3.628258, 5.784799,
3.621383, 2.94544, -5.380342,
3.621383, 2.94544, 5.784799
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
var radius = 7.790547;
var distance = 34.66102;
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
mvMatrix.translate( -0.267964, 0.3414092, -0.2022283 );
mvMatrix.scale( 1.255926, 1.281363, 0.7544277 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.66102);
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
Ethanol<-read.table("Ethanol.xyz")
```

```
## Error in read.table("Ethanol.xyz"): no lines available in input
```

```r
x<-Ethanol$V2
```

```
## Error in eval(expr, envir, enclos): object 'Ethanol' not found
```

```r
y<-Ethanol$V3
```

```
## Error in eval(expr, envir, enclos): object 'Ethanol' not found
```

```r
z<-Ethanol$V4
```

```
## Error in eval(expr, envir, enclos): object 'Ethanol' not found
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
-2.987783, -0.5703678, -2.536712, 0, 0, 1, 1, 1,
-2.909219, -0.07784317, 0.6451421, 1, 0, 0, 1, 1,
-2.839187, -0.2876269, -1.538384, 1, 0, 0, 1, 1,
-2.833838, 0.3664449, -1.26077, 1, 0, 0, 1, 1,
-2.778821, -1.287831, -2.99827, 1, 0, 0, 1, 1,
-2.754246, -0.3425947, -0.6424534, 1, 0, 0, 1, 1,
-2.739432, 0.5653512, -1.08461, 0, 0, 0, 1, 1,
-2.7067, 0.9812309, -2.105685, 0, 0, 0, 1, 1,
-2.671536, 0.07171573, -0.5819798, 0, 0, 0, 1, 1,
-2.566937, 1.056332, -2.202087, 0, 0, 0, 1, 1,
-2.521682, 1.15459, -0.4044083, 0, 0, 0, 1, 1,
-2.424563, 0.7128408, -3.403131, 0, 0, 0, 1, 1,
-2.32834, -1.009135, -2.61567, 0, 0, 0, 1, 1,
-2.263894, -0.2185203, -0.8803782, 1, 1, 1, 1, 1,
-2.155183, 0.1100913, -1.539055, 1, 1, 1, 1, 1,
-2.154698, -0.4645703, -0.8288937, 1, 1, 1, 1, 1,
-2.145772, 2.14749, -2.113996, 1, 1, 1, 1, 1,
-2.141497, -0.03101495, -0.5102382, 1, 1, 1, 1, 1,
-2.141367, -0.2581943, -1.330703, 1, 1, 1, 1, 1,
-2.137364, 0.9695797, -0.4201583, 1, 1, 1, 1, 1,
-2.125446, 0.2750378, -0.02264568, 1, 1, 1, 1, 1,
-2.066354, -0.4593281, -1.733381, 1, 1, 1, 1, 1,
-2.04761, 0.2817363, -3.021538, 1, 1, 1, 1, 1,
-2.032243, -0.8438159, -0.3870538, 1, 1, 1, 1, 1,
-2.023368, 1.053743, -0.2216973, 1, 1, 1, 1, 1,
-1.942634, 0.3040499, -0.1183734, 1, 1, 1, 1, 1,
-1.911213, -0.2652179, -2.784154, 1, 1, 1, 1, 1,
-1.867458, -2.123296, -2.834541, 1, 1, 1, 1, 1,
-1.861034, -0.7063425, -2.425295, 0, 0, 1, 1, 1,
-1.860594, -0.06938287, -2.451604, 1, 0, 0, 1, 1,
-1.849599, 0.227853, -0.5097907, 1, 0, 0, 1, 1,
-1.847773, 0.2510815, 0.5862207, 1, 0, 0, 1, 1,
-1.838481, -1.074819, -1.461991, 1, 0, 0, 1, 1,
-1.832928, -1.898307, -2.6773, 1, 0, 0, 1, 1,
-1.816429, 0.4036559, -0.09969064, 0, 0, 0, 1, 1,
-1.815365, 0.05453873, 0.01520136, 0, 0, 0, 1, 1,
-1.792301, -0.3953102, 0.01652847, 0, 0, 0, 1, 1,
-1.781944, 0.9468704, -0.2799354, 0, 0, 0, 1, 1,
-1.778784, 1.516937, 0.6611337, 0, 0, 0, 1, 1,
-1.756681, 0.3777673, 0.3101937, 0, 0, 0, 1, 1,
-1.755799, -0.4354692, -1.078421, 0, 0, 0, 1, 1,
-1.745291, -1.094632, -1.809247, 1, 1, 1, 1, 1,
-1.744888, 0.1160543, -1.534907, 1, 1, 1, 1, 1,
-1.732895, -0.8665466, -2.688691, 1, 1, 1, 1, 1,
-1.728633, 0.6957073, -2.817798, 1, 1, 1, 1, 1,
-1.725487, 1.545803, -1.907492, 1, 1, 1, 1, 1,
-1.719477, -0.1221397, -1.117044, 1, 1, 1, 1, 1,
-1.714009, -0.8878104, -2.04527, 1, 1, 1, 1, 1,
-1.7113, -0.2053916, -1.501938, 1, 1, 1, 1, 1,
-1.695906, 0.8910065, 0.6124277, 1, 1, 1, 1, 1,
-1.685993, -1.245283, -1.846854, 1, 1, 1, 1, 1,
-1.675252, -0.6887012, -1.998638, 1, 1, 1, 1, 1,
-1.645613, 0.2770757, -2.930622, 1, 1, 1, 1, 1,
-1.640905, -1.256135, -0.7988046, 1, 1, 1, 1, 1,
-1.634296, 1.151057, 1.483457, 1, 1, 1, 1, 1,
-1.630561, 1.334546, -0.0111625, 1, 1, 1, 1, 1,
-1.617992, -0.2894452, -0.7464204, 0, 0, 1, 1, 1,
-1.6141, -0.4176098, -1.36711, 1, 0, 0, 1, 1,
-1.608484, 0.09587934, -2.704135, 1, 0, 0, 1, 1,
-1.604566, 0.04100375, -2.124128, 1, 0, 0, 1, 1,
-1.602126, 1.16545, 1.06499, 1, 0, 0, 1, 1,
-1.600032, -1.055941, -2.055515, 1, 0, 0, 1, 1,
-1.567077, 1.924875, -0.9534707, 0, 0, 0, 1, 1,
-1.56313, 1.253483, -2.404812, 0, 0, 0, 1, 1,
-1.55538, -0.7753153, -2.802474, 0, 0, 0, 1, 1,
-1.506508, 0.6820773, -1.076627, 0, 0, 0, 1, 1,
-1.49917, -0.1811029, -0.8488058, 0, 0, 0, 1, 1,
-1.498856, 0.6660917, -0.8738791, 0, 0, 0, 1, 1,
-1.49456, -0.2991774, -1.451464, 0, 0, 0, 1, 1,
-1.494164, -0.9644307, -2.079295, 1, 1, 1, 1, 1,
-1.485474, -0.6121887, -1.531475, 1, 1, 1, 1, 1,
-1.475519, -0.3952263, -1.016217, 1, 1, 1, 1, 1,
-1.474962, 0.5335219, 0.07386174, 1, 1, 1, 1, 1,
-1.463791, 0.4494755, 0.458299, 1, 1, 1, 1, 1,
-1.46028, -1.815644, -3.06478, 1, 1, 1, 1, 1,
-1.459393, -0.5811016, -0.3113261, 1, 1, 1, 1, 1,
-1.45061, -0.2378643, -1.723834, 1, 1, 1, 1, 1,
-1.436735, 1.207927, 0.6567194, 1, 1, 1, 1, 1,
-1.436173, -0.01786981, -1.088586, 1, 1, 1, 1, 1,
-1.425485, -1.03192, -1.903886, 1, 1, 1, 1, 1,
-1.422252, 1.902091, -1.371199, 1, 1, 1, 1, 1,
-1.409958, -0.2272138, -3.699275, 1, 1, 1, 1, 1,
-1.40549, -0.3076128, -0.4301434, 1, 1, 1, 1, 1,
-1.402558, 1.944543, 1.019768, 1, 1, 1, 1, 1,
-1.388836, -1.885652, -0.5504587, 0, 0, 1, 1, 1,
-1.384011, 1.302991, -2.365676, 1, 0, 0, 1, 1,
-1.379422, 0.7045303, -1.269352, 1, 0, 0, 1, 1,
-1.376169, 0.8392947, -2.384631, 1, 0, 0, 1, 1,
-1.375347, 0.6082663, -1.471211, 1, 0, 0, 1, 1,
-1.368009, 0.7598392, -2.165729, 1, 0, 0, 1, 1,
-1.366162, 0.6901595, -0.09587291, 0, 0, 0, 1, 1,
-1.366051, 1.236432, 0.7398698, 0, 0, 0, 1, 1,
-1.365594, 0.1094673, -0.8037518, 0, 0, 0, 1, 1,
-1.354636, -0.1250714, -0.9251176, 0, 0, 0, 1, 1,
-1.35024, -0.3711294, -1.826667, 0, 0, 0, 1, 1,
-1.337593, -0.2889731, -3.499695, 0, 0, 0, 1, 1,
-1.334705, -0.7669693, -0.6258319, 0, 0, 0, 1, 1,
-1.332118, -1.304886, -2.246836, 1, 1, 1, 1, 1,
-1.318854, 0.7659315, -1.375684, 1, 1, 1, 1, 1,
-1.317699, 1.004984, -1.51995, 1, 1, 1, 1, 1,
-1.310274, -0.005777206, -1.653347, 1, 1, 1, 1, 1,
-1.310227, 1.413529, -2.074892, 1, 1, 1, 1, 1,
-1.309406, -0.164985, -1.834221, 1, 1, 1, 1, 1,
-1.305512, -0.06298152, -2.064922, 1, 1, 1, 1, 1,
-1.302617, -1.139933, -3.333599, 1, 1, 1, 1, 1,
-1.297219, -1.465711, -4.317298, 1, 1, 1, 1, 1,
-1.284798, 2.179849, 0.4617714, 1, 1, 1, 1, 1,
-1.269652, 1.424315, 0.4277751, 1, 1, 1, 1, 1,
-1.265108, 0.8390812, -1.903707, 1, 1, 1, 1, 1,
-1.263625, 0.3721813, -0.4646031, 1, 1, 1, 1, 1,
-1.258744, -0.08664834, -3.344154, 1, 1, 1, 1, 1,
-1.249975, -0.7381006, -1.813913, 1, 1, 1, 1, 1,
-1.245019, -0.1299691, -2.656883, 0, 0, 1, 1, 1,
-1.236442, -0.6583969, -2.625256, 1, 0, 0, 1, 1,
-1.223781, -0.4737663, -2.727978, 1, 0, 0, 1, 1,
-1.221578, -0.1908721, -2.845147, 1, 0, 0, 1, 1,
-1.217949, -1.171047, -1.507422, 1, 0, 0, 1, 1,
-1.213121, -0.7248947, -2.051551, 1, 0, 0, 1, 1,
-1.202831, -0.2388707, -2.205677, 0, 0, 0, 1, 1,
-1.198004, -2.236311, -2.17461, 0, 0, 0, 1, 1,
-1.192862, 0.4551381, 0.178194, 0, 0, 0, 1, 1,
-1.192265, 0.1374716, -1.39315, 0, 0, 0, 1, 1,
-1.186177, -1.544736, -2.437243, 0, 0, 0, 1, 1,
-1.18564, 1.333444, -1.920251, 0, 0, 0, 1, 1,
-1.164175, -0.300976, -1.190769, 0, 0, 0, 1, 1,
-1.158154, 0.03817024, -0.160652, 1, 1, 1, 1, 1,
-1.157509, -1.758573, -1.462268, 1, 1, 1, 1, 1,
-1.15619, 1.788151, -1.453804, 1, 1, 1, 1, 1,
-1.153762, 0.4277824, -0.1818785, 1, 1, 1, 1, 1,
-1.152113, 0.1358226, -1.670223, 1, 1, 1, 1, 1,
-1.148565, -0.5932469, -2.549062, 1, 1, 1, 1, 1,
-1.146221, -0.5193475, -2.235377, 1, 1, 1, 1, 1,
-1.128646, 0.7767966, -1.057784, 1, 1, 1, 1, 1,
-1.124589, -0.8332203, -3.337252, 1, 1, 1, 1, 1,
-1.121593, 0.05408848, -3.091249, 1, 1, 1, 1, 1,
-1.119373, -1.736735, -2.249273, 1, 1, 1, 1, 1,
-1.113524, -0.05438691, -2.163072, 1, 1, 1, 1, 1,
-1.112417, 0.9075021, -0.5352038, 1, 1, 1, 1, 1,
-1.097446, 0.3583552, -0.2139437, 1, 1, 1, 1, 1,
-1.09295, -0.6583973, -4.331619, 1, 1, 1, 1, 1,
-1.089858, -0.449874, -1.962266, 0, 0, 1, 1, 1,
-1.079305, -1.265274, -1.860469, 1, 0, 0, 1, 1,
-1.077571, -1.400047, -2.576456, 1, 0, 0, 1, 1,
-1.075137, -1.16588, -3.703025, 1, 0, 0, 1, 1,
-1.069741, 0.3792771, -0.2499589, 1, 0, 0, 1, 1,
-1.067025, -0.3240052, -0.9151641, 1, 0, 0, 1, 1,
-1.062465, -0.7678236, -2.994974, 0, 0, 0, 1, 1,
-1.060757, -1.254075, -2.986621, 0, 0, 0, 1, 1,
-1.058822, -0.7548019, -1.316026, 0, 0, 0, 1, 1,
-1.057086, 1.691793, -0.9614069, 0, 0, 0, 1, 1,
-1.056416, 0.2412255, -0.6404219, 0, 0, 0, 1, 1,
-1.054297, 0.4846429, -2.168015, 0, 0, 0, 1, 1,
-1.047519, 0.4899662, -1.027752, 0, 0, 0, 1, 1,
-1.046932, -0.4132586, -2.069607, 1, 1, 1, 1, 1,
-1.045996, 0.4036388, -1.894931, 1, 1, 1, 1, 1,
-1.04208, 1.736512, 0.7338256, 1, 1, 1, 1, 1,
-1.036413, 0.3081159, -1.764967, 1, 1, 1, 1, 1,
-1.020273, -1.912359, -4.230728, 1, 1, 1, 1, 1,
-1.01277, 0.2321433, -2.912683, 1, 1, 1, 1, 1,
-1.010531, 2.849706, -0.7938884, 1, 1, 1, 1, 1,
-1.007395, -0.4137771, -2.884524, 1, 1, 1, 1, 1,
-0.9990372, -1.677049, -2.42557, 1, 1, 1, 1, 1,
-0.9984846, -0.7889533, -1.046616, 1, 1, 1, 1, 1,
-0.9946583, 1.388513, -2.477216, 1, 1, 1, 1, 1,
-0.994189, 0.8370254, -0.354623, 1, 1, 1, 1, 1,
-0.9877416, 1.115566, -0.8115578, 1, 1, 1, 1, 1,
-0.9815718, 0.1220303, -1.943272, 1, 1, 1, 1, 1,
-0.9788787, 0.6552203, -1.347556, 1, 1, 1, 1, 1,
-0.9767649, -1.596164, -2.54012, 0, 0, 1, 1, 1,
-0.9704313, 0.6499003, -0.7155299, 1, 0, 0, 1, 1,
-0.9671533, 0.1249489, -2.044395, 1, 0, 0, 1, 1,
-0.9671199, -0.9584734, -1.799671, 1, 0, 0, 1, 1,
-0.9666047, -0.4032576, -2.687697, 1, 0, 0, 1, 1,
-0.9650061, -0.8867731, -2.990968, 1, 0, 0, 1, 1,
-0.9628398, 1.164411, -0.8110662, 0, 0, 0, 1, 1,
-0.9613603, 0.08222625, -0.8250647, 0, 0, 0, 1, 1,
-0.9526278, -1.184121, -2.724931, 0, 0, 0, 1, 1,
-0.9516833, -1.53881, -1.45387, 0, 0, 0, 1, 1,
-0.9488468, 0.08844253, 0.317105, 0, 0, 0, 1, 1,
-0.9376492, -1.092329, -1.716933, 0, 0, 0, 1, 1,
-0.9310893, -0.9839997, -2.245032, 0, 0, 0, 1, 1,
-0.9302166, -0.3120613, -3.244516, 1, 1, 1, 1, 1,
-0.9291255, -1.145877, -2.189829, 1, 1, 1, 1, 1,
-0.9263653, -0.9230853, 0.7208831, 1, 1, 1, 1, 1,
-0.9247348, -0.7161512, -2.935209, 1, 1, 1, 1, 1,
-0.9212667, 0.3592825, -1.297501, 1, 1, 1, 1, 1,
-0.9212257, 0.6762751, -0.2154218, 1, 1, 1, 1, 1,
-0.9154339, 0.9002084, -0.9422741, 1, 1, 1, 1, 1,
-0.9081253, 0.5759108, -3.761605, 1, 1, 1, 1, 1,
-0.9003126, 1.130445, -0.9647202, 1, 1, 1, 1, 1,
-0.8996878, -0.1546331, -1.010255, 1, 1, 1, 1, 1,
-0.8827037, 0.0744205, -1.980983, 1, 1, 1, 1, 1,
-0.8743841, -0.7595701, -2.18895, 1, 1, 1, 1, 1,
-0.8723037, 1.144976, -0.9489793, 1, 1, 1, 1, 1,
-0.8716321, 1.252627, -0.8372125, 1, 1, 1, 1, 1,
-0.8697042, 0.9754211, -1.288574, 1, 1, 1, 1, 1,
-0.8672855, -0.2968639, -1.184197, 0, 0, 1, 1, 1,
-0.8668155, 1.067131, 0.5629529, 1, 0, 0, 1, 1,
-0.8659819, -0.5209697, -3.395106, 1, 0, 0, 1, 1,
-0.8638507, 0.5637338, -1.825882, 1, 0, 0, 1, 1,
-0.8581145, -1.761745, -3.714953, 1, 0, 0, 1, 1,
-0.854086, 0.7709971, -0.01201347, 1, 0, 0, 1, 1,
-0.8531648, 1.53607, 0.3452795, 0, 0, 0, 1, 1,
-0.8496549, 1.08751, -0.8874961, 0, 0, 0, 1, 1,
-0.8477776, 0.3880699, -1.689682, 0, 0, 0, 1, 1,
-0.8464314, -1.693675, -3.213036, 0, 0, 0, 1, 1,
-0.8461559, -1.840398, -4.257582, 0, 0, 0, 1, 1,
-0.8437739, 1.084864, -0.06965499, 0, 0, 0, 1, 1,
-0.8375435, 0.08424024, -2.274138, 0, 0, 0, 1, 1,
-0.8373144, -0.01195342, 0.2894052, 1, 1, 1, 1, 1,
-0.8361015, 0.1212813, -0.7968175, 1, 1, 1, 1, 1,
-0.8331236, 0.05313953, -1.62946, 1, 1, 1, 1, 1,
-0.8331124, -0.3691381, -0.06809928, 1, 1, 1, 1, 1,
-0.8251575, 0.9385556, 0.691982, 1, 1, 1, 1, 1,
-0.8245161, -0.6771949, -1.477513, 1, 1, 1, 1, 1,
-0.8178178, 0.1113986, -2.620322, 1, 1, 1, 1, 1,
-0.8158491, 1.553816, -0.1564853, 1, 1, 1, 1, 1,
-0.8124346, 0.4516945, -0.9760346, 1, 1, 1, 1, 1,
-0.8116369, 0.6498793, -0.5847113, 1, 1, 1, 1, 1,
-0.8105202, -2.131089, -2.601373, 1, 1, 1, 1, 1,
-0.8058845, 0.3191261, -1.86666, 1, 1, 1, 1, 1,
-0.7915474, 1.036656, -0.6468639, 1, 1, 1, 1, 1,
-0.7907421, 0.2794848, -0.7413568, 1, 1, 1, 1, 1,
-0.7813275, -0.6269871, -1.883117, 1, 1, 1, 1, 1,
-0.780852, -0.03032044, -1.668202, 0, 0, 1, 1, 1,
-0.779784, 0.605188, -0.6791126, 1, 0, 0, 1, 1,
-0.7778376, 0.6641127, -0.4603822, 1, 0, 0, 1, 1,
-0.7769937, -0.665131, -2.863727, 1, 0, 0, 1, 1,
-0.7714723, 2.031484, 0.3548847, 1, 0, 0, 1, 1,
-0.7713417, 0.1701038, -2.090601, 1, 0, 0, 1, 1,
-0.7683317, 0.4042535, -1.942739, 0, 0, 0, 1, 1,
-0.7681722, 0.9944001, 0.6997483, 0, 0, 0, 1, 1,
-0.7671773, 0.822854, -0.8813409, 0, 0, 0, 1, 1,
-0.7665336, -0.3341798, -2.658535, 0, 0, 0, 1, 1,
-0.7614002, 0.1446983, -0.8237356, 0, 0, 0, 1, 1,
-0.7593189, -0.4268799, -3.204627, 0, 0, 0, 1, 1,
-0.7537434, 1.639223, -1.241439, 0, 0, 0, 1, 1,
-0.728501, 0.4743721, -0.9573654, 1, 1, 1, 1, 1,
-0.7221053, -0.5559468, -5.217743, 1, 1, 1, 1, 1,
-0.7204152, 1.59212, -1.094783, 1, 1, 1, 1, 1,
-0.7202368, -0.1010424, -0.8604107, 1, 1, 1, 1, 1,
-0.7191983, -1.250691, -2.171685, 1, 1, 1, 1, 1,
-0.714939, -1.363932, -0.8755389, 1, 1, 1, 1, 1,
-0.7108585, -1.980514, -1.800188, 1, 1, 1, 1, 1,
-0.7104467, -0.3742244, -3.746696, 1, 1, 1, 1, 1,
-0.7071655, 0.7902998, -0.6944883, 1, 1, 1, 1, 1,
-0.7048613, 0.6607068, -0.8955485, 1, 1, 1, 1, 1,
-0.7042948, 0.3647751, -1.86262, 1, 1, 1, 1, 1,
-0.7021794, 1.104306, 0.6083508, 1, 1, 1, 1, 1,
-0.7004067, -0.8871772, -0.7586797, 1, 1, 1, 1, 1,
-0.6991763, 0.7377383, -1.02071, 1, 1, 1, 1, 1,
-0.698217, -0.08778918, -0.4852335, 1, 1, 1, 1, 1,
-0.6978502, -0.6155058, -1.647366, 0, 0, 1, 1, 1,
-0.6945893, 0.4179647, -0.4932386, 1, 0, 0, 1, 1,
-0.689833, 1.132023, -0.463048, 1, 0, 0, 1, 1,
-0.6814487, -0.1029721, -2.331362, 1, 0, 0, 1, 1,
-0.6799983, -0.6589977, -1.370845, 1, 0, 0, 1, 1,
-0.6727044, 1.5092, -0.7073901, 1, 0, 0, 1, 1,
-0.6697738, 0.976438, 0.4254895, 0, 0, 0, 1, 1,
-0.6627008, -0.2650546, -1.113757, 0, 0, 0, 1, 1,
-0.6477152, -1.064277, -2.549369, 0, 0, 0, 1, 1,
-0.6463513, -0.1223606, -2.220243, 0, 0, 0, 1, 1,
-0.6402577, -0.5990572, -2.472995, 0, 0, 0, 1, 1,
-0.6337863, -1.775306, -1.031645, 0, 0, 0, 1, 1,
-0.6333163, -1.195164, -3.02109, 0, 0, 0, 1, 1,
-0.6297705, -1.052534, -3.717804, 1, 1, 1, 1, 1,
-0.6242837, 1.141557, -1.225702, 1, 1, 1, 1, 1,
-0.6229073, 0.07501379, 0.7845238, 1, 1, 1, 1, 1,
-0.620824, -1.669737, -2.717299, 1, 1, 1, 1, 1,
-0.6130459, 2.103503, -0.9802169, 1, 1, 1, 1, 1,
-0.6065647, 1.015229, -2.813099, 1, 1, 1, 1, 1,
-0.6034063, -0.2732936, -3.110972, 1, 1, 1, 1, 1,
-0.601849, -0.1218325, -0.5190663, 1, 1, 1, 1, 1,
-0.6000333, -0.7082399, -2.272882, 1, 1, 1, 1, 1,
-0.5971097, -0.6201779, -2.504191, 1, 1, 1, 1, 1,
-0.5947594, 2.120986, 1.769849, 1, 1, 1, 1, 1,
-0.5942754, 0.1679935, -0.9952083, 1, 1, 1, 1, 1,
-0.5937961, 0.8804423, -0.2242902, 1, 1, 1, 1, 1,
-0.5850853, -2.50157, -4.837847, 1, 1, 1, 1, 1,
-0.5850133, -0.5988832, -2.704663, 1, 1, 1, 1, 1,
-0.5822981, 1.068988, 0.4954014, 0, 0, 1, 1, 1,
-0.5800616, 0.06271767, -1.716324, 1, 0, 0, 1, 1,
-0.5776861, 1.176867, -0.8001811, 1, 0, 0, 1, 1,
-0.5748881, -0.4981823, -3.065526, 1, 0, 0, 1, 1,
-0.5662013, 0.2335851, -1.467251, 1, 0, 0, 1, 1,
-0.5583679, 1.555568, -1.715895, 1, 0, 0, 1, 1,
-0.5573108, 0.9358675, 0.1880038, 0, 0, 0, 1, 1,
-0.5536892, 1.295265, -2.585281, 0, 0, 0, 1, 1,
-0.5536826, -0.720867, -2.617241, 0, 0, 0, 1, 1,
-0.5524563, -0.5569794, -1.518349, 0, 0, 0, 1, 1,
-0.550786, 0.5926183, -1.311902, 0, 0, 0, 1, 1,
-0.5481918, 0.1671269, -0.7456885, 0, 0, 0, 1, 1,
-0.5450151, 0.1529276, -0.261876, 0, 0, 0, 1, 1,
-0.544601, 0.8554127, -3.283476, 1, 1, 1, 1, 1,
-0.5407102, -0.129763, -1.60535, 1, 1, 1, 1, 1,
-0.5401334, -1.642906, -2.232601, 1, 1, 1, 1, 1,
-0.5354632, -0.04764112, -1.276775, 1, 1, 1, 1, 1,
-0.5299813, 0.400867, -1.99645, 1, 1, 1, 1, 1,
-0.5297385, -0.07170848, -2.353358, 1, 1, 1, 1, 1,
-0.5289863, -0.1344156, -0.8263859, 1, 1, 1, 1, 1,
-0.5286546, -0.4881205, -1.034632, 1, 1, 1, 1, 1,
-0.5263668, 0.2553667, -1.495699, 1, 1, 1, 1, 1,
-0.5234236, 1.287736, -2.171645, 1, 1, 1, 1, 1,
-0.5219137, 0.2092646, 1.890595, 1, 1, 1, 1, 1,
-0.5193319, 1.654616, -0.8453901, 1, 1, 1, 1, 1,
-0.5162593, 0.8837376, 1.056476, 1, 1, 1, 1, 1,
-0.5044957, 1.102438, -0.6244754, 1, 1, 1, 1, 1,
-0.4977283, 2.724777, -0.7724977, 1, 1, 1, 1, 1,
-0.495919, -1.031878, -2.225883, 0, 0, 1, 1, 1,
-0.4936693, -0.815432, -2.021408, 1, 0, 0, 1, 1,
-0.4927914, 0.3472739, -2.067006, 1, 0, 0, 1, 1,
-0.4915775, 0.7392935, -0.4716183, 1, 0, 0, 1, 1,
-0.4885956, 2.083225, -0.1501596, 1, 0, 0, 1, 1,
-0.487325, 1.362631, 0.1652644, 1, 0, 0, 1, 1,
-0.4857778, -0.1238529, -2.581037, 0, 0, 0, 1, 1,
-0.4814122, 0.141937, -3.500277, 0, 0, 0, 1, 1,
-0.4782658, 0.9125654, -1.0604, 0, 0, 0, 1, 1,
-0.477172, 0.01186876, -2.346121, 0, 0, 0, 1, 1,
-0.4731446, -0.2463003, -0.8742455, 0, 0, 0, 1, 1,
-0.469045, -0.85405, -4.836244, 0, 0, 0, 1, 1,
-0.4679324, 0.5956707, -1.692261, 0, 0, 0, 1, 1,
-0.4677938, 0.06076295, -1.44892, 1, 1, 1, 1, 1,
-0.4669963, 0.4374698, 0.2719235, 1, 1, 1, 1, 1,
-0.4654781, -0.6422539, -3.493447, 1, 1, 1, 1, 1,
-0.4633786, 1.311227, -1.336824, 1, 1, 1, 1, 1,
-0.4616371, 2.072422, -0.1786435, 1, 1, 1, 1, 1,
-0.4571863, 0.3463454, -1.367403, 1, 1, 1, 1, 1,
-0.4556666, 1.467937, -1.704786, 1, 1, 1, 1, 1,
-0.4548019, -1.348521, -2.354818, 1, 1, 1, 1, 1,
-0.4547643, -0.6021304, -4.958157, 1, 1, 1, 1, 1,
-0.4529617, -0.284326, -0.9594374, 1, 1, 1, 1, 1,
-0.4526758, 0.701195, 0.7149549, 1, 1, 1, 1, 1,
-0.452328, 0.3407436, -1.495269, 1, 1, 1, 1, 1,
-0.4492354, -0.4878167, -2.769604, 1, 1, 1, 1, 1,
-0.4415175, 2.099308, -2.114279, 1, 1, 1, 1, 1,
-0.4382477, -0.8836141, -2.122317, 1, 1, 1, 1, 1,
-0.437508, -0.5448956, -2.118537, 0, 0, 1, 1, 1,
-0.4372285, -1.132271, -1.20685, 1, 0, 0, 1, 1,
-0.435765, -1.855055, -3.530819, 1, 0, 0, 1, 1,
-0.4350909, 0.5641001, -3.301194, 1, 0, 0, 1, 1,
-0.4311614, 1.06479, -0.8255937, 1, 0, 0, 1, 1,
-0.4278853, 0.8010172, 0.3457054, 1, 0, 0, 1, 1,
-0.42567, -0.2608091, -1.145013, 0, 0, 0, 1, 1,
-0.4204289, 0.2609085, -2.793389, 0, 0, 0, 1, 1,
-0.4170383, -0.3398783, -2.167696, 0, 0, 0, 1, 1,
-0.4145309, 1.008891, 0.4814289, 0, 0, 0, 1, 1,
-0.4118616, 0.4750366, 0.7728953, 0, 0, 0, 1, 1,
-0.4110456, 0.984434, 2.854439, 0, 0, 0, 1, 1,
-0.4096774, 1.000885, -0.7641493, 0, 0, 0, 1, 1,
-0.4012157, 0.8665346, -0.786777, 1, 1, 1, 1, 1,
-0.4005699, 1.418321, -0.5730811, 1, 1, 1, 1, 1,
-0.3973847, 1.477922, 1.109036, 1, 1, 1, 1, 1,
-0.3890274, 0.4145704, -1.758291, 1, 1, 1, 1, 1,
-0.3884252, 0.1658144, 0.1945037, 1, 1, 1, 1, 1,
-0.3876685, 0.4933518, -0.8147902, 1, 1, 1, 1, 1,
-0.3843377, 1.073476, -1.372274, 1, 1, 1, 1, 1,
-0.3842762, 0.7875021, -0.4276041, 1, 1, 1, 1, 1,
-0.3791272, -0.03929283, -3.999472, 1, 1, 1, 1, 1,
-0.3789076, -0.6439136, -4.255484, 1, 1, 1, 1, 1,
-0.3743604, -1.24923, -3.655089, 1, 1, 1, 1, 1,
-0.3742863, 1.049352, -0.7012705, 1, 1, 1, 1, 1,
-0.3715788, -1.338382, -1.728676, 1, 1, 1, 1, 1,
-0.353383, 0.8734598, -0.7167089, 1, 1, 1, 1, 1,
-0.3531933, -0.2484218, -2.428948, 1, 1, 1, 1, 1,
-0.3529874, -0.7316234, -1.436474, 0, 0, 1, 1, 1,
-0.34756, -0.3005013, -2.248629, 1, 0, 0, 1, 1,
-0.3464216, -0.1895258, -0.4542022, 1, 0, 0, 1, 1,
-0.3445413, 1.133532, 0.08134872, 1, 0, 0, 1, 1,
-0.3417982, -0.1010872, -1.575181, 1, 0, 0, 1, 1,
-0.3291811, 1.18404, -2.603986, 1, 0, 0, 1, 1,
-0.3272737, 1.102484, -0.7853414, 0, 0, 0, 1, 1,
-0.3243519, -1.081589, -1.6825, 0, 0, 0, 1, 1,
-0.3238878, 0.04664407, -3.2196, 0, 0, 0, 1, 1,
-0.3238146, -0.1265858, -4.17754, 0, 0, 0, 1, 1,
-0.3195349, 0.6558695, -1.318423, 0, 0, 0, 1, 1,
-0.3186346, 2.398327, 1.198171, 0, 0, 0, 1, 1,
-0.3170348, -0.8637387, -2.897488, 0, 0, 0, 1, 1,
-0.3162634, 0.7246801, -1.381258, 1, 1, 1, 1, 1,
-0.3140253, 0.09093681, -1.63102, 1, 1, 1, 1, 1,
-0.3091051, -0.00394361, -0.8933266, 1, 1, 1, 1, 1,
-0.3084654, -0.1417603, -2.471394, 1, 1, 1, 1, 1,
-0.306751, -2.050789, -1.866709, 1, 1, 1, 1, 1,
-0.3047385, -0.01015342, -2.455314, 1, 1, 1, 1, 1,
-0.2996264, -1.433596, -2.035624, 1, 1, 1, 1, 1,
-0.2975223, 1.083971, -1.425217, 1, 1, 1, 1, 1,
-0.2946557, -1.127978, -3.876363, 1, 1, 1, 1, 1,
-0.2926849, 1.325482, -1.448696, 1, 1, 1, 1, 1,
-0.2917024, -0.5276339, -3.834909, 1, 1, 1, 1, 1,
-0.286227, 0.6803499, -0.3692546, 1, 1, 1, 1, 1,
-0.2782312, -1.885721, -1.940002, 1, 1, 1, 1, 1,
-0.2747819, -0.6713554, -3.037957, 1, 1, 1, 1, 1,
-0.2721974, -0.3512231, -0.8622622, 1, 1, 1, 1, 1,
-0.2697101, 0.5732478, -1.753449, 0, 0, 1, 1, 1,
-0.264039, -1.172298, -2.434563, 1, 0, 0, 1, 1,
-0.2640058, -0.4473524, -2.085291, 1, 0, 0, 1, 1,
-0.2594997, -0.4823228, -2.032954, 1, 0, 0, 1, 1,
-0.2575616, 0.5755137, 0.06110792, 1, 0, 0, 1, 1,
-0.2525992, -0.617618, -1.345925, 1, 0, 0, 1, 1,
-0.2446601, -0.5814571, -2.755205, 0, 0, 0, 1, 1,
-0.2436804, 0.7830291, 1.003558, 0, 0, 0, 1, 1,
-0.242559, 0.434177, 1.2291, 0, 0, 0, 1, 1,
-0.2366732, -0.4026312, -2.564493, 0, 0, 0, 1, 1,
-0.2307253, 1.045959, -0.03036199, 0, 0, 0, 1, 1,
-0.2294434, -0.9196742, -0.6578218, 0, 0, 0, 1, 1,
-0.2285282, 0.01388965, -2.17136, 0, 0, 0, 1, 1,
-0.2284891, 1.29773, 1.124015, 1, 1, 1, 1, 1,
-0.222657, 0.1117944, 0.01441519, 1, 1, 1, 1, 1,
-0.2219058, -1.25943, -3.191257, 1, 1, 1, 1, 1,
-0.2204225, -2.078144, -3.296978, 1, 1, 1, 1, 1,
-0.2196889, -1.125632, -2.409774, 1, 1, 1, 1, 1,
-0.2167753, -1.305735, -3.589532, 1, 1, 1, 1, 1,
-0.2019119, 1.000273, -1.153182, 1, 1, 1, 1, 1,
-0.2009585, 0.6009726, 0.7000981, 1, 1, 1, 1, 1,
-0.1982166, -0.03220264, 0.3886061, 1, 1, 1, 1, 1,
-0.1959599, -1.76214, -2.720222, 1, 1, 1, 1, 1,
-0.1951333, -0.2843377, -2.355069, 1, 1, 1, 1, 1,
-0.1850601, 0.1989946, -2.092557, 1, 1, 1, 1, 1,
-0.1837286, -0.2612571, -1.63009, 1, 1, 1, 1, 1,
-0.1768337, 0.4652139, 0.7181219, 1, 1, 1, 1, 1,
-0.1765081, -0.5125813, -2.172698, 1, 1, 1, 1, 1,
-0.1706976, -0.1401875, -2.702018, 0, 0, 1, 1, 1,
-0.1678444, 0.2212719, -1.801855, 1, 0, 0, 1, 1,
-0.165558, 2.074285, -1.570501, 1, 0, 0, 1, 1,
-0.1649213, 0.7143718, -1.789527, 1, 0, 0, 1, 1,
-0.1589265, 1.29668, -0.3105622, 1, 0, 0, 1, 1,
-0.1517498, 0.6564357, -1.211245, 1, 0, 0, 1, 1,
-0.1511953, -0.2760881, -3.370593, 0, 0, 0, 1, 1,
-0.1506808, 0.1365741, -1.816907, 0, 0, 0, 1, 1,
-0.1493554, -1.595792, -4.558322, 0, 0, 0, 1, 1,
-0.1470473, -0.8832431, -1.294201, 0, 0, 0, 1, 1,
-0.1457526, -0.9316271, -2.279544, 0, 0, 0, 1, 1,
-0.1451116, 1.757942, 1.265959, 0, 0, 0, 1, 1,
-0.1439532, -0.2033335, -2.41664, 0, 0, 0, 1, 1,
-0.1431982, 0.3028686, -0.5847059, 1, 1, 1, 1, 1,
-0.1427933, 0.4643525, -0.1843082, 1, 1, 1, 1, 1,
-0.1427192, -0.2509617, -4.16923, 1, 1, 1, 1, 1,
-0.1357798, 0.4201112, -0.6787431, 1, 1, 1, 1, 1,
-0.1353835, 1.332038, -0.5687537, 1, 1, 1, 1, 1,
-0.1344394, 0.4461108, -1.12388, 1, 1, 1, 1, 1,
-0.1338528, 0.4538006, -0.4852751, 1, 1, 1, 1, 1,
-0.1305865, -0.8078915, -2.494234, 1, 1, 1, 1, 1,
-0.1298291, -1.23092, -2.491281, 1, 1, 1, 1, 1,
-0.1286347, 0.03147295, -2.235198, 1, 1, 1, 1, 1,
-0.126619, 0.4988854, -0.9377955, 1, 1, 1, 1, 1,
-0.1225569, 0.4671352, -1.255355, 1, 1, 1, 1, 1,
-0.1213982, 1.073498, -1.511152, 1, 1, 1, 1, 1,
-0.1205911, 0.1819519, 0.3211896, 1, 1, 1, 1, 1,
-0.116725, 0.1651585, 1.353502, 1, 1, 1, 1, 1,
-0.1095202, -0.7495339, -3.254797, 0, 0, 1, 1, 1,
-0.1091457, -0.06369412, -1.712916, 1, 0, 0, 1, 1,
-0.1009564, -0.150393, -2.822612, 1, 0, 0, 1, 1,
-0.09632579, 0.2640685, 0.7226993, 1, 0, 0, 1, 1,
-0.09100169, -0.09325645, -2.132047, 1, 0, 0, 1, 1,
-0.09070837, -0.205332, -0.2005837, 1, 0, 0, 1, 1,
-0.09028311, 0.2132112, -0.8693626, 0, 0, 0, 1, 1,
-0.08551158, -0.2423438, -0.6798435, 0, 0, 0, 1, 1,
-0.08400696, 0.7789336, 2.679522, 0, 0, 0, 1, 1,
-0.08209469, -0.9309013, -3.063664, 0, 0, 0, 1, 1,
-0.07821116, -0.5351038, -2.325867, 0, 0, 0, 1, 1,
-0.07346196, -0.7552398, -3.591295, 0, 0, 0, 1, 1,
-0.06400612, 0.4230275, 0.7329577, 0, 0, 0, 1, 1,
-0.05809466, 0.09207086, -0.403098, 1, 1, 1, 1, 1,
-0.05779603, 1.635792, -1.855435, 1, 1, 1, 1, 1,
-0.0528441, 1.301467, -0.8683941, 1, 1, 1, 1, 1,
-0.0522134, -0.5446512, -2.547254, 1, 1, 1, 1, 1,
-0.04583519, 1.032009, 1.139455, 1, 1, 1, 1, 1,
-0.04436985, -2.230917, -3.34814, 1, 1, 1, 1, 1,
-0.0436858, 1.065078, 1.215965, 1, 1, 1, 1, 1,
-0.04321216, 0.1069957, 0.4025787, 1, 1, 1, 1, 1,
-0.04176049, -0.5505867, -4.737873, 1, 1, 1, 1, 1,
-0.03977438, 2.430725, 1.653209, 1, 1, 1, 1, 1,
-0.0378528, -0.8680992, -4.632351, 1, 1, 1, 1, 1,
-0.03628286, 0.1815059, 0.8027896, 1, 1, 1, 1, 1,
-0.03584231, 0.385506, 0.8352422, 1, 1, 1, 1, 1,
-0.03527058, 0.6883928, 0.02461084, 1, 1, 1, 1, 1,
-0.03482524, -0.4280929, -5.063904, 1, 1, 1, 1, 1,
-0.03134029, 0.391576, 0.1680519, 0, 0, 1, 1, 1,
-0.02806167, 0.8665832, -0.01323822, 1, 0, 0, 1, 1,
-0.02628918, -0.1779963, -2.994599, 1, 0, 0, 1, 1,
-0.02227343, -0.05469145, -0.5133861, 1, 0, 0, 1, 1,
-0.02187171, 1.335722, -1.058586, 1, 0, 0, 1, 1,
-0.02162267, 0.2526101, -2.687811, 1, 0, 0, 1, 1,
-0.02057492, 0.8775286, 0.4142278, 0, 0, 0, 1, 1,
-0.01843585, 0.9531076, 0.07672567, 0, 0, 0, 1, 1,
-0.01749806, 0.4953034, 0.136354, 0, 0, 0, 1, 1,
-0.01396821, -0.1706598, -4.38406, 0, 0, 0, 1, 1,
-0.007771851, 0.3822958, -0.1198407, 0, 0, 0, 1, 1,
-0.005233719, -1.231145, -3.836893, 0, 0, 0, 1, 1,
-0.00443693, 0.8632356, 0.4205274, 0, 0, 0, 1, 1,
-0.0008667725, 0.1369097, -1.323852, 1, 1, 1, 1, 1,
0.007221458, -0.1620528, 1.938821, 1, 1, 1, 1, 1,
0.0107448, 0.7548917, 0.2508265, 1, 1, 1, 1, 1,
0.01427022, -0.7665696, 3.646352, 1, 1, 1, 1, 1,
0.01793262, -0.5627844, 2.295634, 1, 1, 1, 1, 1,
0.01912573, 1.728406, -2.771701, 1, 1, 1, 1, 1,
0.02415093, 0.9826398, -0.5056955, 1, 1, 1, 1, 1,
0.02558872, -1.649256, 3.802829, 1, 1, 1, 1, 1,
0.02656266, 0.09629719, 0.1364074, 1, 1, 1, 1, 1,
0.02941788, -0.1471663, 2.374603, 1, 1, 1, 1, 1,
0.03006374, 0.7365213, 0.1452252, 1, 1, 1, 1, 1,
0.03062293, -0.4587107, 4.713432, 1, 1, 1, 1, 1,
0.03141114, 1.518555, 0.3194794, 1, 1, 1, 1, 1,
0.03865072, 0.4035839, 2.72741, 1, 1, 1, 1, 1,
0.04281246, 0.3764613, 1.257526, 1, 1, 1, 1, 1,
0.04559052, 0.4631232, 1.125305, 0, 0, 1, 1, 1,
0.04820096, -0.2080833, 1.445631, 1, 0, 0, 1, 1,
0.04873262, 1.002517, -2.118619, 1, 0, 0, 1, 1,
0.05445382, 0.7712199, 1.219386, 1, 0, 0, 1, 1,
0.05601509, 0.2311007, -0.8666099, 1, 0, 0, 1, 1,
0.05770122, 0.03251534, 0.5731199, 1, 0, 0, 1, 1,
0.06489622, 0.188661, 0.5535409, 0, 0, 0, 1, 1,
0.07183719, -0.07899902, 2.045708, 0, 0, 0, 1, 1,
0.07535975, 0.6357143, -0.5187837, 0, 0, 0, 1, 1,
0.07579453, -0.8493767, 3.106944, 0, 0, 0, 1, 1,
0.08207434, 0.1631811, -0.6456376, 0, 0, 0, 1, 1,
0.08282075, 0.003133804, 0.9086394, 0, 0, 0, 1, 1,
0.08342286, 0.6426114, -1.612895, 0, 0, 0, 1, 1,
0.08581159, -0.391072, 4.726099, 1, 1, 1, 1, 1,
0.0906029, -0.1326534, 1.607148, 1, 1, 1, 1, 1,
0.09138264, 0.2563038, 1.002301, 1, 1, 1, 1, 1,
0.09420999, -0.06568185, 2.829157, 1, 1, 1, 1, 1,
0.09550114, -0.4924922, 2.642432, 1, 1, 1, 1, 1,
0.09802756, 2.067017, -0.04081215, 1, 1, 1, 1, 1,
0.1052309, 1.177784, -0.5658311, 1, 1, 1, 1, 1,
0.1052867, 0.7517413, -0.2288689, 1, 1, 1, 1, 1,
0.1079673, 0.789618, -0.9716736, 1, 1, 1, 1, 1,
0.1103108, -0.7785639, 3.26601, 1, 1, 1, 1, 1,
0.1104026, -0.9641013, 4.016721, 1, 1, 1, 1, 1,
0.114529, -1.50104, 3.350433, 1, 1, 1, 1, 1,
0.1151721, -0.9277774, 3.396359, 1, 1, 1, 1, 1,
0.1189792, -1.169077, 4.431516, 1, 1, 1, 1, 1,
0.1199484, 2.312653, -0.009403843, 1, 1, 1, 1, 1,
0.1225547, 0.04770084, 1.233807, 0, 0, 1, 1, 1,
0.1236224, 0.8233644, 2.379037, 1, 0, 0, 1, 1,
0.1300138, 0.9556192, 1.221197, 1, 0, 0, 1, 1,
0.1313839, -1.865743, 3.80027, 1, 0, 0, 1, 1,
0.132793, -0.723576, 3.991849, 1, 0, 0, 1, 1,
0.1351512, 0.8772438, 1.977938, 1, 0, 0, 1, 1,
0.1452999, -0.227119, 3.02644, 0, 0, 0, 1, 1,
0.1510071, 0.4530884, -0.5256885, 0, 0, 0, 1, 1,
0.1515711, -0.4597613, 1.771373, 0, 0, 0, 1, 1,
0.1521021, -1.828831, 2.454657, 0, 0, 0, 1, 1,
0.1555657, -0.4636465, 3.866722, 0, 0, 0, 1, 1,
0.1556862, 0.5540947, 0.6992764, 0, 0, 0, 1, 1,
0.1558287, 0.1377684, 1.63011, 0, 0, 0, 1, 1,
0.1575253, -0.2110392, 3.432406, 1, 1, 1, 1, 1,
0.1600659, -1.257625, 4.825422, 1, 1, 1, 1, 1,
0.1619071, 0.9725413, 1.064303, 1, 1, 1, 1, 1,
0.1678695, 1.462319, -1.163088, 1, 1, 1, 1, 1,
0.1679084, -0.9016449, 1.679459, 1, 1, 1, 1, 1,
0.1753135, 0.193706, 2.068746, 1, 1, 1, 1, 1,
0.1769124, 0.9253179, -0.4038818, 1, 1, 1, 1, 1,
0.182911, 1.243279, -0.1426682, 1, 1, 1, 1, 1,
0.1861965, 0.3936258, -0.3673321, 1, 1, 1, 1, 1,
0.1882247, 0.6419782, 0.7498064, 1, 1, 1, 1, 1,
0.1889266, -2.032317, 1.591026, 1, 1, 1, 1, 1,
0.1897204, 2.221688, 1.013174, 1, 1, 1, 1, 1,
0.1913954, 0.816844, 0.916957, 1, 1, 1, 1, 1,
0.1952727, -0.3638467, 4.228742, 1, 1, 1, 1, 1,
0.1984559, 0.6603357, 0.1154224, 1, 1, 1, 1, 1,
0.20085, 0.3064044, 0.5780957, 0, 0, 1, 1, 1,
0.2035603, 1.201871, 0.2738792, 1, 0, 0, 1, 1,
0.2041567, -0.04061865, 3.002108, 1, 0, 0, 1, 1,
0.2053774, 0.02652076, -0.09036396, 1, 0, 0, 1, 1,
0.2061918, -0.4198695, 4.589051, 1, 0, 0, 1, 1,
0.2113567, 0.5767043, 0.2070053, 1, 0, 0, 1, 1,
0.212291, 0.3717484, 1.332128, 0, 0, 0, 1, 1,
0.212572, 0.9305232, -1.217395, 0, 0, 0, 1, 1,
0.2130574, -0.9364362, 3.593727, 0, 0, 0, 1, 1,
0.2141852, 0.7448069, 0.1351638, 0, 0, 0, 1, 1,
0.2155717, -0.7970784, 3.519175, 0, 0, 0, 1, 1,
0.2189747, -2.916312, 2.793909, 0, 0, 0, 1, 1,
0.2201923, -0.9097515, 2.003961, 0, 0, 0, 1, 1,
0.2273923, 0.3820586, -0.5433958, 1, 1, 1, 1, 1,
0.2281355, -0.05487603, 2.554223, 1, 1, 1, 1, 1,
0.2287207, -1.199247, 3.611935, 1, 1, 1, 1, 1,
0.2294398, -0.2337698, 3.437629, 1, 1, 1, 1, 1,
0.233676, 0.9221407, 0.1007312, 1, 1, 1, 1, 1,
0.2338348, 0.7980732, -0.3472272, 1, 1, 1, 1, 1,
0.2364787, 1.524971, -1.693641, 1, 1, 1, 1, 1,
0.242405, -0.3527507, 2.350223, 1, 1, 1, 1, 1,
0.2427109, 0.03345206, 2.369855, 1, 1, 1, 1, 1,
0.2435552, 0.1292118, 0.8559871, 1, 1, 1, 1, 1,
0.2467773, -0.5562748, 5.6222, 1, 1, 1, 1, 1,
0.2539816, -0.7009643, 1.76792, 1, 1, 1, 1, 1,
0.2562707, 0.8715492, 0.6347802, 1, 1, 1, 1, 1,
0.2633485, -1.000957, 5.055048, 1, 1, 1, 1, 1,
0.2659509, -0.6674199, 1.713519, 1, 1, 1, 1, 1,
0.2669404, 1.730003, -0.3674143, 0, 0, 1, 1, 1,
0.2672189, 1.134498, 1.663523, 1, 0, 0, 1, 1,
0.2684851, 2.467429, -0.7789003, 1, 0, 0, 1, 1,
0.2755615, 0.6647121, 0.2787167, 1, 0, 0, 1, 1,
0.2816235, -0.2443947, 1.471099, 1, 0, 0, 1, 1,
0.2840194, -0.3279015, 2.260893, 1, 0, 0, 1, 1,
0.2899813, 1.653588, -0.1896566, 0, 0, 0, 1, 1,
0.2909599, 0.4094883, 1.190973, 0, 0, 0, 1, 1,
0.2912278, -0.302097, 2.822678, 0, 0, 0, 1, 1,
0.2922741, 0.8590744, -0.5756279, 0, 0, 0, 1, 1,
0.2936819, 0.9932886, -0.1983261, 0, 0, 0, 1, 1,
0.2946797, 0.742887, 0.6645444, 0, 0, 0, 1, 1,
0.2981362, 0.6363696, 1.04187, 0, 0, 0, 1, 1,
0.2984559, 2.196728, -0.009517991, 1, 1, 1, 1, 1,
0.2995289, 0.2376238, 3.00327, 1, 1, 1, 1, 1,
0.2996892, -0.8979689, 3.706821, 1, 1, 1, 1, 1,
0.3022231, 0.4452453, 0.2665548, 1, 1, 1, 1, 1,
0.3052705, 0.1294177, -2.014967, 1, 1, 1, 1, 1,
0.3056346, 0.3562859, 1.247023, 1, 1, 1, 1, 1,
0.3075089, -0.6575124, 3.28446, 1, 1, 1, 1, 1,
0.3082366, -0.4261611, 2.398609, 1, 1, 1, 1, 1,
0.3123351, 0.3245192, 0.06381659, 1, 1, 1, 1, 1,
0.3141143, -0.6410225, 2.771101, 1, 1, 1, 1, 1,
0.3144645, 1.033831, -0.3059663, 1, 1, 1, 1, 1,
0.3150945, -0.03313491, 2.701496, 1, 1, 1, 1, 1,
0.3205176, 1.160538, 1.545975, 1, 1, 1, 1, 1,
0.3217348, 0.7480195, 2.027005, 1, 1, 1, 1, 1,
0.3243749, -0.6042911, 2.174295, 1, 1, 1, 1, 1,
0.3272607, -1.464017, 2.362914, 0, 0, 1, 1, 1,
0.3288548, -1.871023, 2.964719, 1, 0, 0, 1, 1,
0.3294002, 0.2801978, 1.519123, 1, 0, 0, 1, 1,
0.3335216, -1.420885, 3.693545, 1, 0, 0, 1, 1,
0.3378102, -1.94751, 4.504957, 1, 0, 0, 1, 1,
0.3405426, -0.8454974, 2.289964, 1, 0, 0, 1, 1,
0.341134, -0.4227794, 3.548938, 0, 0, 0, 1, 1,
0.3434391, 0.6587831, 0.8659432, 0, 0, 0, 1, 1,
0.3452424, -0.494411, 2.723627, 0, 0, 0, 1, 1,
0.3460889, -1.075437, 2.102992, 0, 0, 0, 1, 1,
0.3556153, -0.5288764, 2.548826, 0, 0, 0, 1, 1,
0.3592013, 1.667808, -0.8412067, 0, 0, 0, 1, 1,
0.3594142, 0.5144948, 1.987836, 0, 0, 0, 1, 1,
0.3616156, 0.2786801, 1.226899, 1, 1, 1, 1, 1,
0.362253, 0.9834523, 1.019647, 1, 1, 1, 1, 1,
0.375296, -0.8508782, 0.7266713, 1, 1, 1, 1, 1,
0.3753157, 1.024826, 0.7814378, 1, 1, 1, 1, 1,
0.3783992, -0.6649681, 2.142694, 1, 1, 1, 1, 1,
0.3805169, -2.03999, 2.585654, 1, 1, 1, 1, 1,
0.3806123, 1.153568, -1.114762, 1, 1, 1, 1, 1,
0.3871141, 1.656616, -0.7729964, 1, 1, 1, 1, 1,
0.3895664, 0.4346876, 0.9957413, 1, 1, 1, 1, 1,
0.3980923, 0.5353653, -0.2549075, 1, 1, 1, 1, 1,
0.3988113, 0.4836008, -0.3206482, 1, 1, 1, 1, 1,
0.3997665, 1.388428, 0.6299964, 1, 1, 1, 1, 1,
0.4004599, -1.938629, 3.498162, 1, 1, 1, 1, 1,
0.4092257, -1.871064, 1.471416, 1, 1, 1, 1, 1,
0.4102993, 0.3608356, 0.9213981, 1, 1, 1, 1, 1,
0.4146765, -0.6671348, 1.320111, 0, 0, 1, 1, 1,
0.4149606, 0.5086471, 0.7781128, 1, 0, 0, 1, 1,
0.4186006, 1.582039, 0.462085, 1, 0, 0, 1, 1,
0.4188733, -0.5825216, 2.903489, 1, 0, 0, 1, 1,
0.420858, -0.3658883, 0.9219177, 1, 0, 0, 1, 1,
0.4233529, -0.8065336, 2.110925, 1, 0, 0, 1, 1,
0.4286869, -0.5938526, 1.673758, 0, 0, 0, 1, 1,
0.4292658, 0.2496664, 1.356048, 0, 0, 0, 1, 1,
0.4296615, 1.34331, 1.47865, 0, 0, 0, 1, 1,
0.4317576, -0.05309055, 1.298679, 0, 0, 0, 1, 1,
0.4322134, -1.213361, 2.0799, 0, 0, 0, 1, 1,
0.4344813, 1.552217, 0.5935563, 0, 0, 0, 1, 1,
0.4359056, -0.8268744, 3.153306, 0, 0, 0, 1, 1,
0.4397099, 1.347976, -0.4755545, 1, 1, 1, 1, 1,
0.447997, 0.8402571, 1.586282, 1, 1, 1, 1, 1,
0.4482976, -0.7819076, 3.157164, 1, 1, 1, 1, 1,
0.4485755, -0.09513509, 1.795303, 1, 1, 1, 1, 1,
0.4496102, 0.1126725, 1.777266, 1, 1, 1, 1, 1,
0.4557815, -0.5342928, 3.61234, 1, 1, 1, 1, 1,
0.4609647, 2.289297, 1.379617, 1, 1, 1, 1, 1,
0.4611351, 0.7209927, -0.5190145, 1, 1, 1, 1, 1,
0.4688995, 1.068799, 0.7778715, 1, 1, 1, 1, 1,
0.4691316, -0.7504486, 1.312622, 1, 1, 1, 1, 1,
0.4697248, 1.341653, 0.5219014, 1, 1, 1, 1, 1,
0.4699794, -0.8271981, 3.074468, 1, 1, 1, 1, 1,
0.4712131, -0.9825357, 1.978257, 1, 1, 1, 1, 1,
0.472828, -0.2332589, 1.571536, 1, 1, 1, 1, 1,
0.4761868, -1.619994, 2.871889, 1, 1, 1, 1, 1,
0.4776504, -1.134587, 3.350739, 0, 0, 1, 1, 1,
0.4790287, 2.055653, 1.705738, 1, 0, 0, 1, 1,
0.4796005, 1.152374, 0.1135759, 1, 0, 0, 1, 1,
0.4850337, 0.9272557, 1.797081, 1, 0, 0, 1, 1,
0.4869415, 0.292832, -0.7114154, 1, 0, 0, 1, 1,
0.4950631, 2.102311, 0.80254, 1, 0, 0, 1, 1,
0.496877, 1.838718, -0.5902323, 0, 0, 0, 1, 1,
0.4975157, -1.177499, 2.618433, 0, 0, 0, 1, 1,
0.5015937, -0.1425167, 1.409391, 0, 0, 0, 1, 1,
0.5023295, 0.3634298, -0.07043389, 0, 0, 0, 1, 1,
0.502848, 0.8883604, 0.3737742, 0, 0, 0, 1, 1,
0.5038701, 0.1656209, 1.574085, 0, 0, 0, 1, 1,
0.5043092, 1.2334, 0.2449316, 0, 0, 0, 1, 1,
0.5065053, -0.5632367, 2.238923, 1, 1, 1, 1, 1,
0.5082377, -1.125511, 3.487814, 1, 1, 1, 1, 1,
0.5082724, -0.9233831, 3.919027, 1, 1, 1, 1, 1,
0.5082909, 2.443578, 1.144002, 1, 1, 1, 1, 1,
0.5114132, 1.072268, -0.2678556, 1, 1, 1, 1, 1,
0.5135015, 1.565771, 0.120351, 1, 1, 1, 1, 1,
0.521244, -1.01396, 0.7847557, 1, 1, 1, 1, 1,
0.5218182, 0.2295668, -1.129797, 1, 1, 1, 1, 1,
0.5219062, -0.3878182, 1.765439, 1, 1, 1, 1, 1,
0.5265317, 0.834387, 0.02888808, 1, 1, 1, 1, 1,
0.5285356, -1.794072, 2.441513, 1, 1, 1, 1, 1,
0.5292072, 2.10763, 0.283931, 1, 1, 1, 1, 1,
0.5313303, 1.036465, 1.058675, 1, 1, 1, 1, 1,
0.5330052, 1.250546, 0.2112446, 1, 1, 1, 1, 1,
0.5422347, 0.583549, 0.8415067, 1, 1, 1, 1, 1,
0.5462902, 0.9065583, 0.2870284, 0, 0, 1, 1, 1,
0.5485347, -1.035174, 1.442258, 1, 0, 0, 1, 1,
0.5499667, 0.6740297, 1.478873, 1, 0, 0, 1, 1,
0.5514348, -0.5842762, 2.132228, 1, 0, 0, 1, 1,
0.5517215, -0.1032035, 1.256364, 1, 0, 0, 1, 1,
0.5616628, -1.913208, 2.857977, 1, 0, 0, 1, 1,
0.5653095, -0.7858414, 1.554798, 0, 0, 0, 1, 1,
0.5782641, -0.1132905, 1.376575, 0, 0, 0, 1, 1,
0.578488, -1.406964, 1.289987, 0, 0, 0, 1, 1,
0.5831816, 0.8508264, 0.5541867, 0, 0, 0, 1, 1,
0.5836668, -0.4800583, 1.016167, 0, 0, 0, 1, 1,
0.5870672, 2.693912, 0.04111506, 0, 0, 0, 1, 1,
0.5945672, 0.4307454, -0.801798, 0, 0, 0, 1, 1,
0.5963676, -0.973425, 1.900735, 1, 1, 1, 1, 1,
0.5970232, -1.852872, 3.028113, 1, 1, 1, 1, 1,
0.600101, 0.02706437, 2.192058, 1, 1, 1, 1, 1,
0.6052263, -1.382344, 4.551175, 1, 1, 1, 1, 1,
0.6078433, -1.231628, 2.983556, 1, 1, 1, 1, 1,
0.6096542, 0.5750498, 2.57342, 1, 1, 1, 1, 1,
0.6109183, 0.6103849, 2.536397, 1, 1, 1, 1, 1,
0.611277, 0.1891168, 2.281739, 1, 1, 1, 1, 1,
0.6130016, -1.390437, 3.733378, 1, 1, 1, 1, 1,
0.6167669, 0.8946934, 0.9790319, 1, 1, 1, 1, 1,
0.6203727, -0.7472391, 2.5385, 1, 1, 1, 1, 1,
0.6213771, 0.1539844, 1.218399, 1, 1, 1, 1, 1,
0.6241042, -0.03147215, 0.5255122, 1, 1, 1, 1, 1,
0.6280028, 0.4193181, -0.4013637, 1, 1, 1, 1, 1,
0.6280478, 0.5563359, 0.2137405, 1, 1, 1, 1, 1,
0.629985, 0.06689568, 0.1112539, 0, 0, 1, 1, 1,
0.6355752, 0.804444, 0.6676795, 1, 0, 0, 1, 1,
0.6390244, -0.5942941, 2.768572, 1, 0, 0, 1, 1,
0.6413872, 2.077805, 1.218347, 1, 0, 0, 1, 1,
0.6443539, 0.8357, -0.5586827, 1, 0, 0, 1, 1,
0.6484386, 0.07414176, 1.604536, 1, 0, 0, 1, 1,
0.6530885, 2.456412, 0.09691892, 0, 0, 0, 1, 1,
0.6565254, 1.946481, 0.7770356, 0, 0, 0, 1, 1,
0.6593013, 0.3834536, 1.876026, 0, 0, 0, 1, 1,
0.661876, 0.6048379, 2.297817, 0, 0, 0, 1, 1,
0.6638463, 0.9765557, 2.012056, 0, 0, 0, 1, 1,
0.6795474, -0.4910987, 0.3937107, 0, 0, 0, 1, 1,
0.6797242, -0.1536113, -0.3803849, 0, 0, 0, 1, 1,
0.6845893, 1.279063, 2.117335, 1, 1, 1, 1, 1,
0.688437, 1.067334, 1.125699, 1, 1, 1, 1, 1,
0.6900825, -0.04072643, 2.780833, 1, 1, 1, 1, 1,
0.6956859, 0.8015464, 1.464034, 1, 1, 1, 1, 1,
0.6966254, 1.617036, 0.8995932, 1, 1, 1, 1, 1,
0.6972113, 0.5596582, 0.1874505, 1, 1, 1, 1, 1,
0.7005503, -1.851684, 3.161981, 1, 1, 1, 1, 1,
0.7084013, -1.228891, 1.831391, 1, 1, 1, 1, 1,
0.7103547, 0.5716079, 0.8560161, 1, 1, 1, 1, 1,
0.7109339, -0.7610682, 1.20319, 1, 1, 1, 1, 1,
0.7193859, 0.3787562, 1.198731, 1, 1, 1, 1, 1,
0.721442, -0.2584113, 1.807868, 1, 1, 1, 1, 1,
0.7236761, 1.043367, 2.390373, 1, 1, 1, 1, 1,
0.7282063, 0.4953118, 1.417045, 1, 1, 1, 1, 1,
0.7312279, 0.05710788, 0.9138007, 1, 1, 1, 1, 1,
0.7357598, 1.868216, -0.3510357, 0, 0, 1, 1, 1,
0.7361868, -0.478164, 2.236231, 1, 0, 0, 1, 1,
0.7403964, 0.3903897, -0.03206454, 1, 0, 0, 1, 1,
0.7410411, 1.780213, 2.646418, 1, 0, 0, 1, 1,
0.7415969, 0.1984987, 1.140867, 1, 0, 0, 1, 1,
0.7504065, 0.9343534, -0.1175066, 1, 0, 0, 1, 1,
0.7519736, 1.038993, -1.505084, 0, 0, 0, 1, 1,
0.7520462, -0.7750084, 1.918632, 0, 0, 0, 1, 1,
0.7521592, 0.1871318, 1.129222, 0, 0, 0, 1, 1,
0.7589048, -0.3000078, 1.706081, 0, 0, 0, 1, 1,
0.7641913, 0.3144145, 1.306703, 0, 0, 0, 1, 1,
0.7649426, 0.3234992, 2.761217, 0, 0, 0, 1, 1,
0.7698905, 0.507782, 1.991547, 0, 0, 0, 1, 1,
0.770226, 1.689741, 1.037864, 1, 1, 1, 1, 1,
0.7796211, -0.6625649, 1.795897, 1, 1, 1, 1, 1,
0.7816186, -0.5100703, 1.278975, 1, 1, 1, 1, 1,
0.7834019, 0.6477497, 0.1503185, 1, 1, 1, 1, 1,
0.7875378, 0.304185, 3.172057, 1, 1, 1, 1, 1,
0.7906002, 0.2499494, 3.243202, 1, 1, 1, 1, 1,
0.7922624, 0.672013, 2.34827, 1, 1, 1, 1, 1,
0.7924687, -0.7221327, 2.807428, 1, 1, 1, 1, 1,
0.7960048, 0.03528931, 3.60741, 1, 1, 1, 1, 1,
0.8007375, -3.532525, 1.312595, 1, 1, 1, 1, 1,
0.8032444, -1.147653, 2.694525, 1, 1, 1, 1, 1,
0.8044783, 1.393871, 1.152412, 1, 1, 1, 1, 1,
0.8081709, -0.9651188, 1.30788, 1, 1, 1, 1, 1,
0.8098098, -0.2728518, 2.272089, 1, 1, 1, 1, 1,
0.8157437, -1.213122, 2.12956, 1, 1, 1, 1, 1,
0.8231488, 0.6774723, 1.90329, 0, 0, 1, 1, 1,
0.8243094, 0.283855, 3.91216, 1, 0, 0, 1, 1,
0.8273584, 0.4241167, -0.7618437, 1, 0, 0, 1, 1,
0.8295884, -1.446253, 2.324263, 1, 0, 0, 1, 1,
0.829917, 0.2071157, 0.5960629, 1, 0, 0, 1, 1,
0.8320523, 0.7778089, -0.005186193, 1, 0, 0, 1, 1,
0.8362331, 1.722604, 1.028507, 0, 0, 0, 1, 1,
0.8366444, -1.814295, 2.544728, 0, 0, 0, 1, 1,
0.8390846, -0.6941237, 2.608635, 0, 0, 0, 1, 1,
0.8416438, 1.274127, 0.7640048, 0, 0, 0, 1, 1,
0.8427578, -0.001839735, 2.311055, 0, 0, 0, 1, 1,
0.8447793, 0.3913871, 2.119235, 0, 0, 0, 1, 1,
0.8468145, -0.4963761, 3.045722, 0, 0, 0, 1, 1,
0.8480914, 0.2150517, 0.3579583, 1, 1, 1, 1, 1,
0.8492123, 1.49946, 2.047724, 1, 1, 1, 1, 1,
0.8500193, -0.8373687, 1.488137, 1, 1, 1, 1, 1,
0.851569, -0.04985615, 1.333569, 1, 1, 1, 1, 1,
0.8576298, 1.166744, 0.721391, 1, 1, 1, 1, 1,
0.8600616, 0.3349595, -0.1260071, 1, 1, 1, 1, 1,
0.8620114, -1.806887, 3.279879, 1, 1, 1, 1, 1,
0.8675143, 1.407353, -1.471932, 1, 1, 1, 1, 1,
0.87067, -0.1192109, 2.855758, 1, 1, 1, 1, 1,
0.8708958, -0.6831335, 2.934405, 1, 1, 1, 1, 1,
0.8715923, -0.6385876, 3.111094, 1, 1, 1, 1, 1,
0.8743933, -0.9542254, 1.656227, 1, 1, 1, 1, 1,
0.8753487, -1.492738, 2.101827, 1, 1, 1, 1, 1,
0.8887733, 0.3839883, 1.772159, 1, 1, 1, 1, 1,
0.8966671, 0.5795862, 2.476967, 1, 1, 1, 1, 1,
0.8997647, -0.5361562, 1.592173, 0, 0, 1, 1, 1,
0.9012935, -0.9020311, 1.599944, 1, 0, 0, 1, 1,
0.9114909, -0.1168458, 2.122781, 1, 0, 0, 1, 1,
0.9178228, -0.03140866, -0.002768695, 1, 0, 0, 1, 1,
0.9212654, 0.2142958, 1.137094, 1, 0, 0, 1, 1,
0.9245014, -0.4486953, 0.6406861, 1, 0, 0, 1, 1,
0.9323329, 0.9137411, -1.431906, 0, 0, 0, 1, 1,
0.9325575, 0.9653592, 1.668635, 0, 0, 0, 1, 1,
0.9346583, -0.2327927, 0.3947962, 0, 0, 0, 1, 1,
0.9387478, 1.49757, -0.1167285, 0, 0, 0, 1, 1,
0.942444, 1.349358, -1.27143, 0, 0, 0, 1, 1,
0.9441041, 0.01173003, 1.736025, 0, 0, 0, 1, 1,
0.9448527, 0.7663034, 0.4278946, 0, 0, 0, 1, 1,
0.9453141, -1.534521, 2.61655, 1, 1, 1, 1, 1,
0.9491223, -0.5256186, 2.057981, 1, 1, 1, 1, 1,
0.9517208, -0.7937349, 4.001191, 1, 1, 1, 1, 1,
0.9526175, -0.1524655, 0.1284159, 1, 1, 1, 1, 1,
0.9537303, -0.908751, 1.459642, 1, 1, 1, 1, 1,
0.9634219, -0.3235121, 1.434423, 1, 1, 1, 1, 1,
0.9656748, 0.1084351, 1.899379, 1, 1, 1, 1, 1,
0.9688201, -0.4868462, 1.647762, 1, 1, 1, 1, 1,
0.9827139, -0.8892251, 1.180993, 1, 1, 1, 1, 1,
0.9943731, -0.3852764, 1.760163, 1, 1, 1, 1, 1,
0.9958693, -1.430758, 3.16348, 1, 1, 1, 1, 1,
1.001572, -1.176308, 0.4890797, 1, 1, 1, 1, 1,
1.007282, 0.1982117, -0.02495453, 1, 1, 1, 1, 1,
1.014606, -0.7617904, 2.883577, 1, 1, 1, 1, 1,
1.016493, -0.1653778, -0.02878744, 1, 1, 1, 1, 1,
1.022996, 0.7726111, 2.222937, 0, 0, 1, 1, 1,
1.025529, 1.868378, 0.3770683, 1, 0, 0, 1, 1,
1.028113, -1.670418, 2.011917, 1, 0, 0, 1, 1,
1.029215, -0.3707508, 3.271154, 1, 0, 0, 1, 1,
1.02973, -0.7681373, 2.799161, 1, 0, 0, 1, 1,
1.030336, 0.2396756, 3.401826, 1, 0, 0, 1, 1,
1.037479, -0.8476188, -0.4719951, 0, 0, 0, 1, 1,
1.049766, 1.532479, 1.376969, 0, 0, 0, 1, 1,
1.050719, -0.2128654, 1.750269, 0, 0, 0, 1, 1,
1.058513, 0.4194782, 1.00562, 0, 0, 0, 1, 1,
1.061712, -0.1471457, 2.24647, 0, 0, 0, 1, 1,
1.064924, 0.8278804, 0.6192554, 0, 0, 0, 1, 1,
1.068758, 0.1579519, 2.647386, 0, 0, 0, 1, 1,
1.078667, -0.7537071, 1.269448, 1, 1, 1, 1, 1,
1.084538, -0.7232425, 2.860775, 1, 1, 1, 1, 1,
1.086006, 1.247529, 2.151855, 1, 1, 1, 1, 1,
1.087092, 0.7396414, 2.175529, 1, 1, 1, 1, 1,
1.088115, 0.3233682, 0.2357626, 1, 1, 1, 1, 1,
1.092878, -0.3227335, 2.164643, 1, 1, 1, 1, 1,
1.097299, 0.4419982, 1.076838, 1, 1, 1, 1, 1,
1.097745, 0.8375627, -0.4554443, 1, 1, 1, 1, 1,
1.10172, -1.584054, 2.561926, 1, 1, 1, 1, 1,
1.11177, 1.114178, -1.229135, 1, 1, 1, 1, 1,
1.112153, 0.7050754, 1.114624, 1, 1, 1, 1, 1,
1.123814, 0.2304523, 1.284271, 1, 1, 1, 1, 1,
1.128243, 0.918423, 1.027069, 1, 1, 1, 1, 1,
1.13579, -1.422309, 2.961674, 1, 1, 1, 1, 1,
1.136844, -0.1352742, 0.6764144, 1, 1, 1, 1, 1,
1.138067, -0.855285, 3.557271, 0, 0, 1, 1, 1,
1.139659, 0.4745184, 1.148585, 1, 0, 0, 1, 1,
1.146644, -0.2542472, 1.520537, 1, 0, 0, 1, 1,
1.150565, -0.6583351, 1.618176, 1, 0, 0, 1, 1,
1.154669, 1.071047, 0.6903523, 1, 0, 0, 1, 1,
1.15693, -1.364388, 3.414081, 1, 0, 0, 1, 1,
1.173194, 1.179864, 0.2425452, 0, 0, 0, 1, 1,
1.175615, 0.2225399, 1.907635, 0, 0, 0, 1, 1,
1.180515, 1.954134, 1.781915, 0, 0, 0, 1, 1,
1.182708, -0.07547262, 3.655621, 0, 0, 0, 1, 1,
1.190364, -0.7430753, 3.201092, 0, 0, 0, 1, 1,
1.196879, 0.5763817, -0.0192364, 0, 0, 0, 1, 1,
1.203127, 1.404775, 1.872438, 0, 0, 0, 1, 1,
1.208028, -0.4002686, 0.9542081, 1, 1, 1, 1, 1,
1.21891, 0.244842, 3.450256, 1, 1, 1, 1, 1,
1.248246, -0.2081983, 1.738177, 1, 1, 1, 1, 1,
1.252164, 0.389471, 1.591062, 1, 1, 1, 1, 1,
1.252786, 1.615051, 0.6064175, 1, 1, 1, 1, 1,
1.256604, -0.9104565, 1.044254, 1, 1, 1, 1, 1,
1.262641, 0.02123685, 1.866682, 1, 1, 1, 1, 1,
1.263818, -0.5922706, 1.449791, 1, 1, 1, 1, 1,
1.26843, 0.417246, 1.503353, 1, 1, 1, 1, 1,
1.276172, -0.6670673, 0.5502437, 1, 1, 1, 1, 1,
1.287803, -0.5370411, 1.636714, 1, 1, 1, 1, 1,
1.291074, -0.9156404, 2.521305, 1, 1, 1, 1, 1,
1.291504, 0.6588399, 1.30662, 1, 1, 1, 1, 1,
1.294704, -0.8209072, 2.95784, 1, 1, 1, 1, 1,
1.294738, 1.381609, 1.86098, 1, 1, 1, 1, 1,
1.306697, 0.03997368, 1.787557, 0, 0, 1, 1, 1,
1.311342, -0.09444708, 0.1361014, 1, 0, 0, 1, 1,
1.315103, 0.5812023, 2.076199, 1, 0, 0, 1, 1,
1.319213, -0.2427431, 0.3085259, 1, 0, 0, 1, 1,
1.332573, -0.9499967, 2.02916, 1, 0, 0, 1, 1,
1.334165, -0.08852836, 2.808348, 1, 0, 0, 1, 1,
1.337422, -0.3795056, 0.5950451, 0, 0, 0, 1, 1,
1.339044, -1.4301, 1.377831, 0, 0, 0, 1, 1,
1.344023, -0.1385479, 1.15381, 0, 0, 0, 1, 1,
1.345137, 0.4970242, 0.6419199, 0, 0, 0, 1, 1,
1.353606, 0.48695, 0.3145807, 0, 0, 0, 1, 1,
1.354352, -0.3516572, 1.814357, 0, 0, 0, 1, 1,
1.358888, 0.0722762, 0.2853487, 0, 0, 0, 1, 1,
1.375414, 0.4603529, 1.503291, 1, 1, 1, 1, 1,
1.380037, -0.7408392, 2.164462, 1, 1, 1, 1, 1,
1.393728, -0.4387823, 0.5236884, 1, 1, 1, 1, 1,
1.394499, 0.4810684, 1.349674, 1, 1, 1, 1, 1,
1.398432, 0.4989151, -0.5475467, 1, 1, 1, 1, 1,
1.403384, 0.1280591, 1.436443, 1, 1, 1, 1, 1,
1.412645, 1.113569, 1.71912, 1, 1, 1, 1, 1,
1.421144, 0.3267125, 0.7035558, 1, 1, 1, 1, 1,
1.423581, -1.098637, 2.971593, 1, 1, 1, 1, 1,
1.425125, -0.1724326, 1.205998, 1, 1, 1, 1, 1,
1.426133, 0.7810752, 0.5684545, 1, 1, 1, 1, 1,
1.432285, -0.6351631, 2.185913, 1, 1, 1, 1, 1,
1.434883, -1.78116, 2.701317, 1, 1, 1, 1, 1,
1.436235, -1.056924, 1.263698, 1, 1, 1, 1, 1,
1.448253, -0.8223456, 1.202136, 1, 1, 1, 1, 1,
1.452183, 0.6530212, -0.6298966, 0, 0, 1, 1, 1,
1.472955, -1.941386, 3.452015, 1, 0, 0, 1, 1,
1.473078, 1.519369, 1.771095, 1, 0, 0, 1, 1,
1.480909, -2.205054, 2.704263, 1, 0, 0, 1, 1,
1.494644, -0.5757764, 2.769111, 1, 0, 0, 1, 1,
1.49742, -0.5491747, 2.062875, 1, 0, 0, 1, 1,
1.501289, 0.296078, 1.258196, 0, 0, 0, 1, 1,
1.521202, -0.01871954, 4.225005, 0, 0, 0, 1, 1,
1.525331, 0.330057, 1.251077, 0, 0, 0, 1, 1,
1.525877, 1.146068, 0.7387558, 0, 0, 0, 1, 1,
1.544866, 0.1428374, 0.6160732, 0, 0, 0, 1, 1,
1.54532, -1.024499, 2.373348, 0, 0, 0, 1, 1,
1.547324, -0.09219664, 2.043239, 0, 0, 0, 1, 1,
1.558609, 1.74844, 2.579859, 1, 1, 1, 1, 1,
1.570989, 1.160881, 2.519811, 1, 1, 1, 1, 1,
1.578813, 1.007418, 0.5699512, 1, 1, 1, 1, 1,
1.58724, 0.5897989, 1.290042, 1, 1, 1, 1, 1,
1.589149, -0.01857997, 0.5711811, 1, 1, 1, 1, 1,
1.602562, 0.4019197, 0.5646752, 1, 1, 1, 1, 1,
1.604654, 0.9450485, 0.8684735, 1, 1, 1, 1, 1,
1.619527, 0.3831356, 3.269928, 1, 1, 1, 1, 1,
1.630244, 0.8346038, 1.115623, 1, 1, 1, 1, 1,
1.6333, -0.2895377, 2.169939, 1, 1, 1, 1, 1,
1.635702, 1.112357, 1.08234, 1, 1, 1, 1, 1,
1.64656, 0.656579, 1.643271, 1, 1, 1, 1, 1,
1.657663, 0.5703865, 1.641633, 1, 1, 1, 1, 1,
1.660773, 1.271654, 1.639639, 1, 1, 1, 1, 1,
1.682997, -1.626795, 2.162723, 1, 1, 1, 1, 1,
1.685488, -0.1119966, 1.809253, 0, 0, 1, 1, 1,
1.690136, -0.01308657, 0.4427293, 1, 0, 0, 1, 1,
1.697115, -0.01744806, 0.4426091, 1, 0, 0, 1, 1,
1.713336, -1.080966, 3.367099, 1, 0, 0, 1, 1,
1.713884, 0.4203306, 4.433094, 1, 0, 0, 1, 1,
1.718567, -1.130668, 1.255743, 1, 0, 0, 1, 1,
1.737858, 1.202552, 2.15699, 0, 0, 0, 1, 1,
1.743855, 0.5847369, 0.8877545, 0, 0, 0, 1, 1,
1.754056, 0.2732956, 1.245056, 0, 0, 0, 1, 1,
1.758595, -0.06639459, 1.076916, 0, 0, 0, 1, 1,
1.763611, 0.5964352, 2.804045, 0, 0, 0, 1, 1,
1.779788, 0.4294476, 1.626627, 0, 0, 0, 1, 1,
1.788219, -0.1685324, 0.6522369, 0, 0, 0, 1, 1,
1.792035, 0.3782816, -0.8347785, 1, 1, 1, 1, 1,
1.796116, -1.599106, 2.331122, 1, 1, 1, 1, 1,
1.80606, -1.102574, 2.725507, 1, 1, 1, 1, 1,
1.826178, 1.150133, 2.683486, 1, 1, 1, 1, 1,
1.846025, 1.177489, 0.5929665, 1, 1, 1, 1, 1,
1.850018, 0.6839294, 0.6371561, 1, 1, 1, 1, 1,
1.852103, 0.07893615, 2.183626, 1, 1, 1, 1, 1,
1.856633, 0.9675845, 1.188922, 1, 1, 1, 1, 1,
1.866466, 0.5341816, -0.3553382, 1, 1, 1, 1, 1,
1.86732, -0.4674548, 3.013366, 1, 1, 1, 1, 1,
1.872553, 0.2671921, 3.930964, 1, 1, 1, 1, 1,
1.87964, -0.2691867, 1.878859, 1, 1, 1, 1, 1,
1.885287, 0.7874851, 0.8615493, 1, 1, 1, 1, 1,
1.935261, 0.7775183, 1.045773, 1, 1, 1, 1, 1,
1.940863, 1.601628, -0.2656224, 1, 1, 1, 1, 1,
1.945742, -1.332138, 1.106386, 0, 0, 1, 1, 1,
1.994288, 0.1580266, -0.01791528, 1, 0, 0, 1, 1,
2.053494, 0.6926354, 0.009292627, 1, 0, 0, 1, 1,
2.10553, -1.529889, 2.226585, 1, 0, 0, 1, 1,
2.150543, -1.009488, 1.105489, 1, 0, 0, 1, 1,
2.162085, 1.70341, 0.996285, 1, 0, 0, 1, 1,
2.186975, 0.247534, -0.1999096, 0, 0, 0, 1, 1,
2.227618, 0.4241987, 1.639992, 0, 0, 0, 1, 1,
2.250101, 0.05743029, 3.243747, 0, 0, 0, 1, 1,
2.265428, -1.482873, 2.124667, 0, 0, 0, 1, 1,
2.271701, -0.6994562, 1.52413, 0, 0, 0, 1, 1,
2.277926, 0.6103233, 1.903041, 0, 0, 0, 1, 1,
2.371866, -0.1676205, 2.391504, 0, 0, 0, 1, 1,
2.513233, -0.6918002, 0.8687866, 1, 1, 1, 1, 1,
2.537724, 1.124442, 1.174855, 1, 1, 1, 1, 1,
2.566377, -0.2871919, 0.7164086, 1, 1, 1, 1, 1,
2.578291, 1.702918, -0.4916616, 1, 1, 1, 1, 1,
2.654763, 0.1518747, 1.227192, 1, 1, 1, 1, 1,
2.923576, 0.02801882, 1.708469, 1, 1, 1, 1, 1,
3.523711, -0.4826528, 2.750865, 1, 1, 1, 1, 1
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
var radius = 9.645743;
var distance = 33.88026;
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
mvMatrix.translate( -0.267964, 0.3414092, -0.2022283 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.88026);
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
