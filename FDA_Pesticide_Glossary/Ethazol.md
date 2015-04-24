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
-3.050239, -1.355003, -2.653696, 1, 0, 0, 1,
-2.847963, 1.925971, -0.4811609, 1, 0.007843138, 0, 1,
-2.749374, -0.3342212, -1.248701, 1, 0.01176471, 0, 1,
-2.681215, -0.886366, -2.9649, 1, 0.01960784, 0, 1,
-2.551461, 0.5585173, -0.1354531, 1, 0.02352941, 0, 1,
-2.509921, -0.0621058, -0.7023363, 1, 0.03137255, 0, 1,
-2.481819, 0.451308, -1.976965, 1, 0.03529412, 0, 1,
-2.396247, -0.5351343, -3.181215, 1, 0.04313726, 0, 1,
-2.286782, -0.8050649, -2.90558, 1, 0.04705882, 0, 1,
-2.258401, 0.1839046, -3.324387, 1, 0.05490196, 0, 1,
-2.248637, -0.6117452, -1.787212, 1, 0.05882353, 0, 1,
-2.220026, -0.3096494, -2.626496, 1, 0.06666667, 0, 1,
-2.217755, 0.5650498, -3.001607, 1, 0.07058824, 0, 1,
-2.18907, 0.2183473, -0.6274998, 1, 0.07843138, 0, 1,
-2.163382, -0.03841862, -0.8744352, 1, 0.08235294, 0, 1,
-2.133224, 1.215037, -1.133279, 1, 0.09019608, 0, 1,
-2.115792, -0.1960063, -2.003049, 1, 0.09411765, 0, 1,
-2.09365, 0.4838624, -0.1132663, 1, 0.1019608, 0, 1,
-2.079839, -2.654194, -2.649272, 1, 0.1098039, 0, 1,
-2.041646, 0.1182841, -3.151341, 1, 0.1137255, 0, 1,
-2.012989, -0.2097548, -2.392733, 1, 0.1215686, 0, 1,
-2.007425, -0.3956421, -2.67515, 1, 0.1254902, 0, 1,
-1.975234, -0.8417417, -1.270606, 1, 0.1333333, 0, 1,
-1.951501, -2.161374, -1.478831, 1, 0.1372549, 0, 1,
-1.931416, -1.189445, -0.6329138, 1, 0.145098, 0, 1,
-1.902809, -0.8948803, -0.6541399, 1, 0.1490196, 0, 1,
-1.897245, 0.129465, 1.773163, 1, 0.1568628, 0, 1,
-1.896524, -0.9364119, -2.228067, 1, 0.1607843, 0, 1,
-1.890416, 1.979857, 2.094898, 1, 0.1686275, 0, 1,
-1.890004, 0.2255889, -0.1394824, 1, 0.172549, 0, 1,
-1.852112, -1.441563, -2.246863, 1, 0.1803922, 0, 1,
-1.821115, 0.9424989, -2.384791, 1, 0.1843137, 0, 1,
-1.809692, 1.182082, -0.7678549, 1, 0.1921569, 0, 1,
-1.800358, -0.3544067, -3.778724, 1, 0.1960784, 0, 1,
-1.794465, -0.4846168, -1.796565, 1, 0.2039216, 0, 1,
-1.791058, -0.484208, -3.192857, 1, 0.2117647, 0, 1,
-1.765258, -1.064698, -1.940906, 1, 0.2156863, 0, 1,
-1.761419, 1.468937, 0.08559511, 1, 0.2235294, 0, 1,
-1.740037, -0.709598, -2.726879, 1, 0.227451, 0, 1,
-1.730904, -0.4561065, -1.214353, 1, 0.2352941, 0, 1,
-1.723089, -1.235389, -2.896291, 1, 0.2392157, 0, 1,
-1.721978, -0.6263709, -1.520761, 1, 0.2470588, 0, 1,
-1.717539, -0.7197222, -2.310879, 1, 0.2509804, 0, 1,
-1.684239, 1.111064, -1.331991, 1, 0.2588235, 0, 1,
-1.679301, 0.649069, -1.954457, 1, 0.2627451, 0, 1,
-1.676059, 3.446448, -1.356324, 1, 0.2705882, 0, 1,
-1.64947, -0.8638949, -3.193763, 1, 0.2745098, 0, 1,
-1.636901, -1.091797, -1.642911, 1, 0.282353, 0, 1,
-1.632095, 1.94896, 0.5830079, 1, 0.2862745, 0, 1,
-1.631435, 2.076598, -1.60223, 1, 0.2941177, 0, 1,
-1.625342, -1.774071, -3.216618, 1, 0.3019608, 0, 1,
-1.623071, -0.5648624, -2.954932, 1, 0.3058824, 0, 1,
-1.61824, -0.2011828, -2.465621, 1, 0.3137255, 0, 1,
-1.616058, 0.3788757, 1.203964, 1, 0.3176471, 0, 1,
-1.612618, -0.5960938, -0.4746549, 1, 0.3254902, 0, 1,
-1.608027, 0.2829384, -1.612968, 1, 0.3294118, 0, 1,
-1.604919, 0.6098611, -1.787722, 1, 0.3372549, 0, 1,
-1.581581, 0.280303, -0.8896788, 1, 0.3411765, 0, 1,
-1.581078, 1.210262, -1.249974, 1, 0.3490196, 0, 1,
-1.575673, -0.1175171, -4.099194, 1, 0.3529412, 0, 1,
-1.570476, 0.8318971, 0.2163696, 1, 0.3607843, 0, 1,
-1.568653, -1.001211, -3.967821, 1, 0.3647059, 0, 1,
-1.556531, -1.570236, -2.551132, 1, 0.372549, 0, 1,
-1.548345, -0.5895122, -2.089432, 1, 0.3764706, 0, 1,
-1.547606, -0.518065, -2.315244, 1, 0.3843137, 0, 1,
-1.545186, 2.446162, 0.4759169, 1, 0.3882353, 0, 1,
-1.535594, 0.7945289, -1.034347, 1, 0.3960784, 0, 1,
-1.516001, 1.140777, -1.393077, 1, 0.4039216, 0, 1,
-1.503837, -1.810723, -2.196726, 1, 0.4078431, 0, 1,
-1.49925, 0.03467768, -0.9258304, 1, 0.4156863, 0, 1,
-1.487216, -0.5406554, -3.420502, 1, 0.4196078, 0, 1,
-1.480594, 0.9010879, -0.3709165, 1, 0.427451, 0, 1,
-1.475711, -0.1023947, -0.846019, 1, 0.4313726, 0, 1,
-1.475148, 0.8924541, -0.6761463, 1, 0.4392157, 0, 1,
-1.438518, 0.1869921, -1.903445, 1, 0.4431373, 0, 1,
-1.414051, -0.9797429, -3.716511, 1, 0.4509804, 0, 1,
-1.411459, 0.2743288, -3.093793, 1, 0.454902, 0, 1,
-1.407552, -0.5294687, -3.258811, 1, 0.4627451, 0, 1,
-1.400919, -1.223827, -0.585739, 1, 0.4666667, 0, 1,
-1.397648, 0.5917625, -2.571273, 1, 0.4745098, 0, 1,
-1.395072, 0.5350435, -1.745459, 1, 0.4784314, 0, 1,
-1.386666, 1.919809, -1.351098, 1, 0.4862745, 0, 1,
-1.381877, -0.01097613, -2.115222, 1, 0.4901961, 0, 1,
-1.377364, 0.03573847, -0.3132725, 1, 0.4980392, 0, 1,
-1.373783, 0.05133669, -1.055009, 1, 0.5058824, 0, 1,
-1.370809, 0.3752572, -1.588976, 1, 0.509804, 0, 1,
-1.367076, -0.04999634, -1.232003, 1, 0.5176471, 0, 1,
-1.366427, -0.6276888, -1.749858, 1, 0.5215687, 0, 1,
-1.358181, -0.01915829, -2.994252, 1, 0.5294118, 0, 1,
-1.350547, -1.089395, -2.695895, 1, 0.5333334, 0, 1,
-1.347845, 0.8250451, -1.853519, 1, 0.5411765, 0, 1,
-1.347157, 0.5667463, -0.4327133, 1, 0.5450981, 0, 1,
-1.341979, -0.9164063, -1.729494, 1, 0.5529412, 0, 1,
-1.334497, 0.1792507, -2.479051, 1, 0.5568628, 0, 1,
-1.33441, 0.5885743, -2.156822, 1, 0.5647059, 0, 1,
-1.331923, -0.8347855, -2.052657, 1, 0.5686275, 0, 1,
-1.330466, 0.6447622, -1.653142, 1, 0.5764706, 0, 1,
-1.323655, 0.5309198, -2.822144, 1, 0.5803922, 0, 1,
-1.317433, -0.4956834, -2.179196, 1, 0.5882353, 0, 1,
-1.313006, 0.7569004, -2.312803, 1, 0.5921569, 0, 1,
-1.311917, 1.451124, -0.3450752, 1, 0.6, 0, 1,
-1.310986, -0.6129421, -4.201105, 1, 0.6078432, 0, 1,
-1.302984, 0.4921237, -3.027067, 1, 0.6117647, 0, 1,
-1.30252, 0.2076417, -1.531044, 1, 0.6196079, 0, 1,
-1.302017, -0.0752656, -3.698612, 1, 0.6235294, 0, 1,
-1.301897, 0.3508486, -1.899268, 1, 0.6313726, 0, 1,
-1.280888, 0.7818251, 0.1441664, 1, 0.6352941, 0, 1,
-1.275494, 0.1983498, -1.273429, 1, 0.6431373, 0, 1,
-1.27429, -1.047795, -3.876275, 1, 0.6470588, 0, 1,
-1.270817, 0.07392826, 0.5324433, 1, 0.654902, 0, 1,
-1.267857, 0.3764975, -1.139758, 1, 0.6588235, 0, 1,
-1.265988, -0.7235364, -2.601062, 1, 0.6666667, 0, 1,
-1.261937, -0.142715, -0.7879004, 1, 0.6705883, 0, 1,
-1.260646, -1.586142, -2.601807, 1, 0.6784314, 0, 1,
-1.256096, -1.587238, -2.688433, 1, 0.682353, 0, 1,
-1.250196, 1.53439, -0.2119599, 1, 0.6901961, 0, 1,
-1.246893, 0.8970229, -1.082641, 1, 0.6941177, 0, 1,
-1.240149, -0.3743563, -3.968727, 1, 0.7019608, 0, 1,
-1.234912, 0.07433403, -3.04302, 1, 0.7098039, 0, 1,
-1.231437, -0.5460572, -2.598146, 1, 0.7137255, 0, 1,
-1.210951, -0.09058607, -2.193957, 1, 0.7215686, 0, 1,
-1.203256, -0.7269787, -0.5795287, 1, 0.7254902, 0, 1,
-1.197253, -0.5365344, -2.289333, 1, 0.7333333, 0, 1,
-1.182445, 0.08734695, -1.379052, 1, 0.7372549, 0, 1,
-1.17968, -0.8072776, -3.119833, 1, 0.7450981, 0, 1,
-1.171159, -0.3728827, -2.346551, 1, 0.7490196, 0, 1,
-1.169879, -2.728546, -1.917965, 1, 0.7568628, 0, 1,
-1.159372, -0.1314374, -2.257982, 1, 0.7607843, 0, 1,
-1.152916, -1.575628, -2.795053, 1, 0.7686275, 0, 1,
-1.152302, -1.342883, -1.80337, 1, 0.772549, 0, 1,
-1.144896, -1.054403, -2.186148, 1, 0.7803922, 0, 1,
-1.142094, -0.8792915, -0.7681427, 1, 0.7843137, 0, 1,
-1.13988, -0.2592335, -1.976521, 1, 0.7921569, 0, 1,
-1.136509, 0.5089747, -0.29651, 1, 0.7960784, 0, 1,
-1.13295, -0.1458683, -2.447789, 1, 0.8039216, 0, 1,
-1.128042, 0.3110274, -1.047047, 1, 0.8117647, 0, 1,
-1.121667, -0.8705785, -2.292783, 1, 0.8156863, 0, 1,
-1.118607, 1.477233, -1.417225, 1, 0.8235294, 0, 1,
-1.113666, 0.1694348, -2.68213, 1, 0.827451, 0, 1,
-1.105074, 0.0584673, -1.494138, 1, 0.8352941, 0, 1,
-1.104494, -2.81373, -1.359139, 1, 0.8392157, 0, 1,
-1.096997, 0.03902603, -1.386585, 1, 0.8470588, 0, 1,
-1.092062, 0.2741186, -0.9543298, 1, 0.8509804, 0, 1,
-1.090836, 0.6697583, -1.09226, 1, 0.8588235, 0, 1,
-1.07849, 1.038459, -0.820982, 1, 0.8627451, 0, 1,
-1.063154, -1.198977, -2.191901, 1, 0.8705882, 0, 1,
-1.061764, -2.371844, -3.581907, 1, 0.8745098, 0, 1,
-1.049094, 1.061995, -1.155389, 1, 0.8823529, 0, 1,
-1.047863, -0.2469323, 0.2234783, 1, 0.8862745, 0, 1,
-1.042704, -1.758061, -1.32334, 1, 0.8941177, 0, 1,
-1.038937, 1.165297, -1.086446, 1, 0.8980392, 0, 1,
-1.034948, -0.5714461, -0.8813881, 1, 0.9058824, 0, 1,
-1.029475, 1.137397, -0.9450854, 1, 0.9137255, 0, 1,
-1.02161, 1.874033, 0.5760024, 1, 0.9176471, 0, 1,
-1.021266, 0.03550273, -1.850262, 1, 0.9254902, 0, 1,
-1.018877, -1.032246, -2.126044, 1, 0.9294118, 0, 1,
-1.01668, -0.7919793, -1.687113, 1, 0.9372549, 0, 1,
-1.012127, 0.07116587, -1.706816, 1, 0.9411765, 0, 1,
-1.010459, 0.2722092, -1.101643, 1, 0.9490196, 0, 1,
-0.9984777, -1.568898, -2.471381, 1, 0.9529412, 0, 1,
-0.9970937, 0.2378571, -2.429028, 1, 0.9607843, 0, 1,
-0.9967901, 0.5994805, -1.377292, 1, 0.9647059, 0, 1,
-0.9948898, 0.8652048, 0.771208, 1, 0.972549, 0, 1,
-0.9929433, 0.9440272, -2.530353, 1, 0.9764706, 0, 1,
-0.9898743, 1.328382, -1.497727, 1, 0.9843137, 0, 1,
-0.986912, 1.626826, 0.07344216, 1, 0.9882353, 0, 1,
-0.9836974, 1.380565, -0.6549391, 1, 0.9960784, 0, 1,
-0.9817467, -2.316333, -3.31453, 0.9960784, 1, 0, 1,
-0.9770131, 0.8135724, -1.49724, 0.9921569, 1, 0, 1,
-0.9755182, 0.8286596, 0.9190974, 0.9843137, 1, 0, 1,
-0.9731903, -1.427713, -3.071905, 0.9803922, 1, 0, 1,
-0.9728531, -0.6355949, -2.525672, 0.972549, 1, 0, 1,
-0.9692756, -1.165779, -3.578212, 0.9686275, 1, 0, 1,
-0.9675938, 0.5091397, -2.147493, 0.9607843, 1, 0, 1,
-0.9603866, -0.2449128, -1.717788, 0.9568627, 1, 0, 1,
-0.9543443, 0.9462859, -1.010719, 0.9490196, 1, 0, 1,
-0.9431114, -0.3947167, -2.865066, 0.945098, 1, 0, 1,
-0.9417146, 1.07618, -1.959539, 0.9372549, 1, 0, 1,
-0.9404686, -1.083767, -2.896392, 0.9333333, 1, 0, 1,
-0.9329584, 0.437025, -1.852688, 0.9254902, 1, 0, 1,
-0.9255487, -1.956399, -3.763386, 0.9215686, 1, 0, 1,
-0.9203634, 0.711589, -0.8410111, 0.9137255, 1, 0, 1,
-0.9129733, -0.2397514, -2.423779, 0.9098039, 1, 0, 1,
-0.9119484, 0.0416403, -2.423187, 0.9019608, 1, 0, 1,
-0.9115012, 0.799883, -0.3736622, 0.8941177, 1, 0, 1,
-0.9077479, -0.5088598, -2.21999, 0.8901961, 1, 0, 1,
-0.906451, -0.3944201, -2.064561, 0.8823529, 1, 0, 1,
-0.8997691, -1.216633, -2.7806, 0.8784314, 1, 0, 1,
-0.8904564, -0.3352251, -1.740437, 0.8705882, 1, 0, 1,
-0.8816248, -2.038447, -3.249635, 0.8666667, 1, 0, 1,
-0.8701103, -2.220949, -1.707719, 0.8588235, 1, 0, 1,
-0.8656556, -1.112661, -3.239773, 0.854902, 1, 0, 1,
-0.865379, -0.09158038, -2.168907, 0.8470588, 1, 0, 1,
-0.8619768, 1.408125, 0.7383397, 0.8431373, 1, 0, 1,
-0.8581491, -0.06426676, -1.978162, 0.8352941, 1, 0, 1,
-0.8548046, 1.833947, -0.3909613, 0.8313726, 1, 0, 1,
-0.8534003, 1.962029, -0.5037687, 0.8235294, 1, 0, 1,
-0.8532618, 0.9732237, 0.06920298, 0.8196079, 1, 0, 1,
-0.8494273, -1.510056, -3.214376, 0.8117647, 1, 0, 1,
-0.8457565, 1.406768, -2.159252, 0.8078431, 1, 0, 1,
-0.8215443, -1.034475, -2.874036, 0.8, 1, 0, 1,
-0.8174472, 1.816356, -1.40944, 0.7921569, 1, 0, 1,
-0.8148846, -0.6931912, -4.278061, 0.7882353, 1, 0, 1,
-0.8060439, 0.1713885, -2.423971, 0.7803922, 1, 0, 1,
-0.8010606, -0.666487, -0.8115333, 0.7764706, 1, 0, 1,
-0.8009377, -0.1691778, -0.9958067, 0.7686275, 1, 0, 1,
-0.7990764, 1.543946, -2.594539, 0.7647059, 1, 0, 1,
-0.7990054, 0.03044076, -0.8437043, 0.7568628, 1, 0, 1,
-0.7953988, 0.5368156, -0.6854576, 0.7529412, 1, 0, 1,
-0.7945837, -0.2593406, -1.659377, 0.7450981, 1, 0, 1,
-0.7893271, -0.8456782, -1.826423, 0.7411765, 1, 0, 1,
-0.7844505, -0.4712697, -1.693926, 0.7333333, 1, 0, 1,
-0.7830521, 0.4531882, -0.409484, 0.7294118, 1, 0, 1,
-0.7820403, -0.6956342, -1.678726, 0.7215686, 1, 0, 1,
-0.7812137, -1.244991, -2.92603, 0.7176471, 1, 0, 1,
-0.7784501, 1.923657, 0.5613072, 0.7098039, 1, 0, 1,
-0.7779732, -0.2851976, -2.51401, 0.7058824, 1, 0, 1,
-0.7747907, 0.3213053, -0.3878672, 0.6980392, 1, 0, 1,
-0.773112, -0.6368923, -3.670701, 0.6901961, 1, 0, 1,
-0.7691084, 1.12931, 0.06514969, 0.6862745, 1, 0, 1,
-0.7685266, -0.6148213, -0.4562023, 0.6784314, 1, 0, 1,
-0.7621596, -1.710594, -3.771941, 0.6745098, 1, 0, 1,
-0.7611051, -1.843505, -0.8746843, 0.6666667, 1, 0, 1,
-0.7598091, 1.001545, 0.3115645, 0.6627451, 1, 0, 1,
-0.7594084, 0.00850013, -1.967875, 0.654902, 1, 0, 1,
-0.7561073, -0.05576739, -1.336375, 0.6509804, 1, 0, 1,
-0.7559522, 1.380895, 1.226699, 0.6431373, 1, 0, 1,
-0.746559, -0.4556904, -1.584742, 0.6392157, 1, 0, 1,
-0.7432141, -0.3093942, -2.618642, 0.6313726, 1, 0, 1,
-0.7396775, -1.133254, 0.1383296, 0.627451, 1, 0, 1,
-0.7372242, 0.696723, 1.259143, 0.6196079, 1, 0, 1,
-0.736216, 0.4814704, -0.8912696, 0.6156863, 1, 0, 1,
-0.7263909, -0.9191101, -3.600982, 0.6078432, 1, 0, 1,
-0.7241007, -0.51396, -2.579363, 0.6039216, 1, 0, 1,
-0.7162156, 2.170375, -2.23399, 0.5960785, 1, 0, 1,
-0.7139251, 0.06847643, -1.01679, 0.5882353, 1, 0, 1,
-0.7106176, 1.525004, 0.7338066, 0.5843138, 1, 0, 1,
-0.7076871, 0.2543625, 0.04096425, 0.5764706, 1, 0, 1,
-0.7073149, 0.1705612, -0.2623655, 0.572549, 1, 0, 1,
-0.704297, 1.400327, 0.3613808, 0.5647059, 1, 0, 1,
-0.6925588, 1.321465, 1.391295, 0.5607843, 1, 0, 1,
-0.6894863, -1.454302, -1.977316, 0.5529412, 1, 0, 1,
-0.6863492, 0.3672751, -1.156138, 0.5490196, 1, 0, 1,
-0.6817428, 1.342148, -1.068631, 0.5411765, 1, 0, 1,
-0.6812144, -1.309857, -3.863606, 0.5372549, 1, 0, 1,
-0.6747141, -1.545777, -4.054153, 0.5294118, 1, 0, 1,
-0.6735535, 0.4038625, -0.123272, 0.5254902, 1, 0, 1,
-0.6655889, -0.6730696, -1.766991, 0.5176471, 1, 0, 1,
-0.6641901, 2.162384, 1.123861, 0.5137255, 1, 0, 1,
-0.6575078, 0.8573879, 1.51451, 0.5058824, 1, 0, 1,
-0.656409, -0.6475117, -3.193519, 0.5019608, 1, 0, 1,
-0.6462509, -0.3893382, -3.315252, 0.4941176, 1, 0, 1,
-0.6454463, 1.738084, -0.6311302, 0.4862745, 1, 0, 1,
-0.6411866, 0.3367451, -1.649981, 0.4823529, 1, 0, 1,
-0.6399161, -0.7969192, -1.799808, 0.4745098, 1, 0, 1,
-0.6354038, -0.8666917, -4.741715, 0.4705882, 1, 0, 1,
-0.6344318, 2.055494, 0.5305482, 0.4627451, 1, 0, 1,
-0.6337314, 1.106218, -0.7461239, 0.4588235, 1, 0, 1,
-0.6295541, 0.5070438, -1.312579, 0.4509804, 1, 0, 1,
-0.6271277, -1.72932, -2.04976, 0.4470588, 1, 0, 1,
-0.6227112, -0.5535627, -2.140441, 0.4392157, 1, 0, 1,
-0.6220888, -2.221416, -2.261848, 0.4352941, 1, 0, 1,
-0.6220648, 0.4874244, -0.8762957, 0.427451, 1, 0, 1,
-0.6209207, -0.1147833, -4.543936, 0.4235294, 1, 0, 1,
-0.619479, 0.2659295, -2.037646, 0.4156863, 1, 0, 1,
-0.6182197, -0.7038334, -2.401398, 0.4117647, 1, 0, 1,
-0.6157095, 1.965712, -1.367224, 0.4039216, 1, 0, 1,
-0.6154445, 1.045193, -0.5404813, 0.3960784, 1, 0, 1,
-0.6126963, -0.2103732, -4.478291, 0.3921569, 1, 0, 1,
-0.6083562, 0.1902662, -1.150272, 0.3843137, 1, 0, 1,
-0.6076507, -1.734158, -3.666522, 0.3803922, 1, 0, 1,
-0.6075692, 1.00589, 0.7770782, 0.372549, 1, 0, 1,
-0.6061863, -0.3446811, -1.346877, 0.3686275, 1, 0, 1,
-0.6053047, -0.3158264, -1.467471, 0.3607843, 1, 0, 1,
-0.6036173, -1.437796, -3.026167, 0.3568628, 1, 0, 1,
-0.600022, 0.6395935, -0.3752355, 0.3490196, 1, 0, 1,
-0.59751, 0.3986146, -1.94408, 0.345098, 1, 0, 1,
-0.5955665, -0.08291322, -1.710727, 0.3372549, 1, 0, 1,
-0.5941114, 0.6472355, -0.5733118, 0.3333333, 1, 0, 1,
-0.5923418, 0.7290006, 0.5550665, 0.3254902, 1, 0, 1,
-0.591067, -0.8760081, -2.768964, 0.3215686, 1, 0, 1,
-0.5899921, -0.2418297, -2.661478, 0.3137255, 1, 0, 1,
-0.5873176, -1.421888, -3.631539, 0.3098039, 1, 0, 1,
-0.5849193, 0.7661093, -0.2754113, 0.3019608, 1, 0, 1,
-0.5823665, 0.588571, -0.1481132, 0.2941177, 1, 0, 1,
-0.5820895, -0.7871715, -2.293853, 0.2901961, 1, 0, 1,
-0.5801082, 0.74939, -1.666771, 0.282353, 1, 0, 1,
-0.5775855, -1.292061, -2.463736, 0.2784314, 1, 0, 1,
-0.5743955, -0.2647699, -1.987034, 0.2705882, 1, 0, 1,
-0.5708233, 1.003602, -0.09534682, 0.2666667, 1, 0, 1,
-0.567635, 0.2938236, -1.214981, 0.2588235, 1, 0, 1,
-0.5595416, -1.204699, -1.461884, 0.254902, 1, 0, 1,
-0.5577786, -0.1558223, -4.499476, 0.2470588, 1, 0, 1,
-0.5559149, -0.01536361, -0.8185624, 0.2431373, 1, 0, 1,
-0.5505999, 2.301014, -0.8351415, 0.2352941, 1, 0, 1,
-0.5442178, 0.7800792, -0.857943, 0.2313726, 1, 0, 1,
-0.5425977, -1.581645, -4.618232, 0.2235294, 1, 0, 1,
-0.5413643, 0.2800779, -2.04399, 0.2196078, 1, 0, 1,
-0.5406494, 1.121867, -1.148728, 0.2117647, 1, 0, 1,
-0.5374443, -0.5909091, -3.138952, 0.2078431, 1, 0, 1,
-0.535395, 1.10297, 0.1998329, 0.2, 1, 0, 1,
-0.5338915, 1.194908, 0.3199098, 0.1921569, 1, 0, 1,
-0.5332668, -0.5954401, -2.654935, 0.1882353, 1, 0, 1,
-0.531484, 1.0713, 0.5297619, 0.1803922, 1, 0, 1,
-0.5312063, 0.5472147, -1.406822, 0.1764706, 1, 0, 1,
-0.5296935, -0.4459194, -4.331731, 0.1686275, 1, 0, 1,
-0.5266941, -1.437542, -2.150199, 0.1647059, 1, 0, 1,
-0.5251223, -0.4829746, -2.953939, 0.1568628, 1, 0, 1,
-0.5224825, 1.448315, -0.359498, 0.1529412, 1, 0, 1,
-0.5210254, -0.6827611, -2.49144, 0.145098, 1, 0, 1,
-0.5179186, 0.5675077, -0.4117881, 0.1411765, 1, 0, 1,
-0.5096961, -1.688544, -3.961231, 0.1333333, 1, 0, 1,
-0.5077574, -0.2750063, -1.567554, 0.1294118, 1, 0, 1,
-0.5036157, 1.106816, -1.632876, 0.1215686, 1, 0, 1,
-0.4978119, 0.3613295, -4.241627, 0.1176471, 1, 0, 1,
-0.4958543, 0.01016649, -1.843493, 0.1098039, 1, 0, 1,
-0.4894595, -1.319753, -2.288733, 0.1058824, 1, 0, 1,
-0.4885139, 1.539171, -0.4648687, 0.09803922, 1, 0, 1,
-0.4876027, 0.4055254, -1.259676, 0.09019608, 1, 0, 1,
-0.486941, 2.182447, 0.7271506, 0.08627451, 1, 0, 1,
-0.485599, 0.4593728, 1.208921, 0.07843138, 1, 0, 1,
-0.4820385, -0.2951568, -1.941044, 0.07450981, 1, 0, 1,
-0.4807613, 0.7570028, -0.1114095, 0.06666667, 1, 0, 1,
-0.4789823, 2.356085, -0.09906988, 0.0627451, 1, 0, 1,
-0.4785735, -0.9488457, -3.740337, 0.05490196, 1, 0, 1,
-0.4779312, 0.1703043, -1.839317, 0.05098039, 1, 0, 1,
-0.4777161, -1.2027, -3.062019, 0.04313726, 1, 0, 1,
-0.4764372, 1.55645, 1.75009, 0.03921569, 1, 0, 1,
-0.4761088, 0.3913938, -0.4178846, 0.03137255, 1, 0, 1,
-0.4723162, -0.0722193, -3.705792, 0.02745098, 1, 0, 1,
-0.4707821, -2.295022, -2.998266, 0.01960784, 1, 0, 1,
-0.4707741, -0.7065856, -2.06039, 0.01568628, 1, 0, 1,
-0.4706272, 0.2253155, -0.3708833, 0.007843138, 1, 0, 1,
-0.4665107, -0.9273079, -2.021211, 0.003921569, 1, 0, 1,
-0.4631233, 1.326429, 1.003814, 0, 1, 0.003921569, 1,
-0.4578995, 0.4267164, -2.897499, 0, 1, 0.01176471, 1,
-0.455476, -0.5565258, -2.47216, 0, 1, 0.01568628, 1,
-0.4516535, 0.2342586, -0.4395049, 0, 1, 0.02352941, 1,
-0.449419, -1.920583, -1.85447, 0, 1, 0.02745098, 1,
-0.4383896, -0.8597564, -4.843439, 0, 1, 0.03529412, 1,
-0.4369287, -0.2819475, -2.703078, 0, 1, 0.03921569, 1,
-0.4185788, -0.02506969, -2.819078, 0, 1, 0.04705882, 1,
-0.4152825, 0.4915099, 0.4428973, 0, 1, 0.05098039, 1,
-0.4128677, 1.12271, -0.08970276, 0, 1, 0.05882353, 1,
-0.4054297, -0.8178183, -3.156398, 0, 1, 0.0627451, 1,
-0.4023814, -0.7886698, -2.195187, 0, 1, 0.07058824, 1,
-0.4017725, 0.6497158, -0.266584, 0, 1, 0.07450981, 1,
-0.4014336, 0.2509255, -0.1644821, 0, 1, 0.08235294, 1,
-0.3989384, -1.125044, -0.2750846, 0, 1, 0.08627451, 1,
-0.3970359, 0.06366512, -0.8341078, 0, 1, 0.09411765, 1,
-0.393921, -0.5260302, -3.186471, 0, 1, 0.1019608, 1,
-0.3908359, 1.287868, -1.59165, 0, 1, 0.1058824, 1,
-0.3880787, 0.2064777, -1.181656, 0, 1, 0.1137255, 1,
-0.3838517, -1.611655, -4.19078, 0, 1, 0.1176471, 1,
-0.3826579, 0.9061731, -0.9866324, 0, 1, 0.1254902, 1,
-0.3824934, -1.26126, -2.770133, 0, 1, 0.1294118, 1,
-0.3817407, -0.2397788, -2.592888, 0, 1, 0.1372549, 1,
-0.3815681, 0.8372647, -0.6949055, 0, 1, 0.1411765, 1,
-0.3795898, 0.301862, -0.1974874, 0, 1, 0.1490196, 1,
-0.3773874, 1.356508, -2.270853, 0, 1, 0.1529412, 1,
-0.3734584, 0.3301182, -0.3610553, 0, 1, 0.1607843, 1,
-0.3703615, -0.4370663, -1.969569, 0, 1, 0.1647059, 1,
-0.3689882, -0.634151, -1.70058, 0, 1, 0.172549, 1,
-0.3689308, 0.4150765, -1.601947, 0, 1, 0.1764706, 1,
-0.3668672, -0.1303405, -2.731467, 0, 1, 0.1843137, 1,
-0.3643241, -0.6639571, -2.47472, 0, 1, 0.1882353, 1,
-0.3628457, 0.5142198, -1.321462, 0, 1, 0.1960784, 1,
-0.3627118, -0.2541621, -1.748589, 0, 1, 0.2039216, 1,
-0.3619778, 0.9656483, 1.234354, 0, 1, 0.2078431, 1,
-0.3580321, 0.7263948, -0.948334, 0, 1, 0.2156863, 1,
-0.3537444, -0.3783953, -2.080768, 0, 1, 0.2196078, 1,
-0.352043, -0.07358006, -0.6561283, 0, 1, 0.227451, 1,
-0.3513332, -0.652078, -0.7800484, 0, 1, 0.2313726, 1,
-0.3474995, -0.118669, -0.4844952, 0, 1, 0.2392157, 1,
-0.3469327, -0.1904927, -1.732868, 0, 1, 0.2431373, 1,
-0.3454077, -1.026787, -3.58742, 0, 1, 0.2509804, 1,
-0.3370358, 0.3396675, 0.6350118, 0, 1, 0.254902, 1,
-0.3347209, -0.08143528, -3.864928, 0, 1, 0.2627451, 1,
-0.3339886, -0.2310117, -2.682995, 0, 1, 0.2666667, 1,
-0.3294708, 0.3054368, -0.02560125, 0, 1, 0.2745098, 1,
-0.3262219, -0.2583425, -3.294259, 0, 1, 0.2784314, 1,
-0.3252536, -0.8007825, -2.394718, 0, 1, 0.2862745, 1,
-0.323659, 0.667647, -0.5715945, 0, 1, 0.2901961, 1,
-0.3233637, -0.06351127, -1.943464, 0, 1, 0.2980392, 1,
-0.3218382, 0.8798259, -0.3495873, 0, 1, 0.3058824, 1,
-0.3181747, 1.437311, 1.330261, 0, 1, 0.3098039, 1,
-0.3178158, 0.5815279, -0.7060528, 0, 1, 0.3176471, 1,
-0.315531, -1.812679, -2.381713, 0, 1, 0.3215686, 1,
-0.3137132, 0.7364629, -2.162746, 0, 1, 0.3294118, 1,
-0.3135366, 0.4942167, 0.7212231, 0, 1, 0.3333333, 1,
-0.3116767, 0.03652019, -2.85336, 0, 1, 0.3411765, 1,
-0.3088388, 0.8368291, 0.2595479, 0, 1, 0.345098, 1,
-0.3076288, -0.4670467, -3.157567, 0, 1, 0.3529412, 1,
-0.3047962, 0.2218776, -2.260517, 0, 1, 0.3568628, 1,
-0.3045667, -1.408148, -0.3079119, 0, 1, 0.3647059, 1,
-0.300163, -1.064313, -2.452153, 0, 1, 0.3686275, 1,
-0.2986388, -0.1823485, -0.3533042, 0, 1, 0.3764706, 1,
-0.2979494, 0.5076065, -0.2214183, 0, 1, 0.3803922, 1,
-0.2957597, -1.30678, -2.132655, 0, 1, 0.3882353, 1,
-0.2954936, -1.130524, -2.538904, 0, 1, 0.3921569, 1,
-0.2950911, 0.1078753, 0.03180827, 0, 1, 0.4, 1,
-0.2922242, 0.6695996, -0.01261357, 0, 1, 0.4078431, 1,
-0.289003, 1.354536, -1.411181, 0, 1, 0.4117647, 1,
-0.2852457, -0.180005, 0.2147757, 0, 1, 0.4196078, 1,
-0.2849081, 0.697929, -0.9863683, 0, 1, 0.4235294, 1,
-0.2805922, 0.2972199, -0.5314608, 0, 1, 0.4313726, 1,
-0.2786538, -0.06925071, -3.828932, 0, 1, 0.4352941, 1,
-0.2766579, 0.3129514, 0.2649385, 0, 1, 0.4431373, 1,
-0.2735032, -0.3710919, -1.888038, 0, 1, 0.4470588, 1,
-0.272601, -2.366055, -3.663821, 0, 1, 0.454902, 1,
-0.2691648, -2.187234, -4.12141, 0, 1, 0.4588235, 1,
-0.2660792, -0.4477371, -3.360948, 0, 1, 0.4666667, 1,
-0.2635686, -0.6405107, -1.979846, 0, 1, 0.4705882, 1,
-0.2633415, 1.198519, -0.2168732, 0, 1, 0.4784314, 1,
-0.2629661, 1.149344, -0.1725971, 0, 1, 0.4823529, 1,
-0.2597139, 2.181781, 0.09953748, 0, 1, 0.4901961, 1,
-0.2568437, -1.366971, -3.476777, 0, 1, 0.4941176, 1,
-0.2564915, 1.87208, 0.4266215, 0, 1, 0.5019608, 1,
-0.2538115, -0.3396897, -0.3789658, 0, 1, 0.509804, 1,
-0.2537074, 1.091913, -1.081616, 0, 1, 0.5137255, 1,
-0.2533853, 0.3073424, -1.518456, 0, 1, 0.5215687, 1,
-0.2519881, 0.4253596, 0.6762533, 0, 1, 0.5254902, 1,
-0.2515686, 0.9902763, 0.8306489, 0, 1, 0.5333334, 1,
-0.2497616, 0.1114927, -0.8794978, 0, 1, 0.5372549, 1,
-0.2484518, 0.06192988, 0.4746124, 0, 1, 0.5450981, 1,
-0.2454868, -0.5014594, -2.03547, 0, 1, 0.5490196, 1,
-0.2445051, -0.487493, -3.419986, 0, 1, 0.5568628, 1,
-0.2428486, -0.18419, -2.862821, 0, 1, 0.5607843, 1,
-0.2425306, -0.5094916, -3.160479, 0, 1, 0.5686275, 1,
-0.2422753, -1.291451, -3.229808, 0, 1, 0.572549, 1,
-0.2346918, -0.5870433, -1.586307, 0, 1, 0.5803922, 1,
-0.231843, 0.8415458, -0.3264834, 0, 1, 0.5843138, 1,
-0.2314768, 0.3129336, 0.586071, 0, 1, 0.5921569, 1,
-0.2301927, 0.776633, -0.3677528, 0, 1, 0.5960785, 1,
-0.2294491, 0.8713662, -1.258867, 0, 1, 0.6039216, 1,
-0.2269183, 0.4204721, -0.9244339, 0, 1, 0.6117647, 1,
-0.218324, 0.8413416, -0.03565383, 0, 1, 0.6156863, 1,
-0.2166543, -0.04206096, -1.262074, 0, 1, 0.6235294, 1,
-0.2127024, 0.9417512, -1.42832, 0, 1, 0.627451, 1,
-0.2124012, 1.445755, 0.4819038, 0, 1, 0.6352941, 1,
-0.2103731, 0.2000723, 0.06876796, 0, 1, 0.6392157, 1,
-0.2073401, 0.9135316, 0.5143132, 0, 1, 0.6470588, 1,
-0.2058805, 0.6880286, -1.545719, 0, 1, 0.6509804, 1,
-0.2035031, 1.464806, 0.6219049, 0, 1, 0.6588235, 1,
-0.2009086, 0.8820402, -1.3672, 0, 1, 0.6627451, 1,
-0.1981644, -1.104624, -1.684114, 0, 1, 0.6705883, 1,
-0.1969319, -1.000278, -3.403053, 0, 1, 0.6745098, 1,
-0.1939092, -1.721806, -4.302993, 0, 1, 0.682353, 1,
-0.1910113, 0.8056365, -0.5283933, 0, 1, 0.6862745, 1,
-0.1859919, 0.5973392, -0.178629, 0, 1, 0.6941177, 1,
-0.1854958, -0.9069629, -2.716789, 0, 1, 0.7019608, 1,
-0.1848461, -2.156602, -2.237631, 0, 1, 0.7058824, 1,
-0.1802709, -0.3444499, -0.2249994, 0, 1, 0.7137255, 1,
-0.1799479, 0.1616678, -0.7086138, 0, 1, 0.7176471, 1,
-0.1760716, -0.2227723, -3.215534, 0, 1, 0.7254902, 1,
-0.1670064, 2.050065, -0.1105675, 0, 1, 0.7294118, 1,
-0.1645456, -0.8607519, -3.343226, 0, 1, 0.7372549, 1,
-0.1642508, -0.9160194, -4.585394, 0, 1, 0.7411765, 1,
-0.1623478, -0.1427028, -1.880432, 0, 1, 0.7490196, 1,
-0.1600845, -1.286005, -2.356403, 0, 1, 0.7529412, 1,
-0.1511102, 0.4445076, -0.670742, 0, 1, 0.7607843, 1,
-0.1502137, 0.2999861, -1.412212, 0, 1, 0.7647059, 1,
-0.1440881, -0.4816776, -3.501219, 0, 1, 0.772549, 1,
-0.1406275, 0.6166815, -0.4552158, 0, 1, 0.7764706, 1,
-0.1349227, -0.5588014, -3.228295, 0, 1, 0.7843137, 1,
-0.1340159, -0.5460401, -3.443725, 0, 1, 0.7882353, 1,
-0.1262179, -1.395208, -2.262646, 0, 1, 0.7960784, 1,
-0.1261354, 0.5834274, -3.137605, 0, 1, 0.8039216, 1,
-0.1186639, -0.5189956, -3.970831, 0, 1, 0.8078431, 1,
-0.1128983, 0.06647316, -1.739129, 0, 1, 0.8156863, 1,
-0.1110695, -0.6762815, -4.410008, 0, 1, 0.8196079, 1,
-0.1085156, 1.232625, 0.8478728, 0, 1, 0.827451, 1,
-0.1048696, -0.2896483, -2.763168, 0, 1, 0.8313726, 1,
-0.1016567, 0.9156548, -0.880181, 0, 1, 0.8392157, 1,
-0.101557, -2.525894, -2.395574, 0, 1, 0.8431373, 1,
-0.1009872, 0.06462589, -1.262669, 0, 1, 0.8509804, 1,
-0.1001333, 2.025979, 0.1792055, 0, 1, 0.854902, 1,
-0.0997458, 1.533359, 0.9818464, 0, 1, 0.8627451, 1,
-0.09941542, 0.2244775, -1.426893, 0, 1, 0.8666667, 1,
-0.09884564, -1.077627, -4.255448, 0, 1, 0.8745098, 1,
-0.09693571, 0.9197541, 0.9303719, 0, 1, 0.8784314, 1,
-0.09418206, 1.142437, -0.960912, 0, 1, 0.8862745, 1,
-0.09365167, 0.5701069, 0.7389978, 0, 1, 0.8901961, 1,
-0.08511898, 0.2641029, 0.9946054, 0, 1, 0.8980392, 1,
-0.08056427, 1.743219, 0.8227159, 0, 1, 0.9058824, 1,
-0.07226116, -0.0688424, -2.161412, 0, 1, 0.9098039, 1,
-0.06451087, -0.8054762, -1.883114, 0, 1, 0.9176471, 1,
-0.05747972, 1.189752, 0.5857211, 0, 1, 0.9215686, 1,
-0.05551605, -1.041939, -3.632631, 0, 1, 0.9294118, 1,
-0.05528721, -0.2568942, -1.092203, 0, 1, 0.9333333, 1,
-0.05304731, 0.6101053, 0.146791, 0, 1, 0.9411765, 1,
-0.05244138, -1.44605, -3.244198, 0, 1, 0.945098, 1,
-0.05173716, 1.152762, -0.5255338, 0, 1, 0.9529412, 1,
-0.05142009, -1.29637, -4.181771, 0, 1, 0.9568627, 1,
-0.04785636, 0.4233094, 0.1842566, 0, 1, 0.9647059, 1,
-0.04774904, -0.8004007, -4.056345, 0, 1, 0.9686275, 1,
-0.04128789, 0.7970458, -0.5792966, 0, 1, 0.9764706, 1,
-0.04099757, 0.8345938, -1.432624, 0, 1, 0.9803922, 1,
-0.03986908, 0.3246843, -1.154272, 0, 1, 0.9882353, 1,
-0.03801896, 0.06308823, -1.185409, 0, 1, 0.9921569, 1,
-0.03753986, -2.131881, -1.031741, 0, 1, 1, 1,
-0.03537081, -1.079374, -2.632625, 0, 0.9921569, 1, 1,
-0.03398538, 0.560658, -1.355933, 0, 0.9882353, 1, 1,
-0.0337447, -1.420132, -4.29503, 0, 0.9803922, 1, 1,
-0.02620736, -1.38402, -3.234112, 0, 0.9764706, 1, 1,
-0.02573298, -0.5504645, -2.768362, 0, 0.9686275, 1, 1,
-0.02220597, -0.3590716, -4.442681, 0, 0.9647059, 1, 1,
-0.01848828, -0.6796532, -1.339625, 0, 0.9568627, 1, 1,
-0.0145584, 0.1659648, -0.3936565, 0, 0.9529412, 1, 1,
-0.0145246, -0.4457421, -3.783522, 0, 0.945098, 1, 1,
-0.01070187, 1.555816, 1.207295, 0, 0.9411765, 1, 1,
-0.007557281, -1.753507, -1.396057, 0, 0.9333333, 1, 1,
-0.006931472, -0.2389106, -3.798939, 0, 0.9294118, 1, 1,
-0.006927344, 0.960583, -1.643218, 0, 0.9215686, 1, 1,
-0.006460253, 0.9002301, 0.8753633, 0, 0.9176471, 1, 1,
-0.006259835, -0.1507989, -3.383243, 0, 0.9098039, 1, 1,
-0.003111937, 1.315281, -0.6992309, 0, 0.9058824, 1, 1,
0.0005802865, -1.458167, 1.837567, 0, 0.8980392, 1, 1,
0.006970147, 0.4013068, -0.5387288, 0, 0.8901961, 1, 1,
0.009959994, -1.667922, 2.852055, 0, 0.8862745, 1, 1,
0.01194552, -1.463803, 2.927302, 0, 0.8784314, 1, 1,
0.0147623, -0.3822773, 1.092687, 0, 0.8745098, 1, 1,
0.01556556, 0.3080209, 0.2357281, 0, 0.8666667, 1, 1,
0.01647616, -0.308351, 2.953293, 0, 0.8627451, 1, 1,
0.01841542, -0.9337703, 2.708314, 0, 0.854902, 1, 1,
0.02060438, 2.117224, 1.831763, 0, 0.8509804, 1, 1,
0.02782327, 0.544805, 0.2471412, 0, 0.8431373, 1, 1,
0.04003235, 0.3737963, 0.2971234, 0, 0.8392157, 1, 1,
0.0436838, 0.2838897, 0.6987383, 0, 0.8313726, 1, 1,
0.0440263, 0.8263472, -0.4736341, 0, 0.827451, 1, 1,
0.0504499, -0.1285983, 5.022207, 0, 0.8196079, 1, 1,
0.05101312, -1.375482, 2.729618, 0, 0.8156863, 1, 1,
0.05128854, -1.905085, 2.646723, 0, 0.8078431, 1, 1,
0.06052263, 0.6387154, 1.055054, 0, 0.8039216, 1, 1,
0.06857461, -0.4963528, 1.502053, 0, 0.7960784, 1, 1,
0.07282303, 0.09679015, 0.7351779, 0, 0.7882353, 1, 1,
0.0840153, -0.6645053, 2.805648, 0, 0.7843137, 1, 1,
0.08922771, -0.6277939, 3.516311, 0, 0.7764706, 1, 1,
0.09153014, -0.3719138, 3.628446, 0, 0.772549, 1, 1,
0.09196778, -0.9006379, 2.916123, 0, 0.7647059, 1, 1,
0.09230906, -1.151536, 3.297091, 0, 0.7607843, 1, 1,
0.09629502, -0.6891446, 2.500582, 0, 0.7529412, 1, 1,
0.1033421, 0.389564, 1.889034, 0, 0.7490196, 1, 1,
0.1105714, 0.3482183, 0.1622193, 0, 0.7411765, 1, 1,
0.1141194, 1.05082, 0.5880867, 0, 0.7372549, 1, 1,
0.1219041, -0.06123974, 1.253749, 0, 0.7294118, 1, 1,
0.1219864, 0.4566387, 0.8880275, 0, 0.7254902, 1, 1,
0.1236114, 0.1811093, 1.333649, 0, 0.7176471, 1, 1,
0.1253435, 0.5560444, -0.1840412, 0, 0.7137255, 1, 1,
0.1254543, 1.196921, -0.5598368, 0, 0.7058824, 1, 1,
0.1285518, 1.188998, -0.6712905, 0, 0.6980392, 1, 1,
0.1294575, -2.079904, 2.21899, 0, 0.6941177, 1, 1,
0.1363533, -1.652771, 2.684904, 0, 0.6862745, 1, 1,
0.1379379, 0.8233728, -0.4884067, 0, 0.682353, 1, 1,
0.1385034, 1.699916, 0.4060219, 0, 0.6745098, 1, 1,
0.1395992, -1.837448, 3.188713, 0, 0.6705883, 1, 1,
0.1408177, 1.353434, -0.3567404, 0, 0.6627451, 1, 1,
0.1446383, 0.3896754, -0.7124926, 0, 0.6588235, 1, 1,
0.1518874, -0.92234, 5.177783, 0, 0.6509804, 1, 1,
0.1534577, 1.458615, 0.8979157, 0, 0.6470588, 1, 1,
0.1605867, -0.4810106, 1.70734, 0, 0.6392157, 1, 1,
0.1661114, -0.6154533, 2.528996, 0, 0.6352941, 1, 1,
0.1712078, -1.21924, 3.136572, 0, 0.627451, 1, 1,
0.1771195, 0.6558949, 1.11583, 0, 0.6235294, 1, 1,
0.1774197, -0.7482333, 2.136284, 0, 0.6156863, 1, 1,
0.1824665, 0.06849591, 1.403783, 0, 0.6117647, 1, 1,
0.1869025, 0.7963898, -0.6630143, 0, 0.6039216, 1, 1,
0.2013986, -0.02841014, 1.914479, 0, 0.5960785, 1, 1,
0.2051974, -0.4334894, 2.751951, 0, 0.5921569, 1, 1,
0.2064631, 0.2666201, 0.5803326, 0, 0.5843138, 1, 1,
0.2086716, 1.684643, 0.8533138, 0, 0.5803922, 1, 1,
0.2143927, -0.635396, 4.713971, 0, 0.572549, 1, 1,
0.2144191, 0.7256964, 2.018783, 0, 0.5686275, 1, 1,
0.2147559, 0.2595531, 2.250509, 0, 0.5607843, 1, 1,
0.2231585, 0.3949704, 1.008751, 0, 0.5568628, 1, 1,
0.2244548, 0.4273486, 1.937383, 0, 0.5490196, 1, 1,
0.2246252, -0.915656, 1.364307, 0, 0.5450981, 1, 1,
0.2269935, -1.031497, 3.077498, 0, 0.5372549, 1, 1,
0.2274541, 0.4101395, -1.559708, 0, 0.5333334, 1, 1,
0.2284054, 1.502186, 0.9473079, 0, 0.5254902, 1, 1,
0.2327007, 1.584672, -0.3069487, 0, 0.5215687, 1, 1,
0.2330832, 1.060725, -0.8324235, 0, 0.5137255, 1, 1,
0.2359128, -0.06198348, 2.103938, 0, 0.509804, 1, 1,
0.2398485, -0.8470348, 3.24255, 0, 0.5019608, 1, 1,
0.2438194, -0.8694974, 2.841101, 0, 0.4941176, 1, 1,
0.246085, -0.2021661, 3.919167, 0, 0.4901961, 1, 1,
0.2472483, -0.7830517, 3.093024, 0, 0.4823529, 1, 1,
0.2519183, 1.415712, -0.7043272, 0, 0.4784314, 1, 1,
0.2567031, -1.146132, 2.134623, 0, 0.4705882, 1, 1,
0.257221, 2.281137, -1.266337, 0, 0.4666667, 1, 1,
0.2600541, 1.555265, -1.540644, 0, 0.4588235, 1, 1,
0.2608619, -0.7678003, 2.563952, 0, 0.454902, 1, 1,
0.26264, -0.8605925, 3.905142, 0, 0.4470588, 1, 1,
0.276426, -0.7350165, 0.8640835, 0, 0.4431373, 1, 1,
0.2766407, -0.237655, 2.783049, 0, 0.4352941, 1, 1,
0.2809261, 1.153291, 1.384782, 0, 0.4313726, 1, 1,
0.2881461, 0.1947731, 0.8820741, 0, 0.4235294, 1, 1,
0.2968043, 0.951915, -0.176918, 0, 0.4196078, 1, 1,
0.2969944, 0.6479982, 0.6312949, 0, 0.4117647, 1, 1,
0.2979828, -1.235927, 2.222708, 0, 0.4078431, 1, 1,
0.3010042, 1.285645, 1.605333, 0, 0.4, 1, 1,
0.3023714, -1.194093, 1.984478, 0, 0.3921569, 1, 1,
0.3034033, -0.3939106, 1.467405, 0, 0.3882353, 1, 1,
0.3051291, 0.254258, 1.572885, 0, 0.3803922, 1, 1,
0.3057755, 0.2616721, 1.036384, 0, 0.3764706, 1, 1,
0.3061277, -1.193469, 2.808182, 0, 0.3686275, 1, 1,
0.3082928, -0.10827, 1.596554, 0, 0.3647059, 1, 1,
0.3209389, -0.6187025, 2.200241, 0, 0.3568628, 1, 1,
0.3224769, 0.2754581, 1.995986, 0, 0.3529412, 1, 1,
0.3234152, -1.818904, 2.851591, 0, 0.345098, 1, 1,
0.3257686, 0.5173963, 0.3210339, 0, 0.3411765, 1, 1,
0.3296596, 1.219679, 0.6291918, 0, 0.3333333, 1, 1,
0.3358213, 0.2917002, 0.4633277, 0, 0.3294118, 1, 1,
0.3391811, -0.07140841, 1.303754, 0, 0.3215686, 1, 1,
0.3400865, 0.5262038, 0.650478, 0, 0.3176471, 1, 1,
0.3405553, 2.16297, -0.1989724, 0, 0.3098039, 1, 1,
0.3419495, 0.2743275, 0.7199277, 0, 0.3058824, 1, 1,
0.3439912, -1.33677, 3.348835, 0, 0.2980392, 1, 1,
0.3457125, 0.07199574, 1.645093, 0, 0.2901961, 1, 1,
0.3480792, -0.5874677, 2.489007, 0, 0.2862745, 1, 1,
0.3505736, 0.4725985, 0.644948, 0, 0.2784314, 1, 1,
0.3524667, 0.6471863, -0.04845063, 0, 0.2745098, 1, 1,
0.3542712, 1.417755, -0.6251547, 0, 0.2666667, 1, 1,
0.3556526, 0.9644128, 0.6605657, 0, 0.2627451, 1, 1,
0.3578477, 0.47616, 0.3196153, 0, 0.254902, 1, 1,
0.3595279, 1.350452, 1.028066, 0, 0.2509804, 1, 1,
0.361539, -0.242607, 2.886572, 0, 0.2431373, 1, 1,
0.3636824, 0.1538589, 2.966972, 0, 0.2392157, 1, 1,
0.3667223, -0.916274, 2.455447, 0, 0.2313726, 1, 1,
0.3701364, -0.3080599, 4.142638, 0, 0.227451, 1, 1,
0.374105, -0.02835745, 0.67214, 0, 0.2196078, 1, 1,
0.3752629, -0.320706, 2.949608, 0, 0.2156863, 1, 1,
0.3765131, 1.062981, 1.000577, 0, 0.2078431, 1, 1,
0.3798514, -0.3348177, 2.292871, 0, 0.2039216, 1, 1,
0.3820023, -0.4880283, 2.439379, 0, 0.1960784, 1, 1,
0.3836036, -1.478198, 0.721769, 0, 0.1882353, 1, 1,
0.3837968, 0.4959296, -0.6814108, 0, 0.1843137, 1, 1,
0.3845512, 1.111014, -0.002937645, 0, 0.1764706, 1, 1,
0.3946357, 0.0400728, 2.38344, 0, 0.172549, 1, 1,
0.3950608, -0.823813, 2.271904, 0, 0.1647059, 1, 1,
0.3970001, 0.2047605, 1.145923, 0, 0.1607843, 1, 1,
0.3982012, -0.2863956, 1.149715, 0, 0.1529412, 1, 1,
0.4020382, 0.4715879, 1.251708, 0, 0.1490196, 1, 1,
0.4056942, 0.1394846, 2.052037, 0, 0.1411765, 1, 1,
0.4072152, 1.067236, 2.12737, 0, 0.1372549, 1, 1,
0.40779, -2.078686, 3.29209, 0, 0.1294118, 1, 1,
0.4090058, 0.792676, 0.6317192, 0, 0.1254902, 1, 1,
0.4094119, 0.6628453, -0.5781536, 0, 0.1176471, 1, 1,
0.4118028, -1.448486, 3.920451, 0, 0.1137255, 1, 1,
0.4148349, -0.5566379, 1.875831, 0, 0.1058824, 1, 1,
0.4190448, 0.9524093, -0.2064696, 0, 0.09803922, 1, 1,
0.4192206, -0.5238402, 1.990472, 0, 0.09411765, 1, 1,
0.4195427, 0.7230858, 1.762555, 0, 0.08627451, 1, 1,
0.429447, -0.6116427, 1.908447, 0, 0.08235294, 1, 1,
0.4356081, 0.0116474, 0.1794656, 0, 0.07450981, 1, 1,
0.4399456, 1.404441, 0.6267607, 0, 0.07058824, 1, 1,
0.4430512, -0.6128503, 1.495679, 0, 0.0627451, 1, 1,
0.4462913, -0.3780534, 2.303434, 0, 0.05882353, 1, 1,
0.4488235, 0.2108158, 1.769401, 0, 0.05098039, 1, 1,
0.4492774, -0.6641995, 2.228132, 0, 0.04705882, 1, 1,
0.4501033, 0.4461072, 1.031729, 0, 0.03921569, 1, 1,
0.4502031, 0.05524012, 0.4608513, 0, 0.03529412, 1, 1,
0.452552, 0.4029221, -0.2309269, 0, 0.02745098, 1, 1,
0.4541631, -0.3572336, 2.575543, 0, 0.02352941, 1, 1,
0.4597162, 0.2838211, 0.5897231, 0, 0.01568628, 1, 1,
0.4619578, -0.6640068, 2.792561, 0, 0.01176471, 1, 1,
0.4622165, -0.1670167, 1.744483, 0, 0.003921569, 1, 1,
0.462355, -0.4252388, 1.467741, 0.003921569, 0, 1, 1,
0.4632097, 0.6784177, 0.3669411, 0.007843138, 0, 1, 1,
0.4637685, -0.9727573, 1.780922, 0.01568628, 0, 1, 1,
0.4645375, 0.5794549, 0.9847826, 0.01960784, 0, 1, 1,
0.4683817, 0.3787435, 0.1229231, 0.02745098, 0, 1, 1,
0.4692163, -0.1159905, 2.423817, 0.03137255, 0, 1, 1,
0.469405, -0.536257, 2.899609, 0.03921569, 0, 1, 1,
0.4729461, -1.007825, 3.411497, 0.04313726, 0, 1, 1,
0.4735917, 0.6542474, -0.5389441, 0.05098039, 0, 1, 1,
0.4738895, -0.2448349, 1.599947, 0.05490196, 0, 1, 1,
0.4843258, 0.8435283, 0.4261341, 0.0627451, 0, 1, 1,
0.4917932, 0.981177, 1.960671, 0.06666667, 0, 1, 1,
0.4919721, -0.222189, 2.017194, 0.07450981, 0, 1, 1,
0.500816, 0.4077874, 1.112215, 0.07843138, 0, 1, 1,
0.505014, 0.591489, 1.685503, 0.08627451, 0, 1, 1,
0.5132072, 0.6939553, -0.5470993, 0.09019608, 0, 1, 1,
0.5138132, -1.015007, 3.697879, 0.09803922, 0, 1, 1,
0.5166333, -0.4449114, 1.034344, 0.1058824, 0, 1, 1,
0.5172609, -1.228756, 1.951126, 0.1098039, 0, 1, 1,
0.5242422, -1.340042, 4.859317, 0.1176471, 0, 1, 1,
0.5255634, 1.734925, 0.2929643, 0.1215686, 0, 1, 1,
0.5257671, 1.462592, -0.9945092, 0.1294118, 0, 1, 1,
0.5258318, -0.5682273, 3.809439, 0.1333333, 0, 1, 1,
0.5262278, 0.1934576, 0.3293052, 0.1411765, 0, 1, 1,
0.527512, -0.4671589, 1.689991, 0.145098, 0, 1, 1,
0.5291817, -0.4024881, 2.379883, 0.1529412, 0, 1, 1,
0.5349649, -0.6674021, 3.254514, 0.1568628, 0, 1, 1,
0.5354207, -0.4445085, 3.341041, 0.1647059, 0, 1, 1,
0.5376895, 0.6403725, 0.7994173, 0.1686275, 0, 1, 1,
0.5380202, 0.4473009, 0.6971264, 0.1764706, 0, 1, 1,
0.5423884, 0.5379007, -0.735796, 0.1803922, 0, 1, 1,
0.5477455, 0.1430133, 2.777547, 0.1882353, 0, 1, 1,
0.5489405, -0.8769502, 2.322478, 0.1921569, 0, 1, 1,
0.5549999, -2.70932, 4.87249, 0.2, 0, 1, 1,
0.5585268, -0.4939247, 1.634996, 0.2078431, 0, 1, 1,
0.5591108, 0.8113806, -0.8909666, 0.2117647, 0, 1, 1,
0.5629361, -0.7893742, 1.588192, 0.2196078, 0, 1, 1,
0.563183, -0.3415287, 1.369393, 0.2235294, 0, 1, 1,
0.5644549, 2.455117, -2.411554, 0.2313726, 0, 1, 1,
0.5649775, -1.282573, 2.823684, 0.2352941, 0, 1, 1,
0.5702915, 0.383193, 0.005130117, 0.2431373, 0, 1, 1,
0.5719647, -2.22165, 1.729383, 0.2470588, 0, 1, 1,
0.5742216, -0.2009583, 2.288461, 0.254902, 0, 1, 1,
0.5788671, 0.5456738, 0.1236315, 0.2588235, 0, 1, 1,
0.5793707, 0.6682418, 2.400957, 0.2666667, 0, 1, 1,
0.5799062, 0.9202827, 1.899035, 0.2705882, 0, 1, 1,
0.5816711, 0.586486, 0.04711134, 0.2784314, 0, 1, 1,
0.5846308, -1.496012, 2.746337, 0.282353, 0, 1, 1,
0.5858186, 0.9040973, 1.643353, 0.2901961, 0, 1, 1,
0.5872537, -0.2138376, 1.305063, 0.2941177, 0, 1, 1,
0.5903382, 1.397581, 0.2093251, 0.3019608, 0, 1, 1,
0.5936517, -0.3041206, 1.338997, 0.3098039, 0, 1, 1,
0.5939063, -0.1365233, 2.15767, 0.3137255, 0, 1, 1,
0.5946257, 0.8569604, 0.536949, 0.3215686, 0, 1, 1,
0.607, -1.044812, 2.88406, 0.3254902, 0, 1, 1,
0.6109083, 0.3165601, 3.258419, 0.3333333, 0, 1, 1,
0.6125823, -2.659637, 1.579942, 0.3372549, 0, 1, 1,
0.6174744, -1.075422, 2.606447, 0.345098, 0, 1, 1,
0.6222016, -0.7406293, 1.626451, 0.3490196, 0, 1, 1,
0.6224564, -0.7333446, 2.871881, 0.3568628, 0, 1, 1,
0.6306004, -1.849667, 1.056233, 0.3607843, 0, 1, 1,
0.6319526, -0.8696625, 0.6019819, 0.3686275, 0, 1, 1,
0.6381764, -0.8811386, 3.361031, 0.372549, 0, 1, 1,
0.6423461, -0.4772263, 3.896083, 0.3803922, 0, 1, 1,
0.6462906, -0.409282, 3.558944, 0.3843137, 0, 1, 1,
0.6468982, 0.6742474, -0.1194137, 0.3921569, 0, 1, 1,
0.651139, -0.3483875, 2.410782, 0.3960784, 0, 1, 1,
0.6584515, 1.991856, 1.393515, 0.4039216, 0, 1, 1,
0.6615595, 0.1801915, 1.430616, 0.4117647, 0, 1, 1,
0.6712507, -0.3302331, 1.873139, 0.4156863, 0, 1, 1,
0.6715904, -0.08914997, 0.3466271, 0.4235294, 0, 1, 1,
0.677476, -0.4813731, 1.403526, 0.427451, 0, 1, 1,
0.6789978, -0.8342256, 1.409349, 0.4352941, 0, 1, 1,
0.688646, 1.142319, 1.230176, 0.4392157, 0, 1, 1,
0.6887263, -1.558488, 4.092908, 0.4470588, 0, 1, 1,
0.6960678, 0.7458553, 1.196495, 0.4509804, 0, 1, 1,
0.7025977, -0.767607, 3.184618, 0.4588235, 0, 1, 1,
0.7037341, 0.7206795, -0.0627576, 0.4627451, 0, 1, 1,
0.7051684, 1.495114, -0.7692619, 0.4705882, 0, 1, 1,
0.7063307, 1.579943, 0.4317941, 0.4745098, 0, 1, 1,
0.7074046, -1.01127, 3.131363, 0.4823529, 0, 1, 1,
0.7087019, -0.4468797, 1.471243, 0.4862745, 0, 1, 1,
0.7096766, 1.368799, 0.1727921, 0.4941176, 0, 1, 1,
0.7140102, -0.1305163, 1.278325, 0.5019608, 0, 1, 1,
0.7183907, -0.7590743, 0.2628756, 0.5058824, 0, 1, 1,
0.722724, -1.08579, 1.71539, 0.5137255, 0, 1, 1,
0.7315919, 0.6069329, 0.9625373, 0.5176471, 0, 1, 1,
0.7355144, -0.5249109, 1.955811, 0.5254902, 0, 1, 1,
0.7377823, 0.3600291, 0.8086781, 0.5294118, 0, 1, 1,
0.7442755, -0.7630917, 2.246247, 0.5372549, 0, 1, 1,
0.7449728, -2.007404, 4.699679, 0.5411765, 0, 1, 1,
0.7456926, -0.1534167, 2.197069, 0.5490196, 0, 1, 1,
0.7459614, 0.5343286, -0.6075879, 0.5529412, 0, 1, 1,
0.7470344, 0.3984095, 0.4055254, 0.5607843, 0, 1, 1,
0.7479857, -0.3146891, 0.8877009, 0.5647059, 0, 1, 1,
0.7495424, -0.6298392, 2.501132, 0.572549, 0, 1, 1,
0.7501156, 2.825609, -0.7845932, 0.5764706, 0, 1, 1,
0.7507243, -0.4684022, 3.159857, 0.5843138, 0, 1, 1,
0.7513244, 0.7535588, 0.3952514, 0.5882353, 0, 1, 1,
0.7549547, -1.574769, 1.194567, 0.5960785, 0, 1, 1,
0.7582884, 0.6120559, -1.210104, 0.6039216, 0, 1, 1,
0.7596599, -2.178946, 1.429145, 0.6078432, 0, 1, 1,
0.7621254, -0.3695923, 3.645288, 0.6156863, 0, 1, 1,
0.7634898, 0.3909985, 1.522837, 0.6196079, 0, 1, 1,
0.76481, 1.255808, 0.8728196, 0.627451, 0, 1, 1,
0.7649613, -0.3837834, 0.5475287, 0.6313726, 0, 1, 1,
0.7713156, 0.5315871, -0.1616973, 0.6392157, 0, 1, 1,
0.772727, 0.4569036, -0.06072572, 0.6431373, 0, 1, 1,
0.7740116, -0.4741242, 3.158288, 0.6509804, 0, 1, 1,
0.7766503, 0.8674457, 0.1983471, 0.654902, 0, 1, 1,
0.7811704, 0.5427935, -0.5332764, 0.6627451, 0, 1, 1,
0.7865391, 0.2690344, 1.292386, 0.6666667, 0, 1, 1,
0.7887158, -0.7449397, 2.449081, 0.6745098, 0, 1, 1,
0.7901734, -0.9019966, 2.296446, 0.6784314, 0, 1, 1,
0.7941303, -0.4410579, 1.511718, 0.6862745, 0, 1, 1,
0.802178, -1.681712, 2.56499, 0.6901961, 0, 1, 1,
0.8060449, -0.3961154, 1.544723, 0.6980392, 0, 1, 1,
0.8115132, 2.219233, 2.078882, 0.7058824, 0, 1, 1,
0.8123937, 0.8043543, 1.34268, 0.7098039, 0, 1, 1,
0.8125961, -0.06281877, 0.73918, 0.7176471, 0, 1, 1,
0.8129581, 0.9509392, 1.942647, 0.7215686, 0, 1, 1,
0.8157814, -0.2254659, 1.140299, 0.7294118, 0, 1, 1,
0.817288, 1.799229, 1.415338, 0.7333333, 0, 1, 1,
0.8195108, 1.505813, 0.7850987, 0.7411765, 0, 1, 1,
0.8302599, -0.2374602, 1.793353, 0.7450981, 0, 1, 1,
0.8338105, -1.256031, 5.626777, 0.7529412, 0, 1, 1,
0.8377787, 0.4139006, 0.5791246, 0.7568628, 0, 1, 1,
0.8472523, -2.579735, 4.174932, 0.7647059, 0, 1, 1,
0.8486813, 0.8191593, 0.2292525, 0.7686275, 0, 1, 1,
0.8491709, -1.249097, 2.046931, 0.7764706, 0, 1, 1,
0.8506376, -1.092151, 4.23091, 0.7803922, 0, 1, 1,
0.8516831, -1.650744, 1.21209, 0.7882353, 0, 1, 1,
0.8569298, 0.6029737, 1.265607, 0.7921569, 0, 1, 1,
0.8580069, 0.7219951, 0.1999974, 0.8, 0, 1, 1,
0.8659154, 1.585441, 0.8130841, 0.8078431, 0, 1, 1,
0.8663088, 1.151572, -1.492514, 0.8117647, 0, 1, 1,
0.8669729, -0.3417546, 1.486684, 0.8196079, 0, 1, 1,
0.870812, -0.6281268, -0.03043254, 0.8235294, 0, 1, 1,
0.877144, -0.2792488, 0.4836781, 0.8313726, 0, 1, 1,
0.878232, -0.4921612, 0.7366698, 0.8352941, 0, 1, 1,
0.880035, -0.04670487, -0.3470171, 0.8431373, 0, 1, 1,
0.8812118, -0.03534218, 1.127292, 0.8470588, 0, 1, 1,
0.8826025, -0.01782608, 0.6443051, 0.854902, 0, 1, 1,
0.8875606, -1.722146, 1.784738, 0.8588235, 0, 1, 1,
0.8900923, -0.7783157, 1.912039, 0.8666667, 0, 1, 1,
0.8941625, -0.7249925, 4.874836, 0.8705882, 0, 1, 1,
0.8945349, 0.1872554, 2.259581, 0.8784314, 0, 1, 1,
0.9045396, 0.3958801, 2.158365, 0.8823529, 0, 1, 1,
0.908571, -0.8778774, 3.724489, 0.8901961, 0, 1, 1,
0.9101757, 1.097414, 1.661993, 0.8941177, 0, 1, 1,
0.9108534, 1.186441, 0.3144473, 0.9019608, 0, 1, 1,
0.9131781, 0.002481095, 1.735949, 0.9098039, 0, 1, 1,
0.9141163, 3.228991, 0.8908453, 0.9137255, 0, 1, 1,
0.9200733, -0.7955073, 2.66509, 0.9215686, 0, 1, 1,
0.9220538, 0.6144002, 0.4976912, 0.9254902, 0, 1, 1,
0.9296393, -0.7414382, 3.035761, 0.9333333, 0, 1, 1,
0.9305344, -0.4951017, 2.447595, 0.9372549, 0, 1, 1,
0.9306359, -0.9881893, 2.020324, 0.945098, 0, 1, 1,
0.9424957, -1.010776, 2.440869, 0.9490196, 0, 1, 1,
0.9465722, 0.4555701, 0.008664707, 0.9568627, 0, 1, 1,
0.9480622, -0.9908908, 1.295948, 0.9607843, 0, 1, 1,
0.9509592, -1.293188, 3.493317, 0.9686275, 0, 1, 1,
0.9579725, 0.2146877, 0.4908952, 0.972549, 0, 1, 1,
0.9635961, -1.529301, 2.309866, 0.9803922, 0, 1, 1,
0.9646276, 0.7392856, 0.3910768, 0.9843137, 0, 1, 1,
0.9722605, -1.175448, 1.968042, 0.9921569, 0, 1, 1,
0.977971, -1.196788, 2.369187, 0.9960784, 0, 1, 1,
0.9807283, -1.134273, 2.792045, 1, 0, 0.9960784, 1,
0.9898239, 0.04186558, 2.504816, 1, 0, 0.9882353, 1,
0.9906074, 0.5444264, 0.9650491, 1, 0, 0.9843137, 1,
0.9910935, -1.279867, 1.335014, 1, 0, 0.9764706, 1,
0.9932644, 0.2986249, 0.8263234, 1, 0, 0.972549, 1,
0.9935228, -0.2067696, 1.176599, 1, 0, 0.9647059, 1,
0.9938912, -1.674421, 2.862684, 1, 0, 0.9607843, 1,
0.9960075, 0.7598107, 2.46783, 1, 0, 0.9529412, 1,
0.9996015, -0.4663909, 2.050035, 1, 0, 0.9490196, 1,
1.005373, 0.7969569, 1.634586, 1, 0, 0.9411765, 1,
1.005444, -0.7387864, 3.426825, 1, 0, 0.9372549, 1,
1.011979, -0.05962287, 0.3662158, 1, 0, 0.9294118, 1,
1.013382, -1.512757, 2.284343, 1, 0, 0.9254902, 1,
1.014989, 0.4159284, 0.8843305, 1, 0, 0.9176471, 1,
1.016415, 0.5649583, -0.3452697, 1, 0, 0.9137255, 1,
1.021374, 2.035248, -0.401921, 1, 0, 0.9058824, 1,
1.022588, 0.4803792, -0.5720626, 1, 0, 0.9019608, 1,
1.023014, -1.369835, 2.663309, 1, 0, 0.8941177, 1,
1.034991, 0.3237593, 0.8379378, 1, 0, 0.8862745, 1,
1.044125, -0.08845475, 1.579622, 1, 0, 0.8823529, 1,
1.051469, -1.153768, 4.381462, 1, 0, 0.8745098, 1,
1.051524, -0.9650469, 1.88115, 1, 0, 0.8705882, 1,
1.053812, -0.01735571, 0.9382091, 1, 0, 0.8627451, 1,
1.05791, 0.1607574, 2.860011, 1, 0, 0.8588235, 1,
1.060737, -0.08850241, 0.968593, 1, 0, 0.8509804, 1,
1.074622, -0.3641625, 1.296282, 1, 0, 0.8470588, 1,
1.08617, -0.8255372, 3.957122, 1, 0, 0.8392157, 1,
1.091708, 2.681119, 1.433682, 1, 0, 0.8352941, 1,
1.09934, 0.1421158, 1.987159, 1, 0, 0.827451, 1,
1.099753, -0.2579996, 3.872443, 1, 0, 0.8235294, 1,
1.115007, -0.1281933, 1.333357, 1, 0, 0.8156863, 1,
1.122778, -0.7993658, 2.282494, 1, 0, 0.8117647, 1,
1.130253, -0.4693314, 2.922404, 1, 0, 0.8039216, 1,
1.13072, 1.023935, 1.542842, 1, 0, 0.7960784, 1,
1.143191, -0.1560337, -0.03911254, 1, 0, 0.7921569, 1,
1.145815, 0.1017028, 1.794685, 1, 0, 0.7843137, 1,
1.155951, 2.20006, -0.7115303, 1, 0, 0.7803922, 1,
1.157795, 1.036504, 2.04138, 1, 0, 0.772549, 1,
1.160542, 0.05091074, 0.91175, 1, 0, 0.7686275, 1,
1.163351, 0.6663374, 0.8156801, 1, 0, 0.7607843, 1,
1.165444, 0.8311905, 0.3554013, 1, 0, 0.7568628, 1,
1.172096, 0.7595803, 0.7717402, 1, 0, 0.7490196, 1,
1.17904, 1.401664, 1.678707, 1, 0, 0.7450981, 1,
1.182225, -1.204277, 1.736172, 1, 0, 0.7372549, 1,
1.192435, -1.023306, 2.335117, 1, 0, 0.7333333, 1,
1.194738, 1.431907, 1.189526, 1, 0, 0.7254902, 1,
1.195506, 0.3793845, 1.98947, 1, 0, 0.7215686, 1,
1.197392, -1.182897, 4.144704, 1, 0, 0.7137255, 1,
1.208431, 1.312469, -0.6191891, 1, 0, 0.7098039, 1,
1.208622, 0.4992036, 3.506972, 1, 0, 0.7019608, 1,
1.208623, -0.482054, 0.1416589, 1, 0, 0.6941177, 1,
1.209599, 1.032546, 1.600552, 1, 0, 0.6901961, 1,
1.209654, -2.29566, 3.429777, 1, 0, 0.682353, 1,
1.214399, 0.2441913, 1.579222, 1, 0, 0.6784314, 1,
1.223209, 0.9633618, 1.62245, 1, 0, 0.6705883, 1,
1.227044, 0.6595945, 1.568949, 1, 0, 0.6666667, 1,
1.227116, -0.2474539, 1.742055, 1, 0, 0.6588235, 1,
1.232684, -1.252859, 3.614075, 1, 0, 0.654902, 1,
1.23967, 0.6911015, 1.171427, 1, 0, 0.6470588, 1,
1.243569, 0.02391291, 2.20595, 1, 0, 0.6431373, 1,
1.24628, 1.232289, 1.881406, 1, 0, 0.6352941, 1,
1.24743, -0.5109051, 0.2493929, 1, 0, 0.6313726, 1,
1.255065, 1.058697, -0.6774604, 1, 0, 0.6235294, 1,
1.255326, -0.1343937, 2.366723, 1, 0, 0.6196079, 1,
1.256316, -0.3296713, 0.7892162, 1, 0, 0.6117647, 1,
1.257095, -0.8255453, 1.984969, 1, 0, 0.6078432, 1,
1.26253, 2.087335, 1.210186, 1, 0, 0.6, 1,
1.268188, -1.992453, 2.91734, 1, 0, 0.5921569, 1,
1.277973, -0.8525576, 2.564494, 1, 0, 0.5882353, 1,
1.283702, -0.04588898, 0.3746487, 1, 0, 0.5803922, 1,
1.290764, -0.5380699, 1.961161, 1, 0, 0.5764706, 1,
1.291636, -1.79552, 2.993758, 1, 0, 0.5686275, 1,
1.2928, 1.19222, 0.9423994, 1, 0, 0.5647059, 1,
1.294068, 1.786689, 1.145495, 1, 0, 0.5568628, 1,
1.295612, 0.2666963, 0.7376814, 1, 0, 0.5529412, 1,
1.311885, -0.3441999, 1.796417, 1, 0, 0.5450981, 1,
1.325523, 1.200583, 1.21145, 1, 0, 0.5411765, 1,
1.342266, -1.749905, 0.8684506, 1, 0, 0.5333334, 1,
1.34649, -0.9713284, 0.7759403, 1, 0, 0.5294118, 1,
1.353335, 0.07078391, 3.049312, 1, 0, 0.5215687, 1,
1.35457, -0.7523653, 1.9699, 1, 0, 0.5176471, 1,
1.357596, -1.221525, 2.022631, 1, 0, 0.509804, 1,
1.359305, 1.803388, -0.6459307, 1, 0, 0.5058824, 1,
1.36004, -0.6428616, 2.650277, 1, 0, 0.4980392, 1,
1.365598, 1.087237, 0.694578, 1, 0, 0.4901961, 1,
1.367297, -0.2412376, 1.917933, 1, 0, 0.4862745, 1,
1.371765, 1.709804, 0.5818213, 1, 0, 0.4784314, 1,
1.378974, 1.055431, 0.9988152, 1, 0, 0.4745098, 1,
1.382001, -0.3905964, 1.209721, 1, 0, 0.4666667, 1,
1.382374, 0.603353, 0.3587465, 1, 0, 0.4627451, 1,
1.387788, 0.8347577, 2.645902, 1, 0, 0.454902, 1,
1.391513, 0.6145872, 1.769808, 1, 0, 0.4509804, 1,
1.396348, -0.2358716, 2.619334, 1, 0, 0.4431373, 1,
1.399335, 0.7490996, 1.610751, 1, 0, 0.4392157, 1,
1.400189, -0.834823, 3.544637, 1, 0, 0.4313726, 1,
1.400598, -0.8779038, 1.384234, 1, 0, 0.427451, 1,
1.429602, 1.701597, -0.788245, 1, 0, 0.4196078, 1,
1.439665, -1.298393, 1.823011, 1, 0, 0.4156863, 1,
1.47338, 0.5756584, 1.84192, 1, 0, 0.4078431, 1,
1.500998, -0.09873225, 1.070064, 1, 0, 0.4039216, 1,
1.506097, -1.938678, 3.429476, 1, 0, 0.3960784, 1,
1.520885, 1.355876, 0.8161517, 1, 0, 0.3882353, 1,
1.523978, -0.6320555, 2.760759, 1, 0, 0.3843137, 1,
1.538164, -0.0005035949, 0.9502671, 1, 0, 0.3764706, 1,
1.54964, 0.6498052, 1.048218, 1, 0, 0.372549, 1,
1.557108, -0.008015891, 2.679534, 1, 0, 0.3647059, 1,
1.575019, -0.1445549, 1.485397, 1, 0, 0.3607843, 1,
1.617486, -0.2772233, 1.43188, 1, 0, 0.3529412, 1,
1.63326, 1.33952, 2.481698, 1, 0, 0.3490196, 1,
1.641465, 0.53996, 2.040716, 1, 0, 0.3411765, 1,
1.64185, -1.586129, 4.019548, 1, 0, 0.3372549, 1,
1.645926, -0.330641, -1.107231, 1, 0, 0.3294118, 1,
1.652355, 0.7941703, -0.7834699, 1, 0, 0.3254902, 1,
1.660265, -1.139947, 0.9187058, 1, 0, 0.3176471, 1,
1.663905, 2.432056, -0.8270528, 1, 0, 0.3137255, 1,
1.66936, -0.2488418, 1.534703, 1, 0, 0.3058824, 1,
1.67732, 1.220894, 0.3800804, 1, 0, 0.2980392, 1,
1.680132, -0.4707907, 0.8268561, 1, 0, 0.2941177, 1,
1.685528, 0.9868288, 1.294179, 1, 0, 0.2862745, 1,
1.694751, 1.408769, 1.963943, 1, 0, 0.282353, 1,
1.703252, 0.9812652, 0.7365822, 1, 0, 0.2745098, 1,
1.705204, -1.297193, 2.44584, 1, 0, 0.2705882, 1,
1.71828, 1.213255, 1.950586, 1, 0, 0.2627451, 1,
1.723882, 0.3193637, -0.5698359, 1, 0, 0.2588235, 1,
1.742496, 0.542594, 0.8509175, 1, 0, 0.2509804, 1,
1.765682, -0.03081074, 1.662184, 1, 0, 0.2470588, 1,
1.781773, 0.3691943, 1.6342, 1, 0, 0.2392157, 1,
1.785448, -0.3898575, 2.510413, 1, 0, 0.2352941, 1,
1.795964, -1.016898, 0.3898447, 1, 0, 0.227451, 1,
1.805261, 0.6525573, 1.415481, 1, 0, 0.2235294, 1,
1.80626, 1.709318, 0.5869869, 1, 0, 0.2156863, 1,
1.823294, 0.5248475, 1.131254, 1, 0, 0.2117647, 1,
1.83173, -0.9896991, 1.692861, 1, 0, 0.2039216, 1,
1.832393, -1.195951, 2.957991, 1, 0, 0.1960784, 1,
1.872337, -0.3326565, 1.502235, 1, 0, 0.1921569, 1,
1.873424, -0.4606281, 0.07328972, 1, 0, 0.1843137, 1,
1.886731, 0.534201, 1.59518, 1, 0, 0.1803922, 1,
1.912037, -0.6020873, 3.567326, 1, 0, 0.172549, 1,
1.914547, -0.6761034, 2.783703, 1, 0, 0.1686275, 1,
1.954567, 0.7796786, 1.063112, 1, 0, 0.1607843, 1,
1.97566, 2.252706, 0.597234, 1, 0, 0.1568628, 1,
2.033409, 0.09482149, 3.024045, 1, 0, 0.1490196, 1,
2.050361, 0.7492648, 1.157904, 1, 0, 0.145098, 1,
2.09236, -0.01802771, 1.095387, 1, 0, 0.1372549, 1,
2.110519, 0.1324629, 2.650183, 1, 0, 0.1333333, 1,
2.151306, -0.5909863, 1.386173, 1, 0, 0.1254902, 1,
2.1972, 0.06924839, 1.028567, 1, 0, 0.1215686, 1,
2.209105, -0.564668, 0.4179445, 1, 0, 0.1137255, 1,
2.249246, -1.013947, 2.278314, 1, 0, 0.1098039, 1,
2.282955, 0.7845747, 3.602891, 1, 0, 0.1019608, 1,
2.342746, 1.173584, 0.706939, 1, 0, 0.09411765, 1,
2.359278, -0.4180347, 2.532223, 1, 0, 0.09019608, 1,
2.363082, 0.1226938, 0.6451502, 1, 0, 0.08235294, 1,
2.433343, -0.4834445, 0.6116338, 1, 0, 0.07843138, 1,
2.478511, -1.30754, 2.074862, 1, 0, 0.07058824, 1,
2.556613, 0.05969949, 0.9715298, 1, 0, 0.06666667, 1,
2.593284, -2.538225, 2.433187, 1, 0, 0.05882353, 1,
2.608566, -0.2168679, 3.595413, 1, 0, 0.05490196, 1,
2.624125, 1.575508, 2.194317, 1, 0, 0.04705882, 1,
2.640279, -0.9029747, 1.016291, 1, 0, 0.04313726, 1,
2.840914, -0.6098912, 2.290476, 1, 0, 0.03529412, 1,
2.860556, 0.4270282, -0.06462505, 1, 0, 0.03137255, 1,
3.009998, -0.06069377, 1.043022, 1, 0, 0.02352941, 1,
3.041099, -1.138293, 0.8880223, 1, 0, 0.01960784, 1,
3.118535, 0.2967834, 2.268294, 1, 0, 0.01176471, 1,
3.138038, 0.6801772, 1.064492, 1, 0, 0.007843138, 1
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
0.04389954, -3.87483, -6.618141, 0, -0.5, 0.5, 0.5,
0.04389954, -3.87483, -6.618141, 1, -0.5, 0.5, 0.5,
0.04389954, -3.87483, -6.618141, 1, 1.5, 0.5, 0.5,
0.04389954, -3.87483, -6.618141, 0, 1.5, 0.5, 0.5
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
-4.099152, 0.3163589, -6.618141, 0, -0.5, 0.5, 0.5,
-4.099152, 0.3163589, -6.618141, 1, -0.5, 0.5, 0.5,
-4.099152, 0.3163589, -6.618141, 1, 1.5, 0.5, 0.5,
-4.099152, 0.3163589, -6.618141, 0, 1.5, 0.5, 0.5
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
-4.099152, -3.87483, 0.3916688, 0, -0.5, 0.5, 0.5,
-4.099152, -3.87483, 0.3916688, 1, -0.5, 0.5, 0.5,
-4.099152, -3.87483, 0.3916688, 1, 1.5, 0.5, 0.5,
-4.099152, -3.87483, 0.3916688, 0, 1.5, 0.5, 0.5
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
-3, -2.907633, -5.000493,
3, -2.907633, -5.000493,
-3, -2.907633, -5.000493,
-3, -3.068832, -5.270101,
-2, -2.907633, -5.000493,
-2, -3.068832, -5.270101,
-1, -2.907633, -5.000493,
-1, -3.068832, -5.270101,
0, -2.907633, -5.000493,
0, -3.068832, -5.270101,
1, -2.907633, -5.000493,
1, -3.068832, -5.270101,
2, -2.907633, -5.000493,
2, -3.068832, -5.270101,
3, -2.907633, -5.000493,
3, -3.068832, -5.270101
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
-3, -3.391232, -5.809317, 0, -0.5, 0.5, 0.5,
-3, -3.391232, -5.809317, 1, -0.5, 0.5, 0.5,
-3, -3.391232, -5.809317, 1, 1.5, 0.5, 0.5,
-3, -3.391232, -5.809317, 0, 1.5, 0.5, 0.5,
-2, -3.391232, -5.809317, 0, -0.5, 0.5, 0.5,
-2, -3.391232, -5.809317, 1, -0.5, 0.5, 0.5,
-2, -3.391232, -5.809317, 1, 1.5, 0.5, 0.5,
-2, -3.391232, -5.809317, 0, 1.5, 0.5, 0.5,
-1, -3.391232, -5.809317, 0, -0.5, 0.5, 0.5,
-1, -3.391232, -5.809317, 1, -0.5, 0.5, 0.5,
-1, -3.391232, -5.809317, 1, 1.5, 0.5, 0.5,
-1, -3.391232, -5.809317, 0, 1.5, 0.5, 0.5,
0, -3.391232, -5.809317, 0, -0.5, 0.5, 0.5,
0, -3.391232, -5.809317, 1, -0.5, 0.5, 0.5,
0, -3.391232, -5.809317, 1, 1.5, 0.5, 0.5,
0, -3.391232, -5.809317, 0, 1.5, 0.5, 0.5,
1, -3.391232, -5.809317, 0, -0.5, 0.5, 0.5,
1, -3.391232, -5.809317, 1, -0.5, 0.5, 0.5,
1, -3.391232, -5.809317, 1, 1.5, 0.5, 0.5,
1, -3.391232, -5.809317, 0, 1.5, 0.5, 0.5,
2, -3.391232, -5.809317, 0, -0.5, 0.5, 0.5,
2, -3.391232, -5.809317, 1, -0.5, 0.5, 0.5,
2, -3.391232, -5.809317, 1, 1.5, 0.5, 0.5,
2, -3.391232, -5.809317, 0, 1.5, 0.5, 0.5,
3, -3.391232, -5.809317, 0, -0.5, 0.5, 0.5,
3, -3.391232, -5.809317, 1, -0.5, 0.5, 0.5,
3, -3.391232, -5.809317, 1, 1.5, 0.5, 0.5,
3, -3.391232, -5.809317, 0, 1.5, 0.5, 0.5
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
-3.143063, -2, -5.000493,
-3.143063, 3, -5.000493,
-3.143063, -2, -5.000493,
-3.302411, -2, -5.270101,
-3.143063, -1, -5.000493,
-3.302411, -1, -5.270101,
-3.143063, 0, -5.000493,
-3.302411, 0, -5.270101,
-3.143063, 1, -5.000493,
-3.302411, 1, -5.270101,
-3.143063, 2, -5.000493,
-3.302411, 2, -5.270101,
-3.143063, 3, -5.000493,
-3.302411, 3, -5.270101
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
-3.621108, -2, -5.809317, 0, -0.5, 0.5, 0.5,
-3.621108, -2, -5.809317, 1, -0.5, 0.5, 0.5,
-3.621108, -2, -5.809317, 1, 1.5, 0.5, 0.5,
-3.621108, -2, -5.809317, 0, 1.5, 0.5, 0.5,
-3.621108, -1, -5.809317, 0, -0.5, 0.5, 0.5,
-3.621108, -1, -5.809317, 1, -0.5, 0.5, 0.5,
-3.621108, -1, -5.809317, 1, 1.5, 0.5, 0.5,
-3.621108, -1, -5.809317, 0, 1.5, 0.5, 0.5,
-3.621108, 0, -5.809317, 0, -0.5, 0.5, 0.5,
-3.621108, 0, -5.809317, 1, -0.5, 0.5, 0.5,
-3.621108, 0, -5.809317, 1, 1.5, 0.5, 0.5,
-3.621108, 0, -5.809317, 0, 1.5, 0.5, 0.5,
-3.621108, 1, -5.809317, 0, -0.5, 0.5, 0.5,
-3.621108, 1, -5.809317, 1, -0.5, 0.5, 0.5,
-3.621108, 1, -5.809317, 1, 1.5, 0.5, 0.5,
-3.621108, 1, -5.809317, 0, 1.5, 0.5, 0.5,
-3.621108, 2, -5.809317, 0, -0.5, 0.5, 0.5,
-3.621108, 2, -5.809317, 1, -0.5, 0.5, 0.5,
-3.621108, 2, -5.809317, 1, 1.5, 0.5, 0.5,
-3.621108, 2, -5.809317, 0, 1.5, 0.5, 0.5,
-3.621108, 3, -5.809317, 0, -0.5, 0.5, 0.5,
-3.621108, 3, -5.809317, 1, -0.5, 0.5, 0.5,
-3.621108, 3, -5.809317, 1, 1.5, 0.5, 0.5,
-3.621108, 3, -5.809317, 0, 1.5, 0.5, 0.5
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
-3.143063, -2.907633, -4,
-3.143063, -2.907633, 4,
-3.143063, -2.907633, -4,
-3.302411, -3.068832, -4,
-3.143063, -2.907633, -2,
-3.302411, -3.068832, -2,
-3.143063, -2.907633, 0,
-3.302411, -3.068832, 0,
-3.143063, -2.907633, 2,
-3.302411, -3.068832, 2,
-3.143063, -2.907633, 4,
-3.302411, -3.068832, 4
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
-3.621108, -3.391232, -4, 0, -0.5, 0.5, 0.5,
-3.621108, -3.391232, -4, 1, -0.5, 0.5, 0.5,
-3.621108, -3.391232, -4, 1, 1.5, 0.5, 0.5,
-3.621108, -3.391232, -4, 0, 1.5, 0.5, 0.5,
-3.621108, -3.391232, -2, 0, -0.5, 0.5, 0.5,
-3.621108, -3.391232, -2, 1, -0.5, 0.5, 0.5,
-3.621108, -3.391232, -2, 1, 1.5, 0.5, 0.5,
-3.621108, -3.391232, -2, 0, 1.5, 0.5, 0.5,
-3.621108, -3.391232, 0, 0, -0.5, 0.5, 0.5,
-3.621108, -3.391232, 0, 1, -0.5, 0.5, 0.5,
-3.621108, -3.391232, 0, 1, 1.5, 0.5, 0.5,
-3.621108, -3.391232, 0, 0, 1.5, 0.5, 0.5,
-3.621108, -3.391232, 2, 0, -0.5, 0.5, 0.5,
-3.621108, -3.391232, 2, 1, -0.5, 0.5, 0.5,
-3.621108, -3.391232, 2, 1, 1.5, 0.5, 0.5,
-3.621108, -3.391232, 2, 0, 1.5, 0.5, 0.5,
-3.621108, -3.391232, 4, 0, -0.5, 0.5, 0.5,
-3.621108, -3.391232, 4, 1, -0.5, 0.5, 0.5,
-3.621108, -3.391232, 4, 1, 1.5, 0.5, 0.5,
-3.621108, -3.391232, 4, 0, 1.5, 0.5, 0.5
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
-3.143063, -2.907633, -5.000493,
-3.143063, 3.540351, -5.000493,
-3.143063, -2.907633, 5.78383,
-3.143063, 3.540351, 5.78383,
-3.143063, -2.907633, -5.000493,
-3.143063, -2.907633, 5.78383,
-3.143063, 3.540351, -5.000493,
-3.143063, 3.540351, 5.78383,
-3.143063, -2.907633, -5.000493,
3.230862, -2.907633, -5.000493,
-3.143063, -2.907633, 5.78383,
3.230862, -2.907633, 5.78383,
-3.143063, 3.540351, -5.000493,
3.230862, 3.540351, -5.000493,
-3.143063, 3.540351, 5.78383,
3.230862, 3.540351, 5.78383,
3.230862, -2.907633, -5.000493,
3.230862, 3.540351, -5.000493,
3.230862, -2.907633, 5.78383,
3.230862, 3.540351, 5.78383,
3.230862, -2.907633, -5.000493,
3.230862, -2.907633, 5.78383,
3.230862, 3.540351, -5.000493,
3.230862, 3.540351, 5.78383
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
var radius = 7.523349;
var distance = 33.47223;
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
mvMatrix.translate( -0.04389954, -0.3163589, -0.3916688 );
mvMatrix.scale( 1.276198, 1.261541, 0.7542794 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.47223);
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
Ethazol<-read.table("Ethazol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Ethazol$V2
```

```
## Error in eval(expr, envir, enclos): object 'Ethazol' not found
```

```r
y<-Ethazol$V3
```

```
## Error in eval(expr, envir, enclos): object 'Ethazol' not found
```

```r
z<-Ethazol$V4
```

```
## Error in eval(expr, envir, enclos): object 'Ethazol' not found
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
-3.050239, -1.355003, -2.653696, 0, 0, 1, 1, 1,
-2.847963, 1.925971, -0.4811609, 1, 0, 0, 1, 1,
-2.749374, -0.3342212, -1.248701, 1, 0, 0, 1, 1,
-2.681215, -0.886366, -2.9649, 1, 0, 0, 1, 1,
-2.551461, 0.5585173, -0.1354531, 1, 0, 0, 1, 1,
-2.509921, -0.0621058, -0.7023363, 1, 0, 0, 1, 1,
-2.481819, 0.451308, -1.976965, 0, 0, 0, 1, 1,
-2.396247, -0.5351343, -3.181215, 0, 0, 0, 1, 1,
-2.286782, -0.8050649, -2.90558, 0, 0, 0, 1, 1,
-2.258401, 0.1839046, -3.324387, 0, 0, 0, 1, 1,
-2.248637, -0.6117452, -1.787212, 0, 0, 0, 1, 1,
-2.220026, -0.3096494, -2.626496, 0, 0, 0, 1, 1,
-2.217755, 0.5650498, -3.001607, 0, 0, 0, 1, 1,
-2.18907, 0.2183473, -0.6274998, 1, 1, 1, 1, 1,
-2.163382, -0.03841862, -0.8744352, 1, 1, 1, 1, 1,
-2.133224, 1.215037, -1.133279, 1, 1, 1, 1, 1,
-2.115792, -0.1960063, -2.003049, 1, 1, 1, 1, 1,
-2.09365, 0.4838624, -0.1132663, 1, 1, 1, 1, 1,
-2.079839, -2.654194, -2.649272, 1, 1, 1, 1, 1,
-2.041646, 0.1182841, -3.151341, 1, 1, 1, 1, 1,
-2.012989, -0.2097548, -2.392733, 1, 1, 1, 1, 1,
-2.007425, -0.3956421, -2.67515, 1, 1, 1, 1, 1,
-1.975234, -0.8417417, -1.270606, 1, 1, 1, 1, 1,
-1.951501, -2.161374, -1.478831, 1, 1, 1, 1, 1,
-1.931416, -1.189445, -0.6329138, 1, 1, 1, 1, 1,
-1.902809, -0.8948803, -0.6541399, 1, 1, 1, 1, 1,
-1.897245, 0.129465, 1.773163, 1, 1, 1, 1, 1,
-1.896524, -0.9364119, -2.228067, 1, 1, 1, 1, 1,
-1.890416, 1.979857, 2.094898, 0, 0, 1, 1, 1,
-1.890004, 0.2255889, -0.1394824, 1, 0, 0, 1, 1,
-1.852112, -1.441563, -2.246863, 1, 0, 0, 1, 1,
-1.821115, 0.9424989, -2.384791, 1, 0, 0, 1, 1,
-1.809692, 1.182082, -0.7678549, 1, 0, 0, 1, 1,
-1.800358, -0.3544067, -3.778724, 1, 0, 0, 1, 1,
-1.794465, -0.4846168, -1.796565, 0, 0, 0, 1, 1,
-1.791058, -0.484208, -3.192857, 0, 0, 0, 1, 1,
-1.765258, -1.064698, -1.940906, 0, 0, 0, 1, 1,
-1.761419, 1.468937, 0.08559511, 0, 0, 0, 1, 1,
-1.740037, -0.709598, -2.726879, 0, 0, 0, 1, 1,
-1.730904, -0.4561065, -1.214353, 0, 0, 0, 1, 1,
-1.723089, -1.235389, -2.896291, 0, 0, 0, 1, 1,
-1.721978, -0.6263709, -1.520761, 1, 1, 1, 1, 1,
-1.717539, -0.7197222, -2.310879, 1, 1, 1, 1, 1,
-1.684239, 1.111064, -1.331991, 1, 1, 1, 1, 1,
-1.679301, 0.649069, -1.954457, 1, 1, 1, 1, 1,
-1.676059, 3.446448, -1.356324, 1, 1, 1, 1, 1,
-1.64947, -0.8638949, -3.193763, 1, 1, 1, 1, 1,
-1.636901, -1.091797, -1.642911, 1, 1, 1, 1, 1,
-1.632095, 1.94896, 0.5830079, 1, 1, 1, 1, 1,
-1.631435, 2.076598, -1.60223, 1, 1, 1, 1, 1,
-1.625342, -1.774071, -3.216618, 1, 1, 1, 1, 1,
-1.623071, -0.5648624, -2.954932, 1, 1, 1, 1, 1,
-1.61824, -0.2011828, -2.465621, 1, 1, 1, 1, 1,
-1.616058, 0.3788757, 1.203964, 1, 1, 1, 1, 1,
-1.612618, -0.5960938, -0.4746549, 1, 1, 1, 1, 1,
-1.608027, 0.2829384, -1.612968, 1, 1, 1, 1, 1,
-1.604919, 0.6098611, -1.787722, 0, 0, 1, 1, 1,
-1.581581, 0.280303, -0.8896788, 1, 0, 0, 1, 1,
-1.581078, 1.210262, -1.249974, 1, 0, 0, 1, 1,
-1.575673, -0.1175171, -4.099194, 1, 0, 0, 1, 1,
-1.570476, 0.8318971, 0.2163696, 1, 0, 0, 1, 1,
-1.568653, -1.001211, -3.967821, 1, 0, 0, 1, 1,
-1.556531, -1.570236, -2.551132, 0, 0, 0, 1, 1,
-1.548345, -0.5895122, -2.089432, 0, 0, 0, 1, 1,
-1.547606, -0.518065, -2.315244, 0, 0, 0, 1, 1,
-1.545186, 2.446162, 0.4759169, 0, 0, 0, 1, 1,
-1.535594, 0.7945289, -1.034347, 0, 0, 0, 1, 1,
-1.516001, 1.140777, -1.393077, 0, 0, 0, 1, 1,
-1.503837, -1.810723, -2.196726, 0, 0, 0, 1, 1,
-1.49925, 0.03467768, -0.9258304, 1, 1, 1, 1, 1,
-1.487216, -0.5406554, -3.420502, 1, 1, 1, 1, 1,
-1.480594, 0.9010879, -0.3709165, 1, 1, 1, 1, 1,
-1.475711, -0.1023947, -0.846019, 1, 1, 1, 1, 1,
-1.475148, 0.8924541, -0.6761463, 1, 1, 1, 1, 1,
-1.438518, 0.1869921, -1.903445, 1, 1, 1, 1, 1,
-1.414051, -0.9797429, -3.716511, 1, 1, 1, 1, 1,
-1.411459, 0.2743288, -3.093793, 1, 1, 1, 1, 1,
-1.407552, -0.5294687, -3.258811, 1, 1, 1, 1, 1,
-1.400919, -1.223827, -0.585739, 1, 1, 1, 1, 1,
-1.397648, 0.5917625, -2.571273, 1, 1, 1, 1, 1,
-1.395072, 0.5350435, -1.745459, 1, 1, 1, 1, 1,
-1.386666, 1.919809, -1.351098, 1, 1, 1, 1, 1,
-1.381877, -0.01097613, -2.115222, 1, 1, 1, 1, 1,
-1.377364, 0.03573847, -0.3132725, 1, 1, 1, 1, 1,
-1.373783, 0.05133669, -1.055009, 0, 0, 1, 1, 1,
-1.370809, 0.3752572, -1.588976, 1, 0, 0, 1, 1,
-1.367076, -0.04999634, -1.232003, 1, 0, 0, 1, 1,
-1.366427, -0.6276888, -1.749858, 1, 0, 0, 1, 1,
-1.358181, -0.01915829, -2.994252, 1, 0, 0, 1, 1,
-1.350547, -1.089395, -2.695895, 1, 0, 0, 1, 1,
-1.347845, 0.8250451, -1.853519, 0, 0, 0, 1, 1,
-1.347157, 0.5667463, -0.4327133, 0, 0, 0, 1, 1,
-1.341979, -0.9164063, -1.729494, 0, 0, 0, 1, 1,
-1.334497, 0.1792507, -2.479051, 0, 0, 0, 1, 1,
-1.33441, 0.5885743, -2.156822, 0, 0, 0, 1, 1,
-1.331923, -0.8347855, -2.052657, 0, 0, 0, 1, 1,
-1.330466, 0.6447622, -1.653142, 0, 0, 0, 1, 1,
-1.323655, 0.5309198, -2.822144, 1, 1, 1, 1, 1,
-1.317433, -0.4956834, -2.179196, 1, 1, 1, 1, 1,
-1.313006, 0.7569004, -2.312803, 1, 1, 1, 1, 1,
-1.311917, 1.451124, -0.3450752, 1, 1, 1, 1, 1,
-1.310986, -0.6129421, -4.201105, 1, 1, 1, 1, 1,
-1.302984, 0.4921237, -3.027067, 1, 1, 1, 1, 1,
-1.30252, 0.2076417, -1.531044, 1, 1, 1, 1, 1,
-1.302017, -0.0752656, -3.698612, 1, 1, 1, 1, 1,
-1.301897, 0.3508486, -1.899268, 1, 1, 1, 1, 1,
-1.280888, 0.7818251, 0.1441664, 1, 1, 1, 1, 1,
-1.275494, 0.1983498, -1.273429, 1, 1, 1, 1, 1,
-1.27429, -1.047795, -3.876275, 1, 1, 1, 1, 1,
-1.270817, 0.07392826, 0.5324433, 1, 1, 1, 1, 1,
-1.267857, 0.3764975, -1.139758, 1, 1, 1, 1, 1,
-1.265988, -0.7235364, -2.601062, 1, 1, 1, 1, 1,
-1.261937, -0.142715, -0.7879004, 0, 0, 1, 1, 1,
-1.260646, -1.586142, -2.601807, 1, 0, 0, 1, 1,
-1.256096, -1.587238, -2.688433, 1, 0, 0, 1, 1,
-1.250196, 1.53439, -0.2119599, 1, 0, 0, 1, 1,
-1.246893, 0.8970229, -1.082641, 1, 0, 0, 1, 1,
-1.240149, -0.3743563, -3.968727, 1, 0, 0, 1, 1,
-1.234912, 0.07433403, -3.04302, 0, 0, 0, 1, 1,
-1.231437, -0.5460572, -2.598146, 0, 0, 0, 1, 1,
-1.210951, -0.09058607, -2.193957, 0, 0, 0, 1, 1,
-1.203256, -0.7269787, -0.5795287, 0, 0, 0, 1, 1,
-1.197253, -0.5365344, -2.289333, 0, 0, 0, 1, 1,
-1.182445, 0.08734695, -1.379052, 0, 0, 0, 1, 1,
-1.17968, -0.8072776, -3.119833, 0, 0, 0, 1, 1,
-1.171159, -0.3728827, -2.346551, 1, 1, 1, 1, 1,
-1.169879, -2.728546, -1.917965, 1, 1, 1, 1, 1,
-1.159372, -0.1314374, -2.257982, 1, 1, 1, 1, 1,
-1.152916, -1.575628, -2.795053, 1, 1, 1, 1, 1,
-1.152302, -1.342883, -1.80337, 1, 1, 1, 1, 1,
-1.144896, -1.054403, -2.186148, 1, 1, 1, 1, 1,
-1.142094, -0.8792915, -0.7681427, 1, 1, 1, 1, 1,
-1.13988, -0.2592335, -1.976521, 1, 1, 1, 1, 1,
-1.136509, 0.5089747, -0.29651, 1, 1, 1, 1, 1,
-1.13295, -0.1458683, -2.447789, 1, 1, 1, 1, 1,
-1.128042, 0.3110274, -1.047047, 1, 1, 1, 1, 1,
-1.121667, -0.8705785, -2.292783, 1, 1, 1, 1, 1,
-1.118607, 1.477233, -1.417225, 1, 1, 1, 1, 1,
-1.113666, 0.1694348, -2.68213, 1, 1, 1, 1, 1,
-1.105074, 0.0584673, -1.494138, 1, 1, 1, 1, 1,
-1.104494, -2.81373, -1.359139, 0, 0, 1, 1, 1,
-1.096997, 0.03902603, -1.386585, 1, 0, 0, 1, 1,
-1.092062, 0.2741186, -0.9543298, 1, 0, 0, 1, 1,
-1.090836, 0.6697583, -1.09226, 1, 0, 0, 1, 1,
-1.07849, 1.038459, -0.820982, 1, 0, 0, 1, 1,
-1.063154, -1.198977, -2.191901, 1, 0, 0, 1, 1,
-1.061764, -2.371844, -3.581907, 0, 0, 0, 1, 1,
-1.049094, 1.061995, -1.155389, 0, 0, 0, 1, 1,
-1.047863, -0.2469323, 0.2234783, 0, 0, 0, 1, 1,
-1.042704, -1.758061, -1.32334, 0, 0, 0, 1, 1,
-1.038937, 1.165297, -1.086446, 0, 0, 0, 1, 1,
-1.034948, -0.5714461, -0.8813881, 0, 0, 0, 1, 1,
-1.029475, 1.137397, -0.9450854, 0, 0, 0, 1, 1,
-1.02161, 1.874033, 0.5760024, 1, 1, 1, 1, 1,
-1.021266, 0.03550273, -1.850262, 1, 1, 1, 1, 1,
-1.018877, -1.032246, -2.126044, 1, 1, 1, 1, 1,
-1.01668, -0.7919793, -1.687113, 1, 1, 1, 1, 1,
-1.012127, 0.07116587, -1.706816, 1, 1, 1, 1, 1,
-1.010459, 0.2722092, -1.101643, 1, 1, 1, 1, 1,
-0.9984777, -1.568898, -2.471381, 1, 1, 1, 1, 1,
-0.9970937, 0.2378571, -2.429028, 1, 1, 1, 1, 1,
-0.9967901, 0.5994805, -1.377292, 1, 1, 1, 1, 1,
-0.9948898, 0.8652048, 0.771208, 1, 1, 1, 1, 1,
-0.9929433, 0.9440272, -2.530353, 1, 1, 1, 1, 1,
-0.9898743, 1.328382, -1.497727, 1, 1, 1, 1, 1,
-0.986912, 1.626826, 0.07344216, 1, 1, 1, 1, 1,
-0.9836974, 1.380565, -0.6549391, 1, 1, 1, 1, 1,
-0.9817467, -2.316333, -3.31453, 1, 1, 1, 1, 1,
-0.9770131, 0.8135724, -1.49724, 0, 0, 1, 1, 1,
-0.9755182, 0.8286596, 0.9190974, 1, 0, 0, 1, 1,
-0.9731903, -1.427713, -3.071905, 1, 0, 0, 1, 1,
-0.9728531, -0.6355949, -2.525672, 1, 0, 0, 1, 1,
-0.9692756, -1.165779, -3.578212, 1, 0, 0, 1, 1,
-0.9675938, 0.5091397, -2.147493, 1, 0, 0, 1, 1,
-0.9603866, -0.2449128, -1.717788, 0, 0, 0, 1, 1,
-0.9543443, 0.9462859, -1.010719, 0, 0, 0, 1, 1,
-0.9431114, -0.3947167, -2.865066, 0, 0, 0, 1, 1,
-0.9417146, 1.07618, -1.959539, 0, 0, 0, 1, 1,
-0.9404686, -1.083767, -2.896392, 0, 0, 0, 1, 1,
-0.9329584, 0.437025, -1.852688, 0, 0, 0, 1, 1,
-0.9255487, -1.956399, -3.763386, 0, 0, 0, 1, 1,
-0.9203634, 0.711589, -0.8410111, 1, 1, 1, 1, 1,
-0.9129733, -0.2397514, -2.423779, 1, 1, 1, 1, 1,
-0.9119484, 0.0416403, -2.423187, 1, 1, 1, 1, 1,
-0.9115012, 0.799883, -0.3736622, 1, 1, 1, 1, 1,
-0.9077479, -0.5088598, -2.21999, 1, 1, 1, 1, 1,
-0.906451, -0.3944201, -2.064561, 1, 1, 1, 1, 1,
-0.8997691, -1.216633, -2.7806, 1, 1, 1, 1, 1,
-0.8904564, -0.3352251, -1.740437, 1, 1, 1, 1, 1,
-0.8816248, -2.038447, -3.249635, 1, 1, 1, 1, 1,
-0.8701103, -2.220949, -1.707719, 1, 1, 1, 1, 1,
-0.8656556, -1.112661, -3.239773, 1, 1, 1, 1, 1,
-0.865379, -0.09158038, -2.168907, 1, 1, 1, 1, 1,
-0.8619768, 1.408125, 0.7383397, 1, 1, 1, 1, 1,
-0.8581491, -0.06426676, -1.978162, 1, 1, 1, 1, 1,
-0.8548046, 1.833947, -0.3909613, 1, 1, 1, 1, 1,
-0.8534003, 1.962029, -0.5037687, 0, 0, 1, 1, 1,
-0.8532618, 0.9732237, 0.06920298, 1, 0, 0, 1, 1,
-0.8494273, -1.510056, -3.214376, 1, 0, 0, 1, 1,
-0.8457565, 1.406768, -2.159252, 1, 0, 0, 1, 1,
-0.8215443, -1.034475, -2.874036, 1, 0, 0, 1, 1,
-0.8174472, 1.816356, -1.40944, 1, 0, 0, 1, 1,
-0.8148846, -0.6931912, -4.278061, 0, 0, 0, 1, 1,
-0.8060439, 0.1713885, -2.423971, 0, 0, 0, 1, 1,
-0.8010606, -0.666487, -0.8115333, 0, 0, 0, 1, 1,
-0.8009377, -0.1691778, -0.9958067, 0, 0, 0, 1, 1,
-0.7990764, 1.543946, -2.594539, 0, 0, 0, 1, 1,
-0.7990054, 0.03044076, -0.8437043, 0, 0, 0, 1, 1,
-0.7953988, 0.5368156, -0.6854576, 0, 0, 0, 1, 1,
-0.7945837, -0.2593406, -1.659377, 1, 1, 1, 1, 1,
-0.7893271, -0.8456782, -1.826423, 1, 1, 1, 1, 1,
-0.7844505, -0.4712697, -1.693926, 1, 1, 1, 1, 1,
-0.7830521, 0.4531882, -0.409484, 1, 1, 1, 1, 1,
-0.7820403, -0.6956342, -1.678726, 1, 1, 1, 1, 1,
-0.7812137, -1.244991, -2.92603, 1, 1, 1, 1, 1,
-0.7784501, 1.923657, 0.5613072, 1, 1, 1, 1, 1,
-0.7779732, -0.2851976, -2.51401, 1, 1, 1, 1, 1,
-0.7747907, 0.3213053, -0.3878672, 1, 1, 1, 1, 1,
-0.773112, -0.6368923, -3.670701, 1, 1, 1, 1, 1,
-0.7691084, 1.12931, 0.06514969, 1, 1, 1, 1, 1,
-0.7685266, -0.6148213, -0.4562023, 1, 1, 1, 1, 1,
-0.7621596, -1.710594, -3.771941, 1, 1, 1, 1, 1,
-0.7611051, -1.843505, -0.8746843, 1, 1, 1, 1, 1,
-0.7598091, 1.001545, 0.3115645, 1, 1, 1, 1, 1,
-0.7594084, 0.00850013, -1.967875, 0, 0, 1, 1, 1,
-0.7561073, -0.05576739, -1.336375, 1, 0, 0, 1, 1,
-0.7559522, 1.380895, 1.226699, 1, 0, 0, 1, 1,
-0.746559, -0.4556904, -1.584742, 1, 0, 0, 1, 1,
-0.7432141, -0.3093942, -2.618642, 1, 0, 0, 1, 1,
-0.7396775, -1.133254, 0.1383296, 1, 0, 0, 1, 1,
-0.7372242, 0.696723, 1.259143, 0, 0, 0, 1, 1,
-0.736216, 0.4814704, -0.8912696, 0, 0, 0, 1, 1,
-0.7263909, -0.9191101, -3.600982, 0, 0, 0, 1, 1,
-0.7241007, -0.51396, -2.579363, 0, 0, 0, 1, 1,
-0.7162156, 2.170375, -2.23399, 0, 0, 0, 1, 1,
-0.7139251, 0.06847643, -1.01679, 0, 0, 0, 1, 1,
-0.7106176, 1.525004, 0.7338066, 0, 0, 0, 1, 1,
-0.7076871, 0.2543625, 0.04096425, 1, 1, 1, 1, 1,
-0.7073149, 0.1705612, -0.2623655, 1, 1, 1, 1, 1,
-0.704297, 1.400327, 0.3613808, 1, 1, 1, 1, 1,
-0.6925588, 1.321465, 1.391295, 1, 1, 1, 1, 1,
-0.6894863, -1.454302, -1.977316, 1, 1, 1, 1, 1,
-0.6863492, 0.3672751, -1.156138, 1, 1, 1, 1, 1,
-0.6817428, 1.342148, -1.068631, 1, 1, 1, 1, 1,
-0.6812144, -1.309857, -3.863606, 1, 1, 1, 1, 1,
-0.6747141, -1.545777, -4.054153, 1, 1, 1, 1, 1,
-0.6735535, 0.4038625, -0.123272, 1, 1, 1, 1, 1,
-0.6655889, -0.6730696, -1.766991, 1, 1, 1, 1, 1,
-0.6641901, 2.162384, 1.123861, 1, 1, 1, 1, 1,
-0.6575078, 0.8573879, 1.51451, 1, 1, 1, 1, 1,
-0.656409, -0.6475117, -3.193519, 1, 1, 1, 1, 1,
-0.6462509, -0.3893382, -3.315252, 1, 1, 1, 1, 1,
-0.6454463, 1.738084, -0.6311302, 0, 0, 1, 1, 1,
-0.6411866, 0.3367451, -1.649981, 1, 0, 0, 1, 1,
-0.6399161, -0.7969192, -1.799808, 1, 0, 0, 1, 1,
-0.6354038, -0.8666917, -4.741715, 1, 0, 0, 1, 1,
-0.6344318, 2.055494, 0.5305482, 1, 0, 0, 1, 1,
-0.6337314, 1.106218, -0.7461239, 1, 0, 0, 1, 1,
-0.6295541, 0.5070438, -1.312579, 0, 0, 0, 1, 1,
-0.6271277, -1.72932, -2.04976, 0, 0, 0, 1, 1,
-0.6227112, -0.5535627, -2.140441, 0, 0, 0, 1, 1,
-0.6220888, -2.221416, -2.261848, 0, 0, 0, 1, 1,
-0.6220648, 0.4874244, -0.8762957, 0, 0, 0, 1, 1,
-0.6209207, -0.1147833, -4.543936, 0, 0, 0, 1, 1,
-0.619479, 0.2659295, -2.037646, 0, 0, 0, 1, 1,
-0.6182197, -0.7038334, -2.401398, 1, 1, 1, 1, 1,
-0.6157095, 1.965712, -1.367224, 1, 1, 1, 1, 1,
-0.6154445, 1.045193, -0.5404813, 1, 1, 1, 1, 1,
-0.6126963, -0.2103732, -4.478291, 1, 1, 1, 1, 1,
-0.6083562, 0.1902662, -1.150272, 1, 1, 1, 1, 1,
-0.6076507, -1.734158, -3.666522, 1, 1, 1, 1, 1,
-0.6075692, 1.00589, 0.7770782, 1, 1, 1, 1, 1,
-0.6061863, -0.3446811, -1.346877, 1, 1, 1, 1, 1,
-0.6053047, -0.3158264, -1.467471, 1, 1, 1, 1, 1,
-0.6036173, -1.437796, -3.026167, 1, 1, 1, 1, 1,
-0.600022, 0.6395935, -0.3752355, 1, 1, 1, 1, 1,
-0.59751, 0.3986146, -1.94408, 1, 1, 1, 1, 1,
-0.5955665, -0.08291322, -1.710727, 1, 1, 1, 1, 1,
-0.5941114, 0.6472355, -0.5733118, 1, 1, 1, 1, 1,
-0.5923418, 0.7290006, 0.5550665, 1, 1, 1, 1, 1,
-0.591067, -0.8760081, -2.768964, 0, 0, 1, 1, 1,
-0.5899921, -0.2418297, -2.661478, 1, 0, 0, 1, 1,
-0.5873176, -1.421888, -3.631539, 1, 0, 0, 1, 1,
-0.5849193, 0.7661093, -0.2754113, 1, 0, 0, 1, 1,
-0.5823665, 0.588571, -0.1481132, 1, 0, 0, 1, 1,
-0.5820895, -0.7871715, -2.293853, 1, 0, 0, 1, 1,
-0.5801082, 0.74939, -1.666771, 0, 0, 0, 1, 1,
-0.5775855, -1.292061, -2.463736, 0, 0, 0, 1, 1,
-0.5743955, -0.2647699, -1.987034, 0, 0, 0, 1, 1,
-0.5708233, 1.003602, -0.09534682, 0, 0, 0, 1, 1,
-0.567635, 0.2938236, -1.214981, 0, 0, 0, 1, 1,
-0.5595416, -1.204699, -1.461884, 0, 0, 0, 1, 1,
-0.5577786, -0.1558223, -4.499476, 0, 0, 0, 1, 1,
-0.5559149, -0.01536361, -0.8185624, 1, 1, 1, 1, 1,
-0.5505999, 2.301014, -0.8351415, 1, 1, 1, 1, 1,
-0.5442178, 0.7800792, -0.857943, 1, 1, 1, 1, 1,
-0.5425977, -1.581645, -4.618232, 1, 1, 1, 1, 1,
-0.5413643, 0.2800779, -2.04399, 1, 1, 1, 1, 1,
-0.5406494, 1.121867, -1.148728, 1, 1, 1, 1, 1,
-0.5374443, -0.5909091, -3.138952, 1, 1, 1, 1, 1,
-0.535395, 1.10297, 0.1998329, 1, 1, 1, 1, 1,
-0.5338915, 1.194908, 0.3199098, 1, 1, 1, 1, 1,
-0.5332668, -0.5954401, -2.654935, 1, 1, 1, 1, 1,
-0.531484, 1.0713, 0.5297619, 1, 1, 1, 1, 1,
-0.5312063, 0.5472147, -1.406822, 1, 1, 1, 1, 1,
-0.5296935, -0.4459194, -4.331731, 1, 1, 1, 1, 1,
-0.5266941, -1.437542, -2.150199, 1, 1, 1, 1, 1,
-0.5251223, -0.4829746, -2.953939, 1, 1, 1, 1, 1,
-0.5224825, 1.448315, -0.359498, 0, 0, 1, 1, 1,
-0.5210254, -0.6827611, -2.49144, 1, 0, 0, 1, 1,
-0.5179186, 0.5675077, -0.4117881, 1, 0, 0, 1, 1,
-0.5096961, -1.688544, -3.961231, 1, 0, 0, 1, 1,
-0.5077574, -0.2750063, -1.567554, 1, 0, 0, 1, 1,
-0.5036157, 1.106816, -1.632876, 1, 0, 0, 1, 1,
-0.4978119, 0.3613295, -4.241627, 0, 0, 0, 1, 1,
-0.4958543, 0.01016649, -1.843493, 0, 0, 0, 1, 1,
-0.4894595, -1.319753, -2.288733, 0, 0, 0, 1, 1,
-0.4885139, 1.539171, -0.4648687, 0, 0, 0, 1, 1,
-0.4876027, 0.4055254, -1.259676, 0, 0, 0, 1, 1,
-0.486941, 2.182447, 0.7271506, 0, 0, 0, 1, 1,
-0.485599, 0.4593728, 1.208921, 0, 0, 0, 1, 1,
-0.4820385, -0.2951568, -1.941044, 1, 1, 1, 1, 1,
-0.4807613, 0.7570028, -0.1114095, 1, 1, 1, 1, 1,
-0.4789823, 2.356085, -0.09906988, 1, 1, 1, 1, 1,
-0.4785735, -0.9488457, -3.740337, 1, 1, 1, 1, 1,
-0.4779312, 0.1703043, -1.839317, 1, 1, 1, 1, 1,
-0.4777161, -1.2027, -3.062019, 1, 1, 1, 1, 1,
-0.4764372, 1.55645, 1.75009, 1, 1, 1, 1, 1,
-0.4761088, 0.3913938, -0.4178846, 1, 1, 1, 1, 1,
-0.4723162, -0.0722193, -3.705792, 1, 1, 1, 1, 1,
-0.4707821, -2.295022, -2.998266, 1, 1, 1, 1, 1,
-0.4707741, -0.7065856, -2.06039, 1, 1, 1, 1, 1,
-0.4706272, 0.2253155, -0.3708833, 1, 1, 1, 1, 1,
-0.4665107, -0.9273079, -2.021211, 1, 1, 1, 1, 1,
-0.4631233, 1.326429, 1.003814, 1, 1, 1, 1, 1,
-0.4578995, 0.4267164, -2.897499, 1, 1, 1, 1, 1,
-0.455476, -0.5565258, -2.47216, 0, 0, 1, 1, 1,
-0.4516535, 0.2342586, -0.4395049, 1, 0, 0, 1, 1,
-0.449419, -1.920583, -1.85447, 1, 0, 0, 1, 1,
-0.4383896, -0.8597564, -4.843439, 1, 0, 0, 1, 1,
-0.4369287, -0.2819475, -2.703078, 1, 0, 0, 1, 1,
-0.4185788, -0.02506969, -2.819078, 1, 0, 0, 1, 1,
-0.4152825, 0.4915099, 0.4428973, 0, 0, 0, 1, 1,
-0.4128677, 1.12271, -0.08970276, 0, 0, 0, 1, 1,
-0.4054297, -0.8178183, -3.156398, 0, 0, 0, 1, 1,
-0.4023814, -0.7886698, -2.195187, 0, 0, 0, 1, 1,
-0.4017725, 0.6497158, -0.266584, 0, 0, 0, 1, 1,
-0.4014336, 0.2509255, -0.1644821, 0, 0, 0, 1, 1,
-0.3989384, -1.125044, -0.2750846, 0, 0, 0, 1, 1,
-0.3970359, 0.06366512, -0.8341078, 1, 1, 1, 1, 1,
-0.393921, -0.5260302, -3.186471, 1, 1, 1, 1, 1,
-0.3908359, 1.287868, -1.59165, 1, 1, 1, 1, 1,
-0.3880787, 0.2064777, -1.181656, 1, 1, 1, 1, 1,
-0.3838517, -1.611655, -4.19078, 1, 1, 1, 1, 1,
-0.3826579, 0.9061731, -0.9866324, 1, 1, 1, 1, 1,
-0.3824934, -1.26126, -2.770133, 1, 1, 1, 1, 1,
-0.3817407, -0.2397788, -2.592888, 1, 1, 1, 1, 1,
-0.3815681, 0.8372647, -0.6949055, 1, 1, 1, 1, 1,
-0.3795898, 0.301862, -0.1974874, 1, 1, 1, 1, 1,
-0.3773874, 1.356508, -2.270853, 1, 1, 1, 1, 1,
-0.3734584, 0.3301182, -0.3610553, 1, 1, 1, 1, 1,
-0.3703615, -0.4370663, -1.969569, 1, 1, 1, 1, 1,
-0.3689882, -0.634151, -1.70058, 1, 1, 1, 1, 1,
-0.3689308, 0.4150765, -1.601947, 1, 1, 1, 1, 1,
-0.3668672, -0.1303405, -2.731467, 0, 0, 1, 1, 1,
-0.3643241, -0.6639571, -2.47472, 1, 0, 0, 1, 1,
-0.3628457, 0.5142198, -1.321462, 1, 0, 0, 1, 1,
-0.3627118, -0.2541621, -1.748589, 1, 0, 0, 1, 1,
-0.3619778, 0.9656483, 1.234354, 1, 0, 0, 1, 1,
-0.3580321, 0.7263948, -0.948334, 1, 0, 0, 1, 1,
-0.3537444, -0.3783953, -2.080768, 0, 0, 0, 1, 1,
-0.352043, -0.07358006, -0.6561283, 0, 0, 0, 1, 1,
-0.3513332, -0.652078, -0.7800484, 0, 0, 0, 1, 1,
-0.3474995, -0.118669, -0.4844952, 0, 0, 0, 1, 1,
-0.3469327, -0.1904927, -1.732868, 0, 0, 0, 1, 1,
-0.3454077, -1.026787, -3.58742, 0, 0, 0, 1, 1,
-0.3370358, 0.3396675, 0.6350118, 0, 0, 0, 1, 1,
-0.3347209, -0.08143528, -3.864928, 1, 1, 1, 1, 1,
-0.3339886, -0.2310117, -2.682995, 1, 1, 1, 1, 1,
-0.3294708, 0.3054368, -0.02560125, 1, 1, 1, 1, 1,
-0.3262219, -0.2583425, -3.294259, 1, 1, 1, 1, 1,
-0.3252536, -0.8007825, -2.394718, 1, 1, 1, 1, 1,
-0.323659, 0.667647, -0.5715945, 1, 1, 1, 1, 1,
-0.3233637, -0.06351127, -1.943464, 1, 1, 1, 1, 1,
-0.3218382, 0.8798259, -0.3495873, 1, 1, 1, 1, 1,
-0.3181747, 1.437311, 1.330261, 1, 1, 1, 1, 1,
-0.3178158, 0.5815279, -0.7060528, 1, 1, 1, 1, 1,
-0.315531, -1.812679, -2.381713, 1, 1, 1, 1, 1,
-0.3137132, 0.7364629, -2.162746, 1, 1, 1, 1, 1,
-0.3135366, 0.4942167, 0.7212231, 1, 1, 1, 1, 1,
-0.3116767, 0.03652019, -2.85336, 1, 1, 1, 1, 1,
-0.3088388, 0.8368291, 0.2595479, 1, 1, 1, 1, 1,
-0.3076288, -0.4670467, -3.157567, 0, 0, 1, 1, 1,
-0.3047962, 0.2218776, -2.260517, 1, 0, 0, 1, 1,
-0.3045667, -1.408148, -0.3079119, 1, 0, 0, 1, 1,
-0.300163, -1.064313, -2.452153, 1, 0, 0, 1, 1,
-0.2986388, -0.1823485, -0.3533042, 1, 0, 0, 1, 1,
-0.2979494, 0.5076065, -0.2214183, 1, 0, 0, 1, 1,
-0.2957597, -1.30678, -2.132655, 0, 0, 0, 1, 1,
-0.2954936, -1.130524, -2.538904, 0, 0, 0, 1, 1,
-0.2950911, 0.1078753, 0.03180827, 0, 0, 0, 1, 1,
-0.2922242, 0.6695996, -0.01261357, 0, 0, 0, 1, 1,
-0.289003, 1.354536, -1.411181, 0, 0, 0, 1, 1,
-0.2852457, -0.180005, 0.2147757, 0, 0, 0, 1, 1,
-0.2849081, 0.697929, -0.9863683, 0, 0, 0, 1, 1,
-0.2805922, 0.2972199, -0.5314608, 1, 1, 1, 1, 1,
-0.2786538, -0.06925071, -3.828932, 1, 1, 1, 1, 1,
-0.2766579, 0.3129514, 0.2649385, 1, 1, 1, 1, 1,
-0.2735032, -0.3710919, -1.888038, 1, 1, 1, 1, 1,
-0.272601, -2.366055, -3.663821, 1, 1, 1, 1, 1,
-0.2691648, -2.187234, -4.12141, 1, 1, 1, 1, 1,
-0.2660792, -0.4477371, -3.360948, 1, 1, 1, 1, 1,
-0.2635686, -0.6405107, -1.979846, 1, 1, 1, 1, 1,
-0.2633415, 1.198519, -0.2168732, 1, 1, 1, 1, 1,
-0.2629661, 1.149344, -0.1725971, 1, 1, 1, 1, 1,
-0.2597139, 2.181781, 0.09953748, 1, 1, 1, 1, 1,
-0.2568437, -1.366971, -3.476777, 1, 1, 1, 1, 1,
-0.2564915, 1.87208, 0.4266215, 1, 1, 1, 1, 1,
-0.2538115, -0.3396897, -0.3789658, 1, 1, 1, 1, 1,
-0.2537074, 1.091913, -1.081616, 1, 1, 1, 1, 1,
-0.2533853, 0.3073424, -1.518456, 0, 0, 1, 1, 1,
-0.2519881, 0.4253596, 0.6762533, 1, 0, 0, 1, 1,
-0.2515686, 0.9902763, 0.8306489, 1, 0, 0, 1, 1,
-0.2497616, 0.1114927, -0.8794978, 1, 0, 0, 1, 1,
-0.2484518, 0.06192988, 0.4746124, 1, 0, 0, 1, 1,
-0.2454868, -0.5014594, -2.03547, 1, 0, 0, 1, 1,
-0.2445051, -0.487493, -3.419986, 0, 0, 0, 1, 1,
-0.2428486, -0.18419, -2.862821, 0, 0, 0, 1, 1,
-0.2425306, -0.5094916, -3.160479, 0, 0, 0, 1, 1,
-0.2422753, -1.291451, -3.229808, 0, 0, 0, 1, 1,
-0.2346918, -0.5870433, -1.586307, 0, 0, 0, 1, 1,
-0.231843, 0.8415458, -0.3264834, 0, 0, 0, 1, 1,
-0.2314768, 0.3129336, 0.586071, 0, 0, 0, 1, 1,
-0.2301927, 0.776633, -0.3677528, 1, 1, 1, 1, 1,
-0.2294491, 0.8713662, -1.258867, 1, 1, 1, 1, 1,
-0.2269183, 0.4204721, -0.9244339, 1, 1, 1, 1, 1,
-0.218324, 0.8413416, -0.03565383, 1, 1, 1, 1, 1,
-0.2166543, -0.04206096, -1.262074, 1, 1, 1, 1, 1,
-0.2127024, 0.9417512, -1.42832, 1, 1, 1, 1, 1,
-0.2124012, 1.445755, 0.4819038, 1, 1, 1, 1, 1,
-0.2103731, 0.2000723, 0.06876796, 1, 1, 1, 1, 1,
-0.2073401, 0.9135316, 0.5143132, 1, 1, 1, 1, 1,
-0.2058805, 0.6880286, -1.545719, 1, 1, 1, 1, 1,
-0.2035031, 1.464806, 0.6219049, 1, 1, 1, 1, 1,
-0.2009086, 0.8820402, -1.3672, 1, 1, 1, 1, 1,
-0.1981644, -1.104624, -1.684114, 1, 1, 1, 1, 1,
-0.1969319, -1.000278, -3.403053, 1, 1, 1, 1, 1,
-0.1939092, -1.721806, -4.302993, 1, 1, 1, 1, 1,
-0.1910113, 0.8056365, -0.5283933, 0, 0, 1, 1, 1,
-0.1859919, 0.5973392, -0.178629, 1, 0, 0, 1, 1,
-0.1854958, -0.9069629, -2.716789, 1, 0, 0, 1, 1,
-0.1848461, -2.156602, -2.237631, 1, 0, 0, 1, 1,
-0.1802709, -0.3444499, -0.2249994, 1, 0, 0, 1, 1,
-0.1799479, 0.1616678, -0.7086138, 1, 0, 0, 1, 1,
-0.1760716, -0.2227723, -3.215534, 0, 0, 0, 1, 1,
-0.1670064, 2.050065, -0.1105675, 0, 0, 0, 1, 1,
-0.1645456, -0.8607519, -3.343226, 0, 0, 0, 1, 1,
-0.1642508, -0.9160194, -4.585394, 0, 0, 0, 1, 1,
-0.1623478, -0.1427028, -1.880432, 0, 0, 0, 1, 1,
-0.1600845, -1.286005, -2.356403, 0, 0, 0, 1, 1,
-0.1511102, 0.4445076, -0.670742, 0, 0, 0, 1, 1,
-0.1502137, 0.2999861, -1.412212, 1, 1, 1, 1, 1,
-0.1440881, -0.4816776, -3.501219, 1, 1, 1, 1, 1,
-0.1406275, 0.6166815, -0.4552158, 1, 1, 1, 1, 1,
-0.1349227, -0.5588014, -3.228295, 1, 1, 1, 1, 1,
-0.1340159, -0.5460401, -3.443725, 1, 1, 1, 1, 1,
-0.1262179, -1.395208, -2.262646, 1, 1, 1, 1, 1,
-0.1261354, 0.5834274, -3.137605, 1, 1, 1, 1, 1,
-0.1186639, -0.5189956, -3.970831, 1, 1, 1, 1, 1,
-0.1128983, 0.06647316, -1.739129, 1, 1, 1, 1, 1,
-0.1110695, -0.6762815, -4.410008, 1, 1, 1, 1, 1,
-0.1085156, 1.232625, 0.8478728, 1, 1, 1, 1, 1,
-0.1048696, -0.2896483, -2.763168, 1, 1, 1, 1, 1,
-0.1016567, 0.9156548, -0.880181, 1, 1, 1, 1, 1,
-0.101557, -2.525894, -2.395574, 1, 1, 1, 1, 1,
-0.1009872, 0.06462589, -1.262669, 1, 1, 1, 1, 1,
-0.1001333, 2.025979, 0.1792055, 0, 0, 1, 1, 1,
-0.0997458, 1.533359, 0.9818464, 1, 0, 0, 1, 1,
-0.09941542, 0.2244775, -1.426893, 1, 0, 0, 1, 1,
-0.09884564, -1.077627, -4.255448, 1, 0, 0, 1, 1,
-0.09693571, 0.9197541, 0.9303719, 1, 0, 0, 1, 1,
-0.09418206, 1.142437, -0.960912, 1, 0, 0, 1, 1,
-0.09365167, 0.5701069, 0.7389978, 0, 0, 0, 1, 1,
-0.08511898, 0.2641029, 0.9946054, 0, 0, 0, 1, 1,
-0.08056427, 1.743219, 0.8227159, 0, 0, 0, 1, 1,
-0.07226116, -0.0688424, -2.161412, 0, 0, 0, 1, 1,
-0.06451087, -0.8054762, -1.883114, 0, 0, 0, 1, 1,
-0.05747972, 1.189752, 0.5857211, 0, 0, 0, 1, 1,
-0.05551605, -1.041939, -3.632631, 0, 0, 0, 1, 1,
-0.05528721, -0.2568942, -1.092203, 1, 1, 1, 1, 1,
-0.05304731, 0.6101053, 0.146791, 1, 1, 1, 1, 1,
-0.05244138, -1.44605, -3.244198, 1, 1, 1, 1, 1,
-0.05173716, 1.152762, -0.5255338, 1, 1, 1, 1, 1,
-0.05142009, -1.29637, -4.181771, 1, 1, 1, 1, 1,
-0.04785636, 0.4233094, 0.1842566, 1, 1, 1, 1, 1,
-0.04774904, -0.8004007, -4.056345, 1, 1, 1, 1, 1,
-0.04128789, 0.7970458, -0.5792966, 1, 1, 1, 1, 1,
-0.04099757, 0.8345938, -1.432624, 1, 1, 1, 1, 1,
-0.03986908, 0.3246843, -1.154272, 1, 1, 1, 1, 1,
-0.03801896, 0.06308823, -1.185409, 1, 1, 1, 1, 1,
-0.03753986, -2.131881, -1.031741, 1, 1, 1, 1, 1,
-0.03537081, -1.079374, -2.632625, 1, 1, 1, 1, 1,
-0.03398538, 0.560658, -1.355933, 1, 1, 1, 1, 1,
-0.0337447, -1.420132, -4.29503, 1, 1, 1, 1, 1,
-0.02620736, -1.38402, -3.234112, 0, 0, 1, 1, 1,
-0.02573298, -0.5504645, -2.768362, 1, 0, 0, 1, 1,
-0.02220597, -0.3590716, -4.442681, 1, 0, 0, 1, 1,
-0.01848828, -0.6796532, -1.339625, 1, 0, 0, 1, 1,
-0.0145584, 0.1659648, -0.3936565, 1, 0, 0, 1, 1,
-0.0145246, -0.4457421, -3.783522, 1, 0, 0, 1, 1,
-0.01070187, 1.555816, 1.207295, 0, 0, 0, 1, 1,
-0.007557281, -1.753507, -1.396057, 0, 0, 0, 1, 1,
-0.006931472, -0.2389106, -3.798939, 0, 0, 0, 1, 1,
-0.006927344, 0.960583, -1.643218, 0, 0, 0, 1, 1,
-0.006460253, 0.9002301, 0.8753633, 0, 0, 0, 1, 1,
-0.006259835, -0.1507989, -3.383243, 0, 0, 0, 1, 1,
-0.003111937, 1.315281, -0.6992309, 0, 0, 0, 1, 1,
0.0005802865, -1.458167, 1.837567, 1, 1, 1, 1, 1,
0.006970147, 0.4013068, -0.5387288, 1, 1, 1, 1, 1,
0.009959994, -1.667922, 2.852055, 1, 1, 1, 1, 1,
0.01194552, -1.463803, 2.927302, 1, 1, 1, 1, 1,
0.0147623, -0.3822773, 1.092687, 1, 1, 1, 1, 1,
0.01556556, 0.3080209, 0.2357281, 1, 1, 1, 1, 1,
0.01647616, -0.308351, 2.953293, 1, 1, 1, 1, 1,
0.01841542, -0.9337703, 2.708314, 1, 1, 1, 1, 1,
0.02060438, 2.117224, 1.831763, 1, 1, 1, 1, 1,
0.02782327, 0.544805, 0.2471412, 1, 1, 1, 1, 1,
0.04003235, 0.3737963, 0.2971234, 1, 1, 1, 1, 1,
0.0436838, 0.2838897, 0.6987383, 1, 1, 1, 1, 1,
0.0440263, 0.8263472, -0.4736341, 1, 1, 1, 1, 1,
0.0504499, -0.1285983, 5.022207, 1, 1, 1, 1, 1,
0.05101312, -1.375482, 2.729618, 1, 1, 1, 1, 1,
0.05128854, -1.905085, 2.646723, 0, 0, 1, 1, 1,
0.06052263, 0.6387154, 1.055054, 1, 0, 0, 1, 1,
0.06857461, -0.4963528, 1.502053, 1, 0, 0, 1, 1,
0.07282303, 0.09679015, 0.7351779, 1, 0, 0, 1, 1,
0.0840153, -0.6645053, 2.805648, 1, 0, 0, 1, 1,
0.08922771, -0.6277939, 3.516311, 1, 0, 0, 1, 1,
0.09153014, -0.3719138, 3.628446, 0, 0, 0, 1, 1,
0.09196778, -0.9006379, 2.916123, 0, 0, 0, 1, 1,
0.09230906, -1.151536, 3.297091, 0, 0, 0, 1, 1,
0.09629502, -0.6891446, 2.500582, 0, 0, 0, 1, 1,
0.1033421, 0.389564, 1.889034, 0, 0, 0, 1, 1,
0.1105714, 0.3482183, 0.1622193, 0, 0, 0, 1, 1,
0.1141194, 1.05082, 0.5880867, 0, 0, 0, 1, 1,
0.1219041, -0.06123974, 1.253749, 1, 1, 1, 1, 1,
0.1219864, 0.4566387, 0.8880275, 1, 1, 1, 1, 1,
0.1236114, 0.1811093, 1.333649, 1, 1, 1, 1, 1,
0.1253435, 0.5560444, -0.1840412, 1, 1, 1, 1, 1,
0.1254543, 1.196921, -0.5598368, 1, 1, 1, 1, 1,
0.1285518, 1.188998, -0.6712905, 1, 1, 1, 1, 1,
0.1294575, -2.079904, 2.21899, 1, 1, 1, 1, 1,
0.1363533, -1.652771, 2.684904, 1, 1, 1, 1, 1,
0.1379379, 0.8233728, -0.4884067, 1, 1, 1, 1, 1,
0.1385034, 1.699916, 0.4060219, 1, 1, 1, 1, 1,
0.1395992, -1.837448, 3.188713, 1, 1, 1, 1, 1,
0.1408177, 1.353434, -0.3567404, 1, 1, 1, 1, 1,
0.1446383, 0.3896754, -0.7124926, 1, 1, 1, 1, 1,
0.1518874, -0.92234, 5.177783, 1, 1, 1, 1, 1,
0.1534577, 1.458615, 0.8979157, 1, 1, 1, 1, 1,
0.1605867, -0.4810106, 1.70734, 0, 0, 1, 1, 1,
0.1661114, -0.6154533, 2.528996, 1, 0, 0, 1, 1,
0.1712078, -1.21924, 3.136572, 1, 0, 0, 1, 1,
0.1771195, 0.6558949, 1.11583, 1, 0, 0, 1, 1,
0.1774197, -0.7482333, 2.136284, 1, 0, 0, 1, 1,
0.1824665, 0.06849591, 1.403783, 1, 0, 0, 1, 1,
0.1869025, 0.7963898, -0.6630143, 0, 0, 0, 1, 1,
0.2013986, -0.02841014, 1.914479, 0, 0, 0, 1, 1,
0.2051974, -0.4334894, 2.751951, 0, 0, 0, 1, 1,
0.2064631, 0.2666201, 0.5803326, 0, 0, 0, 1, 1,
0.2086716, 1.684643, 0.8533138, 0, 0, 0, 1, 1,
0.2143927, -0.635396, 4.713971, 0, 0, 0, 1, 1,
0.2144191, 0.7256964, 2.018783, 0, 0, 0, 1, 1,
0.2147559, 0.2595531, 2.250509, 1, 1, 1, 1, 1,
0.2231585, 0.3949704, 1.008751, 1, 1, 1, 1, 1,
0.2244548, 0.4273486, 1.937383, 1, 1, 1, 1, 1,
0.2246252, -0.915656, 1.364307, 1, 1, 1, 1, 1,
0.2269935, -1.031497, 3.077498, 1, 1, 1, 1, 1,
0.2274541, 0.4101395, -1.559708, 1, 1, 1, 1, 1,
0.2284054, 1.502186, 0.9473079, 1, 1, 1, 1, 1,
0.2327007, 1.584672, -0.3069487, 1, 1, 1, 1, 1,
0.2330832, 1.060725, -0.8324235, 1, 1, 1, 1, 1,
0.2359128, -0.06198348, 2.103938, 1, 1, 1, 1, 1,
0.2398485, -0.8470348, 3.24255, 1, 1, 1, 1, 1,
0.2438194, -0.8694974, 2.841101, 1, 1, 1, 1, 1,
0.246085, -0.2021661, 3.919167, 1, 1, 1, 1, 1,
0.2472483, -0.7830517, 3.093024, 1, 1, 1, 1, 1,
0.2519183, 1.415712, -0.7043272, 1, 1, 1, 1, 1,
0.2567031, -1.146132, 2.134623, 0, 0, 1, 1, 1,
0.257221, 2.281137, -1.266337, 1, 0, 0, 1, 1,
0.2600541, 1.555265, -1.540644, 1, 0, 0, 1, 1,
0.2608619, -0.7678003, 2.563952, 1, 0, 0, 1, 1,
0.26264, -0.8605925, 3.905142, 1, 0, 0, 1, 1,
0.276426, -0.7350165, 0.8640835, 1, 0, 0, 1, 1,
0.2766407, -0.237655, 2.783049, 0, 0, 0, 1, 1,
0.2809261, 1.153291, 1.384782, 0, 0, 0, 1, 1,
0.2881461, 0.1947731, 0.8820741, 0, 0, 0, 1, 1,
0.2968043, 0.951915, -0.176918, 0, 0, 0, 1, 1,
0.2969944, 0.6479982, 0.6312949, 0, 0, 0, 1, 1,
0.2979828, -1.235927, 2.222708, 0, 0, 0, 1, 1,
0.3010042, 1.285645, 1.605333, 0, 0, 0, 1, 1,
0.3023714, -1.194093, 1.984478, 1, 1, 1, 1, 1,
0.3034033, -0.3939106, 1.467405, 1, 1, 1, 1, 1,
0.3051291, 0.254258, 1.572885, 1, 1, 1, 1, 1,
0.3057755, 0.2616721, 1.036384, 1, 1, 1, 1, 1,
0.3061277, -1.193469, 2.808182, 1, 1, 1, 1, 1,
0.3082928, -0.10827, 1.596554, 1, 1, 1, 1, 1,
0.3209389, -0.6187025, 2.200241, 1, 1, 1, 1, 1,
0.3224769, 0.2754581, 1.995986, 1, 1, 1, 1, 1,
0.3234152, -1.818904, 2.851591, 1, 1, 1, 1, 1,
0.3257686, 0.5173963, 0.3210339, 1, 1, 1, 1, 1,
0.3296596, 1.219679, 0.6291918, 1, 1, 1, 1, 1,
0.3358213, 0.2917002, 0.4633277, 1, 1, 1, 1, 1,
0.3391811, -0.07140841, 1.303754, 1, 1, 1, 1, 1,
0.3400865, 0.5262038, 0.650478, 1, 1, 1, 1, 1,
0.3405553, 2.16297, -0.1989724, 1, 1, 1, 1, 1,
0.3419495, 0.2743275, 0.7199277, 0, 0, 1, 1, 1,
0.3439912, -1.33677, 3.348835, 1, 0, 0, 1, 1,
0.3457125, 0.07199574, 1.645093, 1, 0, 0, 1, 1,
0.3480792, -0.5874677, 2.489007, 1, 0, 0, 1, 1,
0.3505736, 0.4725985, 0.644948, 1, 0, 0, 1, 1,
0.3524667, 0.6471863, -0.04845063, 1, 0, 0, 1, 1,
0.3542712, 1.417755, -0.6251547, 0, 0, 0, 1, 1,
0.3556526, 0.9644128, 0.6605657, 0, 0, 0, 1, 1,
0.3578477, 0.47616, 0.3196153, 0, 0, 0, 1, 1,
0.3595279, 1.350452, 1.028066, 0, 0, 0, 1, 1,
0.361539, -0.242607, 2.886572, 0, 0, 0, 1, 1,
0.3636824, 0.1538589, 2.966972, 0, 0, 0, 1, 1,
0.3667223, -0.916274, 2.455447, 0, 0, 0, 1, 1,
0.3701364, -0.3080599, 4.142638, 1, 1, 1, 1, 1,
0.374105, -0.02835745, 0.67214, 1, 1, 1, 1, 1,
0.3752629, -0.320706, 2.949608, 1, 1, 1, 1, 1,
0.3765131, 1.062981, 1.000577, 1, 1, 1, 1, 1,
0.3798514, -0.3348177, 2.292871, 1, 1, 1, 1, 1,
0.3820023, -0.4880283, 2.439379, 1, 1, 1, 1, 1,
0.3836036, -1.478198, 0.721769, 1, 1, 1, 1, 1,
0.3837968, 0.4959296, -0.6814108, 1, 1, 1, 1, 1,
0.3845512, 1.111014, -0.002937645, 1, 1, 1, 1, 1,
0.3946357, 0.0400728, 2.38344, 1, 1, 1, 1, 1,
0.3950608, -0.823813, 2.271904, 1, 1, 1, 1, 1,
0.3970001, 0.2047605, 1.145923, 1, 1, 1, 1, 1,
0.3982012, -0.2863956, 1.149715, 1, 1, 1, 1, 1,
0.4020382, 0.4715879, 1.251708, 1, 1, 1, 1, 1,
0.4056942, 0.1394846, 2.052037, 1, 1, 1, 1, 1,
0.4072152, 1.067236, 2.12737, 0, 0, 1, 1, 1,
0.40779, -2.078686, 3.29209, 1, 0, 0, 1, 1,
0.4090058, 0.792676, 0.6317192, 1, 0, 0, 1, 1,
0.4094119, 0.6628453, -0.5781536, 1, 0, 0, 1, 1,
0.4118028, -1.448486, 3.920451, 1, 0, 0, 1, 1,
0.4148349, -0.5566379, 1.875831, 1, 0, 0, 1, 1,
0.4190448, 0.9524093, -0.2064696, 0, 0, 0, 1, 1,
0.4192206, -0.5238402, 1.990472, 0, 0, 0, 1, 1,
0.4195427, 0.7230858, 1.762555, 0, 0, 0, 1, 1,
0.429447, -0.6116427, 1.908447, 0, 0, 0, 1, 1,
0.4356081, 0.0116474, 0.1794656, 0, 0, 0, 1, 1,
0.4399456, 1.404441, 0.6267607, 0, 0, 0, 1, 1,
0.4430512, -0.6128503, 1.495679, 0, 0, 0, 1, 1,
0.4462913, -0.3780534, 2.303434, 1, 1, 1, 1, 1,
0.4488235, 0.2108158, 1.769401, 1, 1, 1, 1, 1,
0.4492774, -0.6641995, 2.228132, 1, 1, 1, 1, 1,
0.4501033, 0.4461072, 1.031729, 1, 1, 1, 1, 1,
0.4502031, 0.05524012, 0.4608513, 1, 1, 1, 1, 1,
0.452552, 0.4029221, -0.2309269, 1, 1, 1, 1, 1,
0.4541631, -0.3572336, 2.575543, 1, 1, 1, 1, 1,
0.4597162, 0.2838211, 0.5897231, 1, 1, 1, 1, 1,
0.4619578, -0.6640068, 2.792561, 1, 1, 1, 1, 1,
0.4622165, -0.1670167, 1.744483, 1, 1, 1, 1, 1,
0.462355, -0.4252388, 1.467741, 1, 1, 1, 1, 1,
0.4632097, 0.6784177, 0.3669411, 1, 1, 1, 1, 1,
0.4637685, -0.9727573, 1.780922, 1, 1, 1, 1, 1,
0.4645375, 0.5794549, 0.9847826, 1, 1, 1, 1, 1,
0.4683817, 0.3787435, 0.1229231, 1, 1, 1, 1, 1,
0.4692163, -0.1159905, 2.423817, 0, 0, 1, 1, 1,
0.469405, -0.536257, 2.899609, 1, 0, 0, 1, 1,
0.4729461, -1.007825, 3.411497, 1, 0, 0, 1, 1,
0.4735917, 0.6542474, -0.5389441, 1, 0, 0, 1, 1,
0.4738895, -0.2448349, 1.599947, 1, 0, 0, 1, 1,
0.4843258, 0.8435283, 0.4261341, 1, 0, 0, 1, 1,
0.4917932, 0.981177, 1.960671, 0, 0, 0, 1, 1,
0.4919721, -0.222189, 2.017194, 0, 0, 0, 1, 1,
0.500816, 0.4077874, 1.112215, 0, 0, 0, 1, 1,
0.505014, 0.591489, 1.685503, 0, 0, 0, 1, 1,
0.5132072, 0.6939553, -0.5470993, 0, 0, 0, 1, 1,
0.5138132, -1.015007, 3.697879, 0, 0, 0, 1, 1,
0.5166333, -0.4449114, 1.034344, 0, 0, 0, 1, 1,
0.5172609, -1.228756, 1.951126, 1, 1, 1, 1, 1,
0.5242422, -1.340042, 4.859317, 1, 1, 1, 1, 1,
0.5255634, 1.734925, 0.2929643, 1, 1, 1, 1, 1,
0.5257671, 1.462592, -0.9945092, 1, 1, 1, 1, 1,
0.5258318, -0.5682273, 3.809439, 1, 1, 1, 1, 1,
0.5262278, 0.1934576, 0.3293052, 1, 1, 1, 1, 1,
0.527512, -0.4671589, 1.689991, 1, 1, 1, 1, 1,
0.5291817, -0.4024881, 2.379883, 1, 1, 1, 1, 1,
0.5349649, -0.6674021, 3.254514, 1, 1, 1, 1, 1,
0.5354207, -0.4445085, 3.341041, 1, 1, 1, 1, 1,
0.5376895, 0.6403725, 0.7994173, 1, 1, 1, 1, 1,
0.5380202, 0.4473009, 0.6971264, 1, 1, 1, 1, 1,
0.5423884, 0.5379007, -0.735796, 1, 1, 1, 1, 1,
0.5477455, 0.1430133, 2.777547, 1, 1, 1, 1, 1,
0.5489405, -0.8769502, 2.322478, 1, 1, 1, 1, 1,
0.5549999, -2.70932, 4.87249, 0, 0, 1, 1, 1,
0.5585268, -0.4939247, 1.634996, 1, 0, 0, 1, 1,
0.5591108, 0.8113806, -0.8909666, 1, 0, 0, 1, 1,
0.5629361, -0.7893742, 1.588192, 1, 0, 0, 1, 1,
0.563183, -0.3415287, 1.369393, 1, 0, 0, 1, 1,
0.5644549, 2.455117, -2.411554, 1, 0, 0, 1, 1,
0.5649775, -1.282573, 2.823684, 0, 0, 0, 1, 1,
0.5702915, 0.383193, 0.005130117, 0, 0, 0, 1, 1,
0.5719647, -2.22165, 1.729383, 0, 0, 0, 1, 1,
0.5742216, -0.2009583, 2.288461, 0, 0, 0, 1, 1,
0.5788671, 0.5456738, 0.1236315, 0, 0, 0, 1, 1,
0.5793707, 0.6682418, 2.400957, 0, 0, 0, 1, 1,
0.5799062, 0.9202827, 1.899035, 0, 0, 0, 1, 1,
0.5816711, 0.586486, 0.04711134, 1, 1, 1, 1, 1,
0.5846308, -1.496012, 2.746337, 1, 1, 1, 1, 1,
0.5858186, 0.9040973, 1.643353, 1, 1, 1, 1, 1,
0.5872537, -0.2138376, 1.305063, 1, 1, 1, 1, 1,
0.5903382, 1.397581, 0.2093251, 1, 1, 1, 1, 1,
0.5936517, -0.3041206, 1.338997, 1, 1, 1, 1, 1,
0.5939063, -0.1365233, 2.15767, 1, 1, 1, 1, 1,
0.5946257, 0.8569604, 0.536949, 1, 1, 1, 1, 1,
0.607, -1.044812, 2.88406, 1, 1, 1, 1, 1,
0.6109083, 0.3165601, 3.258419, 1, 1, 1, 1, 1,
0.6125823, -2.659637, 1.579942, 1, 1, 1, 1, 1,
0.6174744, -1.075422, 2.606447, 1, 1, 1, 1, 1,
0.6222016, -0.7406293, 1.626451, 1, 1, 1, 1, 1,
0.6224564, -0.7333446, 2.871881, 1, 1, 1, 1, 1,
0.6306004, -1.849667, 1.056233, 1, 1, 1, 1, 1,
0.6319526, -0.8696625, 0.6019819, 0, 0, 1, 1, 1,
0.6381764, -0.8811386, 3.361031, 1, 0, 0, 1, 1,
0.6423461, -0.4772263, 3.896083, 1, 0, 0, 1, 1,
0.6462906, -0.409282, 3.558944, 1, 0, 0, 1, 1,
0.6468982, 0.6742474, -0.1194137, 1, 0, 0, 1, 1,
0.651139, -0.3483875, 2.410782, 1, 0, 0, 1, 1,
0.6584515, 1.991856, 1.393515, 0, 0, 0, 1, 1,
0.6615595, 0.1801915, 1.430616, 0, 0, 0, 1, 1,
0.6712507, -0.3302331, 1.873139, 0, 0, 0, 1, 1,
0.6715904, -0.08914997, 0.3466271, 0, 0, 0, 1, 1,
0.677476, -0.4813731, 1.403526, 0, 0, 0, 1, 1,
0.6789978, -0.8342256, 1.409349, 0, 0, 0, 1, 1,
0.688646, 1.142319, 1.230176, 0, 0, 0, 1, 1,
0.6887263, -1.558488, 4.092908, 1, 1, 1, 1, 1,
0.6960678, 0.7458553, 1.196495, 1, 1, 1, 1, 1,
0.7025977, -0.767607, 3.184618, 1, 1, 1, 1, 1,
0.7037341, 0.7206795, -0.0627576, 1, 1, 1, 1, 1,
0.7051684, 1.495114, -0.7692619, 1, 1, 1, 1, 1,
0.7063307, 1.579943, 0.4317941, 1, 1, 1, 1, 1,
0.7074046, -1.01127, 3.131363, 1, 1, 1, 1, 1,
0.7087019, -0.4468797, 1.471243, 1, 1, 1, 1, 1,
0.7096766, 1.368799, 0.1727921, 1, 1, 1, 1, 1,
0.7140102, -0.1305163, 1.278325, 1, 1, 1, 1, 1,
0.7183907, -0.7590743, 0.2628756, 1, 1, 1, 1, 1,
0.722724, -1.08579, 1.71539, 1, 1, 1, 1, 1,
0.7315919, 0.6069329, 0.9625373, 1, 1, 1, 1, 1,
0.7355144, -0.5249109, 1.955811, 1, 1, 1, 1, 1,
0.7377823, 0.3600291, 0.8086781, 1, 1, 1, 1, 1,
0.7442755, -0.7630917, 2.246247, 0, 0, 1, 1, 1,
0.7449728, -2.007404, 4.699679, 1, 0, 0, 1, 1,
0.7456926, -0.1534167, 2.197069, 1, 0, 0, 1, 1,
0.7459614, 0.5343286, -0.6075879, 1, 0, 0, 1, 1,
0.7470344, 0.3984095, 0.4055254, 1, 0, 0, 1, 1,
0.7479857, -0.3146891, 0.8877009, 1, 0, 0, 1, 1,
0.7495424, -0.6298392, 2.501132, 0, 0, 0, 1, 1,
0.7501156, 2.825609, -0.7845932, 0, 0, 0, 1, 1,
0.7507243, -0.4684022, 3.159857, 0, 0, 0, 1, 1,
0.7513244, 0.7535588, 0.3952514, 0, 0, 0, 1, 1,
0.7549547, -1.574769, 1.194567, 0, 0, 0, 1, 1,
0.7582884, 0.6120559, -1.210104, 0, 0, 0, 1, 1,
0.7596599, -2.178946, 1.429145, 0, 0, 0, 1, 1,
0.7621254, -0.3695923, 3.645288, 1, 1, 1, 1, 1,
0.7634898, 0.3909985, 1.522837, 1, 1, 1, 1, 1,
0.76481, 1.255808, 0.8728196, 1, 1, 1, 1, 1,
0.7649613, -0.3837834, 0.5475287, 1, 1, 1, 1, 1,
0.7713156, 0.5315871, -0.1616973, 1, 1, 1, 1, 1,
0.772727, 0.4569036, -0.06072572, 1, 1, 1, 1, 1,
0.7740116, -0.4741242, 3.158288, 1, 1, 1, 1, 1,
0.7766503, 0.8674457, 0.1983471, 1, 1, 1, 1, 1,
0.7811704, 0.5427935, -0.5332764, 1, 1, 1, 1, 1,
0.7865391, 0.2690344, 1.292386, 1, 1, 1, 1, 1,
0.7887158, -0.7449397, 2.449081, 1, 1, 1, 1, 1,
0.7901734, -0.9019966, 2.296446, 1, 1, 1, 1, 1,
0.7941303, -0.4410579, 1.511718, 1, 1, 1, 1, 1,
0.802178, -1.681712, 2.56499, 1, 1, 1, 1, 1,
0.8060449, -0.3961154, 1.544723, 1, 1, 1, 1, 1,
0.8115132, 2.219233, 2.078882, 0, 0, 1, 1, 1,
0.8123937, 0.8043543, 1.34268, 1, 0, 0, 1, 1,
0.8125961, -0.06281877, 0.73918, 1, 0, 0, 1, 1,
0.8129581, 0.9509392, 1.942647, 1, 0, 0, 1, 1,
0.8157814, -0.2254659, 1.140299, 1, 0, 0, 1, 1,
0.817288, 1.799229, 1.415338, 1, 0, 0, 1, 1,
0.8195108, 1.505813, 0.7850987, 0, 0, 0, 1, 1,
0.8302599, -0.2374602, 1.793353, 0, 0, 0, 1, 1,
0.8338105, -1.256031, 5.626777, 0, 0, 0, 1, 1,
0.8377787, 0.4139006, 0.5791246, 0, 0, 0, 1, 1,
0.8472523, -2.579735, 4.174932, 0, 0, 0, 1, 1,
0.8486813, 0.8191593, 0.2292525, 0, 0, 0, 1, 1,
0.8491709, -1.249097, 2.046931, 0, 0, 0, 1, 1,
0.8506376, -1.092151, 4.23091, 1, 1, 1, 1, 1,
0.8516831, -1.650744, 1.21209, 1, 1, 1, 1, 1,
0.8569298, 0.6029737, 1.265607, 1, 1, 1, 1, 1,
0.8580069, 0.7219951, 0.1999974, 1, 1, 1, 1, 1,
0.8659154, 1.585441, 0.8130841, 1, 1, 1, 1, 1,
0.8663088, 1.151572, -1.492514, 1, 1, 1, 1, 1,
0.8669729, -0.3417546, 1.486684, 1, 1, 1, 1, 1,
0.870812, -0.6281268, -0.03043254, 1, 1, 1, 1, 1,
0.877144, -0.2792488, 0.4836781, 1, 1, 1, 1, 1,
0.878232, -0.4921612, 0.7366698, 1, 1, 1, 1, 1,
0.880035, -0.04670487, -0.3470171, 1, 1, 1, 1, 1,
0.8812118, -0.03534218, 1.127292, 1, 1, 1, 1, 1,
0.8826025, -0.01782608, 0.6443051, 1, 1, 1, 1, 1,
0.8875606, -1.722146, 1.784738, 1, 1, 1, 1, 1,
0.8900923, -0.7783157, 1.912039, 1, 1, 1, 1, 1,
0.8941625, -0.7249925, 4.874836, 0, 0, 1, 1, 1,
0.8945349, 0.1872554, 2.259581, 1, 0, 0, 1, 1,
0.9045396, 0.3958801, 2.158365, 1, 0, 0, 1, 1,
0.908571, -0.8778774, 3.724489, 1, 0, 0, 1, 1,
0.9101757, 1.097414, 1.661993, 1, 0, 0, 1, 1,
0.9108534, 1.186441, 0.3144473, 1, 0, 0, 1, 1,
0.9131781, 0.002481095, 1.735949, 0, 0, 0, 1, 1,
0.9141163, 3.228991, 0.8908453, 0, 0, 0, 1, 1,
0.9200733, -0.7955073, 2.66509, 0, 0, 0, 1, 1,
0.9220538, 0.6144002, 0.4976912, 0, 0, 0, 1, 1,
0.9296393, -0.7414382, 3.035761, 0, 0, 0, 1, 1,
0.9305344, -0.4951017, 2.447595, 0, 0, 0, 1, 1,
0.9306359, -0.9881893, 2.020324, 0, 0, 0, 1, 1,
0.9424957, -1.010776, 2.440869, 1, 1, 1, 1, 1,
0.9465722, 0.4555701, 0.008664707, 1, 1, 1, 1, 1,
0.9480622, -0.9908908, 1.295948, 1, 1, 1, 1, 1,
0.9509592, -1.293188, 3.493317, 1, 1, 1, 1, 1,
0.9579725, 0.2146877, 0.4908952, 1, 1, 1, 1, 1,
0.9635961, -1.529301, 2.309866, 1, 1, 1, 1, 1,
0.9646276, 0.7392856, 0.3910768, 1, 1, 1, 1, 1,
0.9722605, -1.175448, 1.968042, 1, 1, 1, 1, 1,
0.977971, -1.196788, 2.369187, 1, 1, 1, 1, 1,
0.9807283, -1.134273, 2.792045, 1, 1, 1, 1, 1,
0.9898239, 0.04186558, 2.504816, 1, 1, 1, 1, 1,
0.9906074, 0.5444264, 0.9650491, 1, 1, 1, 1, 1,
0.9910935, -1.279867, 1.335014, 1, 1, 1, 1, 1,
0.9932644, 0.2986249, 0.8263234, 1, 1, 1, 1, 1,
0.9935228, -0.2067696, 1.176599, 1, 1, 1, 1, 1,
0.9938912, -1.674421, 2.862684, 0, 0, 1, 1, 1,
0.9960075, 0.7598107, 2.46783, 1, 0, 0, 1, 1,
0.9996015, -0.4663909, 2.050035, 1, 0, 0, 1, 1,
1.005373, 0.7969569, 1.634586, 1, 0, 0, 1, 1,
1.005444, -0.7387864, 3.426825, 1, 0, 0, 1, 1,
1.011979, -0.05962287, 0.3662158, 1, 0, 0, 1, 1,
1.013382, -1.512757, 2.284343, 0, 0, 0, 1, 1,
1.014989, 0.4159284, 0.8843305, 0, 0, 0, 1, 1,
1.016415, 0.5649583, -0.3452697, 0, 0, 0, 1, 1,
1.021374, 2.035248, -0.401921, 0, 0, 0, 1, 1,
1.022588, 0.4803792, -0.5720626, 0, 0, 0, 1, 1,
1.023014, -1.369835, 2.663309, 0, 0, 0, 1, 1,
1.034991, 0.3237593, 0.8379378, 0, 0, 0, 1, 1,
1.044125, -0.08845475, 1.579622, 1, 1, 1, 1, 1,
1.051469, -1.153768, 4.381462, 1, 1, 1, 1, 1,
1.051524, -0.9650469, 1.88115, 1, 1, 1, 1, 1,
1.053812, -0.01735571, 0.9382091, 1, 1, 1, 1, 1,
1.05791, 0.1607574, 2.860011, 1, 1, 1, 1, 1,
1.060737, -0.08850241, 0.968593, 1, 1, 1, 1, 1,
1.074622, -0.3641625, 1.296282, 1, 1, 1, 1, 1,
1.08617, -0.8255372, 3.957122, 1, 1, 1, 1, 1,
1.091708, 2.681119, 1.433682, 1, 1, 1, 1, 1,
1.09934, 0.1421158, 1.987159, 1, 1, 1, 1, 1,
1.099753, -0.2579996, 3.872443, 1, 1, 1, 1, 1,
1.115007, -0.1281933, 1.333357, 1, 1, 1, 1, 1,
1.122778, -0.7993658, 2.282494, 1, 1, 1, 1, 1,
1.130253, -0.4693314, 2.922404, 1, 1, 1, 1, 1,
1.13072, 1.023935, 1.542842, 1, 1, 1, 1, 1,
1.143191, -0.1560337, -0.03911254, 0, 0, 1, 1, 1,
1.145815, 0.1017028, 1.794685, 1, 0, 0, 1, 1,
1.155951, 2.20006, -0.7115303, 1, 0, 0, 1, 1,
1.157795, 1.036504, 2.04138, 1, 0, 0, 1, 1,
1.160542, 0.05091074, 0.91175, 1, 0, 0, 1, 1,
1.163351, 0.6663374, 0.8156801, 1, 0, 0, 1, 1,
1.165444, 0.8311905, 0.3554013, 0, 0, 0, 1, 1,
1.172096, 0.7595803, 0.7717402, 0, 0, 0, 1, 1,
1.17904, 1.401664, 1.678707, 0, 0, 0, 1, 1,
1.182225, -1.204277, 1.736172, 0, 0, 0, 1, 1,
1.192435, -1.023306, 2.335117, 0, 0, 0, 1, 1,
1.194738, 1.431907, 1.189526, 0, 0, 0, 1, 1,
1.195506, 0.3793845, 1.98947, 0, 0, 0, 1, 1,
1.197392, -1.182897, 4.144704, 1, 1, 1, 1, 1,
1.208431, 1.312469, -0.6191891, 1, 1, 1, 1, 1,
1.208622, 0.4992036, 3.506972, 1, 1, 1, 1, 1,
1.208623, -0.482054, 0.1416589, 1, 1, 1, 1, 1,
1.209599, 1.032546, 1.600552, 1, 1, 1, 1, 1,
1.209654, -2.29566, 3.429777, 1, 1, 1, 1, 1,
1.214399, 0.2441913, 1.579222, 1, 1, 1, 1, 1,
1.223209, 0.9633618, 1.62245, 1, 1, 1, 1, 1,
1.227044, 0.6595945, 1.568949, 1, 1, 1, 1, 1,
1.227116, -0.2474539, 1.742055, 1, 1, 1, 1, 1,
1.232684, -1.252859, 3.614075, 1, 1, 1, 1, 1,
1.23967, 0.6911015, 1.171427, 1, 1, 1, 1, 1,
1.243569, 0.02391291, 2.20595, 1, 1, 1, 1, 1,
1.24628, 1.232289, 1.881406, 1, 1, 1, 1, 1,
1.24743, -0.5109051, 0.2493929, 1, 1, 1, 1, 1,
1.255065, 1.058697, -0.6774604, 0, 0, 1, 1, 1,
1.255326, -0.1343937, 2.366723, 1, 0, 0, 1, 1,
1.256316, -0.3296713, 0.7892162, 1, 0, 0, 1, 1,
1.257095, -0.8255453, 1.984969, 1, 0, 0, 1, 1,
1.26253, 2.087335, 1.210186, 1, 0, 0, 1, 1,
1.268188, -1.992453, 2.91734, 1, 0, 0, 1, 1,
1.277973, -0.8525576, 2.564494, 0, 0, 0, 1, 1,
1.283702, -0.04588898, 0.3746487, 0, 0, 0, 1, 1,
1.290764, -0.5380699, 1.961161, 0, 0, 0, 1, 1,
1.291636, -1.79552, 2.993758, 0, 0, 0, 1, 1,
1.2928, 1.19222, 0.9423994, 0, 0, 0, 1, 1,
1.294068, 1.786689, 1.145495, 0, 0, 0, 1, 1,
1.295612, 0.2666963, 0.7376814, 0, 0, 0, 1, 1,
1.311885, -0.3441999, 1.796417, 1, 1, 1, 1, 1,
1.325523, 1.200583, 1.21145, 1, 1, 1, 1, 1,
1.342266, -1.749905, 0.8684506, 1, 1, 1, 1, 1,
1.34649, -0.9713284, 0.7759403, 1, 1, 1, 1, 1,
1.353335, 0.07078391, 3.049312, 1, 1, 1, 1, 1,
1.35457, -0.7523653, 1.9699, 1, 1, 1, 1, 1,
1.357596, -1.221525, 2.022631, 1, 1, 1, 1, 1,
1.359305, 1.803388, -0.6459307, 1, 1, 1, 1, 1,
1.36004, -0.6428616, 2.650277, 1, 1, 1, 1, 1,
1.365598, 1.087237, 0.694578, 1, 1, 1, 1, 1,
1.367297, -0.2412376, 1.917933, 1, 1, 1, 1, 1,
1.371765, 1.709804, 0.5818213, 1, 1, 1, 1, 1,
1.378974, 1.055431, 0.9988152, 1, 1, 1, 1, 1,
1.382001, -0.3905964, 1.209721, 1, 1, 1, 1, 1,
1.382374, 0.603353, 0.3587465, 1, 1, 1, 1, 1,
1.387788, 0.8347577, 2.645902, 0, 0, 1, 1, 1,
1.391513, 0.6145872, 1.769808, 1, 0, 0, 1, 1,
1.396348, -0.2358716, 2.619334, 1, 0, 0, 1, 1,
1.399335, 0.7490996, 1.610751, 1, 0, 0, 1, 1,
1.400189, -0.834823, 3.544637, 1, 0, 0, 1, 1,
1.400598, -0.8779038, 1.384234, 1, 0, 0, 1, 1,
1.429602, 1.701597, -0.788245, 0, 0, 0, 1, 1,
1.439665, -1.298393, 1.823011, 0, 0, 0, 1, 1,
1.47338, 0.5756584, 1.84192, 0, 0, 0, 1, 1,
1.500998, -0.09873225, 1.070064, 0, 0, 0, 1, 1,
1.506097, -1.938678, 3.429476, 0, 0, 0, 1, 1,
1.520885, 1.355876, 0.8161517, 0, 0, 0, 1, 1,
1.523978, -0.6320555, 2.760759, 0, 0, 0, 1, 1,
1.538164, -0.0005035949, 0.9502671, 1, 1, 1, 1, 1,
1.54964, 0.6498052, 1.048218, 1, 1, 1, 1, 1,
1.557108, -0.008015891, 2.679534, 1, 1, 1, 1, 1,
1.575019, -0.1445549, 1.485397, 1, 1, 1, 1, 1,
1.617486, -0.2772233, 1.43188, 1, 1, 1, 1, 1,
1.63326, 1.33952, 2.481698, 1, 1, 1, 1, 1,
1.641465, 0.53996, 2.040716, 1, 1, 1, 1, 1,
1.64185, -1.586129, 4.019548, 1, 1, 1, 1, 1,
1.645926, -0.330641, -1.107231, 1, 1, 1, 1, 1,
1.652355, 0.7941703, -0.7834699, 1, 1, 1, 1, 1,
1.660265, -1.139947, 0.9187058, 1, 1, 1, 1, 1,
1.663905, 2.432056, -0.8270528, 1, 1, 1, 1, 1,
1.66936, -0.2488418, 1.534703, 1, 1, 1, 1, 1,
1.67732, 1.220894, 0.3800804, 1, 1, 1, 1, 1,
1.680132, -0.4707907, 0.8268561, 1, 1, 1, 1, 1,
1.685528, 0.9868288, 1.294179, 0, 0, 1, 1, 1,
1.694751, 1.408769, 1.963943, 1, 0, 0, 1, 1,
1.703252, 0.9812652, 0.7365822, 1, 0, 0, 1, 1,
1.705204, -1.297193, 2.44584, 1, 0, 0, 1, 1,
1.71828, 1.213255, 1.950586, 1, 0, 0, 1, 1,
1.723882, 0.3193637, -0.5698359, 1, 0, 0, 1, 1,
1.742496, 0.542594, 0.8509175, 0, 0, 0, 1, 1,
1.765682, -0.03081074, 1.662184, 0, 0, 0, 1, 1,
1.781773, 0.3691943, 1.6342, 0, 0, 0, 1, 1,
1.785448, -0.3898575, 2.510413, 0, 0, 0, 1, 1,
1.795964, -1.016898, 0.3898447, 0, 0, 0, 1, 1,
1.805261, 0.6525573, 1.415481, 0, 0, 0, 1, 1,
1.80626, 1.709318, 0.5869869, 0, 0, 0, 1, 1,
1.823294, 0.5248475, 1.131254, 1, 1, 1, 1, 1,
1.83173, -0.9896991, 1.692861, 1, 1, 1, 1, 1,
1.832393, -1.195951, 2.957991, 1, 1, 1, 1, 1,
1.872337, -0.3326565, 1.502235, 1, 1, 1, 1, 1,
1.873424, -0.4606281, 0.07328972, 1, 1, 1, 1, 1,
1.886731, 0.534201, 1.59518, 1, 1, 1, 1, 1,
1.912037, -0.6020873, 3.567326, 1, 1, 1, 1, 1,
1.914547, -0.6761034, 2.783703, 1, 1, 1, 1, 1,
1.954567, 0.7796786, 1.063112, 1, 1, 1, 1, 1,
1.97566, 2.252706, 0.597234, 1, 1, 1, 1, 1,
2.033409, 0.09482149, 3.024045, 1, 1, 1, 1, 1,
2.050361, 0.7492648, 1.157904, 1, 1, 1, 1, 1,
2.09236, -0.01802771, 1.095387, 1, 1, 1, 1, 1,
2.110519, 0.1324629, 2.650183, 1, 1, 1, 1, 1,
2.151306, -0.5909863, 1.386173, 1, 1, 1, 1, 1,
2.1972, 0.06924839, 1.028567, 0, 0, 1, 1, 1,
2.209105, -0.564668, 0.4179445, 1, 0, 0, 1, 1,
2.249246, -1.013947, 2.278314, 1, 0, 0, 1, 1,
2.282955, 0.7845747, 3.602891, 1, 0, 0, 1, 1,
2.342746, 1.173584, 0.706939, 1, 0, 0, 1, 1,
2.359278, -0.4180347, 2.532223, 1, 0, 0, 1, 1,
2.363082, 0.1226938, 0.6451502, 0, 0, 0, 1, 1,
2.433343, -0.4834445, 0.6116338, 0, 0, 0, 1, 1,
2.478511, -1.30754, 2.074862, 0, 0, 0, 1, 1,
2.556613, 0.05969949, 0.9715298, 0, 0, 0, 1, 1,
2.593284, -2.538225, 2.433187, 0, 0, 0, 1, 1,
2.608566, -0.2168679, 3.595413, 0, 0, 0, 1, 1,
2.624125, 1.575508, 2.194317, 0, 0, 0, 1, 1,
2.640279, -0.9029747, 1.016291, 1, 1, 1, 1, 1,
2.840914, -0.6098912, 2.290476, 1, 1, 1, 1, 1,
2.860556, 0.4270282, -0.06462505, 1, 1, 1, 1, 1,
3.009998, -0.06069377, 1.043022, 1, 1, 1, 1, 1,
3.041099, -1.138293, 0.8880223, 1, 1, 1, 1, 1,
3.118535, 0.2967834, 2.268294, 1, 1, 1, 1, 1,
3.138038, 0.6801772, 1.064492, 1, 1, 1, 1, 1
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
var radius = 9.378826;
var distance = 32.94273;
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
mvMatrix.translate( -0.04389954, -0.316359, -0.3916688 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.94273);
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