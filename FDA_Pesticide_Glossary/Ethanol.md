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
-2.978693, 0.5621631, -2.147179, 1, 0, 0, 1,
-2.751834, -0.06851284, -0.7160365, 1, 0.007843138, 0, 1,
-2.751711, -1.213325, -1.878969, 1, 0.01176471, 0, 1,
-2.711892, 0.7800446, -2.410905, 1, 0.01960784, 0, 1,
-2.675154, 2.098698, -0.6744365, 1, 0.02352941, 0, 1,
-2.605644, -0.6563581, -2.066015, 1, 0.03137255, 0, 1,
-2.510773, -0.5184712, -1.203232, 1, 0.03529412, 0, 1,
-2.495189, -1.749188, -2.737509, 1, 0.04313726, 0, 1,
-2.495146, -1.134146, -1.856838, 1, 0.04705882, 0, 1,
-2.466038, 0.459011, 0.1326578, 1, 0.05490196, 0, 1,
-2.261822, -0.3475486, -2.434079, 1, 0.05882353, 0, 1,
-2.242069, 0.2846951, -2.296909, 1, 0.06666667, 0, 1,
-2.212103, -0.6864522, -1.745276, 1, 0.07058824, 0, 1,
-2.166878, 1.685401, -0.6498866, 1, 0.07843138, 0, 1,
-2.166009, 1.05881, -0.3352953, 1, 0.08235294, 0, 1,
-2.142309, 1.061572, -1.130067, 1, 0.09019608, 0, 1,
-2.116311, -2.053499, -1.32642, 1, 0.09411765, 0, 1,
-2.090535, 0.5254026, -1.428576, 1, 0.1019608, 0, 1,
-2.060849, 0.2166783, 0.5261944, 1, 0.1098039, 0, 1,
-2.058541, -0.6338699, -1.478547, 1, 0.1137255, 0, 1,
-2.023701, 1.141567, -3.861883, 1, 0.1215686, 0, 1,
-2.015942, -1.251701, -3.283308, 1, 0.1254902, 0, 1,
-2.001438, 1.749261, 0.2312222, 1, 0.1333333, 0, 1,
-1.987224, 1.164315, -1.156134, 1, 0.1372549, 0, 1,
-1.976042, 1.125018, -0.7162184, 1, 0.145098, 0, 1,
-1.928228, -0.4212941, -2.745036, 1, 0.1490196, 0, 1,
-1.901239, 0.4601704, -2.088972, 1, 0.1568628, 0, 1,
-1.892466, -1.612937, -2.715142, 1, 0.1607843, 0, 1,
-1.884052, 0.4494945, -1.085731, 1, 0.1686275, 0, 1,
-1.877531, 1.993368, -0.2890933, 1, 0.172549, 0, 1,
-1.874108, -1.345651, -1.722073, 1, 0.1803922, 0, 1,
-1.828854, 0.3736167, -1.421331, 1, 0.1843137, 0, 1,
-1.806234, -0.9783849, -1.880561, 1, 0.1921569, 0, 1,
-1.802096, 0.5294591, -0.6559033, 1, 0.1960784, 0, 1,
-1.791401, -0.4094739, -1.843248, 1, 0.2039216, 0, 1,
-1.790731, 0.5211286, -2.201923, 1, 0.2117647, 0, 1,
-1.786349, -1.071612, -2.442598, 1, 0.2156863, 0, 1,
-1.783758, 0.04709985, -1.441058, 1, 0.2235294, 0, 1,
-1.772003, -0.02837959, -1.203366, 1, 0.227451, 0, 1,
-1.751898, 0.1773207, -1.564376, 1, 0.2352941, 0, 1,
-1.74676, -0.9467114, -1.449502, 1, 0.2392157, 0, 1,
-1.740653, -0.5005156, -1.358116, 1, 0.2470588, 0, 1,
-1.737219, -0.175534, -2.842955, 1, 0.2509804, 0, 1,
-1.734921, -1.270567, -3.68692, 1, 0.2588235, 0, 1,
-1.718484, 1.291344, -2.997828, 1, 0.2627451, 0, 1,
-1.693429, 0.2613032, 0.5998953, 1, 0.2705882, 0, 1,
-1.670728, -0.6126242, -1.743155, 1, 0.2745098, 0, 1,
-1.627761, -1.224173, -1.931036, 1, 0.282353, 0, 1,
-1.625999, -0.8292012, -0.5600293, 1, 0.2862745, 0, 1,
-1.618791, 1.355209, -0.7395421, 1, 0.2941177, 0, 1,
-1.613305, -1.185228, -2.411141, 1, 0.3019608, 0, 1,
-1.595583, -0.7256163, -2.166494, 1, 0.3058824, 0, 1,
-1.59554, -0.5387099, 0.1770084, 1, 0.3137255, 0, 1,
-1.593734, -1.087336, -2.054145, 1, 0.3176471, 0, 1,
-1.586048, 0.6134446, -1.103338, 1, 0.3254902, 0, 1,
-1.581976, 0.321279, 0.3378573, 1, 0.3294118, 0, 1,
-1.569468, 1.466082, -1.058999, 1, 0.3372549, 0, 1,
-1.567515, -0.2807882, -0.1924227, 1, 0.3411765, 0, 1,
-1.567394, -1.158618, -2.910255, 1, 0.3490196, 0, 1,
-1.565791, 1.346515, -2.6897, 1, 0.3529412, 0, 1,
-1.552951, -0.002042866, -1.923521, 1, 0.3607843, 0, 1,
-1.550766, -0.5087454, -3.197888, 1, 0.3647059, 0, 1,
-1.548689, 0.01774257, -3.460403, 1, 0.372549, 0, 1,
-1.534229, -1.037565, -0.5070485, 1, 0.3764706, 0, 1,
-1.529124, -0.125376, -0.5529337, 1, 0.3843137, 0, 1,
-1.528782, -2.371234, -2.507584, 1, 0.3882353, 0, 1,
-1.517701, 0.6225489, -2.17625, 1, 0.3960784, 0, 1,
-1.502795, 0.8152187, 0.1794732, 1, 0.4039216, 0, 1,
-1.501497, -0.2099258, -3.592038, 1, 0.4078431, 0, 1,
-1.48639, -1.002552, -1.372973, 1, 0.4156863, 0, 1,
-1.485101, 1.302343, -1.249257, 1, 0.4196078, 0, 1,
-1.478591, 0.4631003, -0.9597016, 1, 0.427451, 0, 1,
-1.473287, -0.9587923, -3.594758, 1, 0.4313726, 0, 1,
-1.445323, 0.07023717, -1.547242, 1, 0.4392157, 0, 1,
-1.438875, -0.8109458, -3.214908, 1, 0.4431373, 0, 1,
-1.415936, 0.45361, -0.8329355, 1, 0.4509804, 0, 1,
-1.410754, 0.2919861, -1.250903, 1, 0.454902, 0, 1,
-1.3993, -0.3247263, -1.90208, 1, 0.4627451, 0, 1,
-1.393744, 0.04807249, -0.3751614, 1, 0.4666667, 0, 1,
-1.389751, 3.150723, -0.3893574, 1, 0.4745098, 0, 1,
-1.389585, -1.28149, -2.544409, 1, 0.4784314, 0, 1,
-1.364615, -0.9230136, -2.611771, 1, 0.4862745, 0, 1,
-1.361735, -0.2130339, -3.154212, 1, 0.4901961, 0, 1,
-1.358083, -1.445559, -1.411605, 1, 0.4980392, 0, 1,
-1.351995, 1.478543, -0.2677395, 1, 0.5058824, 0, 1,
-1.348042, 0.04918968, -1.595045, 1, 0.509804, 0, 1,
-1.338578, -1.271849, -1.562636, 1, 0.5176471, 0, 1,
-1.321232, -0.7733087, -2.82984, 1, 0.5215687, 0, 1,
-1.311164, 2.040726, -0.2726399, 1, 0.5294118, 0, 1,
-1.304302, -0.1777202, -3.019763, 1, 0.5333334, 0, 1,
-1.300626, 0.4157808, 2.189059, 1, 0.5411765, 0, 1,
-1.300423, 0.07919179, 0.1240597, 1, 0.5450981, 0, 1,
-1.299655, -1.202483, -2.114208, 1, 0.5529412, 0, 1,
-1.298717, 0.2462888, -2.451586, 1, 0.5568628, 0, 1,
-1.298596, -0.5630665, -2.456845, 1, 0.5647059, 0, 1,
-1.29257, -0.256819, -1.529967, 1, 0.5686275, 0, 1,
-1.286108, -0.4284922, -3.791656, 1, 0.5764706, 0, 1,
-1.262115, 0.5251302, 0.02848944, 1, 0.5803922, 0, 1,
-1.261668, 0.3825555, -3.243289, 1, 0.5882353, 0, 1,
-1.260969, 0.9928433, -0.9655081, 1, 0.5921569, 0, 1,
-1.251055, 0.1303314, -1.36219, 1, 0.6, 0, 1,
-1.249702, 0.3325777, -0.5666525, 1, 0.6078432, 0, 1,
-1.236052, 0.3709174, -2.446301, 1, 0.6117647, 0, 1,
-1.225732, -0.04951831, -3.34199, 1, 0.6196079, 0, 1,
-1.221805, 0.4352555, 0.02082911, 1, 0.6235294, 0, 1,
-1.218704, 1.259185, -2.071393, 1, 0.6313726, 0, 1,
-1.214773, -0.6397752, -1.622959, 1, 0.6352941, 0, 1,
-1.210114, -0.1790466, -0.5427734, 1, 0.6431373, 0, 1,
-1.208542, -0.02544591, -2.440908, 1, 0.6470588, 0, 1,
-1.207446, 0.2345162, -1.369875, 1, 0.654902, 0, 1,
-1.202082, 1.086183, 0.1145004, 1, 0.6588235, 0, 1,
-1.197761, 0.06222562, -0.2996592, 1, 0.6666667, 0, 1,
-1.196465, -1.334535, -2.253862, 1, 0.6705883, 0, 1,
-1.196418, -0.9978126, -0.4798491, 1, 0.6784314, 0, 1,
-1.196155, -0.7839786, -3.265702, 1, 0.682353, 0, 1,
-1.19138, 0.8726911, -2.041115, 1, 0.6901961, 0, 1,
-1.190944, 0.7269637, -1.491976, 1, 0.6941177, 0, 1,
-1.188477, -0.3443413, -2.716493, 1, 0.7019608, 0, 1,
-1.187125, 0.6036018, -0.3762144, 1, 0.7098039, 0, 1,
-1.184864, -1.058458, -4.010277, 1, 0.7137255, 0, 1,
-1.184036, -0.933529, -0.8563027, 1, 0.7215686, 0, 1,
-1.180693, 0.2618145, -0.9481974, 1, 0.7254902, 0, 1,
-1.180092, 0.3362297, -0.2785215, 1, 0.7333333, 0, 1,
-1.172567, 0.9062374, -1.522877, 1, 0.7372549, 0, 1,
-1.171761, 0.7015924, -2.489372, 1, 0.7450981, 0, 1,
-1.171547, 0.0388954, -2.189145, 1, 0.7490196, 0, 1,
-1.165146, 0.2350248, -1.182376, 1, 0.7568628, 0, 1,
-1.145662, -1.848506, -2.871953, 1, 0.7607843, 0, 1,
-1.12732, -0.1186882, -2.678431, 1, 0.7686275, 0, 1,
-1.126295, -0.147467, -1.478485, 1, 0.772549, 0, 1,
-1.125081, 0.9976383, -2.855346, 1, 0.7803922, 0, 1,
-1.116451, 2.159987, 0.4943487, 1, 0.7843137, 0, 1,
-1.11596, -1.230091, -2.96132, 1, 0.7921569, 0, 1,
-1.115583, -0.2966571, -1.488159, 1, 0.7960784, 0, 1,
-1.114342, 0.2732091, -0.797269, 1, 0.8039216, 0, 1,
-1.114097, 0.312, -1.083419, 1, 0.8117647, 0, 1,
-1.110162, 0.4690265, -0.0471059, 1, 0.8156863, 0, 1,
-1.10368, 1.21485, -1.911981, 1, 0.8235294, 0, 1,
-1.10175, 0.6556867, -1.383833, 1, 0.827451, 0, 1,
-1.10044, 0.261161, -0.8122016, 1, 0.8352941, 0, 1,
-1.097252, 0.4921842, -1.683379, 1, 0.8392157, 0, 1,
-1.093175, 0.03483472, -3.307032, 1, 0.8470588, 0, 1,
-1.090464, 0.6674508, 1.794312, 1, 0.8509804, 0, 1,
-1.087962, 2.150362, -1.089524, 1, 0.8588235, 0, 1,
-1.084211, -0.01637603, -2.159935, 1, 0.8627451, 0, 1,
-1.082241, -0.1875459, -2.294712, 1, 0.8705882, 0, 1,
-1.074203, -0.5145203, 0.1465339, 1, 0.8745098, 0, 1,
-1.06684, 0.40328, -0.4685379, 1, 0.8823529, 0, 1,
-1.066263, 1.483051, 1.874885, 1, 0.8862745, 0, 1,
-1.058405, 0.4981058, -1.088615, 1, 0.8941177, 0, 1,
-1.058323, 0.7922276, -0.9975343, 1, 0.8980392, 0, 1,
-1.055976, -0.09428188, -1.44969, 1, 0.9058824, 0, 1,
-1.051952, 0.5615312, 0.5524148, 1, 0.9137255, 0, 1,
-1.051824, 0.8807358, -0.1941602, 1, 0.9176471, 0, 1,
-1.049662, -0.1385705, -0.03347104, 1, 0.9254902, 0, 1,
-1.037109, -0.1914217, -1.739284, 1, 0.9294118, 0, 1,
-1.031992, -0.9604781, -0.2061571, 1, 0.9372549, 0, 1,
-1.029031, 0.3747888, -1.720481, 1, 0.9411765, 0, 1,
-1.025337, -0.2180372, -4.522665, 1, 0.9490196, 0, 1,
-1.023898, -0.9252139, -2.816578, 1, 0.9529412, 0, 1,
-1.022488, 0.8142871, 1.545802, 1, 0.9607843, 0, 1,
-1.022296, 0.1459716, -1.554078, 1, 0.9647059, 0, 1,
-1.014357, 0.5291311, -0.8043042, 1, 0.972549, 0, 1,
-1.013216, -0.8580368, -1.776672, 1, 0.9764706, 0, 1,
-1.012506, 1.169223, -1.437484, 1, 0.9843137, 0, 1,
-1.011813, 0.2711842, -0.02000398, 1, 0.9882353, 0, 1,
-1.011086, 0.1620065, -2.588395, 1, 0.9960784, 0, 1,
-1.008535, -1.795922, -2.18195, 0.9960784, 1, 0, 1,
-1.004579, 0.6974142, -2.98897, 0.9921569, 1, 0, 1,
-0.9986722, 0.0492386, -0.2489877, 0.9843137, 1, 0, 1,
-0.9953155, -0.247349, -0.9907756, 0.9803922, 1, 0, 1,
-0.9872935, -0.1437175, -0.6120502, 0.972549, 1, 0, 1,
-0.9832128, -1.301018, -1.883827, 0.9686275, 1, 0, 1,
-0.9769692, 0.1691462, 0.9409929, 0.9607843, 1, 0, 1,
-0.9757033, 0.09425305, -1.781697, 0.9568627, 1, 0, 1,
-0.9751533, -0.8288189, -3.291034, 0.9490196, 1, 0, 1,
-0.9651697, 0.03961359, -1.582086, 0.945098, 1, 0, 1,
-0.9477758, 0.5758245, -1.525381, 0.9372549, 1, 0, 1,
-0.9247971, -0.4432961, -2.893505, 0.9333333, 1, 0, 1,
-0.9241292, -0.5296639, -1.10727, 0.9254902, 1, 0, 1,
-0.9240648, 1.123305, -1.702517, 0.9215686, 1, 0, 1,
-0.9228088, 1.220503, -0.6502004, 0.9137255, 1, 0, 1,
-0.9202306, 0.4800133, -2.34304, 0.9098039, 1, 0, 1,
-0.9170321, -1.172692, -2.512984, 0.9019608, 1, 0, 1,
-0.9156846, -0.6519099, -1.948211, 0.8941177, 1, 0, 1,
-0.9063272, -0.8585392, -1.403144, 0.8901961, 1, 0, 1,
-0.9051244, -0.6587647, -0.1248944, 0.8823529, 1, 0, 1,
-0.8986384, -0.5948462, -1.225014, 0.8784314, 1, 0, 1,
-0.8963068, -0.7868128, -1.20072, 0.8705882, 1, 0, 1,
-0.8889213, -0.5716675, -1.980558, 0.8666667, 1, 0, 1,
-0.887657, 0.8792673, -0.5123095, 0.8588235, 1, 0, 1,
-0.8815818, -0.1923402, -2.290371, 0.854902, 1, 0, 1,
-0.8802549, -0.5811772, -1.831195, 0.8470588, 1, 0, 1,
-0.8771048, 1.792243, 1.161844, 0.8431373, 1, 0, 1,
-0.8678143, -0.3675545, -1.703699, 0.8352941, 1, 0, 1,
-0.8628461, 0.6867856, -0.4831402, 0.8313726, 1, 0, 1,
-0.8498874, -0.4357139, -2.084289, 0.8235294, 1, 0, 1,
-0.8485628, -0.2459671, -1.109722, 0.8196079, 1, 0, 1,
-0.8474938, 0.2646743, -1.358143, 0.8117647, 1, 0, 1,
-0.8398975, 0.2813555, -0.5131163, 0.8078431, 1, 0, 1,
-0.8377237, -0.8979765, -1.347161, 0.8, 1, 0, 1,
-0.8367411, -1.789723, -3.065094, 0.7921569, 1, 0, 1,
-0.8280357, 0.6889619, -0.9270948, 0.7882353, 1, 0, 1,
-0.8274888, -1.518023, -3.033127, 0.7803922, 1, 0, 1,
-0.8188877, -1.435748, -3.097034, 0.7764706, 1, 0, 1,
-0.8170881, 0.4468144, -1.628997, 0.7686275, 1, 0, 1,
-0.8169904, 0.1447294, -0.4806512, 0.7647059, 1, 0, 1,
-0.8169351, 0.6367815, -2.634316, 0.7568628, 1, 0, 1,
-0.8150741, -0.02381206, -1.000204, 0.7529412, 1, 0, 1,
-0.8101498, -1.758261, -2.903753, 0.7450981, 1, 0, 1,
-0.8056422, -0.6673031, -1.519998, 0.7411765, 1, 0, 1,
-0.8030345, 1.683958, 1.019367, 0.7333333, 1, 0, 1,
-0.8021229, 1.698298, -0.3805631, 0.7294118, 1, 0, 1,
-0.8007582, 0.8429614, 0.6159234, 0.7215686, 1, 0, 1,
-0.7957765, -0.4610206, -2.491684, 0.7176471, 1, 0, 1,
-0.789172, 1.037802, 1.549756, 0.7098039, 1, 0, 1,
-0.7855601, -0.5321946, -2.862956, 0.7058824, 1, 0, 1,
-0.7829062, -0.4693542, -0.616421, 0.6980392, 1, 0, 1,
-0.7818165, -0.6635332, -1.929008, 0.6901961, 1, 0, 1,
-0.7792508, -0.9934015, -3.747836, 0.6862745, 1, 0, 1,
-0.771868, 0.1811761, -1.381301, 0.6784314, 1, 0, 1,
-0.7668925, 0.7156481, -0.8630679, 0.6745098, 1, 0, 1,
-0.7661807, 0.1001555, -0.812328, 0.6666667, 1, 0, 1,
-0.7650841, 1.592985, -1.099084, 0.6627451, 1, 0, 1,
-0.764463, -1.745391, -2.980009, 0.654902, 1, 0, 1,
-0.7608678, -0.6588307, -2.786789, 0.6509804, 1, 0, 1,
-0.7570471, -0.552084, -0.22692, 0.6431373, 1, 0, 1,
-0.7542702, 0.352217, -1.268814, 0.6392157, 1, 0, 1,
-0.7482243, -0.4557619, -2.081175, 0.6313726, 1, 0, 1,
-0.7476238, -1.757837, -3.54322, 0.627451, 1, 0, 1,
-0.7462069, 0.2193255, -1.315187, 0.6196079, 1, 0, 1,
-0.741357, 1.019077, -0.5335963, 0.6156863, 1, 0, 1,
-0.7334108, 0.4328111, -0.6377065, 0.6078432, 1, 0, 1,
-0.7330117, -1.989183, -3.441998, 0.6039216, 1, 0, 1,
-0.7288643, 1.185503, 0.3670972, 0.5960785, 1, 0, 1,
-0.7212123, -0.6489868, -2.399297, 0.5882353, 1, 0, 1,
-0.7184332, -2.19755, -3.18378, 0.5843138, 1, 0, 1,
-0.7121174, -1.248795, -1.699725, 0.5764706, 1, 0, 1,
-0.7085561, -0.5634294, -4.717579, 0.572549, 1, 0, 1,
-0.7057743, -0.9321576, -2.309442, 0.5647059, 1, 0, 1,
-0.7054602, -1.251482, -3.910221, 0.5607843, 1, 0, 1,
-0.7021287, 0.9088756, 2.306729, 0.5529412, 1, 0, 1,
-0.7015552, -0.9888153, -2.09104, 0.5490196, 1, 0, 1,
-0.7002396, 2.512049, -0.5645475, 0.5411765, 1, 0, 1,
-0.6953506, -0.8879857, -2.676939, 0.5372549, 1, 0, 1,
-0.6926233, -0.4314086, -2.497471, 0.5294118, 1, 0, 1,
-0.6917055, -0.7090642, -2.287674, 0.5254902, 1, 0, 1,
-0.6898791, 0.4620899, -1.915061, 0.5176471, 1, 0, 1,
-0.6866909, 0.6923211, -2.282271, 0.5137255, 1, 0, 1,
-0.6806093, 1.394249, 0.8439513, 0.5058824, 1, 0, 1,
-0.6805601, -0.2961726, -3.340197, 0.5019608, 1, 0, 1,
-0.670938, 0.4334162, -0.3160808, 0.4941176, 1, 0, 1,
-0.6585009, 1.02654, -1.476179, 0.4862745, 1, 0, 1,
-0.6571398, 1.460262, -3.426013, 0.4823529, 1, 0, 1,
-0.6568793, 1.218608, -2.214086, 0.4745098, 1, 0, 1,
-0.6530479, 0.2438775, -0.1204097, 0.4705882, 1, 0, 1,
-0.6523424, 1.095909, -0.3172365, 0.4627451, 1, 0, 1,
-0.6469304, -0.5300288, -1.892163, 0.4588235, 1, 0, 1,
-0.6467748, -1.249592, -2.712039, 0.4509804, 1, 0, 1,
-0.6464399, -0.767385, -3.637335, 0.4470588, 1, 0, 1,
-0.6442183, -0.1942137, -3.407852, 0.4392157, 1, 0, 1,
-0.6392105, 0.271935, -0.4340582, 0.4352941, 1, 0, 1,
-0.6385679, -0.07035232, -1.870317, 0.427451, 1, 0, 1,
-0.6364772, -1.685213, -2.541552, 0.4235294, 1, 0, 1,
-0.6315085, -0.2961335, -0.6188688, 0.4156863, 1, 0, 1,
-0.6275485, -1.600201, -3.353045, 0.4117647, 1, 0, 1,
-0.6177065, 0.5008799, 0.05399973, 0.4039216, 1, 0, 1,
-0.6158632, -0.3079721, -3.008251, 0.3960784, 1, 0, 1,
-0.6079169, 0.7898795, -0.734035, 0.3921569, 1, 0, 1,
-0.6067505, -2.021563, -4.521286, 0.3843137, 1, 0, 1,
-0.6014158, -0.7949339, -1.401059, 0.3803922, 1, 0, 1,
-0.5965822, 0.8889466, 1.160431, 0.372549, 1, 0, 1,
-0.5922943, 1.865243, 0.4914224, 0.3686275, 1, 0, 1,
-0.5859024, 0.9452784, 0.3409672, 0.3607843, 1, 0, 1,
-0.5857605, -0.5959809, -3.123826, 0.3568628, 1, 0, 1,
-0.5852669, 0.1535323, -1.40041, 0.3490196, 1, 0, 1,
-0.5829039, 1.16195, 0.5441288, 0.345098, 1, 0, 1,
-0.5762578, 1.521698, -1.567988, 0.3372549, 1, 0, 1,
-0.573023, -0.8638793, -2.445676, 0.3333333, 1, 0, 1,
-0.570045, 0.5729743, -1.909888, 0.3254902, 1, 0, 1,
-0.5672489, 0.1677108, -2.546738, 0.3215686, 1, 0, 1,
-0.5661183, -1.826113, -2.698039, 0.3137255, 1, 0, 1,
-0.5645265, 0.002167198, -0.9753531, 0.3098039, 1, 0, 1,
-0.5643765, 0.3768702, -1.176726, 0.3019608, 1, 0, 1,
-0.5618668, 0.6414976, 0.5270016, 0.2941177, 1, 0, 1,
-0.5612364, 1.350401, -0.7346835, 0.2901961, 1, 0, 1,
-0.5573142, -0.1858606, -3.227646, 0.282353, 1, 0, 1,
-0.5571978, -0.2349982, -2.264397, 0.2784314, 1, 0, 1,
-0.5567541, 1.057704, -1.430242, 0.2705882, 1, 0, 1,
-0.555388, -0.9344169, -3.352509, 0.2666667, 1, 0, 1,
-0.5547732, 0.5356327, -2.025339, 0.2588235, 1, 0, 1,
-0.5504003, -0.6047972, -2.162712, 0.254902, 1, 0, 1,
-0.5485969, 0.9898255, -0.07438605, 0.2470588, 1, 0, 1,
-0.5485688, 2.139676, 0.9278783, 0.2431373, 1, 0, 1,
-0.5475673, -0.4237813, -0.9321151, 0.2352941, 1, 0, 1,
-0.5394998, -1.480222, -4.416894, 0.2313726, 1, 0, 1,
-0.5380885, -0.1426081, -2.75601, 0.2235294, 1, 0, 1,
-0.5379387, -0.7890837, -4.563496, 0.2196078, 1, 0, 1,
-0.5367579, 0.4165431, -1.843921, 0.2117647, 1, 0, 1,
-0.5351232, 0.9990523, -2.833846, 0.2078431, 1, 0, 1,
-0.5340616, 0.3729151, 0.5931227, 0.2, 1, 0, 1,
-0.5290987, 0.1468865, -0.3107346, 0.1921569, 1, 0, 1,
-0.5261148, -0.05261633, -0.2787841, 0.1882353, 1, 0, 1,
-0.5257167, -0.5062477, -1.709131, 0.1803922, 1, 0, 1,
-0.5247923, 1.289047, -0.6296513, 0.1764706, 1, 0, 1,
-0.5161943, 1.718634, 0.5313484, 0.1686275, 1, 0, 1,
-0.5145461, -0.2556228, 0.3730032, 0.1647059, 1, 0, 1,
-0.5136697, 1.518504, -1.906251, 0.1568628, 1, 0, 1,
-0.5124983, -1.891723, -2.385929, 0.1529412, 1, 0, 1,
-0.5100622, -1.960635, -3.354115, 0.145098, 1, 0, 1,
-0.5095125, -0.5639457, -2.082127, 0.1411765, 1, 0, 1,
-0.508768, -0.9668435, -2.385531, 0.1333333, 1, 0, 1,
-0.5079839, 1.527607, 0.3749084, 0.1294118, 1, 0, 1,
-0.5065391, 1.237057, 1.077961, 0.1215686, 1, 0, 1,
-0.5053047, -0.8609009, -3.59697, 0.1176471, 1, 0, 1,
-0.5043765, 0.2024481, -2.141086, 0.1098039, 1, 0, 1,
-0.503216, -1.03271, -1.536296, 0.1058824, 1, 0, 1,
-0.5015036, -0.1046692, -2.225678, 0.09803922, 1, 0, 1,
-0.4998773, 0.2311912, -0.1357883, 0.09019608, 1, 0, 1,
-0.4965684, 0.3448832, -1.759613, 0.08627451, 1, 0, 1,
-0.4944246, -0.9611421, -3.824851, 0.07843138, 1, 0, 1,
-0.4918824, 0.2836227, -0.3672908, 0.07450981, 1, 0, 1,
-0.4901638, 1.841323, 0.8819075, 0.06666667, 1, 0, 1,
-0.4867094, 2.252804, -2.227838, 0.0627451, 1, 0, 1,
-0.483443, -0.2693039, -2.07796, 0.05490196, 1, 0, 1,
-0.4815195, -1.277256, -3.112568, 0.05098039, 1, 0, 1,
-0.4794033, -0.9483914, -3.299208, 0.04313726, 1, 0, 1,
-0.4786151, 0.3828234, -2.666747, 0.03921569, 1, 0, 1,
-0.4780498, -0.8994419, -0.894563, 0.03137255, 1, 0, 1,
-0.4758539, 1.454149, 0.1853779, 0.02745098, 1, 0, 1,
-0.474241, -1.524515, -3.439023, 0.01960784, 1, 0, 1,
-0.4660518, -1.292441, -3.490306, 0.01568628, 1, 0, 1,
-0.4646229, 1.566503, 1.200418, 0.007843138, 1, 0, 1,
-0.4545836, -1.053576, -1.762361, 0.003921569, 1, 0, 1,
-0.4491808, -0.3502846, -3.048889, 0, 1, 0.003921569, 1,
-0.4453492, 0.9040287, 0.9960624, 0, 1, 0.01176471, 1,
-0.4434568, 0.8780157, 0.759994, 0, 1, 0.01568628, 1,
-0.442339, 0.03448723, -0.5029415, 0, 1, 0.02352941, 1,
-0.4421025, 0.05059987, -1.763952, 0, 1, 0.02745098, 1,
-0.4396262, -0.9882412, -1.807131, 0, 1, 0.03529412, 1,
-0.4357552, 1.55512, -1.551949, 0, 1, 0.03921569, 1,
-0.4355013, 0.4042667, -2.351103, 0, 1, 0.04705882, 1,
-0.4347024, -0.4688167, -2.270758, 0, 1, 0.05098039, 1,
-0.4342666, -0.3275559, -1.125488, 0, 1, 0.05882353, 1,
-0.4340544, 0.2280377, -2.549105, 0, 1, 0.0627451, 1,
-0.4330394, -1.488034, -2.00222, 0, 1, 0.07058824, 1,
-0.4291577, -0.09334496, -1.41316, 0, 1, 0.07450981, 1,
-0.4275392, -0.825111, -2.560632, 0, 1, 0.08235294, 1,
-0.4272939, 2.035577, -0.2610891, 0, 1, 0.08627451, 1,
-0.4188838, -0.3213874, -2.241062, 0, 1, 0.09411765, 1,
-0.4130059, -0.8418822, -3.616122, 0, 1, 0.1019608, 1,
-0.4118834, -1.040438, -1.495123, 0, 1, 0.1058824, 1,
-0.4118026, -1.747949, -2.46267, 0, 1, 0.1137255, 1,
-0.407167, 0.656604, -1.058686, 0, 1, 0.1176471, 1,
-0.4015295, 0.3109641, -0.784984, 0, 1, 0.1254902, 1,
-0.4012665, 0.5029817, 0.9161465, 0, 1, 0.1294118, 1,
-0.3999052, -0.3367195, -2.420496, 0, 1, 0.1372549, 1,
-0.3998497, 1.769071, 0.6836213, 0, 1, 0.1411765, 1,
-0.398812, 0.8633726, -0.8158552, 0, 1, 0.1490196, 1,
-0.3945497, -0.3237517, -2.11781, 0, 1, 0.1529412, 1,
-0.3921351, -0.08905755, -2.045511, 0, 1, 0.1607843, 1,
-0.3863403, 0.6414133, -3.268603, 0, 1, 0.1647059, 1,
-0.3860663, 0.4338318, -1.016162, 0, 1, 0.172549, 1,
-0.3851269, -1.907798, -0.8969899, 0, 1, 0.1764706, 1,
-0.3813493, -0.1915962, -1.761228, 0, 1, 0.1843137, 1,
-0.380352, 0.2341648, -1.955131, 0, 1, 0.1882353, 1,
-0.3793143, 0.4460303, -1.259131, 0, 1, 0.1960784, 1,
-0.378249, 0.8583454, 0.2012833, 0, 1, 0.2039216, 1,
-0.3775406, -0.04014843, -2.551327, 0, 1, 0.2078431, 1,
-0.3770914, 0.2761892, -0.3861664, 0, 1, 0.2156863, 1,
-0.3737612, 0.7194518, 0.1273095, 0, 1, 0.2196078, 1,
-0.3645887, 1.546133, -0.9132802, 0, 1, 0.227451, 1,
-0.3554757, 2.316295, -0.4771011, 0, 1, 0.2313726, 1,
-0.3543173, 0.3783246, -0.4712919, 0, 1, 0.2392157, 1,
-0.3531043, -0.5645179, -2.862091, 0, 1, 0.2431373, 1,
-0.3475649, 0.3273185, 0.7696002, 0, 1, 0.2509804, 1,
-0.3454816, 0.07452016, -0.6090699, 0, 1, 0.254902, 1,
-0.3369194, 0.8623087, -1.922779, 0, 1, 0.2627451, 1,
-0.3367234, 0.2971999, -0.4827357, 0, 1, 0.2666667, 1,
-0.3353958, -0.5644278, -2.630262, 0, 1, 0.2745098, 1,
-0.3337509, -1.304771, -2.984062, 0, 1, 0.2784314, 1,
-0.3268045, 1.405137, -1.124452, 0, 1, 0.2862745, 1,
-0.3251274, -0.686748, -2.464558, 0, 1, 0.2901961, 1,
-0.3200592, -0.1943347, -2.318293, 0, 1, 0.2980392, 1,
-0.3151807, -0.54338, -3.171121, 0, 1, 0.3058824, 1,
-0.3122024, 0.6135805, 1.391484, 0, 1, 0.3098039, 1,
-0.3092608, -1.548894, -3.064346, 0, 1, 0.3176471, 1,
-0.3083929, 0.7803249, -0.6898143, 0, 1, 0.3215686, 1,
-0.3082072, 0.954614, -0.1858899, 0, 1, 0.3294118, 1,
-0.303036, 0.186979, -1.178742, 0, 1, 0.3333333, 1,
-0.2989094, -1.038125, -2.934925, 0, 1, 0.3411765, 1,
-0.2970982, 0.8640778, -1.23119, 0, 1, 0.345098, 1,
-0.295449, 0.3305245, 0.7418599, 0, 1, 0.3529412, 1,
-0.2953348, -1.104686, -1.882508, 0, 1, 0.3568628, 1,
-0.2933951, -0.7961397, -1.350614, 0, 1, 0.3647059, 1,
-0.2861198, -0.5744903, -3.642786, 0, 1, 0.3686275, 1,
-0.2840526, 1.174555, -0.2664264, 0, 1, 0.3764706, 1,
-0.283388, -0.5857176, -3.894349, 0, 1, 0.3803922, 1,
-0.2819472, -0.1712277, 0.3896917, 0, 1, 0.3882353, 1,
-0.2813344, 0.2669125, -0.5210133, 0, 1, 0.3921569, 1,
-0.2802484, -0.8950859, -2.688694, 0, 1, 0.4, 1,
-0.2802089, -1.270888, -3.548281, 0, 1, 0.4078431, 1,
-0.2778416, 0.5188161, -1.404579, 0, 1, 0.4117647, 1,
-0.274475, 0.2805529, -0.01659141, 0, 1, 0.4196078, 1,
-0.2740243, -0.8924528, -2.624907, 0, 1, 0.4235294, 1,
-0.2697037, -0.6561449, -3.783985, 0, 1, 0.4313726, 1,
-0.2695006, -0.09385655, -1.15611, 0, 1, 0.4352941, 1,
-0.2663099, 1.058038, -1.560547, 0, 1, 0.4431373, 1,
-0.2653808, 0.1735069, -1.002192, 0, 1, 0.4470588, 1,
-0.2609029, 0.4003654, -2.981811, 0, 1, 0.454902, 1,
-0.2562937, -0.319647, -3.303195, 0, 1, 0.4588235, 1,
-0.2555804, -0.4547229, -1.465959, 0, 1, 0.4666667, 1,
-0.2555583, -0.6237877, -4.012152, 0, 1, 0.4705882, 1,
-0.2531508, -1.449693, -2.894725, 0, 1, 0.4784314, 1,
-0.2530541, 0.8928953, -1.142764, 0, 1, 0.4823529, 1,
-0.2480363, 2.097847, -0.5566747, 0, 1, 0.4901961, 1,
-0.2474322, -0.6763785, -3.282914, 0, 1, 0.4941176, 1,
-0.2460242, -1.008643, -1.978649, 0, 1, 0.5019608, 1,
-0.2402787, -0.3289947, -4.163733, 0, 1, 0.509804, 1,
-0.2401937, 0.622142, -1.670308, 0, 1, 0.5137255, 1,
-0.2393666, -0.7315238, -4.1059, 0, 1, 0.5215687, 1,
-0.239031, -0.4368494, -1.900235, 0, 1, 0.5254902, 1,
-0.2338998, 0.4153007, -0.3717896, 0, 1, 0.5333334, 1,
-0.2337884, -0.3583377, -3.3585, 0, 1, 0.5372549, 1,
-0.2335724, 0.1782669, -2.315795, 0, 1, 0.5450981, 1,
-0.2304282, -0.1320936, -2.629771, 0, 1, 0.5490196, 1,
-0.2282816, 0.9123852, -1.769092, 0, 1, 0.5568628, 1,
-0.2266693, -0.2647544, -3.399128, 0, 1, 0.5607843, 1,
-0.2216721, 0.9070914, 2.107277, 0, 1, 0.5686275, 1,
-0.2203149, 0.6159037, -0.2798683, 0, 1, 0.572549, 1,
-0.2191773, 0.5521759, -2.676433, 0, 1, 0.5803922, 1,
-0.2165817, -1.827088, -3.97564, 0, 1, 0.5843138, 1,
-0.2142745, -0.370551, -2.873485, 0, 1, 0.5921569, 1,
-0.2134045, -1.659382, -2.39185, 0, 1, 0.5960785, 1,
-0.2096033, 1.3522, 0.01039759, 0, 1, 0.6039216, 1,
-0.2075637, 0.07785556, -1.364579, 0, 1, 0.6117647, 1,
-0.2060669, 2.196362, -0.8316056, 0, 1, 0.6156863, 1,
-0.2008988, 1.035811, 0.3156272, 0, 1, 0.6235294, 1,
-0.2004749, 1.752385, -0.0250362, 0, 1, 0.627451, 1,
-0.1958214, 0.5559369, -0.163135, 0, 1, 0.6352941, 1,
-0.1934759, 0.07110984, -1.33797, 0, 1, 0.6392157, 1,
-0.1817553, -1.73752, -2.54361, 0, 1, 0.6470588, 1,
-0.1770677, -0.8323447, -2.508143, 0, 1, 0.6509804, 1,
-0.1706876, -0.2174939, -1.856058, 0, 1, 0.6588235, 1,
-0.1705059, 0.3350148, 1.190417, 0, 1, 0.6627451, 1,
-0.1684196, -0.7743112, -3.05201, 0, 1, 0.6705883, 1,
-0.1614674, -0.5786538, -0.227304, 0, 1, 0.6745098, 1,
-0.1605666, -0.04180933, -1.25194, 0, 1, 0.682353, 1,
-0.1568214, 0.1181676, -0.6627945, 0, 1, 0.6862745, 1,
-0.1544685, 0.3720981, -0.42906, 0, 1, 0.6941177, 1,
-0.1528032, -1.189383, -2.585481, 0, 1, 0.7019608, 1,
-0.1462062, 0.5777177, 1.00328, 0, 1, 0.7058824, 1,
-0.1441143, -0.1891139, -2.749715, 0, 1, 0.7137255, 1,
-0.1428246, 0.2853428, -1.913041, 0, 1, 0.7176471, 1,
-0.1427965, 0.6720679, -0.4650694, 0, 1, 0.7254902, 1,
-0.1411496, -0.5742145, -2.338665, 0, 1, 0.7294118, 1,
-0.1411317, -0.3841815, -1.997125, 0, 1, 0.7372549, 1,
-0.1393086, 0.9419509, 0.5067812, 0, 1, 0.7411765, 1,
-0.1328354, 1.268436, -0.5019338, 0, 1, 0.7490196, 1,
-0.1323653, -2.272143, -1.462411, 0, 1, 0.7529412, 1,
-0.1305074, -0.4807987, -3.895647, 0, 1, 0.7607843, 1,
-0.1297645, 0.1052566, -2.294191, 0, 1, 0.7647059, 1,
-0.1289898, -0.7714231, -4.15378, 0, 1, 0.772549, 1,
-0.1281212, 0.9295546, -0.5549259, 0, 1, 0.7764706, 1,
-0.1276624, 0.1604238, -1.735803, 0, 1, 0.7843137, 1,
-0.122674, 0.2298727, -0.1585374, 0, 1, 0.7882353, 1,
-0.1211285, -0.5472727, -3.821688, 0, 1, 0.7960784, 1,
-0.119399, -0.1487362, -3.152844, 0, 1, 0.8039216, 1,
-0.1112418, -0.3108102, -1.559279, 0, 1, 0.8078431, 1,
-0.1067144, 0.4820875, -0.9571528, 0, 1, 0.8156863, 1,
-0.10326, 0.9427993, -1.421129, 0, 1, 0.8196079, 1,
-0.102044, 0.1083752, -0.2554585, 0, 1, 0.827451, 1,
-0.1018005, -0.1487921, -2.436323, 0, 1, 0.8313726, 1,
-0.1014779, -1.091912, -1.650681, 0, 1, 0.8392157, 1,
-0.09511251, -0.9198076, -3.415642, 0, 1, 0.8431373, 1,
-0.08699425, -0.4380016, -4.080293, 0, 1, 0.8509804, 1,
-0.08610004, 0.2515945, 0.09213404, 0, 1, 0.854902, 1,
-0.08579373, 0.09502748, -0.2521692, 0, 1, 0.8627451, 1,
-0.07297351, -0.2118475, -3.90516, 0, 1, 0.8666667, 1,
-0.07198861, 1.423129, 2.082547, 0, 1, 0.8745098, 1,
-0.07046778, 1.969627, 0.003339702, 0, 1, 0.8784314, 1,
-0.06668428, 1.123373, 0.6364473, 0, 1, 0.8862745, 1,
-0.06231841, 0.6640945, 0.02519865, 0, 1, 0.8901961, 1,
-0.06188219, -0.31157, -3.166421, 0, 1, 0.8980392, 1,
-0.06163651, -0.9964546, -3.263215, 0, 1, 0.9058824, 1,
-0.05975479, 1.159529, -0.5967314, 0, 1, 0.9098039, 1,
-0.05552487, -0.0122876, -3.095678, 0, 1, 0.9176471, 1,
-0.05455701, -2.377772, -2.430145, 0, 1, 0.9215686, 1,
-0.0493317, -1.11701, -3.267628, 0, 1, 0.9294118, 1,
-0.04920494, 0.5512053, -0.09799929, 0, 1, 0.9333333, 1,
-0.04906659, 0.2480541, 1.1566, 0, 1, 0.9411765, 1,
-0.04765649, -1.459006, -3.35513, 0, 1, 0.945098, 1,
-0.04575985, 0.3952253, -1.318918, 0, 1, 0.9529412, 1,
-0.0450249, -0.4764575, -2.583691, 0, 1, 0.9568627, 1,
-0.04304076, -0.2618795, -1.721021, 0, 1, 0.9647059, 1,
-0.03857719, -0.1406042, -3.509259, 0, 1, 0.9686275, 1,
-0.03762535, 0.8988458, -1.096826, 0, 1, 0.9764706, 1,
-0.03700292, -0.7639003, -4.567991, 0, 1, 0.9803922, 1,
-0.02808772, -0.9145191, -2.943737, 0, 1, 0.9882353, 1,
-0.02773025, 0.4398173, -1.310133, 0, 1, 0.9921569, 1,
-0.02405197, 0.2659076, 0.06126584, 0, 1, 1, 1,
-0.02383634, 1.044073, -0.1734973, 0, 0.9921569, 1, 1,
-0.0224077, -1.426626, -4.152683, 0, 0.9882353, 1, 1,
-0.02034056, 0.07938074, 0.2270836, 0, 0.9803922, 1, 1,
-0.01828621, -1.267317, -4.131357, 0, 0.9764706, 1, 1,
-0.0108317, -0.4319175, -3.650739, 0, 0.9686275, 1, 1,
-0.003811049, 0.1501497, -1.718737, 0, 0.9647059, 1, 1,
-0.001865282, -0.7794957, -3.60496, 0, 0.9568627, 1, 1,
-0.0001581767, -1.781039, -1.697576, 0, 0.9529412, 1, 1,
0.000975357, -0.2859847, 2.902826, 0, 0.945098, 1, 1,
0.002298278, -1.033838, 2.314421, 0, 0.9411765, 1, 1,
0.003378709, 0.1517039, 1.521412, 0, 0.9333333, 1, 1,
0.01643247, -0.06339689, 3.659444, 0, 0.9294118, 1, 1,
0.01643337, -0.1737388, 4.112097, 0, 0.9215686, 1, 1,
0.01676195, 0.9992619, -1.102352, 0, 0.9176471, 1, 1,
0.01836964, 0.737517, -0.2566938, 0, 0.9098039, 1, 1,
0.021852, 1.516546, -0.4201336, 0, 0.9058824, 1, 1,
0.02489015, -1.329838, 3.742715, 0, 0.8980392, 1, 1,
0.02899868, 0.1217408, -0.4591693, 0, 0.8901961, 1, 1,
0.02933566, 2.156888, -0.07964819, 0, 0.8862745, 1, 1,
0.02973456, -0.3089969, 2.507696, 0, 0.8784314, 1, 1,
0.03386157, 1.167293, 0.6709634, 0, 0.8745098, 1, 1,
0.03572807, -0.5780903, 4.098183, 0, 0.8666667, 1, 1,
0.03696904, -1.294206, 3.186372, 0, 0.8627451, 1, 1,
0.03811834, 0.4865314, -0.5441947, 0, 0.854902, 1, 1,
0.04592542, 0.7995224, -0.3126099, 0, 0.8509804, 1, 1,
0.04700664, -1.395073, 1.55392, 0, 0.8431373, 1, 1,
0.04743107, 1.370465, 0.527659, 0, 0.8392157, 1, 1,
0.05276677, -1.992768, 4.338348, 0, 0.8313726, 1, 1,
0.05362163, -1.083728, 2.220122, 0, 0.827451, 1, 1,
0.0539714, 0.4628051, 1.268545, 0, 0.8196079, 1, 1,
0.05490511, 0.1905851, -0.03867853, 0, 0.8156863, 1, 1,
0.05549946, -1.492751, 1.589609, 0, 0.8078431, 1, 1,
0.05700384, 0.845588, 2.097533, 0, 0.8039216, 1, 1,
0.05740742, 0.2149282, 0.7636189, 0, 0.7960784, 1, 1,
0.05837596, -0.7157461, 2.88631, 0, 0.7882353, 1, 1,
0.0589495, -0.6438992, 3.20025, 0, 0.7843137, 1, 1,
0.06550628, -0.2462267, 3.531846, 0, 0.7764706, 1, 1,
0.06817206, -1.199815, 1.288856, 0, 0.772549, 1, 1,
0.07222259, -0.7924957, 2.549047, 0, 0.7647059, 1, 1,
0.07798308, -0.1522485, 2.085996, 0, 0.7607843, 1, 1,
0.08158208, -0.2935801, 4.469337, 0, 0.7529412, 1, 1,
0.08495484, -1.648032, 1.335317, 0, 0.7490196, 1, 1,
0.09598591, 0.8921847, 0.8869562, 0, 0.7411765, 1, 1,
0.1006612, -0.2386056, 2.292563, 0, 0.7372549, 1, 1,
0.1010563, -1.446413, 0.8642151, 0, 0.7294118, 1, 1,
0.1014125, 0.1020069, 1.202915, 0, 0.7254902, 1, 1,
0.1054931, 0.7920403, -0.8848977, 0, 0.7176471, 1, 1,
0.1081336, -0.3579283, 2.516034, 0, 0.7137255, 1, 1,
0.1096365, 0.279368, 0.4268025, 0, 0.7058824, 1, 1,
0.1099499, 0.5538414, 1.843916, 0, 0.6980392, 1, 1,
0.1115228, -0.3724661, 2.694913, 0, 0.6941177, 1, 1,
0.1130075, 0.6443254, 2.03497, 0, 0.6862745, 1, 1,
0.1131454, 0.8517275, 1.120189, 0, 0.682353, 1, 1,
0.1275395, 0.1705886, 1.409257, 0, 0.6745098, 1, 1,
0.1288871, -1.231109, 2.629536, 0, 0.6705883, 1, 1,
0.1295738, -0.06395792, 1.50912, 0, 0.6627451, 1, 1,
0.1309597, 1.35897, 1.824471, 0, 0.6588235, 1, 1,
0.1315054, 1.416272, -0.7618967, 0, 0.6509804, 1, 1,
0.1329144, -1.438082, 3.902908, 0, 0.6470588, 1, 1,
0.1375761, -0.3507832, 3.546772, 0, 0.6392157, 1, 1,
0.1410047, -1.730076, 3.718614, 0, 0.6352941, 1, 1,
0.1435314, 1.152962, -1.431947, 0, 0.627451, 1, 1,
0.1485489, -0.526008, 3.089222, 0, 0.6235294, 1, 1,
0.1510587, 1.785608, 0.527844, 0, 0.6156863, 1, 1,
0.1534486, 0.7462302, -0.2845959, 0, 0.6117647, 1, 1,
0.1548362, -0.330999, 2.792302, 0, 0.6039216, 1, 1,
0.1551059, -0.1854245, 2.031067, 0, 0.5960785, 1, 1,
0.1560666, -0.9764436, 3.643638, 0, 0.5921569, 1, 1,
0.1600809, -0.1690697, 2.317781, 0, 0.5843138, 1, 1,
0.1607632, 0.733268, 0.6088058, 0, 0.5803922, 1, 1,
0.1621438, -0.2875701, 0.05914014, 0, 0.572549, 1, 1,
0.170455, 0.1902214, -0.8439398, 0, 0.5686275, 1, 1,
0.1723204, -0.4520446, 2.88974, 0, 0.5607843, 1, 1,
0.1748116, -0.04704414, 0.8590524, 0, 0.5568628, 1, 1,
0.1764486, -0.04974017, 1.348349, 0, 0.5490196, 1, 1,
0.1801545, 0.8550442, -1.311897, 0, 0.5450981, 1, 1,
0.1811629, 1.454655, 1.03199, 0, 0.5372549, 1, 1,
0.1832708, -0.5729676, 1.595438, 0, 0.5333334, 1, 1,
0.1846153, -0.6549817, 1.761821, 0, 0.5254902, 1, 1,
0.187322, -0.1607428, 2.231719, 0, 0.5215687, 1, 1,
0.1874936, 0.726712, -0.528446, 0, 0.5137255, 1, 1,
0.1876564, 0.05355127, 1.151502, 0, 0.509804, 1, 1,
0.1880408, 1.178401, -0.8991155, 0, 0.5019608, 1, 1,
0.1889538, 0.3963841, 0.445865, 0, 0.4941176, 1, 1,
0.1910145, 0.4745546, 0.1633534, 0, 0.4901961, 1, 1,
0.1926579, -1.541805, 4.474267, 0, 0.4823529, 1, 1,
0.1930941, 1.088017, 0.2048746, 0, 0.4784314, 1, 1,
0.1941117, -0.03363926, 2.072371, 0, 0.4705882, 1, 1,
0.195441, -0.0357723, 0.3224768, 0, 0.4666667, 1, 1,
0.1955257, 0.5818169, 0.6226714, 0, 0.4588235, 1, 1,
0.1997185, 0.1535395, 0.553323, 0, 0.454902, 1, 1,
0.2032724, -0.0325888, 0.271432, 0, 0.4470588, 1, 1,
0.2051255, -0.1985229, 2.730883, 0, 0.4431373, 1, 1,
0.20922, 0.3841023, -0.2215349, 0, 0.4352941, 1, 1,
0.2118715, 1.402887, 0.8732207, 0, 0.4313726, 1, 1,
0.2133663, 0.1379288, 1.801137, 0, 0.4235294, 1, 1,
0.2137271, 0.8970561, -0.4375528, 0, 0.4196078, 1, 1,
0.2191638, -1.531379, 2.905968, 0, 0.4117647, 1, 1,
0.226168, 0.4138136, -1.46718, 0, 0.4078431, 1, 1,
0.2265177, 0.3797591, 0.8913273, 0, 0.4, 1, 1,
0.2278241, 0.4644221, 1.029737, 0, 0.3921569, 1, 1,
0.2289115, -0.4112558, 1.716446, 0, 0.3882353, 1, 1,
0.2317312, 0.3682298, 1.999344, 0, 0.3803922, 1, 1,
0.2358701, -1.113343, 2.68505, 0, 0.3764706, 1, 1,
0.2377906, -0.02652339, 1.001189, 0, 0.3686275, 1, 1,
0.2401758, -1.172756, 3.38555, 0, 0.3647059, 1, 1,
0.2431372, -1.347046, 0.7217593, 0, 0.3568628, 1, 1,
0.2455732, 0.7984454, -1.595634, 0, 0.3529412, 1, 1,
0.2483331, 0.07515166, 1.639383, 0, 0.345098, 1, 1,
0.2509432, -1.360984, 5.242358, 0, 0.3411765, 1, 1,
0.2514271, -0.9257399, 1.533327, 0, 0.3333333, 1, 1,
0.2551008, 0.02639959, 1.805133, 0, 0.3294118, 1, 1,
0.2557094, -0.7245981, 3.28263, 0, 0.3215686, 1, 1,
0.2560415, 0.4402417, -1.646021, 0, 0.3176471, 1, 1,
0.2613184, 0.3848661, 2.043854, 0, 0.3098039, 1, 1,
0.2625627, -0.6312846, 3.94582, 0, 0.3058824, 1, 1,
0.264166, -0.6444768, 1.994539, 0, 0.2980392, 1, 1,
0.2642729, 0.7865926, 0.7397962, 0, 0.2901961, 1, 1,
0.2690777, -0.6060398, 2.197623, 0, 0.2862745, 1, 1,
0.2728048, 0.5881336, 1.648811, 0, 0.2784314, 1, 1,
0.2766981, -1.505922, 3.608007, 0, 0.2745098, 1, 1,
0.2785063, -1.314973, 3.561902, 0, 0.2666667, 1, 1,
0.2786159, 1.208984, 0.4761607, 0, 0.2627451, 1, 1,
0.2800017, 0.6369479, 0.986805, 0, 0.254902, 1, 1,
0.2832409, -1.151299, 2.411793, 0, 0.2509804, 1, 1,
0.2885779, -1.287854, 4.488704, 0, 0.2431373, 1, 1,
0.2916868, 0.4020966, 0.008965142, 0, 0.2392157, 1, 1,
0.2960037, -1.257025, 1.850404, 0, 0.2313726, 1, 1,
0.2981033, -2.361159, 2.724968, 0, 0.227451, 1, 1,
0.2981833, 2.075331, -0.1505724, 0, 0.2196078, 1, 1,
0.2987665, 0.6739433, -0.1920179, 0, 0.2156863, 1, 1,
0.2990665, 0.5809543, 0.8066592, 0, 0.2078431, 1, 1,
0.3024991, 1.106287, 0.7417271, 0, 0.2039216, 1, 1,
0.3026221, 0.722689, 1.634845, 0, 0.1960784, 1, 1,
0.3029208, -0.1581362, 1.016298, 0, 0.1882353, 1, 1,
0.3080128, 0.09376952, 0.9829715, 0, 0.1843137, 1, 1,
0.3083089, -0.380496, 1.786209, 0, 0.1764706, 1, 1,
0.3142462, -0.2627975, 3.685043, 0, 0.172549, 1, 1,
0.3162897, 0.4634004, 0.8407471, 0, 0.1647059, 1, 1,
0.3164657, 0.2047477, -0.5408481, 0, 0.1607843, 1, 1,
0.3212253, -0.2962933, 1.915262, 0, 0.1529412, 1, 1,
0.3235834, 0.1301335, -0.03690248, 0, 0.1490196, 1, 1,
0.3304144, -0.7685468, 4.283724, 0, 0.1411765, 1, 1,
0.3306624, 0.6470095, -0.6869843, 0, 0.1372549, 1, 1,
0.3367158, 0.239063, 1.211822, 0, 0.1294118, 1, 1,
0.3369081, -0.2034662, 3.273326, 0, 0.1254902, 1, 1,
0.3385739, -1.811038, 2.813562, 0, 0.1176471, 1, 1,
0.3541473, -0.5639964, 2.368977, 0, 0.1137255, 1, 1,
0.3562605, -0.4183263, 1.980149, 0, 0.1058824, 1, 1,
0.3571849, 0.1425363, 0.7619753, 0, 0.09803922, 1, 1,
0.3616517, 0.3215637, -0.183602, 0, 0.09411765, 1, 1,
0.3622903, 0.2956259, -0.05868544, 0, 0.08627451, 1, 1,
0.3707689, -2.380655, 2.642562, 0, 0.08235294, 1, 1,
0.3738387, 0.1418273, 1.240329, 0, 0.07450981, 1, 1,
0.3815452, -0.6558889, 4.208168, 0, 0.07058824, 1, 1,
0.3861226, 0.6272848, 0.474457, 0, 0.0627451, 1, 1,
0.3890031, 0.009052971, 0.9640438, 0, 0.05882353, 1, 1,
0.3897274, 0.7958247, -1.179245, 0, 0.05098039, 1, 1,
0.3905067, -0.4786817, 3.768087, 0, 0.04705882, 1, 1,
0.3920115, -0.6705751, 3.269485, 0, 0.03921569, 1, 1,
0.3996983, -1.335483, 1.234267, 0, 0.03529412, 1, 1,
0.4003864, 0.05093995, 0.1877391, 0, 0.02745098, 1, 1,
0.4048871, 0.8757846, -0.5381261, 0, 0.02352941, 1, 1,
0.405194, 0.5551805, -0.2874425, 0, 0.01568628, 1, 1,
0.4057343, 0.9119757, -1.053453, 0, 0.01176471, 1, 1,
0.4066781, 1.925031, 0.7231304, 0, 0.003921569, 1, 1,
0.4075813, -0.6157258, 2.432903, 0.003921569, 0, 1, 1,
0.4102716, -1.037455, 4.198456, 0.007843138, 0, 1, 1,
0.4158574, 0.3211577, 0.8770601, 0.01568628, 0, 1, 1,
0.4187821, -0.8986111, 3.381672, 0.01960784, 0, 1, 1,
0.420182, -0.6561408, 2.421556, 0.02745098, 0, 1, 1,
0.4202949, 0.8471431, -0.4928361, 0.03137255, 0, 1, 1,
0.4225656, 0.9632275, 1.465828, 0.03921569, 0, 1, 1,
0.423602, -2.443883, 2.871597, 0.04313726, 0, 1, 1,
0.4284934, -0.6720267, 1.35739, 0.05098039, 0, 1, 1,
0.4301125, 0.3248387, -0.03526943, 0.05490196, 0, 1, 1,
0.432545, 0.3152159, 0.4579195, 0.0627451, 0, 1, 1,
0.440058, -0.7466409, 2.671243, 0.06666667, 0, 1, 1,
0.4448607, -1.688031, 1.881386, 0.07450981, 0, 1, 1,
0.4452044, -1.611324, 3.563607, 0.07843138, 0, 1, 1,
0.4501995, 0.405277, 1.844962, 0.08627451, 0, 1, 1,
0.4534535, 0.4892783, 0.8210943, 0.09019608, 0, 1, 1,
0.4535266, 0.3221247, 0.9828598, 0.09803922, 0, 1, 1,
0.4571416, 0.9130293, 0.07786737, 0.1058824, 0, 1, 1,
0.4615913, 0.6448436, -1.419515, 0.1098039, 0, 1, 1,
0.4630428, -1.919539, 2.190443, 0.1176471, 0, 1, 1,
0.4653316, 0.2186595, 0.4390076, 0.1215686, 0, 1, 1,
0.4653938, -0.7569843, 3.222571, 0.1294118, 0, 1, 1,
0.4693045, 0.253304, -0.5157961, 0.1333333, 0, 1, 1,
0.4707208, -0.3207194, 0.7227037, 0.1411765, 0, 1, 1,
0.4711797, 0.1651526, 1.110294, 0.145098, 0, 1, 1,
0.4742004, -0.5010262, 1.51714, 0.1529412, 0, 1, 1,
0.4790096, 1.307435, -1.521459, 0.1568628, 0, 1, 1,
0.4906513, -0.9167464, 3.96431, 0.1647059, 0, 1, 1,
0.491992, -0.08459475, 0.8052009, 0.1686275, 0, 1, 1,
0.4931059, 0.448424, 1.490802, 0.1764706, 0, 1, 1,
0.4939408, 1.083602, -0.3290716, 0.1803922, 0, 1, 1,
0.4961548, -1.532285, 4.021814, 0.1882353, 0, 1, 1,
0.497093, -1.342499, 2.850978, 0.1921569, 0, 1, 1,
0.4974243, -1.818382, 3.338159, 0.2, 0, 1, 1,
0.4992777, 1.266066, 0.01795577, 0.2078431, 0, 1, 1,
0.5065385, 1.937992, 0.9944074, 0.2117647, 0, 1, 1,
0.5088052, 0.8573742, -0.002775526, 0.2196078, 0, 1, 1,
0.5089923, 0.8086289, -0.339432, 0.2235294, 0, 1, 1,
0.5095231, 0.1185505, 1.896303, 0.2313726, 0, 1, 1,
0.5099291, 1.259884, 0.7690332, 0.2352941, 0, 1, 1,
0.5123819, -0.07190973, 3.175042, 0.2431373, 0, 1, 1,
0.5154339, -1.640149, 2.646999, 0.2470588, 0, 1, 1,
0.5239101, 0.31512, 3.071244, 0.254902, 0, 1, 1,
0.5283067, -0.3135154, 1.609332, 0.2588235, 0, 1, 1,
0.5296175, -1.146541, 3.501616, 0.2666667, 0, 1, 1,
0.5370385, -0.7105393, 1.543455, 0.2705882, 0, 1, 1,
0.5382215, 0.3177963, -1.118992, 0.2784314, 0, 1, 1,
0.5407629, -0.2973977, 4.163525, 0.282353, 0, 1, 1,
0.5410219, 0.9784487, 0.3668084, 0.2901961, 0, 1, 1,
0.5455732, -0.8769085, 3.576746, 0.2941177, 0, 1, 1,
0.5460543, -0.4140812, 1.873119, 0.3019608, 0, 1, 1,
0.5468911, 0.0673613, -1.024391, 0.3098039, 0, 1, 1,
0.5486145, -1.716338, 3.585663, 0.3137255, 0, 1, 1,
0.5507538, 0.6049725, 2.90864, 0.3215686, 0, 1, 1,
0.5515403, 0.2817666, 0.3611056, 0.3254902, 0, 1, 1,
0.5626982, -0.1960768, 0.8741465, 0.3333333, 0, 1, 1,
0.5630265, -0.4192488, 3.272337, 0.3372549, 0, 1, 1,
0.5637099, 1.711792, 0.6441017, 0.345098, 0, 1, 1,
0.5653703, -0.3514653, 1.516979, 0.3490196, 0, 1, 1,
0.5666704, 0.2174455, 0.8821124, 0.3568628, 0, 1, 1,
0.5671209, -0.1808621, 1.7461, 0.3607843, 0, 1, 1,
0.569369, 1.214894, 0.2848877, 0.3686275, 0, 1, 1,
0.5701032, -0.3709652, 2.562986, 0.372549, 0, 1, 1,
0.5715438, -0.4390157, 1.544693, 0.3803922, 0, 1, 1,
0.5768219, 1.218455, -0.6811262, 0.3843137, 0, 1, 1,
0.5792614, 0.9161167, 1.139549, 0.3921569, 0, 1, 1,
0.5818175, -1.186664, 2.766515, 0.3960784, 0, 1, 1,
0.5836236, -1.598537, 2.588042, 0.4039216, 0, 1, 1,
0.5846184, 1.019598, -0.2666185, 0.4117647, 0, 1, 1,
0.5865688, -0.006969314, -0.2287007, 0.4156863, 0, 1, 1,
0.5880583, -0.8746527, 1.412951, 0.4235294, 0, 1, 1,
0.5925332, 0.7881045, 1.89725, 0.427451, 0, 1, 1,
0.5927008, 0.6280637, 0.8815463, 0.4352941, 0, 1, 1,
0.5934245, 1.768319, 1.141919, 0.4392157, 0, 1, 1,
0.5943584, 0.3659604, 1.513447, 0.4470588, 0, 1, 1,
0.5943881, 0.2854336, 3.007206, 0.4509804, 0, 1, 1,
0.5958415, 1.179109, 1.055419, 0.4588235, 0, 1, 1,
0.6020977, 0.07210582, 2.226294, 0.4627451, 0, 1, 1,
0.6022695, 0.3601604, 1.018458, 0.4705882, 0, 1, 1,
0.6084585, -0.09604929, 2.6718, 0.4745098, 0, 1, 1,
0.6092805, 0.8740569, -1.038679, 0.4823529, 0, 1, 1,
0.610162, -0.9625531, 2.299212, 0.4862745, 0, 1, 1,
0.6216456, -0.8389304, 1.672799, 0.4941176, 0, 1, 1,
0.6287587, -1.794668, 3.759711, 0.5019608, 0, 1, 1,
0.6327814, 1.210187, 0.8295893, 0.5058824, 0, 1, 1,
0.6343497, -0.2857326, 1.400048, 0.5137255, 0, 1, 1,
0.6351867, -0.1840689, 1.956437, 0.5176471, 0, 1, 1,
0.6362147, 1.172784, -0.4162813, 0.5254902, 0, 1, 1,
0.6401703, -0.2876662, 3.448434, 0.5294118, 0, 1, 1,
0.6409112, 0.06476142, 2.611883, 0.5372549, 0, 1, 1,
0.6430295, 0.942089, 1.547935, 0.5411765, 0, 1, 1,
0.6437845, -2.834736, 1.608464, 0.5490196, 0, 1, 1,
0.6475966, 0.1521483, 3.744454, 0.5529412, 0, 1, 1,
0.652686, -0.7628562, 3.898828, 0.5607843, 0, 1, 1,
0.6546729, 0.8837326, 1.382791, 0.5647059, 0, 1, 1,
0.6565389, 1.703286, 1.691793, 0.572549, 0, 1, 1,
0.6568929, -0.5051792, 2.629231, 0.5764706, 0, 1, 1,
0.6584037, -1.101929, 3.203054, 0.5843138, 0, 1, 1,
0.6601422, 0.3675836, 0.7738983, 0.5882353, 0, 1, 1,
0.6688902, 0.9232631, 2.173923, 0.5960785, 0, 1, 1,
0.6741577, 1.549224, -0.6500229, 0.6039216, 0, 1, 1,
0.6744659, 1.302076, -1.623256, 0.6078432, 0, 1, 1,
0.6746459, -0.5690753, 3.023779, 0.6156863, 0, 1, 1,
0.681689, 2.481296, 0.4990094, 0.6196079, 0, 1, 1,
0.6878616, 0.6423223, 0.743524, 0.627451, 0, 1, 1,
0.690577, 0.05639753, -0.2382895, 0.6313726, 0, 1, 1,
0.6924415, 1.085044, 0.856032, 0.6392157, 0, 1, 1,
0.7020178, 1.60302, -0.1607091, 0.6431373, 0, 1, 1,
0.7062721, 0.1920778, 1.684455, 0.6509804, 0, 1, 1,
0.7117914, -0.8518025, 2.445736, 0.654902, 0, 1, 1,
0.7165723, -0.2402292, 1.606154, 0.6627451, 0, 1, 1,
0.7180431, -2.156987, 4.62015, 0.6666667, 0, 1, 1,
0.7195818, 0.8772434, 0.5095305, 0.6745098, 0, 1, 1,
0.7202454, -1.92006, 3.260355, 0.6784314, 0, 1, 1,
0.7249749, 1.304819, 2.612813, 0.6862745, 0, 1, 1,
0.7312282, 0.1059057, -0.7430102, 0.6901961, 0, 1, 1,
0.7363163, -0.7027395, 5.018416, 0.6980392, 0, 1, 1,
0.7414072, 0.7668643, -0.01659719, 0.7058824, 0, 1, 1,
0.7421175, -0.995716, 2.355389, 0.7098039, 0, 1, 1,
0.7528039, -0.3823224, 0.6410677, 0.7176471, 0, 1, 1,
0.7551523, -0.2406806, 2.587472, 0.7215686, 0, 1, 1,
0.7553543, 0.1573728, 0.3910291, 0.7294118, 0, 1, 1,
0.7570201, 1.057008, 1.268072, 0.7333333, 0, 1, 1,
0.7628455, 0.3207783, 0.5836095, 0.7411765, 0, 1, 1,
0.7662023, -1.177333, 0.7825354, 0.7450981, 0, 1, 1,
0.7702752, 0.3966082, 2.571869, 0.7529412, 0, 1, 1,
0.7711354, -0.2757832, 0.2584893, 0.7568628, 0, 1, 1,
0.77693, -1.375118, 2.625654, 0.7647059, 0, 1, 1,
0.7796119, 0.5382503, 1.2535, 0.7686275, 0, 1, 1,
0.7822487, 0.0790501, 0.9955776, 0.7764706, 0, 1, 1,
0.7826032, -1.268375, 1.913392, 0.7803922, 0, 1, 1,
0.7833301, 1.40137, 0.9188131, 0.7882353, 0, 1, 1,
0.7888418, 0.2660939, 2.19093, 0.7921569, 0, 1, 1,
0.7994808, -0.9005298, 2.954979, 0.8, 0, 1, 1,
0.8048362, 1.223299, -0.1215214, 0.8078431, 0, 1, 1,
0.8062446, 0.07968792, 1.450059, 0.8117647, 0, 1, 1,
0.806596, -0.05949702, 0.5952842, 0.8196079, 0, 1, 1,
0.8103015, 0.02913821, -0.1144836, 0.8235294, 0, 1, 1,
0.8103651, -0.296633, 3.616548, 0.8313726, 0, 1, 1,
0.8119636, 1.47053, -0.4181944, 0.8352941, 0, 1, 1,
0.8125085, -0.3703089, 2.109461, 0.8431373, 0, 1, 1,
0.8135291, -0.3613826, 2.04032, 0.8470588, 0, 1, 1,
0.8159756, -0.6687589, 2.863931, 0.854902, 0, 1, 1,
0.8200941, 0.4846457, 2.10942, 0.8588235, 0, 1, 1,
0.8206999, -0.6394568, 2.607177, 0.8666667, 0, 1, 1,
0.8243769, -2.247618, 1.487172, 0.8705882, 0, 1, 1,
0.828113, 0.1881859, 2.463316, 0.8784314, 0, 1, 1,
0.8408759, -1.428841, 1.593436, 0.8823529, 0, 1, 1,
0.8450015, 0.6647478, -0.008978542, 0.8901961, 0, 1, 1,
0.8461438, -0.4308415, 3.082529, 0.8941177, 0, 1, 1,
0.850378, -2.032692, 1.035792, 0.9019608, 0, 1, 1,
0.852141, -0.767266, 3.775136, 0.9098039, 0, 1, 1,
0.8582034, 1.274944, 0.8029077, 0.9137255, 0, 1, 1,
0.8610747, 0.989067, -0.9942838, 0.9215686, 0, 1, 1,
0.8653483, 1.044569, 0.6752545, 0.9254902, 0, 1, 1,
0.8654557, 1.21056, -0.03678763, 0.9333333, 0, 1, 1,
0.8684216, -0.07618652, 1.183679, 0.9372549, 0, 1, 1,
0.8714725, 0.3879762, 0.732006, 0.945098, 0, 1, 1,
0.8841495, 0.2881972, -0.3836094, 0.9490196, 0, 1, 1,
0.8892527, 0.08308249, 1.247814, 0.9568627, 0, 1, 1,
0.8990126, 0.7787417, 1.444001, 0.9607843, 0, 1, 1,
0.8993583, 0.3747914, 1.81778, 0.9686275, 0, 1, 1,
0.905197, -1.276481, 2.69959, 0.972549, 0, 1, 1,
0.914135, 0.9954185, 0.5381172, 0.9803922, 0, 1, 1,
0.9153495, -0.6067696, 2.26261, 0.9843137, 0, 1, 1,
0.9159247, -1.010476, 1.455421, 0.9921569, 0, 1, 1,
0.9190717, 0.5110371, 2.961868, 0.9960784, 0, 1, 1,
0.9207236, -1.885196, 0.9463781, 1, 0, 0.9960784, 1,
0.9237856, -1.647192, 1.668914, 1, 0, 0.9882353, 1,
0.9244595, -0.6303232, 0.26551, 1, 0, 0.9843137, 1,
0.9248615, -1.609104, 3.110005, 1, 0, 0.9764706, 1,
0.9321268, 0.9390279, 0.4091687, 1, 0, 0.972549, 1,
0.9558172, -1.145785, 3.516322, 1, 0, 0.9647059, 1,
0.9579915, 0.1555523, 2.728033, 1, 0, 0.9607843, 1,
0.9607201, 1.493455, 0.8959182, 1, 0, 0.9529412, 1,
0.9610847, -0.881335, 1.55075, 1, 0, 0.9490196, 1,
0.9614792, 0.7435231, -0.1301097, 1, 0, 0.9411765, 1,
0.9623234, 0.3427862, 1.018545, 1, 0, 0.9372549, 1,
0.9624907, 0.6914392, 0.794355, 1, 0, 0.9294118, 1,
0.96939, 0.3890638, 1.124622, 1, 0, 0.9254902, 1,
0.9706213, 1.324922, -0.03801965, 1, 0, 0.9176471, 1,
0.9724965, 1.126633, 0.2146786, 1, 0, 0.9137255, 1,
0.9865903, -1.17564, 1.340461, 1, 0, 0.9058824, 1,
0.9902436, -2.480608, 3.521601, 1, 0, 0.9019608, 1,
0.9917019, 0.07830143, 0.9247316, 1, 0, 0.8941177, 1,
0.9982033, 0.2346954, 0.8545599, 1, 0, 0.8862745, 1,
1.001104, -0.5157171, 1.831244, 1, 0, 0.8823529, 1,
1.00246, -0.2402168, 1.936949, 1, 0, 0.8745098, 1,
1.008007, -0.151168, 3.044424, 1, 0, 0.8705882, 1,
1.012988, -0.8272449, 1.550543, 1, 0, 0.8627451, 1,
1.013669, 0.1408329, 3.772242, 1, 0, 0.8588235, 1,
1.016433, 1.384912, 1.262296, 1, 0, 0.8509804, 1,
1.016671, 1.600458, 1.860488, 1, 0, 0.8470588, 1,
1.032323, 0.05293948, 1.227857, 1, 0, 0.8392157, 1,
1.036896, -0.1669209, 1.009896, 1, 0, 0.8352941, 1,
1.043421, 0.1590433, 2.29829, 1, 0, 0.827451, 1,
1.047266, 1.521568, -1.076823, 1, 0, 0.8235294, 1,
1.047456, 2.009479, 0.3255279, 1, 0, 0.8156863, 1,
1.060389, 0.2620097, 0.7124771, 1, 0, 0.8117647, 1,
1.069068, -1.993687, 2.718628, 1, 0, 0.8039216, 1,
1.072506, 0.3115103, -0.3362474, 1, 0, 0.7960784, 1,
1.073013, 0.5697352, 1.673879, 1, 0, 0.7921569, 1,
1.076136, -1.594135, 2.593426, 1, 0, 0.7843137, 1,
1.078708, 0.2108274, 1.683884, 1, 0, 0.7803922, 1,
1.080465, -0.2736176, 1.988422, 1, 0, 0.772549, 1,
1.088044, 0.6994374, 1.028265, 1, 0, 0.7686275, 1,
1.090183, -1.537718, 0.6696515, 1, 0, 0.7607843, 1,
1.095682, 0.6689777, -0.9885328, 1, 0, 0.7568628, 1,
1.108983, -0.9506558, 3.039521, 1, 0, 0.7490196, 1,
1.114941, -2.052455, 3.760254, 1, 0, 0.7450981, 1,
1.123668, -2.039577, 1.953449, 1, 0, 0.7372549, 1,
1.132015, 0.09165771, 0.4492562, 1, 0, 0.7333333, 1,
1.133345, -0.4578468, 3.193125, 1, 0, 0.7254902, 1,
1.140536, -2.22599, 2.686136, 1, 0, 0.7215686, 1,
1.170039, 1.631982, 0.4851275, 1, 0, 0.7137255, 1,
1.172742, -0.8151647, 1.659866, 1, 0, 0.7098039, 1,
1.181611, -1.131935, 0.3150569, 1, 0, 0.7019608, 1,
1.188149, -1.160038, 1.735846, 1, 0, 0.6941177, 1,
1.191666, 1.839842, 0.9905608, 1, 0, 0.6901961, 1,
1.206569, -1.072949, 2.048865, 1, 0, 0.682353, 1,
1.209701, 0.2443113, 1.920778, 1, 0, 0.6784314, 1,
1.214992, 0.6966884, 0.1987316, 1, 0, 0.6705883, 1,
1.221445, -1.413834, 1.729094, 1, 0, 0.6666667, 1,
1.229472, -0.272922, 1.58782, 1, 0, 0.6588235, 1,
1.234249, -0.7587149, 2.361604, 1, 0, 0.654902, 1,
1.23964, 0.3405841, -0.0814114, 1, 0, 0.6470588, 1,
1.240313, 0.4777102, 2.083532, 1, 0, 0.6431373, 1,
1.247964, -0.3390564, 0.901881, 1, 0, 0.6352941, 1,
1.250809, 2.544704, 0.07528292, 1, 0, 0.6313726, 1,
1.251208, 0.1906767, 1.002192, 1, 0, 0.6235294, 1,
1.253136, 1.34645, 0.1392685, 1, 0, 0.6196079, 1,
1.257726, 1.186867, 1.066626, 1, 0, 0.6117647, 1,
1.259051, 1.216635, 1.101611, 1, 0, 0.6078432, 1,
1.265378, -0.2298079, 2.111245, 1, 0, 0.6, 1,
1.272619, 0.6917467, -0.3390337, 1, 0, 0.5921569, 1,
1.274534, -0.406114, 0.748359, 1, 0, 0.5882353, 1,
1.277614, -0.6609124, 1.769254, 1, 0, 0.5803922, 1,
1.285455, -2.554521, 1.287253, 1, 0, 0.5764706, 1,
1.288365, -0.2806924, 1.720079, 1, 0, 0.5686275, 1,
1.295431, 0.4172017, 0.8298703, 1, 0, 0.5647059, 1,
1.305912, -0.6505699, 0.3531442, 1, 0, 0.5568628, 1,
1.314227, -1.769991, 2.878742, 1, 0, 0.5529412, 1,
1.316256, 2.340515, -0.285778, 1, 0, 0.5450981, 1,
1.329354, 0.659192, 0.5254148, 1, 0, 0.5411765, 1,
1.329711, -0.7074888, 1.853831, 1, 0, 0.5333334, 1,
1.332844, 1.385206, 2.987761, 1, 0, 0.5294118, 1,
1.340008, 0.6992601, 2.664779, 1, 0, 0.5215687, 1,
1.347871, 0.1003902, 2.715531, 1, 0, 0.5176471, 1,
1.356619, 0.07923535, 1.046186, 1, 0, 0.509804, 1,
1.358328, -1.071128, 1.671757, 1, 0, 0.5058824, 1,
1.373873, -1.179156, 1.109697, 1, 0, 0.4980392, 1,
1.389326, -0.5255707, 1.471446, 1, 0, 0.4901961, 1,
1.394786, -0.3343355, 3.094756, 1, 0, 0.4862745, 1,
1.395856, 0.2628524, 2.118318, 1, 0, 0.4784314, 1,
1.407968, 0.383212, 2.287011, 1, 0, 0.4745098, 1,
1.40844, 0.300804, 2.160077, 1, 0, 0.4666667, 1,
1.410153, -0.3657596, 1.393097, 1, 0, 0.4627451, 1,
1.41305, -1.323222, 3.171265, 1, 0, 0.454902, 1,
1.420623, 2.007481, 0.8668509, 1, 0, 0.4509804, 1,
1.436241, -0.3022165, 1.363948, 1, 0, 0.4431373, 1,
1.437719, 0.5275589, 0.7685457, 1, 0, 0.4392157, 1,
1.439822, 1.197273, 0.529835, 1, 0, 0.4313726, 1,
1.445216, -0.4288533, 1.22424, 1, 0, 0.427451, 1,
1.449062, -0.6603829, 3.008673, 1, 0, 0.4196078, 1,
1.450164, 1.587128, 1.518371, 1, 0, 0.4156863, 1,
1.453447, 0.3278632, 0.09546632, 1, 0, 0.4078431, 1,
1.455905, -0.00636446, 3.110241, 1, 0, 0.4039216, 1,
1.467276, -0.5268704, 1.557709, 1, 0, 0.3960784, 1,
1.475721, -0.4084593, 3.110845, 1, 0, 0.3882353, 1,
1.479335, -2.465211, 2.14107, 1, 0, 0.3843137, 1,
1.484055, -0.7076356, 0.3528417, 1, 0, 0.3764706, 1,
1.485169, 1.050503, 1.290534, 1, 0, 0.372549, 1,
1.488747, -0.8034287, 2.908839, 1, 0, 0.3647059, 1,
1.489442, -0.08430297, 2.879812, 1, 0, 0.3607843, 1,
1.497232, -1.626264, 1.011732, 1, 0, 0.3529412, 1,
1.498651, -0.3496902, 1.493883, 1, 0, 0.3490196, 1,
1.506343, -0.5723374, 1.234919, 1, 0, 0.3411765, 1,
1.509147, 0.9769025, -0.03735642, 1, 0, 0.3372549, 1,
1.518257, 1.128357, 1.794442, 1, 0, 0.3294118, 1,
1.519725, 0.968594, -0.1261613, 1, 0, 0.3254902, 1,
1.523937, 0.3491586, 2.153957, 1, 0, 0.3176471, 1,
1.527719, -1.289349, 3.36383, 1, 0, 0.3137255, 1,
1.535087, -0.06568244, 2.385348, 1, 0, 0.3058824, 1,
1.536796, 0.543228, 1.993243, 1, 0, 0.2980392, 1,
1.549935, -0.426968, 1.127728, 1, 0, 0.2941177, 1,
1.55606, -0.4102562, 0.7094357, 1, 0, 0.2862745, 1,
1.565115, 1.119616, 1.289077, 1, 0, 0.282353, 1,
1.605277, 0.9769491, 1.530369, 1, 0, 0.2745098, 1,
1.614863, -1.247904, 2.285816, 1, 0, 0.2705882, 1,
1.629467, -0.1633553, 1.070137, 1, 0, 0.2627451, 1,
1.630004, 1.765792, -0.6335085, 1, 0, 0.2588235, 1,
1.634454, -0.2638412, 1.833585, 1, 0, 0.2509804, 1,
1.680492, -0.1068282, 1.046501, 1, 0, 0.2470588, 1,
1.695432, -1.213654, 2.191564, 1, 0, 0.2392157, 1,
1.705023, -1.078767, 2.907232, 1, 0, 0.2352941, 1,
1.721754, 0.7207035, 2.484643, 1, 0, 0.227451, 1,
1.760919, 0.9669899, 1.712669, 1, 0, 0.2235294, 1,
1.782902, -1.584095, 3.679802, 1, 0, 0.2156863, 1,
1.798941, -2.035459, 1.825517, 1, 0, 0.2117647, 1,
1.805464, -0.1327885, 3.22369, 1, 0, 0.2039216, 1,
1.808503, -1.505858, 1.568624, 1, 0, 0.1960784, 1,
1.8229, 0.6391467, 0.9561625, 1, 0, 0.1921569, 1,
1.829464, -0.5918952, 2.185137, 1, 0, 0.1843137, 1,
1.837961, -3.731839, 1.711386, 1, 0, 0.1803922, 1,
1.855379, -0.2272371, 1.48279, 1, 0, 0.172549, 1,
1.865094, -1.150317, 1.252797, 1, 0, 0.1686275, 1,
1.873798, -0.4354253, 3.006345, 1, 0, 0.1607843, 1,
1.876678, -0.8240483, 1.462587, 1, 0, 0.1568628, 1,
1.88509, -0.4270319, 2.975033, 1, 0, 0.1490196, 1,
1.890962, -1.142013, 3.92331, 1, 0, 0.145098, 1,
1.892233, 1.196143, 1.727093, 1, 0, 0.1372549, 1,
1.899197, -1.124996, 0.0009819658, 1, 0, 0.1333333, 1,
1.908465, -0.59544, 2.038012, 1, 0, 0.1254902, 1,
1.922845, 0.7047192, 0.5507965, 1, 0, 0.1215686, 1,
1.929938, -0.1041309, 3.940044, 1, 0, 0.1137255, 1,
1.95605, -0.8757286, 2.07504, 1, 0, 0.1098039, 1,
1.988, -1.723687, 3.25324, 1, 0, 0.1019608, 1,
1.996326, 2.573504, 3.010983, 1, 0, 0.09411765, 1,
2.015051, -1.464979, 0.6162438, 1, 0, 0.09019608, 1,
2.017382, -0.1896302, 1.428309, 1, 0, 0.08235294, 1,
2.061279, -1.920178, 1.9311, 1, 0, 0.07843138, 1,
2.068197, -0.12409, 3.400239, 1, 0, 0.07058824, 1,
2.087448, 0.2403215, 1.943572, 1, 0, 0.06666667, 1,
2.177403, -1.595367, 2.691926, 1, 0, 0.05882353, 1,
2.20696, 0.4099714, 1.158679, 1, 0, 0.05490196, 1,
2.257232, 0.4065411, 1.608181, 1, 0, 0.04705882, 1,
2.273803, 0.2626176, 1.393832, 1, 0, 0.04313726, 1,
2.496651, 0.3333107, 1.803979, 1, 0, 0.03529412, 1,
2.514944, -0.1768583, 1.968007, 1, 0, 0.03137255, 1,
2.599729, -2.77096, 1.041307, 1, 0, 0.02352941, 1,
2.947696, 1.029701, 0.5851087, 1, 0, 0.01960784, 1,
2.961455, -1.367071, 1.271424, 1, 0, 0.01176471, 1,
3.454302, -0.1299816, 1.434144, 1, 0, 0.007843138, 1
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
0.2378043, -4.898433, -6.405789, 0, -0.5, 0.5, 0.5,
0.2378043, -4.898433, -6.405789, 1, -0.5, 0.5, 0.5,
0.2378043, -4.898433, -6.405789, 1, 1.5, 0.5, 0.5,
0.2378043, -4.898433, -6.405789, 0, 1.5, 0.5, 0.5
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
-4.069086, -0.2905582, -6.405789, 0, -0.5, 0.5, 0.5,
-4.069086, -0.2905582, -6.405789, 1, -0.5, 0.5, 0.5,
-4.069086, -0.2905582, -6.405789, 1, 1.5, 0.5, 0.5,
-4.069086, -0.2905582, -6.405789, 0, 1.5, 0.5, 0.5
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
-4.069086, -4.898433, 0.2623892, 0, -0.5, 0.5, 0.5,
-4.069086, -4.898433, 0.2623892, 1, -0.5, 0.5, 0.5,
-4.069086, -4.898433, 0.2623892, 1, 1.5, 0.5, 0.5,
-4.069086, -4.898433, 0.2623892, 0, 1.5, 0.5, 0.5
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
-2, -3.835077, -4.866979,
3, -3.835077, -4.866979,
-2, -3.835077, -4.866979,
-2, -4.012303, -5.123447,
-1, -3.835077, -4.866979,
-1, -4.012303, -5.123447,
0, -3.835077, -4.866979,
0, -4.012303, -5.123447,
1, -3.835077, -4.866979,
1, -4.012303, -5.123447,
2, -3.835077, -4.866979,
2, -4.012303, -5.123447,
3, -3.835077, -4.866979,
3, -4.012303, -5.123447
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
-2, -4.366755, -5.636384, 0, -0.5, 0.5, 0.5,
-2, -4.366755, -5.636384, 1, -0.5, 0.5, 0.5,
-2, -4.366755, -5.636384, 1, 1.5, 0.5, 0.5,
-2, -4.366755, -5.636384, 0, 1.5, 0.5, 0.5,
-1, -4.366755, -5.636384, 0, -0.5, 0.5, 0.5,
-1, -4.366755, -5.636384, 1, -0.5, 0.5, 0.5,
-1, -4.366755, -5.636384, 1, 1.5, 0.5, 0.5,
-1, -4.366755, -5.636384, 0, 1.5, 0.5, 0.5,
0, -4.366755, -5.636384, 0, -0.5, 0.5, 0.5,
0, -4.366755, -5.636384, 1, -0.5, 0.5, 0.5,
0, -4.366755, -5.636384, 1, 1.5, 0.5, 0.5,
0, -4.366755, -5.636384, 0, 1.5, 0.5, 0.5,
1, -4.366755, -5.636384, 0, -0.5, 0.5, 0.5,
1, -4.366755, -5.636384, 1, -0.5, 0.5, 0.5,
1, -4.366755, -5.636384, 1, 1.5, 0.5, 0.5,
1, -4.366755, -5.636384, 0, 1.5, 0.5, 0.5,
2, -4.366755, -5.636384, 0, -0.5, 0.5, 0.5,
2, -4.366755, -5.636384, 1, -0.5, 0.5, 0.5,
2, -4.366755, -5.636384, 1, 1.5, 0.5, 0.5,
2, -4.366755, -5.636384, 0, 1.5, 0.5, 0.5,
3, -4.366755, -5.636384, 0, -0.5, 0.5, 0.5,
3, -4.366755, -5.636384, 1, -0.5, 0.5, 0.5,
3, -4.366755, -5.636384, 1, 1.5, 0.5, 0.5,
3, -4.366755, -5.636384, 0, 1.5, 0.5, 0.5
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
-3.075188, -3, -4.866979,
-3.075188, 3, -4.866979,
-3.075188, -3, -4.866979,
-3.240838, -3, -5.123447,
-3.075188, -2, -4.866979,
-3.240838, -2, -5.123447,
-3.075188, -1, -4.866979,
-3.240838, -1, -5.123447,
-3.075188, 0, -4.866979,
-3.240838, 0, -5.123447,
-3.075188, 1, -4.866979,
-3.240838, 1, -5.123447,
-3.075188, 2, -4.866979,
-3.240838, 2, -5.123447,
-3.075188, 3, -4.866979,
-3.240838, 3, -5.123447
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
-3.572137, -3, -5.636384, 0, -0.5, 0.5, 0.5,
-3.572137, -3, -5.636384, 1, -0.5, 0.5, 0.5,
-3.572137, -3, -5.636384, 1, 1.5, 0.5, 0.5,
-3.572137, -3, -5.636384, 0, 1.5, 0.5, 0.5,
-3.572137, -2, -5.636384, 0, -0.5, 0.5, 0.5,
-3.572137, -2, -5.636384, 1, -0.5, 0.5, 0.5,
-3.572137, -2, -5.636384, 1, 1.5, 0.5, 0.5,
-3.572137, -2, -5.636384, 0, 1.5, 0.5, 0.5,
-3.572137, -1, -5.636384, 0, -0.5, 0.5, 0.5,
-3.572137, -1, -5.636384, 1, -0.5, 0.5, 0.5,
-3.572137, -1, -5.636384, 1, 1.5, 0.5, 0.5,
-3.572137, -1, -5.636384, 0, 1.5, 0.5, 0.5,
-3.572137, 0, -5.636384, 0, -0.5, 0.5, 0.5,
-3.572137, 0, -5.636384, 1, -0.5, 0.5, 0.5,
-3.572137, 0, -5.636384, 1, 1.5, 0.5, 0.5,
-3.572137, 0, -5.636384, 0, 1.5, 0.5, 0.5,
-3.572137, 1, -5.636384, 0, -0.5, 0.5, 0.5,
-3.572137, 1, -5.636384, 1, -0.5, 0.5, 0.5,
-3.572137, 1, -5.636384, 1, 1.5, 0.5, 0.5,
-3.572137, 1, -5.636384, 0, 1.5, 0.5, 0.5,
-3.572137, 2, -5.636384, 0, -0.5, 0.5, 0.5,
-3.572137, 2, -5.636384, 1, -0.5, 0.5, 0.5,
-3.572137, 2, -5.636384, 1, 1.5, 0.5, 0.5,
-3.572137, 2, -5.636384, 0, 1.5, 0.5, 0.5,
-3.572137, 3, -5.636384, 0, -0.5, 0.5, 0.5,
-3.572137, 3, -5.636384, 1, -0.5, 0.5, 0.5,
-3.572137, 3, -5.636384, 1, 1.5, 0.5, 0.5,
-3.572137, 3, -5.636384, 0, 1.5, 0.5, 0.5
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
-3.075188, -3.835077, -4,
-3.075188, -3.835077, 4,
-3.075188, -3.835077, -4,
-3.240838, -4.012303, -4,
-3.075188, -3.835077, -2,
-3.240838, -4.012303, -2,
-3.075188, -3.835077, 0,
-3.240838, -4.012303, 0,
-3.075188, -3.835077, 2,
-3.240838, -4.012303, 2,
-3.075188, -3.835077, 4,
-3.240838, -4.012303, 4
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
-3.572137, -4.366755, -4, 0, -0.5, 0.5, 0.5,
-3.572137, -4.366755, -4, 1, -0.5, 0.5, 0.5,
-3.572137, -4.366755, -4, 1, 1.5, 0.5, 0.5,
-3.572137, -4.366755, -4, 0, 1.5, 0.5, 0.5,
-3.572137, -4.366755, -2, 0, -0.5, 0.5, 0.5,
-3.572137, -4.366755, -2, 1, -0.5, 0.5, 0.5,
-3.572137, -4.366755, -2, 1, 1.5, 0.5, 0.5,
-3.572137, -4.366755, -2, 0, 1.5, 0.5, 0.5,
-3.572137, -4.366755, 0, 0, -0.5, 0.5, 0.5,
-3.572137, -4.366755, 0, 1, -0.5, 0.5, 0.5,
-3.572137, -4.366755, 0, 1, 1.5, 0.5, 0.5,
-3.572137, -4.366755, 0, 0, 1.5, 0.5, 0.5,
-3.572137, -4.366755, 2, 0, -0.5, 0.5, 0.5,
-3.572137, -4.366755, 2, 1, -0.5, 0.5, 0.5,
-3.572137, -4.366755, 2, 1, 1.5, 0.5, 0.5,
-3.572137, -4.366755, 2, 0, 1.5, 0.5, 0.5,
-3.572137, -4.366755, 4, 0, -0.5, 0.5, 0.5,
-3.572137, -4.366755, 4, 1, -0.5, 0.5, 0.5,
-3.572137, -4.366755, 4, 1, 1.5, 0.5, 0.5,
-3.572137, -4.366755, 4, 0, 1.5, 0.5, 0.5
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
-3.075188, -3.835077, -4.866979,
-3.075188, 3.253961, -4.866979,
-3.075188, -3.835077, 5.391757,
-3.075188, 3.253961, 5.391757,
-3.075188, -3.835077, -4.866979,
-3.075188, -3.835077, 5.391757,
-3.075188, 3.253961, -4.866979,
-3.075188, 3.253961, 5.391757,
-3.075188, -3.835077, -4.866979,
3.550797, -3.835077, -4.866979,
-3.075188, -3.835077, 5.391757,
3.550797, -3.835077, 5.391757,
-3.075188, 3.253961, -4.866979,
3.550797, 3.253961, -4.866979,
-3.075188, 3.253961, 5.391757,
3.550797, 3.253961, 5.391757,
3.550797, -3.835077, -4.866979,
3.550797, 3.253961, -4.866979,
3.550797, -3.835077, 5.391757,
3.550797, 3.253961, 5.391757,
3.550797, -3.835077, -4.866979,
3.550797, -3.835077, 5.391757,
3.550797, 3.253961, -4.866979,
3.550797, 3.253961, 5.391757
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
var radius = 7.540286;
var distance = 33.54758;
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
mvMatrix.translate( -0.2378043, 0.2905582, -0.2623892 );
mvMatrix.scale( 1.230414, 1.150044, 0.7947085 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.54758);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Ethanol<-read.table("Ethanol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-2.978693, 0.5621631, -2.147179, 0, 0, 1, 1, 1,
-2.751834, -0.06851284, -0.7160365, 1, 0, 0, 1, 1,
-2.751711, -1.213325, -1.878969, 1, 0, 0, 1, 1,
-2.711892, 0.7800446, -2.410905, 1, 0, 0, 1, 1,
-2.675154, 2.098698, -0.6744365, 1, 0, 0, 1, 1,
-2.605644, -0.6563581, -2.066015, 1, 0, 0, 1, 1,
-2.510773, -0.5184712, -1.203232, 0, 0, 0, 1, 1,
-2.495189, -1.749188, -2.737509, 0, 0, 0, 1, 1,
-2.495146, -1.134146, -1.856838, 0, 0, 0, 1, 1,
-2.466038, 0.459011, 0.1326578, 0, 0, 0, 1, 1,
-2.261822, -0.3475486, -2.434079, 0, 0, 0, 1, 1,
-2.242069, 0.2846951, -2.296909, 0, 0, 0, 1, 1,
-2.212103, -0.6864522, -1.745276, 0, 0, 0, 1, 1,
-2.166878, 1.685401, -0.6498866, 1, 1, 1, 1, 1,
-2.166009, 1.05881, -0.3352953, 1, 1, 1, 1, 1,
-2.142309, 1.061572, -1.130067, 1, 1, 1, 1, 1,
-2.116311, -2.053499, -1.32642, 1, 1, 1, 1, 1,
-2.090535, 0.5254026, -1.428576, 1, 1, 1, 1, 1,
-2.060849, 0.2166783, 0.5261944, 1, 1, 1, 1, 1,
-2.058541, -0.6338699, -1.478547, 1, 1, 1, 1, 1,
-2.023701, 1.141567, -3.861883, 1, 1, 1, 1, 1,
-2.015942, -1.251701, -3.283308, 1, 1, 1, 1, 1,
-2.001438, 1.749261, 0.2312222, 1, 1, 1, 1, 1,
-1.987224, 1.164315, -1.156134, 1, 1, 1, 1, 1,
-1.976042, 1.125018, -0.7162184, 1, 1, 1, 1, 1,
-1.928228, -0.4212941, -2.745036, 1, 1, 1, 1, 1,
-1.901239, 0.4601704, -2.088972, 1, 1, 1, 1, 1,
-1.892466, -1.612937, -2.715142, 1, 1, 1, 1, 1,
-1.884052, 0.4494945, -1.085731, 0, 0, 1, 1, 1,
-1.877531, 1.993368, -0.2890933, 1, 0, 0, 1, 1,
-1.874108, -1.345651, -1.722073, 1, 0, 0, 1, 1,
-1.828854, 0.3736167, -1.421331, 1, 0, 0, 1, 1,
-1.806234, -0.9783849, -1.880561, 1, 0, 0, 1, 1,
-1.802096, 0.5294591, -0.6559033, 1, 0, 0, 1, 1,
-1.791401, -0.4094739, -1.843248, 0, 0, 0, 1, 1,
-1.790731, 0.5211286, -2.201923, 0, 0, 0, 1, 1,
-1.786349, -1.071612, -2.442598, 0, 0, 0, 1, 1,
-1.783758, 0.04709985, -1.441058, 0, 0, 0, 1, 1,
-1.772003, -0.02837959, -1.203366, 0, 0, 0, 1, 1,
-1.751898, 0.1773207, -1.564376, 0, 0, 0, 1, 1,
-1.74676, -0.9467114, -1.449502, 0, 0, 0, 1, 1,
-1.740653, -0.5005156, -1.358116, 1, 1, 1, 1, 1,
-1.737219, -0.175534, -2.842955, 1, 1, 1, 1, 1,
-1.734921, -1.270567, -3.68692, 1, 1, 1, 1, 1,
-1.718484, 1.291344, -2.997828, 1, 1, 1, 1, 1,
-1.693429, 0.2613032, 0.5998953, 1, 1, 1, 1, 1,
-1.670728, -0.6126242, -1.743155, 1, 1, 1, 1, 1,
-1.627761, -1.224173, -1.931036, 1, 1, 1, 1, 1,
-1.625999, -0.8292012, -0.5600293, 1, 1, 1, 1, 1,
-1.618791, 1.355209, -0.7395421, 1, 1, 1, 1, 1,
-1.613305, -1.185228, -2.411141, 1, 1, 1, 1, 1,
-1.595583, -0.7256163, -2.166494, 1, 1, 1, 1, 1,
-1.59554, -0.5387099, 0.1770084, 1, 1, 1, 1, 1,
-1.593734, -1.087336, -2.054145, 1, 1, 1, 1, 1,
-1.586048, 0.6134446, -1.103338, 1, 1, 1, 1, 1,
-1.581976, 0.321279, 0.3378573, 1, 1, 1, 1, 1,
-1.569468, 1.466082, -1.058999, 0, 0, 1, 1, 1,
-1.567515, -0.2807882, -0.1924227, 1, 0, 0, 1, 1,
-1.567394, -1.158618, -2.910255, 1, 0, 0, 1, 1,
-1.565791, 1.346515, -2.6897, 1, 0, 0, 1, 1,
-1.552951, -0.002042866, -1.923521, 1, 0, 0, 1, 1,
-1.550766, -0.5087454, -3.197888, 1, 0, 0, 1, 1,
-1.548689, 0.01774257, -3.460403, 0, 0, 0, 1, 1,
-1.534229, -1.037565, -0.5070485, 0, 0, 0, 1, 1,
-1.529124, -0.125376, -0.5529337, 0, 0, 0, 1, 1,
-1.528782, -2.371234, -2.507584, 0, 0, 0, 1, 1,
-1.517701, 0.6225489, -2.17625, 0, 0, 0, 1, 1,
-1.502795, 0.8152187, 0.1794732, 0, 0, 0, 1, 1,
-1.501497, -0.2099258, -3.592038, 0, 0, 0, 1, 1,
-1.48639, -1.002552, -1.372973, 1, 1, 1, 1, 1,
-1.485101, 1.302343, -1.249257, 1, 1, 1, 1, 1,
-1.478591, 0.4631003, -0.9597016, 1, 1, 1, 1, 1,
-1.473287, -0.9587923, -3.594758, 1, 1, 1, 1, 1,
-1.445323, 0.07023717, -1.547242, 1, 1, 1, 1, 1,
-1.438875, -0.8109458, -3.214908, 1, 1, 1, 1, 1,
-1.415936, 0.45361, -0.8329355, 1, 1, 1, 1, 1,
-1.410754, 0.2919861, -1.250903, 1, 1, 1, 1, 1,
-1.3993, -0.3247263, -1.90208, 1, 1, 1, 1, 1,
-1.393744, 0.04807249, -0.3751614, 1, 1, 1, 1, 1,
-1.389751, 3.150723, -0.3893574, 1, 1, 1, 1, 1,
-1.389585, -1.28149, -2.544409, 1, 1, 1, 1, 1,
-1.364615, -0.9230136, -2.611771, 1, 1, 1, 1, 1,
-1.361735, -0.2130339, -3.154212, 1, 1, 1, 1, 1,
-1.358083, -1.445559, -1.411605, 1, 1, 1, 1, 1,
-1.351995, 1.478543, -0.2677395, 0, 0, 1, 1, 1,
-1.348042, 0.04918968, -1.595045, 1, 0, 0, 1, 1,
-1.338578, -1.271849, -1.562636, 1, 0, 0, 1, 1,
-1.321232, -0.7733087, -2.82984, 1, 0, 0, 1, 1,
-1.311164, 2.040726, -0.2726399, 1, 0, 0, 1, 1,
-1.304302, -0.1777202, -3.019763, 1, 0, 0, 1, 1,
-1.300626, 0.4157808, 2.189059, 0, 0, 0, 1, 1,
-1.300423, 0.07919179, 0.1240597, 0, 0, 0, 1, 1,
-1.299655, -1.202483, -2.114208, 0, 0, 0, 1, 1,
-1.298717, 0.2462888, -2.451586, 0, 0, 0, 1, 1,
-1.298596, -0.5630665, -2.456845, 0, 0, 0, 1, 1,
-1.29257, -0.256819, -1.529967, 0, 0, 0, 1, 1,
-1.286108, -0.4284922, -3.791656, 0, 0, 0, 1, 1,
-1.262115, 0.5251302, 0.02848944, 1, 1, 1, 1, 1,
-1.261668, 0.3825555, -3.243289, 1, 1, 1, 1, 1,
-1.260969, 0.9928433, -0.9655081, 1, 1, 1, 1, 1,
-1.251055, 0.1303314, -1.36219, 1, 1, 1, 1, 1,
-1.249702, 0.3325777, -0.5666525, 1, 1, 1, 1, 1,
-1.236052, 0.3709174, -2.446301, 1, 1, 1, 1, 1,
-1.225732, -0.04951831, -3.34199, 1, 1, 1, 1, 1,
-1.221805, 0.4352555, 0.02082911, 1, 1, 1, 1, 1,
-1.218704, 1.259185, -2.071393, 1, 1, 1, 1, 1,
-1.214773, -0.6397752, -1.622959, 1, 1, 1, 1, 1,
-1.210114, -0.1790466, -0.5427734, 1, 1, 1, 1, 1,
-1.208542, -0.02544591, -2.440908, 1, 1, 1, 1, 1,
-1.207446, 0.2345162, -1.369875, 1, 1, 1, 1, 1,
-1.202082, 1.086183, 0.1145004, 1, 1, 1, 1, 1,
-1.197761, 0.06222562, -0.2996592, 1, 1, 1, 1, 1,
-1.196465, -1.334535, -2.253862, 0, 0, 1, 1, 1,
-1.196418, -0.9978126, -0.4798491, 1, 0, 0, 1, 1,
-1.196155, -0.7839786, -3.265702, 1, 0, 0, 1, 1,
-1.19138, 0.8726911, -2.041115, 1, 0, 0, 1, 1,
-1.190944, 0.7269637, -1.491976, 1, 0, 0, 1, 1,
-1.188477, -0.3443413, -2.716493, 1, 0, 0, 1, 1,
-1.187125, 0.6036018, -0.3762144, 0, 0, 0, 1, 1,
-1.184864, -1.058458, -4.010277, 0, 0, 0, 1, 1,
-1.184036, -0.933529, -0.8563027, 0, 0, 0, 1, 1,
-1.180693, 0.2618145, -0.9481974, 0, 0, 0, 1, 1,
-1.180092, 0.3362297, -0.2785215, 0, 0, 0, 1, 1,
-1.172567, 0.9062374, -1.522877, 0, 0, 0, 1, 1,
-1.171761, 0.7015924, -2.489372, 0, 0, 0, 1, 1,
-1.171547, 0.0388954, -2.189145, 1, 1, 1, 1, 1,
-1.165146, 0.2350248, -1.182376, 1, 1, 1, 1, 1,
-1.145662, -1.848506, -2.871953, 1, 1, 1, 1, 1,
-1.12732, -0.1186882, -2.678431, 1, 1, 1, 1, 1,
-1.126295, -0.147467, -1.478485, 1, 1, 1, 1, 1,
-1.125081, 0.9976383, -2.855346, 1, 1, 1, 1, 1,
-1.116451, 2.159987, 0.4943487, 1, 1, 1, 1, 1,
-1.11596, -1.230091, -2.96132, 1, 1, 1, 1, 1,
-1.115583, -0.2966571, -1.488159, 1, 1, 1, 1, 1,
-1.114342, 0.2732091, -0.797269, 1, 1, 1, 1, 1,
-1.114097, 0.312, -1.083419, 1, 1, 1, 1, 1,
-1.110162, 0.4690265, -0.0471059, 1, 1, 1, 1, 1,
-1.10368, 1.21485, -1.911981, 1, 1, 1, 1, 1,
-1.10175, 0.6556867, -1.383833, 1, 1, 1, 1, 1,
-1.10044, 0.261161, -0.8122016, 1, 1, 1, 1, 1,
-1.097252, 0.4921842, -1.683379, 0, 0, 1, 1, 1,
-1.093175, 0.03483472, -3.307032, 1, 0, 0, 1, 1,
-1.090464, 0.6674508, 1.794312, 1, 0, 0, 1, 1,
-1.087962, 2.150362, -1.089524, 1, 0, 0, 1, 1,
-1.084211, -0.01637603, -2.159935, 1, 0, 0, 1, 1,
-1.082241, -0.1875459, -2.294712, 1, 0, 0, 1, 1,
-1.074203, -0.5145203, 0.1465339, 0, 0, 0, 1, 1,
-1.06684, 0.40328, -0.4685379, 0, 0, 0, 1, 1,
-1.066263, 1.483051, 1.874885, 0, 0, 0, 1, 1,
-1.058405, 0.4981058, -1.088615, 0, 0, 0, 1, 1,
-1.058323, 0.7922276, -0.9975343, 0, 0, 0, 1, 1,
-1.055976, -0.09428188, -1.44969, 0, 0, 0, 1, 1,
-1.051952, 0.5615312, 0.5524148, 0, 0, 0, 1, 1,
-1.051824, 0.8807358, -0.1941602, 1, 1, 1, 1, 1,
-1.049662, -0.1385705, -0.03347104, 1, 1, 1, 1, 1,
-1.037109, -0.1914217, -1.739284, 1, 1, 1, 1, 1,
-1.031992, -0.9604781, -0.2061571, 1, 1, 1, 1, 1,
-1.029031, 0.3747888, -1.720481, 1, 1, 1, 1, 1,
-1.025337, -0.2180372, -4.522665, 1, 1, 1, 1, 1,
-1.023898, -0.9252139, -2.816578, 1, 1, 1, 1, 1,
-1.022488, 0.8142871, 1.545802, 1, 1, 1, 1, 1,
-1.022296, 0.1459716, -1.554078, 1, 1, 1, 1, 1,
-1.014357, 0.5291311, -0.8043042, 1, 1, 1, 1, 1,
-1.013216, -0.8580368, -1.776672, 1, 1, 1, 1, 1,
-1.012506, 1.169223, -1.437484, 1, 1, 1, 1, 1,
-1.011813, 0.2711842, -0.02000398, 1, 1, 1, 1, 1,
-1.011086, 0.1620065, -2.588395, 1, 1, 1, 1, 1,
-1.008535, -1.795922, -2.18195, 1, 1, 1, 1, 1,
-1.004579, 0.6974142, -2.98897, 0, 0, 1, 1, 1,
-0.9986722, 0.0492386, -0.2489877, 1, 0, 0, 1, 1,
-0.9953155, -0.247349, -0.9907756, 1, 0, 0, 1, 1,
-0.9872935, -0.1437175, -0.6120502, 1, 0, 0, 1, 1,
-0.9832128, -1.301018, -1.883827, 1, 0, 0, 1, 1,
-0.9769692, 0.1691462, 0.9409929, 1, 0, 0, 1, 1,
-0.9757033, 0.09425305, -1.781697, 0, 0, 0, 1, 1,
-0.9751533, -0.8288189, -3.291034, 0, 0, 0, 1, 1,
-0.9651697, 0.03961359, -1.582086, 0, 0, 0, 1, 1,
-0.9477758, 0.5758245, -1.525381, 0, 0, 0, 1, 1,
-0.9247971, -0.4432961, -2.893505, 0, 0, 0, 1, 1,
-0.9241292, -0.5296639, -1.10727, 0, 0, 0, 1, 1,
-0.9240648, 1.123305, -1.702517, 0, 0, 0, 1, 1,
-0.9228088, 1.220503, -0.6502004, 1, 1, 1, 1, 1,
-0.9202306, 0.4800133, -2.34304, 1, 1, 1, 1, 1,
-0.9170321, -1.172692, -2.512984, 1, 1, 1, 1, 1,
-0.9156846, -0.6519099, -1.948211, 1, 1, 1, 1, 1,
-0.9063272, -0.8585392, -1.403144, 1, 1, 1, 1, 1,
-0.9051244, -0.6587647, -0.1248944, 1, 1, 1, 1, 1,
-0.8986384, -0.5948462, -1.225014, 1, 1, 1, 1, 1,
-0.8963068, -0.7868128, -1.20072, 1, 1, 1, 1, 1,
-0.8889213, -0.5716675, -1.980558, 1, 1, 1, 1, 1,
-0.887657, 0.8792673, -0.5123095, 1, 1, 1, 1, 1,
-0.8815818, -0.1923402, -2.290371, 1, 1, 1, 1, 1,
-0.8802549, -0.5811772, -1.831195, 1, 1, 1, 1, 1,
-0.8771048, 1.792243, 1.161844, 1, 1, 1, 1, 1,
-0.8678143, -0.3675545, -1.703699, 1, 1, 1, 1, 1,
-0.8628461, 0.6867856, -0.4831402, 1, 1, 1, 1, 1,
-0.8498874, -0.4357139, -2.084289, 0, 0, 1, 1, 1,
-0.8485628, -0.2459671, -1.109722, 1, 0, 0, 1, 1,
-0.8474938, 0.2646743, -1.358143, 1, 0, 0, 1, 1,
-0.8398975, 0.2813555, -0.5131163, 1, 0, 0, 1, 1,
-0.8377237, -0.8979765, -1.347161, 1, 0, 0, 1, 1,
-0.8367411, -1.789723, -3.065094, 1, 0, 0, 1, 1,
-0.8280357, 0.6889619, -0.9270948, 0, 0, 0, 1, 1,
-0.8274888, -1.518023, -3.033127, 0, 0, 0, 1, 1,
-0.8188877, -1.435748, -3.097034, 0, 0, 0, 1, 1,
-0.8170881, 0.4468144, -1.628997, 0, 0, 0, 1, 1,
-0.8169904, 0.1447294, -0.4806512, 0, 0, 0, 1, 1,
-0.8169351, 0.6367815, -2.634316, 0, 0, 0, 1, 1,
-0.8150741, -0.02381206, -1.000204, 0, 0, 0, 1, 1,
-0.8101498, -1.758261, -2.903753, 1, 1, 1, 1, 1,
-0.8056422, -0.6673031, -1.519998, 1, 1, 1, 1, 1,
-0.8030345, 1.683958, 1.019367, 1, 1, 1, 1, 1,
-0.8021229, 1.698298, -0.3805631, 1, 1, 1, 1, 1,
-0.8007582, 0.8429614, 0.6159234, 1, 1, 1, 1, 1,
-0.7957765, -0.4610206, -2.491684, 1, 1, 1, 1, 1,
-0.789172, 1.037802, 1.549756, 1, 1, 1, 1, 1,
-0.7855601, -0.5321946, -2.862956, 1, 1, 1, 1, 1,
-0.7829062, -0.4693542, -0.616421, 1, 1, 1, 1, 1,
-0.7818165, -0.6635332, -1.929008, 1, 1, 1, 1, 1,
-0.7792508, -0.9934015, -3.747836, 1, 1, 1, 1, 1,
-0.771868, 0.1811761, -1.381301, 1, 1, 1, 1, 1,
-0.7668925, 0.7156481, -0.8630679, 1, 1, 1, 1, 1,
-0.7661807, 0.1001555, -0.812328, 1, 1, 1, 1, 1,
-0.7650841, 1.592985, -1.099084, 1, 1, 1, 1, 1,
-0.764463, -1.745391, -2.980009, 0, 0, 1, 1, 1,
-0.7608678, -0.6588307, -2.786789, 1, 0, 0, 1, 1,
-0.7570471, -0.552084, -0.22692, 1, 0, 0, 1, 1,
-0.7542702, 0.352217, -1.268814, 1, 0, 0, 1, 1,
-0.7482243, -0.4557619, -2.081175, 1, 0, 0, 1, 1,
-0.7476238, -1.757837, -3.54322, 1, 0, 0, 1, 1,
-0.7462069, 0.2193255, -1.315187, 0, 0, 0, 1, 1,
-0.741357, 1.019077, -0.5335963, 0, 0, 0, 1, 1,
-0.7334108, 0.4328111, -0.6377065, 0, 0, 0, 1, 1,
-0.7330117, -1.989183, -3.441998, 0, 0, 0, 1, 1,
-0.7288643, 1.185503, 0.3670972, 0, 0, 0, 1, 1,
-0.7212123, -0.6489868, -2.399297, 0, 0, 0, 1, 1,
-0.7184332, -2.19755, -3.18378, 0, 0, 0, 1, 1,
-0.7121174, -1.248795, -1.699725, 1, 1, 1, 1, 1,
-0.7085561, -0.5634294, -4.717579, 1, 1, 1, 1, 1,
-0.7057743, -0.9321576, -2.309442, 1, 1, 1, 1, 1,
-0.7054602, -1.251482, -3.910221, 1, 1, 1, 1, 1,
-0.7021287, 0.9088756, 2.306729, 1, 1, 1, 1, 1,
-0.7015552, -0.9888153, -2.09104, 1, 1, 1, 1, 1,
-0.7002396, 2.512049, -0.5645475, 1, 1, 1, 1, 1,
-0.6953506, -0.8879857, -2.676939, 1, 1, 1, 1, 1,
-0.6926233, -0.4314086, -2.497471, 1, 1, 1, 1, 1,
-0.6917055, -0.7090642, -2.287674, 1, 1, 1, 1, 1,
-0.6898791, 0.4620899, -1.915061, 1, 1, 1, 1, 1,
-0.6866909, 0.6923211, -2.282271, 1, 1, 1, 1, 1,
-0.6806093, 1.394249, 0.8439513, 1, 1, 1, 1, 1,
-0.6805601, -0.2961726, -3.340197, 1, 1, 1, 1, 1,
-0.670938, 0.4334162, -0.3160808, 1, 1, 1, 1, 1,
-0.6585009, 1.02654, -1.476179, 0, 0, 1, 1, 1,
-0.6571398, 1.460262, -3.426013, 1, 0, 0, 1, 1,
-0.6568793, 1.218608, -2.214086, 1, 0, 0, 1, 1,
-0.6530479, 0.2438775, -0.1204097, 1, 0, 0, 1, 1,
-0.6523424, 1.095909, -0.3172365, 1, 0, 0, 1, 1,
-0.6469304, -0.5300288, -1.892163, 1, 0, 0, 1, 1,
-0.6467748, -1.249592, -2.712039, 0, 0, 0, 1, 1,
-0.6464399, -0.767385, -3.637335, 0, 0, 0, 1, 1,
-0.6442183, -0.1942137, -3.407852, 0, 0, 0, 1, 1,
-0.6392105, 0.271935, -0.4340582, 0, 0, 0, 1, 1,
-0.6385679, -0.07035232, -1.870317, 0, 0, 0, 1, 1,
-0.6364772, -1.685213, -2.541552, 0, 0, 0, 1, 1,
-0.6315085, -0.2961335, -0.6188688, 0, 0, 0, 1, 1,
-0.6275485, -1.600201, -3.353045, 1, 1, 1, 1, 1,
-0.6177065, 0.5008799, 0.05399973, 1, 1, 1, 1, 1,
-0.6158632, -0.3079721, -3.008251, 1, 1, 1, 1, 1,
-0.6079169, 0.7898795, -0.734035, 1, 1, 1, 1, 1,
-0.6067505, -2.021563, -4.521286, 1, 1, 1, 1, 1,
-0.6014158, -0.7949339, -1.401059, 1, 1, 1, 1, 1,
-0.5965822, 0.8889466, 1.160431, 1, 1, 1, 1, 1,
-0.5922943, 1.865243, 0.4914224, 1, 1, 1, 1, 1,
-0.5859024, 0.9452784, 0.3409672, 1, 1, 1, 1, 1,
-0.5857605, -0.5959809, -3.123826, 1, 1, 1, 1, 1,
-0.5852669, 0.1535323, -1.40041, 1, 1, 1, 1, 1,
-0.5829039, 1.16195, 0.5441288, 1, 1, 1, 1, 1,
-0.5762578, 1.521698, -1.567988, 1, 1, 1, 1, 1,
-0.573023, -0.8638793, -2.445676, 1, 1, 1, 1, 1,
-0.570045, 0.5729743, -1.909888, 1, 1, 1, 1, 1,
-0.5672489, 0.1677108, -2.546738, 0, 0, 1, 1, 1,
-0.5661183, -1.826113, -2.698039, 1, 0, 0, 1, 1,
-0.5645265, 0.002167198, -0.9753531, 1, 0, 0, 1, 1,
-0.5643765, 0.3768702, -1.176726, 1, 0, 0, 1, 1,
-0.5618668, 0.6414976, 0.5270016, 1, 0, 0, 1, 1,
-0.5612364, 1.350401, -0.7346835, 1, 0, 0, 1, 1,
-0.5573142, -0.1858606, -3.227646, 0, 0, 0, 1, 1,
-0.5571978, -0.2349982, -2.264397, 0, 0, 0, 1, 1,
-0.5567541, 1.057704, -1.430242, 0, 0, 0, 1, 1,
-0.555388, -0.9344169, -3.352509, 0, 0, 0, 1, 1,
-0.5547732, 0.5356327, -2.025339, 0, 0, 0, 1, 1,
-0.5504003, -0.6047972, -2.162712, 0, 0, 0, 1, 1,
-0.5485969, 0.9898255, -0.07438605, 0, 0, 0, 1, 1,
-0.5485688, 2.139676, 0.9278783, 1, 1, 1, 1, 1,
-0.5475673, -0.4237813, -0.9321151, 1, 1, 1, 1, 1,
-0.5394998, -1.480222, -4.416894, 1, 1, 1, 1, 1,
-0.5380885, -0.1426081, -2.75601, 1, 1, 1, 1, 1,
-0.5379387, -0.7890837, -4.563496, 1, 1, 1, 1, 1,
-0.5367579, 0.4165431, -1.843921, 1, 1, 1, 1, 1,
-0.5351232, 0.9990523, -2.833846, 1, 1, 1, 1, 1,
-0.5340616, 0.3729151, 0.5931227, 1, 1, 1, 1, 1,
-0.5290987, 0.1468865, -0.3107346, 1, 1, 1, 1, 1,
-0.5261148, -0.05261633, -0.2787841, 1, 1, 1, 1, 1,
-0.5257167, -0.5062477, -1.709131, 1, 1, 1, 1, 1,
-0.5247923, 1.289047, -0.6296513, 1, 1, 1, 1, 1,
-0.5161943, 1.718634, 0.5313484, 1, 1, 1, 1, 1,
-0.5145461, -0.2556228, 0.3730032, 1, 1, 1, 1, 1,
-0.5136697, 1.518504, -1.906251, 1, 1, 1, 1, 1,
-0.5124983, -1.891723, -2.385929, 0, 0, 1, 1, 1,
-0.5100622, -1.960635, -3.354115, 1, 0, 0, 1, 1,
-0.5095125, -0.5639457, -2.082127, 1, 0, 0, 1, 1,
-0.508768, -0.9668435, -2.385531, 1, 0, 0, 1, 1,
-0.5079839, 1.527607, 0.3749084, 1, 0, 0, 1, 1,
-0.5065391, 1.237057, 1.077961, 1, 0, 0, 1, 1,
-0.5053047, -0.8609009, -3.59697, 0, 0, 0, 1, 1,
-0.5043765, 0.2024481, -2.141086, 0, 0, 0, 1, 1,
-0.503216, -1.03271, -1.536296, 0, 0, 0, 1, 1,
-0.5015036, -0.1046692, -2.225678, 0, 0, 0, 1, 1,
-0.4998773, 0.2311912, -0.1357883, 0, 0, 0, 1, 1,
-0.4965684, 0.3448832, -1.759613, 0, 0, 0, 1, 1,
-0.4944246, -0.9611421, -3.824851, 0, 0, 0, 1, 1,
-0.4918824, 0.2836227, -0.3672908, 1, 1, 1, 1, 1,
-0.4901638, 1.841323, 0.8819075, 1, 1, 1, 1, 1,
-0.4867094, 2.252804, -2.227838, 1, 1, 1, 1, 1,
-0.483443, -0.2693039, -2.07796, 1, 1, 1, 1, 1,
-0.4815195, -1.277256, -3.112568, 1, 1, 1, 1, 1,
-0.4794033, -0.9483914, -3.299208, 1, 1, 1, 1, 1,
-0.4786151, 0.3828234, -2.666747, 1, 1, 1, 1, 1,
-0.4780498, -0.8994419, -0.894563, 1, 1, 1, 1, 1,
-0.4758539, 1.454149, 0.1853779, 1, 1, 1, 1, 1,
-0.474241, -1.524515, -3.439023, 1, 1, 1, 1, 1,
-0.4660518, -1.292441, -3.490306, 1, 1, 1, 1, 1,
-0.4646229, 1.566503, 1.200418, 1, 1, 1, 1, 1,
-0.4545836, -1.053576, -1.762361, 1, 1, 1, 1, 1,
-0.4491808, -0.3502846, -3.048889, 1, 1, 1, 1, 1,
-0.4453492, 0.9040287, 0.9960624, 1, 1, 1, 1, 1,
-0.4434568, 0.8780157, 0.759994, 0, 0, 1, 1, 1,
-0.442339, 0.03448723, -0.5029415, 1, 0, 0, 1, 1,
-0.4421025, 0.05059987, -1.763952, 1, 0, 0, 1, 1,
-0.4396262, -0.9882412, -1.807131, 1, 0, 0, 1, 1,
-0.4357552, 1.55512, -1.551949, 1, 0, 0, 1, 1,
-0.4355013, 0.4042667, -2.351103, 1, 0, 0, 1, 1,
-0.4347024, -0.4688167, -2.270758, 0, 0, 0, 1, 1,
-0.4342666, -0.3275559, -1.125488, 0, 0, 0, 1, 1,
-0.4340544, 0.2280377, -2.549105, 0, 0, 0, 1, 1,
-0.4330394, -1.488034, -2.00222, 0, 0, 0, 1, 1,
-0.4291577, -0.09334496, -1.41316, 0, 0, 0, 1, 1,
-0.4275392, -0.825111, -2.560632, 0, 0, 0, 1, 1,
-0.4272939, 2.035577, -0.2610891, 0, 0, 0, 1, 1,
-0.4188838, -0.3213874, -2.241062, 1, 1, 1, 1, 1,
-0.4130059, -0.8418822, -3.616122, 1, 1, 1, 1, 1,
-0.4118834, -1.040438, -1.495123, 1, 1, 1, 1, 1,
-0.4118026, -1.747949, -2.46267, 1, 1, 1, 1, 1,
-0.407167, 0.656604, -1.058686, 1, 1, 1, 1, 1,
-0.4015295, 0.3109641, -0.784984, 1, 1, 1, 1, 1,
-0.4012665, 0.5029817, 0.9161465, 1, 1, 1, 1, 1,
-0.3999052, -0.3367195, -2.420496, 1, 1, 1, 1, 1,
-0.3998497, 1.769071, 0.6836213, 1, 1, 1, 1, 1,
-0.398812, 0.8633726, -0.8158552, 1, 1, 1, 1, 1,
-0.3945497, -0.3237517, -2.11781, 1, 1, 1, 1, 1,
-0.3921351, -0.08905755, -2.045511, 1, 1, 1, 1, 1,
-0.3863403, 0.6414133, -3.268603, 1, 1, 1, 1, 1,
-0.3860663, 0.4338318, -1.016162, 1, 1, 1, 1, 1,
-0.3851269, -1.907798, -0.8969899, 1, 1, 1, 1, 1,
-0.3813493, -0.1915962, -1.761228, 0, 0, 1, 1, 1,
-0.380352, 0.2341648, -1.955131, 1, 0, 0, 1, 1,
-0.3793143, 0.4460303, -1.259131, 1, 0, 0, 1, 1,
-0.378249, 0.8583454, 0.2012833, 1, 0, 0, 1, 1,
-0.3775406, -0.04014843, -2.551327, 1, 0, 0, 1, 1,
-0.3770914, 0.2761892, -0.3861664, 1, 0, 0, 1, 1,
-0.3737612, 0.7194518, 0.1273095, 0, 0, 0, 1, 1,
-0.3645887, 1.546133, -0.9132802, 0, 0, 0, 1, 1,
-0.3554757, 2.316295, -0.4771011, 0, 0, 0, 1, 1,
-0.3543173, 0.3783246, -0.4712919, 0, 0, 0, 1, 1,
-0.3531043, -0.5645179, -2.862091, 0, 0, 0, 1, 1,
-0.3475649, 0.3273185, 0.7696002, 0, 0, 0, 1, 1,
-0.3454816, 0.07452016, -0.6090699, 0, 0, 0, 1, 1,
-0.3369194, 0.8623087, -1.922779, 1, 1, 1, 1, 1,
-0.3367234, 0.2971999, -0.4827357, 1, 1, 1, 1, 1,
-0.3353958, -0.5644278, -2.630262, 1, 1, 1, 1, 1,
-0.3337509, -1.304771, -2.984062, 1, 1, 1, 1, 1,
-0.3268045, 1.405137, -1.124452, 1, 1, 1, 1, 1,
-0.3251274, -0.686748, -2.464558, 1, 1, 1, 1, 1,
-0.3200592, -0.1943347, -2.318293, 1, 1, 1, 1, 1,
-0.3151807, -0.54338, -3.171121, 1, 1, 1, 1, 1,
-0.3122024, 0.6135805, 1.391484, 1, 1, 1, 1, 1,
-0.3092608, -1.548894, -3.064346, 1, 1, 1, 1, 1,
-0.3083929, 0.7803249, -0.6898143, 1, 1, 1, 1, 1,
-0.3082072, 0.954614, -0.1858899, 1, 1, 1, 1, 1,
-0.303036, 0.186979, -1.178742, 1, 1, 1, 1, 1,
-0.2989094, -1.038125, -2.934925, 1, 1, 1, 1, 1,
-0.2970982, 0.8640778, -1.23119, 1, 1, 1, 1, 1,
-0.295449, 0.3305245, 0.7418599, 0, 0, 1, 1, 1,
-0.2953348, -1.104686, -1.882508, 1, 0, 0, 1, 1,
-0.2933951, -0.7961397, -1.350614, 1, 0, 0, 1, 1,
-0.2861198, -0.5744903, -3.642786, 1, 0, 0, 1, 1,
-0.2840526, 1.174555, -0.2664264, 1, 0, 0, 1, 1,
-0.283388, -0.5857176, -3.894349, 1, 0, 0, 1, 1,
-0.2819472, -0.1712277, 0.3896917, 0, 0, 0, 1, 1,
-0.2813344, 0.2669125, -0.5210133, 0, 0, 0, 1, 1,
-0.2802484, -0.8950859, -2.688694, 0, 0, 0, 1, 1,
-0.2802089, -1.270888, -3.548281, 0, 0, 0, 1, 1,
-0.2778416, 0.5188161, -1.404579, 0, 0, 0, 1, 1,
-0.274475, 0.2805529, -0.01659141, 0, 0, 0, 1, 1,
-0.2740243, -0.8924528, -2.624907, 0, 0, 0, 1, 1,
-0.2697037, -0.6561449, -3.783985, 1, 1, 1, 1, 1,
-0.2695006, -0.09385655, -1.15611, 1, 1, 1, 1, 1,
-0.2663099, 1.058038, -1.560547, 1, 1, 1, 1, 1,
-0.2653808, 0.1735069, -1.002192, 1, 1, 1, 1, 1,
-0.2609029, 0.4003654, -2.981811, 1, 1, 1, 1, 1,
-0.2562937, -0.319647, -3.303195, 1, 1, 1, 1, 1,
-0.2555804, -0.4547229, -1.465959, 1, 1, 1, 1, 1,
-0.2555583, -0.6237877, -4.012152, 1, 1, 1, 1, 1,
-0.2531508, -1.449693, -2.894725, 1, 1, 1, 1, 1,
-0.2530541, 0.8928953, -1.142764, 1, 1, 1, 1, 1,
-0.2480363, 2.097847, -0.5566747, 1, 1, 1, 1, 1,
-0.2474322, -0.6763785, -3.282914, 1, 1, 1, 1, 1,
-0.2460242, -1.008643, -1.978649, 1, 1, 1, 1, 1,
-0.2402787, -0.3289947, -4.163733, 1, 1, 1, 1, 1,
-0.2401937, 0.622142, -1.670308, 1, 1, 1, 1, 1,
-0.2393666, -0.7315238, -4.1059, 0, 0, 1, 1, 1,
-0.239031, -0.4368494, -1.900235, 1, 0, 0, 1, 1,
-0.2338998, 0.4153007, -0.3717896, 1, 0, 0, 1, 1,
-0.2337884, -0.3583377, -3.3585, 1, 0, 0, 1, 1,
-0.2335724, 0.1782669, -2.315795, 1, 0, 0, 1, 1,
-0.2304282, -0.1320936, -2.629771, 1, 0, 0, 1, 1,
-0.2282816, 0.9123852, -1.769092, 0, 0, 0, 1, 1,
-0.2266693, -0.2647544, -3.399128, 0, 0, 0, 1, 1,
-0.2216721, 0.9070914, 2.107277, 0, 0, 0, 1, 1,
-0.2203149, 0.6159037, -0.2798683, 0, 0, 0, 1, 1,
-0.2191773, 0.5521759, -2.676433, 0, 0, 0, 1, 1,
-0.2165817, -1.827088, -3.97564, 0, 0, 0, 1, 1,
-0.2142745, -0.370551, -2.873485, 0, 0, 0, 1, 1,
-0.2134045, -1.659382, -2.39185, 1, 1, 1, 1, 1,
-0.2096033, 1.3522, 0.01039759, 1, 1, 1, 1, 1,
-0.2075637, 0.07785556, -1.364579, 1, 1, 1, 1, 1,
-0.2060669, 2.196362, -0.8316056, 1, 1, 1, 1, 1,
-0.2008988, 1.035811, 0.3156272, 1, 1, 1, 1, 1,
-0.2004749, 1.752385, -0.0250362, 1, 1, 1, 1, 1,
-0.1958214, 0.5559369, -0.163135, 1, 1, 1, 1, 1,
-0.1934759, 0.07110984, -1.33797, 1, 1, 1, 1, 1,
-0.1817553, -1.73752, -2.54361, 1, 1, 1, 1, 1,
-0.1770677, -0.8323447, -2.508143, 1, 1, 1, 1, 1,
-0.1706876, -0.2174939, -1.856058, 1, 1, 1, 1, 1,
-0.1705059, 0.3350148, 1.190417, 1, 1, 1, 1, 1,
-0.1684196, -0.7743112, -3.05201, 1, 1, 1, 1, 1,
-0.1614674, -0.5786538, -0.227304, 1, 1, 1, 1, 1,
-0.1605666, -0.04180933, -1.25194, 1, 1, 1, 1, 1,
-0.1568214, 0.1181676, -0.6627945, 0, 0, 1, 1, 1,
-0.1544685, 0.3720981, -0.42906, 1, 0, 0, 1, 1,
-0.1528032, -1.189383, -2.585481, 1, 0, 0, 1, 1,
-0.1462062, 0.5777177, 1.00328, 1, 0, 0, 1, 1,
-0.1441143, -0.1891139, -2.749715, 1, 0, 0, 1, 1,
-0.1428246, 0.2853428, -1.913041, 1, 0, 0, 1, 1,
-0.1427965, 0.6720679, -0.4650694, 0, 0, 0, 1, 1,
-0.1411496, -0.5742145, -2.338665, 0, 0, 0, 1, 1,
-0.1411317, -0.3841815, -1.997125, 0, 0, 0, 1, 1,
-0.1393086, 0.9419509, 0.5067812, 0, 0, 0, 1, 1,
-0.1328354, 1.268436, -0.5019338, 0, 0, 0, 1, 1,
-0.1323653, -2.272143, -1.462411, 0, 0, 0, 1, 1,
-0.1305074, -0.4807987, -3.895647, 0, 0, 0, 1, 1,
-0.1297645, 0.1052566, -2.294191, 1, 1, 1, 1, 1,
-0.1289898, -0.7714231, -4.15378, 1, 1, 1, 1, 1,
-0.1281212, 0.9295546, -0.5549259, 1, 1, 1, 1, 1,
-0.1276624, 0.1604238, -1.735803, 1, 1, 1, 1, 1,
-0.122674, 0.2298727, -0.1585374, 1, 1, 1, 1, 1,
-0.1211285, -0.5472727, -3.821688, 1, 1, 1, 1, 1,
-0.119399, -0.1487362, -3.152844, 1, 1, 1, 1, 1,
-0.1112418, -0.3108102, -1.559279, 1, 1, 1, 1, 1,
-0.1067144, 0.4820875, -0.9571528, 1, 1, 1, 1, 1,
-0.10326, 0.9427993, -1.421129, 1, 1, 1, 1, 1,
-0.102044, 0.1083752, -0.2554585, 1, 1, 1, 1, 1,
-0.1018005, -0.1487921, -2.436323, 1, 1, 1, 1, 1,
-0.1014779, -1.091912, -1.650681, 1, 1, 1, 1, 1,
-0.09511251, -0.9198076, -3.415642, 1, 1, 1, 1, 1,
-0.08699425, -0.4380016, -4.080293, 1, 1, 1, 1, 1,
-0.08610004, 0.2515945, 0.09213404, 0, 0, 1, 1, 1,
-0.08579373, 0.09502748, -0.2521692, 1, 0, 0, 1, 1,
-0.07297351, -0.2118475, -3.90516, 1, 0, 0, 1, 1,
-0.07198861, 1.423129, 2.082547, 1, 0, 0, 1, 1,
-0.07046778, 1.969627, 0.003339702, 1, 0, 0, 1, 1,
-0.06668428, 1.123373, 0.6364473, 1, 0, 0, 1, 1,
-0.06231841, 0.6640945, 0.02519865, 0, 0, 0, 1, 1,
-0.06188219, -0.31157, -3.166421, 0, 0, 0, 1, 1,
-0.06163651, -0.9964546, -3.263215, 0, 0, 0, 1, 1,
-0.05975479, 1.159529, -0.5967314, 0, 0, 0, 1, 1,
-0.05552487, -0.0122876, -3.095678, 0, 0, 0, 1, 1,
-0.05455701, -2.377772, -2.430145, 0, 0, 0, 1, 1,
-0.0493317, -1.11701, -3.267628, 0, 0, 0, 1, 1,
-0.04920494, 0.5512053, -0.09799929, 1, 1, 1, 1, 1,
-0.04906659, 0.2480541, 1.1566, 1, 1, 1, 1, 1,
-0.04765649, -1.459006, -3.35513, 1, 1, 1, 1, 1,
-0.04575985, 0.3952253, -1.318918, 1, 1, 1, 1, 1,
-0.0450249, -0.4764575, -2.583691, 1, 1, 1, 1, 1,
-0.04304076, -0.2618795, -1.721021, 1, 1, 1, 1, 1,
-0.03857719, -0.1406042, -3.509259, 1, 1, 1, 1, 1,
-0.03762535, 0.8988458, -1.096826, 1, 1, 1, 1, 1,
-0.03700292, -0.7639003, -4.567991, 1, 1, 1, 1, 1,
-0.02808772, -0.9145191, -2.943737, 1, 1, 1, 1, 1,
-0.02773025, 0.4398173, -1.310133, 1, 1, 1, 1, 1,
-0.02405197, 0.2659076, 0.06126584, 1, 1, 1, 1, 1,
-0.02383634, 1.044073, -0.1734973, 1, 1, 1, 1, 1,
-0.0224077, -1.426626, -4.152683, 1, 1, 1, 1, 1,
-0.02034056, 0.07938074, 0.2270836, 1, 1, 1, 1, 1,
-0.01828621, -1.267317, -4.131357, 0, 0, 1, 1, 1,
-0.0108317, -0.4319175, -3.650739, 1, 0, 0, 1, 1,
-0.003811049, 0.1501497, -1.718737, 1, 0, 0, 1, 1,
-0.001865282, -0.7794957, -3.60496, 1, 0, 0, 1, 1,
-0.0001581767, -1.781039, -1.697576, 1, 0, 0, 1, 1,
0.000975357, -0.2859847, 2.902826, 1, 0, 0, 1, 1,
0.002298278, -1.033838, 2.314421, 0, 0, 0, 1, 1,
0.003378709, 0.1517039, 1.521412, 0, 0, 0, 1, 1,
0.01643247, -0.06339689, 3.659444, 0, 0, 0, 1, 1,
0.01643337, -0.1737388, 4.112097, 0, 0, 0, 1, 1,
0.01676195, 0.9992619, -1.102352, 0, 0, 0, 1, 1,
0.01836964, 0.737517, -0.2566938, 0, 0, 0, 1, 1,
0.021852, 1.516546, -0.4201336, 0, 0, 0, 1, 1,
0.02489015, -1.329838, 3.742715, 1, 1, 1, 1, 1,
0.02899868, 0.1217408, -0.4591693, 1, 1, 1, 1, 1,
0.02933566, 2.156888, -0.07964819, 1, 1, 1, 1, 1,
0.02973456, -0.3089969, 2.507696, 1, 1, 1, 1, 1,
0.03386157, 1.167293, 0.6709634, 1, 1, 1, 1, 1,
0.03572807, -0.5780903, 4.098183, 1, 1, 1, 1, 1,
0.03696904, -1.294206, 3.186372, 1, 1, 1, 1, 1,
0.03811834, 0.4865314, -0.5441947, 1, 1, 1, 1, 1,
0.04592542, 0.7995224, -0.3126099, 1, 1, 1, 1, 1,
0.04700664, -1.395073, 1.55392, 1, 1, 1, 1, 1,
0.04743107, 1.370465, 0.527659, 1, 1, 1, 1, 1,
0.05276677, -1.992768, 4.338348, 1, 1, 1, 1, 1,
0.05362163, -1.083728, 2.220122, 1, 1, 1, 1, 1,
0.0539714, 0.4628051, 1.268545, 1, 1, 1, 1, 1,
0.05490511, 0.1905851, -0.03867853, 1, 1, 1, 1, 1,
0.05549946, -1.492751, 1.589609, 0, 0, 1, 1, 1,
0.05700384, 0.845588, 2.097533, 1, 0, 0, 1, 1,
0.05740742, 0.2149282, 0.7636189, 1, 0, 0, 1, 1,
0.05837596, -0.7157461, 2.88631, 1, 0, 0, 1, 1,
0.0589495, -0.6438992, 3.20025, 1, 0, 0, 1, 1,
0.06550628, -0.2462267, 3.531846, 1, 0, 0, 1, 1,
0.06817206, -1.199815, 1.288856, 0, 0, 0, 1, 1,
0.07222259, -0.7924957, 2.549047, 0, 0, 0, 1, 1,
0.07798308, -0.1522485, 2.085996, 0, 0, 0, 1, 1,
0.08158208, -0.2935801, 4.469337, 0, 0, 0, 1, 1,
0.08495484, -1.648032, 1.335317, 0, 0, 0, 1, 1,
0.09598591, 0.8921847, 0.8869562, 0, 0, 0, 1, 1,
0.1006612, -0.2386056, 2.292563, 0, 0, 0, 1, 1,
0.1010563, -1.446413, 0.8642151, 1, 1, 1, 1, 1,
0.1014125, 0.1020069, 1.202915, 1, 1, 1, 1, 1,
0.1054931, 0.7920403, -0.8848977, 1, 1, 1, 1, 1,
0.1081336, -0.3579283, 2.516034, 1, 1, 1, 1, 1,
0.1096365, 0.279368, 0.4268025, 1, 1, 1, 1, 1,
0.1099499, 0.5538414, 1.843916, 1, 1, 1, 1, 1,
0.1115228, -0.3724661, 2.694913, 1, 1, 1, 1, 1,
0.1130075, 0.6443254, 2.03497, 1, 1, 1, 1, 1,
0.1131454, 0.8517275, 1.120189, 1, 1, 1, 1, 1,
0.1275395, 0.1705886, 1.409257, 1, 1, 1, 1, 1,
0.1288871, -1.231109, 2.629536, 1, 1, 1, 1, 1,
0.1295738, -0.06395792, 1.50912, 1, 1, 1, 1, 1,
0.1309597, 1.35897, 1.824471, 1, 1, 1, 1, 1,
0.1315054, 1.416272, -0.7618967, 1, 1, 1, 1, 1,
0.1329144, -1.438082, 3.902908, 1, 1, 1, 1, 1,
0.1375761, -0.3507832, 3.546772, 0, 0, 1, 1, 1,
0.1410047, -1.730076, 3.718614, 1, 0, 0, 1, 1,
0.1435314, 1.152962, -1.431947, 1, 0, 0, 1, 1,
0.1485489, -0.526008, 3.089222, 1, 0, 0, 1, 1,
0.1510587, 1.785608, 0.527844, 1, 0, 0, 1, 1,
0.1534486, 0.7462302, -0.2845959, 1, 0, 0, 1, 1,
0.1548362, -0.330999, 2.792302, 0, 0, 0, 1, 1,
0.1551059, -0.1854245, 2.031067, 0, 0, 0, 1, 1,
0.1560666, -0.9764436, 3.643638, 0, 0, 0, 1, 1,
0.1600809, -0.1690697, 2.317781, 0, 0, 0, 1, 1,
0.1607632, 0.733268, 0.6088058, 0, 0, 0, 1, 1,
0.1621438, -0.2875701, 0.05914014, 0, 0, 0, 1, 1,
0.170455, 0.1902214, -0.8439398, 0, 0, 0, 1, 1,
0.1723204, -0.4520446, 2.88974, 1, 1, 1, 1, 1,
0.1748116, -0.04704414, 0.8590524, 1, 1, 1, 1, 1,
0.1764486, -0.04974017, 1.348349, 1, 1, 1, 1, 1,
0.1801545, 0.8550442, -1.311897, 1, 1, 1, 1, 1,
0.1811629, 1.454655, 1.03199, 1, 1, 1, 1, 1,
0.1832708, -0.5729676, 1.595438, 1, 1, 1, 1, 1,
0.1846153, -0.6549817, 1.761821, 1, 1, 1, 1, 1,
0.187322, -0.1607428, 2.231719, 1, 1, 1, 1, 1,
0.1874936, 0.726712, -0.528446, 1, 1, 1, 1, 1,
0.1876564, 0.05355127, 1.151502, 1, 1, 1, 1, 1,
0.1880408, 1.178401, -0.8991155, 1, 1, 1, 1, 1,
0.1889538, 0.3963841, 0.445865, 1, 1, 1, 1, 1,
0.1910145, 0.4745546, 0.1633534, 1, 1, 1, 1, 1,
0.1926579, -1.541805, 4.474267, 1, 1, 1, 1, 1,
0.1930941, 1.088017, 0.2048746, 1, 1, 1, 1, 1,
0.1941117, -0.03363926, 2.072371, 0, 0, 1, 1, 1,
0.195441, -0.0357723, 0.3224768, 1, 0, 0, 1, 1,
0.1955257, 0.5818169, 0.6226714, 1, 0, 0, 1, 1,
0.1997185, 0.1535395, 0.553323, 1, 0, 0, 1, 1,
0.2032724, -0.0325888, 0.271432, 1, 0, 0, 1, 1,
0.2051255, -0.1985229, 2.730883, 1, 0, 0, 1, 1,
0.20922, 0.3841023, -0.2215349, 0, 0, 0, 1, 1,
0.2118715, 1.402887, 0.8732207, 0, 0, 0, 1, 1,
0.2133663, 0.1379288, 1.801137, 0, 0, 0, 1, 1,
0.2137271, 0.8970561, -0.4375528, 0, 0, 0, 1, 1,
0.2191638, -1.531379, 2.905968, 0, 0, 0, 1, 1,
0.226168, 0.4138136, -1.46718, 0, 0, 0, 1, 1,
0.2265177, 0.3797591, 0.8913273, 0, 0, 0, 1, 1,
0.2278241, 0.4644221, 1.029737, 1, 1, 1, 1, 1,
0.2289115, -0.4112558, 1.716446, 1, 1, 1, 1, 1,
0.2317312, 0.3682298, 1.999344, 1, 1, 1, 1, 1,
0.2358701, -1.113343, 2.68505, 1, 1, 1, 1, 1,
0.2377906, -0.02652339, 1.001189, 1, 1, 1, 1, 1,
0.2401758, -1.172756, 3.38555, 1, 1, 1, 1, 1,
0.2431372, -1.347046, 0.7217593, 1, 1, 1, 1, 1,
0.2455732, 0.7984454, -1.595634, 1, 1, 1, 1, 1,
0.2483331, 0.07515166, 1.639383, 1, 1, 1, 1, 1,
0.2509432, -1.360984, 5.242358, 1, 1, 1, 1, 1,
0.2514271, -0.9257399, 1.533327, 1, 1, 1, 1, 1,
0.2551008, 0.02639959, 1.805133, 1, 1, 1, 1, 1,
0.2557094, -0.7245981, 3.28263, 1, 1, 1, 1, 1,
0.2560415, 0.4402417, -1.646021, 1, 1, 1, 1, 1,
0.2613184, 0.3848661, 2.043854, 1, 1, 1, 1, 1,
0.2625627, -0.6312846, 3.94582, 0, 0, 1, 1, 1,
0.264166, -0.6444768, 1.994539, 1, 0, 0, 1, 1,
0.2642729, 0.7865926, 0.7397962, 1, 0, 0, 1, 1,
0.2690777, -0.6060398, 2.197623, 1, 0, 0, 1, 1,
0.2728048, 0.5881336, 1.648811, 1, 0, 0, 1, 1,
0.2766981, -1.505922, 3.608007, 1, 0, 0, 1, 1,
0.2785063, -1.314973, 3.561902, 0, 0, 0, 1, 1,
0.2786159, 1.208984, 0.4761607, 0, 0, 0, 1, 1,
0.2800017, 0.6369479, 0.986805, 0, 0, 0, 1, 1,
0.2832409, -1.151299, 2.411793, 0, 0, 0, 1, 1,
0.2885779, -1.287854, 4.488704, 0, 0, 0, 1, 1,
0.2916868, 0.4020966, 0.008965142, 0, 0, 0, 1, 1,
0.2960037, -1.257025, 1.850404, 0, 0, 0, 1, 1,
0.2981033, -2.361159, 2.724968, 1, 1, 1, 1, 1,
0.2981833, 2.075331, -0.1505724, 1, 1, 1, 1, 1,
0.2987665, 0.6739433, -0.1920179, 1, 1, 1, 1, 1,
0.2990665, 0.5809543, 0.8066592, 1, 1, 1, 1, 1,
0.3024991, 1.106287, 0.7417271, 1, 1, 1, 1, 1,
0.3026221, 0.722689, 1.634845, 1, 1, 1, 1, 1,
0.3029208, -0.1581362, 1.016298, 1, 1, 1, 1, 1,
0.3080128, 0.09376952, 0.9829715, 1, 1, 1, 1, 1,
0.3083089, -0.380496, 1.786209, 1, 1, 1, 1, 1,
0.3142462, -0.2627975, 3.685043, 1, 1, 1, 1, 1,
0.3162897, 0.4634004, 0.8407471, 1, 1, 1, 1, 1,
0.3164657, 0.2047477, -0.5408481, 1, 1, 1, 1, 1,
0.3212253, -0.2962933, 1.915262, 1, 1, 1, 1, 1,
0.3235834, 0.1301335, -0.03690248, 1, 1, 1, 1, 1,
0.3304144, -0.7685468, 4.283724, 1, 1, 1, 1, 1,
0.3306624, 0.6470095, -0.6869843, 0, 0, 1, 1, 1,
0.3367158, 0.239063, 1.211822, 1, 0, 0, 1, 1,
0.3369081, -0.2034662, 3.273326, 1, 0, 0, 1, 1,
0.3385739, -1.811038, 2.813562, 1, 0, 0, 1, 1,
0.3541473, -0.5639964, 2.368977, 1, 0, 0, 1, 1,
0.3562605, -0.4183263, 1.980149, 1, 0, 0, 1, 1,
0.3571849, 0.1425363, 0.7619753, 0, 0, 0, 1, 1,
0.3616517, 0.3215637, -0.183602, 0, 0, 0, 1, 1,
0.3622903, 0.2956259, -0.05868544, 0, 0, 0, 1, 1,
0.3707689, -2.380655, 2.642562, 0, 0, 0, 1, 1,
0.3738387, 0.1418273, 1.240329, 0, 0, 0, 1, 1,
0.3815452, -0.6558889, 4.208168, 0, 0, 0, 1, 1,
0.3861226, 0.6272848, 0.474457, 0, 0, 0, 1, 1,
0.3890031, 0.009052971, 0.9640438, 1, 1, 1, 1, 1,
0.3897274, 0.7958247, -1.179245, 1, 1, 1, 1, 1,
0.3905067, -0.4786817, 3.768087, 1, 1, 1, 1, 1,
0.3920115, -0.6705751, 3.269485, 1, 1, 1, 1, 1,
0.3996983, -1.335483, 1.234267, 1, 1, 1, 1, 1,
0.4003864, 0.05093995, 0.1877391, 1, 1, 1, 1, 1,
0.4048871, 0.8757846, -0.5381261, 1, 1, 1, 1, 1,
0.405194, 0.5551805, -0.2874425, 1, 1, 1, 1, 1,
0.4057343, 0.9119757, -1.053453, 1, 1, 1, 1, 1,
0.4066781, 1.925031, 0.7231304, 1, 1, 1, 1, 1,
0.4075813, -0.6157258, 2.432903, 1, 1, 1, 1, 1,
0.4102716, -1.037455, 4.198456, 1, 1, 1, 1, 1,
0.4158574, 0.3211577, 0.8770601, 1, 1, 1, 1, 1,
0.4187821, -0.8986111, 3.381672, 1, 1, 1, 1, 1,
0.420182, -0.6561408, 2.421556, 1, 1, 1, 1, 1,
0.4202949, 0.8471431, -0.4928361, 0, 0, 1, 1, 1,
0.4225656, 0.9632275, 1.465828, 1, 0, 0, 1, 1,
0.423602, -2.443883, 2.871597, 1, 0, 0, 1, 1,
0.4284934, -0.6720267, 1.35739, 1, 0, 0, 1, 1,
0.4301125, 0.3248387, -0.03526943, 1, 0, 0, 1, 1,
0.432545, 0.3152159, 0.4579195, 1, 0, 0, 1, 1,
0.440058, -0.7466409, 2.671243, 0, 0, 0, 1, 1,
0.4448607, -1.688031, 1.881386, 0, 0, 0, 1, 1,
0.4452044, -1.611324, 3.563607, 0, 0, 0, 1, 1,
0.4501995, 0.405277, 1.844962, 0, 0, 0, 1, 1,
0.4534535, 0.4892783, 0.8210943, 0, 0, 0, 1, 1,
0.4535266, 0.3221247, 0.9828598, 0, 0, 0, 1, 1,
0.4571416, 0.9130293, 0.07786737, 0, 0, 0, 1, 1,
0.4615913, 0.6448436, -1.419515, 1, 1, 1, 1, 1,
0.4630428, -1.919539, 2.190443, 1, 1, 1, 1, 1,
0.4653316, 0.2186595, 0.4390076, 1, 1, 1, 1, 1,
0.4653938, -0.7569843, 3.222571, 1, 1, 1, 1, 1,
0.4693045, 0.253304, -0.5157961, 1, 1, 1, 1, 1,
0.4707208, -0.3207194, 0.7227037, 1, 1, 1, 1, 1,
0.4711797, 0.1651526, 1.110294, 1, 1, 1, 1, 1,
0.4742004, -0.5010262, 1.51714, 1, 1, 1, 1, 1,
0.4790096, 1.307435, -1.521459, 1, 1, 1, 1, 1,
0.4906513, -0.9167464, 3.96431, 1, 1, 1, 1, 1,
0.491992, -0.08459475, 0.8052009, 1, 1, 1, 1, 1,
0.4931059, 0.448424, 1.490802, 1, 1, 1, 1, 1,
0.4939408, 1.083602, -0.3290716, 1, 1, 1, 1, 1,
0.4961548, -1.532285, 4.021814, 1, 1, 1, 1, 1,
0.497093, -1.342499, 2.850978, 1, 1, 1, 1, 1,
0.4974243, -1.818382, 3.338159, 0, 0, 1, 1, 1,
0.4992777, 1.266066, 0.01795577, 1, 0, 0, 1, 1,
0.5065385, 1.937992, 0.9944074, 1, 0, 0, 1, 1,
0.5088052, 0.8573742, -0.002775526, 1, 0, 0, 1, 1,
0.5089923, 0.8086289, -0.339432, 1, 0, 0, 1, 1,
0.5095231, 0.1185505, 1.896303, 1, 0, 0, 1, 1,
0.5099291, 1.259884, 0.7690332, 0, 0, 0, 1, 1,
0.5123819, -0.07190973, 3.175042, 0, 0, 0, 1, 1,
0.5154339, -1.640149, 2.646999, 0, 0, 0, 1, 1,
0.5239101, 0.31512, 3.071244, 0, 0, 0, 1, 1,
0.5283067, -0.3135154, 1.609332, 0, 0, 0, 1, 1,
0.5296175, -1.146541, 3.501616, 0, 0, 0, 1, 1,
0.5370385, -0.7105393, 1.543455, 0, 0, 0, 1, 1,
0.5382215, 0.3177963, -1.118992, 1, 1, 1, 1, 1,
0.5407629, -0.2973977, 4.163525, 1, 1, 1, 1, 1,
0.5410219, 0.9784487, 0.3668084, 1, 1, 1, 1, 1,
0.5455732, -0.8769085, 3.576746, 1, 1, 1, 1, 1,
0.5460543, -0.4140812, 1.873119, 1, 1, 1, 1, 1,
0.5468911, 0.0673613, -1.024391, 1, 1, 1, 1, 1,
0.5486145, -1.716338, 3.585663, 1, 1, 1, 1, 1,
0.5507538, 0.6049725, 2.90864, 1, 1, 1, 1, 1,
0.5515403, 0.2817666, 0.3611056, 1, 1, 1, 1, 1,
0.5626982, -0.1960768, 0.8741465, 1, 1, 1, 1, 1,
0.5630265, -0.4192488, 3.272337, 1, 1, 1, 1, 1,
0.5637099, 1.711792, 0.6441017, 1, 1, 1, 1, 1,
0.5653703, -0.3514653, 1.516979, 1, 1, 1, 1, 1,
0.5666704, 0.2174455, 0.8821124, 1, 1, 1, 1, 1,
0.5671209, -0.1808621, 1.7461, 1, 1, 1, 1, 1,
0.569369, 1.214894, 0.2848877, 0, 0, 1, 1, 1,
0.5701032, -0.3709652, 2.562986, 1, 0, 0, 1, 1,
0.5715438, -0.4390157, 1.544693, 1, 0, 0, 1, 1,
0.5768219, 1.218455, -0.6811262, 1, 0, 0, 1, 1,
0.5792614, 0.9161167, 1.139549, 1, 0, 0, 1, 1,
0.5818175, -1.186664, 2.766515, 1, 0, 0, 1, 1,
0.5836236, -1.598537, 2.588042, 0, 0, 0, 1, 1,
0.5846184, 1.019598, -0.2666185, 0, 0, 0, 1, 1,
0.5865688, -0.006969314, -0.2287007, 0, 0, 0, 1, 1,
0.5880583, -0.8746527, 1.412951, 0, 0, 0, 1, 1,
0.5925332, 0.7881045, 1.89725, 0, 0, 0, 1, 1,
0.5927008, 0.6280637, 0.8815463, 0, 0, 0, 1, 1,
0.5934245, 1.768319, 1.141919, 0, 0, 0, 1, 1,
0.5943584, 0.3659604, 1.513447, 1, 1, 1, 1, 1,
0.5943881, 0.2854336, 3.007206, 1, 1, 1, 1, 1,
0.5958415, 1.179109, 1.055419, 1, 1, 1, 1, 1,
0.6020977, 0.07210582, 2.226294, 1, 1, 1, 1, 1,
0.6022695, 0.3601604, 1.018458, 1, 1, 1, 1, 1,
0.6084585, -0.09604929, 2.6718, 1, 1, 1, 1, 1,
0.6092805, 0.8740569, -1.038679, 1, 1, 1, 1, 1,
0.610162, -0.9625531, 2.299212, 1, 1, 1, 1, 1,
0.6216456, -0.8389304, 1.672799, 1, 1, 1, 1, 1,
0.6287587, -1.794668, 3.759711, 1, 1, 1, 1, 1,
0.6327814, 1.210187, 0.8295893, 1, 1, 1, 1, 1,
0.6343497, -0.2857326, 1.400048, 1, 1, 1, 1, 1,
0.6351867, -0.1840689, 1.956437, 1, 1, 1, 1, 1,
0.6362147, 1.172784, -0.4162813, 1, 1, 1, 1, 1,
0.6401703, -0.2876662, 3.448434, 1, 1, 1, 1, 1,
0.6409112, 0.06476142, 2.611883, 0, 0, 1, 1, 1,
0.6430295, 0.942089, 1.547935, 1, 0, 0, 1, 1,
0.6437845, -2.834736, 1.608464, 1, 0, 0, 1, 1,
0.6475966, 0.1521483, 3.744454, 1, 0, 0, 1, 1,
0.652686, -0.7628562, 3.898828, 1, 0, 0, 1, 1,
0.6546729, 0.8837326, 1.382791, 1, 0, 0, 1, 1,
0.6565389, 1.703286, 1.691793, 0, 0, 0, 1, 1,
0.6568929, -0.5051792, 2.629231, 0, 0, 0, 1, 1,
0.6584037, -1.101929, 3.203054, 0, 0, 0, 1, 1,
0.6601422, 0.3675836, 0.7738983, 0, 0, 0, 1, 1,
0.6688902, 0.9232631, 2.173923, 0, 0, 0, 1, 1,
0.6741577, 1.549224, -0.6500229, 0, 0, 0, 1, 1,
0.6744659, 1.302076, -1.623256, 0, 0, 0, 1, 1,
0.6746459, -0.5690753, 3.023779, 1, 1, 1, 1, 1,
0.681689, 2.481296, 0.4990094, 1, 1, 1, 1, 1,
0.6878616, 0.6423223, 0.743524, 1, 1, 1, 1, 1,
0.690577, 0.05639753, -0.2382895, 1, 1, 1, 1, 1,
0.6924415, 1.085044, 0.856032, 1, 1, 1, 1, 1,
0.7020178, 1.60302, -0.1607091, 1, 1, 1, 1, 1,
0.7062721, 0.1920778, 1.684455, 1, 1, 1, 1, 1,
0.7117914, -0.8518025, 2.445736, 1, 1, 1, 1, 1,
0.7165723, -0.2402292, 1.606154, 1, 1, 1, 1, 1,
0.7180431, -2.156987, 4.62015, 1, 1, 1, 1, 1,
0.7195818, 0.8772434, 0.5095305, 1, 1, 1, 1, 1,
0.7202454, -1.92006, 3.260355, 1, 1, 1, 1, 1,
0.7249749, 1.304819, 2.612813, 1, 1, 1, 1, 1,
0.7312282, 0.1059057, -0.7430102, 1, 1, 1, 1, 1,
0.7363163, -0.7027395, 5.018416, 1, 1, 1, 1, 1,
0.7414072, 0.7668643, -0.01659719, 0, 0, 1, 1, 1,
0.7421175, -0.995716, 2.355389, 1, 0, 0, 1, 1,
0.7528039, -0.3823224, 0.6410677, 1, 0, 0, 1, 1,
0.7551523, -0.2406806, 2.587472, 1, 0, 0, 1, 1,
0.7553543, 0.1573728, 0.3910291, 1, 0, 0, 1, 1,
0.7570201, 1.057008, 1.268072, 1, 0, 0, 1, 1,
0.7628455, 0.3207783, 0.5836095, 0, 0, 0, 1, 1,
0.7662023, -1.177333, 0.7825354, 0, 0, 0, 1, 1,
0.7702752, 0.3966082, 2.571869, 0, 0, 0, 1, 1,
0.7711354, -0.2757832, 0.2584893, 0, 0, 0, 1, 1,
0.77693, -1.375118, 2.625654, 0, 0, 0, 1, 1,
0.7796119, 0.5382503, 1.2535, 0, 0, 0, 1, 1,
0.7822487, 0.0790501, 0.9955776, 0, 0, 0, 1, 1,
0.7826032, -1.268375, 1.913392, 1, 1, 1, 1, 1,
0.7833301, 1.40137, 0.9188131, 1, 1, 1, 1, 1,
0.7888418, 0.2660939, 2.19093, 1, 1, 1, 1, 1,
0.7994808, -0.9005298, 2.954979, 1, 1, 1, 1, 1,
0.8048362, 1.223299, -0.1215214, 1, 1, 1, 1, 1,
0.8062446, 0.07968792, 1.450059, 1, 1, 1, 1, 1,
0.806596, -0.05949702, 0.5952842, 1, 1, 1, 1, 1,
0.8103015, 0.02913821, -0.1144836, 1, 1, 1, 1, 1,
0.8103651, -0.296633, 3.616548, 1, 1, 1, 1, 1,
0.8119636, 1.47053, -0.4181944, 1, 1, 1, 1, 1,
0.8125085, -0.3703089, 2.109461, 1, 1, 1, 1, 1,
0.8135291, -0.3613826, 2.04032, 1, 1, 1, 1, 1,
0.8159756, -0.6687589, 2.863931, 1, 1, 1, 1, 1,
0.8200941, 0.4846457, 2.10942, 1, 1, 1, 1, 1,
0.8206999, -0.6394568, 2.607177, 1, 1, 1, 1, 1,
0.8243769, -2.247618, 1.487172, 0, 0, 1, 1, 1,
0.828113, 0.1881859, 2.463316, 1, 0, 0, 1, 1,
0.8408759, -1.428841, 1.593436, 1, 0, 0, 1, 1,
0.8450015, 0.6647478, -0.008978542, 1, 0, 0, 1, 1,
0.8461438, -0.4308415, 3.082529, 1, 0, 0, 1, 1,
0.850378, -2.032692, 1.035792, 1, 0, 0, 1, 1,
0.852141, -0.767266, 3.775136, 0, 0, 0, 1, 1,
0.8582034, 1.274944, 0.8029077, 0, 0, 0, 1, 1,
0.8610747, 0.989067, -0.9942838, 0, 0, 0, 1, 1,
0.8653483, 1.044569, 0.6752545, 0, 0, 0, 1, 1,
0.8654557, 1.21056, -0.03678763, 0, 0, 0, 1, 1,
0.8684216, -0.07618652, 1.183679, 0, 0, 0, 1, 1,
0.8714725, 0.3879762, 0.732006, 0, 0, 0, 1, 1,
0.8841495, 0.2881972, -0.3836094, 1, 1, 1, 1, 1,
0.8892527, 0.08308249, 1.247814, 1, 1, 1, 1, 1,
0.8990126, 0.7787417, 1.444001, 1, 1, 1, 1, 1,
0.8993583, 0.3747914, 1.81778, 1, 1, 1, 1, 1,
0.905197, -1.276481, 2.69959, 1, 1, 1, 1, 1,
0.914135, 0.9954185, 0.5381172, 1, 1, 1, 1, 1,
0.9153495, -0.6067696, 2.26261, 1, 1, 1, 1, 1,
0.9159247, -1.010476, 1.455421, 1, 1, 1, 1, 1,
0.9190717, 0.5110371, 2.961868, 1, 1, 1, 1, 1,
0.9207236, -1.885196, 0.9463781, 1, 1, 1, 1, 1,
0.9237856, -1.647192, 1.668914, 1, 1, 1, 1, 1,
0.9244595, -0.6303232, 0.26551, 1, 1, 1, 1, 1,
0.9248615, -1.609104, 3.110005, 1, 1, 1, 1, 1,
0.9321268, 0.9390279, 0.4091687, 1, 1, 1, 1, 1,
0.9558172, -1.145785, 3.516322, 1, 1, 1, 1, 1,
0.9579915, 0.1555523, 2.728033, 0, 0, 1, 1, 1,
0.9607201, 1.493455, 0.8959182, 1, 0, 0, 1, 1,
0.9610847, -0.881335, 1.55075, 1, 0, 0, 1, 1,
0.9614792, 0.7435231, -0.1301097, 1, 0, 0, 1, 1,
0.9623234, 0.3427862, 1.018545, 1, 0, 0, 1, 1,
0.9624907, 0.6914392, 0.794355, 1, 0, 0, 1, 1,
0.96939, 0.3890638, 1.124622, 0, 0, 0, 1, 1,
0.9706213, 1.324922, -0.03801965, 0, 0, 0, 1, 1,
0.9724965, 1.126633, 0.2146786, 0, 0, 0, 1, 1,
0.9865903, -1.17564, 1.340461, 0, 0, 0, 1, 1,
0.9902436, -2.480608, 3.521601, 0, 0, 0, 1, 1,
0.9917019, 0.07830143, 0.9247316, 0, 0, 0, 1, 1,
0.9982033, 0.2346954, 0.8545599, 0, 0, 0, 1, 1,
1.001104, -0.5157171, 1.831244, 1, 1, 1, 1, 1,
1.00246, -0.2402168, 1.936949, 1, 1, 1, 1, 1,
1.008007, -0.151168, 3.044424, 1, 1, 1, 1, 1,
1.012988, -0.8272449, 1.550543, 1, 1, 1, 1, 1,
1.013669, 0.1408329, 3.772242, 1, 1, 1, 1, 1,
1.016433, 1.384912, 1.262296, 1, 1, 1, 1, 1,
1.016671, 1.600458, 1.860488, 1, 1, 1, 1, 1,
1.032323, 0.05293948, 1.227857, 1, 1, 1, 1, 1,
1.036896, -0.1669209, 1.009896, 1, 1, 1, 1, 1,
1.043421, 0.1590433, 2.29829, 1, 1, 1, 1, 1,
1.047266, 1.521568, -1.076823, 1, 1, 1, 1, 1,
1.047456, 2.009479, 0.3255279, 1, 1, 1, 1, 1,
1.060389, 0.2620097, 0.7124771, 1, 1, 1, 1, 1,
1.069068, -1.993687, 2.718628, 1, 1, 1, 1, 1,
1.072506, 0.3115103, -0.3362474, 1, 1, 1, 1, 1,
1.073013, 0.5697352, 1.673879, 0, 0, 1, 1, 1,
1.076136, -1.594135, 2.593426, 1, 0, 0, 1, 1,
1.078708, 0.2108274, 1.683884, 1, 0, 0, 1, 1,
1.080465, -0.2736176, 1.988422, 1, 0, 0, 1, 1,
1.088044, 0.6994374, 1.028265, 1, 0, 0, 1, 1,
1.090183, -1.537718, 0.6696515, 1, 0, 0, 1, 1,
1.095682, 0.6689777, -0.9885328, 0, 0, 0, 1, 1,
1.108983, -0.9506558, 3.039521, 0, 0, 0, 1, 1,
1.114941, -2.052455, 3.760254, 0, 0, 0, 1, 1,
1.123668, -2.039577, 1.953449, 0, 0, 0, 1, 1,
1.132015, 0.09165771, 0.4492562, 0, 0, 0, 1, 1,
1.133345, -0.4578468, 3.193125, 0, 0, 0, 1, 1,
1.140536, -2.22599, 2.686136, 0, 0, 0, 1, 1,
1.170039, 1.631982, 0.4851275, 1, 1, 1, 1, 1,
1.172742, -0.8151647, 1.659866, 1, 1, 1, 1, 1,
1.181611, -1.131935, 0.3150569, 1, 1, 1, 1, 1,
1.188149, -1.160038, 1.735846, 1, 1, 1, 1, 1,
1.191666, 1.839842, 0.9905608, 1, 1, 1, 1, 1,
1.206569, -1.072949, 2.048865, 1, 1, 1, 1, 1,
1.209701, 0.2443113, 1.920778, 1, 1, 1, 1, 1,
1.214992, 0.6966884, 0.1987316, 1, 1, 1, 1, 1,
1.221445, -1.413834, 1.729094, 1, 1, 1, 1, 1,
1.229472, -0.272922, 1.58782, 1, 1, 1, 1, 1,
1.234249, -0.7587149, 2.361604, 1, 1, 1, 1, 1,
1.23964, 0.3405841, -0.0814114, 1, 1, 1, 1, 1,
1.240313, 0.4777102, 2.083532, 1, 1, 1, 1, 1,
1.247964, -0.3390564, 0.901881, 1, 1, 1, 1, 1,
1.250809, 2.544704, 0.07528292, 1, 1, 1, 1, 1,
1.251208, 0.1906767, 1.002192, 0, 0, 1, 1, 1,
1.253136, 1.34645, 0.1392685, 1, 0, 0, 1, 1,
1.257726, 1.186867, 1.066626, 1, 0, 0, 1, 1,
1.259051, 1.216635, 1.101611, 1, 0, 0, 1, 1,
1.265378, -0.2298079, 2.111245, 1, 0, 0, 1, 1,
1.272619, 0.6917467, -0.3390337, 1, 0, 0, 1, 1,
1.274534, -0.406114, 0.748359, 0, 0, 0, 1, 1,
1.277614, -0.6609124, 1.769254, 0, 0, 0, 1, 1,
1.285455, -2.554521, 1.287253, 0, 0, 0, 1, 1,
1.288365, -0.2806924, 1.720079, 0, 0, 0, 1, 1,
1.295431, 0.4172017, 0.8298703, 0, 0, 0, 1, 1,
1.305912, -0.6505699, 0.3531442, 0, 0, 0, 1, 1,
1.314227, -1.769991, 2.878742, 0, 0, 0, 1, 1,
1.316256, 2.340515, -0.285778, 1, 1, 1, 1, 1,
1.329354, 0.659192, 0.5254148, 1, 1, 1, 1, 1,
1.329711, -0.7074888, 1.853831, 1, 1, 1, 1, 1,
1.332844, 1.385206, 2.987761, 1, 1, 1, 1, 1,
1.340008, 0.6992601, 2.664779, 1, 1, 1, 1, 1,
1.347871, 0.1003902, 2.715531, 1, 1, 1, 1, 1,
1.356619, 0.07923535, 1.046186, 1, 1, 1, 1, 1,
1.358328, -1.071128, 1.671757, 1, 1, 1, 1, 1,
1.373873, -1.179156, 1.109697, 1, 1, 1, 1, 1,
1.389326, -0.5255707, 1.471446, 1, 1, 1, 1, 1,
1.394786, -0.3343355, 3.094756, 1, 1, 1, 1, 1,
1.395856, 0.2628524, 2.118318, 1, 1, 1, 1, 1,
1.407968, 0.383212, 2.287011, 1, 1, 1, 1, 1,
1.40844, 0.300804, 2.160077, 1, 1, 1, 1, 1,
1.410153, -0.3657596, 1.393097, 1, 1, 1, 1, 1,
1.41305, -1.323222, 3.171265, 0, 0, 1, 1, 1,
1.420623, 2.007481, 0.8668509, 1, 0, 0, 1, 1,
1.436241, -0.3022165, 1.363948, 1, 0, 0, 1, 1,
1.437719, 0.5275589, 0.7685457, 1, 0, 0, 1, 1,
1.439822, 1.197273, 0.529835, 1, 0, 0, 1, 1,
1.445216, -0.4288533, 1.22424, 1, 0, 0, 1, 1,
1.449062, -0.6603829, 3.008673, 0, 0, 0, 1, 1,
1.450164, 1.587128, 1.518371, 0, 0, 0, 1, 1,
1.453447, 0.3278632, 0.09546632, 0, 0, 0, 1, 1,
1.455905, -0.00636446, 3.110241, 0, 0, 0, 1, 1,
1.467276, -0.5268704, 1.557709, 0, 0, 0, 1, 1,
1.475721, -0.4084593, 3.110845, 0, 0, 0, 1, 1,
1.479335, -2.465211, 2.14107, 0, 0, 0, 1, 1,
1.484055, -0.7076356, 0.3528417, 1, 1, 1, 1, 1,
1.485169, 1.050503, 1.290534, 1, 1, 1, 1, 1,
1.488747, -0.8034287, 2.908839, 1, 1, 1, 1, 1,
1.489442, -0.08430297, 2.879812, 1, 1, 1, 1, 1,
1.497232, -1.626264, 1.011732, 1, 1, 1, 1, 1,
1.498651, -0.3496902, 1.493883, 1, 1, 1, 1, 1,
1.506343, -0.5723374, 1.234919, 1, 1, 1, 1, 1,
1.509147, 0.9769025, -0.03735642, 1, 1, 1, 1, 1,
1.518257, 1.128357, 1.794442, 1, 1, 1, 1, 1,
1.519725, 0.968594, -0.1261613, 1, 1, 1, 1, 1,
1.523937, 0.3491586, 2.153957, 1, 1, 1, 1, 1,
1.527719, -1.289349, 3.36383, 1, 1, 1, 1, 1,
1.535087, -0.06568244, 2.385348, 1, 1, 1, 1, 1,
1.536796, 0.543228, 1.993243, 1, 1, 1, 1, 1,
1.549935, -0.426968, 1.127728, 1, 1, 1, 1, 1,
1.55606, -0.4102562, 0.7094357, 0, 0, 1, 1, 1,
1.565115, 1.119616, 1.289077, 1, 0, 0, 1, 1,
1.605277, 0.9769491, 1.530369, 1, 0, 0, 1, 1,
1.614863, -1.247904, 2.285816, 1, 0, 0, 1, 1,
1.629467, -0.1633553, 1.070137, 1, 0, 0, 1, 1,
1.630004, 1.765792, -0.6335085, 1, 0, 0, 1, 1,
1.634454, -0.2638412, 1.833585, 0, 0, 0, 1, 1,
1.680492, -0.1068282, 1.046501, 0, 0, 0, 1, 1,
1.695432, -1.213654, 2.191564, 0, 0, 0, 1, 1,
1.705023, -1.078767, 2.907232, 0, 0, 0, 1, 1,
1.721754, 0.7207035, 2.484643, 0, 0, 0, 1, 1,
1.760919, 0.9669899, 1.712669, 0, 0, 0, 1, 1,
1.782902, -1.584095, 3.679802, 0, 0, 0, 1, 1,
1.798941, -2.035459, 1.825517, 1, 1, 1, 1, 1,
1.805464, -0.1327885, 3.22369, 1, 1, 1, 1, 1,
1.808503, -1.505858, 1.568624, 1, 1, 1, 1, 1,
1.8229, 0.6391467, 0.9561625, 1, 1, 1, 1, 1,
1.829464, -0.5918952, 2.185137, 1, 1, 1, 1, 1,
1.837961, -3.731839, 1.711386, 1, 1, 1, 1, 1,
1.855379, -0.2272371, 1.48279, 1, 1, 1, 1, 1,
1.865094, -1.150317, 1.252797, 1, 1, 1, 1, 1,
1.873798, -0.4354253, 3.006345, 1, 1, 1, 1, 1,
1.876678, -0.8240483, 1.462587, 1, 1, 1, 1, 1,
1.88509, -0.4270319, 2.975033, 1, 1, 1, 1, 1,
1.890962, -1.142013, 3.92331, 1, 1, 1, 1, 1,
1.892233, 1.196143, 1.727093, 1, 1, 1, 1, 1,
1.899197, -1.124996, 0.0009819658, 1, 1, 1, 1, 1,
1.908465, -0.59544, 2.038012, 1, 1, 1, 1, 1,
1.922845, 0.7047192, 0.5507965, 0, 0, 1, 1, 1,
1.929938, -0.1041309, 3.940044, 1, 0, 0, 1, 1,
1.95605, -0.8757286, 2.07504, 1, 0, 0, 1, 1,
1.988, -1.723687, 3.25324, 1, 0, 0, 1, 1,
1.996326, 2.573504, 3.010983, 1, 0, 0, 1, 1,
2.015051, -1.464979, 0.6162438, 1, 0, 0, 1, 1,
2.017382, -0.1896302, 1.428309, 0, 0, 0, 1, 1,
2.061279, -1.920178, 1.9311, 0, 0, 0, 1, 1,
2.068197, -0.12409, 3.400239, 0, 0, 0, 1, 1,
2.087448, 0.2403215, 1.943572, 0, 0, 0, 1, 1,
2.177403, -1.595367, 2.691926, 0, 0, 0, 1, 1,
2.20696, 0.4099714, 1.158679, 0, 0, 0, 1, 1,
2.257232, 0.4065411, 1.608181, 0, 0, 0, 1, 1,
2.273803, 0.2626176, 1.393832, 1, 1, 1, 1, 1,
2.496651, 0.3333107, 1.803979, 1, 1, 1, 1, 1,
2.514944, -0.1768583, 1.968007, 1, 1, 1, 1, 1,
2.599729, -2.77096, 1.041307, 1, 1, 1, 1, 1,
2.947696, 1.029701, 0.5851087, 1, 1, 1, 1, 1,
2.961455, -1.367071, 1.271424, 1, 1, 1, 1, 1,
3.454302, -0.1299816, 1.434144, 1, 1, 1, 1, 1
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
var radius = 9.415374;
var distance = 33.0711;
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
mvMatrix.translate( -0.2378043, 0.2905583, -0.2623892 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.0711);
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
