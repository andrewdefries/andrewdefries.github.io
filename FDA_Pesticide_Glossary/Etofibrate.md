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
-4.482741, 1.474303, -0.008167314, 1, 0, 0, 1,
-3.708186, -0.02048811, -2.218686, 1, 0.007843138, 0, 1,
-2.656016, -0.2511949, -2.456069, 1, 0.01176471, 0, 1,
-2.624306, 2.197155, -0.3275602, 1, 0.01960784, 0, 1,
-2.612575, -0.178086, -3.089551, 1, 0.02352941, 0, 1,
-2.608671, -0.4035079, -0.826565, 1, 0.03137255, 0, 1,
-2.488138, 1.648091, -1.76851, 1, 0.03529412, 0, 1,
-2.467449, 0.5946061, -2.476364, 1, 0.04313726, 0, 1,
-2.295683, 0.2785146, -2.604185, 1, 0.04705882, 0, 1,
-2.270583, 0.06338768, -2.307199, 1, 0.05490196, 0, 1,
-2.263904, 0.9008963, 0.3346, 1, 0.05882353, 0, 1,
-2.253396, 0.1187474, -2.311564, 1, 0.06666667, 0, 1,
-2.177971, -0.772372, -2.188238, 1, 0.07058824, 0, 1,
-2.171133, -1.007726, -1.130129, 1, 0.07843138, 0, 1,
-2.132683, -0.840832, -3.457884, 1, 0.08235294, 0, 1,
-2.11147, 0.3934614, -3.945135, 1, 0.09019608, 0, 1,
-2.109612, 2.659987, 0.5598326, 1, 0.09411765, 0, 1,
-2.093806, -0.6988881, -2.101908, 1, 0.1019608, 0, 1,
-2.092563, -0.3799663, -0.4078507, 1, 0.1098039, 0, 1,
-2.049405, 0.7473643, -0.4105849, 1, 0.1137255, 0, 1,
-2.046991, 0.5013641, -3.400588, 1, 0.1215686, 0, 1,
-2.043022, 1.438333, -0.7408707, 1, 0.1254902, 0, 1,
-2.035799, -1.254097, -0.1647264, 1, 0.1333333, 0, 1,
-2.019098, 0.3098068, -1.928161, 1, 0.1372549, 0, 1,
-2.007175, 1.066182, -1.029877, 1, 0.145098, 0, 1,
-2.006241, -1.786234, -1.066655, 1, 0.1490196, 0, 1,
-1.997178, 1.079291, -0.3195515, 1, 0.1568628, 0, 1,
-1.974549, -0.616917, -3.190617, 1, 0.1607843, 0, 1,
-1.963957, -0.02076314, -2.532026, 1, 0.1686275, 0, 1,
-1.961725, 1.507387, -2.796229, 1, 0.172549, 0, 1,
-1.960778, -0.6052752, -1.384974, 1, 0.1803922, 0, 1,
-1.957555, -0.3637626, -2.018471, 1, 0.1843137, 0, 1,
-1.932211, 0.2425274, -2.990174, 1, 0.1921569, 0, 1,
-1.926242, 1.083591, -2.844879, 1, 0.1960784, 0, 1,
-1.923227, -0.07442463, -1.841379, 1, 0.2039216, 0, 1,
-1.91795, 0.1538458, -3.509042, 1, 0.2117647, 0, 1,
-1.879996, 0.002842273, -1.560559, 1, 0.2156863, 0, 1,
-1.840753, 0.6823857, -2.279678, 1, 0.2235294, 0, 1,
-1.826952, 0.07398516, -1.733115, 1, 0.227451, 0, 1,
-1.803527, 1.181104, -0.2094294, 1, 0.2352941, 0, 1,
-1.797675, -0.4868038, -1.028556, 1, 0.2392157, 0, 1,
-1.78994, -0.33428, -1.659978, 1, 0.2470588, 0, 1,
-1.755144, 0.5662397, -1.477256, 1, 0.2509804, 0, 1,
-1.741246, -0.1603377, -1.576083, 1, 0.2588235, 0, 1,
-1.739995, 0.942851, -1.135987, 1, 0.2627451, 0, 1,
-1.732462, 1.392287, -2.092887, 1, 0.2705882, 0, 1,
-1.716988, -0.9309868, -1.108982, 1, 0.2745098, 0, 1,
-1.713725, -0.392059, -0.3626742, 1, 0.282353, 0, 1,
-1.703202, -0.09738303, -2.008794, 1, 0.2862745, 0, 1,
-1.701014, -1.66852, -1.50895, 1, 0.2941177, 0, 1,
-1.69805, -0.8587497, -2.468908, 1, 0.3019608, 0, 1,
-1.688565, 0.3128398, -1.249732, 1, 0.3058824, 0, 1,
-1.683751, 0.4558923, -0.4717716, 1, 0.3137255, 0, 1,
-1.649642, -0.9659584, -3.601577, 1, 0.3176471, 0, 1,
-1.6225, 0.7820675, -1.286429, 1, 0.3254902, 0, 1,
-1.620093, -0.9399396, -1.04688, 1, 0.3294118, 0, 1,
-1.619446, -0.2977832, -1.412677, 1, 0.3372549, 0, 1,
-1.59864, 1.649936, -1.144083, 1, 0.3411765, 0, 1,
-1.590549, -0.01121576, 0.1464868, 1, 0.3490196, 0, 1,
-1.570983, -0.07904547, -3.431177, 1, 0.3529412, 0, 1,
-1.561355, 0.02031151, -1.805743, 1, 0.3607843, 0, 1,
-1.553312, -0.2345753, -1.635734, 1, 0.3647059, 0, 1,
-1.552369, -0.3365022, -3.89341, 1, 0.372549, 0, 1,
-1.548372, 1.113194, -0.2618588, 1, 0.3764706, 0, 1,
-1.545884, 1.567698, -3.588551, 1, 0.3843137, 0, 1,
-1.539456, -1.967091, -2.189507, 1, 0.3882353, 0, 1,
-1.537883, -1.162552, -0.6420121, 1, 0.3960784, 0, 1,
-1.537719, -1.774625, -2.563473, 1, 0.4039216, 0, 1,
-1.525386, 0.4556906, -2.950194, 1, 0.4078431, 0, 1,
-1.520405, -0.3829111, -0.4980259, 1, 0.4156863, 0, 1,
-1.516901, 0.7426533, -3.7083, 1, 0.4196078, 0, 1,
-1.513473, -0.9094612, -1.28064, 1, 0.427451, 0, 1,
-1.51199, -1.405547, -1.665982, 1, 0.4313726, 0, 1,
-1.510119, 0.3400841, -2.254401, 1, 0.4392157, 0, 1,
-1.500208, -0.1275904, -1.737437, 1, 0.4431373, 0, 1,
-1.485433, 1.261258, -0.3294515, 1, 0.4509804, 0, 1,
-1.480944, 0.6274344, -2.107902, 1, 0.454902, 0, 1,
-1.480928, 0.9906328, -1.601547, 1, 0.4627451, 0, 1,
-1.479142, -0.9007034, -1.021975, 1, 0.4666667, 0, 1,
-1.476584, -0.5955995, -1.058534, 1, 0.4745098, 0, 1,
-1.470739, -0.2124545, -1.73136, 1, 0.4784314, 0, 1,
-1.469587, -0.3510896, 0.06339502, 1, 0.4862745, 0, 1,
-1.462128, -0.09910934, -1.658425, 1, 0.4901961, 0, 1,
-1.46028, -0.2856316, -1.097375, 1, 0.4980392, 0, 1,
-1.455522, 0.5377185, 1.263772, 1, 0.5058824, 0, 1,
-1.441548, -0.8444224, -1.758496, 1, 0.509804, 0, 1,
-1.437871, 0.6124046, -2.027153, 1, 0.5176471, 0, 1,
-1.407052, 1.942479, -0.008893781, 1, 0.5215687, 0, 1,
-1.406514, -1.296541, -1.624916, 1, 0.5294118, 0, 1,
-1.394573, 1.778804, -0.1641348, 1, 0.5333334, 0, 1,
-1.392421, -0.1498201, -1.578424, 1, 0.5411765, 0, 1,
-1.387655, -0.7568006, -0.8117543, 1, 0.5450981, 0, 1,
-1.367785, -0.8102729, -3.244513, 1, 0.5529412, 0, 1,
-1.36715, -2.523151, -5.415856, 1, 0.5568628, 0, 1,
-1.365303, -0.8998442, -1.08854, 1, 0.5647059, 0, 1,
-1.36114, -0.3399263, -1.340438, 1, 0.5686275, 0, 1,
-1.352198, 0.3939804, -0.2076247, 1, 0.5764706, 0, 1,
-1.344683, -1.397257, -3.952312, 1, 0.5803922, 0, 1,
-1.338068, -0.1049887, -3.096591, 1, 0.5882353, 0, 1,
-1.333613, 0.881542, -2.382644, 1, 0.5921569, 0, 1,
-1.332353, 0.4861311, -2.053566, 1, 0.6, 0, 1,
-1.32651, -0.5721857, -1.759963, 1, 0.6078432, 0, 1,
-1.317954, 0.2512338, -0.9618597, 1, 0.6117647, 0, 1,
-1.310138, 0.8883243, -3.070061, 1, 0.6196079, 0, 1,
-1.303961, -0.2888841, -0.7251708, 1, 0.6235294, 0, 1,
-1.302521, 0.06170722, -2.49046, 1, 0.6313726, 0, 1,
-1.300128, -1.102361, -0.782328, 1, 0.6352941, 0, 1,
-1.28399, -1.439657, -3.850684, 1, 0.6431373, 0, 1,
-1.279443, -0.04020132, -2.262034, 1, 0.6470588, 0, 1,
-1.278075, 0.6609133, -1.565769, 1, 0.654902, 0, 1,
-1.277501, 0.8237249, -0.5148235, 1, 0.6588235, 0, 1,
-1.269682, 0.4095372, -1.601538, 1, 0.6666667, 0, 1,
-1.25536, 1.210891, -2.705209, 1, 0.6705883, 0, 1,
-1.248342, 0.1822146, -1.981478, 1, 0.6784314, 0, 1,
-1.247944, -0.1641255, 0.2137849, 1, 0.682353, 0, 1,
-1.237164, -0.4283589, -2.896868, 1, 0.6901961, 0, 1,
-1.236952, 2.05182, -1.02891, 1, 0.6941177, 0, 1,
-1.234945, -0.5090029, -2.368624, 1, 0.7019608, 0, 1,
-1.230173, -2.455962, -2.133127, 1, 0.7098039, 0, 1,
-1.22926, -0.2386239, -2.200713, 1, 0.7137255, 0, 1,
-1.225947, -0.5079897, -2.031156, 1, 0.7215686, 0, 1,
-1.219651, 0.6074188, -0.4711312, 1, 0.7254902, 0, 1,
-1.215955, -0.1051055, -3.358409, 1, 0.7333333, 0, 1,
-1.209968, 0.2961143, -1.78323, 1, 0.7372549, 0, 1,
-1.202587, -0.6475451, -2.867265, 1, 0.7450981, 0, 1,
-1.195424, 0.005126378, -1.267765, 1, 0.7490196, 0, 1,
-1.19306, -0.4134763, -0.3397004, 1, 0.7568628, 0, 1,
-1.189614, 0.3249814, -0.5694236, 1, 0.7607843, 0, 1,
-1.188054, -0.8848822, -2.951379, 1, 0.7686275, 0, 1,
-1.187646, 0.548525, 0.2706659, 1, 0.772549, 0, 1,
-1.185315, 0.1673022, 0.5475401, 1, 0.7803922, 0, 1,
-1.184775, 0.6262718, -1.51955, 1, 0.7843137, 0, 1,
-1.1827, -0.2746096, -2.504728, 1, 0.7921569, 0, 1,
-1.18069, 0.2778472, 1.083789, 1, 0.7960784, 0, 1,
-1.17984, -0.9412815, -2.625276, 1, 0.8039216, 0, 1,
-1.178746, 0.6950001, -1.164127, 1, 0.8117647, 0, 1,
-1.177216, -0.05153063, -0.8342156, 1, 0.8156863, 0, 1,
-1.171876, -0.8280672, -2.975061, 1, 0.8235294, 0, 1,
-1.164081, 0.1760747, -2.842521, 1, 0.827451, 0, 1,
-1.15699, -1.216358, -2.683861, 1, 0.8352941, 0, 1,
-1.153607, 2.296262, 0.3133872, 1, 0.8392157, 0, 1,
-1.153334, -1.34003, -3.329634, 1, 0.8470588, 0, 1,
-1.149061, -0.07939719, -2.043408, 1, 0.8509804, 0, 1,
-1.147593, 0.8287237, 0.9523274, 1, 0.8588235, 0, 1,
-1.135729, -0.8182212, -2.312253, 1, 0.8627451, 0, 1,
-1.129761, -1.974228, -2.036462, 1, 0.8705882, 0, 1,
-1.129529, -0.3019283, -1.458856, 1, 0.8745098, 0, 1,
-1.129066, 0.2553823, -1.559963, 1, 0.8823529, 0, 1,
-1.126611, -0.7731884, -1.846712, 1, 0.8862745, 0, 1,
-1.120327, -1.913756, -3.838191, 1, 0.8941177, 0, 1,
-1.110183, 0.2513915, -0.5608688, 1, 0.8980392, 0, 1,
-1.10586, -1.527016, -2.614898, 1, 0.9058824, 0, 1,
-1.092955, -0.5108607, -2.714075, 1, 0.9137255, 0, 1,
-1.090731, 0.6942784, -0.137696, 1, 0.9176471, 0, 1,
-1.080329, -1.01759, -3.665, 1, 0.9254902, 0, 1,
-1.062175, 0.7919575, -2.945313, 1, 0.9294118, 0, 1,
-1.054917, -1.295067, -3.774541, 1, 0.9372549, 0, 1,
-1.053304, -0.4840928, -1.12014, 1, 0.9411765, 0, 1,
-1.039239, -0.3211161, -1.254674, 1, 0.9490196, 0, 1,
-1.036576, -0.06514195, 0.3288632, 1, 0.9529412, 0, 1,
-1.031378, -0.7457579, -3.501267, 1, 0.9607843, 0, 1,
-1.029025, 0.4445302, -0.3702715, 1, 0.9647059, 0, 1,
-1.028243, 0.4976988, -2.196492, 1, 0.972549, 0, 1,
-1.025797, 0.226302, -2.013176, 1, 0.9764706, 0, 1,
-1.018517, -1.217507, -1.616269, 1, 0.9843137, 0, 1,
-1.014316, 0.208882, -1.090448, 1, 0.9882353, 0, 1,
-1.013033, 1.155455, -1.455124, 1, 0.9960784, 0, 1,
-1.010668, -0.1394307, -2.23376, 0.9960784, 1, 0, 1,
-1.008312, -0.07136166, -2.536624, 0.9921569, 1, 0, 1,
-1.00616, 0.2063131, -2.300836, 0.9843137, 1, 0, 1,
-1.004034, 0.08268879, -1.56461, 0.9803922, 1, 0, 1,
-1.000888, 0.4276793, -0.7868432, 0.972549, 1, 0, 1,
-0.9974695, 0.3934968, -1.309639, 0.9686275, 1, 0, 1,
-0.9929954, -1.901801, -3.564959, 0.9607843, 1, 0, 1,
-0.9926222, -1.091377, -1.350716, 0.9568627, 1, 0, 1,
-0.9896214, -0.6846194, -1.490347, 0.9490196, 1, 0, 1,
-0.9885365, 0.4920723, -1.191836, 0.945098, 1, 0, 1,
-0.9809725, 0.929296, -1.326344, 0.9372549, 1, 0, 1,
-0.9805141, -0.708666, -2.494424, 0.9333333, 1, 0, 1,
-0.9705702, 0.2587443, -1.036785, 0.9254902, 1, 0, 1,
-0.9691762, -0.2474974, -3.102893, 0.9215686, 1, 0, 1,
-0.9684242, -0.1844932, -0.6178871, 0.9137255, 1, 0, 1,
-0.9578582, -0.07143045, -0.5779653, 0.9098039, 1, 0, 1,
-0.9559777, 0.7143082, -1.351319, 0.9019608, 1, 0, 1,
-0.9517159, -0.9759878, -2.149094, 0.8941177, 1, 0, 1,
-0.9516975, 1.933795, -0.8520963, 0.8901961, 1, 0, 1,
-0.9435989, -1.193874, -1.416461, 0.8823529, 1, 0, 1,
-0.9359232, 0.07945352, -1.642889, 0.8784314, 1, 0, 1,
-0.9344109, 0.7710362, -2.062151, 0.8705882, 1, 0, 1,
-0.9336531, -1.002871, -1.773477, 0.8666667, 1, 0, 1,
-0.9289897, 0.466148, -0.2552699, 0.8588235, 1, 0, 1,
-0.9261837, 1.100983, -0.6522952, 0.854902, 1, 0, 1,
-0.9226277, -0.1987255, -0.4605075, 0.8470588, 1, 0, 1,
-0.9207697, -0.9267702, -1.791661, 0.8431373, 1, 0, 1,
-0.9204503, -0.3071197, -4.133571, 0.8352941, 1, 0, 1,
-0.9185678, -1.317865, -1.916359, 0.8313726, 1, 0, 1,
-0.9143773, -0.3094866, -1.260522, 0.8235294, 1, 0, 1,
-0.9090746, -1.112782, -2.674283, 0.8196079, 1, 0, 1,
-0.9055701, -0.2857375, 0.291014, 0.8117647, 1, 0, 1,
-0.8915461, 0.1546412, -1.560863, 0.8078431, 1, 0, 1,
-0.8913922, -0.2458171, 0.3495492, 0.8, 1, 0, 1,
-0.8910628, -1.073154, -1.026074, 0.7921569, 1, 0, 1,
-0.8884233, 1.046251, -0.5356131, 0.7882353, 1, 0, 1,
-0.8881051, -0.6035263, -1.329908, 0.7803922, 1, 0, 1,
-0.8871477, 0.7680711, 0.3298535, 0.7764706, 1, 0, 1,
-0.8855745, 0.05777751, -1.844628, 0.7686275, 1, 0, 1,
-0.8815531, 1.180927, -0.4150466, 0.7647059, 1, 0, 1,
-0.8797935, 0.4521277, -0.7652431, 0.7568628, 1, 0, 1,
-0.8780811, 0.7075937, -0.4383469, 0.7529412, 1, 0, 1,
-0.8606589, 0.4525917, -0.03534828, 0.7450981, 1, 0, 1,
-0.8515316, 0.2119113, -1.717977, 0.7411765, 1, 0, 1,
-0.8458916, -1.686592, -3.75868, 0.7333333, 1, 0, 1,
-0.8434372, 0.02136744, -1.981085, 0.7294118, 1, 0, 1,
-0.8425116, -0.4650708, -2.123201, 0.7215686, 1, 0, 1,
-0.834114, -2.341826, -2.929621, 0.7176471, 1, 0, 1,
-0.8261669, 1.536148, -0.504502, 0.7098039, 1, 0, 1,
-0.8231312, 0.3270885, -1.175565, 0.7058824, 1, 0, 1,
-0.8210121, -0.8658531, -2.307487, 0.6980392, 1, 0, 1,
-0.8196524, -1.194499, -0.4433122, 0.6901961, 1, 0, 1,
-0.819148, 1.747896, -0.4090633, 0.6862745, 1, 0, 1,
-0.8151709, 0.07320832, -0.6534031, 0.6784314, 1, 0, 1,
-0.8115748, -0.02062665, -0.9839945, 0.6745098, 1, 0, 1,
-0.8112379, -2.126718, -2.910629, 0.6666667, 1, 0, 1,
-0.7977545, 0.3498831, -0.3157412, 0.6627451, 1, 0, 1,
-0.7977317, 2.143324, 0.2664225, 0.654902, 1, 0, 1,
-0.7924858, -1.530153, -3.1809, 0.6509804, 1, 0, 1,
-0.7912695, 0.04197175, -1.211802, 0.6431373, 1, 0, 1,
-0.790551, -2.561857, -2.439161, 0.6392157, 1, 0, 1,
-0.7857538, 0.8336602, -3.631901, 0.6313726, 1, 0, 1,
-0.782415, 0.09092273, -0.6613588, 0.627451, 1, 0, 1,
-0.7735313, -0.2767967, -2.163469, 0.6196079, 1, 0, 1,
-0.7722422, -1.661435, -3.781969, 0.6156863, 1, 0, 1,
-0.7641939, -0.4909345, -2.45581, 0.6078432, 1, 0, 1,
-0.7636449, 0.9759721, -1.429849, 0.6039216, 1, 0, 1,
-0.747816, -0.9805227, -3.169961, 0.5960785, 1, 0, 1,
-0.7461296, 0.8283165, -0.197489, 0.5882353, 1, 0, 1,
-0.7407496, -1.811705, -2.823829, 0.5843138, 1, 0, 1,
-0.7324097, -1.672337, -3.666287, 0.5764706, 1, 0, 1,
-0.7283294, -0.2179223, -1.608711, 0.572549, 1, 0, 1,
-0.7259868, -2.66235, -3.589355, 0.5647059, 1, 0, 1,
-0.7191457, -0.2140103, -1.910977, 0.5607843, 1, 0, 1,
-0.7178175, 1.203508, -0.1844522, 0.5529412, 1, 0, 1,
-0.7137213, 0.06517181, -0.8252682, 0.5490196, 1, 0, 1,
-0.7120233, 0.9029105, 0.200012, 0.5411765, 1, 0, 1,
-0.7092271, 0.294395, -0.0181154, 0.5372549, 1, 0, 1,
-0.7056202, 0.3587864, -1.855829, 0.5294118, 1, 0, 1,
-0.704839, -0.9888009, -2.636072, 0.5254902, 1, 0, 1,
-0.7029675, 1.082265, 0.9403629, 0.5176471, 1, 0, 1,
-0.7023159, -0.1553675, -3.395432, 0.5137255, 1, 0, 1,
-0.7023028, 1.409078, -0.73785, 0.5058824, 1, 0, 1,
-0.7011814, 0.1159071, -2.165109, 0.5019608, 1, 0, 1,
-0.7011502, 0.1397958, -0.6579929, 0.4941176, 1, 0, 1,
-0.6978843, 1.114236, -1.981112, 0.4862745, 1, 0, 1,
-0.6960849, -0.08190461, -1.755051, 0.4823529, 1, 0, 1,
-0.6893466, 0.06662353, -2.949285, 0.4745098, 1, 0, 1,
-0.6880291, 0.1166168, -1.872069, 0.4705882, 1, 0, 1,
-0.6820063, 0.4159954, -1.102025, 0.4627451, 1, 0, 1,
-0.6786341, -0.9683813, -0.4375978, 0.4588235, 1, 0, 1,
-0.6779638, -0.01079231, -1.113623, 0.4509804, 1, 0, 1,
-0.6749483, -0.3621596, -2.143392, 0.4470588, 1, 0, 1,
-0.6748655, -0.176571, -0.5825865, 0.4392157, 1, 0, 1,
-0.6745679, 0.3351046, -0.8722728, 0.4352941, 1, 0, 1,
-0.6723536, 0.5408307, -1.944266, 0.427451, 1, 0, 1,
-0.6681409, 0.02837109, -1.385615, 0.4235294, 1, 0, 1,
-0.6664285, -0.4006881, -2.219481, 0.4156863, 1, 0, 1,
-0.6636159, -0.6667594, -1.796229, 0.4117647, 1, 0, 1,
-0.6619024, 0.5481397, -1.764102, 0.4039216, 1, 0, 1,
-0.6581393, -0.5668123, -2.61488, 0.3960784, 1, 0, 1,
-0.6529781, -0.9781579, -3.315302, 0.3921569, 1, 0, 1,
-0.6482267, 0.006196576, -1.931412, 0.3843137, 1, 0, 1,
-0.6476639, -1.791244, -4.063465, 0.3803922, 1, 0, 1,
-0.6476607, 1.579255, -0.6606202, 0.372549, 1, 0, 1,
-0.6476554, -1.943626, -4.224101, 0.3686275, 1, 0, 1,
-0.6468652, 1.533298, -0.6765202, 0.3607843, 1, 0, 1,
-0.6415061, -1.491056, -2.638055, 0.3568628, 1, 0, 1,
-0.6404272, 0.8723217, -1.448991, 0.3490196, 1, 0, 1,
-0.6397826, -0.3298804, -2.269922, 0.345098, 1, 0, 1,
-0.6396208, 0.4421418, -0.1962663, 0.3372549, 1, 0, 1,
-0.6354055, -1.916979, -2.425892, 0.3333333, 1, 0, 1,
-0.6340747, 1.467086, -0.6873409, 0.3254902, 1, 0, 1,
-0.6283258, 0.9164666, -0.3160964, 0.3215686, 1, 0, 1,
-0.6223161, 0.8506203, -1.260293, 0.3137255, 1, 0, 1,
-0.6211504, -0.1309433, -3.465861, 0.3098039, 1, 0, 1,
-0.6204994, -0.3806562, -1.615018, 0.3019608, 1, 0, 1,
-0.6197889, -0.6273816, -1.622686, 0.2941177, 1, 0, 1,
-0.6184773, 1.752074, 0.602156, 0.2901961, 1, 0, 1,
-0.6183289, 1.971818, 0.1841202, 0.282353, 1, 0, 1,
-0.6162286, -0.09177956, -1.537745, 0.2784314, 1, 0, 1,
-0.611365, 0.1850852, -0.8583697, 0.2705882, 1, 0, 1,
-0.6108348, -1.446862, -2.035478, 0.2666667, 1, 0, 1,
-0.6077349, 1.044643, -0.7304249, 0.2588235, 1, 0, 1,
-0.6072727, 0.7024016, 1.366651, 0.254902, 1, 0, 1,
-0.5978568, 0.0529064, 0.1650391, 0.2470588, 1, 0, 1,
-0.5958036, 0.9958361, -0.1023283, 0.2431373, 1, 0, 1,
-0.5922871, 1.443303, -1.280282, 0.2352941, 1, 0, 1,
-0.5919705, 0.4345303, 0.210987, 0.2313726, 1, 0, 1,
-0.5912965, 1.128289, -0.8117592, 0.2235294, 1, 0, 1,
-0.5912793, 0.3934087, -0.7976331, 0.2196078, 1, 0, 1,
-0.5907518, -0.001989904, -1.112731, 0.2117647, 1, 0, 1,
-0.5882108, 0.9668679, -1.845488, 0.2078431, 1, 0, 1,
-0.5867578, 1.420813, 2.146365, 0.2, 1, 0, 1,
-0.5862369, -1.059708, -2.612187, 0.1921569, 1, 0, 1,
-0.5860118, 0.6405517, -1.032679, 0.1882353, 1, 0, 1,
-0.5857352, -0.157272, -0.5627266, 0.1803922, 1, 0, 1,
-0.5829549, 1.36473, -0.5513074, 0.1764706, 1, 0, 1,
-0.5808694, 1.002884, -0.9739882, 0.1686275, 1, 0, 1,
-0.5785872, -2.099016, -2.084415, 0.1647059, 1, 0, 1,
-0.5677974, -1.123824, -0.5243757, 0.1568628, 1, 0, 1,
-0.5668499, -1.340626, -2.077815, 0.1529412, 1, 0, 1,
-0.5642878, -0.8676726, -2.208798, 0.145098, 1, 0, 1,
-0.5625582, -0.8898767, -2.072108, 0.1411765, 1, 0, 1,
-0.5611612, 0.7602211, -0.5439577, 0.1333333, 1, 0, 1,
-0.5590389, -0.8720523, -1.890656, 0.1294118, 1, 0, 1,
-0.5582924, -2.375758, -4.512162, 0.1215686, 1, 0, 1,
-0.5544965, 0.3203736, -0.945662, 0.1176471, 1, 0, 1,
-0.5455897, -1.720601, -3.953034, 0.1098039, 1, 0, 1,
-0.5453349, -0.3600233, -2.953976, 0.1058824, 1, 0, 1,
-0.5433599, 0.1410311, -1.974202, 0.09803922, 1, 0, 1,
-0.5430444, 0.8034959, -0.7471329, 0.09019608, 1, 0, 1,
-0.5283913, 1.446447, 0.8562008, 0.08627451, 1, 0, 1,
-0.5240131, -0.3966045, -3.291738, 0.07843138, 1, 0, 1,
-0.5179638, -2.006808, -3.851425, 0.07450981, 1, 0, 1,
-0.517752, -0.6937242, -3.58645, 0.06666667, 1, 0, 1,
-0.5150585, 0.1817385, -0.6464155, 0.0627451, 1, 0, 1,
-0.5140105, -0.1269899, -1.269578, 0.05490196, 1, 0, 1,
-0.5112302, 0.1642903, -2.095043, 0.05098039, 1, 0, 1,
-0.4979308, 0.2945186, -1.125226, 0.04313726, 1, 0, 1,
-0.4979171, 1.003413, -1.000853, 0.03921569, 1, 0, 1,
-0.4959904, 0.6489145, -0.3031938, 0.03137255, 1, 0, 1,
-0.4934706, 0.3704777, -0.69906, 0.02745098, 1, 0, 1,
-0.4924574, 1.060378, 0.04529721, 0.01960784, 1, 0, 1,
-0.4865728, -2.732557, -0.4765541, 0.01568628, 1, 0, 1,
-0.4860641, -0.6451065, -3.364238, 0.007843138, 1, 0, 1,
-0.4810329, 2.09334, 0.2037656, 0.003921569, 1, 0, 1,
-0.4787964, -1.673144, -2.953847, 0, 1, 0.003921569, 1,
-0.4681157, 0.5496731, -0.4133236, 0, 1, 0.01176471, 1,
-0.4562477, 0.4117275, -1.410926, 0, 1, 0.01568628, 1,
-0.4480563, -0.7217835, -1.470855, 0, 1, 0.02352941, 1,
-0.4424534, -1.026596, -3.314647, 0, 1, 0.02745098, 1,
-0.4388604, -0.3256544, -3.430399, 0, 1, 0.03529412, 1,
-0.4381832, -1.304051, -1.52165, 0, 1, 0.03921569, 1,
-0.4378036, 0.1716784, 1.641718, 0, 1, 0.04705882, 1,
-0.4262916, -0.340445, -1.157058, 0, 1, 0.05098039, 1,
-0.4236883, 0.823371, 0.1702533, 0, 1, 0.05882353, 1,
-0.4223266, 0.1032956, -3.269976, 0, 1, 0.0627451, 1,
-0.4198945, -0.6590151, -4.153262, 0, 1, 0.07058824, 1,
-0.4175314, -0.8504049, -2.345698, 0, 1, 0.07450981, 1,
-0.415354, 0.5306112, -0.5934359, 0, 1, 0.08235294, 1,
-0.4136334, -1.048844, -2.067671, 0, 1, 0.08627451, 1,
-0.4065566, 1.754904, 0.6264051, 0, 1, 0.09411765, 1,
-0.4015685, 0.358868, -1.09411, 0, 1, 0.1019608, 1,
-0.3892446, 1.306988, 1.355757, 0, 1, 0.1058824, 1,
-0.3888654, -0.4110635, -0.4652314, 0, 1, 0.1137255, 1,
-0.3887312, 1.941079, 0.3124108, 0, 1, 0.1176471, 1,
-0.3866388, -0.3921608, -0.7137456, 0, 1, 0.1254902, 1,
-0.3864213, -0.9066692, -2.609597, 0, 1, 0.1294118, 1,
-0.3825351, -0.8218915, -2.853965, 0, 1, 0.1372549, 1,
-0.3789327, -0.08886833, -1.812992, 0, 1, 0.1411765, 1,
-0.3781835, -0.8116705, -1.493758, 0, 1, 0.1490196, 1,
-0.3775031, 1.149965, -2.265719, 0, 1, 0.1529412, 1,
-0.3773557, -0.9456859, -2.595917, 0, 1, 0.1607843, 1,
-0.3754612, 1.166905, -0.1341089, 0, 1, 0.1647059, 1,
-0.37444, -0.8743585, -2.941158, 0, 1, 0.172549, 1,
-0.3727337, -0.9259644, -2.282736, 0, 1, 0.1764706, 1,
-0.3702066, 0.4731114, -0.138336, 0, 1, 0.1843137, 1,
-0.3685399, 1.440688, 1.901704, 0, 1, 0.1882353, 1,
-0.3608635, -1.414325, -4.571041, 0, 1, 0.1960784, 1,
-0.3602169, -1.059173, -2.104033, 0, 1, 0.2039216, 1,
-0.3561392, -0.1675828, -2.772, 0, 1, 0.2078431, 1,
-0.3522705, -1.670169, -4.645351, 0, 1, 0.2156863, 1,
-0.3498146, -0.2120056, -1.447973, 0, 1, 0.2196078, 1,
-0.3492023, 0.6489297, -0.1247142, 0, 1, 0.227451, 1,
-0.3457583, 1.306985, -1.526674, 0, 1, 0.2313726, 1,
-0.3439899, -1.055592, -2.722168, 0, 1, 0.2392157, 1,
-0.3428415, 0.5126636, -0.3289994, 0, 1, 0.2431373, 1,
-0.3402365, 0.4373152, -1.224747, 0, 1, 0.2509804, 1,
-0.3381129, 1.150236, -1.252071, 0, 1, 0.254902, 1,
-0.3378983, -0.2889419, -3.431752, 0, 1, 0.2627451, 1,
-0.337086, -1.032643, -2.124455, 0, 1, 0.2666667, 1,
-0.3369552, 1.14603, 0.7916479, 0, 1, 0.2745098, 1,
-0.3354245, -1.130864, -4.252983, 0, 1, 0.2784314, 1,
-0.3328868, -0.5679022, -1.563387, 0, 1, 0.2862745, 1,
-0.3290388, 1.353488, -0.3273363, 0, 1, 0.2901961, 1,
-0.3256702, 0.524192, -0.497293, 0, 1, 0.2980392, 1,
-0.3253877, -1.290547, -1.803566, 0, 1, 0.3058824, 1,
-0.3238542, 0.3837992, -0.8847839, 0, 1, 0.3098039, 1,
-0.3235849, -1.298013, -2.578525, 0, 1, 0.3176471, 1,
-0.3218782, -1.320506, -2.174352, 0, 1, 0.3215686, 1,
-0.3208976, 2.153026, -2.39026, 0, 1, 0.3294118, 1,
-0.3079052, -0.1392204, -2.126577, 0, 1, 0.3333333, 1,
-0.3043388, -0.455016, -2.383291, 0, 1, 0.3411765, 1,
-0.3023841, 0.6298621, 0.4963742, 0, 1, 0.345098, 1,
-0.2985011, -0.5311084, -2.714143, 0, 1, 0.3529412, 1,
-0.2909241, -0.1397266, -0.9122459, 0, 1, 0.3568628, 1,
-0.2872995, -0.5303634, -4.247548, 0, 1, 0.3647059, 1,
-0.2816885, -2.450886, -2.598889, 0, 1, 0.3686275, 1,
-0.2786597, -0.6008638, -3.00261, 0, 1, 0.3764706, 1,
-0.2784774, 0.1429202, -1.552762, 0, 1, 0.3803922, 1,
-0.2754848, -1.717907, -1.700568, 0, 1, 0.3882353, 1,
-0.2672252, -0.4067433, -2.019874, 0, 1, 0.3921569, 1,
-0.2666168, -1.733434, -3.620624, 0, 1, 0.4, 1,
-0.2614798, -1.808513, -2.385125, 0, 1, 0.4078431, 1,
-0.2587257, -0.9996054, -1.715422, 0, 1, 0.4117647, 1,
-0.2555253, 1.153235, -0.1423585, 0, 1, 0.4196078, 1,
-0.2553173, -0.4119279, -3.791145, 0, 1, 0.4235294, 1,
-0.2515409, -1.085192, -3.725088, 0, 1, 0.4313726, 1,
-0.2503179, 0.8551233, -2.215888, 0, 1, 0.4352941, 1,
-0.2470238, 0.8955535, -1.408062, 0, 1, 0.4431373, 1,
-0.2420449, -0.2889954, -2.056823, 0, 1, 0.4470588, 1,
-0.2399164, -0.8038519, -3.12101, 0, 1, 0.454902, 1,
-0.2329216, -1.663937, -4.440016, 0, 1, 0.4588235, 1,
-0.2320855, -0.3404346, -4.342437, 0, 1, 0.4666667, 1,
-0.2268445, 2.205834, -0.1661924, 0, 1, 0.4705882, 1,
-0.2261994, 0.6750458, -0.02937012, 0, 1, 0.4784314, 1,
-0.2243114, -1.347845, -3.783719, 0, 1, 0.4823529, 1,
-0.2205302, -0.7354751, -2.081641, 0, 1, 0.4901961, 1,
-0.215729, 0.385641, 1.93641, 0, 1, 0.4941176, 1,
-0.2142243, -0.816523, -2.151082, 0, 1, 0.5019608, 1,
-0.2141018, 0.116301, -0.6380705, 0, 1, 0.509804, 1,
-0.2072803, 1.222888, -0.1596531, 0, 1, 0.5137255, 1,
-0.2049819, -0.2882483, -3.347808, 0, 1, 0.5215687, 1,
-0.2021196, 1.259564, -0.5799291, 0, 1, 0.5254902, 1,
-0.2009219, 0.7928317, 2.324774, 0, 1, 0.5333334, 1,
-0.198105, -0.460574, -2.664578, 0, 1, 0.5372549, 1,
-0.1978749, 0.761877, 0.4442256, 0, 1, 0.5450981, 1,
-0.1971589, -1.397977, -2.627539, 0, 1, 0.5490196, 1,
-0.195257, -0.6189481, -2.48189, 0, 1, 0.5568628, 1,
-0.1875049, 0.5141298, -1.130985, 0, 1, 0.5607843, 1,
-0.1799495, 0.4742517, 0.2954169, 0, 1, 0.5686275, 1,
-0.1781459, -1.226854, -3.638028, 0, 1, 0.572549, 1,
-0.17306, 1.837804, -0.1276689, 0, 1, 0.5803922, 1,
-0.1693744, 2.775968, 0.4777698, 0, 1, 0.5843138, 1,
-0.1656769, 0.03411933, -2.497098, 0, 1, 0.5921569, 1,
-0.1652994, 0.4943928, 0.7463741, 0, 1, 0.5960785, 1,
-0.1650129, -1.446135, -0.8336576, 0, 1, 0.6039216, 1,
-0.1643696, -1.54876, -3.804954, 0, 1, 0.6117647, 1,
-0.1640141, -0.7903579, -2.963568, 0, 1, 0.6156863, 1,
-0.163495, -0.356296, -2.674538, 0, 1, 0.6235294, 1,
-0.1633737, 1.757308, 1.711606, 0, 1, 0.627451, 1,
-0.1631486, -0.686774, -2.66793, 0, 1, 0.6352941, 1,
-0.1594961, -0.1366894, -3.242975, 0, 1, 0.6392157, 1,
-0.1567644, 0.136576, 0.2811016, 0, 1, 0.6470588, 1,
-0.1550084, 0.6927161, 0.8111209, 0, 1, 0.6509804, 1,
-0.1547857, 1.351835, -1.417524, 0, 1, 0.6588235, 1,
-0.1546391, -0.259004, -1.635031, 0, 1, 0.6627451, 1,
-0.1523054, 0.6511036, -0.5252706, 0, 1, 0.6705883, 1,
-0.151515, 0.2014648, -0.1618304, 0, 1, 0.6745098, 1,
-0.149459, 0.1665075, -1.798113, 0, 1, 0.682353, 1,
-0.148527, -0.2755397, -2.411064, 0, 1, 0.6862745, 1,
-0.1456188, 1.437852, 1.563158, 0, 1, 0.6941177, 1,
-0.1455165, 0.3454084, -0.2006474, 0, 1, 0.7019608, 1,
-0.1438463, -0.2364628, -3.204186, 0, 1, 0.7058824, 1,
-0.1433414, -1.037555, -2.585365, 0, 1, 0.7137255, 1,
-0.1400616, 0.9093773, 0.8364875, 0, 1, 0.7176471, 1,
-0.1394272, -0.3650411, -2.453601, 0, 1, 0.7254902, 1,
-0.1350868, 1.222113, -0.684288, 0, 1, 0.7294118, 1,
-0.1257394, 0.125774, -0.8679636, 0, 1, 0.7372549, 1,
-0.1232756, 1.103686, 0.2105216, 0, 1, 0.7411765, 1,
-0.1201645, 0.2751431, 0.9906288, 0, 1, 0.7490196, 1,
-0.118671, 1.34281, 0.5131725, 0, 1, 0.7529412, 1,
-0.1184314, 0.3085309, -1.033429, 0, 1, 0.7607843, 1,
-0.1176757, -1.320724, -3.774108, 0, 1, 0.7647059, 1,
-0.1117251, -0.03716892, -4.358606, 0, 1, 0.772549, 1,
-0.1101382, 0.7583891, -1.205103, 0, 1, 0.7764706, 1,
-0.1091918, -0.6948402, -3.427458, 0, 1, 0.7843137, 1,
-0.1084162, 0.2446434, -0.9628641, 0, 1, 0.7882353, 1,
-0.1057457, -1.509738, -2.249638, 0, 1, 0.7960784, 1,
-0.1014186, 0.7323887, -1.137541, 0, 1, 0.8039216, 1,
-0.100857, -0.39657, -1.707072, 0, 1, 0.8078431, 1,
-0.09831493, -0.2438993, -4.990685, 0, 1, 0.8156863, 1,
-0.09627204, 1.004894, -0.1930325, 0, 1, 0.8196079, 1,
-0.09109193, 0.08331241, -0.08696903, 0, 1, 0.827451, 1,
-0.08666368, 1.859015, 1.899519, 0, 1, 0.8313726, 1,
-0.0851925, 1.022552, -1.48917, 0, 1, 0.8392157, 1,
-0.08274952, 0.6267594, -0.0436753, 0, 1, 0.8431373, 1,
-0.08173468, 0.7283803, -0.09891545, 0, 1, 0.8509804, 1,
-0.08094074, -0.6486211, -2.136641, 0, 1, 0.854902, 1,
-0.07939061, -1.097104, -2.704311, 0, 1, 0.8627451, 1,
-0.07753539, -2.07145, -3.56731, 0, 1, 0.8666667, 1,
-0.07574455, 1.04503, 0.5164627, 0, 1, 0.8745098, 1,
-0.0710579, 2.189915, 1.09522, 0, 1, 0.8784314, 1,
-0.06660262, 1.72107, -0.1500646, 0, 1, 0.8862745, 1,
-0.06185175, 0.3187093, -1.731404, 0, 1, 0.8901961, 1,
-0.06134479, 0.7264523, -0.1884354, 0, 1, 0.8980392, 1,
-0.05844692, 0.8888779, -0.693032, 0, 1, 0.9058824, 1,
-0.05194085, -0.4745502, -2.382469, 0, 1, 0.9098039, 1,
-0.05153606, 0.3842398, -0.2649711, 0, 1, 0.9176471, 1,
-0.05036986, -0.5686237, -2.676705, 0, 1, 0.9215686, 1,
-0.04990751, 1.390846, 1.173738, 0, 1, 0.9294118, 1,
-0.0482263, -0.09076696, -1.67018, 0, 1, 0.9333333, 1,
-0.04534316, 0.1968373, -0.3713998, 0, 1, 0.9411765, 1,
-0.04462491, -1.137604, -3.369967, 0, 1, 0.945098, 1,
-0.04322533, -0.0867756, -2.001727, 0, 1, 0.9529412, 1,
-0.03889827, 0.3014735, -0.4797916, 0, 1, 0.9568627, 1,
-0.03667352, -0.3207309, -2.827636, 0, 1, 0.9647059, 1,
-0.03664611, 0.05112972, -0.8799226, 0, 1, 0.9686275, 1,
-0.03637213, -0.9662576, -2.087858, 0, 1, 0.9764706, 1,
-0.03601719, -1.252765, -2.995567, 0, 1, 0.9803922, 1,
-0.03528779, 0.0005901278, -1.915306, 0, 1, 0.9882353, 1,
-0.03229995, 0.6474976, 0.5687016, 0, 1, 0.9921569, 1,
-0.02893249, -1.177932, -3.492916, 0, 1, 1, 1,
-0.02619453, 1.278799, 0.815645, 0, 0.9921569, 1, 1,
-0.02463578, -0.3598523, -4.247084, 0, 0.9882353, 1, 1,
-0.0226976, 0.3762288, -0.168048, 0, 0.9803922, 1, 1,
-0.02098214, -1.168685, -5.345757, 0, 0.9764706, 1, 1,
-0.0200591, 1.262684, -0.1094125, 0, 0.9686275, 1, 1,
-0.01885682, 0.9481549, -0.6318297, 0, 0.9647059, 1, 1,
-0.01874833, 1.356734, 0.5213242, 0, 0.9568627, 1, 1,
-0.01620093, 0.6477811, -0.6369612, 0, 0.9529412, 1, 1,
-0.01468593, 0.729371, -0.1674011, 0, 0.945098, 1, 1,
-0.009243579, -0.8427691, -3.21193, 0, 0.9411765, 1, 1,
-0.007955424, -1.201961, -2.498055, 0, 0.9333333, 1, 1,
-0.004948118, 0.5421819, 0.5550609, 0, 0.9294118, 1, 1,
-0.003954872, 1.838609, 0.1550286, 0, 0.9215686, 1, 1,
0.003498948, -1.319953, 1.611951, 0, 0.9176471, 1, 1,
0.00525872, 0.6905206, -0.5089846, 0, 0.9098039, 1, 1,
0.00659698, -1.467224, 1.773014, 0, 0.9058824, 1, 1,
0.007901755, -0.06171996, 3.095126, 0, 0.8980392, 1, 1,
0.008827556, -0.6508331, 2.760359, 0, 0.8901961, 1, 1,
0.01419546, -0.9930435, 3.330767, 0, 0.8862745, 1, 1,
0.01430717, -2.294021, 2.589548, 0, 0.8784314, 1, 1,
0.01577288, -2.136062, 2.262995, 0, 0.8745098, 1, 1,
0.01651815, -0.6818426, 3.893627, 0, 0.8666667, 1, 1,
0.01770366, -1.063023, 1.087473, 0, 0.8627451, 1, 1,
0.02039497, -1.63829, 3.324565, 0, 0.854902, 1, 1,
0.02143333, 0.4485549, -0.5033235, 0, 0.8509804, 1, 1,
0.02270919, -0.4033151, 3.401097, 0, 0.8431373, 1, 1,
0.02282357, 1.869812, -1.528663, 0, 0.8392157, 1, 1,
0.02538229, 0.2993281, -1.053313, 0, 0.8313726, 1, 1,
0.02598369, -1.187468, 2.865059, 0, 0.827451, 1, 1,
0.02681056, -0.7976328, 3.088366, 0, 0.8196079, 1, 1,
0.02803712, 0.7494448, -2.022244, 0, 0.8156863, 1, 1,
0.03104233, 1.455667, -0.6692781, 0, 0.8078431, 1, 1,
0.03258058, -0.6006806, 3.791737, 0, 0.8039216, 1, 1,
0.03707926, 0.3943009, 0.5383406, 0, 0.7960784, 1, 1,
0.04312662, -0.04643509, 1.146036, 0, 0.7882353, 1, 1,
0.04407009, 1.235922, -0.9607221, 0, 0.7843137, 1, 1,
0.0451745, 0.02661511, 1.033629, 0, 0.7764706, 1, 1,
0.04688922, 0.5339729, -1.085249, 0, 0.772549, 1, 1,
0.04774092, 1.83856, -0.1221995, 0, 0.7647059, 1, 1,
0.06798466, 0.1847933, 0.2218607, 0, 0.7607843, 1, 1,
0.06896202, 0.8689429, 0.285526, 0, 0.7529412, 1, 1,
0.07007412, 1.315661, 0.8452145, 0, 0.7490196, 1, 1,
0.07023755, -1.278277, 3.500237, 0, 0.7411765, 1, 1,
0.07077242, -1.35043, 1.835467, 0, 0.7372549, 1, 1,
0.07284243, 0.01099706, -0.1624696, 0, 0.7294118, 1, 1,
0.07401723, -1.212815, 3.069124, 0, 0.7254902, 1, 1,
0.07430283, 0.3335114, -0.1357254, 0, 0.7176471, 1, 1,
0.07510052, 0.167372, 0.9205207, 0, 0.7137255, 1, 1,
0.0752379, -1.154153, 3.212891, 0, 0.7058824, 1, 1,
0.07684322, -0.5440487, 2.839499, 0, 0.6980392, 1, 1,
0.07850599, 1.227383, 0.5853783, 0, 0.6941177, 1, 1,
0.07852375, 1.062666, 0.8252696, 0, 0.6862745, 1, 1,
0.07918871, -0.3110446, 2.140897, 0, 0.682353, 1, 1,
0.08249725, -0.9866343, 3.779954, 0, 0.6745098, 1, 1,
0.08381705, -0.3215165, 2.31965, 0, 0.6705883, 1, 1,
0.08424729, -0.90627, 2.520901, 0, 0.6627451, 1, 1,
0.08429945, 1.46411, -1.813239, 0, 0.6588235, 1, 1,
0.08779939, -0.3531126, 4.96078, 0, 0.6509804, 1, 1,
0.09358452, -1.141213, 3.453707, 0, 0.6470588, 1, 1,
0.09508561, 0.5608806, 0.8732545, 0, 0.6392157, 1, 1,
0.09584385, -0.5775825, 2.15685, 0, 0.6352941, 1, 1,
0.1000976, 1.534047, -1.328119, 0, 0.627451, 1, 1,
0.1019426, -1.086345, 2.663393, 0, 0.6235294, 1, 1,
0.1032983, -0.4230744, 3.919673, 0, 0.6156863, 1, 1,
0.1059674, 2.761029, 1.384354, 0, 0.6117647, 1, 1,
0.1066725, -0.6510903, 1.24697, 0, 0.6039216, 1, 1,
0.110987, -0.7443616, 3.852395, 0, 0.5960785, 1, 1,
0.111742, 0.03768625, 0.9767849, 0, 0.5921569, 1, 1,
0.1132169, -0.4217417, 3.487384, 0, 0.5843138, 1, 1,
0.1174385, -0.9546489, 3.131326, 0, 0.5803922, 1, 1,
0.1209047, 2.025232, 0.4850436, 0, 0.572549, 1, 1,
0.1217956, 0.1599181, 1.310807, 0, 0.5686275, 1, 1,
0.1228793, -1.127623, 1.968842, 0, 0.5607843, 1, 1,
0.125184, -1.638483, 4.230458, 0, 0.5568628, 1, 1,
0.1257694, 1.677277, -1.895679, 0, 0.5490196, 1, 1,
0.1288675, -1.773522, 3.07547, 0, 0.5450981, 1, 1,
0.1297161, -1.582261, 2.237244, 0, 0.5372549, 1, 1,
0.1298097, -0.4003924, 1.81472, 0, 0.5333334, 1, 1,
0.1314762, -0.1262568, 1.32079, 0, 0.5254902, 1, 1,
0.1336522, -0.71829, 4.634913, 0, 0.5215687, 1, 1,
0.1354091, 0.9794067, 0.7975453, 0, 0.5137255, 1, 1,
0.1365621, -0.06653359, 3.305337, 0, 0.509804, 1, 1,
0.1365781, 0.2825944, 0.2677289, 0, 0.5019608, 1, 1,
0.1370222, -1.067896, 2.622812, 0, 0.4941176, 1, 1,
0.1462088, -0.22543, 3.254844, 0, 0.4901961, 1, 1,
0.1530184, -0.2752436, 3.798359, 0, 0.4823529, 1, 1,
0.1544877, -0.6497028, 2.362495, 0, 0.4784314, 1, 1,
0.1574143, -0.1888544, 2.945283, 0, 0.4705882, 1, 1,
0.1593249, 0.1310529, 0.6126768, 0, 0.4666667, 1, 1,
0.1599664, 1.638852, 0.6131861, 0, 0.4588235, 1, 1,
0.1616834, 0.480872, 2.690169, 0, 0.454902, 1, 1,
0.1627679, -0.08244485, 2.218082, 0, 0.4470588, 1, 1,
0.1733085, -0.3362976, 2.795579, 0, 0.4431373, 1, 1,
0.1756837, 0.2172689, 1.013621, 0, 0.4352941, 1, 1,
0.1779297, -0.7770112, 4.315095, 0, 0.4313726, 1, 1,
0.1855439, 0.8791357, 2.67456, 0, 0.4235294, 1, 1,
0.1925959, 1.029198, -1.269657, 0, 0.4196078, 1, 1,
0.19383, -1.772835, 3.793454, 0, 0.4117647, 1, 1,
0.1938911, -1.01112, 4.015025, 0, 0.4078431, 1, 1,
0.2051875, 0.3729613, -0.5826101, 0, 0.4, 1, 1,
0.2068451, 1.964898, -1.691465, 0, 0.3921569, 1, 1,
0.2087445, 0.2328144, 2.01773, 0, 0.3882353, 1, 1,
0.2136027, -2.093408, 2.912216, 0, 0.3803922, 1, 1,
0.2137859, -0.1872896, 2.742285, 0, 0.3764706, 1, 1,
0.2152024, -1.310747, 2.876032, 0, 0.3686275, 1, 1,
0.2188478, 1.491567, 0.3168915, 0, 0.3647059, 1, 1,
0.2225672, 0.4194836, 0.8485743, 0, 0.3568628, 1, 1,
0.224526, 0.5015852, -0.9021959, 0, 0.3529412, 1, 1,
0.2255563, -2.557668, 4.800846, 0, 0.345098, 1, 1,
0.2303517, -1.142819, 3.742338, 0, 0.3411765, 1, 1,
0.2324597, -0.421969, 1.66796, 0, 0.3333333, 1, 1,
0.2344622, 0.1838955, -0.06750488, 0, 0.3294118, 1, 1,
0.2371441, -0.2002101, 3.161308, 0, 0.3215686, 1, 1,
0.2385226, 0.4110639, -0.6456706, 0, 0.3176471, 1, 1,
0.239356, 0.9600365, -0.08765439, 0, 0.3098039, 1, 1,
0.2406179, -1.051803, 2.862474, 0, 0.3058824, 1, 1,
0.2428606, -0.6701449, 4.578968, 0, 0.2980392, 1, 1,
0.2431625, -1.155238, 5.258214, 0, 0.2901961, 1, 1,
0.2453124, -0.7762767, 1.689152, 0, 0.2862745, 1, 1,
0.2501581, 1.849486, 1.26793, 0, 0.2784314, 1, 1,
0.2510066, 1.585216, 0.2657505, 0, 0.2745098, 1, 1,
0.2554952, 0.6288216, -1.87312, 0, 0.2666667, 1, 1,
0.2566074, 0.3286139, 1.670202, 0, 0.2627451, 1, 1,
0.2593402, -1.114919, 3.211429, 0, 0.254902, 1, 1,
0.2645489, 0.4036668, 0.6832172, 0, 0.2509804, 1, 1,
0.2693288, 0.5336583, 1.015289, 0, 0.2431373, 1, 1,
0.2725679, -0.05041098, 0.6361383, 0, 0.2392157, 1, 1,
0.2743877, 0.07572811, -0.02943136, 0, 0.2313726, 1, 1,
0.2755246, -0.5016122, 4.078893, 0, 0.227451, 1, 1,
0.2833272, -0.9773543, 3.629405, 0, 0.2196078, 1, 1,
0.2844333, 0.3138281, 0.5868858, 0, 0.2156863, 1, 1,
0.2875693, 0.7662014, 0.7084679, 0, 0.2078431, 1, 1,
0.303529, -0.2008196, 2.057672, 0, 0.2039216, 1, 1,
0.3041985, -0.9014028, 2.423081, 0, 0.1960784, 1, 1,
0.3052365, -0.2079965, 2.248388, 0, 0.1882353, 1, 1,
0.3065861, -1.567169, 2.665676, 0, 0.1843137, 1, 1,
0.308143, 1.149423, 1.691858, 0, 0.1764706, 1, 1,
0.3106006, -1.585034, 4.309774, 0, 0.172549, 1, 1,
0.3167191, -0.1054725, 0.9074108, 0, 0.1647059, 1, 1,
0.3170866, -1.09395, 3.090304, 0, 0.1607843, 1, 1,
0.31734, -1.970346, 3.162984, 0, 0.1529412, 1, 1,
0.31892, -0.9238577, 2.531591, 0, 0.1490196, 1, 1,
0.31979, 1.669531, 0.894294, 0, 0.1411765, 1, 1,
0.3276999, -0.1595094, 1.824389, 0, 0.1372549, 1, 1,
0.3337095, -0.3642006, 1.546192, 0, 0.1294118, 1, 1,
0.3388065, -0.02496263, 2.352738, 0, 0.1254902, 1, 1,
0.3402983, -0.8569447, 1.354696, 0, 0.1176471, 1, 1,
0.3420009, 2.939673, 0.6945122, 0, 0.1137255, 1, 1,
0.3445446, 1.653492, 0.8783522, 0, 0.1058824, 1, 1,
0.3446779, 0.9369043, -2.36708, 0, 0.09803922, 1, 1,
0.3473737, -1.062332, 2.628722, 0, 0.09411765, 1, 1,
0.3531253, -0.4688166, 2.377939, 0, 0.08627451, 1, 1,
0.3565124, 0.005878841, 1.822406, 0, 0.08235294, 1, 1,
0.3566414, 1.606447, 1.521121, 0, 0.07450981, 1, 1,
0.3579499, -1.132706, 3.92444, 0, 0.07058824, 1, 1,
0.3595205, 0.01814964, 1.788964, 0, 0.0627451, 1, 1,
0.3606425, 1.226475, 1.76241, 0, 0.05882353, 1, 1,
0.363052, 0.7500179, -0.2328423, 0, 0.05098039, 1, 1,
0.3634566, 1.328146, 1.228593, 0, 0.04705882, 1, 1,
0.3637564, 1.19015, -0.6427925, 0, 0.03921569, 1, 1,
0.3687054, 1.354336, -0.6531083, 0, 0.03529412, 1, 1,
0.3709523, -0.6170414, 2.687561, 0, 0.02745098, 1, 1,
0.3852511, 1.622766, 0.5351387, 0, 0.02352941, 1, 1,
0.3883081, -1.572615, 3.542039, 0, 0.01568628, 1, 1,
0.3909638, 1.114035, 2.221937, 0, 0.01176471, 1, 1,
0.392633, -0.5886329, 3.046283, 0, 0.003921569, 1, 1,
0.3927199, -1.421611, 3.080935, 0.003921569, 0, 1, 1,
0.3950407, -1.40329, 2.737647, 0.007843138, 0, 1, 1,
0.3990265, -0.02585243, 1.606215, 0.01568628, 0, 1, 1,
0.4020761, 0.8799981, 0.05643295, 0.01960784, 0, 1, 1,
0.403223, -1.350139, 2.72532, 0.02745098, 0, 1, 1,
0.4082087, -0.4842131, 2.67907, 0.03137255, 0, 1, 1,
0.4097401, -0.5926066, 4.579281, 0.03921569, 0, 1, 1,
0.4120098, -0.09554233, 1.88321, 0.04313726, 0, 1, 1,
0.4153983, -0.542403, 3.160948, 0.05098039, 0, 1, 1,
0.4278926, 0.473802, 1.176129, 0.05490196, 0, 1, 1,
0.4290139, 0.3211544, 0.2949528, 0.0627451, 0, 1, 1,
0.4338338, -0.08254047, 0.7843406, 0.06666667, 0, 1, 1,
0.4348408, 0.6826891, 2.129469, 0.07450981, 0, 1, 1,
0.4364122, 0.1475449, 1.040685, 0.07843138, 0, 1, 1,
0.4389313, -1.15113, 3.604897, 0.08627451, 0, 1, 1,
0.4439625, 2.226295, 0.8365189, 0.09019608, 0, 1, 1,
0.4480466, 0.2448597, -1.012198, 0.09803922, 0, 1, 1,
0.449245, -0.1550044, 1.999867, 0.1058824, 0, 1, 1,
0.4492668, -2.332134, 3.131867, 0.1098039, 0, 1, 1,
0.4560034, -0.8082828, 2.191625, 0.1176471, 0, 1, 1,
0.4621811, -0.3291108, 2.59984, 0.1215686, 0, 1, 1,
0.4660569, -0.64496, 3.932212, 0.1294118, 0, 1, 1,
0.4673133, -0.4693278, 1.166227, 0.1333333, 0, 1, 1,
0.4678921, -0.7331606, 2.421603, 0.1411765, 0, 1, 1,
0.4698539, -0.6655213, -0.2235381, 0.145098, 0, 1, 1,
0.4752148, -1.069921, 2.46281, 0.1529412, 0, 1, 1,
0.4770291, 0.6329572, -0.8105397, 0.1568628, 0, 1, 1,
0.4844413, 1.16826, 2.167916, 0.1647059, 0, 1, 1,
0.4882596, -0.4373139, 1.096859, 0.1686275, 0, 1, 1,
0.4921286, -0.422073, 2.170563, 0.1764706, 0, 1, 1,
0.4931464, -0.8223889, 1.818177, 0.1803922, 0, 1, 1,
0.493544, -0.1755817, 2.702049, 0.1882353, 0, 1, 1,
0.4937125, -0.2765138, 3.390708, 0.1921569, 0, 1, 1,
0.5012087, -0.1046618, 0.9563814, 0.2, 0, 1, 1,
0.5022731, 0.8234946, 1.166522, 0.2078431, 0, 1, 1,
0.5025045, -0.412883, 0.8478716, 0.2117647, 0, 1, 1,
0.5057667, 0.9907447, 1.53205, 0.2196078, 0, 1, 1,
0.508913, -1.417139, 2.004166, 0.2235294, 0, 1, 1,
0.5092312, -0.405016, 2.536803, 0.2313726, 0, 1, 1,
0.5099031, 0.160814, 1.910955, 0.2352941, 0, 1, 1,
0.5133755, 0.02757933, 1.964369, 0.2431373, 0, 1, 1,
0.5155312, 1.01116, -0.451617, 0.2470588, 0, 1, 1,
0.5172835, -0.3962939, 4.123383, 0.254902, 0, 1, 1,
0.5180879, 0.7055206, -1.445053, 0.2588235, 0, 1, 1,
0.519328, -1.11882, 3.08207, 0.2666667, 0, 1, 1,
0.5205586, -1.285733, 4.072136, 0.2705882, 0, 1, 1,
0.521516, -0.8086023, 3.134803, 0.2784314, 0, 1, 1,
0.5242956, -0.6494051, 1.716456, 0.282353, 0, 1, 1,
0.526749, -0.002325943, 2.806973, 0.2901961, 0, 1, 1,
0.5283611, -1.705989, 1.499471, 0.2941177, 0, 1, 1,
0.5321646, -0.02212905, 0.3561936, 0.3019608, 0, 1, 1,
0.5363338, 0.9863985, 0.1219633, 0.3098039, 0, 1, 1,
0.5368561, -0.4321043, 2.729964, 0.3137255, 0, 1, 1,
0.5400357, -0.1545635, 1.513593, 0.3215686, 0, 1, 1,
0.5402854, 0.7924971, 0.4847785, 0.3254902, 0, 1, 1,
0.540608, -0.4519915, 4.839192, 0.3333333, 0, 1, 1,
0.5406253, -1.570215, 1.26928, 0.3372549, 0, 1, 1,
0.5508366, 1.414728, 0.7307225, 0.345098, 0, 1, 1,
0.5541264, -1.725133, 3.346417, 0.3490196, 0, 1, 1,
0.5546963, 1.080029, -0.03434172, 0.3568628, 0, 1, 1,
0.5558774, 0.7613786, -0.6424659, 0.3607843, 0, 1, 1,
0.5561633, -0.05897361, 1.234547, 0.3686275, 0, 1, 1,
0.556232, 0.9492527, -0.3423915, 0.372549, 0, 1, 1,
0.559096, -0.6776643, 3.467066, 0.3803922, 0, 1, 1,
0.5625256, -0.2724495, 2.386914, 0.3843137, 0, 1, 1,
0.56398, 1.068936, 1.550751, 0.3921569, 0, 1, 1,
0.5641594, -0.5554787, 3.175438, 0.3960784, 0, 1, 1,
0.56868, -0.01681817, 0.8915437, 0.4039216, 0, 1, 1,
0.572162, -0.3996213, 2.695384, 0.4117647, 0, 1, 1,
0.5788369, -0.6793738, 1.852564, 0.4156863, 0, 1, 1,
0.5846885, -0.1737734, 2.965867, 0.4235294, 0, 1, 1,
0.5873417, 0.6481924, -0.3784937, 0.427451, 0, 1, 1,
0.5918052, 0.3729733, -0.3367365, 0.4352941, 0, 1, 1,
0.597054, -0.3157108, -0.451112, 0.4392157, 0, 1, 1,
0.5982458, -1.312974, 2.511436, 0.4470588, 0, 1, 1,
0.6010773, 1.604492, 0.02113773, 0.4509804, 0, 1, 1,
0.6152717, -0.769796, 1.731569, 0.4588235, 0, 1, 1,
0.6188369, 0.5812992, -0.9100345, 0.4627451, 0, 1, 1,
0.6204632, -0.1662511, 1.011573, 0.4705882, 0, 1, 1,
0.6228297, -1.255492, 2.038653, 0.4745098, 0, 1, 1,
0.6260107, 0.1690183, 2.293424, 0.4823529, 0, 1, 1,
0.6287467, -2.005314, 2.369563, 0.4862745, 0, 1, 1,
0.6324635, -0.0325563, 2.993379, 0.4941176, 0, 1, 1,
0.6327055, -1.189223, 3.198563, 0.5019608, 0, 1, 1,
0.6335955, -0.5742069, 1.910904, 0.5058824, 0, 1, 1,
0.6339663, -0.4565222, 0.8639342, 0.5137255, 0, 1, 1,
0.6387028, -0.9315996, 3.28433, 0.5176471, 0, 1, 1,
0.6447935, -1.270363, 1.847886, 0.5254902, 0, 1, 1,
0.6467763, -2.2275, 2.105698, 0.5294118, 0, 1, 1,
0.6578722, 0.6737543, -1.543856, 0.5372549, 0, 1, 1,
0.6591168, 0.4492641, 0.8149567, 0.5411765, 0, 1, 1,
0.6622133, 0.5726588, 2.458023, 0.5490196, 0, 1, 1,
0.6673, 2.460612, 0.3981065, 0.5529412, 0, 1, 1,
0.6673098, -0.7821989, 1.508159, 0.5607843, 0, 1, 1,
0.6719933, 2.001804, -1.261639, 0.5647059, 0, 1, 1,
0.6746835, -0.083788, 3.322818, 0.572549, 0, 1, 1,
0.6816496, 1.30528, -0.2164971, 0.5764706, 0, 1, 1,
0.6906052, -0.6538752, 1.586558, 0.5843138, 0, 1, 1,
0.6906933, 1.962756, 0.09915669, 0.5882353, 0, 1, 1,
0.6912138, -1.615802, 3.123485, 0.5960785, 0, 1, 1,
0.699068, 0.3969249, 0.1407443, 0.6039216, 0, 1, 1,
0.7085313, -0.7300063, 0.8813565, 0.6078432, 0, 1, 1,
0.7091459, -0.1467569, 2.137626, 0.6156863, 0, 1, 1,
0.7240199, -0.7264395, 2.46909, 0.6196079, 0, 1, 1,
0.7298117, -0.7771314, 3.840352, 0.627451, 0, 1, 1,
0.7300951, 0.9851851, 0.9677485, 0.6313726, 0, 1, 1,
0.7322433, 0.2993142, 1.246603, 0.6392157, 0, 1, 1,
0.7327613, 0.6413463, 1.194681, 0.6431373, 0, 1, 1,
0.7351147, 0.8048415, 1.07256, 0.6509804, 0, 1, 1,
0.737116, 0.7870777, 2.654748, 0.654902, 0, 1, 1,
0.7406423, 1.73377, -0.8553256, 0.6627451, 0, 1, 1,
0.7431054, 1.151067, -0.8290907, 0.6666667, 0, 1, 1,
0.7457363, 0.6939792, 2.866873, 0.6745098, 0, 1, 1,
0.7464164, 0.5601468, 0.4475758, 0.6784314, 0, 1, 1,
0.7488022, 0.2483944, 2.00045, 0.6862745, 0, 1, 1,
0.7491749, -0.4228627, 1.296927, 0.6901961, 0, 1, 1,
0.7497149, 0.3466409, 2.172323, 0.6980392, 0, 1, 1,
0.7503387, 0.6212965, 0.5091444, 0.7058824, 0, 1, 1,
0.7559917, -1.707189, 4.060681, 0.7098039, 0, 1, 1,
0.773076, 2.592069, 0.6785821, 0.7176471, 0, 1, 1,
0.7760521, -1.602827, 2.569074, 0.7215686, 0, 1, 1,
0.7769003, 0.7937173, 1.898027, 0.7294118, 0, 1, 1,
0.7804158, -0.3418697, 3.008797, 0.7333333, 0, 1, 1,
0.7915431, -0.7031003, 3.216763, 0.7411765, 0, 1, 1,
0.7941288, -0.001974858, 2.521529, 0.7450981, 0, 1, 1,
0.7978305, 0.4613821, 2.631063, 0.7529412, 0, 1, 1,
0.8013626, 0.570878, 0.342342, 0.7568628, 0, 1, 1,
0.8036329, 0.1770095, 1.080322, 0.7647059, 0, 1, 1,
0.811376, 0.2711271, 0.427833, 0.7686275, 0, 1, 1,
0.8130138, -0.2776363, 1.70194, 0.7764706, 0, 1, 1,
0.8139616, -0.9063655, 2.263323, 0.7803922, 0, 1, 1,
0.8161705, 1.458728, 1.648921, 0.7882353, 0, 1, 1,
0.827468, -1.51485, 4.204531, 0.7921569, 0, 1, 1,
0.8297536, 0.9977441, -0.5986286, 0.8, 0, 1, 1,
0.8301986, -1.27146, 4.939285, 0.8078431, 0, 1, 1,
0.8402888, 0.1848402, 2.071949, 0.8117647, 0, 1, 1,
0.8421634, -0.2882407, 0.7991502, 0.8196079, 0, 1, 1,
0.8425954, 0.1485659, 1.501822, 0.8235294, 0, 1, 1,
0.8441286, -0.4971011, 2.835906, 0.8313726, 0, 1, 1,
0.8445683, 0.5737104, 3.015442, 0.8352941, 0, 1, 1,
0.8487219, -0.5558119, 3.331081, 0.8431373, 0, 1, 1,
0.8605576, -0.1996391, 1.897461, 0.8470588, 0, 1, 1,
0.8606547, 1.135899, -1.55204, 0.854902, 0, 1, 1,
0.8612285, 0.505504, 0.7758837, 0.8588235, 0, 1, 1,
0.8725371, 0.4839835, -0.1094669, 0.8666667, 0, 1, 1,
0.8725578, -0.8947716, 2.130031, 0.8705882, 0, 1, 1,
0.8761569, -0.8779962, 2.801352, 0.8784314, 0, 1, 1,
0.8784025, -0.9507598, 2.633211, 0.8823529, 0, 1, 1,
0.880922, -0.825965, 3.581796, 0.8901961, 0, 1, 1,
0.8849426, 0.6957645, 1.680389, 0.8941177, 0, 1, 1,
0.8866681, 0.5615631, 0.8931587, 0.9019608, 0, 1, 1,
0.8897492, 2.59567, -1.151004, 0.9098039, 0, 1, 1,
0.8982562, -0.03728843, 2.982589, 0.9137255, 0, 1, 1,
0.9013575, 0.6826372, 0.9505925, 0.9215686, 0, 1, 1,
0.9017051, -1.452558, 1.911366, 0.9254902, 0, 1, 1,
0.9098398, 1.42277, 0.5683991, 0.9333333, 0, 1, 1,
0.9111084, 0.4937153, 0.01833952, 0.9372549, 0, 1, 1,
0.9171469, -0.7689311, 2.260137, 0.945098, 0, 1, 1,
0.9171975, 0.0293601, 3.513878, 0.9490196, 0, 1, 1,
0.9212032, 0.601811, 1.562263, 0.9568627, 0, 1, 1,
0.9308254, -0.6132196, 1.494012, 0.9607843, 0, 1, 1,
0.9403034, 0.7632425, 0.9317126, 0.9686275, 0, 1, 1,
0.9422514, 0.2173116, 2.138632, 0.972549, 0, 1, 1,
0.9500031, -0.6045306, 0.9701524, 0.9803922, 0, 1, 1,
0.9507999, -1.165025, 2.830895, 0.9843137, 0, 1, 1,
0.9539167, -0.6848962, 0.8489836, 0.9921569, 0, 1, 1,
0.9561779, -0.4473642, 2.077046, 0.9960784, 0, 1, 1,
0.9616212, -0.1165035, 1.343529, 1, 0, 0.9960784, 1,
0.9632586, 0.1947628, 1.674022, 1, 0, 0.9882353, 1,
0.9671401, -0.402217, 2.410356, 1, 0, 0.9843137, 1,
0.9706647, 0.05565279, 1.03931, 1, 0, 0.9764706, 1,
0.9728874, -0.2983134, 3.009822, 1, 0, 0.972549, 1,
0.9734831, -3.315431, 2.538624, 1, 0, 0.9647059, 1,
0.9757628, 0.5299488, 1.308477, 1, 0, 0.9607843, 1,
0.9760747, 0.2695855, 0.2879202, 1, 0, 0.9529412, 1,
0.9775629, -0.6588365, 1.309306, 1, 0, 0.9490196, 1,
0.9810259, -0.2191653, 1.018635, 1, 0, 0.9411765, 1,
0.9817083, -0.8780289, 3.520519, 1, 0, 0.9372549, 1,
0.9835669, -0.3319035, 1.573329, 1, 0, 0.9294118, 1,
0.9949095, 0.04956781, 2.00898, 1, 0, 0.9254902, 1,
1.003475, 0.4952245, 1.145376, 1, 0, 0.9176471, 1,
1.006446, -0.4450749, 2.162047, 1, 0, 0.9137255, 1,
1.011059, 1.243347, 0.3988979, 1, 0, 0.9058824, 1,
1.012885, 0.3770674, 1.580392, 1, 0, 0.9019608, 1,
1.01289, 0.2338547, 2.132762, 1, 0, 0.8941177, 1,
1.012897, 1.029035, 0.6604029, 1, 0, 0.8862745, 1,
1.033599, -2.066833, 3.556519, 1, 0, 0.8823529, 1,
1.045322, -0.3788414, 2.214543, 1, 0, 0.8745098, 1,
1.045772, -0.5291228, 3.062862, 1, 0, 0.8705882, 1,
1.046276, 0.4486537, 1.654008, 1, 0, 0.8627451, 1,
1.049369, 0.01240363, 1.229067, 1, 0, 0.8588235, 1,
1.058253, -0.9144843, 0.05983675, 1, 0, 0.8509804, 1,
1.062824, -0.6457938, 2.215795, 1, 0, 0.8470588, 1,
1.063179, 1.229641, -0.7950682, 1, 0, 0.8392157, 1,
1.063641, 1.006809, 0.006344776, 1, 0, 0.8352941, 1,
1.076423, -1.069037, 2.058038, 1, 0, 0.827451, 1,
1.07853, 0.906785, 0.5039319, 1, 0, 0.8235294, 1,
1.079549, -0.1753581, 0.5021085, 1, 0, 0.8156863, 1,
1.080147, -0.8199424, 2.247716, 1, 0, 0.8117647, 1,
1.083115, 1.428686, 2.734387, 1, 0, 0.8039216, 1,
1.092494, 0.9869369, 1.12736, 1, 0, 0.7960784, 1,
1.102588, -0.2062302, 1.387898, 1, 0, 0.7921569, 1,
1.106376, -0.5364103, 4.078466, 1, 0, 0.7843137, 1,
1.106679, 0.03037226, 1.60597, 1, 0, 0.7803922, 1,
1.107164, -0.4816817, 1.646346, 1, 0, 0.772549, 1,
1.111479, 0.2778377, 1.529402, 1, 0, 0.7686275, 1,
1.122345, -0.9824241, 1.97401, 1, 0, 0.7607843, 1,
1.122527, -0.8203816, 0.3305128, 1, 0, 0.7568628, 1,
1.122646, -1.436512, 2.78721, 1, 0, 0.7490196, 1,
1.123903, -0.4017559, 2.010063, 1, 0, 0.7450981, 1,
1.128157, 0.1192403, -0.06237746, 1, 0, 0.7372549, 1,
1.135683, 1.017074, -0.5385274, 1, 0, 0.7333333, 1,
1.142571, 0.9651331, 1.244453, 1, 0, 0.7254902, 1,
1.157683, 0.4929226, 0.4668207, 1, 0, 0.7215686, 1,
1.166923, 0.1741972, 2.06333, 1, 0, 0.7137255, 1,
1.168451, -0.06238496, 1.596705, 1, 0, 0.7098039, 1,
1.169004, 1.098757, 1.096815, 1, 0, 0.7019608, 1,
1.170478, 0.06171357, 2.201007, 1, 0, 0.6941177, 1,
1.173784, 0.6214753, 0.7581444, 1, 0, 0.6901961, 1,
1.174851, 0.781772, -0.4916238, 1, 0, 0.682353, 1,
1.176772, 1.356135, -0.2566714, 1, 0, 0.6784314, 1,
1.184061, -0.31023, 3.82701, 1, 0, 0.6705883, 1,
1.184545, 1.201111, 0.5987152, 1, 0, 0.6666667, 1,
1.218208, 1.669971, 0.178273, 1, 0, 0.6588235, 1,
1.220117, 1.424996, 0.7705384, 1, 0, 0.654902, 1,
1.22724, 1.497012, 0.2441565, 1, 0, 0.6470588, 1,
1.234858, 0.311662, 2.370514, 1, 0, 0.6431373, 1,
1.238324, -0.3672558, 1.389294, 1, 0, 0.6352941, 1,
1.238858, -0.3146628, 2.10453, 1, 0, 0.6313726, 1,
1.2435, -1.847774, 1.470537, 1, 0, 0.6235294, 1,
1.244826, -0.8070586, 2.323186, 1, 0, 0.6196079, 1,
1.266242, 1.295642, 1.483428, 1, 0, 0.6117647, 1,
1.271405, 0.052666, 1.740893, 1, 0, 0.6078432, 1,
1.303694, -0.1747174, 3.395533, 1, 0, 0.6, 1,
1.305332, 0.4057439, -0.04785133, 1, 0, 0.5921569, 1,
1.312817, -0.9597473, 2.123121, 1, 0, 0.5882353, 1,
1.313002, 0.2452384, 1.59662, 1, 0, 0.5803922, 1,
1.315951, -0.2896155, 0.8401228, 1, 0, 0.5764706, 1,
1.317814, -0.1698217, 1.608436, 1, 0, 0.5686275, 1,
1.325438, -0.2924282, 3.790158, 1, 0, 0.5647059, 1,
1.350466, 0.9180321, 3.571072, 1, 0, 0.5568628, 1,
1.356238, 0.5287537, 0.111735, 1, 0, 0.5529412, 1,
1.360183, -0.4283918, 3.316769, 1, 0, 0.5450981, 1,
1.367903, -0.0174622, 3.76255, 1, 0, 0.5411765, 1,
1.370385, -0.6490536, 4.609517, 1, 0, 0.5333334, 1,
1.374341, 1.279068, 0.2610529, 1, 0, 0.5294118, 1,
1.377008, 0.3601058, 0.3449254, 1, 0, 0.5215687, 1,
1.37796, 2.297201, 1.950953, 1, 0, 0.5176471, 1,
1.378769, 1.099496, 0.3126767, 1, 0, 0.509804, 1,
1.392266, -0.3774455, 1.589056, 1, 0, 0.5058824, 1,
1.396015, 1.210611, -0.9093643, 1, 0, 0.4980392, 1,
1.404578, 0.2864048, 1.075963, 1, 0, 0.4901961, 1,
1.423485, 0.1040127, 2.240414, 1, 0, 0.4862745, 1,
1.424866, -0.1167802, 1.562535, 1, 0, 0.4784314, 1,
1.426183, -3.018757, 2.84536, 1, 0, 0.4745098, 1,
1.428713, 0.3033738, 1.153865, 1, 0, 0.4666667, 1,
1.431019, -0.03161493, 2.129371, 1, 0, 0.4627451, 1,
1.471119, 0.01968119, 2.179211, 1, 0, 0.454902, 1,
1.471309, -2.603174, -0.7777646, 1, 0, 0.4509804, 1,
1.473011, -0.8795367, 1.67181, 1, 0, 0.4431373, 1,
1.475582, -1.400799, 3.500008, 1, 0, 0.4392157, 1,
1.500374, 0.6344443, 1.286132, 1, 0, 0.4313726, 1,
1.500771, 0.3406486, 1.265885, 1, 0, 0.427451, 1,
1.509759, -1.438523, 0.7615991, 1, 0, 0.4196078, 1,
1.512019, 1.513422, 0.5410443, 1, 0, 0.4156863, 1,
1.527386, -1.243598, 1.771659, 1, 0, 0.4078431, 1,
1.534247, -0.4958618, -0.2668315, 1, 0, 0.4039216, 1,
1.535733, 1.731276, 1.65794, 1, 0, 0.3960784, 1,
1.546759, -1.339168, 0.8887506, 1, 0, 0.3882353, 1,
1.559767, -0.978951, 3.921084, 1, 0, 0.3843137, 1,
1.564144, -0.2352212, 1.514775, 1, 0, 0.3764706, 1,
1.567095, -1.65989, 2.354779, 1, 0, 0.372549, 1,
1.567346, 1.493601, 1.885009, 1, 0, 0.3647059, 1,
1.588374, 0.1030132, 2.167266, 1, 0, 0.3607843, 1,
1.60338, 0.1274214, 0.08311646, 1, 0, 0.3529412, 1,
1.61204, -0.315561, -0.3162963, 1, 0, 0.3490196, 1,
1.617581, 1.015006, 0.05131791, 1, 0, 0.3411765, 1,
1.619239, -0.1134986, 1.63702, 1, 0, 0.3372549, 1,
1.630721, -0.9951783, 1.821706, 1, 0, 0.3294118, 1,
1.676242, -1.282699, 0.554577, 1, 0, 0.3254902, 1,
1.680745, -0.2156247, 1.173708, 1, 0, 0.3176471, 1,
1.68254, 0.8760739, 1.506456, 1, 0, 0.3137255, 1,
1.693495, -2.923419, 2.598461, 1, 0, 0.3058824, 1,
1.705503, -1.16432, 2.502434, 1, 0, 0.2980392, 1,
1.712982, 1.313547, 0.2914191, 1, 0, 0.2941177, 1,
1.714288, 0.3810808, 3.740597, 1, 0, 0.2862745, 1,
1.741739, 1.445457, 1.540923, 1, 0, 0.282353, 1,
1.757553, -1.369762, 1.921773, 1, 0, 0.2745098, 1,
1.763574, 1.238324, 1.309553, 1, 0, 0.2705882, 1,
1.805177, 0.2307504, 0.817345, 1, 0, 0.2627451, 1,
1.807579, 0.9209556, 0.6188076, 1, 0, 0.2588235, 1,
1.849017, -0.1170595, 2.155953, 1, 0, 0.2509804, 1,
1.859763, 0.34643, 4.016687, 1, 0, 0.2470588, 1,
1.863037, 1.686809, -0.4725396, 1, 0, 0.2392157, 1,
1.885149, -2.079527, 3.969054, 1, 0, 0.2352941, 1,
1.889046, -1.666387, 1.691027, 1, 0, 0.227451, 1,
1.911747, -1.201803, 1.803472, 1, 0, 0.2235294, 1,
1.942811, -0.1986189, 1.599247, 1, 0, 0.2156863, 1,
1.97391, -1.290577, 1.91385, 1, 0, 0.2117647, 1,
1.980611, 0.3954673, 1.548954, 1, 0, 0.2039216, 1,
1.986319, 1.197801, 1.371905, 1, 0, 0.1960784, 1,
2.005212, 0.8986653, 1.46267, 1, 0, 0.1921569, 1,
2.015671, 0.07383082, 1.210468, 1, 0, 0.1843137, 1,
2.016077, -0.7990141, 2.325762, 1, 0, 0.1803922, 1,
2.032713, -0.4518036, 2.394113, 1, 0, 0.172549, 1,
2.082338, -0.5787804, 2.092013, 1, 0, 0.1686275, 1,
2.094747, -1.676129, 1.180475, 1, 0, 0.1607843, 1,
2.099421, 0.8549661, 1.735498, 1, 0, 0.1568628, 1,
2.115749, 0.3307108, 0.9644288, 1, 0, 0.1490196, 1,
2.137681, -0.01897189, 2.292313, 1, 0, 0.145098, 1,
2.172831, -0.2682781, 1.095854, 1, 0, 0.1372549, 1,
2.18888, 0.9471483, 1.645271, 1, 0, 0.1333333, 1,
2.193337, -1.556047, 1.246608, 1, 0, 0.1254902, 1,
2.224226, -0.7596182, 0.4935306, 1, 0, 0.1215686, 1,
2.233525, 1.264146, 0.7514845, 1, 0, 0.1137255, 1,
2.256693, -0.5160813, 3.44611, 1, 0, 0.1098039, 1,
2.314651, -0.6883423, 2.651448, 1, 0, 0.1019608, 1,
2.3206, -1.868181, 1.36098, 1, 0, 0.09411765, 1,
2.320716, 1.334969, 1.289425, 1, 0, 0.09019608, 1,
2.346159, -0.4549399, 0.3700582, 1, 0, 0.08235294, 1,
2.355382, 2.192248, 2.108867, 1, 0, 0.07843138, 1,
2.402743, 0.4605798, 0.7441284, 1, 0, 0.07058824, 1,
2.413898, 0.5850565, 2.201664, 1, 0, 0.06666667, 1,
2.419198, -0.5153819, 1.357534, 1, 0, 0.05882353, 1,
2.561682, -0.6764532, 2.828033, 1, 0, 0.05490196, 1,
2.635369, -0.8258109, 3.513126, 1, 0, 0.04705882, 1,
2.765419, 0.7292249, -0.7903302, 1, 0, 0.04313726, 1,
2.770967, 1.362193, 2.007544, 1, 0, 0.03529412, 1,
2.798367, 0.2042759, 1.847158, 1, 0, 0.03137255, 1,
2.858778, 1.034076, 2.056988, 1, 0, 0.02352941, 1,
2.896685, 0.8746035, 1.866226, 1, 0, 0.01960784, 1,
2.95479, 0.1012698, -0.585853, 1, 0, 0.01176471, 1,
3.288459, 0.7965467, -0.7812908, 1, 0, 0.007843138, 1
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
-0.597141, -4.375671, -7.225111, 0, -0.5, 0.5, 0.5,
-0.597141, -4.375671, -7.225111, 1, -0.5, 0.5, 0.5,
-0.597141, -4.375671, -7.225111, 1, 1.5, 0.5, 0.5,
-0.597141, -4.375671, -7.225111, 0, 1.5, 0.5, 0.5
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
-5.799959, -0.1878788, -7.225111, 0, -0.5, 0.5, 0.5,
-5.799959, -0.1878788, -7.225111, 1, -0.5, 0.5, 0.5,
-5.799959, -0.1878788, -7.225111, 1, 1.5, 0.5, 0.5,
-5.799959, -0.1878788, -7.225111, 0, 1.5, 0.5, 0.5
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
-5.799959, -4.375671, -0.07882118, 0, -0.5, 0.5, 0.5,
-5.799959, -4.375671, -0.07882118, 1, -0.5, 0.5, 0.5,
-5.799959, -4.375671, -0.07882118, 1, 1.5, 0.5, 0.5,
-5.799959, -4.375671, -0.07882118, 0, 1.5, 0.5, 0.5
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
-4, -3.409258, -5.575967,
2, -3.409258, -5.575967,
-4, -3.409258, -5.575967,
-4, -3.570327, -5.850824,
-2, -3.409258, -5.575967,
-2, -3.570327, -5.850824,
0, -3.409258, -5.575967,
0, -3.570327, -5.850824,
2, -3.409258, -5.575967,
2, -3.570327, -5.850824
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
-4, -3.892464, -6.400539, 0, -0.5, 0.5, 0.5,
-4, -3.892464, -6.400539, 1, -0.5, 0.5, 0.5,
-4, -3.892464, -6.400539, 1, 1.5, 0.5, 0.5,
-4, -3.892464, -6.400539, 0, 1.5, 0.5, 0.5,
-2, -3.892464, -6.400539, 0, -0.5, 0.5, 0.5,
-2, -3.892464, -6.400539, 1, -0.5, 0.5, 0.5,
-2, -3.892464, -6.400539, 1, 1.5, 0.5, 0.5,
-2, -3.892464, -6.400539, 0, 1.5, 0.5, 0.5,
0, -3.892464, -6.400539, 0, -0.5, 0.5, 0.5,
0, -3.892464, -6.400539, 1, -0.5, 0.5, 0.5,
0, -3.892464, -6.400539, 1, 1.5, 0.5, 0.5,
0, -3.892464, -6.400539, 0, 1.5, 0.5, 0.5,
2, -3.892464, -6.400539, 0, -0.5, 0.5, 0.5,
2, -3.892464, -6.400539, 1, -0.5, 0.5, 0.5,
2, -3.892464, -6.400539, 1, 1.5, 0.5, 0.5,
2, -3.892464, -6.400539, 0, 1.5, 0.5, 0.5
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
-4.599309, -3, -5.575967,
-4.599309, 2, -5.575967,
-4.599309, -3, -5.575967,
-4.799417, -3, -5.850824,
-4.599309, -2, -5.575967,
-4.799417, -2, -5.850824,
-4.599309, -1, -5.575967,
-4.799417, -1, -5.850824,
-4.599309, 0, -5.575967,
-4.799417, 0, -5.850824,
-4.599309, 1, -5.575967,
-4.799417, 1, -5.850824,
-4.599309, 2, -5.575967,
-4.799417, 2, -5.850824
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
-5.199634, -3, -6.400539, 0, -0.5, 0.5, 0.5,
-5.199634, -3, -6.400539, 1, -0.5, 0.5, 0.5,
-5.199634, -3, -6.400539, 1, 1.5, 0.5, 0.5,
-5.199634, -3, -6.400539, 0, 1.5, 0.5, 0.5,
-5.199634, -2, -6.400539, 0, -0.5, 0.5, 0.5,
-5.199634, -2, -6.400539, 1, -0.5, 0.5, 0.5,
-5.199634, -2, -6.400539, 1, 1.5, 0.5, 0.5,
-5.199634, -2, -6.400539, 0, 1.5, 0.5, 0.5,
-5.199634, -1, -6.400539, 0, -0.5, 0.5, 0.5,
-5.199634, -1, -6.400539, 1, -0.5, 0.5, 0.5,
-5.199634, -1, -6.400539, 1, 1.5, 0.5, 0.5,
-5.199634, -1, -6.400539, 0, 1.5, 0.5, 0.5,
-5.199634, 0, -6.400539, 0, -0.5, 0.5, 0.5,
-5.199634, 0, -6.400539, 1, -0.5, 0.5, 0.5,
-5.199634, 0, -6.400539, 1, 1.5, 0.5, 0.5,
-5.199634, 0, -6.400539, 0, 1.5, 0.5, 0.5,
-5.199634, 1, -6.400539, 0, -0.5, 0.5, 0.5,
-5.199634, 1, -6.400539, 1, -0.5, 0.5, 0.5,
-5.199634, 1, -6.400539, 1, 1.5, 0.5, 0.5,
-5.199634, 1, -6.400539, 0, 1.5, 0.5, 0.5,
-5.199634, 2, -6.400539, 0, -0.5, 0.5, 0.5,
-5.199634, 2, -6.400539, 1, -0.5, 0.5, 0.5,
-5.199634, 2, -6.400539, 1, 1.5, 0.5, 0.5,
-5.199634, 2, -6.400539, 0, 1.5, 0.5, 0.5
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
-4.599309, -3.409258, -4,
-4.599309, -3.409258, 4,
-4.599309, -3.409258, -4,
-4.799417, -3.570327, -4,
-4.599309, -3.409258, -2,
-4.799417, -3.570327, -2,
-4.599309, -3.409258, 0,
-4.799417, -3.570327, 0,
-4.599309, -3.409258, 2,
-4.799417, -3.570327, 2,
-4.599309, -3.409258, 4,
-4.799417, -3.570327, 4
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
-5.199634, -3.892464, -4, 0, -0.5, 0.5, 0.5,
-5.199634, -3.892464, -4, 1, -0.5, 0.5, 0.5,
-5.199634, -3.892464, -4, 1, 1.5, 0.5, 0.5,
-5.199634, -3.892464, -4, 0, 1.5, 0.5, 0.5,
-5.199634, -3.892464, -2, 0, -0.5, 0.5, 0.5,
-5.199634, -3.892464, -2, 1, -0.5, 0.5, 0.5,
-5.199634, -3.892464, -2, 1, 1.5, 0.5, 0.5,
-5.199634, -3.892464, -2, 0, 1.5, 0.5, 0.5,
-5.199634, -3.892464, 0, 0, -0.5, 0.5, 0.5,
-5.199634, -3.892464, 0, 1, -0.5, 0.5, 0.5,
-5.199634, -3.892464, 0, 1, 1.5, 0.5, 0.5,
-5.199634, -3.892464, 0, 0, 1.5, 0.5, 0.5,
-5.199634, -3.892464, 2, 0, -0.5, 0.5, 0.5,
-5.199634, -3.892464, 2, 1, -0.5, 0.5, 0.5,
-5.199634, -3.892464, 2, 1, 1.5, 0.5, 0.5,
-5.199634, -3.892464, 2, 0, 1.5, 0.5, 0.5,
-5.199634, -3.892464, 4, 0, -0.5, 0.5, 0.5,
-5.199634, -3.892464, 4, 1, -0.5, 0.5, 0.5,
-5.199634, -3.892464, 4, 1, 1.5, 0.5, 0.5,
-5.199634, -3.892464, 4, 0, 1.5, 0.5, 0.5
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
-4.599309, -3.409258, -5.575967,
-4.599309, 3.0335, -5.575967,
-4.599309, -3.409258, 5.418324,
-4.599309, 3.0335, 5.418324,
-4.599309, -3.409258, -5.575967,
-4.599309, -3.409258, 5.418324,
-4.599309, 3.0335, -5.575967,
-4.599309, 3.0335, 5.418324,
-4.599309, -3.409258, -5.575967,
3.405027, -3.409258, -5.575967,
-4.599309, -3.409258, 5.418324,
3.405027, -3.409258, 5.418324,
-4.599309, 3.0335, -5.575967,
3.405027, 3.0335, -5.575967,
-4.599309, 3.0335, 5.418324,
3.405027, 3.0335, 5.418324,
3.405027, -3.409258, -5.575967,
3.405027, 3.0335, -5.575967,
3.405027, -3.409258, 5.418324,
3.405027, 3.0335, 5.418324,
3.405027, -3.409258, -5.575967,
3.405027, -3.409258, 5.418324,
3.405027, 3.0335, -5.575967,
3.405027, 3.0335, 5.418324
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
var radius = 8.035529;
var distance = 35.75097;
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
mvMatrix.translate( 0.597141, 0.1878788, 0.07882118 );
mvMatrix.scale( 1.085433, 1.348517, 0.7902439 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.75097);
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
-4.482741, 1.474303, -0.008167314, 0, 0, 1, 1, 1,
-3.708186, -0.02048811, -2.218686, 1, 0, 0, 1, 1,
-2.656016, -0.2511949, -2.456069, 1, 0, 0, 1, 1,
-2.624306, 2.197155, -0.3275602, 1, 0, 0, 1, 1,
-2.612575, -0.178086, -3.089551, 1, 0, 0, 1, 1,
-2.608671, -0.4035079, -0.826565, 1, 0, 0, 1, 1,
-2.488138, 1.648091, -1.76851, 0, 0, 0, 1, 1,
-2.467449, 0.5946061, -2.476364, 0, 0, 0, 1, 1,
-2.295683, 0.2785146, -2.604185, 0, 0, 0, 1, 1,
-2.270583, 0.06338768, -2.307199, 0, 0, 0, 1, 1,
-2.263904, 0.9008963, 0.3346, 0, 0, 0, 1, 1,
-2.253396, 0.1187474, -2.311564, 0, 0, 0, 1, 1,
-2.177971, -0.772372, -2.188238, 0, 0, 0, 1, 1,
-2.171133, -1.007726, -1.130129, 1, 1, 1, 1, 1,
-2.132683, -0.840832, -3.457884, 1, 1, 1, 1, 1,
-2.11147, 0.3934614, -3.945135, 1, 1, 1, 1, 1,
-2.109612, 2.659987, 0.5598326, 1, 1, 1, 1, 1,
-2.093806, -0.6988881, -2.101908, 1, 1, 1, 1, 1,
-2.092563, -0.3799663, -0.4078507, 1, 1, 1, 1, 1,
-2.049405, 0.7473643, -0.4105849, 1, 1, 1, 1, 1,
-2.046991, 0.5013641, -3.400588, 1, 1, 1, 1, 1,
-2.043022, 1.438333, -0.7408707, 1, 1, 1, 1, 1,
-2.035799, -1.254097, -0.1647264, 1, 1, 1, 1, 1,
-2.019098, 0.3098068, -1.928161, 1, 1, 1, 1, 1,
-2.007175, 1.066182, -1.029877, 1, 1, 1, 1, 1,
-2.006241, -1.786234, -1.066655, 1, 1, 1, 1, 1,
-1.997178, 1.079291, -0.3195515, 1, 1, 1, 1, 1,
-1.974549, -0.616917, -3.190617, 1, 1, 1, 1, 1,
-1.963957, -0.02076314, -2.532026, 0, 0, 1, 1, 1,
-1.961725, 1.507387, -2.796229, 1, 0, 0, 1, 1,
-1.960778, -0.6052752, -1.384974, 1, 0, 0, 1, 1,
-1.957555, -0.3637626, -2.018471, 1, 0, 0, 1, 1,
-1.932211, 0.2425274, -2.990174, 1, 0, 0, 1, 1,
-1.926242, 1.083591, -2.844879, 1, 0, 0, 1, 1,
-1.923227, -0.07442463, -1.841379, 0, 0, 0, 1, 1,
-1.91795, 0.1538458, -3.509042, 0, 0, 0, 1, 1,
-1.879996, 0.002842273, -1.560559, 0, 0, 0, 1, 1,
-1.840753, 0.6823857, -2.279678, 0, 0, 0, 1, 1,
-1.826952, 0.07398516, -1.733115, 0, 0, 0, 1, 1,
-1.803527, 1.181104, -0.2094294, 0, 0, 0, 1, 1,
-1.797675, -0.4868038, -1.028556, 0, 0, 0, 1, 1,
-1.78994, -0.33428, -1.659978, 1, 1, 1, 1, 1,
-1.755144, 0.5662397, -1.477256, 1, 1, 1, 1, 1,
-1.741246, -0.1603377, -1.576083, 1, 1, 1, 1, 1,
-1.739995, 0.942851, -1.135987, 1, 1, 1, 1, 1,
-1.732462, 1.392287, -2.092887, 1, 1, 1, 1, 1,
-1.716988, -0.9309868, -1.108982, 1, 1, 1, 1, 1,
-1.713725, -0.392059, -0.3626742, 1, 1, 1, 1, 1,
-1.703202, -0.09738303, -2.008794, 1, 1, 1, 1, 1,
-1.701014, -1.66852, -1.50895, 1, 1, 1, 1, 1,
-1.69805, -0.8587497, -2.468908, 1, 1, 1, 1, 1,
-1.688565, 0.3128398, -1.249732, 1, 1, 1, 1, 1,
-1.683751, 0.4558923, -0.4717716, 1, 1, 1, 1, 1,
-1.649642, -0.9659584, -3.601577, 1, 1, 1, 1, 1,
-1.6225, 0.7820675, -1.286429, 1, 1, 1, 1, 1,
-1.620093, -0.9399396, -1.04688, 1, 1, 1, 1, 1,
-1.619446, -0.2977832, -1.412677, 0, 0, 1, 1, 1,
-1.59864, 1.649936, -1.144083, 1, 0, 0, 1, 1,
-1.590549, -0.01121576, 0.1464868, 1, 0, 0, 1, 1,
-1.570983, -0.07904547, -3.431177, 1, 0, 0, 1, 1,
-1.561355, 0.02031151, -1.805743, 1, 0, 0, 1, 1,
-1.553312, -0.2345753, -1.635734, 1, 0, 0, 1, 1,
-1.552369, -0.3365022, -3.89341, 0, 0, 0, 1, 1,
-1.548372, 1.113194, -0.2618588, 0, 0, 0, 1, 1,
-1.545884, 1.567698, -3.588551, 0, 0, 0, 1, 1,
-1.539456, -1.967091, -2.189507, 0, 0, 0, 1, 1,
-1.537883, -1.162552, -0.6420121, 0, 0, 0, 1, 1,
-1.537719, -1.774625, -2.563473, 0, 0, 0, 1, 1,
-1.525386, 0.4556906, -2.950194, 0, 0, 0, 1, 1,
-1.520405, -0.3829111, -0.4980259, 1, 1, 1, 1, 1,
-1.516901, 0.7426533, -3.7083, 1, 1, 1, 1, 1,
-1.513473, -0.9094612, -1.28064, 1, 1, 1, 1, 1,
-1.51199, -1.405547, -1.665982, 1, 1, 1, 1, 1,
-1.510119, 0.3400841, -2.254401, 1, 1, 1, 1, 1,
-1.500208, -0.1275904, -1.737437, 1, 1, 1, 1, 1,
-1.485433, 1.261258, -0.3294515, 1, 1, 1, 1, 1,
-1.480944, 0.6274344, -2.107902, 1, 1, 1, 1, 1,
-1.480928, 0.9906328, -1.601547, 1, 1, 1, 1, 1,
-1.479142, -0.9007034, -1.021975, 1, 1, 1, 1, 1,
-1.476584, -0.5955995, -1.058534, 1, 1, 1, 1, 1,
-1.470739, -0.2124545, -1.73136, 1, 1, 1, 1, 1,
-1.469587, -0.3510896, 0.06339502, 1, 1, 1, 1, 1,
-1.462128, -0.09910934, -1.658425, 1, 1, 1, 1, 1,
-1.46028, -0.2856316, -1.097375, 1, 1, 1, 1, 1,
-1.455522, 0.5377185, 1.263772, 0, 0, 1, 1, 1,
-1.441548, -0.8444224, -1.758496, 1, 0, 0, 1, 1,
-1.437871, 0.6124046, -2.027153, 1, 0, 0, 1, 1,
-1.407052, 1.942479, -0.008893781, 1, 0, 0, 1, 1,
-1.406514, -1.296541, -1.624916, 1, 0, 0, 1, 1,
-1.394573, 1.778804, -0.1641348, 1, 0, 0, 1, 1,
-1.392421, -0.1498201, -1.578424, 0, 0, 0, 1, 1,
-1.387655, -0.7568006, -0.8117543, 0, 0, 0, 1, 1,
-1.367785, -0.8102729, -3.244513, 0, 0, 0, 1, 1,
-1.36715, -2.523151, -5.415856, 0, 0, 0, 1, 1,
-1.365303, -0.8998442, -1.08854, 0, 0, 0, 1, 1,
-1.36114, -0.3399263, -1.340438, 0, 0, 0, 1, 1,
-1.352198, 0.3939804, -0.2076247, 0, 0, 0, 1, 1,
-1.344683, -1.397257, -3.952312, 1, 1, 1, 1, 1,
-1.338068, -0.1049887, -3.096591, 1, 1, 1, 1, 1,
-1.333613, 0.881542, -2.382644, 1, 1, 1, 1, 1,
-1.332353, 0.4861311, -2.053566, 1, 1, 1, 1, 1,
-1.32651, -0.5721857, -1.759963, 1, 1, 1, 1, 1,
-1.317954, 0.2512338, -0.9618597, 1, 1, 1, 1, 1,
-1.310138, 0.8883243, -3.070061, 1, 1, 1, 1, 1,
-1.303961, -0.2888841, -0.7251708, 1, 1, 1, 1, 1,
-1.302521, 0.06170722, -2.49046, 1, 1, 1, 1, 1,
-1.300128, -1.102361, -0.782328, 1, 1, 1, 1, 1,
-1.28399, -1.439657, -3.850684, 1, 1, 1, 1, 1,
-1.279443, -0.04020132, -2.262034, 1, 1, 1, 1, 1,
-1.278075, 0.6609133, -1.565769, 1, 1, 1, 1, 1,
-1.277501, 0.8237249, -0.5148235, 1, 1, 1, 1, 1,
-1.269682, 0.4095372, -1.601538, 1, 1, 1, 1, 1,
-1.25536, 1.210891, -2.705209, 0, 0, 1, 1, 1,
-1.248342, 0.1822146, -1.981478, 1, 0, 0, 1, 1,
-1.247944, -0.1641255, 0.2137849, 1, 0, 0, 1, 1,
-1.237164, -0.4283589, -2.896868, 1, 0, 0, 1, 1,
-1.236952, 2.05182, -1.02891, 1, 0, 0, 1, 1,
-1.234945, -0.5090029, -2.368624, 1, 0, 0, 1, 1,
-1.230173, -2.455962, -2.133127, 0, 0, 0, 1, 1,
-1.22926, -0.2386239, -2.200713, 0, 0, 0, 1, 1,
-1.225947, -0.5079897, -2.031156, 0, 0, 0, 1, 1,
-1.219651, 0.6074188, -0.4711312, 0, 0, 0, 1, 1,
-1.215955, -0.1051055, -3.358409, 0, 0, 0, 1, 1,
-1.209968, 0.2961143, -1.78323, 0, 0, 0, 1, 1,
-1.202587, -0.6475451, -2.867265, 0, 0, 0, 1, 1,
-1.195424, 0.005126378, -1.267765, 1, 1, 1, 1, 1,
-1.19306, -0.4134763, -0.3397004, 1, 1, 1, 1, 1,
-1.189614, 0.3249814, -0.5694236, 1, 1, 1, 1, 1,
-1.188054, -0.8848822, -2.951379, 1, 1, 1, 1, 1,
-1.187646, 0.548525, 0.2706659, 1, 1, 1, 1, 1,
-1.185315, 0.1673022, 0.5475401, 1, 1, 1, 1, 1,
-1.184775, 0.6262718, -1.51955, 1, 1, 1, 1, 1,
-1.1827, -0.2746096, -2.504728, 1, 1, 1, 1, 1,
-1.18069, 0.2778472, 1.083789, 1, 1, 1, 1, 1,
-1.17984, -0.9412815, -2.625276, 1, 1, 1, 1, 1,
-1.178746, 0.6950001, -1.164127, 1, 1, 1, 1, 1,
-1.177216, -0.05153063, -0.8342156, 1, 1, 1, 1, 1,
-1.171876, -0.8280672, -2.975061, 1, 1, 1, 1, 1,
-1.164081, 0.1760747, -2.842521, 1, 1, 1, 1, 1,
-1.15699, -1.216358, -2.683861, 1, 1, 1, 1, 1,
-1.153607, 2.296262, 0.3133872, 0, 0, 1, 1, 1,
-1.153334, -1.34003, -3.329634, 1, 0, 0, 1, 1,
-1.149061, -0.07939719, -2.043408, 1, 0, 0, 1, 1,
-1.147593, 0.8287237, 0.9523274, 1, 0, 0, 1, 1,
-1.135729, -0.8182212, -2.312253, 1, 0, 0, 1, 1,
-1.129761, -1.974228, -2.036462, 1, 0, 0, 1, 1,
-1.129529, -0.3019283, -1.458856, 0, 0, 0, 1, 1,
-1.129066, 0.2553823, -1.559963, 0, 0, 0, 1, 1,
-1.126611, -0.7731884, -1.846712, 0, 0, 0, 1, 1,
-1.120327, -1.913756, -3.838191, 0, 0, 0, 1, 1,
-1.110183, 0.2513915, -0.5608688, 0, 0, 0, 1, 1,
-1.10586, -1.527016, -2.614898, 0, 0, 0, 1, 1,
-1.092955, -0.5108607, -2.714075, 0, 0, 0, 1, 1,
-1.090731, 0.6942784, -0.137696, 1, 1, 1, 1, 1,
-1.080329, -1.01759, -3.665, 1, 1, 1, 1, 1,
-1.062175, 0.7919575, -2.945313, 1, 1, 1, 1, 1,
-1.054917, -1.295067, -3.774541, 1, 1, 1, 1, 1,
-1.053304, -0.4840928, -1.12014, 1, 1, 1, 1, 1,
-1.039239, -0.3211161, -1.254674, 1, 1, 1, 1, 1,
-1.036576, -0.06514195, 0.3288632, 1, 1, 1, 1, 1,
-1.031378, -0.7457579, -3.501267, 1, 1, 1, 1, 1,
-1.029025, 0.4445302, -0.3702715, 1, 1, 1, 1, 1,
-1.028243, 0.4976988, -2.196492, 1, 1, 1, 1, 1,
-1.025797, 0.226302, -2.013176, 1, 1, 1, 1, 1,
-1.018517, -1.217507, -1.616269, 1, 1, 1, 1, 1,
-1.014316, 0.208882, -1.090448, 1, 1, 1, 1, 1,
-1.013033, 1.155455, -1.455124, 1, 1, 1, 1, 1,
-1.010668, -0.1394307, -2.23376, 1, 1, 1, 1, 1,
-1.008312, -0.07136166, -2.536624, 0, 0, 1, 1, 1,
-1.00616, 0.2063131, -2.300836, 1, 0, 0, 1, 1,
-1.004034, 0.08268879, -1.56461, 1, 0, 0, 1, 1,
-1.000888, 0.4276793, -0.7868432, 1, 0, 0, 1, 1,
-0.9974695, 0.3934968, -1.309639, 1, 0, 0, 1, 1,
-0.9929954, -1.901801, -3.564959, 1, 0, 0, 1, 1,
-0.9926222, -1.091377, -1.350716, 0, 0, 0, 1, 1,
-0.9896214, -0.6846194, -1.490347, 0, 0, 0, 1, 1,
-0.9885365, 0.4920723, -1.191836, 0, 0, 0, 1, 1,
-0.9809725, 0.929296, -1.326344, 0, 0, 0, 1, 1,
-0.9805141, -0.708666, -2.494424, 0, 0, 0, 1, 1,
-0.9705702, 0.2587443, -1.036785, 0, 0, 0, 1, 1,
-0.9691762, -0.2474974, -3.102893, 0, 0, 0, 1, 1,
-0.9684242, -0.1844932, -0.6178871, 1, 1, 1, 1, 1,
-0.9578582, -0.07143045, -0.5779653, 1, 1, 1, 1, 1,
-0.9559777, 0.7143082, -1.351319, 1, 1, 1, 1, 1,
-0.9517159, -0.9759878, -2.149094, 1, 1, 1, 1, 1,
-0.9516975, 1.933795, -0.8520963, 1, 1, 1, 1, 1,
-0.9435989, -1.193874, -1.416461, 1, 1, 1, 1, 1,
-0.9359232, 0.07945352, -1.642889, 1, 1, 1, 1, 1,
-0.9344109, 0.7710362, -2.062151, 1, 1, 1, 1, 1,
-0.9336531, -1.002871, -1.773477, 1, 1, 1, 1, 1,
-0.9289897, 0.466148, -0.2552699, 1, 1, 1, 1, 1,
-0.9261837, 1.100983, -0.6522952, 1, 1, 1, 1, 1,
-0.9226277, -0.1987255, -0.4605075, 1, 1, 1, 1, 1,
-0.9207697, -0.9267702, -1.791661, 1, 1, 1, 1, 1,
-0.9204503, -0.3071197, -4.133571, 1, 1, 1, 1, 1,
-0.9185678, -1.317865, -1.916359, 1, 1, 1, 1, 1,
-0.9143773, -0.3094866, -1.260522, 0, 0, 1, 1, 1,
-0.9090746, -1.112782, -2.674283, 1, 0, 0, 1, 1,
-0.9055701, -0.2857375, 0.291014, 1, 0, 0, 1, 1,
-0.8915461, 0.1546412, -1.560863, 1, 0, 0, 1, 1,
-0.8913922, -0.2458171, 0.3495492, 1, 0, 0, 1, 1,
-0.8910628, -1.073154, -1.026074, 1, 0, 0, 1, 1,
-0.8884233, 1.046251, -0.5356131, 0, 0, 0, 1, 1,
-0.8881051, -0.6035263, -1.329908, 0, 0, 0, 1, 1,
-0.8871477, 0.7680711, 0.3298535, 0, 0, 0, 1, 1,
-0.8855745, 0.05777751, -1.844628, 0, 0, 0, 1, 1,
-0.8815531, 1.180927, -0.4150466, 0, 0, 0, 1, 1,
-0.8797935, 0.4521277, -0.7652431, 0, 0, 0, 1, 1,
-0.8780811, 0.7075937, -0.4383469, 0, 0, 0, 1, 1,
-0.8606589, 0.4525917, -0.03534828, 1, 1, 1, 1, 1,
-0.8515316, 0.2119113, -1.717977, 1, 1, 1, 1, 1,
-0.8458916, -1.686592, -3.75868, 1, 1, 1, 1, 1,
-0.8434372, 0.02136744, -1.981085, 1, 1, 1, 1, 1,
-0.8425116, -0.4650708, -2.123201, 1, 1, 1, 1, 1,
-0.834114, -2.341826, -2.929621, 1, 1, 1, 1, 1,
-0.8261669, 1.536148, -0.504502, 1, 1, 1, 1, 1,
-0.8231312, 0.3270885, -1.175565, 1, 1, 1, 1, 1,
-0.8210121, -0.8658531, -2.307487, 1, 1, 1, 1, 1,
-0.8196524, -1.194499, -0.4433122, 1, 1, 1, 1, 1,
-0.819148, 1.747896, -0.4090633, 1, 1, 1, 1, 1,
-0.8151709, 0.07320832, -0.6534031, 1, 1, 1, 1, 1,
-0.8115748, -0.02062665, -0.9839945, 1, 1, 1, 1, 1,
-0.8112379, -2.126718, -2.910629, 1, 1, 1, 1, 1,
-0.7977545, 0.3498831, -0.3157412, 1, 1, 1, 1, 1,
-0.7977317, 2.143324, 0.2664225, 0, 0, 1, 1, 1,
-0.7924858, -1.530153, -3.1809, 1, 0, 0, 1, 1,
-0.7912695, 0.04197175, -1.211802, 1, 0, 0, 1, 1,
-0.790551, -2.561857, -2.439161, 1, 0, 0, 1, 1,
-0.7857538, 0.8336602, -3.631901, 1, 0, 0, 1, 1,
-0.782415, 0.09092273, -0.6613588, 1, 0, 0, 1, 1,
-0.7735313, -0.2767967, -2.163469, 0, 0, 0, 1, 1,
-0.7722422, -1.661435, -3.781969, 0, 0, 0, 1, 1,
-0.7641939, -0.4909345, -2.45581, 0, 0, 0, 1, 1,
-0.7636449, 0.9759721, -1.429849, 0, 0, 0, 1, 1,
-0.747816, -0.9805227, -3.169961, 0, 0, 0, 1, 1,
-0.7461296, 0.8283165, -0.197489, 0, 0, 0, 1, 1,
-0.7407496, -1.811705, -2.823829, 0, 0, 0, 1, 1,
-0.7324097, -1.672337, -3.666287, 1, 1, 1, 1, 1,
-0.7283294, -0.2179223, -1.608711, 1, 1, 1, 1, 1,
-0.7259868, -2.66235, -3.589355, 1, 1, 1, 1, 1,
-0.7191457, -0.2140103, -1.910977, 1, 1, 1, 1, 1,
-0.7178175, 1.203508, -0.1844522, 1, 1, 1, 1, 1,
-0.7137213, 0.06517181, -0.8252682, 1, 1, 1, 1, 1,
-0.7120233, 0.9029105, 0.200012, 1, 1, 1, 1, 1,
-0.7092271, 0.294395, -0.0181154, 1, 1, 1, 1, 1,
-0.7056202, 0.3587864, -1.855829, 1, 1, 1, 1, 1,
-0.704839, -0.9888009, -2.636072, 1, 1, 1, 1, 1,
-0.7029675, 1.082265, 0.9403629, 1, 1, 1, 1, 1,
-0.7023159, -0.1553675, -3.395432, 1, 1, 1, 1, 1,
-0.7023028, 1.409078, -0.73785, 1, 1, 1, 1, 1,
-0.7011814, 0.1159071, -2.165109, 1, 1, 1, 1, 1,
-0.7011502, 0.1397958, -0.6579929, 1, 1, 1, 1, 1,
-0.6978843, 1.114236, -1.981112, 0, 0, 1, 1, 1,
-0.6960849, -0.08190461, -1.755051, 1, 0, 0, 1, 1,
-0.6893466, 0.06662353, -2.949285, 1, 0, 0, 1, 1,
-0.6880291, 0.1166168, -1.872069, 1, 0, 0, 1, 1,
-0.6820063, 0.4159954, -1.102025, 1, 0, 0, 1, 1,
-0.6786341, -0.9683813, -0.4375978, 1, 0, 0, 1, 1,
-0.6779638, -0.01079231, -1.113623, 0, 0, 0, 1, 1,
-0.6749483, -0.3621596, -2.143392, 0, 0, 0, 1, 1,
-0.6748655, -0.176571, -0.5825865, 0, 0, 0, 1, 1,
-0.6745679, 0.3351046, -0.8722728, 0, 0, 0, 1, 1,
-0.6723536, 0.5408307, -1.944266, 0, 0, 0, 1, 1,
-0.6681409, 0.02837109, -1.385615, 0, 0, 0, 1, 1,
-0.6664285, -0.4006881, -2.219481, 0, 0, 0, 1, 1,
-0.6636159, -0.6667594, -1.796229, 1, 1, 1, 1, 1,
-0.6619024, 0.5481397, -1.764102, 1, 1, 1, 1, 1,
-0.6581393, -0.5668123, -2.61488, 1, 1, 1, 1, 1,
-0.6529781, -0.9781579, -3.315302, 1, 1, 1, 1, 1,
-0.6482267, 0.006196576, -1.931412, 1, 1, 1, 1, 1,
-0.6476639, -1.791244, -4.063465, 1, 1, 1, 1, 1,
-0.6476607, 1.579255, -0.6606202, 1, 1, 1, 1, 1,
-0.6476554, -1.943626, -4.224101, 1, 1, 1, 1, 1,
-0.6468652, 1.533298, -0.6765202, 1, 1, 1, 1, 1,
-0.6415061, -1.491056, -2.638055, 1, 1, 1, 1, 1,
-0.6404272, 0.8723217, -1.448991, 1, 1, 1, 1, 1,
-0.6397826, -0.3298804, -2.269922, 1, 1, 1, 1, 1,
-0.6396208, 0.4421418, -0.1962663, 1, 1, 1, 1, 1,
-0.6354055, -1.916979, -2.425892, 1, 1, 1, 1, 1,
-0.6340747, 1.467086, -0.6873409, 1, 1, 1, 1, 1,
-0.6283258, 0.9164666, -0.3160964, 0, 0, 1, 1, 1,
-0.6223161, 0.8506203, -1.260293, 1, 0, 0, 1, 1,
-0.6211504, -0.1309433, -3.465861, 1, 0, 0, 1, 1,
-0.6204994, -0.3806562, -1.615018, 1, 0, 0, 1, 1,
-0.6197889, -0.6273816, -1.622686, 1, 0, 0, 1, 1,
-0.6184773, 1.752074, 0.602156, 1, 0, 0, 1, 1,
-0.6183289, 1.971818, 0.1841202, 0, 0, 0, 1, 1,
-0.6162286, -0.09177956, -1.537745, 0, 0, 0, 1, 1,
-0.611365, 0.1850852, -0.8583697, 0, 0, 0, 1, 1,
-0.6108348, -1.446862, -2.035478, 0, 0, 0, 1, 1,
-0.6077349, 1.044643, -0.7304249, 0, 0, 0, 1, 1,
-0.6072727, 0.7024016, 1.366651, 0, 0, 0, 1, 1,
-0.5978568, 0.0529064, 0.1650391, 0, 0, 0, 1, 1,
-0.5958036, 0.9958361, -0.1023283, 1, 1, 1, 1, 1,
-0.5922871, 1.443303, -1.280282, 1, 1, 1, 1, 1,
-0.5919705, 0.4345303, 0.210987, 1, 1, 1, 1, 1,
-0.5912965, 1.128289, -0.8117592, 1, 1, 1, 1, 1,
-0.5912793, 0.3934087, -0.7976331, 1, 1, 1, 1, 1,
-0.5907518, -0.001989904, -1.112731, 1, 1, 1, 1, 1,
-0.5882108, 0.9668679, -1.845488, 1, 1, 1, 1, 1,
-0.5867578, 1.420813, 2.146365, 1, 1, 1, 1, 1,
-0.5862369, -1.059708, -2.612187, 1, 1, 1, 1, 1,
-0.5860118, 0.6405517, -1.032679, 1, 1, 1, 1, 1,
-0.5857352, -0.157272, -0.5627266, 1, 1, 1, 1, 1,
-0.5829549, 1.36473, -0.5513074, 1, 1, 1, 1, 1,
-0.5808694, 1.002884, -0.9739882, 1, 1, 1, 1, 1,
-0.5785872, -2.099016, -2.084415, 1, 1, 1, 1, 1,
-0.5677974, -1.123824, -0.5243757, 1, 1, 1, 1, 1,
-0.5668499, -1.340626, -2.077815, 0, 0, 1, 1, 1,
-0.5642878, -0.8676726, -2.208798, 1, 0, 0, 1, 1,
-0.5625582, -0.8898767, -2.072108, 1, 0, 0, 1, 1,
-0.5611612, 0.7602211, -0.5439577, 1, 0, 0, 1, 1,
-0.5590389, -0.8720523, -1.890656, 1, 0, 0, 1, 1,
-0.5582924, -2.375758, -4.512162, 1, 0, 0, 1, 1,
-0.5544965, 0.3203736, -0.945662, 0, 0, 0, 1, 1,
-0.5455897, -1.720601, -3.953034, 0, 0, 0, 1, 1,
-0.5453349, -0.3600233, -2.953976, 0, 0, 0, 1, 1,
-0.5433599, 0.1410311, -1.974202, 0, 0, 0, 1, 1,
-0.5430444, 0.8034959, -0.7471329, 0, 0, 0, 1, 1,
-0.5283913, 1.446447, 0.8562008, 0, 0, 0, 1, 1,
-0.5240131, -0.3966045, -3.291738, 0, 0, 0, 1, 1,
-0.5179638, -2.006808, -3.851425, 1, 1, 1, 1, 1,
-0.517752, -0.6937242, -3.58645, 1, 1, 1, 1, 1,
-0.5150585, 0.1817385, -0.6464155, 1, 1, 1, 1, 1,
-0.5140105, -0.1269899, -1.269578, 1, 1, 1, 1, 1,
-0.5112302, 0.1642903, -2.095043, 1, 1, 1, 1, 1,
-0.4979308, 0.2945186, -1.125226, 1, 1, 1, 1, 1,
-0.4979171, 1.003413, -1.000853, 1, 1, 1, 1, 1,
-0.4959904, 0.6489145, -0.3031938, 1, 1, 1, 1, 1,
-0.4934706, 0.3704777, -0.69906, 1, 1, 1, 1, 1,
-0.4924574, 1.060378, 0.04529721, 1, 1, 1, 1, 1,
-0.4865728, -2.732557, -0.4765541, 1, 1, 1, 1, 1,
-0.4860641, -0.6451065, -3.364238, 1, 1, 1, 1, 1,
-0.4810329, 2.09334, 0.2037656, 1, 1, 1, 1, 1,
-0.4787964, -1.673144, -2.953847, 1, 1, 1, 1, 1,
-0.4681157, 0.5496731, -0.4133236, 1, 1, 1, 1, 1,
-0.4562477, 0.4117275, -1.410926, 0, 0, 1, 1, 1,
-0.4480563, -0.7217835, -1.470855, 1, 0, 0, 1, 1,
-0.4424534, -1.026596, -3.314647, 1, 0, 0, 1, 1,
-0.4388604, -0.3256544, -3.430399, 1, 0, 0, 1, 1,
-0.4381832, -1.304051, -1.52165, 1, 0, 0, 1, 1,
-0.4378036, 0.1716784, 1.641718, 1, 0, 0, 1, 1,
-0.4262916, -0.340445, -1.157058, 0, 0, 0, 1, 1,
-0.4236883, 0.823371, 0.1702533, 0, 0, 0, 1, 1,
-0.4223266, 0.1032956, -3.269976, 0, 0, 0, 1, 1,
-0.4198945, -0.6590151, -4.153262, 0, 0, 0, 1, 1,
-0.4175314, -0.8504049, -2.345698, 0, 0, 0, 1, 1,
-0.415354, 0.5306112, -0.5934359, 0, 0, 0, 1, 1,
-0.4136334, -1.048844, -2.067671, 0, 0, 0, 1, 1,
-0.4065566, 1.754904, 0.6264051, 1, 1, 1, 1, 1,
-0.4015685, 0.358868, -1.09411, 1, 1, 1, 1, 1,
-0.3892446, 1.306988, 1.355757, 1, 1, 1, 1, 1,
-0.3888654, -0.4110635, -0.4652314, 1, 1, 1, 1, 1,
-0.3887312, 1.941079, 0.3124108, 1, 1, 1, 1, 1,
-0.3866388, -0.3921608, -0.7137456, 1, 1, 1, 1, 1,
-0.3864213, -0.9066692, -2.609597, 1, 1, 1, 1, 1,
-0.3825351, -0.8218915, -2.853965, 1, 1, 1, 1, 1,
-0.3789327, -0.08886833, -1.812992, 1, 1, 1, 1, 1,
-0.3781835, -0.8116705, -1.493758, 1, 1, 1, 1, 1,
-0.3775031, 1.149965, -2.265719, 1, 1, 1, 1, 1,
-0.3773557, -0.9456859, -2.595917, 1, 1, 1, 1, 1,
-0.3754612, 1.166905, -0.1341089, 1, 1, 1, 1, 1,
-0.37444, -0.8743585, -2.941158, 1, 1, 1, 1, 1,
-0.3727337, -0.9259644, -2.282736, 1, 1, 1, 1, 1,
-0.3702066, 0.4731114, -0.138336, 0, 0, 1, 1, 1,
-0.3685399, 1.440688, 1.901704, 1, 0, 0, 1, 1,
-0.3608635, -1.414325, -4.571041, 1, 0, 0, 1, 1,
-0.3602169, -1.059173, -2.104033, 1, 0, 0, 1, 1,
-0.3561392, -0.1675828, -2.772, 1, 0, 0, 1, 1,
-0.3522705, -1.670169, -4.645351, 1, 0, 0, 1, 1,
-0.3498146, -0.2120056, -1.447973, 0, 0, 0, 1, 1,
-0.3492023, 0.6489297, -0.1247142, 0, 0, 0, 1, 1,
-0.3457583, 1.306985, -1.526674, 0, 0, 0, 1, 1,
-0.3439899, -1.055592, -2.722168, 0, 0, 0, 1, 1,
-0.3428415, 0.5126636, -0.3289994, 0, 0, 0, 1, 1,
-0.3402365, 0.4373152, -1.224747, 0, 0, 0, 1, 1,
-0.3381129, 1.150236, -1.252071, 0, 0, 0, 1, 1,
-0.3378983, -0.2889419, -3.431752, 1, 1, 1, 1, 1,
-0.337086, -1.032643, -2.124455, 1, 1, 1, 1, 1,
-0.3369552, 1.14603, 0.7916479, 1, 1, 1, 1, 1,
-0.3354245, -1.130864, -4.252983, 1, 1, 1, 1, 1,
-0.3328868, -0.5679022, -1.563387, 1, 1, 1, 1, 1,
-0.3290388, 1.353488, -0.3273363, 1, 1, 1, 1, 1,
-0.3256702, 0.524192, -0.497293, 1, 1, 1, 1, 1,
-0.3253877, -1.290547, -1.803566, 1, 1, 1, 1, 1,
-0.3238542, 0.3837992, -0.8847839, 1, 1, 1, 1, 1,
-0.3235849, -1.298013, -2.578525, 1, 1, 1, 1, 1,
-0.3218782, -1.320506, -2.174352, 1, 1, 1, 1, 1,
-0.3208976, 2.153026, -2.39026, 1, 1, 1, 1, 1,
-0.3079052, -0.1392204, -2.126577, 1, 1, 1, 1, 1,
-0.3043388, -0.455016, -2.383291, 1, 1, 1, 1, 1,
-0.3023841, 0.6298621, 0.4963742, 1, 1, 1, 1, 1,
-0.2985011, -0.5311084, -2.714143, 0, 0, 1, 1, 1,
-0.2909241, -0.1397266, -0.9122459, 1, 0, 0, 1, 1,
-0.2872995, -0.5303634, -4.247548, 1, 0, 0, 1, 1,
-0.2816885, -2.450886, -2.598889, 1, 0, 0, 1, 1,
-0.2786597, -0.6008638, -3.00261, 1, 0, 0, 1, 1,
-0.2784774, 0.1429202, -1.552762, 1, 0, 0, 1, 1,
-0.2754848, -1.717907, -1.700568, 0, 0, 0, 1, 1,
-0.2672252, -0.4067433, -2.019874, 0, 0, 0, 1, 1,
-0.2666168, -1.733434, -3.620624, 0, 0, 0, 1, 1,
-0.2614798, -1.808513, -2.385125, 0, 0, 0, 1, 1,
-0.2587257, -0.9996054, -1.715422, 0, 0, 0, 1, 1,
-0.2555253, 1.153235, -0.1423585, 0, 0, 0, 1, 1,
-0.2553173, -0.4119279, -3.791145, 0, 0, 0, 1, 1,
-0.2515409, -1.085192, -3.725088, 1, 1, 1, 1, 1,
-0.2503179, 0.8551233, -2.215888, 1, 1, 1, 1, 1,
-0.2470238, 0.8955535, -1.408062, 1, 1, 1, 1, 1,
-0.2420449, -0.2889954, -2.056823, 1, 1, 1, 1, 1,
-0.2399164, -0.8038519, -3.12101, 1, 1, 1, 1, 1,
-0.2329216, -1.663937, -4.440016, 1, 1, 1, 1, 1,
-0.2320855, -0.3404346, -4.342437, 1, 1, 1, 1, 1,
-0.2268445, 2.205834, -0.1661924, 1, 1, 1, 1, 1,
-0.2261994, 0.6750458, -0.02937012, 1, 1, 1, 1, 1,
-0.2243114, -1.347845, -3.783719, 1, 1, 1, 1, 1,
-0.2205302, -0.7354751, -2.081641, 1, 1, 1, 1, 1,
-0.215729, 0.385641, 1.93641, 1, 1, 1, 1, 1,
-0.2142243, -0.816523, -2.151082, 1, 1, 1, 1, 1,
-0.2141018, 0.116301, -0.6380705, 1, 1, 1, 1, 1,
-0.2072803, 1.222888, -0.1596531, 1, 1, 1, 1, 1,
-0.2049819, -0.2882483, -3.347808, 0, 0, 1, 1, 1,
-0.2021196, 1.259564, -0.5799291, 1, 0, 0, 1, 1,
-0.2009219, 0.7928317, 2.324774, 1, 0, 0, 1, 1,
-0.198105, -0.460574, -2.664578, 1, 0, 0, 1, 1,
-0.1978749, 0.761877, 0.4442256, 1, 0, 0, 1, 1,
-0.1971589, -1.397977, -2.627539, 1, 0, 0, 1, 1,
-0.195257, -0.6189481, -2.48189, 0, 0, 0, 1, 1,
-0.1875049, 0.5141298, -1.130985, 0, 0, 0, 1, 1,
-0.1799495, 0.4742517, 0.2954169, 0, 0, 0, 1, 1,
-0.1781459, -1.226854, -3.638028, 0, 0, 0, 1, 1,
-0.17306, 1.837804, -0.1276689, 0, 0, 0, 1, 1,
-0.1693744, 2.775968, 0.4777698, 0, 0, 0, 1, 1,
-0.1656769, 0.03411933, -2.497098, 0, 0, 0, 1, 1,
-0.1652994, 0.4943928, 0.7463741, 1, 1, 1, 1, 1,
-0.1650129, -1.446135, -0.8336576, 1, 1, 1, 1, 1,
-0.1643696, -1.54876, -3.804954, 1, 1, 1, 1, 1,
-0.1640141, -0.7903579, -2.963568, 1, 1, 1, 1, 1,
-0.163495, -0.356296, -2.674538, 1, 1, 1, 1, 1,
-0.1633737, 1.757308, 1.711606, 1, 1, 1, 1, 1,
-0.1631486, -0.686774, -2.66793, 1, 1, 1, 1, 1,
-0.1594961, -0.1366894, -3.242975, 1, 1, 1, 1, 1,
-0.1567644, 0.136576, 0.2811016, 1, 1, 1, 1, 1,
-0.1550084, 0.6927161, 0.8111209, 1, 1, 1, 1, 1,
-0.1547857, 1.351835, -1.417524, 1, 1, 1, 1, 1,
-0.1546391, -0.259004, -1.635031, 1, 1, 1, 1, 1,
-0.1523054, 0.6511036, -0.5252706, 1, 1, 1, 1, 1,
-0.151515, 0.2014648, -0.1618304, 1, 1, 1, 1, 1,
-0.149459, 0.1665075, -1.798113, 1, 1, 1, 1, 1,
-0.148527, -0.2755397, -2.411064, 0, 0, 1, 1, 1,
-0.1456188, 1.437852, 1.563158, 1, 0, 0, 1, 1,
-0.1455165, 0.3454084, -0.2006474, 1, 0, 0, 1, 1,
-0.1438463, -0.2364628, -3.204186, 1, 0, 0, 1, 1,
-0.1433414, -1.037555, -2.585365, 1, 0, 0, 1, 1,
-0.1400616, 0.9093773, 0.8364875, 1, 0, 0, 1, 1,
-0.1394272, -0.3650411, -2.453601, 0, 0, 0, 1, 1,
-0.1350868, 1.222113, -0.684288, 0, 0, 0, 1, 1,
-0.1257394, 0.125774, -0.8679636, 0, 0, 0, 1, 1,
-0.1232756, 1.103686, 0.2105216, 0, 0, 0, 1, 1,
-0.1201645, 0.2751431, 0.9906288, 0, 0, 0, 1, 1,
-0.118671, 1.34281, 0.5131725, 0, 0, 0, 1, 1,
-0.1184314, 0.3085309, -1.033429, 0, 0, 0, 1, 1,
-0.1176757, -1.320724, -3.774108, 1, 1, 1, 1, 1,
-0.1117251, -0.03716892, -4.358606, 1, 1, 1, 1, 1,
-0.1101382, 0.7583891, -1.205103, 1, 1, 1, 1, 1,
-0.1091918, -0.6948402, -3.427458, 1, 1, 1, 1, 1,
-0.1084162, 0.2446434, -0.9628641, 1, 1, 1, 1, 1,
-0.1057457, -1.509738, -2.249638, 1, 1, 1, 1, 1,
-0.1014186, 0.7323887, -1.137541, 1, 1, 1, 1, 1,
-0.100857, -0.39657, -1.707072, 1, 1, 1, 1, 1,
-0.09831493, -0.2438993, -4.990685, 1, 1, 1, 1, 1,
-0.09627204, 1.004894, -0.1930325, 1, 1, 1, 1, 1,
-0.09109193, 0.08331241, -0.08696903, 1, 1, 1, 1, 1,
-0.08666368, 1.859015, 1.899519, 1, 1, 1, 1, 1,
-0.0851925, 1.022552, -1.48917, 1, 1, 1, 1, 1,
-0.08274952, 0.6267594, -0.0436753, 1, 1, 1, 1, 1,
-0.08173468, 0.7283803, -0.09891545, 1, 1, 1, 1, 1,
-0.08094074, -0.6486211, -2.136641, 0, 0, 1, 1, 1,
-0.07939061, -1.097104, -2.704311, 1, 0, 0, 1, 1,
-0.07753539, -2.07145, -3.56731, 1, 0, 0, 1, 1,
-0.07574455, 1.04503, 0.5164627, 1, 0, 0, 1, 1,
-0.0710579, 2.189915, 1.09522, 1, 0, 0, 1, 1,
-0.06660262, 1.72107, -0.1500646, 1, 0, 0, 1, 1,
-0.06185175, 0.3187093, -1.731404, 0, 0, 0, 1, 1,
-0.06134479, 0.7264523, -0.1884354, 0, 0, 0, 1, 1,
-0.05844692, 0.8888779, -0.693032, 0, 0, 0, 1, 1,
-0.05194085, -0.4745502, -2.382469, 0, 0, 0, 1, 1,
-0.05153606, 0.3842398, -0.2649711, 0, 0, 0, 1, 1,
-0.05036986, -0.5686237, -2.676705, 0, 0, 0, 1, 1,
-0.04990751, 1.390846, 1.173738, 0, 0, 0, 1, 1,
-0.0482263, -0.09076696, -1.67018, 1, 1, 1, 1, 1,
-0.04534316, 0.1968373, -0.3713998, 1, 1, 1, 1, 1,
-0.04462491, -1.137604, -3.369967, 1, 1, 1, 1, 1,
-0.04322533, -0.0867756, -2.001727, 1, 1, 1, 1, 1,
-0.03889827, 0.3014735, -0.4797916, 1, 1, 1, 1, 1,
-0.03667352, -0.3207309, -2.827636, 1, 1, 1, 1, 1,
-0.03664611, 0.05112972, -0.8799226, 1, 1, 1, 1, 1,
-0.03637213, -0.9662576, -2.087858, 1, 1, 1, 1, 1,
-0.03601719, -1.252765, -2.995567, 1, 1, 1, 1, 1,
-0.03528779, 0.0005901278, -1.915306, 1, 1, 1, 1, 1,
-0.03229995, 0.6474976, 0.5687016, 1, 1, 1, 1, 1,
-0.02893249, -1.177932, -3.492916, 1, 1, 1, 1, 1,
-0.02619453, 1.278799, 0.815645, 1, 1, 1, 1, 1,
-0.02463578, -0.3598523, -4.247084, 1, 1, 1, 1, 1,
-0.0226976, 0.3762288, -0.168048, 1, 1, 1, 1, 1,
-0.02098214, -1.168685, -5.345757, 0, 0, 1, 1, 1,
-0.0200591, 1.262684, -0.1094125, 1, 0, 0, 1, 1,
-0.01885682, 0.9481549, -0.6318297, 1, 0, 0, 1, 1,
-0.01874833, 1.356734, 0.5213242, 1, 0, 0, 1, 1,
-0.01620093, 0.6477811, -0.6369612, 1, 0, 0, 1, 1,
-0.01468593, 0.729371, -0.1674011, 1, 0, 0, 1, 1,
-0.009243579, -0.8427691, -3.21193, 0, 0, 0, 1, 1,
-0.007955424, -1.201961, -2.498055, 0, 0, 0, 1, 1,
-0.004948118, 0.5421819, 0.5550609, 0, 0, 0, 1, 1,
-0.003954872, 1.838609, 0.1550286, 0, 0, 0, 1, 1,
0.003498948, -1.319953, 1.611951, 0, 0, 0, 1, 1,
0.00525872, 0.6905206, -0.5089846, 0, 0, 0, 1, 1,
0.00659698, -1.467224, 1.773014, 0, 0, 0, 1, 1,
0.007901755, -0.06171996, 3.095126, 1, 1, 1, 1, 1,
0.008827556, -0.6508331, 2.760359, 1, 1, 1, 1, 1,
0.01419546, -0.9930435, 3.330767, 1, 1, 1, 1, 1,
0.01430717, -2.294021, 2.589548, 1, 1, 1, 1, 1,
0.01577288, -2.136062, 2.262995, 1, 1, 1, 1, 1,
0.01651815, -0.6818426, 3.893627, 1, 1, 1, 1, 1,
0.01770366, -1.063023, 1.087473, 1, 1, 1, 1, 1,
0.02039497, -1.63829, 3.324565, 1, 1, 1, 1, 1,
0.02143333, 0.4485549, -0.5033235, 1, 1, 1, 1, 1,
0.02270919, -0.4033151, 3.401097, 1, 1, 1, 1, 1,
0.02282357, 1.869812, -1.528663, 1, 1, 1, 1, 1,
0.02538229, 0.2993281, -1.053313, 1, 1, 1, 1, 1,
0.02598369, -1.187468, 2.865059, 1, 1, 1, 1, 1,
0.02681056, -0.7976328, 3.088366, 1, 1, 1, 1, 1,
0.02803712, 0.7494448, -2.022244, 1, 1, 1, 1, 1,
0.03104233, 1.455667, -0.6692781, 0, 0, 1, 1, 1,
0.03258058, -0.6006806, 3.791737, 1, 0, 0, 1, 1,
0.03707926, 0.3943009, 0.5383406, 1, 0, 0, 1, 1,
0.04312662, -0.04643509, 1.146036, 1, 0, 0, 1, 1,
0.04407009, 1.235922, -0.9607221, 1, 0, 0, 1, 1,
0.0451745, 0.02661511, 1.033629, 1, 0, 0, 1, 1,
0.04688922, 0.5339729, -1.085249, 0, 0, 0, 1, 1,
0.04774092, 1.83856, -0.1221995, 0, 0, 0, 1, 1,
0.06798466, 0.1847933, 0.2218607, 0, 0, 0, 1, 1,
0.06896202, 0.8689429, 0.285526, 0, 0, 0, 1, 1,
0.07007412, 1.315661, 0.8452145, 0, 0, 0, 1, 1,
0.07023755, -1.278277, 3.500237, 0, 0, 0, 1, 1,
0.07077242, -1.35043, 1.835467, 0, 0, 0, 1, 1,
0.07284243, 0.01099706, -0.1624696, 1, 1, 1, 1, 1,
0.07401723, -1.212815, 3.069124, 1, 1, 1, 1, 1,
0.07430283, 0.3335114, -0.1357254, 1, 1, 1, 1, 1,
0.07510052, 0.167372, 0.9205207, 1, 1, 1, 1, 1,
0.0752379, -1.154153, 3.212891, 1, 1, 1, 1, 1,
0.07684322, -0.5440487, 2.839499, 1, 1, 1, 1, 1,
0.07850599, 1.227383, 0.5853783, 1, 1, 1, 1, 1,
0.07852375, 1.062666, 0.8252696, 1, 1, 1, 1, 1,
0.07918871, -0.3110446, 2.140897, 1, 1, 1, 1, 1,
0.08249725, -0.9866343, 3.779954, 1, 1, 1, 1, 1,
0.08381705, -0.3215165, 2.31965, 1, 1, 1, 1, 1,
0.08424729, -0.90627, 2.520901, 1, 1, 1, 1, 1,
0.08429945, 1.46411, -1.813239, 1, 1, 1, 1, 1,
0.08779939, -0.3531126, 4.96078, 1, 1, 1, 1, 1,
0.09358452, -1.141213, 3.453707, 1, 1, 1, 1, 1,
0.09508561, 0.5608806, 0.8732545, 0, 0, 1, 1, 1,
0.09584385, -0.5775825, 2.15685, 1, 0, 0, 1, 1,
0.1000976, 1.534047, -1.328119, 1, 0, 0, 1, 1,
0.1019426, -1.086345, 2.663393, 1, 0, 0, 1, 1,
0.1032983, -0.4230744, 3.919673, 1, 0, 0, 1, 1,
0.1059674, 2.761029, 1.384354, 1, 0, 0, 1, 1,
0.1066725, -0.6510903, 1.24697, 0, 0, 0, 1, 1,
0.110987, -0.7443616, 3.852395, 0, 0, 0, 1, 1,
0.111742, 0.03768625, 0.9767849, 0, 0, 0, 1, 1,
0.1132169, -0.4217417, 3.487384, 0, 0, 0, 1, 1,
0.1174385, -0.9546489, 3.131326, 0, 0, 0, 1, 1,
0.1209047, 2.025232, 0.4850436, 0, 0, 0, 1, 1,
0.1217956, 0.1599181, 1.310807, 0, 0, 0, 1, 1,
0.1228793, -1.127623, 1.968842, 1, 1, 1, 1, 1,
0.125184, -1.638483, 4.230458, 1, 1, 1, 1, 1,
0.1257694, 1.677277, -1.895679, 1, 1, 1, 1, 1,
0.1288675, -1.773522, 3.07547, 1, 1, 1, 1, 1,
0.1297161, -1.582261, 2.237244, 1, 1, 1, 1, 1,
0.1298097, -0.4003924, 1.81472, 1, 1, 1, 1, 1,
0.1314762, -0.1262568, 1.32079, 1, 1, 1, 1, 1,
0.1336522, -0.71829, 4.634913, 1, 1, 1, 1, 1,
0.1354091, 0.9794067, 0.7975453, 1, 1, 1, 1, 1,
0.1365621, -0.06653359, 3.305337, 1, 1, 1, 1, 1,
0.1365781, 0.2825944, 0.2677289, 1, 1, 1, 1, 1,
0.1370222, -1.067896, 2.622812, 1, 1, 1, 1, 1,
0.1462088, -0.22543, 3.254844, 1, 1, 1, 1, 1,
0.1530184, -0.2752436, 3.798359, 1, 1, 1, 1, 1,
0.1544877, -0.6497028, 2.362495, 1, 1, 1, 1, 1,
0.1574143, -0.1888544, 2.945283, 0, 0, 1, 1, 1,
0.1593249, 0.1310529, 0.6126768, 1, 0, 0, 1, 1,
0.1599664, 1.638852, 0.6131861, 1, 0, 0, 1, 1,
0.1616834, 0.480872, 2.690169, 1, 0, 0, 1, 1,
0.1627679, -0.08244485, 2.218082, 1, 0, 0, 1, 1,
0.1733085, -0.3362976, 2.795579, 1, 0, 0, 1, 1,
0.1756837, 0.2172689, 1.013621, 0, 0, 0, 1, 1,
0.1779297, -0.7770112, 4.315095, 0, 0, 0, 1, 1,
0.1855439, 0.8791357, 2.67456, 0, 0, 0, 1, 1,
0.1925959, 1.029198, -1.269657, 0, 0, 0, 1, 1,
0.19383, -1.772835, 3.793454, 0, 0, 0, 1, 1,
0.1938911, -1.01112, 4.015025, 0, 0, 0, 1, 1,
0.2051875, 0.3729613, -0.5826101, 0, 0, 0, 1, 1,
0.2068451, 1.964898, -1.691465, 1, 1, 1, 1, 1,
0.2087445, 0.2328144, 2.01773, 1, 1, 1, 1, 1,
0.2136027, -2.093408, 2.912216, 1, 1, 1, 1, 1,
0.2137859, -0.1872896, 2.742285, 1, 1, 1, 1, 1,
0.2152024, -1.310747, 2.876032, 1, 1, 1, 1, 1,
0.2188478, 1.491567, 0.3168915, 1, 1, 1, 1, 1,
0.2225672, 0.4194836, 0.8485743, 1, 1, 1, 1, 1,
0.224526, 0.5015852, -0.9021959, 1, 1, 1, 1, 1,
0.2255563, -2.557668, 4.800846, 1, 1, 1, 1, 1,
0.2303517, -1.142819, 3.742338, 1, 1, 1, 1, 1,
0.2324597, -0.421969, 1.66796, 1, 1, 1, 1, 1,
0.2344622, 0.1838955, -0.06750488, 1, 1, 1, 1, 1,
0.2371441, -0.2002101, 3.161308, 1, 1, 1, 1, 1,
0.2385226, 0.4110639, -0.6456706, 1, 1, 1, 1, 1,
0.239356, 0.9600365, -0.08765439, 1, 1, 1, 1, 1,
0.2406179, -1.051803, 2.862474, 0, 0, 1, 1, 1,
0.2428606, -0.6701449, 4.578968, 1, 0, 0, 1, 1,
0.2431625, -1.155238, 5.258214, 1, 0, 0, 1, 1,
0.2453124, -0.7762767, 1.689152, 1, 0, 0, 1, 1,
0.2501581, 1.849486, 1.26793, 1, 0, 0, 1, 1,
0.2510066, 1.585216, 0.2657505, 1, 0, 0, 1, 1,
0.2554952, 0.6288216, -1.87312, 0, 0, 0, 1, 1,
0.2566074, 0.3286139, 1.670202, 0, 0, 0, 1, 1,
0.2593402, -1.114919, 3.211429, 0, 0, 0, 1, 1,
0.2645489, 0.4036668, 0.6832172, 0, 0, 0, 1, 1,
0.2693288, 0.5336583, 1.015289, 0, 0, 0, 1, 1,
0.2725679, -0.05041098, 0.6361383, 0, 0, 0, 1, 1,
0.2743877, 0.07572811, -0.02943136, 0, 0, 0, 1, 1,
0.2755246, -0.5016122, 4.078893, 1, 1, 1, 1, 1,
0.2833272, -0.9773543, 3.629405, 1, 1, 1, 1, 1,
0.2844333, 0.3138281, 0.5868858, 1, 1, 1, 1, 1,
0.2875693, 0.7662014, 0.7084679, 1, 1, 1, 1, 1,
0.303529, -0.2008196, 2.057672, 1, 1, 1, 1, 1,
0.3041985, -0.9014028, 2.423081, 1, 1, 1, 1, 1,
0.3052365, -0.2079965, 2.248388, 1, 1, 1, 1, 1,
0.3065861, -1.567169, 2.665676, 1, 1, 1, 1, 1,
0.308143, 1.149423, 1.691858, 1, 1, 1, 1, 1,
0.3106006, -1.585034, 4.309774, 1, 1, 1, 1, 1,
0.3167191, -0.1054725, 0.9074108, 1, 1, 1, 1, 1,
0.3170866, -1.09395, 3.090304, 1, 1, 1, 1, 1,
0.31734, -1.970346, 3.162984, 1, 1, 1, 1, 1,
0.31892, -0.9238577, 2.531591, 1, 1, 1, 1, 1,
0.31979, 1.669531, 0.894294, 1, 1, 1, 1, 1,
0.3276999, -0.1595094, 1.824389, 0, 0, 1, 1, 1,
0.3337095, -0.3642006, 1.546192, 1, 0, 0, 1, 1,
0.3388065, -0.02496263, 2.352738, 1, 0, 0, 1, 1,
0.3402983, -0.8569447, 1.354696, 1, 0, 0, 1, 1,
0.3420009, 2.939673, 0.6945122, 1, 0, 0, 1, 1,
0.3445446, 1.653492, 0.8783522, 1, 0, 0, 1, 1,
0.3446779, 0.9369043, -2.36708, 0, 0, 0, 1, 1,
0.3473737, -1.062332, 2.628722, 0, 0, 0, 1, 1,
0.3531253, -0.4688166, 2.377939, 0, 0, 0, 1, 1,
0.3565124, 0.005878841, 1.822406, 0, 0, 0, 1, 1,
0.3566414, 1.606447, 1.521121, 0, 0, 0, 1, 1,
0.3579499, -1.132706, 3.92444, 0, 0, 0, 1, 1,
0.3595205, 0.01814964, 1.788964, 0, 0, 0, 1, 1,
0.3606425, 1.226475, 1.76241, 1, 1, 1, 1, 1,
0.363052, 0.7500179, -0.2328423, 1, 1, 1, 1, 1,
0.3634566, 1.328146, 1.228593, 1, 1, 1, 1, 1,
0.3637564, 1.19015, -0.6427925, 1, 1, 1, 1, 1,
0.3687054, 1.354336, -0.6531083, 1, 1, 1, 1, 1,
0.3709523, -0.6170414, 2.687561, 1, 1, 1, 1, 1,
0.3852511, 1.622766, 0.5351387, 1, 1, 1, 1, 1,
0.3883081, -1.572615, 3.542039, 1, 1, 1, 1, 1,
0.3909638, 1.114035, 2.221937, 1, 1, 1, 1, 1,
0.392633, -0.5886329, 3.046283, 1, 1, 1, 1, 1,
0.3927199, -1.421611, 3.080935, 1, 1, 1, 1, 1,
0.3950407, -1.40329, 2.737647, 1, 1, 1, 1, 1,
0.3990265, -0.02585243, 1.606215, 1, 1, 1, 1, 1,
0.4020761, 0.8799981, 0.05643295, 1, 1, 1, 1, 1,
0.403223, -1.350139, 2.72532, 1, 1, 1, 1, 1,
0.4082087, -0.4842131, 2.67907, 0, 0, 1, 1, 1,
0.4097401, -0.5926066, 4.579281, 1, 0, 0, 1, 1,
0.4120098, -0.09554233, 1.88321, 1, 0, 0, 1, 1,
0.4153983, -0.542403, 3.160948, 1, 0, 0, 1, 1,
0.4278926, 0.473802, 1.176129, 1, 0, 0, 1, 1,
0.4290139, 0.3211544, 0.2949528, 1, 0, 0, 1, 1,
0.4338338, -0.08254047, 0.7843406, 0, 0, 0, 1, 1,
0.4348408, 0.6826891, 2.129469, 0, 0, 0, 1, 1,
0.4364122, 0.1475449, 1.040685, 0, 0, 0, 1, 1,
0.4389313, -1.15113, 3.604897, 0, 0, 0, 1, 1,
0.4439625, 2.226295, 0.8365189, 0, 0, 0, 1, 1,
0.4480466, 0.2448597, -1.012198, 0, 0, 0, 1, 1,
0.449245, -0.1550044, 1.999867, 0, 0, 0, 1, 1,
0.4492668, -2.332134, 3.131867, 1, 1, 1, 1, 1,
0.4560034, -0.8082828, 2.191625, 1, 1, 1, 1, 1,
0.4621811, -0.3291108, 2.59984, 1, 1, 1, 1, 1,
0.4660569, -0.64496, 3.932212, 1, 1, 1, 1, 1,
0.4673133, -0.4693278, 1.166227, 1, 1, 1, 1, 1,
0.4678921, -0.7331606, 2.421603, 1, 1, 1, 1, 1,
0.4698539, -0.6655213, -0.2235381, 1, 1, 1, 1, 1,
0.4752148, -1.069921, 2.46281, 1, 1, 1, 1, 1,
0.4770291, 0.6329572, -0.8105397, 1, 1, 1, 1, 1,
0.4844413, 1.16826, 2.167916, 1, 1, 1, 1, 1,
0.4882596, -0.4373139, 1.096859, 1, 1, 1, 1, 1,
0.4921286, -0.422073, 2.170563, 1, 1, 1, 1, 1,
0.4931464, -0.8223889, 1.818177, 1, 1, 1, 1, 1,
0.493544, -0.1755817, 2.702049, 1, 1, 1, 1, 1,
0.4937125, -0.2765138, 3.390708, 1, 1, 1, 1, 1,
0.5012087, -0.1046618, 0.9563814, 0, 0, 1, 1, 1,
0.5022731, 0.8234946, 1.166522, 1, 0, 0, 1, 1,
0.5025045, -0.412883, 0.8478716, 1, 0, 0, 1, 1,
0.5057667, 0.9907447, 1.53205, 1, 0, 0, 1, 1,
0.508913, -1.417139, 2.004166, 1, 0, 0, 1, 1,
0.5092312, -0.405016, 2.536803, 1, 0, 0, 1, 1,
0.5099031, 0.160814, 1.910955, 0, 0, 0, 1, 1,
0.5133755, 0.02757933, 1.964369, 0, 0, 0, 1, 1,
0.5155312, 1.01116, -0.451617, 0, 0, 0, 1, 1,
0.5172835, -0.3962939, 4.123383, 0, 0, 0, 1, 1,
0.5180879, 0.7055206, -1.445053, 0, 0, 0, 1, 1,
0.519328, -1.11882, 3.08207, 0, 0, 0, 1, 1,
0.5205586, -1.285733, 4.072136, 0, 0, 0, 1, 1,
0.521516, -0.8086023, 3.134803, 1, 1, 1, 1, 1,
0.5242956, -0.6494051, 1.716456, 1, 1, 1, 1, 1,
0.526749, -0.002325943, 2.806973, 1, 1, 1, 1, 1,
0.5283611, -1.705989, 1.499471, 1, 1, 1, 1, 1,
0.5321646, -0.02212905, 0.3561936, 1, 1, 1, 1, 1,
0.5363338, 0.9863985, 0.1219633, 1, 1, 1, 1, 1,
0.5368561, -0.4321043, 2.729964, 1, 1, 1, 1, 1,
0.5400357, -0.1545635, 1.513593, 1, 1, 1, 1, 1,
0.5402854, 0.7924971, 0.4847785, 1, 1, 1, 1, 1,
0.540608, -0.4519915, 4.839192, 1, 1, 1, 1, 1,
0.5406253, -1.570215, 1.26928, 1, 1, 1, 1, 1,
0.5508366, 1.414728, 0.7307225, 1, 1, 1, 1, 1,
0.5541264, -1.725133, 3.346417, 1, 1, 1, 1, 1,
0.5546963, 1.080029, -0.03434172, 1, 1, 1, 1, 1,
0.5558774, 0.7613786, -0.6424659, 1, 1, 1, 1, 1,
0.5561633, -0.05897361, 1.234547, 0, 0, 1, 1, 1,
0.556232, 0.9492527, -0.3423915, 1, 0, 0, 1, 1,
0.559096, -0.6776643, 3.467066, 1, 0, 0, 1, 1,
0.5625256, -0.2724495, 2.386914, 1, 0, 0, 1, 1,
0.56398, 1.068936, 1.550751, 1, 0, 0, 1, 1,
0.5641594, -0.5554787, 3.175438, 1, 0, 0, 1, 1,
0.56868, -0.01681817, 0.8915437, 0, 0, 0, 1, 1,
0.572162, -0.3996213, 2.695384, 0, 0, 0, 1, 1,
0.5788369, -0.6793738, 1.852564, 0, 0, 0, 1, 1,
0.5846885, -0.1737734, 2.965867, 0, 0, 0, 1, 1,
0.5873417, 0.6481924, -0.3784937, 0, 0, 0, 1, 1,
0.5918052, 0.3729733, -0.3367365, 0, 0, 0, 1, 1,
0.597054, -0.3157108, -0.451112, 0, 0, 0, 1, 1,
0.5982458, -1.312974, 2.511436, 1, 1, 1, 1, 1,
0.6010773, 1.604492, 0.02113773, 1, 1, 1, 1, 1,
0.6152717, -0.769796, 1.731569, 1, 1, 1, 1, 1,
0.6188369, 0.5812992, -0.9100345, 1, 1, 1, 1, 1,
0.6204632, -0.1662511, 1.011573, 1, 1, 1, 1, 1,
0.6228297, -1.255492, 2.038653, 1, 1, 1, 1, 1,
0.6260107, 0.1690183, 2.293424, 1, 1, 1, 1, 1,
0.6287467, -2.005314, 2.369563, 1, 1, 1, 1, 1,
0.6324635, -0.0325563, 2.993379, 1, 1, 1, 1, 1,
0.6327055, -1.189223, 3.198563, 1, 1, 1, 1, 1,
0.6335955, -0.5742069, 1.910904, 1, 1, 1, 1, 1,
0.6339663, -0.4565222, 0.8639342, 1, 1, 1, 1, 1,
0.6387028, -0.9315996, 3.28433, 1, 1, 1, 1, 1,
0.6447935, -1.270363, 1.847886, 1, 1, 1, 1, 1,
0.6467763, -2.2275, 2.105698, 1, 1, 1, 1, 1,
0.6578722, 0.6737543, -1.543856, 0, 0, 1, 1, 1,
0.6591168, 0.4492641, 0.8149567, 1, 0, 0, 1, 1,
0.6622133, 0.5726588, 2.458023, 1, 0, 0, 1, 1,
0.6673, 2.460612, 0.3981065, 1, 0, 0, 1, 1,
0.6673098, -0.7821989, 1.508159, 1, 0, 0, 1, 1,
0.6719933, 2.001804, -1.261639, 1, 0, 0, 1, 1,
0.6746835, -0.083788, 3.322818, 0, 0, 0, 1, 1,
0.6816496, 1.30528, -0.2164971, 0, 0, 0, 1, 1,
0.6906052, -0.6538752, 1.586558, 0, 0, 0, 1, 1,
0.6906933, 1.962756, 0.09915669, 0, 0, 0, 1, 1,
0.6912138, -1.615802, 3.123485, 0, 0, 0, 1, 1,
0.699068, 0.3969249, 0.1407443, 0, 0, 0, 1, 1,
0.7085313, -0.7300063, 0.8813565, 0, 0, 0, 1, 1,
0.7091459, -0.1467569, 2.137626, 1, 1, 1, 1, 1,
0.7240199, -0.7264395, 2.46909, 1, 1, 1, 1, 1,
0.7298117, -0.7771314, 3.840352, 1, 1, 1, 1, 1,
0.7300951, 0.9851851, 0.9677485, 1, 1, 1, 1, 1,
0.7322433, 0.2993142, 1.246603, 1, 1, 1, 1, 1,
0.7327613, 0.6413463, 1.194681, 1, 1, 1, 1, 1,
0.7351147, 0.8048415, 1.07256, 1, 1, 1, 1, 1,
0.737116, 0.7870777, 2.654748, 1, 1, 1, 1, 1,
0.7406423, 1.73377, -0.8553256, 1, 1, 1, 1, 1,
0.7431054, 1.151067, -0.8290907, 1, 1, 1, 1, 1,
0.7457363, 0.6939792, 2.866873, 1, 1, 1, 1, 1,
0.7464164, 0.5601468, 0.4475758, 1, 1, 1, 1, 1,
0.7488022, 0.2483944, 2.00045, 1, 1, 1, 1, 1,
0.7491749, -0.4228627, 1.296927, 1, 1, 1, 1, 1,
0.7497149, 0.3466409, 2.172323, 1, 1, 1, 1, 1,
0.7503387, 0.6212965, 0.5091444, 0, 0, 1, 1, 1,
0.7559917, -1.707189, 4.060681, 1, 0, 0, 1, 1,
0.773076, 2.592069, 0.6785821, 1, 0, 0, 1, 1,
0.7760521, -1.602827, 2.569074, 1, 0, 0, 1, 1,
0.7769003, 0.7937173, 1.898027, 1, 0, 0, 1, 1,
0.7804158, -0.3418697, 3.008797, 1, 0, 0, 1, 1,
0.7915431, -0.7031003, 3.216763, 0, 0, 0, 1, 1,
0.7941288, -0.001974858, 2.521529, 0, 0, 0, 1, 1,
0.7978305, 0.4613821, 2.631063, 0, 0, 0, 1, 1,
0.8013626, 0.570878, 0.342342, 0, 0, 0, 1, 1,
0.8036329, 0.1770095, 1.080322, 0, 0, 0, 1, 1,
0.811376, 0.2711271, 0.427833, 0, 0, 0, 1, 1,
0.8130138, -0.2776363, 1.70194, 0, 0, 0, 1, 1,
0.8139616, -0.9063655, 2.263323, 1, 1, 1, 1, 1,
0.8161705, 1.458728, 1.648921, 1, 1, 1, 1, 1,
0.827468, -1.51485, 4.204531, 1, 1, 1, 1, 1,
0.8297536, 0.9977441, -0.5986286, 1, 1, 1, 1, 1,
0.8301986, -1.27146, 4.939285, 1, 1, 1, 1, 1,
0.8402888, 0.1848402, 2.071949, 1, 1, 1, 1, 1,
0.8421634, -0.2882407, 0.7991502, 1, 1, 1, 1, 1,
0.8425954, 0.1485659, 1.501822, 1, 1, 1, 1, 1,
0.8441286, -0.4971011, 2.835906, 1, 1, 1, 1, 1,
0.8445683, 0.5737104, 3.015442, 1, 1, 1, 1, 1,
0.8487219, -0.5558119, 3.331081, 1, 1, 1, 1, 1,
0.8605576, -0.1996391, 1.897461, 1, 1, 1, 1, 1,
0.8606547, 1.135899, -1.55204, 1, 1, 1, 1, 1,
0.8612285, 0.505504, 0.7758837, 1, 1, 1, 1, 1,
0.8725371, 0.4839835, -0.1094669, 1, 1, 1, 1, 1,
0.8725578, -0.8947716, 2.130031, 0, 0, 1, 1, 1,
0.8761569, -0.8779962, 2.801352, 1, 0, 0, 1, 1,
0.8784025, -0.9507598, 2.633211, 1, 0, 0, 1, 1,
0.880922, -0.825965, 3.581796, 1, 0, 0, 1, 1,
0.8849426, 0.6957645, 1.680389, 1, 0, 0, 1, 1,
0.8866681, 0.5615631, 0.8931587, 1, 0, 0, 1, 1,
0.8897492, 2.59567, -1.151004, 0, 0, 0, 1, 1,
0.8982562, -0.03728843, 2.982589, 0, 0, 0, 1, 1,
0.9013575, 0.6826372, 0.9505925, 0, 0, 0, 1, 1,
0.9017051, -1.452558, 1.911366, 0, 0, 0, 1, 1,
0.9098398, 1.42277, 0.5683991, 0, 0, 0, 1, 1,
0.9111084, 0.4937153, 0.01833952, 0, 0, 0, 1, 1,
0.9171469, -0.7689311, 2.260137, 0, 0, 0, 1, 1,
0.9171975, 0.0293601, 3.513878, 1, 1, 1, 1, 1,
0.9212032, 0.601811, 1.562263, 1, 1, 1, 1, 1,
0.9308254, -0.6132196, 1.494012, 1, 1, 1, 1, 1,
0.9403034, 0.7632425, 0.9317126, 1, 1, 1, 1, 1,
0.9422514, 0.2173116, 2.138632, 1, 1, 1, 1, 1,
0.9500031, -0.6045306, 0.9701524, 1, 1, 1, 1, 1,
0.9507999, -1.165025, 2.830895, 1, 1, 1, 1, 1,
0.9539167, -0.6848962, 0.8489836, 1, 1, 1, 1, 1,
0.9561779, -0.4473642, 2.077046, 1, 1, 1, 1, 1,
0.9616212, -0.1165035, 1.343529, 1, 1, 1, 1, 1,
0.9632586, 0.1947628, 1.674022, 1, 1, 1, 1, 1,
0.9671401, -0.402217, 2.410356, 1, 1, 1, 1, 1,
0.9706647, 0.05565279, 1.03931, 1, 1, 1, 1, 1,
0.9728874, -0.2983134, 3.009822, 1, 1, 1, 1, 1,
0.9734831, -3.315431, 2.538624, 1, 1, 1, 1, 1,
0.9757628, 0.5299488, 1.308477, 0, 0, 1, 1, 1,
0.9760747, 0.2695855, 0.2879202, 1, 0, 0, 1, 1,
0.9775629, -0.6588365, 1.309306, 1, 0, 0, 1, 1,
0.9810259, -0.2191653, 1.018635, 1, 0, 0, 1, 1,
0.9817083, -0.8780289, 3.520519, 1, 0, 0, 1, 1,
0.9835669, -0.3319035, 1.573329, 1, 0, 0, 1, 1,
0.9949095, 0.04956781, 2.00898, 0, 0, 0, 1, 1,
1.003475, 0.4952245, 1.145376, 0, 0, 0, 1, 1,
1.006446, -0.4450749, 2.162047, 0, 0, 0, 1, 1,
1.011059, 1.243347, 0.3988979, 0, 0, 0, 1, 1,
1.012885, 0.3770674, 1.580392, 0, 0, 0, 1, 1,
1.01289, 0.2338547, 2.132762, 0, 0, 0, 1, 1,
1.012897, 1.029035, 0.6604029, 0, 0, 0, 1, 1,
1.033599, -2.066833, 3.556519, 1, 1, 1, 1, 1,
1.045322, -0.3788414, 2.214543, 1, 1, 1, 1, 1,
1.045772, -0.5291228, 3.062862, 1, 1, 1, 1, 1,
1.046276, 0.4486537, 1.654008, 1, 1, 1, 1, 1,
1.049369, 0.01240363, 1.229067, 1, 1, 1, 1, 1,
1.058253, -0.9144843, 0.05983675, 1, 1, 1, 1, 1,
1.062824, -0.6457938, 2.215795, 1, 1, 1, 1, 1,
1.063179, 1.229641, -0.7950682, 1, 1, 1, 1, 1,
1.063641, 1.006809, 0.006344776, 1, 1, 1, 1, 1,
1.076423, -1.069037, 2.058038, 1, 1, 1, 1, 1,
1.07853, 0.906785, 0.5039319, 1, 1, 1, 1, 1,
1.079549, -0.1753581, 0.5021085, 1, 1, 1, 1, 1,
1.080147, -0.8199424, 2.247716, 1, 1, 1, 1, 1,
1.083115, 1.428686, 2.734387, 1, 1, 1, 1, 1,
1.092494, 0.9869369, 1.12736, 1, 1, 1, 1, 1,
1.102588, -0.2062302, 1.387898, 0, 0, 1, 1, 1,
1.106376, -0.5364103, 4.078466, 1, 0, 0, 1, 1,
1.106679, 0.03037226, 1.60597, 1, 0, 0, 1, 1,
1.107164, -0.4816817, 1.646346, 1, 0, 0, 1, 1,
1.111479, 0.2778377, 1.529402, 1, 0, 0, 1, 1,
1.122345, -0.9824241, 1.97401, 1, 0, 0, 1, 1,
1.122527, -0.8203816, 0.3305128, 0, 0, 0, 1, 1,
1.122646, -1.436512, 2.78721, 0, 0, 0, 1, 1,
1.123903, -0.4017559, 2.010063, 0, 0, 0, 1, 1,
1.128157, 0.1192403, -0.06237746, 0, 0, 0, 1, 1,
1.135683, 1.017074, -0.5385274, 0, 0, 0, 1, 1,
1.142571, 0.9651331, 1.244453, 0, 0, 0, 1, 1,
1.157683, 0.4929226, 0.4668207, 0, 0, 0, 1, 1,
1.166923, 0.1741972, 2.06333, 1, 1, 1, 1, 1,
1.168451, -0.06238496, 1.596705, 1, 1, 1, 1, 1,
1.169004, 1.098757, 1.096815, 1, 1, 1, 1, 1,
1.170478, 0.06171357, 2.201007, 1, 1, 1, 1, 1,
1.173784, 0.6214753, 0.7581444, 1, 1, 1, 1, 1,
1.174851, 0.781772, -0.4916238, 1, 1, 1, 1, 1,
1.176772, 1.356135, -0.2566714, 1, 1, 1, 1, 1,
1.184061, -0.31023, 3.82701, 1, 1, 1, 1, 1,
1.184545, 1.201111, 0.5987152, 1, 1, 1, 1, 1,
1.218208, 1.669971, 0.178273, 1, 1, 1, 1, 1,
1.220117, 1.424996, 0.7705384, 1, 1, 1, 1, 1,
1.22724, 1.497012, 0.2441565, 1, 1, 1, 1, 1,
1.234858, 0.311662, 2.370514, 1, 1, 1, 1, 1,
1.238324, -0.3672558, 1.389294, 1, 1, 1, 1, 1,
1.238858, -0.3146628, 2.10453, 1, 1, 1, 1, 1,
1.2435, -1.847774, 1.470537, 0, 0, 1, 1, 1,
1.244826, -0.8070586, 2.323186, 1, 0, 0, 1, 1,
1.266242, 1.295642, 1.483428, 1, 0, 0, 1, 1,
1.271405, 0.052666, 1.740893, 1, 0, 0, 1, 1,
1.303694, -0.1747174, 3.395533, 1, 0, 0, 1, 1,
1.305332, 0.4057439, -0.04785133, 1, 0, 0, 1, 1,
1.312817, -0.9597473, 2.123121, 0, 0, 0, 1, 1,
1.313002, 0.2452384, 1.59662, 0, 0, 0, 1, 1,
1.315951, -0.2896155, 0.8401228, 0, 0, 0, 1, 1,
1.317814, -0.1698217, 1.608436, 0, 0, 0, 1, 1,
1.325438, -0.2924282, 3.790158, 0, 0, 0, 1, 1,
1.350466, 0.9180321, 3.571072, 0, 0, 0, 1, 1,
1.356238, 0.5287537, 0.111735, 0, 0, 0, 1, 1,
1.360183, -0.4283918, 3.316769, 1, 1, 1, 1, 1,
1.367903, -0.0174622, 3.76255, 1, 1, 1, 1, 1,
1.370385, -0.6490536, 4.609517, 1, 1, 1, 1, 1,
1.374341, 1.279068, 0.2610529, 1, 1, 1, 1, 1,
1.377008, 0.3601058, 0.3449254, 1, 1, 1, 1, 1,
1.37796, 2.297201, 1.950953, 1, 1, 1, 1, 1,
1.378769, 1.099496, 0.3126767, 1, 1, 1, 1, 1,
1.392266, -0.3774455, 1.589056, 1, 1, 1, 1, 1,
1.396015, 1.210611, -0.9093643, 1, 1, 1, 1, 1,
1.404578, 0.2864048, 1.075963, 1, 1, 1, 1, 1,
1.423485, 0.1040127, 2.240414, 1, 1, 1, 1, 1,
1.424866, -0.1167802, 1.562535, 1, 1, 1, 1, 1,
1.426183, -3.018757, 2.84536, 1, 1, 1, 1, 1,
1.428713, 0.3033738, 1.153865, 1, 1, 1, 1, 1,
1.431019, -0.03161493, 2.129371, 1, 1, 1, 1, 1,
1.471119, 0.01968119, 2.179211, 0, 0, 1, 1, 1,
1.471309, -2.603174, -0.7777646, 1, 0, 0, 1, 1,
1.473011, -0.8795367, 1.67181, 1, 0, 0, 1, 1,
1.475582, -1.400799, 3.500008, 1, 0, 0, 1, 1,
1.500374, 0.6344443, 1.286132, 1, 0, 0, 1, 1,
1.500771, 0.3406486, 1.265885, 1, 0, 0, 1, 1,
1.509759, -1.438523, 0.7615991, 0, 0, 0, 1, 1,
1.512019, 1.513422, 0.5410443, 0, 0, 0, 1, 1,
1.527386, -1.243598, 1.771659, 0, 0, 0, 1, 1,
1.534247, -0.4958618, -0.2668315, 0, 0, 0, 1, 1,
1.535733, 1.731276, 1.65794, 0, 0, 0, 1, 1,
1.546759, -1.339168, 0.8887506, 0, 0, 0, 1, 1,
1.559767, -0.978951, 3.921084, 0, 0, 0, 1, 1,
1.564144, -0.2352212, 1.514775, 1, 1, 1, 1, 1,
1.567095, -1.65989, 2.354779, 1, 1, 1, 1, 1,
1.567346, 1.493601, 1.885009, 1, 1, 1, 1, 1,
1.588374, 0.1030132, 2.167266, 1, 1, 1, 1, 1,
1.60338, 0.1274214, 0.08311646, 1, 1, 1, 1, 1,
1.61204, -0.315561, -0.3162963, 1, 1, 1, 1, 1,
1.617581, 1.015006, 0.05131791, 1, 1, 1, 1, 1,
1.619239, -0.1134986, 1.63702, 1, 1, 1, 1, 1,
1.630721, -0.9951783, 1.821706, 1, 1, 1, 1, 1,
1.676242, -1.282699, 0.554577, 1, 1, 1, 1, 1,
1.680745, -0.2156247, 1.173708, 1, 1, 1, 1, 1,
1.68254, 0.8760739, 1.506456, 1, 1, 1, 1, 1,
1.693495, -2.923419, 2.598461, 1, 1, 1, 1, 1,
1.705503, -1.16432, 2.502434, 1, 1, 1, 1, 1,
1.712982, 1.313547, 0.2914191, 1, 1, 1, 1, 1,
1.714288, 0.3810808, 3.740597, 0, 0, 1, 1, 1,
1.741739, 1.445457, 1.540923, 1, 0, 0, 1, 1,
1.757553, -1.369762, 1.921773, 1, 0, 0, 1, 1,
1.763574, 1.238324, 1.309553, 1, 0, 0, 1, 1,
1.805177, 0.2307504, 0.817345, 1, 0, 0, 1, 1,
1.807579, 0.9209556, 0.6188076, 1, 0, 0, 1, 1,
1.849017, -0.1170595, 2.155953, 0, 0, 0, 1, 1,
1.859763, 0.34643, 4.016687, 0, 0, 0, 1, 1,
1.863037, 1.686809, -0.4725396, 0, 0, 0, 1, 1,
1.885149, -2.079527, 3.969054, 0, 0, 0, 1, 1,
1.889046, -1.666387, 1.691027, 0, 0, 0, 1, 1,
1.911747, -1.201803, 1.803472, 0, 0, 0, 1, 1,
1.942811, -0.1986189, 1.599247, 0, 0, 0, 1, 1,
1.97391, -1.290577, 1.91385, 1, 1, 1, 1, 1,
1.980611, 0.3954673, 1.548954, 1, 1, 1, 1, 1,
1.986319, 1.197801, 1.371905, 1, 1, 1, 1, 1,
2.005212, 0.8986653, 1.46267, 1, 1, 1, 1, 1,
2.015671, 0.07383082, 1.210468, 1, 1, 1, 1, 1,
2.016077, -0.7990141, 2.325762, 1, 1, 1, 1, 1,
2.032713, -0.4518036, 2.394113, 1, 1, 1, 1, 1,
2.082338, -0.5787804, 2.092013, 1, 1, 1, 1, 1,
2.094747, -1.676129, 1.180475, 1, 1, 1, 1, 1,
2.099421, 0.8549661, 1.735498, 1, 1, 1, 1, 1,
2.115749, 0.3307108, 0.9644288, 1, 1, 1, 1, 1,
2.137681, -0.01897189, 2.292313, 1, 1, 1, 1, 1,
2.172831, -0.2682781, 1.095854, 1, 1, 1, 1, 1,
2.18888, 0.9471483, 1.645271, 1, 1, 1, 1, 1,
2.193337, -1.556047, 1.246608, 1, 1, 1, 1, 1,
2.224226, -0.7596182, 0.4935306, 0, 0, 1, 1, 1,
2.233525, 1.264146, 0.7514845, 1, 0, 0, 1, 1,
2.256693, -0.5160813, 3.44611, 1, 0, 0, 1, 1,
2.314651, -0.6883423, 2.651448, 1, 0, 0, 1, 1,
2.3206, -1.868181, 1.36098, 1, 0, 0, 1, 1,
2.320716, 1.334969, 1.289425, 1, 0, 0, 1, 1,
2.346159, -0.4549399, 0.3700582, 0, 0, 0, 1, 1,
2.355382, 2.192248, 2.108867, 0, 0, 0, 1, 1,
2.402743, 0.4605798, 0.7441284, 0, 0, 0, 1, 1,
2.413898, 0.5850565, 2.201664, 0, 0, 0, 1, 1,
2.419198, -0.5153819, 1.357534, 0, 0, 0, 1, 1,
2.561682, -0.6764532, 2.828033, 0, 0, 0, 1, 1,
2.635369, -0.8258109, 3.513126, 0, 0, 0, 1, 1,
2.765419, 0.7292249, -0.7903302, 1, 1, 1, 1, 1,
2.770967, 1.362193, 2.007544, 1, 1, 1, 1, 1,
2.798367, 0.2042759, 1.847158, 1, 1, 1, 1, 1,
2.858778, 1.034076, 2.056988, 1, 1, 1, 1, 1,
2.896685, 0.8746035, 1.866226, 1, 1, 1, 1, 1,
2.95479, 0.1012698, -0.585853, 1, 1, 1, 1, 1,
3.288459, 0.7965467, -0.7812908, 1, 1, 1, 1, 1
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
var radius = 9.903897;
var distance = 34.78702;
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
mvMatrix.translate( 0.597141, 0.1878788, 0.07882118 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.78702);
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
