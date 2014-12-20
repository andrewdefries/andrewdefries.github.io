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
-3.566448, 1.021299, -0.9335068, 1, 0, 0, 1,
-3.267145, 0.3616187, -0.8426177, 1, 0.007843138, 0, 1,
-3.018466, 0.1813262, 0.2529406, 1, 0.01176471, 0, 1,
-2.941581, 0.8456277, -1.953959, 1, 0.01960784, 0, 1,
-2.751271, -1.822038, -2.378585, 1, 0.02352941, 0, 1,
-2.717086, -0.8920572, -2.193573, 1, 0.03137255, 0, 1,
-2.622804, 1.109797, -0.6840667, 1, 0.03529412, 0, 1,
-2.569761, 0.5851294, -1.997865, 1, 0.04313726, 0, 1,
-2.507965, -2.024514, -0.9079095, 1, 0.04705882, 0, 1,
-2.438655, 0.9919484, -2.608737, 1, 0.05490196, 0, 1,
-2.395283, 0.9743434, -1.195676, 1, 0.05882353, 0, 1,
-2.239993, -0.3575462, -1.598365, 1, 0.06666667, 0, 1,
-2.235696, 0.1460356, -1.62563, 1, 0.07058824, 0, 1,
-2.206394, 0.4165172, 0.1469382, 1, 0.07843138, 0, 1,
-2.166549, 0.06575187, -1.440894, 1, 0.08235294, 0, 1,
-2.142651, -1.347189, -2.905339, 1, 0.09019608, 0, 1,
-2.098332, 1.353747, -1.83687, 1, 0.09411765, 0, 1,
-2.098155, 0.2840423, -0.06315299, 1, 0.1019608, 0, 1,
-2.041138, -0.8959913, -2.772492, 1, 0.1098039, 0, 1,
-2.039145, -0.03756473, -0.0102435, 1, 0.1137255, 0, 1,
-1.984545, -0.6885878, -1.523007, 1, 0.1215686, 0, 1,
-1.957065, 1.294312, 0.509718, 1, 0.1254902, 0, 1,
-1.899568, -1.023534, -2.911477, 1, 0.1333333, 0, 1,
-1.885666, -0.4682526, -0.5506172, 1, 0.1372549, 0, 1,
-1.86591, 1.987789, -0.8627526, 1, 0.145098, 0, 1,
-1.861413, 0.5303102, -1.322365, 1, 0.1490196, 0, 1,
-1.846907, 0.2143288, -0.6743323, 1, 0.1568628, 0, 1,
-1.84339, 0.5718912, -0.03518731, 1, 0.1607843, 0, 1,
-1.779428, 0.2493594, -0.4308857, 1, 0.1686275, 0, 1,
-1.741378, 1.527401, -0.4831001, 1, 0.172549, 0, 1,
-1.740964, -1.45508, -0.4358607, 1, 0.1803922, 0, 1,
-1.7209, 0.9123996, -1.464852, 1, 0.1843137, 0, 1,
-1.714263, -0.8141683, -2.659113, 1, 0.1921569, 0, 1,
-1.714046, 0.9975075, -0.1332546, 1, 0.1960784, 0, 1,
-1.68012, 0.4436094, -3.585935, 1, 0.2039216, 0, 1,
-1.666569, -0.2290313, -0.7845613, 1, 0.2117647, 0, 1,
-1.663984, 0.1054245, -1.801884, 1, 0.2156863, 0, 1,
-1.655706, 0.7334762, -1.515143, 1, 0.2235294, 0, 1,
-1.647496, -0.7217609, -3.596502, 1, 0.227451, 0, 1,
-1.61009, 1.080818, 0.3104474, 1, 0.2352941, 0, 1,
-1.605886, 0.07040013, -0.5519943, 1, 0.2392157, 0, 1,
-1.592073, -0.6439269, -0.2665526, 1, 0.2470588, 0, 1,
-1.587725, 1.040765, -1.641743, 1, 0.2509804, 0, 1,
-1.585615, -0.8942955, -1.954804, 1, 0.2588235, 0, 1,
-1.579776, -1.369172, -2.116205, 1, 0.2627451, 0, 1,
-1.567604, 1.403778, -0.01683191, 1, 0.2705882, 0, 1,
-1.546057, -0.9814308, -2.377838, 1, 0.2745098, 0, 1,
-1.525131, 1.110091, -0.7235172, 1, 0.282353, 0, 1,
-1.525115, -0.3186477, -3.569779, 1, 0.2862745, 0, 1,
-1.522776, -0.3903565, -3.27165, 1, 0.2941177, 0, 1,
-1.520515, -0.2411707, -2.586257, 1, 0.3019608, 0, 1,
-1.506761, 0.4935949, -0.1472154, 1, 0.3058824, 0, 1,
-1.496605, -1.691102, -1.80672, 1, 0.3137255, 0, 1,
-1.483615, 0.8843161, -1.908885, 1, 0.3176471, 0, 1,
-1.480957, 0.3727779, -1.186901, 1, 0.3254902, 0, 1,
-1.475598, -0.3179267, -1.182459, 1, 0.3294118, 0, 1,
-1.472516, 0.1458861, -0.6402312, 1, 0.3372549, 0, 1,
-1.472354, 1.534709, -0.4045742, 1, 0.3411765, 0, 1,
-1.459998, -2.417114, -2.799077, 1, 0.3490196, 0, 1,
-1.45036, 0.01045798, -0.001326625, 1, 0.3529412, 0, 1,
-1.427902, -0.301463, -0.6389752, 1, 0.3607843, 0, 1,
-1.419912, 1.205176, 0.0799004, 1, 0.3647059, 0, 1,
-1.399571, -1.459229, -3.714414, 1, 0.372549, 0, 1,
-1.383206, -1.088653, -1.13448, 1, 0.3764706, 0, 1,
-1.369108, 1.710627, 0.6528608, 1, 0.3843137, 0, 1,
-1.366086, -0.5677477, -3.842973, 1, 0.3882353, 0, 1,
-1.363941, 0.6791473, -0.988959, 1, 0.3960784, 0, 1,
-1.342587, 0.6704292, -1.908453, 1, 0.4039216, 0, 1,
-1.339079, -1.233649, -1.940063, 1, 0.4078431, 0, 1,
-1.321866, 0.7434665, -0.6859215, 1, 0.4156863, 0, 1,
-1.319848, 1.233905, -0.3439358, 1, 0.4196078, 0, 1,
-1.311834, -0.2063304, -0.07581301, 1, 0.427451, 0, 1,
-1.299438, -0.9363441, -2.165784, 1, 0.4313726, 0, 1,
-1.29866, -0.02747608, 0.01990898, 1, 0.4392157, 0, 1,
-1.297317, 2.232203, 0.860333, 1, 0.4431373, 0, 1,
-1.294103, -0.3775653, -2.171967, 1, 0.4509804, 0, 1,
-1.285389, 1.391667, -2.624802, 1, 0.454902, 0, 1,
-1.280925, -1.987017, -1.883813, 1, 0.4627451, 0, 1,
-1.28092, -1.930133, -2.124094, 1, 0.4666667, 0, 1,
-1.26721, -1.56424, -2.617316, 1, 0.4745098, 0, 1,
-1.258618, -0.8950759, -3.141676, 1, 0.4784314, 0, 1,
-1.248649, -0.6108946, -2.135295, 1, 0.4862745, 0, 1,
-1.236563, -1.68708, -3.381437, 1, 0.4901961, 0, 1,
-1.234839, 0.2077381, -0.8975933, 1, 0.4980392, 0, 1,
-1.233358, -1.246476, -1.793362, 1, 0.5058824, 0, 1,
-1.231786, 0.8459834, -1.150765, 1, 0.509804, 0, 1,
-1.226941, -0.6592477, -1.775987, 1, 0.5176471, 0, 1,
-1.204029, -0.6676886, -2.622218, 1, 0.5215687, 0, 1,
-1.196951, 1.555932, 0.6008327, 1, 0.5294118, 0, 1,
-1.195521, 0.769184, -0.8686805, 1, 0.5333334, 0, 1,
-1.191517, -1.024899, -3.164737, 1, 0.5411765, 0, 1,
-1.185575, -1.52895, -2.48604, 1, 0.5450981, 0, 1,
-1.183866, -0.5147166, -0.364943, 1, 0.5529412, 0, 1,
-1.172169, 0.6671899, -1.432654, 1, 0.5568628, 0, 1,
-1.1713, 1.093763, -1.703372, 1, 0.5647059, 0, 1,
-1.156562, -0.3841182, -1.407965, 1, 0.5686275, 0, 1,
-1.153117, -1.435546, -1.651722, 1, 0.5764706, 0, 1,
-1.152621, -1.615823, -0.8055693, 1, 0.5803922, 0, 1,
-1.148018, 0.3265949, -0.8340943, 1, 0.5882353, 0, 1,
-1.142036, 0.06787387, -0.5982679, 1, 0.5921569, 0, 1,
-1.139897, -1.206626, -4.550532, 1, 0.6, 0, 1,
-1.136895, 1.024254, -0.3837505, 1, 0.6078432, 0, 1,
-1.127978, -1.776303, -2.972863, 1, 0.6117647, 0, 1,
-1.126484, 1.046359, 0.1279765, 1, 0.6196079, 0, 1,
-1.11678, 0.3041003, -0.5117262, 1, 0.6235294, 0, 1,
-1.115986, 0.1421752, 0.6790311, 1, 0.6313726, 0, 1,
-1.115776, -1.565184, -3.859946, 1, 0.6352941, 0, 1,
-1.112839, -0.5934942, -2.274633, 1, 0.6431373, 0, 1,
-1.11255, 0.8443709, -1.117079, 1, 0.6470588, 0, 1,
-1.107958, -0.3890204, -3.874999, 1, 0.654902, 0, 1,
-1.08732, 0.1125599, -0.6125278, 1, 0.6588235, 0, 1,
-1.084744, 1.747677, -0.7634131, 1, 0.6666667, 0, 1,
-1.083131, 0.07954048, -1.777874, 1, 0.6705883, 0, 1,
-1.082782, -1.076559, -1.554912, 1, 0.6784314, 0, 1,
-1.077959, 1.400517, -0.6126611, 1, 0.682353, 0, 1,
-1.07484, -0.9914137, -2.289024, 1, 0.6901961, 0, 1,
-1.070991, -0.9522947, -0.8785356, 1, 0.6941177, 0, 1,
-1.069849, -0.301992, -3.625023, 1, 0.7019608, 0, 1,
-1.06626, -0.677431, -2.065063, 1, 0.7098039, 0, 1,
-1.064882, 1.49365, -1.17618, 1, 0.7137255, 0, 1,
-1.057415, 0.4588297, -0.9916593, 1, 0.7215686, 0, 1,
-1.049519, 0.7442889, 0.6884347, 1, 0.7254902, 0, 1,
-1.045756, -0.6774378, -2.438852, 1, 0.7333333, 0, 1,
-1.045122, -3.192283, -3.284796, 1, 0.7372549, 0, 1,
-1.044526, -0.1575782, -0.8809203, 1, 0.7450981, 0, 1,
-1.041557, 1.129179, -0.3955472, 1, 0.7490196, 0, 1,
-1.04154, 0.7763125, -0.6389734, 1, 0.7568628, 0, 1,
-1.037276, -0.77565, -0.6451156, 1, 0.7607843, 0, 1,
-1.031538, -1.110557, -3.108329, 1, 0.7686275, 0, 1,
-1.029351, -0.3769219, -1.523362, 1, 0.772549, 0, 1,
-1.028589, -2.255936, -3.39731, 1, 0.7803922, 0, 1,
-1.024119, -0.09666492, -0.9044096, 1, 0.7843137, 0, 1,
-1.022292, -0.773985, -4.056964, 1, 0.7921569, 0, 1,
-1.010483, -1.251505, -1.742851, 1, 0.7960784, 0, 1,
-1.009472, 0.1071938, -0.4291773, 1, 0.8039216, 0, 1,
-1.008992, -2.128589, -2.961635, 1, 0.8117647, 0, 1,
-1.004019, 0.1953079, -1.556293, 1, 0.8156863, 0, 1,
-0.9988238, -1.759484, -3.037094, 1, 0.8235294, 0, 1,
-0.9937291, -0.2501417, -1.34359, 1, 0.827451, 0, 1,
-0.9935905, -0.1963775, -2.188955, 1, 0.8352941, 0, 1,
-0.9928337, -1.008307, -2.533048, 1, 0.8392157, 0, 1,
-0.9868982, 0.006568466, -3.07242, 1, 0.8470588, 0, 1,
-0.985649, 0.6858155, -2.992689, 1, 0.8509804, 0, 1,
-0.9839687, -1.225873, -2.271405, 1, 0.8588235, 0, 1,
-0.9821088, -1.129565, -1.025322, 1, 0.8627451, 0, 1,
-0.9792285, -0.7268719, -3.430904, 1, 0.8705882, 0, 1,
-0.9652028, -0.1613873, -2.125766, 1, 0.8745098, 0, 1,
-0.9651051, -1.085542, -3.418757, 1, 0.8823529, 0, 1,
-0.9495717, 1.242439, -1.360888, 1, 0.8862745, 0, 1,
-0.9481246, 0.9255343, -1.301173, 1, 0.8941177, 0, 1,
-0.9467037, -0.01788038, -1.414079, 1, 0.8980392, 0, 1,
-0.9463285, 0.8761017, 0.8131432, 1, 0.9058824, 0, 1,
-0.9454734, -0.09751587, -1.740138, 1, 0.9137255, 0, 1,
-0.9452727, 1.028403, 1.28492, 1, 0.9176471, 0, 1,
-0.9387079, -1.144194, -1.759957, 1, 0.9254902, 0, 1,
-0.937396, -0.19368, -1.480654, 1, 0.9294118, 0, 1,
-0.9350572, 1.590174, 0.9649712, 1, 0.9372549, 0, 1,
-0.9335282, -1.104701, -3.901918, 1, 0.9411765, 0, 1,
-0.9333616, 0.3045533, -0.5118322, 1, 0.9490196, 0, 1,
-0.9305178, 2.382011, -2.027594, 1, 0.9529412, 0, 1,
-0.9262452, 0.6997289, 1.07508, 1, 0.9607843, 0, 1,
-0.9163834, 0.5300719, -1.53637, 1, 0.9647059, 0, 1,
-0.9150461, 0.6388774, -2.382119, 1, 0.972549, 0, 1,
-0.9145559, -1.039724, -1.007555, 1, 0.9764706, 0, 1,
-0.9042236, -0.1043347, -2.80277, 1, 0.9843137, 0, 1,
-0.8977848, -0.6635451, -1.368512, 1, 0.9882353, 0, 1,
-0.8955395, -0.4634635, -0.9093941, 1, 0.9960784, 0, 1,
-0.8937993, 0.1507219, 0.2035544, 0.9960784, 1, 0, 1,
-0.8935613, 0.3173469, -1.137404, 0.9921569, 1, 0, 1,
-0.892457, 0.443195, -1.524653, 0.9843137, 1, 0, 1,
-0.8864391, 0.615545, -0.6794538, 0.9803922, 1, 0, 1,
-0.884946, 2.447, -0.5985804, 0.972549, 1, 0, 1,
-0.8807306, 0.3872473, -0.6586208, 0.9686275, 1, 0, 1,
-0.8799552, 1.209671, -1.177043, 0.9607843, 1, 0, 1,
-0.8779234, -0.4728322, -2.654634, 0.9568627, 1, 0, 1,
-0.87734, 0.278398, -2.30944, 0.9490196, 1, 0, 1,
-0.8765475, 0.49833, -1.897975, 0.945098, 1, 0, 1,
-0.8720621, -1.000768, -2.036103, 0.9372549, 1, 0, 1,
-0.8678465, -0.0806181, -0.3744307, 0.9333333, 1, 0, 1,
-0.8505221, -0.4587926, -0.5531201, 0.9254902, 1, 0, 1,
-0.8495108, 2.360558, 1.249652, 0.9215686, 1, 0, 1,
-0.8486643, -1.35131, -2.303801, 0.9137255, 1, 0, 1,
-0.8467846, -1.022704, -1.901393, 0.9098039, 1, 0, 1,
-0.8459348, 0.3245984, -1.94925, 0.9019608, 1, 0, 1,
-0.842534, 0.9681891, -0.9600408, 0.8941177, 1, 0, 1,
-0.8389577, 0.9549571, 0.2244337, 0.8901961, 1, 0, 1,
-0.8324772, 1.210575, 0.7126313, 0.8823529, 1, 0, 1,
-0.8234834, 0.5515274, 0.8084785, 0.8784314, 1, 0, 1,
-0.8220761, -1.563732, -1.42102, 0.8705882, 1, 0, 1,
-0.8220637, 0.09023852, -1.261838, 0.8666667, 1, 0, 1,
-0.8154169, -1.337208, -4.285903, 0.8588235, 1, 0, 1,
-0.8116562, 1.042272, 0.8442057, 0.854902, 1, 0, 1,
-0.810423, 1.256541, -1.274447, 0.8470588, 1, 0, 1,
-0.8093751, 0.3301204, -0.004845607, 0.8431373, 1, 0, 1,
-0.8007293, 0.7341664, -0.8516725, 0.8352941, 1, 0, 1,
-0.8001933, 1.239526, -1.061746, 0.8313726, 1, 0, 1,
-0.7997231, -0.3511887, -1.117, 0.8235294, 1, 0, 1,
-0.7984958, 0.7537388, -1.56741, 0.8196079, 1, 0, 1,
-0.796216, 0.5242107, -0.5049083, 0.8117647, 1, 0, 1,
-0.794018, 1.949244, 0.6861131, 0.8078431, 1, 0, 1,
-0.7933425, 1.550104, -2.454724, 0.8, 1, 0, 1,
-0.791194, -1.349509, -3.489808, 0.7921569, 1, 0, 1,
-0.7897394, 0.3131371, -3.544621, 0.7882353, 1, 0, 1,
-0.7890758, 0.3899706, -1.903033, 0.7803922, 1, 0, 1,
-0.7890001, 0.3868808, 0.5838198, 0.7764706, 1, 0, 1,
-0.788054, -0.4423654, -3.091199, 0.7686275, 1, 0, 1,
-0.785386, -0.4924463, -2.887479, 0.7647059, 1, 0, 1,
-0.784691, -0.1865643, -0.3230963, 0.7568628, 1, 0, 1,
-0.783263, -2.310073, -2.336507, 0.7529412, 1, 0, 1,
-0.7820084, -1.377144, -2.773325, 0.7450981, 1, 0, 1,
-0.7787167, 0.5289659, -0.1156805, 0.7411765, 1, 0, 1,
-0.7769516, -2.011824, -1.046509, 0.7333333, 1, 0, 1,
-0.7763054, 0.8982522, -0.9059632, 0.7294118, 1, 0, 1,
-0.7759553, -0.9636561, -2.907514, 0.7215686, 1, 0, 1,
-0.7691992, 0.5217356, -0.517207, 0.7176471, 1, 0, 1,
-0.7675387, -0.007357948, -1.67158, 0.7098039, 1, 0, 1,
-0.7647054, -0.5122865, -2.06715, 0.7058824, 1, 0, 1,
-0.762868, -0.7463475, -2.254955, 0.6980392, 1, 0, 1,
-0.7599932, -0.3052797, -0.3080344, 0.6901961, 1, 0, 1,
-0.7556558, -0.6684368, -1.795319, 0.6862745, 1, 0, 1,
-0.752831, -0.2643321, -2.968344, 0.6784314, 1, 0, 1,
-0.752327, -1.089047, -2.425956, 0.6745098, 1, 0, 1,
-0.7520991, -1.035136, -3.852493, 0.6666667, 1, 0, 1,
-0.7518201, -0.3428224, -1.373939, 0.6627451, 1, 0, 1,
-0.7505912, 0.7025777, -1.329047, 0.654902, 1, 0, 1,
-0.7419677, -0.4389731, -1.006006, 0.6509804, 1, 0, 1,
-0.7408206, 0.9862345, -1.735977, 0.6431373, 1, 0, 1,
-0.7402382, -0.09334555, -2.198533, 0.6392157, 1, 0, 1,
-0.7365595, -0.3283312, -1.798701, 0.6313726, 1, 0, 1,
-0.7323314, 0.6126816, -1.741962, 0.627451, 1, 0, 1,
-0.7321563, 0.6807842, 2.430392, 0.6196079, 1, 0, 1,
-0.7312075, -0.8031623, -0.5719299, 0.6156863, 1, 0, 1,
-0.7295895, 0.6361052, -1.684173, 0.6078432, 1, 0, 1,
-0.7084767, 1.172661, -1.355417, 0.6039216, 1, 0, 1,
-0.7080327, -0.1242917, -0.3137728, 0.5960785, 1, 0, 1,
-0.7070571, 0.7106408, -0.4054156, 0.5882353, 1, 0, 1,
-0.7043316, 0.6024952, -1.512985, 0.5843138, 1, 0, 1,
-0.7041218, -0.2901077, -1.78807, 0.5764706, 1, 0, 1,
-0.7025548, 0.1885117, -0.7065133, 0.572549, 1, 0, 1,
-0.7015204, 0.707799, -1.492069, 0.5647059, 1, 0, 1,
-0.6989824, 1.378523, -1.247043, 0.5607843, 1, 0, 1,
-0.6971638, 0.3903297, -0.715072, 0.5529412, 1, 0, 1,
-0.6946139, 0.8939213, -0.7456481, 0.5490196, 1, 0, 1,
-0.6924022, 0.8244098, -1.378724, 0.5411765, 1, 0, 1,
-0.6893134, -0.5572924, -3.538687, 0.5372549, 1, 0, 1,
-0.6842924, -0.4297416, -2.822669, 0.5294118, 1, 0, 1,
-0.6746913, 0.001290562, -1.800374, 0.5254902, 1, 0, 1,
-0.6742442, 2.534784, 1.848078, 0.5176471, 1, 0, 1,
-0.6734232, 0.4028962, 0.1384239, 0.5137255, 1, 0, 1,
-0.670908, 0.700544, -0.7399539, 0.5058824, 1, 0, 1,
-0.6690922, -0.3321179, -0.4777457, 0.5019608, 1, 0, 1,
-0.6666385, 0.9079829, -2.409892, 0.4941176, 1, 0, 1,
-0.6648509, -1.609519, -1.159006, 0.4862745, 1, 0, 1,
-0.6618536, -0.8881816, -2.723159, 0.4823529, 1, 0, 1,
-0.6609234, -1.038378, -2.990078, 0.4745098, 1, 0, 1,
-0.6596506, 0.9604928, 0.5558416, 0.4705882, 1, 0, 1,
-0.65859, -0.3274657, -0.6661962, 0.4627451, 1, 0, 1,
-0.656219, 0.6237581, -0.6354474, 0.4588235, 1, 0, 1,
-0.654829, -0.6808278, -1.377143, 0.4509804, 1, 0, 1,
-0.6542749, -0.5052328, -3.534603, 0.4470588, 1, 0, 1,
-0.6530026, -0.8720411, -1.757345, 0.4392157, 1, 0, 1,
-0.6489767, 1.168497, -0.2581208, 0.4352941, 1, 0, 1,
-0.6469908, -0.869782, -1.393899, 0.427451, 1, 0, 1,
-0.6429771, 1.786872, -0.5568824, 0.4235294, 1, 0, 1,
-0.6406093, 1.010896, 0.2060954, 0.4156863, 1, 0, 1,
-0.6326373, 0.5583842, -1.016541, 0.4117647, 1, 0, 1,
-0.6315531, 0.8571339, -2.703556, 0.4039216, 1, 0, 1,
-0.6279887, -0.482731, -2.100504, 0.3960784, 1, 0, 1,
-0.6276739, -0.01708505, 0.3557074, 0.3921569, 1, 0, 1,
-0.6109041, 0.3103459, -2.232845, 0.3843137, 1, 0, 1,
-0.6033798, -1.953839, -2.216173, 0.3803922, 1, 0, 1,
-0.599445, -0.7212369, -3.180729, 0.372549, 1, 0, 1,
-0.5966266, 1.001884, 1.334751, 0.3686275, 1, 0, 1,
-0.5963733, 0.1794253, -2.2456, 0.3607843, 1, 0, 1,
-0.5951868, -0.1350579, -2.575839, 0.3568628, 1, 0, 1,
-0.5900944, -0.2897859, -2.028631, 0.3490196, 1, 0, 1,
-0.5893514, -1.068025, -2.831067, 0.345098, 1, 0, 1,
-0.5852417, -1.713353, -2.977142, 0.3372549, 1, 0, 1,
-0.5848991, -2.885459, -4.049689, 0.3333333, 1, 0, 1,
-0.5843164, 1.337702, 1.397118, 0.3254902, 1, 0, 1,
-0.5841002, -0.7806942, -2.506959, 0.3215686, 1, 0, 1,
-0.5828441, 1.926892, -0.6841326, 0.3137255, 1, 0, 1,
-0.5791604, 1.413882, 0.027301, 0.3098039, 1, 0, 1,
-0.5608763, 1.474825, -1.042366, 0.3019608, 1, 0, 1,
-0.5603276, 0.6357349, -0.7913697, 0.2941177, 1, 0, 1,
-0.5597622, 0.4252969, -0.5121988, 0.2901961, 1, 0, 1,
-0.55738, -1.098526, -3.453439, 0.282353, 1, 0, 1,
-0.551396, 0.3366238, -0.3769931, 0.2784314, 1, 0, 1,
-0.5513884, -0.1990921, -1.969806, 0.2705882, 1, 0, 1,
-0.5434626, -0.2935109, -2.306571, 0.2666667, 1, 0, 1,
-0.5423021, -1.443153, -1.693739, 0.2588235, 1, 0, 1,
-0.5402583, 0.8160281, -0.7417754, 0.254902, 1, 0, 1,
-0.5395151, 0.4129179, 0.3639134, 0.2470588, 1, 0, 1,
-0.5366517, -0.5390427, -3.771918, 0.2431373, 1, 0, 1,
-0.5286943, 1.062639, 0.02359144, 0.2352941, 1, 0, 1,
-0.528254, 0.5045549, -1.478534, 0.2313726, 1, 0, 1,
-0.5231263, 0.2369973, -1.011952, 0.2235294, 1, 0, 1,
-0.5208054, -0.1070948, -2.409345, 0.2196078, 1, 0, 1,
-0.5197293, -0.4417112, -2.648333, 0.2117647, 1, 0, 1,
-0.5108272, 0.304527, -1.804696, 0.2078431, 1, 0, 1,
-0.5098352, -1.432508, -3.334373, 0.2, 1, 0, 1,
-0.5073801, 0.09737739, -0.2735516, 0.1921569, 1, 0, 1,
-0.4996507, -0.5589695, -4.422033, 0.1882353, 1, 0, 1,
-0.494232, -1.395405, -2.934227, 0.1803922, 1, 0, 1,
-0.4929027, -0.3345426, -1.856, 0.1764706, 1, 0, 1,
-0.4820534, -0.9907174, -2.99308, 0.1686275, 1, 0, 1,
-0.4818999, 1.968801, -0.6976846, 0.1647059, 1, 0, 1,
-0.4782335, 0.9845821, 0.8249217, 0.1568628, 1, 0, 1,
-0.4781256, 0.5674915, -3.39602, 0.1529412, 1, 0, 1,
-0.4776606, -2.04976, -3.416353, 0.145098, 1, 0, 1,
-0.4764028, 1.932515, -1.490109, 0.1411765, 1, 0, 1,
-0.4741841, -0.6498944, -0.5756044, 0.1333333, 1, 0, 1,
-0.4711188, 1.301472, -1.349557, 0.1294118, 1, 0, 1,
-0.4697138, 1.309551, -0.9786796, 0.1215686, 1, 0, 1,
-0.4667788, -0.9918026, -3.475673, 0.1176471, 1, 0, 1,
-0.4637893, -1.738249, -2.269463, 0.1098039, 1, 0, 1,
-0.4605211, -0.3383017, -3.116731, 0.1058824, 1, 0, 1,
-0.4573171, 1.574217, -1.405234, 0.09803922, 1, 0, 1,
-0.4448785, 0.02650256, -0.06595189, 0.09019608, 1, 0, 1,
-0.4376519, 0.6124713, 0.099869, 0.08627451, 1, 0, 1,
-0.4327759, -1.204692, -4.228521, 0.07843138, 1, 0, 1,
-0.4295445, -0.9231478, -3.327037, 0.07450981, 1, 0, 1,
-0.4266075, 0.6920069, -1.660841, 0.06666667, 1, 0, 1,
-0.4203674, -0.01543722, -2.514949, 0.0627451, 1, 0, 1,
-0.4192716, 1.227027, -2.10157, 0.05490196, 1, 0, 1,
-0.4160839, 0.2437583, -1.806777, 0.05098039, 1, 0, 1,
-0.4136789, -0.2094264, -2.281018, 0.04313726, 1, 0, 1,
-0.4122415, 0.6134431, -0.797183, 0.03921569, 1, 0, 1,
-0.4118144, -0.06459781, -3.09931, 0.03137255, 1, 0, 1,
-0.4092284, 0.8530259, -0.3534946, 0.02745098, 1, 0, 1,
-0.4077112, -0.4290598, -3.694852, 0.01960784, 1, 0, 1,
-0.4061094, -1.101528, -2.66909, 0.01568628, 1, 0, 1,
-0.4053001, -0.7120506, -1.553021, 0.007843138, 1, 0, 1,
-0.4010151, -0.9143867, -2.058726, 0.003921569, 1, 0, 1,
-0.398786, -0.7840727, -2.787924, 0, 1, 0.003921569, 1,
-0.3986749, 0.4580813, -1.790985, 0, 1, 0.01176471, 1,
-0.3984414, -0.6235523, -1.177871, 0, 1, 0.01568628, 1,
-0.3913305, -0.5509155, -1.802956, 0, 1, 0.02352941, 1,
-0.3910449, 0.2355551, 0.3070834, 0, 1, 0.02745098, 1,
-0.3901294, -0.3354919, -2.264855, 0, 1, 0.03529412, 1,
-0.3893191, 0.1718013, -0.9940982, 0, 1, 0.03921569, 1,
-0.3887702, 1.054044, -1.378268, 0, 1, 0.04705882, 1,
-0.3878174, -0.2864907, -2.19417, 0, 1, 0.05098039, 1,
-0.3863706, 0.008055045, -1.355657, 0, 1, 0.05882353, 1,
-0.3837188, 0.3421072, -0.6673295, 0, 1, 0.0627451, 1,
-0.380375, -0.007468438, -1.439846, 0, 1, 0.07058824, 1,
-0.3789759, -0.1255618, -0.2012435, 0, 1, 0.07450981, 1,
-0.3783686, 0.9064566, -0.8386597, 0, 1, 0.08235294, 1,
-0.3781658, 0.7977249, -0.9177101, 0, 1, 0.08627451, 1,
-0.3752661, 0.4544278, 0.6797361, 0, 1, 0.09411765, 1,
-0.3732563, 0.5208791, -1.080461, 0, 1, 0.1019608, 1,
-0.3669825, 1.754059, 0.04841217, 0, 1, 0.1058824, 1,
-0.3645257, 0.2130122, -0.05274488, 0, 1, 0.1137255, 1,
-0.3594395, -1.005213, -2.766202, 0, 1, 0.1176471, 1,
-0.3584917, -0.1871114, -2.350792, 0, 1, 0.1254902, 1,
-0.351065, 1.879139, 0.5877802, 0, 1, 0.1294118, 1,
-0.3444757, -0.02315134, -0.4868061, 0, 1, 0.1372549, 1,
-0.343407, -0.3188877, -1.653208, 0, 1, 0.1411765, 1,
-0.3369133, 1.064028, -0.3241016, 0, 1, 0.1490196, 1,
-0.335513, 0.7526221, -1.847463, 0, 1, 0.1529412, 1,
-0.3343228, 0.2216306, -2.026696, 0, 1, 0.1607843, 1,
-0.3337379, 1.977452, 1.195277, 0, 1, 0.1647059, 1,
-0.3315038, -0.04354281, -2.983199, 0, 1, 0.172549, 1,
-0.3280541, 0.9344549, -0.9589223, 0, 1, 0.1764706, 1,
-0.3268886, -2.003438, -2.643133, 0, 1, 0.1843137, 1,
-0.3251146, -0.9038841, -4.031491, 0, 1, 0.1882353, 1,
-0.3239549, -1.048774, -3.563028, 0, 1, 0.1960784, 1,
-0.3213309, -0.9827408, -4.568377, 0, 1, 0.2039216, 1,
-0.3208496, -0.3953117, -1.88062, 0, 1, 0.2078431, 1,
-0.319836, 0.06232665, -0.9172369, 0, 1, 0.2156863, 1,
-0.3198145, 0.2525218, -0.09639386, 0, 1, 0.2196078, 1,
-0.319023, -0.659174, -3.40328, 0, 1, 0.227451, 1,
-0.3142412, -0.7087276, -3.251831, 0, 1, 0.2313726, 1,
-0.3129111, 0.1020845, -0.5194354, 0, 1, 0.2392157, 1,
-0.3115518, -0.4529518, -3.823364, 0, 1, 0.2431373, 1,
-0.3098099, 0.2756365, -1.143682, 0, 1, 0.2509804, 1,
-0.3094184, 0.6357184, -1.261711, 0, 1, 0.254902, 1,
-0.3062438, -0.5977004, -4.180097, 0, 1, 0.2627451, 1,
-0.3039269, 0.7877537, 1.977598, 0, 1, 0.2666667, 1,
-0.3030684, 0.2293515, -2.912656, 0, 1, 0.2745098, 1,
-0.2977723, -1.448707, -2.207411, 0, 1, 0.2784314, 1,
-0.2935555, -1.064577, -1.883667, 0, 1, 0.2862745, 1,
-0.2929075, -0.2048028, -1.645709, 0, 1, 0.2901961, 1,
-0.2921424, 2.264341, 0.6024673, 0, 1, 0.2980392, 1,
-0.2895454, -0.3184483, -2.779565, 0, 1, 0.3058824, 1,
-0.2893044, 0.636555, 0.6216304, 0, 1, 0.3098039, 1,
-0.2793416, -0.3518971, -3.481019, 0, 1, 0.3176471, 1,
-0.2780493, 0.976855, 0.03522317, 0, 1, 0.3215686, 1,
-0.276949, -1.602435, -3.958377, 0, 1, 0.3294118, 1,
-0.2739077, 0.8026149, 1.083004, 0, 1, 0.3333333, 1,
-0.2650129, -0.4878885, -2.720689, 0, 1, 0.3411765, 1,
-0.2608469, -0.7741037, -3.026289, 0, 1, 0.345098, 1,
-0.25814, -0.844981, -0.6776541, 0, 1, 0.3529412, 1,
-0.2575078, -1.084819, -2.3631, 0, 1, 0.3568628, 1,
-0.2550762, 1.652705, -0.2657861, 0, 1, 0.3647059, 1,
-0.2546604, -1.776653, -4.44977, 0, 1, 0.3686275, 1,
-0.247082, -0.7167401, -2.574387, 0, 1, 0.3764706, 1,
-0.2428842, 0.0410671, -0.4570556, 0, 1, 0.3803922, 1,
-0.2376506, -0.06327118, -2.187036, 0, 1, 0.3882353, 1,
-0.2339124, -1.511376, -2.980993, 0, 1, 0.3921569, 1,
-0.233303, -0.2518384, -2.84665, 0, 1, 0.4, 1,
-0.2329652, -1.028988, -1.536628, 0, 1, 0.4078431, 1,
-0.2315791, 0.03063147, -1.049329, 0, 1, 0.4117647, 1,
-0.2300106, 0.06057063, -0.09569285, 0, 1, 0.4196078, 1,
-0.227606, -1.188472, -2.027315, 0, 1, 0.4235294, 1,
-0.2244732, 0.2746972, -1.527052, 0, 1, 0.4313726, 1,
-0.2122295, -0.3576192, -0.8581091, 0, 1, 0.4352941, 1,
-0.2087917, 1.063975, -1.041017, 0, 1, 0.4431373, 1,
-0.2081434, -0.88228, -1.661378, 0, 1, 0.4470588, 1,
-0.2078249, -0.3565302, -2.723058, 0, 1, 0.454902, 1,
-0.2069938, -1.214969, -1.004187, 0, 1, 0.4588235, 1,
-0.2040948, 0.7702594, -0.836903, 0, 1, 0.4666667, 1,
-0.2010311, 0.4091605, 0.2890317, 0, 1, 0.4705882, 1,
-0.2001354, -0.4434466, -2.330634, 0, 1, 0.4784314, 1,
-0.2000974, -0.328768, -2.747051, 0, 1, 0.4823529, 1,
-0.1948764, -0.744401, -2.610902, 0, 1, 0.4901961, 1,
-0.1883544, 0.9930529, 0.1803397, 0, 1, 0.4941176, 1,
-0.188053, 0.6544034, -0.7000329, 0, 1, 0.5019608, 1,
-0.1853798, -0.2206834, -2.808912, 0, 1, 0.509804, 1,
-0.185054, 0.8212987, -0.3695932, 0, 1, 0.5137255, 1,
-0.1819399, 0.228423, -1.669937, 0, 1, 0.5215687, 1,
-0.1803294, 0.6089101, -0.2923893, 0, 1, 0.5254902, 1,
-0.1793012, -1.605592, -3.209214, 0, 1, 0.5333334, 1,
-0.1777967, -0.7269711, -3.255856, 0, 1, 0.5372549, 1,
-0.1752858, 0.3017053, -0.612451, 0, 1, 0.5450981, 1,
-0.1644814, 1.755687, 1.220626, 0, 1, 0.5490196, 1,
-0.1625248, -1.392362, -1.807558, 0, 1, 0.5568628, 1,
-0.1610517, 0.3692673, -0.3850128, 0, 1, 0.5607843, 1,
-0.155564, 0.7035068, -0.784803, 0, 1, 0.5686275, 1,
-0.1542665, 0.351005, -2.082579, 0, 1, 0.572549, 1,
-0.1505569, 0.8460836, 0.7957733, 0, 1, 0.5803922, 1,
-0.1492901, -0.1742423, -1.90298, 0, 1, 0.5843138, 1,
-0.148649, -0.0886689, -2.43019, 0, 1, 0.5921569, 1,
-0.1483429, -0.8557719, -2.439939, 0, 1, 0.5960785, 1,
-0.1465212, 0.1744855, 0.9800017, 0, 1, 0.6039216, 1,
-0.1441494, -0.3679601, -2.545366, 0, 1, 0.6117647, 1,
-0.143778, 0.1116593, -0.9651413, 0, 1, 0.6156863, 1,
-0.1425956, -1.57665, -3.367347, 0, 1, 0.6235294, 1,
-0.141964, 0.3444102, -0.2889887, 0, 1, 0.627451, 1,
-0.1363707, -1.37811, -3.430049, 0, 1, 0.6352941, 1,
-0.1334116, 0.6706487, -0.07175178, 0, 1, 0.6392157, 1,
-0.1309003, -0.6713455, -3.573565, 0, 1, 0.6470588, 1,
-0.1273362, -0.7267261, -1.371974, 0, 1, 0.6509804, 1,
-0.1270267, -1.434349, -1.986722, 0, 1, 0.6588235, 1,
-0.1218865, -0.8557336, -5.372428, 0, 1, 0.6627451, 1,
-0.1161859, 0.5654894, 0.8266407, 0, 1, 0.6705883, 1,
-0.1158088, 1.848234, 0.3641943, 0, 1, 0.6745098, 1,
-0.1135638, -1.225243, -4.493154, 0, 1, 0.682353, 1,
-0.1134964, -0.7040533, -1.849144, 0, 1, 0.6862745, 1,
-0.1089798, -1.026416, -2.614594, 0, 1, 0.6941177, 1,
-0.1016266, 0.1161052, -1.547258, 0, 1, 0.7019608, 1,
-0.09292435, -0.5949567, -4.065845, 0, 1, 0.7058824, 1,
-0.09240863, 2.189881, -0.1947455, 0, 1, 0.7137255, 1,
-0.0922704, -0.9149756, -1.109547, 0, 1, 0.7176471, 1,
-0.0897513, 0.9427475, -0.8905967, 0, 1, 0.7254902, 1,
-0.08744315, 1.048339, -0.2226602, 0, 1, 0.7294118, 1,
-0.08733782, 1.260146, 1.261184, 0, 1, 0.7372549, 1,
-0.08568567, -0.744756, -3.036127, 0, 1, 0.7411765, 1,
-0.08304428, -0.3491932, -1.534821, 0, 1, 0.7490196, 1,
-0.08249762, 0.6234627, 0.08452763, 0, 1, 0.7529412, 1,
-0.08011899, 1.001771, 0.7308497, 0, 1, 0.7607843, 1,
-0.07714282, -1.167161, -2.485291, 0, 1, 0.7647059, 1,
-0.07585892, 1.030636, 1.151966, 0, 1, 0.772549, 1,
-0.07404394, 0.6140724, -1.234955, 0, 1, 0.7764706, 1,
-0.07167369, -0.007952774, -1.731418, 0, 1, 0.7843137, 1,
-0.06867008, 0.894389, 1.066216, 0, 1, 0.7882353, 1,
-0.06861416, 0.7609021, -0.9905623, 0, 1, 0.7960784, 1,
-0.06807073, 0.3242765, -0.5452473, 0, 1, 0.8039216, 1,
-0.06613249, -1.116524, -2.255463, 0, 1, 0.8078431, 1,
-0.06310949, 0.7214355, -0.9402883, 0, 1, 0.8156863, 1,
-0.058281, 0.5449654, 1.054107, 0, 1, 0.8196079, 1,
-0.05682263, -0.7660761, -3.400471, 0, 1, 0.827451, 1,
-0.0554306, -0.8329536, -1.676217, 0, 1, 0.8313726, 1,
-0.05529659, -1.015108, -2.545014, 0, 1, 0.8392157, 1,
-0.05463916, 1.014714, -1.726843, 0, 1, 0.8431373, 1,
-0.04873571, 0.1139376, -0.02965609, 0, 1, 0.8509804, 1,
-0.04869812, -1.761698, -3.791619, 0, 1, 0.854902, 1,
-0.04416209, -0.6380621, -2.129354, 0, 1, 0.8627451, 1,
-0.04090847, 0.2408808, 0.3332136, 0, 1, 0.8666667, 1,
-0.03924115, -0.3512209, -4.21901, 0, 1, 0.8745098, 1,
-0.03921976, 0.02635649, -1.943571, 0, 1, 0.8784314, 1,
-0.03731858, 1.113595, 0.6649703, 0, 1, 0.8862745, 1,
-0.03156736, -0.03683555, -2.380745, 0, 1, 0.8901961, 1,
-0.02904953, 0.1886368, -0.4326149, 0, 1, 0.8980392, 1,
-0.02715034, 0.7175941, 0.6597525, 0, 1, 0.9058824, 1,
-0.02477071, 1.505544, -0.06733544, 0, 1, 0.9098039, 1,
-0.02092833, 0.9931322, -0.7635512, 0, 1, 0.9176471, 1,
-0.01875056, -0.4754085, -3.96357, 0, 1, 0.9215686, 1,
-0.01400659, -0.1163505, -1.161327, 0, 1, 0.9294118, 1,
-0.01349651, 0.8568879, 0.3908408, 0, 1, 0.9333333, 1,
-0.008773727, -0.147344, -5.387225, 0, 1, 0.9411765, 1,
-0.007430821, 0.5335965, 0.6624973, 0, 1, 0.945098, 1,
-0.002199379, -1.236071, -2.396849, 0, 1, 0.9529412, 1,
-0.0003300875, -1.262893, -3.351459, 0, 1, 0.9568627, 1,
0.002225803, 0.9327329, 0.4016218, 0, 1, 0.9647059, 1,
0.00607374, -1.677735, 3.820491, 0, 1, 0.9686275, 1,
0.006228072, -0.6772824, 3.267815, 0, 1, 0.9764706, 1,
0.007363709, -0.01019167, 2.654019, 0, 1, 0.9803922, 1,
0.007654699, 0.3173312, 1.198714, 0, 1, 0.9882353, 1,
0.011467, 1.097165, -0.3212044, 0, 1, 0.9921569, 1,
0.01186192, -0.100918, 4.877302, 0, 1, 1, 1,
0.01203081, -0.6715679, 2.803956, 0, 0.9921569, 1, 1,
0.01297505, -1.065796, 4.80815, 0, 0.9882353, 1, 1,
0.01384387, -1.595223, 3.474309, 0, 0.9803922, 1, 1,
0.01615329, 1.023398, -0.4952007, 0, 0.9764706, 1, 1,
0.0165919, -0.08907203, 4.861863, 0, 0.9686275, 1, 1,
0.01829428, 1.232221, -0.801497, 0, 0.9647059, 1, 1,
0.02061511, -0.5951287, 2.903559, 0, 0.9568627, 1, 1,
0.02069442, -1.617643, 1.867532, 0, 0.9529412, 1, 1,
0.0210431, -0.6527705, 4.44995, 0, 0.945098, 1, 1,
0.02212282, -2.352611, 3.012456, 0, 0.9411765, 1, 1,
0.02652876, -0.476807, 2.762553, 0, 0.9333333, 1, 1,
0.02752878, -0.1062112, 2.247683, 0, 0.9294118, 1, 1,
0.03143946, -1.17026, 4.602011, 0, 0.9215686, 1, 1,
0.03184198, -1.059378, 3.848067, 0, 0.9176471, 1, 1,
0.0332684, 0.2224982, 1.212013, 0, 0.9098039, 1, 1,
0.04344368, -0.5679728, 2.664178, 0, 0.9058824, 1, 1,
0.04345972, 1.497725, -0.5013455, 0, 0.8980392, 1, 1,
0.04471004, -0.817742, 4.291267, 0, 0.8901961, 1, 1,
0.04987042, 0.5309296, -0.681488, 0, 0.8862745, 1, 1,
0.05173563, -0.02566087, 0.448171, 0, 0.8784314, 1, 1,
0.05312249, -1.126042, 1.774624, 0, 0.8745098, 1, 1,
0.05357318, 0.8671274, 0.6096453, 0, 0.8666667, 1, 1,
0.05906408, 0.3197905, 0.4214404, 0, 0.8627451, 1, 1,
0.06255043, -0.181072, 3.043885, 0, 0.854902, 1, 1,
0.06544864, -0.4115298, 2.897781, 0, 0.8509804, 1, 1,
0.06589732, 0.4163925, 0.5571199, 0, 0.8431373, 1, 1,
0.06631722, -1.310786, 3.439979, 0, 0.8392157, 1, 1,
0.07126062, 0.8517908, -0.6571031, 0, 0.8313726, 1, 1,
0.07177934, -0.08815311, 0.5593085, 0, 0.827451, 1, 1,
0.07458352, 1.49355, 0.01874626, 0, 0.8196079, 1, 1,
0.07504465, -1.142102, 0.8165835, 0, 0.8156863, 1, 1,
0.07600085, -0.5391775, 3.050807, 0, 0.8078431, 1, 1,
0.0760672, -1.272404, 3.207348, 0, 0.8039216, 1, 1,
0.07643617, 1.153536, -0.2731285, 0, 0.7960784, 1, 1,
0.07694472, 0.3534081, -0.4571329, 0, 0.7882353, 1, 1,
0.07877859, -0.9418039, 2.280426, 0, 0.7843137, 1, 1,
0.08283516, 0.7354468, -0.6425167, 0, 0.7764706, 1, 1,
0.08369351, -0.5833881, 3.077573, 0, 0.772549, 1, 1,
0.08964782, 0.1599175, -0.59245, 0, 0.7647059, 1, 1,
0.09703558, 0.1164066, -0.4613915, 0, 0.7607843, 1, 1,
0.09960427, -0.6811884, 2.214925, 0, 0.7529412, 1, 1,
0.09972071, -0.4963495, 3.284221, 0, 0.7490196, 1, 1,
0.1054839, 0.6272039, 0.6688207, 0, 0.7411765, 1, 1,
0.1055369, 0.3947941, 0.2255061, 0, 0.7372549, 1, 1,
0.1068382, -0.6584787, 2.502409, 0, 0.7294118, 1, 1,
0.1086946, 0.9919132, -0.8383455, 0, 0.7254902, 1, 1,
0.1111953, -0.03317834, 1.274162, 0, 0.7176471, 1, 1,
0.1140072, -1.188233, 3.450391, 0, 0.7137255, 1, 1,
0.1146637, 0.3642987, 0.2437119, 0, 0.7058824, 1, 1,
0.1214228, -0.7402381, 2.727313, 0, 0.6980392, 1, 1,
0.1269065, 0.7330853, 1.063639, 0, 0.6941177, 1, 1,
0.1278008, -0.2376895, 3.313941, 0, 0.6862745, 1, 1,
0.1299732, -0.9060753, 2.440283, 0, 0.682353, 1, 1,
0.1503418, 1.292862, 0.3613146, 0, 0.6745098, 1, 1,
0.15278, -1.218301, 4.128076, 0, 0.6705883, 1, 1,
0.1535126, -0.1362466, 0.8612664, 0, 0.6627451, 1, 1,
0.1557469, -0.8268963, 2.651168, 0, 0.6588235, 1, 1,
0.1565383, 1.700402, 0.3922656, 0, 0.6509804, 1, 1,
0.1641082, 2.391145, 0.6119894, 0, 0.6470588, 1, 1,
0.1651699, -0.513102, 2.547425, 0, 0.6392157, 1, 1,
0.1656483, -0.8959328, 1.758353, 0, 0.6352941, 1, 1,
0.1741912, -0.03742538, 2.591621, 0, 0.627451, 1, 1,
0.1781816, 1.337936, 0.357578, 0, 0.6235294, 1, 1,
0.1788966, -0.6149715, 2.144071, 0, 0.6156863, 1, 1,
0.179795, 1.66977, -0.3353391, 0, 0.6117647, 1, 1,
0.1805613, 0.3934889, -0.1551235, 0, 0.6039216, 1, 1,
0.180604, 1.218258, 1.406351, 0, 0.5960785, 1, 1,
0.1806434, 1.207729, 1.315442, 0, 0.5921569, 1, 1,
0.1814403, -1.143622, 4.202273, 0, 0.5843138, 1, 1,
0.1841922, -0.5770675, 3.906383, 0, 0.5803922, 1, 1,
0.1903797, 1.853718, 0.6081328, 0, 0.572549, 1, 1,
0.1913858, -0.3561814, 1.559766, 0, 0.5686275, 1, 1,
0.1922898, -0.8335063, 2.973922, 0, 0.5607843, 1, 1,
0.1935974, -0.5733509, 3.792728, 0, 0.5568628, 1, 1,
0.1937589, 2.364071, -1.716361, 0, 0.5490196, 1, 1,
0.1942147, -0.6562725, 1.321065, 0, 0.5450981, 1, 1,
0.1951865, -1.402159, 2.948496, 0, 0.5372549, 1, 1,
0.1957787, -1.908416, 3.907743, 0, 0.5333334, 1, 1,
0.1999192, -1.696494, 1.424213, 0, 0.5254902, 1, 1,
0.202056, 1.4568, 0.6895791, 0, 0.5215687, 1, 1,
0.2034805, -0.7302878, 2.124073, 0, 0.5137255, 1, 1,
0.2059261, -0.3798581, 2.381277, 0, 0.509804, 1, 1,
0.2091362, -1.355694, 1.821249, 0, 0.5019608, 1, 1,
0.2099635, -1.076593, 3.538425, 0, 0.4941176, 1, 1,
0.2122922, -0.7264613, 3.779639, 0, 0.4901961, 1, 1,
0.2139095, 0.309142, 0.6476872, 0, 0.4823529, 1, 1,
0.2150535, -0.3813245, 2.383256, 0, 0.4784314, 1, 1,
0.2176631, -0.08387089, 2.715581, 0, 0.4705882, 1, 1,
0.220029, -0.4213278, 4.197919, 0, 0.4666667, 1, 1,
0.2272103, -1.03736, 2.893636, 0, 0.4588235, 1, 1,
0.2277905, 0.9007492, 1.605242, 0, 0.454902, 1, 1,
0.236567, -0.05319397, -0.569002, 0, 0.4470588, 1, 1,
0.23728, -0.973906, 5.421589, 0, 0.4431373, 1, 1,
0.2377944, -2.641689, 2.111655, 0, 0.4352941, 1, 1,
0.2386117, -0.5070481, 2.961271, 0, 0.4313726, 1, 1,
0.2452177, -0.03581612, 1.675936, 0, 0.4235294, 1, 1,
0.2472761, -1.37713, 2.255161, 0, 0.4196078, 1, 1,
0.2516967, -0.08695705, 1.604719, 0, 0.4117647, 1, 1,
0.2520603, 0.6396586, 1.096934, 0, 0.4078431, 1, 1,
0.2540617, 0.6999217, 1.854797, 0, 0.4, 1, 1,
0.2572617, -1.180761, 3.652448, 0, 0.3921569, 1, 1,
0.2573103, 0.6640263, 0.8064479, 0, 0.3882353, 1, 1,
0.2577037, 0.1911433, 1.323753, 0, 0.3803922, 1, 1,
0.2627385, -1.406403, 2.002165, 0, 0.3764706, 1, 1,
0.2646135, -1.497326, 3.933065, 0, 0.3686275, 1, 1,
0.2651421, 1.814609, 0.7760313, 0, 0.3647059, 1, 1,
0.2692421, -2.355953, 2.320585, 0, 0.3568628, 1, 1,
0.2698858, 1.563757, -0.642747, 0, 0.3529412, 1, 1,
0.2722189, -2.192556, 3.437998, 0, 0.345098, 1, 1,
0.274936, 0.2467344, 3.337054, 0, 0.3411765, 1, 1,
0.2806488, -2.626719, 3.201174, 0, 0.3333333, 1, 1,
0.2836166, 0.5608776, 0.3395412, 0, 0.3294118, 1, 1,
0.2837444, -1.319489, 3.128565, 0, 0.3215686, 1, 1,
0.2906521, -2.104392, 4.542788, 0, 0.3176471, 1, 1,
0.2919943, -0.08848606, 0.8670004, 0, 0.3098039, 1, 1,
0.2968493, -0.7653887, 4.079976, 0, 0.3058824, 1, 1,
0.2975044, -1.039597, 1.603908, 0, 0.2980392, 1, 1,
0.3041541, 0.9647468, 0.4192823, 0, 0.2901961, 1, 1,
0.3078089, 0.4637555, 1.862559, 0, 0.2862745, 1, 1,
0.3082539, -0.8594046, 1.903096, 0, 0.2784314, 1, 1,
0.3098613, 0.2715686, 1.460519, 0, 0.2745098, 1, 1,
0.3125497, 2.102057, -0.8003177, 0, 0.2666667, 1, 1,
0.3168575, 0.6711379, 0.8811067, 0, 0.2627451, 1, 1,
0.319647, -0.5058272, 2.264964, 0, 0.254902, 1, 1,
0.3213847, -0.7966962, 2.608438, 0, 0.2509804, 1, 1,
0.3225615, 1.442355, -0.8621101, 0, 0.2431373, 1, 1,
0.3272548, -1.741465, 1.947085, 0, 0.2392157, 1, 1,
0.328842, -0.2480451, 1.82099, 0, 0.2313726, 1, 1,
0.329225, 0.2224423, 0.6432946, 0, 0.227451, 1, 1,
0.3341229, 0.3600769, 2.817564, 0, 0.2196078, 1, 1,
0.3356239, -1.009278, 1.41066, 0, 0.2156863, 1, 1,
0.3364306, 0.2835139, -1.019746, 0, 0.2078431, 1, 1,
0.3381445, -0.9206215, 4.756639, 0, 0.2039216, 1, 1,
0.3396081, 1.157754, 0.6679822, 0, 0.1960784, 1, 1,
0.3396947, 0.7596372, 1.289973, 0, 0.1882353, 1, 1,
0.3423102, -1.132026, 3.547481, 0, 0.1843137, 1, 1,
0.3428352, 0.001793846, 2.035907, 0, 0.1764706, 1, 1,
0.3482524, 0.753514, -1.643859, 0, 0.172549, 1, 1,
0.3490377, 0.8475755, 1.060886, 0, 0.1647059, 1, 1,
0.3506418, -0.4722413, 1.894417, 0, 0.1607843, 1, 1,
0.3560677, -1.479883, 3.754126, 0, 0.1529412, 1, 1,
0.3587091, -0.6943986, 1.595092, 0, 0.1490196, 1, 1,
0.3603882, 1.676834, -1.563909, 0, 0.1411765, 1, 1,
0.3604152, -0.5220096, 2.720069, 0, 0.1372549, 1, 1,
0.3614734, -0.5255188, 3.192438, 0, 0.1294118, 1, 1,
0.3652079, 1.977885, 0.0428443, 0, 0.1254902, 1, 1,
0.3663191, 0.7763587, 1.515146, 0, 0.1176471, 1, 1,
0.3663392, -1.874956, 3.427414, 0, 0.1137255, 1, 1,
0.3684942, 0.7601466, 0.5464439, 0, 0.1058824, 1, 1,
0.3702674, 1.390125, 1.045068, 0, 0.09803922, 1, 1,
0.3705817, -2.091813, 5.194255, 0, 0.09411765, 1, 1,
0.372994, -1.262154, 3.780704, 0, 0.08627451, 1, 1,
0.3769214, -0.8727457, 3.658967, 0, 0.08235294, 1, 1,
0.3785207, 0.6410997, 0.7570671, 0, 0.07450981, 1, 1,
0.3795666, 1.687218, -0.3006828, 0, 0.07058824, 1, 1,
0.3817436, -0.5170747, 0.8488426, 0, 0.0627451, 1, 1,
0.3882415, -0.6132608, 0.2365722, 0, 0.05882353, 1, 1,
0.3898761, -1.933933, 1.350845, 0, 0.05098039, 1, 1,
0.3948928, -0.169332, 1.122579, 0, 0.04705882, 1, 1,
0.395699, 1.385756, 0.007779645, 0, 0.03921569, 1, 1,
0.3971943, 0.3553755, -0.5196247, 0, 0.03529412, 1, 1,
0.4012972, -1.199122, 2.413993, 0, 0.02745098, 1, 1,
0.405983, 0.3492884, 2.722777, 0, 0.02352941, 1, 1,
0.4060167, -0.7106221, 2.332891, 0, 0.01568628, 1, 1,
0.4079587, 0.6190008, -0.1158487, 0, 0.01176471, 1, 1,
0.4080428, 0.8992008, 0.02514712, 0, 0.003921569, 1, 1,
0.4095633, -1.937477, 1.512562, 0.003921569, 0, 1, 1,
0.4171131, -1.111387, 1.379082, 0.007843138, 0, 1, 1,
0.4193295, 1.680132, 0.6676103, 0.01568628, 0, 1, 1,
0.4210837, 0.09436794, 0.8126549, 0.01960784, 0, 1, 1,
0.4225114, 0.3556961, 2.892651, 0.02745098, 0, 1, 1,
0.4233525, 1.760845, 1.501827, 0.03137255, 0, 1, 1,
0.4289398, 0.8334785, 0.5196884, 0.03921569, 0, 1, 1,
0.4316226, -0.4067157, 4.114648, 0.04313726, 0, 1, 1,
0.4317365, 0.01747282, 1.28693, 0.05098039, 0, 1, 1,
0.4320095, -0.355143, 1.653965, 0.05490196, 0, 1, 1,
0.4323463, 0.6026791, 1.62034, 0.0627451, 0, 1, 1,
0.4325002, -0.4135295, 1.749961, 0.06666667, 0, 1, 1,
0.4342237, 1.385045, -0.5376568, 0.07450981, 0, 1, 1,
0.4342574, 0.01551636, 1.324013, 0.07843138, 0, 1, 1,
0.4345685, -1.71085, 4.792166, 0.08627451, 0, 1, 1,
0.4422497, 0.9403722, 0.583788, 0.09019608, 0, 1, 1,
0.4427173, 0.9848882, -0.6603019, 0.09803922, 0, 1, 1,
0.4431749, 0.4639074, 1.305103, 0.1058824, 0, 1, 1,
0.4441037, -0.0786409, 0.5914985, 0.1098039, 0, 1, 1,
0.4458154, 1.365316, -0.4484025, 0.1176471, 0, 1, 1,
0.448792, -1.07427, 3.292614, 0.1215686, 0, 1, 1,
0.4529141, 0.7841954, -0.6392494, 0.1294118, 0, 1, 1,
0.4541808, 1.716005, 0.6884108, 0.1333333, 0, 1, 1,
0.4542376, -0.05580679, 1.514765, 0.1411765, 0, 1, 1,
0.4566793, 2.214613, 1.107287, 0.145098, 0, 1, 1,
0.4578299, -0.01541632, 1.587412, 0.1529412, 0, 1, 1,
0.4612519, 0.7573414, 1.893276, 0.1568628, 0, 1, 1,
0.4643312, 0.2764598, 1.765496, 0.1647059, 0, 1, 1,
0.4652448, -0.8565001, 3.346818, 0.1686275, 0, 1, 1,
0.471505, -1.218483, 2.323989, 0.1764706, 0, 1, 1,
0.4742756, -0.3647145, 2.727101, 0.1803922, 0, 1, 1,
0.4787761, -0.9066479, 3.510921, 0.1882353, 0, 1, 1,
0.4811665, -0.9438616, 1.920107, 0.1921569, 0, 1, 1,
0.4812766, 0.8096386, -0.7052037, 0.2, 0, 1, 1,
0.4817989, 0.8397095, -0.5992377, 0.2078431, 0, 1, 1,
0.4837806, -0.3121878, 2.978083, 0.2117647, 0, 1, 1,
0.4848849, -0.8906822, 1.573295, 0.2196078, 0, 1, 1,
0.4855885, -0.2917198, 0.9054194, 0.2235294, 0, 1, 1,
0.4882383, -1.295393, 4.557897, 0.2313726, 0, 1, 1,
0.4903057, -2.394398, 1.519921, 0.2352941, 0, 1, 1,
0.4919559, -0.8516349, 2.633152, 0.2431373, 0, 1, 1,
0.5045332, 0.9101456, 0.2026434, 0.2470588, 0, 1, 1,
0.505428, 0.09152441, 0.1487784, 0.254902, 0, 1, 1,
0.5056403, -1.723558, 2.637589, 0.2588235, 0, 1, 1,
0.5137681, 0.5814428, 0.4911754, 0.2666667, 0, 1, 1,
0.5177668, 0.3959701, 2.563165, 0.2705882, 0, 1, 1,
0.5197936, -0.07141967, 1.873244, 0.2784314, 0, 1, 1,
0.5203571, 0.1894467, 2.745254, 0.282353, 0, 1, 1,
0.5268241, -0.8303756, 2.936547, 0.2901961, 0, 1, 1,
0.5280658, -1.130663, 3.979011, 0.2941177, 0, 1, 1,
0.5306076, 1.465141, -1.315608, 0.3019608, 0, 1, 1,
0.5310271, -0.08528354, 3.252467, 0.3098039, 0, 1, 1,
0.5338481, 0.05167647, 0.3647857, 0.3137255, 0, 1, 1,
0.5391218, -2.480306, 2.472341, 0.3215686, 0, 1, 1,
0.5407728, -0.3697888, 2.535954, 0.3254902, 0, 1, 1,
0.5455938, -1.079129, 2.695575, 0.3333333, 0, 1, 1,
0.552295, -0.2477226, 2.035252, 0.3372549, 0, 1, 1,
0.5533774, 0.3053156, 1.316319, 0.345098, 0, 1, 1,
0.5562955, -0.0928479, 2.019969, 0.3490196, 0, 1, 1,
0.5573812, -1.264827, 2.185477, 0.3568628, 0, 1, 1,
0.5598266, -0.2130417, 2.240699, 0.3607843, 0, 1, 1,
0.5645634, -0.832415, 3.829994, 0.3686275, 0, 1, 1,
0.56639, -1.202837, 2.52711, 0.372549, 0, 1, 1,
0.583011, -1.789788, 3.308576, 0.3803922, 0, 1, 1,
0.584061, -1.639022, 2.946965, 0.3843137, 0, 1, 1,
0.5853615, -0.1003599, 1.343024, 0.3921569, 0, 1, 1,
0.5871306, -1.363618, -0.06804214, 0.3960784, 0, 1, 1,
0.5881909, -1.494223, 1.184453, 0.4039216, 0, 1, 1,
0.5903208, 1.13629, 2.886012, 0.4117647, 0, 1, 1,
0.5951021, 1.247031, 1.435079, 0.4156863, 0, 1, 1,
0.6002182, -0.3366737, 2.664903, 0.4235294, 0, 1, 1,
0.6021494, 0.2813263, 1.673918, 0.427451, 0, 1, 1,
0.6070614, 1.448608, 0.7401128, 0.4352941, 0, 1, 1,
0.608925, -1.234674, 2.703265, 0.4392157, 0, 1, 1,
0.6181275, -0.0886298, 2.092918, 0.4470588, 0, 1, 1,
0.6225854, 1.87846, -0.2717348, 0.4509804, 0, 1, 1,
0.6262766, 0.5745239, 1.145684, 0.4588235, 0, 1, 1,
0.6267159, 0.9529293, 1.199692, 0.4627451, 0, 1, 1,
0.6288068, -0.5431468, 0.5631331, 0.4705882, 0, 1, 1,
0.6347255, 0.04457194, 1.439247, 0.4745098, 0, 1, 1,
0.6446881, 0.2978854, 0.5637372, 0.4823529, 0, 1, 1,
0.646987, 0.02990836, 2.078819, 0.4862745, 0, 1, 1,
0.64937, 0.6950546, 1.798747, 0.4941176, 0, 1, 1,
0.6548216, -0.326717, 1.350741, 0.5019608, 0, 1, 1,
0.6549163, -0.5718265, 3.494646, 0.5058824, 0, 1, 1,
0.6580582, 0.9663329, -0.7282184, 0.5137255, 0, 1, 1,
0.663536, 0.01841599, 1.138028, 0.5176471, 0, 1, 1,
0.6663749, -1.823391, 1.541711, 0.5254902, 0, 1, 1,
0.6695228, -0.8966829, 2.48647, 0.5294118, 0, 1, 1,
0.6802311, -0.22515, 2.188836, 0.5372549, 0, 1, 1,
0.6812322, 0.5603693, 0.3783943, 0.5411765, 0, 1, 1,
0.6813849, 0.002938444, 2.903688, 0.5490196, 0, 1, 1,
0.6821191, -0.6316929, 1.429019, 0.5529412, 0, 1, 1,
0.6835899, 0.8254925, 2.735118, 0.5607843, 0, 1, 1,
0.6918261, -1.669833, 4.935541, 0.5647059, 0, 1, 1,
0.6936222, 0.8184164, 1.323753, 0.572549, 0, 1, 1,
0.6983311, -0.6292184, 2.339318, 0.5764706, 0, 1, 1,
0.7028866, -1.373298, 2.159058, 0.5843138, 0, 1, 1,
0.7038867, 1.681543, 0.9293475, 0.5882353, 0, 1, 1,
0.7076116, 1.494083, 2.124959, 0.5960785, 0, 1, 1,
0.7079177, -0.4780561, 1.125733, 0.6039216, 0, 1, 1,
0.711854, -0.4823562, 2.740849, 0.6078432, 0, 1, 1,
0.7193782, 1.229235, 0.001527495, 0.6156863, 0, 1, 1,
0.7244458, 0.3702142, 0.1351773, 0.6196079, 0, 1, 1,
0.737508, -2.193736, 3.131083, 0.627451, 0, 1, 1,
0.7446687, 1.843539, 2.517892, 0.6313726, 0, 1, 1,
0.7464418, -0.2668016, 1.13318, 0.6392157, 0, 1, 1,
0.7489989, -0.5553797, 3.596612, 0.6431373, 0, 1, 1,
0.7568065, 0.2837249, 1.134197, 0.6509804, 0, 1, 1,
0.7577184, 0.8665193, 1.908505, 0.654902, 0, 1, 1,
0.7645384, 0.4570976, 0.6174249, 0.6627451, 0, 1, 1,
0.7686694, -1.636333, 3.963326, 0.6666667, 0, 1, 1,
0.7692471, -0.3943963, 3.173352, 0.6745098, 0, 1, 1,
0.7692693, 0.7693509, -0.2268933, 0.6784314, 0, 1, 1,
0.7696787, -0.6511453, 1.772872, 0.6862745, 0, 1, 1,
0.7712455, 2.22932, 0.367086, 0.6901961, 0, 1, 1,
0.7730985, -0.3708818, 1.532494, 0.6980392, 0, 1, 1,
0.7815713, -0.160793, 0.5636514, 0.7058824, 0, 1, 1,
0.7816842, -1.105338, 2.553114, 0.7098039, 0, 1, 1,
0.7822538, -0.3925615, 1.171691, 0.7176471, 0, 1, 1,
0.7840946, -0.1222351, 1.781513, 0.7215686, 0, 1, 1,
0.7846233, 2.045107, -1.061671, 0.7294118, 0, 1, 1,
0.7875479, 0.8605446, 0.1065716, 0.7333333, 0, 1, 1,
0.7957607, -0.9818609, 1.891717, 0.7411765, 0, 1, 1,
0.8000307, 1.634845, 1.347427, 0.7450981, 0, 1, 1,
0.8025784, 2.390269, -0.811113, 0.7529412, 0, 1, 1,
0.8046919, -0.7048062, 1.413732, 0.7568628, 0, 1, 1,
0.8048517, -1.117335, 3.949198, 0.7647059, 0, 1, 1,
0.805975, 0.75148, -0.9203812, 0.7686275, 0, 1, 1,
0.8082681, 1.3774, -0.9060367, 0.7764706, 0, 1, 1,
0.8104945, 0.06556806, 1.487991, 0.7803922, 0, 1, 1,
0.8110668, 0.1182373, 0.8742538, 0.7882353, 0, 1, 1,
0.8175289, 0.001784617, -0.04775182, 0.7921569, 0, 1, 1,
0.8223521, 1.848022, 0.2844221, 0.8, 0, 1, 1,
0.8254086, -0.3904693, 1.042818, 0.8078431, 0, 1, 1,
0.8304161, -0.6322798, 2.262997, 0.8117647, 0, 1, 1,
0.8314674, 0.1075727, 0.1943403, 0.8196079, 0, 1, 1,
0.832909, 0.4670412, 1.419767, 0.8235294, 0, 1, 1,
0.8348418, 0.6764977, -0.06406967, 0.8313726, 0, 1, 1,
0.8365456, -0.3347816, 1.028888, 0.8352941, 0, 1, 1,
0.8377635, 1.154002, -0.5470771, 0.8431373, 0, 1, 1,
0.8378672, -0.1853381, 1.411254, 0.8470588, 0, 1, 1,
0.8402004, 0.7485454, 0.1567834, 0.854902, 0, 1, 1,
0.8452356, -1.312161, 3.97537, 0.8588235, 0, 1, 1,
0.850134, 0.04408064, -0.4654178, 0.8666667, 0, 1, 1,
0.8516229, -1.185141, 1.336246, 0.8705882, 0, 1, 1,
0.8561764, 0.382778, 0.7384585, 0.8784314, 0, 1, 1,
0.8584841, -2.175539, 2.819634, 0.8823529, 0, 1, 1,
0.858842, 0.03673349, 1.836351, 0.8901961, 0, 1, 1,
0.8623781, 0.9708326, 0.5363271, 0.8941177, 0, 1, 1,
0.8759972, 0.5066168, 0.3679368, 0.9019608, 0, 1, 1,
0.8814545, 0.5078306, 2.224868, 0.9098039, 0, 1, 1,
0.8886176, -0.4355039, 4.265178, 0.9137255, 0, 1, 1,
0.90359, 0.2881999, 1.223269, 0.9215686, 0, 1, 1,
0.9084641, -0.528632, 3.396097, 0.9254902, 0, 1, 1,
0.9121587, -0.583994, 2.33663, 0.9333333, 0, 1, 1,
0.9136327, 1.001469, 2.182153, 0.9372549, 0, 1, 1,
0.9146135, -1.617159, 3.270161, 0.945098, 0, 1, 1,
0.9157267, 1.682702, 0.1017453, 0.9490196, 0, 1, 1,
0.9160793, -0.4720521, 1.907366, 0.9568627, 0, 1, 1,
0.9184535, 0.3517474, 0.6552105, 0.9607843, 0, 1, 1,
0.920268, -0.7674663, 1.191552, 0.9686275, 0, 1, 1,
0.9210575, -0.1680542, 2.79235, 0.972549, 0, 1, 1,
0.923246, -0.4875651, 2.419667, 0.9803922, 0, 1, 1,
0.9245152, -1.130765, 1.842796, 0.9843137, 0, 1, 1,
0.9405195, -1.221379, 1.291808, 0.9921569, 0, 1, 1,
0.9434763, 0.9823683, -0.03135279, 0.9960784, 0, 1, 1,
0.9450762, 0.03000589, 2.288897, 1, 0, 0.9960784, 1,
0.9459095, 0.3265513, 1.900512, 1, 0, 0.9882353, 1,
0.9461219, -1.178753, 2.056276, 1, 0, 0.9843137, 1,
0.9472255, -1.330029, 3.361616, 1, 0, 0.9764706, 1,
0.9503567, 0.2455815, -0.8919294, 1, 0, 0.972549, 1,
0.9518732, 0.03603349, 0.6304551, 1, 0, 0.9647059, 1,
0.9573283, -1.200972, 4.22117, 1, 0, 0.9607843, 1,
0.9592984, -0.1892917, 1.083511, 1, 0, 0.9529412, 1,
0.9648137, -0.5121499, 1.095565, 1, 0, 0.9490196, 1,
0.9747708, 0.5835403, 1.08077, 1, 0, 0.9411765, 1,
0.9753821, 1.080996, 2.222776, 1, 0, 0.9372549, 1,
0.9842265, -0.2641074, 1.16652, 1, 0, 0.9294118, 1,
0.9859381, -0.2126903, 3.030261, 1, 0, 0.9254902, 1,
0.9863568, -0.9335119, 4.337968, 1, 0, 0.9176471, 1,
0.9900781, 0.4102608, 2.018197, 1, 0, 0.9137255, 1,
1.004548, 0.1725874, 0.9532144, 1, 0, 0.9058824, 1,
1.004683, -0.3673441, 3.596681, 1, 0, 0.9019608, 1,
1.006545, 1.7092, 1.255792, 1, 0, 0.8941177, 1,
1.006668, -0.5935889, 3.194806, 1, 0, 0.8862745, 1,
1.011658, 0.9561041, 0.3794744, 1, 0, 0.8823529, 1,
1.018025, 1.931586, -0.1998522, 1, 0, 0.8745098, 1,
1.027038, -0.1367362, 0.465455, 1, 0, 0.8705882, 1,
1.033978, -1.295, 1.470751, 1, 0, 0.8627451, 1,
1.036743, -0.05541592, 3.11729, 1, 0, 0.8588235, 1,
1.038478, -2.227065, 2.246217, 1, 0, 0.8509804, 1,
1.042166, -0.01927022, 1.657934, 1, 0, 0.8470588, 1,
1.04503, 0.7804983, 0.6261725, 1, 0, 0.8392157, 1,
1.046077, -1.28433, 3.575876, 1, 0, 0.8352941, 1,
1.0517, -0.7931259, 1.466036, 1, 0, 0.827451, 1,
1.053179, 0.4015583, 0.7679443, 1, 0, 0.8235294, 1,
1.066082, 1.446715, 0.3762955, 1, 0, 0.8156863, 1,
1.06643, 0.9430657, 0.2475574, 1, 0, 0.8117647, 1,
1.069816, 1.182511, -0.1348047, 1, 0, 0.8039216, 1,
1.073443, 0.01619873, 1.480196, 1, 0, 0.7960784, 1,
1.073774, 1.482792, 1.427916, 1, 0, 0.7921569, 1,
1.088512, 1.337117, -1.010372, 1, 0, 0.7843137, 1,
1.096801, -0.2453327, 0.2259118, 1, 0, 0.7803922, 1,
1.105173, 0.2324965, 2.372852, 1, 0, 0.772549, 1,
1.110807, -0.8830634, 1.744533, 1, 0, 0.7686275, 1,
1.117102, -1.417603, 1.647054, 1, 0, 0.7607843, 1,
1.131947, 0.3393038, -0.2042876, 1, 0, 0.7568628, 1,
1.134866, 0.1050895, -0.2365733, 1, 0, 0.7490196, 1,
1.135033, -0.04262287, 0.857105, 1, 0, 0.7450981, 1,
1.135205, -0.7596508, 1.573501, 1, 0, 0.7372549, 1,
1.137228, -1.611442, 3.991675, 1, 0, 0.7333333, 1,
1.141307, 1.918149, 0.318922, 1, 0, 0.7254902, 1,
1.147628, 1.406904, 0.9148046, 1, 0, 0.7215686, 1,
1.154794, 0.6360555, 2.813103, 1, 0, 0.7137255, 1,
1.160606, 0.8833149, -1.167495, 1, 0, 0.7098039, 1,
1.169157, -0.9407007, 3.849868, 1, 0, 0.7019608, 1,
1.176533, -0.5934166, 1.981876, 1, 0, 0.6941177, 1,
1.180925, -0.1580921, 0.5199363, 1, 0, 0.6901961, 1,
1.181516, 0.5694355, 2.051974, 1, 0, 0.682353, 1,
1.181752, 0.3876272, 0.32692, 1, 0, 0.6784314, 1,
1.184452, 1.507595, 0.4732278, 1, 0, 0.6705883, 1,
1.186144, 1.921687, 3.101244, 1, 0, 0.6666667, 1,
1.193897, -2.211516, 4.868805, 1, 0, 0.6588235, 1,
1.194264, 1.065036, -0.2654901, 1, 0, 0.654902, 1,
1.199803, -0.7053629, 0.301845, 1, 0, 0.6470588, 1,
1.208094, -1.515618, 0.6637166, 1, 0, 0.6431373, 1,
1.209126, 1.458869, -0.2292199, 1, 0, 0.6352941, 1,
1.20974, -1.760426, 3.562752, 1, 0, 0.6313726, 1,
1.212094, 0.0681067, 3.242378, 1, 0, 0.6235294, 1,
1.21493, 0.3832016, 2.676788, 1, 0, 0.6196079, 1,
1.22373, -0.8614372, 3.5702, 1, 0, 0.6117647, 1,
1.236497, -0.1589029, 2.030216, 1, 0, 0.6078432, 1,
1.24172, -0.2878479, 2.551933, 1, 0, 0.6, 1,
1.243937, -0.756376, 1.928086, 1, 0, 0.5921569, 1,
1.254789, -0.3758185, 2.510455, 1, 0, 0.5882353, 1,
1.258694, 0.04013677, 2.765194, 1, 0, 0.5803922, 1,
1.262615, 0.4802592, 0.987548, 1, 0, 0.5764706, 1,
1.262881, -2.659791, 4.548672, 1, 0, 0.5686275, 1,
1.262892, 0.8699326, 0.2555826, 1, 0, 0.5647059, 1,
1.271227, -0.8815696, 1.919266, 1, 0, 0.5568628, 1,
1.273247, 0.4973652, 2.395453, 1, 0, 0.5529412, 1,
1.273502, -0.5802834, 1.28485, 1, 0, 0.5450981, 1,
1.276358, 0.09514274, 1.522632, 1, 0, 0.5411765, 1,
1.289624, 0.7021889, 2.168402, 1, 0, 0.5333334, 1,
1.291708, 0.3996724, 1.115101, 1, 0, 0.5294118, 1,
1.307645, 0.4324301, 0.1081639, 1, 0, 0.5215687, 1,
1.310053, 0.4337647, 0.7359084, 1, 0, 0.5176471, 1,
1.318598, 0.5286142, 1.484336, 1, 0, 0.509804, 1,
1.320805, 1.129485, 1.116475, 1, 0, 0.5058824, 1,
1.335564, 0.5585102, 2.3123, 1, 0, 0.4980392, 1,
1.343502, -2.470784, 1.958205, 1, 0, 0.4901961, 1,
1.346275, -0.07070129, 3.31756, 1, 0, 0.4862745, 1,
1.348386, -0.3871571, 2.453004, 1, 0, 0.4784314, 1,
1.354986, -0.2574629, 2.481309, 1, 0, 0.4745098, 1,
1.37489, 0.8616098, 1.097372, 1, 0, 0.4666667, 1,
1.38451, 0.9217262, 0.8899331, 1, 0, 0.4627451, 1,
1.38531, -0.5401029, 1.549668, 1, 0, 0.454902, 1,
1.388486, -0.3874174, 2.108473, 1, 0, 0.4509804, 1,
1.391788, 0.4055929, 1.394888, 1, 0, 0.4431373, 1,
1.3922, 1.319569, 2.532017, 1, 0, 0.4392157, 1,
1.398025, 1.008463, -0.6518769, 1, 0, 0.4313726, 1,
1.402782, 0.9351704, 0.6269153, 1, 0, 0.427451, 1,
1.404858, -2.269475, 0.4959451, 1, 0, 0.4196078, 1,
1.405077, -0.8915641, 3.290639, 1, 0, 0.4156863, 1,
1.413308, 0.9740932, 0.4864164, 1, 0, 0.4078431, 1,
1.41488, -0.2744045, 1.38509, 1, 0, 0.4039216, 1,
1.42109, 0.9893606, 0.8984506, 1, 0, 0.3960784, 1,
1.42259, -0.06617608, 1.225025, 1, 0, 0.3882353, 1,
1.424536, 2.533072, 1.667375, 1, 0, 0.3843137, 1,
1.426496, 1.099718, -0.5606556, 1, 0, 0.3764706, 1,
1.429679, -1.416551, 1.499716, 1, 0, 0.372549, 1,
1.437452, -0.6183397, 1.266661, 1, 0, 0.3647059, 1,
1.43933, -0.7495311, 1.859544, 1, 0, 0.3607843, 1,
1.449296, 0.1379496, -0.00478098, 1, 0, 0.3529412, 1,
1.453834, -0.2679183, 1.86682, 1, 0, 0.3490196, 1,
1.457773, -0.3120379, -0.03434926, 1, 0, 0.3411765, 1,
1.465903, 0.8258526, 0.9824643, 1, 0, 0.3372549, 1,
1.485041, -0.5567587, 3.728716, 1, 0, 0.3294118, 1,
1.492628, -0.07060441, 1.607858, 1, 0, 0.3254902, 1,
1.511062, -0.5871029, 1.547234, 1, 0, 0.3176471, 1,
1.535372, 0.4919016, 0.4318962, 1, 0, 0.3137255, 1,
1.542901, 0.6246496, 2.727633, 1, 0, 0.3058824, 1,
1.546402, 0.6212079, 1.641935, 1, 0, 0.2980392, 1,
1.552892, 0.09727026, 1.75754, 1, 0, 0.2941177, 1,
1.555208, 0.5278304, 1.788587, 1, 0, 0.2862745, 1,
1.560038, -0.07135431, 1.264118, 1, 0, 0.282353, 1,
1.57363, 0.8559545, -0.007301894, 1, 0, 0.2745098, 1,
1.576301, -1.468486, 1.004985, 1, 0, 0.2705882, 1,
1.590944, -1.859878, 3.192577, 1, 0, 0.2627451, 1,
1.591581, 0.4044584, 1.967773, 1, 0, 0.2588235, 1,
1.592269, -1.214236, 2.538135, 1, 0, 0.2509804, 1,
1.609084, 1.5338, 1.840825, 1, 0, 0.2470588, 1,
1.613385, 0.190686, 2.598644, 1, 0, 0.2392157, 1,
1.615074, -1.785723, 0.989458, 1, 0, 0.2352941, 1,
1.617408, 0.8825654, 1.633599, 1, 0, 0.227451, 1,
1.63179, -1.425408, 1.194643, 1, 0, 0.2235294, 1,
1.632133, -1.318377, 2.139303, 1, 0, 0.2156863, 1,
1.638973, -0.1007453, 1.178964, 1, 0, 0.2117647, 1,
1.644261, 1.586946, 1.807542, 1, 0, 0.2039216, 1,
1.661631, -2.354059, 3.538386, 1, 0, 0.1960784, 1,
1.68831, 1.366162, 1.065853, 1, 0, 0.1921569, 1,
1.700713, 0.4088348, 1.244059, 1, 0, 0.1843137, 1,
1.701298, 1.481931, 1.036855, 1, 0, 0.1803922, 1,
1.705751, -0.4596463, 0.07610107, 1, 0, 0.172549, 1,
1.709662, -0.6793093, 2.43964, 1, 0, 0.1686275, 1,
1.739752, -1.120996, 4.795693, 1, 0, 0.1607843, 1,
1.74668, -2.360358, 0.9637594, 1, 0, 0.1568628, 1,
1.789984, -0.07385223, 2.075211, 1, 0, 0.1490196, 1,
1.794321, 0.6041182, 1.1979, 1, 0, 0.145098, 1,
1.802642, -2.159329, 3.324868, 1, 0, 0.1372549, 1,
1.861706, 1.82492, 0.3432437, 1, 0, 0.1333333, 1,
1.875, 0.4564751, 2.231398, 1, 0, 0.1254902, 1,
1.892429, 0.2954645, 0.1749581, 1, 0, 0.1215686, 1,
1.892596, 0.6479477, -0.05842965, 1, 0, 0.1137255, 1,
1.930025, 0.7043868, 3.348652, 1, 0, 0.1098039, 1,
1.934212, -0.6410549, 2.009506, 1, 0, 0.1019608, 1,
1.979712, 0.08402357, -0.3950668, 1, 0, 0.09411765, 1,
2.022051, -1.537223, 2.285545, 1, 0, 0.09019608, 1,
2.02975, -0.9785278, 1.859302, 1, 0, 0.08235294, 1,
2.033268, 0.2307123, 3.399683, 1, 0, 0.07843138, 1,
2.04333, 0.221081, 1.69782, 1, 0, 0.07058824, 1,
2.05693, 1.674376, -0.3511013, 1, 0, 0.06666667, 1,
2.104756, 0.6708348, 0.5553675, 1, 0, 0.05882353, 1,
2.124501, -0.2984475, 1.232597, 1, 0, 0.05490196, 1,
2.149398, -0.5737744, 2.329106, 1, 0, 0.04705882, 1,
2.15447, 0.1419042, 0.7037117, 1, 0, 0.04313726, 1,
2.155349, -1.196161, 2.761894, 1, 0, 0.03529412, 1,
2.221741, -0.6664571, 1.622475, 1, 0, 0.03137255, 1,
2.228225, 1.770422, 1.582218, 1, 0, 0.02352941, 1,
2.231758, -1.007474, 1.581144, 1, 0, 0.01960784, 1,
2.378008, -0.3418341, 2.29166, 1, 0, 0.01176471, 1,
2.420062, 0.5065538, -0.5707462, 1, 0, 0.007843138, 1
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
-0.573193, -4.163021, -7.219319, 0, -0.5, 0.5, 0.5,
-0.573193, -4.163021, -7.219319, 1, -0.5, 0.5, 0.5,
-0.573193, -4.163021, -7.219319, 1, 1.5, 0.5, 0.5,
-0.573193, -4.163021, -7.219319, 0, 1.5, 0.5, 0.5
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
-4.581161, -0.3287493, -7.219319, 0, -0.5, 0.5, 0.5,
-4.581161, -0.3287493, -7.219319, 1, -0.5, 0.5, 0.5,
-4.581161, -0.3287493, -7.219319, 1, 1.5, 0.5, 0.5,
-4.581161, -0.3287493, -7.219319, 0, 1.5, 0.5, 0.5
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
-4.581161, -4.163021, 0.01718187, 0, -0.5, 0.5, 0.5,
-4.581161, -4.163021, 0.01718187, 1, -0.5, 0.5, 0.5,
-4.581161, -4.163021, 0.01718187, 1, 1.5, 0.5, 0.5,
-4.581161, -4.163021, 0.01718187, 0, 1.5, 0.5, 0.5
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
-3, -3.278189, -5.549357,
2, -3.278189, -5.549357,
-3, -3.278189, -5.549357,
-3, -3.425661, -5.827684,
-2, -3.278189, -5.549357,
-2, -3.425661, -5.827684,
-1, -3.278189, -5.549357,
-1, -3.425661, -5.827684,
0, -3.278189, -5.549357,
0, -3.425661, -5.827684,
1, -3.278189, -5.549357,
1, -3.425661, -5.827684,
2, -3.278189, -5.549357,
2, -3.425661, -5.827684
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
-3, -3.720605, -6.384338, 0, -0.5, 0.5, 0.5,
-3, -3.720605, -6.384338, 1, -0.5, 0.5, 0.5,
-3, -3.720605, -6.384338, 1, 1.5, 0.5, 0.5,
-3, -3.720605, -6.384338, 0, 1.5, 0.5, 0.5,
-2, -3.720605, -6.384338, 0, -0.5, 0.5, 0.5,
-2, -3.720605, -6.384338, 1, -0.5, 0.5, 0.5,
-2, -3.720605, -6.384338, 1, 1.5, 0.5, 0.5,
-2, -3.720605, -6.384338, 0, 1.5, 0.5, 0.5,
-1, -3.720605, -6.384338, 0, -0.5, 0.5, 0.5,
-1, -3.720605, -6.384338, 1, -0.5, 0.5, 0.5,
-1, -3.720605, -6.384338, 1, 1.5, 0.5, 0.5,
-1, -3.720605, -6.384338, 0, 1.5, 0.5, 0.5,
0, -3.720605, -6.384338, 0, -0.5, 0.5, 0.5,
0, -3.720605, -6.384338, 1, -0.5, 0.5, 0.5,
0, -3.720605, -6.384338, 1, 1.5, 0.5, 0.5,
0, -3.720605, -6.384338, 0, 1.5, 0.5, 0.5,
1, -3.720605, -6.384338, 0, -0.5, 0.5, 0.5,
1, -3.720605, -6.384338, 1, -0.5, 0.5, 0.5,
1, -3.720605, -6.384338, 1, 1.5, 0.5, 0.5,
1, -3.720605, -6.384338, 0, 1.5, 0.5, 0.5,
2, -3.720605, -6.384338, 0, -0.5, 0.5, 0.5,
2, -3.720605, -6.384338, 1, -0.5, 0.5, 0.5,
2, -3.720605, -6.384338, 1, 1.5, 0.5, 0.5,
2, -3.720605, -6.384338, 0, 1.5, 0.5, 0.5
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
-3.656245, -3, -5.549357,
-3.656245, 2, -5.549357,
-3.656245, -3, -5.549357,
-3.810398, -3, -5.827684,
-3.656245, -2, -5.549357,
-3.810398, -2, -5.827684,
-3.656245, -1, -5.549357,
-3.810398, -1, -5.827684,
-3.656245, 0, -5.549357,
-3.810398, 0, -5.827684,
-3.656245, 1, -5.549357,
-3.810398, 1, -5.827684,
-3.656245, 2, -5.549357,
-3.810398, 2, -5.827684
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
-4.118703, -3, -6.384338, 0, -0.5, 0.5, 0.5,
-4.118703, -3, -6.384338, 1, -0.5, 0.5, 0.5,
-4.118703, -3, -6.384338, 1, 1.5, 0.5, 0.5,
-4.118703, -3, -6.384338, 0, 1.5, 0.5, 0.5,
-4.118703, -2, -6.384338, 0, -0.5, 0.5, 0.5,
-4.118703, -2, -6.384338, 1, -0.5, 0.5, 0.5,
-4.118703, -2, -6.384338, 1, 1.5, 0.5, 0.5,
-4.118703, -2, -6.384338, 0, 1.5, 0.5, 0.5,
-4.118703, -1, -6.384338, 0, -0.5, 0.5, 0.5,
-4.118703, -1, -6.384338, 1, -0.5, 0.5, 0.5,
-4.118703, -1, -6.384338, 1, 1.5, 0.5, 0.5,
-4.118703, -1, -6.384338, 0, 1.5, 0.5, 0.5,
-4.118703, 0, -6.384338, 0, -0.5, 0.5, 0.5,
-4.118703, 0, -6.384338, 1, -0.5, 0.5, 0.5,
-4.118703, 0, -6.384338, 1, 1.5, 0.5, 0.5,
-4.118703, 0, -6.384338, 0, 1.5, 0.5, 0.5,
-4.118703, 1, -6.384338, 0, -0.5, 0.5, 0.5,
-4.118703, 1, -6.384338, 1, -0.5, 0.5, 0.5,
-4.118703, 1, -6.384338, 1, 1.5, 0.5, 0.5,
-4.118703, 1, -6.384338, 0, 1.5, 0.5, 0.5,
-4.118703, 2, -6.384338, 0, -0.5, 0.5, 0.5,
-4.118703, 2, -6.384338, 1, -0.5, 0.5, 0.5,
-4.118703, 2, -6.384338, 1, 1.5, 0.5, 0.5,
-4.118703, 2, -6.384338, 0, 1.5, 0.5, 0.5
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
-3.656245, -3.278189, -4,
-3.656245, -3.278189, 4,
-3.656245, -3.278189, -4,
-3.810398, -3.425661, -4,
-3.656245, -3.278189, -2,
-3.810398, -3.425661, -2,
-3.656245, -3.278189, 0,
-3.810398, -3.425661, 0,
-3.656245, -3.278189, 2,
-3.810398, -3.425661, 2,
-3.656245, -3.278189, 4,
-3.810398, -3.425661, 4
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
-4.118703, -3.720605, -4, 0, -0.5, 0.5, 0.5,
-4.118703, -3.720605, -4, 1, -0.5, 0.5, 0.5,
-4.118703, -3.720605, -4, 1, 1.5, 0.5, 0.5,
-4.118703, -3.720605, -4, 0, 1.5, 0.5, 0.5,
-4.118703, -3.720605, -2, 0, -0.5, 0.5, 0.5,
-4.118703, -3.720605, -2, 1, -0.5, 0.5, 0.5,
-4.118703, -3.720605, -2, 1, 1.5, 0.5, 0.5,
-4.118703, -3.720605, -2, 0, 1.5, 0.5, 0.5,
-4.118703, -3.720605, 0, 0, -0.5, 0.5, 0.5,
-4.118703, -3.720605, 0, 1, -0.5, 0.5, 0.5,
-4.118703, -3.720605, 0, 1, 1.5, 0.5, 0.5,
-4.118703, -3.720605, 0, 0, 1.5, 0.5, 0.5,
-4.118703, -3.720605, 2, 0, -0.5, 0.5, 0.5,
-4.118703, -3.720605, 2, 1, -0.5, 0.5, 0.5,
-4.118703, -3.720605, 2, 1, 1.5, 0.5, 0.5,
-4.118703, -3.720605, 2, 0, 1.5, 0.5, 0.5,
-4.118703, -3.720605, 4, 0, -0.5, 0.5, 0.5,
-4.118703, -3.720605, 4, 1, -0.5, 0.5, 0.5,
-4.118703, -3.720605, 4, 1, 1.5, 0.5, 0.5,
-4.118703, -3.720605, 4, 0, 1.5, 0.5, 0.5
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
-3.656245, -3.278189, -5.549357,
-3.656245, 2.62069, -5.549357,
-3.656245, -3.278189, 5.583721,
-3.656245, 2.62069, 5.583721,
-3.656245, -3.278189, -5.549357,
-3.656245, -3.278189, 5.583721,
-3.656245, 2.62069, -5.549357,
-3.656245, 2.62069, 5.583721,
-3.656245, -3.278189, -5.549357,
2.50986, -3.278189, -5.549357,
-3.656245, -3.278189, 5.583721,
2.50986, -3.278189, 5.583721,
-3.656245, 2.62069, -5.549357,
2.50986, 2.62069, -5.549357,
-3.656245, 2.62069, 5.583721,
2.50986, 2.62069, 5.583721,
2.50986, -3.278189, -5.549357,
2.50986, 2.62069, -5.549357,
2.50986, -3.278189, 5.583721,
2.50986, 2.62069, 5.583721,
2.50986, -3.278189, -5.549357,
2.50986, -3.278189, 5.583721,
2.50986, 2.62069, -5.549357,
2.50986, 2.62069, 5.583721
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
var radius = 7.490266;
var distance = 33.32504;
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
mvMatrix.translate( 0.573193, 0.3287493, -0.01718187 );
mvMatrix.scale( 1.31341, 1.372909, 0.7274379 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.32504);
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
Ethylenethiourea<-read.table("Ethylenethiourea.xyz")
```

```
## Error in read.table("Ethylenethiourea.xyz"): no lines available in input
```

```r
x<-Ethylenethiourea$V2
```

```
## Error in eval(expr, envir, enclos): object 'Ethylenethiourea' not found
```

```r
y<-Ethylenethiourea$V3
```

```
## Error in eval(expr, envir, enclos): object 'Ethylenethiourea' not found
```

```r
z<-Ethylenethiourea$V4
```

```
## Error in eval(expr, envir, enclos): object 'Ethylenethiourea' not found
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
-3.566448, 1.021299, -0.9335068, 0, 0, 1, 1, 1,
-3.267145, 0.3616187, -0.8426177, 1, 0, 0, 1, 1,
-3.018466, 0.1813262, 0.2529406, 1, 0, 0, 1, 1,
-2.941581, 0.8456277, -1.953959, 1, 0, 0, 1, 1,
-2.751271, -1.822038, -2.378585, 1, 0, 0, 1, 1,
-2.717086, -0.8920572, -2.193573, 1, 0, 0, 1, 1,
-2.622804, 1.109797, -0.6840667, 0, 0, 0, 1, 1,
-2.569761, 0.5851294, -1.997865, 0, 0, 0, 1, 1,
-2.507965, -2.024514, -0.9079095, 0, 0, 0, 1, 1,
-2.438655, 0.9919484, -2.608737, 0, 0, 0, 1, 1,
-2.395283, 0.9743434, -1.195676, 0, 0, 0, 1, 1,
-2.239993, -0.3575462, -1.598365, 0, 0, 0, 1, 1,
-2.235696, 0.1460356, -1.62563, 0, 0, 0, 1, 1,
-2.206394, 0.4165172, 0.1469382, 1, 1, 1, 1, 1,
-2.166549, 0.06575187, -1.440894, 1, 1, 1, 1, 1,
-2.142651, -1.347189, -2.905339, 1, 1, 1, 1, 1,
-2.098332, 1.353747, -1.83687, 1, 1, 1, 1, 1,
-2.098155, 0.2840423, -0.06315299, 1, 1, 1, 1, 1,
-2.041138, -0.8959913, -2.772492, 1, 1, 1, 1, 1,
-2.039145, -0.03756473, -0.0102435, 1, 1, 1, 1, 1,
-1.984545, -0.6885878, -1.523007, 1, 1, 1, 1, 1,
-1.957065, 1.294312, 0.509718, 1, 1, 1, 1, 1,
-1.899568, -1.023534, -2.911477, 1, 1, 1, 1, 1,
-1.885666, -0.4682526, -0.5506172, 1, 1, 1, 1, 1,
-1.86591, 1.987789, -0.8627526, 1, 1, 1, 1, 1,
-1.861413, 0.5303102, -1.322365, 1, 1, 1, 1, 1,
-1.846907, 0.2143288, -0.6743323, 1, 1, 1, 1, 1,
-1.84339, 0.5718912, -0.03518731, 1, 1, 1, 1, 1,
-1.779428, 0.2493594, -0.4308857, 0, 0, 1, 1, 1,
-1.741378, 1.527401, -0.4831001, 1, 0, 0, 1, 1,
-1.740964, -1.45508, -0.4358607, 1, 0, 0, 1, 1,
-1.7209, 0.9123996, -1.464852, 1, 0, 0, 1, 1,
-1.714263, -0.8141683, -2.659113, 1, 0, 0, 1, 1,
-1.714046, 0.9975075, -0.1332546, 1, 0, 0, 1, 1,
-1.68012, 0.4436094, -3.585935, 0, 0, 0, 1, 1,
-1.666569, -0.2290313, -0.7845613, 0, 0, 0, 1, 1,
-1.663984, 0.1054245, -1.801884, 0, 0, 0, 1, 1,
-1.655706, 0.7334762, -1.515143, 0, 0, 0, 1, 1,
-1.647496, -0.7217609, -3.596502, 0, 0, 0, 1, 1,
-1.61009, 1.080818, 0.3104474, 0, 0, 0, 1, 1,
-1.605886, 0.07040013, -0.5519943, 0, 0, 0, 1, 1,
-1.592073, -0.6439269, -0.2665526, 1, 1, 1, 1, 1,
-1.587725, 1.040765, -1.641743, 1, 1, 1, 1, 1,
-1.585615, -0.8942955, -1.954804, 1, 1, 1, 1, 1,
-1.579776, -1.369172, -2.116205, 1, 1, 1, 1, 1,
-1.567604, 1.403778, -0.01683191, 1, 1, 1, 1, 1,
-1.546057, -0.9814308, -2.377838, 1, 1, 1, 1, 1,
-1.525131, 1.110091, -0.7235172, 1, 1, 1, 1, 1,
-1.525115, -0.3186477, -3.569779, 1, 1, 1, 1, 1,
-1.522776, -0.3903565, -3.27165, 1, 1, 1, 1, 1,
-1.520515, -0.2411707, -2.586257, 1, 1, 1, 1, 1,
-1.506761, 0.4935949, -0.1472154, 1, 1, 1, 1, 1,
-1.496605, -1.691102, -1.80672, 1, 1, 1, 1, 1,
-1.483615, 0.8843161, -1.908885, 1, 1, 1, 1, 1,
-1.480957, 0.3727779, -1.186901, 1, 1, 1, 1, 1,
-1.475598, -0.3179267, -1.182459, 1, 1, 1, 1, 1,
-1.472516, 0.1458861, -0.6402312, 0, 0, 1, 1, 1,
-1.472354, 1.534709, -0.4045742, 1, 0, 0, 1, 1,
-1.459998, -2.417114, -2.799077, 1, 0, 0, 1, 1,
-1.45036, 0.01045798, -0.001326625, 1, 0, 0, 1, 1,
-1.427902, -0.301463, -0.6389752, 1, 0, 0, 1, 1,
-1.419912, 1.205176, 0.0799004, 1, 0, 0, 1, 1,
-1.399571, -1.459229, -3.714414, 0, 0, 0, 1, 1,
-1.383206, -1.088653, -1.13448, 0, 0, 0, 1, 1,
-1.369108, 1.710627, 0.6528608, 0, 0, 0, 1, 1,
-1.366086, -0.5677477, -3.842973, 0, 0, 0, 1, 1,
-1.363941, 0.6791473, -0.988959, 0, 0, 0, 1, 1,
-1.342587, 0.6704292, -1.908453, 0, 0, 0, 1, 1,
-1.339079, -1.233649, -1.940063, 0, 0, 0, 1, 1,
-1.321866, 0.7434665, -0.6859215, 1, 1, 1, 1, 1,
-1.319848, 1.233905, -0.3439358, 1, 1, 1, 1, 1,
-1.311834, -0.2063304, -0.07581301, 1, 1, 1, 1, 1,
-1.299438, -0.9363441, -2.165784, 1, 1, 1, 1, 1,
-1.29866, -0.02747608, 0.01990898, 1, 1, 1, 1, 1,
-1.297317, 2.232203, 0.860333, 1, 1, 1, 1, 1,
-1.294103, -0.3775653, -2.171967, 1, 1, 1, 1, 1,
-1.285389, 1.391667, -2.624802, 1, 1, 1, 1, 1,
-1.280925, -1.987017, -1.883813, 1, 1, 1, 1, 1,
-1.28092, -1.930133, -2.124094, 1, 1, 1, 1, 1,
-1.26721, -1.56424, -2.617316, 1, 1, 1, 1, 1,
-1.258618, -0.8950759, -3.141676, 1, 1, 1, 1, 1,
-1.248649, -0.6108946, -2.135295, 1, 1, 1, 1, 1,
-1.236563, -1.68708, -3.381437, 1, 1, 1, 1, 1,
-1.234839, 0.2077381, -0.8975933, 1, 1, 1, 1, 1,
-1.233358, -1.246476, -1.793362, 0, 0, 1, 1, 1,
-1.231786, 0.8459834, -1.150765, 1, 0, 0, 1, 1,
-1.226941, -0.6592477, -1.775987, 1, 0, 0, 1, 1,
-1.204029, -0.6676886, -2.622218, 1, 0, 0, 1, 1,
-1.196951, 1.555932, 0.6008327, 1, 0, 0, 1, 1,
-1.195521, 0.769184, -0.8686805, 1, 0, 0, 1, 1,
-1.191517, -1.024899, -3.164737, 0, 0, 0, 1, 1,
-1.185575, -1.52895, -2.48604, 0, 0, 0, 1, 1,
-1.183866, -0.5147166, -0.364943, 0, 0, 0, 1, 1,
-1.172169, 0.6671899, -1.432654, 0, 0, 0, 1, 1,
-1.1713, 1.093763, -1.703372, 0, 0, 0, 1, 1,
-1.156562, -0.3841182, -1.407965, 0, 0, 0, 1, 1,
-1.153117, -1.435546, -1.651722, 0, 0, 0, 1, 1,
-1.152621, -1.615823, -0.8055693, 1, 1, 1, 1, 1,
-1.148018, 0.3265949, -0.8340943, 1, 1, 1, 1, 1,
-1.142036, 0.06787387, -0.5982679, 1, 1, 1, 1, 1,
-1.139897, -1.206626, -4.550532, 1, 1, 1, 1, 1,
-1.136895, 1.024254, -0.3837505, 1, 1, 1, 1, 1,
-1.127978, -1.776303, -2.972863, 1, 1, 1, 1, 1,
-1.126484, 1.046359, 0.1279765, 1, 1, 1, 1, 1,
-1.11678, 0.3041003, -0.5117262, 1, 1, 1, 1, 1,
-1.115986, 0.1421752, 0.6790311, 1, 1, 1, 1, 1,
-1.115776, -1.565184, -3.859946, 1, 1, 1, 1, 1,
-1.112839, -0.5934942, -2.274633, 1, 1, 1, 1, 1,
-1.11255, 0.8443709, -1.117079, 1, 1, 1, 1, 1,
-1.107958, -0.3890204, -3.874999, 1, 1, 1, 1, 1,
-1.08732, 0.1125599, -0.6125278, 1, 1, 1, 1, 1,
-1.084744, 1.747677, -0.7634131, 1, 1, 1, 1, 1,
-1.083131, 0.07954048, -1.777874, 0, 0, 1, 1, 1,
-1.082782, -1.076559, -1.554912, 1, 0, 0, 1, 1,
-1.077959, 1.400517, -0.6126611, 1, 0, 0, 1, 1,
-1.07484, -0.9914137, -2.289024, 1, 0, 0, 1, 1,
-1.070991, -0.9522947, -0.8785356, 1, 0, 0, 1, 1,
-1.069849, -0.301992, -3.625023, 1, 0, 0, 1, 1,
-1.06626, -0.677431, -2.065063, 0, 0, 0, 1, 1,
-1.064882, 1.49365, -1.17618, 0, 0, 0, 1, 1,
-1.057415, 0.4588297, -0.9916593, 0, 0, 0, 1, 1,
-1.049519, 0.7442889, 0.6884347, 0, 0, 0, 1, 1,
-1.045756, -0.6774378, -2.438852, 0, 0, 0, 1, 1,
-1.045122, -3.192283, -3.284796, 0, 0, 0, 1, 1,
-1.044526, -0.1575782, -0.8809203, 0, 0, 0, 1, 1,
-1.041557, 1.129179, -0.3955472, 1, 1, 1, 1, 1,
-1.04154, 0.7763125, -0.6389734, 1, 1, 1, 1, 1,
-1.037276, -0.77565, -0.6451156, 1, 1, 1, 1, 1,
-1.031538, -1.110557, -3.108329, 1, 1, 1, 1, 1,
-1.029351, -0.3769219, -1.523362, 1, 1, 1, 1, 1,
-1.028589, -2.255936, -3.39731, 1, 1, 1, 1, 1,
-1.024119, -0.09666492, -0.9044096, 1, 1, 1, 1, 1,
-1.022292, -0.773985, -4.056964, 1, 1, 1, 1, 1,
-1.010483, -1.251505, -1.742851, 1, 1, 1, 1, 1,
-1.009472, 0.1071938, -0.4291773, 1, 1, 1, 1, 1,
-1.008992, -2.128589, -2.961635, 1, 1, 1, 1, 1,
-1.004019, 0.1953079, -1.556293, 1, 1, 1, 1, 1,
-0.9988238, -1.759484, -3.037094, 1, 1, 1, 1, 1,
-0.9937291, -0.2501417, -1.34359, 1, 1, 1, 1, 1,
-0.9935905, -0.1963775, -2.188955, 1, 1, 1, 1, 1,
-0.9928337, -1.008307, -2.533048, 0, 0, 1, 1, 1,
-0.9868982, 0.006568466, -3.07242, 1, 0, 0, 1, 1,
-0.985649, 0.6858155, -2.992689, 1, 0, 0, 1, 1,
-0.9839687, -1.225873, -2.271405, 1, 0, 0, 1, 1,
-0.9821088, -1.129565, -1.025322, 1, 0, 0, 1, 1,
-0.9792285, -0.7268719, -3.430904, 1, 0, 0, 1, 1,
-0.9652028, -0.1613873, -2.125766, 0, 0, 0, 1, 1,
-0.9651051, -1.085542, -3.418757, 0, 0, 0, 1, 1,
-0.9495717, 1.242439, -1.360888, 0, 0, 0, 1, 1,
-0.9481246, 0.9255343, -1.301173, 0, 0, 0, 1, 1,
-0.9467037, -0.01788038, -1.414079, 0, 0, 0, 1, 1,
-0.9463285, 0.8761017, 0.8131432, 0, 0, 0, 1, 1,
-0.9454734, -0.09751587, -1.740138, 0, 0, 0, 1, 1,
-0.9452727, 1.028403, 1.28492, 1, 1, 1, 1, 1,
-0.9387079, -1.144194, -1.759957, 1, 1, 1, 1, 1,
-0.937396, -0.19368, -1.480654, 1, 1, 1, 1, 1,
-0.9350572, 1.590174, 0.9649712, 1, 1, 1, 1, 1,
-0.9335282, -1.104701, -3.901918, 1, 1, 1, 1, 1,
-0.9333616, 0.3045533, -0.5118322, 1, 1, 1, 1, 1,
-0.9305178, 2.382011, -2.027594, 1, 1, 1, 1, 1,
-0.9262452, 0.6997289, 1.07508, 1, 1, 1, 1, 1,
-0.9163834, 0.5300719, -1.53637, 1, 1, 1, 1, 1,
-0.9150461, 0.6388774, -2.382119, 1, 1, 1, 1, 1,
-0.9145559, -1.039724, -1.007555, 1, 1, 1, 1, 1,
-0.9042236, -0.1043347, -2.80277, 1, 1, 1, 1, 1,
-0.8977848, -0.6635451, -1.368512, 1, 1, 1, 1, 1,
-0.8955395, -0.4634635, -0.9093941, 1, 1, 1, 1, 1,
-0.8937993, 0.1507219, 0.2035544, 1, 1, 1, 1, 1,
-0.8935613, 0.3173469, -1.137404, 0, 0, 1, 1, 1,
-0.892457, 0.443195, -1.524653, 1, 0, 0, 1, 1,
-0.8864391, 0.615545, -0.6794538, 1, 0, 0, 1, 1,
-0.884946, 2.447, -0.5985804, 1, 0, 0, 1, 1,
-0.8807306, 0.3872473, -0.6586208, 1, 0, 0, 1, 1,
-0.8799552, 1.209671, -1.177043, 1, 0, 0, 1, 1,
-0.8779234, -0.4728322, -2.654634, 0, 0, 0, 1, 1,
-0.87734, 0.278398, -2.30944, 0, 0, 0, 1, 1,
-0.8765475, 0.49833, -1.897975, 0, 0, 0, 1, 1,
-0.8720621, -1.000768, -2.036103, 0, 0, 0, 1, 1,
-0.8678465, -0.0806181, -0.3744307, 0, 0, 0, 1, 1,
-0.8505221, -0.4587926, -0.5531201, 0, 0, 0, 1, 1,
-0.8495108, 2.360558, 1.249652, 0, 0, 0, 1, 1,
-0.8486643, -1.35131, -2.303801, 1, 1, 1, 1, 1,
-0.8467846, -1.022704, -1.901393, 1, 1, 1, 1, 1,
-0.8459348, 0.3245984, -1.94925, 1, 1, 1, 1, 1,
-0.842534, 0.9681891, -0.9600408, 1, 1, 1, 1, 1,
-0.8389577, 0.9549571, 0.2244337, 1, 1, 1, 1, 1,
-0.8324772, 1.210575, 0.7126313, 1, 1, 1, 1, 1,
-0.8234834, 0.5515274, 0.8084785, 1, 1, 1, 1, 1,
-0.8220761, -1.563732, -1.42102, 1, 1, 1, 1, 1,
-0.8220637, 0.09023852, -1.261838, 1, 1, 1, 1, 1,
-0.8154169, -1.337208, -4.285903, 1, 1, 1, 1, 1,
-0.8116562, 1.042272, 0.8442057, 1, 1, 1, 1, 1,
-0.810423, 1.256541, -1.274447, 1, 1, 1, 1, 1,
-0.8093751, 0.3301204, -0.004845607, 1, 1, 1, 1, 1,
-0.8007293, 0.7341664, -0.8516725, 1, 1, 1, 1, 1,
-0.8001933, 1.239526, -1.061746, 1, 1, 1, 1, 1,
-0.7997231, -0.3511887, -1.117, 0, 0, 1, 1, 1,
-0.7984958, 0.7537388, -1.56741, 1, 0, 0, 1, 1,
-0.796216, 0.5242107, -0.5049083, 1, 0, 0, 1, 1,
-0.794018, 1.949244, 0.6861131, 1, 0, 0, 1, 1,
-0.7933425, 1.550104, -2.454724, 1, 0, 0, 1, 1,
-0.791194, -1.349509, -3.489808, 1, 0, 0, 1, 1,
-0.7897394, 0.3131371, -3.544621, 0, 0, 0, 1, 1,
-0.7890758, 0.3899706, -1.903033, 0, 0, 0, 1, 1,
-0.7890001, 0.3868808, 0.5838198, 0, 0, 0, 1, 1,
-0.788054, -0.4423654, -3.091199, 0, 0, 0, 1, 1,
-0.785386, -0.4924463, -2.887479, 0, 0, 0, 1, 1,
-0.784691, -0.1865643, -0.3230963, 0, 0, 0, 1, 1,
-0.783263, -2.310073, -2.336507, 0, 0, 0, 1, 1,
-0.7820084, -1.377144, -2.773325, 1, 1, 1, 1, 1,
-0.7787167, 0.5289659, -0.1156805, 1, 1, 1, 1, 1,
-0.7769516, -2.011824, -1.046509, 1, 1, 1, 1, 1,
-0.7763054, 0.8982522, -0.9059632, 1, 1, 1, 1, 1,
-0.7759553, -0.9636561, -2.907514, 1, 1, 1, 1, 1,
-0.7691992, 0.5217356, -0.517207, 1, 1, 1, 1, 1,
-0.7675387, -0.007357948, -1.67158, 1, 1, 1, 1, 1,
-0.7647054, -0.5122865, -2.06715, 1, 1, 1, 1, 1,
-0.762868, -0.7463475, -2.254955, 1, 1, 1, 1, 1,
-0.7599932, -0.3052797, -0.3080344, 1, 1, 1, 1, 1,
-0.7556558, -0.6684368, -1.795319, 1, 1, 1, 1, 1,
-0.752831, -0.2643321, -2.968344, 1, 1, 1, 1, 1,
-0.752327, -1.089047, -2.425956, 1, 1, 1, 1, 1,
-0.7520991, -1.035136, -3.852493, 1, 1, 1, 1, 1,
-0.7518201, -0.3428224, -1.373939, 1, 1, 1, 1, 1,
-0.7505912, 0.7025777, -1.329047, 0, 0, 1, 1, 1,
-0.7419677, -0.4389731, -1.006006, 1, 0, 0, 1, 1,
-0.7408206, 0.9862345, -1.735977, 1, 0, 0, 1, 1,
-0.7402382, -0.09334555, -2.198533, 1, 0, 0, 1, 1,
-0.7365595, -0.3283312, -1.798701, 1, 0, 0, 1, 1,
-0.7323314, 0.6126816, -1.741962, 1, 0, 0, 1, 1,
-0.7321563, 0.6807842, 2.430392, 0, 0, 0, 1, 1,
-0.7312075, -0.8031623, -0.5719299, 0, 0, 0, 1, 1,
-0.7295895, 0.6361052, -1.684173, 0, 0, 0, 1, 1,
-0.7084767, 1.172661, -1.355417, 0, 0, 0, 1, 1,
-0.7080327, -0.1242917, -0.3137728, 0, 0, 0, 1, 1,
-0.7070571, 0.7106408, -0.4054156, 0, 0, 0, 1, 1,
-0.7043316, 0.6024952, -1.512985, 0, 0, 0, 1, 1,
-0.7041218, -0.2901077, -1.78807, 1, 1, 1, 1, 1,
-0.7025548, 0.1885117, -0.7065133, 1, 1, 1, 1, 1,
-0.7015204, 0.707799, -1.492069, 1, 1, 1, 1, 1,
-0.6989824, 1.378523, -1.247043, 1, 1, 1, 1, 1,
-0.6971638, 0.3903297, -0.715072, 1, 1, 1, 1, 1,
-0.6946139, 0.8939213, -0.7456481, 1, 1, 1, 1, 1,
-0.6924022, 0.8244098, -1.378724, 1, 1, 1, 1, 1,
-0.6893134, -0.5572924, -3.538687, 1, 1, 1, 1, 1,
-0.6842924, -0.4297416, -2.822669, 1, 1, 1, 1, 1,
-0.6746913, 0.001290562, -1.800374, 1, 1, 1, 1, 1,
-0.6742442, 2.534784, 1.848078, 1, 1, 1, 1, 1,
-0.6734232, 0.4028962, 0.1384239, 1, 1, 1, 1, 1,
-0.670908, 0.700544, -0.7399539, 1, 1, 1, 1, 1,
-0.6690922, -0.3321179, -0.4777457, 1, 1, 1, 1, 1,
-0.6666385, 0.9079829, -2.409892, 1, 1, 1, 1, 1,
-0.6648509, -1.609519, -1.159006, 0, 0, 1, 1, 1,
-0.6618536, -0.8881816, -2.723159, 1, 0, 0, 1, 1,
-0.6609234, -1.038378, -2.990078, 1, 0, 0, 1, 1,
-0.6596506, 0.9604928, 0.5558416, 1, 0, 0, 1, 1,
-0.65859, -0.3274657, -0.6661962, 1, 0, 0, 1, 1,
-0.656219, 0.6237581, -0.6354474, 1, 0, 0, 1, 1,
-0.654829, -0.6808278, -1.377143, 0, 0, 0, 1, 1,
-0.6542749, -0.5052328, -3.534603, 0, 0, 0, 1, 1,
-0.6530026, -0.8720411, -1.757345, 0, 0, 0, 1, 1,
-0.6489767, 1.168497, -0.2581208, 0, 0, 0, 1, 1,
-0.6469908, -0.869782, -1.393899, 0, 0, 0, 1, 1,
-0.6429771, 1.786872, -0.5568824, 0, 0, 0, 1, 1,
-0.6406093, 1.010896, 0.2060954, 0, 0, 0, 1, 1,
-0.6326373, 0.5583842, -1.016541, 1, 1, 1, 1, 1,
-0.6315531, 0.8571339, -2.703556, 1, 1, 1, 1, 1,
-0.6279887, -0.482731, -2.100504, 1, 1, 1, 1, 1,
-0.6276739, -0.01708505, 0.3557074, 1, 1, 1, 1, 1,
-0.6109041, 0.3103459, -2.232845, 1, 1, 1, 1, 1,
-0.6033798, -1.953839, -2.216173, 1, 1, 1, 1, 1,
-0.599445, -0.7212369, -3.180729, 1, 1, 1, 1, 1,
-0.5966266, 1.001884, 1.334751, 1, 1, 1, 1, 1,
-0.5963733, 0.1794253, -2.2456, 1, 1, 1, 1, 1,
-0.5951868, -0.1350579, -2.575839, 1, 1, 1, 1, 1,
-0.5900944, -0.2897859, -2.028631, 1, 1, 1, 1, 1,
-0.5893514, -1.068025, -2.831067, 1, 1, 1, 1, 1,
-0.5852417, -1.713353, -2.977142, 1, 1, 1, 1, 1,
-0.5848991, -2.885459, -4.049689, 1, 1, 1, 1, 1,
-0.5843164, 1.337702, 1.397118, 1, 1, 1, 1, 1,
-0.5841002, -0.7806942, -2.506959, 0, 0, 1, 1, 1,
-0.5828441, 1.926892, -0.6841326, 1, 0, 0, 1, 1,
-0.5791604, 1.413882, 0.027301, 1, 0, 0, 1, 1,
-0.5608763, 1.474825, -1.042366, 1, 0, 0, 1, 1,
-0.5603276, 0.6357349, -0.7913697, 1, 0, 0, 1, 1,
-0.5597622, 0.4252969, -0.5121988, 1, 0, 0, 1, 1,
-0.55738, -1.098526, -3.453439, 0, 0, 0, 1, 1,
-0.551396, 0.3366238, -0.3769931, 0, 0, 0, 1, 1,
-0.5513884, -0.1990921, -1.969806, 0, 0, 0, 1, 1,
-0.5434626, -0.2935109, -2.306571, 0, 0, 0, 1, 1,
-0.5423021, -1.443153, -1.693739, 0, 0, 0, 1, 1,
-0.5402583, 0.8160281, -0.7417754, 0, 0, 0, 1, 1,
-0.5395151, 0.4129179, 0.3639134, 0, 0, 0, 1, 1,
-0.5366517, -0.5390427, -3.771918, 1, 1, 1, 1, 1,
-0.5286943, 1.062639, 0.02359144, 1, 1, 1, 1, 1,
-0.528254, 0.5045549, -1.478534, 1, 1, 1, 1, 1,
-0.5231263, 0.2369973, -1.011952, 1, 1, 1, 1, 1,
-0.5208054, -0.1070948, -2.409345, 1, 1, 1, 1, 1,
-0.5197293, -0.4417112, -2.648333, 1, 1, 1, 1, 1,
-0.5108272, 0.304527, -1.804696, 1, 1, 1, 1, 1,
-0.5098352, -1.432508, -3.334373, 1, 1, 1, 1, 1,
-0.5073801, 0.09737739, -0.2735516, 1, 1, 1, 1, 1,
-0.4996507, -0.5589695, -4.422033, 1, 1, 1, 1, 1,
-0.494232, -1.395405, -2.934227, 1, 1, 1, 1, 1,
-0.4929027, -0.3345426, -1.856, 1, 1, 1, 1, 1,
-0.4820534, -0.9907174, -2.99308, 1, 1, 1, 1, 1,
-0.4818999, 1.968801, -0.6976846, 1, 1, 1, 1, 1,
-0.4782335, 0.9845821, 0.8249217, 1, 1, 1, 1, 1,
-0.4781256, 0.5674915, -3.39602, 0, 0, 1, 1, 1,
-0.4776606, -2.04976, -3.416353, 1, 0, 0, 1, 1,
-0.4764028, 1.932515, -1.490109, 1, 0, 0, 1, 1,
-0.4741841, -0.6498944, -0.5756044, 1, 0, 0, 1, 1,
-0.4711188, 1.301472, -1.349557, 1, 0, 0, 1, 1,
-0.4697138, 1.309551, -0.9786796, 1, 0, 0, 1, 1,
-0.4667788, -0.9918026, -3.475673, 0, 0, 0, 1, 1,
-0.4637893, -1.738249, -2.269463, 0, 0, 0, 1, 1,
-0.4605211, -0.3383017, -3.116731, 0, 0, 0, 1, 1,
-0.4573171, 1.574217, -1.405234, 0, 0, 0, 1, 1,
-0.4448785, 0.02650256, -0.06595189, 0, 0, 0, 1, 1,
-0.4376519, 0.6124713, 0.099869, 0, 0, 0, 1, 1,
-0.4327759, -1.204692, -4.228521, 0, 0, 0, 1, 1,
-0.4295445, -0.9231478, -3.327037, 1, 1, 1, 1, 1,
-0.4266075, 0.6920069, -1.660841, 1, 1, 1, 1, 1,
-0.4203674, -0.01543722, -2.514949, 1, 1, 1, 1, 1,
-0.4192716, 1.227027, -2.10157, 1, 1, 1, 1, 1,
-0.4160839, 0.2437583, -1.806777, 1, 1, 1, 1, 1,
-0.4136789, -0.2094264, -2.281018, 1, 1, 1, 1, 1,
-0.4122415, 0.6134431, -0.797183, 1, 1, 1, 1, 1,
-0.4118144, -0.06459781, -3.09931, 1, 1, 1, 1, 1,
-0.4092284, 0.8530259, -0.3534946, 1, 1, 1, 1, 1,
-0.4077112, -0.4290598, -3.694852, 1, 1, 1, 1, 1,
-0.4061094, -1.101528, -2.66909, 1, 1, 1, 1, 1,
-0.4053001, -0.7120506, -1.553021, 1, 1, 1, 1, 1,
-0.4010151, -0.9143867, -2.058726, 1, 1, 1, 1, 1,
-0.398786, -0.7840727, -2.787924, 1, 1, 1, 1, 1,
-0.3986749, 0.4580813, -1.790985, 1, 1, 1, 1, 1,
-0.3984414, -0.6235523, -1.177871, 0, 0, 1, 1, 1,
-0.3913305, -0.5509155, -1.802956, 1, 0, 0, 1, 1,
-0.3910449, 0.2355551, 0.3070834, 1, 0, 0, 1, 1,
-0.3901294, -0.3354919, -2.264855, 1, 0, 0, 1, 1,
-0.3893191, 0.1718013, -0.9940982, 1, 0, 0, 1, 1,
-0.3887702, 1.054044, -1.378268, 1, 0, 0, 1, 1,
-0.3878174, -0.2864907, -2.19417, 0, 0, 0, 1, 1,
-0.3863706, 0.008055045, -1.355657, 0, 0, 0, 1, 1,
-0.3837188, 0.3421072, -0.6673295, 0, 0, 0, 1, 1,
-0.380375, -0.007468438, -1.439846, 0, 0, 0, 1, 1,
-0.3789759, -0.1255618, -0.2012435, 0, 0, 0, 1, 1,
-0.3783686, 0.9064566, -0.8386597, 0, 0, 0, 1, 1,
-0.3781658, 0.7977249, -0.9177101, 0, 0, 0, 1, 1,
-0.3752661, 0.4544278, 0.6797361, 1, 1, 1, 1, 1,
-0.3732563, 0.5208791, -1.080461, 1, 1, 1, 1, 1,
-0.3669825, 1.754059, 0.04841217, 1, 1, 1, 1, 1,
-0.3645257, 0.2130122, -0.05274488, 1, 1, 1, 1, 1,
-0.3594395, -1.005213, -2.766202, 1, 1, 1, 1, 1,
-0.3584917, -0.1871114, -2.350792, 1, 1, 1, 1, 1,
-0.351065, 1.879139, 0.5877802, 1, 1, 1, 1, 1,
-0.3444757, -0.02315134, -0.4868061, 1, 1, 1, 1, 1,
-0.343407, -0.3188877, -1.653208, 1, 1, 1, 1, 1,
-0.3369133, 1.064028, -0.3241016, 1, 1, 1, 1, 1,
-0.335513, 0.7526221, -1.847463, 1, 1, 1, 1, 1,
-0.3343228, 0.2216306, -2.026696, 1, 1, 1, 1, 1,
-0.3337379, 1.977452, 1.195277, 1, 1, 1, 1, 1,
-0.3315038, -0.04354281, -2.983199, 1, 1, 1, 1, 1,
-0.3280541, 0.9344549, -0.9589223, 1, 1, 1, 1, 1,
-0.3268886, -2.003438, -2.643133, 0, 0, 1, 1, 1,
-0.3251146, -0.9038841, -4.031491, 1, 0, 0, 1, 1,
-0.3239549, -1.048774, -3.563028, 1, 0, 0, 1, 1,
-0.3213309, -0.9827408, -4.568377, 1, 0, 0, 1, 1,
-0.3208496, -0.3953117, -1.88062, 1, 0, 0, 1, 1,
-0.319836, 0.06232665, -0.9172369, 1, 0, 0, 1, 1,
-0.3198145, 0.2525218, -0.09639386, 0, 0, 0, 1, 1,
-0.319023, -0.659174, -3.40328, 0, 0, 0, 1, 1,
-0.3142412, -0.7087276, -3.251831, 0, 0, 0, 1, 1,
-0.3129111, 0.1020845, -0.5194354, 0, 0, 0, 1, 1,
-0.3115518, -0.4529518, -3.823364, 0, 0, 0, 1, 1,
-0.3098099, 0.2756365, -1.143682, 0, 0, 0, 1, 1,
-0.3094184, 0.6357184, -1.261711, 0, 0, 0, 1, 1,
-0.3062438, -0.5977004, -4.180097, 1, 1, 1, 1, 1,
-0.3039269, 0.7877537, 1.977598, 1, 1, 1, 1, 1,
-0.3030684, 0.2293515, -2.912656, 1, 1, 1, 1, 1,
-0.2977723, -1.448707, -2.207411, 1, 1, 1, 1, 1,
-0.2935555, -1.064577, -1.883667, 1, 1, 1, 1, 1,
-0.2929075, -0.2048028, -1.645709, 1, 1, 1, 1, 1,
-0.2921424, 2.264341, 0.6024673, 1, 1, 1, 1, 1,
-0.2895454, -0.3184483, -2.779565, 1, 1, 1, 1, 1,
-0.2893044, 0.636555, 0.6216304, 1, 1, 1, 1, 1,
-0.2793416, -0.3518971, -3.481019, 1, 1, 1, 1, 1,
-0.2780493, 0.976855, 0.03522317, 1, 1, 1, 1, 1,
-0.276949, -1.602435, -3.958377, 1, 1, 1, 1, 1,
-0.2739077, 0.8026149, 1.083004, 1, 1, 1, 1, 1,
-0.2650129, -0.4878885, -2.720689, 1, 1, 1, 1, 1,
-0.2608469, -0.7741037, -3.026289, 1, 1, 1, 1, 1,
-0.25814, -0.844981, -0.6776541, 0, 0, 1, 1, 1,
-0.2575078, -1.084819, -2.3631, 1, 0, 0, 1, 1,
-0.2550762, 1.652705, -0.2657861, 1, 0, 0, 1, 1,
-0.2546604, -1.776653, -4.44977, 1, 0, 0, 1, 1,
-0.247082, -0.7167401, -2.574387, 1, 0, 0, 1, 1,
-0.2428842, 0.0410671, -0.4570556, 1, 0, 0, 1, 1,
-0.2376506, -0.06327118, -2.187036, 0, 0, 0, 1, 1,
-0.2339124, -1.511376, -2.980993, 0, 0, 0, 1, 1,
-0.233303, -0.2518384, -2.84665, 0, 0, 0, 1, 1,
-0.2329652, -1.028988, -1.536628, 0, 0, 0, 1, 1,
-0.2315791, 0.03063147, -1.049329, 0, 0, 0, 1, 1,
-0.2300106, 0.06057063, -0.09569285, 0, 0, 0, 1, 1,
-0.227606, -1.188472, -2.027315, 0, 0, 0, 1, 1,
-0.2244732, 0.2746972, -1.527052, 1, 1, 1, 1, 1,
-0.2122295, -0.3576192, -0.8581091, 1, 1, 1, 1, 1,
-0.2087917, 1.063975, -1.041017, 1, 1, 1, 1, 1,
-0.2081434, -0.88228, -1.661378, 1, 1, 1, 1, 1,
-0.2078249, -0.3565302, -2.723058, 1, 1, 1, 1, 1,
-0.2069938, -1.214969, -1.004187, 1, 1, 1, 1, 1,
-0.2040948, 0.7702594, -0.836903, 1, 1, 1, 1, 1,
-0.2010311, 0.4091605, 0.2890317, 1, 1, 1, 1, 1,
-0.2001354, -0.4434466, -2.330634, 1, 1, 1, 1, 1,
-0.2000974, -0.328768, -2.747051, 1, 1, 1, 1, 1,
-0.1948764, -0.744401, -2.610902, 1, 1, 1, 1, 1,
-0.1883544, 0.9930529, 0.1803397, 1, 1, 1, 1, 1,
-0.188053, 0.6544034, -0.7000329, 1, 1, 1, 1, 1,
-0.1853798, -0.2206834, -2.808912, 1, 1, 1, 1, 1,
-0.185054, 0.8212987, -0.3695932, 1, 1, 1, 1, 1,
-0.1819399, 0.228423, -1.669937, 0, 0, 1, 1, 1,
-0.1803294, 0.6089101, -0.2923893, 1, 0, 0, 1, 1,
-0.1793012, -1.605592, -3.209214, 1, 0, 0, 1, 1,
-0.1777967, -0.7269711, -3.255856, 1, 0, 0, 1, 1,
-0.1752858, 0.3017053, -0.612451, 1, 0, 0, 1, 1,
-0.1644814, 1.755687, 1.220626, 1, 0, 0, 1, 1,
-0.1625248, -1.392362, -1.807558, 0, 0, 0, 1, 1,
-0.1610517, 0.3692673, -0.3850128, 0, 0, 0, 1, 1,
-0.155564, 0.7035068, -0.784803, 0, 0, 0, 1, 1,
-0.1542665, 0.351005, -2.082579, 0, 0, 0, 1, 1,
-0.1505569, 0.8460836, 0.7957733, 0, 0, 0, 1, 1,
-0.1492901, -0.1742423, -1.90298, 0, 0, 0, 1, 1,
-0.148649, -0.0886689, -2.43019, 0, 0, 0, 1, 1,
-0.1483429, -0.8557719, -2.439939, 1, 1, 1, 1, 1,
-0.1465212, 0.1744855, 0.9800017, 1, 1, 1, 1, 1,
-0.1441494, -0.3679601, -2.545366, 1, 1, 1, 1, 1,
-0.143778, 0.1116593, -0.9651413, 1, 1, 1, 1, 1,
-0.1425956, -1.57665, -3.367347, 1, 1, 1, 1, 1,
-0.141964, 0.3444102, -0.2889887, 1, 1, 1, 1, 1,
-0.1363707, -1.37811, -3.430049, 1, 1, 1, 1, 1,
-0.1334116, 0.6706487, -0.07175178, 1, 1, 1, 1, 1,
-0.1309003, -0.6713455, -3.573565, 1, 1, 1, 1, 1,
-0.1273362, -0.7267261, -1.371974, 1, 1, 1, 1, 1,
-0.1270267, -1.434349, -1.986722, 1, 1, 1, 1, 1,
-0.1218865, -0.8557336, -5.372428, 1, 1, 1, 1, 1,
-0.1161859, 0.5654894, 0.8266407, 1, 1, 1, 1, 1,
-0.1158088, 1.848234, 0.3641943, 1, 1, 1, 1, 1,
-0.1135638, -1.225243, -4.493154, 1, 1, 1, 1, 1,
-0.1134964, -0.7040533, -1.849144, 0, 0, 1, 1, 1,
-0.1089798, -1.026416, -2.614594, 1, 0, 0, 1, 1,
-0.1016266, 0.1161052, -1.547258, 1, 0, 0, 1, 1,
-0.09292435, -0.5949567, -4.065845, 1, 0, 0, 1, 1,
-0.09240863, 2.189881, -0.1947455, 1, 0, 0, 1, 1,
-0.0922704, -0.9149756, -1.109547, 1, 0, 0, 1, 1,
-0.0897513, 0.9427475, -0.8905967, 0, 0, 0, 1, 1,
-0.08744315, 1.048339, -0.2226602, 0, 0, 0, 1, 1,
-0.08733782, 1.260146, 1.261184, 0, 0, 0, 1, 1,
-0.08568567, -0.744756, -3.036127, 0, 0, 0, 1, 1,
-0.08304428, -0.3491932, -1.534821, 0, 0, 0, 1, 1,
-0.08249762, 0.6234627, 0.08452763, 0, 0, 0, 1, 1,
-0.08011899, 1.001771, 0.7308497, 0, 0, 0, 1, 1,
-0.07714282, -1.167161, -2.485291, 1, 1, 1, 1, 1,
-0.07585892, 1.030636, 1.151966, 1, 1, 1, 1, 1,
-0.07404394, 0.6140724, -1.234955, 1, 1, 1, 1, 1,
-0.07167369, -0.007952774, -1.731418, 1, 1, 1, 1, 1,
-0.06867008, 0.894389, 1.066216, 1, 1, 1, 1, 1,
-0.06861416, 0.7609021, -0.9905623, 1, 1, 1, 1, 1,
-0.06807073, 0.3242765, -0.5452473, 1, 1, 1, 1, 1,
-0.06613249, -1.116524, -2.255463, 1, 1, 1, 1, 1,
-0.06310949, 0.7214355, -0.9402883, 1, 1, 1, 1, 1,
-0.058281, 0.5449654, 1.054107, 1, 1, 1, 1, 1,
-0.05682263, -0.7660761, -3.400471, 1, 1, 1, 1, 1,
-0.0554306, -0.8329536, -1.676217, 1, 1, 1, 1, 1,
-0.05529659, -1.015108, -2.545014, 1, 1, 1, 1, 1,
-0.05463916, 1.014714, -1.726843, 1, 1, 1, 1, 1,
-0.04873571, 0.1139376, -0.02965609, 1, 1, 1, 1, 1,
-0.04869812, -1.761698, -3.791619, 0, 0, 1, 1, 1,
-0.04416209, -0.6380621, -2.129354, 1, 0, 0, 1, 1,
-0.04090847, 0.2408808, 0.3332136, 1, 0, 0, 1, 1,
-0.03924115, -0.3512209, -4.21901, 1, 0, 0, 1, 1,
-0.03921976, 0.02635649, -1.943571, 1, 0, 0, 1, 1,
-0.03731858, 1.113595, 0.6649703, 1, 0, 0, 1, 1,
-0.03156736, -0.03683555, -2.380745, 0, 0, 0, 1, 1,
-0.02904953, 0.1886368, -0.4326149, 0, 0, 0, 1, 1,
-0.02715034, 0.7175941, 0.6597525, 0, 0, 0, 1, 1,
-0.02477071, 1.505544, -0.06733544, 0, 0, 0, 1, 1,
-0.02092833, 0.9931322, -0.7635512, 0, 0, 0, 1, 1,
-0.01875056, -0.4754085, -3.96357, 0, 0, 0, 1, 1,
-0.01400659, -0.1163505, -1.161327, 0, 0, 0, 1, 1,
-0.01349651, 0.8568879, 0.3908408, 1, 1, 1, 1, 1,
-0.008773727, -0.147344, -5.387225, 1, 1, 1, 1, 1,
-0.007430821, 0.5335965, 0.6624973, 1, 1, 1, 1, 1,
-0.002199379, -1.236071, -2.396849, 1, 1, 1, 1, 1,
-0.0003300875, -1.262893, -3.351459, 1, 1, 1, 1, 1,
0.002225803, 0.9327329, 0.4016218, 1, 1, 1, 1, 1,
0.00607374, -1.677735, 3.820491, 1, 1, 1, 1, 1,
0.006228072, -0.6772824, 3.267815, 1, 1, 1, 1, 1,
0.007363709, -0.01019167, 2.654019, 1, 1, 1, 1, 1,
0.007654699, 0.3173312, 1.198714, 1, 1, 1, 1, 1,
0.011467, 1.097165, -0.3212044, 1, 1, 1, 1, 1,
0.01186192, -0.100918, 4.877302, 1, 1, 1, 1, 1,
0.01203081, -0.6715679, 2.803956, 1, 1, 1, 1, 1,
0.01297505, -1.065796, 4.80815, 1, 1, 1, 1, 1,
0.01384387, -1.595223, 3.474309, 1, 1, 1, 1, 1,
0.01615329, 1.023398, -0.4952007, 0, 0, 1, 1, 1,
0.0165919, -0.08907203, 4.861863, 1, 0, 0, 1, 1,
0.01829428, 1.232221, -0.801497, 1, 0, 0, 1, 1,
0.02061511, -0.5951287, 2.903559, 1, 0, 0, 1, 1,
0.02069442, -1.617643, 1.867532, 1, 0, 0, 1, 1,
0.0210431, -0.6527705, 4.44995, 1, 0, 0, 1, 1,
0.02212282, -2.352611, 3.012456, 0, 0, 0, 1, 1,
0.02652876, -0.476807, 2.762553, 0, 0, 0, 1, 1,
0.02752878, -0.1062112, 2.247683, 0, 0, 0, 1, 1,
0.03143946, -1.17026, 4.602011, 0, 0, 0, 1, 1,
0.03184198, -1.059378, 3.848067, 0, 0, 0, 1, 1,
0.0332684, 0.2224982, 1.212013, 0, 0, 0, 1, 1,
0.04344368, -0.5679728, 2.664178, 0, 0, 0, 1, 1,
0.04345972, 1.497725, -0.5013455, 1, 1, 1, 1, 1,
0.04471004, -0.817742, 4.291267, 1, 1, 1, 1, 1,
0.04987042, 0.5309296, -0.681488, 1, 1, 1, 1, 1,
0.05173563, -0.02566087, 0.448171, 1, 1, 1, 1, 1,
0.05312249, -1.126042, 1.774624, 1, 1, 1, 1, 1,
0.05357318, 0.8671274, 0.6096453, 1, 1, 1, 1, 1,
0.05906408, 0.3197905, 0.4214404, 1, 1, 1, 1, 1,
0.06255043, -0.181072, 3.043885, 1, 1, 1, 1, 1,
0.06544864, -0.4115298, 2.897781, 1, 1, 1, 1, 1,
0.06589732, 0.4163925, 0.5571199, 1, 1, 1, 1, 1,
0.06631722, -1.310786, 3.439979, 1, 1, 1, 1, 1,
0.07126062, 0.8517908, -0.6571031, 1, 1, 1, 1, 1,
0.07177934, -0.08815311, 0.5593085, 1, 1, 1, 1, 1,
0.07458352, 1.49355, 0.01874626, 1, 1, 1, 1, 1,
0.07504465, -1.142102, 0.8165835, 1, 1, 1, 1, 1,
0.07600085, -0.5391775, 3.050807, 0, 0, 1, 1, 1,
0.0760672, -1.272404, 3.207348, 1, 0, 0, 1, 1,
0.07643617, 1.153536, -0.2731285, 1, 0, 0, 1, 1,
0.07694472, 0.3534081, -0.4571329, 1, 0, 0, 1, 1,
0.07877859, -0.9418039, 2.280426, 1, 0, 0, 1, 1,
0.08283516, 0.7354468, -0.6425167, 1, 0, 0, 1, 1,
0.08369351, -0.5833881, 3.077573, 0, 0, 0, 1, 1,
0.08964782, 0.1599175, -0.59245, 0, 0, 0, 1, 1,
0.09703558, 0.1164066, -0.4613915, 0, 0, 0, 1, 1,
0.09960427, -0.6811884, 2.214925, 0, 0, 0, 1, 1,
0.09972071, -0.4963495, 3.284221, 0, 0, 0, 1, 1,
0.1054839, 0.6272039, 0.6688207, 0, 0, 0, 1, 1,
0.1055369, 0.3947941, 0.2255061, 0, 0, 0, 1, 1,
0.1068382, -0.6584787, 2.502409, 1, 1, 1, 1, 1,
0.1086946, 0.9919132, -0.8383455, 1, 1, 1, 1, 1,
0.1111953, -0.03317834, 1.274162, 1, 1, 1, 1, 1,
0.1140072, -1.188233, 3.450391, 1, 1, 1, 1, 1,
0.1146637, 0.3642987, 0.2437119, 1, 1, 1, 1, 1,
0.1214228, -0.7402381, 2.727313, 1, 1, 1, 1, 1,
0.1269065, 0.7330853, 1.063639, 1, 1, 1, 1, 1,
0.1278008, -0.2376895, 3.313941, 1, 1, 1, 1, 1,
0.1299732, -0.9060753, 2.440283, 1, 1, 1, 1, 1,
0.1503418, 1.292862, 0.3613146, 1, 1, 1, 1, 1,
0.15278, -1.218301, 4.128076, 1, 1, 1, 1, 1,
0.1535126, -0.1362466, 0.8612664, 1, 1, 1, 1, 1,
0.1557469, -0.8268963, 2.651168, 1, 1, 1, 1, 1,
0.1565383, 1.700402, 0.3922656, 1, 1, 1, 1, 1,
0.1641082, 2.391145, 0.6119894, 1, 1, 1, 1, 1,
0.1651699, -0.513102, 2.547425, 0, 0, 1, 1, 1,
0.1656483, -0.8959328, 1.758353, 1, 0, 0, 1, 1,
0.1741912, -0.03742538, 2.591621, 1, 0, 0, 1, 1,
0.1781816, 1.337936, 0.357578, 1, 0, 0, 1, 1,
0.1788966, -0.6149715, 2.144071, 1, 0, 0, 1, 1,
0.179795, 1.66977, -0.3353391, 1, 0, 0, 1, 1,
0.1805613, 0.3934889, -0.1551235, 0, 0, 0, 1, 1,
0.180604, 1.218258, 1.406351, 0, 0, 0, 1, 1,
0.1806434, 1.207729, 1.315442, 0, 0, 0, 1, 1,
0.1814403, -1.143622, 4.202273, 0, 0, 0, 1, 1,
0.1841922, -0.5770675, 3.906383, 0, 0, 0, 1, 1,
0.1903797, 1.853718, 0.6081328, 0, 0, 0, 1, 1,
0.1913858, -0.3561814, 1.559766, 0, 0, 0, 1, 1,
0.1922898, -0.8335063, 2.973922, 1, 1, 1, 1, 1,
0.1935974, -0.5733509, 3.792728, 1, 1, 1, 1, 1,
0.1937589, 2.364071, -1.716361, 1, 1, 1, 1, 1,
0.1942147, -0.6562725, 1.321065, 1, 1, 1, 1, 1,
0.1951865, -1.402159, 2.948496, 1, 1, 1, 1, 1,
0.1957787, -1.908416, 3.907743, 1, 1, 1, 1, 1,
0.1999192, -1.696494, 1.424213, 1, 1, 1, 1, 1,
0.202056, 1.4568, 0.6895791, 1, 1, 1, 1, 1,
0.2034805, -0.7302878, 2.124073, 1, 1, 1, 1, 1,
0.2059261, -0.3798581, 2.381277, 1, 1, 1, 1, 1,
0.2091362, -1.355694, 1.821249, 1, 1, 1, 1, 1,
0.2099635, -1.076593, 3.538425, 1, 1, 1, 1, 1,
0.2122922, -0.7264613, 3.779639, 1, 1, 1, 1, 1,
0.2139095, 0.309142, 0.6476872, 1, 1, 1, 1, 1,
0.2150535, -0.3813245, 2.383256, 1, 1, 1, 1, 1,
0.2176631, -0.08387089, 2.715581, 0, 0, 1, 1, 1,
0.220029, -0.4213278, 4.197919, 1, 0, 0, 1, 1,
0.2272103, -1.03736, 2.893636, 1, 0, 0, 1, 1,
0.2277905, 0.9007492, 1.605242, 1, 0, 0, 1, 1,
0.236567, -0.05319397, -0.569002, 1, 0, 0, 1, 1,
0.23728, -0.973906, 5.421589, 1, 0, 0, 1, 1,
0.2377944, -2.641689, 2.111655, 0, 0, 0, 1, 1,
0.2386117, -0.5070481, 2.961271, 0, 0, 0, 1, 1,
0.2452177, -0.03581612, 1.675936, 0, 0, 0, 1, 1,
0.2472761, -1.37713, 2.255161, 0, 0, 0, 1, 1,
0.2516967, -0.08695705, 1.604719, 0, 0, 0, 1, 1,
0.2520603, 0.6396586, 1.096934, 0, 0, 0, 1, 1,
0.2540617, 0.6999217, 1.854797, 0, 0, 0, 1, 1,
0.2572617, -1.180761, 3.652448, 1, 1, 1, 1, 1,
0.2573103, 0.6640263, 0.8064479, 1, 1, 1, 1, 1,
0.2577037, 0.1911433, 1.323753, 1, 1, 1, 1, 1,
0.2627385, -1.406403, 2.002165, 1, 1, 1, 1, 1,
0.2646135, -1.497326, 3.933065, 1, 1, 1, 1, 1,
0.2651421, 1.814609, 0.7760313, 1, 1, 1, 1, 1,
0.2692421, -2.355953, 2.320585, 1, 1, 1, 1, 1,
0.2698858, 1.563757, -0.642747, 1, 1, 1, 1, 1,
0.2722189, -2.192556, 3.437998, 1, 1, 1, 1, 1,
0.274936, 0.2467344, 3.337054, 1, 1, 1, 1, 1,
0.2806488, -2.626719, 3.201174, 1, 1, 1, 1, 1,
0.2836166, 0.5608776, 0.3395412, 1, 1, 1, 1, 1,
0.2837444, -1.319489, 3.128565, 1, 1, 1, 1, 1,
0.2906521, -2.104392, 4.542788, 1, 1, 1, 1, 1,
0.2919943, -0.08848606, 0.8670004, 1, 1, 1, 1, 1,
0.2968493, -0.7653887, 4.079976, 0, 0, 1, 1, 1,
0.2975044, -1.039597, 1.603908, 1, 0, 0, 1, 1,
0.3041541, 0.9647468, 0.4192823, 1, 0, 0, 1, 1,
0.3078089, 0.4637555, 1.862559, 1, 0, 0, 1, 1,
0.3082539, -0.8594046, 1.903096, 1, 0, 0, 1, 1,
0.3098613, 0.2715686, 1.460519, 1, 0, 0, 1, 1,
0.3125497, 2.102057, -0.8003177, 0, 0, 0, 1, 1,
0.3168575, 0.6711379, 0.8811067, 0, 0, 0, 1, 1,
0.319647, -0.5058272, 2.264964, 0, 0, 0, 1, 1,
0.3213847, -0.7966962, 2.608438, 0, 0, 0, 1, 1,
0.3225615, 1.442355, -0.8621101, 0, 0, 0, 1, 1,
0.3272548, -1.741465, 1.947085, 0, 0, 0, 1, 1,
0.328842, -0.2480451, 1.82099, 0, 0, 0, 1, 1,
0.329225, 0.2224423, 0.6432946, 1, 1, 1, 1, 1,
0.3341229, 0.3600769, 2.817564, 1, 1, 1, 1, 1,
0.3356239, -1.009278, 1.41066, 1, 1, 1, 1, 1,
0.3364306, 0.2835139, -1.019746, 1, 1, 1, 1, 1,
0.3381445, -0.9206215, 4.756639, 1, 1, 1, 1, 1,
0.3396081, 1.157754, 0.6679822, 1, 1, 1, 1, 1,
0.3396947, 0.7596372, 1.289973, 1, 1, 1, 1, 1,
0.3423102, -1.132026, 3.547481, 1, 1, 1, 1, 1,
0.3428352, 0.001793846, 2.035907, 1, 1, 1, 1, 1,
0.3482524, 0.753514, -1.643859, 1, 1, 1, 1, 1,
0.3490377, 0.8475755, 1.060886, 1, 1, 1, 1, 1,
0.3506418, -0.4722413, 1.894417, 1, 1, 1, 1, 1,
0.3560677, -1.479883, 3.754126, 1, 1, 1, 1, 1,
0.3587091, -0.6943986, 1.595092, 1, 1, 1, 1, 1,
0.3603882, 1.676834, -1.563909, 1, 1, 1, 1, 1,
0.3604152, -0.5220096, 2.720069, 0, 0, 1, 1, 1,
0.3614734, -0.5255188, 3.192438, 1, 0, 0, 1, 1,
0.3652079, 1.977885, 0.0428443, 1, 0, 0, 1, 1,
0.3663191, 0.7763587, 1.515146, 1, 0, 0, 1, 1,
0.3663392, -1.874956, 3.427414, 1, 0, 0, 1, 1,
0.3684942, 0.7601466, 0.5464439, 1, 0, 0, 1, 1,
0.3702674, 1.390125, 1.045068, 0, 0, 0, 1, 1,
0.3705817, -2.091813, 5.194255, 0, 0, 0, 1, 1,
0.372994, -1.262154, 3.780704, 0, 0, 0, 1, 1,
0.3769214, -0.8727457, 3.658967, 0, 0, 0, 1, 1,
0.3785207, 0.6410997, 0.7570671, 0, 0, 0, 1, 1,
0.3795666, 1.687218, -0.3006828, 0, 0, 0, 1, 1,
0.3817436, -0.5170747, 0.8488426, 0, 0, 0, 1, 1,
0.3882415, -0.6132608, 0.2365722, 1, 1, 1, 1, 1,
0.3898761, -1.933933, 1.350845, 1, 1, 1, 1, 1,
0.3948928, -0.169332, 1.122579, 1, 1, 1, 1, 1,
0.395699, 1.385756, 0.007779645, 1, 1, 1, 1, 1,
0.3971943, 0.3553755, -0.5196247, 1, 1, 1, 1, 1,
0.4012972, -1.199122, 2.413993, 1, 1, 1, 1, 1,
0.405983, 0.3492884, 2.722777, 1, 1, 1, 1, 1,
0.4060167, -0.7106221, 2.332891, 1, 1, 1, 1, 1,
0.4079587, 0.6190008, -0.1158487, 1, 1, 1, 1, 1,
0.4080428, 0.8992008, 0.02514712, 1, 1, 1, 1, 1,
0.4095633, -1.937477, 1.512562, 1, 1, 1, 1, 1,
0.4171131, -1.111387, 1.379082, 1, 1, 1, 1, 1,
0.4193295, 1.680132, 0.6676103, 1, 1, 1, 1, 1,
0.4210837, 0.09436794, 0.8126549, 1, 1, 1, 1, 1,
0.4225114, 0.3556961, 2.892651, 1, 1, 1, 1, 1,
0.4233525, 1.760845, 1.501827, 0, 0, 1, 1, 1,
0.4289398, 0.8334785, 0.5196884, 1, 0, 0, 1, 1,
0.4316226, -0.4067157, 4.114648, 1, 0, 0, 1, 1,
0.4317365, 0.01747282, 1.28693, 1, 0, 0, 1, 1,
0.4320095, -0.355143, 1.653965, 1, 0, 0, 1, 1,
0.4323463, 0.6026791, 1.62034, 1, 0, 0, 1, 1,
0.4325002, -0.4135295, 1.749961, 0, 0, 0, 1, 1,
0.4342237, 1.385045, -0.5376568, 0, 0, 0, 1, 1,
0.4342574, 0.01551636, 1.324013, 0, 0, 0, 1, 1,
0.4345685, -1.71085, 4.792166, 0, 0, 0, 1, 1,
0.4422497, 0.9403722, 0.583788, 0, 0, 0, 1, 1,
0.4427173, 0.9848882, -0.6603019, 0, 0, 0, 1, 1,
0.4431749, 0.4639074, 1.305103, 0, 0, 0, 1, 1,
0.4441037, -0.0786409, 0.5914985, 1, 1, 1, 1, 1,
0.4458154, 1.365316, -0.4484025, 1, 1, 1, 1, 1,
0.448792, -1.07427, 3.292614, 1, 1, 1, 1, 1,
0.4529141, 0.7841954, -0.6392494, 1, 1, 1, 1, 1,
0.4541808, 1.716005, 0.6884108, 1, 1, 1, 1, 1,
0.4542376, -0.05580679, 1.514765, 1, 1, 1, 1, 1,
0.4566793, 2.214613, 1.107287, 1, 1, 1, 1, 1,
0.4578299, -0.01541632, 1.587412, 1, 1, 1, 1, 1,
0.4612519, 0.7573414, 1.893276, 1, 1, 1, 1, 1,
0.4643312, 0.2764598, 1.765496, 1, 1, 1, 1, 1,
0.4652448, -0.8565001, 3.346818, 1, 1, 1, 1, 1,
0.471505, -1.218483, 2.323989, 1, 1, 1, 1, 1,
0.4742756, -0.3647145, 2.727101, 1, 1, 1, 1, 1,
0.4787761, -0.9066479, 3.510921, 1, 1, 1, 1, 1,
0.4811665, -0.9438616, 1.920107, 1, 1, 1, 1, 1,
0.4812766, 0.8096386, -0.7052037, 0, 0, 1, 1, 1,
0.4817989, 0.8397095, -0.5992377, 1, 0, 0, 1, 1,
0.4837806, -0.3121878, 2.978083, 1, 0, 0, 1, 1,
0.4848849, -0.8906822, 1.573295, 1, 0, 0, 1, 1,
0.4855885, -0.2917198, 0.9054194, 1, 0, 0, 1, 1,
0.4882383, -1.295393, 4.557897, 1, 0, 0, 1, 1,
0.4903057, -2.394398, 1.519921, 0, 0, 0, 1, 1,
0.4919559, -0.8516349, 2.633152, 0, 0, 0, 1, 1,
0.5045332, 0.9101456, 0.2026434, 0, 0, 0, 1, 1,
0.505428, 0.09152441, 0.1487784, 0, 0, 0, 1, 1,
0.5056403, -1.723558, 2.637589, 0, 0, 0, 1, 1,
0.5137681, 0.5814428, 0.4911754, 0, 0, 0, 1, 1,
0.5177668, 0.3959701, 2.563165, 0, 0, 0, 1, 1,
0.5197936, -0.07141967, 1.873244, 1, 1, 1, 1, 1,
0.5203571, 0.1894467, 2.745254, 1, 1, 1, 1, 1,
0.5268241, -0.8303756, 2.936547, 1, 1, 1, 1, 1,
0.5280658, -1.130663, 3.979011, 1, 1, 1, 1, 1,
0.5306076, 1.465141, -1.315608, 1, 1, 1, 1, 1,
0.5310271, -0.08528354, 3.252467, 1, 1, 1, 1, 1,
0.5338481, 0.05167647, 0.3647857, 1, 1, 1, 1, 1,
0.5391218, -2.480306, 2.472341, 1, 1, 1, 1, 1,
0.5407728, -0.3697888, 2.535954, 1, 1, 1, 1, 1,
0.5455938, -1.079129, 2.695575, 1, 1, 1, 1, 1,
0.552295, -0.2477226, 2.035252, 1, 1, 1, 1, 1,
0.5533774, 0.3053156, 1.316319, 1, 1, 1, 1, 1,
0.5562955, -0.0928479, 2.019969, 1, 1, 1, 1, 1,
0.5573812, -1.264827, 2.185477, 1, 1, 1, 1, 1,
0.5598266, -0.2130417, 2.240699, 1, 1, 1, 1, 1,
0.5645634, -0.832415, 3.829994, 0, 0, 1, 1, 1,
0.56639, -1.202837, 2.52711, 1, 0, 0, 1, 1,
0.583011, -1.789788, 3.308576, 1, 0, 0, 1, 1,
0.584061, -1.639022, 2.946965, 1, 0, 0, 1, 1,
0.5853615, -0.1003599, 1.343024, 1, 0, 0, 1, 1,
0.5871306, -1.363618, -0.06804214, 1, 0, 0, 1, 1,
0.5881909, -1.494223, 1.184453, 0, 0, 0, 1, 1,
0.5903208, 1.13629, 2.886012, 0, 0, 0, 1, 1,
0.5951021, 1.247031, 1.435079, 0, 0, 0, 1, 1,
0.6002182, -0.3366737, 2.664903, 0, 0, 0, 1, 1,
0.6021494, 0.2813263, 1.673918, 0, 0, 0, 1, 1,
0.6070614, 1.448608, 0.7401128, 0, 0, 0, 1, 1,
0.608925, -1.234674, 2.703265, 0, 0, 0, 1, 1,
0.6181275, -0.0886298, 2.092918, 1, 1, 1, 1, 1,
0.6225854, 1.87846, -0.2717348, 1, 1, 1, 1, 1,
0.6262766, 0.5745239, 1.145684, 1, 1, 1, 1, 1,
0.6267159, 0.9529293, 1.199692, 1, 1, 1, 1, 1,
0.6288068, -0.5431468, 0.5631331, 1, 1, 1, 1, 1,
0.6347255, 0.04457194, 1.439247, 1, 1, 1, 1, 1,
0.6446881, 0.2978854, 0.5637372, 1, 1, 1, 1, 1,
0.646987, 0.02990836, 2.078819, 1, 1, 1, 1, 1,
0.64937, 0.6950546, 1.798747, 1, 1, 1, 1, 1,
0.6548216, -0.326717, 1.350741, 1, 1, 1, 1, 1,
0.6549163, -0.5718265, 3.494646, 1, 1, 1, 1, 1,
0.6580582, 0.9663329, -0.7282184, 1, 1, 1, 1, 1,
0.663536, 0.01841599, 1.138028, 1, 1, 1, 1, 1,
0.6663749, -1.823391, 1.541711, 1, 1, 1, 1, 1,
0.6695228, -0.8966829, 2.48647, 1, 1, 1, 1, 1,
0.6802311, -0.22515, 2.188836, 0, 0, 1, 1, 1,
0.6812322, 0.5603693, 0.3783943, 1, 0, 0, 1, 1,
0.6813849, 0.002938444, 2.903688, 1, 0, 0, 1, 1,
0.6821191, -0.6316929, 1.429019, 1, 0, 0, 1, 1,
0.6835899, 0.8254925, 2.735118, 1, 0, 0, 1, 1,
0.6918261, -1.669833, 4.935541, 1, 0, 0, 1, 1,
0.6936222, 0.8184164, 1.323753, 0, 0, 0, 1, 1,
0.6983311, -0.6292184, 2.339318, 0, 0, 0, 1, 1,
0.7028866, -1.373298, 2.159058, 0, 0, 0, 1, 1,
0.7038867, 1.681543, 0.9293475, 0, 0, 0, 1, 1,
0.7076116, 1.494083, 2.124959, 0, 0, 0, 1, 1,
0.7079177, -0.4780561, 1.125733, 0, 0, 0, 1, 1,
0.711854, -0.4823562, 2.740849, 0, 0, 0, 1, 1,
0.7193782, 1.229235, 0.001527495, 1, 1, 1, 1, 1,
0.7244458, 0.3702142, 0.1351773, 1, 1, 1, 1, 1,
0.737508, -2.193736, 3.131083, 1, 1, 1, 1, 1,
0.7446687, 1.843539, 2.517892, 1, 1, 1, 1, 1,
0.7464418, -0.2668016, 1.13318, 1, 1, 1, 1, 1,
0.7489989, -0.5553797, 3.596612, 1, 1, 1, 1, 1,
0.7568065, 0.2837249, 1.134197, 1, 1, 1, 1, 1,
0.7577184, 0.8665193, 1.908505, 1, 1, 1, 1, 1,
0.7645384, 0.4570976, 0.6174249, 1, 1, 1, 1, 1,
0.7686694, -1.636333, 3.963326, 1, 1, 1, 1, 1,
0.7692471, -0.3943963, 3.173352, 1, 1, 1, 1, 1,
0.7692693, 0.7693509, -0.2268933, 1, 1, 1, 1, 1,
0.7696787, -0.6511453, 1.772872, 1, 1, 1, 1, 1,
0.7712455, 2.22932, 0.367086, 1, 1, 1, 1, 1,
0.7730985, -0.3708818, 1.532494, 1, 1, 1, 1, 1,
0.7815713, -0.160793, 0.5636514, 0, 0, 1, 1, 1,
0.7816842, -1.105338, 2.553114, 1, 0, 0, 1, 1,
0.7822538, -0.3925615, 1.171691, 1, 0, 0, 1, 1,
0.7840946, -0.1222351, 1.781513, 1, 0, 0, 1, 1,
0.7846233, 2.045107, -1.061671, 1, 0, 0, 1, 1,
0.7875479, 0.8605446, 0.1065716, 1, 0, 0, 1, 1,
0.7957607, -0.9818609, 1.891717, 0, 0, 0, 1, 1,
0.8000307, 1.634845, 1.347427, 0, 0, 0, 1, 1,
0.8025784, 2.390269, -0.811113, 0, 0, 0, 1, 1,
0.8046919, -0.7048062, 1.413732, 0, 0, 0, 1, 1,
0.8048517, -1.117335, 3.949198, 0, 0, 0, 1, 1,
0.805975, 0.75148, -0.9203812, 0, 0, 0, 1, 1,
0.8082681, 1.3774, -0.9060367, 0, 0, 0, 1, 1,
0.8104945, 0.06556806, 1.487991, 1, 1, 1, 1, 1,
0.8110668, 0.1182373, 0.8742538, 1, 1, 1, 1, 1,
0.8175289, 0.001784617, -0.04775182, 1, 1, 1, 1, 1,
0.8223521, 1.848022, 0.2844221, 1, 1, 1, 1, 1,
0.8254086, -0.3904693, 1.042818, 1, 1, 1, 1, 1,
0.8304161, -0.6322798, 2.262997, 1, 1, 1, 1, 1,
0.8314674, 0.1075727, 0.1943403, 1, 1, 1, 1, 1,
0.832909, 0.4670412, 1.419767, 1, 1, 1, 1, 1,
0.8348418, 0.6764977, -0.06406967, 1, 1, 1, 1, 1,
0.8365456, -0.3347816, 1.028888, 1, 1, 1, 1, 1,
0.8377635, 1.154002, -0.5470771, 1, 1, 1, 1, 1,
0.8378672, -0.1853381, 1.411254, 1, 1, 1, 1, 1,
0.8402004, 0.7485454, 0.1567834, 1, 1, 1, 1, 1,
0.8452356, -1.312161, 3.97537, 1, 1, 1, 1, 1,
0.850134, 0.04408064, -0.4654178, 1, 1, 1, 1, 1,
0.8516229, -1.185141, 1.336246, 0, 0, 1, 1, 1,
0.8561764, 0.382778, 0.7384585, 1, 0, 0, 1, 1,
0.8584841, -2.175539, 2.819634, 1, 0, 0, 1, 1,
0.858842, 0.03673349, 1.836351, 1, 0, 0, 1, 1,
0.8623781, 0.9708326, 0.5363271, 1, 0, 0, 1, 1,
0.8759972, 0.5066168, 0.3679368, 1, 0, 0, 1, 1,
0.8814545, 0.5078306, 2.224868, 0, 0, 0, 1, 1,
0.8886176, -0.4355039, 4.265178, 0, 0, 0, 1, 1,
0.90359, 0.2881999, 1.223269, 0, 0, 0, 1, 1,
0.9084641, -0.528632, 3.396097, 0, 0, 0, 1, 1,
0.9121587, -0.583994, 2.33663, 0, 0, 0, 1, 1,
0.9136327, 1.001469, 2.182153, 0, 0, 0, 1, 1,
0.9146135, -1.617159, 3.270161, 0, 0, 0, 1, 1,
0.9157267, 1.682702, 0.1017453, 1, 1, 1, 1, 1,
0.9160793, -0.4720521, 1.907366, 1, 1, 1, 1, 1,
0.9184535, 0.3517474, 0.6552105, 1, 1, 1, 1, 1,
0.920268, -0.7674663, 1.191552, 1, 1, 1, 1, 1,
0.9210575, -0.1680542, 2.79235, 1, 1, 1, 1, 1,
0.923246, -0.4875651, 2.419667, 1, 1, 1, 1, 1,
0.9245152, -1.130765, 1.842796, 1, 1, 1, 1, 1,
0.9405195, -1.221379, 1.291808, 1, 1, 1, 1, 1,
0.9434763, 0.9823683, -0.03135279, 1, 1, 1, 1, 1,
0.9450762, 0.03000589, 2.288897, 1, 1, 1, 1, 1,
0.9459095, 0.3265513, 1.900512, 1, 1, 1, 1, 1,
0.9461219, -1.178753, 2.056276, 1, 1, 1, 1, 1,
0.9472255, -1.330029, 3.361616, 1, 1, 1, 1, 1,
0.9503567, 0.2455815, -0.8919294, 1, 1, 1, 1, 1,
0.9518732, 0.03603349, 0.6304551, 1, 1, 1, 1, 1,
0.9573283, -1.200972, 4.22117, 0, 0, 1, 1, 1,
0.9592984, -0.1892917, 1.083511, 1, 0, 0, 1, 1,
0.9648137, -0.5121499, 1.095565, 1, 0, 0, 1, 1,
0.9747708, 0.5835403, 1.08077, 1, 0, 0, 1, 1,
0.9753821, 1.080996, 2.222776, 1, 0, 0, 1, 1,
0.9842265, -0.2641074, 1.16652, 1, 0, 0, 1, 1,
0.9859381, -0.2126903, 3.030261, 0, 0, 0, 1, 1,
0.9863568, -0.9335119, 4.337968, 0, 0, 0, 1, 1,
0.9900781, 0.4102608, 2.018197, 0, 0, 0, 1, 1,
1.004548, 0.1725874, 0.9532144, 0, 0, 0, 1, 1,
1.004683, -0.3673441, 3.596681, 0, 0, 0, 1, 1,
1.006545, 1.7092, 1.255792, 0, 0, 0, 1, 1,
1.006668, -0.5935889, 3.194806, 0, 0, 0, 1, 1,
1.011658, 0.9561041, 0.3794744, 1, 1, 1, 1, 1,
1.018025, 1.931586, -0.1998522, 1, 1, 1, 1, 1,
1.027038, -0.1367362, 0.465455, 1, 1, 1, 1, 1,
1.033978, -1.295, 1.470751, 1, 1, 1, 1, 1,
1.036743, -0.05541592, 3.11729, 1, 1, 1, 1, 1,
1.038478, -2.227065, 2.246217, 1, 1, 1, 1, 1,
1.042166, -0.01927022, 1.657934, 1, 1, 1, 1, 1,
1.04503, 0.7804983, 0.6261725, 1, 1, 1, 1, 1,
1.046077, -1.28433, 3.575876, 1, 1, 1, 1, 1,
1.0517, -0.7931259, 1.466036, 1, 1, 1, 1, 1,
1.053179, 0.4015583, 0.7679443, 1, 1, 1, 1, 1,
1.066082, 1.446715, 0.3762955, 1, 1, 1, 1, 1,
1.06643, 0.9430657, 0.2475574, 1, 1, 1, 1, 1,
1.069816, 1.182511, -0.1348047, 1, 1, 1, 1, 1,
1.073443, 0.01619873, 1.480196, 1, 1, 1, 1, 1,
1.073774, 1.482792, 1.427916, 0, 0, 1, 1, 1,
1.088512, 1.337117, -1.010372, 1, 0, 0, 1, 1,
1.096801, -0.2453327, 0.2259118, 1, 0, 0, 1, 1,
1.105173, 0.2324965, 2.372852, 1, 0, 0, 1, 1,
1.110807, -0.8830634, 1.744533, 1, 0, 0, 1, 1,
1.117102, -1.417603, 1.647054, 1, 0, 0, 1, 1,
1.131947, 0.3393038, -0.2042876, 0, 0, 0, 1, 1,
1.134866, 0.1050895, -0.2365733, 0, 0, 0, 1, 1,
1.135033, -0.04262287, 0.857105, 0, 0, 0, 1, 1,
1.135205, -0.7596508, 1.573501, 0, 0, 0, 1, 1,
1.137228, -1.611442, 3.991675, 0, 0, 0, 1, 1,
1.141307, 1.918149, 0.318922, 0, 0, 0, 1, 1,
1.147628, 1.406904, 0.9148046, 0, 0, 0, 1, 1,
1.154794, 0.6360555, 2.813103, 1, 1, 1, 1, 1,
1.160606, 0.8833149, -1.167495, 1, 1, 1, 1, 1,
1.169157, -0.9407007, 3.849868, 1, 1, 1, 1, 1,
1.176533, -0.5934166, 1.981876, 1, 1, 1, 1, 1,
1.180925, -0.1580921, 0.5199363, 1, 1, 1, 1, 1,
1.181516, 0.5694355, 2.051974, 1, 1, 1, 1, 1,
1.181752, 0.3876272, 0.32692, 1, 1, 1, 1, 1,
1.184452, 1.507595, 0.4732278, 1, 1, 1, 1, 1,
1.186144, 1.921687, 3.101244, 1, 1, 1, 1, 1,
1.193897, -2.211516, 4.868805, 1, 1, 1, 1, 1,
1.194264, 1.065036, -0.2654901, 1, 1, 1, 1, 1,
1.199803, -0.7053629, 0.301845, 1, 1, 1, 1, 1,
1.208094, -1.515618, 0.6637166, 1, 1, 1, 1, 1,
1.209126, 1.458869, -0.2292199, 1, 1, 1, 1, 1,
1.20974, -1.760426, 3.562752, 1, 1, 1, 1, 1,
1.212094, 0.0681067, 3.242378, 0, 0, 1, 1, 1,
1.21493, 0.3832016, 2.676788, 1, 0, 0, 1, 1,
1.22373, -0.8614372, 3.5702, 1, 0, 0, 1, 1,
1.236497, -0.1589029, 2.030216, 1, 0, 0, 1, 1,
1.24172, -0.2878479, 2.551933, 1, 0, 0, 1, 1,
1.243937, -0.756376, 1.928086, 1, 0, 0, 1, 1,
1.254789, -0.3758185, 2.510455, 0, 0, 0, 1, 1,
1.258694, 0.04013677, 2.765194, 0, 0, 0, 1, 1,
1.262615, 0.4802592, 0.987548, 0, 0, 0, 1, 1,
1.262881, -2.659791, 4.548672, 0, 0, 0, 1, 1,
1.262892, 0.8699326, 0.2555826, 0, 0, 0, 1, 1,
1.271227, -0.8815696, 1.919266, 0, 0, 0, 1, 1,
1.273247, 0.4973652, 2.395453, 0, 0, 0, 1, 1,
1.273502, -0.5802834, 1.28485, 1, 1, 1, 1, 1,
1.276358, 0.09514274, 1.522632, 1, 1, 1, 1, 1,
1.289624, 0.7021889, 2.168402, 1, 1, 1, 1, 1,
1.291708, 0.3996724, 1.115101, 1, 1, 1, 1, 1,
1.307645, 0.4324301, 0.1081639, 1, 1, 1, 1, 1,
1.310053, 0.4337647, 0.7359084, 1, 1, 1, 1, 1,
1.318598, 0.5286142, 1.484336, 1, 1, 1, 1, 1,
1.320805, 1.129485, 1.116475, 1, 1, 1, 1, 1,
1.335564, 0.5585102, 2.3123, 1, 1, 1, 1, 1,
1.343502, -2.470784, 1.958205, 1, 1, 1, 1, 1,
1.346275, -0.07070129, 3.31756, 1, 1, 1, 1, 1,
1.348386, -0.3871571, 2.453004, 1, 1, 1, 1, 1,
1.354986, -0.2574629, 2.481309, 1, 1, 1, 1, 1,
1.37489, 0.8616098, 1.097372, 1, 1, 1, 1, 1,
1.38451, 0.9217262, 0.8899331, 1, 1, 1, 1, 1,
1.38531, -0.5401029, 1.549668, 0, 0, 1, 1, 1,
1.388486, -0.3874174, 2.108473, 1, 0, 0, 1, 1,
1.391788, 0.4055929, 1.394888, 1, 0, 0, 1, 1,
1.3922, 1.319569, 2.532017, 1, 0, 0, 1, 1,
1.398025, 1.008463, -0.6518769, 1, 0, 0, 1, 1,
1.402782, 0.9351704, 0.6269153, 1, 0, 0, 1, 1,
1.404858, -2.269475, 0.4959451, 0, 0, 0, 1, 1,
1.405077, -0.8915641, 3.290639, 0, 0, 0, 1, 1,
1.413308, 0.9740932, 0.4864164, 0, 0, 0, 1, 1,
1.41488, -0.2744045, 1.38509, 0, 0, 0, 1, 1,
1.42109, 0.9893606, 0.8984506, 0, 0, 0, 1, 1,
1.42259, -0.06617608, 1.225025, 0, 0, 0, 1, 1,
1.424536, 2.533072, 1.667375, 0, 0, 0, 1, 1,
1.426496, 1.099718, -0.5606556, 1, 1, 1, 1, 1,
1.429679, -1.416551, 1.499716, 1, 1, 1, 1, 1,
1.437452, -0.6183397, 1.266661, 1, 1, 1, 1, 1,
1.43933, -0.7495311, 1.859544, 1, 1, 1, 1, 1,
1.449296, 0.1379496, -0.00478098, 1, 1, 1, 1, 1,
1.453834, -0.2679183, 1.86682, 1, 1, 1, 1, 1,
1.457773, -0.3120379, -0.03434926, 1, 1, 1, 1, 1,
1.465903, 0.8258526, 0.9824643, 1, 1, 1, 1, 1,
1.485041, -0.5567587, 3.728716, 1, 1, 1, 1, 1,
1.492628, -0.07060441, 1.607858, 1, 1, 1, 1, 1,
1.511062, -0.5871029, 1.547234, 1, 1, 1, 1, 1,
1.535372, 0.4919016, 0.4318962, 1, 1, 1, 1, 1,
1.542901, 0.6246496, 2.727633, 1, 1, 1, 1, 1,
1.546402, 0.6212079, 1.641935, 1, 1, 1, 1, 1,
1.552892, 0.09727026, 1.75754, 1, 1, 1, 1, 1,
1.555208, 0.5278304, 1.788587, 0, 0, 1, 1, 1,
1.560038, -0.07135431, 1.264118, 1, 0, 0, 1, 1,
1.57363, 0.8559545, -0.007301894, 1, 0, 0, 1, 1,
1.576301, -1.468486, 1.004985, 1, 0, 0, 1, 1,
1.590944, -1.859878, 3.192577, 1, 0, 0, 1, 1,
1.591581, 0.4044584, 1.967773, 1, 0, 0, 1, 1,
1.592269, -1.214236, 2.538135, 0, 0, 0, 1, 1,
1.609084, 1.5338, 1.840825, 0, 0, 0, 1, 1,
1.613385, 0.190686, 2.598644, 0, 0, 0, 1, 1,
1.615074, -1.785723, 0.989458, 0, 0, 0, 1, 1,
1.617408, 0.8825654, 1.633599, 0, 0, 0, 1, 1,
1.63179, -1.425408, 1.194643, 0, 0, 0, 1, 1,
1.632133, -1.318377, 2.139303, 0, 0, 0, 1, 1,
1.638973, -0.1007453, 1.178964, 1, 1, 1, 1, 1,
1.644261, 1.586946, 1.807542, 1, 1, 1, 1, 1,
1.661631, -2.354059, 3.538386, 1, 1, 1, 1, 1,
1.68831, 1.366162, 1.065853, 1, 1, 1, 1, 1,
1.700713, 0.4088348, 1.244059, 1, 1, 1, 1, 1,
1.701298, 1.481931, 1.036855, 1, 1, 1, 1, 1,
1.705751, -0.4596463, 0.07610107, 1, 1, 1, 1, 1,
1.709662, -0.6793093, 2.43964, 1, 1, 1, 1, 1,
1.739752, -1.120996, 4.795693, 1, 1, 1, 1, 1,
1.74668, -2.360358, 0.9637594, 1, 1, 1, 1, 1,
1.789984, -0.07385223, 2.075211, 1, 1, 1, 1, 1,
1.794321, 0.6041182, 1.1979, 1, 1, 1, 1, 1,
1.802642, -2.159329, 3.324868, 1, 1, 1, 1, 1,
1.861706, 1.82492, 0.3432437, 1, 1, 1, 1, 1,
1.875, 0.4564751, 2.231398, 1, 1, 1, 1, 1,
1.892429, 0.2954645, 0.1749581, 0, 0, 1, 1, 1,
1.892596, 0.6479477, -0.05842965, 1, 0, 0, 1, 1,
1.930025, 0.7043868, 3.348652, 1, 0, 0, 1, 1,
1.934212, -0.6410549, 2.009506, 1, 0, 0, 1, 1,
1.979712, 0.08402357, -0.3950668, 1, 0, 0, 1, 1,
2.022051, -1.537223, 2.285545, 1, 0, 0, 1, 1,
2.02975, -0.9785278, 1.859302, 0, 0, 0, 1, 1,
2.033268, 0.2307123, 3.399683, 0, 0, 0, 1, 1,
2.04333, 0.221081, 1.69782, 0, 0, 0, 1, 1,
2.05693, 1.674376, -0.3511013, 0, 0, 0, 1, 1,
2.104756, 0.6708348, 0.5553675, 0, 0, 0, 1, 1,
2.124501, -0.2984475, 1.232597, 0, 0, 0, 1, 1,
2.149398, -0.5737744, 2.329106, 0, 0, 0, 1, 1,
2.15447, 0.1419042, 0.7037117, 1, 1, 1, 1, 1,
2.155349, -1.196161, 2.761894, 1, 1, 1, 1, 1,
2.221741, -0.6664571, 1.622475, 1, 1, 1, 1, 1,
2.228225, 1.770422, 1.582218, 1, 1, 1, 1, 1,
2.231758, -1.007474, 1.581144, 1, 1, 1, 1, 1,
2.378008, -0.3418341, 2.29166, 1, 1, 1, 1, 1,
2.420062, 0.5065538, -0.5707462, 1, 1, 1, 1, 1
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
var radius = 9.326638;
var distance = 32.75942;
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
mvMatrix.translate( 0.573193, 0.3287493, -0.01718187 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.75942);
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
