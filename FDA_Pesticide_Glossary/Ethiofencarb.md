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
-3.114855, 0.05299554, -1.492384, 1, 0, 0, 1,
-2.827594, 0.7274833, -1.238889, 1, 0.007843138, 0, 1,
-2.461502, 0.4711496, -2.261367, 1, 0.01176471, 0, 1,
-2.424365, -1.00956, -2.240492, 1, 0.01960784, 0, 1,
-2.409307, 0.2599632, -1.529245, 1, 0.02352941, 0, 1,
-2.379128, -0.2338799, 0.4230125, 1, 0.03137255, 0, 1,
-2.374537, -1.659334, -0.8795606, 1, 0.03529412, 0, 1,
-2.357257, 0.6493676, -0.8883785, 1, 0.04313726, 0, 1,
-2.328899, 1.582623, -1.037708, 1, 0.04705882, 0, 1,
-2.254426, 0.5022611, -0.1608476, 1, 0.05490196, 0, 1,
-2.214119, 0.1702894, -1.472028, 1, 0.05882353, 0, 1,
-2.209117, -0.3075371, -1.37181, 1, 0.06666667, 0, 1,
-2.167884, 0.4060648, -0.6444373, 1, 0.07058824, 0, 1,
-2.135242, 0.004763388, -1.540333, 1, 0.07843138, 0, 1,
-2.124951, -1.100534, -2.376137, 1, 0.08235294, 0, 1,
-2.119807, 0.874112, -1.290218, 1, 0.09019608, 0, 1,
-2.11767, 0.4250701, -2.04427, 1, 0.09411765, 0, 1,
-2.104427, 0.9932757, -1.552933, 1, 0.1019608, 0, 1,
-2.10136, -0.7257606, -0.9739587, 1, 0.1098039, 0, 1,
-2.08279, -0.8255112, -1.747996, 1, 0.1137255, 0, 1,
-2.062219, 0.4792871, -2.924378, 1, 0.1215686, 0, 1,
-2.011901, -0.9133328, -3.214573, 1, 0.1254902, 0, 1,
-2.009377, -0.649049, -0.6343949, 1, 0.1333333, 0, 1,
-1.977108, 2.299032, -0.1177645, 1, 0.1372549, 0, 1,
-1.926719, 0.3294083, -0.8997111, 1, 0.145098, 0, 1,
-1.923465, 0.9183844, -2.912481, 1, 0.1490196, 0, 1,
-1.915735, -1.578588, -3.575189, 1, 0.1568628, 0, 1,
-1.913139, -0.09189606, -3.908245, 1, 0.1607843, 0, 1,
-1.881028, 0.02102892, -0.1436809, 1, 0.1686275, 0, 1,
-1.875683, -1.246028, -2.786411, 1, 0.172549, 0, 1,
-1.865521, -0.114471, -0.7294239, 1, 0.1803922, 0, 1,
-1.861746, 0.3267825, -0.7610078, 1, 0.1843137, 0, 1,
-1.858761, -1.796988, -3.244616, 1, 0.1921569, 0, 1,
-1.850375, -1.150664, -2.765618, 1, 0.1960784, 0, 1,
-1.842179, -0.3734171, -1.31571, 1, 0.2039216, 0, 1,
-1.838877, -1.751364, -1.695675, 1, 0.2117647, 0, 1,
-1.838322, -0.05706393, -0.006884341, 1, 0.2156863, 0, 1,
-1.812283, -0.05384474, 0.1488656, 1, 0.2235294, 0, 1,
-1.78778, -0.9574218, -2.4156, 1, 0.227451, 0, 1,
-1.778295, 1.739222, -0.5251805, 1, 0.2352941, 0, 1,
-1.774128, -0.438853, -3.336099, 1, 0.2392157, 0, 1,
-1.760586, 0.6233779, -1.804894, 1, 0.2470588, 0, 1,
-1.757629, -0.7142258, -1.640976, 1, 0.2509804, 0, 1,
-1.74669, -0.3713873, -3.179434, 1, 0.2588235, 0, 1,
-1.712455, 1.23064, -0.04347362, 1, 0.2627451, 0, 1,
-1.711088, 0.7702942, -3.138052, 1, 0.2705882, 0, 1,
-1.708442, -0.2114282, -2.886823, 1, 0.2745098, 0, 1,
-1.706891, 0.00495181, -2.264765, 1, 0.282353, 0, 1,
-1.701615, 1.359431, -1.936053, 1, 0.2862745, 0, 1,
-1.69671, -0.2556905, -2.194672, 1, 0.2941177, 0, 1,
-1.679189, 0.4141879, 0.5544181, 1, 0.3019608, 0, 1,
-1.659036, 0.1549072, -1.442199, 1, 0.3058824, 0, 1,
-1.633591, -0.3394515, -1.041123, 1, 0.3137255, 0, 1,
-1.631338, -0.8830293, -1.707839, 1, 0.3176471, 0, 1,
-1.582654, -0.4942661, -1.159221, 1, 0.3254902, 0, 1,
-1.575835, 0.4447063, -2.649867, 1, 0.3294118, 0, 1,
-1.575482, 0.2205091, -1.637719, 1, 0.3372549, 0, 1,
-1.573275, -0.9720637, -3.357497, 1, 0.3411765, 0, 1,
-1.560341, 0.6258084, -1.980681, 1, 0.3490196, 0, 1,
-1.557694, 0.9852179, -1.742687, 1, 0.3529412, 0, 1,
-1.555862, -0.8064221, -3.217656, 1, 0.3607843, 0, 1,
-1.541834, -0.9159786, -2.028736, 1, 0.3647059, 0, 1,
-1.54072, 0.3828904, 0.784736, 1, 0.372549, 0, 1,
-1.531039, -0.6412504, -2.861139, 1, 0.3764706, 0, 1,
-1.52436, -0.4438119, -3.404197, 1, 0.3843137, 0, 1,
-1.511364, -0.7977362, -2.814137, 1, 0.3882353, 0, 1,
-1.509532, -0.213008, -1.100215, 1, 0.3960784, 0, 1,
-1.506001, 0.7249586, 0.5374711, 1, 0.4039216, 0, 1,
-1.503366, -0.6297131, -1.438194, 1, 0.4078431, 0, 1,
-1.50186, 0.08313187, -2.495482, 1, 0.4156863, 0, 1,
-1.489716, -0.8118533, -2.835376, 1, 0.4196078, 0, 1,
-1.489453, -1.047115, -2.747569, 1, 0.427451, 0, 1,
-1.486838, 1.127495, -1.978238, 1, 0.4313726, 0, 1,
-1.47233, 0.07124952, -2.259727, 1, 0.4392157, 0, 1,
-1.466245, 0.8889243, 0.3584745, 1, 0.4431373, 0, 1,
-1.454999, 0.9249472, -3.053378, 1, 0.4509804, 0, 1,
-1.450097, -0.2973487, -1.658963, 1, 0.454902, 0, 1,
-1.449772, 0.5858934, -0.3932722, 1, 0.4627451, 0, 1,
-1.438381, 0.5775107, -0.2635019, 1, 0.4666667, 0, 1,
-1.432948, 0.4307909, -3.603338, 1, 0.4745098, 0, 1,
-1.425019, -0.05781514, -0.7101693, 1, 0.4784314, 0, 1,
-1.424057, 0.3798693, -0.6922781, 1, 0.4862745, 0, 1,
-1.42175, 0.5778943, -1.695514, 1, 0.4901961, 0, 1,
-1.413689, -1.740872, -3.815649, 1, 0.4980392, 0, 1,
-1.413043, -1.238052, -3.825071, 1, 0.5058824, 0, 1,
-1.404169, -0.1820529, -2.769533, 1, 0.509804, 0, 1,
-1.392096, 0.9860987, -1.476387, 1, 0.5176471, 0, 1,
-1.388596, 1.878437, -1.116218, 1, 0.5215687, 0, 1,
-1.387101, 0.1049773, -2.929244, 1, 0.5294118, 0, 1,
-1.382434, 1.376868, -1.422966, 1, 0.5333334, 0, 1,
-1.379367, 0.642063, 0.03249361, 1, 0.5411765, 0, 1,
-1.366014, -0.6786411, -2.576756, 1, 0.5450981, 0, 1,
-1.361663, 0.01638749, -2.152066, 1, 0.5529412, 0, 1,
-1.353411, 0.9103411, -0.7726986, 1, 0.5568628, 0, 1,
-1.348246, -0.7347142, -3.383764, 1, 0.5647059, 0, 1,
-1.342856, -0.2430177, -2.983216, 1, 0.5686275, 0, 1,
-1.336184, -0.5536191, -3.739539, 1, 0.5764706, 0, 1,
-1.332914, 0.08643442, -1.276528, 1, 0.5803922, 0, 1,
-1.328144, -2.201665, -4.466596, 1, 0.5882353, 0, 1,
-1.312875, -1.220233, -1.392814, 1, 0.5921569, 0, 1,
-1.310602, -0.2897639, -2.00147, 1, 0.6, 0, 1,
-1.302, 0.137144, -2.637697, 1, 0.6078432, 0, 1,
-1.299718, 0.8593739, -0.2940834, 1, 0.6117647, 0, 1,
-1.29061, -1.098804, -2.167984, 1, 0.6196079, 0, 1,
-1.286365, -1.192455, -4.785289, 1, 0.6235294, 0, 1,
-1.278996, 0.5172414, -0.7481086, 1, 0.6313726, 0, 1,
-1.273052, 0.9682, 0.5756077, 1, 0.6352941, 0, 1,
-1.271516, 0.7638897, -1.179233, 1, 0.6431373, 0, 1,
-1.265946, -0.5267525, -2.701169, 1, 0.6470588, 0, 1,
-1.256225, 0.5517415, -0.5090337, 1, 0.654902, 0, 1,
-1.251234, -1.097937, -2.083807, 1, 0.6588235, 0, 1,
-1.250889, 0.3937495, -0.839153, 1, 0.6666667, 0, 1,
-1.237658, -1.096377, -2.621794, 1, 0.6705883, 0, 1,
-1.237209, -1.450957, -2.323686, 1, 0.6784314, 0, 1,
-1.232925, -1.042037, -3.260507, 1, 0.682353, 0, 1,
-1.229101, 0.6598305, -1.57751, 1, 0.6901961, 0, 1,
-1.224201, -0.02728307, -0.6431153, 1, 0.6941177, 0, 1,
-1.222558, -0.512749, -2.469827, 1, 0.7019608, 0, 1,
-1.218875, 0.4116833, -0.2917984, 1, 0.7098039, 0, 1,
-1.216651, -0.8920268, -1.59505, 1, 0.7137255, 0, 1,
-1.206845, 0.2314717, 1.13347, 1, 0.7215686, 0, 1,
-1.205306, -1.036626, -2.174912, 1, 0.7254902, 0, 1,
-1.204696, -0.5524834, -2.65021, 1, 0.7333333, 0, 1,
-1.202147, -1.804121, -3.935224, 1, 0.7372549, 0, 1,
-1.200943, -0.3798015, -3.968589, 1, 0.7450981, 0, 1,
-1.200495, -0.5441601, -1.8959, 1, 0.7490196, 0, 1,
-1.193524, -0.2680396, -2.40084, 1, 0.7568628, 0, 1,
-1.189125, -1.049127, -4.15243, 1, 0.7607843, 0, 1,
-1.188794, 0.2820136, -0.5236454, 1, 0.7686275, 0, 1,
-1.188286, -0.4417271, -2.220521, 1, 0.772549, 0, 1,
-1.185145, 0.3903386, -0.1130862, 1, 0.7803922, 0, 1,
-1.171697, -0.1916071, -1.91461, 1, 0.7843137, 0, 1,
-1.169091, 0.3915292, -1.67422, 1, 0.7921569, 0, 1,
-1.168499, -0.804166, -2.943389, 1, 0.7960784, 0, 1,
-1.16848, -0.0349206, -2.103217, 1, 0.8039216, 0, 1,
-1.16537, -0.6641675, 0.08606419, 1, 0.8117647, 0, 1,
-1.160927, -1.501704, -2.873642, 1, 0.8156863, 0, 1,
-1.154634, -0.8333031, -1.638314, 1, 0.8235294, 0, 1,
-1.152899, 0.6116874, -2.7666, 1, 0.827451, 0, 1,
-1.146857, 1.658334, -1.294809, 1, 0.8352941, 0, 1,
-1.141649, -1.387546, -3.130604, 1, 0.8392157, 0, 1,
-1.139979, 0.696627, 0.1793054, 1, 0.8470588, 0, 1,
-1.13372, 2.357911, -2.979761, 1, 0.8509804, 0, 1,
-1.130401, -0.881641, -2.607455, 1, 0.8588235, 0, 1,
-1.129286, 1.477649, -0.9476315, 1, 0.8627451, 0, 1,
-1.119404, -0.7344457, -0.5656016, 1, 0.8705882, 0, 1,
-1.117961, -0.3319581, -1.697101, 1, 0.8745098, 0, 1,
-1.114549, -0.8518466, -2.164451, 1, 0.8823529, 0, 1,
-1.112723, -0.1968359, -2.183821, 1, 0.8862745, 0, 1,
-1.111583, 0.7439236, -1.473608, 1, 0.8941177, 0, 1,
-1.110251, 0.3324567, -2.994528, 1, 0.8980392, 0, 1,
-1.109905, 2.250264, 0.708776, 1, 0.9058824, 0, 1,
-1.100617, 0.03396729, -1.597535, 1, 0.9137255, 0, 1,
-1.09893, 0.2800554, -1.672854, 1, 0.9176471, 0, 1,
-1.095512, -0.4404903, -0.9186057, 1, 0.9254902, 0, 1,
-1.090939, -0.7173259, -1.399719, 1, 0.9294118, 0, 1,
-1.080987, -0.4280491, -2.425431, 1, 0.9372549, 0, 1,
-1.079528, -0.2410089, -2.444599, 1, 0.9411765, 0, 1,
-1.075935, -0.1258317, -2.170939, 1, 0.9490196, 0, 1,
-1.074699, -0.6045797, -2.86728, 1, 0.9529412, 0, 1,
-1.073155, -0.3191699, -2.328396, 1, 0.9607843, 0, 1,
-1.067219, -0.3273985, -1.617524, 1, 0.9647059, 0, 1,
-1.064715, 0.1915769, -2.257086, 1, 0.972549, 0, 1,
-1.058827, -0.2079099, -3.035751, 1, 0.9764706, 0, 1,
-1.058644, 2.4559, -1.230022, 1, 0.9843137, 0, 1,
-1.055426, 0.6496856, -1.450663, 1, 0.9882353, 0, 1,
-1.045775, -0.5452442, -1.925724, 1, 0.9960784, 0, 1,
-1.032445, 0.5019837, -1.92946, 0.9960784, 1, 0, 1,
-1.025334, 0.3102824, -1.03314, 0.9921569, 1, 0, 1,
-1.019075, 0.8456295, -1.341634, 0.9843137, 1, 0, 1,
-1.014124, -2.945047, -0.570511, 0.9803922, 1, 0, 1,
-1.007956, -0.6663082, -0.4904123, 0.972549, 1, 0, 1,
-1.002213, 0.5719129, -1.142619, 0.9686275, 1, 0, 1,
-1.001006, -1.012095, -0.8663207, 0.9607843, 1, 0, 1,
-0.9970627, 0.3494287, -2.244191, 0.9568627, 1, 0, 1,
-0.995428, 0.4750023, -0.09164646, 0.9490196, 1, 0, 1,
-0.9941763, 0.6077669, -1.011784, 0.945098, 1, 0, 1,
-0.9868748, 0.2139134, -3.429175, 0.9372549, 1, 0, 1,
-0.9868627, 0.3058315, 0.2500764, 0.9333333, 1, 0, 1,
-0.985205, -1.225431, -2.942331, 0.9254902, 1, 0, 1,
-0.9754376, -0.5407913, -2.348202, 0.9215686, 1, 0, 1,
-0.962909, 0.07169399, -1.27831, 0.9137255, 1, 0, 1,
-0.9621292, 0.3017461, -1.308309, 0.9098039, 1, 0, 1,
-0.9510745, 0.5360708, -0.07206088, 0.9019608, 1, 0, 1,
-0.9479595, 1.672795, -2.202065, 0.8941177, 1, 0, 1,
-0.9463804, 0.7301007, -0.3677075, 0.8901961, 1, 0, 1,
-0.9413371, 1.507746, 0.3282917, 0.8823529, 1, 0, 1,
-0.9407405, 0.3087984, -0.9592811, 0.8784314, 1, 0, 1,
-0.9373921, 1.600873, 0.8487357, 0.8705882, 1, 0, 1,
-0.9341207, -0.7504982, -2.114251, 0.8666667, 1, 0, 1,
-0.9329748, 0.4594586, -2.087367, 0.8588235, 1, 0, 1,
-0.931572, -1.378429, -2.748989, 0.854902, 1, 0, 1,
-0.9312741, 2.289738, 0.4065332, 0.8470588, 1, 0, 1,
-0.9280083, -0.5453371, -2.145769, 0.8431373, 1, 0, 1,
-0.9263061, -0.5279108, -1.998462, 0.8352941, 1, 0, 1,
-0.9246055, -0.6325768, -3.830369, 0.8313726, 1, 0, 1,
-0.9245557, -0.1613873, -1.701473, 0.8235294, 1, 0, 1,
-0.9207071, -0.09224478, -0.6258204, 0.8196079, 1, 0, 1,
-0.9173677, -0.04226195, -1.030126, 0.8117647, 1, 0, 1,
-0.9076221, -0.215762, -2.602829, 0.8078431, 1, 0, 1,
-0.9032695, -0.2211354, -2.373191, 0.8, 1, 0, 1,
-0.902142, -1.237238, -2.860119, 0.7921569, 1, 0, 1,
-0.8891314, -1.179481, -2.209696, 0.7882353, 1, 0, 1,
-0.8891089, 0.5907033, -1.154791, 0.7803922, 1, 0, 1,
-0.8871958, -0.8919902, -1.972985, 0.7764706, 1, 0, 1,
-0.8850312, 0.7052679, -1.252673, 0.7686275, 1, 0, 1,
-0.8778142, 1.330629, -3.692122, 0.7647059, 1, 0, 1,
-0.8753754, -0.9081458, -1.796508, 0.7568628, 1, 0, 1,
-0.8701541, -1.182188, -2.298548, 0.7529412, 1, 0, 1,
-0.8694603, -2.021822, -3.666417, 0.7450981, 1, 0, 1,
-0.8662767, 0.4954007, -0.9293734, 0.7411765, 1, 0, 1,
-0.8642769, 0.8247859, -1.864059, 0.7333333, 1, 0, 1,
-0.8632479, 0.6284517, -1.3451, 0.7294118, 1, 0, 1,
-0.8620464, -3.466111, -3.80944, 0.7215686, 1, 0, 1,
-0.857446, -1.356933, -4.256684, 0.7176471, 1, 0, 1,
-0.8541833, 1.054365, -0.2190144, 0.7098039, 1, 0, 1,
-0.8446022, 0.4529053, -1.239964, 0.7058824, 1, 0, 1,
-0.8394923, -0.08200467, -2.418144, 0.6980392, 1, 0, 1,
-0.832152, -1.180317, -1.169678, 0.6901961, 1, 0, 1,
-0.8273039, 0.01831505, -1.248231, 0.6862745, 1, 0, 1,
-0.8249334, -1.331484, -0.9890223, 0.6784314, 1, 0, 1,
-0.8246484, -1.36226, -2.413695, 0.6745098, 1, 0, 1,
-0.8229969, 0.3641225, -2.017674, 0.6666667, 1, 0, 1,
-0.8226004, -0.329609, -3.862852, 0.6627451, 1, 0, 1,
-0.8216133, -1.435971, -3.741879, 0.654902, 1, 0, 1,
-0.8212134, -2.234848, -3.574659, 0.6509804, 1, 0, 1,
-0.8183833, 1.552229, 0.2270058, 0.6431373, 1, 0, 1,
-0.8097377, 1.055234, -0.8168215, 0.6392157, 1, 0, 1,
-0.8029274, -1.044247, -1.496532, 0.6313726, 1, 0, 1,
-0.7985861, 0.1350614, -1.171114, 0.627451, 1, 0, 1,
-0.7862565, -0.3953093, -2.039664, 0.6196079, 1, 0, 1,
-0.7838417, 0.3520861, -0.6508594, 0.6156863, 1, 0, 1,
-0.7773693, -2.628854, -3.416875, 0.6078432, 1, 0, 1,
-0.7740932, -0.06052808, -1.836523, 0.6039216, 1, 0, 1,
-0.7670505, -0.154805, -0.7525789, 0.5960785, 1, 0, 1,
-0.757818, -1.373526, -1.155182, 0.5882353, 1, 0, 1,
-0.7476749, 0.2120482, -1.289099, 0.5843138, 1, 0, 1,
-0.74051, 1.246174, -0.3655862, 0.5764706, 1, 0, 1,
-0.7400643, 2.201851, -0.8567147, 0.572549, 1, 0, 1,
-0.7370819, 0.8105612, 0.1696561, 0.5647059, 1, 0, 1,
-0.7370646, 0.1854805, -1.988332, 0.5607843, 1, 0, 1,
-0.7341955, -1.164245, -3.027277, 0.5529412, 1, 0, 1,
-0.732383, -0.09126927, -1.125075, 0.5490196, 1, 0, 1,
-0.7304565, 0.05757584, -2.48368, 0.5411765, 1, 0, 1,
-0.7297418, -0.1892648, -2.245993, 0.5372549, 1, 0, 1,
-0.7284181, 0.4926307, -0.4142648, 0.5294118, 1, 0, 1,
-0.7272865, 0.5621387, -2.248422, 0.5254902, 1, 0, 1,
-0.7251704, 0.6349673, -2.024612, 0.5176471, 1, 0, 1,
-0.7235193, 0.5198026, -2.921858, 0.5137255, 1, 0, 1,
-0.7198803, 0.4069202, -2.855666, 0.5058824, 1, 0, 1,
-0.7162573, -0.2099109, -3.375513, 0.5019608, 1, 0, 1,
-0.7160088, 1.716717, -0.6543685, 0.4941176, 1, 0, 1,
-0.7139434, -1.288634, -3.652544, 0.4862745, 1, 0, 1,
-0.7054322, 0.5307341, -1.576231, 0.4823529, 1, 0, 1,
-0.6962377, -0.6993564, -3.395985, 0.4745098, 1, 0, 1,
-0.6913533, 1.474113, -2.170051, 0.4705882, 1, 0, 1,
-0.6899583, 1.124113, -1.289638, 0.4627451, 1, 0, 1,
-0.6888916, -1.353854, -2.376619, 0.4588235, 1, 0, 1,
-0.6855389, -0.6934596, -1.986451, 0.4509804, 1, 0, 1,
-0.6854031, 0.3043537, -1.251604, 0.4470588, 1, 0, 1,
-0.6801068, 0.01528215, -2.101476, 0.4392157, 1, 0, 1,
-0.6789101, -1.193868, -2.535049, 0.4352941, 1, 0, 1,
-0.676851, -0.6796711, -1.5423, 0.427451, 1, 0, 1,
-0.6740005, -0.8073887, -3.121769, 0.4235294, 1, 0, 1,
-0.6730568, -1.219612, -3.524951, 0.4156863, 1, 0, 1,
-0.6716501, -0.6033779, -3.034937, 0.4117647, 1, 0, 1,
-0.6678307, 0.6562941, 0.5286912, 0.4039216, 1, 0, 1,
-0.6576056, 0.7831877, -1.957003, 0.3960784, 1, 0, 1,
-0.6523441, -2.09187, -2.321607, 0.3921569, 1, 0, 1,
-0.6517621, 1.439535, -2.231578, 0.3843137, 1, 0, 1,
-0.6510327, 0.07268988, -1.411822, 0.3803922, 1, 0, 1,
-0.6507617, 0.8516392, -0.4454061, 0.372549, 1, 0, 1,
-0.6488181, -0.7478136, -1.839857, 0.3686275, 1, 0, 1,
-0.6467196, 0.06324485, -0.6858934, 0.3607843, 1, 0, 1,
-0.6465383, 0.3903153, -3.39962, 0.3568628, 1, 0, 1,
-0.6402268, 1.052299, 1.485517, 0.3490196, 1, 0, 1,
-0.6392038, 2.213427, 1.216254, 0.345098, 1, 0, 1,
-0.6369358, 1.108809, 0.3246098, 0.3372549, 1, 0, 1,
-0.6323807, 0.06585761, -0.09050953, 0.3333333, 1, 0, 1,
-0.6301241, 1.336161, 0.03957067, 0.3254902, 1, 0, 1,
-0.6299446, -0.8366354, -3.494242, 0.3215686, 1, 0, 1,
-0.6283178, -1.067578, -2.375705, 0.3137255, 1, 0, 1,
-0.621987, 1.207592, 0.7184523, 0.3098039, 1, 0, 1,
-0.6210243, -0.7791567, -0.6542406, 0.3019608, 1, 0, 1,
-0.6168348, 0.5425385, -1.18476, 0.2941177, 1, 0, 1,
-0.6162745, -1.029976, -2.82615, 0.2901961, 1, 0, 1,
-0.6125003, -0.7104807, -3.699982, 0.282353, 1, 0, 1,
-0.6103203, 0.0878782, -2.53299, 0.2784314, 1, 0, 1,
-0.6089193, 0.491949, -1.707192, 0.2705882, 1, 0, 1,
-0.6033851, 1.742083, 0.8847945, 0.2666667, 1, 0, 1,
-0.6004487, -1.310806, -2.204651, 0.2588235, 1, 0, 1,
-0.5959778, 0.8403378, -1.207067, 0.254902, 1, 0, 1,
-0.5922349, -1.369311, -4.335044, 0.2470588, 1, 0, 1,
-0.5907684, 2.820245, 0.21759, 0.2431373, 1, 0, 1,
-0.5743485, 0.2470295, -1.253785, 0.2352941, 1, 0, 1,
-0.570649, -1.815113, -3.330925, 0.2313726, 1, 0, 1,
-0.5704595, 0.9974024, -2.168919, 0.2235294, 1, 0, 1,
-0.568949, 0.4356129, -1.100618, 0.2196078, 1, 0, 1,
-0.5662203, 2.269911, -1.039822, 0.2117647, 1, 0, 1,
-0.5605436, 0.7128379, -1.430126, 0.2078431, 1, 0, 1,
-0.5596148, -1.311048, -1.683927, 0.2, 1, 0, 1,
-0.553165, -1.583283, -2.135211, 0.1921569, 1, 0, 1,
-0.5458033, -2.082199, -4.404075, 0.1882353, 1, 0, 1,
-0.5443609, -0.8404883, -1.745334, 0.1803922, 1, 0, 1,
-0.5343922, 0.5303157, -1.105875, 0.1764706, 1, 0, 1,
-0.5312063, -0.1333927, -3.282814, 0.1686275, 1, 0, 1,
-0.5311926, 0.5826123, 1.119033, 0.1647059, 1, 0, 1,
-0.5306246, -1.103787, -1.628777, 0.1568628, 1, 0, 1,
-0.5288793, 0.8795082, -0.2812332, 0.1529412, 1, 0, 1,
-0.5273139, -0.04927357, -1.285564, 0.145098, 1, 0, 1,
-0.526261, -1.354061, -2.785913, 0.1411765, 1, 0, 1,
-0.5232093, 1.340462, -1.037461, 0.1333333, 1, 0, 1,
-0.5204315, -1.074937, -2.668974, 0.1294118, 1, 0, 1,
-0.5151358, -1.461069, -3.829676, 0.1215686, 1, 0, 1,
-0.5125355, 0.6141756, -1.402323, 0.1176471, 1, 0, 1,
-0.5107803, -0.7863547, -1.876855, 0.1098039, 1, 0, 1,
-0.5105038, -0.03794691, -2.531955, 0.1058824, 1, 0, 1,
-0.506848, -0.2930288, -0.6033943, 0.09803922, 1, 0, 1,
-0.5039259, -0.4401762, -2.33253, 0.09019608, 1, 0, 1,
-0.499786, 0.08006459, -0.7671986, 0.08627451, 1, 0, 1,
-0.4944789, 0.2035011, -1.596237, 0.07843138, 1, 0, 1,
-0.4908051, -0.4806875, -1.703653, 0.07450981, 1, 0, 1,
-0.4880058, -0.4924277, -3.26025, 0.06666667, 1, 0, 1,
-0.4843466, 0.1850314, -0.9595478, 0.0627451, 1, 0, 1,
-0.4841181, 0.4505594, -1.388786, 0.05490196, 1, 0, 1,
-0.4834061, 0.7888066, -0.3288377, 0.05098039, 1, 0, 1,
-0.4832743, -0.3758917, -1.005234, 0.04313726, 1, 0, 1,
-0.4677972, 1.023444, 0.2918413, 0.03921569, 1, 0, 1,
-0.4677859, -0.02330126, -1.415698, 0.03137255, 1, 0, 1,
-0.4632843, 1.333586, -1.249671, 0.02745098, 1, 0, 1,
-0.4622299, -0.02565899, -0.683338, 0.01960784, 1, 0, 1,
-0.4583, 0.1435378, -1.098089, 0.01568628, 1, 0, 1,
-0.4559063, 1.21962, -0.07952648, 0.007843138, 1, 0, 1,
-0.4556668, 0.3184162, -1.002276, 0.003921569, 1, 0, 1,
-0.4550359, -0.005934379, -2.488683, 0, 1, 0.003921569, 1,
-0.4537138, 0.2119137, -1.783672, 0, 1, 0.01176471, 1,
-0.4535227, -0.4331454, -0.7716147, 0, 1, 0.01568628, 1,
-0.4510339, 0.3349906, -0.8239933, 0, 1, 0.02352941, 1,
-0.4492389, 0.7958643, -0.7088073, 0, 1, 0.02745098, 1,
-0.4462064, -0.4912695, -2.989365, 0, 1, 0.03529412, 1,
-0.4461294, 0.1089331, -1.315204, 0, 1, 0.03921569, 1,
-0.4451378, 1.162396, -0.2355912, 0, 1, 0.04705882, 1,
-0.4431641, -1.036912, -1.896803, 0, 1, 0.05098039, 1,
-0.4415355, -0.2159045, -2.496264, 0, 1, 0.05882353, 1,
-0.4399413, 1.461276, -0.279932, 0, 1, 0.0627451, 1,
-0.438026, 0.1615926, 0.2251958, 0, 1, 0.07058824, 1,
-0.4371904, 0.4946204, -1.571875, 0, 1, 0.07450981, 1,
-0.4357595, -1.308773, -2.596328, 0, 1, 0.08235294, 1,
-0.4330951, 1.463774, 0.1635148, 0, 1, 0.08627451, 1,
-0.432624, -0.2546008, -2.267557, 0, 1, 0.09411765, 1,
-0.4264255, 1.117314, -0.1083498, 0, 1, 0.1019608, 1,
-0.4207348, -0.4644901, -4.026977, 0, 1, 0.1058824, 1,
-0.4157478, 1.420722, 0.5294074, 0, 1, 0.1137255, 1,
-0.4145779, -0.3540791, -3.79205, 0, 1, 0.1176471, 1,
-0.4127161, 0.8191396, -0.105615, 0, 1, 0.1254902, 1,
-0.4104143, -0.1557975, -1.409557, 0, 1, 0.1294118, 1,
-0.4039026, 0.9345657, 0.4689638, 0, 1, 0.1372549, 1,
-0.402928, 0.671002, -0.783, 0, 1, 0.1411765, 1,
-0.4009054, -0.8354412, -2.798832, 0, 1, 0.1490196, 1,
-0.400795, 0.9130837, -0.1660975, 0, 1, 0.1529412, 1,
-0.4000633, 0.4174288, -0.5552378, 0, 1, 0.1607843, 1,
-0.3968535, 0.1631535, -2.203756, 0, 1, 0.1647059, 1,
-0.3967401, 0.2854625, 0.1825453, 0, 1, 0.172549, 1,
-0.3952395, -0.8278958, -1.974621, 0, 1, 0.1764706, 1,
-0.3938035, -0.4427789, -0.817324, 0, 1, 0.1843137, 1,
-0.3936563, 0.089944, -1.426396, 0, 1, 0.1882353, 1,
-0.393122, -1.050878, -2.526604, 0, 1, 0.1960784, 1,
-0.3876925, -0.9867465, -2.155694, 0, 1, 0.2039216, 1,
-0.3868999, 1.287189, -2.484228, 0, 1, 0.2078431, 1,
-0.3826879, 1.088585, -1.1838, 0, 1, 0.2156863, 1,
-0.3820533, 2.044183, -0.5272368, 0, 1, 0.2196078, 1,
-0.3817179, 0.3333113, -1.06847, 0, 1, 0.227451, 1,
-0.3770022, -0.8376186, -2.765581, 0, 1, 0.2313726, 1,
-0.3718947, 0.9342604, -0.9537174, 0, 1, 0.2392157, 1,
-0.3716615, 0.9151926, -0.4980123, 0, 1, 0.2431373, 1,
-0.3699331, 0.7399116, -1.648003, 0, 1, 0.2509804, 1,
-0.3612405, 0.8046706, -0.9146158, 0, 1, 0.254902, 1,
-0.3573068, -0.9943982, -4.337473, 0, 1, 0.2627451, 1,
-0.3569769, 0.420957, -1.127092, 0, 1, 0.2666667, 1,
-0.3566992, 1.233638, 0.06693733, 0, 1, 0.2745098, 1,
-0.3553038, 0.3341487, 1.150267, 0, 1, 0.2784314, 1,
-0.3540724, -0.01709494, -1.130418, 0, 1, 0.2862745, 1,
-0.352587, -0.5081942, -1.535641, 0, 1, 0.2901961, 1,
-0.3520959, 0.4537469, -0.7818405, 0, 1, 0.2980392, 1,
-0.3421268, -0.329207, -3.962642, 0, 1, 0.3058824, 1,
-0.3412039, -0.1903034, -1.948793, 0, 1, 0.3098039, 1,
-0.3393058, 0.4087377, -1.615215, 0, 1, 0.3176471, 1,
-0.333036, 0.3013289, -1.861501, 0, 1, 0.3215686, 1,
-0.3276343, 1.371611, -0.1549942, 0, 1, 0.3294118, 1,
-0.327439, -0.4540858, -3.37678, 0, 1, 0.3333333, 1,
-0.3270761, -0.03117398, -1.178403, 0, 1, 0.3411765, 1,
-0.326921, -0.4684589, -3.080314, 0, 1, 0.345098, 1,
-0.3257986, -0.112098, -1.44242, 0, 1, 0.3529412, 1,
-0.3249041, -0.5497299, -3.48611, 0, 1, 0.3568628, 1,
-0.3235616, 1.528369, 1.787519, 0, 1, 0.3647059, 1,
-0.3164901, -0.6367377, -3.998722, 0, 1, 0.3686275, 1,
-0.3146602, -0.3535071, -1.757368, 0, 1, 0.3764706, 1,
-0.3118957, -0.1825245, -0.7216295, 0, 1, 0.3803922, 1,
-0.3114235, -0.3720666, -2.470227, 0, 1, 0.3882353, 1,
-0.3084193, -0.1124668, -1.678525, 0, 1, 0.3921569, 1,
-0.3080554, 0.5674073, 0.3278328, 0, 1, 0.4, 1,
-0.3048937, -0.6411605, -5.146832, 0, 1, 0.4078431, 1,
-0.304259, 1.398414, -0.02373371, 0, 1, 0.4117647, 1,
-0.2995778, 1.521043, 0.2633296, 0, 1, 0.4196078, 1,
-0.2976704, 0.06326523, -2.492251, 0, 1, 0.4235294, 1,
-0.2960861, -0.3096699, -2.556303, 0, 1, 0.4313726, 1,
-0.2926151, 0.6468994, 1.134139, 0, 1, 0.4352941, 1,
-0.2861439, -0.4592103, -3.55143, 0, 1, 0.4431373, 1,
-0.2822991, 1.223261, -0.6240124, 0, 1, 0.4470588, 1,
-0.2816159, 0.4736514, -0.6553147, 0, 1, 0.454902, 1,
-0.2803843, -1.18945, -3.578213, 0, 1, 0.4588235, 1,
-0.2759903, 0.1167604, -2.141728, 0, 1, 0.4666667, 1,
-0.275973, -0.6413971, -2.23062, 0, 1, 0.4705882, 1,
-0.2739744, -0.2330793, -2.866287, 0, 1, 0.4784314, 1,
-0.2698234, -0.002120221, -3.692088, 0, 1, 0.4823529, 1,
-0.2682838, 0.4211031, 2.487583, 0, 1, 0.4901961, 1,
-0.2673135, -3.039226, -4.801638, 0, 1, 0.4941176, 1,
-0.2628568, -1.047261, -3.518239, 0, 1, 0.5019608, 1,
-0.2627048, -1.022888, -3.732949, 0, 1, 0.509804, 1,
-0.2625473, 0.3426319, 0.2060842, 0, 1, 0.5137255, 1,
-0.261957, 1.891788, 1.571575, 0, 1, 0.5215687, 1,
-0.259803, 0.2103143, -1.484128, 0, 1, 0.5254902, 1,
-0.2587217, 0.5347065, -1.174342, 0, 1, 0.5333334, 1,
-0.2580098, 1.66087, 1.001587, 0, 1, 0.5372549, 1,
-0.2540449, 0.2666578, -0.1916132, 0, 1, 0.5450981, 1,
-0.25188, -1.338018, -1.413312, 0, 1, 0.5490196, 1,
-0.2510623, -0.8552635, -3.294469, 0, 1, 0.5568628, 1,
-0.2460622, 0.8766369, 1.0905, 0, 1, 0.5607843, 1,
-0.2430829, -0.7123886, -3.095309, 0, 1, 0.5686275, 1,
-0.2409474, 0.5939831, -0.5401152, 0, 1, 0.572549, 1,
-0.2387975, 0.5264702, -0.4918319, 0, 1, 0.5803922, 1,
-0.2338801, 0.3816994, -0.962195, 0, 1, 0.5843138, 1,
-0.2312842, 0.4001426, -1.484654, 0, 1, 0.5921569, 1,
-0.2291106, 0.5971851, -1.692469, 0, 1, 0.5960785, 1,
-0.228494, 0.1417081, 0.1392965, 0, 1, 0.6039216, 1,
-0.2247103, 2.783696, -0.784042, 0, 1, 0.6117647, 1,
-0.2237911, -0.3873409, -2.643529, 0, 1, 0.6156863, 1,
-0.2231068, 0.1585457, -1.15114, 0, 1, 0.6235294, 1,
-0.2196878, -0.8454666, -3.055183, 0, 1, 0.627451, 1,
-0.2163534, 0.1160908, 0.2432862, 0, 1, 0.6352941, 1,
-0.2131881, -1.643843, -3.319425, 0, 1, 0.6392157, 1,
-0.2122029, 0.1322709, -0.260686, 0, 1, 0.6470588, 1,
-0.2114997, -1.583021, -2.644372, 0, 1, 0.6509804, 1,
-0.2098045, 0.1424409, 0.04121443, 0, 1, 0.6588235, 1,
-0.2095727, -0.005126149, -2.068214, 0, 1, 0.6627451, 1,
-0.2073215, 0.3352773, -0.133036, 0, 1, 0.6705883, 1,
-0.1994112, 0.08512826, -1.411609, 0, 1, 0.6745098, 1,
-0.1990968, -0.003068945, -0.9683669, 0, 1, 0.682353, 1,
-0.1969632, -0.4519612, -3.000087, 0, 1, 0.6862745, 1,
-0.1944497, -0.3084133, -2.682039, 0, 1, 0.6941177, 1,
-0.1893911, 0.4258288, -0.5569041, 0, 1, 0.7019608, 1,
-0.1875315, -1.766335, -2.351268, 0, 1, 0.7058824, 1,
-0.1858609, -1.158243, -2.784373, 0, 1, 0.7137255, 1,
-0.1841013, -0.9270164, -3.708526, 0, 1, 0.7176471, 1,
-0.1839776, -0.4913191, -4.054408, 0, 1, 0.7254902, 1,
-0.18009, 0.09858957, -1.779698, 0, 1, 0.7294118, 1,
-0.1729017, -0.5151364, -2.004888, 0, 1, 0.7372549, 1,
-0.168608, -0.5156477, -3.397415, 0, 1, 0.7411765, 1,
-0.1673144, 0.4040102, 0.8736749, 0, 1, 0.7490196, 1,
-0.1658733, 0.3635487, -1.273509, 0, 1, 0.7529412, 1,
-0.1640504, 0.2422191, -0.6009495, 0, 1, 0.7607843, 1,
-0.1606026, 0.01680359, -3.327154, 0, 1, 0.7647059, 1,
-0.1578192, -0.1676976, -0.1719503, 0, 1, 0.772549, 1,
-0.1564299, -0.8432761, -3.891516, 0, 1, 0.7764706, 1,
-0.155932, -0.5586964, -2.054704, 0, 1, 0.7843137, 1,
-0.1553704, 0.6390147, 0.7338821, 0, 1, 0.7882353, 1,
-0.1526065, 0.1305249, -0.9859378, 0, 1, 0.7960784, 1,
-0.1510962, 1.111906, 0.3096729, 0, 1, 0.8039216, 1,
-0.1498273, 0.4963851, -1.476561, 0, 1, 0.8078431, 1,
-0.1474117, -1.451546, -3.968068, 0, 1, 0.8156863, 1,
-0.1438989, -1.856191, -2.867729, 0, 1, 0.8196079, 1,
-0.1426417, -0.9774221, -3.343637, 0, 1, 0.827451, 1,
-0.1426227, -0.2407203, -2.485887, 0, 1, 0.8313726, 1,
-0.1422821, -0.09765796, -2.803762, 0, 1, 0.8392157, 1,
-0.1341404, -1.007057, -3.250821, 0, 1, 0.8431373, 1,
-0.1338281, 0.8488712, 1.245062, 0, 1, 0.8509804, 1,
-0.1325979, 0.8943774, -0.03041885, 0, 1, 0.854902, 1,
-0.1314297, 0.9541464, -0.1291679, 0, 1, 0.8627451, 1,
-0.131056, 1.076458, -1.487547, 0, 1, 0.8666667, 1,
-0.1255879, 0.7385901, -2.047715, 0, 1, 0.8745098, 1,
-0.125256, 0.5177428, 0.9649115, 0, 1, 0.8784314, 1,
-0.1244492, -1.50196, -3.124643, 0, 1, 0.8862745, 1,
-0.117625, 2.199715, 0.6130268, 0, 1, 0.8901961, 1,
-0.1163787, -0.2340406, -1.974082, 0, 1, 0.8980392, 1,
-0.116305, -0.6165913, -1.870905, 0, 1, 0.9058824, 1,
-0.1149868, -0.2199675, -2.13354, 0, 1, 0.9098039, 1,
-0.1140619, 0.230527, 0.7409438, 0, 1, 0.9176471, 1,
-0.1131968, 1.754487, -1.573317, 0, 1, 0.9215686, 1,
-0.1089143, -0.0702478, -2.554804, 0, 1, 0.9294118, 1,
-0.107203, 0.2101491, 0.03410864, 0, 1, 0.9333333, 1,
-0.1063625, -0.9674774, -3.649045, 0, 1, 0.9411765, 1,
-0.1054185, -0.4852385, -2.806749, 0, 1, 0.945098, 1,
-0.1002723, 1.260046, 1.382373, 0, 1, 0.9529412, 1,
-0.09846243, 0.7980742, -1.733619, 0, 1, 0.9568627, 1,
-0.09835792, -0.782083, -1.968094, 0, 1, 0.9647059, 1,
-0.09651381, 0.9527127, 0.7724885, 0, 1, 0.9686275, 1,
-0.09625926, 1.189331, -1.662828, 0, 1, 0.9764706, 1,
-0.09259563, 0.8762586, 0.5156025, 0, 1, 0.9803922, 1,
-0.08756542, 1.767852, -0.5684469, 0, 1, 0.9882353, 1,
-0.08539975, 0.6657282, 0.7147673, 0, 1, 0.9921569, 1,
-0.08148083, 1.020347, 0.4194675, 0, 1, 1, 1,
-0.08091486, -0.8255325, -5.124787, 0, 0.9921569, 1, 1,
-0.07365127, 2.009444, -0.5587311, 0, 0.9882353, 1, 1,
-0.07250954, -0.7421161, -2.625642, 0, 0.9803922, 1, 1,
-0.06138183, 0.2433113, -1.807774, 0, 0.9764706, 1, 1,
-0.06107879, -0.2406096, -2.690347, 0, 0.9686275, 1, 1,
-0.05932428, -0.6319051, -3.220109, 0, 0.9647059, 1, 1,
-0.05927947, 0.7022988, -0.306854, 0, 0.9568627, 1, 1,
-0.05879439, -1.172734, -2.577424, 0, 0.9529412, 1, 1,
-0.05822339, 0.3110249, -0.06716454, 0, 0.945098, 1, 1,
-0.05624288, 0.6347131, -0.6112866, 0, 0.9411765, 1, 1,
-0.05341347, 0.1789625, 2.185804, 0, 0.9333333, 1, 1,
-0.05182291, 0.4158575, -0.6377917, 0, 0.9294118, 1, 1,
-0.04881456, -1.088043, -3.208192, 0, 0.9215686, 1, 1,
-0.04868113, -1.31434, -3.240472, 0, 0.9176471, 1, 1,
-0.03970401, -0.0564747, -2.165118, 0, 0.9098039, 1, 1,
-0.03749462, 0.8548782, 0.6863621, 0, 0.9058824, 1, 1,
-0.0373699, -0.5110278, -2.531012, 0, 0.8980392, 1, 1,
-0.0324358, -0.2258311, -5.032605, 0, 0.8901961, 1, 1,
-0.02876246, -0.1546089, -3.83755, 0, 0.8862745, 1, 1,
-0.02695895, -0.002579028, -1.460218, 0, 0.8784314, 1, 1,
-0.02590545, 0.5159327, -0.07990697, 0, 0.8745098, 1, 1,
-0.02421847, -0.5592927, -2.997821, 0, 0.8666667, 1, 1,
-0.02269969, -1.176794, -2.550522, 0, 0.8627451, 1, 1,
-0.02189421, -0.7126409, -1.67168, 0, 0.854902, 1, 1,
-0.02161342, 1.476423, 0.5315914, 0, 0.8509804, 1, 1,
-0.02025672, -2.046763, -0.9138811, 0, 0.8431373, 1, 1,
-0.01834505, 0.5037214, 1.628603, 0, 0.8392157, 1, 1,
-0.01701872, -0.08881288, -3.118421, 0, 0.8313726, 1, 1,
-0.01573723, 0.4802369, 0.3171014, 0, 0.827451, 1, 1,
-0.0155402, -0.5894557, -2.967602, 0, 0.8196079, 1, 1,
-0.01208128, -2.308288, -3.192485, 0, 0.8156863, 1, 1,
-0.006193657, -0.5161471, -1.981453, 0, 0.8078431, 1, 1,
-0.006146404, -0.3683212, -4.116411, 0, 0.8039216, 1, 1,
-0.005223395, -1.067403, -4.013333, 0, 0.7960784, 1, 1,
-0.004356945, -0.7730461, -4.751303, 0, 0.7882353, 1, 1,
-0.002804301, 0.06868423, -0.4150662, 0, 0.7843137, 1, 1,
-0.0001193143, 0.2195096, -0.6996185, 0, 0.7764706, 1, 1,
0.006303323, -0.3799569, 3.723938, 0, 0.772549, 1, 1,
0.00866982, -0.009434906, 2.253808, 0, 0.7647059, 1, 1,
0.009622645, -0.5962192, 3.077016, 0, 0.7607843, 1, 1,
0.01025485, -0.3519821, 6.128102, 0, 0.7529412, 1, 1,
0.01839002, -1.32353, 4.482031, 0, 0.7490196, 1, 1,
0.01911315, -0.01761908, 2.850927, 0, 0.7411765, 1, 1,
0.02005546, 1.152233, -0.3341813, 0, 0.7372549, 1, 1,
0.02309099, -0.2652303, 2.778687, 0, 0.7294118, 1, 1,
0.02426196, -0.4664016, 3.445473, 0, 0.7254902, 1, 1,
0.02549587, -0.7384195, 2.952727, 0, 0.7176471, 1, 1,
0.0277465, -0.2413722, 2.820416, 0, 0.7137255, 1, 1,
0.03742943, -0.4295155, 1.854248, 0, 0.7058824, 1, 1,
0.04104837, 0.2938799, 1.000836, 0, 0.6980392, 1, 1,
0.04422997, -0.5546252, 3.324622, 0, 0.6941177, 1, 1,
0.04660815, 0.5669562, 1.49966, 0, 0.6862745, 1, 1,
0.04917321, -1.237177, 2.198878, 0, 0.682353, 1, 1,
0.05271801, -0.1850723, 2.807165, 0, 0.6745098, 1, 1,
0.05364971, 0.8738147, -0.5894392, 0, 0.6705883, 1, 1,
0.05549426, 0.6821043, -0.2456222, 0, 0.6627451, 1, 1,
0.05752203, 0.401719, 1.927573, 0, 0.6588235, 1, 1,
0.05910403, -0.4061967, 3.395925, 0, 0.6509804, 1, 1,
0.06424791, 0.2249267, -0.6069556, 0, 0.6470588, 1, 1,
0.06540677, 1.084003, 0.710701, 0, 0.6392157, 1, 1,
0.06716239, -0.475385, 2.195849, 0, 0.6352941, 1, 1,
0.07075362, 0.4604645, 0.7286064, 0, 0.627451, 1, 1,
0.07467114, -0.1997729, 2.660873, 0, 0.6235294, 1, 1,
0.07655033, 0.6220216, -0.04480245, 0, 0.6156863, 1, 1,
0.07911668, 0.7534888, 0.3801683, 0, 0.6117647, 1, 1,
0.08458591, -0.1922877, 2.500742, 0, 0.6039216, 1, 1,
0.08535014, 0.5254655, 0.8477446, 0, 0.5960785, 1, 1,
0.08868701, 2.219456, 0.1716136, 0, 0.5921569, 1, 1,
0.08911993, 0.0412706, 0.8344019, 0, 0.5843138, 1, 1,
0.09244966, -0.5972583, 2.106156, 0, 0.5803922, 1, 1,
0.09261059, -0.2360646, 2.750502, 0, 0.572549, 1, 1,
0.09910604, 1.265077, 0.4887449, 0, 0.5686275, 1, 1,
0.09989747, -0.4964406, 2.331052, 0, 0.5607843, 1, 1,
0.1012228, -1.251718, 3.567691, 0, 0.5568628, 1, 1,
0.1014065, 2.062568, 0.2362286, 0, 0.5490196, 1, 1,
0.102487, -0.2185167, 2.832569, 0, 0.5450981, 1, 1,
0.1044351, -1.186112, 2.70744, 0, 0.5372549, 1, 1,
0.1087078, 0.1702006, 2.27898, 0, 0.5333334, 1, 1,
0.1103705, 1.628998, 0.1360507, 0, 0.5254902, 1, 1,
0.111933, 0.246896, 0.4946845, 0, 0.5215687, 1, 1,
0.1134871, -0.2545563, 1.783505, 0, 0.5137255, 1, 1,
0.1141289, 0.5773521, -0.5505175, 0, 0.509804, 1, 1,
0.1273896, 1.371445, -1.293153, 0, 0.5019608, 1, 1,
0.1281953, -0.05233769, 1.817045, 0, 0.4941176, 1, 1,
0.1390821, -0.9557186, 1.57946, 0, 0.4901961, 1, 1,
0.1431367, 0.375795, -0.4582075, 0, 0.4823529, 1, 1,
0.1548278, -0.6859535, 3.022965, 0, 0.4784314, 1, 1,
0.1584865, -0.3751086, 3.938976, 0, 0.4705882, 1, 1,
0.1593646, -0.8877605, 4.012759, 0, 0.4666667, 1, 1,
0.159994, -0.3709463, 0.997889, 0, 0.4588235, 1, 1,
0.1610122, -0.3214962, 3.724274, 0, 0.454902, 1, 1,
0.1640226, 0.4027429, 1.020218, 0, 0.4470588, 1, 1,
0.1654795, 0.6566615, 1.189273, 0, 0.4431373, 1, 1,
0.1681303, -2.161258, 1.053901, 0, 0.4352941, 1, 1,
0.1689356, -0.7815641, 4.649946, 0, 0.4313726, 1, 1,
0.1701676, 1.518503, -0.2543498, 0, 0.4235294, 1, 1,
0.1707465, 0.4010528, -0.176009, 0, 0.4196078, 1, 1,
0.1741315, -0.3887627, 0.6354043, 0, 0.4117647, 1, 1,
0.1741725, -0.155788, 3.446109, 0, 0.4078431, 1, 1,
0.1772661, -2.097964, 2.430797, 0, 0.4, 1, 1,
0.1773696, -0.01879721, 2.39141, 0, 0.3921569, 1, 1,
0.1828643, -0.2164061, 2.213095, 0, 0.3882353, 1, 1,
0.1854537, 0.3899518, -0.1269422, 0, 0.3803922, 1, 1,
0.1866335, -0.5805899, 3.143591, 0, 0.3764706, 1, 1,
0.2008809, -0.5464724, 2.989068, 0, 0.3686275, 1, 1,
0.2010121, -0.7823282, 0.0864323, 0, 0.3647059, 1, 1,
0.2016538, -1.246884, 4.659266, 0, 0.3568628, 1, 1,
0.2025509, 0.1590703, 0.01478474, 0, 0.3529412, 1, 1,
0.203014, 0.3557695, 0.3739007, 0, 0.345098, 1, 1,
0.2065619, 0.7036445, -1.467749, 0, 0.3411765, 1, 1,
0.209033, 0.1217473, 0.642598, 0, 0.3333333, 1, 1,
0.2100005, -0.8345191, 2.218343, 0, 0.3294118, 1, 1,
0.2112995, 0.3994697, 0.3742929, 0, 0.3215686, 1, 1,
0.2127445, 1.067269, -0.07788008, 0, 0.3176471, 1, 1,
0.2171121, -1.529758, 1.77882, 0, 0.3098039, 1, 1,
0.2191014, -0.4820078, 3.583031, 0, 0.3058824, 1, 1,
0.2260084, 1.516396, -1.55747, 0, 0.2980392, 1, 1,
0.227298, 0.8002047, 1.265453, 0, 0.2901961, 1, 1,
0.229442, 0.3988904, 1.506749, 0, 0.2862745, 1, 1,
0.2313131, 0.7230563, 1.716131, 0, 0.2784314, 1, 1,
0.2322285, 0.4594492, -1.474072, 0, 0.2745098, 1, 1,
0.2349383, 1.26138, -1.055861, 0, 0.2666667, 1, 1,
0.2371576, -1.288823, 2.560265, 0, 0.2627451, 1, 1,
0.2380489, -1.079632, 2.405004, 0, 0.254902, 1, 1,
0.2438292, 1.989433, -2.416214, 0, 0.2509804, 1, 1,
0.2457562, 1.120562, -0.04423688, 0, 0.2431373, 1, 1,
0.2546736, 0.1055805, 0.6741753, 0, 0.2392157, 1, 1,
0.2549435, -0.8251433, 1.927222, 0, 0.2313726, 1, 1,
0.2555655, 1.841821, 0.476163, 0, 0.227451, 1, 1,
0.2587774, -1.020949, 2.524843, 0, 0.2196078, 1, 1,
0.2621749, -1.240386, 2.365981, 0, 0.2156863, 1, 1,
0.2659318, -0.5298828, 2.556935, 0, 0.2078431, 1, 1,
0.2762504, -0.6811392, 3.009267, 0, 0.2039216, 1, 1,
0.2790124, -0.7872451, 3.362453, 0, 0.1960784, 1, 1,
0.2866688, -0.851584, 3.60993, 0, 0.1882353, 1, 1,
0.2868161, 1.768231, 0.824266, 0, 0.1843137, 1, 1,
0.2872954, 0.9998174, 2.575392, 0, 0.1764706, 1, 1,
0.288251, 0.2476947, -0.0690326, 0, 0.172549, 1, 1,
0.2902668, -0.586128, 3.55564, 0, 0.1647059, 1, 1,
0.2906618, -0.4040027, 2.762066, 0, 0.1607843, 1, 1,
0.290902, 2.550085, -0.7812649, 0, 0.1529412, 1, 1,
0.2919414, 0.8023398, 1.208362, 0, 0.1490196, 1, 1,
0.2923862, 0.1820421, 1.926662, 0, 0.1411765, 1, 1,
0.2936882, 0.8411885, 0.3693362, 0, 0.1372549, 1, 1,
0.2972889, -0.649239, 2.237775, 0, 0.1294118, 1, 1,
0.3086038, 1.011853, 2.639697, 0, 0.1254902, 1, 1,
0.3098108, -0.2187095, 3.279125, 0, 0.1176471, 1, 1,
0.3166908, 1.296768, -0.0904687, 0, 0.1137255, 1, 1,
0.3195597, 0.9498256, 3.272463, 0, 0.1058824, 1, 1,
0.3249068, -1.033907, 1.471508, 0, 0.09803922, 1, 1,
0.3318575, -0.4052893, 3.632325, 0, 0.09411765, 1, 1,
0.3324866, -0.970147, 3.241186, 0, 0.08627451, 1, 1,
0.332675, 1.098888, -0.3328301, 0, 0.08235294, 1, 1,
0.3330006, 0.7150765, 1.983565, 0, 0.07450981, 1, 1,
0.3330287, -0.4829471, 2.808319, 0, 0.07058824, 1, 1,
0.3351743, 0.07550059, 1.448459, 0, 0.0627451, 1, 1,
0.3374961, -2.703392, 4.261349, 0, 0.05882353, 1, 1,
0.3378302, -0.9785528, 2.749484, 0, 0.05098039, 1, 1,
0.3419312, -0.6202248, 1.873636, 0, 0.04705882, 1, 1,
0.3472548, 0.4189746, 1.585662, 0, 0.03921569, 1, 1,
0.3524784, -0.7477241, 1.968978, 0, 0.03529412, 1, 1,
0.3557384, -1.985358, 2.467626, 0, 0.02745098, 1, 1,
0.3564578, 0.4318722, -1.4496, 0, 0.02352941, 1, 1,
0.3598615, -1.331384, 1.559425, 0, 0.01568628, 1, 1,
0.3612465, 0.5514586, 1.933625, 0, 0.01176471, 1, 1,
0.3626754, -0.3237958, 3.756237, 0, 0.003921569, 1, 1,
0.3666177, 0.5205077, -0.4522364, 0.003921569, 0, 1, 1,
0.3673835, -0.1579262, 0.3637521, 0.007843138, 0, 1, 1,
0.3712489, -0.1886379, 1.727948, 0.01568628, 0, 1, 1,
0.3763348, 1.506112, -0.3307339, 0.01960784, 0, 1, 1,
0.3781069, -0.7659858, 4.018336, 0.02745098, 0, 1, 1,
0.3788827, 0.3514735, 0.3005015, 0.03137255, 0, 1, 1,
0.3822202, -0.2443696, 2.079677, 0.03921569, 0, 1, 1,
0.3871116, -0.9558957, 2.327567, 0.04313726, 0, 1, 1,
0.3886078, -1.171785, 2.480477, 0.05098039, 0, 1, 1,
0.3886922, 1.534403, 1.926932, 0.05490196, 0, 1, 1,
0.3909194, 1.086022, -1.637556, 0.0627451, 0, 1, 1,
0.3958637, 0.331819, 1.866788, 0.06666667, 0, 1, 1,
0.3959464, 0.4749649, 0.7089765, 0.07450981, 0, 1, 1,
0.3986354, 0.4098813, 0.1689994, 0.07843138, 0, 1, 1,
0.3998131, -1.752631, 3.948065, 0.08627451, 0, 1, 1,
0.4018956, -0.8072314, 1.389237, 0.09019608, 0, 1, 1,
0.4025712, 1.447864, 1.251379, 0.09803922, 0, 1, 1,
0.4108487, -1.196228, 3.82133, 0.1058824, 0, 1, 1,
0.4130367, -0.3433919, 0.7422652, 0.1098039, 0, 1, 1,
0.4140502, 0.1230326, 0.1012558, 0.1176471, 0, 1, 1,
0.4143644, 0.1649304, 2.616839, 0.1215686, 0, 1, 1,
0.4152958, 0.5476104, -1.12642, 0.1294118, 0, 1, 1,
0.4191772, -1.201308, 1.784823, 0.1333333, 0, 1, 1,
0.4205031, 0.2005236, -1.012642, 0.1411765, 0, 1, 1,
0.4286493, -1.305269, 1.563581, 0.145098, 0, 1, 1,
0.4336846, -0.5376937, 3.061144, 0.1529412, 0, 1, 1,
0.4347882, -1.088304, 1.701363, 0.1568628, 0, 1, 1,
0.4355129, -0.479006, 1.732677, 0.1647059, 0, 1, 1,
0.4366567, -0.8107907, 2.506941, 0.1686275, 0, 1, 1,
0.4419953, 0.3800998, 0.6382881, 0.1764706, 0, 1, 1,
0.4481457, 1.283822, -1.083627, 0.1803922, 0, 1, 1,
0.4504848, 1.478233, -0.2496884, 0.1882353, 0, 1, 1,
0.4512861, 1.266494, -3.025759, 0.1921569, 0, 1, 1,
0.4562373, -0.8020216, 1.442373, 0.2, 0, 1, 1,
0.4604887, -0.3877026, 2.021145, 0.2078431, 0, 1, 1,
0.4661794, -1.845695, 1.68782, 0.2117647, 0, 1, 1,
0.4663624, 0.5213171, 1.194416, 0.2196078, 0, 1, 1,
0.4665315, 0.7153407, -0.210202, 0.2235294, 0, 1, 1,
0.4714083, 2.079127, -0.2618144, 0.2313726, 0, 1, 1,
0.471865, -0.2512221, 2.081825, 0.2352941, 0, 1, 1,
0.4725585, -0.4713429, 3.650291, 0.2431373, 0, 1, 1,
0.4764052, 0.2054224, 3.7403, 0.2470588, 0, 1, 1,
0.4807602, 0.7822359, 2.518104, 0.254902, 0, 1, 1,
0.4861082, 0.9676177, 0.1717332, 0.2588235, 0, 1, 1,
0.4914494, -1.030568, 3.954485, 0.2666667, 0, 1, 1,
0.4939525, -0.613337, 3.525589, 0.2705882, 0, 1, 1,
0.4955547, 0.3214343, -1.749998, 0.2784314, 0, 1, 1,
0.5019426, -0.1698418, 0.656195, 0.282353, 0, 1, 1,
0.5058054, 0.6197639, 0.6039231, 0.2901961, 0, 1, 1,
0.5115348, -0.5581293, 4.140453, 0.2941177, 0, 1, 1,
0.5143037, 1.498592, 0.9503524, 0.3019608, 0, 1, 1,
0.5145801, 1.444043, -0.006217592, 0.3098039, 0, 1, 1,
0.5214699, 0.4718386, -0.1758035, 0.3137255, 0, 1, 1,
0.5259862, -0.8705766, 2.013394, 0.3215686, 0, 1, 1,
0.5333108, 0.7998169, 0.5845382, 0.3254902, 0, 1, 1,
0.535528, 0.6165422, 0.9033156, 0.3333333, 0, 1, 1,
0.5360622, 0.952171, 0.1626594, 0.3372549, 0, 1, 1,
0.5377842, 0.1976079, 2.15314, 0.345098, 0, 1, 1,
0.5412884, 1.344506, 1.215456, 0.3490196, 0, 1, 1,
0.5433077, -2.608654, 3.267968, 0.3568628, 0, 1, 1,
0.5475315, 1.477847, 0.7566401, 0.3607843, 0, 1, 1,
0.5481412, -0.7977033, 3.708606, 0.3686275, 0, 1, 1,
0.5512548, -0.2909394, 1.378821, 0.372549, 0, 1, 1,
0.5513819, -1.700739, 2.898495, 0.3803922, 0, 1, 1,
0.5571679, -0.7166151, 0.5595109, 0.3843137, 0, 1, 1,
0.5593786, 0.8069648, 0.8428606, 0.3921569, 0, 1, 1,
0.5606484, 1.973993, 0.5384667, 0.3960784, 0, 1, 1,
0.5612274, -0.7844876, 2.467037, 0.4039216, 0, 1, 1,
0.5637108, -0.3325124, 3.538062, 0.4117647, 0, 1, 1,
0.5639682, 0.7414919, 1.204433, 0.4156863, 0, 1, 1,
0.5654704, 0.1055871, 1.12657, 0.4235294, 0, 1, 1,
0.5676051, 0.7625619, 0.6946445, 0.427451, 0, 1, 1,
0.5750385, 2.084427, 0.7692912, 0.4352941, 0, 1, 1,
0.5768133, 0.4154096, 0.3116249, 0.4392157, 0, 1, 1,
0.584807, 0.09639633, 1.017067, 0.4470588, 0, 1, 1,
0.596831, 1.115996, 1.610976, 0.4509804, 0, 1, 1,
0.5987191, -0.03185198, 1.425062, 0.4588235, 0, 1, 1,
0.6079328, -1.314613, 1.592586, 0.4627451, 0, 1, 1,
0.618307, -0.8839009, 1.559388, 0.4705882, 0, 1, 1,
0.6187183, -1.062306, 2.32937, 0.4745098, 0, 1, 1,
0.6259884, 0.5710673, 3.200655, 0.4823529, 0, 1, 1,
0.6296657, -0.136701, 2.899897, 0.4862745, 0, 1, 1,
0.6318558, 0.3875908, 1.145295, 0.4941176, 0, 1, 1,
0.6352279, -1.812189, 2.046336, 0.5019608, 0, 1, 1,
0.6405013, 1.001858, 0.9471557, 0.5058824, 0, 1, 1,
0.6461411, 0.7991517, 1.510469, 0.5137255, 0, 1, 1,
0.6487188, 0.08430258, 1.829334, 0.5176471, 0, 1, 1,
0.6525196, -1.69317, 1.585942, 0.5254902, 0, 1, 1,
0.6558601, -1.155891, 3.616178, 0.5294118, 0, 1, 1,
0.6624033, 0.8587959, -0.1841508, 0.5372549, 0, 1, 1,
0.6650596, 0.8815381, 1.105411, 0.5411765, 0, 1, 1,
0.6691515, -1.36609, 3.870856, 0.5490196, 0, 1, 1,
0.6702815, -0.5685278, 0.1856352, 0.5529412, 0, 1, 1,
0.6772617, 0.343041, 1.63992, 0.5607843, 0, 1, 1,
0.6779464, 1.065922, 0.3252095, 0.5647059, 0, 1, 1,
0.6789001, -0.6934631, 3.330543, 0.572549, 0, 1, 1,
0.683002, 0.7961683, 0.8386203, 0.5764706, 0, 1, 1,
0.689023, -1.016988, 2.335976, 0.5843138, 0, 1, 1,
0.694217, 1.056641, 0.6318445, 0.5882353, 0, 1, 1,
0.6990873, 0.3372963, 2.765045, 0.5960785, 0, 1, 1,
0.7046155, 1.863889, 0.1764697, 0.6039216, 0, 1, 1,
0.7063566, -1.462606, 3.612045, 0.6078432, 0, 1, 1,
0.7090625, 2.102351, 0.001865735, 0.6156863, 0, 1, 1,
0.7110334, 0.04268751, 1.142581, 0.6196079, 0, 1, 1,
0.7113041, -0.5944216, 3.146221, 0.627451, 0, 1, 1,
0.712006, 1.005919, 2.142069, 0.6313726, 0, 1, 1,
0.7127363, 1.221721, 0.9396844, 0.6392157, 0, 1, 1,
0.7131799, 1.413075, -0.5183995, 0.6431373, 0, 1, 1,
0.7141393, -1.398634, 3.561144, 0.6509804, 0, 1, 1,
0.7192529, -0.442987, 2.335786, 0.654902, 0, 1, 1,
0.7225947, 0.3105033, 0.6639761, 0.6627451, 0, 1, 1,
0.7236633, 0.2720234, 1.023297, 0.6666667, 0, 1, 1,
0.7298362, -0.04869182, -1.557327, 0.6745098, 0, 1, 1,
0.7311515, -0.9865355, 2.60805, 0.6784314, 0, 1, 1,
0.7336358, 0.8514847, 0.3944575, 0.6862745, 0, 1, 1,
0.7362213, 1.293329, 0.8426722, 0.6901961, 0, 1, 1,
0.7371135, 1.531862, 1.663615, 0.6980392, 0, 1, 1,
0.7416315, 0.07417419, 0.07098055, 0.7058824, 0, 1, 1,
0.7476453, -0.0678122, 1.612427, 0.7098039, 0, 1, 1,
0.7508377, 1.685046, -1.043194, 0.7176471, 0, 1, 1,
0.7513806, 1.291621, -0.05933966, 0.7215686, 0, 1, 1,
0.7517326, -0.1473568, 2.177375, 0.7294118, 0, 1, 1,
0.7683026, -0.8068032, 3.93772, 0.7333333, 0, 1, 1,
0.7684532, -0.3640035, 3.024448, 0.7411765, 0, 1, 1,
0.7716677, 2.303583, 2.585067, 0.7450981, 0, 1, 1,
0.7744586, 0.3014264, 1.591, 0.7529412, 0, 1, 1,
0.7785199, 0.3614641, 0.969008, 0.7568628, 0, 1, 1,
0.7825558, 0.144758, 1.67796, 0.7647059, 0, 1, 1,
0.7911772, -0.5021531, 1.783875, 0.7686275, 0, 1, 1,
0.791233, 0.7360646, 1.48991, 0.7764706, 0, 1, 1,
0.7927271, -0.8198934, 1.235329, 0.7803922, 0, 1, 1,
0.7928634, -0.1857643, 2.175725, 0.7882353, 0, 1, 1,
0.8059612, 0.3418671, -0.3452555, 0.7921569, 0, 1, 1,
0.8151736, -1.651019, 2.312391, 0.8, 0, 1, 1,
0.8174117, -0.3254169, 1.742607, 0.8078431, 0, 1, 1,
0.8183767, -0.8792813, 1.259559, 0.8117647, 0, 1, 1,
0.8214611, -1.533224, 3.134465, 0.8196079, 0, 1, 1,
0.8235261, 0.5757515, 0.460366, 0.8235294, 0, 1, 1,
0.8243451, 0.1387399, 0.9223646, 0.8313726, 0, 1, 1,
0.8259196, -0.836383, 3.442416, 0.8352941, 0, 1, 1,
0.8358036, 0.9215162, 1.093209, 0.8431373, 0, 1, 1,
0.8397199, -0.1949933, 2.47666, 0.8470588, 0, 1, 1,
0.845435, -0.9319584, 2.501327, 0.854902, 0, 1, 1,
0.8490698, -0.1174518, 2.548095, 0.8588235, 0, 1, 1,
0.8537632, -0.693455, 0.9143966, 0.8666667, 0, 1, 1,
0.8564841, -0.8776114, 1.632269, 0.8705882, 0, 1, 1,
0.8567874, 1.735929, 1.810848, 0.8784314, 0, 1, 1,
0.8578538, -1.401221, 1.619288, 0.8823529, 0, 1, 1,
0.8692425, 1.052628, 1.002184, 0.8901961, 0, 1, 1,
0.8757757, 0.8524758, 0.7178499, 0.8941177, 0, 1, 1,
0.8764673, -0.4959757, 3.532298, 0.9019608, 0, 1, 1,
0.880289, -0.3788843, 2.314004, 0.9098039, 0, 1, 1,
0.8851699, 0.6695772, 0.1202826, 0.9137255, 0, 1, 1,
0.8856025, -0.5168273, -0.04815744, 0.9215686, 0, 1, 1,
0.8864474, 0.2202937, 1.760574, 0.9254902, 0, 1, 1,
0.8946672, 0.5505018, 0.08762044, 0.9333333, 0, 1, 1,
0.8987573, 0.1626036, 2.557311, 0.9372549, 0, 1, 1,
0.8994229, 1.416176, -0.5977978, 0.945098, 0, 1, 1,
0.8994361, -0.501013, 3.066045, 0.9490196, 0, 1, 1,
0.8996617, 0.9219843, 0.3450478, 0.9568627, 0, 1, 1,
0.9082996, -0.5127509, 1.223032, 0.9607843, 0, 1, 1,
0.9114267, 1.589126, 1.81412, 0.9686275, 0, 1, 1,
0.9142427, 0.1746653, 1.874451, 0.972549, 0, 1, 1,
0.9157509, -1.119483, 0.7770391, 0.9803922, 0, 1, 1,
0.9179087, 0.6985101, 1.217092, 0.9843137, 0, 1, 1,
0.9238254, -0.3328534, 1.526493, 0.9921569, 0, 1, 1,
0.9318934, 2.155523, -1.427915, 0.9960784, 0, 1, 1,
0.9372379, 0.3525568, 2.079043, 1, 0, 0.9960784, 1,
0.9510541, 0.8157707, 2.452277, 1, 0, 0.9882353, 1,
0.9557151, 1.288054, 0.6418379, 1, 0, 0.9843137, 1,
0.9610337, -1.093621, 2.821486, 1, 0, 0.9764706, 1,
0.963437, 3.004094, 1.179467, 1, 0, 0.972549, 1,
0.9652691, -0.2209349, 1.101827, 1, 0, 0.9647059, 1,
0.966456, 1.724616, 0.09737455, 1, 0, 0.9607843, 1,
0.9739285, 0.351805, 1.045895, 1, 0, 0.9529412, 1,
0.9828333, 0.01595264, 0.2155588, 1, 0, 0.9490196, 1,
0.9846155, -0.1133614, 2.336582, 1, 0, 0.9411765, 1,
0.9855859, 2.325735, 0.1240175, 1, 0, 0.9372549, 1,
0.992402, 0.7553611, -0.2073003, 1, 0, 0.9294118, 1,
0.9962217, -0.2685499, 0.8832152, 1, 0, 0.9254902, 1,
1.00092, -1.534771, 3.560903, 1, 0, 0.9176471, 1,
1.004664, 0.1889676, 0.7391536, 1, 0, 0.9137255, 1,
1.009753, -0.04587966, 0.2701795, 1, 0, 0.9058824, 1,
1.009943, 0.1167545, 0.5572307, 1, 0, 0.9019608, 1,
1.015566, -0.3405932, 2.982879, 1, 0, 0.8941177, 1,
1.01801, 0.2158172, 0.7047054, 1, 0, 0.8862745, 1,
1.023311, 1.169409, 0.04650886, 1, 0, 0.8823529, 1,
1.028105, -0.001746765, 2.002495, 1, 0, 0.8745098, 1,
1.038946, -0.3266699, 1.140683, 1, 0, 0.8705882, 1,
1.047907, 1.000841, 2.027476, 1, 0, 0.8627451, 1,
1.04824, 2.023337, 1.051481, 1, 0, 0.8588235, 1,
1.050253, 0.2669662, -0.5967947, 1, 0, 0.8509804, 1,
1.052658, -0.7668025, 1.09102, 1, 0, 0.8470588, 1,
1.057953, 0.09984872, 0.8315498, 1, 0, 0.8392157, 1,
1.063225, 0.8362976, 1.202919, 1, 0, 0.8352941, 1,
1.072452, -0.6897513, 2.585463, 1, 0, 0.827451, 1,
1.080232, 1.455088, 0.08620501, 1, 0, 0.8235294, 1,
1.085392, -0.2202667, 2.095364, 1, 0, 0.8156863, 1,
1.087564, -0.7524842, 2.986557, 1, 0, 0.8117647, 1,
1.087743, -0.5395845, 1.846966, 1, 0, 0.8039216, 1,
1.090072, 1.270267, 0.8058729, 1, 0, 0.7960784, 1,
1.10906, -1.709274, 4.011517, 1, 0, 0.7921569, 1,
1.131548, -0.8468423, 2.825665, 1, 0, 0.7843137, 1,
1.132586, 1.128688, -0.5274185, 1, 0, 0.7803922, 1,
1.140277, 0.7977597, 2.244887, 1, 0, 0.772549, 1,
1.144594, 0.1086593, 2.242937, 1, 0, 0.7686275, 1,
1.147454, -0.3135433, 2.107864, 1, 0, 0.7607843, 1,
1.172065, 0.4225943, 1.458275, 1, 0, 0.7568628, 1,
1.175282, -1.64483, 1.81083, 1, 0, 0.7490196, 1,
1.17783, 1.380891, -1.189413, 1, 0, 0.7450981, 1,
1.180122, 0.3823638, 3.494088, 1, 0, 0.7372549, 1,
1.218806, -0.3605501, 1.597965, 1, 0, 0.7333333, 1,
1.219396, -0.8044977, -0.297108, 1, 0, 0.7254902, 1,
1.228341, -1.722916, 2.136356, 1, 0, 0.7215686, 1,
1.238497, 0.3650736, 0.7858024, 1, 0, 0.7137255, 1,
1.239634, 1.495053, 2.165715, 1, 0, 0.7098039, 1,
1.241629, 1.998496, 0.4078385, 1, 0, 0.7019608, 1,
1.250096, -1.168286, 0.8995128, 1, 0, 0.6941177, 1,
1.252241, -1.795401, 3.426379, 1, 0, 0.6901961, 1,
1.259694, -0.6051461, 1.860894, 1, 0, 0.682353, 1,
1.260335, -0.5476854, 1.931679, 1, 0, 0.6784314, 1,
1.262542, 0.08293619, 1.308912, 1, 0, 0.6705883, 1,
1.262591, 0.7451342, -0.1925338, 1, 0, 0.6666667, 1,
1.264805, -0.8901299, 2.838248, 1, 0, 0.6588235, 1,
1.265313, 1.371515, -0.4803389, 1, 0, 0.654902, 1,
1.266356, -0.6884911, 2.790657, 1, 0, 0.6470588, 1,
1.275457, -1.414353, 3.68506, 1, 0, 0.6431373, 1,
1.280132, 1.690065, 0.7926439, 1, 0, 0.6352941, 1,
1.292135, 0.3481874, 1.970723, 1, 0, 0.6313726, 1,
1.29786, -0.5167742, 1.904397, 1, 0, 0.6235294, 1,
1.298248, 1.318942, 1.87273, 1, 0, 0.6196079, 1,
1.298735, -1.312065, 2.036541, 1, 0, 0.6117647, 1,
1.312775, 1.982544, 0.4406001, 1, 0, 0.6078432, 1,
1.327612, 0.1433991, 0.5107602, 1, 0, 0.6, 1,
1.333754, -1.6457, 0.8028853, 1, 0, 0.5921569, 1,
1.334504, -0.09133291, 1.574528, 1, 0, 0.5882353, 1,
1.33548, -0.3520203, 2.572923, 1, 0, 0.5803922, 1,
1.33938, 0.9387688, 0.8791639, 1, 0, 0.5764706, 1,
1.344475, 0.4424025, 1.204765, 1, 0, 0.5686275, 1,
1.34625, 1.401295, 0.5436062, 1, 0, 0.5647059, 1,
1.35986, -0.2516482, 0.3046036, 1, 0, 0.5568628, 1,
1.362143, 0.7370664, 0.2655265, 1, 0, 0.5529412, 1,
1.366839, 1.920892, 1.301194, 1, 0, 0.5450981, 1,
1.369216, 1.723083, -1.038836, 1, 0, 0.5411765, 1,
1.372582, 0.2784163, 0.4760666, 1, 0, 0.5333334, 1,
1.377425, 1.45567, 1.087598, 1, 0, 0.5294118, 1,
1.389969, 0.8789601, 1.165861, 1, 0, 0.5215687, 1,
1.392339, 1.380412, -0.7722108, 1, 0, 0.5176471, 1,
1.398751, -0.9419185, -0.001802839, 1, 0, 0.509804, 1,
1.409489, -0.6901473, 0.1125255, 1, 0, 0.5058824, 1,
1.412882, 0.2808674, 0.3451074, 1, 0, 0.4980392, 1,
1.417725, -0.3830888, 2.78102, 1, 0, 0.4901961, 1,
1.423894, -0.9506846, 2.036746, 1, 0, 0.4862745, 1,
1.441899, -1.665114, 1.629776, 1, 0, 0.4784314, 1,
1.448561, -1.385946, 1.992736, 1, 0, 0.4745098, 1,
1.453663, 0.6252543, 0.638368, 1, 0, 0.4666667, 1,
1.458591, 0.1567672, -0.1437876, 1, 0, 0.4627451, 1,
1.468622, -0.8077183, 3.217419, 1, 0, 0.454902, 1,
1.46936, -0.8242717, 1.922593, 1, 0, 0.4509804, 1,
1.488218, -0.5128182, 0.6495914, 1, 0, 0.4431373, 1,
1.48874, -1.304614, 2.277394, 1, 0, 0.4392157, 1,
1.503515, -1.288182, 2.178043, 1, 0, 0.4313726, 1,
1.510265, -1.353149, 2.990178, 1, 0, 0.427451, 1,
1.522035, 0.05968166, 0.3382185, 1, 0, 0.4196078, 1,
1.523822, 1.46503, 1.72657, 1, 0, 0.4156863, 1,
1.534362, 0.4096509, 1.358146, 1, 0, 0.4078431, 1,
1.541575, -2.239256, 3.361819, 1, 0, 0.4039216, 1,
1.556438, -0.8739816, 0.1932582, 1, 0, 0.3960784, 1,
1.556541, 0.4882033, 1.416159, 1, 0, 0.3882353, 1,
1.566682, -0.03720111, 1.061383, 1, 0, 0.3843137, 1,
1.572571, 0.09302881, -0.08820923, 1, 0, 0.3764706, 1,
1.582263, 0.9543108, 0.3908855, 1, 0, 0.372549, 1,
1.584825, -1.107977, 0.7656683, 1, 0, 0.3647059, 1,
1.586422, 1.016879, 0.9436538, 1, 0, 0.3607843, 1,
1.6054, 0.6622458, 0.8159257, 1, 0, 0.3529412, 1,
1.609842, -0.03927267, 0.3893942, 1, 0, 0.3490196, 1,
1.621896, -0.05437982, 1.922398, 1, 0, 0.3411765, 1,
1.646977, -0.01772097, 1.763657, 1, 0, 0.3372549, 1,
1.667683, 0.264539, 1.937831, 1, 0, 0.3294118, 1,
1.670214, 0.990403, 0.3811224, 1, 0, 0.3254902, 1,
1.690662, -0.8955725, 2.923084, 1, 0, 0.3176471, 1,
1.690933, 0.9718232, 3.127424, 1, 0, 0.3137255, 1,
1.698438, 0.009916032, 0.9048265, 1, 0, 0.3058824, 1,
1.731311, 1.102718, 1.276271, 1, 0, 0.2980392, 1,
1.795545, 0.9934865, 0.1494715, 1, 0, 0.2941177, 1,
1.808007, 0.9239209, 1.449748, 1, 0, 0.2862745, 1,
1.820851, 0.6961577, 0.2150886, 1, 0, 0.282353, 1,
1.854992, 0.5077533, 2.664499, 1, 0, 0.2745098, 1,
1.869054, 0.93821, 1.833068, 1, 0, 0.2705882, 1,
1.883659, 0.9770803, 0.875344, 1, 0, 0.2627451, 1,
1.888469, 0.6997963, 1.125841, 1, 0, 0.2588235, 1,
1.902409, 0.9961962, 0.6531997, 1, 0, 0.2509804, 1,
1.91302, 0.2562599, 2.343801, 1, 0, 0.2470588, 1,
1.915805, 0.2060215, 1.548759, 1, 0, 0.2392157, 1,
1.919292, -0.1456409, 1.685786, 1, 0, 0.2352941, 1,
1.939778, -0.3136927, 2.405442, 1, 0, 0.227451, 1,
1.946782, -0.6400627, 2.875895, 1, 0, 0.2235294, 1,
1.948122, -0.2873295, 1.341202, 1, 0, 0.2156863, 1,
1.954683, 0.5622723, 0.8435985, 1, 0, 0.2117647, 1,
1.965592, -1.012077, 2.61596, 1, 0, 0.2039216, 1,
1.987853, -0.2119291, -0.2415317, 1, 0, 0.1960784, 1,
1.991897, 1.147433, 2.093642, 1, 0, 0.1921569, 1,
2.030808, 0.5337559, 3.312038, 1, 0, 0.1843137, 1,
2.036366, -0.2798018, 1.702304, 1, 0, 0.1803922, 1,
2.0464, -0.3054006, 4.571501, 1, 0, 0.172549, 1,
2.056251, 0.4970908, 1.800399, 1, 0, 0.1686275, 1,
2.068805, -0.5679785, 1.424666, 1, 0, 0.1607843, 1,
2.068887, -0.226208, 2.334075, 1, 0, 0.1568628, 1,
2.080211, 1.052716, 2.231332, 1, 0, 0.1490196, 1,
2.090045, -0.3808539, 1.363121, 1, 0, 0.145098, 1,
2.103052, -0.7279494, 2.222744, 1, 0, 0.1372549, 1,
2.111409, 0.7703375, 2.126881, 1, 0, 0.1333333, 1,
2.11691, 1.462221, -0.6297123, 1, 0, 0.1254902, 1,
2.125428, -0.1141752, 1.193776, 1, 0, 0.1215686, 1,
2.134022, -0.0787385, 1.568608, 1, 0, 0.1137255, 1,
2.145188, 0.3472353, 1.900783, 1, 0, 0.1098039, 1,
2.146175, 0.9765756, 1.071904, 1, 0, 0.1019608, 1,
2.178586, -1.691398, 3.605176, 1, 0, 0.09411765, 1,
2.244535, 1.182911, -0.7007716, 1, 0, 0.09019608, 1,
2.247559, 0.3629312, 2.224307, 1, 0, 0.08235294, 1,
2.249369, -0.5483436, 1.43581, 1, 0, 0.07843138, 1,
2.269261, -0.7872239, 1.250183, 1, 0, 0.07058824, 1,
2.284267, 0.9522023, -0.483117, 1, 0, 0.06666667, 1,
2.379684, 0.1091936, 0.5157554, 1, 0, 0.05882353, 1,
2.466419, 0.2111934, 2.061776, 1, 0, 0.05490196, 1,
2.589693, 0.612966, 1.844577, 1, 0, 0.04705882, 1,
2.592486, -0.009267423, 1.760667, 1, 0, 0.04313726, 1,
2.623172, 0.2810774, 0.3661734, 1, 0, 0.03529412, 1,
2.64382, 0.7758346, 1.9886, 1, 0, 0.03137255, 1,
2.689105, 0.6841494, 1.293662, 1, 0, 0.02352941, 1,
2.912958, 0.3275597, 2.028813, 1, 0, 0.01960784, 1,
3.086264, -1.593062, 0.5118386, 1, 0, 0.01176471, 1,
3.660358, -0.4545952, 1.704217, 1, 0, 0.007843138, 1
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
0.2727519, -4.562811, -7.057934, 0, -0.5, 0.5, 0.5,
0.2727519, -4.562811, -7.057934, 1, -0.5, 0.5, 0.5,
0.2727519, -4.562811, -7.057934, 1, 1.5, 0.5, 0.5,
0.2727519, -4.562811, -7.057934, 0, 1.5, 0.5, 0.5
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
-4.263253, -0.2310088, -7.057934, 0, -0.5, 0.5, 0.5,
-4.263253, -0.2310088, -7.057934, 1, -0.5, 0.5, 0.5,
-4.263253, -0.2310088, -7.057934, 1, 1.5, 0.5, 0.5,
-4.263253, -0.2310088, -7.057934, 0, 1.5, 0.5, 0.5
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
-4.263253, -4.562811, 0.4906347, 0, -0.5, 0.5, 0.5,
-4.263253, -4.562811, 0.4906347, 1, -0.5, 0.5, 0.5,
-4.263253, -4.562811, 0.4906347, 1, 1.5, 0.5, 0.5,
-4.263253, -4.562811, 0.4906347, 0, 1.5, 0.5, 0.5
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
-3, -3.563164, -5.315957,
3, -3.563164, -5.315957,
-3, -3.563164, -5.315957,
-3, -3.729772, -5.606286,
-2, -3.563164, -5.315957,
-2, -3.729772, -5.606286,
-1, -3.563164, -5.315957,
-1, -3.729772, -5.606286,
0, -3.563164, -5.315957,
0, -3.729772, -5.606286,
1, -3.563164, -5.315957,
1, -3.729772, -5.606286,
2, -3.563164, -5.315957,
2, -3.729772, -5.606286,
3, -3.563164, -5.315957,
3, -3.729772, -5.606286
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
-3, -4.062988, -6.186945, 0, -0.5, 0.5, 0.5,
-3, -4.062988, -6.186945, 1, -0.5, 0.5, 0.5,
-3, -4.062988, -6.186945, 1, 1.5, 0.5, 0.5,
-3, -4.062988, -6.186945, 0, 1.5, 0.5, 0.5,
-2, -4.062988, -6.186945, 0, -0.5, 0.5, 0.5,
-2, -4.062988, -6.186945, 1, -0.5, 0.5, 0.5,
-2, -4.062988, -6.186945, 1, 1.5, 0.5, 0.5,
-2, -4.062988, -6.186945, 0, 1.5, 0.5, 0.5,
-1, -4.062988, -6.186945, 0, -0.5, 0.5, 0.5,
-1, -4.062988, -6.186945, 1, -0.5, 0.5, 0.5,
-1, -4.062988, -6.186945, 1, 1.5, 0.5, 0.5,
-1, -4.062988, -6.186945, 0, 1.5, 0.5, 0.5,
0, -4.062988, -6.186945, 0, -0.5, 0.5, 0.5,
0, -4.062988, -6.186945, 1, -0.5, 0.5, 0.5,
0, -4.062988, -6.186945, 1, 1.5, 0.5, 0.5,
0, -4.062988, -6.186945, 0, 1.5, 0.5, 0.5,
1, -4.062988, -6.186945, 0, -0.5, 0.5, 0.5,
1, -4.062988, -6.186945, 1, -0.5, 0.5, 0.5,
1, -4.062988, -6.186945, 1, 1.5, 0.5, 0.5,
1, -4.062988, -6.186945, 0, 1.5, 0.5, 0.5,
2, -4.062988, -6.186945, 0, -0.5, 0.5, 0.5,
2, -4.062988, -6.186945, 1, -0.5, 0.5, 0.5,
2, -4.062988, -6.186945, 1, 1.5, 0.5, 0.5,
2, -4.062988, -6.186945, 0, 1.5, 0.5, 0.5,
3, -4.062988, -6.186945, 0, -0.5, 0.5, 0.5,
3, -4.062988, -6.186945, 1, -0.5, 0.5, 0.5,
3, -4.062988, -6.186945, 1, 1.5, 0.5, 0.5,
3, -4.062988, -6.186945, 0, 1.5, 0.5, 0.5
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
-3.216483, -3, -5.315957,
-3.216483, 3, -5.315957,
-3.216483, -3, -5.315957,
-3.390944, -3, -5.606286,
-3.216483, -2, -5.315957,
-3.390944, -2, -5.606286,
-3.216483, -1, -5.315957,
-3.390944, -1, -5.606286,
-3.216483, 0, -5.315957,
-3.390944, 0, -5.606286,
-3.216483, 1, -5.315957,
-3.390944, 1, -5.606286,
-3.216483, 2, -5.315957,
-3.390944, 2, -5.606286,
-3.216483, 3, -5.315957,
-3.390944, 3, -5.606286
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
-3.739868, -3, -6.186945, 0, -0.5, 0.5, 0.5,
-3.739868, -3, -6.186945, 1, -0.5, 0.5, 0.5,
-3.739868, -3, -6.186945, 1, 1.5, 0.5, 0.5,
-3.739868, -3, -6.186945, 0, 1.5, 0.5, 0.5,
-3.739868, -2, -6.186945, 0, -0.5, 0.5, 0.5,
-3.739868, -2, -6.186945, 1, -0.5, 0.5, 0.5,
-3.739868, -2, -6.186945, 1, 1.5, 0.5, 0.5,
-3.739868, -2, -6.186945, 0, 1.5, 0.5, 0.5,
-3.739868, -1, -6.186945, 0, -0.5, 0.5, 0.5,
-3.739868, -1, -6.186945, 1, -0.5, 0.5, 0.5,
-3.739868, -1, -6.186945, 1, 1.5, 0.5, 0.5,
-3.739868, -1, -6.186945, 0, 1.5, 0.5, 0.5,
-3.739868, 0, -6.186945, 0, -0.5, 0.5, 0.5,
-3.739868, 0, -6.186945, 1, -0.5, 0.5, 0.5,
-3.739868, 0, -6.186945, 1, 1.5, 0.5, 0.5,
-3.739868, 0, -6.186945, 0, 1.5, 0.5, 0.5,
-3.739868, 1, -6.186945, 0, -0.5, 0.5, 0.5,
-3.739868, 1, -6.186945, 1, -0.5, 0.5, 0.5,
-3.739868, 1, -6.186945, 1, 1.5, 0.5, 0.5,
-3.739868, 1, -6.186945, 0, 1.5, 0.5, 0.5,
-3.739868, 2, -6.186945, 0, -0.5, 0.5, 0.5,
-3.739868, 2, -6.186945, 1, -0.5, 0.5, 0.5,
-3.739868, 2, -6.186945, 1, 1.5, 0.5, 0.5,
-3.739868, 2, -6.186945, 0, 1.5, 0.5, 0.5,
-3.739868, 3, -6.186945, 0, -0.5, 0.5, 0.5,
-3.739868, 3, -6.186945, 1, -0.5, 0.5, 0.5,
-3.739868, 3, -6.186945, 1, 1.5, 0.5, 0.5,
-3.739868, 3, -6.186945, 0, 1.5, 0.5, 0.5
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
-3.216483, -3.563164, -4,
-3.216483, -3.563164, 6,
-3.216483, -3.563164, -4,
-3.390944, -3.729772, -4,
-3.216483, -3.563164, -2,
-3.390944, -3.729772, -2,
-3.216483, -3.563164, 0,
-3.390944, -3.729772, 0,
-3.216483, -3.563164, 2,
-3.390944, -3.729772, 2,
-3.216483, -3.563164, 4,
-3.390944, -3.729772, 4,
-3.216483, -3.563164, 6,
-3.390944, -3.729772, 6
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
"4",
"6"
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
-3.739868, -4.062988, -4, 0, -0.5, 0.5, 0.5,
-3.739868, -4.062988, -4, 1, -0.5, 0.5, 0.5,
-3.739868, -4.062988, -4, 1, 1.5, 0.5, 0.5,
-3.739868, -4.062988, -4, 0, 1.5, 0.5, 0.5,
-3.739868, -4.062988, -2, 0, -0.5, 0.5, 0.5,
-3.739868, -4.062988, -2, 1, -0.5, 0.5, 0.5,
-3.739868, -4.062988, -2, 1, 1.5, 0.5, 0.5,
-3.739868, -4.062988, -2, 0, 1.5, 0.5, 0.5,
-3.739868, -4.062988, 0, 0, -0.5, 0.5, 0.5,
-3.739868, -4.062988, 0, 1, -0.5, 0.5, 0.5,
-3.739868, -4.062988, 0, 1, 1.5, 0.5, 0.5,
-3.739868, -4.062988, 0, 0, 1.5, 0.5, 0.5,
-3.739868, -4.062988, 2, 0, -0.5, 0.5, 0.5,
-3.739868, -4.062988, 2, 1, -0.5, 0.5, 0.5,
-3.739868, -4.062988, 2, 1, 1.5, 0.5, 0.5,
-3.739868, -4.062988, 2, 0, 1.5, 0.5, 0.5,
-3.739868, -4.062988, 4, 0, -0.5, 0.5, 0.5,
-3.739868, -4.062988, 4, 1, -0.5, 0.5, 0.5,
-3.739868, -4.062988, 4, 1, 1.5, 0.5, 0.5,
-3.739868, -4.062988, 4, 0, 1.5, 0.5, 0.5,
-3.739868, -4.062988, 6, 0, -0.5, 0.5, 0.5,
-3.739868, -4.062988, 6, 1, -0.5, 0.5, 0.5,
-3.739868, -4.062988, 6, 1, 1.5, 0.5, 0.5,
-3.739868, -4.062988, 6, 0, 1.5, 0.5, 0.5
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
-3.216483, -3.563164, -5.315957,
-3.216483, 3.101147, -5.315957,
-3.216483, -3.563164, 6.297226,
-3.216483, 3.101147, 6.297226,
-3.216483, -3.563164, -5.315957,
-3.216483, -3.563164, 6.297226,
-3.216483, 3.101147, -5.315957,
-3.216483, 3.101147, 6.297226,
-3.216483, -3.563164, -5.315957,
3.761987, -3.563164, -5.315957,
-3.216483, -3.563164, 6.297226,
3.761987, -3.563164, 6.297226,
-3.216483, 3.101147, -5.315957,
3.761987, 3.101147, -5.315957,
-3.216483, 3.101147, 6.297226,
3.761987, 3.101147, 6.297226,
3.761987, -3.563164, -5.315957,
3.761987, 3.101147, -5.315957,
3.761987, -3.563164, 6.297226,
3.761987, 3.101147, 6.297226,
3.761987, -3.563164, -5.315957,
3.761987, -3.563164, 6.297226,
3.761987, 3.101147, -5.315957,
3.761987, 3.101147, 6.297226
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
var radius = 8.062543;
var distance = 35.87116;
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
mvMatrix.translate( -0.2727519, 0.2310088, -0.4906347 );
mvMatrix.scale( 1.249182, 1.308069, 0.7506452 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.87116);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Ethiofencarb<-read.table("Ethiofencarb.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Ethiofencarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Ethiofencarb' not found
```

```r
y<-Ethiofencarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Ethiofencarb' not found
```

```r
z<-Ethiofencarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Ethiofencarb' not found
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
-3.114855, 0.05299554, -1.492384, 0, 0, 1, 1, 1,
-2.827594, 0.7274833, -1.238889, 1, 0, 0, 1, 1,
-2.461502, 0.4711496, -2.261367, 1, 0, 0, 1, 1,
-2.424365, -1.00956, -2.240492, 1, 0, 0, 1, 1,
-2.409307, 0.2599632, -1.529245, 1, 0, 0, 1, 1,
-2.379128, -0.2338799, 0.4230125, 1, 0, 0, 1, 1,
-2.374537, -1.659334, -0.8795606, 0, 0, 0, 1, 1,
-2.357257, 0.6493676, -0.8883785, 0, 0, 0, 1, 1,
-2.328899, 1.582623, -1.037708, 0, 0, 0, 1, 1,
-2.254426, 0.5022611, -0.1608476, 0, 0, 0, 1, 1,
-2.214119, 0.1702894, -1.472028, 0, 0, 0, 1, 1,
-2.209117, -0.3075371, -1.37181, 0, 0, 0, 1, 1,
-2.167884, 0.4060648, -0.6444373, 0, 0, 0, 1, 1,
-2.135242, 0.004763388, -1.540333, 1, 1, 1, 1, 1,
-2.124951, -1.100534, -2.376137, 1, 1, 1, 1, 1,
-2.119807, 0.874112, -1.290218, 1, 1, 1, 1, 1,
-2.11767, 0.4250701, -2.04427, 1, 1, 1, 1, 1,
-2.104427, 0.9932757, -1.552933, 1, 1, 1, 1, 1,
-2.10136, -0.7257606, -0.9739587, 1, 1, 1, 1, 1,
-2.08279, -0.8255112, -1.747996, 1, 1, 1, 1, 1,
-2.062219, 0.4792871, -2.924378, 1, 1, 1, 1, 1,
-2.011901, -0.9133328, -3.214573, 1, 1, 1, 1, 1,
-2.009377, -0.649049, -0.6343949, 1, 1, 1, 1, 1,
-1.977108, 2.299032, -0.1177645, 1, 1, 1, 1, 1,
-1.926719, 0.3294083, -0.8997111, 1, 1, 1, 1, 1,
-1.923465, 0.9183844, -2.912481, 1, 1, 1, 1, 1,
-1.915735, -1.578588, -3.575189, 1, 1, 1, 1, 1,
-1.913139, -0.09189606, -3.908245, 1, 1, 1, 1, 1,
-1.881028, 0.02102892, -0.1436809, 0, 0, 1, 1, 1,
-1.875683, -1.246028, -2.786411, 1, 0, 0, 1, 1,
-1.865521, -0.114471, -0.7294239, 1, 0, 0, 1, 1,
-1.861746, 0.3267825, -0.7610078, 1, 0, 0, 1, 1,
-1.858761, -1.796988, -3.244616, 1, 0, 0, 1, 1,
-1.850375, -1.150664, -2.765618, 1, 0, 0, 1, 1,
-1.842179, -0.3734171, -1.31571, 0, 0, 0, 1, 1,
-1.838877, -1.751364, -1.695675, 0, 0, 0, 1, 1,
-1.838322, -0.05706393, -0.006884341, 0, 0, 0, 1, 1,
-1.812283, -0.05384474, 0.1488656, 0, 0, 0, 1, 1,
-1.78778, -0.9574218, -2.4156, 0, 0, 0, 1, 1,
-1.778295, 1.739222, -0.5251805, 0, 0, 0, 1, 1,
-1.774128, -0.438853, -3.336099, 0, 0, 0, 1, 1,
-1.760586, 0.6233779, -1.804894, 1, 1, 1, 1, 1,
-1.757629, -0.7142258, -1.640976, 1, 1, 1, 1, 1,
-1.74669, -0.3713873, -3.179434, 1, 1, 1, 1, 1,
-1.712455, 1.23064, -0.04347362, 1, 1, 1, 1, 1,
-1.711088, 0.7702942, -3.138052, 1, 1, 1, 1, 1,
-1.708442, -0.2114282, -2.886823, 1, 1, 1, 1, 1,
-1.706891, 0.00495181, -2.264765, 1, 1, 1, 1, 1,
-1.701615, 1.359431, -1.936053, 1, 1, 1, 1, 1,
-1.69671, -0.2556905, -2.194672, 1, 1, 1, 1, 1,
-1.679189, 0.4141879, 0.5544181, 1, 1, 1, 1, 1,
-1.659036, 0.1549072, -1.442199, 1, 1, 1, 1, 1,
-1.633591, -0.3394515, -1.041123, 1, 1, 1, 1, 1,
-1.631338, -0.8830293, -1.707839, 1, 1, 1, 1, 1,
-1.582654, -0.4942661, -1.159221, 1, 1, 1, 1, 1,
-1.575835, 0.4447063, -2.649867, 1, 1, 1, 1, 1,
-1.575482, 0.2205091, -1.637719, 0, 0, 1, 1, 1,
-1.573275, -0.9720637, -3.357497, 1, 0, 0, 1, 1,
-1.560341, 0.6258084, -1.980681, 1, 0, 0, 1, 1,
-1.557694, 0.9852179, -1.742687, 1, 0, 0, 1, 1,
-1.555862, -0.8064221, -3.217656, 1, 0, 0, 1, 1,
-1.541834, -0.9159786, -2.028736, 1, 0, 0, 1, 1,
-1.54072, 0.3828904, 0.784736, 0, 0, 0, 1, 1,
-1.531039, -0.6412504, -2.861139, 0, 0, 0, 1, 1,
-1.52436, -0.4438119, -3.404197, 0, 0, 0, 1, 1,
-1.511364, -0.7977362, -2.814137, 0, 0, 0, 1, 1,
-1.509532, -0.213008, -1.100215, 0, 0, 0, 1, 1,
-1.506001, 0.7249586, 0.5374711, 0, 0, 0, 1, 1,
-1.503366, -0.6297131, -1.438194, 0, 0, 0, 1, 1,
-1.50186, 0.08313187, -2.495482, 1, 1, 1, 1, 1,
-1.489716, -0.8118533, -2.835376, 1, 1, 1, 1, 1,
-1.489453, -1.047115, -2.747569, 1, 1, 1, 1, 1,
-1.486838, 1.127495, -1.978238, 1, 1, 1, 1, 1,
-1.47233, 0.07124952, -2.259727, 1, 1, 1, 1, 1,
-1.466245, 0.8889243, 0.3584745, 1, 1, 1, 1, 1,
-1.454999, 0.9249472, -3.053378, 1, 1, 1, 1, 1,
-1.450097, -0.2973487, -1.658963, 1, 1, 1, 1, 1,
-1.449772, 0.5858934, -0.3932722, 1, 1, 1, 1, 1,
-1.438381, 0.5775107, -0.2635019, 1, 1, 1, 1, 1,
-1.432948, 0.4307909, -3.603338, 1, 1, 1, 1, 1,
-1.425019, -0.05781514, -0.7101693, 1, 1, 1, 1, 1,
-1.424057, 0.3798693, -0.6922781, 1, 1, 1, 1, 1,
-1.42175, 0.5778943, -1.695514, 1, 1, 1, 1, 1,
-1.413689, -1.740872, -3.815649, 1, 1, 1, 1, 1,
-1.413043, -1.238052, -3.825071, 0, 0, 1, 1, 1,
-1.404169, -0.1820529, -2.769533, 1, 0, 0, 1, 1,
-1.392096, 0.9860987, -1.476387, 1, 0, 0, 1, 1,
-1.388596, 1.878437, -1.116218, 1, 0, 0, 1, 1,
-1.387101, 0.1049773, -2.929244, 1, 0, 0, 1, 1,
-1.382434, 1.376868, -1.422966, 1, 0, 0, 1, 1,
-1.379367, 0.642063, 0.03249361, 0, 0, 0, 1, 1,
-1.366014, -0.6786411, -2.576756, 0, 0, 0, 1, 1,
-1.361663, 0.01638749, -2.152066, 0, 0, 0, 1, 1,
-1.353411, 0.9103411, -0.7726986, 0, 0, 0, 1, 1,
-1.348246, -0.7347142, -3.383764, 0, 0, 0, 1, 1,
-1.342856, -0.2430177, -2.983216, 0, 0, 0, 1, 1,
-1.336184, -0.5536191, -3.739539, 0, 0, 0, 1, 1,
-1.332914, 0.08643442, -1.276528, 1, 1, 1, 1, 1,
-1.328144, -2.201665, -4.466596, 1, 1, 1, 1, 1,
-1.312875, -1.220233, -1.392814, 1, 1, 1, 1, 1,
-1.310602, -0.2897639, -2.00147, 1, 1, 1, 1, 1,
-1.302, 0.137144, -2.637697, 1, 1, 1, 1, 1,
-1.299718, 0.8593739, -0.2940834, 1, 1, 1, 1, 1,
-1.29061, -1.098804, -2.167984, 1, 1, 1, 1, 1,
-1.286365, -1.192455, -4.785289, 1, 1, 1, 1, 1,
-1.278996, 0.5172414, -0.7481086, 1, 1, 1, 1, 1,
-1.273052, 0.9682, 0.5756077, 1, 1, 1, 1, 1,
-1.271516, 0.7638897, -1.179233, 1, 1, 1, 1, 1,
-1.265946, -0.5267525, -2.701169, 1, 1, 1, 1, 1,
-1.256225, 0.5517415, -0.5090337, 1, 1, 1, 1, 1,
-1.251234, -1.097937, -2.083807, 1, 1, 1, 1, 1,
-1.250889, 0.3937495, -0.839153, 1, 1, 1, 1, 1,
-1.237658, -1.096377, -2.621794, 0, 0, 1, 1, 1,
-1.237209, -1.450957, -2.323686, 1, 0, 0, 1, 1,
-1.232925, -1.042037, -3.260507, 1, 0, 0, 1, 1,
-1.229101, 0.6598305, -1.57751, 1, 0, 0, 1, 1,
-1.224201, -0.02728307, -0.6431153, 1, 0, 0, 1, 1,
-1.222558, -0.512749, -2.469827, 1, 0, 0, 1, 1,
-1.218875, 0.4116833, -0.2917984, 0, 0, 0, 1, 1,
-1.216651, -0.8920268, -1.59505, 0, 0, 0, 1, 1,
-1.206845, 0.2314717, 1.13347, 0, 0, 0, 1, 1,
-1.205306, -1.036626, -2.174912, 0, 0, 0, 1, 1,
-1.204696, -0.5524834, -2.65021, 0, 0, 0, 1, 1,
-1.202147, -1.804121, -3.935224, 0, 0, 0, 1, 1,
-1.200943, -0.3798015, -3.968589, 0, 0, 0, 1, 1,
-1.200495, -0.5441601, -1.8959, 1, 1, 1, 1, 1,
-1.193524, -0.2680396, -2.40084, 1, 1, 1, 1, 1,
-1.189125, -1.049127, -4.15243, 1, 1, 1, 1, 1,
-1.188794, 0.2820136, -0.5236454, 1, 1, 1, 1, 1,
-1.188286, -0.4417271, -2.220521, 1, 1, 1, 1, 1,
-1.185145, 0.3903386, -0.1130862, 1, 1, 1, 1, 1,
-1.171697, -0.1916071, -1.91461, 1, 1, 1, 1, 1,
-1.169091, 0.3915292, -1.67422, 1, 1, 1, 1, 1,
-1.168499, -0.804166, -2.943389, 1, 1, 1, 1, 1,
-1.16848, -0.0349206, -2.103217, 1, 1, 1, 1, 1,
-1.16537, -0.6641675, 0.08606419, 1, 1, 1, 1, 1,
-1.160927, -1.501704, -2.873642, 1, 1, 1, 1, 1,
-1.154634, -0.8333031, -1.638314, 1, 1, 1, 1, 1,
-1.152899, 0.6116874, -2.7666, 1, 1, 1, 1, 1,
-1.146857, 1.658334, -1.294809, 1, 1, 1, 1, 1,
-1.141649, -1.387546, -3.130604, 0, 0, 1, 1, 1,
-1.139979, 0.696627, 0.1793054, 1, 0, 0, 1, 1,
-1.13372, 2.357911, -2.979761, 1, 0, 0, 1, 1,
-1.130401, -0.881641, -2.607455, 1, 0, 0, 1, 1,
-1.129286, 1.477649, -0.9476315, 1, 0, 0, 1, 1,
-1.119404, -0.7344457, -0.5656016, 1, 0, 0, 1, 1,
-1.117961, -0.3319581, -1.697101, 0, 0, 0, 1, 1,
-1.114549, -0.8518466, -2.164451, 0, 0, 0, 1, 1,
-1.112723, -0.1968359, -2.183821, 0, 0, 0, 1, 1,
-1.111583, 0.7439236, -1.473608, 0, 0, 0, 1, 1,
-1.110251, 0.3324567, -2.994528, 0, 0, 0, 1, 1,
-1.109905, 2.250264, 0.708776, 0, 0, 0, 1, 1,
-1.100617, 0.03396729, -1.597535, 0, 0, 0, 1, 1,
-1.09893, 0.2800554, -1.672854, 1, 1, 1, 1, 1,
-1.095512, -0.4404903, -0.9186057, 1, 1, 1, 1, 1,
-1.090939, -0.7173259, -1.399719, 1, 1, 1, 1, 1,
-1.080987, -0.4280491, -2.425431, 1, 1, 1, 1, 1,
-1.079528, -0.2410089, -2.444599, 1, 1, 1, 1, 1,
-1.075935, -0.1258317, -2.170939, 1, 1, 1, 1, 1,
-1.074699, -0.6045797, -2.86728, 1, 1, 1, 1, 1,
-1.073155, -0.3191699, -2.328396, 1, 1, 1, 1, 1,
-1.067219, -0.3273985, -1.617524, 1, 1, 1, 1, 1,
-1.064715, 0.1915769, -2.257086, 1, 1, 1, 1, 1,
-1.058827, -0.2079099, -3.035751, 1, 1, 1, 1, 1,
-1.058644, 2.4559, -1.230022, 1, 1, 1, 1, 1,
-1.055426, 0.6496856, -1.450663, 1, 1, 1, 1, 1,
-1.045775, -0.5452442, -1.925724, 1, 1, 1, 1, 1,
-1.032445, 0.5019837, -1.92946, 1, 1, 1, 1, 1,
-1.025334, 0.3102824, -1.03314, 0, 0, 1, 1, 1,
-1.019075, 0.8456295, -1.341634, 1, 0, 0, 1, 1,
-1.014124, -2.945047, -0.570511, 1, 0, 0, 1, 1,
-1.007956, -0.6663082, -0.4904123, 1, 0, 0, 1, 1,
-1.002213, 0.5719129, -1.142619, 1, 0, 0, 1, 1,
-1.001006, -1.012095, -0.8663207, 1, 0, 0, 1, 1,
-0.9970627, 0.3494287, -2.244191, 0, 0, 0, 1, 1,
-0.995428, 0.4750023, -0.09164646, 0, 0, 0, 1, 1,
-0.9941763, 0.6077669, -1.011784, 0, 0, 0, 1, 1,
-0.9868748, 0.2139134, -3.429175, 0, 0, 0, 1, 1,
-0.9868627, 0.3058315, 0.2500764, 0, 0, 0, 1, 1,
-0.985205, -1.225431, -2.942331, 0, 0, 0, 1, 1,
-0.9754376, -0.5407913, -2.348202, 0, 0, 0, 1, 1,
-0.962909, 0.07169399, -1.27831, 1, 1, 1, 1, 1,
-0.9621292, 0.3017461, -1.308309, 1, 1, 1, 1, 1,
-0.9510745, 0.5360708, -0.07206088, 1, 1, 1, 1, 1,
-0.9479595, 1.672795, -2.202065, 1, 1, 1, 1, 1,
-0.9463804, 0.7301007, -0.3677075, 1, 1, 1, 1, 1,
-0.9413371, 1.507746, 0.3282917, 1, 1, 1, 1, 1,
-0.9407405, 0.3087984, -0.9592811, 1, 1, 1, 1, 1,
-0.9373921, 1.600873, 0.8487357, 1, 1, 1, 1, 1,
-0.9341207, -0.7504982, -2.114251, 1, 1, 1, 1, 1,
-0.9329748, 0.4594586, -2.087367, 1, 1, 1, 1, 1,
-0.931572, -1.378429, -2.748989, 1, 1, 1, 1, 1,
-0.9312741, 2.289738, 0.4065332, 1, 1, 1, 1, 1,
-0.9280083, -0.5453371, -2.145769, 1, 1, 1, 1, 1,
-0.9263061, -0.5279108, -1.998462, 1, 1, 1, 1, 1,
-0.9246055, -0.6325768, -3.830369, 1, 1, 1, 1, 1,
-0.9245557, -0.1613873, -1.701473, 0, 0, 1, 1, 1,
-0.9207071, -0.09224478, -0.6258204, 1, 0, 0, 1, 1,
-0.9173677, -0.04226195, -1.030126, 1, 0, 0, 1, 1,
-0.9076221, -0.215762, -2.602829, 1, 0, 0, 1, 1,
-0.9032695, -0.2211354, -2.373191, 1, 0, 0, 1, 1,
-0.902142, -1.237238, -2.860119, 1, 0, 0, 1, 1,
-0.8891314, -1.179481, -2.209696, 0, 0, 0, 1, 1,
-0.8891089, 0.5907033, -1.154791, 0, 0, 0, 1, 1,
-0.8871958, -0.8919902, -1.972985, 0, 0, 0, 1, 1,
-0.8850312, 0.7052679, -1.252673, 0, 0, 0, 1, 1,
-0.8778142, 1.330629, -3.692122, 0, 0, 0, 1, 1,
-0.8753754, -0.9081458, -1.796508, 0, 0, 0, 1, 1,
-0.8701541, -1.182188, -2.298548, 0, 0, 0, 1, 1,
-0.8694603, -2.021822, -3.666417, 1, 1, 1, 1, 1,
-0.8662767, 0.4954007, -0.9293734, 1, 1, 1, 1, 1,
-0.8642769, 0.8247859, -1.864059, 1, 1, 1, 1, 1,
-0.8632479, 0.6284517, -1.3451, 1, 1, 1, 1, 1,
-0.8620464, -3.466111, -3.80944, 1, 1, 1, 1, 1,
-0.857446, -1.356933, -4.256684, 1, 1, 1, 1, 1,
-0.8541833, 1.054365, -0.2190144, 1, 1, 1, 1, 1,
-0.8446022, 0.4529053, -1.239964, 1, 1, 1, 1, 1,
-0.8394923, -0.08200467, -2.418144, 1, 1, 1, 1, 1,
-0.832152, -1.180317, -1.169678, 1, 1, 1, 1, 1,
-0.8273039, 0.01831505, -1.248231, 1, 1, 1, 1, 1,
-0.8249334, -1.331484, -0.9890223, 1, 1, 1, 1, 1,
-0.8246484, -1.36226, -2.413695, 1, 1, 1, 1, 1,
-0.8229969, 0.3641225, -2.017674, 1, 1, 1, 1, 1,
-0.8226004, -0.329609, -3.862852, 1, 1, 1, 1, 1,
-0.8216133, -1.435971, -3.741879, 0, 0, 1, 1, 1,
-0.8212134, -2.234848, -3.574659, 1, 0, 0, 1, 1,
-0.8183833, 1.552229, 0.2270058, 1, 0, 0, 1, 1,
-0.8097377, 1.055234, -0.8168215, 1, 0, 0, 1, 1,
-0.8029274, -1.044247, -1.496532, 1, 0, 0, 1, 1,
-0.7985861, 0.1350614, -1.171114, 1, 0, 0, 1, 1,
-0.7862565, -0.3953093, -2.039664, 0, 0, 0, 1, 1,
-0.7838417, 0.3520861, -0.6508594, 0, 0, 0, 1, 1,
-0.7773693, -2.628854, -3.416875, 0, 0, 0, 1, 1,
-0.7740932, -0.06052808, -1.836523, 0, 0, 0, 1, 1,
-0.7670505, -0.154805, -0.7525789, 0, 0, 0, 1, 1,
-0.757818, -1.373526, -1.155182, 0, 0, 0, 1, 1,
-0.7476749, 0.2120482, -1.289099, 0, 0, 0, 1, 1,
-0.74051, 1.246174, -0.3655862, 1, 1, 1, 1, 1,
-0.7400643, 2.201851, -0.8567147, 1, 1, 1, 1, 1,
-0.7370819, 0.8105612, 0.1696561, 1, 1, 1, 1, 1,
-0.7370646, 0.1854805, -1.988332, 1, 1, 1, 1, 1,
-0.7341955, -1.164245, -3.027277, 1, 1, 1, 1, 1,
-0.732383, -0.09126927, -1.125075, 1, 1, 1, 1, 1,
-0.7304565, 0.05757584, -2.48368, 1, 1, 1, 1, 1,
-0.7297418, -0.1892648, -2.245993, 1, 1, 1, 1, 1,
-0.7284181, 0.4926307, -0.4142648, 1, 1, 1, 1, 1,
-0.7272865, 0.5621387, -2.248422, 1, 1, 1, 1, 1,
-0.7251704, 0.6349673, -2.024612, 1, 1, 1, 1, 1,
-0.7235193, 0.5198026, -2.921858, 1, 1, 1, 1, 1,
-0.7198803, 0.4069202, -2.855666, 1, 1, 1, 1, 1,
-0.7162573, -0.2099109, -3.375513, 1, 1, 1, 1, 1,
-0.7160088, 1.716717, -0.6543685, 1, 1, 1, 1, 1,
-0.7139434, -1.288634, -3.652544, 0, 0, 1, 1, 1,
-0.7054322, 0.5307341, -1.576231, 1, 0, 0, 1, 1,
-0.6962377, -0.6993564, -3.395985, 1, 0, 0, 1, 1,
-0.6913533, 1.474113, -2.170051, 1, 0, 0, 1, 1,
-0.6899583, 1.124113, -1.289638, 1, 0, 0, 1, 1,
-0.6888916, -1.353854, -2.376619, 1, 0, 0, 1, 1,
-0.6855389, -0.6934596, -1.986451, 0, 0, 0, 1, 1,
-0.6854031, 0.3043537, -1.251604, 0, 0, 0, 1, 1,
-0.6801068, 0.01528215, -2.101476, 0, 0, 0, 1, 1,
-0.6789101, -1.193868, -2.535049, 0, 0, 0, 1, 1,
-0.676851, -0.6796711, -1.5423, 0, 0, 0, 1, 1,
-0.6740005, -0.8073887, -3.121769, 0, 0, 0, 1, 1,
-0.6730568, -1.219612, -3.524951, 0, 0, 0, 1, 1,
-0.6716501, -0.6033779, -3.034937, 1, 1, 1, 1, 1,
-0.6678307, 0.6562941, 0.5286912, 1, 1, 1, 1, 1,
-0.6576056, 0.7831877, -1.957003, 1, 1, 1, 1, 1,
-0.6523441, -2.09187, -2.321607, 1, 1, 1, 1, 1,
-0.6517621, 1.439535, -2.231578, 1, 1, 1, 1, 1,
-0.6510327, 0.07268988, -1.411822, 1, 1, 1, 1, 1,
-0.6507617, 0.8516392, -0.4454061, 1, 1, 1, 1, 1,
-0.6488181, -0.7478136, -1.839857, 1, 1, 1, 1, 1,
-0.6467196, 0.06324485, -0.6858934, 1, 1, 1, 1, 1,
-0.6465383, 0.3903153, -3.39962, 1, 1, 1, 1, 1,
-0.6402268, 1.052299, 1.485517, 1, 1, 1, 1, 1,
-0.6392038, 2.213427, 1.216254, 1, 1, 1, 1, 1,
-0.6369358, 1.108809, 0.3246098, 1, 1, 1, 1, 1,
-0.6323807, 0.06585761, -0.09050953, 1, 1, 1, 1, 1,
-0.6301241, 1.336161, 0.03957067, 1, 1, 1, 1, 1,
-0.6299446, -0.8366354, -3.494242, 0, 0, 1, 1, 1,
-0.6283178, -1.067578, -2.375705, 1, 0, 0, 1, 1,
-0.621987, 1.207592, 0.7184523, 1, 0, 0, 1, 1,
-0.6210243, -0.7791567, -0.6542406, 1, 0, 0, 1, 1,
-0.6168348, 0.5425385, -1.18476, 1, 0, 0, 1, 1,
-0.6162745, -1.029976, -2.82615, 1, 0, 0, 1, 1,
-0.6125003, -0.7104807, -3.699982, 0, 0, 0, 1, 1,
-0.6103203, 0.0878782, -2.53299, 0, 0, 0, 1, 1,
-0.6089193, 0.491949, -1.707192, 0, 0, 0, 1, 1,
-0.6033851, 1.742083, 0.8847945, 0, 0, 0, 1, 1,
-0.6004487, -1.310806, -2.204651, 0, 0, 0, 1, 1,
-0.5959778, 0.8403378, -1.207067, 0, 0, 0, 1, 1,
-0.5922349, -1.369311, -4.335044, 0, 0, 0, 1, 1,
-0.5907684, 2.820245, 0.21759, 1, 1, 1, 1, 1,
-0.5743485, 0.2470295, -1.253785, 1, 1, 1, 1, 1,
-0.570649, -1.815113, -3.330925, 1, 1, 1, 1, 1,
-0.5704595, 0.9974024, -2.168919, 1, 1, 1, 1, 1,
-0.568949, 0.4356129, -1.100618, 1, 1, 1, 1, 1,
-0.5662203, 2.269911, -1.039822, 1, 1, 1, 1, 1,
-0.5605436, 0.7128379, -1.430126, 1, 1, 1, 1, 1,
-0.5596148, -1.311048, -1.683927, 1, 1, 1, 1, 1,
-0.553165, -1.583283, -2.135211, 1, 1, 1, 1, 1,
-0.5458033, -2.082199, -4.404075, 1, 1, 1, 1, 1,
-0.5443609, -0.8404883, -1.745334, 1, 1, 1, 1, 1,
-0.5343922, 0.5303157, -1.105875, 1, 1, 1, 1, 1,
-0.5312063, -0.1333927, -3.282814, 1, 1, 1, 1, 1,
-0.5311926, 0.5826123, 1.119033, 1, 1, 1, 1, 1,
-0.5306246, -1.103787, -1.628777, 1, 1, 1, 1, 1,
-0.5288793, 0.8795082, -0.2812332, 0, 0, 1, 1, 1,
-0.5273139, -0.04927357, -1.285564, 1, 0, 0, 1, 1,
-0.526261, -1.354061, -2.785913, 1, 0, 0, 1, 1,
-0.5232093, 1.340462, -1.037461, 1, 0, 0, 1, 1,
-0.5204315, -1.074937, -2.668974, 1, 0, 0, 1, 1,
-0.5151358, -1.461069, -3.829676, 1, 0, 0, 1, 1,
-0.5125355, 0.6141756, -1.402323, 0, 0, 0, 1, 1,
-0.5107803, -0.7863547, -1.876855, 0, 0, 0, 1, 1,
-0.5105038, -0.03794691, -2.531955, 0, 0, 0, 1, 1,
-0.506848, -0.2930288, -0.6033943, 0, 0, 0, 1, 1,
-0.5039259, -0.4401762, -2.33253, 0, 0, 0, 1, 1,
-0.499786, 0.08006459, -0.7671986, 0, 0, 0, 1, 1,
-0.4944789, 0.2035011, -1.596237, 0, 0, 0, 1, 1,
-0.4908051, -0.4806875, -1.703653, 1, 1, 1, 1, 1,
-0.4880058, -0.4924277, -3.26025, 1, 1, 1, 1, 1,
-0.4843466, 0.1850314, -0.9595478, 1, 1, 1, 1, 1,
-0.4841181, 0.4505594, -1.388786, 1, 1, 1, 1, 1,
-0.4834061, 0.7888066, -0.3288377, 1, 1, 1, 1, 1,
-0.4832743, -0.3758917, -1.005234, 1, 1, 1, 1, 1,
-0.4677972, 1.023444, 0.2918413, 1, 1, 1, 1, 1,
-0.4677859, -0.02330126, -1.415698, 1, 1, 1, 1, 1,
-0.4632843, 1.333586, -1.249671, 1, 1, 1, 1, 1,
-0.4622299, -0.02565899, -0.683338, 1, 1, 1, 1, 1,
-0.4583, 0.1435378, -1.098089, 1, 1, 1, 1, 1,
-0.4559063, 1.21962, -0.07952648, 1, 1, 1, 1, 1,
-0.4556668, 0.3184162, -1.002276, 1, 1, 1, 1, 1,
-0.4550359, -0.005934379, -2.488683, 1, 1, 1, 1, 1,
-0.4537138, 0.2119137, -1.783672, 1, 1, 1, 1, 1,
-0.4535227, -0.4331454, -0.7716147, 0, 0, 1, 1, 1,
-0.4510339, 0.3349906, -0.8239933, 1, 0, 0, 1, 1,
-0.4492389, 0.7958643, -0.7088073, 1, 0, 0, 1, 1,
-0.4462064, -0.4912695, -2.989365, 1, 0, 0, 1, 1,
-0.4461294, 0.1089331, -1.315204, 1, 0, 0, 1, 1,
-0.4451378, 1.162396, -0.2355912, 1, 0, 0, 1, 1,
-0.4431641, -1.036912, -1.896803, 0, 0, 0, 1, 1,
-0.4415355, -0.2159045, -2.496264, 0, 0, 0, 1, 1,
-0.4399413, 1.461276, -0.279932, 0, 0, 0, 1, 1,
-0.438026, 0.1615926, 0.2251958, 0, 0, 0, 1, 1,
-0.4371904, 0.4946204, -1.571875, 0, 0, 0, 1, 1,
-0.4357595, -1.308773, -2.596328, 0, 0, 0, 1, 1,
-0.4330951, 1.463774, 0.1635148, 0, 0, 0, 1, 1,
-0.432624, -0.2546008, -2.267557, 1, 1, 1, 1, 1,
-0.4264255, 1.117314, -0.1083498, 1, 1, 1, 1, 1,
-0.4207348, -0.4644901, -4.026977, 1, 1, 1, 1, 1,
-0.4157478, 1.420722, 0.5294074, 1, 1, 1, 1, 1,
-0.4145779, -0.3540791, -3.79205, 1, 1, 1, 1, 1,
-0.4127161, 0.8191396, -0.105615, 1, 1, 1, 1, 1,
-0.4104143, -0.1557975, -1.409557, 1, 1, 1, 1, 1,
-0.4039026, 0.9345657, 0.4689638, 1, 1, 1, 1, 1,
-0.402928, 0.671002, -0.783, 1, 1, 1, 1, 1,
-0.4009054, -0.8354412, -2.798832, 1, 1, 1, 1, 1,
-0.400795, 0.9130837, -0.1660975, 1, 1, 1, 1, 1,
-0.4000633, 0.4174288, -0.5552378, 1, 1, 1, 1, 1,
-0.3968535, 0.1631535, -2.203756, 1, 1, 1, 1, 1,
-0.3967401, 0.2854625, 0.1825453, 1, 1, 1, 1, 1,
-0.3952395, -0.8278958, -1.974621, 1, 1, 1, 1, 1,
-0.3938035, -0.4427789, -0.817324, 0, 0, 1, 1, 1,
-0.3936563, 0.089944, -1.426396, 1, 0, 0, 1, 1,
-0.393122, -1.050878, -2.526604, 1, 0, 0, 1, 1,
-0.3876925, -0.9867465, -2.155694, 1, 0, 0, 1, 1,
-0.3868999, 1.287189, -2.484228, 1, 0, 0, 1, 1,
-0.3826879, 1.088585, -1.1838, 1, 0, 0, 1, 1,
-0.3820533, 2.044183, -0.5272368, 0, 0, 0, 1, 1,
-0.3817179, 0.3333113, -1.06847, 0, 0, 0, 1, 1,
-0.3770022, -0.8376186, -2.765581, 0, 0, 0, 1, 1,
-0.3718947, 0.9342604, -0.9537174, 0, 0, 0, 1, 1,
-0.3716615, 0.9151926, -0.4980123, 0, 0, 0, 1, 1,
-0.3699331, 0.7399116, -1.648003, 0, 0, 0, 1, 1,
-0.3612405, 0.8046706, -0.9146158, 0, 0, 0, 1, 1,
-0.3573068, -0.9943982, -4.337473, 1, 1, 1, 1, 1,
-0.3569769, 0.420957, -1.127092, 1, 1, 1, 1, 1,
-0.3566992, 1.233638, 0.06693733, 1, 1, 1, 1, 1,
-0.3553038, 0.3341487, 1.150267, 1, 1, 1, 1, 1,
-0.3540724, -0.01709494, -1.130418, 1, 1, 1, 1, 1,
-0.352587, -0.5081942, -1.535641, 1, 1, 1, 1, 1,
-0.3520959, 0.4537469, -0.7818405, 1, 1, 1, 1, 1,
-0.3421268, -0.329207, -3.962642, 1, 1, 1, 1, 1,
-0.3412039, -0.1903034, -1.948793, 1, 1, 1, 1, 1,
-0.3393058, 0.4087377, -1.615215, 1, 1, 1, 1, 1,
-0.333036, 0.3013289, -1.861501, 1, 1, 1, 1, 1,
-0.3276343, 1.371611, -0.1549942, 1, 1, 1, 1, 1,
-0.327439, -0.4540858, -3.37678, 1, 1, 1, 1, 1,
-0.3270761, -0.03117398, -1.178403, 1, 1, 1, 1, 1,
-0.326921, -0.4684589, -3.080314, 1, 1, 1, 1, 1,
-0.3257986, -0.112098, -1.44242, 0, 0, 1, 1, 1,
-0.3249041, -0.5497299, -3.48611, 1, 0, 0, 1, 1,
-0.3235616, 1.528369, 1.787519, 1, 0, 0, 1, 1,
-0.3164901, -0.6367377, -3.998722, 1, 0, 0, 1, 1,
-0.3146602, -0.3535071, -1.757368, 1, 0, 0, 1, 1,
-0.3118957, -0.1825245, -0.7216295, 1, 0, 0, 1, 1,
-0.3114235, -0.3720666, -2.470227, 0, 0, 0, 1, 1,
-0.3084193, -0.1124668, -1.678525, 0, 0, 0, 1, 1,
-0.3080554, 0.5674073, 0.3278328, 0, 0, 0, 1, 1,
-0.3048937, -0.6411605, -5.146832, 0, 0, 0, 1, 1,
-0.304259, 1.398414, -0.02373371, 0, 0, 0, 1, 1,
-0.2995778, 1.521043, 0.2633296, 0, 0, 0, 1, 1,
-0.2976704, 0.06326523, -2.492251, 0, 0, 0, 1, 1,
-0.2960861, -0.3096699, -2.556303, 1, 1, 1, 1, 1,
-0.2926151, 0.6468994, 1.134139, 1, 1, 1, 1, 1,
-0.2861439, -0.4592103, -3.55143, 1, 1, 1, 1, 1,
-0.2822991, 1.223261, -0.6240124, 1, 1, 1, 1, 1,
-0.2816159, 0.4736514, -0.6553147, 1, 1, 1, 1, 1,
-0.2803843, -1.18945, -3.578213, 1, 1, 1, 1, 1,
-0.2759903, 0.1167604, -2.141728, 1, 1, 1, 1, 1,
-0.275973, -0.6413971, -2.23062, 1, 1, 1, 1, 1,
-0.2739744, -0.2330793, -2.866287, 1, 1, 1, 1, 1,
-0.2698234, -0.002120221, -3.692088, 1, 1, 1, 1, 1,
-0.2682838, 0.4211031, 2.487583, 1, 1, 1, 1, 1,
-0.2673135, -3.039226, -4.801638, 1, 1, 1, 1, 1,
-0.2628568, -1.047261, -3.518239, 1, 1, 1, 1, 1,
-0.2627048, -1.022888, -3.732949, 1, 1, 1, 1, 1,
-0.2625473, 0.3426319, 0.2060842, 1, 1, 1, 1, 1,
-0.261957, 1.891788, 1.571575, 0, 0, 1, 1, 1,
-0.259803, 0.2103143, -1.484128, 1, 0, 0, 1, 1,
-0.2587217, 0.5347065, -1.174342, 1, 0, 0, 1, 1,
-0.2580098, 1.66087, 1.001587, 1, 0, 0, 1, 1,
-0.2540449, 0.2666578, -0.1916132, 1, 0, 0, 1, 1,
-0.25188, -1.338018, -1.413312, 1, 0, 0, 1, 1,
-0.2510623, -0.8552635, -3.294469, 0, 0, 0, 1, 1,
-0.2460622, 0.8766369, 1.0905, 0, 0, 0, 1, 1,
-0.2430829, -0.7123886, -3.095309, 0, 0, 0, 1, 1,
-0.2409474, 0.5939831, -0.5401152, 0, 0, 0, 1, 1,
-0.2387975, 0.5264702, -0.4918319, 0, 0, 0, 1, 1,
-0.2338801, 0.3816994, -0.962195, 0, 0, 0, 1, 1,
-0.2312842, 0.4001426, -1.484654, 0, 0, 0, 1, 1,
-0.2291106, 0.5971851, -1.692469, 1, 1, 1, 1, 1,
-0.228494, 0.1417081, 0.1392965, 1, 1, 1, 1, 1,
-0.2247103, 2.783696, -0.784042, 1, 1, 1, 1, 1,
-0.2237911, -0.3873409, -2.643529, 1, 1, 1, 1, 1,
-0.2231068, 0.1585457, -1.15114, 1, 1, 1, 1, 1,
-0.2196878, -0.8454666, -3.055183, 1, 1, 1, 1, 1,
-0.2163534, 0.1160908, 0.2432862, 1, 1, 1, 1, 1,
-0.2131881, -1.643843, -3.319425, 1, 1, 1, 1, 1,
-0.2122029, 0.1322709, -0.260686, 1, 1, 1, 1, 1,
-0.2114997, -1.583021, -2.644372, 1, 1, 1, 1, 1,
-0.2098045, 0.1424409, 0.04121443, 1, 1, 1, 1, 1,
-0.2095727, -0.005126149, -2.068214, 1, 1, 1, 1, 1,
-0.2073215, 0.3352773, -0.133036, 1, 1, 1, 1, 1,
-0.1994112, 0.08512826, -1.411609, 1, 1, 1, 1, 1,
-0.1990968, -0.003068945, -0.9683669, 1, 1, 1, 1, 1,
-0.1969632, -0.4519612, -3.000087, 0, 0, 1, 1, 1,
-0.1944497, -0.3084133, -2.682039, 1, 0, 0, 1, 1,
-0.1893911, 0.4258288, -0.5569041, 1, 0, 0, 1, 1,
-0.1875315, -1.766335, -2.351268, 1, 0, 0, 1, 1,
-0.1858609, -1.158243, -2.784373, 1, 0, 0, 1, 1,
-0.1841013, -0.9270164, -3.708526, 1, 0, 0, 1, 1,
-0.1839776, -0.4913191, -4.054408, 0, 0, 0, 1, 1,
-0.18009, 0.09858957, -1.779698, 0, 0, 0, 1, 1,
-0.1729017, -0.5151364, -2.004888, 0, 0, 0, 1, 1,
-0.168608, -0.5156477, -3.397415, 0, 0, 0, 1, 1,
-0.1673144, 0.4040102, 0.8736749, 0, 0, 0, 1, 1,
-0.1658733, 0.3635487, -1.273509, 0, 0, 0, 1, 1,
-0.1640504, 0.2422191, -0.6009495, 0, 0, 0, 1, 1,
-0.1606026, 0.01680359, -3.327154, 1, 1, 1, 1, 1,
-0.1578192, -0.1676976, -0.1719503, 1, 1, 1, 1, 1,
-0.1564299, -0.8432761, -3.891516, 1, 1, 1, 1, 1,
-0.155932, -0.5586964, -2.054704, 1, 1, 1, 1, 1,
-0.1553704, 0.6390147, 0.7338821, 1, 1, 1, 1, 1,
-0.1526065, 0.1305249, -0.9859378, 1, 1, 1, 1, 1,
-0.1510962, 1.111906, 0.3096729, 1, 1, 1, 1, 1,
-0.1498273, 0.4963851, -1.476561, 1, 1, 1, 1, 1,
-0.1474117, -1.451546, -3.968068, 1, 1, 1, 1, 1,
-0.1438989, -1.856191, -2.867729, 1, 1, 1, 1, 1,
-0.1426417, -0.9774221, -3.343637, 1, 1, 1, 1, 1,
-0.1426227, -0.2407203, -2.485887, 1, 1, 1, 1, 1,
-0.1422821, -0.09765796, -2.803762, 1, 1, 1, 1, 1,
-0.1341404, -1.007057, -3.250821, 1, 1, 1, 1, 1,
-0.1338281, 0.8488712, 1.245062, 1, 1, 1, 1, 1,
-0.1325979, 0.8943774, -0.03041885, 0, 0, 1, 1, 1,
-0.1314297, 0.9541464, -0.1291679, 1, 0, 0, 1, 1,
-0.131056, 1.076458, -1.487547, 1, 0, 0, 1, 1,
-0.1255879, 0.7385901, -2.047715, 1, 0, 0, 1, 1,
-0.125256, 0.5177428, 0.9649115, 1, 0, 0, 1, 1,
-0.1244492, -1.50196, -3.124643, 1, 0, 0, 1, 1,
-0.117625, 2.199715, 0.6130268, 0, 0, 0, 1, 1,
-0.1163787, -0.2340406, -1.974082, 0, 0, 0, 1, 1,
-0.116305, -0.6165913, -1.870905, 0, 0, 0, 1, 1,
-0.1149868, -0.2199675, -2.13354, 0, 0, 0, 1, 1,
-0.1140619, 0.230527, 0.7409438, 0, 0, 0, 1, 1,
-0.1131968, 1.754487, -1.573317, 0, 0, 0, 1, 1,
-0.1089143, -0.0702478, -2.554804, 0, 0, 0, 1, 1,
-0.107203, 0.2101491, 0.03410864, 1, 1, 1, 1, 1,
-0.1063625, -0.9674774, -3.649045, 1, 1, 1, 1, 1,
-0.1054185, -0.4852385, -2.806749, 1, 1, 1, 1, 1,
-0.1002723, 1.260046, 1.382373, 1, 1, 1, 1, 1,
-0.09846243, 0.7980742, -1.733619, 1, 1, 1, 1, 1,
-0.09835792, -0.782083, -1.968094, 1, 1, 1, 1, 1,
-0.09651381, 0.9527127, 0.7724885, 1, 1, 1, 1, 1,
-0.09625926, 1.189331, -1.662828, 1, 1, 1, 1, 1,
-0.09259563, 0.8762586, 0.5156025, 1, 1, 1, 1, 1,
-0.08756542, 1.767852, -0.5684469, 1, 1, 1, 1, 1,
-0.08539975, 0.6657282, 0.7147673, 1, 1, 1, 1, 1,
-0.08148083, 1.020347, 0.4194675, 1, 1, 1, 1, 1,
-0.08091486, -0.8255325, -5.124787, 1, 1, 1, 1, 1,
-0.07365127, 2.009444, -0.5587311, 1, 1, 1, 1, 1,
-0.07250954, -0.7421161, -2.625642, 1, 1, 1, 1, 1,
-0.06138183, 0.2433113, -1.807774, 0, 0, 1, 1, 1,
-0.06107879, -0.2406096, -2.690347, 1, 0, 0, 1, 1,
-0.05932428, -0.6319051, -3.220109, 1, 0, 0, 1, 1,
-0.05927947, 0.7022988, -0.306854, 1, 0, 0, 1, 1,
-0.05879439, -1.172734, -2.577424, 1, 0, 0, 1, 1,
-0.05822339, 0.3110249, -0.06716454, 1, 0, 0, 1, 1,
-0.05624288, 0.6347131, -0.6112866, 0, 0, 0, 1, 1,
-0.05341347, 0.1789625, 2.185804, 0, 0, 0, 1, 1,
-0.05182291, 0.4158575, -0.6377917, 0, 0, 0, 1, 1,
-0.04881456, -1.088043, -3.208192, 0, 0, 0, 1, 1,
-0.04868113, -1.31434, -3.240472, 0, 0, 0, 1, 1,
-0.03970401, -0.0564747, -2.165118, 0, 0, 0, 1, 1,
-0.03749462, 0.8548782, 0.6863621, 0, 0, 0, 1, 1,
-0.0373699, -0.5110278, -2.531012, 1, 1, 1, 1, 1,
-0.0324358, -0.2258311, -5.032605, 1, 1, 1, 1, 1,
-0.02876246, -0.1546089, -3.83755, 1, 1, 1, 1, 1,
-0.02695895, -0.002579028, -1.460218, 1, 1, 1, 1, 1,
-0.02590545, 0.5159327, -0.07990697, 1, 1, 1, 1, 1,
-0.02421847, -0.5592927, -2.997821, 1, 1, 1, 1, 1,
-0.02269969, -1.176794, -2.550522, 1, 1, 1, 1, 1,
-0.02189421, -0.7126409, -1.67168, 1, 1, 1, 1, 1,
-0.02161342, 1.476423, 0.5315914, 1, 1, 1, 1, 1,
-0.02025672, -2.046763, -0.9138811, 1, 1, 1, 1, 1,
-0.01834505, 0.5037214, 1.628603, 1, 1, 1, 1, 1,
-0.01701872, -0.08881288, -3.118421, 1, 1, 1, 1, 1,
-0.01573723, 0.4802369, 0.3171014, 1, 1, 1, 1, 1,
-0.0155402, -0.5894557, -2.967602, 1, 1, 1, 1, 1,
-0.01208128, -2.308288, -3.192485, 1, 1, 1, 1, 1,
-0.006193657, -0.5161471, -1.981453, 0, 0, 1, 1, 1,
-0.006146404, -0.3683212, -4.116411, 1, 0, 0, 1, 1,
-0.005223395, -1.067403, -4.013333, 1, 0, 0, 1, 1,
-0.004356945, -0.7730461, -4.751303, 1, 0, 0, 1, 1,
-0.002804301, 0.06868423, -0.4150662, 1, 0, 0, 1, 1,
-0.0001193143, 0.2195096, -0.6996185, 1, 0, 0, 1, 1,
0.006303323, -0.3799569, 3.723938, 0, 0, 0, 1, 1,
0.00866982, -0.009434906, 2.253808, 0, 0, 0, 1, 1,
0.009622645, -0.5962192, 3.077016, 0, 0, 0, 1, 1,
0.01025485, -0.3519821, 6.128102, 0, 0, 0, 1, 1,
0.01839002, -1.32353, 4.482031, 0, 0, 0, 1, 1,
0.01911315, -0.01761908, 2.850927, 0, 0, 0, 1, 1,
0.02005546, 1.152233, -0.3341813, 0, 0, 0, 1, 1,
0.02309099, -0.2652303, 2.778687, 1, 1, 1, 1, 1,
0.02426196, -0.4664016, 3.445473, 1, 1, 1, 1, 1,
0.02549587, -0.7384195, 2.952727, 1, 1, 1, 1, 1,
0.0277465, -0.2413722, 2.820416, 1, 1, 1, 1, 1,
0.03742943, -0.4295155, 1.854248, 1, 1, 1, 1, 1,
0.04104837, 0.2938799, 1.000836, 1, 1, 1, 1, 1,
0.04422997, -0.5546252, 3.324622, 1, 1, 1, 1, 1,
0.04660815, 0.5669562, 1.49966, 1, 1, 1, 1, 1,
0.04917321, -1.237177, 2.198878, 1, 1, 1, 1, 1,
0.05271801, -0.1850723, 2.807165, 1, 1, 1, 1, 1,
0.05364971, 0.8738147, -0.5894392, 1, 1, 1, 1, 1,
0.05549426, 0.6821043, -0.2456222, 1, 1, 1, 1, 1,
0.05752203, 0.401719, 1.927573, 1, 1, 1, 1, 1,
0.05910403, -0.4061967, 3.395925, 1, 1, 1, 1, 1,
0.06424791, 0.2249267, -0.6069556, 1, 1, 1, 1, 1,
0.06540677, 1.084003, 0.710701, 0, 0, 1, 1, 1,
0.06716239, -0.475385, 2.195849, 1, 0, 0, 1, 1,
0.07075362, 0.4604645, 0.7286064, 1, 0, 0, 1, 1,
0.07467114, -0.1997729, 2.660873, 1, 0, 0, 1, 1,
0.07655033, 0.6220216, -0.04480245, 1, 0, 0, 1, 1,
0.07911668, 0.7534888, 0.3801683, 1, 0, 0, 1, 1,
0.08458591, -0.1922877, 2.500742, 0, 0, 0, 1, 1,
0.08535014, 0.5254655, 0.8477446, 0, 0, 0, 1, 1,
0.08868701, 2.219456, 0.1716136, 0, 0, 0, 1, 1,
0.08911993, 0.0412706, 0.8344019, 0, 0, 0, 1, 1,
0.09244966, -0.5972583, 2.106156, 0, 0, 0, 1, 1,
0.09261059, -0.2360646, 2.750502, 0, 0, 0, 1, 1,
0.09910604, 1.265077, 0.4887449, 0, 0, 0, 1, 1,
0.09989747, -0.4964406, 2.331052, 1, 1, 1, 1, 1,
0.1012228, -1.251718, 3.567691, 1, 1, 1, 1, 1,
0.1014065, 2.062568, 0.2362286, 1, 1, 1, 1, 1,
0.102487, -0.2185167, 2.832569, 1, 1, 1, 1, 1,
0.1044351, -1.186112, 2.70744, 1, 1, 1, 1, 1,
0.1087078, 0.1702006, 2.27898, 1, 1, 1, 1, 1,
0.1103705, 1.628998, 0.1360507, 1, 1, 1, 1, 1,
0.111933, 0.246896, 0.4946845, 1, 1, 1, 1, 1,
0.1134871, -0.2545563, 1.783505, 1, 1, 1, 1, 1,
0.1141289, 0.5773521, -0.5505175, 1, 1, 1, 1, 1,
0.1273896, 1.371445, -1.293153, 1, 1, 1, 1, 1,
0.1281953, -0.05233769, 1.817045, 1, 1, 1, 1, 1,
0.1390821, -0.9557186, 1.57946, 1, 1, 1, 1, 1,
0.1431367, 0.375795, -0.4582075, 1, 1, 1, 1, 1,
0.1548278, -0.6859535, 3.022965, 1, 1, 1, 1, 1,
0.1584865, -0.3751086, 3.938976, 0, 0, 1, 1, 1,
0.1593646, -0.8877605, 4.012759, 1, 0, 0, 1, 1,
0.159994, -0.3709463, 0.997889, 1, 0, 0, 1, 1,
0.1610122, -0.3214962, 3.724274, 1, 0, 0, 1, 1,
0.1640226, 0.4027429, 1.020218, 1, 0, 0, 1, 1,
0.1654795, 0.6566615, 1.189273, 1, 0, 0, 1, 1,
0.1681303, -2.161258, 1.053901, 0, 0, 0, 1, 1,
0.1689356, -0.7815641, 4.649946, 0, 0, 0, 1, 1,
0.1701676, 1.518503, -0.2543498, 0, 0, 0, 1, 1,
0.1707465, 0.4010528, -0.176009, 0, 0, 0, 1, 1,
0.1741315, -0.3887627, 0.6354043, 0, 0, 0, 1, 1,
0.1741725, -0.155788, 3.446109, 0, 0, 0, 1, 1,
0.1772661, -2.097964, 2.430797, 0, 0, 0, 1, 1,
0.1773696, -0.01879721, 2.39141, 1, 1, 1, 1, 1,
0.1828643, -0.2164061, 2.213095, 1, 1, 1, 1, 1,
0.1854537, 0.3899518, -0.1269422, 1, 1, 1, 1, 1,
0.1866335, -0.5805899, 3.143591, 1, 1, 1, 1, 1,
0.2008809, -0.5464724, 2.989068, 1, 1, 1, 1, 1,
0.2010121, -0.7823282, 0.0864323, 1, 1, 1, 1, 1,
0.2016538, -1.246884, 4.659266, 1, 1, 1, 1, 1,
0.2025509, 0.1590703, 0.01478474, 1, 1, 1, 1, 1,
0.203014, 0.3557695, 0.3739007, 1, 1, 1, 1, 1,
0.2065619, 0.7036445, -1.467749, 1, 1, 1, 1, 1,
0.209033, 0.1217473, 0.642598, 1, 1, 1, 1, 1,
0.2100005, -0.8345191, 2.218343, 1, 1, 1, 1, 1,
0.2112995, 0.3994697, 0.3742929, 1, 1, 1, 1, 1,
0.2127445, 1.067269, -0.07788008, 1, 1, 1, 1, 1,
0.2171121, -1.529758, 1.77882, 1, 1, 1, 1, 1,
0.2191014, -0.4820078, 3.583031, 0, 0, 1, 1, 1,
0.2260084, 1.516396, -1.55747, 1, 0, 0, 1, 1,
0.227298, 0.8002047, 1.265453, 1, 0, 0, 1, 1,
0.229442, 0.3988904, 1.506749, 1, 0, 0, 1, 1,
0.2313131, 0.7230563, 1.716131, 1, 0, 0, 1, 1,
0.2322285, 0.4594492, -1.474072, 1, 0, 0, 1, 1,
0.2349383, 1.26138, -1.055861, 0, 0, 0, 1, 1,
0.2371576, -1.288823, 2.560265, 0, 0, 0, 1, 1,
0.2380489, -1.079632, 2.405004, 0, 0, 0, 1, 1,
0.2438292, 1.989433, -2.416214, 0, 0, 0, 1, 1,
0.2457562, 1.120562, -0.04423688, 0, 0, 0, 1, 1,
0.2546736, 0.1055805, 0.6741753, 0, 0, 0, 1, 1,
0.2549435, -0.8251433, 1.927222, 0, 0, 0, 1, 1,
0.2555655, 1.841821, 0.476163, 1, 1, 1, 1, 1,
0.2587774, -1.020949, 2.524843, 1, 1, 1, 1, 1,
0.2621749, -1.240386, 2.365981, 1, 1, 1, 1, 1,
0.2659318, -0.5298828, 2.556935, 1, 1, 1, 1, 1,
0.2762504, -0.6811392, 3.009267, 1, 1, 1, 1, 1,
0.2790124, -0.7872451, 3.362453, 1, 1, 1, 1, 1,
0.2866688, -0.851584, 3.60993, 1, 1, 1, 1, 1,
0.2868161, 1.768231, 0.824266, 1, 1, 1, 1, 1,
0.2872954, 0.9998174, 2.575392, 1, 1, 1, 1, 1,
0.288251, 0.2476947, -0.0690326, 1, 1, 1, 1, 1,
0.2902668, -0.586128, 3.55564, 1, 1, 1, 1, 1,
0.2906618, -0.4040027, 2.762066, 1, 1, 1, 1, 1,
0.290902, 2.550085, -0.7812649, 1, 1, 1, 1, 1,
0.2919414, 0.8023398, 1.208362, 1, 1, 1, 1, 1,
0.2923862, 0.1820421, 1.926662, 1, 1, 1, 1, 1,
0.2936882, 0.8411885, 0.3693362, 0, 0, 1, 1, 1,
0.2972889, -0.649239, 2.237775, 1, 0, 0, 1, 1,
0.3086038, 1.011853, 2.639697, 1, 0, 0, 1, 1,
0.3098108, -0.2187095, 3.279125, 1, 0, 0, 1, 1,
0.3166908, 1.296768, -0.0904687, 1, 0, 0, 1, 1,
0.3195597, 0.9498256, 3.272463, 1, 0, 0, 1, 1,
0.3249068, -1.033907, 1.471508, 0, 0, 0, 1, 1,
0.3318575, -0.4052893, 3.632325, 0, 0, 0, 1, 1,
0.3324866, -0.970147, 3.241186, 0, 0, 0, 1, 1,
0.332675, 1.098888, -0.3328301, 0, 0, 0, 1, 1,
0.3330006, 0.7150765, 1.983565, 0, 0, 0, 1, 1,
0.3330287, -0.4829471, 2.808319, 0, 0, 0, 1, 1,
0.3351743, 0.07550059, 1.448459, 0, 0, 0, 1, 1,
0.3374961, -2.703392, 4.261349, 1, 1, 1, 1, 1,
0.3378302, -0.9785528, 2.749484, 1, 1, 1, 1, 1,
0.3419312, -0.6202248, 1.873636, 1, 1, 1, 1, 1,
0.3472548, 0.4189746, 1.585662, 1, 1, 1, 1, 1,
0.3524784, -0.7477241, 1.968978, 1, 1, 1, 1, 1,
0.3557384, -1.985358, 2.467626, 1, 1, 1, 1, 1,
0.3564578, 0.4318722, -1.4496, 1, 1, 1, 1, 1,
0.3598615, -1.331384, 1.559425, 1, 1, 1, 1, 1,
0.3612465, 0.5514586, 1.933625, 1, 1, 1, 1, 1,
0.3626754, -0.3237958, 3.756237, 1, 1, 1, 1, 1,
0.3666177, 0.5205077, -0.4522364, 1, 1, 1, 1, 1,
0.3673835, -0.1579262, 0.3637521, 1, 1, 1, 1, 1,
0.3712489, -0.1886379, 1.727948, 1, 1, 1, 1, 1,
0.3763348, 1.506112, -0.3307339, 1, 1, 1, 1, 1,
0.3781069, -0.7659858, 4.018336, 1, 1, 1, 1, 1,
0.3788827, 0.3514735, 0.3005015, 0, 0, 1, 1, 1,
0.3822202, -0.2443696, 2.079677, 1, 0, 0, 1, 1,
0.3871116, -0.9558957, 2.327567, 1, 0, 0, 1, 1,
0.3886078, -1.171785, 2.480477, 1, 0, 0, 1, 1,
0.3886922, 1.534403, 1.926932, 1, 0, 0, 1, 1,
0.3909194, 1.086022, -1.637556, 1, 0, 0, 1, 1,
0.3958637, 0.331819, 1.866788, 0, 0, 0, 1, 1,
0.3959464, 0.4749649, 0.7089765, 0, 0, 0, 1, 1,
0.3986354, 0.4098813, 0.1689994, 0, 0, 0, 1, 1,
0.3998131, -1.752631, 3.948065, 0, 0, 0, 1, 1,
0.4018956, -0.8072314, 1.389237, 0, 0, 0, 1, 1,
0.4025712, 1.447864, 1.251379, 0, 0, 0, 1, 1,
0.4108487, -1.196228, 3.82133, 0, 0, 0, 1, 1,
0.4130367, -0.3433919, 0.7422652, 1, 1, 1, 1, 1,
0.4140502, 0.1230326, 0.1012558, 1, 1, 1, 1, 1,
0.4143644, 0.1649304, 2.616839, 1, 1, 1, 1, 1,
0.4152958, 0.5476104, -1.12642, 1, 1, 1, 1, 1,
0.4191772, -1.201308, 1.784823, 1, 1, 1, 1, 1,
0.4205031, 0.2005236, -1.012642, 1, 1, 1, 1, 1,
0.4286493, -1.305269, 1.563581, 1, 1, 1, 1, 1,
0.4336846, -0.5376937, 3.061144, 1, 1, 1, 1, 1,
0.4347882, -1.088304, 1.701363, 1, 1, 1, 1, 1,
0.4355129, -0.479006, 1.732677, 1, 1, 1, 1, 1,
0.4366567, -0.8107907, 2.506941, 1, 1, 1, 1, 1,
0.4419953, 0.3800998, 0.6382881, 1, 1, 1, 1, 1,
0.4481457, 1.283822, -1.083627, 1, 1, 1, 1, 1,
0.4504848, 1.478233, -0.2496884, 1, 1, 1, 1, 1,
0.4512861, 1.266494, -3.025759, 1, 1, 1, 1, 1,
0.4562373, -0.8020216, 1.442373, 0, 0, 1, 1, 1,
0.4604887, -0.3877026, 2.021145, 1, 0, 0, 1, 1,
0.4661794, -1.845695, 1.68782, 1, 0, 0, 1, 1,
0.4663624, 0.5213171, 1.194416, 1, 0, 0, 1, 1,
0.4665315, 0.7153407, -0.210202, 1, 0, 0, 1, 1,
0.4714083, 2.079127, -0.2618144, 1, 0, 0, 1, 1,
0.471865, -0.2512221, 2.081825, 0, 0, 0, 1, 1,
0.4725585, -0.4713429, 3.650291, 0, 0, 0, 1, 1,
0.4764052, 0.2054224, 3.7403, 0, 0, 0, 1, 1,
0.4807602, 0.7822359, 2.518104, 0, 0, 0, 1, 1,
0.4861082, 0.9676177, 0.1717332, 0, 0, 0, 1, 1,
0.4914494, -1.030568, 3.954485, 0, 0, 0, 1, 1,
0.4939525, -0.613337, 3.525589, 0, 0, 0, 1, 1,
0.4955547, 0.3214343, -1.749998, 1, 1, 1, 1, 1,
0.5019426, -0.1698418, 0.656195, 1, 1, 1, 1, 1,
0.5058054, 0.6197639, 0.6039231, 1, 1, 1, 1, 1,
0.5115348, -0.5581293, 4.140453, 1, 1, 1, 1, 1,
0.5143037, 1.498592, 0.9503524, 1, 1, 1, 1, 1,
0.5145801, 1.444043, -0.006217592, 1, 1, 1, 1, 1,
0.5214699, 0.4718386, -0.1758035, 1, 1, 1, 1, 1,
0.5259862, -0.8705766, 2.013394, 1, 1, 1, 1, 1,
0.5333108, 0.7998169, 0.5845382, 1, 1, 1, 1, 1,
0.535528, 0.6165422, 0.9033156, 1, 1, 1, 1, 1,
0.5360622, 0.952171, 0.1626594, 1, 1, 1, 1, 1,
0.5377842, 0.1976079, 2.15314, 1, 1, 1, 1, 1,
0.5412884, 1.344506, 1.215456, 1, 1, 1, 1, 1,
0.5433077, -2.608654, 3.267968, 1, 1, 1, 1, 1,
0.5475315, 1.477847, 0.7566401, 1, 1, 1, 1, 1,
0.5481412, -0.7977033, 3.708606, 0, 0, 1, 1, 1,
0.5512548, -0.2909394, 1.378821, 1, 0, 0, 1, 1,
0.5513819, -1.700739, 2.898495, 1, 0, 0, 1, 1,
0.5571679, -0.7166151, 0.5595109, 1, 0, 0, 1, 1,
0.5593786, 0.8069648, 0.8428606, 1, 0, 0, 1, 1,
0.5606484, 1.973993, 0.5384667, 1, 0, 0, 1, 1,
0.5612274, -0.7844876, 2.467037, 0, 0, 0, 1, 1,
0.5637108, -0.3325124, 3.538062, 0, 0, 0, 1, 1,
0.5639682, 0.7414919, 1.204433, 0, 0, 0, 1, 1,
0.5654704, 0.1055871, 1.12657, 0, 0, 0, 1, 1,
0.5676051, 0.7625619, 0.6946445, 0, 0, 0, 1, 1,
0.5750385, 2.084427, 0.7692912, 0, 0, 0, 1, 1,
0.5768133, 0.4154096, 0.3116249, 0, 0, 0, 1, 1,
0.584807, 0.09639633, 1.017067, 1, 1, 1, 1, 1,
0.596831, 1.115996, 1.610976, 1, 1, 1, 1, 1,
0.5987191, -0.03185198, 1.425062, 1, 1, 1, 1, 1,
0.6079328, -1.314613, 1.592586, 1, 1, 1, 1, 1,
0.618307, -0.8839009, 1.559388, 1, 1, 1, 1, 1,
0.6187183, -1.062306, 2.32937, 1, 1, 1, 1, 1,
0.6259884, 0.5710673, 3.200655, 1, 1, 1, 1, 1,
0.6296657, -0.136701, 2.899897, 1, 1, 1, 1, 1,
0.6318558, 0.3875908, 1.145295, 1, 1, 1, 1, 1,
0.6352279, -1.812189, 2.046336, 1, 1, 1, 1, 1,
0.6405013, 1.001858, 0.9471557, 1, 1, 1, 1, 1,
0.6461411, 0.7991517, 1.510469, 1, 1, 1, 1, 1,
0.6487188, 0.08430258, 1.829334, 1, 1, 1, 1, 1,
0.6525196, -1.69317, 1.585942, 1, 1, 1, 1, 1,
0.6558601, -1.155891, 3.616178, 1, 1, 1, 1, 1,
0.6624033, 0.8587959, -0.1841508, 0, 0, 1, 1, 1,
0.6650596, 0.8815381, 1.105411, 1, 0, 0, 1, 1,
0.6691515, -1.36609, 3.870856, 1, 0, 0, 1, 1,
0.6702815, -0.5685278, 0.1856352, 1, 0, 0, 1, 1,
0.6772617, 0.343041, 1.63992, 1, 0, 0, 1, 1,
0.6779464, 1.065922, 0.3252095, 1, 0, 0, 1, 1,
0.6789001, -0.6934631, 3.330543, 0, 0, 0, 1, 1,
0.683002, 0.7961683, 0.8386203, 0, 0, 0, 1, 1,
0.689023, -1.016988, 2.335976, 0, 0, 0, 1, 1,
0.694217, 1.056641, 0.6318445, 0, 0, 0, 1, 1,
0.6990873, 0.3372963, 2.765045, 0, 0, 0, 1, 1,
0.7046155, 1.863889, 0.1764697, 0, 0, 0, 1, 1,
0.7063566, -1.462606, 3.612045, 0, 0, 0, 1, 1,
0.7090625, 2.102351, 0.001865735, 1, 1, 1, 1, 1,
0.7110334, 0.04268751, 1.142581, 1, 1, 1, 1, 1,
0.7113041, -0.5944216, 3.146221, 1, 1, 1, 1, 1,
0.712006, 1.005919, 2.142069, 1, 1, 1, 1, 1,
0.7127363, 1.221721, 0.9396844, 1, 1, 1, 1, 1,
0.7131799, 1.413075, -0.5183995, 1, 1, 1, 1, 1,
0.7141393, -1.398634, 3.561144, 1, 1, 1, 1, 1,
0.7192529, -0.442987, 2.335786, 1, 1, 1, 1, 1,
0.7225947, 0.3105033, 0.6639761, 1, 1, 1, 1, 1,
0.7236633, 0.2720234, 1.023297, 1, 1, 1, 1, 1,
0.7298362, -0.04869182, -1.557327, 1, 1, 1, 1, 1,
0.7311515, -0.9865355, 2.60805, 1, 1, 1, 1, 1,
0.7336358, 0.8514847, 0.3944575, 1, 1, 1, 1, 1,
0.7362213, 1.293329, 0.8426722, 1, 1, 1, 1, 1,
0.7371135, 1.531862, 1.663615, 1, 1, 1, 1, 1,
0.7416315, 0.07417419, 0.07098055, 0, 0, 1, 1, 1,
0.7476453, -0.0678122, 1.612427, 1, 0, 0, 1, 1,
0.7508377, 1.685046, -1.043194, 1, 0, 0, 1, 1,
0.7513806, 1.291621, -0.05933966, 1, 0, 0, 1, 1,
0.7517326, -0.1473568, 2.177375, 1, 0, 0, 1, 1,
0.7683026, -0.8068032, 3.93772, 1, 0, 0, 1, 1,
0.7684532, -0.3640035, 3.024448, 0, 0, 0, 1, 1,
0.7716677, 2.303583, 2.585067, 0, 0, 0, 1, 1,
0.7744586, 0.3014264, 1.591, 0, 0, 0, 1, 1,
0.7785199, 0.3614641, 0.969008, 0, 0, 0, 1, 1,
0.7825558, 0.144758, 1.67796, 0, 0, 0, 1, 1,
0.7911772, -0.5021531, 1.783875, 0, 0, 0, 1, 1,
0.791233, 0.7360646, 1.48991, 0, 0, 0, 1, 1,
0.7927271, -0.8198934, 1.235329, 1, 1, 1, 1, 1,
0.7928634, -0.1857643, 2.175725, 1, 1, 1, 1, 1,
0.8059612, 0.3418671, -0.3452555, 1, 1, 1, 1, 1,
0.8151736, -1.651019, 2.312391, 1, 1, 1, 1, 1,
0.8174117, -0.3254169, 1.742607, 1, 1, 1, 1, 1,
0.8183767, -0.8792813, 1.259559, 1, 1, 1, 1, 1,
0.8214611, -1.533224, 3.134465, 1, 1, 1, 1, 1,
0.8235261, 0.5757515, 0.460366, 1, 1, 1, 1, 1,
0.8243451, 0.1387399, 0.9223646, 1, 1, 1, 1, 1,
0.8259196, -0.836383, 3.442416, 1, 1, 1, 1, 1,
0.8358036, 0.9215162, 1.093209, 1, 1, 1, 1, 1,
0.8397199, -0.1949933, 2.47666, 1, 1, 1, 1, 1,
0.845435, -0.9319584, 2.501327, 1, 1, 1, 1, 1,
0.8490698, -0.1174518, 2.548095, 1, 1, 1, 1, 1,
0.8537632, -0.693455, 0.9143966, 1, 1, 1, 1, 1,
0.8564841, -0.8776114, 1.632269, 0, 0, 1, 1, 1,
0.8567874, 1.735929, 1.810848, 1, 0, 0, 1, 1,
0.8578538, -1.401221, 1.619288, 1, 0, 0, 1, 1,
0.8692425, 1.052628, 1.002184, 1, 0, 0, 1, 1,
0.8757757, 0.8524758, 0.7178499, 1, 0, 0, 1, 1,
0.8764673, -0.4959757, 3.532298, 1, 0, 0, 1, 1,
0.880289, -0.3788843, 2.314004, 0, 0, 0, 1, 1,
0.8851699, 0.6695772, 0.1202826, 0, 0, 0, 1, 1,
0.8856025, -0.5168273, -0.04815744, 0, 0, 0, 1, 1,
0.8864474, 0.2202937, 1.760574, 0, 0, 0, 1, 1,
0.8946672, 0.5505018, 0.08762044, 0, 0, 0, 1, 1,
0.8987573, 0.1626036, 2.557311, 0, 0, 0, 1, 1,
0.8994229, 1.416176, -0.5977978, 0, 0, 0, 1, 1,
0.8994361, -0.501013, 3.066045, 1, 1, 1, 1, 1,
0.8996617, 0.9219843, 0.3450478, 1, 1, 1, 1, 1,
0.9082996, -0.5127509, 1.223032, 1, 1, 1, 1, 1,
0.9114267, 1.589126, 1.81412, 1, 1, 1, 1, 1,
0.9142427, 0.1746653, 1.874451, 1, 1, 1, 1, 1,
0.9157509, -1.119483, 0.7770391, 1, 1, 1, 1, 1,
0.9179087, 0.6985101, 1.217092, 1, 1, 1, 1, 1,
0.9238254, -0.3328534, 1.526493, 1, 1, 1, 1, 1,
0.9318934, 2.155523, -1.427915, 1, 1, 1, 1, 1,
0.9372379, 0.3525568, 2.079043, 1, 1, 1, 1, 1,
0.9510541, 0.8157707, 2.452277, 1, 1, 1, 1, 1,
0.9557151, 1.288054, 0.6418379, 1, 1, 1, 1, 1,
0.9610337, -1.093621, 2.821486, 1, 1, 1, 1, 1,
0.963437, 3.004094, 1.179467, 1, 1, 1, 1, 1,
0.9652691, -0.2209349, 1.101827, 1, 1, 1, 1, 1,
0.966456, 1.724616, 0.09737455, 0, 0, 1, 1, 1,
0.9739285, 0.351805, 1.045895, 1, 0, 0, 1, 1,
0.9828333, 0.01595264, 0.2155588, 1, 0, 0, 1, 1,
0.9846155, -0.1133614, 2.336582, 1, 0, 0, 1, 1,
0.9855859, 2.325735, 0.1240175, 1, 0, 0, 1, 1,
0.992402, 0.7553611, -0.2073003, 1, 0, 0, 1, 1,
0.9962217, -0.2685499, 0.8832152, 0, 0, 0, 1, 1,
1.00092, -1.534771, 3.560903, 0, 0, 0, 1, 1,
1.004664, 0.1889676, 0.7391536, 0, 0, 0, 1, 1,
1.009753, -0.04587966, 0.2701795, 0, 0, 0, 1, 1,
1.009943, 0.1167545, 0.5572307, 0, 0, 0, 1, 1,
1.015566, -0.3405932, 2.982879, 0, 0, 0, 1, 1,
1.01801, 0.2158172, 0.7047054, 0, 0, 0, 1, 1,
1.023311, 1.169409, 0.04650886, 1, 1, 1, 1, 1,
1.028105, -0.001746765, 2.002495, 1, 1, 1, 1, 1,
1.038946, -0.3266699, 1.140683, 1, 1, 1, 1, 1,
1.047907, 1.000841, 2.027476, 1, 1, 1, 1, 1,
1.04824, 2.023337, 1.051481, 1, 1, 1, 1, 1,
1.050253, 0.2669662, -0.5967947, 1, 1, 1, 1, 1,
1.052658, -0.7668025, 1.09102, 1, 1, 1, 1, 1,
1.057953, 0.09984872, 0.8315498, 1, 1, 1, 1, 1,
1.063225, 0.8362976, 1.202919, 1, 1, 1, 1, 1,
1.072452, -0.6897513, 2.585463, 1, 1, 1, 1, 1,
1.080232, 1.455088, 0.08620501, 1, 1, 1, 1, 1,
1.085392, -0.2202667, 2.095364, 1, 1, 1, 1, 1,
1.087564, -0.7524842, 2.986557, 1, 1, 1, 1, 1,
1.087743, -0.5395845, 1.846966, 1, 1, 1, 1, 1,
1.090072, 1.270267, 0.8058729, 1, 1, 1, 1, 1,
1.10906, -1.709274, 4.011517, 0, 0, 1, 1, 1,
1.131548, -0.8468423, 2.825665, 1, 0, 0, 1, 1,
1.132586, 1.128688, -0.5274185, 1, 0, 0, 1, 1,
1.140277, 0.7977597, 2.244887, 1, 0, 0, 1, 1,
1.144594, 0.1086593, 2.242937, 1, 0, 0, 1, 1,
1.147454, -0.3135433, 2.107864, 1, 0, 0, 1, 1,
1.172065, 0.4225943, 1.458275, 0, 0, 0, 1, 1,
1.175282, -1.64483, 1.81083, 0, 0, 0, 1, 1,
1.17783, 1.380891, -1.189413, 0, 0, 0, 1, 1,
1.180122, 0.3823638, 3.494088, 0, 0, 0, 1, 1,
1.218806, -0.3605501, 1.597965, 0, 0, 0, 1, 1,
1.219396, -0.8044977, -0.297108, 0, 0, 0, 1, 1,
1.228341, -1.722916, 2.136356, 0, 0, 0, 1, 1,
1.238497, 0.3650736, 0.7858024, 1, 1, 1, 1, 1,
1.239634, 1.495053, 2.165715, 1, 1, 1, 1, 1,
1.241629, 1.998496, 0.4078385, 1, 1, 1, 1, 1,
1.250096, -1.168286, 0.8995128, 1, 1, 1, 1, 1,
1.252241, -1.795401, 3.426379, 1, 1, 1, 1, 1,
1.259694, -0.6051461, 1.860894, 1, 1, 1, 1, 1,
1.260335, -0.5476854, 1.931679, 1, 1, 1, 1, 1,
1.262542, 0.08293619, 1.308912, 1, 1, 1, 1, 1,
1.262591, 0.7451342, -0.1925338, 1, 1, 1, 1, 1,
1.264805, -0.8901299, 2.838248, 1, 1, 1, 1, 1,
1.265313, 1.371515, -0.4803389, 1, 1, 1, 1, 1,
1.266356, -0.6884911, 2.790657, 1, 1, 1, 1, 1,
1.275457, -1.414353, 3.68506, 1, 1, 1, 1, 1,
1.280132, 1.690065, 0.7926439, 1, 1, 1, 1, 1,
1.292135, 0.3481874, 1.970723, 1, 1, 1, 1, 1,
1.29786, -0.5167742, 1.904397, 0, 0, 1, 1, 1,
1.298248, 1.318942, 1.87273, 1, 0, 0, 1, 1,
1.298735, -1.312065, 2.036541, 1, 0, 0, 1, 1,
1.312775, 1.982544, 0.4406001, 1, 0, 0, 1, 1,
1.327612, 0.1433991, 0.5107602, 1, 0, 0, 1, 1,
1.333754, -1.6457, 0.8028853, 1, 0, 0, 1, 1,
1.334504, -0.09133291, 1.574528, 0, 0, 0, 1, 1,
1.33548, -0.3520203, 2.572923, 0, 0, 0, 1, 1,
1.33938, 0.9387688, 0.8791639, 0, 0, 0, 1, 1,
1.344475, 0.4424025, 1.204765, 0, 0, 0, 1, 1,
1.34625, 1.401295, 0.5436062, 0, 0, 0, 1, 1,
1.35986, -0.2516482, 0.3046036, 0, 0, 0, 1, 1,
1.362143, 0.7370664, 0.2655265, 0, 0, 0, 1, 1,
1.366839, 1.920892, 1.301194, 1, 1, 1, 1, 1,
1.369216, 1.723083, -1.038836, 1, 1, 1, 1, 1,
1.372582, 0.2784163, 0.4760666, 1, 1, 1, 1, 1,
1.377425, 1.45567, 1.087598, 1, 1, 1, 1, 1,
1.389969, 0.8789601, 1.165861, 1, 1, 1, 1, 1,
1.392339, 1.380412, -0.7722108, 1, 1, 1, 1, 1,
1.398751, -0.9419185, -0.001802839, 1, 1, 1, 1, 1,
1.409489, -0.6901473, 0.1125255, 1, 1, 1, 1, 1,
1.412882, 0.2808674, 0.3451074, 1, 1, 1, 1, 1,
1.417725, -0.3830888, 2.78102, 1, 1, 1, 1, 1,
1.423894, -0.9506846, 2.036746, 1, 1, 1, 1, 1,
1.441899, -1.665114, 1.629776, 1, 1, 1, 1, 1,
1.448561, -1.385946, 1.992736, 1, 1, 1, 1, 1,
1.453663, 0.6252543, 0.638368, 1, 1, 1, 1, 1,
1.458591, 0.1567672, -0.1437876, 1, 1, 1, 1, 1,
1.468622, -0.8077183, 3.217419, 0, 0, 1, 1, 1,
1.46936, -0.8242717, 1.922593, 1, 0, 0, 1, 1,
1.488218, -0.5128182, 0.6495914, 1, 0, 0, 1, 1,
1.48874, -1.304614, 2.277394, 1, 0, 0, 1, 1,
1.503515, -1.288182, 2.178043, 1, 0, 0, 1, 1,
1.510265, -1.353149, 2.990178, 1, 0, 0, 1, 1,
1.522035, 0.05968166, 0.3382185, 0, 0, 0, 1, 1,
1.523822, 1.46503, 1.72657, 0, 0, 0, 1, 1,
1.534362, 0.4096509, 1.358146, 0, 0, 0, 1, 1,
1.541575, -2.239256, 3.361819, 0, 0, 0, 1, 1,
1.556438, -0.8739816, 0.1932582, 0, 0, 0, 1, 1,
1.556541, 0.4882033, 1.416159, 0, 0, 0, 1, 1,
1.566682, -0.03720111, 1.061383, 0, 0, 0, 1, 1,
1.572571, 0.09302881, -0.08820923, 1, 1, 1, 1, 1,
1.582263, 0.9543108, 0.3908855, 1, 1, 1, 1, 1,
1.584825, -1.107977, 0.7656683, 1, 1, 1, 1, 1,
1.586422, 1.016879, 0.9436538, 1, 1, 1, 1, 1,
1.6054, 0.6622458, 0.8159257, 1, 1, 1, 1, 1,
1.609842, -0.03927267, 0.3893942, 1, 1, 1, 1, 1,
1.621896, -0.05437982, 1.922398, 1, 1, 1, 1, 1,
1.646977, -0.01772097, 1.763657, 1, 1, 1, 1, 1,
1.667683, 0.264539, 1.937831, 1, 1, 1, 1, 1,
1.670214, 0.990403, 0.3811224, 1, 1, 1, 1, 1,
1.690662, -0.8955725, 2.923084, 1, 1, 1, 1, 1,
1.690933, 0.9718232, 3.127424, 1, 1, 1, 1, 1,
1.698438, 0.009916032, 0.9048265, 1, 1, 1, 1, 1,
1.731311, 1.102718, 1.276271, 1, 1, 1, 1, 1,
1.795545, 0.9934865, 0.1494715, 1, 1, 1, 1, 1,
1.808007, 0.9239209, 1.449748, 0, 0, 1, 1, 1,
1.820851, 0.6961577, 0.2150886, 1, 0, 0, 1, 1,
1.854992, 0.5077533, 2.664499, 1, 0, 0, 1, 1,
1.869054, 0.93821, 1.833068, 1, 0, 0, 1, 1,
1.883659, 0.9770803, 0.875344, 1, 0, 0, 1, 1,
1.888469, 0.6997963, 1.125841, 1, 0, 0, 1, 1,
1.902409, 0.9961962, 0.6531997, 0, 0, 0, 1, 1,
1.91302, 0.2562599, 2.343801, 0, 0, 0, 1, 1,
1.915805, 0.2060215, 1.548759, 0, 0, 0, 1, 1,
1.919292, -0.1456409, 1.685786, 0, 0, 0, 1, 1,
1.939778, -0.3136927, 2.405442, 0, 0, 0, 1, 1,
1.946782, -0.6400627, 2.875895, 0, 0, 0, 1, 1,
1.948122, -0.2873295, 1.341202, 0, 0, 0, 1, 1,
1.954683, 0.5622723, 0.8435985, 1, 1, 1, 1, 1,
1.965592, -1.012077, 2.61596, 1, 1, 1, 1, 1,
1.987853, -0.2119291, -0.2415317, 1, 1, 1, 1, 1,
1.991897, 1.147433, 2.093642, 1, 1, 1, 1, 1,
2.030808, 0.5337559, 3.312038, 1, 1, 1, 1, 1,
2.036366, -0.2798018, 1.702304, 1, 1, 1, 1, 1,
2.0464, -0.3054006, 4.571501, 1, 1, 1, 1, 1,
2.056251, 0.4970908, 1.800399, 1, 1, 1, 1, 1,
2.068805, -0.5679785, 1.424666, 1, 1, 1, 1, 1,
2.068887, -0.226208, 2.334075, 1, 1, 1, 1, 1,
2.080211, 1.052716, 2.231332, 1, 1, 1, 1, 1,
2.090045, -0.3808539, 1.363121, 1, 1, 1, 1, 1,
2.103052, -0.7279494, 2.222744, 1, 1, 1, 1, 1,
2.111409, 0.7703375, 2.126881, 1, 1, 1, 1, 1,
2.11691, 1.462221, -0.6297123, 1, 1, 1, 1, 1,
2.125428, -0.1141752, 1.193776, 0, 0, 1, 1, 1,
2.134022, -0.0787385, 1.568608, 1, 0, 0, 1, 1,
2.145188, 0.3472353, 1.900783, 1, 0, 0, 1, 1,
2.146175, 0.9765756, 1.071904, 1, 0, 0, 1, 1,
2.178586, -1.691398, 3.605176, 1, 0, 0, 1, 1,
2.244535, 1.182911, -0.7007716, 1, 0, 0, 1, 1,
2.247559, 0.3629312, 2.224307, 0, 0, 0, 1, 1,
2.249369, -0.5483436, 1.43581, 0, 0, 0, 1, 1,
2.269261, -0.7872239, 1.250183, 0, 0, 0, 1, 1,
2.284267, 0.9522023, -0.483117, 0, 0, 0, 1, 1,
2.379684, 0.1091936, 0.5157554, 0, 0, 0, 1, 1,
2.466419, 0.2111934, 2.061776, 0, 0, 0, 1, 1,
2.589693, 0.612966, 1.844577, 0, 0, 0, 1, 1,
2.592486, -0.009267423, 1.760667, 1, 1, 1, 1, 1,
2.623172, 0.2810774, 0.3661734, 1, 1, 1, 1, 1,
2.64382, 0.7758346, 1.9886, 1, 1, 1, 1, 1,
2.689105, 0.6841494, 1.293662, 1, 1, 1, 1, 1,
2.912958, 0.3275597, 2.028813, 1, 1, 1, 1, 1,
3.086264, -1.593062, 0.5118386, 1, 1, 1, 1, 1,
3.660358, -0.4545952, 1.704217, 1, 1, 1, 1, 1
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
var radius = 9.914848;
var distance = 34.82549;
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
mvMatrix.translate( -0.2727518, 0.2310085, -0.4906347 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.82549);
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
