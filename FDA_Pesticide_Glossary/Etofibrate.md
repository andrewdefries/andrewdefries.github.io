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
-3.242872, -0.01060474, -1.33127, 1, 0, 0, 1,
-2.80071, 0.374053, -0.6200696, 1, 0.007843138, 0, 1,
-2.670663, 0.294229, -2.228802, 1, 0.01176471, 0, 1,
-2.666656, 0.4915281, -1.13284, 1, 0.01960784, 0, 1,
-2.659219, 1.200898, 1.149545, 1, 0.02352941, 0, 1,
-2.615238, -0.2219339, -0.3685268, 1, 0.03137255, 0, 1,
-2.558153, -0.06818798, -2.298113, 1, 0.03529412, 0, 1,
-2.421008, 0.4328298, -0.6924052, 1, 0.04313726, 0, 1,
-2.403672, -0.5508857, -2.934894, 1, 0.04705882, 0, 1,
-2.348403, 1.091767, -0.7060007, 1, 0.05490196, 0, 1,
-2.322097, -0.4570184, -1.579617, 1, 0.05882353, 0, 1,
-2.308424, -0.118437, -1.369508, 1, 0.06666667, 0, 1,
-2.226899, -1.735069, -3.775279, 1, 0.07058824, 0, 1,
-2.210198, -1.640944, -1.51169, 1, 0.07843138, 0, 1,
-2.172071, -0.02387607, -2.026197, 1, 0.08235294, 0, 1,
-2.135337, -0.4450502, -2.202739, 1, 0.09019608, 0, 1,
-2.132755, -0.4933558, -2.241253, 1, 0.09411765, 0, 1,
-2.126817, -0.09709699, -1.288115, 1, 0.1019608, 0, 1,
-2.107162, -0.8394843, -1.809357, 1, 0.1098039, 0, 1,
-2.085235, 1.993504, 0.5067427, 1, 0.1137255, 0, 1,
-2.081189, 1.187966, -0.06849267, 1, 0.1215686, 0, 1,
-2.070695, -0.2830013, -0.9695054, 1, 0.1254902, 0, 1,
-2.065182, -0.1003219, -2.103775, 1, 0.1333333, 0, 1,
-2.042918, 0.1842934, -0.515551, 1, 0.1372549, 0, 1,
-2.034781, 0.2455607, -0.9984583, 1, 0.145098, 0, 1,
-2.028167, -1.100499, -1.250315, 1, 0.1490196, 0, 1,
-2.026258, 0.8551276, -1.168295, 1, 0.1568628, 0, 1,
-2.022536, -0.5591836, -0.6659221, 1, 0.1607843, 0, 1,
-1.981017, -0.3146256, -2.070181, 1, 0.1686275, 0, 1,
-1.959858, 1.813709, 0.5661112, 1, 0.172549, 0, 1,
-1.919444, 0.8266954, -0.1555429, 1, 0.1803922, 0, 1,
-1.915384, -0.02953131, -2.440406, 1, 0.1843137, 0, 1,
-1.857602, -0.1304523, -3.094398, 1, 0.1921569, 0, 1,
-1.853445, -0.7405708, -1.539562, 1, 0.1960784, 0, 1,
-1.848119, -0.0598645, -1.079582, 1, 0.2039216, 0, 1,
-1.833511, 0.7646871, -1.017635, 1, 0.2117647, 0, 1,
-1.820543, -0.4647226, 0.1748958, 1, 0.2156863, 0, 1,
-1.781033, -1.722273, -2.041452, 1, 0.2235294, 0, 1,
-1.777293, 1.131621, -0.7942874, 1, 0.227451, 0, 1,
-1.73332, -1.931314, -2.361896, 1, 0.2352941, 0, 1,
-1.732231, -0.6500814, -2.637769, 1, 0.2392157, 0, 1,
-1.725804, -0.004050571, -2.032149, 1, 0.2470588, 0, 1,
-1.712297, 0.1284862, 0.2582447, 1, 0.2509804, 0, 1,
-1.699852, -0.5417973, -2.135267, 1, 0.2588235, 0, 1,
-1.693614, -0.6899312, -0.4017057, 1, 0.2627451, 0, 1,
-1.692111, 0.5918768, 0.3949046, 1, 0.2705882, 0, 1,
-1.675035, -0.09383531, -1.985167, 1, 0.2745098, 0, 1,
-1.674035, -1.430245, -2.678607, 1, 0.282353, 0, 1,
-1.673298, -0.367195, -2.50762, 1, 0.2862745, 0, 1,
-1.644329, 0.9111693, -1.139961, 1, 0.2941177, 0, 1,
-1.633872, -1.553639, -2.251141, 1, 0.3019608, 0, 1,
-1.629929, 0.4773157, -2.741534, 1, 0.3058824, 0, 1,
-1.62343, -0.1358779, -1.951148, 1, 0.3137255, 0, 1,
-1.616398, 0.4394378, 0.4973467, 1, 0.3176471, 0, 1,
-1.615712, 0.6350769, -1.400734, 1, 0.3254902, 0, 1,
-1.601506, -0.03758959, -0.6145335, 1, 0.3294118, 0, 1,
-1.601134, 0.7753131, -0.1634958, 1, 0.3372549, 0, 1,
-1.579098, 0.3983386, 0.4372394, 1, 0.3411765, 0, 1,
-1.529682, 0.6567371, -1.956192, 1, 0.3490196, 0, 1,
-1.528855, 0.06810524, -0.0006256414, 1, 0.3529412, 0, 1,
-1.508206, -0.1264183, -2.365291, 1, 0.3607843, 0, 1,
-1.503538, -0.3232467, -2.666655, 1, 0.3647059, 0, 1,
-1.490511, -1.5155, -1.238715, 1, 0.372549, 0, 1,
-1.473445, 0.9681856, -0.7410765, 1, 0.3764706, 0, 1,
-1.470196, 0.03103798, -1.884048, 1, 0.3843137, 0, 1,
-1.467344, 1.296103, -2.453888, 1, 0.3882353, 0, 1,
-1.464252, 3.257766, 0.9226351, 1, 0.3960784, 0, 1,
-1.459335, -0.06363816, -0.7974468, 1, 0.4039216, 0, 1,
-1.453805, -0.9579307, -1.826834, 1, 0.4078431, 0, 1,
-1.438424, 0.7941128, -2.504224, 1, 0.4156863, 0, 1,
-1.435004, 2.385763, 0.1167564, 1, 0.4196078, 0, 1,
-1.416975, -0.1071055, -2.208449, 1, 0.427451, 0, 1,
-1.412766, -0.077139, -0.3486668, 1, 0.4313726, 0, 1,
-1.40326, 0.3795066, -1.284133, 1, 0.4392157, 0, 1,
-1.385537, -0.6118706, -3.900908, 1, 0.4431373, 0, 1,
-1.377905, -0.1480222, -2.397043, 1, 0.4509804, 0, 1,
-1.376401, 0.1197648, -1.2691, 1, 0.454902, 0, 1,
-1.373323, -0.1691384, -0.9002751, 1, 0.4627451, 0, 1,
-1.368873, 0.1537868, -1.107087, 1, 0.4666667, 0, 1,
-1.367438, 1.581011, 0.310289, 1, 0.4745098, 0, 1,
-1.363331, -1.853018, -1.979728, 1, 0.4784314, 0, 1,
-1.344549, -0.8138419, -1.657512, 1, 0.4862745, 0, 1,
-1.34064, -1.298649, -2.367683, 1, 0.4901961, 0, 1,
-1.312059, 0.1878512, -0.601612, 1, 0.4980392, 0, 1,
-1.311597, 1.04264, -1.050626, 1, 0.5058824, 0, 1,
-1.302671, 0.2924581, -3.449617, 1, 0.509804, 0, 1,
-1.298643, -1.058161, -1.633333, 1, 0.5176471, 0, 1,
-1.296295, 0.6909511, -2.310728, 1, 0.5215687, 0, 1,
-1.29597, -0.4927809, -3.163523, 1, 0.5294118, 0, 1,
-1.288786, -0.7639024, -3.064957, 1, 0.5333334, 0, 1,
-1.27691, -0.3655749, -1.633042, 1, 0.5411765, 0, 1,
-1.276569, 0.08015042, 0.08814634, 1, 0.5450981, 0, 1,
-1.271384, -1.422629, -1.031992, 1, 0.5529412, 0, 1,
-1.26739, -1.361325, 0.5405554, 1, 0.5568628, 0, 1,
-1.263592, -1.901281, -3.034343, 1, 0.5647059, 0, 1,
-1.260618, 1.059584, -0.760419, 1, 0.5686275, 0, 1,
-1.255318, -1.426669, -3.301789, 1, 0.5764706, 0, 1,
-1.254062, 0.723215, 0.5389508, 1, 0.5803922, 0, 1,
-1.249712, 0.9585264, 0.1310913, 1, 0.5882353, 0, 1,
-1.242663, 0.9481156, 0.3246462, 1, 0.5921569, 0, 1,
-1.240987, 0.06252402, -1.524381, 1, 0.6, 0, 1,
-1.239033, 0.2112122, -1.639742, 1, 0.6078432, 0, 1,
-1.236115, 1.192696, 0.1142266, 1, 0.6117647, 0, 1,
-1.234285, 1.138714, -3.235591, 1, 0.6196079, 0, 1,
-1.229533, 1.368878, -0.1209188, 1, 0.6235294, 0, 1,
-1.228653, -0.5113956, -3.617561, 1, 0.6313726, 0, 1,
-1.226823, -0.3986226, -1.03668, 1, 0.6352941, 0, 1,
-1.224401, -1.24762, -3.299192, 1, 0.6431373, 0, 1,
-1.213613, 0.7546601, -0.2335218, 1, 0.6470588, 0, 1,
-1.207372, 0.5697283, -0.7543887, 1, 0.654902, 0, 1,
-1.204609, 0.3462608, 0.1855032, 1, 0.6588235, 0, 1,
-1.198633, -1.113153, -2.30263, 1, 0.6666667, 0, 1,
-1.198294, -0.04959305, -1.250041, 1, 0.6705883, 0, 1,
-1.196286, 1.665609, 1.089075, 1, 0.6784314, 0, 1,
-1.194805, 0.1110215, -3.585476, 1, 0.682353, 0, 1,
-1.193814, 0.04874514, -2.624364, 1, 0.6901961, 0, 1,
-1.193811, 1.772012, -1.419916, 1, 0.6941177, 0, 1,
-1.193046, -0.0777302, -0.2326215, 1, 0.7019608, 0, 1,
-1.191872, 1.222925, -0.9594535, 1, 0.7098039, 0, 1,
-1.1894, 0.1812971, -2.162761, 1, 0.7137255, 0, 1,
-1.186889, 0.1791454, -0.4049111, 1, 0.7215686, 0, 1,
-1.185027, 1.006714, -2.78811, 1, 0.7254902, 0, 1,
-1.183324, -0.3864152, -2.481992, 1, 0.7333333, 0, 1,
-1.180787, -0.6507015, -2.368049, 1, 0.7372549, 0, 1,
-1.177173, 1.046106, -2.533291, 1, 0.7450981, 0, 1,
-1.175918, 0.6945246, 1.13322, 1, 0.7490196, 0, 1,
-1.17388, 0.7783924, -0.5648137, 1, 0.7568628, 0, 1,
-1.173735, -0.6360434, -1.28294, 1, 0.7607843, 0, 1,
-1.172834, -0.1720919, -1.663106, 1, 0.7686275, 0, 1,
-1.161852, 1.893651, -0.8659812, 1, 0.772549, 0, 1,
-1.157905, -0.2913212, -0.4413198, 1, 0.7803922, 0, 1,
-1.15429, 0.02972849, -1.622124, 1, 0.7843137, 0, 1,
-1.149159, -0.4181485, -2.384794, 1, 0.7921569, 0, 1,
-1.147266, -0.6304751, -2.470937, 1, 0.7960784, 0, 1,
-1.1394, 0.005922229, -2.78266, 1, 0.8039216, 0, 1,
-1.12556, 1.857472, 0.6000112, 1, 0.8117647, 0, 1,
-1.124463, 0.9596153, -0.5960618, 1, 0.8156863, 0, 1,
-1.121682, 1.424824, 0.07957329, 1, 0.8235294, 0, 1,
-1.109259, 0.8173499, 0.3518086, 1, 0.827451, 0, 1,
-1.107569, -0.3692883, -2.344709, 1, 0.8352941, 0, 1,
-1.099754, -0.7386538, -2.595915, 1, 0.8392157, 0, 1,
-1.099363, 0.5506092, -1.309166, 1, 0.8470588, 0, 1,
-1.095267, 0.1004305, -1.866755, 1, 0.8509804, 0, 1,
-1.093439, 0.630955, -0.7219203, 1, 0.8588235, 0, 1,
-1.091241, -0.07843074, 0.1451638, 1, 0.8627451, 0, 1,
-1.087943, -0.2334246, -4.056434, 1, 0.8705882, 0, 1,
-1.084701, 0.7869954, -0.885603, 1, 0.8745098, 0, 1,
-1.079785, -1.347803, -1.651105, 1, 0.8823529, 0, 1,
-1.079617, 0.6902305, -2.050006, 1, 0.8862745, 0, 1,
-1.078635, -0.4508595, -2.689093, 1, 0.8941177, 0, 1,
-1.077996, 1.477444, 0.2573203, 1, 0.8980392, 0, 1,
-1.0779, 2.535232, 0.6176223, 1, 0.9058824, 0, 1,
-1.075436, -1.194647, -1.509063, 1, 0.9137255, 0, 1,
-1.073923, -2.485322, -1.857924, 1, 0.9176471, 0, 1,
-1.061491, -0.8171046, -2.798893, 1, 0.9254902, 0, 1,
-1.060031, -1.299392, -1.129612, 1, 0.9294118, 0, 1,
-1.05907, 0.08310415, -1.136133, 1, 0.9372549, 0, 1,
-1.050265, 0.169967, -1.695068, 1, 0.9411765, 0, 1,
-1.049607, -1.476735, -1.942594, 1, 0.9490196, 0, 1,
-1.048714, -0.4394321, -2.337595, 1, 0.9529412, 0, 1,
-1.040144, 0.7181311, -0.2848071, 1, 0.9607843, 0, 1,
-1.030933, -0.2889253, -2.480995, 1, 0.9647059, 0, 1,
-1.027536, 0.249053, -1.323541, 1, 0.972549, 0, 1,
-1.023759, 0.1318386, -1.792723, 1, 0.9764706, 0, 1,
-1.01841, 0.2032347, -1.128535, 1, 0.9843137, 0, 1,
-1.015171, -0.1664392, -3.928553, 1, 0.9882353, 0, 1,
-1.014452, 0.6820318, -2.166484, 1, 0.9960784, 0, 1,
-1.012856, -0.5461608, 1.143581, 0.9960784, 1, 0, 1,
-1.005939, -0.4916651, -0.6404465, 0.9921569, 1, 0, 1,
-1.002887, -1.988986, -0.7698384, 0.9843137, 1, 0, 1,
-0.9993481, 0.1216634, -1.321206, 0.9803922, 1, 0, 1,
-0.9968902, -0.5228575, -1.705715, 0.972549, 1, 0, 1,
-0.9913458, -0.8421821, -1.484597, 0.9686275, 1, 0, 1,
-0.9820249, 0.7535221, -1.718481, 0.9607843, 1, 0, 1,
-0.9810538, -0.08515777, -0.04534145, 0.9568627, 1, 0, 1,
-0.9797952, 0.88679, -0.0001194035, 0.9490196, 1, 0, 1,
-0.9687255, -1.57296, -1.808663, 0.945098, 1, 0, 1,
-0.9642998, -0.2474811, -1.941921, 0.9372549, 1, 0, 1,
-0.9596593, 1.025298, -3.234199, 0.9333333, 1, 0, 1,
-0.9595863, 0.4650427, -1.699628, 0.9254902, 1, 0, 1,
-0.9585887, 1.213902, -2.124698, 0.9215686, 1, 0, 1,
-0.9579413, 0.7675794, 0.005523049, 0.9137255, 1, 0, 1,
-0.9564023, -0.8517206, -2.264946, 0.9098039, 1, 0, 1,
-0.954816, -0.5298871, -1.622023, 0.9019608, 1, 0, 1,
-0.9337045, -0.345519, -1.89032, 0.8941177, 1, 0, 1,
-0.932041, 0.08910999, -3.383163, 0.8901961, 1, 0, 1,
-0.9303994, -1.775275, -2.145217, 0.8823529, 1, 0, 1,
-0.9256744, 0.1389677, -1.647873, 0.8784314, 1, 0, 1,
-0.9235322, 0.05154471, -1.738432, 0.8705882, 1, 0, 1,
-0.922001, -0.1605527, -0.9890811, 0.8666667, 1, 0, 1,
-0.91347, -0.6046777, -2.031408, 0.8588235, 1, 0, 1,
-0.9127929, 0.4169723, -1.012485, 0.854902, 1, 0, 1,
-0.9036132, 0.9248396, -0.5249231, 0.8470588, 1, 0, 1,
-0.9034439, -1.538052, -2.005174, 0.8431373, 1, 0, 1,
-0.8998793, -1.30737, -2.561204, 0.8352941, 1, 0, 1,
-0.8915676, 0.9247566, -1.227937, 0.8313726, 1, 0, 1,
-0.8904658, -1.105841, -0.6945859, 0.8235294, 1, 0, 1,
-0.8887038, 0.259558, -0.1685388, 0.8196079, 1, 0, 1,
-0.8797167, -1.602328, -2.24056, 0.8117647, 1, 0, 1,
-0.8762745, -1.234432, -2.991837, 0.8078431, 1, 0, 1,
-0.8752018, -1.905298, -2.36783, 0.8, 1, 0, 1,
-0.8732648, -0.3929878, -0.254869, 0.7921569, 1, 0, 1,
-0.8684618, 0.4509698, -0.2537487, 0.7882353, 1, 0, 1,
-0.8661655, -1.016571, -2.515435, 0.7803922, 1, 0, 1,
-0.8652348, 0.5730205, -1.569902, 0.7764706, 1, 0, 1,
-0.8494154, 0.6051433, -0.5849572, 0.7686275, 1, 0, 1,
-0.842552, -0.7354165, -2.652643, 0.7647059, 1, 0, 1,
-0.8411417, -0.08954129, -2.580591, 0.7568628, 1, 0, 1,
-0.8403717, 0.01984174, -0.2907503, 0.7529412, 1, 0, 1,
-0.8391812, -2.350798, -3.169801, 0.7450981, 1, 0, 1,
-0.8352314, 0.9286579, 0.5624844, 0.7411765, 1, 0, 1,
-0.8337507, -1.043656, -3.69166, 0.7333333, 1, 0, 1,
-0.8327748, 0.6194692, -1.769457, 0.7294118, 1, 0, 1,
-0.8327224, -0.4015574, -1.693384, 0.7215686, 1, 0, 1,
-0.821968, 1.622704, 0.9992881, 0.7176471, 1, 0, 1,
-0.8206384, -0.6988429, -2.303116, 0.7098039, 1, 0, 1,
-0.8195633, -0.3971588, -2.95034, 0.7058824, 1, 0, 1,
-0.8114406, 1.490497, -0.9647892, 0.6980392, 1, 0, 1,
-0.8104745, -0.4512853, -2.428936, 0.6901961, 1, 0, 1,
-0.8052743, -0.6710373, -1.836485, 0.6862745, 1, 0, 1,
-0.8019232, -0.6664531, -2.96415, 0.6784314, 1, 0, 1,
-0.7999499, 0.9045836, -1.592549, 0.6745098, 1, 0, 1,
-0.7991864, -0.2906601, -0.7400631, 0.6666667, 1, 0, 1,
-0.798374, -1.065279, -2.163641, 0.6627451, 1, 0, 1,
-0.7948775, 0.5890089, -1.075934, 0.654902, 1, 0, 1,
-0.7881856, -0.2942611, -4.041136, 0.6509804, 1, 0, 1,
-0.7877093, -1.259271, -1.311691, 0.6431373, 1, 0, 1,
-0.7843561, -1.677343, -3.984642, 0.6392157, 1, 0, 1,
-0.7738351, 0.40795, -1.158448, 0.6313726, 1, 0, 1,
-0.7717221, -1.342125, -3.325586, 0.627451, 1, 0, 1,
-0.7701711, -0.09112871, -0.7845263, 0.6196079, 1, 0, 1,
-0.7698727, 0.6535621, -1.953406, 0.6156863, 1, 0, 1,
-0.7687137, 2.289908, 0.5365875, 0.6078432, 1, 0, 1,
-0.765503, -0.1573611, -2.710853, 0.6039216, 1, 0, 1,
-0.757266, -1.539156, -2.071321, 0.5960785, 1, 0, 1,
-0.7563423, 0.2754039, -1.465971, 0.5882353, 1, 0, 1,
-0.754362, -0.07535058, -4.526258, 0.5843138, 1, 0, 1,
-0.7528748, -2.234508, -1.799891, 0.5764706, 1, 0, 1,
-0.752275, -1.599425, -3.21145, 0.572549, 1, 0, 1,
-0.7503316, -1.404582, -1.805584, 0.5647059, 1, 0, 1,
-0.7421602, -0.8536074, -1.603938, 0.5607843, 1, 0, 1,
-0.7393268, 0.3614962, -1.173637, 0.5529412, 1, 0, 1,
-0.737759, 0.4222234, -0.04739419, 0.5490196, 1, 0, 1,
-0.7270442, 0.146792, 0.09832697, 0.5411765, 1, 0, 1,
-0.7244309, 0.1224241, -0.9614012, 0.5372549, 1, 0, 1,
-0.7219006, 0.04853856, -0.1446543, 0.5294118, 1, 0, 1,
-0.7148544, 1.365869, -0.181499, 0.5254902, 1, 0, 1,
-0.712635, 1.056327, -1.092018, 0.5176471, 1, 0, 1,
-0.7124082, 1.085527, -0.07184841, 0.5137255, 1, 0, 1,
-0.711834, 0.9606848, -1.217723, 0.5058824, 1, 0, 1,
-0.7015773, -1.258595, -0.9208489, 0.5019608, 1, 0, 1,
-0.6998435, -0.6058204, -1.91, 0.4941176, 1, 0, 1,
-0.6991811, -0.8612766, -1.176517, 0.4862745, 1, 0, 1,
-0.6976022, -2.836724, -3.487981, 0.4823529, 1, 0, 1,
-0.6932313, -0.6586509, -1.811041, 0.4745098, 1, 0, 1,
-0.6926956, 0.3961482, -0.5923486, 0.4705882, 1, 0, 1,
-0.6885104, -0.723206, -2.875694, 0.4627451, 1, 0, 1,
-0.684512, 0.4681899, -1.960879, 0.4588235, 1, 0, 1,
-0.6805437, -0.490478, -1.874713, 0.4509804, 1, 0, 1,
-0.6774558, 0.4183863, -2.191652, 0.4470588, 1, 0, 1,
-0.6770504, -0.6780012, -2.065228, 0.4392157, 1, 0, 1,
-0.6760954, 1.074044, 0.3929921, 0.4352941, 1, 0, 1,
-0.675063, 0.8614992, 0.379094, 0.427451, 1, 0, 1,
-0.6718892, -0.4678521, -3.154041, 0.4235294, 1, 0, 1,
-0.6714078, -0.1660526, -0.7290894, 0.4156863, 1, 0, 1,
-0.6700188, -1.361672, -2.575644, 0.4117647, 1, 0, 1,
-0.6698557, -0.7318858, -2.136852, 0.4039216, 1, 0, 1,
-0.6694572, 0.5321091, -0.9995492, 0.3960784, 1, 0, 1,
-0.6579304, 0.3223838, -1.200309, 0.3921569, 1, 0, 1,
-0.6536003, 0.7069774, 1.194406, 0.3843137, 1, 0, 1,
-0.6522236, -0.9386448, -2.264311, 0.3803922, 1, 0, 1,
-0.6453495, 1.215046, -2.301567, 0.372549, 1, 0, 1,
-0.6377718, -0.18333, -3.013975, 0.3686275, 1, 0, 1,
-0.6366296, 0.04870719, -1.404438, 0.3607843, 1, 0, 1,
-0.6330991, -0.2573012, -2.926161, 0.3568628, 1, 0, 1,
-0.632249, -0.7651595, -2.916167, 0.3490196, 1, 0, 1,
-0.6293115, -0.2007705, -2.079095, 0.345098, 1, 0, 1,
-0.6250218, -1.477818, -2.509359, 0.3372549, 1, 0, 1,
-0.6203043, 0.3577724, -1.478336, 0.3333333, 1, 0, 1,
-0.6191337, -0.2565181, -2.560209, 0.3254902, 1, 0, 1,
-0.6183388, 0.132438, -1.83098, 0.3215686, 1, 0, 1,
-0.6164321, -0.3221631, -3.456267, 0.3137255, 1, 0, 1,
-0.6105773, 0.4536627, -3.182538, 0.3098039, 1, 0, 1,
-0.6029761, -1.112899, -1.802071, 0.3019608, 1, 0, 1,
-0.6009445, -0.8200371, -3.571511, 0.2941177, 1, 0, 1,
-0.5971624, 1.839082, -2.447214, 0.2901961, 1, 0, 1,
-0.5925422, -2.43537, -1.624104, 0.282353, 1, 0, 1,
-0.5916707, -0.1065708, -3.017447, 0.2784314, 1, 0, 1,
-0.5890391, -1.699249, -3.569419, 0.2705882, 1, 0, 1,
-0.5887118, 1.407965, 0.4715458, 0.2666667, 1, 0, 1,
-0.5877931, 0.1351707, -0.4946488, 0.2588235, 1, 0, 1,
-0.5865769, 0.5506669, 1.288265, 0.254902, 1, 0, 1,
-0.584354, -0.4317206, -1.429051, 0.2470588, 1, 0, 1,
-0.5841781, -0.7991382, 0.03302488, 0.2431373, 1, 0, 1,
-0.5830988, -2.044179, -2.333572, 0.2352941, 1, 0, 1,
-0.5822927, -0.823289, -1.918331, 0.2313726, 1, 0, 1,
-0.5803733, 0.3894558, 0.652508, 0.2235294, 1, 0, 1,
-0.5769835, 0.8155242, -0.6983592, 0.2196078, 1, 0, 1,
-0.574914, 0.2166993, -1.302389, 0.2117647, 1, 0, 1,
-0.5702717, -0.2562367, -2.433008, 0.2078431, 1, 0, 1,
-0.5695103, 0.008754613, -1.38132, 0.2, 1, 0, 1,
-0.5692471, 0.6996661, 0.7733443, 0.1921569, 1, 0, 1,
-0.5668007, -0.2454776, -1.776746, 0.1882353, 1, 0, 1,
-0.5663021, 1.676602, 0.1287114, 0.1803922, 1, 0, 1,
-0.5628491, 1.33022, 0.530187, 0.1764706, 1, 0, 1,
-0.5572082, 0.2922665, 1.099105, 0.1686275, 1, 0, 1,
-0.5569345, 1.767274, 0.5630016, 0.1647059, 1, 0, 1,
-0.5533836, 1.353459, -0.8858445, 0.1568628, 1, 0, 1,
-0.5530806, 0.2576575, -0.8474785, 0.1529412, 1, 0, 1,
-0.5471999, -0.3732462, -1.460733, 0.145098, 1, 0, 1,
-0.5458928, -0.3429383, -2.868485, 0.1411765, 1, 0, 1,
-0.5416228, -0.3232153, -1.258426, 0.1333333, 1, 0, 1,
-0.537728, 0.07468163, -1.793307, 0.1294118, 1, 0, 1,
-0.530091, 0.3815616, -1.779376, 0.1215686, 1, 0, 1,
-0.5294507, -1.19919, -3.016953, 0.1176471, 1, 0, 1,
-0.5265238, -0.002625414, -1.013637, 0.1098039, 1, 0, 1,
-0.523472, 0.4802867, -1.786695, 0.1058824, 1, 0, 1,
-0.523265, 0.2510693, -2.232641, 0.09803922, 1, 0, 1,
-0.5169433, -1.295852, -3.382898, 0.09019608, 1, 0, 1,
-0.516332, 0.8459372, 0.09128686, 0.08627451, 1, 0, 1,
-0.5151806, -0.8063664, -2.33235, 0.07843138, 1, 0, 1,
-0.5150739, 1.966808, -0.9196023, 0.07450981, 1, 0, 1,
-0.5148973, 1.21659, -0.8500181, 0.06666667, 1, 0, 1,
-0.5141995, -0.08442934, -1.368852, 0.0627451, 1, 0, 1,
-0.5085458, -0.9552673, -3.77311, 0.05490196, 1, 0, 1,
-0.5005972, 0.1679181, -1.439713, 0.05098039, 1, 0, 1,
-0.5000083, 0.7305009, 1.745006, 0.04313726, 1, 0, 1,
-0.4980024, -1.397016, -3.922385, 0.03921569, 1, 0, 1,
-0.4925425, -0.08658094, -2.056607, 0.03137255, 1, 0, 1,
-0.4843869, 0.9863498, -1.791689, 0.02745098, 1, 0, 1,
-0.4833367, -1.165332, -4.073871, 0.01960784, 1, 0, 1,
-0.4796352, -1.253163, -3.177844, 0.01568628, 1, 0, 1,
-0.4783685, -0.2773567, -1.924414, 0.007843138, 1, 0, 1,
-0.475181, 0.3336904, 0.4633313, 0.003921569, 1, 0, 1,
-0.474805, 0.8907517, -0.9457363, 0, 1, 0.003921569, 1,
-0.4748028, 1.040573, -2.190306, 0, 1, 0.01176471, 1,
-0.4705529, 0.4815354, -1.990208, 0, 1, 0.01568628, 1,
-0.4690751, -0.4478403, -0.689373, 0, 1, 0.02352941, 1,
-0.4685126, 0.1468488, -2.07281, 0, 1, 0.02745098, 1,
-0.4683597, 0.1572615, -0.6758891, 0, 1, 0.03529412, 1,
-0.4630808, -0.7238975, -2.979551, 0, 1, 0.03921569, 1,
-0.4614228, 0.9467713, 0.002344607, 0, 1, 0.04705882, 1,
-0.4600684, -0.2869136, -0.6346173, 0, 1, 0.05098039, 1,
-0.4566357, -0.5488877, -1.067434, 0, 1, 0.05882353, 1,
-0.4564701, 0.2201312, -2.126054, 0, 1, 0.0627451, 1,
-0.4564193, 2.533037, -1.41196, 0, 1, 0.07058824, 1,
-0.4543501, 0.3204761, -1.080309, 0, 1, 0.07450981, 1,
-0.4532885, -0.4059921, -0.4215666, 0, 1, 0.08235294, 1,
-0.4485372, -0.9341334, -3.621765, 0, 1, 0.08627451, 1,
-0.4477505, -0.5278054, -1.766849, 0, 1, 0.09411765, 1,
-0.4474009, 2.12126, -0.8606525, 0, 1, 0.1019608, 1,
-0.4459081, 0.8761955, -0.1240078, 0, 1, 0.1058824, 1,
-0.440019, -0.7677072, -1.705047, 0, 1, 0.1137255, 1,
-0.4368531, 2.291818, -0.2932521, 0, 1, 0.1176471, 1,
-0.4336301, 3.58295, -0.8510711, 0, 1, 0.1254902, 1,
-0.4324908, 1.279662, 0.2230088, 0, 1, 0.1294118, 1,
-0.4318219, 1.141253, -0.03405936, 0, 1, 0.1372549, 1,
-0.4309607, 1.09539, -0.9816634, 0, 1, 0.1411765, 1,
-0.4238416, -1.65757, -3.890859, 0, 1, 0.1490196, 1,
-0.4224564, 0.6049869, -1.636357, 0, 1, 0.1529412, 1,
-0.4221126, 0.7104127, 1.005946, 0, 1, 0.1607843, 1,
-0.4206689, 0.2397314, -0.03856834, 0, 1, 0.1647059, 1,
-0.416887, -0.5813947, -3.35188, 0, 1, 0.172549, 1,
-0.416415, 0.2910216, -1.353508, 0, 1, 0.1764706, 1,
-0.4100181, 1.492417, 0.258564, 0, 1, 0.1843137, 1,
-0.405544, 0.1772562, -0.9543918, 0, 1, 0.1882353, 1,
-0.3983239, -0.04182476, -3.021505, 0, 1, 0.1960784, 1,
-0.3979762, -1.205933, -0.9138506, 0, 1, 0.2039216, 1,
-0.3977056, -1.166524, -1.572097, 0, 1, 0.2078431, 1,
-0.3972504, -1.145714, -1.759571, 0, 1, 0.2156863, 1,
-0.3947278, -0.1751267, -2.216171, 0, 1, 0.2196078, 1,
-0.3932715, -0.2176556, -2.576224, 0, 1, 0.227451, 1,
-0.3893379, -0.1430971, -3.861674, 0, 1, 0.2313726, 1,
-0.3876362, 0.1503658, -0.5297241, 0, 1, 0.2392157, 1,
-0.3859849, -0.4982881, -3.031034, 0, 1, 0.2431373, 1,
-0.3842825, -0.2488647, -2.507815, 0, 1, 0.2509804, 1,
-0.3785928, 0.5738466, 0.1406406, 0, 1, 0.254902, 1,
-0.3663897, 1.576177, 1.438495, 0, 1, 0.2627451, 1,
-0.3655581, -0.6595538, -1.619622, 0, 1, 0.2666667, 1,
-0.3638081, 0.6016099, -1.636655, 0, 1, 0.2745098, 1,
-0.3615913, -2.342455, -1.44507, 0, 1, 0.2784314, 1,
-0.3602522, 0.01677226, -1.065987, 0, 1, 0.2862745, 1,
-0.3598416, -0.1416956, -2.032308, 0, 1, 0.2901961, 1,
-0.3590563, 0.8190916, 0.6615093, 0, 1, 0.2980392, 1,
-0.3515549, 1.694672, -0.1129377, 0, 1, 0.3058824, 1,
-0.3514535, 0.6956478, -2.240124, 0, 1, 0.3098039, 1,
-0.3495583, -1.465532, -1.185577, 0, 1, 0.3176471, 1,
-0.3481844, 0.646593, -0.1209687, 0, 1, 0.3215686, 1,
-0.3445704, 0.6700934, -1.930616, 0, 1, 0.3294118, 1,
-0.340299, 0.3827455, 0.9058505, 0, 1, 0.3333333, 1,
-0.3346658, -0.06348579, -2.07178, 0, 1, 0.3411765, 1,
-0.3346242, -0.7790312, -2.660847, 0, 1, 0.345098, 1,
-0.332558, 0.3280869, -0.5517851, 0, 1, 0.3529412, 1,
-0.3311721, 0.8373559, 0.7227189, 0, 1, 0.3568628, 1,
-0.3293422, -0.9813809, -2.656328, 0, 1, 0.3647059, 1,
-0.3256932, -0.05872225, -2.537754, 0, 1, 0.3686275, 1,
-0.3237372, 1.437285, 1.492892, 0, 1, 0.3764706, 1,
-0.3212857, 2.046423, 0.7642149, 0, 1, 0.3803922, 1,
-0.3198725, 1.967746, -0.1492522, 0, 1, 0.3882353, 1,
-0.3176413, -0.01878307, -2.038217, 0, 1, 0.3921569, 1,
-0.3005672, 1.744133, -0.3123138, 0, 1, 0.4, 1,
-0.2986907, -2.332864, -3.43787, 0, 1, 0.4078431, 1,
-0.2947076, 0.1830166, -0.08872344, 0, 1, 0.4117647, 1,
-0.29345, -0.7502071, -4.201393, 0, 1, 0.4196078, 1,
-0.291211, 0.2255948, 0.08889047, 0, 1, 0.4235294, 1,
-0.2911238, -0.2171436, -0.9549336, 0, 1, 0.4313726, 1,
-0.2883123, -0.691286, -1.297296, 0, 1, 0.4352941, 1,
-0.2862933, 1.470152, -0.5219477, 0, 1, 0.4431373, 1,
-0.2799144, -0.5478618, -2.722742, 0, 1, 0.4470588, 1,
-0.2785506, 0.2410892, -1.965102, 0, 1, 0.454902, 1,
-0.2737027, 0.1966287, -2.146488, 0, 1, 0.4588235, 1,
-0.2641036, 0.8540961, -1.215144, 0, 1, 0.4666667, 1,
-0.2578517, 0.360716, -0.5632458, 0, 1, 0.4705882, 1,
-0.2521209, -0.01002169, -1.734044, 0, 1, 0.4784314, 1,
-0.2468466, 0.4542662, -1.846497, 0, 1, 0.4823529, 1,
-0.2445431, -2.064376, -4.014011, 0, 1, 0.4901961, 1,
-0.2437838, -0.2706296, -1.831179, 0, 1, 0.4941176, 1,
-0.2434819, -1.120207, -2.372294, 0, 1, 0.5019608, 1,
-0.2404302, -0.3141067, 1.519211, 0, 1, 0.509804, 1,
-0.2393477, -0.7252966, -3.841551, 0, 1, 0.5137255, 1,
-0.2357976, 1.041695, 0.8167127, 0, 1, 0.5215687, 1,
-0.2354452, -0.6620699, -1.960791, 0, 1, 0.5254902, 1,
-0.2311601, 0.08247948, -1.500646, 0, 1, 0.5333334, 1,
-0.2305502, -0.899287, -3.370049, 0, 1, 0.5372549, 1,
-0.2294841, -0.7846199, -2.450303, 0, 1, 0.5450981, 1,
-0.2282615, 0.2257443, -1.262003, 0, 1, 0.5490196, 1,
-0.2280309, 1.782409, 0.9449216, 0, 1, 0.5568628, 1,
-0.2272268, 0.3355321, -0.08445445, 0, 1, 0.5607843, 1,
-0.2266636, 0.6731004, -1.795466, 0, 1, 0.5686275, 1,
-0.2233845, 0.386441, -0.8543847, 0, 1, 0.572549, 1,
-0.2215977, -0.847773, -3.415741, 0, 1, 0.5803922, 1,
-0.220473, 0.07048612, -0.429802, 0, 1, 0.5843138, 1,
-0.2144407, -1.11346, -1.572009, 0, 1, 0.5921569, 1,
-0.2126505, -0.7986785, -2.973966, 0, 1, 0.5960785, 1,
-0.2022921, -1.30136, -2.479981, 0, 1, 0.6039216, 1,
-0.1999789, -1.901766, -3.672112, 0, 1, 0.6117647, 1,
-0.1996978, 2.855275, 0.3245848, 0, 1, 0.6156863, 1,
-0.1976839, 1.06266, 0.4035732, 0, 1, 0.6235294, 1,
-0.1970206, 1.304738, 0.3060799, 0, 1, 0.627451, 1,
-0.1948957, -0.665068, -0.9698282, 0, 1, 0.6352941, 1,
-0.1934707, -0.4900987, -1.516875, 0, 1, 0.6392157, 1,
-0.1929827, -0.6649402, -2.855094, 0, 1, 0.6470588, 1,
-0.1884504, 0.007482651, -1.401035, 0, 1, 0.6509804, 1,
-0.1871436, -0.3795199, -2.425463, 0, 1, 0.6588235, 1,
-0.18123, -1.536716, -2.532506, 0, 1, 0.6627451, 1,
-0.1767566, 0.680387, 0.4523219, 0, 1, 0.6705883, 1,
-0.1734945, -0.2159365, -3.803931, 0, 1, 0.6745098, 1,
-0.1727598, 1.035356, -1.58399, 0, 1, 0.682353, 1,
-0.1690363, 0.05574458, -1.559227, 0, 1, 0.6862745, 1,
-0.1669158, -0.03339021, -0.9768398, 0, 1, 0.6941177, 1,
-0.1664126, -0.05900923, -3.437884, 0, 1, 0.7019608, 1,
-0.1660468, 0.5754483, -1.452798, 0, 1, 0.7058824, 1,
-0.1623609, -0.529578, -2.290061, 0, 1, 0.7137255, 1,
-0.1616824, -1.003298, -2.633608, 0, 1, 0.7176471, 1,
-0.1596188, 2.020477, -1.123038, 0, 1, 0.7254902, 1,
-0.1572852, 0.7493484, 0.7811084, 0, 1, 0.7294118, 1,
-0.1553052, 0.7347177, 1.280273, 0, 1, 0.7372549, 1,
-0.1521308, 1.390635, 1.101329, 0, 1, 0.7411765, 1,
-0.1513305, -1.883452, -1.048035, 0, 1, 0.7490196, 1,
-0.150692, -1.205483, -1.079796, 0, 1, 0.7529412, 1,
-0.1503399, -0.7058333, -3.994309, 0, 1, 0.7607843, 1,
-0.1472812, -0.7589081, -3.420154, 0, 1, 0.7647059, 1,
-0.1465481, 0.1777017, -0.9028812, 0, 1, 0.772549, 1,
-0.1455227, -0.06557188, -3.026754, 0, 1, 0.7764706, 1,
-0.1417528, -1.317331, -3.124376, 0, 1, 0.7843137, 1,
-0.1381607, 1.173443, -0.3076297, 0, 1, 0.7882353, 1,
-0.1344476, 0.06133215, -1.124918, 0, 1, 0.7960784, 1,
-0.1310624, -0.1584298, -2.937245, 0, 1, 0.8039216, 1,
-0.1309667, 0.2989202, -0.9906276, 0, 1, 0.8078431, 1,
-0.1307015, -0.3528506, -2.683048, 0, 1, 0.8156863, 1,
-0.130278, 0.1607423, 0.04162057, 0, 1, 0.8196079, 1,
-0.1214688, 0.06023206, -1.757518, 0, 1, 0.827451, 1,
-0.1116233, 0.4258891, -1.296905, 0, 1, 0.8313726, 1,
-0.1108023, -1.316011, -3.739806, 0, 1, 0.8392157, 1,
-0.1084147, 0.5234982, 0.4559287, 0, 1, 0.8431373, 1,
-0.1054648, -0.7773291, -3.530859, 0, 1, 0.8509804, 1,
-0.104975, -1.273058, -0.6518208, 0, 1, 0.854902, 1,
-0.1036384, 0.02763162, 0.3714349, 0, 1, 0.8627451, 1,
-0.1032058, -0.4673659, -1.425527, 0, 1, 0.8666667, 1,
-0.1012634, -0.2996399, -2.545662, 0, 1, 0.8745098, 1,
-0.09056152, 1.23151, -0.7844354, 0, 1, 0.8784314, 1,
-0.0895333, 1.571845, 0.114514, 0, 1, 0.8862745, 1,
-0.08827375, -1.212989, -2.813402, 0, 1, 0.8901961, 1,
-0.08736496, -0.5172912, -2.277735, 0, 1, 0.8980392, 1,
-0.08671534, -0.584582, -3.668679, 0, 1, 0.9058824, 1,
-0.08567341, -0.8866826, -4.758745, 0, 1, 0.9098039, 1,
-0.0835246, -0.4792637, -2.59389, 0, 1, 0.9176471, 1,
-0.08271357, 0.03462593, -3.133628, 0, 1, 0.9215686, 1,
-0.08094484, -0.3939019, -3.247502, 0, 1, 0.9294118, 1,
-0.07750254, 0.09876157, -1.348371, 0, 1, 0.9333333, 1,
-0.07559647, -0.006824712, -0.8926743, 0, 1, 0.9411765, 1,
-0.07342641, 0.6136186, 0.2390468, 0, 1, 0.945098, 1,
-0.06891759, 1.103075, -0.3098685, 0, 1, 0.9529412, 1,
-0.06879041, -1.765913, -3.603053, 0, 1, 0.9568627, 1,
-0.06659093, -0.8004476, -2.326719, 0, 1, 0.9647059, 1,
-0.06343797, -1.529789, -4.483946, 0, 1, 0.9686275, 1,
-0.06190478, 0.3465709, 0.04291241, 0, 1, 0.9764706, 1,
-0.05939006, 1.155145, -0.113565, 0, 1, 0.9803922, 1,
-0.05892262, 0.8351726, -1.688815, 0, 1, 0.9882353, 1,
-0.05872082, 0.4710132, -2.025951, 0, 1, 0.9921569, 1,
-0.05645871, -0.4880027, -3.477761, 0, 1, 1, 1,
-0.05017878, 0.455462, -1.2504, 0, 0.9921569, 1, 1,
-0.04913267, -0.1500631, -2.450699, 0, 0.9882353, 1, 1,
-0.04631987, 0.7269616, -0.5950443, 0, 0.9803922, 1, 1,
-0.04457479, -1.360666, -2.579205, 0, 0.9764706, 1, 1,
-0.04351548, 0.06048872, 0.6260695, 0, 0.9686275, 1, 1,
-0.03921263, -0.04071101, -2.335066, 0, 0.9647059, 1, 1,
-0.03863132, -0.3604541, -3.985144, 0, 0.9568627, 1, 1,
-0.03692921, -1.503902, -2.747394, 0, 0.9529412, 1, 1,
-0.02492112, 0.7647182, 0.3017224, 0, 0.945098, 1, 1,
-0.01169203, -0.4053091, -2.929497, 0, 0.9411765, 1, 1,
0.001704493, 0.3336336, -0.4009948, 0, 0.9333333, 1, 1,
0.004091799, -2.678179, 2.266469, 0, 0.9294118, 1, 1,
0.005656415, -0.408999, 4.430748, 0, 0.9215686, 1, 1,
0.005767616, 0.4865728, -0.4886872, 0, 0.9176471, 1, 1,
0.007325109, 0.1232155, 2.08208, 0, 0.9098039, 1, 1,
0.009995847, -1.495283, 2.835241, 0, 0.9058824, 1, 1,
0.01279376, 0.3620038, -0.08307126, 0, 0.8980392, 1, 1,
0.01372327, -0.1320001, 5.533605, 0, 0.8901961, 1, 1,
0.01893616, 0.8490748, 0.5833347, 0, 0.8862745, 1, 1,
0.02226299, 0.887344, -1.555265, 0, 0.8784314, 1, 1,
0.02245946, 0.2263683, -0.005624481, 0, 0.8745098, 1, 1,
0.02435852, -1.102769, 3.84446, 0, 0.8666667, 1, 1,
0.02461035, 0.5007302, 0.3900384, 0, 0.8627451, 1, 1,
0.02772433, 1.726663, 0.8597413, 0, 0.854902, 1, 1,
0.02957167, 0.66001, -1.368418, 0, 0.8509804, 1, 1,
0.03254739, 0.3994643, 0.3189723, 0, 0.8431373, 1, 1,
0.03335059, 1.303578, -1.236511, 0, 0.8392157, 1, 1,
0.03445997, -0.1933417, 3.84838, 0, 0.8313726, 1, 1,
0.0356517, -1.0309, 3.241836, 0, 0.827451, 1, 1,
0.0387354, -0.09587321, 2.829532, 0, 0.8196079, 1, 1,
0.03895685, 0.2133346, 1.876181, 0, 0.8156863, 1, 1,
0.04163405, 0.1557023, 1.75874, 0, 0.8078431, 1, 1,
0.04214794, 1.128011, -0.6704876, 0, 0.8039216, 1, 1,
0.04251504, -1.026838, 2.987349, 0, 0.7960784, 1, 1,
0.04322509, 3.241179, 1.802319, 0, 0.7882353, 1, 1,
0.04354867, -2.055064, 2.696642, 0, 0.7843137, 1, 1,
0.04716268, -1.790639, 3.742556, 0, 0.7764706, 1, 1,
0.04926362, 0.8455344, -0.3918356, 0, 0.772549, 1, 1,
0.0496552, -0.1820867, 1.262527, 0, 0.7647059, 1, 1,
0.04979267, -1.460296, 3.8936, 0, 0.7607843, 1, 1,
0.05287618, -1.531789, 2.794479, 0, 0.7529412, 1, 1,
0.05802682, -0.3454125, 3.502107, 0, 0.7490196, 1, 1,
0.06289291, -0.4696697, 3.088644, 0, 0.7411765, 1, 1,
0.06468512, -0.1988389, 3.239956, 0, 0.7372549, 1, 1,
0.06531756, -0.4807125, 2.389198, 0, 0.7294118, 1, 1,
0.06586985, -0.7452843, 4.491872, 0, 0.7254902, 1, 1,
0.06645595, -0.09611662, 1.757923, 0, 0.7176471, 1, 1,
0.07008116, 0.3853217, -0.5062906, 0, 0.7137255, 1, 1,
0.07237723, 0.9433243, 1.949648, 0, 0.7058824, 1, 1,
0.07429089, -1.195646, 2.562168, 0, 0.6980392, 1, 1,
0.07747002, 0.1080645, 1.294131, 0, 0.6941177, 1, 1,
0.07922824, 0.4267219, 0.182635, 0, 0.6862745, 1, 1,
0.08008038, 0.7352291, 1.642313, 0, 0.682353, 1, 1,
0.08046928, -0.8769872, 3.988814, 0, 0.6745098, 1, 1,
0.08687083, -0.9700936, 3.354811, 0, 0.6705883, 1, 1,
0.08903631, 2.349263, -0.7501634, 0, 0.6627451, 1, 1,
0.0920056, -0.4195879, 1.783, 0, 0.6588235, 1, 1,
0.0925786, -1.297023, 3.026332, 0, 0.6509804, 1, 1,
0.09397632, -0.2066382, 1.738825, 0, 0.6470588, 1, 1,
0.09688377, -0.3307253, 2.894706, 0, 0.6392157, 1, 1,
0.1006397, 0.2536261, -1.122667, 0, 0.6352941, 1, 1,
0.1012917, -0.5266129, 3.430583, 0, 0.627451, 1, 1,
0.1037782, -1.134048, 2.541734, 0, 0.6235294, 1, 1,
0.1080438, -0.1333161, 2.898791, 0, 0.6156863, 1, 1,
0.1087926, 2.051116, -1.149737, 0, 0.6117647, 1, 1,
0.1120718, 0.1824244, 0.1506062, 0, 0.6039216, 1, 1,
0.1135871, -0.5450945, 2.847081, 0, 0.5960785, 1, 1,
0.1143118, -0.172325, 1.670339, 0, 0.5921569, 1, 1,
0.1162727, 0.6259809, 0.9477593, 0, 0.5843138, 1, 1,
0.1218627, -1.4074, 4.14489, 0, 0.5803922, 1, 1,
0.1230623, 0.139651, -1.084985, 0, 0.572549, 1, 1,
0.1250063, -0.939397, 2.276479, 0, 0.5686275, 1, 1,
0.125833, 0.2105216, 0.4982836, 0, 0.5607843, 1, 1,
0.1283718, -0.8546507, 2.55003, 0, 0.5568628, 1, 1,
0.1352449, -1.167408, 2.894392, 0, 0.5490196, 1, 1,
0.1432485, 0.2508386, 0.9074849, 0, 0.5450981, 1, 1,
0.1459017, -1.63828, 3.927477, 0, 0.5372549, 1, 1,
0.1467216, -0.03358226, 2.421383, 0, 0.5333334, 1, 1,
0.1469435, -1.503071, 2.847424, 0, 0.5254902, 1, 1,
0.1477007, -0.3720816, 1.631434, 0, 0.5215687, 1, 1,
0.1481354, 0.4087737, -0.8902524, 0, 0.5137255, 1, 1,
0.1502531, -0.8844221, 2.941665, 0, 0.509804, 1, 1,
0.1510435, 0.4964482, 0.214948, 0, 0.5019608, 1, 1,
0.1538266, -1.276963, 3.533384, 0, 0.4941176, 1, 1,
0.1572847, -1.70255, 2.713365, 0, 0.4901961, 1, 1,
0.1589423, -1.278265, 1.369719, 0, 0.4823529, 1, 1,
0.1708423, -0.4701124, 2.493125, 0, 0.4784314, 1, 1,
0.1731388, 0.8830682, -0.8257028, 0, 0.4705882, 1, 1,
0.1731703, -0.05305715, 1.208322, 0, 0.4666667, 1, 1,
0.1746938, -1.623953, 3.078129, 0, 0.4588235, 1, 1,
0.1786918, -0.8971286, 1.367855, 0, 0.454902, 1, 1,
0.178939, 0.2578639, -0.3742224, 0, 0.4470588, 1, 1,
0.1816223, -0.2209522, 2.394082, 0, 0.4431373, 1, 1,
0.1816362, -1.605025, 2.18521, 0, 0.4352941, 1, 1,
0.1833027, -0.5328225, 3.694443, 0, 0.4313726, 1, 1,
0.184611, -1.469212, 3.858965, 0, 0.4235294, 1, 1,
0.1887014, 0.4649482, -0.03211135, 0, 0.4196078, 1, 1,
0.1917998, -0.06480473, 2.192997, 0, 0.4117647, 1, 1,
0.1929405, -0.8466865, 2.68107, 0, 0.4078431, 1, 1,
0.1957666, 0.9546935, 1.194799, 0, 0.4, 1, 1,
0.1963225, -1.646056, 2.309999, 0, 0.3921569, 1, 1,
0.2003376, 1.450169, -0.4232303, 0, 0.3882353, 1, 1,
0.2011687, 0.1050407, 1.487531, 0, 0.3803922, 1, 1,
0.2087357, -0.3762487, 3.827709, 0, 0.3764706, 1, 1,
0.2154858, -1.675277, 2.051493, 0, 0.3686275, 1, 1,
0.2272314, 0.5378847, 1.885103, 0, 0.3647059, 1, 1,
0.2293941, 0.8975324, -0.3980686, 0, 0.3568628, 1, 1,
0.230148, 1.544368, 1.466384, 0, 0.3529412, 1, 1,
0.235023, 1.222642, 1.332032, 0, 0.345098, 1, 1,
0.2360044, -0.110926, 3.958227, 0, 0.3411765, 1, 1,
0.2394001, 0.443898, 0.8867538, 0, 0.3333333, 1, 1,
0.2431675, -0.8035703, 2.725339, 0, 0.3294118, 1, 1,
0.2467784, 0.3018443, 0.4591661, 0, 0.3215686, 1, 1,
0.248523, -0.4501175, 1.969555, 0, 0.3176471, 1, 1,
0.2489028, 0.1105133, 1.590727, 0, 0.3098039, 1, 1,
0.2520711, -1.879188, 3.576043, 0, 0.3058824, 1, 1,
0.2523087, -0.7822851, 2.844305, 0, 0.2980392, 1, 1,
0.2528024, 2.213797, -1.320439, 0, 0.2901961, 1, 1,
0.2529821, 0.2734258, 1.327874, 0, 0.2862745, 1, 1,
0.2545031, 0.3298123, 1.000745, 0, 0.2784314, 1, 1,
0.2610939, -1.615138, 3.206162, 0, 0.2745098, 1, 1,
0.2634137, 1.841074, -0.2655264, 0, 0.2666667, 1, 1,
0.2637584, 0.7598054, -0.08078647, 0, 0.2627451, 1, 1,
0.2638656, 1.328754, 0.292136, 0, 0.254902, 1, 1,
0.2644254, 0.08419341, 1.026467, 0, 0.2509804, 1, 1,
0.2644587, -1.626706, 2.91174, 0, 0.2431373, 1, 1,
0.2659274, -0.1899325, 2.187325, 0, 0.2392157, 1, 1,
0.26806, -0.3248834, 3.162449, 0, 0.2313726, 1, 1,
0.2761665, 1.187641, 0.391966, 0, 0.227451, 1, 1,
0.2777439, -0.2723842, 3.232205, 0, 0.2196078, 1, 1,
0.279371, -1.558064, 1.542922, 0, 0.2156863, 1, 1,
0.2872018, -0.4045251, 3.788491, 0, 0.2078431, 1, 1,
0.2920921, 0.9753318, -1.085985, 0, 0.2039216, 1, 1,
0.2943838, -0.4284074, 2.243362, 0, 0.1960784, 1, 1,
0.2959285, -0.08558349, 2.748069, 0, 0.1882353, 1, 1,
0.2970866, 1.052364, -1.438225, 0, 0.1843137, 1, 1,
0.2991504, 0.9414824, -1.009103, 0, 0.1764706, 1, 1,
0.3053351, -0.3192413, 3.519186, 0, 0.172549, 1, 1,
0.3068961, -2.200474, 2.122334, 0, 0.1647059, 1, 1,
0.3094683, -0.003265314, 2.699513, 0, 0.1607843, 1, 1,
0.3097517, 1.355241, 0.4813589, 0, 0.1529412, 1, 1,
0.3136844, 1.290248, -1.336347, 0, 0.1490196, 1, 1,
0.3137529, -1.396873, 2.560624, 0, 0.1411765, 1, 1,
0.3151984, 1.475852, -0.04811921, 0, 0.1372549, 1, 1,
0.3216272, -0.4870655, 3.781294, 0, 0.1294118, 1, 1,
0.3227297, 0.852949, -0.6233104, 0, 0.1254902, 1, 1,
0.3279096, -1.342054, 3.464446, 0, 0.1176471, 1, 1,
0.3281634, 0.4713138, 0.6638944, 0, 0.1137255, 1, 1,
0.3315924, -2.10741, 1.601463, 0, 0.1058824, 1, 1,
0.3316614, 0.2423634, 0.08886755, 0, 0.09803922, 1, 1,
0.3316675, -0.3990561, 3.677516, 0, 0.09411765, 1, 1,
0.3351236, -0.7248877, 3.736253, 0, 0.08627451, 1, 1,
0.3381325, 0.5173295, -0.7495958, 0, 0.08235294, 1, 1,
0.338819, 0.1182964, 1.968151, 0, 0.07450981, 1, 1,
0.3433329, 1.114704, 0.2843637, 0, 0.07058824, 1, 1,
0.3436174, 0.8100383, 0.694215, 0, 0.0627451, 1, 1,
0.3458614, -0.6367208, 1.858593, 0, 0.05882353, 1, 1,
0.348044, -0.2968557, 0.4334592, 0, 0.05098039, 1, 1,
0.3564251, 0.3175585, -0.2492202, 0, 0.04705882, 1, 1,
0.360225, -0.4711096, 1.577725, 0, 0.03921569, 1, 1,
0.3613377, 0.2037576, 1.731081, 0, 0.03529412, 1, 1,
0.3631035, -0.04009558, 1.232612, 0, 0.02745098, 1, 1,
0.3649192, 0.8602459, 1.2617, 0, 0.02352941, 1, 1,
0.3656917, -0.6046937, 1.939076, 0, 0.01568628, 1, 1,
0.370519, 1.008318, -0.4020616, 0, 0.01176471, 1, 1,
0.3729187, -0.8351721, 2.646389, 0, 0.003921569, 1, 1,
0.3739313, 0.5859724, 0.8587112, 0.003921569, 0, 1, 1,
0.3748012, 0.2904367, 0.6769095, 0.007843138, 0, 1, 1,
0.376383, 0.8748497, 0.118736, 0.01568628, 0, 1, 1,
0.3810959, -0.9331349, 3.510259, 0.01960784, 0, 1, 1,
0.3840753, 0.6923834, -1.314265, 0.02745098, 0, 1, 1,
0.384415, 0.7400084, -0.03385115, 0.03137255, 0, 1, 1,
0.3851936, -0.1014458, 3.064793, 0.03921569, 0, 1, 1,
0.3856763, -0.3724298, 1.359341, 0.04313726, 0, 1, 1,
0.3877639, 1.19703, 2.140887, 0.05098039, 0, 1, 1,
0.389517, -0.6878224, 2.192864, 0.05490196, 0, 1, 1,
0.3902364, -1.02252, 3.083782, 0.0627451, 0, 1, 1,
0.3907986, -1.594587, 2.595045, 0.06666667, 0, 1, 1,
0.3910345, 0.1796842, 2.425664, 0.07450981, 0, 1, 1,
0.3935722, -2.094988, 3.419535, 0.07843138, 0, 1, 1,
0.3992614, -2.774992, 4.188427, 0.08627451, 0, 1, 1,
0.4060819, -0.3082138, 4.191308, 0.09019608, 0, 1, 1,
0.4068255, -1.565886, 3.538452, 0.09803922, 0, 1, 1,
0.4117536, -0.7906114, 1.463201, 0.1058824, 0, 1, 1,
0.4141641, -0.9493406, 2.041527, 0.1098039, 0, 1, 1,
0.4154753, 0.5673412, 0.2773074, 0.1176471, 0, 1, 1,
0.4170395, 0.431518, 1.350463, 0.1215686, 0, 1, 1,
0.4210928, -0.4276256, 1.103872, 0.1294118, 0, 1, 1,
0.4252929, 0.4411403, 0.6224028, 0.1333333, 0, 1, 1,
0.4253846, 0.5594431, 1.154307, 0.1411765, 0, 1, 1,
0.4309368, -0.08032966, 1.041198, 0.145098, 0, 1, 1,
0.4325224, 1.532078, -0.8846438, 0.1529412, 0, 1, 1,
0.435524, -0.9479795, 1.938808, 0.1568628, 0, 1, 1,
0.4355492, 0.2941912, 1.491987, 0.1647059, 0, 1, 1,
0.4400929, -0.5426149, 1.606842, 0.1686275, 0, 1, 1,
0.4420632, -0.1754176, 1.996564, 0.1764706, 0, 1, 1,
0.4462427, -1.742066, 2.226599, 0.1803922, 0, 1, 1,
0.4499994, -0.05131363, 2.099117, 0.1882353, 0, 1, 1,
0.4507785, 0.4283809, -0.8867537, 0.1921569, 0, 1, 1,
0.4550229, -0.8972216, 3.453616, 0.2, 0, 1, 1,
0.4587833, -1.747856, 4.13307, 0.2078431, 0, 1, 1,
0.4611691, 2.471974, 0.5766812, 0.2117647, 0, 1, 1,
0.4657545, 1.066217, 0.3556702, 0.2196078, 0, 1, 1,
0.4721329, 0.4640298, 2.449399, 0.2235294, 0, 1, 1,
0.4754938, -0.02562814, 0.6875404, 0.2313726, 0, 1, 1,
0.4802465, 0.5285042, -0.6966739, 0.2352941, 0, 1, 1,
0.4829675, 0.03502171, 0.95573, 0.2431373, 0, 1, 1,
0.4846992, -0.6969235, 3.202016, 0.2470588, 0, 1, 1,
0.4848533, -0.8175456, 1.999209, 0.254902, 0, 1, 1,
0.485648, -0.4321271, 2.023412, 0.2588235, 0, 1, 1,
0.4873425, 1.416675, -0.7217955, 0.2666667, 0, 1, 1,
0.4920014, 0.207915, 2.357615, 0.2705882, 0, 1, 1,
0.499658, 0.7982306, 0.5729085, 0.2784314, 0, 1, 1,
0.5005129, 1.063862, -0.4985716, 0.282353, 0, 1, 1,
0.5059188, 0.4684739, 0.3846731, 0.2901961, 0, 1, 1,
0.510196, 0.6523809, 1.069859, 0.2941177, 0, 1, 1,
0.513294, -2.421796, 2.208775, 0.3019608, 0, 1, 1,
0.5144733, -0.16888, 0.8727685, 0.3098039, 0, 1, 1,
0.5169408, -0.6255516, 3.102168, 0.3137255, 0, 1, 1,
0.5191013, -0.7275158, 3.426764, 0.3215686, 0, 1, 1,
0.5255137, -1.435553, 2.018315, 0.3254902, 0, 1, 1,
0.5258322, -0.7188556, 3.414729, 0.3333333, 0, 1, 1,
0.5268672, -1.127795, 0.4377376, 0.3372549, 0, 1, 1,
0.5325351, 1.297889, -0.3241856, 0.345098, 0, 1, 1,
0.5358687, 0.337495, -0.5027846, 0.3490196, 0, 1, 1,
0.548345, -0.9930457, 1.767301, 0.3568628, 0, 1, 1,
0.5576726, -0.1836445, 0.8995727, 0.3607843, 0, 1, 1,
0.55796, 0.8404845, 0.3971971, 0.3686275, 0, 1, 1,
0.5598277, 0.2423634, -0.03106058, 0.372549, 0, 1, 1,
0.56177, 0.9253222, 2.207245, 0.3803922, 0, 1, 1,
0.5734231, 0.4202067, 0.350957, 0.3843137, 0, 1, 1,
0.5814235, 0.2366004, 0.8331369, 0.3921569, 0, 1, 1,
0.5846852, 0.2334019, 1.599343, 0.3960784, 0, 1, 1,
0.5883136, 1.504005, -0.8777435, 0.4039216, 0, 1, 1,
0.5885859, -1.942683, 2.979139, 0.4117647, 0, 1, 1,
0.5893291, -0.3128803, 1.980533, 0.4156863, 0, 1, 1,
0.5922487, -1.372906, 4.483259, 0.4235294, 0, 1, 1,
0.5938218, 1.664873, 0.1105993, 0.427451, 0, 1, 1,
0.5977614, 0.6184686, 0.8100418, 0.4352941, 0, 1, 1,
0.5992077, 0.6157066, 1.795462, 0.4392157, 0, 1, 1,
0.6007276, -0.07370161, 1.721218, 0.4470588, 0, 1, 1,
0.6038198, -0.1193025, 1.996474, 0.4509804, 0, 1, 1,
0.6054838, -1.986448, 2.595869, 0.4588235, 0, 1, 1,
0.610121, 1.584852, -0.6581742, 0.4627451, 0, 1, 1,
0.6104463, 0.8045014, 1.397032, 0.4705882, 0, 1, 1,
0.6152917, -1.246464, 1.858844, 0.4745098, 0, 1, 1,
0.6238735, 1.913202, 2.102008, 0.4823529, 0, 1, 1,
0.6242468, 0.9670817, -1.098194, 0.4862745, 0, 1, 1,
0.6283103, -0.9978285, 3.514248, 0.4941176, 0, 1, 1,
0.6337203, -0.7145739, 1.597705, 0.5019608, 0, 1, 1,
0.638707, -1.130521, 3.411226, 0.5058824, 0, 1, 1,
0.6387168, -0.4116969, 3.064628, 0.5137255, 0, 1, 1,
0.6429123, -2.213923, 4.008429, 0.5176471, 0, 1, 1,
0.6515601, 0.9303172, 0.8368472, 0.5254902, 0, 1, 1,
0.6520097, 0.05467998, 2.796797, 0.5294118, 0, 1, 1,
0.6542633, 0.6313122, 0.71179, 0.5372549, 0, 1, 1,
0.6687783, 0.137897, 0.7198257, 0.5411765, 0, 1, 1,
0.6694848, 0.8542498, 0.5517802, 0.5490196, 0, 1, 1,
0.672294, 0.7896846, 1.32356, 0.5529412, 0, 1, 1,
0.6818286, -0.5291905, 3.040703, 0.5607843, 0, 1, 1,
0.6831369, 0.1009093, 1.642857, 0.5647059, 0, 1, 1,
0.6868129, 0.1411185, 0.5581273, 0.572549, 0, 1, 1,
0.6900649, 0.8931104, 1.636741, 0.5764706, 0, 1, 1,
0.6906391, -0.4247747, 3.492775, 0.5843138, 0, 1, 1,
0.6910771, -1.697942, 4.230347, 0.5882353, 0, 1, 1,
0.6986266, 0.3051867, 0.9264322, 0.5960785, 0, 1, 1,
0.701562, 1.995483, 0.3955163, 0.6039216, 0, 1, 1,
0.7021074, -0.1910963, 1.561085, 0.6078432, 0, 1, 1,
0.7047391, 0.4319513, 2.05911, 0.6156863, 0, 1, 1,
0.7057097, 1.107372, 1.40908, 0.6196079, 0, 1, 1,
0.7062779, 1.081477, 2.746825, 0.627451, 0, 1, 1,
0.7073296, -0.1194227, 0.2198812, 0.6313726, 0, 1, 1,
0.7136024, -1.606236, 4.799043, 0.6392157, 0, 1, 1,
0.7138574, -0.2942025, 3.145412, 0.6431373, 0, 1, 1,
0.7148252, -2.071171, 2.233682, 0.6509804, 0, 1, 1,
0.7181762, 1.845334, -0.4050302, 0.654902, 0, 1, 1,
0.7186674, -1.629127, 4.080651, 0.6627451, 0, 1, 1,
0.7224346, 0.4228711, 0.4569422, 0.6666667, 0, 1, 1,
0.7259804, 1.095961, 0.6207962, 0.6745098, 0, 1, 1,
0.7289227, 0.5836346, 0.9305648, 0.6784314, 0, 1, 1,
0.7316651, -1.705387, 1.561357, 0.6862745, 0, 1, 1,
0.7336899, 0.3120812, 0.1435663, 0.6901961, 0, 1, 1,
0.7416455, -0.1398529, 2.043487, 0.6980392, 0, 1, 1,
0.7505924, -1.628316, 2.464123, 0.7058824, 0, 1, 1,
0.751062, -1.120129, 2.230237, 0.7098039, 0, 1, 1,
0.7677628, 0.7884207, 0.9143157, 0.7176471, 0, 1, 1,
0.7739869, 0.390606, 0.2942473, 0.7215686, 0, 1, 1,
0.7742564, 0.5653216, 0.1125133, 0.7294118, 0, 1, 1,
0.7751712, 0.8985565, 0.7130818, 0.7333333, 0, 1, 1,
0.7773028, 0.5316092, 3.155229, 0.7411765, 0, 1, 1,
0.7775949, 1.209648, 1.05496, 0.7450981, 0, 1, 1,
0.7779837, 0.2763249, 0.9880415, 0.7529412, 0, 1, 1,
0.7830109, 0.4176406, 0.1110858, 0.7568628, 0, 1, 1,
0.8035932, -0.1409356, 1.396249, 0.7647059, 0, 1, 1,
0.8044325, -2.398382, 2.297538, 0.7686275, 0, 1, 1,
0.8064089, 0.9398559, 1.663831, 0.7764706, 0, 1, 1,
0.8103327, 1.51118, -0.5906501, 0.7803922, 0, 1, 1,
0.8125067, -0.5676088, 2.181767, 0.7882353, 0, 1, 1,
0.8135823, 1.09217, 1.168176, 0.7921569, 0, 1, 1,
0.8142415, -0.9038372, 1.488235, 0.8, 0, 1, 1,
0.8303518, -0.3921315, 3.381445, 0.8078431, 0, 1, 1,
0.8395289, -0.4668307, 2.134131, 0.8117647, 0, 1, 1,
0.8479529, 0.7802039, 1.1111, 0.8196079, 0, 1, 1,
0.8528108, 0.8780344, 0.4712149, 0.8235294, 0, 1, 1,
0.8658208, -0.6327266, 1.159352, 0.8313726, 0, 1, 1,
0.8698655, -0.1409538, 2.608855, 0.8352941, 0, 1, 1,
0.8716187, -1.350188, 3.175804, 0.8431373, 0, 1, 1,
0.876402, 0.5308852, -0.09537058, 0.8470588, 0, 1, 1,
0.8773183, 2.501273, 1.02109, 0.854902, 0, 1, 1,
0.8782695, 0.8157012, 1.037755, 0.8588235, 0, 1, 1,
0.8816149, 0.9757645, 0.05969867, 0.8666667, 0, 1, 1,
0.8818577, 1.789242, 0.4965031, 0.8705882, 0, 1, 1,
0.8828126, -2.200438, 1.111463, 0.8784314, 0, 1, 1,
0.8857961, -0.2471265, 2.14495, 0.8823529, 0, 1, 1,
0.8886035, -1.83569, 2.903159, 0.8901961, 0, 1, 1,
0.8917415, -1.83811, 2.274759, 0.8941177, 0, 1, 1,
0.892692, 0.09256334, 1.837073, 0.9019608, 0, 1, 1,
0.894275, -0.5831423, 2.81784, 0.9098039, 0, 1, 1,
0.8943904, 0.4986058, 1.995049, 0.9137255, 0, 1, 1,
0.8950306, 0.3192769, -0.02153441, 0.9215686, 0, 1, 1,
0.898325, 0.7935465, 0.2070322, 0.9254902, 0, 1, 1,
0.8996823, 0.3704739, 1.663996, 0.9333333, 0, 1, 1,
0.9093735, 0.0880857, 3.032319, 0.9372549, 0, 1, 1,
0.9168581, 1.16277, 1.352446, 0.945098, 0, 1, 1,
0.9216046, 0.8741458, -0.2136275, 0.9490196, 0, 1, 1,
0.9220369, 0.7699631, -0.1565552, 0.9568627, 0, 1, 1,
0.9262098, 1.122417, 0.5636707, 0.9607843, 0, 1, 1,
0.9268531, 0.03945156, 0.453502, 0.9686275, 0, 1, 1,
0.9291706, -0.2061097, 1.909992, 0.972549, 0, 1, 1,
0.9371721, -0.05257845, 0.2946402, 0.9803922, 0, 1, 1,
0.9426504, 0.1677525, 3.756033, 0.9843137, 0, 1, 1,
0.944452, -1.337053, 2.534894, 0.9921569, 0, 1, 1,
0.9446313, 1.331988, 0.8330736, 0.9960784, 0, 1, 1,
0.9564281, -1.558788, 1.512519, 1, 0, 0.9960784, 1,
0.9567344, 2.179042, 1.145346, 1, 0, 0.9882353, 1,
0.9578229, -1.194803, 2.150477, 1, 0, 0.9843137, 1,
0.9596479, 1.153716, 2.630731, 1, 0, 0.9764706, 1,
0.963369, 0.3510252, -0.1646652, 1, 0, 0.972549, 1,
0.9640504, -0.7146975, 1.81365, 1, 0, 0.9647059, 1,
0.9697136, -0.6177934, 4.019443, 1, 0, 0.9607843, 1,
0.9717298, 0.8912872, 1.080145, 1, 0, 0.9529412, 1,
0.9785468, 0.268053, 0.9783887, 1, 0, 0.9490196, 1,
0.9829038, -0.9445131, 3.112259, 1, 0, 0.9411765, 1,
0.9831265, -0.8279618, 3.468677, 1, 0, 0.9372549, 1,
0.9922566, -0.619292, 4.465678, 1, 0, 0.9294118, 1,
0.995847, -0.2478825, 2.795561, 1, 0, 0.9254902, 1,
0.9984022, 0.06425481, 2.149243, 1, 0, 0.9176471, 1,
0.9990121, 0.313873, 0.9980437, 1, 0, 0.9137255, 1,
1.007995, -1.434848, 3.897658, 1, 0, 0.9058824, 1,
1.019276, 0.4922716, -1.292656, 1, 0, 0.9019608, 1,
1.021115, 0.7499506, 1.320387, 1, 0, 0.8941177, 1,
1.033088, 1.791428, 1.22344, 1, 0, 0.8862745, 1,
1.034459, 0.9862474, 0.6465548, 1, 0, 0.8823529, 1,
1.040812, 0.02565075, 0.5801658, 1, 0, 0.8745098, 1,
1.045628, -1.135195, 2.061558, 1, 0, 0.8705882, 1,
1.049658, 2.449224, 0.7455432, 1, 0, 0.8627451, 1,
1.057259, -0.5814311, 1.722555, 1, 0, 0.8588235, 1,
1.061657, 1.096065, 1.368322, 1, 0, 0.8509804, 1,
1.061948, -0.2795255, 1.620366, 1, 0, 0.8470588, 1,
1.063071, -1.401646, 3.495929, 1, 0, 0.8392157, 1,
1.063226, -2.608353, 1.891741, 1, 0, 0.8352941, 1,
1.064466, 0.3226045, 1.126519, 1, 0, 0.827451, 1,
1.067729, -0.7651033, 1.343495, 1, 0, 0.8235294, 1,
1.077994, -0.3967096, 0.9428191, 1, 0, 0.8156863, 1,
1.078891, 0.4131335, 1.60092, 1, 0, 0.8117647, 1,
1.085163, -1.303764, 3.001228, 1, 0, 0.8039216, 1,
1.087137, 0.767877, 1.944579, 1, 0, 0.7960784, 1,
1.087156, -0.8961416, 0.1913786, 1, 0, 0.7921569, 1,
1.088552, 1.260576, 2.711121, 1, 0, 0.7843137, 1,
1.089614, 0.8062809, 0.7628987, 1, 0, 0.7803922, 1,
1.091594, 2.641947, -0.07282519, 1, 0, 0.772549, 1,
1.092529, -0.2421592, 1.773663, 1, 0, 0.7686275, 1,
1.098328, 2.65521, -0.5122584, 1, 0, 0.7607843, 1,
1.108027, -0.05365896, 0.4185793, 1, 0, 0.7568628, 1,
1.111697, 0.09521023, 2.311385, 1, 0, 0.7490196, 1,
1.136102, 1.841504, 0.356539, 1, 0, 0.7450981, 1,
1.140476, -0.2167425, 2.205075, 1, 0, 0.7372549, 1,
1.14869, -1.048696, 0.7420093, 1, 0, 0.7333333, 1,
1.149878, 1.478756, -0.6519652, 1, 0, 0.7254902, 1,
1.152545, -0.6453724, 1.700452, 1, 0, 0.7215686, 1,
1.158898, -0.2451608, 1.009796, 1, 0, 0.7137255, 1,
1.175853, 0.9314193, 2.944275, 1, 0, 0.7098039, 1,
1.176399, -0.44459, 2.103777, 1, 0, 0.7019608, 1,
1.186676, -0.5641261, 1.130219, 1, 0, 0.6941177, 1,
1.188407, 1.100026, 0.8015962, 1, 0, 0.6901961, 1,
1.189968, 0.4214441, 1.789051, 1, 0, 0.682353, 1,
1.197564, 0.7060307, 0.6014972, 1, 0, 0.6784314, 1,
1.204201, -1.01528, 1.05828, 1, 0, 0.6705883, 1,
1.21001, -2.57504, 3.800773, 1, 0, 0.6666667, 1,
1.211252, -0.2603207, 2.99695, 1, 0, 0.6588235, 1,
1.21758, 1.200478, 0.525776, 1, 0, 0.654902, 1,
1.224175, -0.138494, 1.710181, 1, 0, 0.6470588, 1,
1.224445, 0.1919015, 0.740284, 1, 0, 0.6431373, 1,
1.234841, 2.096126, 1.535933, 1, 0, 0.6352941, 1,
1.236735, -0.9801623, 2.07646, 1, 0, 0.6313726, 1,
1.250816, -2.118872, 3.31422, 1, 0, 0.6235294, 1,
1.255003, -1.752682, 3.667064, 1, 0, 0.6196079, 1,
1.257341, -1.724174, 3.157722, 1, 0, 0.6117647, 1,
1.261348, 1.057681, 1.14102, 1, 0, 0.6078432, 1,
1.262742, -0.2737267, 1.872852, 1, 0, 0.6, 1,
1.263374, 0.607211, 0.8624988, 1, 0, 0.5921569, 1,
1.270129, 0.4782005, 1.882155, 1, 0, 0.5882353, 1,
1.275725, 0.1733769, 1.34981, 1, 0, 0.5803922, 1,
1.277141, -0.1807033, 1.955809, 1, 0, 0.5764706, 1,
1.2844, 1.606983, -0.7516841, 1, 0, 0.5686275, 1,
1.286499, -1.148738, 0.4901437, 1, 0, 0.5647059, 1,
1.292275, 1.794667, 0.6049406, 1, 0, 0.5568628, 1,
1.316331, -0.9317289, 4.170227, 1, 0, 0.5529412, 1,
1.320237, -2.137334, 2.337271, 1, 0, 0.5450981, 1,
1.328382, 0.2352505, 1.980386, 1, 0, 0.5411765, 1,
1.332209, -1.051274, 0.6921566, 1, 0, 0.5333334, 1,
1.342654, 0.5758739, 2.672395, 1, 0, 0.5294118, 1,
1.348139, -0.4522333, 2.191669, 1, 0, 0.5215687, 1,
1.351519, 0.3598306, 0.5651352, 1, 0, 0.5176471, 1,
1.352052, 1.52663, 1.887345, 1, 0, 0.509804, 1,
1.364816, -0.2695353, 0.8771735, 1, 0, 0.5058824, 1,
1.368111, 1.74118, 0.1388021, 1, 0, 0.4980392, 1,
1.369883, -0.001977317, 1.691472, 1, 0, 0.4901961, 1,
1.375078, 0.810982, -0.1902091, 1, 0, 0.4862745, 1,
1.388021, -0.4479524, 2.580358, 1, 0, 0.4784314, 1,
1.388257, 1.843471, 0.05015826, 1, 0, 0.4745098, 1,
1.394874, -1.4173, 0.5911623, 1, 0, 0.4666667, 1,
1.394993, 1.464424, 0.2231102, 1, 0, 0.4627451, 1,
1.397198, 0.6306959, 1.130399, 1, 0, 0.454902, 1,
1.398074, -0.0776697, 2.775425, 1, 0, 0.4509804, 1,
1.403765, 0.0438905, 1.327628, 1, 0, 0.4431373, 1,
1.408435, -0.8095411, 2.576962, 1, 0, 0.4392157, 1,
1.409931, 0.7771181, -0.02924789, 1, 0, 0.4313726, 1,
1.41389, -1.13142, 2.925165, 1, 0, 0.427451, 1,
1.416648, 1.041108, -0.3323953, 1, 0, 0.4196078, 1,
1.42877, -0.3827768, 3.30777, 1, 0, 0.4156863, 1,
1.429099, -0.01900987, 1.573678, 1, 0, 0.4078431, 1,
1.434555, 0.08967584, 0.2025148, 1, 0, 0.4039216, 1,
1.442565, -0.6400841, 0.1417695, 1, 0, 0.3960784, 1,
1.444872, 0.3018575, 0.3240347, 1, 0, 0.3882353, 1,
1.44965, 1.567322, -0.09939879, 1, 0, 0.3843137, 1,
1.465891, 1.229138, 2.744705, 1, 0, 0.3764706, 1,
1.469255, 0.2439186, 1.27236, 1, 0, 0.372549, 1,
1.469599, -0.67379, 2.373909, 1, 0, 0.3647059, 1,
1.471144, 0.3675906, -0.2831604, 1, 0, 0.3607843, 1,
1.479745, -1.491628, 1.293176, 1, 0, 0.3529412, 1,
1.487247, -1.229643, 1.200496, 1, 0, 0.3490196, 1,
1.494442, 0.472966, 2.509961, 1, 0, 0.3411765, 1,
1.519902, 1.138283, 0.7866616, 1, 0, 0.3372549, 1,
1.521402, 0.479241, -0.913614, 1, 0, 0.3294118, 1,
1.524391, 0.5942919, 1.339233, 1, 0, 0.3254902, 1,
1.529352, 0.6363204, 0.9864774, 1, 0, 0.3176471, 1,
1.563777, -0.3024601, 0.2888088, 1, 0, 0.3137255, 1,
1.583366, -0.5253435, -0.2496014, 1, 0, 0.3058824, 1,
1.586002, -1.488862, 1.093993, 1, 0, 0.2980392, 1,
1.5978, -1.680565, 2.171956, 1, 0, 0.2941177, 1,
1.59814, -1.139042, 2.044951, 1, 0, 0.2862745, 1,
1.599753, -0.1170135, 2.954889, 1, 0, 0.282353, 1,
1.629496, 0.5651827, 2.267924, 1, 0, 0.2745098, 1,
1.642968, 1.408885, 1.008087, 1, 0, 0.2705882, 1,
1.646422, 0.8933744, 0.8459162, 1, 0, 0.2627451, 1,
1.64792, -0.0288889, 1.368618, 1, 0, 0.2588235, 1,
1.665038, -0.01464197, 1.224334, 1, 0, 0.2509804, 1,
1.674227, 1.038099, 0.925128, 1, 0, 0.2470588, 1,
1.687263, -0.3805235, 2.01418, 1, 0, 0.2392157, 1,
1.711231, -0.04853477, 1.273899, 1, 0, 0.2352941, 1,
1.740048, 0.6978299, -0.73678, 1, 0, 0.227451, 1,
1.76351, -1.005844, -0.1976015, 1, 0, 0.2235294, 1,
1.767274, -0.5161539, 3.634322, 1, 0, 0.2156863, 1,
1.769274, -0.07360273, 1.445799, 1, 0, 0.2117647, 1,
1.79145, -1.222986, 0.6506099, 1, 0, 0.2039216, 1,
1.800389, -0.5707391, 1.637466, 1, 0, 0.1960784, 1,
1.818706, -0.4696908, 2.575824, 1, 0, 0.1921569, 1,
1.83457, 1.433051, 0.08487934, 1, 0, 0.1843137, 1,
1.838552, -0.4140272, 0.01131251, 1, 0, 0.1803922, 1,
1.845637, -0.9293094, 2.663483, 1, 0, 0.172549, 1,
1.859376, -0.8810965, 1.725569, 1, 0, 0.1686275, 1,
1.859538, -0.9593646, 0.1018046, 1, 0, 0.1607843, 1,
1.871473, 0.6408472, -0.3088449, 1, 0, 0.1568628, 1,
1.873311, 0.6849003, 0.6867139, 1, 0, 0.1490196, 1,
1.882006, -0.961026, 1.378061, 1, 0, 0.145098, 1,
1.883753, 0.81769, -1.604237, 1, 0, 0.1372549, 1,
1.900107, 0.2367803, 1.980106, 1, 0, 0.1333333, 1,
1.911355, 1.635172, -0.02950593, 1, 0, 0.1254902, 1,
1.942925, -0.6584641, 3.287509, 1, 0, 0.1215686, 1,
1.948547, -1.491668, 0.9967757, 1, 0, 0.1137255, 1,
1.990893, -0.005361126, 3.199429, 1, 0, 0.1098039, 1,
2.005615, -0.8953767, 1.513683, 1, 0, 0.1019608, 1,
2.011759, 0.7983625, 0.603569, 1, 0, 0.09411765, 1,
2.051402, 0.4379641, 1.501512, 1, 0, 0.09019608, 1,
2.10008, 1.787716, 0.09378202, 1, 0, 0.08235294, 1,
2.154262, 0.4376662, 2.952748, 1, 0, 0.07843138, 1,
2.272952, -1.457106, 1.969543, 1, 0, 0.07058824, 1,
2.291018, -0.7767448, 1.0353, 1, 0, 0.06666667, 1,
2.430298, 2.326882, 0.7420111, 1, 0, 0.05882353, 1,
2.437897, 0.9512433, 1.02886, 1, 0, 0.05490196, 1,
2.450643, 0.5715296, -0.8628743, 1, 0, 0.04705882, 1,
2.48492, -0.02069617, 1.872168, 1, 0, 0.04313726, 1,
2.527357, -0.1828368, 1.152879, 1, 0, 0.03529412, 1,
2.553738, -0.620558, 3.670325, 1, 0, 0.03137255, 1,
2.776246, 1.557709, 1.815573, 1, 0, 0.02352941, 1,
2.820839, 0.876426, 0.943266, 1, 0, 0.01960784, 1,
2.982213, 0.7897391, 1.773814, 1, 0, 0.01176471, 1,
3.080269, -1.806227, 3.179988, 1, 0, 0.007843138, 1
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
-0.08130157, -3.924859, -6.503298, 0, -0.5, 0.5, 0.5,
-0.08130157, -3.924859, -6.503298, 1, -0.5, 0.5, 0.5,
-0.08130157, -3.924859, -6.503298, 1, 1.5, 0.5, 0.5,
-0.08130157, -3.924859, -6.503298, 0, 1.5, 0.5, 0.5
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
-4.314645, 0.373113, -6.503298, 0, -0.5, 0.5, 0.5,
-4.314645, 0.373113, -6.503298, 1, -0.5, 0.5, 0.5,
-4.314645, 0.373113, -6.503298, 1, 1.5, 0.5, 0.5,
-4.314645, 0.373113, -6.503298, 0, 1.5, 0.5, 0.5
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
-4.314645, -3.924859, 0.3874302, 0, -0.5, 0.5, 0.5,
-4.314645, -3.924859, 0.3874302, 1, -0.5, 0.5, 0.5,
-4.314645, -3.924859, 0.3874302, 1, 1.5, 0.5, 0.5,
-4.314645, -3.924859, 0.3874302, 0, 1.5, 0.5, 0.5
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
-3, -2.933019, -4.91313,
3, -2.933019, -4.91313,
-3, -2.933019, -4.91313,
-3, -3.098325, -5.178158,
-2, -2.933019, -4.91313,
-2, -3.098325, -5.178158,
-1, -2.933019, -4.91313,
-1, -3.098325, -5.178158,
0, -2.933019, -4.91313,
0, -3.098325, -5.178158,
1, -2.933019, -4.91313,
1, -3.098325, -5.178158,
2, -2.933019, -4.91313,
2, -3.098325, -5.178158,
3, -2.933019, -4.91313,
3, -3.098325, -5.178158
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
-3, -3.428939, -5.708214, 0, -0.5, 0.5, 0.5,
-3, -3.428939, -5.708214, 1, -0.5, 0.5, 0.5,
-3, -3.428939, -5.708214, 1, 1.5, 0.5, 0.5,
-3, -3.428939, -5.708214, 0, 1.5, 0.5, 0.5,
-2, -3.428939, -5.708214, 0, -0.5, 0.5, 0.5,
-2, -3.428939, -5.708214, 1, -0.5, 0.5, 0.5,
-2, -3.428939, -5.708214, 1, 1.5, 0.5, 0.5,
-2, -3.428939, -5.708214, 0, 1.5, 0.5, 0.5,
-1, -3.428939, -5.708214, 0, -0.5, 0.5, 0.5,
-1, -3.428939, -5.708214, 1, -0.5, 0.5, 0.5,
-1, -3.428939, -5.708214, 1, 1.5, 0.5, 0.5,
-1, -3.428939, -5.708214, 0, 1.5, 0.5, 0.5,
0, -3.428939, -5.708214, 0, -0.5, 0.5, 0.5,
0, -3.428939, -5.708214, 1, -0.5, 0.5, 0.5,
0, -3.428939, -5.708214, 1, 1.5, 0.5, 0.5,
0, -3.428939, -5.708214, 0, 1.5, 0.5, 0.5,
1, -3.428939, -5.708214, 0, -0.5, 0.5, 0.5,
1, -3.428939, -5.708214, 1, -0.5, 0.5, 0.5,
1, -3.428939, -5.708214, 1, 1.5, 0.5, 0.5,
1, -3.428939, -5.708214, 0, 1.5, 0.5, 0.5,
2, -3.428939, -5.708214, 0, -0.5, 0.5, 0.5,
2, -3.428939, -5.708214, 1, -0.5, 0.5, 0.5,
2, -3.428939, -5.708214, 1, 1.5, 0.5, 0.5,
2, -3.428939, -5.708214, 0, 1.5, 0.5, 0.5,
3, -3.428939, -5.708214, 0, -0.5, 0.5, 0.5,
3, -3.428939, -5.708214, 1, -0.5, 0.5, 0.5,
3, -3.428939, -5.708214, 1, 1.5, 0.5, 0.5,
3, -3.428939, -5.708214, 0, 1.5, 0.5, 0.5
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
-3.33772, -2, -4.91313,
-3.33772, 3, -4.91313,
-3.33772, -2, -4.91313,
-3.50054, -2, -5.178158,
-3.33772, -1, -4.91313,
-3.50054, -1, -5.178158,
-3.33772, 0, -4.91313,
-3.50054, 0, -5.178158,
-3.33772, 1, -4.91313,
-3.50054, 1, -5.178158,
-3.33772, 2, -4.91313,
-3.50054, 2, -5.178158,
-3.33772, 3, -4.91313,
-3.50054, 3, -5.178158
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
-3.826182, -2, -5.708214, 0, -0.5, 0.5, 0.5,
-3.826182, -2, -5.708214, 1, -0.5, 0.5, 0.5,
-3.826182, -2, -5.708214, 1, 1.5, 0.5, 0.5,
-3.826182, -2, -5.708214, 0, 1.5, 0.5, 0.5,
-3.826182, -1, -5.708214, 0, -0.5, 0.5, 0.5,
-3.826182, -1, -5.708214, 1, -0.5, 0.5, 0.5,
-3.826182, -1, -5.708214, 1, 1.5, 0.5, 0.5,
-3.826182, -1, -5.708214, 0, 1.5, 0.5, 0.5,
-3.826182, 0, -5.708214, 0, -0.5, 0.5, 0.5,
-3.826182, 0, -5.708214, 1, -0.5, 0.5, 0.5,
-3.826182, 0, -5.708214, 1, 1.5, 0.5, 0.5,
-3.826182, 0, -5.708214, 0, 1.5, 0.5, 0.5,
-3.826182, 1, -5.708214, 0, -0.5, 0.5, 0.5,
-3.826182, 1, -5.708214, 1, -0.5, 0.5, 0.5,
-3.826182, 1, -5.708214, 1, 1.5, 0.5, 0.5,
-3.826182, 1, -5.708214, 0, 1.5, 0.5, 0.5,
-3.826182, 2, -5.708214, 0, -0.5, 0.5, 0.5,
-3.826182, 2, -5.708214, 1, -0.5, 0.5, 0.5,
-3.826182, 2, -5.708214, 1, 1.5, 0.5, 0.5,
-3.826182, 2, -5.708214, 0, 1.5, 0.5, 0.5,
-3.826182, 3, -5.708214, 0, -0.5, 0.5, 0.5,
-3.826182, 3, -5.708214, 1, -0.5, 0.5, 0.5,
-3.826182, 3, -5.708214, 1, 1.5, 0.5, 0.5,
-3.826182, 3, -5.708214, 0, 1.5, 0.5, 0.5
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
-3.33772, -2.933019, -4,
-3.33772, -2.933019, 4,
-3.33772, -2.933019, -4,
-3.50054, -3.098325, -4,
-3.33772, -2.933019, -2,
-3.50054, -3.098325, -2,
-3.33772, -2.933019, 0,
-3.50054, -3.098325, 0,
-3.33772, -2.933019, 2,
-3.50054, -3.098325, 2,
-3.33772, -2.933019, 4,
-3.50054, -3.098325, 4
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
-3.826182, -3.428939, -4, 0, -0.5, 0.5, 0.5,
-3.826182, -3.428939, -4, 1, -0.5, 0.5, 0.5,
-3.826182, -3.428939, -4, 1, 1.5, 0.5, 0.5,
-3.826182, -3.428939, -4, 0, 1.5, 0.5, 0.5,
-3.826182, -3.428939, -2, 0, -0.5, 0.5, 0.5,
-3.826182, -3.428939, -2, 1, -0.5, 0.5, 0.5,
-3.826182, -3.428939, -2, 1, 1.5, 0.5, 0.5,
-3.826182, -3.428939, -2, 0, 1.5, 0.5, 0.5,
-3.826182, -3.428939, 0, 0, -0.5, 0.5, 0.5,
-3.826182, -3.428939, 0, 1, -0.5, 0.5, 0.5,
-3.826182, -3.428939, 0, 1, 1.5, 0.5, 0.5,
-3.826182, -3.428939, 0, 0, 1.5, 0.5, 0.5,
-3.826182, -3.428939, 2, 0, -0.5, 0.5, 0.5,
-3.826182, -3.428939, 2, 1, -0.5, 0.5, 0.5,
-3.826182, -3.428939, 2, 1, 1.5, 0.5, 0.5,
-3.826182, -3.428939, 2, 0, 1.5, 0.5, 0.5,
-3.826182, -3.428939, 4, 0, -0.5, 0.5, 0.5,
-3.826182, -3.428939, 4, 1, -0.5, 0.5, 0.5,
-3.826182, -3.428939, 4, 1, 1.5, 0.5, 0.5,
-3.826182, -3.428939, 4, 0, 1.5, 0.5, 0.5
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
-3.33772, -2.933019, -4.91313,
-3.33772, 3.679245, -4.91313,
-3.33772, -2.933019, 5.68799,
-3.33772, 3.679245, 5.68799,
-3.33772, -2.933019, -4.91313,
-3.33772, -2.933019, 5.68799,
-3.33772, 3.679245, -4.91313,
-3.33772, 3.679245, 5.68799,
-3.33772, -2.933019, -4.91313,
3.175117, -2.933019, -4.91313,
-3.33772, -2.933019, 5.68799,
3.175117, -2.933019, 5.68799,
-3.33772, 3.679245, -4.91313,
3.175117, 3.679245, -4.91313,
-3.33772, 3.679245, 5.68799,
3.175117, 3.679245, 5.68799,
3.175117, -2.933019, -4.91313,
3.175117, 3.679245, -4.91313,
3.175117, -2.933019, 5.68799,
3.175117, 3.679245, 5.68799,
3.175117, -2.933019, -4.91313,
3.175117, -2.933019, 5.68799,
3.175117, 3.679245, -4.91313,
3.175117, 3.679245, 5.68799
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
var radius = 7.523686;
var distance = 33.47374;
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
mvMatrix.translate( 0.08130157, -0.373113, -0.3874302 );
mvMatrix.scale( 1.249035, 1.230253, 0.7673488 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.47374);
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
Etofibrate<-read.table("Etofibrate.xyz")
```

```
## Error in read.table("Etofibrate.xyz"): no lines available in input
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
-3.242872, -0.01060474, -1.33127, 0, 0, 1, 1, 1,
-2.80071, 0.374053, -0.6200696, 1, 0, 0, 1, 1,
-2.670663, 0.294229, -2.228802, 1, 0, 0, 1, 1,
-2.666656, 0.4915281, -1.13284, 1, 0, 0, 1, 1,
-2.659219, 1.200898, 1.149545, 1, 0, 0, 1, 1,
-2.615238, -0.2219339, -0.3685268, 1, 0, 0, 1, 1,
-2.558153, -0.06818798, -2.298113, 0, 0, 0, 1, 1,
-2.421008, 0.4328298, -0.6924052, 0, 0, 0, 1, 1,
-2.403672, -0.5508857, -2.934894, 0, 0, 0, 1, 1,
-2.348403, 1.091767, -0.7060007, 0, 0, 0, 1, 1,
-2.322097, -0.4570184, -1.579617, 0, 0, 0, 1, 1,
-2.308424, -0.118437, -1.369508, 0, 0, 0, 1, 1,
-2.226899, -1.735069, -3.775279, 0, 0, 0, 1, 1,
-2.210198, -1.640944, -1.51169, 1, 1, 1, 1, 1,
-2.172071, -0.02387607, -2.026197, 1, 1, 1, 1, 1,
-2.135337, -0.4450502, -2.202739, 1, 1, 1, 1, 1,
-2.132755, -0.4933558, -2.241253, 1, 1, 1, 1, 1,
-2.126817, -0.09709699, -1.288115, 1, 1, 1, 1, 1,
-2.107162, -0.8394843, -1.809357, 1, 1, 1, 1, 1,
-2.085235, 1.993504, 0.5067427, 1, 1, 1, 1, 1,
-2.081189, 1.187966, -0.06849267, 1, 1, 1, 1, 1,
-2.070695, -0.2830013, -0.9695054, 1, 1, 1, 1, 1,
-2.065182, -0.1003219, -2.103775, 1, 1, 1, 1, 1,
-2.042918, 0.1842934, -0.515551, 1, 1, 1, 1, 1,
-2.034781, 0.2455607, -0.9984583, 1, 1, 1, 1, 1,
-2.028167, -1.100499, -1.250315, 1, 1, 1, 1, 1,
-2.026258, 0.8551276, -1.168295, 1, 1, 1, 1, 1,
-2.022536, -0.5591836, -0.6659221, 1, 1, 1, 1, 1,
-1.981017, -0.3146256, -2.070181, 0, 0, 1, 1, 1,
-1.959858, 1.813709, 0.5661112, 1, 0, 0, 1, 1,
-1.919444, 0.8266954, -0.1555429, 1, 0, 0, 1, 1,
-1.915384, -0.02953131, -2.440406, 1, 0, 0, 1, 1,
-1.857602, -0.1304523, -3.094398, 1, 0, 0, 1, 1,
-1.853445, -0.7405708, -1.539562, 1, 0, 0, 1, 1,
-1.848119, -0.0598645, -1.079582, 0, 0, 0, 1, 1,
-1.833511, 0.7646871, -1.017635, 0, 0, 0, 1, 1,
-1.820543, -0.4647226, 0.1748958, 0, 0, 0, 1, 1,
-1.781033, -1.722273, -2.041452, 0, 0, 0, 1, 1,
-1.777293, 1.131621, -0.7942874, 0, 0, 0, 1, 1,
-1.73332, -1.931314, -2.361896, 0, 0, 0, 1, 1,
-1.732231, -0.6500814, -2.637769, 0, 0, 0, 1, 1,
-1.725804, -0.004050571, -2.032149, 1, 1, 1, 1, 1,
-1.712297, 0.1284862, 0.2582447, 1, 1, 1, 1, 1,
-1.699852, -0.5417973, -2.135267, 1, 1, 1, 1, 1,
-1.693614, -0.6899312, -0.4017057, 1, 1, 1, 1, 1,
-1.692111, 0.5918768, 0.3949046, 1, 1, 1, 1, 1,
-1.675035, -0.09383531, -1.985167, 1, 1, 1, 1, 1,
-1.674035, -1.430245, -2.678607, 1, 1, 1, 1, 1,
-1.673298, -0.367195, -2.50762, 1, 1, 1, 1, 1,
-1.644329, 0.9111693, -1.139961, 1, 1, 1, 1, 1,
-1.633872, -1.553639, -2.251141, 1, 1, 1, 1, 1,
-1.629929, 0.4773157, -2.741534, 1, 1, 1, 1, 1,
-1.62343, -0.1358779, -1.951148, 1, 1, 1, 1, 1,
-1.616398, 0.4394378, 0.4973467, 1, 1, 1, 1, 1,
-1.615712, 0.6350769, -1.400734, 1, 1, 1, 1, 1,
-1.601506, -0.03758959, -0.6145335, 1, 1, 1, 1, 1,
-1.601134, 0.7753131, -0.1634958, 0, 0, 1, 1, 1,
-1.579098, 0.3983386, 0.4372394, 1, 0, 0, 1, 1,
-1.529682, 0.6567371, -1.956192, 1, 0, 0, 1, 1,
-1.528855, 0.06810524, -0.0006256414, 1, 0, 0, 1, 1,
-1.508206, -0.1264183, -2.365291, 1, 0, 0, 1, 1,
-1.503538, -0.3232467, -2.666655, 1, 0, 0, 1, 1,
-1.490511, -1.5155, -1.238715, 0, 0, 0, 1, 1,
-1.473445, 0.9681856, -0.7410765, 0, 0, 0, 1, 1,
-1.470196, 0.03103798, -1.884048, 0, 0, 0, 1, 1,
-1.467344, 1.296103, -2.453888, 0, 0, 0, 1, 1,
-1.464252, 3.257766, 0.9226351, 0, 0, 0, 1, 1,
-1.459335, -0.06363816, -0.7974468, 0, 0, 0, 1, 1,
-1.453805, -0.9579307, -1.826834, 0, 0, 0, 1, 1,
-1.438424, 0.7941128, -2.504224, 1, 1, 1, 1, 1,
-1.435004, 2.385763, 0.1167564, 1, 1, 1, 1, 1,
-1.416975, -0.1071055, -2.208449, 1, 1, 1, 1, 1,
-1.412766, -0.077139, -0.3486668, 1, 1, 1, 1, 1,
-1.40326, 0.3795066, -1.284133, 1, 1, 1, 1, 1,
-1.385537, -0.6118706, -3.900908, 1, 1, 1, 1, 1,
-1.377905, -0.1480222, -2.397043, 1, 1, 1, 1, 1,
-1.376401, 0.1197648, -1.2691, 1, 1, 1, 1, 1,
-1.373323, -0.1691384, -0.9002751, 1, 1, 1, 1, 1,
-1.368873, 0.1537868, -1.107087, 1, 1, 1, 1, 1,
-1.367438, 1.581011, 0.310289, 1, 1, 1, 1, 1,
-1.363331, -1.853018, -1.979728, 1, 1, 1, 1, 1,
-1.344549, -0.8138419, -1.657512, 1, 1, 1, 1, 1,
-1.34064, -1.298649, -2.367683, 1, 1, 1, 1, 1,
-1.312059, 0.1878512, -0.601612, 1, 1, 1, 1, 1,
-1.311597, 1.04264, -1.050626, 0, 0, 1, 1, 1,
-1.302671, 0.2924581, -3.449617, 1, 0, 0, 1, 1,
-1.298643, -1.058161, -1.633333, 1, 0, 0, 1, 1,
-1.296295, 0.6909511, -2.310728, 1, 0, 0, 1, 1,
-1.29597, -0.4927809, -3.163523, 1, 0, 0, 1, 1,
-1.288786, -0.7639024, -3.064957, 1, 0, 0, 1, 1,
-1.27691, -0.3655749, -1.633042, 0, 0, 0, 1, 1,
-1.276569, 0.08015042, 0.08814634, 0, 0, 0, 1, 1,
-1.271384, -1.422629, -1.031992, 0, 0, 0, 1, 1,
-1.26739, -1.361325, 0.5405554, 0, 0, 0, 1, 1,
-1.263592, -1.901281, -3.034343, 0, 0, 0, 1, 1,
-1.260618, 1.059584, -0.760419, 0, 0, 0, 1, 1,
-1.255318, -1.426669, -3.301789, 0, 0, 0, 1, 1,
-1.254062, 0.723215, 0.5389508, 1, 1, 1, 1, 1,
-1.249712, 0.9585264, 0.1310913, 1, 1, 1, 1, 1,
-1.242663, 0.9481156, 0.3246462, 1, 1, 1, 1, 1,
-1.240987, 0.06252402, -1.524381, 1, 1, 1, 1, 1,
-1.239033, 0.2112122, -1.639742, 1, 1, 1, 1, 1,
-1.236115, 1.192696, 0.1142266, 1, 1, 1, 1, 1,
-1.234285, 1.138714, -3.235591, 1, 1, 1, 1, 1,
-1.229533, 1.368878, -0.1209188, 1, 1, 1, 1, 1,
-1.228653, -0.5113956, -3.617561, 1, 1, 1, 1, 1,
-1.226823, -0.3986226, -1.03668, 1, 1, 1, 1, 1,
-1.224401, -1.24762, -3.299192, 1, 1, 1, 1, 1,
-1.213613, 0.7546601, -0.2335218, 1, 1, 1, 1, 1,
-1.207372, 0.5697283, -0.7543887, 1, 1, 1, 1, 1,
-1.204609, 0.3462608, 0.1855032, 1, 1, 1, 1, 1,
-1.198633, -1.113153, -2.30263, 1, 1, 1, 1, 1,
-1.198294, -0.04959305, -1.250041, 0, 0, 1, 1, 1,
-1.196286, 1.665609, 1.089075, 1, 0, 0, 1, 1,
-1.194805, 0.1110215, -3.585476, 1, 0, 0, 1, 1,
-1.193814, 0.04874514, -2.624364, 1, 0, 0, 1, 1,
-1.193811, 1.772012, -1.419916, 1, 0, 0, 1, 1,
-1.193046, -0.0777302, -0.2326215, 1, 0, 0, 1, 1,
-1.191872, 1.222925, -0.9594535, 0, 0, 0, 1, 1,
-1.1894, 0.1812971, -2.162761, 0, 0, 0, 1, 1,
-1.186889, 0.1791454, -0.4049111, 0, 0, 0, 1, 1,
-1.185027, 1.006714, -2.78811, 0, 0, 0, 1, 1,
-1.183324, -0.3864152, -2.481992, 0, 0, 0, 1, 1,
-1.180787, -0.6507015, -2.368049, 0, 0, 0, 1, 1,
-1.177173, 1.046106, -2.533291, 0, 0, 0, 1, 1,
-1.175918, 0.6945246, 1.13322, 1, 1, 1, 1, 1,
-1.17388, 0.7783924, -0.5648137, 1, 1, 1, 1, 1,
-1.173735, -0.6360434, -1.28294, 1, 1, 1, 1, 1,
-1.172834, -0.1720919, -1.663106, 1, 1, 1, 1, 1,
-1.161852, 1.893651, -0.8659812, 1, 1, 1, 1, 1,
-1.157905, -0.2913212, -0.4413198, 1, 1, 1, 1, 1,
-1.15429, 0.02972849, -1.622124, 1, 1, 1, 1, 1,
-1.149159, -0.4181485, -2.384794, 1, 1, 1, 1, 1,
-1.147266, -0.6304751, -2.470937, 1, 1, 1, 1, 1,
-1.1394, 0.005922229, -2.78266, 1, 1, 1, 1, 1,
-1.12556, 1.857472, 0.6000112, 1, 1, 1, 1, 1,
-1.124463, 0.9596153, -0.5960618, 1, 1, 1, 1, 1,
-1.121682, 1.424824, 0.07957329, 1, 1, 1, 1, 1,
-1.109259, 0.8173499, 0.3518086, 1, 1, 1, 1, 1,
-1.107569, -0.3692883, -2.344709, 1, 1, 1, 1, 1,
-1.099754, -0.7386538, -2.595915, 0, 0, 1, 1, 1,
-1.099363, 0.5506092, -1.309166, 1, 0, 0, 1, 1,
-1.095267, 0.1004305, -1.866755, 1, 0, 0, 1, 1,
-1.093439, 0.630955, -0.7219203, 1, 0, 0, 1, 1,
-1.091241, -0.07843074, 0.1451638, 1, 0, 0, 1, 1,
-1.087943, -0.2334246, -4.056434, 1, 0, 0, 1, 1,
-1.084701, 0.7869954, -0.885603, 0, 0, 0, 1, 1,
-1.079785, -1.347803, -1.651105, 0, 0, 0, 1, 1,
-1.079617, 0.6902305, -2.050006, 0, 0, 0, 1, 1,
-1.078635, -0.4508595, -2.689093, 0, 0, 0, 1, 1,
-1.077996, 1.477444, 0.2573203, 0, 0, 0, 1, 1,
-1.0779, 2.535232, 0.6176223, 0, 0, 0, 1, 1,
-1.075436, -1.194647, -1.509063, 0, 0, 0, 1, 1,
-1.073923, -2.485322, -1.857924, 1, 1, 1, 1, 1,
-1.061491, -0.8171046, -2.798893, 1, 1, 1, 1, 1,
-1.060031, -1.299392, -1.129612, 1, 1, 1, 1, 1,
-1.05907, 0.08310415, -1.136133, 1, 1, 1, 1, 1,
-1.050265, 0.169967, -1.695068, 1, 1, 1, 1, 1,
-1.049607, -1.476735, -1.942594, 1, 1, 1, 1, 1,
-1.048714, -0.4394321, -2.337595, 1, 1, 1, 1, 1,
-1.040144, 0.7181311, -0.2848071, 1, 1, 1, 1, 1,
-1.030933, -0.2889253, -2.480995, 1, 1, 1, 1, 1,
-1.027536, 0.249053, -1.323541, 1, 1, 1, 1, 1,
-1.023759, 0.1318386, -1.792723, 1, 1, 1, 1, 1,
-1.01841, 0.2032347, -1.128535, 1, 1, 1, 1, 1,
-1.015171, -0.1664392, -3.928553, 1, 1, 1, 1, 1,
-1.014452, 0.6820318, -2.166484, 1, 1, 1, 1, 1,
-1.012856, -0.5461608, 1.143581, 1, 1, 1, 1, 1,
-1.005939, -0.4916651, -0.6404465, 0, 0, 1, 1, 1,
-1.002887, -1.988986, -0.7698384, 1, 0, 0, 1, 1,
-0.9993481, 0.1216634, -1.321206, 1, 0, 0, 1, 1,
-0.9968902, -0.5228575, -1.705715, 1, 0, 0, 1, 1,
-0.9913458, -0.8421821, -1.484597, 1, 0, 0, 1, 1,
-0.9820249, 0.7535221, -1.718481, 1, 0, 0, 1, 1,
-0.9810538, -0.08515777, -0.04534145, 0, 0, 0, 1, 1,
-0.9797952, 0.88679, -0.0001194035, 0, 0, 0, 1, 1,
-0.9687255, -1.57296, -1.808663, 0, 0, 0, 1, 1,
-0.9642998, -0.2474811, -1.941921, 0, 0, 0, 1, 1,
-0.9596593, 1.025298, -3.234199, 0, 0, 0, 1, 1,
-0.9595863, 0.4650427, -1.699628, 0, 0, 0, 1, 1,
-0.9585887, 1.213902, -2.124698, 0, 0, 0, 1, 1,
-0.9579413, 0.7675794, 0.005523049, 1, 1, 1, 1, 1,
-0.9564023, -0.8517206, -2.264946, 1, 1, 1, 1, 1,
-0.954816, -0.5298871, -1.622023, 1, 1, 1, 1, 1,
-0.9337045, -0.345519, -1.89032, 1, 1, 1, 1, 1,
-0.932041, 0.08910999, -3.383163, 1, 1, 1, 1, 1,
-0.9303994, -1.775275, -2.145217, 1, 1, 1, 1, 1,
-0.9256744, 0.1389677, -1.647873, 1, 1, 1, 1, 1,
-0.9235322, 0.05154471, -1.738432, 1, 1, 1, 1, 1,
-0.922001, -0.1605527, -0.9890811, 1, 1, 1, 1, 1,
-0.91347, -0.6046777, -2.031408, 1, 1, 1, 1, 1,
-0.9127929, 0.4169723, -1.012485, 1, 1, 1, 1, 1,
-0.9036132, 0.9248396, -0.5249231, 1, 1, 1, 1, 1,
-0.9034439, -1.538052, -2.005174, 1, 1, 1, 1, 1,
-0.8998793, -1.30737, -2.561204, 1, 1, 1, 1, 1,
-0.8915676, 0.9247566, -1.227937, 1, 1, 1, 1, 1,
-0.8904658, -1.105841, -0.6945859, 0, 0, 1, 1, 1,
-0.8887038, 0.259558, -0.1685388, 1, 0, 0, 1, 1,
-0.8797167, -1.602328, -2.24056, 1, 0, 0, 1, 1,
-0.8762745, -1.234432, -2.991837, 1, 0, 0, 1, 1,
-0.8752018, -1.905298, -2.36783, 1, 0, 0, 1, 1,
-0.8732648, -0.3929878, -0.254869, 1, 0, 0, 1, 1,
-0.8684618, 0.4509698, -0.2537487, 0, 0, 0, 1, 1,
-0.8661655, -1.016571, -2.515435, 0, 0, 0, 1, 1,
-0.8652348, 0.5730205, -1.569902, 0, 0, 0, 1, 1,
-0.8494154, 0.6051433, -0.5849572, 0, 0, 0, 1, 1,
-0.842552, -0.7354165, -2.652643, 0, 0, 0, 1, 1,
-0.8411417, -0.08954129, -2.580591, 0, 0, 0, 1, 1,
-0.8403717, 0.01984174, -0.2907503, 0, 0, 0, 1, 1,
-0.8391812, -2.350798, -3.169801, 1, 1, 1, 1, 1,
-0.8352314, 0.9286579, 0.5624844, 1, 1, 1, 1, 1,
-0.8337507, -1.043656, -3.69166, 1, 1, 1, 1, 1,
-0.8327748, 0.6194692, -1.769457, 1, 1, 1, 1, 1,
-0.8327224, -0.4015574, -1.693384, 1, 1, 1, 1, 1,
-0.821968, 1.622704, 0.9992881, 1, 1, 1, 1, 1,
-0.8206384, -0.6988429, -2.303116, 1, 1, 1, 1, 1,
-0.8195633, -0.3971588, -2.95034, 1, 1, 1, 1, 1,
-0.8114406, 1.490497, -0.9647892, 1, 1, 1, 1, 1,
-0.8104745, -0.4512853, -2.428936, 1, 1, 1, 1, 1,
-0.8052743, -0.6710373, -1.836485, 1, 1, 1, 1, 1,
-0.8019232, -0.6664531, -2.96415, 1, 1, 1, 1, 1,
-0.7999499, 0.9045836, -1.592549, 1, 1, 1, 1, 1,
-0.7991864, -0.2906601, -0.7400631, 1, 1, 1, 1, 1,
-0.798374, -1.065279, -2.163641, 1, 1, 1, 1, 1,
-0.7948775, 0.5890089, -1.075934, 0, 0, 1, 1, 1,
-0.7881856, -0.2942611, -4.041136, 1, 0, 0, 1, 1,
-0.7877093, -1.259271, -1.311691, 1, 0, 0, 1, 1,
-0.7843561, -1.677343, -3.984642, 1, 0, 0, 1, 1,
-0.7738351, 0.40795, -1.158448, 1, 0, 0, 1, 1,
-0.7717221, -1.342125, -3.325586, 1, 0, 0, 1, 1,
-0.7701711, -0.09112871, -0.7845263, 0, 0, 0, 1, 1,
-0.7698727, 0.6535621, -1.953406, 0, 0, 0, 1, 1,
-0.7687137, 2.289908, 0.5365875, 0, 0, 0, 1, 1,
-0.765503, -0.1573611, -2.710853, 0, 0, 0, 1, 1,
-0.757266, -1.539156, -2.071321, 0, 0, 0, 1, 1,
-0.7563423, 0.2754039, -1.465971, 0, 0, 0, 1, 1,
-0.754362, -0.07535058, -4.526258, 0, 0, 0, 1, 1,
-0.7528748, -2.234508, -1.799891, 1, 1, 1, 1, 1,
-0.752275, -1.599425, -3.21145, 1, 1, 1, 1, 1,
-0.7503316, -1.404582, -1.805584, 1, 1, 1, 1, 1,
-0.7421602, -0.8536074, -1.603938, 1, 1, 1, 1, 1,
-0.7393268, 0.3614962, -1.173637, 1, 1, 1, 1, 1,
-0.737759, 0.4222234, -0.04739419, 1, 1, 1, 1, 1,
-0.7270442, 0.146792, 0.09832697, 1, 1, 1, 1, 1,
-0.7244309, 0.1224241, -0.9614012, 1, 1, 1, 1, 1,
-0.7219006, 0.04853856, -0.1446543, 1, 1, 1, 1, 1,
-0.7148544, 1.365869, -0.181499, 1, 1, 1, 1, 1,
-0.712635, 1.056327, -1.092018, 1, 1, 1, 1, 1,
-0.7124082, 1.085527, -0.07184841, 1, 1, 1, 1, 1,
-0.711834, 0.9606848, -1.217723, 1, 1, 1, 1, 1,
-0.7015773, -1.258595, -0.9208489, 1, 1, 1, 1, 1,
-0.6998435, -0.6058204, -1.91, 1, 1, 1, 1, 1,
-0.6991811, -0.8612766, -1.176517, 0, 0, 1, 1, 1,
-0.6976022, -2.836724, -3.487981, 1, 0, 0, 1, 1,
-0.6932313, -0.6586509, -1.811041, 1, 0, 0, 1, 1,
-0.6926956, 0.3961482, -0.5923486, 1, 0, 0, 1, 1,
-0.6885104, -0.723206, -2.875694, 1, 0, 0, 1, 1,
-0.684512, 0.4681899, -1.960879, 1, 0, 0, 1, 1,
-0.6805437, -0.490478, -1.874713, 0, 0, 0, 1, 1,
-0.6774558, 0.4183863, -2.191652, 0, 0, 0, 1, 1,
-0.6770504, -0.6780012, -2.065228, 0, 0, 0, 1, 1,
-0.6760954, 1.074044, 0.3929921, 0, 0, 0, 1, 1,
-0.675063, 0.8614992, 0.379094, 0, 0, 0, 1, 1,
-0.6718892, -0.4678521, -3.154041, 0, 0, 0, 1, 1,
-0.6714078, -0.1660526, -0.7290894, 0, 0, 0, 1, 1,
-0.6700188, -1.361672, -2.575644, 1, 1, 1, 1, 1,
-0.6698557, -0.7318858, -2.136852, 1, 1, 1, 1, 1,
-0.6694572, 0.5321091, -0.9995492, 1, 1, 1, 1, 1,
-0.6579304, 0.3223838, -1.200309, 1, 1, 1, 1, 1,
-0.6536003, 0.7069774, 1.194406, 1, 1, 1, 1, 1,
-0.6522236, -0.9386448, -2.264311, 1, 1, 1, 1, 1,
-0.6453495, 1.215046, -2.301567, 1, 1, 1, 1, 1,
-0.6377718, -0.18333, -3.013975, 1, 1, 1, 1, 1,
-0.6366296, 0.04870719, -1.404438, 1, 1, 1, 1, 1,
-0.6330991, -0.2573012, -2.926161, 1, 1, 1, 1, 1,
-0.632249, -0.7651595, -2.916167, 1, 1, 1, 1, 1,
-0.6293115, -0.2007705, -2.079095, 1, 1, 1, 1, 1,
-0.6250218, -1.477818, -2.509359, 1, 1, 1, 1, 1,
-0.6203043, 0.3577724, -1.478336, 1, 1, 1, 1, 1,
-0.6191337, -0.2565181, -2.560209, 1, 1, 1, 1, 1,
-0.6183388, 0.132438, -1.83098, 0, 0, 1, 1, 1,
-0.6164321, -0.3221631, -3.456267, 1, 0, 0, 1, 1,
-0.6105773, 0.4536627, -3.182538, 1, 0, 0, 1, 1,
-0.6029761, -1.112899, -1.802071, 1, 0, 0, 1, 1,
-0.6009445, -0.8200371, -3.571511, 1, 0, 0, 1, 1,
-0.5971624, 1.839082, -2.447214, 1, 0, 0, 1, 1,
-0.5925422, -2.43537, -1.624104, 0, 0, 0, 1, 1,
-0.5916707, -0.1065708, -3.017447, 0, 0, 0, 1, 1,
-0.5890391, -1.699249, -3.569419, 0, 0, 0, 1, 1,
-0.5887118, 1.407965, 0.4715458, 0, 0, 0, 1, 1,
-0.5877931, 0.1351707, -0.4946488, 0, 0, 0, 1, 1,
-0.5865769, 0.5506669, 1.288265, 0, 0, 0, 1, 1,
-0.584354, -0.4317206, -1.429051, 0, 0, 0, 1, 1,
-0.5841781, -0.7991382, 0.03302488, 1, 1, 1, 1, 1,
-0.5830988, -2.044179, -2.333572, 1, 1, 1, 1, 1,
-0.5822927, -0.823289, -1.918331, 1, 1, 1, 1, 1,
-0.5803733, 0.3894558, 0.652508, 1, 1, 1, 1, 1,
-0.5769835, 0.8155242, -0.6983592, 1, 1, 1, 1, 1,
-0.574914, 0.2166993, -1.302389, 1, 1, 1, 1, 1,
-0.5702717, -0.2562367, -2.433008, 1, 1, 1, 1, 1,
-0.5695103, 0.008754613, -1.38132, 1, 1, 1, 1, 1,
-0.5692471, 0.6996661, 0.7733443, 1, 1, 1, 1, 1,
-0.5668007, -0.2454776, -1.776746, 1, 1, 1, 1, 1,
-0.5663021, 1.676602, 0.1287114, 1, 1, 1, 1, 1,
-0.5628491, 1.33022, 0.530187, 1, 1, 1, 1, 1,
-0.5572082, 0.2922665, 1.099105, 1, 1, 1, 1, 1,
-0.5569345, 1.767274, 0.5630016, 1, 1, 1, 1, 1,
-0.5533836, 1.353459, -0.8858445, 1, 1, 1, 1, 1,
-0.5530806, 0.2576575, -0.8474785, 0, 0, 1, 1, 1,
-0.5471999, -0.3732462, -1.460733, 1, 0, 0, 1, 1,
-0.5458928, -0.3429383, -2.868485, 1, 0, 0, 1, 1,
-0.5416228, -0.3232153, -1.258426, 1, 0, 0, 1, 1,
-0.537728, 0.07468163, -1.793307, 1, 0, 0, 1, 1,
-0.530091, 0.3815616, -1.779376, 1, 0, 0, 1, 1,
-0.5294507, -1.19919, -3.016953, 0, 0, 0, 1, 1,
-0.5265238, -0.002625414, -1.013637, 0, 0, 0, 1, 1,
-0.523472, 0.4802867, -1.786695, 0, 0, 0, 1, 1,
-0.523265, 0.2510693, -2.232641, 0, 0, 0, 1, 1,
-0.5169433, -1.295852, -3.382898, 0, 0, 0, 1, 1,
-0.516332, 0.8459372, 0.09128686, 0, 0, 0, 1, 1,
-0.5151806, -0.8063664, -2.33235, 0, 0, 0, 1, 1,
-0.5150739, 1.966808, -0.9196023, 1, 1, 1, 1, 1,
-0.5148973, 1.21659, -0.8500181, 1, 1, 1, 1, 1,
-0.5141995, -0.08442934, -1.368852, 1, 1, 1, 1, 1,
-0.5085458, -0.9552673, -3.77311, 1, 1, 1, 1, 1,
-0.5005972, 0.1679181, -1.439713, 1, 1, 1, 1, 1,
-0.5000083, 0.7305009, 1.745006, 1, 1, 1, 1, 1,
-0.4980024, -1.397016, -3.922385, 1, 1, 1, 1, 1,
-0.4925425, -0.08658094, -2.056607, 1, 1, 1, 1, 1,
-0.4843869, 0.9863498, -1.791689, 1, 1, 1, 1, 1,
-0.4833367, -1.165332, -4.073871, 1, 1, 1, 1, 1,
-0.4796352, -1.253163, -3.177844, 1, 1, 1, 1, 1,
-0.4783685, -0.2773567, -1.924414, 1, 1, 1, 1, 1,
-0.475181, 0.3336904, 0.4633313, 1, 1, 1, 1, 1,
-0.474805, 0.8907517, -0.9457363, 1, 1, 1, 1, 1,
-0.4748028, 1.040573, -2.190306, 1, 1, 1, 1, 1,
-0.4705529, 0.4815354, -1.990208, 0, 0, 1, 1, 1,
-0.4690751, -0.4478403, -0.689373, 1, 0, 0, 1, 1,
-0.4685126, 0.1468488, -2.07281, 1, 0, 0, 1, 1,
-0.4683597, 0.1572615, -0.6758891, 1, 0, 0, 1, 1,
-0.4630808, -0.7238975, -2.979551, 1, 0, 0, 1, 1,
-0.4614228, 0.9467713, 0.002344607, 1, 0, 0, 1, 1,
-0.4600684, -0.2869136, -0.6346173, 0, 0, 0, 1, 1,
-0.4566357, -0.5488877, -1.067434, 0, 0, 0, 1, 1,
-0.4564701, 0.2201312, -2.126054, 0, 0, 0, 1, 1,
-0.4564193, 2.533037, -1.41196, 0, 0, 0, 1, 1,
-0.4543501, 0.3204761, -1.080309, 0, 0, 0, 1, 1,
-0.4532885, -0.4059921, -0.4215666, 0, 0, 0, 1, 1,
-0.4485372, -0.9341334, -3.621765, 0, 0, 0, 1, 1,
-0.4477505, -0.5278054, -1.766849, 1, 1, 1, 1, 1,
-0.4474009, 2.12126, -0.8606525, 1, 1, 1, 1, 1,
-0.4459081, 0.8761955, -0.1240078, 1, 1, 1, 1, 1,
-0.440019, -0.7677072, -1.705047, 1, 1, 1, 1, 1,
-0.4368531, 2.291818, -0.2932521, 1, 1, 1, 1, 1,
-0.4336301, 3.58295, -0.8510711, 1, 1, 1, 1, 1,
-0.4324908, 1.279662, 0.2230088, 1, 1, 1, 1, 1,
-0.4318219, 1.141253, -0.03405936, 1, 1, 1, 1, 1,
-0.4309607, 1.09539, -0.9816634, 1, 1, 1, 1, 1,
-0.4238416, -1.65757, -3.890859, 1, 1, 1, 1, 1,
-0.4224564, 0.6049869, -1.636357, 1, 1, 1, 1, 1,
-0.4221126, 0.7104127, 1.005946, 1, 1, 1, 1, 1,
-0.4206689, 0.2397314, -0.03856834, 1, 1, 1, 1, 1,
-0.416887, -0.5813947, -3.35188, 1, 1, 1, 1, 1,
-0.416415, 0.2910216, -1.353508, 1, 1, 1, 1, 1,
-0.4100181, 1.492417, 0.258564, 0, 0, 1, 1, 1,
-0.405544, 0.1772562, -0.9543918, 1, 0, 0, 1, 1,
-0.3983239, -0.04182476, -3.021505, 1, 0, 0, 1, 1,
-0.3979762, -1.205933, -0.9138506, 1, 0, 0, 1, 1,
-0.3977056, -1.166524, -1.572097, 1, 0, 0, 1, 1,
-0.3972504, -1.145714, -1.759571, 1, 0, 0, 1, 1,
-0.3947278, -0.1751267, -2.216171, 0, 0, 0, 1, 1,
-0.3932715, -0.2176556, -2.576224, 0, 0, 0, 1, 1,
-0.3893379, -0.1430971, -3.861674, 0, 0, 0, 1, 1,
-0.3876362, 0.1503658, -0.5297241, 0, 0, 0, 1, 1,
-0.3859849, -0.4982881, -3.031034, 0, 0, 0, 1, 1,
-0.3842825, -0.2488647, -2.507815, 0, 0, 0, 1, 1,
-0.3785928, 0.5738466, 0.1406406, 0, 0, 0, 1, 1,
-0.3663897, 1.576177, 1.438495, 1, 1, 1, 1, 1,
-0.3655581, -0.6595538, -1.619622, 1, 1, 1, 1, 1,
-0.3638081, 0.6016099, -1.636655, 1, 1, 1, 1, 1,
-0.3615913, -2.342455, -1.44507, 1, 1, 1, 1, 1,
-0.3602522, 0.01677226, -1.065987, 1, 1, 1, 1, 1,
-0.3598416, -0.1416956, -2.032308, 1, 1, 1, 1, 1,
-0.3590563, 0.8190916, 0.6615093, 1, 1, 1, 1, 1,
-0.3515549, 1.694672, -0.1129377, 1, 1, 1, 1, 1,
-0.3514535, 0.6956478, -2.240124, 1, 1, 1, 1, 1,
-0.3495583, -1.465532, -1.185577, 1, 1, 1, 1, 1,
-0.3481844, 0.646593, -0.1209687, 1, 1, 1, 1, 1,
-0.3445704, 0.6700934, -1.930616, 1, 1, 1, 1, 1,
-0.340299, 0.3827455, 0.9058505, 1, 1, 1, 1, 1,
-0.3346658, -0.06348579, -2.07178, 1, 1, 1, 1, 1,
-0.3346242, -0.7790312, -2.660847, 1, 1, 1, 1, 1,
-0.332558, 0.3280869, -0.5517851, 0, 0, 1, 1, 1,
-0.3311721, 0.8373559, 0.7227189, 1, 0, 0, 1, 1,
-0.3293422, -0.9813809, -2.656328, 1, 0, 0, 1, 1,
-0.3256932, -0.05872225, -2.537754, 1, 0, 0, 1, 1,
-0.3237372, 1.437285, 1.492892, 1, 0, 0, 1, 1,
-0.3212857, 2.046423, 0.7642149, 1, 0, 0, 1, 1,
-0.3198725, 1.967746, -0.1492522, 0, 0, 0, 1, 1,
-0.3176413, -0.01878307, -2.038217, 0, 0, 0, 1, 1,
-0.3005672, 1.744133, -0.3123138, 0, 0, 0, 1, 1,
-0.2986907, -2.332864, -3.43787, 0, 0, 0, 1, 1,
-0.2947076, 0.1830166, -0.08872344, 0, 0, 0, 1, 1,
-0.29345, -0.7502071, -4.201393, 0, 0, 0, 1, 1,
-0.291211, 0.2255948, 0.08889047, 0, 0, 0, 1, 1,
-0.2911238, -0.2171436, -0.9549336, 1, 1, 1, 1, 1,
-0.2883123, -0.691286, -1.297296, 1, 1, 1, 1, 1,
-0.2862933, 1.470152, -0.5219477, 1, 1, 1, 1, 1,
-0.2799144, -0.5478618, -2.722742, 1, 1, 1, 1, 1,
-0.2785506, 0.2410892, -1.965102, 1, 1, 1, 1, 1,
-0.2737027, 0.1966287, -2.146488, 1, 1, 1, 1, 1,
-0.2641036, 0.8540961, -1.215144, 1, 1, 1, 1, 1,
-0.2578517, 0.360716, -0.5632458, 1, 1, 1, 1, 1,
-0.2521209, -0.01002169, -1.734044, 1, 1, 1, 1, 1,
-0.2468466, 0.4542662, -1.846497, 1, 1, 1, 1, 1,
-0.2445431, -2.064376, -4.014011, 1, 1, 1, 1, 1,
-0.2437838, -0.2706296, -1.831179, 1, 1, 1, 1, 1,
-0.2434819, -1.120207, -2.372294, 1, 1, 1, 1, 1,
-0.2404302, -0.3141067, 1.519211, 1, 1, 1, 1, 1,
-0.2393477, -0.7252966, -3.841551, 1, 1, 1, 1, 1,
-0.2357976, 1.041695, 0.8167127, 0, 0, 1, 1, 1,
-0.2354452, -0.6620699, -1.960791, 1, 0, 0, 1, 1,
-0.2311601, 0.08247948, -1.500646, 1, 0, 0, 1, 1,
-0.2305502, -0.899287, -3.370049, 1, 0, 0, 1, 1,
-0.2294841, -0.7846199, -2.450303, 1, 0, 0, 1, 1,
-0.2282615, 0.2257443, -1.262003, 1, 0, 0, 1, 1,
-0.2280309, 1.782409, 0.9449216, 0, 0, 0, 1, 1,
-0.2272268, 0.3355321, -0.08445445, 0, 0, 0, 1, 1,
-0.2266636, 0.6731004, -1.795466, 0, 0, 0, 1, 1,
-0.2233845, 0.386441, -0.8543847, 0, 0, 0, 1, 1,
-0.2215977, -0.847773, -3.415741, 0, 0, 0, 1, 1,
-0.220473, 0.07048612, -0.429802, 0, 0, 0, 1, 1,
-0.2144407, -1.11346, -1.572009, 0, 0, 0, 1, 1,
-0.2126505, -0.7986785, -2.973966, 1, 1, 1, 1, 1,
-0.2022921, -1.30136, -2.479981, 1, 1, 1, 1, 1,
-0.1999789, -1.901766, -3.672112, 1, 1, 1, 1, 1,
-0.1996978, 2.855275, 0.3245848, 1, 1, 1, 1, 1,
-0.1976839, 1.06266, 0.4035732, 1, 1, 1, 1, 1,
-0.1970206, 1.304738, 0.3060799, 1, 1, 1, 1, 1,
-0.1948957, -0.665068, -0.9698282, 1, 1, 1, 1, 1,
-0.1934707, -0.4900987, -1.516875, 1, 1, 1, 1, 1,
-0.1929827, -0.6649402, -2.855094, 1, 1, 1, 1, 1,
-0.1884504, 0.007482651, -1.401035, 1, 1, 1, 1, 1,
-0.1871436, -0.3795199, -2.425463, 1, 1, 1, 1, 1,
-0.18123, -1.536716, -2.532506, 1, 1, 1, 1, 1,
-0.1767566, 0.680387, 0.4523219, 1, 1, 1, 1, 1,
-0.1734945, -0.2159365, -3.803931, 1, 1, 1, 1, 1,
-0.1727598, 1.035356, -1.58399, 1, 1, 1, 1, 1,
-0.1690363, 0.05574458, -1.559227, 0, 0, 1, 1, 1,
-0.1669158, -0.03339021, -0.9768398, 1, 0, 0, 1, 1,
-0.1664126, -0.05900923, -3.437884, 1, 0, 0, 1, 1,
-0.1660468, 0.5754483, -1.452798, 1, 0, 0, 1, 1,
-0.1623609, -0.529578, -2.290061, 1, 0, 0, 1, 1,
-0.1616824, -1.003298, -2.633608, 1, 0, 0, 1, 1,
-0.1596188, 2.020477, -1.123038, 0, 0, 0, 1, 1,
-0.1572852, 0.7493484, 0.7811084, 0, 0, 0, 1, 1,
-0.1553052, 0.7347177, 1.280273, 0, 0, 0, 1, 1,
-0.1521308, 1.390635, 1.101329, 0, 0, 0, 1, 1,
-0.1513305, -1.883452, -1.048035, 0, 0, 0, 1, 1,
-0.150692, -1.205483, -1.079796, 0, 0, 0, 1, 1,
-0.1503399, -0.7058333, -3.994309, 0, 0, 0, 1, 1,
-0.1472812, -0.7589081, -3.420154, 1, 1, 1, 1, 1,
-0.1465481, 0.1777017, -0.9028812, 1, 1, 1, 1, 1,
-0.1455227, -0.06557188, -3.026754, 1, 1, 1, 1, 1,
-0.1417528, -1.317331, -3.124376, 1, 1, 1, 1, 1,
-0.1381607, 1.173443, -0.3076297, 1, 1, 1, 1, 1,
-0.1344476, 0.06133215, -1.124918, 1, 1, 1, 1, 1,
-0.1310624, -0.1584298, -2.937245, 1, 1, 1, 1, 1,
-0.1309667, 0.2989202, -0.9906276, 1, 1, 1, 1, 1,
-0.1307015, -0.3528506, -2.683048, 1, 1, 1, 1, 1,
-0.130278, 0.1607423, 0.04162057, 1, 1, 1, 1, 1,
-0.1214688, 0.06023206, -1.757518, 1, 1, 1, 1, 1,
-0.1116233, 0.4258891, -1.296905, 1, 1, 1, 1, 1,
-0.1108023, -1.316011, -3.739806, 1, 1, 1, 1, 1,
-0.1084147, 0.5234982, 0.4559287, 1, 1, 1, 1, 1,
-0.1054648, -0.7773291, -3.530859, 1, 1, 1, 1, 1,
-0.104975, -1.273058, -0.6518208, 0, 0, 1, 1, 1,
-0.1036384, 0.02763162, 0.3714349, 1, 0, 0, 1, 1,
-0.1032058, -0.4673659, -1.425527, 1, 0, 0, 1, 1,
-0.1012634, -0.2996399, -2.545662, 1, 0, 0, 1, 1,
-0.09056152, 1.23151, -0.7844354, 1, 0, 0, 1, 1,
-0.0895333, 1.571845, 0.114514, 1, 0, 0, 1, 1,
-0.08827375, -1.212989, -2.813402, 0, 0, 0, 1, 1,
-0.08736496, -0.5172912, -2.277735, 0, 0, 0, 1, 1,
-0.08671534, -0.584582, -3.668679, 0, 0, 0, 1, 1,
-0.08567341, -0.8866826, -4.758745, 0, 0, 0, 1, 1,
-0.0835246, -0.4792637, -2.59389, 0, 0, 0, 1, 1,
-0.08271357, 0.03462593, -3.133628, 0, 0, 0, 1, 1,
-0.08094484, -0.3939019, -3.247502, 0, 0, 0, 1, 1,
-0.07750254, 0.09876157, -1.348371, 1, 1, 1, 1, 1,
-0.07559647, -0.006824712, -0.8926743, 1, 1, 1, 1, 1,
-0.07342641, 0.6136186, 0.2390468, 1, 1, 1, 1, 1,
-0.06891759, 1.103075, -0.3098685, 1, 1, 1, 1, 1,
-0.06879041, -1.765913, -3.603053, 1, 1, 1, 1, 1,
-0.06659093, -0.8004476, -2.326719, 1, 1, 1, 1, 1,
-0.06343797, -1.529789, -4.483946, 1, 1, 1, 1, 1,
-0.06190478, 0.3465709, 0.04291241, 1, 1, 1, 1, 1,
-0.05939006, 1.155145, -0.113565, 1, 1, 1, 1, 1,
-0.05892262, 0.8351726, -1.688815, 1, 1, 1, 1, 1,
-0.05872082, 0.4710132, -2.025951, 1, 1, 1, 1, 1,
-0.05645871, -0.4880027, -3.477761, 1, 1, 1, 1, 1,
-0.05017878, 0.455462, -1.2504, 1, 1, 1, 1, 1,
-0.04913267, -0.1500631, -2.450699, 1, 1, 1, 1, 1,
-0.04631987, 0.7269616, -0.5950443, 1, 1, 1, 1, 1,
-0.04457479, -1.360666, -2.579205, 0, 0, 1, 1, 1,
-0.04351548, 0.06048872, 0.6260695, 1, 0, 0, 1, 1,
-0.03921263, -0.04071101, -2.335066, 1, 0, 0, 1, 1,
-0.03863132, -0.3604541, -3.985144, 1, 0, 0, 1, 1,
-0.03692921, -1.503902, -2.747394, 1, 0, 0, 1, 1,
-0.02492112, 0.7647182, 0.3017224, 1, 0, 0, 1, 1,
-0.01169203, -0.4053091, -2.929497, 0, 0, 0, 1, 1,
0.001704493, 0.3336336, -0.4009948, 0, 0, 0, 1, 1,
0.004091799, -2.678179, 2.266469, 0, 0, 0, 1, 1,
0.005656415, -0.408999, 4.430748, 0, 0, 0, 1, 1,
0.005767616, 0.4865728, -0.4886872, 0, 0, 0, 1, 1,
0.007325109, 0.1232155, 2.08208, 0, 0, 0, 1, 1,
0.009995847, -1.495283, 2.835241, 0, 0, 0, 1, 1,
0.01279376, 0.3620038, -0.08307126, 1, 1, 1, 1, 1,
0.01372327, -0.1320001, 5.533605, 1, 1, 1, 1, 1,
0.01893616, 0.8490748, 0.5833347, 1, 1, 1, 1, 1,
0.02226299, 0.887344, -1.555265, 1, 1, 1, 1, 1,
0.02245946, 0.2263683, -0.005624481, 1, 1, 1, 1, 1,
0.02435852, -1.102769, 3.84446, 1, 1, 1, 1, 1,
0.02461035, 0.5007302, 0.3900384, 1, 1, 1, 1, 1,
0.02772433, 1.726663, 0.8597413, 1, 1, 1, 1, 1,
0.02957167, 0.66001, -1.368418, 1, 1, 1, 1, 1,
0.03254739, 0.3994643, 0.3189723, 1, 1, 1, 1, 1,
0.03335059, 1.303578, -1.236511, 1, 1, 1, 1, 1,
0.03445997, -0.1933417, 3.84838, 1, 1, 1, 1, 1,
0.0356517, -1.0309, 3.241836, 1, 1, 1, 1, 1,
0.0387354, -0.09587321, 2.829532, 1, 1, 1, 1, 1,
0.03895685, 0.2133346, 1.876181, 1, 1, 1, 1, 1,
0.04163405, 0.1557023, 1.75874, 0, 0, 1, 1, 1,
0.04214794, 1.128011, -0.6704876, 1, 0, 0, 1, 1,
0.04251504, -1.026838, 2.987349, 1, 0, 0, 1, 1,
0.04322509, 3.241179, 1.802319, 1, 0, 0, 1, 1,
0.04354867, -2.055064, 2.696642, 1, 0, 0, 1, 1,
0.04716268, -1.790639, 3.742556, 1, 0, 0, 1, 1,
0.04926362, 0.8455344, -0.3918356, 0, 0, 0, 1, 1,
0.0496552, -0.1820867, 1.262527, 0, 0, 0, 1, 1,
0.04979267, -1.460296, 3.8936, 0, 0, 0, 1, 1,
0.05287618, -1.531789, 2.794479, 0, 0, 0, 1, 1,
0.05802682, -0.3454125, 3.502107, 0, 0, 0, 1, 1,
0.06289291, -0.4696697, 3.088644, 0, 0, 0, 1, 1,
0.06468512, -0.1988389, 3.239956, 0, 0, 0, 1, 1,
0.06531756, -0.4807125, 2.389198, 1, 1, 1, 1, 1,
0.06586985, -0.7452843, 4.491872, 1, 1, 1, 1, 1,
0.06645595, -0.09611662, 1.757923, 1, 1, 1, 1, 1,
0.07008116, 0.3853217, -0.5062906, 1, 1, 1, 1, 1,
0.07237723, 0.9433243, 1.949648, 1, 1, 1, 1, 1,
0.07429089, -1.195646, 2.562168, 1, 1, 1, 1, 1,
0.07747002, 0.1080645, 1.294131, 1, 1, 1, 1, 1,
0.07922824, 0.4267219, 0.182635, 1, 1, 1, 1, 1,
0.08008038, 0.7352291, 1.642313, 1, 1, 1, 1, 1,
0.08046928, -0.8769872, 3.988814, 1, 1, 1, 1, 1,
0.08687083, -0.9700936, 3.354811, 1, 1, 1, 1, 1,
0.08903631, 2.349263, -0.7501634, 1, 1, 1, 1, 1,
0.0920056, -0.4195879, 1.783, 1, 1, 1, 1, 1,
0.0925786, -1.297023, 3.026332, 1, 1, 1, 1, 1,
0.09397632, -0.2066382, 1.738825, 1, 1, 1, 1, 1,
0.09688377, -0.3307253, 2.894706, 0, 0, 1, 1, 1,
0.1006397, 0.2536261, -1.122667, 1, 0, 0, 1, 1,
0.1012917, -0.5266129, 3.430583, 1, 0, 0, 1, 1,
0.1037782, -1.134048, 2.541734, 1, 0, 0, 1, 1,
0.1080438, -0.1333161, 2.898791, 1, 0, 0, 1, 1,
0.1087926, 2.051116, -1.149737, 1, 0, 0, 1, 1,
0.1120718, 0.1824244, 0.1506062, 0, 0, 0, 1, 1,
0.1135871, -0.5450945, 2.847081, 0, 0, 0, 1, 1,
0.1143118, -0.172325, 1.670339, 0, 0, 0, 1, 1,
0.1162727, 0.6259809, 0.9477593, 0, 0, 0, 1, 1,
0.1218627, -1.4074, 4.14489, 0, 0, 0, 1, 1,
0.1230623, 0.139651, -1.084985, 0, 0, 0, 1, 1,
0.1250063, -0.939397, 2.276479, 0, 0, 0, 1, 1,
0.125833, 0.2105216, 0.4982836, 1, 1, 1, 1, 1,
0.1283718, -0.8546507, 2.55003, 1, 1, 1, 1, 1,
0.1352449, -1.167408, 2.894392, 1, 1, 1, 1, 1,
0.1432485, 0.2508386, 0.9074849, 1, 1, 1, 1, 1,
0.1459017, -1.63828, 3.927477, 1, 1, 1, 1, 1,
0.1467216, -0.03358226, 2.421383, 1, 1, 1, 1, 1,
0.1469435, -1.503071, 2.847424, 1, 1, 1, 1, 1,
0.1477007, -0.3720816, 1.631434, 1, 1, 1, 1, 1,
0.1481354, 0.4087737, -0.8902524, 1, 1, 1, 1, 1,
0.1502531, -0.8844221, 2.941665, 1, 1, 1, 1, 1,
0.1510435, 0.4964482, 0.214948, 1, 1, 1, 1, 1,
0.1538266, -1.276963, 3.533384, 1, 1, 1, 1, 1,
0.1572847, -1.70255, 2.713365, 1, 1, 1, 1, 1,
0.1589423, -1.278265, 1.369719, 1, 1, 1, 1, 1,
0.1708423, -0.4701124, 2.493125, 1, 1, 1, 1, 1,
0.1731388, 0.8830682, -0.8257028, 0, 0, 1, 1, 1,
0.1731703, -0.05305715, 1.208322, 1, 0, 0, 1, 1,
0.1746938, -1.623953, 3.078129, 1, 0, 0, 1, 1,
0.1786918, -0.8971286, 1.367855, 1, 0, 0, 1, 1,
0.178939, 0.2578639, -0.3742224, 1, 0, 0, 1, 1,
0.1816223, -0.2209522, 2.394082, 1, 0, 0, 1, 1,
0.1816362, -1.605025, 2.18521, 0, 0, 0, 1, 1,
0.1833027, -0.5328225, 3.694443, 0, 0, 0, 1, 1,
0.184611, -1.469212, 3.858965, 0, 0, 0, 1, 1,
0.1887014, 0.4649482, -0.03211135, 0, 0, 0, 1, 1,
0.1917998, -0.06480473, 2.192997, 0, 0, 0, 1, 1,
0.1929405, -0.8466865, 2.68107, 0, 0, 0, 1, 1,
0.1957666, 0.9546935, 1.194799, 0, 0, 0, 1, 1,
0.1963225, -1.646056, 2.309999, 1, 1, 1, 1, 1,
0.2003376, 1.450169, -0.4232303, 1, 1, 1, 1, 1,
0.2011687, 0.1050407, 1.487531, 1, 1, 1, 1, 1,
0.2087357, -0.3762487, 3.827709, 1, 1, 1, 1, 1,
0.2154858, -1.675277, 2.051493, 1, 1, 1, 1, 1,
0.2272314, 0.5378847, 1.885103, 1, 1, 1, 1, 1,
0.2293941, 0.8975324, -0.3980686, 1, 1, 1, 1, 1,
0.230148, 1.544368, 1.466384, 1, 1, 1, 1, 1,
0.235023, 1.222642, 1.332032, 1, 1, 1, 1, 1,
0.2360044, -0.110926, 3.958227, 1, 1, 1, 1, 1,
0.2394001, 0.443898, 0.8867538, 1, 1, 1, 1, 1,
0.2431675, -0.8035703, 2.725339, 1, 1, 1, 1, 1,
0.2467784, 0.3018443, 0.4591661, 1, 1, 1, 1, 1,
0.248523, -0.4501175, 1.969555, 1, 1, 1, 1, 1,
0.2489028, 0.1105133, 1.590727, 1, 1, 1, 1, 1,
0.2520711, -1.879188, 3.576043, 0, 0, 1, 1, 1,
0.2523087, -0.7822851, 2.844305, 1, 0, 0, 1, 1,
0.2528024, 2.213797, -1.320439, 1, 0, 0, 1, 1,
0.2529821, 0.2734258, 1.327874, 1, 0, 0, 1, 1,
0.2545031, 0.3298123, 1.000745, 1, 0, 0, 1, 1,
0.2610939, -1.615138, 3.206162, 1, 0, 0, 1, 1,
0.2634137, 1.841074, -0.2655264, 0, 0, 0, 1, 1,
0.2637584, 0.7598054, -0.08078647, 0, 0, 0, 1, 1,
0.2638656, 1.328754, 0.292136, 0, 0, 0, 1, 1,
0.2644254, 0.08419341, 1.026467, 0, 0, 0, 1, 1,
0.2644587, -1.626706, 2.91174, 0, 0, 0, 1, 1,
0.2659274, -0.1899325, 2.187325, 0, 0, 0, 1, 1,
0.26806, -0.3248834, 3.162449, 0, 0, 0, 1, 1,
0.2761665, 1.187641, 0.391966, 1, 1, 1, 1, 1,
0.2777439, -0.2723842, 3.232205, 1, 1, 1, 1, 1,
0.279371, -1.558064, 1.542922, 1, 1, 1, 1, 1,
0.2872018, -0.4045251, 3.788491, 1, 1, 1, 1, 1,
0.2920921, 0.9753318, -1.085985, 1, 1, 1, 1, 1,
0.2943838, -0.4284074, 2.243362, 1, 1, 1, 1, 1,
0.2959285, -0.08558349, 2.748069, 1, 1, 1, 1, 1,
0.2970866, 1.052364, -1.438225, 1, 1, 1, 1, 1,
0.2991504, 0.9414824, -1.009103, 1, 1, 1, 1, 1,
0.3053351, -0.3192413, 3.519186, 1, 1, 1, 1, 1,
0.3068961, -2.200474, 2.122334, 1, 1, 1, 1, 1,
0.3094683, -0.003265314, 2.699513, 1, 1, 1, 1, 1,
0.3097517, 1.355241, 0.4813589, 1, 1, 1, 1, 1,
0.3136844, 1.290248, -1.336347, 1, 1, 1, 1, 1,
0.3137529, -1.396873, 2.560624, 1, 1, 1, 1, 1,
0.3151984, 1.475852, -0.04811921, 0, 0, 1, 1, 1,
0.3216272, -0.4870655, 3.781294, 1, 0, 0, 1, 1,
0.3227297, 0.852949, -0.6233104, 1, 0, 0, 1, 1,
0.3279096, -1.342054, 3.464446, 1, 0, 0, 1, 1,
0.3281634, 0.4713138, 0.6638944, 1, 0, 0, 1, 1,
0.3315924, -2.10741, 1.601463, 1, 0, 0, 1, 1,
0.3316614, 0.2423634, 0.08886755, 0, 0, 0, 1, 1,
0.3316675, -0.3990561, 3.677516, 0, 0, 0, 1, 1,
0.3351236, -0.7248877, 3.736253, 0, 0, 0, 1, 1,
0.3381325, 0.5173295, -0.7495958, 0, 0, 0, 1, 1,
0.338819, 0.1182964, 1.968151, 0, 0, 0, 1, 1,
0.3433329, 1.114704, 0.2843637, 0, 0, 0, 1, 1,
0.3436174, 0.8100383, 0.694215, 0, 0, 0, 1, 1,
0.3458614, -0.6367208, 1.858593, 1, 1, 1, 1, 1,
0.348044, -0.2968557, 0.4334592, 1, 1, 1, 1, 1,
0.3564251, 0.3175585, -0.2492202, 1, 1, 1, 1, 1,
0.360225, -0.4711096, 1.577725, 1, 1, 1, 1, 1,
0.3613377, 0.2037576, 1.731081, 1, 1, 1, 1, 1,
0.3631035, -0.04009558, 1.232612, 1, 1, 1, 1, 1,
0.3649192, 0.8602459, 1.2617, 1, 1, 1, 1, 1,
0.3656917, -0.6046937, 1.939076, 1, 1, 1, 1, 1,
0.370519, 1.008318, -0.4020616, 1, 1, 1, 1, 1,
0.3729187, -0.8351721, 2.646389, 1, 1, 1, 1, 1,
0.3739313, 0.5859724, 0.8587112, 1, 1, 1, 1, 1,
0.3748012, 0.2904367, 0.6769095, 1, 1, 1, 1, 1,
0.376383, 0.8748497, 0.118736, 1, 1, 1, 1, 1,
0.3810959, -0.9331349, 3.510259, 1, 1, 1, 1, 1,
0.3840753, 0.6923834, -1.314265, 1, 1, 1, 1, 1,
0.384415, 0.7400084, -0.03385115, 0, 0, 1, 1, 1,
0.3851936, -0.1014458, 3.064793, 1, 0, 0, 1, 1,
0.3856763, -0.3724298, 1.359341, 1, 0, 0, 1, 1,
0.3877639, 1.19703, 2.140887, 1, 0, 0, 1, 1,
0.389517, -0.6878224, 2.192864, 1, 0, 0, 1, 1,
0.3902364, -1.02252, 3.083782, 1, 0, 0, 1, 1,
0.3907986, -1.594587, 2.595045, 0, 0, 0, 1, 1,
0.3910345, 0.1796842, 2.425664, 0, 0, 0, 1, 1,
0.3935722, -2.094988, 3.419535, 0, 0, 0, 1, 1,
0.3992614, -2.774992, 4.188427, 0, 0, 0, 1, 1,
0.4060819, -0.3082138, 4.191308, 0, 0, 0, 1, 1,
0.4068255, -1.565886, 3.538452, 0, 0, 0, 1, 1,
0.4117536, -0.7906114, 1.463201, 0, 0, 0, 1, 1,
0.4141641, -0.9493406, 2.041527, 1, 1, 1, 1, 1,
0.4154753, 0.5673412, 0.2773074, 1, 1, 1, 1, 1,
0.4170395, 0.431518, 1.350463, 1, 1, 1, 1, 1,
0.4210928, -0.4276256, 1.103872, 1, 1, 1, 1, 1,
0.4252929, 0.4411403, 0.6224028, 1, 1, 1, 1, 1,
0.4253846, 0.5594431, 1.154307, 1, 1, 1, 1, 1,
0.4309368, -0.08032966, 1.041198, 1, 1, 1, 1, 1,
0.4325224, 1.532078, -0.8846438, 1, 1, 1, 1, 1,
0.435524, -0.9479795, 1.938808, 1, 1, 1, 1, 1,
0.4355492, 0.2941912, 1.491987, 1, 1, 1, 1, 1,
0.4400929, -0.5426149, 1.606842, 1, 1, 1, 1, 1,
0.4420632, -0.1754176, 1.996564, 1, 1, 1, 1, 1,
0.4462427, -1.742066, 2.226599, 1, 1, 1, 1, 1,
0.4499994, -0.05131363, 2.099117, 1, 1, 1, 1, 1,
0.4507785, 0.4283809, -0.8867537, 1, 1, 1, 1, 1,
0.4550229, -0.8972216, 3.453616, 0, 0, 1, 1, 1,
0.4587833, -1.747856, 4.13307, 1, 0, 0, 1, 1,
0.4611691, 2.471974, 0.5766812, 1, 0, 0, 1, 1,
0.4657545, 1.066217, 0.3556702, 1, 0, 0, 1, 1,
0.4721329, 0.4640298, 2.449399, 1, 0, 0, 1, 1,
0.4754938, -0.02562814, 0.6875404, 1, 0, 0, 1, 1,
0.4802465, 0.5285042, -0.6966739, 0, 0, 0, 1, 1,
0.4829675, 0.03502171, 0.95573, 0, 0, 0, 1, 1,
0.4846992, -0.6969235, 3.202016, 0, 0, 0, 1, 1,
0.4848533, -0.8175456, 1.999209, 0, 0, 0, 1, 1,
0.485648, -0.4321271, 2.023412, 0, 0, 0, 1, 1,
0.4873425, 1.416675, -0.7217955, 0, 0, 0, 1, 1,
0.4920014, 0.207915, 2.357615, 0, 0, 0, 1, 1,
0.499658, 0.7982306, 0.5729085, 1, 1, 1, 1, 1,
0.5005129, 1.063862, -0.4985716, 1, 1, 1, 1, 1,
0.5059188, 0.4684739, 0.3846731, 1, 1, 1, 1, 1,
0.510196, 0.6523809, 1.069859, 1, 1, 1, 1, 1,
0.513294, -2.421796, 2.208775, 1, 1, 1, 1, 1,
0.5144733, -0.16888, 0.8727685, 1, 1, 1, 1, 1,
0.5169408, -0.6255516, 3.102168, 1, 1, 1, 1, 1,
0.5191013, -0.7275158, 3.426764, 1, 1, 1, 1, 1,
0.5255137, -1.435553, 2.018315, 1, 1, 1, 1, 1,
0.5258322, -0.7188556, 3.414729, 1, 1, 1, 1, 1,
0.5268672, -1.127795, 0.4377376, 1, 1, 1, 1, 1,
0.5325351, 1.297889, -0.3241856, 1, 1, 1, 1, 1,
0.5358687, 0.337495, -0.5027846, 1, 1, 1, 1, 1,
0.548345, -0.9930457, 1.767301, 1, 1, 1, 1, 1,
0.5576726, -0.1836445, 0.8995727, 1, 1, 1, 1, 1,
0.55796, 0.8404845, 0.3971971, 0, 0, 1, 1, 1,
0.5598277, 0.2423634, -0.03106058, 1, 0, 0, 1, 1,
0.56177, 0.9253222, 2.207245, 1, 0, 0, 1, 1,
0.5734231, 0.4202067, 0.350957, 1, 0, 0, 1, 1,
0.5814235, 0.2366004, 0.8331369, 1, 0, 0, 1, 1,
0.5846852, 0.2334019, 1.599343, 1, 0, 0, 1, 1,
0.5883136, 1.504005, -0.8777435, 0, 0, 0, 1, 1,
0.5885859, -1.942683, 2.979139, 0, 0, 0, 1, 1,
0.5893291, -0.3128803, 1.980533, 0, 0, 0, 1, 1,
0.5922487, -1.372906, 4.483259, 0, 0, 0, 1, 1,
0.5938218, 1.664873, 0.1105993, 0, 0, 0, 1, 1,
0.5977614, 0.6184686, 0.8100418, 0, 0, 0, 1, 1,
0.5992077, 0.6157066, 1.795462, 0, 0, 0, 1, 1,
0.6007276, -0.07370161, 1.721218, 1, 1, 1, 1, 1,
0.6038198, -0.1193025, 1.996474, 1, 1, 1, 1, 1,
0.6054838, -1.986448, 2.595869, 1, 1, 1, 1, 1,
0.610121, 1.584852, -0.6581742, 1, 1, 1, 1, 1,
0.6104463, 0.8045014, 1.397032, 1, 1, 1, 1, 1,
0.6152917, -1.246464, 1.858844, 1, 1, 1, 1, 1,
0.6238735, 1.913202, 2.102008, 1, 1, 1, 1, 1,
0.6242468, 0.9670817, -1.098194, 1, 1, 1, 1, 1,
0.6283103, -0.9978285, 3.514248, 1, 1, 1, 1, 1,
0.6337203, -0.7145739, 1.597705, 1, 1, 1, 1, 1,
0.638707, -1.130521, 3.411226, 1, 1, 1, 1, 1,
0.6387168, -0.4116969, 3.064628, 1, 1, 1, 1, 1,
0.6429123, -2.213923, 4.008429, 1, 1, 1, 1, 1,
0.6515601, 0.9303172, 0.8368472, 1, 1, 1, 1, 1,
0.6520097, 0.05467998, 2.796797, 1, 1, 1, 1, 1,
0.6542633, 0.6313122, 0.71179, 0, 0, 1, 1, 1,
0.6687783, 0.137897, 0.7198257, 1, 0, 0, 1, 1,
0.6694848, 0.8542498, 0.5517802, 1, 0, 0, 1, 1,
0.672294, 0.7896846, 1.32356, 1, 0, 0, 1, 1,
0.6818286, -0.5291905, 3.040703, 1, 0, 0, 1, 1,
0.6831369, 0.1009093, 1.642857, 1, 0, 0, 1, 1,
0.6868129, 0.1411185, 0.5581273, 0, 0, 0, 1, 1,
0.6900649, 0.8931104, 1.636741, 0, 0, 0, 1, 1,
0.6906391, -0.4247747, 3.492775, 0, 0, 0, 1, 1,
0.6910771, -1.697942, 4.230347, 0, 0, 0, 1, 1,
0.6986266, 0.3051867, 0.9264322, 0, 0, 0, 1, 1,
0.701562, 1.995483, 0.3955163, 0, 0, 0, 1, 1,
0.7021074, -0.1910963, 1.561085, 0, 0, 0, 1, 1,
0.7047391, 0.4319513, 2.05911, 1, 1, 1, 1, 1,
0.7057097, 1.107372, 1.40908, 1, 1, 1, 1, 1,
0.7062779, 1.081477, 2.746825, 1, 1, 1, 1, 1,
0.7073296, -0.1194227, 0.2198812, 1, 1, 1, 1, 1,
0.7136024, -1.606236, 4.799043, 1, 1, 1, 1, 1,
0.7138574, -0.2942025, 3.145412, 1, 1, 1, 1, 1,
0.7148252, -2.071171, 2.233682, 1, 1, 1, 1, 1,
0.7181762, 1.845334, -0.4050302, 1, 1, 1, 1, 1,
0.7186674, -1.629127, 4.080651, 1, 1, 1, 1, 1,
0.7224346, 0.4228711, 0.4569422, 1, 1, 1, 1, 1,
0.7259804, 1.095961, 0.6207962, 1, 1, 1, 1, 1,
0.7289227, 0.5836346, 0.9305648, 1, 1, 1, 1, 1,
0.7316651, -1.705387, 1.561357, 1, 1, 1, 1, 1,
0.7336899, 0.3120812, 0.1435663, 1, 1, 1, 1, 1,
0.7416455, -0.1398529, 2.043487, 1, 1, 1, 1, 1,
0.7505924, -1.628316, 2.464123, 0, 0, 1, 1, 1,
0.751062, -1.120129, 2.230237, 1, 0, 0, 1, 1,
0.7677628, 0.7884207, 0.9143157, 1, 0, 0, 1, 1,
0.7739869, 0.390606, 0.2942473, 1, 0, 0, 1, 1,
0.7742564, 0.5653216, 0.1125133, 1, 0, 0, 1, 1,
0.7751712, 0.8985565, 0.7130818, 1, 0, 0, 1, 1,
0.7773028, 0.5316092, 3.155229, 0, 0, 0, 1, 1,
0.7775949, 1.209648, 1.05496, 0, 0, 0, 1, 1,
0.7779837, 0.2763249, 0.9880415, 0, 0, 0, 1, 1,
0.7830109, 0.4176406, 0.1110858, 0, 0, 0, 1, 1,
0.8035932, -0.1409356, 1.396249, 0, 0, 0, 1, 1,
0.8044325, -2.398382, 2.297538, 0, 0, 0, 1, 1,
0.8064089, 0.9398559, 1.663831, 0, 0, 0, 1, 1,
0.8103327, 1.51118, -0.5906501, 1, 1, 1, 1, 1,
0.8125067, -0.5676088, 2.181767, 1, 1, 1, 1, 1,
0.8135823, 1.09217, 1.168176, 1, 1, 1, 1, 1,
0.8142415, -0.9038372, 1.488235, 1, 1, 1, 1, 1,
0.8303518, -0.3921315, 3.381445, 1, 1, 1, 1, 1,
0.8395289, -0.4668307, 2.134131, 1, 1, 1, 1, 1,
0.8479529, 0.7802039, 1.1111, 1, 1, 1, 1, 1,
0.8528108, 0.8780344, 0.4712149, 1, 1, 1, 1, 1,
0.8658208, -0.6327266, 1.159352, 1, 1, 1, 1, 1,
0.8698655, -0.1409538, 2.608855, 1, 1, 1, 1, 1,
0.8716187, -1.350188, 3.175804, 1, 1, 1, 1, 1,
0.876402, 0.5308852, -0.09537058, 1, 1, 1, 1, 1,
0.8773183, 2.501273, 1.02109, 1, 1, 1, 1, 1,
0.8782695, 0.8157012, 1.037755, 1, 1, 1, 1, 1,
0.8816149, 0.9757645, 0.05969867, 1, 1, 1, 1, 1,
0.8818577, 1.789242, 0.4965031, 0, 0, 1, 1, 1,
0.8828126, -2.200438, 1.111463, 1, 0, 0, 1, 1,
0.8857961, -0.2471265, 2.14495, 1, 0, 0, 1, 1,
0.8886035, -1.83569, 2.903159, 1, 0, 0, 1, 1,
0.8917415, -1.83811, 2.274759, 1, 0, 0, 1, 1,
0.892692, 0.09256334, 1.837073, 1, 0, 0, 1, 1,
0.894275, -0.5831423, 2.81784, 0, 0, 0, 1, 1,
0.8943904, 0.4986058, 1.995049, 0, 0, 0, 1, 1,
0.8950306, 0.3192769, -0.02153441, 0, 0, 0, 1, 1,
0.898325, 0.7935465, 0.2070322, 0, 0, 0, 1, 1,
0.8996823, 0.3704739, 1.663996, 0, 0, 0, 1, 1,
0.9093735, 0.0880857, 3.032319, 0, 0, 0, 1, 1,
0.9168581, 1.16277, 1.352446, 0, 0, 0, 1, 1,
0.9216046, 0.8741458, -0.2136275, 1, 1, 1, 1, 1,
0.9220369, 0.7699631, -0.1565552, 1, 1, 1, 1, 1,
0.9262098, 1.122417, 0.5636707, 1, 1, 1, 1, 1,
0.9268531, 0.03945156, 0.453502, 1, 1, 1, 1, 1,
0.9291706, -0.2061097, 1.909992, 1, 1, 1, 1, 1,
0.9371721, -0.05257845, 0.2946402, 1, 1, 1, 1, 1,
0.9426504, 0.1677525, 3.756033, 1, 1, 1, 1, 1,
0.944452, -1.337053, 2.534894, 1, 1, 1, 1, 1,
0.9446313, 1.331988, 0.8330736, 1, 1, 1, 1, 1,
0.9564281, -1.558788, 1.512519, 1, 1, 1, 1, 1,
0.9567344, 2.179042, 1.145346, 1, 1, 1, 1, 1,
0.9578229, -1.194803, 2.150477, 1, 1, 1, 1, 1,
0.9596479, 1.153716, 2.630731, 1, 1, 1, 1, 1,
0.963369, 0.3510252, -0.1646652, 1, 1, 1, 1, 1,
0.9640504, -0.7146975, 1.81365, 1, 1, 1, 1, 1,
0.9697136, -0.6177934, 4.019443, 0, 0, 1, 1, 1,
0.9717298, 0.8912872, 1.080145, 1, 0, 0, 1, 1,
0.9785468, 0.268053, 0.9783887, 1, 0, 0, 1, 1,
0.9829038, -0.9445131, 3.112259, 1, 0, 0, 1, 1,
0.9831265, -0.8279618, 3.468677, 1, 0, 0, 1, 1,
0.9922566, -0.619292, 4.465678, 1, 0, 0, 1, 1,
0.995847, -0.2478825, 2.795561, 0, 0, 0, 1, 1,
0.9984022, 0.06425481, 2.149243, 0, 0, 0, 1, 1,
0.9990121, 0.313873, 0.9980437, 0, 0, 0, 1, 1,
1.007995, -1.434848, 3.897658, 0, 0, 0, 1, 1,
1.019276, 0.4922716, -1.292656, 0, 0, 0, 1, 1,
1.021115, 0.7499506, 1.320387, 0, 0, 0, 1, 1,
1.033088, 1.791428, 1.22344, 0, 0, 0, 1, 1,
1.034459, 0.9862474, 0.6465548, 1, 1, 1, 1, 1,
1.040812, 0.02565075, 0.5801658, 1, 1, 1, 1, 1,
1.045628, -1.135195, 2.061558, 1, 1, 1, 1, 1,
1.049658, 2.449224, 0.7455432, 1, 1, 1, 1, 1,
1.057259, -0.5814311, 1.722555, 1, 1, 1, 1, 1,
1.061657, 1.096065, 1.368322, 1, 1, 1, 1, 1,
1.061948, -0.2795255, 1.620366, 1, 1, 1, 1, 1,
1.063071, -1.401646, 3.495929, 1, 1, 1, 1, 1,
1.063226, -2.608353, 1.891741, 1, 1, 1, 1, 1,
1.064466, 0.3226045, 1.126519, 1, 1, 1, 1, 1,
1.067729, -0.7651033, 1.343495, 1, 1, 1, 1, 1,
1.077994, -0.3967096, 0.9428191, 1, 1, 1, 1, 1,
1.078891, 0.4131335, 1.60092, 1, 1, 1, 1, 1,
1.085163, -1.303764, 3.001228, 1, 1, 1, 1, 1,
1.087137, 0.767877, 1.944579, 1, 1, 1, 1, 1,
1.087156, -0.8961416, 0.1913786, 0, 0, 1, 1, 1,
1.088552, 1.260576, 2.711121, 1, 0, 0, 1, 1,
1.089614, 0.8062809, 0.7628987, 1, 0, 0, 1, 1,
1.091594, 2.641947, -0.07282519, 1, 0, 0, 1, 1,
1.092529, -0.2421592, 1.773663, 1, 0, 0, 1, 1,
1.098328, 2.65521, -0.5122584, 1, 0, 0, 1, 1,
1.108027, -0.05365896, 0.4185793, 0, 0, 0, 1, 1,
1.111697, 0.09521023, 2.311385, 0, 0, 0, 1, 1,
1.136102, 1.841504, 0.356539, 0, 0, 0, 1, 1,
1.140476, -0.2167425, 2.205075, 0, 0, 0, 1, 1,
1.14869, -1.048696, 0.7420093, 0, 0, 0, 1, 1,
1.149878, 1.478756, -0.6519652, 0, 0, 0, 1, 1,
1.152545, -0.6453724, 1.700452, 0, 0, 0, 1, 1,
1.158898, -0.2451608, 1.009796, 1, 1, 1, 1, 1,
1.175853, 0.9314193, 2.944275, 1, 1, 1, 1, 1,
1.176399, -0.44459, 2.103777, 1, 1, 1, 1, 1,
1.186676, -0.5641261, 1.130219, 1, 1, 1, 1, 1,
1.188407, 1.100026, 0.8015962, 1, 1, 1, 1, 1,
1.189968, 0.4214441, 1.789051, 1, 1, 1, 1, 1,
1.197564, 0.7060307, 0.6014972, 1, 1, 1, 1, 1,
1.204201, -1.01528, 1.05828, 1, 1, 1, 1, 1,
1.21001, -2.57504, 3.800773, 1, 1, 1, 1, 1,
1.211252, -0.2603207, 2.99695, 1, 1, 1, 1, 1,
1.21758, 1.200478, 0.525776, 1, 1, 1, 1, 1,
1.224175, -0.138494, 1.710181, 1, 1, 1, 1, 1,
1.224445, 0.1919015, 0.740284, 1, 1, 1, 1, 1,
1.234841, 2.096126, 1.535933, 1, 1, 1, 1, 1,
1.236735, -0.9801623, 2.07646, 1, 1, 1, 1, 1,
1.250816, -2.118872, 3.31422, 0, 0, 1, 1, 1,
1.255003, -1.752682, 3.667064, 1, 0, 0, 1, 1,
1.257341, -1.724174, 3.157722, 1, 0, 0, 1, 1,
1.261348, 1.057681, 1.14102, 1, 0, 0, 1, 1,
1.262742, -0.2737267, 1.872852, 1, 0, 0, 1, 1,
1.263374, 0.607211, 0.8624988, 1, 0, 0, 1, 1,
1.270129, 0.4782005, 1.882155, 0, 0, 0, 1, 1,
1.275725, 0.1733769, 1.34981, 0, 0, 0, 1, 1,
1.277141, -0.1807033, 1.955809, 0, 0, 0, 1, 1,
1.2844, 1.606983, -0.7516841, 0, 0, 0, 1, 1,
1.286499, -1.148738, 0.4901437, 0, 0, 0, 1, 1,
1.292275, 1.794667, 0.6049406, 0, 0, 0, 1, 1,
1.316331, -0.9317289, 4.170227, 0, 0, 0, 1, 1,
1.320237, -2.137334, 2.337271, 1, 1, 1, 1, 1,
1.328382, 0.2352505, 1.980386, 1, 1, 1, 1, 1,
1.332209, -1.051274, 0.6921566, 1, 1, 1, 1, 1,
1.342654, 0.5758739, 2.672395, 1, 1, 1, 1, 1,
1.348139, -0.4522333, 2.191669, 1, 1, 1, 1, 1,
1.351519, 0.3598306, 0.5651352, 1, 1, 1, 1, 1,
1.352052, 1.52663, 1.887345, 1, 1, 1, 1, 1,
1.364816, -0.2695353, 0.8771735, 1, 1, 1, 1, 1,
1.368111, 1.74118, 0.1388021, 1, 1, 1, 1, 1,
1.369883, -0.001977317, 1.691472, 1, 1, 1, 1, 1,
1.375078, 0.810982, -0.1902091, 1, 1, 1, 1, 1,
1.388021, -0.4479524, 2.580358, 1, 1, 1, 1, 1,
1.388257, 1.843471, 0.05015826, 1, 1, 1, 1, 1,
1.394874, -1.4173, 0.5911623, 1, 1, 1, 1, 1,
1.394993, 1.464424, 0.2231102, 1, 1, 1, 1, 1,
1.397198, 0.6306959, 1.130399, 0, 0, 1, 1, 1,
1.398074, -0.0776697, 2.775425, 1, 0, 0, 1, 1,
1.403765, 0.0438905, 1.327628, 1, 0, 0, 1, 1,
1.408435, -0.8095411, 2.576962, 1, 0, 0, 1, 1,
1.409931, 0.7771181, -0.02924789, 1, 0, 0, 1, 1,
1.41389, -1.13142, 2.925165, 1, 0, 0, 1, 1,
1.416648, 1.041108, -0.3323953, 0, 0, 0, 1, 1,
1.42877, -0.3827768, 3.30777, 0, 0, 0, 1, 1,
1.429099, -0.01900987, 1.573678, 0, 0, 0, 1, 1,
1.434555, 0.08967584, 0.2025148, 0, 0, 0, 1, 1,
1.442565, -0.6400841, 0.1417695, 0, 0, 0, 1, 1,
1.444872, 0.3018575, 0.3240347, 0, 0, 0, 1, 1,
1.44965, 1.567322, -0.09939879, 0, 0, 0, 1, 1,
1.465891, 1.229138, 2.744705, 1, 1, 1, 1, 1,
1.469255, 0.2439186, 1.27236, 1, 1, 1, 1, 1,
1.469599, -0.67379, 2.373909, 1, 1, 1, 1, 1,
1.471144, 0.3675906, -0.2831604, 1, 1, 1, 1, 1,
1.479745, -1.491628, 1.293176, 1, 1, 1, 1, 1,
1.487247, -1.229643, 1.200496, 1, 1, 1, 1, 1,
1.494442, 0.472966, 2.509961, 1, 1, 1, 1, 1,
1.519902, 1.138283, 0.7866616, 1, 1, 1, 1, 1,
1.521402, 0.479241, -0.913614, 1, 1, 1, 1, 1,
1.524391, 0.5942919, 1.339233, 1, 1, 1, 1, 1,
1.529352, 0.6363204, 0.9864774, 1, 1, 1, 1, 1,
1.563777, -0.3024601, 0.2888088, 1, 1, 1, 1, 1,
1.583366, -0.5253435, -0.2496014, 1, 1, 1, 1, 1,
1.586002, -1.488862, 1.093993, 1, 1, 1, 1, 1,
1.5978, -1.680565, 2.171956, 1, 1, 1, 1, 1,
1.59814, -1.139042, 2.044951, 0, 0, 1, 1, 1,
1.599753, -0.1170135, 2.954889, 1, 0, 0, 1, 1,
1.629496, 0.5651827, 2.267924, 1, 0, 0, 1, 1,
1.642968, 1.408885, 1.008087, 1, 0, 0, 1, 1,
1.646422, 0.8933744, 0.8459162, 1, 0, 0, 1, 1,
1.64792, -0.0288889, 1.368618, 1, 0, 0, 1, 1,
1.665038, -0.01464197, 1.224334, 0, 0, 0, 1, 1,
1.674227, 1.038099, 0.925128, 0, 0, 0, 1, 1,
1.687263, -0.3805235, 2.01418, 0, 0, 0, 1, 1,
1.711231, -0.04853477, 1.273899, 0, 0, 0, 1, 1,
1.740048, 0.6978299, -0.73678, 0, 0, 0, 1, 1,
1.76351, -1.005844, -0.1976015, 0, 0, 0, 1, 1,
1.767274, -0.5161539, 3.634322, 0, 0, 0, 1, 1,
1.769274, -0.07360273, 1.445799, 1, 1, 1, 1, 1,
1.79145, -1.222986, 0.6506099, 1, 1, 1, 1, 1,
1.800389, -0.5707391, 1.637466, 1, 1, 1, 1, 1,
1.818706, -0.4696908, 2.575824, 1, 1, 1, 1, 1,
1.83457, 1.433051, 0.08487934, 1, 1, 1, 1, 1,
1.838552, -0.4140272, 0.01131251, 1, 1, 1, 1, 1,
1.845637, -0.9293094, 2.663483, 1, 1, 1, 1, 1,
1.859376, -0.8810965, 1.725569, 1, 1, 1, 1, 1,
1.859538, -0.9593646, 0.1018046, 1, 1, 1, 1, 1,
1.871473, 0.6408472, -0.3088449, 1, 1, 1, 1, 1,
1.873311, 0.6849003, 0.6867139, 1, 1, 1, 1, 1,
1.882006, -0.961026, 1.378061, 1, 1, 1, 1, 1,
1.883753, 0.81769, -1.604237, 1, 1, 1, 1, 1,
1.900107, 0.2367803, 1.980106, 1, 1, 1, 1, 1,
1.911355, 1.635172, -0.02950593, 1, 1, 1, 1, 1,
1.942925, -0.6584641, 3.287509, 0, 0, 1, 1, 1,
1.948547, -1.491668, 0.9967757, 1, 0, 0, 1, 1,
1.990893, -0.005361126, 3.199429, 1, 0, 0, 1, 1,
2.005615, -0.8953767, 1.513683, 1, 0, 0, 1, 1,
2.011759, 0.7983625, 0.603569, 1, 0, 0, 1, 1,
2.051402, 0.4379641, 1.501512, 1, 0, 0, 1, 1,
2.10008, 1.787716, 0.09378202, 0, 0, 0, 1, 1,
2.154262, 0.4376662, 2.952748, 0, 0, 0, 1, 1,
2.272952, -1.457106, 1.969543, 0, 0, 0, 1, 1,
2.291018, -0.7767448, 1.0353, 0, 0, 0, 1, 1,
2.430298, 2.326882, 0.7420111, 0, 0, 0, 1, 1,
2.437897, 0.9512433, 1.02886, 0, 0, 0, 1, 1,
2.450643, 0.5715296, -0.8628743, 0, 0, 0, 1, 1,
2.48492, -0.02069617, 1.872168, 1, 1, 1, 1, 1,
2.527357, -0.1828368, 1.152879, 1, 1, 1, 1, 1,
2.553738, -0.620558, 3.670325, 1, 1, 1, 1, 1,
2.776246, 1.557709, 1.815573, 1, 1, 1, 1, 1,
2.820839, 0.876426, 0.943266, 1, 1, 1, 1, 1,
2.982213, 0.7897391, 1.773814, 1, 1, 1, 1, 1,
3.080269, -1.806227, 3.179988, 1, 1, 1, 1, 1
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
var radius = 9.386608;
var distance = 32.97006;
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
mvMatrix.translate( 0.08130145, -0.3731129, -0.3874302 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.97006);
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
