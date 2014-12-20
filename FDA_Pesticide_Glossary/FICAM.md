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
-3.111767, -1.388111, -0.7226631, 1, 0, 0, 1,
-2.625463, 0.2429591, -2.00353, 1, 0.007843138, 0, 1,
-2.616916, 0.2767451, -1.448209, 1, 0.01176471, 0, 1,
-2.529295, -0.3078887, -2.712838, 1, 0.01960784, 0, 1,
-2.381121, -1.572499, -1.778106, 1, 0.02352941, 0, 1,
-2.342154, 1.268962, -1.721871, 1, 0.03137255, 0, 1,
-2.315349, 1.384789, -0.987842, 1, 0.03529412, 0, 1,
-2.308621, 0.1086604, -0.9992378, 1, 0.04313726, 0, 1,
-2.300137, 1.122057, -0.7415322, 1, 0.04705882, 0, 1,
-2.178633, -0.4527312, -2.296782, 1, 0.05490196, 0, 1,
-2.172618, -1.747844, -2.118364, 1, 0.05882353, 0, 1,
-2.154809, 1.799803, 0.007140829, 1, 0.06666667, 0, 1,
-2.130553, 0.9798837, -2.049283, 1, 0.07058824, 0, 1,
-2.119595, 0.7720863, -1.838927, 1, 0.07843138, 0, 1,
-2.102119, -1.124139, -1.608126, 1, 0.08235294, 0, 1,
-2.088197, 1.681858, -0.9156618, 1, 0.09019608, 0, 1,
-2.057277, -0.7181564, -3.159131, 1, 0.09411765, 0, 1,
-2.049889, 0.09929722, -1.706532, 1, 0.1019608, 0, 1,
-2.046459, -0.1127813, -1.084888, 1, 0.1098039, 0, 1,
-2.038159, -0.4298298, -2.091967, 1, 0.1137255, 0, 1,
-2.005352, -1.26752, -1.652434, 1, 0.1215686, 0, 1,
-1.999619, 0.08215768, -1.93662, 1, 0.1254902, 0, 1,
-1.914546, 1.738144, -0.7606916, 1, 0.1333333, 0, 1,
-1.881089, 0.1498158, -3.050019, 1, 0.1372549, 0, 1,
-1.872637, 0.8547307, -0.3618965, 1, 0.145098, 0, 1,
-1.86943, -0.03916935, -3.705291, 1, 0.1490196, 0, 1,
-1.86702, 1.642335, -1.385192, 1, 0.1568628, 0, 1,
-1.855845, -0.4835755, -1.013084, 1, 0.1607843, 0, 1,
-1.819619, -0.05155359, -1.359115, 1, 0.1686275, 0, 1,
-1.816509, -0.04247176, -0.1004071, 1, 0.172549, 0, 1,
-1.815997, -0.2182543, -2.48412, 1, 0.1803922, 0, 1,
-1.799329, 1.055061, 1.136797, 1, 0.1843137, 0, 1,
-1.782295, -0.3210971, -1.445943, 1, 0.1921569, 0, 1,
-1.767869, 0.8779592, -1.216843, 1, 0.1960784, 0, 1,
-1.763903, -2.010707, -2.209591, 1, 0.2039216, 0, 1,
-1.759636, 0.4961752, -5.183266, 1, 0.2117647, 0, 1,
-1.755718, -1.248803, -2.955843, 1, 0.2156863, 0, 1,
-1.755053, 1.615041, 0.08682788, 1, 0.2235294, 0, 1,
-1.74034, -0.3225987, -2.517354, 1, 0.227451, 0, 1,
-1.736293, -1.220313, -2.671501, 1, 0.2352941, 0, 1,
-1.73468, 2.026097, -0.6950868, 1, 0.2392157, 0, 1,
-1.73427, -0.2534671, -2.740569, 1, 0.2470588, 0, 1,
-1.720232, 1.735663, -0.6586293, 1, 0.2509804, 0, 1,
-1.716493, 0.7365286, -0.7242765, 1, 0.2588235, 0, 1,
-1.711683, -0.07489702, -2.747948, 1, 0.2627451, 0, 1,
-1.694898, 0.3734689, -0.2745184, 1, 0.2705882, 0, 1,
-1.676561, 0.3279177, -1.173118, 1, 0.2745098, 0, 1,
-1.673073, 1.039588, -2.161661, 1, 0.282353, 0, 1,
-1.671037, 0.7410355, -0.6549903, 1, 0.2862745, 0, 1,
-1.632921, -0.1642912, -1.489456, 1, 0.2941177, 0, 1,
-1.616325, -0.4731544, -1.500106, 1, 0.3019608, 0, 1,
-1.61536, 0.3620753, -0.6546413, 1, 0.3058824, 0, 1,
-1.61161, -1.084253, -1.647806, 1, 0.3137255, 0, 1,
-1.609251, -0.742696, -1.715587, 1, 0.3176471, 0, 1,
-1.608572, 1.712977, 0.06200861, 1, 0.3254902, 0, 1,
-1.578494, -0.2855533, -2.118193, 1, 0.3294118, 0, 1,
-1.574929, -0.01506816, -2.29877, 1, 0.3372549, 0, 1,
-1.57175, 0.7019402, 0.3355579, 1, 0.3411765, 0, 1,
-1.568811, 0.3289512, -2.598737, 1, 0.3490196, 0, 1,
-1.555331, 0.6302589, 0.06368089, 1, 0.3529412, 0, 1,
-1.553277, -0.5264739, -2.190558, 1, 0.3607843, 0, 1,
-1.545507, -0.9411706, -2.549897, 1, 0.3647059, 0, 1,
-1.536132, 1.555451, -1.279987, 1, 0.372549, 0, 1,
-1.527948, 1.254217, -0.01878593, 1, 0.3764706, 0, 1,
-1.522318, -0.4741752, -1.920874, 1, 0.3843137, 0, 1,
-1.516536, 0.3797986, -2.422269, 1, 0.3882353, 0, 1,
-1.515402, -0.9264779, -2.578024, 1, 0.3960784, 0, 1,
-1.510301, 0.1022954, -2.070872, 1, 0.4039216, 0, 1,
-1.50203, 0.9243184, -2.273317, 1, 0.4078431, 0, 1,
-1.498789, 0.3131568, -3.004506, 1, 0.4156863, 0, 1,
-1.497098, -0.2680604, -2.320353, 1, 0.4196078, 0, 1,
-1.488669, -0.149052, -0.5798095, 1, 0.427451, 0, 1,
-1.488278, 1.288791, -0.405403, 1, 0.4313726, 0, 1,
-1.48552, -0.8089585, -2.011343, 1, 0.4392157, 0, 1,
-1.475615, -1.258611, -1.729527, 1, 0.4431373, 0, 1,
-1.465694, -1.284517, -0.7447065, 1, 0.4509804, 0, 1,
-1.4544, -1.24946, -3.265903, 1, 0.454902, 0, 1,
-1.449193, -0.298286, -1.056356, 1, 0.4627451, 0, 1,
-1.449115, 0.1446998, -1.443736, 1, 0.4666667, 0, 1,
-1.432923, 1.070116, -1.889174, 1, 0.4745098, 0, 1,
-1.422321, -1.416253, -2.631646, 1, 0.4784314, 0, 1,
-1.420971, 1.102429, -3.073837, 1, 0.4862745, 0, 1,
-1.415168, -2.256319, -3.154882, 1, 0.4901961, 0, 1,
-1.407531, -0.2006257, -2.405599, 1, 0.4980392, 0, 1,
-1.404252, -1.299143, -3.284807, 1, 0.5058824, 0, 1,
-1.389404, 0.359616, 1.685566, 1, 0.509804, 0, 1,
-1.383786, 1.109267, -3.133566, 1, 0.5176471, 0, 1,
-1.382087, -0.128201, -1.439512, 1, 0.5215687, 0, 1,
-1.381763, -1.382332, -3.024358, 1, 0.5294118, 0, 1,
-1.373461, -1.102456, -3.104354, 1, 0.5333334, 0, 1,
-1.369615, -0.3364711, -3.039682, 1, 0.5411765, 0, 1,
-1.365882, 0.8476681, 0.2577482, 1, 0.5450981, 0, 1,
-1.365874, -1.364268, -2.548564, 1, 0.5529412, 0, 1,
-1.353909, -1.099812, -1.605145, 1, 0.5568628, 0, 1,
-1.353433, 0.0171278, -0.8827426, 1, 0.5647059, 0, 1,
-1.351451, 0.1689434, -0.1195592, 1, 0.5686275, 0, 1,
-1.347757, 0.267263, -1.931558, 1, 0.5764706, 0, 1,
-1.344856, 0.4128267, -1.446528, 1, 0.5803922, 0, 1,
-1.310591, -0.6837351, -3.230371, 1, 0.5882353, 0, 1,
-1.309568, -0.7422763, -2.033137, 1, 0.5921569, 0, 1,
-1.303866, -0.7568463, -2.278931, 1, 0.6, 0, 1,
-1.301733, 1.476498, -0.4035757, 1, 0.6078432, 0, 1,
-1.29936, -0.6937035, -2.073264, 1, 0.6117647, 0, 1,
-1.298326, -0.2179316, -1.681999, 1, 0.6196079, 0, 1,
-1.287238, -0.9579904, -2.061426, 1, 0.6235294, 0, 1,
-1.281765, 0.6411337, -0.923912, 1, 0.6313726, 0, 1,
-1.281003, -0.3463587, -0.09668083, 1, 0.6352941, 0, 1,
-1.280824, 0.6254282, 0.1416963, 1, 0.6431373, 0, 1,
-1.278798, -0.1411603, -1.778401, 1, 0.6470588, 0, 1,
-1.277789, -1.229917, -2.774112, 1, 0.654902, 0, 1,
-1.277328, -0.7436745, -2.805073, 1, 0.6588235, 0, 1,
-1.266033, -0.287851, -1.848107, 1, 0.6666667, 0, 1,
-1.253704, 0.5236132, -1.612716, 1, 0.6705883, 0, 1,
-1.242031, 0.6287108, -2.475229, 1, 0.6784314, 0, 1,
-1.241591, 0.1603811, -2.121207, 1, 0.682353, 0, 1,
-1.239894, 0.4176286, -0.3430344, 1, 0.6901961, 0, 1,
-1.23736, -0.999747, -0.8515552, 1, 0.6941177, 0, 1,
-1.221856, 0.02083731, -0.4966155, 1, 0.7019608, 0, 1,
-1.221269, -0.5676638, -1.571065, 1, 0.7098039, 0, 1,
-1.219201, 0.3995632, 0.8615324, 1, 0.7137255, 0, 1,
-1.216622, 1.17002, -1.016057, 1, 0.7215686, 0, 1,
-1.212618, 0.7139283, 0.5957994, 1, 0.7254902, 0, 1,
-1.211743, -1.914745, -4.001425, 1, 0.7333333, 0, 1,
-1.210095, -0.5258096, -2.268246, 1, 0.7372549, 0, 1,
-1.207829, 0.9153469, -2.420772, 1, 0.7450981, 0, 1,
-1.202665, 0.8351117, -3.638435, 1, 0.7490196, 0, 1,
-1.201352, 1.217558, -1.350724, 1, 0.7568628, 0, 1,
-1.19719, -1.394733, -2.50617, 1, 0.7607843, 0, 1,
-1.190625, -0.1960448, -1.864943, 1, 0.7686275, 0, 1,
-1.188662, -0.1846712, 0.08123462, 1, 0.772549, 0, 1,
-1.187138, -0.8798316, -1.97858, 1, 0.7803922, 0, 1,
-1.186952, 0.1153872, -1.567583, 1, 0.7843137, 0, 1,
-1.176231, 0.989601, -0.8011076, 1, 0.7921569, 0, 1,
-1.176101, -1.088079, -3.777978, 1, 0.7960784, 0, 1,
-1.172922, -0.3598621, -1.487575, 1, 0.8039216, 0, 1,
-1.172122, 1.55642, 0.1969395, 1, 0.8117647, 0, 1,
-1.168406, -1.382793, -3.19196, 1, 0.8156863, 0, 1,
-1.162473, 0.6757255, -3.219246, 1, 0.8235294, 0, 1,
-1.157459, -0.0842265, -0.8812387, 1, 0.827451, 0, 1,
-1.153335, 0.6332781, -2.126961, 1, 0.8352941, 0, 1,
-1.151588, 0.2421525, -0.3258207, 1, 0.8392157, 0, 1,
-1.145654, -0.2114224, -1.869622, 1, 0.8470588, 0, 1,
-1.144457, -0.3546549, -0.7878975, 1, 0.8509804, 0, 1,
-1.141537, 1.870969, -0.6276399, 1, 0.8588235, 0, 1,
-1.126203, -0.3336135, -0.8135563, 1, 0.8627451, 0, 1,
-1.126188, 0.3930078, -1.262014, 1, 0.8705882, 0, 1,
-1.125034, -0.1464162, -2.563092, 1, 0.8745098, 0, 1,
-1.124754, 0.2688341, -1.568484, 1, 0.8823529, 0, 1,
-1.121135, 0.9650441, 0.04046699, 1, 0.8862745, 0, 1,
-1.121123, -0.6778021, -4.114866, 1, 0.8941177, 0, 1,
-1.119508, 0.4682281, -1.006906, 1, 0.8980392, 0, 1,
-1.106137, 0.2704848, -0.03903384, 1, 0.9058824, 0, 1,
-1.103806, -0.503489, -2.974318, 1, 0.9137255, 0, 1,
-1.103563, 1.575267, -1.803117, 1, 0.9176471, 0, 1,
-1.101188, 0.236789, -0.7937736, 1, 0.9254902, 0, 1,
-1.09982, 1.472697, -0.8459548, 1, 0.9294118, 0, 1,
-1.098571, -1.619072, -1.06848, 1, 0.9372549, 0, 1,
-1.093294, -1.118121, -1.465138, 1, 0.9411765, 0, 1,
-1.088943, 1.181811, 0.4428338, 1, 0.9490196, 0, 1,
-1.085803, -0.1019706, -1.855823, 1, 0.9529412, 0, 1,
-1.084927, 1.184668, -1.294147, 1, 0.9607843, 0, 1,
-1.064585, 1.102019, -2.809277, 1, 0.9647059, 0, 1,
-1.057072, -0.7553291, -0.4696231, 1, 0.972549, 0, 1,
-1.044414, 0.495887, 0.1771248, 1, 0.9764706, 0, 1,
-1.03551, -0.2249783, -2.368732, 1, 0.9843137, 0, 1,
-1.030528, 0.6257535, 0.7058975, 1, 0.9882353, 0, 1,
-1.024467, -0.9627806, -4.242074, 1, 0.9960784, 0, 1,
-1.021815, 1.346573, 0.1416068, 0.9960784, 1, 0, 1,
-1.021219, 0.4027165, -0.1774864, 0.9921569, 1, 0, 1,
-1.020109, 0.1050869, -1.052726, 0.9843137, 1, 0, 1,
-1.017679, -0.6689798, -0.3744519, 0.9803922, 1, 0, 1,
-1.009536, -0.3443512, -2.555973, 0.972549, 1, 0, 1,
-1.006305, -1.451967, -3.464686, 0.9686275, 1, 0, 1,
-1.000968, 2.771636, 2.247957, 0.9607843, 1, 0, 1,
-0.9997011, 0.8498379, 0.8506824, 0.9568627, 1, 0, 1,
-0.9954397, -0.4501427, -1.236216, 0.9490196, 1, 0, 1,
-0.9952562, -1.790983, -2.989225, 0.945098, 1, 0, 1,
-0.9893081, -0.3151185, -3.240987, 0.9372549, 1, 0, 1,
-0.9841343, 0.9860854, -0.9169222, 0.9333333, 1, 0, 1,
-0.9769965, 1.576698, -2.833097, 0.9254902, 1, 0, 1,
-0.9762533, 1.173846, -0.760535, 0.9215686, 1, 0, 1,
-0.9752078, 0.4742909, -1.228915, 0.9137255, 1, 0, 1,
-0.9700462, 0.08879089, -2.278182, 0.9098039, 1, 0, 1,
-0.96496, -0.2332152, -2.223445, 0.9019608, 1, 0, 1,
-0.9642853, -3.007833, -2.934511, 0.8941177, 1, 0, 1,
-0.9605902, 0.4450353, -1.702978, 0.8901961, 1, 0, 1,
-0.9538414, -0.2780004, -1.463087, 0.8823529, 1, 0, 1,
-0.9526802, -1.747654, -3.408056, 0.8784314, 1, 0, 1,
-0.9448054, -0.1979109, -2.960024, 0.8705882, 1, 0, 1,
-0.9444629, -0.2496555, -2.266844, 0.8666667, 1, 0, 1,
-0.9438424, -0.3270611, -0.7909755, 0.8588235, 1, 0, 1,
-0.9413625, 0.2684017, -0.09080829, 0.854902, 1, 0, 1,
-0.9370319, -1.14849, -2.466892, 0.8470588, 1, 0, 1,
-0.9361747, -0.07973627, -1.369061, 0.8431373, 1, 0, 1,
-0.9320821, -1.3163, -3.691878, 0.8352941, 1, 0, 1,
-0.9309601, -0.6943099, -1.894462, 0.8313726, 1, 0, 1,
-0.9302459, 0.4056564, -0.8716774, 0.8235294, 1, 0, 1,
-0.9241376, 1.423507, -0.4245098, 0.8196079, 1, 0, 1,
-0.9198402, -0.5246442, -3.7823, 0.8117647, 1, 0, 1,
-0.9190012, -0.648184, -1.265406, 0.8078431, 1, 0, 1,
-0.9156404, -0.9718107, -1.457697, 0.8, 1, 0, 1,
-0.9140038, -0.8778056, -1.873044, 0.7921569, 1, 0, 1,
-0.91265, -0.1290608, -2.414958, 0.7882353, 1, 0, 1,
-0.9098235, -0.6527759, -1.173517, 0.7803922, 1, 0, 1,
-0.904658, 0.5061213, -2.17748, 0.7764706, 1, 0, 1,
-0.9026054, 1.45004, -0.4253023, 0.7686275, 1, 0, 1,
-0.9013731, 0.4604703, -1.358611, 0.7647059, 1, 0, 1,
-0.8948759, -1.814467, -4.582985, 0.7568628, 1, 0, 1,
-0.8919877, -0.8895479, -2.192412, 0.7529412, 1, 0, 1,
-0.8794469, 0.4876801, -0.3490505, 0.7450981, 1, 0, 1,
-0.8774093, 1.174538, -0.3753481, 0.7411765, 1, 0, 1,
-0.8762791, 3.064726, -1.89947, 0.7333333, 1, 0, 1,
-0.8686461, -2.099743, -2.268864, 0.7294118, 1, 0, 1,
-0.8646814, 1.488692, 0.2432584, 0.7215686, 1, 0, 1,
-0.8616214, 1.190619, 0.5189926, 0.7176471, 1, 0, 1,
-0.8583268, -1.220041, -1.549199, 0.7098039, 1, 0, 1,
-0.8575193, 0.6739469, 0.8604882, 0.7058824, 1, 0, 1,
-0.8528751, -0.6965849, -1.44287, 0.6980392, 1, 0, 1,
-0.8469828, 0.5059088, -1.198454, 0.6901961, 1, 0, 1,
-0.8458491, -0.663245, -1.743864, 0.6862745, 1, 0, 1,
-0.8400107, -0.6026477, -2.868543, 0.6784314, 1, 0, 1,
-0.8375337, 0.3968441, -0.430773, 0.6745098, 1, 0, 1,
-0.8374956, -0.833376, -1.429191, 0.6666667, 1, 0, 1,
-0.8345993, -1.600044, -2.536656, 0.6627451, 1, 0, 1,
-0.832734, 1.912323, -2.015466, 0.654902, 1, 0, 1,
-0.8324251, 0.57763, 0.485522, 0.6509804, 1, 0, 1,
-0.8281761, 0.08706201, -0.2145022, 0.6431373, 1, 0, 1,
-0.8251736, 0.8756981, -0.3168137, 0.6392157, 1, 0, 1,
-0.8205205, -1.052329, -2.003838, 0.6313726, 1, 0, 1,
-0.814288, 0.1325927, -0.9012444, 0.627451, 1, 0, 1,
-0.8059703, 0.1906546, -0.122048, 0.6196079, 1, 0, 1,
-0.8001217, 1.141401, -1.592271, 0.6156863, 1, 0, 1,
-0.7923757, -0.208014, -3.195776, 0.6078432, 1, 0, 1,
-0.7919236, 1.193094, -0.8380165, 0.6039216, 1, 0, 1,
-0.7898142, -0.3220516, -2.568486, 0.5960785, 1, 0, 1,
-0.7853204, -0.3262176, -3.001678, 0.5882353, 1, 0, 1,
-0.7783998, -0.1731692, -2.979326, 0.5843138, 1, 0, 1,
-0.7783632, -0.8649989, -3.421137, 0.5764706, 1, 0, 1,
-0.7772591, -0.4964685, -2.966756, 0.572549, 1, 0, 1,
-0.7726284, 0.2531814, -0.006065483, 0.5647059, 1, 0, 1,
-0.7659159, -0.7263553, -2.605282, 0.5607843, 1, 0, 1,
-0.7641343, 1.007222, -1.075685, 0.5529412, 1, 0, 1,
-0.762013, 1.389248, -1.256868, 0.5490196, 1, 0, 1,
-0.7524149, 0.4196226, -0.6323907, 0.5411765, 1, 0, 1,
-0.7487933, -2.487875, -3.350264, 0.5372549, 1, 0, 1,
-0.7477303, -0.3814404, -0.4753004, 0.5294118, 1, 0, 1,
-0.7467427, -2.30607, -2.364411, 0.5254902, 1, 0, 1,
-0.723832, 0.979819, -1.520481, 0.5176471, 1, 0, 1,
-0.7235441, 0.08977217, -2.297503, 0.5137255, 1, 0, 1,
-0.7227985, -1.041497, -1.704095, 0.5058824, 1, 0, 1,
-0.7224985, -1.487424, -3.004282, 0.5019608, 1, 0, 1,
-0.7182261, -1.215112, -3.175461, 0.4941176, 1, 0, 1,
-0.7163357, -0.8782969, -2.231407, 0.4862745, 1, 0, 1,
-0.7160248, -0.3524191, -1.887628, 0.4823529, 1, 0, 1,
-0.6958318, -0.1508509, -1.392746, 0.4745098, 1, 0, 1,
-0.6931722, -0.7978682, -2.7412, 0.4705882, 1, 0, 1,
-0.6912329, 0.4817611, -2.118838, 0.4627451, 1, 0, 1,
-0.6887664, -0.08498489, -2.059426, 0.4588235, 1, 0, 1,
-0.6839784, -1.28956, -1.429487, 0.4509804, 1, 0, 1,
-0.6799383, 1.020904, -0.105617, 0.4470588, 1, 0, 1,
-0.6791075, 0.7281657, -0.4318355, 0.4392157, 1, 0, 1,
-0.6762669, 0.4556983, -2.162518, 0.4352941, 1, 0, 1,
-0.6741602, 0.1463396, 0.0181884, 0.427451, 1, 0, 1,
-0.6741201, -1.604134, -2.440568, 0.4235294, 1, 0, 1,
-0.6714969, 0.3670045, -0.1239593, 0.4156863, 1, 0, 1,
-0.6710465, -0.1334738, -3.296252, 0.4117647, 1, 0, 1,
-0.6658712, -1.191365, -2.822348, 0.4039216, 1, 0, 1,
-0.6617629, 0.8246186, -0.6017379, 0.3960784, 1, 0, 1,
-0.6614097, -0.7826284, -3.515318, 0.3921569, 1, 0, 1,
-0.6581618, -0.541953, -0.9572445, 0.3843137, 1, 0, 1,
-0.6559061, 0.2190161, -1.493119, 0.3803922, 1, 0, 1,
-0.6514111, -0.6397588, -2.074924, 0.372549, 1, 0, 1,
-0.646426, 0.1930349, -1.672271, 0.3686275, 1, 0, 1,
-0.6439798, -0.3805569, -2.812276, 0.3607843, 1, 0, 1,
-0.6436734, 0.1434955, -0.4656376, 0.3568628, 1, 0, 1,
-0.6435884, 1.245691, -0.5343614, 0.3490196, 1, 0, 1,
-0.6384442, 0.2753768, -2.005962, 0.345098, 1, 0, 1,
-0.6366994, 1.481706, -1.853125, 0.3372549, 1, 0, 1,
-0.6353883, 1.091462, -1.11953, 0.3333333, 1, 0, 1,
-0.6329147, 0.4213073, -0.383757, 0.3254902, 1, 0, 1,
-0.6312901, -1.294037, -2.947677, 0.3215686, 1, 0, 1,
-0.6246243, 0.1470791, 0.0219032, 0.3137255, 1, 0, 1,
-0.6238855, -0.5406045, -3.49633, 0.3098039, 1, 0, 1,
-0.6201552, 0.2500494, -2.214072, 0.3019608, 1, 0, 1,
-0.6170083, 0.03798914, -1.209023, 0.2941177, 1, 0, 1,
-0.6135489, 0.09245118, -3.676727, 0.2901961, 1, 0, 1,
-0.6114956, 1.144294, -0.6938995, 0.282353, 1, 0, 1,
-0.6077012, 1.689194, 1.10536, 0.2784314, 1, 0, 1,
-0.6066346, -0.3293912, -2.858435, 0.2705882, 1, 0, 1,
-0.6032723, -0.3919948, -3.854076, 0.2666667, 1, 0, 1,
-0.6027164, -0.2322595, -1.522555, 0.2588235, 1, 0, 1,
-0.5980036, 2.26548, -2.20806, 0.254902, 1, 0, 1,
-0.5959229, 0.6652628, -0.7458804, 0.2470588, 1, 0, 1,
-0.595248, -0.151733, -0.9979962, 0.2431373, 1, 0, 1,
-0.5900182, -0.8914785, -2.546036, 0.2352941, 1, 0, 1,
-0.5882247, -0.3827109, -3.28159, 0.2313726, 1, 0, 1,
-0.5874357, 0.8260632, -0.1742586, 0.2235294, 1, 0, 1,
-0.5831299, -0.2336189, -1.643193, 0.2196078, 1, 0, 1,
-0.5802882, -1.539441, -1.451214, 0.2117647, 1, 0, 1,
-0.5777184, -0.2064738, -1.974163, 0.2078431, 1, 0, 1,
-0.5773156, -2.551276, -2.033299, 0.2, 1, 0, 1,
-0.5657629, 0.6599346, -1.680371, 0.1921569, 1, 0, 1,
-0.5619002, -0.5859358, -2.736966, 0.1882353, 1, 0, 1,
-0.5576633, -0.3772522, -2.881647, 0.1803922, 1, 0, 1,
-0.55458, -1.400655, -1.559602, 0.1764706, 1, 0, 1,
-0.5544497, -0.5375, -0.7489259, 0.1686275, 1, 0, 1,
-0.5508969, -0.8735614, -2.00231, 0.1647059, 1, 0, 1,
-0.5480733, 2.190529, -1.469252, 0.1568628, 1, 0, 1,
-0.5478321, 0.6703216, 0.5660196, 0.1529412, 1, 0, 1,
-0.5456709, 0.2826459, -0.8979012, 0.145098, 1, 0, 1,
-0.5419698, -0.3083534, -2.667471, 0.1411765, 1, 0, 1,
-0.5396791, 0.8502952, -1.461255, 0.1333333, 1, 0, 1,
-0.5326171, 0.8841554, 0.8474796, 0.1294118, 1, 0, 1,
-0.5295099, 1.084978, 0.03913031, 0.1215686, 1, 0, 1,
-0.5279083, -1.022256, -2.84589, 0.1176471, 1, 0, 1,
-0.5262405, 1.228134, 2.517041, 0.1098039, 1, 0, 1,
-0.5178059, -0.8264199, -2.143254, 0.1058824, 1, 0, 1,
-0.5172302, 0.6419283, -2.477288, 0.09803922, 1, 0, 1,
-0.5085331, -0.356281, -3.213654, 0.09019608, 1, 0, 1,
-0.5015179, 1.042326, 0.7264435, 0.08627451, 1, 0, 1,
-0.4935619, 1.332102, 1.338774, 0.07843138, 1, 0, 1,
-0.4922372, 0.5160983, -0.3809144, 0.07450981, 1, 0, 1,
-0.4853135, -0.1706107, -2.2075, 0.06666667, 1, 0, 1,
-0.4812608, 0.8193323, 0.7481351, 0.0627451, 1, 0, 1,
-0.4673191, -0.214979, -1.941271, 0.05490196, 1, 0, 1,
-0.4644891, 0.1932874, 0.5832368, 0.05098039, 1, 0, 1,
-0.4634475, -0.1643129, -0.1443976, 0.04313726, 1, 0, 1,
-0.4627512, 0.0007551951, -1.358502, 0.03921569, 1, 0, 1,
-0.4611829, -1.330742, -4.17382, 0.03137255, 1, 0, 1,
-0.4601868, 0.5437312, -0.8545326, 0.02745098, 1, 0, 1,
-0.4580962, 0.5296007, -1.253216, 0.01960784, 1, 0, 1,
-0.4578083, -0.622774, -3.039161, 0.01568628, 1, 0, 1,
-0.4569436, 0.4674648, -0.7209351, 0.007843138, 1, 0, 1,
-0.4545378, -0.01911989, -2.560125, 0.003921569, 1, 0, 1,
-0.4527369, 0.4266509, -1.038372, 0, 1, 0.003921569, 1,
-0.452449, -0.8278617, -1.863302, 0, 1, 0.01176471, 1,
-0.4472184, 0.7796338, -0.9145351, 0, 1, 0.01568628, 1,
-0.4469909, -0.3026232, -0.3477966, 0, 1, 0.02352941, 1,
-0.4441223, -0.7846998, -2.663882, 0, 1, 0.02745098, 1,
-0.443052, -0.8686628, -2.533605, 0, 1, 0.03529412, 1,
-0.4421866, -0.905407, -3.620956, 0, 1, 0.03921569, 1,
-0.4381192, -1.167139, -2.677754, 0, 1, 0.04705882, 1,
-0.4352036, 1.460241, -0.1913677, 0, 1, 0.05098039, 1,
-0.4328716, -0.4208489, -2.191803, 0, 1, 0.05882353, 1,
-0.4305259, -2.029561, -3.612348, 0, 1, 0.0627451, 1,
-0.4302151, -0.08237628, -1.237991, 0, 1, 0.07058824, 1,
-0.4285699, -0.08411326, -3.341779, 0, 1, 0.07450981, 1,
-0.4272485, 1.373601, -0.9944715, 0, 1, 0.08235294, 1,
-0.4262402, -0.7683479, -1.867713, 0, 1, 0.08627451, 1,
-0.4248642, -0.9088766, -2.488031, 0, 1, 0.09411765, 1,
-0.4229596, 0.382568, 0.057134, 0, 1, 0.1019608, 1,
-0.4181311, 0.3187769, -0.1144959, 0, 1, 0.1058824, 1,
-0.4157561, -0.7716843, -2.382204, 0, 1, 0.1137255, 1,
-0.4086135, 1.708869, -0.01394632, 0, 1, 0.1176471, 1,
-0.4059581, -0.3858941, -0.5319517, 0, 1, 0.1254902, 1,
-0.4048402, 0.6759994, 0.08352557, 0, 1, 0.1294118, 1,
-0.4038422, -0.1023681, -0.2689464, 0, 1, 0.1372549, 1,
-0.4031736, -0.238693, -2.627147, 0, 1, 0.1411765, 1,
-0.3998877, 0.9785575, 0.9995286, 0, 1, 0.1490196, 1,
-0.3996346, -0.04417219, -0.2530296, 0, 1, 0.1529412, 1,
-0.3989347, 0.2101233, -1.162185, 0, 1, 0.1607843, 1,
-0.3968266, -1.508675, -2.018399, 0, 1, 0.1647059, 1,
-0.3967201, -1.598243, -2.457189, 0, 1, 0.172549, 1,
-0.3896703, -0.0710443, -0.9101613, 0, 1, 0.1764706, 1,
-0.3848129, 0.2778166, -1.294114, 0, 1, 0.1843137, 1,
-0.3804911, -0.3156205, -1.799612, 0, 1, 0.1882353, 1,
-0.3770765, 1.490211, -1.436887, 0, 1, 0.1960784, 1,
-0.3749713, -0.7751296, -3.229141, 0, 1, 0.2039216, 1,
-0.3746821, 0.007248497, -3.198361, 0, 1, 0.2078431, 1,
-0.3628756, 0.2494471, -0.606034, 0, 1, 0.2156863, 1,
-0.3585742, -0.5297373, -2.05595, 0, 1, 0.2196078, 1,
-0.3582274, -2.264752, -2.287334, 0, 1, 0.227451, 1,
-0.3554532, -0.7920944, -3.297498, 0, 1, 0.2313726, 1,
-0.3529428, -0.1347901, -1.236323, 0, 1, 0.2392157, 1,
-0.3464762, 1.554921, -1.170437, 0, 1, 0.2431373, 1,
-0.3378975, -0.7425926, -0.6149052, 0, 1, 0.2509804, 1,
-0.3364138, 1.302838, 0.2723077, 0, 1, 0.254902, 1,
-0.3341019, 0.4849986, -1.091661, 0, 1, 0.2627451, 1,
-0.3339787, 0.1770799, -1.931851, 0, 1, 0.2666667, 1,
-0.3338712, -0.04766119, -0.2406492, 0, 1, 0.2745098, 1,
-0.3332317, -0.9640113, -1.937168, 0, 1, 0.2784314, 1,
-0.3286887, 1.436962, -0.1289361, 0, 1, 0.2862745, 1,
-0.3270459, -0.6743114, -3.466801, 0, 1, 0.2901961, 1,
-0.3261931, -0.1703151, -2.685757, 0, 1, 0.2980392, 1,
-0.3243731, 0.5330032, 0.662644, 0, 1, 0.3058824, 1,
-0.3212644, -2.178833, -2.5582, 0, 1, 0.3098039, 1,
-0.3204731, -1.800981, -3.940513, 0, 1, 0.3176471, 1,
-0.318309, -0.1785012, -1.1898, 0, 1, 0.3215686, 1,
-0.313057, 0.04446555, -2.051775, 0, 1, 0.3294118, 1,
-0.3110611, -1.275596, -6.356704, 0, 1, 0.3333333, 1,
-0.3091669, -1.518373, -3.030022, 0, 1, 0.3411765, 1,
-0.308683, -1.311214, -2.452581, 0, 1, 0.345098, 1,
-0.3052586, 1.044199, -1.801355, 0, 1, 0.3529412, 1,
-0.3049284, 1.054512, -1.645359, 0, 1, 0.3568628, 1,
-0.3029451, 0.7932548, -2.542079, 0, 1, 0.3647059, 1,
-0.2985108, 0.212935, -3.005593, 0, 1, 0.3686275, 1,
-0.2928214, -1.250346, -3.585899, 0, 1, 0.3764706, 1,
-0.2841939, 0.4782846, -0.6556396, 0, 1, 0.3803922, 1,
-0.2838237, -0.2622748, -1.521956, 0, 1, 0.3882353, 1,
-0.2817409, 2.612591, 0.07969232, 0, 1, 0.3921569, 1,
-0.2813971, 1.519005, -1.303668, 0, 1, 0.4, 1,
-0.2805375, -0.3735747, -1.916289, 0, 1, 0.4078431, 1,
-0.279462, -1.00912, -3.512229, 0, 1, 0.4117647, 1,
-0.2776096, -0.1784189, -3.471698, 0, 1, 0.4196078, 1,
-0.2765684, 0.7513329, 0.2591275, 0, 1, 0.4235294, 1,
-0.275856, -0.115086, -2.093035, 0, 1, 0.4313726, 1,
-0.2716348, 0.8137493, -1.743495, 0, 1, 0.4352941, 1,
-0.2685537, -1.281727, -0.5715827, 0, 1, 0.4431373, 1,
-0.2658036, -0.2308894, -2.470544, 0, 1, 0.4470588, 1,
-0.2656768, -1.146425, -3.596629, 0, 1, 0.454902, 1,
-0.2609449, 0.03491635, -2.297988, 0, 1, 0.4588235, 1,
-0.260768, 1.108441, -1.896532, 0, 1, 0.4666667, 1,
-0.2582857, 0.4213085, -0.6449224, 0, 1, 0.4705882, 1,
-0.2558491, 1.261772, -0.4168949, 0, 1, 0.4784314, 1,
-0.2541606, 1.030858, 0.1658309, 0, 1, 0.4823529, 1,
-0.2530599, -2.07045, -2.227909, 0, 1, 0.4901961, 1,
-0.2510908, 2.318968, 0.8026919, 0, 1, 0.4941176, 1,
-0.2491249, 1.505711, 1.154099, 0, 1, 0.5019608, 1,
-0.246685, -2.090762, -3.097952, 0, 1, 0.509804, 1,
-0.2418742, 0.1586604, -0.851362, 0, 1, 0.5137255, 1,
-0.2405996, 0.9676989, 0.5102544, 0, 1, 0.5215687, 1,
-0.2405434, 0.1453876, -1.98649, 0, 1, 0.5254902, 1,
-0.2399953, 0.3939784, -0.7605196, 0, 1, 0.5333334, 1,
-0.2361448, 1.444795, -0.4172062, 0, 1, 0.5372549, 1,
-0.2343827, 0.1717847, -0.4243225, 0, 1, 0.5450981, 1,
-0.2343699, 0.4362464, -0.3473618, 0, 1, 0.5490196, 1,
-0.2337053, -0.119994, -3.842016, 0, 1, 0.5568628, 1,
-0.2326305, 0.5583366, 1.154603, 0, 1, 0.5607843, 1,
-0.2284953, 2.329755, 0.5915307, 0, 1, 0.5686275, 1,
-0.2279669, 1.146078, -1.255746, 0, 1, 0.572549, 1,
-0.2279215, 0.8085155, -0.1415001, 0, 1, 0.5803922, 1,
-0.2265014, 0.3943427, 0.2158516, 0, 1, 0.5843138, 1,
-0.2225821, 1.088248, -0.5664763, 0, 1, 0.5921569, 1,
-0.2217914, 1.716615, 0.42246, 0, 1, 0.5960785, 1,
-0.219594, -0.2492289, -1.985803, 0, 1, 0.6039216, 1,
-0.2104648, -1.50909, -2.357564, 0, 1, 0.6117647, 1,
-0.2091503, -0.07024613, -1.030315, 0, 1, 0.6156863, 1,
-0.208248, 1.035484, 0.1441921, 0, 1, 0.6235294, 1,
-0.2069968, 0.04058834, -1.945503, 0, 1, 0.627451, 1,
-0.2048147, -2.056121, -3.177865, 0, 1, 0.6352941, 1,
-0.2032119, -0.4897029, -3.217424, 0, 1, 0.6392157, 1,
-0.2025227, 0.9444034, -0.5978848, 0, 1, 0.6470588, 1,
-0.1984572, -0.2805056, -1.657296, 0, 1, 0.6509804, 1,
-0.1980417, 1.262816, -0.3457565, 0, 1, 0.6588235, 1,
-0.1951388, -1.599471, -3.521349, 0, 1, 0.6627451, 1,
-0.1927595, 0.8208478, 1.848015, 0, 1, 0.6705883, 1,
-0.1894077, 0.4478733, -0.07541873, 0, 1, 0.6745098, 1,
-0.183998, 0.8998138, -0.8930619, 0, 1, 0.682353, 1,
-0.1801258, 1.294611, -0.1896226, 0, 1, 0.6862745, 1,
-0.1778791, -1.687156, -2.899946, 0, 1, 0.6941177, 1,
-0.1722628, 1.080826, 0.196861, 0, 1, 0.7019608, 1,
-0.1691777, -1.160368, -3.759169, 0, 1, 0.7058824, 1,
-0.1664309, -1.501738, -3.13747, 0, 1, 0.7137255, 1,
-0.1648199, -0.8721094, -2.765601, 0, 1, 0.7176471, 1,
-0.1641887, -0.5135303, -3.831121, 0, 1, 0.7254902, 1,
-0.163042, -1.368216, -4.431587, 0, 1, 0.7294118, 1,
-0.1606743, 0.6016352, 1.399025, 0, 1, 0.7372549, 1,
-0.158864, -0.2046338, -2.999936, 0, 1, 0.7411765, 1,
-0.1582355, -0.8531088, -2.957184, 0, 1, 0.7490196, 1,
-0.1542102, -1.341493, -3.894033, 0, 1, 0.7529412, 1,
-0.1520263, -0.0128418, -1.526645, 0, 1, 0.7607843, 1,
-0.1515887, 0.3845291, -0.9169895, 0, 1, 0.7647059, 1,
-0.1480666, -1.389079, -2.66392, 0, 1, 0.772549, 1,
-0.1477896, 0.6816553, 0.2034038, 0, 1, 0.7764706, 1,
-0.1472032, -0.6427279, -1.074693, 0, 1, 0.7843137, 1,
-0.1468514, 1.492617, -0.08949114, 0, 1, 0.7882353, 1,
-0.1460725, 1.108741, 0.1038735, 0, 1, 0.7960784, 1,
-0.1404143, 0.807127, -0.3219816, 0, 1, 0.8039216, 1,
-0.1390489, -0.4661353, -3.641524, 0, 1, 0.8078431, 1,
-0.1387022, -0.06161176, -4.292984, 0, 1, 0.8156863, 1,
-0.1372297, 0.4054233, -1.407677, 0, 1, 0.8196079, 1,
-0.1340386, 0.3379102, -1.534374, 0, 1, 0.827451, 1,
-0.1295778, 2.483305, 0.947479, 0, 1, 0.8313726, 1,
-0.1294766, 0.2548204, -0.5944456, 0, 1, 0.8392157, 1,
-0.1213497, -0.2843759, -4.304267, 0, 1, 0.8431373, 1,
-0.1163878, 1.198446, -0.8572727, 0, 1, 0.8509804, 1,
-0.1114688, -0.8043478, -2.663848, 0, 1, 0.854902, 1,
-0.1101207, 0.2905563, -0.7918074, 0, 1, 0.8627451, 1,
-0.1083308, -0.247965, -3.630521, 0, 1, 0.8666667, 1,
-0.1056403, 0.7023693, -2.465406, 0, 1, 0.8745098, 1,
-0.1051877, -0.0795516, -4.703875, 0, 1, 0.8784314, 1,
-0.1005726, -0.6441895, -1.99841, 0, 1, 0.8862745, 1,
-0.09543186, -0.3427899, -1.541177, 0, 1, 0.8901961, 1,
-0.09383761, -0.3695019, -3.84633, 0, 1, 0.8980392, 1,
-0.0866679, 0.5675405, -1.595523, 0, 1, 0.9058824, 1,
-0.08564551, -1.019028, -2.792256, 0, 1, 0.9098039, 1,
-0.07656229, 1.610678, -0.2338918, 0, 1, 0.9176471, 1,
-0.07546873, -0.521314, -2.304814, 0, 1, 0.9215686, 1,
-0.07542609, -0.2103861, -3.367934, 0, 1, 0.9294118, 1,
-0.06924253, 1.087969, -1.234179, 0, 1, 0.9333333, 1,
-0.06784911, 1.438418, 1.606733, 0, 1, 0.9411765, 1,
-0.06734698, 0.985296, 0.5633755, 0, 1, 0.945098, 1,
-0.06556365, -0.6485597, -3.820025, 0, 1, 0.9529412, 1,
-0.06428105, -0.8061503, -1.919208, 0, 1, 0.9568627, 1,
-0.06312063, 0.6555523, -0.9081538, 0, 1, 0.9647059, 1,
-0.06219862, 0.304341, -0.2252368, 0, 1, 0.9686275, 1,
-0.05850201, 1.942058, -1.076013, 0, 1, 0.9764706, 1,
-0.05645893, 1.317881, 0.4383028, 0, 1, 0.9803922, 1,
-0.05582534, 0.2298099, -0.01321006, 0, 1, 0.9882353, 1,
-0.05524067, 1.062001, 0.2160113, 0, 1, 0.9921569, 1,
-0.05507042, 1.139763, 0.0906343, 0, 1, 1, 1,
-0.05298312, -2.149174, -3.111447, 0, 0.9921569, 1, 1,
-0.05192387, 0.4118944, -0.1797146, 0, 0.9882353, 1, 1,
-0.05097903, 0.1682042, -0.5523134, 0, 0.9803922, 1, 1,
-0.047742, -1.297145, -2.852826, 0, 0.9764706, 1, 1,
-0.0453183, -1.265807, -2.49597, 0, 0.9686275, 1, 1,
-0.04417166, -0.705666, -4.083166, 0, 0.9647059, 1, 1,
-0.0428185, -1.123201, -3.007378, 0, 0.9568627, 1, 1,
-0.04172876, 0.7752661, -0.1998689, 0, 0.9529412, 1, 1,
-0.04013502, -0.2263941, -3.679564, 0, 0.945098, 1, 1,
-0.03919286, 0.2747932, 0.2695964, 0, 0.9411765, 1, 1,
-0.03776709, 1.400972, 0.739283, 0, 0.9333333, 1, 1,
-0.03543407, 0.7365094, 1.057107, 0, 0.9294118, 1, 1,
-0.03050477, -0.8410561, -4.203493, 0, 0.9215686, 1, 1,
-0.02909558, -0.5860182, -3.148318, 0, 0.9176471, 1, 1,
-0.02336551, 0.5391095, -0.7574643, 0, 0.9098039, 1, 1,
-0.02017188, 0.08607425, -0.7078111, 0, 0.9058824, 1, 1,
-0.0185356, -1.030241, -1.862326, 0, 0.8980392, 1, 1,
-0.0165136, 0.5811557, 1.516435, 0, 0.8901961, 1, 1,
-0.01263419, -0.05307924, -4.742499, 0, 0.8862745, 1, 1,
-0.01068215, -1.945556, -4.531951, 0, 0.8784314, 1, 1,
-0.010056, 0.6912902, -1.691471, 0, 0.8745098, 1, 1,
-0.009895076, 0.5160219, -0.4671623, 0, 0.8666667, 1, 1,
-0.009576628, 0.9351725, -0.1171125, 0, 0.8627451, 1, 1,
-0.007718068, 1.243087, -0.1096839, 0, 0.854902, 1, 1,
0.008526409, 0.2399444, -0.4978524, 0, 0.8509804, 1, 1,
0.009013552, -1.909712, 3.80817, 0, 0.8431373, 1, 1,
0.01227416, 1.731564, 1.150256, 0, 0.8392157, 1, 1,
0.01685813, -0.8254597, 3.588104, 0, 0.8313726, 1, 1,
0.01783922, -1.316659, 3.79545, 0, 0.827451, 1, 1,
0.02054193, -0.4497105, 5.002978, 0, 0.8196079, 1, 1,
0.02254329, 0.5582803, -0.7982618, 0, 0.8156863, 1, 1,
0.02343211, -1.519896, 4.357262, 0, 0.8078431, 1, 1,
0.02726994, -1.959918, 4.217974, 0, 0.8039216, 1, 1,
0.03075159, 0.5746679, -0.03383086, 0, 0.7960784, 1, 1,
0.03135293, -2.218308, 4.035385, 0, 0.7882353, 1, 1,
0.03469642, 0.7503147, 0.2493128, 0, 0.7843137, 1, 1,
0.04268847, -1.539945, 4.841055, 0, 0.7764706, 1, 1,
0.045771, -1.846868, 3.596499, 0, 0.772549, 1, 1,
0.04978158, 0.4472717, -0.9787756, 0, 0.7647059, 1, 1,
0.05159493, 0.403404, 0.7933235, 0, 0.7607843, 1, 1,
0.05167313, 0.4733296, 1.724823, 0, 0.7529412, 1, 1,
0.05170679, 1.407743, 0.7565707, 0, 0.7490196, 1, 1,
0.0573198, -0.5511525, 2.499792, 0, 0.7411765, 1, 1,
0.05879535, -0.04693533, 1.308398, 0, 0.7372549, 1, 1,
0.05902423, -0.566958, 2.730685, 0, 0.7294118, 1, 1,
0.06099987, 1.455395, -0.4701244, 0, 0.7254902, 1, 1,
0.06239154, 0.4853337, -0.8354769, 0, 0.7176471, 1, 1,
0.06248257, -0.3050053, 4.563435, 0, 0.7137255, 1, 1,
0.06334138, 1.609347, 0.9415157, 0, 0.7058824, 1, 1,
0.06411885, 1.590657, 3.754416, 0, 0.6980392, 1, 1,
0.06759553, 0.4234769, 1.264483, 0, 0.6941177, 1, 1,
0.06882057, 0.8112599, 0.5451058, 0, 0.6862745, 1, 1,
0.07010349, -0.2343225, 2.135056, 0, 0.682353, 1, 1,
0.07353251, -1.060068, 2.252212, 0, 0.6745098, 1, 1,
0.07832746, 0.2627171, 1.541674, 0, 0.6705883, 1, 1,
0.08402473, -1.693573, 3.38622, 0, 0.6627451, 1, 1,
0.084562, -0.06833773, 1.222763, 0, 0.6588235, 1, 1,
0.08594398, -1.382899, 3.125867, 0, 0.6509804, 1, 1,
0.08729431, 0.4973528, 2.179311, 0, 0.6470588, 1, 1,
0.08800467, 1.105826, 0.4410531, 0, 0.6392157, 1, 1,
0.09160083, -1.362742, 4.49767, 0, 0.6352941, 1, 1,
0.0917716, -1.184426, 4.601553, 0, 0.627451, 1, 1,
0.09473605, -0.142396, 3.708228, 0, 0.6235294, 1, 1,
0.09495457, -1.979902, 3.578985, 0, 0.6156863, 1, 1,
0.09756021, 0.5423368, -1.102245, 0, 0.6117647, 1, 1,
0.09839858, 1.417661, -0.3022878, 0, 0.6039216, 1, 1,
0.100161, -0.8893561, 4.001126, 0, 0.5960785, 1, 1,
0.1002595, -1.490903, 2.392372, 0, 0.5921569, 1, 1,
0.1065939, 0.6229283, -0.3939317, 0, 0.5843138, 1, 1,
0.1096063, 0.484462, 1.117589, 0, 0.5803922, 1, 1,
0.111324, 0.2315703, -0.5749974, 0, 0.572549, 1, 1,
0.1135109, -0.2834869, 3.314414, 0, 0.5686275, 1, 1,
0.1140904, 0.5246642, 0.1946042, 0, 0.5607843, 1, 1,
0.1143634, -0.4531001, 5.158983, 0, 0.5568628, 1, 1,
0.1147872, -1.014478, 1.913963, 0, 0.5490196, 1, 1,
0.1149656, -0.8354201, 4.091556, 0, 0.5450981, 1, 1,
0.1156598, 1.490242, -0.3601956, 0, 0.5372549, 1, 1,
0.1159161, -0.09939628, 3.440689, 0, 0.5333334, 1, 1,
0.1176208, 0.5661821, 1.308307, 0, 0.5254902, 1, 1,
0.1184385, -0.7663341, 4.401231, 0, 0.5215687, 1, 1,
0.1196506, 2.295565, 0.7567759, 0, 0.5137255, 1, 1,
0.1219177, -0.6080931, 3.138984, 0, 0.509804, 1, 1,
0.1297324, 0.187634, 2.386786, 0, 0.5019608, 1, 1,
0.1314984, 0.3073232, -0.1169573, 0, 0.4941176, 1, 1,
0.1326808, 0.6372072, -3.346457, 0, 0.4901961, 1, 1,
0.1360053, 0.295347, 0.06774959, 0, 0.4823529, 1, 1,
0.1381866, 1.148612, -0.3004072, 0, 0.4784314, 1, 1,
0.1383048, 0.4290678, -0.2250723, 0, 0.4705882, 1, 1,
0.1421173, 0.2733244, -1.058962, 0, 0.4666667, 1, 1,
0.1457274, 0.4803203, -0.5821361, 0, 0.4588235, 1, 1,
0.1463415, 0.1639639, 0.7292665, 0, 0.454902, 1, 1,
0.1466983, -2.194676, 2.736335, 0, 0.4470588, 1, 1,
0.1505692, -0.8448501, 2.818701, 0, 0.4431373, 1, 1,
0.1514398, 1.167207, 0.917671, 0, 0.4352941, 1, 1,
0.1564691, 1.68278, -0.1556121, 0, 0.4313726, 1, 1,
0.1596302, 0.4599093, 0.8864919, 0, 0.4235294, 1, 1,
0.16246, 0.2486352, 1.924379, 0, 0.4196078, 1, 1,
0.1642085, -0.02931337, 1.079154, 0, 0.4117647, 1, 1,
0.1680599, 0.7682867, 0.4743778, 0, 0.4078431, 1, 1,
0.170959, -0.8247417, 2.782059, 0, 0.4, 1, 1,
0.1773097, 0.6265381, 0.5801297, 0, 0.3921569, 1, 1,
0.1893017, 0.7089891, 0.09541405, 0, 0.3882353, 1, 1,
0.1900011, -0.2447745, 0.7412571, 0, 0.3803922, 1, 1,
0.1907305, 0.336825, 1.068967, 0, 0.3764706, 1, 1,
0.1968533, 1.356351, -1.222764, 0, 0.3686275, 1, 1,
0.1990184, 0.491414, 0.3456918, 0, 0.3647059, 1, 1,
0.2010581, -0.6540908, 3.123585, 0, 0.3568628, 1, 1,
0.2018292, 0.670063, 0.4496681, 0, 0.3529412, 1, 1,
0.2018956, 0.5069194, -0.9302716, 0, 0.345098, 1, 1,
0.2025584, 1.240166, 1.066687, 0, 0.3411765, 1, 1,
0.2051776, 0.2651757, -0.2719878, 0, 0.3333333, 1, 1,
0.2076745, -1.320308, 1.376358, 0, 0.3294118, 1, 1,
0.2117311, 0.2016451, 1.724571, 0, 0.3215686, 1, 1,
0.2122243, -0.9325522, 2.370106, 0, 0.3176471, 1, 1,
0.2175446, 0.8829857, 0.08517208, 0, 0.3098039, 1, 1,
0.2193491, -0.7600709, 1.690066, 0, 0.3058824, 1, 1,
0.2216143, -1.261568, 3.242955, 0, 0.2980392, 1, 1,
0.2282126, -0.5728983, 2.9264, 0, 0.2901961, 1, 1,
0.2307252, 0.3903938, -0.02304559, 0, 0.2862745, 1, 1,
0.2311797, 0.3565268, -0.3233179, 0, 0.2784314, 1, 1,
0.2332311, -1.677857, 4.151119, 0, 0.2745098, 1, 1,
0.23359, -1.2302, 2.930928, 0, 0.2666667, 1, 1,
0.2339115, 0.07717522, 2.507884, 0, 0.2627451, 1, 1,
0.2370272, 0.7053746, 0.9640166, 0, 0.254902, 1, 1,
0.2377307, 0.8613719, 0.06978972, 0, 0.2509804, 1, 1,
0.2407796, 0.2117439, -1.48212, 0, 0.2431373, 1, 1,
0.2578342, 0.6703906, 1.071698, 0, 0.2392157, 1, 1,
0.2596931, 0.9735234, 0.6390828, 0, 0.2313726, 1, 1,
0.2623426, 0.1735435, 0.7876973, 0, 0.227451, 1, 1,
0.2659883, -0.5765647, 2.309762, 0, 0.2196078, 1, 1,
0.2674975, -0.2092835, 0.6882871, 0, 0.2156863, 1, 1,
0.2704359, 0.8270159, 0.04720764, 0, 0.2078431, 1, 1,
0.2710115, -0.293081, 2.414363, 0, 0.2039216, 1, 1,
0.2751421, 1.636301, 0.7785105, 0, 0.1960784, 1, 1,
0.2784149, 1.402462, 1.196097, 0, 0.1882353, 1, 1,
0.2792009, 0.4024113, 0.7118686, 0, 0.1843137, 1, 1,
0.2854227, 1.217392, -0.3711427, 0, 0.1764706, 1, 1,
0.2893447, 0.3916503, 0.6732106, 0, 0.172549, 1, 1,
0.2960237, -0.4885219, 4.43061, 0, 0.1647059, 1, 1,
0.2999543, -1.156183, 3.740915, 0, 0.1607843, 1, 1,
0.3039566, 0.4380063, -0.9465697, 0, 0.1529412, 1, 1,
0.3098713, -1.792402, 3.500035, 0, 0.1490196, 1, 1,
0.3125015, 0.01437128, 2.739587, 0, 0.1411765, 1, 1,
0.3171749, -0.6317294, 3.916336, 0, 0.1372549, 1, 1,
0.3172413, 0.3151069, 0.001369711, 0, 0.1294118, 1, 1,
0.3185537, 1.387829, 0.2791586, 0, 0.1254902, 1, 1,
0.3187437, 0.5617025, 0.899891, 0, 0.1176471, 1, 1,
0.3189721, -1.555509, 0.754612, 0, 0.1137255, 1, 1,
0.3195666, 0.04049421, 2.583229, 0, 0.1058824, 1, 1,
0.3203306, 1.986827, -0.2747584, 0, 0.09803922, 1, 1,
0.3238277, -0.1089151, 2.497102, 0, 0.09411765, 1, 1,
0.326994, -2.15055, 0.5434476, 0, 0.08627451, 1, 1,
0.3339052, 1.156363, 0.347661, 0, 0.08235294, 1, 1,
0.3343885, -0.4851912, 2.16749, 0, 0.07450981, 1, 1,
0.3396657, 1.002042, 1.12852, 0, 0.07058824, 1, 1,
0.3410459, -0.140193, 1.019887, 0, 0.0627451, 1, 1,
0.3481408, 0.5009841, 0.8717404, 0, 0.05882353, 1, 1,
0.3507588, 0.3505766, 1.474989, 0, 0.05098039, 1, 1,
0.3513372, 1.729786, 0.218073, 0, 0.04705882, 1, 1,
0.3531607, -0.06544961, 2.030117, 0, 0.03921569, 1, 1,
0.3532508, -0.6707114, 3.151142, 0, 0.03529412, 1, 1,
0.3584876, 0.7702808, 0.2603841, 0, 0.02745098, 1, 1,
0.3586289, -0.3083774, 2.625164, 0, 0.02352941, 1, 1,
0.3629304, 0.7552574, 0.8217685, 0, 0.01568628, 1, 1,
0.366044, 0.2253779, -0.4476191, 0, 0.01176471, 1, 1,
0.3661918, -0.1622305, 2.413658, 0, 0.003921569, 1, 1,
0.3679399, -0.4667318, 3.876217, 0.003921569, 0, 1, 1,
0.3691474, 0.1459255, 1.127591, 0.007843138, 0, 1, 1,
0.3732831, 0.3590182, 0.6514246, 0.01568628, 0, 1, 1,
0.3759887, 1.811215, 1.235656, 0.01960784, 0, 1, 1,
0.3767026, -0.1616518, 2.55408, 0.02745098, 0, 1, 1,
0.3839519, -0.2967931, 2.120933, 0.03137255, 0, 1, 1,
0.3860244, -0.5089861, 1.931783, 0.03921569, 0, 1, 1,
0.3913754, -0.8263379, 0.2778273, 0.04313726, 0, 1, 1,
0.3931046, 0.14209, 1.211368, 0.05098039, 0, 1, 1,
0.3949975, 0.8906184, 2.660014, 0.05490196, 0, 1, 1,
0.4001919, -0.2486479, 2.065469, 0.0627451, 0, 1, 1,
0.4015201, -0.3661551, 3.346839, 0.06666667, 0, 1, 1,
0.4112399, -1.277152, 4.174918, 0.07450981, 0, 1, 1,
0.4122471, 0.7665653, 0.6320603, 0.07843138, 0, 1, 1,
0.4129586, 0.4044958, 0.336819, 0.08627451, 0, 1, 1,
0.4155729, 0.4295017, -0.2572772, 0.09019608, 0, 1, 1,
0.4219227, -0.9579216, 2.399002, 0.09803922, 0, 1, 1,
0.4227724, 1.649453, 1.757204, 0.1058824, 0, 1, 1,
0.4285396, 0.6804975, 1.802216, 0.1098039, 0, 1, 1,
0.4313061, -0.5741767, 1.20391, 0.1176471, 0, 1, 1,
0.4321917, -0.9434379, 2.367541, 0.1215686, 0, 1, 1,
0.4384589, 0.6827586, 1.970828, 0.1294118, 0, 1, 1,
0.4479486, 0.8283799, 0.1539436, 0.1333333, 0, 1, 1,
0.4495972, 0.6352409, 2.11907, 0.1411765, 0, 1, 1,
0.4534943, 0.1156891, 1.896857, 0.145098, 0, 1, 1,
0.4538648, 0.6490808, 0.569472, 0.1529412, 0, 1, 1,
0.4552162, 0.8128624, 0.3657776, 0.1568628, 0, 1, 1,
0.460695, 0.06162867, 1.743127, 0.1647059, 0, 1, 1,
0.4667607, -1.734191, 1.663857, 0.1686275, 0, 1, 1,
0.4711684, -0.6895438, 3.504256, 0.1764706, 0, 1, 1,
0.4778834, -0.4939764, 2.916025, 0.1803922, 0, 1, 1,
0.4785728, -0.402283, 2.324269, 0.1882353, 0, 1, 1,
0.4824373, -1.4909, 2.222307, 0.1921569, 0, 1, 1,
0.4851583, 0.09333418, 2.234576, 0.2, 0, 1, 1,
0.4868633, -0.7244798, 2.298561, 0.2078431, 0, 1, 1,
0.489395, 0.8889406, 0.08746012, 0.2117647, 0, 1, 1,
0.4904287, -0.3357326, 1.312823, 0.2196078, 0, 1, 1,
0.4925335, 1.469876, -0.4802543, 0.2235294, 0, 1, 1,
0.497413, 0.115005, 0.8068632, 0.2313726, 0, 1, 1,
0.4978103, -0.9762304, 3.134612, 0.2352941, 0, 1, 1,
0.4993291, -2.792473, 3.335197, 0.2431373, 0, 1, 1,
0.5016882, 0.7000084, 1.495216, 0.2470588, 0, 1, 1,
0.5018476, -0.7592243, 1.070842, 0.254902, 0, 1, 1,
0.5060655, 0.3752746, 0.4028432, 0.2588235, 0, 1, 1,
0.5069726, 0.1474197, -0.7936103, 0.2666667, 0, 1, 1,
0.5103466, -0.7507285, 2.83742, 0.2705882, 0, 1, 1,
0.5109242, 1.106132, 0.3248285, 0.2784314, 0, 1, 1,
0.5133822, -0.8540742, 3.63656, 0.282353, 0, 1, 1,
0.5217047, 1.516121, 1.103796, 0.2901961, 0, 1, 1,
0.5280883, 0.02412482, 3.006071, 0.2941177, 0, 1, 1,
0.5286078, 0.3272654, 1.335579, 0.3019608, 0, 1, 1,
0.5347154, 0.9481977, 1.266713, 0.3098039, 0, 1, 1,
0.5359957, 0.6997125, 2.136525, 0.3137255, 0, 1, 1,
0.5363551, 0.901114, -1.112352, 0.3215686, 0, 1, 1,
0.5379963, -1.369747, 0.5548102, 0.3254902, 0, 1, 1,
0.5434244, 0.04766829, 0.7879526, 0.3333333, 0, 1, 1,
0.5449255, 1.130115, -1.135071, 0.3372549, 0, 1, 1,
0.5471046, 1.160856, -0.2418378, 0.345098, 0, 1, 1,
0.5480141, -0.2449474, 4.015305, 0.3490196, 0, 1, 1,
0.5505521, -1.705522, 4.06625, 0.3568628, 0, 1, 1,
0.5514117, 0.2207265, 2.126841, 0.3607843, 0, 1, 1,
0.5515379, 0.5616429, 1.606535, 0.3686275, 0, 1, 1,
0.5561613, 0.1293849, 0.5082228, 0.372549, 0, 1, 1,
0.5582563, -0.7638515, 3.245912, 0.3803922, 0, 1, 1,
0.5615528, -0.5283461, 2.384015, 0.3843137, 0, 1, 1,
0.5687248, -0.3501678, 3.145971, 0.3921569, 0, 1, 1,
0.5803428, -0.1807893, 1.520876, 0.3960784, 0, 1, 1,
0.5804748, -0.06410895, 1.659756, 0.4039216, 0, 1, 1,
0.5814179, 0.5192596, 1.190661, 0.4117647, 0, 1, 1,
0.5996088, 0.8032118, 1.007244, 0.4156863, 0, 1, 1,
0.6014627, -0.7429304, 2.707145, 0.4235294, 0, 1, 1,
0.6038969, 0.3139012, 0.2200993, 0.427451, 0, 1, 1,
0.6064346, 0.4300076, 0.2019207, 0.4352941, 0, 1, 1,
0.6068296, -0.7713262, 1.9952, 0.4392157, 0, 1, 1,
0.611285, 0.7152675, -0.2353119, 0.4470588, 0, 1, 1,
0.6131201, 0.2639532, 0.9154559, 0.4509804, 0, 1, 1,
0.6153898, -1.642124, 0.8954886, 0.4588235, 0, 1, 1,
0.616244, 0.5930746, -0.9140611, 0.4627451, 0, 1, 1,
0.617035, 1.116267, 0.7007761, 0.4705882, 0, 1, 1,
0.6181226, -0.7009763, 3.171392, 0.4745098, 0, 1, 1,
0.6191816, 2.238538, -0.9858113, 0.4823529, 0, 1, 1,
0.6225368, -0.2067191, 2.595674, 0.4862745, 0, 1, 1,
0.6227518, -1.70753, 3.310567, 0.4941176, 0, 1, 1,
0.6256915, -1.358278, 2.50604, 0.5019608, 0, 1, 1,
0.6275651, -0.4373727, 3.349299, 0.5058824, 0, 1, 1,
0.6369641, -1.147351, 2.452154, 0.5137255, 0, 1, 1,
0.6374212, 0.3918057, -0.3395521, 0.5176471, 0, 1, 1,
0.6378402, 1.016357, 1.367416, 0.5254902, 0, 1, 1,
0.6449149, -1.689634, 3.504231, 0.5294118, 0, 1, 1,
0.6485652, 0.515654, 0.8505205, 0.5372549, 0, 1, 1,
0.6498657, -0.2934676, 1.324283, 0.5411765, 0, 1, 1,
0.657465, -0.7363544, 2.97383, 0.5490196, 0, 1, 1,
0.6581241, -0.3793801, 1.143643, 0.5529412, 0, 1, 1,
0.6709823, 0.4001914, 1.346193, 0.5607843, 0, 1, 1,
0.6766429, -1.235697, 3.101292, 0.5647059, 0, 1, 1,
0.6816664, -1.497174, 2.309359, 0.572549, 0, 1, 1,
0.6918736, 1.522259, -1.279728, 0.5764706, 0, 1, 1,
0.6943093, -1.73113, 3.365024, 0.5843138, 0, 1, 1,
0.6950012, 0.48982, 1.123859, 0.5882353, 0, 1, 1,
0.6966214, 0.7387882, 1.493988, 0.5960785, 0, 1, 1,
0.7112954, 0.2760387, 2.051576, 0.6039216, 0, 1, 1,
0.7131465, 0.7660701, 0.7661934, 0.6078432, 0, 1, 1,
0.7178374, -0.7240391, 1.747357, 0.6156863, 0, 1, 1,
0.7218705, 0.8220523, -0.05365722, 0.6196079, 0, 1, 1,
0.7224931, -0.6637467, 2.79571, 0.627451, 0, 1, 1,
0.7229689, -0.1373157, 2.434435, 0.6313726, 0, 1, 1,
0.7230014, 0.1329281, 2.44983, 0.6392157, 0, 1, 1,
0.7284243, -1.267961, 2.433966, 0.6431373, 0, 1, 1,
0.7287798, 0.1167516, 1.748028, 0.6509804, 0, 1, 1,
0.7290643, 0.24308, 0.1041808, 0.654902, 0, 1, 1,
0.7307266, -2.211802, 4.459435, 0.6627451, 0, 1, 1,
0.7308124, 0.1499472, 0.5304962, 0.6666667, 0, 1, 1,
0.7341254, -0.04955579, 0.7804108, 0.6745098, 0, 1, 1,
0.7437619, 0.5195587, 2.088844, 0.6784314, 0, 1, 1,
0.7504051, 1.236866, -0.4717025, 0.6862745, 0, 1, 1,
0.7520948, 0.3189803, 1.325864, 0.6901961, 0, 1, 1,
0.7566569, -0.1269485, 5.519208, 0.6980392, 0, 1, 1,
0.7605388, -0.4836843, 0.09771541, 0.7058824, 0, 1, 1,
0.7658271, -1.406513, 1.040582, 0.7098039, 0, 1, 1,
0.7703589, -1.099894, 5.317204, 0.7176471, 0, 1, 1,
0.7740738, 0.2528182, 0.05308417, 0.7215686, 0, 1, 1,
0.7793494, 0.08868726, 1.680431, 0.7294118, 0, 1, 1,
0.7832851, 0.1820989, 1.130378, 0.7333333, 0, 1, 1,
0.7871301, 1.049539, 0.8473993, 0.7411765, 0, 1, 1,
0.7905553, -0.3203753, 2.645276, 0.7450981, 0, 1, 1,
0.8024079, 0.3799499, 1.506267, 0.7529412, 0, 1, 1,
0.8073272, 1.070217, 0.8922585, 0.7568628, 0, 1, 1,
0.8203108, -1.207181, 2.289619, 0.7647059, 0, 1, 1,
0.824181, 0.0480995, 3.229978, 0.7686275, 0, 1, 1,
0.8246338, 0.1449416, 1.753023, 0.7764706, 0, 1, 1,
0.8301471, -0.08572738, 3.010041, 0.7803922, 0, 1, 1,
0.8304427, 1.034912, -0.3801125, 0.7882353, 0, 1, 1,
0.8310616, 0.2621441, 0.928305, 0.7921569, 0, 1, 1,
0.8373439, 0.9375035, 2.615219, 0.8, 0, 1, 1,
0.8414869, -0.9203549, 2.601381, 0.8078431, 0, 1, 1,
0.8494732, 0.690388, 1.663777, 0.8117647, 0, 1, 1,
0.8507041, 0.8960553, -0.01442255, 0.8196079, 0, 1, 1,
0.8541117, 1.389539, 1.098841, 0.8235294, 0, 1, 1,
0.8585517, -0.5531354, 1.872555, 0.8313726, 0, 1, 1,
0.8610252, -0.9972943, 2.799194, 0.8352941, 0, 1, 1,
0.8709518, 0.814137, 0.5130619, 0.8431373, 0, 1, 1,
0.8737982, 0.579226, -0.0767004, 0.8470588, 0, 1, 1,
0.8747841, 0.8158613, 0.9193819, 0.854902, 0, 1, 1,
0.8778064, 1.412919, 1.097345, 0.8588235, 0, 1, 1,
0.8799263, -0.4516847, 2.069628, 0.8666667, 0, 1, 1,
0.891484, 0.004048197, 1.236946, 0.8705882, 0, 1, 1,
0.8939512, -0.03319479, 3.14442, 0.8784314, 0, 1, 1,
0.8950389, 1.364222, 1.219444, 0.8823529, 0, 1, 1,
0.8991385, -1.052913, 4.085258, 0.8901961, 0, 1, 1,
0.9008082, -0.1352286, 1.541126, 0.8941177, 0, 1, 1,
0.9017375, -0.3146101, 1.795847, 0.9019608, 0, 1, 1,
0.9029009, 0.7561697, 1.359571, 0.9098039, 0, 1, 1,
0.9053436, 0.4445945, 2.265583, 0.9137255, 0, 1, 1,
0.9078212, 1.927721, 0.2921035, 0.9215686, 0, 1, 1,
0.9180511, -0.1000101, 2.498143, 0.9254902, 0, 1, 1,
0.921132, 0.3605208, 2.723467, 0.9333333, 0, 1, 1,
0.9229499, -0.722832, 2.07606, 0.9372549, 0, 1, 1,
0.9291847, -2.608194, 1.473254, 0.945098, 0, 1, 1,
0.9390877, 0.0930966, 2.249098, 0.9490196, 0, 1, 1,
0.9440511, -0.6765717, 1.555617, 0.9568627, 0, 1, 1,
0.9450568, -0.008549633, 1.527156, 0.9607843, 0, 1, 1,
0.9464535, 0.3576424, 1.688204, 0.9686275, 0, 1, 1,
0.9555784, -0.7786852, 2.937471, 0.972549, 0, 1, 1,
0.955704, -0.08228669, 0.6486676, 0.9803922, 0, 1, 1,
0.9623531, -0.6607344, 3.123519, 0.9843137, 0, 1, 1,
0.9649342, 1.071723, 0.9462331, 0.9921569, 0, 1, 1,
0.9670165, -0.3267291, 1.035765, 0.9960784, 0, 1, 1,
0.9678384, -0.24151, 1.508578, 1, 0, 0.9960784, 1,
0.9706164, -0.3457009, 2.32643, 1, 0, 0.9882353, 1,
0.9710788, -0.3376812, 1.991707, 1, 0, 0.9843137, 1,
0.9772799, -2.15116, 3.167374, 1, 0, 0.9764706, 1,
0.9918267, 0.03292497, 2.656872, 1, 0, 0.972549, 1,
0.9967703, -2.320342, 3.533695, 1, 0, 0.9647059, 1,
0.9971782, 1.15362, -1.347635, 1, 0, 0.9607843, 1,
0.9998992, 0.9113528, -0.428942, 1, 0, 0.9529412, 1,
1.007284, -0.8647617, 0.4054109, 1, 0, 0.9490196, 1,
1.007957, 0.350258, 0.6745646, 1, 0, 0.9411765, 1,
1.011756, -0.04041611, 2.789052, 1, 0, 0.9372549, 1,
1.01893, 0.760232, 0.4442022, 1, 0, 0.9294118, 1,
1.019344, -0.03949817, 1.679953, 1, 0, 0.9254902, 1,
1.021895, 0.05496944, 1.294324, 1, 0, 0.9176471, 1,
1.027383, 0.1693917, 0.947275, 1, 0, 0.9137255, 1,
1.029406, 0.4555362, 0.395794, 1, 0, 0.9058824, 1,
1.035913, 0.3648913, 1.720825, 1, 0, 0.9019608, 1,
1.045617, 0.8720189, 0.7892229, 1, 0, 0.8941177, 1,
1.046224, 2.454933, 0.3448088, 1, 0, 0.8862745, 1,
1.050018, -1.258482, 1.743942, 1, 0, 0.8823529, 1,
1.052644, 0.7496011, 0.9353583, 1, 0, 0.8745098, 1,
1.058593, -1.698427, 0.662122, 1, 0, 0.8705882, 1,
1.064095, 0.197961, 1.515034, 1, 0, 0.8627451, 1,
1.066577, 1.390725, 0.4474302, 1, 0, 0.8588235, 1,
1.07671, -0.7803546, 2.155443, 1, 0, 0.8509804, 1,
1.077209, -0.8308213, 0.6612822, 1, 0, 0.8470588, 1,
1.079139, 1.793209, 0.6494067, 1, 0, 0.8392157, 1,
1.081065, 0.7920538, 0.2322386, 1, 0, 0.8352941, 1,
1.089663, -1.204123, 2.738857, 1, 0, 0.827451, 1,
1.092602, 0.6210316, 1.439784, 1, 0, 0.8235294, 1,
1.108139, -0.1286415, 2.059337, 1, 0, 0.8156863, 1,
1.108394, 0.9203503, 2.667836, 1, 0, 0.8117647, 1,
1.118346, 1.024773, -1.346439, 1, 0, 0.8039216, 1,
1.120335, -1.249652, 1.916357, 1, 0, 0.7960784, 1,
1.121065, 1.192271, -1.196074, 1, 0, 0.7921569, 1,
1.124418, -0.3988629, 1.333133, 1, 0, 0.7843137, 1,
1.126656, 2.837403, -0.5950956, 1, 0, 0.7803922, 1,
1.128405, -0.5211135, 2.493849, 1, 0, 0.772549, 1,
1.130336, 1.187923, 2.478525, 1, 0, 0.7686275, 1,
1.130413, 0.9450829, -1.043175, 1, 0, 0.7607843, 1,
1.136728, 1.209005, 1.35937, 1, 0, 0.7568628, 1,
1.138105, -0.6326917, 1.110774, 1, 0, 0.7490196, 1,
1.140231, -0.08549906, 1.470711, 1, 0, 0.7450981, 1,
1.140294, -1.053838, 2.991473, 1, 0, 0.7372549, 1,
1.140377, 1.247679, -1.21637, 1, 0, 0.7333333, 1,
1.15395, -0.2894697, 1.459205, 1, 0, 0.7254902, 1,
1.177156, 0.05036349, 2.042292, 1, 0, 0.7215686, 1,
1.177787, 1.130058, 1.316649, 1, 0, 0.7137255, 1,
1.184704, -0.4653324, 2.554337, 1, 0, 0.7098039, 1,
1.185119, 0.592389, 1.420622, 1, 0, 0.7019608, 1,
1.186287, 0.2429594, -0.3999953, 1, 0, 0.6941177, 1,
1.199073, -0.2279973, 1.366926, 1, 0, 0.6901961, 1,
1.210462, -1.051499, 2.315542, 1, 0, 0.682353, 1,
1.215552, -0.7915263, 1.713932, 1, 0, 0.6784314, 1,
1.218458, 0.6656001, 0.4788138, 1, 0, 0.6705883, 1,
1.231016, 0.8778922, 1.04738, 1, 0, 0.6666667, 1,
1.272155, -0.4575038, 0.3168565, 1, 0, 0.6588235, 1,
1.275737, -1.753392, 2.279581, 1, 0, 0.654902, 1,
1.29553, -0.8413531, 1.318156, 1, 0, 0.6470588, 1,
1.300198, -0.3639795, 2.345706, 1, 0, 0.6431373, 1,
1.30652, -1.730606, 0.640732, 1, 0, 0.6352941, 1,
1.307395, 0.5291971, 2.341871, 1, 0, 0.6313726, 1,
1.31085, -1.757771, 4.046491, 1, 0, 0.6235294, 1,
1.312372, 0.1283333, 1.394563, 1, 0, 0.6196079, 1,
1.322618, 0.42428, 1.221724, 1, 0, 0.6117647, 1,
1.329342, -0.4846032, 0.8213273, 1, 0, 0.6078432, 1,
1.330766, -0.4490846, 3.713392, 1, 0, 0.6, 1,
1.331763, 0.6858155, 0.6931849, 1, 0, 0.5921569, 1,
1.332482, 0.6774715, -0.6530327, 1, 0, 0.5882353, 1,
1.332824, 0.1144091, 1.895043, 1, 0, 0.5803922, 1,
1.337121, 0.400651, 1.561546, 1, 0, 0.5764706, 1,
1.347837, 0.9654125, 1.66766, 1, 0, 0.5686275, 1,
1.354958, -0.4686591, 2.754902, 1, 0, 0.5647059, 1,
1.357407, 1.074603, 1.388241, 1, 0, 0.5568628, 1,
1.366597, -1.811739, 2.727265, 1, 0, 0.5529412, 1,
1.377508, -0.8940101, 3.035349, 1, 0, 0.5450981, 1,
1.387633, 0.2394102, 1.789971, 1, 0, 0.5411765, 1,
1.391797, -1.813931, 1.369078, 1, 0, 0.5333334, 1,
1.402304, 0.9673833, -0.522292, 1, 0, 0.5294118, 1,
1.414478, 0.526606, 2.481121, 1, 0, 0.5215687, 1,
1.423649, -1.635637, 1.153283, 1, 0, 0.5176471, 1,
1.431659, 0.1168255, 1.456534, 1, 0, 0.509804, 1,
1.437027, -1.478616, 1.902182, 1, 0, 0.5058824, 1,
1.454906, 0.1423619, -1.520173, 1, 0, 0.4980392, 1,
1.466594, 0.2265951, -0.5187455, 1, 0, 0.4901961, 1,
1.476395, 0.3872413, 1.606348, 1, 0, 0.4862745, 1,
1.484091, 0.4941176, 1.848534, 1, 0, 0.4784314, 1,
1.496782, 0.9337703, -0.9011515, 1, 0, 0.4745098, 1,
1.503742, -0.04397751, 2.102291, 1, 0, 0.4666667, 1,
1.512914, 2.129999, 1.196159, 1, 0, 0.4627451, 1,
1.514199, 1.735457, 2.420815, 1, 0, 0.454902, 1,
1.514336, -0.2068148, 0.35357, 1, 0, 0.4509804, 1,
1.517469, -0.1197083, 1.659986, 1, 0, 0.4431373, 1,
1.519405, -0.6204743, 0.1472507, 1, 0, 0.4392157, 1,
1.526549, 1.582714, 1.35628, 1, 0, 0.4313726, 1,
1.527432, 1.042208, 2.197765, 1, 0, 0.427451, 1,
1.53064, 0.3000079, 3.069473, 1, 0, 0.4196078, 1,
1.54392, -1.110562, 0.8907581, 1, 0, 0.4156863, 1,
1.547101, 0.08577288, 3.353962, 1, 0, 0.4078431, 1,
1.569056, -0.4251721, 0.131018, 1, 0, 0.4039216, 1,
1.569718, 1.184278, -0.3248762, 1, 0, 0.3960784, 1,
1.57593, -1.192604, 1.532894, 1, 0, 0.3882353, 1,
1.577414, 0.4876377, 1.001579, 1, 0, 0.3843137, 1,
1.580611, -2.104318, 2.205494, 1, 0, 0.3764706, 1,
1.586107, 0.3918037, 0.7460254, 1, 0, 0.372549, 1,
1.588362, -0.6217534, 3.210219, 1, 0, 0.3647059, 1,
1.588441, -0.858972, 3.004204, 1, 0, 0.3607843, 1,
1.5937, -1.143104, 2.166291, 1, 0, 0.3529412, 1,
1.597997, 0.5062714, 0.6232496, 1, 0, 0.3490196, 1,
1.618597, 0.3108107, 0.5176786, 1, 0, 0.3411765, 1,
1.631746, 0.3265745, 1.407173, 1, 0, 0.3372549, 1,
1.63203, 0.7922413, 1.535619, 1, 0, 0.3294118, 1,
1.634207, 0.4178645, 0.9267727, 1, 0, 0.3254902, 1,
1.651791, -0.7364009, 2.172222, 1, 0, 0.3176471, 1,
1.656683, 0.5191157, 1.564664, 1, 0, 0.3137255, 1,
1.66418, -0.6791215, 0.3890054, 1, 0, 0.3058824, 1,
1.676654, -0.01693334, 1.89137, 1, 0, 0.2980392, 1,
1.70856, -0.1098995, 3.237715, 1, 0, 0.2941177, 1,
1.721762, -1.042299, 0.5086996, 1, 0, 0.2862745, 1,
1.759347, 1.414079, 0.1375, 1, 0, 0.282353, 1,
1.766326, 1.909747, 1.800692, 1, 0, 0.2745098, 1,
1.768376, 0.6600876, 2.875194, 1, 0, 0.2705882, 1,
1.770212, -0.9781799, 1.229512, 1, 0, 0.2627451, 1,
1.786699, 0.4740342, 2.829336, 1, 0, 0.2588235, 1,
1.797404, -1.19094, 1.323543, 1, 0, 0.2509804, 1,
1.799791, 0.4609358, 1.64606, 1, 0, 0.2470588, 1,
1.823434, -0.7379013, 1.926701, 1, 0, 0.2392157, 1,
1.825117, -1.131897, 2.445276, 1, 0, 0.2352941, 1,
1.833458, 0.1494648, 0.2897425, 1, 0, 0.227451, 1,
1.844286, -0.9886594, 3.151427, 1, 0, 0.2235294, 1,
1.847304, -0.1925547, 0.6542327, 1, 0, 0.2156863, 1,
1.880278, -0.7234921, 2.123614, 1, 0, 0.2117647, 1,
1.885681, 0.3514334, -0.2111518, 1, 0, 0.2039216, 1,
1.888589, -1.324744, 3.091839, 1, 0, 0.1960784, 1,
1.899456, -1.364465, 0.6647604, 1, 0, 0.1921569, 1,
1.89993, -1.284615, 2.159326, 1, 0, 0.1843137, 1,
1.915976, -0.5585867, 3.312596, 1, 0, 0.1803922, 1,
1.93671, -0.08134969, 2.544587, 1, 0, 0.172549, 1,
2.000071, -1.983368, 2.5614, 1, 0, 0.1686275, 1,
2.011852, -0.9573956, 1.45814, 1, 0, 0.1607843, 1,
2.021303, 0.5846573, 1.472124, 1, 0, 0.1568628, 1,
2.024106, -0.7346003, 0.6837091, 1, 0, 0.1490196, 1,
2.055091, 1.477734, 1.747305, 1, 0, 0.145098, 1,
2.06031, 0.8186086, 0.152708, 1, 0, 0.1372549, 1,
2.061642, -0.5527851, 1.663336, 1, 0, 0.1333333, 1,
2.073107, 1.009477, 2.021089, 1, 0, 0.1254902, 1,
2.073507, 0.3177328, 3.557056, 1, 0, 0.1215686, 1,
2.104215, -0.3457653, 2.722232, 1, 0, 0.1137255, 1,
2.119588, 0.02333853, 1.469177, 1, 0, 0.1098039, 1,
2.13672, 0.6422011, 2.643508, 1, 0, 0.1019608, 1,
2.188566, 1.213468, 2.030948, 1, 0, 0.09411765, 1,
2.248993, -0.9092936, 1.061377, 1, 0, 0.09019608, 1,
2.30058, 0.02486696, 1.471638, 1, 0, 0.08235294, 1,
2.366158, 0.7008596, 0.3844657, 1, 0, 0.07843138, 1,
2.390985, -0.3834564, 0.6174068, 1, 0, 0.07058824, 1,
2.420564, -0.9627635, 2.063915, 1, 0, 0.06666667, 1,
2.486737, 1.627591, 0.8976202, 1, 0, 0.05882353, 1,
2.533903, -0.04770708, 1.987188, 1, 0, 0.05490196, 1,
2.5772, -1.266303, 1.593562, 1, 0, 0.04705882, 1,
2.611974, -1.021222, 1.695643, 1, 0, 0.04313726, 1,
2.716241, -0.2823265, 1.516995, 1, 0, 0.03529412, 1,
2.743727, 1.951614, 1.080228, 1, 0, 0.03137255, 1,
2.86356, 0.05656554, -0.1048914, 1, 0, 0.02352941, 1,
2.908166, 1.192212, 1.762105, 1, 0, 0.01960784, 1,
3.03534, -0.6547183, 2.735122, 1, 0, 0.01176471, 1,
3.038269, -1.754116, 1.037203, 1, 0, 0.007843138, 1
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
-0.03674901, -4.037131, -8.369671, 0, -0.5, 0.5, 0.5,
-0.03674901, -4.037131, -8.369671, 1, -0.5, 0.5, 0.5,
-0.03674901, -4.037131, -8.369671, 1, 1.5, 0.5, 0.5,
-0.03674901, -4.037131, -8.369671, 0, 1.5, 0.5, 0.5
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
-4.154198, 0.02844667, -8.369671, 0, -0.5, 0.5, 0.5,
-4.154198, 0.02844667, -8.369671, 1, -0.5, 0.5, 0.5,
-4.154198, 0.02844667, -8.369671, 1, 1.5, 0.5, 0.5,
-4.154198, 0.02844667, -8.369671, 0, 1.5, 0.5, 0.5
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
-4.154198, -4.037131, -0.4187479, 0, -0.5, 0.5, 0.5,
-4.154198, -4.037131, -0.4187479, 1, -0.5, 0.5, 0.5,
-4.154198, -4.037131, -0.4187479, 1, 1.5, 0.5, 0.5,
-4.154198, -4.037131, -0.4187479, 0, 1.5, 0.5, 0.5
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
-3, -3.098921, -6.534842,
3, -3.098921, -6.534842,
-3, -3.098921, -6.534842,
-3, -3.255289, -6.840647,
-2, -3.098921, -6.534842,
-2, -3.255289, -6.840647,
-1, -3.098921, -6.534842,
-1, -3.255289, -6.840647,
0, -3.098921, -6.534842,
0, -3.255289, -6.840647,
1, -3.098921, -6.534842,
1, -3.255289, -6.840647,
2, -3.098921, -6.534842,
2, -3.255289, -6.840647,
3, -3.098921, -6.534842,
3, -3.255289, -6.840647
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
-3, -3.568026, -7.452257, 0, -0.5, 0.5, 0.5,
-3, -3.568026, -7.452257, 1, -0.5, 0.5, 0.5,
-3, -3.568026, -7.452257, 1, 1.5, 0.5, 0.5,
-3, -3.568026, -7.452257, 0, 1.5, 0.5, 0.5,
-2, -3.568026, -7.452257, 0, -0.5, 0.5, 0.5,
-2, -3.568026, -7.452257, 1, -0.5, 0.5, 0.5,
-2, -3.568026, -7.452257, 1, 1.5, 0.5, 0.5,
-2, -3.568026, -7.452257, 0, 1.5, 0.5, 0.5,
-1, -3.568026, -7.452257, 0, -0.5, 0.5, 0.5,
-1, -3.568026, -7.452257, 1, -0.5, 0.5, 0.5,
-1, -3.568026, -7.452257, 1, 1.5, 0.5, 0.5,
-1, -3.568026, -7.452257, 0, 1.5, 0.5, 0.5,
0, -3.568026, -7.452257, 0, -0.5, 0.5, 0.5,
0, -3.568026, -7.452257, 1, -0.5, 0.5, 0.5,
0, -3.568026, -7.452257, 1, 1.5, 0.5, 0.5,
0, -3.568026, -7.452257, 0, 1.5, 0.5, 0.5,
1, -3.568026, -7.452257, 0, -0.5, 0.5, 0.5,
1, -3.568026, -7.452257, 1, -0.5, 0.5, 0.5,
1, -3.568026, -7.452257, 1, 1.5, 0.5, 0.5,
1, -3.568026, -7.452257, 0, 1.5, 0.5, 0.5,
2, -3.568026, -7.452257, 0, -0.5, 0.5, 0.5,
2, -3.568026, -7.452257, 1, -0.5, 0.5, 0.5,
2, -3.568026, -7.452257, 1, 1.5, 0.5, 0.5,
2, -3.568026, -7.452257, 0, 1.5, 0.5, 0.5,
3, -3.568026, -7.452257, 0, -0.5, 0.5, 0.5,
3, -3.568026, -7.452257, 1, -0.5, 0.5, 0.5,
3, -3.568026, -7.452257, 1, 1.5, 0.5, 0.5,
3, -3.568026, -7.452257, 0, 1.5, 0.5, 0.5
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
-3.204017, -3, -6.534842,
-3.204017, 3, -6.534842,
-3.204017, -3, -6.534842,
-3.362381, -3, -6.840647,
-3.204017, -2, -6.534842,
-3.362381, -2, -6.840647,
-3.204017, -1, -6.534842,
-3.362381, -1, -6.840647,
-3.204017, 0, -6.534842,
-3.362381, 0, -6.840647,
-3.204017, 1, -6.534842,
-3.362381, 1, -6.840647,
-3.204017, 2, -6.534842,
-3.362381, 2, -6.840647,
-3.204017, 3, -6.534842,
-3.362381, 3, -6.840647
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
-3.679107, -3, -7.452257, 0, -0.5, 0.5, 0.5,
-3.679107, -3, -7.452257, 1, -0.5, 0.5, 0.5,
-3.679107, -3, -7.452257, 1, 1.5, 0.5, 0.5,
-3.679107, -3, -7.452257, 0, 1.5, 0.5, 0.5,
-3.679107, -2, -7.452257, 0, -0.5, 0.5, 0.5,
-3.679107, -2, -7.452257, 1, -0.5, 0.5, 0.5,
-3.679107, -2, -7.452257, 1, 1.5, 0.5, 0.5,
-3.679107, -2, -7.452257, 0, 1.5, 0.5, 0.5,
-3.679107, -1, -7.452257, 0, -0.5, 0.5, 0.5,
-3.679107, -1, -7.452257, 1, -0.5, 0.5, 0.5,
-3.679107, -1, -7.452257, 1, 1.5, 0.5, 0.5,
-3.679107, -1, -7.452257, 0, 1.5, 0.5, 0.5,
-3.679107, 0, -7.452257, 0, -0.5, 0.5, 0.5,
-3.679107, 0, -7.452257, 1, -0.5, 0.5, 0.5,
-3.679107, 0, -7.452257, 1, 1.5, 0.5, 0.5,
-3.679107, 0, -7.452257, 0, 1.5, 0.5, 0.5,
-3.679107, 1, -7.452257, 0, -0.5, 0.5, 0.5,
-3.679107, 1, -7.452257, 1, -0.5, 0.5, 0.5,
-3.679107, 1, -7.452257, 1, 1.5, 0.5, 0.5,
-3.679107, 1, -7.452257, 0, 1.5, 0.5, 0.5,
-3.679107, 2, -7.452257, 0, -0.5, 0.5, 0.5,
-3.679107, 2, -7.452257, 1, -0.5, 0.5, 0.5,
-3.679107, 2, -7.452257, 1, 1.5, 0.5, 0.5,
-3.679107, 2, -7.452257, 0, 1.5, 0.5, 0.5,
-3.679107, 3, -7.452257, 0, -0.5, 0.5, 0.5,
-3.679107, 3, -7.452257, 1, -0.5, 0.5, 0.5,
-3.679107, 3, -7.452257, 1, 1.5, 0.5, 0.5,
-3.679107, 3, -7.452257, 0, 1.5, 0.5, 0.5
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
-3.204017, -3.098921, -6,
-3.204017, -3.098921, 4,
-3.204017, -3.098921, -6,
-3.362381, -3.255289, -6,
-3.204017, -3.098921, -4,
-3.362381, -3.255289, -4,
-3.204017, -3.098921, -2,
-3.362381, -3.255289, -2,
-3.204017, -3.098921, 0,
-3.362381, -3.255289, 0,
-3.204017, -3.098921, 2,
-3.362381, -3.255289, 2,
-3.204017, -3.098921, 4,
-3.362381, -3.255289, 4
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
-3.679107, -3.568026, -6, 0, -0.5, 0.5, 0.5,
-3.679107, -3.568026, -6, 1, -0.5, 0.5, 0.5,
-3.679107, -3.568026, -6, 1, 1.5, 0.5, 0.5,
-3.679107, -3.568026, -6, 0, 1.5, 0.5, 0.5,
-3.679107, -3.568026, -4, 0, -0.5, 0.5, 0.5,
-3.679107, -3.568026, -4, 1, -0.5, 0.5, 0.5,
-3.679107, -3.568026, -4, 1, 1.5, 0.5, 0.5,
-3.679107, -3.568026, -4, 0, 1.5, 0.5, 0.5,
-3.679107, -3.568026, -2, 0, -0.5, 0.5, 0.5,
-3.679107, -3.568026, -2, 1, -0.5, 0.5, 0.5,
-3.679107, -3.568026, -2, 1, 1.5, 0.5, 0.5,
-3.679107, -3.568026, -2, 0, 1.5, 0.5, 0.5,
-3.679107, -3.568026, 0, 0, -0.5, 0.5, 0.5,
-3.679107, -3.568026, 0, 1, -0.5, 0.5, 0.5,
-3.679107, -3.568026, 0, 1, 1.5, 0.5, 0.5,
-3.679107, -3.568026, 0, 0, 1.5, 0.5, 0.5,
-3.679107, -3.568026, 2, 0, -0.5, 0.5, 0.5,
-3.679107, -3.568026, 2, 1, -0.5, 0.5, 0.5,
-3.679107, -3.568026, 2, 1, 1.5, 0.5, 0.5,
-3.679107, -3.568026, 2, 0, 1.5, 0.5, 0.5,
-3.679107, -3.568026, 4, 0, -0.5, 0.5, 0.5,
-3.679107, -3.568026, 4, 1, -0.5, 0.5, 0.5,
-3.679107, -3.568026, 4, 1, 1.5, 0.5, 0.5,
-3.679107, -3.568026, 4, 0, 1.5, 0.5, 0.5
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
-3.204017, -3.098921, -6.534842,
-3.204017, 3.155814, -6.534842,
-3.204017, -3.098921, 5.697347,
-3.204017, 3.155814, 5.697347,
-3.204017, -3.098921, -6.534842,
-3.204017, -3.098921, 5.697347,
-3.204017, 3.155814, -6.534842,
-3.204017, 3.155814, 5.697347,
-3.204017, -3.098921, -6.534842,
3.130519, -3.098921, -6.534842,
-3.204017, -3.098921, 5.697347,
3.130519, -3.098921, 5.697347,
-3.204017, 3.155814, -6.534842,
3.130519, 3.155814, -6.534842,
-3.204017, 3.155814, 5.697347,
3.130519, 3.155814, 5.697347,
3.130519, -3.098921, -6.534842,
3.130519, 3.155814, -6.534842,
3.130519, -3.098921, 5.697347,
3.130519, 3.155814, 5.697347,
3.130519, -3.098921, -6.534842,
3.130519, -3.098921, 5.697347,
3.130519, 3.155814, -6.534842,
3.130519, 3.155814, 5.697347
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
var radius = 8.078378;
var distance = 35.94162;
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
mvMatrix.translate( 0.03674901, -0.02844667, 0.4187479 );
mvMatrix.scale( 1.37887, 1.396462, 0.7140587 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.94162);
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
FICAM<-read.table("FICAM.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-FICAM$V2
```

```
## Error in eval(expr, envir, enclos): object 'FICAM' not found
```

```r
y<-FICAM$V3
```

```
## Error in eval(expr, envir, enclos): object 'FICAM' not found
```

```r
z<-FICAM$V4
```

```
## Error in eval(expr, envir, enclos): object 'FICAM' not found
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
-3.111767, -1.388111, -0.7226631, 0, 0, 1, 1, 1,
-2.625463, 0.2429591, -2.00353, 1, 0, 0, 1, 1,
-2.616916, 0.2767451, -1.448209, 1, 0, 0, 1, 1,
-2.529295, -0.3078887, -2.712838, 1, 0, 0, 1, 1,
-2.381121, -1.572499, -1.778106, 1, 0, 0, 1, 1,
-2.342154, 1.268962, -1.721871, 1, 0, 0, 1, 1,
-2.315349, 1.384789, -0.987842, 0, 0, 0, 1, 1,
-2.308621, 0.1086604, -0.9992378, 0, 0, 0, 1, 1,
-2.300137, 1.122057, -0.7415322, 0, 0, 0, 1, 1,
-2.178633, -0.4527312, -2.296782, 0, 0, 0, 1, 1,
-2.172618, -1.747844, -2.118364, 0, 0, 0, 1, 1,
-2.154809, 1.799803, 0.007140829, 0, 0, 0, 1, 1,
-2.130553, 0.9798837, -2.049283, 0, 0, 0, 1, 1,
-2.119595, 0.7720863, -1.838927, 1, 1, 1, 1, 1,
-2.102119, -1.124139, -1.608126, 1, 1, 1, 1, 1,
-2.088197, 1.681858, -0.9156618, 1, 1, 1, 1, 1,
-2.057277, -0.7181564, -3.159131, 1, 1, 1, 1, 1,
-2.049889, 0.09929722, -1.706532, 1, 1, 1, 1, 1,
-2.046459, -0.1127813, -1.084888, 1, 1, 1, 1, 1,
-2.038159, -0.4298298, -2.091967, 1, 1, 1, 1, 1,
-2.005352, -1.26752, -1.652434, 1, 1, 1, 1, 1,
-1.999619, 0.08215768, -1.93662, 1, 1, 1, 1, 1,
-1.914546, 1.738144, -0.7606916, 1, 1, 1, 1, 1,
-1.881089, 0.1498158, -3.050019, 1, 1, 1, 1, 1,
-1.872637, 0.8547307, -0.3618965, 1, 1, 1, 1, 1,
-1.86943, -0.03916935, -3.705291, 1, 1, 1, 1, 1,
-1.86702, 1.642335, -1.385192, 1, 1, 1, 1, 1,
-1.855845, -0.4835755, -1.013084, 1, 1, 1, 1, 1,
-1.819619, -0.05155359, -1.359115, 0, 0, 1, 1, 1,
-1.816509, -0.04247176, -0.1004071, 1, 0, 0, 1, 1,
-1.815997, -0.2182543, -2.48412, 1, 0, 0, 1, 1,
-1.799329, 1.055061, 1.136797, 1, 0, 0, 1, 1,
-1.782295, -0.3210971, -1.445943, 1, 0, 0, 1, 1,
-1.767869, 0.8779592, -1.216843, 1, 0, 0, 1, 1,
-1.763903, -2.010707, -2.209591, 0, 0, 0, 1, 1,
-1.759636, 0.4961752, -5.183266, 0, 0, 0, 1, 1,
-1.755718, -1.248803, -2.955843, 0, 0, 0, 1, 1,
-1.755053, 1.615041, 0.08682788, 0, 0, 0, 1, 1,
-1.74034, -0.3225987, -2.517354, 0, 0, 0, 1, 1,
-1.736293, -1.220313, -2.671501, 0, 0, 0, 1, 1,
-1.73468, 2.026097, -0.6950868, 0, 0, 0, 1, 1,
-1.73427, -0.2534671, -2.740569, 1, 1, 1, 1, 1,
-1.720232, 1.735663, -0.6586293, 1, 1, 1, 1, 1,
-1.716493, 0.7365286, -0.7242765, 1, 1, 1, 1, 1,
-1.711683, -0.07489702, -2.747948, 1, 1, 1, 1, 1,
-1.694898, 0.3734689, -0.2745184, 1, 1, 1, 1, 1,
-1.676561, 0.3279177, -1.173118, 1, 1, 1, 1, 1,
-1.673073, 1.039588, -2.161661, 1, 1, 1, 1, 1,
-1.671037, 0.7410355, -0.6549903, 1, 1, 1, 1, 1,
-1.632921, -0.1642912, -1.489456, 1, 1, 1, 1, 1,
-1.616325, -0.4731544, -1.500106, 1, 1, 1, 1, 1,
-1.61536, 0.3620753, -0.6546413, 1, 1, 1, 1, 1,
-1.61161, -1.084253, -1.647806, 1, 1, 1, 1, 1,
-1.609251, -0.742696, -1.715587, 1, 1, 1, 1, 1,
-1.608572, 1.712977, 0.06200861, 1, 1, 1, 1, 1,
-1.578494, -0.2855533, -2.118193, 1, 1, 1, 1, 1,
-1.574929, -0.01506816, -2.29877, 0, 0, 1, 1, 1,
-1.57175, 0.7019402, 0.3355579, 1, 0, 0, 1, 1,
-1.568811, 0.3289512, -2.598737, 1, 0, 0, 1, 1,
-1.555331, 0.6302589, 0.06368089, 1, 0, 0, 1, 1,
-1.553277, -0.5264739, -2.190558, 1, 0, 0, 1, 1,
-1.545507, -0.9411706, -2.549897, 1, 0, 0, 1, 1,
-1.536132, 1.555451, -1.279987, 0, 0, 0, 1, 1,
-1.527948, 1.254217, -0.01878593, 0, 0, 0, 1, 1,
-1.522318, -0.4741752, -1.920874, 0, 0, 0, 1, 1,
-1.516536, 0.3797986, -2.422269, 0, 0, 0, 1, 1,
-1.515402, -0.9264779, -2.578024, 0, 0, 0, 1, 1,
-1.510301, 0.1022954, -2.070872, 0, 0, 0, 1, 1,
-1.50203, 0.9243184, -2.273317, 0, 0, 0, 1, 1,
-1.498789, 0.3131568, -3.004506, 1, 1, 1, 1, 1,
-1.497098, -0.2680604, -2.320353, 1, 1, 1, 1, 1,
-1.488669, -0.149052, -0.5798095, 1, 1, 1, 1, 1,
-1.488278, 1.288791, -0.405403, 1, 1, 1, 1, 1,
-1.48552, -0.8089585, -2.011343, 1, 1, 1, 1, 1,
-1.475615, -1.258611, -1.729527, 1, 1, 1, 1, 1,
-1.465694, -1.284517, -0.7447065, 1, 1, 1, 1, 1,
-1.4544, -1.24946, -3.265903, 1, 1, 1, 1, 1,
-1.449193, -0.298286, -1.056356, 1, 1, 1, 1, 1,
-1.449115, 0.1446998, -1.443736, 1, 1, 1, 1, 1,
-1.432923, 1.070116, -1.889174, 1, 1, 1, 1, 1,
-1.422321, -1.416253, -2.631646, 1, 1, 1, 1, 1,
-1.420971, 1.102429, -3.073837, 1, 1, 1, 1, 1,
-1.415168, -2.256319, -3.154882, 1, 1, 1, 1, 1,
-1.407531, -0.2006257, -2.405599, 1, 1, 1, 1, 1,
-1.404252, -1.299143, -3.284807, 0, 0, 1, 1, 1,
-1.389404, 0.359616, 1.685566, 1, 0, 0, 1, 1,
-1.383786, 1.109267, -3.133566, 1, 0, 0, 1, 1,
-1.382087, -0.128201, -1.439512, 1, 0, 0, 1, 1,
-1.381763, -1.382332, -3.024358, 1, 0, 0, 1, 1,
-1.373461, -1.102456, -3.104354, 1, 0, 0, 1, 1,
-1.369615, -0.3364711, -3.039682, 0, 0, 0, 1, 1,
-1.365882, 0.8476681, 0.2577482, 0, 0, 0, 1, 1,
-1.365874, -1.364268, -2.548564, 0, 0, 0, 1, 1,
-1.353909, -1.099812, -1.605145, 0, 0, 0, 1, 1,
-1.353433, 0.0171278, -0.8827426, 0, 0, 0, 1, 1,
-1.351451, 0.1689434, -0.1195592, 0, 0, 0, 1, 1,
-1.347757, 0.267263, -1.931558, 0, 0, 0, 1, 1,
-1.344856, 0.4128267, -1.446528, 1, 1, 1, 1, 1,
-1.310591, -0.6837351, -3.230371, 1, 1, 1, 1, 1,
-1.309568, -0.7422763, -2.033137, 1, 1, 1, 1, 1,
-1.303866, -0.7568463, -2.278931, 1, 1, 1, 1, 1,
-1.301733, 1.476498, -0.4035757, 1, 1, 1, 1, 1,
-1.29936, -0.6937035, -2.073264, 1, 1, 1, 1, 1,
-1.298326, -0.2179316, -1.681999, 1, 1, 1, 1, 1,
-1.287238, -0.9579904, -2.061426, 1, 1, 1, 1, 1,
-1.281765, 0.6411337, -0.923912, 1, 1, 1, 1, 1,
-1.281003, -0.3463587, -0.09668083, 1, 1, 1, 1, 1,
-1.280824, 0.6254282, 0.1416963, 1, 1, 1, 1, 1,
-1.278798, -0.1411603, -1.778401, 1, 1, 1, 1, 1,
-1.277789, -1.229917, -2.774112, 1, 1, 1, 1, 1,
-1.277328, -0.7436745, -2.805073, 1, 1, 1, 1, 1,
-1.266033, -0.287851, -1.848107, 1, 1, 1, 1, 1,
-1.253704, 0.5236132, -1.612716, 0, 0, 1, 1, 1,
-1.242031, 0.6287108, -2.475229, 1, 0, 0, 1, 1,
-1.241591, 0.1603811, -2.121207, 1, 0, 0, 1, 1,
-1.239894, 0.4176286, -0.3430344, 1, 0, 0, 1, 1,
-1.23736, -0.999747, -0.8515552, 1, 0, 0, 1, 1,
-1.221856, 0.02083731, -0.4966155, 1, 0, 0, 1, 1,
-1.221269, -0.5676638, -1.571065, 0, 0, 0, 1, 1,
-1.219201, 0.3995632, 0.8615324, 0, 0, 0, 1, 1,
-1.216622, 1.17002, -1.016057, 0, 0, 0, 1, 1,
-1.212618, 0.7139283, 0.5957994, 0, 0, 0, 1, 1,
-1.211743, -1.914745, -4.001425, 0, 0, 0, 1, 1,
-1.210095, -0.5258096, -2.268246, 0, 0, 0, 1, 1,
-1.207829, 0.9153469, -2.420772, 0, 0, 0, 1, 1,
-1.202665, 0.8351117, -3.638435, 1, 1, 1, 1, 1,
-1.201352, 1.217558, -1.350724, 1, 1, 1, 1, 1,
-1.19719, -1.394733, -2.50617, 1, 1, 1, 1, 1,
-1.190625, -0.1960448, -1.864943, 1, 1, 1, 1, 1,
-1.188662, -0.1846712, 0.08123462, 1, 1, 1, 1, 1,
-1.187138, -0.8798316, -1.97858, 1, 1, 1, 1, 1,
-1.186952, 0.1153872, -1.567583, 1, 1, 1, 1, 1,
-1.176231, 0.989601, -0.8011076, 1, 1, 1, 1, 1,
-1.176101, -1.088079, -3.777978, 1, 1, 1, 1, 1,
-1.172922, -0.3598621, -1.487575, 1, 1, 1, 1, 1,
-1.172122, 1.55642, 0.1969395, 1, 1, 1, 1, 1,
-1.168406, -1.382793, -3.19196, 1, 1, 1, 1, 1,
-1.162473, 0.6757255, -3.219246, 1, 1, 1, 1, 1,
-1.157459, -0.0842265, -0.8812387, 1, 1, 1, 1, 1,
-1.153335, 0.6332781, -2.126961, 1, 1, 1, 1, 1,
-1.151588, 0.2421525, -0.3258207, 0, 0, 1, 1, 1,
-1.145654, -0.2114224, -1.869622, 1, 0, 0, 1, 1,
-1.144457, -0.3546549, -0.7878975, 1, 0, 0, 1, 1,
-1.141537, 1.870969, -0.6276399, 1, 0, 0, 1, 1,
-1.126203, -0.3336135, -0.8135563, 1, 0, 0, 1, 1,
-1.126188, 0.3930078, -1.262014, 1, 0, 0, 1, 1,
-1.125034, -0.1464162, -2.563092, 0, 0, 0, 1, 1,
-1.124754, 0.2688341, -1.568484, 0, 0, 0, 1, 1,
-1.121135, 0.9650441, 0.04046699, 0, 0, 0, 1, 1,
-1.121123, -0.6778021, -4.114866, 0, 0, 0, 1, 1,
-1.119508, 0.4682281, -1.006906, 0, 0, 0, 1, 1,
-1.106137, 0.2704848, -0.03903384, 0, 0, 0, 1, 1,
-1.103806, -0.503489, -2.974318, 0, 0, 0, 1, 1,
-1.103563, 1.575267, -1.803117, 1, 1, 1, 1, 1,
-1.101188, 0.236789, -0.7937736, 1, 1, 1, 1, 1,
-1.09982, 1.472697, -0.8459548, 1, 1, 1, 1, 1,
-1.098571, -1.619072, -1.06848, 1, 1, 1, 1, 1,
-1.093294, -1.118121, -1.465138, 1, 1, 1, 1, 1,
-1.088943, 1.181811, 0.4428338, 1, 1, 1, 1, 1,
-1.085803, -0.1019706, -1.855823, 1, 1, 1, 1, 1,
-1.084927, 1.184668, -1.294147, 1, 1, 1, 1, 1,
-1.064585, 1.102019, -2.809277, 1, 1, 1, 1, 1,
-1.057072, -0.7553291, -0.4696231, 1, 1, 1, 1, 1,
-1.044414, 0.495887, 0.1771248, 1, 1, 1, 1, 1,
-1.03551, -0.2249783, -2.368732, 1, 1, 1, 1, 1,
-1.030528, 0.6257535, 0.7058975, 1, 1, 1, 1, 1,
-1.024467, -0.9627806, -4.242074, 1, 1, 1, 1, 1,
-1.021815, 1.346573, 0.1416068, 1, 1, 1, 1, 1,
-1.021219, 0.4027165, -0.1774864, 0, 0, 1, 1, 1,
-1.020109, 0.1050869, -1.052726, 1, 0, 0, 1, 1,
-1.017679, -0.6689798, -0.3744519, 1, 0, 0, 1, 1,
-1.009536, -0.3443512, -2.555973, 1, 0, 0, 1, 1,
-1.006305, -1.451967, -3.464686, 1, 0, 0, 1, 1,
-1.000968, 2.771636, 2.247957, 1, 0, 0, 1, 1,
-0.9997011, 0.8498379, 0.8506824, 0, 0, 0, 1, 1,
-0.9954397, -0.4501427, -1.236216, 0, 0, 0, 1, 1,
-0.9952562, -1.790983, -2.989225, 0, 0, 0, 1, 1,
-0.9893081, -0.3151185, -3.240987, 0, 0, 0, 1, 1,
-0.9841343, 0.9860854, -0.9169222, 0, 0, 0, 1, 1,
-0.9769965, 1.576698, -2.833097, 0, 0, 0, 1, 1,
-0.9762533, 1.173846, -0.760535, 0, 0, 0, 1, 1,
-0.9752078, 0.4742909, -1.228915, 1, 1, 1, 1, 1,
-0.9700462, 0.08879089, -2.278182, 1, 1, 1, 1, 1,
-0.96496, -0.2332152, -2.223445, 1, 1, 1, 1, 1,
-0.9642853, -3.007833, -2.934511, 1, 1, 1, 1, 1,
-0.9605902, 0.4450353, -1.702978, 1, 1, 1, 1, 1,
-0.9538414, -0.2780004, -1.463087, 1, 1, 1, 1, 1,
-0.9526802, -1.747654, -3.408056, 1, 1, 1, 1, 1,
-0.9448054, -0.1979109, -2.960024, 1, 1, 1, 1, 1,
-0.9444629, -0.2496555, -2.266844, 1, 1, 1, 1, 1,
-0.9438424, -0.3270611, -0.7909755, 1, 1, 1, 1, 1,
-0.9413625, 0.2684017, -0.09080829, 1, 1, 1, 1, 1,
-0.9370319, -1.14849, -2.466892, 1, 1, 1, 1, 1,
-0.9361747, -0.07973627, -1.369061, 1, 1, 1, 1, 1,
-0.9320821, -1.3163, -3.691878, 1, 1, 1, 1, 1,
-0.9309601, -0.6943099, -1.894462, 1, 1, 1, 1, 1,
-0.9302459, 0.4056564, -0.8716774, 0, 0, 1, 1, 1,
-0.9241376, 1.423507, -0.4245098, 1, 0, 0, 1, 1,
-0.9198402, -0.5246442, -3.7823, 1, 0, 0, 1, 1,
-0.9190012, -0.648184, -1.265406, 1, 0, 0, 1, 1,
-0.9156404, -0.9718107, -1.457697, 1, 0, 0, 1, 1,
-0.9140038, -0.8778056, -1.873044, 1, 0, 0, 1, 1,
-0.91265, -0.1290608, -2.414958, 0, 0, 0, 1, 1,
-0.9098235, -0.6527759, -1.173517, 0, 0, 0, 1, 1,
-0.904658, 0.5061213, -2.17748, 0, 0, 0, 1, 1,
-0.9026054, 1.45004, -0.4253023, 0, 0, 0, 1, 1,
-0.9013731, 0.4604703, -1.358611, 0, 0, 0, 1, 1,
-0.8948759, -1.814467, -4.582985, 0, 0, 0, 1, 1,
-0.8919877, -0.8895479, -2.192412, 0, 0, 0, 1, 1,
-0.8794469, 0.4876801, -0.3490505, 1, 1, 1, 1, 1,
-0.8774093, 1.174538, -0.3753481, 1, 1, 1, 1, 1,
-0.8762791, 3.064726, -1.89947, 1, 1, 1, 1, 1,
-0.8686461, -2.099743, -2.268864, 1, 1, 1, 1, 1,
-0.8646814, 1.488692, 0.2432584, 1, 1, 1, 1, 1,
-0.8616214, 1.190619, 0.5189926, 1, 1, 1, 1, 1,
-0.8583268, -1.220041, -1.549199, 1, 1, 1, 1, 1,
-0.8575193, 0.6739469, 0.8604882, 1, 1, 1, 1, 1,
-0.8528751, -0.6965849, -1.44287, 1, 1, 1, 1, 1,
-0.8469828, 0.5059088, -1.198454, 1, 1, 1, 1, 1,
-0.8458491, -0.663245, -1.743864, 1, 1, 1, 1, 1,
-0.8400107, -0.6026477, -2.868543, 1, 1, 1, 1, 1,
-0.8375337, 0.3968441, -0.430773, 1, 1, 1, 1, 1,
-0.8374956, -0.833376, -1.429191, 1, 1, 1, 1, 1,
-0.8345993, -1.600044, -2.536656, 1, 1, 1, 1, 1,
-0.832734, 1.912323, -2.015466, 0, 0, 1, 1, 1,
-0.8324251, 0.57763, 0.485522, 1, 0, 0, 1, 1,
-0.8281761, 0.08706201, -0.2145022, 1, 0, 0, 1, 1,
-0.8251736, 0.8756981, -0.3168137, 1, 0, 0, 1, 1,
-0.8205205, -1.052329, -2.003838, 1, 0, 0, 1, 1,
-0.814288, 0.1325927, -0.9012444, 1, 0, 0, 1, 1,
-0.8059703, 0.1906546, -0.122048, 0, 0, 0, 1, 1,
-0.8001217, 1.141401, -1.592271, 0, 0, 0, 1, 1,
-0.7923757, -0.208014, -3.195776, 0, 0, 0, 1, 1,
-0.7919236, 1.193094, -0.8380165, 0, 0, 0, 1, 1,
-0.7898142, -0.3220516, -2.568486, 0, 0, 0, 1, 1,
-0.7853204, -0.3262176, -3.001678, 0, 0, 0, 1, 1,
-0.7783998, -0.1731692, -2.979326, 0, 0, 0, 1, 1,
-0.7783632, -0.8649989, -3.421137, 1, 1, 1, 1, 1,
-0.7772591, -0.4964685, -2.966756, 1, 1, 1, 1, 1,
-0.7726284, 0.2531814, -0.006065483, 1, 1, 1, 1, 1,
-0.7659159, -0.7263553, -2.605282, 1, 1, 1, 1, 1,
-0.7641343, 1.007222, -1.075685, 1, 1, 1, 1, 1,
-0.762013, 1.389248, -1.256868, 1, 1, 1, 1, 1,
-0.7524149, 0.4196226, -0.6323907, 1, 1, 1, 1, 1,
-0.7487933, -2.487875, -3.350264, 1, 1, 1, 1, 1,
-0.7477303, -0.3814404, -0.4753004, 1, 1, 1, 1, 1,
-0.7467427, -2.30607, -2.364411, 1, 1, 1, 1, 1,
-0.723832, 0.979819, -1.520481, 1, 1, 1, 1, 1,
-0.7235441, 0.08977217, -2.297503, 1, 1, 1, 1, 1,
-0.7227985, -1.041497, -1.704095, 1, 1, 1, 1, 1,
-0.7224985, -1.487424, -3.004282, 1, 1, 1, 1, 1,
-0.7182261, -1.215112, -3.175461, 1, 1, 1, 1, 1,
-0.7163357, -0.8782969, -2.231407, 0, 0, 1, 1, 1,
-0.7160248, -0.3524191, -1.887628, 1, 0, 0, 1, 1,
-0.6958318, -0.1508509, -1.392746, 1, 0, 0, 1, 1,
-0.6931722, -0.7978682, -2.7412, 1, 0, 0, 1, 1,
-0.6912329, 0.4817611, -2.118838, 1, 0, 0, 1, 1,
-0.6887664, -0.08498489, -2.059426, 1, 0, 0, 1, 1,
-0.6839784, -1.28956, -1.429487, 0, 0, 0, 1, 1,
-0.6799383, 1.020904, -0.105617, 0, 0, 0, 1, 1,
-0.6791075, 0.7281657, -0.4318355, 0, 0, 0, 1, 1,
-0.6762669, 0.4556983, -2.162518, 0, 0, 0, 1, 1,
-0.6741602, 0.1463396, 0.0181884, 0, 0, 0, 1, 1,
-0.6741201, -1.604134, -2.440568, 0, 0, 0, 1, 1,
-0.6714969, 0.3670045, -0.1239593, 0, 0, 0, 1, 1,
-0.6710465, -0.1334738, -3.296252, 1, 1, 1, 1, 1,
-0.6658712, -1.191365, -2.822348, 1, 1, 1, 1, 1,
-0.6617629, 0.8246186, -0.6017379, 1, 1, 1, 1, 1,
-0.6614097, -0.7826284, -3.515318, 1, 1, 1, 1, 1,
-0.6581618, -0.541953, -0.9572445, 1, 1, 1, 1, 1,
-0.6559061, 0.2190161, -1.493119, 1, 1, 1, 1, 1,
-0.6514111, -0.6397588, -2.074924, 1, 1, 1, 1, 1,
-0.646426, 0.1930349, -1.672271, 1, 1, 1, 1, 1,
-0.6439798, -0.3805569, -2.812276, 1, 1, 1, 1, 1,
-0.6436734, 0.1434955, -0.4656376, 1, 1, 1, 1, 1,
-0.6435884, 1.245691, -0.5343614, 1, 1, 1, 1, 1,
-0.6384442, 0.2753768, -2.005962, 1, 1, 1, 1, 1,
-0.6366994, 1.481706, -1.853125, 1, 1, 1, 1, 1,
-0.6353883, 1.091462, -1.11953, 1, 1, 1, 1, 1,
-0.6329147, 0.4213073, -0.383757, 1, 1, 1, 1, 1,
-0.6312901, -1.294037, -2.947677, 0, 0, 1, 1, 1,
-0.6246243, 0.1470791, 0.0219032, 1, 0, 0, 1, 1,
-0.6238855, -0.5406045, -3.49633, 1, 0, 0, 1, 1,
-0.6201552, 0.2500494, -2.214072, 1, 0, 0, 1, 1,
-0.6170083, 0.03798914, -1.209023, 1, 0, 0, 1, 1,
-0.6135489, 0.09245118, -3.676727, 1, 0, 0, 1, 1,
-0.6114956, 1.144294, -0.6938995, 0, 0, 0, 1, 1,
-0.6077012, 1.689194, 1.10536, 0, 0, 0, 1, 1,
-0.6066346, -0.3293912, -2.858435, 0, 0, 0, 1, 1,
-0.6032723, -0.3919948, -3.854076, 0, 0, 0, 1, 1,
-0.6027164, -0.2322595, -1.522555, 0, 0, 0, 1, 1,
-0.5980036, 2.26548, -2.20806, 0, 0, 0, 1, 1,
-0.5959229, 0.6652628, -0.7458804, 0, 0, 0, 1, 1,
-0.595248, -0.151733, -0.9979962, 1, 1, 1, 1, 1,
-0.5900182, -0.8914785, -2.546036, 1, 1, 1, 1, 1,
-0.5882247, -0.3827109, -3.28159, 1, 1, 1, 1, 1,
-0.5874357, 0.8260632, -0.1742586, 1, 1, 1, 1, 1,
-0.5831299, -0.2336189, -1.643193, 1, 1, 1, 1, 1,
-0.5802882, -1.539441, -1.451214, 1, 1, 1, 1, 1,
-0.5777184, -0.2064738, -1.974163, 1, 1, 1, 1, 1,
-0.5773156, -2.551276, -2.033299, 1, 1, 1, 1, 1,
-0.5657629, 0.6599346, -1.680371, 1, 1, 1, 1, 1,
-0.5619002, -0.5859358, -2.736966, 1, 1, 1, 1, 1,
-0.5576633, -0.3772522, -2.881647, 1, 1, 1, 1, 1,
-0.55458, -1.400655, -1.559602, 1, 1, 1, 1, 1,
-0.5544497, -0.5375, -0.7489259, 1, 1, 1, 1, 1,
-0.5508969, -0.8735614, -2.00231, 1, 1, 1, 1, 1,
-0.5480733, 2.190529, -1.469252, 1, 1, 1, 1, 1,
-0.5478321, 0.6703216, 0.5660196, 0, 0, 1, 1, 1,
-0.5456709, 0.2826459, -0.8979012, 1, 0, 0, 1, 1,
-0.5419698, -0.3083534, -2.667471, 1, 0, 0, 1, 1,
-0.5396791, 0.8502952, -1.461255, 1, 0, 0, 1, 1,
-0.5326171, 0.8841554, 0.8474796, 1, 0, 0, 1, 1,
-0.5295099, 1.084978, 0.03913031, 1, 0, 0, 1, 1,
-0.5279083, -1.022256, -2.84589, 0, 0, 0, 1, 1,
-0.5262405, 1.228134, 2.517041, 0, 0, 0, 1, 1,
-0.5178059, -0.8264199, -2.143254, 0, 0, 0, 1, 1,
-0.5172302, 0.6419283, -2.477288, 0, 0, 0, 1, 1,
-0.5085331, -0.356281, -3.213654, 0, 0, 0, 1, 1,
-0.5015179, 1.042326, 0.7264435, 0, 0, 0, 1, 1,
-0.4935619, 1.332102, 1.338774, 0, 0, 0, 1, 1,
-0.4922372, 0.5160983, -0.3809144, 1, 1, 1, 1, 1,
-0.4853135, -0.1706107, -2.2075, 1, 1, 1, 1, 1,
-0.4812608, 0.8193323, 0.7481351, 1, 1, 1, 1, 1,
-0.4673191, -0.214979, -1.941271, 1, 1, 1, 1, 1,
-0.4644891, 0.1932874, 0.5832368, 1, 1, 1, 1, 1,
-0.4634475, -0.1643129, -0.1443976, 1, 1, 1, 1, 1,
-0.4627512, 0.0007551951, -1.358502, 1, 1, 1, 1, 1,
-0.4611829, -1.330742, -4.17382, 1, 1, 1, 1, 1,
-0.4601868, 0.5437312, -0.8545326, 1, 1, 1, 1, 1,
-0.4580962, 0.5296007, -1.253216, 1, 1, 1, 1, 1,
-0.4578083, -0.622774, -3.039161, 1, 1, 1, 1, 1,
-0.4569436, 0.4674648, -0.7209351, 1, 1, 1, 1, 1,
-0.4545378, -0.01911989, -2.560125, 1, 1, 1, 1, 1,
-0.4527369, 0.4266509, -1.038372, 1, 1, 1, 1, 1,
-0.452449, -0.8278617, -1.863302, 1, 1, 1, 1, 1,
-0.4472184, 0.7796338, -0.9145351, 0, 0, 1, 1, 1,
-0.4469909, -0.3026232, -0.3477966, 1, 0, 0, 1, 1,
-0.4441223, -0.7846998, -2.663882, 1, 0, 0, 1, 1,
-0.443052, -0.8686628, -2.533605, 1, 0, 0, 1, 1,
-0.4421866, -0.905407, -3.620956, 1, 0, 0, 1, 1,
-0.4381192, -1.167139, -2.677754, 1, 0, 0, 1, 1,
-0.4352036, 1.460241, -0.1913677, 0, 0, 0, 1, 1,
-0.4328716, -0.4208489, -2.191803, 0, 0, 0, 1, 1,
-0.4305259, -2.029561, -3.612348, 0, 0, 0, 1, 1,
-0.4302151, -0.08237628, -1.237991, 0, 0, 0, 1, 1,
-0.4285699, -0.08411326, -3.341779, 0, 0, 0, 1, 1,
-0.4272485, 1.373601, -0.9944715, 0, 0, 0, 1, 1,
-0.4262402, -0.7683479, -1.867713, 0, 0, 0, 1, 1,
-0.4248642, -0.9088766, -2.488031, 1, 1, 1, 1, 1,
-0.4229596, 0.382568, 0.057134, 1, 1, 1, 1, 1,
-0.4181311, 0.3187769, -0.1144959, 1, 1, 1, 1, 1,
-0.4157561, -0.7716843, -2.382204, 1, 1, 1, 1, 1,
-0.4086135, 1.708869, -0.01394632, 1, 1, 1, 1, 1,
-0.4059581, -0.3858941, -0.5319517, 1, 1, 1, 1, 1,
-0.4048402, 0.6759994, 0.08352557, 1, 1, 1, 1, 1,
-0.4038422, -0.1023681, -0.2689464, 1, 1, 1, 1, 1,
-0.4031736, -0.238693, -2.627147, 1, 1, 1, 1, 1,
-0.3998877, 0.9785575, 0.9995286, 1, 1, 1, 1, 1,
-0.3996346, -0.04417219, -0.2530296, 1, 1, 1, 1, 1,
-0.3989347, 0.2101233, -1.162185, 1, 1, 1, 1, 1,
-0.3968266, -1.508675, -2.018399, 1, 1, 1, 1, 1,
-0.3967201, -1.598243, -2.457189, 1, 1, 1, 1, 1,
-0.3896703, -0.0710443, -0.9101613, 1, 1, 1, 1, 1,
-0.3848129, 0.2778166, -1.294114, 0, 0, 1, 1, 1,
-0.3804911, -0.3156205, -1.799612, 1, 0, 0, 1, 1,
-0.3770765, 1.490211, -1.436887, 1, 0, 0, 1, 1,
-0.3749713, -0.7751296, -3.229141, 1, 0, 0, 1, 1,
-0.3746821, 0.007248497, -3.198361, 1, 0, 0, 1, 1,
-0.3628756, 0.2494471, -0.606034, 1, 0, 0, 1, 1,
-0.3585742, -0.5297373, -2.05595, 0, 0, 0, 1, 1,
-0.3582274, -2.264752, -2.287334, 0, 0, 0, 1, 1,
-0.3554532, -0.7920944, -3.297498, 0, 0, 0, 1, 1,
-0.3529428, -0.1347901, -1.236323, 0, 0, 0, 1, 1,
-0.3464762, 1.554921, -1.170437, 0, 0, 0, 1, 1,
-0.3378975, -0.7425926, -0.6149052, 0, 0, 0, 1, 1,
-0.3364138, 1.302838, 0.2723077, 0, 0, 0, 1, 1,
-0.3341019, 0.4849986, -1.091661, 1, 1, 1, 1, 1,
-0.3339787, 0.1770799, -1.931851, 1, 1, 1, 1, 1,
-0.3338712, -0.04766119, -0.2406492, 1, 1, 1, 1, 1,
-0.3332317, -0.9640113, -1.937168, 1, 1, 1, 1, 1,
-0.3286887, 1.436962, -0.1289361, 1, 1, 1, 1, 1,
-0.3270459, -0.6743114, -3.466801, 1, 1, 1, 1, 1,
-0.3261931, -0.1703151, -2.685757, 1, 1, 1, 1, 1,
-0.3243731, 0.5330032, 0.662644, 1, 1, 1, 1, 1,
-0.3212644, -2.178833, -2.5582, 1, 1, 1, 1, 1,
-0.3204731, -1.800981, -3.940513, 1, 1, 1, 1, 1,
-0.318309, -0.1785012, -1.1898, 1, 1, 1, 1, 1,
-0.313057, 0.04446555, -2.051775, 1, 1, 1, 1, 1,
-0.3110611, -1.275596, -6.356704, 1, 1, 1, 1, 1,
-0.3091669, -1.518373, -3.030022, 1, 1, 1, 1, 1,
-0.308683, -1.311214, -2.452581, 1, 1, 1, 1, 1,
-0.3052586, 1.044199, -1.801355, 0, 0, 1, 1, 1,
-0.3049284, 1.054512, -1.645359, 1, 0, 0, 1, 1,
-0.3029451, 0.7932548, -2.542079, 1, 0, 0, 1, 1,
-0.2985108, 0.212935, -3.005593, 1, 0, 0, 1, 1,
-0.2928214, -1.250346, -3.585899, 1, 0, 0, 1, 1,
-0.2841939, 0.4782846, -0.6556396, 1, 0, 0, 1, 1,
-0.2838237, -0.2622748, -1.521956, 0, 0, 0, 1, 1,
-0.2817409, 2.612591, 0.07969232, 0, 0, 0, 1, 1,
-0.2813971, 1.519005, -1.303668, 0, 0, 0, 1, 1,
-0.2805375, -0.3735747, -1.916289, 0, 0, 0, 1, 1,
-0.279462, -1.00912, -3.512229, 0, 0, 0, 1, 1,
-0.2776096, -0.1784189, -3.471698, 0, 0, 0, 1, 1,
-0.2765684, 0.7513329, 0.2591275, 0, 0, 0, 1, 1,
-0.275856, -0.115086, -2.093035, 1, 1, 1, 1, 1,
-0.2716348, 0.8137493, -1.743495, 1, 1, 1, 1, 1,
-0.2685537, -1.281727, -0.5715827, 1, 1, 1, 1, 1,
-0.2658036, -0.2308894, -2.470544, 1, 1, 1, 1, 1,
-0.2656768, -1.146425, -3.596629, 1, 1, 1, 1, 1,
-0.2609449, 0.03491635, -2.297988, 1, 1, 1, 1, 1,
-0.260768, 1.108441, -1.896532, 1, 1, 1, 1, 1,
-0.2582857, 0.4213085, -0.6449224, 1, 1, 1, 1, 1,
-0.2558491, 1.261772, -0.4168949, 1, 1, 1, 1, 1,
-0.2541606, 1.030858, 0.1658309, 1, 1, 1, 1, 1,
-0.2530599, -2.07045, -2.227909, 1, 1, 1, 1, 1,
-0.2510908, 2.318968, 0.8026919, 1, 1, 1, 1, 1,
-0.2491249, 1.505711, 1.154099, 1, 1, 1, 1, 1,
-0.246685, -2.090762, -3.097952, 1, 1, 1, 1, 1,
-0.2418742, 0.1586604, -0.851362, 1, 1, 1, 1, 1,
-0.2405996, 0.9676989, 0.5102544, 0, 0, 1, 1, 1,
-0.2405434, 0.1453876, -1.98649, 1, 0, 0, 1, 1,
-0.2399953, 0.3939784, -0.7605196, 1, 0, 0, 1, 1,
-0.2361448, 1.444795, -0.4172062, 1, 0, 0, 1, 1,
-0.2343827, 0.1717847, -0.4243225, 1, 0, 0, 1, 1,
-0.2343699, 0.4362464, -0.3473618, 1, 0, 0, 1, 1,
-0.2337053, -0.119994, -3.842016, 0, 0, 0, 1, 1,
-0.2326305, 0.5583366, 1.154603, 0, 0, 0, 1, 1,
-0.2284953, 2.329755, 0.5915307, 0, 0, 0, 1, 1,
-0.2279669, 1.146078, -1.255746, 0, 0, 0, 1, 1,
-0.2279215, 0.8085155, -0.1415001, 0, 0, 0, 1, 1,
-0.2265014, 0.3943427, 0.2158516, 0, 0, 0, 1, 1,
-0.2225821, 1.088248, -0.5664763, 0, 0, 0, 1, 1,
-0.2217914, 1.716615, 0.42246, 1, 1, 1, 1, 1,
-0.219594, -0.2492289, -1.985803, 1, 1, 1, 1, 1,
-0.2104648, -1.50909, -2.357564, 1, 1, 1, 1, 1,
-0.2091503, -0.07024613, -1.030315, 1, 1, 1, 1, 1,
-0.208248, 1.035484, 0.1441921, 1, 1, 1, 1, 1,
-0.2069968, 0.04058834, -1.945503, 1, 1, 1, 1, 1,
-0.2048147, -2.056121, -3.177865, 1, 1, 1, 1, 1,
-0.2032119, -0.4897029, -3.217424, 1, 1, 1, 1, 1,
-0.2025227, 0.9444034, -0.5978848, 1, 1, 1, 1, 1,
-0.1984572, -0.2805056, -1.657296, 1, 1, 1, 1, 1,
-0.1980417, 1.262816, -0.3457565, 1, 1, 1, 1, 1,
-0.1951388, -1.599471, -3.521349, 1, 1, 1, 1, 1,
-0.1927595, 0.8208478, 1.848015, 1, 1, 1, 1, 1,
-0.1894077, 0.4478733, -0.07541873, 1, 1, 1, 1, 1,
-0.183998, 0.8998138, -0.8930619, 1, 1, 1, 1, 1,
-0.1801258, 1.294611, -0.1896226, 0, 0, 1, 1, 1,
-0.1778791, -1.687156, -2.899946, 1, 0, 0, 1, 1,
-0.1722628, 1.080826, 0.196861, 1, 0, 0, 1, 1,
-0.1691777, -1.160368, -3.759169, 1, 0, 0, 1, 1,
-0.1664309, -1.501738, -3.13747, 1, 0, 0, 1, 1,
-0.1648199, -0.8721094, -2.765601, 1, 0, 0, 1, 1,
-0.1641887, -0.5135303, -3.831121, 0, 0, 0, 1, 1,
-0.163042, -1.368216, -4.431587, 0, 0, 0, 1, 1,
-0.1606743, 0.6016352, 1.399025, 0, 0, 0, 1, 1,
-0.158864, -0.2046338, -2.999936, 0, 0, 0, 1, 1,
-0.1582355, -0.8531088, -2.957184, 0, 0, 0, 1, 1,
-0.1542102, -1.341493, -3.894033, 0, 0, 0, 1, 1,
-0.1520263, -0.0128418, -1.526645, 0, 0, 0, 1, 1,
-0.1515887, 0.3845291, -0.9169895, 1, 1, 1, 1, 1,
-0.1480666, -1.389079, -2.66392, 1, 1, 1, 1, 1,
-0.1477896, 0.6816553, 0.2034038, 1, 1, 1, 1, 1,
-0.1472032, -0.6427279, -1.074693, 1, 1, 1, 1, 1,
-0.1468514, 1.492617, -0.08949114, 1, 1, 1, 1, 1,
-0.1460725, 1.108741, 0.1038735, 1, 1, 1, 1, 1,
-0.1404143, 0.807127, -0.3219816, 1, 1, 1, 1, 1,
-0.1390489, -0.4661353, -3.641524, 1, 1, 1, 1, 1,
-0.1387022, -0.06161176, -4.292984, 1, 1, 1, 1, 1,
-0.1372297, 0.4054233, -1.407677, 1, 1, 1, 1, 1,
-0.1340386, 0.3379102, -1.534374, 1, 1, 1, 1, 1,
-0.1295778, 2.483305, 0.947479, 1, 1, 1, 1, 1,
-0.1294766, 0.2548204, -0.5944456, 1, 1, 1, 1, 1,
-0.1213497, -0.2843759, -4.304267, 1, 1, 1, 1, 1,
-0.1163878, 1.198446, -0.8572727, 1, 1, 1, 1, 1,
-0.1114688, -0.8043478, -2.663848, 0, 0, 1, 1, 1,
-0.1101207, 0.2905563, -0.7918074, 1, 0, 0, 1, 1,
-0.1083308, -0.247965, -3.630521, 1, 0, 0, 1, 1,
-0.1056403, 0.7023693, -2.465406, 1, 0, 0, 1, 1,
-0.1051877, -0.0795516, -4.703875, 1, 0, 0, 1, 1,
-0.1005726, -0.6441895, -1.99841, 1, 0, 0, 1, 1,
-0.09543186, -0.3427899, -1.541177, 0, 0, 0, 1, 1,
-0.09383761, -0.3695019, -3.84633, 0, 0, 0, 1, 1,
-0.0866679, 0.5675405, -1.595523, 0, 0, 0, 1, 1,
-0.08564551, -1.019028, -2.792256, 0, 0, 0, 1, 1,
-0.07656229, 1.610678, -0.2338918, 0, 0, 0, 1, 1,
-0.07546873, -0.521314, -2.304814, 0, 0, 0, 1, 1,
-0.07542609, -0.2103861, -3.367934, 0, 0, 0, 1, 1,
-0.06924253, 1.087969, -1.234179, 1, 1, 1, 1, 1,
-0.06784911, 1.438418, 1.606733, 1, 1, 1, 1, 1,
-0.06734698, 0.985296, 0.5633755, 1, 1, 1, 1, 1,
-0.06556365, -0.6485597, -3.820025, 1, 1, 1, 1, 1,
-0.06428105, -0.8061503, -1.919208, 1, 1, 1, 1, 1,
-0.06312063, 0.6555523, -0.9081538, 1, 1, 1, 1, 1,
-0.06219862, 0.304341, -0.2252368, 1, 1, 1, 1, 1,
-0.05850201, 1.942058, -1.076013, 1, 1, 1, 1, 1,
-0.05645893, 1.317881, 0.4383028, 1, 1, 1, 1, 1,
-0.05582534, 0.2298099, -0.01321006, 1, 1, 1, 1, 1,
-0.05524067, 1.062001, 0.2160113, 1, 1, 1, 1, 1,
-0.05507042, 1.139763, 0.0906343, 1, 1, 1, 1, 1,
-0.05298312, -2.149174, -3.111447, 1, 1, 1, 1, 1,
-0.05192387, 0.4118944, -0.1797146, 1, 1, 1, 1, 1,
-0.05097903, 0.1682042, -0.5523134, 1, 1, 1, 1, 1,
-0.047742, -1.297145, -2.852826, 0, 0, 1, 1, 1,
-0.0453183, -1.265807, -2.49597, 1, 0, 0, 1, 1,
-0.04417166, -0.705666, -4.083166, 1, 0, 0, 1, 1,
-0.0428185, -1.123201, -3.007378, 1, 0, 0, 1, 1,
-0.04172876, 0.7752661, -0.1998689, 1, 0, 0, 1, 1,
-0.04013502, -0.2263941, -3.679564, 1, 0, 0, 1, 1,
-0.03919286, 0.2747932, 0.2695964, 0, 0, 0, 1, 1,
-0.03776709, 1.400972, 0.739283, 0, 0, 0, 1, 1,
-0.03543407, 0.7365094, 1.057107, 0, 0, 0, 1, 1,
-0.03050477, -0.8410561, -4.203493, 0, 0, 0, 1, 1,
-0.02909558, -0.5860182, -3.148318, 0, 0, 0, 1, 1,
-0.02336551, 0.5391095, -0.7574643, 0, 0, 0, 1, 1,
-0.02017188, 0.08607425, -0.7078111, 0, 0, 0, 1, 1,
-0.0185356, -1.030241, -1.862326, 1, 1, 1, 1, 1,
-0.0165136, 0.5811557, 1.516435, 1, 1, 1, 1, 1,
-0.01263419, -0.05307924, -4.742499, 1, 1, 1, 1, 1,
-0.01068215, -1.945556, -4.531951, 1, 1, 1, 1, 1,
-0.010056, 0.6912902, -1.691471, 1, 1, 1, 1, 1,
-0.009895076, 0.5160219, -0.4671623, 1, 1, 1, 1, 1,
-0.009576628, 0.9351725, -0.1171125, 1, 1, 1, 1, 1,
-0.007718068, 1.243087, -0.1096839, 1, 1, 1, 1, 1,
0.008526409, 0.2399444, -0.4978524, 1, 1, 1, 1, 1,
0.009013552, -1.909712, 3.80817, 1, 1, 1, 1, 1,
0.01227416, 1.731564, 1.150256, 1, 1, 1, 1, 1,
0.01685813, -0.8254597, 3.588104, 1, 1, 1, 1, 1,
0.01783922, -1.316659, 3.79545, 1, 1, 1, 1, 1,
0.02054193, -0.4497105, 5.002978, 1, 1, 1, 1, 1,
0.02254329, 0.5582803, -0.7982618, 1, 1, 1, 1, 1,
0.02343211, -1.519896, 4.357262, 0, 0, 1, 1, 1,
0.02726994, -1.959918, 4.217974, 1, 0, 0, 1, 1,
0.03075159, 0.5746679, -0.03383086, 1, 0, 0, 1, 1,
0.03135293, -2.218308, 4.035385, 1, 0, 0, 1, 1,
0.03469642, 0.7503147, 0.2493128, 1, 0, 0, 1, 1,
0.04268847, -1.539945, 4.841055, 1, 0, 0, 1, 1,
0.045771, -1.846868, 3.596499, 0, 0, 0, 1, 1,
0.04978158, 0.4472717, -0.9787756, 0, 0, 0, 1, 1,
0.05159493, 0.403404, 0.7933235, 0, 0, 0, 1, 1,
0.05167313, 0.4733296, 1.724823, 0, 0, 0, 1, 1,
0.05170679, 1.407743, 0.7565707, 0, 0, 0, 1, 1,
0.0573198, -0.5511525, 2.499792, 0, 0, 0, 1, 1,
0.05879535, -0.04693533, 1.308398, 0, 0, 0, 1, 1,
0.05902423, -0.566958, 2.730685, 1, 1, 1, 1, 1,
0.06099987, 1.455395, -0.4701244, 1, 1, 1, 1, 1,
0.06239154, 0.4853337, -0.8354769, 1, 1, 1, 1, 1,
0.06248257, -0.3050053, 4.563435, 1, 1, 1, 1, 1,
0.06334138, 1.609347, 0.9415157, 1, 1, 1, 1, 1,
0.06411885, 1.590657, 3.754416, 1, 1, 1, 1, 1,
0.06759553, 0.4234769, 1.264483, 1, 1, 1, 1, 1,
0.06882057, 0.8112599, 0.5451058, 1, 1, 1, 1, 1,
0.07010349, -0.2343225, 2.135056, 1, 1, 1, 1, 1,
0.07353251, -1.060068, 2.252212, 1, 1, 1, 1, 1,
0.07832746, 0.2627171, 1.541674, 1, 1, 1, 1, 1,
0.08402473, -1.693573, 3.38622, 1, 1, 1, 1, 1,
0.084562, -0.06833773, 1.222763, 1, 1, 1, 1, 1,
0.08594398, -1.382899, 3.125867, 1, 1, 1, 1, 1,
0.08729431, 0.4973528, 2.179311, 1, 1, 1, 1, 1,
0.08800467, 1.105826, 0.4410531, 0, 0, 1, 1, 1,
0.09160083, -1.362742, 4.49767, 1, 0, 0, 1, 1,
0.0917716, -1.184426, 4.601553, 1, 0, 0, 1, 1,
0.09473605, -0.142396, 3.708228, 1, 0, 0, 1, 1,
0.09495457, -1.979902, 3.578985, 1, 0, 0, 1, 1,
0.09756021, 0.5423368, -1.102245, 1, 0, 0, 1, 1,
0.09839858, 1.417661, -0.3022878, 0, 0, 0, 1, 1,
0.100161, -0.8893561, 4.001126, 0, 0, 0, 1, 1,
0.1002595, -1.490903, 2.392372, 0, 0, 0, 1, 1,
0.1065939, 0.6229283, -0.3939317, 0, 0, 0, 1, 1,
0.1096063, 0.484462, 1.117589, 0, 0, 0, 1, 1,
0.111324, 0.2315703, -0.5749974, 0, 0, 0, 1, 1,
0.1135109, -0.2834869, 3.314414, 0, 0, 0, 1, 1,
0.1140904, 0.5246642, 0.1946042, 1, 1, 1, 1, 1,
0.1143634, -0.4531001, 5.158983, 1, 1, 1, 1, 1,
0.1147872, -1.014478, 1.913963, 1, 1, 1, 1, 1,
0.1149656, -0.8354201, 4.091556, 1, 1, 1, 1, 1,
0.1156598, 1.490242, -0.3601956, 1, 1, 1, 1, 1,
0.1159161, -0.09939628, 3.440689, 1, 1, 1, 1, 1,
0.1176208, 0.5661821, 1.308307, 1, 1, 1, 1, 1,
0.1184385, -0.7663341, 4.401231, 1, 1, 1, 1, 1,
0.1196506, 2.295565, 0.7567759, 1, 1, 1, 1, 1,
0.1219177, -0.6080931, 3.138984, 1, 1, 1, 1, 1,
0.1297324, 0.187634, 2.386786, 1, 1, 1, 1, 1,
0.1314984, 0.3073232, -0.1169573, 1, 1, 1, 1, 1,
0.1326808, 0.6372072, -3.346457, 1, 1, 1, 1, 1,
0.1360053, 0.295347, 0.06774959, 1, 1, 1, 1, 1,
0.1381866, 1.148612, -0.3004072, 1, 1, 1, 1, 1,
0.1383048, 0.4290678, -0.2250723, 0, 0, 1, 1, 1,
0.1421173, 0.2733244, -1.058962, 1, 0, 0, 1, 1,
0.1457274, 0.4803203, -0.5821361, 1, 0, 0, 1, 1,
0.1463415, 0.1639639, 0.7292665, 1, 0, 0, 1, 1,
0.1466983, -2.194676, 2.736335, 1, 0, 0, 1, 1,
0.1505692, -0.8448501, 2.818701, 1, 0, 0, 1, 1,
0.1514398, 1.167207, 0.917671, 0, 0, 0, 1, 1,
0.1564691, 1.68278, -0.1556121, 0, 0, 0, 1, 1,
0.1596302, 0.4599093, 0.8864919, 0, 0, 0, 1, 1,
0.16246, 0.2486352, 1.924379, 0, 0, 0, 1, 1,
0.1642085, -0.02931337, 1.079154, 0, 0, 0, 1, 1,
0.1680599, 0.7682867, 0.4743778, 0, 0, 0, 1, 1,
0.170959, -0.8247417, 2.782059, 0, 0, 0, 1, 1,
0.1773097, 0.6265381, 0.5801297, 1, 1, 1, 1, 1,
0.1893017, 0.7089891, 0.09541405, 1, 1, 1, 1, 1,
0.1900011, -0.2447745, 0.7412571, 1, 1, 1, 1, 1,
0.1907305, 0.336825, 1.068967, 1, 1, 1, 1, 1,
0.1968533, 1.356351, -1.222764, 1, 1, 1, 1, 1,
0.1990184, 0.491414, 0.3456918, 1, 1, 1, 1, 1,
0.2010581, -0.6540908, 3.123585, 1, 1, 1, 1, 1,
0.2018292, 0.670063, 0.4496681, 1, 1, 1, 1, 1,
0.2018956, 0.5069194, -0.9302716, 1, 1, 1, 1, 1,
0.2025584, 1.240166, 1.066687, 1, 1, 1, 1, 1,
0.2051776, 0.2651757, -0.2719878, 1, 1, 1, 1, 1,
0.2076745, -1.320308, 1.376358, 1, 1, 1, 1, 1,
0.2117311, 0.2016451, 1.724571, 1, 1, 1, 1, 1,
0.2122243, -0.9325522, 2.370106, 1, 1, 1, 1, 1,
0.2175446, 0.8829857, 0.08517208, 1, 1, 1, 1, 1,
0.2193491, -0.7600709, 1.690066, 0, 0, 1, 1, 1,
0.2216143, -1.261568, 3.242955, 1, 0, 0, 1, 1,
0.2282126, -0.5728983, 2.9264, 1, 0, 0, 1, 1,
0.2307252, 0.3903938, -0.02304559, 1, 0, 0, 1, 1,
0.2311797, 0.3565268, -0.3233179, 1, 0, 0, 1, 1,
0.2332311, -1.677857, 4.151119, 1, 0, 0, 1, 1,
0.23359, -1.2302, 2.930928, 0, 0, 0, 1, 1,
0.2339115, 0.07717522, 2.507884, 0, 0, 0, 1, 1,
0.2370272, 0.7053746, 0.9640166, 0, 0, 0, 1, 1,
0.2377307, 0.8613719, 0.06978972, 0, 0, 0, 1, 1,
0.2407796, 0.2117439, -1.48212, 0, 0, 0, 1, 1,
0.2578342, 0.6703906, 1.071698, 0, 0, 0, 1, 1,
0.2596931, 0.9735234, 0.6390828, 0, 0, 0, 1, 1,
0.2623426, 0.1735435, 0.7876973, 1, 1, 1, 1, 1,
0.2659883, -0.5765647, 2.309762, 1, 1, 1, 1, 1,
0.2674975, -0.2092835, 0.6882871, 1, 1, 1, 1, 1,
0.2704359, 0.8270159, 0.04720764, 1, 1, 1, 1, 1,
0.2710115, -0.293081, 2.414363, 1, 1, 1, 1, 1,
0.2751421, 1.636301, 0.7785105, 1, 1, 1, 1, 1,
0.2784149, 1.402462, 1.196097, 1, 1, 1, 1, 1,
0.2792009, 0.4024113, 0.7118686, 1, 1, 1, 1, 1,
0.2854227, 1.217392, -0.3711427, 1, 1, 1, 1, 1,
0.2893447, 0.3916503, 0.6732106, 1, 1, 1, 1, 1,
0.2960237, -0.4885219, 4.43061, 1, 1, 1, 1, 1,
0.2999543, -1.156183, 3.740915, 1, 1, 1, 1, 1,
0.3039566, 0.4380063, -0.9465697, 1, 1, 1, 1, 1,
0.3098713, -1.792402, 3.500035, 1, 1, 1, 1, 1,
0.3125015, 0.01437128, 2.739587, 1, 1, 1, 1, 1,
0.3171749, -0.6317294, 3.916336, 0, 0, 1, 1, 1,
0.3172413, 0.3151069, 0.001369711, 1, 0, 0, 1, 1,
0.3185537, 1.387829, 0.2791586, 1, 0, 0, 1, 1,
0.3187437, 0.5617025, 0.899891, 1, 0, 0, 1, 1,
0.3189721, -1.555509, 0.754612, 1, 0, 0, 1, 1,
0.3195666, 0.04049421, 2.583229, 1, 0, 0, 1, 1,
0.3203306, 1.986827, -0.2747584, 0, 0, 0, 1, 1,
0.3238277, -0.1089151, 2.497102, 0, 0, 0, 1, 1,
0.326994, -2.15055, 0.5434476, 0, 0, 0, 1, 1,
0.3339052, 1.156363, 0.347661, 0, 0, 0, 1, 1,
0.3343885, -0.4851912, 2.16749, 0, 0, 0, 1, 1,
0.3396657, 1.002042, 1.12852, 0, 0, 0, 1, 1,
0.3410459, -0.140193, 1.019887, 0, 0, 0, 1, 1,
0.3481408, 0.5009841, 0.8717404, 1, 1, 1, 1, 1,
0.3507588, 0.3505766, 1.474989, 1, 1, 1, 1, 1,
0.3513372, 1.729786, 0.218073, 1, 1, 1, 1, 1,
0.3531607, -0.06544961, 2.030117, 1, 1, 1, 1, 1,
0.3532508, -0.6707114, 3.151142, 1, 1, 1, 1, 1,
0.3584876, 0.7702808, 0.2603841, 1, 1, 1, 1, 1,
0.3586289, -0.3083774, 2.625164, 1, 1, 1, 1, 1,
0.3629304, 0.7552574, 0.8217685, 1, 1, 1, 1, 1,
0.366044, 0.2253779, -0.4476191, 1, 1, 1, 1, 1,
0.3661918, -0.1622305, 2.413658, 1, 1, 1, 1, 1,
0.3679399, -0.4667318, 3.876217, 1, 1, 1, 1, 1,
0.3691474, 0.1459255, 1.127591, 1, 1, 1, 1, 1,
0.3732831, 0.3590182, 0.6514246, 1, 1, 1, 1, 1,
0.3759887, 1.811215, 1.235656, 1, 1, 1, 1, 1,
0.3767026, -0.1616518, 2.55408, 1, 1, 1, 1, 1,
0.3839519, -0.2967931, 2.120933, 0, 0, 1, 1, 1,
0.3860244, -0.5089861, 1.931783, 1, 0, 0, 1, 1,
0.3913754, -0.8263379, 0.2778273, 1, 0, 0, 1, 1,
0.3931046, 0.14209, 1.211368, 1, 0, 0, 1, 1,
0.3949975, 0.8906184, 2.660014, 1, 0, 0, 1, 1,
0.4001919, -0.2486479, 2.065469, 1, 0, 0, 1, 1,
0.4015201, -0.3661551, 3.346839, 0, 0, 0, 1, 1,
0.4112399, -1.277152, 4.174918, 0, 0, 0, 1, 1,
0.4122471, 0.7665653, 0.6320603, 0, 0, 0, 1, 1,
0.4129586, 0.4044958, 0.336819, 0, 0, 0, 1, 1,
0.4155729, 0.4295017, -0.2572772, 0, 0, 0, 1, 1,
0.4219227, -0.9579216, 2.399002, 0, 0, 0, 1, 1,
0.4227724, 1.649453, 1.757204, 0, 0, 0, 1, 1,
0.4285396, 0.6804975, 1.802216, 1, 1, 1, 1, 1,
0.4313061, -0.5741767, 1.20391, 1, 1, 1, 1, 1,
0.4321917, -0.9434379, 2.367541, 1, 1, 1, 1, 1,
0.4384589, 0.6827586, 1.970828, 1, 1, 1, 1, 1,
0.4479486, 0.8283799, 0.1539436, 1, 1, 1, 1, 1,
0.4495972, 0.6352409, 2.11907, 1, 1, 1, 1, 1,
0.4534943, 0.1156891, 1.896857, 1, 1, 1, 1, 1,
0.4538648, 0.6490808, 0.569472, 1, 1, 1, 1, 1,
0.4552162, 0.8128624, 0.3657776, 1, 1, 1, 1, 1,
0.460695, 0.06162867, 1.743127, 1, 1, 1, 1, 1,
0.4667607, -1.734191, 1.663857, 1, 1, 1, 1, 1,
0.4711684, -0.6895438, 3.504256, 1, 1, 1, 1, 1,
0.4778834, -0.4939764, 2.916025, 1, 1, 1, 1, 1,
0.4785728, -0.402283, 2.324269, 1, 1, 1, 1, 1,
0.4824373, -1.4909, 2.222307, 1, 1, 1, 1, 1,
0.4851583, 0.09333418, 2.234576, 0, 0, 1, 1, 1,
0.4868633, -0.7244798, 2.298561, 1, 0, 0, 1, 1,
0.489395, 0.8889406, 0.08746012, 1, 0, 0, 1, 1,
0.4904287, -0.3357326, 1.312823, 1, 0, 0, 1, 1,
0.4925335, 1.469876, -0.4802543, 1, 0, 0, 1, 1,
0.497413, 0.115005, 0.8068632, 1, 0, 0, 1, 1,
0.4978103, -0.9762304, 3.134612, 0, 0, 0, 1, 1,
0.4993291, -2.792473, 3.335197, 0, 0, 0, 1, 1,
0.5016882, 0.7000084, 1.495216, 0, 0, 0, 1, 1,
0.5018476, -0.7592243, 1.070842, 0, 0, 0, 1, 1,
0.5060655, 0.3752746, 0.4028432, 0, 0, 0, 1, 1,
0.5069726, 0.1474197, -0.7936103, 0, 0, 0, 1, 1,
0.5103466, -0.7507285, 2.83742, 0, 0, 0, 1, 1,
0.5109242, 1.106132, 0.3248285, 1, 1, 1, 1, 1,
0.5133822, -0.8540742, 3.63656, 1, 1, 1, 1, 1,
0.5217047, 1.516121, 1.103796, 1, 1, 1, 1, 1,
0.5280883, 0.02412482, 3.006071, 1, 1, 1, 1, 1,
0.5286078, 0.3272654, 1.335579, 1, 1, 1, 1, 1,
0.5347154, 0.9481977, 1.266713, 1, 1, 1, 1, 1,
0.5359957, 0.6997125, 2.136525, 1, 1, 1, 1, 1,
0.5363551, 0.901114, -1.112352, 1, 1, 1, 1, 1,
0.5379963, -1.369747, 0.5548102, 1, 1, 1, 1, 1,
0.5434244, 0.04766829, 0.7879526, 1, 1, 1, 1, 1,
0.5449255, 1.130115, -1.135071, 1, 1, 1, 1, 1,
0.5471046, 1.160856, -0.2418378, 1, 1, 1, 1, 1,
0.5480141, -0.2449474, 4.015305, 1, 1, 1, 1, 1,
0.5505521, -1.705522, 4.06625, 1, 1, 1, 1, 1,
0.5514117, 0.2207265, 2.126841, 1, 1, 1, 1, 1,
0.5515379, 0.5616429, 1.606535, 0, 0, 1, 1, 1,
0.5561613, 0.1293849, 0.5082228, 1, 0, 0, 1, 1,
0.5582563, -0.7638515, 3.245912, 1, 0, 0, 1, 1,
0.5615528, -0.5283461, 2.384015, 1, 0, 0, 1, 1,
0.5687248, -0.3501678, 3.145971, 1, 0, 0, 1, 1,
0.5803428, -0.1807893, 1.520876, 1, 0, 0, 1, 1,
0.5804748, -0.06410895, 1.659756, 0, 0, 0, 1, 1,
0.5814179, 0.5192596, 1.190661, 0, 0, 0, 1, 1,
0.5996088, 0.8032118, 1.007244, 0, 0, 0, 1, 1,
0.6014627, -0.7429304, 2.707145, 0, 0, 0, 1, 1,
0.6038969, 0.3139012, 0.2200993, 0, 0, 0, 1, 1,
0.6064346, 0.4300076, 0.2019207, 0, 0, 0, 1, 1,
0.6068296, -0.7713262, 1.9952, 0, 0, 0, 1, 1,
0.611285, 0.7152675, -0.2353119, 1, 1, 1, 1, 1,
0.6131201, 0.2639532, 0.9154559, 1, 1, 1, 1, 1,
0.6153898, -1.642124, 0.8954886, 1, 1, 1, 1, 1,
0.616244, 0.5930746, -0.9140611, 1, 1, 1, 1, 1,
0.617035, 1.116267, 0.7007761, 1, 1, 1, 1, 1,
0.6181226, -0.7009763, 3.171392, 1, 1, 1, 1, 1,
0.6191816, 2.238538, -0.9858113, 1, 1, 1, 1, 1,
0.6225368, -0.2067191, 2.595674, 1, 1, 1, 1, 1,
0.6227518, -1.70753, 3.310567, 1, 1, 1, 1, 1,
0.6256915, -1.358278, 2.50604, 1, 1, 1, 1, 1,
0.6275651, -0.4373727, 3.349299, 1, 1, 1, 1, 1,
0.6369641, -1.147351, 2.452154, 1, 1, 1, 1, 1,
0.6374212, 0.3918057, -0.3395521, 1, 1, 1, 1, 1,
0.6378402, 1.016357, 1.367416, 1, 1, 1, 1, 1,
0.6449149, -1.689634, 3.504231, 1, 1, 1, 1, 1,
0.6485652, 0.515654, 0.8505205, 0, 0, 1, 1, 1,
0.6498657, -0.2934676, 1.324283, 1, 0, 0, 1, 1,
0.657465, -0.7363544, 2.97383, 1, 0, 0, 1, 1,
0.6581241, -0.3793801, 1.143643, 1, 0, 0, 1, 1,
0.6709823, 0.4001914, 1.346193, 1, 0, 0, 1, 1,
0.6766429, -1.235697, 3.101292, 1, 0, 0, 1, 1,
0.6816664, -1.497174, 2.309359, 0, 0, 0, 1, 1,
0.6918736, 1.522259, -1.279728, 0, 0, 0, 1, 1,
0.6943093, -1.73113, 3.365024, 0, 0, 0, 1, 1,
0.6950012, 0.48982, 1.123859, 0, 0, 0, 1, 1,
0.6966214, 0.7387882, 1.493988, 0, 0, 0, 1, 1,
0.7112954, 0.2760387, 2.051576, 0, 0, 0, 1, 1,
0.7131465, 0.7660701, 0.7661934, 0, 0, 0, 1, 1,
0.7178374, -0.7240391, 1.747357, 1, 1, 1, 1, 1,
0.7218705, 0.8220523, -0.05365722, 1, 1, 1, 1, 1,
0.7224931, -0.6637467, 2.79571, 1, 1, 1, 1, 1,
0.7229689, -0.1373157, 2.434435, 1, 1, 1, 1, 1,
0.7230014, 0.1329281, 2.44983, 1, 1, 1, 1, 1,
0.7284243, -1.267961, 2.433966, 1, 1, 1, 1, 1,
0.7287798, 0.1167516, 1.748028, 1, 1, 1, 1, 1,
0.7290643, 0.24308, 0.1041808, 1, 1, 1, 1, 1,
0.7307266, -2.211802, 4.459435, 1, 1, 1, 1, 1,
0.7308124, 0.1499472, 0.5304962, 1, 1, 1, 1, 1,
0.7341254, -0.04955579, 0.7804108, 1, 1, 1, 1, 1,
0.7437619, 0.5195587, 2.088844, 1, 1, 1, 1, 1,
0.7504051, 1.236866, -0.4717025, 1, 1, 1, 1, 1,
0.7520948, 0.3189803, 1.325864, 1, 1, 1, 1, 1,
0.7566569, -0.1269485, 5.519208, 1, 1, 1, 1, 1,
0.7605388, -0.4836843, 0.09771541, 0, 0, 1, 1, 1,
0.7658271, -1.406513, 1.040582, 1, 0, 0, 1, 1,
0.7703589, -1.099894, 5.317204, 1, 0, 0, 1, 1,
0.7740738, 0.2528182, 0.05308417, 1, 0, 0, 1, 1,
0.7793494, 0.08868726, 1.680431, 1, 0, 0, 1, 1,
0.7832851, 0.1820989, 1.130378, 1, 0, 0, 1, 1,
0.7871301, 1.049539, 0.8473993, 0, 0, 0, 1, 1,
0.7905553, -0.3203753, 2.645276, 0, 0, 0, 1, 1,
0.8024079, 0.3799499, 1.506267, 0, 0, 0, 1, 1,
0.8073272, 1.070217, 0.8922585, 0, 0, 0, 1, 1,
0.8203108, -1.207181, 2.289619, 0, 0, 0, 1, 1,
0.824181, 0.0480995, 3.229978, 0, 0, 0, 1, 1,
0.8246338, 0.1449416, 1.753023, 0, 0, 0, 1, 1,
0.8301471, -0.08572738, 3.010041, 1, 1, 1, 1, 1,
0.8304427, 1.034912, -0.3801125, 1, 1, 1, 1, 1,
0.8310616, 0.2621441, 0.928305, 1, 1, 1, 1, 1,
0.8373439, 0.9375035, 2.615219, 1, 1, 1, 1, 1,
0.8414869, -0.9203549, 2.601381, 1, 1, 1, 1, 1,
0.8494732, 0.690388, 1.663777, 1, 1, 1, 1, 1,
0.8507041, 0.8960553, -0.01442255, 1, 1, 1, 1, 1,
0.8541117, 1.389539, 1.098841, 1, 1, 1, 1, 1,
0.8585517, -0.5531354, 1.872555, 1, 1, 1, 1, 1,
0.8610252, -0.9972943, 2.799194, 1, 1, 1, 1, 1,
0.8709518, 0.814137, 0.5130619, 1, 1, 1, 1, 1,
0.8737982, 0.579226, -0.0767004, 1, 1, 1, 1, 1,
0.8747841, 0.8158613, 0.9193819, 1, 1, 1, 1, 1,
0.8778064, 1.412919, 1.097345, 1, 1, 1, 1, 1,
0.8799263, -0.4516847, 2.069628, 1, 1, 1, 1, 1,
0.891484, 0.004048197, 1.236946, 0, 0, 1, 1, 1,
0.8939512, -0.03319479, 3.14442, 1, 0, 0, 1, 1,
0.8950389, 1.364222, 1.219444, 1, 0, 0, 1, 1,
0.8991385, -1.052913, 4.085258, 1, 0, 0, 1, 1,
0.9008082, -0.1352286, 1.541126, 1, 0, 0, 1, 1,
0.9017375, -0.3146101, 1.795847, 1, 0, 0, 1, 1,
0.9029009, 0.7561697, 1.359571, 0, 0, 0, 1, 1,
0.9053436, 0.4445945, 2.265583, 0, 0, 0, 1, 1,
0.9078212, 1.927721, 0.2921035, 0, 0, 0, 1, 1,
0.9180511, -0.1000101, 2.498143, 0, 0, 0, 1, 1,
0.921132, 0.3605208, 2.723467, 0, 0, 0, 1, 1,
0.9229499, -0.722832, 2.07606, 0, 0, 0, 1, 1,
0.9291847, -2.608194, 1.473254, 0, 0, 0, 1, 1,
0.9390877, 0.0930966, 2.249098, 1, 1, 1, 1, 1,
0.9440511, -0.6765717, 1.555617, 1, 1, 1, 1, 1,
0.9450568, -0.008549633, 1.527156, 1, 1, 1, 1, 1,
0.9464535, 0.3576424, 1.688204, 1, 1, 1, 1, 1,
0.9555784, -0.7786852, 2.937471, 1, 1, 1, 1, 1,
0.955704, -0.08228669, 0.6486676, 1, 1, 1, 1, 1,
0.9623531, -0.6607344, 3.123519, 1, 1, 1, 1, 1,
0.9649342, 1.071723, 0.9462331, 1, 1, 1, 1, 1,
0.9670165, -0.3267291, 1.035765, 1, 1, 1, 1, 1,
0.9678384, -0.24151, 1.508578, 1, 1, 1, 1, 1,
0.9706164, -0.3457009, 2.32643, 1, 1, 1, 1, 1,
0.9710788, -0.3376812, 1.991707, 1, 1, 1, 1, 1,
0.9772799, -2.15116, 3.167374, 1, 1, 1, 1, 1,
0.9918267, 0.03292497, 2.656872, 1, 1, 1, 1, 1,
0.9967703, -2.320342, 3.533695, 1, 1, 1, 1, 1,
0.9971782, 1.15362, -1.347635, 0, 0, 1, 1, 1,
0.9998992, 0.9113528, -0.428942, 1, 0, 0, 1, 1,
1.007284, -0.8647617, 0.4054109, 1, 0, 0, 1, 1,
1.007957, 0.350258, 0.6745646, 1, 0, 0, 1, 1,
1.011756, -0.04041611, 2.789052, 1, 0, 0, 1, 1,
1.01893, 0.760232, 0.4442022, 1, 0, 0, 1, 1,
1.019344, -0.03949817, 1.679953, 0, 0, 0, 1, 1,
1.021895, 0.05496944, 1.294324, 0, 0, 0, 1, 1,
1.027383, 0.1693917, 0.947275, 0, 0, 0, 1, 1,
1.029406, 0.4555362, 0.395794, 0, 0, 0, 1, 1,
1.035913, 0.3648913, 1.720825, 0, 0, 0, 1, 1,
1.045617, 0.8720189, 0.7892229, 0, 0, 0, 1, 1,
1.046224, 2.454933, 0.3448088, 0, 0, 0, 1, 1,
1.050018, -1.258482, 1.743942, 1, 1, 1, 1, 1,
1.052644, 0.7496011, 0.9353583, 1, 1, 1, 1, 1,
1.058593, -1.698427, 0.662122, 1, 1, 1, 1, 1,
1.064095, 0.197961, 1.515034, 1, 1, 1, 1, 1,
1.066577, 1.390725, 0.4474302, 1, 1, 1, 1, 1,
1.07671, -0.7803546, 2.155443, 1, 1, 1, 1, 1,
1.077209, -0.8308213, 0.6612822, 1, 1, 1, 1, 1,
1.079139, 1.793209, 0.6494067, 1, 1, 1, 1, 1,
1.081065, 0.7920538, 0.2322386, 1, 1, 1, 1, 1,
1.089663, -1.204123, 2.738857, 1, 1, 1, 1, 1,
1.092602, 0.6210316, 1.439784, 1, 1, 1, 1, 1,
1.108139, -0.1286415, 2.059337, 1, 1, 1, 1, 1,
1.108394, 0.9203503, 2.667836, 1, 1, 1, 1, 1,
1.118346, 1.024773, -1.346439, 1, 1, 1, 1, 1,
1.120335, -1.249652, 1.916357, 1, 1, 1, 1, 1,
1.121065, 1.192271, -1.196074, 0, 0, 1, 1, 1,
1.124418, -0.3988629, 1.333133, 1, 0, 0, 1, 1,
1.126656, 2.837403, -0.5950956, 1, 0, 0, 1, 1,
1.128405, -0.5211135, 2.493849, 1, 0, 0, 1, 1,
1.130336, 1.187923, 2.478525, 1, 0, 0, 1, 1,
1.130413, 0.9450829, -1.043175, 1, 0, 0, 1, 1,
1.136728, 1.209005, 1.35937, 0, 0, 0, 1, 1,
1.138105, -0.6326917, 1.110774, 0, 0, 0, 1, 1,
1.140231, -0.08549906, 1.470711, 0, 0, 0, 1, 1,
1.140294, -1.053838, 2.991473, 0, 0, 0, 1, 1,
1.140377, 1.247679, -1.21637, 0, 0, 0, 1, 1,
1.15395, -0.2894697, 1.459205, 0, 0, 0, 1, 1,
1.177156, 0.05036349, 2.042292, 0, 0, 0, 1, 1,
1.177787, 1.130058, 1.316649, 1, 1, 1, 1, 1,
1.184704, -0.4653324, 2.554337, 1, 1, 1, 1, 1,
1.185119, 0.592389, 1.420622, 1, 1, 1, 1, 1,
1.186287, 0.2429594, -0.3999953, 1, 1, 1, 1, 1,
1.199073, -0.2279973, 1.366926, 1, 1, 1, 1, 1,
1.210462, -1.051499, 2.315542, 1, 1, 1, 1, 1,
1.215552, -0.7915263, 1.713932, 1, 1, 1, 1, 1,
1.218458, 0.6656001, 0.4788138, 1, 1, 1, 1, 1,
1.231016, 0.8778922, 1.04738, 1, 1, 1, 1, 1,
1.272155, -0.4575038, 0.3168565, 1, 1, 1, 1, 1,
1.275737, -1.753392, 2.279581, 1, 1, 1, 1, 1,
1.29553, -0.8413531, 1.318156, 1, 1, 1, 1, 1,
1.300198, -0.3639795, 2.345706, 1, 1, 1, 1, 1,
1.30652, -1.730606, 0.640732, 1, 1, 1, 1, 1,
1.307395, 0.5291971, 2.341871, 1, 1, 1, 1, 1,
1.31085, -1.757771, 4.046491, 0, 0, 1, 1, 1,
1.312372, 0.1283333, 1.394563, 1, 0, 0, 1, 1,
1.322618, 0.42428, 1.221724, 1, 0, 0, 1, 1,
1.329342, -0.4846032, 0.8213273, 1, 0, 0, 1, 1,
1.330766, -0.4490846, 3.713392, 1, 0, 0, 1, 1,
1.331763, 0.6858155, 0.6931849, 1, 0, 0, 1, 1,
1.332482, 0.6774715, -0.6530327, 0, 0, 0, 1, 1,
1.332824, 0.1144091, 1.895043, 0, 0, 0, 1, 1,
1.337121, 0.400651, 1.561546, 0, 0, 0, 1, 1,
1.347837, 0.9654125, 1.66766, 0, 0, 0, 1, 1,
1.354958, -0.4686591, 2.754902, 0, 0, 0, 1, 1,
1.357407, 1.074603, 1.388241, 0, 0, 0, 1, 1,
1.366597, -1.811739, 2.727265, 0, 0, 0, 1, 1,
1.377508, -0.8940101, 3.035349, 1, 1, 1, 1, 1,
1.387633, 0.2394102, 1.789971, 1, 1, 1, 1, 1,
1.391797, -1.813931, 1.369078, 1, 1, 1, 1, 1,
1.402304, 0.9673833, -0.522292, 1, 1, 1, 1, 1,
1.414478, 0.526606, 2.481121, 1, 1, 1, 1, 1,
1.423649, -1.635637, 1.153283, 1, 1, 1, 1, 1,
1.431659, 0.1168255, 1.456534, 1, 1, 1, 1, 1,
1.437027, -1.478616, 1.902182, 1, 1, 1, 1, 1,
1.454906, 0.1423619, -1.520173, 1, 1, 1, 1, 1,
1.466594, 0.2265951, -0.5187455, 1, 1, 1, 1, 1,
1.476395, 0.3872413, 1.606348, 1, 1, 1, 1, 1,
1.484091, 0.4941176, 1.848534, 1, 1, 1, 1, 1,
1.496782, 0.9337703, -0.9011515, 1, 1, 1, 1, 1,
1.503742, -0.04397751, 2.102291, 1, 1, 1, 1, 1,
1.512914, 2.129999, 1.196159, 1, 1, 1, 1, 1,
1.514199, 1.735457, 2.420815, 0, 0, 1, 1, 1,
1.514336, -0.2068148, 0.35357, 1, 0, 0, 1, 1,
1.517469, -0.1197083, 1.659986, 1, 0, 0, 1, 1,
1.519405, -0.6204743, 0.1472507, 1, 0, 0, 1, 1,
1.526549, 1.582714, 1.35628, 1, 0, 0, 1, 1,
1.527432, 1.042208, 2.197765, 1, 0, 0, 1, 1,
1.53064, 0.3000079, 3.069473, 0, 0, 0, 1, 1,
1.54392, -1.110562, 0.8907581, 0, 0, 0, 1, 1,
1.547101, 0.08577288, 3.353962, 0, 0, 0, 1, 1,
1.569056, -0.4251721, 0.131018, 0, 0, 0, 1, 1,
1.569718, 1.184278, -0.3248762, 0, 0, 0, 1, 1,
1.57593, -1.192604, 1.532894, 0, 0, 0, 1, 1,
1.577414, 0.4876377, 1.001579, 0, 0, 0, 1, 1,
1.580611, -2.104318, 2.205494, 1, 1, 1, 1, 1,
1.586107, 0.3918037, 0.7460254, 1, 1, 1, 1, 1,
1.588362, -0.6217534, 3.210219, 1, 1, 1, 1, 1,
1.588441, -0.858972, 3.004204, 1, 1, 1, 1, 1,
1.5937, -1.143104, 2.166291, 1, 1, 1, 1, 1,
1.597997, 0.5062714, 0.6232496, 1, 1, 1, 1, 1,
1.618597, 0.3108107, 0.5176786, 1, 1, 1, 1, 1,
1.631746, 0.3265745, 1.407173, 1, 1, 1, 1, 1,
1.63203, 0.7922413, 1.535619, 1, 1, 1, 1, 1,
1.634207, 0.4178645, 0.9267727, 1, 1, 1, 1, 1,
1.651791, -0.7364009, 2.172222, 1, 1, 1, 1, 1,
1.656683, 0.5191157, 1.564664, 1, 1, 1, 1, 1,
1.66418, -0.6791215, 0.3890054, 1, 1, 1, 1, 1,
1.676654, -0.01693334, 1.89137, 1, 1, 1, 1, 1,
1.70856, -0.1098995, 3.237715, 1, 1, 1, 1, 1,
1.721762, -1.042299, 0.5086996, 0, 0, 1, 1, 1,
1.759347, 1.414079, 0.1375, 1, 0, 0, 1, 1,
1.766326, 1.909747, 1.800692, 1, 0, 0, 1, 1,
1.768376, 0.6600876, 2.875194, 1, 0, 0, 1, 1,
1.770212, -0.9781799, 1.229512, 1, 0, 0, 1, 1,
1.786699, 0.4740342, 2.829336, 1, 0, 0, 1, 1,
1.797404, -1.19094, 1.323543, 0, 0, 0, 1, 1,
1.799791, 0.4609358, 1.64606, 0, 0, 0, 1, 1,
1.823434, -0.7379013, 1.926701, 0, 0, 0, 1, 1,
1.825117, -1.131897, 2.445276, 0, 0, 0, 1, 1,
1.833458, 0.1494648, 0.2897425, 0, 0, 0, 1, 1,
1.844286, -0.9886594, 3.151427, 0, 0, 0, 1, 1,
1.847304, -0.1925547, 0.6542327, 0, 0, 0, 1, 1,
1.880278, -0.7234921, 2.123614, 1, 1, 1, 1, 1,
1.885681, 0.3514334, -0.2111518, 1, 1, 1, 1, 1,
1.888589, -1.324744, 3.091839, 1, 1, 1, 1, 1,
1.899456, -1.364465, 0.6647604, 1, 1, 1, 1, 1,
1.89993, -1.284615, 2.159326, 1, 1, 1, 1, 1,
1.915976, -0.5585867, 3.312596, 1, 1, 1, 1, 1,
1.93671, -0.08134969, 2.544587, 1, 1, 1, 1, 1,
2.000071, -1.983368, 2.5614, 1, 1, 1, 1, 1,
2.011852, -0.9573956, 1.45814, 1, 1, 1, 1, 1,
2.021303, 0.5846573, 1.472124, 1, 1, 1, 1, 1,
2.024106, -0.7346003, 0.6837091, 1, 1, 1, 1, 1,
2.055091, 1.477734, 1.747305, 1, 1, 1, 1, 1,
2.06031, 0.8186086, 0.152708, 1, 1, 1, 1, 1,
2.061642, -0.5527851, 1.663336, 1, 1, 1, 1, 1,
2.073107, 1.009477, 2.021089, 1, 1, 1, 1, 1,
2.073507, 0.3177328, 3.557056, 0, 0, 1, 1, 1,
2.104215, -0.3457653, 2.722232, 1, 0, 0, 1, 1,
2.119588, 0.02333853, 1.469177, 1, 0, 0, 1, 1,
2.13672, 0.6422011, 2.643508, 1, 0, 0, 1, 1,
2.188566, 1.213468, 2.030948, 1, 0, 0, 1, 1,
2.248993, -0.9092936, 1.061377, 1, 0, 0, 1, 1,
2.30058, 0.02486696, 1.471638, 0, 0, 0, 1, 1,
2.366158, 0.7008596, 0.3844657, 0, 0, 0, 1, 1,
2.390985, -0.3834564, 0.6174068, 0, 0, 0, 1, 1,
2.420564, -0.9627635, 2.063915, 0, 0, 0, 1, 1,
2.486737, 1.627591, 0.8976202, 0, 0, 0, 1, 1,
2.533903, -0.04770708, 1.987188, 0, 0, 0, 1, 1,
2.5772, -1.266303, 1.593562, 0, 0, 0, 1, 1,
2.611974, -1.021222, 1.695643, 1, 1, 1, 1, 1,
2.716241, -0.2823265, 1.516995, 1, 1, 1, 1, 1,
2.743727, 1.951614, 1.080228, 1, 1, 1, 1, 1,
2.86356, 0.05656554, -0.1048914, 1, 1, 1, 1, 1,
2.908166, 1.192212, 1.762105, 1, 1, 1, 1, 1,
3.03534, -0.6547183, 2.735122, 1, 1, 1, 1, 1,
3.038269, -1.754116, 1.037203, 1, 1, 1, 1, 1
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
var radius = 9.901989;
var distance = 34.78032;
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
mvMatrix.translate( 0.03674912, -0.02844667, 0.4187479 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.78032);
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
