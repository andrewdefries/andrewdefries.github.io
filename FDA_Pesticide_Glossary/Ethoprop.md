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
-3.754273, -0.2540881, -0.6436852, 1, 0, 0, 1,
-2.656079, -0.1988043, -1.242688, 1, 0.007843138, 0, 1,
-2.646532, -1.732043, -1.870228, 1, 0.01176471, 0, 1,
-2.628983, 0.05869805, -2.211368, 1, 0.01960784, 0, 1,
-2.589888, 2.021819, 0.2152573, 1, 0.02352941, 0, 1,
-2.438459, 0.7890133, 0.06075922, 1, 0.03137255, 0, 1,
-2.399652, 1.387625, -0.2363594, 1, 0.03529412, 0, 1,
-2.362984, -1.213409, -3.123749, 1, 0.04313726, 0, 1,
-2.340612, -1.965601, -0.7512538, 1, 0.04705882, 0, 1,
-2.311348, -0.2672803, -3.498664, 1, 0.05490196, 0, 1,
-2.28397, 1.089818, 0.238372, 1, 0.05882353, 0, 1,
-2.250078, -0.2833995, -2.404265, 1, 0.06666667, 0, 1,
-2.201846, -0.6576384, -2.243881, 1, 0.07058824, 0, 1,
-2.154458, 1.097586, -2.562051, 1, 0.07843138, 0, 1,
-2.115792, 0.4611152, -2.25076, 1, 0.08235294, 0, 1,
-2.044205, -0.3226959, -3.162492, 1, 0.09019608, 0, 1,
-1.999982, -0.1674244, -2.094068, 1, 0.09411765, 0, 1,
-1.998777, -1.258221, -3.899891, 1, 0.1019608, 0, 1,
-1.988698, 0.564716, -0.3029284, 1, 0.1098039, 0, 1,
-1.956709, 0.2822567, -1.53618, 1, 0.1137255, 0, 1,
-1.948564, -1.729761, -2.875557, 1, 0.1215686, 0, 1,
-1.944672, 0.09587342, -1.76405, 1, 0.1254902, 0, 1,
-1.943169, 1.196074, -0.9024105, 1, 0.1333333, 0, 1,
-1.914896, -0.2373647, -0.2950048, 1, 0.1372549, 0, 1,
-1.869683, -0.9411984, -2.280982, 1, 0.145098, 0, 1,
-1.846948, -0.4939653, -2.394716, 1, 0.1490196, 0, 1,
-1.845396, -0.3292354, -2.544914, 1, 0.1568628, 0, 1,
-1.823326, 1.741447, -0.4835973, 1, 0.1607843, 0, 1,
-1.820154, -0.6881831, 0.01405341, 1, 0.1686275, 0, 1,
-1.806193, -1.263157, -1.974438, 1, 0.172549, 0, 1,
-1.792324, -2.724377, -2.776045, 1, 0.1803922, 0, 1,
-1.781749, -1.876193, -1.79514, 1, 0.1843137, 0, 1,
-1.760265, 1.090347, -1.41233, 1, 0.1921569, 0, 1,
-1.754144, -0.157315, -0.7845796, 1, 0.1960784, 0, 1,
-1.746356, 0.01123086, -3.022161, 1, 0.2039216, 0, 1,
-1.737862, -0.4757641, -2.709116, 1, 0.2117647, 0, 1,
-1.729699, 0.5026563, -3.345639, 1, 0.2156863, 0, 1,
-1.72782, 0.8096163, -1.116959, 1, 0.2235294, 0, 1,
-1.713168, 1.035763, -0.3240024, 1, 0.227451, 0, 1,
-1.710037, -1.078764, -1.574243, 1, 0.2352941, 0, 1,
-1.708864, -0.1566241, -2.089722, 1, 0.2392157, 0, 1,
-1.698147, -1.235192, -2.882766, 1, 0.2470588, 0, 1,
-1.695066, 1.437985, 0.575455, 1, 0.2509804, 0, 1,
-1.683256, -0.2554075, -1.419458, 1, 0.2588235, 0, 1,
-1.653679, 0.6349763, -2.464065, 1, 0.2627451, 0, 1,
-1.651065, 1.006394, -0.8437827, 1, 0.2705882, 0, 1,
-1.646597, 0.3011928, -0.8507542, 1, 0.2745098, 0, 1,
-1.637001, -1.550384, -2.459811, 1, 0.282353, 0, 1,
-1.631561, 0.4057174, -1.991436, 1, 0.2862745, 0, 1,
-1.630148, -0.07287268, -3.167438, 1, 0.2941177, 0, 1,
-1.621245, -0.1235516, -2.24099, 1, 0.3019608, 0, 1,
-1.591031, -2.349938, -3.32484, 1, 0.3058824, 0, 1,
-1.590706, 0.04358755, -0.6936026, 1, 0.3137255, 0, 1,
-1.546589, 0.1223627, -0.3162318, 1, 0.3176471, 0, 1,
-1.53688, -0.6341018, -2.205005, 1, 0.3254902, 0, 1,
-1.527986, 2.222532, 1.661629, 1, 0.3294118, 0, 1,
-1.527841, -0.2677394, -0.3405495, 1, 0.3372549, 0, 1,
-1.512084, 1.406133, 0.1298042, 1, 0.3411765, 0, 1,
-1.507461, 0.8306894, -1.7639, 1, 0.3490196, 0, 1,
-1.503904, -0.4815682, -0.7220864, 1, 0.3529412, 0, 1,
-1.501499, 1.71908, -0.6178812, 1, 0.3607843, 0, 1,
-1.48788, -1.270257, -2.572865, 1, 0.3647059, 0, 1,
-1.4667, -2.127107, -2.439409, 1, 0.372549, 0, 1,
-1.460098, 0.1977306, -2.145, 1, 0.3764706, 0, 1,
-1.457066, -0.1760522, -3.446392, 1, 0.3843137, 0, 1,
-1.443358, -0.4865138, -0.7424224, 1, 0.3882353, 0, 1,
-1.4244, 2.073751, -0.3244109, 1, 0.3960784, 0, 1,
-1.422866, 0.3249728, -3.174163, 1, 0.4039216, 0, 1,
-1.411328, 0.4426832, 0.4654242, 1, 0.4078431, 0, 1,
-1.403494, -1.70437, -1.229074, 1, 0.4156863, 0, 1,
-1.381952, 0.4232539, -0.1383291, 1, 0.4196078, 0, 1,
-1.373685, -0.3412132, -0.8617318, 1, 0.427451, 0, 1,
-1.372167, -0.06767629, -1.502767, 1, 0.4313726, 0, 1,
-1.367798, -0.1810861, -1.460697, 1, 0.4392157, 0, 1,
-1.360536, 0.07870965, -2.073275, 1, 0.4431373, 0, 1,
-1.349468, 1.858045, -0.1039147, 1, 0.4509804, 0, 1,
-1.339412, -0.5128741, -0.9092894, 1, 0.454902, 0, 1,
-1.33679, -0.8943142, -2.098062, 1, 0.4627451, 0, 1,
-1.329152, 0.5276397, -1.331135, 1, 0.4666667, 0, 1,
-1.324832, -0.4249178, -0.7384898, 1, 0.4745098, 0, 1,
-1.323702, -0.729045, -2.446593, 1, 0.4784314, 0, 1,
-1.305541, -0.1896638, -2.027458, 1, 0.4862745, 0, 1,
-1.301922, -1.062639, -1.74026, 1, 0.4901961, 0, 1,
-1.301148, 0.6281203, -1.297099, 1, 0.4980392, 0, 1,
-1.295348, -1.723607, -3.900776, 1, 0.5058824, 0, 1,
-1.279611, 0.1536897, -3.760103, 1, 0.509804, 0, 1,
-1.267707, -1.8731, -3.513885, 1, 0.5176471, 0, 1,
-1.266017, 0.5653061, 0.6760929, 1, 0.5215687, 0, 1,
-1.264455, 0.2600252, 0.2147121, 1, 0.5294118, 0, 1,
-1.25879, 1.193243, -1.523452, 1, 0.5333334, 0, 1,
-1.2549, 0.1081314, -0.9236646, 1, 0.5411765, 0, 1,
-1.250661, -1.771008, -2.045107, 1, 0.5450981, 0, 1,
-1.244796, -0.670473, -1.728339, 1, 0.5529412, 0, 1,
-1.243683, -0.2998658, -1.97893, 1, 0.5568628, 0, 1,
-1.243408, -1.17391, -4.298934, 1, 0.5647059, 0, 1,
-1.241487, -0.7523731, -3.265525, 1, 0.5686275, 0, 1,
-1.233735, -1.102595, 0.8792463, 1, 0.5764706, 0, 1,
-1.22506, 1.389879, -0.6481944, 1, 0.5803922, 0, 1,
-1.223018, 1.40855, -0.6691871, 1, 0.5882353, 0, 1,
-1.222857, -0.832688, -4.004428, 1, 0.5921569, 0, 1,
-1.214754, 0.6093569, 0.1052828, 1, 0.6, 0, 1,
-1.214515, 1.16429, 0.9196675, 1, 0.6078432, 0, 1,
-1.209805, 0.6140198, 0.7200977, 1, 0.6117647, 0, 1,
-1.19816, -0.982626, -0.9708028, 1, 0.6196079, 0, 1,
-1.19636, -0.6699269, -3.149297, 1, 0.6235294, 0, 1,
-1.18421, 0.06970798, -0.1574514, 1, 0.6313726, 0, 1,
-1.174891, -0.2220005, -1.901106, 1, 0.6352941, 0, 1,
-1.174624, 0.4487298, -2.821665, 1, 0.6431373, 0, 1,
-1.171132, 0.3631596, -0.2553737, 1, 0.6470588, 0, 1,
-1.153585, -1.017205, -2.600398, 1, 0.654902, 0, 1,
-1.146055, -0.06747875, -2.631489, 1, 0.6588235, 0, 1,
-1.144466, 1.10043, -0.3908363, 1, 0.6666667, 0, 1,
-1.137778, 0.2563622, -0.7093204, 1, 0.6705883, 0, 1,
-1.131165, -0.6431355, -0.6910425, 1, 0.6784314, 0, 1,
-1.129792, -0.42463, -0.5546916, 1, 0.682353, 0, 1,
-1.118444, 0.2540577, -1.988733, 1, 0.6901961, 0, 1,
-1.103548, -1.679944, -2.97612, 1, 0.6941177, 0, 1,
-1.101572, -2.404469, -1.101644, 1, 0.7019608, 0, 1,
-1.092732, 0.640992, -1.494418, 1, 0.7098039, 0, 1,
-1.084507, -0.4407496, -1.217412, 1, 0.7137255, 0, 1,
-1.076571, -1.514898, -2.626709, 1, 0.7215686, 0, 1,
-1.071489, -0.3442442, -0.8660577, 1, 0.7254902, 0, 1,
-1.063841, 0.204504, -1.624044, 1, 0.7333333, 0, 1,
-1.061389, -0.5949931, 0.3245685, 1, 0.7372549, 0, 1,
-1.05639, -0.103574, -2.644377, 1, 0.7450981, 0, 1,
-1.048104, 0.6933253, -1.213156, 1, 0.7490196, 0, 1,
-1.03678, -0.2479566, -1.877865, 1, 0.7568628, 0, 1,
-1.023256, -1.224671, -2.267217, 1, 0.7607843, 0, 1,
-1.013476, -0.442039, -2.542297, 1, 0.7686275, 0, 1,
-0.9996463, 0.338896, -1.410347, 1, 0.772549, 0, 1,
-0.9995617, 1.745283, -0.4990624, 1, 0.7803922, 0, 1,
-0.9978253, 1.600455, -0.469198, 1, 0.7843137, 0, 1,
-0.9971134, -1.441704, -1.555764, 1, 0.7921569, 0, 1,
-0.9961642, 0.4722982, -0.5848806, 1, 0.7960784, 0, 1,
-0.9949493, 1.238954, -0.2812729, 1, 0.8039216, 0, 1,
-0.9876701, -0.9228818, -2.091701, 1, 0.8117647, 0, 1,
-0.9854499, -1.256741, -4.228042, 1, 0.8156863, 0, 1,
-0.9795879, -0.03772223, -1.795879, 1, 0.8235294, 0, 1,
-0.9772075, -0.3772472, -1.840662, 1, 0.827451, 0, 1,
-0.9735717, -0.235329, -1.336211, 1, 0.8352941, 0, 1,
-0.9696524, 0.03006706, -1.474961, 1, 0.8392157, 0, 1,
-0.9662585, -1.453834, -4.581057, 1, 0.8470588, 0, 1,
-0.9657337, -0.6468754, -2.671589, 1, 0.8509804, 0, 1,
-0.9655149, 0.3798528, -0.8950649, 1, 0.8588235, 0, 1,
-0.9610164, -0.8491772, -3.691631, 1, 0.8627451, 0, 1,
-0.9609959, -2.738967, 0.3024013, 1, 0.8705882, 0, 1,
-0.9548102, -1.11041, -3.810873, 1, 0.8745098, 0, 1,
-0.9516363, -0.5626313, -0.9799728, 1, 0.8823529, 0, 1,
-0.9506356, -1.396547, -1.803405, 1, 0.8862745, 0, 1,
-0.9427116, -0.3994928, -2.171257, 1, 0.8941177, 0, 1,
-0.9363058, -1.294318, -4.198833, 1, 0.8980392, 0, 1,
-0.9333301, 0.3273232, -2.587428, 1, 0.9058824, 0, 1,
-0.9242033, 0.5308771, -1.140014, 1, 0.9137255, 0, 1,
-0.9226656, -0.8060746, -2.065428, 1, 0.9176471, 0, 1,
-0.9174761, -0.847528, -3.569762, 1, 0.9254902, 0, 1,
-0.9173239, -0.4649643, -2.552444, 1, 0.9294118, 0, 1,
-0.9114016, -0.9642773, -1.391445, 1, 0.9372549, 0, 1,
-0.9092017, -1.536996, -2.23129, 1, 0.9411765, 0, 1,
-0.9036131, -0.4342871, -2.294648, 1, 0.9490196, 0, 1,
-0.8981265, -0.5939756, -0.9641249, 1, 0.9529412, 0, 1,
-0.8967254, 0.5311368, -0.5718463, 1, 0.9607843, 0, 1,
-0.8953713, -0.3329594, -1.877542, 1, 0.9647059, 0, 1,
-0.891534, -0.5881832, -2.757071, 1, 0.972549, 0, 1,
-0.8906068, 0.8954203, -1.990713, 1, 0.9764706, 0, 1,
-0.8891309, 1.033127, 0.4606302, 1, 0.9843137, 0, 1,
-0.8875683, 0.1417286, -2.195262, 1, 0.9882353, 0, 1,
-0.885384, -0.777544, -1.194633, 1, 0.9960784, 0, 1,
-0.8837582, -0.8336942, -1.004292, 0.9960784, 1, 0, 1,
-0.8829241, 1.229974, 1.577681, 0.9921569, 1, 0, 1,
-0.8827199, 1.806529, -0.8170446, 0.9843137, 1, 0, 1,
-0.8822269, 0.7449946, -1.948156, 0.9803922, 1, 0, 1,
-0.8737828, -0.8837211, -3.393047, 0.972549, 1, 0, 1,
-0.8723695, -0.6047568, -2.32546, 0.9686275, 1, 0, 1,
-0.8709243, 0.5770628, -1.057136, 0.9607843, 1, 0, 1,
-0.8686616, -0.1082975, 0.01595686, 0.9568627, 1, 0, 1,
-0.8654076, -0.5743434, -2.365617, 0.9490196, 1, 0, 1,
-0.8637015, 0.3357306, -0.0757501, 0.945098, 1, 0, 1,
-0.8619442, 0.4044364, -1.712518, 0.9372549, 1, 0, 1,
-0.8546852, 0.04701397, -1.114317, 0.9333333, 1, 0, 1,
-0.8494044, 0.113698, -1.364223, 0.9254902, 1, 0, 1,
-0.8415683, -0.2222986, -0.5467775, 0.9215686, 1, 0, 1,
-0.829479, 0.09775013, -2.077883, 0.9137255, 1, 0, 1,
-0.8286149, 1.334073, -1.776729, 0.9098039, 1, 0, 1,
-0.8268431, -0.3091718, -2.425871, 0.9019608, 1, 0, 1,
-0.8265156, -0.4412617, -2.768905, 0.8941177, 1, 0, 1,
-0.82645, -0.9425632, -2.426438, 0.8901961, 1, 0, 1,
-0.8188495, -0.5639375, -1.598151, 0.8823529, 1, 0, 1,
-0.8181948, 0.6190548, -0.9845948, 0.8784314, 1, 0, 1,
-0.8079396, 1.109262, -1.706801, 0.8705882, 1, 0, 1,
-0.8065143, 0.9869815, 0.1092596, 0.8666667, 1, 0, 1,
-0.7985718, -0.5580269, -1.710846, 0.8588235, 1, 0, 1,
-0.798016, 0.7319259, -1.783473, 0.854902, 1, 0, 1,
-0.7928352, -0.5615728, -2.495156, 0.8470588, 1, 0, 1,
-0.7913995, 1.103438, -0.6320166, 0.8431373, 1, 0, 1,
-0.7902136, -1.418168, -3.653749, 0.8352941, 1, 0, 1,
-0.7801571, -0.3970707, -0.7696759, 0.8313726, 1, 0, 1,
-0.7800043, 0.2236121, -0.2401057, 0.8235294, 1, 0, 1,
-0.7778744, 0.9875365, 0.09985235, 0.8196079, 1, 0, 1,
-0.7731633, 0.2203934, -0.3646378, 0.8117647, 1, 0, 1,
-0.7717323, -0.03708003, -2.035529, 0.8078431, 1, 0, 1,
-0.7579771, 0.981908, -0.1297465, 0.8, 1, 0, 1,
-0.7574714, -0.7825426, -2.450103, 0.7921569, 1, 0, 1,
-0.7568384, -1.524004, -3.538424, 0.7882353, 1, 0, 1,
-0.7546649, -1.004351, -2.002631, 0.7803922, 1, 0, 1,
-0.7546198, -0.864432, -2.323769, 0.7764706, 1, 0, 1,
-0.7466164, 0.1403236, -1.244583, 0.7686275, 1, 0, 1,
-0.7458673, 0.11851, 0.130307, 0.7647059, 1, 0, 1,
-0.7448257, 0.1893394, -2.579201, 0.7568628, 1, 0, 1,
-0.7424879, 0.6829327, -0.1182277, 0.7529412, 1, 0, 1,
-0.7418137, -1.841324, -2.574344, 0.7450981, 1, 0, 1,
-0.7414973, 1.347803, 0.05176556, 0.7411765, 1, 0, 1,
-0.7402041, 0.891983, -1.188935, 0.7333333, 1, 0, 1,
-0.7397245, -1.683351, 0.9249091, 0.7294118, 1, 0, 1,
-0.7338865, -0.7396821, -2.609286, 0.7215686, 1, 0, 1,
-0.7335524, -0.5020943, -3.337509, 0.7176471, 1, 0, 1,
-0.731652, 0.009717724, -0.9684922, 0.7098039, 1, 0, 1,
-0.73145, 0.1557422, -0.8360332, 0.7058824, 1, 0, 1,
-0.7310842, 1.433341, -2.182055, 0.6980392, 1, 0, 1,
-0.726797, -1.065647, -4.328863, 0.6901961, 1, 0, 1,
-0.726255, -0.790337, -2.11492, 0.6862745, 1, 0, 1,
-0.7257144, -0.1189071, -1.578034, 0.6784314, 1, 0, 1,
-0.7253053, 0.3194023, -2.866022, 0.6745098, 1, 0, 1,
-0.723335, 0.5007735, 1.190428, 0.6666667, 1, 0, 1,
-0.7193466, -1.48354, -1.055684, 0.6627451, 1, 0, 1,
-0.7139024, -0.9846463, -2.702299, 0.654902, 1, 0, 1,
-0.7089577, 1.687254, -2.285336, 0.6509804, 1, 0, 1,
-0.7016142, -1.73045, -4.297164, 0.6431373, 1, 0, 1,
-0.6973314, -0.2609029, -1.364066, 0.6392157, 1, 0, 1,
-0.6895176, -0.5699867, -1.077056, 0.6313726, 1, 0, 1,
-0.6885597, 2.851342, 0.3793403, 0.627451, 1, 0, 1,
-0.6877645, 1.425483, -0.9134936, 0.6196079, 1, 0, 1,
-0.6875797, -1.313177, -2.380887, 0.6156863, 1, 0, 1,
-0.684886, -1.158872, -1.024287, 0.6078432, 1, 0, 1,
-0.6831401, 0.7561422, 0.289736, 0.6039216, 1, 0, 1,
-0.6807824, -0.6642715, -3.925289, 0.5960785, 1, 0, 1,
-0.680153, 0.4874239, -0.7326626, 0.5882353, 1, 0, 1,
-0.6679153, -0.8792675, -1.72841, 0.5843138, 1, 0, 1,
-0.6674781, 0.5564156, -0.2837997, 0.5764706, 1, 0, 1,
-0.6650262, -1.015783, -3.402609, 0.572549, 1, 0, 1,
-0.6649806, 1.071092, -0.3519575, 0.5647059, 1, 0, 1,
-0.6647451, -0.3785242, -3.452563, 0.5607843, 1, 0, 1,
-0.6605936, 1.390617, 0.3411443, 0.5529412, 1, 0, 1,
-0.6599439, -0.02352718, -2.342292, 0.5490196, 1, 0, 1,
-0.6532612, -0.01234758, -3.225574, 0.5411765, 1, 0, 1,
-0.6519204, 0.3576981, -0.6151222, 0.5372549, 1, 0, 1,
-0.6441585, 0.9799445, -2.104542, 0.5294118, 1, 0, 1,
-0.6403857, -0.03275726, -1.14167, 0.5254902, 1, 0, 1,
-0.6391188, -0.3113568, -2.390078, 0.5176471, 1, 0, 1,
-0.6373802, -0.2730102, -1.52977, 0.5137255, 1, 0, 1,
-0.6348156, -0.5825328, -2.247809, 0.5058824, 1, 0, 1,
-0.6342697, -1.037603, -3.290547, 0.5019608, 1, 0, 1,
-0.632468, -0.3317811, -2.061351, 0.4941176, 1, 0, 1,
-0.624319, 1.025593, 0.6497846, 0.4862745, 1, 0, 1,
-0.6181407, -0.3806448, -5.194173, 0.4823529, 1, 0, 1,
-0.6137329, 0.9519352, -2.060293, 0.4745098, 1, 0, 1,
-0.6102321, -0.5981373, -3.767705, 0.4705882, 1, 0, 1,
-0.6097802, 0.6780874, -0.6348147, 0.4627451, 1, 0, 1,
-0.6077356, 0.5298839, 0.2286715, 0.4588235, 1, 0, 1,
-0.6069219, -0.6287322, -1.676054, 0.4509804, 1, 0, 1,
-0.6017424, 0.4392087, 0.1404663, 0.4470588, 1, 0, 1,
-0.5994786, -0.4047303, -2.801225, 0.4392157, 1, 0, 1,
-0.5949696, 0.01974789, -0.7463785, 0.4352941, 1, 0, 1,
-0.5931602, 0.01059042, -2.260546, 0.427451, 1, 0, 1,
-0.5919999, 1.080117, -0.5842401, 0.4235294, 1, 0, 1,
-0.5864381, 0.187725, -1.590501, 0.4156863, 1, 0, 1,
-0.5838116, -2.286338, -0.9777466, 0.4117647, 1, 0, 1,
-0.5695506, -0.9766254, -1.823663, 0.4039216, 1, 0, 1,
-0.5682954, -0.2666619, -1.278899, 0.3960784, 1, 0, 1,
-0.5667214, -0.5124008, -2.806593, 0.3921569, 1, 0, 1,
-0.5613666, -1.245336, -2.430264, 0.3843137, 1, 0, 1,
-0.5598253, 1.006767, -2.127454, 0.3803922, 1, 0, 1,
-0.5588596, -0.6140819, -2.526118, 0.372549, 1, 0, 1,
-0.5554726, -1.089522, -1.634088, 0.3686275, 1, 0, 1,
-0.548788, -1.144841, -2.758376, 0.3607843, 1, 0, 1,
-0.5465603, 0.1888512, -1.065789, 0.3568628, 1, 0, 1,
-0.5401406, 0.02648398, -1.179143, 0.3490196, 1, 0, 1,
-0.5312626, 1.371562, -0.6438536, 0.345098, 1, 0, 1,
-0.5310587, 2.056096, -0.4368058, 0.3372549, 1, 0, 1,
-0.5301763, -0.8871486, -2.76217, 0.3333333, 1, 0, 1,
-0.5292963, 0.1966903, -1.125281, 0.3254902, 1, 0, 1,
-0.5286684, 0.26413, -0.3098416, 0.3215686, 1, 0, 1,
-0.5260306, -0.8331749, -3.832188, 0.3137255, 1, 0, 1,
-0.5238183, -2.470503, -2.995115, 0.3098039, 1, 0, 1,
-0.5227451, -0.09194911, -2.255058, 0.3019608, 1, 0, 1,
-0.5226234, 0.4818262, -0.0343689, 0.2941177, 1, 0, 1,
-0.5137383, 0.2348195, -0.09258991, 0.2901961, 1, 0, 1,
-0.513415, 0.1479105, -1.314487, 0.282353, 1, 0, 1,
-0.5131026, 0.7396197, 0.03453778, 0.2784314, 1, 0, 1,
-0.5112696, 0.5946908, -1.692483, 0.2705882, 1, 0, 1,
-0.5098193, -0.7598401, -1.557008, 0.2666667, 1, 0, 1,
-0.5057702, -0.05822406, -2.502657, 0.2588235, 1, 0, 1,
-0.5023773, -0.5675965, -2.662253, 0.254902, 1, 0, 1,
-0.4994273, -0.07248193, -1.925948, 0.2470588, 1, 0, 1,
-0.498056, -0.2043141, -4.205709, 0.2431373, 1, 0, 1,
-0.4936206, -0.6224549, -0.9542584, 0.2352941, 1, 0, 1,
-0.4876941, 1.464469, 0.2436096, 0.2313726, 1, 0, 1,
-0.4806858, 0.1012522, -0.871302, 0.2235294, 1, 0, 1,
-0.4793655, 1.144113, 1.085838, 0.2196078, 1, 0, 1,
-0.474508, 0.2322955, 0.6114134, 0.2117647, 1, 0, 1,
-0.4740908, -0.05661911, -3.396981, 0.2078431, 1, 0, 1,
-0.4700458, 1.086449, -0.8485711, 0.2, 1, 0, 1,
-0.4692273, -0.7008161, -3.01673, 0.1921569, 1, 0, 1,
-0.4586103, 2.026725, 2.369082, 0.1882353, 1, 0, 1,
-0.4511719, -1.530376, -0.7623528, 0.1803922, 1, 0, 1,
-0.4487053, 0.9275827, 0.1073198, 0.1764706, 1, 0, 1,
-0.4483708, -0.5992344, -2.179279, 0.1686275, 1, 0, 1,
-0.4392405, -1.860488, -3.36015, 0.1647059, 1, 0, 1,
-0.4285843, 1.126676, -0.04442065, 0.1568628, 1, 0, 1,
-0.4275331, 0.8751156, 0.4557301, 0.1529412, 1, 0, 1,
-0.4264564, 0.04613037, 0.1726187, 0.145098, 1, 0, 1,
-0.422789, -1.156146, -3.85894, 0.1411765, 1, 0, 1,
-0.4221382, -1.344387, -1.996269, 0.1333333, 1, 0, 1,
-0.4212051, 1.872024, -0.4419459, 0.1294118, 1, 0, 1,
-0.4206314, 1.462059, 0.8560868, 0.1215686, 1, 0, 1,
-0.4189547, -1.938043, -1.588097, 0.1176471, 1, 0, 1,
-0.4178259, -0.4357534, -1.915526, 0.1098039, 1, 0, 1,
-0.4175428, -0.9383512, -4.342941, 0.1058824, 1, 0, 1,
-0.4130229, 0.1172618, 0.4769116, 0.09803922, 1, 0, 1,
-0.4075739, 0.2775486, -0.7683451, 0.09019608, 1, 0, 1,
-0.4029429, 1.40246, -1.076488, 0.08627451, 1, 0, 1,
-0.4014753, 0.518855, -0.6420444, 0.07843138, 1, 0, 1,
-0.4010742, -0.4727679, -3.121973, 0.07450981, 1, 0, 1,
-0.3941616, 0.586683, 1.800106, 0.06666667, 1, 0, 1,
-0.3926073, -0.9596235, -2.954073, 0.0627451, 1, 0, 1,
-0.3898116, 1.32994, 1.183303, 0.05490196, 1, 0, 1,
-0.38669, 1.772114, 0.2693298, 0.05098039, 1, 0, 1,
-0.3812547, 0.02885578, -1.253168, 0.04313726, 1, 0, 1,
-0.3784107, 0.7380086, -0.9856725, 0.03921569, 1, 0, 1,
-0.3776833, -1.07858, -2.629366, 0.03137255, 1, 0, 1,
-0.3767933, 0.2774555, 0.9955639, 0.02745098, 1, 0, 1,
-0.3735583, -0.2004969, -2.0239, 0.01960784, 1, 0, 1,
-0.3651935, 0.8457932, -0.6674343, 0.01568628, 1, 0, 1,
-0.3641145, -0.08746558, -1.926704, 0.007843138, 1, 0, 1,
-0.3640794, 0.778623, 1.06596, 0.003921569, 1, 0, 1,
-0.3637313, 0.8913169, 0.05975995, 0, 1, 0.003921569, 1,
-0.3634415, -0.4683909, -2.877831, 0, 1, 0.01176471, 1,
-0.3634002, -0.2210474, -2.047153, 0, 1, 0.01568628, 1,
-0.3488089, -0.8387729, -2.359475, 0, 1, 0.02352941, 1,
-0.3485723, -1.110259, -2.417505, 0, 1, 0.02745098, 1,
-0.3476124, -0.4316737, -3.229696, 0, 1, 0.03529412, 1,
-0.3421329, -0.1082715, -3.11952, 0, 1, 0.03921569, 1,
-0.3404117, -0.6585505, -2.999086, 0, 1, 0.04705882, 1,
-0.3331944, 1.425223, 0.3737606, 0, 1, 0.05098039, 1,
-0.3301204, 0.6395691, -0.4654214, 0, 1, 0.05882353, 1,
-0.3298787, 0.186901, -0.1486154, 0, 1, 0.0627451, 1,
-0.3239234, -1.095172, -2.708185, 0, 1, 0.07058824, 1,
-0.323321, 1.125138, 0.5606094, 0, 1, 0.07450981, 1,
-0.3209196, -1.289593, -2.880874, 0, 1, 0.08235294, 1,
-0.3207673, -1.033925, -3.194557, 0, 1, 0.08627451, 1,
-0.3189826, 0.7490706, 0.3082038, 0, 1, 0.09411765, 1,
-0.3162207, -0.2890012, -1.781003, 0, 1, 0.1019608, 1,
-0.3155188, -0.1330483, -0.7220123, 0, 1, 0.1058824, 1,
-0.3109321, 0.5390118, -0.4177298, 0, 1, 0.1137255, 1,
-0.3048824, -0.3698381, -4.321599, 0, 1, 0.1176471, 1,
-0.3037272, -0.6548938, -2.078609, 0, 1, 0.1254902, 1,
-0.301003, -0.4829894, -2.611748, 0, 1, 0.1294118, 1,
-0.2992021, 0.1505327, 0.09548785, 0, 1, 0.1372549, 1,
-0.2959824, 0.5619425, -0.475323, 0, 1, 0.1411765, 1,
-0.292566, -0.1362754, -2.621747, 0, 1, 0.1490196, 1,
-0.2920253, -0.3232348, -3.71102, 0, 1, 0.1529412, 1,
-0.2881281, -0.7555493, -3.883247, 0, 1, 0.1607843, 1,
-0.2870504, 0.1386947, -2.184963, 0, 1, 0.1647059, 1,
-0.2867479, -2.17428, -0.8157745, 0, 1, 0.172549, 1,
-0.2819573, 0.02449007, -0.1934725, 0, 1, 0.1764706, 1,
-0.2803676, 0.5963649, -1.701819, 0, 1, 0.1843137, 1,
-0.2788558, 0.360664, 1.11502, 0, 1, 0.1882353, 1,
-0.2761828, 0.4583192, -1.539877, 0, 1, 0.1960784, 1,
-0.2761641, -0.5154127, -3.376874, 0, 1, 0.2039216, 1,
-0.2711816, 0.297422, -1.959783, 0, 1, 0.2078431, 1,
-0.2699282, -0.02180534, -2.830277, 0, 1, 0.2156863, 1,
-0.2679395, -2.806152, -3.021806, 0, 1, 0.2196078, 1,
-0.2677722, 1.050118, -0.4192701, 0, 1, 0.227451, 1,
-0.2659804, -0.8455878, -2.645484, 0, 1, 0.2313726, 1,
-0.2654832, -0.5843229, -2.144327, 0, 1, 0.2392157, 1,
-0.2644905, -1.376089, -1.379186, 0, 1, 0.2431373, 1,
-0.263285, 0.01026457, -0.852132, 0, 1, 0.2509804, 1,
-0.2597984, 0.9754217, -1.915798, 0, 1, 0.254902, 1,
-0.2578793, -2.107088, -2.583745, 0, 1, 0.2627451, 1,
-0.2577207, -0.07967427, -1.746747, 0, 1, 0.2666667, 1,
-0.2552175, 0.1350519, -2.355411, 0, 1, 0.2745098, 1,
-0.2520045, 0.5163165, -2.03154, 0, 1, 0.2784314, 1,
-0.2514758, -0.8529382, -0.4462077, 0, 1, 0.2862745, 1,
-0.2474576, -0.5064228, -2.981777, 0, 1, 0.2901961, 1,
-0.2389938, -0.8697323, -2.60567, 0, 1, 0.2980392, 1,
-0.235602, -0.398899, -2.074794, 0, 1, 0.3058824, 1,
-0.2350931, -0.8621798, -3.506082, 0, 1, 0.3098039, 1,
-0.2331429, 1.764455, 1.302837, 0, 1, 0.3176471, 1,
-0.2326805, 1.730086, 0.8021791, 0, 1, 0.3215686, 1,
-0.22757, -1.0308, -2.590425, 0, 1, 0.3294118, 1,
-0.2262464, 0.8610809, 0.1411498, 0, 1, 0.3333333, 1,
-0.2259709, 0.6964139, 1.495197, 0, 1, 0.3411765, 1,
-0.2228106, 0.1373611, -0.4743589, 0, 1, 0.345098, 1,
-0.2220943, 0.7248731, -0.3740103, 0, 1, 0.3529412, 1,
-0.2202824, 0.7469856, -0.7805981, 0, 1, 0.3568628, 1,
-0.2171163, -1.308943, -4.354118, 0, 1, 0.3647059, 1,
-0.2157761, -0.3389309, -3.510806, 0, 1, 0.3686275, 1,
-0.2157756, 1.088658, -1.245563, 0, 1, 0.3764706, 1,
-0.1976234, 0.7744381, 2.087547, 0, 1, 0.3803922, 1,
-0.1953176, -0.04969792, -1.570551, 0, 1, 0.3882353, 1,
-0.1931097, -0.7126783, -3.26618, 0, 1, 0.3921569, 1,
-0.1903911, -0.9237826, -3.60393, 0, 1, 0.4, 1,
-0.1883037, 1.425082, -0.07288053, 0, 1, 0.4078431, 1,
-0.1873522, -0.25309, -3.879294, 0, 1, 0.4117647, 1,
-0.1872357, -0.7805595, -2.634041, 0, 1, 0.4196078, 1,
-0.1833542, 1.036689, 1.164695, 0, 1, 0.4235294, 1,
-0.1748355, 0.6092789, -0.8335205, 0, 1, 0.4313726, 1,
-0.1730095, -0.4744477, -1.850394, 0, 1, 0.4352941, 1,
-0.1680624, -0.4633249, -2.714773, 0, 1, 0.4431373, 1,
-0.160538, 0.5377485, 0.3609316, 0, 1, 0.4470588, 1,
-0.1474522, -0.9530914, -3.697672, 0, 1, 0.454902, 1,
-0.1473839, 1.359288, 0.1842906, 0, 1, 0.4588235, 1,
-0.1471228, 0.7646782, -1.180404, 0, 1, 0.4666667, 1,
-0.1455407, -0.2123028, -1.412177, 0, 1, 0.4705882, 1,
-0.1449357, 0.1330163, 0.8817502, 0, 1, 0.4784314, 1,
-0.1433257, -0.3982247, -1.518261, 0, 1, 0.4823529, 1,
-0.1391247, 0.579819, 1.078939, 0, 1, 0.4901961, 1,
-0.1352341, -0.2784178, -3.526437, 0, 1, 0.4941176, 1,
-0.1333762, -0.1388847, -1.410475, 0, 1, 0.5019608, 1,
-0.1321606, 0.1479126, 0.2772407, 0, 1, 0.509804, 1,
-0.1312329, 0.6268189, -0.1896142, 0, 1, 0.5137255, 1,
-0.1311932, -0.4922204, -3.712137, 0, 1, 0.5215687, 1,
-0.1255315, 1.755881, 0.7642388, 0, 1, 0.5254902, 1,
-0.1221519, -0.8413541, -3.719358, 0, 1, 0.5333334, 1,
-0.1202413, 0.01422486, -0.9970548, 0, 1, 0.5372549, 1,
-0.1177088, -0.7624245, -0.6840312, 0, 1, 0.5450981, 1,
-0.1172363, -0.2341448, -2.694004, 0, 1, 0.5490196, 1,
-0.1115018, 0.08693808, -1.710409, 0, 1, 0.5568628, 1,
-0.1096181, -1.237162, -2.8166, 0, 1, 0.5607843, 1,
-0.1062268, 0.4116532, -0.8459023, 0, 1, 0.5686275, 1,
-0.1012892, 1.266105, 1.357129, 0, 1, 0.572549, 1,
-0.09286335, -0.1429585, -2.57426, 0, 1, 0.5803922, 1,
-0.09242201, -0.2705016, -2.154809, 0, 1, 0.5843138, 1,
-0.08674869, 0.6621804, -0.5098044, 0, 1, 0.5921569, 1,
-0.08643061, 0.2153556, 0.2043826, 0, 1, 0.5960785, 1,
-0.08624358, 1.382301, -0.5694307, 0, 1, 0.6039216, 1,
-0.08385316, -0.4408114, -2.042048, 0, 1, 0.6117647, 1,
-0.08305823, -0.3273193, -1.306858, 0, 1, 0.6156863, 1,
-0.0798094, 0.02634765, -0.8955645, 0, 1, 0.6235294, 1,
-0.07860829, -1.32199, -3.411762, 0, 1, 0.627451, 1,
-0.07839012, 0.08774913, 0.566482, 0, 1, 0.6352941, 1,
-0.07807276, -1.055698, -2.707172, 0, 1, 0.6392157, 1,
-0.07570291, 0.5028175, -0.1343361, 0, 1, 0.6470588, 1,
-0.0743464, -0.04970782, -2.087153, 0, 1, 0.6509804, 1,
-0.0716054, -0.7463337, -3.33345, 0, 1, 0.6588235, 1,
-0.06364726, -1.362381, -3.808898, 0, 1, 0.6627451, 1,
-0.06159804, 0.162148, -0.05764039, 0, 1, 0.6705883, 1,
-0.05997416, 0.5576767, -0.3197095, 0, 1, 0.6745098, 1,
-0.05931495, 1.573883, -1.215586, 0, 1, 0.682353, 1,
-0.05770577, -0.4599903, -3.288496, 0, 1, 0.6862745, 1,
-0.05757517, -0.2999841, -5.171249, 0, 1, 0.6941177, 1,
-0.05286206, 1.276781, 0.2014169, 0, 1, 0.7019608, 1,
-0.05008674, -1.06939, -3.356356, 0, 1, 0.7058824, 1,
-0.04997203, -0.09612131, -2.576744, 0, 1, 0.7137255, 1,
-0.0471032, -0.2936015, -2.590899, 0, 1, 0.7176471, 1,
-0.04571617, 0.2799278, -0.6404011, 0, 1, 0.7254902, 1,
-0.03052202, 0.8164585, 1.053383, 0, 1, 0.7294118, 1,
-0.03032389, -1.42343, -4.034592, 0, 1, 0.7372549, 1,
-0.02803313, -2.041934, -2.306964, 0, 1, 0.7411765, 1,
-0.02622814, -0.06316648, -1.478948, 0, 1, 0.7490196, 1,
-0.0148734, -2.429985, -4.787385, 0, 1, 0.7529412, 1,
-0.01068875, -0.07893572, -2.954175, 0, 1, 0.7607843, 1,
-0.006992592, 0.4270579, -0.9222512, 0, 1, 0.7647059, 1,
-0.001420093, 1.954602, 0.08652521, 0, 1, 0.772549, 1,
0.004108534, -0.02399699, 4.060169, 0, 1, 0.7764706, 1,
0.01027145, -0.3737034, 2.817551, 0, 1, 0.7843137, 1,
0.01042274, -1.718665, 3.973309, 0, 1, 0.7882353, 1,
0.01276258, -0.2779548, 2.274648, 0, 1, 0.7960784, 1,
0.01332849, -0.2798358, 5.047713, 0, 1, 0.8039216, 1,
0.01475794, 0.6951827, -0.5086118, 0, 1, 0.8078431, 1,
0.02391369, 0.5714056, -1.445699, 0, 1, 0.8156863, 1,
0.02480026, 0.3014441, -0.2127489, 0, 1, 0.8196079, 1,
0.02513091, 1.284176, -0.6867944, 0, 1, 0.827451, 1,
0.02872992, -1.280252, 2.579004, 0, 1, 0.8313726, 1,
0.0289899, 0.5715179, 0.3945993, 0, 1, 0.8392157, 1,
0.02942662, -0.4939366, 3.501925, 0, 1, 0.8431373, 1,
0.03171233, -0.4680228, 2.923711, 0, 1, 0.8509804, 1,
0.03636123, 0.7532831, 1.570846, 0, 1, 0.854902, 1,
0.03669166, -0.3580085, 2.759068, 0, 1, 0.8627451, 1,
0.03729288, 0.6980427, 0.5933991, 0, 1, 0.8666667, 1,
0.03758481, -0.5607451, 2.106052, 0, 1, 0.8745098, 1,
0.03884269, 1.409804, -1.259545, 0, 1, 0.8784314, 1,
0.03888869, -0.6580769, 3.295558, 0, 1, 0.8862745, 1,
0.03901642, -0.6070908, 2.18738, 0, 1, 0.8901961, 1,
0.04329113, -0.0561556, 2.096064, 0, 1, 0.8980392, 1,
0.04366471, 2.007638, 0.04620247, 0, 1, 0.9058824, 1,
0.04421118, 1.042924, 0.8026457, 0, 1, 0.9098039, 1,
0.05150134, 0.1967079, 1.068029, 0, 1, 0.9176471, 1,
0.05202068, -0.6331555, 4.377904, 0, 1, 0.9215686, 1,
0.05364206, -0.05596907, 2.368005, 0, 1, 0.9294118, 1,
0.05933286, -0.5701075, 3.623673, 0, 1, 0.9333333, 1,
0.06036038, -0.2795871, 1.862015, 0, 1, 0.9411765, 1,
0.06174263, -0.4519905, 2.489329, 0, 1, 0.945098, 1,
0.06458183, -1.466445, 2.769376, 0, 1, 0.9529412, 1,
0.06770946, -0.2061198, 2.825955, 0, 1, 0.9568627, 1,
0.07049093, -0.2416261, 2.604046, 0, 1, 0.9647059, 1,
0.07128254, -0.8591968, 5.044142, 0, 1, 0.9686275, 1,
0.08482704, 1.002199, -0.3467477, 0, 1, 0.9764706, 1,
0.08780124, -0.3011706, 4.572572, 0, 1, 0.9803922, 1,
0.08872389, -0.9185265, 2.05297, 0, 1, 0.9882353, 1,
0.09201708, 2.383076, 1.422028, 0, 1, 0.9921569, 1,
0.09367323, 0.3242924, -2.317932, 0, 1, 1, 1,
0.09478678, 0.1208933, 0.5339004, 0, 0.9921569, 1, 1,
0.09541132, 0.1788837, 1.718565, 0, 0.9882353, 1, 1,
0.09557971, -0.1363578, 4.47879, 0, 0.9803922, 1, 1,
0.09643695, 1.87699, 1.444348, 0, 0.9764706, 1, 1,
0.09833881, -0.161334, 1.832854, 0, 0.9686275, 1, 1,
0.1029242, -1.242291, 4.02467, 0, 0.9647059, 1, 1,
0.1132638, -0.7277912, 4.651837, 0, 0.9568627, 1, 1,
0.1143474, -1.558809, 2.860338, 0, 0.9529412, 1, 1,
0.1186537, 0.2888438, 1.054012, 0, 0.945098, 1, 1,
0.1211234, -0.3252148, 2.707699, 0, 0.9411765, 1, 1,
0.1225947, 0.008353947, 1.995734, 0, 0.9333333, 1, 1,
0.1232599, -0.08951519, 0.8208258, 0, 0.9294118, 1, 1,
0.1246627, 0.05448205, 1.692688, 0, 0.9215686, 1, 1,
0.1257575, -1.30294, 4.605662, 0, 0.9176471, 1, 1,
0.1275043, 1.058593, 0.3427857, 0, 0.9098039, 1, 1,
0.1312882, 1.016279, 0.1231162, 0, 0.9058824, 1, 1,
0.1317026, -1.694462, 2.694523, 0, 0.8980392, 1, 1,
0.1322766, 0.3234266, -0.5194757, 0, 0.8901961, 1, 1,
0.1333394, 0.03378895, 1.636732, 0, 0.8862745, 1, 1,
0.1335086, 0.05913801, 3.154753, 0, 0.8784314, 1, 1,
0.1354941, -0.3845262, 1.305601, 0, 0.8745098, 1, 1,
0.1357556, -0.9880512, 3.064212, 0, 0.8666667, 1, 1,
0.1367857, -0.0437562, 0.5321061, 0, 0.8627451, 1, 1,
0.1371377, 0.5223326, 0.7786769, 0, 0.854902, 1, 1,
0.137564, 0.07013734, 0.7330141, 0, 0.8509804, 1, 1,
0.138115, -0.6397614, 3.062524, 0, 0.8431373, 1, 1,
0.1384551, 1.450084, 0.7280469, 0, 0.8392157, 1, 1,
0.1392182, -0.3692787, 3.620733, 0, 0.8313726, 1, 1,
0.143731, -1.473336, 1.24583, 0, 0.827451, 1, 1,
0.1456683, -0.3131196, 3.374416, 0, 0.8196079, 1, 1,
0.1512268, -0.8301342, 2.043132, 0, 0.8156863, 1, 1,
0.1618859, -0.5505842, 3.534286, 0, 0.8078431, 1, 1,
0.1624316, 0.6204863, -0.2676469, 0, 0.8039216, 1, 1,
0.1649551, 0.07093921, -0.1376614, 0, 0.7960784, 1, 1,
0.1653014, 0.4484565, 1.041654, 0, 0.7882353, 1, 1,
0.1665279, 0.757964, 1.069463, 0, 0.7843137, 1, 1,
0.1744618, -0.3518085, 2.95942, 0, 0.7764706, 1, 1,
0.1744672, -0.5736428, 3.480127, 0, 0.772549, 1, 1,
0.176022, -0.2734337, 2.174937, 0, 0.7647059, 1, 1,
0.1779989, -0.3137329, 4.637613, 0, 0.7607843, 1, 1,
0.1836372, -0.708884, 2.568194, 0, 0.7529412, 1, 1,
0.1862029, 0.4094079, -0.4386839, 0, 0.7490196, 1, 1,
0.1903182, 0.9296647, -1.153343, 0, 0.7411765, 1, 1,
0.1936473, 1.496554, -0.08713816, 0, 0.7372549, 1, 1,
0.1947208, 0.8052394, 1.462465, 0, 0.7294118, 1, 1,
0.1978011, -0.1201606, 2.204745, 0, 0.7254902, 1, 1,
0.1980295, -0.7228498, 3.63239, 0, 0.7176471, 1, 1,
0.2008684, -1.50399, 1.729673, 0, 0.7137255, 1, 1,
0.2031853, 0.441276, 1.447085, 0, 0.7058824, 1, 1,
0.2039255, -0.8497052, 3.499661, 0, 0.6980392, 1, 1,
0.2057291, 0.5629509, -1.335557, 0, 0.6941177, 1, 1,
0.2065072, -1.689995, 3.041481, 0, 0.6862745, 1, 1,
0.208349, -0.4374828, 3.013246, 0, 0.682353, 1, 1,
0.211738, -0.2019255, 0.6836238, 0, 0.6745098, 1, 1,
0.2186721, -0.003173087, 2.368595, 0, 0.6705883, 1, 1,
0.2203185, 0.5836017, 0.8826704, 0, 0.6627451, 1, 1,
0.2221709, -0.08400569, 3.669066, 0, 0.6588235, 1, 1,
0.2222463, -0.5829142, 2.975586, 0, 0.6509804, 1, 1,
0.2332839, 1.122074, -0.698072, 0, 0.6470588, 1, 1,
0.2369352, -0.01767528, 1.922083, 0, 0.6392157, 1, 1,
0.2402292, 0.1156337, 0.8409311, 0, 0.6352941, 1, 1,
0.2405563, 1.45174, -0.1374773, 0, 0.627451, 1, 1,
0.2406062, 1.189267, -0.1144438, 0, 0.6235294, 1, 1,
0.2445551, 0.6574621, -0.4754809, 0, 0.6156863, 1, 1,
0.2492506, 0.6320803, -0.1162682, 0, 0.6117647, 1, 1,
0.2501846, 0.6957678, -0.3314865, 0, 0.6039216, 1, 1,
0.2505942, -1.608359, 3.720271, 0, 0.5960785, 1, 1,
0.2507698, 0.7575198, 0.5387388, 0, 0.5921569, 1, 1,
0.2511493, -1.402102, 4.874705, 0, 0.5843138, 1, 1,
0.2529542, -0.5446404, 2.209285, 0, 0.5803922, 1, 1,
0.2531974, -0.9057699, 1.737152, 0, 0.572549, 1, 1,
0.255836, 0.3170285, 0.7730888, 0, 0.5686275, 1, 1,
0.2583466, -0.1136054, 3.295182, 0, 0.5607843, 1, 1,
0.259978, -0.8560063, 2.656189, 0, 0.5568628, 1, 1,
0.2619445, -0.5939155, 3.088147, 0, 0.5490196, 1, 1,
0.2658491, 0.3199094, 0.8515606, 0, 0.5450981, 1, 1,
0.2667674, 0.4959148, -1.345277, 0, 0.5372549, 1, 1,
0.2704784, 0.9283339, 1.955954, 0, 0.5333334, 1, 1,
0.2713512, -0.6210871, 2.324752, 0, 0.5254902, 1, 1,
0.276989, -0.1348981, 1.944604, 0, 0.5215687, 1, 1,
0.2805589, 0.6503497, 0.7697241, 0, 0.5137255, 1, 1,
0.281121, -0.7847283, 3.028201, 0, 0.509804, 1, 1,
0.2830971, 0.392302, 0.5046999, 0, 0.5019608, 1, 1,
0.2854514, 0.5601743, 0.3936065, 0, 0.4941176, 1, 1,
0.2860178, 0.5729151, -0.8538064, 0, 0.4901961, 1, 1,
0.288778, 0.2600466, -0.001103792, 0, 0.4823529, 1, 1,
0.2887897, 0.7301005, 0.5492132, 0, 0.4784314, 1, 1,
0.2890804, 0.4204118, 2.246726, 0, 0.4705882, 1, 1,
0.2891946, 0.5977204, 1.395463, 0, 0.4666667, 1, 1,
0.2894965, 0.3912809, 1.3199, 0, 0.4588235, 1, 1,
0.2905821, 0.7008947, -0.3858451, 0, 0.454902, 1, 1,
0.2926955, 0.2656426, -0.1485154, 0, 0.4470588, 1, 1,
0.2978015, -0.7114085, 4.096696, 0, 0.4431373, 1, 1,
0.299095, -1.320655, 3.364669, 0, 0.4352941, 1, 1,
0.3005251, 0.5403925, 2.213155, 0, 0.4313726, 1, 1,
0.3007797, -1.018432, 4.238212, 0, 0.4235294, 1, 1,
0.3094959, 0.1831248, 0.3293957, 0, 0.4196078, 1, 1,
0.3101111, 0.6738245, 1.458919, 0, 0.4117647, 1, 1,
0.3122357, 0.80106, -0.1067632, 0, 0.4078431, 1, 1,
0.3142186, 0.9938798, 1.240601, 0, 0.4, 1, 1,
0.3155549, -0.358573, 3.088261, 0, 0.3921569, 1, 1,
0.3167258, 0.1237274, 2.170304, 0, 0.3882353, 1, 1,
0.3206571, 0.7304489, 2.487235, 0, 0.3803922, 1, 1,
0.3240171, -1.633327, 3.512514, 0, 0.3764706, 1, 1,
0.325443, -1.017461, 2.64511, 0, 0.3686275, 1, 1,
0.328684, 0.3454061, 2.04404, 0, 0.3647059, 1, 1,
0.3360438, 0.3555342, 1.775391, 0, 0.3568628, 1, 1,
0.3364601, 0.5528963, 1.373707, 0, 0.3529412, 1, 1,
0.3383361, 0.8706154, 0.3705552, 0, 0.345098, 1, 1,
0.3392333, 0.8542153, 0.5457003, 0, 0.3411765, 1, 1,
0.342253, 1.632096, 0.9690906, 0, 0.3333333, 1, 1,
0.3437468, -0.5035206, 1.633067, 0, 0.3294118, 1, 1,
0.3475869, 0.1029465, 1.628398, 0, 0.3215686, 1, 1,
0.3514847, 2.868693, 0.9071407, 0, 0.3176471, 1, 1,
0.3551143, 0.536074, 0.9388145, 0, 0.3098039, 1, 1,
0.3618256, 0.9373509, -0.9046793, 0, 0.3058824, 1, 1,
0.3628763, -0.7791881, 3.095818, 0, 0.2980392, 1, 1,
0.3641907, -0.4748277, 2.758853, 0, 0.2901961, 1, 1,
0.3652681, -0.8069964, 2.112759, 0, 0.2862745, 1, 1,
0.3667117, -0.3714413, 3.523949, 0, 0.2784314, 1, 1,
0.3719617, -0.5905899, 1.566011, 0, 0.2745098, 1, 1,
0.3807255, 0.9354885, -1.61676, 0, 0.2666667, 1, 1,
0.3849821, -0.6214973, 3.717181, 0, 0.2627451, 1, 1,
0.388786, 0.5492089, 0.03124261, 0, 0.254902, 1, 1,
0.3893867, -0.3573103, 3.180578, 0, 0.2509804, 1, 1,
0.3917617, -0.147591, 2.752841, 0, 0.2431373, 1, 1,
0.3917779, -1.479987, 3.978346, 0, 0.2392157, 1, 1,
0.3935803, -0.249872, 1.358805, 0, 0.2313726, 1, 1,
0.3976048, -1.317832, 2.166327, 0, 0.227451, 1, 1,
0.3988666, 0.2503159, 1.08262, 0, 0.2196078, 1, 1,
0.4009005, -0.9018044, 2.818741, 0, 0.2156863, 1, 1,
0.40148, -1.19659, 1.649138, 0, 0.2078431, 1, 1,
0.4044618, -0.196068, 3.346068, 0, 0.2039216, 1, 1,
0.4085297, 0.5799964, -1.039042, 0, 0.1960784, 1, 1,
0.4126267, -0.2763756, 1.796564, 0, 0.1882353, 1, 1,
0.4144006, -1.138176, 2.652242, 0, 0.1843137, 1, 1,
0.4158088, 0.3311459, -1.012023, 0, 0.1764706, 1, 1,
0.4183304, -0.6233582, 1.435861, 0, 0.172549, 1, 1,
0.4201152, -0.7897807, 2.306607, 0, 0.1647059, 1, 1,
0.4313496, -0.7094967, 2.619791, 0, 0.1607843, 1, 1,
0.4332121, 0.33328, 2.147148, 0, 0.1529412, 1, 1,
0.4347143, 1.503405, 0.6223748, 0, 0.1490196, 1, 1,
0.4365185, 1.353421, -0.1520502, 0, 0.1411765, 1, 1,
0.43753, 1.616867, -0.7682936, 0, 0.1372549, 1, 1,
0.4408727, -0.591917, 4.324536, 0, 0.1294118, 1, 1,
0.442134, 1.811182, -0.004958764, 0, 0.1254902, 1, 1,
0.4423627, 0.7497722, -0.3854821, 0, 0.1176471, 1, 1,
0.4438753, -1.028831, 1.758004, 0, 0.1137255, 1, 1,
0.4452424, 0.4824789, 1.345092, 0, 0.1058824, 1, 1,
0.4544918, -0.64843, 2.432543, 0, 0.09803922, 1, 1,
0.4595384, -0.51065, 3.528632, 0, 0.09411765, 1, 1,
0.461401, -1.302689, 0.7933472, 0, 0.08627451, 1, 1,
0.4641638, 1.397502, -0.2724192, 0, 0.08235294, 1, 1,
0.4670359, -1.932437, 4.755736, 0, 0.07450981, 1, 1,
0.4726109, 0.140288, 1.247666, 0, 0.07058824, 1, 1,
0.4766231, -1.735269, 3.718891, 0, 0.0627451, 1, 1,
0.4800966, -0.6716983, 3.058833, 0, 0.05882353, 1, 1,
0.4814798, -1.690546, 1.982305, 0, 0.05098039, 1, 1,
0.4832118, 0.4309045, 1.123328, 0, 0.04705882, 1, 1,
0.4882634, 0.6785983, 1.23629, 0, 0.03921569, 1, 1,
0.4889937, 0.5770278, 0.4331565, 0, 0.03529412, 1, 1,
0.4931149, -0.5980548, 2.099803, 0, 0.02745098, 1, 1,
0.4985825, -1.083472, -0.6180003, 0, 0.02352941, 1, 1,
0.5035394, 0.9306585, -2.125372, 0, 0.01568628, 1, 1,
0.5043559, 0.7213517, -0.926236, 0, 0.01176471, 1, 1,
0.5046222, -2.109475, 3.745831, 0, 0.003921569, 1, 1,
0.5060312, 0.3912058, -0.161764, 0.003921569, 0, 1, 1,
0.5064113, 0.0605244, 1.915659, 0.007843138, 0, 1, 1,
0.5111693, -0.4631829, 2.037188, 0.01568628, 0, 1, 1,
0.5151424, -1.552331, 4.791827, 0.01960784, 0, 1, 1,
0.5161241, 1.561507, 0.1208096, 0.02745098, 0, 1, 1,
0.5168444, -0.06765597, 1.964222, 0.03137255, 0, 1, 1,
0.5177718, -0.985035, 1.454777, 0.03921569, 0, 1, 1,
0.517822, 1.148858, 0.5650365, 0.04313726, 0, 1, 1,
0.5179807, 0.06906999, 0.6128563, 0.05098039, 0, 1, 1,
0.5191258, -0.40633, 2.337166, 0.05490196, 0, 1, 1,
0.5211537, -0.2418403, 2.752855, 0.0627451, 0, 1, 1,
0.5246326, -0.2485335, 3.733096, 0.06666667, 0, 1, 1,
0.5296164, -0.2099268, 1.159887, 0.07450981, 0, 1, 1,
0.5297108, 1.153306, 0.7431464, 0.07843138, 0, 1, 1,
0.5298958, -0.6751286, 2.694331, 0.08627451, 0, 1, 1,
0.5389128, 1.061925, 0.378289, 0.09019608, 0, 1, 1,
0.5410978, -1.17428, 2.933084, 0.09803922, 0, 1, 1,
0.5432063, 1.01565, 1.945116, 0.1058824, 0, 1, 1,
0.5439341, 1.051902, -1.11937, 0.1098039, 0, 1, 1,
0.5456194, -2.032599, 3.508514, 0.1176471, 0, 1, 1,
0.5496231, 0.9766368, -0.07373897, 0.1215686, 0, 1, 1,
0.5558267, -0.2239849, 3.449862, 0.1294118, 0, 1, 1,
0.557139, -0.7220277, 1.954365, 0.1333333, 0, 1, 1,
0.5583429, -0.2185995, 4.205602, 0.1411765, 0, 1, 1,
0.5585542, -0.7725822, 2.095769, 0.145098, 0, 1, 1,
0.5658016, 0.2875881, 2.16916, 0.1529412, 0, 1, 1,
0.566897, 0.459933, 0.6526999, 0.1568628, 0, 1, 1,
0.5672529, 1.135877, -0.4273134, 0.1647059, 0, 1, 1,
0.571223, 0.05214733, -0.2454994, 0.1686275, 0, 1, 1,
0.5713682, -0.6067098, 4.253973, 0.1764706, 0, 1, 1,
0.5763369, 1.032391, 1.116227, 0.1803922, 0, 1, 1,
0.576605, 0.4997142, -0.4759088, 0.1882353, 0, 1, 1,
0.5805417, 0.2580129, 1.204642, 0.1921569, 0, 1, 1,
0.5826185, 0.06143347, 4.59268, 0.2, 0, 1, 1,
0.5867791, -0.1073452, 1.038162, 0.2078431, 0, 1, 1,
0.5872061, 0.8419541, 0.9212743, 0.2117647, 0, 1, 1,
0.5872088, 0.1457678, 2.055976, 0.2196078, 0, 1, 1,
0.5900265, -1.778857, 3.876413, 0.2235294, 0, 1, 1,
0.5920468, -0.4713194, 2.456847, 0.2313726, 0, 1, 1,
0.5993556, 0.1401132, 1.372569, 0.2352941, 0, 1, 1,
0.6016704, -1.328737, 2.667293, 0.2431373, 0, 1, 1,
0.6026477, -0.4199609, 2.094459, 0.2470588, 0, 1, 1,
0.6042626, -0.03268445, 0.217535, 0.254902, 0, 1, 1,
0.6123923, 0.5072171, -1.402753, 0.2588235, 0, 1, 1,
0.6156217, 0.2355692, 3.016705, 0.2666667, 0, 1, 1,
0.6179304, 1.226055, -0.02540868, 0.2705882, 0, 1, 1,
0.6214584, -0.6313103, 1.424855, 0.2784314, 0, 1, 1,
0.6225959, 0.8096295, 0.2109061, 0.282353, 0, 1, 1,
0.6236105, -0.8415036, 3.721514, 0.2901961, 0, 1, 1,
0.6248646, -1.866451, 0.9899517, 0.2941177, 0, 1, 1,
0.6272435, 0.453734, 1.356116, 0.3019608, 0, 1, 1,
0.6448626, 1.358935, -0.3091913, 0.3098039, 0, 1, 1,
0.6470531, -0.2987887, 0.1315037, 0.3137255, 0, 1, 1,
0.649911, -0.1010478, 2.609637, 0.3215686, 0, 1, 1,
0.6501712, 0.3941569, 3.347921, 0.3254902, 0, 1, 1,
0.6543187, -0.6243797, 0.9059582, 0.3333333, 0, 1, 1,
0.6561316, -1.247317, 1.672226, 0.3372549, 0, 1, 1,
0.6652163, 0.4960637, -0.2479748, 0.345098, 0, 1, 1,
0.6713276, -0.6040377, 2.012889, 0.3490196, 0, 1, 1,
0.6739075, 0.0416473, 1.941603, 0.3568628, 0, 1, 1,
0.6790909, -0.3463192, 2.841929, 0.3607843, 0, 1, 1,
0.6795871, 0.8673275, 2.100529, 0.3686275, 0, 1, 1,
0.6862091, -1.565326, 3.925222, 0.372549, 0, 1, 1,
0.6885466, -1.883392, 2.794691, 0.3803922, 0, 1, 1,
0.6927661, -0.2239411, 1.82969, 0.3843137, 0, 1, 1,
0.6947147, -1.035774, 1.819494, 0.3921569, 0, 1, 1,
0.69508, 0.687569, 0.2216241, 0.3960784, 0, 1, 1,
0.6970279, 0.5265667, 1.165668, 0.4039216, 0, 1, 1,
0.6973103, 1.322586, 0.4456848, 0.4117647, 0, 1, 1,
0.6976902, -1.309904, 2.788284, 0.4156863, 0, 1, 1,
0.7045777, -0.2698804, 2.834427, 0.4235294, 0, 1, 1,
0.7091548, -0.2043683, 4.082821, 0.427451, 0, 1, 1,
0.7136801, -1.493293, 2.271125, 0.4352941, 0, 1, 1,
0.7169076, -1.969177, 1.900173, 0.4392157, 0, 1, 1,
0.7193106, -1.06011, 0.2797907, 0.4470588, 0, 1, 1,
0.7216907, 0.2179635, 1.371149, 0.4509804, 0, 1, 1,
0.7219415, 0.3366878, 0.6546639, 0.4588235, 0, 1, 1,
0.7250912, -1.213505, 1.906397, 0.4627451, 0, 1, 1,
0.7255846, 2.044477, 0.3121354, 0.4705882, 0, 1, 1,
0.7256417, -1.442618, 1.753056, 0.4745098, 0, 1, 1,
0.7323413, 0.5498068, 0.9150866, 0.4823529, 0, 1, 1,
0.7339373, -1.086699, 1.790547, 0.4862745, 0, 1, 1,
0.7404367, 1.939632, 2.668131, 0.4941176, 0, 1, 1,
0.742945, -0.8977474, 1.38573, 0.5019608, 0, 1, 1,
0.7447414, -0.2088269, 2.096652, 0.5058824, 0, 1, 1,
0.7561335, -0.3483215, 3.162738, 0.5137255, 0, 1, 1,
0.7647189, -0.7072409, 3.140362, 0.5176471, 0, 1, 1,
0.7735621, 1.074434, -0.1088936, 0.5254902, 0, 1, 1,
0.7761522, 0.4120272, 0.6237839, 0.5294118, 0, 1, 1,
0.7765887, -1.731456, 2.317514, 0.5372549, 0, 1, 1,
0.7860587, -0.7834666, 1.641379, 0.5411765, 0, 1, 1,
0.7922454, 1.922899, 0.9681928, 0.5490196, 0, 1, 1,
0.7972686, 0.5323553, -0.3669754, 0.5529412, 0, 1, 1,
0.802587, -1.190194, 1.303606, 0.5607843, 0, 1, 1,
0.8041046, 0.4983698, 2.274086, 0.5647059, 0, 1, 1,
0.8106, -0.7470711, 1.072521, 0.572549, 0, 1, 1,
0.8120264, 1.382739, -0.6432614, 0.5764706, 0, 1, 1,
0.8130064, -1.0328, 2.033178, 0.5843138, 0, 1, 1,
0.815563, 2.083115, -0.3669403, 0.5882353, 0, 1, 1,
0.815956, -2.129862, 4.567954, 0.5960785, 0, 1, 1,
0.8193369, 0.9394721, 1.573528, 0.6039216, 0, 1, 1,
0.824416, 1.168006, -0.2240056, 0.6078432, 0, 1, 1,
0.8256837, -0.2063925, -0.458642, 0.6156863, 0, 1, 1,
0.8280378, 1.568877, 0.007225546, 0.6196079, 0, 1, 1,
0.8283393, 0.5328992, -0.317894, 0.627451, 0, 1, 1,
0.8355647, -0.3231966, 2.596308, 0.6313726, 0, 1, 1,
0.8421415, 0.2403964, 0.03315732, 0.6392157, 0, 1, 1,
0.8426506, -0.7490479, 3.218794, 0.6431373, 0, 1, 1,
0.8449705, 0.6421047, -0.9724697, 0.6509804, 0, 1, 1,
0.8582602, 0.8025256, 1.119254, 0.654902, 0, 1, 1,
0.8589938, 1.623467, 0.06897694, 0.6627451, 0, 1, 1,
0.8660507, 0.7693186, 0.6777609, 0.6666667, 0, 1, 1,
0.8693345, 0.300098, 2.583228, 0.6745098, 0, 1, 1,
0.8694503, -1.425214, 3.19427, 0.6784314, 0, 1, 1,
0.8701508, 1.250561, -0.334966, 0.6862745, 0, 1, 1,
0.871004, 2.015544, -0.1149463, 0.6901961, 0, 1, 1,
0.8759094, 0.03927916, 1.186074, 0.6980392, 0, 1, 1,
0.8767382, -0.2648019, 2.553525, 0.7058824, 0, 1, 1,
0.8788876, 0.1736283, 2.861592, 0.7098039, 0, 1, 1,
0.8808054, 0.9703129, 0.5896351, 0.7176471, 0, 1, 1,
0.882066, -0.2504896, -0.2676108, 0.7215686, 0, 1, 1,
0.8924381, -1.449167, 2.667883, 0.7294118, 0, 1, 1,
0.8979093, 0.384502, 1.521485, 0.7333333, 0, 1, 1,
0.9041948, 1.056102, 0.7609, 0.7411765, 0, 1, 1,
0.9056861, 0.3222781, 0.6333814, 0.7450981, 0, 1, 1,
0.9066033, 0.664709, 1.251422, 0.7529412, 0, 1, 1,
0.9094464, 1.018345, -0.2271835, 0.7568628, 0, 1, 1,
0.9115563, 0.1061051, 0.6515703, 0.7647059, 0, 1, 1,
0.9130684, -0.5349239, 2.635671, 0.7686275, 0, 1, 1,
0.9130952, 1.356417, -0.8924286, 0.7764706, 0, 1, 1,
0.9149564, 0.3686194, 1.237855, 0.7803922, 0, 1, 1,
0.9157912, 1.199353, 0.5003416, 0.7882353, 0, 1, 1,
0.9215272, -0.7477884, 0.8746136, 0.7921569, 0, 1, 1,
0.9220248, 1.607965, 0.1243894, 0.8, 0, 1, 1,
0.9334931, -0.7472348, 3.50048, 0.8078431, 0, 1, 1,
0.936227, 0.3297514, 0.826005, 0.8117647, 0, 1, 1,
0.9381164, -0.01157694, 0.7200295, 0.8196079, 0, 1, 1,
0.9398911, -1.406361, 1.019131, 0.8235294, 0, 1, 1,
0.9472989, 0.708163, 1.620356, 0.8313726, 0, 1, 1,
0.9495862, 0.3123868, 1.155861, 0.8352941, 0, 1, 1,
0.9539368, 0.1926929, 1.910338, 0.8431373, 0, 1, 1,
0.9556686, -0.3903982, -0.735685, 0.8470588, 0, 1, 1,
0.9561564, 0.7180393, 0.8274094, 0.854902, 0, 1, 1,
0.9568381, 0.6806483, 0.4684292, 0.8588235, 0, 1, 1,
0.9597543, 0.1808131, -0.442898, 0.8666667, 0, 1, 1,
0.9617233, 0.8923396, -0.02698448, 0.8705882, 0, 1, 1,
0.9625592, 0.250008, 1.416155, 0.8784314, 0, 1, 1,
0.9656276, 1.026916, 0.1919941, 0.8823529, 0, 1, 1,
0.9763436, -1.687115, 4.691355, 0.8901961, 0, 1, 1,
0.9862557, 0.7830465, -0.03988913, 0.8941177, 0, 1, 1,
0.98638, -0.7048339, 2.65281, 0.9019608, 0, 1, 1,
0.9900256, 0.4961259, 1.4318, 0.9098039, 0, 1, 1,
0.9914191, -0.8425094, 1.346588, 0.9137255, 0, 1, 1,
0.997581, -1.591702, 2.915236, 0.9215686, 0, 1, 1,
1.001474, -0.8814236, 3.4214, 0.9254902, 0, 1, 1,
1.005816, -3.253607, 3.15037, 0.9333333, 0, 1, 1,
1.005826, 0.8068779, 2.290365, 0.9372549, 0, 1, 1,
1.013686, 0.5693343, 2.539405, 0.945098, 0, 1, 1,
1.016446, 0.6798012, 0.1380089, 0.9490196, 0, 1, 1,
1.027532, 0.4294217, 0.283916, 0.9568627, 0, 1, 1,
1.028784, 0.6015414, 1.236499, 0.9607843, 0, 1, 1,
1.02909, 0.3048362, 3.516991, 0.9686275, 0, 1, 1,
1.036891, 0.5578893, 2.126552, 0.972549, 0, 1, 1,
1.040267, 0.737163, 0.7233226, 0.9803922, 0, 1, 1,
1.043819, 0.8009357, 0.5921161, 0.9843137, 0, 1, 1,
1.049287, -0.1848649, 2.123419, 0.9921569, 0, 1, 1,
1.052001, 0.0458696, 1.915495, 0.9960784, 0, 1, 1,
1.052787, -0.08937255, 2.730722, 1, 0, 0.9960784, 1,
1.056176, 1.321427, 0.2775652, 1, 0, 0.9882353, 1,
1.058806, -0.01559171, -0.04533366, 1, 0, 0.9843137, 1,
1.060256, -0.1947942, -0.5557579, 1, 0, 0.9764706, 1,
1.060513, -0.3572579, 0.1944042, 1, 0, 0.972549, 1,
1.062052, 0.5328038, -0.2573559, 1, 0, 0.9647059, 1,
1.064309, -0.3323851, 2.589349, 1, 0, 0.9607843, 1,
1.065694, -2.357646, 1.548357, 1, 0, 0.9529412, 1,
1.067258, -0.8845503, 1.185619, 1, 0, 0.9490196, 1,
1.071228, 0.8856357, 0.2618418, 1, 0, 0.9411765, 1,
1.077484, -0.6519998, 2.553553, 1, 0, 0.9372549, 1,
1.081811, 0.7019579, 2.380062, 1, 0, 0.9294118, 1,
1.082356, -0.3834973, 3.382619, 1, 0, 0.9254902, 1,
1.083409, 0.8987262, 1.989091, 1, 0, 0.9176471, 1,
1.084733, 0.246362, 1.031808, 1, 0, 0.9137255, 1,
1.089744, 1.031864, -0.4475518, 1, 0, 0.9058824, 1,
1.091677, -0.08244668, 2.56697, 1, 0, 0.9019608, 1,
1.096695, -0.1004442, 0.1127058, 1, 0, 0.8941177, 1,
1.10384, 0.8304741, -0.06350041, 1, 0, 0.8862745, 1,
1.104507, -0.3157481, 2.130741, 1, 0, 0.8823529, 1,
1.105477, -0.511633, 0.1503466, 1, 0, 0.8745098, 1,
1.107601, 1.679641, -0.2408754, 1, 0, 0.8705882, 1,
1.109429, -0.1006053, 2.192216, 1, 0, 0.8627451, 1,
1.111648, -0.5025504, 1.294834, 1, 0, 0.8588235, 1,
1.123734, -0.9109017, 3.070408, 1, 0, 0.8509804, 1,
1.124029, -2.738604, 3.846069, 1, 0, 0.8470588, 1,
1.129619, -0.8659893, 0.95989, 1, 0, 0.8392157, 1,
1.129738, 1.128066, 0.5261724, 1, 0, 0.8352941, 1,
1.130931, 0.02627278, 0.147295, 1, 0, 0.827451, 1,
1.132291, -0.3308047, 4.140451, 1, 0, 0.8235294, 1,
1.139082, 0.6948476, 1.247991, 1, 0, 0.8156863, 1,
1.14505, 1.52908, 0.3853115, 1, 0, 0.8117647, 1,
1.148246, -1.180372, 2.578865, 1, 0, 0.8039216, 1,
1.149954, 0.4760301, 2.329628, 1, 0, 0.7960784, 1,
1.149995, -0.7749051, 1.826292, 1, 0, 0.7921569, 1,
1.152384, -0.3158997, 2.823269, 1, 0, 0.7843137, 1,
1.152686, 1.170936, 2.771634, 1, 0, 0.7803922, 1,
1.156389, 0.6968681, 1.269877, 1, 0, 0.772549, 1,
1.170009, 0.48434, -0.293959, 1, 0, 0.7686275, 1,
1.17051, -1.214257, 2.101498, 1, 0, 0.7607843, 1,
1.171835, -0.3086175, 2.599362, 1, 0, 0.7568628, 1,
1.172107, 1.339058, 3.120365, 1, 0, 0.7490196, 1,
1.172516, -1.137016, 3.98718, 1, 0, 0.7450981, 1,
1.173046, 1.431299, -0.5183941, 1, 0, 0.7372549, 1,
1.173129, -1.277969, 1.965201, 1, 0, 0.7333333, 1,
1.180374, -0.6160145, 1.150692, 1, 0, 0.7254902, 1,
1.180851, -1.231579, 4.5386, 1, 0, 0.7215686, 1,
1.199888, 0.8943031, 0.5778361, 1, 0, 0.7137255, 1,
1.209642, -1.950263, 1.969958, 1, 0, 0.7098039, 1,
1.213331, 0.2022816, 1.800445, 1, 0, 0.7019608, 1,
1.224753, -0.01939622, 3.83268, 1, 0, 0.6941177, 1,
1.228827, 1.2722, 0.6803517, 1, 0, 0.6901961, 1,
1.234509, 0.1742033, 2.541146, 1, 0, 0.682353, 1,
1.239486, -0.6580216, 1.482249, 1, 0, 0.6784314, 1,
1.24695, 0.6365719, -0.1201516, 1, 0, 0.6705883, 1,
1.247924, 0.9474384, 0.8787513, 1, 0, 0.6666667, 1,
1.249435, -0.1501593, 2.252227, 1, 0, 0.6588235, 1,
1.249731, 0.2244748, 0.5892168, 1, 0, 0.654902, 1,
1.255152, -0.1335363, 1.747657, 1, 0, 0.6470588, 1,
1.260239, -0.2808637, 0.1471918, 1, 0, 0.6431373, 1,
1.264834, 0.6721188, 1.507815, 1, 0, 0.6352941, 1,
1.267927, 2.195986, 1.07307, 1, 0, 0.6313726, 1,
1.276203, -0.8132547, 1.708764, 1, 0, 0.6235294, 1,
1.278747, 0.7676471, 1.796463, 1, 0, 0.6196079, 1,
1.281439, -0.8997578, 0.8307731, 1, 0, 0.6117647, 1,
1.286051, 0.9850293, -1.295007, 1, 0, 0.6078432, 1,
1.286831, 1.381824, 0.9376305, 1, 0, 0.6, 1,
1.287374, -0.1041645, 1.945685, 1, 0, 0.5921569, 1,
1.289245, -0.5621004, 3.555431, 1, 0, 0.5882353, 1,
1.296238, 0.3096515, 1.040147, 1, 0, 0.5803922, 1,
1.297691, -0.146359, 2.398343, 1, 0, 0.5764706, 1,
1.304868, 1.364843, 0.0675334, 1, 0, 0.5686275, 1,
1.329056, -1.060735, 2.284263, 1, 0, 0.5647059, 1,
1.330981, 0.7999338, 1.142927, 1, 0, 0.5568628, 1,
1.331305, -0.1188326, 1.95285, 1, 0, 0.5529412, 1,
1.332845, 0.3864949, -0.5017537, 1, 0, 0.5450981, 1,
1.338758, 0.7865778, 1.190231, 1, 0, 0.5411765, 1,
1.339168, -0.9197969, 2.800491, 1, 0, 0.5333334, 1,
1.344489, -0.7570183, 1.809487, 1, 0, 0.5294118, 1,
1.351728, -1.216504, 4.14189, 1, 0, 0.5215687, 1,
1.357862, 1.42043, -0.001305607, 1, 0, 0.5176471, 1,
1.363822, 0.7566489, 2.01733, 1, 0, 0.509804, 1,
1.375179, 1.283534, 0.7540212, 1, 0, 0.5058824, 1,
1.378204, 0.2659843, 1.718128, 1, 0, 0.4980392, 1,
1.378205, 0.456919, 0.9886205, 1, 0, 0.4901961, 1,
1.382463, -0.2520632, -0.395652, 1, 0, 0.4862745, 1,
1.383692, -1.057458, 2.505165, 1, 0, 0.4784314, 1,
1.395104, -1.397012, 2.47798, 1, 0, 0.4745098, 1,
1.403885, -0.3986896, 1.778309, 1, 0, 0.4666667, 1,
1.420209, -0.7863367, 1.425364, 1, 0, 0.4627451, 1,
1.442768, -0.2069086, 2.31036, 1, 0, 0.454902, 1,
1.464454, 0.1914605, 1.981052, 1, 0, 0.4509804, 1,
1.47527, 0.09216474, 2.082361, 1, 0, 0.4431373, 1,
1.47639, -0.1310939, 1.307741, 1, 0, 0.4392157, 1,
1.480576, 0.6023769, 1.829082, 1, 0, 0.4313726, 1,
1.485907, 1.212935, 2.288189, 1, 0, 0.427451, 1,
1.49685, 1.177944, 0.3520651, 1, 0, 0.4196078, 1,
1.520707, 1.590787, 1.409225, 1, 0, 0.4156863, 1,
1.524967, 1.069603, -0.2270641, 1, 0, 0.4078431, 1,
1.526896, 1.024689, 1.72066, 1, 0, 0.4039216, 1,
1.537109, -0.1473732, 2.081745, 1, 0, 0.3960784, 1,
1.546204, 1.413607, 1.036329, 1, 0, 0.3882353, 1,
1.553602, 0.5042933, 1.507605, 1, 0, 0.3843137, 1,
1.56516, 0.818245, 1.709413, 1, 0, 0.3764706, 1,
1.565978, 1.080014, -0.1743289, 1, 0, 0.372549, 1,
1.578659, 0.2164081, 1.92236, 1, 0, 0.3647059, 1,
1.582454, -0.921925, 1.353167, 1, 0, 0.3607843, 1,
1.594911, -2.12493, 1.928173, 1, 0, 0.3529412, 1,
1.602888, 0.5152323, 0.6424561, 1, 0, 0.3490196, 1,
1.629139, -1.024961, 2.362828, 1, 0, 0.3411765, 1,
1.630225, 1.166515, 0.8360128, 1, 0, 0.3372549, 1,
1.64945, 2.255757, 0.2754586, 1, 0, 0.3294118, 1,
1.683389, -1.680257, 2.081897, 1, 0, 0.3254902, 1,
1.684231, -1.451491, 1.157024, 1, 0, 0.3176471, 1,
1.69351, 0.3106133, 0.9188725, 1, 0, 0.3137255, 1,
1.700924, 0.05442577, 2.24135, 1, 0, 0.3058824, 1,
1.709545, 0.07995204, 1.900716, 1, 0, 0.2980392, 1,
1.728425, -1.527978, 1.84975, 1, 0, 0.2941177, 1,
1.734742, 0.312743, 0.9864155, 1, 0, 0.2862745, 1,
1.752693, -0.7630336, 2.601069, 1, 0, 0.282353, 1,
1.755985, -0.02863402, 2.289383, 1, 0, 0.2745098, 1,
1.759956, 1.324629, 0.9140422, 1, 0, 0.2705882, 1,
1.763343, -0.4385995, 1.352679, 1, 0, 0.2627451, 1,
1.783942, 0.1590973, -0.4311459, 1, 0, 0.2588235, 1,
1.785553, -0.007781358, 1.987297, 1, 0, 0.2509804, 1,
1.849874, -0.09774742, 0.3640917, 1, 0, 0.2470588, 1,
1.854171, -1.115812, 3.002898, 1, 0, 0.2392157, 1,
1.863154, -0.7711893, 1.291666, 1, 0, 0.2352941, 1,
1.882205, -0.115273, 2.118284, 1, 0, 0.227451, 1,
1.885775, 0.1368466, 1.039746, 1, 0, 0.2235294, 1,
1.895367, -1.92013, 1.597797, 1, 0, 0.2156863, 1,
1.903463, 0.01103375, 1.923801, 1, 0, 0.2117647, 1,
1.906028, 0.9147544, 0.5828406, 1, 0, 0.2039216, 1,
1.906238, 0.990487, -0.01301374, 1, 0, 0.1960784, 1,
1.913405, 2.467294, 2.850388, 1, 0, 0.1921569, 1,
1.92672, 1.278176, 0.3601456, 1, 0, 0.1843137, 1,
1.938032, -1.318658, 1.15352, 1, 0, 0.1803922, 1,
1.945472, 1.233712, 0.4331136, 1, 0, 0.172549, 1,
1.949172, -0.13633, 1.392747, 1, 0, 0.1686275, 1,
1.964802, 0.6007484, 0.5559677, 1, 0, 0.1607843, 1,
1.974506, 1.416341, 1.151097, 1, 0, 0.1568628, 1,
2.002173, -0.1772385, 0.7531537, 1, 0, 0.1490196, 1,
2.003852, 1.488569, 1.641881, 1, 0, 0.145098, 1,
2.029823, 0.8786028, 2.359578, 1, 0, 0.1372549, 1,
2.034081, -0.3827313, 1.329529, 1, 0, 0.1333333, 1,
2.042387, -0.7577993, 2.656738, 1, 0, 0.1254902, 1,
2.046319, 1.846697, 0.3894095, 1, 0, 0.1215686, 1,
2.057254, -0.3007851, 0.9861874, 1, 0, 0.1137255, 1,
2.085006, 1.216516, 1.685433, 1, 0, 0.1098039, 1,
2.08916, 1.220252, 3.191747, 1, 0, 0.1019608, 1,
2.090089, -0.2968635, 1.679663, 1, 0, 0.09411765, 1,
2.091662, -2.210674, 2.611128, 1, 0, 0.09019608, 1,
2.099465, -1.133855, 2.728101, 1, 0, 0.08235294, 1,
2.117389, 1.269702, -0.01769736, 1, 0, 0.07843138, 1,
2.132453, -0.1331998, 2.063171, 1, 0, 0.07058824, 1,
2.141271, 0.5645266, 1.29333, 1, 0, 0.06666667, 1,
2.204574, -0.2663608, 0.2291312, 1, 0, 0.05882353, 1,
2.239905, -0.007040968, 1.112007, 1, 0, 0.05490196, 1,
2.286664, 0.4188126, 0.507605, 1, 0, 0.04705882, 1,
2.290148, -0.8329961, 1.108565, 1, 0, 0.04313726, 1,
2.310246, -0.5906683, 3.002605, 1, 0, 0.03529412, 1,
2.397137, 0.5898854, 0.1543659, 1, 0, 0.03137255, 1,
2.408593, -0.891506, 1.152772, 1, 0, 0.02352941, 1,
2.457899, 0.01297311, 2.943885, 1, 0, 0.01960784, 1,
2.62956, -1.123109, 1.668491, 1, 0, 0.01176471, 1,
2.804706, 0.2894911, 0.7598591, 1, 0, 0.007843138, 1
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
-0.4747833, -4.291337, -6.930173, 0, -0.5, 0.5, 0.5,
-0.4747833, -4.291337, -6.930173, 1, -0.5, 0.5, 0.5,
-0.4747833, -4.291337, -6.930173, 1, 1.5, 0.5, 0.5,
-0.4747833, -4.291337, -6.930173, 0, 1.5, 0.5, 0.5
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
-4.86602, -0.1924572, -6.930173, 0, -0.5, 0.5, 0.5,
-4.86602, -0.1924572, -6.930173, 1, -0.5, 0.5, 0.5,
-4.86602, -0.1924572, -6.930173, 1, 1.5, 0.5, 0.5,
-4.86602, -0.1924572, -6.930173, 0, 1.5, 0.5, 0.5
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
-4.86602, -4.291337, -0.07323003, 0, -0.5, 0.5, 0.5,
-4.86602, -4.291337, -0.07323003, 1, -0.5, 0.5, 0.5,
-4.86602, -4.291337, -0.07323003, 1, 1.5, 0.5, 0.5,
-4.86602, -4.291337, -0.07323003, 0, 1.5, 0.5, 0.5
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
-3, -3.345442, -5.347802,
2, -3.345442, -5.347802,
-3, -3.345442, -5.347802,
-3, -3.503091, -5.61153,
-2, -3.345442, -5.347802,
-2, -3.503091, -5.61153,
-1, -3.345442, -5.347802,
-1, -3.503091, -5.61153,
0, -3.345442, -5.347802,
0, -3.503091, -5.61153,
1, -3.345442, -5.347802,
1, -3.503091, -5.61153,
2, -3.345442, -5.347802,
2, -3.503091, -5.61153
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
-3, -3.818389, -6.138988, 0, -0.5, 0.5, 0.5,
-3, -3.818389, -6.138988, 1, -0.5, 0.5, 0.5,
-3, -3.818389, -6.138988, 1, 1.5, 0.5, 0.5,
-3, -3.818389, -6.138988, 0, 1.5, 0.5, 0.5,
-2, -3.818389, -6.138988, 0, -0.5, 0.5, 0.5,
-2, -3.818389, -6.138988, 1, -0.5, 0.5, 0.5,
-2, -3.818389, -6.138988, 1, 1.5, 0.5, 0.5,
-2, -3.818389, -6.138988, 0, 1.5, 0.5, 0.5,
-1, -3.818389, -6.138988, 0, -0.5, 0.5, 0.5,
-1, -3.818389, -6.138988, 1, -0.5, 0.5, 0.5,
-1, -3.818389, -6.138988, 1, 1.5, 0.5, 0.5,
-1, -3.818389, -6.138988, 0, 1.5, 0.5, 0.5,
0, -3.818389, -6.138988, 0, -0.5, 0.5, 0.5,
0, -3.818389, -6.138988, 1, -0.5, 0.5, 0.5,
0, -3.818389, -6.138988, 1, 1.5, 0.5, 0.5,
0, -3.818389, -6.138988, 0, 1.5, 0.5, 0.5,
1, -3.818389, -6.138988, 0, -0.5, 0.5, 0.5,
1, -3.818389, -6.138988, 1, -0.5, 0.5, 0.5,
1, -3.818389, -6.138988, 1, 1.5, 0.5, 0.5,
1, -3.818389, -6.138988, 0, 1.5, 0.5, 0.5,
2, -3.818389, -6.138988, 0, -0.5, 0.5, 0.5,
2, -3.818389, -6.138988, 1, -0.5, 0.5, 0.5,
2, -3.818389, -6.138988, 1, 1.5, 0.5, 0.5,
2, -3.818389, -6.138988, 0, 1.5, 0.5, 0.5
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
-3.852657, -3, -5.347802,
-3.852657, 2, -5.347802,
-3.852657, -3, -5.347802,
-4.021551, -3, -5.61153,
-3.852657, -2, -5.347802,
-4.021551, -2, -5.61153,
-3.852657, -1, -5.347802,
-4.021551, -1, -5.61153,
-3.852657, 0, -5.347802,
-4.021551, 0, -5.61153,
-3.852657, 1, -5.347802,
-4.021551, 1, -5.61153,
-3.852657, 2, -5.347802,
-4.021551, 2, -5.61153
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
-4.359338, -3, -6.138988, 0, -0.5, 0.5, 0.5,
-4.359338, -3, -6.138988, 1, -0.5, 0.5, 0.5,
-4.359338, -3, -6.138988, 1, 1.5, 0.5, 0.5,
-4.359338, -3, -6.138988, 0, 1.5, 0.5, 0.5,
-4.359338, -2, -6.138988, 0, -0.5, 0.5, 0.5,
-4.359338, -2, -6.138988, 1, -0.5, 0.5, 0.5,
-4.359338, -2, -6.138988, 1, 1.5, 0.5, 0.5,
-4.359338, -2, -6.138988, 0, 1.5, 0.5, 0.5,
-4.359338, -1, -6.138988, 0, -0.5, 0.5, 0.5,
-4.359338, -1, -6.138988, 1, -0.5, 0.5, 0.5,
-4.359338, -1, -6.138988, 1, 1.5, 0.5, 0.5,
-4.359338, -1, -6.138988, 0, 1.5, 0.5, 0.5,
-4.359338, 0, -6.138988, 0, -0.5, 0.5, 0.5,
-4.359338, 0, -6.138988, 1, -0.5, 0.5, 0.5,
-4.359338, 0, -6.138988, 1, 1.5, 0.5, 0.5,
-4.359338, 0, -6.138988, 0, 1.5, 0.5, 0.5,
-4.359338, 1, -6.138988, 0, -0.5, 0.5, 0.5,
-4.359338, 1, -6.138988, 1, -0.5, 0.5, 0.5,
-4.359338, 1, -6.138988, 1, 1.5, 0.5, 0.5,
-4.359338, 1, -6.138988, 0, 1.5, 0.5, 0.5,
-4.359338, 2, -6.138988, 0, -0.5, 0.5, 0.5,
-4.359338, 2, -6.138988, 1, -0.5, 0.5, 0.5,
-4.359338, 2, -6.138988, 1, 1.5, 0.5, 0.5,
-4.359338, 2, -6.138988, 0, 1.5, 0.5, 0.5
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
-3.852657, -3.345442, -4,
-3.852657, -3.345442, 4,
-3.852657, -3.345442, -4,
-4.021551, -3.503091, -4,
-3.852657, -3.345442, -2,
-4.021551, -3.503091, -2,
-3.852657, -3.345442, 0,
-4.021551, -3.503091, 0,
-3.852657, -3.345442, 2,
-4.021551, -3.503091, 2,
-3.852657, -3.345442, 4,
-4.021551, -3.503091, 4
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
-4.359338, -3.818389, -4, 0, -0.5, 0.5, 0.5,
-4.359338, -3.818389, -4, 1, -0.5, 0.5, 0.5,
-4.359338, -3.818389, -4, 1, 1.5, 0.5, 0.5,
-4.359338, -3.818389, -4, 0, 1.5, 0.5, 0.5,
-4.359338, -3.818389, -2, 0, -0.5, 0.5, 0.5,
-4.359338, -3.818389, -2, 1, -0.5, 0.5, 0.5,
-4.359338, -3.818389, -2, 1, 1.5, 0.5, 0.5,
-4.359338, -3.818389, -2, 0, 1.5, 0.5, 0.5,
-4.359338, -3.818389, 0, 0, -0.5, 0.5, 0.5,
-4.359338, -3.818389, 0, 1, -0.5, 0.5, 0.5,
-4.359338, -3.818389, 0, 1, 1.5, 0.5, 0.5,
-4.359338, -3.818389, 0, 0, 1.5, 0.5, 0.5,
-4.359338, -3.818389, 2, 0, -0.5, 0.5, 0.5,
-4.359338, -3.818389, 2, 1, -0.5, 0.5, 0.5,
-4.359338, -3.818389, 2, 1, 1.5, 0.5, 0.5,
-4.359338, -3.818389, 2, 0, 1.5, 0.5, 0.5,
-4.359338, -3.818389, 4, 0, -0.5, 0.5, 0.5,
-4.359338, -3.818389, 4, 1, -0.5, 0.5, 0.5,
-4.359338, -3.818389, 4, 1, 1.5, 0.5, 0.5,
-4.359338, -3.818389, 4, 0, 1.5, 0.5, 0.5
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
-3.852657, -3.345442, -5.347802,
-3.852657, 2.960527, -5.347802,
-3.852657, -3.345442, 5.201342,
-3.852657, 2.960527, 5.201342,
-3.852657, -3.345442, -5.347802,
-3.852657, -3.345442, 5.201342,
-3.852657, 2.960527, -5.347802,
-3.852657, 2.960527, 5.201342,
-3.852657, -3.345442, -5.347802,
2.903091, -3.345442, -5.347802,
-3.852657, -3.345442, 5.201342,
2.903091, -3.345442, 5.201342,
-3.852657, 2.960527, -5.347802,
2.903091, 2.960527, -5.347802,
-3.852657, 2.960527, 5.201342,
2.903091, 2.960527, 5.201342,
2.903091, -3.345442, -5.347802,
2.903091, 2.960527, -5.347802,
2.903091, -3.345442, 5.201342,
2.903091, 2.960527, 5.201342,
2.903091, -3.345442, -5.347802,
2.903091, -3.345442, 5.201342,
2.903091, 2.960527, -5.347802,
2.903091, 2.960527, 5.201342
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
var radius = 7.488872;
var distance = 33.31884;
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
mvMatrix.translate( 0.4747833, 0.1924572, 0.07323003 );
mvMatrix.scale( 1.198552, 1.28404, 0.7675614 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.31884);
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
Ethoprop<-read.table("Ethoprop.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Ethoprop$V2
```

```
## Error in eval(expr, envir, enclos): object 'Ethoprop' not found
```

```r
y<-Ethoprop$V3
```

```
## Error in eval(expr, envir, enclos): object 'Ethoprop' not found
```

```r
z<-Ethoprop$V4
```

```
## Error in eval(expr, envir, enclos): object 'Ethoprop' not found
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
-3.754273, -0.2540881, -0.6436852, 0, 0, 1, 1, 1,
-2.656079, -0.1988043, -1.242688, 1, 0, 0, 1, 1,
-2.646532, -1.732043, -1.870228, 1, 0, 0, 1, 1,
-2.628983, 0.05869805, -2.211368, 1, 0, 0, 1, 1,
-2.589888, 2.021819, 0.2152573, 1, 0, 0, 1, 1,
-2.438459, 0.7890133, 0.06075922, 1, 0, 0, 1, 1,
-2.399652, 1.387625, -0.2363594, 0, 0, 0, 1, 1,
-2.362984, -1.213409, -3.123749, 0, 0, 0, 1, 1,
-2.340612, -1.965601, -0.7512538, 0, 0, 0, 1, 1,
-2.311348, -0.2672803, -3.498664, 0, 0, 0, 1, 1,
-2.28397, 1.089818, 0.238372, 0, 0, 0, 1, 1,
-2.250078, -0.2833995, -2.404265, 0, 0, 0, 1, 1,
-2.201846, -0.6576384, -2.243881, 0, 0, 0, 1, 1,
-2.154458, 1.097586, -2.562051, 1, 1, 1, 1, 1,
-2.115792, 0.4611152, -2.25076, 1, 1, 1, 1, 1,
-2.044205, -0.3226959, -3.162492, 1, 1, 1, 1, 1,
-1.999982, -0.1674244, -2.094068, 1, 1, 1, 1, 1,
-1.998777, -1.258221, -3.899891, 1, 1, 1, 1, 1,
-1.988698, 0.564716, -0.3029284, 1, 1, 1, 1, 1,
-1.956709, 0.2822567, -1.53618, 1, 1, 1, 1, 1,
-1.948564, -1.729761, -2.875557, 1, 1, 1, 1, 1,
-1.944672, 0.09587342, -1.76405, 1, 1, 1, 1, 1,
-1.943169, 1.196074, -0.9024105, 1, 1, 1, 1, 1,
-1.914896, -0.2373647, -0.2950048, 1, 1, 1, 1, 1,
-1.869683, -0.9411984, -2.280982, 1, 1, 1, 1, 1,
-1.846948, -0.4939653, -2.394716, 1, 1, 1, 1, 1,
-1.845396, -0.3292354, -2.544914, 1, 1, 1, 1, 1,
-1.823326, 1.741447, -0.4835973, 1, 1, 1, 1, 1,
-1.820154, -0.6881831, 0.01405341, 0, 0, 1, 1, 1,
-1.806193, -1.263157, -1.974438, 1, 0, 0, 1, 1,
-1.792324, -2.724377, -2.776045, 1, 0, 0, 1, 1,
-1.781749, -1.876193, -1.79514, 1, 0, 0, 1, 1,
-1.760265, 1.090347, -1.41233, 1, 0, 0, 1, 1,
-1.754144, -0.157315, -0.7845796, 1, 0, 0, 1, 1,
-1.746356, 0.01123086, -3.022161, 0, 0, 0, 1, 1,
-1.737862, -0.4757641, -2.709116, 0, 0, 0, 1, 1,
-1.729699, 0.5026563, -3.345639, 0, 0, 0, 1, 1,
-1.72782, 0.8096163, -1.116959, 0, 0, 0, 1, 1,
-1.713168, 1.035763, -0.3240024, 0, 0, 0, 1, 1,
-1.710037, -1.078764, -1.574243, 0, 0, 0, 1, 1,
-1.708864, -0.1566241, -2.089722, 0, 0, 0, 1, 1,
-1.698147, -1.235192, -2.882766, 1, 1, 1, 1, 1,
-1.695066, 1.437985, 0.575455, 1, 1, 1, 1, 1,
-1.683256, -0.2554075, -1.419458, 1, 1, 1, 1, 1,
-1.653679, 0.6349763, -2.464065, 1, 1, 1, 1, 1,
-1.651065, 1.006394, -0.8437827, 1, 1, 1, 1, 1,
-1.646597, 0.3011928, -0.8507542, 1, 1, 1, 1, 1,
-1.637001, -1.550384, -2.459811, 1, 1, 1, 1, 1,
-1.631561, 0.4057174, -1.991436, 1, 1, 1, 1, 1,
-1.630148, -0.07287268, -3.167438, 1, 1, 1, 1, 1,
-1.621245, -0.1235516, -2.24099, 1, 1, 1, 1, 1,
-1.591031, -2.349938, -3.32484, 1, 1, 1, 1, 1,
-1.590706, 0.04358755, -0.6936026, 1, 1, 1, 1, 1,
-1.546589, 0.1223627, -0.3162318, 1, 1, 1, 1, 1,
-1.53688, -0.6341018, -2.205005, 1, 1, 1, 1, 1,
-1.527986, 2.222532, 1.661629, 1, 1, 1, 1, 1,
-1.527841, -0.2677394, -0.3405495, 0, 0, 1, 1, 1,
-1.512084, 1.406133, 0.1298042, 1, 0, 0, 1, 1,
-1.507461, 0.8306894, -1.7639, 1, 0, 0, 1, 1,
-1.503904, -0.4815682, -0.7220864, 1, 0, 0, 1, 1,
-1.501499, 1.71908, -0.6178812, 1, 0, 0, 1, 1,
-1.48788, -1.270257, -2.572865, 1, 0, 0, 1, 1,
-1.4667, -2.127107, -2.439409, 0, 0, 0, 1, 1,
-1.460098, 0.1977306, -2.145, 0, 0, 0, 1, 1,
-1.457066, -0.1760522, -3.446392, 0, 0, 0, 1, 1,
-1.443358, -0.4865138, -0.7424224, 0, 0, 0, 1, 1,
-1.4244, 2.073751, -0.3244109, 0, 0, 0, 1, 1,
-1.422866, 0.3249728, -3.174163, 0, 0, 0, 1, 1,
-1.411328, 0.4426832, 0.4654242, 0, 0, 0, 1, 1,
-1.403494, -1.70437, -1.229074, 1, 1, 1, 1, 1,
-1.381952, 0.4232539, -0.1383291, 1, 1, 1, 1, 1,
-1.373685, -0.3412132, -0.8617318, 1, 1, 1, 1, 1,
-1.372167, -0.06767629, -1.502767, 1, 1, 1, 1, 1,
-1.367798, -0.1810861, -1.460697, 1, 1, 1, 1, 1,
-1.360536, 0.07870965, -2.073275, 1, 1, 1, 1, 1,
-1.349468, 1.858045, -0.1039147, 1, 1, 1, 1, 1,
-1.339412, -0.5128741, -0.9092894, 1, 1, 1, 1, 1,
-1.33679, -0.8943142, -2.098062, 1, 1, 1, 1, 1,
-1.329152, 0.5276397, -1.331135, 1, 1, 1, 1, 1,
-1.324832, -0.4249178, -0.7384898, 1, 1, 1, 1, 1,
-1.323702, -0.729045, -2.446593, 1, 1, 1, 1, 1,
-1.305541, -0.1896638, -2.027458, 1, 1, 1, 1, 1,
-1.301922, -1.062639, -1.74026, 1, 1, 1, 1, 1,
-1.301148, 0.6281203, -1.297099, 1, 1, 1, 1, 1,
-1.295348, -1.723607, -3.900776, 0, 0, 1, 1, 1,
-1.279611, 0.1536897, -3.760103, 1, 0, 0, 1, 1,
-1.267707, -1.8731, -3.513885, 1, 0, 0, 1, 1,
-1.266017, 0.5653061, 0.6760929, 1, 0, 0, 1, 1,
-1.264455, 0.2600252, 0.2147121, 1, 0, 0, 1, 1,
-1.25879, 1.193243, -1.523452, 1, 0, 0, 1, 1,
-1.2549, 0.1081314, -0.9236646, 0, 0, 0, 1, 1,
-1.250661, -1.771008, -2.045107, 0, 0, 0, 1, 1,
-1.244796, -0.670473, -1.728339, 0, 0, 0, 1, 1,
-1.243683, -0.2998658, -1.97893, 0, 0, 0, 1, 1,
-1.243408, -1.17391, -4.298934, 0, 0, 0, 1, 1,
-1.241487, -0.7523731, -3.265525, 0, 0, 0, 1, 1,
-1.233735, -1.102595, 0.8792463, 0, 0, 0, 1, 1,
-1.22506, 1.389879, -0.6481944, 1, 1, 1, 1, 1,
-1.223018, 1.40855, -0.6691871, 1, 1, 1, 1, 1,
-1.222857, -0.832688, -4.004428, 1, 1, 1, 1, 1,
-1.214754, 0.6093569, 0.1052828, 1, 1, 1, 1, 1,
-1.214515, 1.16429, 0.9196675, 1, 1, 1, 1, 1,
-1.209805, 0.6140198, 0.7200977, 1, 1, 1, 1, 1,
-1.19816, -0.982626, -0.9708028, 1, 1, 1, 1, 1,
-1.19636, -0.6699269, -3.149297, 1, 1, 1, 1, 1,
-1.18421, 0.06970798, -0.1574514, 1, 1, 1, 1, 1,
-1.174891, -0.2220005, -1.901106, 1, 1, 1, 1, 1,
-1.174624, 0.4487298, -2.821665, 1, 1, 1, 1, 1,
-1.171132, 0.3631596, -0.2553737, 1, 1, 1, 1, 1,
-1.153585, -1.017205, -2.600398, 1, 1, 1, 1, 1,
-1.146055, -0.06747875, -2.631489, 1, 1, 1, 1, 1,
-1.144466, 1.10043, -0.3908363, 1, 1, 1, 1, 1,
-1.137778, 0.2563622, -0.7093204, 0, 0, 1, 1, 1,
-1.131165, -0.6431355, -0.6910425, 1, 0, 0, 1, 1,
-1.129792, -0.42463, -0.5546916, 1, 0, 0, 1, 1,
-1.118444, 0.2540577, -1.988733, 1, 0, 0, 1, 1,
-1.103548, -1.679944, -2.97612, 1, 0, 0, 1, 1,
-1.101572, -2.404469, -1.101644, 1, 0, 0, 1, 1,
-1.092732, 0.640992, -1.494418, 0, 0, 0, 1, 1,
-1.084507, -0.4407496, -1.217412, 0, 0, 0, 1, 1,
-1.076571, -1.514898, -2.626709, 0, 0, 0, 1, 1,
-1.071489, -0.3442442, -0.8660577, 0, 0, 0, 1, 1,
-1.063841, 0.204504, -1.624044, 0, 0, 0, 1, 1,
-1.061389, -0.5949931, 0.3245685, 0, 0, 0, 1, 1,
-1.05639, -0.103574, -2.644377, 0, 0, 0, 1, 1,
-1.048104, 0.6933253, -1.213156, 1, 1, 1, 1, 1,
-1.03678, -0.2479566, -1.877865, 1, 1, 1, 1, 1,
-1.023256, -1.224671, -2.267217, 1, 1, 1, 1, 1,
-1.013476, -0.442039, -2.542297, 1, 1, 1, 1, 1,
-0.9996463, 0.338896, -1.410347, 1, 1, 1, 1, 1,
-0.9995617, 1.745283, -0.4990624, 1, 1, 1, 1, 1,
-0.9978253, 1.600455, -0.469198, 1, 1, 1, 1, 1,
-0.9971134, -1.441704, -1.555764, 1, 1, 1, 1, 1,
-0.9961642, 0.4722982, -0.5848806, 1, 1, 1, 1, 1,
-0.9949493, 1.238954, -0.2812729, 1, 1, 1, 1, 1,
-0.9876701, -0.9228818, -2.091701, 1, 1, 1, 1, 1,
-0.9854499, -1.256741, -4.228042, 1, 1, 1, 1, 1,
-0.9795879, -0.03772223, -1.795879, 1, 1, 1, 1, 1,
-0.9772075, -0.3772472, -1.840662, 1, 1, 1, 1, 1,
-0.9735717, -0.235329, -1.336211, 1, 1, 1, 1, 1,
-0.9696524, 0.03006706, -1.474961, 0, 0, 1, 1, 1,
-0.9662585, -1.453834, -4.581057, 1, 0, 0, 1, 1,
-0.9657337, -0.6468754, -2.671589, 1, 0, 0, 1, 1,
-0.9655149, 0.3798528, -0.8950649, 1, 0, 0, 1, 1,
-0.9610164, -0.8491772, -3.691631, 1, 0, 0, 1, 1,
-0.9609959, -2.738967, 0.3024013, 1, 0, 0, 1, 1,
-0.9548102, -1.11041, -3.810873, 0, 0, 0, 1, 1,
-0.9516363, -0.5626313, -0.9799728, 0, 0, 0, 1, 1,
-0.9506356, -1.396547, -1.803405, 0, 0, 0, 1, 1,
-0.9427116, -0.3994928, -2.171257, 0, 0, 0, 1, 1,
-0.9363058, -1.294318, -4.198833, 0, 0, 0, 1, 1,
-0.9333301, 0.3273232, -2.587428, 0, 0, 0, 1, 1,
-0.9242033, 0.5308771, -1.140014, 0, 0, 0, 1, 1,
-0.9226656, -0.8060746, -2.065428, 1, 1, 1, 1, 1,
-0.9174761, -0.847528, -3.569762, 1, 1, 1, 1, 1,
-0.9173239, -0.4649643, -2.552444, 1, 1, 1, 1, 1,
-0.9114016, -0.9642773, -1.391445, 1, 1, 1, 1, 1,
-0.9092017, -1.536996, -2.23129, 1, 1, 1, 1, 1,
-0.9036131, -0.4342871, -2.294648, 1, 1, 1, 1, 1,
-0.8981265, -0.5939756, -0.9641249, 1, 1, 1, 1, 1,
-0.8967254, 0.5311368, -0.5718463, 1, 1, 1, 1, 1,
-0.8953713, -0.3329594, -1.877542, 1, 1, 1, 1, 1,
-0.891534, -0.5881832, -2.757071, 1, 1, 1, 1, 1,
-0.8906068, 0.8954203, -1.990713, 1, 1, 1, 1, 1,
-0.8891309, 1.033127, 0.4606302, 1, 1, 1, 1, 1,
-0.8875683, 0.1417286, -2.195262, 1, 1, 1, 1, 1,
-0.885384, -0.777544, -1.194633, 1, 1, 1, 1, 1,
-0.8837582, -0.8336942, -1.004292, 1, 1, 1, 1, 1,
-0.8829241, 1.229974, 1.577681, 0, 0, 1, 1, 1,
-0.8827199, 1.806529, -0.8170446, 1, 0, 0, 1, 1,
-0.8822269, 0.7449946, -1.948156, 1, 0, 0, 1, 1,
-0.8737828, -0.8837211, -3.393047, 1, 0, 0, 1, 1,
-0.8723695, -0.6047568, -2.32546, 1, 0, 0, 1, 1,
-0.8709243, 0.5770628, -1.057136, 1, 0, 0, 1, 1,
-0.8686616, -0.1082975, 0.01595686, 0, 0, 0, 1, 1,
-0.8654076, -0.5743434, -2.365617, 0, 0, 0, 1, 1,
-0.8637015, 0.3357306, -0.0757501, 0, 0, 0, 1, 1,
-0.8619442, 0.4044364, -1.712518, 0, 0, 0, 1, 1,
-0.8546852, 0.04701397, -1.114317, 0, 0, 0, 1, 1,
-0.8494044, 0.113698, -1.364223, 0, 0, 0, 1, 1,
-0.8415683, -0.2222986, -0.5467775, 0, 0, 0, 1, 1,
-0.829479, 0.09775013, -2.077883, 1, 1, 1, 1, 1,
-0.8286149, 1.334073, -1.776729, 1, 1, 1, 1, 1,
-0.8268431, -0.3091718, -2.425871, 1, 1, 1, 1, 1,
-0.8265156, -0.4412617, -2.768905, 1, 1, 1, 1, 1,
-0.82645, -0.9425632, -2.426438, 1, 1, 1, 1, 1,
-0.8188495, -0.5639375, -1.598151, 1, 1, 1, 1, 1,
-0.8181948, 0.6190548, -0.9845948, 1, 1, 1, 1, 1,
-0.8079396, 1.109262, -1.706801, 1, 1, 1, 1, 1,
-0.8065143, 0.9869815, 0.1092596, 1, 1, 1, 1, 1,
-0.7985718, -0.5580269, -1.710846, 1, 1, 1, 1, 1,
-0.798016, 0.7319259, -1.783473, 1, 1, 1, 1, 1,
-0.7928352, -0.5615728, -2.495156, 1, 1, 1, 1, 1,
-0.7913995, 1.103438, -0.6320166, 1, 1, 1, 1, 1,
-0.7902136, -1.418168, -3.653749, 1, 1, 1, 1, 1,
-0.7801571, -0.3970707, -0.7696759, 1, 1, 1, 1, 1,
-0.7800043, 0.2236121, -0.2401057, 0, 0, 1, 1, 1,
-0.7778744, 0.9875365, 0.09985235, 1, 0, 0, 1, 1,
-0.7731633, 0.2203934, -0.3646378, 1, 0, 0, 1, 1,
-0.7717323, -0.03708003, -2.035529, 1, 0, 0, 1, 1,
-0.7579771, 0.981908, -0.1297465, 1, 0, 0, 1, 1,
-0.7574714, -0.7825426, -2.450103, 1, 0, 0, 1, 1,
-0.7568384, -1.524004, -3.538424, 0, 0, 0, 1, 1,
-0.7546649, -1.004351, -2.002631, 0, 0, 0, 1, 1,
-0.7546198, -0.864432, -2.323769, 0, 0, 0, 1, 1,
-0.7466164, 0.1403236, -1.244583, 0, 0, 0, 1, 1,
-0.7458673, 0.11851, 0.130307, 0, 0, 0, 1, 1,
-0.7448257, 0.1893394, -2.579201, 0, 0, 0, 1, 1,
-0.7424879, 0.6829327, -0.1182277, 0, 0, 0, 1, 1,
-0.7418137, -1.841324, -2.574344, 1, 1, 1, 1, 1,
-0.7414973, 1.347803, 0.05176556, 1, 1, 1, 1, 1,
-0.7402041, 0.891983, -1.188935, 1, 1, 1, 1, 1,
-0.7397245, -1.683351, 0.9249091, 1, 1, 1, 1, 1,
-0.7338865, -0.7396821, -2.609286, 1, 1, 1, 1, 1,
-0.7335524, -0.5020943, -3.337509, 1, 1, 1, 1, 1,
-0.731652, 0.009717724, -0.9684922, 1, 1, 1, 1, 1,
-0.73145, 0.1557422, -0.8360332, 1, 1, 1, 1, 1,
-0.7310842, 1.433341, -2.182055, 1, 1, 1, 1, 1,
-0.726797, -1.065647, -4.328863, 1, 1, 1, 1, 1,
-0.726255, -0.790337, -2.11492, 1, 1, 1, 1, 1,
-0.7257144, -0.1189071, -1.578034, 1, 1, 1, 1, 1,
-0.7253053, 0.3194023, -2.866022, 1, 1, 1, 1, 1,
-0.723335, 0.5007735, 1.190428, 1, 1, 1, 1, 1,
-0.7193466, -1.48354, -1.055684, 1, 1, 1, 1, 1,
-0.7139024, -0.9846463, -2.702299, 0, 0, 1, 1, 1,
-0.7089577, 1.687254, -2.285336, 1, 0, 0, 1, 1,
-0.7016142, -1.73045, -4.297164, 1, 0, 0, 1, 1,
-0.6973314, -0.2609029, -1.364066, 1, 0, 0, 1, 1,
-0.6895176, -0.5699867, -1.077056, 1, 0, 0, 1, 1,
-0.6885597, 2.851342, 0.3793403, 1, 0, 0, 1, 1,
-0.6877645, 1.425483, -0.9134936, 0, 0, 0, 1, 1,
-0.6875797, -1.313177, -2.380887, 0, 0, 0, 1, 1,
-0.684886, -1.158872, -1.024287, 0, 0, 0, 1, 1,
-0.6831401, 0.7561422, 0.289736, 0, 0, 0, 1, 1,
-0.6807824, -0.6642715, -3.925289, 0, 0, 0, 1, 1,
-0.680153, 0.4874239, -0.7326626, 0, 0, 0, 1, 1,
-0.6679153, -0.8792675, -1.72841, 0, 0, 0, 1, 1,
-0.6674781, 0.5564156, -0.2837997, 1, 1, 1, 1, 1,
-0.6650262, -1.015783, -3.402609, 1, 1, 1, 1, 1,
-0.6649806, 1.071092, -0.3519575, 1, 1, 1, 1, 1,
-0.6647451, -0.3785242, -3.452563, 1, 1, 1, 1, 1,
-0.6605936, 1.390617, 0.3411443, 1, 1, 1, 1, 1,
-0.6599439, -0.02352718, -2.342292, 1, 1, 1, 1, 1,
-0.6532612, -0.01234758, -3.225574, 1, 1, 1, 1, 1,
-0.6519204, 0.3576981, -0.6151222, 1, 1, 1, 1, 1,
-0.6441585, 0.9799445, -2.104542, 1, 1, 1, 1, 1,
-0.6403857, -0.03275726, -1.14167, 1, 1, 1, 1, 1,
-0.6391188, -0.3113568, -2.390078, 1, 1, 1, 1, 1,
-0.6373802, -0.2730102, -1.52977, 1, 1, 1, 1, 1,
-0.6348156, -0.5825328, -2.247809, 1, 1, 1, 1, 1,
-0.6342697, -1.037603, -3.290547, 1, 1, 1, 1, 1,
-0.632468, -0.3317811, -2.061351, 1, 1, 1, 1, 1,
-0.624319, 1.025593, 0.6497846, 0, 0, 1, 1, 1,
-0.6181407, -0.3806448, -5.194173, 1, 0, 0, 1, 1,
-0.6137329, 0.9519352, -2.060293, 1, 0, 0, 1, 1,
-0.6102321, -0.5981373, -3.767705, 1, 0, 0, 1, 1,
-0.6097802, 0.6780874, -0.6348147, 1, 0, 0, 1, 1,
-0.6077356, 0.5298839, 0.2286715, 1, 0, 0, 1, 1,
-0.6069219, -0.6287322, -1.676054, 0, 0, 0, 1, 1,
-0.6017424, 0.4392087, 0.1404663, 0, 0, 0, 1, 1,
-0.5994786, -0.4047303, -2.801225, 0, 0, 0, 1, 1,
-0.5949696, 0.01974789, -0.7463785, 0, 0, 0, 1, 1,
-0.5931602, 0.01059042, -2.260546, 0, 0, 0, 1, 1,
-0.5919999, 1.080117, -0.5842401, 0, 0, 0, 1, 1,
-0.5864381, 0.187725, -1.590501, 0, 0, 0, 1, 1,
-0.5838116, -2.286338, -0.9777466, 1, 1, 1, 1, 1,
-0.5695506, -0.9766254, -1.823663, 1, 1, 1, 1, 1,
-0.5682954, -0.2666619, -1.278899, 1, 1, 1, 1, 1,
-0.5667214, -0.5124008, -2.806593, 1, 1, 1, 1, 1,
-0.5613666, -1.245336, -2.430264, 1, 1, 1, 1, 1,
-0.5598253, 1.006767, -2.127454, 1, 1, 1, 1, 1,
-0.5588596, -0.6140819, -2.526118, 1, 1, 1, 1, 1,
-0.5554726, -1.089522, -1.634088, 1, 1, 1, 1, 1,
-0.548788, -1.144841, -2.758376, 1, 1, 1, 1, 1,
-0.5465603, 0.1888512, -1.065789, 1, 1, 1, 1, 1,
-0.5401406, 0.02648398, -1.179143, 1, 1, 1, 1, 1,
-0.5312626, 1.371562, -0.6438536, 1, 1, 1, 1, 1,
-0.5310587, 2.056096, -0.4368058, 1, 1, 1, 1, 1,
-0.5301763, -0.8871486, -2.76217, 1, 1, 1, 1, 1,
-0.5292963, 0.1966903, -1.125281, 1, 1, 1, 1, 1,
-0.5286684, 0.26413, -0.3098416, 0, 0, 1, 1, 1,
-0.5260306, -0.8331749, -3.832188, 1, 0, 0, 1, 1,
-0.5238183, -2.470503, -2.995115, 1, 0, 0, 1, 1,
-0.5227451, -0.09194911, -2.255058, 1, 0, 0, 1, 1,
-0.5226234, 0.4818262, -0.0343689, 1, 0, 0, 1, 1,
-0.5137383, 0.2348195, -0.09258991, 1, 0, 0, 1, 1,
-0.513415, 0.1479105, -1.314487, 0, 0, 0, 1, 1,
-0.5131026, 0.7396197, 0.03453778, 0, 0, 0, 1, 1,
-0.5112696, 0.5946908, -1.692483, 0, 0, 0, 1, 1,
-0.5098193, -0.7598401, -1.557008, 0, 0, 0, 1, 1,
-0.5057702, -0.05822406, -2.502657, 0, 0, 0, 1, 1,
-0.5023773, -0.5675965, -2.662253, 0, 0, 0, 1, 1,
-0.4994273, -0.07248193, -1.925948, 0, 0, 0, 1, 1,
-0.498056, -0.2043141, -4.205709, 1, 1, 1, 1, 1,
-0.4936206, -0.6224549, -0.9542584, 1, 1, 1, 1, 1,
-0.4876941, 1.464469, 0.2436096, 1, 1, 1, 1, 1,
-0.4806858, 0.1012522, -0.871302, 1, 1, 1, 1, 1,
-0.4793655, 1.144113, 1.085838, 1, 1, 1, 1, 1,
-0.474508, 0.2322955, 0.6114134, 1, 1, 1, 1, 1,
-0.4740908, -0.05661911, -3.396981, 1, 1, 1, 1, 1,
-0.4700458, 1.086449, -0.8485711, 1, 1, 1, 1, 1,
-0.4692273, -0.7008161, -3.01673, 1, 1, 1, 1, 1,
-0.4586103, 2.026725, 2.369082, 1, 1, 1, 1, 1,
-0.4511719, -1.530376, -0.7623528, 1, 1, 1, 1, 1,
-0.4487053, 0.9275827, 0.1073198, 1, 1, 1, 1, 1,
-0.4483708, -0.5992344, -2.179279, 1, 1, 1, 1, 1,
-0.4392405, -1.860488, -3.36015, 1, 1, 1, 1, 1,
-0.4285843, 1.126676, -0.04442065, 1, 1, 1, 1, 1,
-0.4275331, 0.8751156, 0.4557301, 0, 0, 1, 1, 1,
-0.4264564, 0.04613037, 0.1726187, 1, 0, 0, 1, 1,
-0.422789, -1.156146, -3.85894, 1, 0, 0, 1, 1,
-0.4221382, -1.344387, -1.996269, 1, 0, 0, 1, 1,
-0.4212051, 1.872024, -0.4419459, 1, 0, 0, 1, 1,
-0.4206314, 1.462059, 0.8560868, 1, 0, 0, 1, 1,
-0.4189547, -1.938043, -1.588097, 0, 0, 0, 1, 1,
-0.4178259, -0.4357534, -1.915526, 0, 0, 0, 1, 1,
-0.4175428, -0.9383512, -4.342941, 0, 0, 0, 1, 1,
-0.4130229, 0.1172618, 0.4769116, 0, 0, 0, 1, 1,
-0.4075739, 0.2775486, -0.7683451, 0, 0, 0, 1, 1,
-0.4029429, 1.40246, -1.076488, 0, 0, 0, 1, 1,
-0.4014753, 0.518855, -0.6420444, 0, 0, 0, 1, 1,
-0.4010742, -0.4727679, -3.121973, 1, 1, 1, 1, 1,
-0.3941616, 0.586683, 1.800106, 1, 1, 1, 1, 1,
-0.3926073, -0.9596235, -2.954073, 1, 1, 1, 1, 1,
-0.3898116, 1.32994, 1.183303, 1, 1, 1, 1, 1,
-0.38669, 1.772114, 0.2693298, 1, 1, 1, 1, 1,
-0.3812547, 0.02885578, -1.253168, 1, 1, 1, 1, 1,
-0.3784107, 0.7380086, -0.9856725, 1, 1, 1, 1, 1,
-0.3776833, -1.07858, -2.629366, 1, 1, 1, 1, 1,
-0.3767933, 0.2774555, 0.9955639, 1, 1, 1, 1, 1,
-0.3735583, -0.2004969, -2.0239, 1, 1, 1, 1, 1,
-0.3651935, 0.8457932, -0.6674343, 1, 1, 1, 1, 1,
-0.3641145, -0.08746558, -1.926704, 1, 1, 1, 1, 1,
-0.3640794, 0.778623, 1.06596, 1, 1, 1, 1, 1,
-0.3637313, 0.8913169, 0.05975995, 1, 1, 1, 1, 1,
-0.3634415, -0.4683909, -2.877831, 1, 1, 1, 1, 1,
-0.3634002, -0.2210474, -2.047153, 0, 0, 1, 1, 1,
-0.3488089, -0.8387729, -2.359475, 1, 0, 0, 1, 1,
-0.3485723, -1.110259, -2.417505, 1, 0, 0, 1, 1,
-0.3476124, -0.4316737, -3.229696, 1, 0, 0, 1, 1,
-0.3421329, -0.1082715, -3.11952, 1, 0, 0, 1, 1,
-0.3404117, -0.6585505, -2.999086, 1, 0, 0, 1, 1,
-0.3331944, 1.425223, 0.3737606, 0, 0, 0, 1, 1,
-0.3301204, 0.6395691, -0.4654214, 0, 0, 0, 1, 1,
-0.3298787, 0.186901, -0.1486154, 0, 0, 0, 1, 1,
-0.3239234, -1.095172, -2.708185, 0, 0, 0, 1, 1,
-0.323321, 1.125138, 0.5606094, 0, 0, 0, 1, 1,
-0.3209196, -1.289593, -2.880874, 0, 0, 0, 1, 1,
-0.3207673, -1.033925, -3.194557, 0, 0, 0, 1, 1,
-0.3189826, 0.7490706, 0.3082038, 1, 1, 1, 1, 1,
-0.3162207, -0.2890012, -1.781003, 1, 1, 1, 1, 1,
-0.3155188, -0.1330483, -0.7220123, 1, 1, 1, 1, 1,
-0.3109321, 0.5390118, -0.4177298, 1, 1, 1, 1, 1,
-0.3048824, -0.3698381, -4.321599, 1, 1, 1, 1, 1,
-0.3037272, -0.6548938, -2.078609, 1, 1, 1, 1, 1,
-0.301003, -0.4829894, -2.611748, 1, 1, 1, 1, 1,
-0.2992021, 0.1505327, 0.09548785, 1, 1, 1, 1, 1,
-0.2959824, 0.5619425, -0.475323, 1, 1, 1, 1, 1,
-0.292566, -0.1362754, -2.621747, 1, 1, 1, 1, 1,
-0.2920253, -0.3232348, -3.71102, 1, 1, 1, 1, 1,
-0.2881281, -0.7555493, -3.883247, 1, 1, 1, 1, 1,
-0.2870504, 0.1386947, -2.184963, 1, 1, 1, 1, 1,
-0.2867479, -2.17428, -0.8157745, 1, 1, 1, 1, 1,
-0.2819573, 0.02449007, -0.1934725, 1, 1, 1, 1, 1,
-0.2803676, 0.5963649, -1.701819, 0, 0, 1, 1, 1,
-0.2788558, 0.360664, 1.11502, 1, 0, 0, 1, 1,
-0.2761828, 0.4583192, -1.539877, 1, 0, 0, 1, 1,
-0.2761641, -0.5154127, -3.376874, 1, 0, 0, 1, 1,
-0.2711816, 0.297422, -1.959783, 1, 0, 0, 1, 1,
-0.2699282, -0.02180534, -2.830277, 1, 0, 0, 1, 1,
-0.2679395, -2.806152, -3.021806, 0, 0, 0, 1, 1,
-0.2677722, 1.050118, -0.4192701, 0, 0, 0, 1, 1,
-0.2659804, -0.8455878, -2.645484, 0, 0, 0, 1, 1,
-0.2654832, -0.5843229, -2.144327, 0, 0, 0, 1, 1,
-0.2644905, -1.376089, -1.379186, 0, 0, 0, 1, 1,
-0.263285, 0.01026457, -0.852132, 0, 0, 0, 1, 1,
-0.2597984, 0.9754217, -1.915798, 0, 0, 0, 1, 1,
-0.2578793, -2.107088, -2.583745, 1, 1, 1, 1, 1,
-0.2577207, -0.07967427, -1.746747, 1, 1, 1, 1, 1,
-0.2552175, 0.1350519, -2.355411, 1, 1, 1, 1, 1,
-0.2520045, 0.5163165, -2.03154, 1, 1, 1, 1, 1,
-0.2514758, -0.8529382, -0.4462077, 1, 1, 1, 1, 1,
-0.2474576, -0.5064228, -2.981777, 1, 1, 1, 1, 1,
-0.2389938, -0.8697323, -2.60567, 1, 1, 1, 1, 1,
-0.235602, -0.398899, -2.074794, 1, 1, 1, 1, 1,
-0.2350931, -0.8621798, -3.506082, 1, 1, 1, 1, 1,
-0.2331429, 1.764455, 1.302837, 1, 1, 1, 1, 1,
-0.2326805, 1.730086, 0.8021791, 1, 1, 1, 1, 1,
-0.22757, -1.0308, -2.590425, 1, 1, 1, 1, 1,
-0.2262464, 0.8610809, 0.1411498, 1, 1, 1, 1, 1,
-0.2259709, 0.6964139, 1.495197, 1, 1, 1, 1, 1,
-0.2228106, 0.1373611, -0.4743589, 1, 1, 1, 1, 1,
-0.2220943, 0.7248731, -0.3740103, 0, 0, 1, 1, 1,
-0.2202824, 0.7469856, -0.7805981, 1, 0, 0, 1, 1,
-0.2171163, -1.308943, -4.354118, 1, 0, 0, 1, 1,
-0.2157761, -0.3389309, -3.510806, 1, 0, 0, 1, 1,
-0.2157756, 1.088658, -1.245563, 1, 0, 0, 1, 1,
-0.1976234, 0.7744381, 2.087547, 1, 0, 0, 1, 1,
-0.1953176, -0.04969792, -1.570551, 0, 0, 0, 1, 1,
-0.1931097, -0.7126783, -3.26618, 0, 0, 0, 1, 1,
-0.1903911, -0.9237826, -3.60393, 0, 0, 0, 1, 1,
-0.1883037, 1.425082, -0.07288053, 0, 0, 0, 1, 1,
-0.1873522, -0.25309, -3.879294, 0, 0, 0, 1, 1,
-0.1872357, -0.7805595, -2.634041, 0, 0, 0, 1, 1,
-0.1833542, 1.036689, 1.164695, 0, 0, 0, 1, 1,
-0.1748355, 0.6092789, -0.8335205, 1, 1, 1, 1, 1,
-0.1730095, -0.4744477, -1.850394, 1, 1, 1, 1, 1,
-0.1680624, -0.4633249, -2.714773, 1, 1, 1, 1, 1,
-0.160538, 0.5377485, 0.3609316, 1, 1, 1, 1, 1,
-0.1474522, -0.9530914, -3.697672, 1, 1, 1, 1, 1,
-0.1473839, 1.359288, 0.1842906, 1, 1, 1, 1, 1,
-0.1471228, 0.7646782, -1.180404, 1, 1, 1, 1, 1,
-0.1455407, -0.2123028, -1.412177, 1, 1, 1, 1, 1,
-0.1449357, 0.1330163, 0.8817502, 1, 1, 1, 1, 1,
-0.1433257, -0.3982247, -1.518261, 1, 1, 1, 1, 1,
-0.1391247, 0.579819, 1.078939, 1, 1, 1, 1, 1,
-0.1352341, -0.2784178, -3.526437, 1, 1, 1, 1, 1,
-0.1333762, -0.1388847, -1.410475, 1, 1, 1, 1, 1,
-0.1321606, 0.1479126, 0.2772407, 1, 1, 1, 1, 1,
-0.1312329, 0.6268189, -0.1896142, 1, 1, 1, 1, 1,
-0.1311932, -0.4922204, -3.712137, 0, 0, 1, 1, 1,
-0.1255315, 1.755881, 0.7642388, 1, 0, 0, 1, 1,
-0.1221519, -0.8413541, -3.719358, 1, 0, 0, 1, 1,
-0.1202413, 0.01422486, -0.9970548, 1, 0, 0, 1, 1,
-0.1177088, -0.7624245, -0.6840312, 1, 0, 0, 1, 1,
-0.1172363, -0.2341448, -2.694004, 1, 0, 0, 1, 1,
-0.1115018, 0.08693808, -1.710409, 0, 0, 0, 1, 1,
-0.1096181, -1.237162, -2.8166, 0, 0, 0, 1, 1,
-0.1062268, 0.4116532, -0.8459023, 0, 0, 0, 1, 1,
-0.1012892, 1.266105, 1.357129, 0, 0, 0, 1, 1,
-0.09286335, -0.1429585, -2.57426, 0, 0, 0, 1, 1,
-0.09242201, -0.2705016, -2.154809, 0, 0, 0, 1, 1,
-0.08674869, 0.6621804, -0.5098044, 0, 0, 0, 1, 1,
-0.08643061, 0.2153556, 0.2043826, 1, 1, 1, 1, 1,
-0.08624358, 1.382301, -0.5694307, 1, 1, 1, 1, 1,
-0.08385316, -0.4408114, -2.042048, 1, 1, 1, 1, 1,
-0.08305823, -0.3273193, -1.306858, 1, 1, 1, 1, 1,
-0.0798094, 0.02634765, -0.8955645, 1, 1, 1, 1, 1,
-0.07860829, -1.32199, -3.411762, 1, 1, 1, 1, 1,
-0.07839012, 0.08774913, 0.566482, 1, 1, 1, 1, 1,
-0.07807276, -1.055698, -2.707172, 1, 1, 1, 1, 1,
-0.07570291, 0.5028175, -0.1343361, 1, 1, 1, 1, 1,
-0.0743464, -0.04970782, -2.087153, 1, 1, 1, 1, 1,
-0.0716054, -0.7463337, -3.33345, 1, 1, 1, 1, 1,
-0.06364726, -1.362381, -3.808898, 1, 1, 1, 1, 1,
-0.06159804, 0.162148, -0.05764039, 1, 1, 1, 1, 1,
-0.05997416, 0.5576767, -0.3197095, 1, 1, 1, 1, 1,
-0.05931495, 1.573883, -1.215586, 1, 1, 1, 1, 1,
-0.05770577, -0.4599903, -3.288496, 0, 0, 1, 1, 1,
-0.05757517, -0.2999841, -5.171249, 1, 0, 0, 1, 1,
-0.05286206, 1.276781, 0.2014169, 1, 0, 0, 1, 1,
-0.05008674, -1.06939, -3.356356, 1, 0, 0, 1, 1,
-0.04997203, -0.09612131, -2.576744, 1, 0, 0, 1, 1,
-0.0471032, -0.2936015, -2.590899, 1, 0, 0, 1, 1,
-0.04571617, 0.2799278, -0.6404011, 0, 0, 0, 1, 1,
-0.03052202, 0.8164585, 1.053383, 0, 0, 0, 1, 1,
-0.03032389, -1.42343, -4.034592, 0, 0, 0, 1, 1,
-0.02803313, -2.041934, -2.306964, 0, 0, 0, 1, 1,
-0.02622814, -0.06316648, -1.478948, 0, 0, 0, 1, 1,
-0.0148734, -2.429985, -4.787385, 0, 0, 0, 1, 1,
-0.01068875, -0.07893572, -2.954175, 0, 0, 0, 1, 1,
-0.006992592, 0.4270579, -0.9222512, 1, 1, 1, 1, 1,
-0.001420093, 1.954602, 0.08652521, 1, 1, 1, 1, 1,
0.004108534, -0.02399699, 4.060169, 1, 1, 1, 1, 1,
0.01027145, -0.3737034, 2.817551, 1, 1, 1, 1, 1,
0.01042274, -1.718665, 3.973309, 1, 1, 1, 1, 1,
0.01276258, -0.2779548, 2.274648, 1, 1, 1, 1, 1,
0.01332849, -0.2798358, 5.047713, 1, 1, 1, 1, 1,
0.01475794, 0.6951827, -0.5086118, 1, 1, 1, 1, 1,
0.02391369, 0.5714056, -1.445699, 1, 1, 1, 1, 1,
0.02480026, 0.3014441, -0.2127489, 1, 1, 1, 1, 1,
0.02513091, 1.284176, -0.6867944, 1, 1, 1, 1, 1,
0.02872992, -1.280252, 2.579004, 1, 1, 1, 1, 1,
0.0289899, 0.5715179, 0.3945993, 1, 1, 1, 1, 1,
0.02942662, -0.4939366, 3.501925, 1, 1, 1, 1, 1,
0.03171233, -0.4680228, 2.923711, 1, 1, 1, 1, 1,
0.03636123, 0.7532831, 1.570846, 0, 0, 1, 1, 1,
0.03669166, -0.3580085, 2.759068, 1, 0, 0, 1, 1,
0.03729288, 0.6980427, 0.5933991, 1, 0, 0, 1, 1,
0.03758481, -0.5607451, 2.106052, 1, 0, 0, 1, 1,
0.03884269, 1.409804, -1.259545, 1, 0, 0, 1, 1,
0.03888869, -0.6580769, 3.295558, 1, 0, 0, 1, 1,
0.03901642, -0.6070908, 2.18738, 0, 0, 0, 1, 1,
0.04329113, -0.0561556, 2.096064, 0, 0, 0, 1, 1,
0.04366471, 2.007638, 0.04620247, 0, 0, 0, 1, 1,
0.04421118, 1.042924, 0.8026457, 0, 0, 0, 1, 1,
0.05150134, 0.1967079, 1.068029, 0, 0, 0, 1, 1,
0.05202068, -0.6331555, 4.377904, 0, 0, 0, 1, 1,
0.05364206, -0.05596907, 2.368005, 0, 0, 0, 1, 1,
0.05933286, -0.5701075, 3.623673, 1, 1, 1, 1, 1,
0.06036038, -0.2795871, 1.862015, 1, 1, 1, 1, 1,
0.06174263, -0.4519905, 2.489329, 1, 1, 1, 1, 1,
0.06458183, -1.466445, 2.769376, 1, 1, 1, 1, 1,
0.06770946, -0.2061198, 2.825955, 1, 1, 1, 1, 1,
0.07049093, -0.2416261, 2.604046, 1, 1, 1, 1, 1,
0.07128254, -0.8591968, 5.044142, 1, 1, 1, 1, 1,
0.08482704, 1.002199, -0.3467477, 1, 1, 1, 1, 1,
0.08780124, -0.3011706, 4.572572, 1, 1, 1, 1, 1,
0.08872389, -0.9185265, 2.05297, 1, 1, 1, 1, 1,
0.09201708, 2.383076, 1.422028, 1, 1, 1, 1, 1,
0.09367323, 0.3242924, -2.317932, 1, 1, 1, 1, 1,
0.09478678, 0.1208933, 0.5339004, 1, 1, 1, 1, 1,
0.09541132, 0.1788837, 1.718565, 1, 1, 1, 1, 1,
0.09557971, -0.1363578, 4.47879, 1, 1, 1, 1, 1,
0.09643695, 1.87699, 1.444348, 0, 0, 1, 1, 1,
0.09833881, -0.161334, 1.832854, 1, 0, 0, 1, 1,
0.1029242, -1.242291, 4.02467, 1, 0, 0, 1, 1,
0.1132638, -0.7277912, 4.651837, 1, 0, 0, 1, 1,
0.1143474, -1.558809, 2.860338, 1, 0, 0, 1, 1,
0.1186537, 0.2888438, 1.054012, 1, 0, 0, 1, 1,
0.1211234, -0.3252148, 2.707699, 0, 0, 0, 1, 1,
0.1225947, 0.008353947, 1.995734, 0, 0, 0, 1, 1,
0.1232599, -0.08951519, 0.8208258, 0, 0, 0, 1, 1,
0.1246627, 0.05448205, 1.692688, 0, 0, 0, 1, 1,
0.1257575, -1.30294, 4.605662, 0, 0, 0, 1, 1,
0.1275043, 1.058593, 0.3427857, 0, 0, 0, 1, 1,
0.1312882, 1.016279, 0.1231162, 0, 0, 0, 1, 1,
0.1317026, -1.694462, 2.694523, 1, 1, 1, 1, 1,
0.1322766, 0.3234266, -0.5194757, 1, 1, 1, 1, 1,
0.1333394, 0.03378895, 1.636732, 1, 1, 1, 1, 1,
0.1335086, 0.05913801, 3.154753, 1, 1, 1, 1, 1,
0.1354941, -0.3845262, 1.305601, 1, 1, 1, 1, 1,
0.1357556, -0.9880512, 3.064212, 1, 1, 1, 1, 1,
0.1367857, -0.0437562, 0.5321061, 1, 1, 1, 1, 1,
0.1371377, 0.5223326, 0.7786769, 1, 1, 1, 1, 1,
0.137564, 0.07013734, 0.7330141, 1, 1, 1, 1, 1,
0.138115, -0.6397614, 3.062524, 1, 1, 1, 1, 1,
0.1384551, 1.450084, 0.7280469, 1, 1, 1, 1, 1,
0.1392182, -0.3692787, 3.620733, 1, 1, 1, 1, 1,
0.143731, -1.473336, 1.24583, 1, 1, 1, 1, 1,
0.1456683, -0.3131196, 3.374416, 1, 1, 1, 1, 1,
0.1512268, -0.8301342, 2.043132, 1, 1, 1, 1, 1,
0.1618859, -0.5505842, 3.534286, 0, 0, 1, 1, 1,
0.1624316, 0.6204863, -0.2676469, 1, 0, 0, 1, 1,
0.1649551, 0.07093921, -0.1376614, 1, 0, 0, 1, 1,
0.1653014, 0.4484565, 1.041654, 1, 0, 0, 1, 1,
0.1665279, 0.757964, 1.069463, 1, 0, 0, 1, 1,
0.1744618, -0.3518085, 2.95942, 1, 0, 0, 1, 1,
0.1744672, -0.5736428, 3.480127, 0, 0, 0, 1, 1,
0.176022, -0.2734337, 2.174937, 0, 0, 0, 1, 1,
0.1779989, -0.3137329, 4.637613, 0, 0, 0, 1, 1,
0.1836372, -0.708884, 2.568194, 0, 0, 0, 1, 1,
0.1862029, 0.4094079, -0.4386839, 0, 0, 0, 1, 1,
0.1903182, 0.9296647, -1.153343, 0, 0, 0, 1, 1,
0.1936473, 1.496554, -0.08713816, 0, 0, 0, 1, 1,
0.1947208, 0.8052394, 1.462465, 1, 1, 1, 1, 1,
0.1978011, -0.1201606, 2.204745, 1, 1, 1, 1, 1,
0.1980295, -0.7228498, 3.63239, 1, 1, 1, 1, 1,
0.2008684, -1.50399, 1.729673, 1, 1, 1, 1, 1,
0.2031853, 0.441276, 1.447085, 1, 1, 1, 1, 1,
0.2039255, -0.8497052, 3.499661, 1, 1, 1, 1, 1,
0.2057291, 0.5629509, -1.335557, 1, 1, 1, 1, 1,
0.2065072, -1.689995, 3.041481, 1, 1, 1, 1, 1,
0.208349, -0.4374828, 3.013246, 1, 1, 1, 1, 1,
0.211738, -0.2019255, 0.6836238, 1, 1, 1, 1, 1,
0.2186721, -0.003173087, 2.368595, 1, 1, 1, 1, 1,
0.2203185, 0.5836017, 0.8826704, 1, 1, 1, 1, 1,
0.2221709, -0.08400569, 3.669066, 1, 1, 1, 1, 1,
0.2222463, -0.5829142, 2.975586, 1, 1, 1, 1, 1,
0.2332839, 1.122074, -0.698072, 1, 1, 1, 1, 1,
0.2369352, -0.01767528, 1.922083, 0, 0, 1, 1, 1,
0.2402292, 0.1156337, 0.8409311, 1, 0, 0, 1, 1,
0.2405563, 1.45174, -0.1374773, 1, 0, 0, 1, 1,
0.2406062, 1.189267, -0.1144438, 1, 0, 0, 1, 1,
0.2445551, 0.6574621, -0.4754809, 1, 0, 0, 1, 1,
0.2492506, 0.6320803, -0.1162682, 1, 0, 0, 1, 1,
0.2501846, 0.6957678, -0.3314865, 0, 0, 0, 1, 1,
0.2505942, -1.608359, 3.720271, 0, 0, 0, 1, 1,
0.2507698, 0.7575198, 0.5387388, 0, 0, 0, 1, 1,
0.2511493, -1.402102, 4.874705, 0, 0, 0, 1, 1,
0.2529542, -0.5446404, 2.209285, 0, 0, 0, 1, 1,
0.2531974, -0.9057699, 1.737152, 0, 0, 0, 1, 1,
0.255836, 0.3170285, 0.7730888, 0, 0, 0, 1, 1,
0.2583466, -0.1136054, 3.295182, 1, 1, 1, 1, 1,
0.259978, -0.8560063, 2.656189, 1, 1, 1, 1, 1,
0.2619445, -0.5939155, 3.088147, 1, 1, 1, 1, 1,
0.2658491, 0.3199094, 0.8515606, 1, 1, 1, 1, 1,
0.2667674, 0.4959148, -1.345277, 1, 1, 1, 1, 1,
0.2704784, 0.9283339, 1.955954, 1, 1, 1, 1, 1,
0.2713512, -0.6210871, 2.324752, 1, 1, 1, 1, 1,
0.276989, -0.1348981, 1.944604, 1, 1, 1, 1, 1,
0.2805589, 0.6503497, 0.7697241, 1, 1, 1, 1, 1,
0.281121, -0.7847283, 3.028201, 1, 1, 1, 1, 1,
0.2830971, 0.392302, 0.5046999, 1, 1, 1, 1, 1,
0.2854514, 0.5601743, 0.3936065, 1, 1, 1, 1, 1,
0.2860178, 0.5729151, -0.8538064, 1, 1, 1, 1, 1,
0.288778, 0.2600466, -0.001103792, 1, 1, 1, 1, 1,
0.2887897, 0.7301005, 0.5492132, 1, 1, 1, 1, 1,
0.2890804, 0.4204118, 2.246726, 0, 0, 1, 1, 1,
0.2891946, 0.5977204, 1.395463, 1, 0, 0, 1, 1,
0.2894965, 0.3912809, 1.3199, 1, 0, 0, 1, 1,
0.2905821, 0.7008947, -0.3858451, 1, 0, 0, 1, 1,
0.2926955, 0.2656426, -0.1485154, 1, 0, 0, 1, 1,
0.2978015, -0.7114085, 4.096696, 1, 0, 0, 1, 1,
0.299095, -1.320655, 3.364669, 0, 0, 0, 1, 1,
0.3005251, 0.5403925, 2.213155, 0, 0, 0, 1, 1,
0.3007797, -1.018432, 4.238212, 0, 0, 0, 1, 1,
0.3094959, 0.1831248, 0.3293957, 0, 0, 0, 1, 1,
0.3101111, 0.6738245, 1.458919, 0, 0, 0, 1, 1,
0.3122357, 0.80106, -0.1067632, 0, 0, 0, 1, 1,
0.3142186, 0.9938798, 1.240601, 0, 0, 0, 1, 1,
0.3155549, -0.358573, 3.088261, 1, 1, 1, 1, 1,
0.3167258, 0.1237274, 2.170304, 1, 1, 1, 1, 1,
0.3206571, 0.7304489, 2.487235, 1, 1, 1, 1, 1,
0.3240171, -1.633327, 3.512514, 1, 1, 1, 1, 1,
0.325443, -1.017461, 2.64511, 1, 1, 1, 1, 1,
0.328684, 0.3454061, 2.04404, 1, 1, 1, 1, 1,
0.3360438, 0.3555342, 1.775391, 1, 1, 1, 1, 1,
0.3364601, 0.5528963, 1.373707, 1, 1, 1, 1, 1,
0.3383361, 0.8706154, 0.3705552, 1, 1, 1, 1, 1,
0.3392333, 0.8542153, 0.5457003, 1, 1, 1, 1, 1,
0.342253, 1.632096, 0.9690906, 1, 1, 1, 1, 1,
0.3437468, -0.5035206, 1.633067, 1, 1, 1, 1, 1,
0.3475869, 0.1029465, 1.628398, 1, 1, 1, 1, 1,
0.3514847, 2.868693, 0.9071407, 1, 1, 1, 1, 1,
0.3551143, 0.536074, 0.9388145, 1, 1, 1, 1, 1,
0.3618256, 0.9373509, -0.9046793, 0, 0, 1, 1, 1,
0.3628763, -0.7791881, 3.095818, 1, 0, 0, 1, 1,
0.3641907, -0.4748277, 2.758853, 1, 0, 0, 1, 1,
0.3652681, -0.8069964, 2.112759, 1, 0, 0, 1, 1,
0.3667117, -0.3714413, 3.523949, 1, 0, 0, 1, 1,
0.3719617, -0.5905899, 1.566011, 1, 0, 0, 1, 1,
0.3807255, 0.9354885, -1.61676, 0, 0, 0, 1, 1,
0.3849821, -0.6214973, 3.717181, 0, 0, 0, 1, 1,
0.388786, 0.5492089, 0.03124261, 0, 0, 0, 1, 1,
0.3893867, -0.3573103, 3.180578, 0, 0, 0, 1, 1,
0.3917617, -0.147591, 2.752841, 0, 0, 0, 1, 1,
0.3917779, -1.479987, 3.978346, 0, 0, 0, 1, 1,
0.3935803, -0.249872, 1.358805, 0, 0, 0, 1, 1,
0.3976048, -1.317832, 2.166327, 1, 1, 1, 1, 1,
0.3988666, 0.2503159, 1.08262, 1, 1, 1, 1, 1,
0.4009005, -0.9018044, 2.818741, 1, 1, 1, 1, 1,
0.40148, -1.19659, 1.649138, 1, 1, 1, 1, 1,
0.4044618, -0.196068, 3.346068, 1, 1, 1, 1, 1,
0.4085297, 0.5799964, -1.039042, 1, 1, 1, 1, 1,
0.4126267, -0.2763756, 1.796564, 1, 1, 1, 1, 1,
0.4144006, -1.138176, 2.652242, 1, 1, 1, 1, 1,
0.4158088, 0.3311459, -1.012023, 1, 1, 1, 1, 1,
0.4183304, -0.6233582, 1.435861, 1, 1, 1, 1, 1,
0.4201152, -0.7897807, 2.306607, 1, 1, 1, 1, 1,
0.4313496, -0.7094967, 2.619791, 1, 1, 1, 1, 1,
0.4332121, 0.33328, 2.147148, 1, 1, 1, 1, 1,
0.4347143, 1.503405, 0.6223748, 1, 1, 1, 1, 1,
0.4365185, 1.353421, -0.1520502, 1, 1, 1, 1, 1,
0.43753, 1.616867, -0.7682936, 0, 0, 1, 1, 1,
0.4408727, -0.591917, 4.324536, 1, 0, 0, 1, 1,
0.442134, 1.811182, -0.004958764, 1, 0, 0, 1, 1,
0.4423627, 0.7497722, -0.3854821, 1, 0, 0, 1, 1,
0.4438753, -1.028831, 1.758004, 1, 0, 0, 1, 1,
0.4452424, 0.4824789, 1.345092, 1, 0, 0, 1, 1,
0.4544918, -0.64843, 2.432543, 0, 0, 0, 1, 1,
0.4595384, -0.51065, 3.528632, 0, 0, 0, 1, 1,
0.461401, -1.302689, 0.7933472, 0, 0, 0, 1, 1,
0.4641638, 1.397502, -0.2724192, 0, 0, 0, 1, 1,
0.4670359, -1.932437, 4.755736, 0, 0, 0, 1, 1,
0.4726109, 0.140288, 1.247666, 0, 0, 0, 1, 1,
0.4766231, -1.735269, 3.718891, 0, 0, 0, 1, 1,
0.4800966, -0.6716983, 3.058833, 1, 1, 1, 1, 1,
0.4814798, -1.690546, 1.982305, 1, 1, 1, 1, 1,
0.4832118, 0.4309045, 1.123328, 1, 1, 1, 1, 1,
0.4882634, 0.6785983, 1.23629, 1, 1, 1, 1, 1,
0.4889937, 0.5770278, 0.4331565, 1, 1, 1, 1, 1,
0.4931149, -0.5980548, 2.099803, 1, 1, 1, 1, 1,
0.4985825, -1.083472, -0.6180003, 1, 1, 1, 1, 1,
0.5035394, 0.9306585, -2.125372, 1, 1, 1, 1, 1,
0.5043559, 0.7213517, -0.926236, 1, 1, 1, 1, 1,
0.5046222, -2.109475, 3.745831, 1, 1, 1, 1, 1,
0.5060312, 0.3912058, -0.161764, 1, 1, 1, 1, 1,
0.5064113, 0.0605244, 1.915659, 1, 1, 1, 1, 1,
0.5111693, -0.4631829, 2.037188, 1, 1, 1, 1, 1,
0.5151424, -1.552331, 4.791827, 1, 1, 1, 1, 1,
0.5161241, 1.561507, 0.1208096, 1, 1, 1, 1, 1,
0.5168444, -0.06765597, 1.964222, 0, 0, 1, 1, 1,
0.5177718, -0.985035, 1.454777, 1, 0, 0, 1, 1,
0.517822, 1.148858, 0.5650365, 1, 0, 0, 1, 1,
0.5179807, 0.06906999, 0.6128563, 1, 0, 0, 1, 1,
0.5191258, -0.40633, 2.337166, 1, 0, 0, 1, 1,
0.5211537, -0.2418403, 2.752855, 1, 0, 0, 1, 1,
0.5246326, -0.2485335, 3.733096, 0, 0, 0, 1, 1,
0.5296164, -0.2099268, 1.159887, 0, 0, 0, 1, 1,
0.5297108, 1.153306, 0.7431464, 0, 0, 0, 1, 1,
0.5298958, -0.6751286, 2.694331, 0, 0, 0, 1, 1,
0.5389128, 1.061925, 0.378289, 0, 0, 0, 1, 1,
0.5410978, -1.17428, 2.933084, 0, 0, 0, 1, 1,
0.5432063, 1.01565, 1.945116, 0, 0, 0, 1, 1,
0.5439341, 1.051902, -1.11937, 1, 1, 1, 1, 1,
0.5456194, -2.032599, 3.508514, 1, 1, 1, 1, 1,
0.5496231, 0.9766368, -0.07373897, 1, 1, 1, 1, 1,
0.5558267, -0.2239849, 3.449862, 1, 1, 1, 1, 1,
0.557139, -0.7220277, 1.954365, 1, 1, 1, 1, 1,
0.5583429, -0.2185995, 4.205602, 1, 1, 1, 1, 1,
0.5585542, -0.7725822, 2.095769, 1, 1, 1, 1, 1,
0.5658016, 0.2875881, 2.16916, 1, 1, 1, 1, 1,
0.566897, 0.459933, 0.6526999, 1, 1, 1, 1, 1,
0.5672529, 1.135877, -0.4273134, 1, 1, 1, 1, 1,
0.571223, 0.05214733, -0.2454994, 1, 1, 1, 1, 1,
0.5713682, -0.6067098, 4.253973, 1, 1, 1, 1, 1,
0.5763369, 1.032391, 1.116227, 1, 1, 1, 1, 1,
0.576605, 0.4997142, -0.4759088, 1, 1, 1, 1, 1,
0.5805417, 0.2580129, 1.204642, 1, 1, 1, 1, 1,
0.5826185, 0.06143347, 4.59268, 0, 0, 1, 1, 1,
0.5867791, -0.1073452, 1.038162, 1, 0, 0, 1, 1,
0.5872061, 0.8419541, 0.9212743, 1, 0, 0, 1, 1,
0.5872088, 0.1457678, 2.055976, 1, 0, 0, 1, 1,
0.5900265, -1.778857, 3.876413, 1, 0, 0, 1, 1,
0.5920468, -0.4713194, 2.456847, 1, 0, 0, 1, 1,
0.5993556, 0.1401132, 1.372569, 0, 0, 0, 1, 1,
0.6016704, -1.328737, 2.667293, 0, 0, 0, 1, 1,
0.6026477, -0.4199609, 2.094459, 0, 0, 0, 1, 1,
0.6042626, -0.03268445, 0.217535, 0, 0, 0, 1, 1,
0.6123923, 0.5072171, -1.402753, 0, 0, 0, 1, 1,
0.6156217, 0.2355692, 3.016705, 0, 0, 0, 1, 1,
0.6179304, 1.226055, -0.02540868, 0, 0, 0, 1, 1,
0.6214584, -0.6313103, 1.424855, 1, 1, 1, 1, 1,
0.6225959, 0.8096295, 0.2109061, 1, 1, 1, 1, 1,
0.6236105, -0.8415036, 3.721514, 1, 1, 1, 1, 1,
0.6248646, -1.866451, 0.9899517, 1, 1, 1, 1, 1,
0.6272435, 0.453734, 1.356116, 1, 1, 1, 1, 1,
0.6448626, 1.358935, -0.3091913, 1, 1, 1, 1, 1,
0.6470531, -0.2987887, 0.1315037, 1, 1, 1, 1, 1,
0.649911, -0.1010478, 2.609637, 1, 1, 1, 1, 1,
0.6501712, 0.3941569, 3.347921, 1, 1, 1, 1, 1,
0.6543187, -0.6243797, 0.9059582, 1, 1, 1, 1, 1,
0.6561316, -1.247317, 1.672226, 1, 1, 1, 1, 1,
0.6652163, 0.4960637, -0.2479748, 1, 1, 1, 1, 1,
0.6713276, -0.6040377, 2.012889, 1, 1, 1, 1, 1,
0.6739075, 0.0416473, 1.941603, 1, 1, 1, 1, 1,
0.6790909, -0.3463192, 2.841929, 1, 1, 1, 1, 1,
0.6795871, 0.8673275, 2.100529, 0, 0, 1, 1, 1,
0.6862091, -1.565326, 3.925222, 1, 0, 0, 1, 1,
0.6885466, -1.883392, 2.794691, 1, 0, 0, 1, 1,
0.6927661, -0.2239411, 1.82969, 1, 0, 0, 1, 1,
0.6947147, -1.035774, 1.819494, 1, 0, 0, 1, 1,
0.69508, 0.687569, 0.2216241, 1, 0, 0, 1, 1,
0.6970279, 0.5265667, 1.165668, 0, 0, 0, 1, 1,
0.6973103, 1.322586, 0.4456848, 0, 0, 0, 1, 1,
0.6976902, -1.309904, 2.788284, 0, 0, 0, 1, 1,
0.7045777, -0.2698804, 2.834427, 0, 0, 0, 1, 1,
0.7091548, -0.2043683, 4.082821, 0, 0, 0, 1, 1,
0.7136801, -1.493293, 2.271125, 0, 0, 0, 1, 1,
0.7169076, -1.969177, 1.900173, 0, 0, 0, 1, 1,
0.7193106, -1.06011, 0.2797907, 1, 1, 1, 1, 1,
0.7216907, 0.2179635, 1.371149, 1, 1, 1, 1, 1,
0.7219415, 0.3366878, 0.6546639, 1, 1, 1, 1, 1,
0.7250912, -1.213505, 1.906397, 1, 1, 1, 1, 1,
0.7255846, 2.044477, 0.3121354, 1, 1, 1, 1, 1,
0.7256417, -1.442618, 1.753056, 1, 1, 1, 1, 1,
0.7323413, 0.5498068, 0.9150866, 1, 1, 1, 1, 1,
0.7339373, -1.086699, 1.790547, 1, 1, 1, 1, 1,
0.7404367, 1.939632, 2.668131, 1, 1, 1, 1, 1,
0.742945, -0.8977474, 1.38573, 1, 1, 1, 1, 1,
0.7447414, -0.2088269, 2.096652, 1, 1, 1, 1, 1,
0.7561335, -0.3483215, 3.162738, 1, 1, 1, 1, 1,
0.7647189, -0.7072409, 3.140362, 1, 1, 1, 1, 1,
0.7735621, 1.074434, -0.1088936, 1, 1, 1, 1, 1,
0.7761522, 0.4120272, 0.6237839, 1, 1, 1, 1, 1,
0.7765887, -1.731456, 2.317514, 0, 0, 1, 1, 1,
0.7860587, -0.7834666, 1.641379, 1, 0, 0, 1, 1,
0.7922454, 1.922899, 0.9681928, 1, 0, 0, 1, 1,
0.7972686, 0.5323553, -0.3669754, 1, 0, 0, 1, 1,
0.802587, -1.190194, 1.303606, 1, 0, 0, 1, 1,
0.8041046, 0.4983698, 2.274086, 1, 0, 0, 1, 1,
0.8106, -0.7470711, 1.072521, 0, 0, 0, 1, 1,
0.8120264, 1.382739, -0.6432614, 0, 0, 0, 1, 1,
0.8130064, -1.0328, 2.033178, 0, 0, 0, 1, 1,
0.815563, 2.083115, -0.3669403, 0, 0, 0, 1, 1,
0.815956, -2.129862, 4.567954, 0, 0, 0, 1, 1,
0.8193369, 0.9394721, 1.573528, 0, 0, 0, 1, 1,
0.824416, 1.168006, -0.2240056, 0, 0, 0, 1, 1,
0.8256837, -0.2063925, -0.458642, 1, 1, 1, 1, 1,
0.8280378, 1.568877, 0.007225546, 1, 1, 1, 1, 1,
0.8283393, 0.5328992, -0.317894, 1, 1, 1, 1, 1,
0.8355647, -0.3231966, 2.596308, 1, 1, 1, 1, 1,
0.8421415, 0.2403964, 0.03315732, 1, 1, 1, 1, 1,
0.8426506, -0.7490479, 3.218794, 1, 1, 1, 1, 1,
0.8449705, 0.6421047, -0.9724697, 1, 1, 1, 1, 1,
0.8582602, 0.8025256, 1.119254, 1, 1, 1, 1, 1,
0.8589938, 1.623467, 0.06897694, 1, 1, 1, 1, 1,
0.8660507, 0.7693186, 0.6777609, 1, 1, 1, 1, 1,
0.8693345, 0.300098, 2.583228, 1, 1, 1, 1, 1,
0.8694503, -1.425214, 3.19427, 1, 1, 1, 1, 1,
0.8701508, 1.250561, -0.334966, 1, 1, 1, 1, 1,
0.871004, 2.015544, -0.1149463, 1, 1, 1, 1, 1,
0.8759094, 0.03927916, 1.186074, 1, 1, 1, 1, 1,
0.8767382, -0.2648019, 2.553525, 0, 0, 1, 1, 1,
0.8788876, 0.1736283, 2.861592, 1, 0, 0, 1, 1,
0.8808054, 0.9703129, 0.5896351, 1, 0, 0, 1, 1,
0.882066, -0.2504896, -0.2676108, 1, 0, 0, 1, 1,
0.8924381, -1.449167, 2.667883, 1, 0, 0, 1, 1,
0.8979093, 0.384502, 1.521485, 1, 0, 0, 1, 1,
0.9041948, 1.056102, 0.7609, 0, 0, 0, 1, 1,
0.9056861, 0.3222781, 0.6333814, 0, 0, 0, 1, 1,
0.9066033, 0.664709, 1.251422, 0, 0, 0, 1, 1,
0.9094464, 1.018345, -0.2271835, 0, 0, 0, 1, 1,
0.9115563, 0.1061051, 0.6515703, 0, 0, 0, 1, 1,
0.9130684, -0.5349239, 2.635671, 0, 0, 0, 1, 1,
0.9130952, 1.356417, -0.8924286, 0, 0, 0, 1, 1,
0.9149564, 0.3686194, 1.237855, 1, 1, 1, 1, 1,
0.9157912, 1.199353, 0.5003416, 1, 1, 1, 1, 1,
0.9215272, -0.7477884, 0.8746136, 1, 1, 1, 1, 1,
0.9220248, 1.607965, 0.1243894, 1, 1, 1, 1, 1,
0.9334931, -0.7472348, 3.50048, 1, 1, 1, 1, 1,
0.936227, 0.3297514, 0.826005, 1, 1, 1, 1, 1,
0.9381164, -0.01157694, 0.7200295, 1, 1, 1, 1, 1,
0.9398911, -1.406361, 1.019131, 1, 1, 1, 1, 1,
0.9472989, 0.708163, 1.620356, 1, 1, 1, 1, 1,
0.9495862, 0.3123868, 1.155861, 1, 1, 1, 1, 1,
0.9539368, 0.1926929, 1.910338, 1, 1, 1, 1, 1,
0.9556686, -0.3903982, -0.735685, 1, 1, 1, 1, 1,
0.9561564, 0.7180393, 0.8274094, 1, 1, 1, 1, 1,
0.9568381, 0.6806483, 0.4684292, 1, 1, 1, 1, 1,
0.9597543, 0.1808131, -0.442898, 1, 1, 1, 1, 1,
0.9617233, 0.8923396, -0.02698448, 0, 0, 1, 1, 1,
0.9625592, 0.250008, 1.416155, 1, 0, 0, 1, 1,
0.9656276, 1.026916, 0.1919941, 1, 0, 0, 1, 1,
0.9763436, -1.687115, 4.691355, 1, 0, 0, 1, 1,
0.9862557, 0.7830465, -0.03988913, 1, 0, 0, 1, 1,
0.98638, -0.7048339, 2.65281, 1, 0, 0, 1, 1,
0.9900256, 0.4961259, 1.4318, 0, 0, 0, 1, 1,
0.9914191, -0.8425094, 1.346588, 0, 0, 0, 1, 1,
0.997581, -1.591702, 2.915236, 0, 0, 0, 1, 1,
1.001474, -0.8814236, 3.4214, 0, 0, 0, 1, 1,
1.005816, -3.253607, 3.15037, 0, 0, 0, 1, 1,
1.005826, 0.8068779, 2.290365, 0, 0, 0, 1, 1,
1.013686, 0.5693343, 2.539405, 0, 0, 0, 1, 1,
1.016446, 0.6798012, 0.1380089, 1, 1, 1, 1, 1,
1.027532, 0.4294217, 0.283916, 1, 1, 1, 1, 1,
1.028784, 0.6015414, 1.236499, 1, 1, 1, 1, 1,
1.02909, 0.3048362, 3.516991, 1, 1, 1, 1, 1,
1.036891, 0.5578893, 2.126552, 1, 1, 1, 1, 1,
1.040267, 0.737163, 0.7233226, 1, 1, 1, 1, 1,
1.043819, 0.8009357, 0.5921161, 1, 1, 1, 1, 1,
1.049287, -0.1848649, 2.123419, 1, 1, 1, 1, 1,
1.052001, 0.0458696, 1.915495, 1, 1, 1, 1, 1,
1.052787, -0.08937255, 2.730722, 1, 1, 1, 1, 1,
1.056176, 1.321427, 0.2775652, 1, 1, 1, 1, 1,
1.058806, -0.01559171, -0.04533366, 1, 1, 1, 1, 1,
1.060256, -0.1947942, -0.5557579, 1, 1, 1, 1, 1,
1.060513, -0.3572579, 0.1944042, 1, 1, 1, 1, 1,
1.062052, 0.5328038, -0.2573559, 1, 1, 1, 1, 1,
1.064309, -0.3323851, 2.589349, 0, 0, 1, 1, 1,
1.065694, -2.357646, 1.548357, 1, 0, 0, 1, 1,
1.067258, -0.8845503, 1.185619, 1, 0, 0, 1, 1,
1.071228, 0.8856357, 0.2618418, 1, 0, 0, 1, 1,
1.077484, -0.6519998, 2.553553, 1, 0, 0, 1, 1,
1.081811, 0.7019579, 2.380062, 1, 0, 0, 1, 1,
1.082356, -0.3834973, 3.382619, 0, 0, 0, 1, 1,
1.083409, 0.8987262, 1.989091, 0, 0, 0, 1, 1,
1.084733, 0.246362, 1.031808, 0, 0, 0, 1, 1,
1.089744, 1.031864, -0.4475518, 0, 0, 0, 1, 1,
1.091677, -0.08244668, 2.56697, 0, 0, 0, 1, 1,
1.096695, -0.1004442, 0.1127058, 0, 0, 0, 1, 1,
1.10384, 0.8304741, -0.06350041, 0, 0, 0, 1, 1,
1.104507, -0.3157481, 2.130741, 1, 1, 1, 1, 1,
1.105477, -0.511633, 0.1503466, 1, 1, 1, 1, 1,
1.107601, 1.679641, -0.2408754, 1, 1, 1, 1, 1,
1.109429, -0.1006053, 2.192216, 1, 1, 1, 1, 1,
1.111648, -0.5025504, 1.294834, 1, 1, 1, 1, 1,
1.123734, -0.9109017, 3.070408, 1, 1, 1, 1, 1,
1.124029, -2.738604, 3.846069, 1, 1, 1, 1, 1,
1.129619, -0.8659893, 0.95989, 1, 1, 1, 1, 1,
1.129738, 1.128066, 0.5261724, 1, 1, 1, 1, 1,
1.130931, 0.02627278, 0.147295, 1, 1, 1, 1, 1,
1.132291, -0.3308047, 4.140451, 1, 1, 1, 1, 1,
1.139082, 0.6948476, 1.247991, 1, 1, 1, 1, 1,
1.14505, 1.52908, 0.3853115, 1, 1, 1, 1, 1,
1.148246, -1.180372, 2.578865, 1, 1, 1, 1, 1,
1.149954, 0.4760301, 2.329628, 1, 1, 1, 1, 1,
1.149995, -0.7749051, 1.826292, 0, 0, 1, 1, 1,
1.152384, -0.3158997, 2.823269, 1, 0, 0, 1, 1,
1.152686, 1.170936, 2.771634, 1, 0, 0, 1, 1,
1.156389, 0.6968681, 1.269877, 1, 0, 0, 1, 1,
1.170009, 0.48434, -0.293959, 1, 0, 0, 1, 1,
1.17051, -1.214257, 2.101498, 1, 0, 0, 1, 1,
1.171835, -0.3086175, 2.599362, 0, 0, 0, 1, 1,
1.172107, 1.339058, 3.120365, 0, 0, 0, 1, 1,
1.172516, -1.137016, 3.98718, 0, 0, 0, 1, 1,
1.173046, 1.431299, -0.5183941, 0, 0, 0, 1, 1,
1.173129, -1.277969, 1.965201, 0, 0, 0, 1, 1,
1.180374, -0.6160145, 1.150692, 0, 0, 0, 1, 1,
1.180851, -1.231579, 4.5386, 0, 0, 0, 1, 1,
1.199888, 0.8943031, 0.5778361, 1, 1, 1, 1, 1,
1.209642, -1.950263, 1.969958, 1, 1, 1, 1, 1,
1.213331, 0.2022816, 1.800445, 1, 1, 1, 1, 1,
1.224753, -0.01939622, 3.83268, 1, 1, 1, 1, 1,
1.228827, 1.2722, 0.6803517, 1, 1, 1, 1, 1,
1.234509, 0.1742033, 2.541146, 1, 1, 1, 1, 1,
1.239486, -0.6580216, 1.482249, 1, 1, 1, 1, 1,
1.24695, 0.6365719, -0.1201516, 1, 1, 1, 1, 1,
1.247924, 0.9474384, 0.8787513, 1, 1, 1, 1, 1,
1.249435, -0.1501593, 2.252227, 1, 1, 1, 1, 1,
1.249731, 0.2244748, 0.5892168, 1, 1, 1, 1, 1,
1.255152, -0.1335363, 1.747657, 1, 1, 1, 1, 1,
1.260239, -0.2808637, 0.1471918, 1, 1, 1, 1, 1,
1.264834, 0.6721188, 1.507815, 1, 1, 1, 1, 1,
1.267927, 2.195986, 1.07307, 1, 1, 1, 1, 1,
1.276203, -0.8132547, 1.708764, 0, 0, 1, 1, 1,
1.278747, 0.7676471, 1.796463, 1, 0, 0, 1, 1,
1.281439, -0.8997578, 0.8307731, 1, 0, 0, 1, 1,
1.286051, 0.9850293, -1.295007, 1, 0, 0, 1, 1,
1.286831, 1.381824, 0.9376305, 1, 0, 0, 1, 1,
1.287374, -0.1041645, 1.945685, 1, 0, 0, 1, 1,
1.289245, -0.5621004, 3.555431, 0, 0, 0, 1, 1,
1.296238, 0.3096515, 1.040147, 0, 0, 0, 1, 1,
1.297691, -0.146359, 2.398343, 0, 0, 0, 1, 1,
1.304868, 1.364843, 0.0675334, 0, 0, 0, 1, 1,
1.329056, -1.060735, 2.284263, 0, 0, 0, 1, 1,
1.330981, 0.7999338, 1.142927, 0, 0, 0, 1, 1,
1.331305, -0.1188326, 1.95285, 0, 0, 0, 1, 1,
1.332845, 0.3864949, -0.5017537, 1, 1, 1, 1, 1,
1.338758, 0.7865778, 1.190231, 1, 1, 1, 1, 1,
1.339168, -0.9197969, 2.800491, 1, 1, 1, 1, 1,
1.344489, -0.7570183, 1.809487, 1, 1, 1, 1, 1,
1.351728, -1.216504, 4.14189, 1, 1, 1, 1, 1,
1.357862, 1.42043, -0.001305607, 1, 1, 1, 1, 1,
1.363822, 0.7566489, 2.01733, 1, 1, 1, 1, 1,
1.375179, 1.283534, 0.7540212, 1, 1, 1, 1, 1,
1.378204, 0.2659843, 1.718128, 1, 1, 1, 1, 1,
1.378205, 0.456919, 0.9886205, 1, 1, 1, 1, 1,
1.382463, -0.2520632, -0.395652, 1, 1, 1, 1, 1,
1.383692, -1.057458, 2.505165, 1, 1, 1, 1, 1,
1.395104, -1.397012, 2.47798, 1, 1, 1, 1, 1,
1.403885, -0.3986896, 1.778309, 1, 1, 1, 1, 1,
1.420209, -0.7863367, 1.425364, 1, 1, 1, 1, 1,
1.442768, -0.2069086, 2.31036, 0, 0, 1, 1, 1,
1.464454, 0.1914605, 1.981052, 1, 0, 0, 1, 1,
1.47527, 0.09216474, 2.082361, 1, 0, 0, 1, 1,
1.47639, -0.1310939, 1.307741, 1, 0, 0, 1, 1,
1.480576, 0.6023769, 1.829082, 1, 0, 0, 1, 1,
1.485907, 1.212935, 2.288189, 1, 0, 0, 1, 1,
1.49685, 1.177944, 0.3520651, 0, 0, 0, 1, 1,
1.520707, 1.590787, 1.409225, 0, 0, 0, 1, 1,
1.524967, 1.069603, -0.2270641, 0, 0, 0, 1, 1,
1.526896, 1.024689, 1.72066, 0, 0, 0, 1, 1,
1.537109, -0.1473732, 2.081745, 0, 0, 0, 1, 1,
1.546204, 1.413607, 1.036329, 0, 0, 0, 1, 1,
1.553602, 0.5042933, 1.507605, 0, 0, 0, 1, 1,
1.56516, 0.818245, 1.709413, 1, 1, 1, 1, 1,
1.565978, 1.080014, -0.1743289, 1, 1, 1, 1, 1,
1.578659, 0.2164081, 1.92236, 1, 1, 1, 1, 1,
1.582454, -0.921925, 1.353167, 1, 1, 1, 1, 1,
1.594911, -2.12493, 1.928173, 1, 1, 1, 1, 1,
1.602888, 0.5152323, 0.6424561, 1, 1, 1, 1, 1,
1.629139, -1.024961, 2.362828, 1, 1, 1, 1, 1,
1.630225, 1.166515, 0.8360128, 1, 1, 1, 1, 1,
1.64945, 2.255757, 0.2754586, 1, 1, 1, 1, 1,
1.683389, -1.680257, 2.081897, 1, 1, 1, 1, 1,
1.684231, -1.451491, 1.157024, 1, 1, 1, 1, 1,
1.69351, 0.3106133, 0.9188725, 1, 1, 1, 1, 1,
1.700924, 0.05442577, 2.24135, 1, 1, 1, 1, 1,
1.709545, 0.07995204, 1.900716, 1, 1, 1, 1, 1,
1.728425, -1.527978, 1.84975, 1, 1, 1, 1, 1,
1.734742, 0.312743, 0.9864155, 0, 0, 1, 1, 1,
1.752693, -0.7630336, 2.601069, 1, 0, 0, 1, 1,
1.755985, -0.02863402, 2.289383, 1, 0, 0, 1, 1,
1.759956, 1.324629, 0.9140422, 1, 0, 0, 1, 1,
1.763343, -0.4385995, 1.352679, 1, 0, 0, 1, 1,
1.783942, 0.1590973, -0.4311459, 1, 0, 0, 1, 1,
1.785553, -0.007781358, 1.987297, 0, 0, 0, 1, 1,
1.849874, -0.09774742, 0.3640917, 0, 0, 0, 1, 1,
1.854171, -1.115812, 3.002898, 0, 0, 0, 1, 1,
1.863154, -0.7711893, 1.291666, 0, 0, 0, 1, 1,
1.882205, -0.115273, 2.118284, 0, 0, 0, 1, 1,
1.885775, 0.1368466, 1.039746, 0, 0, 0, 1, 1,
1.895367, -1.92013, 1.597797, 0, 0, 0, 1, 1,
1.903463, 0.01103375, 1.923801, 1, 1, 1, 1, 1,
1.906028, 0.9147544, 0.5828406, 1, 1, 1, 1, 1,
1.906238, 0.990487, -0.01301374, 1, 1, 1, 1, 1,
1.913405, 2.467294, 2.850388, 1, 1, 1, 1, 1,
1.92672, 1.278176, 0.3601456, 1, 1, 1, 1, 1,
1.938032, -1.318658, 1.15352, 1, 1, 1, 1, 1,
1.945472, 1.233712, 0.4331136, 1, 1, 1, 1, 1,
1.949172, -0.13633, 1.392747, 1, 1, 1, 1, 1,
1.964802, 0.6007484, 0.5559677, 1, 1, 1, 1, 1,
1.974506, 1.416341, 1.151097, 1, 1, 1, 1, 1,
2.002173, -0.1772385, 0.7531537, 1, 1, 1, 1, 1,
2.003852, 1.488569, 1.641881, 1, 1, 1, 1, 1,
2.029823, 0.8786028, 2.359578, 1, 1, 1, 1, 1,
2.034081, -0.3827313, 1.329529, 1, 1, 1, 1, 1,
2.042387, -0.7577993, 2.656738, 1, 1, 1, 1, 1,
2.046319, 1.846697, 0.3894095, 0, 0, 1, 1, 1,
2.057254, -0.3007851, 0.9861874, 1, 0, 0, 1, 1,
2.085006, 1.216516, 1.685433, 1, 0, 0, 1, 1,
2.08916, 1.220252, 3.191747, 1, 0, 0, 1, 1,
2.090089, -0.2968635, 1.679663, 1, 0, 0, 1, 1,
2.091662, -2.210674, 2.611128, 1, 0, 0, 1, 1,
2.099465, -1.133855, 2.728101, 0, 0, 0, 1, 1,
2.117389, 1.269702, -0.01769736, 0, 0, 0, 1, 1,
2.132453, -0.1331998, 2.063171, 0, 0, 0, 1, 1,
2.141271, 0.5645266, 1.29333, 0, 0, 0, 1, 1,
2.204574, -0.2663608, 0.2291312, 0, 0, 0, 1, 1,
2.239905, -0.007040968, 1.112007, 0, 0, 0, 1, 1,
2.286664, 0.4188126, 0.507605, 0, 0, 0, 1, 1,
2.290148, -0.8329961, 1.108565, 1, 1, 1, 1, 1,
2.310246, -0.5906683, 3.002605, 1, 1, 1, 1, 1,
2.397137, 0.5898854, 0.1543659, 1, 1, 1, 1, 1,
2.408593, -0.891506, 1.152772, 1, 1, 1, 1, 1,
2.457899, 0.01297311, 2.943885, 1, 1, 1, 1, 1,
2.62956, -1.123109, 1.668491, 1, 1, 1, 1, 1,
2.804706, 0.2894911, 0.7598591, 1, 1, 1, 1, 1
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
var radius = 9.351483;
var distance = 32.84668;
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
mvMatrix.translate( 0.4747832, 0.1924572, 0.07323003 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.84668);
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