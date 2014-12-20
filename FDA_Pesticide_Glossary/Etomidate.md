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
-3.271116, -2.313596, -1.073584, 1, 0, 0, 1,
-3.09059, 1.153936, -2.640466, 1, 0.007843138, 0, 1,
-2.756876, 0.2856493, -0.8767655, 1, 0.01176471, 0, 1,
-2.725006, 0.9166615, -0.07806413, 1, 0.01960784, 0, 1,
-2.609673, 0.2345873, -2.375725, 1, 0.02352941, 0, 1,
-2.595625, -1.023571, -3.194915, 1, 0.03137255, 0, 1,
-2.507919, -1.700317, -1.307523, 1, 0.03529412, 0, 1,
-2.504492, 1.054047, -0.6203694, 1, 0.04313726, 0, 1,
-2.456159, 0.9623886, -1.117531, 1, 0.04705882, 0, 1,
-2.431311, 0.2079232, -1.2357, 1, 0.05490196, 0, 1,
-2.419228, 1.635167, -1.035389, 1, 0.05882353, 0, 1,
-2.370887, -0.1488127, -0.8483395, 1, 0.06666667, 0, 1,
-2.34212, -0.5338277, -2.167333, 1, 0.07058824, 0, 1,
-2.331572, -1.148165, -1.374146, 1, 0.07843138, 0, 1,
-2.306225, -0.3791912, -3.254701, 1, 0.08235294, 0, 1,
-2.303221, 1.681967, -0.6906746, 1, 0.09019608, 0, 1,
-2.302802, -1.880193, -2.085601, 1, 0.09411765, 0, 1,
-2.231076, 0.4652548, -2.3877, 1, 0.1019608, 0, 1,
-2.224469, 0.1650331, -1.126033, 1, 0.1098039, 0, 1,
-2.220758, 0.4881712, -1.025911, 1, 0.1137255, 0, 1,
-2.214347, 1.431725, -0.8188772, 1, 0.1215686, 0, 1,
-2.197587, -0.02172712, -1.263384, 1, 0.1254902, 0, 1,
-2.15721, -0.6869044, -3.304169, 1, 0.1333333, 0, 1,
-2.111653, -0.8741977, -0.9420154, 1, 0.1372549, 0, 1,
-2.088091, -0.516251, -4.077644, 1, 0.145098, 0, 1,
-2.073506, -0.0984194, -0.9476383, 1, 0.1490196, 0, 1,
-2.04717, -0.6484454, -2.399717, 1, 0.1568628, 0, 1,
-2.036414, -0.4596142, -0.6273072, 1, 0.1607843, 0, 1,
-2.024602, 0.9838015, -2.481855, 1, 0.1686275, 0, 1,
-2.003092, -1.393046, -2.217741, 1, 0.172549, 0, 1,
-1.975976, 1.515475, -0.9070852, 1, 0.1803922, 0, 1,
-1.955348, -0.2379394, -1.646087, 1, 0.1843137, 0, 1,
-1.93807, -0.9842987, -1.307905, 1, 0.1921569, 0, 1,
-1.92523, -0.9246863, -1.361975, 1, 0.1960784, 0, 1,
-1.910844, -0.3975609, -1.578178, 1, 0.2039216, 0, 1,
-1.896545, -1.040331, -2.258183, 1, 0.2117647, 0, 1,
-1.889599, -1.122722, -1.333623, 1, 0.2156863, 0, 1,
-1.873247, 0.5906145, -1.467205, 1, 0.2235294, 0, 1,
-1.847515, 1.17777, -0.8996047, 1, 0.227451, 0, 1,
-1.832014, -0.2437333, -2.407703, 1, 0.2352941, 0, 1,
-1.828383, 0.7948449, 0.4384818, 1, 0.2392157, 0, 1,
-1.82252, -0.3973998, -0.9605768, 1, 0.2470588, 0, 1,
-1.817186, -0.7808138, -1.883727, 1, 0.2509804, 0, 1,
-1.816871, -0.06114852, -0.2253158, 1, 0.2588235, 0, 1,
-1.811484, -1.173823, -1.737471, 1, 0.2627451, 0, 1,
-1.797404, 1.645933, -1.755724, 1, 0.2705882, 0, 1,
-1.79326, 0.8231359, -1.008615, 1, 0.2745098, 0, 1,
-1.7775, -0.2628762, -3.270561, 1, 0.282353, 0, 1,
-1.767752, -1.156132, -2.103845, 1, 0.2862745, 0, 1,
-1.76592, -0.9550103, -2.986659, 1, 0.2941177, 0, 1,
-1.765869, -1.282814, -3.279737, 1, 0.3019608, 0, 1,
-1.754896, 0.8904592, -0.5570888, 1, 0.3058824, 0, 1,
-1.7469, 0.3239112, -1.244642, 1, 0.3137255, 0, 1,
-1.741176, -0.5406307, -1.133451, 1, 0.3176471, 0, 1,
-1.710747, 0.5125858, -3.791801, 1, 0.3254902, 0, 1,
-1.69454, -0.02040244, -2.966919, 1, 0.3294118, 0, 1,
-1.672392, -0.6059095, -3.26435, 1, 0.3372549, 0, 1,
-1.642099, 0.2307107, -1.630335, 1, 0.3411765, 0, 1,
-1.638368, 1.217836, -1.932384, 1, 0.3490196, 0, 1,
-1.631333, -0.6262502, -4.470448, 1, 0.3529412, 0, 1,
-1.625918, -0.6495246, -1.657151, 1, 0.3607843, 0, 1,
-1.624598, -0.3651431, -2.542236, 1, 0.3647059, 0, 1,
-1.610275, 0.608881, -3.003334, 1, 0.372549, 0, 1,
-1.607626, 0.8643913, -0.4152457, 1, 0.3764706, 0, 1,
-1.606791, 0.5859138, -0.8763488, 1, 0.3843137, 0, 1,
-1.604776, 0.5450512, -0.8504014, 1, 0.3882353, 0, 1,
-1.564148, 0.06240314, -1.146084, 1, 0.3960784, 0, 1,
-1.562157, 0.9067041, -2.080742, 1, 0.4039216, 0, 1,
-1.560804, 0.09563778, 0.01558264, 1, 0.4078431, 0, 1,
-1.554768, -0.6345971, -0.9475427, 1, 0.4156863, 0, 1,
-1.55056, -1.191405, -3.713241, 1, 0.4196078, 0, 1,
-1.549236, -0.544573, -1.790688, 1, 0.427451, 0, 1,
-1.547124, -0.2393552, -1.466401, 1, 0.4313726, 0, 1,
-1.540621, -1.169072, -0.8000247, 1, 0.4392157, 0, 1,
-1.538851, -0.5924079, -1.979769, 1, 0.4431373, 0, 1,
-1.538251, -0.4233542, -2.89034, 1, 0.4509804, 0, 1,
-1.536297, -1.571468, -2.565881, 1, 0.454902, 0, 1,
-1.526359, 0.4192717, -0.4239914, 1, 0.4627451, 0, 1,
-1.524778, 0.5821072, -0.682698, 1, 0.4666667, 0, 1,
-1.522201, 1.294469, -1.113302, 1, 0.4745098, 0, 1,
-1.520047, 1.545989, -1.117211, 1, 0.4784314, 0, 1,
-1.491651, 0.252863, -0.8704976, 1, 0.4862745, 0, 1,
-1.463751, -1.755142, -1.564184, 1, 0.4901961, 0, 1,
-1.463505, -1.558896, -1.64292, 1, 0.4980392, 0, 1,
-1.456677, -0.3706926, -2.216267, 1, 0.5058824, 0, 1,
-1.456341, -0.004869063, 1.042406, 1, 0.509804, 0, 1,
-1.44578, -0.4628365, -1.899522, 1, 0.5176471, 0, 1,
-1.438471, 0.1927657, -3.347426, 1, 0.5215687, 0, 1,
-1.435079, -0.3602658, -1.820288, 1, 0.5294118, 0, 1,
-1.421532, -0.2943382, -1.636467, 1, 0.5333334, 0, 1,
-1.413695, 0.3461307, -1.695516, 1, 0.5411765, 0, 1,
-1.412075, -0.6173335, -3.376806, 1, 0.5450981, 0, 1,
-1.408427, -0.5576602, -1.627494, 1, 0.5529412, 0, 1,
-1.407472, 0.06074696, -0.9439734, 1, 0.5568628, 0, 1,
-1.407175, -0.6441209, -0.8460117, 1, 0.5647059, 0, 1,
-1.397832, 0.5586777, 0.250183, 1, 0.5686275, 0, 1,
-1.397676, 0.623137, -2.037256, 1, 0.5764706, 0, 1,
-1.395013, -1.063077, -2.316209, 1, 0.5803922, 0, 1,
-1.391418, 0.950516, -0.649862, 1, 0.5882353, 0, 1,
-1.38632, -0.5666876, -1.948141, 1, 0.5921569, 0, 1,
-1.376816, -0.4363269, -0.2293904, 1, 0.6, 0, 1,
-1.372609, 0.4766665, 0.3600242, 1, 0.6078432, 0, 1,
-1.363706, -1.173835, -0.7012889, 1, 0.6117647, 0, 1,
-1.355951, -0.695682, -3.568134, 1, 0.6196079, 0, 1,
-1.351318, 0.7326775, -3.71501, 1, 0.6235294, 0, 1,
-1.34964, 0.5829756, -0.2089327, 1, 0.6313726, 0, 1,
-1.348948, 1.159092, -1.418549, 1, 0.6352941, 0, 1,
-1.346814, -0.4408773, -1.143455, 1, 0.6431373, 0, 1,
-1.329227, -0.2013701, -3.648507, 1, 0.6470588, 0, 1,
-1.320803, -1.4501, -2.203631, 1, 0.654902, 0, 1,
-1.317214, -0.473418, -1.984919, 1, 0.6588235, 0, 1,
-1.309297, 0.2508481, -2.000615, 1, 0.6666667, 0, 1,
-1.307382, -0.7349709, -2.14928, 1, 0.6705883, 0, 1,
-1.300907, 0.1212416, -1.444539, 1, 0.6784314, 0, 1,
-1.283005, 0.9692493, -1.418692, 1, 0.682353, 0, 1,
-1.282148, 0.3386826, -1.51909, 1, 0.6901961, 0, 1,
-1.251929, 0.1498704, -2.408686, 1, 0.6941177, 0, 1,
-1.25102, -1.523733, -2.518849, 1, 0.7019608, 0, 1,
-1.243898, -0.172005, -2.423696, 1, 0.7098039, 0, 1,
-1.227324, -0.2300816, -1.169226, 1, 0.7137255, 0, 1,
-1.21422, 0.4371563, -1.792763, 1, 0.7215686, 0, 1,
-1.210577, 1.021595, -0.7286876, 1, 0.7254902, 0, 1,
-1.208332, 2.302999, 0.3247352, 1, 0.7333333, 0, 1,
-1.207687, 1.759894, -0.3504251, 1, 0.7372549, 0, 1,
-1.202651, -1.28012, -2.699589, 1, 0.7450981, 0, 1,
-1.197522, -0.06219403, -1.582187, 1, 0.7490196, 0, 1,
-1.193839, -1.050335, -1.342479, 1, 0.7568628, 0, 1,
-1.188074, -0.4488028, -0.8575011, 1, 0.7607843, 0, 1,
-1.179255, 1.028128, -1.652434, 1, 0.7686275, 0, 1,
-1.177684, 0.921147, -1.811312, 1, 0.772549, 0, 1,
-1.177147, 1.134373, -0.003814165, 1, 0.7803922, 0, 1,
-1.165787, -0.7092689, -1.668671, 1, 0.7843137, 0, 1,
-1.165339, 0.3736914, -3.347868, 1, 0.7921569, 0, 1,
-1.162469, 0.3604475, 0.05277114, 1, 0.7960784, 0, 1,
-1.158255, -0.4687696, -1.980154, 1, 0.8039216, 0, 1,
-1.149626, 1.405206, -1.773941, 1, 0.8117647, 0, 1,
-1.146353, 1.257353, -0.6174351, 1, 0.8156863, 0, 1,
-1.142855, -0.05524843, -2.425423, 1, 0.8235294, 0, 1,
-1.13705, -0.3457505, -1.900294, 1, 0.827451, 0, 1,
-1.135143, 1.165391, -1.023549, 1, 0.8352941, 0, 1,
-1.134267, -0.7852879, -2.950087, 1, 0.8392157, 0, 1,
-1.127662, -0.08429872, -2.762872, 1, 0.8470588, 0, 1,
-1.125542, 0.5315011, -1.131935, 1, 0.8509804, 0, 1,
-1.125473, -1.302215, -1.43382, 1, 0.8588235, 0, 1,
-1.123308, -0.1266859, -0.9151114, 1, 0.8627451, 0, 1,
-1.123192, -1.193653, -2.131318, 1, 0.8705882, 0, 1,
-1.122838, -0.06037226, -1.168201, 1, 0.8745098, 0, 1,
-1.121922, -0.0107359, -0.7666601, 1, 0.8823529, 0, 1,
-1.121371, 0.03096887, -1.228232, 1, 0.8862745, 0, 1,
-1.104715, 0.6959661, -1.533228, 1, 0.8941177, 0, 1,
-1.102583, 1.297078, 1.007202, 1, 0.8980392, 0, 1,
-1.100536, 0.3032841, 0.3144949, 1, 0.9058824, 0, 1,
-1.098359, 0.9654713, -1.4179, 1, 0.9137255, 0, 1,
-1.092824, -1.539944, -5.262536, 1, 0.9176471, 0, 1,
-1.087377, -0.2915812, -1.562109, 1, 0.9254902, 0, 1,
-1.085683, -0.242341, -3.361695, 1, 0.9294118, 0, 1,
-1.084735, -1.489152, -3.608692, 1, 0.9372549, 0, 1,
-1.077792, 2.097069, -1.170254, 1, 0.9411765, 0, 1,
-1.060645, -0.00399424, -3.214425, 1, 0.9490196, 0, 1,
-1.059924, 0.6291437, -0.9033158, 1, 0.9529412, 0, 1,
-1.059235, -0.2751351, -0.8401191, 1, 0.9607843, 0, 1,
-1.058807, 1.074147, -2.839407, 1, 0.9647059, 0, 1,
-1.058305, 0.3971878, -0.8551929, 1, 0.972549, 0, 1,
-1.05463, 0.5021167, -3.381286, 1, 0.9764706, 0, 1,
-1.052938, -0.09402082, -0.8833501, 1, 0.9843137, 0, 1,
-1.052805, -2.646847, -3.131798, 1, 0.9882353, 0, 1,
-1.048866, -0.4836357, -0.5306091, 1, 0.9960784, 0, 1,
-1.034371, -1.249371, -2.953595, 0.9960784, 1, 0, 1,
-1.027954, 1.582901, 0.2385391, 0.9921569, 1, 0, 1,
-0.9978271, 0.3572, -2.09919, 0.9843137, 1, 0, 1,
-0.9871116, 0.1011624, -1.2946, 0.9803922, 1, 0, 1,
-0.9750142, 0.08171184, -1.430549, 0.972549, 1, 0, 1,
-0.9744323, -0.5804008, -2.831798, 0.9686275, 1, 0, 1,
-0.9629052, -1.991372, -2.087727, 0.9607843, 1, 0, 1,
-0.9546862, 0.4706362, -1.872237, 0.9568627, 1, 0, 1,
-0.9530153, -1.322026, -3.799499, 0.9490196, 1, 0, 1,
-0.9464877, -0.2308021, -1.725442, 0.945098, 1, 0, 1,
-0.9458673, 1.3717, 0.4560168, 0.9372549, 1, 0, 1,
-0.9451424, 0.5104348, -0.3315553, 0.9333333, 1, 0, 1,
-0.9398333, -0.9662259, -2.056095, 0.9254902, 1, 0, 1,
-0.9394583, 2.515643, 0.02389109, 0.9215686, 1, 0, 1,
-0.9383053, -0.1149473, -2.08481, 0.9137255, 1, 0, 1,
-0.9350677, -0.2969577, -2.461269, 0.9098039, 1, 0, 1,
-0.9325849, 1.946695, -0.9988853, 0.9019608, 1, 0, 1,
-0.9322304, -0.08650389, -1.431285, 0.8941177, 1, 0, 1,
-0.9230195, 0.004680999, -0.8060192, 0.8901961, 1, 0, 1,
-0.9216815, -0.5491693, -2.904609, 0.8823529, 1, 0, 1,
-0.9215295, -0.2094935, -3.250028, 0.8784314, 1, 0, 1,
-0.9200934, -1.471849, -4.153523, 0.8705882, 1, 0, 1,
-0.9170726, -0.002302506, -1.972334, 0.8666667, 1, 0, 1,
-0.9170505, 1.040852, -0.2436662, 0.8588235, 1, 0, 1,
-0.9160622, -0.07775494, -2.234894, 0.854902, 1, 0, 1,
-0.9093152, -0.8036521, -1.924344, 0.8470588, 1, 0, 1,
-0.9074449, 0.1496113, -0.2247608, 0.8431373, 1, 0, 1,
-0.9058275, -0.310477, -1.895275, 0.8352941, 1, 0, 1,
-0.9002833, 1.456075, 0.2640638, 0.8313726, 1, 0, 1,
-0.8972066, -0.4544201, -2.484305, 0.8235294, 1, 0, 1,
-0.8895401, 1.474135, -1.800559, 0.8196079, 1, 0, 1,
-0.8681427, 0.7494795, 0.5217154, 0.8117647, 1, 0, 1,
-0.8591576, 0.2144963, -1.068551, 0.8078431, 1, 0, 1,
-0.854829, -0.7861035, -1.91261, 0.8, 1, 0, 1,
-0.8534873, -1.127482, -1.794451, 0.7921569, 1, 0, 1,
-0.8531199, -0.7605244, -2.779862, 0.7882353, 1, 0, 1,
-0.8530513, 0.4929889, -2.054775, 0.7803922, 1, 0, 1,
-0.8490751, -0.3671945, -1.878864, 0.7764706, 1, 0, 1,
-0.8447084, 1.093994, -2.19069, 0.7686275, 1, 0, 1,
-0.8378876, 0.2600303, -0.7882046, 0.7647059, 1, 0, 1,
-0.8374342, -2.075527, -1.206286, 0.7568628, 1, 0, 1,
-0.8274559, -0.7047482, -1.228407, 0.7529412, 1, 0, 1,
-0.825182, 2.420125, 0.8936816, 0.7450981, 1, 0, 1,
-0.8221295, 1.011772, -0.4747511, 0.7411765, 1, 0, 1,
-0.8217866, -0.5555139, -2.576553, 0.7333333, 1, 0, 1,
-0.8159741, -0.7998417, -1.516579, 0.7294118, 1, 0, 1,
-0.8152809, 0.6820499, -0.9419914, 0.7215686, 1, 0, 1,
-0.811338, -0.1906738, -0.2253432, 0.7176471, 1, 0, 1,
-0.8101879, 0.1495275, -2.065141, 0.7098039, 1, 0, 1,
-0.8078821, 1.171212, -0.1846615, 0.7058824, 1, 0, 1,
-0.7997184, 0.694991, -0.5451092, 0.6980392, 1, 0, 1,
-0.798927, -1.022904, -1.823184, 0.6901961, 1, 0, 1,
-0.7962334, 1.741876, -1.791914, 0.6862745, 1, 0, 1,
-0.7861583, -0.442525, -1.287356, 0.6784314, 1, 0, 1,
-0.7822738, -0.1587746, -2.748336, 0.6745098, 1, 0, 1,
-0.780046, 0.2889531, -1.931261, 0.6666667, 1, 0, 1,
-0.7797326, -1.099313, -2.845335, 0.6627451, 1, 0, 1,
-0.7775263, 0.274505, -0.5112979, 0.654902, 1, 0, 1,
-0.7772093, -0.2465732, -1.951951, 0.6509804, 1, 0, 1,
-0.7716938, -1.303682, -2.544497, 0.6431373, 1, 0, 1,
-0.7716081, 2.582413, -2.420064, 0.6392157, 1, 0, 1,
-0.76151, -0.1019563, -2.333117, 0.6313726, 1, 0, 1,
-0.7606468, -0.8219467, -4.04306, 0.627451, 1, 0, 1,
-0.7597087, -0.98205, -2.588992, 0.6196079, 1, 0, 1,
-0.7500819, 0.8474357, 1.258141, 0.6156863, 1, 0, 1,
-0.7483861, -1.553494, -2.352354, 0.6078432, 1, 0, 1,
-0.7418927, -0.7472981, -1.527692, 0.6039216, 1, 0, 1,
-0.7375461, 1.32013, -3.471168, 0.5960785, 1, 0, 1,
-0.7372552, -0.8287101, -2.40723, 0.5882353, 1, 0, 1,
-0.7360865, 0.9683256, -0.4301983, 0.5843138, 1, 0, 1,
-0.7350053, -0.8115381, -2.279572, 0.5764706, 1, 0, 1,
-0.7339017, 0.05759265, -1.924541, 0.572549, 1, 0, 1,
-0.7242908, -2.125103, -2.441584, 0.5647059, 1, 0, 1,
-0.7238289, -0.2139136, -2.701551, 0.5607843, 1, 0, 1,
-0.7231502, -0.8856189, -2.783842, 0.5529412, 1, 0, 1,
-0.7211804, 0.1055171, -1.603507, 0.5490196, 1, 0, 1,
-0.7195325, -0.9772948, -0.9941077, 0.5411765, 1, 0, 1,
-0.7193238, 0.9490133, -2.578666, 0.5372549, 1, 0, 1,
-0.7171277, 0.02288284, -0.7758839, 0.5294118, 1, 0, 1,
-0.7115452, 2.036135, -0.0218424, 0.5254902, 1, 0, 1,
-0.7010087, -1.730088, -2.59041, 0.5176471, 1, 0, 1,
-0.7008405, 0.2557745, -0.5575097, 0.5137255, 1, 0, 1,
-0.7006925, -0.8332169, -1.158965, 0.5058824, 1, 0, 1,
-0.7002901, -0.0569764, -1.616292, 0.5019608, 1, 0, 1,
-0.692966, -0.9120497, -0.7970757, 0.4941176, 1, 0, 1,
-0.6921664, 0.009340724, 0.7518132, 0.4862745, 1, 0, 1,
-0.6900088, -0.944488, -1.835541, 0.4823529, 1, 0, 1,
-0.6877018, 2.265282, 2.436383, 0.4745098, 1, 0, 1,
-0.6856086, -1.18887, -1.917174, 0.4705882, 1, 0, 1,
-0.6853694, -1.075208, -2.91106, 0.4627451, 1, 0, 1,
-0.6829715, -0.2981679, -0.2155134, 0.4588235, 1, 0, 1,
-0.6748444, -1.072543, -3.160401, 0.4509804, 1, 0, 1,
-0.667659, -1.304816, -2.190254, 0.4470588, 1, 0, 1,
-0.659906, 0.3137171, -0.3827038, 0.4392157, 1, 0, 1,
-0.6551328, 1.179427, 0.4198587, 0.4352941, 1, 0, 1,
-0.6534159, -0.05438329, -1.042241, 0.427451, 1, 0, 1,
-0.6515333, -0.7026564, -2.29052, 0.4235294, 1, 0, 1,
-0.646093, 1.101787, -0.6899792, 0.4156863, 1, 0, 1,
-0.6456332, -0.7761216, -1.534652, 0.4117647, 1, 0, 1,
-0.6443151, -0.06007389, -1.923873, 0.4039216, 1, 0, 1,
-0.6385981, 1.095443, 0.2667498, 0.3960784, 1, 0, 1,
-0.6380913, -0.4532048, -1.282161, 0.3921569, 1, 0, 1,
-0.636815, -0.6290833, -2.078296, 0.3843137, 1, 0, 1,
-0.6326749, -0.2322724, -2.426078, 0.3803922, 1, 0, 1,
-0.632226, -1.457999, -1.590604, 0.372549, 1, 0, 1,
-0.6289341, 0.2093426, -0.3034972, 0.3686275, 1, 0, 1,
-0.6279982, 0.8650593, -0.9723824, 0.3607843, 1, 0, 1,
-0.6205354, -1.36688, -2.380452, 0.3568628, 1, 0, 1,
-0.6204276, -0.1711966, -1.054662, 0.3490196, 1, 0, 1,
-0.6196659, 0.8514735, -1.457681, 0.345098, 1, 0, 1,
-0.616249, -1.341655, -3.086281, 0.3372549, 1, 0, 1,
-0.6143342, 0.7949385, -1.812467, 0.3333333, 1, 0, 1,
-0.6142318, 1.79875, 1.14353, 0.3254902, 1, 0, 1,
-0.6140282, -2.123216, -3.455881, 0.3215686, 1, 0, 1,
-0.6092983, -1.014848, -3.784205, 0.3137255, 1, 0, 1,
-0.6092679, 2.968347, -0.1913694, 0.3098039, 1, 0, 1,
-0.6019328, -0.9477986, -2.078689, 0.3019608, 1, 0, 1,
-0.5932386, 0.01034812, -1.56276, 0.2941177, 1, 0, 1,
-0.5909295, 1.532595, -2.202831, 0.2901961, 1, 0, 1,
-0.5870278, -0.7028099, -1.431284, 0.282353, 1, 0, 1,
-0.5861039, 0.1286424, -0.6376569, 0.2784314, 1, 0, 1,
-0.5853055, -0.4131189, 0.6530534, 0.2705882, 1, 0, 1,
-0.5811038, 0.5646312, -1.86414, 0.2666667, 1, 0, 1,
-0.579114, -1.175534, -2.527703, 0.2588235, 1, 0, 1,
-0.5759249, 0.3984469, -1.75275, 0.254902, 1, 0, 1,
-0.5734929, -0.7434027, -1.114951, 0.2470588, 1, 0, 1,
-0.5711484, 1.748025, 0.1442292, 0.2431373, 1, 0, 1,
-0.5698097, 1.406238, -0.3262397, 0.2352941, 1, 0, 1,
-0.5682552, -0.1292661, -2.89559, 0.2313726, 1, 0, 1,
-0.5569557, -0.3276276, -1.393537, 0.2235294, 1, 0, 1,
-0.5566863, 1.308071, 0.1855942, 0.2196078, 1, 0, 1,
-0.556096, -1.201675, -2.666307, 0.2117647, 1, 0, 1,
-0.5490509, -2.362834, -1.997235, 0.2078431, 1, 0, 1,
-0.543684, 0.649966, -1.358954, 0.2, 1, 0, 1,
-0.540313, -0.5857129, -2.748543, 0.1921569, 1, 0, 1,
-0.537591, 0.8618601, 0.8286499, 0.1882353, 1, 0, 1,
-0.5311465, 0.3959231, -1.504267, 0.1803922, 1, 0, 1,
-0.5284422, 1.469277, 0.2678685, 0.1764706, 1, 0, 1,
-0.5249711, 3.17432, -1.328241, 0.1686275, 1, 0, 1,
-0.5217561, -2.576484, -3.192147, 0.1647059, 1, 0, 1,
-0.5208498, -0.4293076, -1.795307, 0.1568628, 1, 0, 1,
-0.5174685, 0.7754716, -1.10359, 0.1529412, 1, 0, 1,
-0.5149036, -0.2117693, 0.2602135, 0.145098, 1, 0, 1,
-0.5147586, 1.267886, 1.564762, 0.1411765, 1, 0, 1,
-0.5108036, -0.4183298, -1.360746, 0.1333333, 1, 0, 1,
-0.5106292, 1.051452, 0.2220095, 0.1294118, 1, 0, 1,
-0.5098063, 1.654574, -0.362228, 0.1215686, 1, 0, 1,
-0.5066987, 2.445971, 0.07441716, 0.1176471, 1, 0, 1,
-0.4990777, 1.955886, 1.009529, 0.1098039, 1, 0, 1,
-0.4988937, 0.2893807, -1.087033, 0.1058824, 1, 0, 1,
-0.4953157, 0.9677854, 2.194996, 0.09803922, 1, 0, 1,
-0.4933093, 0.8076177, -1.17457, 0.09019608, 1, 0, 1,
-0.4922265, 0.8234245, -0.8155595, 0.08627451, 1, 0, 1,
-0.4922072, -1.23892, -4.609403, 0.07843138, 1, 0, 1,
-0.4895224, 1.094484, -1.315549, 0.07450981, 1, 0, 1,
-0.4830135, 0.9650284, 0.4350733, 0.06666667, 1, 0, 1,
-0.4817541, -0.7386673, -1.862928, 0.0627451, 1, 0, 1,
-0.4816755, -0.0766857, -2.995532, 0.05490196, 1, 0, 1,
-0.4785428, 1.76574, -0.3815973, 0.05098039, 1, 0, 1,
-0.4780872, -0.322209, -1.782927, 0.04313726, 1, 0, 1,
-0.4776602, 0.6610832, -1.28482, 0.03921569, 1, 0, 1,
-0.4722532, 0.5016709, -1.568795, 0.03137255, 1, 0, 1,
-0.4721314, 0.7369093, 0.324602, 0.02745098, 1, 0, 1,
-0.4705592, -0.2960397, -1.607111, 0.01960784, 1, 0, 1,
-0.4658154, 0.02905964, -2.063687, 0.01568628, 1, 0, 1,
-0.4657138, 1.016073, -1.237786, 0.007843138, 1, 0, 1,
-0.4653455, 0.6799802, -1.350827, 0.003921569, 1, 0, 1,
-0.4641663, -0.1702917, -2.757094, 0, 1, 0.003921569, 1,
-0.46312, 0.3146396, -0.1303928, 0, 1, 0.01176471, 1,
-0.4589552, -0.3913006, -1.939233, 0, 1, 0.01568628, 1,
-0.4582974, -0.4993597, -2.693747, 0, 1, 0.02352941, 1,
-0.4568569, -1.614144, -3.45995, 0, 1, 0.02745098, 1,
-0.4515814, 2.131438, -2.062725, 0, 1, 0.03529412, 1,
-0.4498867, -0.1050964, -1.982812, 0, 1, 0.03921569, 1,
-0.4413365, 1.25152, -0.1066522, 0, 1, 0.04705882, 1,
-0.4382673, 1.766216, -0.4005935, 0, 1, 0.05098039, 1,
-0.4377051, 1.006402, 0.5437991, 0, 1, 0.05882353, 1,
-0.4303786, 1.17673, 2.735483, 0, 1, 0.0627451, 1,
-0.4274026, 0.3795091, 0.2849168, 0, 1, 0.07058824, 1,
-0.4241419, 1.262707, -0.3150674, 0, 1, 0.07450981, 1,
-0.4238153, -2.195473, -1.78365, 0, 1, 0.08235294, 1,
-0.4225104, -1.10147, -2.705883, 0, 1, 0.08627451, 1,
-0.421875, 2.449902, 0.5818838, 0, 1, 0.09411765, 1,
-0.4158541, -0.4734492, -3.652518, 0, 1, 0.1019608, 1,
-0.4130596, 0.3833398, -1.019717, 0, 1, 0.1058824, 1,
-0.411789, 0.03001743, -2.026917, 0, 1, 0.1137255, 1,
-0.4114368, 1.355617, 0.6766828, 0, 1, 0.1176471, 1,
-0.4062403, -1.097319, -3.223412, 0, 1, 0.1254902, 1,
-0.4045922, 0.2614594, 1.43148, 0, 1, 0.1294118, 1,
-0.3978224, 0.339694, 0.1154801, 0, 1, 0.1372549, 1,
-0.39747, 1.483851, 0.2839427, 0, 1, 0.1411765, 1,
-0.3961655, -0.7232072, -3.238046, 0, 1, 0.1490196, 1,
-0.3943258, 0.6645446, -1.613728, 0, 1, 0.1529412, 1,
-0.3844703, -0.452494, -1.22543, 0, 1, 0.1607843, 1,
-0.3840556, 0.7950788, -1.579586, 0, 1, 0.1647059, 1,
-0.367945, 0.1758984, -1.416321, 0, 1, 0.172549, 1,
-0.3650464, 0.6844336, -1.414303, 0, 1, 0.1764706, 1,
-0.3571178, -0.610659, -3.140439, 0, 1, 0.1843137, 1,
-0.3567085, 0.1359023, -2.262428, 0, 1, 0.1882353, 1,
-0.3558075, 0.1556068, -2.038576, 0, 1, 0.1960784, 1,
-0.3552603, -0.04521396, -1.513891, 0, 1, 0.2039216, 1,
-0.3535769, 0.4653688, 1.25301, 0, 1, 0.2078431, 1,
-0.3518763, 1.442707, 1.273139, 0, 1, 0.2156863, 1,
-0.3496492, 1.835699, 0.09366775, 0, 1, 0.2196078, 1,
-0.349337, 1.797355, -0.04943865, 0, 1, 0.227451, 1,
-0.3483373, 0.5835795, -0.8056285, 0, 1, 0.2313726, 1,
-0.3470438, -0.1996727, -1.323573, 0, 1, 0.2392157, 1,
-0.3457454, -0.2153282, -1.718598, 0, 1, 0.2431373, 1,
-0.3452311, 1.730389, 0.03926816, 0, 1, 0.2509804, 1,
-0.3420681, 0.6457115, 1.581741, 0, 1, 0.254902, 1,
-0.3419824, -0.9974036, -1.86149, 0, 1, 0.2627451, 1,
-0.3399644, 2.119438, 0.01593479, 0, 1, 0.2666667, 1,
-0.3350186, 1.729471, 0.08561441, 0, 1, 0.2745098, 1,
-0.3292419, 0.385123, 1.963234, 0, 1, 0.2784314, 1,
-0.3266113, -0.6360352, -1.540748, 0, 1, 0.2862745, 1,
-0.3257505, 1.249305, -0.3717249, 0, 1, 0.2901961, 1,
-0.3241443, 0.270199, 1.549556, 0, 1, 0.2980392, 1,
-0.3153848, 0.3191952, -1.839795, 0, 1, 0.3058824, 1,
-0.3147547, -0.01793902, -2.344343, 0, 1, 0.3098039, 1,
-0.3105508, -0.7163904, -2.130108, 0, 1, 0.3176471, 1,
-0.310012, 2.035208, -0.5874181, 0, 1, 0.3215686, 1,
-0.309862, 1.161741, 1.820287, 0, 1, 0.3294118, 1,
-0.3082729, -1.661448, -4.227536, 0, 1, 0.3333333, 1,
-0.3067608, 0.1171484, -2.577042, 0, 1, 0.3411765, 1,
-0.306435, 1.077945, 0.1009446, 0, 1, 0.345098, 1,
-0.3057608, -0.1644143, -2.454912, 0, 1, 0.3529412, 1,
-0.2964875, -0.3857066, -3.017207, 0, 1, 0.3568628, 1,
-0.2958704, -0.4930279, -2.924199, 0, 1, 0.3647059, 1,
-0.2918249, 0.8680058, -0.2756935, 0, 1, 0.3686275, 1,
-0.28886, 0.7715182, 0.5400665, 0, 1, 0.3764706, 1,
-0.287812, -0.9971794, -2.467338, 0, 1, 0.3803922, 1,
-0.284592, -0.4319854, -2.78444, 0, 1, 0.3882353, 1,
-0.2833858, -1.267061, -2.053717, 0, 1, 0.3921569, 1,
-0.2825098, -0.7065693, -2.678921, 0, 1, 0.4, 1,
-0.2793217, -0.8791435, -3.854441, 0, 1, 0.4078431, 1,
-0.2701479, -1.251052, -4.724268, 0, 1, 0.4117647, 1,
-0.2688624, 1.611805, -0.4326319, 0, 1, 0.4196078, 1,
-0.2671768, 0.04974216, -2.983474, 0, 1, 0.4235294, 1,
-0.2640184, -0.4828473, -1.600134, 0, 1, 0.4313726, 1,
-0.2624728, -0.588924, -2.949331, 0, 1, 0.4352941, 1,
-0.2615545, 0.529383, -1.410493, 0, 1, 0.4431373, 1,
-0.2588387, -1.604731, -2.329804, 0, 1, 0.4470588, 1,
-0.2583842, 1.810715, 0.08613367, 0, 1, 0.454902, 1,
-0.2576917, 0.7467112, 0.9623344, 0, 1, 0.4588235, 1,
-0.2551612, 1.82141, -0.4805669, 0, 1, 0.4666667, 1,
-0.2532827, -0.5888884, -3.314794, 0, 1, 0.4705882, 1,
-0.2481589, -1.124812, -0.6407854, 0, 1, 0.4784314, 1,
-0.2455247, 0.1601758, -1.049341, 0, 1, 0.4823529, 1,
-0.240489, -1.088222, -3.86752, 0, 1, 0.4901961, 1,
-0.2403641, -0.07747446, -2.766418, 0, 1, 0.4941176, 1,
-0.2377254, -1.357871, -4.129684, 0, 1, 0.5019608, 1,
-0.2324359, -0.5862308, -3.75553, 0, 1, 0.509804, 1,
-0.2323501, -2.3126, -2.417168, 0, 1, 0.5137255, 1,
-0.2318738, -0.3218088, -2.192954, 0, 1, 0.5215687, 1,
-0.2293979, 0.3064253, 0.6874258, 0, 1, 0.5254902, 1,
-0.2288636, 0.03303759, -0.7359672, 0, 1, 0.5333334, 1,
-0.2262926, 0.2966858, -2.059977, 0, 1, 0.5372549, 1,
-0.2221024, 1.109261, -0.2382793, 0, 1, 0.5450981, 1,
-0.2210703, -0.7284131, -5.543341, 0, 1, 0.5490196, 1,
-0.2197138, 2.16345, 1.212231, 0, 1, 0.5568628, 1,
-0.2046406, 0.4216729, 0.369249, 0, 1, 0.5607843, 1,
-0.2040092, -1.012903, -3.463816, 0, 1, 0.5686275, 1,
-0.2038456, -0.4321508, -3.76564, 0, 1, 0.572549, 1,
-0.1986981, -0.4098518, -3.2353, 0, 1, 0.5803922, 1,
-0.1985233, -0.2163913, -3.675634, 0, 1, 0.5843138, 1,
-0.1970343, -0.09324796, -1.539928, 0, 1, 0.5921569, 1,
-0.1930714, 0.7304242, -0.2114705, 0, 1, 0.5960785, 1,
-0.185705, 0.2309714, -0.04864507, 0, 1, 0.6039216, 1,
-0.1851139, 0.7799085, -0.7354306, 0, 1, 0.6117647, 1,
-0.1831391, 0.06170382, -0.8097093, 0, 1, 0.6156863, 1,
-0.1795504, -0.2732732, -1.641477, 0, 1, 0.6235294, 1,
-0.1785899, -0.939034, -2.846531, 0, 1, 0.627451, 1,
-0.1751914, -0.3573562, -1.828998, 0, 1, 0.6352941, 1,
-0.171238, 0.02358919, -2.751314, 0, 1, 0.6392157, 1,
-0.167997, 1.835697, -1.283989, 0, 1, 0.6470588, 1,
-0.1623576, 1.350222, -0.2019636, 0, 1, 0.6509804, 1,
-0.1583805, 1.135753, 0.8039817, 0, 1, 0.6588235, 1,
-0.1528937, 1.930963, 0.5427843, 0, 1, 0.6627451, 1,
-0.1515722, 2.238653, 0.4544311, 0, 1, 0.6705883, 1,
-0.1488716, 0.8843899, -0.4591272, 0, 1, 0.6745098, 1,
-0.1485959, 0.1231049, -1.053729, 0, 1, 0.682353, 1,
-0.1474079, 0.470436, 0.7350584, 0, 1, 0.6862745, 1,
-0.1441835, -0.3431962, -2.53653, 0, 1, 0.6941177, 1,
-0.138968, -0.9580134, -2.186017, 0, 1, 0.7019608, 1,
-0.1362264, -0.02629846, -2.178561, 0, 1, 0.7058824, 1,
-0.1354421, -0.6751014, -2.729973, 0, 1, 0.7137255, 1,
-0.1313106, -0.6676281, -3.583879, 0, 1, 0.7176471, 1,
-0.1246864, 1.03394, -0.1153641, 0, 1, 0.7254902, 1,
-0.1225237, -1.303688, -2.963011, 0, 1, 0.7294118, 1,
-0.119492, -1.429787, -3.589282, 0, 1, 0.7372549, 1,
-0.1188446, -0.9572515, -0.6718794, 0, 1, 0.7411765, 1,
-0.1147372, 0.480514, 0.3625796, 0, 1, 0.7490196, 1,
-0.1140179, 0.951747, 0.01146638, 0, 1, 0.7529412, 1,
-0.1138562, 0.2808869, -0.9181111, 0, 1, 0.7607843, 1,
-0.110825, -1.065673, -2.982456, 0, 1, 0.7647059, 1,
-0.1071257, -0.427233, -4.459677, 0, 1, 0.772549, 1,
-0.1038221, -0.6646663, -2.393215, 0, 1, 0.7764706, 1,
-0.1029635, -0.2492238, -3.371123, 0, 1, 0.7843137, 1,
-0.09967738, -0.3258896, -2.612252, 0, 1, 0.7882353, 1,
-0.09043405, 2.003773, -0.001908436, 0, 1, 0.7960784, 1,
-0.0883504, -0.8477911, -3.208923, 0, 1, 0.8039216, 1,
-0.08744842, 0.1359015, -1.756483, 0, 1, 0.8078431, 1,
-0.08695875, 0.8864089, -2.04885, 0, 1, 0.8156863, 1,
-0.08560609, 0.2870064, -0.3046052, 0, 1, 0.8196079, 1,
-0.08391589, 1.243433, -1.310992, 0, 1, 0.827451, 1,
-0.08088186, -0.5440462, -2.434984, 0, 1, 0.8313726, 1,
-0.07861617, -0.1279354, -3.541169, 0, 1, 0.8392157, 1,
-0.07821298, 1.401515, 0.3191617, 0, 1, 0.8431373, 1,
-0.0729262, -0.347927, -0.7127203, 0, 1, 0.8509804, 1,
-0.06939027, 1.28141, 1.060958, 0, 1, 0.854902, 1,
-0.06641125, 0.08243991, -1.196713, 0, 1, 0.8627451, 1,
-0.06581946, 0.8595988, -0.01244156, 0, 1, 0.8666667, 1,
-0.06521253, -1.18273, -4.414585, 0, 1, 0.8745098, 1,
-0.06094425, -0.7474105, -4.202132, 0, 1, 0.8784314, 1,
-0.05964643, -0.2741273, -2.63406, 0, 1, 0.8862745, 1,
-0.05249692, 0.254279, -0.3780215, 0, 1, 0.8901961, 1,
-0.0522773, -0.7215155, -1.394375, 0, 1, 0.8980392, 1,
-0.0495159, 1.161984, 0.5610385, 0, 1, 0.9058824, 1,
-0.04931559, 1.017961, -0.4643189, 0, 1, 0.9098039, 1,
-0.04886313, -0.08580584, -3.173321, 0, 1, 0.9176471, 1,
-0.04549222, -1.225237, -2.508998, 0, 1, 0.9215686, 1,
-0.04512793, 1.12677, -1.819177, 0, 1, 0.9294118, 1,
-0.04345582, -0.602139, -1.882524, 0, 1, 0.9333333, 1,
-0.03806768, -0.6935322, -3.074518, 0, 1, 0.9411765, 1,
-0.0310267, -0.4318324, -2.7658, 0, 1, 0.945098, 1,
-0.03070812, -0.2811906, -2.034181, 0, 1, 0.9529412, 1,
-0.03043777, -0.8572184, -3.76882, 0, 1, 0.9568627, 1,
-0.02920759, -0.9724408, -2.534631, 0, 1, 0.9647059, 1,
-0.0285879, 0.08050383, 0.4471887, 0, 1, 0.9686275, 1,
-0.02383482, 1.558433, -0.7273327, 0, 1, 0.9764706, 1,
-0.0214308, 0.01604419, -1.974483, 0, 1, 0.9803922, 1,
-0.01877794, 0.6850303, -1.377435, 0, 1, 0.9882353, 1,
-0.0172161, -0.1795669, -2.504681, 0, 1, 0.9921569, 1,
-0.01396981, -1.217595, -2.746934, 0, 1, 1, 1,
-0.01363109, 2.226053, -0.4840142, 0, 0.9921569, 1, 1,
-0.009543208, -0.497817, -2.824485, 0, 0.9882353, 1, 1,
-0.007172353, -0.6822868, -3.492107, 0, 0.9803922, 1, 1,
-0.006734087, -0.3156684, -4.597979, 0, 0.9764706, 1, 1,
-0.001982774, 1.000704, -0.8845763, 0, 0.9686275, 1, 1,
-5.638264e-05, -0.6741858, -3.041877, 0, 0.9647059, 1, 1,
0.0007800515, -1.377672, 3.506189, 0, 0.9568627, 1, 1,
0.01648534, -0.9731663, 2.960819, 0, 0.9529412, 1, 1,
0.01903495, -0.1042889, 2.654598, 0, 0.945098, 1, 1,
0.02535338, 1.402247, -0.1527561, 0, 0.9411765, 1, 1,
0.02611871, -1.555007, 4.593263, 0, 0.9333333, 1, 1,
0.02877131, -0.6342762, 2.381641, 0, 0.9294118, 1, 1,
0.03426997, 0.7202254, -0.3258122, 0, 0.9215686, 1, 1,
0.03535618, -0.556785, 2.028548, 0, 0.9176471, 1, 1,
0.03567075, 0.2164898, 1.71782, 0, 0.9098039, 1, 1,
0.03726779, -0.7640745, 1.362728, 0, 0.9058824, 1, 1,
0.04067882, -0.7796391, 3.127439, 0, 0.8980392, 1, 1,
0.04114005, 0.08717307, 1.656956, 0, 0.8901961, 1, 1,
0.04333075, -0.1819558, 0.98756, 0, 0.8862745, 1, 1,
0.04415709, -1.757747, 3.727594, 0, 0.8784314, 1, 1,
0.04499781, 0.7055839, -0.4765325, 0, 0.8745098, 1, 1,
0.04540136, 0.2827307, -0.8067051, 0, 0.8666667, 1, 1,
0.04805261, 1.025742, 0.3963046, 0, 0.8627451, 1, 1,
0.05133311, -1.251159, 2.178833, 0, 0.854902, 1, 1,
0.05205058, 1.26921, -0.2309251, 0, 0.8509804, 1, 1,
0.05206757, -1.655891, 2.318717, 0, 0.8431373, 1, 1,
0.05348724, 0.2675872, -1.255516, 0, 0.8392157, 1, 1,
0.05548289, 0.656205, -0.7544962, 0, 0.8313726, 1, 1,
0.05724503, 0.2568798, 0.08083644, 0, 0.827451, 1, 1,
0.06131645, -0.3365673, 2.264361, 0, 0.8196079, 1, 1,
0.06156692, -0.4872819, 3.971812, 0, 0.8156863, 1, 1,
0.06860799, 0.6344287, 1.203247, 0, 0.8078431, 1, 1,
0.07522085, -1.500643, 3.8651, 0, 0.8039216, 1, 1,
0.07647919, -1.473356, 3.752005, 0, 0.7960784, 1, 1,
0.08142067, -0.3191614, 2.643851, 0, 0.7882353, 1, 1,
0.08253694, 0.03443578, 1.483835, 0, 0.7843137, 1, 1,
0.09012482, -0.8859202, 2.315571, 0, 0.7764706, 1, 1,
0.09040005, -0.5042386, 2.736007, 0, 0.772549, 1, 1,
0.09245463, -1.177074, 2.166611, 0, 0.7647059, 1, 1,
0.09562927, 1.148011, 0.7338454, 0, 0.7607843, 1, 1,
0.09592975, 0.01552833, 0.3019063, 0, 0.7529412, 1, 1,
0.09638478, 0.6561949, 0.6012368, 0, 0.7490196, 1, 1,
0.1008954, 0.4500473, -0.69377, 0, 0.7411765, 1, 1,
0.1016431, -0.04812289, 1.866521, 0, 0.7372549, 1, 1,
0.1084242, 0.8052264, -0.5162274, 0, 0.7294118, 1, 1,
0.10854, -1.344086, 5.376486, 0, 0.7254902, 1, 1,
0.1102817, -1.078395, 1.980523, 0, 0.7176471, 1, 1,
0.1114333, -0.5101123, 4.621706, 0, 0.7137255, 1, 1,
0.1114879, -0.2981805, 2.611946, 0, 0.7058824, 1, 1,
0.1116444, 0.7178985, -0.220372, 0, 0.6980392, 1, 1,
0.114901, 0.2773058, -0.2663666, 0, 0.6941177, 1, 1,
0.1184075, -0.6595751, 2.486351, 0, 0.6862745, 1, 1,
0.1198378, 0.1530619, 2.250692, 0, 0.682353, 1, 1,
0.1213978, -0.1583721, 2.026568, 0, 0.6745098, 1, 1,
0.1224246, 0.06046801, 1.036409, 0, 0.6705883, 1, 1,
0.1259977, 0.80289, 0.2825736, 0, 0.6627451, 1, 1,
0.1262619, -0.09883488, 2.337792, 0, 0.6588235, 1, 1,
0.1266641, -1.232168, 3.920448, 0, 0.6509804, 1, 1,
0.128231, -0.4728237, 1.8513, 0, 0.6470588, 1, 1,
0.1315056, -1.507553, 2.988866, 0, 0.6392157, 1, 1,
0.1335825, 0.007244422, 0.4142081, 0, 0.6352941, 1, 1,
0.137276, -1.642191, 3.14618, 0, 0.627451, 1, 1,
0.140718, 0.6653587, -0.6128058, 0, 0.6235294, 1, 1,
0.1413831, 2.006936, -0.005843782, 0, 0.6156863, 1, 1,
0.151443, -0.2099446, 2.166152, 0, 0.6117647, 1, 1,
0.1546802, 0.1946181, 1.471602, 0, 0.6039216, 1, 1,
0.1566381, -2.114568, 2.474241, 0, 0.5960785, 1, 1,
0.1573095, 0.4333813, 1.269434, 0, 0.5921569, 1, 1,
0.1578038, 0.4811719, 0.08653887, 0, 0.5843138, 1, 1,
0.1590866, -0.89135, 2.497847, 0, 0.5803922, 1, 1,
0.1614767, -0.5640645, 1.130795, 0, 0.572549, 1, 1,
0.1654214, -0.5255881, 1.806858, 0, 0.5686275, 1, 1,
0.1658505, 0.4750544, 2.077753, 0, 0.5607843, 1, 1,
0.1702318, -2.021094, 1.070806, 0, 0.5568628, 1, 1,
0.1708774, -1.471426, 3.165303, 0, 0.5490196, 1, 1,
0.1722867, -0.3705677, 0.9619966, 0, 0.5450981, 1, 1,
0.1730289, -0.1219691, 1.701904, 0, 0.5372549, 1, 1,
0.1774509, -0.6374796, 3.907588, 0, 0.5333334, 1, 1,
0.1811029, 0.731369, -0.5042665, 0, 0.5254902, 1, 1,
0.1820212, 0.9016957, -1.31598, 0, 0.5215687, 1, 1,
0.1821774, -0.2666572, 1.839863, 0, 0.5137255, 1, 1,
0.1835376, 0.2270413, -0.3729233, 0, 0.509804, 1, 1,
0.1852077, 0.282395, 2.003372, 0, 0.5019608, 1, 1,
0.1903384, 1.06666, 1.122847, 0, 0.4941176, 1, 1,
0.1906649, 0.9240876, 1.923473, 0, 0.4901961, 1, 1,
0.1963955, 1.175767, -0.9962997, 0, 0.4823529, 1, 1,
0.19826, 1.194106, -0.3364709, 0, 0.4784314, 1, 1,
0.1988805, 1.22709, -0.2578943, 0, 0.4705882, 1, 1,
0.1998, 0.1540842, 1.419265, 0, 0.4666667, 1, 1,
0.2055468, -0.08506116, 2.823971, 0, 0.4588235, 1, 1,
0.2111964, -0.4548564, 2.976905, 0, 0.454902, 1, 1,
0.2120196, 1.361081, -0.3490433, 0, 0.4470588, 1, 1,
0.2135928, 1.426728, -0.1697266, 0, 0.4431373, 1, 1,
0.2154932, -0.7248015, 1.923276, 0, 0.4352941, 1, 1,
0.2178418, -0.5242549, 2.202808, 0, 0.4313726, 1, 1,
0.2193446, -0.7258618, 1.781253, 0, 0.4235294, 1, 1,
0.2195996, 0.3258997, -0.3091292, 0, 0.4196078, 1, 1,
0.2224466, 0.09412754, 0.655827, 0, 0.4117647, 1, 1,
0.2233354, 0.04790454, 2.375493, 0, 0.4078431, 1, 1,
0.2250472, -0.3287786, 1.421477, 0, 0.4, 1, 1,
0.2256837, 0.1893587, 1.187948, 0, 0.3921569, 1, 1,
0.2265461, 0.3571518, -0.3862422, 0, 0.3882353, 1, 1,
0.2297878, 0.187779, 1.233107, 0, 0.3803922, 1, 1,
0.2303862, 2.250597, -0.5228012, 0, 0.3764706, 1, 1,
0.2328647, -0.1839033, 2.41735, 0, 0.3686275, 1, 1,
0.2357319, -0.06347062, 3.242331, 0, 0.3647059, 1, 1,
0.2375979, 1.814313, 0.5158904, 0, 0.3568628, 1, 1,
0.239822, -0.07989907, 2.771315, 0, 0.3529412, 1, 1,
0.2421183, -0.7811318, 3.821834, 0, 0.345098, 1, 1,
0.2446851, 0.5207534, 0.6788964, 0, 0.3411765, 1, 1,
0.2474405, -0.5310712, 3.720331, 0, 0.3333333, 1, 1,
0.2508976, -0.6185308, 2.885601, 0, 0.3294118, 1, 1,
0.2533132, 0.9467022, -1.353253, 0, 0.3215686, 1, 1,
0.2560376, 0.6777532, -0.477925, 0, 0.3176471, 1, 1,
0.2589386, 0.2274815, 0.5084189, 0, 0.3098039, 1, 1,
0.2692323, -0.926642, 4.264057, 0, 0.3058824, 1, 1,
0.2708742, -0.122986, 2.276456, 0, 0.2980392, 1, 1,
0.2715726, 1.045764, -3.71213, 0, 0.2901961, 1, 1,
0.2725834, -0.3051535, 2.761876, 0, 0.2862745, 1, 1,
0.2733877, -0.6360337, 0.7384144, 0, 0.2784314, 1, 1,
0.2748273, -0.6186611, 3.30629, 0, 0.2745098, 1, 1,
0.2748789, 1.64242, -1.973268, 0, 0.2666667, 1, 1,
0.2774917, 1.346367, -0.3825787, 0, 0.2627451, 1, 1,
0.2778022, 0.5298217, -1.210666, 0, 0.254902, 1, 1,
0.2788832, -0.4495588, 1.627588, 0, 0.2509804, 1, 1,
0.2811953, 0.2552702, 1.117163, 0, 0.2431373, 1, 1,
0.2838309, -1.796409, 2.823759, 0, 0.2392157, 1, 1,
0.2850223, -0.2969138, 1.222025, 0, 0.2313726, 1, 1,
0.2887538, 0.6061224, 0.6822498, 0, 0.227451, 1, 1,
0.2914885, 0.2347832, 1.213873, 0, 0.2196078, 1, 1,
0.2926257, -0.5797884, 3.150039, 0, 0.2156863, 1, 1,
0.2932003, -0.8652166, 3.490851, 0, 0.2078431, 1, 1,
0.2934057, 0.952231, -0.06390809, 0, 0.2039216, 1, 1,
0.2937947, 1.012587, -1.65493, 0, 0.1960784, 1, 1,
0.2953023, -2.01536, 2.427454, 0, 0.1882353, 1, 1,
0.3031352, 0.5023562, 1.937157, 0, 0.1843137, 1, 1,
0.3118119, 1.210928, -0.5222539, 0, 0.1764706, 1, 1,
0.3138294, 0.3108724, 1.26713, 0, 0.172549, 1, 1,
0.3179445, -0.3500836, 2.220143, 0, 0.1647059, 1, 1,
0.3199935, -0.8495458, 2.657892, 0, 0.1607843, 1, 1,
0.3222019, -0.5763616, 3.269088, 0, 0.1529412, 1, 1,
0.3224666, -0.4852391, 1.85442, 0, 0.1490196, 1, 1,
0.3235708, -1.058264, 1.733641, 0, 0.1411765, 1, 1,
0.3240618, -0.06276548, 3.036426, 0, 0.1372549, 1, 1,
0.3245699, -1.60785, 3.235956, 0, 0.1294118, 1, 1,
0.3271259, 1.631845, -0.6045551, 0, 0.1254902, 1, 1,
0.3321179, 0.9629382, -1.586885, 0, 0.1176471, 1, 1,
0.341967, 1.781666, 1.079431, 0, 0.1137255, 1, 1,
0.342342, 0.3543227, -0.2462469, 0, 0.1058824, 1, 1,
0.3431416, 0.8493179, 0.547725, 0, 0.09803922, 1, 1,
0.3507538, -1.183989, 1.787717, 0, 0.09411765, 1, 1,
0.3508448, -0.609289, 3.792511, 0, 0.08627451, 1, 1,
0.3513014, 1.631389, 1.229756, 0, 0.08235294, 1, 1,
0.3526094, 0.9734322, 0.5335492, 0, 0.07450981, 1, 1,
0.3526751, 0.03710011, 1.431672, 0, 0.07058824, 1, 1,
0.3536742, -0.2734659, 2.224007, 0, 0.0627451, 1, 1,
0.3603818, -1.261793, 2.693221, 0, 0.05882353, 1, 1,
0.3614905, 1.886909, 0.04644904, 0, 0.05098039, 1, 1,
0.367448, -1.510303, 3.821095, 0, 0.04705882, 1, 1,
0.3678648, -0.7040057, 2.554596, 0, 0.03921569, 1, 1,
0.3723671, 0.2374487, 0.4232362, 0, 0.03529412, 1, 1,
0.3751172, -0.3066306, 1.242234, 0, 0.02745098, 1, 1,
0.3786377, 0.2916614, 2.116883, 0, 0.02352941, 1, 1,
0.3786698, 1.077091, 1.630501, 0, 0.01568628, 1, 1,
0.3825884, 2.106005, 1.024386, 0, 0.01176471, 1, 1,
0.386436, -1.596788, 3.76222, 0, 0.003921569, 1, 1,
0.3901343, -0.3005058, 1.701862, 0.003921569, 0, 1, 1,
0.3915336, 0.5285345, 0.3131208, 0.007843138, 0, 1, 1,
0.3921613, 0.1321513, 0.6592132, 0.01568628, 0, 1, 1,
0.3933437, -0.5512769, 5.045912, 0.01960784, 0, 1, 1,
0.3942534, 1.305225, 0.1215605, 0.02745098, 0, 1, 1,
0.3975806, -2.327116, 2.085185, 0.03137255, 0, 1, 1,
0.4022785, 0.5526946, 1.959527, 0.03921569, 0, 1, 1,
0.4035323, -0.2055261, 1.30621, 0.04313726, 0, 1, 1,
0.4091437, 0.4964074, 1.115013, 0.05098039, 0, 1, 1,
0.4097966, -0.5008003, 2.55505, 0.05490196, 0, 1, 1,
0.4110739, -0.09262623, 5.045502, 0.0627451, 0, 1, 1,
0.4111047, 0.1008403, 1.02942, 0.06666667, 0, 1, 1,
0.4123855, 0.5709805, 0.4774132, 0.07450981, 0, 1, 1,
0.4140015, 0.8319397, -0.4010135, 0.07843138, 0, 1, 1,
0.4149988, 0.6784772, 1.902037, 0.08627451, 0, 1, 1,
0.4157244, 0.8263253, -0.7708947, 0.09019608, 0, 1, 1,
0.416631, -0.8868083, 2.917396, 0.09803922, 0, 1, 1,
0.4175788, 0.5336927, -0.9586677, 0.1058824, 0, 1, 1,
0.4197562, 0.4713004, -1.261101, 0.1098039, 0, 1, 1,
0.4210799, -2.035353, 2.913832, 0.1176471, 0, 1, 1,
0.4212268, 0.3334855, 0.711299, 0.1215686, 0, 1, 1,
0.4252845, 2.238816, 0.5228954, 0.1294118, 0, 1, 1,
0.4382044, 0.06665039, 0.8414035, 0.1333333, 0, 1, 1,
0.4385239, -0.3154949, 3.632843, 0.1411765, 0, 1, 1,
0.43912, -1.119692, 3.756783, 0.145098, 0, 1, 1,
0.4401001, -0.8055268, 2.822946, 0.1529412, 0, 1, 1,
0.4407059, -1.806176, 3.559488, 0.1568628, 0, 1, 1,
0.4466496, -1.960279, 3.025007, 0.1647059, 0, 1, 1,
0.4487798, -0.8156916, 2.18459, 0.1686275, 0, 1, 1,
0.4489377, 1.491625, -0.4690572, 0.1764706, 0, 1, 1,
0.4520498, -0.3636608, 0.9980492, 0.1803922, 0, 1, 1,
0.4548393, 0.4841543, -1.303237, 0.1882353, 0, 1, 1,
0.4595076, -0.9556292, 3.373981, 0.1921569, 0, 1, 1,
0.4605123, 0.172811, 1.493521, 0.2, 0, 1, 1,
0.4648883, -1.125977, 3.368778, 0.2078431, 0, 1, 1,
0.4649711, 1.917961, 0.7322071, 0.2117647, 0, 1, 1,
0.4653561, -0.4495523, 2.432996, 0.2196078, 0, 1, 1,
0.4691873, -0.4687651, 2.879231, 0.2235294, 0, 1, 1,
0.4695844, 0.8476651, 0.01995166, 0.2313726, 0, 1, 1,
0.4743264, 1.293165, 2.123457, 0.2352941, 0, 1, 1,
0.4768126, 0.4716363, 0.6289189, 0.2431373, 0, 1, 1,
0.4768522, 0.8212276, -0.1812438, 0.2470588, 0, 1, 1,
0.4850027, -0.05635237, 1.372258, 0.254902, 0, 1, 1,
0.490598, -1.497974, 6.131749, 0.2588235, 0, 1, 1,
0.4910972, 1.065369, -0.9537718, 0.2666667, 0, 1, 1,
0.491109, -1.684963, 3.00707, 0.2705882, 0, 1, 1,
0.4970421, 0.3146669, 2.81237, 0.2784314, 0, 1, 1,
0.4981076, 0.5709726, 2.125994, 0.282353, 0, 1, 1,
0.4997829, 0.001363605, 0.7117511, 0.2901961, 0, 1, 1,
0.4999441, -0.7220377, 3.367151, 0.2941177, 0, 1, 1,
0.5051756, -1.47613, 2.461406, 0.3019608, 0, 1, 1,
0.5087729, -0.593263, 1.467244, 0.3098039, 0, 1, 1,
0.5113704, 0.6298056, 1.0812, 0.3137255, 0, 1, 1,
0.5134543, -0.06741181, 3.721401, 0.3215686, 0, 1, 1,
0.517788, 1.874427, -0.6688939, 0.3254902, 0, 1, 1,
0.5184423, 1.312477, 0.1867595, 0.3333333, 0, 1, 1,
0.5208988, -0.8401349, 2.86682, 0.3372549, 0, 1, 1,
0.5241026, 2.524576, -1.998627, 0.345098, 0, 1, 1,
0.5295252, 1.685793, -0.2271938, 0.3490196, 0, 1, 1,
0.5347665, 0.9883645, 1.589623, 0.3568628, 0, 1, 1,
0.5348527, 2.791197, 1.807932, 0.3607843, 0, 1, 1,
0.5355238, 0.3602348, 0.2734958, 0.3686275, 0, 1, 1,
0.5524107, -0.1772415, 2.508761, 0.372549, 0, 1, 1,
0.5551212, -1.230999, 3.354737, 0.3803922, 0, 1, 1,
0.5590873, 0.009566217, 1.144264, 0.3843137, 0, 1, 1,
0.5603263, 1.101536, 0.3166833, 0.3921569, 0, 1, 1,
0.5636792, -0.8848392, 2.53876, 0.3960784, 0, 1, 1,
0.5673295, 0.8984513, -0.8687938, 0.4039216, 0, 1, 1,
0.5721484, 0.00409583, 1.635808, 0.4117647, 0, 1, 1,
0.5722477, -0.5940203, 2.418291, 0.4156863, 0, 1, 1,
0.578825, -0.6562406, 2.629365, 0.4235294, 0, 1, 1,
0.5793623, -0.986894, 3.5143, 0.427451, 0, 1, 1,
0.5828307, -0.3884008, 1.388596, 0.4352941, 0, 1, 1,
0.5863615, -0.9781137, 1.258459, 0.4392157, 0, 1, 1,
0.5880902, -0.4967941, 2.656197, 0.4470588, 0, 1, 1,
0.5890864, 0.09304548, 1.84104, 0.4509804, 0, 1, 1,
0.5984988, 0.7155018, 0.6558552, 0.4588235, 0, 1, 1,
0.5997657, -1.729834, 2.625327, 0.4627451, 0, 1, 1,
0.6016874, -0.6434426, 1.874815, 0.4705882, 0, 1, 1,
0.6039652, 0.3167346, -0.1915863, 0.4745098, 0, 1, 1,
0.6048029, -1.290167, 1.546186, 0.4823529, 0, 1, 1,
0.6072304, -1.711423, 2.845548, 0.4862745, 0, 1, 1,
0.6082718, -0.9391329, 1.321339, 0.4941176, 0, 1, 1,
0.6084856, -1.992981, 2.58388, 0.5019608, 0, 1, 1,
0.6094843, 0.8125251, 2.487889, 0.5058824, 0, 1, 1,
0.6113264, -0.03386324, 2.278789, 0.5137255, 0, 1, 1,
0.6128976, 0.6445353, 1.743478, 0.5176471, 0, 1, 1,
0.6158607, 0.954742, 2.542125, 0.5254902, 0, 1, 1,
0.6169639, -0.5032052, 0.6792415, 0.5294118, 0, 1, 1,
0.620078, -0.2177682, 2.110487, 0.5372549, 0, 1, 1,
0.6215179, 0.5385374, 1.536194, 0.5411765, 0, 1, 1,
0.6227446, -0.9332484, 2.384238, 0.5490196, 0, 1, 1,
0.6237177, -0.08114454, 0.9601521, 0.5529412, 0, 1, 1,
0.6246434, -0.6978624, 2.068452, 0.5607843, 0, 1, 1,
0.6277136, 0.1861232, 2.255217, 0.5647059, 0, 1, 1,
0.6293383, 1.272675, 1.109657, 0.572549, 0, 1, 1,
0.632638, 0.3351292, 0.5289683, 0.5764706, 0, 1, 1,
0.6353034, 0.572234, 1.377596, 0.5843138, 0, 1, 1,
0.635758, -0.3534799, 0.410318, 0.5882353, 0, 1, 1,
0.6364489, -0.2189418, 0.5703318, 0.5960785, 0, 1, 1,
0.644752, -0.7668151, 0.9112744, 0.6039216, 0, 1, 1,
0.6472093, 0.0006368331, 0.7719634, 0.6078432, 0, 1, 1,
0.6478408, 1.992239, 1.36027, 0.6156863, 0, 1, 1,
0.6481951, -1.674001, 1.736483, 0.6196079, 0, 1, 1,
0.6531577, -1.060036, 2.708938, 0.627451, 0, 1, 1,
0.653426, -0.2439955, 2.537245, 0.6313726, 0, 1, 1,
0.6561344, 0.05972018, 2.268179, 0.6392157, 0, 1, 1,
0.6581038, 0.6425658, 1.427163, 0.6431373, 0, 1, 1,
0.6608872, 1.179785, 1.238142, 0.6509804, 0, 1, 1,
0.6627443, 0.01834603, 1.556183, 0.654902, 0, 1, 1,
0.662752, 1.223216, 2.546734, 0.6627451, 0, 1, 1,
0.6677246, 0.7292276, -0.09079736, 0.6666667, 0, 1, 1,
0.6726369, 0.1059584, 0.7263569, 0.6745098, 0, 1, 1,
0.6742916, 0.8275775, 0.02219872, 0.6784314, 0, 1, 1,
0.6768059, 0.8041561, 0.3079041, 0.6862745, 0, 1, 1,
0.6816165, -1.075771, 2.774567, 0.6901961, 0, 1, 1,
0.6876563, -0.4049634, -0.5702872, 0.6980392, 0, 1, 1,
0.6900151, 0.4929826, 0.568931, 0.7058824, 0, 1, 1,
0.6912404, -1.026399, 3.477654, 0.7098039, 0, 1, 1,
0.6927367, -0.9511244, 2.205667, 0.7176471, 0, 1, 1,
0.698154, 0.5142038, 1.298287, 0.7215686, 0, 1, 1,
0.7025697, -0.3713944, -0.1125515, 0.7294118, 0, 1, 1,
0.7041547, -0.4790557, 2.986974, 0.7333333, 0, 1, 1,
0.7090486, -0.6042196, 2.74954, 0.7411765, 0, 1, 1,
0.7148795, 0.5973379, -0.1867272, 0.7450981, 0, 1, 1,
0.7150614, -0.09215503, 1.676853, 0.7529412, 0, 1, 1,
0.7176177, -2.051961, 1.110158, 0.7568628, 0, 1, 1,
0.7205376, 0.4367179, 0.2398451, 0.7647059, 0, 1, 1,
0.7209794, 1.020248, -0.0687202, 0.7686275, 0, 1, 1,
0.7234659, 0.3650535, 1.981472, 0.7764706, 0, 1, 1,
0.7243642, 0.830623, -0.1252993, 0.7803922, 0, 1, 1,
0.7298642, 0.8826168, 0.5764421, 0.7882353, 0, 1, 1,
0.7312251, 0.635139, 1.668928, 0.7921569, 0, 1, 1,
0.7388148, -0.2434618, 3.18866, 0.8, 0, 1, 1,
0.7405823, -0.479825, 1.200062, 0.8078431, 0, 1, 1,
0.7431297, 0.4032412, 0.844163, 0.8117647, 0, 1, 1,
0.7472697, -1.013286, 3.841429, 0.8196079, 0, 1, 1,
0.74946, 1.184415, 0.6778125, 0.8235294, 0, 1, 1,
0.7502161, -0.7429912, 2.488086, 0.8313726, 0, 1, 1,
0.7558087, -0.3261603, 3.075325, 0.8352941, 0, 1, 1,
0.7590694, -0.593366, 2.090125, 0.8431373, 0, 1, 1,
0.7623582, 0.1465653, 0.1252246, 0.8470588, 0, 1, 1,
0.7646236, 0.4810969, 0.6255554, 0.854902, 0, 1, 1,
0.7773302, 0.005562372, 4.102442, 0.8588235, 0, 1, 1,
0.7831008, -0.6145608, 1.469874, 0.8666667, 0, 1, 1,
0.7866634, 1.007909, -1.548619, 0.8705882, 0, 1, 1,
0.7875838, -0.1072659, 0.1457198, 0.8784314, 0, 1, 1,
0.7931767, -1.5062, 1.065491, 0.8823529, 0, 1, 1,
0.794645, 0.573548, 0.6252872, 0.8901961, 0, 1, 1,
0.7973433, -0.6043594, 1.659449, 0.8941177, 0, 1, 1,
0.8045828, 1.849851, 0.4610985, 0.9019608, 0, 1, 1,
0.8060746, 0.8301211, 3.319324, 0.9098039, 0, 1, 1,
0.8110988, -0.4343953, 3.374028, 0.9137255, 0, 1, 1,
0.8144886, 0.3818077, 0.8705291, 0.9215686, 0, 1, 1,
0.817271, 0.248157, 1.265801, 0.9254902, 0, 1, 1,
0.8177807, -2.247517, 1.749918, 0.9333333, 0, 1, 1,
0.8180668, 1.413148, -0.07172601, 0.9372549, 0, 1, 1,
0.8195292, 0.2786963, 0.9031419, 0.945098, 0, 1, 1,
0.8323848, -0.04152266, -0.2262635, 0.9490196, 0, 1, 1,
0.8325021, 0.7208644, 0.1676468, 0.9568627, 0, 1, 1,
0.8338582, 1.255548, -0.199615, 0.9607843, 0, 1, 1,
0.8356089, -0.8468583, 3.290115, 0.9686275, 0, 1, 1,
0.8378615, -0.6205603, 1.954649, 0.972549, 0, 1, 1,
0.8429281, -1.595219, 1.93808, 0.9803922, 0, 1, 1,
0.8505636, 0.04928607, 0.5034442, 0.9843137, 0, 1, 1,
0.8527529, 0.1753861, 0.7644154, 0.9921569, 0, 1, 1,
0.8536989, -1.316841, 3.367013, 0.9960784, 0, 1, 1,
0.8685914, -0.7159146, 1.426868, 1, 0, 0.9960784, 1,
0.8737615, -1.72499, 3.253725, 1, 0, 0.9882353, 1,
0.8753288, 0.6841187, 1.849631, 1, 0, 0.9843137, 1,
0.8762127, 0.503926, 1.243213, 1, 0, 0.9764706, 1,
0.8825181, 0.2453952, 0.9154437, 1, 0, 0.972549, 1,
0.8833544, -1.020727, 3.13289, 1, 0, 0.9647059, 1,
0.8873076, -1.402687, 0.2042123, 1, 0, 0.9607843, 1,
0.8889456, 0.9699438, 2.520864, 1, 0, 0.9529412, 1,
0.8906462, 1.379512, -0.8938605, 1, 0, 0.9490196, 1,
0.8919328, 1.745087, 0.5636263, 1, 0, 0.9411765, 1,
0.8921599, -0.1914471, 2.55584, 1, 0, 0.9372549, 1,
0.8961107, 0.9991754, -0.7653001, 1, 0, 0.9294118, 1,
0.8987446, -0.1857952, 1.771182, 1, 0, 0.9254902, 1,
0.903051, 0.02609364, 0.2227672, 1, 0, 0.9176471, 1,
0.9088753, -0.9714713, 2.316622, 1, 0, 0.9137255, 1,
0.9117586, 1.968307, -0.7889874, 1, 0, 0.9058824, 1,
0.9175326, 1.759499, 0.5957285, 1, 0, 0.9019608, 1,
0.9280049, 0.8888752, 0.8208675, 1, 0, 0.8941177, 1,
0.9408094, -0.6781472, 0.3722402, 1, 0, 0.8862745, 1,
0.9420334, 0.6053739, 1.928544, 1, 0, 0.8823529, 1,
0.9488209, 0.7952614, 0.4170525, 1, 0, 0.8745098, 1,
0.9589811, -0.7243037, 2.939229, 1, 0, 0.8705882, 1,
0.9651635, -1.097739, 2.294974, 1, 0, 0.8627451, 1,
0.968156, 1.166281, 0.3790152, 1, 0, 0.8588235, 1,
0.9684531, -0.8634036, 4.011518, 1, 0, 0.8509804, 1,
0.9792833, 0.549383, 0.7945263, 1, 0, 0.8470588, 1,
0.9837933, -0.200865, 2.468996, 1, 0, 0.8392157, 1,
0.9852335, 1.464024, 0.2062918, 1, 0, 0.8352941, 1,
0.9982218, 1.481447, -1.263844, 1, 0, 0.827451, 1,
1.001102, -0.2089188, 2.978175, 1, 0, 0.8235294, 1,
1.007097, 0.4123942, 0.2791314, 1, 0, 0.8156863, 1,
1.007245, -0.3842049, 1.457891, 1, 0, 0.8117647, 1,
1.010933, -0.7886204, 1.816624, 1, 0, 0.8039216, 1,
1.011326, -0.2648702, 1.689794, 1, 0, 0.7960784, 1,
1.011438, -0.02478471, 1.28921, 1, 0, 0.7921569, 1,
1.012491, 0.2360245, -0.3640256, 1, 0, 0.7843137, 1,
1.014662, -0.4839013, 2.257008, 1, 0, 0.7803922, 1,
1.020901, 0.9450312, 0.3438567, 1, 0, 0.772549, 1,
1.023545, 1.300758, 1.653408, 1, 0, 0.7686275, 1,
1.031443, 0.4718972, 2.044193, 1, 0, 0.7607843, 1,
1.045637, -0.4118578, 2.295216, 1, 0, 0.7568628, 1,
1.050576, 0.5505248, 1.465079, 1, 0, 0.7490196, 1,
1.052613, -0.4502586, 1.191447, 1, 0, 0.7450981, 1,
1.055722, -0.4767375, 3.738837, 1, 0, 0.7372549, 1,
1.063261, 0.7542879, 2.30633, 1, 0, 0.7333333, 1,
1.069458, -0.2591321, 2.275729, 1, 0, 0.7254902, 1,
1.073947, -0.7236652, 2.101542, 1, 0, 0.7215686, 1,
1.074092, -1.770238, 2.515873, 1, 0, 0.7137255, 1,
1.077815, -0.3948474, 1.605477, 1, 0, 0.7098039, 1,
1.078793, -0.8372567, 3.153207, 1, 0, 0.7019608, 1,
1.083646, -0.4740239, 1.054544, 1, 0, 0.6941177, 1,
1.085259, 1.551936, -0.1961153, 1, 0, 0.6901961, 1,
1.088425, 0.1070714, 2.538145, 1, 0, 0.682353, 1,
1.098034, 1.487289, -0.4104525, 1, 0, 0.6784314, 1,
1.098512, 1.220175, 0.243667, 1, 0, 0.6705883, 1,
1.099505, -1.766947, 4.455743, 1, 0, 0.6666667, 1,
1.100999, 2.001091, 1.307246, 1, 0, 0.6588235, 1,
1.107571, 0.4101956, 2.081587, 1, 0, 0.654902, 1,
1.11174, -0.3053901, 0.6742542, 1, 0, 0.6470588, 1,
1.113885, -0.5582814, 2.489346, 1, 0, 0.6431373, 1,
1.118766, -1.000705, 2.546268, 1, 0, 0.6352941, 1,
1.123776, -0.4862554, 2.634534, 1, 0, 0.6313726, 1,
1.125522, -0.7520368, 2.517183, 1, 0, 0.6235294, 1,
1.127187, 0.6160429, 1.249374, 1, 0, 0.6196079, 1,
1.138976, 1.062075, 0.03559973, 1, 0, 0.6117647, 1,
1.153713, -0.7844096, 3.368452, 1, 0, 0.6078432, 1,
1.156755, -0.7131602, 1.973198, 1, 0, 0.6, 1,
1.171301, 1.051634, -0.4192334, 1, 0, 0.5921569, 1,
1.184255, -0.9903149, 1.679401, 1, 0, 0.5882353, 1,
1.191594, -0.5700296, 2.289306, 1, 0, 0.5803922, 1,
1.195958, 0.6785264, 0.5011863, 1, 0, 0.5764706, 1,
1.198156, 0.5045767, -0.08387483, 1, 0, 0.5686275, 1,
1.207277, -0.05358306, 1.588762, 1, 0, 0.5647059, 1,
1.217591, 2.365224, 0.8764496, 1, 0, 0.5568628, 1,
1.21899, -0.323845, 1.201414, 1, 0, 0.5529412, 1,
1.223584, 0.194328, 1.779943, 1, 0, 0.5450981, 1,
1.23419, -0.7774989, 1.353448, 1, 0, 0.5411765, 1,
1.255492, -0.9472725, 1.51626, 1, 0, 0.5333334, 1,
1.260239, -0.6824237, 1.403521, 1, 0, 0.5294118, 1,
1.260516, -0.2795612, 1.097478, 1, 0, 0.5215687, 1,
1.261099, -1.752596, 4.491916, 1, 0, 0.5176471, 1,
1.269289, -1.30407, 3.426945, 1, 0, 0.509804, 1,
1.279366, 0.3059105, 3.066262, 1, 0, 0.5058824, 1,
1.282931, -0.4184294, 1.463673, 1, 0, 0.4980392, 1,
1.28626, -1.481298, 1.986985, 1, 0, 0.4901961, 1,
1.28744, -0.3810607, 4.322234, 1, 0, 0.4862745, 1,
1.288889, -0.8800721, 2.715661, 1, 0, 0.4784314, 1,
1.289417, -1.543331, 2.626607, 1, 0, 0.4745098, 1,
1.292168, 1.405586, -0.2717713, 1, 0, 0.4666667, 1,
1.294474, 1.807583, 1.361719, 1, 0, 0.4627451, 1,
1.296849, -0.1807883, 2.369185, 1, 0, 0.454902, 1,
1.309568, 0.3615695, 0.9031104, 1, 0, 0.4509804, 1,
1.323693, -2.116326, 2.904996, 1, 0, 0.4431373, 1,
1.325492, -0.3161732, 2.879354, 1, 0, 0.4392157, 1,
1.326354, 2.55336, 0.7057112, 1, 0, 0.4313726, 1,
1.326725, -0.7455212, 3.031092, 1, 0, 0.427451, 1,
1.350827, 1.077752, 0.1312382, 1, 0, 0.4196078, 1,
1.35374, -1.66449, 3.243648, 1, 0, 0.4156863, 1,
1.364903, -1.445642, 1.817762, 1, 0, 0.4078431, 1,
1.366418, 1.043938, 0.2420068, 1, 0, 0.4039216, 1,
1.375047, -0.4869147, 1.273984, 1, 0, 0.3960784, 1,
1.377303, 0.8284174, 0.0520739, 1, 0, 0.3882353, 1,
1.395764, 0.7643319, 0.6981279, 1, 0, 0.3843137, 1,
1.404915, 2.563221, -0.8843153, 1, 0, 0.3764706, 1,
1.409063, 0.2299471, 0.8611045, 1, 0, 0.372549, 1,
1.411249, -1.30225, 1.655911, 1, 0, 0.3647059, 1,
1.420797, 0.5550644, 1.360472, 1, 0, 0.3607843, 1,
1.421166, 0.5213721, 0.7277905, 1, 0, 0.3529412, 1,
1.4304, -1.448083, 1.178597, 1, 0, 0.3490196, 1,
1.436413, -0.3620761, 2.882329, 1, 0, 0.3411765, 1,
1.438488, 0.2394551, 1.004543, 1, 0, 0.3372549, 1,
1.442503, 1.309939, 2.734937, 1, 0, 0.3294118, 1,
1.463932, -0.2359488, 2.277669, 1, 0, 0.3254902, 1,
1.489548, -0.6337466, 1.984269, 1, 0, 0.3176471, 1,
1.490349, -0.8962123, 2.138218, 1, 0, 0.3137255, 1,
1.501769, -0.1888418, 2.707294, 1, 0, 0.3058824, 1,
1.523194, 0.5568501, 1.097536, 1, 0, 0.2980392, 1,
1.542713, -1.781883, 1.907864, 1, 0, 0.2941177, 1,
1.564396, -1.280382, -0.6403867, 1, 0, 0.2862745, 1,
1.575287, 0.5371367, 1.584383, 1, 0, 0.282353, 1,
1.576, -0.1086192, 1.986682, 1, 0, 0.2745098, 1,
1.578108, -1.37146, 3.027283, 1, 0, 0.2705882, 1,
1.586377, -0.7025973, 1.680109, 1, 0, 0.2627451, 1,
1.595941, 0.2526709, 1.707653, 1, 0, 0.2588235, 1,
1.604209, -0.2412355, 1.979297, 1, 0, 0.2509804, 1,
1.608902, -0.05649557, 0.4013295, 1, 0, 0.2470588, 1,
1.608981, -0.765588, 2.048613, 1, 0, 0.2392157, 1,
1.627661, 0.9625002, 0.04101787, 1, 0, 0.2352941, 1,
1.63284, 1.455965, 0.9879889, 1, 0, 0.227451, 1,
1.642396, 0.2584074, 1.009416, 1, 0, 0.2235294, 1,
1.649342, -0.0738209, 1.069576, 1, 0, 0.2156863, 1,
1.65306, 0.8793862, 3.134211, 1, 0, 0.2117647, 1,
1.67106, 0.8360475, 2.326624, 1, 0, 0.2039216, 1,
1.687533, 0.5327455, 1.211791, 1, 0, 0.1960784, 1,
1.703383, -0.3369309, 1.491013, 1, 0, 0.1921569, 1,
1.715301, 0.5035569, 2.02547, 1, 0, 0.1843137, 1,
1.727749, -1.116852, 3.502947, 1, 0, 0.1803922, 1,
1.733339, 2.210932, 0.1408722, 1, 0, 0.172549, 1,
1.7345, 0.2894805, 2.161887, 1, 0, 0.1686275, 1,
1.745206, 0.2621116, 2.548412, 1, 0, 0.1607843, 1,
1.776393, -1.075887, 1.142554, 1, 0, 0.1568628, 1,
1.777726, -1.880172, 4.747971, 1, 0, 0.1490196, 1,
1.806736, 0.7751221, 1.801216, 1, 0, 0.145098, 1,
1.843133, -0.7765182, 2.466127, 1, 0, 0.1372549, 1,
1.861885, 0.2339707, 1.846155, 1, 0, 0.1333333, 1,
1.889243, -1.202211, 1.252282, 1, 0, 0.1254902, 1,
1.899534, 0.9532155, 0.4638655, 1, 0, 0.1215686, 1,
1.905124, -0.5244856, 0.06569625, 1, 0, 0.1137255, 1,
1.93827, 0.5715087, 0.6007543, 1, 0, 0.1098039, 1,
1.948254, 0.8069103, 0.9351615, 1, 0, 0.1019608, 1,
1.961113, -1.076247, 1.636664, 1, 0, 0.09411765, 1,
1.974197, 0.3431043, 1.388963, 1, 0, 0.09019608, 1,
2.035522, -0.8344139, 0.1898824, 1, 0, 0.08235294, 1,
2.051818, -0.7248073, 1.667961, 1, 0, 0.07843138, 1,
2.075426, 0.1988482, 1.212585, 1, 0, 0.07058824, 1,
2.159655, -0.8768821, 2.789897, 1, 0, 0.06666667, 1,
2.194996, 0.2915272, 3.378143, 1, 0, 0.05882353, 1,
2.274559, -0.3047785, 0.8742182, 1, 0, 0.05490196, 1,
2.293667, 0.4404564, 1.900341, 1, 0, 0.04705882, 1,
2.371115, 0.06726438, 1.353877, 1, 0, 0.04313726, 1,
2.611898, 0.579765, 0.6411768, 1, 0, 0.03529412, 1,
2.672731, -0.8827419, 0.02938183, 1, 0, 0.03137255, 1,
2.744319, 1.299883, 1.68104, 1, 0, 0.02352941, 1,
2.75982, 0.6559159, 1.346476, 1, 0, 0.01960784, 1,
2.8986, 0.558555, 2.021582, 1, 0, 0.01176471, 1,
3.10458, -0.03486644, 2.132173, 1, 0, 0.007843138, 1
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
-0.08326817, -3.633535, -7.522268, 0, -0.5, 0.5, 0.5,
-0.08326817, -3.633535, -7.522268, 1, -0.5, 0.5, 0.5,
-0.08326817, -3.633535, -7.522268, 1, 1.5, 0.5, 0.5,
-0.08326817, -3.633535, -7.522268, 0, 1.5, 0.5, 0.5
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
-4.351797, 0.2637365, -7.522268, 0, -0.5, 0.5, 0.5,
-4.351797, 0.2637365, -7.522268, 1, -0.5, 0.5, 0.5,
-4.351797, 0.2637365, -7.522268, 1, 1.5, 0.5, 0.5,
-4.351797, 0.2637365, -7.522268, 0, 1.5, 0.5, 0.5
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
-4.351797, -3.633535, 0.294204, 0, -0.5, 0.5, 0.5,
-4.351797, -3.633535, 0.294204, 1, -0.5, 0.5, 0.5,
-4.351797, -3.633535, 0.294204, 1, 1.5, 0.5, 0.5,
-4.351797, -3.633535, 0.294204, 0, 1.5, 0.5, 0.5
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
-3, -2.734165, -5.718467,
3, -2.734165, -5.718467,
-3, -2.734165, -5.718467,
-3, -2.88406, -6.019101,
-2, -2.734165, -5.718467,
-2, -2.88406, -6.019101,
-1, -2.734165, -5.718467,
-1, -2.88406, -6.019101,
0, -2.734165, -5.718467,
0, -2.88406, -6.019101,
1, -2.734165, -5.718467,
1, -2.88406, -6.019101,
2, -2.734165, -5.718467,
2, -2.88406, -6.019101,
3, -2.734165, -5.718467,
3, -2.88406, -6.019101
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
-3, -3.18385, -6.620368, 0, -0.5, 0.5, 0.5,
-3, -3.18385, -6.620368, 1, -0.5, 0.5, 0.5,
-3, -3.18385, -6.620368, 1, 1.5, 0.5, 0.5,
-3, -3.18385, -6.620368, 0, 1.5, 0.5, 0.5,
-2, -3.18385, -6.620368, 0, -0.5, 0.5, 0.5,
-2, -3.18385, -6.620368, 1, -0.5, 0.5, 0.5,
-2, -3.18385, -6.620368, 1, 1.5, 0.5, 0.5,
-2, -3.18385, -6.620368, 0, 1.5, 0.5, 0.5,
-1, -3.18385, -6.620368, 0, -0.5, 0.5, 0.5,
-1, -3.18385, -6.620368, 1, -0.5, 0.5, 0.5,
-1, -3.18385, -6.620368, 1, 1.5, 0.5, 0.5,
-1, -3.18385, -6.620368, 0, 1.5, 0.5, 0.5,
0, -3.18385, -6.620368, 0, -0.5, 0.5, 0.5,
0, -3.18385, -6.620368, 1, -0.5, 0.5, 0.5,
0, -3.18385, -6.620368, 1, 1.5, 0.5, 0.5,
0, -3.18385, -6.620368, 0, 1.5, 0.5, 0.5,
1, -3.18385, -6.620368, 0, -0.5, 0.5, 0.5,
1, -3.18385, -6.620368, 1, -0.5, 0.5, 0.5,
1, -3.18385, -6.620368, 1, 1.5, 0.5, 0.5,
1, -3.18385, -6.620368, 0, 1.5, 0.5, 0.5,
2, -3.18385, -6.620368, 0, -0.5, 0.5, 0.5,
2, -3.18385, -6.620368, 1, -0.5, 0.5, 0.5,
2, -3.18385, -6.620368, 1, 1.5, 0.5, 0.5,
2, -3.18385, -6.620368, 0, 1.5, 0.5, 0.5,
3, -3.18385, -6.620368, 0, -0.5, 0.5, 0.5,
3, -3.18385, -6.620368, 1, -0.5, 0.5, 0.5,
3, -3.18385, -6.620368, 1, 1.5, 0.5, 0.5,
3, -3.18385, -6.620368, 0, 1.5, 0.5, 0.5
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
-3.366752, -2, -5.718467,
-3.366752, 3, -5.718467,
-3.366752, -2, -5.718467,
-3.530926, -2, -6.019101,
-3.366752, -1, -5.718467,
-3.530926, -1, -6.019101,
-3.366752, 0, -5.718467,
-3.530926, 0, -6.019101,
-3.366752, 1, -5.718467,
-3.530926, 1, -6.019101,
-3.366752, 2, -5.718467,
-3.530926, 2, -6.019101,
-3.366752, 3, -5.718467,
-3.530926, 3, -6.019101
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
-3.859275, -2, -6.620368, 0, -0.5, 0.5, 0.5,
-3.859275, -2, -6.620368, 1, -0.5, 0.5, 0.5,
-3.859275, -2, -6.620368, 1, 1.5, 0.5, 0.5,
-3.859275, -2, -6.620368, 0, 1.5, 0.5, 0.5,
-3.859275, -1, -6.620368, 0, -0.5, 0.5, 0.5,
-3.859275, -1, -6.620368, 1, -0.5, 0.5, 0.5,
-3.859275, -1, -6.620368, 1, 1.5, 0.5, 0.5,
-3.859275, -1, -6.620368, 0, 1.5, 0.5, 0.5,
-3.859275, 0, -6.620368, 0, -0.5, 0.5, 0.5,
-3.859275, 0, -6.620368, 1, -0.5, 0.5, 0.5,
-3.859275, 0, -6.620368, 1, 1.5, 0.5, 0.5,
-3.859275, 0, -6.620368, 0, 1.5, 0.5, 0.5,
-3.859275, 1, -6.620368, 0, -0.5, 0.5, 0.5,
-3.859275, 1, -6.620368, 1, -0.5, 0.5, 0.5,
-3.859275, 1, -6.620368, 1, 1.5, 0.5, 0.5,
-3.859275, 1, -6.620368, 0, 1.5, 0.5, 0.5,
-3.859275, 2, -6.620368, 0, -0.5, 0.5, 0.5,
-3.859275, 2, -6.620368, 1, -0.5, 0.5, 0.5,
-3.859275, 2, -6.620368, 1, 1.5, 0.5, 0.5,
-3.859275, 2, -6.620368, 0, 1.5, 0.5, 0.5,
-3.859275, 3, -6.620368, 0, -0.5, 0.5, 0.5,
-3.859275, 3, -6.620368, 1, -0.5, 0.5, 0.5,
-3.859275, 3, -6.620368, 1, 1.5, 0.5, 0.5,
-3.859275, 3, -6.620368, 0, 1.5, 0.5, 0.5
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
-3.366752, -2.734165, -4,
-3.366752, -2.734165, 6,
-3.366752, -2.734165, -4,
-3.530926, -2.88406, -4,
-3.366752, -2.734165, -2,
-3.530926, -2.88406, -2,
-3.366752, -2.734165, 0,
-3.530926, -2.88406, 0,
-3.366752, -2.734165, 2,
-3.530926, -2.88406, 2,
-3.366752, -2.734165, 4,
-3.530926, -2.88406, 4,
-3.366752, -2.734165, 6,
-3.530926, -2.88406, 6
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
"4",
"6"
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
-3.859275, -3.18385, -4, 0, -0.5, 0.5, 0.5,
-3.859275, -3.18385, -4, 1, -0.5, 0.5, 0.5,
-3.859275, -3.18385, -4, 1, 1.5, 0.5, 0.5,
-3.859275, -3.18385, -4, 0, 1.5, 0.5, 0.5,
-3.859275, -3.18385, -2, 0, -0.5, 0.5, 0.5,
-3.859275, -3.18385, -2, 1, -0.5, 0.5, 0.5,
-3.859275, -3.18385, -2, 1, 1.5, 0.5, 0.5,
-3.859275, -3.18385, -2, 0, 1.5, 0.5, 0.5,
-3.859275, -3.18385, 0, 0, -0.5, 0.5, 0.5,
-3.859275, -3.18385, 0, 1, -0.5, 0.5, 0.5,
-3.859275, -3.18385, 0, 1, 1.5, 0.5, 0.5,
-3.859275, -3.18385, 0, 0, 1.5, 0.5, 0.5,
-3.859275, -3.18385, 2, 0, -0.5, 0.5, 0.5,
-3.859275, -3.18385, 2, 1, -0.5, 0.5, 0.5,
-3.859275, -3.18385, 2, 1, 1.5, 0.5, 0.5,
-3.859275, -3.18385, 2, 0, 1.5, 0.5, 0.5,
-3.859275, -3.18385, 4, 0, -0.5, 0.5, 0.5,
-3.859275, -3.18385, 4, 1, -0.5, 0.5, 0.5,
-3.859275, -3.18385, 4, 1, 1.5, 0.5, 0.5,
-3.859275, -3.18385, 4, 0, 1.5, 0.5, 0.5,
-3.859275, -3.18385, 6, 0, -0.5, 0.5, 0.5,
-3.859275, -3.18385, 6, 1, -0.5, 0.5, 0.5,
-3.859275, -3.18385, 6, 1, 1.5, 0.5, 0.5,
-3.859275, -3.18385, 6, 0, 1.5, 0.5, 0.5
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
-3.366752, -2.734165, -5.718467,
-3.366752, 3.261638, -5.718467,
-3.366752, -2.734165, 6.306875,
-3.366752, 3.261638, 6.306875,
-3.366752, -2.734165, -5.718467,
-3.366752, -2.734165, 6.306875,
-3.366752, 3.261638, -5.718467,
-3.366752, 3.261638, 6.306875,
-3.366752, -2.734165, -5.718467,
3.200216, -2.734165, -5.718467,
-3.366752, -2.734165, 6.306875,
3.200216, -2.734165, 6.306875,
-3.366752, 3.261638, -5.718467,
3.200216, 3.261638, -5.718467,
-3.366752, 3.261638, 6.306875,
3.200216, 3.261638, 6.306875,
3.200216, -2.734165, -5.718467,
3.200216, 3.261638, -5.718467,
3.200216, -2.734165, 6.306875,
3.200216, 3.261638, 6.306875,
3.200216, -2.734165, -5.718467,
3.200216, -2.734165, 6.306875,
3.200216, 3.261638, -5.718467,
3.200216, 3.261638, 6.306875
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
var radius = 7.986243;
var distance = 35.5317;
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
mvMatrix.translate( 0.08326817, -0.2637365, -0.294204 );
mvMatrix.scale( 1.314896, 1.440155, 0.7180571 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.5317);
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
Etomidate<-read.table("Etomidate.xyz", skip=1)
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
-3.271116, -2.313596, -1.073584, 0, 0, 1, 1, 1,
-3.09059, 1.153936, -2.640466, 1, 0, 0, 1, 1,
-2.756876, 0.2856493, -0.8767655, 1, 0, 0, 1, 1,
-2.725006, 0.9166615, -0.07806413, 1, 0, 0, 1, 1,
-2.609673, 0.2345873, -2.375725, 1, 0, 0, 1, 1,
-2.595625, -1.023571, -3.194915, 1, 0, 0, 1, 1,
-2.507919, -1.700317, -1.307523, 0, 0, 0, 1, 1,
-2.504492, 1.054047, -0.6203694, 0, 0, 0, 1, 1,
-2.456159, 0.9623886, -1.117531, 0, 0, 0, 1, 1,
-2.431311, 0.2079232, -1.2357, 0, 0, 0, 1, 1,
-2.419228, 1.635167, -1.035389, 0, 0, 0, 1, 1,
-2.370887, -0.1488127, -0.8483395, 0, 0, 0, 1, 1,
-2.34212, -0.5338277, -2.167333, 0, 0, 0, 1, 1,
-2.331572, -1.148165, -1.374146, 1, 1, 1, 1, 1,
-2.306225, -0.3791912, -3.254701, 1, 1, 1, 1, 1,
-2.303221, 1.681967, -0.6906746, 1, 1, 1, 1, 1,
-2.302802, -1.880193, -2.085601, 1, 1, 1, 1, 1,
-2.231076, 0.4652548, -2.3877, 1, 1, 1, 1, 1,
-2.224469, 0.1650331, -1.126033, 1, 1, 1, 1, 1,
-2.220758, 0.4881712, -1.025911, 1, 1, 1, 1, 1,
-2.214347, 1.431725, -0.8188772, 1, 1, 1, 1, 1,
-2.197587, -0.02172712, -1.263384, 1, 1, 1, 1, 1,
-2.15721, -0.6869044, -3.304169, 1, 1, 1, 1, 1,
-2.111653, -0.8741977, -0.9420154, 1, 1, 1, 1, 1,
-2.088091, -0.516251, -4.077644, 1, 1, 1, 1, 1,
-2.073506, -0.0984194, -0.9476383, 1, 1, 1, 1, 1,
-2.04717, -0.6484454, -2.399717, 1, 1, 1, 1, 1,
-2.036414, -0.4596142, -0.6273072, 1, 1, 1, 1, 1,
-2.024602, 0.9838015, -2.481855, 0, 0, 1, 1, 1,
-2.003092, -1.393046, -2.217741, 1, 0, 0, 1, 1,
-1.975976, 1.515475, -0.9070852, 1, 0, 0, 1, 1,
-1.955348, -0.2379394, -1.646087, 1, 0, 0, 1, 1,
-1.93807, -0.9842987, -1.307905, 1, 0, 0, 1, 1,
-1.92523, -0.9246863, -1.361975, 1, 0, 0, 1, 1,
-1.910844, -0.3975609, -1.578178, 0, 0, 0, 1, 1,
-1.896545, -1.040331, -2.258183, 0, 0, 0, 1, 1,
-1.889599, -1.122722, -1.333623, 0, 0, 0, 1, 1,
-1.873247, 0.5906145, -1.467205, 0, 0, 0, 1, 1,
-1.847515, 1.17777, -0.8996047, 0, 0, 0, 1, 1,
-1.832014, -0.2437333, -2.407703, 0, 0, 0, 1, 1,
-1.828383, 0.7948449, 0.4384818, 0, 0, 0, 1, 1,
-1.82252, -0.3973998, -0.9605768, 1, 1, 1, 1, 1,
-1.817186, -0.7808138, -1.883727, 1, 1, 1, 1, 1,
-1.816871, -0.06114852, -0.2253158, 1, 1, 1, 1, 1,
-1.811484, -1.173823, -1.737471, 1, 1, 1, 1, 1,
-1.797404, 1.645933, -1.755724, 1, 1, 1, 1, 1,
-1.79326, 0.8231359, -1.008615, 1, 1, 1, 1, 1,
-1.7775, -0.2628762, -3.270561, 1, 1, 1, 1, 1,
-1.767752, -1.156132, -2.103845, 1, 1, 1, 1, 1,
-1.76592, -0.9550103, -2.986659, 1, 1, 1, 1, 1,
-1.765869, -1.282814, -3.279737, 1, 1, 1, 1, 1,
-1.754896, 0.8904592, -0.5570888, 1, 1, 1, 1, 1,
-1.7469, 0.3239112, -1.244642, 1, 1, 1, 1, 1,
-1.741176, -0.5406307, -1.133451, 1, 1, 1, 1, 1,
-1.710747, 0.5125858, -3.791801, 1, 1, 1, 1, 1,
-1.69454, -0.02040244, -2.966919, 1, 1, 1, 1, 1,
-1.672392, -0.6059095, -3.26435, 0, 0, 1, 1, 1,
-1.642099, 0.2307107, -1.630335, 1, 0, 0, 1, 1,
-1.638368, 1.217836, -1.932384, 1, 0, 0, 1, 1,
-1.631333, -0.6262502, -4.470448, 1, 0, 0, 1, 1,
-1.625918, -0.6495246, -1.657151, 1, 0, 0, 1, 1,
-1.624598, -0.3651431, -2.542236, 1, 0, 0, 1, 1,
-1.610275, 0.608881, -3.003334, 0, 0, 0, 1, 1,
-1.607626, 0.8643913, -0.4152457, 0, 0, 0, 1, 1,
-1.606791, 0.5859138, -0.8763488, 0, 0, 0, 1, 1,
-1.604776, 0.5450512, -0.8504014, 0, 0, 0, 1, 1,
-1.564148, 0.06240314, -1.146084, 0, 0, 0, 1, 1,
-1.562157, 0.9067041, -2.080742, 0, 0, 0, 1, 1,
-1.560804, 0.09563778, 0.01558264, 0, 0, 0, 1, 1,
-1.554768, -0.6345971, -0.9475427, 1, 1, 1, 1, 1,
-1.55056, -1.191405, -3.713241, 1, 1, 1, 1, 1,
-1.549236, -0.544573, -1.790688, 1, 1, 1, 1, 1,
-1.547124, -0.2393552, -1.466401, 1, 1, 1, 1, 1,
-1.540621, -1.169072, -0.8000247, 1, 1, 1, 1, 1,
-1.538851, -0.5924079, -1.979769, 1, 1, 1, 1, 1,
-1.538251, -0.4233542, -2.89034, 1, 1, 1, 1, 1,
-1.536297, -1.571468, -2.565881, 1, 1, 1, 1, 1,
-1.526359, 0.4192717, -0.4239914, 1, 1, 1, 1, 1,
-1.524778, 0.5821072, -0.682698, 1, 1, 1, 1, 1,
-1.522201, 1.294469, -1.113302, 1, 1, 1, 1, 1,
-1.520047, 1.545989, -1.117211, 1, 1, 1, 1, 1,
-1.491651, 0.252863, -0.8704976, 1, 1, 1, 1, 1,
-1.463751, -1.755142, -1.564184, 1, 1, 1, 1, 1,
-1.463505, -1.558896, -1.64292, 1, 1, 1, 1, 1,
-1.456677, -0.3706926, -2.216267, 0, 0, 1, 1, 1,
-1.456341, -0.004869063, 1.042406, 1, 0, 0, 1, 1,
-1.44578, -0.4628365, -1.899522, 1, 0, 0, 1, 1,
-1.438471, 0.1927657, -3.347426, 1, 0, 0, 1, 1,
-1.435079, -0.3602658, -1.820288, 1, 0, 0, 1, 1,
-1.421532, -0.2943382, -1.636467, 1, 0, 0, 1, 1,
-1.413695, 0.3461307, -1.695516, 0, 0, 0, 1, 1,
-1.412075, -0.6173335, -3.376806, 0, 0, 0, 1, 1,
-1.408427, -0.5576602, -1.627494, 0, 0, 0, 1, 1,
-1.407472, 0.06074696, -0.9439734, 0, 0, 0, 1, 1,
-1.407175, -0.6441209, -0.8460117, 0, 0, 0, 1, 1,
-1.397832, 0.5586777, 0.250183, 0, 0, 0, 1, 1,
-1.397676, 0.623137, -2.037256, 0, 0, 0, 1, 1,
-1.395013, -1.063077, -2.316209, 1, 1, 1, 1, 1,
-1.391418, 0.950516, -0.649862, 1, 1, 1, 1, 1,
-1.38632, -0.5666876, -1.948141, 1, 1, 1, 1, 1,
-1.376816, -0.4363269, -0.2293904, 1, 1, 1, 1, 1,
-1.372609, 0.4766665, 0.3600242, 1, 1, 1, 1, 1,
-1.363706, -1.173835, -0.7012889, 1, 1, 1, 1, 1,
-1.355951, -0.695682, -3.568134, 1, 1, 1, 1, 1,
-1.351318, 0.7326775, -3.71501, 1, 1, 1, 1, 1,
-1.34964, 0.5829756, -0.2089327, 1, 1, 1, 1, 1,
-1.348948, 1.159092, -1.418549, 1, 1, 1, 1, 1,
-1.346814, -0.4408773, -1.143455, 1, 1, 1, 1, 1,
-1.329227, -0.2013701, -3.648507, 1, 1, 1, 1, 1,
-1.320803, -1.4501, -2.203631, 1, 1, 1, 1, 1,
-1.317214, -0.473418, -1.984919, 1, 1, 1, 1, 1,
-1.309297, 0.2508481, -2.000615, 1, 1, 1, 1, 1,
-1.307382, -0.7349709, -2.14928, 0, 0, 1, 1, 1,
-1.300907, 0.1212416, -1.444539, 1, 0, 0, 1, 1,
-1.283005, 0.9692493, -1.418692, 1, 0, 0, 1, 1,
-1.282148, 0.3386826, -1.51909, 1, 0, 0, 1, 1,
-1.251929, 0.1498704, -2.408686, 1, 0, 0, 1, 1,
-1.25102, -1.523733, -2.518849, 1, 0, 0, 1, 1,
-1.243898, -0.172005, -2.423696, 0, 0, 0, 1, 1,
-1.227324, -0.2300816, -1.169226, 0, 0, 0, 1, 1,
-1.21422, 0.4371563, -1.792763, 0, 0, 0, 1, 1,
-1.210577, 1.021595, -0.7286876, 0, 0, 0, 1, 1,
-1.208332, 2.302999, 0.3247352, 0, 0, 0, 1, 1,
-1.207687, 1.759894, -0.3504251, 0, 0, 0, 1, 1,
-1.202651, -1.28012, -2.699589, 0, 0, 0, 1, 1,
-1.197522, -0.06219403, -1.582187, 1, 1, 1, 1, 1,
-1.193839, -1.050335, -1.342479, 1, 1, 1, 1, 1,
-1.188074, -0.4488028, -0.8575011, 1, 1, 1, 1, 1,
-1.179255, 1.028128, -1.652434, 1, 1, 1, 1, 1,
-1.177684, 0.921147, -1.811312, 1, 1, 1, 1, 1,
-1.177147, 1.134373, -0.003814165, 1, 1, 1, 1, 1,
-1.165787, -0.7092689, -1.668671, 1, 1, 1, 1, 1,
-1.165339, 0.3736914, -3.347868, 1, 1, 1, 1, 1,
-1.162469, 0.3604475, 0.05277114, 1, 1, 1, 1, 1,
-1.158255, -0.4687696, -1.980154, 1, 1, 1, 1, 1,
-1.149626, 1.405206, -1.773941, 1, 1, 1, 1, 1,
-1.146353, 1.257353, -0.6174351, 1, 1, 1, 1, 1,
-1.142855, -0.05524843, -2.425423, 1, 1, 1, 1, 1,
-1.13705, -0.3457505, -1.900294, 1, 1, 1, 1, 1,
-1.135143, 1.165391, -1.023549, 1, 1, 1, 1, 1,
-1.134267, -0.7852879, -2.950087, 0, 0, 1, 1, 1,
-1.127662, -0.08429872, -2.762872, 1, 0, 0, 1, 1,
-1.125542, 0.5315011, -1.131935, 1, 0, 0, 1, 1,
-1.125473, -1.302215, -1.43382, 1, 0, 0, 1, 1,
-1.123308, -0.1266859, -0.9151114, 1, 0, 0, 1, 1,
-1.123192, -1.193653, -2.131318, 1, 0, 0, 1, 1,
-1.122838, -0.06037226, -1.168201, 0, 0, 0, 1, 1,
-1.121922, -0.0107359, -0.7666601, 0, 0, 0, 1, 1,
-1.121371, 0.03096887, -1.228232, 0, 0, 0, 1, 1,
-1.104715, 0.6959661, -1.533228, 0, 0, 0, 1, 1,
-1.102583, 1.297078, 1.007202, 0, 0, 0, 1, 1,
-1.100536, 0.3032841, 0.3144949, 0, 0, 0, 1, 1,
-1.098359, 0.9654713, -1.4179, 0, 0, 0, 1, 1,
-1.092824, -1.539944, -5.262536, 1, 1, 1, 1, 1,
-1.087377, -0.2915812, -1.562109, 1, 1, 1, 1, 1,
-1.085683, -0.242341, -3.361695, 1, 1, 1, 1, 1,
-1.084735, -1.489152, -3.608692, 1, 1, 1, 1, 1,
-1.077792, 2.097069, -1.170254, 1, 1, 1, 1, 1,
-1.060645, -0.00399424, -3.214425, 1, 1, 1, 1, 1,
-1.059924, 0.6291437, -0.9033158, 1, 1, 1, 1, 1,
-1.059235, -0.2751351, -0.8401191, 1, 1, 1, 1, 1,
-1.058807, 1.074147, -2.839407, 1, 1, 1, 1, 1,
-1.058305, 0.3971878, -0.8551929, 1, 1, 1, 1, 1,
-1.05463, 0.5021167, -3.381286, 1, 1, 1, 1, 1,
-1.052938, -0.09402082, -0.8833501, 1, 1, 1, 1, 1,
-1.052805, -2.646847, -3.131798, 1, 1, 1, 1, 1,
-1.048866, -0.4836357, -0.5306091, 1, 1, 1, 1, 1,
-1.034371, -1.249371, -2.953595, 1, 1, 1, 1, 1,
-1.027954, 1.582901, 0.2385391, 0, 0, 1, 1, 1,
-0.9978271, 0.3572, -2.09919, 1, 0, 0, 1, 1,
-0.9871116, 0.1011624, -1.2946, 1, 0, 0, 1, 1,
-0.9750142, 0.08171184, -1.430549, 1, 0, 0, 1, 1,
-0.9744323, -0.5804008, -2.831798, 1, 0, 0, 1, 1,
-0.9629052, -1.991372, -2.087727, 1, 0, 0, 1, 1,
-0.9546862, 0.4706362, -1.872237, 0, 0, 0, 1, 1,
-0.9530153, -1.322026, -3.799499, 0, 0, 0, 1, 1,
-0.9464877, -0.2308021, -1.725442, 0, 0, 0, 1, 1,
-0.9458673, 1.3717, 0.4560168, 0, 0, 0, 1, 1,
-0.9451424, 0.5104348, -0.3315553, 0, 0, 0, 1, 1,
-0.9398333, -0.9662259, -2.056095, 0, 0, 0, 1, 1,
-0.9394583, 2.515643, 0.02389109, 0, 0, 0, 1, 1,
-0.9383053, -0.1149473, -2.08481, 1, 1, 1, 1, 1,
-0.9350677, -0.2969577, -2.461269, 1, 1, 1, 1, 1,
-0.9325849, 1.946695, -0.9988853, 1, 1, 1, 1, 1,
-0.9322304, -0.08650389, -1.431285, 1, 1, 1, 1, 1,
-0.9230195, 0.004680999, -0.8060192, 1, 1, 1, 1, 1,
-0.9216815, -0.5491693, -2.904609, 1, 1, 1, 1, 1,
-0.9215295, -0.2094935, -3.250028, 1, 1, 1, 1, 1,
-0.9200934, -1.471849, -4.153523, 1, 1, 1, 1, 1,
-0.9170726, -0.002302506, -1.972334, 1, 1, 1, 1, 1,
-0.9170505, 1.040852, -0.2436662, 1, 1, 1, 1, 1,
-0.9160622, -0.07775494, -2.234894, 1, 1, 1, 1, 1,
-0.9093152, -0.8036521, -1.924344, 1, 1, 1, 1, 1,
-0.9074449, 0.1496113, -0.2247608, 1, 1, 1, 1, 1,
-0.9058275, -0.310477, -1.895275, 1, 1, 1, 1, 1,
-0.9002833, 1.456075, 0.2640638, 1, 1, 1, 1, 1,
-0.8972066, -0.4544201, -2.484305, 0, 0, 1, 1, 1,
-0.8895401, 1.474135, -1.800559, 1, 0, 0, 1, 1,
-0.8681427, 0.7494795, 0.5217154, 1, 0, 0, 1, 1,
-0.8591576, 0.2144963, -1.068551, 1, 0, 0, 1, 1,
-0.854829, -0.7861035, -1.91261, 1, 0, 0, 1, 1,
-0.8534873, -1.127482, -1.794451, 1, 0, 0, 1, 1,
-0.8531199, -0.7605244, -2.779862, 0, 0, 0, 1, 1,
-0.8530513, 0.4929889, -2.054775, 0, 0, 0, 1, 1,
-0.8490751, -0.3671945, -1.878864, 0, 0, 0, 1, 1,
-0.8447084, 1.093994, -2.19069, 0, 0, 0, 1, 1,
-0.8378876, 0.2600303, -0.7882046, 0, 0, 0, 1, 1,
-0.8374342, -2.075527, -1.206286, 0, 0, 0, 1, 1,
-0.8274559, -0.7047482, -1.228407, 0, 0, 0, 1, 1,
-0.825182, 2.420125, 0.8936816, 1, 1, 1, 1, 1,
-0.8221295, 1.011772, -0.4747511, 1, 1, 1, 1, 1,
-0.8217866, -0.5555139, -2.576553, 1, 1, 1, 1, 1,
-0.8159741, -0.7998417, -1.516579, 1, 1, 1, 1, 1,
-0.8152809, 0.6820499, -0.9419914, 1, 1, 1, 1, 1,
-0.811338, -0.1906738, -0.2253432, 1, 1, 1, 1, 1,
-0.8101879, 0.1495275, -2.065141, 1, 1, 1, 1, 1,
-0.8078821, 1.171212, -0.1846615, 1, 1, 1, 1, 1,
-0.7997184, 0.694991, -0.5451092, 1, 1, 1, 1, 1,
-0.798927, -1.022904, -1.823184, 1, 1, 1, 1, 1,
-0.7962334, 1.741876, -1.791914, 1, 1, 1, 1, 1,
-0.7861583, -0.442525, -1.287356, 1, 1, 1, 1, 1,
-0.7822738, -0.1587746, -2.748336, 1, 1, 1, 1, 1,
-0.780046, 0.2889531, -1.931261, 1, 1, 1, 1, 1,
-0.7797326, -1.099313, -2.845335, 1, 1, 1, 1, 1,
-0.7775263, 0.274505, -0.5112979, 0, 0, 1, 1, 1,
-0.7772093, -0.2465732, -1.951951, 1, 0, 0, 1, 1,
-0.7716938, -1.303682, -2.544497, 1, 0, 0, 1, 1,
-0.7716081, 2.582413, -2.420064, 1, 0, 0, 1, 1,
-0.76151, -0.1019563, -2.333117, 1, 0, 0, 1, 1,
-0.7606468, -0.8219467, -4.04306, 1, 0, 0, 1, 1,
-0.7597087, -0.98205, -2.588992, 0, 0, 0, 1, 1,
-0.7500819, 0.8474357, 1.258141, 0, 0, 0, 1, 1,
-0.7483861, -1.553494, -2.352354, 0, 0, 0, 1, 1,
-0.7418927, -0.7472981, -1.527692, 0, 0, 0, 1, 1,
-0.7375461, 1.32013, -3.471168, 0, 0, 0, 1, 1,
-0.7372552, -0.8287101, -2.40723, 0, 0, 0, 1, 1,
-0.7360865, 0.9683256, -0.4301983, 0, 0, 0, 1, 1,
-0.7350053, -0.8115381, -2.279572, 1, 1, 1, 1, 1,
-0.7339017, 0.05759265, -1.924541, 1, 1, 1, 1, 1,
-0.7242908, -2.125103, -2.441584, 1, 1, 1, 1, 1,
-0.7238289, -0.2139136, -2.701551, 1, 1, 1, 1, 1,
-0.7231502, -0.8856189, -2.783842, 1, 1, 1, 1, 1,
-0.7211804, 0.1055171, -1.603507, 1, 1, 1, 1, 1,
-0.7195325, -0.9772948, -0.9941077, 1, 1, 1, 1, 1,
-0.7193238, 0.9490133, -2.578666, 1, 1, 1, 1, 1,
-0.7171277, 0.02288284, -0.7758839, 1, 1, 1, 1, 1,
-0.7115452, 2.036135, -0.0218424, 1, 1, 1, 1, 1,
-0.7010087, -1.730088, -2.59041, 1, 1, 1, 1, 1,
-0.7008405, 0.2557745, -0.5575097, 1, 1, 1, 1, 1,
-0.7006925, -0.8332169, -1.158965, 1, 1, 1, 1, 1,
-0.7002901, -0.0569764, -1.616292, 1, 1, 1, 1, 1,
-0.692966, -0.9120497, -0.7970757, 1, 1, 1, 1, 1,
-0.6921664, 0.009340724, 0.7518132, 0, 0, 1, 1, 1,
-0.6900088, -0.944488, -1.835541, 1, 0, 0, 1, 1,
-0.6877018, 2.265282, 2.436383, 1, 0, 0, 1, 1,
-0.6856086, -1.18887, -1.917174, 1, 0, 0, 1, 1,
-0.6853694, -1.075208, -2.91106, 1, 0, 0, 1, 1,
-0.6829715, -0.2981679, -0.2155134, 1, 0, 0, 1, 1,
-0.6748444, -1.072543, -3.160401, 0, 0, 0, 1, 1,
-0.667659, -1.304816, -2.190254, 0, 0, 0, 1, 1,
-0.659906, 0.3137171, -0.3827038, 0, 0, 0, 1, 1,
-0.6551328, 1.179427, 0.4198587, 0, 0, 0, 1, 1,
-0.6534159, -0.05438329, -1.042241, 0, 0, 0, 1, 1,
-0.6515333, -0.7026564, -2.29052, 0, 0, 0, 1, 1,
-0.646093, 1.101787, -0.6899792, 0, 0, 0, 1, 1,
-0.6456332, -0.7761216, -1.534652, 1, 1, 1, 1, 1,
-0.6443151, -0.06007389, -1.923873, 1, 1, 1, 1, 1,
-0.6385981, 1.095443, 0.2667498, 1, 1, 1, 1, 1,
-0.6380913, -0.4532048, -1.282161, 1, 1, 1, 1, 1,
-0.636815, -0.6290833, -2.078296, 1, 1, 1, 1, 1,
-0.6326749, -0.2322724, -2.426078, 1, 1, 1, 1, 1,
-0.632226, -1.457999, -1.590604, 1, 1, 1, 1, 1,
-0.6289341, 0.2093426, -0.3034972, 1, 1, 1, 1, 1,
-0.6279982, 0.8650593, -0.9723824, 1, 1, 1, 1, 1,
-0.6205354, -1.36688, -2.380452, 1, 1, 1, 1, 1,
-0.6204276, -0.1711966, -1.054662, 1, 1, 1, 1, 1,
-0.6196659, 0.8514735, -1.457681, 1, 1, 1, 1, 1,
-0.616249, -1.341655, -3.086281, 1, 1, 1, 1, 1,
-0.6143342, 0.7949385, -1.812467, 1, 1, 1, 1, 1,
-0.6142318, 1.79875, 1.14353, 1, 1, 1, 1, 1,
-0.6140282, -2.123216, -3.455881, 0, 0, 1, 1, 1,
-0.6092983, -1.014848, -3.784205, 1, 0, 0, 1, 1,
-0.6092679, 2.968347, -0.1913694, 1, 0, 0, 1, 1,
-0.6019328, -0.9477986, -2.078689, 1, 0, 0, 1, 1,
-0.5932386, 0.01034812, -1.56276, 1, 0, 0, 1, 1,
-0.5909295, 1.532595, -2.202831, 1, 0, 0, 1, 1,
-0.5870278, -0.7028099, -1.431284, 0, 0, 0, 1, 1,
-0.5861039, 0.1286424, -0.6376569, 0, 0, 0, 1, 1,
-0.5853055, -0.4131189, 0.6530534, 0, 0, 0, 1, 1,
-0.5811038, 0.5646312, -1.86414, 0, 0, 0, 1, 1,
-0.579114, -1.175534, -2.527703, 0, 0, 0, 1, 1,
-0.5759249, 0.3984469, -1.75275, 0, 0, 0, 1, 1,
-0.5734929, -0.7434027, -1.114951, 0, 0, 0, 1, 1,
-0.5711484, 1.748025, 0.1442292, 1, 1, 1, 1, 1,
-0.5698097, 1.406238, -0.3262397, 1, 1, 1, 1, 1,
-0.5682552, -0.1292661, -2.89559, 1, 1, 1, 1, 1,
-0.5569557, -0.3276276, -1.393537, 1, 1, 1, 1, 1,
-0.5566863, 1.308071, 0.1855942, 1, 1, 1, 1, 1,
-0.556096, -1.201675, -2.666307, 1, 1, 1, 1, 1,
-0.5490509, -2.362834, -1.997235, 1, 1, 1, 1, 1,
-0.543684, 0.649966, -1.358954, 1, 1, 1, 1, 1,
-0.540313, -0.5857129, -2.748543, 1, 1, 1, 1, 1,
-0.537591, 0.8618601, 0.8286499, 1, 1, 1, 1, 1,
-0.5311465, 0.3959231, -1.504267, 1, 1, 1, 1, 1,
-0.5284422, 1.469277, 0.2678685, 1, 1, 1, 1, 1,
-0.5249711, 3.17432, -1.328241, 1, 1, 1, 1, 1,
-0.5217561, -2.576484, -3.192147, 1, 1, 1, 1, 1,
-0.5208498, -0.4293076, -1.795307, 1, 1, 1, 1, 1,
-0.5174685, 0.7754716, -1.10359, 0, 0, 1, 1, 1,
-0.5149036, -0.2117693, 0.2602135, 1, 0, 0, 1, 1,
-0.5147586, 1.267886, 1.564762, 1, 0, 0, 1, 1,
-0.5108036, -0.4183298, -1.360746, 1, 0, 0, 1, 1,
-0.5106292, 1.051452, 0.2220095, 1, 0, 0, 1, 1,
-0.5098063, 1.654574, -0.362228, 1, 0, 0, 1, 1,
-0.5066987, 2.445971, 0.07441716, 0, 0, 0, 1, 1,
-0.4990777, 1.955886, 1.009529, 0, 0, 0, 1, 1,
-0.4988937, 0.2893807, -1.087033, 0, 0, 0, 1, 1,
-0.4953157, 0.9677854, 2.194996, 0, 0, 0, 1, 1,
-0.4933093, 0.8076177, -1.17457, 0, 0, 0, 1, 1,
-0.4922265, 0.8234245, -0.8155595, 0, 0, 0, 1, 1,
-0.4922072, -1.23892, -4.609403, 0, 0, 0, 1, 1,
-0.4895224, 1.094484, -1.315549, 1, 1, 1, 1, 1,
-0.4830135, 0.9650284, 0.4350733, 1, 1, 1, 1, 1,
-0.4817541, -0.7386673, -1.862928, 1, 1, 1, 1, 1,
-0.4816755, -0.0766857, -2.995532, 1, 1, 1, 1, 1,
-0.4785428, 1.76574, -0.3815973, 1, 1, 1, 1, 1,
-0.4780872, -0.322209, -1.782927, 1, 1, 1, 1, 1,
-0.4776602, 0.6610832, -1.28482, 1, 1, 1, 1, 1,
-0.4722532, 0.5016709, -1.568795, 1, 1, 1, 1, 1,
-0.4721314, 0.7369093, 0.324602, 1, 1, 1, 1, 1,
-0.4705592, -0.2960397, -1.607111, 1, 1, 1, 1, 1,
-0.4658154, 0.02905964, -2.063687, 1, 1, 1, 1, 1,
-0.4657138, 1.016073, -1.237786, 1, 1, 1, 1, 1,
-0.4653455, 0.6799802, -1.350827, 1, 1, 1, 1, 1,
-0.4641663, -0.1702917, -2.757094, 1, 1, 1, 1, 1,
-0.46312, 0.3146396, -0.1303928, 1, 1, 1, 1, 1,
-0.4589552, -0.3913006, -1.939233, 0, 0, 1, 1, 1,
-0.4582974, -0.4993597, -2.693747, 1, 0, 0, 1, 1,
-0.4568569, -1.614144, -3.45995, 1, 0, 0, 1, 1,
-0.4515814, 2.131438, -2.062725, 1, 0, 0, 1, 1,
-0.4498867, -0.1050964, -1.982812, 1, 0, 0, 1, 1,
-0.4413365, 1.25152, -0.1066522, 1, 0, 0, 1, 1,
-0.4382673, 1.766216, -0.4005935, 0, 0, 0, 1, 1,
-0.4377051, 1.006402, 0.5437991, 0, 0, 0, 1, 1,
-0.4303786, 1.17673, 2.735483, 0, 0, 0, 1, 1,
-0.4274026, 0.3795091, 0.2849168, 0, 0, 0, 1, 1,
-0.4241419, 1.262707, -0.3150674, 0, 0, 0, 1, 1,
-0.4238153, -2.195473, -1.78365, 0, 0, 0, 1, 1,
-0.4225104, -1.10147, -2.705883, 0, 0, 0, 1, 1,
-0.421875, 2.449902, 0.5818838, 1, 1, 1, 1, 1,
-0.4158541, -0.4734492, -3.652518, 1, 1, 1, 1, 1,
-0.4130596, 0.3833398, -1.019717, 1, 1, 1, 1, 1,
-0.411789, 0.03001743, -2.026917, 1, 1, 1, 1, 1,
-0.4114368, 1.355617, 0.6766828, 1, 1, 1, 1, 1,
-0.4062403, -1.097319, -3.223412, 1, 1, 1, 1, 1,
-0.4045922, 0.2614594, 1.43148, 1, 1, 1, 1, 1,
-0.3978224, 0.339694, 0.1154801, 1, 1, 1, 1, 1,
-0.39747, 1.483851, 0.2839427, 1, 1, 1, 1, 1,
-0.3961655, -0.7232072, -3.238046, 1, 1, 1, 1, 1,
-0.3943258, 0.6645446, -1.613728, 1, 1, 1, 1, 1,
-0.3844703, -0.452494, -1.22543, 1, 1, 1, 1, 1,
-0.3840556, 0.7950788, -1.579586, 1, 1, 1, 1, 1,
-0.367945, 0.1758984, -1.416321, 1, 1, 1, 1, 1,
-0.3650464, 0.6844336, -1.414303, 1, 1, 1, 1, 1,
-0.3571178, -0.610659, -3.140439, 0, 0, 1, 1, 1,
-0.3567085, 0.1359023, -2.262428, 1, 0, 0, 1, 1,
-0.3558075, 0.1556068, -2.038576, 1, 0, 0, 1, 1,
-0.3552603, -0.04521396, -1.513891, 1, 0, 0, 1, 1,
-0.3535769, 0.4653688, 1.25301, 1, 0, 0, 1, 1,
-0.3518763, 1.442707, 1.273139, 1, 0, 0, 1, 1,
-0.3496492, 1.835699, 0.09366775, 0, 0, 0, 1, 1,
-0.349337, 1.797355, -0.04943865, 0, 0, 0, 1, 1,
-0.3483373, 0.5835795, -0.8056285, 0, 0, 0, 1, 1,
-0.3470438, -0.1996727, -1.323573, 0, 0, 0, 1, 1,
-0.3457454, -0.2153282, -1.718598, 0, 0, 0, 1, 1,
-0.3452311, 1.730389, 0.03926816, 0, 0, 0, 1, 1,
-0.3420681, 0.6457115, 1.581741, 0, 0, 0, 1, 1,
-0.3419824, -0.9974036, -1.86149, 1, 1, 1, 1, 1,
-0.3399644, 2.119438, 0.01593479, 1, 1, 1, 1, 1,
-0.3350186, 1.729471, 0.08561441, 1, 1, 1, 1, 1,
-0.3292419, 0.385123, 1.963234, 1, 1, 1, 1, 1,
-0.3266113, -0.6360352, -1.540748, 1, 1, 1, 1, 1,
-0.3257505, 1.249305, -0.3717249, 1, 1, 1, 1, 1,
-0.3241443, 0.270199, 1.549556, 1, 1, 1, 1, 1,
-0.3153848, 0.3191952, -1.839795, 1, 1, 1, 1, 1,
-0.3147547, -0.01793902, -2.344343, 1, 1, 1, 1, 1,
-0.3105508, -0.7163904, -2.130108, 1, 1, 1, 1, 1,
-0.310012, 2.035208, -0.5874181, 1, 1, 1, 1, 1,
-0.309862, 1.161741, 1.820287, 1, 1, 1, 1, 1,
-0.3082729, -1.661448, -4.227536, 1, 1, 1, 1, 1,
-0.3067608, 0.1171484, -2.577042, 1, 1, 1, 1, 1,
-0.306435, 1.077945, 0.1009446, 1, 1, 1, 1, 1,
-0.3057608, -0.1644143, -2.454912, 0, 0, 1, 1, 1,
-0.2964875, -0.3857066, -3.017207, 1, 0, 0, 1, 1,
-0.2958704, -0.4930279, -2.924199, 1, 0, 0, 1, 1,
-0.2918249, 0.8680058, -0.2756935, 1, 0, 0, 1, 1,
-0.28886, 0.7715182, 0.5400665, 1, 0, 0, 1, 1,
-0.287812, -0.9971794, -2.467338, 1, 0, 0, 1, 1,
-0.284592, -0.4319854, -2.78444, 0, 0, 0, 1, 1,
-0.2833858, -1.267061, -2.053717, 0, 0, 0, 1, 1,
-0.2825098, -0.7065693, -2.678921, 0, 0, 0, 1, 1,
-0.2793217, -0.8791435, -3.854441, 0, 0, 0, 1, 1,
-0.2701479, -1.251052, -4.724268, 0, 0, 0, 1, 1,
-0.2688624, 1.611805, -0.4326319, 0, 0, 0, 1, 1,
-0.2671768, 0.04974216, -2.983474, 0, 0, 0, 1, 1,
-0.2640184, -0.4828473, -1.600134, 1, 1, 1, 1, 1,
-0.2624728, -0.588924, -2.949331, 1, 1, 1, 1, 1,
-0.2615545, 0.529383, -1.410493, 1, 1, 1, 1, 1,
-0.2588387, -1.604731, -2.329804, 1, 1, 1, 1, 1,
-0.2583842, 1.810715, 0.08613367, 1, 1, 1, 1, 1,
-0.2576917, 0.7467112, 0.9623344, 1, 1, 1, 1, 1,
-0.2551612, 1.82141, -0.4805669, 1, 1, 1, 1, 1,
-0.2532827, -0.5888884, -3.314794, 1, 1, 1, 1, 1,
-0.2481589, -1.124812, -0.6407854, 1, 1, 1, 1, 1,
-0.2455247, 0.1601758, -1.049341, 1, 1, 1, 1, 1,
-0.240489, -1.088222, -3.86752, 1, 1, 1, 1, 1,
-0.2403641, -0.07747446, -2.766418, 1, 1, 1, 1, 1,
-0.2377254, -1.357871, -4.129684, 1, 1, 1, 1, 1,
-0.2324359, -0.5862308, -3.75553, 1, 1, 1, 1, 1,
-0.2323501, -2.3126, -2.417168, 1, 1, 1, 1, 1,
-0.2318738, -0.3218088, -2.192954, 0, 0, 1, 1, 1,
-0.2293979, 0.3064253, 0.6874258, 1, 0, 0, 1, 1,
-0.2288636, 0.03303759, -0.7359672, 1, 0, 0, 1, 1,
-0.2262926, 0.2966858, -2.059977, 1, 0, 0, 1, 1,
-0.2221024, 1.109261, -0.2382793, 1, 0, 0, 1, 1,
-0.2210703, -0.7284131, -5.543341, 1, 0, 0, 1, 1,
-0.2197138, 2.16345, 1.212231, 0, 0, 0, 1, 1,
-0.2046406, 0.4216729, 0.369249, 0, 0, 0, 1, 1,
-0.2040092, -1.012903, -3.463816, 0, 0, 0, 1, 1,
-0.2038456, -0.4321508, -3.76564, 0, 0, 0, 1, 1,
-0.1986981, -0.4098518, -3.2353, 0, 0, 0, 1, 1,
-0.1985233, -0.2163913, -3.675634, 0, 0, 0, 1, 1,
-0.1970343, -0.09324796, -1.539928, 0, 0, 0, 1, 1,
-0.1930714, 0.7304242, -0.2114705, 1, 1, 1, 1, 1,
-0.185705, 0.2309714, -0.04864507, 1, 1, 1, 1, 1,
-0.1851139, 0.7799085, -0.7354306, 1, 1, 1, 1, 1,
-0.1831391, 0.06170382, -0.8097093, 1, 1, 1, 1, 1,
-0.1795504, -0.2732732, -1.641477, 1, 1, 1, 1, 1,
-0.1785899, -0.939034, -2.846531, 1, 1, 1, 1, 1,
-0.1751914, -0.3573562, -1.828998, 1, 1, 1, 1, 1,
-0.171238, 0.02358919, -2.751314, 1, 1, 1, 1, 1,
-0.167997, 1.835697, -1.283989, 1, 1, 1, 1, 1,
-0.1623576, 1.350222, -0.2019636, 1, 1, 1, 1, 1,
-0.1583805, 1.135753, 0.8039817, 1, 1, 1, 1, 1,
-0.1528937, 1.930963, 0.5427843, 1, 1, 1, 1, 1,
-0.1515722, 2.238653, 0.4544311, 1, 1, 1, 1, 1,
-0.1488716, 0.8843899, -0.4591272, 1, 1, 1, 1, 1,
-0.1485959, 0.1231049, -1.053729, 1, 1, 1, 1, 1,
-0.1474079, 0.470436, 0.7350584, 0, 0, 1, 1, 1,
-0.1441835, -0.3431962, -2.53653, 1, 0, 0, 1, 1,
-0.138968, -0.9580134, -2.186017, 1, 0, 0, 1, 1,
-0.1362264, -0.02629846, -2.178561, 1, 0, 0, 1, 1,
-0.1354421, -0.6751014, -2.729973, 1, 0, 0, 1, 1,
-0.1313106, -0.6676281, -3.583879, 1, 0, 0, 1, 1,
-0.1246864, 1.03394, -0.1153641, 0, 0, 0, 1, 1,
-0.1225237, -1.303688, -2.963011, 0, 0, 0, 1, 1,
-0.119492, -1.429787, -3.589282, 0, 0, 0, 1, 1,
-0.1188446, -0.9572515, -0.6718794, 0, 0, 0, 1, 1,
-0.1147372, 0.480514, 0.3625796, 0, 0, 0, 1, 1,
-0.1140179, 0.951747, 0.01146638, 0, 0, 0, 1, 1,
-0.1138562, 0.2808869, -0.9181111, 0, 0, 0, 1, 1,
-0.110825, -1.065673, -2.982456, 1, 1, 1, 1, 1,
-0.1071257, -0.427233, -4.459677, 1, 1, 1, 1, 1,
-0.1038221, -0.6646663, -2.393215, 1, 1, 1, 1, 1,
-0.1029635, -0.2492238, -3.371123, 1, 1, 1, 1, 1,
-0.09967738, -0.3258896, -2.612252, 1, 1, 1, 1, 1,
-0.09043405, 2.003773, -0.001908436, 1, 1, 1, 1, 1,
-0.0883504, -0.8477911, -3.208923, 1, 1, 1, 1, 1,
-0.08744842, 0.1359015, -1.756483, 1, 1, 1, 1, 1,
-0.08695875, 0.8864089, -2.04885, 1, 1, 1, 1, 1,
-0.08560609, 0.2870064, -0.3046052, 1, 1, 1, 1, 1,
-0.08391589, 1.243433, -1.310992, 1, 1, 1, 1, 1,
-0.08088186, -0.5440462, -2.434984, 1, 1, 1, 1, 1,
-0.07861617, -0.1279354, -3.541169, 1, 1, 1, 1, 1,
-0.07821298, 1.401515, 0.3191617, 1, 1, 1, 1, 1,
-0.0729262, -0.347927, -0.7127203, 1, 1, 1, 1, 1,
-0.06939027, 1.28141, 1.060958, 0, 0, 1, 1, 1,
-0.06641125, 0.08243991, -1.196713, 1, 0, 0, 1, 1,
-0.06581946, 0.8595988, -0.01244156, 1, 0, 0, 1, 1,
-0.06521253, -1.18273, -4.414585, 1, 0, 0, 1, 1,
-0.06094425, -0.7474105, -4.202132, 1, 0, 0, 1, 1,
-0.05964643, -0.2741273, -2.63406, 1, 0, 0, 1, 1,
-0.05249692, 0.254279, -0.3780215, 0, 0, 0, 1, 1,
-0.0522773, -0.7215155, -1.394375, 0, 0, 0, 1, 1,
-0.0495159, 1.161984, 0.5610385, 0, 0, 0, 1, 1,
-0.04931559, 1.017961, -0.4643189, 0, 0, 0, 1, 1,
-0.04886313, -0.08580584, -3.173321, 0, 0, 0, 1, 1,
-0.04549222, -1.225237, -2.508998, 0, 0, 0, 1, 1,
-0.04512793, 1.12677, -1.819177, 0, 0, 0, 1, 1,
-0.04345582, -0.602139, -1.882524, 1, 1, 1, 1, 1,
-0.03806768, -0.6935322, -3.074518, 1, 1, 1, 1, 1,
-0.0310267, -0.4318324, -2.7658, 1, 1, 1, 1, 1,
-0.03070812, -0.2811906, -2.034181, 1, 1, 1, 1, 1,
-0.03043777, -0.8572184, -3.76882, 1, 1, 1, 1, 1,
-0.02920759, -0.9724408, -2.534631, 1, 1, 1, 1, 1,
-0.0285879, 0.08050383, 0.4471887, 1, 1, 1, 1, 1,
-0.02383482, 1.558433, -0.7273327, 1, 1, 1, 1, 1,
-0.0214308, 0.01604419, -1.974483, 1, 1, 1, 1, 1,
-0.01877794, 0.6850303, -1.377435, 1, 1, 1, 1, 1,
-0.0172161, -0.1795669, -2.504681, 1, 1, 1, 1, 1,
-0.01396981, -1.217595, -2.746934, 1, 1, 1, 1, 1,
-0.01363109, 2.226053, -0.4840142, 1, 1, 1, 1, 1,
-0.009543208, -0.497817, -2.824485, 1, 1, 1, 1, 1,
-0.007172353, -0.6822868, -3.492107, 1, 1, 1, 1, 1,
-0.006734087, -0.3156684, -4.597979, 0, 0, 1, 1, 1,
-0.001982774, 1.000704, -0.8845763, 1, 0, 0, 1, 1,
-5.638264e-05, -0.6741858, -3.041877, 1, 0, 0, 1, 1,
0.0007800515, -1.377672, 3.506189, 1, 0, 0, 1, 1,
0.01648534, -0.9731663, 2.960819, 1, 0, 0, 1, 1,
0.01903495, -0.1042889, 2.654598, 1, 0, 0, 1, 1,
0.02535338, 1.402247, -0.1527561, 0, 0, 0, 1, 1,
0.02611871, -1.555007, 4.593263, 0, 0, 0, 1, 1,
0.02877131, -0.6342762, 2.381641, 0, 0, 0, 1, 1,
0.03426997, 0.7202254, -0.3258122, 0, 0, 0, 1, 1,
0.03535618, -0.556785, 2.028548, 0, 0, 0, 1, 1,
0.03567075, 0.2164898, 1.71782, 0, 0, 0, 1, 1,
0.03726779, -0.7640745, 1.362728, 0, 0, 0, 1, 1,
0.04067882, -0.7796391, 3.127439, 1, 1, 1, 1, 1,
0.04114005, 0.08717307, 1.656956, 1, 1, 1, 1, 1,
0.04333075, -0.1819558, 0.98756, 1, 1, 1, 1, 1,
0.04415709, -1.757747, 3.727594, 1, 1, 1, 1, 1,
0.04499781, 0.7055839, -0.4765325, 1, 1, 1, 1, 1,
0.04540136, 0.2827307, -0.8067051, 1, 1, 1, 1, 1,
0.04805261, 1.025742, 0.3963046, 1, 1, 1, 1, 1,
0.05133311, -1.251159, 2.178833, 1, 1, 1, 1, 1,
0.05205058, 1.26921, -0.2309251, 1, 1, 1, 1, 1,
0.05206757, -1.655891, 2.318717, 1, 1, 1, 1, 1,
0.05348724, 0.2675872, -1.255516, 1, 1, 1, 1, 1,
0.05548289, 0.656205, -0.7544962, 1, 1, 1, 1, 1,
0.05724503, 0.2568798, 0.08083644, 1, 1, 1, 1, 1,
0.06131645, -0.3365673, 2.264361, 1, 1, 1, 1, 1,
0.06156692, -0.4872819, 3.971812, 1, 1, 1, 1, 1,
0.06860799, 0.6344287, 1.203247, 0, 0, 1, 1, 1,
0.07522085, -1.500643, 3.8651, 1, 0, 0, 1, 1,
0.07647919, -1.473356, 3.752005, 1, 0, 0, 1, 1,
0.08142067, -0.3191614, 2.643851, 1, 0, 0, 1, 1,
0.08253694, 0.03443578, 1.483835, 1, 0, 0, 1, 1,
0.09012482, -0.8859202, 2.315571, 1, 0, 0, 1, 1,
0.09040005, -0.5042386, 2.736007, 0, 0, 0, 1, 1,
0.09245463, -1.177074, 2.166611, 0, 0, 0, 1, 1,
0.09562927, 1.148011, 0.7338454, 0, 0, 0, 1, 1,
0.09592975, 0.01552833, 0.3019063, 0, 0, 0, 1, 1,
0.09638478, 0.6561949, 0.6012368, 0, 0, 0, 1, 1,
0.1008954, 0.4500473, -0.69377, 0, 0, 0, 1, 1,
0.1016431, -0.04812289, 1.866521, 0, 0, 0, 1, 1,
0.1084242, 0.8052264, -0.5162274, 1, 1, 1, 1, 1,
0.10854, -1.344086, 5.376486, 1, 1, 1, 1, 1,
0.1102817, -1.078395, 1.980523, 1, 1, 1, 1, 1,
0.1114333, -0.5101123, 4.621706, 1, 1, 1, 1, 1,
0.1114879, -0.2981805, 2.611946, 1, 1, 1, 1, 1,
0.1116444, 0.7178985, -0.220372, 1, 1, 1, 1, 1,
0.114901, 0.2773058, -0.2663666, 1, 1, 1, 1, 1,
0.1184075, -0.6595751, 2.486351, 1, 1, 1, 1, 1,
0.1198378, 0.1530619, 2.250692, 1, 1, 1, 1, 1,
0.1213978, -0.1583721, 2.026568, 1, 1, 1, 1, 1,
0.1224246, 0.06046801, 1.036409, 1, 1, 1, 1, 1,
0.1259977, 0.80289, 0.2825736, 1, 1, 1, 1, 1,
0.1262619, -0.09883488, 2.337792, 1, 1, 1, 1, 1,
0.1266641, -1.232168, 3.920448, 1, 1, 1, 1, 1,
0.128231, -0.4728237, 1.8513, 1, 1, 1, 1, 1,
0.1315056, -1.507553, 2.988866, 0, 0, 1, 1, 1,
0.1335825, 0.007244422, 0.4142081, 1, 0, 0, 1, 1,
0.137276, -1.642191, 3.14618, 1, 0, 0, 1, 1,
0.140718, 0.6653587, -0.6128058, 1, 0, 0, 1, 1,
0.1413831, 2.006936, -0.005843782, 1, 0, 0, 1, 1,
0.151443, -0.2099446, 2.166152, 1, 0, 0, 1, 1,
0.1546802, 0.1946181, 1.471602, 0, 0, 0, 1, 1,
0.1566381, -2.114568, 2.474241, 0, 0, 0, 1, 1,
0.1573095, 0.4333813, 1.269434, 0, 0, 0, 1, 1,
0.1578038, 0.4811719, 0.08653887, 0, 0, 0, 1, 1,
0.1590866, -0.89135, 2.497847, 0, 0, 0, 1, 1,
0.1614767, -0.5640645, 1.130795, 0, 0, 0, 1, 1,
0.1654214, -0.5255881, 1.806858, 0, 0, 0, 1, 1,
0.1658505, 0.4750544, 2.077753, 1, 1, 1, 1, 1,
0.1702318, -2.021094, 1.070806, 1, 1, 1, 1, 1,
0.1708774, -1.471426, 3.165303, 1, 1, 1, 1, 1,
0.1722867, -0.3705677, 0.9619966, 1, 1, 1, 1, 1,
0.1730289, -0.1219691, 1.701904, 1, 1, 1, 1, 1,
0.1774509, -0.6374796, 3.907588, 1, 1, 1, 1, 1,
0.1811029, 0.731369, -0.5042665, 1, 1, 1, 1, 1,
0.1820212, 0.9016957, -1.31598, 1, 1, 1, 1, 1,
0.1821774, -0.2666572, 1.839863, 1, 1, 1, 1, 1,
0.1835376, 0.2270413, -0.3729233, 1, 1, 1, 1, 1,
0.1852077, 0.282395, 2.003372, 1, 1, 1, 1, 1,
0.1903384, 1.06666, 1.122847, 1, 1, 1, 1, 1,
0.1906649, 0.9240876, 1.923473, 1, 1, 1, 1, 1,
0.1963955, 1.175767, -0.9962997, 1, 1, 1, 1, 1,
0.19826, 1.194106, -0.3364709, 1, 1, 1, 1, 1,
0.1988805, 1.22709, -0.2578943, 0, 0, 1, 1, 1,
0.1998, 0.1540842, 1.419265, 1, 0, 0, 1, 1,
0.2055468, -0.08506116, 2.823971, 1, 0, 0, 1, 1,
0.2111964, -0.4548564, 2.976905, 1, 0, 0, 1, 1,
0.2120196, 1.361081, -0.3490433, 1, 0, 0, 1, 1,
0.2135928, 1.426728, -0.1697266, 1, 0, 0, 1, 1,
0.2154932, -0.7248015, 1.923276, 0, 0, 0, 1, 1,
0.2178418, -0.5242549, 2.202808, 0, 0, 0, 1, 1,
0.2193446, -0.7258618, 1.781253, 0, 0, 0, 1, 1,
0.2195996, 0.3258997, -0.3091292, 0, 0, 0, 1, 1,
0.2224466, 0.09412754, 0.655827, 0, 0, 0, 1, 1,
0.2233354, 0.04790454, 2.375493, 0, 0, 0, 1, 1,
0.2250472, -0.3287786, 1.421477, 0, 0, 0, 1, 1,
0.2256837, 0.1893587, 1.187948, 1, 1, 1, 1, 1,
0.2265461, 0.3571518, -0.3862422, 1, 1, 1, 1, 1,
0.2297878, 0.187779, 1.233107, 1, 1, 1, 1, 1,
0.2303862, 2.250597, -0.5228012, 1, 1, 1, 1, 1,
0.2328647, -0.1839033, 2.41735, 1, 1, 1, 1, 1,
0.2357319, -0.06347062, 3.242331, 1, 1, 1, 1, 1,
0.2375979, 1.814313, 0.5158904, 1, 1, 1, 1, 1,
0.239822, -0.07989907, 2.771315, 1, 1, 1, 1, 1,
0.2421183, -0.7811318, 3.821834, 1, 1, 1, 1, 1,
0.2446851, 0.5207534, 0.6788964, 1, 1, 1, 1, 1,
0.2474405, -0.5310712, 3.720331, 1, 1, 1, 1, 1,
0.2508976, -0.6185308, 2.885601, 1, 1, 1, 1, 1,
0.2533132, 0.9467022, -1.353253, 1, 1, 1, 1, 1,
0.2560376, 0.6777532, -0.477925, 1, 1, 1, 1, 1,
0.2589386, 0.2274815, 0.5084189, 1, 1, 1, 1, 1,
0.2692323, -0.926642, 4.264057, 0, 0, 1, 1, 1,
0.2708742, -0.122986, 2.276456, 1, 0, 0, 1, 1,
0.2715726, 1.045764, -3.71213, 1, 0, 0, 1, 1,
0.2725834, -0.3051535, 2.761876, 1, 0, 0, 1, 1,
0.2733877, -0.6360337, 0.7384144, 1, 0, 0, 1, 1,
0.2748273, -0.6186611, 3.30629, 1, 0, 0, 1, 1,
0.2748789, 1.64242, -1.973268, 0, 0, 0, 1, 1,
0.2774917, 1.346367, -0.3825787, 0, 0, 0, 1, 1,
0.2778022, 0.5298217, -1.210666, 0, 0, 0, 1, 1,
0.2788832, -0.4495588, 1.627588, 0, 0, 0, 1, 1,
0.2811953, 0.2552702, 1.117163, 0, 0, 0, 1, 1,
0.2838309, -1.796409, 2.823759, 0, 0, 0, 1, 1,
0.2850223, -0.2969138, 1.222025, 0, 0, 0, 1, 1,
0.2887538, 0.6061224, 0.6822498, 1, 1, 1, 1, 1,
0.2914885, 0.2347832, 1.213873, 1, 1, 1, 1, 1,
0.2926257, -0.5797884, 3.150039, 1, 1, 1, 1, 1,
0.2932003, -0.8652166, 3.490851, 1, 1, 1, 1, 1,
0.2934057, 0.952231, -0.06390809, 1, 1, 1, 1, 1,
0.2937947, 1.012587, -1.65493, 1, 1, 1, 1, 1,
0.2953023, -2.01536, 2.427454, 1, 1, 1, 1, 1,
0.3031352, 0.5023562, 1.937157, 1, 1, 1, 1, 1,
0.3118119, 1.210928, -0.5222539, 1, 1, 1, 1, 1,
0.3138294, 0.3108724, 1.26713, 1, 1, 1, 1, 1,
0.3179445, -0.3500836, 2.220143, 1, 1, 1, 1, 1,
0.3199935, -0.8495458, 2.657892, 1, 1, 1, 1, 1,
0.3222019, -0.5763616, 3.269088, 1, 1, 1, 1, 1,
0.3224666, -0.4852391, 1.85442, 1, 1, 1, 1, 1,
0.3235708, -1.058264, 1.733641, 1, 1, 1, 1, 1,
0.3240618, -0.06276548, 3.036426, 0, 0, 1, 1, 1,
0.3245699, -1.60785, 3.235956, 1, 0, 0, 1, 1,
0.3271259, 1.631845, -0.6045551, 1, 0, 0, 1, 1,
0.3321179, 0.9629382, -1.586885, 1, 0, 0, 1, 1,
0.341967, 1.781666, 1.079431, 1, 0, 0, 1, 1,
0.342342, 0.3543227, -0.2462469, 1, 0, 0, 1, 1,
0.3431416, 0.8493179, 0.547725, 0, 0, 0, 1, 1,
0.3507538, -1.183989, 1.787717, 0, 0, 0, 1, 1,
0.3508448, -0.609289, 3.792511, 0, 0, 0, 1, 1,
0.3513014, 1.631389, 1.229756, 0, 0, 0, 1, 1,
0.3526094, 0.9734322, 0.5335492, 0, 0, 0, 1, 1,
0.3526751, 0.03710011, 1.431672, 0, 0, 0, 1, 1,
0.3536742, -0.2734659, 2.224007, 0, 0, 0, 1, 1,
0.3603818, -1.261793, 2.693221, 1, 1, 1, 1, 1,
0.3614905, 1.886909, 0.04644904, 1, 1, 1, 1, 1,
0.367448, -1.510303, 3.821095, 1, 1, 1, 1, 1,
0.3678648, -0.7040057, 2.554596, 1, 1, 1, 1, 1,
0.3723671, 0.2374487, 0.4232362, 1, 1, 1, 1, 1,
0.3751172, -0.3066306, 1.242234, 1, 1, 1, 1, 1,
0.3786377, 0.2916614, 2.116883, 1, 1, 1, 1, 1,
0.3786698, 1.077091, 1.630501, 1, 1, 1, 1, 1,
0.3825884, 2.106005, 1.024386, 1, 1, 1, 1, 1,
0.386436, -1.596788, 3.76222, 1, 1, 1, 1, 1,
0.3901343, -0.3005058, 1.701862, 1, 1, 1, 1, 1,
0.3915336, 0.5285345, 0.3131208, 1, 1, 1, 1, 1,
0.3921613, 0.1321513, 0.6592132, 1, 1, 1, 1, 1,
0.3933437, -0.5512769, 5.045912, 1, 1, 1, 1, 1,
0.3942534, 1.305225, 0.1215605, 1, 1, 1, 1, 1,
0.3975806, -2.327116, 2.085185, 0, 0, 1, 1, 1,
0.4022785, 0.5526946, 1.959527, 1, 0, 0, 1, 1,
0.4035323, -0.2055261, 1.30621, 1, 0, 0, 1, 1,
0.4091437, 0.4964074, 1.115013, 1, 0, 0, 1, 1,
0.4097966, -0.5008003, 2.55505, 1, 0, 0, 1, 1,
0.4110739, -0.09262623, 5.045502, 1, 0, 0, 1, 1,
0.4111047, 0.1008403, 1.02942, 0, 0, 0, 1, 1,
0.4123855, 0.5709805, 0.4774132, 0, 0, 0, 1, 1,
0.4140015, 0.8319397, -0.4010135, 0, 0, 0, 1, 1,
0.4149988, 0.6784772, 1.902037, 0, 0, 0, 1, 1,
0.4157244, 0.8263253, -0.7708947, 0, 0, 0, 1, 1,
0.416631, -0.8868083, 2.917396, 0, 0, 0, 1, 1,
0.4175788, 0.5336927, -0.9586677, 0, 0, 0, 1, 1,
0.4197562, 0.4713004, -1.261101, 1, 1, 1, 1, 1,
0.4210799, -2.035353, 2.913832, 1, 1, 1, 1, 1,
0.4212268, 0.3334855, 0.711299, 1, 1, 1, 1, 1,
0.4252845, 2.238816, 0.5228954, 1, 1, 1, 1, 1,
0.4382044, 0.06665039, 0.8414035, 1, 1, 1, 1, 1,
0.4385239, -0.3154949, 3.632843, 1, 1, 1, 1, 1,
0.43912, -1.119692, 3.756783, 1, 1, 1, 1, 1,
0.4401001, -0.8055268, 2.822946, 1, 1, 1, 1, 1,
0.4407059, -1.806176, 3.559488, 1, 1, 1, 1, 1,
0.4466496, -1.960279, 3.025007, 1, 1, 1, 1, 1,
0.4487798, -0.8156916, 2.18459, 1, 1, 1, 1, 1,
0.4489377, 1.491625, -0.4690572, 1, 1, 1, 1, 1,
0.4520498, -0.3636608, 0.9980492, 1, 1, 1, 1, 1,
0.4548393, 0.4841543, -1.303237, 1, 1, 1, 1, 1,
0.4595076, -0.9556292, 3.373981, 1, 1, 1, 1, 1,
0.4605123, 0.172811, 1.493521, 0, 0, 1, 1, 1,
0.4648883, -1.125977, 3.368778, 1, 0, 0, 1, 1,
0.4649711, 1.917961, 0.7322071, 1, 0, 0, 1, 1,
0.4653561, -0.4495523, 2.432996, 1, 0, 0, 1, 1,
0.4691873, -0.4687651, 2.879231, 1, 0, 0, 1, 1,
0.4695844, 0.8476651, 0.01995166, 1, 0, 0, 1, 1,
0.4743264, 1.293165, 2.123457, 0, 0, 0, 1, 1,
0.4768126, 0.4716363, 0.6289189, 0, 0, 0, 1, 1,
0.4768522, 0.8212276, -0.1812438, 0, 0, 0, 1, 1,
0.4850027, -0.05635237, 1.372258, 0, 0, 0, 1, 1,
0.490598, -1.497974, 6.131749, 0, 0, 0, 1, 1,
0.4910972, 1.065369, -0.9537718, 0, 0, 0, 1, 1,
0.491109, -1.684963, 3.00707, 0, 0, 0, 1, 1,
0.4970421, 0.3146669, 2.81237, 1, 1, 1, 1, 1,
0.4981076, 0.5709726, 2.125994, 1, 1, 1, 1, 1,
0.4997829, 0.001363605, 0.7117511, 1, 1, 1, 1, 1,
0.4999441, -0.7220377, 3.367151, 1, 1, 1, 1, 1,
0.5051756, -1.47613, 2.461406, 1, 1, 1, 1, 1,
0.5087729, -0.593263, 1.467244, 1, 1, 1, 1, 1,
0.5113704, 0.6298056, 1.0812, 1, 1, 1, 1, 1,
0.5134543, -0.06741181, 3.721401, 1, 1, 1, 1, 1,
0.517788, 1.874427, -0.6688939, 1, 1, 1, 1, 1,
0.5184423, 1.312477, 0.1867595, 1, 1, 1, 1, 1,
0.5208988, -0.8401349, 2.86682, 1, 1, 1, 1, 1,
0.5241026, 2.524576, -1.998627, 1, 1, 1, 1, 1,
0.5295252, 1.685793, -0.2271938, 1, 1, 1, 1, 1,
0.5347665, 0.9883645, 1.589623, 1, 1, 1, 1, 1,
0.5348527, 2.791197, 1.807932, 1, 1, 1, 1, 1,
0.5355238, 0.3602348, 0.2734958, 0, 0, 1, 1, 1,
0.5524107, -0.1772415, 2.508761, 1, 0, 0, 1, 1,
0.5551212, -1.230999, 3.354737, 1, 0, 0, 1, 1,
0.5590873, 0.009566217, 1.144264, 1, 0, 0, 1, 1,
0.5603263, 1.101536, 0.3166833, 1, 0, 0, 1, 1,
0.5636792, -0.8848392, 2.53876, 1, 0, 0, 1, 1,
0.5673295, 0.8984513, -0.8687938, 0, 0, 0, 1, 1,
0.5721484, 0.00409583, 1.635808, 0, 0, 0, 1, 1,
0.5722477, -0.5940203, 2.418291, 0, 0, 0, 1, 1,
0.578825, -0.6562406, 2.629365, 0, 0, 0, 1, 1,
0.5793623, -0.986894, 3.5143, 0, 0, 0, 1, 1,
0.5828307, -0.3884008, 1.388596, 0, 0, 0, 1, 1,
0.5863615, -0.9781137, 1.258459, 0, 0, 0, 1, 1,
0.5880902, -0.4967941, 2.656197, 1, 1, 1, 1, 1,
0.5890864, 0.09304548, 1.84104, 1, 1, 1, 1, 1,
0.5984988, 0.7155018, 0.6558552, 1, 1, 1, 1, 1,
0.5997657, -1.729834, 2.625327, 1, 1, 1, 1, 1,
0.6016874, -0.6434426, 1.874815, 1, 1, 1, 1, 1,
0.6039652, 0.3167346, -0.1915863, 1, 1, 1, 1, 1,
0.6048029, -1.290167, 1.546186, 1, 1, 1, 1, 1,
0.6072304, -1.711423, 2.845548, 1, 1, 1, 1, 1,
0.6082718, -0.9391329, 1.321339, 1, 1, 1, 1, 1,
0.6084856, -1.992981, 2.58388, 1, 1, 1, 1, 1,
0.6094843, 0.8125251, 2.487889, 1, 1, 1, 1, 1,
0.6113264, -0.03386324, 2.278789, 1, 1, 1, 1, 1,
0.6128976, 0.6445353, 1.743478, 1, 1, 1, 1, 1,
0.6158607, 0.954742, 2.542125, 1, 1, 1, 1, 1,
0.6169639, -0.5032052, 0.6792415, 1, 1, 1, 1, 1,
0.620078, -0.2177682, 2.110487, 0, 0, 1, 1, 1,
0.6215179, 0.5385374, 1.536194, 1, 0, 0, 1, 1,
0.6227446, -0.9332484, 2.384238, 1, 0, 0, 1, 1,
0.6237177, -0.08114454, 0.9601521, 1, 0, 0, 1, 1,
0.6246434, -0.6978624, 2.068452, 1, 0, 0, 1, 1,
0.6277136, 0.1861232, 2.255217, 1, 0, 0, 1, 1,
0.6293383, 1.272675, 1.109657, 0, 0, 0, 1, 1,
0.632638, 0.3351292, 0.5289683, 0, 0, 0, 1, 1,
0.6353034, 0.572234, 1.377596, 0, 0, 0, 1, 1,
0.635758, -0.3534799, 0.410318, 0, 0, 0, 1, 1,
0.6364489, -0.2189418, 0.5703318, 0, 0, 0, 1, 1,
0.644752, -0.7668151, 0.9112744, 0, 0, 0, 1, 1,
0.6472093, 0.0006368331, 0.7719634, 0, 0, 0, 1, 1,
0.6478408, 1.992239, 1.36027, 1, 1, 1, 1, 1,
0.6481951, -1.674001, 1.736483, 1, 1, 1, 1, 1,
0.6531577, -1.060036, 2.708938, 1, 1, 1, 1, 1,
0.653426, -0.2439955, 2.537245, 1, 1, 1, 1, 1,
0.6561344, 0.05972018, 2.268179, 1, 1, 1, 1, 1,
0.6581038, 0.6425658, 1.427163, 1, 1, 1, 1, 1,
0.6608872, 1.179785, 1.238142, 1, 1, 1, 1, 1,
0.6627443, 0.01834603, 1.556183, 1, 1, 1, 1, 1,
0.662752, 1.223216, 2.546734, 1, 1, 1, 1, 1,
0.6677246, 0.7292276, -0.09079736, 1, 1, 1, 1, 1,
0.6726369, 0.1059584, 0.7263569, 1, 1, 1, 1, 1,
0.6742916, 0.8275775, 0.02219872, 1, 1, 1, 1, 1,
0.6768059, 0.8041561, 0.3079041, 1, 1, 1, 1, 1,
0.6816165, -1.075771, 2.774567, 1, 1, 1, 1, 1,
0.6876563, -0.4049634, -0.5702872, 1, 1, 1, 1, 1,
0.6900151, 0.4929826, 0.568931, 0, 0, 1, 1, 1,
0.6912404, -1.026399, 3.477654, 1, 0, 0, 1, 1,
0.6927367, -0.9511244, 2.205667, 1, 0, 0, 1, 1,
0.698154, 0.5142038, 1.298287, 1, 0, 0, 1, 1,
0.7025697, -0.3713944, -0.1125515, 1, 0, 0, 1, 1,
0.7041547, -0.4790557, 2.986974, 1, 0, 0, 1, 1,
0.7090486, -0.6042196, 2.74954, 0, 0, 0, 1, 1,
0.7148795, 0.5973379, -0.1867272, 0, 0, 0, 1, 1,
0.7150614, -0.09215503, 1.676853, 0, 0, 0, 1, 1,
0.7176177, -2.051961, 1.110158, 0, 0, 0, 1, 1,
0.7205376, 0.4367179, 0.2398451, 0, 0, 0, 1, 1,
0.7209794, 1.020248, -0.0687202, 0, 0, 0, 1, 1,
0.7234659, 0.3650535, 1.981472, 0, 0, 0, 1, 1,
0.7243642, 0.830623, -0.1252993, 1, 1, 1, 1, 1,
0.7298642, 0.8826168, 0.5764421, 1, 1, 1, 1, 1,
0.7312251, 0.635139, 1.668928, 1, 1, 1, 1, 1,
0.7388148, -0.2434618, 3.18866, 1, 1, 1, 1, 1,
0.7405823, -0.479825, 1.200062, 1, 1, 1, 1, 1,
0.7431297, 0.4032412, 0.844163, 1, 1, 1, 1, 1,
0.7472697, -1.013286, 3.841429, 1, 1, 1, 1, 1,
0.74946, 1.184415, 0.6778125, 1, 1, 1, 1, 1,
0.7502161, -0.7429912, 2.488086, 1, 1, 1, 1, 1,
0.7558087, -0.3261603, 3.075325, 1, 1, 1, 1, 1,
0.7590694, -0.593366, 2.090125, 1, 1, 1, 1, 1,
0.7623582, 0.1465653, 0.1252246, 1, 1, 1, 1, 1,
0.7646236, 0.4810969, 0.6255554, 1, 1, 1, 1, 1,
0.7773302, 0.005562372, 4.102442, 1, 1, 1, 1, 1,
0.7831008, -0.6145608, 1.469874, 1, 1, 1, 1, 1,
0.7866634, 1.007909, -1.548619, 0, 0, 1, 1, 1,
0.7875838, -0.1072659, 0.1457198, 1, 0, 0, 1, 1,
0.7931767, -1.5062, 1.065491, 1, 0, 0, 1, 1,
0.794645, 0.573548, 0.6252872, 1, 0, 0, 1, 1,
0.7973433, -0.6043594, 1.659449, 1, 0, 0, 1, 1,
0.8045828, 1.849851, 0.4610985, 1, 0, 0, 1, 1,
0.8060746, 0.8301211, 3.319324, 0, 0, 0, 1, 1,
0.8110988, -0.4343953, 3.374028, 0, 0, 0, 1, 1,
0.8144886, 0.3818077, 0.8705291, 0, 0, 0, 1, 1,
0.817271, 0.248157, 1.265801, 0, 0, 0, 1, 1,
0.8177807, -2.247517, 1.749918, 0, 0, 0, 1, 1,
0.8180668, 1.413148, -0.07172601, 0, 0, 0, 1, 1,
0.8195292, 0.2786963, 0.9031419, 0, 0, 0, 1, 1,
0.8323848, -0.04152266, -0.2262635, 1, 1, 1, 1, 1,
0.8325021, 0.7208644, 0.1676468, 1, 1, 1, 1, 1,
0.8338582, 1.255548, -0.199615, 1, 1, 1, 1, 1,
0.8356089, -0.8468583, 3.290115, 1, 1, 1, 1, 1,
0.8378615, -0.6205603, 1.954649, 1, 1, 1, 1, 1,
0.8429281, -1.595219, 1.93808, 1, 1, 1, 1, 1,
0.8505636, 0.04928607, 0.5034442, 1, 1, 1, 1, 1,
0.8527529, 0.1753861, 0.7644154, 1, 1, 1, 1, 1,
0.8536989, -1.316841, 3.367013, 1, 1, 1, 1, 1,
0.8685914, -0.7159146, 1.426868, 1, 1, 1, 1, 1,
0.8737615, -1.72499, 3.253725, 1, 1, 1, 1, 1,
0.8753288, 0.6841187, 1.849631, 1, 1, 1, 1, 1,
0.8762127, 0.503926, 1.243213, 1, 1, 1, 1, 1,
0.8825181, 0.2453952, 0.9154437, 1, 1, 1, 1, 1,
0.8833544, -1.020727, 3.13289, 1, 1, 1, 1, 1,
0.8873076, -1.402687, 0.2042123, 0, 0, 1, 1, 1,
0.8889456, 0.9699438, 2.520864, 1, 0, 0, 1, 1,
0.8906462, 1.379512, -0.8938605, 1, 0, 0, 1, 1,
0.8919328, 1.745087, 0.5636263, 1, 0, 0, 1, 1,
0.8921599, -0.1914471, 2.55584, 1, 0, 0, 1, 1,
0.8961107, 0.9991754, -0.7653001, 1, 0, 0, 1, 1,
0.8987446, -0.1857952, 1.771182, 0, 0, 0, 1, 1,
0.903051, 0.02609364, 0.2227672, 0, 0, 0, 1, 1,
0.9088753, -0.9714713, 2.316622, 0, 0, 0, 1, 1,
0.9117586, 1.968307, -0.7889874, 0, 0, 0, 1, 1,
0.9175326, 1.759499, 0.5957285, 0, 0, 0, 1, 1,
0.9280049, 0.8888752, 0.8208675, 0, 0, 0, 1, 1,
0.9408094, -0.6781472, 0.3722402, 0, 0, 0, 1, 1,
0.9420334, 0.6053739, 1.928544, 1, 1, 1, 1, 1,
0.9488209, 0.7952614, 0.4170525, 1, 1, 1, 1, 1,
0.9589811, -0.7243037, 2.939229, 1, 1, 1, 1, 1,
0.9651635, -1.097739, 2.294974, 1, 1, 1, 1, 1,
0.968156, 1.166281, 0.3790152, 1, 1, 1, 1, 1,
0.9684531, -0.8634036, 4.011518, 1, 1, 1, 1, 1,
0.9792833, 0.549383, 0.7945263, 1, 1, 1, 1, 1,
0.9837933, -0.200865, 2.468996, 1, 1, 1, 1, 1,
0.9852335, 1.464024, 0.2062918, 1, 1, 1, 1, 1,
0.9982218, 1.481447, -1.263844, 1, 1, 1, 1, 1,
1.001102, -0.2089188, 2.978175, 1, 1, 1, 1, 1,
1.007097, 0.4123942, 0.2791314, 1, 1, 1, 1, 1,
1.007245, -0.3842049, 1.457891, 1, 1, 1, 1, 1,
1.010933, -0.7886204, 1.816624, 1, 1, 1, 1, 1,
1.011326, -0.2648702, 1.689794, 1, 1, 1, 1, 1,
1.011438, -0.02478471, 1.28921, 0, 0, 1, 1, 1,
1.012491, 0.2360245, -0.3640256, 1, 0, 0, 1, 1,
1.014662, -0.4839013, 2.257008, 1, 0, 0, 1, 1,
1.020901, 0.9450312, 0.3438567, 1, 0, 0, 1, 1,
1.023545, 1.300758, 1.653408, 1, 0, 0, 1, 1,
1.031443, 0.4718972, 2.044193, 1, 0, 0, 1, 1,
1.045637, -0.4118578, 2.295216, 0, 0, 0, 1, 1,
1.050576, 0.5505248, 1.465079, 0, 0, 0, 1, 1,
1.052613, -0.4502586, 1.191447, 0, 0, 0, 1, 1,
1.055722, -0.4767375, 3.738837, 0, 0, 0, 1, 1,
1.063261, 0.7542879, 2.30633, 0, 0, 0, 1, 1,
1.069458, -0.2591321, 2.275729, 0, 0, 0, 1, 1,
1.073947, -0.7236652, 2.101542, 0, 0, 0, 1, 1,
1.074092, -1.770238, 2.515873, 1, 1, 1, 1, 1,
1.077815, -0.3948474, 1.605477, 1, 1, 1, 1, 1,
1.078793, -0.8372567, 3.153207, 1, 1, 1, 1, 1,
1.083646, -0.4740239, 1.054544, 1, 1, 1, 1, 1,
1.085259, 1.551936, -0.1961153, 1, 1, 1, 1, 1,
1.088425, 0.1070714, 2.538145, 1, 1, 1, 1, 1,
1.098034, 1.487289, -0.4104525, 1, 1, 1, 1, 1,
1.098512, 1.220175, 0.243667, 1, 1, 1, 1, 1,
1.099505, -1.766947, 4.455743, 1, 1, 1, 1, 1,
1.100999, 2.001091, 1.307246, 1, 1, 1, 1, 1,
1.107571, 0.4101956, 2.081587, 1, 1, 1, 1, 1,
1.11174, -0.3053901, 0.6742542, 1, 1, 1, 1, 1,
1.113885, -0.5582814, 2.489346, 1, 1, 1, 1, 1,
1.118766, -1.000705, 2.546268, 1, 1, 1, 1, 1,
1.123776, -0.4862554, 2.634534, 1, 1, 1, 1, 1,
1.125522, -0.7520368, 2.517183, 0, 0, 1, 1, 1,
1.127187, 0.6160429, 1.249374, 1, 0, 0, 1, 1,
1.138976, 1.062075, 0.03559973, 1, 0, 0, 1, 1,
1.153713, -0.7844096, 3.368452, 1, 0, 0, 1, 1,
1.156755, -0.7131602, 1.973198, 1, 0, 0, 1, 1,
1.171301, 1.051634, -0.4192334, 1, 0, 0, 1, 1,
1.184255, -0.9903149, 1.679401, 0, 0, 0, 1, 1,
1.191594, -0.5700296, 2.289306, 0, 0, 0, 1, 1,
1.195958, 0.6785264, 0.5011863, 0, 0, 0, 1, 1,
1.198156, 0.5045767, -0.08387483, 0, 0, 0, 1, 1,
1.207277, -0.05358306, 1.588762, 0, 0, 0, 1, 1,
1.217591, 2.365224, 0.8764496, 0, 0, 0, 1, 1,
1.21899, -0.323845, 1.201414, 0, 0, 0, 1, 1,
1.223584, 0.194328, 1.779943, 1, 1, 1, 1, 1,
1.23419, -0.7774989, 1.353448, 1, 1, 1, 1, 1,
1.255492, -0.9472725, 1.51626, 1, 1, 1, 1, 1,
1.260239, -0.6824237, 1.403521, 1, 1, 1, 1, 1,
1.260516, -0.2795612, 1.097478, 1, 1, 1, 1, 1,
1.261099, -1.752596, 4.491916, 1, 1, 1, 1, 1,
1.269289, -1.30407, 3.426945, 1, 1, 1, 1, 1,
1.279366, 0.3059105, 3.066262, 1, 1, 1, 1, 1,
1.282931, -0.4184294, 1.463673, 1, 1, 1, 1, 1,
1.28626, -1.481298, 1.986985, 1, 1, 1, 1, 1,
1.28744, -0.3810607, 4.322234, 1, 1, 1, 1, 1,
1.288889, -0.8800721, 2.715661, 1, 1, 1, 1, 1,
1.289417, -1.543331, 2.626607, 1, 1, 1, 1, 1,
1.292168, 1.405586, -0.2717713, 1, 1, 1, 1, 1,
1.294474, 1.807583, 1.361719, 1, 1, 1, 1, 1,
1.296849, -0.1807883, 2.369185, 0, 0, 1, 1, 1,
1.309568, 0.3615695, 0.9031104, 1, 0, 0, 1, 1,
1.323693, -2.116326, 2.904996, 1, 0, 0, 1, 1,
1.325492, -0.3161732, 2.879354, 1, 0, 0, 1, 1,
1.326354, 2.55336, 0.7057112, 1, 0, 0, 1, 1,
1.326725, -0.7455212, 3.031092, 1, 0, 0, 1, 1,
1.350827, 1.077752, 0.1312382, 0, 0, 0, 1, 1,
1.35374, -1.66449, 3.243648, 0, 0, 0, 1, 1,
1.364903, -1.445642, 1.817762, 0, 0, 0, 1, 1,
1.366418, 1.043938, 0.2420068, 0, 0, 0, 1, 1,
1.375047, -0.4869147, 1.273984, 0, 0, 0, 1, 1,
1.377303, 0.8284174, 0.0520739, 0, 0, 0, 1, 1,
1.395764, 0.7643319, 0.6981279, 0, 0, 0, 1, 1,
1.404915, 2.563221, -0.8843153, 1, 1, 1, 1, 1,
1.409063, 0.2299471, 0.8611045, 1, 1, 1, 1, 1,
1.411249, -1.30225, 1.655911, 1, 1, 1, 1, 1,
1.420797, 0.5550644, 1.360472, 1, 1, 1, 1, 1,
1.421166, 0.5213721, 0.7277905, 1, 1, 1, 1, 1,
1.4304, -1.448083, 1.178597, 1, 1, 1, 1, 1,
1.436413, -0.3620761, 2.882329, 1, 1, 1, 1, 1,
1.438488, 0.2394551, 1.004543, 1, 1, 1, 1, 1,
1.442503, 1.309939, 2.734937, 1, 1, 1, 1, 1,
1.463932, -0.2359488, 2.277669, 1, 1, 1, 1, 1,
1.489548, -0.6337466, 1.984269, 1, 1, 1, 1, 1,
1.490349, -0.8962123, 2.138218, 1, 1, 1, 1, 1,
1.501769, -0.1888418, 2.707294, 1, 1, 1, 1, 1,
1.523194, 0.5568501, 1.097536, 1, 1, 1, 1, 1,
1.542713, -1.781883, 1.907864, 1, 1, 1, 1, 1,
1.564396, -1.280382, -0.6403867, 0, 0, 1, 1, 1,
1.575287, 0.5371367, 1.584383, 1, 0, 0, 1, 1,
1.576, -0.1086192, 1.986682, 1, 0, 0, 1, 1,
1.578108, -1.37146, 3.027283, 1, 0, 0, 1, 1,
1.586377, -0.7025973, 1.680109, 1, 0, 0, 1, 1,
1.595941, 0.2526709, 1.707653, 1, 0, 0, 1, 1,
1.604209, -0.2412355, 1.979297, 0, 0, 0, 1, 1,
1.608902, -0.05649557, 0.4013295, 0, 0, 0, 1, 1,
1.608981, -0.765588, 2.048613, 0, 0, 0, 1, 1,
1.627661, 0.9625002, 0.04101787, 0, 0, 0, 1, 1,
1.63284, 1.455965, 0.9879889, 0, 0, 0, 1, 1,
1.642396, 0.2584074, 1.009416, 0, 0, 0, 1, 1,
1.649342, -0.0738209, 1.069576, 0, 0, 0, 1, 1,
1.65306, 0.8793862, 3.134211, 1, 1, 1, 1, 1,
1.67106, 0.8360475, 2.326624, 1, 1, 1, 1, 1,
1.687533, 0.5327455, 1.211791, 1, 1, 1, 1, 1,
1.703383, -0.3369309, 1.491013, 1, 1, 1, 1, 1,
1.715301, 0.5035569, 2.02547, 1, 1, 1, 1, 1,
1.727749, -1.116852, 3.502947, 1, 1, 1, 1, 1,
1.733339, 2.210932, 0.1408722, 1, 1, 1, 1, 1,
1.7345, 0.2894805, 2.161887, 1, 1, 1, 1, 1,
1.745206, 0.2621116, 2.548412, 1, 1, 1, 1, 1,
1.776393, -1.075887, 1.142554, 1, 1, 1, 1, 1,
1.777726, -1.880172, 4.747971, 1, 1, 1, 1, 1,
1.806736, 0.7751221, 1.801216, 1, 1, 1, 1, 1,
1.843133, -0.7765182, 2.466127, 1, 1, 1, 1, 1,
1.861885, 0.2339707, 1.846155, 1, 1, 1, 1, 1,
1.889243, -1.202211, 1.252282, 1, 1, 1, 1, 1,
1.899534, 0.9532155, 0.4638655, 0, 0, 1, 1, 1,
1.905124, -0.5244856, 0.06569625, 1, 0, 0, 1, 1,
1.93827, 0.5715087, 0.6007543, 1, 0, 0, 1, 1,
1.948254, 0.8069103, 0.9351615, 1, 0, 0, 1, 1,
1.961113, -1.076247, 1.636664, 1, 0, 0, 1, 1,
1.974197, 0.3431043, 1.388963, 1, 0, 0, 1, 1,
2.035522, -0.8344139, 0.1898824, 0, 0, 0, 1, 1,
2.051818, -0.7248073, 1.667961, 0, 0, 0, 1, 1,
2.075426, 0.1988482, 1.212585, 0, 0, 0, 1, 1,
2.159655, -0.8768821, 2.789897, 0, 0, 0, 1, 1,
2.194996, 0.2915272, 3.378143, 0, 0, 0, 1, 1,
2.274559, -0.3047785, 0.8742182, 0, 0, 0, 1, 1,
2.293667, 0.4404564, 1.900341, 0, 0, 0, 1, 1,
2.371115, 0.06726438, 1.353877, 1, 1, 1, 1, 1,
2.611898, 0.579765, 0.6411768, 1, 1, 1, 1, 1,
2.672731, -0.8827419, 0.02938183, 1, 1, 1, 1, 1,
2.744319, 1.299883, 1.68104, 1, 1, 1, 1, 1,
2.75982, 0.6559159, 1.346476, 1, 1, 1, 1, 1,
2.8986, 0.558555, 2.021582, 1, 1, 1, 1, 1,
3.10458, -0.03486644, 2.132173, 1, 1, 1, 1, 1
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
var radius = 9.813008;
var distance = 34.46777;
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
mvMatrix.translate( 0.08326817, -0.2637365, -0.294204 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.46777);
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
