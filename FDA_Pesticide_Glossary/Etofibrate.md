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
-3.603673, -0.6082453, -0.9910705, 1, 0, 0, 1,
-2.922317, -0.2620936, -1.477996, 1, 0.007843138, 0, 1,
-2.877888, -0.5865129, -2.326259, 1, 0.01176471, 0, 1,
-2.699736, -0.2216709, -3.093923, 1, 0.01960784, 0, 1,
-2.6918, -0.6888741, -2.019674, 1, 0.02352941, 0, 1,
-2.651467, -1.46501, -1.955575, 1, 0.03137255, 0, 1,
-2.560763, 1.109673, -1.580701, 1, 0.03529412, 0, 1,
-2.520703, -1.319085, -1.378575, 1, 0.04313726, 0, 1,
-2.477897, 0.2861102, -3.027083, 1, 0.04705882, 0, 1,
-2.452105, -0.07218721, -3.445271, 1, 0.05490196, 0, 1,
-2.401938, -0.9405209, -1.290682, 1, 0.05882353, 0, 1,
-2.354151, 1.820952, -2.651047, 1, 0.06666667, 0, 1,
-2.344021, 0.2479713, -0.283244, 1, 0.07058824, 0, 1,
-2.244986, 0.4846154, -2.331231, 1, 0.07843138, 0, 1,
-2.244557, 1.27537, -3.212767, 1, 0.08235294, 0, 1,
-2.224717, 0.6040517, -0.8809325, 1, 0.09019608, 0, 1,
-2.151599, 0.3516293, -1.320207, 1, 0.09411765, 0, 1,
-2.136455, -0.7583633, -0.8103007, 1, 0.1019608, 0, 1,
-2.101399, 0.3719164, -0.5565419, 1, 0.1098039, 0, 1,
-2.099857, 0.7032288, -1.0424, 1, 0.1137255, 0, 1,
-2.080185, 0.6590942, -2.597378, 1, 0.1215686, 0, 1,
-2.051524, 0.178645, -2.965753, 1, 0.1254902, 0, 1,
-2.043008, 0.7919573, -0.338022, 1, 0.1333333, 0, 1,
-2.007588, 0.2286114, -1.600507, 1, 0.1372549, 0, 1,
-2.00015, 1.159501, 0.05427681, 1, 0.145098, 0, 1,
-1.982537, 0.1703601, -1.141224, 1, 0.1490196, 0, 1,
-1.982055, 0.5088535, -0.1010765, 1, 0.1568628, 0, 1,
-1.969311, -0.0206692, -2.161898, 1, 0.1607843, 0, 1,
-1.966168, -0.4328085, -1.937535, 1, 0.1686275, 0, 1,
-1.953397, -0.3599075, -3.453757, 1, 0.172549, 0, 1,
-1.912688, 0.5918569, -0.6761665, 1, 0.1803922, 0, 1,
-1.912562, 0.1990892, -0.8444288, 1, 0.1843137, 0, 1,
-1.879602, 0.2332462, -1.066911, 1, 0.1921569, 0, 1,
-1.872491, -1.846101, -1.73084, 1, 0.1960784, 0, 1,
-1.816958, -1.296903, -2.282918, 1, 0.2039216, 0, 1,
-1.814872, -1.051818, -3.316712, 1, 0.2117647, 0, 1,
-1.788761, 0.07982013, -2.136886, 1, 0.2156863, 0, 1,
-1.774954, -1.443081, -3.467117, 1, 0.2235294, 0, 1,
-1.765015, -1.703729, -1.698269, 1, 0.227451, 0, 1,
-1.76334, 0.2024298, -1.023735, 1, 0.2352941, 0, 1,
-1.762578, 0.1921176, -0.9344212, 1, 0.2392157, 0, 1,
-1.76128, -2.350615, -1.704984, 1, 0.2470588, 0, 1,
-1.757197, 0.2055917, -0.658976, 1, 0.2509804, 0, 1,
-1.747818, -1.599039, -2.217632, 1, 0.2588235, 0, 1,
-1.739406, 1.609438, -0.4273317, 1, 0.2627451, 0, 1,
-1.733846, 0.7132137, -0.9745004, 1, 0.2705882, 0, 1,
-1.720645, 0.2816529, -1.873675, 1, 0.2745098, 0, 1,
-1.716861, 0.1267799, -2.512704, 1, 0.282353, 0, 1,
-1.713912, -0.7492926, -3.498021, 1, 0.2862745, 0, 1,
-1.700073, -0.570689, -1.27516, 1, 0.2941177, 0, 1,
-1.6976, -0.5536283, -2.46611, 1, 0.3019608, 0, 1,
-1.671963, 2.791018, -0.2449851, 1, 0.3058824, 0, 1,
-1.655852, -0.8404611, -2.688803, 1, 0.3137255, 0, 1,
-1.651524, -0.9290689, -2.502827, 1, 0.3176471, 0, 1,
-1.645126, 0.4976504, -0.5804057, 1, 0.3254902, 0, 1,
-1.630336, 0.1262325, -2.960495, 1, 0.3294118, 0, 1,
-1.610934, -0.6791158, -1.564394, 1, 0.3372549, 0, 1,
-1.607493, -0.2782838, -0.9917013, 1, 0.3411765, 0, 1,
-1.596241, -0.1371783, -2.331996, 1, 0.3490196, 0, 1,
-1.563707, 2.093476, 0.02745277, 1, 0.3529412, 0, 1,
-1.56265, 1.296355, -1.225503, 1, 0.3607843, 0, 1,
-1.560408, -0.3805546, -2.275698, 1, 0.3647059, 0, 1,
-1.538877, 0.1698643, -1.106601, 1, 0.372549, 0, 1,
-1.535257, -0.3962855, -2.289205, 1, 0.3764706, 0, 1,
-1.534084, -0.3528002, -1.164469, 1, 0.3843137, 0, 1,
-1.522043, 1.224312, -1.852097, 1, 0.3882353, 0, 1,
-1.5091, 0.1208936, -1.356611, 1, 0.3960784, 0, 1,
-1.500351, -0.8717137, -2.682035, 1, 0.4039216, 0, 1,
-1.485827, 0.2036581, -1.218882, 1, 0.4078431, 0, 1,
-1.485678, 0.4664718, -2.536287, 1, 0.4156863, 0, 1,
-1.473419, 0.1157341, -3.397828, 1, 0.4196078, 0, 1,
-1.455659, 0.1330551, -2.838207, 1, 0.427451, 0, 1,
-1.450293, 0.3630913, -1.699002, 1, 0.4313726, 0, 1,
-1.448151, 0.241936, -2.84026, 1, 0.4392157, 0, 1,
-1.442411, -1.190614, -3.311482, 1, 0.4431373, 0, 1,
-1.434405, 0.5090222, -0.9276614, 1, 0.4509804, 0, 1,
-1.431806, 0.5868862, 0.2276985, 1, 0.454902, 0, 1,
-1.431638, -0.3757927, -1.818961, 1, 0.4627451, 0, 1,
-1.430111, -0.6937823, -3.607109, 1, 0.4666667, 0, 1,
-1.41501, 1.148554, -1.882102, 1, 0.4745098, 0, 1,
-1.408761, -0.5302244, -0.9852998, 1, 0.4784314, 0, 1,
-1.385377, 0.00644081, -0.117641, 1, 0.4862745, 0, 1,
-1.376917, -1.097089, -1.52193, 1, 0.4901961, 0, 1,
-1.375372, 0.7220878, -1.314668, 1, 0.4980392, 0, 1,
-1.372696, -1.030653, -2.307643, 1, 0.5058824, 0, 1,
-1.361325, -0.8265558, -0.1848, 1, 0.509804, 0, 1,
-1.355899, 0.988051, -1.110512, 1, 0.5176471, 0, 1,
-1.352292, -0.8637322, -0.1101319, 1, 0.5215687, 0, 1,
-1.350974, -0.4892373, -1.470375, 1, 0.5294118, 0, 1,
-1.331353, 0.6440796, -0.1650166, 1, 0.5333334, 0, 1,
-1.326635, -1.129162, -4.682989, 1, 0.5411765, 0, 1,
-1.318671, -0.1998176, -1.155573, 1, 0.5450981, 0, 1,
-1.314591, 0.4281764, 0.3948548, 1, 0.5529412, 0, 1,
-1.313674, 0.8899873, -0.4034199, 1, 0.5568628, 0, 1,
-1.311119, -0.5091393, -1.367693, 1, 0.5647059, 0, 1,
-1.296581, -0.3977765, -1.89442, 1, 0.5686275, 0, 1,
-1.29545, 0.4580106, -2.078159, 1, 0.5764706, 0, 1,
-1.291605, 0.7258214, -2.591381, 1, 0.5803922, 0, 1,
-1.291389, -0.5209766, -1.452533, 1, 0.5882353, 0, 1,
-1.290811, 0.4547567, -0.738688, 1, 0.5921569, 0, 1,
-1.290017, 0.9432858, -1.673211, 1, 0.6, 0, 1,
-1.283527, 0.4118375, -0.357589, 1, 0.6078432, 0, 1,
-1.282782, 1.063472, -0.5985036, 1, 0.6117647, 0, 1,
-1.280943, -0.1276299, -3.577104, 1, 0.6196079, 0, 1,
-1.271666, 1.041168, 0.6402934, 1, 0.6235294, 0, 1,
-1.265567, 1.084774, -1.824607, 1, 0.6313726, 0, 1,
-1.264786, -0.6922932, -0.7915766, 1, 0.6352941, 0, 1,
-1.262941, -0.06130063, -2.562828, 1, 0.6431373, 0, 1,
-1.261097, -1.992434, -2.655749, 1, 0.6470588, 0, 1,
-1.256394, -0.03205713, -2.224117, 1, 0.654902, 0, 1,
-1.254989, 0.8654963, -0.4034276, 1, 0.6588235, 0, 1,
-1.254072, 2.615816, -0.3278733, 1, 0.6666667, 0, 1,
-1.252061, -0.981362, -1.350487, 1, 0.6705883, 0, 1,
-1.245035, 0.5730836, 0.2211044, 1, 0.6784314, 0, 1,
-1.241544, 0.393361, -1.718194, 1, 0.682353, 0, 1,
-1.230706, -0.1918915, -2.639526, 1, 0.6901961, 0, 1,
-1.223584, -0.4272214, -2.677698, 1, 0.6941177, 0, 1,
-1.216546, 0.6200776, -1.074661, 1, 0.7019608, 0, 1,
-1.203926, -0.804085, -2.920131, 1, 0.7098039, 0, 1,
-1.196165, 0.639172, 0.1904352, 1, 0.7137255, 0, 1,
-1.193781, -0.1342233, -2.557696, 1, 0.7215686, 0, 1,
-1.192141, 0.8406789, -0.989941, 1, 0.7254902, 0, 1,
-1.189101, 0.1813128, -1.175186, 1, 0.7333333, 0, 1,
-1.183001, -1.106325, -2.527625, 1, 0.7372549, 0, 1,
-1.178813, 1.20057, -0.4016773, 1, 0.7450981, 0, 1,
-1.177927, 3.163667, -2.006606, 1, 0.7490196, 0, 1,
-1.177019, -0.0843596, -1.162402, 1, 0.7568628, 0, 1,
-1.168755, -0.9701397, -1.847054, 1, 0.7607843, 0, 1,
-1.164657, -2.599848, -2.889479, 1, 0.7686275, 0, 1,
-1.16252, -0.2315942, -1.536054, 1, 0.772549, 0, 1,
-1.161083, -0.4391855, -3.009756, 1, 0.7803922, 0, 1,
-1.159898, -1.717129, -3.865852, 1, 0.7843137, 0, 1,
-1.157132, -0.6937074, -2.063684, 1, 0.7921569, 0, 1,
-1.154923, 0.358258, -0.5702973, 1, 0.7960784, 0, 1,
-1.135501, -0.1086488, -0.4541657, 1, 0.8039216, 0, 1,
-1.13299, -2.382359, -3.699046, 1, 0.8117647, 0, 1,
-1.131104, -1.512647, -2.587501, 1, 0.8156863, 0, 1,
-1.118308, 0.9945098, -1.382604, 1, 0.8235294, 0, 1,
-1.113377, -1.308166, -1.725167, 1, 0.827451, 0, 1,
-1.111206, -0.6041847, -2.216461, 1, 0.8352941, 0, 1,
-1.104648, -0.01609058, -2.507113, 1, 0.8392157, 0, 1,
-1.102804, 1.942894, 0.2709963, 1, 0.8470588, 0, 1,
-1.102519, -0.4760922, -0.7341054, 1, 0.8509804, 0, 1,
-1.090685, 1.711619, -2.021561, 1, 0.8588235, 0, 1,
-1.081251, -0.9713073, -2.470426, 1, 0.8627451, 0, 1,
-1.074809, 1.039624, -2.08539, 1, 0.8705882, 0, 1,
-1.073498, -0.2102194, -0.3136922, 1, 0.8745098, 0, 1,
-1.070781, -0.6380425, -2.231655, 1, 0.8823529, 0, 1,
-1.059106, -0.4137881, -0.2628194, 1, 0.8862745, 0, 1,
-1.057842, 0.438612, -2.692365, 1, 0.8941177, 0, 1,
-1.052854, 0.05003944, -1.297368, 1, 0.8980392, 0, 1,
-1.050565, 1.055916, -0.3763031, 1, 0.9058824, 0, 1,
-1.049281, -0.3186605, -1.280474, 1, 0.9137255, 0, 1,
-1.045917, 0.04748759, -1.298214, 1, 0.9176471, 0, 1,
-1.028999, -1.249741, -2.085992, 1, 0.9254902, 0, 1,
-1.028487, 0.3307213, -0.9599602, 1, 0.9294118, 0, 1,
-1.027886, 0.01219736, -0.9003384, 1, 0.9372549, 0, 1,
-1.01015, -0.1608162, -0.6144572, 1, 0.9411765, 0, 1,
-0.9981164, 1.295618, -1.764731, 1, 0.9490196, 0, 1,
-0.9974458, -0.411888, -2.179, 1, 0.9529412, 0, 1,
-0.9929256, 0.4232195, -0.7604862, 1, 0.9607843, 0, 1,
-0.9869483, -0.3335351, -2.21664, 1, 0.9647059, 0, 1,
-0.9815336, -0.4127382, -1.332623, 1, 0.972549, 0, 1,
-0.9742428, -0.03757973, -0.5459041, 1, 0.9764706, 0, 1,
-0.973494, -1.162565, -2.740828, 1, 0.9843137, 0, 1,
-0.9716578, 0.2876324, -2.177566, 1, 0.9882353, 0, 1,
-0.9642422, 0.003560961, -2.496999, 1, 0.9960784, 0, 1,
-0.9629204, 0.4342923, -1.003007, 0.9960784, 1, 0, 1,
-0.9563462, 0.9746153, -0.9865066, 0.9921569, 1, 0, 1,
-0.9557652, -1.34671, -4.326178, 0.9843137, 1, 0, 1,
-0.9504182, -1.303651, -1.724094, 0.9803922, 1, 0, 1,
-0.9503564, -1.171856, -1.126464, 0.972549, 1, 0, 1,
-0.9488536, -0.8264999, -3.077101, 0.9686275, 1, 0, 1,
-0.9389223, -1.213082, -1.127718, 0.9607843, 1, 0, 1,
-0.9385816, 0.2235106, 0.07376754, 0.9568627, 1, 0, 1,
-0.9330884, -0.6563966, -1.496606, 0.9490196, 1, 0, 1,
-0.9298736, -1.959466, -2.795948, 0.945098, 1, 0, 1,
-0.9255378, 0.7258726, -2.412559, 0.9372549, 1, 0, 1,
-0.9196287, -0.4764361, -3.179404, 0.9333333, 1, 0, 1,
-0.9183254, -0.1866099, -2.74334, 0.9254902, 1, 0, 1,
-0.9182567, 0.3761473, -1.440121, 0.9215686, 1, 0, 1,
-0.9159654, 1.171791, 1.182072, 0.9137255, 1, 0, 1,
-0.9158802, 1.085525, -1.470306, 0.9098039, 1, 0, 1,
-0.9158586, -1.707973, -4.690813, 0.9019608, 1, 0, 1,
-0.914702, 0.8992156, -1.091777, 0.8941177, 1, 0, 1,
-0.9099943, -0.6885912, -2.167134, 0.8901961, 1, 0, 1,
-0.9079116, 0.2843542, -0.6928551, 0.8823529, 1, 0, 1,
-0.9075651, -0.155031, -1.35843, 0.8784314, 1, 0, 1,
-0.9016258, 1.126089, -0.3882071, 0.8705882, 1, 0, 1,
-0.8984262, 0.616063, 0.6946622, 0.8666667, 1, 0, 1,
-0.8983247, -0.1714199, -3.931681, 0.8588235, 1, 0, 1,
-0.8981793, -0.8756793, -2.35397, 0.854902, 1, 0, 1,
-0.8975142, 0.5102435, -0.1136529, 0.8470588, 1, 0, 1,
-0.8955047, -0.9759018, -4.193039, 0.8431373, 1, 0, 1,
-0.8913357, -0.2478331, -1.46286, 0.8352941, 1, 0, 1,
-0.8839105, 0.1717402, -0.442973, 0.8313726, 1, 0, 1,
-0.8768477, 0.3876431, -0.9655833, 0.8235294, 1, 0, 1,
-0.875693, 0.741527, -0.2928463, 0.8196079, 1, 0, 1,
-0.875608, -0.8388197, -2.361892, 0.8117647, 1, 0, 1,
-0.8744833, 0.6516706, -1.633683, 0.8078431, 1, 0, 1,
-0.8680941, 1.408833, -0.5983139, 0.8, 1, 0, 1,
-0.8643702, 0.1602402, -1.300588, 0.7921569, 1, 0, 1,
-0.858236, 0.3530206, -2.349666, 0.7882353, 1, 0, 1,
-0.8577656, 0.2344123, -1.031955, 0.7803922, 1, 0, 1,
-0.854651, 0.6339737, -1.206252, 0.7764706, 1, 0, 1,
-0.8513995, 0.1380488, -1.300953, 0.7686275, 1, 0, 1,
-0.8484254, -0.7328647, -1.57118, 0.7647059, 1, 0, 1,
-0.8436122, -0.3777785, -2.261477, 0.7568628, 1, 0, 1,
-0.8371152, -0.330748, -6.172208, 0.7529412, 1, 0, 1,
-0.8125882, 2.039086, 0.2550817, 0.7450981, 1, 0, 1,
-0.8083266, -0.2939636, -1.277466, 0.7411765, 1, 0, 1,
-0.8034259, -0.06665993, -1.455971, 0.7333333, 1, 0, 1,
-0.8026838, 1.790613, 1.107062, 0.7294118, 1, 0, 1,
-0.8003301, -0.5349135, -3.350797, 0.7215686, 1, 0, 1,
-0.8001484, 0.9534658, 0.6354028, 0.7176471, 1, 0, 1,
-0.7959638, 1.441716, 0.04200882, 0.7098039, 1, 0, 1,
-0.7909071, 0.9801272, -1.633296, 0.7058824, 1, 0, 1,
-0.790115, -0.2123457, -0.8177361, 0.6980392, 1, 0, 1,
-0.7839803, -0.8575836, -2.460155, 0.6901961, 1, 0, 1,
-0.7809793, -0.3904252, -1.958402, 0.6862745, 1, 0, 1,
-0.7737004, -0.5919878, -5.599862, 0.6784314, 1, 0, 1,
-0.773225, 1.945123, -1.171293, 0.6745098, 1, 0, 1,
-0.7707289, -0.2424548, -1.549457, 0.6666667, 1, 0, 1,
-0.7606556, 2.085595, -1.67095, 0.6627451, 1, 0, 1,
-0.7600502, -2.267501, -3.449395, 0.654902, 1, 0, 1,
-0.7490456, 0.8568144, 0.4556176, 0.6509804, 1, 0, 1,
-0.7472168, -0.4886451, -2.802502, 0.6431373, 1, 0, 1,
-0.7415765, 0.9076262, -1.492853, 0.6392157, 1, 0, 1,
-0.7381074, -0.3819218, -1.635999, 0.6313726, 1, 0, 1,
-0.7340269, 1.220627, -1.042003, 0.627451, 1, 0, 1,
-0.7324383, 0.3616624, 0.1872709, 0.6196079, 1, 0, 1,
-0.7290874, -0.1736326, -2.697103, 0.6156863, 1, 0, 1,
-0.7264451, -0.4194034, -2.891508, 0.6078432, 1, 0, 1,
-0.7192759, 0.3060861, 0.6157444, 0.6039216, 1, 0, 1,
-0.7167454, 1.356172, -0.7759897, 0.5960785, 1, 0, 1,
-0.7151809, -0.7135812, -1.796854, 0.5882353, 1, 0, 1,
-0.7104991, 0.5351969, 0.09528845, 0.5843138, 1, 0, 1,
-0.7095453, -0.712722, -3.008498, 0.5764706, 1, 0, 1,
-0.7066766, -1.574761, -1.943063, 0.572549, 1, 0, 1,
-0.7050405, 0.8003692, 0.1495518, 0.5647059, 1, 0, 1,
-0.7044702, -2.565692, -2.27584, 0.5607843, 1, 0, 1,
-0.6982259, -0.3347425, -1.922009, 0.5529412, 1, 0, 1,
-0.6981338, 1.117085, -0.1829672, 0.5490196, 1, 0, 1,
-0.6978322, -0.6612854, -1.752306, 0.5411765, 1, 0, 1,
-0.6975991, -0.425386, -2.70583, 0.5372549, 1, 0, 1,
-0.6922141, -0.880586, -2.567072, 0.5294118, 1, 0, 1,
-0.6865221, -0.3842341, -1.943904, 0.5254902, 1, 0, 1,
-0.6839346, 0.1688026, 0.9828656, 0.5176471, 1, 0, 1,
-0.6832304, 1.1497, 0.3669978, 0.5137255, 1, 0, 1,
-0.6812332, 0.009931453, -0.6359283, 0.5058824, 1, 0, 1,
-0.6807795, 0.5448617, -1.537231, 0.5019608, 1, 0, 1,
-0.6794462, -0.96495, -1.806373, 0.4941176, 1, 0, 1,
-0.6760703, 1.098849, -0.2459237, 0.4862745, 1, 0, 1,
-0.6726034, -1.468369, -4.079868, 0.4823529, 1, 0, 1,
-0.6694278, -0.684913, -2.755615, 0.4745098, 1, 0, 1,
-0.6681709, -0.827837, -2.743213, 0.4705882, 1, 0, 1,
-0.6628646, -1.392982, -2.911036, 0.4627451, 1, 0, 1,
-0.6608624, 1.443259, -1.340431, 0.4588235, 1, 0, 1,
-0.6595812, 0.6579428, -0.1189639, 0.4509804, 1, 0, 1,
-0.6586217, 0.4901587, 1.043964, 0.4470588, 1, 0, 1,
-0.6533111, -1.287154, -3.027875, 0.4392157, 1, 0, 1,
-0.6389146, 0.2844816, -3.136329, 0.4352941, 1, 0, 1,
-0.6354886, -0.3904605, -2.155395, 0.427451, 1, 0, 1,
-0.634702, 2.772767, -0.5058956, 0.4235294, 1, 0, 1,
-0.6339387, -0.4439435, -2.043435, 0.4156863, 1, 0, 1,
-0.6268401, 0.1286327, -1.675757, 0.4117647, 1, 0, 1,
-0.624528, -0.4251086, -1.084371, 0.4039216, 1, 0, 1,
-0.6232503, -1.398956, -2.0364, 0.3960784, 1, 0, 1,
-0.6206182, 0.5358729, -0.9576287, 0.3921569, 1, 0, 1,
-0.6175179, 0.8246008, 1.302423, 0.3843137, 1, 0, 1,
-0.6148937, 1.232993, -0.3614053, 0.3803922, 1, 0, 1,
-0.6137732, 1.003147, -0.661089, 0.372549, 1, 0, 1,
-0.6115239, -0.990082, -2.198844, 0.3686275, 1, 0, 1,
-0.6070958, -0.5092967, -2.943058, 0.3607843, 1, 0, 1,
-0.6048115, 0.5760065, 0.1992443, 0.3568628, 1, 0, 1,
-0.6046551, 0.7968516, -1.641278, 0.3490196, 1, 0, 1,
-0.6018897, -0.6887632, -3.39149, 0.345098, 1, 0, 1,
-0.6011613, 0.0295103, -1.821703, 0.3372549, 1, 0, 1,
-0.5982866, 1.676717, 0.3416854, 0.3333333, 1, 0, 1,
-0.5970587, 0.3679394, -0.4640343, 0.3254902, 1, 0, 1,
-0.5950895, -0.0890965, -1.09922, 0.3215686, 1, 0, 1,
-0.5928662, 1.01181, 1.044211, 0.3137255, 1, 0, 1,
-0.5817364, 0.5042777, -1.102948, 0.3098039, 1, 0, 1,
-0.5749362, 0.7241862, 0.4020043, 0.3019608, 1, 0, 1,
-0.5708395, -1.076545, -2.789979, 0.2941177, 1, 0, 1,
-0.5672625, -0.3821736, -0.4724198, 0.2901961, 1, 0, 1,
-0.566348, -1.526113, -2.850447, 0.282353, 1, 0, 1,
-0.5636449, 0.9694791, 0.2619808, 0.2784314, 1, 0, 1,
-0.5605521, -1.335878, -2.977399, 0.2705882, 1, 0, 1,
-0.5541064, -0.5723954, -0.8855101, 0.2666667, 1, 0, 1,
-0.5534224, 1.273175, 0.05180141, 0.2588235, 1, 0, 1,
-0.5478748, -0.3040866, 0.3645643, 0.254902, 1, 0, 1,
-0.5463686, 1.29669, -0.3934443, 0.2470588, 1, 0, 1,
-0.5450291, 1.928341, -1.359974, 0.2431373, 1, 0, 1,
-0.5432468, 0.31297, 0.147338, 0.2352941, 1, 0, 1,
-0.5408813, 0.04158419, -0.7969196, 0.2313726, 1, 0, 1,
-0.5336456, -0.1595792, -2.624955, 0.2235294, 1, 0, 1,
-0.5328027, -1.001984, -1.697609, 0.2196078, 1, 0, 1,
-0.52965, -0.6396133, -4.881784, 0.2117647, 1, 0, 1,
-0.5276546, 0.2983406, -2.072265, 0.2078431, 1, 0, 1,
-0.5154931, 0.796391, -0.7215568, 0.2, 1, 0, 1,
-0.5139796, 0.01145815, -1.594715, 0.1921569, 1, 0, 1,
-0.5117468, -1.532493, -2.767783, 0.1882353, 1, 0, 1,
-0.5105053, -0.04699628, -1.356188, 0.1803922, 1, 0, 1,
-0.5087762, -1.184031, -1.412235, 0.1764706, 1, 0, 1,
-0.508657, 0.033233, -2.184746, 0.1686275, 1, 0, 1,
-0.5064256, -0.01244956, -3.686491, 0.1647059, 1, 0, 1,
-0.5056254, -1.666856, -2.635159, 0.1568628, 1, 0, 1,
-0.5055075, -0.8977466, -4.043693, 0.1529412, 1, 0, 1,
-0.5045992, 0.9298497, 0.5044809, 0.145098, 1, 0, 1,
-0.5044224, -0.1727361, -1.918135, 0.1411765, 1, 0, 1,
-0.5013835, -1.867254, -2.671594, 0.1333333, 1, 0, 1,
-0.4991733, 0.8267606, -0.07109372, 0.1294118, 1, 0, 1,
-0.498661, -0.1061312, -1.874952, 0.1215686, 1, 0, 1,
-0.4953726, -0.4039075, -1.486034, 0.1176471, 1, 0, 1,
-0.4908578, 1.511101, -0.3891791, 0.1098039, 1, 0, 1,
-0.4863648, 0.2929587, -0.2158855, 0.1058824, 1, 0, 1,
-0.4858335, 0.1991123, -2.070783, 0.09803922, 1, 0, 1,
-0.4805368, -3.193129, -5.41422, 0.09019608, 1, 0, 1,
-0.4760441, 0.5206575, -1.979167, 0.08627451, 1, 0, 1,
-0.4759707, -1.837013, -2.312626, 0.07843138, 1, 0, 1,
-0.474405, 0.1234179, -1.055782, 0.07450981, 1, 0, 1,
-0.4715936, -0.0006518441, -1.16542, 0.06666667, 1, 0, 1,
-0.4683293, 0.3036774, -2.803149, 0.0627451, 1, 0, 1,
-0.4647963, 1.212566, -0.4211221, 0.05490196, 1, 0, 1,
-0.4647929, -1.375304, -3.762047, 0.05098039, 1, 0, 1,
-0.464586, -1.39143, -2.915596, 0.04313726, 1, 0, 1,
-0.4622509, -0.2125726, -4.375859, 0.03921569, 1, 0, 1,
-0.4613136, 0.2105889, -0.8091292, 0.03137255, 1, 0, 1,
-0.4608992, 0.6246023, -2.459534, 0.02745098, 1, 0, 1,
-0.4577313, -0.8512412, -3.245863, 0.01960784, 1, 0, 1,
-0.4567299, 2.327094, 0.8103698, 0.01568628, 1, 0, 1,
-0.4534837, -0.814858, -3.349067, 0.007843138, 1, 0, 1,
-0.4530117, -0.4561984, -2.512648, 0.003921569, 1, 0, 1,
-0.4506411, -0.3721065, -3.280268, 0, 1, 0.003921569, 1,
-0.4500712, -0.5771069, -1.981247, 0, 1, 0.01176471, 1,
-0.4488461, 0.8226187, -0.132038, 0, 1, 0.01568628, 1,
-0.4455568, -1.088404, -3.405128, 0, 1, 0.02352941, 1,
-0.4451109, -1.603583, -3.650114, 0, 1, 0.02745098, 1,
-0.4422856, -0.3209931, -1.910176, 0, 1, 0.03529412, 1,
-0.4414517, -0.9066308, -4.059784, 0, 1, 0.03921569, 1,
-0.4379104, -0.1446401, -2.074133, 0, 1, 0.04705882, 1,
-0.4360348, -0.8451612, -4.497931, 0, 1, 0.05098039, 1,
-0.4358004, -0.4651438, -2.499106, 0, 1, 0.05882353, 1,
-0.432377, 0.5363607, -2.553889, 0, 1, 0.0627451, 1,
-0.4323058, 0.32876, 0.0921205, 0, 1, 0.07058824, 1,
-0.4301093, 2.498691, 1.099974, 0, 1, 0.07450981, 1,
-0.4289745, 0.3382871, -0.9036058, 0, 1, 0.08235294, 1,
-0.425431, 1.2732, 0.5030353, 0, 1, 0.08627451, 1,
-0.424833, 0.4185222, -1.255112, 0, 1, 0.09411765, 1,
-0.4239896, 0.7889326, -0.9709173, 0, 1, 0.1019608, 1,
-0.420725, 0.3836863, 1.315789, 0, 1, 0.1058824, 1,
-0.4183538, 0.6876051, -0.4043245, 0, 1, 0.1137255, 1,
-0.4165343, -0.2426258, -2.225406, 0, 1, 0.1176471, 1,
-0.41362, 0.3756435, 0.2481474, 0, 1, 0.1254902, 1,
-0.4124667, -0.3783381, -1.608605, 0, 1, 0.1294118, 1,
-0.4103907, 0.0609974, -1.456951, 0, 1, 0.1372549, 1,
-0.4072284, 1.096606, -0.7390907, 0, 1, 0.1411765, 1,
-0.3959075, 0.5588078, 0.2450494, 0, 1, 0.1490196, 1,
-0.394852, 0.6535054, -1.260748, 0, 1, 0.1529412, 1,
-0.3894982, -1.843167, -2.965198, 0, 1, 0.1607843, 1,
-0.3872146, 1.588082, 0.2857132, 0, 1, 0.1647059, 1,
-0.3833854, 0.935423, 0.2821262, 0, 1, 0.172549, 1,
-0.3817365, -0.9127359, -4.114816, 0, 1, 0.1764706, 1,
-0.3811827, 1.063522, -1.333507, 0, 1, 0.1843137, 1,
-0.3788704, -0.4030516, -2.921946, 0, 1, 0.1882353, 1,
-0.3780393, 0.4140061, -1.098884, 0, 1, 0.1960784, 1,
-0.3771074, 0.5131454, -1.491429, 0, 1, 0.2039216, 1,
-0.365, 1.08322, -0.9788482, 0, 1, 0.2078431, 1,
-0.3605047, -0.006918796, -0.7955825, 0, 1, 0.2156863, 1,
-0.3591022, -0.8847915, -2.938302, 0, 1, 0.2196078, 1,
-0.3581738, -0.9875909, -2.262515, 0, 1, 0.227451, 1,
-0.3490896, -1.912014, -3.310742, 0, 1, 0.2313726, 1,
-0.3478923, -0.6273667, -3.704983, 0, 1, 0.2392157, 1,
-0.3460385, 1.352506, -1.951453, 0, 1, 0.2431373, 1,
-0.3451302, -0.1324247, -3.677449, 0, 1, 0.2509804, 1,
-0.3362998, -1.256496, -2.105825, 0, 1, 0.254902, 1,
-0.3334499, -0.1531639, -1.231399, 0, 1, 0.2627451, 1,
-0.332471, 2.442781, -1.54873, 0, 1, 0.2666667, 1,
-0.3235168, -0.2295507, -1.936023, 0, 1, 0.2745098, 1,
-0.3233858, 1.204605, -1.997992, 0, 1, 0.2784314, 1,
-0.3221656, 1.186954, 0.1223605, 0, 1, 0.2862745, 1,
-0.320616, -1.846375, -2.481636, 0, 1, 0.2901961, 1,
-0.3192421, -0.6752754, -2.19986, 0, 1, 0.2980392, 1,
-0.3141913, 0.3008917, -0.03585683, 0, 1, 0.3058824, 1,
-0.3107338, 2.591111, 1.960573, 0, 1, 0.3098039, 1,
-0.3001322, -0.1373377, -0.9737255, 0, 1, 0.3176471, 1,
-0.2982328, 0.7565901, -0.5342736, 0, 1, 0.3215686, 1,
-0.2943044, 0.2118104, -0.05335892, 0, 1, 0.3294118, 1,
-0.2917078, 0.4010631, -0.1079921, 0, 1, 0.3333333, 1,
-0.2905741, 0.05212968, -0.5931103, 0, 1, 0.3411765, 1,
-0.2899939, -0.002406598, -1.031274, 0, 1, 0.345098, 1,
-0.2884748, 0.4104438, -0.4000922, 0, 1, 0.3529412, 1,
-0.2883996, 0.330979, -1.931677, 0, 1, 0.3568628, 1,
-0.2865901, -0.4788763, -1.981351, 0, 1, 0.3647059, 1,
-0.2850669, -0.1062063, -2.767648, 0, 1, 0.3686275, 1,
-0.2805024, -0.3641211, 0.2937038, 0, 1, 0.3764706, 1,
-0.2802931, -0.941826, -3.48045, 0, 1, 0.3803922, 1,
-0.2795728, 0.1914703, -0.3182139, 0, 1, 0.3882353, 1,
-0.2781897, 0.140938, -0.389371, 0, 1, 0.3921569, 1,
-0.2780367, -1.203743, -0.6791593, 0, 1, 0.4, 1,
-0.2766156, -1.413234, -2.59656, 0, 1, 0.4078431, 1,
-0.2754399, -0.6013553, -3.975422, 0, 1, 0.4117647, 1,
-0.2723472, 0.3694309, -1.062546, 0, 1, 0.4196078, 1,
-0.2716985, 0.9386203, 0.4984759, 0, 1, 0.4235294, 1,
-0.2693678, 0.1558252, -0.5102229, 0, 1, 0.4313726, 1,
-0.2664163, 0.5666001, -0.3648305, 0, 1, 0.4352941, 1,
-0.2654256, 0.5674938, -1.065597, 0, 1, 0.4431373, 1,
-0.2647589, -0.749819, -2.634221, 0, 1, 0.4470588, 1,
-0.2630128, 0.5015019, -0.2720758, 0, 1, 0.454902, 1,
-0.2625211, -0.3583412, -3.671099, 0, 1, 0.4588235, 1,
-0.2619696, 0.2161621, -1.472785, 0, 1, 0.4666667, 1,
-0.2602256, 1.976062, -1.318668, 0, 1, 0.4705882, 1,
-0.2581034, 0.3583396, -1.881476, 0, 1, 0.4784314, 1,
-0.2566733, 0.7913716, 0.05042749, 0, 1, 0.4823529, 1,
-0.2545352, 1.272011, 0.03467139, 0, 1, 0.4901961, 1,
-0.2537452, 0.1409876, -1.660555, 0, 1, 0.4941176, 1,
-0.2523671, 1.151828, -0.5050888, 0, 1, 0.5019608, 1,
-0.2485748, -1.176127, -3.372271, 0, 1, 0.509804, 1,
-0.246761, 1.273999, 0.3411067, 0, 1, 0.5137255, 1,
-0.2338614, -0.2193165, -3.49614, 0, 1, 0.5215687, 1,
-0.2328889, 0.07622955, -2.445611, 0, 1, 0.5254902, 1,
-0.2314627, -1.591974, -1.272324, 0, 1, 0.5333334, 1,
-0.2286528, 1.06745, -1.70565, 0, 1, 0.5372549, 1,
-0.2264023, -0.2170107, -1.620203, 0, 1, 0.5450981, 1,
-0.2256009, 0.7875822, 1.754785, 0, 1, 0.5490196, 1,
-0.2245446, -0.8473766, -4.447367, 0, 1, 0.5568628, 1,
-0.2217058, -0.656127, -4.878213, 0, 1, 0.5607843, 1,
-0.219419, -0.8434169, -1.989375, 0, 1, 0.5686275, 1,
-0.2188967, 0.1524375, -0.3428151, 0, 1, 0.572549, 1,
-0.2110017, 0.2513654, -1.145356, 0, 1, 0.5803922, 1,
-0.2035826, -0.130801, -1.693607, 0, 1, 0.5843138, 1,
-0.203213, -0.2286944, -2.782329, 0, 1, 0.5921569, 1,
-0.1957632, -0.047934, -0.8582203, 0, 1, 0.5960785, 1,
-0.1954007, 0.8546185, -1.683167, 0, 1, 0.6039216, 1,
-0.1940382, 0.9728037, -1.005106, 0, 1, 0.6117647, 1,
-0.1825526, -0.09168169, -0.6493608, 0, 1, 0.6156863, 1,
-0.1805455, 0.01427825, -2.108285, 0, 1, 0.6235294, 1,
-0.1782757, 0.5603395, 2.370635, 0, 1, 0.627451, 1,
-0.1774593, 0.8056997, -2.217063, 0, 1, 0.6352941, 1,
-0.1719819, 0.3453991, -0.175843, 0, 1, 0.6392157, 1,
-0.171646, -1.027204, -2.119597, 0, 1, 0.6470588, 1,
-0.1691858, -0.3464539, -3.77561, 0, 1, 0.6509804, 1,
-0.1631978, 2.549145, -0.9606744, 0, 1, 0.6588235, 1,
-0.1582899, 1.305593, 0.7774447, 0, 1, 0.6627451, 1,
-0.1573227, 1.120958, 0.06678912, 0, 1, 0.6705883, 1,
-0.1519574, 1.063417, 0.3831295, 0, 1, 0.6745098, 1,
-0.1503229, 1.485478, 1.13915, 0, 1, 0.682353, 1,
-0.1498978, -1.034337, -2.857051, 0, 1, 0.6862745, 1,
-0.1483428, 1.168209, 1.14256, 0, 1, 0.6941177, 1,
-0.1473036, -0.4505638, -2.817318, 0, 1, 0.7019608, 1,
-0.1460178, -0.3501939, -2.757699, 0, 1, 0.7058824, 1,
-0.1428963, -0.6624757, -4.393808, 0, 1, 0.7137255, 1,
-0.1421392, 0.05221265, -2.285153, 0, 1, 0.7176471, 1,
-0.1382483, -0.02186276, -2.691097, 0, 1, 0.7254902, 1,
-0.1352215, -1.141705, -4.32788, 0, 1, 0.7294118, 1,
-0.1349948, 0.1854887, -0.7486024, 0, 1, 0.7372549, 1,
-0.1341074, 0.2110859, 0.6701493, 0, 1, 0.7411765, 1,
-0.1335131, 0.5398486, -0.1784131, 0, 1, 0.7490196, 1,
-0.1315912, -0.6348493, -2.837592, 0, 1, 0.7529412, 1,
-0.1303497, -0.2217897, -2.705288, 0, 1, 0.7607843, 1,
-0.121917, -0.03501653, -1.215027, 0, 1, 0.7647059, 1,
-0.117312, 0.6247531, 0.09150118, 0, 1, 0.772549, 1,
-0.109987, 0.3344782, 0.08142981, 0, 1, 0.7764706, 1,
-0.1056082, 0.2682624, 0.6635216, 0, 1, 0.7843137, 1,
-0.1015519, 1.601161, 0.309559, 0, 1, 0.7882353, 1,
-0.1014284, -0.2751153, -1.662835, 0, 1, 0.7960784, 1,
-0.1004022, 0.4668855, -0.6382561, 0, 1, 0.8039216, 1,
-0.09855054, -0.8174476, -2.265386, 0, 1, 0.8078431, 1,
-0.09018503, 0.7335612, -1.129413, 0, 1, 0.8156863, 1,
-0.08875854, 1.761744, 1.22365, 0, 1, 0.8196079, 1,
-0.07698169, 0.208003, -0.007601514, 0, 1, 0.827451, 1,
-0.07512932, 0.1511581, -0.9146936, 0, 1, 0.8313726, 1,
-0.07502933, -0.02149016, -2.009341, 0, 1, 0.8392157, 1,
-0.07199186, 0.5375443, -1.732513, 0, 1, 0.8431373, 1,
-0.07154366, -0.1182216, -3.691988, 0, 1, 0.8509804, 1,
-0.07025012, -0.7139997, -3.08412, 0, 1, 0.854902, 1,
-0.06812732, 0.8201287, -1.224578, 0, 1, 0.8627451, 1,
-0.06283852, -0.453667, -3.30335, 0, 1, 0.8666667, 1,
-0.06096646, 0.2399488, -0.8859923, 0, 1, 0.8745098, 1,
-0.05637893, 2.216629, -0.679841, 0, 1, 0.8784314, 1,
-0.05442154, -0.1218897, -3.418265, 0, 1, 0.8862745, 1,
-0.04837544, 0.0495701, -1.563746, 0, 1, 0.8901961, 1,
-0.04651497, -0.3043935, -3.51802, 0, 1, 0.8980392, 1,
-0.04522224, -0.627571, -2.652497, 0, 1, 0.9058824, 1,
-0.04482654, 0.2057432, 0.1322653, 0, 1, 0.9098039, 1,
-0.03855271, -0.0131981, -3.029079, 0, 1, 0.9176471, 1,
-0.03813075, -0.6812628, -2.559646, 0, 1, 0.9215686, 1,
-0.0361489, 0.9400647, -0.7941784, 0, 1, 0.9294118, 1,
-0.03490205, -0.09422641, -3.665535, 0, 1, 0.9333333, 1,
-0.02685004, -0.3544186, -1.963772, 0, 1, 0.9411765, 1,
-0.02514083, 0.8926008, -2.396704, 0, 1, 0.945098, 1,
-0.02445382, -0.7820986, -3.932826, 0, 1, 0.9529412, 1,
-0.02345945, -0.1651579, -3.492702, 0, 1, 0.9568627, 1,
-0.02289919, -1.222667, -3.121397, 0, 1, 0.9647059, 1,
-0.02198702, -0.5582947, -3.536446, 0, 1, 0.9686275, 1,
-0.01913597, 1.529596, 0.654104, 0, 1, 0.9764706, 1,
-0.01797619, 1.151903, -0.4843442, 0, 1, 0.9803922, 1,
-0.01340524, -0.3999857, -2.576866, 0, 1, 0.9882353, 1,
-0.0109479, 0.1687993, 0.4869074, 0, 1, 0.9921569, 1,
-0.006519463, -0.01736544, -3.421336, 0, 1, 1, 1,
-0.004567201, 1.700241, -0.1107388, 0, 0.9921569, 1, 1,
-0.00228664, 0.5063561, 0.8195509, 0, 0.9882353, 1, 1,
0.0006120342, 0.2614611, -0.01535908, 0, 0.9803922, 1, 1,
0.005448539, -0.6665376, 3.7046, 0, 0.9764706, 1, 1,
0.008237534, -0.9249175, 2.403693, 0, 0.9686275, 1, 1,
0.009224073, -0.3548258, 3.916637, 0, 0.9647059, 1, 1,
0.009226904, -1.850397, 2.965528, 0, 0.9568627, 1, 1,
0.01202411, -0.105014, 1.796005, 0, 0.9529412, 1, 1,
0.01300065, 0.8460951, -0.329785, 0, 0.945098, 1, 1,
0.01462488, 0.8636615, -0.8199196, 0, 0.9411765, 1, 1,
0.01723182, -0.2128339, 2.038385, 0, 0.9333333, 1, 1,
0.02203728, -0.7122975, 2.211805, 0, 0.9294118, 1, 1,
0.02220758, 0.1823503, -0.2400348, 0, 0.9215686, 1, 1,
0.02485332, 0.621704, -0.5853698, 0, 0.9176471, 1, 1,
0.0256116, -0.9030133, 2.336247, 0, 0.9098039, 1, 1,
0.02601628, -1.177528, 1.64599, 0, 0.9058824, 1, 1,
0.03799492, -1.332893, 3.390718, 0, 0.8980392, 1, 1,
0.04340827, 0.8626525, -0.4227149, 0, 0.8901961, 1, 1,
0.04665109, 0.6470314, 1.172665, 0, 0.8862745, 1, 1,
0.04783928, 0.8185977, 0.2909337, 0, 0.8784314, 1, 1,
0.04869299, -0.3113148, 3.868038, 0, 0.8745098, 1, 1,
0.05422528, 0.5625141, 1.654894, 0, 0.8666667, 1, 1,
0.05928946, 0.6754978, 0.4348692, 0, 0.8627451, 1, 1,
0.05972373, -0.05626997, 1.69625, 0, 0.854902, 1, 1,
0.0656663, 0.1323424, 0.8777958, 0, 0.8509804, 1, 1,
0.0698678, -0.2564519, 2.359082, 0, 0.8431373, 1, 1,
0.07453569, 0.436645, 0.05946076, 0, 0.8392157, 1, 1,
0.07538039, -0.2361507, 2.780909, 0, 0.8313726, 1, 1,
0.07552913, -0.2695234, 2.968051, 0, 0.827451, 1, 1,
0.07901182, -0.3143259, 1.269295, 0, 0.8196079, 1, 1,
0.07937516, 0.3966337, 0.3121142, 0, 0.8156863, 1, 1,
0.08141887, -0.268385, 2.503007, 0, 0.8078431, 1, 1,
0.08288092, 0.3021206, -0.4316492, 0, 0.8039216, 1, 1,
0.08522038, 0.6646613, 0.007042915, 0, 0.7960784, 1, 1,
0.08811831, 1.442352, 0.2091234, 0, 0.7882353, 1, 1,
0.08949659, 2.229454, -0.3047414, 0, 0.7843137, 1, 1,
0.08955827, 0.6852719, 1.806494, 0, 0.7764706, 1, 1,
0.09353264, 0.5453969, -0.8752428, 0, 0.772549, 1, 1,
0.09406494, 0.2590817, 1.257131, 0, 0.7647059, 1, 1,
0.1030411, -0.03289593, 2.70391, 0, 0.7607843, 1, 1,
0.1042037, -0.2825422, 2.672826, 0, 0.7529412, 1, 1,
0.1080415, -0.8355291, 1.610299, 0, 0.7490196, 1, 1,
0.1089592, 1.009937, -0.332259, 0, 0.7411765, 1, 1,
0.1139082, -0.2024476, 1.391985, 0, 0.7372549, 1, 1,
0.1209227, -1.537791, 4.7655, 0, 0.7294118, 1, 1,
0.1249197, -0.9607712, 1.888466, 0, 0.7254902, 1, 1,
0.1441806, 0.07465155, -0.4154475, 0, 0.7176471, 1, 1,
0.1475237, -0.5933514, 1.550081, 0, 0.7137255, 1, 1,
0.1515875, 0.7695406, -1.562169, 0, 0.7058824, 1, 1,
0.1546235, 2.435114, -0.07386278, 0, 0.6980392, 1, 1,
0.1560655, 0.4091805, -0.02342527, 0, 0.6941177, 1, 1,
0.1573546, -1.647548, 3.201133, 0, 0.6862745, 1, 1,
0.1618203, 1.649627, -0.2569854, 0, 0.682353, 1, 1,
0.1627358, -0.06282771, 1.756055, 0, 0.6745098, 1, 1,
0.1695513, -1.78319, 2.376482, 0, 0.6705883, 1, 1,
0.1699986, -0.1140436, 4.015577, 0, 0.6627451, 1, 1,
0.1732021, -2.405765, 1.709875, 0, 0.6588235, 1, 1,
0.1733205, -0.7989534, 3.273318, 0, 0.6509804, 1, 1,
0.1739297, 1.441242, -2.245389, 0, 0.6470588, 1, 1,
0.1756171, -0.4034882, 3.208157, 0, 0.6392157, 1, 1,
0.1759254, 0.1326038, 1.005475, 0, 0.6352941, 1, 1,
0.1769797, 1.104091, 0.4994121, 0, 0.627451, 1, 1,
0.1813585, -1.370831, 2.39753, 0, 0.6235294, 1, 1,
0.1851261, 0.8433683, -0.2940863, 0, 0.6156863, 1, 1,
0.1875859, 0.1527578, 0.5811799, 0, 0.6117647, 1, 1,
0.1963111, -0.6692133, 5.095363, 0, 0.6039216, 1, 1,
0.2026457, -0.1450554, 2.126438, 0, 0.5960785, 1, 1,
0.2046718, -0.07346464, 3.16145, 0, 0.5921569, 1, 1,
0.2098407, -2.786042, 4.59409, 0, 0.5843138, 1, 1,
0.2121712, 0.2894522, -0.2389621, 0, 0.5803922, 1, 1,
0.2145067, 0.6434458, 1.082375, 0, 0.572549, 1, 1,
0.2170537, -0.2301067, 3.124412, 0, 0.5686275, 1, 1,
0.2233732, -0.9105948, 1.998397, 0, 0.5607843, 1, 1,
0.2234969, 0.2045399, 1.88481, 0, 0.5568628, 1, 1,
0.2254423, 1.073474, 0.1625763, 0, 0.5490196, 1, 1,
0.2331263, 1.589227, 0.01840261, 0, 0.5450981, 1, 1,
0.2368272, -1.584986, 2.856721, 0, 0.5372549, 1, 1,
0.2399048, 0.6160228, -0.3559241, 0, 0.5333334, 1, 1,
0.240088, 0.5308985, 1.026235, 0, 0.5254902, 1, 1,
0.240259, 0.2140588, 0.2802005, 0, 0.5215687, 1, 1,
0.2407594, 0.4432474, -2.207712, 0, 0.5137255, 1, 1,
0.2434105, -1.091832, 2.598179, 0, 0.509804, 1, 1,
0.2477533, -0.1785964, 1.784267, 0, 0.5019608, 1, 1,
0.2487603, -0.04176042, 2.48741, 0, 0.4941176, 1, 1,
0.2491204, -0.0585218, 2.379285, 0, 0.4901961, 1, 1,
0.2499896, 1.740734, 0.9803079, 0, 0.4823529, 1, 1,
0.2643219, -0.1320469, 3.262479, 0, 0.4784314, 1, 1,
0.266925, -1.508354, 1.282299, 0, 0.4705882, 1, 1,
0.2679353, -0.7666701, 3.154797, 0, 0.4666667, 1, 1,
0.2697418, -1.393912, 1.998836, 0, 0.4588235, 1, 1,
0.2702069, 0.1000955, -0.8169394, 0, 0.454902, 1, 1,
0.2755646, 0.02559151, 0.2737611, 0, 0.4470588, 1, 1,
0.2761705, 2.273028, -0.08938691, 0, 0.4431373, 1, 1,
0.2796787, 0.1164994, 2.567361, 0, 0.4352941, 1, 1,
0.2816312, -1.466007, 3.626934, 0, 0.4313726, 1, 1,
0.2866159, 1.644887, 0.4706895, 0, 0.4235294, 1, 1,
0.2931531, 0.8527423, 2.070567, 0, 0.4196078, 1, 1,
0.2945166, 0.5747328, -0.6981091, 0, 0.4117647, 1, 1,
0.2997745, 1.418996, 0.8262742, 0, 0.4078431, 1, 1,
0.3007519, -1.293278, 2.158937, 0, 0.4, 1, 1,
0.3036005, 0.6375502, 0.7193815, 0, 0.3921569, 1, 1,
0.3044347, -2.195085, 2.086062, 0, 0.3882353, 1, 1,
0.3045637, 0.9393273, -0.008403323, 0, 0.3803922, 1, 1,
0.3069039, 0.4755167, 1.318262, 0, 0.3764706, 1, 1,
0.3125259, 1.003091, 0.4033529, 0, 0.3686275, 1, 1,
0.3131966, -1.784759, 0.4588991, 0, 0.3647059, 1, 1,
0.3157986, 0.3692716, 1.813122, 0, 0.3568628, 1, 1,
0.3178464, 0.1680306, 1.237229, 0, 0.3529412, 1, 1,
0.3197942, -1.070623, 3.24204, 0, 0.345098, 1, 1,
0.3225562, -0.6108752, 2.498495, 0, 0.3411765, 1, 1,
0.3294423, -0.3223317, 2.534914, 0, 0.3333333, 1, 1,
0.3300936, 0.7518786, 2.171569, 0, 0.3294118, 1, 1,
0.3364773, -0.7929568, 4.337137, 0, 0.3215686, 1, 1,
0.3380509, -0.2977048, 2.261636, 0, 0.3176471, 1, 1,
0.3393718, -1.902067, 2.52413, 0, 0.3098039, 1, 1,
0.3425603, 1.553014, 0.3043765, 0, 0.3058824, 1, 1,
0.3436693, 0.359116, 1.036022, 0, 0.2980392, 1, 1,
0.3488746, -1.4865, 2.889764, 0, 0.2901961, 1, 1,
0.3505904, 0.3935487, 0.7082347, 0, 0.2862745, 1, 1,
0.3520536, -1.53911, 3.493102, 0, 0.2784314, 1, 1,
0.3525278, -1.508371, 2.136735, 0, 0.2745098, 1, 1,
0.3634058, 0.6888114, -1.193925, 0, 0.2666667, 1, 1,
0.3648034, -0.2993552, 2.048617, 0, 0.2627451, 1, 1,
0.3665877, 0.3690561, 0.4964036, 0, 0.254902, 1, 1,
0.3669484, -1.476278, 1.6308, 0, 0.2509804, 1, 1,
0.3673986, 0.124495, 0.4598429, 0, 0.2431373, 1, 1,
0.3682958, -0.1801512, 1.661609, 0, 0.2392157, 1, 1,
0.3701591, 0.4627325, 0.2241075, 0, 0.2313726, 1, 1,
0.3789696, -0.4697123, 1.228752, 0, 0.227451, 1, 1,
0.3790579, 0.5152122, -0.01461148, 0, 0.2196078, 1, 1,
0.3935928, -0.6752955, 3.433027, 0, 0.2156863, 1, 1,
0.3946822, -0.364794, 0.9746271, 0, 0.2078431, 1, 1,
0.398724, -0.004450249, 2.737941, 0, 0.2039216, 1, 1,
0.3991187, -0.5566481, 4.026564, 0, 0.1960784, 1, 1,
0.399738, -1.591191, 3.259939, 0, 0.1882353, 1, 1,
0.4003362, 0.1079192, 0.7585155, 0, 0.1843137, 1, 1,
0.4020814, 0.5324144, 0.02182489, 0, 0.1764706, 1, 1,
0.4062259, -1.055909, 1.801309, 0, 0.172549, 1, 1,
0.4083983, 0.05460834, -0.1427803, 0, 0.1647059, 1, 1,
0.4125665, -0.7078559, 3.699363, 0, 0.1607843, 1, 1,
0.4129754, -0.689762, 0.5186095, 0, 0.1529412, 1, 1,
0.4185909, 0.8503366, 0.4768942, 0, 0.1490196, 1, 1,
0.4202811, 0.8840619, 0.4341076, 0, 0.1411765, 1, 1,
0.4219691, -0.7206678, 0.4438507, 0, 0.1372549, 1, 1,
0.422888, 0.602609, 0.2195299, 0, 0.1294118, 1, 1,
0.4275455, 1.081151, 1.223083, 0, 0.1254902, 1, 1,
0.4381418, -0.3851823, 3.028142, 0, 0.1176471, 1, 1,
0.4427646, 0.7504687, 1.556506, 0, 0.1137255, 1, 1,
0.444385, -1.450338, 2.476535, 0, 0.1058824, 1, 1,
0.4458564, -1.175077, 0.8359181, 0, 0.09803922, 1, 1,
0.4490669, 0.4068472, 1.298711, 0, 0.09411765, 1, 1,
0.4491488, 2.150674, -0.5474349, 0, 0.08627451, 1, 1,
0.4527111, 0.2215029, 1.177431, 0, 0.08235294, 1, 1,
0.4537585, 0.5828332, 1.516638, 0, 0.07450981, 1, 1,
0.4543321, 1.445468, -1.234948, 0, 0.07058824, 1, 1,
0.456044, 1.771677, -0.0474581, 0, 0.0627451, 1, 1,
0.4648967, 0.9089931, 1.463544, 0, 0.05882353, 1, 1,
0.4653023, 0.5761282, 0.7776105, 0, 0.05098039, 1, 1,
0.4729559, 0.1208883, 0.7010573, 0, 0.04705882, 1, 1,
0.4747166, -0.9491247, 2.211377, 0, 0.03921569, 1, 1,
0.4754927, -0.5453885, 2.693699, 0, 0.03529412, 1, 1,
0.4793619, 2.093053, 0.9269453, 0, 0.02745098, 1, 1,
0.4817482, -0.7923756, 3.684716, 0, 0.02352941, 1, 1,
0.4825865, 1.363713, -0.6336846, 0, 0.01568628, 1, 1,
0.4830246, -1.527627, 4.273985, 0, 0.01176471, 1, 1,
0.4842563, 0.7743967, -0.2042331, 0, 0.003921569, 1, 1,
0.4856555, -0.4731214, 3.71714, 0.003921569, 0, 1, 1,
0.4874128, 0.9139705, -1.095831, 0.007843138, 0, 1, 1,
0.4888682, 0.1252613, 0.5303798, 0.01568628, 0, 1, 1,
0.4907627, 0.0285008, 3.35331, 0.01960784, 0, 1, 1,
0.493203, -0.8160923, 2.75399, 0.02745098, 0, 1, 1,
0.4940607, 0.1617798, -0.7812582, 0.03137255, 0, 1, 1,
0.4945939, 0.5222, -0.2345152, 0.03921569, 0, 1, 1,
0.4996602, -0.4464256, 2.028381, 0.04313726, 0, 1, 1,
0.4998634, 0.2742647, 1.735509, 0.05098039, 0, 1, 1,
0.5012615, 0.228378, -0.1395126, 0.05490196, 0, 1, 1,
0.5056636, -0.8736686, 3.331835, 0.0627451, 0, 1, 1,
0.5070177, -0.1160272, 3.0525, 0.06666667, 0, 1, 1,
0.5075817, -0.2887884, 3.47014, 0.07450981, 0, 1, 1,
0.5088326, 1.30201, -0.6888252, 0.07843138, 0, 1, 1,
0.5111989, -0.7807019, 3.404002, 0.08627451, 0, 1, 1,
0.5127688, 0.2348064, 0.6042128, 0.09019608, 0, 1, 1,
0.5139006, 1.896612, -0.1138697, 0.09803922, 0, 1, 1,
0.5159582, 0.6499031, 2.088366, 0.1058824, 0, 1, 1,
0.5163525, -0.1294855, 3.116299, 0.1098039, 0, 1, 1,
0.5166078, -0.279616, 0.6351746, 0.1176471, 0, 1, 1,
0.5188015, 0.7270717, 0.4602784, 0.1215686, 0, 1, 1,
0.5223969, 0.8827265, 2.093588, 0.1294118, 0, 1, 1,
0.531431, -0.8342978, 0.5151694, 0.1333333, 0, 1, 1,
0.5316094, 0.3064216, -0.1089076, 0.1411765, 0, 1, 1,
0.5363008, -0.372012, 2.417998, 0.145098, 0, 1, 1,
0.5372873, -0.1916402, 1.417939, 0.1529412, 0, 1, 1,
0.5402718, -1.259331, 1.228741, 0.1568628, 0, 1, 1,
0.5441997, -0.1023457, 1.462339, 0.1647059, 0, 1, 1,
0.5457483, -0.5802745, 1.252917, 0.1686275, 0, 1, 1,
0.5517696, -0.9176077, 3.769696, 0.1764706, 0, 1, 1,
0.552388, -1.603203, 1.397583, 0.1803922, 0, 1, 1,
0.5536784, -0.7458561, 2.460187, 0.1882353, 0, 1, 1,
0.5577944, -0.7911569, 3.257535, 0.1921569, 0, 1, 1,
0.5608221, -0.9109139, 4.045567, 0.2, 0, 1, 1,
0.564018, -0.03061447, 2.731805, 0.2078431, 0, 1, 1,
0.5676394, 0.5957477, -0.1469986, 0.2117647, 0, 1, 1,
0.5685542, 0.9942415, -0.6280753, 0.2196078, 0, 1, 1,
0.5783014, -0.7873973, 2.552426, 0.2235294, 0, 1, 1,
0.5790672, 1.19672, -1.034838, 0.2313726, 0, 1, 1,
0.5791, 0.90648, 1.195767, 0.2352941, 0, 1, 1,
0.5797192, 0.4469222, 2.238773, 0.2431373, 0, 1, 1,
0.5801565, 0.7807835, 3.013679, 0.2470588, 0, 1, 1,
0.5839966, 0.05036619, 2.717381, 0.254902, 0, 1, 1,
0.5898479, -1.35822, 4.153616, 0.2588235, 0, 1, 1,
0.5924959, 0.6760562, 0.41915, 0.2666667, 0, 1, 1,
0.5958028, -0.3280595, 1.598777, 0.2705882, 0, 1, 1,
0.6023481, -1.231029, 3.345157, 0.2784314, 0, 1, 1,
0.6052873, 1.531384, 1.033716, 0.282353, 0, 1, 1,
0.6096643, 0.3198488, 1.411171, 0.2901961, 0, 1, 1,
0.6098853, -1.133442, 2.500933, 0.2941177, 0, 1, 1,
0.6103225, -0.01553359, 2.761752, 0.3019608, 0, 1, 1,
0.6229386, 1.297597, 1.501364, 0.3098039, 0, 1, 1,
0.6234186, -1.407679, 2.220098, 0.3137255, 0, 1, 1,
0.6237054, -1.087746, 3.499077, 0.3215686, 0, 1, 1,
0.6248297, -0.4288628, 1.654629, 0.3254902, 0, 1, 1,
0.6256815, -1.107795, 1.09547, 0.3333333, 0, 1, 1,
0.6258247, 0.05776083, 2.835864, 0.3372549, 0, 1, 1,
0.6258694, -0.7704401, 1.426506, 0.345098, 0, 1, 1,
0.6283247, 1.182012, 0.7521003, 0.3490196, 0, 1, 1,
0.631852, -1.839334, 5.364556, 0.3568628, 0, 1, 1,
0.634892, 1.238077, 0.4872645, 0.3607843, 0, 1, 1,
0.6376724, -0.7349542, 2.745774, 0.3686275, 0, 1, 1,
0.6435663, -0.7063138, 2.495795, 0.372549, 0, 1, 1,
0.6449082, 0.7137941, 1.615175, 0.3803922, 0, 1, 1,
0.6481081, -1.423575, 0.2413234, 0.3843137, 0, 1, 1,
0.6535278, -1.820043, 4.160971, 0.3921569, 0, 1, 1,
0.6616573, 1.206596, 1.586662, 0.3960784, 0, 1, 1,
0.6645636, -0.3047446, 0.9710495, 0.4039216, 0, 1, 1,
0.6672705, 0.6400216, 0.7821469, 0.4117647, 0, 1, 1,
0.6673828, 0.5569833, 0.6908576, 0.4156863, 0, 1, 1,
0.6715636, -0.559752, 1.801964, 0.4235294, 0, 1, 1,
0.6729155, -0.7427721, 3.133444, 0.427451, 0, 1, 1,
0.6734289, 1.235934, -1.273353, 0.4352941, 0, 1, 1,
0.6740954, 0.4211302, -0.3422125, 0.4392157, 0, 1, 1,
0.6752447, 0.8267692, 0.6513919, 0.4470588, 0, 1, 1,
0.6794461, 1.876522, -0.1470739, 0.4509804, 0, 1, 1,
0.6830247, -0.8312078, 4.001825, 0.4588235, 0, 1, 1,
0.6853758, 1.203368, 1.831653, 0.4627451, 0, 1, 1,
0.6867166, 0.6401243, -1.869927, 0.4705882, 0, 1, 1,
0.6886984, 0.1967377, 1.542142, 0.4745098, 0, 1, 1,
0.6909435, 0.006581003, 1.429471, 0.4823529, 0, 1, 1,
0.6909688, 0.02243136, 0.622731, 0.4862745, 0, 1, 1,
0.6909819, 0.6703323, -0.2475262, 0.4941176, 0, 1, 1,
0.6954467, -0.1012006, 2.076513, 0.5019608, 0, 1, 1,
0.6984169, 2.064291, -0.7296602, 0.5058824, 0, 1, 1,
0.7015752, 0.3545908, 1.165238, 0.5137255, 0, 1, 1,
0.7054109, -0.6279119, 3.454084, 0.5176471, 0, 1, 1,
0.7064182, 0.1128325, 0.7196907, 0.5254902, 0, 1, 1,
0.7128287, 1.557075, 0.5916911, 0.5294118, 0, 1, 1,
0.7128911, -0.2490944, 1.597982, 0.5372549, 0, 1, 1,
0.7138635, 0.6862568, 0.3107432, 0.5411765, 0, 1, 1,
0.7171469, 0.6517264, 1.18594, 0.5490196, 0, 1, 1,
0.7182527, -1.448166, 2.40487, 0.5529412, 0, 1, 1,
0.7194108, 0.2780757, 3.214249, 0.5607843, 0, 1, 1,
0.725092, -0.4608417, 2.005505, 0.5647059, 0, 1, 1,
0.7347031, -0.4090477, 2.113796, 0.572549, 0, 1, 1,
0.7355722, -0.2152767, 1.686027, 0.5764706, 0, 1, 1,
0.745239, 1.038882, 0.9241241, 0.5843138, 0, 1, 1,
0.7457926, 2.545984, 0.0859623, 0.5882353, 0, 1, 1,
0.7459584, -1.774119, 1.46908, 0.5960785, 0, 1, 1,
0.752466, 0.3330851, 2.176245, 0.6039216, 0, 1, 1,
0.7583655, -0.4393254, 3.232936, 0.6078432, 0, 1, 1,
0.7702786, 0.07169796, 1.669151, 0.6156863, 0, 1, 1,
0.7709559, 0.272623, 1.41938, 0.6196079, 0, 1, 1,
0.7742482, 1.423966, -0.1483672, 0.627451, 0, 1, 1,
0.7785891, -0.8013843, 3.572802, 0.6313726, 0, 1, 1,
0.7815853, 0.2800023, -0.1634658, 0.6392157, 0, 1, 1,
0.7841871, 3.311817, -0.6682599, 0.6431373, 0, 1, 1,
0.7883543, -0.5887969, 2.943357, 0.6509804, 0, 1, 1,
0.792127, 0.1130962, -0.301192, 0.654902, 0, 1, 1,
0.7934669, 0.8948688, 1.578805, 0.6627451, 0, 1, 1,
0.7955888, -0.1260978, 0.2913741, 0.6666667, 0, 1, 1,
0.7958227, 1.328868, 0.8900716, 0.6745098, 0, 1, 1,
0.7970623, -0.1470939, 3.840942, 0.6784314, 0, 1, 1,
0.7990069, 0.4861361, 1.976755, 0.6862745, 0, 1, 1,
0.7996662, 0.6611742, 3.072177, 0.6901961, 0, 1, 1,
0.7997158, 2.359843, 0.3107044, 0.6980392, 0, 1, 1,
0.800193, -0.9105985, 2.629542, 0.7058824, 0, 1, 1,
0.8008692, 0.6268235, 0.7154167, 0.7098039, 0, 1, 1,
0.810087, -1.123473, 2.002721, 0.7176471, 0, 1, 1,
0.8121076, -0.7700188, 0.8003858, 0.7215686, 0, 1, 1,
0.8165746, 1.102676, 0.2932278, 0.7294118, 0, 1, 1,
0.8233169, 0.8597888, 2.389096, 0.7333333, 0, 1, 1,
0.8251276, -0.1213537, 0.8090206, 0.7411765, 0, 1, 1,
0.8261377, 0.1853612, 2.592605, 0.7450981, 0, 1, 1,
0.8343288, 0.2692422, 1.016317, 0.7529412, 0, 1, 1,
0.8359095, 0.8045188, 1.462924, 0.7568628, 0, 1, 1,
0.8456364, 0.7417225, 0.313044, 0.7647059, 0, 1, 1,
0.8467922, -0.3909566, 2.196309, 0.7686275, 0, 1, 1,
0.8471102, -0.7043425, 1.969427, 0.7764706, 0, 1, 1,
0.8493039, -1.171034, 1.235143, 0.7803922, 0, 1, 1,
0.8575222, -1.254579, 1.904409, 0.7882353, 0, 1, 1,
0.8591895, -1.746728, 4.176439, 0.7921569, 0, 1, 1,
0.859996, -0.3699421, 1.899465, 0.8, 0, 1, 1,
0.8655743, -0.1968033, 2.803643, 0.8078431, 0, 1, 1,
0.870487, 0.6360606, 1.500129, 0.8117647, 0, 1, 1,
0.8705279, 1.111748, 2.056788, 0.8196079, 0, 1, 1,
0.8709558, -0.1883643, -0.1071785, 0.8235294, 0, 1, 1,
0.8719769, -0.3161342, 1.658033, 0.8313726, 0, 1, 1,
0.8725579, -0.08327515, 2.952185, 0.8352941, 0, 1, 1,
0.8752038, -1.106844, 2.412254, 0.8431373, 0, 1, 1,
0.8782976, 0.4067655, 0.9764395, 0.8470588, 0, 1, 1,
0.8807067, -1.178842, 2.582581, 0.854902, 0, 1, 1,
0.8813584, 0.8484413, 0.4458282, 0.8588235, 0, 1, 1,
0.8845269, 0.02000961, 0.9928014, 0.8666667, 0, 1, 1,
0.8872644, -1.165303, 2.327439, 0.8705882, 0, 1, 1,
0.8921391, -0.1903614, 0.9445997, 0.8784314, 0, 1, 1,
0.8935755, 1.726045, 1.959654, 0.8823529, 0, 1, 1,
0.8969776, 0.4584694, 0.249716, 0.8901961, 0, 1, 1,
0.8978619, 1.467318, -0.2035468, 0.8941177, 0, 1, 1,
0.9112301, 1.614139, 0.6646255, 0.9019608, 0, 1, 1,
0.912219, 0.3906402, -0.5404544, 0.9098039, 0, 1, 1,
0.9126514, 0.2775485, 1.105814, 0.9137255, 0, 1, 1,
0.9152289, 0.6595734, 0.9347267, 0.9215686, 0, 1, 1,
0.917778, 0.1042775, 0.1606083, 0.9254902, 0, 1, 1,
0.9198646, 0.9502928, 2.111443, 0.9333333, 0, 1, 1,
0.9298841, -1.829943, 2.801297, 0.9372549, 0, 1, 1,
0.9355319, -0.5491222, 3.060581, 0.945098, 0, 1, 1,
0.9427562, 0.2086222, 0.5934938, 0.9490196, 0, 1, 1,
0.9477317, 0.1343542, 0.845106, 0.9568627, 0, 1, 1,
0.9487755, 1.07809, -0.3500687, 0.9607843, 0, 1, 1,
0.9530234, 0.627082, -0.1490732, 0.9686275, 0, 1, 1,
0.9537134, -0.04099147, 1.625723, 0.972549, 0, 1, 1,
0.9673393, 0.2797451, 0.8443205, 0.9803922, 0, 1, 1,
0.9702868, -0.004368986, 0.7498295, 0.9843137, 0, 1, 1,
0.9728794, -1.588471, 2.437122, 0.9921569, 0, 1, 1,
0.9759867, -0.3917795, 3.319394, 0.9960784, 0, 1, 1,
0.9863844, -0.259843, -0.1238705, 1, 0, 0.9960784, 1,
0.9885926, -0.2623298, 2.469671, 1, 0, 0.9882353, 1,
0.9930006, -0.6464079, 1.89967, 1, 0, 0.9843137, 1,
0.9973456, -0.7460068, 1.359625, 1, 0, 0.9764706, 1,
1.003253, -0.06616765, 2.979189, 1, 0, 0.972549, 1,
1.012847, 0.3068425, 0.5141035, 1, 0, 0.9647059, 1,
1.016546, 0.2132781, 0.108989, 1, 0, 0.9607843, 1,
1.02321, -0.5588437, 2.563399, 1, 0, 0.9529412, 1,
1.024727, -0.4780966, 1.822215, 1, 0, 0.9490196, 1,
1.025123, -1.450081, 1.317181, 1, 0, 0.9411765, 1,
1.02844, 2.239295, 2.574742, 1, 0, 0.9372549, 1,
1.039106, -0.5670442, 1.024863, 1, 0, 0.9294118, 1,
1.046183, -0.5342841, 2.956803, 1, 0, 0.9254902, 1,
1.046403, -0.9303542, 0.7291781, 1, 0, 0.9176471, 1,
1.047289, 0.3529761, 0.388536, 1, 0, 0.9137255, 1,
1.05301, 0.4095829, 1.710753, 1, 0, 0.9058824, 1,
1.07029, 0.3566824, 1.025581, 1, 0, 0.9019608, 1,
1.075255, -0.923351, 2.907347, 1, 0, 0.8941177, 1,
1.091663, -1.140988, 1.226091, 1, 0, 0.8862745, 1,
1.112341, 0.9437907, 0.3058988, 1, 0, 0.8823529, 1,
1.113289, -2.307171, 1.985598, 1, 0, 0.8745098, 1,
1.115184, -0.8877747, 1.655714, 1, 0, 0.8705882, 1,
1.124506, -0.2278775, 0.907768, 1, 0, 0.8627451, 1,
1.124535, -0.4671136, 3.097814, 1, 0, 0.8588235, 1,
1.126131, -0.6570406, 1.01331, 1, 0, 0.8509804, 1,
1.126508, 0.03937203, 0.8353487, 1, 0, 0.8470588, 1,
1.129128, 0.861602, -0.783381, 1, 0, 0.8392157, 1,
1.133346, -0.8045602, 2.664957, 1, 0, 0.8352941, 1,
1.135044, -0.1622252, 1.576698, 1, 0, 0.827451, 1,
1.139868, -0.354637, 0.6365249, 1, 0, 0.8235294, 1,
1.152395, -1.691414, 2.760206, 1, 0, 0.8156863, 1,
1.15678, 0.2333104, 0.5311874, 1, 0, 0.8117647, 1,
1.164925, -0.9292539, 0.9074784, 1, 0, 0.8039216, 1,
1.165112, -1.516773, 1.797934, 1, 0, 0.7960784, 1,
1.171815, 0.007750122, 1.420156, 1, 0, 0.7921569, 1,
1.178169, -0.6176475, 1.902337, 1, 0, 0.7843137, 1,
1.1795, 0.02284642, 1.923722, 1, 0, 0.7803922, 1,
1.182009, 0.5808659, 0.7804161, 1, 0, 0.772549, 1,
1.182142, 0.2294021, 1.309669, 1, 0, 0.7686275, 1,
1.183246, -0.777221, 1.967824, 1, 0, 0.7607843, 1,
1.191246, 1.389704, 0.3548709, 1, 0, 0.7568628, 1,
1.1956, 0.602129, 0.9771619, 1, 0, 0.7490196, 1,
1.203878, 0.646557, 1.611271, 1, 0, 0.7450981, 1,
1.20486, 0.7948125, 0.8345872, 1, 0, 0.7372549, 1,
1.207295, 1.079554, 3.052682, 1, 0, 0.7333333, 1,
1.227477, 1.598099, 0.3378411, 1, 0, 0.7254902, 1,
1.229083, -0.3450149, 2.052781, 1, 0, 0.7215686, 1,
1.23538, 1.489308, -0.2605045, 1, 0, 0.7137255, 1,
1.235408, -0.2522462, 2.364923, 1, 0, 0.7098039, 1,
1.238132, -0.06339926, 2.026098, 1, 0, 0.7019608, 1,
1.240326, -0.1217248, 1.471245, 1, 0, 0.6941177, 1,
1.249376, 0.1254182, 2.467522, 1, 0, 0.6901961, 1,
1.252243, -0.230746, 2.439687, 1, 0, 0.682353, 1,
1.257512, -1.293064, 1.262511, 1, 0, 0.6784314, 1,
1.257837, 0.4999153, 1.723283, 1, 0, 0.6705883, 1,
1.264192, 0.07399236, 0.5152432, 1, 0, 0.6666667, 1,
1.264577, -0.3001367, 3.488726, 1, 0, 0.6588235, 1,
1.266267, 0.09905813, 2.657665, 1, 0, 0.654902, 1,
1.270445, -0.4322923, 1.306848, 1, 0, 0.6470588, 1,
1.270463, 0.3579615, 1.389351, 1, 0, 0.6431373, 1,
1.27323, 1.204462, 1.77237, 1, 0, 0.6352941, 1,
1.274601, -0.8436848, 1.923895, 1, 0, 0.6313726, 1,
1.308784, -0.0377469, 3.012877, 1, 0, 0.6235294, 1,
1.313035, -0.2246107, 0.3572065, 1, 0, 0.6196079, 1,
1.317154, 0.4607927, 3.709545, 1, 0, 0.6117647, 1,
1.323329, -0.7168823, 1.975619, 1, 0, 0.6078432, 1,
1.329672, 0.7138056, -0.1932819, 1, 0, 0.6, 1,
1.330668, -0.5498195, 2.433717, 1, 0, 0.5921569, 1,
1.330966, -1.081647, 3.490659, 1, 0, 0.5882353, 1,
1.335001, 1.856429, 0.8570156, 1, 0, 0.5803922, 1,
1.349844, -0.2309978, 3.571342, 1, 0, 0.5764706, 1,
1.353954, -1.022597, 2.485555, 1, 0, 0.5686275, 1,
1.354697, -0.08078673, 1.631174, 1, 0, 0.5647059, 1,
1.363275, 0.1257645, 0.7020656, 1, 0, 0.5568628, 1,
1.376346, 1.620198, 0.8244758, 1, 0, 0.5529412, 1,
1.38803, 1.50889, -0.3777212, 1, 0, 0.5450981, 1,
1.397447, -1.244151, 1.017973, 1, 0, 0.5411765, 1,
1.402841, 0.7437561, 0.737615, 1, 0, 0.5333334, 1,
1.40908, 0.4116807, -0.1138027, 1, 0, 0.5294118, 1,
1.409238, -0.2818611, 0.6624421, 1, 0, 0.5215687, 1,
1.420513, -0.4463397, 1.646672, 1, 0, 0.5176471, 1,
1.423687, 0.09962986, 1.300717, 1, 0, 0.509804, 1,
1.426442, -0.007456586, 1.110463, 1, 0, 0.5058824, 1,
1.427941, 0.2491071, 1.998588, 1, 0, 0.4980392, 1,
1.42832, 0.436756, 1.802344, 1, 0, 0.4901961, 1,
1.445801, -0.1653109, 2.549809, 1, 0, 0.4862745, 1,
1.452892, 2.81718, 2.330858, 1, 0, 0.4784314, 1,
1.4534, 0.07304612, 1.696494, 1, 0, 0.4745098, 1,
1.46786, -0.7623749, 1.262368, 1, 0, 0.4666667, 1,
1.478964, -1.727356, 2.177575, 1, 0, 0.4627451, 1,
1.479316, -0.9840612, 2.068845, 1, 0, 0.454902, 1,
1.498888, -0.4356161, 3.801404, 1, 0, 0.4509804, 1,
1.505854, 0.3982703, 0.4344355, 1, 0, 0.4431373, 1,
1.505947, -0.8620334, 1.917975, 1, 0, 0.4392157, 1,
1.506261, 0.403397, 0.09136539, 1, 0, 0.4313726, 1,
1.511455, 1.652329, 0.7589353, 1, 0, 0.427451, 1,
1.520663, 0.476364, 0.3667193, 1, 0, 0.4196078, 1,
1.521598, 1.314588, -0.04970681, 1, 0, 0.4156863, 1,
1.532037, -1.004187, 2.66836, 1, 0, 0.4078431, 1,
1.542618, 0.5323738, 2.325709, 1, 0, 0.4039216, 1,
1.56487, -1.252762, 5.083566, 1, 0, 0.3960784, 1,
1.573395, -0.8163874, 3.574816, 1, 0, 0.3882353, 1,
1.581267, 0.9314159, 0.4047401, 1, 0, 0.3843137, 1,
1.587799, -0.6186897, 2.375832, 1, 0, 0.3764706, 1,
1.5892, 0.8732308, 2.795418, 1, 0, 0.372549, 1,
1.598207, -0.513023, 1.974892, 1, 0, 0.3647059, 1,
1.60024, 1.71202, 0.9586647, 1, 0, 0.3607843, 1,
1.600552, 1.499547, 0.2544162, 1, 0, 0.3529412, 1,
1.602308, 0.5170959, -0.8830409, 1, 0, 0.3490196, 1,
1.611943, -1.546844, 1.144889, 1, 0, 0.3411765, 1,
1.615865, -0.7546933, 2.759787, 1, 0, 0.3372549, 1,
1.625942, 1.961551, 2.715633, 1, 0, 0.3294118, 1,
1.631382, -0.4221087, 1.570827, 1, 0, 0.3254902, 1,
1.642986, 1.696133, 1.221351, 1, 0, 0.3176471, 1,
1.660301, 0.8762564, 2.195742, 1, 0, 0.3137255, 1,
1.669966, -0.2685921, -0.03903733, 1, 0, 0.3058824, 1,
1.675561, 0.2591895, 2.018634, 1, 0, 0.2980392, 1,
1.677353, 1.013263, -1.084982, 1, 0, 0.2941177, 1,
1.692032, 2.363332, 1.47385, 1, 0, 0.2862745, 1,
1.693676, -0.566355, 0.7202448, 1, 0, 0.282353, 1,
1.698791, -0.6045372, 2.506882, 1, 0, 0.2745098, 1,
1.70496, 0.2480677, 1.827235, 1, 0, 0.2705882, 1,
1.725226, -0.02949911, 1.632652, 1, 0, 0.2627451, 1,
1.741094, -0.838788, 3.295969, 1, 0, 0.2588235, 1,
1.745896, -1.048821, 2.668054, 1, 0, 0.2509804, 1,
1.775604, 0.7308251, 1.143272, 1, 0, 0.2470588, 1,
1.784045, -0.01770333, 0.01403614, 1, 0, 0.2392157, 1,
1.78768, -0.6801035, 1.739032, 1, 0, 0.2352941, 1,
1.789733, 0.2462726, 2.663435, 1, 0, 0.227451, 1,
1.806423, 0.4842958, 2.717806, 1, 0, 0.2235294, 1,
1.826506, -1.628698, 3.161791, 1, 0, 0.2156863, 1,
1.826843, -0.4600736, 2.148345, 1, 0, 0.2117647, 1,
1.855274, 1.805702, 2.654819, 1, 0, 0.2039216, 1,
1.865642, 0.04465701, 4.208369, 1, 0, 0.1960784, 1,
1.893592, -0.8364392, 3.700187, 1, 0, 0.1921569, 1,
1.895474, -1.632658, 2.737029, 1, 0, 0.1843137, 1,
1.912123, 0.6155419, 2.924721, 1, 0, 0.1803922, 1,
1.924112, -0.5320295, 0.1183414, 1, 0, 0.172549, 1,
1.961005, 0.5212483, 0.5636118, 1, 0, 0.1686275, 1,
1.966258, -0.2551648, 0.156341, 1, 0, 0.1607843, 1,
1.984371, -1.211807, 2.558593, 1, 0, 0.1568628, 1,
1.988776, -0.1448461, 1.493703, 1, 0, 0.1490196, 1,
2.026357, 0.1114884, 0.9847856, 1, 0, 0.145098, 1,
2.02887, 2.096694, 0.6399572, 1, 0, 0.1372549, 1,
2.030993, -0.08229265, 1.719573, 1, 0, 0.1333333, 1,
2.068751, 0.5926883, 2.373416, 1, 0, 0.1254902, 1,
2.082442, 0.9234409, 2.360351, 1, 0, 0.1215686, 1,
2.083738, -0.8806046, 3.179679, 1, 0, 0.1137255, 1,
2.101162, -1.825586, 0.7281054, 1, 0, 0.1098039, 1,
2.124214, -0.6341659, 1.286013, 1, 0, 0.1019608, 1,
2.17686, -1.182506, 1.620563, 1, 0, 0.09411765, 1,
2.191512, -1.998315, 0.4387456, 1, 0, 0.09019608, 1,
2.221552, -0.69414, 1.72274, 1, 0, 0.08235294, 1,
2.28082, 0.7765261, -0.231057, 1, 0, 0.07843138, 1,
2.353348, -0.2799567, 2.028344, 1, 0, 0.07058824, 1,
2.363423, -0.5434715, -1.128846, 1, 0, 0.06666667, 1,
2.377704, -0.6630933, 0.2035481, 1, 0, 0.05882353, 1,
2.384521, 0.2749948, 1.552723, 1, 0, 0.05490196, 1,
2.393479, 1.459948, -0.9676151, 1, 0, 0.04705882, 1,
2.439588, -0.8918952, 3.000956, 1, 0, 0.04313726, 1,
2.567334, -0.1033224, 1.857174, 1, 0, 0.03529412, 1,
2.743842, 0.2966943, 0.2676637, 1, 0, 0.03137255, 1,
2.820913, -0.9969778, 0.3326169, 1, 0, 0.02352941, 1,
2.910779, -0.6694584, 1.022975, 1, 0, 0.01960784, 1,
3.034017, -1.726704, 3.672608, 1, 0, 0.01176471, 1,
3.358105, 0.5193954, 0.3251406, 1, 0, 0.007843138, 1
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
-0.1227839, -4.295717, -8.127689, 0, -0.5, 0.5, 0.5,
-0.1227839, -4.295717, -8.127689, 1, -0.5, 0.5, 0.5,
-0.1227839, -4.295717, -8.127689, 1, 1.5, 0.5, 0.5,
-0.1227839, -4.295717, -8.127689, 0, 1.5, 0.5, 0.5
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
-4.783694, 0.05934429, -8.127689, 0, -0.5, 0.5, 0.5,
-4.783694, 0.05934429, -8.127689, 1, -0.5, 0.5, 0.5,
-4.783694, 0.05934429, -8.127689, 1, 1.5, 0.5, 0.5,
-4.783694, 0.05934429, -8.127689, 0, 1.5, 0.5, 0.5
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
-4.783694, -4.295717, -0.4038262, 0, -0.5, 0.5, 0.5,
-4.783694, -4.295717, -0.4038262, 1, -0.5, 0.5, 0.5,
-4.783694, -4.295717, -0.4038262, 1, 1.5, 0.5, 0.5,
-4.783694, -4.295717, -0.4038262, 0, 1.5, 0.5, 0.5
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
-3, -3.290703, -6.34526,
3, -3.290703, -6.34526,
-3, -3.290703, -6.34526,
-3, -3.458205, -6.642332,
-2, -3.290703, -6.34526,
-2, -3.458205, -6.642332,
-1, -3.290703, -6.34526,
-1, -3.458205, -6.642332,
0, -3.290703, -6.34526,
0, -3.458205, -6.642332,
1, -3.290703, -6.34526,
1, -3.458205, -6.642332,
2, -3.290703, -6.34526,
2, -3.458205, -6.642332,
3, -3.290703, -6.34526,
3, -3.458205, -6.642332
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
-3, -3.79321, -7.236475, 0, -0.5, 0.5, 0.5,
-3, -3.79321, -7.236475, 1, -0.5, 0.5, 0.5,
-3, -3.79321, -7.236475, 1, 1.5, 0.5, 0.5,
-3, -3.79321, -7.236475, 0, 1.5, 0.5, 0.5,
-2, -3.79321, -7.236475, 0, -0.5, 0.5, 0.5,
-2, -3.79321, -7.236475, 1, -0.5, 0.5, 0.5,
-2, -3.79321, -7.236475, 1, 1.5, 0.5, 0.5,
-2, -3.79321, -7.236475, 0, 1.5, 0.5, 0.5,
-1, -3.79321, -7.236475, 0, -0.5, 0.5, 0.5,
-1, -3.79321, -7.236475, 1, -0.5, 0.5, 0.5,
-1, -3.79321, -7.236475, 1, 1.5, 0.5, 0.5,
-1, -3.79321, -7.236475, 0, 1.5, 0.5, 0.5,
0, -3.79321, -7.236475, 0, -0.5, 0.5, 0.5,
0, -3.79321, -7.236475, 1, -0.5, 0.5, 0.5,
0, -3.79321, -7.236475, 1, 1.5, 0.5, 0.5,
0, -3.79321, -7.236475, 0, 1.5, 0.5, 0.5,
1, -3.79321, -7.236475, 0, -0.5, 0.5, 0.5,
1, -3.79321, -7.236475, 1, -0.5, 0.5, 0.5,
1, -3.79321, -7.236475, 1, 1.5, 0.5, 0.5,
1, -3.79321, -7.236475, 0, 1.5, 0.5, 0.5,
2, -3.79321, -7.236475, 0, -0.5, 0.5, 0.5,
2, -3.79321, -7.236475, 1, -0.5, 0.5, 0.5,
2, -3.79321, -7.236475, 1, 1.5, 0.5, 0.5,
2, -3.79321, -7.236475, 0, 1.5, 0.5, 0.5,
3, -3.79321, -7.236475, 0, -0.5, 0.5, 0.5,
3, -3.79321, -7.236475, 1, -0.5, 0.5, 0.5,
3, -3.79321, -7.236475, 1, 1.5, 0.5, 0.5,
3, -3.79321, -7.236475, 0, 1.5, 0.5, 0.5
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
-3.708099, -3, -6.34526,
-3.708099, 3, -6.34526,
-3.708099, -3, -6.34526,
-3.887365, -3, -6.642332,
-3.708099, -2, -6.34526,
-3.887365, -2, -6.642332,
-3.708099, -1, -6.34526,
-3.887365, -1, -6.642332,
-3.708099, 0, -6.34526,
-3.887365, 0, -6.642332,
-3.708099, 1, -6.34526,
-3.887365, 1, -6.642332,
-3.708099, 2, -6.34526,
-3.887365, 2, -6.642332,
-3.708099, 3, -6.34526,
-3.887365, 3, -6.642332
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
-4.245897, -3, -7.236475, 0, -0.5, 0.5, 0.5,
-4.245897, -3, -7.236475, 1, -0.5, 0.5, 0.5,
-4.245897, -3, -7.236475, 1, 1.5, 0.5, 0.5,
-4.245897, -3, -7.236475, 0, 1.5, 0.5, 0.5,
-4.245897, -2, -7.236475, 0, -0.5, 0.5, 0.5,
-4.245897, -2, -7.236475, 1, -0.5, 0.5, 0.5,
-4.245897, -2, -7.236475, 1, 1.5, 0.5, 0.5,
-4.245897, -2, -7.236475, 0, 1.5, 0.5, 0.5,
-4.245897, -1, -7.236475, 0, -0.5, 0.5, 0.5,
-4.245897, -1, -7.236475, 1, -0.5, 0.5, 0.5,
-4.245897, -1, -7.236475, 1, 1.5, 0.5, 0.5,
-4.245897, -1, -7.236475, 0, 1.5, 0.5, 0.5,
-4.245897, 0, -7.236475, 0, -0.5, 0.5, 0.5,
-4.245897, 0, -7.236475, 1, -0.5, 0.5, 0.5,
-4.245897, 0, -7.236475, 1, 1.5, 0.5, 0.5,
-4.245897, 0, -7.236475, 0, 1.5, 0.5, 0.5,
-4.245897, 1, -7.236475, 0, -0.5, 0.5, 0.5,
-4.245897, 1, -7.236475, 1, -0.5, 0.5, 0.5,
-4.245897, 1, -7.236475, 1, 1.5, 0.5, 0.5,
-4.245897, 1, -7.236475, 0, 1.5, 0.5, 0.5,
-4.245897, 2, -7.236475, 0, -0.5, 0.5, 0.5,
-4.245897, 2, -7.236475, 1, -0.5, 0.5, 0.5,
-4.245897, 2, -7.236475, 1, 1.5, 0.5, 0.5,
-4.245897, 2, -7.236475, 0, 1.5, 0.5, 0.5,
-4.245897, 3, -7.236475, 0, -0.5, 0.5, 0.5,
-4.245897, 3, -7.236475, 1, -0.5, 0.5, 0.5,
-4.245897, 3, -7.236475, 1, 1.5, 0.5, 0.5,
-4.245897, 3, -7.236475, 0, 1.5, 0.5, 0.5
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
-3.708099, -3.290703, -6,
-3.708099, -3.290703, 4,
-3.708099, -3.290703, -6,
-3.887365, -3.458205, -6,
-3.708099, -3.290703, -4,
-3.887365, -3.458205, -4,
-3.708099, -3.290703, -2,
-3.887365, -3.458205, -2,
-3.708099, -3.290703, 0,
-3.887365, -3.458205, 0,
-3.708099, -3.290703, 2,
-3.887365, -3.458205, 2,
-3.708099, -3.290703, 4,
-3.887365, -3.458205, 4
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
-4.245897, -3.79321, -6, 0, -0.5, 0.5, 0.5,
-4.245897, -3.79321, -6, 1, -0.5, 0.5, 0.5,
-4.245897, -3.79321, -6, 1, 1.5, 0.5, 0.5,
-4.245897, -3.79321, -6, 0, 1.5, 0.5, 0.5,
-4.245897, -3.79321, -4, 0, -0.5, 0.5, 0.5,
-4.245897, -3.79321, -4, 1, -0.5, 0.5, 0.5,
-4.245897, -3.79321, -4, 1, 1.5, 0.5, 0.5,
-4.245897, -3.79321, -4, 0, 1.5, 0.5, 0.5,
-4.245897, -3.79321, -2, 0, -0.5, 0.5, 0.5,
-4.245897, -3.79321, -2, 1, -0.5, 0.5, 0.5,
-4.245897, -3.79321, -2, 1, 1.5, 0.5, 0.5,
-4.245897, -3.79321, -2, 0, 1.5, 0.5, 0.5,
-4.245897, -3.79321, 0, 0, -0.5, 0.5, 0.5,
-4.245897, -3.79321, 0, 1, -0.5, 0.5, 0.5,
-4.245897, -3.79321, 0, 1, 1.5, 0.5, 0.5,
-4.245897, -3.79321, 0, 0, 1.5, 0.5, 0.5,
-4.245897, -3.79321, 2, 0, -0.5, 0.5, 0.5,
-4.245897, -3.79321, 2, 1, -0.5, 0.5, 0.5,
-4.245897, -3.79321, 2, 1, 1.5, 0.5, 0.5,
-4.245897, -3.79321, 2, 0, 1.5, 0.5, 0.5,
-4.245897, -3.79321, 4, 0, -0.5, 0.5, 0.5,
-4.245897, -3.79321, 4, 1, -0.5, 0.5, 0.5,
-4.245897, -3.79321, 4, 1, 1.5, 0.5, 0.5,
-4.245897, -3.79321, 4, 0, 1.5, 0.5, 0.5
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
-3.708099, -3.290703, -6.34526,
-3.708099, 3.409391, -6.34526,
-3.708099, -3.290703, 5.537607,
-3.708099, 3.409391, 5.537607,
-3.708099, -3.290703, -6.34526,
-3.708099, -3.290703, 5.537607,
-3.708099, 3.409391, -6.34526,
-3.708099, 3.409391, 5.537607,
-3.708099, -3.290703, -6.34526,
3.462532, -3.290703, -6.34526,
-3.708099, -3.290703, 5.537607,
3.462532, -3.290703, 5.537607,
-3.708099, 3.409391, -6.34526,
3.462532, 3.409391, -6.34526,
-3.708099, 3.409391, 5.537607,
3.462532, 3.409391, 5.537607,
3.462532, -3.290703, -6.34526,
3.462532, 3.409391, -6.34526,
3.462532, -3.290703, 5.537607,
3.462532, 3.409391, 5.537607,
3.462532, -3.290703, -6.34526,
3.462532, -3.290703, 5.537607,
3.462532, 3.409391, -6.34526,
3.462532, 3.409391, 5.537607
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
var radius = 8.229397;
var distance = 36.61352;
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
mvMatrix.translate( 0.1227839, -0.05934429, 0.4038262 );
mvMatrix.scale( 1.240865, 1.328009, 0.7487911 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.61352);
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
Etofibrate<-read.table("Etofibrate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Etofibrate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Etofibrate' not found
```

```r
y<-Etofibrate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Etofibrate' not found
```

```r
z<-Etofibrate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Etofibrate' not found
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
-3.603673, -0.6082453, -0.9910705, 0, 0, 1, 1, 1,
-2.922317, -0.2620936, -1.477996, 1, 0, 0, 1, 1,
-2.877888, -0.5865129, -2.326259, 1, 0, 0, 1, 1,
-2.699736, -0.2216709, -3.093923, 1, 0, 0, 1, 1,
-2.6918, -0.6888741, -2.019674, 1, 0, 0, 1, 1,
-2.651467, -1.46501, -1.955575, 1, 0, 0, 1, 1,
-2.560763, 1.109673, -1.580701, 0, 0, 0, 1, 1,
-2.520703, -1.319085, -1.378575, 0, 0, 0, 1, 1,
-2.477897, 0.2861102, -3.027083, 0, 0, 0, 1, 1,
-2.452105, -0.07218721, -3.445271, 0, 0, 0, 1, 1,
-2.401938, -0.9405209, -1.290682, 0, 0, 0, 1, 1,
-2.354151, 1.820952, -2.651047, 0, 0, 0, 1, 1,
-2.344021, 0.2479713, -0.283244, 0, 0, 0, 1, 1,
-2.244986, 0.4846154, -2.331231, 1, 1, 1, 1, 1,
-2.244557, 1.27537, -3.212767, 1, 1, 1, 1, 1,
-2.224717, 0.6040517, -0.8809325, 1, 1, 1, 1, 1,
-2.151599, 0.3516293, -1.320207, 1, 1, 1, 1, 1,
-2.136455, -0.7583633, -0.8103007, 1, 1, 1, 1, 1,
-2.101399, 0.3719164, -0.5565419, 1, 1, 1, 1, 1,
-2.099857, 0.7032288, -1.0424, 1, 1, 1, 1, 1,
-2.080185, 0.6590942, -2.597378, 1, 1, 1, 1, 1,
-2.051524, 0.178645, -2.965753, 1, 1, 1, 1, 1,
-2.043008, 0.7919573, -0.338022, 1, 1, 1, 1, 1,
-2.007588, 0.2286114, -1.600507, 1, 1, 1, 1, 1,
-2.00015, 1.159501, 0.05427681, 1, 1, 1, 1, 1,
-1.982537, 0.1703601, -1.141224, 1, 1, 1, 1, 1,
-1.982055, 0.5088535, -0.1010765, 1, 1, 1, 1, 1,
-1.969311, -0.0206692, -2.161898, 1, 1, 1, 1, 1,
-1.966168, -0.4328085, -1.937535, 0, 0, 1, 1, 1,
-1.953397, -0.3599075, -3.453757, 1, 0, 0, 1, 1,
-1.912688, 0.5918569, -0.6761665, 1, 0, 0, 1, 1,
-1.912562, 0.1990892, -0.8444288, 1, 0, 0, 1, 1,
-1.879602, 0.2332462, -1.066911, 1, 0, 0, 1, 1,
-1.872491, -1.846101, -1.73084, 1, 0, 0, 1, 1,
-1.816958, -1.296903, -2.282918, 0, 0, 0, 1, 1,
-1.814872, -1.051818, -3.316712, 0, 0, 0, 1, 1,
-1.788761, 0.07982013, -2.136886, 0, 0, 0, 1, 1,
-1.774954, -1.443081, -3.467117, 0, 0, 0, 1, 1,
-1.765015, -1.703729, -1.698269, 0, 0, 0, 1, 1,
-1.76334, 0.2024298, -1.023735, 0, 0, 0, 1, 1,
-1.762578, 0.1921176, -0.9344212, 0, 0, 0, 1, 1,
-1.76128, -2.350615, -1.704984, 1, 1, 1, 1, 1,
-1.757197, 0.2055917, -0.658976, 1, 1, 1, 1, 1,
-1.747818, -1.599039, -2.217632, 1, 1, 1, 1, 1,
-1.739406, 1.609438, -0.4273317, 1, 1, 1, 1, 1,
-1.733846, 0.7132137, -0.9745004, 1, 1, 1, 1, 1,
-1.720645, 0.2816529, -1.873675, 1, 1, 1, 1, 1,
-1.716861, 0.1267799, -2.512704, 1, 1, 1, 1, 1,
-1.713912, -0.7492926, -3.498021, 1, 1, 1, 1, 1,
-1.700073, -0.570689, -1.27516, 1, 1, 1, 1, 1,
-1.6976, -0.5536283, -2.46611, 1, 1, 1, 1, 1,
-1.671963, 2.791018, -0.2449851, 1, 1, 1, 1, 1,
-1.655852, -0.8404611, -2.688803, 1, 1, 1, 1, 1,
-1.651524, -0.9290689, -2.502827, 1, 1, 1, 1, 1,
-1.645126, 0.4976504, -0.5804057, 1, 1, 1, 1, 1,
-1.630336, 0.1262325, -2.960495, 1, 1, 1, 1, 1,
-1.610934, -0.6791158, -1.564394, 0, 0, 1, 1, 1,
-1.607493, -0.2782838, -0.9917013, 1, 0, 0, 1, 1,
-1.596241, -0.1371783, -2.331996, 1, 0, 0, 1, 1,
-1.563707, 2.093476, 0.02745277, 1, 0, 0, 1, 1,
-1.56265, 1.296355, -1.225503, 1, 0, 0, 1, 1,
-1.560408, -0.3805546, -2.275698, 1, 0, 0, 1, 1,
-1.538877, 0.1698643, -1.106601, 0, 0, 0, 1, 1,
-1.535257, -0.3962855, -2.289205, 0, 0, 0, 1, 1,
-1.534084, -0.3528002, -1.164469, 0, 0, 0, 1, 1,
-1.522043, 1.224312, -1.852097, 0, 0, 0, 1, 1,
-1.5091, 0.1208936, -1.356611, 0, 0, 0, 1, 1,
-1.500351, -0.8717137, -2.682035, 0, 0, 0, 1, 1,
-1.485827, 0.2036581, -1.218882, 0, 0, 0, 1, 1,
-1.485678, 0.4664718, -2.536287, 1, 1, 1, 1, 1,
-1.473419, 0.1157341, -3.397828, 1, 1, 1, 1, 1,
-1.455659, 0.1330551, -2.838207, 1, 1, 1, 1, 1,
-1.450293, 0.3630913, -1.699002, 1, 1, 1, 1, 1,
-1.448151, 0.241936, -2.84026, 1, 1, 1, 1, 1,
-1.442411, -1.190614, -3.311482, 1, 1, 1, 1, 1,
-1.434405, 0.5090222, -0.9276614, 1, 1, 1, 1, 1,
-1.431806, 0.5868862, 0.2276985, 1, 1, 1, 1, 1,
-1.431638, -0.3757927, -1.818961, 1, 1, 1, 1, 1,
-1.430111, -0.6937823, -3.607109, 1, 1, 1, 1, 1,
-1.41501, 1.148554, -1.882102, 1, 1, 1, 1, 1,
-1.408761, -0.5302244, -0.9852998, 1, 1, 1, 1, 1,
-1.385377, 0.00644081, -0.117641, 1, 1, 1, 1, 1,
-1.376917, -1.097089, -1.52193, 1, 1, 1, 1, 1,
-1.375372, 0.7220878, -1.314668, 1, 1, 1, 1, 1,
-1.372696, -1.030653, -2.307643, 0, 0, 1, 1, 1,
-1.361325, -0.8265558, -0.1848, 1, 0, 0, 1, 1,
-1.355899, 0.988051, -1.110512, 1, 0, 0, 1, 1,
-1.352292, -0.8637322, -0.1101319, 1, 0, 0, 1, 1,
-1.350974, -0.4892373, -1.470375, 1, 0, 0, 1, 1,
-1.331353, 0.6440796, -0.1650166, 1, 0, 0, 1, 1,
-1.326635, -1.129162, -4.682989, 0, 0, 0, 1, 1,
-1.318671, -0.1998176, -1.155573, 0, 0, 0, 1, 1,
-1.314591, 0.4281764, 0.3948548, 0, 0, 0, 1, 1,
-1.313674, 0.8899873, -0.4034199, 0, 0, 0, 1, 1,
-1.311119, -0.5091393, -1.367693, 0, 0, 0, 1, 1,
-1.296581, -0.3977765, -1.89442, 0, 0, 0, 1, 1,
-1.29545, 0.4580106, -2.078159, 0, 0, 0, 1, 1,
-1.291605, 0.7258214, -2.591381, 1, 1, 1, 1, 1,
-1.291389, -0.5209766, -1.452533, 1, 1, 1, 1, 1,
-1.290811, 0.4547567, -0.738688, 1, 1, 1, 1, 1,
-1.290017, 0.9432858, -1.673211, 1, 1, 1, 1, 1,
-1.283527, 0.4118375, -0.357589, 1, 1, 1, 1, 1,
-1.282782, 1.063472, -0.5985036, 1, 1, 1, 1, 1,
-1.280943, -0.1276299, -3.577104, 1, 1, 1, 1, 1,
-1.271666, 1.041168, 0.6402934, 1, 1, 1, 1, 1,
-1.265567, 1.084774, -1.824607, 1, 1, 1, 1, 1,
-1.264786, -0.6922932, -0.7915766, 1, 1, 1, 1, 1,
-1.262941, -0.06130063, -2.562828, 1, 1, 1, 1, 1,
-1.261097, -1.992434, -2.655749, 1, 1, 1, 1, 1,
-1.256394, -0.03205713, -2.224117, 1, 1, 1, 1, 1,
-1.254989, 0.8654963, -0.4034276, 1, 1, 1, 1, 1,
-1.254072, 2.615816, -0.3278733, 1, 1, 1, 1, 1,
-1.252061, -0.981362, -1.350487, 0, 0, 1, 1, 1,
-1.245035, 0.5730836, 0.2211044, 1, 0, 0, 1, 1,
-1.241544, 0.393361, -1.718194, 1, 0, 0, 1, 1,
-1.230706, -0.1918915, -2.639526, 1, 0, 0, 1, 1,
-1.223584, -0.4272214, -2.677698, 1, 0, 0, 1, 1,
-1.216546, 0.6200776, -1.074661, 1, 0, 0, 1, 1,
-1.203926, -0.804085, -2.920131, 0, 0, 0, 1, 1,
-1.196165, 0.639172, 0.1904352, 0, 0, 0, 1, 1,
-1.193781, -0.1342233, -2.557696, 0, 0, 0, 1, 1,
-1.192141, 0.8406789, -0.989941, 0, 0, 0, 1, 1,
-1.189101, 0.1813128, -1.175186, 0, 0, 0, 1, 1,
-1.183001, -1.106325, -2.527625, 0, 0, 0, 1, 1,
-1.178813, 1.20057, -0.4016773, 0, 0, 0, 1, 1,
-1.177927, 3.163667, -2.006606, 1, 1, 1, 1, 1,
-1.177019, -0.0843596, -1.162402, 1, 1, 1, 1, 1,
-1.168755, -0.9701397, -1.847054, 1, 1, 1, 1, 1,
-1.164657, -2.599848, -2.889479, 1, 1, 1, 1, 1,
-1.16252, -0.2315942, -1.536054, 1, 1, 1, 1, 1,
-1.161083, -0.4391855, -3.009756, 1, 1, 1, 1, 1,
-1.159898, -1.717129, -3.865852, 1, 1, 1, 1, 1,
-1.157132, -0.6937074, -2.063684, 1, 1, 1, 1, 1,
-1.154923, 0.358258, -0.5702973, 1, 1, 1, 1, 1,
-1.135501, -0.1086488, -0.4541657, 1, 1, 1, 1, 1,
-1.13299, -2.382359, -3.699046, 1, 1, 1, 1, 1,
-1.131104, -1.512647, -2.587501, 1, 1, 1, 1, 1,
-1.118308, 0.9945098, -1.382604, 1, 1, 1, 1, 1,
-1.113377, -1.308166, -1.725167, 1, 1, 1, 1, 1,
-1.111206, -0.6041847, -2.216461, 1, 1, 1, 1, 1,
-1.104648, -0.01609058, -2.507113, 0, 0, 1, 1, 1,
-1.102804, 1.942894, 0.2709963, 1, 0, 0, 1, 1,
-1.102519, -0.4760922, -0.7341054, 1, 0, 0, 1, 1,
-1.090685, 1.711619, -2.021561, 1, 0, 0, 1, 1,
-1.081251, -0.9713073, -2.470426, 1, 0, 0, 1, 1,
-1.074809, 1.039624, -2.08539, 1, 0, 0, 1, 1,
-1.073498, -0.2102194, -0.3136922, 0, 0, 0, 1, 1,
-1.070781, -0.6380425, -2.231655, 0, 0, 0, 1, 1,
-1.059106, -0.4137881, -0.2628194, 0, 0, 0, 1, 1,
-1.057842, 0.438612, -2.692365, 0, 0, 0, 1, 1,
-1.052854, 0.05003944, -1.297368, 0, 0, 0, 1, 1,
-1.050565, 1.055916, -0.3763031, 0, 0, 0, 1, 1,
-1.049281, -0.3186605, -1.280474, 0, 0, 0, 1, 1,
-1.045917, 0.04748759, -1.298214, 1, 1, 1, 1, 1,
-1.028999, -1.249741, -2.085992, 1, 1, 1, 1, 1,
-1.028487, 0.3307213, -0.9599602, 1, 1, 1, 1, 1,
-1.027886, 0.01219736, -0.9003384, 1, 1, 1, 1, 1,
-1.01015, -0.1608162, -0.6144572, 1, 1, 1, 1, 1,
-0.9981164, 1.295618, -1.764731, 1, 1, 1, 1, 1,
-0.9974458, -0.411888, -2.179, 1, 1, 1, 1, 1,
-0.9929256, 0.4232195, -0.7604862, 1, 1, 1, 1, 1,
-0.9869483, -0.3335351, -2.21664, 1, 1, 1, 1, 1,
-0.9815336, -0.4127382, -1.332623, 1, 1, 1, 1, 1,
-0.9742428, -0.03757973, -0.5459041, 1, 1, 1, 1, 1,
-0.973494, -1.162565, -2.740828, 1, 1, 1, 1, 1,
-0.9716578, 0.2876324, -2.177566, 1, 1, 1, 1, 1,
-0.9642422, 0.003560961, -2.496999, 1, 1, 1, 1, 1,
-0.9629204, 0.4342923, -1.003007, 1, 1, 1, 1, 1,
-0.9563462, 0.9746153, -0.9865066, 0, 0, 1, 1, 1,
-0.9557652, -1.34671, -4.326178, 1, 0, 0, 1, 1,
-0.9504182, -1.303651, -1.724094, 1, 0, 0, 1, 1,
-0.9503564, -1.171856, -1.126464, 1, 0, 0, 1, 1,
-0.9488536, -0.8264999, -3.077101, 1, 0, 0, 1, 1,
-0.9389223, -1.213082, -1.127718, 1, 0, 0, 1, 1,
-0.9385816, 0.2235106, 0.07376754, 0, 0, 0, 1, 1,
-0.9330884, -0.6563966, -1.496606, 0, 0, 0, 1, 1,
-0.9298736, -1.959466, -2.795948, 0, 0, 0, 1, 1,
-0.9255378, 0.7258726, -2.412559, 0, 0, 0, 1, 1,
-0.9196287, -0.4764361, -3.179404, 0, 0, 0, 1, 1,
-0.9183254, -0.1866099, -2.74334, 0, 0, 0, 1, 1,
-0.9182567, 0.3761473, -1.440121, 0, 0, 0, 1, 1,
-0.9159654, 1.171791, 1.182072, 1, 1, 1, 1, 1,
-0.9158802, 1.085525, -1.470306, 1, 1, 1, 1, 1,
-0.9158586, -1.707973, -4.690813, 1, 1, 1, 1, 1,
-0.914702, 0.8992156, -1.091777, 1, 1, 1, 1, 1,
-0.9099943, -0.6885912, -2.167134, 1, 1, 1, 1, 1,
-0.9079116, 0.2843542, -0.6928551, 1, 1, 1, 1, 1,
-0.9075651, -0.155031, -1.35843, 1, 1, 1, 1, 1,
-0.9016258, 1.126089, -0.3882071, 1, 1, 1, 1, 1,
-0.8984262, 0.616063, 0.6946622, 1, 1, 1, 1, 1,
-0.8983247, -0.1714199, -3.931681, 1, 1, 1, 1, 1,
-0.8981793, -0.8756793, -2.35397, 1, 1, 1, 1, 1,
-0.8975142, 0.5102435, -0.1136529, 1, 1, 1, 1, 1,
-0.8955047, -0.9759018, -4.193039, 1, 1, 1, 1, 1,
-0.8913357, -0.2478331, -1.46286, 1, 1, 1, 1, 1,
-0.8839105, 0.1717402, -0.442973, 1, 1, 1, 1, 1,
-0.8768477, 0.3876431, -0.9655833, 0, 0, 1, 1, 1,
-0.875693, 0.741527, -0.2928463, 1, 0, 0, 1, 1,
-0.875608, -0.8388197, -2.361892, 1, 0, 0, 1, 1,
-0.8744833, 0.6516706, -1.633683, 1, 0, 0, 1, 1,
-0.8680941, 1.408833, -0.5983139, 1, 0, 0, 1, 1,
-0.8643702, 0.1602402, -1.300588, 1, 0, 0, 1, 1,
-0.858236, 0.3530206, -2.349666, 0, 0, 0, 1, 1,
-0.8577656, 0.2344123, -1.031955, 0, 0, 0, 1, 1,
-0.854651, 0.6339737, -1.206252, 0, 0, 0, 1, 1,
-0.8513995, 0.1380488, -1.300953, 0, 0, 0, 1, 1,
-0.8484254, -0.7328647, -1.57118, 0, 0, 0, 1, 1,
-0.8436122, -0.3777785, -2.261477, 0, 0, 0, 1, 1,
-0.8371152, -0.330748, -6.172208, 0, 0, 0, 1, 1,
-0.8125882, 2.039086, 0.2550817, 1, 1, 1, 1, 1,
-0.8083266, -0.2939636, -1.277466, 1, 1, 1, 1, 1,
-0.8034259, -0.06665993, -1.455971, 1, 1, 1, 1, 1,
-0.8026838, 1.790613, 1.107062, 1, 1, 1, 1, 1,
-0.8003301, -0.5349135, -3.350797, 1, 1, 1, 1, 1,
-0.8001484, 0.9534658, 0.6354028, 1, 1, 1, 1, 1,
-0.7959638, 1.441716, 0.04200882, 1, 1, 1, 1, 1,
-0.7909071, 0.9801272, -1.633296, 1, 1, 1, 1, 1,
-0.790115, -0.2123457, -0.8177361, 1, 1, 1, 1, 1,
-0.7839803, -0.8575836, -2.460155, 1, 1, 1, 1, 1,
-0.7809793, -0.3904252, -1.958402, 1, 1, 1, 1, 1,
-0.7737004, -0.5919878, -5.599862, 1, 1, 1, 1, 1,
-0.773225, 1.945123, -1.171293, 1, 1, 1, 1, 1,
-0.7707289, -0.2424548, -1.549457, 1, 1, 1, 1, 1,
-0.7606556, 2.085595, -1.67095, 1, 1, 1, 1, 1,
-0.7600502, -2.267501, -3.449395, 0, 0, 1, 1, 1,
-0.7490456, 0.8568144, 0.4556176, 1, 0, 0, 1, 1,
-0.7472168, -0.4886451, -2.802502, 1, 0, 0, 1, 1,
-0.7415765, 0.9076262, -1.492853, 1, 0, 0, 1, 1,
-0.7381074, -0.3819218, -1.635999, 1, 0, 0, 1, 1,
-0.7340269, 1.220627, -1.042003, 1, 0, 0, 1, 1,
-0.7324383, 0.3616624, 0.1872709, 0, 0, 0, 1, 1,
-0.7290874, -0.1736326, -2.697103, 0, 0, 0, 1, 1,
-0.7264451, -0.4194034, -2.891508, 0, 0, 0, 1, 1,
-0.7192759, 0.3060861, 0.6157444, 0, 0, 0, 1, 1,
-0.7167454, 1.356172, -0.7759897, 0, 0, 0, 1, 1,
-0.7151809, -0.7135812, -1.796854, 0, 0, 0, 1, 1,
-0.7104991, 0.5351969, 0.09528845, 0, 0, 0, 1, 1,
-0.7095453, -0.712722, -3.008498, 1, 1, 1, 1, 1,
-0.7066766, -1.574761, -1.943063, 1, 1, 1, 1, 1,
-0.7050405, 0.8003692, 0.1495518, 1, 1, 1, 1, 1,
-0.7044702, -2.565692, -2.27584, 1, 1, 1, 1, 1,
-0.6982259, -0.3347425, -1.922009, 1, 1, 1, 1, 1,
-0.6981338, 1.117085, -0.1829672, 1, 1, 1, 1, 1,
-0.6978322, -0.6612854, -1.752306, 1, 1, 1, 1, 1,
-0.6975991, -0.425386, -2.70583, 1, 1, 1, 1, 1,
-0.6922141, -0.880586, -2.567072, 1, 1, 1, 1, 1,
-0.6865221, -0.3842341, -1.943904, 1, 1, 1, 1, 1,
-0.6839346, 0.1688026, 0.9828656, 1, 1, 1, 1, 1,
-0.6832304, 1.1497, 0.3669978, 1, 1, 1, 1, 1,
-0.6812332, 0.009931453, -0.6359283, 1, 1, 1, 1, 1,
-0.6807795, 0.5448617, -1.537231, 1, 1, 1, 1, 1,
-0.6794462, -0.96495, -1.806373, 1, 1, 1, 1, 1,
-0.6760703, 1.098849, -0.2459237, 0, 0, 1, 1, 1,
-0.6726034, -1.468369, -4.079868, 1, 0, 0, 1, 1,
-0.6694278, -0.684913, -2.755615, 1, 0, 0, 1, 1,
-0.6681709, -0.827837, -2.743213, 1, 0, 0, 1, 1,
-0.6628646, -1.392982, -2.911036, 1, 0, 0, 1, 1,
-0.6608624, 1.443259, -1.340431, 1, 0, 0, 1, 1,
-0.6595812, 0.6579428, -0.1189639, 0, 0, 0, 1, 1,
-0.6586217, 0.4901587, 1.043964, 0, 0, 0, 1, 1,
-0.6533111, -1.287154, -3.027875, 0, 0, 0, 1, 1,
-0.6389146, 0.2844816, -3.136329, 0, 0, 0, 1, 1,
-0.6354886, -0.3904605, -2.155395, 0, 0, 0, 1, 1,
-0.634702, 2.772767, -0.5058956, 0, 0, 0, 1, 1,
-0.6339387, -0.4439435, -2.043435, 0, 0, 0, 1, 1,
-0.6268401, 0.1286327, -1.675757, 1, 1, 1, 1, 1,
-0.624528, -0.4251086, -1.084371, 1, 1, 1, 1, 1,
-0.6232503, -1.398956, -2.0364, 1, 1, 1, 1, 1,
-0.6206182, 0.5358729, -0.9576287, 1, 1, 1, 1, 1,
-0.6175179, 0.8246008, 1.302423, 1, 1, 1, 1, 1,
-0.6148937, 1.232993, -0.3614053, 1, 1, 1, 1, 1,
-0.6137732, 1.003147, -0.661089, 1, 1, 1, 1, 1,
-0.6115239, -0.990082, -2.198844, 1, 1, 1, 1, 1,
-0.6070958, -0.5092967, -2.943058, 1, 1, 1, 1, 1,
-0.6048115, 0.5760065, 0.1992443, 1, 1, 1, 1, 1,
-0.6046551, 0.7968516, -1.641278, 1, 1, 1, 1, 1,
-0.6018897, -0.6887632, -3.39149, 1, 1, 1, 1, 1,
-0.6011613, 0.0295103, -1.821703, 1, 1, 1, 1, 1,
-0.5982866, 1.676717, 0.3416854, 1, 1, 1, 1, 1,
-0.5970587, 0.3679394, -0.4640343, 1, 1, 1, 1, 1,
-0.5950895, -0.0890965, -1.09922, 0, 0, 1, 1, 1,
-0.5928662, 1.01181, 1.044211, 1, 0, 0, 1, 1,
-0.5817364, 0.5042777, -1.102948, 1, 0, 0, 1, 1,
-0.5749362, 0.7241862, 0.4020043, 1, 0, 0, 1, 1,
-0.5708395, -1.076545, -2.789979, 1, 0, 0, 1, 1,
-0.5672625, -0.3821736, -0.4724198, 1, 0, 0, 1, 1,
-0.566348, -1.526113, -2.850447, 0, 0, 0, 1, 1,
-0.5636449, 0.9694791, 0.2619808, 0, 0, 0, 1, 1,
-0.5605521, -1.335878, -2.977399, 0, 0, 0, 1, 1,
-0.5541064, -0.5723954, -0.8855101, 0, 0, 0, 1, 1,
-0.5534224, 1.273175, 0.05180141, 0, 0, 0, 1, 1,
-0.5478748, -0.3040866, 0.3645643, 0, 0, 0, 1, 1,
-0.5463686, 1.29669, -0.3934443, 0, 0, 0, 1, 1,
-0.5450291, 1.928341, -1.359974, 1, 1, 1, 1, 1,
-0.5432468, 0.31297, 0.147338, 1, 1, 1, 1, 1,
-0.5408813, 0.04158419, -0.7969196, 1, 1, 1, 1, 1,
-0.5336456, -0.1595792, -2.624955, 1, 1, 1, 1, 1,
-0.5328027, -1.001984, -1.697609, 1, 1, 1, 1, 1,
-0.52965, -0.6396133, -4.881784, 1, 1, 1, 1, 1,
-0.5276546, 0.2983406, -2.072265, 1, 1, 1, 1, 1,
-0.5154931, 0.796391, -0.7215568, 1, 1, 1, 1, 1,
-0.5139796, 0.01145815, -1.594715, 1, 1, 1, 1, 1,
-0.5117468, -1.532493, -2.767783, 1, 1, 1, 1, 1,
-0.5105053, -0.04699628, -1.356188, 1, 1, 1, 1, 1,
-0.5087762, -1.184031, -1.412235, 1, 1, 1, 1, 1,
-0.508657, 0.033233, -2.184746, 1, 1, 1, 1, 1,
-0.5064256, -0.01244956, -3.686491, 1, 1, 1, 1, 1,
-0.5056254, -1.666856, -2.635159, 1, 1, 1, 1, 1,
-0.5055075, -0.8977466, -4.043693, 0, 0, 1, 1, 1,
-0.5045992, 0.9298497, 0.5044809, 1, 0, 0, 1, 1,
-0.5044224, -0.1727361, -1.918135, 1, 0, 0, 1, 1,
-0.5013835, -1.867254, -2.671594, 1, 0, 0, 1, 1,
-0.4991733, 0.8267606, -0.07109372, 1, 0, 0, 1, 1,
-0.498661, -0.1061312, -1.874952, 1, 0, 0, 1, 1,
-0.4953726, -0.4039075, -1.486034, 0, 0, 0, 1, 1,
-0.4908578, 1.511101, -0.3891791, 0, 0, 0, 1, 1,
-0.4863648, 0.2929587, -0.2158855, 0, 0, 0, 1, 1,
-0.4858335, 0.1991123, -2.070783, 0, 0, 0, 1, 1,
-0.4805368, -3.193129, -5.41422, 0, 0, 0, 1, 1,
-0.4760441, 0.5206575, -1.979167, 0, 0, 0, 1, 1,
-0.4759707, -1.837013, -2.312626, 0, 0, 0, 1, 1,
-0.474405, 0.1234179, -1.055782, 1, 1, 1, 1, 1,
-0.4715936, -0.0006518441, -1.16542, 1, 1, 1, 1, 1,
-0.4683293, 0.3036774, -2.803149, 1, 1, 1, 1, 1,
-0.4647963, 1.212566, -0.4211221, 1, 1, 1, 1, 1,
-0.4647929, -1.375304, -3.762047, 1, 1, 1, 1, 1,
-0.464586, -1.39143, -2.915596, 1, 1, 1, 1, 1,
-0.4622509, -0.2125726, -4.375859, 1, 1, 1, 1, 1,
-0.4613136, 0.2105889, -0.8091292, 1, 1, 1, 1, 1,
-0.4608992, 0.6246023, -2.459534, 1, 1, 1, 1, 1,
-0.4577313, -0.8512412, -3.245863, 1, 1, 1, 1, 1,
-0.4567299, 2.327094, 0.8103698, 1, 1, 1, 1, 1,
-0.4534837, -0.814858, -3.349067, 1, 1, 1, 1, 1,
-0.4530117, -0.4561984, -2.512648, 1, 1, 1, 1, 1,
-0.4506411, -0.3721065, -3.280268, 1, 1, 1, 1, 1,
-0.4500712, -0.5771069, -1.981247, 1, 1, 1, 1, 1,
-0.4488461, 0.8226187, -0.132038, 0, 0, 1, 1, 1,
-0.4455568, -1.088404, -3.405128, 1, 0, 0, 1, 1,
-0.4451109, -1.603583, -3.650114, 1, 0, 0, 1, 1,
-0.4422856, -0.3209931, -1.910176, 1, 0, 0, 1, 1,
-0.4414517, -0.9066308, -4.059784, 1, 0, 0, 1, 1,
-0.4379104, -0.1446401, -2.074133, 1, 0, 0, 1, 1,
-0.4360348, -0.8451612, -4.497931, 0, 0, 0, 1, 1,
-0.4358004, -0.4651438, -2.499106, 0, 0, 0, 1, 1,
-0.432377, 0.5363607, -2.553889, 0, 0, 0, 1, 1,
-0.4323058, 0.32876, 0.0921205, 0, 0, 0, 1, 1,
-0.4301093, 2.498691, 1.099974, 0, 0, 0, 1, 1,
-0.4289745, 0.3382871, -0.9036058, 0, 0, 0, 1, 1,
-0.425431, 1.2732, 0.5030353, 0, 0, 0, 1, 1,
-0.424833, 0.4185222, -1.255112, 1, 1, 1, 1, 1,
-0.4239896, 0.7889326, -0.9709173, 1, 1, 1, 1, 1,
-0.420725, 0.3836863, 1.315789, 1, 1, 1, 1, 1,
-0.4183538, 0.6876051, -0.4043245, 1, 1, 1, 1, 1,
-0.4165343, -0.2426258, -2.225406, 1, 1, 1, 1, 1,
-0.41362, 0.3756435, 0.2481474, 1, 1, 1, 1, 1,
-0.4124667, -0.3783381, -1.608605, 1, 1, 1, 1, 1,
-0.4103907, 0.0609974, -1.456951, 1, 1, 1, 1, 1,
-0.4072284, 1.096606, -0.7390907, 1, 1, 1, 1, 1,
-0.3959075, 0.5588078, 0.2450494, 1, 1, 1, 1, 1,
-0.394852, 0.6535054, -1.260748, 1, 1, 1, 1, 1,
-0.3894982, -1.843167, -2.965198, 1, 1, 1, 1, 1,
-0.3872146, 1.588082, 0.2857132, 1, 1, 1, 1, 1,
-0.3833854, 0.935423, 0.2821262, 1, 1, 1, 1, 1,
-0.3817365, -0.9127359, -4.114816, 1, 1, 1, 1, 1,
-0.3811827, 1.063522, -1.333507, 0, 0, 1, 1, 1,
-0.3788704, -0.4030516, -2.921946, 1, 0, 0, 1, 1,
-0.3780393, 0.4140061, -1.098884, 1, 0, 0, 1, 1,
-0.3771074, 0.5131454, -1.491429, 1, 0, 0, 1, 1,
-0.365, 1.08322, -0.9788482, 1, 0, 0, 1, 1,
-0.3605047, -0.006918796, -0.7955825, 1, 0, 0, 1, 1,
-0.3591022, -0.8847915, -2.938302, 0, 0, 0, 1, 1,
-0.3581738, -0.9875909, -2.262515, 0, 0, 0, 1, 1,
-0.3490896, -1.912014, -3.310742, 0, 0, 0, 1, 1,
-0.3478923, -0.6273667, -3.704983, 0, 0, 0, 1, 1,
-0.3460385, 1.352506, -1.951453, 0, 0, 0, 1, 1,
-0.3451302, -0.1324247, -3.677449, 0, 0, 0, 1, 1,
-0.3362998, -1.256496, -2.105825, 0, 0, 0, 1, 1,
-0.3334499, -0.1531639, -1.231399, 1, 1, 1, 1, 1,
-0.332471, 2.442781, -1.54873, 1, 1, 1, 1, 1,
-0.3235168, -0.2295507, -1.936023, 1, 1, 1, 1, 1,
-0.3233858, 1.204605, -1.997992, 1, 1, 1, 1, 1,
-0.3221656, 1.186954, 0.1223605, 1, 1, 1, 1, 1,
-0.320616, -1.846375, -2.481636, 1, 1, 1, 1, 1,
-0.3192421, -0.6752754, -2.19986, 1, 1, 1, 1, 1,
-0.3141913, 0.3008917, -0.03585683, 1, 1, 1, 1, 1,
-0.3107338, 2.591111, 1.960573, 1, 1, 1, 1, 1,
-0.3001322, -0.1373377, -0.9737255, 1, 1, 1, 1, 1,
-0.2982328, 0.7565901, -0.5342736, 1, 1, 1, 1, 1,
-0.2943044, 0.2118104, -0.05335892, 1, 1, 1, 1, 1,
-0.2917078, 0.4010631, -0.1079921, 1, 1, 1, 1, 1,
-0.2905741, 0.05212968, -0.5931103, 1, 1, 1, 1, 1,
-0.2899939, -0.002406598, -1.031274, 1, 1, 1, 1, 1,
-0.2884748, 0.4104438, -0.4000922, 0, 0, 1, 1, 1,
-0.2883996, 0.330979, -1.931677, 1, 0, 0, 1, 1,
-0.2865901, -0.4788763, -1.981351, 1, 0, 0, 1, 1,
-0.2850669, -0.1062063, -2.767648, 1, 0, 0, 1, 1,
-0.2805024, -0.3641211, 0.2937038, 1, 0, 0, 1, 1,
-0.2802931, -0.941826, -3.48045, 1, 0, 0, 1, 1,
-0.2795728, 0.1914703, -0.3182139, 0, 0, 0, 1, 1,
-0.2781897, 0.140938, -0.389371, 0, 0, 0, 1, 1,
-0.2780367, -1.203743, -0.6791593, 0, 0, 0, 1, 1,
-0.2766156, -1.413234, -2.59656, 0, 0, 0, 1, 1,
-0.2754399, -0.6013553, -3.975422, 0, 0, 0, 1, 1,
-0.2723472, 0.3694309, -1.062546, 0, 0, 0, 1, 1,
-0.2716985, 0.9386203, 0.4984759, 0, 0, 0, 1, 1,
-0.2693678, 0.1558252, -0.5102229, 1, 1, 1, 1, 1,
-0.2664163, 0.5666001, -0.3648305, 1, 1, 1, 1, 1,
-0.2654256, 0.5674938, -1.065597, 1, 1, 1, 1, 1,
-0.2647589, -0.749819, -2.634221, 1, 1, 1, 1, 1,
-0.2630128, 0.5015019, -0.2720758, 1, 1, 1, 1, 1,
-0.2625211, -0.3583412, -3.671099, 1, 1, 1, 1, 1,
-0.2619696, 0.2161621, -1.472785, 1, 1, 1, 1, 1,
-0.2602256, 1.976062, -1.318668, 1, 1, 1, 1, 1,
-0.2581034, 0.3583396, -1.881476, 1, 1, 1, 1, 1,
-0.2566733, 0.7913716, 0.05042749, 1, 1, 1, 1, 1,
-0.2545352, 1.272011, 0.03467139, 1, 1, 1, 1, 1,
-0.2537452, 0.1409876, -1.660555, 1, 1, 1, 1, 1,
-0.2523671, 1.151828, -0.5050888, 1, 1, 1, 1, 1,
-0.2485748, -1.176127, -3.372271, 1, 1, 1, 1, 1,
-0.246761, 1.273999, 0.3411067, 1, 1, 1, 1, 1,
-0.2338614, -0.2193165, -3.49614, 0, 0, 1, 1, 1,
-0.2328889, 0.07622955, -2.445611, 1, 0, 0, 1, 1,
-0.2314627, -1.591974, -1.272324, 1, 0, 0, 1, 1,
-0.2286528, 1.06745, -1.70565, 1, 0, 0, 1, 1,
-0.2264023, -0.2170107, -1.620203, 1, 0, 0, 1, 1,
-0.2256009, 0.7875822, 1.754785, 1, 0, 0, 1, 1,
-0.2245446, -0.8473766, -4.447367, 0, 0, 0, 1, 1,
-0.2217058, -0.656127, -4.878213, 0, 0, 0, 1, 1,
-0.219419, -0.8434169, -1.989375, 0, 0, 0, 1, 1,
-0.2188967, 0.1524375, -0.3428151, 0, 0, 0, 1, 1,
-0.2110017, 0.2513654, -1.145356, 0, 0, 0, 1, 1,
-0.2035826, -0.130801, -1.693607, 0, 0, 0, 1, 1,
-0.203213, -0.2286944, -2.782329, 0, 0, 0, 1, 1,
-0.1957632, -0.047934, -0.8582203, 1, 1, 1, 1, 1,
-0.1954007, 0.8546185, -1.683167, 1, 1, 1, 1, 1,
-0.1940382, 0.9728037, -1.005106, 1, 1, 1, 1, 1,
-0.1825526, -0.09168169, -0.6493608, 1, 1, 1, 1, 1,
-0.1805455, 0.01427825, -2.108285, 1, 1, 1, 1, 1,
-0.1782757, 0.5603395, 2.370635, 1, 1, 1, 1, 1,
-0.1774593, 0.8056997, -2.217063, 1, 1, 1, 1, 1,
-0.1719819, 0.3453991, -0.175843, 1, 1, 1, 1, 1,
-0.171646, -1.027204, -2.119597, 1, 1, 1, 1, 1,
-0.1691858, -0.3464539, -3.77561, 1, 1, 1, 1, 1,
-0.1631978, 2.549145, -0.9606744, 1, 1, 1, 1, 1,
-0.1582899, 1.305593, 0.7774447, 1, 1, 1, 1, 1,
-0.1573227, 1.120958, 0.06678912, 1, 1, 1, 1, 1,
-0.1519574, 1.063417, 0.3831295, 1, 1, 1, 1, 1,
-0.1503229, 1.485478, 1.13915, 1, 1, 1, 1, 1,
-0.1498978, -1.034337, -2.857051, 0, 0, 1, 1, 1,
-0.1483428, 1.168209, 1.14256, 1, 0, 0, 1, 1,
-0.1473036, -0.4505638, -2.817318, 1, 0, 0, 1, 1,
-0.1460178, -0.3501939, -2.757699, 1, 0, 0, 1, 1,
-0.1428963, -0.6624757, -4.393808, 1, 0, 0, 1, 1,
-0.1421392, 0.05221265, -2.285153, 1, 0, 0, 1, 1,
-0.1382483, -0.02186276, -2.691097, 0, 0, 0, 1, 1,
-0.1352215, -1.141705, -4.32788, 0, 0, 0, 1, 1,
-0.1349948, 0.1854887, -0.7486024, 0, 0, 0, 1, 1,
-0.1341074, 0.2110859, 0.6701493, 0, 0, 0, 1, 1,
-0.1335131, 0.5398486, -0.1784131, 0, 0, 0, 1, 1,
-0.1315912, -0.6348493, -2.837592, 0, 0, 0, 1, 1,
-0.1303497, -0.2217897, -2.705288, 0, 0, 0, 1, 1,
-0.121917, -0.03501653, -1.215027, 1, 1, 1, 1, 1,
-0.117312, 0.6247531, 0.09150118, 1, 1, 1, 1, 1,
-0.109987, 0.3344782, 0.08142981, 1, 1, 1, 1, 1,
-0.1056082, 0.2682624, 0.6635216, 1, 1, 1, 1, 1,
-0.1015519, 1.601161, 0.309559, 1, 1, 1, 1, 1,
-0.1014284, -0.2751153, -1.662835, 1, 1, 1, 1, 1,
-0.1004022, 0.4668855, -0.6382561, 1, 1, 1, 1, 1,
-0.09855054, -0.8174476, -2.265386, 1, 1, 1, 1, 1,
-0.09018503, 0.7335612, -1.129413, 1, 1, 1, 1, 1,
-0.08875854, 1.761744, 1.22365, 1, 1, 1, 1, 1,
-0.07698169, 0.208003, -0.007601514, 1, 1, 1, 1, 1,
-0.07512932, 0.1511581, -0.9146936, 1, 1, 1, 1, 1,
-0.07502933, -0.02149016, -2.009341, 1, 1, 1, 1, 1,
-0.07199186, 0.5375443, -1.732513, 1, 1, 1, 1, 1,
-0.07154366, -0.1182216, -3.691988, 1, 1, 1, 1, 1,
-0.07025012, -0.7139997, -3.08412, 0, 0, 1, 1, 1,
-0.06812732, 0.8201287, -1.224578, 1, 0, 0, 1, 1,
-0.06283852, -0.453667, -3.30335, 1, 0, 0, 1, 1,
-0.06096646, 0.2399488, -0.8859923, 1, 0, 0, 1, 1,
-0.05637893, 2.216629, -0.679841, 1, 0, 0, 1, 1,
-0.05442154, -0.1218897, -3.418265, 1, 0, 0, 1, 1,
-0.04837544, 0.0495701, -1.563746, 0, 0, 0, 1, 1,
-0.04651497, -0.3043935, -3.51802, 0, 0, 0, 1, 1,
-0.04522224, -0.627571, -2.652497, 0, 0, 0, 1, 1,
-0.04482654, 0.2057432, 0.1322653, 0, 0, 0, 1, 1,
-0.03855271, -0.0131981, -3.029079, 0, 0, 0, 1, 1,
-0.03813075, -0.6812628, -2.559646, 0, 0, 0, 1, 1,
-0.0361489, 0.9400647, -0.7941784, 0, 0, 0, 1, 1,
-0.03490205, -0.09422641, -3.665535, 1, 1, 1, 1, 1,
-0.02685004, -0.3544186, -1.963772, 1, 1, 1, 1, 1,
-0.02514083, 0.8926008, -2.396704, 1, 1, 1, 1, 1,
-0.02445382, -0.7820986, -3.932826, 1, 1, 1, 1, 1,
-0.02345945, -0.1651579, -3.492702, 1, 1, 1, 1, 1,
-0.02289919, -1.222667, -3.121397, 1, 1, 1, 1, 1,
-0.02198702, -0.5582947, -3.536446, 1, 1, 1, 1, 1,
-0.01913597, 1.529596, 0.654104, 1, 1, 1, 1, 1,
-0.01797619, 1.151903, -0.4843442, 1, 1, 1, 1, 1,
-0.01340524, -0.3999857, -2.576866, 1, 1, 1, 1, 1,
-0.0109479, 0.1687993, 0.4869074, 1, 1, 1, 1, 1,
-0.006519463, -0.01736544, -3.421336, 1, 1, 1, 1, 1,
-0.004567201, 1.700241, -0.1107388, 1, 1, 1, 1, 1,
-0.00228664, 0.5063561, 0.8195509, 1, 1, 1, 1, 1,
0.0006120342, 0.2614611, -0.01535908, 1, 1, 1, 1, 1,
0.005448539, -0.6665376, 3.7046, 0, 0, 1, 1, 1,
0.008237534, -0.9249175, 2.403693, 1, 0, 0, 1, 1,
0.009224073, -0.3548258, 3.916637, 1, 0, 0, 1, 1,
0.009226904, -1.850397, 2.965528, 1, 0, 0, 1, 1,
0.01202411, -0.105014, 1.796005, 1, 0, 0, 1, 1,
0.01300065, 0.8460951, -0.329785, 1, 0, 0, 1, 1,
0.01462488, 0.8636615, -0.8199196, 0, 0, 0, 1, 1,
0.01723182, -0.2128339, 2.038385, 0, 0, 0, 1, 1,
0.02203728, -0.7122975, 2.211805, 0, 0, 0, 1, 1,
0.02220758, 0.1823503, -0.2400348, 0, 0, 0, 1, 1,
0.02485332, 0.621704, -0.5853698, 0, 0, 0, 1, 1,
0.0256116, -0.9030133, 2.336247, 0, 0, 0, 1, 1,
0.02601628, -1.177528, 1.64599, 0, 0, 0, 1, 1,
0.03799492, -1.332893, 3.390718, 1, 1, 1, 1, 1,
0.04340827, 0.8626525, -0.4227149, 1, 1, 1, 1, 1,
0.04665109, 0.6470314, 1.172665, 1, 1, 1, 1, 1,
0.04783928, 0.8185977, 0.2909337, 1, 1, 1, 1, 1,
0.04869299, -0.3113148, 3.868038, 1, 1, 1, 1, 1,
0.05422528, 0.5625141, 1.654894, 1, 1, 1, 1, 1,
0.05928946, 0.6754978, 0.4348692, 1, 1, 1, 1, 1,
0.05972373, -0.05626997, 1.69625, 1, 1, 1, 1, 1,
0.0656663, 0.1323424, 0.8777958, 1, 1, 1, 1, 1,
0.0698678, -0.2564519, 2.359082, 1, 1, 1, 1, 1,
0.07453569, 0.436645, 0.05946076, 1, 1, 1, 1, 1,
0.07538039, -0.2361507, 2.780909, 1, 1, 1, 1, 1,
0.07552913, -0.2695234, 2.968051, 1, 1, 1, 1, 1,
0.07901182, -0.3143259, 1.269295, 1, 1, 1, 1, 1,
0.07937516, 0.3966337, 0.3121142, 1, 1, 1, 1, 1,
0.08141887, -0.268385, 2.503007, 0, 0, 1, 1, 1,
0.08288092, 0.3021206, -0.4316492, 1, 0, 0, 1, 1,
0.08522038, 0.6646613, 0.007042915, 1, 0, 0, 1, 1,
0.08811831, 1.442352, 0.2091234, 1, 0, 0, 1, 1,
0.08949659, 2.229454, -0.3047414, 1, 0, 0, 1, 1,
0.08955827, 0.6852719, 1.806494, 1, 0, 0, 1, 1,
0.09353264, 0.5453969, -0.8752428, 0, 0, 0, 1, 1,
0.09406494, 0.2590817, 1.257131, 0, 0, 0, 1, 1,
0.1030411, -0.03289593, 2.70391, 0, 0, 0, 1, 1,
0.1042037, -0.2825422, 2.672826, 0, 0, 0, 1, 1,
0.1080415, -0.8355291, 1.610299, 0, 0, 0, 1, 1,
0.1089592, 1.009937, -0.332259, 0, 0, 0, 1, 1,
0.1139082, -0.2024476, 1.391985, 0, 0, 0, 1, 1,
0.1209227, -1.537791, 4.7655, 1, 1, 1, 1, 1,
0.1249197, -0.9607712, 1.888466, 1, 1, 1, 1, 1,
0.1441806, 0.07465155, -0.4154475, 1, 1, 1, 1, 1,
0.1475237, -0.5933514, 1.550081, 1, 1, 1, 1, 1,
0.1515875, 0.7695406, -1.562169, 1, 1, 1, 1, 1,
0.1546235, 2.435114, -0.07386278, 1, 1, 1, 1, 1,
0.1560655, 0.4091805, -0.02342527, 1, 1, 1, 1, 1,
0.1573546, -1.647548, 3.201133, 1, 1, 1, 1, 1,
0.1618203, 1.649627, -0.2569854, 1, 1, 1, 1, 1,
0.1627358, -0.06282771, 1.756055, 1, 1, 1, 1, 1,
0.1695513, -1.78319, 2.376482, 1, 1, 1, 1, 1,
0.1699986, -0.1140436, 4.015577, 1, 1, 1, 1, 1,
0.1732021, -2.405765, 1.709875, 1, 1, 1, 1, 1,
0.1733205, -0.7989534, 3.273318, 1, 1, 1, 1, 1,
0.1739297, 1.441242, -2.245389, 1, 1, 1, 1, 1,
0.1756171, -0.4034882, 3.208157, 0, 0, 1, 1, 1,
0.1759254, 0.1326038, 1.005475, 1, 0, 0, 1, 1,
0.1769797, 1.104091, 0.4994121, 1, 0, 0, 1, 1,
0.1813585, -1.370831, 2.39753, 1, 0, 0, 1, 1,
0.1851261, 0.8433683, -0.2940863, 1, 0, 0, 1, 1,
0.1875859, 0.1527578, 0.5811799, 1, 0, 0, 1, 1,
0.1963111, -0.6692133, 5.095363, 0, 0, 0, 1, 1,
0.2026457, -0.1450554, 2.126438, 0, 0, 0, 1, 1,
0.2046718, -0.07346464, 3.16145, 0, 0, 0, 1, 1,
0.2098407, -2.786042, 4.59409, 0, 0, 0, 1, 1,
0.2121712, 0.2894522, -0.2389621, 0, 0, 0, 1, 1,
0.2145067, 0.6434458, 1.082375, 0, 0, 0, 1, 1,
0.2170537, -0.2301067, 3.124412, 0, 0, 0, 1, 1,
0.2233732, -0.9105948, 1.998397, 1, 1, 1, 1, 1,
0.2234969, 0.2045399, 1.88481, 1, 1, 1, 1, 1,
0.2254423, 1.073474, 0.1625763, 1, 1, 1, 1, 1,
0.2331263, 1.589227, 0.01840261, 1, 1, 1, 1, 1,
0.2368272, -1.584986, 2.856721, 1, 1, 1, 1, 1,
0.2399048, 0.6160228, -0.3559241, 1, 1, 1, 1, 1,
0.240088, 0.5308985, 1.026235, 1, 1, 1, 1, 1,
0.240259, 0.2140588, 0.2802005, 1, 1, 1, 1, 1,
0.2407594, 0.4432474, -2.207712, 1, 1, 1, 1, 1,
0.2434105, -1.091832, 2.598179, 1, 1, 1, 1, 1,
0.2477533, -0.1785964, 1.784267, 1, 1, 1, 1, 1,
0.2487603, -0.04176042, 2.48741, 1, 1, 1, 1, 1,
0.2491204, -0.0585218, 2.379285, 1, 1, 1, 1, 1,
0.2499896, 1.740734, 0.9803079, 1, 1, 1, 1, 1,
0.2643219, -0.1320469, 3.262479, 1, 1, 1, 1, 1,
0.266925, -1.508354, 1.282299, 0, 0, 1, 1, 1,
0.2679353, -0.7666701, 3.154797, 1, 0, 0, 1, 1,
0.2697418, -1.393912, 1.998836, 1, 0, 0, 1, 1,
0.2702069, 0.1000955, -0.8169394, 1, 0, 0, 1, 1,
0.2755646, 0.02559151, 0.2737611, 1, 0, 0, 1, 1,
0.2761705, 2.273028, -0.08938691, 1, 0, 0, 1, 1,
0.2796787, 0.1164994, 2.567361, 0, 0, 0, 1, 1,
0.2816312, -1.466007, 3.626934, 0, 0, 0, 1, 1,
0.2866159, 1.644887, 0.4706895, 0, 0, 0, 1, 1,
0.2931531, 0.8527423, 2.070567, 0, 0, 0, 1, 1,
0.2945166, 0.5747328, -0.6981091, 0, 0, 0, 1, 1,
0.2997745, 1.418996, 0.8262742, 0, 0, 0, 1, 1,
0.3007519, -1.293278, 2.158937, 0, 0, 0, 1, 1,
0.3036005, 0.6375502, 0.7193815, 1, 1, 1, 1, 1,
0.3044347, -2.195085, 2.086062, 1, 1, 1, 1, 1,
0.3045637, 0.9393273, -0.008403323, 1, 1, 1, 1, 1,
0.3069039, 0.4755167, 1.318262, 1, 1, 1, 1, 1,
0.3125259, 1.003091, 0.4033529, 1, 1, 1, 1, 1,
0.3131966, -1.784759, 0.4588991, 1, 1, 1, 1, 1,
0.3157986, 0.3692716, 1.813122, 1, 1, 1, 1, 1,
0.3178464, 0.1680306, 1.237229, 1, 1, 1, 1, 1,
0.3197942, -1.070623, 3.24204, 1, 1, 1, 1, 1,
0.3225562, -0.6108752, 2.498495, 1, 1, 1, 1, 1,
0.3294423, -0.3223317, 2.534914, 1, 1, 1, 1, 1,
0.3300936, 0.7518786, 2.171569, 1, 1, 1, 1, 1,
0.3364773, -0.7929568, 4.337137, 1, 1, 1, 1, 1,
0.3380509, -0.2977048, 2.261636, 1, 1, 1, 1, 1,
0.3393718, -1.902067, 2.52413, 1, 1, 1, 1, 1,
0.3425603, 1.553014, 0.3043765, 0, 0, 1, 1, 1,
0.3436693, 0.359116, 1.036022, 1, 0, 0, 1, 1,
0.3488746, -1.4865, 2.889764, 1, 0, 0, 1, 1,
0.3505904, 0.3935487, 0.7082347, 1, 0, 0, 1, 1,
0.3520536, -1.53911, 3.493102, 1, 0, 0, 1, 1,
0.3525278, -1.508371, 2.136735, 1, 0, 0, 1, 1,
0.3634058, 0.6888114, -1.193925, 0, 0, 0, 1, 1,
0.3648034, -0.2993552, 2.048617, 0, 0, 0, 1, 1,
0.3665877, 0.3690561, 0.4964036, 0, 0, 0, 1, 1,
0.3669484, -1.476278, 1.6308, 0, 0, 0, 1, 1,
0.3673986, 0.124495, 0.4598429, 0, 0, 0, 1, 1,
0.3682958, -0.1801512, 1.661609, 0, 0, 0, 1, 1,
0.3701591, 0.4627325, 0.2241075, 0, 0, 0, 1, 1,
0.3789696, -0.4697123, 1.228752, 1, 1, 1, 1, 1,
0.3790579, 0.5152122, -0.01461148, 1, 1, 1, 1, 1,
0.3935928, -0.6752955, 3.433027, 1, 1, 1, 1, 1,
0.3946822, -0.364794, 0.9746271, 1, 1, 1, 1, 1,
0.398724, -0.004450249, 2.737941, 1, 1, 1, 1, 1,
0.3991187, -0.5566481, 4.026564, 1, 1, 1, 1, 1,
0.399738, -1.591191, 3.259939, 1, 1, 1, 1, 1,
0.4003362, 0.1079192, 0.7585155, 1, 1, 1, 1, 1,
0.4020814, 0.5324144, 0.02182489, 1, 1, 1, 1, 1,
0.4062259, -1.055909, 1.801309, 1, 1, 1, 1, 1,
0.4083983, 0.05460834, -0.1427803, 1, 1, 1, 1, 1,
0.4125665, -0.7078559, 3.699363, 1, 1, 1, 1, 1,
0.4129754, -0.689762, 0.5186095, 1, 1, 1, 1, 1,
0.4185909, 0.8503366, 0.4768942, 1, 1, 1, 1, 1,
0.4202811, 0.8840619, 0.4341076, 1, 1, 1, 1, 1,
0.4219691, -0.7206678, 0.4438507, 0, 0, 1, 1, 1,
0.422888, 0.602609, 0.2195299, 1, 0, 0, 1, 1,
0.4275455, 1.081151, 1.223083, 1, 0, 0, 1, 1,
0.4381418, -0.3851823, 3.028142, 1, 0, 0, 1, 1,
0.4427646, 0.7504687, 1.556506, 1, 0, 0, 1, 1,
0.444385, -1.450338, 2.476535, 1, 0, 0, 1, 1,
0.4458564, -1.175077, 0.8359181, 0, 0, 0, 1, 1,
0.4490669, 0.4068472, 1.298711, 0, 0, 0, 1, 1,
0.4491488, 2.150674, -0.5474349, 0, 0, 0, 1, 1,
0.4527111, 0.2215029, 1.177431, 0, 0, 0, 1, 1,
0.4537585, 0.5828332, 1.516638, 0, 0, 0, 1, 1,
0.4543321, 1.445468, -1.234948, 0, 0, 0, 1, 1,
0.456044, 1.771677, -0.0474581, 0, 0, 0, 1, 1,
0.4648967, 0.9089931, 1.463544, 1, 1, 1, 1, 1,
0.4653023, 0.5761282, 0.7776105, 1, 1, 1, 1, 1,
0.4729559, 0.1208883, 0.7010573, 1, 1, 1, 1, 1,
0.4747166, -0.9491247, 2.211377, 1, 1, 1, 1, 1,
0.4754927, -0.5453885, 2.693699, 1, 1, 1, 1, 1,
0.4793619, 2.093053, 0.9269453, 1, 1, 1, 1, 1,
0.4817482, -0.7923756, 3.684716, 1, 1, 1, 1, 1,
0.4825865, 1.363713, -0.6336846, 1, 1, 1, 1, 1,
0.4830246, -1.527627, 4.273985, 1, 1, 1, 1, 1,
0.4842563, 0.7743967, -0.2042331, 1, 1, 1, 1, 1,
0.4856555, -0.4731214, 3.71714, 1, 1, 1, 1, 1,
0.4874128, 0.9139705, -1.095831, 1, 1, 1, 1, 1,
0.4888682, 0.1252613, 0.5303798, 1, 1, 1, 1, 1,
0.4907627, 0.0285008, 3.35331, 1, 1, 1, 1, 1,
0.493203, -0.8160923, 2.75399, 1, 1, 1, 1, 1,
0.4940607, 0.1617798, -0.7812582, 0, 0, 1, 1, 1,
0.4945939, 0.5222, -0.2345152, 1, 0, 0, 1, 1,
0.4996602, -0.4464256, 2.028381, 1, 0, 0, 1, 1,
0.4998634, 0.2742647, 1.735509, 1, 0, 0, 1, 1,
0.5012615, 0.228378, -0.1395126, 1, 0, 0, 1, 1,
0.5056636, -0.8736686, 3.331835, 1, 0, 0, 1, 1,
0.5070177, -0.1160272, 3.0525, 0, 0, 0, 1, 1,
0.5075817, -0.2887884, 3.47014, 0, 0, 0, 1, 1,
0.5088326, 1.30201, -0.6888252, 0, 0, 0, 1, 1,
0.5111989, -0.7807019, 3.404002, 0, 0, 0, 1, 1,
0.5127688, 0.2348064, 0.6042128, 0, 0, 0, 1, 1,
0.5139006, 1.896612, -0.1138697, 0, 0, 0, 1, 1,
0.5159582, 0.6499031, 2.088366, 0, 0, 0, 1, 1,
0.5163525, -0.1294855, 3.116299, 1, 1, 1, 1, 1,
0.5166078, -0.279616, 0.6351746, 1, 1, 1, 1, 1,
0.5188015, 0.7270717, 0.4602784, 1, 1, 1, 1, 1,
0.5223969, 0.8827265, 2.093588, 1, 1, 1, 1, 1,
0.531431, -0.8342978, 0.5151694, 1, 1, 1, 1, 1,
0.5316094, 0.3064216, -0.1089076, 1, 1, 1, 1, 1,
0.5363008, -0.372012, 2.417998, 1, 1, 1, 1, 1,
0.5372873, -0.1916402, 1.417939, 1, 1, 1, 1, 1,
0.5402718, -1.259331, 1.228741, 1, 1, 1, 1, 1,
0.5441997, -0.1023457, 1.462339, 1, 1, 1, 1, 1,
0.5457483, -0.5802745, 1.252917, 1, 1, 1, 1, 1,
0.5517696, -0.9176077, 3.769696, 1, 1, 1, 1, 1,
0.552388, -1.603203, 1.397583, 1, 1, 1, 1, 1,
0.5536784, -0.7458561, 2.460187, 1, 1, 1, 1, 1,
0.5577944, -0.7911569, 3.257535, 1, 1, 1, 1, 1,
0.5608221, -0.9109139, 4.045567, 0, 0, 1, 1, 1,
0.564018, -0.03061447, 2.731805, 1, 0, 0, 1, 1,
0.5676394, 0.5957477, -0.1469986, 1, 0, 0, 1, 1,
0.5685542, 0.9942415, -0.6280753, 1, 0, 0, 1, 1,
0.5783014, -0.7873973, 2.552426, 1, 0, 0, 1, 1,
0.5790672, 1.19672, -1.034838, 1, 0, 0, 1, 1,
0.5791, 0.90648, 1.195767, 0, 0, 0, 1, 1,
0.5797192, 0.4469222, 2.238773, 0, 0, 0, 1, 1,
0.5801565, 0.7807835, 3.013679, 0, 0, 0, 1, 1,
0.5839966, 0.05036619, 2.717381, 0, 0, 0, 1, 1,
0.5898479, -1.35822, 4.153616, 0, 0, 0, 1, 1,
0.5924959, 0.6760562, 0.41915, 0, 0, 0, 1, 1,
0.5958028, -0.3280595, 1.598777, 0, 0, 0, 1, 1,
0.6023481, -1.231029, 3.345157, 1, 1, 1, 1, 1,
0.6052873, 1.531384, 1.033716, 1, 1, 1, 1, 1,
0.6096643, 0.3198488, 1.411171, 1, 1, 1, 1, 1,
0.6098853, -1.133442, 2.500933, 1, 1, 1, 1, 1,
0.6103225, -0.01553359, 2.761752, 1, 1, 1, 1, 1,
0.6229386, 1.297597, 1.501364, 1, 1, 1, 1, 1,
0.6234186, -1.407679, 2.220098, 1, 1, 1, 1, 1,
0.6237054, -1.087746, 3.499077, 1, 1, 1, 1, 1,
0.6248297, -0.4288628, 1.654629, 1, 1, 1, 1, 1,
0.6256815, -1.107795, 1.09547, 1, 1, 1, 1, 1,
0.6258247, 0.05776083, 2.835864, 1, 1, 1, 1, 1,
0.6258694, -0.7704401, 1.426506, 1, 1, 1, 1, 1,
0.6283247, 1.182012, 0.7521003, 1, 1, 1, 1, 1,
0.631852, -1.839334, 5.364556, 1, 1, 1, 1, 1,
0.634892, 1.238077, 0.4872645, 1, 1, 1, 1, 1,
0.6376724, -0.7349542, 2.745774, 0, 0, 1, 1, 1,
0.6435663, -0.7063138, 2.495795, 1, 0, 0, 1, 1,
0.6449082, 0.7137941, 1.615175, 1, 0, 0, 1, 1,
0.6481081, -1.423575, 0.2413234, 1, 0, 0, 1, 1,
0.6535278, -1.820043, 4.160971, 1, 0, 0, 1, 1,
0.6616573, 1.206596, 1.586662, 1, 0, 0, 1, 1,
0.6645636, -0.3047446, 0.9710495, 0, 0, 0, 1, 1,
0.6672705, 0.6400216, 0.7821469, 0, 0, 0, 1, 1,
0.6673828, 0.5569833, 0.6908576, 0, 0, 0, 1, 1,
0.6715636, -0.559752, 1.801964, 0, 0, 0, 1, 1,
0.6729155, -0.7427721, 3.133444, 0, 0, 0, 1, 1,
0.6734289, 1.235934, -1.273353, 0, 0, 0, 1, 1,
0.6740954, 0.4211302, -0.3422125, 0, 0, 0, 1, 1,
0.6752447, 0.8267692, 0.6513919, 1, 1, 1, 1, 1,
0.6794461, 1.876522, -0.1470739, 1, 1, 1, 1, 1,
0.6830247, -0.8312078, 4.001825, 1, 1, 1, 1, 1,
0.6853758, 1.203368, 1.831653, 1, 1, 1, 1, 1,
0.6867166, 0.6401243, -1.869927, 1, 1, 1, 1, 1,
0.6886984, 0.1967377, 1.542142, 1, 1, 1, 1, 1,
0.6909435, 0.006581003, 1.429471, 1, 1, 1, 1, 1,
0.6909688, 0.02243136, 0.622731, 1, 1, 1, 1, 1,
0.6909819, 0.6703323, -0.2475262, 1, 1, 1, 1, 1,
0.6954467, -0.1012006, 2.076513, 1, 1, 1, 1, 1,
0.6984169, 2.064291, -0.7296602, 1, 1, 1, 1, 1,
0.7015752, 0.3545908, 1.165238, 1, 1, 1, 1, 1,
0.7054109, -0.6279119, 3.454084, 1, 1, 1, 1, 1,
0.7064182, 0.1128325, 0.7196907, 1, 1, 1, 1, 1,
0.7128287, 1.557075, 0.5916911, 1, 1, 1, 1, 1,
0.7128911, -0.2490944, 1.597982, 0, 0, 1, 1, 1,
0.7138635, 0.6862568, 0.3107432, 1, 0, 0, 1, 1,
0.7171469, 0.6517264, 1.18594, 1, 0, 0, 1, 1,
0.7182527, -1.448166, 2.40487, 1, 0, 0, 1, 1,
0.7194108, 0.2780757, 3.214249, 1, 0, 0, 1, 1,
0.725092, -0.4608417, 2.005505, 1, 0, 0, 1, 1,
0.7347031, -0.4090477, 2.113796, 0, 0, 0, 1, 1,
0.7355722, -0.2152767, 1.686027, 0, 0, 0, 1, 1,
0.745239, 1.038882, 0.9241241, 0, 0, 0, 1, 1,
0.7457926, 2.545984, 0.0859623, 0, 0, 0, 1, 1,
0.7459584, -1.774119, 1.46908, 0, 0, 0, 1, 1,
0.752466, 0.3330851, 2.176245, 0, 0, 0, 1, 1,
0.7583655, -0.4393254, 3.232936, 0, 0, 0, 1, 1,
0.7702786, 0.07169796, 1.669151, 1, 1, 1, 1, 1,
0.7709559, 0.272623, 1.41938, 1, 1, 1, 1, 1,
0.7742482, 1.423966, -0.1483672, 1, 1, 1, 1, 1,
0.7785891, -0.8013843, 3.572802, 1, 1, 1, 1, 1,
0.7815853, 0.2800023, -0.1634658, 1, 1, 1, 1, 1,
0.7841871, 3.311817, -0.6682599, 1, 1, 1, 1, 1,
0.7883543, -0.5887969, 2.943357, 1, 1, 1, 1, 1,
0.792127, 0.1130962, -0.301192, 1, 1, 1, 1, 1,
0.7934669, 0.8948688, 1.578805, 1, 1, 1, 1, 1,
0.7955888, -0.1260978, 0.2913741, 1, 1, 1, 1, 1,
0.7958227, 1.328868, 0.8900716, 1, 1, 1, 1, 1,
0.7970623, -0.1470939, 3.840942, 1, 1, 1, 1, 1,
0.7990069, 0.4861361, 1.976755, 1, 1, 1, 1, 1,
0.7996662, 0.6611742, 3.072177, 1, 1, 1, 1, 1,
0.7997158, 2.359843, 0.3107044, 1, 1, 1, 1, 1,
0.800193, -0.9105985, 2.629542, 0, 0, 1, 1, 1,
0.8008692, 0.6268235, 0.7154167, 1, 0, 0, 1, 1,
0.810087, -1.123473, 2.002721, 1, 0, 0, 1, 1,
0.8121076, -0.7700188, 0.8003858, 1, 0, 0, 1, 1,
0.8165746, 1.102676, 0.2932278, 1, 0, 0, 1, 1,
0.8233169, 0.8597888, 2.389096, 1, 0, 0, 1, 1,
0.8251276, -0.1213537, 0.8090206, 0, 0, 0, 1, 1,
0.8261377, 0.1853612, 2.592605, 0, 0, 0, 1, 1,
0.8343288, 0.2692422, 1.016317, 0, 0, 0, 1, 1,
0.8359095, 0.8045188, 1.462924, 0, 0, 0, 1, 1,
0.8456364, 0.7417225, 0.313044, 0, 0, 0, 1, 1,
0.8467922, -0.3909566, 2.196309, 0, 0, 0, 1, 1,
0.8471102, -0.7043425, 1.969427, 0, 0, 0, 1, 1,
0.8493039, -1.171034, 1.235143, 1, 1, 1, 1, 1,
0.8575222, -1.254579, 1.904409, 1, 1, 1, 1, 1,
0.8591895, -1.746728, 4.176439, 1, 1, 1, 1, 1,
0.859996, -0.3699421, 1.899465, 1, 1, 1, 1, 1,
0.8655743, -0.1968033, 2.803643, 1, 1, 1, 1, 1,
0.870487, 0.6360606, 1.500129, 1, 1, 1, 1, 1,
0.8705279, 1.111748, 2.056788, 1, 1, 1, 1, 1,
0.8709558, -0.1883643, -0.1071785, 1, 1, 1, 1, 1,
0.8719769, -0.3161342, 1.658033, 1, 1, 1, 1, 1,
0.8725579, -0.08327515, 2.952185, 1, 1, 1, 1, 1,
0.8752038, -1.106844, 2.412254, 1, 1, 1, 1, 1,
0.8782976, 0.4067655, 0.9764395, 1, 1, 1, 1, 1,
0.8807067, -1.178842, 2.582581, 1, 1, 1, 1, 1,
0.8813584, 0.8484413, 0.4458282, 1, 1, 1, 1, 1,
0.8845269, 0.02000961, 0.9928014, 1, 1, 1, 1, 1,
0.8872644, -1.165303, 2.327439, 0, 0, 1, 1, 1,
0.8921391, -0.1903614, 0.9445997, 1, 0, 0, 1, 1,
0.8935755, 1.726045, 1.959654, 1, 0, 0, 1, 1,
0.8969776, 0.4584694, 0.249716, 1, 0, 0, 1, 1,
0.8978619, 1.467318, -0.2035468, 1, 0, 0, 1, 1,
0.9112301, 1.614139, 0.6646255, 1, 0, 0, 1, 1,
0.912219, 0.3906402, -0.5404544, 0, 0, 0, 1, 1,
0.9126514, 0.2775485, 1.105814, 0, 0, 0, 1, 1,
0.9152289, 0.6595734, 0.9347267, 0, 0, 0, 1, 1,
0.917778, 0.1042775, 0.1606083, 0, 0, 0, 1, 1,
0.9198646, 0.9502928, 2.111443, 0, 0, 0, 1, 1,
0.9298841, -1.829943, 2.801297, 0, 0, 0, 1, 1,
0.9355319, -0.5491222, 3.060581, 0, 0, 0, 1, 1,
0.9427562, 0.2086222, 0.5934938, 1, 1, 1, 1, 1,
0.9477317, 0.1343542, 0.845106, 1, 1, 1, 1, 1,
0.9487755, 1.07809, -0.3500687, 1, 1, 1, 1, 1,
0.9530234, 0.627082, -0.1490732, 1, 1, 1, 1, 1,
0.9537134, -0.04099147, 1.625723, 1, 1, 1, 1, 1,
0.9673393, 0.2797451, 0.8443205, 1, 1, 1, 1, 1,
0.9702868, -0.004368986, 0.7498295, 1, 1, 1, 1, 1,
0.9728794, -1.588471, 2.437122, 1, 1, 1, 1, 1,
0.9759867, -0.3917795, 3.319394, 1, 1, 1, 1, 1,
0.9863844, -0.259843, -0.1238705, 1, 1, 1, 1, 1,
0.9885926, -0.2623298, 2.469671, 1, 1, 1, 1, 1,
0.9930006, -0.6464079, 1.89967, 1, 1, 1, 1, 1,
0.9973456, -0.7460068, 1.359625, 1, 1, 1, 1, 1,
1.003253, -0.06616765, 2.979189, 1, 1, 1, 1, 1,
1.012847, 0.3068425, 0.5141035, 1, 1, 1, 1, 1,
1.016546, 0.2132781, 0.108989, 0, 0, 1, 1, 1,
1.02321, -0.5588437, 2.563399, 1, 0, 0, 1, 1,
1.024727, -0.4780966, 1.822215, 1, 0, 0, 1, 1,
1.025123, -1.450081, 1.317181, 1, 0, 0, 1, 1,
1.02844, 2.239295, 2.574742, 1, 0, 0, 1, 1,
1.039106, -0.5670442, 1.024863, 1, 0, 0, 1, 1,
1.046183, -0.5342841, 2.956803, 0, 0, 0, 1, 1,
1.046403, -0.9303542, 0.7291781, 0, 0, 0, 1, 1,
1.047289, 0.3529761, 0.388536, 0, 0, 0, 1, 1,
1.05301, 0.4095829, 1.710753, 0, 0, 0, 1, 1,
1.07029, 0.3566824, 1.025581, 0, 0, 0, 1, 1,
1.075255, -0.923351, 2.907347, 0, 0, 0, 1, 1,
1.091663, -1.140988, 1.226091, 0, 0, 0, 1, 1,
1.112341, 0.9437907, 0.3058988, 1, 1, 1, 1, 1,
1.113289, -2.307171, 1.985598, 1, 1, 1, 1, 1,
1.115184, -0.8877747, 1.655714, 1, 1, 1, 1, 1,
1.124506, -0.2278775, 0.907768, 1, 1, 1, 1, 1,
1.124535, -0.4671136, 3.097814, 1, 1, 1, 1, 1,
1.126131, -0.6570406, 1.01331, 1, 1, 1, 1, 1,
1.126508, 0.03937203, 0.8353487, 1, 1, 1, 1, 1,
1.129128, 0.861602, -0.783381, 1, 1, 1, 1, 1,
1.133346, -0.8045602, 2.664957, 1, 1, 1, 1, 1,
1.135044, -0.1622252, 1.576698, 1, 1, 1, 1, 1,
1.139868, -0.354637, 0.6365249, 1, 1, 1, 1, 1,
1.152395, -1.691414, 2.760206, 1, 1, 1, 1, 1,
1.15678, 0.2333104, 0.5311874, 1, 1, 1, 1, 1,
1.164925, -0.9292539, 0.9074784, 1, 1, 1, 1, 1,
1.165112, -1.516773, 1.797934, 1, 1, 1, 1, 1,
1.171815, 0.007750122, 1.420156, 0, 0, 1, 1, 1,
1.178169, -0.6176475, 1.902337, 1, 0, 0, 1, 1,
1.1795, 0.02284642, 1.923722, 1, 0, 0, 1, 1,
1.182009, 0.5808659, 0.7804161, 1, 0, 0, 1, 1,
1.182142, 0.2294021, 1.309669, 1, 0, 0, 1, 1,
1.183246, -0.777221, 1.967824, 1, 0, 0, 1, 1,
1.191246, 1.389704, 0.3548709, 0, 0, 0, 1, 1,
1.1956, 0.602129, 0.9771619, 0, 0, 0, 1, 1,
1.203878, 0.646557, 1.611271, 0, 0, 0, 1, 1,
1.20486, 0.7948125, 0.8345872, 0, 0, 0, 1, 1,
1.207295, 1.079554, 3.052682, 0, 0, 0, 1, 1,
1.227477, 1.598099, 0.3378411, 0, 0, 0, 1, 1,
1.229083, -0.3450149, 2.052781, 0, 0, 0, 1, 1,
1.23538, 1.489308, -0.2605045, 1, 1, 1, 1, 1,
1.235408, -0.2522462, 2.364923, 1, 1, 1, 1, 1,
1.238132, -0.06339926, 2.026098, 1, 1, 1, 1, 1,
1.240326, -0.1217248, 1.471245, 1, 1, 1, 1, 1,
1.249376, 0.1254182, 2.467522, 1, 1, 1, 1, 1,
1.252243, -0.230746, 2.439687, 1, 1, 1, 1, 1,
1.257512, -1.293064, 1.262511, 1, 1, 1, 1, 1,
1.257837, 0.4999153, 1.723283, 1, 1, 1, 1, 1,
1.264192, 0.07399236, 0.5152432, 1, 1, 1, 1, 1,
1.264577, -0.3001367, 3.488726, 1, 1, 1, 1, 1,
1.266267, 0.09905813, 2.657665, 1, 1, 1, 1, 1,
1.270445, -0.4322923, 1.306848, 1, 1, 1, 1, 1,
1.270463, 0.3579615, 1.389351, 1, 1, 1, 1, 1,
1.27323, 1.204462, 1.77237, 1, 1, 1, 1, 1,
1.274601, -0.8436848, 1.923895, 1, 1, 1, 1, 1,
1.308784, -0.0377469, 3.012877, 0, 0, 1, 1, 1,
1.313035, -0.2246107, 0.3572065, 1, 0, 0, 1, 1,
1.317154, 0.4607927, 3.709545, 1, 0, 0, 1, 1,
1.323329, -0.7168823, 1.975619, 1, 0, 0, 1, 1,
1.329672, 0.7138056, -0.1932819, 1, 0, 0, 1, 1,
1.330668, -0.5498195, 2.433717, 1, 0, 0, 1, 1,
1.330966, -1.081647, 3.490659, 0, 0, 0, 1, 1,
1.335001, 1.856429, 0.8570156, 0, 0, 0, 1, 1,
1.349844, -0.2309978, 3.571342, 0, 0, 0, 1, 1,
1.353954, -1.022597, 2.485555, 0, 0, 0, 1, 1,
1.354697, -0.08078673, 1.631174, 0, 0, 0, 1, 1,
1.363275, 0.1257645, 0.7020656, 0, 0, 0, 1, 1,
1.376346, 1.620198, 0.8244758, 0, 0, 0, 1, 1,
1.38803, 1.50889, -0.3777212, 1, 1, 1, 1, 1,
1.397447, -1.244151, 1.017973, 1, 1, 1, 1, 1,
1.402841, 0.7437561, 0.737615, 1, 1, 1, 1, 1,
1.40908, 0.4116807, -0.1138027, 1, 1, 1, 1, 1,
1.409238, -0.2818611, 0.6624421, 1, 1, 1, 1, 1,
1.420513, -0.4463397, 1.646672, 1, 1, 1, 1, 1,
1.423687, 0.09962986, 1.300717, 1, 1, 1, 1, 1,
1.426442, -0.007456586, 1.110463, 1, 1, 1, 1, 1,
1.427941, 0.2491071, 1.998588, 1, 1, 1, 1, 1,
1.42832, 0.436756, 1.802344, 1, 1, 1, 1, 1,
1.445801, -0.1653109, 2.549809, 1, 1, 1, 1, 1,
1.452892, 2.81718, 2.330858, 1, 1, 1, 1, 1,
1.4534, 0.07304612, 1.696494, 1, 1, 1, 1, 1,
1.46786, -0.7623749, 1.262368, 1, 1, 1, 1, 1,
1.478964, -1.727356, 2.177575, 1, 1, 1, 1, 1,
1.479316, -0.9840612, 2.068845, 0, 0, 1, 1, 1,
1.498888, -0.4356161, 3.801404, 1, 0, 0, 1, 1,
1.505854, 0.3982703, 0.4344355, 1, 0, 0, 1, 1,
1.505947, -0.8620334, 1.917975, 1, 0, 0, 1, 1,
1.506261, 0.403397, 0.09136539, 1, 0, 0, 1, 1,
1.511455, 1.652329, 0.7589353, 1, 0, 0, 1, 1,
1.520663, 0.476364, 0.3667193, 0, 0, 0, 1, 1,
1.521598, 1.314588, -0.04970681, 0, 0, 0, 1, 1,
1.532037, -1.004187, 2.66836, 0, 0, 0, 1, 1,
1.542618, 0.5323738, 2.325709, 0, 0, 0, 1, 1,
1.56487, -1.252762, 5.083566, 0, 0, 0, 1, 1,
1.573395, -0.8163874, 3.574816, 0, 0, 0, 1, 1,
1.581267, 0.9314159, 0.4047401, 0, 0, 0, 1, 1,
1.587799, -0.6186897, 2.375832, 1, 1, 1, 1, 1,
1.5892, 0.8732308, 2.795418, 1, 1, 1, 1, 1,
1.598207, -0.513023, 1.974892, 1, 1, 1, 1, 1,
1.60024, 1.71202, 0.9586647, 1, 1, 1, 1, 1,
1.600552, 1.499547, 0.2544162, 1, 1, 1, 1, 1,
1.602308, 0.5170959, -0.8830409, 1, 1, 1, 1, 1,
1.611943, -1.546844, 1.144889, 1, 1, 1, 1, 1,
1.615865, -0.7546933, 2.759787, 1, 1, 1, 1, 1,
1.625942, 1.961551, 2.715633, 1, 1, 1, 1, 1,
1.631382, -0.4221087, 1.570827, 1, 1, 1, 1, 1,
1.642986, 1.696133, 1.221351, 1, 1, 1, 1, 1,
1.660301, 0.8762564, 2.195742, 1, 1, 1, 1, 1,
1.669966, -0.2685921, -0.03903733, 1, 1, 1, 1, 1,
1.675561, 0.2591895, 2.018634, 1, 1, 1, 1, 1,
1.677353, 1.013263, -1.084982, 1, 1, 1, 1, 1,
1.692032, 2.363332, 1.47385, 0, 0, 1, 1, 1,
1.693676, -0.566355, 0.7202448, 1, 0, 0, 1, 1,
1.698791, -0.6045372, 2.506882, 1, 0, 0, 1, 1,
1.70496, 0.2480677, 1.827235, 1, 0, 0, 1, 1,
1.725226, -0.02949911, 1.632652, 1, 0, 0, 1, 1,
1.741094, -0.838788, 3.295969, 1, 0, 0, 1, 1,
1.745896, -1.048821, 2.668054, 0, 0, 0, 1, 1,
1.775604, 0.7308251, 1.143272, 0, 0, 0, 1, 1,
1.784045, -0.01770333, 0.01403614, 0, 0, 0, 1, 1,
1.78768, -0.6801035, 1.739032, 0, 0, 0, 1, 1,
1.789733, 0.2462726, 2.663435, 0, 0, 0, 1, 1,
1.806423, 0.4842958, 2.717806, 0, 0, 0, 1, 1,
1.826506, -1.628698, 3.161791, 0, 0, 0, 1, 1,
1.826843, -0.4600736, 2.148345, 1, 1, 1, 1, 1,
1.855274, 1.805702, 2.654819, 1, 1, 1, 1, 1,
1.865642, 0.04465701, 4.208369, 1, 1, 1, 1, 1,
1.893592, -0.8364392, 3.700187, 1, 1, 1, 1, 1,
1.895474, -1.632658, 2.737029, 1, 1, 1, 1, 1,
1.912123, 0.6155419, 2.924721, 1, 1, 1, 1, 1,
1.924112, -0.5320295, 0.1183414, 1, 1, 1, 1, 1,
1.961005, 0.5212483, 0.5636118, 1, 1, 1, 1, 1,
1.966258, -0.2551648, 0.156341, 1, 1, 1, 1, 1,
1.984371, -1.211807, 2.558593, 1, 1, 1, 1, 1,
1.988776, -0.1448461, 1.493703, 1, 1, 1, 1, 1,
2.026357, 0.1114884, 0.9847856, 1, 1, 1, 1, 1,
2.02887, 2.096694, 0.6399572, 1, 1, 1, 1, 1,
2.030993, -0.08229265, 1.719573, 1, 1, 1, 1, 1,
2.068751, 0.5926883, 2.373416, 1, 1, 1, 1, 1,
2.082442, 0.9234409, 2.360351, 0, 0, 1, 1, 1,
2.083738, -0.8806046, 3.179679, 1, 0, 0, 1, 1,
2.101162, -1.825586, 0.7281054, 1, 0, 0, 1, 1,
2.124214, -0.6341659, 1.286013, 1, 0, 0, 1, 1,
2.17686, -1.182506, 1.620563, 1, 0, 0, 1, 1,
2.191512, -1.998315, 0.4387456, 1, 0, 0, 1, 1,
2.221552, -0.69414, 1.72274, 0, 0, 0, 1, 1,
2.28082, 0.7765261, -0.231057, 0, 0, 0, 1, 1,
2.353348, -0.2799567, 2.028344, 0, 0, 0, 1, 1,
2.363423, -0.5434715, -1.128846, 0, 0, 0, 1, 1,
2.377704, -0.6630933, 0.2035481, 0, 0, 0, 1, 1,
2.384521, 0.2749948, 1.552723, 0, 0, 0, 1, 1,
2.393479, 1.459948, -0.9676151, 0, 0, 0, 1, 1,
2.439588, -0.8918952, 3.000956, 1, 1, 1, 1, 1,
2.567334, -0.1033224, 1.857174, 1, 1, 1, 1, 1,
2.743842, 0.2966943, 0.2676637, 1, 1, 1, 1, 1,
2.820913, -0.9969778, 0.3326169, 1, 1, 1, 1, 1,
2.910779, -0.6694584, 1.022975, 1, 1, 1, 1, 1,
3.034017, -1.726704, 3.672608, 1, 1, 1, 1, 1,
3.358105, 0.5193954, 0.3251406, 1, 1, 1, 1, 1
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
var radius = 10.08004;
var distance = 35.40571;
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
mvMatrix.translate( 0.1227841, -0.05934429, 0.4038262 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.40571);
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
