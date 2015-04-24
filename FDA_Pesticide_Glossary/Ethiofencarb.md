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
-2.76615, 2.133804, -1.954041, 1, 0, 0, 1,
-2.735528, 0.2170574, -1.636046, 1, 0.007843138, 0, 1,
-2.733531, -0.2084541, -2.661981, 1, 0.01176471, 0, 1,
-2.713503, 1.396829, -0.8106259, 1, 0.01960784, 0, 1,
-2.506435, -1.075422, -0.4108993, 1, 0.02352941, 0, 1,
-2.455592, 2.526282, -0.9192285, 1, 0.03137255, 0, 1,
-2.18206, -1.620844, -2.162132, 1, 0.03529412, 0, 1,
-2.133255, 0.03668024, 0.4004654, 1, 0.04313726, 0, 1,
-2.113407, -0.7651466, -1.595759, 1, 0.04705882, 0, 1,
-2.097545, 0.534819, -1.414925, 1, 0.05490196, 0, 1,
-2.027423, 1.877387, -0.01054596, 1, 0.05882353, 0, 1,
-1.997477, 0.07361294, -0.1330309, 1, 0.06666667, 0, 1,
-1.98303, 2.216338, -0.4806636, 1, 0.07058824, 0, 1,
-1.978196, -1.66613, -2.295108, 1, 0.07843138, 0, 1,
-1.97188, -0.5779754, -0.3842572, 1, 0.08235294, 0, 1,
-1.970225, -0.2030117, -0.6537591, 1, 0.09019608, 0, 1,
-1.966472, -1.607225, -2.02171, 1, 0.09411765, 0, 1,
-1.938537, -0.1043824, -2.176809, 1, 0.1019608, 0, 1,
-1.912747, 0.02084343, -0.8532197, 1, 0.1098039, 0, 1,
-1.879768, 0.7780057, -1.443224, 1, 0.1137255, 0, 1,
-1.871822, -0.1657403, -0.8779457, 1, 0.1215686, 0, 1,
-1.859425, 1.621377, -2.026504, 1, 0.1254902, 0, 1,
-1.844682, 0.2881847, -1.397423, 1, 0.1333333, 0, 1,
-1.833502, -0.527116, -3.102949, 1, 0.1372549, 0, 1,
-1.789454, -1.919616, -2.748041, 1, 0.145098, 0, 1,
-1.78608, -0.08769716, -0.4004942, 1, 0.1490196, 0, 1,
-1.768451, 9.200876e-05, -0.9519442, 1, 0.1568628, 0, 1,
-1.759263, -0.9464909, -1.866415, 1, 0.1607843, 0, 1,
-1.757848, 0.08770079, -0.5479959, 1, 0.1686275, 0, 1,
-1.733267, -0.1494917, -2.509301, 1, 0.172549, 0, 1,
-1.730074, 0.05078125, -0.9132257, 1, 0.1803922, 0, 1,
-1.72794, 2.050511, -0.769205, 1, 0.1843137, 0, 1,
-1.725522, -0.6448703, -0.7330055, 1, 0.1921569, 0, 1,
-1.713005, 0.5720077, -2.730039, 1, 0.1960784, 0, 1,
-1.703411, -0.1004185, -1.675808, 1, 0.2039216, 0, 1,
-1.702552, -0.4047911, -1.487193, 1, 0.2117647, 0, 1,
-1.700149, -0.7605211, -1.364774, 1, 0.2156863, 0, 1,
-1.699148, 1.402111, -2.070126, 1, 0.2235294, 0, 1,
-1.69533, -0.2716663, -1.988076, 1, 0.227451, 0, 1,
-1.692708, 0.3586078, -1.354101, 1, 0.2352941, 0, 1,
-1.686953, 1.349738, -0.9528551, 1, 0.2392157, 0, 1,
-1.665269, 0.2471153, -3.096363, 1, 0.2470588, 0, 1,
-1.664533, -1.659185, -1.635015, 1, 0.2509804, 0, 1,
-1.634329, 0.1076776, -2.34143, 1, 0.2588235, 0, 1,
-1.627806, -0.1583304, -3.762812, 1, 0.2627451, 0, 1,
-1.591275, -0.1867733, -1.52026, 1, 0.2705882, 0, 1,
-1.586982, 0.9067205, -0.7948462, 1, 0.2745098, 0, 1,
-1.58585, 2.18988, -0.5238558, 1, 0.282353, 0, 1,
-1.583004, 0.9902671, -0.2689068, 1, 0.2862745, 0, 1,
-1.580806, -0.823728, -0.9120353, 1, 0.2941177, 0, 1,
-1.566734, 0.7395843, -1.489813, 1, 0.3019608, 0, 1,
-1.565926, 1.152431, -0.624007, 1, 0.3058824, 0, 1,
-1.558653, 2.135411, -1.210008, 1, 0.3137255, 0, 1,
-1.552119, -0.2395375, -2.011925, 1, 0.3176471, 0, 1,
-1.551188, -0.5598766, -2.164563, 1, 0.3254902, 0, 1,
-1.547867, -0.498465, -2.777978, 1, 0.3294118, 0, 1,
-1.536384, 1.386304, -0.01185747, 1, 0.3372549, 0, 1,
-1.533966, -0.6459745, -1.898647, 1, 0.3411765, 0, 1,
-1.532804, 0.6496872, -0.7065888, 1, 0.3490196, 0, 1,
-1.516116, 1.810642, -0.07374353, 1, 0.3529412, 0, 1,
-1.485439, -0.9157732, -1.276226, 1, 0.3607843, 0, 1,
-1.47279, -1.205036, -2.444893, 1, 0.3647059, 0, 1,
-1.466074, 0.4084728, -3.028955, 1, 0.372549, 0, 1,
-1.458557, -0.129682, -0.726606, 1, 0.3764706, 0, 1,
-1.445723, -0.7010438, -2.914994, 1, 0.3843137, 0, 1,
-1.439021, 1.489479, -1.544899, 1, 0.3882353, 0, 1,
-1.432845, -0.1805027, -0.4107749, 1, 0.3960784, 0, 1,
-1.427403, 0.2923035, -3.978053, 1, 0.4039216, 0, 1,
-1.413199, -0.5495922, 0.01830363, 1, 0.4078431, 0, 1,
-1.409624, 0.6785408, -1.782218, 1, 0.4156863, 0, 1,
-1.402895, 2.538397, -1.091974, 1, 0.4196078, 0, 1,
-1.402833, -1.125069, -3.176458, 1, 0.427451, 0, 1,
-1.37921, 0.5000368, -3.294708, 1, 0.4313726, 0, 1,
-1.362284, -0.8224897, -2.678644, 1, 0.4392157, 0, 1,
-1.356116, 0.7968987, -1.422128, 1, 0.4431373, 0, 1,
-1.343143, -0.5173807, -1.696757, 1, 0.4509804, 0, 1,
-1.337398, -0.5055915, -1.737938, 1, 0.454902, 0, 1,
-1.329537, -1.248366, -1.227466, 1, 0.4627451, 0, 1,
-1.326098, -0.181764, -0.7895248, 1, 0.4666667, 0, 1,
-1.315707, 0.8963703, -1.141905, 1, 0.4745098, 0, 1,
-1.31169, -1.356515, -2.529719, 1, 0.4784314, 0, 1,
-1.302603, -1.665422, -3.049592, 1, 0.4862745, 0, 1,
-1.301981, 1.604116, 0.3075307, 1, 0.4901961, 0, 1,
-1.260692, -1.358094, -1.288821, 1, 0.4980392, 0, 1,
-1.260384, 0.935205, -0.63282, 1, 0.5058824, 0, 1,
-1.256324, 1.173025, -2.125351, 1, 0.509804, 0, 1,
-1.249106, 0.8101851, -0.7829365, 1, 0.5176471, 0, 1,
-1.24784, 1.35068, -1.745603, 1, 0.5215687, 0, 1,
-1.247249, -0.5138238, -1.500299, 1, 0.5294118, 0, 1,
-1.239952, 0.6244105, -1.291882, 1, 0.5333334, 0, 1,
-1.238168, 0.1607932, -0.5265203, 1, 0.5411765, 0, 1,
-1.231873, 0.6476163, -1.305123, 1, 0.5450981, 0, 1,
-1.2218, 0.5636791, -1.003032, 1, 0.5529412, 0, 1,
-1.216376, -3.111032, -3.028835, 1, 0.5568628, 0, 1,
-1.215073, -1.209666, -1.31866, 1, 0.5647059, 0, 1,
-1.210481, -0.2345209, -2.439235, 1, 0.5686275, 0, 1,
-1.201088, 0.8438453, -0.7141823, 1, 0.5764706, 0, 1,
-1.198569, -0.06837455, -3.603593, 1, 0.5803922, 0, 1,
-1.18686, 0.08481096, -0.8352747, 1, 0.5882353, 0, 1,
-1.185794, -1.176663, -2.534713, 1, 0.5921569, 0, 1,
-1.185732, -0.5940641, -0.7550038, 1, 0.6, 0, 1,
-1.184423, -0.6475859, -3.527073, 1, 0.6078432, 0, 1,
-1.179606, -1.83281, -2.548471, 1, 0.6117647, 0, 1,
-1.171476, 1.440598, -1.026848, 1, 0.6196079, 0, 1,
-1.168557, -0.2294352, -1.662831, 1, 0.6235294, 0, 1,
-1.166817, 0.133824, -1.378157, 1, 0.6313726, 0, 1,
-1.163061, 0.9566759, -0.4056139, 1, 0.6352941, 0, 1,
-1.157982, 0.1721992, -0.7170996, 1, 0.6431373, 0, 1,
-1.153116, 0.2300176, -0.6808853, 1, 0.6470588, 0, 1,
-1.153064, -0.7968177, -1.618825, 1, 0.654902, 0, 1,
-1.151707, -0.3712901, -2.072609, 1, 0.6588235, 0, 1,
-1.149891, 0.9530628, -2.377332, 1, 0.6666667, 0, 1,
-1.148703, -0.4291095, -1.636, 1, 0.6705883, 0, 1,
-1.146821, 0.04645152, 0.6021295, 1, 0.6784314, 0, 1,
-1.137256, -0.1488006, -1.419711, 1, 0.682353, 0, 1,
-1.136855, -0.2504019, -0.8648283, 1, 0.6901961, 0, 1,
-1.132016, 0.8447526, -1.828561, 1, 0.6941177, 0, 1,
-1.123705, -1.099465, -2.827043, 1, 0.7019608, 0, 1,
-1.121545, -1.28777, -3.761599, 1, 0.7098039, 0, 1,
-1.117025, 0.39862, -1.374505, 1, 0.7137255, 0, 1,
-1.101105, 0.45906, -0.6149129, 1, 0.7215686, 0, 1,
-1.099067, -1.055908, -2.687871, 1, 0.7254902, 0, 1,
-1.090059, -0.03995328, -1.189649, 1, 0.7333333, 0, 1,
-1.083136, 0.3211064, -0.7906522, 1, 0.7372549, 0, 1,
-1.083072, 1.560998, -0.4730371, 1, 0.7450981, 0, 1,
-1.08146, 0.4212836, 0.05617227, 1, 0.7490196, 0, 1,
-1.077429, 0.6303681, -1.785042, 1, 0.7568628, 0, 1,
-1.074148, -2.262111, -3.140151, 1, 0.7607843, 0, 1,
-1.070861, 0.4219826, -1.828711, 1, 0.7686275, 0, 1,
-1.058991, 0.6884311, -0.3489476, 1, 0.772549, 0, 1,
-1.052541, 0.6188071, -0.8705561, 1, 0.7803922, 0, 1,
-1.047058, 0.4380646, -2.514561, 1, 0.7843137, 0, 1,
-1.040336, 1.08303, 0.3692055, 1, 0.7921569, 0, 1,
-1.037224, 1.235297, -0.05160422, 1, 0.7960784, 0, 1,
-1.033666, 0.05093137, -2.375117, 1, 0.8039216, 0, 1,
-1.024279, -1.508165, -1.761986, 1, 0.8117647, 0, 1,
-1.022678, 0.3731891, -0.8034716, 1, 0.8156863, 0, 1,
-1.016908, 0.040339, 0.08115043, 1, 0.8235294, 0, 1,
-1.016061, 0.08828343, -2.588372, 1, 0.827451, 0, 1,
-1.015414, 0.3283791, -0.6044723, 1, 0.8352941, 0, 1,
-1.014992, -1.029987, -1.690752, 1, 0.8392157, 0, 1,
-1.010186, -1.080063, -3.43609, 1, 0.8470588, 0, 1,
-1.0082, 1.227641, -0.4972589, 1, 0.8509804, 0, 1,
-1.006647, -1.202619, -3.789578, 1, 0.8588235, 0, 1,
-1.005407, -0.4772816, -1.958385, 1, 0.8627451, 0, 1,
-0.998517, 1.370647, -0.104983, 1, 0.8705882, 0, 1,
-0.9902768, -0.3880045, -1.265181, 1, 0.8745098, 0, 1,
-0.9895949, -1.498222, -1.688474, 1, 0.8823529, 0, 1,
-0.9855174, 0.2261723, -0.6348546, 1, 0.8862745, 0, 1,
-0.9847505, -3.153162, -0.885004, 1, 0.8941177, 0, 1,
-0.984589, -1.119552, -2.675129, 1, 0.8980392, 0, 1,
-0.9757234, 0.3096022, -1.14677, 1, 0.9058824, 0, 1,
-0.9753253, 0.7306337, -0.05282252, 1, 0.9137255, 0, 1,
-0.9749544, -0.318352, -1.656839, 1, 0.9176471, 0, 1,
-0.9684029, -0.4093277, -1.623015, 1, 0.9254902, 0, 1,
-0.9672033, -0.2755961, -3.685031, 1, 0.9294118, 0, 1,
-0.9644386, 0.0749216, -0.9456992, 1, 0.9372549, 0, 1,
-0.9612617, -0.3846058, -1.558731, 1, 0.9411765, 0, 1,
-0.9594951, 2.574152, -1.015633, 1, 0.9490196, 0, 1,
-0.9575599, -0.05990521, -1.380608, 1, 0.9529412, 0, 1,
-0.9538047, 0.6092406, -1.605328, 1, 0.9607843, 0, 1,
-0.9441443, 0.2138388, -2.224012, 1, 0.9647059, 0, 1,
-0.9384313, 0.1768034, -0.9002559, 1, 0.972549, 0, 1,
-0.9263223, -0.7207407, -3.686086, 1, 0.9764706, 0, 1,
-0.9186333, -0.469384, -1.420544, 1, 0.9843137, 0, 1,
-0.9119442, -0.7002016, -3.315216, 1, 0.9882353, 0, 1,
-0.9109826, 0.1819445, -1.489397, 1, 0.9960784, 0, 1,
-0.9028025, 0.5030453, -1.997075, 0.9960784, 1, 0, 1,
-0.9017646, 0.6066228, -1.945543, 0.9921569, 1, 0, 1,
-0.8997397, 0.9239868, -1.368537, 0.9843137, 1, 0, 1,
-0.8966031, -0.7104564, -2.996358, 0.9803922, 1, 0, 1,
-0.8958864, -1.096234, -1.90397, 0.972549, 1, 0, 1,
-0.8887451, -0.1419855, 0.003169454, 0.9686275, 1, 0, 1,
-0.8802847, -0.1486384, -1.247469, 0.9607843, 1, 0, 1,
-0.8788727, 0.3066079, -0.1450544, 0.9568627, 1, 0, 1,
-0.8784606, 1.010979, 0.2194515, 0.9490196, 1, 0, 1,
-0.8780086, -2.283124, -1.712974, 0.945098, 1, 0, 1,
-0.8772793, -0.8800892, -1.639129, 0.9372549, 1, 0, 1,
-0.8741525, 0.856917, 0.549327, 0.9333333, 1, 0, 1,
-0.873471, -1.308263, -2.550448, 0.9254902, 1, 0, 1,
-0.8715172, 0.0189455, -0.9904232, 0.9215686, 1, 0, 1,
-0.8663329, -0.5080838, -3.087388, 0.9137255, 1, 0, 1,
-0.8634415, 0.09780043, 0.237992, 0.9098039, 1, 0, 1,
-0.8613505, 0.630638, -1.843935, 0.9019608, 1, 0, 1,
-0.8606503, 0.2389875, -1.503567, 0.8941177, 1, 0, 1,
-0.8602945, 0.6153725, 0.03724233, 0.8901961, 1, 0, 1,
-0.8448179, 0.5411216, -0.7002612, 0.8823529, 1, 0, 1,
-0.8381085, -1.588733, -1.320721, 0.8784314, 1, 0, 1,
-0.8375945, 0.6035827, -0.7283145, 0.8705882, 1, 0, 1,
-0.8267611, 1.055351, -0.04855186, 0.8666667, 1, 0, 1,
-0.8264732, 1.076438, 0.2569126, 0.8588235, 1, 0, 1,
-0.8203833, -1.06087, -0.7417957, 0.854902, 1, 0, 1,
-0.8186004, 0.1274698, -1.824817, 0.8470588, 1, 0, 1,
-0.8172843, -1.125625, -3.962553, 0.8431373, 1, 0, 1,
-0.8135543, 1.197476, -0.7492313, 0.8352941, 1, 0, 1,
-0.813271, -0.3974114, -2.797989, 0.8313726, 1, 0, 1,
-0.8072821, -0.5979192, -4.025199, 0.8235294, 1, 0, 1,
-0.8069006, 0.8945848, -1.129384, 0.8196079, 1, 0, 1,
-0.8058621, 0.03094054, -1.568534, 0.8117647, 1, 0, 1,
-0.8049102, 0.4261998, 0.609869, 0.8078431, 1, 0, 1,
-0.8039433, -0.8438967, -2.817829, 0.8, 1, 0, 1,
-0.803615, 1.752407, -1.276062, 0.7921569, 1, 0, 1,
-0.8033087, 0.9734297, -1.189195, 0.7882353, 1, 0, 1,
-0.8018236, 1.511437, -0.3648711, 0.7803922, 1, 0, 1,
-0.7930766, 1.681676, -0.07869067, 0.7764706, 1, 0, 1,
-0.7794579, -0.1924578, -0.8192482, 0.7686275, 1, 0, 1,
-0.7758245, 0.4256972, -1.877017, 0.7647059, 1, 0, 1,
-0.7738325, 1.715674, -0.8969721, 0.7568628, 1, 0, 1,
-0.767475, -0.08865824, -0.4163588, 0.7529412, 1, 0, 1,
-0.7663944, -0.01939764, 0.3655483, 0.7450981, 1, 0, 1,
-0.7659675, 1.00427, -1.725217, 0.7411765, 1, 0, 1,
-0.7637083, -0.7115346, -2.681501, 0.7333333, 1, 0, 1,
-0.7614678, -0.7092832, -1.499978, 0.7294118, 1, 0, 1,
-0.754389, -0.2929242, -3.285662, 0.7215686, 1, 0, 1,
-0.7437335, -2.195634, -1.80693, 0.7176471, 1, 0, 1,
-0.7427273, 0.4986062, -0.1609693, 0.7098039, 1, 0, 1,
-0.7414472, 0.84929, -0.567471, 0.7058824, 1, 0, 1,
-0.7261115, 1.962444, -0.3683896, 0.6980392, 1, 0, 1,
-0.7223547, 0.003237845, -0.1304738, 0.6901961, 1, 0, 1,
-0.7191183, -1.016309, -2.772449, 0.6862745, 1, 0, 1,
-0.7135675, -0.1099741, 0.09887574, 0.6784314, 1, 0, 1,
-0.7128362, -1.253352, -3.631506, 0.6745098, 1, 0, 1,
-0.7068254, 0.3151692, -0.8142217, 0.6666667, 1, 0, 1,
-0.706574, 0.4589004, -2.306671, 0.6627451, 1, 0, 1,
-0.7057566, -0.03800682, -1.329204, 0.654902, 1, 0, 1,
-0.7028605, 1.050917, -0.2213732, 0.6509804, 1, 0, 1,
-0.7017453, 0.3306421, -3.180394, 0.6431373, 1, 0, 1,
-0.6951829, 0.7412227, 0.590418, 0.6392157, 1, 0, 1,
-0.6906182, 2.302726, -1.104721, 0.6313726, 1, 0, 1,
-0.688927, -0.8113855, -2.444698, 0.627451, 1, 0, 1,
-0.6873294, 0.6544926, -2.314242, 0.6196079, 1, 0, 1,
-0.6843889, -3.070551, -3.776009, 0.6156863, 1, 0, 1,
-0.6835465, -0.2839548, -1.830005, 0.6078432, 1, 0, 1,
-0.6815336, 0.6847699, 0.1597776, 0.6039216, 1, 0, 1,
-0.6815172, 0.09850517, -1.21695, 0.5960785, 1, 0, 1,
-0.6800457, -1.88947, -1.496061, 0.5882353, 1, 0, 1,
-0.6794605, 0.3866458, 0.2065276, 0.5843138, 1, 0, 1,
-0.6770639, -0.1597947, -1.505158, 0.5764706, 1, 0, 1,
-0.6748275, 0.3933043, -0.2084984, 0.572549, 1, 0, 1,
-0.6655304, -0.6276816, -2.279414, 0.5647059, 1, 0, 1,
-0.6653361, 0.5695316, -0.838482, 0.5607843, 1, 0, 1,
-0.6642236, 2.193556, -0.7634299, 0.5529412, 1, 0, 1,
-0.6642226, -0.4637296, -2.411789, 0.5490196, 1, 0, 1,
-0.6632799, -0.2397517, -0.9874999, 0.5411765, 1, 0, 1,
-0.6441757, -0.1775817, -2.287227, 0.5372549, 1, 0, 1,
-0.6419256, -1.11266, -0.9472242, 0.5294118, 1, 0, 1,
-0.6411474, 0.1606738, -0.4866279, 0.5254902, 1, 0, 1,
-0.6408572, -0.6605982, -0.7694147, 0.5176471, 1, 0, 1,
-0.6407236, 0.6065335, -2.940242, 0.5137255, 1, 0, 1,
-0.636719, 0.3739389, -0.2348309, 0.5058824, 1, 0, 1,
-0.634691, 1.210888, 0.08126196, 0.5019608, 1, 0, 1,
-0.6337795, -0.2274766, -1.237732, 0.4941176, 1, 0, 1,
-0.6294512, 0.9566299, 0.03787978, 0.4862745, 1, 0, 1,
-0.625752, -0.9920031, 0.2689584, 0.4823529, 1, 0, 1,
-0.6200908, -0.8132539, -1.663177, 0.4745098, 1, 0, 1,
-0.619117, -0.4738346, -1.649439, 0.4705882, 1, 0, 1,
-0.6166103, -0.4814605, -2.737637, 0.4627451, 1, 0, 1,
-0.6154776, 0.2837063, -1.563213, 0.4588235, 1, 0, 1,
-0.6139904, -0.2223515, -0.1847136, 0.4509804, 1, 0, 1,
-0.609966, -0.07918166, -2.666189, 0.4470588, 1, 0, 1,
-0.6086116, 1.305878, -2.365675, 0.4392157, 1, 0, 1,
-0.6004976, 0.7812371, -0.4336047, 0.4352941, 1, 0, 1,
-0.5990458, -0.05560853, -3.812948, 0.427451, 1, 0, 1,
-0.5965395, -0.8517267, -1.592664, 0.4235294, 1, 0, 1,
-0.5935126, 0.7327009, -1.688368, 0.4156863, 1, 0, 1,
-0.5881231, 0.02949676, -1.574192, 0.4117647, 1, 0, 1,
-0.5826629, 0.1972215, -1.527899, 0.4039216, 1, 0, 1,
-0.5791883, 0.998775, -0.3216839, 0.3960784, 1, 0, 1,
-0.5765134, -0.5058554, -1.501964, 0.3921569, 1, 0, 1,
-0.5759082, -0.709067, -3.041909, 0.3843137, 1, 0, 1,
-0.5735593, 0.4123277, -1.532953, 0.3803922, 1, 0, 1,
-0.5699084, 0.2049282, -1.002264, 0.372549, 1, 0, 1,
-0.5696303, 0.3097897, -1.396385, 0.3686275, 1, 0, 1,
-0.5652098, 0.8844003, -1.095657, 0.3607843, 1, 0, 1,
-0.5637631, 1.614005, 0.1407908, 0.3568628, 1, 0, 1,
-0.5625708, -0.2578159, -3.261951, 0.3490196, 1, 0, 1,
-0.5623165, 2.275296, 2.060264, 0.345098, 1, 0, 1,
-0.5581261, -2.931952, -3.099795, 0.3372549, 1, 0, 1,
-0.554786, -1.089403, -1.190755, 0.3333333, 1, 0, 1,
-0.5542154, 1.092529, 0.9941799, 0.3254902, 1, 0, 1,
-0.5482048, 0.4189884, -0.6311293, 0.3215686, 1, 0, 1,
-0.5471909, 0.2291817, -1.672138, 0.3137255, 1, 0, 1,
-0.5468572, 0.08289837, -0.9207982, 0.3098039, 1, 0, 1,
-0.5465479, 0.3519275, -0.8827796, 0.3019608, 1, 0, 1,
-0.5409437, 1.21349, -1.580459, 0.2941177, 1, 0, 1,
-0.5368329, -0.4821148, -2.486302, 0.2901961, 1, 0, 1,
-0.5340052, -0.2574291, -1.180178, 0.282353, 1, 0, 1,
-0.5298949, 0.2263634, -0.6413106, 0.2784314, 1, 0, 1,
-0.5272399, 0.4519321, -2.565461, 0.2705882, 1, 0, 1,
-0.5244088, 0.4146065, -0.4858598, 0.2666667, 1, 0, 1,
-0.5227791, -1.153244, 0.04944807, 0.2588235, 1, 0, 1,
-0.5220758, -0.3152903, -0.5585626, 0.254902, 1, 0, 1,
-0.5185083, -1.22402, -2.523142, 0.2470588, 1, 0, 1,
-0.5162939, 1.003809, 1.19374, 0.2431373, 1, 0, 1,
-0.5156733, -0.713319, -1.865383, 0.2352941, 1, 0, 1,
-0.514344, -0.608472, -2.219657, 0.2313726, 1, 0, 1,
-0.5130702, 0.1164071, -1.670371, 0.2235294, 1, 0, 1,
-0.4996547, 0.6433835, -0.5546387, 0.2196078, 1, 0, 1,
-0.4975239, -0.6502957, -2.428945, 0.2117647, 1, 0, 1,
-0.4971044, 0.566354, -1.136015, 0.2078431, 1, 0, 1,
-0.4952761, 1.118405, 1.005495, 0.2, 1, 0, 1,
-0.4941826, 1.04117, 0.03324265, 0.1921569, 1, 0, 1,
-0.4898629, -0.2097038, -1.741377, 0.1882353, 1, 0, 1,
-0.4879225, -0.4364167, -2.925434, 0.1803922, 1, 0, 1,
-0.4873562, 0.1762695, -3.375324, 0.1764706, 1, 0, 1,
-0.4865122, -0.7372698, -4.430646, 0.1686275, 1, 0, 1,
-0.4855272, -0.05546531, -1.230098, 0.1647059, 1, 0, 1,
-0.4841669, 0.05849911, -2.83026, 0.1568628, 1, 0, 1,
-0.4815578, -0.9010385, -2.20526, 0.1529412, 1, 0, 1,
-0.4814067, 0.9499717, -0.7804043, 0.145098, 1, 0, 1,
-0.4801942, -0.06845965, -2.079402, 0.1411765, 1, 0, 1,
-0.4797177, -1.877045, -2.344141, 0.1333333, 1, 0, 1,
-0.4788179, 0.419325, -0.2197656, 0.1294118, 1, 0, 1,
-0.4783521, -0.4469301, -1.963918, 0.1215686, 1, 0, 1,
-0.4781401, 1.56889, -0.06950907, 0.1176471, 1, 0, 1,
-0.4776081, 0.2556566, -3.084475, 0.1098039, 1, 0, 1,
-0.4751303, 0.1564884, -2.843445, 0.1058824, 1, 0, 1,
-0.4727644, -1.228534, -3.240156, 0.09803922, 1, 0, 1,
-0.467287, -0.8756775, -2.453037, 0.09019608, 1, 0, 1,
-0.4669491, 1.925213, 1.343099, 0.08627451, 1, 0, 1,
-0.4653944, -1.062815, -2.894651, 0.07843138, 1, 0, 1,
-0.4642536, 0.8116946, -0.8471699, 0.07450981, 1, 0, 1,
-0.4636568, -0.2250415, -1.1071, 0.06666667, 1, 0, 1,
-0.4571991, 1.211005, -1.313264, 0.0627451, 1, 0, 1,
-0.4566627, 1.052747, -0.6124619, 0.05490196, 1, 0, 1,
-0.4540629, -0.3834855, -3.025293, 0.05098039, 1, 0, 1,
-0.4533367, 0.9690204, -1.140221, 0.04313726, 1, 0, 1,
-0.4527147, -0.2452413, -4.081086, 0.03921569, 1, 0, 1,
-0.4471419, 1.016497, -0.3864706, 0.03137255, 1, 0, 1,
-0.447052, 0.1855603, 0.2063687, 0.02745098, 1, 0, 1,
-0.4470098, 0.2828387, -0.9439295, 0.01960784, 1, 0, 1,
-0.4466748, -0.2613231, -2.580517, 0.01568628, 1, 0, 1,
-0.444627, -0.7778766, -1.643927, 0.007843138, 1, 0, 1,
-0.4436497, 0.2883619, 0.6426489, 0.003921569, 1, 0, 1,
-0.4435044, 0.7444781, 0.2052039, 0, 1, 0.003921569, 1,
-0.4423977, -0.6991218, -2.954611, 0, 1, 0.01176471, 1,
-0.4423116, 0.2943978, -2.715114, 0, 1, 0.01568628, 1,
-0.435719, -0.7130247, -2.368321, 0, 1, 0.02352941, 1,
-0.4355643, 1.465294, -1.62482, 0, 1, 0.02745098, 1,
-0.4311176, -1.68276, -3.204766, 0, 1, 0.03529412, 1,
-0.4293109, 0.8574153, -1.301991, 0, 1, 0.03921569, 1,
-0.4281885, 1.341481, -0.2868064, 0, 1, 0.04705882, 1,
-0.426992, -0.9958447, -4.328277, 0, 1, 0.05098039, 1,
-0.4231209, 0.8714914, -0.6378468, 0, 1, 0.05882353, 1,
-0.4204628, 0.7957878, 0.1752043, 0, 1, 0.0627451, 1,
-0.4200523, -1.289523, -4.264355, 0, 1, 0.07058824, 1,
-0.4153314, 0.09753599, -1.105916, 0, 1, 0.07450981, 1,
-0.4144734, -0.3844877, -3.142887, 0, 1, 0.08235294, 1,
-0.4140255, -0.3588269, -3.166126, 0, 1, 0.08627451, 1,
-0.4101716, 0.05980357, -0.7434655, 0, 1, 0.09411765, 1,
-0.407956, 0.7231373, -2.211242, 0, 1, 0.1019608, 1,
-0.4078833, 1.336759, 0.1103141, 0, 1, 0.1058824, 1,
-0.4053598, -1.034779, -4.092209, 0, 1, 0.1137255, 1,
-0.4008896, -3.540505, -2.378269, 0, 1, 0.1176471, 1,
-0.394376, 0.3565923, 0.4946888, 0, 1, 0.1254902, 1,
-0.3841922, -0.8715454, -0.9355117, 0, 1, 0.1294118, 1,
-0.3807307, 0.511823, -0.8876458, 0, 1, 0.1372549, 1,
-0.3798186, -0.009352794, -1.106312, 0, 1, 0.1411765, 1,
-0.3783473, 2.801833, -0.4377453, 0, 1, 0.1490196, 1,
-0.3766884, 0.1878476, -2.450701, 0, 1, 0.1529412, 1,
-0.3757218, -1.120674, -1.46769, 0, 1, 0.1607843, 1,
-0.3719245, 0.2035922, -2.021011, 0, 1, 0.1647059, 1,
-0.3683138, 1.307094, 1.705393, 0, 1, 0.172549, 1,
-0.361602, 0.1092097, -2.376689, 0, 1, 0.1764706, 1,
-0.3605952, 0.1321415, -2.094304, 0, 1, 0.1843137, 1,
-0.3561867, -0.7496579, -0.367004, 0, 1, 0.1882353, 1,
-0.3559661, 1.042228, 0.1674865, 0, 1, 0.1960784, 1,
-0.3551163, 0.9144114, 0.8644491, 0, 1, 0.2039216, 1,
-0.3488675, -0.8479189, -2.251885, 0, 1, 0.2078431, 1,
-0.3476634, 0.1962424, -1.20592, 0, 1, 0.2156863, 1,
-0.3467068, -0.9045112, -5.112483, 0, 1, 0.2196078, 1,
-0.3441941, 2.108318, -0.5103916, 0, 1, 0.227451, 1,
-0.3404838, 0.4579706, 0.2197493, 0, 1, 0.2313726, 1,
-0.3404828, 0.5274606, 1.33164, 0, 1, 0.2392157, 1,
-0.3362881, -0.4558903, -3.081357, 0, 1, 0.2431373, 1,
-0.3355325, -1.086612, -3.084927, 0, 1, 0.2509804, 1,
-0.3349152, -0.8825386, -3.978472, 0, 1, 0.254902, 1,
-0.3331354, -1.29194, -4.023461, 0, 1, 0.2627451, 1,
-0.3264519, -1.594299, -4.440817, 0, 1, 0.2666667, 1,
-0.3258415, 1.191402, 0.1791027, 0, 1, 0.2745098, 1,
-0.324509, -0.6296688, -2.175153, 0, 1, 0.2784314, 1,
-0.3206721, 0.3926571, -0.6528075, 0, 1, 0.2862745, 1,
-0.3206578, -0.3736281, -2.604689, 0, 1, 0.2901961, 1,
-0.3200704, 0.4246164, -0.4166762, 0, 1, 0.2980392, 1,
-0.3174038, -0.8227877, -1.299875, 0, 1, 0.3058824, 1,
-0.3081201, 1.0318, -1.350165, 0, 1, 0.3098039, 1,
-0.3047903, -1.684108, -3.708596, 0, 1, 0.3176471, 1,
-0.2991162, 1.071651, 0.2507476, 0, 1, 0.3215686, 1,
-0.2933153, 1.025823, 0.7381419, 0, 1, 0.3294118, 1,
-0.2929506, -0.420949, -2.354626, 0, 1, 0.3333333, 1,
-0.2840199, 0.1566425, -1.834714, 0, 1, 0.3411765, 1,
-0.2805365, -0.686597, -1.677591, 0, 1, 0.345098, 1,
-0.2799499, -0.05271979, -0.6809835, 0, 1, 0.3529412, 1,
-0.2798969, 0.963919, -0.6776935, 0, 1, 0.3568628, 1,
-0.2784073, 0.8325246, -0.5706893, 0, 1, 0.3647059, 1,
-0.2765042, 2.19411, 0.02552195, 0, 1, 0.3686275, 1,
-0.2741534, 0.3392279, -0.01891959, 0, 1, 0.3764706, 1,
-0.2695985, 0.6184903, 0.252827, 0, 1, 0.3803922, 1,
-0.2686658, 0.2499845, -0.5962948, 0, 1, 0.3882353, 1,
-0.2661416, -0.3607701, -3.114688, 0, 1, 0.3921569, 1,
-0.2652192, 0.8570271, -0.9288077, 0, 1, 0.4, 1,
-0.2629673, -0.5421388, -1.938402, 0, 1, 0.4078431, 1,
-0.2619098, 0.9576448, -0.9252722, 0, 1, 0.4117647, 1,
-0.2504436, -0.482594, -2.455115, 0, 1, 0.4196078, 1,
-0.2420372, 0.8783974, -0.1348405, 0, 1, 0.4235294, 1,
-0.2301786, -1.296316, -4.08812, 0, 1, 0.4313726, 1,
-0.2243882, -1.228855, -4.272732, 0, 1, 0.4352941, 1,
-0.2123712, 0.7311942, -0.2972257, 0, 1, 0.4431373, 1,
-0.2081822, -0.4980322, -2.233419, 0, 1, 0.4470588, 1,
-0.2076651, -1.513762, -3.420759, 0, 1, 0.454902, 1,
-0.2043075, -0.6005651, -2.490722, 0, 1, 0.4588235, 1,
-0.1976653, 0.2547442, -0.7339655, 0, 1, 0.4666667, 1,
-0.1975611, 0.4239909, 0.4262489, 0, 1, 0.4705882, 1,
-0.1964907, -1.487369, -3.799554, 0, 1, 0.4784314, 1,
-0.1960675, 0.45449, 0.360881, 0, 1, 0.4823529, 1,
-0.1915118, -0.499561, -2.338356, 0, 1, 0.4901961, 1,
-0.1893568, 0.3263018, 0.8917363, 0, 1, 0.4941176, 1,
-0.1890366, -0.7367944, -1.776953, 0, 1, 0.5019608, 1,
-0.1803827, 1.542898, -0.6555016, 0, 1, 0.509804, 1,
-0.1780797, 0.6581327, 0.5262804, 0, 1, 0.5137255, 1,
-0.1688462, 0.185842, -0.1104002, 0, 1, 0.5215687, 1,
-0.1681811, -1.546986, -1.409194, 0, 1, 0.5254902, 1,
-0.1649402, 0.2043527, -1.740313, 0, 1, 0.5333334, 1,
-0.1645315, -0.2364678, -2.216478, 0, 1, 0.5372549, 1,
-0.1638075, -1.225409, -2.892653, 0, 1, 0.5450981, 1,
-0.1637106, -0.7227333, -2.866049, 0, 1, 0.5490196, 1,
-0.156604, -0.07256922, -0.7763072, 0, 1, 0.5568628, 1,
-0.153938, -1.835724, -3.41033, 0, 1, 0.5607843, 1,
-0.1495832, 0.027033, -0.7114163, 0, 1, 0.5686275, 1,
-0.1488666, -1.146311, -2.022613, 0, 1, 0.572549, 1,
-0.1474449, -0.1405953, -3.282108, 0, 1, 0.5803922, 1,
-0.1460908, -0.05014077, -2.052791, 0, 1, 0.5843138, 1,
-0.1412789, -0.677101, -2.077941, 0, 1, 0.5921569, 1,
-0.1407721, -0.2328005, -3.562772, 0, 1, 0.5960785, 1,
-0.139866, -0.6703914, -2.096328, 0, 1, 0.6039216, 1,
-0.1397439, 0.6894354, -0.8031325, 0, 1, 0.6117647, 1,
-0.1389127, 0.3899759, -0.8405269, 0, 1, 0.6156863, 1,
-0.1350353, -0.7368343, -4.096091, 0, 1, 0.6235294, 1,
-0.1342887, -0.3455554, -2.676256, 0, 1, 0.627451, 1,
-0.1329492, -0.535531, -1.393843, 0, 1, 0.6352941, 1,
-0.1314439, 0.611493, -1.363533, 0, 1, 0.6392157, 1,
-0.130732, 0.2022864, -2.178965, 0, 1, 0.6470588, 1,
-0.1276756, -0.3414223, -1.087181, 0, 1, 0.6509804, 1,
-0.1247422, 0.4611409, -0.7020262, 0, 1, 0.6588235, 1,
-0.1191708, -1.198141, -3.904166, 0, 1, 0.6627451, 1,
-0.1120048, -1.389093, -2.288458, 0, 1, 0.6705883, 1,
-0.1098949, 2.105381, -1.186783, 0, 1, 0.6745098, 1,
-0.1082505, -0.02291652, -0.5016223, 0, 1, 0.682353, 1,
-0.1073065, -0.2094433, -2.939951, 0, 1, 0.6862745, 1,
-0.1063227, 0.428465, -1.75861, 0, 1, 0.6941177, 1,
-0.10235, -2.487473, -4.668371, 0, 1, 0.7019608, 1,
-0.1007201, 0.5992698, -2.203872, 0, 1, 0.7058824, 1,
-0.09886902, -0.4213084, -3.136259, 0, 1, 0.7137255, 1,
-0.09755073, -1.945241, -4.471535, 0, 1, 0.7176471, 1,
-0.09641806, 0.0605768, -1.5534, 0, 1, 0.7254902, 1,
-0.09314901, -0.5336466, -4.88352, 0, 1, 0.7294118, 1,
-0.09219886, -1.301845, -2.024392, 0, 1, 0.7372549, 1,
-0.0915319, -0.4605764, -2.033095, 0, 1, 0.7411765, 1,
-0.09097388, -0.9906183, -3.758792, 0, 1, 0.7490196, 1,
-0.09086921, -0.7436695, -3.602557, 0, 1, 0.7529412, 1,
-0.09025722, 0.6932692, 0.1843235, 0, 1, 0.7607843, 1,
-0.08593086, -0.7472479, -3.174051, 0, 1, 0.7647059, 1,
-0.08130087, 1.220523, 0.2887999, 0, 1, 0.772549, 1,
-0.07218871, -2.312992, -1.982582, 0, 1, 0.7764706, 1,
-0.07183126, -1.282563, -2.426936, 0, 1, 0.7843137, 1,
-0.07041118, 2.483577, 0.03636606, 0, 1, 0.7882353, 1,
-0.07039402, -0.4821993, -3.337192, 0, 1, 0.7960784, 1,
-0.06897243, -0.1205277, -4.137897, 0, 1, 0.8039216, 1,
-0.06705558, -0.3220626, -4.519186, 0, 1, 0.8078431, 1,
-0.06478704, 0.8351864, -0.4461806, 0, 1, 0.8156863, 1,
-0.06435408, 1.227897, -1.781675, 0, 1, 0.8196079, 1,
-0.0535518, 0.6545162, -0.221939, 0, 1, 0.827451, 1,
-0.05125979, -0.452371, -3.855059, 0, 1, 0.8313726, 1,
-0.04779071, 1.468268, -1.159815, 0, 1, 0.8392157, 1,
-0.0476111, 0.09512868, 0.1350712, 0, 1, 0.8431373, 1,
-0.04689926, 0.1024575, 1.361542, 0, 1, 0.8509804, 1,
-0.04518319, 0.6297337, -0.5616823, 0, 1, 0.854902, 1,
-0.04475649, -0.2667493, -2.263533, 0, 1, 0.8627451, 1,
-0.04283696, -0.7588001, -1.669153, 0, 1, 0.8666667, 1,
-0.0398562, -0.204565, -4.235532, 0, 1, 0.8745098, 1,
-0.03908338, 1.420258, 2.39235, 0, 1, 0.8784314, 1,
-0.03757143, -0.8727082, -4.528873, 0, 1, 0.8862745, 1,
-0.02777969, -0.05201728, -1.82367, 0, 1, 0.8901961, 1,
-0.02715161, -0.7133415, -2.990593, 0, 1, 0.8980392, 1,
-0.0230087, -1.736695, -1.921401, 0, 1, 0.9058824, 1,
-0.02111587, 2.705099, 1.282539, 0, 1, 0.9098039, 1,
-0.01915868, 1.495483, 0.1872862, 0, 1, 0.9176471, 1,
-0.01632439, -0.9079562, -2.269339, 0, 1, 0.9215686, 1,
-0.01380902, -0.4186862, -3.026544, 0, 1, 0.9294118, 1,
-0.01355287, 1.46042, -2.184484, 0, 1, 0.9333333, 1,
-0.01306872, 0.1504742, -0.06278428, 0, 1, 0.9411765, 1,
-0.01162829, -0.3962522, -2.839029, 0, 1, 0.945098, 1,
-0.01137425, 0.1519272, -1.009745, 0, 1, 0.9529412, 1,
-0.0108164, -0.3322436, -2.44399, 0, 1, 0.9568627, 1,
-0.008363262, -0.3872445, -2.501714, 0, 1, 0.9647059, 1,
-0.008014742, 0.9189002, 0.5238447, 0, 1, 0.9686275, 1,
-0.0053506, -0.7834431, -2.900353, 0, 1, 0.9764706, 1,
-0.003844673, -1.158276, -4.233938, 0, 1, 0.9803922, 1,
-0.003821797, 1.673318, 0.8559058, 0, 1, 0.9882353, 1,
-0.0007062049, -0.2139513, -2.040601, 0, 1, 0.9921569, 1,
0.0007135629, -0.8861578, 5.197159, 0, 1, 1, 1,
0.002285238, -1.381193, 3.86861, 0, 0.9921569, 1, 1,
0.005056376, -0.7126075, 4.17708, 0, 0.9882353, 1, 1,
0.006660463, 1.062914, -1.290613, 0, 0.9803922, 1, 1,
0.006920007, 0.9999646, 0.06774952, 0, 0.9764706, 1, 1,
0.009396045, 0.6404762, 2.216266, 0, 0.9686275, 1, 1,
0.0109846, 1.061171, -0.5580472, 0, 0.9647059, 1, 1,
0.01441004, -0.3769288, 4.146766, 0, 0.9568627, 1, 1,
0.01783456, -0.2076667, 2.674842, 0, 0.9529412, 1, 1,
0.02128852, -1.105018, 3.564691, 0, 0.945098, 1, 1,
0.02306275, -0.8918853, 5.211598, 0, 0.9411765, 1, 1,
0.02478707, 0.3499781, -0.4598714, 0, 0.9333333, 1, 1,
0.02548852, -0.2584226, 2.613894, 0, 0.9294118, 1, 1,
0.02581271, 1.544114, 0.3658533, 0, 0.9215686, 1, 1,
0.02756698, -1.423505, 3.121636, 0, 0.9176471, 1, 1,
0.0312451, 0.5203793, -0.8567235, 0, 0.9098039, 1, 1,
0.0315242, -0.2528964, 3.837202, 0, 0.9058824, 1, 1,
0.03394907, -0.5343925, 4.053551, 0, 0.8980392, 1, 1,
0.03838564, -0.422785, 2.67478, 0, 0.8901961, 1, 1,
0.04466596, -0.4242717, 1.685439, 0, 0.8862745, 1, 1,
0.05037158, 0.147195, 1.144315, 0, 0.8784314, 1, 1,
0.0548679, -0.1787992, 1.043586, 0, 0.8745098, 1, 1,
0.06573868, -1.643001, 2.13183, 0, 0.8666667, 1, 1,
0.06580326, -0.01554964, 1.695353, 0, 0.8627451, 1, 1,
0.06731601, -0.6665485, 3.403008, 0, 0.854902, 1, 1,
0.06739743, -1.750708, 3.603088, 0, 0.8509804, 1, 1,
0.07163009, 0.08253041, 1.159732, 0, 0.8431373, 1, 1,
0.07568139, -0.6433107, 3.285073, 0, 0.8392157, 1, 1,
0.0793871, 0.6371986, -0.422527, 0, 0.8313726, 1, 1,
0.08116834, -0.5166414, 4.557305, 0, 0.827451, 1, 1,
0.08186563, -1.25429, 2.083555, 0, 0.8196079, 1, 1,
0.0838196, 1.146649, 0.4068594, 0, 0.8156863, 1, 1,
0.08441855, -0.3529845, 3.035443, 0, 0.8078431, 1, 1,
0.08570296, -0.4562188, 1.746272, 0, 0.8039216, 1, 1,
0.08737341, -0.5934574, 2.725034, 0, 0.7960784, 1, 1,
0.08925044, 1.088501, -0.2142314, 0, 0.7882353, 1, 1,
0.09340818, 0.7870397, 0.3728364, 0, 0.7843137, 1, 1,
0.09550783, -0.945087, 2.417659, 0, 0.7764706, 1, 1,
0.1006033, 0.01843461, 0.189641, 0, 0.772549, 1, 1,
0.1013108, -0.3696212, 3.045474, 0, 0.7647059, 1, 1,
0.1019079, -2.002307, 2.382436, 0, 0.7607843, 1, 1,
0.1035486, 1.357081, 1.704026, 0, 0.7529412, 1, 1,
0.1043582, 0.2578595, 0.09192242, 0, 0.7490196, 1, 1,
0.1078399, -0.1319301, 0.3061695, 0, 0.7411765, 1, 1,
0.1086955, 0.532615, 0.3911798, 0, 0.7372549, 1, 1,
0.1103056, 0.8230772, 0.8359341, 0, 0.7294118, 1, 1,
0.1218536, -0.08495656, 1.608816, 0, 0.7254902, 1, 1,
0.124187, -0.3474851, 1.977748, 0, 0.7176471, 1, 1,
0.1331248, 1.556272, 0.5478132, 0, 0.7137255, 1, 1,
0.1344269, 0.5148631, -0.02584441, 0, 0.7058824, 1, 1,
0.1348729, -0.7808831, 2.550483, 0, 0.6980392, 1, 1,
0.1361077, 0.2547499, -0.4747463, 0, 0.6941177, 1, 1,
0.1361562, 0.7357699, 0.6407273, 0, 0.6862745, 1, 1,
0.1397939, 0.02112428, 0.5896444, 0, 0.682353, 1, 1,
0.1403023, 0.9705466, 1.476033, 0, 0.6745098, 1, 1,
0.1425886, 0.07337143, 2.976753, 0, 0.6705883, 1, 1,
0.1434513, -0.6163983, 3.494314, 0, 0.6627451, 1, 1,
0.1465725, 0.315578, 0.1754671, 0, 0.6588235, 1, 1,
0.1483206, 2.581033, 2.683795, 0, 0.6509804, 1, 1,
0.1540142, 0.1611049, 1.234752, 0, 0.6470588, 1, 1,
0.1544848, -0.8434045, 1.751407, 0, 0.6392157, 1, 1,
0.1547514, 0.6636493, 0.9894713, 0, 0.6352941, 1, 1,
0.1592551, -0.3804902, 1.795718, 0, 0.627451, 1, 1,
0.1622884, -1.229371, 3.248144, 0, 0.6235294, 1, 1,
0.1629747, -1.319168, 3.925643, 0, 0.6156863, 1, 1,
0.164298, 0.411866, -1.502328, 0, 0.6117647, 1, 1,
0.165381, 2.750206, 1.369772, 0, 0.6039216, 1, 1,
0.1703692, 0.5051218, -1.005759, 0, 0.5960785, 1, 1,
0.1706269, -0.8359006, 2.272419, 0, 0.5921569, 1, 1,
0.1725403, -0.5823987, 2.722104, 0, 0.5843138, 1, 1,
0.1736473, 0.4166264, 0.5295326, 0, 0.5803922, 1, 1,
0.1737498, -0.4093396, 1.543559, 0, 0.572549, 1, 1,
0.1753519, -0.2357678, 3.012196, 0, 0.5686275, 1, 1,
0.176955, 0.1648813, 1.106739, 0, 0.5607843, 1, 1,
0.17722, 0.4932653, -0.0981828, 0, 0.5568628, 1, 1,
0.1845835, -0.3502427, 2.339876, 0, 0.5490196, 1, 1,
0.1849889, -0.7782285, 2.180114, 0, 0.5450981, 1, 1,
0.1864471, -2.151904, 2.968868, 0, 0.5372549, 1, 1,
0.1920821, 0.9915881, 0.7949142, 0, 0.5333334, 1, 1,
0.1950139, -0.8460795, 2.002005, 0, 0.5254902, 1, 1,
0.1976016, 1.068936, 0.8015687, 0, 0.5215687, 1, 1,
0.1989036, 0.09919687, 0.755889, 0, 0.5137255, 1, 1,
0.198928, -0.0003263754, 2.609602, 0, 0.509804, 1, 1,
0.1999564, 1.77828, -0.4122091, 0, 0.5019608, 1, 1,
0.2006787, -0.7365109, 1.017409, 0, 0.4941176, 1, 1,
0.2024214, -1.908994, 4.187918, 0, 0.4901961, 1, 1,
0.2077675, -0.6262233, 2.556617, 0, 0.4823529, 1, 1,
0.2167522, -0.2408325, -0.1138612, 0, 0.4784314, 1, 1,
0.2190826, 0.6978961, -0.6707212, 0, 0.4705882, 1, 1,
0.2195333, 0.4325771, 1.891191, 0, 0.4666667, 1, 1,
0.2197462, -1.342595, 4.333744, 0, 0.4588235, 1, 1,
0.2220948, -0.2811296, 1.21826, 0, 0.454902, 1, 1,
0.2225678, 0.1529271, 1.266508, 0, 0.4470588, 1, 1,
0.2289445, -0.4282778, 0.4156673, 0, 0.4431373, 1, 1,
0.2290476, -1.237573, 4.798801, 0, 0.4352941, 1, 1,
0.2318126, 0.5431837, 1.568291, 0, 0.4313726, 1, 1,
0.2336434, -0.6526666, 3.334817, 0, 0.4235294, 1, 1,
0.2349564, 0.7141117, 0.9904368, 0, 0.4196078, 1, 1,
0.2362789, -0.5862488, 3.138198, 0, 0.4117647, 1, 1,
0.2364383, -0.05499234, -0.6005787, 0, 0.4078431, 1, 1,
0.2407305, 1.191267, -1.254613, 0, 0.4, 1, 1,
0.2407694, -0.8154862, 3.856484, 0, 0.3921569, 1, 1,
0.243276, -0.1125347, 3.357604, 0, 0.3882353, 1, 1,
0.2512066, 1.282054, 0.1116119, 0, 0.3803922, 1, 1,
0.251552, -0.4597829, 2.633892, 0, 0.3764706, 1, 1,
0.2516477, -0.3926683, 3.028536, 0, 0.3686275, 1, 1,
0.2525762, 0.03609807, 0.5433885, 0, 0.3647059, 1, 1,
0.2535132, -0.08282471, 1.485057, 0, 0.3568628, 1, 1,
0.2536228, -0.6099061, 1.800689, 0, 0.3529412, 1, 1,
0.2581589, -0.1753059, 1.946547, 0, 0.345098, 1, 1,
0.2612014, -1.28181, 1.659361, 0, 0.3411765, 1, 1,
0.2628594, -1.524322, 3.643891, 0, 0.3333333, 1, 1,
0.2661079, -1.780372, 4.275185, 0, 0.3294118, 1, 1,
0.2744044, -1.183658, 2.488997, 0, 0.3215686, 1, 1,
0.2757058, 0.6186278, -0.186118, 0, 0.3176471, 1, 1,
0.2760572, 1.520792, 0.2384402, 0, 0.3098039, 1, 1,
0.2763023, -0.6863357, 3.840331, 0, 0.3058824, 1, 1,
0.2883132, 0.2642874, 1.852478, 0, 0.2980392, 1, 1,
0.290137, 0.7047801, -1.114411, 0, 0.2901961, 1, 1,
0.293477, -0.5550747, 3.565293, 0, 0.2862745, 1, 1,
0.2950726, 2.137177, -0.9573532, 0, 0.2784314, 1, 1,
0.302171, 1.116763, 0.02689536, 0, 0.2745098, 1, 1,
0.3066153, 0.3670999, 0.9216319, 0, 0.2666667, 1, 1,
0.3067608, 0.1311426, 2.717574, 0, 0.2627451, 1, 1,
0.3073152, -0.329159, 1.553725, 0, 0.254902, 1, 1,
0.3104244, 1.040735, 1.813023, 0, 0.2509804, 1, 1,
0.3134508, 0.4533101, 0.6607203, 0, 0.2431373, 1, 1,
0.3135911, 0.3204798, 1.852632, 0, 0.2392157, 1, 1,
0.3137289, -1.564961, 2.448778, 0, 0.2313726, 1, 1,
0.315597, -0.1582467, 1.622186, 0, 0.227451, 1, 1,
0.3168123, 0.1237383, 1.072138, 0, 0.2196078, 1, 1,
0.3186369, 0.3550654, 1.412317, 0, 0.2156863, 1, 1,
0.3206266, -0.05464316, 1.23072, 0, 0.2078431, 1, 1,
0.3216864, 0.6215972, 0.3183698, 0, 0.2039216, 1, 1,
0.3236093, 0.5264873, 1.279326, 0, 0.1960784, 1, 1,
0.3250749, -1.95161, 3.648163, 0, 0.1882353, 1, 1,
0.3297074, 2.005131, 0.04123385, 0, 0.1843137, 1, 1,
0.3307754, -1.359072, 2.936788, 0, 0.1764706, 1, 1,
0.3399173, 0.7117426, -0.7826955, 0, 0.172549, 1, 1,
0.3409676, 1.117822, 0.9744026, 0, 0.1647059, 1, 1,
0.3409743, -0.8626408, 3.31714, 0, 0.1607843, 1, 1,
0.3458921, 1.628818, -0.3170742, 0, 0.1529412, 1, 1,
0.3483235, -0.1205687, 1.967853, 0, 0.1490196, 1, 1,
0.3516639, 0.8235227, -0.5322587, 0, 0.1411765, 1, 1,
0.3547847, -1.919438, 3.360602, 0, 0.1372549, 1, 1,
0.3566293, 0.7689288, -0.0225351, 0, 0.1294118, 1, 1,
0.3605886, 0.7255653, -0.0816976, 0, 0.1254902, 1, 1,
0.3641801, -0.5489798, 4.144984, 0, 0.1176471, 1, 1,
0.3642166, 0.4282447, -0.6043599, 0, 0.1137255, 1, 1,
0.369662, -0.1351015, 3.523207, 0, 0.1058824, 1, 1,
0.373365, 1.045792, -1.263546, 0, 0.09803922, 1, 1,
0.376403, -1.128616, 3.114852, 0, 0.09411765, 1, 1,
0.376776, -0.6950954, 3.555726, 0, 0.08627451, 1, 1,
0.3792768, -1.328445, 2.737836, 0, 0.08235294, 1, 1,
0.3867853, -0.4851764, 1.424636, 0, 0.07450981, 1, 1,
0.3885133, -0.7682424, 2.87959, 0, 0.07058824, 1, 1,
0.3885548, -0.6515812, 4.242182, 0, 0.0627451, 1, 1,
0.3891645, 1.034001, 1.161413, 0, 0.05882353, 1, 1,
0.3898598, -0.6644921, 2.138598, 0, 0.05098039, 1, 1,
0.3906332, 0.003969989, 1.229174, 0, 0.04705882, 1, 1,
0.3917427, 0.8879001, 0.9895782, 0, 0.03921569, 1, 1,
0.3950755, 0.8584697, -0.08844452, 0, 0.03529412, 1, 1,
0.3977032, -0.8565397, 4.122937, 0, 0.02745098, 1, 1,
0.399178, -1.271322, 1.311839, 0, 0.02352941, 1, 1,
0.4008331, 0.04624302, -0.1642941, 0, 0.01568628, 1, 1,
0.4013532, 0.3440745, 1.897489, 0, 0.01176471, 1, 1,
0.4042123, 1.173691, -1.003158, 0, 0.003921569, 1, 1,
0.4054594, -1.262141, 2.443135, 0.003921569, 0, 1, 1,
0.4102264, -1.239668, 2.935371, 0.007843138, 0, 1, 1,
0.4102564, 1.031613, 1.772891, 0.01568628, 0, 1, 1,
0.4102666, -1.345573, 2.970747, 0.01960784, 0, 1, 1,
0.4124383, -0.9954181, 1.686815, 0.02745098, 0, 1, 1,
0.4148954, -1.207286, 2.227029, 0.03137255, 0, 1, 1,
0.418792, -1.262533, 3.179503, 0.03921569, 0, 1, 1,
0.4264134, 0.992022, 1.071301, 0.04313726, 0, 1, 1,
0.4294644, -0.9280478, 3.086116, 0.05098039, 0, 1, 1,
0.4298703, -0.1646924, 2.540086, 0.05490196, 0, 1, 1,
0.4419076, 0.08656783, 1.176621, 0.0627451, 0, 1, 1,
0.4423816, -1.734606, 2.604237, 0.06666667, 0, 1, 1,
0.4435118, 0.2713059, 0.2054084, 0.07450981, 0, 1, 1,
0.4490349, 0.8173188, 2.649464, 0.07843138, 0, 1, 1,
0.4550171, 0.1952586, 2.551903, 0.08627451, 0, 1, 1,
0.4632477, -0.4586577, 1.902317, 0.09019608, 0, 1, 1,
0.4681649, 2.379619, 0.7711505, 0.09803922, 0, 1, 1,
0.4690605, 0.3480586, 0.6306263, 0.1058824, 0, 1, 1,
0.4735492, -0.329637, 1.742218, 0.1098039, 0, 1, 1,
0.4755597, -1.550258, 1.366068, 0.1176471, 0, 1, 1,
0.4765582, -0.9348223, 3.600609, 0.1215686, 0, 1, 1,
0.4768349, 0.8271452, 1.328239, 0.1294118, 0, 1, 1,
0.4769517, -0.9562116, 4.247816, 0.1333333, 0, 1, 1,
0.4786091, 0.4567232, 3.696888, 0.1411765, 0, 1, 1,
0.4790207, -1.102507, 2.158977, 0.145098, 0, 1, 1,
0.4817868, 1.051387, 0.4621521, 0.1529412, 0, 1, 1,
0.4828612, 1.692276, 0.2489725, 0.1568628, 0, 1, 1,
0.4842545, -0.6746949, 2.27445, 0.1647059, 0, 1, 1,
0.4871384, 1.409821, 2.146683, 0.1686275, 0, 1, 1,
0.4877865, 0.4079027, 1.123468, 0.1764706, 0, 1, 1,
0.488971, -0.4949512, 1.565931, 0.1803922, 0, 1, 1,
0.4903288, 0.2786128, 3.689327, 0.1882353, 0, 1, 1,
0.4913165, 0.5314443, 1.224687, 0.1921569, 0, 1, 1,
0.4973606, 0.5478577, 0.9167563, 0.2, 0, 1, 1,
0.4978265, 2.399142, -0.831481, 0.2078431, 0, 1, 1,
0.4987536, 0.2622744, -0.1108147, 0.2117647, 0, 1, 1,
0.5017132, 0.01305288, 2.004276, 0.2196078, 0, 1, 1,
0.509153, -0.7206592, 2.598376, 0.2235294, 0, 1, 1,
0.5097576, 1.067256, 0.05151566, 0.2313726, 0, 1, 1,
0.5098476, -1.347969, 3.184021, 0.2352941, 0, 1, 1,
0.5105254, 0.5694074, 1.042145, 0.2431373, 0, 1, 1,
0.514695, 0.3622367, 2.331993, 0.2470588, 0, 1, 1,
0.5171515, 0.4287153, 1.352851, 0.254902, 0, 1, 1,
0.5181226, 0.3057221, 2.789805, 0.2588235, 0, 1, 1,
0.5195468, 0.6924029, -0.1448057, 0.2666667, 0, 1, 1,
0.5197369, 1.251332, 1.257635, 0.2705882, 0, 1, 1,
0.5198315, -0.1041486, 1.568439, 0.2784314, 0, 1, 1,
0.521147, -1.738658, 2.174564, 0.282353, 0, 1, 1,
0.5306187, -1.049137, 1.468452, 0.2901961, 0, 1, 1,
0.5367868, -0.3623233, 3.470433, 0.2941177, 0, 1, 1,
0.5433574, 0.7227466, 1.4277, 0.3019608, 0, 1, 1,
0.5484747, 0.01657668, 0.5104051, 0.3098039, 0, 1, 1,
0.549355, -0.1773185, 2.193009, 0.3137255, 0, 1, 1,
0.5506305, 1.47278, -0.330691, 0.3215686, 0, 1, 1,
0.5574881, -0.07425728, 0.3144662, 0.3254902, 0, 1, 1,
0.5579544, 0.4311151, 1.446232, 0.3333333, 0, 1, 1,
0.5687367, -1.443052, 3.301554, 0.3372549, 0, 1, 1,
0.5716271, -0.09879775, 2.428296, 0.345098, 0, 1, 1,
0.5729381, 2.004912, 0.9188112, 0.3490196, 0, 1, 1,
0.5804395, 0.2065089, 0.1057301, 0.3568628, 0, 1, 1,
0.5835968, 0.2159795, 1.424183, 0.3607843, 0, 1, 1,
0.5847922, -0.7459293, 2.312238, 0.3686275, 0, 1, 1,
0.5884897, 0.2885494, 0.5859891, 0.372549, 0, 1, 1,
0.5886074, -2.026387, 1.912531, 0.3803922, 0, 1, 1,
0.588709, 0.4581568, 1.293942, 0.3843137, 0, 1, 1,
0.5916552, -0.9446682, 2.597588, 0.3921569, 0, 1, 1,
0.5920256, 0.05349936, 1.774487, 0.3960784, 0, 1, 1,
0.5929445, 0.06815896, 1.469532, 0.4039216, 0, 1, 1,
0.5988885, -1.33732, 3.211743, 0.4117647, 0, 1, 1,
0.6053831, -0.4108267, 3.911428, 0.4156863, 0, 1, 1,
0.6089764, -2.743589, 3.040066, 0.4235294, 0, 1, 1,
0.6108773, 0.3598297, 2.595184, 0.427451, 0, 1, 1,
0.6182075, -0.1334129, 0.6354512, 0.4352941, 0, 1, 1,
0.6201171, 1.170997, 1.258329, 0.4392157, 0, 1, 1,
0.6245966, -1.401236, 3.183518, 0.4470588, 0, 1, 1,
0.6338078, 2.370511, 0.8668951, 0.4509804, 0, 1, 1,
0.6346756, -2.02146, 2.236118, 0.4588235, 0, 1, 1,
0.643198, 0.3436384, 0.3240307, 0.4627451, 0, 1, 1,
0.6457072, 1.355697, -1.396558, 0.4705882, 0, 1, 1,
0.6480557, -1.641927, 3.471287, 0.4745098, 0, 1, 1,
0.6483292, -0.3467861, 1.827917, 0.4823529, 0, 1, 1,
0.6485786, 0.03179596, -1.309143, 0.4862745, 0, 1, 1,
0.6528426, 0.01466128, 1.284877, 0.4941176, 0, 1, 1,
0.6560006, -1.138958, 3.796484, 0.5019608, 0, 1, 1,
0.6579087, 0.402292, 1.890805, 0.5058824, 0, 1, 1,
0.6590896, -1.042569, 3.055726, 0.5137255, 0, 1, 1,
0.665545, 1.713431, -1.790391, 0.5176471, 0, 1, 1,
0.6667141, 0.2394254, 0.2517704, 0.5254902, 0, 1, 1,
0.670642, 0.7904134, 2.877984, 0.5294118, 0, 1, 1,
0.6732451, -0.6955739, 2.134979, 0.5372549, 0, 1, 1,
0.6751347, -0.1053987, 2.158274, 0.5411765, 0, 1, 1,
0.6872371, -1.725965, 1.891425, 0.5490196, 0, 1, 1,
0.6874576, 0.2568671, 1.770599, 0.5529412, 0, 1, 1,
0.6877393, 0.8083535, 0.4509579, 0.5607843, 0, 1, 1,
0.6930607, 0.09065485, 3.358245, 0.5647059, 0, 1, 1,
0.6933083, 0.7162951, 0.7367922, 0.572549, 0, 1, 1,
0.6951424, -0.2912348, 2.085341, 0.5764706, 0, 1, 1,
0.6954602, 0.3178785, 0.656736, 0.5843138, 0, 1, 1,
0.6964082, 0.3915663, 0.02276975, 0.5882353, 0, 1, 1,
0.6970918, -0.3658918, 3.884045, 0.5960785, 0, 1, 1,
0.714981, -0.01965957, 0.9596164, 0.6039216, 0, 1, 1,
0.7161583, 0.6420311, 2.782245, 0.6078432, 0, 1, 1,
0.7209013, -0.4041698, 1.717161, 0.6156863, 0, 1, 1,
0.7242712, -0.450594, 2.029446, 0.6196079, 0, 1, 1,
0.7259629, 1.868618, -0.4371054, 0.627451, 0, 1, 1,
0.7297818, 0.8269942, 0.6487911, 0.6313726, 0, 1, 1,
0.73206, 1.672201, 0.2575317, 0.6392157, 0, 1, 1,
0.7427829, 0.5567374, 0.8008086, 0.6431373, 0, 1, 1,
0.7442722, -0.5890413, 3.754137, 0.6509804, 0, 1, 1,
0.7457047, -1.550777, 2.302426, 0.654902, 0, 1, 1,
0.7504502, 0.2186932, 1.849409, 0.6627451, 0, 1, 1,
0.7522615, 1.321368, 1.117501, 0.6666667, 0, 1, 1,
0.7588842, -0.5649714, 3.961173, 0.6745098, 0, 1, 1,
0.7677622, 0.3265125, 1.555647, 0.6784314, 0, 1, 1,
0.7766003, -0.9481905, 2.146199, 0.6862745, 0, 1, 1,
0.7803934, 0.9166233, 0.9166067, 0.6901961, 0, 1, 1,
0.7823446, -0.9282686, 2.382485, 0.6980392, 0, 1, 1,
0.7860817, -1.829371, 3.674148, 0.7058824, 0, 1, 1,
0.7936041, -1.077245, 2.983858, 0.7098039, 0, 1, 1,
0.7947565, -0.9504629, 3.927974, 0.7176471, 0, 1, 1,
0.7994833, -0.9934054, 3.57838, 0.7215686, 0, 1, 1,
0.7999477, -0.3884768, 1.308188, 0.7294118, 0, 1, 1,
0.8006388, 0.9832171, 0.5834935, 0.7333333, 0, 1, 1,
0.8014464, -0.6981705, 1.801641, 0.7411765, 0, 1, 1,
0.8105097, 1.457635, 0.7582558, 0.7450981, 0, 1, 1,
0.8108005, -1.333481, 5.327879, 0.7529412, 0, 1, 1,
0.8120569, -0.794885, 2.068616, 0.7568628, 0, 1, 1,
0.8140209, -0.6994556, 2.804687, 0.7647059, 0, 1, 1,
0.8243102, 0.9819313, 0.2131483, 0.7686275, 0, 1, 1,
0.8256393, -0.8316442, 0.3071567, 0.7764706, 0, 1, 1,
0.8272867, -0.6766995, 1.179516, 0.7803922, 0, 1, 1,
0.8297763, -1.076373, 1.3591, 0.7882353, 0, 1, 1,
0.8310592, 0.1607358, 0.6487781, 0.7921569, 0, 1, 1,
0.8374116, -0.5790361, 0.4628788, 0.8, 0, 1, 1,
0.8386641, -0.1394803, 3.430932, 0.8078431, 0, 1, 1,
0.8422437, 0.2647302, 2.571913, 0.8117647, 0, 1, 1,
0.8441032, -0.05499509, 1.588468, 0.8196079, 0, 1, 1,
0.8454795, 1.168054, -0.9089614, 0.8235294, 0, 1, 1,
0.8456416, 0.6731225, 1.389655, 0.8313726, 0, 1, 1,
0.8466207, -0.8977235, 0.8194078, 0.8352941, 0, 1, 1,
0.8472854, 0.2973885, 1.98873, 0.8431373, 0, 1, 1,
0.8517038, -0.8105019, 1.230747, 0.8470588, 0, 1, 1,
0.8538774, 0.6173952, -0.1536864, 0.854902, 0, 1, 1,
0.8545056, 0.2591365, 0.9666942, 0.8588235, 0, 1, 1,
0.8556073, -0.1573827, 2.671598, 0.8666667, 0, 1, 1,
0.8594096, -0.4660614, 1.221796, 0.8705882, 0, 1, 1,
0.8641501, -0.5145535, 1.693858, 0.8784314, 0, 1, 1,
0.8665586, 2.633248, 0.4688821, 0.8823529, 0, 1, 1,
0.8677345, -0.8064609, 3.100922, 0.8901961, 0, 1, 1,
0.871061, 1.041345, 0.9402174, 0.8941177, 0, 1, 1,
0.8717136, -0.119983, 2.032002, 0.9019608, 0, 1, 1,
0.8726785, -0.1184083, 1.686489, 0.9098039, 0, 1, 1,
0.8803817, 1.255138, 0.9093652, 0.9137255, 0, 1, 1,
0.8854209, -0.309587, 2.131961, 0.9215686, 0, 1, 1,
0.8917934, -1.290794, 2.283855, 0.9254902, 0, 1, 1,
0.8924146, -1.381725, 4.205268, 0.9333333, 0, 1, 1,
0.8947619, 0.2028213, 3.70286, 0.9372549, 0, 1, 1,
0.899621, -0.3532335, 2.73315, 0.945098, 0, 1, 1,
0.904156, 0.0553293, 0.3110715, 0.9490196, 0, 1, 1,
0.9049557, -1.126634, 1.261124, 0.9568627, 0, 1, 1,
0.9092808, -0.9847976, 1.878707, 0.9607843, 0, 1, 1,
0.9116927, -0.2745427, 2.381604, 0.9686275, 0, 1, 1,
0.9153043, 0.8935817, 0.863068, 0.972549, 0, 1, 1,
0.9211197, -1.108978, 0.5372372, 0.9803922, 0, 1, 1,
0.9266295, 0.9891757, 0.5951305, 0.9843137, 0, 1, 1,
0.9270854, 2.229122, 0.6951209, 0.9921569, 0, 1, 1,
0.9289843, -0.9097905, 1.972354, 0.9960784, 0, 1, 1,
0.9305457, -1.816162, 2.923656, 1, 0, 0.9960784, 1,
0.9327158, -0.7906315, 4.357037, 1, 0, 0.9882353, 1,
0.9329447, -0.2839763, 0.9702479, 1, 0, 0.9843137, 1,
0.937526, -0.3588651, 1.524101, 1, 0, 0.9764706, 1,
0.9420066, -0.005882014, 1.214298, 1, 0, 0.972549, 1,
0.9497014, -1.006523, 1.94196, 1, 0, 0.9647059, 1,
0.9570132, 0.4164959, 2.027831, 1, 0, 0.9607843, 1,
0.9593479, 1.556044, 1.471988, 1, 0, 0.9529412, 1,
0.9597944, 0.2515555, 0.7306474, 1, 0, 0.9490196, 1,
0.9604836, 0.9648857, 1.401021, 1, 0, 0.9411765, 1,
0.971005, -1.166459, 3.19695, 1, 0, 0.9372549, 1,
0.9745682, -1.05191, 3.038338, 1, 0, 0.9294118, 1,
0.9758344, -0.6908273, 1.929984, 1, 0, 0.9254902, 1,
0.9762428, 0.7562293, 0.3794672, 1, 0, 0.9176471, 1,
0.977655, -1.002662, 2.038331, 1, 0, 0.9137255, 1,
0.9789641, 1.14442, 1.864617, 1, 0, 0.9058824, 1,
0.9813138, 1.172081, 2.730647, 1, 0, 0.9019608, 1,
1.000742, -0.5388598, 3.803004, 1, 0, 0.8941177, 1,
1.000953, -0.7223675, 2.395973, 1, 0, 0.8862745, 1,
1.003786, -0.40011, 2.303108, 1, 0, 0.8823529, 1,
1.004876, 0.7151336, 2.70528, 1, 0, 0.8745098, 1,
1.00807, -0.1652681, 2.022144, 1, 0, 0.8705882, 1,
1.011063, -0.9672294, 1.904736, 1, 0, 0.8627451, 1,
1.024205, 0.2431554, -0.7421182, 1, 0, 0.8588235, 1,
1.024274, 0.2598519, 1.500706, 1, 0, 0.8509804, 1,
1.032138, 0.8725193, 2.315998, 1, 0, 0.8470588, 1,
1.043504, 0.6821684, 0.3258377, 1, 0, 0.8392157, 1,
1.048213, -2.772651, 2.611554, 1, 0, 0.8352941, 1,
1.050634, -1.517199, 3.821918, 1, 0, 0.827451, 1,
1.053884, 0.9541588, 0.5974898, 1, 0, 0.8235294, 1,
1.054475, -1.064887, 1.998685, 1, 0, 0.8156863, 1,
1.060609, 0.4038888, 2.373083, 1, 0, 0.8117647, 1,
1.065628, -0.5931754, 2.502346, 1, 0, 0.8039216, 1,
1.068153, -1.293125, 2.01611, 1, 0, 0.7960784, 1,
1.076881, 0.733619, 2.138454, 1, 0, 0.7921569, 1,
1.077164, -0.3415557, 1.488225, 1, 0, 0.7843137, 1,
1.079902, -0.6194156, 2.271883, 1, 0, 0.7803922, 1,
1.085322, 0.7805635, 2.902853, 1, 0, 0.772549, 1,
1.089832, -0.5249421, 2.760366, 1, 0, 0.7686275, 1,
1.093541, 0.760343, -0.3047439, 1, 0, 0.7607843, 1,
1.09677, -0.3680173, 2.175738, 1, 0, 0.7568628, 1,
1.101561, -0.7760382, 2.079581, 1, 0, 0.7490196, 1,
1.102375, 0.2759218, 1.328882, 1, 0, 0.7450981, 1,
1.102786, -0.8281422, 2.119712, 1, 0, 0.7372549, 1,
1.104591, 1.070725, 0.8003358, 1, 0, 0.7333333, 1,
1.109507, -0.7896088, 1.375183, 1, 0, 0.7254902, 1,
1.112096, 0.297842, 2.298161, 1, 0, 0.7215686, 1,
1.116583, 0.1925458, 1.250575, 1, 0, 0.7137255, 1,
1.126607, 0.6940285, 0.6068376, 1, 0, 0.7098039, 1,
1.133006, 0.1094383, -0.7745915, 1, 0, 0.7019608, 1,
1.150094, -1.426584, 3.546975, 1, 0, 0.6941177, 1,
1.15036, -0.5664192, 0.1640035, 1, 0, 0.6901961, 1,
1.150379, 1.263382, 0.5016475, 1, 0, 0.682353, 1,
1.159808, 1.192338, -1.209269, 1, 0, 0.6784314, 1,
1.180926, -0.4407374, 1.661667, 1, 0, 0.6705883, 1,
1.182542, -0.2631235, 1.833093, 1, 0, 0.6666667, 1,
1.184593, -1.279074, 2.402479, 1, 0, 0.6588235, 1,
1.19911, -0.2452272, 1.251698, 1, 0, 0.654902, 1,
1.204235, -0.4011792, 3.947896, 1, 0, 0.6470588, 1,
1.211038, -0.6952889, 2.370372, 1, 0, 0.6431373, 1,
1.212018, -1.838147, 3.659175, 1, 0, 0.6352941, 1,
1.220918, 1.148556, 0.04623943, 1, 0, 0.6313726, 1,
1.22984, -1.462888, 2.496733, 1, 0, 0.6235294, 1,
1.244157, -0.1648505, 1.901873, 1, 0, 0.6196079, 1,
1.244795, 1.740864, 0.3699504, 1, 0, 0.6117647, 1,
1.245055, -0.1154896, 0.9887407, 1, 0, 0.6078432, 1,
1.260177, -1.639441, 2.081951, 1, 0, 0.6, 1,
1.261004, 2.591714, -0.3565455, 1, 0, 0.5921569, 1,
1.264388, 0.6047197, 0.1199138, 1, 0, 0.5882353, 1,
1.268172, 0.5070806, 0.66245, 1, 0, 0.5803922, 1,
1.268796, -0.2928202, 1.679355, 1, 0, 0.5764706, 1,
1.273553, -0.4841387, 2.955242, 1, 0, 0.5686275, 1,
1.273636, 0.2203706, 2.303409, 1, 0, 0.5647059, 1,
1.276785, 0.09173364, 3.781573, 1, 0, 0.5568628, 1,
1.280441, -0.8640782, 1.281199, 1, 0, 0.5529412, 1,
1.294927, -1.014056, 1.961544, 1, 0, 0.5450981, 1,
1.305374, 0.3071042, 2.095958, 1, 0, 0.5411765, 1,
1.321959, -0.3282078, 1.880496, 1, 0, 0.5333334, 1,
1.32767, -1.903924, 0.4847859, 1, 0, 0.5294118, 1,
1.327796, -0.8195677, 1.457629, 1, 0, 0.5215687, 1,
1.334712, -0.8703485, 2.974821, 1, 0, 0.5176471, 1,
1.354275, -0.1528007, 1.452788, 1, 0, 0.509804, 1,
1.369483, 0.1153604, 1.15895, 1, 0, 0.5058824, 1,
1.384434, 0.08337647, 3.308851, 1, 0, 0.4980392, 1,
1.384687, 1.339377, -0.8838339, 1, 0, 0.4901961, 1,
1.387398, -0.4856189, 3.49078, 1, 0, 0.4862745, 1,
1.398082, -0.1593617, 1.58718, 1, 0, 0.4784314, 1,
1.399133, -0.05912625, 1.629173, 1, 0, 0.4745098, 1,
1.40171, -0.393792, 1.578408, 1, 0, 0.4666667, 1,
1.402694, 0.07318556, 0.4059813, 1, 0, 0.4627451, 1,
1.4163, 0.08915886, 2.516911, 1, 0, 0.454902, 1,
1.424173, -0.8957908, 4.492173, 1, 0, 0.4509804, 1,
1.427291, 0.2893313, 2.604177, 1, 0, 0.4431373, 1,
1.430176, -1.1657, 3.275703, 1, 0, 0.4392157, 1,
1.435624, 0.2051779, 1.212829, 1, 0, 0.4313726, 1,
1.444454, -1.954096, 0.0281828, 1, 0, 0.427451, 1,
1.44994, 0.3824013, 1.65135, 1, 0, 0.4196078, 1,
1.458645, -0.6271515, 2.246581, 1, 0, 0.4156863, 1,
1.480502, -0.02053516, 1.854444, 1, 0, 0.4078431, 1,
1.485272, 0.04431726, 1.517035, 1, 0, 0.4039216, 1,
1.488975, 0.2962779, 1.458861, 1, 0, 0.3960784, 1,
1.493261, 0.5510554, 1.514565, 1, 0, 0.3882353, 1,
1.494165, 1.121591, 1.14785, 1, 0, 0.3843137, 1,
1.507211, -1.452582, -0.1158486, 1, 0, 0.3764706, 1,
1.51037, -1.524243, 0.3953534, 1, 0, 0.372549, 1,
1.513212, 0.2428795, 1.105754, 1, 0, 0.3647059, 1,
1.519218, 0.8737202, 2.642443, 1, 0, 0.3607843, 1,
1.521547, -0.7829891, 3.745936, 1, 0, 0.3529412, 1,
1.524762, -0.287225, 1.403768, 1, 0, 0.3490196, 1,
1.549596, 0.420767, 1.213112, 1, 0, 0.3411765, 1,
1.556404, 0.05986688, 0.2881402, 1, 0, 0.3372549, 1,
1.556872, 1.05283, 2.338443, 1, 0, 0.3294118, 1,
1.568071, -0.3337234, 3.130606, 1, 0, 0.3254902, 1,
1.586564, -0.6857733, 1.603014, 1, 0, 0.3176471, 1,
1.587522, -1.179196, 1.066501, 1, 0, 0.3137255, 1,
1.587685, -1.190153, 2.060969, 1, 0, 0.3058824, 1,
1.590275, 0.646377, 1.938352, 1, 0, 0.2980392, 1,
1.597142, 1.17978, 1.136224, 1, 0, 0.2941177, 1,
1.602063, 1.371474, 1.232969, 1, 0, 0.2862745, 1,
1.604242, -0.3470242, 2.154307, 1, 0, 0.282353, 1,
1.612057, 0.671829, -0.8115188, 1, 0, 0.2745098, 1,
1.620241, -0.1168426, 0.7429622, 1, 0, 0.2705882, 1,
1.629358, 1.177158, 0.9291486, 1, 0, 0.2627451, 1,
1.630925, -2.49461, 1.90912, 1, 0, 0.2588235, 1,
1.634711, 1.123061, -0.4639731, 1, 0, 0.2509804, 1,
1.643998, 1.125499, 1.146212, 1, 0, 0.2470588, 1,
1.650435, 0.1495644, 2.80391, 1, 0, 0.2392157, 1,
1.651957, 0.2134328, 1.119029, 1, 0, 0.2352941, 1,
1.653829, -1.240439, 2.423008, 1, 0, 0.227451, 1,
1.673249, -0.1203919, 3.933857, 1, 0, 0.2235294, 1,
1.675423, -0.8313242, 2.178857, 1, 0, 0.2156863, 1,
1.677063, 0.2595428, 0.9746217, 1, 0, 0.2117647, 1,
1.680199, 0.001480045, 1.551893, 1, 0, 0.2039216, 1,
1.681619, -0.7609748, 2.25795, 1, 0, 0.1960784, 1,
1.693039, -0.8422303, 1.339314, 1, 0, 0.1921569, 1,
1.746745, 0.1777884, 0.870638, 1, 0, 0.1843137, 1,
1.749488, 0.4446625, 2.351717, 1, 0, 0.1803922, 1,
1.751766, 1.092763, -0.0622578, 1, 0, 0.172549, 1,
1.76653, 1.850895, 1.474751, 1, 0, 0.1686275, 1,
1.803039, 1.077555, 2.163486, 1, 0, 0.1607843, 1,
1.810497, 0.3893782, 1.671262, 1, 0, 0.1568628, 1,
1.817824, 2.186348, -0.2098908, 1, 0, 0.1490196, 1,
1.84074, -0.6087837, 1.168871, 1, 0, 0.145098, 1,
1.918749, 0.02465696, 1.393333, 1, 0, 0.1372549, 1,
1.954794, -1.800503, 3.499068, 1, 0, 0.1333333, 1,
2.001626, -0.876506, 3.212063, 1, 0, 0.1254902, 1,
2.01262, 0.2476657, 2.351204, 1, 0, 0.1215686, 1,
2.02623, 0.7102029, 0.5003133, 1, 0, 0.1137255, 1,
2.038194, 2.088273, 0.3255069, 1, 0, 0.1098039, 1,
2.067313, 0.4002365, 2.381746, 1, 0, 0.1019608, 1,
2.080958, 0.8386265, 1.40715, 1, 0, 0.09411765, 1,
2.149445, -0.3484598, 2.485666, 1, 0, 0.09019608, 1,
2.166934, -0.7911168, 1.637335, 1, 0, 0.08235294, 1,
2.235286, -0.9756347, 2.134264, 1, 0, 0.07843138, 1,
2.23799, 0.2502337, 0.4263591, 1, 0, 0.07058824, 1,
2.272532, -0.5614593, 3.555177, 1, 0, 0.06666667, 1,
2.359171, 1.057117, 1.325994, 1, 0, 0.05882353, 1,
2.376353, -1.05556, 2.241489, 1, 0, 0.05490196, 1,
2.573262, -0.1465002, 2.599371, 1, 0, 0.04705882, 1,
2.684635, 0.3023343, -0.26471, 1, 0, 0.04313726, 1,
2.691873, 0.3414362, 1.991768, 1, 0, 0.03529412, 1,
2.731341, -1.432853, 2.846418, 1, 0, 0.03137255, 1,
2.734641, 1.417691, 1.70578, 1, 0, 0.02352941, 1,
2.745671, 0.6721563, 0.6583382, 1, 0, 0.01960784, 1,
2.765767, 0.567359, 1.577533, 1, 0, 0.01176471, 1,
3.003267, -0.01064354, 2.697696, 1, 0, 0.007843138, 1
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
0.1185586, -4.615531, -6.882124, 0, -0.5, 0.5, 0.5,
0.1185586, -4.615531, -6.882124, 1, -0.5, 0.5, 0.5,
0.1185586, -4.615531, -6.882124, 1, 1.5, 0.5, 0.5,
0.1185586, -4.615531, -6.882124, 0, 1.5, 0.5, 0.5
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
-3.744066, -0.3693358, -6.882124, 0, -0.5, 0.5, 0.5,
-3.744066, -0.3693358, -6.882124, 1, -0.5, 0.5, 0.5,
-3.744066, -0.3693358, -6.882124, 1, 1.5, 0.5, 0.5,
-3.744066, -0.3693358, -6.882124, 0, 1.5, 0.5, 0.5
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
-3.744066, -4.615531, 0.107698, 0, -0.5, 0.5, 0.5,
-3.744066, -4.615531, 0.107698, 1, -0.5, 0.5, 0.5,
-3.744066, -4.615531, 0.107698, 1, 1.5, 0.5, 0.5,
-3.744066, -4.615531, 0.107698, 0, 1.5, 0.5, 0.5
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
-2, -3.63564, -5.269088,
3, -3.63564, -5.269088,
-2, -3.63564, -5.269088,
-2, -3.798955, -5.537928,
-1, -3.63564, -5.269088,
-1, -3.798955, -5.537928,
0, -3.63564, -5.269088,
0, -3.798955, -5.537928,
1, -3.63564, -5.269088,
1, -3.798955, -5.537928,
2, -3.63564, -5.269088,
2, -3.798955, -5.537928,
3, -3.63564, -5.269088,
3, -3.798955, -5.537928
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
-2, -4.125586, -6.075606, 0, -0.5, 0.5, 0.5,
-2, -4.125586, -6.075606, 1, -0.5, 0.5, 0.5,
-2, -4.125586, -6.075606, 1, 1.5, 0.5, 0.5,
-2, -4.125586, -6.075606, 0, 1.5, 0.5, 0.5,
-1, -4.125586, -6.075606, 0, -0.5, 0.5, 0.5,
-1, -4.125586, -6.075606, 1, -0.5, 0.5, 0.5,
-1, -4.125586, -6.075606, 1, 1.5, 0.5, 0.5,
-1, -4.125586, -6.075606, 0, 1.5, 0.5, 0.5,
0, -4.125586, -6.075606, 0, -0.5, 0.5, 0.5,
0, -4.125586, -6.075606, 1, -0.5, 0.5, 0.5,
0, -4.125586, -6.075606, 1, 1.5, 0.5, 0.5,
0, -4.125586, -6.075606, 0, 1.5, 0.5, 0.5,
1, -4.125586, -6.075606, 0, -0.5, 0.5, 0.5,
1, -4.125586, -6.075606, 1, -0.5, 0.5, 0.5,
1, -4.125586, -6.075606, 1, 1.5, 0.5, 0.5,
1, -4.125586, -6.075606, 0, 1.5, 0.5, 0.5,
2, -4.125586, -6.075606, 0, -0.5, 0.5, 0.5,
2, -4.125586, -6.075606, 1, -0.5, 0.5, 0.5,
2, -4.125586, -6.075606, 1, 1.5, 0.5, 0.5,
2, -4.125586, -6.075606, 0, 1.5, 0.5, 0.5,
3, -4.125586, -6.075606, 0, -0.5, 0.5, 0.5,
3, -4.125586, -6.075606, 1, -0.5, 0.5, 0.5,
3, -4.125586, -6.075606, 1, 1.5, 0.5, 0.5,
3, -4.125586, -6.075606, 0, 1.5, 0.5, 0.5
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
-2.852691, -3, -5.269088,
-2.852691, 2, -5.269088,
-2.852691, -3, -5.269088,
-3.001253, -3, -5.537928,
-2.852691, -2, -5.269088,
-3.001253, -2, -5.537928,
-2.852691, -1, -5.269088,
-3.001253, -1, -5.537928,
-2.852691, 0, -5.269088,
-3.001253, 0, -5.537928,
-2.852691, 1, -5.269088,
-3.001253, 1, -5.537928,
-2.852691, 2, -5.269088,
-3.001253, 2, -5.537928
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
-3.298378, -3, -6.075606, 0, -0.5, 0.5, 0.5,
-3.298378, -3, -6.075606, 1, -0.5, 0.5, 0.5,
-3.298378, -3, -6.075606, 1, 1.5, 0.5, 0.5,
-3.298378, -3, -6.075606, 0, 1.5, 0.5, 0.5,
-3.298378, -2, -6.075606, 0, -0.5, 0.5, 0.5,
-3.298378, -2, -6.075606, 1, -0.5, 0.5, 0.5,
-3.298378, -2, -6.075606, 1, 1.5, 0.5, 0.5,
-3.298378, -2, -6.075606, 0, 1.5, 0.5, 0.5,
-3.298378, -1, -6.075606, 0, -0.5, 0.5, 0.5,
-3.298378, -1, -6.075606, 1, -0.5, 0.5, 0.5,
-3.298378, -1, -6.075606, 1, 1.5, 0.5, 0.5,
-3.298378, -1, -6.075606, 0, 1.5, 0.5, 0.5,
-3.298378, 0, -6.075606, 0, -0.5, 0.5, 0.5,
-3.298378, 0, -6.075606, 1, -0.5, 0.5, 0.5,
-3.298378, 0, -6.075606, 1, 1.5, 0.5, 0.5,
-3.298378, 0, -6.075606, 0, 1.5, 0.5, 0.5,
-3.298378, 1, -6.075606, 0, -0.5, 0.5, 0.5,
-3.298378, 1, -6.075606, 1, -0.5, 0.5, 0.5,
-3.298378, 1, -6.075606, 1, 1.5, 0.5, 0.5,
-3.298378, 1, -6.075606, 0, 1.5, 0.5, 0.5,
-3.298378, 2, -6.075606, 0, -0.5, 0.5, 0.5,
-3.298378, 2, -6.075606, 1, -0.5, 0.5, 0.5,
-3.298378, 2, -6.075606, 1, 1.5, 0.5, 0.5,
-3.298378, 2, -6.075606, 0, 1.5, 0.5, 0.5
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
-2.852691, -3.63564, -4,
-2.852691, -3.63564, 4,
-2.852691, -3.63564, -4,
-3.001253, -3.798955, -4,
-2.852691, -3.63564, -2,
-3.001253, -3.798955, -2,
-2.852691, -3.63564, 0,
-3.001253, -3.798955, 0,
-2.852691, -3.63564, 2,
-3.001253, -3.798955, 2,
-2.852691, -3.63564, 4,
-3.001253, -3.798955, 4
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
-3.298378, -4.125586, -4, 0, -0.5, 0.5, 0.5,
-3.298378, -4.125586, -4, 1, -0.5, 0.5, 0.5,
-3.298378, -4.125586, -4, 1, 1.5, 0.5, 0.5,
-3.298378, -4.125586, -4, 0, 1.5, 0.5, 0.5,
-3.298378, -4.125586, -2, 0, -0.5, 0.5, 0.5,
-3.298378, -4.125586, -2, 1, -0.5, 0.5, 0.5,
-3.298378, -4.125586, -2, 1, 1.5, 0.5, 0.5,
-3.298378, -4.125586, -2, 0, 1.5, 0.5, 0.5,
-3.298378, -4.125586, 0, 0, -0.5, 0.5, 0.5,
-3.298378, -4.125586, 0, 1, -0.5, 0.5, 0.5,
-3.298378, -4.125586, 0, 1, 1.5, 0.5, 0.5,
-3.298378, -4.125586, 0, 0, 1.5, 0.5, 0.5,
-3.298378, -4.125586, 2, 0, -0.5, 0.5, 0.5,
-3.298378, -4.125586, 2, 1, -0.5, 0.5, 0.5,
-3.298378, -4.125586, 2, 1, 1.5, 0.5, 0.5,
-3.298378, -4.125586, 2, 0, 1.5, 0.5, 0.5,
-3.298378, -4.125586, 4, 0, -0.5, 0.5, 0.5,
-3.298378, -4.125586, 4, 1, -0.5, 0.5, 0.5,
-3.298378, -4.125586, 4, 1, 1.5, 0.5, 0.5,
-3.298378, -4.125586, 4, 0, 1.5, 0.5, 0.5
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
-2.852691, -3.63564, -5.269088,
-2.852691, 2.896968, -5.269088,
-2.852691, -3.63564, 5.484484,
-2.852691, 2.896968, 5.484484,
-2.852691, -3.63564, -5.269088,
-2.852691, -3.63564, 5.484484,
-2.852691, 2.896968, -5.269088,
-2.852691, 2.896968, 5.484484,
-2.852691, -3.63564, -5.269088,
3.089808, -3.63564, -5.269088,
-2.852691, -3.63564, 5.484484,
3.089808, -3.63564, 5.484484,
-2.852691, 2.896968, -5.269088,
3.089808, 2.896968, -5.269088,
-2.852691, 2.896968, 5.484484,
3.089808, 2.896968, 5.484484,
3.089808, -3.63564, -5.269088,
3.089808, 2.896968, -5.269088,
3.089808, -3.63564, 5.484484,
3.089808, 2.896968, 5.484484,
3.089808, -3.63564, -5.269088,
3.089808, -3.63564, 5.484484,
3.089808, 2.896968, -5.269088,
3.089808, 2.896968, 5.484484
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
var radius = 7.430347;
var distance = 33.05845;
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
mvMatrix.translate( -0.1185586, 0.3693358, -0.107698 );
mvMatrix.scale( 1.351929, 1.229805, 0.7470853 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.05845);
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
Ethiofencarb<-read.table("Ethiofencarb.xyz", skip=1)
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
-2.76615, 2.133804, -1.954041, 0, 0, 1, 1, 1,
-2.735528, 0.2170574, -1.636046, 1, 0, 0, 1, 1,
-2.733531, -0.2084541, -2.661981, 1, 0, 0, 1, 1,
-2.713503, 1.396829, -0.8106259, 1, 0, 0, 1, 1,
-2.506435, -1.075422, -0.4108993, 1, 0, 0, 1, 1,
-2.455592, 2.526282, -0.9192285, 1, 0, 0, 1, 1,
-2.18206, -1.620844, -2.162132, 0, 0, 0, 1, 1,
-2.133255, 0.03668024, 0.4004654, 0, 0, 0, 1, 1,
-2.113407, -0.7651466, -1.595759, 0, 0, 0, 1, 1,
-2.097545, 0.534819, -1.414925, 0, 0, 0, 1, 1,
-2.027423, 1.877387, -0.01054596, 0, 0, 0, 1, 1,
-1.997477, 0.07361294, -0.1330309, 0, 0, 0, 1, 1,
-1.98303, 2.216338, -0.4806636, 0, 0, 0, 1, 1,
-1.978196, -1.66613, -2.295108, 1, 1, 1, 1, 1,
-1.97188, -0.5779754, -0.3842572, 1, 1, 1, 1, 1,
-1.970225, -0.2030117, -0.6537591, 1, 1, 1, 1, 1,
-1.966472, -1.607225, -2.02171, 1, 1, 1, 1, 1,
-1.938537, -0.1043824, -2.176809, 1, 1, 1, 1, 1,
-1.912747, 0.02084343, -0.8532197, 1, 1, 1, 1, 1,
-1.879768, 0.7780057, -1.443224, 1, 1, 1, 1, 1,
-1.871822, -0.1657403, -0.8779457, 1, 1, 1, 1, 1,
-1.859425, 1.621377, -2.026504, 1, 1, 1, 1, 1,
-1.844682, 0.2881847, -1.397423, 1, 1, 1, 1, 1,
-1.833502, -0.527116, -3.102949, 1, 1, 1, 1, 1,
-1.789454, -1.919616, -2.748041, 1, 1, 1, 1, 1,
-1.78608, -0.08769716, -0.4004942, 1, 1, 1, 1, 1,
-1.768451, 9.200876e-05, -0.9519442, 1, 1, 1, 1, 1,
-1.759263, -0.9464909, -1.866415, 1, 1, 1, 1, 1,
-1.757848, 0.08770079, -0.5479959, 0, 0, 1, 1, 1,
-1.733267, -0.1494917, -2.509301, 1, 0, 0, 1, 1,
-1.730074, 0.05078125, -0.9132257, 1, 0, 0, 1, 1,
-1.72794, 2.050511, -0.769205, 1, 0, 0, 1, 1,
-1.725522, -0.6448703, -0.7330055, 1, 0, 0, 1, 1,
-1.713005, 0.5720077, -2.730039, 1, 0, 0, 1, 1,
-1.703411, -0.1004185, -1.675808, 0, 0, 0, 1, 1,
-1.702552, -0.4047911, -1.487193, 0, 0, 0, 1, 1,
-1.700149, -0.7605211, -1.364774, 0, 0, 0, 1, 1,
-1.699148, 1.402111, -2.070126, 0, 0, 0, 1, 1,
-1.69533, -0.2716663, -1.988076, 0, 0, 0, 1, 1,
-1.692708, 0.3586078, -1.354101, 0, 0, 0, 1, 1,
-1.686953, 1.349738, -0.9528551, 0, 0, 0, 1, 1,
-1.665269, 0.2471153, -3.096363, 1, 1, 1, 1, 1,
-1.664533, -1.659185, -1.635015, 1, 1, 1, 1, 1,
-1.634329, 0.1076776, -2.34143, 1, 1, 1, 1, 1,
-1.627806, -0.1583304, -3.762812, 1, 1, 1, 1, 1,
-1.591275, -0.1867733, -1.52026, 1, 1, 1, 1, 1,
-1.586982, 0.9067205, -0.7948462, 1, 1, 1, 1, 1,
-1.58585, 2.18988, -0.5238558, 1, 1, 1, 1, 1,
-1.583004, 0.9902671, -0.2689068, 1, 1, 1, 1, 1,
-1.580806, -0.823728, -0.9120353, 1, 1, 1, 1, 1,
-1.566734, 0.7395843, -1.489813, 1, 1, 1, 1, 1,
-1.565926, 1.152431, -0.624007, 1, 1, 1, 1, 1,
-1.558653, 2.135411, -1.210008, 1, 1, 1, 1, 1,
-1.552119, -0.2395375, -2.011925, 1, 1, 1, 1, 1,
-1.551188, -0.5598766, -2.164563, 1, 1, 1, 1, 1,
-1.547867, -0.498465, -2.777978, 1, 1, 1, 1, 1,
-1.536384, 1.386304, -0.01185747, 0, 0, 1, 1, 1,
-1.533966, -0.6459745, -1.898647, 1, 0, 0, 1, 1,
-1.532804, 0.6496872, -0.7065888, 1, 0, 0, 1, 1,
-1.516116, 1.810642, -0.07374353, 1, 0, 0, 1, 1,
-1.485439, -0.9157732, -1.276226, 1, 0, 0, 1, 1,
-1.47279, -1.205036, -2.444893, 1, 0, 0, 1, 1,
-1.466074, 0.4084728, -3.028955, 0, 0, 0, 1, 1,
-1.458557, -0.129682, -0.726606, 0, 0, 0, 1, 1,
-1.445723, -0.7010438, -2.914994, 0, 0, 0, 1, 1,
-1.439021, 1.489479, -1.544899, 0, 0, 0, 1, 1,
-1.432845, -0.1805027, -0.4107749, 0, 0, 0, 1, 1,
-1.427403, 0.2923035, -3.978053, 0, 0, 0, 1, 1,
-1.413199, -0.5495922, 0.01830363, 0, 0, 0, 1, 1,
-1.409624, 0.6785408, -1.782218, 1, 1, 1, 1, 1,
-1.402895, 2.538397, -1.091974, 1, 1, 1, 1, 1,
-1.402833, -1.125069, -3.176458, 1, 1, 1, 1, 1,
-1.37921, 0.5000368, -3.294708, 1, 1, 1, 1, 1,
-1.362284, -0.8224897, -2.678644, 1, 1, 1, 1, 1,
-1.356116, 0.7968987, -1.422128, 1, 1, 1, 1, 1,
-1.343143, -0.5173807, -1.696757, 1, 1, 1, 1, 1,
-1.337398, -0.5055915, -1.737938, 1, 1, 1, 1, 1,
-1.329537, -1.248366, -1.227466, 1, 1, 1, 1, 1,
-1.326098, -0.181764, -0.7895248, 1, 1, 1, 1, 1,
-1.315707, 0.8963703, -1.141905, 1, 1, 1, 1, 1,
-1.31169, -1.356515, -2.529719, 1, 1, 1, 1, 1,
-1.302603, -1.665422, -3.049592, 1, 1, 1, 1, 1,
-1.301981, 1.604116, 0.3075307, 1, 1, 1, 1, 1,
-1.260692, -1.358094, -1.288821, 1, 1, 1, 1, 1,
-1.260384, 0.935205, -0.63282, 0, 0, 1, 1, 1,
-1.256324, 1.173025, -2.125351, 1, 0, 0, 1, 1,
-1.249106, 0.8101851, -0.7829365, 1, 0, 0, 1, 1,
-1.24784, 1.35068, -1.745603, 1, 0, 0, 1, 1,
-1.247249, -0.5138238, -1.500299, 1, 0, 0, 1, 1,
-1.239952, 0.6244105, -1.291882, 1, 0, 0, 1, 1,
-1.238168, 0.1607932, -0.5265203, 0, 0, 0, 1, 1,
-1.231873, 0.6476163, -1.305123, 0, 0, 0, 1, 1,
-1.2218, 0.5636791, -1.003032, 0, 0, 0, 1, 1,
-1.216376, -3.111032, -3.028835, 0, 0, 0, 1, 1,
-1.215073, -1.209666, -1.31866, 0, 0, 0, 1, 1,
-1.210481, -0.2345209, -2.439235, 0, 0, 0, 1, 1,
-1.201088, 0.8438453, -0.7141823, 0, 0, 0, 1, 1,
-1.198569, -0.06837455, -3.603593, 1, 1, 1, 1, 1,
-1.18686, 0.08481096, -0.8352747, 1, 1, 1, 1, 1,
-1.185794, -1.176663, -2.534713, 1, 1, 1, 1, 1,
-1.185732, -0.5940641, -0.7550038, 1, 1, 1, 1, 1,
-1.184423, -0.6475859, -3.527073, 1, 1, 1, 1, 1,
-1.179606, -1.83281, -2.548471, 1, 1, 1, 1, 1,
-1.171476, 1.440598, -1.026848, 1, 1, 1, 1, 1,
-1.168557, -0.2294352, -1.662831, 1, 1, 1, 1, 1,
-1.166817, 0.133824, -1.378157, 1, 1, 1, 1, 1,
-1.163061, 0.9566759, -0.4056139, 1, 1, 1, 1, 1,
-1.157982, 0.1721992, -0.7170996, 1, 1, 1, 1, 1,
-1.153116, 0.2300176, -0.6808853, 1, 1, 1, 1, 1,
-1.153064, -0.7968177, -1.618825, 1, 1, 1, 1, 1,
-1.151707, -0.3712901, -2.072609, 1, 1, 1, 1, 1,
-1.149891, 0.9530628, -2.377332, 1, 1, 1, 1, 1,
-1.148703, -0.4291095, -1.636, 0, 0, 1, 1, 1,
-1.146821, 0.04645152, 0.6021295, 1, 0, 0, 1, 1,
-1.137256, -0.1488006, -1.419711, 1, 0, 0, 1, 1,
-1.136855, -0.2504019, -0.8648283, 1, 0, 0, 1, 1,
-1.132016, 0.8447526, -1.828561, 1, 0, 0, 1, 1,
-1.123705, -1.099465, -2.827043, 1, 0, 0, 1, 1,
-1.121545, -1.28777, -3.761599, 0, 0, 0, 1, 1,
-1.117025, 0.39862, -1.374505, 0, 0, 0, 1, 1,
-1.101105, 0.45906, -0.6149129, 0, 0, 0, 1, 1,
-1.099067, -1.055908, -2.687871, 0, 0, 0, 1, 1,
-1.090059, -0.03995328, -1.189649, 0, 0, 0, 1, 1,
-1.083136, 0.3211064, -0.7906522, 0, 0, 0, 1, 1,
-1.083072, 1.560998, -0.4730371, 0, 0, 0, 1, 1,
-1.08146, 0.4212836, 0.05617227, 1, 1, 1, 1, 1,
-1.077429, 0.6303681, -1.785042, 1, 1, 1, 1, 1,
-1.074148, -2.262111, -3.140151, 1, 1, 1, 1, 1,
-1.070861, 0.4219826, -1.828711, 1, 1, 1, 1, 1,
-1.058991, 0.6884311, -0.3489476, 1, 1, 1, 1, 1,
-1.052541, 0.6188071, -0.8705561, 1, 1, 1, 1, 1,
-1.047058, 0.4380646, -2.514561, 1, 1, 1, 1, 1,
-1.040336, 1.08303, 0.3692055, 1, 1, 1, 1, 1,
-1.037224, 1.235297, -0.05160422, 1, 1, 1, 1, 1,
-1.033666, 0.05093137, -2.375117, 1, 1, 1, 1, 1,
-1.024279, -1.508165, -1.761986, 1, 1, 1, 1, 1,
-1.022678, 0.3731891, -0.8034716, 1, 1, 1, 1, 1,
-1.016908, 0.040339, 0.08115043, 1, 1, 1, 1, 1,
-1.016061, 0.08828343, -2.588372, 1, 1, 1, 1, 1,
-1.015414, 0.3283791, -0.6044723, 1, 1, 1, 1, 1,
-1.014992, -1.029987, -1.690752, 0, 0, 1, 1, 1,
-1.010186, -1.080063, -3.43609, 1, 0, 0, 1, 1,
-1.0082, 1.227641, -0.4972589, 1, 0, 0, 1, 1,
-1.006647, -1.202619, -3.789578, 1, 0, 0, 1, 1,
-1.005407, -0.4772816, -1.958385, 1, 0, 0, 1, 1,
-0.998517, 1.370647, -0.104983, 1, 0, 0, 1, 1,
-0.9902768, -0.3880045, -1.265181, 0, 0, 0, 1, 1,
-0.9895949, -1.498222, -1.688474, 0, 0, 0, 1, 1,
-0.9855174, 0.2261723, -0.6348546, 0, 0, 0, 1, 1,
-0.9847505, -3.153162, -0.885004, 0, 0, 0, 1, 1,
-0.984589, -1.119552, -2.675129, 0, 0, 0, 1, 1,
-0.9757234, 0.3096022, -1.14677, 0, 0, 0, 1, 1,
-0.9753253, 0.7306337, -0.05282252, 0, 0, 0, 1, 1,
-0.9749544, -0.318352, -1.656839, 1, 1, 1, 1, 1,
-0.9684029, -0.4093277, -1.623015, 1, 1, 1, 1, 1,
-0.9672033, -0.2755961, -3.685031, 1, 1, 1, 1, 1,
-0.9644386, 0.0749216, -0.9456992, 1, 1, 1, 1, 1,
-0.9612617, -0.3846058, -1.558731, 1, 1, 1, 1, 1,
-0.9594951, 2.574152, -1.015633, 1, 1, 1, 1, 1,
-0.9575599, -0.05990521, -1.380608, 1, 1, 1, 1, 1,
-0.9538047, 0.6092406, -1.605328, 1, 1, 1, 1, 1,
-0.9441443, 0.2138388, -2.224012, 1, 1, 1, 1, 1,
-0.9384313, 0.1768034, -0.9002559, 1, 1, 1, 1, 1,
-0.9263223, -0.7207407, -3.686086, 1, 1, 1, 1, 1,
-0.9186333, -0.469384, -1.420544, 1, 1, 1, 1, 1,
-0.9119442, -0.7002016, -3.315216, 1, 1, 1, 1, 1,
-0.9109826, 0.1819445, -1.489397, 1, 1, 1, 1, 1,
-0.9028025, 0.5030453, -1.997075, 1, 1, 1, 1, 1,
-0.9017646, 0.6066228, -1.945543, 0, 0, 1, 1, 1,
-0.8997397, 0.9239868, -1.368537, 1, 0, 0, 1, 1,
-0.8966031, -0.7104564, -2.996358, 1, 0, 0, 1, 1,
-0.8958864, -1.096234, -1.90397, 1, 0, 0, 1, 1,
-0.8887451, -0.1419855, 0.003169454, 1, 0, 0, 1, 1,
-0.8802847, -0.1486384, -1.247469, 1, 0, 0, 1, 1,
-0.8788727, 0.3066079, -0.1450544, 0, 0, 0, 1, 1,
-0.8784606, 1.010979, 0.2194515, 0, 0, 0, 1, 1,
-0.8780086, -2.283124, -1.712974, 0, 0, 0, 1, 1,
-0.8772793, -0.8800892, -1.639129, 0, 0, 0, 1, 1,
-0.8741525, 0.856917, 0.549327, 0, 0, 0, 1, 1,
-0.873471, -1.308263, -2.550448, 0, 0, 0, 1, 1,
-0.8715172, 0.0189455, -0.9904232, 0, 0, 0, 1, 1,
-0.8663329, -0.5080838, -3.087388, 1, 1, 1, 1, 1,
-0.8634415, 0.09780043, 0.237992, 1, 1, 1, 1, 1,
-0.8613505, 0.630638, -1.843935, 1, 1, 1, 1, 1,
-0.8606503, 0.2389875, -1.503567, 1, 1, 1, 1, 1,
-0.8602945, 0.6153725, 0.03724233, 1, 1, 1, 1, 1,
-0.8448179, 0.5411216, -0.7002612, 1, 1, 1, 1, 1,
-0.8381085, -1.588733, -1.320721, 1, 1, 1, 1, 1,
-0.8375945, 0.6035827, -0.7283145, 1, 1, 1, 1, 1,
-0.8267611, 1.055351, -0.04855186, 1, 1, 1, 1, 1,
-0.8264732, 1.076438, 0.2569126, 1, 1, 1, 1, 1,
-0.8203833, -1.06087, -0.7417957, 1, 1, 1, 1, 1,
-0.8186004, 0.1274698, -1.824817, 1, 1, 1, 1, 1,
-0.8172843, -1.125625, -3.962553, 1, 1, 1, 1, 1,
-0.8135543, 1.197476, -0.7492313, 1, 1, 1, 1, 1,
-0.813271, -0.3974114, -2.797989, 1, 1, 1, 1, 1,
-0.8072821, -0.5979192, -4.025199, 0, 0, 1, 1, 1,
-0.8069006, 0.8945848, -1.129384, 1, 0, 0, 1, 1,
-0.8058621, 0.03094054, -1.568534, 1, 0, 0, 1, 1,
-0.8049102, 0.4261998, 0.609869, 1, 0, 0, 1, 1,
-0.8039433, -0.8438967, -2.817829, 1, 0, 0, 1, 1,
-0.803615, 1.752407, -1.276062, 1, 0, 0, 1, 1,
-0.8033087, 0.9734297, -1.189195, 0, 0, 0, 1, 1,
-0.8018236, 1.511437, -0.3648711, 0, 0, 0, 1, 1,
-0.7930766, 1.681676, -0.07869067, 0, 0, 0, 1, 1,
-0.7794579, -0.1924578, -0.8192482, 0, 0, 0, 1, 1,
-0.7758245, 0.4256972, -1.877017, 0, 0, 0, 1, 1,
-0.7738325, 1.715674, -0.8969721, 0, 0, 0, 1, 1,
-0.767475, -0.08865824, -0.4163588, 0, 0, 0, 1, 1,
-0.7663944, -0.01939764, 0.3655483, 1, 1, 1, 1, 1,
-0.7659675, 1.00427, -1.725217, 1, 1, 1, 1, 1,
-0.7637083, -0.7115346, -2.681501, 1, 1, 1, 1, 1,
-0.7614678, -0.7092832, -1.499978, 1, 1, 1, 1, 1,
-0.754389, -0.2929242, -3.285662, 1, 1, 1, 1, 1,
-0.7437335, -2.195634, -1.80693, 1, 1, 1, 1, 1,
-0.7427273, 0.4986062, -0.1609693, 1, 1, 1, 1, 1,
-0.7414472, 0.84929, -0.567471, 1, 1, 1, 1, 1,
-0.7261115, 1.962444, -0.3683896, 1, 1, 1, 1, 1,
-0.7223547, 0.003237845, -0.1304738, 1, 1, 1, 1, 1,
-0.7191183, -1.016309, -2.772449, 1, 1, 1, 1, 1,
-0.7135675, -0.1099741, 0.09887574, 1, 1, 1, 1, 1,
-0.7128362, -1.253352, -3.631506, 1, 1, 1, 1, 1,
-0.7068254, 0.3151692, -0.8142217, 1, 1, 1, 1, 1,
-0.706574, 0.4589004, -2.306671, 1, 1, 1, 1, 1,
-0.7057566, -0.03800682, -1.329204, 0, 0, 1, 1, 1,
-0.7028605, 1.050917, -0.2213732, 1, 0, 0, 1, 1,
-0.7017453, 0.3306421, -3.180394, 1, 0, 0, 1, 1,
-0.6951829, 0.7412227, 0.590418, 1, 0, 0, 1, 1,
-0.6906182, 2.302726, -1.104721, 1, 0, 0, 1, 1,
-0.688927, -0.8113855, -2.444698, 1, 0, 0, 1, 1,
-0.6873294, 0.6544926, -2.314242, 0, 0, 0, 1, 1,
-0.6843889, -3.070551, -3.776009, 0, 0, 0, 1, 1,
-0.6835465, -0.2839548, -1.830005, 0, 0, 0, 1, 1,
-0.6815336, 0.6847699, 0.1597776, 0, 0, 0, 1, 1,
-0.6815172, 0.09850517, -1.21695, 0, 0, 0, 1, 1,
-0.6800457, -1.88947, -1.496061, 0, 0, 0, 1, 1,
-0.6794605, 0.3866458, 0.2065276, 0, 0, 0, 1, 1,
-0.6770639, -0.1597947, -1.505158, 1, 1, 1, 1, 1,
-0.6748275, 0.3933043, -0.2084984, 1, 1, 1, 1, 1,
-0.6655304, -0.6276816, -2.279414, 1, 1, 1, 1, 1,
-0.6653361, 0.5695316, -0.838482, 1, 1, 1, 1, 1,
-0.6642236, 2.193556, -0.7634299, 1, 1, 1, 1, 1,
-0.6642226, -0.4637296, -2.411789, 1, 1, 1, 1, 1,
-0.6632799, -0.2397517, -0.9874999, 1, 1, 1, 1, 1,
-0.6441757, -0.1775817, -2.287227, 1, 1, 1, 1, 1,
-0.6419256, -1.11266, -0.9472242, 1, 1, 1, 1, 1,
-0.6411474, 0.1606738, -0.4866279, 1, 1, 1, 1, 1,
-0.6408572, -0.6605982, -0.7694147, 1, 1, 1, 1, 1,
-0.6407236, 0.6065335, -2.940242, 1, 1, 1, 1, 1,
-0.636719, 0.3739389, -0.2348309, 1, 1, 1, 1, 1,
-0.634691, 1.210888, 0.08126196, 1, 1, 1, 1, 1,
-0.6337795, -0.2274766, -1.237732, 1, 1, 1, 1, 1,
-0.6294512, 0.9566299, 0.03787978, 0, 0, 1, 1, 1,
-0.625752, -0.9920031, 0.2689584, 1, 0, 0, 1, 1,
-0.6200908, -0.8132539, -1.663177, 1, 0, 0, 1, 1,
-0.619117, -0.4738346, -1.649439, 1, 0, 0, 1, 1,
-0.6166103, -0.4814605, -2.737637, 1, 0, 0, 1, 1,
-0.6154776, 0.2837063, -1.563213, 1, 0, 0, 1, 1,
-0.6139904, -0.2223515, -0.1847136, 0, 0, 0, 1, 1,
-0.609966, -0.07918166, -2.666189, 0, 0, 0, 1, 1,
-0.6086116, 1.305878, -2.365675, 0, 0, 0, 1, 1,
-0.6004976, 0.7812371, -0.4336047, 0, 0, 0, 1, 1,
-0.5990458, -0.05560853, -3.812948, 0, 0, 0, 1, 1,
-0.5965395, -0.8517267, -1.592664, 0, 0, 0, 1, 1,
-0.5935126, 0.7327009, -1.688368, 0, 0, 0, 1, 1,
-0.5881231, 0.02949676, -1.574192, 1, 1, 1, 1, 1,
-0.5826629, 0.1972215, -1.527899, 1, 1, 1, 1, 1,
-0.5791883, 0.998775, -0.3216839, 1, 1, 1, 1, 1,
-0.5765134, -0.5058554, -1.501964, 1, 1, 1, 1, 1,
-0.5759082, -0.709067, -3.041909, 1, 1, 1, 1, 1,
-0.5735593, 0.4123277, -1.532953, 1, 1, 1, 1, 1,
-0.5699084, 0.2049282, -1.002264, 1, 1, 1, 1, 1,
-0.5696303, 0.3097897, -1.396385, 1, 1, 1, 1, 1,
-0.5652098, 0.8844003, -1.095657, 1, 1, 1, 1, 1,
-0.5637631, 1.614005, 0.1407908, 1, 1, 1, 1, 1,
-0.5625708, -0.2578159, -3.261951, 1, 1, 1, 1, 1,
-0.5623165, 2.275296, 2.060264, 1, 1, 1, 1, 1,
-0.5581261, -2.931952, -3.099795, 1, 1, 1, 1, 1,
-0.554786, -1.089403, -1.190755, 1, 1, 1, 1, 1,
-0.5542154, 1.092529, 0.9941799, 1, 1, 1, 1, 1,
-0.5482048, 0.4189884, -0.6311293, 0, 0, 1, 1, 1,
-0.5471909, 0.2291817, -1.672138, 1, 0, 0, 1, 1,
-0.5468572, 0.08289837, -0.9207982, 1, 0, 0, 1, 1,
-0.5465479, 0.3519275, -0.8827796, 1, 0, 0, 1, 1,
-0.5409437, 1.21349, -1.580459, 1, 0, 0, 1, 1,
-0.5368329, -0.4821148, -2.486302, 1, 0, 0, 1, 1,
-0.5340052, -0.2574291, -1.180178, 0, 0, 0, 1, 1,
-0.5298949, 0.2263634, -0.6413106, 0, 0, 0, 1, 1,
-0.5272399, 0.4519321, -2.565461, 0, 0, 0, 1, 1,
-0.5244088, 0.4146065, -0.4858598, 0, 0, 0, 1, 1,
-0.5227791, -1.153244, 0.04944807, 0, 0, 0, 1, 1,
-0.5220758, -0.3152903, -0.5585626, 0, 0, 0, 1, 1,
-0.5185083, -1.22402, -2.523142, 0, 0, 0, 1, 1,
-0.5162939, 1.003809, 1.19374, 1, 1, 1, 1, 1,
-0.5156733, -0.713319, -1.865383, 1, 1, 1, 1, 1,
-0.514344, -0.608472, -2.219657, 1, 1, 1, 1, 1,
-0.5130702, 0.1164071, -1.670371, 1, 1, 1, 1, 1,
-0.4996547, 0.6433835, -0.5546387, 1, 1, 1, 1, 1,
-0.4975239, -0.6502957, -2.428945, 1, 1, 1, 1, 1,
-0.4971044, 0.566354, -1.136015, 1, 1, 1, 1, 1,
-0.4952761, 1.118405, 1.005495, 1, 1, 1, 1, 1,
-0.4941826, 1.04117, 0.03324265, 1, 1, 1, 1, 1,
-0.4898629, -0.2097038, -1.741377, 1, 1, 1, 1, 1,
-0.4879225, -0.4364167, -2.925434, 1, 1, 1, 1, 1,
-0.4873562, 0.1762695, -3.375324, 1, 1, 1, 1, 1,
-0.4865122, -0.7372698, -4.430646, 1, 1, 1, 1, 1,
-0.4855272, -0.05546531, -1.230098, 1, 1, 1, 1, 1,
-0.4841669, 0.05849911, -2.83026, 1, 1, 1, 1, 1,
-0.4815578, -0.9010385, -2.20526, 0, 0, 1, 1, 1,
-0.4814067, 0.9499717, -0.7804043, 1, 0, 0, 1, 1,
-0.4801942, -0.06845965, -2.079402, 1, 0, 0, 1, 1,
-0.4797177, -1.877045, -2.344141, 1, 0, 0, 1, 1,
-0.4788179, 0.419325, -0.2197656, 1, 0, 0, 1, 1,
-0.4783521, -0.4469301, -1.963918, 1, 0, 0, 1, 1,
-0.4781401, 1.56889, -0.06950907, 0, 0, 0, 1, 1,
-0.4776081, 0.2556566, -3.084475, 0, 0, 0, 1, 1,
-0.4751303, 0.1564884, -2.843445, 0, 0, 0, 1, 1,
-0.4727644, -1.228534, -3.240156, 0, 0, 0, 1, 1,
-0.467287, -0.8756775, -2.453037, 0, 0, 0, 1, 1,
-0.4669491, 1.925213, 1.343099, 0, 0, 0, 1, 1,
-0.4653944, -1.062815, -2.894651, 0, 0, 0, 1, 1,
-0.4642536, 0.8116946, -0.8471699, 1, 1, 1, 1, 1,
-0.4636568, -0.2250415, -1.1071, 1, 1, 1, 1, 1,
-0.4571991, 1.211005, -1.313264, 1, 1, 1, 1, 1,
-0.4566627, 1.052747, -0.6124619, 1, 1, 1, 1, 1,
-0.4540629, -0.3834855, -3.025293, 1, 1, 1, 1, 1,
-0.4533367, 0.9690204, -1.140221, 1, 1, 1, 1, 1,
-0.4527147, -0.2452413, -4.081086, 1, 1, 1, 1, 1,
-0.4471419, 1.016497, -0.3864706, 1, 1, 1, 1, 1,
-0.447052, 0.1855603, 0.2063687, 1, 1, 1, 1, 1,
-0.4470098, 0.2828387, -0.9439295, 1, 1, 1, 1, 1,
-0.4466748, -0.2613231, -2.580517, 1, 1, 1, 1, 1,
-0.444627, -0.7778766, -1.643927, 1, 1, 1, 1, 1,
-0.4436497, 0.2883619, 0.6426489, 1, 1, 1, 1, 1,
-0.4435044, 0.7444781, 0.2052039, 1, 1, 1, 1, 1,
-0.4423977, -0.6991218, -2.954611, 1, 1, 1, 1, 1,
-0.4423116, 0.2943978, -2.715114, 0, 0, 1, 1, 1,
-0.435719, -0.7130247, -2.368321, 1, 0, 0, 1, 1,
-0.4355643, 1.465294, -1.62482, 1, 0, 0, 1, 1,
-0.4311176, -1.68276, -3.204766, 1, 0, 0, 1, 1,
-0.4293109, 0.8574153, -1.301991, 1, 0, 0, 1, 1,
-0.4281885, 1.341481, -0.2868064, 1, 0, 0, 1, 1,
-0.426992, -0.9958447, -4.328277, 0, 0, 0, 1, 1,
-0.4231209, 0.8714914, -0.6378468, 0, 0, 0, 1, 1,
-0.4204628, 0.7957878, 0.1752043, 0, 0, 0, 1, 1,
-0.4200523, -1.289523, -4.264355, 0, 0, 0, 1, 1,
-0.4153314, 0.09753599, -1.105916, 0, 0, 0, 1, 1,
-0.4144734, -0.3844877, -3.142887, 0, 0, 0, 1, 1,
-0.4140255, -0.3588269, -3.166126, 0, 0, 0, 1, 1,
-0.4101716, 0.05980357, -0.7434655, 1, 1, 1, 1, 1,
-0.407956, 0.7231373, -2.211242, 1, 1, 1, 1, 1,
-0.4078833, 1.336759, 0.1103141, 1, 1, 1, 1, 1,
-0.4053598, -1.034779, -4.092209, 1, 1, 1, 1, 1,
-0.4008896, -3.540505, -2.378269, 1, 1, 1, 1, 1,
-0.394376, 0.3565923, 0.4946888, 1, 1, 1, 1, 1,
-0.3841922, -0.8715454, -0.9355117, 1, 1, 1, 1, 1,
-0.3807307, 0.511823, -0.8876458, 1, 1, 1, 1, 1,
-0.3798186, -0.009352794, -1.106312, 1, 1, 1, 1, 1,
-0.3783473, 2.801833, -0.4377453, 1, 1, 1, 1, 1,
-0.3766884, 0.1878476, -2.450701, 1, 1, 1, 1, 1,
-0.3757218, -1.120674, -1.46769, 1, 1, 1, 1, 1,
-0.3719245, 0.2035922, -2.021011, 1, 1, 1, 1, 1,
-0.3683138, 1.307094, 1.705393, 1, 1, 1, 1, 1,
-0.361602, 0.1092097, -2.376689, 1, 1, 1, 1, 1,
-0.3605952, 0.1321415, -2.094304, 0, 0, 1, 1, 1,
-0.3561867, -0.7496579, -0.367004, 1, 0, 0, 1, 1,
-0.3559661, 1.042228, 0.1674865, 1, 0, 0, 1, 1,
-0.3551163, 0.9144114, 0.8644491, 1, 0, 0, 1, 1,
-0.3488675, -0.8479189, -2.251885, 1, 0, 0, 1, 1,
-0.3476634, 0.1962424, -1.20592, 1, 0, 0, 1, 1,
-0.3467068, -0.9045112, -5.112483, 0, 0, 0, 1, 1,
-0.3441941, 2.108318, -0.5103916, 0, 0, 0, 1, 1,
-0.3404838, 0.4579706, 0.2197493, 0, 0, 0, 1, 1,
-0.3404828, 0.5274606, 1.33164, 0, 0, 0, 1, 1,
-0.3362881, -0.4558903, -3.081357, 0, 0, 0, 1, 1,
-0.3355325, -1.086612, -3.084927, 0, 0, 0, 1, 1,
-0.3349152, -0.8825386, -3.978472, 0, 0, 0, 1, 1,
-0.3331354, -1.29194, -4.023461, 1, 1, 1, 1, 1,
-0.3264519, -1.594299, -4.440817, 1, 1, 1, 1, 1,
-0.3258415, 1.191402, 0.1791027, 1, 1, 1, 1, 1,
-0.324509, -0.6296688, -2.175153, 1, 1, 1, 1, 1,
-0.3206721, 0.3926571, -0.6528075, 1, 1, 1, 1, 1,
-0.3206578, -0.3736281, -2.604689, 1, 1, 1, 1, 1,
-0.3200704, 0.4246164, -0.4166762, 1, 1, 1, 1, 1,
-0.3174038, -0.8227877, -1.299875, 1, 1, 1, 1, 1,
-0.3081201, 1.0318, -1.350165, 1, 1, 1, 1, 1,
-0.3047903, -1.684108, -3.708596, 1, 1, 1, 1, 1,
-0.2991162, 1.071651, 0.2507476, 1, 1, 1, 1, 1,
-0.2933153, 1.025823, 0.7381419, 1, 1, 1, 1, 1,
-0.2929506, -0.420949, -2.354626, 1, 1, 1, 1, 1,
-0.2840199, 0.1566425, -1.834714, 1, 1, 1, 1, 1,
-0.2805365, -0.686597, -1.677591, 1, 1, 1, 1, 1,
-0.2799499, -0.05271979, -0.6809835, 0, 0, 1, 1, 1,
-0.2798969, 0.963919, -0.6776935, 1, 0, 0, 1, 1,
-0.2784073, 0.8325246, -0.5706893, 1, 0, 0, 1, 1,
-0.2765042, 2.19411, 0.02552195, 1, 0, 0, 1, 1,
-0.2741534, 0.3392279, -0.01891959, 1, 0, 0, 1, 1,
-0.2695985, 0.6184903, 0.252827, 1, 0, 0, 1, 1,
-0.2686658, 0.2499845, -0.5962948, 0, 0, 0, 1, 1,
-0.2661416, -0.3607701, -3.114688, 0, 0, 0, 1, 1,
-0.2652192, 0.8570271, -0.9288077, 0, 0, 0, 1, 1,
-0.2629673, -0.5421388, -1.938402, 0, 0, 0, 1, 1,
-0.2619098, 0.9576448, -0.9252722, 0, 0, 0, 1, 1,
-0.2504436, -0.482594, -2.455115, 0, 0, 0, 1, 1,
-0.2420372, 0.8783974, -0.1348405, 0, 0, 0, 1, 1,
-0.2301786, -1.296316, -4.08812, 1, 1, 1, 1, 1,
-0.2243882, -1.228855, -4.272732, 1, 1, 1, 1, 1,
-0.2123712, 0.7311942, -0.2972257, 1, 1, 1, 1, 1,
-0.2081822, -0.4980322, -2.233419, 1, 1, 1, 1, 1,
-0.2076651, -1.513762, -3.420759, 1, 1, 1, 1, 1,
-0.2043075, -0.6005651, -2.490722, 1, 1, 1, 1, 1,
-0.1976653, 0.2547442, -0.7339655, 1, 1, 1, 1, 1,
-0.1975611, 0.4239909, 0.4262489, 1, 1, 1, 1, 1,
-0.1964907, -1.487369, -3.799554, 1, 1, 1, 1, 1,
-0.1960675, 0.45449, 0.360881, 1, 1, 1, 1, 1,
-0.1915118, -0.499561, -2.338356, 1, 1, 1, 1, 1,
-0.1893568, 0.3263018, 0.8917363, 1, 1, 1, 1, 1,
-0.1890366, -0.7367944, -1.776953, 1, 1, 1, 1, 1,
-0.1803827, 1.542898, -0.6555016, 1, 1, 1, 1, 1,
-0.1780797, 0.6581327, 0.5262804, 1, 1, 1, 1, 1,
-0.1688462, 0.185842, -0.1104002, 0, 0, 1, 1, 1,
-0.1681811, -1.546986, -1.409194, 1, 0, 0, 1, 1,
-0.1649402, 0.2043527, -1.740313, 1, 0, 0, 1, 1,
-0.1645315, -0.2364678, -2.216478, 1, 0, 0, 1, 1,
-0.1638075, -1.225409, -2.892653, 1, 0, 0, 1, 1,
-0.1637106, -0.7227333, -2.866049, 1, 0, 0, 1, 1,
-0.156604, -0.07256922, -0.7763072, 0, 0, 0, 1, 1,
-0.153938, -1.835724, -3.41033, 0, 0, 0, 1, 1,
-0.1495832, 0.027033, -0.7114163, 0, 0, 0, 1, 1,
-0.1488666, -1.146311, -2.022613, 0, 0, 0, 1, 1,
-0.1474449, -0.1405953, -3.282108, 0, 0, 0, 1, 1,
-0.1460908, -0.05014077, -2.052791, 0, 0, 0, 1, 1,
-0.1412789, -0.677101, -2.077941, 0, 0, 0, 1, 1,
-0.1407721, -0.2328005, -3.562772, 1, 1, 1, 1, 1,
-0.139866, -0.6703914, -2.096328, 1, 1, 1, 1, 1,
-0.1397439, 0.6894354, -0.8031325, 1, 1, 1, 1, 1,
-0.1389127, 0.3899759, -0.8405269, 1, 1, 1, 1, 1,
-0.1350353, -0.7368343, -4.096091, 1, 1, 1, 1, 1,
-0.1342887, -0.3455554, -2.676256, 1, 1, 1, 1, 1,
-0.1329492, -0.535531, -1.393843, 1, 1, 1, 1, 1,
-0.1314439, 0.611493, -1.363533, 1, 1, 1, 1, 1,
-0.130732, 0.2022864, -2.178965, 1, 1, 1, 1, 1,
-0.1276756, -0.3414223, -1.087181, 1, 1, 1, 1, 1,
-0.1247422, 0.4611409, -0.7020262, 1, 1, 1, 1, 1,
-0.1191708, -1.198141, -3.904166, 1, 1, 1, 1, 1,
-0.1120048, -1.389093, -2.288458, 1, 1, 1, 1, 1,
-0.1098949, 2.105381, -1.186783, 1, 1, 1, 1, 1,
-0.1082505, -0.02291652, -0.5016223, 1, 1, 1, 1, 1,
-0.1073065, -0.2094433, -2.939951, 0, 0, 1, 1, 1,
-0.1063227, 0.428465, -1.75861, 1, 0, 0, 1, 1,
-0.10235, -2.487473, -4.668371, 1, 0, 0, 1, 1,
-0.1007201, 0.5992698, -2.203872, 1, 0, 0, 1, 1,
-0.09886902, -0.4213084, -3.136259, 1, 0, 0, 1, 1,
-0.09755073, -1.945241, -4.471535, 1, 0, 0, 1, 1,
-0.09641806, 0.0605768, -1.5534, 0, 0, 0, 1, 1,
-0.09314901, -0.5336466, -4.88352, 0, 0, 0, 1, 1,
-0.09219886, -1.301845, -2.024392, 0, 0, 0, 1, 1,
-0.0915319, -0.4605764, -2.033095, 0, 0, 0, 1, 1,
-0.09097388, -0.9906183, -3.758792, 0, 0, 0, 1, 1,
-0.09086921, -0.7436695, -3.602557, 0, 0, 0, 1, 1,
-0.09025722, 0.6932692, 0.1843235, 0, 0, 0, 1, 1,
-0.08593086, -0.7472479, -3.174051, 1, 1, 1, 1, 1,
-0.08130087, 1.220523, 0.2887999, 1, 1, 1, 1, 1,
-0.07218871, -2.312992, -1.982582, 1, 1, 1, 1, 1,
-0.07183126, -1.282563, -2.426936, 1, 1, 1, 1, 1,
-0.07041118, 2.483577, 0.03636606, 1, 1, 1, 1, 1,
-0.07039402, -0.4821993, -3.337192, 1, 1, 1, 1, 1,
-0.06897243, -0.1205277, -4.137897, 1, 1, 1, 1, 1,
-0.06705558, -0.3220626, -4.519186, 1, 1, 1, 1, 1,
-0.06478704, 0.8351864, -0.4461806, 1, 1, 1, 1, 1,
-0.06435408, 1.227897, -1.781675, 1, 1, 1, 1, 1,
-0.0535518, 0.6545162, -0.221939, 1, 1, 1, 1, 1,
-0.05125979, -0.452371, -3.855059, 1, 1, 1, 1, 1,
-0.04779071, 1.468268, -1.159815, 1, 1, 1, 1, 1,
-0.0476111, 0.09512868, 0.1350712, 1, 1, 1, 1, 1,
-0.04689926, 0.1024575, 1.361542, 1, 1, 1, 1, 1,
-0.04518319, 0.6297337, -0.5616823, 0, 0, 1, 1, 1,
-0.04475649, -0.2667493, -2.263533, 1, 0, 0, 1, 1,
-0.04283696, -0.7588001, -1.669153, 1, 0, 0, 1, 1,
-0.0398562, -0.204565, -4.235532, 1, 0, 0, 1, 1,
-0.03908338, 1.420258, 2.39235, 1, 0, 0, 1, 1,
-0.03757143, -0.8727082, -4.528873, 1, 0, 0, 1, 1,
-0.02777969, -0.05201728, -1.82367, 0, 0, 0, 1, 1,
-0.02715161, -0.7133415, -2.990593, 0, 0, 0, 1, 1,
-0.0230087, -1.736695, -1.921401, 0, 0, 0, 1, 1,
-0.02111587, 2.705099, 1.282539, 0, 0, 0, 1, 1,
-0.01915868, 1.495483, 0.1872862, 0, 0, 0, 1, 1,
-0.01632439, -0.9079562, -2.269339, 0, 0, 0, 1, 1,
-0.01380902, -0.4186862, -3.026544, 0, 0, 0, 1, 1,
-0.01355287, 1.46042, -2.184484, 1, 1, 1, 1, 1,
-0.01306872, 0.1504742, -0.06278428, 1, 1, 1, 1, 1,
-0.01162829, -0.3962522, -2.839029, 1, 1, 1, 1, 1,
-0.01137425, 0.1519272, -1.009745, 1, 1, 1, 1, 1,
-0.0108164, -0.3322436, -2.44399, 1, 1, 1, 1, 1,
-0.008363262, -0.3872445, -2.501714, 1, 1, 1, 1, 1,
-0.008014742, 0.9189002, 0.5238447, 1, 1, 1, 1, 1,
-0.0053506, -0.7834431, -2.900353, 1, 1, 1, 1, 1,
-0.003844673, -1.158276, -4.233938, 1, 1, 1, 1, 1,
-0.003821797, 1.673318, 0.8559058, 1, 1, 1, 1, 1,
-0.0007062049, -0.2139513, -2.040601, 1, 1, 1, 1, 1,
0.0007135629, -0.8861578, 5.197159, 1, 1, 1, 1, 1,
0.002285238, -1.381193, 3.86861, 1, 1, 1, 1, 1,
0.005056376, -0.7126075, 4.17708, 1, 1, 1, 1, 1,
0.006660463, 1.062914, -1.290613, 1, 1, 1, 1, 1,
0.006920007, 0.9999646, 0.06774952, 0, 0, 1, 1, 1,
0.009396045, 0.6404762, 2.216266, 1, 0, 0, 1, 1,
0.0109846, 1.061171, -0.5580472, 1, 0, 0, 1, 1,
0.01441004, -0.3769288, 4.146766, 1, 0, 0, 1, 1,
0.01783456, -0.2076667, 2.674842, 1, 0, 0, 1, 1,
0.02128852, -1.105018, 3.564691, 1, 0, 0, 1, 1,
0.02306275, -0.8918853, 5.211598, 0, 0, 0, 1, 1,
0.02478707, 0.3499781, -0.4598714, 0, 0, 0, 1, 1,
0.02548852, -0.2584226, 2.613894, 0, 0, 0, 1, 1,
0.02581271, 1.544114, 0.3658533, 0, 0, 0, 1, 1,
0.02756698, -1.423505, 3.121636, 0, 0, 0, 1, 1,
0.0312451, 0.5203793, -0.8567235, 0, 0, 0, 1, 1,
0.0315242, -0.2528964, 3.837202, 0, 0, 0, 1, 1,
0.03394907, -0.5343925, 4.053551, 1, 1, 1, 1, 1,
0.03838564, -0.422785, 2.67478, 1, 1, 1, 1, 1,
0.04466596, -0.4242717, 1.685439, 1, 1, 1, 1, 1,
0.05037158, 0.147195, 1.144315, 1, 1, 1, 1, 1,
0.0548679, -0.1787992, 1.043586, 1, 1, 1, 1, 1,
0.06573868, -1.643001, 2.13183, 1, 1, 1, 1, 1,
0.06580326, -0.01554964, 1.695353, 1, 1, 1, 1, 1,
0.06731601, -0.6665485, 3.403008, 1, 1, 1, 1, 1,
0.06739743, -1.750708, 3.603088, 1, 1, 1, 1, 1,
0.07163009, 0.08253041, 1.159732, 1, 1, 1, 1, 1,
0.07568139, -0.6433107, 3.285073, 1, 1, 1, 1, 1,
0.0793871, 0.6371986, -0.422527, 1, 1, 1, 1, 1,
0.08116834, -0.5166414, 4.557305, 1, 1, 1, 1, 1,
0.08186563, -1.25429, 2.083555, 1, 1, 1, 1, 1,
0.0838196, 1.146649, 0.4068594, 1, 1, 1, 1, 1,
0.08441855, -0.3529845, 3.035443, 0, 0, 1, 1, 1,
0.08570296, -0.4562188, 1.746272, 1, 0, 0, 1, 1,
0.08737341, -0.5934574, 2.725034, 1, 0, 0, 1, 1,
0.08925044, 1.088501, -0.2142314, 1, 0, 0, 1, 1,
0.09340818, 0.7870397, 0.3728364, 1, 0, 0, 1, 1,
0.09550783, -0.945087, 2.417659, 1, 0, 0, 1, 1,
0.1006033, 0.01843461, 0.189641, 0, 0, 0, 1, 1,
0.1013108, -0.3696212, 3.045474, 0, 0, 0, 1, 1,
0.1019079, -2.002307, 2.382436, 0, 0, 0, 1, 1,
0.1035486, 1.357081, 1.704026, 0, 0, 0, 1, 1,
0.1043582, 0.2578595, 0.09192242, 0, 0, 0, 1, 1,
0.1078399, -0.1319301, 0.3061695, 0, 0, 0, 1, 1,
0.1086955, 0.532615, 0.3911798, 0, 0, 0, 1, 1,
0.1103056, 0.8230772, 0.8359341, 1, 1, 1, 1, 1,
0.1218536, -0.08495656, 1.608816, 1, 1, 1, 1, 1,
0.124187, -0.3474851, 1.977748, 1, 1, 1, 1, 1,
0.1331248, 1.556272, 0.5478132, 1, 1, 1, 1, 1,
0.1344269, 0.5148631, -0.02584441, 1, 1, 1, 1, 1,
0.1348729, -0.7808831, 2.550483, 1, 1, 1, 1, 1,
0.1361077, 0.2547499, -0.4747463, 1, 1, 1, 1, 1,
0.1361562, 0.7357699, 0.6407273, 1, 1, 1, 1, 1,
0.1397939, 0.02112428, 0.5896444, 1, 1, 1, 1, 1,
0.1403023, 0.9705466, 1.476033, 1, 1, 1, 1, 1,
0.1425886, 0.07337143, 2.976753, 1, 1, 1, 1, 1,
0.1434513, -0.6163983, 3.494314, 1, 1, 1, 1, 1,
0.1465725, 0.315578, 0.1754671, 1, 1, 1, 1, 1,
0.1483206, 2.581033, 2.683795, 1, 1, 1, 1, 1,
0.1540142, 0.1611049, 1.234752, 1, 1, 1, 1, 1,
0.1544848, -0.8434045, 1.751407, 0, 0, 1, 1, 1,
0.1547514, 0.6636493, 0.9894713, 1, 0, 0, 1, 1,
0.1592551, -0.3804902, 1.795718, 1, 0, 0, 1, 1,
0.1622884, -1.229371, 3.248144, 1, 0, 0, 1, 1,
0.1629747, -1.319168, 3.925643, 1, 0, 0, 1, 1,
0.164298, 0.411866, -1.502328, 1, 0, 0, 1, 1,
0.165381, 2.750206, 1.369772, 0, 0, 0, 1, 1,
0.1703692, 0.5051218, -1.005759, 0, 0, 0, 1, 1,
0.1706269, -0.8359006, 2.272419, 0, 0, 0, 1, 1,
0.1725403, -0.5823987, 2.722104, 0, 0, 0, 1, 1,
0.1736473, 0.4166264, 0.5295326, 0, 0, 0, 1, 1,
0.1737498, -0.4093396, 1.543559, 0, 0, 0, 1, 1,
0.1753519, -0.2357678, 3.012196, 0, 0, 0, 1, 1,
0.176955, 0.1648813, 1.106739, 1, 1, 1, 1, 1,
0.17722, 0.4932653, -0.0981828, 1, 1, 1, 1, 1,
0.1845835, -0.3502427, 2.339876, 1, 1, 1, 1, 1,
0.1849889, -0.7782285, 2.180114, 1, 1, 1, 1, 1,
0.1864471, -2.151904, 2.968868, 1, 1, 1, 1, 1,
0.1920821, 0.9915881, 0.7949142, 1, 1, 1, 1, 1,
0.1950139, -0.8460795, 2.002005, 1, 1, 1, 1, 1,
0.1976016, 1.068936, 0.8015687, 1, 1, 1, 1, 1,
0.1989036, 0.09919687, 0.755889, 1, 1, 1, 1, 1,
0.198928, -0.0003263754, 2.609602, 1, 1, 1, 1, 1,
0.1999564, 1.77828, -0.4122091, 1, 1, 1, 1, 1,
0.2006787, -0.7365109, 1.017409, 1, 1, 1, 1, 1,
0.2024214, -1.908994, 4.187918, 1, 1, 1, 1, 1,
0.2077675, -0.6262233, 2.556617, 1, 1, 1, 1, 1,
0.2167522, -0.2408325, -0.1138612, 1, 1, 1, 1, 1,
0.2190826, 0.6978961, -0.6707212, 0, 0, 1, 1, 1,
0.2195333, 0.4325771, 1.891191, 1, 0, 0, 1, 1,
0.2197462, -1.342595, 4.333744, 1, 0, 0, 1, 1,
0.2220948, -0.2811296, 1.21826, 1, 0, 0, 1, 1,
0.2225678, 0.1529271, 1.266508, 1, 0, 0, 1, 1,
0.2289445, -0.4282778, 0.4156673, 1, 0, 0, 1, 1,
0.2290476, -1.237573, 4.798801, 0, 0, 0, 1, 1,
0.2318126, 0.5431837, 1.568291, 0, 0, 0, 1, 1,
0.2336434, -0.6526666, 3.334817, 0, 0, 0, 1, 1,
0.2349564, 0.7141117, 0.9904368, 0, 0, 0, 1, 1,
0.2362789, -0.5862488, 3.138198, 0, 0, 0, 1, 1,
0.2364383, -0.05499234, -0.6005787, 0, 0, 0, 1, 1,
0.2407305, 1.191267, -1.254613, 0, 0, 0, 1, 1,
0.2407694, -0.8154862, 3.856484, 1, 1, 1, 1, 1,
0.243276, -0.1125347, 3.357604, 1, 1, 1, 1, 1,
0.2512066, 1.282054, 0.1116119, 1, 1, 1, 1, 1,
0.251552, -0.4597829, 2.633892, 1, 1, 1, 1, 1,
0.2516477, -0.3926683, 3.028536, 1, 1, 1, 1, 1,
0.2525762, 0.03609807, 0.5433885, 1, 1, 1, 1, 1,
0.2535132, -0.08282471, 1.485057, 1, 1, 1, 1, 1,
0.2536228, -0.6099061, 1.800689, 1, 1, 1, 1, 1,
0.2581589, -0.1753059, 1.946547, 1, 1, 1, 1, 1,
0.2612014, -1.28181, 1.659361, 1, 1, 1, 1, 1,
0.2628594, -1.524322, 3.643891, 1, 1, 1, 1, 1,
0.2661079, -1.780372, 4.275185, 1, 1, 1, 1, 1,
0.2744044, -1.183658, 2.488997, 1, 1, 1, 1, 1,
0.2757058, 0.6186278, -0.186118, 1, 1, 1, 1, 1,
0.2760572, 1.520792, 0.2384402, 1, 1, 1, 1, 1,
0.2763023, -0.6863357, 3.840331, 0, 0, 1, 1, 1,
0.2883132, 0.2642874, 1.852478, 1, 0, 0, 1, 1,
0.290137, 0.7047801, -1.114411, 1, 0, 0, 1, 1,
0.293477, -0.5550747, 3.565293, 1, 0, 0, 1, 1,
0.2950726, 2.137177, -0.9573532, 1, 0, 0, 1, 1,
0.302171, 1.116763, 0.02689536, 1, 0, 0, 1, 1,
0.3066153, 0.3670999, 0.9216319, 0, 0, 0, 1, 1,
0.3067608, 0.1311426, 2.717574, 0, 0, 0, 1, 1,
0.3073152, -0.329159, 1.553725, 0, 0, 0, 1, 1,
0.3104244, 1.040735, 1.813023, 0, 0, 0, 1, 1,
0.3134508, 0.4533101, 0.6607203, 0, 0, 0, 1, 1,
0.3135911, 0.3204798, 1.852632, 0, 0, 0, 1, 1,
0.3137289, -1.564961, 2.448778, 0, 0, 0, 1, 1,
0.315597, -0.1582467, 1.622186, 1, 1, 1, 1, 1,
0.3168123, 0.1237383, 1.072138, 1, 1, 1, 1, 1,
0.3186369, 0.3550654, 1.412317, 1, 1, 1, 1, 1,
0.3206266, -0.05464316, 1.23072, 1, 1, 1, 1, 1,
0.3216864, 0.6215972, 0.3183698, 1, 1, 1, 1, 1,
0.3236093, 0.5264873, 1.279326, 1, 1, 1, 1, 1,
0.3250749, -1.95161, 3.648163, 1, 1, 1, 1, 1,
0.3297074, 2.005131, 0.04123385, 1, 1, 1, 1, 1,
0.3307754, -1.359072, 2.936788, 1, 1, 1, 1, 1,
0.3399173, 0.7117426, -0.7826955, 1, 1, 1, 1, 1,
0.3409676, 1.117822, 0.9744026, 1, 1, 1, 1, 1,
0.3409743, -0.8626408, 3.31714, 1, 1, 1, 1, 1,
0.3458921, 1.628818, -0.3170742, 1, 1, 1, 1, 1,
0.3483235, -0.1205687, 1.967853, 1, 1, 1, 1, 1,
0.3516639, 0.8235227, -0.5322587, 1, 1, 1, 1, 1,
0.3547847, -1.919438, 3.360602, 0, 0, 1, 1, 1,
0.3566293, 0.7689288, -0.0225351, 1, 0, 0, 1, 1,
0.3605886, 0.7255653, -0.0816976, 1, 0, 0, 1, 1,
0.3641801, -0.5489798, 4.144984, 1, 0, 0, 1, 1,
0.3642166, 0.4282447, -0.6043599, 1, 0, 0, 1, 1,
0.369662, -0.1351015, 3.523207, 1, 0, 0, 1, 1,
0.373365, 1.045792, -1.263546, 0, 0, 0, 1, 1,
0.376403, -1.128616, 3.114852, 0, 0, 0, 1, 1,
0.376776, -0.6950954, 3.555726, 0, 0, 0, 1, 1,
0.3792768, -1.328445, 2.737836, 0, 0, 0, 1, 1,
0.3867853, -0.4851764, 1.424636, 0, 0, 0, 1, 1,
0.3885133, -0.7682424, 2.87959, 0, 0, 0, 1, 1,
0.3885548, -0.6515812, 4.242182, 0, 0, 0, 1, 1,
0.3891645, 1.034001, 1.161413, 1, 1, 1, 1, 1,
0.3898598, -0.6644921, 2.138598, 1, 1, 1, 1, 1,
0.3906332, 0.003969989, 1.229174, 1, 1, 1, 1, 1,
0.3917427, 0.8879001, 0.9895782, 1, 1, 1, 1, 1,
0.3950755, 0.8584697, -0.08844452, 1, 1, 1, 1, 1,
0.3977032, -0.8565397, 4.122937, 1, 1, 1, 1, 1,
0.399178, -1.271322, 1.311839, 1, 1, 1, 1, 1,
0.4008331, 0.04624302, -0.1642941, 1, 1, 1, 1, 1,
0.4013532, 0.3440745, 1.897489, 1, 1, 1, 1, 1,
0.4042123, 1.173691, -1.003158, 1, 1, 1, 1, 1,
0.4054594, -1.262141, 2.443135, 1, 1, 1, 1, 1,
0.4102264, -1.239668, 2.935371, 1, 1, 1, 1, 1,
0.4102564, 1.031613, 1.772891, 1, 1, 1, 1, 1,
0.4102666, -1.345573, 2.970747, 1, 1, 1, 1, 1,
0.4124383, -0.9954181, 1.686815, 1, 1, 1, 1, 1,
0.4148954, -1.207286, 2.227029, 0, 0, 1, 1, 1,
0.418792, -1.262533, 3.179503, 1, 0, 0, 1, 1,
0.4264134, 0.992022, 1.071301, 1, 0, 0, 1, 1,
0.4294644, -0.9280478, 3.086116, 1, 0, 0, 1, 1,
0.4298703, -0.1646924, 2.540086, 1, 0, 0, 1, 1,
0.4419076, 0.08656783, 1.176621, 1, 0, 0, 1, 1,
0.4423816, -1.734606, 2.604237, 0, 0, 0, 1, 1,
0.4435118, 0.2713059, 0.2054084, 0, 0, 0, 1, 1,
0.4490349, 0.8173188, 2.649464, 0, 0, 0, 1, 1,
0.4550171, 0.1952586, 2.551903, 0, 0, 0, 1, 1,
0.4632477, -0.4586577, 1.902317, 0, 0, 0, 1, 1,
0.4681649, 2.379619, 0.7711505, 0, 0, 0, 1, 1,
0.4690605, 0.3480586, 0.6306263, 0, 0, 0, 1, 1,
0.4735492, -0.329637, 1.742218, 1, 1, 1, 1, 1,
0.4755597, -1.550258, 1.366068, 1, 1, 1, 1, 1,
0.4765582, -0.9348223, 3.600609, 1, 1, 1, 1, 1,
0.4768349, 0.8271452, 1.328239, 1, 1, 1, 1, 1,
0.4769517, -0.9562116, 4.247816, 1, 1, 1, 1, 1,
0.4786091, 0.4567232, 3.696888, 1, 1, 1, 1, 1,
0.4790207, -1.102507, 2.158977, 1, 1, 1, 1, 1,
0.4817868, 1.051387, 0.4621521, 1, 1, 1, 1, 1,
0.4828612, 1.692276, 0.2489725, 1, 1, 1, 1, 1,
0.4842545, -0.6746949, 2.27445, 1, 1, 1, 1, 1,
0.4871384, 1.409821, 2.146683, 1, 1, 1, 1, 1,
0.4877865, 0.4079027, 1.123468, 1, 1, 1, 1, 1,
0.488971, -0.4949512, 1.565931, 1, 1, 1, 1, 1,
0.4903288, 0.2786128, 3.689327, 1, 1, 1, 1, 1,
0.4913165, 0.5314443, 1.224687, 1, 1, 1, 1, 1,
0.4973606, 0.5478577, 0.9167563, 0, 0, 1, 1, 1,
0.4978265, 2.399142, -0.831481, 1, 0, 0, 1, 1,
0.4987536, 0.2622744, -0.1108147, 1, 0, 0, 1, 1,
0.5017132, 0.01305288, 2.004276, 1, 0, 0, 1, 1,
0.509153, -0.7206592, 2.598376, 1, 0, 0, 1, 1,
0.5097576, 1.067256, 0.05151566, 1, 0, 0, 1, 1,
0.5098476, -1.347969, 3.184021, 0, 0, 0, 1, 1,
0.5105254, 0.5694074, 1.042145, 0, 0, 0, 1, 1,
0.514695, 0.3622367, 2.331993, 0, 0, 0, 1, 1,
0.5171515, 0.4287153, 1.352851, 0, 0, 0, 1, 1,
0.5181226, 0.3057221, 2.789805, 0, 0, 0, 1, 1,
0.5195468, 0.6924029, -0.1448057, 0, 0, 0, 1, 1,
0.5197369, 1.251332, 1.257635, 0, 0, 0, 1, 1,
0.5198315, -0.1041486, 1.568439, 1, 1, 1, 1, 1,
0.521147, -1.738658, 2.174564, 1, 1, 1, 1, 1,
0.5306187, -1.049137, 1.468452, 1, 1, 1, 1, 1,
0.5367868, -0.3623233, 3.470433, 1, 1, 1, 1, 1,
0.5433574, 0.7227466, 1.4277, 1, 1, 1, 1, 1,
0.5484747, 0.01657668, 0.5104051, 1, 1, 1, 1, 1,
0.549355, -0.1773185, 2.193009, 1, 1, 1, 1, 1,
0.5506305, 1.47278, -0.330691, 1, 1, 1, 1, 1,
0.5574881, -0.07425728, 0.3144662, 1, 1, 1, 1, 1,
0.5579544, 0.4311151, 1.446232, 1, 1, 1, 1, 1,
0.5687367, -1.443052, 3.301554, 1, 1, 1, 1, 1,
0.5716271, -0.09879775, 2.428296, 1, 1, 1, 1, 1,
0.5729381, 2.004912, 0.9188112, 1, 1, 1, 1, 1,
0.5804395, 0.2065089, 0.1057301, 1, 1, 1, 1, 1,
0.5835968, 0.2159795, 1.424183, 1, 1, 1, 1, 1,
0.5847922, -0.7459293, 2.312238, 0, 0, 1, 1, 1,
0.5884897, 0.2885494, 0.5859891, 1, 0, 0, 1, 1,
0.5886074, -2.026387, 1.912531, 1, 0, 0, 1, 1,
0.588709, 0.4581568, 1.293942, 1, 0, 0, 1, 1,
0.5916552, -0.9446682, 2.597588, 1, 0, 0, 1, 1,
0.5920256, 0.05349936, 1.774487, 1, 0, 0, 1, 1,
0.5929445, 0.06815896, 1.469532, 0, 0, 0, 1, 1,
0.5988885, -1.33732, 3.211743, 0, 0, 0, 1, 1,
0.6053831, -0.4108267, 3.911428, 0, 0, 0, 1, 1,
0.6089764, -2.743589, 3.040066, 0, 0, 0, 1, 1,
0.6108773, 0.3598297, 2.595184, 0, 0, 0, 1, 1,
0.6182075, -0.1334129, 0.6354512, 0, 0, 0, 1, 1,
0.6201171, 1.170997, 1.258329, 0, 0, 0, 1, 1,
0.6245966, -1.401236, 3.183518, 1, 1, 1, 1, 1,
0.6338078, 2.370511, 0.8668951, 1, 1, 1, 1, 1,
0.6346756, -2.02146, 2.236118, 1, 1, 1, 1, 1,
0.643198, 0.3436384, 0.3240307, 1, 1, 1, 1, 1,
0.6457072, 1.355697, -1.396558, 1, 1, 1, 1, 1,
0.6480557, -1.641927, 3.471287, 1, 1, 1, 1, 1,
0.6483292, -0.3467861, 1.827917, 1, 1, 1, 1, 1,
0.6485786, 0.03179596, -1.309143, 1, 1, 1, 1, 1,
0.6528426, 0.01466128, 1.284877, 1, 1, 1, 1, 1,
0.6560006, -1.138958, 3.796484, 1, 1, 1, 1, 1,
0.6579087, 0.402292, 1.890805, 1, 1, 1, 1, 1,
0.6590896, -1.042569, 3.055726, 1, 1, 1, 1, 1,
0.665545, 1.713431, -1.790391, 1, 1, 1, 1, 1,
0.6667141, 0.2394254, 0.2517704, 1, 1, 1, 1, 1,
0.670642, 0.7904134, 2.877984, 1, 1, 1, 1, 1,
0.6732451, -0.6955739, 2.134979, 0, 0, 1, 1, 1,
0.6751347, -0.1053987, 2.158274, 1, 0, 0, 1, 1,
0.6872371, -1.725965, 1.891425, 1, 0, 0, 1, 1,
0.6874576, 0.2568671, 1.770599, 1, 0, 0, 1, 1,
0.6877393, 0.8083535, 0.4509579, 1, 0, 0, 1, 1,
0.6930607, 0.09065485, 3.358245, 1, 0, 0, 1, 1,
0.6933083, 0.7162951, 0.7367922, 0, 0, 0, 1, 1,
0.6951424, -0.2912348, 2.085341, 0, 0, 0, 1, 1,
0.6954602, 0.3178785, 0.656736, 0, 0, 0, 1, 1,
0.6964082, 0.3915663, 0.02276975, 0, 0, 0, 1, 1,
0.6970918, -0.3658918, 3.884045, 0, 0, 0, 1, 1,
0.714981, -0.01965957, 0.9596164, 0, 0, 0, 1, 1,
0.7161583, 0.6420311, 2.782245, 0, 0, 0, 1, 1,
0.7209013, -0.4041698, 1.717161, 1, 1, 1, 1, 1,
0.7242712, -0.450594, 2.029446, 1, 1, 1, 1, 1,
0.7259629, 1.868618, -0.4371054, 1, 1, 1, 1, 1,
0.7297818, 0.8269942, 0.6487911, 1, 1, 1, 1, 1,
0.73206, 1.672201, 0.2575317, 1, 1, 1, 1, 1,
0.7427829, 0.5567374, 0.8008086, 1, 1, 1, 1, 1,
0.7442722, -0.5890413, 3.754137, 1, 1, 1, 1, 1,
0.7457047, -1.550777, 2.302426, 1, 1, 1, 1, 1,
0.7504502, 0.2186932, 1.849409, 1, 1, 1, 1, 1,
0.7522615, 1.321368, 1.117501, 1, 1, 1, 1, 1,
0.7588842, -0.5649714, 3.961173, 1, 1, 1, 1, 1,
0.7677622, 0.3265125, 1.555647, 1, 1, 1, 1, 1,
0.7766003, -0.9481905, 2.146199, 1, 1, 1, 1, 1,
0.7803934, 0.9166233, 0.9166067, 1, 1, 1, 1, 1,
0.7823446, -0.9282686, 2.382485, 1, 1, 1, 1, 1,
0.7860817, -1.829371, 3.674148, 0, 0, 1, 1, 1,
0.7936041, -1.077245, 2.983858, 1, 0, 0, 1, 1,
0.7947565, -0.9504629, 3.927974, 1, 0, 0, 1, 1,
0.7994833, -0.9934054, 3.57838, 1, 0, 0, 1, 1,
0.7999477, -0.3884768, 1.308188, 1, 0, 0, 1, 1,
0.8006388, 0.9832171, 0.5834935, 1, 0, 0, 1, 1,
0.8014464, -0.6981705, 1.801641, 0, 0, 0, 1, 1,
0.8105097, 1.457635, 0.7582558, 0, 0, 0, 1, 1,
0.8108005, -1.333481, 5.327879, 0, 0, 0, 1, 1,
0.8120569, -0.794885, 2.068616, 0, 0, 0, 1, 1,
0.8140209, -0.6994556, 2.804687, 0, 0, 0, 1, 1,
0.8243102, 0.9819313, 0.2131483, 0, 0, 0, 1, 1,
0.8256393, -0.8316442, 0.3071567, 0, 0, 0, 1, 1,
0.8272867, -0.6766995, 1.179516, 1, 1, 1, 1, 1,
0.8297763, -1.076373, 1.3591, 1, 1, 1, 1, 1,
0.8310592, 0.1607358, 0.6487781, 1, 1, 1, 1, 1,
0.8374116, -0.5790361, 0.4628788, 1, 1, 1, 1, 1,
0.8386641, -0.1394803, 3.430932, 1, 1, 1, 1, 1,
0.8422437, 0.2647302, 2.571913, 1, 1, 1, 1, 1,
0.8441032, -0.05499509, 1.588468, 1, 1, 1, 1, 1,
0.8454795, 1.168054, -0.9089614, 1, 1, 1, 1, 1,
0.8456416, 0.6731225, 1.389655, 1, 1, 1, 1, 1,
0.8466207, -0.8977235, 0.8194078, 1, 1, 1, 1, 1,
0.8472854, 0.2973885, 1.98873, 1, 1, 1, 1, 1,
0.8517038, -0.8105019, 1.230747, 1, 1, 1, 1, 1,
0.8538774, 0.6173952, -0.1536864, 1, 1, 1, 1, 1,
0.8545056, 0.2591365, 0.9666942, 1, 1, 1, 1, 1,
0.8556073, -0.1573827, 2.671598, 1, 1, 1, 1, 1,
0.8594096, -0.4660614, 1.221796, 0, 0, 1, 1, 1,
0.8641501, -0.5145535, 1.693858, 1, 0, 0, 1, 1,
0.8665586, 2.633248, 0.4688821, 1, 0, 0, 1, 1,
0.8677345, -0.8064609, 3.100922, 1, 0, 0, 1, 1,
0.871061, 1.041345, 0.9402174, 1, 0, 0, 1, 1,
0.8717136, -0.119983, 2.032002, 1, 0, 0, 1, 1,
0.8726785, -0.1184083, 1.686489, 0, 0, 0, 1, 1,
0.8803817, 1.255138, 0.9093652, 0, 0, 0, 1, 1,
0.8854209, -0.309587, 2.131961, 0, 0, 0, 1, 1,
0.8917934, -1.290794, 2.283855, 0, 0, 0, 1, 1,
0.8924146, -1.381725, 4.205268, 0, 0, 0, 1, 1,
0.8947619, 0.2028213, 3.70286, 0, 0, 0, 1, 1,
0.899621, -0.3532335, 2.73315, 0, 0, 0, 1, 1,
0.904156, 0.0553293, 0.3110715, 1, 1, 1, 1, 1,
0.9049557, -1.126634, 1.261124, 1, 1, 1, 1, 1,
0.9092808, -0.9847976, 1.878707, 1, 1, 1, 1, 1,
0.9116927, -0.2745427, 2.381604, 1, 1, 1, 1, 1,
0.9153043, 0.8935817, 0.863068, 1, 1, 1, 1, 1,
0.9211197, -1.108978, 0.5372372, 1, 1, 1, 1, 1,
0.9266295, 0.9891757, 0.5951305, 1, 1, 1, 1, 1,
0.9270854, 2.229122, 0.6951209, 1, 1, 1, 1, 1,
0.9289843, -0.9097905, 1.972354, 1, 1, 1, 1, 1,
0.9305457, -1.816162, 2.923656, 1, 1, 1, 1, 1,
0.9327158, -0.7906315, 4.357037, 1, 1, 1, 1, 1,
0.9329447, -0.2839763, 0.9702479, 1, 1, 1, 1, 1,
0.937526, -0.3588651, 1.524101, 1, 1, 1, 1, 1,
0.9420066, -0.005882014, 1.214298, 1, 1, 1, 1, 1,
0.9497014, -1.006523, 1.94196, 1, 1, 1, 1, 1,
0.9570132, 0.4164959, 2.027831, 0, 0, 1, 1, 1,
0.9593479, 1.556044, 1.471988, 1, 0, 0, 1, 1,
0.9597944, 0.2515555, 0.7306474, 1, 0, 0, 1, 1,
0.9604836, 0.9648857, 1.401021, 1, 0, 0, 1, 1,
0.971005, -1.166459, 3.19695, 1, 0, 0, 1, 1,
0.9745682, -1.05191, 3.038338, 1, 0, 0, 1, 1,
0.9758344, -0.6908273, 1.929984, 0, 0, 0, 1, 1,
0.9762428, 0.7562293, 0.3794672, 0, 0, 0, 1, 1,
0.977655, -1.002662, 2.038331, 0, 0, 0, 1, 1,
0.9789641, 1.14442, 1.864617, 0, 0, 0, 1, 1,
0.9813138, 1.172081, 2.730647, 0, 0, 0, 1, 1,
1.000742, -0.5388598, 3.803004, 0, 0, 0, 1, 1,
1.000953, -0.7223675, 2.395973, 0, 0, 0, 1, 1,
1.003786, -0.40011, 2.303108, 1, 1, 1, 1, 1,
1.004876, 0.7151336, 2.70528, 1, 1, 1, 1, 1,
1.00807, -0.1652681, 2.022144, 1, 1, 1, 1, 1,
1.011063, -0.9672294, 1.904736, 1, 1, 1, 1, 1,
1.024205, 0.2431554, -0.7421182, 1, 1, 1, 1, 1,
1.024274, 0.2598519, 1.500706, 1, 1, 1, 1, 1,
1.032138, 0.8725193, 2.315998, 1, 1, 1, 1, 1,
1.043504, 0.6821684, 0.3258377, 1, 1, 1, 1, 1,
1.048213, -2.772651, 2.611554, 1, 1, 1, 1, 1,
1.050634, -1.517199, 3.821918, 1, 1, 1, 1, 1,
1.053884, 0.9541588, 0.5974898, 1, 1, 1, 1, 1,
1.054475, -1.064887, 1.998685, 1, 1, 1, 1, 1,
1.060609, 0.4038888, 2.373083, 1, 1, 1, 1, 1,
1.065628, -0.5931754, 2.502346, 1, 1, 1, 1, 1,
1.068153, -1.293125, 2.01611, 1, 1, 1, 1, 1,
1.076881, 0.733619, 2.138454, 0, 0, 1, 1, 1,
1.077164, -0.3415557, 1.488225, 1, 0, 0, 1, 1,
1.079902, -0.6194156, 2.271883, 1, 0, 0, 1, 1,
1.085322, 0.7805635, 2.902853, 1, 0, 0, 1, 1,
1.089832, -0.5249421, 2.760366, 1, 0, 0, 1, 1,
1.093541, 0.760343, -0.3047439, 1, 0, 0, 1, 1,
1.09677, -0.3680173, 2.175738, 0, 0, 0, 1, 1,
1.101561, -0.7760382, 2.079581, 0, 0, 0, 1, 1,
1.102375, 0.2759218, 1.328882, 0, 0, 0, 1, 1,
1.102786, -0.8281422, 2.119712, 0, 0, 0, 1, 1,
1.104591, 1.070725, 0.8003358, 0, 0, 0, 1, 1,
1.109507, -0.7896088, 1.375183, 0, 0, 0, 1, 1,
1.112096, 0.297842, 2.298161, 0, 0, 0, 1, 1,
1.116583, 0.1925458, 1.250575, 1, 1, 1, 1, 1,
1.126607, 0.6940285, 0.6068376, 1, 1, 1, 1, 1,
1.133006, 0.1094383, -0.7745915, 1, 1, 1, 1, 1,
1.150094, -1.426584, 3.546975, 1, 1, 1, 1, 1,
1.15036, -0.5664192, 0.1640035, 1, 1, 1, 1, 1,
1.150379, 1.263382, 0.5016475, 1, 1, 1, 1, 1,
1.159808, 1.192338, -1.209269, 1, 1, 1, 1, 1,
1.180926, -0.4407374, 1.661667, 1, 1, 1, 1, 1,
1.182542, -0.2631235, 1.833093, 1, 1, 1, 1, 1,
1.184593, -1.279074, 2.402479, 1, 1, 1, 1, 1,
1.19911, -0.2452272, 1.251698, 1, 1, 1, 1, 1,
1.204235, -0.4011792, 3.947896, 1, 1, 1, 1, 1,
1.211038, -0.6952889, 2.370372, 1, 1, 1, 1, 1,
1.212018, -1.838147, 3.659175, 1, 1, 1, 1, 1,
1.220918, 1.148556, 0.04623943, 1, 1, 1, 1, 1,
1.22984, -1.462888, 2.496733, 0, 0, 1, 1, 1,
1.244157, -0.1648505, 1.901873, 1, 0, 0, 1, 1,
1.244795, 1.740864, 0.3699504, 1, 0, 0, 1, 1,
1.245055, -0.1154896, 0.9887407, 1, 0, 0, 1, 1,
1.260177, -1.639441, 2.081951, 1, 0, 0, 1, 1,
1.261004, 2.591714, -0.3565455, 1, 0, 0, 1, 1,
1.264388, 0.6047197, 0.1199138, 0, 0, 0, 1, 1,
1.268172, 0.5070806, 0.66245, 0, 0, 0, 1, 1,
1.268796, -0.2928202, 1.679355, 0, 0, 0, 1, 1,
1.273553, -0.4841387, 2.955242, 0, 0, 0, 1, 1,
1.273636, 0.2203706, 2.303409, 0, 0, 0, 1, 1,
1.276785, 0.09173364, 3.781573, 0, 0, 0, 1, 1,
1.280441, -0.8640782, 1.281199, 0, 0, 0, 1, 1,
1.294927, -1.014056, 1.961544, 1, 1, 1, 1, 1,
1.305374, 0.3071042, 2.095958, 1, 1, 1, 1, 1,
1.321959, -0.3282078, 1.880496, 1, 1, 1, 1, 1,
1.32767, -1.903924, 0.4847859, 1, 1, 1, 1, 1,
1.327796, -0.8195677, 1.457629, 1, 1, 1, 1, 1,
1.334712, -0.8703485, 2.974821, 1, 1, 1, 1, 1,
1.354275, -0.1528007, 1.452788, 1, 1, 1, 1, 1,
1.369483, 0.1153604, 1.15895, 1, 1, 1, 1, 1,
1.384434, 0.08337647, 3.308851, 1, 1, 1, 1, 1,
1.384687, 1.339377, -0.8838339, 1, 1, 1, 1, 1,
1.387398, -0.4856189, 3.49078, 1, 1, 1, 1, 1,
1.398082, -0.1593617, 1.58718, 1, 1, 1, 1, 1,
1.399133, -0.05912625, 1.629173, 1, 1, 1, 1, 1,
1.40171, -0.393792, 1.578408, 1, 1, 1, 1, 1,
1.402694, 0.07318556, 0.4059813, 1, 1, 1, 1, 1,
1.4163, 0.08915886, 2.516911, 0, 0, 1, 1, 1,
1.424173, -0.8957908, 4.492173, 1, 0, 0, 1, 1,
1.427291, 0.2893313, 2.604177, 1, 0, 0, 1, 1,
1.430176, -1.1657, 3.275703, 1, 0, 0, 1, 1,
1.435624, 0.2051779, 1.212829, 1, 0, 0, 1, 1,
1.444454, -1.954096, 0.0281828, 1, 0, 0, 1, 1,
1.44994, 0.3824013, 1.65135, 0, 0, 0, 1, 1,
1.458645, -0.6271515, 2.246581, 0, 0, 0, 1, 1,
1.480502, -0.02053516, 1.854444, 0, 0, 0, 1, 1,
1.485272, 0.04431726, 1.517035, 0, 0, 0, 1, 1,
1.488975, 0.2962779, 1.458861, 0, 0, 0, 1, 1,
1.493261, 0.5510554, 1.514565, 0, 0, 0, 1, 1,
1.494165, 1.121591, 1.14785, 0, 0, 0, 1, 1,
1.507211, -1.452582, -0.1158486, 1, 1, 1, 1, 1,
1.51037, -1.524243, 0.3953534, 1, 1, 1, 1, 1,
1.513212, 0.2428795, 1.105754, 1, 1, 1, 1, 1,
1.519218, 0.8737202, 2.642443, 1, 1, 1, 1, 1,
1.521547, -0.7829891, 3.745936, 1, 1, 1, 1, 1,
1.524762, -0.287225, 1.403768, 1, 1, 1, 1, 1,
1.549596, 0.420767, 1.213112, 1, 1, 1, 1, 1,
1.556404, 0.05986688, 0.2881402, 1, 1, 1, 1, 1,
1.556872, 1.05283, 2.338443, 1, 1, 1, 1, 1,
1.568071, -0.3337234, 3.130606, 1, 1, 1, 1, 1,
1.586564, -0.6857733, 1.603014, 1, 1, 1, 1, 1,
1.587522, -1.179196, 1.066501, 1, 1, 1, 1, 1,
1.587685, -1.190153, 2.060969, 1, 1, 1, 1, 1,
1.590275, 0.646377, 1.938352, 1, 1, 1, 1, 1,
1.597142, 1.17978, 1.136224, 1, 1, 1, 1, 1,
1.602063, 1.371474, 1.232969, 0, 0, 1, 1, 1,
1.604242, -0.3470242, 2.154307, 1, 0, 0, 1, 1,
1.612057, 0.671829, -0.8115188, 1, 0, 0, 1, 1,
1.620241, -0.1168426, 0.7429622, 1, 0, 0, 1, 1,
1.629358, 1.177158, 0.9291486, 1, 0, 0, 1, 1,
1.630925, -2.49461, 1.90912, 1, 0, 0, 1, 1,
1.634711, 1.123061, -0.4639731, 0, 0, 0, 1, 1,
1.643998, 1.125499, 1.146212, 0, 0, 0, 1, 1,
1.650435, 0.1495644, 2.80391, 0, 0, 0, 1, 1,
1.651957, 0.2134328, 1.119029, 0, 0, 0, 1, 1,
1.653829, -1.240439, 2.423008, 0, 0, 0, 1, 1,
1.673249, -0.1203919, 3.933857, 0, 0, 0, 1, 1,
1.675423, -0.8313242, 2.178857, 0, 0, 0, 1, 1,
1.677063, 0.2595428, 0.9746217, 1, 1, 1, 1, 1,
1.680199, 0.001480045, 1.551893, 1, 1, 1, 1, 1,
1.681619, -0.7609748, 2.25795, 1, 1, 1, 1, 1,
1.693039, -0.8422303, 1.339314, 1, 1, 1, 1, 1,
1.746745, 0.1777884, 0.870638, 1, 1, 1, 1, 1,
1.749488, 0.4446625, 2.351717, 1, 1, 1, 1, 1,
1.751766, 1.092763, -0.0622578, 1, 1, 1, 1, 1,
1.76653, 1.850895, 1.474751, 1, 1, 1, 1, 1,
1.803039, 1.077555, 2.163486, 1, 1, 1, 1, 1,
1.810497, 0.3893782, 1.671262, 1, 1, 1, 1, 1,
1.817824, 2.186348, -0.2098908, 1, 1, 1, 1, 1,
1.84074, -0.6087837, 1.168871, 1, 1, 1, 1, 1,
1.918749, 0.02465696, 1.393333, 1, 1, 1, 1, 1,
1.954794, -1.800503, 3.499068, 1, 1, 1, 1, 1,
2.001626, -0.876506, 3.212063, 1, 1, 1, 1, 1,
2.01262, 0.2476657, 2.351204, 0, 0, 1, 1, 1,
2.02623, 0.7102029, 0.5003133, 1, 0, 0, 1, 1,
2.038194, 2.088273, 0.3255069, 1, 0, 0, 1, 1,
2.067313, 0.4002365, 2.381746, 1, 0, 0, 1, 1,
2.080958, 0.8386265, 1.40715, 1, 0, 0, 1, 1,
2.149445, -0.3484598, 2.485666, 1, 0, 0, 1, 1,
2.166934, -0.7911168, 1.637335, 0, 0, 0, 1, 1,
2.235286, -0.9756347, 2.134264, 0, 0, 0, 1, 1,
2.23799, 0.2502337, 0.4263591, 0, 0, 0, 1, 1,
2.272532, -0.5614593, 3.555177, 0, 0, 0, 1, 1,
2.359171, 1.057117, 1.325994, 0, 0, 0, 1, 1,
2.376353, -1.05556, 2.241489, 0, 0, 0, 1, 1,
2.573262, -0.1465002, 2.599371, 0, 0, 0, 1, 1,
2.684635, 0.3023343, -0.26471, 1, 1, 1, 1, 1,
2.691873, 0.3414362, 1.991768, 1, 1, 1, 1, 1,
2.731341, -1.432853, 2.846418, 1, 1, 1, 1, 1,
2.734641, 1.417691, 1.70578, 1, 1, 1, 1, 1,
2.745671, 0.6721563, 0.6583382, 1, 1, 1, 1, 1,
2.765767, 0.567359, 1.577533, 1, 1, 1, 1, 1,
3.003267, -0.01064354, 2.697696, 1, 1, 1, 1, 1
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
var radius = 9.280523;
var distance = 32.59744;
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
mvMatrix.translate( -0.1185586, 0.3693357, -0.107698 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.59744);
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