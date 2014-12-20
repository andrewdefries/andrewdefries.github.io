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
-3.577798, -0.007374915, -2.771113, 1, 0, 0, 1,
-3.410369, -0.373664, -1.100087, 1, 0.007843138, 0, 1,
-2.826665, -1.201092, -2.800492, 1, 0.01176471, 0, 1,
-2.750756, -1.262056, -1.617941, 1, 0.01960784, 0, 1,
-2.372713, -0.381902, -1.170614, 1, 0.02352941, 0, 1,
-2.354085, -0.2205233, -1.318619, 1, 0.03137255, 0, 1,
-2.26453, -1.354411, -3.074111, 1, 0.03529412, 0, 1,
-2.16855, -1.118674, -1.206245, 1, 0.04313726, 0, 1,
-2.158086, -0.5435349, -1.538782, 1, 0.04705882, 0, 1,
-2.105742, 0.4209101, -2.07744, 1, 0.05490196, 0, 1,
-2.084027, -0.8278413, -2.617935, 1, 0.05882353, 0, 1,
-2.039885, -1.201995, -2.250998, 1, 0.06666667, 0, 1,
-2.018429, -1.08467, -1.289625, 1, 0.07058824, 0, 1,
-2.017886, 1.058414, -0.6754311, 1, 0.07843138, 0, 1,
-1.986283, -0.1709337, -1.745605, 1, 0.08235294, 0, 1,
-1.977809, 2.222978, -0.9539096, 1, 0.09019608, 0, 1,
-1.964503, -0.5899457, -2.035384, 1, 0.09411765, 0, 1,
-1.962829, 0.706149, -0.2083161, 1, 0.1019608, 0, 1,
-1.918204, -0.5616072, -2.070214, 1, 0.1098039, 0, 1,
-1.914785, 1.026516, -1.02311, 1, 0.1137255, 0, 1,
-1.891128, -1.501944, -2.128656, 1, 0.1215686, 0, 1,
-1.884937, 1.094516, -1.314434, 1, 0.1254902, 0, 1,
-1.861342, -0.8633668, -2.029277, 1, 0.1333333, 0, 1,
-1.85264, 0.009303435, -1.797202, 1, 0.1372549, 0, 1,
-1.85259, 1.364985, -0.2945661, 1, 0.145098, 0, 1,
-1.76921, -1.861658, -4.152196, 1, 0.1490196, 0, 1,
-1.729771, -0.06479745, -1.413413, 1, 0.1568628, 0, 1,
-1.723948, -0.2772271, -0.7888523, 1, 0.1607843, 0, 1,
-1.64904, 0.124118, -1.726059, 1, 0.1686275, 0, 1,
-1.63117, 1.645871, -2.015282, 1, 0.172549, 0, 1,
-1.626878, -0.001961872, -2.014563, 1, 0.1803922, 0, 1,
-1.601628, 0.1190609, -1.04766, 1, 0.1843137, 0, 1,
-1.585279, -1.182872, -2.949738, 1, 0.1921569, 0, 1,
-1.580237, 0.7381395, -0.5733335, 1, 0.1960784, 0, 1,
-1.577234, 0.2493387, -0.9330448, 1, 0.2039216, 0, 1,
-1.554768, -0.5551293, -2.624278, 1, 0.2117647, 0, 1,
-1.54662, 0.05498531, -0.7835224, 1, 0.2156863, 0, 1,
-1.546033, -0.7576852, -1.281063, 1, 0.2235294, 0, 1,
-1.524953, 0.9394131, 0.1732459, 1, 0.227451, 0, 1,
-1.522663, 2.556674, -1.281798, 1, 0.2352941, 0, 1,
-1.522356, 2.176856, -0.5078296, 1, 0.2392157, 0, 1,
-1.522244, 2.252636, -2.59727, 1, 0.2470588, 0, 1,
-1.521271, -0.09770617, -1.557958, 1, 0.2509804, 0, 1,
-1.51553, -0.3585612, -1.648466, 1, 0.2588235, 0, 1,
-1.500973, -0.1102012, -1.142545, 1, 0.2627451, 0, 1,
-1.472107, -0.842262, -1.219004, 1, 0.2705882, 0, 1,
-1.46989, -1.453517, -3.155024, 1, 0.2745098, 0, 1,
-1.461502, 0.5664337, -0.5816537, 1, 0.282353, 0, 1,
-1.455354, -0.02058385, -1.412286, 1, 0.2862745, 0, 1,
-1.447276, -0.1774651, 0.2589936, 1, 0.2941177, 0, 1,
-1.441444, 0.05002314, -1.686713, 1, 0.3019608, 0, 1,
-1.43571, 0.3954059, -0.7935085, 1, 0.3058824, 0, 1,
-1.375633, -1.622167, -4.252689, 1, 0.3137255, 0, 1,
-1.375248, -0.7476014, -2.816595, 1, 0.3176471, 0, 1,
-1.368866, -0.2454936, -2.042547, 1, 0.3254902, 0, 1,
-1.364959, -0.2771194, -1.465135, 1, 0.3294118, 0, 1,
-1.356736, -0.8398338, -1.472799, 1, 0.3372549, 0, 1,
-1.354441, 1.385192, -3.326807, 1, 0.3411765, 0, 1,
-1.350196, -1.499582, -3.081494, 1, 0.3490196, 0, 1,
-1.349822, 1.02612, -0.5251482, 1, 0.3529412, 0, 1,
-1.342877, 1.685335, -0.8972233, 1, 0.3607843, 0, 1,
-1.331933, -0.5020124, -0.3231232, 1, 0.3647059, 0, 1,
-1.320626, 2.35142, -1.243049, 1, 0.372549, 0, 1,
-1.317816, -0.5273172, -1.692978, 1, 0.3764706, 0, 1,
-1.317387, 0.6087751, 0.7376076, 1, 0.3843137, 0, 1,
-1.317174, 0.2390013, -2.043115, 1, 0.3882353, 0, 1,
-1.311607, -0.09295263, -2.027084, 1, 0.3960784, 0, 1,
-1.30725, 0.6912801, -1.228425, 1, 0.4039216, 0, 1,
-1.304801, 1.154082, -0.7410168, 1, 0.4078431, 0, 1,
-1.300391, -1.025859, -1.157332, 1, 0.4156863, 0, 1,
-1.299764, -0.3557856, -1.063136, 1, 0.4196078, 0, 1,
-1.299239, 0.4481303, -2.601662, 1, 0.427451, 0, 1,
-1.295975, -0.813134, -1.731955, 1, 0.4313726, 0, 1,
-1.295324, 0.08149814, -0.7976652, 1, 0.4392157, 0, 1,
-1.279338, 0.6332835, -1.891536, 1, 0.4431373, 0, 1,
-1.27126, 0.1136317, -1.576045, 1, 0.4509804, 0, 1,
-1.250458, -1.079038, -4.1158, 1, 0.454902, 0, 1,
-1.244813, 1.148417, -1.575625, 1, 0.4627451, 0, 1,
-1.242518, 0.6502413, -2.124212, 1, 0.4666667, 0, 1,
-1.231759, -1.282235, -2.42414, 1, 0.4745098, 0, 1,
-1.227634, 2.051472, -1.065392, 1, 0.4784314, 0, 1,
-1.222752, -1.210232, -1.664966, 1, 0.4862745, 0, 1,
-1.221045, -0.4932643, -1.491182, 1, 0.4901961, 0, 1,
-1.220971, 0.5313732, -1.895564, 1, 0.4980392, 0, 1,
-1.215243, 1.699307, -0.6435687, 1, 0.5058824, 0, 1,
-1.211208, -0.4721069, -1.158974, 1, 0.509804, 0, 1,
-1.203123, -0.7355232, -1.453869, 1, 0.5176471, 0, 1,
-1.195114, 1.798514, -1.486826, 1, 0.5215687, 0, 1,
-1.192613, -0.6101943, -3.583263, 1, 0.5294118, 0, 1,
-1.187388, -0.424628, -1.220873, 1, 0.5333334, 0, 1,
-1.183924, -0.01674646, -2.014188, 1, 0.5411765, 0, 1,
-1.179449, -1.918135, -1.668572, 1, 0.5450981, 0, 1,
-1.175596, -2.230847, -3.182853, 1, 0.5529412, 0, 1,
-1.17055, -0.1877785, -3.143373, 1, 0.5568628, 0, 1,
-1.167536, -1.202468, -1.791919, 1, 0.5647059, 0, 1,
-1.163325, -1.246791, -1.638622, 1, 0.5686275, 0, 1,
-1.159732, 0.4672063, -0.9488158, 1, 0.5764706, 0, 1,
-1.158703, 1.041009, -0.9507362, 1, 0.5803922, 0, 1,
-1.156006, 0.4538551, -0.09820727, 1, 0.5882353, 0, 1,
-1.15556, 1.272814, 0.6010065, 1, 0.5921569, 0, 1,
-1.152505, 0.1682503, -1.396358, 1, 0.6, 0, 1,
-1.152071, 1.451001, -0.7759975, 1, 0.6078432, 0, 1,
-1.147946, 0.1508716, -2.59851, 1, 0.6117647, 0, 1,
-1.14567, 1.34809, -1.664483, 1, 0.6196079, 0, 1,
-1.144343, 0.02523425, -1.726691, 1, 0.6235294, 0, 1,
-1.143062, -0.4456957, -2.614615, 1, 0.6313726, 0, 1,
-1.141959, 0.651188, -3.293189, 1, 0.6352941, 0, 1,
-1.138277, 0.518214, -0.3075425, 1, 0.6431373, 0, 1,
-1.12588, -1.941524, -2.985454, 1, 0.6470588, 0, 1,
-1.120586, 0.2466193, -2.061716, 1, 0.654902, 0, 1,
-1.10602, 0.7832853, 1.090958, 1, 0.6588235, 0, 1,
-1.10455, -0.8032329, -2.405597, 1, 0.6666667, 0, 1,
-1.078444, -0.2826821, -0.614406, 1, 0.6705883, 0, 1,
-1.077635, 0.7778233, -2.159994, 1, 0.6784314, 0, 1,
-1.069914, 1.909938, -0.3501115, 1, 0.682353, 0, 1,
-1.061738, -0.6538308, -3.543262, 1, 0.6901961, 0, 1,
-1.053367, 0.776825, -0.7483339, 1, 0.6941177, 0, 1,
-1.049599, 1.367678, 0.02245291, 1, 0.7019608, 0, 1,
-1.048578, 2.112831, -0.3110984, 1, 0.7098039, 0, 1,
-1.046823, 0.2525707, -2.656748, 1, 0.7137255, 0, 1,
-1.042334, 0.5607654, -2.091494, 1, 0.7215686, 0, 1,
-1.039445, 0.1659583, -1.172427, 1, 0.7254902, 0, 1,
-1.033222, -0.5798861, -3.36837, 1, 0.7333333, 0, 1,
-1.033111, -0.07485251, -1.326155, 1, 0.7372549, 0, 1,
-1.025622, -0.04633377, -1.912078, 1, 0.7450981, 0, 1,
-1.022163, -0.7715433, -2.630945, 1, 0.7490196, 0, 1,
-1.017026, -0.6266536, -1.312947, 1, 0.7568628, 0, 1,
-1.010549, -0.7361771, -2.0086, 1, 0.7607843, 0, 1,
-1.008473, 0.6128528, -0.3255291, 1, 0.7686275, 0, 1,
-1.003231, -0.7998124, -3.9115, 1, 0.772549, 0, 1,
-0.9973795, -1.350929, -2.160079, 1, 0.7803922, 0, 1,
-0.9945707, 1.566483, 0.1935998, 1, 0.7843137, 0, 1,
-0.9835154, 0.2275044, -1.873579, 1, 0.7921569, 0, 1,
-0.9825365, 0.5142854, 1.147729, 1, 0.7960784, 0, 1,
-0.9713654, -1.419068, -2.775415, 1, 0.8039216, 0, 1,
-0.9679419, 1.898472, -0.9874247, 1, 0.8117647, 0, 1,
-0.954245, -1.060575, -2.243745, 1, 0.8156863, 0, 1,
-0.9523826, -2.009175, -1.788011, 1, 0.8235294, 0, 1,
-0.9519945, -0.07754587, -1.223679, 1, 0.827451, 0, 1,
-0.9440508, 0.2830817, -1.407209, 1, 0.8352941, 0, 1,
-0.9368262, -1.115728, -2.368903, 1, 0.8392157, 0, 1,
-0.9307625, 0.2933745, -1.974067, 1, 0.8470588, 0, 1,
-0.928881, -1.143874, -1.629059, 1, 0.8509804, 0, 1,
-0.9286966, -0.3096861, -1.135874, 1, 0.8588235, 0, 1,
-0.9274619, 0.6774276, -1.10877, 1, 0.8627451, 0, 1,
-0.9241995, 1.806134, 0.8220609, 1, 0.8705882, 0, 1,
-0.9204796, -0.8594125, -1.498766, 1, 0.8745098, 0, 1,
-0.9192716, -1.125136, -2.891679, 1, 0.8823529, 0, 1,
-0.9185088, 0.4603419, 0.7044756, 1, 0.8862745, 0, 1,
-0.918392, 1.38494, -1.166923, 1, 0.8941177, 0, 1,
-0.9157357, -0.2410228, -1.944276, 1, 0.8980392, 0, 1,
-0.9130231, 1.655248, -0.02557291, 1, 0.9058824, 0, 1,
-0.9099131, -0.6966588, -3.010179, 1, 0.9137255, 0, 1,
-0.9013776, -0.8087801, -2.672292, 1, 0.9176471, 0, 1,
-0.8998048, 0.5794758, -2.972009, 1, 0.9254902, 0, 1,
-0.8904777, -0.9612348, -1.637627, 1, 0.9294118, 0, 1,
-0.8877168, 2.470547, -0.1655991, 1, 0.9372549, 0, 1,
-0.8711228, 0.561918, -0.1791325, 1, 0.9411765, 0, 1,
-0.8691847, 1.62048, -1.226611, 1, 0.9490196, 0, 1,
-0.8679479, 0.0593616, -3.091827, 1, 0.9529412, 0, 1,
-0.8677594, 0.1745198, -2.212231, 1, 0.9607843, 0, 1,
-0.866835, 0.5044634, -0.9239944, 1, 0.9647059, 0, 1,
-0.8610339, -0.3259674, -0.2351424, 1, 0.972549, 0, 1,
-0.8595859, 0.9179555, -1.814775, 1, 0.9764706, 0, 1,
-0.856945, 0.01426427, -2.255473, 1, 0.9843137, 0, 1,
-0.8508772, 0.4865624, -1.202904, 1, 0.9882353, 0, 1,
-0.8488757, -0.3426962, -1.055361, 1, 0.9960784, 0, 1,
-0.8432842, 0.9564314, -1.029925, 0.9960784, 1, 0, 1,
-0.8428543, -0.7378477, -1.569496, 0.9921569, 1, 0, 1,
-0.8423948, 1.064678, -1.521177, 0.9843137, 1, 0, 1,
-0.8409329, -0.05672531, -0.01169191, 0.9803922, 1, 0, 1,
-0.8356845, -0.6060559, -0.5953486, 0.972549, 1, 0, 1,
-0.8348212, 0.9377557, -0.8337679, 0.9686275, 1, 0, 1,
-0.8294206, 1.324847, -0.5872343, 0.9607843, 1, 0, 1,
-0.828774, 1.159295, -1.709396, 0.9568627, 1, 0, 1,
-0.8150676, -0.2781349, -1.888766, 0.9490196, 1, 0, 1,
-0.81365, 0.631304, 0.01120988, 0.945098, 1, 0, 1,
-0.808422, -0.07599571, -3.047867, 0.9372549, 1, 0, 1,
-0.8078462, -0.1905182, -1.517324, 0.9333333, 1, 0, 1,
-0.800967, 0.7525036, -1.860679, 0.9254902, 1, 0, 1,
-0.7918073, -0.3850178, -2.292441, 0.9215686, 1, 0, 1,
-0.7862265, -0.2990288, -3.849292, 0.9137255, 1, 0, 1,
-0.7811992, -0.05285915, -1.495728, 0.9098039, 1, 0, 1,
-0.7699229, -1.671476, -3.165708, 0.9019608, 1, 0, 1,
-0.7630875, -0.8349071, -2.380053, 0.8941177, 1, 0, 1,
-0.7611185, -0.2460311, -0.5475768, 0.8901961, 1, 0, 1,
-0.7601526, -0.7930564, -2.742563, 0.8823529, 1, 0, 1,
-0.7473899, 0.007724285, -2.937758, 0.8784314, 1, 0, 1,
-0.7453185, 0.2805381, -1.312042, 0.8705882, 1, 0, 1,
-0.7442133, 0.08197945, 1.317053, 0.8666667, 1, 0, 1,
-0.7412288, 1.662494, 0.08714633, 0.8588235, 1, 0, 1,
-0.7403777, -0.2104768, -2.47802, 0.854902, 1, 0, 1,
-0.7317666, 0.4272881, -2.692411, 0.8470588, 1, 0, 1,
-0.7288048, -0.4899125, -2.003621, 0.8431373, 1, 0, 1,
-0.7276957, 0.8692434, -0.7539574, 0.8352941, 1, 0, 1,
-0.7245704, -0.2908015, -1.181069, 0.8313726, 1, 0, 1,
-0.7169347, 2.29186, 0.4092932, 0.8235294, 1, 0, 1,
-0.7079566, -0.5873756, -3.827752, 0.8196079, 1, 0, 1,
-0.7076281, -0.630282, -1.87138, 0.8117647, 1, 0, 1,
-0.7049514, 0.07957489, -3.156919, 0.8078431, 1, 0, 1,
-0.7008573, 0.1631284, -1.584468, 0.8, 1, 0, 1,
-0.6993824, 2.171356, -2.070087, 0.7921569, 1, 0, 1,
-0.6976082, -0.5909778, -3.037145, 0.7882353, 1, 0, 1,
-0.6957362, -0.5450263, -0.8870314, 0.7803922, 1, 0, 1,
-0.6933424, -0.2597989, -2.241786, 0.7764706, 1, 0, 1,
-0.6904275, -0.2969895, -2.178845, 0.7686275, 1, 0, 1,
-0.6875131, -1.675983, -3.804709, 0.7647059, 1, 0, 1,
-0.6857211, 1.456991, 1.131726, 0.7568628, 1, 0, 1,
-0.6818801, -1.752114, -0.4221081, 0.7529412, 1, 0, 1,
-0.6794764, 0.01290627, -1.83384, 0.7450981, 1, 0, 1,
-0.6765009, 0.3732943, -0.4485593, 0.7411765, 1, 0, 1,
-0.6690928, 0.3853828, -0.616137, 0.7333333, 1, 0, 1,
-0.6680126, -0.972033, -0.8246619, 0.7294118, 1, 0, 1,
-0.6588669, -3.108543, -1.797154, 0.7215686, 1, 0, 1,
-0.6536183, 0.6468983, 0.05940547, 0.7176471, 1, 0, 1,
-0.6501576, -1.265381, -2.308717, 0.7098039, 1, 0, 1,
-0.6498234, -0.1090871, -0.1068478, 0.7058824, 1, 0, 1,
-0.6487448, -1.014677, -3.690926, 0.6980392, 1, 0, 1,
-0.6396877, 0.3637273, -2.552262, 0.6901961, 1, 0, 1,
-0.6352684, -0.3739589, -2.230525, 0.6862745, 1, 0, 1,
-0.6329449, -0.576463, -2.866174, 0.6784314, 1, 0, 1,
-0.6309776, 0.2740113, 0.03742792, 0.6745098, 1, 0, 1,
-0.6307582, 0.8522506, -0.5089636, 0.6666667, 1, 0, 1,
-0.6303578, 1.200192, -1.446856, 0.6627451, 1, 0, 1,
-0.6259546, 0.5465859, -0.4538423, 0.654902, 1, 0, 1,
-0.6212287, -0.006944315, 0.2003001, 0.6509804, 1, 0, 1,
-0.6149626, 0.07844379, -0.6236795, 0.6431373, 1, 0, 1,
-0.6141813, 1.203027, 0.0847798, 0.6392157, 1, 0, 1,
-0.6075386, -0.1876976, -0.976769, 0.6313726, 1, 0, 1,
-0.6063306, -0.2484204, -2.088181, 0.627451, 1, 0, 1,
-0.6061366, 0.9187461, -0.1741056, 0.6196079, 1, 0, 1,
-0.6033231, 1.069718, -1.368423, 0.6156863, 1, 0, 1,
-0.5987801, -0.785019, -2.760832, 0.6078432, 1, 0, 1,
-0.5973892, 0.4816926, -0.7653715, 0.6039216, 1, 0, 1,
-0.5973185, -0.5206826, -1.489478, 0.5960785, 1, 0, 1,
-0.5961965, -0.1016753, -0.9675537, 0.5882353, 1, 0, 1,
-0.5908548, 2.428362, -1.884314, 0.5843138, 1, 0, 1,
-0.5852138, -1.817742, -3.93417, 0.5764706, 1, 0, 1,
-0.583715, 0.9970023, 0.7431989, 0.572549, 1, 0, 1,
-0.581799, 0.876197, 0.8454779, 0.5647059, 1, 0, 1,
-0.5806289, 1.873211, 0.5655031, 0.5607843, 1, 0, 1,
-0.578562, -0.3876973, -3.687918, 0.5529412, 1, 0, 1,
-0.5769168, -1.362196, -2.858625, 0.5490196, 1, 0, 1,
-0.5764365, -1.131928, -2.096628, 0.5411765, 1, 0, 1,
-0.5732346, 0.5987303, -0.9994864, 0.5372549, 1, 0, 1,
-0.5686224, 1.131614, -1.863333, 0.5294118, 1, 0, 1,
-0.5663087, -0.3587652, -2.58465, 0.5254902, 1, 0, 1,
-0.5658647, -0.4278086, -2.643688, 0.5176471, 1, 0, 1,
-0.5576528, -0.2405337, -3.137379, 0.5137255, 1, 0, 1,
-0.5576127, 0.5919268, -0.9023518, 0.5058824, 1, 0, 1,
-0.5556124, 1.372802, -1.639497, 0.5019608, 1, 0, 1,
-0.5551991, 0.3793264, -0.1677264, 0.4941176, 1, 0, 1,
-0.5521389, -0.5898699, -3.110879, 0.4862745, 1, 0, 1,
-0.5521141, -1.255862, -2.990143, 0.4823529, 1, 0, 1,
-0.5518597, -0.4986994, -1.825055, 0.4745098, 1, 0, 1,
-0.5460882, 0.7637968, -0.3718499, 0.4705882, 1, 0, 1,
-0.5421802, -0.4363168, -1.894608, 0.4627451, 1, 0, 1,
-0.5351087, -1.985291, -4.705496, 0.4588235, 1, 0, 1,
-0.5291101, 1.395441, -0.489798, 0.4509804, 1, 0, 1,
-0.5288688, 0.9980217, -1.360901, 0.4470588, 1, 0, 1,
-0.5276635, -0.7663842, -4.209427, 0.4392157, 1, 0, 1,
-0.5252371, 0.1533303, 0.6322269, 0.4352941, 1, 0, 1,
-0.5239801, 0.1585779, -2.649504, 0.427451, 1, 0, 1,
-0.5220878, -0.3492287, -1.704918, 0.4235294, 1, 0, 1,
-0.5194514, 0.4514494, -0.8681077, 0.4156863, 1, 0, 1,
-0.5185534, 1.977181, 0.6724382, 0.4117647, 1, 0, 1,
-0.5174409, -1.121905, -3.096803, 0.4039216, 1, 0, 1,
-0.5149937, -0.1725838, -0.8420375, 0.3960784, 1, 0, 1,
-0.5119969, 0.816893, -1.936026, 0.3921569, 1, 0, 1,
-0.507113, -1.882579, -1.469551, 0.3843137, 1, 0, 1,
-0.5057347, -0.8521604, -2.419463, 0.3803922, 1, 0, 1,
-0.500475, -1.005726, -1.234779, 0.372549, 1, 0, 1,
-0.4967249, -1.000653, -2.751007, 0.3686275, 1, 0, 1,
-0.4942957, -0.6152893, -2.000305, 0.3607843, 1, 0, 1,
-0.4889895, -0.1966415, -1.857375, 0.3568628, 1, 0, 1,
-0.4887797, -0.8781506, -3.916957, 0.3490196, 1, 0, 1,
-0.4870885, -0.1289816, -3.3426, 0.345098, 1, 0, 1,
-0.4866578, -0.5674856, -2.769112, 0.3372549, 1, 0, 1,
-0.4797828, -0.3425828, -2.61641, 0.3333333, 1, 0, 1,
-0.4764064, -0.6797487, -2.201874, 0.3254902, 1, 0, 1,
-0.4760131, -0.1878461, -1.636711, 0.3215686, 1, 0, 1,
-0.4739815, 1.10816, 0.4445956, 0.3137255, 1, 0, 1,
-0.4731294, 0.1252857, -0.9640454, 0.3098039, 1, 0, 1,
-0.4711095, -0.9599199, -0.9203761, 0.3019608, 1, 0, 1,
-0.4709882, 0.1885113, -1.754819, 0.2941177, 1, 0, 1,
-0.4693195, 0.3856922, -1.144946, 0.2901961, 1, 0, 1,
-0.4682858, -1.830612, -3.02284, 0.282353, 1, 0, 1,
-0.4671985, -0.6291344, -4.674682, 0.2784314, 1, 0, 1,
-0.4580011, 1.079239, 0.400378, 0.2705882, 1, 0, 1,
-0.4524693, 0.5315186, -0.8120414, 0.2666667, 1, 0, 1,
-0.4520278, 0.08931222, -2.123869, 0.2588235, 1, 0, 1,
-0.451665, -0.808377, -4.238846, 0.254902, 1, 0, 1,
-0.4491654, -0.4284506, -3.710908, 0.2470588, 1, 0, 1,
-0.4481448, -0.3240851, -1.215585, 0.2431373, 1, 0, 1,
-0.4477843, 0.8959312, -1.706663, 0.2352941, 1, 0, 1,
-0.4472455, -0.3173294, -1.10544, 0.2313726, 1, 0, 1,
-0.4469854, -0.3421414, -2.76381, 0.2235294, 1, 0, 1,
-0.4462489, -0.07068401, -1.955417, 0.2196078, 1, 0, 1,
-0.4449305, 1.3335, -1.36532, 0.2117647, 1, 0, 1,
-0.4426953, 0.7220947, 0.4805069, 0.2078431, 1, 0, 1,
-0.4407708, 0.8450585, 0.4367349, 0.2, 1, 0, 1,
-0.4397064, -0.9214587, -2.209455, 0.1921569, 1, 0, 1,
-0.4330364, 0.1459694, -0.9567187, 0.1882353, 1, 0, 1,
-0.4330161, -0.1789315, -0.9897442, 0.1803922, 1, 0, 1,
-0.4311288, 2.024351, 0.06073142, 0.1764706, 1, 0, 1,
-0.4217688, 1.797105, -0.01701219, 0.1686275, 1, 0, 1,
-0.4215451, -1.28789, -3.139731, 0.1647059, 1, 0, 1,
-0.4199483, -2.558345, -3.901353, 0.1568628, 1, 0, 1,
-0.4158352, 0.4968785, 0.8317301, 0.1529412, 1, 0, 1,
-0.414173, 0.07898054, -0.8950199, 0.145098, 1, 0, 1,
-0.409618, -1.178361, -1.046597, 0.1411765, 1, 0, 1,
-0.4090518, -0.8550864, -2.559598, 0.1333333, 1, 0, 1,
-0.4072157, -0.566453, -2.716247, 0.1294118, 1, 0, 1,
-0.4039903, -1.563318, -2.232659, 0.1215686, 1, 0, 1,
-0.4021954, -0.2262717, -2.886593, 0.1176471, 1, 0, 1,
-0.4017284, -0.9312956, -0.5463078, 0.1098039, 1, 0, 1,
-0.4004379, 0.2429087, -0.4261339, 0.1058824, 1, 0, 1,
-0.39867, -0.006295473, -1.742939, 0.09803922, 1, 0, 1,
-0.3977096, -1.702734, -4.734647, 0.09019608, 1, 0, 1,
-0.3967773, -0.05722633, -1.788082, 0.08627451, 1, 0, 1,
-0.3950472, -0.781159, -0.07528704, 0.07843138, 1, 0, 1,
-0.3862428, -1.172244, -1.623044, 0.07450981, 1, 0, 1,
-0.3859574, 1.777719, -1.183861, 0.06666667, 1, 0, 1,
-0.3842177, 0.09811082, -1.43259, 0.0627451, 1, 0, 1,
-0.3832932, 2.060657, -0.1033075, 0.05490196, 1, 0, 1,
-0.3811698, -2.129356, -3.453519, 0.05098039, 1, 0, 1,
-0.3796762, -1.005387, -4.209451, 0.04313726, 1, 0, 1,
-0.3760585, 1.182987, -1.025394, 0.03921569, 1, 0, 1,
-0.3749627, -1.317806, -3.418795, 0.03137255, 1, 0, 1,
-0.3746257, -0.8184314, -3.021905, 0.02745098, 1, 0, 1,
-0.3741662, -0.4933267, -2.870522, 0.01960784, 1, 0, 1,
-0.3690714, 0.4338387, -0.07748192, 0.01568628, 1, 0, 1,
-0.365291, -0.3583943, -1.87317, 0.007843138, 1, 0, 1,
-0.3604553, -1.520568, -3.014406, 0.003921569, 1, 0, 1,
-0.3576532, -1.415572, -3.505053, 0, 1, 0.003921569, 1,
-0.3547683, -0.2239798, -2.148769, 0, 1, 0.01176471, 1,
-0.3542169, 0.6519204, 0.09124145, 0, 1, 0.01568628, 1,
-0.3539185, -1.066164, -3.741783, 0, 1, 0.02352941, 1,
-0.3518275, -0.3250037, -2.877106, 0, 1, 0.02745098, 1,
-0.351129, 0.1422786, -2.068776, 0, 1, 0.03529412, 1,
-0.3505754, -0.09815347, -2.420001, 0, 1, 0.03921569, 1,
-0.3502189, 0.05086313, -2.411414, 0, 1, 0.04705882, 1,
-0.3475544, -1.289798, -3.597854, 0, 1, 0.05098039, 1,
-0.3434479, 0.5799371, -1.068348, 0, 1, 0.05882353, 1,
-0.3420242, -0.3503808, -1.977531, 0, 1, 0.0627451, 1,
-0.3365756, 0.8212633, -1.497012, 0, 1, 0.07058824, 1,
-0.334936, 1.011395, 0.01790771, 0, 1, 0.07450981, 1,
-0.3324723, 0.1864565, -1.381101, 0, 1, 0.08235294, 1,
-0.3290487, -0.7017695, -2.252306, 0, 1, 0.08627451, 1,
-0.326232, -0.3294581, -1.460871, 0, 1, 0.09411765, 1,
-0.3253169, -0.9515938, -2.795599, 0, 1, 0.1019608, 1,
-0.3236088, -0.2755986, -1.797239, 0, 1, 0.1058824, 1,
-0.3210894, 1.881105, 0.7359657, 0, 1, 0.1137255, 1,
-0.3189992, -0.1578605, -1.342916, 0, 1, 0.1176471, 1,
-0.3167759, 0.1409867, -0.3844517, 0, 1, 0.1254902, 1,
-0.3158763, -0.7190315, -3.500742, 0, 1, 0.1294118, 1,
-0.3126283, -0.1981445, -1.352911, 0, 1, 0.1372549, 1,
-0.3114556, -0.1446137, -1.95768, 0, 1, 0.1411765, 1,
-0.3099087, 0.5668035, 0.3298428, 0, 1, 0.1490196, 1,
-0.3092176, -0.0241217, -1.802294, 0, 1, 0.1529412, 1,
-0.306052, 0.9959006, -0.5817689, 0, 1, 0.1607843, 1,
-0.3000959, -0.9707229, -2.66973, 0, 1, 0.1647059, 1,
-0.2936228, -1.775617, -3.316581, 0, 1, 0.172549, 1,
-0.2892401, 0.1221766, -2.8983, 0, 1, 0.1764706, 1,
-0.2891829, 0.5838333, -1.608316, 0, 1, 0.1843137, 1,
-0.285509, 0.9721528, -0.5279554, 0, 1, 0.1882353, 1,
-0.2838374, -1.811306, -2.929076, 0, 1, 0.1960784, 1,
-0.281186, -1.440836, -2.821096, 0, 1, 0.2039216, 1,
-0.2801077, 1.027746, 0.1873502, 0, 1, 0.2078431, 1,
-0.2775157, 1.798271, -0.0310405, 0, 1, 0.2156863, 1,
-0.2737941, -1.011477, -4.037066, 0, 1, 0.2196078, 1,
-0.2711951, -1.555136, -2.896096, 0, 1, 0.227451, 1,
-0.2660129, 0.8456187, 1.028033, 0, 1, 0.2313726, 1,
-0.2550139, -1.320538, -3.12209, 0, 1, 0.2392157, 1,
-0.2542563, 0.1136267, 1.137226, 0, 1, 0.2431373, 1,
-0.2529752, -0.2897985, -1.090724, 0, 1, 0.2509804, 1,
-0.2511592, 0.06179468, -2.195354, 0, 1, 0.254902, 1,
-0.2502812, 1.257692, -1.997453, 0, 1, 0.2627451, 1,
-0.2472562, -0.498487, -1.647648, 0, 1, 0.2666667, 1,
-0.2443896, -3.116317, -3.857541, 0, 1, 0.2745098, 1,
-0.2414981, 0.1763499, 0.3223853, 0, 1, 0.2784314, 1,
-0.2413391, -0.7212443, -2.325743, 0, 1, 0.2862745, 1,
-0.2411547, -0.1656185, -1.765589, 0, 1, 0.2901961, 1,
-0.2404054, 0.2571866, -0.6743202, 0, 1, 0.2980392, 1,
-0.239923, -0.01019162, 0.4311157, 0, 1, 0.3058824, 1,
-0.2378677, -0.8333187, -2.847963, 0, 1, 0.3098039, 1,
-0.2377739, 0.4820699, -0.491748, 0, 1, 0.3176471, 1,
-0.2339178, -0.133525, -2.008784, 0, 1, 0.3215686, 1,
-0.2313636, -0.7598709, -1.722916, 0, 1, 0.3294118, 1,
-0.2286182, 1.016498, -0.261745, 0, 1, 0.3333333, 1,
-0.2271678, -0.4646774, -3.703397, 0, 1, 0.3411765, 1,
-0.2248793, -1.191171, -4.450963, 0, 1, 0.345098, 1,
-0.2194295, -1.477266, -3.053495, 0, 1, 0.3529412, 1,
-0.2186153, -0.6394999, -2.326897, 0, 1, 0.3568628, 1,
-0.2166919, 0.9307406, -0.05549369, 0, 1, 0.3647059, 1,
-0.2164128, -1.945586, -4.273897, 0, 1, 0.3686275, 1,
-0.2159713, -1.048484, -3.754823, 0, 1, 0.3764706, 1,
-0.2132675, -2.29132, -3.02585, 0, 1, 0.3803922, 1,
-0.2104729, 0.129264, -2.441166, 0, 1, 0.3882353, 1,
-0.2053447, 1.77419, -0.5472108, 0, 1, 0.3921569, 1,
-0.2048275, 0.3142834, -0.2002683, 0, 1, 0.4, 1,
-0.2044954, 0.02018817, -2.146541, 0, 1, 0.4078431, 1,
-0.1976153, -0.336567, -2.845134, 0, 1, 0.4117647, 1,
-0.197214, -0.4176054, -2.180776, 0, 1, 0.4196078, 1,
-0.1883619, -0.01450309, -0.6326351, 0, 1, 0.4235294, 1,
-0.1828951, 1.267913, 0.9736965, 0, 1, 0.4313726, 1,
-0.1810297, 0.5084954, -0.6935779, 0, 1, 0.4352941, 1,
-0.180728, 0.4423614, -2.173723, 0, 1, 0.4431373, 1,
-0.177495, -0.0895923, -1.682294, 0, 1, 0.4470588, 1,
-0.1720957, 0.05948582, -2.31622, 0, 1, 0.454902, 1,
-0.1702823, -0.1945157, -3.15489, 0, 1, 0.4588235, 1,
-0.1680009, 0.3093477, -0.4279212, 0, 1, 0.4666667, 1,
-0.1656847, -1.344697, -3.398456, 0, 1, 0.4705882, 1,
-0.1631167, -0.4139053, -3.388038, 0, 1, 0.4784314, 1,
-0.1605972, 0.2352434, -1.778484, 0, 1, 0.4823529, 1,
-0.1594321, -0.2260807, -2.618471, 0, 1, 0.4901961, 1,
-0.1583118, -1.131647, -4.846699, 0, 1, 0.4941176, 1,
-0.1555343, 0.3031417, -2.024266, 0, 1, 0.5019608, 1,
-0.1536852, 0.3316511, -2.387792, 0, 1, 0.509804, 1,
-0.1487314, 0.3662895, -0.5315994, 0, 1, 0.5137255, 1,
-0.1469292, 0.9615238, -1.649575, 0, 1, 0.5215687, 1,
-0.1462573, -1.503389, -2.550381, 0, 1, 0.5254902, 1,
-0.1462203, -2.130484, -3.852355, 0, 1, 0.5333334, 1,
-0.1452196, -0.9815585, -3.805551, 0, 1, 0.5372549, 1,
-0.1430314, 0.1378587, -1.522888, 0, 1, 0.5450981, 1,
-0.1418565, 0.3228018, -0.5402791, 0, 1, 0.5490196, 1,
-0.1416658, -0.1744078, -1.727429, 0, 1, 0.5568628, 1,
-0.1362487, -1.275089, -1.448214, 0, 1, 0.5607843, 1,
-0.1346294, 1.117285, 1.117397, 0, 1, 0.5686275, 1,
-0.1305826, 0.4795175, -1.59365, 0, 1, 0.572549, 1,
-0.1245297, -0.2616799, -6.006837, 0, 1, 0.5803922, 1,
-0.1212168, 0.1727868, 0.0709006, 0, 1, 0.5843138, 1,
-0.1207753, -1.367207, -2.144605, 0, 1, 0.5921569, 1,
-0.1200453, -1.760843, -2.4344, 0, 1, 0.5960785, 1,
-0.1172607, 1.164008, -0.979427, 0, 1, 0.6039216, 1,
-0.1152206, -0.2929386, -2.500436, 0, 1, 0.6117647, 1,
-0.1149822, -0.5244434, -2.483868, 0, 1, 0.6156863, 1,
-0.114199, 3.832915, -1.887253, 0, 1, 0.6235294, 1,
-0.112781, 0.01762914, -1.614452, 0, 1, 0.627451, 1,
-0.1109332, -0.5477599, -2.455746, 0, 1, 0.6352941, 1,
-0.1097519, -1.397686, -4.027774, 0, 1, 0.6392157, 1,
-0.1086031, 0.339175, -0.1451575, 0, 1, 0.6470588, 1,
-0.1083544, 0.7263818, 0.9145661, 0, 1, 0.6509804, 1,
-0.1038015, 1.728476, 0.2954977, 0, 1, 0.6588235, 1,
-0.1033783, 1.35929, 0.1313145, 0, 1, 0.6627451, 1,
-0.1029867, -0.7650951, -2.843759, 0, 1, 0.6705883, 1,
-0.09770508, -0.2903522, -2.244548, 0, 1, 0.6745098, 1,
-0.08941241, -1.346929, -4.259252, 0, 1, 0.682353, 1,
-0.08791437, -0.9984971, -4.647266, 0, 1, 0.6862745, 1,
-0.08036419, 0.2682914, -0.8081686, 0, 1, 0.6941177, 1,
-0.07799761, 0.5965462, 0.2413229, 0, 1, 0.7019608, 1,
-0.07705937, 2.419366, -0.9452299, 0, 1, 0.7058824, 1,
-0.07700872, 1.308087, -0.1794568, 0, 1, 0.7137255, 1,
-0.07622843, 1.210636, 0.9561405, 0, 1, 0.7176471, 1,
-0.075843, -0.6773801, -2.810555, 0, 1, 0.7254902, 1,
-0.07258741, 1.138245, -1.912403, 0, 1, 0.7294118, 1,
-0.07017983, -1.382168, -5.94702, 0, 1, 0.7372549, 1,
-0.06743864, -0.9028907, -2.63921, 0, 1, 0.7411765, 1,
-0.06713047, 0.3720118, -0.2034227, 0, 1, 0.7490196, 1,
-0.06221846, -1.384047, -3.428637, 0, 1, 0.7529412, 1,
-0.06078102, -0.1603001, -2.534893, 0, 1, 0.7607843, 1,
-0.06066118, -0.5706092, -1.642174, 0, 1, 0.7647059, 1,
-0.05940789, -0.8742557, -3.649426, 0, 1, 0.772549, 1,
-0.05931116, -0.8794809, -3.817588, 0, 1, 0.7764706, 1,
-0.05774503, 1.202535, -0.6496948, 0, 1, 0.7843137, 1,
-0.05229166, -1.28257, -1.010709, 0, 1, 0.7882353, 1,
-0.0509146, 0.817695, 0.1945011, 0, 1, 0.7960784, 1,
-0.05065379, -0.8914863, -1.049228, 0, 1, 0.8039216, 1,
-0.04776343, 2.077793, 0.2178258, 0, 1, 0.8078431, 1,
-0.04715433, 0.2679347, 0.6169585, 0, 1, 0.8156863, 1,
-0.04298746, -0.1145574, -3.171488, 0, 1, 0.8196079, 1,
-0.0424379, -1.833609, -3.993487, 0, 1, 0.827451, 1,
-0.0400956, 0.8367301, 0.2898924, 0, 1, 0.8313726, 1,
-0.03611106, -0.1075842, -1.801934, 0, 1, 0.8392157, 1,
-0.03443784, 0.225312, -1.119099, 0, 1, 0.8431373, 1,
-0.03438278, -2.016889, -2.513711, 0, 1, 0.8509804, 1,
-0.03305413, 1.105736, -0.7164748, 0, 1, 0.854902, 1,
-0.02957365, 0.2772818, 0.1939417, 0, 1, 0.8627451, 1,
-0.02928814, 0.5175626, 1.085995, 0, 1, 0.8666667, 1,
-0.02050488, 0.3745235, 1.545063, 0, 1, 0.8745098, 1,
-0.01956468, -1.087961, -3.122236, 0, 1, 0.8784314, 1,
-0.01248491, 2.318136, 0.5914719, 0, 1, 0.8862745, 1,
-0.0101905, -2.371701, -3.357869, 0, 1, 0.8901961, 1,
-0.01012865, -1.198376, -3.297553, 0, 1, 0.8980392, 1,
0.0006739186, -1.121345, 3.151492, 0, 1, 0.9058824, 1,
0.001576139, -0.6315098, 2.71781, 0, 1, 0.9098039, 1,
0.002002403, -0.3882883, 2.79757, 0, 1, 0.9176471, 1,
0.004424963, -0.2660247, 1.851451, 0, 1, 0.9215686, 1,
0.01404303, -0.8727155, 3.025672, 0, 1, 0.9294118, 1,
0.01889366, 0.08058567, 0.1990213, 0, 1, 0.9333333, 1,
0.02304803, -0.1081113, 4.767158, 0, 1, 0.9411765, 1,
0.02340238, 0.09485171, -0.856144, 0, 1, 0.945098, 1,
0.02789066, 0.01284785, -0.105755, 0, 1, 0.9529412, 1,
0.02828587, -0.1439721, 1.756683, 0, 1, 0.9568627, 1,
0.02886266, 0.01366173, 2.254345, 0, 1, 0.9647059, 1,
0.0289558, -0.2432837, 3.009731, 0, 1, 0.9686275, 1,
0.03106815, 0.6558359, -0.2585007, 0, 1, 0.9764706, 1,
0.03603271, 0.02873364, 0.6773591, 0, 1, 0.9803922, 1,
0.04010656, -0.08447217, 4.739124, 0, 1, 0.9882353, 1,
0.04518018, 0.2121598, -2.390586, 0, 1, 0.9921569, 1,
0.04591289, -1.353284, 3.37428, 0, 1, 1, 1,
0.04961171, -0.9234242, 3.979515, 0, 0.9921569, 1, 1,
0.05302045, 0.2415502, -0.4917086, 0, 0.9882353, 1, 1,
0.05417805, -0.2276834, 3.952561, 0, 0.9803922, 1, 1,
0.05515722, -0.2690023, 3.291677, 0, 0.9764706, 1, 1,
0.06035476, -1.63063, 4.961222, 0, 0.9686275, 1, 1,
0.06134492, -0.06571309, 3.508258, 0, 0.9647059, 1, 1,
0.06367712, 1.511696, 0.6366305, 0, 0.9568627, 1, 1,
0.06627097, 1.092916, -1.71409, 0, 0.9529412, 1, 1,
0.06716333, -0.2927184, 2.355674, 0, 0.945098, 1, 1,
0.06718116, -0.66707, 2.316544, 0, 0.9411765, 1, 1,
0.06823631, -0.213661, 1.561531, 0, 0.9333333, 1, 1,
0.07219587, 0.456889, 0.5495287, 0, 0.9294118, 1, 1,
0.07918534, 0.3171665, -1.10113, 0, 0.9215686, 1, 1,
0.07988083, 1.225432, -0.7307819, 0, 0.9176471, 1, 1,
0.08187862, -0.285985, 1.425654, 0, 0.9098039, 1, 1,
0.0838448, -0.1163953, 0.5608061, 0, 0.9058824, 1, 1,
0.08464139, 1.647679, -0.1579852, 0, 0.8980392, 1, 1,
0.08632872, -1.003845, 3.09637, 0, 0.8901961, 1, 1,
0.08729964, -1.23236, 1.308947, 0, 0.8862745, 1, 1,
0.09015101, -1.04829, 2.896268, 0, 0.8784314, 1, 1,
0.09100244, -0.4826974, 4.390278, 0, 0.8745098, 1, 1,
0.09370362, 0.2721922, 0.8112492, 0, 0.8666667, 1, 1,
0.09548435, -0.6660967, 4.229076, 0, 0.8627451, 1, 1,
0.09864805, -0.002451942, 1.221776, 0, 0.854902, 1, 1,
0.1032809, -2.251567, 3.938644, 0, 0.8509804, 1, 1,
0.1039607, 0.8062875, 0.07561191, 0, 0.8431373, 1, 1,
0.1073845, 2.190217, -0.3911961, 0, 0.8392157, 1, 1,
0.109294, 2.080456, 0.81322, 0, 0.8313726, 1, 1,
0.1109108, -0.3054968, 2.290121, 0, 0.827451, 1, 1,
0.1118578, -0.7960052, 2.628669, 0, 0.8196079, 1, 1,
0.1153757, -2.390321, 2.573035, 0, 0.8156863, 1, 1,
0.1157146, -1.036139, 4.329734, 0, 0.8078431, 1, 1,
0.1165577, -0.3783169, 4.020118, 0, 0.8039216, 1, 1,
0.1206587, -0.6426461, 4.144788, 0, 0.7960784, 1, 1,
0.123051, -0.0508671, 1.75452, 0, 0.7882353, 1, 1,
0.1241214, -0.1361611, 2.657458, 0, 0.7843137, 1, 1,
0.1313997, -1.142225, 3.357208, 0, 0.7764706, 1, 1,
0.1315343, 0.7570027, 0.8039423, 0, 0.772549, 1, 1,
0.1355109, -0.2198224, 2.899181, 0, 0.7647059, 1, 1,
0.1383675, 1.241844, -0.3052184, 0, 0.7607843, 1, 1,
0.1397295, 1.514102, -0.1365666, 0, 0.7529412, 1, 1,
0.1405432, 1.011483, 1.131888, 0, 0.7490196, 1, 1,
0.1409883, 0.6428562, -0.7537516, 0, 0.7411765, 1, 1,
0.1414155, 0.5133455, -0.3761474, 0, 0.7372549, 1, 1,
0.1430702, -0.4939836, 3.910995, 0, 0.7294118, 1, 1,
0.1476814, 0.03262318, 1.648941, 0, 0.7254902, 1, 1,
0.1494556, -1.017735, 3.842199, 0, 0.7176471, 1, 1,
0.158653, 0.3498393, -0.3965768, 0, 0.7137255, 1, 1,
0.1591813, 1.100183, 0.2586053, 0, 0.7058824, 1, 1,
0.160807, -1.906205, 2.161387, 0, 0.6980392, 1, 1,
0.1703538, -0.6774932, 4.111318, 0, 0.6941177, 1, 1,
0.1707031, -0.6298178, 1.643154, 0, 0.6862745, 1, 1,
0.1767523, -0.8916907, 1.639373, 0, 0.682353, 1, 1,
0.1783428, 0.9228444, 1.866303, 0, 0.6745098, 1, 1,
0.1783802, -0.1051245, 0.8660436, 0, 0.6705883, 1, 1,
0.1786144, 0.2927117, 1.294951, 0, 0.6627451, 1, 1,
0.1847317, 0.7273481, -1.170559, 0, 0.6588235, 1, 1,
0.1867461, -0.6733893, 2.800527, 0, 0.6509804, 1, 1,
0.1987014, -1.809892, 2.50845, 0, 0.6470588, 1, 1,
0.200244, -0.6617485, 3.345258, 0, 0.6392157, 1, 1,
0.2014182, -0.9494283, 2.171979, 0, 0.6352941, 1, 1,
0.2032255, -0.05597583, 1.175152, 0, 0.627451, 1, 1,
0.2099041, 1.28044, -0.3240029, 0, 0.6235294, 1, 1,
0.2162952, -0.5395676, 1.483022, 0, 0.6156863, 1, 1,
0.2166949, -1.170915, 2.746482, 0, 0.6117647, 1, 1,
0.2172378, -2.646945, 4.738616, 0, 0.6039216, 1, 1,
0.2184083, -0.3930791, 2.202931, 0, 0.5960785, 1, 1,
0.2185577, -0.4047628, 3.389095, 0, 0.5921569, 1, 1,
0.2188898, 1.42897, -0.8837612, 0, 0.5843138, 1, 1,
0.2194762, 0.4608636, 1.207928, 0, 0.5803922, 1, 1,
0.2204194, -1.792292, 2.752267, 0, 0.572549, 1, 1,
0.2204638, -0.6703725, 2.755107, 0, 0.5686275, 1, 1,
0.2213727, -1.858294, 4.66828, 0, 0.5607843, 1, 1,
0.2226902, 0.4039946, 1.227765, 0, 0.5568628, 1, 1,
0.2230488, 1.212664, -0.1465563, 0, 0.5490196, 1, 1,
0.2247449, 0.5364589, 0.8535453, 0, 0.5450981, 1, 1,
0.2257652, 1.130441, -0.9577088, 0, 0.5372549, 1, 1,
0.2325468, -0.7149752, 2.490287, 0, 0.5333334, 1, 1,
0.233689, 0.7159747, 1.819903, 0, 0.5254902, 1, 1,
0.2406052, 0.6793727, 1.290053, 0, 0.5215687, 1, 1,
0.2435841, -0.3391693, 3.485376, 0, 0.5137255, 1, 1,
0.2460776, 1.479439, -1.05447, 0, 0.509804, 1, 1,
0.246087, -1.533266, 3.443538, 0, 0.5019608, 1, 1,
0.2477642, -0.2331732, 2.739949, 0, 0.4941176, 1, 1,
0.2565521, 0.9746962, 0.1759379, 0, 0.4901961, 1, 1,
0.2605736, 0.9213516, 1.539514, 0, 0.4823529, 1, 1,
0.261407, 1.253728, 0.9267907, 0, 0.4784314, 1, 1,
0.2622961, -0.6668987, 1.576022, 0, 0.4705882, 1, 1,
0.2633217, 0.3170802, 0.522942, 0, 0.4666667, 1, 1,
0.2642899, -0.2250528, 2.437257, 0, 0.4588235, 1, 1,
0.2646393, 2.732789, -0.7825198, 0, 0.454902, 1, 1,
0.2662648, -0.7108998, 2.69576, 0, 0.4470588, 1, 1,
0.2685276, -1.079859, 4.538556, 0, 0.4431373, 1, 1,
0.2711575, 0.1853026, 1.88485, 0, 0.4352941, 1, 1,
0.2712765, -0.5792461, 0.6963916, 0, 0.4313726, 1, 1,
0.2763494, 1.282281, -1.534235, 0, 0.4235294, 1, 1,
0.2768182, -0.4105279, 0.6626334, 0, 0.4196078, 1, 1,
0.2785024, 0.7573881, 0.4801993, 0, 0.4117647, 1, 1,
0.2786835, 0.1481119, 0.8044744, 0, 0.4078431, 1, 1,
0.281479, 0.1408474, 1.381097, 0, 0.4, 1, 1,
0.2830296, -0.1470697, 1.547789, 0, 0.3921569, 1, 1,
0.2889731, -0.3903218, 1.860228, 0, 0.3882353, 1, 1,
0.2919755, -0.8274363, 1.982175, 0, 0.3803922, 1, 1,
0.2939861, 0.3427132, 1.169294, 0, 0.3764706, 1, 1,
0.2939877, -0.3641917, 3.412299, 0, 0.3686275, 1, 1,
0.2961446, 0.4993822, 0.5106062, 0, 0.3647059, 1, 1,
0.2975874, -0.9117842, 2.949189, 0, 0.3568628, 1, 1,
0.2981283, 0.583649, 0.8851589, 0, 0.3529412, 1, 1,
0.2988775, 0.564786, 1.149345, 0, 0.345098, 1, 1,
0.3014413, 2.041342, 1.277959, 0, 0.3411765, 1, 1,
0.3048905, 2.523173, -0.1732643, 0, 0.3333333, 1, 1,
0.3060353, 0.05270997, 1.190617, 0, 0.3294118, 1, 1,
0.3076992, -0.3400214, 1.554096, 0, 0.3215686, 1, 1,
0.3102655, -1.123295, 1.586065, 0, 0.3176471, 1, 1,
0.3104087, -0.004834649, 1.73225, 0, 0.3098039, 1, 1,
0.3118125, -1.471986, 2.61498, 0, 0.3058824, 1, 1,
0.3146014, 2.131589, -0.7135072, 0, 0.2980392, 1, 1,
0.3246403, -0.05578391, 1.669804, 0, 0.2901961, 1, 1,
0.3263665, 0.5678865, 1.023704, 0, 0.2862745, 1, 1,
0.3305154, 0.5191452, 0.03026466, 0, 0.2784314, 1, 1,
0.3338996, 0.8358163, 0.3404242, 0, 0.2745098, 1, 1,
0.3349276, -0.7029499, 3.388057, 0, 0.2666667, 1, 1,
0.3350872, 1.520279, -1.076306, 0, 0.2627451, 1, 1,
0.3373226, 1.053026, -0.4391522, 0, 0.254902, 1, 1,
0.339038, -0.2305879, 0.9919351, 0, 0.2509804, 1, 1,
0.3397931, -0.07607737, 2.002278, 0, 0.2431373, 1, 1,
0.3428375, -1.781839, 4.034411, 0, 0.2392157, 1, 1,
0.3432416, -1.565962, 3.95682, 0, 0.2313726, 1, 1,
0.3441339, 1.646708, 1.739182, 0, 0.227451, 1, 1,
0.3444065, 0.5374172, 1.04979, 0, 0.2196078, 1, 1,
0.3464686, 1.46731, 0.1647469, 0, 0.2156863, 1, 1,
0.3497528, 0.9894464, 2.136551, 0, 0.2078431, 1, 1,
0.3507035, 0.5569521, 2.060488, 0, 0.2039216, 1, 1,
0.3524866, 1.018036, 1.71568, 0, 0.1960784, 1, 1,
0.355145, 0.240879, 0.6109375, 0, 0.1882353, 1, 1,
0.3575667, 1.241801, -0.7199473, 0, 0.1843137, 1, 1,
0.3602162, 1.440287, 2.05737, 0, 0.1764706, 1, 1,
0.360391, -1.148886, 2.461474, 0, 0.172549, 1, 1,
0.3605691, -0.8635625, 2.210634, 0, 0.1647059, 1, 1,
0.361496, 0.427417, 1.163923, 0, 0.1607843, 1, 1,
0.362161, 0.7328677, 0.4093512, 0, 0.1529412, 1, 1,
0.3646581, 1.306784, -0.01066071, 0, 0.1490196, 1, 1,
0.3675551, 0.02930481, 2.668784, 0, 0.1411765, 1, 1,
0.3677821, -1.077343, 2.834277, 0, 0.1372549, 1, 1,
0.3688968, 0.4757089, 1.704817, 0, 0.1294118, 1, 1,
0.3721064, -1.168861, 0.637108, 0, 0.1254902, 1, 1,
0.3721851, 0.3238426, 1.520499, 0, 0.1176471, 1, 1,
0.3721896, -0.4052216, 2.83179, 0, 0.1137255, 1, 1,
0.3724521, -0.0002808796, 1.067188, 0, 0.1058824, 1, 1,
0.372706, 1.465288, 0.1205184, 0, 0.09803922, 1, 1,
0.3741254, 0.8449342, 0.4748355, 0, 0.09411765, 1, 1,
0.385157, 1.267094, 0.6526907, 0, 0.08627451, 1, 1,
0.3880929, 0.09534647, 1.145706, 0, 0.08235294, 1, 1,
0.3901111, 0.5285941, -1.433731, 0, 0.07450981, 1, 1,
0.3933358, 1.230322, 1.232345, 0, 0.07058824, 1, 1,
0.3949983, -0.6565938, 2.785971, 0, 0.0627451, 1, 1,
0.3953718, 0.7833312, 0.5291154, 0, 0.05882353, 1, 1,
0.3999168, 1.050578, -0.3117553, 0, 0.05098039, 1, 1,
0.4015929, -1.627631, 2.598739, 0, 0.04705882, 1, 1,
0.401605, 0.7396351, -0.2515173, 0, 0.03921569, 1, 1,
0.4063425, 0.3705531, 1.745204, 0, 0.03529412, 1, 1,
0.4107972, 0.922115, -1.052952, 0, 0.02745098, 1, 1,
0.413554, 2.295751, 0.3506165, 0, 0.02352941, 1, 1,
0.4180248, 0.314119, 0.9697648, 0, 0.01568628, 1, 1,
0.4209497, 0.9950604, 2.550023, 0, 0.01176471, 1, 1,
0.4211393, -0.2382804, 1.329366, 0, 0.003921569, 1, 1,
0.4223717, -0.08503229, 2.779476, 0.003921569, 0, 1, 1,
0.4274838, 0.8461039, 1.21267, 0.007843138, 0, 1, 1,
0.4297248, 1.312492, 1.131304, 0.01568628, 0, 1, 1,
0.4398894, -0.07068189, 2.44769, 0.01960784, 0, 1, 1,
0.4430513, -0.6928843, 3.617918, 0.02745098, 0, 1, 1,
0.4484034, -2.889317, 1.441749, 0.03137255, 0, 1, 1,
0.4521264, -1.752447, 1.493547, 0.03921569, 0, 1, 1,
0.4581445, 0.2291067, 1.808408, 0.04313726, 0, 1, 1,
0.4593593, 0.6244842, 0.6256099, 0.05098039, 0, 1, 1,
0.4628913, -0.05595999, 0.5363671, 0.05490196, 0, 1, 1,
0.4634689, -0.1035837, 0.6527146, 0.0627451, 0, 1, 1,
0.4640874, 0.4315636, 0.5956972, 0.06666667, 0, 1, 1,
0.4680951, -0.2938423, 3.180352, 0.07450981, 0, 1, 1,
0.4684464, -0.9430157, 2.773949, 0.07843138, 0, 1, 1,
0.4731318, -2.303466, 3.533008, 0.08627451, 0, 1, 1,
0.4797424, -0.7060323, 5.151183, 0.09019608, 0, 1, 1,
0.481725, -0.4844591, 3.137187, 0.09803922, 0, 1, 1,
0.4838966, 2.034049, 0.8225133, 0.1058824, 0, 1, 1,
0.4887414, 0.4671168, 3.254035, 0.1098039, 0, 1, 1,
0.4897391, -1.175365, 1.841018, 0.1176471, 0, 1, 1,
0.4905085, -0.6674173, 1.597388, 0.1215686, 0, 1, 1,
0.4912927, 1.207686, 0.8691176, 0.1294118, 0, 1, 1,
0.4945803, 0.2550435, 0.940734, 0.1333333, 0, 1, 1,
0.4995109, 1.750264, 0.3333622, 0.1411765, 0, 1, 1,
0.5036777, -0.8679954, 2.061717, 0.145098, 0, 1, 1,
0.5042102, -1.5097, 4.271173, 0.1529412, 0, 1, 1,
0.5100636, 0.2980859, 2.150975, 0.1568628, 0, 1, 1,
0.5102892, 0.9296063, 2.191921, 0.1647059, 0, 1, 1,
0.5120775, 0.7913439, 1.507593, 0.1686275, 0, 1, 1,
0.5127237, -0.07081264, 1.577968, 0.1764706, 0, 1, 1,
0.5146652, 0.4431877, 1.186268, 0.1803922, 0, 1, 1,
0.518397, 0.3468691, 0.3773259, 0.1882353, 0, 1, 1,
0.520515, 0.05853355, 1.192013, 0.1921569, 0, 1, 1,
0.5211418, -0.6526856, 2.042491, 0.2, 0, 1, 1,
0.5254727, -1.133806, 1.800277, 0.2078431, 0, 1, 1,
0.526275, -1.02121, 3.946416, 0.2117647, 0, 1, 1,
0.5278725, 0.4587497, -1.254825, 0.2196078, 0, 1, 1,
0.5288246, -1.140131, 2.276095, 0.2235294, 0, 1, 1,
0.5296707, 1.656239, 1.130491, 0.2313726, 0, 1, 1,
0.5358367, 0.9605039, 0.2978898, 0.2352941, 0, 1, 1,
0.5619094, 0.1917189, 2.027005, 0.2431373, 0, 1, 1,
0.5696192, -0.914259, 2.357359, 0.2470588, 0, 1, 1,
0.5773662, 1.279791, -0.2524371, 0.254902, 0, 1, 1,
0.582698, 1.005964, 1.554773, 0.2588235, 0, 1, 1,
0.5830519, 1.995561, -0.3215297, 0.2666667, 0, 1, 1,
0.5863195, -0.3693673, 1.934677, 0.2705882, 0, 1, 1,
0.5993407, 0.2625163, 2.032718, 0.2784314, 0, 1, 1,
0.6005364, 0.5322638, 0.2225702, 0.282353, 0, 1, 1,
0.6030863, 0.3090965, 1.337487, 0.2901961, 0, 1, 1,
0.6033078, -1.474419, 0.7561351, 0.2941177, 0, 1, 1,
0.6182231, 0.5826392, 0.9609051, 0.3019608, 0, 1, 1,
0.6190184, -1.453343, 3.830698, 0.3098039, 0, 1, 1,
0.6219353, -0.725627, 3.524564, 0.3137255, 0, 1, 1,
0.6225864, 1.537443, 0.8777137, 0.3215686, 0, 1, 1,
0.6348326, 0.5514445, -0.06959995, 0.3254902, 0, 1, 1,
0.645039, 0.7095247, 0.9553082, 0.3333333, 0, 1, 1,
0.6463949, -1.105446, 2.810508, 0.3372549, 0, 1, 1,
0.6562052, 0.5345074, 1.841822, 0.345098, 0, 1, 1,
0.659364, -1.182369, 4.456864, 0.3490196, 0, 1, 1,
0.6743548, 1.675597, -0.1234136, 0.3568628, 0, 1, 1,
0.6766656, -0.286289, 3.02588, 0.3607843, 0, 1, 1,
0.6793043, -0.2679427, 1.553394, 0.3686275, 0, 1, 1,
0.6812499, 0.5424716, 0.7206749, 0.372549, 0, 1, 1,
0.6853593, -0.9931279, 2.647844, 0.3803922, 0, 1, 1,
0.6914443, -0.3898688, 2.86829, 0.3843137, 0, 1, 1,
0.6933854, -1.226214, 2.251304, 0.3921569, 0, 1, 1,
0.7011654, -1.759754, 3.074892, 0.3960784, 0, 1, 1,
0.7037125, 1.803635, 1.189087, 0.4039216, 0, 1, 1,
0.7069747, -0.1277439, 2.049218, 0.4117647, 0, 1, 1,
0.7093103, 0.1102882, 1.262419, 0.4156863, 0, 1, 1,
0.7191243, 1.189265, 1.166684, 0.4235294, 0, 1, 1,
0.7200064, -1.804538, 1.893095, 0.427451, 0, 1, 1,
0.7208982, 0.8688083, -0.07178684, 0.4352941, 0, 1, 1,
0.721925, 1.422408, -0.6287677, 0.4392157, 0, 1, 1,
0.7222437, -1.777353, 1.533003, 0.4470588, 0, 1, 1,
0.727136, -0.8231108, 2.311768, 0.4509804, 0, 1, 1,
0.7363384, 0.09851322, 1.522333, 0.4588235, 0, 1, 1,
0.7402388, -2.572866, 0.923435, 0.4627451, 0, 1, 1,
0.7416654, 0.6803684, 2.443333, 0.4705882, 0, 1, 1,
0.7430739, 1.416991, -0.8463271, 0.4745098, 0, 1, 1,
0.7444486, 1.170254, 1.031521, 0.4823529, 0, 1, 1,
0.7451582, 0.9238841, 1.527024, 0.4862745, 0, 1, 1,
0.7484244, -1.006066, 2.698941, 0.4941176, 0, 1, 1,
0.7511958, -0.3883822, 0.4511879, 0.5019608, 0, 1, 1,
0.7527256, -0.7255225, 1.814209, 0.5058824, 0, 1, 1,
0.7543058, 1.703308, 1.215302, 0.5137255, 0, 1, 1,
0.7582986, -0.9553846, 1.626342, 0.5176471, 0, 1, 1,
0.7645442, -0.09210792, 1.485035, 0.5254902, 0, 1, 1,
0.7678735, -0.1147541, -0.2590417, 0.5294118, 0, 1, 1,
0.7729831, -0.333964, 2.456675, 0.5372549, 0, 1, 1,
0.7788426, 1.202461, 1.014968, 0.5411765, 0, 1, 1,
0.7808963, 0.6237925, 0.7515631, 0.5490196, 0, 1, 1,
0.7814613, 0.08589094, 1.381548, 0.5529412, 0, 1, 1,
0.7887712, -1.124892, 1.830734, 0.5607843, 0, 1, 1,
0.7923104, 0.9006172, 0.5639126, 0.5647059, 0, 1, 1,
0.7923568, 1.198085, -0.05161791, 0.572549, 0, 1, 1,
0.7958506, -1.418786, 0.8393185, 0.5764706, 0, 1, 1,
0.7973605, -0.1675062, 3.674522, 0.5843138, 0, 1, 1,
0.7974706, 1.316816, 1.807056, 0.5882353, 0, 1, 1,
0.7992725, -0.5971239, 0.9802407, 0.5960785, 0, 1, 1,
0.8006539, 1.760995, -0.3469705, 0.6039216, 0, 1, 1,
0.8030444, -0.1790841, 1.150622, 0.6078432, 0, 1, 1,
0.8032527, 2.045145, 0.4817437, 0.6156863, 0, 1, 1,
0.8077708, 0.2787636, 2.292478, 0.6196079, 0, 1, 1,
0.8087521, -1.805918, 3.438241, 0.627451, 0, 1, 1,
0.8149357, -1.246895, 1.468037, 0.6313726, 0, 1, 1,
0.817975, 0.4074874, 0.9482562, 0.6392157, 0, 1, 1,
0.8219094, -2.107684, 1.95714, 0.6431373, 0, 1, 1,
0.8263831, 0.1119082, 1.570937, 0.6509804, 0, 1, 1,
0.8265589, -0.0569188, 0.7580986, 0.654902, 0, 1, 1,
0.83536, 1.40783, 0.6625463, 0.6627451, 0, 1, 1,
0.8404395, 3.508269, -0.4697646, 0.6666667, 0, 1, 1,
0.8433865, -1.957954, 1.959615, 0.6745098, 0, 1, 1,
0.8458849, 1.500221, 2.615172, 0.6784314, 0, 1, 1,
0.8478228, 1.137394, 0.1234238, 0.6862745, 0, 1, 1,
0.8488016, -0.5157625, 2.096587, 0.6901961, 0, 1, 1,
0.8501954, -0.200987, 1.904931, 0.6980392, 0, 1, 1,
0.850965, -0.259779, 3.904366, 0.7058824, 0, 1, 1,
0.8669999, 0.213108, 3.767072, 0.7098039, 0, 1, 1,
0.8772715, 0.2850464, 0.6318437, 0.7176471, 0, 1, 1,
0.8774842, -0.05902905, 0.8001661, 0.7215686, 0, 1, 1,
0.880953, 0.6396756, -1.326352, 0.7294118, 0, 1, 1,
0.8810152, 0.6850713, 1.957653, 0.7333333, 0, 1, 1,
0.8872695, -0.5626482, 2.710891, 0.7411765, 0, 1, 1,
0.8901169, 0.8207756, -0.1574702, 0.7450981, 0, 1, 1,
0.8913189, -0.107937, 2.148848, 0.7529412, 0, 1, 1,
0.8952072, 1.749951, -1.29044, 0.7568628, 0, 1, 1,
0.8964957, -0.002925378, 0.05834411, 0.7647059, 0, 1, 1,
0.8987084, 1.185247, -0.4180024, 0.7686275, 0, 1, 1,
0.9009264, -1.03405, 3.321517, 0.7764706, 0, 1, 1,
0.9065549, -1.566339, 5.169968, 0.7803922, 0, 1, 1,
0.907936, -1.439492, 2.872633, 0.7882353, 0, 1, 1,
0.9102712, -0.2864297, 2.274385, 0.7921569, 0, 1, 1,
0.9106998, 0.8069563, 0.6202335, 0.8, 0, 1, 1,
0.9149047, 0.4905412, 1.353058, 0.8078431, 0, 1, 1,
0.9157971, 1.144486, 0.6134555, 0.8117647, 0, 1, 1,
0.9184199, -0.03485, 2.572042, 0.8196079, 0, 1, 1,
0.9196771, 0.7886539, 0.06974612, 0.8235294, 0, 1, 1,
0.9207546, 1.187781, 0.5096778, 0.8313726, 0, 1, 1,
0.9217646, -1.010136, 2.313631, 0.8352941, 0, 1, 1,
0.9229921, -0.5249605, 2.574263, 0.8431373, 0, 1, 1,
0.9244146, -0.2247343, 1.830856, 0.8470588, 0, 1, 1,
0.9275259, -1.680227, 1.978996, 0.854902, 0, 1, 1,
0.9280723, -0.09668421, 0.875277, 0.8588235, 0, 1, 1,
0.9308215, -2.492769, 2.1262, 0.8666667, 0, 1, 1,
0.9326277, -0.2214236, 2.373577, 0.8705882, 0, 1, 1,
0.9437453, 0.5059105, -0.7033315, 0.8784314, 0, 1, 1,
0.9483923, 1.118146, -1.351575, 0.8823529, 0, 1, 1,
0.9567518, -0.219836, 0.7361856, 0.8901961, 0, 1, 1,
0.9621888, -2.325998, 1.861804, 0.8941177, 0, 1, 1,
0.9630706, -2.094858, 2.863108, 0.9019608, 0, 1, 1,
0.9674555, -2.075986, 2.837566, 0.9098039, 0, 1, 1,
0.9713206, 0.04594788, 2.697018, 0.9137255, 0, 1, 1,
0.9723658, 0.04975495, 0.8164622, 0.9215686, 0, 1, 1,
0.9726036, 0.6057523, 1.048822, 0.9254902, 0, 1, 1,
0.9741085, -0.5885376, 2.178644, 0.9333333, 0, 1, 1,
0.978623, -0.1113996, 1.761222, 0.9372549, 0, 1, 1,
0.9805834, -0.8269968, 1.877274, 0.945098, 0, 1, 1,
0.9817659, 0.6374345, 1.919608, 0.9490196, 0, 1, 1,
0.9851161, 1.91894, 0.6520088, 0.9568627, 0, 1, 1,
0.9878218, 1.01461, 1.976256, 0.9607843, 0, 1, 1,
0.9893609, 3.113347, -0.6552864, 0.9686275, 0, 1, 1,
0.9912408, -0.3570547, 0.5820029, 0.972549, 0, 1, 1,
0.9930891, -1.751169, 2.116005, 0.9803922, 0, 1, 1,
0.9938675, -0.1070775, 0.6205158, 0.9843137, 0, 1, 1,
0.996474, 0.01010477, 3.077534, 0.9921569, 0, 1, 1,
0.9998459, -1.295024, 1.68543, 0.9960784, 0, 1, 1,
1.008687, -1.999246, -0.05572655, 1, 0, 0.9960784, 1,
1.014548, -1.229914, 1.260067, 1, 0, 0.9882353, 1,
1.016975, 0.2980206, 1.95312, 1, 0, 0.9843137, 1,
1.019723, 0.5285494, -0.2889395, 1, 0, 0.9764706, 1,
1.021483, 0.3780686, 2.115152, 1, 0, 0.972549, 1,
1.025263, 1.220805, 0.0807068, 1, 0, 0.9647059, 1,
1.026416, 1.075126, 2.900521, 1, 0, 0.9607843, 1,
1.028409, 1.683112, 1.440945, 1, 0, 0.9529412, 1,
1.035917, 0.9220349, -1.412475, 1, 0, 0.9490196, 1,
1.038865, 0.8210817, 0.1950068, 1, 0, 0.9411765, 1,
1.041135, 0.2694252, 1.860264, 1, 0, 0.9372549, 1,
1.0421, 1.31904, 1.989014, 1, 0, 0.9294118, 1,
1.046421, 0.04518796, 1.190388, 1, 0, 0.9254902, 1,
1.0551, -0.8235101, 2.093237, 1, 0, 0.9176471, 1,
1.05855, -0.5193996, 1.985607, 1, 0, 0.9137255, 1,
1.063465, 1.232533, 1.642736, 1, 0, 0.9058824, 1,
1.065084, 1.744604, 0.9799135, 1, 0, 0.9019608, 1,
1.065174, 0.01777214, 0.7342693, 1, 0, 0.8941177, 1,
1.070665, -0.1347626, 2.743089, 1, 0, 0.8862745, 1,
1.076724, 0.4930204, -0.8226591, 1, 0, 0.8823529, 1,
1.082191, 0.009792282, 2.636415, 1, 0, 0.8745098, 1,
1.082338, 0.5578063, 1.624172, 1, 0, 0.8705882, 1,
1.085422, -1.116966, 2.295458, 1, 0, 0.8627451, 1,
1.087334, -0.0582651, 2.071598, 1, 0, 0.8588235, 1,
1.089243, -0.453917, 2.406732, 1, 0, 0.8509804, 1,
1.097881, 0.1636447, 0.6730238, 1, 0, 0.8470588, 1,
1.098763, -0.04992708, 1.928539, 1, 0, 0.8392157, 1,
1.105543, 0.9096593, 0.4171497, 1, 0, 0.8352941, 1,
1.106082, -0.1959237, 1.99157, 1, 0, 0.827451, 1,
1.110833, -2.082493, 3.102848, 1, 0, 0.8235294, 1,
1.114619, -0.3142936, 1.645831, 1, 0, 0.8156863, 1,
1.115077, 0.4428122, -0.3651172, 1, 0, 0.8117647, 1,
1.116058, 0.2502523, -0.7058122, 1, 0, 0.8039216, 1,
1.127438, 1.819421, 1.455439, 1, 0, 0.7960784, 1,
1.135946, 1.289383, 2.586911, 1, 0, 0.7921569, 1,
1.139015, 0.1827479, 2.757658, 1, 0, 0.7843137, 1,
1.140027, 0.9162006, -0.1826044, 1, 0, 0.7803922, 1,
1.142362, -1.223871, 0.5571853, 1, 0, 0.772549, 1,
1.14546, 1.085734, -1.610415, 1, 0, 0.7686275, 1,
1.152408, 0.02085474, 0.09566324, 1, 0, 0.7607843, 1,
1.164182, 1.120694, 0.1941586, 1, 0, 0.7568628, 1,
1.170945, -0.5371006, 1.678276, 1, 0, 0.7490196, 1,
1.18201, -1.145194, 2.719625, 1, 0, 0.7450981, 1,
1.194153, 1.109798, 2.338413, 1, 0, 0.7372549, 1,
1.197733, -0.2617345, 3.236307, 1, 0, 0.7333333, 1,
1.199407, -0.109235, 1.644871, 1, 0, 0.7254902, 1,
1.202644, -0.4627341, 1.390867, 1, 0, 0.7215686, 1,
1.20335, 1.775628, 1.349992, 1, 0, 0.7137255, 1,
1.209294, -0.04923725, 1.157915, 1, 0, 0.7098039, 1,
1.215302, 1.365442, -0.04423122, 1, 0, 0.7019608, 1,
1.215372, 1.185553, 1.4924, 1, 0, 0.6941177, 1,
1.225924, 1.572598, 0.9948558, 1, 0, 0.6901961, 1,
1.232134, 0.9255453, 1.143896, 1, 0, 0.682353, 1,
1.237311, 1.363744, 0.132568, 1, 0, 0.6784314, 1,
1.240322, -1.528336, 1.821144, 1, 0, 0.6705883, 1,
1.240862, -0.05777381, 1.090515, 1, 0, 0.6666667, 1,
1.241632, 0.7599691, -0.1316166, 1, 0, 0.6588235, 1,
1.243204, -0.06978352, 2.420943, 1, 0, 0.654902, 1,
1.250877, -0.142943, 2.931567, 1, 0, 0.6470588, 1,
1.254641, 0.8766157, 0.8900757, 1, 0, 0.6431373, 1,
1.258574, 0.8367205, 2.452535, 1, 0, 0.6352941, 1,
1.259457, -1.515919, 2.249669, 1, 0, 0.6313726, 1,
1.263601, -1.205056, 1.636696, 1, 0, 0.6235294, 1,
1.273008, 0.04065188, 2.397994, 1, 0, 0.6196079, 1,
1.279113, 1.542732, 2.002913, 1, 0, 0.6117647, 1,
1.283496, 0.7878679, 1.530883, 1, 0, 0.6078432, 1,
1.286702, 1.104065, 0.7301006, 1, 0, 0.6, 1,
1.289493, 0.2554584, 2.37332, 1, 0, 0.5921569, 1,
1.295534, -1.69425, 4.470693, 1, 0, 0.5882353, 1,
1.298059, 0.6573755, 0.7588907, 1, 0, 0.5803922, 1,
1.311429, -0.3259494, 0.05577409, 1, 0, 0.5764706, 1,
1.314728, -0.6226413, 2.901409, 1, 0, 0.5686275, 1,
1.317418, -1.367139, 4.130322, 1, 0, 0.5647059, 1,
1.3183, 1.133838, 2.603791, 1, 0, 0.5568628, 1,
1.321402, 0.001666126, -0.4699926, 1, 0, 0.5529412, 1,
1.338597, 2.482879, 2.04782, 1, 0, 0.5450981, 1,
1.341258, 0.6885064, -0.4866379, 1, 0, 0.5411765, 1,
1.348016, 0.3348444, 2.276405, 1, 0, 0.5333334, 1,
1.364778, -1.064306, 0.9870431, 1, 0, 0.5294118, 1,
1.366393, 1.164896, 1.655345, 1, 0, 0.5215687, 1,
1.385047, -0.3724894, 0.4474973, 1, 0, 0.5176471, 1,
1.387126, -1.210097, 2.415169, 1, 0, 0.509804, 1,
1.388317, 0.6876906, 0.7166805, 1, 0, 0.5058824, 1,
1.389711, 1.430759, 0.8515342, 1, 0, 0.4980392, 1,
1.391102, -0.08035631, 1.618937, 1, 0, 0.4901961, 1,
1.401724, 0.03107047, 1.580589, 1, 0, 0.4862745, 1,
1.407742, -0.0328333, 1.432914, 1, 0, 0.4784314, 1,
1.428929, 1.597247, 0.724753, 1, 0, 0.4745098, 1,
1.432607, -0.09417944, 0.01879238, 1, 0, 0.4666667, 1,
1.433258, -0.9125003, -0.6003034, 1, 0, 0.4627451, 1,
1.434015, 0.09197904, 2.161589, 1, 0, 0.454902, 1,
1.437866, -0.06190364, -0.6024123, 1, 0, 0.4509804, 1,
1.463858, -3.600478, 2.265535, 1, 0, 0.4431373, 1,
1.467704, -0.5671251, 3.530966, 1, 0, 0.4392157, 1,
1.476457, -1.132241, 1.400134, 1, 0, 0.4313726, 1,
1.482498, -0.4914438, 0.06691024, 1, 0, 0.427451, 1,
1.484911, 0.5661377, 2.874068, 1, 0, 0.4196078, 1,
1.488789, -1.272563, 3.095138, 1, 0, 0.4156863, 1,
1.490413, -0.4478765, 0.2551757, 1, 0, 0.4078431, 1,
1.5038, 0.05058141, 0.558018, 1, 0, 0.4039216, 1,
1.507914, -0.6649825, 1.844768, 1, 0, 0.3960784, 1,
1.510141, 0.4911862, 1.12798, 1, 0, 0.3882353, 1,
1.515447, 0.959326, 3.015425, 1, 0, 0.3843137, 1,
1.538317, 0.4425002, 1.127601, 1, 0, 0.3764706, 1,
1.550202, -0.6133292, 0.1095495, 1, 0, 0.372549, 1,
1.556764, 0.6680115, 1.473747, 1, 0, 0.3647059, 1,
1.557107, -0.9706248, 2.212663, 1, 0, 0.3607843, 1,
1.572372, 1.341573, -0.2689116, 1, 0, 0.3529412, 1,
1.574889, 0.7849824, 1.745744, 1, 0, 0.3490196, 1,
1.57759, 1.384849, 0.8230186, 1, 0, 0.3411765, 1,
1.589182, 1.518717, 0.7193119, 1, 0, 0.3372549, 1,
1.596591, 1.498514, 1.034594, 1, 0, 0.3294118, 1,
1.597624, -0.4226561, 3.236405, 1, 0, 0.3254902, 1,
1.611817, 0.3103791, 2.45307, 1, 0, 0.3176471, 1,
1.633578, 0.04265517, 0.1022316, 1, 0, 0.3137255, 1,
1.638264, -0.3956945, 2.486925, 1, 0, 0.3058824, 1,
1.644554, 0.2415552, -0.8852045, 1, 0, 0.2980392, 1,
1.677804, 1.428746, 0.696554, 1, 0, 0.2941177, 1,
1.691811, -2.428313, 2.786995, 1, 0, 0.2862745, 1,
1.71498, 0.1668051, 2.546195, 1, 0, 0.282353, 1,
1.722711, 0.1682465, 2.253503, 1, 0, 0.2745098, 1,
1.724671, 1.134145, -0.6197143, 1, 0, 0.2705882, 1,
1.726848, -2.137448, 1.189488, 1, 0, 0.2627451, 1,
1.73792, -0.3122715, 1.360625, 1, 0, 0.2588235, 1,
1.750821, -0.244579, 0.8542163, 1, 0, 0.2509804, 1,
1.753849, 0.3120565, 2.638402, 1, 0, 0.2470588, 1,
1.759239, -0.6288736, 1.830877, 1, 0, 0.2392157, 1,
1.77782, 0.1497473, 2.070333, 1, 0, 0.2352941, 1,
1.780946, 0.5640724, 1.028997, 1, 0, 0.227451, 1,
1.787248, -1.630759, 1.146383, 1, 0, 0.2235294, 1,
1.805099, -1.061962, 1.523421, 1, 0, 0.2156863, 1,
1.814943, -0.5198947, -0.1788132, 1, 0, 0.2117647, 1,
1.827484, 2.007194, 0.04426939, 1, 0, 0.2039216, 1,
1.835691, -0.02556735, 0.8960509, 1, 0, 0.1960784, 1,
1.842555, 0.596632, 1.561365, 1, 0, 0.1921569, 1,
1.845072, 0.2335007, 0.9398078, 1, 0, 0.1843137, 1,
1.858791, -0.5105658, 0.9892408, 1, 0, 0.1803922, 1,
1.86224, 0.3455989, 3.406917, 1, 0, 0.172549, 1,
1.873476, -1.234952, -0.07942402, 1, 0, 0.1686275, 1,
1.879769, 1.302504, 2.285672, 1, 0, 0.1607843, 1,
1.884701, 0.9789655, 1.115659, 1, 0, 0.1568628, 1,
1.899299, 0.4356437, 0.5448042, 1, 0, 0.1490196, 1,
1.946559, 0.03915478, 1.186671, 1, 0, 0.145098, 1,
1.962252, -0.1168487, 2.103628, 1, 0, 0.1372549, 1,
1.967581, 0.9415599, 1.383708, 1, 0, 0.1333333, 1,
1.998979, -0.3990476, 2.439564, 1, 0, 0.1254902, 1,
2.003651, 0.8754023, 1.709645, 1, 0, 0.1215686, 1,
2.010282, 0.7422975, 0.5288823, 1, 0, 0.1137255, 1,
2.042748, -1.429351, 0.03515125, 1, 0, 0.1098039, 1,
2.046716, 0.1895276, 1.475759, 1, 0, 0.1019608, 1,
2.050054, -0.05577526, 2.209907, 1, 0, 0.09411765, 1,
2.059273, 0.5048019, 0.5501363, 1, 0, 0.09019608, 1,
2.078603, -0.6909593, 1.582056, 1, 0, 0.08235294, 1,
2.097147, -1.217859, 2.302213, 1, 0, 0.07843138, 1,
2.105887, -0.5828159, 1.58686, 1, 0, 0.07058824, 1,
2.131621, 1.242598, 2.709682, 1, 0, 0.06666667, 1,
2.151413, -0.01674089, 0.8056694, 1, 0, 0.05882353, 1,
2.22236, -0.9112061, 1.782955, 1, 0, 0.05490196, 1,
2.227705, 0.5043158, 2.190389, 1, 0, 0.04705882, 1,
2.248057, 0.6693185, 1.038879, 1, 0, 0.04313726, 1,
2.331826, -0.9914133, 0.644136, 1, 0, 0.03529412, 1,
2.377337, 0.5956817, -0.7136402, 1, 0, 0.03137255, 1,
2.381732, 1.278127, 0.8566359, 1, 0, 0.02352941, 1,
2.460842, -1.150027, 0.7693723, 1, 0, 0.01960784, 1,
2.612564, -0.6973, 2.102916, 1, 0, 0.01176471, 1,
3.485636, -0.1459075, 1.638046, 1, 0, 0.007843138, 1
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
-0.04608107, -4.860438, -7.901306, 0, -0.5, 0.5, 0.5,
-0.04608107, -4.860438, -7.901306, 1, -0.5, 0.5, 0.5,
-0.04608107, -4.860438, -7.901306, 1, 1.5, 0.5, 0.5,
-0.04608107, -4.860438, -7.901306, 0, 1.5, 0.5, 0.5
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
-4.77505, 0.1162182, -7.901306, 0, -0.5, 0.5, 0.5,
-4.77505, 0.1162182, -7.901306, 1, -0.5, 0.5, 0.5,
-4.77505, 0.1162182, -7.901306, 1, 1.5, 0.5, 0.5,
-4.77505, 0.1162182, -7.901306, 0, 1.5, 0.5, 0.5
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
-4.77505, -4.860438, -0.4184349, 0, -0.5, 0.5, 0.5,
-4.77505, -4.860438, -0.4184349, 1, -0.5, 0.5, 0.5,
-4.77505, -4.860438, -0.4184349, 1, 1.5, 0.5, 0.5,
-4.77505, -4.860438, -0.4184349, 0, 1.5, 0.5, 0.5
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
-2, -3.711979, -6.174489,
2, -3.711979, -6.174489,
-2, -3.711979, -6.174489,
-2, -3.903389, -6.462292,
0, -3.711979, -6.174489,
0, -3.903389, -6.462292,
2, -3.711979, -6.174489,
2, -3.903389, -6.462292
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
"0",
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
-2, -4.286209, -7.037898, 0, -0.5, 0.5, 0.5,
-2, -4.286209, -7.037898, 1, -0.5, 0.5, 0.5,
-2, -4.286209, -7.037898, 1, 1.5, 0.5, 0.5,
-2, -4.286209, -7.037898, 0, 1.5, 0.5, 0.5,
0, -4.286209, -7.037898, 0, -0.5, 0.5, 0.5,
0, -4.286209, -7.037898, 1, -0.5, 0.5, 0.5,
0, -4.286209, -7.037898, 1, 1.5, 0.5, 0.5,
0, -4.286209, -7.037898, 0, 1.5, 0.5, 0.5,
2, -4.286209, -7.037898, 0, -0.5, 0.5, 0.5,
2, -4.286209, -7.037898, 1, -0.5, 0.5, 0.5,
2, -4.286209, -7.037898, 1, 1.5, 0.5, 0.5,
2, -4.286209, -7.037898, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.683749, -2, -6.174489,
-3.683749, 2, -6.174489,
-3.683749, -2, -6.174489,
-3.865633, -2, -6.462292,
-3.683749, 0, -6.174489,
-3.865633, 0, -6.462292,
-3.683749, 2, -6.174489,
-3.865633, 2, -6.462292
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
"0",
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
-4.229399, -2, -7.037898, 0, -0.5, 0.5, 0.5,
-4.229399, -2, -7.037898, 1, -0.5, 0.5, 0.5,
-4.229399, -2, -7.037898, 1, 1.5, 0.5, 0.5,
-4.229399, -2, -7.037898, 0, 1.5, 0.5, 0.5,
-4.229399, 0, -7.037898, 0, -0.5, 0.5, 0.5,
-4.229399, 0, -7.037898, 1, -0.5, 0.5, 0.5,
-4.229399, 0, -7.037898, 1, 1.5, 0.5, 0.5,
-4.229399, 0, -7.037898, 0, 1.5, 0.5, 0.5,
-4.229399, 2, -7.037898, 0, -0.5, 0.5, 0.5,
-4.229399, 2, -7.037898, 1, -0.5, 0.5, 0.5,
-4.229399, 2, -7.037898, 1, 1.5, 0.5, 0.5,
-4.229399, 2, -7.037898, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.683749, -3.711979, -6,
-3.683749, -3.711979, 4,
-3.683749, -3.711979, -6,
-3.865633, -3.903389, -6,
-3.683749, -3.711979, -4,
-3.865633, -3.903389, -4,
-3.683749, -3.711979, -2,
-3.865633, -3.903389, -2,
-3.683749, -3.711979, 0,
-3.865633, -3.903389, 0,
-3.683749, -3.711979, 2,
-3.865633, -3.903389, 2,
-3.683749, -3.711979, 4,
-3.865633, -3.903389, 4
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
"-6",
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
-4.229399, -4.286209, -6, 0, -0.5, 0.5, 0.5,
-4.229399, -4.286209, -6, 1, -0.5, 0.5, 0.5,
-4.229399, -4.286209, -6, 1, 1.5, 0.5, 0.5,
-4.229399, -4.286209, -6, 0, 1.5, 0.5, 0.5,
-4.229399, -4.286209, -4, 0, -0.5, 0.5, 0.5,
-4.229399, -4.286209, -4, 1, -0.5, 0.5, 0.5,
-4.229399, -4.286209, -4, 1, 1.5, 0.5, 0.5,
-4.229399, -4.286209, -4, 0, 1.5, 0.5, 0.5,
-4.229399, -4.286209, -2, 0, -0.5, 0.5, 0.5,
-4.229399, -4.286209, -2, 1, -0.5, 0.5, 0.5,
-4.229399, -4.286209, -2, 1, 1.5, 0.5, 0.5,
-4.229399, -4.286209, -2, 0, 1.5, 0.5, 0.5,
-4.229399, -4.286209, 0, 0, -0.5, 0.5, 0.5,
-4.229399, -4.286209, 0, 1, -0.5, 0.5, 0.5,
-4.229399, -4.286209, 0, 1, 1.5, 0.5, 0.5,
-4.229399, -4.286209, 0, 0, 1.5, 0.5, 0.5,
-4.229399, -4.286209, 2, 0, -0.5, 0.5, 0.5,
-4.229399, -4.286209, 2, 1, -0.5, 0.5, 0.5,
-4.229399, -4.286209, 2, 1, 1.5, 0.5, 0.5,
-4.229399, -4.286209, 2, 0, 1.5, 0.5, 0.5,
-4.229399, -4.286209, 4, 0, -0.5, 0.5, 0.5,
-4.229399, -4.286209, 4, 1, -0.5, 0.5, 0.5,
-4.229399, -4.286209, 4, 1, 1.5, 0.5, 0.5,
-4.229399, -4.286209, 4, 0, 1.5, 0.5, 0.5
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
-3.683749, -3.711979, -6.174489,
-3.683749, 3.944416, -6.174489,
-3.683749, -3.711979, 5.33762,
-3.683749, 3.944416, 5.33762,
-3.683749, -3.711979, -6.174489,
-3.683749, -3.711979, 5.33762,
-3.683749, 3.944416, -6.174489,
-3.683749, 3.944416, 5.33762,
-3.683749, -3.711979, -6.174489,
3.591587, -3.711979, -6.174489,
-3.683749, -3.711979, 5.33762,
3.591587, -3.711979, 5.33762,
-3.683749, 3.944416, -6.174489,
3.591587, 3.944416, -6.174489,
-3.683749, 3.944416, 5.33762,
3.591587, 3.944416, 5.33762,
3.591587, -3.711979, -6.174489,
3.591587, 3.944416, -6.174489,
3.591587, -3.711979, 5.33762,
3.591587, 3.944416, 5.33762,
3.591587, -3.711979, -6.174489,
3.591587, -3.711979, 5.33762,
3.591587, 3.944416, -6.174489,
3.591587, 3.944416, 5.33762
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
var radius = 8.342403;
var distance = 37.11629;
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
mvMatrix.translate( 0.04608107, -0.1162182, 0.4184349 );
mvMatrix.scale( 1.239801, 1.178096, 0.7835202 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.11629);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Ethoprop<-read.table("Ethoprop.xyz")
```

```
## Error in read.table("Ethoprop.xyz"): no lines available in input
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
-3.577798, -0.007374915, -2.771113, 0, 0, 1, 1, 1,
-3.410369, -0.373664, -1.100087, 1, 0, 0, 1, 1,
-2.826665, -1.201092, -2.800492, 1, 0, 0, 1, 1,
-2.750756, -1.262056, -1.617941, 1, 0, 0, 1, 1,
-2.372713, -0.381902, -1.170614, 1, 0, 0, 1, 1,
-2.354085, -0.2205233, -1.318619, 1, 0, 0, 1, 1,
-2.26453, -1.354411, -3.074111, 0, 0, 0, 1, 1,
-2.16855, -1.118674, -1.206245, 0, 0, 0, 1, 1,
-2.158086, -0.5435349, -1.538782, 0, 0, 0, 1, 1,
-2.105742, 0.4209101, -2.07744, 0, 0, 0, 1, 1,
-2.084027, -0.8278413, -2.617935, 0, 0, 0, 1, 1,
-2.039885, -1.201995, -2.250998, 0, 0, 0, 1, 1,
-2.018429, -1.08467, -1.289625, 0, 0, 0, 1, 1,
-2.017886, 1.058414, -0.6754311, 1, 1, 1, 1, 1,
-1.986283, -0.1709337, -1.745605, 1, 1, 1, 1, 1,
-1.977809, 2.222978, -0.9539096, 1, 1, 1, 1, 1,
-1.964503, -0.5899457, -2.035384, 1, 1, 1, 1, 1,
-1.962829, 0.706149, -0.2083161, 1, 1, 1, 1, 1,
-1.918204, -0.5616072, -2.070214, 1, 1, 1, 1, 1,
-1.914785, 1.026516, -1.02311, 1, 1, 1, 1, 1,
-1.891128, -1.501944, -2.128656, 1, 1, 1, 1, 1,
-1.884937, 1.094516, -1.314434, 1, 1, 1, 1, 1,
-1.861342, -0.8633668, -2.029277, 1, 1, 1, 1, 1,
-1.85264, 0.009303435, -1.797202, 1, 1, 1, 1, 1,
-1.85259, 1.364985, -0.2945661, 1, 1, 1, 1, 1,
-1.76921, -1.861658, -4.152196, 1, 1, 1, 1, 1,
-1.729771, -0.06479745, -1.413413, 1, 1, 1, 1, 1,
-1.723948, -0.2772271, -0.7888523, 1, 1, 1, 1, 1,
-1.64904, 0.124118, -1.726059, 0, 0, 1, 1, 1,
-1.63117, 1.645871, -2.015282, 1, 0, 0, 1, 1,
-1.626878, -0.001961872, -2.014563, 1, 0, 0, 1, 1,
-1.601628, 0.1190609, -1.04766, 1, 0, 0, 1, 1,
-1.585279, -1.182872, -2.949738, 1, 0, 0, 1, 1,
-1.580237, 0.7381395, -0.5733335, 1, 0, 0, 1, 1,
-1.577234, 0.2493387, -0.9330448, 0, 0, 0, 1, 1,
-1.554768, -0.5551293, -2.624278, 0, 0, 0, 1, 1,
-1.54662, 0.05498531, -0.7835224, 0, 0, 0, 1, 1,
-1.546033, -0.7576852, -1.281063, 0, 0, 0, 1, 1,
-1.524953, 0.9394131, 0.1732459, 0, 0, 0, 1, 1,
-1.522663, 2.556674, -1.281798, 0, 0, 0, 1, 1,
-1.522356, 2.176856, -0.5078296, 0, 0, 0, 1, 1,
-1.522244, 2.252636, -2.59727, 1, 1, 1, 1, 1,
-1.521271, -0.09770617, -1.557958, 1, 1, 1, 1, 1,
-1.51553, -0.3585612, -1.648466, 1, 1, 1, 1, 1,
-1.500973, -0.1102012, -1.142545, 1, 1, 1, 1, 1,
-1.472107, -0.842262, -1.219004, 1, 1, 1, 1, 1,
-1.46989, -1.453517, -3.155024, 1, 1, 1, 1, 1,
-1.461502, 0.5664337, -0.5816537, 1, 1, 1, 1, 1,
-1.455354, -0.02058385, -1.412286, 1, 1, 1, 1, 1,
-1.447276, -0.1774651, 0.2589936, 1, 1, 1, 1, 1,
-1.441444, 0.05002314, -1.686713, 1, 1, 1, 1, 1,
-1.43571, 0.3954059, -0.7935085, 1, 1, 1, 1, 1,
-1.375633, -1.622167, -4.252689, 1, 1, 1, 1, 1,
-1.375248, -0.7476014, -2.816595, 1, 1, 1, 1, 1,
-1.368866, -0.2454936, -2.042547, 1, 1, 1, 1, 1,
-1.364959, -0.2771194, -1.465135, 1, 1, 1, 1, 1,
-1.356736, -0.8398338, -1.472799, 0, 0, 1, 1, 1,
-1.354441, 1.385192, -3.326807, 1, 0, 0, 1, 1,
-1.350196, -1.499582, -3.081494, 1, 0, 0, 1, 1,
-1.349822, 1.02612, -0.5251482, 1, 0, 0, 1, 1,
-1.342877, 1.685335, -0.8972233, 1, 0, 0, 1, 1,
-1.331933, -0.5020124, -0.3231232, 1, 0, 0, 1, 1,
-1.320626, 2.35142, -1.243049, 0, 0, 0, 1, 1,
-1.317816, -0.5273172, -1.692978, 0, 0, 0, 1, 1,
-1.317387, 0.6087751, 0.7376076, 0, 0, 0, 1, 1,
-1.317174, 0.2390013, -2.043115, 0, 0, 0, 1, 1,
-1.311607, -0.09295263, -2.027084, 0, 0, 0, 1, 1,
-1.30725, 0.6912801, -1.228425, 0, 0, 0, 1, 1,
-1.304801, 1.154082, -0.7410168, 0, 0, 0, 1, 1,
-1.300391, -1.025859, -1.157332, 1, 1, 1, 1, 1,
-1.299764, -0.3557856, -1.063136, 1, 1, 1, 1, 1,
-1.299239, 0.4481303, -2.601662, 1, 1, 1, 1, 1,
-1.295975, -0.813134, -1.731955, 1, 1, 1, 1, 1,
-1.295324, 0.08149814, -0.7976652, 1, 1, 1, 1, 1,
-1.279338, 0.6332835, -1.891536, 1, 1, 1, 1, 1,
-1.27126, 0.1136317, -1.576045, 1, 1, 1, 1, 1,
-1.250458, -1.079038, -4.1158, 1, 1, 1, 1, 1,
-1.244813, 1.148417, -1.575625, 1, 1, 1, 1, 1,
-1.242518, 0.6502413, -2.124212, 1, 1, 1, 1, 1,
-1.231759, -1.282235, -2.42414, 1, 1, 1, 1, 1,
-1.227634, 2.051472, -1.065392, 1, 1, 1, 1, 1,
-1.222752, -1.210232, -1.664966, 1, 1, 1, 1, 1,
-1.221045, -0.4932643, -1.491182, 1, 1, 1, 1, 1,
-1.220971, 0.5313732, -1.895564, 1, 1, 1, 1, 1,
-1.215243, 1.699307, -0.6435687, 0, 0, 1, 1, 1,
-1.211208, -0.4721069, -1.158974, 1, 0, 0, 1, 1,
-1.203123, -0.7355232, -1.453869, 1, 0, 0, 1, 1,
-1.195114, 1.798514, -1.486826, 1, 0, 0, 1, 1,
-1.192613, -0.6101943, -3.583263, 1, 0, 0, 1, 1,
-1.187388, -0.424628, -1.220873, 1, 0, 0, 1, 1,
-1.183924, -0.01674646, -2.014188, 0, 0, 0, 1, 1,
-1.179449, -1.918135, -1.668572, 0, 0, 0, 1, 1,
-1.175596, -2.230847, -3.182853, 0, 0, 0, 1, 1,
-1.17055, -0.1877785, -3.143373, 0, 0, 0, 1, 1,
-1.167536, -1.202468, -1.791919, 0, 0, 0, 1, 1,
-1.163325, -1.246791, -1.638622, 0, 0, 0, 1, 1,
-1.159732, 0.4672063, -0.9488158, 0, 0, 0, 1, 1,
-1.158703, 1.041009, -0.9507362, 1, 1, 1, 1, 1,
-1.156006, 0.4538551, -0.09820727, 1, 1, 1, 1, 1,
-1.15556, 1.272814, 0.6010065, 1, 1, 1, 1, 1,
-1.152505, 0.1682503, -1.396358, 1, 1, 1, 1, 1,
-1.152071, 1.451001, -0.7759975, 1, 1, 1, 1, 1,
-1.147946, 0.1508716, -2.59851, 1, 1, 1, 1, 1,
-1.14567, 1.34809, -1.664483, 1, 1, 1, 1, 1,
-1.144343, 0.02523425, -1.726691, 1, 1, 1, 1, 1,
-1.143062, -0.4456957, -2.614615, 1, 1, 1, 1, 1,
-1.141959, 0.651188, -3.293189, 1, 1, 1, 1, 1,
-1.138277, 0.518214, -0.3075425, 1, 1, 1, 1, 1,
-1.12588, -1.941524, -2.985454, 1, 1, 1, 1, 1,
-1.120586, 0.2466193, -2.061716, 1, 1, 1, 1, 1,
-1.10602, 0.7832853, 1.090958, 1, 1, 1, 1, 1,
-1.10455, -0.8032329, -2.405597, 1, 1, 1, 1, 1,
-1.078444, -0.2826821, -0.614406, 0, 0, 1, 1, 1,
-1.077635, 0.7778233, -2.159994, 1, 0, 0, 1, 1,
-1.069914, 1.909938, -0.3501115, 1, 0, 0, 1, 1,
-1.061738, -0.6538308, -3.543262, 1, 0, 0, 1, 1,
-1.053367, 0.776825, -0.7483339, 1, 0, 0, 1, 1,
-1.049599, 1.367678, 0.02245291, 1, 0, 0, 1, 1,
-1.048578, 2.112831, -0.3110984, 0, 0, 0, 1, 1,
-1.046823, 0.2525707, -2.656748, 0, 0, 0, 1, 1,
-1.042334, 0.5607654, -2.091494, 0, 0, 0, 1, 1,
-1.039445, 0.1659583, -1.172427, 0, 0, 0, 1, 1,
-1.033222, -0.5798861, -3.36837, 0, 0, 0, 1, 1,
-1.033111, -0.07485251, -1.326155, 0, 0, 0, 1, 1,
-1.025622, -0.04633377, -1.912078, 0, 0, 0, 1, 1,
-1.022163, -0.7715433, -2.630945, 1, 1, 1, 1, 1,
-1.017026, -0.6266536, -1.312947, 1, 1, 1, 1, 1,
-1.010549, -0.7361771, -2.0086, 1, 1, 1, 1, 1,
-1.008473, 0.6128528, -0.3255291, 1, 1, 1, 1, 1,
-1.003231, -0.7998124, -3.9115, 1, 1, 1, 1, 1,
-0.9973795, -1.350929, -2.160079, 1, 1, 1, 1, 1,
-0.9945707, 1.566483, 0.1935998, 1, 1, 1, 1, 1,
-0.9835154, 0.2275044, -1.873579, 1, 1, 1, 1, 1,
-0.9825365, 0.5142854, 1.147729, 1, 1, 1, 1, 1,
-0.9713654, -1.419068, -2.775415, 1, 1, 1, 1, 1,
-0.9679419, 1.898472, -0.9874247, 1, 1, 1, 1, 1,
-0.954245, -1.060575, -2.243745, 1, 1, 1, 1, 1,
-0.9523826, -2.009175, -1.788011, 1, 1, 1, 1, 1,
-0.9519945, -0.07754587, -1.223679, 1, 1, 1, 1, 1,
-0.9440508, 0.2830817, -1.407209, 1, 1, 1, 1, 1,
-0.9368262, -1.115728, -2.368903, 0, 0, 1, 1, 1,
-0.9307625, 0.2933745, -1.974067, 1, 0, 0, 1, 1,
-0.928881, -1.143874, -1.629059, 1, 0, 0, 1, 1,
-0.9286966, -0.3096861, -1.135874, 1, 0, 0, 1, 1,
-0.9274619, 0.6774276, -1.10877, 1, 0, 0, 1, 1,
-0.9241995, 1.806134, 0.8220609, 1, 0, 0, 1, 1,
-0.9204796, -0.8594125, -1.498766, 0, 0, 0, 1, 1,
-0.9192716, -1.125136, -2.891679, 0, 0, 0, 1, 1,
-0.9185088, 0.4603419, 0.7044756, 0, 0, 0, 1, 1,
-0.918392, 1.38494, -1.166923, 0, 0, 0, 1, 1,
-0.9157357, -0.2410228, -1.944276, 0, 0, 0, 1, 1,
-0.9130231, 1.655248, -0.02557291, 0, 0, 0, 1, 1,
-0.9099131, -0.6966588, -3.010179, 0, 0, 0, 1, 1,
-0.9013776, -0.8087801, -2.672292, 1, 1, 1, 1, 1,
-0.8998048, 0.5794758, -2.972009, 1, 1, 1, 1, 1,
-0.8904777, -0.9612348, -1.637627, 1, 1, 1, 1, 1,
-0.8877168, 2.470547, -0.1655991, 1, 1, 1, 1, 1,
-0.8711228, 0.561918, -0.1791325, 1, 1, 1, 1, 1,
-0.8691847, 1.62048, -1.226611, 1, 1, 1, 1, 1,
-0.8679479, 0.0593616, -3.091827, 1, 1, 1, 1, 1,
-0.8677594, 0.1745198, -2.212231, 1, 1, 1, 1, 1,
-0.866835, 0.5044634, -0.9239944, 1, 1, 1, 1, 1,
-0.8610339, -0.3259674, -0.2351424, 1, 1, 1, 1, 1,
-0.8595859, 0.9179555, -1.814775, 1, 1, 1, 1, 1,
-0.856945, 0.01426427, -2.255473, 1, 1, 1, 1, 1,
-0.8508772, 0.4865624, -1.202904, 1, 1, 1, 1, 1,
-0.8488757, -0.3426962, -1.055361, 1, 1, 1, 1, 1,
-0.8432842, 0.9564314, -1.029925, 1, 1, 1, 1, 1,
-0.8428543, -0.7378477, -1.569496, 0, 0, 1, 1, 1,
-0.8423948, 1.064678, -1.521177, 1, 0, 0, 1, 1,
-0.8409329, -0.05672531, -0.01169191, 1, 0, 0, 1, 1,
-0.8356845, -0.6060559, -0.5953486, 1, 0, 0, 1, 1,
-0.8348212, 0.9377557, -0.8337679, 1, 0, 0, 1, 1,
-0.8294206, 1.324847, -0.5872343, 1, 0, 0, 1, 1,
-0.828774, 1.159295, -1.709396, 0, 0, 0, 1, 1,
-0.8150676, -0.2781349, -1.888766, 0, 0, 0, 1, 1,
-0.81365, 0.631304, 0.01120988, 0, 0, 0, 1, 1,
-0.808422, -0.07599571, -3.047867, 0, 0, 0, 1, 1,
-0.8078462, -0.1905182, -1.517324, 0, 0, 0, 1, 1,
-0.800967, 0.7525036, -1.860679, 0, 0, 0, 1, 1,
-0.7918073, -0.3850178, -2.292441, 0, 0, 0, 1, 1,
-0.7862265, -0.2990288, -3.849292, 1, 1, 1, 1, 1,
-0.7811992, -0.05285915, -1.495728, 1, 1, 1, 1, 1,
-0.7699229, -1.671476, -3.165708, 1, 1, 1, 1, 1,
-0.7630875, -0.8349071, -2.380053, 1, 1, 1, 1, 1,
-0.7611185, -0.2460311, -0.5475768, 1, 1, 1, 1, 1,
-0.7601526, -0.7930564, -2.742563, 1, 1, 1, 1, 1,
-0.7473899, 0.007724285, -2.937758, 1, 1, 1, 1, 1,
-0.7453185, 0.2805381, -1.312042, 1, 1, 1, 1, 1,
-0.7442133, 0.08197945, 1.317053, 1, 1, 1, 1, 1,
-0.7412288, 1.662494, 0.08714633, 1, 1, 1, 1, 1,
-0.7403777, -0.2104768, -2.47802, 1, 1, 1, 1, 1,
-0.7317666, 0.4272881, -2.692411, 1, 1, 1, 1, 1,
-0.7288048, -0.4899125, -2.003621, 1, 1, 1, 1, 1,
-0.7276957, 0.8692434, -0.7539574, 1, 1, 1, 1, 1,
-0.7245704, -0.2908015, -1.181069, 1, 1, 1, 1, 1,
-0.7169347, 2.29186, 0.4092932, 0, 0, 1, 1, 1,
-0.7079566, -0.5873756, -3.827752, 1, 0, 0, 1, 1,
-0.7076281, -0.630282, -1.87138, 1, 0, 0, 1, 1,
-0.7049514, 0.07957489, -3.156919, 1, 0, 0, 1, 1,
-0.7008573, 0.1631284, -1.584468, 1, 0, 0, 1, 1,
-0.6993824, 2.171356, -2.070087, 1, 0, 0, 1, 1,
-0.6976082, -0.5909778, -3.037145, 0, 0, 0, 1, 1,
-0.6957362, -0.5450263, -0.8870314, 0, 0, 0, 1, 1,
-0.6933424, -0.2597989, -2.241786, 0, 0, 0, 1, 1,
-0.6904275, -0.2969895, -2.178845, 0, 0, 0, 1, 1,
-0.6875131, -1.675983, -3.804709, 0, 0, 0, 1, 1,
-0.6857211, 1.456991, 1.131726, 0, 0, 0, 1, 1,
-0.6818801, -1.752114, -0.4221081, 0, 0, 0, 1, 1,
-0.6794764, 0.01290627, -1.83384, 1, 1, 1, 1, 1,
-0.6765009, 0.3732943, -0.4485593, 1, 1, 1, 1, 1,
-0.6690928, 0.3853828, -0.616137, 1, 1, 1, 1, 1,
-0.6680126, -0.972033, -0.8246619, 1, 1, 1, 1, 1,
-0.6588669, -3.108543, -1.797154, 1, 1, 1, 1, 1,
-0.6536183, 0.6468983, 0.05940547, 1, 1, 1, 1, 1,
-0.6501576, -1.265381, -2.308717, 1, 1, 1, 1, 1,
-0.6498234, -0.1090871, -0.1068478, 1, 1, 1, 1, 1,
-0.6487448, -1.014677, -3.690926, 1, 1, 1, 1, 1,
-0.6396877, 0.3637273, -2.552262, 1, 1, 1, 1, 1,
-0.6352684, -0.3739589, -2.230525, 1, 1, 1, 1, 1,
-0.6329449, -0.576463, -2.866174, 1, 1, 1, 1, 1,
-0.6309776, 0.2740113, 0.03742792, 1, 1, 1, 1, 1,
-0.6307582, 0.8522506, -0.5089636, 1, 1, 1, 1, 1,
-0.6303578, 1.200192, -1.446856, 1, 1, 1, 1, 1,
-0.6259546, 0.5465859, -0.4538423, 0, 0, 1, 1, 1,
-0.6212287, -0.006944315, 0.2003001, 1, 0, 0, 1, 1,
-0.6149626, 0.07844379, -0.6236795, 1, 0, 0, 1, 1,
-0.6141813, 1.203027, 0.0847798, 1, 0, 0, 1, 1,
-0.6075386, -0.1876976, -0.976769, 1, 0, 0, 1, 1,
-0.6063306, -0.2484204, -2.088181, 1, 0, 0, 1, 1,
-0.6061366, 0.9187461, -0.1741056, 0, 0, 0, 1, 1,
-0.6033231, 1.069718, -1.368423, 0, 0, 0, 1, 1,
-0.5987801, -0.785019, -2.760832, 0, 0, 0, 1, 1,
-0.5973892, 0.4816926, -0.7653715, 0, 0, 0, 1, 1,
-0.5973185, -0.5206826, -1.489478, 0, 0, 0, 1, 1,
-0.5961965, -0.1016753, -0.9675537, 0, 0, 0, 1, 1,
-0.5908548, 2.428362, -1.884314, 0, 0, 0, 1, 1,
-0.5852138, -1.817742, -3.93417, 1, 1, 1, 1, 1,
-0.583715, 0.9970023, 0.7431989, 1, 1, 1, 1, 1,
-0.581799, 0.876197, 0.8454779, 1, 1, 1, 1, 1,
-0.5806289, 1.873211, 0.5655031, 1, 1, 1, 1, 1,
-0.578562, -0.3876973, -3.687918, 1, 1, 1, 1, 1,
-0.5769168, -1.362196, -2.858625, 1, 1, 1, 1, 1,
-0.5764365, -1.131928, -2.096628, 1, 1, 1, 1, 1,
-0.5732346, 0.5987303, -0.9994864, 1, 1, 1, 1, 1,
-0.5686224, 1.131614, -1.863333, 1, 1, 1, 1, 1,
-0.5663087, -0.3587652, -2.58465, 1, 1, 1, 1, 1,
-0.5658647, -0.4278086, -2.643688, 1, 1, 1, 1, 1,
-0.5576528, -0.2405337, -3.137379, 1, 1, 1, 1, 1,
-0.5576127, 0.5919268, -0.9023518, 1, 1, 1, 1, 1,
-0.5556124, 1.372802, -1.639497, 1, 1, 1, 1, 1,
-0.5551991, 0.3793264, -0.1677264, 1, 1, 1, 1, 1,
-0.5521389, -0.5898699, -3.110879, 0, 0, 1, 1, 1,
-0.5521141, -1.255862, -2.990143, 1, 0, 0, 1, 1,
-0.5518597, -0.4986994, -1.825055, 1, 0, 0, 1, 1,
-0.5460882, 0.7637968, -0.3718499, 1, 0, 0, 1, 1,
-0.5421802, -0.4363168, -1.894608, 1, 0, 0, 1, 1,
-0.5351087, -1.985291, -4.705496, 1, 0, 0, 1, 1,
-0.5291101, 1.395441, -0.489798, 0, 0, 0, 1, 1,
-0.5288688, 0.9980217, -1.360901, 0, 0, 0, 1, 1,
-0.5276635, -0.7663842, -4.209427, 0, 0, 0, 1, 1,
-0.5252371, 0.1533303, 0.6322269, 0, 0, 0, 1, 1,
-0.5239801, 0.1585779, -2.649504, 0, 0, 0, 1, 1,
-0.5220878, -0.3492287, -1.704918, 0, 0, 0, 1, 1,
-0.5194514, 0.4514494, -0.8681077, 0, 0, 0, 1, 1,
-0.5185534, 1.977181, 0.6724382, 1, 1, 1, 1, 1,
-0.5174409, -1.121905, -3.096803, 1, 1, 1, 1, 1,
-0.5149937, -0.1725838, -0.8420375, 1, 1, 1, 1, 1,
-0.5119969, 0.816893, -1.936026, 1, 1, 1, 1, 1,
-0.507113, -1.882579, -1.469551, 1, 1, 1, 1, 1,
-0.5057347, -0.8521604, -2.419463, 1, 1, 1, 1, 1,
-0.500475, -1.005726, -1.234779, 1, 1, 1, 1, 1,
-0.4967249, -1.000653, -2.751007, 1, 1, 1, 1, 1,
-0.4942957, -0.6152893, -2.000305, 1, 1, 1, 1, 1,
-0.4889895, -0.1966415, -1.857375, 1, 1, 1, 1, 1,
-0.4887797, -0.8781506, -3.916957, 1, 1, 1, 1, 1,
-0.4870885, -0.1289816, -3.3426, 1, 1, 1, 1, 1,
-0.4866578, -0.5674856, -2.769112, 1, 1, 1, 1, 1,
-0.4797828, -0.3425828, -2.61641, 1, 1, 1, 1, 1,
-0.4764064, -0.6797487, -2.201874, 1, 1, 1, 1, 1,
-0.4760131, -0.1878461, -1.636711, 0, 0, 1, 1, 1,
-0.4739815, 1.10816, 0.4445956, 1, 0, 0, 1, 1,
-0.4731294, 0.1252857, -0.9640454, 1, 0, 0, 1, 1,
-0.4711095, -0.9599199, -0.9203761, 1, 0, 0, 1, 1,
-0.4709882, 0.1885113, -1.754819, 1, 0, 0, 1, 1,
-0.4693195, 0.3856922, -1.144946, 1, 0, 0, 1, 1,
-0.4682858, -1.830612, -3.02284, 0, 0, 0, 1, 1,
-0.4671985, -0.6291344, -4.674682, 0, 0, 0, 1, 1,
-0.4580011, 1.079239, 0.400378, 0, 0, 0, 1, 1,
-0.4524693, 0.5315186, -0.8120414, 0, 0, 0, 1, 1,
-0.4520278, 0.08931222, -2.123869, 0, 0, 0, 1, 1,
-0.451665, -0.808377, -4.238846, 0, 0, 0, 1, 1,
-0.4491654, -0.4284506, -3.710908, 0, 0, 0, 1, 1,
-0.4481448, -0.3240851, -1.215585, 1, 1, 1, 1, 1,
-0.4477843, 0.8959312, -1.706663, 1, 1, 1, 1, 1,
-0.4472455, -0.3173294, -1.10544, 1, 1, 1, 1, 1,
-0.4469854, -0.3421414, -2.76381, 1, 1, 1, 1, 1,
-0.4462489, -0.07068401, -1.955417, 1, 1, 1, 1, 1,
-0.4449305, 1.3335, -1.36532, 1, 1, 1, 1, 1,
-0.4426953, 0.7220947, 0.4805069, 1, 1, 1, 1, 1,
-0.4407708, 0.8450585, 0.4367349, 1, 1, 1, 1, 1,
-0.4397064, -0.9214587, -2.209455, 1, 1, 1, 1, 1,
-0.4330364, 0.1459694, -0.9567187, 1, 1, 1, 1, 1,
-0.4330161, -0.1789315, -0.9897442, 1, 1, 1, 1, 1,
-0.4311288, 2.024351, 0.06073142, 1, 1, 1, 1, 1,
-0.4217688, 1.797105, -0.01701219, 1, 1, 1, 1, 1,
-0.4215451, -1.28789, -3.139731, 1, 1, 1, 1, 1,
-0.4199483, -2.558345, -3.901353, 1, 1, 1, 1, 1,
-0.4158352, 0.4968785, 0.8317301, 0, 0, 1, 1, 1,
-0.414173, 0.07898054, -0.8950199, 1, 0, 0, 1, 1,
-0.409618, -1.178361, -1.046597, 1, 0, 0, 1, 1,
-0.4090518, -0.8550864, -2.559598, 1, 0, 0, 1, 1,
-0.4072157, -0.566453, -2.716247, 1, 0, 0, 1, 1,
-0.4039903, -1.563318, -2.232659, 1, 0, 0, 1, 1,
-0.4021954, -0.2262717, -2.886593, 0, 0, 0, 1, 1,
-0.4017284, -0.9312956, -0.5463078, 0, 0, 0, 1, 1,
-0.4004379, 0.2429087, -0.4261339, 0, 0, 0, 1, 1,
-0.39867, -0.006295473, -1.742939, 0, 0, 0, 1, 1,
-0.3977096, -1.702734, -4.734647, 0, 0, 0, 1, 1,
-0.3967773, -0.05722633, -1.788082, 0, 0, 0, 1, 1,
-0.3950472, -0.781159, -0.07528704, 0, 0, 0, 1, 1,
-0.3862428, -1.172244, -1.623044, 1, 1, 1, 1, 1,
-0.3859574, 1.777719, -1.183861, 1, 1, 1, 1, 1,
-0.3842177, 0.09811082, -1.43259, 1, 1, 1, 1, 1,
-0.3832932, 2.060657, -0.1033075, 1, 1, 1, 1, 1,
-0.3811698, -2.129356, -3.453519, 1, 1, 1, 1, 1,
-0.3796762, -1.005387, -4.209451, 1, 1, 1, 1, 1,
-0.3760585, 1.182987, -1.025394, 1, 1, 1, 1, 1,
-0.3749627, -1.317806, -3.418795, 1, 1, 1, 1, 1,
-0.3746257, -0.8184314, -3.021905, 1, 1, 1, 1, 1,
-0.3741662, -0.4933267, -2.870522, 1, 1, 1, 1, 1,
-0.3690714, 0.4338387, -0.07748192, 1, 1, 1, 1, 1,
-0.365291, -0.3583943, -1.87317, 1, 1, 1, 1, 1,
-0.3604553, -1.520568, -3.014406, 1, 1, 1, 1, 1,
-0.3576532, -1.415572, -3.505053, 1, 1, 1, 1, 1,
-0.3547683, -0.2239798, -2.148769, 1, 1, 1, 1, 1,
-0.3542169, 0.6519204, 0.09124145, 0, 0, 1, 1, 1,
-0.3539185, -1.066164, -3.741783, 1, 0, 0, 1, 1,
-0.3518275, -0.3250037, -2.877106, 1, 0, 0, 1, 1,
-0.351129, 0.1422786, -2.068776, 1, 0, 0, 1, 1,
-0.3505754, -0.09815347, -2.420001, 1, 0, 0, 1, 1,
-0.3502189, 0.05086313, -2.411414, 1, 0, 0, 1, 1,
-0.3475544, -1.289798, -3.597854, 0, 0, 0, 1, 1,
-0.3434479, 0.5799371, -1.068348, 0, 0, 0, 1, 1,
-0.3420242, -0.3503808, -1.977531, 0, 0, 0, 1, 1,
-0.3365756, 0.8212633, -1.497012, 0, 0, 0, 1, 1,
-0.334936, 1.011395, 0.01790771, 0, 0, 0, 1, 1,
-0.3324723, 0.1864565, -1.381101, 0, 0, 0, 1, 1,
-0.3290487, -0.7017695, -2.252306, 0, 0, 0, 1, 1,
-0.326232, -0.3294581, -1.460871, 1, 1, 1, 1, 1,
-0.3253169, -0.9515938, -2.795599, 1, 1, 1, 1, 1,
-0.3236088, -0.2755986, -1.797239, 1, 1, 1, 1, 1,
-0.3210894, 1.881105, 0.7359657, 1, 1, 1, 1, 1,
-0.3189992, -0.1578605, -1.342916, 1, 1, 1, 1, 1,
-0.3167759, 0.1409867, -0.3844517, 1, 1, 1, 1, 1,
-0.3158763, -0.7190315, -3.500742, 1, 1, 1, 1, 1,
-0.3126283, -0.1981445, -1.352911, 1, 1, 1, 1, 1,
-0.3114556, -0.1446137, -1.95768, 1, 1, 1, 1, 1,
-0.3099087, 0.5668035, 0.3298428, 1, 1, 1, 1, 1,
-0.3092176, -0.0241217, -1.802294, 1, 1, 1, 1, 1,
-0.306052, 0.9959006, -0.5817689, 1, 1, 1, 1, 1,
-0.3000959, -0.9707229, -2.66973, 1, 1, 1, 1, 1,
-0.2936228, -1.775617, -3.316581, 1, 1, 1, 1, 1,
-0.2892401, 0.1221766, -2.8983, 1, 1, 1, 1, 1,
-0.2891829, 0.5838333, -1.608316, 0, 0, 1, 1, 1,
-0.285509, 0.9721528, -0.5279554, 1, 0, 0, 1, 1,
-0.2838374, -1.811306, -2.929076, 1, 0, 0, 1, 1,
-0.281186, -1.440836, -2.821096, 1, 0, 0, 1, 1,
-0.2801077, 1.027746, 0.1873502, 1, 0, 0, 1, 1,
-0.2775157, 1.798271, -0.0310405, 1, 0, 0, 1, 1,
-0.2737941, -1.011477, -4.037066, 0, 0, 0, 1, 1,
-0.2711951, -1.555136, -2.896096, 0, 0, 0, 1, 1,
-0.2660129, 0.8456187, 1.028033, 0, 0, 0, 1, 1,
-0.2550139, -1.320538, -3.12209, 0, 0, 0, 1, 1,
-0.2542563, 0.1136267, 1.137226, 0, 0, 0, 1, 1,
-0.2529752, -0.2897985, -1.090724, 0, 0, 0, 1, 1,
-0.2511592, 0.06179468, -2.195354, 0, 0, 0, 1, 1,
-0.2502812, 1.257692, -1.997453, 1, 1, 1, 1, 1,
-0.2472562, -0.498487, -1.647648, 1, 1, 1, 1, 1,
-0.2443896, -3.116317, -3.857541, 1, 1, 1, 1, 1,
-0.2414981, 0.1763499, 0.3223853, 1, 1, 1, 1, 1,
-0.2413391, -0.7212443, -2.325743, 1, 1, 1, 1, 1,
-0.2411547, -0.1656185, -1.765589, 1, 1, 1, 1, 1,
-0.2404054, 0.2571866, -0.6743202, 1, 1, 1, 1, 1,
-0.239923, -0.01019162, 0.4311157, 1, 1, 1, 1, 1,
-0.2378677, -0.8333187, -2.847963, 1, 1, 1, 1, 1,
-0.2377739, 0.4820699, -0.491748, 1, 1, 1, 1, 1,
-0.2339178, -0.133525, -2.008784, 1, 1, 1, 1, 1,
-0.2313636, -0.7598709, -1.722916, 1, 1, 1, 1, 1,
-0.2286182, 1.016498, -0.261745, 1, 1, 1, 1, 1,
-0.2271678, -0.4646774, -3.703397, 1, 1, 1, 1, 1,
-0.2248793, -1.191171, -4.450963, 1, 1, 1, 1, 1,
-0.2194295, -1.477266, -3.053495, 0, 0, 1, 1, 1,
-0.2186153, -0.6394999, -2.326897, 1, 0, 0, 1, 1,
-0.2166919, 0.9307406, -0.05549369, 1, 0, 0, 1, 1,
-0.2164128, -1.945586, -4.273897, 1, 0, 0, 1, 1,
-0.2159713, -1.048484, -3.754823, 1, 0, 0, 1, 1,
-0.2132675, -2.29132, -3.02585, 1, 0, 0, 1, 1,
-0.2104729, 0.129264, -2.441166, 0, 0, 0, 1, 1,
-0.2053447, 1.77419, -0.5472108, 0, 0, 0, 1, 1,
-0.2048275, 0.3142834, -0.2002683, 0, 0, 0, 1, 1,
-0.2044954, 0.02018817, -2.146541, 0, 0, 0, 1, 1,
-0.1976153, -0.336567, -2.845134, 0, 0, 0, 1, 1,
-0.197214, -0.4176054, -2.180776, 0, 0, 0, 1, 1,
-0.1883619, -0.01450309, -0.6326351, 0, 0, 0, 1, 1,
-0.1828951, 1.267913, 0.9736965, 1, 1, 1, 1, 1,
-0.1810297, 0.5084954, -0.6935779, 1, 1, 1, 1, 1,
-0.180728, 0.4423614, -2.173723, 1, 1, 1, 1, 1,
-0.177495, -0.0895923, -1.682294, 1, 1, 1, 1, 1,
-0.1720957, 0.05948582, -2.31622, 1, 1, 1, 1, 1,
-0.1702823, -0.1945157, -3.15489, 1, 1, 1, 1, 1,
-0.1680009, 0.3093477, -0.4279212, 1, 1, 1, 1, 1,
-0.1656847, -1.344697, -3.398456, 1, 1, 1, 1, 1,
-0.1631167, -0.4139053, -3.388038, 1, 1, 1, 1, 1,
-0.1605972, 0.2352434, -1.778484, 1, 1, 1, 1, 1,
-0.1594321, -0.2260807, -2.618471, 1, 1, 1, 1, 1,
-0.1583118, -1.131647, -4.846699, 1, 1, 1, 1, 1,
-0.1555343, 0.3031417, -2.024266, 1, 1, 1, 1, 1,
-0.1536852, 0.3316511, -2.387792, 1, 1, 1, 1, 1,
-0.1487314, 0.3662895, -0.5315994, 1, 1, 1, 1, 1,
-0.1469292, 0.9615238, -1.649575, 0, 0, 1, 1, 1,
-0.1462573, -1.503389, -2.550381, 1, 0, 0, 1, 1,
-0.1462203, -2.130484, -3.852355, 1, 0, 0, 1, 1,
-0.1452196, -0.9815585, -3.805551, 1, 0, 0, 1, 1,
-0.1430314, 0.1378587, -1.522888, 1, 0, 0, 1, 1,
-0.1418565, 0.3228018, -0.5402791, 1, 0, 0, 1, 1,
-0.1416658, -0.1744078, -1.727429, 0, 0, 0, 1, 1,
-0.1362487, -1.275089, -1.448214, 0, 0, 0, 1, 1,
-0.1346294, 1.117285, 1.117397, 0, 0, 0, 1, 1,
-0.1305826, 0.4795175, -1.59365, 0, 0, 0, 1, 1,
-0.1245297, -0.2616799, -6.006837, 0, 0, 0, 1, 1,
-0.1212168, 0.1727868, 0.0709006, 0, 0, 0, 1, 1,
-0.1207753, -1.367207, -2.144605, 0, 0, 0, 1, 1,
-0.1200453, -1.760843, -2.4344, 1, 1, 1, 1, 1,
-0.1172607, 1.164008, -0.979427, 1, 1, 1, 1, 1,
-0.1152206, -0.2929386, -2.500436, 1, 1, 1, 1, 1,
-0.1149822, -0.5244434, -2.483868, 1, 1, 1, 1, 1,
-0.114199, 3.832915, -1.887253, 1, 1, 1, 1, 1,
-0.112781, 0.01762914, -1.614452, 1, 1, 1, 1, 1,
-0.1109332, -0.5477599, -2.455746, 1, 1, 1, 1, 1,
-0.1097519, -1.397686, -4.027774, 1, 1, 1, 1, 1,
-0.1086031, 0.339175, -0.1451575, 1, 1, 1, 1, 1,
-0.1083544, 0.7263818, 0.9145661, 1, 1, 1, 1, 1,
-0.1038015, 1.728476, 0.2954977, 1, 1, 1, 1, 1,
-0.1033783, 1.35929, 0.1313145, 1, 1, 1, 1, 1,
-0.1029867, -0.7650951, -2.843759, 1, 1, 1, 1, 1,
-0.09770508, -0.2903522, -2.244548, 1, 1, 1, 1, 1,
-0.08941241, -1.346929, -4.259252, 1, 1, 1, 1, 1,
-0.08791437, -0.9984971, -4.647266, 0, 0, 1, 1, 1,
-0.08036419, 0.2682914, -0.8081686, 1, 0, 0, 1, 1,
-0.07799761, 0.5965462, 0.2413229, 1, 0, 0, 1, 1,
-0.07705937, 2.419366, -0.9452299, 1, 0, 0, 1, 1,
-0.07700872, 1.308087, -0.1794568, 1, 0, 0, 1, 1,
-0.07622843, 1.210636, 0.9561405, 1, 0, 0, 1, 1,
-0.075843, -0.6773801, -2.810555, 0, 0, 0, 1, 1,
-0.07258741, 1.138245, -1.912403, 0, 0, 0, 1, 1,
-0.07017983, -1.382168, -5.94702, 0, 0, 0, 1, 1,
-0.06743864, -0.9028907, -2.63921, 0, 0, 0, 1, 1,
-0.06713047, 0.3720118, -0.2034227, 0, 0, 0, 1, 1,
-0.06221846, -1.384047, -3.428637, 0, 0, 0, 1, 1,
-0.06078102, -0.1603001, -2.534893, 0, 0, 0, 1, 1,
-0.06066118, -0.5706092, -1.642174, 1, 1, 1, 1, 1,
-0.05940789, -0.8742557, -3.649426, 1, 1, 1, 1, 1,
-0.05931116, -0.8794809, -3.817588, 1, 1, 1, 1, 1,
-0.05774503, 1.202535, -0.6496948, 1, 1, 1, 1, 1,
-0.05229166, -1.28257, -1.010709, 1, 1, 1, 1, 1,
-0.0509146, 0.817695, 0.1945011, 1, 1, 1, 1, 1,
-0.05065379, -0.8914863, -1.049228, 1, 1, 1, 1, 1,
-0.04776343, 2.077793, 0.2178258, 1, 1, 1, 1, 1,
-0.04715433, 0.2679347, 0.6169585, 1, 1, 1, 1, 1,
-0.04298746, -0.1145574, -3.171488, 1, 1, 1, 1, 1,
-0.0424379, -1.833609, -3.993487, 1, 1, 1, 1, 1,
-0.0400956, 0.8367301, 0.2898924, 1, 1, 1, 1, 1,
-0.03611106, -0.1075842, -1.801934, 1, 1, 1, 1, 1,
-0.03443784, 0.225312, -1.119099, 1, 1, 1, 1, 1,
-0.03438278, -2.016889, -2.513711, 1, 1, 1, 1, 1,
-0.03305413, 1.105736, -0.7164748, 0, 0, 1, 1, 1,
-0.02957365, 0.2772818, 0.1939417, 1, 0, 0, 1, 1,
-0.02928814, 0.5175626, 1.085995, 1, 0, 0, 1, 1,
-0.02050488, 0.3745235, 1.545063, 1, 0, 0, 1, 1,
-0.01956468, -1.087961, -3.122236, 1, 0, 0, 1, 1,
-0.01248491, 2.318136, 0.5914719, 1, 0, 0, 1, 1,
-0.0101905, -2.371701, -3.357869, 0, 0, 0, 1, 1,
-0.01012865, -1.198376, -3.297553, 0, 0, 0, 1, 1,
0.0006739186, -1.121345, 3.151492, 0, 0, 0, 1, 1,
0.001576139, -0.6315098, 2.71781, 0, 0, 0, 1, 1,
0.002002403, -0.3882883, 2.79757, 0, 0, 0, 1, 1,
0.004424963, -0.2660247, 1.851451, 0, 0, 0, 1, 1,
0.01404303, -0.8727155, 3.025672, 0, 0, 0, 1, 1,
0.01889366, 0.08058567, 0.1990213, 1, 1, 1, 1, 1,
0.02304803, -0.1081113, 4.767158, 1, 1, 1, 1, 1,
0.02340238, 0.09485171, -0.856144, 1, 1, 1, 1, 1,
0.02789066, 0.01284785, -0.105755, 1, 1, 1, 1, 1,
0.02828587, -0.1439721, 1.756683, 1, 1, 1, 1, 1,
0.02886266, 0.01366173, 2.254345, 1, 1, 1, 1, 1,
0.0289558, -0.2432837, 3.009731, 1, 1, 1, 1, 1,
0.03106815, 0.6558359, -0.2585007, 1, 1, 1, 1, 1,
0.03603271, 0.02873364, 0.6773591, 1, 1, 1, 1, 1,
0.04010656, -0.08447217, 4.739124, 1, 1, 1, 1, 1,
0.04518018, 0.2121598, -2.390586, 1, 1, 1, 1, 1,
0.04591289, -1.353284, 3.37428, 1, 1, 1, 1, 1,
0.04961171, -0.9234242, 3.979515, 1, 1, 1, 1, 1,
0.05302045, 0.2415502, -0.4917086, 1, 1, 1, 1, 1,
0.05417805, -0.2276834, 3.952561, 1, 1, 1, 1, 1,
0.05515722, -0.2690023, 3.291677, 0, 0, 1, 1, 1,
0.06035476, -1.63063, 4.961222, 1, 0, 0, 1, 1,
0.06134492, -0.06571309, 3.508258, 1, 0, 0, 1, 1,
0.06367712, 1.511696, 0.6366305, 1, 0, 0, 1, 1,
0.06627097, 1.092916, -1.71409, 1, 0, 0, 1, 1,
0.06716333, -0.2927184, 2.355674, 1, 0, 0, 1, 1,
0.06718116, -0.66707, 2.316544, 0, 0, 0, 1, 1,
0.06823631, -0.213661, 1.561531, 0, 0, 0, 1, 1,
0.07219587, 0.456889, 0.5495287, 0, 0, 0, 1, 1,
0.07918534, 0.3171665, -1.10113, 0, 0, 0, 1, 1,
0.07988083, 1.225432, -0.7307819, 0, 0, 0, 1, 1,
0.08187862, -0.285985, 1.425654, 0, 0, 0, 1, 1,
0.0838448, -0.1163953, 0.5608061, 0, 0, 0, 1, 1,
0.08464139, 1.647679, -0.1579852, 1, 1, 1, 1, 1,
0.08632872, -1.003845, 3.09637, 1, 1, 1, 1, 1,
0.08729964, -1.23236, 1.308947, 1, 1, 1, 1, 1,
0.09015101, -1.04829, 2.896268, 1, 1, 1, 1, 1,
0.09100244, -0.4826974, 4.390278, 1, 1, 1, 1, 1,
0.09370362, 0.2721922, 0.8112492, 1, 1, 1, 1, 1,
0.09548435, -0.6660967, 4.229076, 1, 1, 1, 1, 1,
0.09864805, -0.002451942, 1.221776, 1, 1, 1, 1, 1,
0.1032809, -2.251567, 3.938644, 1, 1, 1, 1, 1,
0.1039607, 0.8062875, 0.07561191, 1, 1, 1, 1, 1,
0.1073845, 2.190217, -0.3911961, 1, 1, 1, 1, 1,
0.109294, 2.080456, 0.81322, 1, 1, 1, 1, 1,
0.1109108, -0.3054968, 2.290121, 1, 1, 1, 1, 1,
0.1118578, -0.7960052, 2.628669, 1, 1, 1, 1, 1,
0.1153757, -2.390321, 2.573035, 1, 1, 1, 1, 1,
0.1157146, -1.036139, 4.329734, 0, 0, 1, 1, 1,
0.1165577, -0.3783169, 4.020118, 1, 0, 0, 1, 1,
0.1206587, -0.6426461, 4.144788, 1, 0, 0, 1, 1,
0.123051, -0.0508671, 1.75452, 1, 0, 0, 1, 1,
0.1241214, -0.1361611, 2.657458, 1, 0, 0, 1, 1,
0.1313997, -1.142225, 3.357208, 1, 0, 0, 1, 1,
0.1315343, 0.7570027, 0.8039423, 0, 0, 0, 1, 1,
0.1355109, -0.2198224, 2.899181, 0, 0, 0, 1, 1,
0.1383675, 1.241844, -0.3052184, 0, 0, 0, 1, 1,
0.1397295, 1.514102, -0.1365666, 0, 0, 0, 1, 1,
0.1405432, 1.011483, 1.131888, 0, 0, 0, 1, 1,
0.1409883, 0.6428562, -0.7537516, 0, 0, 0, 1, 1,
0.1414155, 0.5133455, -0.3761474, 0, 0, 0, 1, 1,
0.1430702, -0.4939836, 3.910995, 1, 1, 1, 1, 1,
0.1476814, 0.03262318, 1.648941, 1, 1, 1, 1, 1,
0.1494556, -1.017735, 3.842199, 1, 1, 1, 1, 1,
0.158653, 0.3498393, -0.3965768, 1, 1, 1, 1, 1,
0.1591813, 1.100183, 0.2586053, 1, 1, 1, 1, 1,
0.160807, -1.906205, 2.161387, 1, 1, 1, 1, 1,
0.1703538, -0.6774932, 4.111318, 1, 1, 1, 1, 1,
0.1707031, -0.6298178, 1.643154, 1, 1, 1, 1, 1,
0.1767523, -0.8916907, 1.639373, 1, 1, 1, 1, 1,
0.1783428, 0.9228444, 1.866303, 1, 1, 1, 1, 1,
0.1783802, -0.1051245, 0.8660436, 1, 1, 1, 1, 1,
0.1786144, 0.2927117, 1.294951, 1, 1, 1, 1, 1,
0.1847317, 0.7273481, -1.170559, 1, 1, 1, 1, 1,
0.1867461, -0.6733893, 2.800527, 1, 1, 1, 1, 1,
0.1987014, -1.809892, 2.50845, 1, 1, 1, 1, 1,
0.200244, -0.6617485, 3.345258, 0, 0, 1, 1, 1,
0.2014182, -0.9494283, 2.171979, 1, 0, 0, 1, 1,
0.2032255, -0.05597583, 1.175152, 1, 0, 0, 1, 1,
0.2099041, 1.28044, -0.3240029, 1, 0, 0, 1, 1,
0.2162952, -0.5395676, 1.483022, 1, 0, 0, 1, 1,
0.2166949, -1.170915, 2.746482, 1, 0, 0, 1, 1,
0.2172378, -2.646945, 4.738616, 0, 0, 0, 1, 1,
0.2184083, -0.3930791, 2.202931, 0, 0, 0, 1, 1,
0.2185577, -0.4047628, 3.389095, 0, 0, 0, 1, 1,
0.2188898, 1.42897, -0.8837612, 0, 0, 0, 1, 1,
0.2194762, 0.4608636, 1.207928, 0, 0, 0, 1, 1,
0.2204194, -1.792292, 2.752267, 0, 0, 0, 1, 1,
0.2204638, -0.6703725, 2.755107, 0, 0, 0, 1, 1,
0.2213727, -1.858294, 4.66828, 1, 1, 1, 1, 1,
0.2226902, 0.4039946, 1.227765, 1, 1, 1, 1, 1,
0.2230488, 1.212664, -0.1465563, 1, 1, 1, 1, 1,
0.2247449, 0.5364589, 0.8535453, 1, 1, 1, 1, 1,
0.2257652, 1.130441, -0.9577088, 1, 1, 1, 1, 1,
0.2325468, -0.7149752, 2.490287, 1, 1, 1, 1, 1,
0.233689, 0.7159747, 1.819903, 1, 1, 1, 1, 1,
0.2406052, 0.6793727, 1.290053, 1, 1, 1, 1, 1,
0.2435841, -0.3391693, 3.485376, 1, 1, 1, 1, 1,
0.2460776, 1.479439, -1.05447, 1, 1, 1, 1, 1,
0.246087, -1.533266, 3.443538, 1, 1, 1, 1, 1,
0.2477642, -0.2331732, 2.739949, 1, 1, 1, 1, 1,
0.2565521, 0.9746962, 0.1759379, 1, 1, 1, 1, 1,
0.2605736, 0.9213516, 1.539514, 1, 1, 1, 1, 1,
0.261407, 1.253728, 0.9267907, 1, 1, 1, 1, 1,
0.2622961, -0.6668987, 1.576022, 0, 0, 1, 1, 1,
0.2633217, 0.3170802, 0.522942, 1, 0, 0, 1, 1,
0.2642899, -0.2250528, 2.437257, 1, 0, 0, 1, 1,
0.2646393, 2.732789, -0.7825198, 1, 0, 0, 1, 1,
0.2662648, -0.7108998, 2.69576, 1, 0, 0, 1, 1,
0.2685276, -1.079859, 4.538556, 1, 0, 0, 1, 1,
0.2711575, 0.1853026, 1.88485, 0, 0, 0, 1, 1,
0.2712765, -0.5792461, 0.6963916, 0, 0, 0, 1, 1,
0.2763494, 1.282281, -1.534235, 0, 0, 0, 1, 1,
0.2768182, -0.4105279, 0.6626334, 0, 0, 0, 1, 1,
0.2785024, 0.7573881, 0.4801993, 0, 0, 0, 1, 1,
0.2786835, 0.1481119, 0.8044744, 0, 0, 0, 1, 1,
0.281479, 0.1408474, 1.381097, 0, 0, 0, 1, 1,
0.2830296, -0.1470697, 1.547789, 1, 1, 1, 1, 1,
0.2889731, -0.3903218, 1.860228, 1, 1, 1, 1, 1,
0.2919755, -0.8274363, 1.982175, 1, 1, 1, 1, 1,
0.2939861, 0.3427132, 1.169294, 1, 1, 1, 1, 1,
0.2939877, -0.3641917, 3.412299, 1, 1, 1, 1, 1,
0.2961446, 0.4993822, 0.5106062, 1, 1, 1, 1, 1,
0.2975874, -0.9117842, 2.949189, 1, 1, 1, 1, 1,
0.2981283, 0.583649, 0.8851589, 1, 1, 1, 1, 1,
0.2988775, 0.564786, 1.149345, 1, 1, 1, 1, 1,
0.3014413, 2.041342, 1.277959, 1, 1, 1, 1, 1,
0.3048905, 2.523173, -0.1732643, 1, 1, 1, 1, 1,
0.3060353, 0.05270997, 1.190617, 1, 1, 1, 1, 1,
0.3076992, -0.3400214, 1.554096, 1, 1, 1, 1, 1,
0.3102655, -1.123295, 1.586065, 1, 1, 1, 1, 1,
0.3104087, -0.004834649, 1.73225, 1, 1, 1, 1, 1,
0.3118125, -1.471986, 2.61498, 0, 0, 1, 1, 1,
0.3146014, 2.131589, -0.7135072, 1, 0, 0, 1, 1,
0.3246403, -0.05578391, 1.669804, 1, 0, 0, 1, 1,
0.3263665, 0.5678865, 1.023704, 1, 0, 0, 1, 1,
0.3305154, 0.5191452, 0.03026466, 1, 0, 0, 1, 1,
0.3338996, 0.8358163, 0.3404242, 1, 0, 0, 1, 1,
0.3349276, -0.7029499, 3.388057, 0, 0, 0, 1, 1,
0.3350872, 1.520279, -1.076306, 0, 0, 0, 1, 1,
0.3373226, 1.053026, -0.4391522, 0, 0, 0, 1, 1,
0.339038, -0.2305879, 0.9919351, 0, 0, 0, 1, 1,
0.3397931, -0.07607737, 2.002278, 0, 0, 0, 1, 1,
0.3428375, -1.781839, 4.034411, 0, 0, 0, 1, 1,
0.3432416, -1.565962, 3.95682, 0, 0, 0, 1, 1,
0.3441339, 1.646708, 1.739182, 1, 1, 1, 1, 1,
0.3444065, 0.5374172, 1.04979, 1, 1, 1, 1, 1,
0.3464686, 1.46731, 0.1647469, 1, 1, 1, 1, 1,
0.3497528, 0.9894464, 2.136551, 1, 1, 1, 1, 1,
0.3507035, 0.5569521, 2.060488, 1, 1, 1, 1, 1,
0.3524866, 1.018036, 1.71568, 1, 1, 1, 1, 1,
0.355145, 0.240879, 0.6109375, 1, 1, 1, 1, 1,
0.3575667, 1.241801, -0.7199473, 1, 1, 1, 1, 1,
0.3602162, 1.440287, 2.05737, 1, 1, 1, 1, 1,
0.360391, -1.148886, 2.461474, 1, 1, 1, 1, 1,
0.3605691, -0.8635625, 2.210634, 1, 1, 1, 1, 1,
0.361496, 0.427417, 1.163923, 1, 1, 1, 1, 1,
0.362161, 0.7328677, 0.4093512, 1, 1, 1, 1, 1,
0.3646581, 1.306784, -0.01066071, 1, 1, 1, 1, 1,
0.3675551, 0.02930481, 2.668784, 1, 1, 1, 1, 1,
0.3677821, -1.077343, 2.834277, 0, 0, 1, 1, 1,
0.3688968, 0.4757089, 1.704817, 1, 0, 0, 1, 1,
0.3721064, -1.168861, 0.637108, 1, 0, 0, 1, 1,
0.3721851, 0.3238426, 1.520499, 1, 0, 0, 1, 1,
0.3721896, -0.4052216, 2.83179, 1, 0, 0, 1, 1,
0.3724521, -0.0002808796, 1.067188, 1, 0, 0, 1, 1,
0.372706, 1.465288, 0.1205184, 0, 0, 0, 1, 1,
0.3741254, 0.8449342, 0.4748355, 0, 0, 0, 1, 1,
0.385157, 1.267094, 0.6526907, 0, 0, 0, 1, 1,
0.3880929, 0.09534647, 1.145706, 0, 0, 0, 1, 1,
0.3901111, 0.5285941, -1.433731, 0, 0, 0, 1, 1,
0.3933358, 1.230322, 1.232345, 0, 0, 0, 1, 1,
0.3949983, -0.6565938, 2.785971, 0, 0, 0, 1, 1,
0.3953718, 0.7833312, 0.5291154, 1, 1, 1, 1, 1,
0.3999168, 1.050578, -0.3117553, 1, 1, 1, 1, 1,
0.4015929, -1.627631, 2.598739, 1, 1, 1, 1, 1,
0.401605, 0.7396351, -0.2515173, 1, 1, 1, 1, 1,
0.4063425, 0.3705531, 1.745204, 1, 1, 1, 1, 1,
0.4107972, 0.922115, -1.052952, 1, 1, 1, 1, 1,
0.413554, 2.295751, 0.3506165, 1, 1, 1, 1, 1,
0.4180248, 0.314119, 0.9697648, 1, 1, 1, 1, 1,
0.4209497, 0.9950604, 2.550023, 1, 1, 1, 1, 1,
0.4211393, -0.2382804, 1.329366, 1, 1, 1, 1, 1,
0.4223717, -0.08503229, 2.779476, 1, 1, 1, 1, 1,
0.4274838, 0.8461039, 1.21267, 1, 1, 1, 1, 1,
0.4297248, 1.312492, 1.131304, 1, 1, 1, 1, 1,
0.4398894, -0.07068189, 2.44769, 1, 1, 1, 1, 1,
0.4430513, -0.6928843, 3.617918, 1, 1, 1, 1, 1,
0.4484034, -2.889317, 1.441749, 0, 0, 1, 1, 1,
0.4521264, -1.752447, 1.493547, 1, 0, 0, 1, 1,
0.4581445, 0.2291067, 1.808408, 1, 0, 0, 1, 1,
0.4593593, 0.6244842, 0.6256099, 1, 0, 0, 1, 1,
0.4628913, -0.05595999, 0.5363671, 1, 0, 0, 1, 1,
0.4634689, -0.1035837, 0.6527146, 1, 0, 0, 1, 1,
0.4640874, 0.4315636, 0.5956972, 0, 0, 0, 1, 1,
0.4680951, -0.2938423, 3.180352, 0, 0, 0, 1, 1,
0.4684464, -0.9430157, 2.773949, 0, 0, 0, 1, 1,
0.4731318, -2.303466, 3.533008, 0, 0, 0, 1, 1,
0.4797424, -0.7060323, 5.151183, 0, 0, 0, 1, 1,
0.481725, -0.4844591, 3.137187, 0, 0, 0, 1, 1,
0.4838966, 2.034049, 0.8225133, 0, 0, 0, 1, 1,
0.4887414, 0.4671168, 3.254035, 1, 1, 1, 1, 1,
0.4897391, -1.175365, 1.841018, 1, 1, 1, 1, 1,
0.4905085, -0.6674173, 1.597388, 1, 1, 1, 1, 1,
0.4912927, 1.207686, 0.8691176, 1, 1, 1, 1, 1,
0.4945803, 0.2550435, 0.940734, 1, 1, 1, 1, 1,
0.4995109, 1.750264, 0.3333622, 1, 1, 1, 1, 1,
0.5036777, -0.8679954, 2.061717, 1, 1, 1, 1, 1,
0.5042102, -1.5097, 4.271173, 1, 1, 1, 1, 1,
0.5100636, 0.2980859, 2.150975, 1, 1, 1, 1, 1,
0.5102892, 0.9296063, 2.191921, 1, 1, 1, 1, 1,
0.5120775, 0.7913439, 1.507593, 1, 1, 1, 1, 1,
0.5127237, -0.07081264, 1.577968, 1, 1, 1, 1, 1,
0.5146652, 0.4431877, 1.186268, 1, 1, 1, 1, 1,
0.518397, 0.3468691, 0.3773259, 1, 1, 1, 1, 1,
0.520515, 0.05853355, 1.192013, 1, 1, 1, 1, 1,
0.5211418, -0.6526856, 2.042491, 0, 0, 1, 1, 1,
0.5254727, -1.133806, 1.800277, 1, 0, 0, 1, 1,
0.526275, -1.02121, 3.946416, 1, 0, 0, 1, 1,
0.5278725, 0.4587497, -1.254825, 1, 0, 0, 1, 1,
0.5288246, -1.140131, 2.276095, 1, 0, 0, 1, 1,
0.5296707, 1.656239, 1.130491, 1, 0, 0, 1, 1,
0.5358367, 0.9605039, 0.2978898, 0, 0, 0, 1, 1,
0.5619094, 0.1917189, 2.027005, 0, 0, 0, 1, 1,
0.5696192, -0.914259, 2.357359, 0, 0, 0, 1, 1,
0.5773662, 1.279791, -0.2524371, 0, 0, 0, 1, 1,
0.582698, 1.005964, 1.554773, 0, 0, 0, 1, 1,
0.5830519, 1.995561, -0.3215297, 0, 0, 0, 1, 1,
0.5863195, -0.3693673, 1.934677, 0, 0, 0, 1, 1,
0.5993407, 0.2625163, 2.032718, 1, 1, 1, 1, 1,
0.6005364, 0.5322638, 0.2225702, 1, 1, 1, 1, 1,
0.6030863, 0.3090965, 1.337487, 1, 1, 1, 1, 1,
0.6033078, -1.474419, 0.7561351, 1, 1, 1, 1, 1,
0.6182231, 0.5826392, 0.9609051, 1, 1, 1, 1, 1,
0.6190184, -1.453343, 3.830698, 1, 1, 1, 1, 1,
0.6219353, -0.725627, 3.524564, 1, 1, 1, 1, 1,
0.6225864, 1.537443, 0.8777137, 1, 1, 1, 1, 1,
0.6348326, 0.5514445, -0.06959995, 1, 1, 1, 1, 1,
0.645039, 0.7095247, 0.9553082, 1, 1, 1, 1, 1,
0.6463949, -1.105446, 2.810508, 1, 1, 1, 1, 1,
0.6562052, 0.5345074, 1.841822, 1, 1, 1, 1, 1,
0.659364, -1.182369, 4.456864, 1, 1, 1, 1, 1,
0.6743548, 1.675597, -0.1234136, 1, 1, 1, 1, 1,
0.6766656, -0.286289, 3.02588, 1, 1, 1, 1, 1,
0.6793043, -0.2679427, 1.553394, 0, 0, 1, 1, 1,
0.6812499, 0.5424716, 0.7206749, 1, 0, 0, 1, 1,
0.6853593, -0.9931279, 2.647844, 1, 0, 0, 1, 1,
0.6914443, -0.3898688, 2.86829, 1, 0, 0, 1, 1,
0.6933854, -1.226214, 2.251304, 1, 0, 0, 1, 1,
0.7011654, -1.759754, 3.074892, 1, 0, 0, 1, 1,
0.7037125, 1.803635, 1.189087, 0, 0, 0, 1, 1,
0.7069747, -0.1277439, 2.049218, 0, 0, 0, 1, 1,
0.7093103, 0.1102882, 1.262419, 0, 0, 0, 1, 1,
0.7191243, 1.189265, 1.166684, 0, 0, 0, 1, 1,
0.7200064, -1.804538, 1.893095, 0, 0, 0, 1, 1,
0.7208982, 0.8688083, -0.07178684, 0, 0, 0, 1, 1,
0.721925, 1.422408, -0.6287677, 0, 0, 0, 1, 1,
0.7222437, -1.777353, 1.533003, 1, 1, 1, 1, 1,
0.727136, -0.8231108, 2.311768, 1, 1, 1, 1, 1,
0.7363384, 0.09851322, 1.522333, 1, 1, 1, 1, 1,
0.7402388, -2.572866, 0.923435, 1, 1, 1, 1, 1,
0.7416654, 0.6803684, 2.443333, 1, 1, 1, 1, 1,
0.7430739, 1.416991, -0.8463271, 1, 1, 1, 1, 1,
0.7444486, 1.170254, 1.031521, 1, 1, 1, 1, 1,
0.7451582, 0.9238841, 1.527024, 1, 1, 1, 1, 1,
0.7484244, -1.006066, 2.698941, 1, 1, 1, 1, 1,
0.7511958, -0.3883822, 0.4511879, 1, 1, 1, 1, 1,
0.7527256, -0.7255225, 1.814209, 1, 1, 1, 1, 1,
0.7543058, 1.703308, 1.215302, 1, 1, 1, 1, 1,
0.7582986, -0.9553846, 1.626342, 1, 1, 1, 1, 1,
0.7645442, -0.09210792, 1.485035, 1, 1, 1, 1, 1,
0.7678735, -0.1147541, -0.2590417, 1, 1, 1, 1, 1,
0.7729831, -0.333964, 2.456675, 0, 0, 1, 1, 1,
0.7788426, 1.202461, 1.014968, 1, 0, 0, 1, 1,
0.7808963, 0.6237925, 0.7515631, 1, 0, 0, 1, 1,
0.7814613, 0.08589094, 1.381548, 1, 0, 0, 1, 1,
0.7887712, -1.124892, 1.830734, 1, 0, 0, 1, 1,
0.7923104, 0.9006172, 0.5639126, 1, 0, 0, 1, 1,
0.7923568, 1.198085, -0.05161791, 0, 0, 0, 1, 1,
0.7958506, -1.418786, 0.8393185, 0, 0, 0, 1, 1,
0.7973605, -0.1675062, 3.674522, 0, 0, 0, 1, 1,
0.7974706, 1.316816, 1.807056, 0, 0, 0, 1, 1,
0.7992725, -0.5971239, 0.9802407, 0, 0, 0, 1, 1,
0.8006539, 1.760995, -0.3469705, 0, 0, 0, 1, 1,
0.8030444, -0.1790841, 1.150622, 0, 0, 0, 1, 1,
0.8032527, 2.045145, 0.4817437, 1, 1, 1, 1, 1,
0.8077708, 0.2787636, 2.292478, 1, 1, 1, 1, 1,
0.8087521, -1.805918, 3.438241, 1, 1, 1, 1, 1,
0.8149357, -1.246895, 1.468037, 1, 1, 1, 1, 1,
0.817975, 0.4074874, 0.9482562, 1, 1, 1, 1, 1,
0.8219094, -2.107684, 1.95714, 1, 1, 1, 1, 1,
0.8263831, 0.1119082, 1.570937, 1, 1, 1, 1, 1,
0.8265589, -0.0569188, 0.7580986, 1, 1, 1, 1, 1,
0.83536, 1.40783, 0.6625463, 1, 1, 1, 1, 1,
0.8404395, 3.508269, -0.4697646, 1, 1, 1, 1, 1,
0.8433865, -1.957954, 1.959615, 1, 1, 1, 1, 1,
0.8458849, 1.500221, 2.615172, 1, 1, 1, 1, 1,
0.8478228, 1.137394, 0.1234238, 1, 1, 1, 1, 1,
0.8488016, -0.5157625, 2.096587, 1, 1, 1, 1, 1,
0.8501954, -0.200987, 1.904931, 1, 1, 1, 1, 1,
0.850965, -0.259779, 3.904366, 0, 0, 1, 1, 1,
0.8669999, 0.213108, 3.767072, 1, 0, 0, 1, 1,
0.8772715, 0.2850464, 0.6318437, 1, 0, 0, 1, 1,
0.8774842, -0.05902905, 0.8001661, 1, 0, 0, 1, 1,
0.880953, 0.6396756, -1.326352, 1, 0, 0, 1, 1,
0.8810152, 0.6850713, 1.957653, 1, 0, 0, 1, 1,
0.8872695, -0.5626482, 2.710891, 0, 0, 0, 1, 1,
0.8901169, 0.8207756, -0.1574702, 0, 0, 0, 1, 1,
0.8913189, -0.107937, 2.148848, 0, 0, 0, 1, 1,
0.8952072, 1.749951, -1.29044, 0, 0, 0, 1, 1,
0.8964957, -0.002925378, 0.05834411, 0, 0, 0, 1, 1,
0.8987084, 1.185247, -0.4180024, 0, 0, 0, 1, 1,
0.9009264, -1.03405, 3.321517, 0, 0, 0, 1, 1,
0.9065549, -1.566339, 5.169968, 1, 1, 1, 1, 1,
0.907936, -1.439492, 2.872633, 1, 1, 1, 1, 1,
0.9102712, -0.2864297, 2.274385, 1, 1, 1, 1, 1,
0.9106998, 0.8069563, 0.6202335, 1, 1, 1, 1, 1,
0.9149047, 0.4905412, 1.353058, 1, 1, 1, 1, 1,
0.9157971, 1.144486, 0.6134555, 1, 1, 1, 1, 1,
0.9184199, -0.03485, 2.572042, 1, 1, 1, 1, 1,
0.9196771, 0.7886539, 0.06974612, 1, 1, 1, 1, 1,
0.9207546, 1.187781, 0.5096778, 1, 1, 1, 1, 1,
0.9217646, -1.010136, 2.313631, 1, 1, 1, 1, 1,
0.9229921, -0.5249605, 2.574263, 1, 1, 1, 1, 1,
0.9244146, -0.2247343, 1.830856, 1, 1, 1, 1, 1,
0.9275259, -1.680227, 1.978996, 1, 1, 1, 1, 1,
0.9280723, -0.09668421, 0.875277, 1, 1, 1, 1, 1,
0.9308215, -2.492769, 2.1262, 1, 1, 1, 1, 1,
0.9326277, -0.2214236, 2.373577, 0, 0, 1, 1, 1,
0.9437453, 0.5059105, -0.7033315, 1, 0, 0, 1, 1,
0.9483923, 1.118146, -1.351575, 1, 0, 0, 1, 1,
0.9567518, -0.219836, 0.7361856, 1, 0, 0, 1, 1,
0.9621888, -2.325998, 1.861804, 1, 0, 0, 1, 1,
0.9630706, -2.094858, 2.863108, 1, 0, 0, 1, 1,
0.9674555, -2.075986, 2.837566, 0, 0, 0, 1, 1,
0.9713206, 0.04594788, 2.697018, 0, 0, 0, 1, 1,
0.9723658, 0.04975495, 0.8164622, 0, 0, 0, 1, 1,
0.9726036, 0.6057523, 1.048822, 0, 0, 0, 1, 1,
0.9741085, -0.5885376, 2.178644, 0, 0, 0, 1, 1,
0.978623, -0.1113996, 1.761222, 0, 0, 0, 1, 1,
0.9805834, -0.8269968, 1.877274, 0, 0, 0, 1, 1,
0.9817659, 0.6374345, 1.919608, 1, 1, 1, 1, 1,
0.9851161, 1.91894, 0.6520088, 1, 1, 1, 1, 1,
0.9878218, 1.01461, 1.976256, 1, 1, 1, 1, 1,
0.9893609, 3.113347, -0.6552864, 1, 1, 1, 1, 1,
0.9912408, -0.3570547, 0.5820029, 1, 1, 1, 1, 1,
0.9930891, -1.751169, 2.116005, 1, 1, 1, 1, 1,
0.9938675, -0.1070775, 0.6205158, 1, 1, 1, 1, 1,
0.996474, 0.01010477, 3.077534, 1, 1, 1, 1, 1,
0.9998459, -1.295024, 1.68543, 1, 1, 1, 1, 1,
1.008687, -1.999246, -0.05572655, 1, 1, 1, 1, 1,
1.014548, -1.229914, 1.260067, 1, 1, 1, 1, 1,
1.016975, 0.2980206, 1.95312, 1, 1, 1, 1, 1,
1.019723, 0.5285494, -0.2889395, 1, 1, 1, 1, 1,
1.021483, 0.3780686, 2.115152, 1, 1, 1, 1, 1,
1.025263, 1.220805, 0.0807068, 1, 1, 1, 1, 1,
1.026416, 1.075126, 2.900521, 0, 0, 1, 1, 1,
1.028409, 1.683112, 1.440945, 1, 0, 0, 1, 1,
1.035917, 0.9220349, -1.412475, 1, 0, 0, 1, 1,
1.038865, 0.8210817, 0.1950068, 1, 0, 0, 1, 1,
1.041135, 0.2694252, 1.860264, 1, 0, 0, 1, 1,
1.0421, 1.31904, 1.989014, 1, 0, 0, 1, 1,
1.046421, 0.04518796, 1.190388, 0, 0, 0, 1, 1,
1.0551, -0.8235101, 2.093237, 0, 0, 0, 1, 1,
1.05855, -0.5193996, 1.985607, 0, 0, 0, 1, 1,
1.063465, 1.232533, 1.642736, 0, 0, 0, 1, 1,
1.065084, 1.744604, 0.9799135, 0, 0, 0, 1, 1,
1.065174, 0.01777214, 0.7342693, 0, 0, 0, 1, 1,
1.070665, -0.1347626, 2.743089, 0, 0, 0, 1, 1,
1.076724, 0.4930204, -0.8226591, 1, 1, 1, 1, 1,
1.082191, 0.009792282, 2.636415, 1, 1, 1, 1, 1,
1.082338, 0.5578063, 1.624172, 1, 1, 1, 1, 1,
1.085422, -1.116966, 2.295458, 1, 1, 1, 1, 1,
1.087334, -0.0582651, 2.071598, 1, 1, 1, 1, 1,
1.089243, -0.453917, 2.406732, 1, 1, 1, 1, 1,
1.097881, 0.1636447, 0.6730238, 1, 1, 1, 1, 1,
1.098763, -0.04992708, 1.928539, 1, 1, 1, 1, 1,
1.105543, 0.9096593, 0.4171497, 1, 1, 1, 1, 1,
1.106082, -0.1959237, 1.99157, 1, 1, 1, 1, 1,
1.110833, -2.082493, 3.102848, 1, 1, 1, 1, 1,
1.114619, -0.3142936, 1.645831, 1, 1, 1, 1, 1,
1.115077, 0.4428122, -0.3651172, 1, 1, 1, 1, 1,
1.116058, 0.2502523, -0.7058122, 1, 1, 1, 1, 1,
1.127438, 1.819421, 1.455439, 1, 1, 1, 1, 1,
1.135946, 1.289383, 2.586911, 0, 0, 1, 1, 1,
1.139015, 0.1827479, 2.757658, 1, 0, 0, 1, 1,
1.140027, 0.9162006, -0.1826044, 1, 0, 0, 1, 1,
1.142362, -1.223871, 0.5571853, 1, 0, 0, 1, 1,
1.14546, 1.085734, -1.610415, 1, 0, 0, 1, 1,
1.152408, 0.02085474, 0.09566324, 1, 0, 0, 1, 1,
1.164182, 1.120694, 0.1941586, 0, 0, 0, 1, 1,
1.170945, -0.5371006, 1.678276, 0, 0, 0, 1, 1,
1.18201, -1.145194, 2.719625, 0, 0, 0, 1, 1,
1.194153, 1.109798, 2.338413, 0, 0, 0, 1, 1,
1.197733, -0.2617345, 3.236307, 0, 0, 0, 1, 1,
1.199407, -0.109235, 1.644871, 0, 0, 0, 1, 1,
1.202644, -0.4627341, 1.390867, 0, 0, 0, 1, 1,
1.20335, 1.775628, 1.349992, 1, 1, 1, 1, 1,
1.209294, -0.04923725, 1.157915, 1, 1, 1, 1, 1,
1.215302, 1.365442, -0.04423122, 1, 1, 1, 1, 1,
1.215372, 1.185553, 1.4924, 1, 1, 1, 1, 1,
1.225924, 1.572598, 0.9948558, 1, 1, 1, 1, 1,
1.232134, 0.9255453, 1.143896, 1, 1, 1, 1, 1,
1.237311, 1.363744, 0.132568, 1, 1, 1, 1, 1,
1.240322, -1.528336, 1.821144, 1, 1, 1, 1, 1,
1.240862, -0.05777381, 1.090515, 1, 1, 1, 1, 1,
1.241632, 0.7599691, -0.1316166, 1, 1, 1, 1, 1,
1.243204, -0.06978352, 2.420943, 1, 1, 1, 1, 1,
1.250877, -0.142943, 2.931567, 1, 1, 1, 1, 1,
1.254641, 0.8766157, 0.8900757, 1, 1, 1, 1, 1,
1.258574, 0.8367205, 2.452535, 1, 1, 1, 1, 1,
1.259457, -1.515919, 2.249669, 1, 1, 1, 1, 1,
1.263601, -1.205056, 1.636696, 0, 0, 1, 1, 1,
1.273008, 0.04065188, 2.397994, 1, 0, 0, 1, 1,
1.279113, 1.542732, 2.002913, 1, 0, 0, 1, 1,
1.283496, 0.7878679, 1.530883, 1, 0, 0, 1, 1,
1.286702, 1.104065, 0.7301006, 1, 0, 0, 1, 1,
1.289493, 0.2554584, 2.37332, 1, 0, 0, 1, 1,
1.295534, -1.69425, 4.470693, 0, 0, 0, 1, 1,
1.298059, 0.6573755, 0.7588907, 0, 0, 0, 1, 1,
1.311429, -0.3259494, 0.05577409, 0, 0, 0, 1, 1,
1.314728, -0.6226413, 2.901409, 0, 0, 0, 1, 1,
1.317418, -1.367139, 4.130322, 0, 0, 0, 1, 1,
1.3183, 1.133838, 2.603791, 0, 0, 0, 1, 1,
1.321402, 0.001666126, -0.4699926, 0, 0, 0, 1, 1,
1.338597, 2.482879, 2.04782, 1, 1, 1, 1, 1,
1.341258, 0.6885064, -0.4866379, 1, 1, 1, 1, 1,
1.348016, 0.3348444, 2.276405, 1, 1, 1, 1, 1,
1.364778, -1.064306, 0.9870431, 1, 1, 1, 1, 1,
1.366393, 1.164896, 1.655345, 1, 1, 1, 1, 1,
1.385047, -0.3724894, 0.4474973, 1, 1, 1, 1, 1,
1.387126, -1.210097, 2.415169, 1, 1, 1, 1, 1,
1.388317, 0.6876906, 0.7166805, 1, 1, 1, 1, 1,
1.389711, 1.430759, 0.8515342, 1, 1, 1, 1, 1,
1.391102, -0.08035631, 1.618937, 1, 1, 1, 1, 1,
1.401724, 0.03107047, 1.580589, 1, 1, 1, 1, 1,
1.407742, -0.0328333, 1.432914, 1, 1, 1, 1, 1,
1.428929, 1.597247, 0.724753, 1, 1, 1, 1, 1,
1.432607, -0.09417944, 0.01879238, 1, 1, 1, 1, 1,
1.433258, -0.9125003, -0.6003034, 1, 1, 1, 1, 1,
1.434015, 0.09197904, 2.161589, 0, 0, 1, 1, 1,
1.437866, -0.06190364, -0.6024123, 1, 0, 0, 1, 1,
1.463858, -3.600478, 2.265535, 1, 0, 0, 1, 1,
1.467704, -0.5671251, 3.530966, 1, 0, 0, 1, 1,
1.476457, -1.132241, 1.400134, 1, 0, 0, 1, 1,
1.482498, -0.4914438, 0.06691024, 1, 0, 0, 1, 1,
1.484911, 0.5661377, 2.874068, 0, 0, 0, 1, 1,
1.488789, -1.272563, 3.095138, 0, 0, 0, 1, 1,
1.490413, -0.4478765, 0.2551757, 0, 0, 0, 1, 1,
1.5038, 0.05058141, 0.558018, 0, 0, 0, 1, 1,
1.507914, -0.6649825, 1.844768, 0, 0, 0, 1, 1,
1.510141, 0.4911862, 1.12798, 0, 0, 0, 1, 1,
1.515447, 0.959326, 3.015425, 0, 0, 0, 1, 1,
1.538317, 0.4425002, 1.127601, 1, 1, 1, 1, 1,
1.550202, -0.6133292, 0.1095495, 1, 1, 1, 1, 1,
1.556764, 0.6680115, 1.473747, 1, 1, 1, 1, 1,
1.557107, -0.9706248, 2.212663, 1, 1, 1, 1, 1,
1.572372, 1.341573, -0.2689116, 1, 1, 1, 1, 1,
1.574889, 0.7849824, 1.745744, 1, 1, 1, 1, 1,
1.57759, 1.384849, 0.8230186, 1, 1, 1, 1, 1,
1.589182, 1.518717, 0.7193119, 1, 1, 1, 1, 1,
1.596591, 1.498514, 1.034594, 1, 1, 1, 1, 1,
1.597624, -0.4226561, 3.236405, 1, 1, 1, 1, 1,
1.611817, 0.3103791, 2.45307, 1, 1, 1, 1, 1,
1.633578, 0.04265517, 0.1022316, 1, 1, 1, 1, 1,
1.638264, -0.3956945, 2.486925, 1, 1, 1, 1, 1,
1.644554, 0.2415552, -0.8852045, 1, 1, 1, 1, 1,
1.677804, 1.428746, 0.696554, 1, 1, 1, 1, 1,
1.691811, -2.428313, 2.786995, 0, 0, 1, 1, 1,
1.71498, 0.1668051, 2.546195, 1, 0, 0, 1, 1,
1.722711, 0.1682465, 2.253503, 1, 0, 0, 1, 1,
1.724671, 1.134145, -0.6197143, 1, 0, 0, 1, 1,
1.726848, -2.137448, 1.189488, 1, 0, 0, 1, 1,
1.73792, -0.3122715, 1.360625, 1, 0, 0, 1, 1,
1.750821, -0.244579, 0.8542163, 0, 0, 0, 1, 1,
1.753849, 0.3120565, 2.638402, 0, 0, 0, 1, 1,
1.759239, -0.6288736, 1.830877, 0, 0, 0, 1, 1,
1.77782, 0.1497473, 2.070333, 0, 0, 0, 1, 1,
1.780946, 0.5640724, 1.028997, 0, 0, 0, 1, 1,
1.787248, -1.630759, 1.146383, 0, 0, 0, 1, 1,
1.805099, -1.061962, 1.523421, 0, 0, 0, 1, 1,
1.814943, -0.5198947, -0.1788132, 1, 1, 1, 1, 1,
1.827484, 2.007194, 0.04426939, 1, 1, 1, 1, 1,
1.835691, -0.02556735, 0.8960509, 1, 1, 1, 1, 1,
1.842555, 0.596632, 1.561365, 1, 1, 1, 1, 1,
1.845072, 0.2335007, 0.9398078, 1, 1, 1, 1, 1,
1.858791, -0.5105658, 0.9892408, 1, 1, 1, 1, 1,
1.86224, 0.3455989, 3.406917, 1, 1, 1, 1, 1,
1.873476, -1.234952, -0.07942402, 1, 1, 1, 1, 1,
1.879769, 1.302504, 2.285672, 1, 1, 1, 1, 1,
1.884701, 0.9789655, 1.115659, 1, 1, 1, 1, 1,
1.899299, 0.4356437, 0.5448042, 1, 1, 1, 1, 1,
1.946559, 0.03915478, 1.186671, 1, 1, 1, 1, 1,
1.962252, -0.1168487, 2.103628, 1, 1, 1, 1, 1,
1.967581, 0.9415599, 1.383708, 1, 1, 1, 1, 1,
1.998979, -0.3990476, 2.439564, 1, 1, 1, 1, 1,
2.003651, 0.8754023, 1.709645, 0, 0, 1, 1, 1,
2.010282, 0.7422975, 0.5288823, 1, 0, 0, 1, 1,
2.042748, -1.429351, 0.03515125, 1, 0, 0, 1, 1,
2.046716, 0.1895276, 1.475759, 1, 0, 0, 1, 1,
2.050054, -0.05577526, 2.209907, 1, 0, 0, 1, 1,
2.059273, 0.5048019, 0.5501363, 1, 0, 0, 1, 1,
2.078603, -0.6909593, 1.582056, 0, 0, 0, 1, 1,
2.097147, -1.217859, 2.302213, 0, 0, 0, 1, 1,
2.105887, -0.5828159, 1.58686, 0, 0, 0, 1, 1,
2.131621, 1.242598, 2.709682, 0, 0, 0, 1, 1,
2.151413, -0.01674089, 0.8056694, 0, 0, 0, 1, 1,
2.22236, -0.9112061, 1.782955, 0, 0, 0, 1, 1,
2.227705, 0.5043158, 2.190389, 0, 0, 0, 1, 1,
2.248057, 0.6693185, 1.038879, 1, 1, 1, 1, 1,
2.331826, -0.9914133, 0.644136, 1, 1, 1, 1, 1,
2.377337, 0.5956817, -0.7136402, 1, 1, 1, 1, 1,
2.381732, 1.278127, 0.8566359, 1, 1, 1, 1, 1,
2.460842, -1.150027, 0.7693723, 1, 1, 1, 1, 1,
2.612564, -0.6973, 2.102916, 1, 1, 1, 1, 1,
3.485636, -0.1459075, 1.638046, 1, 1, 1, 1, 1
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
var radius = 10.21229;
var distance = 35.87022;
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
mvMatrix.translate( 0.04608107, -0.1162183, 0.4184349 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.87022);
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
