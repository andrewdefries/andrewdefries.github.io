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
-3.173607, 1.954432, -0.3602086, 1, 0, 0, 1,
-2.918406, 0.4289466, -1.566756, 1, 0.007843138, 0, 1,
-2.755716, -0.4543552, -2.344002, 1, 0.01176471, 0, 1,
-2.754452, -1.430763, -3.217759, 1, 0.01960784, 0, 1,
-2.65679, 1.786942, -1.972278, 1, 0.02352941, 0, 1,
-2.601084, -0.9460217, -0.7926661, 1, 0.03137255, 0, 1,
-2.446157, 0.1268737, -1.309894, 1, 0.03529412, 0, 1,
-2.436654, -1.479995, -1.685976, 1, 0.04313726, 0, 1,
-2.361006, 0.7999865, -1.038537, 1, 0.04705882, 0, 1,
-2.360807, -0.237123, -0.04182684, 1, 0.05490196, 0, 1,
-2.265702, 0.6071578, -2.129353, 1, 0.05882353, 0, 1,
-2.195619, 0.1040433, -2.67953, 1, 0.06666667, 0, 1,
-2.170185, 1.660095, -1.460196, 1, 0.07058824, 0, 1,
-2.149755, 1.929344, 0.5655442, 1, 0.07843138, 0, 1,
-2.144341, 0.6260401, -1.005077, 1, 0.08235294, 0, 1,
-2.132652, -0.476189, -3.36915, 1, 0.09019608, 0, 1,
-2.085927, -0.2486456, -2.68072, 1, 0.09411765, 0, 1,
-2.043225, -0.3007112, -0.8095496, 1, 0.1019608, 0, 1,
-2.002111, 1.642961, 0.1789661, 1, 0.1098039, 0, 1,
-2.00141, 0.3059807, -0.3320664, 1, 0.1137255, 0, 1,
-1.982787, -0.1149585, -2.06446, 1, 0.1215686, 0, 1,
-1.971073, 1.250869, -1.100597, 1, 0.1254902, 0, 1,
-1.959494, -0.5941293, -2.399148, 1, 0.1333333, 0, 1,
-1.921221, -0.2418769, -1.186257, 1, 0.1372549, 0, 1,
-1.863483, 2.464648, -0.5266483, 1, 0.145098, 0, 1,
-1.861895, -1.063737, -2.881546, 1, 0.1490196, 0, 1,
-1.856182, 0.1464627, -1.888191, 1, 0.1568628, 0, 1,
-1.850269, -2.519888, -3.824711, 1, 0.1607843, 0, 1,
-1.808242, 0.8005772, -3.415843, 1, 0.1686275, 0, 1,
-1.802944, -0.5115246, -3.825791, 1, 0.172549, 0, 1,
-1.793188, -0.01404668, -1.616623, 1, 0.1803922, 0, 1,
-1.78905, -0.1232652, -2.713642, 1, 0.1843137, 0, 1,
-1.782152, -1.117751, -2.289528, 1, 0.1921569, 0, 1,
-1.780779, -2.082637, -2.496778, 1, 0.1960784, 0, 1,
-1.774693, -0.06544714, -0.6872384, 1, 0.2039216, 0, 1,
-1.773499, -0.2358437, -2.263506, 1, 0.2117647, 0, 1,
-1.76846, 1.079038, -0.9434031, 1, 0.2156863, 0, 1,
-1.764509, -0.2253524, -1.800078, 1, 0.2235294, 0, 1,
-1.761683, -0.05574135, -0.01006631, 1, 0.227451, 0, 1,
-1.7508, -0.9251459, -1.375836, 1, 0.2352941, 0, 1,
-1.749224, 0.6795093, -0.5651267, 1, 0.2392157, 0, 1,
-1.748954, -0.4212632, -2.318879, 1, 0.2470588, 0, 1,
-1.730648, -1.254683, -0.7584239, 1, 0.2509804, 0, 1,
-1.728676, 0.1864776, -0.627866, 1, 0.2588235, 0, 1,
-1.7272, 0.3486008, -1.978963, 1, 0.2627451, 0, 1,
-1.713129, 0.301815, 0.2346533, 1, 0.2705882, 0, 1,
-1.70622, 0.9708053, -0.3786093, 1, 0.2745098, 0, 1,
-1.701683, 0.1804726, -1.29686, 1, 0.282353, 0, 1,
-1.698372, 0.3208114, -2.165281, 1, 0.2862745, 0, 1,
-1.69225, -0.7043149, -2.978485, 1, 0.2941177, 0, 1,
-1.691568, 1.127364, -3.142645, 1, 0.3019608, 0, 1,
-1.690795, 0.1650838, -0.725651, 1, 0.3058824, 0, 1,
-1.682927, 0.178469, -1.354053, 1, 0.3137255, 0, 1,
-1.677471, -0.5392612, -0.3547712, 1, 0.3176471, 0, 1,
-1.674039, -0.7095754, -2.298314, 1, 0.3254902, 0, 1,
-1.659599, -0.7559975, -2.694211, 1, 0.3294118, 0, 1,
-1.644662, -0.3745905, -1.085962, 1, 0.3372549, 0, 1,
-1.638399, 0.6157876, -1.355425, 1, 0.3411765, 0, 1,
-1.633625, -0.3077471, -3.219531, 1, 0.3490196, 0, 1,
-1.624294, -1.525364, -2.198289, 1, 0.3529412, 0, 1,
-1.609531, 0.7373209, -0.1665933, 1, 0.3607843, 0, 1,
-1.603319, 1.308257, -0.03330366, 1, 0.3647059, 0, 1,
-1.594817, 0.1619034, -1.92216, 1, 0.372549, 0, 1,
-1.577882, -1.295858, -3.066211, 1, 0.3764706, 0, 1,
-1.570559, 0.2774426, -2.400763, 1, 0.3843137, 0, 1,
-1.569478, -0.7617357, -3.415157, 1, 0.3882353, 0, 1,
-1.561473, 0.8464231, 0.04088219, 1, 0.3960784, 0, 1,
-1.559341, -0.4894458, -1.996146, 1, 0.4039216, 0, 1,
-1.556955, 0.6588047, -0.5067678, 1, 0.4078431, 0, 1,
-1.542048, 1.117114, -1.235868, 1, 0.4156863, 0, 1,
-1.541594, -0.398121, -2.745201, 1, 0.4196078, 0, 1,
-1.492118, -0.1641654, -2.723487, 1, 0.427451, 0, 1,
-1.486609, -0.615644, -1.05284, 1, 0.4313726, 0, 1,
-1.485965, 1.368134, -2.498544, 1, 0.4392157, 0, 1,
-1.472876, -0.7280546, -2.629697, 1, 0.4431373, 0, 1,
-1.460453, 0.7461918, -1.907336, 1, 0.4509804, 0, 1,
-1.458344, -0.313178, -0.5613465, 1, 0.454902, 0, 1,
-1.4496, -0.7753156, -1.562752, 1, 0.4627451, 0, 1,
-1.445198, -0.5628185, -1.275591, 1, 0.4666667, 0, 1,
-1.4397, 0.8730393, -1.038157, 1, 0.4745098, 0, 1,
-1.437749, 0.349839, -1.123001, 1, 0.4784314, 0, 1,
-1.431138, -0.2264123, -3.280891, 1, 0.4862745, 0, 1,
-1.427863, -0.2592887, -1.422277, 1, 0.4901961, 0, 1,
-1.423705, 1.217459, -1.212261, 1, 0.4980392, 0, 1,
-1.42118, 1.907336, -0.2297189, 1, 0.5058824, 0, 1,
-1.420223, 0.1710993, -0.0588064, 1, 0.509804, 0, 1,
-1.415267, 0.5722407, 0.004070498, 1, 0.5176471, 0, 1,
-1.410578, -0.348826, -1.351508, 1, 0.5215687, 0, 1,
-1.393878, 1.043957, -0.0302394, 1, 0.5294118, 0, 1,
-1.386988, 0.9411253, -2.06289, 1, 0.5333334, 0, 1,
-1.375507, 0.7462991, 0.2899652, 1, 0.5411765, 0, 1,
-1.360908, -0.2075809, -0.1433134, 1, 0.5450981, 0, 1,
-1.349302, -0.6731712, -1.357681, 1, 0.5529412, 0, 1,
-1.34245, 0.2503285, -1.863641, 1, 0.5568628, 0, 1,
-1.341466, 1.087913, -0.4898077, 1, 0.5647059, 0, 1,
-1.330453, -1.653542, -3.352006, 1, 0.5686275, 0, 1,
-1.326528, -1.385026, -3.627653, 1, 0.5764706, 0, 1,
-1.325893, -1.400532, -2.039369, 1, 0.5803922, 0, 1,
-1.320816, -0.1909566, -1.581486, 1, 0.5882353, 0, 1,
-1.320082, -0.4893792, -2.251956, 1, 0.5921569, 0, 1,
-1.318491, -1.317788, -3.915459, 1, 0.6, 0, 1,
-1.3154, -1.567276, -0.1634293, 1, 0.6078432, 0, 1,
-1.313533, 0.3660483, -0.340668, 1, 0.6117647, 0, 1,
-1.309954, 0.8377888, 0.5585129, 1, 0.6196079, 0, 1,
-1.309137, 0.9586254, -0.5446224, 1, 0.6235294, 0, 1,
-1.305208, 0.218719, -1.657634, 1, 0.6313726, 0, 1,
-1.299524, -1.46514, -5.218534, 1, 0.6352941, 0, 1,
-1.296451, -1.055897, -3.66832, 1, 0.6431373, 0, 1,
-1.288194, -1.227113, -1.272017, 1, 0.6470588, 0, 1,
-1.288074, -1.686595, -4.036251, 1, 0.654902, 0, 1,
-1.284898, 0.653025, 1.233865, 1, 0.6588235, 0, 1,
-1.266476, -1.509839, -2.491501, 1, 0.6666667, 0, 1,
-1.258259, -0.01691127, -0.1764977, 1, 0.6705883, 0, 1,
-1.25683, -0.5573238, -3.797368, 1, 0.6784314, 0, 1,
-1.256271, 0.1253532, -1.734915, 1, 0.682353, 0, 1,
-1.255942, 0.5205262, -0.8600248, 1, 0.6901961, 0, 1,
-1.232313, -0.5632291, -0.9916908, 1, 0.6941177, 0, 1,
-1.227026, 0.7311909, 1.184576, 1, 0.7019608, 0, 1,
-1.222397, -0.6988587, -1.827909, 1, 0.7098039, 0, 1,
-1.222246, -0.4710584, -2.398067, 1, 0.7137255, 0, 1,
-1.213626, 1.01815, -1.819244, 1, 0.7215686, 0, 1,
-1.209749, 0.9328907, -1.439243, 1, 0.7254902, 0, 1,
-1.2028, -0.6667798, -3.321906, 1, 0.7333333, 0, 1,
-1.19279, -0.4763208, -1.201109, 1, 0.7372549, 0, 1,
-1.192713, 0.8352432, -0.6802641, 1, 0.7450981, 0, 1,
-1.188051, -0.02407538, -2.197177, 1, 0.7490196, 0, 1,
-1.186159, -0.05023746, -0.5665944, 1, 0.7568628, 0, 1,
-1.182667, 1.083037, -1.140887, 1, 0.7607843, 0, 1,
-1.164349, -1.428316, -2.937206, 1, 0.7686275, 0, 1,
-1.158042, 0.7410051, -0.8494921, 1, 0.772549, 0, 1,
-1.153533, -0.4858548, -1.714834, 1, 0.7803922, 0, 1,
-1.146831, 0.2687171, -0.6236497, 1, 0.7843137, 0, 1,
-1.146035, -0.3204138, -0.9484943, 1, 0.7921569, 0, 1,
-1.143361, 1.306404, 0.7394647, 1, 0.7960784, 0, 1,
-1.142999, -0.7813622, -2.452222, 1, 0.8039216, 0, 1,
-1.12719, 1.337802, 2.014731, 1, 0.8117647, 0, 1,
-1.124836, -0.09889781, -1.49963, 1, 0.8156863, 0, 1,
-1.120611, 0.2925305, -1.71811, 1, 0.8235294, 0, 1,
-1.119283, -0.8186525, -1.345556, 1, 0.827451, 0, 1,
-1.117257, 0.3659153, -1.102224, 1, 0.8352941, 0, 1,
-1.112099, 1.035554, -0.07972553, 1, 0.8392157, 0, 1,
-1.109718, -0.877211, -3.643589, 1, 0.8470588, 0, 1,
-1.09998, 0.3528256, -2.27409, 1, 0.8509804, 0, 1,
-1.096926, 2.315057, -0.08127267, 1, 0.8588235, 0, 1,
-1.085467, 1.820036, 0.6601873, 1, 0.8627451, 0, 1,
-1.070951, -1.640245, -3.020718, 1, 0.8705882, 0, 1,
-1.070774, 0.3189956, -2.902812, 1, 0.8745098, 0, 1,
-1.061478, -0.5218146, -2.596917, 1, 0.8823529, 0, 1,
-1.060637, -0.2689337, -0.7503537, 1, 0.8862745, 0, 1,
-1.057781, -0.990236, -3.775029, 1, 0.8941177, 0, 1,
-1.057477, -1.555597, -4.031265, 1, 0.8980392, 0, 1,
-1.056313, -2.05516, -2.895622, 1, 0.9058824, 0, 1,
-1.052267, -0.9240517, -2.020924, 1, 0.9137255, 0, 1,
-1.049883, 0.8902797, -1.930962, 1, 0.9176471, 0, 1,
-1.046431, -1.793807, -3.077208, 1, 0.9254902, 0, 1,
-1.045313, 1.880708, -2.685368, 1, 0.9294118, 0, 1,
-1.044829, -0.7896783, -1.409966, 1, 0.9372549, 0, 1,
-1.03627, 0.5443874, -0.8013316, 1, 0.9411765, 0, 1,
-1.03182, -0.6112535, -2.632207, 1, 0.9490196, 0, 1,
-1.031688, 1.25997, -0.7092144, 1, 0.9529412, 0, 1,
-1.027796, -0.9948411, -3.806372, 1, 0.9607843, 0, 1,
-1.022908, 0.2645526, -0.1910415, 1, 0.9647059, 0, 1,
-1.022468, -0.7794677, -4.920463, 1, 0.972549, 0, 1,
-1.01817, 1.117632, -1.485408, 1, 0.9764706, 0, 1,
-1.013988, 0.2735461, -0.3224331, 1, 0.9843137, 0, 1,
-1.006443, 1.75057, 0.8229578, 1, 0.9882353, 0, 1,
-1.005966, -0.6752272, -2.458234, 1, 0.9960784, 0, 1,
-0.9999382, 0.2863691, -1.875404, 0.9960784, 1, 0, 1,
-0.9877741, 0.06858839, -0.701713, 0.9921569, 1, 0, 1,
-0.9830437, 0.9881234, -0.5126351, 0.9843137, 1, 0, 1,
-0.9811313, -0.2354483, -1.10206, 0.9803922, 1, 0, 1,
-0.980318, 1.017688, 1.364195, 0.972549, 1, 0, 1,
-0.9698683, 0.2103264, -1.664793, 0.9686275, 1, 0, 1,
-0.9698117, 0.3838153, -0.05605099, 0.9607843, 1, 0, 1,
-0.9689752, 0.7011568, 0.1795452, 0.9568627, 1, 0, 1,
-0.9615548, -0.9323498, -1.465609, 0.9490196, 1, 0, 1,
-0.9611067, -2.083778, -3.216207, 0.945098, 1, 0, 1,
-0.9588879, -0.01203475, -2.32097, 0.9372549, 1, 0, 1,
-0.9568505, 1.163298, 0.7695356, 0.9333333, 1, 0, 1,
-0.9558697, -0.7591835, -2.405138, 0.9254902, 1, 0, 1,
-0.9521632, -0.5427617, -0.288864, 0.9215686, 1, 0, 1,
-0.9479044, -0.2690916, -1.152756, 0.9137255, 1, 0, 1,
-0.9428274, 3.788092, -0.4643054, 0.9098039, 1, 0, 1,
-0.9404975, -0.6889004, -2.064864, 0.9019608, 1, 0, 1,
-0.9260372, -0.5347241, -2.143504, 0.8941177, 1, 0, 1,
-0.9201034, -1.245742, -2.267568, 0.8901961, 1, 0, 1,
-0.918869, 0.4740058, -0.9498094, 0.8823529, 1, 0, 1,
-0.9105238, 0.3562506, -1.83706, 0.8784314, 1, 0, 1,
-0.9100187, -0.4613405, -4.390988, 0.8705882, 1, 0, 1,
-0.9093476, -0.6663951, -4.287365, 0.8666667, 1, 0, 1,
-0.9066054, -1.299357, -2.507225, 0.8588235, 1, 0, 1,
-0.898965, -0.2785133, -1.958522, 0.854902, 1, 0, 1,
-0.8971858, 0.5664995, 0.1854217, 0.8470588, 1, 0, 1,
-0.8928, 0.5002306, -3.224563, 0.8431373, 1, 0, 1,
-0.8923985, 0.70167, -2.110703, 0.8352941, 1, 0, 1,
-0.8842758, -0.5234821, -2.033887, 0.8313726, 1, 0, 1,
-0.8841165, -0.2330333, -0.2367975, 0.8235294, 1, 0, 1,
-0.8812799, -1.110432, -2.505555, 0.8196079, 1, 0, 1,
-0.8768874, 0.4216829, -0.2084384, 0.8117647, 1, 0, 1,
-0.8767449, -0.3432081, -1.83147, 0.8078431, 1, 0, 1,
-0.865643, -0.7192168, -3.09918, 0.8, 1, 0, 1,
-0.8651639, -0.8009624, -2.989937, 0.7921569, 1, 0, 1,
-0.8632392, 0.3270271, -2.123606, 0.7882353, 1, 0, 1,
-0.8550279, -1.026252, -3.421997, 0.7803922, 1, 0, 1,
-0.8526398, 0.451587, -1.609421, 0.7764706, 1, 0, 1,
-0.8519005, 0.9838406, -1.209007, 0.7686275, 1, 0, 1,
-0.8503801, 0.432521, -3.282764, 0.7647059, 1, 0, 1,
-0.8458781, 1.088127, -1.829587, 0.7568628, 1, 0, 1,
-0.8386316, 0.1455319, -0.00596102, 0.7529412, 1, 0, 1,
-0.8333343, -0.8541251, -2.589171, 0.7450981, 1, 0, 1,
-0.8306319, 0.2981294, -1.66535, 0.7411765, 1, 0, 1,
-0.8303266, 1.315391, 0.4797314, 0.7333333, 1, 0, 1,
-0.8300548, 0.5487518, -0.28845, 0.7294118, 1, 0, 1,
-0.8299218, -0.2937319, -1.589689, 0.7215686, 1, 0, 1,
-0.8283344, -2.013068, -3.927144, 0.7176471, 1, 0, 1,
-0.8256923, -0.2475288, -0.4790396, 0.7098039, 1, 0, 1,
-0.8228216, 0.321568, -1.203133, 0.7058824, 1, 0, 1,
-0.8193585, 1.714706, -0.7146121, 0.6980392, 1, 0, 1,
-0.8188141, 0.2535931, -1.942631, 0.6901961, 1, 0, 1,
-0.8173308, -0.259517, -1.818161, 0.6862745, 1, 0, 1,
-0.8166237, 0.8942773, -3.026829, 0.6784314, 1, 0, 1,
-0.8139918, -0.441999, -2.411753, 0.6745098, 1, 0, 1,
-0.8116738, -0.01827329, -1.983147, 0.6666667, 1, 0, 1,
-0.8072239, -0.256485, -0.7045029, 0.6627451, 1, 0, 1,
-0.802983, -0.4011959, -3.034508, 0.654902, 1, 0, 1,
-0.800357, 0.3282551, -0.7873827, 0.6509804, 1, 0, 1,
-0.7978861, 0.1292456, -0.19268, 0.6431373, 1, 0, 1,
-0.7919834, 0.07679606, -1.337401, 0.6392157, 1, 0, 1,
-0.7858099, -0.09035413, -2.727162, 0.6313726, 1, 0, 1,
-0.7844579, -1.084535, -3.42429, 0.627451, 1, 0, 1,
-0.7835609, -0.1219304, -0.8117304, 0.6196079, 1, 0, 1,
-0.7724472, -0.782465, -2.99942, 0.6156863, 1, 0, 1,
-0.7705252, 0.09275901, -2.398948, 0.6078432, 1, 0, 1,
-0.7687274, -0.5524542, -1.163638, 0.6039216, 1, 0, 1,
-0.7659591, -0.3937758, -2.627832, 0.5960785, 1, 0, 1,
-0.756507, -1.574712, -2.621751, 0.5882353, 1, 0, 1,
-0.7557939, 0.1042637, -3.920509, 0.5843138, 1, 0, 1,
-0.7530715, 0.1626153, -0.6500614, 0.5764706, 1, 0, 1,
-0.7525668, -0.5792077, -2.052617, 0.572549, 1, 0, 1,
-0.7492588, -0.4523914, -2.375098, 0.5647059, 1, 0, 1,
-0.7452692, -0.5276577, -1.953081, 0.5607843, 1, 0, 1,
-0.7446404, -0.9572558, -2.438293, 0.5529412, 1, 0, 1,
-0.7440621, -0.9804193, -1.520478, 0.5490196, 1, 0, 1,
-0.7440494, -0.5885136, -0.3779315, 0.5411765, 1, 0, 1,
-0.7415025, 0.01010227, -2.367647, 0.5372549, 1, 0, 1,
-0.7335674, 0.8735544, 0.3777656, 0.5294118, 1, 0, 1,
-0.7301694, -0.6350278, -2.200549, 0.5254902, 1, 0, 1,
-0.7272459, 0.3651454, -0.598893, 0.5176471, 1, 0, 1,
-0.7249804, -0.4799908, -2.845746, 0.5137255, 1, 0, 1,
-0.7249643, -0.3797756, -1.444227, 0.5058824, 1, 0, 1,
-0.7248288, 2.656529, 0.2690547, 0.5019608, 1, 0, 1,
-0.7241241, -1.968328, -1.350157, 0.4941176, 1, 0, 1,
-0.7239926, 0.1342858, -2.428199, 0.4862745, 1, 0, 1,
-0.7192386, 0.6970524, -0.6554893, 0.4823529, 1, 0, 1,
-0.7191308, -0.5507303, -2.355758, 0.4745098, 1, 0, 1,
-0.7110342, -0.3899118, -2.502765, 0.4705882, 1, 0, 1,
-0.7094466, 0.4797788, 0.06183618, 0.4627451, 1, 0, 1,
-0.7083587, -0.6264179, -0.3939707, 0.4588235, 1, 0, 1,
-0.7074974, -0.009993603, -1.486265, 0.4509804, 1, 0, 1,
-0.7058206, -0.3888217, -1.709323, 0.4470588, 1, 0, 1,
-0.6980538, 1.297147, -0.2261617, 0.4392157, 1, 0, 1,
-0.6972321, -2.526163, -1.137496, 0.4352941, 1, 0, 1,
-0.6951935, -0.9140819, -2.572857, 0.427451, 1, 0, 1,
-0.6937438, -0.378551, -0.4333429, 0.4235294, 1, 0, 1,
-0.6927755, 1.566196, -1.301723, 0.4156863, 1, 0, 1,
-0.6875705, -2.139619, -2.404194, 0.4117647, 1, 0, 1,
-0.6821888, 1.310123, 1.060822, 0.4039216, 1, 0, 1,
-0.6765651, 0.4448541, 0.1189061, 0.3960784, 1, 0, 1,
-0.6756554, 0.6542996, 0.1858299, 0.3921569, 1, 0, 1,
-0.6752698, -0.2661501, -2.254444, 0.3843137, 1, 0, 1,
-0.6714295, -0.004455592, -1.743954, 0.3803922, 1, 0, 1,
-0.6683674, 0.3824935, -0.444006, 0.372549, 1, 0, 1,
-0.6667016, 0.2532914, -0.7780081, 0.3686275, 1, 0, 1,
-0.6636268, 1.389921, -0.4066031, 0.3607843, 1, 0, 1,
-0.6581445, 1.221786, 0.1293115, 0.3568628, 1, 0, 1,
-0.6560028, 0.5432659, -0.4303513, 0.3490196, 1, 0, 1,
-0.6466628, -1.472511, -0.8167105, 0.345098, 1, 0, 1,
-0.641467, 0.9544698, -0.1449694, 0.3372549, 1, 0, 1,
-0.6413777, 0.3237523, -0.5517406, 0.3333333, 1, 0, 1,
-0.6359617, 1.10204, -2.599073, 0.3254902, 1, 0, 1,
-0.6350448, -1.040731, -1.276578, 0.3215686, 1, 0, 1,
-0.6303091, 0.306101, -0.7222062, 0.3137255, 1, 0, 1,
-0.6287813, 0.1641482, -3.755792, 0.3098039, 1, 0, 1,
-0.628061, -0.3071559, -2.758989, 0.3019608, 1, 0, 1,
-0.6223226, -1.162727, -4.638569, 0.2941177, 1, 0, 1,
-0.621932, -0.8965591, -3.765254, 0.2901961, 1, 0, 1,
-0.6117439, -1.23431, -2.282444, 0.282353, 1, 0, 1,
-0.6082678, -0.5989403, -2.552011, 0.2784314, 1, 0, 1,
-0.6074912, -1.060893, -2.711217, 0.2705882, 1, 0, 1,
-0.6065444, 0.6805968, -0.169393, 0.2666667, 1, 0, 1,
-0.604808, 1.286928, 0.4067625, 0.2588235, 1, 0, 1,
-0.5996344, 0.3009296, -0.2564186, 0.254902, 1, 0, 1,
-0.5993383, -1.206524, -2.288276, 0.2470588, 1, 0, 1,
-0.5962095, -1.197401, -1.101742, 0.2431373, 1, 0, 1,
-0.591418, 0.716361, 0.5073786, 0.2352941, 1, 0, 1,
-0.5865639, -0.1544807, -3.665432, 0.2313726, 1, 0, 1,
-0.5798895, 1.036993, -1.197388, 0.2235294, 1, 0, 1,
-0.5792958, 0.416175, -0.7846224, 0.2196078, 1, 0, 1,
-0.5758482, 0.9721322, -1.694046, 0.2117647, 1, 0, 1,
-0.5676007, -0.664844, -2.84485, 0.2078431, 1, 0, 1,
-0.5638494, -0.4657256, -2.151285, 0.2, 1, 0, 1,
-0.5596123, 0.2373436, -2.16994, 0.1921569, 1, 0, 1,
-0.5589918, -0.1169867, -1.78865, 0.1882353, 1, 0, 1,
-0.5587673, 0.7420423, -0.5082257, 0.1803922, 1, 0, 1,
-0.5561043, 2.355254, -0.2872745, 0.1764706, 1, 0, 1,
-0.5468229, -0.2766546, -2.868589, 0.1686275, 1, 0, 1,
-0.5462553, 1.491958, -1.971289, 0.1647059, 1, 0, 1,
-0.5415566, 0.8050897, -0.9548247, 0.1568628, 1, 0, 1,
-0.5350587, 1.170992, -1.12308, 0.1529412, 1, 0, 1,
-0.5325601, 1.300526, -0.5828881, 0.145098, 1, 0, 1,
-0.5299239, -1.334342, -2.742332, 0.1411765, 1, 0, 1,
-0.5285088, -0.0451481, -2.50667, 0.1333333, 1, 0, 1,
-0.5257356, -1.263957, -2.961734, 0.1294118, 1, 0, 1,
-0.5242261, 0.01223001, -0.941382, 0.1215686, 1, 0, 1,
-0.524047, -0.591122, -2.846813, 0.1176471, 1, 0, 1,
-0.5232023, -1.085474, -3.123206, 0.1098039, 1, 0, 1,
-0.5231736, 0.2586457, -0.02865926, 0.1058824, 1, 0, 1,
-0.5221642, 1.020464, -0.6963813, 0.09803922, 1, 0, 1,
-0.5212773, -0.008514912, -1.063687, 0.09019608, 1, 0, 1,
-0.5206475, 0.1265002, -0.5631545, 0.08627451, 1, 0, 1,
-0.5187571, 0.533599, -1.579556, 0.07843138, 1, 0, 1,
-0.5114684, 0.9267884, -0.5124618, 0.07450981, 1, 0, 1,
-0.5112129, -1.771117, -4.032901, 0.06666667, 1, 0, 1,
-0.5059117, 0.7207829, -2.439785, 0.0627451, 1, 0, 1,
-0.5034088, 0.2174343, -1.440945, 0.05490196, 1, 0, 1,
-0.5015129, 0.5737849, -1.562419, 0.05098039, 1, 0, 1,
-0.4987919, -1.404145, -4.002525, 0.04313726, 1, 0, 1,
-0.4977156, -0.5451748, -2.745076, 0.03921569, 1, 0, 1,
-0.495186, 0.134493, -3.503545, 0.03137255, 1, 0, 1,
-0.4942331, -0.2583945, -0.9949412, 0.02745098, 1, 0, 1,
-0.4931321, 1.203514, 1.247873, 0.01960784, 1, 0, 1,
-0.4902819, 0.4994937, -1.387476, 0.01568628, 1, 0, 1,
-0.4894349, -0.747835, -1.765128, 0.007843138, 1, 0, 1,
-0.4872195, -2.024637, -3.568794, 0.003921569, 1, 0, 1,
-0.4847767, -0.03231555, -2.657234, 0, 1, 0.003921569, 1,
-0.4764766, 0.05698861, -0.9144247, 0, 1, 0.01176471, 1,
-0.4749041, 1.108078, 0.05606706, 0, 1, 0.01568628, 1,
-0.4711269, 0.1967377, -0.3706971, 0, 1, 0.02352941, 1,
-0.4644597, 1.082738, 0.366753, 0, 1, 0.02745098, 1,
-0.463398, 1.762173, 0.851143, 0, 1, 0.03529412, 1,
-0.4632317, 0.540777, -0.0669264, 0, 1, 0.03921569, 1,
-0.4616996, 1.24651, -1.098192, 0, 1, 0.04705882, 1,
-0.4595575, -0.4781386, -2.790578, 0, 1, 0.05098039, 1,
-0.4450192, -0.5504165, -2.019347, 0, 1, 0.05882353, 1,
-0.4444926, -1.337679, -2.672451, 0, 1, 0.0627451, 1,
-0.4433442, -0.04825813, -0.2435829, 0, 1, 0.07058824, 1,
-0.4421818, 1.424397, 1.594332, 0, 1, 0.07450981, 1,
-0.4413377, -0.3896728, -1.713791, 0, 1, 0.08235294, 1,
-0.4410678, 0.5956216, -0.4843489, 0, 1, 0.08627451, 1,
-0.440926, -0.8187157, -2.534425, 0, 1, 0.09411765, 1,
-0.4391542, -0.939158, -2.52629, 0, 1, 0.1019608, 1,
-0.4360728, -1.556696, -3.09519, 0, 1, 0.1058824, 1,
-0.4348451, 1.004989, -0.547468, 0, 1, 0.1137255, 1,
-0.4318317, 0.9199275, -0.8325409, 0, 1, 0.1176471, 1,
-0.431436, -0.5309251, -1.787617, 0, 1, 0.1254902, 1,
-0.4307792, 0.5547991, -0.489203, 0, 1, 0.1294118, 1,
-0.4291715, 0.2609693, -1.536019, 0, 1, 0.1372549, 1,
-0.4213752, -0.165987, -0.7144884, 0, 1, 0.1411765, 1,
-0.4205359, -1.069864, -3.820645, 0, 1, 0.1490196, 1,
-0.4194182, -0.7042884, -2.026904, 0, 1, 0.1529412, 1,
-0.4087823, -1.419932, -4.997099, 0, 1, 0.1607843, 1,
-0.4063821, 0.03177907, -0.6854479, 0, 1, 0.1647059, 1,
-0.4057755, 0.7389226, -1.643153, 0, 1, 0.172549, 1,
-0.3968685, -0.138797, -2.811866, 0, 1, 0.1764706, 1,
-0.3934661, -0.4656464, -2.678622, 0, 1, 0.1843137, 1,
-0.3890544, 0.1366849, -0.6634856, 0, 1, 0.1882353, 1,
-0.3858298, 0.6236909, -1.377976, 0, 1, 0.1960784, 1,
-0.3806692, -0.4308357, -1.586082, 0, 1, 0.2039216, 1,
-0.3802187, 2.662539, 0.3378911, 0, 1, 0.2078431, 1,
-0.3731831, -0.3094828, -2.542848, 0, 1, 0.2156863, 1,
-0.3704977, -1.456589, -3.296233, 0, 1, 0.2196078, 1,
-0.3704611, 0.5773351, -0.4583037, 0, 1, 0.227451, 1,
-0.3688431, -2.278986, -2.946519, 0, 1, 0.2313726, 1,
-0.3677236, 0.8779996, -1.018011, 0, 1, 0.2392157, 1,
-0.3652726, -2.456474, -2.422219, 0, 1, 0.2431373, 1,
-0.3617213, 0.5578742, -2.290491, 0, 1, 0.2509804, 1,
-0.3538647, -1.10101, -2.494893, 0, 1, 0.254902, 1,
-0.3514909, 0.5513857, -2.042083, 0, 1, 0.2627451, 1,
-0.345096, -1.086629, -4.123068, 0, 1, 0.2666667, 1,
-0.3418875, -0.7088802, -0.883659, 0, 1, 0.2745098, 1,
-0.3357774, -0.5448372, -2.720713, 0, 1, 0.2784314, 1,
-0.3351604, 0.499341, -1.479886, 0, 1, 0.2862745, 1,
-0.3338881, -1.230134, -3.476177, 0, 1, 0.2901961, 1,
-0.333673, -0.5862187, -4.204238, 0, 1, 0.2980392, 1,
-0.3330559, -1.775306, -1.523594, 0, 1, 0.3058824, 1,
-0.3221293, -0.9357291, -3.730275, 0, 1, 0.3098039, 1,
-0.3215932, 0.1949735, -1.633012, 0, 1, 0.3176471, 1,
-0.3178149, 0.08984251, -0.9682767, 0, 1, 0.3215686, 1,
-0.3175384, 1.168218, 0.7919446, 0, 1, 0.3294118, 1,
-0.3145466, -0.1291669, -0.3346213, 0, 1, 0.3333333, 1,
-0.3140043, 0.08349031, -1.974783, 0, 1, 0.3411765, 1,
-0.3116101, 0.2549079, -1.772182, 0, 1, 0.345098, 1,
-0.3115966, -2.554458, -3.499314, 0, 1, 0.3529412, 1,
-0.3070442, -2.729436, -4.22582, 0, 1, 0.3568628, 1,
-0.3055203, 0.510438, -2.902306, 0, 1, 0.3647059, 1,
-0.3000075, 0.08419298, -0.6584188, 0, 1, 0.3686275, 1,
-0.2993705, 0.2966924, 0.4455253, 0, 1, 0.3764706, 1,
-0.2967059, -0.8303688, -2.236337, 0, 1, 0.3803922, 1,
-0.2963564, 0.527573, 0.125456, 0, 1, 0.3882353, 1,
-0.2950532, -0.7796296, -2.371381, 0, 1, 0.3921569, 1,
-0.2949572, 0.2176437, -2.522763, 0, 1, 0.4, 1,
-0.2940658, -1.10117, -3.00613, 0, 1, 0.4078431, 1,
-0.2909822, -0.0267566, -0.6905982, 0, 1, 0.4117647, 1,
-0.2903481, 0.2290752, -0.2795184, 0, 1, 0.4196078, 1,
-0.2884585, 0.5890804, 1.13147, 0, 1, 0.4235294, 1,
-0.2878132, -0.05751667, -3.155356, 0, 1, 0.4313726, 1,
-0.2825114, 0.8803726, -2.039506, 0, 1, 0.4352941, 1,
-0.279713, 0.5662631, -1.409488, 0, 1, 0.4431373, 1,
-0.2769493, -0.581362, -2.462701, 0, 1, 0.4470588, 1,
-0.276704, 2.752278, -0.1103742, 0, 1, 0.454902, 1,
-0.2742412, -0.636511, -4.930579, 0, 1, 0.4588235, 1,
-0.2709274, 0.5932016, -1.106444, 0, 1, 0.4666667, 1,
-0.2696079, -1.156926, -4.763814, 0, 1, 0.4705882, 1,
-0.2670689, -1.57115, -3.03085, 0, 1, 0.4784314, 1,
-0.2655623, -0.8009365, -1.124029, 0, 1, 0.4823529, 1,
-0.2571843, 0.03571299, -0.4590886, 0, 1, 0.4901961, 1,
-0.256625, -1.545595, -3.821038, 0, 1, 0.4941176, 1,
-0.2538469, 0.8344542, -0.7303653, 0, 1, 0.5019608, 1,
-0.2510371, -0.7883088, -1.644296, 0, 1, 0.509804, 1,
-0.2495931, -0.5288534, -3.480895, 0, 1, 0.5137255, 1,
-0.2463685, -1.065093, -2.170022, 0, 1, 0.5215687, 1,
-0.242937, 0.4462246, -0.1552483, 0, 1, 0.5254902, 1,
-0.2427839, 1.039454, -0.2308546, 0, 1, 0.5333334, 1,
-0.2374657, 0.5414119, -0.2589015, 0, 1, 0.5372549, 1,
-0.2360278, -0.6856074, -0.6583881, 0, 1, 0.5450981, 1,
-0.2345324, -1.297, -3.066165, 0, 1, 0.5490196, 1,
-0.2330404, -0.6892542, -2.280556, 0, 1, 0.5568628, 1,
-0.2308745, -0.4434728, -2.435105, 0, 1, 0.5607843, 1,
-0.2249968, 0.6262512, -1.923035, 0, 1, 0.5686275, 1,
-0.223073, 0.7016785, 0.3332251, 0, 1, 0.572549, 1,
-0.2203644, 0.03524587, -1.391006, 0, 1, 0.5803922, 1,
-0.2197296, 0.7838114, 0.9063796, 0, 1, 0.5843138, 1,
-0.2193463, -1.119959, -1.897646, 0, 1, 0.5921569, 1,
-0.2183158, -0.331623, -2.616374, 0, 1, 0.5960785, 1,
-0.2159944, 1.108663, 0.654791, 0, 1, 0.6039216, 1,
-0.2146692, 1.716148, 0.9372387, 0, 1, 0.6117647, 1,
-0.2134048, -1.582073, -4.012496, 0, 1, 0.6156863, 1,
-0.2129818, 1.626698, 0.9864535, 0, 1, 0.6235294, 1,
-0.2110893, 0.5520675, 0.2357579, 0, 1, 0.627451, 1,
-0.2094814, 1.014446, 0.1654281, 0, 1, 0.6352941, 1,
-0.2076677, -0.6268474, -2.481161, 0, 1, 0.6392157, 1,
-0.2043785, 0.5005639, -0.1288611, 0, 1, 0.6470588, 1,
-0.1942699, 0.6674773, -0.7514283, 0, 1, 0.6509804, 1,
-0.192453, -0.08625613, -2.258174, 0, 1, 0.6588235, 1,
-0.1917882, 0.03318757, -2.183399, 0, 1, 0.6627451, 1,
-0.1912135, -1.15988, -2.867321, 0, 1, 0.6705883, 1,
-0.1910693, 0.4074329, -0.944252, 0, 1, 0.6745098, 1,
-0.1902663, -2.520947, -3.339531, 0, 1, 0.682353, 1,
-0.1892725, 0.0926508, -2.080272, 0, 1, 0.6862745, 1,
-0.1863173, 0.3191832, -1.317067, 0, 1, 0.6941177, 1,
-0.1833524, -0.8279677, -3.455176, 0, 1, 0.7019608, 1,
-0.1829251, 0.7781756, 0.8309048, 0, 1, 0.7058824, 1,
-0.1814554, -0.9224982, -2.973336, 0, 1, 0.7137255, 1,
-0.1803091, 1.109932, -1.450016, 0, 1, 0.7176471, 1,
-0.1764762, -1.414336, -3.305573, 0, 1, 0.7254902, 1,
-0.1746638, -0.451253, -4.114647, 0, 1, 0.7294118, 1,
-0.1693167, -0.641785, -1.244705, 0, 1, 0.7372549, 1,
-0.1630508, -1.52973, -2.43719, 0, 1, 0.7411765, 1,
-0.1613336, -0.2772657, -1.660863, 0, 1, 0.7490196, 1,
-0.1578653, -0.2452827, -1.047468, 0, 1, 0.7529412, 1,
-0.1542463, 0.5105128, 2.643488, 0, 1, 0.7607843, 1,
-0.1517372, 0.001686952, -1.26077, 0, 1, 0.7647059, 1,
-0.1517146, -0.1008333, -3.212557, 0, 1, 0.772549, 1,
-0.1467426, 0.6395448, -0.2330339, 0, 1, 0.7764706, 1,
-0.1449118, -0.3107802, -3.568059, 0, 1, 0.7843137, 1,
-0.1445737, 1.908955, -2.542827, 0, 1, 0.7882353, 1,
-0.1366879, 2.192308, 1.575273, 0, 1, 0.7960784, 1,
-0.1361338, 0.7102967, 0.2033792, 0, 1, 0.8039216, 1,
-0.1338856, -0.3065898, -2.179817, 0, 1, 0.8078431, 1,
-0.1285346, 0.003469804, -2.09636, 0, 1, 0.8156863, 1,
-0.1241829, 1.091623, -0.08196375, 0, 1, 0.8196079, 1,
-0.1236459, 0.2644894, -0.04420817, 0, 1, 0.827451, 1,
-0.1230243, -0.7310604, -3.103814, 0, 1, 0.8313726, 1,
-0.1179551, 0.5343045, -2.898936, 0, 1, 0.8392157, 1,
-0.1109479, -0.4250473, -4.652354, 0, 1, 0.8431373, 1,
-0.1065502, -1.048995, -3.40374, 0, 1, 0.8509804, 1,
-0.1059315, 1.000967, -3.442952, 0, 1, 0.854902, 1,
-0.09957561, 0.3822762, -0.1645299, 0, 1, 0.8627451, 1,
-0.09838073, 0.1855375, -0.3773885, 0, 1, 0.8666667, 1,
-0.09254393, 0.4212025, 0.04029332, 0, 1, 0.8745098, 1,
-0.09092742, -0.2800778, -2.347651, 0, 1, 0.8784314, 1,
-0.0903848, 0.115017, 1.480499, 0, 1, 0.8862745, 1,
-0.08346185, -0.004283985, -2.587311, 0, 1, 0.8901961, 1,
-0.07963477, 0.1560214, -1.198668, 0, 1, 0.8980392, 1,
-0.07845429, -1.491853, -2.692018, 0, 1, 0.9058824, 1,
-0.07090566, -2.320941, -2.980452, 0, 1, 0.9098039, 1,
-0.06735273, -1.196283, -1.680109, 0, 1, 0.9176471, 1,
-0.06303784, 0.8333852, -0.08178353, 0, 1, 0.9215686, 1,
-0.06125231, 1.117202, -0.9423676, 0, 1, 0.9294118, 1,
-0.06102091, -0.2097794, -0.1246659, 0, 1, 0.9333333, 1,
-0.04718162, -0.3153064, -2.617191, 0, 1, 0.9411765, 1,
-0.04505551, 0.002634384, -0.6599311, 0, 1, 0.945098, 1,
-0.04129828, -0.8163479, -2.765561, 0, 1, 0.9529412, 1,
-0.04101836, -0.644026, -1.579862, 0, 1, 0.9568627, 1,
-0.03962607, -0.5308736, -2.360542, 0, 1, 0.9647059, 1,
-0.03393419, 0.2972524, 0.7861438, 0, 1, 0.9686275, 1,
-0.02470792, -1.106986, -2.398437, 0, 1, 0.9764706, 1,
-0.02211224, -0.06482966, -3.420897, 0, 1, 0.9803922, 1,
-0.01675919, 0.2708059, 2.093938, 0, 1, 0.9882353, 1,
-0.01652361, -1.338089, -2.463311, 0, 1, 0.9921569, 1,
-0.01381933, -0.08225287, -3.53747, 0, 1, 1, 1,
-0.01353796, -1.305866, -0.8903548, 0, 0.9921569, 1, 1,
-0.01301994, 0.4965729, -1.58073, 0, 0.9882353, 1, 1,
-0.01214445, -1.698429, -3.698877, 0, 0.9803922, 1, 1,
-0.01093262, -0.2634143, -3.787398, 0, 0.9764706, 1, 1,
-0.01067158, -0.2701661, -4.137733, 0, 0.9686275, 1, 1,
-0.01029222, -1.342978, -4.410711, 0, 0.9647059, 1, 1,
-0.007538701, 0.4658541, -0.6532321, 0, 0.9568627, 1, 1,
0.000618612, -0.1142911, 4.991298, 0, 0.9529412, 1, 1,
0.001618921, -0.6142091, 1.183491, 0, 0.945098, 1, 1,
0.007116829, 1.921371, -0.3872278, 0, 0.9411765, 1, 1,
0.007343045, 0.2449374, 1.612352, 0, 0.9333333, 1, 1,
0.009595111, -1.058584, 1.91687, 0, 0.9294118, 1, 1,
0.01250841, -1.170004, 3.886096, 0, 0.9215686, 1, 1,
0.01463272, 0.7989845, 0.7659549, 0, 0.9176471, 1, 1,
0.01612743, -0.3163558, 4.764923, 0, 0.9098039, 1, 1,
0.02188837, 0.9123434, 1.175165, 0, 0.9058824, 1, 1,
0.0250751, 0.02775523, 1.137852, 0, 0.8980392, 1, 1,
0.02760805, 1.302498, 0.4090215, 0, 0.8901961, 1, 1,
0.02844509, -0.284893, 2.311839, 0, 0.8862745, 1, 1,
0.02917002, 1.00122, -0.5658007, 0, 0.8784314, 1, 1,
0.03137935, 0.4068624, -1.363587, 0, 0.8745098, 1, 1,
0.03480492, -0.8440737, 1.806255, 0, 0.8666667, 1, 1,
0.03620067, -1.461179, 2.225785, 0, 0.8627451, 1, 1,
0.03963878, -0.03549996, 3.071184, 0, 0.854902, 1, 1,
0.04028701, 0.367145, -0.9872077, 0, 0.8509804, 1, 1,
0.04037088, 0.05133813, -0.1587121, 0, 0.8431373, 1, 1,
0.04086907, 0.9497298, 1.42453, 0, 0.8392157, 1, 1,
0.04466708, -0.5525219, 3.599934, 0, 0.8313726, 1, 1,
0.04555984, -1.341784, 4.682335, 0, 0.827451, 1, 1,
0.04625145, 0.3368838, 0.4665642, 0, 0.8196079, 1, 1,
0.0510616, 0.5954036, 0.3868192, 0, 0.8156863, 1, 1,
0.05234227, 0.04005124, -2.385569, 0, 0.8078431, 1, 1,
0.05412813, -0.01993411, 1.691551, 0, 0.8039216, 1, 1,
0.05479778, 2.056301, -0.5549331, 0, 0.7960784, 1, 1,
0.05546471, -0.9045343, 1.966492, 0, 0.7882353, 1, 1,
0.05770935, -1.472017, 2.348597, 0, 0.7843137, 1, 1,
0.05847904, -1.068582, 3.178796, 0, 0.7764706, 1, 1,
0.06047262, -1.289837, 2.520175, 0, 0.772549, 1, 1,
0.06084039, 0.9700358, 1.301794, 0, 0.7647059, 1, 1,
0.06269098, 1.487231, 0.1053824, 0, 0.7607843, 1, 1,
0.06296611, -0.128731, 2.738343, 0, 0.7529412, 1, 1,
0.06438158, 0.2162561, -0.7478577, 0, 0.7490196, 1, 1,
0.07256374, 0.3461006, 0.6584427, 0, 0.7411765, 1, 1,
0.0748147, -0.4470831, 4.785216, 0, 0.7372549, 1, 1,
0.07549869, 0.1540034, 1.575472, 0, 0.7294118, 1, 1,
0.07628082, -0.03527779, 2.71899, 0, 0.7254902, 1, 1,
0.07955717, 1.504317, 0.9800676, 0, 0.7176471, 1, 1,
0.08107833, -0.552127, 3.167632, 0, 0.7137255, 1, 1,
0.0837988, -0.1152901, 1.182926, 0, 0.7058824, 1, 1,
0.08439326, 0.2761718, -0.2744616, 0, 0.6980392, 1, 1,
0.0869104, -0.3203354, 1.518539, 0, 0.6941177, 1, 1,
0.09489266, 0.559642, -1.296007, 0, 0.6862745, 1, 1,
0.09963625, -1.50298, 3.279782, 0, 0.682353, 1, 1,
0.1008562, 1.751372, 1.143194, 0, 0.6745098, 1, 1,
0.1041289, -0.3008454, 0.3936817, 0, 0.6705883, 1, 1,
0.1105248, 0.6052107, -1.068098, 0, 0.6627451, 1, 1,
0.1109192, 1.453263, -0.5055072, 0, 0.6588235, 1, 1,
0.1111776, 0.8109533, 0.3790097, 0, 0.6509804, 1, 1,
0.1210061, -0.9915076, 3.280149, 0, 0.6470588, 1, 1,
0.1236155, 0.7838246, -0.06820612, 0, 0.6392157, 1, 1,
0.1257153, -1.25464, 1.45914, 0, 0.6352941, 1, 1,
0.1271254, 0.8142517, -1.93713, 0, 0.627451, 1, 1,
0.1274111, -0.102134, 0.5616847, 0, 0.6235294, 1, 1,
0.1322482, -1.664619, 1.462099, 0, 0.6156863, 1, 1,
0.135875, 1.200975, -1.640775, 0, 0.6117647, 1, 1,
0.1390978, -0.1746235, 3.357683, 0, 0.6039216, 1, 1,
0.1427216, 0.1551036, 0.8905165, 0, 0.5960785, 1, 1,
0.1443761, 1.488568, -1.882628, 0, 0.5921569, 1, 1,
0.1445919, -1.064544, 2.704259, 0, 0.5843138, 1, 1,
0.1490483, -0.1685752, 3.432625, 0, 0.5803922, 1, 1,
0.1494086, -0.9293304, 3.894024, 0, 0.572549, 1, 1,
0.1498524, 0.1847777, 2.089165, 0, 0.5686275, 1, 1,
0.1531571, 1.658672, -0.3825855, 0, 0.5607843, 1, 1,
0.1542345, 0.360535, 0.04213741, 0, 0.5568628, 1, 1,
0.1542595, 1.396164, -0.2049293, 0, 0.5490196, 1, 1,
0.1582517, 0.1167892, -0.3464277, 0, 0.5450981, 1, 1,
0.1610882, -0.7702127, 3.046822, 0, 0.5372549, 1, 1,
0.164198, 0.328078, 0.1655522, 0, 0.5333334, 1, 1,
0.1672401, 0.2805703, 0.0376576, 0, 0.5254902, 1, 1,
0.168899, -0.5501918, 2.673666, 0, 0.5215687, 1, 1,
0.1709438, -0.9690311, 2.105182, 0, 0.5137255, 1, 1,
0.1746896, -0.8258713, 1.937271, 0, 0.509804, 1, 1,
0.1768247, -1.024484, 2.198345, 0, 0.5019608, 1, 1,
0.1776493, -0.2198602, 2.276456, 0, 0.4941176, 1, 1,
0.1866214, 0.3411956, -0.3946559, 0, 0.4901961, 1, 1,
0.1875334, -1.660159, 3.645781, 0, 0.4823529, 1, 1,
0.1974584, 0.2082176, 0.99933, 0, 0.4784314, 1, 1,
0.2016893, 1.713062, -0.6491325, 0, 0.4705882, 1, 1,
0.2046664, 0.6993573, 2.623636, 0, 0.4666667, 1, 1,
0.2051961, 0.5155074, -0.1763968, 0, 0.4588235, 1, 1,
0.2130659, -0.7661425, 1.194628, 0, 0.454902, 1, 1,
0.2173977, 1.927519, 0.7964374, 0, 0.4470588, 1, 1,
0.2281402, 0.3336775, 2.849004, 0, 0.4431373, 1, 1,
0.2282677, -0.1428275, 2.320107, 0, 0.4352941, 1, 1,
0.2311084, -1.111732, 1.861149, 0, 0.4313726, 1, 1,
0.2326559, 0.217392, 0.7838526, 0, 0.4235294, 1, 1,
0.233311, -1.599884, 2.773067, 0, 0.4196078, 1, 1,
0.2345036, -2.720871, 2.66348, 0, 0.4117647, 1, 1,
0.2353173, 0.4009326, 0.5757883, 0, 0.4078431, 1, 1,
0.2368616, -0.622058, 1.938792, 0, 0.4, 1, 1,
0.2373928, 0.7168341, 0.720134, 0, 0.3921569, 1, 1,
0.2388467, 0.2141708, 0.1817475, 0, 0.3882353, 1, 1,
0.2410671, -0.2680734, 1.8311, 0, 0.3803922, 1, 1,
0.2440958, -0.769136, 3.86749, 0, 0.3764706, 1, 1,
0.2459187, 0.3699091, 1.725163, 0, 0.3686275, 1, 1,
0.2475828, 1.395307, 1.384628, 0, 0.3647059, 1, 1,
0.247872, 0.2339583, 1.305526, 0, 0.3568628, 1, 1,
0.2496438, 0.2209756, -0.9559402, 0, 0.3529412, 1, 1,
0.2519583, 0.9102972, 0.5669629, 0, 0.345098, 1, 1,
0.2525115, -0.7307008, 2.494934, 0, 0.3411765, 1, 1,
0.2558035, -2.008114, 3.484929, 0, 0.3333333, 1, 1,
0.25635, -1.201701, 2.146478, 0, 0.3294118, 1, 1,
0.2647119, -1.386391, 3.291376, 0, 0.3215686, 1, 1,
0.2658397, -1.233119, 1.73518, 0, 0.3176471, 1, 1,
0.2674115, 0.3664559, -0.5080881, 0, 0.3098039, 1, 1,
0.2705549, 0.294368, 1.978281, 0, 0.3058824, 1, 1,
0.2797401, -0.05880872, 3.034031, 0, 0.2980392, 1, 1,
0.2810341, 1.592207, -0.4368709, 0, 0.2901961, 1, 1,
0.2823624, -2.392606, 2.164495, 0, 0.2862745, 1, 1,
0.2839967, -1.261295, 1.733539, 0, 0.2784314, 1, 1,
0.284526, 0.3897645, 1.704417, 0, 0.2745098, 1, 1,
0.2912307, 0.2069438, -0.1656691, 0, 0.2666667, 1, 1,
0.2951671, -0.3963991, 1.917727, 0, 0.2627451, 1, 1,
0.296132, 0.2548839, -0.09012575, 0, 0.254902, 1, 1,
0.3009105, -0.6176273, 1.106612, 0, 0.2509804, 1, 1,
0.3021647, -3.551914, 2.668983, 0, 0.2431373, 1, 1,
0.3022607, -1.258051, 2.077326, 0, 0.2392157, 1, 1,
0.3023167, -2.906069, 5.045132, 0, 0.2313726, 1, 1,
0.3065875, -0.6907596, 1.662684, 0, 0.227451, 1, 1,
0.3072501, -1.247243, 2.50945, 0, 0.2196078, 1, 1,
0.3078776, -0.1088737, 0.970287, 0, 0.2156863, 1, 1,
0.3082524, -0.1358683, 2.206511, 0, 0.2078431, 1, 1,
0.3087626, -1.895316, 3.60776, 0, 0.2039216, 1, 1,
0.3097015, -0.1324279, 3.203006, 0, 0.1960784, 1, 1,
0.313972, 0.0374038, 2.30374, 0, 0.1882353, 1, 1,
0.3170207, 1.256252, -0.4482112, 0, 0.1843137, 1, 1,
0.3204916, 0.5204004, 0.5202858, 0, 0.1764706, 1, 1,
0.3255612, -0.3554492, 4.158173, 0, 0.172549, 1, 1,
0.3257776, 1.936056, 0.4833592, 0, 0.1647059, 1, 1,
0.3294843, -0.9086609, 4.036821, 0, 0.1607843, 1, 1,
0.3380545, 1.516405, 0.3779005, 0, 0.1529412, 1, 1,
0.3387973, -0.7424199, 1.698531, 0, 0.1490196, 1, 1,
0.3442154, -0.1078865, 1.474913, 0, 0.1411765, 1, 1,
0.3472576, 1.264646, 1.402564, 0, 0.1372549, 1, 1,
0.3733549, -0.394193, 2.421042, 0, 0.1294118, 1, 1,
0.379029, -0.07763745, 3.021822, 0, 0.1254902, 1, 1,
0.3817469, -0.5180359, 0.8989261, 0, 0.1176471, 1, 1,
0.3886125, -1.415098, 3.275592, 0, 0.1137255, 1, 1,
0.3913047, -0.1326984, 2.099163, 0, 0.1058824, 1, 1,
0.396846, -0.8325201, 2.974346, 0, 0.09803922, 1, 1,
0.3968635, -0.4042831, 2.403931, 0, 0.09411765, 1, 1,
0.3974548, -1.168367, 3.032783, 0, 0.08627451, 1, 1,
0.3980041, -0.5179538, 2.442492, 0, 0.08235294, 1, 1,
0.3982521, -0.6130573, 0.8912526, 0, 0.07450981, 1, 1,
0.3992214, 0.2593451, 1.205556, 0, 0.07058824, 1, 1,
0.4025622, 1.389234, -0.6603698, 0, 0.0627451, 1, 1,
0.4109021, -0.4972142, 2.337171, 0, 0.05882353, 1, 1,
0.4117409, 0.5252757, -0.05510343, 0, 0.05098039, 1, 1,
0.4130653, -0.8128383, 3.882224, 0, 0.04705882, 1, 1,
0.4132163, -0.1758814, 1.613833, 0, 0.03921569, 1, 1,
0.4144882, 0.2788863, 2.37385, 0, 0.03529412, 1, 1,
0.4204087, 0.08890079, 1.749197, 0, 0.02745098, 1, 1,
0.4204971, 0.09347715, 1.288303, 0, 0.02352941, 1, 1,
0.4220928, 0.09444869, 1.785951, 0, 0.01568628, 1, 1,
0.4232653, 0.5464082, 1.984346, 0, 0.01176471, 1, 1,
0.4248431, 1.132212, 0.1510243, 0, 0.003921569, 1, 1,
0.4285634, -1.540663, 4.434994, 0.003921569, 0, 1, 1,
0.4291593, -1.625831, 2.965547, 0.007843138, 0, 1, 1,
0.4304547, 0.629764, 0.286735, 0.01568628, 0, 1, 1,
0.433744, -0.8924056, 0.5611136, 0.01960784, 0, 1, 1,
0.4383549, 0.8480103, 1.454846, 0.02745098, 0, 1, 1,
0.4386676, 0.09501181, 1.474961, 0.03137255, 0, 1, 1,
0.4458466, 0.5845408, -0.2582434, 0.03921569, 0, 1, 1,
0.4458674, 0.03986735, 1.32053, 0.04313726, 0, 1, 1,
0.4488053, -0.8127934, 3.643291, 0.05098039, 0, 1, 1,
0.4506952, 1.162401, 1.462402, 0.05490196, 0, 1, 1,
0.4522033, -1.814241, 3.356387, 0.0627451, 0, 1, 1,
0.4527379, -0.02254592, 0.7262446, 0.06666667, 0, 1, 1,
0.4534542, 1.812448, 0.9945189, 0.07450981, 0, 1, 1,
0.4576332, -0.3063287, -0.2562119, 0.07843138, 0, 1, 1,
0.4614565, 0.5473891, 1.306183, 0.08627451, 0, 1, 1,
0.4614991, -0.7109435, 2.464978, 0.09019608, 0, 1, 1,
0.4662684, 0.70209, 0.3878569, 0.09803922, 0, 1, 1,
0.4665591, -1.802355, 0.4642067, 0.1058824, 0, 1, 1,
0.4687287, 0.006241701, 2.733178, 0.1098039, 0, 1, 1,
0.4734093, -0.6929531, 2.177465, 0.1176471, 0, 1, 1,
0.4781125, 0.0982696, 0.337133, 0.1215686, 0, 1, 1,
0.4840297, -0.2591211, 0.8749999, 0.1294118, 0, 1, 1,
0.4877956, -2.532118, 3.823803, 0.1333333, 0, 1, 1,
0.4936567, 0.2623436, 2.140789, 0.1411765, 0, 1, 1,
0.496562, -1.705079, 0.104739, 0.145098, 0, 1, 1,
0.4981894, -2.109282, 3.33438, 0.1529412, 0, 1, 1,
0.5095419, 0.5084127, 1.190749, 0.1568628, 0, 1, 1,
0.5122395, -0.2854715, 1.833494, 0.1647059, 0, 1, 1,
0.516097, -1.849185, 5.053774, 0.1686275, 0, 1, 1,
0.5241212, 0.6962473, 0.1880855, 0.1764706, 0, 1, 1,
0.530497, 0.6211924, 0.8924717, 0.1803922, 0, 1, 1,
0.5364954, -0.4503335, 3.657447, 0.1882353, 0, 1, 1,
0.5371657, 0.1425118, 1.860982, 0.1921569, 0, 1, 1,
0.5377179, -0.5649662, 2.740266, 0.2, 0, 1, 1,
0.5404329, 0.6987939, 0.2779821, 0.2078431, 0, 1, 1,
0.5409446, 1.533248, 0.9124432, 0.2117647, 0, 1, 1,
0.5439278, -0.9003452, 1.490796, 0.2196078, 0, 1, 1,
0.5464489, 0.2963355, -0.4062973, 0.2235294, 0, 1, 1,
0.5468745, 1.378315, 0.6875669, 0.2313726, 0, 1, 1,
0.5540674, 0.2110251, 1.923031, 0.2352941, 0, 1, 1,
0.5564889, -0.2985537, 1.338992, 0.2431373, 0, 1, 1,
0.5600772, 0.1374816, 0.8608087, 0.2470588, 0, 1, 1,
0.5608078, -1.175604, 2.520127, 0.254902, 0, 1, 1,
0.5620059, 0.9302858, -0.02785327, 0.2588235, 0, 1, 1,
0.5645313, -0.3794607, 3.489316, 0.2666667, 0, 1, 1,
0.5682265, 0.3621297, 1.331479, 0.2705882, 0, 1, 1,
0.5722361, -3.021224, 3.27282, 0.2784314, 0, 1, 1,
0.5724025, -1.626355, 2.981516, 0.282353, 0, 1, 1,
0.5742348, 0.7605981, 1.55631, 0.2901961, 0, 1, 1,
0.5747488, 0.9263884, -0.2818679, 0.2941177, 0, 1, 1,
0.5760775, -1.424641, 3.388253, 0.3019608, 0, 1, 1,
0.5772088, -0.03722356, 0.9329187, 0.3098039, 0, 1, 1,
0.5816829, 0.6783275, 0.1110052, 0.3137255, 0, 1, 1,
0.5833726, -0.1431943, 1.53761, 0.3215686, 0, 1, 1,
0.5876393, -1.20355, 3.914462, 0.3254902, 0, 1, 1,
0.5896502, -0.2204161, 0.8240755, 0.3333333, 0, 1, 1,
0.5940617, -0.544037, 2.167238, 0.3372549, 0, 1, 1,
0.6007381, 0.5274579, 2.838672, 0.345098, 0, 1, 1,
0.6051388, 0.753392, 0.4987327, 0.3490196, 0, 1, 1,
0.6066509, 0.1420941, 1.443611, 0.3568628, 0, 1, 1,
0.6105044, 0.1807143, 1.12922, 0.3607843, 0, 1, 1,
0.615007, 0.4468493, 0.5285551, 0.3686275, 0, 1, 1,
0.6153756, 0.26932, 0.8554032, 0.372549, 0, 1, 1,
0.6166935, 1.201414, -0.2969208, 0.3803922, 0, 1, 1,
0.6205093, 0.1469746, 1.33883, 0.3843137, 0, 1, 1,
0.6268805, -0.04002205, 2.255077, 0.3921569, 0, 1, 1,
0.6277087, 0.7043007, -0.3455513, 0.3960784, 0, 1, 1,
0.6289262, 1.276935, 1.816827, 0.4039216, 0, 1, 1,
0.6292617, 0.2260096, 0.08049396, 0.4117647, 0, 1, 1,
0.6315746, 0.5765702, -0.2367794, 0.4156863, 0, 1, 1,
0.6353983, -1.500886, 2.897739, 0.4235294, 0, 1, 1,
0.6408485, -0.404308, 2.413975, 0.427451, 0, 1, 1,
0.6428055, 0.2844936, 1.711249, 0.4352941, 0, 1, 1,
0.6428967, -1.053418, 2.489136, 0.4392157, 0, 1, 1,
0.6439824, 1.009872, 1.591086, 0.4470588, 0, 1, 1,
0.6440414, 0.4561386, 1.590268, 0.4509804, 0, 1, 1,
0.6445934, -0.8918816, 1.7773, 0.4588235, 0, 1, 1,
0.6452497, 0.1916252, 1.550393, 0.4627451, 0, 1, 1,
0.6480485, -0.8645657, 2.591106, 0.4705882, 0, 1, 1,
0.6482576, -0.3814924, 1.971192, 0.4745098, 0, 1, 1,
0.651057, 0.2093201, 0.83083, 0.4823529, 0, 1, 1,
0.6517562, -0.6038237, 2.992577, 0.4862745, 0, 1, 1,
0.6584666, -0.2307217, 2.072186, 0.4941176, 0, 1, 1,
0.6606869, 0.5562541, 1.316149, 0.5019608, 0, 1, 1,
0.6619656, -1.003257, 2.07649, 0.5058824, 0, 1, 1,
0.6663904, 0.636548, 1.113487, 0.5137255, 0, 1, 1,
0.6670632, 0.9068838, 0.3895087, 0.5176471, 0, 1, 1,
0.6704212, 0.3650457, 1.703742, 0.5254902, 0, 1, 1,
0.6735269, 1.282048, 1.841625, 0.5294118, 0, 1, 1,
0.6752825, 0.8245207, -0.6758254, 0.5372549, 0, 1, 1,
0.6759821, -0.2782331, 2.506379, 0.5411765, 0, 1, 1,
0.6815825, -0.9819784, 2.016322, 0.5490196, 0, 1, 1,
0.6928989, -0.7443947, 2.008384, 0.5529412, 0, 1, 1,
0.6951037, -1.831777, 2.29834, 0.5607843, 0, 1, 1,
0.6953173, -0.3213746, 3.350678, 0.5647059, 0, 1, 1,
0.6960456, 1.192692, 0.2376746, 0.572549, 0, 1, 1,
0.6989088, 0.9650465, -0.3966513, 0.5764706, 0, 1, 1,
0.7067162, 1.914238, 0.394162, 0.5843138, 0, 1, 1,
0.7108351, -0.5415315, 1.279865, 0.5882353, 0, 1, 1,
0.7133859, 1.23238, 0.7982005, 0.5960785, 0, 1, 1,
0.7166991, 0.2476149, 1.486101, 0.6039216, 0, 1, 1,
0.7174746, 1.185215, 2.091224, 0.6078432, 0, 1, 1,
0.7179813, 0.1866165, 2.035472, 0.6156863, 0, 1, 1,
0.7185435, 3.185567, 0.4053308, 0.6196079, 0, 1, 1,
0.7197304, -0.331875, 2.777321, 0.627451, 0, 1, 1,
0.7364618, -0.8738323, 4.159986, 0.6313726, 0, 1, 1,
0.7407914, -0.9232202, 3.420383, 0.6392157, 0, 1, 1,
0.7452877, 0.08869573, 2.02196, 0.6431373, 0, 1, 1,
0.7469105, 0.04284031, 1.081421, 0.6509804, 0, 1, 1,
0.7562531, -0.1397949, 0.851647, 0.654902, 0, 1, 1,
0.7576969, -0.05684619, 0.2679935, 0.6627451, 0, 1, 1,
0.7616668, -0.1416872, 2.140854, 0.6666667, 0, 1, 1,
0.7645256, 0.8570817, 0.4631943, 0.6745098, 0, 1, 1,
0.7649522, 0.7351065, 1.040658, 0.6784314, 0, 1, 1,
0.7674556, 0.5419327, 0.7210014, 0.6862745, 0, 1, 1,
0.7691243, -0.6637235, 4.167723, 0.6901961, 0, 1, 1,
0.7726085, -0.8157793, 3.882631, 0.6980392, 0, 1, 1,
0.7746037, -1.23929, 2.560693, 0.7058824, 0, 1, 1,
0.7800572, 0.3914366, 2.704769, 0.7098039, 0, 1, 1,
0.7838083, 3.009406, 1.746039, 0.7176471, 0, 1, 1,
0.7872164, 0.817228, 0.5675691, 0.7215686, 0, 1, 1,
0.7895465, 0.7149077, 0.2843518, 0.7294118, 0, 1, 1,
0.7896052, 0.2498859, 0.1097399, 0.7333333, 0, 1, 1,
0.7926296, -0.6401655, 2.384158, 0.7411765, 0, 1, 1,
0.7937298, 0.7480818, 0.9604928, 0.7450981, 0, 1, 1,
0.8013293, -0.9989127, 3.440563, 0.7529412, 0, 1, 1,
0.8040658, 0.1299129, 0.3351249, 0.7568628, 0, 1, 1,
0.8046805, -0.7223371, 1.385198, 0.7647059, 0, 1, 1,
0.8050156, -1.369859, 3.227325, 0.7686275, 0, 1, 1,
0.8086437, 0.2010724, 1.46734, 0.7764706, 0, 1, 1,
0.8126457, 1.079048, 1.322401, 0.7803922, 0, 1, 1,
0.8167812, -1.011462, 3.246415, 0.7882353, 0, 1, 1,
0.8303865, -0.5814933, 0.9323745, 0.7921569, 0, 1, 1,
0.8396475, 0.4821716, 2.495495, 0.8, 0, 1, 1,
0.8433527, -1.216377, 2.297258, 0.8078431, 0, 1, 1,
0.8494539, 0.1522578, 1.961577, 0.8117647, 0, 1, 1,
0.8513304, -1.796827, 4.532481, 0.8196079, 0, 1, 1,
0.8554497, -1.27487, 2.177246, 0.8235294, 0, 1, 1,
0.8683519, 0.5487285, 3.056182, 0.8313726, 0, 1, 1,
0.8691745, -0.5539789, 2.335758, 0.8352941, 0, 1, 1,
0.8705998, -0.827171, 0.9974292, 0.8431373, 0, 1, 1,
0.8779047, 0.4124638, 0.6731675, 0.8470588, 0, 1, 1,
0.8857982, 1.0949, 0.6542587, 0.854902, 0, 1, 1,
0.8907946, -0.6391241, 1.500471, 0.8588235, 0, 1, 1,
0.8935627, -0.791268, 3.7104, 0.8666667, 0, 1, 1,
0.8961716, -0.003822678, -0.3742622, 0.8705882, 0, 1, 1,
0.9015625, 0.7244407, 3.203137, 0.8784314, 0, 1, 1,
0.9016355, 0.1773087, 0.9296103, 0.8823529, 0, 1, 1,
0.9044026, 0.2491005, 1.074821, 0.8901961, 0, 1, 1,
0.9044681, 0.3314054, 2.612554, 0.8941177, 0, 1, 1,
0.9116656, -0.7909414, 0.306998, 0.9019608, 0, 1, 1,
0.9177319, -1.962164, 1.466492, 0.9098039, 0, 1, 1,
0.9184087, 0.1707277, 0.3901328, 0.9137255, 0, 1, 1,
0.9200222, -0.3370934, 2.96328, 0.9215686, 0, 1, 1,
0.9228033, -1.115054, 3.093602, 0.9254902, 0, 1, 1,
0.9250358, 0.8550777, -0.3142453, 0.9333333, 0, 1, 1,
0.927049, -1.94095, 3.84073, 0.9372549, 0, 1, 1,
0.9280535, 0.4343064, 1.278973, 0.945098, 0, 1, 1,
0.9296574, -0.6365179, 2.81878, 0.9490196, 0, 1, 1,
0.9317684, 0.2780313, 1.80457, 0.9568627, 0, 1, 1,
0.9404489, 0.8108315, 3.186731, 0.9607843, 0, 1, 1,
0.9428594, -0.3422108, 2.929061, 0.9686275, 0, 1, 1,
0.9483847, 0.5681491, 0.1618711, 0.972549, 0, 1, 1,
0.9504689, -0.006857489, 3.706077, 0.9803922, 0, 1, 1,
0.9599854, 0.8772057, 1.295419, 0.9843137, 0, 1, 1,
0.968574, 0.06805101, 0.9215304, 0.9921569, 0, 1, 1,
0.9724384, 1.815008, 3.200019, 0.9960784, 0, 1, 1,
0.9736457, 1.36361, -0.02619477, 1, 0, 0.9960784, 1,
0.9756415, -0.5469601, 1.95123, 1, 0, 0.9882353, 1,
0.9760615, 0.5832027, 1.250767, 1, 0, 0.9843137, 1,
0.9788469, -0.6308957, 0.7883195, 1, 0, 0.9764706, 1,
0.9788699, 0.3933588, 0.875435, 1, 0, 0.972549, 1,
0.9815442, 2.526847, -0.3949652, 1, 0, 0.9647059, 1,
0.9828463, 0.036835, 0.8693348, 1, 0, 0.9607843, 1,
0.9830359, 0.3129638, 2.880308, 1, 0, 0.9529412, 1,
0.9833131, 0.821744, 1.038543, 1, 0, 0.9490196, 1,
0.9846753, -1.737331, 2.223982, 1, 0, 0.9411765, 1,
0.9862692, -1.008281, 4.128279, 1, 0, 0.9372549, 1,
0.9863266, 0.3850737, 0.5573541, 1, 0, 0.9294118, 1,
0.9904069, 1.1618, -0.1495608, 1, 0, 0.9254902, 1,
0.9911038, -1.892769, 2.898767, 1, 0, 0.9176471, 1,
0.9924099, -0.07947002, 1.938179, 1, 0, 0.9137255, 1,
0.9959725, -0.3716229, 1.780854, 1, 0, 0.9058824, 1,
1.001305, -0.4966732, 1.137726, 1, 0, 0.9019608, 1,
1.003492, -0.3563145, -1.180401, 1, 0, 0.8941177, 1,
1.006499, -0.3540993, 1.846226, 1, 0, 0.8862745, 1,
1.013407, -0.7084433, 1.314387, 1, 0, 0.8823529, 1,
1.016003, -0.3907063, 1.669414, 1, 0, 0.8745098, 1,
1.023012, 1.252408, 2.142357, 1, 0, 0.8705882, 1,
1.029077, 0.4107313, 1.329876, 1, 0, 0.8627451, 1,
1.034086, -1.272412, 2.776352, 1, 0, 0.8588235, 1,
1.045622, -0.3487609, 2.522279, 1, 0, 0.8509804, 1,
1.046193, -1.498052, 3.107635, 1, 0, 0.8470588, 1,
1.047033, 0.1028187, 0.8074615, 1, 0, 0.8392157, 1,
1.058207, -1.061801, 2.352561, 1, 0, 0.8352941, 1,
1.06, -0.4807009, 0.8459404, 1, 0, 0.827451, 1,
1.065146, -1.747738, 2.919151, 1, 0, 0.8235294, 1,
1.066469, -1.143068, 1.801117, 1, 0, 0.8156863, 1,
1.071082, 0.7691994, 1.924746, 1, 0, 0.8117647, 1,
1.073676, -0.9471579, 1.552814, 1, 0, 0.8039216, 1,
1.077646, -0.02999922, 1.554844, 1, 0, 0.7960784, 1,
1.078404, -1.655516, 1.047195, 1, 0, 0.7921569, 1,
1.078632, 1.576265, 0.1195552, 1, 0, 0.7843137, 1,
1.094563, 0.6074228, 0.5242946, 1, 0, 0.7803922, 1,
1.098245, -0.9063495, 1.971944, 1, 0, 0.772549, 1,
1.102187, 0.3102197, 1.04291, 1, 0, 0.7686275, 1,
1.108831, 0.3725685, 0.7447178, 1, 0, 0.7607843, 1,
1.122498, 0.8962843, -0.4422991, 1, 0, 0.7568628, 1,
1.125165, 0.1631075, 1.729424, 1, 0, 0.7490196, 1,
1.125552, 1.175727, 0.6922899, 1, 0, 0.7450981, 1,
1.126809, -0.01056172, 1.263932, 1, 0, 0.7372549, 1,
1.130533, 0.2214478, 2.277977, 1, 0, 0.7333333, 1,
1.148253, -1.326627, 3.189174, 1, 0, 0.7254902, 1,
1.152316, -0.7394526, 2.22166, 1, 0, 0.7215686, 1,
1.165247, -0.3039119, 2.378586, 1, 0, 0.7137255, 1,
1.167831, 0.718767, 2.199883, 1, 0, 0.7098039, 1,
1.168973, -0.02984514, 2.391357, 1, 0, 0.7019608, 1,
1.172155, 0.9316658, 0.6864879, 1, 0, 0.6941177, 1,
1.175681, -2.666416, 1.994518, 1, 0, 0.6901961, 1,
1.190364, -0.7014961, 1.381294, 1, 0, 0.682353, 1,
1.191542, -0.2379401, 1.011288, 1, 0, 0.6784314, 1,
1.194189, -1.775116, 1.763693, 1, 0, 0.6705883, 1,
1.19438, -1.04564, 1.093562, 1, 0, 0.6666667, 1,
1.195192, -0.2138375, 0.6212186, 1, 0, 0.6588235, 1,
1.197182, 0.1448545, 0.4012925, 1, 0, 0.654902, 1,
1.198649, -1.27145, 3.195456, 1, 0, 0.6470588, 1,
1.19878, -0.2888735, -0.1063706, 1, 0, 0.6431373, 1,
1.21046, 0.6916374, 1.496296, 1, 0, 0.6352941, 1,
1.216026, 0.8270798, 1.217333, 1, 0, 0.6313726, 1,
1.217414, -0.6993214, 1.813048, 1, 0, 0.6235294, 1,
1.228111, -0.2787289, 1.287271, 1, 0, 0.6196079, 1,
1.228743, 0.2861822, 2.288953, 1, 0, 0.6117647, 1,
1.241019, 0.404337, 2.956858, 1, 0, 0.6078432, 1,
1.241221, -1.246829, 3.42361, 1, 0, 0.6, 1,
1.244559, -5.348355e-06, 0.7224149, 1, 0, 0.5921569, 1,
1.248089, -0.06781593, 2.532759, 1, 0, 0.5882353, 1,
1.250296, -1.435987, 3.902739, 1, 0, 0.5803922, 1,
1.254585, 0.8974491, -0.4130628, 1, 0, 0.5764706, 1,
1.260609, 0.3227722, -0.1226617, 1, 0, 0.5686275, 1,
1.263835, -0.03909232, 1.571585, 1, 0, 0.5647059, 1,
1.266878, 1.389139, 0.5167149, 1, 0, 0.5568628, 1,
1.267634, 1.487705, -0.8772057, 1, 0, 0.5529412, 1,
1.269887, -0.4812872, 2.237259, 1, 0, 0.5450981, 1,
1.281183, -0.1044474, 1.186396, 1, 0, 0.5411765, 1,
1.297182, -0.2209712, 1.06159, 1, 0, 0.5333334, 1,
1.317671, 0.2348328, 1.497107, 1, 0, 0.5294118, 1,
1.319759, 1.155373, -0.1339569, 1, 0, 0.5215687, 1,
1.321408, -1.159166, 2.111806, 1, 0, 0.5176471, 1,
1.331598, -0.1389377, 0.918331, 1, 0, 0.509804, 1,
1.343617, 1.090949, 0.7374331, 1, 0, 0.5058824, 1,
1.344612, -0.6376071, 3.315406, 1, 0, 0.4980392, 1,
1.352856, -0.08152411, 1.337101, 1, 0, 0.4901961, 1,
1.372313, 0.2854685, 0.06811851, 1, 0, 0.4862745, 1,
1.385527, 0.5640503, 1.294652, 1, 0, 0.4784314, 1,
1.385897, -0.1920256, 2.317978, 1, 0, 0.4745098, 1,
1.403521, 1.47694, -0.414341, 1, 0, 0.4666667, 1,
1.409662, 1.17219, -0.8584366, 1, 0, 0.4627451, 1,
1.412919, -1.180353, 2.437777, 1, 0, 0.454902, 1,
1.413993, 0.04861774, 2.056446, 1, 0, 0.4509804, 1,
1.415126, 0.3464988, 0.5992224, 1, 0, 0.4431373, 1,
1.416693, 1.425979, 2.14615, 1, 0, 0.4392157, 1,
1.419581, -1.319491, 2.760952, 1, 0, 0.4313726, 1,
1.421614, 2.048084, 1.398525, 1, 0, 0.427451, 1,
1.421879, 0.3555377, 0.839439, 1, 0, 0.4196078, 1,
1.423798, 0.9677577, 1.246595, 1, 0, 0.4156863, 1,
1.424992, -0.03513201, 0.20455, 1, 0, 0.4078431, 1,
1.447559, 0.1735476, 0.3923759, 1, 0, 0.4039216, 1,
1.448649, -0.6824583, 2.7556, 1, 0, 0.3960784, 1,
1.462946, -0.4527394, 1.302535, 1, 0, 0.3882353, 1,
1.474793, 0.06625441, 1.345037, 1, 0, 0.3843137, 1,
1.490888, 0.6482836, 1.141127, 1, 0, 0.3764706, 1,
1.503173, -0.9605322, 1.514799, 1, 0, 0.372549, 1,
1.512264, 0.550209, 2.418661, 1, 0, 0.3647059, 1,
1.513645, 1.224391, 0.158254, 1, 0, 0.3607843, 1,
1.541719, -0.6983091, 2.185977, 1, 0, 0.3529412, 1,
1.559255, 1.391134, 0.6560847, 1, 0, 0.3490196, 1,
1.584611, -1.080012, 3.76964, 1, 0, 0.3411765, 1,
1.605552, -0.6040213, 2.160569, 1, 0, 0.3372549, 1,
1.608627, 0.1662508, 0.4604305, 1, 0, 0.3294118, 1,
1.612333, 0.3130205, 0.8395488, 1, 0, 0.3254902, 1,
1.616288, -0.849579, 2.910659, 1, 0, 0.3176471, 1,
1.622009, -2.148815, 2.681427, 1, 0, 0.3137255, 1,
1.629872, -0.1035647, 1.507302, 1, 0, 0.3058824, 1,
1.648849, 0.1240243, 0.7229702, 1, 0, 0.2980392, 1,
1.652167, -1.042067, 0.551998, 1, 0, 0.2941177, 1,
1.659358, 0.6093617, 1.045528, 1, 0, 0.2862745, 1,
1.667246, -0.9595126, 2.211272, 1, 0, 0.282353, 1,
1.675783, 1.26009, 0.1339578, 1, 0, 0.2745098, 1,
1.687621, -1.212504, 2.081258, 1, 0, 0.2705882, 1,
1.691389, 1.596244, 1.66852, 1, 0, 0.2627451, 1,
1.704708, -0.1533244, 0.1430659, 1, 0, 0.2588235, 1,
1.708802, -1.066125, 1.633361, 1, 0, 0.2509804, 1,
1.722849, -2.145649, 3.026035, 1, 0, 0.2470588, 1,
1.736915, 0.3839851, -0.4999397, 1, 0, 0.2392157, 1,
1.737465, -0.4700138, 2.701968, 1, 0, 0.2352941, 1,
1.739626, 0.2536073, 1.529731, 1, 0, 0.227451, 1,
1.743113, -0.680321, 1.701928, 1, 0, 0.2235294, 1,
1.744985, -0.3685906, 1.945465, 1, 0, 0.2156863, 1,
1.749979, 0.7796752, 1.378207, 1, 0, 0.2117647, 1,
1.752513, -1.299829, 1.701525, 1, 0, 0.2039216, 1,
1.760738, 1.494928, 0.659978, 1, 0, 0.1960784, 1,
1.775157, 1.128303, 2.017477, 1, 0, 0.1921569, 1,
1.826548, 0.9297184, 2.856397, 1, 0, 0.1843137, 1,
1.838199, 2.399032, 1.359915, 1, 0, 0.1803922, 1,
1.86533, -2.50736, 4.390802, 1, 0, 0.172549, 1,
1.871399, -0.5877973, 0.8342804, 1, 0, 0.1686275, 1,
1.88124, 1.596012, 0.8382251, 1, 0, 0.1607843, 1,
1.891654, 1.467182, 1.874789, 1, 0, 0.1568628, 1,
1.895981, 1.295765, 2.338527, 1, 0, 0.1490196, 1,
1.906168, -0.06720803, 0.5499146, 1, 0, 0.145098, 1,
1.91718, -1.857906, 3.33436, 1, 0, 0.1372549, 1,
1.921914, -2.806502, 0.6460369, 1, 0, 0.1333333, 1,
1.935257, 0.2835905, 2.067271, 1, 0, 0.1254902, 1,
1.93768, -1.593039, 3.820119, 1, 0, 0.1215686, 1,
1.942301, 0.1011497, 2.37448, 1, 0, 0.1137255, 1,
1.943795, 0.5733396, 0.4815288, 1, 0, 0.1098039, 1,
1.986901, -0.603821, 1.347787, 1, 0, 0.1019608, 1,
1.998527, -0.6207719, 1.312893, 1, 0, 0.09411765, 1,
2.083973, 0.8582005, 0.9277628, 1, 0, 0.09019608, 1,
2.086286, -1.61888, 2.056917, 1, 0, 0.08235294, 1,
2.101468, -0.1349644, 0.2510087, 1, 0, 0.07843138, 1,
2.117843, 0.8529607, -0.3913783, 1, 0, 0.07058824, 1,
2.118885, 0.9677169, 0.8195711, 1, 0, 0.06666667, 1,
2.24076, 1.719247, 0.8930354, 1, 0, 0.05882353, 1,
2.284435, 1.248934, 2.013123, 1, 0, 0.05490196, 1,
2.29226, 0.1697809, 3.100788, 1, 0, 0.04705882, 1,
2.297729, -0.3625207, 0.848047, 1, 0, 0.04313726, 1,
2.416795, 0.2396828, 1.799926, 1, 0, 0.03529412, 1,
2.48629, -0.2659271, 2.340476, 1, 0, 0.03137255, 1,
2.797387, 0.1266263, -0.2761753, 1, 0, 0.02352941, 1,
2.821992, -0.6077715, 1.057443, 1, 0, 0.01960784, 1,
3.076379, -0.5617551, 3.504807, 1, 0, 0.01176471, 1,
3.216703, -0.5658948, 2.95848, 1, 0, 0.007843138, 1
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
0.02154803, -4.796045, -6.959691, 0, -0.5, 0.5, 0.5,
0.02154803, -4.796045, -6.959691, 1, -0.5, 0.5, 0.5,
0.02154803, -4.796045, -6.959691, 1, 1.5, 0.5, 0.5,
0.02154803, -4.796045, -6.959691, 0, 1.5, 0.5, 0.5
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
-4.256764, 0.1180888, -6.959691, 0, -0.5, 0.5, 0.5,
-4.256764, 0.1180888, -6.959691, 1, -0.5, 0.5, 0.5,
-4.256764, 0.1180888, -6.959691, 1, 1.5, 0.5, 0.5,
-4.256764, 0.1180888, -6.959691, 0, 1.5, 0.5, 0.5
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
-4.256764, -4.796045, -0.08238029, 0, -0.5, 0.5, 0.5,
-4.256764, -4.796045, -0.08238029, 1, -0.5, 0.5, 0.5,
-4.256764, -4.796045, -0.08238029, 1, 1.5, 0.5, 0.5,
-4.256764, -4.796045, -0.08238029, 0, 1.5, 0.5, 0.5
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
-3, -3.662014, -5.372619,
3, -3.662014, -5.372619,
-3, -3.662014, -5.372619,
-3, -3.851019, -5.637131,
-2, -3.662014, -5.372619,
-2, -3.851019, -5.637131,
-1, -3.662014, -5.372619,
-1, -3.851019, -5.637131,
0, -3.662014, -5.372619,
0, -3.851019, -5.637131,
1, -3.662014, -5.372619,
1, -3.851019, -5.637131,
2, -3.662014, -5.372619,
2, -3.851019, -5.637131,
3, -3.662014, -5.372619,
3, -3.851019, -5.637131
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
-3, -4.22903, -6.166155, 0, -0.5, 0.5, 0.5,
-3, -4.22903, -6.166155, 1, -0.5, 0.5, 0.5,
-3, -4.22903, -6.166155, 1, 1.5, 0.5, 0.5,
-3, -4.22903, -6.166155, 0, 1.5, 0.5, 0.5,
-2, -4.22903, -6.166155, 0, -0.5, 0.5, 0.5,
-2, -4.22903, -6.166155, 1, -0.5, 0.5, 0.5,
-2, -4.22903, -6.166155, 1, 1.5, 0.5, 0.5,
-2, -4.22903, -6.166155, 0, 1.5, 0.5, 0.5,
-1, -4.22903, -6.166155, 0, -0.5, 0.5, 0.5,
-1, -4.22903, -6.166155, 1, -0.5, 0.5, 0.5,
-1, -4.22903, -6.166155, 1, 1.5, 0.5, 0.5,
-1, -4.22903, -6.166155, 0, 1.5, 0.5, 0.5,
0, -4.22903, -6.166155, 0, -0.5, 0.5, 0.5,
0, -4.22903, -6.166155, 1, -0.5, 0.5, 0.5,
0, -4.22903, -6.166155, 1, 1.5, 0.5, 0.5,
0, -4.22903, -6.166155, 0, 1.5, 0.5, 0.5,
1, -4.22903, -6.166155, 0, -0.5, 0.5, 0.5,
1, -4.22903, -6.166155, 1, -0.5, 0.5, 0.5,
1, -4.22903, -6.166155, 1, 1.5, 0.5, 0.5,
1, -4.22903, -6.166155, 0, 1.5, 0.5, 0.5,
2, -4.22903, -6.166155, 0, -0.5, 0.5, 0.5,
2, -4.22903, -6.166155, 1, -0.5, 0.5, 0.5,
2, -4.22903, -6.166155, 1, 1.5, 0.5, 0.5,
2, -4.22903, -6.166155, 0, 1.5, 0.5, 0.5,
3, -4.22903, -6.166155, 0, -0.5, 0.5, 0.5,
3, -4.22903, -6.166155, 1, -0.5, 0.5, 0.5,
3, -4.22903, -6.166155, 1, 1.5, 0.5, 0.5,
3, -4.22903, -6.166155, 0, 1.5, 0.5, 0.5
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
-3.269462, -2, -5.372619,
-3.269462, 2, -5.372619,
-3.269462, -2, -5.372619,
-3.434012, -2, -5.637131,
-3.269462, 0, -5.372619,
-3.434012, 0, -5.637131,
-3.269462, 2, -5.372619,
-3.434012, 2, -5.637131
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
-3.763113, -2, -6.166155, 0, -0.5, 0.5, 0.5,
-3.763113, -2, -6.166155, 1, -0.5, 0.5, 0.5,
-3.763113, -2, -6.166155, 1, 1.5, 0.5, 0.5,
-3.763113, -2, -6.166155, 0, 1.5, 0.5, 0.5,
-3.763113, 0, -6.166155, 0, -0.5, 0.5, 0.5,
-3.763113, 0, -6.166155, 1, -0.5, 0.5, 0.5,
-3.763113, 0, -6.166155, 1, 1.5, 0.5, 0.5,
-3.763113, 0, -6.166155, 0, 1.5, 0.5, 0.5,
-3.763113, 2, -6.166155, 0, -0.5, 0.5, 0.5,
-3.763113, 2, -6.166155, 1, -0.5, 0.5, 0.5,
-3.763113, 2, -6.166155, 1, 1.5, 0.5, 0.5,
-3.763113, 2, -6.166155, 0, 1.5, 0.5, 0.5
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
-3.269462, -3.662014, -4,
-3.269462, -3.662014, 4,
-3.269462, -3.662014, -4,
-3.434012, -3.851019, -4,
-3.269462, -3.662014, -2,
-3.434012, -3.851019, -2,
-3.269462, -3.662014, 0,
-3.434012, -3.851019, 0,
-3.269462, -3.662014, 2,
-3.434012, -3.851019, 2,
-3.269462, -3.662014, 4,
-3.434012, -3.851019, 4
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
-3.763113, -4.22903, -4, 0, -0.5, 0.5, 0.5,
-3.763113, -4.22903, -4, 1, -0.5, 0.5, 0.5,
-3.763113, -4.22903, -4, 1, 1.5, 0.5, 0.5,
-3.763113, -4.22903, -4, 0, 1.5, 0.5, 0.5,
-3.763113, -4.22903, -2, 0, -0.5, 0.5, 0.5,
-3.763113, -4.22903, -2, 1, -0.5, 0.5, 0.5,
-3.763113, -4.22903, -2, 1, 1.5, 0.5, 0.5,
-3.763113, -4.22903, -2, 0, 1.5, 0.5, 0.5,
-3.763113, -4.22903, 0, 0, -0.5, 0.5, 0.5,
-3.763113, -4.22903, 0, 1, -0.5, 0.5, 0.5,
-3.763113, -4.22903, 0, 1, 1.5, 0.5, 0.5,
-3.763113, -4.22903, 0, 0, 1.5, 0.5, 0.5,
-3.763113, -4.22903, 2, 0, -0.5, 0.5, 0.5,
-3.763113, -4.22903, 2, 1, -0.5, 0.5, 0.5,
-3.763113, -4.22903, 2, 1, 1.5, 0.5, 0.5,
-3.763113, -4.22903, 2, 0, 1.5, 0.5, 0.5,
-3.763113, -4.22903, 4, 0, -0.5, 0.5, 0.5,
-3.763113, -4.22903, 4, 1, -0.5, 0.5, 0.5,
-3.763113, -4.22903, 4, 1, 1.5, 0.5, 0.5,
-3.763113, -4.22903, 4, 0, 1.5, 0.5, 0.5
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
-3.269462, -3.662014, -5.372619,
-3.269462, 3.898192, -5.372619,
-3.269462, -3.662014, 5.207859,
-3.269462, 3.898192, 5.207859,
-3.269462, -3.662014, -5.372619,
-3.269462, -3.662014, 5.207859,
-3.269462, 3.898192, -5.372619,
-3.269462, 3.898192, 5.207859,
-3.269462, -3.662014, -5.372619,
3.312558, -3.662014, -5.372619,
-3.269462, -3.662014, 5.207859,
3.312558, -3.662014, 5.207859,
-3.269462, 3.898192, -5.372619,
3.312558, 3.898192, -5.372619,
-3.269462, 3.898192, 5.207859,
3.312558, 3.898192, 5.207859,
3.312558, -3.662014, -5.372619,
3.312558, 3.898192, -5.372619,
3.312558, -3.662014, 5.207859,
3.312558, 3.898192, 5.207859,
3.312558, -3.662014, -5.372619,
3.312558, -3.662014, 5.207859,
3.312558, 3.898192, -5.372619,
3.312558, 3.898192, 5.207859
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
var radius = 7.782686;
var distance = 34.62605;
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
mvMatrix.translate( -0.02154803, -0.1180888, 0.08238029 );
mvMatrix.scale( 1.278452, 1.113037, 0.7953131 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.62605);
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
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.173607, 1.954432, -0.3602086, 0, 0, 1, 1, 1,
-2.918406, 0.4289466, -1.566756, 1, 0, 0, 1, 1,
-2.755716, -0.4543552, -2.344002, 1, 0, 0, 1, 1,
-2.754452, -1.430763, -3.217759, 1, 0, 0, 1, 1,
-2.65679, 1.786942, -1.972278, 1, 0, 0, 1, 1,
-2.601084, -0.9460217, -0.7926661, 1, 0, 0, 1, 1,
-2.446157, 0.1268737, -1.309894, 0, 0, 0, 1, 1,
-2.436654, -1.479995, -1.685976, 0, 0, 0, 1, 1,
-2.361006, 0.7999865, -1.038537, 0, 0, 0, 1, 1,
-2.360807, -0.237123, -0.04182684, 0, 0, 0, 1, 1,
-2.265702, 0.6071578, -2.129353, 0, 0, 0, 1, 1,
-2.195619, 0.1040433, -2.67953, 0, 0, 0, 1, 1,
-2.170185, 1.660095, -1.460196, 0, 0, 0, 1, 1,
-2.149755, 1.929344, 0.5655442, 1, 1, 1, 1, 1,
-2.144341, 0.6260401, -1.005077, 1, 1, 1, 1, 1,
-2.132652, -0.476189, -3.36915, 1, 1, 1, 1, 1,
-2.085927, -0.2486456, -2.68072, 1, 1, 1, 1, 1,
-2.043225, -0.3007112, -0.8095496, 1, 1, 1, 1, 1,
-2.002111, 1.642961, 0.1789661, 1, 1, 1, 1, 1,
-2.00141, 0.3059807, -0.3320664, 1, 1, 1, 1, 1,
-1.982787, -0.1149585, -2.06446, 1, 1, 1, 1, 1,
-1.971073, 1.250869, -1.100597, 1, 1, 1, 1, 1,
-1.959494, -0.5941293, -2.399148, 1, 1, 1, 1, 1,
-1.921221, -0.2418769, -1.186257, 1, 1, 1, 1, 1,
-1.863483, 2.464648, -0.5266483, 1, 1, 1, 1, 1,
-1.861895, -1.063737, -2.881546, 1, 1, 1, 1, 1,
-1.856182, 0.1464627, -1.888191, 1, 1, 1, 1, 1,
-1.850269, -2.519888, -3.824711, 1, 1, 1, 1, 1,
-1.808242, 0.8005772, -3.415843, 0, 0, 1, 1, 1,
-1.802944, -0.5115246, -3.825791, 1, 0, 0, 1, 1,
-1.793188, -0.01404668, -1.616623, 1, 0, 0, 1, 1,
-1.78905, -0.1232652, -2.713642, 1, 0, 0, 1, 1,
-1.782152, -1.117751, -2.289528, 1, 0, 0, 1, 1,
-1.780779, -2.082637, -2.496778, 1, 0, 0, 1, 1,
-1.774693, -0.06544714, -0.6872384, 0, 0, 0, 1, 1,
-1.773499, -0.2358437, -2.263506, 0, 0, 0, 1, 1,
-1.76846, 1.079038, -0.9434031, 0, 0, 0, 1, 1,
-1.764509, -0.2253524, -1.800078, 0, 0, 0, 1, 1,
-1.761683, -0.05574135, -0.01006631, 0, 0, 0, 1, 1,
-1.7508, -0.9251459, -1.375836, 0, 0, 0, 1, 1,
-1.749224, 0.6795093, -0.5651267, 0, 0, 0, 1, 1,
-1.748954, -0.4212632, -2.318879, 1, 1, 1, 1, 1,
-1.730648, -1.254683, -0.7584239, 1, 1, 1, 1, 1,
-1.728676, 0.1864776, -0.627866, 1, 1, 1, 1, 1,
-1.7272, 0.3486008, -1.978963, 1, 1, 1, 1, 1,
-1.713129, 0.301815, 0.2346533, 1, 1, 1, 1, 1,
-1.70622, 0.9708053, -0.3786093, 1, 1, 1, 1, 1,
-1.701683, 0.1804726, -1.29686, 1, 1, 1, 1, 1,
-1.698372, 0.3208114, -2.165281, 1, 1, 1, 1, 1,
-1.69225, -0.7043149, -2.978485, 1, 1, 1, 1, 1,
-1.691568, 1.127364, -3.142645, 1, 1, 1, 1, 1,
-1.690795, 0.1650838, -0.725651, 1, 1, 1, 1, 1,
-1.682927, 0.178469, -1.354053, 1, 1, 1, 1, 1,
-1.677471, -0.5392612, -0.3547712, 1, 1, 1, 1, 1,
-1.674039, -0.7095754, -2.298314, 1, 1, 1, 1, 1,
-1.659599, -0.7559975, -2.694211, 1, 1, 1, 1, 1,
-1.644662, -0.3745905, -1.085962, 0, 0, 1, 1, 1,
-1.638399, 0.6157876, -1.355425, 1, 0, 0, 1, 1,
-1.633625, -0.3077471, -3.219531, 1, 0, 0, 1, 1,
-1.624294, -1.525364, -2.198289, 1, 0, 0, 1, 1,
-1.609531, 0.7373209, -0.1665933, 1, 0, 0, 1, 1,
-1.603319, 1.308257, -0.03330366, 1, 0, 0, 1, 1,
-1.594817, 0.1619034, -1.92216, 0, 0, 0, 1, 1,
-1.577882, -1.295858, -3.066211, 0, 0, 0, 1, 1,
-1.570559, 0.2774426, -2.400763, 0, 0, 0, 1, 1,
-1.569478, -0.7617357, -3.415157, 0, 0, 0, 1, 1,
-1.561473, 0.8464231, 0.04088219, 0, 0, 0, 1, 1,
-1.559341, -0.4894458, -1.996146, 0, 0, 0, 1, 1,
-1.556955, 0.6588047, -0.5067678, 0, 0, 0, 1, 1,
-1.542048, 1.117114, -1.235868, 1, 1, 1, 1, 1,
-1.541594, -0.398121, -2.745201, 1, 1, 1, 1, 1,
-1.492118, -0.1641654, -2.723487, 1, 1, 1, 1, 1,
-1.486609, -0.615644, -1.05284, 1, 1, 1, 1, 1,
-1.485965, 1.368134, -2.498544, 1, 1, 1, 1, 1,
-1.472876, -0.7280546, -2.629697, 1, 1, 1, 1, 1,
-1.460453, 0.7461918, -1.907336, 1, 1, 1, 1, 1,
-1.458344, -0.313178, -0.5613465, 1, 1, 1, 1, 1,
-1.4496, -0.7753156, -1.562752, 1, 1, 1, 1, 1,
-1.445198, -0.5628185, -1.275591, 1, 1, 1, 1, 1,
-1.4397, 0.8730393, -1.038157, 1, 1, 1, 1, 1,
-1.437749, 0.349839, -1.123001, 1, 1, 1, 1, 1,
-1.431138, -0.2264123, -3.280891, 1, 1, 1, 1, 1,
-1.427863, -0.2592887, -1.422277, 1, 1, 1, 1, 1,
-1.423705, 1.217459, -1.212261, 1, 1, 1, 1, 1,
-1.42118, 1.907336, -0.2297189, 0, 0, 1, 1, 1,
-1.420223, 0.1710993, -0.0588064, 1, 0, 0, 1, 1,
-1.415267, 0.5722407, 0.004070498, 1, 0, 0, 1, 1,
-1.410578, -0.348826, -1.351508, 1, 0, 0, 1, 1,
-1.393878, 1.043957, -0.0302394, 1, 0, 0, 1, 1,
-1.386988, 0.9411253, -2.06289, 1, 0, 0, 1, 1,
-1.375507, 0.7462991, 0.2899652, 0, 0, 0, 1, 1,
-1.360908, -0.2075809, -0.1433134, 0, 0, 0, 1, 1,
-1.349302, -0.6731712, -1.357681, 0, 0, 0, 1, 1,
-1.34245, 0.2503285, -1.863641, 0, 0, 0, 1, 1,
-1.341466, 1.087913, -0.4898077, 0, 0, 0, 1, 1,
-1.330453, -1.653542, -3.352006, 0, 0, 0, 1, 1,
-1.326528, -1.385026, -3.627653, 0, 0, 0, 1, 1,
-1.325893, -1.400532, -2.039369, 1, 1, 1, 1, 1,
-1.320816, -0.1909566, -1.581486, 1, 1, 1, 1, 1,
-1.320082, -0.4893792, -2.251956, 1, 1, 1, 1, 1,
-1.318491, -1.317788, -3.915459, 1, 1, 1, 1, 1,
-1.3154, -1.567276, -0.1634293, 1, 1, 1, 1, 1,
-1.313533, 0.3660483, -0.340668, 1, 1, 1, 1, 1,
-1.309954, 0.8377888, 0.5585129, 1, 1, 1, 1, 1,
-1.309137, 0.9586254, -0.5446224, 1, 1, 1, 1, 1,
-1.305208, 0.218719, -1.657634, 1, 1, 1, 1, 1,
-1.299524, -1.46514, -5.218534, 1, 1, 1, 1, 1,
-1.296451, -1.055897, -3.66832, 1, 1, 1, 1, 1,
-1.288194, -1.227113, -1.272017, 1, 1, 1, 1, 1,
-1.288074, -1.686595, -4.036251, 1, 1, 1, 1, 1,
-1.284898, 0.653025, 1.233865, 1, 1, 1, 1, 1,
-1.266476, -1.509839, -2.491501, 1, 1, 1, 1, 1,
-1.258259, -0.01691127, -0.1764977, 0, 0, 1, 1, 1,
-1.25683, -0.5573238, -3.797368, 1, 0, 0, 1, 1,
-1.256271, 0.1253532, -1.734915, 1, 0, 0, 1, 1,
-1.255942, 0.5205262, -0.8600248, 1, 0, 0, 1, 1,
-1.232313, -0.5632291, -0.9916908, 1, 0, 0, 1, 1,
-1.227026, 0.7311909, 1.184576, 1, 0, 0, 1, 1,
-1.222397, -0.6988587, -1.827909, 0, 0, 0, 1, 1,
-1.222246, -0.4710584, -2.398067, 0, 0, 0, 1, 1,
-1.213626, 1.01815, -1.819244, 0, 0, 0, 1, 1,
-1.209749, 0.9328907, -1.439243, 0, 0, 0, 1, 1,
-1.2028, -0.6667798, -3.321906, 0, 0, 0, 1, 1,
-1.19279, -0.4763208, -1.201109, 0, 0, 0, 1, 1,
-1.192713, 0.8352432, -0.6802641, 0, 0, 0, 1, 1,
-1.188051, -0.02407538, -2.197177, 1, 1, 1, 1, 1,
-1.186159, -0.05023746, -0.5665944, 1, 1, 1, 1, 1,
-1.182667, 1.083037, -1.140887, 1, 1, 1, 1, 1,
-1.164349, -1.428316, -2.937206, 1, 1, 1, 1, 1,
-1.158042, 0.7410051, -0.8494921, 1, 1, 1, 1, 1,
-1.153533, -0.4858548, -1.714834, 1, 1, 1, 1, 1,
-1.146831, 0.2687171, -0.6236497, 1, 1, 1, 1, 1,
-1.146035, -0.3204138, -0.9484943, 1, 1, 1, 1, 1,
-1.143361, 1.306404, 0.7394647, 1, 1, 1, 1, 1,
-1.142999, -0.7813622, -2.452222, 1, 1, 1, 1, 1,
-1.12719, 1.337802, 2.014731, 1, 1, 1, 1, 1,
-1.124836, -0.09889781, -1.49963, 1, 1, 1, 1, 1,
-1.120611, 0.2925305, -1.71811, 1, 1, 1, 1, 1,
-1.119283, -0.8186525, -1.345556, 1, 1, 1, 1, 1,
-1.117257, 0.3659153, -1.102224, 1, 1, 1, 1, 1,
-1.112099, 1.035554, -0.07972553, 0, 0, 1, 1, 1,
-1.109718, -0.877211, -3.643589, 1, 0, 0, 1, 1,
-1.09998, 0.3528256, -2.27409, 1, 0, 0, 1, 1,
-1.096926, 2.315057, -0.08127267, 1, 0, 0, 1, 1,
-1.085467, 1.820036, 0.6601873, 1, 0, 0, 1, 1,
-1.070951, -1.640245, -3.020718, 1, 0, 0, 1, 1,
-1.070774, 0.3189956, -2.902812, 0, 0, 0, 1, 1,
-1.061478, -0.5218146, -2.596917, 0, 0, 0, 1, 1,
-1.060637, -0.2689337, -0.7503537, 0, 0, 0, 1, 1,
-1.057781, -0.990236, -3.775029, 0, 0, 0, 1, 1,
-1.057477, -1.555597, -4.031265, 0, 0, 0, 1, 1,
-1.056313, -2.05516, -2.895622, 0, 0, 0, 1, 1,
-1.052267, -0.9240517, -2.020924, 0, 0, 0, 1, 1,
-1.049883, 0.8902797, -1.930962, 1, 1, 1, 1, 1,
-1.046431, -1.793807, -3.077208, 1, 1, 1, 1, 1,
-1.045313, 1.880708, -2.685368, 1, 1, 1, 1, 1,
-1.044829, -0.7896783, -1.409966, 1, 1, 1, 1, 1,
-1.03627, 0.5443874, -0.8013316, 1, 1, 1, 1, 1,
-1.03182, -0.6112535, -2.632207, 1, 1, 1, 1, 1,
-1.031688, 1.25997, -0.7092144, 1, 1, 1, 1, 1,
-1.027796, -0.9948411, -3.806372, 1, 1, 1, 1, 1,
-1.022908, 0.2645526, -0.1910415, 1, 1, 1, 1, 1,
-1.022468, -0.7794677, -4.920463, 1, 1, 1, 1, 1,
-1.01817, 1.117632, -1.485408, 1, 1, 1, 1, 1,
-1.013988, 0.2735461, -0.3224331, 1, 1, 1, 1, 1,
-1.006443, 1.75057, 0.8229578, 1, 1, 1, 1, 1,
-1.005966, -0.6752272, -2.458234, 1, 1, 1, 1, 1,
-0.9999382, 0.2863691, -1.875404, 1, 1, 1, 1, 1,
-0.9877741, 0.06858839, -0.701713, 0, 0, 1, 1, 1,
-0.9830437, 0.9881234, -0.5126351, 1, 0, 0, 1, 1,
-0.9811313, -0.2354483, -1.10206, 1, 0, 0, 1, 1,
-0.980318, 1.017688, 1.364195, 1, 0, 0, 1, 1,
-0.9698683, 0.2103264, -1.664793, 1, 0, 0, 1, 1,
-0.9698117, 0.3838153, -0.05605099, 1, 0, 0, 1, 1,
-0.9689752, 0.7011568, 0.1795452, 0, 0, 0, 1, 1,
-0.9615548, -0.9323498, -1.465609, 0, 0, 0, 1, 1,
-0.9611067, -2.083778, -3.216207, 0, 0, 0, 1, 1,
-0.9588879, -0.01203475, -2.32097, 0, 0, 0, 1, 1,
-0.9568505, 1.163298, 0.7695356, 0, 0, 0, 1, 1,
-0.9558697, -0.7591835, -2.405138, 0, 0, 0, 1, 1,
-0.9521632, -0.5427617, -0.288864, 0, 0, 0, 1, 1,
-0.9479044, -0.2690916, -1.152756, 1, 1, 1, 1, 1,
-0.9428274, 3.788092, -0.4643054, 1, 1, 1, 1, 1,
-0.9404975, -0.6889004, -2.064864, 1, 1, 1, 1, 1,
-0.9260372, -0.5347241, -2.143504, 1, 1, 1, 1, 1,
-0.9201034, -1.245742, -2.267568, 1, 1, 1, 1, 1,
-0.918869, 0.4740058, -0.9498094, 1, 1, 1, 1, 1,
-0.9105238, 0.3562506, -1.83706, 1, 1, 1, 1, 1,
-0.9100187, -0.4613405, -4.390988, 1, 1, 1, 1, 1,
-0.9093476, -0.6663951, -4.287365, 1, 1, 1, 1, 1,
-0.9066054, -1.299357, -2.507225, 1, 1, 1, 1, 1,
-0.898965, -0.2785133, -1.958522, 1, 1, 1, 1, 1,
-0.8971858, 0.5664995, 0.1854217, 1, 1, 1, 1, 1,
-0.8928, 0.5002306, -3.224563, 1, 1, 1, 1, 1,
-0.8923985, 0.70167, -2.110703, 1, 1, 1, 1, 1,
-0.8842758, -0.5234821, -2.033887, 1, 1, 1, 1, 1,
-0.8841165, -0.2330333, -0.2367975, 0, 0, 1, 1, 1,
-0.8812799, -1.110432, -2.505555, 1, 0, 0, 1, 1,
-0.8768874, 0.4216829, -0.2084384, 1, 0, 0, 1, 1,
-0.8767449, -0.3432081, -1.83147, 1, 0, 0, 1, 1,
-0.865643, -0.7192168, -3.09918, 1, 0, 0, 1, 1,
-0.8651639, -0.8009624, -2.989937, 1, 0, 0, 1, 1,
-0.8632392, 0.3270271, -2.123606, 0, 0, 0, 1, 1,
-0.8550279, -1.026252, -3.421997, 0, 0, 0, 1, 1,
-0.8526398, 0.451587, -1.609421, 0, 0, 0, 1, 1,
-0.8519005, 0.9838406, -1.209007, 0, 0, 0, 1, 1,
-0.8503801, 0.432521, -3.282764, 0, 0, 0, 1, 1,
-0.8458781, 1.088127, -1.829587, 0, 0, 0, 1, 1,
-0.8386316, 0.1455319, -0.00596102, 0, 0, 0, 1, 1,
-0.8333343, -0.8541251, -2.589171, 1, 1, 1, 1, 1,
-0.8306319, 0.2981294, -1.66535, 1, 1, 1, 1, 1,
-0.8303266, 1.315391, 0.4797314, 1, 1, 1, 1, 1,
-0.8300548, 0.5487518, -0.28845, 1, 1, 1, 1, 1,
-0.8299218, -0.2937319, -1.589689, 1, 1, 1, 1, 1,
-0.8283344, -2.013068, -3.927144, 1, 1, 1, 1, 1,
-0.8256923, -0.2475288, -0.4790396, 1, 1, 1, 1, 1,
-0.8228216, 0.321568, -1.203133, 1, 1, 1, 1, 1,
-0.8193585, 1.714706, -0.7146121, 1, 1, 1, 1, 1,
-0.8188141, 0.2535931, -1.942631, 1, 1, 1, 1, 1,
-0.8173308, -0.259517, -1.818161, 1, 1, 1, 1, 1,
-0.8166237, 0.8942773, -3.026829, 1, 1, 1, 1, 1,
-0.8139918, -0.441999, -2.411753, 1, 1, 1, 1, 1,
-0.8116738, -0.01827329, -1.983147, 1, 1, 1, 1, 1,
-0.8072239, -0.256485, -0.7045029, 1, 1, 1, 1, 1,
-0.802983, -0.4011959, -3.034508, 0, 0, 1, 1, 1,
-0.800357, 0.3282551, -0.7873827, 1, 0, 0, 1, 1,
-0.7978861, 0.1292456, -0.19268, 1, 0, 0, 1, 1,
-0.7919834, 0.07679606, -1.337401, 1, 0, 0, 1, 1,
-0.7858099, -0.09035413, -2.727162, 1, 0, 0, 1, 1,
-0.7844579, -1.084535, -3.42429, 1, 0, 0, 1, 1,
-0.7835609, -0.1219304, -0.8117304, 0, 0, 0, 1, 1,
-0.7724472, -0.782465, -2.99942, 0, 0, 0, 1, 1,
-0.7705252, 0.09275901, -2.398948, 0, 0, 0, 1, 1,
-0.7687274, -0.5524542, -1.163638, 0, 0, 0, 1, 1,
-0.7659591, -0.3937758, -2.627832, 0, 0, 0, 1, 1,
-0.756507, -1.574712, -2.621751, 0, 0, 0, 1, 1,
-0.7557939, 0.1042637, -3.920509, 0, 0, 0, 1, 1,
-0.7530715, 0.1626153, -0.6500614, 1, 1, 1, 1, 1,
-0.7525668, -0.5792077, -2.052617, 1, 1, 1, 1, 1,
-0.7492588, -0.4523914, -2.375098, 1, 1, 1, 1, 1,
-0.7452692, -0.5276577, -1.953081, 1, 1, 1, 1, 1,
-0.7446404, -0.9572558, -2.438293, 1, 1, 1, 1, 1,
-0.7440621, -0.9804193, -1.520478, 1, 1, 1, 1, 1,
-0.7440494, -0.5885136, -0.3779315, 1, 1, 1, 1, 1,
-0.7415025, 0.01010227, -2.367647, 1, 1, 1, 1, 1,
-0.7335674, 0.8735544, 0.3777656, 1, 1, 1, 1, 1,
-0.7301694, -0.6350278, -2.200549, 1, 1, 1, 1, 1,
-0.7272459, 0.3651454, -0.598893, 1, 1, 1, 1, 1,
-0.7249804, -0.4799908, -2.845746, 1, 1, 1, 1, 1,
-0.7249643, -0.3797756, -1.444227, 1, 1, 1, 1, 1,
-0.7248288, 2.656529, 0.2690547, 1, 1, 1, 1, 1,
-0.7241241, -1.968328, -1.350157, 1, 1, 1, 1, 1,
-0.7239926, 0.1342858, -2.428199, 0, 0, 1, 1, 1,
-0.7192386, 0.6970524, -0.6554893, 1, 0, 0, 1, 1,
-0.7191308, -0.5507303, -2.355758, 1, 0, 0, 1, 1,
-0.7110342, -0.3899118, -2.502765, 1, 0, 0, 1, 1,
-0.7094466, 0.4797788, 0.06183618, 1, 0, 0, 1, 1,
-0.7083587, -0.6264179, -0.3939707, 1, 0, 0, 1, 1,
-0.7074974, -0.009993603, -1.486265, 0, 0, 0, 1, 1,
-0.7058206, -0.3888217, -1.709323, 0, 0, 0, 1, 1,
-0.6980538, 1.297147, -0.2261617, 0, 0, 0, 1, 1,
-0.6972321, -2.526163, -1.137496, 0, 0, 0, 1, 1,
-0.6951935, -0.9140819, -2.572857, 0, 0, 0, 1, 1,
-0.6937438, -0.378551, -0.4333429, 0, 0, 0, 1, 1,
-0.6927755, 1.566196, -1.301723, 0, 0, 0, 1, 1,
-0.6875705, -2.139619, -2.404194, 1, 1, 1, 1, 1,
-0.6821888, 1.310123, 1.060822, 1, 1, 1, 1, 1,
-0.6765651, 0.4448541, 0.1189061, 1, 1, 1, 1, 1,
-0.6756554, 0.6542996, 0.1858299, 1, 1, 1, 1, 1,
-0.6752698, -0.2661501, -2.254444, 1, 1, 1, 1, 1,
-0.6714295, -0.004455592, -1.743954, 1, 1, 1, 1, 1,
-0.6683674, 0.3824935, -0.444006, 1, 1, 1, 1, 1,
-0.6667016, 0.2532914, -0.7780081, 1, 1, 1, 1, 1,
-0.6636268, 1.389921, -0.4066031, 1, 1, 1, 1, 1,
-0.6581445, 1.221786, 0.1293115, 1, 1, 1, 1, 1,
-0.6560028, 0.5432659, -0.4303513, 1, 1, 1, 1, 1,
-0.6466628, -1.472511, -0.8167105, 1, 1, 1, 1, 1,
-0.641467, 0.9544698, -0.1449694, 1, 1, 1, 1, 1,
-0.6413777, 0.3237523, -0.5517406, 1, 1, 1, 1, 1,
-0.6359617, 1.10204, -2.599073, 1, 1, 1, 1, 1,
-0.6350448, -1.040731, -1.276578, 0, 0, 1, 1, 1,
-0.6303091, 0.306101, -0.7222062, 1, 0, 0, 1, 1,
-0.6287813, 0.1641482, -3.755792, 1, 0, 0, 1, 1,
-0.628061, -0.3071559, -2.758989, 1, 0, 0, 1, 1,
-0.6223226, -1.162727, -4.638569, 1, 0, 0, 1, 1,
-0.621932, -0.8965591, -3.765254, 1, 0, 0, 1, 1,
-0.6117439, -1.23431, -2.282444, 0, 0, 0, 1, 1,
-0.6082678, -0.5989403, -2.552011, 0, 0, 0, 1, 1,
-0.6074912, -1.060893, -2.711217, 0, 0, 0, 1, 1,
-0.6065444, 0.6805968, -0.169393, 0, 0, 0, 1, 1,
-0.604808, 1.286928, 0.4067625, 0, 0, 0, 1, 1,
-0.5996344, 0.3009296, -0.2564186, 0, 0, 0, 1, 1,
-0.5993383, -1.206524, -2.288276, 0, 0, 0, 1, 1,
-0.5962095, -1.197401, -1.101742, 1, 1, 1, 1, 1,
-0.591418, 0.716361, 0.5073786, 1, 1, 1, 1, 1,
-0.5865639, -0.1544807, -3.665432, 1, 1, 1, 1, 1,
-0.5798895, 1.036993, -1.197388, 1, 1, 1, 1, 1,
-0.5792958, 0.416175, -0.7846224, 1, 1, 1, 1, 1,
-0.5758482, 0.9721322, -1.694046, 1, 1, 1, 1, 1,
-0.5676007, -0.664844, -2.84485, 1, 1, 1, 1, 1,
-0.5638494, -0.4657256, -2.151285, 1, 1, 1, 1, 1,
-0.5596123, 0.2373436, -2.16994, 1, 1, 1, 1, 1,
-0.5589918, -0.1169867, -1.78865, 1, 1, 1, 1, 1,
-0.5587673, 0.7420423, -0.5082257, 1, 1, 1, 1, 1,
-0.5561043, 2.355254, -0.2872745, 1, 1, 1, 1, 1,
-0.5468229, -0.2766546, -2.868589, 1, 1, 1, 1, 1,
-0.5462553, 1.491958, -1.971289, 1, 1, 1, 1, 1,
-0.5415566, 0.8050897, -0.9548247, 1, 1, 1, 1, 1,
-0.5350587, 1.170992, -1.12308, 0, 0, 1, 1, 1,
-0.5325601, 1.300526, -0.5828881, 1, 0, 0, 1, 1,
-0.5299239, -1.334342, -2.742332, 1, 0, 0, 1, 1,
-0.5285088, -0.0451481, -2.50667, 1, 0, 0, 1, 1,
-0.5257356, -1.263957, -2.961734, 1, 0, 0, 1, 1,
-0.5242261, 0.01223001, -0.941382, 1, 0, 0, 1, 1,
-0.524047, -0.591122, -2.846813, 0, 0, 0, 1, 1,
-0.5232023, -1.085474, -3.123206, 0, 0, 0, 1, 1,
-0.5231736, 0.2586457, -0.02865926, 0, 0, 0, 1, 1,
-0.5221642, 1.020464, -0.6963813, 0, 0, 0, 1, 1,
-0.5212773, -0.008514912, -1.063687, 0, 0, 0, 1, 1,
-0.5206475, 0.1265002, -0.5631545, 0, 0, 0, 1, 1,
-0.5187571, 0.533599, -1.579556, 0, 0, 0, 1, 1,
-0.5114684, 0.9267884, -0.5124618, 1, 1, 1, 1, 1,
-0.5112129, -1.771117, -4.032901, 1, 1, 1, 1, 1,
-0.5059117, 0.7207829, -2.439785, 1, 1, 1, 1, 1,
-0.5034088, 0.2174343, -1.440945, 1, 1, 1, 1, 1,
-0.5015129, 0.5737849, -1.562419, 1, 1, 1, 1, 1,
-0.4987919, -1.404145, -4.002525, 1, 1, 1, 1, 1,
-0.4977156, -0.5451748, -2.745076, 1, 1, 1, 1, 1,
-0.495186, 0.134493, -3.503545, 1, 1, 1, 1, 1,
-0.4942331, -0.2583945, -0.9949412, 1, 1, 1, 1, 1,
-0.4931321, 1.203514, 1.247873, 1, 1, 1, 1, 1,
-0.4902819, 0.4994937, -1.387476, 1, 1, 1, 1, 1,
-0.4894349, -0.747835, -1.765128, 1, 1, 1, 1, 1,
-0.4872195, -2.024637, -3.568794, 1, 1, 1, 1, 1,
-0.4847767, -0.03231555, -2.657234, 1, 1, 1, 1, 1,
-0.4764766, 0.05698861, -0.9144247, 1, 1, 1, 1, 1,
-0.4749041, 1.108078, 0.05606706, 0, 0, 1, 1, 1,
-0.4711269, 0.1967377, -0.3706971, 1, 0, 0, 1, 1,
-0.4644597, 1.082738, 0.366753, 1, 0, 0, 1, 1,
-0.463398, 1.762173, 0.851143, 1, 0, 0, 1, 1,
-0.4632317, 0.540777, -0.0669264, 1, 0, 0, 1, 1,
-0.4616996, 1.24651, -1.098192, 1, 0, 0, 1, 1,
-0.4595575, -0.4781386, -2.790578, 0, 0, 0, 1, 1,
-0.4450192, -0.5504165, -2.019347, 0, 0, 0, 1, 1,
-0.4444926, -1.337679, -2.672451, 0, 0, 0, 1, 1,
-0.4433442, -0.04825813, -0.2435829, 0, 0, 0, 1, 1,
-0.4421818, 1.424397, 1.594332, 0, 0, 0, 1, 1,
-0.4413377, -0.3896728, -1.713791, 0, 0, 0, 1, 1,
-0.4410678, 0.5956216, -0.4843489, 0, 0, 0, 1, 1,
-0.440926, -0.8187157, -2.534425, 1, 1, 1, 1, 1,
-0.4391542, -0.939158, -2.52629, 1, 1, 1, 1, 1,
-0.4360728, -1.556696, -3.09519, 1, 1, 1, 1, 1,
-0.4348451, 1.004989, -0.547468, 1, 1, 1, 1, 1,
-0.4318317, 0.9199275, -0.8325409, 1, 1, 1, 1, 1,
-0.431436, -0.5309251, -1.787617, 1, 1, 1, 1, 1,
-0.4307792, 0.5547991, -0.489203, 1, 1, 1, 1, 1,
-0.4291715, 0.2609693, -1.536019, 1, 1, 1, 1, 1,
-0.4213752, -0.165987, -0.7144884, 1, 1, 1, 1, 1,
-0.4205359, -1.069864, -3.820645, 1, 1, 1, 1, 1,
-0.4194182, -0.7042884, -2.026904, 1, 1, 1, 1, 1,
-0.4087823, -1.419932, -4.997099, 1, 1, 1, 1, 1,
-0.4063821, 0.03177907, -0.6854479, 1, 1, 1, 1, 1,
-0.4057755, 0.7389226, -1.643153, 1, 1, 1, 1, 1,
-0.3968685, -0.138797, -2.811866, 1, 1, 1, 1, 1,
-0.3934661, -0.4656464, -2.678622, 0, 0, 1, 1, 1,
-0.3890544, 0.1366849, -0.6634856, 1, 0, 0, 1, 1,
-0.3858298, 0.6236909, -1.377976, 1, 0, 0, 1, 1,
-0.3806692, -0.4308357, -1.586082, 1, 0, 0, 1, 1,
-0.3802187, 2.662539, 0.3378911, 1, 0, 0, 1, 1,
-0.3731831, -0.3094828, -2.542848, 1, 0, 0, 1, 1,
-0.3704977, -1.456589, -3.296233, 0, 0, 0, 1, 1,
-0.3704611, 0.5773351, -0.4583037, 0, 0, 0, 1, 1,
-0.3688431, -2.278986, -2.946519, 0, 0, 0, 1, 1,
-0.3677236, 0.8779996, -1.018011, 0, 0, 0, 1, 1,
-0.3652726, -2.456474, -2.422219, 0, 0, 0, 1, 1,
-0.3617213, 0.5578742, -2.290491, 0, 0, 0, 1, 1,
-0.3538647, -1.10101, -2.494893, 0, 0, 0, 1, 1,
-0.3514909, 0.5513857, -2.042083, 1, 1, 1, 1, 1,
-0.345096, -1.086629, -4.123068, 1, 1, 1, 1, 1,
-0.3418875, -0.7088802, -0.883659, 1, 1, 1, 1, 1,
-0.3357774, -0.5448372, -2.720713, 1, 1, 1, 1, 1,
-0.3351604, 0.499341, -1.479886, 1, 1, 1, 1, 1,
-0.3338881, -1.230134, -3.476177, 1, 1, 1, 1, 1,
-0.333673, -0.5862187, -4.204238, 1, 1, 1, 1, 1,
-0.3330559, -1.775306, -1.523594, 1, 1, 1, 1, 1,
-0.3221293, -0.9357291, -3.730275, 1, 1, 1, 1, 1,
-0.3215932, 0.1949735, -1.633012, 1, 1, 1, 1, 1,
-0.3178149, 0.08984251, -0.9682767, 1, 1, 1, 1, 1,
-0.3175384, 1.168218, 0.7919446, 1, 1, 1, 1, 1,
-0.3145466, -0.1291669, -0.3346213, 1, 1, 1, 1, 1,
-0.3140043, 0.08349031, -1.974783, 1, 1, 1, 1, 1,
-0.3116101, 0.2549079, -1.772182, 1, 1, 1, 1, 1,
-0.3115966, -2.554458, -3.499314, 0, 0, 1, 1, 1,
-0.3070442, -2.729436, -4.22582, 1, 0, 0, 1, 1,
-0.3055203, 0.510438, -2.902306, 1, 0, 0, 1, 1,
-0.3000075, 0.08419298, -0.6584188, 1, 0, 0, 1, 1,
-0.2993705, 0.2966924, 0.4455253, 1, 0, 0, 1, 1,
-0.2967059, -0.8303688, -2.236337, 1, 0, 0, 1, 1,
-0.2963564, 0.527573, 0.125456, 0, 0, 0, 1, 1,
-0.2950532, -0.7796296, -2.371381, 0, 0, 0, 1, 1,
-0.2949572, 0.2176437, -2.522763, 0, 0, 0, 1, 1,
-0.2940658, -1.10117, -3.00613, 0, 0, 0, 1, 1,
-0.2909822, -0.0267566, -0.6905982, 0, 0, 0, 1, 1,
-0.2903481, 0.2290752, -0.2795184, 0, 0, 0, 1, 1,
-0.2884585, 0.5890804, 1.13147, 0, 0, 0, 1, 1,
-0.2878132, -0.05751667, -3.155356, 1, 1, 1, 1, 1,
-0.2825114, 0.8803726, -2.039506, 1, 1, 1, 1, 1,
-0.279713, 0.5662631, -1.409488, 1, 1, 1, 1, 1,
-0.2769493, -0.581362, -2.462701, 1, 1, 1, 1, 1,
-0.276704, 2.752278, -0.1103742, 1, 1, 1, 1, 1,
-0.2742412, -0.636511, -4.930579, 1, 1, 1, 1, 1,
-0.2709274, 0.5932016, -1.106444, 1, 1, 1, 1, 1,
-0.2696079, -1.156926, -4.763814, 1, 1, 1, 1, 1,
-0.2670689, -1.57115, -3.03085, 1, 1, 1, 1, 1,
-0.2655623, -0.8009365, -1.124029, 1, 1, 1, 1, 1,
-0.2571843, 0.03571299, -0.4590886, 1, 1, 1, 1, 1,
-0.256625, -1.545595, -3.821038, 1, 1, 1, 1, 1,
-0.2538469, 0.8344542, -0.7303653, 1, 1, 1, 1, 1,
-0.2510371, -0.7883088, -1.644296, 1, 1, 1, 1, 1,
-0.2495931, -0.5288534, -3.480895, 1, 1, 1, 1, 1,
-0.2463685, -1.065093, -2.170022, 0, 0, 1, 1, 1,
-0.242937, 0.4462246, -0.1552483, 1, 0, 0, 1, 1,
-0.2427839, 1.039454, -0.2308546, 1, 0, 0, 1, 1,
-0.2374657, 0.5414119, -0.2589015, 1, 0, 0, 1, 1,
-0.2360278, -0.6856074, -0.6583881, 1, 0, 0, 1, 1,
-0.2345324, -1.297, -3.066165, 1, 0, 0, 1, 1,
-0.2330404, -0.6892542, -2.280556, 0, 0, 0, 1, 1,
-0.2308745, -0.4434728, -2.435105, 0, 0, 0, 1, 1,
-0.2249968, 0.6262512, -1.923035, 0, 0, 0, 1, 1,
-0.223073, 0.7016785, 0.3332251, 0, 0, 0, 1, 1,
-0.2203644, 0.03524587, -1.391006, 0, 0, 0, 1, 1,
-0.2197296, 0.7838114, 0.9063796, 0, 0, 0, 1, 1,
-0.2193463, -1.119959, -1.897646, 0, 0, 0, 1, 1,
-0.2183158, -0.331623, -2.616374, 1, 1, 1, 1, 1,
-0.2159944, 1.108663, 0.654791, 1, 1, 1, 1, 1,
-0.2146692, 1.716148, 0.9372387, 1, 1, 1, 1, 1,
-0.2134048, -1.582073, -4.012496, 1, 1, 1, 1, 1,
-0.2129818, 1.626698, 0.9864535, 1, 1, 1, 1, 1,
-0.2110893, 0.5520675, 0.2357579, 1, 1, 1, 1, 1,
-0.2094814, 1.014446, 0.1654281, 1, 1, 1, 1, 1,
-0.2076677, -0.6268474, -2.481161, 1, 1, 1, 1, 1,
-0.2043785, 0.5005639, -0.1288611, 1, 1, 1, 1, 1,
-0.1942699, 0.6674773, -0.7514283, 1, 1, 1, 1, 1,
-0.192453, -0.08625613, -2.258174, 1, 1, 1, 1, 1,
-0.1917882, 0.03318757, -2.183399, 1, 1, 1, 1, 1,
-0.1912135, -1.15988, -2.867321, 1, 1, 1, 1, 1,
-0.1910693, 0.4074329, -0.944252, 1, 1, 1, 1, 1,
-0.1902663, -2.520947, -3.339531, 1, 1, 1, 1, 1,
-0.1892725, 0.0926508, -2.080272, 0, 0, 1, 1, 1,
-0.1863173, 0.3191832, -1.317067, 1, 0, 0, 1, 1,
-0.1833524, -0.8279677, -3.455176, 1, 0, 0, 1, 1,
-0.1829251, 0.7781756, 0.8309048, 1, 0, 0, 1, 1,
-0.1814554, -0.9224982, -2.973336, 1, 0, 0, 1, 1,
-0.1803091, 1.109932, -1.450016, 1, 0, 0, 1, 1,
-0.1764762, -1.414336, -3.305573, 0, 0, 0, 1, 1,
-0.1746638, -0.451253, -4.114647, 0, 0, 0, 1, 1,
-0.1693167, -0.641785, -1.244705, 0, 0, 0, 1, 1,
-0.1630508, -1.52973, -2.43719, 0, 0, 0, 1, 1,
-0.1613336, -0.2772657, -1.660863, 0, 0, 0, 1, 1,
-0.1578653, -0.2452827, -1.047468, 0, 0, 0, 1, 1,
-0.1542463, 0.5105128, 2.643488, 0, 0, 0, 1, 1,
-0.1517372, 0.001686952, -1.26077, 1, 1, 1, 1, 1,
-0.1517146, -0.1008333, -3.212557, 1, 1, 1, 1, 1,
-0.1467426, 0.6395448, -0.2330339, 1, 1, 1, 1, 1,
-0.1449118, -0.3107802, -3.568059, 1, 1, 1, 1, 1,
-0.1445737, 1.908955, -2.542827, 1, 1, 1, 1, 1,
-0.1366879, 2.192308, 1.575273, 1, 1, 1, 1, 1,
-0.1361338, 0.7102967, 0.2033792, 1, 1, 1, 1, 1,
-0.1338856, -0.3065898, -2.179817, 1, 1, 1, 1, 1,
-0.1285346, 0.003469804, -2.09636, 1, 1, 1, 1, 1,
-0.1241829, 1.091623, -0.08196375, 1, 1, 1, 1, 1,
-0.1236459, 0.2644894, -0.04420817, 1, 1, 1, 1, 1,
-0.1230243, -0.7310604, -3.103814, 1, 1, 1, 1, 1,
-0.1179551, 0.5343045, -2.898936, 1, 1, 1, 1, 1,
-0.1109479, -0.4250473, -4.652354, 1, 1, 1, 1, 1,
-0.1065502, -1.048995, -3.40374, 1, 1, 1, 1, 1,
-0.1059315, 1.000967, -3.442952, 0, 0, 1, 1, 1,
-0.09957561, 0.3822762, -0.1645299, 1, 0, 0, 1, 1,
-0.09838073, 0.1855375, -0.3773885, 1, 0, 0, 1, 1,
-0.09254393, 0.4212025, 0.04029332, 1, 0, 0, 1, 1,
-0.09092742, -0.2800778, -2.347651, 1, 0, 0, 1, 1,
-0.0903848, 0.115017, 1.480499, 1, 0, 0, 1, 1,
-0.08346185, -0.004283985, -2.587311, 0, 0, 0, 1, 1,
-0.07963477, 0.1560214, -1.198668, 0, 0, 0, 1, 1,
-0.07845429, -1.491853, -2.692018, 0, 0, 0, 1, 1,
-0.07090566, -2.320941, -2.980452, 0, 0, 0, 1, 1,
-0.06735273, -1.196283, -1.680109, 0, 0, 0, 1, 1,
-0.06303784, 0.8333852, -0.08178353, 0, 0, 0, 1, 1,
-0.06125231, 1.117202, -0.9423676, 0, 0, 0, 1, 1,
-0.06102091, -0.2097794, -0.1246659, 1, 1, 1, 1, 1,
-0.04718162, -0.3153064, -2.617191, 1, 1, 1, 1, 1,
-0.04505551, 0.002634384, -0.6599311, 1, 1, 1, 1, 1,
-0.04129828, -0.8163479, -2.765561, 1, 1, 1, 1, 1,
-0.04101836, -0.644026, -1.579862, 1, 1, 1, 1, 1,
-0.03962607, -0.5308736, -2.360542, 1, 1, 1, 1, 1,
-0.03393419, 0.2972524, 0.7861438, 1, 1, 1, 1, 1,
-0.02470792, -1.106986, -2.398437, 1, 1, 1, 1, 1,
-0.02211224, -0.06482966, -3.420897, 1, 1, 1, 1, 1,
-0.01675919, 0.2708059, 2.093938, 1, 1, 1, 1, 1,
-0.01652361, -1.338089, -2.463311, 1, 1, 1, 1, 1,
-0.01381933, -0.08225287, -3.53747, 1, 1, 1, 1, 1,
-0.01353796, -1.305866, -0.8903548, 1, 1, 1, 1, 1,
-0.01301994, 0.4965729, -1.58073, 1, 1, 1, 1, 1,
-0.01214445, -1.698429, -3.698877, 1, 1, 1, 1, 1,
-0.01093262, -0.2634143, -3.787398, 0, 0, 1, 1, 1,
-0.01067158, -0.2701661, -4.137733, 1, 0, 0, 1, 1,
-0.01029222, -1.342978, -4.410711, 1, 0, 0, 1, 1,
-0.007538701, 0.4658541, -0.6532321, 1, 0, 0, 1, 1,
0.000618612, -0.1142911, 4.991298, 1, 0, 0, 1, 1,
0.001618921, -0.6142091, 1.183491, 1, 0, 0, 1, 1,
0.007116829, 1.921371, -0.3872278, 0, 0, 0, 1, 1,
0.007343045, 0.2449374, 1.612352, 0, 0, 0, 1, 1,
0.009595111, -1.058584, 1.91687, 0, 0, 0, 1, 1,
0.01250841, -1.170004, 3.886096, 0, 0, 0, 1, 1,
0.01463272, 0.7989845, 0.7659549, 0, 0, 0, 1, 1,
0.01612743, -0.3163558, 4.764923, 0, 0, 0, 1, 1,
0.02188837, 0.9123434, 1.175165, 0, 0, 0, 1, 1,
0.0250751, 0.02775523, 1.137852, 1, 1, 1, 1, 1,
0.02760805, 1.302498, 0.4090215, 1, 1, 1, 1, 1,
0.02844509, -0.284893, 2.311839, 1, 1, 1, 1, 1,
0.02917002, 1.00122, -0.5658007, 1, 1, 1, 1, 1,
0.03137935, 0.4068624, -1.363587, 1, 1, 1, 1, 1,
0.03480492, -0.8440737, 1.806255, 1, 1, 1, 1, 1,
0.03620067, -1.461179, 2.225785, 1, 1, 1, 1, 1,
0.03963878, -0.03549996, 3.071184, 1, 1, 1, 1, 1,
0.04028701, 0.367145, -0.9872077, 1, 1, 1, 1, 1,
0.04037088, 0.05133813, -0.1587121, 1, 1, 1, 1, 1,
0.04086907, 0.9497298, 1.42453, 1, 1, 1, 1, 1,
0.04466708, -0.5525219, 3.599934, 1, 1, 1, 1, 1,
0.04555984, -1.341784, 4.682335, 1, 1, 1, 1, 1,
0.04625145, 0.3368838, 0.4665642, 1, 1, 1, 1, 1,
0.0510616, 0.5954036, 0.3868192, 1, 1, 1, 1, 1,
0.05234227, 0.04005124, -2.385569, 0, 0, 1, 1, 1,
0.05412813, -0.01993411, 1.691551, 1, 0, 0, 1, 1,
0.05479778, 2.056301, -0.5549331, 1, 0, 0, 1, 1,
0.05546471, -0.9045343, 1.966492, 1, 0, 0, 1, 1,
0.05770935, -1.472017, 2.348597, 1, 0, 0, 1, 1,
0.05847904, -1.068582, 3.178796, 1, 0, 0, 1, 1,
0.06047262, -1.289837, 2.520175, 0, 0, 0, 1, 1,
0.06084039, 0.9700358, 1.301794, 0, 0, 0, 1, 1,
0.06269098, 1.487231, 0.1053824, 0, 0, 0, 1, 1,
0.06296611, -0.128731, 2.738343, 0, 0, 0, 1, 1,
0.06438158, 0.2162561, -0.7478577, 0, 0, 0, 1, 1,
0.07256374, 0.3461006, 0.6584427, 0, 0, 0, 1, 1,
0.0748147, -0.4470831, 4.785216, 0, 0, 0, 1, 1,
0.07549869, 0.1540034, 1.575472, 1, 1, 1, 1, 1,
0.07628082, -0.03527779, 2.71899, 1, 1, 1, 1, 1,
0.07955717, 1.504317, 0.9800676, 1, 1, 1, 1, 1,
0.08107833, -0.552127, 3.167632, 1, 1, 1, 1, 1,
0.0837988, -0.1152901, 1.182926, 1, 1, 1, 1, 1,
0.08439326, 0.2761718, -0.2744616, 1, 1, 1, 1, 1,
0.0869104, -0.3203354, 1.518539, 1, 1, 1, 1, 1,
0.09489266, 0.559642, -1.296007, 1, 1, 1, 1, 1,
0.09963625, -1.50298, 3.279782, 1, 1, 1, 1, 1,
0.1008562, 1.751372, 1.143194, 1, 1, 1, 1, 1,
0.1041289, -0.3008454, 0.3936817, 1, 1, 1, 1, 1,
0.1105248, 0.6052107, -1.068098, 1, 1, 1, 1, 1,
0.1109192, 1.453263, -0.5055072, 1, 1, 1, 1, 1,
0.1111776, 0.8109533, 0.3790097, 1, 1, 1, 1, 1,
0.1210061, -0.9915076, 3.280149, 1, 1, 1, 1, 1,
0.1236155, 0.7838246, -0.06820612, 0, 0, 1, 1, 1,
0.1257153, -1.25464, 1.45914, 1, 0, 0, 1, 1,
0.1271254, 0.8142517, -1.93713, 1, 0, 0, 1, 1,
0.1274111, -0.102134, 0.5616847, 1, 0, 0, 1, 1,
0.1322482, -1.664619, 1.462099, 1, 0, 0, 1, 1,
0.135875, 1.200975, -1.640775, 1, 0, 0, 1, 1,
0.1390978, -0.1746235, 3.357683, 0, 0, 0, 1, 1,
0.1427216, 0.1551036, 0.8905165, 0, 0, 0, 1, 1,
0.1443761, 1.488568, -1.882628, 0, 0, 0, 1, 1,
0.1445919, -1.064544, 2.704259, 0, 0, 0, 1, 1,
0.1490483, -0.1685752, 3.432625, 0, 0, 0, 1, 1,
0.1494086, -0.9293304, 3.894024, 0, 0, 0, 1, 1,
0.1498524, 0.1847777, 2.089165, 0, 0, 0, 1, 1,
0.1531571, 1.658672, -0.3825855, 1, 1, 1, 1, 1,
0.1542345, 0.360535, 0.04213741, 1, 1, 1, 1, 1,
0.1542595, 1.396164, -0.2049293, 1, 1, 1, 1, 1,
0.1582517, 0.1167892, -0.3464277, 1, 1, 1, 1, 1,
0.1610882, -0.7702127, 3.046822, 1, 1, 1, 1, 1,
0.164198, 0.328078, 0.1655522, 1, 1, 1, 1, 1,
0.1672401, 0.2805703, 0.0376576, 1, 1, 1, 1, 1,
0.168899, -0.5501918, 2.673666, 1, 1, 1, 1, 1,
0.1709438, -0.9690311, 2.105182, 1, 1, 1, 1, 1,
0.1746896, -0.8258713, 1.937271, 1, 1, 1, 1, 1,
0.1768247, -1.024484, 2.198345, 1, 1, 1, 1, 1,
0.1776493, -0.2198602, 2.276456, 1, 1, 1, 1, 1,
0.1866214, 0.3411956, -0.3946559, 1, 1, 1, 1, 1,
0.1875334, -1.660159, 3.645781, 1, 1, 1, 1, 1,
0.1974584, 0.2082176, 0.99933, 1, 1, 1, 1, 1,
0.2016893, 1.713062, -0.6491325, 0, 0, 1, 1, 1,
0.2046664, 0.6993573, 2.623636, 1, 0, 0, 1, 1,
0.2051961, 0.5155074, -0.1763968, 1, 0, 0, 1, 1,
0.2130659, -0.7661425, 1.194628, 1, 0, 0, 1, 1,
0.2173977, 1.927519, 0.7964374, 1, 0, 0, 1, 1,
0.2281402, 0.3336775, 2.849004, 1, 0, 0, 1, 1,
0.2282677, -0.1428275, 2.320107, 0, 0, 0, 1, 1,
0.2311084, -1.111732, 1.861149, 0, 0, 0, 1, 1,
0.2326559, 0.217392, 0.7838526, 0, 0, 0, 1, 1,
0.233311, -1.599884, 2.773067, 0, 0, 0, 1, 1,
0.2345036, -2.720871, 2.66348, 0, 0, 0, 1, 1,
0.2353173, 0.4009326, 0.5757883, 0, 0, 0, 1, 1,
0.2368616, -0.622058, 1.938792, 0, 0, 0, 1, 1,
0.2373928, 0.7168341, 0.720134, 1, 1, 1, 1, 1,
0.2388467, 0.2141708, 0.1817475, 1, 1, 1, 1, 1,
0.2410671, -0.2680734, 1.8311, 1, 1, 1, 1, 1,
0.2440958, -0.769136, 3.86749, 1, 1, 1, 1, 1,
0.2459187, 0.3699091, 1.725163, 1, 1, 1, 1, 1,
0.2475828, 1.395307, 1.384628, 1, 1, 1, 1, 1,
0.247872, 0.2339583, 1.305526, 1, 1, 1, 1, 1,
0.2496438, 0.2209756, -0.9559402, 1, 1, 1, 1, 1,
0.2519583, 0.9102972, 0.5669629, 1, 1, 1, 1, 1,
0.2525115, -0.7307008, 2.494934, 1, 1, 1, 1, 1,
0.2558035, -2.008114, 3.484929, 1, 1, 1, 1, 1,
0.25635, -1.201701, 2.146478, 1, 1, 1, 1, 1,
0.2647119, -1.386391, 3.291376, 1, 1, 1, 1, 1,
0.2658397, -1.233119, 1.73518, 1, 1, 1, 1, 1,
0.2674115, 0.3664559, -0.5080881, 1, 1, 1, 1, 1,
0.2705549, 0.294368, 1.978281, 0, 0, 1, 1, 1,
0.2797401, -0.05880872, 3.034031, 1, 0, 0, 1, 1,
0.2810341, 1.592207, -0.4368709, 1, 0, 0, 1, 1,
0.2823624, -2.392606, 2.164495, 1, 0, 0, 1, 1,
0.2839967, -1.261295, 1.733539, 1, 0, 0, 1, 1,
0.284526, 0.3897645, 1.704417, 1, 0, 0, 1, 1,
0.2912307, 0.2069438, -0.1656691, 0, 0, 0, 1, 1,
0.2951671, -0.3963991, 1.917727, 0, 0, 0, 1, 1,
0.296132, 0.2548839, -0.09012575, 0, 0, 0, 1, 1,
0.3009105, -0.6176273, 1.106612, 0, 0, 0, 1, 1,
0.3021647, -3.551914, 2.668983, 0, 0, 0, 1, 1,
0.3022607, -1.258051, 2.077326, 0, 0, 0, 1, 1,
0.3023167, -2.906069, 5.045132, 0, 0, 0, 1, 1,
0.3065875, -0.6907596, 1.662684, 1, 1, 1, 1, 1,
0.3072501, -1.247243, 2.50945, 1, 1, 1, 1, 1,
0.3078776, -0.1088737, 0.970287, 1, 1, 1, 1, 1,
0.3082524, -0.1358683, 2.206511, 1, 1, 1, 1, 1,
0.3087626, -1.895316, 3.60776, 1, 1, 1, 1, 1,
0.3097015, -0.1324279, 3.203006, 1, 1, 1, 1, 1,
0.313972, 0.0374038, 2.30374, 1, 1, 1, 1, 1,
0.3170207, 1.256252, -0.4482112, 1, 1, 1, 1, 1,
0.3204916, 0.5204004, 0.5202858, 1, 1, 1, 1, 1,
0.3255612, -0.3554492, 4.158173, 1, 1, 1, 1, 1,
0.3257776, 1.936056, 0.4833592, 1, 1, 1, 1, 1,
0.3294843, -0.9086609, 4.036821, 1, 1, 1, 1, 1,
0.3380545, 1.516405, 0.3779005, 1, 1, 1, 1, 1,
0.3387973, -0.7424199, 1.698531, 1, 1, 1, 1, 1,
0.3442154, -0.1078865, 1.474913, 1, 1, 1, 1, 1,
0.3472576, 1.264646, 1.402564, 0, 0, 1, 1, 1,
0.3733549, -0.394193, 2.421042, 1, 0, 0, 1, 1,
0.379029, -0.07763745, 3.021822, 1, 0, 0, 1, 1,
0.3817469, -0.5180359, 0.8989261, 1, 0, 0, 1, 1,
0.3886125, -1.415098, 3.275592, 1, 0, 0, 1, 1,
0.3913047, -0.1326984, 2.099163, 1, 0, 0, 1, 1,
0.396846, -0.8325201, 2.974346, 0, 0, 0, 1, 1,
0.3968635, -0.4042831, 2.403931, 0, 0, 0, 1, 1,
0.3974548, -1.168367, 3.032783, 0, 0, 0, 1, 1,
0.3980041, -0.5179538, 2.442492, 0, 0, 0, 1, 1,
0.3982521, -0.6130573, 0.8912526, 0, 0, 0, 1, 1,
0.3992214, 0.2593451, 1.205556, 0, 0, 0, 1, 1,
0.4025622, 1.389234, -0.6603698, 0, 0, 0, 1, 1,
0.4109021, -0.4972142, 2.337171, 1, 1, 1, 1, 1,
0.4117409, 0.5252757, -0.05510343, 1, 1, 1, 1, 1,
0.4130653, -0.8128383, 3.882224, 1, 1, 1, 1, 1,
0.4132163, -0.1758814, 1.613833, 1, 1, 1, 1, 1,
0.4144882, 0.2788863, 2.37385, 1, 1, 1, 1, 1,
0.4204087, 0.08890079, 1.749197, 1, 1, 1, 1, 1,
0.4204971, 0.09347715, 1.288303, 1, 1, 1, 1, 1,
0.4220928, 0.09444869, 1.785951, 1, 1, 1, 1, 1,
0.4232653, 0.5464082, 1.984346, 1, 1, 1, 1, 1,
0.4248431, 1.132212, 0.1510243, 1, 1, 1, 1, 1,
0.4285634, -1.540663, 4.434994, 1, 1, 1, 1, 1,
0.4291593, -1.625831, 2.965547, 1, 1, 1, 1, 1,
0.4304547, 0.629764, 0.286735, 1, 1, 1, 1, 1,
0.433744, -0.8924056, 0.5611136, 1, 1, 1, 1, 1,
0.4383549, 0.8480103, 1.454846, 1, 1, 1, 1, 1,
0.4386676, 0.09501181, 1.474961, 0, 0, 1, 1, 1,
0.4458466, 0.5845408, -0.2582434, 1, 0, 0, 1, 1,
0.4458674, 0.03986735, 1.32053, 1, 0, 0, 1, 1,
0.4488053, -0.8127934, 3.643291, 1, 0, 0, 1, 1,
0.4506952, 1.162401, 1.462402, 1, 0, 0, 1, 1,
0.4522033, -1.814241, 3.356387, 1, 0, 0, 1, 1,
0.4527379, -0.02254592, 0.7262446, 0, 0, 0, 1, 1,
0.4534542, 1.812448, 0.9945189, 0, 0, 0, 1, 1,
0.4576332, -0.3063287, -0.2562119, 0, 0, 0, 1, 1,
0.4614565, 0.5473891, 1.306183, 0, 0, 0, 1, 1,
0.4614991, -0.7109435, 2.464978, 0, 0, 0, 1, 1,
0.4662684, 0.70209, 0.3878569, 0, 0, 0, 1, 1,
0.4665591, -1.802355, 0.4642067, 0, 0, 0, 1, 1,
0.4687287, 0.006241701, 2.733178, 1, 1, 1, 1, 1,
0.4734093, -0.6929531, 2.177465, 1, 1, 1, 1, 1,
0.4781125, 0.0982696, 0.337133, 1, 1, 1, 1, 1,
0.4840297, -0.2591211, 0.8749999, 1, 1, 1, 1, 1,
0.4877956, -2.532118, 3.823803, 1, 1, 1, 1, 1,
0.4936567, 0.2623436, 2.140789, 1, 1, 1, 1, 1,
0.496562, -1.705079, 0.104739, 1, 1, 1, 1, 1,
0.4981894, -2.109282, 3.33438, 1, 1, 1, 1, 1,
0.5095419, 0.5084127, 1.190749, 1, 1, 1, 1, 1,
0.5122395, -0.2854715, 1.833494, 1, 1, 1, 1, 1,
0.516097, -1.849185, 5.053774, 1, 1, 1, 1, 1,
0.5241212, 0.6962473, 0.1880855, 1, 1, 1, 1, 1,
0.530497, 0.6211924, 0.8924717, 1, 1, 1, 1, 1,
0.5364954, -0.4503335, 3.657447, 1, 1, 1, 1, 1,
0.5371657, 0.1425118, 1.860982, 1, 1, 1, 1, 1,
0.5377179, -0.5649662, 2.740266, 0, 0, 1, 1, 1,
0.5404329, 0.6987939, 0.2779821, 1, 0, 0, 1, 1,
0.5409446, 1.533248, 0.9124432, 1, 0, 0, 1, 1,
0.5439278, -0.9003452, 1.490796, 1, 0, 0, 1, 1,
0.5464489, 0.2963355, -0.4062973, 1, 0, 0, 1, 1,
0.5468745, 1.378315, 0.6875669, 1, 0, 0, 1, 1,
0.5540674, 0.2110251, 1.923031, 0, 0, 0, 1, 1,
0.5564889, -0.2985537, 1.338992, 0, 0, 0, 1, 1,
0.5600772, 0.1374816, 0.8608087, 0, 0, 0, 1, 1,
0.5608078, -1.175604, 2.520127, 0, 0, 0, 1, 1,
0.5620059, 0.9302858, -0.02785327, 0, 0, 0, 1, 1,
0.5645313, -0.3794607, 3.489316, 0, 0, 0, 1, 1,
0.5682265, 0.3621297, 1.331479, 0, 0, 0, 1, 1,
0.5722361, -3.021224, 3.27282, 1, 1, 1, 1, 1,
0.5724025, -1.626355, 2.981516, 1, 1, 1, 1, 1,
0.5742348, 0.7605981, 1.55631, 1, 1, 1, 1, 1,
0.5747488, 0.9263884, -0.2818679, 1, 1, 1, 1, 1,
0.5760775, -1.424641, 3.388253, 1, 1, 1, 1, 1,
0.5772088, -0.03722356, 0.9329187, 1, 1, 1, 1, 1,
0.5816829, 0.6783275, 0.1110052, 1, 1, 1, 1, 1,
0.5833726, -0.1431943, 1.53761, 1, 1, 1, 1, 1,
0.5876393, -1.20355, 3.914462, 1, 1, 1, 1, 1,
0.5896502, -0.2204161, 0.8240755, 1, 1, 1, 1, 1,
0.5940617, -0.544037, 2.167238, 1, 1, 1, 1, 1,
0.6007381, 0.5274579, 2.838672, 1, 1, 1, 1, 1,
0.6051388, 0.753392, 0.4987327, 1, 1, 1, 1, 1,
0.6066509, 0.1420941, 1.443611, 1, 1, 1, 1, 1,
0.6105044, 0.1807143, 1.12922, 1, 1, 1, 1, 1,
0.615007, 0.4468493, 0.5285551, 0, 0, 1, 1, 1,
0.6153756, 0.26932, 0.8554032, 1, 0, 0, 1, 1,
0.6166935, 1.201414, -0.2969208, 1, 0, 0, 1, 1,
0.6205093, 0.1469746, 1.33883, 1, 0, 0, 1, 1,
0.6268805, -0.04002205, 2.255077, 1, 0, 0, 1, 1,
0.6277087, 0.7043007, -0.3455513, 1, 0, 0, 1, 1,
0.6289262, 1.276935, 1.816827, 0, 0, 0, 1, 1,
0.6292617, 0.2260096, 0.08049396, 0, 0, 0, 1, 1,
0.6315746, 0.5765702, -0.2367794, 0, 0, 0, 1, 1,
0.6353983, -1.500886, 2.897739, 0, 0, 0, 1, 1,
0.6408485, -0.404308, 2.413975, 0, 0, 0, 1, 1,
0.6428055, 0.2844936, 1.711249, 0, 0, 0, 1, 1,
0.6428967, -1.053418, 2.489136, 0, 0, 0, 1, 1,
0.6439824, 1.009872, 1.591086, 1, 1, 1, 1, 1,
0.6440414, 0.4561386, 1.590268, 1, 1, 1, 1, 1,
0.6445934, -0.8918816, 1.7773, 1, 1, 1, 1, 1,
0.6452497, 0.1916252, 1.550393, 1, 1, 1, 1, 1,
0.6480485, -0.8645657, 2.591106, 1, 1, 1, 1, 1,
0.6482576, -0.3814924, 1.971192, 1, 1, 1, 1, 1,
0.651057, 0.2093201, 0.83083, 1, 1, 1, 1, 1,
0.6517562, -0.6038237, 2.992577, 1, 1, 1, 1, 1,
0.6584666, -0.2307217, 2.072186, 1, 1, 1, 1, 1,
0.6606869, 0.5562541, 1.316149, 1, 1, 1, 1, 1,
0.6619656, -1.003257, 2.07649, 1, 1, 1, 1, 1,
0.6663904, 0.636548, 1.113487, 1, 1, 1, 1, 1,
0.6670632, 0.9068838, 0.3895087, 1, 1, 1, 1, 1,
0.6704212, 0.3650457, 1.703742, 1, 1, 1, 1, 1,
0.6735269, 1.282048, 1.841625, 1, 1, 1, 1, 1,
0.6752825, 0.8245207, -0.6758254, 0, 0, 1, 1, 1,
0.6759821, -0.2782331, 2.506379, 1, 0, 0, 1, 1,
0.6815825, -0.9819784, 2.016322, 1, 0, 0, 1, 1,
0.6928989, -0.7443947, 2.008384, 1, 0, 0, 1, 1,
0.6951037, -1.831777, 2.29834, 1, 0, 0, 1, 1,
0.6953173, -0.3213746, 3.350678, 1, 0, 0, 1, 1,
0.6960456, 1.192692, 0.2376746, 0, 0, 0, 1, 1,
0.6989088, 0.9650465, -0.3966513, 0, 0, 0, 1, 1,
0.7067162, 1.914238, 0.394162, 0, 0, 0, 1, 1,
0.7108351, -0.5415315, 1.279865, 0, 0, 0, 1, 1,
0.7133859, 1.23238, 0.7982005, 0, 0, 0, 1, 1,
0.7166991, 0.2476149, 1.486101, 0, 0, 0, 1, 1,
0.7174746, 1.185215, 2.091224, 0, 0, 0, 1, 1,
0.7179813, 0.1866165, 2.035472, 1, 1, 1, 1, 1,
0.7185435, 3.185567, 0.4053308, 1, 1, 1, 1, 1,
0.7197304, -0.331875, 2.777321, 1, 1, 1, 1, 1,
0.7364618, -0.8738323, 4.159986, 1, 1, 1, 1, 1,
0.7407914, -0.9232202, 3.420383, 1, 1, 1, 1, 1,
0.7452877, 0.08869573, 2.02196, 1, 1, 1, 1, 1,
0.7469105, 0.04284031, 1.081421, 1, 1, 1, 1, 1,
0.7562531, -0.1397949, 0.851647, 1, 1, 1, 1, 1,
0.7576969, -0.05684619, 0.2679935, 1, 1, 1, 1, 1,
0.7616668, -0.1416872, 2.140854, 1, 1, 1, 1, 1,
0.7645256, 0.8570817, 0.4631943, 1, 1, 1, 1, 1,
0.7649522, 0.7351065, 1.040658, 1, 1, 1, 1, 1,
0.7674556, 0.5419327, 0.7210014, 1, 1, 1, 1, 1,
0.7691243, -0.6637235, 4.167723, 1, 1, 1, 1, 1,
0.7726085, -0.8157793, 3.882631, 1, 1, 1, 1, 1,
0.7746037, -1.23929, 2.560693, 0, 0, 1, 1, 1,
0.7800572, 0.3914366, 2.704769, 1, 0, 0, 1, 1,
0.7838083, 3.009406, 1.746039, 1, 0, 0, 1, 1,
0.7872164, 0.817228, 0.5675691, 1, 0, 0, 1, 1,
0.7895465, 0.7149077, 0.2843518, 1, 0, 0, 1, 1,
0.7896052, 0.2498859, 0.1097399, 1, 0, 0, 1, 1,
0.7926296, -0.6401655, 2.384158, 0, 0, 0, 1, 1,
0.7937298, 0.7480818, 0.9604928, 0, 0, 0, 1, 1,
0.8013293, -0.9989127, 3.440563, 0, 0, 0, 1, 1,
0.8040658, 0.1299129, 0.3351249, 0, 0, 0, 1, 1,
0.8046805, -0.7223371, 1.385198, 0, 0, 0, 1, 1,
0.8050156, -1.369859, 3.227325, 0, 0, 0, 1, 1,
0.8086437, 0.2010724, 1.46734, 0, 0, 0, 1, 1,
0.8126457, 1.079048, 1.322401, 1, 1, 1, 1, 1,
0.8167812, -1.011462, 3.246415, 1, 1, 1, 1, 1,
0.8303865, -0.5814933, 0.9323745, 1, 1, 1, 1, 1,
0.8396475, 0.4821716, 2.495495, 1, 1, 1, 1, 1,
0.8433527, -1.216377, 2.297258, 1, 1, 1, 1, 1,
0.8494539, 0.1522578, 1.961577, 1, 1, 1, 1, 1,
0.8513304, -1.796827, 4.532481, 1, 1, 1, 1, 1,
0.8554497, -1.27487, 2.177246, 1, 1, 1, 1, 1,
0.8683519, 0.5487285, 3.056182, 1, 1, 1, 1, 1,
0.8691745, -0.5539789, 2.335758, 1, 1, 1, 1, 1,
0.8705998, -0.827171, 0.9974292, 1, 1, 1, 1, 1,
0.8779047, 0.4124638, 0.6731675, 1, 1, 1, 1, 1,
0.8857982, 1.0949, 0.6542587, 1, 1, 1, 1, 1,
0.8907946, -0.6391241, 1.500471, 1, 1, 1, 1, 1,
0.8935627, -0.791268, 3.7104, 1, 1, 1, 1, 1,
0.8961716, -0.003822678, -0.3742622, 0, 0, 1, 1, 1,
0.9015625, 0.7244407, 3.203137, 1, 0, 0, 1, 1,
0.9016355, 0.1773087, 0.9296103, 1, 0, 0, 1, 1,
0.9044026, 0.2491005, 1.074821, 1, 0, 0, 1, 1,
0.9044681, 0.3314054, 2.612554, 1, 0, 0, 1, 1,
0.9116656, -0.7909414, 0.306998, 1, 0, 0, 1, 1,
0.9177319, -1.962164, 1.466492, 0, 0, 0, 1, 1,
0.9184087, 0.1707277, 0.3901328, 0, 0, 0, 1, 1,
0.9200222, -0.3370934, 2.96328, 0, 0, 0, 1, 1,
0.9228033, -1.115054, 3.093602, 0, 0, 0, 1, 1,
0.9250358, 0.8550777, -0.3142453, 0, 0, 0, 1, 1,
0.927049, -1.94095, 3.84073, 0, 0, 0, 1, 1,
0.9280535, 0.4343064, 1.278973, 0, 0, 0, 1, 1,
0.9296574, -0.6365179, 2.81878, 1, 1, 1, 1, 1,
0.9317684, 0.2780313, 1.80457, 1, 1, 1, 1, 1,
0.9404489, 0.8108315, 3.186731, 1, 1, 1, 1, 1,
0.9428594, -0.3422108, 2.929061, 1, 1, 1, 1, 1,
0.9483847, 0.5681491, 0.1618711, 1, 1, 1, 1, 1,
0.9504689, -0.006857489, 3.706077, 1, 1, 1, 1, 1,
0.9599854, 0.8772057, 1.295419, 1, 1, 1, 1, 1,
0.968574, 0.06805101, 0.9215304, 1, 1, 1, 1, 1,
0.9724384, 1.815008, 3.200019, 1, 1, 1, 1, 1,
0.9736457, 1.36361, -0.02619477, 1, 1, 1, 1, 1,
0.9756415, -0.5469601, 1.95123, 1, 1, 1, 1, 1,
0.9760615, 0.5832027, 1.250767, 1, 1, 1, 1, 1,
0.9788469, -0.6308957, 0.7883195, 1, 1, 1, 1, 1,
0.9788699, 0.3933588, 0.875435, 1, 1, 1, 1, 1,
0.9815442, 2.526847, -0.3949652, 1, 1, 1, 1, 1,
0.9828463, 0.036835, 0.8693348, 0, 0, 1, 1, 1,
0.9830359, 0.3129638, 2.880308, 1, 0, 0, 1, 1,
0.9833131, 0.821744, 1.038543, 1, 0, 0, 1, 1,
0.9846753, -1.737331, 2.223982, 1, 0, 0, 1, 1,
0.9862692, -1.008281, 4.128279, 1, 0, 0, 1, 1,
0.9863266, 0.3850737, 0.5573541, 1, 0, 0, 1, 1,
0.9904069, 1.1618, -0.1495608, 0, 0, 0, 1, 1,
0.9911038, -1.892769, 2.898767, 0, 0, 0, 1, 1,
0.9924099, -0.07947002, 1.938179, 0, 0, 0, 1, 1,
0.9959725, -0.3716229, 1.780854, 0, 0, 0, 1, 1,
1.001305, -0.4966732, 1.137726, 0, 0, 0, 1, 1,
1.003492, -0.3563145, -1.180401, 0, 0, 0, 1, 1,
1.006499, -0.3540993, 1.846226, 0, 0, 0, 1, 1,
1.013407, -0.7084433, 1.314387, 1, 1, 1, 1, 1,
1.016003, -0.3907063, 1.669414, 1, 1, 1, 1, 1,
1.023012, 1.252408, 2.142357, 1, 1, 1, 1, 1,
1.029077, 0.4107313, 1.329876, 1, 1, 1, 1, 1,
1.034086, -1.272412, 2.776352, 1, 1, 1, 1, 1,
1.045622, -0.3487609, 2.522279, 1, 1, 1, 1, 1,
1.046193, -1.498052, 3.107635, 1, 1, 1, 1, 1,
1.047033, 0.1028187, 0.8074615, 1, 1, 1, 1, 1,
1.058207, -1.061801, 2.352561, 1, 1, 1, 1, 1,
1.06, -0.4807009, 0.8459404, 1, 1, 1, 1, 1,
1.065146, -1.747738, 2.919151, 1, 1, 1, 1, 1,
1.066469, -1.143068, 1.801117, 1, 1, 1, 1, 1,
1.071082, 0.7691994, 1.924746, 1, 1, 1, 1, 1,
1.073676, -0.9471579, 1.552814, 1, 1, 1, 1, 1,
1.077646, -0.02999922, 1.554844, 1, 1, 1, 1, 1,
1.078404, -1.655516, 1.047195, 0, 0, 1, 1, 1,
1.078632, 1.576265, 0.1195552, 1, 0, 0, 1, 1,
1.094563, 0.6074228, 0.5242946, 1, 0, 0, 1, 1,
1.098245, -0.9063495, 1.971944, 1, 0, 0, 1, 1,
1.102187, 0.3102197, 1.04291, 1, 0, 0, 1, 1,
1.108831, 0.3725685, 0.7447178, 1, 0, 0, 1, 1,
1.122498, 0.8962843, -0.4422991, 0, 0, 0, 1, 1,
1.125165, 0.1631075, 1.729424, 0, 0, 0, 1, 1,
1.125552, 1.175727, 0.6922899, 0, 0, 0, 1, 1,
1.126809, -0.01056172, 1.263932, 0, 0, 0, 1, 1,
1.130533, 0.2214478, 2.277977, 0, 0, 0, 1, 1,
1.148253, -1.326627, 3.189174, 0, 0, 0, 1, 1,
1.152316, -0.7394526, 2.22166, 0, 0, 0, 1, 1,
1.165247, -0.3039119, 2.378586, 1, 1, 1, 1, 1,
1.167831, 0.718767, 2.199883, 1, 1, 1, 1, 1,
1.168973, -0.02984514, 2.391357, 1, 1, 1, 1, 1,
1.172155, 0.9316658, 0.6864879, 1, 1, 1, 1, 1,
1.175681, -2.666416, 1.994518, 1, 1, 1, 1, 1,
1.190364, -0.7014961, 1.381294, 1, 1, 1, 1, 1,
1.191542, -0.2379401, 1.011288, 1, 1, 1, 1, 1,
1.194189, -1.775116, 1.763693, 1, 1, 1, 1, 1,
1.19438, -1.04564, 1.093562, 1, 1, 1, 1, 1,
1.195192, -0.2138375, 0.6212186, 1, 1, 1, 1, 1,
1.197182, 0.1448545, 0.4012925, 1, 1, 1, 1, 1,
1.198649, -1.27145, 3.195456, 1, 1, 1, 1, 1,
1.19878, -0.2888735, -0.1063706, 1, 1, 1, 1, 1,
1.21046, 0.6916374, 1.496296, 1, 1, 1, 1, 1,
1.216026, 0.8270798, 1.217333, 1, 1, 1, 1, 1,
1.217414, -0.6993214, 1.813048, 0, 0, 1, 1, 1,
1.228111, -0.2787289, 1.287271, 1, 0, 0, 1, 1,
1.228743, 0.2861822, 2.288953, 1, 0, 0, 1, 1,
1.241019, 0.404337, 2.956858, 1, 0, 0, 1, 1,
1.241221, -1.246829, 3.42361, 1, 0, 0, 1, 1,
1.244559, -5.348355e-06, 0.7224149, 1, 0, 0, 1, 1,
1.248089, -0.06781593, 2.532759, 0, 0, 0, 1, 1,
1.250296, -1.435987, 3.902739, 0, 0, 0, 1, 1,
1.254585, 0.8974491, -0.4130628, 0, 0, 0, 1, 1,
1.260609, 0.3227722, -0.1226617, 0, 0, 0, 1, 1,
1.263835, -0.03909232, 1.571585, 0, 0, 0, 1, 1,
1.266878, 1.389139, 0.5167149, 0, 0, 0, 1, 1,
1.267634, 1.487705, -0.8772057, 0, 0, 0, 1, 1,
1.269887, -0.4812872, 2.237259, 1, 1, 1, 1, 1,
1.281183, -0.1044474, 1.186396, 1, 1, 1, 1, 1,
1.297182, -0.2209712, 1.06159, 1, 1, 1, 1, 1,
1.317671, 0.2348328, 1.497107, 1, 1, 1, 1, 1,
1.319759, 1.155373, -0.1339569, 1, 1, 1, 1, 1,
1.321408, -1.159166, 2.111806, 1, 1, 1, 1, 1,
1.331598, -0.1389377, 0.918331, 1, 1, 1, 1, 1,
1.343617, 1.090949, 0.7374331, 1, 1, 1, 1, 1,
1.344612, -0.6376071, 3.315406, 1, 1, 1, 1, 1,
1.352856, -0.08152411, 1.337101, 1, 1, 1, 1, 1,
1.372313, 0.2854685, 0.06811851, 1, 1, 1, 1, 1,
1.385527, 0.5640503, 1.294652, 1, 1, 1, 1, 1,
1.385897, -0.1920256, 2.317978, 1, 1, 1, 1, 1,
1.403521, 1.47694, -0.414341, 1, 1, 1, 1, 1,
1.409662, 1.17219, -0.8584366, 1, 1, 1, 1, 1,
1.412919, -1.180353, 2.437777, 0, 0, 1, 1, 1,
1.413993, 0.04861774, 2.056446, 1, 0, 0, 1, 1,
1.415126, 0.3464988, 0.5992224, 1, 0, 0, 1, 1,
1.416693, 1.425979, 2.14615, 1, 0, 0, 1, 1,
1.419581, -1.319491, 2.760952, 1, 0, 0, 1, 1,
1.421614, 2.048084, 1.398525, 1, 0, 0, 1, 1,
1.421879, 0.3555377, 0.839439, 0, 0, 0, 1, 1,
1.423798, 0.9677577, 1.246595, 0, 0, 0, 1, 1,
1.424992, -0.03513201, 0.20455, 0, 0, 0, 1, 1,
1.447559, 0.1735476, 0.3923759, 0, 0, 0, 1, 1,
1.448649, -0.6824583, 2.7556, 0, 0, 0, 1, 1,
1.462946, -0.4527394, 1.302535, 0, 0, 0, 1, 1,
1.474793, 0.06625441, 1.345037, 0, 0, 0, 1, 1,
1.490888, 0.6482836, 1.141127, 1, 1, 1, 1, 1,
1.503173, -0.9605322, 1.514799, 1, 1, 1, 1, 1,
1.512264, 0.550209, 2.418661, 1, 1, 1, 1, 1,
1.513645, 1.224391, 0.158254, 1, 1, 1, 1, 1,
1.541719, -0.6983091, 2.185977, 1, 1, 1, 1, 1,
1.559255, 1.391134, 0.6560847, 1, 1, 1, 1, 1,
1.584611, -1.080012, 3.76964, 1, 1, 1, 1, 1,
1.605552, -0.6040213, 2.160569, 1, 1, 1, 1, 1,
1.608627, 0.1662508, 0.4604305, 1, 1, 1, 1, 1,
1.612333, 0.3130205, 0.8395488, 1, 1, 1, 1, 1,
1.616288, -0.849579, 2.910659, 1, 1, 1, 1, 1,
1.622009, -2.148815, 2.681427, 1, 1, 1, 1, 1,
1.629872, -0.1035647, 1.507302, 1, 1, 1, 1, 1,
1.648849, 0.1240243, 0.7229702, 1, 1, 1, 1, 1,
1.652167, -1.042067, 0.551998, 1, 1, 1, 1, 1,
1.659358, 0.6093617, 1.045528, 0, 0, 1, 1, 1,
1.667246, -0.9595126, 2.211272, 1, 0, 0, 1, 1,
1.675783, 1.26009, 0.1339578, 1, 0, 0, 1, 1,
1.687621, -1.212504, 2.081258, 1, 0, 0, 1, 1,
1.691389, 1.596244, 1.66852, 1, 0, 0, 1, 1,
1.704708, -0.1533244, 0.1430659, 1, 0, 0, 1, 1,
1.708802, -1.066125, 1.633361, 0, 0, 0, 1, 1,
1.722849, -2.145649, 3.026035, 0, 0, 0, 1, 1,
1.736915, 0.3839851, -0.4999397, 0, 0, 0, 1, 1,
1.737465, -0.4700138, 2.701968, 0, 0, 0, 1, 1,
1.739626, 0.2536073, 1.529731, 0, 0, 0, 1, 1,
1.743113, -0.680321, 1.701928, 0, 0, 0, 1, 1,
1.744985, -0.3685906, 1.945465, 0, 0, 0, 1, 1,
1.749979, 0.7796752, 1.378207, 1, 1, 1, 1, 1,
1.752513, -1.299829, 1.701525, 1, 1, 1, 1, 1,
1.760738, 1.494928, 0.659978, 1, 1, 1, 1, 1,
1.775157, 1.128303, 2.017477, 1, 1, 1, 1, 1,
1.826548, 0.9297184, 2.856397, 1, 1, 1, 1, 1,
1.838199, 2.399032, 1.359915, 1, 1, 1, 1, 1,
1.86533, -2.50736, 4.390802, 1, 1, 1, 1, 1,
1.871399, -0.5877973, 0.8342804, 1, 1, 1, 1, 1,
1.88124, 1.596012, 0.8382251, 1, 1, 1, 1, 1,
1.891654, 1.467182, 1.874789, 1, 1, 1, 1, 1,
1.895981, 1.295765, 2.338527, 1, 1, 1, 1, 1,
1.906168, -0.06720803, 0.5499146, 1, 1, 1, 1, 1,
1.91718, -1.857906, 3.33436, 1, 1, 1, 1, 1,
1.921914, -2.806502, 0.6460369, 1, 1, 1, 1, 1,
1.935257, 0.2835905, 2.067271, 1, 1, 1, 1, 1,
1.93768, -1.593039, 3.820119, 0, 0, 1, 1, 1,
1.942301, 0.1011497, 2.37448, 1, 0, 0, 1, 1,
1.943795, 0.5733396, 0.4815288, 1, 0, 0, 1, 1,
1.986901, -0.603821, 1.347787, 1, 0, 0, 1, 1,
1.998527, -0.6207719, 1.312893, 1, 0, 0, 1, 1,
2.083973, 0.8582005, 0.9277628, 1, 0, 0, 1, 1,
2.086286, -1.61888, 2.056917, 0, 0, 0, 1, 1,
2.101468, -0.1349644, 0.2510087, 0, 0, 0, 1, 1,
2.117843, 0.8529607, -0.3913783, 0, 0, 0, 1, 1,
2.118885, 0.9677169, 0.8195711, 0, 0, 0, 1, 1,
2.24076, 1.719247, 0.8930354, 0, 0, 0, 1, 1,
2.284435, 1.248934, 2.013123, 0, 0, 0, 1, 1,
2.29226, 0.1697809, 3.100788, 0, 0, 0, 1, 1,
2.297729, -0.3625207, 0.848047, 1, 1, 1, 1, 1,
2.416795, 0.2396828, 1.799926, 1, 1, 1, 1, 1,
2.48629, -0.2659271, 2.340476, 1, 1, 1, 1, 1,
2.797387, 0.1266263, -0.2761753, 1, 1, 1, 1, 1,
2.821992, -0.6077715, 1.057443, 1, 1, 1, 1, 1,
3.076379, -0.5617551, 3.504807, 1, 1, 1, 1, 1,
3.216703, -0.5658948, 2.95848, 1, 1, 1, 1, 1
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
var radius = 9.656261;
var distance = 33.91721;
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
mvMatrix.translate( -0.02154803, -0.1180887, 0.08238029 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.91721);
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
