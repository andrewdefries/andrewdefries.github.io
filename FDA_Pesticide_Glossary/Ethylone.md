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
-2.943479, -0.6590282, -0.5021675, 1, 0, 0, 1,
-2.78094, 0.09780613, -0.6945242, 1, 0.007843138, 0, 1,
-2.771298, -1.801413, -1.48601, 1, 0.01176471, 0, 1,
-2.588341, -0.3428346, -1.707904, 1, 0.01960784, 0, 1,
-2.571213, 0.5141842, -2.454247, 1, 0.02352941, 0, 1,
-2.549866, 0.276554, -1.076475, 1, 0.03137255, 0, 1,
-2.321737, -0.9849507, -1.284347, 1, 0.03529412, 0, 1,
-2.281208, -0.4867305, -1.207179, 1, 0.04313726, 0, 1,
-2.23851, -0.8892121, -3.216816, 1, 0.04705882, 0, 1,
-2.235229, -1.170294, -3.382652, 1, 0.05490196, 0, 1,
-2.178358, -1.961686, -0.6179622, 1, 0.05882353, 0, 1,
-2.148105, 0.2032793, -0.4506469, 1, 0.06666667, 0, 1,
-2.107721, -2.127639, -0.5860985, 1, 0.07058824, 0, 1,
-2.060929, 0.4567699, -2.239893, 1, 0.07843138, 0, 1,
-2.05578, 0.4342588, -1.515646, 1, 0.08235294, 0, 1,
-2.049989, -0.6943882, -1.490369, 1, 0.09019608, 0, 1,
-2.046622, -0.1879002, -1.971761, 1, 0.09411765, 0, 1,
-2.012773, -0.03808628, -0.5071324, 1, 0.1019608, 0, 1,
-1.993491, -0.1321259, -2.444472, 1, 0.1098039, 0, 1,
-1.958687, -0.008558543, 0.1685789, 1, 0.1137255, 0, 1,
-1.946921, 0.5672991, -0.8873102, 1, 0.1215686, 0, 1,
-1.925717, 0.7078137, -0.9797254, 1, 0.1254902, 0, 1,
-1.88994, 1.505022, -1.429315, 1, 0.1333333, 0, 1,
-1.888721, -2.59528, -1.653528, 1, 0.1372549, 0, 1,
-1.879824, -0.6225991, -1.345163, 1, 0.145098, 0, 1,
-1.86277, -1.331963, -4.348435, 1, 0.1490196, 0, 1,
-1.862362, -0.5926677, -2.280941, 1, 0.1568628, 0, 1,
-1.845004, 0.32748, -1.812237, 1, 0.1607843, 0, 1,
-1.800844, 0.2650251, -2.235051, 1, 0.1686275, 0, 1,
-1.794177, 0.6770244, -1.419464, 1, 0.172549, 0, 1,
-1.793417, -0.4904475, -3.007825, 1, 0.1803922, 0, 1,
-1.778624, 0.6325754, -1.029427, 1, 0.1843137, 0, 1,
-1.749453, 0.9913265, -0.2076218, 1, 0.1921569, 0, 1,
-1.735651, -0.1315163, -1.245853, 1, 0.1960784, 0, 1,
-1.732701, 1.323882, 0.9276392, 1, 0.2039216, 0, 1,
-1.715863, 0.2936085, -0.9812377, 1, 0.2117647, 0, 1,
-1.684268, -0.3655849, -2.351204, 1, 0.2156863, 0, 1,
-1.68323, 0.1655411, -1.77925, 1, 0.2235294, 0, 1,
-1.680864, -0.5628279, -2.080403, 1, 0.227451, 0, 1,
-1.674843, -1.068217, -3.114071, 1, 0.2352941, 0, 1,
-1.668192, -1.288538, -1.726784, 1, 0.2392157, 0, 1,
-1.654922, 0.1622946, 0.9879395, 1, 0.2470588, 0, 1,
-1.64558, -0.006359077, -2.287172, 1, 0.2509804, 0, 1,
-1.640717, -0.03831753, -1.937446, 1, 0.2588235, 0, 1,
-1.636287, -0.3427269, -2.409385, 1, 0.2627451, 0, 1,
-1.634497, 0.1637459, -0.4851801, 1, 0.2705882, 0, 1,
-1.609256, -0.8810663, -1.758914, 1, 0.2745098, 0, 1,
-1.608314, -0.003835049, -2.195968, 1, 0.282353, 0, 1,
-1.599438, -0.9369116, -3.202958, 1, 0.2862745, 0, 1,
-1.598328, 0.6757226, 0.07291183, 1, 0.2941177, 0, 1,
-1.596294, -1.486089, -2.507897, 1, 0.3019608, 0, 1,
-1.59029, 0.1806117, -2.741148, 1, 0.3058824, 0, 1,
-1.572813, 1.457961, -0.9014047, 1, 0.3137255, 0, 1,
-1.549576, -0.8332085, -1.186757, 1, 0.3176471, 0, 1,
-1.539715, 1.263854, -0.6240472, 1, 0.3254902, 0, 1,
-1.528903, -1.52473, -1.51047, 1, 0.3294118, 0, 1,
-1.524498, 0.6639714, -1.980373, 1, 0.3372549, 0, 1,
-1.523686, 0.8991661, -1.10058, 1, 0.3411765, 0, 1,
-1.508878, 0.06919045, -1.391035, 1, 0.3490196, 0, 1,
-1.506718, -0.3964707, -0.7945755, 1, 0.3529412, 0, 1,
-1.503676, 0.4430792, -0.2339463, 1, 0.3607843, 0, 1,
-1.499969, 1.471923, 1.350161, 1, 0.3647059, 0, 1,
-1.48593, -0.7055517, -3.115948, 1, 0.372549, 0, 1,
-1.481343, 1.154494, -0.5947381, 1, 0.3764706, 0, 1,
-1.480358, 0.8206092, -2.285951, 1, 0.3843137, 0, 1,
-1.478827, 0.432485, -0.5441818, 1, 0.3882353, 0, 1,
-1.476538, -1.306175, -3.642275, 1, 0.3960784, 0, 1,
-1.476249, -0.9725574, -2.858269, 1, 0.4039216, 0, 1,
-1.475217, -0.4008391, -2.197844, 1, 0.4078431, 0, 1,
-1.464866, 0.8419668, -1.29402, 1, 0.4156863, 0, 1,
-1.454358, -0.5583249, -1.206572, 1, 0.4196078, 0, 1,
-1.45284, -0.7908993, -3.552022, 1, 0.427451, 0, 1,
-1.434482, 0.4630672, -3.29046, 1, 0.4313726, 0, 1,
-1.420892, 0.4923975, -1.910555, 1, 0.4392157, 0, 1,
-1.41362, 1.574042, -1.578858, 1, 0.4431373, 0, 1,
-1.407931, -0.2229757, -2.689301, 1, 0.4509804, 0, 1,
-1.403295, 0.2750937, -2.066775, 1, 0.454902, 0, 1,
-1.399557, -2.836797, -4.709908, 1, 0.4627451, 0, 1,
-1.376745, 0.3026636, -1.057521, 1, 0.4666667, 0, 1,
-1.376128, -1.2004, -1.16843, 1, 0.4745098, 0, 1,
-1.371684, 0.4213794, -0.5098428, 1, 0.4784314, 0, 1,
-1.364378, 1.962192, -0.9553169, 1, 0.4862745, 0, 1,
-1.350519, -1.777028, -3.531106, 1, 0.4901961, 0, 1,
-1.345378, 0.3648451, -1.090742, 1, 0.4980392, 0, 1,
-1.345325, -0.2261051, -3.147844, 1, 0.5058824, 0, 1,
-1.343371, 0.01690627, -0.8914437, 1, 0.509804, 0, 1,
-1.34268, 0.6169309, -0.6575152, 1, 0.5176471, 0, 1,
-1.341431, -0.3349106, -0.3971384, 1, 0.5215687, 0, 1,
-1.323239, -0.3189431, -3.720479, 1, 0.5294118, 0, 1,
-1.32077, -0.5273631, -1.567284, 1, 0.5333334, 0, 1,
-1.312221, 0.3985339, 0.1319455, 1, 0.5411765, 0, 1,
-1.309545, -1.562222, -1.172083, 1, 0.5450981, 0, 1,
-1.306465, -0.7503063, -0.05491487, 1, 0.5529412, 0, 1,
-1.305056, 0.005790166, -0.7388706, 1, 0.5568628, 0, 1,
-1.301907, -2.244306, -2.168381, 1, 0.5647059, 0, 1,
-1.30115, -2.233403, -3.761769, 1, 0.5686275, 0, 1,
-1.300252, -0.8650188, -1.755168, 1, 0.5764706, 0, 1,
-1.29953, -0.2694657, -1.736921, 1, 0.5803922, 0, 1,
-1.298483, -0.5812908, -0.2836697, 1, 0.5882353, 0, 1,
-1.277306, -1.388512, -1.938165, 1, 0.5921569, 0, 1,
-1.274527, 0.5277949, -0.2599336, 1, 0.6, 0, 1,
-1.271006, 0.3838429, 0.007338594, 1, 0.6078432, 0, 1,
-1.266491, 0.7511514, -2.086812, 1, 0.6117647, 0, 1,
-1.266249, -0.09565477, -1.529868, 1, 0.6196079, 0, 1,
-1.261428, -1.189148, -1.428003, 1, 0.6235294, 0, 1,
-1.260823, 0.7849224, -2.801584, 1, 0.6313726, 0, 1,
-1.255695, 1.300276, 0.3258765, 1, 0.6352941, 0, 1,
-1.248353, -0.1333213, -2.033859, 1, 0.6431373, 0, 1,
-1.24506, 1.269644, 0.8637096, 1, 0.6470588, 0, 1,
-1.238677, 0.7066151, -1.090344, 1, 0.654902, 0, 1,
-1.235637, -0.6616597, -1.829545, 1, 0.6588235, 0, 1,
-1.233631, -0.3924997, -2.885204, 1, 0.6666667, 0, 1,
-1.231278, 0.05818491, 0.2771825, 1, 0.6705883, 0, 1,
-1.225768, -2.394213, -2.636141, 1, 0.6784314, 0, 1,
-1.220027, -0.3964325, -1.564386, 1, 0.682353, 0, 1,
-1.217395, -0.1607058, -2.578152, 1, 0.6901961, 0, 1,
-1.215502, -0.2275494, -2.728431, 1, 0.6941177, 0, 1,
-1.203566, -1.004806, -1.427209, 1, 0.7019608, 0, 1,
-1.196917, 0.6390803, -1.95041, 1, 0.7098039, 0, 1,
-1.196865, 1.036025, -0.4285067, 1, 0.7137255, 0, 1,
-1.194728, 2.318099, -2.103813, 1, 0.7215686, 0, 1,
-1.193466, -0.3803869, -2.982315, 1, 0.7254902, 0, 1,
-1.192583, 2.002317, -1.232242, 1, 0.7333333, 0, 1,
-1.184758, -0.4061998, -1.343966, 1, 0.7372549, 0, 1,
-1.172831, 0.5616255, -1.285371, 1, 0.7450981, 0, 1,
-1.162667, -1.319893, -2.382946, 1, 0.7490196, 0, 1,
-1.148978, 0.03041539, -3.029651, 1, 0.7568628, 0, 1,
-1.143214, 0.2156183, -1.364808, 1, 0.7607843, 0, 1,
-1.139401, 0.637297, -0.09597185, 1, 0.7686275, 0, 1,
-1.137763, 0.5982552, -1.165001, 1, 0.772549, 0, 1,
-1.130099, 0.5383524, -1.658984, 1, 0.7803922, 0, 1,
-1.122835, -0.5642487, -1.381648, 1, 0.7843137, 0, 1,
-1.12014, -1.616153, -1.942478, 1, 0.7921569, 0, 1,
-1.116194, -0.2515801, 0.1148683, 1, 0.7960784, 0, 1,
-1.102946, -0.9672769, -3.693557, 1, 0.8039216, 0, 1,
-1.102913, 0.7049848, -0.9321272, 1, 0.8117647, 0, 1,
-1.101486, 0.06652434, -1.630421, 1, 0.8156863, 0, 1,
-1.101136, 1.095766, -1.935459, 1, 0.8235294, 0, 1,
-1.095031, -1.019726, -2.219564, 1, 0.827451, 0, 1,
-1.091233, 0.2920965, -1.617041, 1, 0.8352941, 0, 1,
-1.087739, -0.5922275, -2.932667, 1, 0.8392157, 0, 1,
-1.084888, 0.3332778, -1.346701, 1, 0.8470588, 0, 1,
-1.081543, -0.9483277, -0.2996163, 1, 0.8509804, 0, 1,
-1.081101, 1.172138, -0.9404662, 1, 0.8588235, 0, 1,
-1.078867, -1.835579, -1.381774, 1, 0.8627451, 0, 1,
-1.071503, -0.4622526, -1.924796, 1, 0.8705882, 0, 1,
-1.0704, 0.6240529, -2.403544, 1, 0.8745098, 0, 1,
-1.064456, -0.1717797, -3.144827, 1, 0.8823529, 0, 1,
-1.062988, -0.76843, -0.5956325, 1, 0.8862745, 0, 1,
-1.054008, -0.1871441, -0.7825776, 1, 0.8941177, 0, 1,
-1.053517, 1.240391, -3.078169, 1, 0.8980392, 0, 1,
-1.053322, 0.06755189, -2.59268, 1, 0.9058824, 0, 1,
-1.0417, 0.04457453, -0.8995695, 1, 0.9137255, 0, 1,
-1.040961, 2.892605, -0.5116361, 1, 0.9176471, 0, 1,
-1.035581, 0.06423755, -2.791025, 1, 0.9254902, 0, 1,
-1.034471, 0.1695066, -0.2326783, 1, 0.9294118, 0, 1,
-1.021299, 0.989237, -0.6725513, 1, 0.9372549, 0, 1,
-1.017819, 1.775197, -0.002425254, 1, 0.9411765, 0, 1,
-1.014666, 0.3414577, -3.151159, 1, 0.9490196, 0, 1,
-1.009038, 0.4685661, 0.3258666, 1, 0.9529412, 0, 1,
-1.007437, 1.188503, -1.121059, 1, 0.9607843, 0, 1,
-1.005145, -1.16104, -3.47565, 1, 0.9647059, 0, 1,
-1.004689, -0.6797119, -1.574726, 1, 0.972549, 0, 1,
-1.003377, -2.675306, -3.139772, 1, 0.9764706, 0, 1,
-0.9943307, -0.7999801, -2.196884, 1, 0.9843137, 0, 1,
-0.9904459, 0.6036701, 0.2582459, 1, 0.9882353, 0, 1,
-0.9870459, 0.0205566, -1.222879, 1, 0.9960784, 0, 1,
-0.9823463, 1.843095, -0.7745811, 0.9960784, 1, 0, 1,
-0.9812189, 0.9492365, -0.7351387, 0.9921569, 1, 0, 1,
-0.9811883, 0.5045346, -1.322024, 0.9843137, 1, 0, 1,
-0.9756871, 0.8178605, 0.456618, 0.9803922, 1, 0, 1,
-0.9751828, 0.07419305, -3.159209, 0.972549, 1, 0, 1,
-0.9741001, 0.5419355, -1.963162, 0.9686275, 1, 0, 1,
-0.9736597, -1.62827, -2.848761, 0.9607843, 1, 0, 1,
-0.9714438, 0.5853238, -1.724559, 0.9568627, 1, 0, 1,
-0.9665868, 0.1981892, -3.795188, 0.9490196, 1, 0, 1,
-0.9625984, 0.3181089, -1.490372, 0.945098, 1, 0, 1,
-0.9621026, 0.4434471, -1.458611, 0.9372549, 1, 0, 1,
-0.9578814, 1.286604, 1.26003, 0.9333333, 1, 0, 1,
-0.9549956, 1.373141, -1.032955, 0.9254902, 1, 0, 1,
-0.9506281, -0.3110247, -0.5726409, 0.9215686, 1, 0, 1,
-0.9487987, 0.4434306, -1.806682, 0.9137255, 1, 0, 1,
-0.939367, -0.160982, -2.07145, 0.9098039, 1, 0, 1,
-0.9387181, -0.1146662, -2.800361, 0.9019608, 1, 0, 1,
-0.9376886, 0.03926189, -1.275658, 0.8941177, 1, 0, 1,
-0.9364477, -0.7416314, -2.819977, 0.8901961, 1, 0, 1,
-0.936373, -0.2231776, -0.2874553, 0.8823529, 1, 0, 1,
-0.9340194, -0.338457, -2.137858, 0.8784314, 1, 0, 1,
-0.9332112, -0.8225249, -3.94453, 0.8705882, 1, 0, 1,
-0.9287084, 0.9165717, -0.4099908, 0.8666667, 1, 0, 1,
-0.9241259, -1.133691, -1.054419, 0.8588235, 1, 0, 1,
-0.9223399, 0.7631573, -0.9492524, 0.854902, 1, 0, 1,
-0.9208248, 1.23409, -1.926214, 0.8470588, 1, 0, 1,
-0.9203611, 0.7176976, 0.1355415, 0.8431373, 1, 0, 1,
-0.9183042, -0.667522, -2.712189, 0.8352941, 1, 0, 1,
-0.9162477, 1.388525, -0.7240628, 0.8313726, 1, 0, 1,
-0.9120564, -0.3597655, -2.544133, 0.8235294, 1, 0, 1,
-0.910628, -0.2719404, -1.917777, 0.8196079, 1, 0, 1,
-0.9039035, 1.2229, -1.626257, 0.8117647, 1, 0, 1,
-0.9020747, 0.6800372, -1.409632, 0.8078431, 1, 0, 1,
-0.8971751, 0.08745107, -1.981007, 0.8, 1, 0, 1,
-0.8955407, 1.817813, -0.3632069, 0.7921569, 1, 0, 1,
-0.8875574, -0.1192637, -0.1963603, 0.7882353, 1, 0, 1,
-0.8863932, 1.451974, 0.3010441, 0.7803922, 1, 0, 1,
-0.8801577, -0.2567591, -1.176829, 0.7764706, 1, 0, 1,
-0.8783972, -0.692611, -2.642108, 0.7686275, 1, 0, 1,
-0.8751703, -0.4929589, -1.842004, 0.7647059, 1, 0, 1,
-0.8671729, -2.358849, -3.512268, 0.7568628, 1, 0, 1,
-0.861182, -0.05984325, -1.2215, 0.7529412, 1, 0, 1,
-0.8567988, 1.644178, 0.9711036, 0.7450981, 1, 0, 1,
-0.8527328, -0.03253921, -1.168052, 0.7411765, 1, 0, 1,
-0.8482635, 0.7470694, -0.3141301, 0.7333333, 1, 0, 1,
-0.841809, 0.1388039, -2.798667, 0.7294118, 1, 0, 1,
-0.8380411, 1.93305, 0.3684633, 0.7215686, 1, 0, 1,
-0.837935, -1.865296, -2.886984, 0.7176471, 1, 0, 1,
-0.8371449, -0.229895, -3.01314, 0.7098039, 1, 0, 1,
-0.8302109, 0.8147473, -0.6948223, 0.7058824, 1, 0, 1,
-0.8298611, -0.7096416, -2.216348, 0.6980392, 1, 0, 1,
-0.8281717, 0.1088158, -0.4188745, 0.6901961, 1, 0, 1,
-0.8280789, 1.237343, -1.015881, 0.6862745, 1, 0, 1,
-0.8275523, -0.7272469, -0.7428488, 0.6784314, 1, 0, 1,
-0.8253638, -1.221254, -1.473695, 0.6745098, 1, 0, 1,
-0.8209761, 0.2697124, -1.013251, 0.6666667, 1, 0, 1,
-0.8152482, -0.4698753, -1.677799, 0.6627451, 1, 0, 1,
-0.815012, -1.355232, -1.513448, 0.654902, 1, 0, 1,
-0.8142966, -0.4317288, -3.894437, 0.6509804, 1, 0, 1,
-0.8135864, 0.2082383, -0.5651796, 0.6431373, 1, 0, 1,
-0.812556, -0.8343863, -2.809092, 0.6392157, 1, 0, 1,
-0.8091295, 0.51943, -1.385957, 0.6313726, 1, 0, 1,
-0.8078668, 1.249167, -1.223629, 0.627451, 1, 0, 1,
-0.8023908, 0.9939822, -0.6937131, 0.6196079, 1, 0, 1,
-0.800348, -0.3488129, -3.503497, 0.6156863, 1, 0, 1,
-0.7923009, -0.1655649, -2.684914, 0.6078432, 1, 0, 1,
-0.7902403, 1.011068, -1.265, 0.6039216, 1, 0, 1,
-0.7754003, -0.1452923, 0.1821916, 0.5960785, 1, 0, 1,
-0.773575, 0.2766488, 0.7357094, 0.5882353, 1, 0, 1,
-0.7672084, -0.9553182, -0.5380126, 0.5843138, 1, 0, 1,
-0.7655172, -0.8997629, -2.748144, 0.5764706, 1, 0, 1,
-0.7637968, -0.881371, -2.502842, 0.572549, 1, 0, 1,
-0.7628917, -1.996937, -3.287458, 0.5647059, 1, 0, 1,
-0.7536976, -0.8407447, -1.648288, 0.5607843, 1, 0, 1,
-0.7534977, 1.293563, 0.791977, 0.5529412, 1, 0, 1,
-0.7507805, -0.2236785, -1.724567, 0.5490196, 1, 0, 1,
-0.745604, 1.284648, -0.6006421, 0.5411765, 1, 0, 1,
-0.7445418, 0.5956621, -2.312944, 0.5372549, 1, 0, 1,
-0.7393309, -0.06043284, -2.174212, 0.5294118, 1, 0, 1,
-0.7342441, -0.401472, -3.50745, 0.5254902, 1, 0, 1,
-0.7322421, -0.9548954, -1.287838, 0.5176471, 1, 0, 1,
-0.7317749, 0.1012826, -2.301357, 0.5137255, 1, 0, 1,
-0.7289842, -1.557562, -1.928907, 0.5058824, 1, 0, 1,
-0.7285788, -0.913263, -1.8445, 0.5019608, 1, 0, 1,
-0.7255459, -1.111617, -2.079805, 0.4941176, 1, 0, 1,
-0.7233795, 2.273591, -0.8014001, 0.4862745, 1, 0, 1,
-0.7221324, 0.09759696, -1.883705, 0.4823529, 1, 0, 1,
-0.7211751, -0.8826258, -4.04529, 0.4745098, 1, 0, 1,
-0.7204791, -1.103195, -2.63969, 0.4705882, 1, 0, 1,
-0.712191, 1.144949, -1.787872, 0.4627451, 1, 0, 1,
-0.7028998, -3.761789, -2.62691, 0.4588235, 1, 0, 1,
-0.7002285, 0.08268125, -1.835991, 0.4509804, 1, 0, 1,
-0.6960832, 0.308324, -0.5238244, 0.4470588, 1, 0, 1,
-0.6946465, -0.04663089, -0.6590105, 0.4392157, 1, 0, 1,
-0.6938393, 0.06311624, 0.3924245, 0.4352941, 1, 0, 1,
-0.6850631, 2.455793, -0.6527665, 0.427451, 1, 0, 1,
-0.6826257, 1.165193, -0.3925165, 0.4235294, 1, 0, 1,
-0.6799131, 0.2921652, 1.610984, 0.4156863, 1, 0, 1,
-0.6785405, 0.6567917, 0.4542187, 0.4117647, 1, 0, 1,
-0.6783605, -1.468967, -3.392194, 0.4039216, 1, 0, 1,
-0.6781415, 1.164078, -0.4141797, 0.3960784, 1, 0, 1,
-0.6711338, 0.306607, -1.531801, 0.3921569, 1, 0, 1,
-0.6699969, 0.563348, -0.8862559, 0.3843137, 1, 0, 1,
-0.6602527, 0.3970245, -1.830304, 0.3803922, 1, 0, 1,
-0.659026, -0.3998289, -1.425468, 0.372549, 1, 0, 1,
-0.6513318, -0.289823, -1.738725, 0.3686275, 1, 0, 1,
-0.6398195, 2.678641, -0.4561121, 0.3607843, 1, 0, 1,
-0.6366223, 0.596346, -1.20408, 0.3568628, 1, 0, 1,
-0.635552, 1.16366, -0.7635754, 0.3490196, 1, 0, 1,
-0.6354825, -0.96307, -1.942445, 0.345098, 1, 0, 1,
-0.6290571, -0.7859169, -2.024279, 0.3372549, 1, 0, 1,
-0.6289912, -0.2053592, -2.717613, 0.3333333, 1, 0, 1,
-0.6202501, 2.088041, -0.3575934, 0.3254902, 1, 0, 1,
-0.6176897, -2.360777, -1.200991, 0.3215686, 1, 0, 1,
-0.6160082, 1.061458, 0.2538956, 0.3137255, 1, 0, 1,
-0.6143684, 0.5220599, -1.204537, 0.3098039, 1, 0, 1,
-0.6103398, 1.687151, -0.7278216, 0.3019608, 1, 0, 1,
-0.6097997, -0.4792911, -3.396646, 0.2941177, 1, 0, 1,
-0.6058976, 0.2869228, -2.25924, 0.2901961, 1, 0, 1,
-0.5981604, 0.3106901, -2.324449, 0.282353, 1, 0, 1,
-0.5947798, -0.1434546, -1.079228, 0.2784314, 1, 0, 1,
-0.5918677, 0.1466321, -0.3227918, 0.2705882, 1, 0, 1,
-0.5904685, -0.3229631, -2.720007, 0.2666667, 1, 0, 1,
-0.5898806, -0.3146965, -3.619013, 0.2588235, 1, 0, 1,
-0.5822319, -0.893765, -2.689462, 0.254902, 1, 0, 1,
-0.5818193, -1.415287, -2.872513, 0.2470588, 1, 0, 1,
-0.580494, -0.7466878, -3.445197, 0.2431373, 1, 0, 1,
-0.5763969, 0.1406143, -0.4430976, 0.2352941, 1, 0, 1,
-0.5762942, -1.220201, -1.873754, 0.2313726, 1, 0, 1,
-0.5748404, -0.2566641, -2.618822, 0.2235294, 1, 0, 1,
-0.5711734, 0.5887508, -1.505333, 0.2196078, 1, 0, 1,
-0.5568529, -0.04075727, -0.1503997, 0.2117647, 1, 0, 1,
-0.5532045, -2.288231, -4.294616, 0.2078431, 1, 0, 1,
-0.5501189, 0.6202263, 0.8250366, 0.2, 1, 0, 1,
-0.5490574, -0.04412261, -1.030228, 0.1921569, 1, 0, 1,
-0.5480969, -0.3946956, -0.8817897, 0.1882353, 1, 0, 1,
-0.5477461, 0.588834, 0.02139232, 0.1803922, 1, 0, 1,
-0.5475171, -1.044785, -2.043605, 0.1764706, 1, 0, 1,
-0.546816, 1.916035, -0.04524885, 0.1686275, 1, 0, 1,
-0.5442964, -1.122683, -4.480889, 0.1647059, 1, 0, 1,
-0.5436931, 0.9482787, 0.281336, 0.1568628, 1, 0, 1,
-0.5418288, 1.469214, 1.264165, 0.1529412, 1, 0, 1,
-0.5389744, 1.137643, 0.8041752, 0.145098, 1, 0, 1,
-0.5311695, -1.347012, -3.047764, 0.1411765, 1, 0, 1,
-0.5269083, -0.9255576, -2.114686, 0.1333333, 1, 0, 1,
-0.5256529, -0.8010927, -1.325815, 0.1294118, 1, 0, 1,
-0.5254765, -0.5479591, -0.5037588, 0.1215686, 1, 0, 1,
-0.519676, 0.3874189, -0.718636, 0.1176471, 1, 0, 1,
-0.5195186, -0.2614101, -3.637628, 0.1098039, 1, 0, 1,
-0.5184709, 0.5735636, 0.3737943, 0.1058824, 1, 0, 1,
-0.5184467, 1.347371, -1.70685, 0.09803922, 1, 0, 1,
-0.5143852, 1.624602, 0.04283762, 0.09019608, 1, 0, 1,
-0.5135041, 0.9544203, -2.246187, 0.08627451, 1, 0, 1,
-0.5110423, 0.2539357, -1.169247, 0.07843138, 1, 0, 1,
-0.5110281, -0.7323697, -3.628746, 0.07450981, 1, 0, 1,
-0.5106908, 0.7244307, 0.3718408, 0.06666667, 1, 0, 1,
-0.5103394, 0.6950702, 0.03395736, 0.0627451, 1, 0, 1,
-0.5015664, 0.2964878, -1.935943, 0.05490196, 1, 0, 1,
-0.4997332, 1.350951, -0.1309197, 0.05098039, 1, 0, 1,
-0.4983577, -0.394647, -1.589325, 0.04313726, 1, 0, 1,
-0.4961722, -0.04433435, -0.549275, 0.03921569, 1, 0, 1,
-0.4960752, 0.5555627, -0.8877498, 0.03137255, 1, 0, 1,
-0.4931007, -1.470977, -2.544667, 0.02745098, 1, 0, 1,
-0.4922244, -0.2379063, -3.519189, 0.01960784, 1, 0, 1,
-0.4897485, 1.001882, 0.224699, 0.01568628, 1, 0, 1,
-0.4864744, 0.2560254, 0.02524926, 0.007843138, 1, 0, 1,
-0.4852845, -1.394013, -3.34958, 0.003921569, 1, 0, 1,
-0.4830511, -0.78431, -3.015681, 0, 1, 0.003921569, 1,
-0.4821013, 0.5596575, -1.194945, 0, 1, 0.01176471, 1,
-0.4776358, -1.329631, -2.958977, 0, 1, 0.01568628, 1,
-0.4737743, -0.02882469, -1.617714, 0, 1, 0.02352941, 1,
-0.4733733, 0.6749282, -1.351924, 0, 1, 0.02745098, 1,
-0.4722009, 0.9999683, 0.4507162, 0, 1, 0.03529412, 1,
-0.4718059, -0.4805257, -2.323737, 0, 1, 0.03921569, 1,
-0.4585108, -0.2278424, -1.909894, 0, 1, 0.04705882, 1,
-0.4583693, -0.6605713, -3.168904, 0, 1, 0.05098039, 1,
-0.4538035, 0.8556284, 0.4451889, 0, 1, 0.05882353, 1,
-0.4423575, -0.621265, -2.470175, 0, 1, 0.0627451, 1,
-0.4380438, -0.766109, -1.87478, 0, 1, 0.07058824, 1,
-0.4370458, 0.3883546, 0.5857748, 0, 1, 0.07450981, 1,
-0.4314732, 0.8678473, -0.6922886, 0, 1, 0.08235294, 1,
-0.4242047, 1.598699, 0.7859389, 0, 1, 0.08627451, 1,
-0.4237708, 0.05140752, -0.8785784, 0, 1, 0.09411765, 1,
-0.4237419, 1.635083, -0.3690845, 0, 1, 0.1019608, 1,
-0.4153284, -0.05979876, 0.2544342, 0, 1, 0.1058824, 1,
-0.4142388, -2.055969, -2.09578, 0, 1, 0.1137255, 1,
-0.4082224, -1.543884, -3.739676, 0, 1, 0.1176471, 1,
-0.399476, 0.7339945, -1.008447, 0, 1, 0.1254902, 1,
-0.3974326, 0.6130332, -0.5988426, 0, 1, 0.1294118, 1,
-0.3973919, 0.03192076, -0.6391126, 0, 1, 0.1372549, 1,
-0.3951865, -0.3857267, -3.255774, 0, 1, 0.1411765, 1,
-0.3934864, -0.3362707, -3.633717, 0, 1, 0.1490196, 1,
-0.3896703, -1.065198, -2.92845, 0, 1, 0.1529412, 1,
-0.3834049, 2.84086, 0.5634478, 0, 1, 0.1607843, 1,
-0.379446, 2.215669, -0.4537569, 0, 1, 0.1647059, 1,
-0.3783879, -0.3827758, -2.309903, 0, 1, 0.172549, 1,
-0.3781252, -0.3918036, -2.808432, 0, 1, 0.1764706, 1,
-0.3747109, -0.2255373, -0.8187895, 0, 1, 0.1843137, 1,
-0.373302, 1.416894, -0.2976398, 0, 1, 0.1882353, 1,
-0.3714778, 0.05909541, -0.1267578, 0, 1, 0.1960784, 1,
-0.3654424, -1.698212, -2.478254, 0, 1, 0.2039216, 1,
-0.3596003, 0.02768378, -0.8755522, 0, 1, 0.2078431, 1,
-0.3536648, -0.5715747, -3.008762, 0, 1, 0.2156863, 1,
-0.3523368, 0.4344701, -1.162496, 0, 1, 0.2196078, 1,
-0.3520467, -0.4586142, -2.693011, 0, 1, 0.227451, 1,
-0.3511849, -0.7577651, -4.878922, 0, 1, 0.2313726, 1,
-0.3480665, 0.4205718, -0.9176158, 0, 1, 0.2392157, 1,
-0.3476983, 0.5817232, 0.5226933, 0, 1, 0.2431373, 1,
-0.3425736, -0.4737389, -3.537566, 0, 1, 0.2509804, 1,
-0.3274647, 1.452016, -0.4586098, 0, 1, 0.254902, 1,
-0.3265463, 0.1945791, -1.898823, 0, 1, 0.2627451, 1,
-0.3258809, 1.180118, -1.435469, 0, 1, 0.2666667, 1,
-0.3239073, 0.02907136, -1.366035, 0, 1, 0.2745098, 1,
-0.3219036, 2.27632, -0.2428799, 0, 1, 0.2784314, 1,
-0.3180722, -0.5008259, -1.224663, 0, 1, 0.2862745, 1,
-0.3179079, 1.576287, 0.06448354, 0, 1, 0.2901961, 1,
-0.3157403, 0.07220467, -1.938022, 0, 1, 0.2980392, 1,
-0.3080181, -0.2194309, -2.567395, 0, 1, 0.3058824, 1,
-0.3030754, -1.455116, -4.020386, 0, 1, 0.3098039, 1,
-0.2968546, -0.07543097, -0.176754, 0, 1, 0.3176471, 1,
-0.2912229, 0.6333169, -0.6503353, 0, 1, 0.3215686, 1,
-0.2911719, -0.4839545, -3.205472, 0, 1, 0.3294118, 1,
-0.2871273, -0.2548646, -1.221251, 0, 1, 0.3333333, 1,
-0.2866514, -0.693941, -3.21397, 0, 1, 0.3411765, 1,
-0.2863582, 0.3010459, 0.002276439, 0, 1, 0.345098, 1,
-0.276892, -0.6807126, -2.43293, 0, 1, 0.3529412, 1,
-0.2713659, -0.3573813, -3.727152, 0, 1, 0.3568628, 1,
-0.2635715, 1.246577, -1.049947, 0, 1, 0.3647059, 1,
-0.2538673, 0.6560171, 0.528257, 0, 1, 0.3686275, 1,
-0.2495847, -0.2928329, -2.631764, 0, 1, 0.3764706, 1,
-0.245702, -0.7073879, -3.507859, 0, 1, 0.3803922, 1,
-0.243476, -1.242981, -2.992376, 0, 1, 0.3882353, 1,
-0.2417327, -1.116835, -3.030409, 0, 1, 0.3921569, 1,
-0.2391074, -0.3197379, -1.238078, 0, 1, 0.4, 1,
-0.236623, 0.5471911, -0.8806594, 0, 1, 0.4078431, 1,
-0.2353674, 0.6679615, 0.3523679, 0, 1, 0.4117647, 1,
-0.23433, 0.2401207, -0.544567, 0, 1, 0.4196078, 1,
-0.233939, 0.6846249, 0.3220077, 0, 1, 0.4235294, 1,
-0.2316717, 0.02211806, -1.166809, 0, 1, 0.4313726, 1,
-0.230981, -0.494213, -1.661312, 0, 1, 0.4352941, 1,
-0.2296494, -0.8019125, -1.362582, 0, 1, 0.4431373, 1,
-0.2191805, 0.8300288, 1.854639, 0, 1, 0.4470588, 1,
-0.2159517, -0.69516, -2.496617, 0, 1, 0.454902, 1,
-0.2155761, 1.208861, -1.229126, 0, 1, 0.4588235, 1,
-0.2092181, 0.4799867, 0.2197751, 0, 1, 0.4666667, 1,
-0.2080392, 0.3053274, 0.9534017, 0, 1, 0.4705882, 1,
-0.2077091, 0.5246771, 0.6217581, 0, 1, 0.4784314, 1,
-0.2004998, 0.1662118, -2.866308, 0, 1, 0.4823529, 1,
-0.1978707, -1.212999, -1.217942, 0, 1, 0.4901961, 1,
-0.1912359, 0.3033384, 0.6043969, 0, 1, 0.4941176, 1,
-0.1886461, 0.9804515, -1.29424, 0, 1, 0.5019608, 1,
-0.1861615, 0.5677451, 0.7415427, 0, 1, 0.509804, 1,
-0.1822018, -0.2710112, -1.532789, 0, 1, 0.5137255, 1,
-0.1792599, -1.041576, -2.88116, 0, 1, 0.5215687, 1,
-0.1772627, 0.3982401, -1.724504, 0, 1, 0.5254902, 1,
-0.173849, 0.9775761, 1.004225, 0, 1, 0.5333334, 1,
-0.171223, 0.1726022, 0.2191228, 0, 1, 0.5372549, 1,
-0.171079, -0.2014598, -3.172959, 0, 1, 0.5450981, 1,
-0.1678895, -0.5661896, -2.195103, 0, 1, 0.5490196, 1,
-0.1638154, -0.5108026, -1.775161, 0, 1, 0.5568628, 1,
-0.1581907, 0.7074912, 0.5233516, 0, 1, 0.5607843, 1,
-0.1523768, -0.1833981, -3.760675, 0, 1, 0.5686275, 1,
-0.1514025, -1.156212, -3.778798, 0, 1, 0.572549, 1,
-0.1492047, -0.1193723, 0.1236138, 0, 1, 0.5803922, 1,
-0.1490992, 1.327083, 0.9081957, 0, 1, 0.5843138, 1,
-0.1465559, 1.519732, 0.2581694, 0, 1, 0.5921569, 1,
-0.1417434, 1.508655, -2.091983, 0, 1, 0.5960785, 1,
-0.1401751, 0.9047723, -0.891517, 0, 1, 0.6039216, 1,
-0.1369515, -1.611691, -2.530904, 0, 1, 0.6117647, 1,
-0.1342202, -1.345802, -2.836286, 0, 1, 0.6156863, 1,
-0.1329008, 1.730209, 0.8750009, 0, 1, 0.6235294, 1,
-0.1323445, 0.4105498, -2.007743, 0, 1, 0.627451, 1,
-0.130155, 0.9882492, -1.140737, 0, 1, 0.6352941, 1,
-0.1273514, -0.234564, -2.771337, 0, 1, 0.6392157, 1,
-0.1257055, -0.7318661, -2.310109, 0, 1, 0.6470588, 1,
-0.1246522, 0.8629278, -0.4218866, 0, 1, 0.6509804, 1,
-0.1230345, 1.007612, -2.128094, 0, 1, 0.6588235, 1,
-0.1177329, -1.751411, -2.150919, 0, 1, 0.6627451, 1,
-0.116807, 1.790099, -1.198003, 0, 1, 0.6705883, 1,
-0.1153808, 2.037714, 0.7777004, 0, 1, 0.6745098, 1,
-0.1147869, -1.502081, -5.25223, 0, 1, 0.682353, 1,
-0.1131982, 0.4505575, 1.400699, 0, 1, 0.6862745, 1,
-0.1050804, 0.6453812, 0.7232733, 0, 1, 0.6941177, 1,
-0.1044008, -0.6895775, -1.899925, 0, 1, 0.7019608, 1,
-0.098974, 0.6179174, 1.266561, 0, 1, 0.7058824, 1,
-0.09686175, -0.7014503, -3.04939, 0, 1, 0.7137255, 1,
-0.09472014, -0.358375, -3.442854, 0, 1, 0.7176471, 1,
-0.09333798, 0.8860542, -0.269915, 0, 1, 0.7254902, 1,
-0.09216825, -0.3341441, -1.905787, 0, 1, 0.7294118, 1,
-0.09175401, 0.6836609, -0.3472624, 0, 1, 0.7372549, 1,
-0.09088523, 1.25469, -0.3882982, 0, 1, 0.7411765, 1,
-0.08354445, 0.09418967, -0.6942874, 0, 1, 0.7490196, 1,
-0.07934617, 2.330664, -0.627654, 0, 1, 0.7529412, 1,
-0.06865843, -1.849387, -3.990144, 0, 1, 0.7607843, 1,
-0.0677688, 0.02566476, -1.719266, 0, 1, 0.7647059, 1,
-0.06734426, 1.11072, -0.7138935, 0, 1, 0.772549, 1,
-0.05793607, -2.621909, -4.895972, 0, 1, 0.7764706, 1,
-0.05252725, -0.1981953, -4.076867, 0, 1, 0.7843137, 1,
-0.05240308, 0.6941273, -1.523492, 0, 1, 0.7882353, 1,
-0.05218446, 1.434706, -2.331976, 0, 1, 0.7960784, 1,
-0.05048503, -0.8865995, -4.559306, 0, 1, 0.8039216, 1,
-0.04934385, -0.53615, -2.256054, 0, 1, 0.8078431, 1,
-0.04903795, 0.5378966, 0.3493853, 0, 1, 0.8156863, 1,
-0.04757342, -0.9750094, -2.884825, 0, 1, 0.8196079, 1,
-0.04244875, -0.7882278, -4.063288, 0, 1, 0.827451, 1,
-0.04236756, -1.809737, -5.18475, 0, 1, 0.8313726, 1,
-0.04077775, -1.657153, -1.204148, 0, 1, 0.8392157, 1,
-0.04000313, 1.612, -1.1172, 0, 1, 0.8431373, 1,
-0.03950673, -0.515211, -4.613984, 0, 1, 0.8509804, 1,
-0.03614763, 1.858444, 1.024522, 0, 1, 0.854902, 1,
-0.03307242, -0.6137521, -3.204062, 0, 1, 0.8627451, 1,
-0.02543341, -1.21667, -3.489036, 0, 1, 0.8666667, 1,
-0.02249251, -0.4938809, -3.688507, 0, 1, 0.8745098, 1,
-0.02164809, -0.1445437, -3.19011, 0, 1, 0.8784314, 1,
-0.02026085, 0.8103476, 0.4187737, 0, 1, 0.8862745, 1,
-0.02005926, -0.3017618, -3.209272, 0, 1, 0.8901961, 1,
-0.0198352, -0.8925032, -3.429812, 0, 1, 0.8980392, 1,
-0.01429242, -0.809503, -3.543746, 0, 1, 0.9058824, 1,
-0.01138169, -0.8974974, -3.749308, 0, 1, 0.9098039, 1,
-0.007010987, 0.9611241, 1.990677, 0, 1, 0.9176471, 1,
-0.005771928, 0.3618949, 1.172149, 0, 1, 0.9215686, 1,
-0.001459021, 0.9599403, -0.02719544, 0, 1, 0.9294118, 1,
0.003457301, -0.8511148, 1.714387, 0, 1, 0.9333333, 1,
0.004359435, 0.7708829, -0.1884805, 0, 1, 0.9411765, 1,
0.005759028, 0.05391521, -0.5476227, 0, 1, 0.945098, 1,
0.008392059, 0.08016276, 1.156828, 0, 1, 0.9529412, 1,
0.011129, 0.4165415, 0.1901541, 0, 1, 0.9568627, 1,
0.01165483, 0.3664698, -1.090286, 0, 1, 0.9647059, 1,
0.01784077, 0.8326645, -1.672595, 0, 1, 0.9686275, 1,
0.0270454, -0.9689109, 3.749514, 0, 1, 0.9764706, 1,
0.02870589, 1.304624, 0.3442261, 0, 1, 0.9803922, 1,
0.02957209, 0.7738933, 0.5965428, 0, 1, 0.9882353, 1,
0.03083471, 0.1907106, -0.1372284, 0, 1, 0.9921569, 1,
0.03538544, -0.2513352, 2.731708, 0, 1, 1, 1,
0.03700647, 0.6095172, -1.123358, 0, 0.9921569, 1, 1,
0.03968678, -0.8322774, 2.495528, 0, 0.9882353, 1, 1,
0.04064003, 2.410089, -0.1413939, 0, 0.9803922, 1, 1,
0.04348611, -0.7779604, 2.601572, 0, 0.9764706, 1, 1,
0.04540866, 1.244103, 0.9433382, 0, 0.9686275, 1, 1,
0.04604648, -1.351466, 3.289947, 0, 0.9647059, 1, 1,
0.04621959, -0.4533904, 2.611754, 0, 0.9568627, 1, 1,
0.04821272, -0.1940404, 2.469684, 0, 0.9529412, 1, 1,
0.04848978, 0.7108226, 0.5846503, 0, 0.945098, 1, 1,
0.04900329, 0.3514448, -0.9758297, 0, 0.9411765, 1, 1,
0.05265715, 0.9031341, 0.8452866, 0, 0.9333333, 1, 1,
0.05346711, 0.564131, -0.3152017, 0, 0.9294118, 1, 1,
0.05364486, 0.6884608, 0.509728, 0, 0.9215686, 1, 1,
0.05385755, 0.4509112, 0.6567558, 0, 0.9176471, 1, 1,
0.05903988, 0.07585585, 1.971131, 0, 0.9098039, 1, 1,
0.05970735, -1.057626, 4.139789, 0, 0.9058824, 1, 1,
0.06173439, 1.004996, -0.8377647, 0, 0.8980392, 1, 1,
0.06174723, 0.4293978, -1.015456, 0, 0.8901961, 1, 1,
0.06229463, -0.7166736, 2.819406, 0, 0.8862745, 1, 1,
0.0678865, 0.7911563, 1.677501, 0, 0.8784314, 1, 1,
0.06814027, 0.9349079, 0.6140879, 0, 0.8745098, 1, 1,
0.07318449, -0.5080643, 3.72605, 0, 0.8666667, 1, 1,
0.08049241, -0.7755939, 2.667555, 0, 0.8627451, 1, 1,
0.08113308, -0.07916836, 2.471718, 0, 0.854902, 1, 1,
0.0822532, -0.6504329, 3.490448, 0, 0.8509804, 1, 1,
0.08336789, -0.0126868, 0.8784214, 0, 0.8431373, 1, 1,
0.08356962, 1.039084, 0.3801808, 0, 0.8392157, 1, 1,
0.0842187, 2.910807, -0.2942426, 0, 0.8313726, 1, 1,
0.08493418, -1.391615, 2.568595, 0, 0.827451, 1, 1,
0.08552872, 1.050616, -1.215936, 0, 0.8196079, 1, 1,
0.08840508, -1.018716, 4.186461, 0, 0.8156863, 1, 1,
0.08952888, -1.568514, 2.858805, 0, 0.8078431, 1, 1,
0.09435451, -0.2438433, 1.753518, 0, 0.8039216, 1, 1,
0.09680984, -0.8478026, 4.811926, 0, 0.7960784, 1, 1,
0.09861863, -0.4178504, 2.624161, 0, 0.7882353, 1, 1,
0.09923059, 0.4635003, -0.02664928, 0, 0.7843137, 1, 1,
0.1057586, 0.03149366, 0.6856512, 0, 0.7764706, 1, 1,
0.1074516, -0.2751839, 2.819406, 0, 0.772549, 1, 1,
0.1098366, -0.8577021, 3.319115, 0, 0.7647059, 1, 1,
0.112077, -1.638923, 3.310156, 0, 0.7607843, 1, 1,
0.1157835, -1.121898, 2.984128, 0, 0.7529412, 1, 1,
0.118921, -0.897381, 3.373057, 0, 0.7490196, 1, 1,
0.1201403, 0.5593093, 1.513836, 0, 0.7411765, 1, 1,
0.127546, 0.8588775, 0.1699702, 0, 0.7372549, 1, 1,
0.1296038, -0.357236, 2.477782, 0, 0.7294118, 1, 1,
0.1303058, 1.094569, 1.255893, 0, 0.7254902, 1, 1,
0.1359386, -1.023626, 3.470069, 0, 0.7176471, 1, 1,
0.1362511, -0.04715496, 0.9243506, 0, 0.7137255, 1, 1,
0.1400109, -1.375531, 1.711777, 0, 0.7058824, 1, 1,
0.1401509, 1.4805, 1.186749, 0, 0.6980392, 1, 1,
0.1415491, 0.01858761, -0.05125987, 0, 0.6941177, 1, 1,
0.1454578, 1.166586, 0.3081914, 0, 0.6862745, 1, 1,
0.1532448, 0.123335, -0.7573011, 0, 0.682353, 1, 1,
0.155286, -0.6898024, 3.489853, 0, 0.6745098, 1, 1,
0.1566381, 1.309398, -1.240666, 0, 0.6705883, 1, 1,
0.1575061, -0.8085849, 3.658878, 0, 0.6627451, 1, 1,
0.159276, -1.160814, 1.286055, 0, 0.6588235, 1, 1,
0.1593773, 1.101195, -0.6205072, 0, 0.6509804, 1, 1,
0.1653958, 0.3315238, 0.03814446, 0, 0.6470588, 1, 1,
0.1689194, -1.38918, 2.639625, 0, 0.6392157, 1, 1,
0.1716962, 0.07933593, 1.918715, 0, 0.6352941, 1, 1,
0.1749769, -0.1601, 1.609032, 0, 0.627451, 1, 1,
0.1756496, 0.05940013, 0.7931321, 0, 0.6235294, 1, 1,
0.1764096, -0.6990018, 2.360295, 0, 0.6156863, 1, 1,
0.1918473, -0.3309933, 1.324695, 0, 0.6117647, 1, 1,
0.1925822, 0.3063836, 0.3618019, 0, 0.6039216, 1, 1,
0.1938819, 0.9580182, -0.2189319, 0, 0.5960785, 1, 1,
0.2021235, -0.3412084, 2.925412, 0, 0.5921569, 1, 1,
0.2037403, -2.225829, 3.97663, 0, 0.5843138, 1, 1,
0.2065737, 1.488587, 0.2513506, 0, 0.5803922, 1, 1,
0.2078185, 1.433914, -0.3475922, 0, 0.572549, 1, 1,
0.2089913, 0.431958, 1.241389, 0, 0.5686275, 1, 1,
0.2139727, -0.6349095, 2.345635, 0, 0.5607843, 1, 1,
0.2154139, 0.6526759, 0.5111589, 0, 0.5568628, 1, 1,
0.2276231, 1.656442, -0.9346228, 0, 0.5490196, 1, 1,
0.2279473, -0.3057292, 2.181164, 0, 0.5450981, 1, 1,
0.2316834, 1.175674, 1.508632, 0, 0.5372549, 1, 1,
0.2318103, -0.9887245, 3.388748, 0, 0.5333334, 1, 1,
0.2323043, 0.1279773, 1.023923, 0, 0.5254902, 1, 1,
0.232643, -0.8686272, 4.277127, 0, 0.5215687, 1, 1,
0.2332053, 0.8349406, 0.8669187, 0, 0.5137255, 1, 1,
0.234761, -0.9469025, 0.6640329, 0, 0.509804, 1, 1,
0.2349043, 0.1177527, 0.9536109, 0, 0.5019608, 1, 1,
0.2386324, -0.9444555, 1.049067, 0, 0.4941176, 1, 1,
0.2389182, 0.08469694, 1.43066, 0, 0.4901961, 1, 1,
0.2428001, -1.459197, 0.448354, 0, 0.4823529, 1, 1,
0.2440207, -0.9033028, 0.9619116, 0, 0.4784314, 1, 1,
0.245456, -1.140888, 3.778139, 0, 0.4705882, 1, 1,
0.2515927, 0.3846909, 0.06776178, 0, 0.4666667, 1, 1,
0.2522675, 0.2159314, -0.8381275, 0, 0.4588235, 1, 1,
0.2592932, 1.00628, -0.9614947, 0, 0.454902, 1, 1,
0.2594697, -0.7134043, 3.298991, 0, 0.4470588, 1, 1,
0.2617648, 0.8558356, 0.231451, 0, 0.4431373, 1, 1,
0.2763934, -0.2301083, 0.1117971, 0, 0.4352941, 1, 1,
0.2799302, -1.334242, 3.080302, 0, 0.4313726, 1, 1,
0.281316, 0.6871612, 1.048709, 0, 0.4235294, 1, 1,
0.2899941, -0.9818389, 2.650203, 0, 0.4196078, 1, 1,
0.2929128, -0.9700345, 3.5029, 0, 0.4117647, 1, 1,
0.2952799, -0.5651404, 2.017646, 0, 0.4078431, 1, 1,
0.2969198, -0.3614756, 4.845787, 0, 0.4, 1, 1,
0.2977959, -0.7120228, 2.169286, 0, 0.3921569, 1, 1,
0.299918, 0.013623, 2.50366, 0, 0.3882353, 1, 1,
0.3030445, -0.6141078, 3.080747, 0, 0.3803922, 1, 1,
0.3073501, -0.6845087, 1.84425, 0, 0.3764706, 1, 1,
0.3145669, 0.2051791, 0.8323988, 0, 0.3686275, 1, 1,
0.3175348, -1.06476, 2.94571, 0, 0.3647059, 1, 1,
0.3212439, -0.2260626, 2.694081, 0, 0.3568628, 1, 1,
0.3221661, -2.105224, 2.727096, 0, 0.3529412, 1, 1,
0.3232191, 0.4497275, 0.2730292, 0, 0.345098, 1, 1,
0.3233593, -1.468126, 5.641954, 0, 0.3411765, 1, 1,
0.325619, -0.07514782, 1.860553, 0, 0.3333333, 1, 1,
0.3280132, 0.606259, 0.3323657, 0, 0.3294118, 1, 1,
0.3295361, 1.048696, -0.8863217, 0, 0.3215686, 1, 1,
0.331064, 0.1178386, 0.9884201, 0, 0.3176471, 1, 1,
0.3319424, 0.09327894, 2.353898, 0, 0.3098039, 1, 1,
0.3338248, 0.5872912, -0.1734677, 0, 0.3058824, 1, 1,
0.334193, 1.422151, 0.4497941, 0, 0.2980392, 1, 1,
0.3349521, -0.9466527, 2.517907, 0, 0.2901961, 1, 1,
0.3355803, -1.951523, 3.455566, 0, 0.2862745, 1, 1,
0.3375875, 0.7609234, -1.02532, 0, 0.2784314, 1, 1,
0.341066, -0.2719893, 2.916406, 0, 0.2745098, 1, 1,
0.3436826, 1.61853, -0.1749146, 0, 0.2666667, 1, 1,
0.3445604, 0.9589726, 0.2741222, 0, 0.2627451, 1, 1,
0.3494929, -1.256951, 2.793817, 0, 0.254902, 1, 1,
0.3508481, 0.219298, 1.763255, 0, 0.2509804, 1, 1,
0.3531836, 0.04450789, 0.2627121, 0, 0.2431373, 1, 1,
0.3544478, -0.5168094, 1.640472, 0, 0.2392157, 1, 1,
0.3545437, -0.3901237, 2.472539, 0, 0.2313726, 1, 1,
0.3569639, -0.1581297, 2.638046, 0, 0.227451, 1, 1,
0.3572493, -0.114303, 1.075223, 0, 0.2196078, 1, 1,
0.35942, -0.7810031, 2.32606, 0, 0.2156863, 1, 1,
0.3607613, -1.866865, 1.549163, 0, 0.2078431, 1, 1,
0.3609629, -1.442904, 3.093308, 0, 0.2039216, 1, 1,
0.3625236, 1.744555, -0.6139529, 0, 0.1960784, 1, 1,
0.365063, -1.271096, 2.49449, 0, 0.1882353, 1, 1,
0.3696777, -0.4412263, 3.2929, 0, 0.1843137, 1, 1,
0.3729744, -0.2873958, 1.884, 0, 0.1764706, 1, 1,
0.3742359, -1.252351, 2.094102, 0, 0.172549, 1, 1,
0.380443, 0.07421876, 1.76971, 0, 0.1647059, 1, 1,
0.382992, -0.4527052, 2.665875, 0, 0.1607843, 1, 1,
0.3850613, 0.4808735, -0.5706357, 0, 0.1529412, 1, 1,
0.3854184, 0.4726532, -0.5826692, 0, 0.1490196, 1, 1,
0.3872097, -0.6065968, 2.96799, 0, 0.1411765, 1, 1,
0.3897361, -1.094522, 3.849484, 0, 0.1372549, 1, 1,
0.3922081, 0.01546886, 1.943508, 0, 0.1294118, 1, 1,
0.392942, 1.494856, -0.7458506, 0, 0.1254902, 1, 1,
0.3946539, 0.7126877, 2.000517, 0, 0.1176471, 1, 1,
0.4041193, -0.189322, 3.600054, 0, 0.1137255, 1, 1,
0.4041477, -0.9052158, 1.395248, 0, 0.1058824, 1, 1,
0.4069677, 0.2006932, 0.2104881, 0, 0.09803922, 1, 1,
0.4122267, 0.5690702, 0.7642428, 0, 0.09411765, 1, 1,
0.4143165, 0.4580561, 1.192478, 0, 0.08627451, 1, 1,
0.4143218, 0.6536791, 2.530136, 0, 0.08235294, 1, 1,
0.4162249, -0.3374772, 1.621003, 0, 0.07450981, 1, 1,
0.4221077, -1.347709, 4.880215, 0, 0.07058824, 1, 1,
0.4244758, 1.294435, 0.06510604, 0, 0.0627451, 1, 1,
0.4251164, 0.6678599, 2.188914, 0, 0.05882353, 1, 1,
0.4266002, 0.1430664, 1.004538, 0, 0.05098039, 1, 1,
0.42669, -1.39844, 3.163306, 0, 0.04705882, 1, 1,
0.4318141, 0.1952651, -0.5567778, 0, 0.03921569, 1, 1,
0.4320644, -0.9369314, 2.674526, 0, 0.03529412, 1, 1,
0.43232, -0.8186038, 3.098959, 0, 0.02745098, 1, 1,
0.4339231, 0.5865492, 0.6005324, 0, 0.02352941, 1, 1,
0.4382399, 0.3498205, 1.434887, 0, 0.01568628, 1, 1,
0.440501, -1.483873, 2.681753, 0, 0.01176471, 1, 1,
0.4410098, -0.2665653, 1.160144, 0, 0.003921569, 1, 1,
0.4445664, 0.9635466, 1.974593, 0.003921569, 0, 1, 1,
0.4478306, -1.310923, 2.08331, 0.007843138, 0, 1, 1,
0.4509181, 1.518626, -1.172899, 0.01568628, 0, 1, 1,
0.4520709, -1.528678, 2.782039, 0.01960784, 0, 1, 1,
0.4530795, 0.1644012, 0.8217113, 0.02745098, 0, 1, 1,
0.4572505, -1.694611, 1.47192, 0.03137255, 0, 1, 1,
0.4601336, -1.244637, 3.886433, 0.03921569, 0, 1, 1,
0.4630923, 0.09397592, 0.5156857, 0.04313726, 0, 1, 1,
0.4662388, -0.1623096, -0.2026, 0.05098039, 0, 1, 1,
0.4774362, -1.518812, 2.143474, 0.05490196, 0, 1, 1,
0.4799866, 2.295163, -0.6146146, 0.0627451, 0, 1, 1,
0.4803552, 0.5571737, 1.514932, 0.06666667, 0, 1, 1,
0.4820808, 1.743783, 0.9555032, 0.07450981, 0, 1, 1,
0.4935252, 0.01783649, 2.547295, 0.07843138, 0, 1, 1,
0.495173, -0.07199084, 2.052373, 0.08627451, 0, 1, 1,
0.5024125, 1.307775, -0.003957513, 0.09019608, 0, 1, 1,
0.5039248, -1.070631, 1.524014, 0.09803922, 0, 1, 1,
0.5075519, -0.505335, 2.187146, 0.1058824, 0, 1, 1,
0.5141078, 1.171003, -1.076321, 0.1098039, 0, 1, 1,
0.5169008, -0.05141933, 1.339197, 0.1176471, 0, 1, 1,
0.5184286, -2.102558, 2.875435, 0.1215686, 0, 1, 1,
0.5229773, 0.3229787, 1.187161, 0.1294118, 0, 1, 1,
0.5277274, 1.702883, -0.9083009, 0.1333333, 0, 1, 1,
0.5298494, -0.2569792, 2.463026, 0.1411765, 0, 1, 1,
0.5340369, -1.549599, 2.015536, 0.145098, 0, 1, 1,
0.5350746, 0.3232997, 1.902588, 0.1529412, 0, 1, 1,
0.5367509, -1.361824, 3.687279, 0.1568628, 0, 1, 1,
0.5399141, -1.489038, 3.343535, 0.1647059, 0, 1, 1,
0.5409089, -0.3883532, 3.729627, 0.1686275, 0, 1, 1,
0.5435546, 2.301694, 0.8110113, 0.1764706, 0, 1, 1,
0.5452833, -0.4886401, 2.716675, 0.1803922, 0, 1, 1,
0.5473557, 0.1175782, -0.2249423, 0.1882353, 0, 1, 1,
0.5505182, 0.9810206, -0.5858308, 0.1921569, 0, 1, 1,
0.5523229, 0.7573372, 1.595101, 0.2, 0, 1, 1,
0.5608931, 1.430868, 1.213839, 0.2078431, 0, 1, 1,
0.5626682, 0.7959489, 0.6118499, 0.2117647, 0, 1, 1,
0.5648139, 0.8000556, 1.35026, 0.2196078, 0, 1, 1,
0.5663282, -0.05219449, 0.7533785, 0.2235294, 0, 1, 1,
0.5703807, -0.5475631, 1.977545, 0.2313726, 0, 1, 1,
0.5705197, 0.1001136, 2.421499, 0.2352941, 0, 1, 1,
0.5707465, -2.253553, -0.05381769, 0.2431373, 0, 1, 1,
0.5739949, -1.183469, 2.164653, 0.2470588, 0, 1, 1,
0.5876694, -0.6804315, 3.546779, 0.254902, 0, 1, 1,
0.5913697, 0.8345384, 1.735331, 0.2588235, 0, 1, 1,
0.5942059, -1.896127, 2.14831, 0.2666667, 0, 1, 1,
0.6029599, -0.8185795, 2.4744, 0.2705882, 0, 1, 1,
0.6055489, -0.04863162, 1.876012, 0.2784314, 0, 1, 1,
0.6059948, 1.243703, 0.11748, 0.282353, 0, 1, 1,
0.6068426, -0.8494244, 1.469887, 0.2901961, 0, 1, 1,
0.6082322, 0.006294772, 4.315651, 0.2941177, 0, 1, 1,
0.6090103, 0.5095038, 0.01036821, 0.3019608, 0, 1, 1,
0.6093733, 0.1036354, 0.6265642, 0.3098039, 0, 1, 1,
0.6132508, -0.187673, 3.01755, 0.3137255, 0, 1, 1,
0.6188389, -0.1525923, 0.8275797, 0.3215686, 0, 1, 1,
0.6249216, 0.5715712, 1.452251, 0.3254902, 0, 1, 1,
0.6272547, -0.4282265, 2.778089, 0.3333333, 0, 1, 1,
0.6287544, 0.7038029, 1.124933, 0.3372549, 0, 1, 1,
0.6287643, 0.05740955, 3.86534, 0.345098, 0, 1, 1,
0.6301979, 0.7362058, -0.6762333, 0.3490196, 0, 1, 1,
0.6332988, 1.150566, 0.1022191, 0.3568628, 0, 1, 1,
0.6341811, 0.7241373, 2.222106, 0.3607843, 0, 1, 1,
0.6378808, -0.3737017, 0.292297, 0.3686275, 0, 1, 1,
0.6402541, 0.1938519, 1.601391, 0.372549, 0, 1, 1,
0.6410335, -0.7968007, 2.894602, 0.3803922, 0, 1, 1,
0.642734, 0.5588902, 0.5565611, 0.3843137, 0, 1, 1,
0.6429592, -0.6184593, 1.024397, 0.3921569, 0, 1, 1,
0.6443468, 0.9306895, -0.8416452, 0.3960784, 0, 1, 1,
0.6495367, 0.5009515, 0.6453416, 0.4039216, 0, 1, 1,
0.6521673, 0.3520634, 2.259356, 0.4117647, 0, 1, 1,
0.653618, 1.377792, -3.040733, 0.4156863, 0, 1, 1,
0.6574899, 1.026198, 0.7002574, 0.4235294, 0, 1, 1,
0.6643195, 0.9965501, -3.065814, 0.427451, 0, 1, 1,
0.6656112, -0.0819165, 1.934828, 0.4352941, 0, 1, 1,
0.6674904, 1.71596, 1.659844, 0.4392157, 0, 1, 1,
0.6714075, -0.9602913, -0.4820294, 0.4470588, 0, 1, 1,
0.6739212, -0.5473893, 2.814455, 0.4509804, 0, 1, 1,
0.6774867, 1.188598, 0.8359683, 0.4588235, 0, 1, 1,
0.6790374, -1.260833, 3.41128, 0.4627451, 0, 1, 1,
0.6826676, 0.0371933, 2.454583, 0.4705882, 0, 1, 1,
0.6909096, 0.7857527, -0.5467539, 0.4745098, 0, 1, 1,
0.6930061, 0.2715687, 1.329523, 0.4823529, 0, 1, 1,
0.6970775, 1.07566, -1.103991, 0.4862745, 0, 1, 1,
0.7022067, 0.8038646, 1.279326, 0.4941176, 0, 1, 1,
0.7033516, -0.8896191, 3.708489, 0.5019608, 0, 1, 1,
0.7120351, 0.8483068, 1.343928, 0.5058824, 0, 1, 1,
0.715059, 0.01124134, 1.450313, 0.5137255, 0, 1, 1,
0.7157013, 1.026661, -1.585727, 0.5176471, 0, 1, 1,
0.7189753, 0.06801428, 2.154163, 0.5254902, 0, 1, 1,
0.7213085, 1.820022, 0.9791582, 0.5294118, 0, 1, 1,
0.7221349, 0.277415, 1.317742, 0.5372549, 0, 1, 1,
0.7231058, -1.161512, 2.407742, 0.5411765, 0, 1, 1,
0.7268268, 1.996768, -0.3539663, 0.5490196, 0, 1, 1,
0.7280588, 0.3816399, -0.2477171, 0.5529412, 0, 1, 1,
0.7400033, 0.8433737, 0.1221557, 0.5607843, 0, 1, 1,
0.7432153, 0.2414658, 0.387335, 0.5647059, 0, 1, 1,
0.7478422, 1.558687, 0.7504534, 0.572549, 0, 1, 1,
0.7496958, -1.818673, 2.803264, 0.5764706, 0, 1, 1,
0.7546622, -0.2974805, 3.6278, 0.5843138, 0, 1, 1,
0.7549739, 0.1510496, 1.6193, 0.5882353, 0, 1, 1,
0.7620845, 0.1630453, 3.549058, 0.5960785, 0, 1, 1,
0.7653123, 0.784366, 0.01607142, 0.6039216, 0, 1, 1,
0.7653338, -0.5784046, 3.202846, 0.6078432, 0, 1, 1,
0.7656011, -0.2238033, 1.395191, 0.6156863, 0, 1, 1,
0.7684529, 0.136327, -0.241205, 0.6196079, 0, 1, 1,
0.769096, -0.2649364, 2.97458, 0.627451, 0, 1, 1,
0.7702414, 0.9189298, 0.07605803, 0.6313726, 0, 1, 1,
0.7741055, -1.175696, 2.118674, 0.6392157, 0, 1, 1,
0.7761943, -1.172001, 2.814782, 0.6431373, 0, 1, 1,
0.7778766, 0.4546463, 1.239017, 0.6509804, 0, 1, 1,
0.7884107, 1.446021, 0.6909747, 0.654902, 0, 1, 1,
0.7907447, -1.338176, 1.318236, 0.6627451, 0, 1, 1,
0.7963297, 0.984584, -0.1334201, 0.6666667, 0, 1, 1,
0.7980531, 0.9896693, 0.459118, 0.6745098, 0, 1, 1,
0.798234, 1.378928, 0.6679638, 0.6784314, 0, 1, 1,
0.8055663, 1.889066, 0.007113164, 0.6862745, 0, 1, 1,
0.8100137, -0.4877008, 2.77537, 0.6901961, 0, 1, 1,
0.8101087, -0.1752183, 1.031976, 0.6980392, 0, 1, 1,
0.8119763, 0.04423714, 2.503851, 0.7058824, 0, 1, 1,
0.8136056, -0.2666068, 1.540274, 0.7098039, 0, 1, 1,
0.816596, -0.1031238, 1.969967, 0.7176471, 0, 1, 1,
0.8309267, -0.05518874, 2.138029, 0.7215686, 0, 1, 1,
0.8394809, -0.1956455, 2.20479, 0.7294118, 0, 1, 1,
0.8425609, 0.4608742, 0.5607051, 0.7333333, 0, 1, 1,
0.8478422, 0.815976, 0.9459532, 0.7411765, 0, 1, 1,
0.853151, -2.250601, 3.150156, 0.7450981, 0, 1, 1,
0.8553446, 0.5335936, 1.385277, 0.7529412, 0, 1, 1,
0.8618085, 0.8451508, 1.960019, 0.7568628, 0, 1, 1,
0.8619507, 1.548725, 1.835127, 0.7647059, 0, 1, 1,
0.8624576, 0.7798467, 0.08071958, 0.7686275, 0, 1, 1,
0.8624658, -0.931323, 3.206249, 0.7764706, 0, 1, 1,
0.863037, 0.261041, 2.121943, 0.7803922, 0, 1, 1,
0.8635496, -0.2495365, 2.475233, 0.7882353, 0, 1, 1,
0.8645939, -0.5413902, 1.723694, 0.7921569, 0, 1, 1,
0.8661758, 1.007809, 0.6232323, 0.8, 0, 1, 1,
0.8681601, -0.2600231, 2.105765, 0.8078431, 0, 1, 1,
0.8693497, -0.4701211, 2.156041, 0.8117647, 0, 1, 1,
0.8705748, 0.6944205, 2.269222, 0.8196079, 0, 1, 1,
0.8713009, -0.8844479, 2.969259, 0.8235294, 0, 1, 1,
0.8719302, 1.346117, 0.1773838, 0.8313726, 0, 1, 1,
0.8738405, -1.734206, 4.529809, 0.8352941, 0, 1, 1,
0.8749586, -1.225425, 1.704766, 0.8431373, 0, 1, 1,
0.8767725, 1.108731, 1.115063, 0.8470588, 0, 1, 1,
0.8813522, 0.9891306, 0.06683217, 0.854902, 0, 1, 1,
0.8875498, -0.1394349, 2.930819, 0.8588235, 0, 1, 1,
0.8918716, 0.6871275, 0.734251, 0.8666667, 0, 1, 1,
0.8951792, -0.4451535, 4.065736, 0.8705882, 0, 1, 1,
0.8958877, 0.01496013, 2.113563, 0.8784314, 0, 1, 1,
0.8977275, -0.9937826, 2.518536, 0.8823529, 0, 1, 1,
0.897849, 0.2552703, 0.6384139, 0.8901961, 0, 1, 1,
0.9003152, 0.3299862, 1.379489, 0.8941177, 0, 1, 1,
0.9012619, 1.1499, 1.391977, 0.9019608, 0, 1, 1,
0.9034041, -0.2411557, 2.077471, 0.9098039, 0, 1, 1,
0.9097176, 0.490933, -1.350585, 0.9137255, 0, 1, 1,
0.9125815, -0.7936243, 2.28327, 0.9215686, 0, 1, 1,
0.9187626, -1.862795, 4.608368, 0.9254902, 0, 1, 1,
0.9201875, 0.1200475, 0.958994, 0.9333333, 0, 1, 1,
0.9227878, -0.6808258, 3.551136, 0.9372549, 0, 1, 1,
0.9267071, -0.06647588, 0.07354604, 0.945098, 0, 1, 1,
0.9291531, -0.7131006, 2.217107, 0.9490196, 0, 1, 1,
0.9449133, -0.251249, 3.07158, 0.9568627, 0, 1, 1,
0.9472106, -0.5938447, 2.374099, 0.9607843, 0, 1, 1,
0.9482967, 0.1930358, 1.662144, 0.9686275, 0, 1, 1,
0.9503036, -0.12856, 1.058203, 0.972549, 0, 1, 1,
0.9553187, 1.729023, 1.548245, 0.9803922, 0, 1, 1,
0.9566427, -0.3652239, 1.45686, 0.9843137, 0, 1, 1,
0.9588698, -0.08146089, 2.364392, 0.9921569, 0, 1, 1,
0.9607641, -0.5237791, 2.659333, 0.9960784, 0, 1, 1,
0.9609268, 1.315224, -1.068524, 1, 0, 0.9960784, 1,
0.9872901, -1.079477, 2.090633, 1, 0, 0.9882353, 1,
0.9933747, 0.3105204, -0.4891445, 1, 0, 0.9843137, 1,
0.993817, 0.001746795, 3.267652, 1, 0, 0.9764706, 1,
0.9939805, -1.909751, 3.366141, 1, 0, 0.972549, 1,
0.9949252, 1.036571, -0.7516633, 1, 0, 0.9647059, 1,
0.9972547, -0.2215521, 1.847637, 1, 0, 0.9607843, 1,
1.014, 0.4185628, 1.093917, 1, 0, 0.9529412, 1,
1.019294, -0.5099137, 3.590967, 1, 0, 0.9490196, 1,
1.021469, 0.4401264, 1.134756, 1, 0, 0.9411765, 1,
1.022147, 1.080689, 0.6272489, 1, 0, 0.9372549, 1,
1.031978, -1.49686, 2.689101, 1, 0, 0.9294118, 1,
1.034305, 1.443958, 1.100736, 1, 0, 0.9254902, 1,
1.041523, -0.02515209, 0.1900434, 1, 0, 0.9176471, 1,
1.047993, -0.79615, 3.618181, 1, 0, 0.9137255, 1,
1.050254, -0.6716084, 4.253555, 1, 0, 0.9058824, 1,
1.051254, 0.4851331, 1.061581, 1, 0, 0.9019608, 1,
1.05245, -0.3622246, 2.950361, 1, 0, 0.8941177, 1,
1.060719, -0.4556112, 2.821496, 1, 0, 0.8862745, 1,
1.066534, 0.5695306, -0.2410885, 1, 0, 0.8823529, 1,
1.067084, 2.079398, 1.591675, 1, 0, 0.8745098, 1,
1.068613, -0.2443616, 1.097999, 1, 0, 0.8705882, 1,
1.077226, 0.6416268, 0.4904271, 1, 0, 0.8627451, 1,
1.078434, -0.5566992, 1.425898, 1, 0, 0.8588235, 1,
1.078698, 0.3851813, 2.179865, 1, 0, 0.8509804, 1,
1.087766, 0.9543766, 1.186201, 1, 0, 0.8470588, 1,
1.088538, 2.539978, -0.2208671, 1, 0, 0.8392157, 1,
1.09893, 0.7944445, 2.280534, 1, 0, 0.8352941, 1,
1.100481, -0.09069445, 2.665406, 1, 0, 0.827451, 1,
1.107711, 0.3280315, 2.335173, 1, 0, 0.8235294, 1,
1.114095, -0.01657644, 2.596095, 1, 0, 0.8156863, 1,
1.115388, -1.290787, 2.818367, 1, 0, 0.8117647, 1,
1.127037, -0.2432887, 0.03060113, 1, 0, 0.8039216, 1,
1.134172, -0.1122138, 0.9329563, 1, 0, 0.7960784, 1,
1.139406, -0.9379791, 0.1662469, 1, 0, 0.7921569, 1,
1.14403, 1.005041, 0.8854744, 1, 0, 0.7843137, 1,
1.149026, 0.186856, 1.894733, 1, 0, 0.7803922, 1,
1.156232, -1.09938, 3.491197, 1, 0, 0.772549, 1,
1.164651, 1.507698, -0.7546673, 1, 0, 0.7686275, 1,
1.164682, -0.9221343, 1.695401, 1, 0, 0.7607843, 1,
1.165236, -0.933952, 2.337325, 1, 0, 0.7568628, 1,
1.16797, 1.160872, 0.2975135, 1, 0, 0.7490196, 1,
1.168861, 0.817021, 0.1764106, 1, 0, 0.7450981, 1,
1.169052, -0.1972583, 1.0538, 1, 0, 0.7372549, 1,
1.17074, -1.221528, 1.618193, 1, 0, 0.7333333, 1,
1.171363, -0.9551898, 2.368911, 1, 0, 0.7254902, 1,
1.175854, -1.258977, 1.454195, 1, 0, 0.7215686, 1,
1.189228, 0.001114517, 1.302175, 1, 0, 0.7137255, 1,
1.189259, 0.04931159, 0.8054308, 1, 0, 0.7098039, 1,
1.195764, -1.543058, 1.776201, 1, 0, 0.7019608, 1,
1.20412, 0.1174355, 0.8284945, 1, 0, 0.6941177, 1,
1.207702, 0.9419159, 0.8220925, 1, 0, 0.6901961, 1,
1.210683, 0.4088343, 1.820824, 1, 0, 0.682353, 1,
1.212297, 0.3613511, 1.232369, 1, 0, 0.6784314, 1,
1.216717, 0.1148895, 2.598872, 1, 0, 0.6705883, 1,
1.225714, -1.418614, 1.967562, 1, 0, 0.6666667, 1,
1.22686, 2.01434, 0.2793863, 1, 0, 0.6588235, 1,
1.231286, -0.5165597, 1.973269, 1, 0, 0.654902, 1,
1.234432, 3.129843, -0.7312208, 1, 0, 0.6470588, 1,
1.239166, -0.606828, 1.543319, 1, 0, 0.6431373, 1,
1.240906, 0.944735, 1.030135, 1, 0, 0.6352941, 1,
1.254109, 0.4515244, 0.6196262, 1, 0, 0.6313726, 1,
1.259214, 1.248539, 0.5954255, 1, 0, 0.6235294, 1,
1.265148, 0.5855559, 1.453826, 1, 0, 0.6196079, 1,
1.265503, 0.3078272, 2.371471, 1, 0, 0.6117647, 1,
1.265602, 1.464541, 0.8217539, 1, 0, 0.6078432, 1,
1.268893, -0.1926431, 1.394144, 1, 0, 0.6, 1,
1.284411, -0.6367142, 2.468609, 1, 0, 0.5921569, 1,
1.287357, -0.2128415, -1.875597, 1, 0, 0.5882353, 1,
1.289222, 0.4737038, -0.2673164, 1, 0, 0.5803922, 1,
1.292356, 0.3877014, 1.886571, 1, 0, 0.5764706, 1,
1.296878, 0.1813715, -0.05681065, 1, 0, 0.5686275, 1,
1.298107, 0.351555, 1.205886, 1, 0, 0.5647059, 1,
1.299201, -1.346146, 3.102678, 1, 0, 0.5568628, 1,
1.303534, -1.604831, 2.153259, 1, 0, 0.5529412, 1,
1.315709, 2.696553, 1.543697, 1, 0, 0.5450981, 1,
1.316569, -1.189045, 1.764184, 1, 0, 0.5411765, 1,
1.318955, -1.749489, 2.503914, 1, 0, 0.5333334, 1,
1.32014, -0.4226966, 1.746934, 1, 0, 0.5294118, 1,
1.325609, -0.8509501, 2.479702, 1, 0, 0.5215687, 1,
1.327404, 0.6992299, 2.954145, 1, 0, 0.5176471, 1,
1.354914, -0.4985346, 2.123092, 1, 0, 0.509804, 1,
1.373359, -0.3926424, 1.06458, 1, 0, 0.5058824, 1,
1.3947, -0.2684217, 1.915697, 1, 0, 0.4980392, 1,
1.40088, -1.449816, 2.593223, 1, 0, 0.4901961, 1,
1.405441, -0.7407081, 2.35926, 1, 0, 0.4862745, 1,
1.41265, -0.5176829, 1.164107, 1, 0, 0.4784314, 1,
1.420707, -0.2789544, 2.358164, 1, 0, 0.4745098, 1,
1.421567, -0.06287719, 2.965944, 1, 0, 0.4666667, 1,
1.431871, 0.2864537, 0.4745083, 1, 0, 0.4627451, 1,
1.432619, -1.726174, 3.562126, 1, 0, 0.454902, 1,
1.450955, -0.9285924, 3.112015, 1, 0, 0.4509804, 1,
1.457094, -0.494635, 1.974275, 1, 0, 0.4431373, 1,
1.460089, 1.990188, -0.09421101, 1, 0, 0.4392157, 1,
1.465143, 0.4022329, 1.549971, 1, 0, 0.4313726, 1,
1.46587, 1.669177, -0.2253662, 1, 0, 0.427451, 1,
1.48502, 1.871218, 2.16285, 1, 0, 0.4196078, 1,
1.486701, -0.4189799, 2.889549, 1, 0, 0.4156863, 1,
1.490971, -0.5005345, 3.479374, 1, 0, 0.4078431, 1,
1.498315, 1.745288, 0.8716841, 1, 0, 0.4039216, 1,
1.503652, -0.6559695, 3.632603, 1, 0, 0.3960784, 1,
1.509268, 1.653587, 1.271527, 1, 0, 0.3882353, 1,
1.513296, 0.547181, 0.3880329, 1, 0, 0.3843137, 1,
1.518373, 0.6779029, 0.01834206, 1, 0, 0.3764706, 1,
1.549607, 0.686464, 1.288101, 1, 0, 0.372549, 1,
1.563816, 2.955771, -0.2237533, 1, 0, 0.3647059, 1,
1.567037, 1.210502, -0.02655825, 1, 0, 0.3607843, 1,
1.567148, 0.07819971, 1.637955, 1, 0, 0.3529412, 1,
1.568172, 0.2432247, 2.938443, 1, 0, 0.3490196, 1,
1.571229, 0.7618564, 2.152433, 1, 0, 0.3411765, 1,
1.573453, -0.5096465, 1.714355, 1, 0, 0.3372549, 1,
1.578786, 0.3410001, 0.4916803, 1, 0, 0.3294118, 1,
1.611485, 0.5624045, -1.490019, 1, 0, 0.3254902, 1,
1.612898, -0.7948412, 1.396607, 1, 0, 0.3176471, 1,
1.61855, 2.734903, -0.2722883, 1, 0, 0.3137255, 1,
1.640439, 0.1709276, 1.605735, 1, 0, 0.3058824, 1,
1.666913, 0.2151284, 3.720591, 1, 0, 0.2980392, 1,
1.671797, -0.749083, 2.552327, 1, 0, 0.2941177, 1,
1.673445, -0.6404415, 3.179902, 1, 0, 0.2862745, 1,
1.691869, -0.3730133, 2.098613, 1, 0, 0.282353, 1,
1.692647, -1.777266, 3.349462, 1, 0, 0.2745098, 1,
1.698056, 0.04936817, 3.427893, 1, 0, 0.2705882, 1,
1.698683, 1.264955, -0.1669134, 1, 0, 0.2627451, 1,
1.704426, 0.2456685, 1.895137, 1, 0, 0.2588235, 1,
1.721136, -1.306984, 1.481374, 1, 0, 0.2509804, 1,
1.73434, -0.4527009, 0.9425557, 1, 0, 0.2470588, 1,
1.747466, 1.000197, -0.2903584, 1, 0, 0.2392157, 1,
1.750478, 1.014794, 2.103758, 1, 0, 0.2352941, 1,
1.755403, -0.2170864, 2.389873, 1, 0, 0.227451, 1,
1.762852, 0.6747076, 1.711696, 1, 0, 0.2235294, 1,
1.782768, 0.8364985, 0.6746936, 1, 0, 0.2156863, 1,
1.797968, -1.152822, 2.397846, 1, 0, 0.2117647, 1,
1.809718, -0.2122446, 1.750878, 1, 0, 0.2039216, 1,
1.820696, 1.029349, -0.1474245, 1, 0, 0.1960784, 1,
1.832072, -1.218563, 3.10437, 1, 0, 0.1921569, 1,
1.836729, -0.5650777, 1.964418, 1, 0, 0.1843137, 1,
1.847759, -0.7756113, 1.385326, 1, 0, 0.1803922, 1,
1.882029, 0.787323, 1.170807, 1, 0, 0.172549, 1,
1.88241, 1.697752, 1.031904, 1, 0, 0.1686275, 1,
1.918036, -0.730805, 1.018572, 1, 0, 0.1607843, 1,
1.926826, 0.8616967, 1.490328, 1, 0, 0.1568628, 1,
1.933517, -1.527112, 3.121451, 1, 0, 0.1490196, 1,
1.992199, 0.662469, 2.793459, 1, 0, 0.145098, 1,
1.995101, 0.7873512, 0.2130142, 1, 0, 0.1372549, 1,
1.997906, -0.06631476, 2.393293, 1, 0, 0.1333333, 1,
2.002935, 1.104141, 2.306596, 1, 0, 0.1254902, 1,
2.01596, 2.672772, -0.3243613, 1, 0, 0.1215686, 1,
2.046122, 0.5698179, 2.558966, 1, 0, 0.1137255, 1,
2.10695, -1.59294, 1.913265, 1, 0, 0.1098039, 1,
2.186815, -1.924684, 2.653032, 1, 0, 0.1019608, 1,
2.190465, -2.294417, 2.754243, 1, 0, 0.09411765, 1,
2.195685, -0.3219652, 1.831406, 1, 0, 0.09019608, 1,
2.224059, 0.8873842, 2.582579, 1, 0, 0.08235294, 1,
2.297348, 1.160643, 2.276393, 1, 0, 0.07843138, 1,
2.305557, 0.1346311, -0.429085, 1, 0, 0.07058824, 1,
2.405858, -0.1012355, 2.375967, 1, 0, 0.06666667, 1,
2.437491, 0.4584235, 1.34237, 1, 0, 0.05882353, 1,
2.479497, -0.7632922, 2.342307, 1, 0, 0.05490196, 1,
2.485472, 1.238986, -0.02061812, 1, 0, 0.04705882, 1,
2.51591, 0.6602585, 1.289273, 1, 0, 0.04313726, 1,
2.602318, 0.01390752, 2.363722, 1, 0, 0.03529412, 1,
2.605513, 0.6592126, 1.318602, 1, 0, 0.03137255, 1,
2.704453, -0.8016613, -0.3251834, 1, 0, 0.02352941, 1,
2.835493, 0.2509982, 2.289473, 1, 0, 0.01960784, 1,
3.163165, 1.215127, 2.262046, 1, 0, 0.01176471, 1,
3.71515, 2.000342, 0.4297442, 1, 0, 0.007843138, 1
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
0.3858355, -4.92992, -7.098794, 0, -0.5, 0.5, 0.5,
0.3858355, -4.92992, -7.098794, 1, -0.5, 0.5, 0.5,
0.3858355, -4.92992, -7.098794, 1, 1.5, 0.5, 0.5,
0.3858355, -4.92992, -7.098794, 0, 1.5, 0.5, 0.5
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
-4.072117, -0.315973, -7.098794, 0, -0.5, 0.5, 0.5,
-4.072117, -0.315973, -7.098794, 1, -0.5, 0.5, 0.5,
-4.072117, -0.315973, -7.098794, 1, 1.5, 0.5, 0.5,
-4.072117, -0.315973, -7.098794, 0, 1.5, 0.5, 0.5
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
-4.072117, -4.92992, 0.1948624, 0, -0.5, 0.5, 0.5,
-4.072117, -4.92992, 0.1948624, 1, -0.5, 0.5, 0.5,
-4.072117, -4.92992, 0.1948624, 1, 1.5, 0.5, 0.5,
-4.072117, -4.92992, 0.1948624, 0, 1.5, 0.5, 0.5
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
-2, -3.865163, -5.415642,
3, -3.865163, -5.415642,
-2, -3.865163, -5.415642,
-2, -4.042623, -5.696167,
-1, -3.865163, -5.415642,
-1, -4.042623, -5.696167,
0, -3.865163, -5.415642,
0, -4.042623, -5.696167,
1, -3.865163, -5.415642,
1, -4.042623, -5.696167,
2, -3.865163, -5.415642,
2, -4.042623, -5.696167,
3, -3.865163, -5.415642,
3, -4.042623, -5.696167
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
-2, -4.397542, -6.257218, 0, -0.5, 0.5, 0.5,
-2, -4.397542, -6.257218, 1, -0.5, 0.5, 0.5,
-2, -4.397542, -6.257218, 1, 1.5, 0.5, 0.5,
-2, -4.397542, -6.257218, 0, 1.5, 0.5, 0.5,
-1, -4.397542, -6.257218, 0, -0.5, 0.5, 0.5,
-1, -4.397542, -6.257218, 1, -0.5, 0.5, 0.5,
-1, -4.397542, -6.257218, 1, 1.5, 0.5, 0.5,
-1, -4.397542, -6.257218, 0, 1.5, 0.5, 0.5,
0, -4.397542, -6.257218, 0, -0.5, 0.5, 0.5,
0, -4.397542, -6.257218, 1, -0.5, 0.5, 0.5,
0, -4.397542, -6.257218, 1, 1.5, 0.5, 0.5,
0, -4.397542, -6.257218, 0, 1.5, 0.5, 0.5,
1, -4.397542, -6.257218, 0, -0.5, 0.5, 0.5,
1, -4.397542, -6.257218, 1, -0.5, 0.5, 0.5,
1, -4.397542, -6.257218, 1, 1.5, 0.5, 0.5,
1, -4.397542, -6.257218, 0, 1.5, 0.5, 0.5,
2, -4.397542, -6.257218, 0, -0.5, 0.5, 0.5,
2, -4.397542, -6.257218, 1, -0.5, 0.5, 0.5,
2, -4.397542, -6.257218, 1, 1.5, 0.5, 0.5,
2, -4.397542, -6.257218, 0, 1.5, 0.5, 0.5,
3, -4.397542, -6.257218, 0, -0.5, 0.5, 0.5,
3, -4.397542, -6.257218, 1, -0.5, 0.5, 0.5,
3, -4.397542, -6.257218, 1, 1.5, 0.5, 0.5,
3, -4.397542, -6.257218, 0, 1.5, 0.5, 0.5
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
-3.043359, -3, -5.415642,
-3.043359, 3, -5.415642,
-3.043359, -3, -5.415642,
-3.214818, -3, -5.696167,
-3.043359, -2, -5.415642,
-3.214818, -2, -5.696167,
-3.043359, -1, -5.415642,
-3.214818, -1, -5.696167,
-3.043359, 0, -5.415642,
-3.214818, 0, -5.696167,
-3.043359, 1, -5.415642,
-3.214818, 1, -5.696167,
-3.043359, 2, -5.415642,
-3.214818, 2, -5.696167,
-3.043359, 3, -5.415642,
-3.214818, 3, -5.696167
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
-3.557738, -3, -6.257218, 0, -0.5, 0.5, 0.5,
-3.557738, -3, -6.257218, 1, -0.5, 0.5, 0.5,
-3.557738, -3, -6.257218, 1, 1.5, 0.5, 0.5,
-3.557738, -3, -6.257218, 0, 1.5, 0.5, 0.5,
-3.557738, -2, -6.257218, 0, -0.5, 0.5, 0.5,
-3.557738, -2, -6.257218, 1, -0.5, 0.5, 0.5,
-3.557738, -2, -6.257218, 1, 1.5, 0.5, 0.5,
-3.557738, -2, -6.257218, 0, 1.5, 0.5, 0.5,
-3.557738, -1, -6.257218, 0, -0.5, 0.5, 0.5,
-3.557738, -1, -6.257218, 1, -0.5, 0.5, 0.5,
-3.557738, -1, -6.257218, 1, 1.5, 0.5, 0.5,
-3.557738, -1, -6.257218, 0, 1.5, 0.5, 0.5,
-3.557738, 0, -6.257218, 0, -0.5, 0.5, 0.5,
-3.557738, 0, -6.257218, 1, -0.5, 0.5, 0.5,
-3.557738, 0, -6.257218, 1, 1.5, 0.5, 0.5,
-3.557738, 0, -6.257218, 0, 1.5, 0.5, 0.5,
-3.557738, 1, -6.257218, 0, -0.5, 0.5, 0.5,
-3.557738, 1, -6.257218, 1, -0.5, 0.5, 0.5,
-3.557738, 1, -6.257218, 1, 1.5, 0.5, 0.5,
-3.557738, 1, -6.257218, 0, 1.5, 0.5, 0.5,
-3.557738, 2, -6.257218, 0, -0.5, 0.5, 0.5,
-3.557738, 2, -6.257218, 1, -0.5, 0.5, 0.5,
-3.557738, 2, -6.257218, 1, 1.5, 0.5, 0.5,
-3.557738, 2, -6.257218, 0, 1.5, 0.5, 0.5,
-3.557738, 3, -6.257218, 0, -0.5, 0.5, 0.5,
-3.557738, 3, -6.257218, 1, -0.5, 0.5, 0.5,
-3.557738, 3, -6.257218, 1, 1.5, 0.5, 0.5,
-3.557738, 3, -6.257218, 0, 1.5, 0.5, 0.5
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
-3.043359, -3.865163, -4,
-3.043359, -3.865163, 4,
-3.043359, -3.865163, -4,
-3.214818, -4.042623, -4,
-3.043359, -3.865163, -2,
-3.214818, -4.042623, -2,
-3.043359, -3.865163, 0,
-3.214818, -4.042623, 0,
-3.043359, -3.865163, 2,
-3.214818, -4.042623, 2,
-3.043359, -3.865163, 4,
-3.214818, -4.042623, 4
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
-3.557738, -4.397542, -4, 0, -0.5, 0.5, 0.5,
-3.557738, -4.397542, -4, 1, -0.5, 0.5, 0.5,
-3.557738, -4.397542, -4, 1, 1.5, 0.5, 0.5,
-3.557738, -4.397542, -4, 0, 1.5, 0.5, 0.5,
-3.557738, -4.397542, -2, 0, -0.5, 0.5, 0.5,
-3.557738, -4.397542, -2, 1, -0.5, 0.5, 0.5,
-3.557738, -4.397542, -2, 1, 1.5, 0.5, 0.5,
-3.557738, -4.397542, -2, 0, 1.5, 0.5, 0.5,
-3.557738, -4.397542, 0, 0, -0.5, 0.5, 0.5,
-3.557738, -4.397542, 0, 1, -0.5, 0.5, 0.5,
-3.557738, -4.397542, 0, 1, 1.5, 0.5, 0.5,
-3.557738, -4.397542, 0, 0, 1.5, 0.5, 0.5,
-3.557738, -4.397542, 2, 0, -0.5, 0.5, 0.5,
-3.557738, -4.397542, 2, 1, -0.5, 0.5, 0.5,
-3.557738, -4.397542, 2, 1, 1.5, 0.5, 0.5,
-3.557738, -4.397542, 2, 0, 1.5, 0.5, 0.5,
-3.557738, -4.397542, 4, 0, -0.5, 0.5, 0.5,
-3.557738, -4.397542, 4, 1, -0.5, 0.5, 0.5,
-3.557738, -4.397542, 4, 1, 1.5, 0.5, 0.5,
-3.557738, -4.397542, 4, 0, 1.5, 0.5, 0.5
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
-3.043359, -3.865163, -5.415642,
-3.043359, 3.233217, -5.415642,
-3.043359, -3.865163, 5.805367,
-3.043359, 3.233217, 5.805367,
-3.043359, -3.865163, -5.415642,
-3.043359, -3.865163, 5.805367,
-3.043359, 3.233217, -5.415642,
-3.043359, 3.233217, 5.805367,
-3.043359, -3.865163, -5.415642,
3.81503, -3.865163, -5.415642,
-3.043359, -3.865163, 5.805367,
3.81503, -3.865163, 5.805367,
-3.043359, 3.233217, -5.415642,
3.81503, 3.233217, -5.415642,
-3.043359, 3.233217, 5.805367,
3.81503, 3.233217, 5.805367,
3.81503, -3.865163, -5.415642,
3.81503, 3.233217, -5.415642,
3.81503, -3.865163, 5.805367,
3.81503, 3.233217, 5.805367,
3.81503, -3.865163, -5.415642,
3.81503, -3.865163, 5.805367,
3.81503, 3.233217, -5.415642,
3.81503, 3.233217, 5.805367
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
var radius = 7.980028;
var distance = 35.50404;
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
mvMatrix.translate( -0.3858355, 0.315973, -0.1948624 );
mvMatrix.scale( 1.258045, 1.215511, 0.7689292 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.50404);
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
Ethylone<-read.table("Ethylone.xyz", skip=1)
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
-2.943479, -0.6590282, -0.5021675, 0, 0, 1, 1, 1,
-2.78094, 0.09780613, -0.6945242, 1, 0, 0, 1, 1,
-2.771298, -1.801413, -1.48601, 1, 0, 0, 1, 1,
-2.588341, -0.3428346, -1.707904, 1, 0, 0, 1, 1,
-2.571213, 0.5141842, -2.454247, 1, 0, 0, 1, 1,
-2.549866, 0.276554, -1.076475, 1, 0, 0, 1, 1,
-2.321737, -0.9849507, -1.284347, 0, 0, 0, 1, 1,
-2.281208, -0.4867305, -1.207179, 0, 0, 0, 1, 1,
-2.23851, -0.8892121, -3.216816, 0, 0, 0, 1, 1,
-2.235229, -1.170294, -3.382652, 0, 0, 0, 1, 1,
-2.178358, -1.961686, -0.6179622, 0, 0, 0, 1, 1,
-2.148105, 0.2032793, -0.4506469, 0, 0, 0, 1, 1,
-2.107721, -2.127639, -0.5860985, 0, 0, 0, 1, 1,
-2.060929, 0.4567699, -2.239893, 1, 1, 1, 1, 1,
-2.05578, 0.4342588, -1.515646, 1, 1, 1, 1, 1,
-2.049989, -0.6943882, -1.490369, 1, 1, 1, 1, 1,
-2.046622, -0.1879002, -1.971761, 1, 1, 1, 1, 1,
-2.012773, -0.03808628, -0.5071324, 1, 1, 1, 1, 1,
-1.993491, -0.1321259, -2.444472, 1, 1, 1, 1, 1,
-1.958687, -0.008558543, 0.1685789, 1, 1, 1, 1, 1,
-1.946921, 0.5672991, -0.8873102, 1, 1, 1, 1, 1,
-1.925717, 0.7078137, -0.9797254, 1, 1, 1, 1, 1,
-1.88994, 1.505022, -1.429315, 1, 1, 1, 1, 1,
-1.888721, -2.59528, -1.653528, 1, 1, 1, 1, 1,
-1.879824, -0.6225991, -1.345163, 1, 1, 1, 1, 1,
-1.86277, -1.331963, -4.348435, 1, 1, 1, 1, 1,
-1.862362, -0.5926677, -2.280941, 1, 1, 1, 1, 1,
-1.845004, 0.32748, -1.812237, 1, 1, 1, 1, 1,
-1.800844, 0.2650251, -2.235051, 0, 0, 1, 1, 1,
-1.794177, 0.6770244, -1.419464, 1, 0, 0, 1, 1,
-1.793417, -0.4904475, -3.007825, 1, 0, 0, 1, 1,
-1.778624, 0.6325754, -1.029427, 1, 0, 0, 1, 1,
-1.749453, 0.9913265, -0.2076218, 1, 0, 0, 1, 1,
-1.735651, -0.1315163, -1.245853, 1, 0, 0, 1, 1,
-1.732701, 1.323882, 0.9276392, 0, 0, 0, 1, 1,
-1.715863, 0.2936085, -0.9812377, 0, 0, 0, 1, 1,
-1.684268, -0.3655849, -2.351204, 0, 0, 0, 1, 1,
-1.68323, 0.1655411, -1.77925, 0, 0, 0, 1, 1,
-1.680864, -0.5628279, -2.080403, 0, 0, 0, 1, 1,
-1.674843, -1.068217, -3.114071, 0, 0, 0, 1, 1,
-1.668192, -1.288538, -1.726784, 0, 0, 0, 1, 1,
-1.654922, 0.1622946, 0.9879395, 1, 1, 1, 1, 1,
-1.64558, -0.006359077, -2.287172, 1, 1, 1, 1, 1,
-1.640717, -0.03831753, -1.937446, 1, 1, 1, 1, 1,
-1.636287, -0.3427269, -2.409385, 1, 1, 1, 1, 1,
-1.634497, 0.1637459, -0.4851801, 1, 1, 1, 1, 1,
-1.609256, -0.8810663, -1.758914, 1, 1, 1, 1, 1,
-1.608314, -0.003835049, -2.195968, 1, 1, 1, 1, 1,
-1.599438, -0.9369116, -3.202958, 1, 1, 1, 1, 1,
-1.598328, 0.6757226, 0.07291183, 1, 1, 1, 1, 1,
-1.596294, -1.486089, -2.507897, 1, 1, 1, 1, 1,
-1.59029, 0.1806117, -2.741148, 1, 1, 1, 1, 1,
-1.572813, 1.457961, -0.9014047, 1, 1, 1, 1, 1,
-1.549576, -0.8332085, -1.186757, 1, 1, 1, 1, 1,
-1.539715, 1.263854, -0.6240472, 1, 1, 1, 1, 1,
-1.528903, -1.52473, -1.51047, 1, 1, 1, 1, 1,
-1.524498, 0.6639714, -1.980373, 0, 0, 1, 1, 1,
-1.523686, 0.8991661, -1.10058, 1, 0, 0, 1, 1,
-1.508878, 0.06919045, -1.391035, 1, 0, 0, 1, 1,
-1.506718, -0.3964707, -0.7945755, 1, 0, 0, 1, 1,
-1.503676, 0.4430792, -0.2339463, 1, 0, 0, 1, 1,
-1.499969, 1.471923, 1.350161, 1, 0, 0, 1, 1,
-1.48593, -0.7055517, -3.115948, 0, 0, 0, 1, 1,
-1.481343, 1.154494, -0.5947381, 0, 0, 0, 1, 1,
-1.480358, 0.8206092, -2.285951, 0, 0, 0, 1, 1,
-1.478827, 0.432485, -0.5441818, 0, 0, 0, 1, 1,
-1.476538, -1.306175, -3.642275, 0, 0, 0, 1, 1,
-1.476249, -0.9725574, -2.858269, 0, 0, 0, 1, 1,
-1.475217, -0.4008391, -2.197844, 0, 0, 0, 1, 1,
-1.464866, 0.8419668, -1.29402, 1, 1, 1, 1, 1,
-1.454358, -0.5583249, -1.206572, 1, 1, 1, 1, 1,
-1.45284, -0.7908993, -3.552022, 1, 1, 1, 1, 1,
-1.434482, 0.4630672, -3.29046, 1, 1, 1, 1, 1,
-1.420892, 0.4923975, -1.910555, 1, 1, 1, 1, 1,
-1.41362, 1.574042, -1.578858, 1, 1, 1, 1, 1,
-1.407931, -0.2229757, -2.689301, 1, 1, 1, 1, 1,
-1.403295, 0.2750937, -2.066775, 1, 1, 1, 1, 1,
-1.399557, -2.836797, -4.709908, 1, 1, 1, 1, 1,
-1.376745, 0.3026636, -1.057521, 1, 1, 1, 1, 1,
-1.376128, -1.2004, -1.16843, 1, 1, 1, 1, 1,
-1.371684, 0.4213794, -0.5098428, 1, 1, 1, 1, 1,
-1.364378, 1.962192, -0.9553169, 1, 1, 1, 1, 1,
-1.350519, -1.777028, -3.531106, 1, 1, 1, 1, 1,
-1.345378, 0.3648451, -1.090742, 1, 1, 1, 1, 1,
-1.345325, -0.2261051, -3.147844, 0, 0, 1, 1, 1,
-1.343371, 0.01690627, -0.8914437, 1, 0, 0, 1, 1,
-1.34268, 0.6169309, -0.6575152, 1, 0, 0, 1, 1,
-1.341431, -0.3349106, -0.3971384, 1, 0, 0, 1, 1,
-1.323239, -0.3189431, -3.720479, 1, 0, 0, 1, 1,
-1.32077, -0.5273631, -1.567284, 1, 0, 0, 1, 1,
-1.312221, 0.3985339, 0.1319455, 0, 0, 0, 1, 1,
-1.309545, -1.562222, -1.172083, 0, 0, 0, 1, 1,
-1.306465, -0.7503063, -0.05491487, 0, 0, 0, 1, 1,
-1.305056, 0.005790166, -0.7388706, 0, 0, 0, 1, 1,
-1.301907, -2.244306, -2.168381, 0, 0, 0, 1, 1,
-1.30115, -2.233403, -3.761769, 0, 0, 0, 1, 1,
-1.300252, -0.8650188, -1.755168, 0, 0, 0, 1, 1,
-1.29953, -0.2694657, -1.736921, 1, 1, 1, 1, 1,
-1.298483, -0.5812908, -0.2836697, 1, 1, 1, 1, 1,
-1.277306, -1.388512, -1.938165, 1, 1, 1, 1, 1,
-1.274527, 0.5277949, -0.2599336, 1, 1, 1, 1, 1,
-1.271006, 0.3838429, 0.007338594, 1, 1, 1, 1, 1,
-1.266491, 0.7511514, -2.086812, 1, 1, 1, 1, 1,
-1.266249, -0.09565477, -1.529868, 1, 1, 1, 1, 1,
-1.261428, -1.189148, -1.428003, 1, 1, 1, 1, 1,
-1.260823, 0.7849224, -2.801584, 1, 1, 1, 1, 1,
-1.255695, 1.300276, 0.3258765, 1, 1, 1, 1, 1,
-1.248353, -0.1333213, -2.033859, 1, 1, 1, 1, 1,
-1.24506, 1.269644, 0.8637096, 1, 1, 1, 1, 1,
-1.238677, 0.7066151, -1.090344, 1, 1, 1, 1, 1,
-1.235637, -0.6616597, -1.829545, 1, 1, 1, 1, 1,
-1.233631, -0.3924997, -2.885204, 1, 1, 1, 1, 1,
-1.231278, 0.05818491, 0.2771825, 0, 0, 1, 1, 1,
-1.225768, -2.394213, -2.636141, 1, 0, 0, 1, 1,
-1.220027, -0.3964325, -1.564386, 1, 0, 0, 1, 1,
-1.217395, -0.1607058, -2.578152, 1, 0, 0, 1, 1,
-1.215502, -0.2275494, -2.728431, 1, 0, 0, 1, 1,
-1.203566, -1.004806, -1.427209, 1, 0, 0, 1, 1,
-1.196917, 0.6390803, -1.95041, 0, 0, 0, 1, 1,
-1.196865, 1.036025, -0.4285067, 0, 0, 0, 1, 1,
-1.194728, 2.318099, -2.103813, 0, 0, 0, 1, 1,
-1.193466, -0.3803869, -2.982315, 0, 0, 0, 1, 1,
-1.192583, 2.002317, -1.232242, 0, 0, 0, 1, 1,
-1.184758, -0.4061998, -1.343966, 0, 0, 0, 1, 1,
-1.172831, 0.5616255, -1.285371, 0, 0, 0, 1, 1,
-1.162667, -1.319893, -2.382946, 1, 1, 1, 1, 1,
-1.148978, 0.03041539, -3.029651, 1, 1, 1, 1, 1,
-1.143214, 0.2156183, -1.364808, 1, 1, 1, 1, 1,
-1.139401, 0.637297, -0.09597185, 1, 1, 1, 1, 1,
-1.137763, 0.5982552, -1.165001, 1, 1, 1, 1, 1,
-1.130099, 0.5383524, -1.658984, 1, 1, 1, 1, 1,
-1.122835, -0.5642487, -1.381648, 1, 1, 1, 1, 1,
-1.12014, -1.616153, -1.942478, 1, 1, 1, 1, 1,
-1.116194, -0.2515801, 0.1148683, 1, 1, 1, 1, 1,
-1.102946, -0.9672769, -3.693557, 1, 1, 1, 1, 1,
-1.102913, 0.7049848, -0.9321272, 1, 1, 1, 1, 1,
-1.101486, 0.06652434, -1.630421, 1, 1, 1, 1, 1,
-1.101136, 1.095766, -1.935459, 1, 1, 1, 1, 1,
-1.095031, -1.019726, -2.219564, 1, 1, 1, 1, 1,
-1.091233, 0.2920965, -1.617041, 1, 1, 1, 1, 1,
-1.087739, -0.5922275, -2.932667, 0, 0, 1, 1, 1,
-1.084888, 0.3332778, -1.346701, 1, 0, 0, 1, 1,
-1.081543, -0.9483277, -0.2996163, 1, 0, 0, 1, 1,
-1.081101, 1.172138, -0.9404662, 1, 0, 0, 1, 1,
-1.078867, -1.835579, -1.381774, 1, 0, 0, 1, 1,
-1.071503, -0.4622526, -1.924796, 1, 0, 0, 1, 1,
-1.0704, 0.6240529, -2.403544, 0, 0, 0, 1, 1,
-1.064456, -0.1717797, -3.144827, 0, 0, 0, 1, 1,
-1.062988, -0.76843, -0.5956325, 0, 0, 0, 1, 1,
-1.054008, -0.1871441, -0.7825776, 0, 0, 0, 1, 1,
-1.053517, 1.240391, -3.078169, 0, 0, 0, 1, 1,
-1.053322, 0.06755189, -2.59268, 0, 0, 0, 1, 1,
-1.0417, 0.04457453, -0.8995695, 0, 0, 0, 1, 1,
-1.040961, 2.892605, -0.5116361, 1, 1, 1, 1, 1,
-1.035581, 0.06423755, -2.791025, 1, 1, 1, 1, 1,
-1.034471, 0.1695066, -0.2326783, 1, 1, 1, 1, 1,
-1.021299, 0.989237, -0.6725513, 1, 1, 1, 1, 1,
-1.017819, 1.775197, -0.002425254, 1, 1, 1, 1, 1,
-1.014666, 0.3414577, -3.151159, 1, 1, 1, 1, 1,
-1.009038, 0.4685661, 0.3258666, 1, 1, 1, 1, 1,
-1.007437, 1.188503, -1.121059, 1, 1, 1, 1, 1,
-1.005145, -1.16104, -3.47565, 1, 1, 1, 1, 1,
-1.004689, -0.6797119, -1.574726, 1, 1, 1, 1, 1,
-1.003377, -2.675306, -3.139772, 1, 1, 1, 1, 1,
-0.9943307, -0.7999801, -2.196884, 1, 1, 1, 1, 1,
-0.9904459, 0.6036701, 0.2582459, 1, 1, 1, 1, 1,
-0.9870459, 0.0205566, -1.222879, 1, 1, 1, 1, 1,
-0.9823463, 1.843095, -0.7745811, 1, 1, 1, 1, 1,
-0.9812189, 0.9492365, -0.7351387, 0, 0, 1, 1, 1,
-0.9811883, 0.5045346, -1.322024, 1, 0, 0, 1, 1,
-0.9756871, 0.8178605, 0.456618, 1, 0, 0, 1, 1,
-0.9751828, 0.07419305, -3.159209, 1, 0, 0, 1, 1,
-0.9741001, 0.5419355, -1.963162, 1, 0, 0, 1, 1,
-0.9736597, -1.62827, -2.848761, 1, 0, 0, 1, 1,
-0.9714438, 0.5853238, -1.724559, 0, 0, 0, 1, 1,
-0.9665868, 0.1981892, -3.795188, 0, 0, 0, 1, 1,
-0.9625984, 0.3181089, -1.490372, 0, 0, 0, 1, 1,
-0.9621026, 0.4434471, -1.458611, 0, 0, 0, 1, 1,
-0.9578814, 1.286604, 1.26003, 0, 0, 0, 1, 1,
-0.9549956, 1.373141, -1.032955, 0, 0, 0, 1, 1,
-0.9506281, -0.3110247, -0.5726409, 0, 0, 0, 1, 1,
-0.9487987, 0.4434306, -1.806682, 1, 1, 1, 1, 1,
-0.939367, -0.160982, -2.07145, 1, 1, 1, 1, 1,
-0.9387181, -0.1146662, -2.800361, 1, 1, 1, 1, 1,
-0.9376886, 0.03926189, -1.275658, 1, 1, 1, 1, 1,
-0.9364477, -0.7416314, -2.819977, 1, 1, 1, 1, 1,
-0.936373, -0.2231776, -0.2874553, 1, 1, 1, 1, 1,
-0.9340194, -0.338457, -2.137858, 1, 1, 1, 1, 1,
-0.9332112, -0.8225249, -3.94453, 1, 1, 1, 1, 1,
-0.9287084, 0.9165717, -0.4099908, 1, 1, 1, 1, 1,
-0.9241259, -1.133691, -1.054419, 1, 1, 1, 1, 1,
-0.9223399, 0.7631573, -0.9492524, 1, 1, 1, 1, 1,
-0.9208248, 1.23409, -1.926214, 1, 1, 1, 1, 1,
-0.9203611, 0.7176976, 0.1355415, 1, 1, 1, 1, 1,
-0.9183042, -0.667522, -2.712189, 1, 1, 1, 1, 1,
-0.9162477, 1.388525, -0.7240628, 1, 1, 1, 1, 1,
-0.9120564, -0.3597655, -2.544133, 0, 0, 1, 1, 1,
-0.910628, -0.2719404, -1.917777, 1, 0, 0, 1, 1,
-0.9039035, 1.2229, -1.626257, 1, 0, 0, 1, 1,
-0.9020747, 0.6800372, -1.409632, 1, 0, 0, 1, 1,
-0.8971751, 0.08745107, -1.981007, 1, 0, 0, 1, 1,
-0.8955407, 1.817813, -0.3632069, 1, 0, 0, 1, 1,
-0.8875574, -0.1192637, -0.1963603, 0, 0, 0, 1, 1,
-0.8863932, 1.451974, 0.3010441, 0, 0, 0, 1, 1,
-0.8801577, -0.2567591, -1.176829, 0, 0, 0, 1, 1,
-0.8783972, -0.692611, -2.642108, 0, 0, 0, 1, 1,
-0.8751703, -0.4929589, -1.842004, 0, 0, 0, 1, 1,
-0.8671729, -2.358849, -3.512268, 0, 0, 0, 1, 1,
-0.861182, -0.05984325, -1.2215, 0, 0, 0, 1, 1,
-0.8567988, 1.644178, 0.9711036, 1, 1, 1, 1, 1,
-0.8527328, -0.03253921, -1.168052, 1, 1, 1, 1, 1,
-0.8482635, 0.7470694, -0.3141301, 1, 1, 1, 1, 1,
-0.841809, 0.1388039, -2.798667, 1, 1, 1, 1, 1,
-0.8380411, 1.93305, 0.3684633, 1, 1, 1, 1, 1,
-0.837935, -1.865296, -2.886984, 1, 1, 1, 1, 1,
-0.8371449, -0.229895, -3.01314, 1, 1, 1, 1, 1,
-0.8302109, 0.8147473, -0.6948223, 1, 1, 1, 1, 1,
-0.8298611, -0.7096416, -2.216348, 1, 1, 1, 1, 1,
-0.8281717, 0.1088158, -0.4188745, 1, 1, 1, 1, 1,
-0.8280789, 1.237343, -1.015881, 1, 1, 1, 1, 1,
-0.8275523, -0.7272469, -0.7428488, 1, 1, 1, 1, 1,
-0.8253638, -1.221254, -1.473695, 1, 1, 1, 1, 1,
-0.8209761, 0.2697124, -1.013251, 1, 1, 1, 1, 1,
-0.8152482, -0.4698753, -1.677799, 1, 1, 1, 1, 1,
-0.815012, -1.355232, -1.513448, 0, 0, 1, 1, 1,
-0.8142966, -0.4317288, -3.894437, 1, 0, 0, 1, 1,
-0.8135864, 0.2082383, -0.5651796, 1, 0, 0, 1, 1,
-0.812556, -0.8343863, -2.809092, 1, 0, 0, 1, 1,
-0.8091295, 0.51943, -1.385957, 1, 0, 0, 1, 1,
-0.8078668, 1.249167, -1.223629, 1, 0, 0, 1, 1,
-0.8023908, 0.9939822, -0.6937131, 0, 0, 0, 1, 1,
-0.800348, -0.3488129, -3.503497, 0, 0, 0, 1, 1,
-0.7923009, -0.1655649, -2.684914, 0, 0, 0, 1, 1,
-0.7902403, 1.011068, -1.265, 0, 0, 0, 1, 1,
-0.7754003, -0.1452923, 0.1821916, 0, 0, 0, 1, 1,
-0.773575, 0.2766488, 0.7357094, 0, 0, 0, 1, 1,
-0.7672084, -0.9553182, -0.5380126, 0, 0, 0, 1, 1,
-0.7655172, -0.8997629, -2.748144, 1, 1, 1, 1, 1,
-0.7637968, -0.881371, -2.502842, 1, 1, 1, 1, 1,
-0.7628917, -1.996937, -3.287458, 1, 1, 1, 1, 1,
-0.7536976, -0.8407447, -1.648288, 1, 1, 1, 1, 1,
-0.7534977, 1.293563, 0.791977, 1, 1, 1, 1, 1,
-0.7507805, -0.2236785, -1.724567, 1, 1, 1, 1, 1,
-0.745604, 1.284648, -0.6006421, 1, 1, 1, 1, 1,
-0.7445418, 0.5956621, -2.312944, 1, 1, 1, 1, 1,
-0.7393309, -0.06043284, -2.174212, 1, 1, 1, 1, 1,
-0.7342441, -0.401472, -3.50745, 1, 1, 1, 1, 1,
-0.7322421, -0.9548954, -1.287838, 1, 1, 1, 1, 1,
-0.7317749, 0.1012826, -2.301357, 1, 1, 1, 1, 1,
-0.7289842, -1.557562, -1.928907, 1, 1, 1, 1, 1,
-0.7285788, -0.913263, -1.8445, 1, 1, 1, 1, 1,
-0.7255459, -1.111617, -2.079805, 1, 1, 1, 1, 1,
-0.7233795, 2.273591, -0.8014001, 0, 0, 1, 1, 1,
-0.7221324, 0.09759696, -1.883705, 1, 0, 0, 1, 1,
-0.7211751, -0.8826258, -4.04529, 1, 0, 0, 1, 1,
-0.7204791, -1.103195, -2.63969, 1, 0, 0, 1, 1,
-0.712191, 1.144949, -1.787872, 1, 0, 0, 1, 1,
-0.7028998, -3.761789, -2.62691, 1, 0, 0, 1, 1,
-0.7002285, 0.08268125, -1.835991, 0, 0, 0, 1, 1,
-0.6960832, 0.308324, -0.5238244, 0, 0, 0, 1, 1,
-0.6946465, -0.04663089, -0.6590105, 0, 0, 0, 1, 1,
-0.6938393, 0.06311624, 0.3924245, 0, 0, 0, 1, 1,
-0.6850631, 2.455793, -0.6527665, 0, 0, 0, 1, 1,
-0.6826257, 1.165193, -0.3925165, 0, 0, 0, 1, 1,
-0.6799131, 0.2921652, 1.610984, 0, 0, 0, 1, 1,
-0.6785405, 0.6567917, 0.4542187, 1, 1, 1, 1, 1,
-0.6783605, -1.468967, -3.392194, 1, 1, 1, 1, 1,
-0.6781415, 1.164078, -0.4141797, 1, 1, 1, 1, 1,
-0.6711338, 0.306607, -1.531801, 1, 1, 1, 1, 1,
-0.6699969, 0.563348, -0.8862559, 1, 1, 1, 1, 1,
-0.6602527, 0.3970245, -1.830304, 1, 1, 1, 1, 1,
-0.659026, -0.3998289, -1.425468, 1, 1, 1, 1, 1,
-0.6513318, -0.289823, -1.738725, 1, 1, 1, 1, 1,
-0.6398195, 2.678641, -0.4561121, 1, 1, 1, 1, 1,
-0.6366223, 0.596346, -1.20408, 1, 1, 1, 1, 1,
-0.635552, 1.16366, -0.7635754, 1, 1, 1, 1, 1,
-0.6354825, -0.96307, -1.942445, 1, 1, 1, 1, 1,
-0.6290571, -0.7859169, -2.024279, 1, 1, 1, 1, 1,
-0.6289912, -0.2053592, -2.717613, 1, 1, 1, 1, 1,
-0.6202501, 2.088041, -0.3575934, 1, 1, 1, 1, 1,
-0.6176897, -2.360777, -1.200991, 0, 0, 1, 1, 1,
-0.6160082, 1.061458, 0.2538956, 1, 0, 0, 1, 1,
-0.6143684, 0.5220599, -1.204537, 1, 0, 0, 1, 1,
-0.6103398, 1.687151, -0.7278216, 1, 0, 0, 1, 1,
-0.6097997, -0.4792911, -3.396646, 1, 0, 0, 1, 1,
-0.6058976, 0.2869228, -2.25924, 1, 0, 0, 1, 1,
-0.5981604, 0.3106901, -2.324449, 0, 0, 0, 1, 1,
-0.5947798, -0.1434546, -1.079228, 0, 0, 0, 1, 1,
-0.5918677, 0.1466321, -0.3227918, 0, 0, 0, 1, 1,
-0.5904685, -0.3229631, -2.720007, 0, 0, 0, 1, 1,
-0.5898806, -0.3146965, -3.619013, 0, 0, 0, 1, 1,
-0.5822319, -0.893765, -2.689462, 0, 0, 0, 1, 1,
-0.5818193, -1.415287, -2.872513, 0, 0, 0, 1, 1,
-0.580494, -0.7466878, -3.445197, 1, 1, 1, 1, 1,
-0.5763969, 0.1406143, -0.4430976, 1, 1, 1, 1, 1,
-0.5762942, -1.220201, -1.873754, 1, 1, 1, 1, 1,
-0.5748404, -0.2566641, -2.618822, 1, 1, 1, 1, 1,
-0.5711734, 0.5887508, -1.505333, 1, 1, 1, 1, 1,
-0.5568529, -0.04075727, -0.1503997, 1, 1, 1, 1, 1,
-0.5532045, -2.288231, -4.294616, 1, 1, 1, 1, 1,
-0.5501189, 0.6202263, 0.8250366, 1, 1, 1, 1, 1,
-0.5490574, -0.04412261, -1.030228, 1, 1, 1, 1, 1,
-0.5480969, -0.3946956, -0.8817897, 1, 1, 1, 1, 1,
-0.5477461, 0.588834, 0.02139232, 1, 1, 1, 1, 1,
-0.5475171, -1.044785, -2.043605, 1, 1, 1, 1, 1,
-0.546816, 1.916035, -0.04524885, 1, 1, 1, 1, 1,
-0.5442964, -1.122683, -4.480889, 1, 1, 1, 1, 1,
-0.5436931, 0.9482787, 0.281336, 1, 1, 1, 1, 1,
-0.5418288, 1.469214, 1.264165, 0, 0, 1, 1, 1,
-0.5389744, 1.137643, 0.8041752, 1, 0, 0, 1, 1,
-0.5311695, -1.347012, -3.047764, 1, 0, 0, 1, 1,
-0.5269083, -0.9255576, -2.114686, 1, 0, 0, 1, 1,
-0.5256529, -0.8010927, -1.325815, 1, 0, 0, 1, 1,
-0.5254765, -0.5479591, -0.5037588, 1, 0, 0, 1, 1,
-0.519676, 0.3874189, -0.718636, 0, 0, 0, 1, 1,
-0.5195186, -0.2614101, -3.637628, 0, 0, 0, 1, 1,
-0.5184709, 0.5735636, 0.3737943, 0, 0, 0, 1, 1,
-0.5184467, 1.347371, -1.70685, 0, 0, 0, 1, 1,
-0.5143852, 1.624602, 0.04283762, 0, 0, 0, 1, 1,
-0.5135041, 0.9544203, -2.246187, 0, 0, 0, 1, 1,
-0.5110423, 0.2539357, -1.169247, 0, 0, 0, 1, 1,
-0.5110281, -0.7323697, -3.628746, 1, 1, 1, 1, 1,
-0.5106908, 0.7244307, 0.3718408, 1, 1, 1, 1, 1,
-0.5103394, 0.6950702, 0.03395736, 1, 1, 1, 1, 1,
-0.5015664, 0.2964878, -1.935943, 1, 1, 1, 1, 1,
-0.4997332, 1.350951, -0.1309197, 1, 1, 1, 1, 1,
-0.4983577, -0.394647, -1.589325, 1, 1, 1, 1, 1,
-0.4961722, -0.04433435, -0.549275, 1, 1, 1, 1, 1,
-0.4960752, 0.5555627, -0.8877498, 1, 1, 1, 1, 1,
-0.4931007, -1.470977, -2.544667, 1, 1, 1, 1, 1,
-0.4922244, -0.2379063, -3.519189, 1, 1, 1, 1, 1,
-0.4897485, 1.001882, 0.224699, 1, 1, 1, 1, 1,
-0.4864744, 0.2560254, 0.02524926, 1, 1, 1, 1, 1,
-0.4852845, -1.394013, -3.34958, 1, 1, 1, 1, 1,
-0.4830511, -0.78431, -3.015681, 1, 1, 1, 1, 1,
-0.4821013, 0.5596575, -1.194945, 1, 1, 1, 1, 1,
-0.4776358, -1.329631, -2.958977, 0, 0, 1, 1, 1,
-0.4737743, -0.02882469, -1.617714, 1, 0, 0, 1, 1,
-0.4733733, 0.6749282, -1.351924, 1, 0, 0, 1, 1,
-0.4722009, 0.9999683, 0.4507162, 1, 0, 0, 1, 1,
-0.4718059, -0.4805257, -2.323737, 1, 0, 0, 1, 1,
-0.4585108, -0.2278424, -1.909894, 1, 0, 0, 1, 1,
-0.4583693, -0.6605713, -3.168904, 0, 0, 0, 1, 1,
-0.4538035, 0.8556284, 0.4451889, 0, 0, 0, 1, 1,
-0.4423575, -0.621265, -2.470175, 0, 0, 0, 1, 1,
-0.4380438, -0.766109, -1.87478, 0, 0, 0, 1, 1,
-0.4370458, 0.3883546, 0.5857748, 0, 0, 0, 1, 1,
-0.4314732, 0.8678473, -0.6922886, 0, 0, 0, 1, 1,
-0.4242047, 1.598699, 0.7859389, 0, 0, 0, 1, 1,
-0.4237708, 0.05140752, -0.8785784, 1, 1, 1, 1, 1,
-0.4237419, 1.635083, -0.3690845, 1, 1, 1, 1, 1,
-0.4153284, -0.05979876, 0.2544342, 1, 1, 1, 1, 1,
-0.4142388, -2.055969, -2.09578, 1, 1, 1, 1, 1,
-0.4082224, -1.543884, -3.739676, 1, 1, 1, 1, 1,
-0.399476, 0.7339945, -1.008447, 1, 1, 1, 1, 1,
-0.3974326, 0.6130332, -0.5988426, 1, 1, 1, 1, 1,
-0.3973919, 0.03192076, -0.6391126, 1, 1, 1, 1, 1,
-0.3951865, -0.3857267, -3.255774, 1, 1, 1, 1, 1,
-0.3934864, -0.3362707, -3.633717, 1, 1, 1, 1, 1,
-0.3896703, -1.065198, -2.92845, 1, 1, 1, 1, 1,
-0.3834049, 2.84086, 0.5634478, 1, 1, 1, 1, 1,
-0.379446, 2.215669, -0.4537569, 1, 1, 1, 1, 1,
-0.3783879, -0.3827758, -2.309903, 1, 1, 1, 1, 1,
-0.3781252, -0.3918036, -2.808432, 1, 1, 1, 1, 1,
-0.3747109, -0.2255373, -0.8187895, 0, 0, 1, 1, 1,
-0.373302, 1.416894, -0.2976398, 1, 0, 0, 1, 1,
-0.3714778, 0.05909541, -0.1267578, 1, 0, 0, 1, 1,
-0.3654424, -1.698212, -2.478254, 1, 0, 0, 1, 1,
-0.3596003, 0.02768378, -0.8755522, 1, 0, 0, 1, 1,
-0.3536648, -0.5715747, -3.008762, 1, 0, 0, 1, 1,
-0.3523368, 0.4344701, -1.162496, 0, 0, 0, 1, 1,
-0.3520467, -0.4586142, -2.693011, 0, 0, 0, 1, 1,
-0.3511849, -0.7577651, -4.878922, 0, 0, 0, 1, 1,
-0.3480665, 0.4205718, -0.9176158, 0, 0, 0, 1, 1,
-0.3476983, 0.5817232, 0.5226933, 0, 0, 0, 1, 1,
-0.3425736, -0.4737389, -3.537566, 0, 0, 0, 1, 1,
-0.3274647, 1.452016, -0.4586098, 0, 0, 0, 1, 1,
-0.3265463, 0.1945791, -1.898823, 1, 1, 1, 1, 1,
-0.3258809, 1.180118, -1.435469, 1, 1, 1, 1, 1,
-0.3239073, 0.02907136, -1.366035, 1, 1, 1, 1, 1,
-0.3219036, 2.27632, -0.2428799, 1, 1, 1, 1, 1,
-0.3180722, -0.5008259, -1.224663, 1, 1, 1, 1, 1,
-0.3179079, 1.576287, 0.06448354, 1, 1, 1, 1, 1,
-0.3157403, 0.07220467, -1.938022, 1, 1, 1, 1, 1,
-0.3080181, -0.2194309, -2.567395, 1, 1, 1, 1, 1,
-0.3030754, -1.455116, -4.020386, 1, 1, 1, 1, 1,
-0.2968546, -0.07543097, -0.176754, 1, 1, 1, 1, 1,
-0.2912229, 0.6333169, -0.6503353, 1, 1, 1, 1, 1,
-0.2911719, -0.4839545, -3.205472, 1, 1, 1, 1, 1,
-0.2871273, -0.2548646, -1.221251, 1, 1, 1, 1, 1,
-0.2866514, -0.693941, -3.21397, 1, 1, 1, 1, 1,
-0.2863582, 0.3010459, 0.002276439, 1, 1, 1, 1, 1,
-0.276892, -0.6807126, -2.43293, 0, 0, 1, 1, 1,
-0.2713659, -0.3573813, -3.727152, 1, 0, 0, 1, 1,
-0.2635715, 1.246577, -1.049947, 1, 0, 0, 1, 1,
-0.2538673, 0.6560171, 0.528257, 1, 0, 0, 1, 1,
-0.2495847, -0.2928329, -2.631764, 1, 0, 0, 1, 1,
-0.245702, -0.7073879, -3.507859, 1, 0, 0, 1, 1,
-0.243476, -1.242981, -2.992376, 0, 0, 0, 1, 1,
-0.2417327, -1.116835, -3.030409, 0, 0, 0, 1, 1,
-0.2391074, -0.3197379, -1.238078, 0, 0, 0, 1, 1,
-0.236623, 0.5471911, -0.8806594, 0, 0, 0, 1, 1,
-0.2353674, 0.6679615, 0.3523679, 0, 0, 0, 1, 1,
-0.23433, 0.2401207, -0.544567, 0, 0, 0, 1, 1,
-0.233939, 0.6846249, 0.3220077, 0, 0, 0, 1, 1,
-0.2316717, 0.02211806, -1.166809, 1, 1, 1, 1, 1,
-0.230981, -0.494213, -1.661312, 1, 1, 1, 1, 1,
-0.2296494, -0.8019125, -1.362582, 1, 1, 1, 1, 1,
-0.2191805, 0.8300288, 1.854639, 1, 1, 1, 1, 1,
-0.2159517, -0.69516, -2.496617, 1, 1, 1, 1, 1,
-0.2155761, 1.208861, -1.229126, 1, 1, 1, 1, 1,
-0.2092181, 0.4799867, 0.2197751, 1, 1, 1, 1, 1,
-0.2080392, 0.3053274, 0.9534017, 1, 1, 1, 1, 1,
-0.2077091, 0.5246771, 0.6217581, 1, 1, 1, 1, 1,
-0.2004998, 0.1662118, -2.866308, 1, 1, 1, 1, 1,
-0.1978707, -1.212999, -1.217942, 1, 1, 1, 1, 1,
-0.1912359, 0.3033384, 0.6043969, 1, 1, 1, 1, 1,
-0.1886461, 0.9804515, -1.29424, 1, 1, 1, 1, 1,
-0.1861615, 0.5677451, 0.7415427, 1, 1, 1, 1, 1,
-0.1822018, -0.2710112, -1.532789, 1, 1, 1, 1, 1,
-0.1792599, -1.041576, -2.88116, 0, 0, 1, 1, 1,
-0.1772627, 0.3982401, -1.724504, 1, 0, 0, 1, 1,
-0.173849, 0.9775761, 1.004225, 1, 0, 0, 1, 1,
-0.171223, 0.1726022, 0.2191228, 1, 0, 0, 1, 1,
-0.171079, -0.2014598, -3.172959, 1, 0, 0, 1, 1,
-0.1678895, -0.5661896, -2.195103, 1, 0, 0, 1, 1,
-0.1638154, -0.5108026, -1.775161, 0, 0, 0, 1, 1,
-0.1581907, 0.7074912, 0.5233516, 0, 0, 0, 1, 1,
-0.1523768, -0.1833981, -3.760675, 0, 0, 0, 1, 1,
-0.1514025, -1.156212, -3.778798, 0, 0, 0, 1, 1,
-0.1492047, -0.1193723, 0.1236138, 0, 0, 0, 1, 1,
-0.1490992, 1.327083, 0.9081957, 0, 0, 0, 1, 1,
-0.1465559, 1.519732, 0.2581694, 0, 0, 0, 1, 1,
-0.1417434, 1.508655, -2.091983, 1, 1, 1, 1, 1,
-0.1401751, 0.9047723, -0.891517, 1, 1, 1, 1, 1,
-0.1369515, -1.611691, -2.530904, 1, 1, 1, 1, 1,
-0.1342202, -1.345802, -2.836286, 1, 1, 1, 1, 1,
-0.1329008, 1.730209, 0.8750009, 1, 1, 1, 1, 1,
-0.1323445, 0.4105498, -2.007743, 1, 1, 1, 1, 1,
-0.130155, 0.9882492, -1.140737, 1, 1, 1, 1, 1,
-0.1273514, -0.234564, -2.771337, 1, 1, 1, 1, 1,
-0.1257055, -0.7318661, -2.310109, 1, 1, 1, 1, 1,
-0.1246522, 0.8629278, -0.4218866, 1, 1, 1, 1, 1,
-0.1230345, 1.007612, -2.128094, 1, 1, 1, 1, 1,
-0.1177329, -1.751411, -2.150919, 1, 1, 1, 1, 1,
-0.116807, 1.790099, -1.198003, 1, 1, 1, 1, 1,
-0.1153808, 2.037714, 0.7777004, 1, 1, 1, 1, 1,
-0.1147869, -1.502081, -5.25223, 1, 1, 1, 1, 1,
-0.1131982, 0.4505575, 1.400699, 0, 0, 1, 1, 1,
-0.1050804, 0.6453812, 0.7232733, 1, 0, 0, 1, 1,
-0.1044008, -0.6895775, -1.899925, 1, 0, 0, 1, 1,
-0.098974, 0.6179174, 1.266561, 1, 0, 0, 1, 1,
-0.09686175, -0.7014503, -3.04939, 1, 0, 0, 1, 1,
-0.09472014, -0.358375, -3.442854, 1, 0, 0, 1, 1,
-0.09333798, 0.8860542, -0.269915, 0, 0, 0, 1, 1,
-0.09216825, -0.3341441, -1.905787, 0, 0, 0, 1, 1,
-0.09175401, 0.6836609, -0.3472624, 0, 0, 0, 1, 1,
-0.09088523, 1.25469, -0.3882982, 0, 0, 0, 1, 1,
-0.08354445, 0.09418967, -0.6942874, 0, 0, 0, 1, 1,
-0.07934617, 2.330664, -0.627654, 0, 0, 0, 1, 1,
-0.06865843, -1.849387, -3.990144, 0, 0, 0, 1, 1,
-0.0677688, 0.02566476, -1.719266, 1, 1, 1, 1, 1,
-0.06734426, 1.11072, -0.7138935, 1, 1, 1, 1, 1,
-0.05793607, -2.621909, -4.895972, 1, 1, 1, 1, 1,
-0.05252725, -0.1981953, -4.076867, 1, 1, 1, 1, 1,
-0.05240308, 0.6941273, -1.523492, 1, 1, 1, 1, 1,
-0.05218446, 1.434706, -2.331976, 1, 1, 1, 1, 1,
-0.05048503, -0.8865995, -4.559306, 1, 1, 1, 1, 1,
-0.04934385, -0.53615, -2.256054, 1, 1, 1, 1, 1,
-0.04903795, 0.5378966, 0.3493853, 1, 1, 1, 1, 1,
-0.04757342, -0.9750094, -2.884825, 1, 1, 1, 1, 1,
-0.04244875, -0.7882278, -4.063288, 1, 1, 1, 1, 1,
-0.04236756, -1.809737, -5.18475, 1, 1, 1, 1, 1,
-0.04077775, -1.657153, -1.204148, 1, 1, 1, 1, 1,
-0.04000313, 1.612, -1.1172, 1, 1, 1, 1, 1,
-0.03950673, -0.515211, -4.613984, 1, 1, 1, 1, 1,
-0.03614763, 1.858444, 1.024522, 0, 0, 1, 1, 1,
-0.03307242, -0.6137521, -3.204062, 1, 0, 0, 1, 1,
-0.02543341, -1.21667, -3.489036, 1, 0, 0, 1, 1,
-0.02249251, -0.4938809, -3.688507, 1, 0, 0, 1, 1,
-0.02164809, -0.1445437, -3.19011, 1, 0, 0, 1, 1,
-0.02026085, 0.8103476, 0.4187737, 1, 0, 0, 1, 1,
-0.02005926, -0.3017618, -3.209272, 0, 0, 0, 1, 1,
-0.0198352, -0.8925032, -3.429812, 0, 0, 0, 1, 1,
-0.01429242, -0.809503, -3.543746, 0, 0, 0, 1, 1,
-0.01138169, -0.8974974, -3.749308, 0, 0, 0, 1, 1,
-0.007010987, 0.9611241, 1.990677, 0, 0, 0, 1, 1,
-0.005771928, 0.3618949, 1.172149, 0, 0, 0, 1, 1,
-0.001459021, 0.9599403, -0.02719544, 0, 0, 0, 1, 1,
0.003457301, -0.8511148, 1.714387, 1, 1, 1, 1, 1,
0.004359435, 0.7708829, -0.1884805, 1, 1, 1, 1, 1,
0.005759028, 0.05391521, -0.5476227, 1, 1, 1, 1, 1,
0.008392059, 0.08016276, 1.156828, 1, 1, 1, 1, 1,
0.011129, 0.4165415, 0.1901541, 1, 1, 1, 1, 1,
0.01165483, 0.3664698, -1.090286, 1, 1, 1, 1, 1,
0.01784077, 0.8326645, -1.672595, 1, 1, 1, 1, 1,
0.0270454, -0.9689109, 3.749514, 1, 1, 1, 1, 1,
0.02870589, 1.304624, 0.3442261, 1, 1, 1, 1, 1,
0.02957209, 0.7738933, 0.5965428, 1, 1, 1, 1, 1,
0.03083471, 0.1907106, -0.1372284, 1, 1, 1, 1, 1,
0.03538544, -0.2513352, 2.731708, 1, 1, 1, 1, 1,
0.03700647, 0.6095172, -1.123358, 1, 1, 1, 1, 1,
0.03968678, -0.8322774, 2.495528, 1, 1, 1, 1, 1,
0.04064003, 2.410089, -0.1413939, 1, 1, 1, 1, 1,
0.04348611, -0.7779604, 2.601572, 0, 0, 1, 1, 1,
0.04540866, 1.244103, 0.9433382, 1, 0, 0, 1, 1,
0.04604648, -1.351466, 3.289947, 1, 0, 0, 1, 1,
0.04621959, -0.4533904, 2.611754, 1, 0, 0, 1, 1,
0.04821272, -0.1940404, 2.469684, 1, 0, 0, 1, 1,
0.04848978, 0.7108226, 0.5846503, 1, 0, 0, 1, 1,
0.04900329, 0.3514448, -0.9758297, 0, 0, 0, 1, 1,
0.05265715, 0.9031341, 0.8452866, 0, 0, 0, 1, 1,
0.05346711, 0.564131, -0.3152017, 0, 0, 0, 1, 1,
0.05364486, 0.6884608, 0.509728, 0, 0, 0, 1, 1,
0.05385755, 0.4509112, 0.6567558, 0, 0, 0, 1, 1,
0.05903988, 0.07585585, 1.971131, 0, 0, 0, 1, 1,
0.05970735, -1.057626, 4.139789, 0, 0, 0, 1, 1,
0.06173439, 1.004996, -0.8377647, 1, 1, 1, 1, 1,
0.06174723, 0.4293978, -1.015456, 1, 1, 1, 1, 1,
0.06229463, -0.7166736, 2.819406, 1, 1, 1, 1, 1,
0.0678865, 0.7911563, 1.677501, 1, 1, 1, 1, 1,
0.06814027, 0.9349079, 0.6140879, 1, 1, 1, 1, 1,
0.07318449, -0.5080643, 3.72605, 1, 1, 1, 1, 1,
0.08049241, -0.7755939, 2.667555, 1, 1, 1, 1, 1,
0.08113308, -0.07916836, 2.471718, 1, 1, 1, 1, 1,
0.0822532, -0.6504329, 3.490448, 1, 1, 1, 1, 1,
0.08336789, -0.0126868, 0.8784214, 1, 1, 1, 1, 1,
0.08356962, 1.039084, 0.3801808, 1, 1, 1, 1, 1,
0.0842187, 2.910807, -0.2942426, 1, 1, 1, 1, 1,
0.08493418, -1.391615, 2.568595, 1, 1, 1, 1, 1,
0.08552872, 1.050616, -1.215936, 1, 1, 1, 1, 1,
0.08840508, -1.018716, 4.186461, 1, 1, 1, 1, 1,
0.08952888, -1.568514, 2.858805, 0, 0, 1, 1, 1,
0.09435451, -0.2438433, 1.753518, 1, 0, 0, 1, 1,
0.09680984, -0.8478026, 4.811926, 1, 0, 0, 1, 1,
0.09861863, -0.4178504, 2.624161, 1, 0, 0, 1, 1,
0.09923059, 0.4635003, -0.02664928, 1, 0, 0, 1, 1,
0.1057586, 0.03149366, 0.6856512, 1, 0, 0, 1, 1,
0.1074516, -0.2751839, 2.819406, 0, 0, 0, 1, 1,
0.1098366, -0.8577021, 3.319115, 0, 0, 0, 1, 1,
0.112077, -1.638923, 3.310156, 0, 0, 0, 1, 1,
0.1157835, -1.121898, 2.984128, 0, 0, 0, 1, 1,
0.118921, -0.897381, 3.373057, 0, 0, 0, 1, 1,
0.1201403, 0.5593093, 1.513836, 0, 0, 0, 1, 1,
0.127546, 0.8588775, 0.1699702, 0, 0, 0, 1, 1,
0.1296038, -0.357236, 2.477782, 1, 1, 1, 1, 1,
0.1303058, 1.094569, 1.255893, 1, 1, 1, 1, 1,
0.1359386, -1.023626, 3.470069, 1, 1, 1, 1, 1,
0.1362511, -0.04715496, 0.9243506, 1, 1, 1, 1, 1,
0.1400109, -1.375531, 1.711777, 1, 1, 1, 1, 1,
0.1401509, 1.4805, 1.186749, 1, 1, 1, 1, 1,
0.1415491, 0.01858761, -0.05125987, 1, 1, 1, 1, 1,
0.1454578, 1.166586, 0.3081914, 1, 1, 1, 1, 1,
0.1532448, 0.123335, -0.7573011, 1, 1, 1, 1, 1,
0.155286, -0.6898024, 3.489853, 1, 1, 1, 1, 1,
0.1566381, 1.309398, -1.240666, 1, 1, 1, 1, 1,
0.1575061, -0.8085849, 3.658878, 1, 1, 1, 1, 1,
0.159276, -1.160814, 1.286055, 1, 1, 1, 1, 1,
0.1593773, 1.101195, -0.6205072, 1, 1, 1, 1, 1,
0.1653958, 0.3315238, 0.03814446, 1, 1, 1, 1, 1,
0.1689194, -1.38918, 2.639625, 0, 0, 1, 1, 1,
0.1716962, 0.07933593, 1.918715, 1, 0, 0, 1, 1,
0.1749769, -0.1601, 1.609032, 1, 0, 0, 1, 1,
0.1756496, 0.05940013, 0.7931321, 1, 0, 0, 1, 1,
0.1764096, -0.6990018, 2.360295, 1, 0, 0, 1, 1,
0.1918473, -0.3309933, 1.324695, 1, 0, 0, 1, 1,
0.1925822, 0.3063836, 0.3618019, 0, 0, 0, 1, 1,
0.1938819, 0.9580182, -0.2189319, 0, 0, 0, 1, 1,
0.2021235, -0.3412084, 2.925412, 0, 0, 0, 1, 1,
0.2037403, -2.225829, 3.97663, 0, 0, 0, 1, 1,
0.2065737, 1.488587, 0.2513506, 0, 0, 0, 1, 1,
0.2078185, 1.433914, -0.3475922, 0, 0, 0, 1, 1,
0.2089913, 0.431958, 1.241389, 0, 0, 0, 1, 1,
0.2139727, -0.6349095, 2.345635, 1, 1, 1, 1, 1,
0.2154139, 0.6526759, 0.5111589, 1, 1, 1, 1, 1,
0.2276231, 1.656442, -0.9346228, 1, 1, 1, 1, 1,
0.2279473, -0.3057292, 2.181164, 1, 1, 1, 1, 1,
0.2316834, 1.175674, 1.508632, 1, 1, 1, 1, 1,
0.2318103, -0.9887245, 3.388748, 1, 1, 1, 1, 1,
0.2323043, 0.1279773, 1.023923, 1, 1, 1, 1, 1,
0.232643, -0.8686272, 4.277127, 1, 1, 1, 1, 1,
0.2332053, 0.8349406, 0.8669187, 1, 1, 1, 1, 1,
0.234761, -0.9469025, 0.6640329, 1, 1, 1, 1, 1,
0.2349043, 0.1177527, 0.9536109, 1, 1, 1, 1, 1,
0.2386324, -0.9444555, 1.049067, 1, 1, 1, 1, 1,
0.2389182, 0.08469694, 1.43066, 1, 1, 1, 1, 1,
0.2428001, -1.459197, 0.448354, 1, 1, 1, 1, 1,
0.2440207, -0.9033028, 0.9619116, 1, 1, 1, 1, 1,
0.245456, -1.140888, 3.778139, 0, 0, 1, 1, 1,
0.2515927, 0.3846909, 0.06776178, 1, 0, 0, 1, 1,
0.2522675, 0.2159314, -0.8381275, 1, 0, 0, 1, 1,
0.2592932, 1.00628, -0.9614947, 1, 0, 0, 1, 1,
0.2594697, -0.7134043, 3.298991, 1, 0, 0, 1, 1,
0.2617648, 0.8558356, 0.231451, 1, 0, 0, 1, 1,
0.2763934, -0.2301083, 0.1117971, 0, 0, 0, 1, 1,
0.2799302, -1.334242, 3.080302, 0, 0, 0, 1, 1,
0.281316, 0.6871612, 1.048709, 0, 0, 0, 1, 1,
0.2899941, -0.9818389, 2.650203, 0, 0, 0, 1, 1,
0.2929128, -0.9700345, 3.5029, 0, 0, 0, 1, 1,
0.2952799, -0.5651404, 2.017646, 0, 0, 0, 1, 1,
0.2969198, -0.3614756, 4.845787, 0, 0, 0, 1, 1,
0.2977959, -0.7120228, 2.169286, 1, 1, 1, 1, 1,
0.299918, 0.013623, 2.50366, 1, 1, 1, 1, 1,
0.3030445, -0.6141078, 3.080747, 1, 1, 1, 1, 1,
0.3073501, -0.6845087, 1.84425, 1, 1, 1, 1, 1,
0.3145669, 0.2051791, 0.8323988, 1, 1, 1, 1, 1,
0.3175348, -1.06476, 2.94571, 1, 1, 1, 1, 1,
0.3212439, -0.2260626, 2.694081, 1, 1, 1, 1, 1,
0.3221661, -2.105224, 2.727096, 1, 1, 1, 1, 1,
0.3232191, 0.4497275, 0.2730292, 1, 1, 1, 1, 1,
0.3233593, -1.468126, 5.641954, 1, 1, 1, 1, 1,
0.325619, -0.07514782, 1.860553, 1, 1, 1, 1, 1,
0.3280132, 0.606259, 0.3323657, 1, 1, 1, 1, 1,
0.3295361, 1.048696, -0.8863217, 1, 1, 1, 1, 1,
0.331064, 0.1178386, 0.9884201, 1, 1, 1, 1, 1,
0.3319424, 0.09327894, 2.353898, 1, 1, 1, 1, 1,
0.3338248, 0.5872912, -0.1734677, 0, 0, 1, 1, 1,
0.334193, 1.422151, 0.4497941, 1, 0, 0, 1, 1,
0.3349521, -0.9466527, 2.517907, 1, 0, 0, 1, 1,
0.3355803, -1.951523, 3.455566, 1, 0, 0, 1, 1,
0.3375875, 0.7609234, -1.02532, 1, 0, 0, 1, 1,
0.341066, -0.2719893, 2.916406, 1, 0, 0, 1, 1,
0.3436826, 1.61853, -0.1749146, 0, 0, 0, 1, 1,
0.3445604, 0.9589726, 0.2741222, 0, 0, 0, 1, 1,
0.3494929, -1.256951, 2.793817, 0, 0, 0, 1, 1,
0.3508481, 0.219298, 1.763255, 0, 0, 0, 1, 1,
0.3531836, 0.04450789, 0.2627121, 0, 0, 0, 1, 1,
0.3544478, -0.5168094, 1.640472, 0, 0, 0, 1, 1,
0.3545437, -0.3901237, 2.472539, 0, 0, 0, 1, 1,
0.3569639, -0.1581297, 2.638046, 1, 1, 1, 1, 1,
0.3572493, -0.114303, 1.075223, 1, 1, 1, 1, 1,
0.35942, -0.7810031, 2.32606, 1, 1, 1, 1, 1,
0.3607613, -1.866865, 1.549163, 1, 1, 1, 1, 1,
0.3609629, -1.442904, 3.093308, 1, 1, 1, 1, 1,
0.3625236, 1.744555, -0.6139529, 1, 1, 1, 1, 1,
0.365063, -1.271096, 2.49449, 1, 1, 1, 1, 1,
0.3696777, -0.4412263, 3.2929, 1, 1, 1, 1, 1,
0.3729744, -0.2873958, 1.884, 1, 1, 1, 1, 1,
0.3742359, -1.252351, 2.094102, 1, 1, 1, 1, 1,
0.380443, 0.07421876, 1.76971, 1, 1, 1, 1, 1,
0.382992, -0.4527052, 2.665875, 1, 1, 1, 1, 1,
0.3850613, 0.4808735, -0.5706357, 1, 1, 1, 1, 1,
0.3854184, 0.4726532, -0.5826692, 1, 1, 1, 1, 1,
0.3872097, -0.6065968, 2.96799, 1, 1, 1, 1, 1,
0.3897361, -1.094522, 3.849484, 0, 0, 1, 1, 1,
0.3922081, 0.01546886, 1.943508, 1, 0, 0, 1, 1,
0.392942, 1.494856, -0.7458506, 1, 0, 0, 1, 1,
0.3946539, 0.7126877, 2.000517, 1, 0, 0, 1, 1,
0.4041193, -0.189322, 3.600054, 1, 0, 0, 1, 1,
0.4041477, -0.9052158, 1.395248, 1, 0, 0, 1, 1,
0.4069677, 0.2006932, 0.2104881, 0, 0, 0, 1, 1,
0.4122267, 0.5690702, 0.7642428, 0, 0, 0, 1, 1,
0.4143165, 0.4580561, 1.192478, 0, 0, 0, 1, 1,
0.4143218, 0.6536791, 2.530136, 0, 0, 0, 1, 1,
0.4162249, -0.3374772, 1.621003, 0, 0, 0, 1, 1,
0.4221077, -1.347709, 4.880215, 0, 0, 0, 1, 1,
0.4244758, 1.294435, 0.06510604, 0, 0, 0, 1, 1,
0.4251164, 0.6678599, 2.188914, 1, 1, 1, 1, 1,
0.4266002, 0.1430664, 1.004538, 1, 1, 1, 1, 1,
0.42669, -1.39844, 3.163306, 1, 1, 1, 1, 1,
0.4318141, 0.1952651, -0.5567778, 1, 1, 1, 1, 1,
0.4320644, -0.9369314, 2.674526, 1, 1, 1, 1, 1,
0.43232, -0.8186038, 3.098959, 1, 1, 1, 1, 1,
0.4339231, 0.5865492, 0.6005324, 1, 1, 1, 1, 1,
0.4382399, 0.3498205, 1.434887, 1, 1, 1, 1, 1,
0.440501, -1.483873, 2.681753, 1, 1, 1, 1, 1,
0.4410098, -0.2665653, 1.160144, 1, 1, 1, 1, 1,
0.4445664, 0.9635466, 1.974593, 1, 1, 1, 1, 1,
0.4478306, -1.310923, 2.08331, 1, 1, 1, 1, 1,
0.4509181, 1.518626, -1.172899, 1, 1, 1, 1, 1,
0.4520709, -1.528678, 2.782039, 1, 1, 1, 1, 1,
0.4530795, 0.1644012, 0.8217113, 1, 1, 1, 1, 1,
0.4572505, -1.694611, 1.47192, 0, 0, 1, 1, 1,
0.4601336, -1.244637, 3.886433, 1, 0, 0, 1, 1,
0.4630923, 0.09397592, 0.5156857, 1, 0, 0, 1, 1,
0.4662388, -0.1623096, -0.2026, 1, 0, 0, 1, 1,
0.4774362, -1.518812, 2.143474, 1, 0, 0, 1, 1,
0.4799866, 2.295163, -0.6146146, 1, 0, 0, 1, 1,
0.4803552, 0.5571737, 1.514932, 0, 0, 0, 1, 1,
0.4820808, 1.743783, 0.9555032, 0, 0, 0, 1, 1,
0.4935252, 0.01783649, 2.547295, 0, 0, 0, 1, 1,
0.495173, -0.07199084, 2.052373, 0, 0, 0, 1, 1,
0.5024125, 1.307775, -0.003957513, 0, 0, 0, 1, 1,
0.5039248, -1.070631, 1.524014, 0, 0, 0, 1, 1,
0.5075519, -0.505335, 2.187146, 0, 0, 0, 1, 1,
0.5141078, 1.171003, -1.076321, 1, 1, 1, 1, 1,
0.5169008, -0.05141933, 1.339197, 1, 1, 1, 1, 1,
0.5184286, -2.102558, 2.875435, 1, 1, 1, 1, 1,
0.5229773, 0.3229787, 1.187161, 1, 1, 1, 1, 1,
0.5277274, 1.702883, -0.9083009, 1, 1, 1, 1, 1,
0.5298494, -0.2569792, 2.463026, 1, 1, 1, 1, 1,
0.5340369, -1.549599, 2.015536, 1, 1, 1, 1, 1,
0.5350746, 0.3232997, 1.902588, 1, 1, 1, 1, 1,
0.5367509, -1.361824, 3.687279, 1, 1, 1, 1, 1,
0.5399141, -1.489038, 3.343535, 1, 1, 1, 1, 1,
0.5409089, -0.3883532, 3.729627, 1, 1, 1, 1, 1,
0.5435546, 2.301694, 0.8110113, 1, 1, 1, 1, 1,
0.5452833, -0.4886401, 2.716675, 1, 1, 1, 1, 1,
0.5473557, 0.1175782, -0.2249423, 1, 1, 1, 1, 1,
0.5505182, 0.9810206, -0.5858308, 1, 1, 1, 1, 1,
0.5523229, 0.7573372, 1.595101, 0, 0, 1, 1, 1,
0.5608931, 1.430868, 1.213839, 1, 0, 0, 1, 1,
0.5626682, 0.7959489, 0.6118499, 1, 0, 0, 1, 1,
0.5648139, 0.8000556, 1.35026, 1, 0, 0, 1, 1,
0.5663282, -0.05219449, 0.7533785, 1, 0, 0, 1, 1,
0.5703807, -0.5475631, 1.977545, 1, 0, 0, 1, 1,
0.5705197, 0.1001136, 2.421499, 0, 0, 0, 1, 1,
0.5707465, -2.253553, -0.05381769, 0, 0, 0, 1, 1,
0.5739949, -1.183469, 2.164653, 0, 0, 0, 1, 1,
0.5876694, -0.6804315, 3.546779, 0, 0, 0, 1, 1,
0.5913697, 0.8345384, 1.735331, 0, 0, 0, 1, 1,
0.5942059, -1.896127, 2.14831, 0, 0, 0, 1, 1,
0.6029599, -0.8185795, 2.4744, 0, 0, 0, 1, 1,
0.6055489, -0.04863162, 1.876012, 1, 1, 1, 1, 1,
0.6059948, 1.243703, 0.11748, 1, 1, 1, 1, 1,
0.6068426, -0.8494244, 1.469887, 1, 1, 1, 1, 1,
0.6082322, 0.006294772, 4.315651, 1, 1, 1, 1, 1,
0.6090103, 0.5095038, 0.01036821, 1, 1, 1, 1, 1,
0.6093733, 0.1036354, 0.6265642, 1, 1, 1, 1, 1,
0.6132508, -0.187673, 3.01755, 1, 1, 1, 1, 1,
0.6188389, -0.1525923, 0.8275797, 1, 1, 1, 1, 1,
0.6249216, 0.5715712, 1.452251, 1, 1, 1, 1, 1,
0.6272547, -0.4282265, 2.778089, 1, 1, 1, 1, 1,
0.6287544, 0.7038029, 1.124933, 1, 1, 1, 1, 1,
0.6287643, 0.05740955, 3.86534, 1, 1, 1, 1, 1,
0.6301979, 0.7362058, -0.6762333, 1, 1, 1, 1, 1,
0.6332988, 1.150566, 0.1022191, 1, 1, 1, 1, 1,
0.6341811, 0.7241373, 2.222106, 1, 1, 1, 1, 1,
0.6378808, -0.3737017, 0.292297, 0, 0, 1, 1, 1,
0.6402541, 0.1938519, 1.601391, 1, 0, 0, 1, 1,
0.6410335, -0.7968007, 2.894602, 1, 0, 0, 1, 1,
0.642734, 0.5588902, 0.5565611, 1, 0, 0, 1, 1,
0.6429592, -0.6184593, 1.024397, 1, 0, 0, 1, 1,
0.6443468, 0.9306895, -0.8416452, 1, 0, 0, 1, 1,
0.6495367, 0.5009515, 0.6453416, 0, 0, 0, 1, 1,
0.6521673, 0.3520634, 2.259356, 0, 0, 0, 1, 1,
0.653618, 1.377792, -3.040733, 0, 0, 0, 1, 1,
0.6574899, 1.026198, 0.7002574, 0, 0, 0, 1, 1,
0.6643195, 0.9965501, -3.065814, 0, 0, 0, 1, 1,
0.6656112, -0.0819165, 1.934828, 0, 0, 0, 1, 1,
0.6674904, 1.71596, 1.659844, 0, 0, 0, 1, 1,
0.6714075, -0.9602913, -0.4820294, 1, 1, 1, 1, 1,
0.6739212, -0.5473893, 2.814455, 1, 1, 1, 1, 1,
0.6774867, 1.188598, 0.8359683, 1, 1, 1, 1, 1,
0.6790374, -1.260833, 3.41128, 1, 1, 1, 1, 1,
0.6826676, 0.0371933, 2.454583, 1, 1, 1, 1, 1,
0.6909096, 0.7857527, -0.5467539, 1, 1, 1, 1, 1,
0.6930061, 0.2715687, 1.329523, 1, 1, 1, 1, 1,
0.6970775, 1.07566, -1.103991, 1, 1, 1, 1, 1,
0.7022067, 0.8038646, 1.279326, 1, 1, 1, 1, 1,
0.7033516, -0.8896191, 3.708489, 1, 1, 1, 1, 1,
0.7120351, 0.8483068, 1.343928, 1, 1, 1, 1, 1,
0.715059, 0.01124134, 1.450313, 1, 1, 1, 1, 1,
0.7157013, 1.026661, -1.585727, 1, 1, 1, 1, 1,
0.7189753, 0.06801428, 2.154163, 1, 1, 1, 1, 1,
0.7213085, 1.820022, 0.9791582, 1, 1, 1, 1, 1,
0.7221349, 0.277415, 1.317742, 0, 0, 1, 1, 1,
0.7231058, -1.161512, 2.407742, 1, 0, 0, 1, 1,
0.7268268, 1.996768, -0.3539663, 1, 0, 0, 1, 1,
0.7280588, 0.3816399, -0.2477171, 1, 0, 0, 1, 1,
0.7400033, 0.8433737, 0.1221557, 1, 0, 0, 1, 1,
0.7432153, 0.2414658, 0.387335, 1, 0, 0, 1, 1,
0.7478422, 1.558687, 0.7504534, 0, 0, 0, 1, 1,
0.7496958, -1.818673, 2.803264, 0, 0, 0, 1, 1,
0.7546622, -0.2974805, 3.6278, 0, 0, 0, 1, 1,
0.7549739, 0.1510496, 1.6193, 0, 0, 0, 1, 1,
0.7620845, 0.1630453, 3.549058, 0, 0, 0, 1, 1,
0.7653123, 0.784366, 0.01607142, 0, 0, 0, 1, 1,
0.7653338, -0.5784046, 3.202846, 0, 0, 0, 1, 1,
0.7656011, -0.2238033, 1.395191, 1, 1, 1, 1, 1,
0.7684529, 0.136327, -0.241205, 1, 1, 1, 1, 1,
0.769096, -0.2649364, 2.97458, 1, 1, 1, 1, 1,
0.7702414, 0.9189298, 0.07605803, 1, 1, 1, 1, 1,
0.7741055, -1.175696, 2.118674, 1, 1, 1, 1, 1,
0.7761943, -1.172001, 2.814782, 1, 1, 1, 1, 1,
0.7778766, 0.4546463, 1.239017, 1, 1, 1, 1, 1,
0.7884107, 1.446021, 0.6909747, 1, 1, 1, 1, 1,
0.7907447, -1.338176, 1.318236, 1, 1, 1, 1, 1,
0.7963297, 0.984584, -0.1334201, 1, 1, 1, 1, 1,
0.7980531, 0.9896693, 0.459118, 1, 1, 1, 1, 1,
0.798234, 1.378928, 0.6679638, 1, 1, 1, 1, 1,
0.8055663, 1.889066, 0.007113164, 1, 1, 1, 1, 1,
0.8100137, -0.4877008, 2.77537, 1, 1, 1, 1, 1,
0.8101087, -0.1752183, 1.031976, 1, 1, 1, 1, 1,
0.8119763, 0.04423714, 2.503851, 0, 0, 1, 1, 1,
0.8136056, -0.2666068, 1.540274, 1, 0, 0, 1, 1,
0.816596, -0.1031238, 1.969967, 1, 0, 0, 1, 1,
0.8309267, -0.05518874, 2.138029, 1, 0, 0, 1, 1,
0.8394809, -0.1956455, 2.20479, 1, 0, 0, 1, 1,
0.8425609, 0.4608742, 0.5607051, 1, 0, 0, 1, 1,
0.8478422, 0.815976, 0.9459532, 0, 0, 0, 1, 1,
0.853151, -2.250601, 3.150156, 0, 0, 0, 1, 1,
0.8553446, 0.5335936, 1.385277, 0, 0, 0, 1, 1,
0.8618085, 0.8451508, 1.960019, 0, 0, 0, 1, 1,
0.8619507, 1.548725, 1.835127, 0, 0, 0, 1, 1,
0.8624576, 0.7798467, 0.08071958, 0, 0, 0, 1, 1,
0.8624658, -0.931323, 3.206249, 0, 0, 0, 1, 1,
0.863037, 0.261041, 2.121943, 1, 1, 1, 1, 1,
0.8635496, -0.2495365, 2.475233, 1, 1, 1, 1, 1,
0.8645939, -0.5413902, 1.723694, 1, 1, 1, 1, 1,
0.8661758, 1.007809, 0.6232323, 1, 1, 1, 1, 1,
0.8681601, -0.2600231, 2.105765, 1, 1, 1, 1, 1,
0.8693497, -0.4701211, 2.156041, 1, 1, 1, 1, 1,
0.8705748, 0.6944205, 2.269222, 1, 1, 1, 1, 1,
0.8713009, -0.8844479, 2.969259, 1, 1, 1, 1, 1,
0.8719302, 1.346117, 0.1773838, 1, 1, 1, 1, 1,
0.8738405, -1.734206, 4.529809, 1, 1, 1, 1, 1,
0.8749586, -1.225425, 1.704766, 1, 1, 1, 1, 1,
0.8767725, 1.108731, 1.115063, 1, 1, 1, 1, 1,
0.8813522, 0.9891306, 0.06683217, 1, 1, 1, 1, 1,
0.8875498, -0.1394349, 2.930819, 1, 1, 1, 1, 1,
0.8918716, 0.6871275, 0.734251, 1, 1, 1, 1, 1,
0.8951792, -0.4451535, 4.065736, 0, 0, 1, 1, 1,
0.8958877, 0.01496013, 2.113563, 1, 0, 0, 1, 1,
0.8977275, -0.9937826, 2.518536, 1, 0, 0, 1, 1,
0.897849, 0.2552703, 0.6384139, 1, 0, 0, 1, 1,
0.9003152, 0.3299862, 1.379489, 1, 0, 0, 1, 1,
0.9012619, 1.1499, 1.391977, 1, 0, 0, 1, 1,
0.9034041, -0.2411557, 2.077471, 0, 0, 0, 1, 1,
0.9097176, 0.490933, -1.350585, 0, 0, 0, 1, 1,
0.9125815, -0.7936243, 2.28327, 0, 0, 0, 1, 1,
0.9187626, -1.862795, 4.608368, 0, 0, 0, 1, 1,
0.9201875, 0.1200475, 0.958994, 0, 0, 0, 1, 1,
0.9227878, -0.6808258, 3.551136, 0, 0, 0, 1, 1,
0.9267071, -0.06647588, 0.07354604, 0, 0, 0, 1, 1,
0.9291531, -0.7131006, 2.217107, 1, 1, 1, 1, 1,
0.9449133, -0.251249, 3.07158, 1, 1, 1, 1, 1,
0.9472106, -0.5938447, 2.374099, 1, 1, 1, 1, 1,
0.9482967, 0.1930358, 1.662144, 1, 1, 1, 1, 1,
0.9503036, -0.12856, 1.058203, 1, 1, 1, 1, 1,
0.9553187, 1.729023, 1.548245, 1, 1, 1, 1, 1,
0.9566427, -0.3652239, 1.45686, 1, 1, 1, 1, 1,
0.9588698, -0.08146089, 2.364392, 1, 1, 1, 1, 1,
0.9607641, -0.5237791, 2.659333, 1, 1, 1, 1, 1,
0.9609268, 1.315224, -1.068524, 1, 1, 1, 1, 1,
0.9872901, -1.079477, 2.090633, 1, 1, 1, 1, 1,
0.9933747, 0.3105204, -0.4891445, 1, 1, 1, 1, 1,
0.993817, 0.001746795, 3.267652, 1, 1, 1, 1, 1,
0.9939805, -1.909751, 3.366141, 1, 1, 1, 1, 1,
0.9949252, 1.036571, -0.7516633, 1, 1, 1, 1, 1,
0.9972547, -0.2215521, 1.847637, 0, 0, 1, 1, 1,
1.014, 0.4185628, 1.093917, 1, 0, 0, 1, 1,
1.019294, -0.5099137, 3.590967, 1, 0, 0, 1, 1,
1.021469, 0.4401264, 1.134756, 1, 0, 0, 1, 1,
1.022147, 1.080689, 0.6272489, 1, 0, 0, 1, 1,
1.031978, -1.49686, 2.689101, 1, 0, 0, 1, 1,
1.034305, 1.443958, 1.100736, 0, 0, 0, 1, 1,
1.041523, -0.02515209, 0.1900434, 0, 0, 0, 1, 1,
1.047993, -0.79615, 3.618181, 0, 0, 0, 1, 1,
1.050254, -0.6716084, 4.253555, 0, 0, 0, 1, 1,
1.051254, 0.4851331, 1.061581, 0, 0, 0, 1, 1,
1.05245, -0.3622246, 2.950361, 0, 0, 0, 1, 1,
1.060719, -0.4556112, 2.821496, 0, 0, 0, 1, 1,
1.066534, 0.5695306, -0.2410885, 1, 1, 1, 1, 1,
1.067084, 2.079398, 1.591675, 1, 1, 1, 1, 1,
1.068613, -0.2443616, 1.097999, 1, 1, 1, 1, 1,
1.077226, 0.6416268, 0.4904271, 1, 1, 1, 1, 1,
1.078434, -0.5566992, 1.425898, 1, 1, 1, 1, 1,
1.078698, 0.3851813, 2.179865, 1, 1, 1, 1, 1,
1.087766, 0.9543766, 1.186201, 1, 1, 1, 1, 1,
1.088538, 2.539978, -0.2208671, 1, 1, 1, 1, 1,
1.09893, 0.7944445, 2.280534, 1, 1, 1, 1, 1,
1.100481, -0.09069445, 2.665406, 1, 1, 1, 1, 1,
1.107711, 0.3280315, 2.335173, 1, 1, 1, 1, 1,
1.114095, -0.01657644, 2.596095, 1, 1, 1, 1, 1,
1.115388, -1.290787, 2.818367, 1, 1, 1, 1, 1,
1.127037, -0.2432887, 0.03060113, 1, 1, 1, 1, 1,
1.134172, -0.1122138, 0.9329563, 1, 1, 1, 1, 1,
1.139406, -0.9379791, 0.1662469, 0, 0, 1, 1, 1,
1.14403, 1.005041, 0.8854744, 1, 0, 0, 1, 1,
1.149026, 0.186856, 1.894733, 1, 0, 0, 1, 1,
1.156232, -1.09938, 3.491197, 1, 0, 0, 1, 1,
1.164651, 1.507698, -0.7546673, 1, 0, 0, 1, 1,
1.164682, -0.9221343, 1.695401, 1, 0, 0, 1, 1,
1.165236, -0.933952, 2.337325, 0, 0, 0, 1, 1,
1.16797, 1.160872, 0.2975135, 0, 0, 0, 1, 1,
1.168861, 0.817021, 0.1764106, 0, 0, 0, 1, 1,
1.169052, -0.1972583, 1.0538, 0, 0, 0, 1, 1,
1.17074, -1.221528, 1.618193, 0, 0, 0, 1, 1,
1.171363, -0.9551898, 2.368911, 0, 0, 0, 1, 1,
1.175854, -1.258977, 1.454195, 0, 0, 0, 1, 1,
1.189228, 0.001114517, 1.302175, 1, 1, 1, 1, 1,
1.189259, 0.04931159, 0.8054308, 1, 1, 1, 1, 1,
1.195764, -1.543058, 1.776201, 1, 1, 1, 1, 1,
1.20412, 0.1174355, 0.8284945, 1, 1, 1, 1, 1,
1.207702, 0.9419159, 0.8220925, 1, 1, 1, 1, 1,
1.210683, 0.4088343, 1.820824, 1, 1, 1, 1, 1,
1.212297, 0.3613511, 1.232369, 1, 1, 1, 1, 1,
1.216717, 0.1148895, 2.598872, 1, 1, 1, 1, 1,
1.225714, -1.418614, 1.967562, 1, 1, 1, 1, 1,
1.22686, 2.01434, 0.2793863, 1, 1, 1, 1, 1,
1.231286, -0.5165597, 1.973269, 1, 1, 1, 1, 1,
1.234432, 3.129843, -0.7312208, 1, 1, 1, 1, 1,
1.239166, -0.606828, 1.543319, 1, 1, 1, 1, 1,
1.240906, 0.944735, 1.030135, 1, 1, 1, 1, 1,
1.254109, 0.4515244, 0.6196262, 1, 1, 1, 1, 1,
1.259214, 1.248539, 0.5954255, 0, 0, 1, 1, 1,
1.265148, 0.5855559, 1.453826, 1, 0, 0, 1, 1,
1.265503, 0.3078272, 2.371471, 1, 0, 0, 1, 1,
1.265602, 1.464541, 0.8217539, 1, 0, 0, 1, 1,
1.268893, -0.1926431, 1.394144, 1, 0, 0, 1, 1,
1.284411, -0.6367142, 2.468609, 1, 0, 0, 1, 1,
1.287357, -0.2128415, -1.875597, 0, 0, 0, 1, 1,
1.289222, 0.4737038, -0.2673164, 0, 0, 0, 1, 1,
1.292356, 0.3877014, 1.886571, 0, 0, 0, 1, 1,
1.296878, 0.1813715, -0.05681065, 0, 0, 0, 1, 1,
1.298107, 0.351555, 1.205886, 0, 0, 0, 1, 1,
1.299201, -1.346146, 3.102678, 0, 0, 0, 1, 1,
1.303534, -1.604831, 2.153259, 0, 0, 0, 1, 1,
1.315709, 2.696553, 1.543697, 1, 1, 1, 1, 1,
1.316569, -1.189045, 1.764184, 1, 1, 1, 1, 1,
1.318955, -1.749489, 2.503914, 1, 1, 1, 1, 1,
1.32014, -0.4226966, 1.746934, 1, 1, 1, 1, 1,
1.325609, -0.8509501, 2.479702, 1, 1, 1, 1, 1,
1.327404, 0.6992299, 2.954145, 1, 1, 1, 1, 1,
1.354914, -0.4985346, 2.123092, 1, 1, 1, 1, 1,
1.373359, -0.3926424, 1.06458, 1, 1, 1, 1, 1,
1.3947, -0.2684217, 1.915697, 1, 1, 1, 1, 1,
1.40088, -1.449816, 2.593223, 1, 1, 1, 1, 1,
1.405441, -0.7407081, 2.35926, 1, 1, 1, 1, 1,
1.41265, -0.5176829, 1.164107, 1, 1, 1, 1, 1,
1.420707, -0.2789544, 2.358164, 1, 1, 1, 1, 1,
1.421567, -0.06287719, 2.965944, 1, 1, 1, 1, 1,
1.431871, 0.2864537, 0.4745083, 1, 1, 1, 1, 1,
1.432619, -1.726174, 3.562126, 0, 0, 1, 1, 1,
1.450955, -0.9285924, 3.112015, 1, 0, 0, 1, 1,
1.457094, -0.494635, 1.974275, 1, 0, 0, 1, 1,
1.460089, 1.990188, -0.09421101, 1, 0, 0, 1, 1,
1.465143, 0.4022329, 1.549971, 1, 0, 0, 1, 1,
1.46587, 1.669177, -0.2253662, 1, 0, 0, 1, 1,
1.48502, 1.871218, 2.16285, 0, 0, 0, 1, 1,
1.486701, -0.4189799, 2.889549, 0, 0, 0, 1, 1,
1.490971, -0.5005345, 3.479374, 0, 0, 0, 1, 1,
1.498315, 1.745288, 0.8716841, 0, 0, 0, 1, 1,
1.503652, -0.6559695, 3.632603, 0, 0, 0, 1, 1,
1.509268, 1.653587, 1.271527, 0, 0, 0, 1, 1,
1.513296, 0.547181, 0.3880329, 0, 0, 0, 1, 1,
1.518373, 0.6779029, 0.01834206, 1, 1, 1, 1, 1,
1.549607, 0.686464, 1.288101, 1, 1, 1, 1, 1,
1.563816, 2.955771, -0.2237533, 1, 1, 1, 1, 1,
1.567037, 1.210502, -0.02655825, 1, 1, 1, 1, 1,
1.567148, 0.07819971, 1.637955, 1, 1, 1, 1, 1,
1.568172, 0.2432247, 2.938443, 1, 1, 1, 1, 1,
1.571229, 0.7618564, 2.152433, 1, 1, 1, 1, 1,
1.573453, -0.5096465, 1.714355, 1, 1, 1, 1, 1,
1.578786, 0.3410001, 0.4916803, 1, 1, 1, 1, 1,
1.611485, 0.5624045, -1.490019, 1, 1, 1, 1, 1,
1.612898, -0.7948412, 1.396607, 1, 1, 1, 1, 1,
1.61855, 2.734903, -0.2722883, 1, 1, 1, 1, 1,
1.640439, 0.1709276, 1.605735, 1, 1, 1, 1, 1,
1.666913, 0.2151284, 3.720591, 1, 1, 1, 1, 1,
1.671797, -0.749083, 2.552327, 1, 1, 1, 1, 1,
1.673445, -0.6404415, 3.179902, 0, 0, 1, 1, 1,
1.691869, -0.3730133, 2.098613, 1, 0, 0, 1, 1,
1.692647, -1.777266, 3.349462, 1, 0, 0, 1, 1,
1.698056, 0.04936817, 3.427893, 1, 0, 0, 1, 1,
1.698683, 1.264955, -0.1669134, 1, 0, 0, 1, 1,
1.704426, 0.2456685, 1.895137, 1, 0, 0, 1, 1,
1.721136, -1.306984, 1.481374, 0, 0, 0, 1, 1,
1.73434, -0.4527009, 0.9425557, 0, 0, 0, 1, 1,
1.747466, 1.000197, -0.2903584, 0, 0, 0, 1, 1,
1.750478, 1.014794, 2.103758, 0, 0, 0, 1, 1,
1.755403, -0.2170864, 2.389873, 0, 0, 0, 1, 1,
1.762852, 0.6747076, 1.711696, 0, 0, 0, 1, 1,
1.782768, 0.8364985, 0.6746936, 0, 0, 0, 1, 1,
1.797968, -1.152822, 2.397846, 1, 1, 1, 1, 1,
1.809718, -0.2122446, 1.750878, 1, 1, 1, 1, 1,
1.820696, 1.029349, -0.1474245, 1, 1, 1, 1, 1,
1.832072, -1.218563, 3.10437, 1, 1, 1, 1, 1,
1.836729, -0.5650777, 1.964418, 1, 1, 1, 1, 1,
1.847759, -0.7756113, 1.385326, 1, 1, 1, 1, 1,
1.882029, 0.787323, 1.170807, 1, 1, 1, 1, 1,
1.88241, 1.697752, 1.031904, 1, 1, 1, 1, 1,
1.918036, -0.730805, 1.018572, 1, 1, 1, 1, 1,
1.926826, 0.8616967, 1.490328, 1, 1, 1, 1, 1,
1.933517, -1.527112, 3.121451, 1, 1, 1, 1, 1,
1.992199, 0.662469, 2.793459, 1, 1, 1, 1, 1,
1.995101, 0.7873512, 0.2130142, 1, 1, 1, 1, 1,
1.997906, -0.06631476, 2.393293, 1, 1, 1, 1, 1,
2.002935, 1.104141, 2.306596, 1, 1, 1, 1, 1,
2.01596, 2.672772, -0.3243613, 0, 0, 1, 1, 1,
2.046122, 0.5698179, 2.558966, 1, 0, 0, 1, 1,
2.10695, -1.59294, 1.913265, 1, 0, 0, 1, 1,
2.186815, -1.924684, 2.653032, 1, 0, 0, 1, 1,
2.190465, -2.294417, 2.754243, 1, 0, 0, 1, 1,
2.195685, -0.3219652, 1.831406, 1, 0, 0, 1, 1,
2.224059, 0.8873842, 2.582579, 0, 0, 0, 1, 1,
2.297348, 1.160643, 2.276393, 0, 0, 0, 1, 1,
2.305557, 0.1346311, -0.429085, 0, 0, 0, 1, 1,
2.405858, -0.1012355, 2.375967, 0, 0, 0, 1, 1,
2.437491, 0.4584235, 1.34237, 0, 0, 0, 1, 1,
2.479497, -0.7632922, 2.342307, 0, 0, 0, 1, 1,
2.485472, 1.238986, -0.02061812, 0, 0, 0, 1, 1,
2.51591, 0.6602585, 1.289273, 1, 1, 1, 1, 1,
2.602318, 0.01390752, 2.363722, 1, 1, 1, 1, 1,
2.605513, 0.6592126, 1.318602, 1, 1, 1, 1, 1,
2.704453, -0.8016613, -0.3251834, 1, 1, 1, 1, 1,
2.835493, 0.2509982, 2.289473, 1, 1, 1, 1, 1,
3.163165, 1.215127, 2.262046, 1, 1, 1, 1, 1,
3.71515, 2.000342, 0.4297442, 1, 1, 1, 1, 1
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
var radius = 9.843202;
var distance = 34.57383;
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
mvMatrix.translate( -0.3858355, 0.3159728, -0.1948624 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.57383);
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
