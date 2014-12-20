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
-3.289078, 0.3804635, -1.368799, 1, 0, 0, 1,
-2.739314, -0.09411327, -0.893291, 1, 0.007843138, 0, 1,
-2.732632, -1.933976, 0.5095255, 1, 0.01176471, 0, 1,
-2.535906, 0.9021471, -1.279844, 1, 0.01960784, 0, 1,
-2.455328, -1.056918, -1.283313, 1, 0.02352941, 0, 1,
-2.35881, 0.06287485, -0.7204999, 1, 0.03137255, 0, 1,
-2.332889, 1.065611, -1.519653, 1, 0.03529412, 0, 1,
-2.257921, -0.3062731, -3.16739, 1, 0.04313726, 0, 1,
-2.218651, -0.4687358, 1.162402, 1, 0.04705882, 0, 1,
-2.199789, -1.062194, -1.373318, 1, 0.05490196, 0, 1,
-2.126561, 0.08422884, -1.123768, 1, 0.05882353, 0, 1,
-2.09043, 0.2504249, -2.487782, 1, 0.06666667, 0, 1,
-2.023745, -1.018503, -1.595277, 1, 0.07058824, 0, 1,
-2.023026, 0.962393, 0.7498966, 1, 0.07843138, 0, 1,
-2.022033, -0.3213293, -2.717912, 1, 0.08235294, 0, 1,
-2.018861, -0.7133212, -1.605, 1, 0.09019608, 0, 1,
-1.994074, 0.2688142, -1.493154, 1, 0.09411765, 0, 1,
-1.955092, -1.024084, -3.123147, 1, 0.1019608, 0, 1,
-1.954098, -0.2464461, -1.444684, 1, 0.1098039, 0, 1,
-1.935492, -0.4071138, -3.14726, 1, 0.1137255, 0, 1,
-1.883517, -0.1860627, -3.592244, 1, 0.1215686, 0, 1,
-1.870801, -0.1681087, -1.976361, 1, 0.1254902, 0, 1,
-1.851458, -0.08829495, -1.816532, 1, 0.1333333, 0, 1,
-1.834489, 1.042227, -2.298817, 1, 0.1372549, 0, 1,
-1.820199, 0.1531293, -3.34288, 1, 0.145098, 0, 1,
-1.817086, -1.248423, -1.554821, 1, 0.1490196, 0, 1,
-1.798571, 0.06118751, 0.505056, 1, 0.1568628, 0, 1,
-1.780699, 0.7830349, -0.6101996, 1, 0.1607843, 0, 1,
-1.749347, -1.029166, -2.287319, 1, 0.1686275, 0, 1,
-1.733916, 0.5801507, -0.9410635, 1, 0.172549, 0, 1,
-1.721232, 1.042203, 0.2063322, 1, 0.1803922, 0, 1,
-1.716983, 1.440554, -0.409981, 1, 0.1843137, 0, 1,
-1.714804, -0.4292076, -0.32515, 1, 0.1921569, 0, 1,
-1.694613, -1.623845, -4.300339, 1, 0.1960784, 0, 1,
-1.691022, 0.4367713, -1.506953, 1, 0.2039216, 0, 1,
-1.668238, 0.0103941, -1.793373, 1, 0.2117647, 0, 1,
-1.646081, -0.3961717, -2.03533, 1, 0.2156863, 0, 1,
-1.615947, 1.660239, -0.9495453, 1, 0.2235294, 0, 1,
-1.596929, -0.2557794, -1.150566, 1, 0.227451, 0, 1,
-1.596751, -1.76707, -2.488042, 1, 0.2352941, 0, 1,
-1.596021, 0.2120072, -1.093549, 1, 0.2392157, 0, 1,
-1.574715, -0.6303927, -1.14987, 1, 0.2470588, 0, 1,
-1.564349, -1.212694, -1.474538, 1, 0.2509804, 0, 1,
-1.562595, -1.316062, -0.580213, 1, 0.2588235, 0, 1,
-1.560718, 0.5270153, -0.5493449, 1, 0.2627451, 0, 1,
-1.560095, 0.2347109, -0.9111468, 1, 0.2705882, 0, 1,
-1.555207, -1.127902, -3.17376, 1, 0.2745098, 0, 1,
-1.554754, 1.721845, -1.543512, 1, 0.282353, 0, 1,
-1.550279, 1.645832, 0.7846799, 1, 0.2862745, 0, 1,
-1.540611, 0.8424184, -1.571501, 1, 0.2941177, 0, 1,
-1.525214, -1.139318, -3.929843, 1, 0.3019608, 0, 1,
-1.519079, 0.7686948, -1.503407, 1, 0.3058824, 0, 1,
-1.500788, -0.3843452, -2.338458, 1, 0.3137255, 0, 1,
-1.49349, 0.5550383, 0.2728601, 1, 0.3176471, 0, 1,
-1.488219, 0.62873, -1.248315, 1, 0.3254902, 0, 1,
-1.4846, -1.084098, -2.77238, 1, 0.3294118, 0, 1,
-1.482187, 1.498509, -2.582858, 1, 0.3372549, 0, 1,
-1.476675, -0.3330335, -2.960241, 1, 0.3411765, 0, 1,
-1.474973, 0.6720528, -1.141405, 1, 0.3490196, 0, 1,
-1.467609, -1.205878, -2.060062, 1, 0.3529412, 0, 1,
-1.463972, -0.8524438, -3.080141, 1, 0.3607843, 0, 1,
-1.449435, -0.2481432, -0.6781492, 1, 0.3647059, 0, 1,
-1.435385, 0.91043, -1.447802, 1, 0.372549, 0, 1,
-1.415865, 1.561942, 0.8379692, 1, 0.3764706, 0, 1,
-1.403851, -1.872316, -2.086237, 1, 0.3843137, 0, 1,
-1.403251, -0.1649378, -1.385426, 1, 0.3882353, 0, 1,
-1.380183, -0.7517938, -0.6672096, 1, 0.3960784, 0, 1,
-1.374867, -0.1288381, -2.218139, 1, 0.4039216, 0, 1,
-1.347084, -0.5089454, -1.840617, 1, 0.4078431, 0, 1,
-1.344665, 1.009663, 0.06758481, 1, 0.4156863, 0, 1,
-1.343713, -3.496507, -2.397614, 1, 0.4196078, 0, 1,
-1.330193, -2.169511, -1.913656, 1, 0.427451, 0, 1,
-1.318101, -0.6691515, -4.099195, 1, 0.4313726, 0, 1,
-1.309088, 1.084272, 0.6075406, 1, 0.4392157, 0, 1,
-1.299061, 0.02762438, -2.450845, 1, 0.4431373, 0, 1,
-1.2959, -1.032884, -3.579149, 1, 0.4509804, 0, 1,
-1.293164, -0.6800448, -3.025185, 1, 0.454902, 0, 1,
-1.288374, -1.105924, -2.885594, 1, 0.4627451, 0, 1,
-1.280272, -0.6566528, -3.326651, 1, 0.4666667, 0, 1,
-1.278661, -0.4304675, -2.936611, 1, 0.4745098, 0, 1,
-1.264886, -1.219247, -2.659407, 1, 0.4784314, 0, 1,
-1.262618, 0.1690368, -0.887414, 1, 0.4862745, 0, 1,
-1.253358, 0.7388557, 0.05208211, 1, 0.4901961, 0, 1,
-1.250088, -0.2979287, -1.747723, 1, 0.4980392, 0, 1,
-1.24867, -0.1261586, -1.030522, 1, 0.5058824, 0, 1,
-1.248299, -0.7152534, -0.7257479, 1, 0.509804, 0, 1,
-1.243226, -0.1784477, -0.5290366, 1, 0.5176471, 0, 1,
-1.235891, 1.121621, -1.152209, 1, 0.5215687, 0, 1,
-1.231213, -0.4274584, -1.206841, 1, 0.5294118, 0, 1,
-1.22074, 0.2168391, -1.181054, 1, 0.5333334, 0, 1,
-1.220614, 0.8008561, -0.4768869, 1, 0.5411765, 0, 1,
-1.205435, 0.6063873, -0.09130547, 1, 0.5450981, 0, 1,
-1.205377, -0.6142442, -3.31009, 1, 0.5529412, 0, 1,
-1.188943, 1.085071, -1.6502, 1, 0.5568628, 0, 1,
-1.180607, -0.1276054, -0.2214245, 1, 0.5647059, 0, 1,
-1.178468, 0.5284223, 0.01704091, 1, 0.5686275, 0, 1,
-1.173703, -2.185928, -3.34868, 1, 0.5764706, 0, 1,
-1.172473, -0.0366851, -2.759507, 1, 0.5803922, 0, 1,
-1.16895, -0.1976704, -3.384101, 1, 0.5882353, 0, 1,
-1.165663, 1.698135, 0.1040841, 1, 0.5921569, 0, 1,
-1.162583, -0.9735251, -2.467433, 1, 0.6, 0, 1,
-1.147796, 0.8360745, 0.2335621, 1, 0.6078432, 0, 1,
-1.14487, 1.709851, -0.9662403, 1, 0.6117647, 0, 1,
-1.142153, -0.4602252, -1.855579, 1, 0.6196079, 0, 1,
-1.141778, 1.600291, -0.669013, 1, 0.6235294, 0, 1,
-1.140159, -0.4321792, -1.219893, 1, 0.6313726, 0, 1,
-1.135604, -1.427553, -1.858671, 1, 0.6352941, 0, 1,
-1.127339, 1.573887, 0.4209117, 1, 0.6431373, 0, 1,
-1.12493, -0.04117694, 0.2423935, 1, 0.6470588, 0, 1,
-1.113425, 1.144733, -0.5747659, 1, 0.654902, 0, 1,
-1.102469, -0.3312319, -1.351222, 1, 0.6588235, 0, 1,
-1.091042, -1.193815, -1.66036, 1, 0.6666667, 0, 1,
-1.089595, -0.04659703, 0.1164244, 1, 0.6705883, 0, 1,
-1.087409, -0.6211303, -1.572557, 1, 0.6784314, 0, 1,
-1.082035, -0.1058891, -1.241071, 1, 0.682353, 0, 1,
-1.07397, -0.8300133, -3.018711, 1, 0.6901961, 0, 1,
-1.068842, 0.3440025, -0.7937466, 1, 0.6941177, 0, 1,
-1.068405, 0.09713642, -2.290978, 1, 0.7019608, 0, 1,
-1.06835, -0.6485187, -2.538138, 1, 0.7098039, 0, 1,
-1.056957, -1.282882, -3.366029, 1, 0.7137255, 0, 1,
-1.03508, 1.116742, -0.2612957, 1, 0.7215686, 0, 1,
-1.019698, -0.1723865, -0.03852544, 1, 0.7254902, 0, 1,
-1.018542, -1.733518, -4.893132, 1, 0.7333333, 0, 1,
-1.0137, -0.6818344, -2.787842, 1, 0.7372549, 0, 1,
-1.01253, -0.8347287, -1.770586, 1, 0.7450981, 0, 1,
-1.011937, -0.2147378, -2.71216, 1, 0.7490196, 0, 1,
-1.011281, -0.6984938, -2.64578, 1, 0.7568628, 0, 1,
-1.01016, 1.967482, 1.011349, 1, 0.7607843, 0, 1,
-1.008374, 0.3268954, -1.32527, 1, 0.7686275, 0, 1,
-0.9995477, 0.825397, -0.7871757, 1, 0.772549, 0, 1,
-0.9965343, 0.6754295, -0.4242992, 1, 0.7803922, 0, 1,
-0.9872722, 0.2380333, -2.241622, 1, 0.7843137, 0, 1,
-0.986785, 1.864786, -1.00686, 1, 0.7921569, 0, 1,
-0.9838436, -1.054804, -2.787305, 1, 0.7960784, 0, 1,
-0.9773294, -1.302848, -3.222327, 1, 0.8039216, 0, 1,
-0.9633368, 0.585604, 0.3982787, 1, 0.8117647, 0, 1,
-0.963131, 0.4361866, -1.557726, 1, 0.8156863, 0, 1,
-0.9630679, 0.8399447, -0.2391637, 1, 0.8235294, 0, 1,
-0.9592511, 0.05692198, -1.117726, 1, 0.827451, 0, 1,
-0.9555566, -0.736523, -3.624993, 1, 0.8352941, 0, 1,
-0.9505676, 0.467084, -0.8660405, 1, 0.8392157, 0, 1,
-0.9449253, 0.2846962, -2.779299, 1, 0.8470588, 0, 1,
-0.9434482, 1.161701, 0.3719629, 1, 0.8509804, 0, 1,
-0.9416162, 0.05590299, -0.986809, 1, 0.8588235, 0, 1,
-0.9326281, -0.3478143, -1.670528, 1, 0.8627451, 0, 1,
-0.9234996, 0.4158441, -2.519877, 1, 0.8705882, 0, 1,
-0.9234424, 0.2901184, -1.866883, 1, 0.8745098, 0, 1,
-0.9232083, -0.4586601, -1.429434, 1, 0.8823529, 0, 1,
-0.9209729, 0.09189866, -1.040624, 1, 0.8862745, 0, 1,
-0.914528, -0.4147245, -3.105651, 1, 0.8941177, 0, 1,
-0.9122059, 0.4734859, 0.91138, 1, 0.8980392, 0, 1,
-0.9097577, -0.3940618, -2.441319, 1, 0.9058824, 0, 1,
-0.9052998, -0.5889784, -2.716131, 1, 0.9137255, 0, 1,
-0.9026366, -0.7600397, -4.006039, 1, 0.9176471, 0, 1,
-0.9019712, 0.3265879, 0.7182805, 1, 0.9254902, 0, 1,
-0.8949406, 0.7153203, -0.4249408, 1, 0.9294118, 0, 1,
-0.8929435, 1.340895, 1.007457, 1, 0.9372549, 0, 1,
-0.8887603, -0.2970959, -1.5478, 1, 0.9411765, 0, 1,
-0.8845025, 0.953259, 1.418938, 1, 0.9490196, 0, 1,
-0.8839867, -2.296255, -1.189384, 1, 0.9529412, 0, 1,
-0.8763905, 2.067572, -0.1331785, 1, 0.9607843, 0, 1,
-0.876132, 0.6905264, -2.008934, 1, 0.9647059, 0, 1,
-0.869252, -0.6346073, -3.430193, 1, 0.972549, 0, 1,
-0.8679801, 0.9062985, 0.7493468, 1, 0.9764706, 0, 1,
-0.8635498, -1.023785, -0.7011873, 1, 0.9843137, 0, 1,
-0.8605334, -0.9244392, -2.163269, 1, 0.9882353, 0, 1,
-0.8592357, -0.8388082, -2.922705, 1, 0.9960784, 0, 1,
-0.8520295, -1.695837, -2.090477, 0.9960784, 1, 0, 1,
-0.8508683, 1.396587, -0.5109536, 0.9921569, 1, 0, 1,
-0.8503612, -1.382841, -3.751787, 0.9843137, 1, 0, 1,
-0.8502756, 0.224538, -1.545701, 0.9803922, 1, 0, 1,
-0.8413872, 1.918849, -0.1263587, 0.972549, 1, 0, 1,
-0.8410626, -0.6277146, -2.984949, 0.9686275, 1, 0, 1,
-0.8265655, 1.120684, -0.5601962, 0.9607843, 1, 0, 1,
-0.8243021, -0.2530417, -0.1295195, 0.9568627, 1, 0, 1,
-0.8183059, 1.109728, 2.231898, 0.9490196, 1, 0, 1,
-0.8173643, 0.1015818, -0.1973254, 0.945098, 1, 0, 1,
-0.8168996, -1.496073, -2.616745, 0.9372549, 1, 0, 1,
-0.8138805, -1.114455, -2.365035, 0.9333333, 1, 0, 1,
-0.8088487, 0.6224188, -1.731118, 0.9254902, 1, 0, 1,
-0.8074763, 0.7672374, -1.135439, 0.9215686, 1, 0, 1,
-0.8072426, -0.08034078, -3.142832, 0.9137255, 1, 0, 1,
-0.8060046, -0.380571, -3.119881, 0.9098039, 1, 0, 1,
-0.7944162, 0.3253992, -2.931657, 0.9019608, 1, 0, 1,
-0.793713, 0.3156951, -1.474057, 0.8941177, 1, 0, 1,
-0.7932944, -0.2720053, -3.055881, 0.8901961, 1, 0, 1,
-0.7840367, 0.4620343, 0.0499886, 0.8823529, 1, 0, 1,
-0.783288, -1.008066, -1.344258, 0.8784314, 1, 0, 1,
-0.7831952, 0.9196709, -2.49471, 0.8705882, 1, 0, 1,
-0.7812783, -1.385131, -3.714929, 0.8666667, 1, 0, 1,
-0.7793394, 0.7490035, 0.1437191, 0.8588235, 1, 0, 1,
-0.7770541, 0.08721422, -0.8138231, 0.854902, 1, 0, 1,
-0.7755295, 0.2760191, 0.06706682, 0.8470588, 1, 0, 1,
-0.7714484, -1.6707, -2.679077, 0.8431373, 1, 0, 1,
-0.7711829, -0.8963302, -1.752681, 0.8352941, 1, 0, 1,
-0.7586666, 0.01625442, -2.011149, 0.8313726, 1, 0, 1,
-0.75189, 0.9837166, -1.108003, 0.8235294, 1, 0, 1,
-0.7500654, 0.7498462, -1.504193, 0.8196079, 1, 0, 1,
-0.7356899, -1.55739, -2.611109, 0.8117647, 1, 0, 1,
-0.7296947, -0.07968274, -0.862166, 0.8078431, 1, 0, 1,
-0.7176891, 0.7740768, 1.978019, 0.8, 1, 0, 1,
-0.7148004, -1.830792, -1.450799, 0.7921569, 1, 0, 1,
-0.714228, 0.9166898, -2.224659, 0.7882353, 1, 0, 1,
-0.7098334, -0.1526864, -1.239523, 0.7803922, 1, 0, 1,
-0.7087651, -1.293376, -2.222889, 0.7764706, 1, 0, 1,
-0.7038666, -1.346504, -3.9558, 0.7686275, 1, 0, 1,
-0.6939937, 0.8285896, -1.461823, 0.7647059, 1, 0, 1,
-0.6801792, -0.5769703, -0.7481257, 0.7568628, 1, 0, 1,
-0.6798934, -0.1880638, -1.663874, 0.7529412, 1, 0, 1,
-0.6786144, 1.273575, -0.3770752, 0.7450981, 1, 0, 1,
-0.6573879, -0.7916204, -1.921008, 0.7411765, 1, 0, 1,
-0.6545202, -1.337394, -2.681251, 0.7333333, 1, 0, 1,
-0.6512711, -0.8435002, -1.407754, 0.7294118, 1, 0, 1,
-0.650602, 0.07814646, -2.589132, 0.7215686, 1, 0, 1,
-0.6502032, 0.05147888, -0.6929543, 0.7176471, 1, 0, 1,
-0.6499397, 0.1241042, -0.910495, 0.7098039, 1, 0, 1,
-0.6475843, -0.5030482, -0.3495182, 0.7058824, 1, 0, 1,
-0.6438533, -1.009258, -3.580496, 0.6980392, 1, 0, 1,
-0.6433653, -0.9392202, -2.127947, 0.6901961, 1, 0, 1,
-0.6305596, -0.4440585, -1.606526, 0.6862745, 1, 0, 1,
-0.6262612, -0.5749198, -2.751724, 0.6784314, 1, 0, 1,
-0.6254422, 0.3219917, -0.3268205, 0.6745098, 1, 0, 1,
-0.6228359, 0.6264202, 0.02221101, 0.6666667, 1, 0, 1,
-0.6221752, 0.925377, -1.101455, 0.6627451, 1, 0, 1,
-0.620552, 1.453238, -1.860141, 0.654902, 1, 0, 1,
-0.6188029, 0.4820419, -1.462448, 0.6509804, 1, 0, 1,
-0.616455, -0.4951887, -2.582645, 0.6431373, 1, 0, 1,
-0.609319, 1.370458, 0.505519, 0.6392157, 1, 0, 1,
-0.6091471, -0.3103443, -0.5048472, 0.6313726, 1, 0, 1,
-0.5970151, 0.3088683, -0.49376, 0.627451, 1, 0, 1,
-0.5954682, -0.7920276, -1.292199, 0.6196079, 1, 0, 1,
-0.5944538, 0.8724901, -1.025544, 0.6156863, 1, 0, 1,
-0.593262, 1.486214, 0.1332227, 0.6078432, 1, 0, 1,
-0.5929173, 0.4932519, -1.045, 0.6039216, 1, 0, 1,
-0.5890817, 1.258578, 1.215164, 0.5960785, 1, 0, 1,
-0.5856701, -1.21968, -2.399083, 0.5882353, 1, 0, 1,
-0.5817161, 0.1178299, -1.910776, 0.5843138, 1, 0, 1,
-0.5788255, 0.08239739, -2.432273, 0.5764706, 1, 0, 1,
-0.5720868, 0.4732553, -1.56026, 0.572549, 1, 0, 1,
-0.5709476, 0.2876155, 0.08592793, 0.5647059, 1, 0, 1,
-0.5689243, 0.09062944, -0.02438264, 0.5607843, 1, 0, 1,
-0.5616074, 0.07198928, -1.672626, 0.5529412, 1, 0, 1,
-0.5500161, -0.08508228, -2.538497, 0.5490196, 1, 0, 1,
-0.5494817, 0.9956073, 0.2869561, 0.5411765, 1, 0, 1,
-0.5479145, 0.7874566, -0.7080569, 0.5372549, 1, 0, 1,
-0.5425839, 1.314921, -0.05658236, 0.5294118, 1, 0, 1,
-0.5393738, 0.8835203, 1.305623, 0.5254902, 1, 0, 1,
-0.5372704, 0.3151241, -1.689299, 0.5176471, 1, 0, 1,
-0.5372341, -1.46124, -3.94875, 0.5137255, 1, 0, 1,
-0.536503, 1.029306, 0.005555841, 0.5058824, 1, 0, 1,
-0.5356563, -1.540804, -3.30531, 0.5019608, 1, 0, 1,
-0.5344115, -0.9961336, -1.162103, 0.4941176, 1, 0, 1,
-0.5344084, -1.701207, -2.489725, 0.4862745, 1, 0, 1,
-0.5276031, 0.4085239, -0.3235639, 0.4823529, 1, 0, 1,
-0.5250106, 0.3576885, -1.493461, 0.4745098, 1, 0, 1,
-0.5226511, 1.410033, 0.332662, 0.4705882, 1, 0, 1,
-0.5215216, 1.384199, 1.279029, 0.4627451, 1, 0, 1,
-0.516217, -0.2101952, -1.209993, 0.4588235, 1, 0, 1,
-0.5118654, -1.007895, -2.879164, 0.4509804, 1, 0, 1,
-0.5116652, 0.2818359, -2.224636, 0.4470588, 1, 0, 1,
-0.511406, 0.3703779, -3.40822, 0.4392157, 1, 0, 1,
-0.5003244, -0.4217734, -1.910013, 0.4352941, 1, 0, 1,
-0.4993361, 1.580781, 0.4973399, 0.427451, 1, 0, 1,
-0.4987991, 0.4092689, -0.7680841, 0.4235294, 1, 0, 1,
-0.4980953, -0.08126348, -2.164184, 0.4156863, 1, 0, 1,
-0.496432, 1.13599, -0.7858431, 0.4117647, 1, 0, 1,
-0.4961282, -0.1422994, -1.790691, 0.4039216, 1, 0, 1,
-0.4905797, -0.6632861, -2.26163, 0.3960784, 1, 0, 1,
-0.4900587, -1.201233, -1.917077, 0.3921569, 1, 0, 1,
-0.4887582, 1.000467, -0.4490044, 0.3843137, 1, 0, 1,
-0.4837604, 2.720538, -0.5735603, 0.3803922, 1, 0, 1,
-0.4834977, -1.363592, -2.942212, 0.372549, 1, 0, 1,
-0.4798686, 0.1321049, -2.359781, 0.3686275, 1, 0, 1,
-0.4782892, 0.6183996, -0.800519, 0.3607843, 1, 0, 1,
-0.4782126, -1.183014, -0.565849, 0.3568628, 1, 0, 1,
-0.4661805, 0.7101696, -1.882884, 0.3490196, 1, 0, 1,
-0.4633229, 1.560049, -0.9714341, 0.345098, 1, 0, 1,
-0.4628951, -0.026412, -1.704762, 0.3372549, 1, 0, 1,
-0.4593163, 0.3584018, 0.2597235, 0.3333333, 1, 0, 1,
-0.4585434, -0.2683044, -2.681756, 0.3254902, 1, 0, 1,
-0.4557948, 1.24411, -0.5379757, 0.3215686, 1, 0, 1,
-0.4556607, 2.175346, 1.241032, 0.3137255, 1, 0, 1,
-0.455045, -0.04521042, -1.900006, 0.3098039, 1, 0, 1,
-0.4534866, 0.4106708, -0.6729202, 0.3019608, 1, 0, 1,
-0.4517742, -2.503193, -2.436651, 0.2941177, 1, 0, 1,
-0.4507889, -0.2279538, -0.1585567, 0.2901961, 1, 0, 1,
-0.4487777, -0.02526518, -2.091361, 0.282353, 1, 0, 1,
-0.4464757, 0.8229268, 0.4707857, 0.2784314, 1, 0, 1,
-0.4446995, -1.419925, -4.394032, 0.2705882, 1, 0, 1,
-0.4431757, 0.9789932, -1.693321, 0.2666667, 1, 0, 1,
-0.4429045, -1.864074, -1.498526, 0.2588235, 1, 0, 1,
-0.4356509, 1.957616, 0.7977913, 0.254902, 1, 0, 1,
-0.4319271, 1.254852, 1.283741, 0.2470588, 1, 0, 1,
-0.4311494, -0.9950172, -2.846107, 0.2431373, 1, 0, 1,
-0.4190688, -1.536156, -3.557234, 0.2352941, 1, 0, 1,
-0.4173763, 0.220931, -0.03652687, 0.2313726, 1, 0, 1,
-0.4172139, -2.197182, -2.261679, 0.2235294, 1, 0, 1,
-0.4163465, -1.703723, -3.021128, 0.2196078, 1, 0, 1,
-0.4150615, 0.1641277, -2.401599, 0.2117647, 1, 0, 1,
-0.4106785, 1.236034, -0.671218, 0.2078431, 1, 0, 1,
-0.4086908, 0.437626, -1.265742, 0.2, 1, 0, 1,
-0.4020329, -1.78065, -3.140868, 0.1921569, 1, 0, 1,
-0.4009489, 0.3116033, -2.186825, 0.1882353, 1, 0, 1,
-0.3942082, -0.5515468, -2.582243, 0.1803922, 1, 0, 1,
-0.393722, 0.1097988, -1.550036, 0.1764706, 1, 0, 1,
-0.3935059, 0.8486459, -1.523368, 0.1686275, 1, 0, 1,
-0.3921503, -0.6457283, -2.074979, 0.1647059, 1, 0, 1,
-0.3891025, -0.08146942, -1.938495, 0.1568628, 1, 0, 1,
-0.3887394, 0.7273488, -0.09204239, 0.1529412, 1, 0, 1,
-0.38838, -0.3736638, -3.690592, 0.145098, 1, 0, 1,
-0.3872654, -0.7880545, -2.469051, 0.1411765, 1, 0, 1,
-0.3844978, 0.6815397, 0.8853866, 0.1333333, 1, 0, 1,
-0.38164, 1.03794, -3.682299, 0.1294118, 1, 0, 1,
-0.3773672, 1.831784, 1.106598, 0.1215686, 1, 0, 1,
-0.3720738, 0.8713884, -0.7738878, 0.1176471, 1, 0, 1,
-0.3667238, 0.9136549, -0.5614772, 0.1098039, 1, 0, 1,
-0.3656229, -0.645528, -1.606473, 0.1058824, 1, 0, 1,
-0.3633621, -0.9328338, -3.751155, 0.09803922, 1, 0, 1,
-0.3505814, -0.1210038, -1.439747, 0.09019608, 1, 0, 1,
-0.3495589, 0.03841026, -1.371258, 0.08627451, 1, 0, 1,
-0.3474611, -0.2728418, -4.500005, 0.07843138, 1, 0, 1,
-0.3448729, -0.4751269, -3.096825, 0.07450981, 1, 0, 1,
-0.3426625, -0.4652472, -2.99871, 0.06666667, 1, 0, 1,
-0.3419942, 0.8840351, -0.876066, 0.0627451, 1, 0, 1,
-0.3403346, -0.5758646, -2.450802, 0.05490196, 1, 0, 1,
-0.3389973, 0.7443351, -0.7552845, 0.05098039, 1, 0, 1,
-0.3388283, 0.8468281, 0.8531577, 0.04313726, 1, 0, 1,
-0.3388282, 1.012685, -0.8542731, 0.03921569, 1, 0, 1,
-0.3375866, -1.020517, -1.977831, 0.03137255, 1, 0, 1,
-0.3360099, 0.7929268, -0.6354949, 0.02745098, 1, 0, 1,
-0.3358466, 0.2154691, -0.3860242, 0.01960784, 1, 0, 1,
-0.3329321, 1.064901, -0.8263008, 0.01568628, 1, 0, 1,
-0.3308163, 1.549138, 0.009594152, 0.007843138, 1, 0, 1,
-0.3293011, 0.2996357, -0.421531, 0.003921569, 1, 0, 1,
-0.325843, 2.394764, -1.205214, 0, 1, 0.003921569, 1,
-0.3191865, -0.008311829, -1.380324, 0, 1, 0.01176471, 1,
-0.3190717, 0.3703102, -1.97256, 0, 1, 0.01568628, 1,
-0.3103464, -1.832975, -1.473427, 0, 1, 0.02352941, 1,
-0.3070295, 0.6745329, 0.4498304, 0, 1, 0.02745098, 1,
-0.3057587, 0.4825435, -2.482687, 0, 1, 0.03529412, 1,
-0.3007802, -1.401687, -3.524397, 0, 1, 0.03921569, 1,
-0.2971558, -2.017507, -1.855708, 0, 1, 0.04705882, 1,
-0.2927589, 0.3149637, -0.6387183, 0, 1, 0.05098039, 1,
-0.2905448, 0.8146816, -1.457232, 0, 1, 0.05882353, 1,
-0.287362, 0.3973333, 0.1749574, 0, 1, 0.0627451, 1,
-0.2864734, 0.1343925, -1.826573, 0, 1, 0.07058824, 1,
-0.2830539, -1.106107, -4.062715, 0, 1, 0.07450981, 1,
-0.2794238, -0.7653975, -2.729465, 0, 1, 0.08235294, 1,
-0.2766311, -0.3409996, -0.2187537, 0, 1, 0.08627451, 1,
-0.2766259, -0.9778497, -1.40622, 0, 1, 0.09411765, 1,
-0.2724972, -1.81006, -3.545969, 0, 1, 0.1019608, 1,
-0.271245, -0.3531994, -3.280577, 0, 1, 0.1058824, 1,
-0.2696265, -1.030298, -3.317348, 0, 1, 0.1137255, 1,
-0.2694623, -1.163008, -3.572609, 0, 1, 0.1176471, 1,
-0.2680261, -1.075752, -2.694904, 0, 1, 0.1254902, 1,
-0.2653236, -0.3040505, -2.396443, 0, 1, 0.1294118, 1,
-0.2640106, 0.9180345, -0.7053718, 0, 1, 0.1372549, 1,
-0.2636191, 1.454285, 0.4560572, 0, 1, 0.1411765, 1,
-0.263297, 0.7292765, 0.04349232, 0, 1, 0.1490196, 1,
-0.2552021, -0.3372719, -2.41652, 0, 1, 0.1529412, 1,
-0.2513265, 1.272579, -0.2249071, 0, 1, 0.1607843, 1,
-0.2501669, -0.7363243, -2.442649, 0, 1, 0.1647059, 1,
-0.2498838, -0.1407364, -2.23094, 0, 1, 0.172549, 1,
-0.2476795, 0.50219, -0.4598191, 0, 1, 0.1764706, 1,
-0.2426407, -0.5240687, -2.38935, 0, 1, 0.1843137, 1,
-0.2401849, 0.4797374, -0.2505885, 0, 1, 0.1882353, 1,
-0.238171, 0.1677922, -1.31364, 0, 1, 0.1960784, 1,
-0.2373149, 0.2755932, -2.101365, 0, 1, 0.2039216, 1,
-0.2357709, 2.471459, 0.9656343, 0, 1, 0.2078431, 1,
-0.234494, -1.080895, -2.425983, 0, 1, 0.2156863, 1,
-0.233551, 1.60936, -0.9864076, 0, 1, 0.2196078, 1,
-0.2318677, 0.1249386, -1.439128, 0, 1, 0.227451, 1,
-0.2317153, -0.3789012, -3.264898, 0, 1, 0.2313726, 1,
-0.2312701, -1.715976, -3.810965, 0, 1, 0.2392157, 1,
-0.2288983, -1.042805, -3.057765, 0, 1, 0.2431373, 1,
-0.228097, -0.2164061, -3.089011, 0, 1, 0.2509804, 1,
-0.2249361, 1.21843, 0.1029113, 0, 1, 0.254902, 1,
-0.2218276, 0.4770608, 0.8892815, 0, 1, 0.2627451, 1,
-0.2196925, -1.801314, -2.994301, 0, 1, 0.2666667, 1,
-0.2178511, -0.04388535, -3.542227, 0, 1, 0.2745098, 1,
-0.21651, -0.8399442, -2.145324, 0, 1, 0.2784314, 1,
-0.2133648, -0.04538877, -1.797312, 0, 1, 0.2862745, 1,
-0.2129154, 0.2390945, -1.598038, 0, 1, 0.2901961, 1,
-0.209213, 0.002684182, -1.178206, 0, 1, 0.2980392, 1,
-0.208241, 1.064437, -2.214331, 0, 1, 0.3058824, 1,
-0.2059596, -0.7758855, -3.865371, 0, 1, 0.3098039, 1,
-0.2054262, 1.35262, -1.276433, 0, 1, 0.3176471, 1,
-0.2043465, -0.0493265, -0.5567145, 0, 1, 0.3215686, 1,
-0.200699, 0.3247174, 0.796092, 0, 1, 0.3294118, 1,
-0.1982306, -0.2910249, -1.668586, 0, 1, 0.3333333, 1,
-0.1980737, 1.32378, 0.5920417, 0, 1, 0.3411765, 1,
-0.1850165, 0.5214663, 0.3263291, 0, 1, 0.345098, 1,
-0.1843487, -0.9874213, -2.042088, 0, 1, 0.3529412, 1,
-0.1808267, 0.5804211, 2.262017, 0, 1, 0.3568628, 1,
-0.1803778, -0.08019898, -1.747654, 0, 1, 0.3647059, 1,
-0.177539, 0.1463588, -0.4713851, 0, 1, 0.3686275, 1,
-0.1764356, 0.265387, -1.922117, 0, 1, 0.3764706, 1,
-0.1678697, 1.74019, 0.6108974, 0, 1, 0.3803922, 1,
-0.1655803, -0.3050384, -4.345434, 0, 1, 0.3882353, 1,
-0.1651152, -1.046201, -2.964423, 0, 1, 0.3921569, 1,
-0.1646809, 1.015235, -1.27657, 0, 1, 0.4, 1,
-0.1545534, -0.01002118, -1.665717, 0, 1, 0.4078431, 1,
-0.1538469, 0.1147486, -1.945548, 0, 1, 0.4117647, 1,
-0.1448374, 0.005956732, -2.279576, 0, 1, 0.4196078, 1,
-0.1435288, 0.6455046, -0.1703952, 0, 1, 0.4235294, 1,
-0.140681, -0.7488529, -3.171561, 0, 1, 0.4313726, 1,
-0.1367745, 0.00874343, -1.309532, 0, 1, 0.4352941, 1,
-0.1317985, -0.6371279, -2.301717, 0, 1, 0.4431373, 1,
-0.130982, -1.388327, -3.673098, 0, 1, 0.4470588, 1,
-0.1307438, 0.8190972, -1.535557, 0, 1, 0.454902, 1,
-0.1263895, -0.4051242, -2.244, 0, 1, 0.4588235, 1,
-0.1231606, 0.5039685, -1.057307, 0, 1, 0.4666667, 1,
-0.1224613, 0.2011784, -1.139349, 0, 1, 0.4705882, 1,
-0.1221024, -1.73052, -2.236354, 0, 1, 0.4784314, 1,
-0.1178817, -0.5788852, -5.19379, 0, 1, 0.4823529, 1,
-0.1170967, 0.8098516, 1.502238, 0, 1, 0.4901961, 1,
-0.1156951, -0.8359507, -1.840933, 0, 1, 0.4941176, 1,
-0.1153759, 0.1528074, -1.232109, 0, 1, 0.5019608, 1,
-0.1147096, 1.430209, 0.2221268, 0, 1, 0.509804, 1,
-0.1141384, -0.5913528, -1.291067, 0, 1, 0.5137255, 1,
-0.1123614, -0.8700091, -4.116249, 0, 1, 0.5215687, 1,
-0.1114702, -0.008750047, -1.536325, 0, 1, 0.5254902, 1,
-0.105407, 0.9021316, -0.01516601, 0, 1, 0.5333334, 1,
-0.09851426, -0.2564092, -2.497769, 0, 1, 0.5372549, 1,
-0.09496766, -1.270234, -2.919611, 0, 1, 0.5450981, 1,
-0.09134049, -0.7367961, -1.254149, 0, 1, 0.5490196, 1,
-0.08566699, 1.651353, -0.6764754, 0, 1, 0.5568628, 1,
-0.08078616, -0.8576898, -4.546756, 0, 1, 0.5607843, 1,
-0.07599278, 0.9210478, -0.8464596, 0, 1, 0.5686275, 1,
-0.07566375, 0.05106386, -1.564539, 0, 1, 0.572549, 1,
-0.07497014, -1.23862, -2.39623, 0, 1, 0.5803922, 1,
-0.07247873, -0.3108039, -2.863932, 0, 1, 0.5843138, 1,
-0.07149729, 1.647428, -0.7863693, 0, 1, 0.5921569, 1,
-0.06905675, -1.994888, -3.114094, 0, 1, 0.5960785, 1,
-0.06873448, 0.2073442, -0.4256271, 0, 1, 0.6039216, 1,
-0.06747099, 0.8650267, -0.6170059, 0, 1, 0.6117647, 1,
-0.06631815, -1.415385, -1.312067, 0, 1, 0.6156863, 1,
-0.05879737, -0.6002588, -2.994453, 0, 1, 0.6235294, 1,
-0.05816838, 0.1739678, -1.476819, 0, 1, 0.627451, 1,
-0.05692873, 1.126925, -0.3654878, 0, 1, 0.6352941, 1,
-0.05435574, -0.1254034, -2.533547, 0, 1, 0.6392157, 1,
-0.05225234, -0.3984956, -1.307021, 0, 1, 0.6470588, 1,
-0.05022279, 2.624246, 2.041734, 0, 1, 0.6509804, 1,
-0.04759074, -0.4412039, -1.787327, 0, 1, 0.6588235, 1,
-0.04640301, -0.2245189, -2.412309, 0, 1, 0.6627451, 1,
-0.04227131, 0.2304462, 0.1616418, 0, 1, 0.6705883, 1,
-0.04197462, -0.1150307, -3.134785, 0, 1, 0.6745098, 1,
-0.04148312, 0.1117037, -2.235111, 0, 1, 0.682353, 1,
-0.04004773, -0.9495459, -3.656413, 0, 1, 0.6862745, 1,
-0.03474503, -0.3619937, -2.850437, 0, 1, 0.6941177, 1,
-0.02868529, 0.8611028, -1.838155, 0, 1, 0.7019608, 1,
-0.025186, -0.6857612, -3.768185, 0, 1, 0.7058824, 1,
-0.02461386, -0.4745121, -2.419001, 0, 1, 0.7137255, 1,
-0.01838814, 1.086095, -0.5138649, 0, 1, 0.7176471, 1,
-0.01714044, -0.5622184, -3.826095, 0, 1, 0.7254902, 1,
-0.01291314, -1.641607, -2.69471, 0, 1, 0.7294118, 1,
-0.01229358, 0.7386978, 1.600876, 0, 1, 0.7372549, 1,
-0.009774892, 0.1003146, 2.404076, 0, 1, 0.7411765, 1,
-0.008888756, 0.1524597, 0.7011914, 0, 1, 0.7490196, 1,
-0.007343825, -0.09489513, -2.907194, 0, 1, 0.7529412, 1,
-0.006836573, 0.7679125, -1.025313, 0, 1, 0.7607843, 1,
-0.004602813, -0.2876395, -4.247456, 0, 1, 0.7647059, 1,
-0.003148053, 0.9641627, 0.258662, 0, 1, 0.772549, 1,
0.0008131997, 0.3793539, -0.2336778, 0, 1, 0.7764706, 1,
0.001760998, -1.250924, 3.622239, 0, 1, 0.7843137, 1,
0.002939387, -0.4339546, 3.291034, 0, 1, 0.7882353, 1,
0.006261104, 0.2722759, -1.509625, 0, 1, 0.7960784, 1,
0.006646087, -2.041024, 2.926151, 0, 1, 0.8039216, 1,
0.006906368, 1.412749, -0.5055547, 0, 1, 0.8078431, 1,
0.007131109, 0.3990755, 1.157254, 0, 1, 0.8156863, 1,
0.007707283, 1.376696, 0.8818355, 0, 1, 0.8196079, 1,
0.01035525, -2.380425, 3.930559, 0, 1, 0.827451, 1,
0.01254609, 0.2302801, -1.018834, 0, 1, 0.8313726, 1,
0.01257071, 0.7173678, 0.02094564, 0, 1, 0.8392157, 1,
0.01590158, -0.2152218, 3.185025, 0, 1, 0.8431373, 1,
0.02058141, 1.95416, 0.2702307, 0, 1, 0.8509804, 1,
0.0223178, -0.8458287, 4.481483, 0, 1, 0.854902, 1,
0.02331642, -0.5868547, 2.579158, 0, 1, 0.8627451, 1,
0.02740822, 0.1485541, 0.3004206, 0, 1, 0.8666667, 1,
0.02885727, 0.8543239, 0.4275298, 0, 1, 0.8745098, 1,
0.03077701, 0.2330074, -1.580674, 0, 1, 0.8784314, 1,
0.03103998, 0.7228001, -1.401579, 0, 1, 0.8862745, 1,
0.03110277, 2.306468, -0.994325, 0, 1, 0.8901961, 1,
0.03521443, -0.7239875, 3.297904, 0, 1, 0.8980392, 1,
0.0356999, 0.7661415, 0.5659412, 0, 1, 0.9058824, 1,
0.04116507, 0.1138688, 0.4809703, 0, 1, 0.9098039, 1,
0.04338966, -1.021643, 2.493055, 0, 1, 0.9176471, 1,
0.04457413, -1.593677, 2.248665, 0, 1, 0.9215686, 1,
0.04473215, 0.377744, 0.8955982, 0, 1, 0.9294118, 1,
0.04770184, -0.7708486, 2.582795, 0, 1, 0.9333333, 1,
0.05059449, -1.08532, 3.837728, 0, 1, 0.9411765, 1,
0.05243699, 0.779915, -0.5679901, 0, 1, 0.945098, 1,
0.05268311, 0.1011694, 0.347073, 0, 1, 0.9529412, 1,
0.05514492, 0.04706333, 1.013899, 0, 1, 0.9568627, 1,
0.05522818, 0.372436, 1.015983, 0, 1, 0.9647059, 1,
0.05682293, -1.48966, 3.5501, 0, 1, 0.9686275, 1,
0.05809044, -0.4084887, 3.763376, 0, 1, 0.9764706, 1,
0.06107388, 0.6888009, 0.9345632, 0, 1, 0.9803922, 1,
0.06214945, -0.1814829, 2.05949, 0, 1, 0.9882353, 1,
0.0682383, 1.214096, 1.016596, 0, 1, 0.9921569, 1,
0.06978451, -0.3363664, 3.387258, 0, 1, 1, 1,
0.07256468, 1.368621, 0.9040588, 0, 0.9921569, 1, 1,
0.07463213, -1.468419, 3.09675, 0, 0.9882353, 1, 1,
0.07629189, 0.2960483, -0.9263337, 0, 0.9803922, 1, 1,
0.07635964, 1.537677, -0.8254539, 0, 0.9764706, 1, 1,
0.07658218, 0.7699437, -1.750704, 0, 0.9686275, 1, 1,
0.07874889, 0.1247325, -0.1805284, 0, 0.9647059, 1, 1,
0.08213862, -1.371128, 1.549572, 0, 0.9568627, 1, 1,
0.08264016, -1.021338, 3.596893, 0, 0.9529412, 1, 1,
0.09119502, -0.9409677, 2.218419, 0, 0.945098, 1, 1,
0.09170028, -0.2385308, 3.929049, 0, 0.9411765, 1, 1,
0.09357881, -0.7262284, 3.26449, 0, 0.9333333, 1, 1,
0.09430987, 0.07385944, 0.5562666, 0, 0.9294118, 1, 1,
0.09480781, 1.566956, -0.09183893, 0, 0.9215686, 1, 1,
0.09549685, 0.4445759, 0.1316355, 0, 0.9176471, 1, 1,
0.09829395, -1.172565, 3.307455, 0, 0.9098039, 1, 1,
0.1012517, 0.6214967, 0.4381251, 0, 0.9058824, 1, 1,
0.1071794, -0.6488575, 2.650911, 0, 0.8980392, 1, 1,
0.1072684, 1.257336, 2.069341, 0, 0.8901961, 1, 1,
0.1073592, -0.7335266, 2.276449, 0, 0.8862745, 1, 1,
0.1095331, -0.3245184, 4.430824, 0, 0.8784314, 1, 1,
0.1100978, 0.2575676, 1.326506, 0, 0.8745098, 1, 1,
0.1103929, 0.4407894, -1.031242, 0, 0.8666667, 1, 1,
0.1106908, -1.244787, 3.088508, 0, 0.8627451, 1, 1,
0.1133477, -0.1107017, 2.687023, 0, 0.854902, 1, 1,
0.1178046, 1.209208, 1.877506, 0, 0.8509804, 1, 1,
0.1189799, -0.1394193, 2.829615, 0, 0.8431373, 1, 1,
0.1190625, 0.7306073, 0.07647087, 0, 0.8392157, 1, 1,
0.1209997, 0.2125897, -0.5325122, 0, 0.8313726, 1, 1,
0.1216114, -0.03596598, 0.2749133, 0, 0.827451, 1, 1,
0.1261571, -0.9452896, 2.685688, 0, 0.8196079, 1, 1,
0.1271733, 0.6452314, 1.719914, 0, 0.8156863, 1, 1,
0.1292536, 0.5684808, 2.674045, 0, 0.8078431, 1, 1,
0.1326461, 0.09537501, 0.2691268, 0, 0.8039216, 1, 1,
0.1332325, -1.428511, 2.882246, 0, 0.7960784, 1, 1,
0.1375606, -1.551063, 2.503537, 0, 0.7882353, 1, 1,
0.1428395, 0.8220705, 1.519748, 0, 0.7843137, 1, 1,
0.1432945, -0.1627944, 2.539229, 0, 0.7764706, 1, 1,
0.1469452, -0.5383225, 4.048577, 0, 0.772549, 1, 1,
0.1470774, -0.3107656, 3.072379, 0, 0.7647059, 1, 1,
0.1564204, -1.03768, 4.245548, 0, 0.7607843, 1, 1,
0.1580615, 0.384695, 0.6439763, 0, 0.7529412, 1, 1,
0.1589795, -0.2392227, -0.9291531, 0, 0.7490196, 1, 1,
0.1594338, 1.587071, -1.804317, 0, 0.7411765, 1, 1,
0.1639653, 1.067085, -0.7498148, 0, 0.7372549, 1, 1,
0.164255, 1.897597, -0.6951039, 0, 0.7294118, 1, 1,
0.1645097, -0.9962819, 3.211422, 0, 0.7254902, 1, 1,
0.1648126, -0.1446228, 2.315212, 0, 0.7176471, 1, 1,
0.1654217, -0.6024671, 1.755245, 0, 0.7137255, 1, 1,
0.165436, 0.6568795, 1.023535, 0, 0.7058824, 1, 1,
0.1671327, 1.081957, 0.06904317, 0, 0.6980392, 1, 1,
0.1689127, 0.5302846, 0.958327, 0, 0.6941177, 1, 1,
0.172179, -0.2703917, 0.3629133, 0, 0.6862745, 1, 1,
0.1731722, 0.583882, -0.48154, 0, 0.682353, 1, 1,
0.1751573, 1.515594, -0.4005111, 0, 0.6745098, 1, 1,
0.1766384, 2.548925, 0.4314016, 0, 0.6705883, 1, 1,
0.1814943, -0.2467646, 3.408505, 0, 0.6627451, 1, 1,
0.1825778, 0.8240668, 1.645315, 0, 0.6588235, 1, 1,
0.184577, -1.744535, 1.967647, 0, 0.6509804, 1, 1,
0.1928226, -0.8861442, 2.689749, 0, 0.6470588, 1, 1,
0.1945772, 0.4618468, -1.05777, 0, 0.6392157, 1, 1,
0.195197, -0.3500332, 3.492902, 0, 0.6352941, 1, 1,
0.1963128, 0.679713, -0.1361925, 0, 0.627451, 1, 1,
0.1986676, -0.1628845, 3.523983, 0, 0.6235294, 1, 1,
0.2049893, 0.4137231, -0.4362714, 0, 0.6156863, 1, 1,
0.2056756, -0.275134, 1.199732, 0, 0.6117647, 1, 1,
0.2097011, -0.7424567, 3.01849, 0, 0.6039216, 1, 1,
0.2131492, 1.27874, -1.043353, 0, 0.5960785, 1, 1,
0.2135026, 0.2609382, 0.5208096, 0, 0.5921569, 1, 1,
0.2184405, 0.3365585, 1.149251, 0, 0.5843138, 1, 1,
0.2202756, -0.1773016, 0.4712468, 0, 0.5803922, 1, 1,
0.2236407, 1.069942, -0.1938986, 0, 0.572549, 1, 1,
0.2242155, -0.9739685, 2.919175, 0, 0.5686275, 1, 1,
0.2341297, 0.6248914, 1.571845, 0, 0.5607843, 1, 1,
0.235016, 0.3986976, 1.88543, 0, 0.5568628, 1, 1,
0.2448537, -0.5160189, 2.612801, 0, 0.5490196, 1, 1,
0.2452019, -0.6285951, 3.235707, 0, 0.5450981, 1, 1,
0.2495759, -0.1149167, 4.354001, 0, 0.5372549, 1, 1,
0.2500029, -0.9550419, 2.20201, 0, 0.5333334, 1, 1,
0.2508036, -0.05531749, 2.38679, 0, 0.5254902, 1, 1,
0.2523738, -0.656922, 2.553219, 0, 0.5215687, 1, 1,
0.2527294, -0.4185961, 4.369419, 0, 0.5137255, 1, 1,
0.2543397, -0.9898429, 3.527341, 0, 0.509804, 1, 1,
0.2543407, -0.6219767, 3.249798, 0, 0.5019608, 1, 1,
0.2596283, -1.003134, 2.934802, 0, 0.4941176, 1, 1,
0.2667631, 0.8741001, -1.099462, 0, 0.4901961, 1, 1,
0.2668013, 0.5952714, -0.3024086, 0, 0.4823529, 1, 1,
0.2682055, -0.7722134, 3.936289, 0, 0.4784314, 1, 1,
0.2693083, 0.3526604, 1.771457, 0, 0.4705882, 1, 1,
0.272145, 0.5336189, 1.23518, 0, 0.4666667, 1, 1,
0.2724886, -0.2843517, 3.176279, 0, 0.4588235, 1, 1,
0.2725478, 0.4319144, 1.711466, 0, 0.454902, 1, 1,
0.2740549, 0.2223061, -0.3271371, 0, 0.4470588, 1, 1,
0.2744851, -0.8973989, 1.649459, 0, 0.4431373, 1, 1,
0.2793735, 0.7508755, -0.4473227, 0, 0.4352941, 1, 1,
0.279504, -0.378471, 3.473011, 0, 0.4313726, 1, 1,
0.2833952, -1.159479, 3.58711, 0, 0.4235294, 1, 1,
0.2937938, -1.128907, 2.768044, 0, 0.4196078, 1, 1,
0.294092, -0.07371236, 1.287269, 0, 0.4117647, 1, 1,
0.2951799, -1.478785, 4.650939, 0, 0.4078431, 1, 1,
0.2971024, 1.453278, -0.4464422, 0, 0.4, 1, 1,
0.3016556, -0.94675, 2.806479, 0, 0.3921569, 1, 1,
0.3037361, -0.3198553, 2.593577, 0, 0.3882353, 1, 1,
0.3072344, -1.891209, 4.536861, 0, 0.3803922, 1, 1,
0.310549, 0.6410141, 0.03969144, 0, 0.3764706, 1, 1,
0.3107055, 0.6367587, 2.091869, 0, 0.3686275, 1, 1,
0.3115332, 1.429054, 0.8984667, 0, 0.3647059, 1, 1,
0.3133066, -0.1250286, 1.694932, 0, 0.3568628, 1, 1,
0.3134211, 1.635594, -0.2596918, 0, 0.3529412, 1, 1,
0.3177119, 0.335592, 1.833406, 0, 0.345098, 1, 1,
0.3206916, 1.308943, -0.7359493, 0, 0.3411765, 1, 1,
0.3215625, 0.1815223, 2.058692, 0, 0.3333333, 1, 1,
0.3270983, -0.8071325, 2.504306, 0, 0.3294118, 1, 1,
0.3282199, 0.2037627, 0.5877136, 0, 0.3215686, 1, 1,
0.3306926, -0.492717, 2.544741, 0, 0.3176471, 1, 1,
0.3365646, -0.006944974, 0.8281728, 0, 0.3098039, 1, 1,
0.337755, -1.245144, 2.991307, 0, 0.3058824, 1, 1,
0.3392954, 1.712761, -1.940175, 0, 0.2980392, 1, 1,
0.3397054, -1.382932, 1.922076, 0, 0.2901961, 1, 1,
0.3400673, 0.05936648, 1.987242, 0, 0.2862745, 1, 1,
0.3404463, -1.655179, 4.312691, 0, 0.2784314, 1, 1,
0.3423573, 1.92447, -0.6615983, 0, 0.2745098, 1, 1,
0.3430774, -0.7789331, 4.038483, 0, 0.2666667, 1, 1,
0.3472305, 0.5590717, 0.5868469, 0, 0.2627451, 1, 1,
0.355249, -1.36019, 2.500193, 0, 0.254902, 1, 1,
0.3600112, -0.9597639, 1.705971, 0, 0.2509804, 1, 1,
0.3614921, 0.8033525, -1.544146, 0, 0.2431373, 1, 1,
0.3678604, -1.183475, 1.146394, 0, 0.2392157, 1, 1,
0.3697369, 0.1522291, 0.6430845, 0, 0.2313726, 1, 1,
0.370399, 0.08527785, 0.6631715, 0, 0.227451, 1, 1,
0.3707359, -0.05407462, 2.673864, 0, 0.2196078, 1, 1,
0.372858, -0.2712584, 2.945699, 0, 0.2156863, 1, 1,
0.3821254, 1.747762, -1.242704, 0, 0.2078431, 1, 1,
0.3886298, -1.867664, 1.733167, 0, 0.2039216, 1, 1,
0.3898763, -1.155002, 0.7898336, 0, 0.1960784, 1, 1,
0.3906824, -0.3077691, 3.268707, 0, 0.1882353, 1, 1,
0.3913187, -0.9126636, 1.831159, 0, 0.1843137, 1, 1,
0.3916883, 0.5104111, 2.065273, 0, 0.1764706, 1, 1,
0.3931864, 1.328909, 0.5149192, 0, 0.172549, 1, 1,
0.3955042, 1.722944, -0.6607844, 0, 0.1647059, 1, 1,
0.4007528, -0.4398328, 1.70272, 0, 0.1607843, 1, 1,
0.4057095, -0.08659956, 2.147531, 0, 0.1529412, 1, 1,
0.4080787, 1.23311, 1.237732, 0, 0.1490196, 1, 1,
0.411473, -1.811534, 1.886501, 0, 0.1411765, 1, 1,
0.4149789, -0.8367206, 1.944685, 0, 0.1372549, 1, 1,
0.4151328, 1.285812, -0.1486245, 0, 0.1294118, 1, 1,
0.4155872, 0.2741755, 0.9195079, 0, 0.1254902, 1, 1,
0.4171418, -0.6850588, 2.351665, 0, 0.1176471, 1, 1,
0.4178506, -0.4734226, 2.024178, 0, 0.1137255, 1, 1,
0.4283655, 1.594423, 0.9203768, 0, 0.1058824, 1, 1,
0.4290628, -0.0883793, 2.588434, 0, 0.09803922, 1, 1,
0.4301488, -0.8415577, 4.036702, 0, 0.09411765, 1, 1,
0.4322101, 1.494531, -0.4802555, 0, 0.08627451, 1, 1,
0.4347748, 1.201023, 1.144669, 0, 0.08235294, 1, 1,
0.4350856, 1.39207, 1.561962, 0, 0.07450981, 1, 1,
0.4353123, -1.2924, 4.545695, 0, 0.07058824, 1, 1,
0.4371321, 0.126564, 0.6318295, 0, 0.0627451, 1, 1,
0.4425379, -0.7713891, 3.792771, 0, 0.05882353, 1, 1,
0.4426391, 0.1815185, -0.259191, 0, 0.05098039, 1, 1,
0.4470406, -0.4057238, 2.351894, 0, 0.04705882, 1, 1,
0.4500751, 1.024956, -0.5889675, 0, 0.03921569, 1, 1,
0.459449, 0.2410925, 1.129249, 0, 0.03529412, 1, 1,
0.46565, 1.499053, -0.01234113, 0, 0.02745098, 1, 1,
0.4680803, 0.4849798, 0.7345292, 0, 0.02352941, 1, 1,
0.4703014, 1.8573, -0.1875509, 0, 0.01568628, 1, 1,
0.47543, -0.4165452, 0.5804134, 0, 0.01176471, 1, 1,
0.4766894, -0.5214373, 3.513454, 0, 0.003921569, 1, 1,
0.4807088, -1.068096, 1.040031, 0.003921569, 0, 1, 1,
0.4868716, -0.4338222, 2.639847, 0.007843138, 0, 1, 1,
0.4992093, 1.228417, 0.4409618, 0.01568628, 0, 1, 1,
0.4994988, 0.02464772, 1.93635, 0.01960784, 0, 1, 1,
0.5014204, 1.516885, 0.9604427, 0.02745098, 0, 1, 1,
0.5018824, 0.4909076, 2.192245, 0.03137255, 0, 1, 1,
0.5048365, 0.6770464, 2.40574, 0.03921569, 0, 1, 1,
0.5141777, 0.8887761, -0.6694638, 0.04313726, 0, 1, 1,
0.5155016, -2.106128, 2.879965, 0.05098039, 0, 1, 1,
0.5199292, -0.1820333, 3.579061, 0.05490196, 0, 1, 1,
0.5208453, -1.09695, 0.6704562, 0.0627451, 0, 1, 1,
0.5264853, 1.445104, -0.4605541, 0.06666667, 0, 1, 1,
0.5327764, -0.5370131, 2.728632, 0.07450981, 0, 1, 1,
0.5398721, -0.285318, 0.8333704, 0.07843138, 0, 1, 1,
0.540247, -0.5050573, 1.036191, 0.08627451, 0, 1, 1,
0.5412115, 0.5941523, 1.111472, 0.09019608, 0, 1, 1,
0.5419419, -0.3134711, 2.883049, 0.09803922, 0, 1, 1,
0.545427, 0.07070391, 1.0648, 0.1058824, 0, 1, 1,
0.546766, -0.8006126, 3.271112, 0.1098039, 0, 1, 1,
0.5470392, -0.3280306, 1.725004, 0.1176471, 0, 1, 1,
0.5535838, -0.4293862, 3.668635, 0.1215686, 0, 1, 1,
0.5550367, -0.220543, 3.019365, 0.1294118, 0, 1, 1,
0.5638283, 0.3550759, 0.6786451, 0.1333333, 0, 1, 1,
0.5663424, 0.2657363, 0.9650791, 0.1411765, 0, 1, 1,
0.5722442, 0.5332208, 0.03879976, 0.145098, 0, 1, 1,
0.5735468, -0.5709511, 1.160136, 0.1529412, 0, 1, 1,
0.5816881, 1.07533, -0.06126144, 0.1568628, 0, 1, 1,
0.5850177, -0.412319, 3.002698, 0.1647059, 0, 1, 1,
0.5885563, -0.2410115, 2.308578, 0.1686275, 0, 1, 1,
0.5887242, 0.2116956, 1.245337, 0.1764706, 0, 1, 1,
0.5897508, -1.012415, 2.656395, 0.1803922, 0, 1, 1,
0.592137, 0.556592, 0.6697284, 0.1882353, 0, 1, 1,
0.5928539, -0.8173436, 3.148524, 0.1921569, 0, 1, 1,
0.5976028, -0.6159338, 1.36082, 0.2, 0, 1, 1,
0.5990049, -0.8760893, 2.077781, 0.2078431, 0, 1, 1,
0.6037158, 0.5360585, -0.316982, 0.2117647, 0, 1, 1,
0.6052903, -0.6709694, 1.813448, 0.2196078, 0, 1, 1,
0.6058602, -0.5755807, 3.511698, 0.2235294, 0, 1, 1,
0.6090441, 1.133088, 1.902547, 0.2313726, 0, 1, 1,
0.6112306, 1.311685, 1.595738, 0.2352941, 0, 1, 1,
0.6139272, 0.7991145, 0.9775295, 0.2431373, 0, 1, 1,
0.6172675, -0.03442789, 2.651891, 0.2470588, 0, 1, 1,
0.6179773, -0.289819, 2.567016, 0.254902, 0, 1, 1,
0.6181368, -0.5375983, 3.516053, 0.2588235, 0, 1, 1,
0.6206164, 0.1352185, 2.041923, 0.2666667, 0, 1, 1,
0.6234522, 1.510559, 0.6555476, 0.2705882, 0, 1, 1,
0.6302472, -0.3282633, 3.25335, 0.2784314, 0, 1, 1,
0.6310991, 1.825915, 1.382046, 0.282353, 0, 1, 1,
0.6351407, 2.16167, 1.191893, 0.2901961, 0, 1, 1,
0.6351716, 1.102236, 0.1894525, 0.2941177, 0, 1, 1,
0.6387045, 1.772569, -0.7362206, 0.3019608, 0, 1, 1,
0.6394191, -0.3003055, 3.20208, 0.3098039, 0, 1, 1,
0.6420498, 0.5845246, -1.605517, 0.3137255, 0, 1, 1,
0.6450813, 1.367067, 1.148643, 0.3215686, 0, 1, 1,
0.6460217, -0.4848175, 1.926815, 0.3254902, 0, 1, 1,
0.6467518, -0.9433712, 3.258686, 0.3333333, 0, 1, 1,
0.6515862, 0.5626538, 0.08299433, 0.3372549, 0, 1, 1,
0.6543561, -1.484311, 3.320043, 0.345098, 0, 1, 1,
0.6598201, 0.6863627, 1.448135, 0.3490196, 0, 1, 1,
0.6609691, -1.477167, 3.043649, 0.3568628, 0, 1, 1,
0.6674195, -0.9820025, 1.52646, 0.3607843, 0, 1, 1,
0.6757469, 0.1788681, 1.21043, 0.3686275, 0, 1, 1,
0.6772184, -0.1332316, 2.442995, 0.372549, 0, 1, 1,
0.6782256, -0.4352462, 1.777511, 0.3803922, 0, 1, 1,
0.6793569, -0.2937167, 4.519025, 0.3843137, 0, 1, 1,
0.6804766, 1.767753, 0.3060398, 0.3921569, 0, 1, 1,
0.6806476, 0.06371131, 1.081412, 0.3960784, 0, 1, 1,
0.6861112, 0.632831, 1.744294, 0.4039216, 0, 1, 1,
0.6865655, 1.354358, 0.4051812, 0.4117647, 0, 1, 1,
0.6887421, 1.258138, -0.1035521, 0.4156863, 0, 1, 1,
0.690918, -0.9339548, 1.391508, 0.4235294, 0, 1, 1,
0.7062624, 0.08215287, -0.2951837, 0.427451, 0, 1, 1,
0.7155002, 0.8979408, 0.5448003, 0.4352941, 0, 1, 1,
0.7207415, -0.9260399, 2.148956, 0.4392157, 0, 1, 1,
0.7228835, -0.7168415, 1.611857, 0.4470588, 0, 1, 1,
0.7244532, 1.287801, 0.0396541, 0.4509804, 0, 1, 1,
0.7252777, 0.7590398, 1.497038, 0.4588235, 0, 1, 1,
0.7270938, 0.08542771, 1.188501, 0.4627451, 0, 1, 1,
0.7292847, -1.41342, 2.209895, 0.4705882, 0, 1, 1,
0.7303818, -0.6271089, 1.520015, 0.4745098, 0, 1, 1,
0.7319335, -0.2482682, 2.141596, 0.4823529, 0, 1, 1,
0.7359204, -1.036611, 2.799404, 0.4862745, 0, 1, 1,
0.7372739, 0.4807382, 1.354958, 0.4941176, 0, 1, 1,
0.7378426, 0.6288736, 1.581023, 0.5019608, 0, 1, 1,
0.738951, 1.419558, 0.3353762, 0.5058824, 0, 1, 1,
0.7401527, 0.6735945, -2.386362, 0.5137255, 0, 1, 1,
0.7552069, 0.2759788, 2.334716, 0.5176471, 0, 1, 1,
0.7596304, 0.6672959, 0.3968853, 0.5254902, 0, 1, 1,
0.7606011, -0.774744, 2.465953, 0.5294118, 0, 1, 1,
0.762134, -1.557707, 3.044789, 0.5372549, 0, 1, 1,
0.764248, 0.2570646, 2.054487, 0.5411765, 0, 1, 1,
0.7670714, -0.04760904, 1.056766, 0.5490196, 0, 1, 1,
0.7674572, -0.3117143, 2.920066, 0.5529412, 0, 1, 1,
0.7690506, 0.05062723, 0.01985243, 0.5607843, 0, 1, 1,
0.7780578, -0.9557398, 2.328059, 0.5647059, 0, 1, 1,
0.7806736, 0.7534083, 0.1457746, 0.572549, 0, 1, 1,
0.7825746, 1.852355, 0.4235934, 0.5764706, 0, 1, 1,
0.7831113, 0.754189, 1.479746, 0.5843138, 0, 1, 1,
0.7832121, 0.7833573, 2.203463, 0.5882353, 0, 1, 1,
0.7847739, -1.534827, 4.674313, 0.5960785, 0, 1, 1,
0.7903182, 1.111678, -1.026836, 0.6039216, 0, 1, 1,
0.7920778, -0.8983327, 4.507851, 0.6078432, 0, 1, 1,
0.7990864, -1.443913, 3.282101, 0.6156863, 0, 1, 1,
0.8033386, -1.280977, 2.68362, 0.6196079, 0, 1, 1,
0.8069929, -1.574239, 3.205409, 0.627451, 0, 1, 1,
0.8084165, -0.2201567, -0.06057159, 0.6313726, 0, 1, 1,
0.8089415, 1.366276, 0.2336976, 0.6392157, 0, 1, 1,
0.8092011, 0.2838147, 0.1747915, 0.6431373, 0, 1, 1,
0.8092191, 0.02320915, 0.6367964, 0.6509804, 0, 1, 1,
0.8118514, 0.7672121, 0.4640607, 0.654902, 0, 1, 1,
0.8120742, 0.6097928, -0.2975414, 0.6627451, 0, 1, 1,
0.818242, 0.5742882, 1.571703, 0.6666667, 0, 1, 1,
0.8196986, -0.4680895, 2.099734, 0.6745098, 0, 1, 1,
0.8255863, 0.3119566, -0.6829897, 0.6784314, 0, 1, 1,
0.8344875, -0.1891454, 2.111547, 0.6862745, 0, 1, 1,
0.8430113, -1.149202, 1.606764, 0.6901961, 0, 1, 1,
0.8447776, 0.06573652, 3.348938, 0.6980392, 0, 1, 1,
0.8468726, -0.9050767, 2.068703, 0.7058824, 0, 1, 1,
0.8492469, -1.545867, 2.345161, 0.7098039, 0, 1, 1,
0.8530147, 0.230771, 1.857173, 0.7176471, 0, 1, 1,
0.8535886, -0.4906436, 3.655808, 0.7215686, 0, 1, 1,
0.8539256, -0.1541715, 1.503956, 0.7294118, 0, 1, 1,
0.8567066, -0.6074322, 2.724608, 0.7333333, 0, 1, 1,
0.8603673, 0.6452948, 1.207167, 0.7411765, 0, 1, 1,
0.8635882, -0.5122172, 2.763673, 0.7450981, 0, 1, 1,
0.8666447, -0.4599604, 2.012449, 0.7529412, 0, 1, 1,
0.8673363, -0.1125063, 2.078175, 0.7568628, 0, 1, 1,
0.8679287, 0.6370194, 1.108217, 0.7647059, 0, 1, 1,
0.870738, -1.137572, 2.055116, 0.7686275, 0, 1, 1,
0.8726298, -0.2575891, 1.481584, 0.7764706, 0, 1, 1,
0.874292, -2.300517, 1.316175, 0.7803922, 0, 1, 1,
0.8818984, 0.6136521, 1.09923, 0.7882353, 0, 1, 1,
0.883405, 1.454252, 0.9412898, 0.7921569, 0, 1, 1,
0.8851156, -0.9754427, 1.23278, 0.8, 0, 1, 1,
0.8903476, -0.6072041, 2.723089, 0.8078431, 0, 1, 1,
0.8917322, 1.000716, 0.4776258, 0.8117647, 0, 1, 1,
0.8919937, 1.12126, 0.4143282, 0.8196079, 0, 1, 1,
0.8972486, 0.3361158, 0.4888977, 0.8235294, 0, 1, 1,
0.8977455, -0.4873478, 1.933659, 0.8313726, 0, 1, 1,
0.8997727, -0.5718966, 0.8750734, 0.8352941, 0, 1, 1,
0.9017358, -0.5851513, 3.035993, 0.8431373, 0, 1, 1,
0.9073381, 0.02587865, 0.6151559, 0.8470588, 0, 1, 1,
0.9105328, -0.2343643, 2.735232, 0.854902, 0, 1, 1,
0.913036, -1.315511, 1.119414, 0.8588235, 0, 1, 1,
0.9147611, 0.3847039, 0.2066273, 0.8666667, 0, 1, 1,
0.9185703, 0.5348847, 1.148656, 0.8705882, 0, 1, 1,
0.930985, 1.760387, 0.916068, 0.8784314, 0, 1, 1,
0.9350951, -0.03950006, 1.764671, 0.8823529, 0, 1, 1,
0.9383572, -0.2814432, 2.162133, 0.8901961, 0, 1, 1,
0.9492738, -1.448095, 4.219113, 0.8941177, 0, 1, 1,
0.9503384, 0.5058854, -1.175742, 0.9019608, 0, 1, 1,
0.9505627, 0.09859454, 0.3555795, 0.9098039, 0, 1, 1,
0.951216, 0.9741694, 2.031957, 0.9137255, 0, 1, 1,
0.9528983, 0.8889617, -0.9525315, 0.9215686, 0, 1, 1,
0.9550324, -1.307216, 1.177542, 0.9254902, 0, 1, 1,
0.9552113, 0.144576, 0.9803507, 0.9333333, 0, 1, 1,
0.9553167, 0.5954087, 2.560419, 0.9372549, 0, 1, 1,
0.9590151, 0.4542402, 2.239682, 0.945098, 0, 1, 1,
0.9595321, -0.9590374, 2.688176, 0.9490196, 0, 1, 1,
0.9668676, 0.6140149, 0.4755534, 0.9568627, 0, 1, 1,
0.9715146, -0.9053144, 1.703559, 0.9607843, 0, 1, 1,
0.9720536, 1.159245, 1.537191, 0.9686275, 0, 1, 1,
0.9727253, 0.733856, 0.6318031, 0.972549, 0, 1, 1,
0.9762117, 0.1175882, -0.7997587, 0.9803922, 0, 1, 1,
0.9784423, 0.1405886, 0.7920729, 0.9843137, 0, 1, 1,
0.980369, -0.5633969, 2.246958, 0.9921569, 0, 1, 1,
0.9938774, -0.3772214, 2.258509, 0.9960784, 0, 1, 1,
0.9958888, -0.2673183, 3.466231, 1, 0, 0.9960784, 1,
0.999614, 0.4192442, 2.368421, 1, 0, 0.9882353, 1,
1.007113, -0.4124405, 2.346278, 1, 0, 0.9843137, 1,
1.010933, -1.587813, 2.120449, 1, 0, 0.9764706, 1,
1.014889, -0.4086308, 3.232133, 1, 0, 0.972549, 1,
1.03017, -0.8825129, 3.07244, 1, 0, 0.9647059, 1,
1.032556, 0.8888715, 1.085467, 1, 0, 0.9607843, 1,
1.033807, 2.263194, 1.838095, 1, 0, 0.9529412, 1,
1.036313, 0.1141213, 0.9124031, 1, 0, 0.9490196, 1,
1.039703, 0.2472872, 0.6808827, 1, 0, 0.9411765, 1,
1.040521, -0.209514, 2.444196, 1, 0, 0.9372549, 1,
1.041144, -0.5776914, 2.771975, 1, 0, 0.9294118, 1,
1.046973, -0.8964015, 3.692777, 1, 0, 0.9254902, 1,
1.047037, -0.5252807, 0.5154365, 1, 0, 0.9176471, 1,
1.053416, 1.197084, -0.08863822, 1, 0, 0.9137255, 1,
1.054326, 1.672217, 0.8036373, 1, 0, 0.9058824, 1,
1.05453, -0.4896739, 2.167118, 1, 0, 0.9019608, 1,
1.058485, -0.2757886, 1.818958, 1, 0, 0.8941177, 1,
1.062063, -1.033017, 3.106995, 1, 0, 0.8862745, 1,
1.066671, 0.02743831, 0.3052224, 1, 0, 0.8823529, 1,
1.080152, 0.3493185, 0.6073916, 1, 0, 0.8745098, 1,
1.084448, -0.9426824, 2.956085, 1, 0, 0.8705882, 1,
1.088331, -0.9234655, 1.577486, 1, 0, 0.8627451, 1,
1.095151, 0.5008608, -0.5866628, 1, 0, 0.8588235, 1,
1.095452, 1.475415, 1.293014, 1, 0, 0.8509804, 1,
1.09861, 0.01933099, 0.1025807, 1, 0, 0.8470588, 1,
1.098949, 1.147066, 0.5977407, 1, 0, 0.8392157, 1,
1.108623, -2.093588, 2.27733, 1, 0, 0.8352941, 1,
1.119942, 2.649323, -0.03150967, 1, 0, 0.827451, 1,
1.121721, -0.4276616, 0.3452991, 1, 0, 0.8235294, 1,
1.121761, -1.635743, 1.137679, 1, 0, 0.8156863, 1,
1.122722, 0.5526971, 1.541608, 1, 0, 0.8117647, 1,
1.132094, -0.5478928, 1.529564, 1, 0, 0.8039216, 1,
1.132397, -1.010488, 0.334989, 1, 0, 0.7960784, 1,
1.139476, -0.3664839, -0.006694105, 1, 0, 0.7921569, 1,
1.162963, 2.506484, 0.4408735, 1, 0, 0.7843137, 1,
1.174297, 1.494038, 1.826285, 1, 0, 0.7803922, 1,
1.176459, -1.179447, 3.114794, 1, 0, 0.772549, 1,
1.178098, 1.173228, 0.06806356, 1, 0, 0.7686275, 1,
1.182206, -0.008121949, -0.5639398, 1, 0, 0.7607843, 1,
1.185387, 0.1799785, 0.6489341, 1, 0, 0.7568628, 1,
1.188768, -1.029611, 2.745819, 1, 0, 0.7490196, 1,
1.193476, -0.3916439, 1.620942, 1, 0, 0.7450981, 1,
1.204049, -0.3528102, 2.712104, 1, 0, 0.7372549, 1,
1.205826, 0.9373763, -0.03098677, 1, 0, 0.7333333, 1,
1.217266, -1.066727, 2.313307, 1, 0, 0.7254902, 1,
1.218311, 0.4015521, 1.721758, 1, 0, 0.7215686, 1,
1.221052, -2.126005, 3.20179, 1, 0, 0.7137255, 1,
1.224454, 1.1189, 0.03944422, 1, 0, 0.7098039, 1,
1.231382, 1.39044, 1.291295, 1, 0, 0.7019608, 1,
1.234281, -0.9127612, 1.81244, 1, 0, 0.6941177, 1,
1.239541, 1.327721, 0.3117048, 1, 0, 0.6901961, 1,
1.242722, 0.7147481, 1.872077, 1, 0, 0.682353, 1,
1.243736, 0.6876006, 0.9137511, 1, 0, 0.6784314, 1,
1.254349, -0.6719075, 1.860214, 1, 0, 0.6705883, 1,
1.255002, 0.1524206, 1.866153, 1, 0, 0.6666667, 1,
1.256004, 1.308188, 0.9107038, 1, 0, 0.6588235, 1,
1.274991, -0.3683725, 2.824526, 1, 0, 0.654902, 1,
1.277256, 0.03715193, 1.963134, 1, 0, 0.6470588, 1,
1.281588, -0.7207596, 2.186063, 1, 0, 0.6431373, 1,
1.286998, -1.434699, 3.214926, 1, 0, 0.6352941, 1,
1.290188, 0.6156597, -0.02904314, 1, 0, 0.6313726, 1,
1.302245, 0.7400073, 0.700433, 1, 0, 0.6235294, 1,
1.309202, 0.6589525, 1.133971, 1, 0, 0.6196079, 1,
1.311757, -0.2509433, 2.472479, 1, 0, 0.6117647, 1,
1.317071, -1.030491, 1.897469, 1, 0, 0.6078432, 1,
1.324043, 0.2786481, -0.5187081, 1, 0, 0.6, 1,
1.329403, 0.3129937, 0.264678, 1, 0, 0.5921569, 1,
1.332517, 0.1632019, 0.2653103, 1, 0, 0.5882353, 1,
1.333249, 0.3434013, 2.208925, 1, 0, 0.5803922, 1,
1.338572, 1.056143, 0.9346365, 1, 0, 0.5764706, 1,
1.34976, 2.217314, 1.106882, 1, 0, 0.5686275, 1,
1.37381, -0.9781456, 2.465561, 1, 0, 0.5647059, 1,
1.378408, 0.7856795, 1.926677, 1, 0, 0.5568628, 1,
1.389964, -0.9337308, 1.734936, 1, 0, 0.5529412, 1,
1.403961, -1.307341, 1.958364, 1, 0, 0.5450981, 1,
1.405597, 0.8719564, 1.705945, 1, 0, 0.5411765, 1,
1.423304, -0.4052061, 2.204064, 1, 0, 0.5333334, 1,
1.424345, -0.4784085, 3.781795, 1, 0, 0.5294118, 1,
1.427483, 0.8648682, 0.9428332, 1, 0, 0.5215687, 1,
1.429865, 0.8331115, 0.2607411, 1, 0, 0.5176471, 1,
1.437984, 0.8851013, 1.827623, 1, 0, 0.509804, 1,
1.438666, -0.6060635, 2.621905, 1, 0, 0.5058824, 1,
1.446634, 1.284579, 2.602857, 1, 0, 0.4980392, 1,
1.449578, -0.6668429, 1.326296, 1, 0, 0.4901961, 1,
1.450376, -0.2583069, 1.479248, 1, 0, 0.4862745, 1,
1.457989, 0.06378396, 0.7089685, 1, 0, 0.4784314, 1,
1.470826, -0.20016, 3.357625, 1, 0, 0.4745098, 1,
1.474362, 0.2504973, 0.9162701, 1, 0, 0.4666667, 1,
1.488865, 0.3172715, 1.141199, 1, 0, 0.4627451, 1,
1.489416, -0.8990083, 1.644492, 1, 0, 0.454902, 1,
1.492449, -0.9565642, 1.729988, 1, 0, 0.4509804, 1,
1.503445, 0.5823443, 1.705109, 1, 0, 0.4431373, 1,
1.511822, 0.1418058, 1.017492, 1, 0, 0.4392157, 1,
1.520492, -2.091029, 3.034785, 1, 0, 0.4313726, 1,
1.522956, 1.363721, -0.7787334, 1, 0, 0.427451, 1,
1.523739, -0.4066314, 2.936955, 1, 0, 0.4196078, 1,
1.540961, 0.51184, 0.8243901, 1, 0, 0.4156863, 1,
1.54158, 2.060108, 2.384618, 1, 0, 0.4078431, 1,
1.5421, 0.2201252, 0.7283176, 1, 0, 0.4039216, 1,
1.545039, -1.033818, 1.840376, 1, 0, 0.3960784, 1,
1.545445, -0.1599943, 0.551403, 1, 0, 0.3882353, 1,
1.549392, 0.5513444, 1.116028, 1, 0, 0.3843137, 1,
1.55379, -0.2663742, 1.62609, 1, 0, 0.3764706, 1,
1.56589, 0.7497767, 1.427922, 1, 0, 0.372549, 1,
1.579209, 1.121928, -0.4492567, 1, 0, 0.3647059, 1,
1.601286, -0.4592149, 2.34814, 1, 0, 0.3607843, 1,
1.601299, 0.3277982, 3.047822, 1, 0, 0.3529412, 1,
1.609608, -1.194296, 2.610711, 1, 0, 0.3490196, 1,
1.617516, 0.01763887, 0.2917715, 1, 0, 0.3411765, 1,
1.637424, 0.8257078, 0.181917, 1, 0, 0.3372549, 1,
1.637658, -0.2966634, 0.9457744, 1, 0, 0.3294118, 1,
1.666034, 0.8650164, -0.4367024, 1, 0, 0.3254902, 1,
1.679585, -0.04284213, 2.811266, 1, 0, 0.3176471, 1,
1.680569, -1.885761, 1.593865, 1, 0, 0.3137255, 1,
1.683624, 0.4568432, 1.836877, 1, 0, 0.3058824, 1,
1.702449, -1.302257, 0.9480499, 1, 0, 0.2980392, 1,
1.704974, 0.4838066, 2.053695, 1, 0, 0.2941177, 1,
1.716338, 0.5644733, 0.1441493, 1, 0, 0.2862745, 1,
1.716692, -1.561177, 1.648956, 1, 0, 0.282353, 1,
1.717555, -0.4585408, 1.2776, 1, 0, 0.2745098, 1,
1.719392, -0.6430236, 1.769675, 1, 0, 0.2705882, 1,
1.736973, -0.7997729, 0.8683001, 1, 0, 0.2627451, 1,
1.743303, -0.79221, 1.356539, 1, 0, 0.2588235, 1,
1.748308, 1.761551, 0.1480729, 1, 0, 0.2509804, 1,
1.762982, 0.03544403, 1.849599, 1, 0, 0.2470588, 1,
1.786347, 0.8110319, 1.865674, 1, 0, 0.2392157, 1,
1.81826, 0.2520805, 2.201933, 1, 0, 0.2352941, 1,
1.831802, -0.3830149, 2.092385, 1, 0, 0.227451, 1,
1.832752, -0.1365265, 1.183619, 1, 0, 0.2235294, 1,
1.836477, 0.7602992, -0.9014857, 1, 0, 0.2156863, 1,
1.844771, -0.3036058, 1.304556, 1, 0, 0.2117647, 1,
1.919177, -0.3689739, 3.371674, 1, 0, 0.2039216, 1,
1.921005, -0.2717085, 2.287488, 1, 0, 0.1960784, 1,
1.925594, -1.112165, 1.622717, 1, 0, 0.1921569, 1,
1.95298, -0.0609358, 1.752004, 1, 0, 0.1843137, 1,
1.968937, 0.08854574, 0.3658586, 1, 0, 0.1803922, 1,
1.983388, 1.232746, -0.9546427, 1, 0, 0.172549, 1,
1.983969, 0.1116416, 1.03214, 1, 0, 0.1686275, 1,
1.98473, 0.7616926, 0.2813561, 1, 0, 0.1607843, 1,
1.994492, -0.5096015, 2.226866, 1, 0, 0.1568628, 1,
2.007694, 0.2715947, 0.4050565, 1, 0, 0.1490196, 1,
2.020515, -1.908122, 1.761293, 1, 0, 0.145098, 1,
2.031641, 1.603586, 1.557763, 1, 0, 0.1372549, 1,
2.060405, 0.4603308, 0.685722, 1, 0, 0.1333333, 1,
2.073951, -0.9405589, 3.254252, 1, 0, 0.1254902, 1,
2.090734, 1.188982, 1.42576, 1, 0, 0.1215686, 1,
2.11271, -1.095856, 1.583287, 1, 0, 0.1137255, 1,
2.137409, 1.102652, 2.375483, 1, 0, 0.1098039, 1,
2.141586, 0.4501102, 1.08481, 1, 0, 0.1019608, 1,
2.166125, -0.6044925, 2.402776, 1, 0, 0.09411765, 1,
2.229498, 0.3617217, 0.5004651, 1, 0, 0.09019608, 1,
2.239486, -0.8308874, 1.460758, 1, 0, 0.08235294, 1,
2.24791, 2.191028, -0.7755824, 1, 0, 0.07843138, 1,
2.32918, 0.6529668, 0.3774244, 1, 0, 0.07058824, 1,
2.375409, 1.58166, 0.3883355, 1, 0, 0.06666667, 1,
2.395156, -1.023455, 0.9841166, 1, 0, 0.05882353, 1,
2.502412, 0.0561216, 2.438276, 1, 0, 0.05490196, 1,
2.550549, -0.5857825, 1.415056, 1, 0, 0.04705882, 1,
2.744081, -3.021935, 3.068179, 1, 0, 0.04313726, 1,
2.752233, 0.08338069, 1.684772, 1, 0, 0.03529412, 1,
2.846049, -0.6947928, 2.395412, 1, 0, 0.03137255, 1,
3.289529, 1.068744, 0.5586468, 1, 0, 0.02352941, 1,
3.387384, -0.3370577, 1.110283, 1, 0, 0.01960784, 1,
3.487756, -1.438018, 1.067145, 1, 0, 0.01176471, 1,
3.571067, 0.3652245, 3.273519, 1, 0, 0.007843138, 1
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
0.1409947, -4.550297, -6.866434, 0, -0.5, 0.5, 0.5,
0.1409947, -4.550297, -6.866434, 1, -0.5, 0.5, 0.5,
0.1409947, -4.550297, -6.866434, 1, 1.5, 0.5, 0.5,
0.1409947, -4.550297, -6.866434, 0, 1.5, 0.5, 0.5
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
-4.451872, -0.3879848, -6.866434, 0, -0.5, 0.5, 0.5,
-4.451872, -0.3879848, -6.866434, 1, -0.5, 0.5, 0.5,
-4.451872, -0.3879848, -6.866434, 1, 1.5, 0.5, 0.5,
-4.451872, -0.3879848, -6.866434, 0, 1.5, 0.5, 0.5
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
-4.451872, -4.550297, -0.2597389, 0, -0.5, 0.5, 0.5,
-4.451872, -4.550297, -0.2597389, 1, -0.5, 0.5, 0.5,
-4.451872, -4.550297, -0.2597389, 1, 1.5, 0.5, 0.5,
-4.451872, -4.550297, -0.2597389, 0, 1.5, 0.5, 0.5
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
-3, -3.589763, -5.341812,
3, -3.589763, -5.341812,
-3, -3.589763, -5.341812,
-3, -3.749852, -5.595916,
-2, -3.589763, -5.341812,
-2, -3.749852, -5.595916,
-1, -3.589763, -5.341812,
-1, -3.749852, -5.595916,
0, -3.589763, -5.341812,
0, -3.749852, -5.595916,
1, -3.589763, -5.341812,
1, -3.749852, -5.595916,
2, -3.589763, -5.341812,
2, -3.749852, -5.595916,
3, -3.589763, -5.341812,
3, -3.749852, -5.595916
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
-3, -4.07003, -6.104123, 0, -0.5, 0.5, 0.5,
-3, -4.07003, -6.104123, 1, -0.5, 0.5, 0.5,
-3, -4.07003, -6.104123, 1, 1.5, 0.5, 0.5,
-3, -4.07003, -6.104123, 0, 1.5, 0.5, 0.5,
-2, -4.07003, -6.104123, 0, -0.5, 0.5, 0.5,
-2, -4.07003, -6.104123, 1, -0.5, 0.5, 0.5,
-2, -4.07003, -6.104123, 1, 1.5, 0.5, 0.5,
-2, -4.07003, -6.104123, 0, 1.5, 0.5, 0.5,
-1, -4.07003, -6.104123, 0, -0.5, 0.5, 0.5,
-1, -4.07003, -6.104123, 1, -0.5, 0.5, 0.5,
-1, -4.07003, -6.104123, 1, 1.5, 0.5, 0.5,
-1, -4.07003, -6.104123, 0, 1.5, 0.5, 0.5,
0, -4.07003, -6.104123, 0, -0.5, 0.5, 0.5,
0, -4.07003, -6.104123, 1, -0.5, 0.5, 0.5,
0, -4.07003, -6.104123, 1, 1.5, 0.5, 0.5,
0, -4.07003, -6.104123, 0, 1.5, 0.5, 0.5,
1, -4.07003, -6.104123, 0, -0.5, 0.5, 0.5,
1, -4.07003, -6.104123, 1, -0.5, 0.5, 0.5,
1, -4.07003, -6.104123, 1, 1.5, 0.5, 0.5,
1, -4.07003, -6.104123, 0, 1.5, 0.5, 0.5,
2, -4.07003, -6.104123, 0, -0.5, 0.5, 0.5,
2, -4.07003, -6.104123, 1, -0.5, 0.5, 0.5,
2, -4.07003, -6.104123, 1, 1.5, 0.5, 0.5,
2, -4.07003, -6.104123, 0, 1.5, 0.5, 0.5,
3, -4.07003, -6.104123, 0, -0.5, 0.5, 0.5,
3, -4.07003, -6.104123, 1, -0.5, 0.5, 0.5,
3, -4.07003, -6.104123, 1, 1.5, 0.5, 0.5,
3, -4.07003, -6.104123, 0, 1.5, 0.5, 0.5
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
-3.39198, -3, -5.341812,
-3.39198, 2, -5.341812,
-3.39198, -3, -5.341812,
-3.568628, -3, -5.595916,
-3.39198, -2, -5.341812,
-3.568628, -2, -5.595916,
-3.39198, -1, -5.341812,
-3.568628, -1, -5.595916,
-3.39198, 0, -5.341812,
-3.568628, 0, -5.595916,
-3.39198, 1, -5.341812,
-3.568628, 1, -5.595916,
-3.39198, 2, -5.341812,
-3.568628, 2, -5.595916
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
-3.921926, -3, -6.104123, 0, -0.5, 0.5, 0.5,
-3.921926, -3, -6.104123, 1, -0.5, 0.5, 0.5,
-3.921926, -3, -6.104123, 1, 1.5, 0.5, 0.5,
-3.921926, -3, -6.104123, 0, 1.5, 0.5, 0.5,
-3.921926, -2, -6.104123, 0, -0.5, 0.5, 0.5,
-3.921926, -2, -6.104123, 1, -0.5, 0.5, 0.5,
-3.921926, -2, -6.104123, 1, 1.5, 0.5, 0.5,
-3.921926, -2, -6.104123, 0, 1.5, 0.5, 0.5,
-3.921926, -1, -6.104123, 0, -0.5, 0.5, 0.5,
-3.921926, -1, -6.104123, 1, -0.5, 0.5, 0.5,
-3.921926, -1, -6.104123, 1, 1.5, 0.5, 0.5,
-3.921926, -1, -6.104123, 0, 1.5, 0.5, 0.5,
-3.921926, 0, -6.104123, 0, -0.5, 0.5, 0.5,
-3.921926, 0, -6.104123, 1, -0.5, 0.5, 0.5,
-3.921926, 0, -6.104123, 1, 1.5, 0.5, 0.5,
-3.921926, 0, -6.104123, 0, 1.5, 0.5, 0.5,
-3.921926, 1, -6.104123, 0, -0.5, 0.5, 0.5,
-3.921926, 1, -6.104123, 1, -0.5, 0.5, 0.5,
-3.921926, 1, -6.104123, 1, 1.5, 0.5, 0.5,
-3.921926, 1, -6.104123, 0, 1.5, 0.5, 0.5,
-3.921926, 2, -6.104123, 0, -0.5, 0.5, 0.5,
-3.921926, 2, -6.104123, 1, -0.5, 0.5, 0.5,
-3.921926, 2, -6.104123, 1, 1.5, 0.5, 0.5,
-3.921926, 2, -6.104123, 0, 1.5, 0.5, 0.5
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
-3.39198, -3.589763, -4,
-3.39198, -3.589763, 4,
-3.39198, -3.589763, -4,
-3.568628, -3.749852, -4,
-3.39198, -3.589763, -2,
-3.568628, -3.749852, -2,
-3.39198, -3.589763, 0,
-3.568628, -3.749852, 0,
-3.39198, -3.589763, 2,
-3.568628, -3.749852, 2,
-3.39198, -3.589763, 4,
-3.568628, -3.749852, 4
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
-3.921926, -4.07003, -4, 0, -0.5, 0.5, 0.5,
-3.921926, -4.07003, -4, 1, -0.5, 0.5, 0.5,
-3.921926, -4.07003, -4, 1, 1.5, 0.5, 0.5,
-3.921926, -4.07003, -4, 0, 1.5, 0.5, 0.5,
-3.921926, -4.07003, -2, 0, -0.5, 0.5, 0.5,
-3.921926, -4.07003, -2, 1, -0.5, 0.5, 0.5,
-3.921926, -4.07003, -2, 1, 1.5, 0.5, 0.5,
-3.921926, -4.07003, -2, 0, 1.5, 0.5, 0.5,
-3.921926, -4.07003, 0, 0, -0.5, 0.5, 0.5,
-3.921926, -4.07003, 0, 1, -0.5, 0.5, 0.5,
-3.921926, -4.07003, 0, 1, 1.5, 0.5, 0.5,
-3.921926, -4.07003, 0, 0, 1.5, 0.5, 0.5,
-3.921926, -4.07003, 2, 0, -0.5, 0.5, 0.5,
-3.921926, -4.07003, 2, 1, -0.5, 0.5, 0.5,
-3.921926, -4.07003, 2, 1, 1.5, 0.5, 0.5,
-3.921926, -4.07003, 2, 0, 1.5, 0.5, 0.5,
-3.921926, -4.07003, 4, 0, -0.5, 0.5, 0.5,
-3.921926, -4.07003, 4, 1, -0.5, 0.5, 0.5,
-3.921926, -4.07003, 4, 1, 1.5, 0.5, 0.5,
-3.921926, -4.07003, 4, 0, 1.5, 0.5, 0.5
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
-3.39198, -3.589763, -5.341812,
-3.39198, 2.813794, -5.341812,
-3.39198, -3.589763, 4.822334,
-3.39198, 2.813794, 4.822334,
-3.39198, -3.589763, -5.341812,
-3.39198, -3.589763, 4.822334,
-3.39198, 2.813794, -5.341812,
-3.39198, 2.813794, 4.822334,
-3.39198, -3.589763, -5.341812,
3.673969, -3.589763, -5.341812,
-3.39198, -3.589763, 4.822334,
3.673969, -3.589763, 4.822334,
-3.39198, 2.813794, -5.341812,
3.673969, 2.813794, -5.341812,
-3.39198, 2.813794, 4.822334,
3.673969, 2.813794, 4.822334,
3.673969, -3.589763, -5.341812,
3.673969, 2.813794, -5.341812,
3.673969, -3.589763, 4.822334,
3.673969, 2.813794, 4.822334,
3.673969, -3.589763, -5.341812,
3.673969, -3.589763, 4.822334,
3.673969, 2.813794, -5.341812,
3.673969, 2.813794, 4.822334
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
var radius = 7.442146;
var distance = 33.11095;
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
mvMatrix.translate( -0.1409947, 0.3879848, 0.2597389 );
mvMatrix.scale( 1.138785, 1.256582, 0.7916645 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.11095);
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
Etomidate<-read.table("Etomidate.xyz")
```

```
## Error in read.table("Etomidate.xyz"): no lines available in input
```

```r
x<-Etomidate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Etomidate' not found
```

```r
y<-Etomidate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Etomidate' not found
```

```r
z<-Etomidate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Etomidate' not found
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
-3.289078, 0.3804635, -1.368799, 0, 0, 1, 1, 1,
-2.739314, -0.09411327, -0.893291, 1, 0, 0, 1, 1,
-2.732632, -1.933976, 0.5095255, 1, 0, 0, 1, 1,
-2.535906, 0.9021471, -1.279844, 1, 0, 0, 1, 1,
-2.455328, -1.056918, -1.283313, 1, 0, 0, 1, 1,
-2.35881, 0.06287485, -0.7204999, 1, 0, 0, 1, 1,
-2.332889, 1.065611, -1.519653, 0, 0, 0, 1, 1,
-2.257921, -0.3062731, -3.16739, 0, 0, 0, 1, 1,
-2.218651, -0.4687358, 1.162402, 0, 0, 0, 1, 1,
-2.199789, -1.062194, -1.373318, 0, 0, 0, 1, 1,
-2.126561, 0.08422884, -1.123768, 0, 0, 0, 1, 1,
-2.09043, 0.2504249, -2.487782, 0, 0, 0, 1, 1,
-2.023745, -1.018503, -1.595277, 0, 0, 0, 1, 1,
-2.023026, 0.962393, 0.7498966, 1, 1, 1, 1, 1,
-2.022033, -0.3213293, -2.717912, 1, 1, 1, 1, 1,
-2.018861, -0.7133212, -1.605, 1, 1, 1, 1, 1,
-1.994074, 0.2688142, -1.493154, 1, 1, 1, 1, 1,
-1.955092, -1.024084, -3.123147, 1, 1, 1, 1, 1,
-1.954098, -0.2464461, -1.444684, 1, 1, 1, 1, 1,
-1.935492, -0.4071138, -3.14726, 1, 1, 1, 1, 1,
-1.883517, -0.1860627, -3.592244, 1, 1, 1, 1, 1,
-1.870801, -0.1681087, -1.976361, 1, 1, 1, 1, 1,
-1.851458, -0.08829495, -1.816532, 1, 1, 1, 1, 1,
-1.834489, 1.042227, -2.298817, 1, 1, 1, 1, 1,
-1.820199, 0.1531293, -3.34288, 1, 1, 1, 1, 1,
-1.817086, -1.248423, -1.554821, 1, 1, 1, 1, 1,
-1.798571, 0.06118751, 0.505056, 1, 1, 1, 1, 1,
-1.780699, 0.7830349, -0.6101996, 1, 1, 1, 1, 1,
-1.749347, -1.029166, -2.287319, 0, 0, 1, 1, 1,
-1.733916, 0.5801507, -0.9410635, 1, 0, 0, 1, 1,
-1.721232, 1.042203, 0.2063322, 1, 0, 0, 1, 1,
-1.716983, 1.440554, -0.409981, 1, 0, 0, 1, 1,
-1.714804, -0.4292076, -0.32515, 1, 0, 0, 1, 1,
-1.694613, -1.623845, -4.300339, 1, 0, 0, 1, 1,
-1.691022, 0.4367713, -1.506953, 0, 0, 0, 1, 1,
-1.668238, 0.0103941, -1.793373, 0, 0, 0, 1, 1,
-1.646081, -0.3961717, -2.03533, 0, 0, 0, 1, 1,
-1.615947, 1.660239, -0.9495453, 0, 0, 0, 1, 1,
-1.596929, -0.2557794, -1.150566, 0, 0, 0, 1, 1,
-1.596751, -1.76707, -2.488042, 0, 0, 0, 1, 1,
-1.596021, 0.2120072, -1.093549, 0, 0, 0, 1, 1,
-1.574715, -0.6303927, -1.14987, 1, 1, 1, 1, 1,
-1.564349, -1.212694, -1.474538, 1, 1, 1, 1, 1,
-1.562595, -1.316062, -0.580213, 1, 1, 1, 1, 1,
-1.560718, 0.5270153, -0.5493449, 1, 1, 1, 1, 1,
-1.560095, 0.2347109, -0.9111468, 1, 1, 1, 1, 1,
-1.555207, -1.127902, -3.17376, 1, 1, 1, 1, 1,
-1.554754, 1.721845, -1.543512, 1, 1, 1, 1, 1,
-1.550279, 1.645832, 0.7846799, 1, 1, 1, 1, 1,
-1.540611, 0.8424184, -1.571501, 1, 1, 1, 1, 1,
-1.525214, -1.139318, -3.929843, 1, 1, 1, 1, 1,
-1.519079, 0.7686948, -1.503407, 1, 1, 1, 1, 1,
-1.500788, -0.3843452, -2.338458, 1, 1, 1, 1, 1,
-1.49349, 0.5550383, 0.2728601, 1, 1, 1, 1, 1,
-1.488219, 0.62873, -1.248315, 1, 1, 1, 1, 1,
-1.4846, -1.084098, -2.77238, 1, 1, 1, 1, 1,
-1.482187, 1.498509, -2.582858, 0, 0, 1, 1, 1,
-1.476675, -0.3330335, -2.960241, 1, 0, 0, 1, 1,
-1.474973, 0.6720528, -1.141405, 1, 0, 0, 1, 1,
-1.467609, -1.205878, -2.060062, 1, 0, 0, 1, 1,
-1.463972, -0.8524438, -3.080141, 1, 0, 0, 1, 1,
-1.449435, -0.2481432, -0.6781492, 1, 0, 0, 1, 1,
-1.435385, 0.91043, -1.447802, 0, 0, 0, 1, 1,
-1.415865, 1.561942, 0.8379692, 0, 0, 0, 1, 1,
-1.403851, -1.872316, -2.086237, 0, 0, 0, 1, 1,
-1.403251, -0.1649378, -1.385426, 0, 0, 0, 1, 1,
-1.380183, -0.7517938, -0.6672096, 0, 0, 0, 1, 1,
-1.374867, -0.1288381, -2.218139, 0, 0, 0, 1, 1,
-1.347084, -0.5089454, -1.840617, 0, 0, 0, 1, 1,
-1.344665, 1.009663, 0.06758481, 1, 1, 1, 1, 1,
-1.343713, -3.496507, -2.397614, 1, 1, 1, 1, 1,
-1.330193, -2.169511, -1.913656, 1, 1, 1, 1, 1,
-1.318101, -0.6691515, -4.099195, 1, 1, 1, 1, 1,
-1.309088, 1.084272, 0.6075406, 1, 1, 1, 1, 1,
-1.299061, 0.02762438, -2.450845, 1, 1, 1, 1, 1,
-1.2959, -1.032884, -3.579149, 1, 1, 1, 1, 1,
-1.293164, -0.6800448, -3.025185, 1, 1, 1, 1, 1,
-1.288374, -1.105924, -2.885594, 1, 1, 1, 1, 1,
-1.280272, -0.6566528, -3.326651, 1, 1, 1, 1, 1,
-1.278661, -0.4304675, -2.936611, 1, 1, 1, 1, 1,
-1.264886, -1.219247, -2.659407, 1, 1, 1, 1, 1,
-1.262618, 0.1690368, -0.887414, 1, 1, 1, 1, 1,
-1.253358, 0.7388557, 0.05208211, 1, 1, 1, 1, 1,
-1.250088, -0.2979287, -1.747723, 1, 1, 1, 1, 1,
-1.24867, -0.1261586, -1.030522, 0, 0, 1, 1, 1,
-1.248299, -0.7152534, -0.7257479, 1, 0, 0, 1, 1,
-1.243226, -0.1784477, -0.5290366, 1, 0, 0, 1, 1,
-1.235891, 1.121621, -1.152209, 1, 0, 0, 1, 1,
-1.231213, -0.4274584, -1.206841, 1, 0, 0, 1, 1,
-1.22074, 0.2168391, -1.181054, 1, 0, 0, 1, 1,
-1.220614, 0.8008561, -0.4768869, 0, 0, 0, 1, 1,
-1.205435, 0.6063873, -0.09130547, 0, 0, 0, 1, 1,
-1.205377, -0.6142442, -3.31009, 0, 0, 0, 1, 1,
-1.188943, 1.085071, -1.6502, 0, 0, 0, 1, 1,
-1.180607, -0.1276054, -0.2214245, 0, 0, 0, 1, 1,
-1.178468, 0.5284223, 0.01704091, 0, 0, 0, 1, 1,
-1.173703, -2.185928, -3.34868, 0, 0, 0, 1, 1,
-1.172473, -0.0366851, -2.759507, 1, 1, 1, 1, 1,
-1.16895, -0.1976704, -3.384101, 1, 1, 1, 1, 1,
-1.165663, 1.698135, 0.1040841, 1, 1, 1, 1, 1,
-1.162583, -0.9735251, -2.467433, 1, 1, 1, 1, 1,
-1.147796, 0.8360745, 0.2335621, 1, 1, 1, 1, 1,
-1.14487, 1.709851, -0.9662403, 1, 1, 1, 1, 1,
-1.142153, -0.4602252, -1.855579, 1, 1, 1, 1, 1,
-1.141778, 1.600291, -0.669013, 1, 1, 1, 1, 1,
-1.140159, -0.4321792, -1.219893, 1, 1, 1, 1, 1,
-1.135604, -1.427553, -1.858671, 1, 1, 1, 1, 1,
-1.127339, 1.573887, 0.4209117, 1, 1, 1, 1, 1,
-1.12493, -0.04117694, 0.2423935, 1, 1, 1, 1, 1,
-1.113425, 1.144733, -0.5747659, 1, 1, 1, 1, 1,
-1.102469, -0.3312319, -1.351222, 1, 1, 1, 1, 1,
-1.091042, -1.193815, -1.66036, 1, 1, 1, 1, 1,
-1.089595, -0.04659703, 0.1164244, 0, 0, 1, 1, 1,
-1.087409, -0.6211303, -1.572557, 1, 0, 0, 1, 1,
-1.082035, -0.1058891, -1.241071, 1, 0, 0, 1, 1,
-1.07397, -0.8300133, -3.018711, 1, 0, 0, 1, 1,
-1.068842, 0.3440025, -0.7937466, 1, 0, 0, 1, 1,
-1.068405, 0.09713642, -2.290978, 1, 0, 0, 1, 1,
-1.06835, -0.6485187, -2.538138, 0, 0, 0, 1, 1,
-1.056957, -1.282882, -3.366029, 0, 0, 0, 1, 1,
-1.03508, 1.116742, -0.2612957, 0, 0, 0, 1, 1,
-1.019698, -0.1723865, -0.03852544, 0, 0, 0, 1, 1,
-1.018542, -1.733518, -4.893132, 0, 0, 0, 1, 1,
-1.0137, -0.6818344, -2.787842, 0, 0, 0, 1, 1,
-1.01253, -0.8347287, -1.770586, 0, 0, 0, 1, 1,
-1.011937, -0.2147378, -2.71216, 1, 1, 1, 1, 1,
-1.011281, -0.6984938, -2.64578, 1, 1, 1, 1, 1,
-1.01016, 1.967482, 1.011349, 1, 1, 1, 1, 1,
-1.008374, 0.3268954, -1.32527, 1, 1, 1, 1, 1,
-0.9995477, 0.825397, -0.7871757, 1, 1, 1, 1, 1,
-0.9965343, 0.6754295, -0.4242992, 1, 1, 1, 1, 1,
-0.9872722, 0.2380333, -2.241622, 1, 1, 1, 1, 1,
-0.986785, 1.864786, -1.00686, 1, 1, 1, 1, 1,
-0.9838436, -1.054804, -2.787305, 1, 1, 1, 1, 1,
-0.9773294, -1.302848, -3.222327, 1, 1, 1, 1, 1,
-0.9633368, 0.585604, 0.3982787, 1, 1, 1, 1, 1,
-0.963131, 0.4361866, -1.557726, 1, 1, 1, 1, 1,
-0.9630679, 0.8399447, -0.2391637, 1, 1, 1, 1, 1,
-0.9592511, 0.05692198, -1.117726, 1, 1, 1, 1, 1,
-0.9555566, -0.736523, -3.624993, 1, 1, 1, 1, 1,
-0.9505676, 0.467084, -0.8660405, 0, 0, 1, 1, 1,
-0.9449253, 0.2846962, -2.779299, 1, 0, 0, 1, 1,
-0.9434482, 1.161701, 0.3719629, 1, 0, 0, 1, 1,
-0.9416162, 0.05590299, -0.986809, 1, 0, 0, 1, 1,
-0.9326281, -0.3478143, -1.670528, 1, 0, 0, 1, 1,
-0.9234996, 0.4158441, -2.519877, 1, 0, 0, 1, 1,
-0.9234424, 0.2901184, -1.866883, 0, 0, 0, 1, 1,
-0.9232083, -0.4586601, -1.429434, 0, 0, 0, 1, 1,
-0.9209729, 0.09189866, -1.040624, 0, 0, 0, 1, 1,
-0.914528, -0.4147245, -3.105651, 0, 0, 0, 1, 1,
-0.9122059, 0.4734859, 0.91138, 0, 0, 0, 1, 1,
-0.9097577, -0.3940618, -2.441319, 0, 0, 0, 1, 1,
-0.9052998, -0.5889784, -2.716131, 0, 0, 0, 1, 1,
-0.9026366, -0.7600397, -4.006039, 1, 1, 1, 1, 1,
-0.9019712, 0.3265879, 0.7182805, 1, 1, 1, 1, 1,
-0.8949406, 0.7153203, -0.4249408, 1, 1, 1, 1, 1,
-0.8929435, 1.340895, 1.007457, 1, 1, 1, 1, 1,
-0.8887603, -0.2970959, -1.5478, 1, 1, 1, 1, 1,
-0.8845025, 0.953259, 1.418938, 1, 1, 1, 1, 1,
-0.8839867, -2.296255, -1.189384, 1, 1, 1, 1, 1,
-0.8763905, 2.067572, -0.1331785, 1, 1, 1, 1, 1,
-0.876132, 0.6905264, -2.008934, 1, 1, 1, 1, 1,
-0.869252, -0.6346073, -3.430193, 1, 1, 1, 1, 1,
-0.8679801, 0.9062985, 0.7493468, 1, 1, 1, 1, 1,
-0.8635498, -1.023785, -0.7011873, 1, 1, 1, 1, 1,
-0.8605334, -0.9244392, -2.163269, 1, 1, 1, 1, 1,
-0.8592357, -0.8388082, -2.922705, 1, 1, 1, 1, 1,
-0.8520295, -1.695837, -2.090477, 1, 1, 1, 1, 1,
-0.8508683, 1.396587, -0.5109536, 0, 0, 1, 1, 1,
-0.8503612, -1.382841, -3.751787, 1, 0, 0, 1, 1,
-0.8502756, 0.224538, -1.545701, 1, 0, 0, 1, 1,
-0.8413872, 1.918849, -0.1263587, 1, 0, 0, 1, 1,
-0.8410626, -0.6277146, -2.984949, 1, 0, 0, 1, 1,
-0.8265655, 1.120684, -0.5601962, 1, 0, 0, 1, 1,
-0.8243021, -0.2530417, -0.1295195, 0, 0, 0, 1, 1,
-0.8183059, 1.109728, 2.231898, 0, 0, 0, 1, 1,
-0.8173643, 0.1015818, -0.1973254, 0, 0, 0, 1, 1,
-0.8168996, -1.496073, -2.616745, 0, 0, 0, 1, 1,
-0.8138805, -1.114455, -2.365035, 0, 0, 0, 1, 1,
-0.8088487, 0.6224188, -1.731118, 0, 0, 0, 1, 1,
-0.8074763, 0.7672374, -1.135439, 0, 0, 0, 1, 1,
-0.8072426, -0.08034078, -3.142832, 1, 1, 1, 1, 1,
-0.8060046, -0.380571, -3.119881, 1, 1, 1, 1, 1,
-0.7944162, 0.3253992, -2.931657, 1, 1, 1, 1, 1,
-0.793713, 0.3156951, -1.474057, 1, 1, 1, 1, 1,
-0.7932944, -0.2720053, -3.055881, 1, 1, 1, 1, 1,
-0.7840367, 0.4620343, 0.0499886, 1, 1, 1, 1, 1,
-0.783288, -1.008066, -1.344258, 1, 1, 1, 1, 1,
-0.7831952, 0.9196709, -2.49471, 1, 1, 1, 1, 1,
-0.7812783, -1.385131, -3.714929, 1, 1, 1, 1, 1,
-0.7793394, 0.7490035, 0.1437191, 1, 1, 1, 1, 1,
-0.7770541, 0.08721422, -0.8138231, 1, 1, 1, 1, 1,
-0.7755295, 0.2760191, 0.06706682, 1, 1, 1, 1, 1,
-0.7714484, -1.6707, -2.679077, 1, 1, 1, 1, 1,
-0.7711829, -0.8963302, -1.752681, 1, 1, 1, 1, 1,
-0.7586666, 0.01625442, -2.011149, 1, 1, 1, 1, 1,
-0.75189, 0.9837166, -1.108003, 0, 0, 1, 1, 1,
-0.7500654, 0.7498462, -1.504193, 1, 0, 0, 1, 1,
-0.7356899, -1.55739, -2.611109, 1, 0, 0, 1, 1,
-0.7296947, -0.07968274, -0.862166, 1, 0, 0, 1, 1,
-0.7176891, 0.7740768, 1.978019, 1, 0, 0, 1, 1,
-0.7148004, -1.830792, -1.450799, 1, 0, 0, 1, 1,
-0.714228, 0.9166898, -2.224659, 0, 0, 0, 1, 1,
-0.7098334, -0.1526864, -1.239523, 0, 0, 0, 1, 1,
-0.7087651, -1.293376, -2.222889, 0, 0, 0, 1, 1,
-0.7038666, -1.346504, -3.9558, 0, 0, 0, 1, 1,
-0.6939937, 0.8285896, -1.461823, 0, 0, 0, 1, 1,
-0.6801792, -0.5769703, -0.7481257, 0, 0, 0, 1, 1,
-0.6798934, -0.1880638, -1.663874, 0, 0, 0, 1, 1,
-0.6786144, 1.273575, -0.3770752, 1, 1, 1, 1, 1,
-0.6573879, -0.7916204, -1.921008, 1, 1, 1, 1, 1,
-0.6545202, -1.337394, -2.681251, 1, 1, 1, 1, 1,
-0.6512711, -0.8435002, -1.407754, 1, 1, 1, 1, 1,
-0.650602, 0.07814646, -2.589132, 1, 1, 1, 1, 1,
-0.6502032, 0.05147888, -0.6929543, 1, 1, 1, 1, 1,
-0.6499397, 0.1241042, -0.910495, 1, 1, 1, 1, 1,
-0.6475843, -0.5030482, -0.3495182, 1, 1, 1, 1, 1,
-0.6438533, -1.009258, -3.580496, 1, 1, 1, 1, 1,
-0.6433653, -0.9392202, -2.127947, 1, 1, 1, 1, 1,
-0.6305596, -0.4440585, -1.606526, 1, 1, 1, 1, 1,
-0.6262612, -0.5749198, -2.751724, 1, 1, 1, 1, 1,
-0.6254422, 0.3219917, -0.3268205, 1, 1, 1, 1, 1,
-0.6228359, 0.6264202, 0.02221101, 1, 1, 1, 1, 1,
-0.6221752, 0.925377, -1.101455, 1, 1, 1, 1, 1,
-0.620552, 1.453238, -1.860141, 0, 0, 1, 1, 1,
-0.6188029, 0.4820419, -1.462448, 1, 0, 0, 1, 1,
-0.616455, -0.4951887, -2.582645, 1, 0, 0, 1, 1,
-0.609319, 1.370458, 0.505519, 1, 0, 0, 1, 1,
-0.6091471, -0.3103443, -0.5048472, 1, 0, 0, 1, 1,
-0.5970151, 0.3088683, -0.49376, 1, 0, 0, 1, 1,
-0.5954682, -0.7920276, -1.292199, 0, 0, 0, 1, 1,
-0.5944538, 0.8724901, -1.025544, 0, 0, 0, 1, 1,
-0.593262, 1.486214, 0.1332227, 0, 0, 0, 1, 1,
-0.5929173, 0.4932519, -1.045, 0, 0, 0, 1, 1,
-0.5890817, 1.258578, 1.215164, 0, 0, 0, 1, 1,
-0.5856701, -1.21968, -2.399083, 0, 0, 0, 1, 1,
-0.5817161, 0.1178299, -1.910776, 0, 0, 0, 1, 1,
-0.5788255, 0.08239739, -2.432273, 1, 1, 1, 1, 1,
-0.5720868, 0.4732553, -1.56026, 1, 1, 1, 1, 1,
-0.5709476, 0.2876155, 0.08592793, 1, 1, 1, 1, 1,
-0.5689243, 0.09062944, -0.02438264, 1, 1, 1, 1, 1,
-0.5616074, 0.07198928, -1.672626, 1, 1, 1, 1, 1,
-0.5500161, -0.08508228, -2.538497, 1, 1, 1, 1, 1,
-0.5494817, 0.9956073, 0.2869561, 1, 1, 1, 1, 1,
-0.5479145, 0.7874566, -0.7080569, 1, 1, 1, 1, 1,
-0.5425839, 1.314921, -0.05658236, 1, 1, 1, 1, 1,
-0.5393738, 0.8835203, 1.305623, 1, 1, 1, 1, 1,
-0.5372704, 0.3151241, -1.689299, 1, 1, 1, 1, 1,
-0.5372341, -1.46124, -3.94875, 1, 1, 1, 1, 1,
-0.536503, 1.029306, 0.005555841, 1, 1, 1, 1, 1,
-0.5356563, -1.540804, -3.30531, 1, 1, 1, 1, 1,
-0.5344115, -0.9961336, -1.162103, 1, 1, 1, 1, 1,
-0.5344084, -1.701207, -2.489725, 0, 0, 1, 1, 1,
-0.5276031, 0.4085239, -0.3235639, 1, 0, 0, 1, 1,
-0.5250106, 0.3576885, -1.493461, 1, 0, 0, 1, 1,
-0.5226511, 1.410033, 0.332662, 1, 0, 0, 1, 1,
-0.5215216, 1.384199, 1.279029, 1, 0, 0, 1, 1,
-0.516217, -0.2101952, -1.209993, 1, 0, 0, 1, 1,
-0.5118654, -1.007895, -2.879164, 0, 0, 0, 1, 1,
-0.5116652, 0.2818359, -2.224636, 0, 0, 0, 1, 1,
-0.511406, 0.3703779, -3.40822, 0, 0, 0, 1, 1,
-0.5003244, -0.4217734, -1.910013, 0, 0, 0, 1, 1,
-0.4993361, 1.580781, 0.4973399, 0, 0, 0, 1, 1,
-0.4987991, 0.4092689, -0.7680841, 0, 0, 0, 1, 1,
-0.4980953, -0.08126348, -2.164184, 0, 0, 0, 1, 1,
-0.496432, 1.13599, -0.7858431, 1, 1, 1, 1, 1,
-0.4961282, -0.1422994, -1.790691, 1, 1, 1, 1, 1,
-0.4905797, -0.6632861, -2.26163, 1, 1, 1, 1, 1,
-0.4900587, -1.201233, -1.917077, 1, 1, 1, 1, 1,
-0.4887582, 1.000467, -0.4490044, 1, 1, 1, 1, 1,
-0.4837604, 2.720538, -0.5735603, 1, 1, 1, 1, 1,
-0.4834977, -1.363592, -2.942212, 1, 1, 1, 1, 1,
-0.4798686, 0.1321049, -2.359781, 1, 1, 1, 1, 1,
-0.4782892, 0.6183996, -0.800519, 1, 1, 1, 1, 1,
-0.4782126, -1.183014, -0.565849, 1, 1, 1, 1, 1,
-0.4661805, 0.7101696, -1.882884, 1, 1, 1, 1, 1,
-0.4633229, 1.560049, -0.9714341, 1, 1, 1, 1, 1,
-0.4628951, -0.026412, -1.704762, 1, 1, 1, 1, 1,
-0.4593163, 0.3584018, 0.2597235, 1, 1, 1, 1, 1,
-0.4585434, -0.2683044, -2.681756, 1, 1, 1, 1, 1,
-0.4557948, 1.24411, -0.5379757, 0, 0, 1, 1, 1,
-0.4556607, 2.175346, 1.241032, 1, 0, 0, 1, 1,
-0.455045, -0.04521042, -1.900006, 1, 0, 0, 1, 1,
-0.4534866, 0.4106708, -0.6729202, 1, 0, 0, 1, 1,
-0.4517742, -2.503193, -2.436651, 1, 0, 0, 1, 1,
-0.4507889, -0.2279538, -0.1585567, 1, 0, 0, 1, 1,
-0.4487777, -0.02526518, -2.091361, 0, 0, 0, 1, 1,
-0.4464757, 0.8229268, 0.4707857, 0, 0, 0, 1, 1,
-0.4446995, -1.419925, -4.394032, 0, 0, 0, 1, 1,
-0.4431757, 0.9789932, -1.693321, 0, 0, 0, 1, 1,
-0.4429045, -1.864074, -1.498526, 0, 0, 0, 1, 1,
-0.4356509, 1.957616, 0.7977913, 0, 0, 0, 1, 1,
-0.4319271, 1.254852, 1.283741, 0, 0, 0, 1, 1,
-0.4311494, -0.9950172, -2.846107, 1, 1, 1, 1, 1,
-0.4190688, -1.536156, -3.557234, 1, 1, 1, 1, 1,
-0.4173763, 0.220931, -0.03652687, 1, 1, 1, 1, 1,
-0.4172139, -2.197182, -2.261679, 1, 1, 1, 1, 1,
-0.4163465, -1.703723, -3.021128, 1, 1, 1, 1, 1,
-0.4150615, 0.1641277, -2.401599, 1, 1, 1, 1, 1,
-0.4106785, 1.236034, -0.671218, 1, 1, 1, 1, 1,
-0.4086908, 0.437626, -1.265742, 1, 1, 1, 1, 1,
-0.4020329, -1.78065, -3.140868, 1, 1, 1, 1, 1,
-0.4009489, 0.3116033, -2.186825, 1, 1, 1, 1, 1,
-0.3942082, -0.5515468, -2.582243, 1, 1, 1, 1, 1,
-0.393722, 0.1097988, -1.550036, 1, 1, 1, 1, 1,
-0.3935059, 0.8486459, -1.523368, 1, 1, 1, 1, 1,
-0.3921503, -0.6457283, -2.074979, 1, 1, 1, 1, 1,
-0.3891025, -0.08146942, -1.938495, 1, 1, 1, 1, 1,
-0.3887394, 0.7273488, -0.09204239, 0, 0, 1, 1, 1,
-0.38838, -0.3736638, -3.690592, 1, 0, 0, 1, 1,
-0.3872654, -0.7880545, -2.469051, 1, 0, 0, 1, 1,
-0.3844978, 0.6815397, 0.8853866, 1, 0, 0, 1, 1,
-0.38164, 1.03794, -3.682299, 1, 0, 0, 1, 1,
-0.3773672, 1.831784, 1.106598, 1, 0, 0, 1, 1,
-0.3720738, 0.8713884, -0.7738878, 0, 0, 0, 1, 1,
-0.3667238, 0.9136549, -0.5614772, 0, 0, 0, 1, 1,
-0.3656229, -0.645528, -1.606473, 0, 0, 0, 1, 1,
-0.3633621, -0.9328338, -3.751155, 0, 0, 0, 1, 1,
-0.3505814, -0.1210038, -1.439747, 0, 0, 0, 1, 1,
-0.3495589, 0.03841026, -1.371258, 0, 0, 0, 1, 1,
-0.3474611, -0.2728418, -4.500005, 0, 0, 0, 1, 1,
-0.3448729, -0.4751269, -3.096825, 1, 1, 1, 1, 1,
-0.3426625, -0.4652472, -2.99871, 1, 1, 1, 1, 1,
-0.3419942, 0.8840351, -0.876066, 1, 1, 1, 1, 1,
-0.3403346, -0.5758646, -2.450802, 1, 1, 1, 1, 1,
-0.3389973, 0.7443351, -0.7552845, 1, 1, 1, 1, 1,
-0.3388283, 0.8468281, 0.8531577, 1, 1, 1, 1, 1,
-0.3388282, 1.012685, -0.8542731, 1, 1, 1, 1, 1,
-0.3375866, -1.020517, -1.977831, 1, 1, 1, 1, 1,
-0.3360099, 0.7929268, -0.6354949, 1, 1, 1, 1, 1,
-0.3358466, 0.2154691, -0.3860242, 1, 1, 1, 1, 1,
-0.3329321, 1.064901, -0.8263008, 1, 1, 1, 1, 1,
-0.3308163, 1.549138, 0.009594152, 1, 1, 1, 1, 1,
-0.3293011, 0.2996357, -0.421531, 1, 1, 1, 1, 1,
-0.325843, 2.394764, -1.205214, 1, 1, 1, 1, 1,
-0.3191865, -0.008311829, -1.380324, 1, 1, 1, 1, 1,
-0.3190717, 0.3703102, -1.97256, 0, 0, 1, 1, 1,
-0.3103464, -1.832975, -1.473427, 1, 0, 0, 1, 1,
-0.3070295, 0.6745329, 0.4498304, 1, 0, 0, 1, 1,
-0.3057587, 0.4825435, -2.482687, 1, 0, 0, 1, 1,
-0.3007802, -1.401687, -3.524397, 1, 0, 0, 1, 1,
-0.2971558, -2.017507, -1.855708, 1, 0, 0, 1, 1,
-0.2927589, 0.3149637, -0.6387183, 0, 0, 0, 1, 1,
-0.2905448, 0.8146816, -1.457232, 0, 0, 0, 1, 1,
-0.287362, 0.3973333, 0.1749574, 0, 0, 0, 1, 1,
-0.2864734, 0.1343925, -1.826573, 0, 0, 0, 1, 1,
-0.2830539, -1.106107, -4.062715, 0, 0, 0, 1, 1,
-0.2794238, -0.7653975, -2.729465, 0, 0, 0, 1, 1,
-0.2766311, -0.3409996, -0.2187537, 0, 0, 0, 1, 1,
-0.2766259, -0.9778497, -1.40622, 1, 1, 1, 1, 1,
-0.2724972, -1.81006, -3.545969, 1, 1, 1, 1, 1,
-0.271245, -0.3531994, -3.280577, 1, 1, 1, 1, 1,
-0.2696265, -1.030298, -3.317348, 1, 1, 1, 1, 1,
-0.2694623, -1.163008, -3.572609, 1, 1, 1, 1, 1,
-0.2680261, -1.075752, -2.694904, 1, 1, 1, 1, 1,
-0.2653236, -0.3040505, -2.396443, 1, 1, 1, 1, 1,
-0.2640106, 0.9180345, -0.7053718, 1, 1, 1, 1, 1,
-0.2636191, 1.454285, 0.4560572, 1, 1, 1, 1, 1,
-0.263297, 0.7292765, 0.04349232, 1, 1, 1, 1, 1,
-0.2552021, -0.3372719, -2.41652, 1, 1, 1, 1, 1,
-0.2513265, 1.272579, -0.2249071, 1, 1, 1, 1, 1,
-0.2501669, -0.7363243, -2.442649, 1, 1, 1, 1, 1,
-0.2498838, -0.1407364, -2.23094, 1, 1, 1, 1, 1,
-0.2476795, 0.50219, -0.4598191, 1, 1, 1, 1, 1,
-0.2426407, -0.5240687, -2.38935, 0, 0, 1, 1, 1,
-0.2401849, 0.4797374, -0.2505885, 1, 0, 0, 1, 1,
-0.238171, 0.1677922, -1.31364, 1, 0, 0, 1, 1,
-0.2373149, 0.2755932, -2.101365, 1, 0, 0, 1, 1,
-0.2357709, 2.471459, 0.9656343, 1, 0, 0, 1, 1,
-0.234494, -1.080895, -2.425983, 1, 0, 0, 1, 1,
-0.233551, 1.60936, -0.9864076, 0, 0, 0, 1, 1,
-0.2318677, 0.1249386, -1.439128, 0, 0, 0, 1, 1,
-0.2317153, -0.3789012, -3.264898, 0, 0, 0, 1, 1,
-0.2312701, -1.715976, -3.810965, 0, 0, 0, 1, 1,
-0.2288983, -1.042805, -3.057765, 0, 0, 0, 1, 1,
-0.228097, -0.2164061, -3.089011, 0, 0, 0, 1, 1,
-0.2249361, 1.21843, 0.1029113, 0, 0, 0, 1, 1,
-0.2218276, 0.4770608, 0.8892815, 1, 1, 1, 1, 1,
-0.2196925, -1.801314, -2.994301, 1, 1, 1, 1, 1,
-0.2178511, -0.04388535, -3.542227, 1, 1, 1, 1, 1,
-0.21651, -0.8399442, -2.145324, 1, 1, 1, 1, 1,
-0.2133648, -0.04538877, -1.797312, 1, 1, 1, 1, 1,
-0.2129154, 0.2390945, -1.598038, 1, 1, 1, 1, 1,
-0.209213, 0.002684182, -1.178206, 1, 1, 1, 1, 1,
-0.208241, 1.064437, -2.214331, 1, 1, 1, 1, 1,
-0.2059596, -0.7758855, -3.865371, 1, 1, 1, 1, 1,
-0.2054262, 1.35262, -1.276433, 1, 1, 1, 1, 1,
-0.2043465, -0.0493265, -0.5567145, 1, 1, 1, 1, 1,
-0.200699, 0.3247174, 0.796092, 1, 1, 1, 1, 1,
-0.1982306, -0.2910249, -1.668586, 1, 1, 1, 1, 1,
-0.1980737, 1.32378, 0.5920417, 1, 1, 1, 1, 1,
-0.1850165, 0.5214663, 0.3263291, 1, 1, 1, 1, 1,
-0.1843487, -0.9874213, -2.042088, 0, 0, 1, 1, 1,
-0.1808267, 0.5804211, 2.262017, 1, 0, 0, 1, 1,
-0.1803778, -0.08019898, -1.747654, 1, 0, 0, 1, 1,
-0.177539, 0.1463588, -0.4713851, 1, 0, 0, 1, 1,
-0.1764356, 0.265387, -1.922117, 1, 0, 0, 1, 1,
-0.1678697, 1.74019, 0.6108974, 1, 0, 0, 1, 1,
-0.1655803, -0.3050384, -4.345434, 0, 0, 0, 1, 1,
-0.1651152, -1.046201, -2.964423, 0, 0, 0, 1, 1,
-0.1646809, 1.015235, -1.27657, 0, 0, 0, 1, 1,
-0.1545534, -0.01002118, -1.665717, 0, 0, 0, 1, 1,
-0.1538469, 0.1147486, -1.945548, 0, 0, 0, 1, 1,
-0.1448374, 0.005956732, -2.279576, 0, 0, 0, 1, 1,
-0.1435288, 0.6455046, -0.1703952, 0, 0, 0, 1, 1,
-0.140681, -0.7488529, -3.171561, 1, 1, 1, 1, 1,
-0.1367745, 0.00874343, -1.309532, 1, 1, 1, 1, 1,
-0.1317985, -0.6371279, -2.301717, 1, 1, 1, 1, 1,
-0.130982, -1.388327, -3.673098, 1, 1, 1, 1, 1,
-0.1307438, 0.8190972, -1.535557, 1, 1, 1, 1, 1,
-0.1263895, -0.4051242, -2.244, 1, 1, 1, 1, 1,
-0.1231606, 0.5039685, -1.057307, 1, 1, 1, 1, 1,
-0.1224613, 0.2011784, -1.139349, 1, 1, 1, 1, 1,
-0.1221024, -1.73052, -2.236354, 1, 1, 1, 1, 1,
-0.1178817, -0.5788852, -5.19379, 1, 1, 1, 1, 1,
-0.1170967, 0.8098516, 1.502238, 1, 1, 1, 1, 1,
-0.1156951, -0.8359507, -1.840933, 1, 1, 1, 1, 1,
-0.1153759, 0.1528074, -1.232109, 1, 1, 1, 1, 1,
-0.1147096, 1.430209, 0.2221268, 1, 1, 1, 1, 1,
-0.1141384, -0.5913528, -1.291067, 1, 1, 1, 1, 1,
-0.1123614, -0.8700091, -4.116249, 0, 0, 1, 1, 1,
-0.1114702, -0.008750047, -1.536325, 1, 0, 0, 1, 1,
-0.105407, 0.9021316, -0.01516601, 1, 0, 0, 1, 1,
-0.09851426, -0.2564092, -2.497769, 1, 0, 0, 1, 1,
-0.09496766, -1.270234, -2.919611, 1, 0, 0, 1, 1,
-0.09134049, -0.7367961, -1.254149, 1, 0, 0, 1, 1,
-0.08566699, 1.651353, -0.6764754, 0, 0, 0, 1, 1,
-0.08078616, -0.8576898, -4.546756, 0, 0, 0, 1, 1,
-0.07599278, 0.9210478, -0.8464596, 0, 0, 0, 1, 1,
-0.07566375, 0.05106386, -1.564539, 0, 0, 0, 1, 1,
-0.07497014, -1.23862, -2.39623, 0, 0, 0, 1, 1,
-0.07247873, -0.3108039, -2.863932, 0, 0, 0, 1, 1,
-0.07149729, 1.647428, -0.7863693, 0, 0, 0, 1, 1,
-0.06905675, -1.994888, -3.114094, 1, 1, 1, 1, 1,
-0.06873448, 0.2073442, -0.4256271, 1, 1, 1, 1, 1,
-0.06747099, 0.8650267, -0.6170059, 1, 1, 1, 1, 1,
-0.06631815, -1.415385, -1.312067, 1, 1, 1, 1, 1,
-0.05879737, -0.6002588, -2.994453, 1, 1, 1, 1, 1,
-0.05816838, 0.1739678, -1.476819, 1, 1, 1, 1, 1,
-0.05692873, 1.126925, -0.3654878, 1, 1, 1, 1, 1,
-0.05435574, -0.1254034, -2.533547, 1, 1, 1, 1, 1,
-0.05225234, -0.3984956, -1.307021, 1, 1, 1, 1, 1,
-0.05022279, 2.624246, 2.041734, 1, 1, 1, 1, 1,
-0.04759074, -0.4412039, -1.787327, 1, 1, 1, 1, 1,
-0.04640301, -0.2245189, -2.412309, 1, 1, 1, 1, 1,
-0.04227131, 0.2304462, 0.1616418, 1, 1, 1, 1, 1,
-0.04197462, -0.1150307, -3.134785, 1, 1, 1, 1, 1,
-0.04148312, 0.1117037, -2.235111, 1, 1, 1, 1, 1,
-0.04004773, -0.9495459, -3.656413, 0, 0, 1, 1, 1,
-0.03474503, -0.3619937, -2.850437, 1, 0, 0, 1, 1,
-0.02868529, 0.8611028, -1.838155, 1, 0, 0, 1, 1,
-0.025186, -0.6857612, -3.768185, 1, 0, 0, 1, 1,
-0.02461386, -0.4745121, -2.419001, 1, 0, 0, 1, 1,
-0.01838814, 1.086095, -0.5138649, 1, 0, 0, 1, 1,
-0.01714044, -0.5622184, -3.826095, 0, 0, 0, 1, 1,
-0.01291314, -1.641607, -2.69471, 0, 0, 0, 1, 1,
-0.01229358, 0.7386978, 1.600876, 0, 0, 0, 1, 1,
-0.009774892, 0.1003146, 2.404076, 0, 0, 0, 1, 1,
-0.008888756, 0.1524597, 0.7011914, 0, 0, 0, 1, 1,
-0.007343825, -0.09489513, -2.907194, 0, 0, 0, 1, 1,
-0.006836573, 0.7679125, -1.025313, 0, 0, 0, 1, 1,
-0.004602813, -0.2876395, -4.247456, 1, 1, 1, 1, 1,
-0.003148053, 0.9641627, 0.258662, 1, 1, 1, 1, 1,
0.0008131997, 0.3793539, -0.2336778, 1, 1, 1, 1, 1,
0.001760998, -1.250924, 3.622239, 1, 1, 1, 1, 1,
0.002939387, -0.4339546, 3.291034, 1, 1, 1, 1, 1,
0.006261104, 0.2722759, -1.509625, 1, 1, 1, 1, 1,
0.006646087, -2.041024, 2.926151, 1, 1, 1, 1, 1,
0.006906368, 1.412749, -0.5055547, 1, 1, 1, 1, 1,
0.007131109, 0.3990755, 1.157254, 1, 1, 1, 1, 1,
0.007707283, 1.376696, 0.8818355, 1, 1, 1, 1, 1,
0.01035525, -2.380425, 3.930559, 1, 1, 1, 1, 1,
0.01254609, 0.2302801, -1.018834, 1, 1, 1, 1, 1,
0.01257071, 0.7173678, 0.02094564, 1, 1, 1, 1, 1,
0.01590158, -0.2152218, 3.185025, 1, 1, 1, 1, 1,
0.02058141, 1.95416, 0.2702307, 1, 1, 1, 1, 1,
0.0223178, -0.8458287, 4.481483, 0, 0, 1, 1, 1,
0.02331642, -0.5868547, 2.579158, 1, 0, 0, 1, 1,
0.02740822, 0.1485541, 0.3004206, 1, 0, 0, 1, 1,
0.02885727, 0.8543239, 0.4275298, 1, 0, 0, 1, 1,
0.03077701, 0.2330074, -1.580674, 1, 0, 0, 1, 1,
0.03103998, 0.7228001, -1.401579, 1, 0, 0, 1, 1,
0.03110277, 2.306468, -0.994325, 0, 0, 0, 1, 1,
0.03521443, -0.7239875, 3.297904, 0, 0, 0, 1, 1,
0.0356999, 0.7661415, 0.5659412, 0, 0, 0, 1, 1,
0.04116507, 0.1138688, 0.4809703, 0, 0, 0, 1, 1,
0.04338966, -1.021643, 2.493055, 0, 0, 0, 1, 1,
0.04457413, -1.593677, 2.248665, 0, 0, 0, 1, 1,
0.04473215, 0.377744, 0.8955982, 0, 0, 0, 1, 1,
0.04770184, -0.7708486, 2.582795, 1, 1, 1, 1, 1,
0.05059449, -1.08532, 3.837728, 1, 1, 1, 1, 1,
0.05243699, 0.779915, -0.5679901, 1, 1, 1, 1, 1,
0.05268311, 0.1011694, 0.347073, 1, 1, 1, 1, 1,
0.05514492, 0.04706333, 1.013899, 1, 1, 1, 1, 1,
0.05522818, 0.372436, 1.015983, 1, 1, 1, 1, 1,
0.05682293, -1.48966, 3.5501, 1, 1, 1, 1, 1,
0.05809044, -0.4084887, 3.763376, 1, 1, 1, 1, 1,
0.06107388, 0.6888009, 0.9345632, 1, 1, 1, 1, 1,
0.06214945, -0.1814829, 2.05949, 1, 1, 1, 1, 1,
0.0682383, 1.214096, 1.016596, 1, 1, 1, 1, 1,
0.06978451, -0.3363664, 3.387258, 1, 1, 1, 1, 1,
0.07256468, 1.368621, 0.9040588, 1, 1, 1, 1, 1,
0.07463213, -1.468419, 3.09675, 1, 1, 1, 1, 1,
0.07629189, 0.2960483, -0.9263337, 1, 1, 1, 1, 1,
0.07635964, 1.537677, -0.8254539, 0, 0, 1, 1, 1,
0.07658218, 0.7699437, -1.750704, 1, 0, 0, 1, 1,
0.07874889, 0.1247325, -0.1805284, 1, 0, 0, 1, 1,
0.08213862, -1.371128, 1.549572, 1, 0, 0, 1, 1,
0.08264016, -1.021338, 3.596893, 1, 0, 0, 1, 1,
0.09119502, -0.9409677, 2.218419, 1, 0, 0, 1, 1,
0.09170028, -0.2385308, 3.929049, 0, 0, 0, 1, 1,
0.09357881, -0.7262284, 3.26449, 0, 0, 0, 1, 1,
0.09430987, 0.07385944, 0.5562666, 0, 0, 0, 1, 1,
0.09480781, 1.566956, -0.09183893, 0, 0, 0, 1, 1,
0.09549685, 0.4445759, 0.1316355, 0, 0, 0, 1, 1,
0.09829395, -1.172565, 3.307455, 0, 0, 0, 1, 1,
0.1012517, 0.6214967, 0.4381251, 0, 0, 0, 1, 1,
0.1071794, -0.6488575, 2.650911, 1, 1, 1, 1, 1,
0.1072684, 1.257336, 2.069341, 1, 1, 1, 1, 1,
0.1073592, -0.7335266, 2.276449, 1, 1, 1, 1, 1,
0.1095331, -0.3245184, 4.430824, 1, 1, 1, 1, 1,
0.1100978, 0.2575676, 1.326506, 1, 1, 1, 1, 1,
0.1103929, 0.4407894, -1.031242, 1, 1, 1, 1, 1,
0.1106908, -1.244787, 3.088508, 1, 1, 1, 1, 1,
0.1133477, -0.1107017, 2.687023, 1, 1, 1, 1, 1,
0.1178046, 1.209208, 1.877506, 1, 1, 1, 1, 1,
0.1189799, -0.1394193, 2.829615, 1, 1, 1, 1, 1,
0.1190625, 0.7306073, 0.07647087, 1, 1, 1, 1, 1,
0.1209997, 0.2125897, -0.5325122, 1, 1, 1, 1, 1,
0.1216114, -0.03596598, 0.2749133, 1, 1, 1, 1, 1,
0.1261571, -0.9452896, 2.685688, 1, 1, 1, 1, 1,
0.1271733, 0.6452314, 1.719914, 1, 1, 1, 1, 1,
0.1292536, 0.5684808, 2.674045, 0, 0, 1, 1, 1,
0.1326461, 0.09537501, 0.2691268, 1, 0, 0, 1, 1,
0.1332325, -1.428511, 2.882246, 1, 0, 0, 1, 1,
0.1375606, -1.551063, 2.503537, 1, 0, 0, 1, 1,
0.1428395, 0.8220705, 1.519748, 1, 0, 0, 1, 1,
0.1432945, -0.1627944, 2.539229, 1, 0, 0, 1, 1,
0.1469452, -0.5383225, 4.048577, 0, 0, 0, 1, 1,
0.1470774, -0.3107656, 3.072379, 0, 0, 0, 1, 1,
0.1564204, -1.03768, 4.245548, 0, 0, 0, 1, 1,
0.1580615, 0.384695, 0.6439763, 0, 0, 0, 1, 1,
0.1589795, -0.2392227, -0.9291531, 0, 0, 0, 1, 1,
0.1594338, 1.587071, -1.804317, 0, 0, 0, 1, 1,
0.1639653, 1.067085, -0.7498148, 0, 0, 0, 1, 1,
0.164255, 1.897597, -0.6951039, 1, 1, 1, 1, 1,
0.1645097, -0.9962819, 3.211422, 1, 1, 1, 1, 1,
0.1648126, -0.1446228, 2.315212, 1, 1, 1, 1, 1,
0.1654217, -0.6024671, 1.755245, 1, 1, 1, 1, 1,
0.165436, 0.6568795, 1.023535, 1, 1, 1, 1, 1,
0.1671327, 1.081957, 0.06904317, 1, 1, 1, 1, 1,
0.1689127, 0.5302846, 0.958327, 1, 1, 1, 1, 1,
0.172179, -0.2703917, 0.3629133, 1, 1, 1, 1, 1,
0.1731722, 0.583882, -0.48154, 1, 1, 1, 1, 1,
0.1751573, 1.515594, -0.4005111, 1, 1, 1, 1, 1,
0.1766384, 2.548925, 0.4314016, 1, 1, 1, 1, 1,
0.1814943, -0.2467646, 3.408505, 1, 1, 1, 1, 1,
0.1825778, 0.8240668, 1.645315, 1, 1, 1, 1, 1,
0.184577, -1.744535, 1.967647, 1, 1, 1, 1, 1,
0.1928226, -0.8861442, 2.689749, 1, 1, 1, 1, 1,
0.1945772, 0.4618468, -1.05777, 0, 0, 1, 1, 1,
0.195197, -0.3500332, 3.492902, 1, 0, 0, 1, 1,
0.1963128, 0.679713, -0.1361925, 1, 0, 0, 1, 1,
0.1986676, -0.1628845, 3.523983, 1, 0, 0, 1, 1,
0.2049893, 0.4137231, -0.4362714, 1, 0, 0, 1, 1,
0.2056756, -0.275134, 1.199732, 1, 0, 0, 1, 1,
0.2097011, -0.7424567, 3.01849, 0, 0, 0, 1, 1,
0.2131492, 1.27874, -1.043353, 0, 0, 0, 1, 1,
0.2135026, 0.2609382, 0.5208096, 0, 0, 0, 1, 1,
0.2184405, 0.3365585, 1.149251, 0, 0, 0, 1, 1,
0.2202756, -0.1773016, 0.4712468, 0, 0, 0, 1, 1,
0.2236407, 1.069942, -0.1938986, 0, 0, 0, 1, 1,
0.2242155, -0.9739685, 2.919175, 0, 0, 0, 1, 1,
0.2341297, 0.6248914, 1.571845, 1, 1, 1, 1, 1,
0.235016, 0.3986976, 1.88543, 1, 1, 1, 1, 1,
0.2448537, -0.5160189, 2.612801, 1, 1, 1, 1, 1,
0.2452019, -0.6285951, 3.235707, 1, 1, 1, 1, 1,
0.2495759, -0.1149167, 4.354001, 1, 1, 1, 1, 1,
0.2500029, -0.9550419, 2.20201, 1, 1, 1, 1, 1,
0.2508036, -0.05531749, 2.38679, 1, 1, 1, 1, 1,
0.2523738, -0.656922, 2.553219, 1, 1, 1, 1, 1,
0.2527294, -0.4185961, 4.369419, 1, 1, 1, 1, 1,
0.2543397, -0.9898429, 3.527341, 1, 1, 1, 1, 1,
0.2543407, -0.6219767, 3.249798, 1, 1, 1, 1, 1,
0.2596283, -1.003134, 2.934802, 1, 1, 1, 1, 1,
0.2667631, 0.8741001, -1.099462, 1, 1, 1, 1, 1,
0.2668013, 0.5952714, -0.3024086, 1, 1, 1, 1, 1,
0.2682055, -0.7722134, 3.936289, 1, 1, 1, 1, 1,
0.2693083, 0.3526604, 1.771457, 0, 0, 1, 1, 1,
0.272145, 0.5336189, 1.23518, 1, 0, 0, 1, 1,
0.2724886, -0.2843517, 3.176279, 1, 0, 0, 1, 1,
0.2725478, 0.4319144, 1.711466, 1, 0, 0, 1, 1,
0.2740549, 0.2223061, -0.3271371, 1, 0, 0, 1, 1,
0.2744851, -0.8973989, 1.649459, 1, 0, 0, 1, 1,
0.2793735, 0.7508755, -0.4473227, 0, 0, 0, 1, 1,
0.279504, -0.378471, 3.473011, 0, 0, 0, 1, 1,
0.2833952, -1.159479, 3.58711, 0, 0, 0, 1, 1,
0.2937938, -1.128907, 2.768044, 0, 0, 0, 1, 1,
0.294092, -0.07371236, 1.287269, 0, 0, 0, 1, 1,
0.2951799, -1.478785, 4.650939, 0, 0, 0, 1, 1,
0.2971024, 1.453278, -0.4464422, 0, 0, 0, 1, 1,
0.3016556, -0.94675, 2.806479, 1, 1, 1, 1, 1,
0.3037361, -0.3198553, 2.593577, 1, 1, 1, 1, 1,
0.3072344, -1.891209, 4.536861, 1, 1, 1, 1, 1,
0.310549, 0.6410141, 0.03969144, 1, 1, 1, 1, 1,
0.3107055, 0.6367587, 2.091869, 1, 1, 1, 1, 1,
0.3115332, 1.429054, 0.8984667, 1, 1, 1, 1, 1,
0.3133066, -0.1250286, 1.694932, 1, 1, 1, 1, 1,
0.3134211, 1.635594, -0.2596918, 1, 1, 1, 1, 1,
0.3177119, 0.335592, 1.833406, 1, 1, 1, 1, 1,
0.3206916, 1.308943, -0.7359493, 1, 1, 1, 1, 1,
0.3215625, 0.1815223, 2.058692, 1, 1, 1, 1, 1,
0.3270983, -0.8071325, 2.504306, 1, 1, 1, 1, 1,
0.3282199, 0.2037627, 0.5877136, 1, 1, 1, 1, 1,
0.3306926, -0.492717, 2.544741, 1, 1, 1, 1, 1,
0.3365646, -0.006944974, 0.8281728, 1, 1, 1, 1, 1,
0.337755, -1.245144, 2.991307, 0, 0, 1, 1, 1,
0.3392954, 1.712761, -1.940175, 1, 0, 0, 1, 1,
0.3397054, -1.382932, 1.922076, 1, 0, 0, 1, 1,
0.3400673, 0.05936648, 1.987242, 1, 0, 0, 1, 1,
0.3404463, -1.655179, 4.312691, 1, 0, 0, 1, 1,
0.3423573, 1.92447, -0.6615983, 1, 0, 0, 1, 1,
0.3430774, -0.7789331, 4.038483, 0, 0, 0, 1, 1,
0.3472305, 0.5590717, 0.5868469, 0, 0, 0, 1, 1,
0.355249, -1.36019, 2.500193, 0, 0, 0, 1, 1,
0.3600112, -0.9597639, 1.705971, 0, 0, 0, 1, 1,
0.3614921, 0.8033525, -1.544146, 0, 0, 0, 1, 1,
0.3678604, -1.183475, 1.146394, 0, 0, 0, 1, 1,
0.3697369, 0.1522291, 0.6430845, 0, 0, 0, 1, 1,
0.370399, 0.08527785, 0.6631715, 1, 1, 1, 1, 1,
0.3707359, -0.05407462, 2.673864, 1, 1, 1, 1, 1,
0.372858, -0.2712584, 2.945699, 1, 1, 1, 1, 1,
0.3821254, 1.747762, -1.242704, 1, 1, 1, 1, 1,
0.3886298, -1.867664, 1.733167, 1, 1, 1, 1, 1,
0.3898763, -1.155002, 0.7898336, 1, 1, 1, 1, 1,
0.3906824, -0.3077691, 3.268707, 1, 1, 1, 1, 1,
0.3913187, -0.9126636, 1.831159, 1, 1, 1, 1, 1,
0.3916883, 0.5104111, 2.065273, 1, 1, 1, 1, 1,
0.3931864, 1.328909, 0.5149192, 1, 1, 1, 1, 1,
0.3955042, 1.722944, -0.6607844, 1, 1, 1, 1, 1,
0.4007528, -0.4398328, 1.70272, 1, 1, 1, 1, 1,
0.4057095, -0.08659956, 2.147531, 1, 1, 1, 1, 1,
0.4080787, 1.23311, 1.237732, 1, 1, 1, 1, 1,
0.411473, -1.811534, 1.886501, 1, 1, 1, 1, 1,
0.4149789, -0.8367206, 1.944685, 0, 0, 1, 1, 1,
0.4151328, 1.285812, -0.1486245, 1, 0, 0, 1, 1,
0.4155872, 0.2741755, 0.9195079, 1, 0, 0, 1, 1,
0.4171418, -0.6850588, 2.351665, 1, 0, 0, 1, 1,
0.4178506, -0.4734226, 2.024178, 1, 0, 0, 1, 1,
0.4283655, 1.594423, 0.9203768, 1, 0, 0, 1, 1,
0.4290628, -0.0883793, 2.588434, 0, 0, 0, 1, 1,
0.4301488, -0.8415577, 4.036702, 0, 0, 0, 1, 1,
0.4322101, 1.494531, -0.4802555, 0, 0, 0, 1, 1,
0.4347748, 1.201023, 1.144669, 0, 0, 0, 1, 1,
0.4350856, 1.39207, 1.561962, 0, 0, 0, 1, 1,
0.4353123, -1.2924, 4.545695, 0, 0, 0, 1, 1,
0.4371321, 0.126564, 0.6318295, 0, 0, 0, 1, 1,
0.4425379, -0.7713891, 3.792771, 1, 1, 1, 1, 1,
0.4426391, 0.1815185, -0.259191, 1, 1, 1, 1, 1,
0.4470406, -0.4057238, 2.351894, 1, 1, 1, 1, 1,
0.4500751, 1.024956, -0.5889675, 1, 1, 1, 1, 1,
0.459449, 0.2410925, 1.129249, 1, 1, 1, 1, 1,
0.46565, 1.499053, -0.01234113, 1, 1, 1, 1, 1,
0.4680803, 0.4849798, 0.7345292, 1, 1, 1, 1, 1,
0.4703014, 1.8573, -0.1875509, 1, 1, 1, 1, 1,
0.47543, -0.4165452, 0.5804134, 1, 1, 1, 1, 1,
0.4766894, -0.5214373, 3.513454, 1, 1, 1, 1, 1,
0.4807088, -1.068096, 1.040031, 1, 1, 1, 1, 1,
0.4868716, -0.4338222, 2.639847, 1, 1, 1, 1, 1,
0.4992093, 1.228417, 0.4409618, 1, 1, 1, 1, 1,
0.4994988, 0.02464772, 1.93635, 1, 1, 1, 1, 1,
0.5014204, 1.516885, 0.9604427, 1, 1, 1, 1, 1,
0.5018824, 0.4909076, 2.192245, 0, 0, 1, 1, 1,
0.5048365, 0.6770464, 2.40574, 1, 0, 0, 1, 1,
0.5141777, 0.8887761, -0.6694638, 1, 0, 0, 1, 1,
0.5155016, -2.106128, 2.879965, 1, 0, 0, 1, 1,
0.5199292, -0.1820333, 3.579061, 1, 0, 0, 1, 1,
0.5208453, -1.09695, 0.6704562, 1, 0, 0, 1, 1,
0.5264853, 1.445104, -0.4605541, 0, 0, 0, 1, 1,
0.5327764, -0.5370131, 2.728632, 0, 0, 0, 1, 1,
0.5398721, -0.285318, 0.8333704, 0, 0, 0, 1, 1,
0.540247, -0.5050573, 1.036191, 0, 0, 0, 1, 1,
0.5412115, 0.5941523, 1.111472, 0, 0, 0, 1, 1,
0.5419419, -0.3134711, 2.883049, 0, 0, 0, 1, 1,
0.545427, 0.07070391, 1.0648, 0, 0, 0, 1, 1,
0.546766, -0.8006126, 3.271112, 1, 1, 1, 1, 1,
0.5470392, -0.3280306, 1.725004, 1, 1, 1, 1, 1,
0.5535838, -0.4293862, 3.668635, 1, 1, 1, 1, 1,
0.5550367, -0.220543, 3.019365, 1, 1, 1, 1, 1,
0.5638283, 0.3550759, 0.6786451, 1, 1, 1, 1, 1,
0.5663424, 0.2657363, 0.9650791, 1, 1, 1, 1, 1,
0.5722442, 0.5332208, 0.03879976, 1, 1, 1, 1, 1,
0.5735468, -0.5709511, 1.160136, 1, 1, 1, 1, 1,
0.5816881, 1.07533, -0.06126144, 1, 1, 1, 1, 1,
0.5850177, -0.412319, 3.002698, 1, 1, 1, 1, 1,
0.5885563, -0.2410115, 2.308578, 1, 1, 1, 1, 1,
0.5887242, 0.2116956, 1.245337, 1, 1, 1, 1, 1,
0.5897508, -1.012415, 2.656395, 1, 1, 1, 1, 1,
0.592137, 0.556592, 0.6697284, 1, 1, 1, 1, 1,
0.5928539, -0.8173436, 3.148524, 1, 1, 1, 1, 1,
0.5976028, -0.6159338, 1.36082, 0, 0, 1, 1, 1,
0.5990049, -0.8760893, 2.077781, 1, 0, 0, 1, 1,
0.6037158, 0.5360585, -0.316982, 1, 0, 0, 1, 1,
0.6052903, -0.6709694, 1.813448, 1, 0, 0, 1, 1,
0.6058602, -0.5755807, 3.511698, 1, 0, 0, 1, 1,
0.6090441, 1.133088, 1.902547, 1, 0, 0, 1, 1,
0.6112306, 1.311685, 1.595738, 0, 0, 0, 1, 1,
0.6139272, 0.7991145, 0.9775295, 0, 0, 0, 1, 1,
0.6172675, -0.03442789, 2.651891, 0, 0, 0, 1, 1,
0.6179773, -0.289819, 2.567016, 0, 0, 0, 1, 1,
0.6181368, -0.5375983, 3.516053, 0, 0, 0, 1, 1,
0.6206164, 0.1352185, 2.041923, 0, 0, 0, 1, 1,
0.6234522, 1.510559, 0.6555476, 0, 0, 0, 1, 1,
0.6302472, -0.3282633, 3.25335, 1, 1, 1, 1, 1,
0.6310991, 1.825915, 1.382046, 1, 1, 1, 1, 1,
0.6351407, 2.16167, 1.191893, 1, 1, 1, 1, 1,
0.6351716, 1.102236, 0.1894525, 1, 1, 1, 1, 1,
0.6387045, 1.772569, -0.7362206, 1, 1, 1, 1, 1,
0.6394191, -0.3003055, 3.20208, 1, 1, 1, 1, 1,
0.6420498, 0.5845246, -1.605517, 1, 1, 1, 1, 1,
0.6450813, 1.367067, 1.148643, 1, 1, 1, 1, 1,
0.6460217, -0.4848175, 1.926815, 1, 1, 1, 1, 1,
0.6467518, -0.9433712, 3.258686, 1, 1, 1, 1, 1,
0.6515862, 0.5626538, 0.08299433, 1, 1, 1, 1, 1,
0.6543561, -1.484311, 3.320043, 1, 1, 1, 1, 1,
0.6598201, 0.6863627, 1.448135, 1, 1, 1, 1, 1,
0.6609691, -1.477167, 3.043649, 1, 1, 1, 1, 1,
0.6674195, -0.9820025, 1.52646, 1, 1, 1, 1, 1,
0.6757469, 0.1788681, 1.21043, 0, 0, 1, 1, 1,
0.6772184, -0.1332316, 2.442995, 1, 0, 0, 1, 1,
0.6782256, -0.4352462, 1.777511, 1, 0, 0, 1, 1,
0.6793569, -0.2937167, 4.519025, 1, 0, 0, 1, 1,
0.6804766, 1.767753, 0.3060398, 1, 0, 0, 1, 1,
0.6806476, 0.06371131, 1.081412, 1, 0, 0, 1, 1,
0.6861112, 0.632831, 1.744294, 0, 0, 0, 1, 1,
0.6865655, 1.354358, 0.4051812, 0, 0, 0, 1, 1,
0.6887421, 1.258138, -0.1035521, 0, 0, 0, 1, 1,
0.690918, -0.9339548, 1.391508, 0, 0, 0, 1, 1,
0.7062624, 0.08215287, -0.2951837, 0, 0, 0, 1, 1,
0.7155002, 0.8979408, 0.5448003, 0, 0, 0, 1, 1,
0.7207415, -0.9260399, 2.148956, 0, 0, 0, 1, 1,
0.7228835, -0.7168415, 1.611857, 1, 1, 1, 1, 1,
0.7244532, 1.287801, 0.0396541, 1, 1, 1, 1, 1,
0.7252777, 0.7590398, 1.497038, 1, 1, 1, 1, 1,
0.7270938, 0.08542771, 1.188501, 1, 1, 1, 1, 1,
0.7292847, -1.41342, 2.209895, 1, 1, 1, 1, 1,
0.7303818, -0.6271089, 1.520015, 1, 1, 1, 1, 1,
0.7319335, -0.2482682, 2.141596, 1, 1, 1, 1, 1,
0.7359204, -1.036611, 2.799404, 1, 1, 1, 1, 1,
0.7372739, 0.4807382, 1.354958, 1, 1, 1, 1, 1,
0.7378426, 0.6288736, 1.581023, 1, 1, 1, 1, 1,
0.738951, 1.419558, 0.3353762, 1, 1, 1, 1, 1,
0.7401527, 0.6735945, -2.386362, 1, 1, 1, 1, 1,
0.7552069, 0.2759788, 2.334716, 1, 1, 1, 1, 1,
0.7596304, 0.6672959, 0.3968853, 1, 1, 1, 1, 1,
0.7606011, -0.774744, 2.465953, 1, 1, 1, 1, 1,
0.762134, -1.557707, 3.044789, 0, 0, 1, 1, 1,
0.764248, 0.2570646, 2.054487, 1, 0, 0, 1, 1,
0.7670714, -0.04760904, 1.056766, 1, 0, 0, 1, 1,
0.7674572, -0.3117143, 2.920066, 1, 0, 0, 1, 1,
0.7690506, 0.05062723, 0.01985243, 1, 0, 0, 1, 1,
0.7780578, -0.9557398, 2.328059, 1, 0, 0, 1, 1,
0.7806736, 0.7534083, 0.1457746, 0, 0, 0, 1, 1,
0.7825746, 1.852355, 0.4235934, 0, 0, 0, 1, 1,
0.7831113, 0.754189, 1.479746, 0, 0, 0, 1, 1,
0.7832121, 0.7833573, 2.203463, 0, 0, 0, 1, 1,
0.7847739, -1.534827, 4.674313, 0, 0, 0, 1, 1,
0.7903182, 1.111678, -1.026836, 0, 0, 0, 1, 1,
0.7920778, -0.8983327, 4.507851, 0, 0, 0, 1, 1,
0.7990864, -1.443913, 3.282101, 1, 1, 1, 1, 1,
0.8033386, -1.280977, 2.68362, 1, 1, 1, 1, 1,
0.8069929, -1.574239, 3.205409, 1, 1, 1, 1, 1,
0.8084165, -0.2201567, -0.06057159, 1, 1, 1, 1, 1,
0.8089415, 1.366276, 0.2336976, 1, 1, 1, 1, 1,
0.8092011, 0.2838147, 0.1747915, 1, 1, 1, 1, 1,
0.8092191, 0.02320915, 0.6367964, 1, 1, 1, 1, 1,
0.8118514, 0.7672121, 0.4640607, 1, 1, 1, 1, 1,
0.8120742, 0.6097928, -0.2975414, 1, 1, 1, 1, 1,
0.818242, 0.5742882, 1.571703, 1, 1, 1, 1, 1,
0.8196986, -0.4680895, 2.099734, 1, 1, 1, 1, 1,
0.8255863, 0.3119566, -0.6829897, 1, 1, 1, 1, 1,
0.8344875, -0.1891454, 2.111547, 1, 1, 1, 1, 1,
0.8430113, -1.149202, 1.606764, 1, 1, 1, 1, 1,
0.8447776, 0.06573652, 3.348938, 1, 1, 1, 1, 1,
0.8468726, -0.9050767, 2.068703, 0, 0, 1, 1, 1,
0.8492469, -1.545867, 2.345161, 1, 0, 0, 1, 1,
0.8530147, 0.230771, 1.857173, 1, 0, 0, 1, 1,
0.8535886, -0.4906436, 3.655808, 1, 0, 0, 1, 1,
0.8539256, -0.1541715, 1.503956, 1, 0, 0, 1, 1,
0.8567066, -0.6074322, 2.724608, 1, 0, 0, 1, 1,
0.8603673, 0.6452948, 1.207167, 0, 0, 0, 1, 1,
0.8635882, -0.5122172, 2.763673, 0, 0, 0, 1, 1,
0.8666447, -0.4599604, 2.012449, 0, 0, 0, 1, 1,
0.8673363, -0.1125063, 2.078175, 0, 0, 0, 1, 1,
0.8679287, 0.6370194, 1.108217, 0, 0, 0, 1, 1,
0.870738, -1.137572, 2.055116, 0, 0, 0, 1, 1,
0.8726298, -0.2575891, 1.481584, 0, 0, 0, 1, 1,
0.874292, -2.300517, 1.316175, 1, 1, 1, 1, 1,
0.8818984, 0.6136521, 1.09923, 1, 1, 1, 1, 1,
0.883405, 1.454252, 0.9412898, 1, 1, 1, 1, 1,
0.8851156, -0.9754427, 1.23278, 1, 1, 1, 1, 1,
0.8903476, -0.6072041, 2.723089, 1, 1, 1, 1, 1,
0.8917322, 1.000716, 0.4776258, 1, 1, 1, 1, 1,
0.8919937, 1.12126, 0.4143282, 1, 1, 1, 1, 1,
0.8972486, 0.3361158, 0.4888977, 1, 1, 1, 1, 1,
0.8977455, -0.4873478, 1.933659, 1, 1, 1, 1, 1,
0.8997727, -0.5718966, 0.8750734, 1, 1, 1, 1, 1,
0.9017358, -0.5851513, 3.035993, 1, 1, 1, 1, 1,
0.9073381, 0.02587865, 0.6151559, 1, 1, 1, 1, 1,
0.9105328, -0.2343643, 2.735232, 1, 1, 1, 1, 1,
0.913036, -1.315511, 1.119414, 1, 1, 1, 1, 1,
0.9147611, 0.3847039, 0.2066273, 1, 1, 1, 1, 1,
0.9185703, 0.5348847, 1.148656, 0, 0, 1, 1, 1,
0.930985, 1.760387, 0.916068, 1, 0, 0, 1, 1,
0.9350951, -0.03950006, 1.764671, 1, 0, 0, 1, 1,
0.9383572, -0.2814432, 2.162133, 1, 0, 0, 1, 1,
0.9492738, -1.448095, 4.219113, 1, 0, 0, 1, 1,
0.9503384, 0.5058854, -1.175742, 1, 0, 0, 1, 1,
0.9505627, 0.09859454, 0.3555795, 0, 0, 0, 1, 1,
0.951216, 0.9741694, 2.031957, 0, 0, 0, 1, 1,
0.9528983, 0.8889617, -0.9525315, 0, 0, 0, 1, 1,
0.9550324, -1.307216, 1.177542, 0, 0, 0, 1, 1,
0.9552113, 0.144576, 0.9803507, 0, 0, 0, 1, 1,
0.9553167, 0.5954087, 2.560419, 0, 0, 0, 1, 1,
0.9590151, 0.4542402, 2.239682, 0, 0, 0, 1, 1,
0.9595321, -0.9590374, 2.688176, 1, 1, 1, 1, 1,
0.9668676, 0.6140149, 0.4755534, 1, 1, 1, 1, 1,
0.9715146, -0.9053144, 1.703559, 1, 1, 1, 1, 1,
0.9720536, 1.159245, 1.537191, 1, 1, 1, 1, 1,
0.9727253, 0.733856, 0.6318031, 1, 1, 1, 1, 1,
0.9762117, 0.1175882, -0.7997587, 1, 1, 1, 1, 1,
0.9784423, 0.1405886, 0.7920729, 1, 1, 1, 1, 1,
0.980369, -0.5633969, 2.246958, 1, 1, 1, 1, 1,
0.9938774, -0.3772214, 2.258509, 1, 1, 1, 1, 1,
0.9958888, -0.2673183, 3.466231, 1, 1, 1, 1, 1,
0.999614, 0.4192442, 2.368421, 1, 1, 1, 1, 1,
1.007113, -0.4124405, 2.346278, 1, 1, 1, 1, 1,
1.010933, -1.587813, 2.120449, 1, 1, 1, 1, 1,
1.014889, -0.4086308, 3.232133, 1, 1, 1, 1, 1,
1.03017, -0.8825129, 3.07244, 1, 1, 1, 1, 1,
1.032556, 0.8888715, 1.085467, 0, 0, 1, 1, 1,
1.033807, 2.263194, 1.838095, 1, 0, 0, 1, 1,
1.036313, 0.1141213, 0.9124031, 1, 0, 0, 1, 1,
1.039703, 0.2472872, 0.6808827, 1, 0, 0, 1, 1,
1.040521, -0.209514, 2.444196, 1, 0, 0, 1, 1,
1.041144, -0.5776914, 2.771975, 1, 0, 0, 1, 1,
1.046973, -0.8964015, 3.692777, 0, 0, 0, 1, 1,
1.047037, -0.5252807, 0.5154365, 0, 0, 0, 1, 1,
1.053416, 1.197084, -0.08863822, 0, 0, 0, 1, 1,
1.054326, 1.672217, 0.8036373, 0, 0, 0, 1, 1,
1.05453, -0.4896739, 2.167118, 0, 0, 0, 1, 1,
1.058485, -0.2757886, 1.818958, 0, 0, 0, 1, 1,
1.062063, -1.033017, 3.106995, 0, 0, 0, 1, 1,
1.066671, 0.02743831, 0.3052224, 1, 1, 1, 1, 1,
1.080152, 0.3493185, 0.6073916, 1, 1, 1, 1, 1,
1.084448, -0.9426824, 2.956085, 1, 1, 1, 1, 1,
1.088331, -0.9234655, 1.577486, 1, 1, 1, 1, 1,
1.095151, 0.5008608, -0.5866628, 1, 1, 1, 1, 1,
1.095452, 1.475415, 1.293014, 1, 1, 1, 1, 1,
1.09861, 0.01933099, 0.1025807, 1, 1, 1, 1, 1,
1.098949, 1.147066, 0.5977407, 1, 1, 1, 1, 1,
1.108623, -2.093588, 2.27733, 1, 1, 1, 1, 1,
1.119942, 2.649323, -0.03150967, 1, 1, 1, 1, 1,
1.121721, -0.4276616, 0.3452991, 1, 1, 1, 1, 1,
1.121761, -1.635743, 1.137679, 1, 1, 1, 1, 1,
1.122722, 0.5526971, 1.541608, 1, 1, 1, 1, 1,
1.132094, -0.5478928, 1.529564, 1, 1, 1, 1, 1,
1.132397, -1.010488, 0.334989, 1, 1, 1, 1, 1,
1.139476, -0.3664839, -0.006694105, 0, 0, 1, 1, 1,
1.162963, 2.506484, 0.4408735, 1, 0, 0, 1, 1,
1.174297, 1.494038, 1.826285, 1, 0, 0, 1, 1,
1.176459, -1.179447, 3.114794, 1, 0, 0, 1, 1,
1.178098, 1.173228, 0.06806356, 1, 0, 0, 1, 1,
1.182206, -0.008121949, -0.5639398, 1, 0, 0, 1, 1,
1.185387, 0.1799785, 0.6489341, 0, 0, 0, 1, 1,
1.188768, -1.029611, 2.745819, 0, 0, 0, 1, 1,
1.193476, -0.3916439, 1.620942, 0, 0, 0, 1, 1,
1.204049, -0.3528102, 2.712104, 0, 0, 0, 1, 1,
1.205826, 0.9373763, -0.03098677, 0, 0, 0, 1, 1,
1.217266, -1.066727, 2.313307, 0, 0, 0, 1, 1,
1.218311, 0.4015521, 1.721758, 0, 0, 0, 1, 1,
1.221052, -2.126005, 3.20179, 1, 1, 1, 1, 1,
1.224454, 1.1189, 0.03944422, 1, 1, 1, 1, 1,
1.231382, 1.39044, 1.291295, 1, 1, 1, 1, 1,
1.234281, -0.9127612, 1.81244, 1, 1, 1, 1, 1,
1.239541, 1.327721, 0.3117048, 1, 1, 1, 1, 1,
1.242722, 0.7147481, 1.872077, 1, 1, 1, 1, 1,
1.243736, 0.6876006, 0.9137511, 1, 1, 1, 1, 1,
1.254349, -0.6719075, 1.860214, 1, 1, 1, 1, 1,
1.255002, 0.1524206, 1.866153, 1, 1, 1, 1, 1,
1.256004, 1.308188, 0.9107038, 1, 1, 1, 1, 1,
1.274991, -0.3683725, 2.824526, 1, 1, 1, 1, 1,
1.277256, 0.03715193, 1.963134, 1, 1, 1, 1, 1,
1.281588, -0.7207596, 2.186063, 1, 1, 1, 1, 1,
1.286998, -1.434699, 3.214926, 1, 1, 1, 1, 1,
1.290188, 0.6156597, -0.02904314, 1, 1, 1, 1, 1,
1.302245, 0.7400073, 0.700433, 0, 0, 1, 1, 1,
1.309202, 0.6589525, 1.133971, 1, 0, 0, 1, 1,
1.311757, -0.2509433, 2.472479, 1, 0, 0, 1, 1,
1.317071, -1.030491, 1.897469, 1, 0, 0, 1, 1,
1.324043, 0.2786481, -0.5187081, 1, 0, 0, 1, 1,
1.329403, 0.3129937, 0.264678, 1, 0, 0, 1, 1,
1.332517, 0.1632019, 0.2653103, 0, 0, 0, 1, 1,
1.333249, 0.3434013, 2.208925, 0, 0, 0, 1, 1,
1.338572, 1.056143, 0.9346365, 0, 0, 0, 1, 1,
1.34976, 2.217314, 1.106882, 0, 0, 0, 1, 1,
1.37381, -0.9781456, 2.465561, 0, 0, 0, 1, 1,
1.378408, 0.7856795, 1.926677, 0, 0, 0, 1, 1,
1.389964, -0.9337308, 1.734936, 0, 0, 0, 1, 1,
1.403961, -1.307341, 1.958364, 1, 1, 1, 1, 1,
1.405597, 0.8719564, 1.705945, 1, 1, 1, 1, 1,
1.423304, -0.4052061, 2.204064, 1, 1, 1, 1, 1,
1.424345, -0.4784085, 3.781795, 1, 1, 1, 1, 1,
1.427483, 0.8648682, 0.9428332, 1, 1, 1, 1, 1,
1.429865, 0.8331115, 0.2607411, 1, 1, 1, 1, 1,
1.437984, 0.8851013, 1.827623, 1, 1, 1, 1, 1,
1.438666, -0.6060635, 2.621905, 1, 1, 1, 1, 1,
1.446634, 1.284579, 2.602857, 1, 1, 1, 1, 1,
1.449578, -0.6668429, 1.326296, 1, 1, 1, 1, 1,
1.450376, -0.2583069, 1.479248, 1, 1, 1, 1, 1,
1.457989, 0.06378396, 0.7089685, 1, 1, 1, 1, 1,
1.470826, -0.20016, 3.357625, 1, 1, 1, 1, 1,
1.474362, 0.2504973, 0.9162701, 1, 1, 1, 1, 1,
1.488865, 0.3172715, 1.141199, 1, 1, 1, 1, 1,
1.489416, -0.8990083, 1.644492, 0, 0, 1, 1, 1,
1.492449, -0.9565642, 1.729988, 1, 0, 0, 1, 1,
1.503445, 0.5823443, 1.705109, 1, 0, 0, 1, 1,
1.511822, 0.1418058, 1.017492, 1, 0, 0, 1, 1,
1.520492, -2.091029, 3.034785, 1, 0, 0, 1, 1,
1.522956, 1.363721, -0.7787334, 1, 0, 0, 1, 1,
1.523739, -0.4066314, 2.936955, 0, 0, 0, 1, 1,
1.540961, 0.51184, 0.8243901, 0, 0, 0, 1, 1,
1.54158, 2.060108, 2.384618, 0, 0, 0, 1, 1,
1.5421, 0.2201252, 0.7283176, 0, 0, 0, 1, 1,
1.545039, -1.033818, 1.840376, 0, 0, 0, 1, 1,
1.545445, -0.1599943, 0.551403, 0, 0, 0, 1, 1,
1.549392, 0.5513444, 1.116028, 0, 0, 0, 1, 1,
1.55379, -0.2663742, 1.62609, 1, 1, 1, 1, 1,
1.56589, 0.7497767, 1.427922, 1, 1, 1, 1, 1,
1.579209, 1.121928, -0.4492567, 1, 1, 1, 1, 1,
1.601286, -0.4592149, 2.34814, 1, 1, 1, 1, 1,
1.601299, 0.3277982, 3.047822, 1, 1, 1, 1, 1,
1.609608, -1.194296, 2.610711, 1, 1, 1, 1, 1,
1.617516, 0.01763887, 0.2917715, 1, 1, 1, 1, 1,
1.637424, 0.8257078, 0.181917, 1, 1, 1, 1, 1,
1.637658, -0.2966634, 0.9457744, 1, 1, 1, 1, 1,
1.666034, 0.8650164, -0.4367024, 1, 1, 1, 1, 1,
1.679585, -0.04284213, 2.811266, 1, 1, 1, 1, 1,
1.680569, -1.885761, 1.593865, 1, 1, 1, 1, 1,
1.683624, 0.4568432, 1.836877, 1, 1, 1, 1, 1,
1.702449, -1.302257, 0.9480499, 1, 1, 1, 1, 1,
1.704974, 0.4838066, 2.053695, 1, 1, 1, 1, 1,
1.716338, 0.5644733, 0.1441493, 0, 0, 1, 1, 1,
1.716692, -1.561177, 1.648956, 1, 0, 0, 1, 1,
1.717555, -0.4585408, 1.2776, 1, 0, 0, 1, 1,
1.719392, -0.6430236, 1.769675, 1, 0, 0, 1, 1,
1.736973, -0.7997729, 0.8683001, 1, 0, 0, 1, 1,
1.743303, -0.79221, 1.356539, 1, 0, 0, 1, 1,
1.748308, 1.761551, 0.1480729, 0, 0, 0, 1, 1,
1.762982, 0.03544403, 1.849599, 0, 0, 0, 1, 1,
1.786347, 0.8110319, 1.865674, 0, 0, 0, 1, 1,
1.81826, 0.2520805, 2.201933, 0, 0, 0, 1, 1,
1.831802, -0.3830149, 2.092385, 0, 0, 0, 1, 1,
1.832752, -0.1365265, 1.183619, 0, 0, 0, 1, 1,
1.836477, 0.7602992, -0.9014857, 0, 0, 0, 1, 1,
1.844771, -0.3036058, 1.304556, 1, 1, 1, 1, 1,
1.919177, -0.3689739, 3.371674, 1, 1, 1, 1, 1,
1.921005, -0.2717085, 2.287488, 1, 1, 1, 1, 1,
1.925594, -1.112165, 1.622717, 1, 1, 1, 1, 1,
1.95298, -0.0609358, 1.752004, 1, 1, 1, 1, 1,
1.968937, 0.08854574, 0.3658586, 1, 1, 1, 1, 1,
1.983388, 1.232746, -0.9546427, 1, 1, 1, 1, 1,
1.983969, 0.1116416, 1.03214, 1, 1, 1, 1, 1,
1.98473, 0.7616926, 0.2813561, 1, 1, 1, 1, 1,
1.994492, -0.5096015, 2.226866, 1, 1, 1, 1, 1,
2.007694, 0.2715947, 0.4050565, 1, 1, 1, 1, 1,
2.020515, -1.908122, 1.761293, 1, 1, 1, 1, 1,
2.031641, 1.603586, 1.557763, 1, 1, 1, 1, 1,
2.060405, 0.4603308, 0.685722, 1, 1, 1, 1, 1,
2.073951, -0.9405589, 3.254252, 1, 1, 1, 1, 1,
2.090734, 1.188982, 1.42576, 0, 0, 1, 1, 1,
2.11271, -1.095856, 1.583287, 1, 0, 0, 1, 1,
2.137409, 1.102652, 2.375483, 1, 0, 0, 1, 1,
2.141586, 0.4501102, 1.08481, 1, 0, 0, 1, 1,
2.166125, -0.6044925, 2.402776, 1, 0, 0, 1, 1,
2.229498, 0.3617217, 0.5004651, 1, 0, 0, 1, 1,
2.239486, -0.8308874, 1.460758, 0, 0, 0, 1, 1,
2.24791, 2.191028, -0.7755824, 0, 0, 0, 1, 1,
2.32918, 0.6529668, 0.3774244, 0, 0, 0, 1, 1,
2.375409, 1.58166, 0.3883355, 0, 0, 0, 1, 1,
2.395156, -1.023455, 0.9841166, 0, 0, 0, 1, 1,
2.502412, 0.0561216, 2.438276, 0, 0, 0, 1, 1,
2.550549, -0.5857825, 1.415056, 0, 0, 0, 1, 1,
2.744081, -3.021935, 3.068179, 1, 1, 1, 1, 1,
2.752233, 0.08338069, 1.684772, 1, 1, 1, 1, 1,
2.846049, -0.6947928, 2.395412, 1, 1, 1, 1, 1,
3.289529, 1.068744, 0.5586468, 1, 1, 1, 1, 1,
3.387384, -0.3370577, 1.110283, 1, 1, 1, 1, 1,
3.487756, -1.438018, 1.067145, 1, 1, 1, 1, 1,
3.571067, 0.3652245, 3.273519, 1, 1, 1, 1, 1
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
var radius = 9.315543;
var distance = 32.72045;
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
mvMatrix.translate( -0.1409945, 0.3879849, 0.2597389 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.72045);
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
