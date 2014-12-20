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
-3.413291, -1.991016, -2.555044, 1, 0, 0, 1,
-3.252448, 2.265224, -0.5105068, 1, 0.007843138, 0, 1,
-2.843843, -0.09428636, -1.576035, 1, 0.01176471, 0, 1,
-2.632765, -0.182487, -0.5913793, 1, 0.01960784, 0, 1,
-2.589067, -0.03109703, -1.272759, 1, 0.02352941, 0, 1,
-2.491928, -0.8346156, -0.9184483, 1, 0.03137255, 0, 1,
-2.423883, 1.212291, -1.224788, 1, 0.03529412, 0, 1,
-2.38783, 0.3371295, -2.233829, 1, 0.04313726, 0, 1,
-2.344071, -0.9815825, -2.11643, 1, 0.04705882, 0, 1,
-2.337545, 0.6483107, -1.050409, 1, 0.05490196, 0, 1,
-2.336222, -1.491561, -2.684922, 1, 0.05882353, 0, 1,
-2.298151, 0.05675332, -1.306593, 1, 0.06666667, 0, 1,
-2.258634, -0.1059649, -0.2032179, 1, 0.07058824, 0, 1,
-2.249988, -0.421553, -1.929929, 1, 0.07843138, 0, 1,
-2.15856, -0.271738, -1.625837, 1, 0.08235294, 0, 1,
-2.158163, -1.33375, -2.662432, 1, 0.09019608, 0, 1,
-2.138956, 1.753757, 0.2162815, 1, 0.09411765, 0, 1,
-2.133668, 0.392249, -2.626589, 1, 0.1019608, 0, 1,
-2.100976, -0.02118339, -2.279506, 1, 0.1098039, 0, 1,
-2.094884, 0.5787261, 0.265313, 1, 0.1137255, 0, 1,
-2.047781, -2.729141, -2.521586, 1, 0.1215686, 0, 1,
-2.021223, 0.8831418, -1.298361, 1, 0.1254902, 0, 1,
-2.003618, -0.752933, -1.599476, 1, 0.1333333, 0, 1,
-2.002645, 0.07917547, -2.633011, 1, 0.1372549, 0, 1,
-1.991205, 0.1928791, -2.075465, 1, 0.145098, 0, 1,
-1.953758, 1.629537, -2.352249, 1, 0.1490196, 0, 1,
-1.951494, 0.2243679, -1.836151, 1, 0.1568628, 0, 1,
-1.950281, 0.2369708, -0.4380629, 1, 0.1607843, 0, 1,
-1.901962, -1.486062, -1.840158, 1, 0.1686275, 0, 1,
-1.879405, 0.3461608, -1.292125, 1, 0.172549, 0, 1,
-1.879084, -0.7250234, -2.699272, 1, 0.1803922, 0, 1,
-1.869485, -1.157145, -2.781215, 1, 0.1843137, 0, 1,
-1.852712, 0.5698868, -0.771548, 1, 0.1921569, 0, 1,
-1.848539, -0.8017038, -2.277335, 1, 0.1960784, 0, 1,
-1.844023, 0.02871326, -0.7235504, 1, 0.2039216, 0, 1,
-1.806723, -0.2514568, -1.939718, 1, 0.2117647, 0, 1,
-1.800581, 0.4543017, -1.034218, 1, 0.2156863, 0, 1,
-1.780592, -1.887408, -4.398642, 1, 0.2235294, 0, 1,
-1.767164, 0.9340199, -0.4476033, 1, 0.227451, 0, 1,
-1.766647, -0.5544258, -1.76028, 1, 0.2352941, 0, 1,
-1.75077, -0.6148578, -3.88241, 1, 0.2392157, 0, 1,
-1.7463, 0.7300757, -1.302739, 1, 0.2470588, 0, 1,
-1.739445, 0.8392543, 0.5043876, 1, 0.2509804, 0, 1,
-1.732426, -0.4101329, -0.9061368, 1, 0.2588235, 0, 1,
-1.722022, -1.088666, -3.683359, 1, 0.2627451, 0, 1,
-1.680398, 0.4826794, -1.920691, 1, 0.2705882, 0, 1,
-1.67995, -1.741766, -3.721816, 1, 0.2745098, 0, 1,
-1.631031, 0.6116493, 0.5958204, 1, 0.282353, 0, 1,
-1.612805, 0.07148504, 0.1446097, 1, 0.2862745, 0, 1,
-1.611913, -0.527412, -2.419197, 1, 0.2941177, 0, 1,
-1.609501, -1.159364, -1.820127, 1, 0.3019608, 0, 1,
-1.602001, -0.5283296, -2.378011, 1, 0.3058824, 0, 1,
-1.601421, -0.03757634, -2.573043, 1, 0.3137255, 0, 1,
-1.598771, 0.524736, -0.2634895, 1, 0.3176471, 0, 1,
-1.587353, -0.1012958, -4.227289, 1, 0.3254902, 0, 1,
-1.584169, -0.9078218, -1.145401, 1, 0.3294118, 0, 1,
-1.577752, 1.887852, -0.1865109, 1, 0.3372549, 0, 1,
-1.559573, -0.846912, -1.638533, 1, 0.3411765, 0, 1,
-1.554448, 1.038112, -0.906312, 1, 0.3490196, 0, 1,
-1.552021, 1.933454, 0.5035266, 1, 0.3529412, 0, 1,
-1.55167, 0.194796, -1.896912, 1, 0.3607843, 0, 1,
-1.544686, 1.183906, -1.984459, 1, 0.3647059, 0, 1,
-1.534012, -1.471762, -0.5502201, 1, 0.372549, 0, 1,
-1.526329, -0.1253371, -2.28466, 1, 0.3764706, 0, 1,
-1.507361, 1.308396, -1.567797, 1, 0.3843137, 0, 1,
-1.505026, 0.5099416, -2.185082, 1, 0.3882353, 0, 1,
-1.502596, -0.4059055, -0.4563487, 1, 0.3960784, 0, 1,
-1.500368, -0.3786575, -2.281275, 1, 0.4039216, 0, 1,
-1.499859, 0.1097488, -0.2338228, 1, 0.4078431, 0, 1,
-1.494302, 1.697423, -1.477276, 1, 0.4156863, 0, 1,
-1.485393, -2.063691, -4.198664, 1, 0.4196078, 0, 1,
-1.480416, 1.118179, -1.246336, 1, 0.427451, 0, 1,
-1.479637, 2.728008, 0.3420526, 1, 0.4313726, 0, 1,
-1.470001, -1.935756, -4.648981, 1, 0.4392157, 0, 1,
-1.467438, -0.5217141, -2.333177, 1, 0.4431373, 0, 1,
-1.460567, -0.8408127, -2.789602, 1, 0.4509804, 0, 1,
-1.459579, 1.28381, -1.632378, 1, 0.454902, 0, 1,
-1.457066, -0.3197591, -2.469988, 1, 0.4627451, 0, 1,
-1.445995, 1.237835, -1.353967, 1, 0.4666667, 0, 1,
-1.444665, 0.3071162, 0.3440491, 1, 0.4745098, 0, 1,
-1.434558, 0.02269589, -2.585179, 1, 0.4784314, 0, 1,
-1.433699, -0.8954818, -2.496494, 1, 0.4862745, 0, 1,
-1.426431, 0.5984337, -1.455697, 1, 0.4901961, 0, 1,
-1.40724, -0.3512554, -2.272166, 1, 0.4980392, 0, 1,
-1.403085, -0.3241932, -2.287133, 1, 0.5058824, 0, 1,
-1.402198, -0.793676, -0.8244095, 1, 0.509804, 0, 1,
-1.396189, 0.9236566, -1.891953, 1, 0.5176471, 0, 1,
-1.391934, 1.409112, -0.6506702, 1, 0.5215687, 0, 1,
-1.386229, 0.5025891, -1.308214, 1, 0.5294118, 0, 1,
-1.374939, -0.5834836, -1.861699, 1, 0.5333334, 0, 1,
-1.371627, 0.4644624, -1.37914, 1, 0.5411765, 0, 1,
-1.36726, 1.201442, -0.7858872, 1, 0.5450981, 0, 1,
-1.364725, 0.5656937, -3.315521, 1, 0.5529412, 0, 1,
-1.357195, 0.3495405, -2.607752, 1, 0.5568628, 0, 1,
-1.354009, -1.119589, -1.651652, 1, 0.5647059, 0, 1,
-1.351193, -0.4156799, -1.870929, 1, 0.5686275, 0, 1,
-1.351164, 0.9526535, 0.3764874, 1, 0.5764706, 0, 1,
-1.345605, -1.511325, -1.115841, 1, 0.5803922, 0, 1,
-1.331031, -0.9039266, -4.721759, 1, 0.5882353, 0, 1,
-1.330211, -0.152695, -1.918368, 1, 0.5921569, 0, 1,
-1.329287, -0.4363766, -2.898618, 1, 0.6, 0, 1,
-1.320024, 0.9537444, -1.468508, 1, 0.6078432, 0, 1,
-1.31888, -1.39049, -3.158708, 1, 0.6117647, 0, 1,
-1.31724, 0.1277693, -2.670004, 1, 0.6196079, 0, 1,
-1.314942, 0.3283735, -1.95459, 1, 0.6235294, 0, 1,
-1.282997, -2.551255, -2.388077, 1, 0.6313726, 0, 1,
-1.28031, -0.1882806, -1.137111, 1, 0.6352941, 0, 1,
-1.277248, 0.8211504, -0.1547089, 1, 0.6431373, 0, 1,
-1.277218, 1.72739, 0.276298, 1, 0.6470588, 0, 1,
-1.275804, 0.1532229, -1.134056, 1, 0.654902, 0, 1,
-1.269124, 1.004725, -1.270649, 1, 0.6588235, 0, 1,
-1.2616, -0.1627196, -3.013575, 1, 0.6666667, 0, 1,
-1.257292, 1.076852, 0.4487582, 1, 0.6705883, 0, 1,
-1.252228, 0.6070591, -1.386522, 1, 0.6784314, 0, 1,
-1.244237, -0.9465641, -1.585663, 1, 0.682353, 0, 1,
-1.233268, -1.148257, -1.466807, 1, 0.6901961, 0, 1,
-1.219307, 0.3446418, -0.8152248, 1, 0.6941177, 0, 1,
-1.217327, 0.7701169, 0.6021045, 1, 0.7019608, 0, 1,
-1.208454, 1.107538, -0.9143067, 1, 0.7098039, 0, 1,
-1.206554, -0.1580843, -2.923429, 1, 0.7137255, 0, 1,
-1.206429, 0.03343541, -1.443669, 1, 0.7215686, 0, 1,
-1.205604, 0.6290891, -2.291162, 1, 0.7254902, 0, 1,
-1.203213, -0.8035827, -1.938565, 1, 0.7333333, 0, 1,
-1.183331, 1.710665, 0.68986, 1, 0.7372549, 0, 1,
-1.177909, -2.499326, -2.227988, 1, 0.7450981, 0, 1,
-1.177216, 0.40272, -1.76287, 1, 0.7490196, 0, 1,
-1.173493, -0.5656968, -0.2321271, 1, 0.7568628, 0, 1,
-1.172466, 0.1237961, -1.195352, 1, 0.7607843, 0, 1,
-1.164611, 1.221644, -0.1610551, 1, 0.7686275, 0, 1,
-1.156697, 1.546383, -0.5197459, 1, 0.772549, 0, 1,
-1.154401, -1.281028, 0.6541336, 1, 0.7803922, 0, 1,
-1.144408, 0.168049, -2.560515, 1, 0.7843137, 0, 1,
-1.141875, 1.024301, -0.7605872, 1, 0.7921569, 0, 1,
-1.134413, 0.242718, -2.128907, 1, 0.7960784, 0, 1,
-1.129763, -0.3174681, -1.587686, 1, 0.8039216, 0, 1,
-1.125941, -1.654082, -2.339629, 1, 0.8117647, 0, 1,
-1.12584, -0.5915656, -2.534544, 1, 0.8156863, 0, 1,
-1.120259, -1.015142, -2.805938, 1, 0.8235294, 0, 1,
-1.111538, -0.8454809, -2.295249, 1, 0.827451, 0, 1,
-1.111368, -0.6724023, -1.796202, 1, 0.8352941, 0, 1,
-1.108765, 1.223791, -0.8617516, 1, 0.8392157, 0, 1,
-1.10006, 0.0501264, -1.134261, 1, 0.8470588, 0, 1,
-1.091083, 0.75353, 0.1379557, 1, 0.8509804, 0, 1,
-1.089877, -0.258248, -0.883339, 1, 0.8588235, 0, 1,
-1.083724, -0.4616123, -1.274473, 1, 0.8627451, 0, 1,
-1.080093, -0.3968771, -2.409745, 1, 0.8705882, 0, 1,
-1.078922, -0.2534316, -2.63008, 1, 0.8745098, 0, 1,
-1.073798, 1.533353, -0.4892483, 1, 0.8823529, 0, 1,
-1.073151, -0.3697783, -1.484768, 1, 0.8862745, 0, 1,
-1.066945, 0.002113714, -1.120479, 1, 0.8941177, 0, 1,
-1.06672, 0.4685518, -0.8372751, 1, 0.8980392, 0, 1,
-1.065636, -0.4261083, -0.9774958, 1, 0.9058824, 0, 1,
-1.060644, -9.60607e-05, -1.874579, 1, 0.9137255, 0, 1,
-1.056803, -0.1951671, -1.367525, 1, 0.9176471, 0, 1,
-1.055081, 1.389352, 1.332722, 1, 0.9254902, 0, 1,
-1.050319, 0.2383162, -2.652849, 1, 0.9294118, 0, 1,
-1.050196, -0.4842373, -1.416978, 1, 0.9372549, 0, 1,
-1.046718, -0.2976626, -1.692795, 1, 0.9411765, 0, 1,
-1.042882, -1.663262, -3.760226, 1, 0.9490196, 0, 1,
-1.039561, -0.1118079, -1.401807, 1, 0.9529412, 0, 1,
-1.03186, 1.90582, -0.920032, 1, 0.9607843, 0, 1,
-1.031033, 0.1438326, -0.9334274, 1, 0.9647059, 0, 1,
-1.030877, 0.8648471, -1.935502, 1, 0.972549, 0, 1,
-1.029392, 1.799713, -3.121805, 1, 0.9764706, 0, 1,
-1.028267, 0.4844993, -0.138359, 1, 0.9843137, 0, 1,
-1.028031, 0.6233918, 2.083874, 1, 0.9882353, 0, 1,
-1.02642, -0.2569793, -1.759481, 1, 0.9960784, 0, 1,
-1.025396, -0.1405599, -2.555824, 0.9960784, 1, 0, 1,
-1.02002, 0.5914324, -0.4096811, 0.9921569, 1, 0, 1,
-1.004273, -0.1358916, -3.55886, 0.9843137, 1, 0, 1,
-1.003814, 0.5566792, -2.429885, 0.9803922, 1, 0, 1,
-0.9982895, -0.2928648, -2.656955, 0.972549, 1, 0, 1,
-0.9980862, 2.343901, -0.6386729, 0.9686275, 1, 0, 1,
-0.9958082, 1.326565, -0.4914725, 0.9607843, 1, 0, 1,
-0.994785, 1.60657, -1.57515, 0.9568627, 1, 0, 1,
-0.992154, -1.520079, -2.268087, 0.9490196, 1, 0, 1,
-0.9911393, 1.510835, -0.6357068, 0.945098, 1, 0, 1,
-0.9763867, 0.6518317, 1.13257, 0.9372549, 1, 0, 1,
-0.9763292, 0.07776721, -2.186427, 0.9333333, 1, 0, 1,
-0.967284, -1.000859, -3.755863, 0.9254902, 1, 0, 1,
-0.9661384, -0.6466255, -1.58161, 0.9215686, 1, 0, 1,
-0.9612592, -1.083291, -2.096316, 0.9137255, 1, 0, 1,
-0.952442, 1.020455, -0.8863257, 0.9098039, 1, 0, 1,
-0.9451251, 0.264053, -0.4747391, 0.9019608, 1, 0, 1,
-0.9415765, 0.1986503, -0.5681841, 0.8941177, 1, 0, 1,
-0.9392678, 0.8899141, -0.9171895, 0.8901961, 1, 0, 1,
-0.9277022, 0.8919534, -1.711158, 0.8823529, 1, 0, 1,
-0.921854, -0.3963311, -3.504174, 0.8784314, 1, 0, 1,
-0.9184002, -0.2101999, -2.781482, 0.8705882, 1, 0, 1,
-0.9156161, 0.3364563, -0.84303, 0.8666667, 1, 0, 1,
-0.9139288, -1.057107, -2.111982, 0.8588235, 1, 0, 1,
-0.9135332, -0.07745525, -2.535092, 0.854902, 1, 0, 1,
-0.9106256, 1.257307, 1.0422, 0.8470588, 1, 0, 1,
-0.9075384, 1.089446, -0.5545814, 0.8431373, 1, 0, 1,
-0.9054244, 1.507336, -0.01265803, 0.8352941, 1, 0, 1,
-0.9029416, -0.3526309, -1.654598, 0.8313726, 1, 0, 1,
-0.9027907, -2.53418, -1.160465, 0.8235294, 1, 0, 1,
-0.8986683, 0.8795605, -0.9078893, 0.8196079, 1, 0, 1,
-0.8922914, 0.2167224, 0.8840699, 0.8117647, 1, 0, 1,
-0.8912219, -1.012172, -3.357537, 0.8078431, 1, 0, 1,
-0.8885624, -0.260341, -2.625083, 0.8, 1, 0, 1,
-0.8870457, -0.2913166, -1.450168, 0.7921569, 1, 0, 1,
-0.8812969, -0.665037, -1.481048, 0.7882353, 1, 0, 1,
-0.881073, -0.5356917, -1.392418, 0.7803922, 1, 0, 1,
-0.8790002, -1.628065, -1.658763, 0.7764706, 1, 0, 1,
-0.8648751, 0.4512607, 0.09224729, 0.7686275, 1, 0, 1,
-0.862673, -1.92781, -4.056036, 0.7647059, 1, 0, 1,
-0.8503932, -0.4233056, -2.83408, 0.7568628, 1, 0, 1,
-0.8462151, 0.4731394, -0.145986, 0.7529412, 1, 0, 1,
-0.8441233, -0.4324019, -2.189722, 0.7450981, 1, 0, 1,
-0.8437308, -0.6686172, -3.208282, 0.7411765, 1, 0, 1,
-0.8245032, 1.744028, -1.310002, 0.7333333, 1, 0, 1,
-0.8236808, 0.4632456, -0.7476766, 0.7294118, 1, 0, 1,
-0.8177229, -1.673816, -3.008646, 0.7215686, 1, 0, 1,
-0.8105984, 0.5088252, -1.894303, 0.7176471, 1, 0, 1,
-0.807353, 0.7988705, -0.3227521, 0.7098039, 1, 0, 1,
-0.8039233, -0.111079, -2.279541, 0.7058824, 1, 0, 1,
-0.8025082, 0.2711882, -2.626184, 0.6980392, 1, 0, 1,
-0.8021431, 0.2902398, -0.3929558, 0.6901961, 1, 0, 1,
-0.8018562, -0.8424975, -2.590593, 0.6862745, 1, 0, 1,
-0.800098, 0.9445683, -2.435734, 0.6784314, 1, 0, 1,
-0.796665, 0.3027347, -2.544327, 0.6745098, 1, 0, 1,
-0.7952672, -0.2525597, -2.056265, 0.6666667, 1, 0, 1,
-0.7923502, 0.601908, -0.7648101, 0.6627451, 1, 0, 1,
-0.7909064, 0.764075, 0.05191628, 0.654902, 1, 0, 1,
-0.7877917, -0.166688, -1.009438, 0.6509804, 1, 0, 1,
-0.7864989, 0.05775075, -2.402532, 0.6431373, 1, 0, 1,
-0.7844712, 0.0450568, -0.1591723, 0.6392157, 1, 0, 1,
-0.7826582, -2.130689, -2.431603, 0.6313726, 1, 0, 1,
-0.7822779, -1.739412, -2.76902, 0.627451, 1, 0, 1,
-0.7822369, -0.9050611, -2.554463, 0.6196079, 1, 0, 1,
-0.7804855, -0.1731643, -1.758008, 0.6156863, 1, 0, 1,
-0.7802013, 0.8342776, -0.7254623, 0.6078432, 1, 0, 1,
-0.7780799, -1.704676, -2.251767, 0.6039216, 1, 0, 1,
-0.7753273, -0.9265231, -1.258096, 0.5960785, 1, 0, 1,
-0.773829, 0.4456025, 1.09768, 0.5882353, 1, 0, 1,
-0.7736735, -0.5350993, -1.738345, 0.5843138, 1, 0, 1,
-0.7713643, 0.682874, -0.6092646, 0.5764706, 1, 0, 1,
-0.770807, -0.2770798, -1.699662, 0.572549, 1, 0, 1,
-0.7692381, 1.100741, 0.3818691, 0.5647059, 1, 0, 1,
-0.7681808, 1.498607, -1.250735, 0.5607843, 1, 0, 1,
-0.7637703, -0.2405005, -2.203637, 0.5529412, 1, 0, 1,
-0.7619364, -0.2256719, -1.284687, 0.5490196, 1, 0, 1,
-0.7618333, 0.2024032, -0.4820977, 0.5411765, 1, 0, 1,
-0.7600489, 2.186722, 0.8996493, 0.5372549, 1, 0, 1,
-0.7454907, -0.5248514, -2.240088, 0.5294118, 1, 0, 1,
-0.7428498, 0.1866072, -0.2341142, 0.5254902, 1, 0, 1,
-0.7364149, 1.150434, -0.4952165, 0.5176471, 1, 0, 1,
-0.7343984, 0.0438586, -0.3840566, 0.5137255, 1, 0, 1,
-0.7278572, 0.9023876, 0.9323126, 0.5058824, 1, 0, 1,
-0.7245117, 0.8268903, -0.03918831, 0.5019608, 1, 0, 1,
-0.7223181, -0.6851876, 0.06845545, 0.4941176, 1, 0, 1,
-0.7178575, -0.08368348, -0.8656824, 0.4862745, 1, 0, 1,
-0.7164758, 0.7449485, -1.646223, 0.4823529, 1, 0, 1,
-0.7117348, 1.108404, -1.389804, 0.4745098, 1, 0, 1,
-0.7114674, 1.223066, -1.106884, 0.4705882, 1, 0, 1,
-0.708432, -0.7952182, -0.8569831, 0.4627451, 1, 0, 1,
-0.7057771, 0.8176565, -0.825389, 0.4588235, 1, 0, 1,
-0.7030751, -0.7541088, -3.145672, 0.4509804, 1, 0, 1,
-0.7030207, 0.5286729, 0.07742279, 0.4470588, 1, 0, 1,
-0.702217, 0.4717351, -0.239391, 0.4392157, 1, 0, 1,
-0.6984808, -0.9450182, -2.780238, 0.4352941, 1, 0, 1,
-0.6974371, -1.209826, -2.14536, 0.427451, 1, 0, 1,
-0.695902, 2.060443, 0.4353197, 0.4235294, 1, 0, 1,
-0.690072, -0.5299367, -1.483807, 0.4156863, 1, 0, 1,
-0.6877348, 1.710135, 0.5741385, 0.4117647, 1, 0, 1,
-0.6832195, 0.2870809, -0.1858303, 0.4039216, 1, 0, 1,
-0.6824923, 0.2902685, -1.992077, 0.3960784, 1, 0, 1,
-0.6736307, 0.5292775, -0.8339082, 0.3921569, 1, 0, 1,
-0.6712077, -0.8825117, -0.7735562, 0.3843137, 1, 0, 1,
-0.668467, -0.291721, -2.17476, 0.3803922, 1, 0, 1,
-0.6647679, 1.541306, -1.283877, 0.372549, 1, 0, 1,
-0.6619103, -0.8863689, -4.570026, 0.3686275, 1, 0, 1,
-0.661319, -0.5170969, -0.9343717, 0.3607843, 1, 0, 1,
-0.6577206, 0.2509295, -1.67229, 0.3568628, 1, 0, 1,
-0.6516037, -0.7233226, -2.255922, 0.3490196, 1, 0, 1,
-0.6469491, -0.9275724, -1.667855, 0.345098, 1, 0, 1,
-0.643649, -0.7035492, -3.269853, 0.3372549, 1, 0, 1,
-0.642484, -0.07077881, -0.7984535, 0.3333333, 1, 0, 1,
-0.6349908, -0.7388803, -3.897379, 0.3254902, 1, 0, 1,
-0.6346055, 0.3984556, -0.3731632, 0.3215686, 1, 0, 1,
-0.6184601, -0.6015494, -1.745964, 0.3137255, 1, 0, 1,
-0.6157101, -0.7364784, -0.7923258, 0.3098039, 1, 0, 1,
-0.6129239, -0.6831731, -2.681199, 0.3019608, 1, 0, 1,
-0.6123577, 0.628707, -0.9795691, 0.2941177, 1, 0, 1,
-0.6123407, 0.4647064, -1.357647, 0.2901961, 1, 0, 1,
-0.6040044, -1.495005, -4.027343, 0.282353, 1, 0, 1,
-0.6021352, 0.2273768, -2.330975, 0.2784314, 1, 0, 1,
-0.6008849, -0.06148402, 0.009169918, 0.2705882, 1, 0, 1,
-0.600113, -0.4335392, -1.657859, 0.2666667, 1, 0, 1,
-0.5980057, -1.92729, -2.174407, 0.2588235, 1, 0, 1,
-0.5939563, -0.4748255, -1.293354, 0.254902, 1, 0, 1,
-0.5937402, 1.372484, -0.6068745, 0.2470588, 1, 0, 1,
-0.5931881, 0.7533394, -1.292116, 0.2431373, 1, 0, 1,
-0.592913, -0.9668555, -2.586478, 0.2352941, 1, 0, 1,
-0.5924427, 0.3972232, -0.4529316, 0.2313726, 1, 0, 1,
-0.5882215, -0.6086041, -1.549268, 0.2235294, 1, 0, 1,
-0.5847117, 0.6171895, 0.2699368, 0.2196078, 1, 0, 1,
-0.5809832, 0.2276747, -1.938498, 0.2117647, 1, 0, 1,
-0.5779065, -0.06762984, -3.074631, 0.2078431, 1, 0, 1,
-0.5705385, -1.241657, -2.357584, 0.2, 1, 0, 1,
-0.5695989, 1.067414, -0.8728346, 0.1921569, 1, 0, 1,
-0.5684055, 1.158455, 0.6899309, 0.1882353, 1, 0, 1,
-0.5676559, 0.4180814, 0.4176973, 0.1803922, 1, 0, 1,
-0.5675739, -0.5300297, -1.90667, 0.1764706, 1, 0, 1,
-0.5574018, -0.261291, -1.499392, 0.1686275, 1, 0, 1,
-0.5516764, 0.4424899, 0.6813896, 0.1647059, 1, 0, 1,
-0.5468121, 0.2825206, -0.5517465, 0.1568628, 1, 0, 1,
-0.5444689, 0.7005338, -0.6193169, 0.1529412, 1, 0, 1,
-0.5438173, -1.475722, -2.207276, 0.145098, 1, 0, 1,
-0.5416442, 0.7147763, 0.01878544, 0.1411765, 1, 0, 1,
-0.5357461, -0.009327686, -0.3720088, 0.1333333, 1, 0, 1,
-0.5351235, -0.3178349, -2.089373, 0.1294118, 1, 0, 1,
-0.5327866, 0.06383595, -2.300459, 0.1215686, 1, 0, 1,
-0.5310766, -2.285822, -3.572727, 0.1176471, 1, 0, 1,
-0.5277061, 0.8731225, -1.228033, 0.1098039, 1, 0, 1,
-0.5269251, 0.1439518, -1.193719, 0.1058824, 1, 0, 1,
-0.5246897, -1.485919, -2.504343, 0.09803922, 1, 0, 1,
-0.5220413, 0.0215637, -2.408032, 0.09019608, 1, 0, 1,
-0.5217288, 0.3320483, -0.2501682, 0.08627451, 1, 0, 1,
-0.5210412, 1.543304, -0.4896245, 0.07843138, 1, 0, 1,
-0.5180783, 1.051491, -0.7128492, 0.07450981, 1, 0, 1,
-0.5169618, 2.237873, -1.251848, 0.06666667, 1, 0, 1,
-0.5141267, 1.148713, -0.134266, 0.0627451, 1, 0, 1,
-0.51282, 0.5242579, -2.388838, 0.05490196, 1, 0, 1,
-0.5095733, -0.3364582, -1.78805, 0.05098039, 1, 0, 1,
-0.5090569, -1.350935, -1.464479, 0.04313726, 1, 0, 1,
-0.4899666, 0.4159939, -2.84236, 0.03921569, 1, 0, 1,
-0.4871781, -0.2836677, -2.53785, 0.03137255, 1, 0, 1,
-0.4821581, 0.5713766, -0.4560927, 0.02745098, 1, 0, 1,
-0.4805489, 0.1352666, -1.033038, 0.01960784, 1, 0, 1,
-0.479679, 1.039138, 0.5115171, 0.01568628, 1, 0, 1,
-0.4746104, -1.554878, -4.107239, 0.007843138, 1, 0, 1,
-0.4695161, -0.1170394, 0.1552716, 0.003921569, 1, 0, 1,
-0.4636006, -0.8395057, -2.189069, 0, 1, 0.003921569, 1,
-0.4623013, -1.00511, -3.216363, 0, 1, 0.01176471, 1,
-0.4564838, -0.0003741879, -0.005477889, 0, 1, 0.01568628, 1,
-0.4450907, 0.8368636, 0.3169422, 0, 1, 0.02352941, 1,
-0.4390545, -0.1468179, -3.105618, 0, 1, 0.02745098, 1,
-0.4367059, 0.9961684, -2.555794, 0, 1, 0.03529412, 1,
-0.4351728, -0.1449227, -2.456648, 0, 1, 0.03921569, 1,
-0.424209, 0.007870134, -1.971477, 0, 1, 0.04705882, 1,
-0.4188665, -0.3650464, -0.1376875, 0, 1, 0.05098039, 1,
-0.4130129, -0.7479746, -3.025904, 0, 1, 0.05882353, 1,
-0.4094465, 0.3798055, -3.335306, 0, 1, 0.0627451, 1,
-0.4082743, -0.3346596, -0.6998853, 0, 1, 0.07058824, 1,
-0.4077882, 2.108763, 0.1910568, 0, 1, 0.07450981, 1,
-0.4067816, 0.7315397, -1.161146, 0, 1, 0.08235294, 1,
-0.4035024, 0.8504672, -1.051721, 0, 1, 0.08627451, 1,
-0.4034896, 0.2863303, -0.04967133, 0, 1, 0.09411765, 1,
-0.3982359, 0.3916534, -1.019055, 0, 1, 0.1019608, 1,
-0.3958841, 1.301813, -0.5841646, 0, 1, 0.1058824, 1,
-0.3947808, -0.301238, -1.821692, 0, 1, 0.1137255, 1,
-0.3942091, -1.076695, -2.606281, 0, 1, 0.1176471, 1,
-0.3933164, 0.6700758, -0.8206753, 0, 1, 0.1254902, 1,
-0.3931426, -1.380396, -3.656788, 0, 1, 0.1294118, 1,
-0.3854073, 1.436188, 0.2955324, 0, 1, 0.1372549, 1,
-0.3840598, -0.2536783, -1.621683, 0, 1, 0.1411765, 1,
-0.3819639, 1.279276, 0.1597021, 0, 1, 0.1490196, 1,
-0.3795061, -1.323877, -3.124726, 0, 1, 0.1529412, 1,
-0.3762461, 0.1455147, -0.7015187, 0, 1, 0.1607843, 1,
-0.3751695, -0.803625, -2.039009, 0, 1, 0.1647059, 1,
-0.3734419, 0.3290052, -0.3067195, 0, 1, 0.172549, 1,
-0.3733836, 0.4880452, -1.635381, 0, 1, 0.1764706, 1,
-0.3692982, 0.5277063, 0.9890358, 0, 1, 0.1843137, 1,
-0.365386, -0.3896548, -2.931236, 0, 1, 0.1882353, 1,
-0.3626154, -1.014834, -1.793457, 0, 1, 0.1960784, 1,
-0.3616388, -1.364771, -0.6556835, 0, 1, 0.2039216, 1,
-0.3596471, -0.1086898, -0.5852495, 0, 1, 0.2078431, 1,
-0.3586858, -0.7484391, -3.562302, 0, 1, 0.2156863, 1,
-0.3580936, -1.399737, -3.870751, 0, 1, 0.2196078, 1,
-0.3578423, 0.2247157, -1.425173, 0, 1, 0.227451, 1,
-0.3521433, -0.4759646, -1.699307, 0, 1, 0.2313726, 1,
-0.346638, -0.635746, -3.736799, 0, 1, 0.2392157, 1,
-0.3464598, 1.419015, -0.3319175, 0, 1, 0.2431373, 1,
-0.3463148, 0.8998112, -0.8957244, 0, 1, 0.2509804, 1,
-0.3459637, 0.4842045, -1.393463, 0, 1, 0.254902, 1,
-0.3452896, 0.09706251, 0.3789784, 0, 1, 0.2627451, 1,
-0.3426573, 1.071017, -1.361082, 0, 1, 0.2666667, 1,
-0.3422105, -0.8155289, -2.028624, 0, 1, 0.2745098, 1,
-0.3416108, 1.681076, -0.9026605, 0, 1, 0.2784314, 1,
-0.3411947, -0.1588707, -1.398438, 0, 1, 0.2862745, 1,
-0.3408201, -0.02771321, -0.09377594, 0, 1, 0.2901961, 1,
-0.3374878, -2.229659, -4.093858, 0, 1, 0.2980392, 1,
-0.3330496, 2.311892, 1.36256, 0, 1, 0.3058824, 1,
-0.3290727, 1.805793, -0.1394148, 0, 1, 0.3098039, 1,
-0.3277835, -0.4865983, -2.904531, 0, 1, 0.3176471, 1,
-0.3267595, 0.4632578, -0.1140309, 0, 1, 0.3215686, 1,
-0.3264644, 0.5528843, 1.194562, 0, 1, 0.3294118, 1,
-0.3221377, 0.993541, 0.9337267, 0, 1, 0.3333333, 1,
-0.3198546, -1.124922, -2.759794, 0, 1, 0.3411765, 1,
-0.3175417, 1.063222, 1.149883, 0, 1, 0.345098, 1,
-0.315437, -0.1787811, -3.520135, 0, 1, 0.3529412, 1,
-0.3140809, -0.7003078, -1.529736, 0, 1, 0.3568628, 1,
-0.3083422, 0.09517524, 0.9203048, 0, 1, 0.3647059, 1,
-0.3025937, -0.348616, -2.169964, 0, 1, 0.3686275, 1,
-0.3011377, 0.6863287, -1.378192, 0, 1, 0.3764706, 1,
-0.3005064, 1.169845, 0.1246332, 0, 1, 0.3803922, 1,
-0.2972228, 0.3924549, -1.647318, 0, 1, 0.3882353, 1,
-0.2935337, 0.3286395, -0.5691944, 0, 1, 0.3921569, 1,
-0.2903518, 0.9290703, 2.108705, 0, 1, 0.4, 1,
-0.2888435, -1.065927, -3.158449, 0, 1, 0.4078431, 1,
-0.2874854, -0.633384, -2.61203, 0, 1, 0.4117647, 1,
-0.2824157, 0.2493943, 1.149948, 0, 1, 0.4196078, 1,
-0.2813561, 0.7304161, 2.037227, 0, 1, 0.4235294, 1,
-0.2776986, -0.3246157, -2.336319, 0, 1, 0.4313726, 1,
-0.2770702, -1.708719, -1.752117, 0, 1, 0.4352941, 1,
-0.2764813, -1.20378, -2.732259, 0, 1, 0.4431373, 1,
-0.2760253, -0.2950603, -1.643725, 0, 1, 0.4470588, 1,
-0.2754897, -0.4027192, -0.982054, 0, 1, 0.454902, 1,
-0.2687237, -1.17564, -3.116214, 0, 1, 0.4588235, 1,
-0.2679829, -1.330373, -3.180866, 0, 1, 0.4666667, 1,
-0.2661541, -0.858919, -3.326458, 0, 1, 0.4705882, 1,
-0.2617324, 0.6589288, -0.7154813, 0, 1, 0.4784314, 1,
-0.2581144, 1.652595, -0.5608456, 0, 1, 0.4823529, 1,
-0.2532973, -1.698993, -4.461973, 0, 1, 0.4901961, 1,
-0.2526296, 1.438802, -0.8175245, 0, 1, 0.4941176, 1,
-0.245396, -2.424938, -1.843945, 0, 1, 0.5019608, 1,
-0.2434279, 1.664313, 1.066837, 0, 1, 0.509804, 1,
-0.243043, -0.5868613, -2.125535, 0, 1, 0.5137255, 1,
-0.2411135, 0.6825533, -0.7797005, 0, 1, 0.5215687, 1,
-0.237231, 0.4585527, -2.333829, 0, 1, 0.5254902, 1,
-0.2359585, -0.5344733, -4.189661, 0, 1, 0.5333334, 1,
-0.2316625, 0.14111, -2.054724, 0, 1, 0.5372549, 1,
-0.2308218, 0.4868217, -0.7812449, 0, 1, 0.5450981, 1,
-0.2280766, 2.08883, 0.516759, 0, 1, 0.5490196, 1,
-0.2239321, 0.5297571, -0.7682256, 0, 1, 0.5568628, 1,
-0.2238334, -1.314664, -5.04724, 0, 1, 0.5607843, 1,
-0.223504, -0.5751603, -1.76405, 0, 1, 0.5686275, 1,
-0.2232169, -1.101309, -3.437075, 0, 1, 0.572549, 1,
-0.2216787, -0.6071557, -1.915699, 0, 1, 0.5803922, 1,
-0.2147729, 0.2963127, -2.75303, 0, 1, 0.5843138, 1,
-0.2133907, -1.429266, -2.440194, 0, 1, 0.5921569, 1,
-0.2131409, -2.662291, -2.750003, 0, 1, 0.5960785, 1,
-0.2119573, 0.6802803, -0.3445987, 0, 1, 0.6039216, 1,
-0.2091962, -0.06314686, -1.861931, 0, 1, 0.6117647, 1,
-0.2073257, 1.543623, -0.8677328, 0, 1, 0.6156863, 1,
-0.1955572, 0.5009089, -0.4778355, 0, 1, 0.6235294, 1,
-0.1953398, -1.440085, -4.93951, 0, 1, 0.627451, 1,
-0.1943256, -0.1408415, -3.0082, 0, 1, 0.6352941, 1,
-0.1914347, 0.264948, -2.634401, 0, 1, 0.6392157, 1,
-0.1913964, -0.1974193, -2.036032, 0, 1, 0.6470588, 1,
-0.1900139, 1.945861, -0.2428965, 0, 1, 0.6509804, 1,
-0.189897, 0.4539348, -0.7223946, 0, 1, 0.6588235, 1,
-0.1884379, -1.872747, -3.253243, 0, 1, 0.6627451, 1,
-0.1876628, 0.7729379, -1.622261, 0, 1, 0.6705883, 1,
-0.1844457, -0.03016794, -1.476195, 0, 1, 0.6745098, 1,
-0.1818241, -0.3847899, -2.900096, 0, 1, 0.682353, 1,
-0.1817697, 0.731607, -0.7640194, 0, 1, 0.6862745, 1,
-0.175444, 1.600842, -1.003684, 0, 1, 0.6941177, 1,
-0.1727989, -0.323338, -2.507668, 0, 1, 0.7019608, 1,
-0.1630527, 0.1576316, -0.6996292, 0, 1, 0.7058824, 1,
-0.1609457, -0.2632837, -3.040557, 0, 1, 0.7137255, 1,
-0.1556733, 0.3822544, 1.127308, 0, 1, 0.7176471, 1,
-0.1542709, 0.7661013, -2.044301, 0, 1, 0.7254902, 1,
-0.1475472, 0.2633961, -0.9922556, 0, 1, 0.7294118, 1,
-0.1470195, -0.09484415, -2.091284, 0, 1, 0.7372549, 1,
-0.1436041, 1.76014, 1.293561, 0, 1, 0.7411765, 1,
-0.1433941, -1.268463, -3.117991, 0, 1, 0.7490196, 1,
-0.1418077, -0.4174048, -1.421048, 0, 1, 0.7529412, 1,
-0.1332364, -0.1394923, -1.667873, 0, 1, 0.7607843, 1,
-0.130272, -0.5582607, -2.644313, 0, 1, 0.7647059, 1,
-0.1264708, 0.8199121, 0.008857202, 0, 1, 0.772549, 1,
-0.1226828, -1.314454, -2.517856, 0, 1, 0.7764706, 1,
-0.1154563, -0.6557153, -3.214994, 0, 1, 0.7843137, 1,
-0.11385, -1.617332, -2.770994, 0, 1, 0.7882353, 1,
-0.1098277, -0.4404127, -2.05337, 0, 1, 0.7960784, 1,
-0.1083516, 0.3162404, 0.1227164, 0, 1, 0.8039216, 1,
-0.1056245, -0.7343548, -2.979777, 0, 1, 0.8078431, 1,
-0.09892485, -1.804904, -2.645218, 0, 1, 0.8156863, 1,
-0.09741978, 1.311433, 0.1228239, 0, 1, 0.8196079, 1,
-0.09649876, -1.039542, -1.948731, 0, 1, 0.827451, 1,
-0.09433804, -0.2639259, -4.622091, 0, 1, 0.8313726, 1,
-0.09129311, 0.4841405, 0.9563644, 0, 1, 0.8392157, 1,
-0.09034891, 1.071984, -1.821933, 0, 1, 0.8431373, 1,
-0.08916946, -0.3576552, -2.533848, 0, 1, 0.8509804, 1,
-0.08621299, -0.2944373, -3.7949, 0, 1, 0.854902, 1,
-0.08457859, -0.6736764, -3.882645, 0, 1, 0.8627451, 1,
-0.08341327, 0.8421083, 0.6404972, 0, 1, 0.8666667, 1,
-0.07931987, 1.556336, -1.391052, 0, 1, 0.8745098, 1,
-0.0780094, -0.3306697, -2.375515, 0, 1, 0.8784314, 1,
-0.07479501, -1.258209, -4.50121, 0, 1, 0.8862745, 1,
-0.07328808, 2.147199, 1.045821, 0, 1, 0.8901961, 1,
-0.07306735, -1.329212, -2.643894, 0, 1, 0.8980392, 1,
-0.07266629, 1.108555, 1.813414, 0, 1, 0.9058824, 1,
-0.06809986, -2.234543, -2.629565, 0, 1, 0.9098039, 1,
-0.06576284, -0.36571, -3.35854, 0, 1, 0.9176471, 1,
-0.06519826, -1.622644, -3.719465, 0, 1, 0.9215686, 1,
-0.06347144, -1.047935, -4.996925, 0, 1, 0.9294118, 1,
-0.05967457, -1.554574, -3.176843, 0, 1, 0.9333333, 1,
-0.05736011, -0.1079199, -3.831534, 0, 1, 0.9411765, 1,
-0.0572025, 0.312074, -0.5413594, 0, 1, 0.945098, 1,
-0.04902106, 0.6405436, -0.7913332, 0, 1, 0.9529412, 1,
-0.0476674, 1.438299, 0.289985, 0, 1, 0.9568627, 1,
-0.04594827, -0.784972, -1.672906, 0, 1, 0.9647059, 1,
-0.04444363, 0.9008561, 0.9146907, 0, 1, 0.9686275, 1,
-0.0432332, -0.149237, -2.181954, 0, 1, 0.9764706, 1,
-0.04183258, -1.385701, -4.208045, 0, 1, 0.9803922, 1,
-0.03520629, 2.422338, 0.5342377, 0, 1, 0.9882353, 1,
-0.02874771, -2.142511, -2.457141, 0, 1, 0.9921569, 1,
-0.02510165, 0.1986644, -1.186087, 0, 1, 1, 1,
-0.02401217, 1.211452, 1.387715, 0, 0.9921569, 1, 1,
-0.01868756, -0.1161204, -2.527892, 0, 0.9882353, 1, 1,
-0.01322436, -0.417274, -3.388784, 0, 0.9803922, 1, 1,
-0.01113019, -0.179194, -2.918121, 0, 0.9764706, 1, 1,
-0.01063327, -0.362643, -2.031608, 0, 0.9686275, 1, 1,
-0.00125779, 0.9231864, -0.1883056, 0, 0.9647059, 1, 1,
0.009013743, 1.23786, 0.8791295, 0, 0.9568627, 1, 1,
0.01459645, -1.742507, 3.626334, 0, 0.9529412, 1, 1,
0.01827474, -1.246154, 3.087272, 0, 0.945098, 1, 1,
0.01892924, -1.205188, 1.632066, 0, 0.9411765, 1, 1,
0.02044672, -0.7258114, 3.745049, 0, 0.9333333, 1, 1,
0.0216435, -0.2483136, 2.004088, 0, 0.9294118, 1, 1,
0.0231375, -0.1536927, 2.273888, 0, 0.9215686, 1, 1,
0.02483218, -0.7551816, 3.844874, 0, 0.9176471, 1, 1,
0.02689235, 1.006949, 0.6774436, 0, 0.9098039, 1, 1,
0.03055519, -1.272218, 2.964275, 0, 0.9058824, 1, 1,
0.03474943, -0.3089192, 3.329265, 0, 0.8980392, 1, 1,
0.04016066, -1.460381, 3.261558, 0, 0.8901961, 1, 1,
0.0404547, 1.221084, -0.9180806, 0, 0.8862745, 1, 1,
0.04495868, 1.857649, 0.9769813, 0, 0.8784314, 1, 1,
0.04735515, -0.04346075, 1.241934, 0, 0.8745098, 1, 1,
0.0487684, -0.7963796, 4.050989, 0, 0.8666667, 1, 1,
0.05182971, -1.205314, 2.275218, 0, 0.8627451, 1, 1,
0.05979951, -1.421769, 2.53481, 0, 0.854902, 1, 1,
0.06124265, 0.6506205, -0.2435117, 0, 0.8509804, 1, 1,
0.06347422, 0.4307973, 1.86135, 0, 0.8431373, 1, 1,
0.06882243, 1.9144, -0.744061, 0, 0.8392157, 1, 1,
0.06882437, -1.711937, 3.402672, 0, 0.8313726, 1, 1,
0.06936321, 0.1422812, 0.7396512, 0, 0.827451, 1, 1,
0.08474652, 0.1697998, 1.478528, 0, 0.8196079, 1, 1,
0.08509658, -1.068122, 3.916079, 0, 0.8156863, 1, 1,
0.0859306, 0.1366129, 2.002525, 0, 0.8078431, 1, 1,
0.08630536, -0.258784, 4.230932, 0, 0.8039216, 1, 1,
0.09199339, 1.050225, -0.4070715, 0, 0.7960784, 1, 1,
0.09350187, 0.6598123, 1.001155, 0, 0.7882353, 1, 1,
0.09352101, 1.73168, -0.3378, 0, 0.7843137, 1, 1,
0.0947428, -2.314966, 2.537485, 0, 0.7764706, 1, 1,
0.09532866, 2.297143, 2.246289, 0, 0.772549, 1, 1,
0.09764272, -2.362309, 4.14992, 0, 0.7647059, 1, 1,
0.09995069, 1.323479, -0.4937702, 0, 0.7607843, 1, 1,
0.1016984, -0.2752121, 3.117332, 0, 0.7529412, 1, 1,
0.1039783, -1.31064, 3.475487, 0, 0.7490196, 1, 1,
0.1079994, 1.067274, 0.3785579, 0, 0.7411765, 1, 1,
0.1112244, -0.6848125, 1.541776, 0, 0.7372549, 1, 1,
0.1165172, -0.1373151, 3.588903, 0, 0.7294118, 1, 1,
0.1173231, 0.2186446, 0.4411705, 0, 0.7254902, 1, 1,
0.1180408, 0.247338, -0.468352, 0, 0.7176471, 1, 1,
0.1221365, 0.7850835, -1.805187, 0, 0.7137255, 1, 1,
0.1223976, -1.064212, 2.319444, 0, 0.7058824, 1, 1,
0.1270623, 1.311954, -0.6609019, 0, 0.6980392, 1, 1,
0.1294694, 0.5307372, 0.2828823, 0, 0.6941177, 1, 1,
0.1299706, -2.005056, 4.38225, 0, 0.6862745, 1, 1,
0.1339695, 0.07549884, -0.4003731, 0, 0.682353, 1, 1,
0.1341687, -0.660619, 2.569471, 0, 0.6745098, 1, 1,
0.1359856, 0.7796841, -0.4593568, 0, 0.6705883, 1, 1,
0.1375625, -0.8995243, 4.603731, 0, 0.6627451, 1, 1,
0.1384837, 0.159289, 0.5257685, 0, 0.6588235, 1, 1,
0.1395902, 0.05426843, 0.3298131, 0, 0.6509804, 1, 1,
0.1420901, 0.126055, 1.791158, 0, 0.6470588, 1, 1,
0.1428375, 1.470123, 0.4861065, 0, 0.6392157, 1, 1,
0.146556, -1.284486, 2.6796, 0, 0.6352941, 1, 1,
0.1481402, -1.470517, 2.182033, 0, 0.627451, 1, 1,
0.1593621, -1.781676, 1.561761, 0, 0.6235294, 1, 1,
0.1611944, 0.8230333, 0.09274571, 0, 0.6156863, 1, 1,
0.163109, -0.8850396, 3.499731, 0, 0.6117647, 1, 1,
0.1633782, 0.6766493, 2.565948, 0, 0.6039216, 1, 1,
0.1653267, 0.167629, 0.9855421, 0, 0.5960785, 1, 1,
0.1685328, 1.487062, 0.3796185, 0, 0.5921569, 1, 1,
0.1711749, 0.4403103, 0.3403595, 0, 0.5843138, 1, 1,
0.1741319, -0.4756664, 1.973855, 0, 0.5803922, 1, 1,
0.1785551, 0.731121, 0.01616428, 0, 0.572549, 1, 1,
0.1828582, -0.2030954, 2.390262, 0, 0.5686275, 1, 1,
0.1873408, 0.443813, 0.2067737, 0, 0.5607843, 1, 1,
0.1876624, -1.174391, 1.865127, 0, 0.5568628, 1, 1,
0.189024, -2.590582, 3.716251, 0, 0.5490196, 1, 1,
0.1902992, -1.292419, 2.960535, 0, 0.5450981, 1, 1,
0.191447, -1.348694, 4.486373, 0, 0.5372549, 1, 1,
0.1943414, -0.1968093, 0.6803748, 0, 0.5333334, 1, 1,
0.1954171, -0.4452405, 3.554851, 0, 0.5254902, 1, 1,
0.1962829, 1.666759, 1.893453, 0, 0.5215687, 1, 1,
0.1977442, -1.304766, 1.410176, 0, 0.5137255, 1, 1,
0.1996292, -0.3654776, 2.627122, 0, 0.509804, 1, 1,
0.2032962, 1.573175, -0.1362345, 0, 0.5019608, 1, 1,
0.2077294, -1.448008, 3.859879, 0, 0.4941176, 1, 1,
0.2135756, -1.164606, 2.808693, 0, 0.4901961, 1, 1,
0.2150632, -0.1408432, 0.1781056, 0, 0.4823529, 1, 1,
0.2154249, 2.354421, 1.994782, 0, 0.4784314, 1, 1,
0.2228418, 0.07080451, 0.5727147, 0, 0.4705882, 1, 1,
0.222899, 0.3459286, -0.6507217, 0, 0.4666667, 1, 1,
0.2233504, -0.6160424, 2.695825, 0, 0.4588235, 1, 1,
0.2260929, -0.66086, 2.652258, 0, 0.454902, 1, 1,
0.2307522, -1.300756, 2.257413, 0, 0.4470588, 1, 1,
0.2421356, 0.5309311, 1.269852, 0, 0.4431373, 1, 1,
0.2447395, -2.065968, 2.161261, 0, 0.4352941, 1, 1,
0.2490828, 0.7445191, -0.206196, 0, 0.4313726, 1, 1,
0.2521303, -0.8923868, 2.040569, 0, 0.4235294, 1, 1,
0.2580692, 1.924987, -1.574647, 0, 0.4196078, 1, 1,
0.2600628, -0.1056815, 3.311022, 0, 0.4117647, 1, 1,
0.273239, -0.5781142, 1.456276, 0, 0.4078431, 1, 1,
0.2745534, -1.286549, 3.360738, 0, 0.4, 1, 1,
0.2760533, 0.6668464, -1.441274, 0, 0.3921569, 1, 1,
0.2790149, -0.05538127, 1.9494, 0, 0.3882353, 1, 1,
0.2844172, 0.7668023, -1.563015, 0, 0.3803922, 1, 1,
0.2884001, -1.379083, 1.953264, 0, 0.3764706, 1, 1,
0.2924245, 1.655977, 1.823403, 0, 0.3686275, 1, 1,
0.2981368, 0.8470794, 0.1053402, 0, 0.3647059, 1, 1,
0.3021448, 0.5087336, 1.254039, 0, 0.3568628, 1, 1,
0.302682, -0.6949745, 2.560619, 0, 0.3529412, 1, 1,
0.3106655, 0.7539479, 2.434459, 0, 0.345098, 1, 1,
0.3123625, 1.390363, 0.9935663, 0, 0.3411765, 1, 1,
0.312605, 0.4609942, 0.8867052, 0, 0.3333333, 1, 1,
0.3131128, -1.331592, 3.36095, 0, 0.3294118, 1, 1,
0.3185895, 0.02406562, 0.3336404, 0, 0.3215686, 1, 1,
0.3188566, 0.2817508, 1.075848, 0, 0.3176471, 1, 1,
0.3274304, -2.956953, 3.898829, 0, 0.3098039, 1, 1,
0.3283565, 0.6852287, 1.184019, 0, 0.3058824, 1, 1,
0.3290061, -0.1204664, 1.611317, 0, 0.2980392, 1, 1,
0.3298543, 1.146861, -0.09427837, 0, 0.2901961, 1, 1,
0.3303839, -1.230198, 3.806184, 0, 0.2862745, 1, 1,
0.3330649, -2.049729, 4.570388, 0, 0.2784314, 1, 1,
0.3341857, 0.004932537, -0.9414026, 0, 0.2745098, 1, 1,
0.3361616, -0.4401597, 3.583927, 0, 0.2666667, 1, 1,
0.3388535, -0.9291899, 2.344658, 0, 0.2627451, 1, 1,
0.340704, 1.460507, 1.232358, 0, 0.254902, 1, 1,
0.3479407, -0.7689567, 0.8230616, 0, 0.2509804, 1, 1,
0.3483765, -0.4652056, 4.216167, 0, 0.2431373, 1, 1,
0.3526863, -0.9721996, 2.8172, 0, 0.2392157, 1, 1,
0.3536238, -0.3523036, 3.409332, 0, 0.2313726, 1, 1,
0.3539834, 0.3074507, 0.9707729, 0, 0.227451, 1, 1,
0.3578018, 2.358434, -0.1205546, 0, 0.2196078, 1, 1,
0.3595327, 1.539969, 0.9287937, 0, 0.2156863, 1, 1,
0.3607508, 0.5921392, 1.947222, 0, 0.2078431, 1, 1,
0.3631103, 1.165583, -1.614261, 0, 0.2039216, 1, 1,
0.3645549, 1.488215, 0.9889165, 0, 0.1960784, 1, 1,
0.3682725, -0.5186517, 1.772625, 0, 0.1882353, 1, 1,
0.3716683, 1.082488, -0.2703625, 0, 0.1843137, 1, 1,
0.3727122, -0.3643699, 1.694723, 0, 0.1764706, 1, 1,
0.3764915, -1.631247, 3.034822, 0, 0.172549, 1, 1,
0.3778125, 1.579805, 0.8128138, 0, 0.1647059, 1, 1,
0.3812645, -1.372844, 4.173838, 0, 0.1607843, 1, 1,
0.3814856, -0.8311149, 3.096281, 0, 0.1529412, 1, 1,
0.3846459, -0.02832308, 1.269869, 0, 0.1490196, 1, 1,
0.385649, -1.297242, 3.024418, 0, 0.1411765, 1, 1,
0.3870484, 0.5174847, 0.3283131, 0, 0.1372549, 1, 1,
0.3888938, -1.270481, 2.304568, 0, 0.1294118, 1, 1,
0.3928286, -0.5912555, 1.44009, 0, 0.1254902, 1, 1,
0.3928523, 0.2403708, 1.879214, 0, 0.1176471, 1, 1,
0.3954512, 0.8955506, -0.7661854, 0, 0.1137255, 1, 1,
0.3958382, 0.4713229, 1.5632, 0, 0.1058824, 1, 1,
0.3969551, 1.781745, -2.159569, 0, 0.09803922, 1, 1,
0.4037298, -1.454238, 3.008514, 0, 0.09411765, 1, 1,
0.4072971, -0.7027721, 5.099726, 0, 0.08627451, 1, 1,
0.4153633, -1.317888, 2.830353, 0, 0.08235294, 1, 1,
0.4196068, -0.8925921, 3.325656, 0, 0.07450981, 1, 1,
0.4217126, -0.0672058, 3.211419, 0, 0.07058824, 1, 1,
0.4247327, -0.4601415, 2.785315, 0, 0.0627451, 1, 1,
0.426146, -1.041618, 5.013204, 0, 0.05882353, 1, 1,
0.4267107, 0.4591586, 1.29029, 0, 0.05098039, 1, 1,
0.4301868, 0.2568592, 1.291727, 0, 0.04705882, 1, 1,
0.4311568, -0.3276476, 2.060415, 0, 0.03921569, 1, 1,
0.4327141, 0.9425223, 0.9684203, 0, 0.03529412, 1, 1,
0.4432541, 0.7304645, 0.1789295, 0, 0.02745098, 1, 1,
0.4433665, 1.501572, 0.5506749, 0, 0.02352941, 1, 1,
0.4447344, -0.9811475, 0.5292851, 0, 0.01568628, 1, 1,
0.4481498, 1.267895, -1.304196, 0, 0.01176471, 1, 1,
0.4495863, -0.6761703, 2.843327, 0, 0.003921569, 1, 1,
0.4574656, 1.069338, -1.06214, 0.003921569, 0, 1, 1,
0.4595627, 0.6042261, 0.3662539, 0.007843138, 0, 1, 1,
0.4623324, 0.3335577, 0.9345823, 0.01568628, 0, 1, 1,
0.463687, -0.8498134, 2.729867, 0.01960784, 0, 1, 1,
0.4675131, -0.795216, 3.113423, 0.02745098, 0, 1, 1,
0.4722056, -0.4495987, 1.660271, 0.03137255, 0, 1, 1,
0.4728523, 1.330125, 1.22929, 0.03921569, 0, 1, 1,
0.4757104, 1.210895, 1.137965, 0.04313726, 0, 1, 1,
0.476399, 1.759901, -1.648599, 0.05098039, 0, 1, 1,
0.4765716, -2.235375, 3.646752, 0.05490196, 0, 1, 1,
0.4830811, 0.1433041, 0.9372833, 0.0627451, 0, 1, 1,
0.4848476, -0.5440297, 2.569355, 0.06666667, 0, 1, 1,
0.486367, -0.3035692, 2.287305, 0.07450981, 0, 1, 1,
0.4886466, 0.3019383, 2.262859, 0.07843138, 0, 1, 1,
0.4916918, 0.3797526, -1.273687, 0.08627451, 0, 1, 1,
0.4930335, 1.673551, 2.838248, 0.09019608, 0, 1, 1,
0.4984375, -0.846877, 2.241872, 0.09803922, 0, 1, 1,
0.4997907, -0.4690616, -0.2635643, 0.1058824, 0, 1, 1,
0.5099132, -0.3856028, 3.253618, 0.1098039, 0, 1, 1,
0.5105973, 0.2010642, 1.795743, 0.1176471, 0, 1, 1,
0.513729, -0.1653747, 1.748964, 0.1215686, 0, 1, 1,
0.5150592, -0.7081073, 2.207024, 0.1294118, 0, 1, 1,
0.5163963, -1.000176, 3.077675, 0.1333333, 0, 1, 1,
0.518626, -1.435422, 2.94702, 0.1411765, 0, 1, 1,
0.5187048, -0.003767048, 0.5797784, 0.145098, 0, 1, 1,
0.5192782, -0.4475359, 4.786609, 0.1529412, 0, 1, 1,
0.5206665, 0.6842538, -0.09715326, 0.1568628, 0, 1, 1,
0.5266224, 0.1767202, 2.112131, 0.1647059, 0, 1, 1,
0.5270724, -0.1821348, 1.892315, 0.1686275, 0, 1, 1,
0.5291807, -0.582857, 2.998347, 0.1764706, 0, 1, 1,
0.5295256, 0.4161328, -0.1077526, 0.1803922, 0, 1, 1,
0.5301555, 0.1797962, -0.1157123, 0.1882353, 0, 1, 1,
0.5409043, 2.174585, -0.01005061, 0.1921569, 0, 1, 1,
0.5410674, 2.092867, 1.04293, 0.2, 0, 1, 1,
0.5420689, 0.1246389, 1.110725, 0.2078431, 0, 1, 1,
0.5422934, 1.114672, 0.8090726, 0.2117647, 0, 1, 1,
0.5461929, 0.2512528, 0.7903368, 0.2196078, 0, 1, 1,
0.5530627, -0.1797134, 1.14615, 0.2235294, 0, 1, 1,
0.5540384, -1.73788, 2.283046, 0.2313726, 0, 1, 1,
0.557106, 0.8290781, 2.599405, 0.2352941, 0, 1, 1,
0.5579723, -0.8986793, 4.582672, 0.2431373, 0, 1, 1,
0.5586442, 2.202492, -1.601563, 0.2470588, 0, 1, 1,
0.5620916, -0.4687043, 2.779602, 0.254902, 0, 1, 1,
0.5623485, -0.3691513, 3.416136, 0.2588235, 0, 1, 1,
0.5645815, -1.627003, 3.250795, 0.2666667, 0, 1, 1,
0.5647677, 1.061262, 1.641794, 0.2705882, 0, 1, 1,
0.5667642, 1.244444, -0.06504273, 0.2784314, 0, 1, 1,
0.5730333, 1.090579, 1.907644, 0.282353, 0, 1, 1,
0.5750486, 1.338123, 0.2606858, 0.2901961, 0, 1, 1,
0.5772426, 0.7069607, 0.1002835, 0.2941177, 0, 1, 1,
0.5854416, -0.05056054, 0.5844379, 0.3019608, 0, 1, 1,
0.5859184, -0.01503095, 0.5348613, 0.3098039, 0, 1, 1,
0.5878256, 3.190139, 0.2900468, 0.3137255, 0, 1, 1,
0.5925599, 0.5341258, -0.3270726, 0.3215686, 0, 1, 1,
0.5934174, 1.427425, 0.3952781, 0.3254902, 0, 1, 1,
0.593646, 1.50914, -0.5381806, 0.3333333, 0, 1, 1,
0.5956352, 2.994204, 0.1450734, 0.3372549, 0, 1, 1,
0.5995739, 0.1554485, 1.493333, 0.345098, 0, 1, 1,
0.5998452, 0.2179857, 1.26888, 0.3490196, 0, 1, 1,
0.6003644, 0.2576361, 0.482527, 0.3568628, 0, 1, 1,
0.6029577, -0.4210994, 0.7412356, 0.3607843, 0, 1, 1,
0.6060441, -0.604202, 1.874337, 0.3686275, 0, 1, 1,
0.6067551, 0.94657, -0.4926404, 0.372549, 0, 1, 1,
0.6149911, -0.07819284, 2.25347, 0.3803922, 0, 1, 1,
0.6220788, 1.241513, 1.92319, 0.3843137, 0, 1, 1,
0.6225055, -1.721763, 1.815102, 0.3921569, 0, 1, 1,
0.6239089, 1.037053, -0.6928784, 0.3960784, 0, 1, 1,
0.630959, 0.5399318, 1.589337, 0.4039216, 0, 1, 1,
0.6336925, 0.2739482, 1.951057, 0.4117647, 0, 1, 1,
0.6355481, -0.6432784, 3.604956, 0.4156863, 0, 1, 1,
0.6400712, -0.3613707, 2.63211, 0.4235294, 0, 1, 1,
0.641349, -0.1886075, 2.625702, 0.427451, 0, 1, 1,
0.6416103, 0.2793022, 1.345117, 0.4352941, 0, 1, 1,
0.6438701, 1.030716, 0.4070539, 0.4392157, 0, 1, 1,
0.6453916, -0.7685003, 1.968899, 0.4470588, 0, 1, 1,
0.6455341, 0.9859427, -1.670951, 0.4509804, 0, 1, 1,
0.647634, 2.086805, -1.36664, 0.4588235, 0, 1, 1,
0.6549402, 1.103655, 0.1534665, 0.4627451, 0, 1, 1,
0.658388, 1.491265, 0.9930204, 0.4705882, 0, 1, 1,
0.6628023, -0.5902007, 1.461838, 0.4745098, 0, 1, 1,
0.6657175, 1.129114, 0.7926613, 0.4823529, 0, 1, 1,
0.6672043, -1.08248, 2.74721, 0.4862745, 0, 1, 1,
0.6684104, 0.6344645, 1.59124, 0.4941176, 0, 1, 1,
0.6743068, -0.4828015, 1.706403, 0.5019608, 0, 1, 1,
0.6748809, -1.529158, 4.343016, 0.5058824, 0, 1, 1,
0.674966, 0.2595516, 2.04417, 0.5137255, 0, 1, 1,
0.6752352, -0.5206205, 3.641387, 0.5176471, 0, 1, 1,
0.6860705, 0.2600644, 0.570627, 0.5254902, 0, 1, 1,
0.6866274, -0.09312106, 1.277447, 0.5294118, 0, 1, 1,
0.6954879, 0.529815, 0.5456125, 0.5372549, 0, 1, 1,
0.7010191, -0.3403412, 2.317714, 0.5411765, 0, 1, 1,
0.7028719, 1.509546, -0.01403923, 0.5490196, 0, 1, 1,
0.7241396, 0.01201847, 2.536057, 0.5529412, 0, 1, 1,
0.7244447, 1.27616, 0.9156169, 0.5607843, 0, 1, 1,
0.7249052, -0.6885822, 1.665132, 0.5647059, 0, 1, 1,
0.7260513, 1.488138, -0.1732719, 0.572549, 0, 1, 1,
0.7328812, -0.7573255, 1.624755, 0.5764706, 0, 1, 1,
0.7353423, -0.7750127, 4.163772, 0.5843138, 0, 1, 1,
0.75129, -0.2149846, 1.644744, 0.5882353, 0, 1, 1,
0.752, -1.677226, 2.851586, 0.5960785, 0, 1, 1,
0.7534394, -0.2621215, 2.162764, 0.6039216, 0, 1, 1,
0.7534649, 0.7465612, 1.781188, 0.6078432, 0, 1, 1,
0.7570457, 0.3889806, 0.6989084, 0.6156863, 0, 1, 1,
0.7578004, -1.53563, 2.61719, 0.6196079, 0, 1, 1,
0.7582083, -2.820945, 3.183218, 0.627451, 0, 1, 1,
0.7607778, 0.3645752, 1.546323, 0.6313726, 0, 1, 1,
0.7619908, -0.06221499, 1.114241, 0.6392157, 0, 1, 1,
0.7623393, 0.8663855, 2.205405, 0.6431373, 0, 1, 1,
0.7647926, 0.604831, 0.6858302, 0.6509804, 0, 1, 1,
0.7655031, -0.6322659, 0.4284121, 0.654902, 0, 1, 1,
0.772189, 1.779289, 0.4025126, 0.6627451, 0, 1, 1,
0.7791197, 0.3617347, 0.2068336, 0.6666667, 0, 1, 1,
0.7809955, 0.32008, 0.2796978, 0.6745098, 0, 1, 1,
0.7815405, 1.177944, -0.792773, 0.6784314, 0, 1, 1,
0.7839258, 1.185047, 0.5835599, 0.6862745, 0, 1, 1,
0.7870097, 1.014939, -0.6249771, 0.6901961, 0, 1, 1,
0.7914217, -0.5209654, 3.818165, 0.6980392, 0, 1, 1,
0.7951211, -0.7117053, 3.88404, 0.7058824, 0, 1, 1,
0.7963195, 2.014139, -0.1635782, 0.7098039, 0, 1, 1,
0.8003424, -1.082838, 2.216645, 0.7176471, 0, 1, 1,
0.8079501, -0.573636, 2.809421, 0.7215686, 0, 1, 1,
0.8112523, 1.047814, 1.406242, 0.7294118, 0, 1, 1,
0.8119524, -1.060079, 2.25845, 0.7333333, 0, 1, 1,
0.8145027, -0.09582385, 3.15905, 0.7411765, 0, 1, 1,
0.8190202, 0.3647833, -0.004247858, 0.7450981, 0, 1, 1,
0.8250437, 0.6073642, 0.146456, 0.7529412, 0, 1, 1,
0.8262891, -0.1478658, 2.005194, 0.7568628, 0, 1, 1,
0.8265809, -1.930811, 2.210103, 0.7647059, 0, 1, 1,
0.82807, 0.6879909, 1.038763, 0.7686275, 0, 1, 1,
0.8335115, 0.008932558, 1.273115, 0.7764706, 0, 1, 1,
0.8364354, 1.61101, 1.72295, 0.7803922, 0, 1, 1,
0.8469299, -0.6349081, 1.341223, 0.7882353, 0, 1, 1,
0.8480378, -1.225136, 3.163041, 0.7921569, 0, 1, 1,
0.851952, 1.72853, 1.157055, 0.8, 0, 1, 1,
0.8619255, 1.783872, -1.066954, 0.8078431, 0, 1, 1,
0.8747435, 1.002821, 0.6539583, 0.8117647, 0, 1, 1,
0.8753774, 0.9020112, -0.2584108, 0.8196079, 0, 1, 1,
0.8763627, -0.4341737, 0.9495111, 0.8235294, 0, 1, 1,
0.8895252, -1.360932, 1.553244, 0.8313726, 0, 1, 1,
0.889973, -0.1067959, 1.015766, 0.8352941, 0, 1, 1,
0.8909922, 0.02622099, 3.43251, 0.8431373, 0, 1, 1,
0.9080942, 0.6614978, 1.328536, 0.8470588, 0, 1, 1,
0.912268, 1.677117, 1.996112, 0.854902, 0, 1, 1,
0.926103, 0.9615571, 1.45404, 0.8588235, 0, 1, 1,
0.9340487, -0.1142706, 1.900038, 0.8666667, 0, 1, 1,
0.9345061, -0.1148468, 1.656245, 0.8705882, 0, 1, 1,
0.9364696, -0.7798443, 3.319219, 0.8784314, 0, 1, 1,
0.9369231, 0.02454619, 0.9507842, 0.8823529, 0, 1, 1,
0.9372135, 0.5110711, 1.052433, 0.8901961, 0, 1, 1,
0.9372195, 0.3383276, 1.728862, 0.8941177, 0, 1, 1,
0.9412701, 0.5918031, 2.303513, 0.9019608, 0, 1, 1,
0.9479715, 2.384073, 1.711206, 0.9098039, 0, 1, 1,
0.9624806, 0.01386836, 1.489005, 0.9137255, 0, 1, 1,
0.9652228, -1.202072, 2.808184, 0.9215686, 0, 1, 1,
0.9657338, 0.4289421, 0.9045207, 0.9254902, 0, 1, 1,
0.9658486, 0.624772, 0.3681004, 0.9333333, 0, 1, 1,
0.9664065, 0.6007523, 2.032555, 0.9372549, 0, 1, 1,
0.9781845, 0.4048547, 2.430719, 0.945098, 0, 1, 1,
0.9798819, 0.953548, 0.0175822, 0.9490196, 0, 1, 1,
0.9823965, 0.5168761, 0.9775267, 0.9568627, 0, 1, 1,
0.9830441, 2.142083, -0.08144846, 0.9607843, 0, 1, 1,
0.9835381, 0.2289432, 0.6420785, 0.9686275, 0, 1, 1,
0.9843972, -0.3460838, 3.920723, 0.972549, 0, 1, 1,
0.9882743, -0.005386287, 1.896088, 0.9803922, 0, 1, 1,
0.9887333, -0.8665538, 0.6428422, 0.9843137, 0, 1, 1,
0.9903145, -0.3416688, 2.850978, 0.9921569, 0, 1, 1,
0.9917459, 0.8454681, -0.7427676, 0.9960784, 0, 1, 1,
0.9949304, -0.8451063, 2.165104, 1, 0, 0.9960784, 1,
0.9980889, -0.3766622, 1.094917, 1, 0, 0.9882353, 1,
1.000764, 1.124544, 1.04095, 1, 0, 0.9843137, 1,
1.0117, -0.6031222, 1.276538, 1, 0, 0.9764706, 1,
1.025488, 0.4392169, 1.603867, 1, 0, 0.972549, 1,
1.027634, -1.335725, 2.14613, 1, 0, 0.9647059, 1,
1.027636, -0.6753273, 0.9836702, 1, 0, 0.9607843, 1,
1.033813, -0.3442931, 1.586934, 1, 0, 0.9529412, 1,
1.034578, 0.1515024, 0.2252862, 1, 0, 0.9490196, 1,
1.036328, -0.6193991, 1.975365, 1, 0, 0.9411765, 1,
1.036356, 1.6267, -0.2543893, 1, 0, 0.9372549, 1,
1.040639, 0.7543398, 1.005342, 1, 0, 0.9294118, 1,
1.042933, 0.3979304, 0.8177231, 1, 0, 0.9254902, 1,
1.054403, -0.5420171, 1.556639, 1, 0, 0.9176471, 1,
1.056648, 0.7747668, -0.3179933, 1, 0, 0.9137255, 1,
1.060883, -0.1254833, 2.31352, 1, 0, 0.9058824, 1,
1.064162, 0.8585503, -0.6823445, 1, 0, 0.9019608, 1,
1.064212, -1.714708, 2.838132, 1, 0, 0.8941177, 1,
1.065112, 0.9689451, 0.02157406, 1, 0, 0.8862745, 1,
1.066441, 0.3048061, 1.011698, 1, 0, 0.8823529, 1,
1.06743, -0.5404286, 2.006092, 1, 0, 0.8745098, 1,
1.070293, 1.425842, -0.06802399, 1, 0, 0.8705882, 1,
1.078405, -0.08236887, 1.432938, 1, 0, 0.8627451, 1,
1.083282, 0.7755103, 0.6064011, 1, 0, 0.8588235, 1,
1.084252, 0.9351591, -0.09314933, 1, 0, 0.8509804, 1,
1.084522, -0.2510649, 2.042205, 1, 0, 0.8470588, 1,
1.084641, -0.578033, 0.5746885, 1, 0, 0.8392157, 1,
1.092262, -1.851533, 2.185255, 1, 0, 0.8352941, 1,
1.094574, 2.266335, 0.6108873, 1, 0, 0.827451, 1,
1.098738, -0.8834906, 3.379369, 1, 0, 0.8235294, 1,
1.10381, -0.1092245, 2.300421, 1, 0, 0.8156863, 1,
1.106375, 0.5450305, 0.4774669, 1, 0, 0.8117647, 1,
1.11146, -1.2842, 1.942249, 1, 0, 0.8039216, 1,
1.121265, 0.04929647, 2.370676, 1, 0, 0.7960784, 1,
1.125341, -0.4039725, 1.653479, 1, 0, 0.7921569, 1,
1.12696, -0.1574875, 3.158748, 1, 0, 0.7843137, 1,
1.129319, 1.588871, 1.693357, 1, 0, 0.7803922, 1,
1.133536, -0.5441608, 2.893616, 1, 0, 0.772549, 1,
1.13476, 0.07482545, 1.329918, 1, 0, 0.7686275, 1,
1.14542, 0.7071152, -0.2504945, 1, 0, 0.7607843, 1,
1.15203, 0.6960323, 0.09685669, 1, 0, 0.7568628, 1,
1.152349, 0.9229655, 0.8327674, 1, 0, 0.7490196, 1,
1.161469, 0.9794963, 0.9653096, 1, 0, 0.7450981, 1,
1.206129, -1.306836, 1.83408, 1, 0, 0.7372549, 1,
1.211255, -0.9915992, 1.973563, 1, 0, 0.7333333, 1,
1.215529, 1.650527, 1.833069, 1, 0, 0.7254902, 1,
1.219428, -0.32118, 2.655184, 1, 0, 0.7215686, 1,
1.220328, -0.06792381, 0.5736913, 1, 0, 0.7137255, 1,
1.22944, 0.8513101, 1.847241, 1, 0, 0.7098039, 1,
1.231794, 2.656384, 0.9173204, 1, 0, 0.7019608, 1,
1.234593, -0.3141998, 1.494262, 1, 0, 0.6941177, 1,
1.243218, 0.2255865, 1.592673, 1, 0, 0.6901961, 1,
1.250968, -0.5051646, 1.263264, 1, 0, 0.682353, 1,
1.254512, 0.1082231, 1.064342, 1, 0, 0.6784314, 1,
1.255338, 0.06047443, 1.963295, 1, 0, 0.6705883, 1,
1.263626, -0.4371122, 0.5140234, 1, 0, 0.6666667, 1,
1.266145, -0.2505963, 4.017488, 1, 0, 0.6588235, 1,
1.27647, 0.3157751, 1.302477, 1, 0, 0.654902, 1,
1.280865, 2.076662, 1.25786, 1, 0, 0.6470588, 1,
1.287188, -0.8017755, 2.576824, 1, 0, 0.6431373, 1,
1.288496, -0.6900793, 1.405068, 1, 0, 0.6352941, 1,
1.292078, -0.4624287, 1.735686, 1, 0, 0.6313726, 1,
1.294738, -1.191563, 1.894518, 1, 0, 0.6235294, 1,
1.297845, -1.07544, 1.676764, 1, 0, 0.6196079, 1,
1.310736, 1.150941, 0.4987562, 1, 0, 0.6117647, 1,
1.311067, 1.53337, 0.1173393, 1, 0, 0.6078432, 1,
1.312838, 0.5322492, 1.734119, 1, 0, 0.6, 1,
1.314619, 0.9206734, 1.342517, 1, 0, 0.5921569, 1,
1.321313, 0.1507329, 2.025021, 1, 0, 0.5882353, 1,
1.32528, 1.674966, -1.068936, 1, 0, 0.5803922, 1,
1.332872, 0.9800606, 1.064677, 1, 0, 0.5764706, 1,
1.345022, -0.1910772, 1.006646, 1, 0, 0.5686275, 1,
1.366054, 2.029435, 0.1862595, 1, 0, 0.5647059, 1,
1.367367, -1.645365, 2.201294, 1, 0, 0.5568628, 1,
1.368765, -0.1483921, 2.225478, 1, 0, 0.5529412, 1,
1.3694, 0.2019605, 0.5441796, 1, 0, 0.5450981, 1,
1.371459, 0.5260792, 2.299008, 1, 0, 0.5411765, 1,
1.373719, -1.573655, 1.153955, 1, 0, 0.5333334, 1,
1.376219, -0.6151786, 2.281265, 1, 0, 0.5294118, 1,
1.389552, 0.4151533, 1.744413, 1, 0, 0.5215687, 1,
1.394435, -1.932661, 3.729514, 1, 0, 0.5176471, 1,
1.405184, -0.02470539, 3.926139, 1, 0, 0.509804, 1,
1.408288, 1.441047, 1.019553, 1, 0, 0.5058824, 1,
1.414512, -1.430364, 3.034592, 1, 0, 0.4980392, 1,
1.41747, 0.9032843, -0.9537889, 1, 0, 0.4901961, 1,
1.439525, 1.209331, 0.2616704, 1, 0, 0.4862745, 1,
1.453521, -0.6072721, 2.218721, 1, 0, 0.4784314, 1,
1.453564, 1.348011, 0.8237885, 1, 0, 0.4745098, 1,
1.453613, 1.20983, 2.286402, 1, 0, 0.4666667, 1,
1.45575, -0.903785, 3.407508, 1, 0, 0.4627451, 1,
1.474217, -1.772997, 2.195336, 1, 0, 0.454902, 1,
1.480495, -0.2883271, 3.482658, 1, 0, 0.4509804, 1,
1.483876, -0.8857394, 3.225905, 1, 0, 0.4431373, 1,
1.499858, -0.4139283, 2.261776, 1, 0, 0.4392157, 1,
1.508967, -0.8397155, 2.266015, 1, 0, 0.4313726, 1,
1.51086, 0.07087966, 2.144503, 1, 0, 0.427451, 1,
1.512, 1.373371, -1.344844, 1, 0, 0.4196078, 1,
1.513793, 0.5253155, 2.310898, 1, 0, 0.4156863, 1,
1.514306, 1.161534, 1.523138, 1, 0, 0.4078431, 1,
1.531288, 0.2599436, 2.449552, 1, 0, 0.4039216, 1,
1.532033, 0.7582285, 2.475918, 1, 0, 0.3960784, 1,
1.539024, 0.6204877, 1.583315, 1, 0, 0.3882353, 1,
1.547582, 1.268903, 0.2242051, 1, 0, 0.3843137, 1,
1.553684, -0.2638476, 2.726662, 1, 0, 0.3764706, 1,
1.556383, -1.627867, 1.575121, 1, 0, 0.372549, 1,
1.556446, 1.15118, 1.277754, 1, 0, 0.3647059, 1,
1.56123, -0.6892058, 2.968129, 1, 0, 0.3607843, 1,
1.564952, 0.3748981, 3.26484, 1, 0, 0.3529412, 1,
1.566722, 1.727131, -0.1903172, 1, 0, 0.3490196, 1,
1.567591, 1.40016, 1.192438, 1, 0, 0.3411765, 1,
1.587393, 0.1764084, 0.8245351, 1, 0, 0.3372549, 1,
1.595248, 0.6629262, 2.103934, 1, 0, 0.3294118, 1,
1.601813, 0.6390566, 1.639931, 1, 0, 0.3254902, 1,
1.60183, -1.543095, 3.364457, 1, 0, 0.3176471, 1,
1.611578, 2.201818, -0.2289416, 1, 0, 0.3137255, 1,
1.612144, -0.5830572, 1.634534, 1, 0, 0.3058824, 1,
1.61663, -0.2649662, 0.5940243, 1, 0, 0.2980392, 1,
1.621313, -0.3395571, 2.453568, 1, 0, 0.2941177, 1,
1.624847, -0.6544169, 2.897187, 1, 0, 0.2862745, 1,
1.630642, 0.8825782, 1.53133, 1, 0, 0.282353, 1,
1.642435, -0.6720496, 1.071017, 1, 0, 0.2745098, 1,
1.642695, 0.8729742, -0.03077605, 1, 0, 0.2705882, 1,
1.648376, 0.4296556, 1.728673, 1, 0, 0.2627451, 1,
1.65941, 0.3264197, 2.040792, 1, 0, 0.2588235, 1,
1.672315, 0.1633502, 1.598151, 1, 0, 0.2509804, 1,
1.674756, -0.8176204, 1.007087, 1, 0, 0.2470588, 1,
1.681279, 0.0537112, 3.398808, 1, 0, 0.2392157, 1,
1.688276, 0.1086736, 0.5472831, 1, 0, 0.2352941, 1,
1.698052, -0.1388866, 2.058951, 1, 0, 0.227451, 1,
1.703556, 1.177792, 0.2082639, 1, 0, 0.2235294, 1,
1.711318, -0.3913372, 2.306289, 1, 0, 0.2156863, 1,
1.71743, -0.2990004, 2.419018, 1, 0, 0.2117647, 1,
1.72654, 1.844981, 0.1557147, 1, 0, 0.2039216, 1,
1.746195, 0.1025676, 0.8399969, 1, 0, 0.1960784, 1,
1.749578, 0.8529522, 1.37777, 1, 0, 0.1921569, 1,
1.756421, 0.9272589, 1.074845, 1, 0, 0.1843137, 1,
1.767486, 0.3209148, 1.944668, 1, 0, 0.1803922, 1,
1.767909, 0.7219743, 0.7839852, 1, 0, 0.172549, 1,
1.777551, 0.4154119, 2.093908, 1, 0, 0.1686275, 1,
1.781549, 0.9144984, 1.03983, 1, 0, 0.1607843, 1,
1.798974, 2.721602, 1.49209, 1, 0, 0.1568628, 1,
1.84524, -0.7633726, 2.387829, 1, 0, 0.1490196, 1,
1.888863, -0.8747615, 2.309405, 1, 0, 0.145098, 1,
1.89339, -0.1130924, 0.4317183, 1, 0, 0.1372549, 1,
1.913434, 0.03732095, 0.1734091, 1, 0, 0.1333333, 1,
1.923327, -0.499393, 1.539069, 1, 0, 0.1254902, 1,
2.017521, 2.687994, 0.282515, 1, 0, 0.1215686, 1,
2.075135, 0.5845707, -0.6032098, 1, 0, 0.1137255, 1,
2.079854, 0.1017351, 1.786785, 1, 0, 0.1098039, 1,
2.080703, 0.41246, 3.607725, 1, 0, 0.1019608, 1,
2.086, 0.9355952, 2.388659, 1, 0, 0.09411765, 1,
2.088424, 0.1343924, 2.02064, 1, 0, 0.09019608, 1,
2.127202, -1.606466, 2.49795, 1, 0, 0.08235294, 1,
2.188137, 0.8588939, 0.645723, 1, 0, 0.07843138, 1,
2.233803, -0.2580776, 4.367302, 1, 0, 0.07058824, 1,
2.258272, -2.005079, 1.128799, 1, 0, 0.06666667, 1,
2.283862, 0.7297463, 0.6698977, 1, 0, 0.05882353, 1,
2.300233, 1.143542, 2.987835, 1, 0, 0.05490196, 1,
2.325248, -0.3765667, 1.875349, 1, 0, 0.04705882, 1,
2.400701, 0.1048956, 1.720942, 1, 0, 0.04313726, 1,
2.433943, -0.1360865, 1.845612, 1, 0, 0.03529412, 1,
2.463041, -0.7160629, 0.2367532, 1, 0, 0.03137255, 1,
2.554469, -0.7545926, 2.250854, 1, 0, 0.02352941, 1,
2.794044, -1.863509, 1.77656, 1, 0, 0.01960784, 1,
2.975589, -0.02188171, 1.846484, 1, 0, 0.01176471, 1,
3.070298, -0.646305, 1.489603, 1, 0, 0.007843138, 1
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
-0.1714962, -3.998885, -6.76715, 0, -0.5, 0.5, 0.5,
-0.1714962, -3.998885, -6.76715, 1, -0.5, 0.5, 0.5,
-0.1714962, -3.998885, -6.76715, 1, 1.5, 0.5, 0.5,
-0.1714962, -3.998885, -6.76715, 0, 1.5, 0.5, 0.5
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
-4.512259, 0.1165928, -6.76715, 0, -0.5, 0.5, 0.5,
-4.512259, 0.1165928, -6.76715, 1, -0.5, 0.5, 0.5,
-4.512259, 0.1165928, -6.76715, 1, 1.5, 0.5, 0.5,
-4.512259, 0.1165928, -6.76715, 0, 1.5, 0.5, 0.5
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
-4.512259, -3.998885, 0.02624321, 0, -0.5, 0.5, 0.5,
-4.512259, -3.998885, 0.02624321, 1, -0.5, 0.5, 0.5,
-4.512259, -3.998885, 0.02624321, 1, 1.5, 0.5, 0.5,
-4.512259, -3.998885, 0.02624321, 0, 1.5, 0.5, 0.5
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
-3, -3.04916, -5.199444,
3, -3.04916, -5.199444,
-3, -3.04916, -5.199444,
-3, -3.207447, -5.460729,
-2, -3.04916, -5.199444,
-2, -3.207447, -5.460729,
-1, -3.04916, -5.199444,
-1, -3.207447, -5.460729,
0, -3.04916, -5.199444,
0, -3.207447, -5.460729,
1, -3.04916, -5.199444,
1, -3.207447, -5.460729,
2, -3.04916, -5.199444,
2, -3.207447, -5.460729,
3, -3.04916, -5.199444,
3, -3.207447, -5.460729
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
-3, -3.524022, -5.983297, 0, -0.5, 0.5, 0.5,
-3, -3.524022, -5.983297, 1, -0.5, 0.5, 0.5,
-3, -3.524022, -5.983297, 1, 1.5, 0.5, 0.5,
-3, -3.524022, -5.983297, 0, 1.5, 0.5, 0.5,
-2, -3.524022, -5.983297, 0, -0.5, 0.5, 0.5,
-2, -3.524022, -5.983297, 1, -0.5, 0.5, 0.5,
-2, -3.524022, -5.983297, 1, 1.5, 0.5, 0.5,
-2, -3.524022, -5.983297, 0, 1.5, 0.5, 0.5,
-1, -3.524022, -5.983297, 0, -0.5, 0.5, 0.5,
-1, -3.524022, -5.983297, 1, -0.5, 0.5, 0.5,
-1, -3.524022, -5.983297, 1, 1.5, 0.5, 0.5,
-1, -3.524022, -5.983297, 0, 1.5, 0.5, 0.5,
0, -3.524022, -5.983297, 0, -0.5, 0.5, 0.5,
0, -3.524022, -5.983297, 1, -0.5, 0.5, 0.5,
0, -3.524022, -5.983297, 1, 1.5, 0.5, 0.5,
0, -3.524022, -5.983297, 0, 1.5, 0.5, 0.5,
1, -3.524022, -5.983297, 0, -0.5, 0.5, 0.5,
1, -3.524022, -5.983297, 1, -0.5, 0.5, 0.5,
1, -3.524022, -5.983297, 1, 1.5, 0.5, 0.5,
1, -3.524022, -5.983297, 0, 1.5, 0.5, 0.5,
2, -3.524022, -5.983297, 0, -0.5, 0.5, 0.5,
2, -3.524022, -5.983297, 1, -0.5, 0.5, 0.5,
2, -3.524022, -5.983297, 1, 1.5, 0.5, 0.5,
2, -3.524022, -5.983297, 0, 1.5, 0.5, 0.5,
3, -3.524022, -5.983297, 0, -0.5, 0.5, 0.5,
3, -3.524022, -5.983297, 1, -0.5, 0.5, 0.5,
3, -3.524022, -5.983297, 1, 1.5, 0.5, 0.5,
3, -3.524022, -5.983297, 0, 1.5, 0.5, 0.5
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
-3.510544, -2, -5.199444,
-3.510544, 3, -5.199444,
-3.510544, -2, -5.199444,
-3.677497, -2, -5.460729,
-3.510544, -1, -5.199444,
-3.677497, -1, -5.460729,
-3.510544, 0, -5.199444,
-3.677497, 0, -5.460729,
-3.510544, 1, -5.199444,
-3.677497, 1, -5.460729,
-3.510544, 2, -5.199444,
-3.677497, 2, -5.460729,
-3.510544, 3, -5.199444,
-3.677497, 3, -5.460729
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
-4.011402, -2, -5.983297, 0, -0.5, 0.5, 0.5,
-4.011402, -2, -5.983297, 1, -0.5, 0.5, 0.5,
-4.011402, -2, -5.983297, 1, 1.5, 0.5, 0.5,
-4.011402, -2, -5.983297, 0, 1.5, 0.5, 0.5,
-4.011402, -1, -5.983297, 0, -0.5, 0.5, 0.5,
-4.011402, -1, -5.983297, 1, -0.5, 0.5, 0.5,
-4.011402, -1, -5.983297, 1, 1.5, 0.5, 0.5,
-4.011402, -1, -5.983297, 0, 1.5, 0.5, 0.5,
-4.011402, 0, -5.983297, 0, -0.5, 0.5, 0.5,
-4.011402, 0, -5.983297, 1, -0.5, 0.5, 0.5,
-4.011402, 0, -5.983297, 1, 1.5, 0.5, 0.5,
-4.011402, 0, -5.983297, 0, 1.5, 0.5, 0.5,
-4.011402, 1, -5.983297, 0, -0.5, 0.5, 0.5,
-4.011402, 1, -5.983297, 1, -0.5, 0.5, 0.5,
-4.011402, 1, -5.983297, 1, 1.5, 0.5, 0.5,
-4.011402, 1, -5.983297, 0, 1.5, 0.5, 0.5,
-4.011402, 2, -5.983297, 0, -0.5, 0.5, 0.5,
-4.011402, 2, -5.983297, 1, -0.5, 0.5, 0.5,
-4.011402, 2, -5.983297, 1, 1.5, 0.5, 0.5,
-4.011402, 2, -5.983297, 0, 1.5, 0.5, 0.5,
-4.011402, 3, -5.983297, 0, -0.5, 0.5, 0.5,
-4.011402, 3, -5.983297, 1, -0.5, 0.5, 0.5,
-4.011402, 3, -5.983297, 1, 1.5, 0.5, 0.5,
-4.011402, 3, -5.983297, 0, 1.5, 0.5, 0.5
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
-3.510544, -3.04916, -4,
-3.510544, -3.04916, 4,
-3.510544, -3.04916, -4,
-3.677497, -3.207447, -4,
-3.510544, -3.04916, -2,
-3.677497, -3.207447, -2,
-3.510544, -3.04916, 0,
-3.677497, -3.207447, 0,
-3.510544, -3.04916, 2,
-3.677497, -3.207447, 2,
-3.510544, -3.04916, 4,
-3.677497, -3.207447, 4
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
-4.011402, -3.524022, -4, 0, -0.5, 0.5, 0.5,
-4.011402, -3.524022, -4, 1, -0.5, 0.5, 0.5,
-4.011402, -3.524022, -4, 1, 1.5, 0.5, 0.5,
-4.011402, -3.524022, -4, 0, 1.5, 0.5, 0.5,
-4.011402, -3.524022, -2, 0, -0.5, 0.5, 0.5,
-4.011402, -3.524022, -2, 1, -0.5, 0.5, 0.5,
-4.011402, -3.524022, -2, 1, 1.5, 0.5, 0.5,
-4.011402, -3.524022, -2, 0, 1.5, 0.5, 0.5,
-4.011402, -3.524022, 0, 0, -0.5, 0.5, 0.5,
-4.011402, -3.524022, 0, 1, -0.5, 0.5, 0.5,
-4.011402, -3.524022, 0, 1, 1.5, 0.5, 0.5,
-4.011402, -3.524022, 0, 0, 1.5, 0.5, 0.5,
-4.011402, -3.524022, 2, 0, -0.5, 0.5, 0.5,
-4.011402, -3.524022, 2, 1, -0.5, 0.5, 0.5,
-4.011402, -3.524022, 2, 1, 1.5, 0.5, 0.5,
-4.011402, -3.524022, 2, 0, 1.5, 0.5, 0.5,
-4.011402, -3.524022, 4, 0, -0.5, 0.5, 0.5,
-4.011402, -3.524022, 4, 1, -0.5, 0.5, 0.5,
-4.011402, -3.524022, 4, 1, 1.5, 0.5, 0.5,
-4.011402, -3.524022, 4, 0, 1.5, 0.5, 0.5
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
-3.510544, -3.04916, -5.199444,
-3.510544, 3.282345, -5.199444,
-3.510544, -3.04916, 5.251931,
-3.510544, 3.282345, 5.251931,
-3.510544, -3.04916, -5.199444,
-3.510544, -3.04916, 5.251931,
-3.510544, 3.282345, -5.199444,
-3.510544, 3.282345, 5.251931,
-3.510544, -3.04916, -5.199444,
3.167552, -3.04916, -5.199444,
-3.510544, -3.04916, 5.251931,
3.167552, -3.04916, 5.251931,
-3.510544, 3.282345, -5.199444,
3.167552, 3.282345, -5.199444,
-3.510544, 3.282345, 5.251931,
3.167552, 3.282345, 5.251931,
3.167552, -3.04916, -5.199444,
3.167552, 3.282345, -5.199444,
3.167552, -3.04916, 5.251931,
3.167552, 3.282345, 5.251931,
3.167552, -3.04916, -5.199444,
3.167552, -3.04916, 5.251931,
3.167552, 3.282345, -5.199444,
3.167552, 3.282345, 5.251931
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
var radius = 7.435881;
var distance = 33.08307;
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
mvMatrix.translate( 0.1714962, -0.1165928, -0.02624321 );
mvMatrix.scale( 1.203909, 1.269812, 0.7692596 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.08307);
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
Ethylone<-read.table("Ethylone.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Ethylone$V2
```

```
## Error in eval(expr, envir, enclos): object 'Ethylone' not found
```

```r
y<-Ethylone$V3
```

```
## Error in eval(expr, envir, enclos): object 'Ethylone' not found
```

```r
z<-Ethylone$V4
```

```
## Error in eval(expr, envir, enclos): object 'Ethylone' not found
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
-3.413291, -1.991016, -2.555044, 0, 0, 1, 1, 1,
-3.252448, 2.265224, -0.5105068, 1, 0, 0, 1, 1,
-2.843843, -0.09428636, -1.576035, 1, 0, 0, 1, 1,
-2.632765, -0.182487, -0.5913793, 1, 0, 0, 1, 1,
-2.589067, -0.03109703, -1.272759, 1, 0, 0, 1, 1,
-2.491928, -0.8346156, -0.9184483, 1, 0, 0, 1, 1,
-2.423883, 1.212291, -1.224788, 0, 0, 0, 1, 1,
-2.38783, 0.3371295, -2.233829, 0, 0, 0, 1, 1,
-2.344071, -0.9815825, -2.11643, 0, 0, 0, 1, 1,
-2.337545, 0.6483107, -1.050409, 0, 0, 0, 1, 1,
-2.336222, -1.491561, -2.684922, 0, 0, 0, 1, 1,
-2.298151, 0.05675332, -1.306593, 0, 0, 0, 1, 1,
-2.258634, -0.1059649, -0.2032179, 0, 0, 0, 1, 1,
-2.249988, -0.421553, -1.929929, 1, 1, 1, 1, 1,
-2.15856, -0.271738, -1.625837, 1, 1, 1, 1, 1,
-2.158163, -1.33375, -2.662432, 1, 1, 1, 1, 1,
-2.138956, 1.753757, 0.2162815, 1, 1, 1, 1, 1,
-2.133668, 0.392249, -2.626589, 1, 1, 1, 1, 1,
-2.100976, -0.02118339, -2.279506, 1, 1, 1, 1, 1,
-2.094884, 0.5787261, 0.265313, 1, 1, 1, 1, 1,
-2.047781, -2.729141, -2.521586, 1, 1, 1, 1, 1,
-2.021223, 0.8831418, -1.298361, 1, 1, 1, 1, 1,
-2.003618, -0.752933, -1.599476, 1, 1, 1, 1, 1,
-2.002645, 0.07917547, -2.633011, 1, 1, 1, 1, 1,
-1.991205, 0.1928791, -2.075465, 1, 1, 1, 1, 1,
-1.953758, 1.629537, -2.352249, 1, 1, 1, 1, 1,
-1.951494, 0.2243679, -1.836151, 1, 1, 1, 1, 1,
-1.950281, 0.2369708, -0.4380629, 1, 1, 1, 1, 1,
-1.901962, -1.486062, -1.840158, 0, 0, 1, 1, 1,
-1.879405, 0.3461608, -1.292125, 1, 0, 0, 1, 1,
-1.879084, -0.7250234, -2.699272, 1, 0, 0, 1, 1,
-1.869485, -1.157145, -2.781215, 1, 0, 0, 1, 1,
-1.852712, 0.5698868, -0.771548, 1, 0, 0, 1, 1,
-1.848539, -0.8017038, -2.277335, 1, 0, 0, 1, 1,
-1.844023, 0.02871326, -0.7235504, 0, 0, 0, 1, 1,
-1.806723, -0.2514568, -1.939718, 0, 0, 0, 1, 1,
-1.800581, 0.4543017, -1.034218, 0, 0, 0, 1, 1,
-1.780592, -1.887408, -4.398642, 0, 0, 0, 1, 1,
-1.767164, 0.9340199, -0.4476033, 0, 0, 0, 1, 1,
-1.766647, -0.5544258, -1.76028, 0, 0, 0, 1, 1,
-1.75077, -0.6148578, -3.88241, 0, 0, 0, 1, 1,
-1.7463, 0.7300757, -1.302739, 1, 1, 1, 1, 1,
-1.739445, 0.8392543, 0.5043876, 1, 1, 1, 1, 1,
-1.732426, -0.4101329, -0.9061368, 1, 1, 1, 1, 1,
-1.722022, -1.088666, -3.683359, 1, 1, 1, 1, 1,
-1.680398, 0.4826794, -1.920691, 1, 1, 1, 1, 1,
-1.67995, -1.741766, -3.721816, 1, 1, 1, 1, 1,
-1.631031, 0.6116493, 0.5958204, 1, 1, 1, 1, 1,
-1.612805, 0.07148504, 0.1446097, 1, 1, 1, 1, 1,
-1.611913, -0.527412, -2.419197, 1, 1, 1, 1, 1,
-1.609501, -1.159364, -1.820127, 1, 1, 1, 1, 1,
-1.602001, -0.5283296, -2.378011, 1, 1, 1, 1, 1,
-1.601421, -0.03757634, -2.573043, 1, 1, 1, 1, 1,
-1.598771, 0.524736, -0.2634895, 1, 1, 1, 1, 1,
-1.587353, -0.1012958, -4.227289, 1, 1, 1, 1, 1,
-1.584169, -0.9078218, -1.145401, 1, 1, 1, 1, 1,
-1.577752, 1.887852, -0.1865109, 0, 0, 1, 1, 1,
-1.559573, -0.846912, -1.638533, 1, 0, 0, 1, 1,
-1.554448, 1.038112, -0.906312, 1, 0, 0, 1, 1,
-1.552021, 1.933454, 0.5035266, 1, 0, 0, 1, 1,
-1.55167, 0.194796, -1.896912, 1, 0, 0, 1, 1,
-1.544686, 1.183906, -1.984459, 1, 0, 0, 1, 1,
-1.534012, -1.471762, -0.5502201, 0, 0, 0, 1, 1,
-1.526329, -0.1253371, -2.28466, 0, 0, 0, 1, 1,
-1.507361, 1.308396, -1.567797, 0, 0, 0, 1, 1,
-1.505026, 0.5099416, -2.185082, 0, 0, 0, 1, 1,
-1.502596, -0.4059055, -0.4563487, 0, 0, 0, 1, 1,
-1.500368, -0.3786575, -2.281275, 0, 0, 0, 1, 1,
-1.499859, 0.1097488, -0.2338228, 0, 0, 0, 1, 1,
-1.494302, 1.697423, -1.477276, 1, 1, 1, 1, 1,
-1.485393, -2.063691, -4.198664, 1, 1, 1, 1, 1,
-1.480416, 1.118179, -1.246336, 1, 1, 1, 1, 1,
-1.479637, 2.728008, 0.3420526, 1, 1, 1, 1, 1,
-1.470001, -1.935756, -4.648981, 1, 1, 1, 1, 1,
-1.467438, -0.5217141, -2.333177, 1, 1, 1, 1, 1,
-1.460567, -0.8408127, -2.789602, 1, 1, 1, 1, 1,
-1.459579, 1.28381, -1.632378, 1, 1, 1, 1, 1,
-1.457066, -0.3197591, -2.469988, 1, 1, 1, 1, 1,
-1.445995, 1.237835, -1.353967, 1, 1, 1, 1, 1,
-1.444665, 0.3071162, 0.3440491, 1, 1, 1, 1, 1,
-1.434558, 0.02269589, -2.585179, 1, 1, 1, 1, 1,
-1.433699, -0.8954818, -2.496494, 1, 1, 1, 1, 1,
-1.426431, 0.5984337, -1.455697, 1, 1, 1, 1, 1,
-1.40724, -0.3512554, -2.272166, 1, 1, 1, 1, 1,
-1.403085, -0.3241932, -2.287133, 0, 0, 1, 1, 1,
-1.402198, -0.793676, -0.8244095, 1, 0, 0, 1, 1,
-1.396189, 0.9236566, -1.891953, 1, 0, 0, 1, 1,
-1.391934, 1.409112, -0.6506702, 1, 0, 0, 1, 1,
-1.386229, 0.5025891, -1.308214, 1, 0, 0, 1, 1,
-1.374939, -0.5834836, -1.861699, 1, 0, 0, 1, 1,
-1.371627, 0.4644624, -1.37914, 0, 0, 0, 1, 1,
-1.36726, 1.201442, -0.7858872, 0, 0, 0, 1, 1,
-1.364725, 0.5656937, -3.315521, 0, 0, 0, 1, 1,
-1.357195, 0.3495405, -2.607752, 0, 0, 0, 1, 1,
-1.354009, -1.119589, -1.651652, 0, 0, 0, 1, 1,
-1.351193, -0.4156799, -1.870929, 0, 0, 0, 1, 1,
-1.351164, 0.9526535, 0.3764874, 0, 0, 0, 1, 1,
-1.345605, -1.511325, -1.115841, 1, 1, 1, 1, 1,
-1.331031, -0.9039266, -4.721759, 1, 1, 1, 1, 1,
-1.330211, -0.152695, -1.918368, 1, 1, 1, 1, 1,
-1.329287, -0.4363766, -2.898618, 1, 1, 1, 1, 1,
-1.320024, 0.9537444, -1.468508, 1, 1, 1, 1, 1,
-1.31888, -1.39049, -3.158708, 1, 1, 1, 1, 1,
-1.31724, 0.1277693, -2.670004, 1, 1, 1, 1, 1,
-1.314942, 0.3283735, -1.95459, 1, 1, 1, 1, 1,
-1.282997, -2.551255, -2.388077, 1, 1, 1, 1, 1,
-1.28031, -0.1882806, -1.137111, 1, 1, 1, 1, 1,
-1.277248, 0.8211504, -0.1547089, 1, 1, 1, 1, 1,
-1.277218, 1.72739, 0.276298, 1, 1, 1, 1, 1,
-1.275804, 0.1532229, -1.134056, 1, 1, 1, 1, 1,
-1.269124, 1.004725, -1.270649, 1, 1, 1, 1, 1,
-1.2616, -0.1627196, -3.013575, 1, 1, 1, 1, 1,
-1.257292, 1.076852, 0.4487582, 0, 0, 1, 1, 1,
-1.252228, 0.6070591, -1.386522, 1, 0, 0, 1, 1,
-1.244237, -0.9465641, -1.585663, 1, 0, 0, 1, 1,
-1.233268, -1.148257, -1.466807, 1, 0, 0, 1, 1,
-1.219307, 0.3446418, -0.8152248, 1, 0, 0, 1, 1,
-1.217327, 0.7701169, 0.6021045, 1, 0, 0, 1, 1,
-1.208454, 1.107538, -0.9143067, 0, 0, 0, 1, 1,
-1.206554, -0.1580843, -2.923429, 0, 0, 0, 1, 1,
-1.206429, 0.03343541, -1.443669, 0, 0, 0, 1, 1,
-1.205604, 0.6290891, -2.291162, 0, 0, 0, 1, 1,
-1.203213, -0.8035827, -1.938565, 0, 0, 0, 1, 1,
-1.183331, 1.710665, 0.68986, 0, 0, 0, 1, 1,
-1.177909, -2.499326, -2.227988, 0, 0, 0, 1, 1,
-1.177216, 0.40272, -1.76287, 1, 1, 1, 1, 1,
-1.173493, -0.5656968, -0.2321271, 1, 1, 1, 1, 1,
-1.172466, 0.1237961, -1.195352, 1, 1, 1, 1, 1,
-1.164611, 1.221644, -0.1610551, 1, 1, 1, 1, 1,
-1.156697, 1.546383, -0.5197459, 1, 1, 1, 1, 1,
-1.154401, -1.281028, 0.6541336, 1, 1, 1, 1, 1,
-1.144408, 0.168049, -2.560515, 1, 1, 1, 1, 1,
-1.141875, 1.024301, -0.7605872, 1, 1, 1, 1, 1,
-1.134413, 0.242718, -2.128907, 1, 1, 1, 1, 1,
-1.129763, -0.3174681, -1.587686, 1, 1, 1, 1, 1,
-1.125941, -1.654082, -2.339629, 1, 1, 1, 1, 1,
-1.12584, -0.5915656, -2.534544, 1, 1, 1, 1, 1,
-1.120259, -1.015142, -2.805938, 1, 1, 1, 1, 1,
-1.111538, -0.8454809, -2.295249, 1, 1, 1, 1, 1,
-1.111368, -0.6724023, -1.796202, 1, 1, 1, 1, 1,
-1.108765, 1.223791, -0.8617516, 0, 0, 1, 1, 1,
-1.10006, 0.0501264, -1.134261, 1, 0, 0, 1, 1,
-1.091083, 0.75353, 0.1379557, 1, 0, 0, 1, 1,
-1.089877, -0.258248, -0.883339, 1, 0, 0, 1, 1,
-1.083724, -0.4616123, -1.274473, 1, 0, 0, 1, 1,
-1.080093, -0.3968771, -2.409745, 1, 0, 0, 1, 1,
-1.078922, -0.2534316, -2.63008, 0, 0, 0, 1, 1,
-1.073798, 1.533353, -0.4892483, 0, 0, 0, 1, 1,
-1.073151, -0.3697783, -1.484768, 0, 0, 0, 1, 1,
-1.066945, 0.002113714, -1.120479, 0, 0, 0, 1, 1,
-1.06672, 0.4685518, -0.8372751, 0, 0, 0, 1, 1,
-1.065636, -0.4261083, -0.9774958, 0, 0, 0, 1, 1,
-1.060644, -9.60607e-05, -1.874579, 0, 0, 0, 1, 1,
-1.056803, -0.1951671, -1.367525, 1, 1, 1, 1, 1,
-1.055081, 1.389352, 1.332722, 1, 1, 1, 1, 1,
-1.050319, 0.2383162, -2.652849, 1, 1, 1, 1, 1,
-1.050196, -0.4842373, -1.416978, 1, 1, 1, 1, 1,
-1.046718, -0.2976626, -1.692795, 1, 1, 1, 1, 1,
-1.042882, -1.663262, -3.760226, 1, 1, 1, 1, 1,
-1.039561, -0.1118079, -1.401807, 1, 1, 1, 1, 1,
-1.03186, 1.90582, -0.920032, 1, 1, 1, 1, 1,
-1.031033, 0.1438326, -0.9334274, 1, 1, 1, 1, 1,
-1.030877, 0.8648471, -1.935502, 1, 1, 1, 1, 1,
-1.029392, 1.799713, -3.121805, 1, 1, 1, 1, 1,
-1.028267, 0.4844993, -0.138359, 1, 1, 1, 1, 1,
-1.028031, 0.6233918, 2.083874, 1, 1, 1, 1, 1,
-1.02642, -0.2569793, -1.759481, 1, 1, 1, 1, 1,
-1.025396, -0.1405599, -2.555824, 1, 1, 1, 1, 1,
-1.02002, 0.5914324, -0.4096811, 0, 0, 1, 1, 1,
-1.004273, -0.1358916, -3.55886, 1, 0, 0, 1, 1,
-1.003814, 0.5566792, -2.429885, 1, 0, 0, 1, 1,
-0.9982895, -0.2928648, -2.656955, 1, 0, 0, 1, 1,
-0.9980862, 2.343901, -0.6386729, 1, 0, 0, 1, 1,
-0.9958082, 1.326565, -0.4914725, 1, 0, 0, 1, 1,
-0.994785, 1.60657, -1.57515, 0, 0, 0, 1, 1,
-0.992154, -1.520079, -2.268087, 0, 0, 0, 1, 1,
-0.9911393, 1.510835, -0.6357068, 0, 0, 0, 1, 1,
-0.9763867, 0.6518317, 1.13257, 0, 0, 0, 1, 1,
-0.9763292, 0.07776721, -2.186427, 0, 0, 0, 1, 1,
-0.967284, -1.000859, -3.755863, 0, 0, 0, 1, 1,
-0.9661384, -0.6466255, -1.58161, 0, 0, 0, 1, 1,
-0.9612592, -1.083291, -2.096316, 1, 1, 1, 1, 1,
-0.952442, 1.020455, -0.8863257, 1, 1, 1, 1, 1,
-0.9451251, 0.264053, -0.4747391, 1, 1, 1, 1, 1,
-0.9415765, 0.1986503, -0.5681841, 1, 1, 1, 1, 1,
-0.9392678, 0.8899141, -0.9171895, 1, 1, 1, 1, 1,
-0.9277022, 0.8919534, -1.711158, 1, 1, 1, 1, 1,
-0.921854, -0.3963311, -3.504174, 1, 1, 1, 1, 1,
-0.9184002, -0.2101999, -2.781482, 1, 1, 1, 1, 1,
-0.9156161, 0.3364563, -0.84303, 1, 1, 1, 1, 1,
-0.9139288, -1.057107, -2.111982, 1, 1, 1, 1, 1,
-0.9135332, -0.07745525, -2.535092, 1, 1, 1, 1, 1,
-0.9106256, 1.257307, 1.0422, 1, 1, 1, 1, 1,
-0.9075384, 1.089446, -0.5545814, 1, 1, 1, 1, 1,
-0.9054244, 1.507336, -0.01265803, 1, 1, 1, 1, 1,
-0.9029416, -0.3526309, -1.654598, 1, 1, 1, 1, 1,
-0.9027907, -2.53418, -1.160465, 0, 0, 1, 1, 1,
-0.8986683, 0.8795605, -0.9078893, 1, 0, 0, 1, 1,
-0.8922914, 0.2167224, 0.8840699, 1, 0, 0, 1, 1,
-0.8912219, -1.012172, -3.357537, 1, 0, 0, 1, 1,
-0.8885624, -0.260341, -2.625083, 1, 0, 0, 1, 1,
-0.8870457, -0.2913166, -1.450168, 1, 0, 0, 1, 1,
-0.8812969, -0.665037, -1.481048, 0, 0, 0, 1, 1,
-0.881073, -0.5356917, -1.392418, 0, 0, 0, 1, 1,
-0.8790002, -1.628065, -1.658763, 0, 0, 0, 1, 1,
-0.8648751, 0.4512607, 0.09224729, 0, 0, 0, 1, 1,
-0.862673, -1.92781, -4.056036, 0, 0, 0, 1, 1,
-0.8503932, -0.4233056, -2.83408, 0, 0, 0, 1, 1,
-0.8462151, 0.4731394, -0.145986, 0, 0, 0, 1, 1,
-0.8441233, -0.4324019, -2.189722, 1, 1, 1, 1, 1,
-0.8437308, -0.6686172, -3.208282, 1, 1, 1, 1, 1,
-0.8245032, 1.744028, -1.310002, 1, 1, 1, 1, 1,
-0.8236808, 0.4632456, -0.7476766, 1, 1, 1, 1, 1,
-0.8177229, -1.673816, -3.008646, 1, 1, 1, 1, 1,
-0.8105984, 0.5088252, -1.894303, 1, 1, 1, 1, 1,
-0.807353, 0.7988705, -0.3227521, 1, 1, 1, 1, 1,
-0.8039233, -0.111079, -2.279541, 1, 1, 1, 1, 1,
-0.8025082, 0.2711882, -2.626184, 1, 1, 1, 1, 1,
-0.8021431, 0.2902398, -0.3929558, 1, 1, 1, 1, 1,
-0.8018562, -0.8424975, -2.590593, 1, 1, 1, 1, 1,
-0.800098, 0.9445683, -2.435734, 1, 1, 1, 1, 1,
-0.796665, 0.3027347, -2.544327, 1, 1, 1, 1, 1,
-0.7952672, -0.2525597, -2.056265, 1, 1, 1, 1, 1,
-0.7923502, 0.601908, -0.7648101, 1, 1, 1, 1, 1,
-0.7909064, 0.764075, 0.05191628, 0, 0, 1, 1, 1,
-0.7877917, -0.166688, -1.009438, 1, 0, 0, 1, 1,
-0.7864989, 0.05775075, -2.402532, 1, 0, 0, 1, 1,
-0.7844712, 0.0450568, -0.1591723, 1, 0, 0, 1, 1,
-0.7826582, -2.130689, -2.431603, 1, 0, 0, 1, 1,
-0.7822779, -1.739412, -2.76902, 1, 0, 0, 1, 1,
-0.7822369, -0.9050611, -2.554463, 0, 0, 0, 1, 1,
-0.7804855, -0.1731643, -1.758008, 0, 0, 0, 1, 1,
-0.7802013, 0.8342776, -0.7254623, 0, 0, 0, 1, 1,
-0.7780799, -1.704676, -2.251767, 0, 0, 0, 1, 1,
-0.7753273, -0.9265231, -1.258096, 0, 0, 0, 1, 1,
-0.773829, 0.4456025, 1.09768, 0, 0, 0, 1, 1,
-0.7736735, -0.5350993, -1.738345, 0, 0, 0, 1, 1,
-0.7713643, 0.682874, -0.6092646, 1, 1, 1, 1, 1,
-0.770807, -0.2770798, -1.699662, 1, 1, 1, 1, 1,
-0.7692381, 1.100741, 0.3818691, 1, 1, 1, 1, 1,
-0.7681808, 1.498607, -1.250735, 1, 1, 1, 1, 1,
-0.7637703, -0.2405005, -2.203637, 1, 1, 1, 1, 1,
-0.7619364, -0.2256719, -1.284687, 1, 1, 1, 1, 1,
-0.7618333, 0.2024032, -0.4820977, 1, 1, 1, 1, 1,
-0.7600489, 2.186722, 0.8996493, 1, 1, 1, 1, 1,
-0.7454907, -0.5248514, -2.240088, 1, 1, 1, 1, 1,
-0.7428498, 0.1866072, -0.2341142, 1, 1, 1, 1, 1,
-0.7364149, 1.150434, -0.4952165, 1, 1, 1, 1, 1,
-0.7343984, 0.0438586, -0.3840566, 1, 1, 1, 1, 1,
-0.7278572, 0.9023876, 0.9323126, 1, 1, 1, 1, 1,
-0.7245117, 0.8268903, -0.03918831, 1, 1, 1, 1, 1,
-0.7223181, -0.6851876, 0.06845545, 1, 1, 1, 1, 1,
-0.7178575, -0.08368348, -0.8656824, 0, 0, 1, 1, 1,
-0.7164758, 0.7449485, -1.646223, 1, 0, 0, 1, 1,
-0.7117348, 1.108404, -1.389804, 1, 0, 0, 1, 1,
-0.7114674, 1.223066, -1.106884, 1, 0, 0, 1, 1,
-0.708432, -0.7952182, -0.8569831, 1, 0, 0, 1, 1,
-0.7057771, 0.8176565, -0.825389, 1, 0, 0, 1, 1,
-0.7030751, -0.7541088, -3.145672, 0, 0, 0, 1, 1,
-0.7030207, 0.5286729, 0.07742279, 0, 0, 0, 1, 1,
-0.702217, 0.4717351, -0.239391, 0, 0, 0, 1, 1,
-0.6984808, -0.9450182, -2.780238, 0, 0, 0, 1, 1,
-0.6974371, -1.209826, -2.14536, 0, 0, 0, 1, 1,
-0.695902, 2.060443, 0.4353197, 0, 0, 0, 1, 1,
-0.690072, -0.5299367, -1.483807, 0, 0, 0, 1, 1,
-0.6877348, 1.710135, 0.5741385, 1, 1, 1, 1, 1,
-0.6832195, 0.2870809, -0.1858303, 1, 1, 1, 1, 1,
-0.6824923, 0.2902685, -1.992077, 1, 1, 1, 1, 1,
-0.6736307, 0.5292775, -0.8339082, 1, 1, 1, 1, 1,
-0.6712077, -0.8825117, -0.7735562, 1, 1, 1, 1, 1,
-0.668467, -0.291721, -2.17476, 1, 1, 1, 1, 1,
-0.6647679, 1.541306, -1.283877, 1, 1, 1, 1, 1,
-0.6619103, -0.8863689, -4.570026, 1, 1, 1, 1, 1,
-0.661319, -0.5170969, -0.9343717, 1, 1, 1, 1, 1,
-0.6577206, 0.2509295, -1.67229, 1, 1, 1, 1, 1,
-0.6516037, -0.7233226, -2.255922, 1, 1, 1, 1, 1,
-0.6469491, -0.9275724, -1.667855, 1, 1, 1, 1, 1,
-0.643649, -0.7035492, -3.269853, 1, 1, 1, 1, 1,
-0.642484, -0.07077881, -0.7984535, 1, 1, 1, 1, 1,
-0.6349908, -0.7388803, -3.897379, 1, 1, 1, 1, 1,
-0.6346055, 0.3984556, -0.3731632, 0, 0, 1, 1, 1,
-0.6184601, -0.6015494, -1.745964, 1, 0, 0, 1, 1,
-0.6157101, -0.7364784, -0.7923258, 1, 0, 0, 1, 1,
-0.6129239, -0.6831731, -2.681199, 1, 0, 0, 1, 1,
-0.6123577, 0.628707, -0.9795691, 1, 0, 0, 1, 1,
-0.6123407, 0.4647064, -1.357647, 1, 0, 0, 1, 1,
-0.6040044, -1.495005, -4.027343, 0, 0, 0, 1, 1,
-0.6021352, 0.2273768, -2.330975, 0, 0, 0, 1, 1,
-0.6008849, -0.06148402, 0.009169918, 0, 0, 0, 1, 1,
-0.600113, -0.4335392, -1.657859, 0, 0, 0, 1, 1,
-0.5980057, -1.92729, -2.174407, 0, 0, 0, 1, 1,
-0.5939563, -0.4748255, -1.293354, 0, 0, 0, 1, 1,
-0.5937402, 1.372484, -0.6068745, 0, 0, 0, 1, 1,
-0.5931881, 0.7533394, -1.292116, 1, 1, 1, 1, 1,
-0.592913, -0.9668555, -2.586478, 1, 1, 1, 1, 1,
-0.5924427, 0.3972232, -0.4529316, 1, 1, 1, 1, 1,
-0.5882215, -0.6086041, -1.549268, 1, 1, 1, 1, 1,
-0.5847117, 0.6171895, 0.2699368, 1, 1, 1, 1, 1,
-0.5809832, 0.2276747, -1.938498, 1, 1, 1, 1, 1,
-0.5779065, -0.06762984, -3.074631, 1, 1, 1, 1, 1,
-0.5705385, -1.241657, -2.357584, 1, 1, 1, 1, 1,
-0.5695989, 1.067414, -0.8728346, 1, 1, 1, 1, 1,
-0.5684055, 1.158455, 0.6899309, 1, 1, 1, 1, 1,
-0.5676559, 0.4180814, 0.4176973, 1, 1, 1, 1, 1,
-0.5675739, -0.5300297, -1.90667, 1, 1, 1, 1, 1,
-0.5574018, -0.261291, -1.499392, 1, 1, 1, 1, 1,
-0.5516764, 0.4424899, 0.6813896, 1, 1, 1, 1, 1,
-0.5468121, 0.2825206, -0.5517465, 1, 1, 1, 1, 1,
-0.5444689, 0.7005338, -0.6193169, 0, 0, 1, 1, 1,
-0.5438173, -1.475722, -2.207276, 1, 0, 0, 1, 1,
-0.5416442, 0.7147763, 0.01878544, 1, 0, 0, 1, 1,
-0.5357461, -0.009327686, -0.3720088, 1, 0, 0, 1, 1,
-0.5351235, -0.3178349, -2.089373, 1, 0, 0, 1, 1,
-0.5327866, 0.06383595, -2.300459, 1, 0, 0, 1, 1,
-0.5310766, -2.285822, -3.572727, 0, 0, 0, 1, 1,
-0.5277061, 0.8731225, -1.228033, 0, 0, 0, 1, 1,
-0.5269251, 0.1439518, -1.193719, 0, 0, 0, 1, 1,
-0.5246897, -1.485919, -2.504343, 0, 0, 0, 1, 1,
-0.5220413, 0.0215637, -2.408032, 0, 0, 0, 1, 1,
-0.5217288, 0.3320483, -0.2501682, 0, 0, 0, 1, 1,
-0.5210412, 1.543304, -0.4896245, 0, 0, 0, 1, 1,
-0.5180783, 1.051491, -0.7128492, 1, 1, 1, 1, 1,
-0.5169618, 2.237873, -1.251848, 1, 1, 1, 1, 1,
-0.5141267, 1.148713, -0.134266, 1, 1, 1, 1, 1,
-0.51282, 0.5242579, -2.388838, 1, 1, 1, 1, 1,
-0.5095733, -0.3364582, -1.78805, 1, 1, 1, 1, 1,
-0.5090569, -1.350935, -1.464479, 1, 1, 1, 1, 1,
-0.4899666, 0.4159939, -2.84236, 1, 1, 1, 1, 1,
-0.4871781, -0.2836677, -2.53785, 1, 1, 1, 1, 1,
-0.4821581, 0.5713766, -0.4560927, 1, 1, 1, 1, 1,
-0.4805489, 0.1352666, -1.033038, 1, 1, 1, 1, 1,
-0.479679, 1.039138, 0.5115171, 1, 1, 1, 1, 1,
-0.4746104, -1.554878, -4.107239, 1, 1, 1, 1, 1,
-0.4695161, -0.1170394, 0.1552716, 1, 1, 1, 1, 1,
-0.4636006, -0.8395057, -2.189069, 1, 1, 1, 1, 1,
-0.4623013, -1.00511, -3.216363, 1, 1, 1, 1, 1,
-0.4564838, -0.0003741879, -0.005477889, 0, 0, 1, 1, 1,
-0.4450907, 0.8368636, 0.3169422, 1, 0, 0, 1, 1,
-0.4390545, -0.1468179, -3.105618, 1, 0, 0, 1, 1,
-0.4367059, 0.9961684, -2.555794, 1, 0, 0, 1, 1,
-0.4351728, -0.1449227, -2.456648, 1, 0, 0, 1, 1,
-0.424209, 0.007870134, -1.971477, 1, 0, 0, 1, 1,
-0.4188665, -0.3650464, -0.1376875, 0, 0, 0, 1, 1,
-0.4130129, -0.7479746, -3.025904, 0, 0, 0, 1, 1,
-0.4094465, 0.3798055, -3.335306, 0, 0, 0, 1, 1,
-0.4082743, -0.3346596, -0.6998853, 0, 0, 0, 1, 1,
-0.4077882, 2.108763, 0.1910568, 0, 0, 0, 1, 1,
-0.4067816, 0.7315397, -1.161146, 0, 0, 0, 1, 1,
-0.4035024, 0.8504672, -1.051721, 0, 0, 0, 1, 1,
-0.4034896, 0.2863303, -0.04967133, 1, 1, 1, 1, 1,
-0.3982359, 0.3916534, -1.019055, 1, 1, 1, 1, 1,
-0.3958841, 1.301813, -0.5841646, 1, 1, 1, 1, 1,
-0.3947808, -0.301238, -1.821692, 1, 1, 1, 1, 1,
-0.3942091, -1.076695, -2.606281, 1, 1, 1, 1, 1,
-0.3933164, 0.6700758, -0.8206753, 1, 1, 1, 1, 1,
-0.3931426, -1.380396, -3.656788, 1, 1, 1, 1, 1,
-0.3854073, 1.436188, 0.2955324, 1, 1, 1, 1, 1,
-0.3840598, -0.2536783, -1.621683, 1, 1, 1, 1, 1,
-0.3819639, 1.279276, 0.1597021, 1, 1, 1, 1, 1,
-0.3795061, -1.323877, -3.124726, 1, 1, 1, 1, 1,
-0.3762461, 0.1455147, -0.7015187, 1, 1, 1, 1, 1,
-0.3751695, -0.803625, -2.039009, 1, 1, 1, 1, 1,
-0.3734419, 0.3290052, -0.3067195, 1, 1, 1, 1, 1,
-0.3733836, 0.4880452, -1.635381, 1, 1, 1, 1, 1,
-0.3692982, 0.5277063, 0.9890358, 0, 0, 1, 1, 1,
-0.365386, -0.3896548, -2.931236, 1, 0, 0, 1, 1,
-0.3626154, -1.014834, -1.793457, 1, 0, 0, 1, 1,
-0.3616388, -1.364771, -0.6556835, 1, 0, 0, 1, 1,
-0.3596471, -0.1086898, -0.5852495, 1, 0, 0, 1, 1,
-0.3586858, -0.7484391, -3.562302, 1, 0, 0, 1, 1,
-0.3580936, -1.399737, -3.870751, 0, 0, 0, 1, 1,
-0.3578423, 0.2247157, -1.425173, 0, 0, 0, 1, 1,
-0.3521433, -0.4759646, -1.699307, 0, 0, 0, 1, 1,
-0.346638, -0.635746, -3.736799, 0, 0, 0, 1, 1,
-0.3464598, 1.419015, -0.3319175, 0, 0, 0, 1, 1,
-0.3463148, 0.8998112, -0.8957244, 0, 0, 0, 1, 1,
-0.3459637, 0.4842045, -1.393463, 0, 0, 0, 1, 1,
-0.3452896, 0.09706251, 0.3789784, 1, 1, 1, 1, 1,
-0.3426573, 1.071017, -1.361082, 1, 1, 1, 1, 1,
-0.3422105, -0.8155289, -2.028624, 1, 1, 1, 1, 1,
-0.3416108, 1.681076, -0.9026605, 1, 1, 1, 1, 1,
-0.3411947, -0.1588707, -1.398438, 1, 1, 1, 1, 1,
-0.3408201, -0.02771321, -0.09377594, 1, 1, 1, 1, 1,
-0.3374878, -2.229659, -4.093858, 1, 1, 1, 1, 1,
-0.3330496, 2.311892, 1.36256, 1, 1, 1, 1, 1,
-0.3290727, 1.805793, -0.1394148, 1, 1, 1, 1, 1,
-0.3277835, -0.4865983, -2.904531, 1, 1, 1, 1, 1,
-0.3267595, 0.4632578, -0.1140309, 1, 1, 1, 1, 1,
-0.3264644, 0.5528843, 1.194562, 1, 1, 1, 1, 1,
-0.3221377, 0.993541, 0.9337267, 1, 1, 1, 1, 1,
-0.3198546, -1.124922, -2.759794, 1, 1, 1, 1, 1,
-0.3175417, 1.063222, 1.149883, 1, 1, 1, 1, 1,
-0.315437, -0.1787811, -3.520135, 0, 0, 1, 1, 1,
-0.3140809, -0.7003078, -1.529736, 1, 0, 0, 1, 1,
-0.3083422, 0.09517524, 0.9203048, 1, 0, 0, 1, 1,
-0.3025937, -0.348616, -2.169964, 1, 0, 0, 1, 1,
-0.3011377, 0.6863287, -1.378192, 1, 0, 0, 1, 1,
-0.3005064, 1.169845, 0.1246332, 1, 0, 0, 1, 1,
-0.2972228, 0.3924549, -1.647318, 0, 0, 0, 1, 1,
-0.2935337, 0.3286395, -0.5691944, 0, 0, 0, 1, 1,
-0.2903518, 0.9290703, 2.108705, 0, 0, 0, 1, 1,
-0.2888435, -1.065927, -3.158449, 0, 0, 0, 1, 1,
-0.2874854, -0.633384, -2.61203, 0, 0, 0, 1, 1,
-0.2824157, 0.2493943, 1.149948, 0, 0, 0, 1, 1,
-0.2813561, 0.7304161, 2.037227, 0, 0, 0, 1, 1,
-0.2776986, -0.3246157, -2.336319, 1, 1, 1, 1, 1,
-0.2770702, -1.708719, -1.752117, 1, 1, 1, 1, 1,
-0.2764813, -1.20378, -2.732259, 1, 1, 1, 1, 1,
-0.2760253, -0.2950603, -1.643725, 1, 1, 1, 1, 1,
-0.2754897, -0.4027192, -0.982054, 1, 1, 1, 1, 1,
-0.2687237, -1.17564, -3.116214, 1, 1, 1, 1, 1,
-0.2679829, -1.330373, -3.180866, 1, 1, 1, 1, 1,
-0.2661541, -0.858919, -3.326458, 1, 1, 1, 1, 1,
-0.2617324, 0.6589288, -0.7154813, 1, 1, 1, 1, 1,
-0.2581144, 1.652595, -0.5608456, 1, 1, 1, 1, 1,
-0.2532973, -1.698993, -4.461973, 1, 1, 1, 1, 1,
-0.2526296, 1.438802, -0.8175245, 1, 1, 1, 1, 1,
-0.245396, -2.424938, -1.843945, 1, 1, 1, 1, 1,
-0.2434279, 1.664313, 1.066837, 1, 1, 1, 1, 1,
-0.243043, -0.5868613, -2.125535, 1, 1, 1, 1, 1,
-0.2411135, 0.6825533, -0.7797005, 0, 0, 1, 1, 1,
-0.237231, 0.4585527, -2.333829, 1, 0, 0, 1, 1,
-0.2359585, -0.5344733, -4.189661, 1, 0, 0, 1, 1,
-0.2316625, 0.14111, -2.054724, 1, 0, 0, 1, 1,
-0.2308218, 0.4868217, -0.7812449, 1, 0, 0, 1, 1,
-0.2280766, 2.08883, 0.516759, 1, 0, 0, 1, 1,
-0.2239321, 0.5297571, -0.7682256, 0, 0, 0, 1, 1,
-0.2238334, -1.314664, -5.04724, 0, 0, 0, 1, 1,
-0.223504, -0.5751603, -1.76405, 0, 0, 0, 1, 1,
-0.2232169, -1.101309, -3.437075, 0, 0, 0, 1, 1,
-0.2216787, -0.6071557, -1.915699, 0, 0, 0, 1, 1,
-0.2147729, 0.2963127, -2.75303, 0, 0, 0, 1, 1,
-0.2133907, -1.429266, -2.440194, 0, 0, 0, 1, 1,
-0.2131409, -2.662291, -2.750003, 1, 1, 1, 1, 1,
-0.2119573, 0.6802803, -0.3445987, 1, 1, 1, 1, 1,
-0.2091962, -0.06314686, -1.861931, 1, 1, 1, 1, 1,
-0.2073257, 1.543623, -0.8677328, 1, 1, 1, 1, 1,
-0.1955572, 0.5009089, -0.4778355, 1, 1, 1, 1, 1,
-0.1953398, -1.440085, -4.93951, 1, 1, 1, 1, 1,
-0.1943256, -0.1408415, -3.0082, 1, 1, 1, 1, 1,
-0.1914347, 0.264948, -2.634401, 1, 1, 1, 1, 1,
-0.1913964, -0.1974193, -2.036032, 1, 1, 1, 1, 1,
-0.1900139, 1.945861, -0.2428965, 1, 1, 1, 1, 1,
-0.189897, 0.4539348, -0.7223946, 1, 1, 1, 1, 1,
-0.1884379, -1.872747, -3.253243, 1, 1, 1, 1, 1,
-0.1876628, 0.7729379, -1.622261, 1, 1, 1, 1, 1,
-0.1844457, -0.03016794, -1.476195, 1, 1, 1, 1, 1,
-0.1818241, -0.3847899, -2.900096, 1, 1, 1, 1, 1,
-0.1817697, 0.731607, -0.7640194, 0, 0, 1, 1, 1,
-0.175444, 1.600842, -1.003684, 1, 0, 0, 1, 1,
-0.1727989, -0.323338, -2.507668, 1, 0, 0, 1, 1,
-0.1630527, 0.1576316, -0.6996292, 1, 0, 0, 1, 1,
-0.1609457, -0.2632837, -3.040557, 1, 0, 0, 1, 1,
-0.1556733, 0.3822544, 1.127308, 1, 0, 0, 1, 1,
-0.1542709, 0.7661013, -2.044301, 0, 0, 0, 1, 1,
-0.1475472, 0.2633961, -0.9922556, 0, 0, 0, 1, 1,
-0.1470195, -0.09484415, -2.091284, 0, 0, 0, 1, 1,
-0.1436041, 1.76014, 1.293561, 0, 0, 0, 1, 1,
-0.1433941, -1.268463, -3.117991, 0, 0, 0, 1, 1,
-0.1418077, -0.4174048, -1.421048, 0, 0, 0, 1, 1,
-0.1332364, -0.1394923, -1.667873, 0, 0, 0, 1, 1,
-0.130272, -0.5582607, -2.644313, 1, 1, 1, 1, 1,
-0.1264708, 0.8199121, 0.008857202, 1, 1, 1, 1, 1,
-0.1226828, -1.314454, -2.517856, 1, 1, 1, 1, 1,
-0.1154563, -0.6557153, -3.214994, 1, 1, 1, 1, 1,
-0.11385, -1.617332, -2.770994, 1, 1, 1, 1, 1,
-0.1098277, -0.4404127, -2.05337, 1, 1, 1, 1, 1,
-0.1083516, 0.3162404, 0.1227164, 1, 1, 1, 1, 1,
-0.1056245, -0.7343548, -2.979777, 1, 1, 1, 1, 1,
-0.09892485, -1.804904, -2.645218, 1, 1, 1, 1, 1,
-0.09741978, 1.311433, 0.1228239, 1, 1, 1, 1, 1,
-0.09649876, -1.039542, -1.948731, 1, 1, 1, 1, 1,
-0.09433804, -0.2639259, -4.622091, 1, 1, 1, 1, 1,
-0.09129311, 0.4841405, 0.9563644, 1, 1, 1, 1, 1,
-0.09034891, 1.071984, -1.821933, 1, 1, 1, 1, 1,
-0.08916946, -0.3576552, -2.533848, 1, 1, 1, 1, 1,
-0.08621299, -0.2944373, -3.7949, 0, 0, 1, 1, 1,
-0.08457859, -0.6736764, -3.882645, 1, 0, 0, 1, 1,
-0.08341327, 0.8421083, 0.6404972, 1, 0, 0, 1, 1,
-0.07931987, 1.556336, -1.391052, 1, 0, 0, 1, 1,
-0.0780094, -0.3306697, -2.375515, 1, 0, 0, 1, 1,
-0.07479501, -1.258209, -4.50121, 1, 0, 0, 1, 1,
-0.07328808, 2.147199, 1.045821, 0, 0, 0, 1, 1,
-0.07306735, -1.329212, -2.643894, 0, 0, 0, 1, 1,
-0.07266629, 1.108555, 1.813414, 0, 0, 0, 1, 1,
-0.06809986, -2.234543, -2.629565, 0, 0, 0, 1, 1,
-0.06576284, -0.36571, -3.35854, 0, 0, 0, 1, 1,
-0.06519826, -1.622644, -3.719465, 0, 0, 0, 1, 1,
-0.06347144, -1.047935, -4.996925, 0, 0, 0, 1, 1,
-0.05967457, -1.554574, -3.176843, 1, 1, 1, 1, 1,
-0.05736011, -0.1079199, -3.831534, 1, 1, 1, 1, 1,
-0.0572025, 0.312074, -0.5413594, 1, 1, 1, 1, 1,
-0.04902106, 0.6405436, -0.7913332, 1, 1, 1, 1, 1,
-0.0476674, 1.438299, 0.289985, 1, 1, 1, 1, 1,
-0.04594827, -0.784972, -1.672906, 1, 1, 1, 1, 1,
-0.04444363, 0.9008561, 0.9146907, 1, 1, 1, 1, 1,
-0.0432332, -0.149237, -2.181954, 1, 1, 1, 1, 1,
-0.04183258, -1.385701, -4.208045, 1, 1, 1, 1, 1,
-0.03520629, 2.422338, 0.5342377, 1, 1, 1, 1, 1,
-0.02874771, -2.142511, -2.457141, 1, 1, 1, 1, 1,
-0.02510165, 0.1986644, -1.186087, 1, 1, 1, 1, 1,
-0.02401217, 1.211452, 1.387715, 1, 1, 1, 1, 1,
-0.01868756, -0.1161204, -2.527892, 1, 1, 1, 1, 1,
-0.01322436, -0.417274, -3.388784, 1, 1, 1, 1, 1,
-0.01113019, -0.179194, -2.918121, 0, 0, 1, 1, 1,
-0.01063327, -0.362643, -2.031608, 1, 0, 0, 1, 1,
-0.00125779, 0.9231864, -0.1883056, 1, 0, 0, 1, 1,
0.009013743, 1.23786, 0.8791295, 1, 0, 0, 1, 1,
0.01459645, -1.742507, 3.626334, 1, 0, 0, 1, 1,
0.01827474, -1.246154, 3.087272, 1, 0, 0, 1, 1,
0.01892924, -1.205188, 1.632066, 0, 0, 0, 1, 1,
0.02044672, -0.7258114, 3.745049, 0, 0, 0, 1, 1,
0.0216435, -0.2483136, 2.004088, 0, 0, 0, 1, 1,
0.0231375, -0.1536927, 2.273888, 0, 0, 0, 1, 1,
0.02483218, -0.7551816, 3.844874, 0, 0, 0, 1, 1,
0.02689235, 1.006949, 0.6774436, 0, 0, 0, 1, 1,
0.03055519, -1.272218, 2.964275, 0, 0, 0, 1, 1,
0.03474943, -0.3089192, 3.329265, 1, 1, 1, 1, 1,
0.04016066, -1.460381, 3.261558, 1, 1, 1, 1, 1,
0.0404547, 1.221084, -0.9180806, 1, 1, 1, 1, 1,
0.04495868, 1.857649, 0.9769813, 1, 1, 1, 1, 1,
0.04735515, -0.04346075, 1.241934, 1, 1, 1, 1, 1,
0.0487684, -0.7963796, 4.050989, 1, 1, 1, 1, 1,
0.05182971, -1.205314, 2.275218, 1, 1, 1, 1, 1,
0.05979951, -1.421769, 2.53481, 1, 1, 1, 1, 1,
0.06124265, 0.6506205, -0.2435117, 1, 1, 1, 1, 1,
0.06347422, 0.4307973, 1.86135, 1, 1, 1, 1, 1,
0.06882243, 1.9144, -0.744061, 1, 1, 1, 1, 1,
0.06882437, -1.711937, 3.402672, 1, 1, 1, 1, 1,
0.06936321, 0.1422812, 0.7396512, 1, 1, 1, 1, 1,
0.08474652, 0.1697998, 1.478528, 1, 1, 1, 1, 1,
0.08509658, -1.068122, 3.916079, 1, 1, 1, 1, 1,
0.0859306, 0.1366129, 2.002525, 0, 0, 1, 1, 1,
0.08630536, -0.258784, 4.230932, 1, 0, 0, 1, 1,
0.09199339, 1.050225, -0.4070715, 1, 0, 0, 1, 1,
0.09350187, 0.6598123, 1.001155, 1, 0, 0, 1, 1,
0.09352101, 1.73168, -0.3378, 1, 0, 0, 1, 1,
0.0947428, -2.314966, 2.537485, 1, 0, 0, 1, 1,
0.09532866, 2.297143, 2.246289, 0, 0, 0, 1, 1,
0.09764272, -2.362309, 4.14992, 0, 0, 0, 1, 1,
0.09995069, 1.323479, -0.4937702, 0, 0, 0, 1, 1,
0.1016984, -0.2752121, 3.117332, 0, 0, 0, 1, 1,
0.1039783, -1.31064, 3.475487, 0, 0, 0, 1, 1,
0.1079994, 1.067274, 0.3785579, 0, 0, 0, 1, 1,
0.1112244, -0.6848125, 1.541776, 0, 0, 0, 1, 1,
0.1165172, -0.1373151, 3.588903, 1, 1, 1, 1, 1,
0.1173231, 0.2186446, 0.4411705, 1, 1, 1, 1, 1,
0.1180408, 0.247338, -0.468352, 1, 1, 1, 1, 1,
0.1221365, 0.7850835, -1.805187, 1, 1, 1, 1, 1,
0.1223976, -1.064212, 2.319444, 1, 1, 1, 1, 1,
0.1270623, 1.311954, -0.6609019, 1, 1, 1, 1, 1,
0.1294694, 0.5307372, 0.2828823, 1, 1, 1, 1, 1,
0.1299706, -2.005056, 4.38225, 1, 1, 1, 1, 1,
0.1339695, 0.07549884, -0.4003731, 1, 1, 1, 1, 1,
0.1341687, -0.660619, 2.569471, 1, 1, 1, 1, 1,
0.1359856, 0.7796841, -0.4593568, 1, 1, 1, 1, 1,
0.1375625, -0.8995243, 4.603731, 1, 1, 1, 1, 1,
0.1384837, 0.159289, 0.5257685, 1, 1, 1, 1, 1,
0.1395902, 0.05426843, 0.3298131, 1, 1, 1, 1, 1,
0.1420901, 0.126055, 1.791158, 1, 1, 1, 1, 1,
0.1428375, 1.470123, 0.4861065, 0, 0, 1, 1, 1,
0.146556, -1.284486, 2.6796, 1, 0, 0, 1, 1,
0.1481402, -1.470517, 2.182033, 1, 0, 0, 1, 1,
0.1593621, -1.781676, 1.561761, 1, 0, 0, 1, 1,
0.1611944, 0.8230333, 0.09274571, 1, 0, 0, 1, 1,
0.163109, -0.8850396, 3.499731, 1, 0, 0, 1, 1,
0.1633782, 0.6766493, 2.565948, 0, 0, 0, 1, 1,
0.1653267, 0.167629, 0.9855421, 0, 0, 0, 1, 1,
0.1685328, 1.487062, 0.3796185, 0, 0, 0, 1, 1,
0.1711749, 0.4403103, 0.3403595, 0, 0, 0, 1, 1,
0.1741319, -0.4756664, 1.973855, 0, 0, 0, 1, 1,
0.1785551, 0.731121, 0.01616428, 0, 0, 0, 1, 1,
0.1828582, -0.2030954, 2.390262, 0, 0, 0, 1, 1,
0.1873408, 0.443813, 0.2067737, 1, 1, 1, 1, 1,
0.1876624, -1.174391, 1.865127, 1, 1, 1, 1, 1,
0.189024, -2.590582, 3.716251, 1, 1, 1, 1, 1,
0.1902992, -1.292419, 2.960535, 1, 1, 1, 1, 1,
0.191447, -1.348694, 4.486373, 1, 1, 1, 1, 1,
0.1943414, -0.1968093, 0.6803748, 1, 1, 1, 1, 1,
0.1954171, -0.4452405, 3.554851, 1, 1, 1, 1, 1,
0.1962829, 1.666759, 1.893453, 1, 1, 1, 1, 1,
0.1977442, -1.304766, 1.410176, 1, 1, 1, 1, 1,
0.1996292, -0.3654776, 2.627122, 1, 1, 1, 1, 1,
0.2032962, 1.573175, -0.1362345, 1, 1, 1, 1, 1,
0.2077294, -1.448008, 3.859879, 1, 1, 1, 1, 1,
0.2135756, -1.164606, 2.808693, 1, 1, 1, 1, 1,
0.2150632, -0.1408432, 0.1781056, 1, 1, 1, 1, 1,
0.2154249, 2.354421, 1.994782, 1, 1, 1, 1, 1,
0.2228418, 0.07080451, 0.5727147, 0, 0, 1, 1, 1,
0.222899, 0.3459286, -0.6507217, 1, 0, 0, 1, 1,
0.2233504, -0.6160424, 2.695825, 1, 0, 0, 1, 1,
0.2260929, -0.66086, 2.652258, 1, 0, 0, 1, 1,
0.2307522, -1.300756, 2.257413, 1, 0, 0, 1, 1,
0.2421356, 0.5309311, 1.269852, 1, 0, 0, 1, 1,
0.2447395, -2.065968, 2.161261, 0, 0, 0, 1, 1,
0.2490828, 0.7445191, -0.206196, 0, 0, 0, 1, 1,
0.2521303, -0.8923868, 2.040569, 0, 0, 0, 1, 1,
0.2580692, 1.924987, -1.574647, 0, 0, 0, 1, 1,
0.2600628, -0.1056815, 3.311022, 0, 0, 0, 1, 1,
0.273239, -0.5781142, 1.456276, 0, 0, 0, 1, 1,
0.2745534, -1.286549, 3.360738, 0, 0, 0, 1, 1,
0.2760533, 0.6668464, -1.441274, 1, 1, 1, 1, 1,
0.2790149, -0.05538127, 1.9494, 1, 1, 1, 1, 1,
0.2844172, 0.7668023, -1.563015, 1, 1, 1, 1, 1,
0.2884001, -1.379083, 1.953264, 1, 1, 1, 1, 1,
0.2924245, 1.655977, 1.823403, 1, 1, 1, 1, 1,
0.2981368, 0.8470794, 0.1053402, 1, 1, 1, 1, 1,
0.3021448, 0.5087336, 1.254039, 1, 1, 1, 1, 1,
0.302682, -0.6949745, 2.560619, 1, 1, 1, 1, 1,
0.3106655, 0.7539479, 2.434459, 1, 1, 1, 1, 1,
0.3123625, 1.390363, 0.9935663, 1, 1, 1, 1, 1,
0.312605, 0.4609942, 0.8867052, 1, 1, 1, 1, 1,
0.3131128, -1.331592, 3.36095, 1, 1, 1, 1, 1,
0.3185895, 0.02406562, 0.3336404, 1, 1, 1, 1, 1,
0.3188566, 0.2817508, 1.075848, 1, 1, 1, 1, 1,
0.3274304, -2.956953, 3.898829, 1, 1, 1, 1, 1,
0.3283565, 0.6852287, 1.184019, 0, 0, 1, 1, 1,
0.3290061, -0.1204664, 1.611317, 1, 0, 0, 1, 1,
0.3298543, 1.146861, -0.09427837, 1, 0, 0, 1, 1,
0.3303839, -1.230198, 3.806184, 1, 0, 0, 1, 1,
0.3330649, -2.049729, 4.570388, 1, 0, 0, 1, 1,
0.3341857, 0.004932537, -0.9414026, 1, 0, 0, 1, 1,
0.3361616, -0.4401597, 3.583927, 0, 0, 0, 1, 1,
0.3388535, -0.9291899, 2.344658, 0, 0, 0, 1, 1,
0.340704, 1.460507, 1.232358, 0, 0, 0, 1, 1,
0.3479407, -0.7689567, 0.8230616, 0, 0, 0, 1, 1,
0.3483765, -0.4652056, 4.216167, 0, 0, 0, 1, 1,
0.3526863, -0.9721996, 2.8172, 0, 0, 0, 1, 1,
0.3536238, -0.3523036, 3.409332, 0, 0, 0, 1, 1,
0.3539834, 0.3074507, 0.9707729, 1, 1, 1, 1, 1,
0.3578018, 2.358434, -0.1205546, 1, 1, 1, 1, 1,
0.3595327, 1.539969, 0.9287937, 1, 1, 1, 1, 1,
0.3607508, 0.5921392, 1.947222, 1, 1, 1, 1, 1,
0.3631103, 1.165583, -1.614261, 1, 1, 1, 1, 1,
0.3645549, 1.488215, 0.9889165, 1, 1, 1, 1, 1,
0.3682725, -0.5186517, 1.772625, 1, 1, 1, 1, 1,
0.3716683, 1.082488, -0.2703625, 1, 1, 1, 1, 1,
0.3727122, -0.3643699, 1.694723, 1, 1, 1, 1, 1,
0.3764915, -1.631247, 3.034822, 1, 1, 1, 1, 1,
0.3778125, 1.579805, 0.8128138, 1, 1, 1, 1, 1,
0.3812645, -1.372844, 4.173838, 1, 1, 1, 1, 1,
0.3814856, -0.8311149, 3.096281, 1, 1, 1, 1, 1,
0.3846459, -0.02832308, 1.269869, 1, 1, 1, 1, 1,
0.385649, -1.297242, 3.024418, 1, 1, 1, 1, 1,
0.3870484, 0.5174847, 0.3283131, 0, 0, 1, 1, 1,
0.3888938, -1.270481, 2.304568, 1, 0, 0, 1, 1,
0.3928286, -0.5912555, 1.44009, 1, 0, 0, 1, 1,
0.3928523, 0.2403708, 1.879214, 1, 0, 0, 1, 1,
0.3954512, 0.8955506, -0.7661854, 1, 0, 0, 1, 1,
0.3958382, 0.4713229, 1.5632, 1, 0, 0, 1, 1,
0.3969551, 1.781745, -2.159569, 0, 0, 0, 1, 1,
0.4037298, -1.454238, 3.008514, 0, 0, 0, 1, 1,
0.4072971, -0.7027721, 5.099726, 0, 0, 0, 1, 1,
0.4153633, -1.317888, 2.830353, 0, 0, 0, 1, 1,
0.4196068, -0.8925921, 3.325656, 0, 0, 0, 1, 1,
0.4217126, -0.0672058, 3.211419, 0, 0, 0, 1, 1,
0.4247327, -0.4601415, 2.785315, 0, 0, 0, 1, 1,
0.426146, -1.041618, 5.013204, 1, 1, 1, 1, 1,
0.4267107, 0.4591586, 1.29029, 1, 1, 1, 1, 1,
0.4301868, 0.2568592, 1.291727, 1, 1, 1, 1, 1,
0.4311568, -0.3276476, 2.060415, 1, 1, 1, 1, 1,
0.4327141, 0.9425223, 0.9684203, 1, 1, 1, 1, 1,
0.4432541, 0.7304645, 0.1789295, 1, 1, 1, 1, 1,
0.4433665, 1.501572, 0.5506749, 1, 1, 1, 1, 1,
0.4447344, -0.9811475, 0.5292851, 1, 1, 1, 1, 1,
0.4481498, 1.267895, -1.304196, 1, 1, 1, 1, 1,
0.4495863, -0.6761703, 2.843327, 1, 1, 1, 1, 1,
0.4574656, 1.069338, -1.06214, 1, 1, 1, 1, 1,
0.4595627, 0.6042261, 0.3662539, 1, 1, 1, 1, 1,
0.4623324, 0.3335577, 0.9345823, 1, 1, 1, 1, 1,
0.463687, -0.8498134, 2.729867, 1, 1, 1, 1, 1,
0.4675131, -0.795216, 3.113423, 1, 1, 1, 1, 1,
0.4722056, -0.4495987, 1.660271, 0, 0, 1, 1, 1,
0.4728523, 1.330125, 1.22929, 1, 0, 0, 1, 1,
0.4757104, 1.210895, 1.137965, 1, 0, 0, 1, 1,
0.476399, 1.759901, -1.648599, 1, 0, 0, 1, 1,
0.4765716, -2.235375, 3.646752, 1, 0, 0, 1, 1,
0.4830811, 0.1433041, 0.9372833, 1, 0, 0, 1, 1,
0.4848476, -0.5440297, 2.569355, 0, 0, 0, 1, 1,
0.486367, -0.3035692, 2.287305, 0, 0, 0, 1, 1,
0.4886466, 0.3019383, 2.262859, 0, 0, 0, 1, 1,
0.4916918, 0.3797526, -1.273687, 0, 0, 0, 1, 1,
0.4930335, 1.673551, 2.838248, 0, 0, 0, 1, 1,
0.4984375, -0.846877, 2.241872, 0, 0, 0, 1, 1,
0.4997907, -0.4690616, -0.2635643, 0, 0, 0, 1, 1,
0.5099132, -0.3856028, 3.253618, 1, 1, 1, 1, 1,
0.5105973, 0.2010642, 1.795743, 1, 1, 1, 1, 1,
0.513729, -0.1653747, 1.748964, 1, 1, 1, 1, 1,
0.5150592, -0.7081073, 2.207024, 1, 1, 1, 1, 1,
0.5163963, -1.000176, 3.077675, 1, 1, 1, 1, 1,
0.518626, -1.435422, 2.94702, 1, 1, 1, 1, 1,
0.5187048, -0.003767048, 0.5797784, 1, 1, 1, 1, 1,
0.5192782, -0.4475359, 4.786609, 1, 1, 1, 1, 1,
0.5206665, 0.6842538, -0.09715326, 1, 1, 1, 1, 1,
0.5266224, 0.1767202, 2.112131, 1, 1, 1, 1, 1,
0.5270724, -0.1821348, 1.892315, 1, 1, 1, 1, 1,
0.5291807, -0.582857, 2.998347, 1, 1, 1, 1, 1,
0.5295256, 0.4161328, -0.1077526, 1, 1, 1, 1, 1,
0.5301555, 0.1797962, -0.1157123, 1, 1, 1, 1, 1,
0.5409043, 2.174585, -0.01005061, 1, 1, 1, 1, 1,
0.5410674, 2.092867, 1.04293, 0, 0, 1, 1, 1,
0.5420689, 0.1246389, 1.110725, 1, 0, 0, 1, 1,
0.5422934, 1.114672, 0.8090726, 1, 0, 0, 1, 1,
0.5461929, 0.2512528, 0.7903368, 1, 0, 0, 1, 1,
0.5530627, -0.1797134, 1.14615, 1, 0, 0, 1, 1,
0.5540384, -1.73788, 2.283046, 1, 0, 0, 1, 1,
0.557106, 0.8290781, 2.599405, 0, 0, 0, 1, 1,
0.5579723, -0.8986793, 4.582672, 0, 0, 0, 1, 1,
0.5586442, 2.202492, -1.601563, 0, 0, 0, 1, 1,
0.5620916, -0.4687043, 2.779602, 0, 0, 0, 1, 1,
0.5623485, -0.3691513, 3.416136, 0, 0, 0, 1, 1,
0.5645815, -1.627003, 3.250795, 0, 0, 0, 1, 1,
0.5647677, 1.061262, 1.641794, 0, 0, 0, 1, 1,
0.5667642, 1.244444, -0.06504273, 1, 1, 1, 1, 1,
0.5730333, 1.090579, 1.907644, 1, 1, 1, 1, 1,
0.5750486, 1.338123, 0.2606858, 1, 1, 1, 1, 1,
0.5772426, 0.7069607, 0.1002835, 1, 1, 1, 1, 1,
0.5854416, -0.05056054, 0.5844379, 1, 1, 1, 1, 1,
0.5859184, -0.01503095, 0.5348613, 1, 1, 1, 1, 1,
0.5878256, 3.190139, 0.2900468, 1, 1, 1, 1, 1,
0.5925599, 0.5341258, -0.3270726, 1, 1, 1, 1, 1,
0.5934174, 1.427425, 0.3952781, 1, 1, 1, 1, 1,
0.593646, 1.50914, -0.5381806, 1, 1, 1, 1, 1,
0.5956352, 2.994204, 0.1450734, 1, 1, 1, 1, 1,
0.5995739, 0.1554485, 1.493333, 1, 1, 1, 1, 1,
0.5998452, 0.2179857, 1.26888, 1, 1, 1, 1, 1,
0.6003644, 0.2576361, 0.482527, 1, 1, 1, 1, 1,
0.6029577, -0.4210994, 0.7412356, 1, 1, 1, 1, 1,
0.6060441, -0.604202, 1.874337, 0, 0, 1, 1, 1,
0.6067551, 0.94657, -0.4926404, 1, 0, 0, 1, 1,
0.6149911, -0.07819284, 2.25347, 1, 0, 0, 1, 1,
0.6220788, 1.241513, 1.92319, 1, 0, 0, 1, 1,
0.6225055, -1.721763, 1.815102, 1, 0, 0, 1, 1,
0.6239089, 1.037053, -0.6928784, 1, 0, 0, 1, 1,
0.630959, 0.5399318, 1.589337, 0, 0, 0, 1, 1,
0.6336925, 0.2739482, 1.951057, 0, 0, 0, 1, 1,
0.6355481, -0.6432784, 3.604956, 0, 0, 0, 1, 1,
0.6400712, -0.3613707, 2.63211, 0, 0, 0, 1, 1,
0.641349, -0.1886075, 2.625702, 0, 0, 0, 1, 1,
0.6416103, 0.2793022, 1.345117, 0, 0, 0, 1, 1,
0.6438701, 1.030716, 0.4070539, 0, 0, 0, 1, 1,
0.6453916, -0.7685003, 1.968899, 1, 1, 1, 1, 1,
0.6455341, 0.9859427, -1.670951, 1, 1, 1, 1, 1,
0.647634, 2.086805, -1.36664, 1, 1, 1, 1, 1,
0.6549402, 1.103655, 0.1534665, 1, 1, 1, 1, 1,
0.658388, 1.491265, 0.9930204, 1, 1, 1, 1, 1,
0.6628023, -0.5902007, 1.461838, 1, 1, 1, 1, 1,
0.6657175, 1.129114, 0.7926613, 1, 1, 1, 1, 1,
0.6672043, -1.08248, 2.74721, 1, 1, 1, 1, 1,
0.6684104, 0.6344645, 1.59124, 1, 1, 1, 1, 1,
0.6743068, -0.4828015, 1.706403, 1, 1, 1, 1, 1,
0.6748809, -1.529158, 4.343016, 1, 1, 1, 1, 1,
0.674966, 0.2595516, 2.04417, 1, 1, 1, 1, 1,
0.6752352, -0.5206205, 3.641387, 1, 1, 1, 1, 1,
0.6860705, 0.2600644, 0.570627, 1, 1, 1, 1, 1,
0.6866274, -0.09312106, 1.277447, 1, 1, 1, 1, 1,
0.6954879, 0.529815, 0.5456125, 0, 0, 1, 1, 1,
0.7010191, -0.3403412, 2.317714, 1, 0, 0, 1, 1,
0.7028719, 1.509546, -0.01403923, 1, 0, 0, 1, 1,
0.7241396, 0.01201847, 2.536057, 1, 0, 0, 1, 1,
0.7244447, 1.27616, 0.9156169, 1, 0, 0, 1, 1,
0.7249052, -0.6885822, 1.665132, 1, 0, 0, 1, 1,
0.7260513, 1.488138, -0.1732719, 0, 0, 0, 1, 1,
0.7328812, -0.7573255, 1.624755, 0, 0, 0, 1, 1,
0.7353423, -0.7750127, 4.163772, 0, 0, 0, 1, 1,
0.75129, -0.2149846, 1.644744, 0, 0, 0, 1, 1,
0.752, -1.677226, 2.851586, 0, 0, 0, 1, 1,
0.7534394, -0.2621215, 2.162764, 0, 0, 0, 1, 1,
0.7534649, 0.7465612, 1.781188, 0, 0, 0, 1, 1,
0.7570457, 0.3889806, 0.6989084, 1, 1, 1, 1, 1,
0.7578004, -1.53563, 2.61719, 1, 1, 1, 1, 1,
0.7582083, -2.820945, 3.183218, 1, 1, 1, 1, 1,
0.7607778, 0.3645752, 1.546323, 1, 1, 1, 1, 1,
0.7619908, -0.06221499, 1.114241, 1, 1, 1, 1, 1,
0.7623393, 0.8663855, 2.205405, 1, 1, 1, 1, 1,
0.7647926, 0.604831, 0.6858302, 1, 1, 1, 1, 1,
0.7655031, -0.6322659, 0.4284121, 1, 1, 1, 1, 1,
0.772189, 1.779289, 0.4025126, 1, 1, 1, 1, 1,
0.7791197, 0.3617347, 0.2068336, 1, 1, 1, 1, 1,
0.7809955, 0.32008, 0.2796978, 1, 1, 1, 1, 1,
0.7815405, 1.177944, -0.792773, 1, 1, 1, 1, 1,
0.7839258, 1.185047, 0.5835599, 1, 1, 1, 1, 1,
0.7870097, 1.014939, -0.6249771, 1, 1, 1, 1, 1,
0.7914217, -0.5209654, 3.818165, 1, 1, 1, 1, 1,
0.7951211, -0.7117053, 3.88404, 0, 0, 1, 1, 1,
0.7963195, 2.014139, -0.1635782, 1, 0, 0, 1, 1,
0.8003424, -1.082838, 2.216645, 1, 0, 0, 1, 1,
0.8079501, -0.573636, 2.809421, 1, 0, 0, 1, 1,
0.8112523, 1.047814, 1.406242, 1, 0, 0, 1, 1,
0.8119524, -1.060079, 2.25845, 1, 0, 0, 1, 1,
0.8145027, -0.09582385, 3.15905, 0, 0, 0, 1, 1,
0.8190202, 0.3647833, -0.004247858, 0, 0, 0, 1, 1,
0.8250437, 0.6073642, 0.146456, 0, 0, 0, 1, 1,
0.8262891, -0.1478658, 2.005194, 0, 0, 0, 1, 1,
0.8265809, -1.930811, 2.210103, 0, 0, 0, 1, 1,
0.82807, 0.6879909, 1.038763, 0, 0, 0, 1, 1,
0.8335115, 0.008932558, 1.273115, 0, 0, 0, 1, 1,
0.8364354, 1.61101, 1.72295, 1, 1, 1, 1, 1,
0.8469299, -0.6349081, 1.341223, 1, 1, 1, 1, 1,
0.8480378, -1.225136, 3.163041, 1, 1, 1, 1, 1,
0.851952, 1.72853, 1.157055, 1, 1, 1, 1, 1,
0.8619255, 1.783872, -1.066954, 1, 1, 1, 1, 1,
0.8747435, 1.002821, 0.6539583, 1, 1, 1, 1, 1,
0.8753774, 0.9020112, -0.2584108, 1, 1, 1, 1, 1,
0.8763627, -0.4341737, 0.9495111, 1, 1, 1, 1, 1,
0.8895252, -1.360932, 1.553244, 1, 1, 1, 1, 1,
0.889973, -0.1067959, 1.015766, 1, 1, 1, 1, 1,
0.8909922, 0.02622099, 3.43251, 1, 1, 1, 1, 1,
0.9080942, 0.6614978, 1.328536, 1, 1, 1, 1, 1,
0.912268, 1.677117, 1.996112, 1, 1, 1, 1, 1,
0.926103, 0.9615571, 1.45404, 1, 1, 1, 1, 1,
0.9340487, -0.1142706, 1.900038, 1, 1, 1, 1, 1,
0.9345061, -0.1148468, 1.656245, 0, 0, 1, 1, 1,
0.9364696, -0.7798443, 3.319219, 1, 0, 0, 1, 1,
0.9369231, 0.02454619, 0.9507842, 1, 0, 0, 1, 1,
0.9372135, 0.5110711, 1.052433, 1, 0, 0, 1, 1,
0.9372195, 0.3383276, 1.728862, 1, 0, 0, 1, 1,
0.9412701, 0.5918031, 2.303513, 1, 0, 0, 1, 1,
0.9479715, 2.384073, 1.711206, 0, 0, 0, 1, 1,
0.9624806, 0.01386836, 1.489005, 0, 0, 0, 1, 1,
0.9652228, -1.202072, 2.808184, 0, 0, 0, 1, 1,
0.9657338, 0.4289421, 0.9045207, 0, 0, 0, 1, 1,
0.9658486, 0.624772, 0.3681004, 0, 0, 0, 1, 1,
0.9664065, 0.6007523, 2.032555, 0, 0, 0, 1, 1,
0.9781845, 0.4048547, 2.430719, 0, 0, 0, 1, 1,
0.9798819, 0.953548, 0.0175822, 1, 1, 1, 1, 1,
0.9823965, 0.5168761, 0.9775267, 1, 1, 1, 1, 1,
0.9830441, 2.142083, -0.08144846, 1, 1, 1, 1, 1,
0.9835381, 0.2289432, 0.6420785, 1, 1, 1, 1, 1,
0.9843972, -0.3460838, 3.920723, 1, 1, 1, 1, 1,
0.9882743, -0.005386287, 1.896088, 1, 1, 1, 1, 1,
0.9887333, -0.8665538, 0.6428422, 1, 1, 1, 1, 1,
0.9903145, -0.3416688, 2.850978, 1, 1, 1, 1, 1,
0.9917459, 0.8454681, -0.7427676, 1, 1, 1, 1, 1,
0.9949304, -0.8451063, 2.165104, 1, 1, 1, 1, 1,
0.9980889, -0.3766622, 1.094917, 1, 1, 1, 1, 1,
1.000764, 1.124544, 1.04095, 1, 1, 1, 1, 1,
1.0117, -0.6031222, 1.276538, 1, 1, 1, 1, 1,
1.025488, 0.4392169, 1.603867, 1, 1, 1, 1, 1,
1.027634, -1.335725, 2.14613, 1, 1, 1, 1, 1,
1.027636, -0.6753273, 0.9836702, 0, 0, 1, 1, 1,
1.033813, -0.3442931, 1.586934, 1, 0, 0, 1, 1,
1.034578, 0.1515024, 0.2252862, 1, 0, 0, 1, 1,
1.036328, -0.6193991, 1.975365, 1, 0, 0, 1, 1,
1.036356, 1.6267, -0.2543893, 1, 0, 0, 1, 1,
1.040639, 0.7543398, 1.005342, 1, 0, 0, 1, 1,
1.042933, 0.3979304, 0.8177231, 0, 0, 0, 1, 1,
1.054403, -0.5420171, 1.556639, 0, 0, 0, 1, 1,
1.056648, 0.7747668, -0.3179933, 0, 0, 0, 1, 1,
1.060883, -0.1254833, 2.31352, 0, 0, 0, 1, 1,
1.064162, 0.8585503, -0.6823445, 0, 0, 0, 1, 1,
1.064212, -1.714708, 2.838132, 0, 0, 0, 1, 1,
1.065112, 0.9689451, 0.02157406, 0, 0, 0, 1, 1,
1.066441, 0.3048061, 1.011698, 1, 1, 1, 1, 1,
1.06743, -0.5404286, 2.006092, 1, 1, 1, 1, 1,
1.070293, 1.425842, -0.06802399, 1, 1, 1, 1, 1,
1.078405, -0.08236887, 1.432938, 1, 1, 1, 1, 1,
1.083282, 0.7755103, 0.6064011, 1, 1, 1, 1, 1,
1.084252, 0.9351591, -0.09314933, 1, 1, 1, 1, 1,
1.084522, -0.2510649, 2.042205, 1, 1, 1, 1, 1,
1.084641, -0.578033, 0.5746885, 1, 1, 1, 1, 1,
1.092262, -1.851533, 2.185255, 1, 1, 1, 1, 1,
1.094574, 2.266335, 0.6108873, 1, 1, 1, 1, 1,
1.098738, -0.8834906, 3.379369, 1, 1, 1, 1, 1,
1.10381, -0.1092245, 2.300421, 1, 1, 1, 1, 1,
1.106375, 0.5450305, 0.4774669, 1, 1, 1, 1, 1,
1.11146, -1.2842, 1.942249, 1, 1, 1, 1, 1,
1.121265, 0.04929647, 2.370676, 1, 1, 1, 1, 1,
1.125341, -0.4039725, 1.653479, 0, 0, 1, 1, 1,
1.12696, -0.1574875, 3.158748, 1, 0, 0, 1, 1,
1.129319, 1.588871, 1.693357, 1, 0, 0, 1, 1,
1.133536, -0.5441608, 2.893616, 1, 0, 0, 1, 1,
1.13476, 0.07482545, 1.329918, 1, 0, 0, 1, 1,
1.14542, 0.7071152, -0.2504945, 1, 0, 0, 1, 1,
1.15203, 0.6960323, 0.09685669, 0, 0, 0, 1, 1,
1.152349, 0.9229655, 0.8327674, 0, 0, 0, 1, 1,
1.161469, 0.9794963, 0.9653096, 0, 0, 0, 1, 1,
1.206129, -1.306836, 1.83408, 0, 0, 0, 1, 1,
1.211255, -0.9915992, 1.973563, 0, 0, 0, 1, 1,
1.215529, 1.650527, 1.833069, 0, 0, 0, 1, 1,
1.219428, -0.32118, 2.655184, 0, 0, 0, 1, 1,
1.220328, -0.06792381, 0.5736913, 1, 1, 1, 1, 1,
1.22944, 0.8513101, 1.847241, 1, 1, 1, 1, 1,
1.231794, 2.656384, 0.9173204, 1, 1, 1, 1, 1,
1.234593, -0.3141998, 1.494262, 1, 1, 1, 1, 1,
1.243218, 0.2255865, 1.592673, 1, 1, 1, 1, 1,
1.250968, -0.5051646, 1.263264, 1, 1, 1, 1, 1,
1.254512, 0.1082231, 1.064342, 1, 1, 1, 1, 1,
1.255338, 0.06047443, 1.963295, 1, 1, 1, 1, 1,
1.263626, -0.4371122, 0.5140234, 1, 1, 1, 1, 1,
1.266145, -0.2505963, 4.017488, 1, 1, 1, 1, 1,
1.27647, 0.3157751, 1.302477, 1, 1, 1, 1, 1,
1.280865, 2.076662, 1.25786, 1, 1, 1, 1, 1,
1.287188, -0.8017755, 2.576824, 1, 1, 1, 1, 1,
1.288496, -0.6900793, 1.405068, 1, 1, 1, 1, 1,
1.292078, -0.4624287, 1.735686, 1, 1, 1, 1, 1,
1.294738, -1.191563, 1.894518, 0, 0, 1, 1, 1,
1.297845, -1.07544, 1.676764, 1, 0, 0, 1, 1,
1.310736, 1.150941, 0.4987562, 1, 0, 0, 1, 1,
1.311067, 1.53337, 0.1173393, 1, 0, 0, 1, 1,
1.312838, 0.5322492, 1.734119, 1, 0, 0, 1, 1,
1.314619, 0.9206734, 1.342517, 1, 0, 0, 1, 1,
1.321313, 0.1507329, 2.025021, 0, 0, 0, 1, 1,
1.32528, 1.674966, -1.068936, 0, 0, 0, 1, 1,
1.332872, 0.9800606, 1.064677, 0, 0, 0, 1, 1,
1.345022, -0.1910772, 1.006646, 0, 0, 0, 1, 1,
1.366054, 2.029435, 0.1862595, 0, 0, 0, 1, 1,
1.367367, -1.645365, 2.201294, 0, 0, 0, 1, 1,
1.368765, -0.1483921, 2.225478, 0, 0, 0, 1, 1,
1.3694, 0.2019605, 0.5441796, 1, 1, 1, 1, 1,
1.371459, 0.5260792, 2.299008, 1, 1, 1, 1, 1,
1.373719, -1.573655, 1.153955, 1, 1, 1, 1, 1,
1.376219, -0.6151786, 2.281265, 1, 1, 1, 1, 1,
1.389552, 0.4151533, 1.744413, 1, 1, 1, 1, 1,
1.394435, -1.932661, 3.729514, 1, 1, 1, 1, 1,
1.405184, -0.02470539, 3.926139, 1, 1, 1, 1, 1,
1.408288, 1.441047, 1.019553, 1, 1, 1, 1, 1,
1.414512, -1.430364, 3.034592, 1, 1, 1, 1, 1,
1.41747, 0.9032843, -0.9537889, 1, 1, 1, 1, 1,
1.439525, 1.209331, 0.2616704, 1, 1, 1, 1, 1,
1.453521, -0.6072721, 2.218721, 1, 1, 1, 1, 1,
1.453564, 1.348011, 0.8237885, 1, 1, 1, 1, 1,
1.453613, 1.20983, 2.286402, 1, 1, 1, 1, 1,
1.45575, -0.903785, 3.407508, 1, 1, 1, 1, 1,
1.474217, -1.772997, 2.195336, 0, 0, 1, 1, 1,
1.480495, -0.2883271, 3.482658, 1, 0, 0, 1, 1,
1.483876, -0.8857394, 3.225905, 1, 0, 0, 1, 1,
1.499858, -0.4139283, 2.261776, 1, 0, 0, 1, 1,
1.508967, -0.8397155, 2.266015, 1, 0, 0, 1, 1,
1.51086, 0.07087966, 2.144503, 1, 0, 0, 1, 1,
1.512, 1.373371, -1.344844, 0, 0, 0, 1, 1,
1.513793, 0.5253155, 2.310898, 0, 0, 0, 1, 1,
1.514306, 1.161534, 1.523138, 0, 0, 0, 1, 1,
1.531288, 0.2599436, 2.449552, 0, 0, 0, 1, 1,
1.532033, 0.7582285, 2.475918, 0, 0, 0, 1, 1,
1.539024, 0.6204877, 1.583315, 0, 0, 0, 1, 1,
1.547582, 1.268903, 0.2242051, 0, 0, 0, 1, 1,
1.553684, -0.2638476, 2.726662, 1, 1, 1, 1, 1,
1.556383, -1.627867, 1.575121, 1, 1, 1, 1, 1,
1.556446, 1.15118, 1.277754, 1, 1, 1, 1, 1,
1.56123, -0.6892058, 2.968129, 1, 1, 1, 1, 1,
1.564952, 0.3748981, 3.26484, 1, 1, 1, 1, 1,
1.566722, 1.727131, -0.1903172, 1, 1, 1, 1, 1,
1.567591, 1.40016, 1.192438, 1, 1, 1, 1, 1,
1.587393, 0.1764084, 0.8245351, 1, 1, 1, 1, 1,
1.595248, 0.6629262, 2.103934, 1, 1, 1, 1, 1,
1.601813, 0.6390566, 1.639931, 1, 1, 1, 1, 1,
1.60183, -1.543095, 3.364457, 1, 1, 1, 1, 1,
1.611578, 2.201818, -0.2289416, 1, 1, 1, 1, 1,
1.612144, -0.5830572, 1.634534, 1, 1, 1, 1, 1,
1.61663, -0.2649662, 0.5940243, 1, 1, 1, 1, 1,
1.621313, -0.3395571, 2.453568, 1, 1, 1, 1, 1,
1.624847, -0.6544169, 2.897187, 0, 0, 1, 1, 1,
1.630642, 0.8825782, 1.53133, 1, 0, 0, 1, 1,
1.642435, -0.6720496, 1.071017, 1, 0, 0, 1, 1,
1.642695, 0.8729742, -0.03077605, 1, 0, 0, 1, 1,
1.648376, 0.4296556, 1.728673, 1, 0, 0, 1, 1,
1.65941, 0.3264197, 2.040792, 1, 0, 0, 1, 1,
1.672315, 0.1633502, 1.598151, 0, 0, 0, 1, 1,
1.674756, -0.8176204, 1.007087, 0, 0, 0, 1, 1,
1.681279, 0.0537112, 3.398808, 0, 0, 0, 1, 1,
1.688276, 0.1086736, 0.5472831, 0, 0, 0, 1, 1,
1.698052, -0.1388866, 2.058951, 0, 0, 0, 1, 1,
1.703556, 1.177792, 0.2082639, 0, 0, 0, 1, 1,
1.711318, -0.3913372, 2.306289, 0, 0, 0, 1, 1,
1.71743, -0.2990004, 2.419018, 1, 1, 1, 1, 1,
1.72654, 1.844981, 0.1557147, 1, 1, 1, 1, 1,
1.746195, 0.1025676, 0.8399969, 1, 1, 1, 1, 1,
1.749578, 0.8529522, 1.37777, 1, 1, 1, 1, 1,
1.756421, 0.9272589, 1.074845, 1, 1, 1, 1, 1,
1.767486, 0.3209148, 1.944668, 1, 1, 1, 1, 1,
1.767909, 0.7219743, 0.7839852, 1, 1, 1, 1, 1,
1.777551, 0.4154119, 2.093908, 1, 1, 1, 1, 1,
1.781549, 0.9144984, 1.03983, 1, 1, 1, 1, 1,
1.798974, 2.721602, 1.49209, 1, 1, 1, 1, 1,
1.84524, -0.7633726, 2.387829, 1, 1, 1, 1, 1,
1.888863, -0.8747615, 2.309405, 1, 1, 1, 1, 1,
1.89339, -0.1130924, 0.4317183, 1, 1, 1, 1, 1,
1.913434, 0.03732095, 0.1734091, 1, 1, 1, 1, 1,
1.923327, -0.499393, 1.539069, 1, 1, 1, 1, 1,
2.017521, 2.687994, 0.282515, 0, 0, 1, 1, 1,
2.075135, 0.5845707, -0.6032098, 1, 0, 0, 1, 1,
2.079854, 0.1017351, 1.786785, 1, 0, 0, 1, 1,
2.080703, 0.41246, 3.607725, 1, 0, 0, 1, 1,
2.086, 0.9355952, 2.388659, 1, 0, 0, 1, 1,
2.088424, 0.1343924, 2.02064, 1, 0, 0, 1, 1,
2.127202, -1.606466, 2.49795, 0, 0, 0, 1, 1,
2.188137, 0.8588939, 0.645723, 0, 0, 0, 1, 1,
2.233803, -0.2580776, 4.367302, 0, 0, 0, 1, 1,
2.258272, -2.005079, 1.128799, 0, 0, 0, 1, 1,
2.283862, 0.7297463, 0.6698977, 0, 0, 0, 1, 1,
2.300233, 1.143542, 2.987835, 0, 0, 0, 1, 1,
2.325248, -0.3765667, 1.875349, 0, 0, 0, 1, 1,
2.400701, 0.1048956, 1.720942, 1, 1, 1, 1, 1,
2.433943, -0.1360865, 1.845612, 1, 1, 1, 1, 1,
2.463041, -0.7160629, 0.2367532, 1, 1, 1, 1, 1,
2.554469, -0.7545926, 2.250854, 1, 1, 1, 1, 1,
2.794044, -1.863509, 1.77656, 1, 1, 1, 1, 1,
2.975589, -0.02188171, 1.846484, 1, 1, 1, 1, 1,
3.070298, -0.646305, 1.489603, 1, 1, 1, 1, 1
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
var radius = 9.299639;
var distance = 32.66459;
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
mvMatrix.translate( 0.1714962, -0.1165929, -0.02624321 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.66459);
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
