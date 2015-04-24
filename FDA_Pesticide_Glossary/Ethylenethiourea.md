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
-4.010753, 0.2637011, 1.025061, 1, 0, 0, 1,
-3.110729, 0.3763212, 0.3376993, 1, 0.007843138, 0, 1,
-2.930174, 0.0633373, -2.234955, 1, 0.01176471, 0, 1,
-2.777438, 0.08582602, -1.770578, 1, 0.01960784, 0, 1,
-2.710828, 1.044876, -0.08431325, 1, 0.02352941, 0, 1,
-2.671993, -0.3025996, -2.625197, 1, 0.03137255, 0, 1,
-2.610124, -0.7899429, -4.555399, 1, 0.03529412, 0, 1,
-2.561442, 0.4361559, -1.645945, 1, 0.04313726, 0, 1,
-2.514586, 0.4972263, -1.029577, 1, 0.04705882, 0, 1,
-2.377094, -1.78741, -3.188537, 1, 0.05490196, 0, 1,
-2.345596, 0.018405, -0.6410426, 1, 0.05882353, 0, 1,
-2.338108, 0.6612408, 0.346745, 1, 0.06666667, 0, 1,
-2.284035, 0.3595368, 0.06040088, 1, 0.07058824, 0, 1,
-2.270754, -0.4211962, -3.132094, 1, 0.07843138, 0, 1,
-2.235098, -1.909992, -0.3432084, 1, 0.08235294, 0, 1,
-2.22541, 0.4733901, -0.4161355, 1, 0.09019608, 0, 1,
-2.21622, -0.3261296, 0.2438758, 1, 0.09411765, 0, 1,
-2.203244, -0.3034084, -3.137689, 1, 0.1019608, 0, 1,
-2.148452, 0.2440526, -0.8042272, 1, 0.1098039, 0, 1,
-2.146335, 0.07426662, -2.431825, 1, 0.1137255, 0, 1,
-2.144605, 0.04892594, -1.473543, 1, 0.1215686, 0, 1,
-2.103323, -0.08677493, -2.250939, 1, 0.1254902, 0, 1,
-2.097798, 0.2812956, -0.8009882, 1, 0.1333333, 0, 1,
-2.064028, 1.316721, -0.3427047, 1, 0.1372549, 0, 1,
-2.062081, 0.5598215, -0.07775242, 1, 0.145098, 0, 1,
-2.052736, 0.8653785, -1.650871, 1, 0.1490196, 0, 1,
-2.049246, 0.706232, -2.414912, 1, 0.1568628, 0, 1,
-2.019146, 0.1170455, -0.5713788, 1, 0.1607843, 0, 1,
-1.985262, -0.9444598, -2.374467, 1, 0.1686275, 0, 1,
-1.983342, -1.185881, -2.271095, 1, 0.172549, 0, 1,
-1.972518, 0.701766, -0.4397517, 1, 0.1803922, 0, 1,
-1.963855, 0.4074305, 0.2227622, 1, 0.1843137, 0, 1,
-1.953545, 0.5101686, -0.2694505, 1, 0.1921569, 0, 1,
-1.948886, 1.366779, -1.174594, 1, 0.1960784, 0, 1,
-1.933468, 0.669761, -0.2001033, 1, 0.2039216, 0, 1,
-1.923179, -0.4814139, -2.879344, 1, 0.2117647, 0, 1,
-1.922263, -0.1824255, -2.140979, 1, 0.2156863, 0, 1,
-1.916415, 0.02189643, -1.407828, 1, 0.2235294, 0, 1,
-1.913818, 0.9893417, -1.416424, 1, 0.227451, 0, 1,
-1.907022, -1.334522, -0.9628993, 1, 0.2352941, 0, 1,
-1.88742, 1.114222, -1.236939, 1, 0.2392157, 0, 1,
-1.875071, 0.3330957, -0.8354322, 1, 0.2470588, 0, 1,
-1.845317, 1.368774, -1.281952, 1, 0.2509804, 0, 1,
-1.831876, 0.7734871, 0.01805269, 1, 0.2588235, 0, 1,
-1.787219, 0.3177343, -2.483595, 1, 0.2627451, 0, 1,
-1.771936, -1.573709, -2.283519, 1, 0.2705882, 0, 1,
-1.760884, -0.5360629, -1.358205, 1, 0.2745098, 0, 1,
-1.750725, -0.9758521, -1.792632, 1, 0.282353, 0, 1,
-1.743176, -0.6158711, -3.010923, 1, 0.2862745, 0, 1,
-1.742653, -0.9863285, -1.884035, 1, 0.2941177, 0, 1,
-1.729441, -1.747682, -3.865821, 1, 0.3019608, 0, 1,
-1.716962, 0.8959975, -1.96737, 1, 0.3058824, 0, 1,
-1.684876, 1.98916, -2.431016, 1, 0.3137255, 0, 1,
-1.680972, -0.7022215, -2.611586, 1, 0.3176471, 0, 1,
-1.677883, 0.7103693, -0.9085893, 1, 0.3254902, 0, 1,
-1.671492, -0.4865556, -0.6175672, 1, 0.3294118, 0, 1,
-1.670922, 0.3395686, -1.255664, 1, 0.3372549, 0, 1,
-1.66908, 0.8170898, -1.589005, 1, 0.3411765, 0, 1,
-1.643485, -0.5989769, -2.368686, 1, 0.3490196, 0, 1,
-1.641127, 0.5132742, -1.56636, 1, 0.3529412, 0, 1,
-1.616651, 0.07873505, -1.91587, 1, 0.3607843, 0, 1,
-1.61611, -1.656613, -3.131306, 1, 0.3647059, 0, 1,
-1.609173, 1.920125, -0.6085126, 1, 0.372549, 0, 1,
-1.607378, 0.4928988, -1.964346, 1, 0.3764706, 0, 1,
-1.593193, -0.2724167, -2.384341, 1, 0.3843137, 0, 1,
-1.591076, 0.5712774, 0.3475687, 1, 0.3882353, 0, 1,
-1.588408, 0.1338366, -0.05814927, 1, 0.3960784, 0, 1,
-1.552801, -0.06732378, -0.9048967, 1, 0.4039216, 0, 1,
-1.552174, 0.09290454, -0.1867592, 1, 0.4078431, 0, 1,
-1.547259, 1.331516, -0.3746387, 1, 0.4156863, 0, 1,
-1.527585, -0.7372587, -2.650159, 1, 0.4196078, 0, 1,
-1.525583, -1.290226, -2.411122, 1, 0.427451, 0, 1,
-1.523874, 0.6704791, -0.3988581, 1, 0.4313726, 0, 1,
-1.521912, -0.3226643, -2.286562, 1, 0.4392157, 0, 1,
-1.50694, -0.2015211, -1.447902, 1, 0.4431373, 0, 1,
-1.503353, 0.06901393, -2.790295, 1, 0.4509804, 0, 1,
-1.480713, -0.5475742, -0.7853947, 1, 0.454902, 0, 1,
-1.475674, -0.02745296, -2.901229, 1, 0.4627451, 0, 1,
-1.469759, -0.4711288, -1.039075, 1, 0.4666667, 0, 1,
-1.467403, -1.702533, -2.235471, 1, 0.4745098, 0, 1,
-1.465679, -0.9318588, -2.28537, 1, 0.4784314, 0, 1,
-1.463479, 1.750832, -0.07253865, 1, 0.4862745, 0, 1,
-1.454724, -1.290713, -3.079335, 1, 0.4901961, 0, 1,
-1.451145, 0.5720614, -1.734567, 1, 0.4980392, 0, 1,
-1.450589, -0.4989405, -2.39348, 1, 0.5058824, 0, 1,
-1.449111, -0.390598, -0.5555636, 1, 0.509804, 0, 1,
-1.447071, 0.858774, -1.020632, 1, 0.5176471, 0, 1,
-1.443169, 0.4630306, -2.057823, 1, 0.5215687, 0, 1,
-1.4293, 1.095993, -1.94014, 1, 0.5294118, 0, 1,
-1.428656, 1.145276, -0.9981937, 1, 0.5333334, 0, 1,
-1.425892, 1.562341, -0.4826567, 1, 0.5411765, 0, 1,
-1.403247, 0.4424782, -0.02256038, 1, 0.5450981, 0, 1,
-1.384266, -0.4951691, -2.510094, 1, 0.5529412, 0, 1,
-1.374198, 0.4060173, -1.089064, 1, 0.5568628, 0, 1,
-1.362108, 0.7764864, -0.002212244, 1, 0.5647059, 0, 1,
-1.35573, -2.069276, -2.47568, 1, 0.5686275, 0, 1,
-1.350338, -1.409442, -1.691335, 1, 0.5764706, 0, 1,
-1.340959, 0.3061303, -3.338537, 1, 0.5803922, 0, 1,
-1.334834, 0.2596733, -3.44761, 1, 0.5882353, 0, 1,
-1.334674, 1.202816, -1.18155, 1, 0.5921569, 0, 1,
-1.328801, -0.7649899, -2.769417, 1, 0.6, 0, 1,
-1.32641, -0.06685659, -2.266116, 1, 0.6078432, 0, 1,
-1.320095, 1.476359, -0.2862686, 1, 0.6117647, 0, 1,
-1.31876, 0.6484281, -2.426886, 1, 0.6196079, 0, 1,
-1.303488, 0.1763093, -1.405664, 1, 0.6235294, 0, 1,
-1.300783, 1.992011, -0.01355725, 1, 0.6313726, 0, 1,
-1.298338, -0.3343142, -1.451021, 1, 0.6352941, 0, 1,
-1.293775, 0.4843735, -0.4302848, 1, 0.6431373, 0, 1,
-1.29344, -1.481555, -2.474388, 1, 0.6470588, 0, 1,
-1.278896, 0.3004239, -0.9387419, 1, 0.654902, 0, 1,
-1.267353, 0.3781278, -0.5021686, 1, 0.6588235, 0, 1,
-1.265951, -1.675455, -3.753891, 1, 0.6666667, 0, 1,
-1.250255, 0.3157063, -0.8459648, 1, 0.6705883, 0, 1,
-1.23879, 0.5492533, -1.110069, 1, 0.6784314, 0, 1,
-1.237691, -0.3506948, -1.493415, 1, 0.682353, 0, 1,
-1.234967, -0.987116, -2.390349, 1, 0.6901961, 0, 1,
-1.227097, 1.637551, -1.413614, 1, 0.6941177, 0, 1,
-1.226769, -0.5334454, -1.47176, 1, 0.7019608, 0, 1,
-1.219251, -1.615862, -1.777849, 1, 0.7098039, 0, 1,
-1.215462, 1.226763, -0.9136871, 1, 0.7137255, 0, 1,
-1.209966, -0.71825, -3.835222, 1, 0.7215686, 0, 1,
-1.167733, 0.1034454, -1.419644, 1, 0.7254902, 0, 1,
-1.166857, -0.9483564, -1.715703, 1, 0.7333333, 0, 1,
-1.164021, 0.426779, -0.6562124, 1, 0.7372549, 0, 1,
-1.153069, 0.6177563, -0.0762194, 1, 0.7450981, 0, 1,
-1.150751, -0.5293425, -0.3903792, 1, 0.7490196, 0, 1,
-1.150733, -0.7860747, -1.451563, 1, 0.7568628, 0, 1,
-1.147483, -0.6274045, -3.189155, 1, 0.7607843, 0, 1,
-1.143284, -1.186575, -1.821994, 1, 0.7686275, 0, 1,
-1.140832, 0.1259191, -1.638269, 1, 0.772549, 0, 1,
-1.137845, -0.7466062, -4.290548, 1, 0.7803922, 0, 1,
-1.136065, -0.3861573, -3.031006, 1, 0.7843137, 0, 1,
-1.134969, -0.1691298, -2.273089, 1, 0.7921569, 0, 1,
-1.134189, 0.3238236, -2.942641, 1, 0.7960784, 0, 1,
-1.122713, 0.5495709, -0.1106923, 1, 0.8039216, 0, 1,
-1.120189, 1.097781, -0.6741159, 1, 0.8117647, 0, 1,
-1.115486, -0.4874453, -3.724679, 1, 0.8156863, 0, 1,
-1.113962, 1.795235, -0.4110716, 1, 0.8235294, 0, 1,
-1.1065, -0.3266031, -0.9475919, 1, 0.827451, 0, 1,
-1.105738, 0.2574291, -2.099204, 1, 0.8352941, 0, 1,
-1.104119, 0.0005624659, -2.738709, 1, 0.8392157, 0, 1,
-1.100075, -0.785157, -2.538538, 1, 0.8470588, 0, 1,
-1.09484, -0.869306, -2.955479, 1, 0.8509804, 0, 1,
-1.081791, -0.2022897, -1.781044, 1, 0.8588235, 0, 1,
-1.073562, -0.1639319, -0.8294408, 1, 0.8627451, 0, 1,
-1.071081, 0.5554222, -2.343465, 1, 0.8705882, 0, 1,
-1.065886, -0.05218712, -2.588635, 1, 0.8745098, 0, 1,
-1.062221, 1.096603, 0.8366874, 1, 0.8823529, 0, 1,
-1.062198, 0.8130711, -1.558377, 1, 0.8862745, 0, 1,
-1.056206, -0.08287037, 0.2404253, 1, 0.8941177, 0, 1,
-1.055322, 0.3106501, -0.652283, 1, 0.8980392, 0, 1,
-1.051563, -1.095572, -3.111766, 1, 0.9058824, 0, 1,
-1.049772, 0.350188, -1.180895, 1, 0.9137255, 0, 1,
-1.04208, 0.05836133, -2.40577, 1, 0.9176471, 0, 1,
-1.034845, -0.5113563, -1.356946, 1, 0.9254902, 0, 1,
-1.028182, 0.2213489, -1.37892, 1, 0.9294118, 0, 1,
-1.028072, -0.2210367, -4.746919, 1, 0.9372549, 0, 1,
-1.021703, -0.4762073, -2.678265, 1, 0.9411765, 0, 1,
-1.018434, 0.8054159, -1.060602, 1, 0.9490196, 0, 1,
-1.009892, 0.2481979, -3.551722, 1, 0.9529412, 0, 1,
-1.009472, -1.801918, -3.466565, 1, 0.9607843, 0, 1,
-1.009172, 0.4208805, -1.316255, 1, 0.9647059, 0, 1,
-1.007944, -0.01872909, -1.504006, 1, 0.972549, 0, 1,
-1.006176, -1.844388, -2.401743, 1, 0.9764706, 0, 1,
-1.006124, 0.1667863, -2.462293, 1, 0.9843137, 0, 1,
-0.9935786, 1.131705, -0.432165, 1, 0.9882353, 0, 1,
-0.9903815, -1.469119, -3.145474, 1, 0.9960784, 0, 1,
-0.9880854, 0.6088145, -1.38033, 0.9960784, 1, 0, 1,
-0.9809905, 1.353305, 0.05445205, 0.9921569, 1, 0, 1,
-0.9680705, -0.02661191, -2.55274, 0.9843137, 1, 0, 1,
-0.9640084, -0.7077875, -4.11859, 0.9803922, 1, 0, 1,
-0.9627945, 0.4774031, -0.6299662, 0.972549, 1, 0, 1,
-0.9616712, -0.9852422, -2.562196, 0.9686275, 1, 0, 1,
-0.9612338, 1.529048, -0.809603, 0.9607843, 1, 0, 1,
-0.9582145, -0.4582081, -0.8171922, 0.9568627, 1, 0, 1,
-0.9518153, 1.151507, -2.998554, 0.9490196, 1, 0, 1,
-0.9511762, 0.09180409, -1.341179, 0.945098, 1, 0, 1,
-0.9465742, -1.527565, -4.220137, 0.9372549, 1, 0, 1,
-0.945807, -2.605043, -2.591875, 0.9333333, 1, 0, 1,
-0.9317435, 0.05347987, -1.825536, 0.9254902, 1, 0, 1,
-0.9313605, 0.3250766, -1.330994, 0.9215686, 1, 0, 1,
-0.9304244, 0.4556422, 0.1333226, 0.9137255, 1, 0, 1,
-0.9303771, -2.095439, -4.75966, 0.9098039, 1, 0, 1,
-0.9248545, -1.105378, -0.7706097, 0.9019608, 1, 0, 1,
-0.9199233, -0.7981099, -3.725083, 0.8941177, 1, 0, 1,
-0.9145836, 0.8945029, 0.9123068, 0.8901961, 1, 0, 1,
-0.9135754, -1.620913, -2.759531, 0.8823529, 1, 0, 1,
-0.9115711, 0.3060501, 0.3336122, 0.8784314, 1, 0, 1,
-0.9063126, -0.4192118, -1.190507, 0.8705882, 1, 0, 1,
-0.9010956, -1.076046, -3.194707, 0.8666667, 1, 0, 1,
-0.9000637, 1.90809, -0.1473849, 0.8588235, 1, 0, 1,
-0.8951096, 2.004271, 1.19331, 0.854902, 1, 0, 1,
-0.8919519, -1.176346, -2.619488, 0.8470588, 1, 0, 1,
-0.8880515, 0.907001, 0.6449083, 0.8431373, 1, 0, 1,
-0.8865152, -0.7479622, -1.924537, 0.8352941, 1, 0, 1,
-0.8858719, -0.1209582, -0.5531733, 0.8313726, 1, 0, 1,
-0.8836978, 0.3480996, -2.02337, 0.8235294, 1, 0, 1,
-0.8822008, 1.232865, -0.2134573, 0.8196079, 1, 0, 1,
-0.8818994, -1.338603, -1.922922, 0.8117647, 1, 0, 1,
-0.8716087, -1.709643, -3.787492, 0.8078431, 1, 0, 1,
-0.8668015, 0.4050725, -1.675809, 0.8, 1, 0, 1,
-0.857771, 3.400195, -0.7500504, 0.7921569, 1, 0, 1,
-0.8529091, 0.5738022, -2.245102, 0.7882353, 1, 0, 1,
-0.8517979, 1.80434, -0.8507745, 0.7803922, 1, 0, 1,
-0.8511572, 0.746914, -1.104935, 0.7764706, 1, 0, 1,
-0.8443586, -0.5049925, -2.749612, 0.7686275, 1, 0, 1,
-0.8413991, 0.6939583, 0.670902, 0.7647059, 1, 0, 1,
-0.8411613, -0.6228358, -0.4467031, 0.7568628, 1, 0, 1,
-0.8399063, 1.373569, -1.038554, 0.7529412, 1, 0, 1,
-0.8338844, -1.323511, -2.762751, 0.7450981, 1, 0, 1,
-0.8308541, -0.3890683, -4.12962, 0.7411765, 1, 0, 1,
-0.8239083, -0.5186116, -1.710465, 0.7333333, 1, 0, 1,
-0.8219152, 0.5323441, -1.425168, 0.7294118, 1, 0, 1,
-0.8195714, 0.2323488, -1.878622, 0.7215686, 1, 0, 1,
-0.8188993, -1.459284, -2.349587, 0.7176471, 1, 0, 1,
-0.8128094, -1.164452, -1.712987, 0.7098039, 1, 0, 1,
-0.8127886, 1.396699, -1.082502, 0.7058824, 1, 0, 1,
-0.8090898, 0.4161575, -1.701604, 0.6980392, 1, 0, 1,
-0.8084831, -0.6088634, -1.815032, 0.6901961, 1, 0, 1,
-0.8064335, -0.1896662, -0.8391899, 0.6862745, 1, 0, 1,
-0.8033351, -0.2268573, -3.072753, 0.6784314, 1, 0, 1,
-0.8013966, 0.4942312, -2.530637, 0.6745098, 1, 0, 1,
-0.8009183, 0.07345302, -1.033843, 0.6666667, 1, 0, 1,
-0.7937221, -0.2035478, -1.893955, 0.6627451, 1, 0, 1,
-0.7764357, 0.7474753, 0.6570432, 0.654902, 1, 0, 1,
-0.7726341, -1.84183, -2.586964, 0.6509804, 1, 0, 1,
-0.7683722, 0.5865855, -0.4856412, 0.6431373, 1, 0, 1,
-0.7681586, -0.1827669, -2.675807, 0.6392157, 1, 0, 1,
-0.7680578, 0.02869436, -0.335889, 0.6313726, 1, 0, 1,
-0.7677322, 0.1887701, -0.2028117, 0.627451, 1, 0, 1,
-0.759503, -0.9062052, -3.579072, 0.6196079, 1, 0, 1,
-0.7576753, 1.202761, 0.9883929, 0.6156863, 1, 0, 1,
-0.7517535, -0.8642099, -2.764006, 0.6078432, 1, 0, 1,
-0.748208, -0.9427108, -0.6900936, 0.6039216, 1, 0, 1,
-0.7453321, 0.1775788, -0.4761021, 0.5960785, 1, 0, 1,
-0.7403521, -0.5982458, -2.359229, 0.5882353, 1, 0, 1,
-0.7366832, 1.120941, -1.972072, 0.5843138, 1, 0, 1,
-0.7350674, 0.8266649, -2.860255, 0.5764706, 1, 0, 1,
-0.7331249, -0.8814816, -3.235043, 0.572549, 1, 0, 1,
-0.7311988, 1.592022, -2.622565, 0.5647059, 1, 0, 1,
-0.7308671, -0.1901956, -2.060438, 0.5607843, 1, 0, 1,
-0.7296021, 0.5266953, -1.6887, 0.5529412, 1, 0, 1,
-0.7238055, 0.5416013, -0.5546846, 0.5490196, 1, 0, 1,
-0.72324, -1.074026, -1.673767, 0.5411765, 1, 0, 1,
-0.7229978, 1.617501, 1.599222, 0.5372549, 1, 0, 1,
-0.7220916, 0.05160782, -0.3493877, 0.5294118, 1, 0, 1,
-0.7181919, -0.1901907, -2.722063, 0.5254902, 1, 0, 1,
-0.7176747, -0.3909283, -2.965428, 0.5176471, 1, 0, 1,
-0.7155095, 1.125853, -0.250172, 0.5137255, 1, 0, 1,
-0.7139559, 1.816117, -1.101569, 0.5058824, 1, 0, 1,
-0.7122946, -0.9922962, -3.077013, 0.5019608, 1, 0, 1,
-0.711023, -0.587252, -2.511841, 0.4941176, 1, 0, 1,
-0.709983, -1.602535, -2.773645, 0.4862745, 1, 0, 1,
-0.7062593, 2.284285, 0.5443719, 0.4823529, 1, 0, 1,
-0.7007275, -0.08562275, -0.6558832, 0.4745098, 1, 0, 1,
-0.6980453, 2.012565, -0.4312863, 0.4705882, 1, 0, 1,
-0.6972988, 1.006427, -0.481811, 0.4627451, 1, 0, 1,
-0.6908266, 0.4731653, 1.098997, 0.4588235, 1, 0, 1,
-0.6887465, -0.8023543, -2.815546, 0.4509804, 1, 0, 1,
-0.6799763, 1.954177, -0.4561191, 0.4470588, 1, 0, 1,
-0.678036, -0.5433798, -2.975683, 0.4392157, 1, 0, 1,
-0.6772149, -0.7566098, -1.989514, 0.4352941, 1, 0, 1,
-0.6745237, 0.1982944, -1.806764, 0.427451, 1, 0, 1,
-0.6721483, -1.915869, -2.634674, 0.4235294, 1, 0, 1,
-0.6676968, 0.2498753, 0.1791734, 0.4156863, 1, 0, 1,
-0.650574, 0.2007519, -0.6031974, 0.4117647, 1, 0, 1,
-0.6494502, -1.043748, -1.757823, 0.4039216, 1, 0, 1,
-0.6450318, -0.01118237, -0.2233376, 0.3960784, 1, 0, 1,
-0.6421612, -0.9678646, -1.756128, 0.3921569, 1, 0, 1,
-0.6413094, -0.4083382, -3.51643, 0.3843137, 1, 0, 1,
-0.6368873, 1.219673, -0.2831726, 0.3803922, 1, 0, 1,
-0.6299658, -1.333845, -1.470186, 0.372549, 1, 0, 1,
-0.6266769, -0.8288357, -1.353872, 0.3686275, 1, 0, 1,
-0.6266013, 0.414064, -3.113237, 0.3607843, 1, 0, 1,
-0.614871, 0.8336588, -1.705738, 0.3568628, 1, 0, 1,
-0.6131319, -0.6623133, -2.742129, 0.3490196, 1, 0, 1,
-0.6109536, 0.550461, -0.3377923, 0.345098, 1, 0, 1,
-0.6077365, -0.1669355, -3.100842, 0.3372549, 1, 0, 1,
-0.6070585, 0.1409058, -1.527457, 0.3333333, 1, 0, 1,
-0.5876079, -1.141435, -3.850807, 0.3254902, 1, 0, 1,
-0.5822396, -0.452215, -1.580028, 0.3215686, 1, 0, 1,
-0.576323, -0.2145358, -1.557725, 0.3137255, 1, 0, 1,
-0.5698321, 0.2753597, -1.983134, 0.3098039, 1, 0, 1,
-0.5621312, -1.030089, -1.197726, 0.3019608, 1, 0, 1,
-0.5615562, 0.3146226, -4.228972, 0.2941177, 1, 0, 1,
-0.5611123, 1.030802, -1.072283, 0.2901961, 1, 0, 1,
-0.553493, -0.04501827, -0.5219074, 0.282353, 1, 0, 1,
-0.5514829, -0.2994455, -5.681542, 0.2784314, 1, 0, 1,
-0.5476595, -1.065813, -2.185817, 0.2705882, 1, 0, 1,
-0.5469416, 1.623293, 0.08204573, 0.2666667, 1, 0, 1,
-0.54543, -1.216417, -2.517361, 0.2588235, 1, 0, 1,
-0.5401094, -0.4235573, -2.394785, 0.254902, 1, 0, 1,
-0.5389498, 1.313101, -1.712046, 0.2470588, 1, 0, 1,
-0.5361022, 1.39007, -1.072643, 0.2431373, 1, 0, 1,
-0.5335205, 1.762747, -1.129673, 0.2352941, 1, 0, 1,
-0.5302914, -0.0318493, -0.6330076, 0.2313726, 1, 0, 1,
-0.528722, -0.689151, -4.624483, 0.2235294, 1, 0, 1,
-0.5284248, -0.3683814, -1.181594, 0.2196078, 1, 0, 1,
-0.5263034, -0.3305906, -2.594715, 0.2117647, 1, 0, 1,
-0.5209165, -0.4836131, -3.460612, 0.2078431, 1, 0, 1,
-0.5194029, -1.155089, -3.445486, 0.2, 1, 0, 1,
-0.5175673, 0.1011772, -2.293058, 0.1921569, 1, 0, 1,
-0.516435, 0.4380058, -0.9171563, 0.1882353, 1, 0, 1,
-0.5073078, -1.057078, -0.9814109, 0.1803922, 1, 0, 1,
-0.5045578, 0.45041, -0.1637101, 0.1764706, 1, 0, 1,
-0.500152, -2.372079, -2.933004, 0.1686275, 1, 0, 1,
-0.4973808, 0.4351805, -0.9913636, 0.1647059, 1, 0, 1,
-0.495292, -0.8490309, -2.628358, 0.1568628, 1, 0, 1,
-0.494748, 0.1559515, -0.6596431, 0.1529412, 1, 0, 1,
-0.4923725, 0.3782333, 0.1636803, 0.145098, 1, 0, 1,
-0.4920225, 0.6516258, -0.4975026, 0.1411765, 1, 0, 1,
-0.4907988, -0.595583, -2.48074, 0.1333333, 1, 0, 1,
-0.4886138, 0.664851, 0.3671401, 0.1294118, 1, 0, 1,
-0.4867235, -0.1149952, -2.306502, 0.1215686, 1, 0, 1,
-0.4827158, -0.2772244, -4.582121, 0.1176471, 1, 0, 1,
-0.4821415, 0.6679288, -0.6245378, 0.1098039, 1, 0, 1,
-0.4690476, 0.2699093, 0.3697174, 0.1058824, 1, 0, 1,
-0.463045, 0.2052079, -0.6135182, 0.09803922, 1, 0, 1,
-0.4593117, -0.9146933, -3.655202, 0.09019608, 1, 0, 1,
-0.4507526, 0.07634153, -0.9111674, 0.08627451, 1, 0, 1,
-0.447764, 0.4384978, -1.013526, 0.07843138, 1, 0, 1,
-0.4469494, -1.160971, -1.938583, 0.07450981, 1, 0, 1,
-0.4442786, 0.2144041, -0.8515134, 0.06666667, 1, 0, 1,
-0.4403124, 0.6556466, -2.169502, 0.0627451, 1, 0, 1,
-0.4375487, -1.266016, -3.383003, 0.05490196, 1, 0, 1,
-0.4324738, 0.927028, -2.518436, 0.05098039, 1, 0, 1,
-0.4264699, 0.5703592, -0.4634082, 0.04313726, 1, 0, 1,
-0.4255528, 1.6704, -0.6086352, 0.03921569, 1, 0, 1,
-0.4242761, -2.445793, -3.18727, 0.03137255, 1, 0, 1,
-0.4238018, -0.226312, -1.961816, 0.02745098, 1, 0, 1,
-0.4237225, 1.215325, -0.1515209, 0.01960784, 1, 0, 1,
-0.4191421, 0.7525753, 0.7323374, 0.01568628, 1, 0, 1,
-0.4155208, 0.1014491, -2.252135, 0.007843138, 1, 0, 1,
-0.4151136, -1.152418, -4.303024, 0.003921569, 1, 0, 1,
-0.4140865, -1.462526, -5.120261, 0, 1, 0.003921569, 1,
-0.4111491, -0.2758668, -3.234236, 0, 1, 0.01176471, 1,
-0.407895, -1.128729, -3.050505, 0, 1, 0.01568628, 1,
-0.4052789, 0.9983147, 0.6613947, 0, 1, 0.02352941, 1,
-0.4050073, 0.3920667, 1.406981, 0, 1, 0.02745098, 1,
-0.4012201, -1.13725, -0.8925129, 0, 1, 0.03529412, 1,
-0.4002534, -0.5351431, -0.3247225, 0, 1, 0.03921569, 1,
-0.3985789, -0.413521, -1.300188, 0, 1, 0.04705882, 1,
-0.3963669, -0.5418315, -2.500156, 0, 1, 0.05098039, 1,
-0.3906125, 0.1742477, -1.423792, 0, 1, 0.05882353, 1,
-0.3896661, 1.113976, -0.1012252, 0, 1, 0.0627451, 1,
-0.3894747, -0.1000408, 0.1570357, 0, 1, 0.07058824, 1,
-0.3833464, 0.1460047, -3.538956, 0, 1, 0.07450981, 1,
-0.3827757, 0.791778, -1.42696, 0, 1, 0.08235294, 1,
-0.3805411, 0.7823718, -0.8216559, 0, 1, 0.08627451, 1,
-0.3802964, 0.7915638, 1.958502, 0, 1, 0.09411765, 1,
-0.3791173, -0.1041436, -3.145369, 0, 1, 0.1019608, 1,
-0.3787983, 0.3532839, -1.800763, 0, 1, 0.1058824, 1,
-0.3663412, 0.228724, 0.1853846, 0, 1, 0.1137255, 1,
-0.3646206, -0.9238075, -2.491114, 0, 1, 0.1176471, 1,
-0.3640004, -0.7387442, -2.114082, 0, 1, 0.1254902, 1,
-0.3587397, -0.5043365, -3.166749, 0, 1, 0.1294118, 1,
-0.3557875, -0.8056157, -1.833013, 0, 1, 0.1372549, 1,
-0.3525477, 0.576923, -2.750827, 0, 1, 0.1411765, 1,
-0.3525284, -1.510361, -2.755114, 0, 1, 0.1490196, 1,
-0.3501876, -1.556, -3.553662, 0, 1, 0.1529412, 1,
-0.3497345, 2.496589, 0.09738526, 0, 1, 0.1607843, 1,
-0.3479094, -0.206852, -3.451458, 0, 1, 0.1647059, 1,
-0.3466382, -0.3511173, -1.570564, 0, 1, 0.172549, 1,
-0.3464006, -0.736882, -2.114671, 0, 1, 0.1764706, 1,
-0.3396085, 1.256971, -1.044507, 0, 1, 0.1843137, 1,
-0.3377174, 2.142985, 0.1883493, 0, 1, 0.1882353, 1,
-0.3373191, -0.37176, -1.136296, 0, 1, 0.1960784, 1,
-0.3356395, 0.6785927, -0.5414361, 0, 1, 0.2039216, 1,
-0.3347824, 0.668429, -0.2890921, 0, 1, 0.2078431, 1,
-0.3346622, -2.23388, -3.523293, 0, 1, 0.2156863, 1,
-0.3317179, 0.8973578, -1.237463, 0, 1, 0.2196078, 1,
-0.3256354, -2.084849, -2.793746, 0, 1, 0.227451, 1,
-0.3233407, -0.1962247, -4.242902, 0, 1, 0.2313726, 1,
-0.3219799, -1.299531, -3.718324, 0, 1, 0.2392157, 1,
-0.3204179, 0.09226292, -3.155579, 0, 1, 0.2431373, 1,
-0.3166831, -1.214838, -2.572918, 0, 1, 0.2509804, 1,
-0.3157887, -0.1162026, -0.6192676, 0, 1, 0.254902, 1,
-0.309598, 0.7533982, -0.05617779, 0, 1, 0.2627451, 1,
-0.3079109, -0.2661048, -4.239566, 0, 1, 0.2666667, 1,
-0.3067129, 0.9125651, -1.287453, 0, 1, 0.2745098, 1,
-0.3020961, 1.253119, -1.392455, 0, 1, 0.2784314, 1,
-0.300836, 0.2617059, -0.400405, 0, 1, 0.2862745, 1,
-0.2987676, -1.038942, -2.650736, 0, 1, 0.2901961, 1,
-0.2986217, -2.938972, -2.226987, 0, 1, 0.2980392, 1,
-0.2915224, 0.719768, -0.8549837, 0, 1, 0.3058824, 1,
-0.291333, -0.02014541, -1.827899, 0, 1, 0.3098039, 1,
-0.289615, -0.664257, -2.316206, 0, 1, 0.3176471, 1,
-0.2883562, 0.5586245, -2.732162, 0, 1, 0.3215686, 1,
-0.2862947, -0.6405914, -2.124768, 0, 1, 0.3294118, 1,
-0.286231, -0.1112063, -1.949864, 0, 1, 0.3333333, 1,
-0.2861169, 1.710764, 0.739421, 0, 1, 0.3411765, 1,
-0.2779661, 0.6468384, 1.407889, 0, 1, 0.345098, 1,
-0.2770412, -1.587364, -2.236715, 0, 1, 0.3529412, 1,
-0.2744029, -0.1951206, -1.237486, 0, 1, 0.3568628, 1,
-0.2740115, 0.5824068, -0.8777482, 0, 1, 0.3647059, 1,
-0.2664333, 2.201434, -1.243331, 0, 1, 0.3686275, 1,
-0.2564036, 0.4864746, -3.173899, 0, 1, 0.3764706, 1,
-0.2519633, 1.113149, -1.185737, 0, 1, 0.3803922, 1,
-0.2484622, -1.611842, -3.741976, 0, 1, 0.3882353, 1,
-0.2473504, 1.820518, -0.6547315, 0, 1, 0.3921569, 1,
-0.24582, 0.723415, 0.531842, 0, 1, 0.4, 1,
-0.2385787, 0.9341539, -0.6715794, 0, 1, 0.4078431, 1,
-0.2364523, -2.47336, -3.642703, 0, 1, 0.4117647, 1,
-0.2353851, 0.2145479, -1.709535, 0, 1, 0.4196078, 1,
-0.2337464, 1.245095, -1.788127, 0, 1, 0.4235294, 1,
-0.2265544, -0.9491453, -4.18879, 0, 1, 0.4313726, 1,
-0.2249031, -1.532684, -4.392822, 0, 1, 0.4352941, 1,
-0.2186704, 3.00817, -0.8651729, 0, 1, 0.4431373, 1,
-0.2182853, 1.720352, -1.732504, 0, 1, 0.4470588, 1,
-0.2164077, -0.4665011, -1.866841, 0, 1, 0.454902, 1,
-0.2137625, 1.550266, -0.333191, 0, 1, 0.4588235, 1,
-0.2107041, -1.058474, -2.382278, 0, 1, 0.4666667, 1,
-0.2070041, 0.3041887, -1.666975, 0, 1, 0.4705882, 1,
-0.2024359, -0.05927414, -2.9145, 0, 1, 0.4784314, 1,
-0.2021005, 0.5829716, -0.5135933, 0, 1, 0.4823529, 1,
-0.1972959, -0.9715396, -1.980207, 0, 1, 0.4901961, 1,
-0.1968677, 0.7041333, -1.117525, 0, 1, 0.4941176, 1,
-0.1907811, 0.6832585, -1.35117, 0, 1, 0.5019608, 1,
-0.1862526, -0.8818718, -1.843613, 0, 1, 0.509804, 1,
-0.1782747, 0.8093347, -0.3581311, 0, 1, 0.5137255, 1,
-0.1743961, -0.02182418, -1.567584, 0, 1, 0.5215687, 1,
-0.1734466, 0.6522021, 0.1751086, 0, 1, 0.5254902, 1,
-0.172204, 0.432368, -1.275265, 0, 1, 0.5333334, 1,
-0.1716184, -0.5595735, -2.477382, 0, 1, 0.5372549, 1,
-0.1711463, 0.6872735, 0.7743633, 0, 1, 0.5450981, 1,
-0.170395, -0.9242362, -4.108556, 0, 1, 0.5490196, 1,
-0.1656796, -1.074051, -2.95916, 0, 1, 0.5568628, 1,
-0.1573639, 0.3493964, -2.008187, 0, 1, 0.5607843, 1,
-0.1570247, -1.463256, -2.66552, 0, 1, 0.5686275, 1,
-0.1557262, -1.421474, -2.983621, 0, 1, 0.572549, 1,
-0.1526623, 1.689169, 0.2630351, 0, 1, 0.5803922, 1,
-0.1521258, 0.04838132, -1.74122, 0, 1, 0.5843138, 1,
-0.148977, 1.54013, 0.9711632, 0, 1, 0.5921569, 1,
-0.1475112, 1.236259, 0.2702233, 0, 1, 0.5960785, 1,
-0.1462086, 0.3979138, -2.361773, 0, 1, 0.6039216, 1,
-0.1437616, 2.692622, -1.653852, 0, 1, 0.6117647, 1,
-0.1430689, -0.8518724, -2.970643, 0, 1, 0.6156863, 1,
-0.1424335, -0.4087366, -1.145454, 0, 1, 0.6235294, 1,
-0.1417155, 1.561183, 0.830097, 0, 1, 0.627451, 1,
-0.1407991, -0.8987175, -2.729865, 0, 1, 0.6352941, 1,
-0.1393956, -0.1355985, -0.4789717, 0, 1, 0.6392157, 1,
-0.1377136, 1.281631, -1.334493, 0, 1, 0.6470588, 1,
-0.1372075, 0.8254355, -0.6943161, 0, 1, 0.6509804, 1,
-0.1355015, 0.7392724, 0.9403486, 0, 1, 0.6588235, 1,
-0.1305909, -0.5692272, -4.389849, 0, 1, 0.6627451, 1,
-0.1304631, -1.559075, -1.807103, 0, 1, 0.6705883, 1,
-0.1267342, 0.1411401, -0.8247296, 0, 1, 0.6745098, 1,
-0.1239225, 1.741262, 2.195058, 0, 1, 0.682353, 1,
-0.1190236, -0.8589803, -4.333077, 0, 1, 0.6862745, 1,
-0.1167275, 0.3188696, -1.811622, 0, 1, 0.6941177, 1,
-0.1161604, -0.4395019, -4.348157, 0, 1, 0.7019608, 1,
-0.1155364, -0.7846121, -3.240309, 0, 1, 0.7058824, 1,
-0.1155244, 1.33523, -0.4626114, 0, 1, 0.7137255, 1,
-0.1155202, -1.14471, -3.003498, 0, 1, 0.7176471, 1,
-0.1078043, -0.7382793, -4.737171, 0, 1, 0.7254902, 1,
-0.1077357, 2.157666, 0.2176569, 0, 1, 0.7294118, 1,
-0.1011951, -0.5695193, -3.203299, 0, 1, 0.7372549, 1,
-0.09967071, -0.375289, -1.826066, 0, 1, 0.7411765, 1,
-0.09400036, 0.1869807, -0.3369517, 0, 1, 0.7490196, 1,
-0.09369469, 0.8953876, -0.6758734, 0, 1, 0.7529412, 1,
-0.09275248, -0.8613781, -4.381409, 0, 1, 0.7607843, 1,
-0.0891448, 0.4026398, -0.7944864, 0, 1, 0.7647059, 1,
-0.0876116, 0.05565201, -1.482734, 0, 1, 0.772549, 1,
-0.08684784, -0.7076895, -2.845912, 0, 1, 0.7764706, 1,
-0.08561753, -0.4446853, -2.862395, 0, 1, 0.7843137, 1,
-0.08505717, -0.01130749, -3.198797, 0, 1, 0.7882353, 1,
-0.08499289, 0.03927609, -2.480313, 0, 1, 0.7960784, 1,
-0.08491789, 1.306631, -2.164589, 0, 1, 0.8039216, 1,
-0.08429632, 0.05970472, -1.771983, 0, 1, 0.8078431, 1,
-0.08426617, -0.6252201, -1.902489, 0, 1, 0.8156863, 1,
-0.08135682, -1.678222, -2.768228, 0, 1, 0.8196079, 1,
-0.07744254, -0.7437367, -1.44634, 0, 1, 0.827451, 1,
-0.07700638, -0.1862309, -0.9022283, 0, 1, 0.8313726, 1,
-0.07686898, -0.8722352, -2.922511, 0, 1, 0.8392157, 1,
-0.07498854, -0.4206289, -2.071466, 0, 1, 0.8431373, 1,
-0.07355832, -1.472049, -4.786483, 0, 1, 0.8509804, 1,
-0.07007307, 0.3694051, -2.058101, 0, 1, 0.854902, 1,
-0.06883588, -1.302197, -3.637659, 0, 1, 0.8627451, 1,
-0.06402577, 0.8940704, -0.934656, 0, 1, 0.8666667, 1,
-0.06367376, 0.6059557, 1.210781, 0, 1, 0.8745098, 1,
-0.06346367, -0.8191958, -3.065334, 0, 1, 0.8784314, 1,
-0.06250104, -0.3044207, -2.162205, 0, 1, 0.8862745, 1,
-0.06097955, -0.3626894, -3.53863, 0, 1, 0.8901961, 1,
-0.06086191, 2.06573, -1.308984, 0, 1, 0.8980392, 1,
-0.06078493, 0.1994527, -0.3341263, 0, 1, 0.9058824, 1,
-0.05764457, 0.3375926, -0.8714589, 0, 1, 0.9098039, 1,
-0.05757013, 2.017848, -0.3960522, 0, 1, 0.9176471, 1,
-0.05535892, -0.8851999, -3.063842, 0, 1, 0.9215686, 1,
-0.04743468, -0.1162854, -2.199137, 0, 1, 0.9294118, 1,
-0.04703402, -0.3129044, -3.483568, 0, 1, 0.9333333, 1,
-0.04354705, 0.6961209, 1.819936, 0, 1, 0.9411765, 1,
-0.04080266, 0.5234812, 0.7643133, 0, 1, 0.945098, 1,
-0.03896995, -0.5861054, -1.886618, 0, 1, 0.9529412, 1,
-0.03630769, 0.3256687, -0.5699005, 0, 1, 0.9568627, 1,
-0.03452247, -0.2265424, -2.465852, 0, 1, 0.9647059, 1,
-0.03081587, -0.5298867, -2.439093, 0, 1, 0.9686275, 1,
-0.02957247, 1.638696, -0.8626682, 0, 1, 0.9764706, 1,
-0.02162733, -0.2377882, -2.64824, 0, 1, 0.9803922, 1,
-0.02117703, 1.526046, 1.831013, 0, 1, 0.9882353, 1,
-0.01792969, -1.267438, -2.815732, 0, 1, 0.9921569, 1,
-0.01450546, 2.646554, 0.4872059, 0, 1, 1, 1,
-0.01294152, 0.3318536, -0.8477225, 0, 0.9921569, 1, 1,
-0.008114379, -0.545608, -3.267209, 0, 0.9882353, 1, 1,
-0.006311443, 1.132929, 0.6888269, 0, 0.9803922, 1, 1,
-0.004433589, -1.266208, -2.242363, 0, 0.9764706, 1, 1,
-0.002297881, 1.301425, -0.7350274, 0, 0.9686275, 1, 1,
0.003021786, -1.07037, 1.961634, 0, 0.9647059, 1, 1,
0.007721896, 0.5141031, 0.1124663, 0, 0.9568627, 1, 1,
0.01051821, -1.57109, 4.80249, 0, 0.9529412, 1, 1,
0.01114966, -0.7198339, 1.395253, 0, 0.945098, 1, 1,
0.01350618, -0.2593556, 1.056862, 0, 0.9411765, 1, 1,
0.01375653, 0.9067696, 0.5561708, 0, 0.9333333, 1, 1,
0.01747343, 0.3453323, 0.9618043, 0, 0.9294118, 1, 1,
0.01812745, -0.4802883, 1.975485, 0, 0.9215686, 1, 1,
0.01826682, 1.028123, -0.8542968, 0, 0.9176471, 1, 1,
0.02296324, -0.8914237, 3.057155, 0, 0.9098039, 1, 1,
0.0257716, 4.387357, 0.5632241, 0, 0.9058824, 1, 1,
0.02675373, -0.9282894, 2.103763, 0, 0.8980392, 1, 1,
0.02729861, -1.410002, 5.587485, 0, 0.8901961, 1, 1,
0.03128335, 0.3374077, 0.6242043, 0, 0.8862745, 1, 1,
0.03326701, 0.2720692, -0.6887189, 0, 0.8784314, 1, 1,
0.03544816, -1.314996, 2.908591, 0, 0.8745098, 1, 1,
0.03801269, 0.5143667, 0.3327776, 0, 0.8666667, 1, 1,
0.0410049, 0.7036001, -1.78598, 0, 0.8627451, 1, 1,
0.0433956, 1.951342, 0.8735027, 0, 0.854902, 1, 1,
0.04509198, -0.6265815, 3.205419, 0, 0.8509804, 1, 1,
0.04892502, 0.8763461, 1.041774, 0, 0.8431373, 1, 1,
0.0518772, -1.18097, 2.42146, 0, 0.8392157, 1, 1,
0.05904732, -1.75502, 5.303444, 0, 0.8313726, 1, 1,
0.05917797, 0.2786137, -0.1813936, 0, 0.827451, 1, 1,
0.05937543, 0.6096256, 0.2583095, 0, 0.8196079, 1, 1,
0.06016644, 0.06721038, 0.2031173, 0, 0.8156863, 1, 1,
0.06399596, -0.5600775, 2.952185, 0, 0.8078431, 1, 1,
0.06468349, 0.6454465, 0.1438251, 0, 0.8039216, 1, 1,
0.06905301, -0.5051826, 2.020466, 0, 0.7960784, 1, 1,
0.07037636, 0.7158193, -0.04920661, 0, 0.7882353, 1, 1,
0.07048902, -0.09465422, 3.462678, 0, 0.7843137, 1, 1,
0.07062031, 0.5323411, -0.7192637, 0, 0.7764706, 1, 1,
0.07601204, 0.1567594, 0.3338127, 0, 0.772549, 1, 1,
0.08072917, 0.6593177, -0.1660448, 0, 0.7647059, 1, 1,
0.08100959, -1.242711, 3.15836, 0, 0.7607843, 1, 1,
0.08277548, -0.1242833, 4.819464, 0, 0.7529412, 1, 1,
0.08633634, 0.5550478, 0.3016457, 0, 0.7490196, 1, 1,
0.087938, 0.2172674, 0.4684026, 0, 0.7411765, 1, 1,
0.09017662, 0.8700374, -0.6948444, 0, 0.7372549, 1, 1,
0.09368432, -0.2444208, 1.574547, 0, 0.7294118, 1, 1,
0.099888, 2.450946, 0.5100881, 0, 0.7254902, 1, 1,
0.1066329, 0.4436476, -0.1924017, 0, 0.7176471, 1, 1,
0.1131472, -0.08391467, -0.6208369, 0, 0.7137255, 1, 1,
0.113824, -0.07237492, 2.217041, 0, 0.7058824, 1, 1,
0.1172577, -1.100069, 2.502592, 0, 0.6980392, 1, 1,
0.117798, -0.3993721, 2.078077, 0, 0.6941177, 1, 1,
0.1205785, -1.997888, 3.462022, 0, 0.6862745, 1, 1,
0.1270828, 0.5304877, -1.261589, 0, 0.682353, 1, 1,
0.1337891, -1.163561, 3.008882, 0, 0.6745098, 1, 1,
0.1350818, 0.7372506, 1.755348, 0, 0.6705883, 1, 1,
0.1353109, 0.05172291, 0.9655507, 0, 0.6627451, 1, 1,
0.1357825, -0.2840146, 3.659337, 0, 0.6588235, 1, 1,
0.1460052, -0.5806835, 3.382867, 0, 0.6509804, 1, 1,
0.1466198, 0.1227589, 0.1306807, 0, 0.6470588, 1, 1,
0.1473739, -0.6501691, 2.133264, 0, 0.6392157, 1, 1,
0.1479606, 0.8183903, -0.1774347, 0, 0.6352941, 1, 1,
0.1480317, -0.4911668, 1.522534, 0, 0.627451, 1, 1,
0.1513745, -0.2887436, 3.039293, 0, 0.6235294, 1, 1,
0.1646793, 0.5372788, -0.4342279, 0, 0.6156863, 1, 1,
0.1656393, -1.961831, 2.812585, 0, 0.6117647, 1, 1,
0.1656769, -0.302935, 2.104763, 0, 0.6039216, 1, 1,
0.1737283, -0.326364, 3.676786, 0, 0.5960785, 1, 1,
0.177354, 0.345803, 0.6019254, 0, 0.5921569, 1, 1,
0.1795556, 0.3701656, 0.4391617, 0, 0.5843138, 1, 1,
0.1836382, 1.008733, -0.5531318, 0, 0.5803922, 1, 1,
0.1839785, -1.148357, 3.491916, 0, 0.572549, 1, 1,
0.1851135, 1.658892, 2.169889, 0, 0.5686275, 1, 1,
0.1863034, -0.4227932, 1.643405, 0, 0.5607843, 1, 1,
0.1882956, -0.463798, 5.419734, 0, 0.5568628, 1, 1,
0.1912912, -1.837915, 5.311484, 0, 0.5490196, 1, 1,
0.1961435, -1.066268, 2.186354, 0, 0.5450981, 1, 1,
0.1978366, -1.040235, 4.280182, 0, 0.5372549, 1, 1,
0.2004144, 1.148981, 0.3195142, 0, 0.5333334, 1, 1,
0.2026736, -2.319011, 5.285428, 0, 0.5254902, 1, 1,
0.2051485, 0.8730317, -2.699566, 0, 0.5215687, 1, 1,
0.2070027, 0.07997382, 1.623694, 0, 0.5137255, 1, 1,
0.2093768, -0.9299185, 1.688144, 0, 0.509804, 1, 1,
0.2115937, 0.8530868, 1.245259, 0, 0.5019608, 1, 1,
0.2133438, -1.827847, 3.57475, 0, 0.4941176, 1, 1,
0.214443, -1.625111, 2.255303, 0, 0.4901961, 1, 1,
0.2144767, -0.9361013, 2.826458, 0, 0.4823529, 1, 1,
0.2152938, -0.1639729, 2.910643, 0, 0.4784314, 1, 1,
0.2194979, 0.24623, 0.5249677, 0, 0.4705882, 1, 1,
0.2286831, 0.9219576, 0.4813716, 0, 0.4666667, 1, 1,
0.2312189, 1.170807, -0.06817664, 0, 0.4588235, 1, 1,
0.2388197, -1.064482, 1.750227, 0, 0.454902, 1, 1,
0.2395048, 0.6171352, -0.7225941, 0, 0.4470588, 1, 1,
0.2395415, -0.3695199, 3.710928, 0, 0.4431373, 1, 1,
0.2437519, -1.644269, 2.641209, 0, 0.4352941, 1, 1,
0.2444257, -1.643552, 2.247202, 0, 0.4313726, 1, 1,
0.2467722, -0.8889229, 3.269206, 0, 0.4235294, 1, 1,
0.2488298, -1.125557, 1.221815, 0, 0.4196078, 1, 1,
0.2507295, -0.04248909, 1.753871, 0, 0.4117647, 1, 1,
0.2554466, 0.06764143, 0.2974005, 0, 0.4078431, 1, 1,
0.2559947, -0.5655915, 2.227665, 0, 0.4, 1, 1,
0.2573903, 0.2925498, 2.088869, 0, 0.3921569, 1, 1,
0.2581291, 1.508873, -0.2998905, 0, 0.3882353, 1, 1,
0.2585601, 0.5216324, 1.225873, 0, 0.3803922, 1, 1,
0.2685659, -1.861412, 3.741035, 0, 0.3764706, 1, 1,
0.2692895, -0.4350618, 2.321535, 0, 0.3686275, 1, 1,
0.2713668, -0.355573, 2.630429, 0, 0.3647059, 1, 1,
0.2734725, 0.3154585, 1.352796, 0, 0.3568628, 1, 1,
0.2760206, 0.5210636, -0.786773, 0, 0.3529412, 1, 1,
0.2801364, -0.374692, 2.168894, 0, 0.345098, 1, 1,
0.2839331, -1.469159, 4.340277, 0, 0.3411765, 1, 1,
0.284435, -0.653316, 4.560639, 0, 0.3333333, 1, 1,
0.2861195, 0.03119316, 1.95204, 0, 0.3294118, 1, 1,
0.289453, 2.639278, 0.02266228, 0, 0.3215686, 1, 1,
0.2915136, 1.003678, -1.229524, 0, 0.3176471, 1, 1,
0.2921261, 0.4895436, 2.043581, 0, 0.3098039, 1, 1,
0.2944548, 0.5186951, -1.109908, 0, 0.3058824, 1, 1,
0.2944754, 0.2023284, 1.084678, 0, 0.2980392, 1, 1,
0.2977167, 0.405488, 0.1834448, 0, 0.2901961, 1, 1,
0.2981118, 0.003160686, 1.473891, 0, 0.2862745, 1, 1,
0.300111, 0.6292511, 1.146738, 0, 0.2784314, 1, 1,
0.3026657, -1.218277, 3.182561, 0, 0.2745098, 1, 1,
0.3044234, -0.6880679, 4.737444, 0, 0.2666667, 1, 1,
0.3044719, -0.4546511, 2.251821, 0, 0.2627451, 1, 1,
0.3051319, -0.3297507, 1.975344, 0, 0.254902, 1, 1,
0.3055207, -1.756246, 2.746605, 0, 0.2509804, 1, 1,
0.3143978, 0.3967055, 1.868979, 0, 0.2431373, 1, 1,
0.3190051, 1.135077, -0.802865, 0, 0.2392157, 1, 1,
0.3247286, 0.7324762, 0.454069, 0, 0.2313726, 1, 1,
0.331293, -1.309791, 4.151457, 0, 0.227451, 1, 1,
0.3317536, 1.468846, 0.3622618, 0, 0.2196078, 1, 1,
0.3428535, -0.6094368, 1.731076, 0, 0.2156863, 1, 1,
0.3441883, 0.2632041, 1.147421, 0, 0.2078431, 1, 1,
0.3477136, 0.417671, -1.024218, 0, 0.2039216, 1, 1,
0.3498605, 0.01977886, 1.443625, 0, 0.1960784, 1, 1,
0.3563594, -0.01618754, 1.001778, 0, 0.1882353, 1, 1,
0.3591357, 0.3575419, 2.329863, 0, 0.1843137, 1, 1,
0.3619432, -1.598302, 3.287561, 0, 0.1764706, 1, 1,
0.362244, 1.162704, 0.21609, 0, 0.172549, 1, 1,
0.3675555, 0.09289678, 2.548612, 0, 0.1647059, 1, 1,
0.3689718, 0.1732809, 0.5541579, 0, 0.1607843, 1, 1,
0.3728047, 0.2264341, 0.6898522, 0, 0.1529412, 1, 1,
0.3740449, 0.8799418, 1.622838, 0, 0.1490196, 1, 1,
0.3751087, -1.995719, 3.488836, 0, 0.1411765, 1, 1,
0.3752622, 0.4436831, 0.2367931, 0, 0.1372549, 1, 1,
0.3764466, -1.330706, 2.290066, 0, 0.1294118, 1, 1,
0.379204, 1.72126, 0.1847858, 0, 0.1254902, 1, 1,
0.3816159, -0.2505284, -0.08085605, 0, 0.1176471, 1, 1,
0.3877228, 0.647427, 0.8793496, 0, 0.1137255, 1, 1,
0.392198, 0.9259291, 1.427652, 0, 0.1058824, 1, 1,
0.3923486, -1.006822, 2.376239, 0, 0.09803922, 1, 1,
0.3981435, 1.591536, 0.4905183, 0, 0.09411765, 1, 1,
0.3988114, 0.5974117, 1.306617, 0, 0.08627451, 1, 1,
0.4039455, 1.065043, 0.7309915, 0, 0.08235294, 1, 1,
0.4043264, 0.6303315, 1.213506, 0, 0.07450981, 1, 1,
0.4120994, -1.350433, 2.72981, 0, 0.07058824, 1, 1,
0.4126758, -0.4666615, 1.755976, 0, 0.0627451, 1, 1,
0.4148464, -0.6527502, 1.938645, 0, 0.05882353, 1, 1,
0.4149353, 2.058001, -0.1392061, 0, 0.05098039, 1, 1,
0.4152102, 0.8314188, -0.003676138, 0, 0.04705882, 1, 1,
0.4156074, -0.206046, 1.703893, 0, 0.03921569, 1, 1,
0.4174567, 1.445861, -0.6967899, 0, 0.03529412, 1, 1,
0.4202489, -0.02743033, 2.988394, 0, 0.02745098, 1, 1,
0.4292697, -0.3442524, 1.536344, 0, 0.02352941, 1, 1,
0.4300007, 1.327818, 1.036121, 0, 0.01568628, 1, 1,
0.4342227, 1.077187, -0.2835674, 0, 0.01176471, 1, 1,
0.4375463, -0.4526299, 1.678504, 0, 0.003921569, 1, 1,
0.4434098, -0.9522026, 3.714139, 0.003921569, 0, 1, 1,
0.4448173, 0.4789811, 2.875331, 0.007843138, 0, 1, 1,
0.4460466, 1.348234, 1.151764, 0.01568628, 0, 1, 1,
0.4477538, 0.3286113, 2.539977, 0.01960784, 0, 1, 1,
0.4495704, 0.3567081, 2.226033, 0.02745098, 0, 1, 1,
0.4528132, -1.196578, 2.558598, 0.03137255, 0, 1, 1,
0.4563505, 0.3158616, 1.650828, 0.03921569, 0, 1, 1,
0.4566459, -1.12175, 1.312923, 0.04313726, 0, 1, 1,
0.4631602, 0.644926, 0.200667, 0.05098039, 0, 1, 1,
0.4642546, 0.4277996, -0.1178191, 0.05490196, 0, 1, 1,
0.4655724, 0.9925479, -0.6859289, 0.0627451, 0, 1, 1,
0.4658231, -2.062357, 2.731725, 0.06666667, 0, 1, 1,
0.473128, 1.548706, 0.8703917, 0.07450981, 0, 1, 1,
0.4734302, 0.4735481, 1.638908, 0.07843138, 0, 1, 1,
0.4813533, -0.9439156, 0.54102, 0.08627451, 0, 1, 1,
0.4822942, -0.04691319, 2.253689, 0.09019608, 0, 1, 1,
0.4852246, -0.2454767, 2.441689, 0.09803922, 0, 1, 1,
0.4873637, 1.082293, 1.323502, 0.1058824, 0, 1, 1,
0.4875885, 0.9961963, 0.8721957, 0.1098039, 0, 1, 1,
0.4904382, 0.9603971, 1.483614, 0.1176471, 0, 1, 1,
0.4931223, 1.997709, 0.1879722, 0.1215686, 0, 1, 1,
0.495417, 0.5708768, 1.616084, 0.1294118, 0, 1, 1,
0.4967317, 1.831795, 0.1204887, 0.1333333, 0, 1, 1,
0.5009472, -1.594512, 2.642351, 0.1411765, 0, 1, 1,
0.5041711, 0.8095919, 0.6551964, 0.145098, 0, 1, 1,
0.5113057, 1.245433, 0.3962289, 0.1529412, 0, 1, 1,
0.5135695, -1.210587, 2.364698, 0.1568628, 0, 1, 1,
0.5138615, -0.8389462, 2.592268, 0.1647059, 0, 1, 1,
0.5155284, 0.8387203, -0.5467291, 0.1686275, 0, 1, 1,
0.5208657, 1.488223, 0.99602, 0.1764706, 0, 1, 1,
0.525699, -0.210773, 2.027959, 0.1803922, 0, 1, 1,
0.5298259, 1.537662, 1.931158, 0.1882353, 0, 1, 1,
0.5359091, -0.921176, 3.903687, 0.1921569, 0, 1, 1,
0.5370722, 0.1079818, 2.348833, 0.2, 0, 1, 1,
0.5375898, 2.231368, -0.2497325, 0.2078431, 0, 1, 1,
0.5380623, 0.2713341, 0.3655708, 0.2117647, 0, 1, 1,
0.5454633, 1.557626, 0.7935394, 0.2196078, 0, 1, 1,
0.5463534, 0.7315388, -1.427651, 0.2235294, 0, 1, 1,
0.5476217, -1.826366, 2.452135, 0.2313726, 0, 1, 1,
0.547786, -0.0542698, 0.5295676, 0.2352941, 0, 1, 1,
0.5498364, 0.2999046, 1.669896, 0.2431373, 0, 1, 1,
0.5519388, -1.571393, 2.315601, 0.2470588, 0, 1, 1,
0.5534886, 0.2069424, 0.6848121, 0.254902, 0, 1, 1,
0.5536445, 0.6859482, 0.9874296, 0.2588235, 0, 1, 1,
0.5580688, 0.3428848, 1.256817, 0.2666667, 0, 1, 1,
0.5603133, -0.397934, 2.116023, 0.2705882, 0, 1, 1,
0.5616012, 0.7509878, -0.382273, 0.2784314, 0, 1, 1,
0.5618523, -0.1316612, 4.645215, 0.282353, 0, 1, 1,
0.5622082, 0.6557186, 0.1863867, 0.2901961, 0, 1, 1,
0.5662321, -0.6249456, 2.006261, 0.2941177, 0, 1, 1,
0.5675705, 0.1011432, 1.239983, 0.3019608, 0, 1, 1,
0.5679694, -0.9231105, 2.950666, 0.3098039, 0, 1, 1,
0.569197, -0.8146462, 2.851562, 0.3137255, 0, 1, 1,
0.5701204, 1.077484, 0.5025695, 0.3215686, 0, 1, 1,
0.5708172, -0.3085967, 3.461942, 0.3254902, 0, 1, 1,
0.5732773, -0.8709329, 2.820852, 0.3333333, 0, 1, 1,
0.5795987, 0.5812988, 2.01459, 0.3372549, 0, 1, 1,
0.5796241, 0.207179, 0.6275042, 0.345098, 0, 1, 1,
0.5873086, -0.737272, 1.381545, 0.3490196, 0, 1, 1,
0.5879014, 0.4993507, -0.9033509, 0.3568628, 0, 1, 1,
0.5901518, 0.4708863, 1.398155, 0.3607843, 0, 1, 1,
0.5910711, -0.5972216, 3.490482, 0.3686275, 0, 1, 1,
0.5930336, -0.1230849, 1.453951, 0.372549, 0, 1, 1,
0.596199, 1.03689, 0.08448151, 0.3803922, 0, 1, 1,
0.5970786, -0.8539838, 0.565302, 0.3843137, 0, 1, 1,
0.5980831, 1.528327, 1.484285, 0.3921569, 0, 1, 1,
0.6000999, 0.2805529, 1.789185, 0.3960784, 0, 1, 1,
0.6049238, 0.1495199, 0.4346599, 0.4039216, 0, 1, 1,
0.6087117, -0.7246644, 2.290503, 0.4117647, 0, 1, 1,
0.6167787, -0.7257506, 1.708263, 0.4156863, 0, 1, 1,
0.62643, -0.2660895, 2.387124, 0.4235294, 0, 1, 1,
0.6288922, 0.8061431, -0.4267777, 0.427451, 0, 1, 1,
0.6321504, 0.4061746, 2.689067, 0.4352941, 0, 1, 1,
0.6336006, 0.6541923, 2.439003, 0.4392157, 0, 1, 1,
0.6348214, -1.01565, 3.837096, 0.4470588, 0, 1, 1,
0.6361563, -0.6941981, 2.204982, 0.4509804, 0, 1, 1,
0.6380372, 0.9015986, 1.524605, 0.4588235, 0, 1, 1,
0.6497204, 0.7039943, 2.191844, 0.4627451, 0, 1, 1,
0.6538121, -0.9409644, 2.394293, 0.4705882, 0, 1, 1,
0.6603711, -0.1715295, 0.2091153, 0.4745098, 0, 1, 1,
0.6641635, 1.50041, 0.5406894, 0.4823529, 0, 1, 1,
0.6652647, 1.632236, -0.8715675, 0.4862745, 0, 1, 1,
0.6673709, 0.1657563, 0.7601162, 0.4941176, 0, 1, 1,
0.6688568, 1.056748, 1.46554, 0.5019608, 0, 1, 1,
0.6824624, -1.063949, 2.35921, 0.5058824, 0, 1, 1,
0.6877882, 0.4252221, 1.377165, 0.5137255, 0, 1, 1,
0.6889191, 0.005060295, 0.6961295, 0.5176471, 0, 1, 1,
0.6890343, 0.2375968, -0.621755, 0.5254902, 0, 1, 1,
0.6921362, -0.4679446, 1.397342, 0.5294118, 0, 1, 1,
0.6967514, 1.854997, 0.1678268, 0.5372549, 0, 1, 1,
0.6999555, 1.022674, 1.621891, 0.5411765, 0, 1, 1,
0.7029748, -1.655291, 3.940329, 0.5490196, 0, 1, 1,
0.7031799, 2.301279, 2.701489, 0.5529412, 0, 1, 1,
0.7036707, -0.5231041, 1.872341, 0.5607843, 0, 1, 1,
0.7101293, -0.8034769, 1.624254, 0.5647059, 0, 1, 1,
0.7201398, -0.02054574, 2.097126, 0.572549, 0, 1, 1,
0.7294819, -0.5432685, 1.741741, 0.5764706, 0, 1, 1,
0.7386273, 0.5689598, 0.532683, 0.5843138, 0, 1, 1,
0.7388712, 0.6119969, 0.2226831, 0.5882353, 0, 1, 1,
0.7625818, -0.1295009, 2.462212, 0.5960785, 0, 1, 1,
0.7657946, -0.2557526, 2.060663, 0.6039216, 0, 1, 1,
0.7664236, -0.7979585, 3.488796, 0.6078432, 0, 1, 1,
0.7664519, -3.103271, 4.213683, 0.6156863, 0, 1, 1,
0.7759706, 1.21195, -0.4246733, 0.6196079, 0, 1, 1,
0.7775555, -0.4969098, 1.59341, 0.627451, 0, 1, 1,
0.7781062, -1.674371, -0.7888362, 0.6313726, 0, 1, 1,
0.7801051, -1.001288, 3.240839, 0.6392157, 0, 1, 1,
0.7812786, -0.9329923, 1.938015, 0.6431373, 0, 1, 1,
0.7828624, -0.8177289, 2.706858, 0.6509804, 0, 1, 1,
0.783743, 0.883504, -0.4190735, 0.654902, 0, 1, 1,
0.7893382, 0.8499845, 2.209543, 0.6627451, 0, 1, 1,
0.7902141, 1.478593, -0.2195386, 0.6666667, 0, 1, 1,
0.8073377, -0.676347, 1.614858, 0.6745098, 0, 1, 1,
0.8114317, 0.04890304, 0.7512181, 0.6784314, 0, 1, 1,
0.8146275, 0.2441287, 0.4902036, 0.6862745, 0, 1, 1,
0.8182632, 0.05987293, 3.251571, 0.6901961, 0, 1, 1,
0.8299798, -2.688892, 1.861851, 0.6980392, 0, 1, 1,
0.8325243, 2.154186, 0.2561031, 0.7058824, 0, 1, 1,
0.8347279, -1.756563, 2.982455, 0.7098039, 0, 1, 1,
0.8380281, -0.1693246, 0.1994063, 0.7176471, 0, 1, 1,
0.8455771, 1.549224, -1.24053, 0.7215686, 0, 1, 1,
0.8456227, -0.6469118, 3.139042, 0.7294118, 0, 1, 1,
0.8511078, -0.2549735, 0.087842, 0.7333333, 0, 1, 1,
0.8522574, 0.5486138, -0.7383603, 0.7411765, 0, 1, 1,
0.8555212, -0.5221983, 3.288478, 0.7450981, 0, 1, 1,
0.8576826, 1.299093, 0.4499283, 0.7529412, 0, 1, 1,
0.8636522, -0.07444577, 1.849089, 0.7568628, 0, 1, 1,
0.8642626, -0.7031832, 1.40042, 0.7647059, 0, 1, 1,
0.8647757, 1.879048, 0.749774, 0.7686275, 0, 1, 1,
0.8669605, 0.2239502, 1.428503, 0.7764706, 0, 1, 1,
0.868868, -0.131036, 1.697568, 0.7803922, 0, 1, 1,
0.8721513, 2.072366, 0.142207, 0.7882353, 0, 1, 1,
0.8727248, -0.1264218, 2.759148, 0.7921569, 0, 1, 1,
0.8732871, -1.560915, 2.493302, 0.8, 0, 1, 1,
0.8735783, 0.161203, 1.019478, 0.8078431, 0, 1, 1,
0.8754227, -2.153635, 2.215908, 0.8117647, 0, 1, 1,
0.8761764, 0.2905767, 1.248184, 0.8196079, 0, 1, 1,
0.8786397, 0.02323822, -0.4209165, 0.8235294, 0, 1, 1,
0.8799171, 0.3399972, 2.384665, 0.8313726, 0, 1, 1,
0.8806857, 0.9265798, 1.398281, 0.8352941, 0, 1, 1,
0.8860314, 1.289621, 1.326553, 0.8431373, 0, 1, 1,
0.8922926, -0.05508576, 1.709557, 0.8470588, 0, 1, 1,
0.8924436, 0.9965547, 1.181975, 0.854902, 0, 1, 1,
0.8955688, -1.044858, 0.5080934, 0.8588235, 0, 1, 1,
0.896082, 0.7463827, 2.143865, 0.8666667, 0, 1, 1,
0.902429, -0.5955, 3.200188, 0.8705882, 0, 1, 1,
0.911398, -2.535267, 2.332113, 0.8784314, 0, 1, 1,
0.9123204, 0.7479739, 2.029852, 0.8823529, 0, 1, 1,
0.9134835, -1.191366, 2.890713, 0.8901961, 0, 1, 1,
0.9233769, -0.6130914, 2.477911, 0.8941177, 0, 1, 1,
0.9278579, -0.571139, 2.907674, 0.9019608, 0, 1, 1,
0.9293762, -0.07828561, 2.718237, 0.9098039, 0, 1, 1,
0.932187, -0.00608691, 0.7818229, 0.9137255, 0, 1, 1,
0.9438453, 1.175626, 0.6846635, 0.9215686, 0, 1, 1,
0.9457003, -2.021406, 1.279884, 0.9254902, 0, 1, 1,
0.9497131, -2.515738, 0.8536389, 0.9333333, 0, 1, 1,
0.9540707, 0.01237479, 2.001289, 0.9372549, 0, 1, 1,
0.9544774, 2.00207, -0.811661, 0.945098, 0, 1, 1,
0.9556723, 0.5906136, 2.418105, 0.9490196, 0, 1, 1,
0.9572622, 0.03898872, 1.517217, 0.9568627, 0, 1, 1,
0.957365, 2.196775, -0.07111154, 0.9607843, 0, 1, 1,
0.9574409, -0.1172981, 3.02389, 0.9686275, 0, 1, 1,
0.9589022, -0.3669811, 1.32601, 0.972549, 0, 1, 1,
0.9615763, -1.996988, 4.407729, 0.9803922, 0, 1, 1,
0.9632501, -0.1100591, 1.595534, 0.9843137, 0, 1, 1,
0.9632794, -1.1008, 2.268923, 0.9921569, 0, 1, 1,
0.9657498, -1.109638, 2.773082, 0.9960784, 0, 1, 1,
0.9665416, -0.5551263, 2.979861, 1, 0, 0.9960784, 1,
0.9666255, -0.2515337, 2.051296, 1, 0, 0.9882353, 1,
0.9838697, -0.1297526, 0.6287697, 1, 0, 0.9843137, 1,
0.9882154, -0.4139602, 2.606107, 1, 0, 0.9764706, 1,
0.9883946, 1.470639, 1.471251, 1, 0, 0.972549, 1,
0.9887491, 1.503682, 2.446873, 1, 0, 0.9647059, 1,
0.9947987, 1.066275, 0.03856602, 1, 0, 0.9607843, 1,
0.994903, 2.34118, -0.3439659, 1, 0, 0.9529412, 1,
0.9958016, 0.3315521, 1.119313, 1, 0, 0.9490196, 1,
1.00266, 0.4586426, 0.1502778, 1, 0, 0.9411765, 1,
1.004963, -0.8957977, 2.161045, 1, 0, 0.9372549, 1,
1.005383, 0.9975923, 2.539084, 1, 0, 0.9294118, 1,
1.011821, 0.3538451, -0.2031087, 1, 0, 0.9254902, 1,
1.014458, 0.7127933, 0.1963784, 1, 0, 0.9176471, 1,
1.022482, -0.216735, 0.9966014, 1, 0, 0.9137255, 1,
1.037199, 0.492084, 1.404293, 1, 0, 0.9058824, 1,
1.037669, 1.4947, 0.2189605, 1, 0, 0.9019608, 1,
1.039574, 0.3166073, -0.2597157, 1, 0, 0.8941177, 1,
1.041903, 0.5046906, 1.55259, 1, 0, 0.8862745, 1,
1.042736, -3.031781, 2.529409, 1, 0, 0.8823529, 1,
1.047499, 1.569119, 1.041907, 1, 0, 0.8745098, 1,
1.05577, -0.4204012, 2.932487, 1, 0, 0.8705882, 1,
1.056596, 0.05951564, 1.764955, 1, 0, 0.8627451, 1,
1.057311, 0.3867103, 0.5532108, 1, 0, 0.8588235, 1,
1.058448, -0.8075196, 3.394512, 1, 0, 0.8509804, 1,
1.069397, -0.2763177, 0.5459515, 1, 0, 0.8470588, 1,
1.080437, 1.671871, -0.1262523, 1, 0, 0.8392157, 1,
1.084845, 0.07858767, 1.002193, 1, 0, 0.8352941, 1,
1.093927, 0.06847888, -0.9203056, 1, 0, 0.827451, 1,
1.104786, -0.02425617, 1.100263, 1, 0, 0.8235294, 1,
1.114346, 1.341774, 0.5979132, 1, 0, 0.8156863, 1,
1.115513, -0.5869848, 1.686875, 1, 0, 0.8117647, 1,
1.116648, -0.4673374, 2.676048, 1, 0, 0.8039216, 1,
1.121144, -0.7991449, 0.6004375, 1, 0, 0.7960784, 1,
1.131706, -0.9551289, 1.445622, 1, 0, 0.7921569, 1,
1.134343, 1.676883, 1.177781, 1, 0, 0.7843137, 1,
1.139475, 0.0951977, 2.736565, 1, 0, 0.7803922, 1,
1.149166, -0.8336057, 1.324323, 1, 0, 0.772549, 1,
1.149388, 0.3305131, 2.06404, 1, 0, 0.7686275, 1,
1.1496, 2.262257, -1.876392, 1, 0, 0.7607843, 1,
1.154302, -1.662199, 0.8508851, 1, 0, 0.7568628, 1,
1.158543, 1.073303, 0.6882263, 1, 0, 0.7490196, 1,
1.162864, 0.102286, -0.498585, 1, 0, 0.7450981, 1,
1.16505, 1.252782, -0.08699132, 1, 0, 0.7372549, 1,
1.174595, -0.1185055, 1.014286, 1, 0, 0.7333333, 1,
1.181292, 0.455418, 0.2757837, 1, 0, 0.7254902, 1,
1.186364, 0.263469, -0.1784916, 1, 0, 0.7215686, 1,
1.192027, -0.1671951, 0.4750764, 1, 0, 0.7137255, 1,
1.194187, 0.08490908, -0.05220125, 1, 0, 0.7098039, 1,
1.196889, 0.01138071, 3.202577, 1, 0, 0.7019608, 1,
1.202699, -0.6790526, 2.247201, 1, 0, 0.6941177, 1,
1.203005, 0.2228872, 2.31216, 1, 0, 0.6901961, 1,
1.203081, -2.36498, 3.407596, 1, 0, 0.682353, 1,
1.206115, 0.2901582, 2.559411, 1, 0, 0.6784314, 1,
1.207646, -0.7723822, 2.524143, 1, 0, 0.6705883, 1,
1.211011, 0.2091847, 3.710856, 1, 0, 0.6666667, 1,
1.214991, -0.1662316, 1.938664, 1, 0, 0.6588235, 1,
1.219633, 0.7603232, 1.287995, 1, 0, 0.654902, 1,
1.22449, -0.6110921, 0.7291767, 1, 0, 0.6470588, 1,
1.231544, 1.515211, 0.1046071, 1, 0, 0.6431373, 1,
1.235069, 1.388551, 0.5615874, 1, 0, 0.6352941, 1,
1.238883, 0.6914868, -1.1426, 1, 0, 0.6313726, 1,
1.239541, -0.8031554, -0.477832, 1, 0, 0.6235294, 1,
1.24645, 1.174393, 1.933519, 1, 0, 0.6196079, 1,
1.2484, -0.8491888, 1.902489, 1, 0, 0.6117647, 1,
1.250844, 0.8776226, -0.033892, 1, 0, 0.6078432, 1,
1.262142, 1.120642, 0.4712795, 1, 0, 0.6, 1,
1.264895, 0.8047435, -0.4833729, 1, 0, 0.5921569, 1,
1.266772, 0.653254, 1.683568, 1, 0, 0.5882353, 1,
1.269291, -0.265285, 1.323855, 1, 0, 0.5803922, 1,
1.269945, 0.1553043, 0.9669273, 1, 0, 0.5764706, 1,
1.279761, -0.04913044, 0.9889551, 1, 0, 0.5686275, 1,
1.280387, -0.8684103, 2.568722, 1, 0, 0.5647059, 1,
1.283683, 0.08571149, 3.622078, 1, 0, 0.5568628, 1,
1.295151, 0.3077036, 0.6439229, 1, 0, 0.5529412, 1,
1.298239, -0.3729171, 2.873958, 1, 0, 0.5450981, 1,
1.299223, 0.1045282, 2.080192, 1, 0, 0.5411765, 1,
1.316377, 1.26824, 2.987266, 1, 0, 0.5333334, 1,
1.320845, -0.8485534, 2.452613, 1, 0, 0.5294118, 1,
1.342307, -1.344281, 3.096215, 1, 0, 0.5215687, 1,
1.343307, 1.271751, 1.219152, 1, 0, 0.5176471, 1,
1.348895, 0.7001204, 1.412891, 1, 0, 0.509804, 1,
1.351733, -1.79006, 2.38928, 1, 0, 0.5058824, 1,
1.357658, -0.2406918, 2.332643, 1, 0, 0.4980392, 1,
1.361225, 0.8534178, -0.4390225, 1, 0, 0.4901961, 1,
1.365315, 0.6111178, 0.183753, 1, 0, 0.4862745, 1,
1.368656, -0.5689169, 1.944377, 1, 0, 0.4784314, 1,
1.369799, 0.6855644, 2.918893, 1, 0, 0.4745098, 1,
1.370783, 0.7722397, 0.770219, 1, 0, 0.4666667, 1,
1.3746, -2.526323, 0.5841296, 1, 0, 0.4627451, 1,
1.381448, 1.024525, 2.18907, 1, 0, 0.454902, 1,
1.389287, -0.02473222, 1.051764, 1, 0, 0.4509804, 1,
1.40907, 0.578701, 0.642952, 1, 0, 0.4431373, 1,
1.419806, 0.126155, 1.488824, 1, 0, 0.4392157, 1,
1.425312, 0.2364627, 0.1176158, 1, 0, 0.4313726, 1,
1.428165, -0.09608638, 1.698188, 1, 0, 0.427451, 1,
1.436045, -1.032295, 1.793242, 1, 0, 0.4196078, 1,
1.462005, -0.988318, 3.317043, 1, 0, 0.4156863, 1,
1.470016, 0.5392671, 1.872418, 1, 0, 0.4078431, 1,
1.472665, -3.017264, 2.010867, 1, 0, 0.4039216, 1,
1.474957, -0.0349307, 0.9131833, 1, 0, 0.3960784, 1,
1.479763, -1.047601, 4.01012, 1, 0, 0.3882353, 1,
1.49027, -0.8911217, 1.672808, 1, 0, 0.3843137, 1,
1.495273, 1.1364, 0.9845443, 1, 0, 0.3764706, 1,
1.499833, -0.8268296, 3.878215, 1, 0, 0.372549, 1,
1.505889, -1.418374, 0.4564711, 1, 0, 0.3647059, 1,
1.509648, 1.177482, -1.384723, 1, 0, 0.3607843, 1,
1.51929, -0.4407321, 0.02929795, 1, 0, 0.3529412, 1,
1.52846, 0.7963193, 1.571406, 1, 0, 0.3490196, 1,
1.542228, 0.08568497, -0.7793762, 1, 0, 0.3411765, 1,
1.558418, -1.796111, 2.271139, 1, 0, 0.3372549, 1,
1.561488, -0.104601, 0.9094773, 1, 0, 0.3294118, 1,
1.566245, -1.352312, 2.206131, 1, 0, 0.3254902, 1,
1.579024, 1.062052, -0.2934386, 1, 0, 0.3176471, 1,
1.581766, 1.939862, 0.6122867, 1, 0, 0.3137255, 1,
1.588222, -0.07839777, 1.645514, 1, 0, 0.3058824, 1,
1.591899, -1.793515, 3.812677, 1, 0, 0.2980392, 1,
1.592106, -1.022206, 1.464923, 1, 0, 0.2941177, 1,
1.610465, -0.5250944, 1.376463, 1, 0, 0.2862745, 1,
1.611303, -0.5814932, 2.330801, 1, 0, 0.282353, 1,
1.619282, 0.3147223, 0.4765429, 1, 0, 0.2745098, 1,
1.619634, 0.7952632, -0.001551978, 1, 0, 0.2705882, 1,
1.628972, -0.8676555, 2.169274, 1, 0, 0.2627451, 1,
1.646243, 0.08612697, 0.9909629, 1, 0, 0.2588235, 1,
1.659572, 0.01032015, 3.053893, 1, 0, 0.2509804, 1,
1.66244, -0.05611328, 1.522896, 1, 0, 0.2470588, 1,
1.671241, -0.3951422, 1.741284, 1, 0, 0.2392157, 1,
1.67251, 0.1145072, 1.229989, 1, 0, 0.2352941, 1,
1.676085, 0.7741505, 1.227432, 1, 0, 0.227451, 1,
1.677065, -0.3024704, 3.511327, 1, 0, 0.2235294, 1,
1.735633, 0.04076595, 1.66813, 1, 0, 0.2156863, 1,
1.780007, 0.4689325, 1.791305, 1, 0, 0.2117647, 1,
1.794375, 0.6108593, 2.772663, 1, 0, 0.2039216, 1,
1.803141, -0.3448072, 0.7959735, 1, 0, 0.1960784, 1,
1.810495, -2.226651, 1.023241, 1, 0, 0.1921569, 1,
1.8112, -0.3558633, 1.877066, 1, 0, 0.1843137, 1,
1.819633, -2.289791, 2.893281, 1, 0, 0.1803922, 1,
1.877779, 1.036802, -0.9784715, 1, 0, 0.172549, 1,
1.884355, -0.05240884, 0.3887255, 1, 0, 0.1686275, 1,
1.906383, -0.9516476, 3.008504, 1, 0, 0.1607843, 1,
1.928291, -1.6539, 3.677528, 1, 0, 0.1568628, 1,
1.953579, 1.527793, 1.270089, 1, 0, 0.1490196, 1,
1.97019, -0.1435134, 1.711961, 1, 0, 0.145098, 1,
2.022686, -0.5720815, 2.385776, 1, 0, 0.1372549, 1,
2.027739, 0.02591692, -0.2070502, 1, 0, 0.1333333, 1,
2.030257, -0.6931139, 1.152879, 1, 0, 0.1254902, 1,
2.030975, 0.192773, -0.1475073, 1, 0, 0.1215686, 1,
2.043555, 0.4835159, 2.938933, 1, 0, 0.1137255, 1,
2.07299, -0.7391654, 1.457287, 1, 0, 0.1098039, 1,
2.115872, 2.070355, 0.5852475, 1, 0, 0.1019608, 1,
2.152515, -0.07523144, 2.303652, 1, 0, 0.09411765, 1,
2.177868, 0.111635, 1.436533, 1, 0, 0.09019608, 1,
2.201409, -0.08324903, 1.036563, 1, 0, 0.08235294, 1,
2.214907, 0.4653214, 0.379159, 1, 0, 0.07843138, 1,
2.235504, -0.1963739, 2.119341, 1, 0, 0.07058824, 1,
2.302642, 0.8102167, 1.401052, 1, 0, 0.06666667, 1,
2.313497, 1.385859, 1.165221, 1, 0, 0.05882353, 1,
2.320857, -1.220126, 0.6139114, 1, 0, 0.05490196, 1,
2.413813, -1.294626, 1.059964, 1, 0, 0.04705882, 1,
2.464307, 0.8912264, -0.2359268, 1, 0, 0.04313726, 1,
2.527812, 1.006426, 1.773754, 1, 0, 0.03529412, 1,
2.590964, 3.407552, -0.08927328, 1, 0, 0.03137255, 1,
2.765185, -2.024702, 2.175442, 1, 0, 0.02352941, 1,
3.193893, 2.788297, 0.5833613, 1, 0, 0.01960784, 1,
3.282987, 1.27427, 1.268982, 1, 0, 0.01176471, 1,
3.446927, 1.734786, 1.856146, 1, 0, 0.007843138, 1
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
-0.2819133, -4.372932, -7.591642, 0, -0.5, 0.5, 0.5,
-0.2819133, -4.372932, -7.591642, 1, -0.5, 0.5, 0.5,
-0.2819133, -4.372932, -7.591642, 1, 1.5, 0.5, 0.5,
-0.2819133, -4.372932, -7.591642, 0, 1.5, 0.5, 0.5
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
-5.27483, 0.6420434, -7.591642, 0, -0.5, 0.5, 0.5,
-5.27483, 0.6420434, -7.591642, 1, -0.5, 0.5, 0.5,
-5.27483, 0.6420434, -7.591642, 1, 1.5, 0.5, 0.5,
-5.27483, 0.6420434, -7.591642, 0, 1.5, 0.5, 0.5
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
-5.27483, -4.372932, -0.04702854, 0, -0.5, 0.5, 0.5,
-5.27483, -4.372932, -0.04702854, 1, -0.5, 0.5, 0.5,
-5.27483, -4.372932, -0.04702854, 1, 1.5, 0.5, 0.5,
-5.27483, -4.372932, -0.04702854, 0, 1.5, 0.5, 0.5
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
-4, -3.21563, -5.850577,
2, -3.21563, -5.850577,
-4, -3.21563, -5.850577,
-4, -3.408514, -6.140755,
-2, -3.21563, -5.850577,
-2, -3.408514, -6.140755,
0, -3.21563, -5.850577,
0, -3.408514, -6.140755,
2, -3.21563, -5.850577,
2, -3.408514, -6.140755
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
"-4",
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
-4, -3.794281, -6.72111, 0, -0.5, 0.5, 0.5,
-4, -3.794281, -6.72111, 1, -0.5, 0.5, 0.5,
-4, -3.794281, -6.72111, 1, 1.5, 0.5, 0.5,
-4, -3.794281, -6.72111, 0, 1.5, 0.5, 0.5,
-2, -3.794281, -6.72111, 0, -0.5, 0.5, 0.5,
-2, -3.794281, -6.72111, 1, -0.5, 0.5, 0.5,
-2, -3.794281, -6.72111, 1, 1.5, 0.5, 0.5,
-2, -3.794281, -6.72111, 0, 1.5, 0.5, 0.5,
0, -3.794281, -6.72111, 0, -0.5, 0.5, 0.5,
0, -3.794281, -6.72111, 1, -0.5, 0.5, 0.5,
0, -3.794281, -6.72111, 1, 1.5, 0.5, 0.5,
0, -3.794281, -6.72111, 0, 1.5, 0.5, 0.5,
2, -3.794281, -6.72111, 0, -0.5, 0.5, 0.5,
2, -3.794281, -6.72111, 1, -0.5, 0.5, 0.5,
2, -3.794281, -6.72111, 1, 1.5, 0.5, 0.5,
2, -3.794281, -6.72111, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.122618, -2, -5.850577,
-4.122618, 4, -5.850577,
-4.122618, -2, -5.850577,
-4.314653, -2, -6.140755,
-4.122618, 0, -5.850577,
-4.314653, 0, -6.140755,
-4.122618, 2, -5.850577,
-4.314653, 2, -6.140755,
-4.122618, 4, -5.850577,
-4.314653, 4, -6.140755
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
"2",
"4"
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
-4.698724, -2, -6.72111, 0, -0.5, 0.5, 0.5,
-4.698724, -2, -6.72111, 1, -0.5, 0.5, 0.5,
-4.698724, -2, -6.72111, 1, 1.5, 0.5, 0.5,
-4.698724, -2, -6.72111, 0, 1.5, 0.5, 0.5,
-4.698724, 0, -6.72111, 0, -0.5, 0.5, 0.5,
-4.698724, 0, -6.72111, 1, -0.5, 0.5, 0.5,
-4.698724, 0, -6.72111, 1, 1.5, 0.5, 0.5,
-4.698724, 0, -6.72111, 0, 1.5, 0.5, 0.5,
-4.698724, 2, -6.72111, 0, -0.5, 0.5, 0.5,
-4.698724, 2, -6.72111, 1, -0.5, 0.5, 0.5,
-4.698724, 2, -6.72111, 1, 1.5, 0.5, 0.5,
-4.698724, 2, -6.72111, 0, 1.5, 0.5, 0.5,
-4.698724, 4, -6.72111, 0, -0.5, 0.5, 0.5,
-4.698724, 4, -6.72111, 1, -0.5, 0.5, 0.5,
-4.698724, 4, -6.72111, 1, 1.5, 0.5, 0.5,
-4.698724, 4, -6.72111, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.122618, -3.21563, -4,
-4.122618, -3.21563, 4,
-4.122618, -3.21563, -4,
-4.314653, -3.408514, -4,
-4.122618, -3.21563, -2,
-4.314653, -3.408514, -2,
-4.122618, -3.21563, 0,
-4.314653, -3.408514, 0,
-4.122618, -3.21563, 2,
-4.314653, -3.408514, 2,
-4.122618, -3.21563, 4,
-4.314653, -3.408514, 4
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
-4.698724, -3.794281, -4, 0, -0.5, 0.5, 0.5,
-4.698724, -3.794281, -4, 1, -0.5, 0.5, 0.5,
-4.698724, -3.794281, -4, 1, 1.5, 0.5, 0.5,
-4.698724, -3.794281, -4, 0, 1.5, 0.5, 0.5,
-4.698724, -3.794281, -2, 0, -0.5, 0.5, 0.5,
-4.698724, -3.794281, -2, 1, -0.5, 0.5, 0.5,
-4.698724, -3.794281, -2, 1, 1.5, 0.5, 0.5,
-4.698724, -3.794281, -2, 0, 1.5, 0.5, 0.5,
-4.698724, -3.794281, 0, 0, -0.5, 0.5, 0.5,
-4.698724, -3.794281, 0, 1, -0.5, 0.5, 0.5,
-4.698724, -3.794281, 0, 1, 1.5, 0.5, 0.5,
-4.698724, -3.794281, 0, 0, 1.5, 0.5, 0.5,
-4.698724, -3.794281, 2, 0, -0.5, 0.5, 0.5,
-4.698724, -3.794281, 2, 1, -0.5, 0.5, 0.5,
-4.698724, -3.794281, 2, 1, 1.5, 0.5, 0.5,
-4.698724, -3.794281, 2, 0, 1.5, 0.5, 0.5,
-4.698724, -3.794281, 4, 0, -0.5, 0.5, 0.5,
-4.698724, -3.794281, 4, 1, -0.5, 0.5, 0.5,
-4.698724, -3.794281, 4, 1, 1.5, 0.5, 0.5,
-4.698724, -3.794281, 4, 0, 1.5, 0.5, 0.5
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
-4.122618, -3.21563, -5.850577,
-4.122618, 4.499717, -5.850577,
-4.122618, -3.21563, 5.75652,
-4.122618, 4.499717, 5.75652,
-4.122618, -3.21563, -5.850577,
-4.122618, -3.21563, 5.75652,
-4.122618, 4.499717, -5.850577,
-4.122618, 4.499717, 5.75652,
-4.122618, -3.21563, -5.850577,
3.558792, -3.21563, -5.850577,
-4.122618, -3.21563, 5.75652,
3.558792, -3.21563, 5.75652,
-4.122618, 4.499717, -5.850577,
3.558792, 4.499717, -5.850577,
-4.122618, 4.499717, 5.75652,
3.558792, 4.499717, 5.75652,
3.558792, -3.21563, -5.850577,
3.558792, 4.499717, -5.850577,
3.558792, -3.21563, 5.75652,
3.558792, 4.499717, 5.75652,
3.558792, -3.21563, -5.850577,
3.558792, -3.21563, 5.75652,
3.558792, 4.499717, -5.850577,
3.558792, 4.499717, 5.75652
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
var radius = 8.497766;
var distance = 37.80752;
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
mvMatrix.translate( 0.2819133, -0.6420434, 0.04702854 );
mvMatrix.scale( 1.196128, 1.190867, 0.7915804 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.80752);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Ethylenethiourea<-read.table("Ethylenethiourea.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-4.010753, 0.2637011, 1.025061, 0, 0, 1, 1, 1,
-3.110729, 0.3763212, 0.3376993, 1, 0, 0, 1, 1,
-2.930174, 0.0633373, -2.234955, 1, 0, 0, 1, 1,
-2.777438, 0.08582602, -1.770578, 1, 0, 0, 1, 1,
-2.710828, 1.044876, -0.08431325, 1, 0, 0, 1, 1,
-2.671993, -0.3025996, -2.625197, 1, 0, 0, 1, 1,
-2.610124, -0.7899429, -4.555399, 0, 0, 0, 1, 1,
-2.561442, 0.4361559, -1.645945, 0, 0, 0, 1, 1,
-2.514586, 0.4972263, -1.029577, 0, 0, 0, 1, 1,
-2.377094, -1.78741, -3.188537, 0, 0, 0, 1, 1,
-2.345596, 0.018405, -0.6410426, 0, 0, 0, 1, 1,
-2.338108, 0.6612408, 0.346745, 0, 0, 0, 1, 1,
-2.284035, 0.3595368, 0.06040088, 0, 0, 0, 1, 1,
-2.270754, -0.4211962, -3.132094, 1, 1, 1, 1, 1,
-2.235098, -1.909992, -0.3432084, 1, 1, 1, 1, 1,
-2.22541, 0.4733901, -0.4161355, 1, 1, 1, 1, 1,
-2.21622, -0.3261296, 0.2438758, 1, 1, 1, 1, 1,
-2.203244, -0.3034084, -3.137689, 1, 1, 1, 1, 1,
-2.148452, 0.2440526, -0.8042272, 1, 1, 1, 1, 1,
-2.146335, 0.07426662, -2.431825, 1, 1, 1, 1, 1,
-2.144605, 0.04892594, -1.473543, 1, 1, 1, 1, 1,
-2.103323, -0.08677493, -2.250939, 1, 1, 1, 1, 1,
-2.097798, 0.2812956, -0.8009882, 1, 1, 1, 1, 1,
-2.064028, 1.316721, -0.3427047, 1, 1, 1, 1, 1,
-2.062081, 0.5598215, -0.07775242, 1, 1, 1, 1, 1,
-2.052736, 0.8653785, -1.650871, 1, 1, 1, 1, 1,
-2.049246, 0.706232, -2.414912, 1, 1, 1, 1, 1,
-2.019146, 0.1170455, -0.5713788, 1, 1, 1, 1, 1,
-1.985262, -0.9444598, -2.374467, 0, 0, 1, 1, 1,
-1.983342, -1.185881, -2.271095, 1, 0, 0, 1, 1,
-1.972518, 0.701766, -0.4397517, 1, 0, 0, 1, 1,
-1.963855, 0.4074305, 0.2227622, 1, 0, 0, 1, 1,
-1.953545, 0.5101686, -0.2694505, 1, 0, 0, 1, 1,
-1.948886, 1.366779, -1.174594, 1, 0, 0, 1, 1,
-1.933468, 0.669761, -0.2001033, 0, 0, 0, 1, 1,
-1.923179, -0.4814139, -2.879344, 0, 0, 0, 1, 1,
-1.922263, -0.1824255, -2.140979, 0, 0, 0, 1, 1,
-1.916415, 0.02189643, -1.407828, 0, 0, 0, 1, 1,
-1.913818, 0.9893417, -1.416424, 0, 0, 0, 1, 1,
-1.907022, -1.334522, -0.9628993, 0, 0, 0, 1, 1,
-1.88742, 1.114222, -1.236939, 0, 0, 0, 1, 1,
-1.875071, 0.3330957, -0.8354322, 1, 1, 1, 1, 1,
-1.845317, 1.368774, -1.281952, 1, 1, 1, 1, 1,
-1.831876, 0.7734871, 0.01805269, 1, 1, 1, 1, 1,
-1.787219, 0.3177343, -2.483595, 1, 1, 1, 1, 1,
-1.771936, -1.573709, -2.283519, 1, 1, 1, 1, 1,
-1.760884, -0.5360629, -1.358205, 1, 1, 1, 1, 1,
-1.750725, -0.9758521, -1.792632, 1, 1, 1, 1, 1,
-1.743176, -0.6158711, -3.010923, 1, 1, 1, 1, 1,
-1.742653, -0.9863285, -1.884035, 1, 1, 1, 1, 1,
-1.729441, -1.747682, -3.865821, 1, 1, 1, 1, 1,
-1.716962, 0.8959975, -1.96737, 1, 1, 1, 1, 1,
-1.684876, 1.98916, -2.431016, 1, 1, 1, 1, 1,
-1.680972, -0.7022215, -2.611586, 1, 1, 1, 1, 1,
-1.677883, 0.7103693, -0.9085893, 1, 1, 1, 1, 1,
-1.671492, -0.4865556, -0.6175672, 1, 1, 1, 1, 1,
-1.670922, 0.3395686, -1.255664, 0, 0, 1, 1, 1,
-1.66908, 0.8170898, -1.589005, 1, 0, 0, 1, 1,
-1.643485, -0.5989769, -2.368686, 1, 0, 0, 1, 1,
-1.641127, 0.5132742, -1.56636, 1, 0, 0, 1, 1,
-1.616651, 0.07873505, -1.91587, 1, 0, 0, 1, 1,
-1.61611, -1.656613, -3.131306, 1, 0, 0, 1, 1,
-1.609173, 1.920125, -0.6085126, 0, 0, 0, 1, 1,
-1.607378, 0.4928988, -1.964346, 0, 0, 0, 1, 1,
-1.593193, -0.2724167, -2.384341, 0, 0, 0, 1, 1,
-1.591076, 0.5712774, 0.3475687, 0, 0, 0, 1, 1,
-1.588408, 0.1338366, -0.05814927, 0, 0, 0, 1, 1,
-1.552801, -0.06732378, -0.9048967, 0, 0, 0, 1, 1,
-1.552174, 0.09290454, -0.1867592, 0, 0, 0, 1, 1,
-1.547259, 1.331516, -0.3746387, 1, 1, 1, 1, 1,
-1.527585, -0.7372587, -2.650159, 1, 1, 1, 1, 1,
-1.525583, -1.290226, -2.411122, 1, 1, 1, 1, 1,
-1.523874, 0.6704791, -0.3988581, 1, 1, 1, 1, 1,
-1.521912, -0.3226643, -2.286562, 1, 1, 1, 1, 1,
-1.50694, -0.2015211, -1.447902, 1, 1, 1, 1, 1,
-1.503353, 0.06901393, -2.790295, 1, 1, 1, 1, 1,
-1.480713, -0.5475742, -0.7853947, 1, 1, 1, 1, 1,
-1.475674, -0.02745296, -2.901229, 1, 1, 1, 1, 1,
-1.469759, -0.4711288, -1.039075, 1, 1, 1, 1, 1,
-1.467403, -1.702533, -2.235471, 1, 1, 1, 1, 1,
-1.465679, -0.9318588, -2.28537, 1, 1, 1, 1, 1,
-1.463479, 1.750832, -0.07253865, 1, 1, 1, 1, 1,
-1.454724, -1.290713, -3.079335, 1, 1, 1, 1, 1,
-1.451145, 0.5720614, -1.734567, 1, 1, 1, 1, 1,
-1.450589, -0.4989405, -2.39348, 0, 0, 1, 1, 1,
-1.449111, -0.390598, -0.5555636, 1, 0, 0, 1, 1,
-1.447071, 0.858774, -1.020632, 1, 0, 0, 1, 1,
-1.443169, 0.4630306, -2.057823, 1, 0, 0, 1, 1,
-1.4293, 1.095993, -1.94014, 1, 0, 0, 1, 1,
-1.428656, 1.145276, -0.9981937, 1, 0, 0, 1, 1,
-1.425892, 1.562341, -0.4826567, 0, 0, 0, 1, 1,
-1.403247, 0.4424782, -0.02256038, 0, 0, 0, 1, 1,
-1.384266, -0.4951691, -2.510094, 0, 0, 0, 1, 1,
-1.374198, 0.4060173, -1.089064, 0, 0, 0, 1, 1,
-1.362108, 0.7764864, -0.002212244, 0, 0, 0, 1, 1,
-1.35573, -2.069276, -2.47568, 0, 0, 0, 1, 1,
-1.350338, -1.409442, -1.691335, 0, 0, 0, 1, 1,
-1.340959, 0.3061303, -3.338537, 1, 1, 1, 1, 1,
-1.334834, 0.2596733, -3.44761, 1, 1, 1, 1, 1,
-1.334674, 1.202816, -1.18155, 1, 1, 1, 1, 1,
-1.328801, -0.7649899, -2.769417, 1, 1, 1, 1, 1,
-1.32641, -0.06685659, -2.266116, 1, 1, 1, 1, 1,
-1.320095, 1.476359, -0.2862686, 1, 1, 1, 1, 1,
-1.31876, 0.6484281, -2.426886, 1, 1, 1, 1, 1,
-1.303488, 0.1763093, -1.405664, 1, 1, 1, 1, 1,
-1.300783, 1.992011, -0.01355725, 1, 1, 1, 1, 1,
-1.298338, -0.3343142, -1.451021, 1, 1, 1, 1, 1,
-1.293775, 0.4843735, -0.4302848, 1, 1, 1, 1, 1,
-1.29344, -1.481555, -2.474388, 1, 1, 1, 1, 1,
-1.278896, 0.3004239, -0.9387419, 1, 1, 1, 1, 1,
-1.267353, 0.3781278, -0.5021686, 1, 1, 1, 1, 1,
-1.265951, -1.675455, -3.753891, 1, 1, 1, 1, 1,
-1.250255, 0.3157063, -0.8459648, 0, 0, 1, 1, 1,
-1.23879, 0.5492533, -1.110069, 1, 0, 0, 1, 1,
-1.237691, -0.3506948, -1.493415, 1, 0, 0, 1, 1,
-1.234967, -0.987116, -2.390349, 1, 0, 0, 1, 1,
-1.227097, 1.637551, -1.413614, 1, 0, 0, 1, 1,
-1.226769, -0.5334454, -1.47176, 1, 0, 0, 1, 1,
-1.219251, -1.615862, -1.777849, 0, 0, 0, 1, 1,
-1.215462, 1.226763, -0.9136871, 0, 0, 0, 1, 1,
-1.209966, -0.71825, -3.835222, 0, 0, 0, 1, 1,
-1.167733, 0.1034454, -1.419644, 0, 0, 0, 1, 1,
-1.166857, -0.9483564, -1.715703, 0, 0, 0, 1, 1,
-1.164021, 0.426779, -0.6562124, 0, 0, 0, 1, 1,
-1.153069, 0.6177563, -0.0762194, 0, 0, 0, 1, 1,
-1.150751, -0.5293425, -0.3903792, 1, 1, 1, 1, 1,
-1.150733, -0.7860747, -1.451563, 1, 1, 1, 1, 1,
-1.147483, -0.6274045, -3.189155, 1, 1, 1, 1, 1,
-1.143284, -1.186575, -1.821994, 1, 1, 1, 1, 1,
-1.140832, 0.1259191, -1.638269, 1, 1, 1, 1, 1,
-1.137845, -0.7466062, -4.290548, 1, 1, 1, 1, 1,
-1.136065, -0.3861573, -3.031006, 1, 1, 1, 1, 1,
-1.134969, -0.1691298, -2.273089, 1, 1, 1, 1, 1,
-1.134189, 0.3238236, -2.942641, 1, 1, 1, 1, 1,
-1.122713, 0.5495709, -0.1106923, 1, 1, 1, 1, 1,
-1.120189, 1.097781, -0.6741159, 1, 1, 1, 1, 1,
-1.115486, -0.4874453, -3.724679, 1, 1, 1, 1, 1,
-1.113962, 1.795235, -0.4110716, 1, 1, 1, 1, 1,
-1.1065, -0.3266031, -0.9475919, 1, 1, 1, 1, 1,
-1.105738, 0.2574291, -2.099204, 1, 1, 1, 1, 1,
-1.104119, 0.0005624659, -2.738709, 0, 0, 1, 1, 1,
-1.100075, -0.785157, -2.538538, 1, 0, 0, 1, 1,
-1.09484, -0.869306, -2.955479, 1, 0, 0, 1, 1,
-1.081791, -0.2022897, -1.781044, 1, 0, 0, 1, 1,
-1.073562, -0.1639319, -0.8294408, 1, 0, 0, 1, 1,
-1.071081, 0.5554222, -2.343465, 1, 0, 0, 1, 1,
-1.065886, -0.05218712, -2.588635, 0, 0, 0, 1, 1,
-1.062221, 1.096603, 0.8366874, 0, 0, 0, 1, 1,
-1.062198, 0.8130711, -1.558377, 0, 0, 0, 1, 1,
-1.056206, -0.08287037, 0.2404253, 0, 0, 0, 1, 1,
-1.055322, 0.3106501, -0.652283, 0, 0, 0, 1, 1,
-1.051563, -1.095572, -3.111766, 0, 0, 0, 1, 1,
-1.049772, 0.350188, -1.180895, 0, 0, 0, 1, 1,
-1.04208, 0.05836133, -2.40577, 1, 1, 1, 1, 1,
-1.034845, -0.5113563, -1.356946, 1, 1, 1, 1, 1,
-1.028182, 0.2213489, -1.37892, 1, 1, 1, 1, 1,
-1.028072, -0.2210367, -4.746919, 1, 1, 1, 1, 1,
-1.021703, -0.4762073, -2.678265, 1, 1, 1, 1, 1,
-1.018434, 0.8054159, -1.060602, 1, 1, 1, 1, 1,
-1.009892, 0.2481979, -3.551722, 1, 1, 1, 1, 1,
-1.009472, -1.801918, -3.466565, 1, 1, 1, 1, 1,
-1.009172, 0.4208805, -1.316255, 1, 1, 1, 1, 1,
-1.007944, -0.01872909, -1.504006, 1, 1, 1, 1, 1,
-1.006176, -1.844388, -2.401743, 1, 1, 1, 1, 1,
-1.006124, 0.1667863, -2.462293, 1, 1, 1, 1, 1,
-0.9935786, 1.131705, -0.432165, 1, 1, 1, 1, 1,
-0.9903815, -1.469119, -3.145474, 1, 1, 1, 1, 1,
-0.9880854, 0.6088145, -1.38033, 1, 1, 1, 1, 1,
-0.9809905, 1.353305, 0.05445205, 0, 0, 1, 1, 1,
-0.9680705, -0.02661191, -2.55274, 1, 0, 0, 1, 1,
-0.9640084, -0.7077875, -4.11859, 1, 0, 0, 1, 1,
-0.9627945, 0.4774031, -0.6299662, 1, 0, 0, 1, 1,
-0.9616712, -0.9852422, -2.562196, 1, 0, 0, 1, 1,
-0.9612338, 1.529048, -0.809603, 1, 0, 0, 1, 1,
-0.9582145, -0.4582081, -0.8171922, 0, 0, 0, 1, 1,
-0.9518153, 1.151507, -2.998554, 0, 0, 0, 1, 1,
-0.9511762, 0.09180409, -1.341179, 0, 0, 0, 1, 1,
-0.9465742, -1.527565, -4.220137, 0, 0, 0, 1, 1,
-0.945807, -2.605043, -2.591875, 0, 0, 0, 1, 1,
-0.9317435, 0.05347987, -1.825536, 0, 0, 0, 1, 1,
-0.9313605, 0.3250766, -1.330994, 0, 0, 0, 1, 1,
-0.9304244, 0.4556422, 0.1333226, 1, 1, 1, 1, 1,
-0.9303771, -2.095439, -4.75966, 1, 1, 1, 1, 1,
-0.9248545, -1.105378, -0.7706097, 1, 1, 1, 1, 1,
-0.9199233, -0.7981099, -3.725083, 1, 1, 1, 1, 1,
-0.9145836, 0.8945029, 0.9123068, 1, 1, 1, 1, 1,
-0.9135754, -1.620913, -2.759531, 1, 1, 1, 1, 1,
-0.9115711, 0.3060501, 0.3336122, 1, 1, 1, 1, 1,
-0.9063126, -0.4192118, -1.190507, 1, 1, 1, 1, 1,
-0.9010956, -1.076046, -3.194707, 1, 1, 1, 1, 1,
-0.9000637, 1.90809, -0.1473849, 1, 1, 1, 1, 1,
-0.8951096, 2.004271, 1.19331, 1, 1, 1, 1, 1,
-0.8919519, -1.176346, -2.619488, 1, 1, 1, 1, 1,
-0.8880515, 0.907001, 0.6449083, 1, 1, 1, 1, 1,
-0.8865152, -0.7479622, -1.924537, 1, 1, 1, 1, 1,
-0.8858719, -0.1209582, -0.5531733, 1, 1, 1, 1, 1,
-0.8836978, 0.3480996, -2.02337, 0, 0, 1, 1, 1,
-0.8822008, 1.232865, -0.2134573, 1, 0, 0, 1, 1,
-0.8818994, -1.338603, -1.922922, 1, 0, 0, 1, 1,
-0.8716087, -1.709643, -3.787492, 1, 0, 0, 1, 1,
-0.8668015, 0.4050725, -1.675809, 1, 0, 0, 1, 1,
-0.857771, 3.400195, -0.7500504, 1, 0, 0, 1, 1,
-0.8529091, 0.5738022, -2.245102, 0, 0, 0, 1, 1,
-0.8517979, 1.80434, -0.8507745, 0, 0, 0, 1, 1,
-0.8511572, 0.746914, -1.104935, 0, 0, 0, 1, 1,
-0.8443586, -0.5049925, -2.749612, 0, 0, 0, 1, 1,
-0.8413991, 0.6939583, 0.670902, 0, 0, 0, 1, 1,
-0.8411613, -0.6228358, -0.4467031, 0, 0, 0, 1, 1,
-0.8399063, 1.373569, -1.038554, 0, 0, 0, 1, 1,
-0.8338844, -1.323511, -2.762751, 1, 1, 1, 1, 1,
-0.8308541, -0.3890683, -4.12962, 1, 1, 1, 1, 1,
-0.8239083, -0.5186116, -1.710465, 1, 1, 1, 1, 1,
-0.8219152, 0.5323441, -1.425168, 1, 1, 1, 1, 1,
-0.8195714, 0.2323488, -1.878622, 1, 1, 1, 1, 1,
-0.8188993, -1.459284, -2.349587, 1, 1, 1, 1, 1,
-0.8128094, -1.164452, -1.712987, 1, 1, 1, 1, 1,
-0.8127886, 1.396699, -1.082502, 1, 1, 1, 1, 1,
-0.8090898, 0.4161575, -1.701604, 1, 1, 1, 1, 1,
-0.8084831, -0.6088634, -1.815032, 1, 1, 1, 1, 1,
-0.8064335, -0.1896662, -0.8391899, 1, 1, 1, 1, 1,
-0.8033351, -0.2268573, -3.072753, 1, 1, 1, 1, 1,
-0.8013966, 0.4942312, -2.530637, 1, 1, 1, 1, 1,
-0.8009183, 0.07345302, -1.033843, 1, 1, 1, 1, 1,
-0.7937221, -0.2035478, -1.893955, 1, 1, 1, 1, 1,
-0.7764357, 0.7474753, 0.6570432, 0, 0, 1, 1, 1,
-0.7726341, -1.84183, -2.586964, 1, 0, 0, 1, 1,
-0.7683722, 0.5865855, -0.4856412, 1, 0, 0, 1, 1,
-0.7681586, -0.1827669, -2.675807, 1, 0, 0, 1, 1,
-0.7680578, 0.02869436, -0.335889, 1, 0, 0, 1, 1,
-0.7677322, 0.1887701, -0.2028117, 1, 0, 0, 1, 1,
-0.759503, -0.9062052, -3.579072, 0, 0, 0, 1, 1,
-0.7576753, 1.202761, 0.9883929, 0, 0, 0, 1, 1,
-0.7517535, -0.8642099, -2.764006, 0, 0, 0, 1, 1,
-0.748208, -0.9427108, -0.6900936, 0, 0, 0, 1, 1,
-0.7453321, 0.1775788, -0.4761021, 0, 0, 0, 1, 1,
-0.7403521, -0.5982458, -2.359229, 0, 0, 0, 1, 1,
-0.7366832, 1.120941, -1.972072, 0, 0, 0, 1, 1,
-0.7350674, 0.8266649, -2.860255, 1, 1, 1, 1, 1,
-0.7331249, -0.8814816, -3.235043, 1, 1, 1, 1, 1,
-0.7311988, 1.592022, -2.622565, 1, 1, 1, 1, 1,
-0.7308671, -0.1901956, -2.060438, 1, 1, 1, 1, 1,
-0.7296021, 0.5266953, -1.6887, 1, 1, 1, 1, 1,
-0.7238055, 0.5416013, -0.5546846, 1, 1, 1, 1, 1,
-0.72324, -1.074026, -1.673767, 1, 1, 1, 1, 1,
-0.7229978, 1.617501, 1.599222, 1, 1, 1, 1, 1,
-0.7220916, 0.05160782, -0.3493877, 1, 1, 1, 1, 1,
-0.7181919, -0.1901907, -2.722063, 1, 1, 1, 1, 1,
-0.7176747, -0.3909283, -2.965428, 1, 1, 1, 1, 1,
-0.7155095, 1.125853, -0.250172, 1, 1, 1, 1, 1,
-0.7139559, 1.816117, -1.101569, 1, 1, 1, 1, 1,
-0.7122946, -0.9922962, -3.077013, 1, 1, 1, 1, 1,
-0.711023, -0.587252, -2.511841, 1, 1, 1, 1, 1,
-0.709983, -1.602535, -2.773645, 0, 0, 1, 1, 1,
-0.7062593, 2.284285, 0.5443719, 1, 0, 0, 1, 1,
-0.7007275, -0.08562275, -0.6558832, 1, 0, 0, 1, 1,
-0.6980453, 2.012565, -0.4312863, 1, 0, 0, 1, 1,
-0.6972988, 1.006427, -0.481811, 1, 0, 0, 1, 1,
-0.6908266, 0.4731653, 1.098997, 1, 0, 0, 1, 1,
-0.6887465, -0.8023543, -2.815546, 0, 0, 0, 1, 1,
-0.6799763, 1.954177, -0.4561191, 0, 0, 0, 1, 1,
-0.678036, -0.5433798, -2.975683, 0, 0, 0, 1, 1,
-0.6772149, -0.7566098, -1.989514, 0, 0, 0, 1, 1,
-0.6745237, 0.1982944, -1.806764, 0, 0, 0, 1, 1,
-0.6721483, -1.915869, -2.634674, 0, 0, 0, 1, 1,
-0.6676968, 0.2498753, 0.1791734, 0, 0, 0, 1, 1,
-0.650574, 0.2007519, -0.6031974, 1, 1, 1, 1, 1,
-0.6494502, -1.043748, -1.757823, 1, 1, 1, 1, 1,
-0.6450318, -0.01118237, -0.2233376, 1, 1, 1, 1, 1,
-0.6421612, -0.9678646, -1.756128, 1, 1, 1, 1, 1,
-0.6413094, -0.4083382, -3.51643, 1, 1, 1, 1, 1,
-0.6368873, 1.219673, -0.2831726, 1, 1, 1, 1, 1,
-0.6299658, -1.333845, -1.470186, 1, 1, 1, 1, 1,
-0.6266769, -0.8288357, -1.353872, 1, 1, 1, 1, 1,
-0.6266013, 0.414064, -3.113237, 1, 1, 1, 1, 1,
-0.614871, 0.8336588, -1.705738, 1, 1, 1, 1, 1,
-0.6131319, -0.6623133, -2.742129, 1, 1, 1, 1, 1,
-0.6109536, 0.550461, -0.3377923, 1, 1, 1, 1, 1,
-0.6077365, -0.1669355, -3.100842, 1, 1, 1, 1, 1,
-0.6070585, 0.1409058, -1.527457, 1, 1, 1, 1, 1,
-0.5876079, -1.141435, -3.850807, 1, 1, 1, 1, 1,
-0.5822396, -0.452215, -1.580028, 0, 0, 1, 1, 1,
-0.576323, -0.2145358, -1.557725, 1, 0, 0, 1, 1,
-0.5698321, 0.2753597, -1.983134, 1, 0, 0, 1, 1,
-0.5621312, -1.030089, -1.197726, 1, 0, 0, 1, 1,
-0.5615562, 0.3146226, -4.228972, 1, 0, 0, 1, 1,
-0.5611123, 1.030802, -1.072283, 1, 0, 0, 1, 1,
-0.553493, -0.04501827, -0.5219074, 0, 0, 0, 1, 1,
-0.5514829, -0.2994455, -5.681542, 0, 0, 0, 1, 1,
-0.5476595, -1.065813, -2.185817, 0, 0, 0, 1, 1,
-0.5469416, 1.623293, 0.08204573, 0, 0, 0, 1, 1,
-0.54543, -1.216417, -2.517361, 0, 0, 0, 1, 1,
-0.5401094, -0.4235573, -2.394785, 0, 0, 0, 1, 1,
-0.5389498, 1.313101, -1.712046, 0, 0, 0, 1, 1,
-0.5361022, 1.39007, -1.072643, 1, 1, 1, 1, 1,
-0.5335205, 1.762747, -1.129673, 1, 1, 1, 1, 1,
-0.5302914, -0.0318493, -0.6330076, 1, 1, 1, 1, 1,
-0.528722, -0.689151, -4.624483, 1, 1, 1, 1, 1,
-0.5284248, -0.3683814, -1.181594, 1, 1, 1, 1, 1,
-0.5263034, -0.3305906, -2.594715, 1, 1, 1, 1, 1,
-0.5209165, -0.4836131, -3.460612, 1, 1, 1, 1, 1,
-0.5194029, -1.155089, -3.445486, 1, 1, 1, 1, 1,
-0.5175673, 0.1011772, -2.293058, 1, 1, 1, 1, 1,
-0.516435, 0.4380058, -0.9171563, 1, 1, 1, 1, 1,
-0.5073078, -1.057078, -0.9814109, 1, 1, 1, 1, 1,
-0.5045578, 0.45041, -0.1637101, 1, 1, 1, 1, 1,
-0.500152, -2.372079, -2.933004, 1, 1, 1, 1, 1,
-0.4973808, 0.4351805, -0.9913636, 1, 1, 1, 1, 1,
-0.495292, -0.8490309, -2.628358, 1, 1, 1, 1, 1,
-0.494748, 0.1559515, -0.6596431, 0, 0, 1, 1, 1,
-0.4923725, 0.3782333, 0.1636803, 1, 0, 0, 1, 1,
-0.4920225, 0.6516258, -0.4975026, 1, 0, 0, 1, 1,
-0.4907988, -0.595583, -2.48074, 1, 0, 0, 1, 1,
-0.4886138, 0.664851, 0.3671401, 1, 0, 0, 1, 1,
-0.4867235, -0.1149952, -2.306502, 1, 0, 0, 1, 1,
-0.4827158, -0.2772244, -4.582121, 0, 0, 0, 1, 1,
-0.4821415, 0.6679288, -0.6245378, 0, 0, 0, 1, 1,
-0.4690476, 0.2699093, 0.3697174, 0, 0, 0, 1, 1,
-0.463045, 0.2052079, -0.6135182, 0, 0, 0, 1, 1,
-0.4593117, -0.9146933, -3.655202, 0, 0, 0, 1, 1,
-0.4507526, 0.07634153, -0.9111674, 0, 0, 0, 1, 1,
-0.447764, 0.4384978, -1.013526, 0, 0, 0, 1, 1,
-0.4469494, -1.160971, -1.938583, 1, 1, 1, 1, 1,
-0.4442786, 0.2144041, -0.8515134, 1, 1, 1, 1, 1,
-0.4403124, 0.6556466, -2.169502, 1, 1, 1, 1, 1,
-0.4375487, -1.266016, -3.383003, 1, 1, 1, 1, 1,
-0.4324738, 0.927028, -2.518436, 1, 1, 1, 1, 1,
-0.4264699, 0.5703592, -0.4634082, 1, 1, 1, 1, 1,
-0.4255528, 1.6704, -0.6086352, 1, 1, 1, 1, 1,
-0.4242761, -2.445793, -3.18727, 1, 1, 1, 1, 1,
-0.4238018, -0.226312, -1.961816, 1, 1, 1, 1, 1,
-0.4237225, 1.215325, -0.1515209, 1, 1, 1, 1, 1,
-0.4191421, 0.7525753, 0.7323374, 1, 1, 1, 1, 1,
-0.4155208, 0.1014491, -2.252135, 1, 1, 1, 1, 1,
-0.4151136, -1.152418, -4.303024, 1, 1, 1, 1, 1,
-0.4140865, -1.462526, -5.120261, 1, 1, 1, 1, 1,
-0.4111491, -0.2758668, -3.234236, 1, 1, 1, 1, 1,
-0.407895, -1.128729, -3.050505, 0, 0, 1, 1, 1,
-0.4052789, 0.9983147, 0.6613947, 1, 0, 0, 1, 1,
-0.4050073, 0.3920667, 1.406981, 1, 0, 0, 1, 1,
-0.4012201, -1.13725, -0.8925129, 1, 0, 0, 1, 1,
-0.4002534, -0.5351431, -0.3247225, 1, 0, 0, 1, 1,
-0.3985789, -0.413521, -1.300188, 1, 0, 0, 1, 1,
-0.3963669, -0.5418315, -2.500156, 0, 0, 0, 1, 1,
-0.3906125, 0.1742477, -1.423792, 0, 0, 0, 1, 1,
-0.3896661, 1.113976, -0.1012252, 0, 0, 0, 1, 1,
-0.3894747, -0.1000408, 0.1570357, 0, 0, 0, 1, 1,
-0.3833464, 0.1460047, -3.538956, 0, 0, 0, 1, 1,
-0.3827757, 0.791778, -1.42696, 0, 0, 0, 1, 1,
-0.3805411, 0.7823718, -0.8216559, 0, 0, 0, 1, 1,
-0.3802964, 0.7915638, 1.958502, 1, 1, 1, 1, 1,
-0.3791173, -0.1041436, -3.145369, 1, 1, 1, 1, 1,
-0.3787983, 0.3532839, -1.800763, 1, 1, 1, 1, 1,
-0.3663412, 0.228724, 0.1853846, 1, 1, 1, 1, 1,
-0.3646206, -0.9238075, -2.491114, 1, 1, 1, 1, 1,
-0.3640004, -0.7387442, -2.114082, 1, 1, 1, 1, 1,
-0.3587397, -0.5043365, -3.166749, 1, 1, 1, 1, 1,
-0.3557875, -0.8056157, -1.833013, 1, 1, 1, 1, 1,
-0.3525477, 0.576923, -2.750827, 1, 1, 1, 1, 1,
-0.3525284, -1.510361, -2.755114, 1, 1, 1, 1, 1,
-0.3501876, -1.556, -3.553662, 1, 1, 1, 1, 1,
-0.3497345, 2.496589, 0.09738526, 1, 1, 1, 1, 1,
-0.3479094, -0.206852, -3.451458, 1, 1, 1, 1, 1,
-0.3466382, -0.3511173, -1.570564, 1, 1, 1, 1, 1,
-0.3464006, -0.736882, -2.114671, 1, 1, 1, 1, 1,
-0.3396085, 1.256971, -1.044507, 0, 0, 1, 1, 1,
-0.3377174, 2.142985, 0.1883493, 1, 0, 0, 1, 1,
-0.3373191, -0.37176, -1.136296, 1, 0, 0, 1, 1,
-0.3356395, 0.6785927, -0.5414361, 1, 0, 0, 1, 1,
-0.3347824, 0.668429, -0.2890921, 1, 0, 0, 1, 1,
-0.3346622, -2.23388, -3.523293, 1, 0, 0, 1, 1,
-0.3317179, 0.8973578, -1.237463, 0, 0, 0, 1, 1,
-0.3256354, -2.084849, -2.793746, 0, 0, 0, 1, 1,
-0.3233407, -0.1962247, -4.242902, 0, 0, 0, 1, 1,
-0.3219799, -1.299531, -3.718324, 0, 0, 0, 1, 1,
-0.3204179, 0.09226292, -3.155579, 0, 0, 0, 1, 1,
-0.3166831, -1.214838, -2.572918, 0, 0, 0, 1, 1,
-0.3157887, -0.1162026, -0.6192676, 0, 0, 0, 1, 1,
-0.309598, 0.7533982, -0.05617779, 1, 1, 1, 1, 1,
-0.3079109, -0.2661048, -4.239566, 1, 1, 1, 1, 1,
-0.3067129, 0.9125651, -1.287453, 1, 1, 1, 1, 1,
-0.3020961, 1.253119, -1.392455, 1, 1, 1, 1, 1,
-0.300836, 0.2617059, -0.400405, 1, 1, 1, 1, 1,
-0.2987676, -1.038942, -2.650736, 1, 1, 1, 1, 1,
-0.2986217, -2.938972, -2.226987, 1, 1, 1, 1, 1,
-0.2915224, 0.719768, -0.8549837, 1, 1, 1, 1, 1,
-0.291333, -0.02014541, -1.827899, 1, 1, 1, 1, 1,
-0.289615, -0.664257, -2.316206, 1, 1, 1, 1, 1,
-0.2883562, 0.5586245, -2.732162, 1, 1, 1, 1, 1,
-0.2862947, -0.6405914, -2.124768, 1, 1, 1, 1, 1,
-0.286231, -0.1112063, -1.949864, 1, 1, 1, 1, 1,
-0.2861169, 1.710764, 0.739421, 1, 1, 1, 1, 1,
-0.2779661, 0.6468384, 1.407889, 1, 1, 1, 1, 1,
-0.2770412, -1.587364, -2.236715, 0, 0, 1, 1, 1,
-0.2744029, -0.1951206, -1.237486, 1, 0, 0, 1, 1,
-0.2740115, 0.5824068, -0.8777482, 1, 0, 0, 1, 1,
-0.2664333, 2.201434, -1.243331, 1, 0, 0, 1, 1,
-0.2564036, 0.4864746, -3.173899, 1, 0, 0, 1, 1,
-0.2519633, 1.113149, -1.185737, 1, 0, 0, 1, 1,
-0.2484622, -1.611842, -3.741976, 0, 0, 0, 1, 1,
-0.2473504, 1.820518, -0.6547315, 0, 0, 0, 1, 1,
-0.24582, 0.723415, 0.531842, 0, 0, 0, 1, 1,
-0.2385787, 0.9341539, -0.6715794, 0, 0, 0, 1, 1,
-0.2364523, -2.47336, -3.642703, 0, 0, 0, 1, 1,
-0.2353851, 0.2145479, -1.709535, 0, 0, 0, 1, 1,
-0.2337464, 1.245095, -1.788127, 0, 0, 0, 1, 1,
-0.2265544, -0.9491453, -4.18879, 1, 1, 1, 1, 1,
-0.2249031, -1.532684, -4.392822, 1, 1, 1, 1, 1,
-0.2186704, 3.00817, -0.8651729, 1, 1, 1, 1, 1,
-0.2182853, 1.720352, -1.732504, 1, 1, 1, 1, 1,
-0.2164077, -0.4665011, -1.866841, 1, 1, 1, 1, 1,
-0.2137625, 1.550266, -0.333191, 1, 1, 1, 1, 1,
-0.2107041, -1.058474, -2.382278, 1, 1, 1, 1, 1,
-0.2070041, 0.3041887, -1.666975, 1, 1, 1, 1, 1,
-0.2024359, -0.05927414, -2.9145, 1, 1, 1, 1, 1,
-0.2021005, 0.5829716, -0.5135933, 1, 1, 1, 1, 1,
-0.1972959, -0.9715396, -1.980207, 1, 1, 1, 1, 1,
-0.1968677, 0.7041333, -1.117525, 1, 1, 1, 1, 1,
-0.1907811, 0.6832585, -1.35117, 1, 1, 1, 1, 1,
-0.1862526, -0.8818718, -1.843613, 1, 1, 1, 1, 1,
-0.1782747, 0.8093347, -0.3581311, 1, 1, 1, 1, 1,
-0.1743961, -0.02182418, -1.567584, 0, 0, 1, 1, 1,
-0.1734466, 0.6522021, 0.1751086, 1, 0, 0, 1, 1,
-0.172204, 0.432368, -1.275265, 1, 0, 0, 1, 1,
-0.1716184, -0.5595735, -2.477382, 1, 0, 0, 1, 1,
-0.1711463, 0.6872735, 0.7743633, 1, 0, 0, 1, 1,
-0.170395, -0.9242362, -4.108556, 1, 0, 0, 1, 1,
-0.1656796, -1.074051, -2.95916, 0, 0, 0, 1, 1,
-0.1573639, 0.3493964, -2.008187, 0, 0, 0, 1, 1,
-0.1570247, -1.463256, -2.66552, 0, 0, 0, 1, 1,
-0.1557262, -1.421474, -2.983621, 0, 0, 0, 1, 1,
-0.1526623, 1.689169, 0.2630351, 0, 0, 0, 1, 1,
-0.1521258, 0.04838132, -1.74122, 0, 0, 0, 1, 1,
-0.148977, 1.54013, 0.9711632, 0, 0, 0, 1, 1,
-0.1475112, 1.236259, 0.2702233, 1, 1, 1, 1, 1,
-0.1462086, 0.3979138, -2.361773, 1, 1, 1, 1, 1,
-0.1437616, 2.692622, -1.653852, 1, 1, 1, 1, 1,
-0.1430689, -0.8518724, -2.970643, 1, 1, 1, 1, 1,
-0.1424335, -0.4087366, -1.145454, 1, 1, 1, 1, 1,
-0.1417155, 1.561183, 0.830097, 1, 1, 1, 1, 1,
-0.1407991, -0.8987175, -2.729865, 1, 1, 1, 1, 1,
-0.1393956, -0.1355985, -0.4789717, 1, 1, 1, 1, 1,
-0.1377136, 1.281631, -1.334493, 1, 1, 1, 1, 1,
-0.1372075, 0.8254355, -0.6943161, 1, 1, 1, 1, 1,
-0.1355015, 0.7392724, 0.9403486, 1, 1, 1, 1, 1,
-0.1305909, -0.5692272, -4.389849, 1, 1, 1, 1, 1,
-0.1304631, -1.559075, -1.807103, 1, 1, 1, 1, 1,
-0.1267342, 0.1411401, -0.8247296, 1, 1, 1, 1, 1,
-0.1239225, 1.741262, 2.195058, 1, 1, 1, 1, 1,
-0.1190236, -0.8589803, -4.333077, 0, 0, 1, 1, 1,
-0.1167275, 0.3188696, -1.811622, 1, 0, 0, 1, 1,
-0.1161604, -0.4395019, -4.348157, 1, 0, 0, 1, 1,
-0.1155364, -0.7846121, -3.240309, 1, 0, 0, 1, 1,
-0.1155244, 1.33523, -0.4626114, 1, 0, 0, 1, 1,
-0.1155202, -1.14471, -3.003498, 1, 0, 0, 1, 1,
-0.1078043, -0.7382793, -4.737171, 0, 0, 0, 1, 1,
-0.1077357, 2.157666, 0.2176569, 0, 0, 0, 1, 1,
-0.1011951, -0.5695193, -3.203299, 0, 0, 0, 1, 1,
-0.09967071, -0.375289, -1.826066, 0, 0, 0, 1, 1,
-0.09400036, 0.1869807, -0.3369517, 0, 0, 0, 1, 1,
-0.09369469, 0.8953876, -0.6758734, 0, 0, 0, 1, 1,
-0.09275248, -0.8613781, -4.381409, 0, 0, 0, 1, 1,
-0.0891448, 0.4026398, -0.7944864, 1, 1, 1, 1, 1,
-0.0876116, 0.05565201, -1.482734, 1, 1, 1, 1, 1,
-0.08684784, -0.7076895, -2.845912, 1, 1, 1, 1, 1,
-0.08561753, -0.4446853, -2.862395, 1, 1, 1, 1, 1,
-0.08505717, -0.01130749, -3.198797, 1, 1, 1, 1, 1,
-0.08499289, 0.03927609, -2.480313, 1, 1, 1, 1, 1,
-0.08491789, 1.306631, -2.164589, 1, 1, 1, 1, 1,
-0.08429632, 0.05970472, -1.771983, 1, 1, 1, 1, 1,
-0.08426617, -0.6252201, -1.902489, 1, 1, 1, 1, 1,
-0.08135682, -1.678222, -2.768228, 1, 1, 1, 1, 1,
-0.07744254, -0.7437367, -1.44634, 1, 1, 1, 1, 1,
-0.07700638, -0.1862309, -0.9022283, 1, 1, 1, 1, 1,
-0.07686898, -0.8722352, -2.922511, 1, 1, 1, 1, 1,
-0.07498854, -0.4206289, -2.071466, 1, 1, 1, 1, 1,
-0.07355832, -1.472049, -4.786483, 1, 1, 1, 1, 1,
-0.07007307, 0.3694051, -2.058101, 0, 0, 1, 1, 1,
-0.06883588, -1.302197, -3.637659, 1, 0, 0, 1, 1,
-0.06402577, 0.8940704, -0.934656, 1, 0, 0, 1, 1,
-0.06367376, 0.6059557, 1.210781, 1, 0, 0, 1, 1,
-0.06346367, -0.8191958, -3.065334, 1, 0, 0, 1, 1,
-0.06250104, -0.3044207, -2.162205, 1, 0, 0, 1, 1,
-0.06097955, -0.3626894, -3.53863, 0, 0, 0, 1, 1,
-0.06086191, 2.06573, -1.308984, 0, 0, 0, 1, 1,
-0.06078493, 0.1994527, -0.3341263, 0, 0, 0, 1, 1,
-0.05764457, 0.3375926, -0.8714589, 0, 0, 0, 1, 1,
-0.05757013, 2.017848, -0.3960522, 0, 0, 0, 1, 1,
-0.05535892, -0.8851999, -3.063842, 0, 0, 0, 1, 1,
-0.04743468, -0.1162854, -2.199137, 0, 0, 0, 1, 1,
-0.04703402, -0.3129044, -3.483568, 1, 1, 1, 1, 1,
-0.04354705, 0.6961209, 1.819936, 1, 1, 1, 1, 1,
-0.04080266, 0.5234812, 0.7643133, 1, 1, 1, 1, 1,
-0.03896995, -0.5861054, -1.886618, 1, 1, 1, 1, 1,
-0.03630769, 0.3256687, -0.5699005, 1, 1, 1, 1, 1,
-0.03452247, -0.2265424, -2.465852, 1, 1, 1, 1, 1,
-0.03081587, -0.5298867, -2.439093, 1, 1, 1, 1, 1,
-0.02957247, 1.638696, -0.8626682, 1, 1, 1, 1, 1,
-0.02162733, -0.2377882, -2.64824, 1, 1, 1, 1, 1,
-0.02117703, 1.526046, 1.831013, 1, 1, 1, 1, 1,
-0.01792969, -1.267438, -2.815732, 1, 1, 1, 1, 1,
-0.01450546, 2.646554, 0.4872059, 1, 1, 1, 1, 1,
-0.01294152, 0.3318536, -0.8477225, 1, 1, 1, 1, 1,
-0.008114379, -0.545608, -3.267209, 1, 1, 1, 1, 1,
-0.006311443, 1.132929, 0.6888269, 1, 1, 1, 1, 1,
-0.004433589, -1.266208, -2.242363, 0, 0, 1, 1, 1,
-0.002297881, 1.301425, -0.7350274, 1, 0, 0, 1, 1,
0.003021786, -1.07037, 1.961634, 1, 0, 0, 1, 1,
0.007721896, 0.5141031, 0.1124663, 1, 0, 0, 1, 1,
0.01051821, -1.57109, 4.80249, 1, 0, 0, 1, 1,
0.01114966, -0.7198339, 1.395253, 1, 0, 0, 1, 1,
0.01350618, -0.2593556, 1.056862, 0, 0, 0, 1, 1,
0.01375653, 0.9067696, 0.5561708, 0, 0, 0, 1, 1,
0.01747343, 0.3453323, 0.9618043, 0, 0, 0, 1, 1,
0.01812745, -0.4802883, 1.975485, 0, 0, 0, 1, 1,
0.01826682, 1.028123, -0.8542968, 0, 0, 0, 1, 1,
0.02296324, -0.8914237, 3.057155, 0, 0, 0, 1, 1,
0.0257716, 4.387357, 0.5632241, 0, 0, 0, 1, 1,
0.02675373, -0.9282894, 2.103763, 1, 1, 1, 1, 1,
0.02729861, -1.410002, 5.587485, 1, 1, 1, 1, 1,
0.03128335, 0.3374077, 0.6242043, 1, 1, 1, 1, 1,
0.03326701, 0.2720692, -0.6887189, 1, 1, 1, 1, 1,
0.03544816, -1.314996, 2.908591, 1, 1, 1, 1, 1,
0.03801269, 0.5143667, 0.3327776, 1, 1, 1, 1, 1,
0.0410049, 0.7036001, -1.78598, 1, 1, 1, 1, 1,
0.0433956, 1.951342, 0.8735027, 1, 1, 1, 1, 1,
0.04509198, -0.6265815, 3.205419, 1, 1, 1, 1, 1,
0.04892502, 0.8763461, 1.041774, 1, 1, 1, 1, 1,
0.0518772, -1.18097, 2.42146, 1, 1, 1, 1, 1,
0.05904732, -1.75502, 5.303444, 1, 1, 1, 1, 1,
0.05917797, 0.2786137, -0.1813936, 1, 1, 1, 1, 1,
0.05937543, 0.6096256, 0.2583095, 1, 1, 1, 1, 1,
0.06016644, 0.06721038, 0.2031173, 1, 1, 1, 1, 1,
0.06399596, -0.5600775, 2.952185, 0, 0, 1, 1, 1,
0.06468349, 0.6454465, 0.1438251, 1, 0, 0, 1, 1,
0.06905301, -0.5051826, 2.020466, 1, 0, 0, 1, 1,
0.07037636, 0.7158193, -0.04920661, 1, 0, 0, 1, 1,
0.07048902, -0.09465422, 3.462678, 1, 0, 0, 1, 1,
0.07062031, 0.5323411, -0.7192637, 1, 0, 0, 1, 1,
0.07601204, 0.1567594, 0.3338127, 0, 0, 0, 1, 1,
0.08072917, 0.6593177, -0.1660448, 0, 0, 0, 1, 1,
0.08100959, -1.242711, 3.15836, 0, 0, 0, 1, 1,
0.08277548, -0.1242833, 4.819464, 0, 0, 0, 1, 1,
0.08633634, 0.5550478, 0.3016457, 0, 0, 0, 1, 1,
0.087938, 0.2172674, 0.4684026, 0, 0, 0, 1, 1,
0.09017662, 0.8700374, -0.6948444, 0, 0, 0, 1, 1,
0.09368432, -0.2444208, 1.574547, 1, 1, 1, 1, 1,
0.099888, 2.450946, 0.5100881, 1, 1, 1, 1, 1,
0.1066329, 0.4436476, -0.1924017, 1, 1, 1, 1, 1,
0.1131472, -0.08391467, -0.6208369, 1, 1, 1, 1, 1,
0.113824, -0.07237492, 2.217041, 1, 1, 1, 1, 1,
0.1172577, -1.100069, 2.502592, 1, 1, 1, 1, 1,
0.117798, -0.3993721, 2.078077, 1, 1, 1, 1, 1,
0.1205785, -1.997888, 3.462022, 1, 1, 1, 1, 1,
0.1270828, 0.5304877, -1.261589, 1, 1, 1, 1, 1,
0.1337891, -1.163561, 3.008882, 1, 1, 1, 1, 1,
0.1350818, 0.7372506, 1.755348, 1, 1, 1, 1, 1,
0.1353109, 0.05172291, 0.9655507, 1, 1, 1, 1, 1,
0.1357825, -0.2840146, 3.659337, 1, 1, 1, 1, 1,
0.1460052, -0.5806835, 3.382867, 1, 1, 1, 1, 1,
0.1466198, 0.1227589, 0.1306807, 1, 1, 1, 1, 1,
0.1473739, -0.6501691, 2.133264, 0, 0, 1, 1, 1,
0.1479606, 0.8183903, -0.1774347, 1, 0, 0, 1, 1,
0.1480317, -0.4911668, 1.522534, 1, 0, 0, 1, 1,
0.1513745, -0.2887436, 3.039293, 1, 0, 0, 1, 1,
0.1646793, 0.5372788, -0.4342279, 1, 0, 0, 1, 1,
0.1656393, -1.961831, 2.812585, 1, 0, 0, 1, 1,
0.1656769, -0.302935, 2.104763, 0, 0, 0, 1, 1,
0.1737283, -0.326364, 3.676786, 0, 0, 0, 1, 1,
0.177354, 0.345803, 0.6019254, 0, 0, 0, 1, 1,
0.1795556, 0.3701656, 0.4391617, 0, 0, 0, 1, 1,
0.1836382, 1.008733, -0.5531318, 0, 0, 0, 1, 1,
0.1839785, -1.148357, 3.491916, 0, 0, 0, 1, 1,
0.1851135, 1.658892, 2.169889, 0, 0, 0, 1, 1,
0.1863034, -0.4227932, 1.643405, 1, 1, 1, 1, 1,
0.1882956, -0.463798, 5.419734, 1, 1, 1, 1, 1,
0.1912912, -1.837915, 5.311484, 1, 1, 1, 1, 1,
0.1961435, -1.066268, 2.186354, 1, 1, 1, 1, 1,
0.1978366, -1.040235, 4.280182, 1, 1, 1, 1, 1,
0.2004144, 1.148981, 0.3195142, 1, 1, 1, 1, 1,
0.2026736, -2.319011, 5.285428, 1, 1, 1, 1, 1,
0.2051485, 0.8730317, -2.699566, 1, 1, 1, 1, 1,
0.2070027, 0.07997382, 1.623694, 1, 1, 1, 1, 1,
0.2093768, -0.9299185, 1.688144, 1, 1, 1, 1, 1,
0.2115937, 0.8530868, 1.245259, 1, 1, 1, 1, 1,
0.2133438, -1.827847, 3.57475, 1, 1, 1, 1, 1,
0.214443, -1.625111, 2.255303, 1, 1, 1, 1, 1,
0.2144767, -0.9361013, 2.826458, 1, 1, 1, 1, 1,
0.2152938, -0.1639729, 2.910643, 1, 1, 1, 1, 1,
0.2194979, 0.24623, 0.5249677, 0, 0, 1, 1, 1,
0.2286831, 0.9219576, 0.4813716, 1, 0, 0, 1, 1,
0.2312189, 1.170807, -0.06817664, 1, 0, 0, 1, 1,
0.2388197, -1.064482, 1.750227, 1, 0, 0, 1, 1,
0.2395048, 0.6171352, -0.7225941, 1, 0, 0, 1, 1,
0.2395415, -0.3695199, 3.710928, 1, 0, 0, 1, 1,
0.2437519, -1.644269, 2.641209, 0, 0, 0, 1, 1,
0.2444257, -1.643552, 2.247202, 0, 0, 0, 1, 1,
0.2467722, -0.8889229, 3.269206, 0, 0, 0, 1, 1,
0.2488298, -1.125557, 1.221815, 0, 0, 0, 1, 1,
0.2507295, -0.04248909, 1.753871, 0, 0, 0, 1, 1,
0.2554466, 0.06764143, 0.2974005, 0, 0, 0, 1, 1,
0.2559947, -0.5655915, 2.227665, 0, 0, 0, 1, 1,
0.2573903, 0.2925498, 2.088869, 1, 1, 1, 1, 1,
0.2581291, 1.508873, -0.2998905, 1, 1, 1, 1, 1,
0.2585601, 0.5216324, 1.225873, 1, 1, 1, 1, 1,
0.2685659, -1.861412, 3.741035, 1, 1, 1, 1, 1,
0.2692895, -0.4350618, 2.321535, 1, 1, 1, 1, 1,
0.2713668, -0.355573, 2.630429, 1, 1, 1, 1, 1,
0.2734725, 0.3154585, 1.352796, 1, 1, 1, 1, 1,
0.2760206, 0.5210636, -0.786773, 1, 1, 1, 1, 1,
0.2801364, -0.374692, 2.168894, 1, 1, 1, 1, 1,
0.2839331, -1.469159, 4.340277, 1, 1, 1, 1, 1,
0.284435, -0.653316, 4.560639, 1, 1, 1, 1, 1,
0.2861195, 0.03119316, 1.95204, 1, 1, 1, 1, 1,
0.289453, 2.639278, 0.02266228, 1, 1, 1, 1, 1,
0.2915136, 1.003678, -1.229524, 1, 1, 1, 1, 1,
0.2921261, 0.4895436, 2.043581, 1, 1, 1, 1, 1,
0.2944548, 0.5186951, -1.109908, 0, 0, 1, 1, 1,
0.2944754, 0.2023284, 1.084678, 1, 0, 0, 1, 1,
0.2977167, 0.405488, 0.1834448, 1, 0, 0, 1, 1,
0.2981118, 0.003160686, 1.473891, 1, 0, 0, 1, 1,
0.300111, 0.6292511, 1.146738, 1, 0, 0, 1, 1,
0.3026657, -1.218277, 3.182561, 1, 0, 0, 1, 1,
0.3044234, -0.6880679, 4.737444, 0, 0, 0, 1, 1,
0.3044719, -0.4546511, 2.251821, 0, 0, 0, 1, 1,
0.3051319, -0.3297507, 1.975344, 0, 0, 0, 1, 1,
0.3055207, -1.756246, 2.746605, 0, 0, 0, 1, 1,
0.3143978, 0.3967055, 1.868979, 0, 0, 0, 1, 1,
0.3190051, 1.135077, -0.802865, 0, 0, 0, 1, 1,
0.3247286, 0.7324762, 0.454069, 0, 0, 0, 1, 1,
0.331293, -1.309791, 4.151457, 1, 1, 1, 1, 1,
0.3317536, 1.468846, 0.3622618, 1, 1, 1, 1, 1,
0.3428535, -0.6094368, 1.731076, 1, 1, 1, 1, 1,
0.3441883, 0.2632041, 1.147421, 1, 1, 1, 1, 1,
0.3477136, 0.417671, -1.024218, 1, 1, 1, 1, 1,
0.3498605, 0.01977886, 1.443625, 1, 1, 1, 1, 1,
0.3563594, -0.01618754, 1.001778, 1, 1, 1, 1, 1,
0.3591357, 0.3575419, 2.329863, 1, 1, 1, 1, 1,
0.3619432, -1.598302, 3.287561, 1, 1, 1, 1, 1,
0.362244, 1.162704, 0.21609, 1, 1, 1, 1, 1,
0.3675555, 0.09289678, 2.548612, 1, 1, 1, 1, 1,
0.3689718, 0.1732809, 0.5541579, 1, 1, 1, 1, 1,
0.3728047, 0.2264341, 0.6898522, 1, 1, 1, 1, 1,
0.3740449, 0.8799418, 1.622838, 1, 1, 1, 1, 1,
0.3751087, -1.995719, 3.488836, 1, 1, 1, 1, 1,
0.3752622, 0.4436831, 0.2367931, 0, 0, 1, 1, 1,
0.3764466, -1.330706, 2.290066, 1, 0, 0, 1, 1,
0.379204, 1.72126, 0.1847858, 1, 0, 0, 1, 1,
0.3816159, -0.2505284, -0.08085605, 1, 0, 0, 1, 1,
0.3877228, 0.647427, 0.8793496, 1, 0, 0, 1, 1,
0.392198, 0.9259291, 1.427652, 1, 0, 0, 1, 1,
0.3923486, -1.006822, 2.376239, 0, 0, 0, 1, 1,
0.3981435, 1.591536, 0.4905183, 0, 0, 0, 1, 1,
0.3988114, 0.5974117, 1.306617, 0, 0, 0, 1, 1,
0.4039455, 1.065043, 0.7309915, 0, 0, 0, 1, 1,
0.4043264, 0.6303315, 1.213506, 0, 0, 0, 1, 1,
0.4120994, -1.350433, 2.72981, 0, 0, 0, 1, 1,
0.4126758, -0.4666615, 1.755976, 0, 0, 0, 1, 1,
0.4148464, -0.6527502, 1.938645, 1, 1, 1, 1, 1,
0.4149353, 2.058001, -0.1392061, 1, 1, 1, 1, 1,
0.4152102, 0.8314188, -0.003676138, 1, 1, 1, 1, 1,
0.4156074, -0.206046, 1.703893, 1, 1, 1, 1, 1,
0.4174567, 1.445861, -0.6967899, 1, 1, 1, 1, 1,
0.4202489, -0.02743033, 2.988394, 1, 1, 1, 1, 1,
0.4292697, -0.3442524, 1.536344, 1, 1, 1, 1, 1,
0.4300007, 1.327818, 1.036121, 1, 1, 1, 1, 1,
0.4342227, 1.077187, -0.2835674, 1, 1, 1, 1, 1,
0.4375463, -0.4526299, 1.678504, 1, 1, 1, 1, 1,
0.4434098, -0.9522026, 3.714139, 1, 1, 1, 1, 1,
0.4448173, 0.4789811, 2.875331, 1, 1, 1, 1, 1,
0.4460466, 1.348234, 1.151764, 1, 1, 1, 1, 1,
0.4477538, 0.3286113, 2.539977, 1, 1, 1, 1, 1,
0.4495704, 0.3567081, 2.226033, 1, 1, 1, 1, 1,
0.4528132, -1.196578, 2.558598, 0, 0, 1, 1, 1,
0.4563505, 0.3158616, 1.650828, 1, 0, 0, 1, 1,
0.4566459, -1.12175, 1.312923, 1, 0, 0, 1, 1,
0.4631602, 0.644926, 0.200667, 1, 0, 0, 1, 1,
0.4642546, 0.4277996, -0.1178191, 1, 0, 0, 1, 1,
0.4655724, 0.9925479, -0.6859289, 1, 0, 0, 1, 1,
0.4658231, -2.062357, 2.731725, 0, 0, 0, 1, 1,
0.473128, 1.548706, 0.8703917, 0, 0, 0, 1, 1,
0.4734302, 0.4735481, 1.638908, 0, 0, 0, 1, 1,
0.4813533, -0.9439156, 0.54102, 0, 0, 0, 1, 1,
0.4822942, -0.04691319, 2.253689, 0, 0, 0, 1, 1,
0.4852246, -0.2454767, 2.441689, 0, 0, 0, 1, 1,
0.4873637, 1.082293, 1.323502, 0, 0, 0, 1, 1,
0.4875885, 0.9961963, 0.8721957, 1, 1, 1, 1, 1,
0.4904382, 0.9603971, 1.483614, 1, 1, 1, 1, 1,
0.4931223, 1.997709, 0.1879722, 1, 1, 1, 1, 1,
0.495417, 0.5708768, 1.616084, 1, 1, 1, 1, 1,
0.4967317, 1.831795, 0.1204887, 1, 1, 1, 1, 1,
0.5009472, -1.594512, 2.642351, 1, 1, 1, 1, 1,
0.5041711, 0.8095919, 0.6551964, 1, 1, 1, 1, 1,
0.5113057, 1.245433, 0.3962289, 1, 1, 1, 1, 1,
0.5135695, -1.210587, 2.364698, 1, 1, 1, 1, 1,
0.5138615, -0.8389462, 2.592268, 1, 1, 1, 1, 1,
0.5155284, 0.8387203, -0.5467291, 1, 1, 1, 1, 1,
0.5208657, 1.488223, 0.99602, 1, 1, 1, 1, 1,
0.525699, -0.210773, 2.027959, 1, 1, 1, 1, 1,
0.5298259, 1.537662, 1.931158, 1, 1, 1, 1, 1,
0.5359091, -0.921176, 3.903687, 1, 1, 1, 1, 1,
0.5370722, 0.1079818, 2.348833, 0, 0, 1, 1, 1,
0.5375898, 2.231368, -0.2497325, 1, 0, 0, 1, 1,
0.5380623, 0.2713341, 0.3655708, 1, 0, 0, 1, 1,
0.5454633, 1.557626, 0.7935394, 1, 0, 0, 1, 1,
0.5463534, 0.7315388, -1.427651, 1, 0, 0, 1, 1,
0.5476217, -1.826366, 2.452135, 1, 0, 0, 1, 1,
0.547786, -0.0542698, 0.5295676, 0, 0, 0, 1, 1,
0.5498364, 0.2999046, 1.669896, 0, 0, 0, 1, 1,
0.5519388, -1.571393, 2.315601, 0, 0, 0, 1, 1,
0.5534886, 0.2069424, 0.6848121, 0, 0, 0, 1, 1,
0.5536445, 0.6859482, 0.9874296, 0, 0, 0, 1, 1,
0.5580688, 0.3428848, 1.256817, 0, 0, 0, 1, 1,
0.5603133, -0.397934, 2.116023, 0, 0, 0, 1, 1,
0.5616012, 0.7509878, -0.382273, 1, 1, 1, 1, 1,
0.5618523, -0.1316612, 4.645215, 1, 1, 1, 1, 1,
0.5622082, 0.6557186, 0.1863867, 1, 1, 1, 1, 1,
0.5662321, -0.6249456, 2.006261, 1, 1, 1, 1, 1,
0.5675705, 0.1011432, 1.239983, 1, 1, 1, 1, 1,
0.5679694, -0.9231105, 2.950666, 1, 1, 1, 1, 1,
0.569197, -0.8146462, 2.851562, 1, 1, 1, 1, 1,
0.5701204, 1.077484, 0.5025695, 1, 1, 1, 1, 1,
0.5708172, -0.3085967, 3.461942, 1, 1, 1, 1, 1,
0.5732773, -0.8709329, 2.820852, 1, 1, 1, 1, 1,
0.5795987, 0.5812988, 2.01459, 1, 1, 1, 1, 1,
0.5796241, 0.207179, 0.6275042, 1, 1, 1, 1, 1,
0.5873086, -0.737272, 1.381545, 1, 1, 1, 1, 1,
0.5879014, 0.4993507, -0.9033509, 1, 1, 1, 1, 1,
0.5901518, 0.4708863, 1.398155, 1, 1, 1, 1, 1,
0.5910711, -0.5972216, 3.490482, 0, 0, 1, 1, 1,
0.5930336, -0.1230849, 1.453951, 1, 0, 0, 1, 1,
0.596199, 1.03689, 0.08448151, 1, 0, 0, 1, 1,
0.5970786, -0.8539838, 0.565302, 1, 0, 0, 1, 1,
0.5980831, 1.528327, 1.484285, 1, 0, 0, 1, 1,
0.6000999, 0.2805529, 1.789185, 1, 0, 0, 1, 1,
0.6049238, 0.1495199, 0.4346599, 0, 0, 0, 1, 1,
0.6087117, -0.7246644, 2.290503, 0, 0, 0, 1, 1,
0.6167787, -0.7257506, 1.708263, 0, 0, 0, 1, 1,
0.62643, -0.2660895, 2.387124, 0, 0, 0, 1, 1,
0.6288922, 0.8061431, -0.4267777, 0, 0, 0, 1, 1,
0.6321504, 0.4061746, 2.689067, 0, 0, 0, 1, 1,
0.6336006, 0.6541923, 2.439003, 0, 0, 0, 1, 1,
0.6348214, -1.01565, 3.837096, 1, 1, 1, 1, 1,
0.6361563, -0.6941981, 2.204982, 1, 1, 1, 1, 1,
0.6380372, 0.9015986, 1.524605, 1, 1, 1, 1, 1,
0.6497204, 0.7039943, 2.191844, 1, 1, 1, 1, 1,
0.6538121, -0.9409644, 2.394293, 1, 1, 1, 1, 1,
0.6603711, -0.1715295, 0.2091153, 1, 1, 1, 1, 1,
0.6641635, 1.50041, 0.5406894, 1, 1, 1, 1, 1,
0.6652647, 1.632236, -0.8715675, 1, 1, 1, 1, 1,
0.6673709, 0.1657563, 0.7601162, 1, 1, 1, 1, 1,
0.6688568, 1.056748, 1.46554, 1, 1, 1, 1, 1,
0.6824624, -1.063949, 2.35921, 1, 1, 1, 1, 1,
0.6877882, 0.4252221, 1.377165, 1, 1, 1, 1, 1,
0.6889191, 0.005060295, 0.6961295, 1, 1, 1, 1, 1,
0.6890343, 0.2375968, -0.621755, 1, 1, 1, 1, 1,
0.6921362, -0.4679446, 1.397342, 1, 1, 1, 1, 1,
0.6967514, 1.854997, 0.1678268, 0, 0, 1, 1, 1,
0.6999555, 1.022674, 1.621891, 1, 0, 0, 1, 1,
0.7029748, -1.655291, 3.940329, 1, 0, 0, 1, 1,
0.7031799, 2.301279, 2.701489, 1, 0, 0, 1, 1,
0.7036707, -0.5231041, 1.872341, 1, 0, 0, 1, 1,
0.7101293, -0.8034769, 1.624254, 1, 0, 0, 1, 1,
0.7201398, -0.02054574, 2.097126, 0, 0, 0, 1, 1,
0.7294819, -0.5432685, 1.741741, 0, 0, 0, 1, 1,
0.7386273, 0.5689598, 0.532683, 0, 0, 0, 1, 1,
0.7388712, 0.6119969, 0.2226831, 0, 0, 0, 1, 1,
0.7625818, -0.1295009, 2.462212, 0, 0, 0, 1, 1,
0.7657946, -0.2557526, 2.060663, 0, 0, 0, 1, 1,
0.7664236, -0.7979585, 3.488796, 0, 0, 0, 1, 1,
0.7664519, -3.103271, 4.213683, 1, 1, 1, 1, 1,
0.7759706, 1.21195, -0.4246733, 1, 1, 1, 1, 1,
0.7775555, -0.4969098, 1.59341, 1, 1, 1, 1, 1,
0.7781062, -1.674371, -0.7888362, 1, 1, 1, 1, 1,
0.7801051, -1.001288, 3.240839, 1, 1, 1, 1, 1,
0.7812786, -0.9329923, 1.938015, 1, 1, 1, 1, 1,
0.7828624, -0.8177289, 2.706858, 1, 1, 1, 1, 1,
0.783743, 0.883504, -0.4190735, 1, 1, 1, 1, 1,
0.7893382, 0.8499845, 2.209543, 1, 1, 1, 1, 1,
0.7902141, 1.478593, -0.2195386, 1, 1, 1, 1, 1,
0.8073377, -0.676347, 1.614858, 1, 1, 1, 1, 1,
0.8114317, 0.04890304, 0.7512181, 1, 1, 1, 1, 1,
0.8146275, 0.2441287, 0.4902036, 1, 1, 1, 1, 1,
0.8182632, 0.05987293, 3.251571, 1, 1, 1, 1, 1,
0.8299798, -2.688892, 1.861851, 1, 1, 1, 1, 1,
0.8325243, 2.154186, 0.2561031, 0, 0, 1, 1, 1,
0.8347279, -1.756563, 2.982455, 1, 0, 0, 1, 1,
0.8380281, -0.1693246, 0.1994063, 1, 0, 0, 1, 1,
0.8455771, 1.549224, -1.24053, 1, 0, 0, 1, 1,
0.8456227, -0.6469118, 3.139042, 1, 0, 0, 1, 1,
0.8511078, -0.2549735, 0.087842, 1, 0, 0, 1, 1,
0.8522574, 0.5486138, -0.7383603, 0, 0, 0, 1, 1,
0.8555212, -0.5221983, 3.288478, 0, 0, 0, 1, 1,
0.8576826, 1.299093, 0.4499283, 0, 0, 0, 1, 1,
0.8636522, -0.07444577, 1.849089, 0, 0, 0, 1, 1,
0.8642626, -0.7031832, 1.40042, 0, 0, 0, 1, 1,
0.8647757, 1.879048, 0.749774, 0, 0, 0, 1, 1,
0.8669605, 0.2239502, 1.428503, 0, 0, 0, 1, 1,
0.868868, -0.131036, 1.697568, 1, 1, 1, 1, 1,
0.8721513, 2.072366, 0.142207, 1, 1, 1, 1, 1,
0.8727248, -0.1264218, 2.759148, 1, 1, 1, 1, 1,
0.8732871, -1.560915, 2.493302, 1, 1, 1, 1, 1,
0.8735783, 0.161203, 1.019478, 1, 1, 1, 1, 1,
0.8754227, -2.153635, 2.215908, 1, 1, 1, 1, 1,
0.8761764, 0.2905767, 1.248184, 1, 1, 1, 1, 1,
0.8786397, 0.02323822, -0.4209165, 1, 1, 1, 1, 1,
0.8799171, 0.3399972, 2.384665, 1, 1, 1, 1, 1,
0.8806857, 0.9265798, 1.398281, 1, 1, 1, 1, 1,
0.8860314, 1.289621, 1.326553, 1, 1, 1, 1, 1,
0.8922926, -0.05508576, 1.709557, 1, 1, 1, 1, 1,
0.8924436, 0.9965547, 1.181975, 1, 1, 1, 1, 1,
0.8955688, -1.044858, 0.5080934, 1, 1, 1, 1, 1,
0.896082, 0.7463827, 2.143865, 1, 1, 1, 1, 1,
0.902429, -0.5955, 3.200188, 0, 0, 1, 1, 1,
0.911398, -2.535267, 2.332113, 1, 0, 0, 1, 1,
0.9123204, 0.7479739, 2.029852, 1, 0, 0, 1, 1,
0.9134835, -1.191366, 2.890713, 1, 0, 0, 1, 1,
0.9233769, -0.6130914, 2.477911, 1, 0, 0, 1, 1,
0.9278579, -0.571139, 2.907674, 1, 0, 0, 1, 1,
0.9293762, -0.07828561, 2.718237, 0, 0, 0, 1, 1,
0.932187, -0.00608691, 0.7818229, 0, 0, 0, 1, 1,
0.9438453, 1.175626, 0.6846635, 0, 0, 0, 1, 1,
0.9457003, -2.021406, 1.279884, 0, 0, 0, 1, 1,
0.9497131, -2.515738, 0.8536389, 0, 0, 0, 1, 1,
0.9540707, 0.01237479, 2.001289, 0, 0, 0, 1, 1,
0.9544774, 2.00207, -0.811661, 0, 0, 0, 1, 1,
0.9556723, 0.5906136, 2.418105, 1, 1, 1, 1, 1,
0.9572622, 0.03898872, 1.517217, 1, 1, 1, 1, 1,
0.957365, 2.196775, -0.07111154, 1, 1, 1, 1, 1,
0.9574409, -0.1172981, 3.02389, 1, 1, 1, 1, 1,
0.9589022, -0.3669811, 1.32601, 1, 1, 1, 1, 1,
0.9615763, -1.996988, 4.407729, 1, 1, 1, 1, 1,
0.9632501, -0.1100591, 1.595534, 1, 1, 1, 1, 1,
0.9632794, -1.1008, 2.268923, 1, 1, 1, 1, 1,
0.9657498, -1.109638, 2.773082, 1, 1, 1, 1, 1,
0.9665416, -0.5551263, 2.979861, 1, 1, 1, 1, 1,
0.9666255, -0.2515337, 2.051296, 1, 1, 1, 1, 1,
0.9838697, -0.1297526, 0.6287697, 1, 1, 1, 1, 1,
0.9882154, -0.4139602, 2.606107, 1, 1, 1, 1, 1,
0.9883946, 1.470639, 1.471251, 1, 1, 1, 1, 1,
0.9887491, 1.503682, 2.446873, 1, 1, 1, 1, 1,
0.9947987, 1.066275, 0.03856602, 0, 0, 1, 1, 1,
0.994903, 2.34118, -0.3439659, 1, 0, 0, 1, 1,
0.9958016, 0.3315521, 1.119313, 1, 0, 0, 1, 1,
1.00266, 0.4586426, 0.1502778, 1, 0, 0, 1, 1,
1.004963, -0.8957977, 2.161045, 1, 0, 0, 1, 1,
1.005383, 0.9975923, 2.539084, 1, 0, 0, 1, 1,
1.011821, 0.3538451, -0.2031087, 0, 0, 0, 1, 1,
1.014458, 0.7127933, 0.1963784, 0, 0, 0, 1, 1,
1.022482, -0.216735, 0.9966014, 0, 0, 0, 1, 1,
1.037199, 0.492084, 1.404293, 0, 0, 0, 1, 1,
1.037669, 1.4947, 0.2189605, 0, 0, 0, 1, 1,
1.039574, 0.3166073, -0.2597157, 0, 0, 0, 1, 1,
1.041903, 0.5046906, 1.55259, 0, 0, 0, 1, 1,
1.042736, -3.031781, 2.529409, 1, 1, 1, 1, 1,
1.047499, 1.569119, 1.041907, 1, 1, 1, 1, 1,
1.05577, -0.4204012, 2.932487, 1, 1, 1, 1, 1,
1.056596, 0.05951564, 1.764955, 1, 1, 1, 1, 1,
1.057311, 0.3867103, 0.5532108, 1, 1, 1, 1, 1,
1.058448, -0.8075196, 3.394512, 1, 1, 1, 1, 1,
1.069397, -0.2763177, 0.5459515, 1, 1, 1, 1, 1,
1.080437, 1.671871, -0.1262523, 1, 1, 1, 1, 1,
1.084845, 0.07858767, 1.002193, 1, 1, 1, 1, 1,
1.093927, 0.06847888, -0.9203056, 1, 1, 1, 1, 1,
1.104786, -0.02425617, 1.100263, 1, 1, 1, 1, 1,
1.114346, 1.341774, 0.5979132, 1, 1, 1, 1, 1,
1.115513, -0.5869848, 1.686875, 1, 1, 1, 1, 1,
1.116648, -0.4673374, 2.676048, 1, 1, 1, 1, 1,
1.121144, -0.7991449, 0.6004375, 1, 1, 1, 1, 1,
1.131706, -0.9551289, 1.445622, 0, 0, 1, 1, 1,
1.134343, 1.676883, 1.177781, 1, 0, 0, 1, 1,
1.139475, 0.0951977, 2.736565, 1, 0, 0, 1, 1,
1.149166, -0.8336057, 1.324323, 1, 0, 0, 1, 1,
1.149388, 0.3305131, 2.06404, 1, 0, 0, 1, 1,
1.1496, 2.262257, -1.876392, 1, 0, 0, 1, 1,
1.154302, -1.662199, 0.8508851, 0, 0, 0, 1, 1,
1.158543, 1.073303, 0.6882263, 0, 0, 0, 1, 1,
1.162864, 0.102286, -0.498585, 0, 0, 0, 1, 1,
1.16505, 1.252782, -0.08699132, 0, 0, 0, 1, 1,
1.174595, -0.1185055, 1.014286, 0, 0, 0, 1, 1,
1.181292, 0.455418, 0.2757837, 0, 0, 0, 1, 1,
1.186364, 0.263469, -0.1784916, 0, 0, 0, 1, 1,
1.192027, -0.1671951, 0.4750764, 1, 1, 1, 1, 1,
1.194187, 0.08490908, -0.05220125, 1, 1, 1, 1, 1,
1.196889, 0.01138071, 3.202577, 1, 1, 1, 1, 1,
1.202699, -0.6790526, 2.247201, 1, 1, 1, 1, 1,
1.203005, 0.2228872, 2.31216, 1, 1, 1, 1, 1,
1.203081, -2.36498, 3.407596, 1, 1, 1, 1, 1,
1.206115, 0.2901582, 2.559411, 1, 1, 1, 1, 1,
1.207646, -0.7723822, 2.524143, 1, 1, 1, 1, 1,
1.211011, 0.2091847, 3.710856, 1, 1, 1, 1, 1,
1.214991, -0.1662316, 1.938664, 1, 1, 1, 1, 1,
1.219633, 0.7603232, 1.287995, 1, 1, 1, 1, 1,
1.22449, -0.6110921, 0.7291767, 1, 1, 1, 1, 1,
1.231544, 1.515211, 0.1046071, 1, 1, 1, 1, 1,
1.235069, 1.388551, 0.5615874, 1, 1, 1, 1, 1,
1.238883, 0.6914868, -1.1426, 1, 1, 1, 1, 1,
1.239541, -0.8031554, -0.477832, 0, 0, 1, 1, 1,
1.24645, 1.174393, 1.933519, 1, 0, 0, 1, 1,
1.2484, -0.8491888, 1.902489, 1, 0, 0, 1, 1,
1.250844, 0.8776226, -0.033892, 1, 0, 0, 1, 1,
1.262142, 1.120642, 0.4712795, 1, 0, 0, 1, 1,
1.264895, 0.8047435, -0.4833729, 1, 0, 0, 1, 1,
1.266772, 0.653254, 1.683568, 0, 0, 0, 1, 1,
1.269291, -0.265285, 1.323855, 0, 0, 0, 1, 1,
1.269945, 0.1553043, 0.9669273, 0, 0, 0, 1, 1,
1.279761, -0.04913044, 0.9889551, 0, 0, 0, 1, 1,
1.280387, -0.8684103, 2.568722, 0, 0, 0, 1, 1,
1.283683, 0.08571149, 3.622078, 0, 0, 0, 1, 1,
1.295151, 0.3077036, 0.6439229, 0, 0, 0, 1, 1,
1.298239, -0.3729171, 2.873958, 1, 1, 1, 1, 1,
1.299223, 0.1045282, 2.080192, 1, 1, 1, 1, 1,
1.316377, 1.26824, 2.987266, 1, 1, 1, 1, 1,
1.320845, -0.8485534, 2.452613, 1, 1, 1, 1, 1,
1.342307, -1.344281, 3.096215, 1, 1, 1, 1, 1,
1.343307, 1.271751, 1.219152, 1, 1, 1, 1, 1,
1.348895, 0.7001204, 1.412891, 1, 1, 1, 1, 1,
1.351733, -1.79006, 2.38928, 1, 1, 1, 1, 1,
1.357658, -0.2406918, 2.332643, 1, 1, 1, 1, 1,
1.361225, 0.8534178, -0.4390225, 1, 1, 1, 1, 1,
1.365315, 0.6111178, 0.183753, 1, 1, 1, 1, 1,
1.368656, -0.5689169, 1.944377, 1, 1, 1, 1, 1,
1.369799, 0.6855644, 2.918893, 1, 1, 1, 1, 1,
1.370783, 0.7722397, 0.770219, 1, 1, 1, 1, 1,
1.3746, -2.526323, 0.5841296, 1, 1, 1, 1, 1,
1.381448, 1.024525, 2.18907, 0, 0, 1, 1, 1,
1.389287, -0.02473222, 1.051764, 1, 0, 0, 1, 1,
1.40907, 0.578701, 0.642952, 1, 0, 0, 1, 1,
1.419806, 0.126155, 1.488824, 1, 0, 0, 1, 1,
1.425312, 0.2364627, 0.1176158, 1, 0, 0, 1, 1,
1.428165, -0.09608638, 1.698188, 1, 0, 0, 1, 1,
1.436045, -1.032295, 1.793242, 0, 0, 0, 1, 1,
1.462005, -0.988318, 3.317043, 0, 0, 0, 1, 1,
1.470016, 0.5392671, 1.872418, 0, 0, 0, 1, 1,
1.472665, -3.017264, 2.010867, 0, 0, 0, 1, 1,
1.474957, -0.0349307, 0.9131833, 0, 0, 0, 1, 1,
1.479763, -1.047601, 4.01012, 0, 0, 0, 1, 1,
1.49027, -0.8911217, 1.672808, 0, 0, 0, 1, 1,
1.495273, 1.1364, 0.9845443, 1, 1, 1, 1, 1,
1.499833, -0.8268296, 3.878215, 1, 1, 1, 1, 1,
1.505889, -1.418374, 0.4564711, 1, 1, 1, 1, 1,
1.509648, 1.177482, -1.384723, 1, 1, 1, 1, 1,
1.51929, -0.4407321, 0.02929795, 1, 1, 1, 1, 1,
1.52846, 0.7963193, 1.571406, 1, 1, 1, 1, 1,
1.542228, 0.08568497, -0.7793762, 1, 1, 1, 1, 1,
1.558418, -1.796111, 2.271139, 1, 1, 1, 1, 1,
1.561488, -0.104601, 0.9094773, 1, 1, 1, 1, 1,
1.566245, -1.352312, 2.206131, 1, 1, 1, 1, 1,
1.579024, 1.062052, -0.2934386, 1, 1, 1, 1, 1,
1.581766, 1.939862, 0.6122867, 1, 1, 1, 1, 1,
1.588222, -0.07839777, 1.645514, 1, 1, 1, 1, 1,
1.591899, -1.793515, 3.812677, 1, 1, 1, 1, 1,
1.592106, -1.022206, 1.464923, 1, 1, 1, 1, 1,
1.610465, -0.5250944, 1.376463, 0, 0, 1, 1, 1,
1.611303, -0.5814932, 2.330801, 1, 0, 0, 1, 1,
1.619282, 0.3147223, 0.4765429, 1, 0, 0, 1, 1,
1.619634, 0.7952632, -0.001551978, 1, 0, 0, 1, 1,
1.628972, -0.8676555, 2.169274, 1, 0, 0, 1, 1,
1.646243, 0.08612697, 0.9909629, 1, 0, 0, 1, 1,
1.659572, 0.01032015, 3.053893, 0, 0, 0, 1, 1,
1.66244, -0.05611328, 1.522896, 0, 0, 0, 1, 1,
1.671241, -0.3951422, 1.741284, 0, 0, 0, 1, 1,
1.67251, 0.1145072, 1.229989, 0, 0, 0, 1, 1,
1.676085, 0.7741505, 1.227432, 0, 0, 0, 1, 1,
1.677065, -0.3024704, 3.511327, 0, 0, 0, 1, 1,
1.735633, 0.04076595, 1.66813, 0, 0, 0, 1, 1,
1.780007, 0.4689325, 1.791305, 1, 1, 1, 1, 1,
1.794375, 0.6108593, 2.772663, 1, 1, 1, 1, 1,
1.803141, -0.3448072, 0.7959735, 1, 1, 1, 1, 1,
1.810495, -2.226651, 1.023241, 1, 1, 1, 1, 1,
1.8112, -0.3558633, 1.877066, 1, 1, 1, 1, 1,
1.819633, -2.289791, 2.893281, 1, 1, 1, 1, 1,
1.877779, 1.036802, -0.9784715, 1, 1, 1, 1, 1,
1.884355, -0.05240884, 0.3887255, 1, 1, 1, 1, 1,
1.906383, -0.9516476, 3.008504, 1, 1, 1, 1, 1,
1.928291, -1.6539, 3.677528, 1, 1, 1, 1, 1,
1.953579, 1.527793, 1.270089, 1, 1, 1, 1, 1,
1.97019, -0.1435134, 1.711961, 1, 1, 1, 1, 1,
2.022686, -0.5720815, 2.385776, 1, 1, 1, 1, 1,
2.027739, 0.02591692, -0.2070502, 1, 1, 1, 1, 1,
2.030257, -0.6931139, 1.152879, 1, 1, 1, 1, 1,
2.030975, 0.192773, -0.1475073, 0, 0, 1, 1, 1,
2.043555, 0.4835159, 2.938933, 1, 0, 0, 1, 1,
2.07299, -0.7391654, 1.457287, 1, 0, 0, 1, 1,
2.115872, 2.070355, 0.5852475, 1, 0, 0, 1, 1,
2.152515, -0.07523144, 2.303652, 1, 0, 0, 1, 1,
2.177868, 0.111635, 1.436533, 1, 0, 0, 1, 1,
2.201409, -0.08324903, 1.036563, 0, 0, 0, 1, 1,
2.214907, 0.4653214, 0.379159, 0, 0, 0, 1, 1,
2.235504, -0.1963739, 2.119341, 0, 0, 0, 1, 1,
2.302642, 0.8102167, 1.401052, 0, 0, 0, 1, 1,
2.313497, 1.385859, 1.165221, 0, 0, 0, 1, 1,
2.320857, -1.220126, 0.6139114, 0, 0, 0, 1, 1,
2.413813, -1.294626, 1.059964, 0, 0, 0, 1, 1,
2.464307, 0.8912264, -0.2359268, 1, 1, 1, 1, 1,
2.527812, 1.006426, 1.773754, 1, 1, 1, 1, 1,
2.590964, 3.407552, -0.08927328, 1, 1, 1, 1, 1,
2.765185, -2.024702, 2.175442, 1, 1, 1, 1, 1,
3.193893, 2.788297, 0.5833613, 1, 1, 1, 1, 1,
3.282987, 1.27427, 1.268982, 1, 1, 1, 1, 1,
3.446927, 1.734786, 1.856146, 1, 1, 1, 1, 1
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
var radius = 10.37136;
var distance = 36.42895;
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
mvMatrix.translate( 0.2819133, -0.6420434, 0.04702854 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.42895);
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