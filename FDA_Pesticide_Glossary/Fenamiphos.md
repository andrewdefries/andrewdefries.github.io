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
-3.260452, 0.4757209, -0.337051, 1, 0, 0, 1,
-2.678942, 2.706475, -1.3159, 1, 0.007843138, 0, 1,
-2.460292, 1.07479, -1.117508, 1, 0.01176471, 0, 1,
-2.45377, -0.5376286, -2.856978, 1, 0.01960784, 0, 1,
-2.357146, -2.388618, -2.403986, 1, 0.02352941, 0, 1,
-2.341548, -1.321011, -2.799712, 1, 0.03137255, 0, 1,
-2.333304, 1.512219, -0.5009291, 1, 0.03529412, 0, 1,
-2.289558, 0.553094, -1.207311, 1, 0.04313726, 0, 1,
-2.225733, -1.433218, -2.941136, 1, 0.04705882, 0, 1,
-2.218529, 0.3982985, -2.522796, 1, 0.05490196, 0, 1,
-2.191978, -0.7049397, -1.794466, 1, 0.05882353, 0, 1,
-2.149415, -0.1174665, -1.120395, 1, 0.06666667, 0, 1,
-2.138921, -0.374974, -0.9532506, 1, 0.07058824, 0, 1,
-2.12417, 0.2027539, -1.526459, 1, 0.07843138, 0, 1,
-2.085422, -1.489775, -2.305027, 1, 0.08235294, 0, 1,
-2.083864, -0.237954, -2.120839, 1, 0.09019608, 0, 1,
-2.050005, 1.797121, -1.165615, 1, 0.09411765, 0, 1,
-2.022205, 1.691745, 0.1831283, 1, 0.1019608, 0, 1,
-2.003821, -0.3434317, -2.076622, 1, 0.1098039, 0, 1,
-1.980151, -0.2362385, -0.206867, 1, 0.1137255, 0, 1,
-1.971298, 2.565998, -0.6616631, 1, 0.1215686, 0, 1,
-1.966709, 0.04903238, -0.7932231, 1, 0.1254902, 0, 1,
-1.938305, -0.01264385, -2.213748, 1, 0.1333333, 0, 1,
-1.927433, 1.332138, -1.315018, 1, 0.1372549, 0, 1,
-1.921708, -1.594084, -1.55421, 1, 0.145098, 0, 1,
-1.920285, -0.1484409, -2.774345, 1, 0.1490196, 0, 1,
-1.91915, 2.442263, -0.8194725, 1, 0.1568628, 0, 1,
-1.869289, -1.856258, -3.500396, 1, 0.1607843, 0, 1,
-1.867111, -1.70756, -0.8672953, 1, 0.1686275, 0, 1,
-1.864223, 1.054922, -2.098786, 1, 0.172549, 0, 1,
-1.845271, 0.5245372, -0.6399695, 1, 0.1803922, 0, 1,
-1.83104, 0.7399443, -2.94773, 1, 0.1843137, 0, 1,
-1.830407, 0.0625748, 0.0496436, 1, 0.1921569, 0, 1,
-1.76704, -0.9589198, -2.040954, 1, 0.1960784, 0, 1,
-1.747343, -1.068586, -4.801426, 1, 0.2039216, 0, 1,
-1.74293, -0.4078277, 0.4953766, 1, 0.2117647, 0, 1,
-1.741548, 0.7436924, -1.928004, 1, 0.2156863, 0, 1,
-1.730953, -1.25719, -2.600135, 1, 0.2235294, 0, 1,
-1.720006, -0.904124, -2.746146, 1, 0.227451, 0, 1,
-1.690745, -1.544233, -2.823926, 1, 0.2352941, 0, 1,
-1.670696, -0.1975089, -2.774913, 1, 0.2392157, 0, 1,
-1.667009, 0.8285676, -2.760681, 1, 0.2470588, 0, 1,
-1.631785, 0.6348848, -1.434713, 1, 0.2509804, 0, 1,
-1.629651, 0.7664336, 1.029039, 1, 0.2588235, 0, 1,
-1.624826, -1.391684, -2.514185, 1, 0.2627451, 0, 1,
-1.601662, 1.135474, -2.039877, 1, 0.2705882, 0, 1,
-1.597841, -1.264529, -1.544442, 1, 0.2745098, 0, 1,
-1.589172, -1.107751, -3.179343, 1, 0.282353, 0, 1,
-1.575514, -0.7137694, -1.727352, 1, 0.2862745, 0, 1,
-1.568014, 0.06713457, -1.326029, 1, 0.2941177, 0, 1,
-1.562313, -1.232793, -4.218007, 1, 0.3019608, 0, 1,
-1.560674, -0.7557696, -1.444829, 1, 0.3058824, 0, 1,
-1.550639, -0.7692667, -2.27614, 1, 0.3137255, 0, 1,
-1.546379, -2.178855, -3.306468, 1, 0.3176471, 0, 1,
-1.540437, -0.052217, -2.444228, 1, 0.3254902, 0, 1,
-1.527659, 2.129614, -1.70006, 1, 0.3294118, 0, 1,
-1.509502, 0.1424234, -3.097208, 1, 0.3372549, 0, 1,
-1.496398, 1.186173, -0.1343777, 1, 0.3411765, 0, 1,
-1.493286, -1.094198, -3.200247, 1, 0.3490196, 0, 1,
-1.471237, 0.66665, -2.335644, 1, 0.3529412, 0, 1,
-1.470715, 0.193003, -0.2623591, 1, 0.3607843, 0, 1,
-1.469718, 0.3196798, -2.968954, 1, 0.3647059, 0, 1,
-1.466915, -1.184207, -2.686868, 1, 0.372549, 0, 1,
-1.460121, 0.3292724, -0.4229575, 1, 0.3764706, 0, 1,
-1.458635, 0.414922, -1.52031, 1, 0.3843137, 0, 1,
-1.458426, -1.038878, -2.66887, 1, 0.3882353, 0, 1,
-1.444188, 0.5135537, -0.4408373, 1, 0.3960784, 0, 1,
-1.442185, 1.956147, 1.686696, 1, 0.4039216, 0, 1,
-1.439741, -0.6810098, -2.220276, 1, 0.4078431, 0, 1,
-1.42222, 0.9154314, -1.320059, 1, 0.4156863, 0, 1,
-1.41073, -0.3634391, -4.793684, 1, 0.4196078, 0, 1,
-1.389635, 0.4225705, -2.766746, 1, 0.427451, 0, 1,
-1.383577, -0.100887, -2.76877, 1, 0.4313726, 0, 1,
-1.383369, 0.08082653, -0.911995, 1, 0.4392157, 0, 1,
-1.380732, -1.223386, -1.674682, 1, 0.4431373, 0, 1,
-1.377092, -1.578915, -1.508388, 1, 0.4509804, 0, 1,
-1.37574, -1.139672, -2.915697, 1, 0.454902, 0, 1,
-1.369143, -0.606306, -1.253969, 1, 0.4627451, 0, 1,
-1.36061, -1.304729, -0.04211842, 1, 0.4666667, 0, 1,
-1.354808, -0.0926973, -0.8895602, 1, 0.4745098, 0, 1,
-1.350073, -2.189509, -3.442902, 1, 0.4784314, 0, 1,
-1.347812, -0.2620315, -2.672605, 1, 0.4862745, 0, 1,
-1.344299, 0.1257552, -3.357023, 1, 0.4901961, 0, 1,
-1.344095, -0.9070958, -1.622797, 1, 0.4980392, 0, 1,
-1.342546, -1.182888, -2.615789, 1, 0.5058824, 0, 1,
-1.334477, 0.416578, -1.272183, 1, 0.509804, 0, 1,
-1.327858, 1.398877, -0.3670554, 1, 0.5176471, 0, 1,
-1.318627, 0.4479785, 0.3076512, 1, 0.5215687, 0, 1,
-1.315045, -0.4624803, -2.581911, 1, 0.5294118, 0, 1,
-1.307348, 0.2435111, -1.401142, 1, 0.5333334, 0, 1,
-1.307342, 0.2238176, -2.647378, 1, 0.5411765, 0, 1,
-1.303842, 0.1561197, -2.421356, 1, 0.5450981, 0, 1,
-1.297688, -0.6020721, -1.617686, 1, 0.5529412, 0, 1,
-1.295797, -1.262413, 0.5354503, 1, 0.5568628, 0, 1,
-1.281969, 2.454395, 0.06603123, 1, 0.5647059, 0, 1,
-1.277656, 0.1099294, 0.3923654, 1, 0.5686275, 0, 1,
-1.275674, 0.1922742, -2.270369, 1, 0.5764706, 0, 1,
-1.275074, -0.05849122, -1.254056, 1, 0.5803922, 0, 1,
-1.269963, 0.555778, -2.453101, 1, 0.5882353, 0, 1,
-1.26577, -2.138507, -2.386864, 1, 0.5921569, 0, 1,
-1.260974, 0.4884447, -1.191571, 1, 0.6, 0, 1,
-1.260375, 1.855043, 0.3651973, 1, 0.6078432, 0, 1,
-1.259902, 0.7172296, -1.895005, 1, 0.6117647, 0, 1,
-1.259458, -1.516296, -0.8440151, 1, 0.6196079, 0, 1,
-1.253215, 0.9210277, -0.5378043, 1, 0.6235294, 0, 1,
-1.243538, -1.132503, -2.773606, 1, 0.6313726, 0, 1,
-1.242176, -1.132676, -2.379643, 1, 0.6352941, 0, 1,
-1.238117, 0.02253804, 0.1178615, 1, 0.6431373, 0, 1,
-1.235468, -1.509152, -3.505543, 1, 0.6470588, 0, 1,
-1.234866, -0.2992831, -1.66063, 1, 0.654902, 0, 1,
-1.232145, -1.017362, -3.574231, 1, 0.6588235, 0, 1,
-1.229256, -1.195674, -1.637181, 1, 0.6666667, 0, 1,
-1.22165, -0.8654994, -1.877487, 1, 0.6705883, 0, 1,
-1.218296, -0.645303, -0.9303682, 1, 0.6784314, 0, 1,
-1.217323, 1.32737, 0.5926118, 1, 0.682353, 0, 1,
-1.214985, -1.174776, -2.29348, 1, 0.6901961, 0, 1,
-1.209126, 0.689791, -1.009317, 1, 0.6941177, 0, 1,
-1.198003, -0.2528797, -1.560871, 1, 0.7019608, 0, 1,
-1.196213, -1.83917, -2.065677, 1, 0.7098039, 0, 1,
-1.194941, -0.36375, -1.876143, 1, 0.7137255, 0, 1,
-1.186654, 0.1858129, -2.941772, 1, 0.7215686, 0, 1,
-1.165174, -0.3353142, -2.215415, 1, 0.7254902, 0, 1,
-1.156572, -0.5860398, -2.261708, 1, 0.7333333, 0, 1,
-1.155457, 0.7057362, -1.511443, 1, 0.7372549, 0, 1,
-1.146544, 1.186697, 0.6758455, 1, 0.7450981, 0, 1,
-1.141302, -0.7818805, -2.026447, 1, 0.7490196, 0, 1,
-1.131543, 2.159048, -0.04006432, 1, 0.7568628, 0, 1,
-1.121056, -1.257472, -3.053112, 1, 0.7607843, 0, 1,
-1.120692, -0.5803492, -1.493947, 1, 0.7686275, 0, 1,
-1.118454, 0.8295447, -1.898118, 1, 0.772549, 0, 1,
-1.117857, 0.6605586, -0.8315231, 1, 0.7803922, 0, 1,
-1.111645, -2.053645, -1.913153, 1, 0.7843137, 0, 1,
-1.11, -0.9817853, -3.045296, 1, 0.7921569, 0, 1,
-1.108276, 1.421075, -1.600174, 1, 0.7960784, 0, 1,
-1.105425, 0.9606459, -0.2914611, 1, 0.8039216, 0, 1,
-1.103026, -0.8499578, -0.6854787, 1, 0.8117647, 0, 1,
-1.100072, -1.627276, -2.073687, 1, 0.8156863, 0, 1,
-1.089626, 1.824306, -0.739034, 1, 0.8235294, 0, 1,
-1.068941, -0.7060474, -2.195166, 1, 0.827451, 0, 1,
-1.068215, -0.2258376, -1.942517, 1, 0.8352941, 0, 1,
-1.06646, -0.3495233, -2.686343, 1, 0.8392157, 0, 1,
-1.063774, -0.5363038, -1.367059, 1, 0.8470588, 0, 1,
-1.058663, -0.4549289, -2.504843, 1, 0.8509804, 0, 1,
-1.058308, -0.5442541, -2.474425, 1, 0.8588235, 0, 1,
-1.050796, 0.05691101, -2.043234, 1, 0.8627451, 0, 1,
-1.047622, 0.6294338, -0.8003653, 1, 0.8705882, 0, 1,
-1.041672, 0.226914, -1.687022, 1, 0.8745098, 0, 1,
-1.03926, -0.1268577, -2.222339, 1, 0.8823529, 0, 1,
-1.038341, -0.2968, -2.038267, 1, 0.8862745, 0, 1,
-1.034524, -1.249105, -1.877609, 1, 0.8941177, 0, 1,
-1.033438, -0.8264509, -2.80658, 1, 0.8980392, 0, 1,
-1.025961, 0.4892176, -1.650682, 1, 0.9058824, 0, 1,
-1.013258, -0.3262027, -1.717282, 1, 0.9137255, 0, 1,
-1.012241, 0.6950352, -1.498503, 1, 0.9176471, 0, 1,
-1.009945, 0.4139473, -1.40996, 1, 0.9254902, 0, 1,
-1.007882, 0.08837873, -1.728964, 1, 0.9294118, 0, 1,
-1.00484, 0.9037399, -1.191469, 1, 0.9372549, 0, 1,
-0.9960507, -0.8319146, -3.539366, 1, 0.9411765, 0, 1,
-0.9947606, 0.9539878, 0.5595374, 1, 0.9490196, 0, 1,
-0.9934077, 0.9565349, -1.240679, 1, 0.9529412, 0, 1,
-0.9901477, -0.3572393, -2.431476, 1, 0.9607843, 0, 1,
-0.9894378, -0.9948713, -2.640559, 1, 0.9647059, 0, 1,
-0.9778578, -1.147639, -4.22085, 1, 0.972549, 0, 1,
-0.9777896, -0.133709, -0.5893211, 1, 0.9764706, 0, 1,
-0.9769163, -1.54098, -2.346607, 1, 0.9843137, 0, 1,
-0.9716789, 0.5617896, -0.6251246, 1, 0.9882353, 0, 1,
-0.9679765, -1.244544, -2.640185, 1, 0.9960784, 0, 1,
-0.9678692, -0.3340627, -2.371554, 0.9960784, 1, 0, 1,
-0.9589126, -1.006029, -3.121135, 0.9921569, 1, 0, 1,
-0.9447312, -1.270877, -2.923043, 0.9843137, 1, 0, 1,
-0.9379726, -0.5925487, -2.417731, 0.9803922, 1, 0, 1,
-0.9379355, -0.2935493, -1.501882, 0.972549, 1, 0, 1,
-0.9239689, -0.9753988, -3.138882, 0.9686275, 1, 0, 1,
-0.9234613, -1.320369, -2.079947, 0.9607843, 1, 0, 1,
-0.9210325, 0.5609584, -2.068904, 0.9568627, 1, 0, 1,
-0.9176472, 0.6953996, 1.376259, 0.9490196, 1, 0, 1,
-0.9153727, -0.9187418, -2.165118, 0.945098, 1, 0, 1,
-0.9113205, 1.353711, -2.049016, 0.9372549, 1, 0, 1,
-0.9056777, -1.033299, -1.900739, 0.9333333, 1, 0, 1,
-0.9015319, -0.4345345, -2.006612, 0.9254902, 1, 0, 1,
-0.8967964, -0.1791423, -1.715902, 0.9215686, 1, 0, 1,
-0.8960976, -1.333796, -2.824356, 0.9137255, 1, 0, 1,
-0.8951564, 1.152848, 0.0864862, 0.9098039, 1, 0, 1,
-0.8926562, -0.9766981, -1.526737, 0.9019608, 1, 0, 1,
-0.8876048, 0.1403991, -1.323671, 0.8941177, 1, 0, 1,
-0.8859583, 1.902918, -0.865423, 0.8901961, 1, 0, 1,
-0.8758977, 0.09942552, -0.4534958, 0.8823529, 1, 0, 1,
-0.8744019, 1.273166, -0.8995901, 0.8784314, 1, 0, 1,
-0.8708686, 0.8792955, -0.3324011, 0.8705882, 1, 0, 1,
-0.8604019, 0.8111016, -0.5838222, 0.8666667, 1, 0, 1,
-0.85583, 0.0282413, -2.077139, 0.8588235, 1, 0, 1,
-0.8544272, 0.7535698, -2.851845, 0.854902, 1, 0, 1,
-0.8531992, 0.8650998, 0.9501814, 0.8470588, 1, 0, 1,
-0.8530219, -0.446161, -2.526551, 0.8431373, 1, 0, 1,
-0.8521733, 0.2295718, 0.7521629, 0.8352941, 1, 0, 1,
-0.851999, 1.020362, -0.4258834, 0.8313726, 1, 0, 1,
-0.8485717, 1.655722, -0.2695719, 0.8235294, 1, 0, 1,
-0.8459544, 0.7797346, -1.638262, 0.8196079, 1, 0, 1,
-0.8436843, 0.9196578, -0.2464915, 0.8117647, 1, 0, 1,
-0.8385585, 1.435078, -1.209887, 0.8078431, 1, 0, 1,
-0.8330288, -0.9297329, -2.80423, 0.8, 1, 0, 1,
-0.813266, 1.348981, -0.5979272, 0.7921569, 1, 0, 1,
-0.8079374, 0.491767, -1.232964, 0.7882353, 1, 0, 1,
-0.8054774, -1.201325, -1.895144, 0.7803922, 1, 0, 1,
-0.7983716, 0.3554683, -2.31848, 0.7764706, 1, 0, 1,
-0.7887374, -1.203344, -3.716585, 0.7686275, 1, 0, 1,
-0.7864699, 1.851837, -1.554463, 0.7647059, 1, 0, 1,
-0.7818589, -0.505539, -3.039011, 0.7568628, 1, 0, 1,
-0.7784215, -0.09078362, -3.354581, 0.7529412, 1, 0, 1,
-0.7758868, 0.5812818, -1.373266, 0.7450981, 1, 0, 1,
-0.7756053, 1.26194, -1.873457, 0.7411765, 1, 0, 1,
-0.7709324, 0.04239738, -0.9324356, 0.7333333, 1, 0, 1,
-0.7695895, -0.3125268, -0.9494963, 0.7294118, 1, 0, 1,
-0.767345, -1.001047, -3.04621, 0.7215686, 1, 0, 1,
-0.7655913, 0.890916, -1.047098, 0.7176471, 1, 0, 1,
-0.7650313, -0.8144619, -3.13915, 0.7098039, 1, 0, 1,
-0.7612189, 1.287281, 0.008736939, 0.7058824, 1, 0, 1,
-0.7514215, -1.167898, -2.871473, 0.6980392, 1, 0, 1,
-0.7495678, 1.634795, 0.5222515, 0.6901961, 1, 0, 1,
-0.7443823, -1.513842, -1.03728, 0.6862745, 1, 0, 1,
-0.7420852, -1.408021, -3.201078, 0.6784314, 1, 0, 1,
-0.7413348, 1.475611, -0.703705, 0.6745098, 1, 0, 1,
-0.7396677, 0.2128351, -1.326994, 0.6666667, 1, 0, 1,
-0.7353258, 0.6127476, -1.363898, 0.6627451, 1, 0, 1,
-0.7342776, -1.919852, -3.317204, 0.654902, 1, 0, 1,
-0.7242731, 0.7329003, -0.2102685, 0.6509804, 1, 0, 1,
-0.7228253, 1.702145, -1.873668, 0.6431373, 1, 0, 1,
-0.7209848, -0.8277052, -2.479842, 0.6392157, 1, 0, 1,
-0.7172725, 1.093299, -0.4077307, 0.6313726, 1, 0, 1,
-0.6799414, -0.984373, -2.877069, 0.627451, 1, 0, 1,
-0.676266, -3.256703, -5.591902, 0.6196079, 1, 0, 1,
-0.6733757, -1.796318, -3.202423, 0.6156863, 1, 0, 1,
-0.6687826, 1.353101, -0.7117339, 0.6078432, 1, 0, 1,
-0.6664094, 0.4056375, -2.745072, 0.6039216, 1, 0, 1,
-0.6566072, -1.548857, -2.280894, 0.5960785, 1, 0, 1,
-0.6562899, -0.7297774, -2.368129, 0.5882353, 1, 0, 1,
-0.654353, -1.007513, -5.243963, 0.5843138, 1, 0, 1,
-0.6543049, 0.4567991, -1.18013, 0.5764706, 1, 0, 1,
-0.6531835, -0.3666167, -2.218004, 0.572549, 1, 0, 1,
-0.6489253, 2.020123, 0.06996533, 0.5647059, 1, 0, 1,
-0.6460856, 0.03768269, -1.326927, 0.5607843, 1, 0, 1,
-0.6448205, 1.232632, 0.9570208, 0.5529412, 1, 0, 1,
-0.644647, -0.9199063, -1.582762, 0.5490196, 1, 0, 1,
-0.6439982, 0.7593592, -0.02122999, 0.5411765, 1, 0, 1,
-0.6365935, 0.498665, -0.8592767, 0.5372549, 1, 0, 1,
-0.6335841, 1.282617, -2.508733, 0.5294118, 1, 0, 1,
-0.6314791, -0.7672971, -1.435773, 0.5254902, 1, 0, 1,
-0.6296929, -1.105855, -1.27156, 0.5176471, 1, 0, 1,
-0.6221405, 1.142853, -1.768318, 0.5137255, 1, 0, 1,
-0.6217273, -0.6371758, -3.884425, 0.5058824, 1, 0, 1,
-0.6188219, 0.7891281, 0.3822351, 0.5019608, 1, 0, 1,
-0.6154613, 0.9365818, -0.2028973, 0.4941176, 1, 0, 1,
-0.6130351, -1.014112, -2.805594, 0.4862745, 1, 0, 1,
-0.6120308, -1.409582, -3.085483, 0.4823529, 1, 0, 1,
-0.6118327, -0.6142468, -1.942319, 0.4745098, 1, 0, 1,
-0.6108832, 0.6952873, -2.191808, 0.4705882, 1, 0, 1,
-0.6084142, -1.09095, -1.212201, 0.4627451, 1, 0, 1,
-0.6044564, 0.8576339, -1.12227, 0.4588235, 1, 0, 1,
-0.6019526, -0.2112129, -2.450241, 0.4509804, 1, 0, 1,
-0.5988314, -0.869675, -2.210423, 0.4470588, 1, 0, 1,
-0.5976506, -0.4609081, -3.083236, 0.4392157, 1, 0, 1,
-0.596023, -0.8026735, -3.212669, 0.4352941, 1, 0, 1,
-0.5956177, -0.9640335, -2.742607, 0.427451, 1, 0, 1,
-0.5932813, -1.596171, -2.553637, 0.4235294, 1, 0, 1,
-0.5921843, -0.6938142, -4.42081, 0.4156863, 1, 0, 1,
-0.5909188, -1.270645, -3.130849, 0.4117647, 1, 0, 1,
-0.587476, -0.2201406, -2.491822, 0.4039216, 1, 0, 1,
-0.586815, 0.4091459, 0.4957087, 0.3960784, 1, 0, 1,
-0.5836386, 0.7232903, 0.2622536, 0.3921569, 1, 0, 1,
-0.5827406, -1.583371, -3.306804, 0.3843137, 1, 0, 1,
-0.5827307, -0.7545673, -3.156225, 0.3803922, 1, 0, 1,
-0.5794472, 0.1892403, -2.851244, 0.372549, 1, 0, 1,
-0.5759273, 0.04553623, -2.66801, 0.3686275, 1, 0, 1,
-0.5731338, 1.046974, -1.478002, 0.3607843, 1, 0, 1,
-0.5694366, 0.3682342, 0.893145, 0.3568628, 1, 0, 1,
-0.5679554, -0.3918014, -3.844888, 0.3490196, 1, 0, 1,
-0.5646472, 0.3188584, -1.182852, 0.345098, 1, 0, 1,
-0.5634145, 0.1025553, -0.9283648, 0.3372549, 1, 0, 1,
-0.5592759, 0.1114125, -0.6696038, 0.3333333, 1, 0, 1,
-0.5589107, 0.5763163, -1.799874, 0.3254902, 1, 0, 1,
-0.5571284, -0.3259599, -1.966102, 0.3215686, 1, 0, 1,
-0.5531027, -1.874509, -2.987959, 0.3137255, 1, 0, 1,
-0.5475752, -0.2332405, -2.143169, 0.3098039, 1, 0, 1,
-0.5467679, 1.478814, -1.183629, 0.3019608, 1, 0, 1,
-0.5447303, -1.269397, -2.204096, 0.2941177, 1, 0, 1,
-0.536467, 0.9663715, -0.2482051, 0.2901961, 1, 0, 1,
-0.5317721, -0.10447, -4.253524, 0.282353, 1, 0, 1,
-0.5302508, -0.7262838, -1.386774, 0.2784314, 1, 0, 1,
-0.5294263, 1.62354, -0.4240816, 0.2705882, 1, 0, 1,
-0.5232767, -0.09957825, 0.06475312, 0.2666667, 1, 0, 1,
-0.5188111, 0.5522066, 0.2466149, 0.2588235, 1, 0, 1,
-0.5179965, -0.00121938, -3.075109, 0.254902, 1, 0, 1,
-0.5139869, -1.261901, -2.764345, 0.2470588, 1, 0, 1,
-0.5117214, -0.4894007, -1.615684, 0.2431373, 1, 0, 1,
-0.5108598, -0.9592661, -2.932108, 0.2352941, 1, 0, 1,
-0.5050031, -1.479133, -2.450856, 0.2313726, 1, 0, 1,
-0.5041402, 0.7975973, -0.3849153, 0.2235294, 1, 0, 1,
-0.5030524, -0.3909643, -3.180555, 0.2196078, 1, 0, 1,
-0.5008739, 0.6852953, 0.4966156, 0.2117647, 1, 0, 1,
-0.4987649, 0.679989, -3.055569, 0.2078431, 1, 0, 1,
-0.4987567, -1.101696, -2.754021, 0.2, 1, 0, 1,
-0.4941026, 0.888148, -1.114196, 0.1921569, 1, 0, 1,
-0.4924846, 0.4469198, -1.107118, 0.1882353, 1, 0, 1,
-0.4911273, 0.2353198, -1.150751, 0.1803922, 1, 0, 1,
-0.4853173, 1.402539, -1.959261, 0.1764706, 1, 0, 1,
-0.4811836, -0.6644403, -3.110622, 0.1686275, 1, 0, 1,
-0.4798151, -0.7423719, -2.434435, 0.1647059, 1, 0, 1,
-0.4790322, -1.212645, -2.831342, 0.1568628, 1, 0, 1,
-0.4741645, -1.227616, -2.947861, 0.1529412, 1, 0, 1,
-0.4716016, -0.03763344, -2.767384, 0.145098, 1, 0, 1,
-0.4690252, 0.2950273, -0.968605, 0.1411765, 1, 0, 1,
-0.4684777, -1.443802, -3.413936, 0.1333333, 1, 0, 1,
-0.4678936, -2.080099, -1.056175, 0.1294118, 1, 0, 1,
-0.4523429, -0.5149838, -3.742343, 0.1215686, 1, 0, 1,
-0.4514737, 1.253919, 0.4851037, 0.1176471, 1, 0, 1,
-0.4482954, 0.7072716, -1.127535, 0.1098039, 1, 0, 1,
-0.4475117, 0.2225714, -1.913908, 0.1058824, 1, 0, 1,
-0.4470472, -0.7282255, -2.332656, 0.09803922, 1, 0, 1,
-0.4452795, -0.78984, -0.3788036, 0.09019608, 1, 0, 1,
-0.4422419, -0.2013321, -1.781314, 0.08627451, 1, 0, 1,
-0.4399355, 0.6131926, -1.633036, 0.07843138, 1, 0, 1,
-0.4373427, 0.07896818, -2.156473, 0.07450981, 1, 0, 1,
-0.4351664, -0.2512408, -3.561737, 0.06666667, 1, 0, 1,
-0.4346863, 0.9909307, -0.6734897, 0.0627451, 1, 0, 1,
-0.4343691, -1.032168, -2.290407, 0.05490196, 1, 0, 1,
-0.4330579, 0.6774194, -1.731876, 0.05098039, 1, 0, 1,
-0.4298159, 1.12196, -0.753131, 0.04313726, 1, 0, 1,
-0.4288346, -0.3704652, -0.3616538, 0.03921569, 1, 0, 1,
-0.4287098, 1.077939, -0.8885621, 0.03137255, 1, 0, 1,
-0.4266112, -0.8542284, -2.899134, 0.02745098, 1, 0, 1,
-0.4242032, -0.4319264, -2.841377, 0.01960784, 1, 0, 1,
-0.4218121, 1.613267, -2.705034, 0.01568628, 1, 0, 1,
-0.4213915, -1.234869, -4.358644, 0.007843138, 1, 0, 1,
-0.4203486, 0.04860855, -1.152903, 0.003921569, 1, 0, 1,
-0.4194154, 0.647786, 0.7245947, 0, 1, 0.003921569, 1,
-0.4162258, 0.07827692, -1.663468, 0, 1, 0.01176471, 1,
-0.4124595, -0.8201867, -2.377171, 0, 1, 0.01568628, 1,
-0.4120953, 0.6840869, 0.5491613, 0, 1, 0.02352941, 1,
-0.4076132, -0.2039169, -1.626315, 0, 1, 0.02745098, 1,
-0.4066285, -0.04728646, -1.79374, 0, 1, 0.03529412, 1,
-0.4046586, 0.1461516, -2.56197, 0, 1, 0.03921569, 1,
-0.4034544, 0.7864342, -1.386409, 0, 1, 0.04705882, 1,
-0.4006929, 0.00889384, -2.422649, 0, 1, 0.05098039, 1,
-0.3986063, -1.287329, -2.958938, 0, 1, 0.05882353, 1,
-0.392576, 1.209214, -0.3088852, 0, 1, 0.0627451, 1,
-0.390749, -0.3917808, -3.141619, 0, 1, 0.07058824, 1,
-0.3874788, 0.1619937, -3.35734, 0, 1, 0.07450981, 1,
-0.3839711, -0.6517127, -2.571547, 0, 1, 0.08235294, 1,
-0.3805406, 1.56037, 0.7681965, 0, 1, 0.08627451, 1,
-0.3769549, -1.482129, -4.762406, 0, 1, 0.09411765, 1,
-0.3760149, -0.4508432, -1.688716, 0, 1, 0.1019608, 1,
-0.3758934, 0.3035544, -1.893616, 0, 1, 0.1058824, 1,
-0.3727341, 1.230917, -1.027688, 0, 1, 0.1137255, 1,
-0.3697565, -0.3566124, -2.168805, 0, 1, 0.1176471, 1,
-0.3671507, 1.287097, -0.1860645, 0, 1, 0.1254902, 1,
-0.363192, -0.1223044, -3.37247, 0, 1, 0.1294118, 1,
-0.3630046, 0.9518932, 0.2108195, 0, 1, 0.1372549, 1,
-0.3611319, -0.6934147, -2.765544, 0, 1, 0.1411765, 1,
-0.3583981, 0.84917, 0.1125075, 0, 1, 0.1490196, 1,
-0.3569742, -0.7123998, -3.341737, 0, 1, 0.1529412, 1,
-0.3526387, -1.809303, -3.366956, 0, 1, 0.1607843, 1,
-0.3522714, -2.319867, -4.380903, 0, 1, 0.1647059, 1,
-0.3522511, -0.2859739, -2.620427, 0, 1, 0.172549, 1,
-0.3521962, 0.000329703, -0.7366326, 0, 1, 0.1764706, 1,
-0.3518128, -0.5548242, -2.9456, 0, 1, 0.1843137, 1,
-0.3506564, 1.461293, -1.351979, 0, 1, 0.1882353, 1,
-0.3485952, -0.08492333, -3.69717, 0, 1, 0.1960784, 1,
-0.3439647, 0.1809149, -1.684223, 0, 1, 0.2039216, 1,
-0.33968, -0.7491335, -3.290293, 0, 1, 0.2078431, 1,
-0.3394968, 0.2180492, -1.606142, 0, 1, 0.2156863, 1,
-0.339138, 0.009866459, -3.636149, 0, 1, 0.2196078, 1,
-0.3378807, 1.33938, -0.3855216, 0, 1, 0.227451, 1,
-0.3341128, -1.213064, -1.356025, 0, 1, 0.2313726, 1,
-0.3338383, -0.696515, -1.804712, 0, 1, 0.2392157, 1,
-0.333511, -1.437218, -2.787476, 0, 1, 0.2431373, 1,
-0.3323997, -1.117123, -3.104286, 0, 1, 0.2509804, 1,
-0.3312401, -1.62029, -2.284725, 0, 1, 0.254902, 1,
-0.3308808, -0.860007, -3.690428, 0, 1, 0.2627451, 1,
-0.3260958, -0.9292989, -3.116158, 0, 1, 0.2666667, 1,
-0.3251498, 0.699407, 0.039551, 0, 1, 0.2745098, 1,
-0.3244177, -0.8926781, -2.087389, 0, 1, 0.2784314, 1,
-0.3119269, -0.8159729, -2.30768, 0, 1, 0.2862745, 1,
-0.3088294, -0.6577082, -2.974325, 0, 1, 0.2901961, 1,
-0.3086338, 0.0370987, -2.145274, 0, 1, 0.2980392, 1,
-0.3058419, 0.09996136, -1.206636, 0, 1, 0.3058824, 1,
-0.3050219, -0.4474532, -2.21207, 0, 1, 0.3098039, 1,
-0.3047577, -0.5304594, -0.9832602, 0, 1, 0.3176471, 1,
-0.3035361, -0.1524465, -2.125782, 0, 1, 0.3215686, 1,
-0.3026266, 0.3766835, -1.099038, 0, 1, 0.3294118, 1,
-0.3002007, -0.08500135, -0.4480443, 0, 1, 0.3333333, 1,
-0.2945172, -0.7281147, -2.278761, 0, 1, 0.3411765, 1,
-0.2888455, -0.5689114, -3.285676, 0, 1, 0.345098, 1,
-0.2854482, -1.142131, -2.068241, 0, 1, 0.3529412, 1,
-0.285225, -0.4350729, -4.271366, 0, 1, 0.3568628, 1,
-0.2845515, -0.2421113, -3.089663, 0, 1, 0.3647059, 1,
-0.2832761, -2.151993, -1.861043, 0, 1, 0.3686275, 1,
-0.2815029, 0.595107, 0.2061197, 0, 1, 0.3764706, 1,
-0.2759196, 0.90066, 0.2232946, 0, 1, 0.3803922, 1,
-0.2707221, -0.08695285, -1.122435, 0, 1, 0.3882353, 1,
-0.2697821, -0.6749953, -2.034019, 0, 1, 0.3921569, 1,
-0.2687974, -0.573688, -2.865337, 0, 1, 0.4, 1,
-0.2681987, -0.1076198, -1.175711, 0, 1, 0.4078431, 1,
-0.2644032, -0.9632449, -3.078528, 0, 1, 0.4117647, 1,
-0.2633669, -1.21456, -4.987902, 0, 1, 0.4196078, 1,
-0.2619594, 0.8202097, -0.70451, 0, 1, 0.4235294, 1,
-0.2473248, -0.3033684, -3.111519, 0, 1, 0.4313726, 1,
-0.2368251, 0.2879871, -2.083996, 0, 1, 0.4352941, 1,
-0.2368083, -0.2731339, -2.226674, 0, 1, 0.4431373, 1,
-0.2302412, -0.2964022, -2.214837, 0, 1, 0.4470588, 1,
-0.2302243, -0.8301354, -4.442941, 0, 1, 0.454902, 1,
-0.2271715, -0.6315352, -3.627774, 0, 1, 0.4588235, 1,
-0.2203975, -0.287881, -2.077261, 0, 1, 0.4666667, 1,
-0.2167729, 0.2605094, -1.641214, 0, 1, 0.4705882, 1,
-0.2164507, -1.287546, -2.735539, 0, 1, 0.4784314, 1,
-0.2138186, 0.4518411, -0.1939931, 0, 1, 0.4823529, 1,
-0.2127264, -0.2506808, -1.282677, 0, 1, 0.4901961, 1,
-0.2089085, -0.2925861, -2.559877, 0, 1, 0.4941176, 1,
-0.2031141, 0.8048606, -1.718056, 0, 1, 0.5019608, 1,
-0.1995371, -0.3040388, -0.9358177, 0, 1, 0.509804, 1,
-0.1910549, -0.2360451, -3.430715, 0, 1, 0.5137255, 1,
-0.1870455, 0.1023994, 0.556592, 0, 1, 0.5215687, 1,
-0.1863541, -0.2364241, -1.369289, 0, 1, 0.5254902, 1,
-0.1831717, 0.3401332, -1.353131, 0, 1, 0.5333334, 1,
-0.1795709, -0.4432411, -1.871815, 0, 1, 0.5372549, 1,
-0.1782052, -1.594742, -3.595306, 0, 1, 0.5450981, 1,
-0.1680728, 0.957189, 0.9164968, 0, 1, 0.5490196, 1,
-0.1667656, -0.5911456, -1.617276, 0, 1, 0.5568628, 1,
-0.1662518, 1.33206, 0.05711879, 0, 1, 0.5607843, 1,
-0.1646946, 0.5712646, -1.465798, 0, 1, 0.5686275, 1,
-0.1640309, 0.5530886, -0.2073564, 0, 1, 0.572549, 1,
-0.1614069, -1.44212, -4.795853, 0, 1, 0.5803922, 1,
-0.1523997, 0.4947358, -0.6150999, 0, 1, 0.5843138, 1,
-0.140764, -2.298977, -2.232645, 0, 1, 0.5921569, 1,
-0.1301779, 0.6492057, -0.5581472, 0, 1, 0.5960785, 1,
-0.1279244, -1.6858, -2.164766, 0, 1, 0.6039216, 1,
-0.1260915, -0.5903929, -1.354849, 0, 1, 0.6117647, 1,
-0.1241717, -1.885518, -4.846724, 0, 1, 0.6156863, 1,
-0.1205255, -0.5220681, -3.7247, 0, 1, 0.6235294, 1,
-0.1200247, 0.6963648, -0.2639764, 0, 1, 0.627451, 1,
-0.1196555, -1.186268, -3.706184, 0, 1, 0.6352941, 1,
-0.1192668, -0.3322257, -3.033142, 0, 1, 0.6392157, 1,
-0.1177231, 1.409565, 0.4494075, 0, 1, 0.6470588, 1,
-0.1156436, -1.104869, -2.607046, 0, 1, 0.6509804, 1,
-0.1151032, -0.3626949, -2.006065, 0, 1, 0.6588235, 1,
-0.1148495, -0.3860441, -3.540289, 0, 1, 0.6627451, 1,
-0.1146333, 1.041759, 1.25929, 0, 1, 0.6705883, 1,
-0.11401, 1.189655, 0.8639335, 0, 1, 0.6745098, 1,
-0.1133396, 0.1332846, -1.290248, 0, 1, 0.682353, 1,
-0.1096309, -1.150969, -3.511728, 0, 1, 0.6862745, 1,
-0.1072275, -0.4659102, -2.2328, 0, 1, 0.6941177, 1,
-0.1037895, 0.0485003, -1.70027, 0, 1, 0.7019608, 1,
-0.1035613, -1.38319, -2.998098, 0, 1, 0.7058824, 1,
-0.1032554, -1.332235, -3.023498, 0, 1, 0.7137255, 1,
-0.09794205, 0.9729584, 1.073591, 0, 1, 0.7176471, 1,
-0.09675884, -0.2754916, -2.431432, 0, 1, 0.7254902, 1,
-0.09660674, -0.05593606, -1.920376, 0, 1, 0.7294118, 1,
-0.09629796, 0.3048986, -0.3944415, 0, 1, 0.7372549, 1,
-0.09488983, 1.217387, 0.9759585, 0, 1, 0.7411765, 1,
-0.09025744, -2.064229, -2.256581, 0, 1, 0.7490196, 1,
-0.08959047, 0.8352179, 0.5387998, 0, 1, 0.7529412, 1,
-0.08789173, -0.5772923, -2.596569, 0, 1, 0.7607843, 1,
-0.08590899, 0.5985236, -1.188692, 0, 1, 0.7647059, 1,
-0.07743769, -1.378431, -4.008632, 0, 1, 0.772549, 1,
-0.07563207, 1.668444, -0.1986167, 0, 1, 0.7764706, 1,
-0.07473836, -0.72217, -3.1831, 0, 1, 0.7843137, 1,
-0.07454135, 1.105079, -0.371733, 0, 1, 0.7882353, 1,
-0.07259326, 0.1603812, 0.2494754, 0, 1, 0.7960784, 1,
-0.06239333, 1.066188, 0.2753701, 0, 1, 0.8039216, 1,
-0.05877126, 0.8472924, -0.346987, 0, 1, 0.8078431, 1,
-0.05815319, -0.1323084, -3.199339, 0, 1, 0.8156863, 1,
-0.05744026, -0.4772157, -2.605111, 0, 1, 0.8196079, 1,
-0.04886965, -0.055512, -1.45392, 0, 1, 0.827451, 1,
-0.04534934, 1.020787, 0.1856732, 0, 1, 0.8313726, 1,
-0.04182963, -1.235987, -2.207517, 0, 1, 0.8392157, 1,
-0.0408789, -0.8136268, -2.930576, 0, 1, 0.8431373, 1,
-0.03803419, 2.077219, 1.231773, 0, 1, 0.8509804, 1,
-0.03751903, 0.8667412, 0.8826648, 0, 1, 0.854902, 1,
-0.03674221, 0.8296392, -0.221829, 0, 1, 0.8627451, 1,
-0.03511089, 0.6205881, -0.669176, 0, 1, 0.8666667, 1,
-0.03417359, 1.743646, -0.627213, 0, 1, 0.8745098, 1,
-0.0330736, 0.5194451, -0.05219884, 0, 1, 0.8784314, 1,
-0.03224886, 1.334847, -0.478153, 0, 1, 0.8862745, 1,
-0.03134451, 0.7145281, -0.6759614, 0, 1, 0.8901961, 1,
-0.03054369, 0.05554748, -1.312378, 0, 1, 0.8980392, 1,
-0.03001839, -0.7751355, -3.757883, 0, 1, 0.9058824, 1,
-0.02899833, -1.302962, -2.581977, 0, 1, 0.9098039, 1,
-0.02881041, 1.212698, 1.31914, 0, 1, 0.9176471, 1,
-0.02831161, 1.133489, 1.298393, 0, 1, 0.9215686, 1,
-0.02753236, -0.6142517, -4.631577, 0, 1, 0.9294118, 1,
-0.02507633, 0.8858688, 1.320066, 0, 1, 0.9333333, 1,
-0.02391804, -0.7976302, -2.412173, 0, 1, 0.9411765, 1,
-0.02227709, -2.210146, -2.084829, 0, 1, 0.945098, 1,
-0.02029936, 0.7109422, 0.5336183, 0, 1, 0.9529412, 1,
-0.01887753, 0.5544349, -0.9343132, 0, 1, 0.9568627, 1,
-0.0155497, -2.175257, -2.722451, 0, 1, 0.9647059, 1,
-0.01491056, 0.2295958, 0.9759496, 0, 1, 0.9686275, 1,
-0.01393293, 0.4811686, 0.04496711, 0, 1, 0.9764706, 1,
-0.008295704, -0.3160982, -1.932387, 0, 1, 0.9803922, 1,
-0.007382567, -0.2474675, -2.102298, 0, 1, 0.9882353, 1,
-0.006331025, 2.082225, 1.112193, 0, 1, 0.9921569, 1,
-0.005776816, -1.147783, -2.502981, 0, 1, 1, 1,
-0.005369124, -1.009353, -2.418784, 0, 0.9921569, 1, 1,
-0.004534626, -0.7265317, -3.818043, 0, 0.9882353, 1, 1,
-0.001044775, -0.68053, -4.02562, 0, 0.9803922, 1, 1,
-0.0005342909, -1.135954, -2.588431, 0, 0.9764706, 1, 1,
0.000975245, 1.098984, 0.1564374, 0, 0.9686275, 1, 1,
0.005502551, -0.8222639, 3.185948, 0, 0.9647059, 1, 1,
0.009599992, 1.001436, -0.6028006, 0, 0.9568627, 1, 1,
0.02102794, -0.2215726, 3.680571, 0, 0.9529412, 1, 1,
0.02240165, 1.355573, -0.4247223, 0, 0.945098, 1, 1,
0.02368839, -0.001808692, 2.567718, 0, 0.9411765, 1, 1,
0.02419827, -0.8029852, 1.474282, 0, 0.9333333, 1, 1,
0.02700602, -0.7073104, 1.696282, 0, 0.9294118, 1, 1,
0.02835299, -0.1358534, 3.715262, 0, 0.9215686, 1, 1,
0.03262908, 0.3847015, -1.595082, 0, 0.9176471, 1, 1,
0.03525966, 0.9563104, 0.4848623, 0, 0.9098039, 1, 1,
0.03943542, -0.2359605, 2.767993, 0, 0.9058824, 1, 1,
0.04598602, 0.3361136, 0.1860024, 0, 0.8980392, 1, 1,
0.04853037, 0.4427483, 1.189164, 0, 0.8901961, 1, 1,
0.05798547, 0.9713219, -1.420556, 0, 0.8862745, 1, 1,
0.05940208, -0.03715048, 1.556135, 0, 0.8784314, 1, 1,
0.06438189, -0.4974084, 3.58043, 0, 0.8745098, 1, 1,
0.06442164, -1.072387, 3.918752, 0, 0.8666667, 1, 1,
0.06446987, -0.06405708, 2.662296, 0, 0.8627451, 1, 1,
0.07010001, 1.224158, -0.2218854, 0, 0.854902, 1, 1,
0.0712487, -1.633007, 0.6750145, 0, 0.8509804, 1, 1,
0.07146052, -0.1183206, 4.338541, 0, 0.8431373, 1, 1,
0.07483099, -1.757651, 1.238298, 0, 0.8392157, 1, 1,
0.07863718, -0.8422822, 3.69442, 0, 0.8313726, 1, 1,
0.07906242, 2.887375, -0.8853893, 0, 0.827451, 1, 1,
0.08096403, -0.5218136, 4.224632, 0, 0.8196079, 1, 1,
0.08130832, -0.3535986, 1.3438, 0, 0.8156863, 1, 1,
0.08772968, 0.3519236, -0.1031981, 0, 0.8078431, 1, 1,
0.09962509, -1.447382, 4.453275, 0, 0.8039216, 1, 1,
0.1023037, 0.8358162, 1.232165, 0, 0.7960784, 1, 1,
0.1095565, 0.2244589, 0.1236087, 0, 0.7882353, 1, 1,
0.115591, -1.814227, 1.593685, 0, 0.7843137, 1, 1,
0.121991, -1.468177, 3.068141, 0, 0.7764706, 1, 1,
0.1250396, -0.7391823, 2.979135, 0, 0.772549, 1, 1,
0.1268539, 0.1672243, 0.9959728, 0, 0.7647059, 1, 1,
0.1272183, -0.4677901, 1.436971, 0, 0.7607843, 1, 1,
0.1330833, -1.335484, 4.118748, 0, 0.7529412, 1, 1,
0.1362341, -0.2624899, 2.889457, 0, 0.7490196, 1, 1,
0.1373906, 0.04940859, 3.423156, 0, 0.7411765, 1, 1,
0.1443451, -0.4538269, 4.011056, 0, 0.7372549, 1, 1,
0.1489938, -0.8571461, 4.769719, 0, 0.7294118, 1, 1,
0.1493515, -1.329834, 2.638, 0, 0.7254902, 1, 1,
0.1518154, -1.767319, 4.201472, 0, 0.7176471, 1, 1,
0.1601104, -0.9911494, 1.779403, 0, 0.7137255, 1, 1,
0.1609322, 0.8567181, 1.3101, 0, 0.7058824, 1, 1,
0.164305, 0.1241072, 2.002935, 0, 0.6980392, 1, 1,
0.1646394, 2.575593, 1.070714, 0, 0.6941177, 1, 1,
0.1721443, 2.052451, 0.04020713, 0, 0.6862745, 1, 1,
0.179116, 1.132782, -1.114281, 0, 0.682353, 1, 1,
0.1791241, 0.4090946, 0.3870649, 0, 0.6745098, 1, 1,
0.1825427, -1.429013, 3.337365, 0, 0.6705883, 1, 1,
0.1837618, -1.139746, 4.077184, 0, 0.6627451, 1, 1,
0.1846877, 1.321101, -1.636962, 0, 0.6588235, 1, 1,
0.1871399, 0.2299766, 0.5030595, 0, 0.6509804, 1, 1,
0.1872791, 0.4877855, 0.7764039, 0, 0.6470588, 1, 1,
0.1901749, -0.2298314, 2.309572, 0, 0.6392157, 1, 1,
0.1910709, -0.3853171, 2.938958, 0, 0.6352941, 1, 1,
0.1965142, -0.3203266, 2.77145, 0, 0.627451, 1, 1,
0.1997186, 0.1654287, 0.8633912, 0, 0.6235294, 1, 1,
0.1999914, 1.140245, 0.256731, 0, 0.6156863, 1, 1,
0.2002167, 2.271422, 2.05734, 0, 0.6117647, 1, 1,
0.20106, 0.4947021, 1.250027, 0, 0.6039216, 1, 1,
0.206258, 1.114938, -0.08747055, 0, 0.5960785, 1, 1,
0.2064294, 2.094543, 0.1589707, 0, 0.5921569, 1, 1,
0.2066574, -0.648316, 0.5463092, 0, 0.5843138, 1, 1,
0.2068777, 0.6348331, -0.3874342, 0, 0.5803922, 1, 1,
0.2072179, 0.9034182, 0.1911241, 0, 0.572549, 1, 1,
0.210208, 0.556045, 1.324643, 0, 0.5686275, 1, 1,
0.2207208, 0.9082998, -0.9007494, 0, 0.5607843, 1, 1,
0.2239419, -0.3185288, 3.293816, 0, 0.5568628, 1, 1,
0.2246889, -1.844641, 3.127484, 0, 0.5490196, 1, 1,
0.2287686, -0.07218397, 2.303182, 0, 0.5450981, 1, 1,
0.2293879, -0.8285115, 3.544623, 0, 0.5372549, 1, 1,
0.2302345, -1.132152, 2.552021, 0, 0.5333334, 1, 1,
0.2335803, -1.549872, 1.831437, 0, 0.5254902, 1, 1,
0.2348541, 1.3484, -0.1199186, 0, 0.5215687, 1, 1,
0.2366733, 0.698725, -0.5146643, 0, 0.5137255, 1, 1,
0.2410714, 0.007518802, 0.5276966, 0, 0.509804, 1, 1,
0.2429185, -2.295853, 1.118417, 0, 0.5019608, 1, 1,
0.2430253, 0.8686766, 0.3530026, 0, 0.4941176, 1, 1,
0.244694, 0.01330513, 1.380375, 0, 0.4901961, 1, 1,
0.2458718, 0.6731486, 1.099807, 0, 0.4823529, 1, 1,
0.2488419, 0.6094523, -0.09154555, 0, 0.4784314, 1, 1,
0.251289, -1.047677, 2.395946, 0, 0.4705882, 1, 1,
0.2546014, 0.7182223, 1.926718, 0, 0.4666667, 1, 1,
0.260652, -1.587816, 3.503903, 0, 0.4588235, 1, 1,
0.262073, -0.8980795, 1.745781, 0, 0.454902, 1, 1,
0.2703962, 0.2863171, 1.183734, 0, 0.4470588, 1, 1,
0.2719644, 1.14609, 0.5860783, 0, 0.4431373, 1, 1,
0.2733691, -0.003513417, 0.779346, 0, 0.4352941, 1, 1,
0.2811055, 0.7119094, 0.9119843, 0, 0.4313726, 1, 1,
0.2816376, 0.1403862, 1.035346, 0, 0.4235294, 1, 1,
0.283364, -1.779517, 4.35516, 0, 0.4196078, 1, 1,
0.2895465, -0.8840445, 2.681563, 0, 0.4117647, 1, 1,
0.2915137, -1.512386, 2.036708, 0, 0.4078431, 1, 1,
0.2922493, 2.289135, -1.229245, 0, 0.4, 1, 1,
0.2931105, 0.3613857, 0.5327361, 0, 0.3921569, 1, 1,
0.2936454, -0.04576435, 3.067756, 0, 0.3882353, 1, 1,
0.2975232, -0.1035858, 2.643106, 0, 0.3803922, 1, 1,
0.2996269, -0.3541984, 1.640924, 0, 0.3764706, 1, 1,
0.2996637, 1.049846, 0.6425387, 0, 0.3686275, 1, 1,
0.3020579, 1.299506, 0.6121719, 0, 0.3647059, 1, 1,
0.3059819, 0.2540695, 0.2714869, 0, 0.3568628, 1, 1,
0.308178, 0.3818151, 1.013937, 0, 0.3529412, 1, 1,
0.3093387, -0.9758588, 2.339748, 0, 0.345098, 1, 1,
0.3145348, -0.03822605, 1.118603, 0, 0.3411765, 1, 1,
0.3164544, 0.5185868, 2.072993, 0, 0.3333333, 1, 1,
0.3169265, -0.6003879, 2.463541, 0, 0.3294118, 1, 1,
0.3207252, -1.382193, 2.552608, 0, 0.3215686, 1, 1,
0.3210793, 1.269714, -0.02686905, 0, 0.3176471, 1, 1,
0.3219259, -1.150269, 2.561931, 0, 0.3098039, 1, 1,
0.3263495, 0.3359063, 1.692764, 0, 0.3058824, 1, 1,
0.3264502, 0.6790721, 1.534159, 0, 0.2980392, 1, 1,
0.3266034, -0.02917388, 2.804125, 0, 0.2901961, 1, 1,
0.3317897, -2.471309, 2.464389, 0, 0.2862745, 1, 1,
0.3343266, 0.4247096, -0.1111159, 0, 0.2784314, 1, 1,
0.334403, -1.351763, 2.417299, 0, 0.2745098, 1, 1,
0.3356881, 1.357632, 0.7690427, 0, 0.2666667, 1, 1,
0.3371158, -0.424207, -0.2253034, 0, 0.2627451, 1, 1,
0.3384866, -1.345739, 2.09149, 0, 0.254902, 1, 1,
0.3386761, 1.687557, 1.398165, 0, 0.2509804, 1, 1,
0.3401447, 1.194633, 2.030154, 0, 0.2431373, 1, 1,
0.3505756, -1.451282, 2.669441, 0, 0.2392157, 1, 1,
0.3518288, -0.3511093, 2.71183, 0, 0.2313726, 1, 1,
0.352076, -0.1027937, 2.642025, 0, 0.227451, 1, 1,
0.3524182, -0.1430333, 2.397026, 0, 0.2196078, 1, 1,
0.3538328, 1.766655, 2.221575, 0, 0.2156863, 1, 1,
0.3644153, -0.1774196, 3.123911, 0, 0.2078431, 1, 1,
0.3661171, 0.7156886, -0.8794222, 0, 0.2039216, 1, 1,
0.3667096, 1.381126, -0.1100181, 0, 0.1960784, 1, 1,
0.3729816, -0.1544901, 1.395959, 0, 0.1882353, 1, 1,
0.3771124, 1.243034, 1.568899, 0, 0.1843137, 1, 1,
0.3867232, -0.0233087, 2.770378, 0, 0.1764706, 1, 1,
0.3874576, 0.5203178, -0.888216, 0, 0.172549, 1, 1,
0.3937065, 0.8776072, 0.2823692, 0, 0.1647059, 1, 1,
0.3953281, -0.09455916, 0.4212482, 0, 0.1607843, 1, 1,
0.3983282, 0.8685488, 0.09705096, 0, 0.1529412, 1, 1,
0.4095488, -0.7225056, 2.397612, 0, 0.1490196, 1, 1,
0.4120828, 1.073517, -1.766645, 0, 0.1411765, 1, 1,
0.412219, 1.391203, 1.464092, 0, 0.1372549, 1, 1,
0.4140937, -1.130164, 2.971693, 0, 0.1294118, 1, 1,
0.4213874, 1.16845, -0.209765, 0, 0.1254902, 1, 1,
0.4235805, -0.4960951, 3.107972, 0, 0.1176471, 1, 1,
0.426232, 0.3491597, 1.970454, 0, 0.1137255, 1, 1,
0.4278357, -0.8743587, 3.728791, 0, 0.1058824, 1, 1,
0.4279671, 0.9148307, 0.2781569, 0, 0.09803922, 1, 1,
0.4282447, -0.3037668, 2.251235, 0, 0.09411765, 1, 1,
0.4294529, -2.175947, 1.287859, 0, 0.08627451, 1, 1,
0.4339455, 1.786519, 1.137504, 0, 0.08235294, 1, 1,
0.4368269, -0.8540738, 2.691008, 0, 0.07450981, 1, 1,
0.4417666, 0.05843905, 2.591305, 0, 0.07058824, 1, 1,
0.4418408, 0.3476796, 0.3001118, 0, 0.0627451, 1, 1,
0.4418927, -1.62458, 2.207408, 0, 0.05882353, 1, 1,
0.4445762, -0.03459224, 2.186535, 0, 0.05098039, 1, 1,
0.4498744, -0.4056379, 1.653892, 0, 0.04705882, 1, 1,
0.452976, 1.255542, 0.1672929, 0, 0.03921569, 1, 1,
0.4600541, 1.624266, 0.2697778, 0, 0.03529412, 1, 1,
0.4632269, -0.6946505, 1.40877, 0, 0.02745098, 1, 1,
0.4661403, 0.2276434, 2.167597, 0, 0.02352941, 1, 1,
0.4684745, -0.6653925, 3.178988, 0, 0.01568628, 1, 1,
0.4744149, 0.6675388, 2.952984, 0, 0.01176471, 1, 1,
0.4750299, 0.7495111, 1.203017, 0, 0.003921569, 1, 1,
0.477206, 0.8763161, 0.1519121, 0.003921569, 0, 1, 1,
0.4782043, -0.3006116, 0.8362303, 0.007843138, 0, 1, 1,
0.4826652, -0.2932429, 0.6363016, 0.01568628, 0, 1, 1,
0.4847739, -1.128584, 2.309266, 0.01960784, 0, 1, 1,
0.4894756, 0.361736, 2.662123, 0.02745098, 0, 1, 1,
0.4898938, -0.532797, 3.171373, 0.03137255, 0, 1, 1,
0.490583, -0.3170649, 0.6445978, 0.03921569, 0, 1, 1,
0.4911279, -0.5835027, 0.8519716, 0.04313726, 0, 1, 1,
0.4913593, -0.85923, 3.891247, 0.05098039, 0, 1, 1,
0.4940464, -1.186069, 2.992164, 0.05490196, 0, 1, 1,
0.49502, -0.1951145, 3.662707, 0.0627451, 0, 1, 1,
0.4972274, -0.5340192, 2.386193, 0.06666667, 0, 1, 1,
0.4976966, 0.5510892, 0.8445966, 0.07450981, 0, 1, 1,
0.4977362, -1.099966, 2.558379, 0.07843138, 0, 1, 1,
0.5018973, 0.1959577, 2.314147, 0.08627451, 0, 1, 1,
0.5021755, -0.8162032, 2.344209, 0.09019608, 0, 1, 1,
0.5049729, -0.2523738, 2.249396, 0.09803922, 0, 1, 1,
0.5085449, 1.092999, 0.04216994, 0.1058824, 0, 1, 1,
0.5088267, -1.166639, 0.9344723, 0.1098039, 0, 1, 1,
0.5100753, 1.777759, 1.664933, 0.1176471, 0, 1, 1,
0.5102263, 1.371054, 0.1414387, 0.1215686, 0, 1, 1,
0.511189, 0.2363493, 0.2159262, 0.1294118, 0, 1, 1,
0.5151478, 0.442728, 1.620735, 0.1333333, 0, 1, 1,
0.5167702, -0.2985315, 3.981201, 0.1411765, 0, 1, 1,
0.5180421, -0.09052027, 0.919458, 0.145098, 0, 1, 1,
0.5215133, 0.5446073, 1.414985, 0.1529412, 0, 1, 1,
0.5222946, -0.806432, 2.937607, 0.1568628, 0, 1, 1,
0.5232994, 0.00929014, 2.161771, 0.1647059, 0, 1, 1,
0.525165, 0.480633, -0.1547695, 0.1686275, 0, 1, 1,
0.5301311, 0.1076873, 1.340368, 0.1764706, 0, 1, 1,
0.5303841, -0.1852166, 0.3758934, 0.1803922, 0, 1, 1,
0.531783, -0.6620269, 2.798497, 0.1882353, 0, 1, 1,
0.535289, 0.08556797, 1.827174, 0.1921569, 0, 1, 1,
0.5368998, 1.199992, -1.347631, 0.2, 0, 1, 1,
0.5388162, -0.9795401, 1.999796, 0.2078431, 0, 1, 1,
0.5394065, -0.2046845, 0.7602592, 0.2117647, 0, 1, 1,
0.5418789, -2.685769, 2.104965, 0.2196078, 0, 1, 1,
0.5447214, -0.5768155, 3.261534, 0.2235294, 0, 1, 1,
0.5471796, -0.8694705, 1.636242, 0.2313726, 0, 1, 1,
0.5597758, -2.72975, 2.197641, 0.2352941, 0, 1, 1,
0.5613583, 0.5263867, 1.446064, 0.2431373, 0, 1, 1,
0.5629715, -0.5689905, 2.045284, 0.2470588, 0, 1, 1,
0.5634702, 0.1847711, 0.7415668, 0.254902, 0, 1, 1,
0.5702906, 2.253205, 2.305568, 0.2588235, 0, 1, 1,
0.5740386, 1.941402, 0.3005019, 0.2666667, 0, 1, 1,
0.5753224, 1.979932, 1.477393, 0.2705882, 0, 1, 1,
0.5778322, -1.189291, 3.583131, 0.2784314, 0, 1, 1,
0.5790055, -0.02136776, 3.651174, 0.282353, 0, 1, 1,
0.5886141, -0.3086116, 2.755552, 0.2901961, 0, 1, 1,
0.5889065, -1.252391, 2.104549, 0.2941177, 0, 1, 1,
0.5892256, -1.027446, 2.807864, 0.3019608, 0, 1, 1,
0.5910933, -0.6986225, 1.081686, 0.3098039, 0, 1, 1,
0.5951214, -0.4070401, 1.943875, 0.3137255, 0, 1, 1,
0.5958702, -0.6433854, 1.577658, 0.3215686, 0, 1, 1,
0.5972428, 0.5575086, 0.1919647, 0.3254902, 0, 1, 1,
0.6093127, 0.3740899, 0.3449732, 0.3333333, 0, 1, 1,
0.6102984, 2.050202, -1.303327, 0.3372549, 0, 1, 1,
0.6107939, 0.04330538, 0.322922, 0.345098, 0, 1, 1,
0.6108792, 2.025291, -0.544054, 0.3490196, 0, 1, 1,
0.6188198, -0.488375, 0.6442388, 0.3568628, 0, 1, 1,
0.6248752, 1.347265, -0.6737801, 0.3607843, 0, 1, 1,
0.6253212, -0.3395842, 2.294054, 0.3686275, 0, 1, 1,
0.6348403, -0.6533429, 3.021318, 0.372549, 0, 1, 1,
0.6386808, 0.1072434, 2.256947, 0.3803922, 0, 1, 1,
0.6387542, -0.1800058, 1.023592, 0.3843137, 0, 1, 1,
0.640363, -1.010129, 0.829815, 0.3921569, 0, 1, 1,
0.6414026, -0.1938526, 1.939824, 0.3960784, 0, 1, 1,
0.6421652, 0.4095286, 1.701585, 0.4039216, 0, 1, 1,
0.643981, -1.890044, 2.461315, 0.4117647, 0, 1, 1,
0.6456746, -0.4716186, 3.048436, 0.4156863, 0, 1, 1,
0.6466762, -0.4051552, 2.98041, 0.4235294, 0, 1, 1,
0.6529739, -2.112723, 3.066081, 0.427451, 0, 1, 1,
0.6600923, -0.3919811, 0.9738477, 0.4352941, 0, 1, 1,
0.6624869, 0.06716111, -0.8621629, 0.4392157, 0, 1, 1,
0.6718449, -0.3378357, 1.35387, 0.4470588, 0, 1, 1,
0.6722443, -1.043831, 3.856508, 0.4509804, 0, 1, 1,
0.6757497, -0.368109, 1.860473, 0.4588235, 0, 1, 1,
0.6846594, -0.1620744, 2.740126, 0.4627451, 0, 1, 1,
0.685574, 0.4188499, 0.4675709, 0.4705882, 0, 1, 1,
0.6862067, 0.2411371, -0.3920245, 0.4745098, 0, 1, 1,
0.7047523, 0.8346001, 1.657419, 0.4823529, 0, 1, 1,
0.7112996, 0.1009913, 2.6902, 0.4862745, 0, 1, 1,
0.7119008, 1.605235, -0.7615961, 0.4941176, 0, 1, 1,
0.7137602, -0.238436, 1.670619, 0.5019608, 0, 1, 1,
0.717464, -0.234322, 0.4561718, 0.5058824, 0, 1, 1,
0.7195907, -0.9455405, 2.968756, 0.5137255, 0, 1, 1,
0.7229208, -0.7774135, 2.141671, 0.5176471, 0, 1, 1,
0.7270019, 0.06001746, 1.027968, 0.5254902, 0, 1, 1,
0.7275489, -0.8069377, 1.628245, 0.5294118, 0, 1, 1,
0.7296979, -0.5481286, 3.409905, 0.5372549, 0, 1, 1,
0.7315679, 0.9159439, 1.772551, 0.5411765, 0, 1, 1,
0.7353358, -0.6540893, 2.389729, 0.5490196, 0, 1, 1,
0.7396615, -0.9016593, 0.8975087, 0.5529412, 0, 1, 1,
0.7439408, 0.2742707, 1.949302, 0.5607843, 0, 1, 1,
0.7459347, 0.7424706, 1.855052, 0.5647059, 0, 1, 1,
0.7466218, -0.9841835, 1.363111, 0.572549, 0, 1, 1,
0.7475589, -0.1491314, 0.007294932, 0.5764706, 0, 1, 1,
0.7542831, -0.1701649, 1.501472, 0.5843138, 0, 1, 1,
0.7579498, -1.006388, 2.713271, 0.5882353, 0, 1, 1,
0.7689556, -0.4507611, 1.063821, 0.5960785, 0, 1, 1,
0.7707168, 0.3160156, 2.403592, 0.6039216, 0, 1, 1,
0.7719427, 0.9014415, -0.1477102, 0.6078432, 0, 1, 1,
0.7744503, 2.131203, 1.682441, 0.6156863, 0, 1, 1,
0.7761635, 0.1694472, 2.913647, 0.6196079, 0, 1, 1,
0.7781856, -1.41287, 2.357634, 0.627451, 0, 1, 1,
0.7809532, 0.8732088, 1.873491, 0.6313726, 0, 1, 1,
0.7859159, 0.03337304, 0.6470866, 0.6392157, 0, 1, 1,
0.7885774, -0.01237072, 0.7403776, 0.6431373, 0, 1, 1,
0.7948828, -1.261147, 2.183316, 0.6509804, 0, 1, 1,
0.8030344, 1.721797, 1.693738, 0.654902, 0, 1, 1,
0.803342, 1.296305, 0.8226023, 0.6627451, 0, 1, 1,
0.8066507, 0.5561364, 1.728757, 0.6666667, 0, 1, 1,
0.8083053, -0.4505033, 2.295951, 0.6745098, 0, 1, 1,
0.8120332, 0.5770872, -0.5083264, 0.6784314, 0, 1, 1,
0.8128088, -0.4909165, 2.775806, 0.6862745, 0, 1, 1,
0.8139285, 1.102385, 1.262051, 0.6901961, 0, 1, 1,
0.8151758, 1.021872, -0.5711315, 0.6980392, 0, 1, 1,
0.8219045, 0.8212632, 0.415419, 0.7058824, 0, 1, 1,
0.8226512, 0.7192444, 0.05992037, 0.7098039, 0, 1, 1,
0.8253471, 0.5949306, 1.855504, 0.7176471, 0, 1, 1,
0.8270772, 0.1576082, 1.817643, 0.7215686, 0, 1, 1,
0.82789, -2.237852, 3.665301, 0.7294118, 0, 1, 1,
0.8326583, -0.3475356, 2.809566, 0.7333333, 0, 1, 1,
0.8365204, -0.5852725, 0.6408656, 0.7411765, 0, 1, 1,
0.8371059, 0.09592679, 2.190086, 0.7450981, 0, 1, 1,
0.8375058, 1.685572, -0.6628033, 0.7529412, 0, 1, 1,
0.8447348, 0.1420184, 1.663771, 0.7568628, 0, 1, 1,
0.8489921, 1.591124, 0.6961086, 0.7647059, 0, 1, 1,
0.8503453, 0.2678466, 2.541485, 0.7686275, 0, 1, 1,
0.8543224, 2.457957, -1.267156, 0.7764706, 0, 1, 1,
0.8557948, 0.9595521, -0.4773347, 0.7803922, 0, 1, 1,
0.8560776, 2.717056, -0.08181408, 0.7882353, 0, 1, 1,
0.8563571, 1.444396, 0.2952083, 0.7921569, 0, 1, 1,
0.8596021, 0.4336655, 1.333944, 0.8, 0, 1, 1,
0.8613591, -1.076391, 1.213811, 0.8078431, 0, 1, 1,
0.8688841, -0.3307859, 2.538662, 0.8117647, 0, 1, 1,
0.8691611, 0.1900079, 0.06433656, 0.8196079, 0, 1, 1,
0.8711571, -0.4113947, 2.648108, 0.8235294, 0, 1, 1,
0.8713667, 0.2555459, -0.09416274, 0.8313726, 0, 1, 1,
0.8792737, 1.628684, 2.51651, 0.8352941, 0, 1, 1,
0.8794854, 0.5928726, 0.9430876, 0.8431373, 0, 1, 1,
0.8796403, -0.6244658, 3.604225, 0.8470588, 0, 1, 1,
0.8807042, -0.4708505, 1.459522, 0.854902, 0, 1, 1,
0.8847372, 0.6757342, -0.3959709, 0.8588235, 0, 1, 1,
0.8876111, -2.807269, 3.469955, 0.8666667, 0, 1, 1,
0.8925321, 0.9518788, 0.1290388, 0.8705882, 0, 1, 1,
0.896517, 0.234198, 2.768138, 0.8784314, 0, 1, 1,
0.9019098, -0.4247432, 2.314638, 0.8823529, 0, 1, 1,
0.9190913, -0.1392754, 3.542509, 0.8901961, 0, 1, 1,
0.9288456, 0.5683042, 2.084621, 0.8941177, 0, 1, 1,
0.9300366, -0.9163595, 0.6103791, 0.9019608, 0, 1, 1,
0.930539, -0.3160764, 0.4172819, 0.9098039, 0, 1, 1,
0.9307919, 1.425427, 0.8522912, 0.9137255, 0, 1, 1,
0.9379218, -0.05726004, 0.9476869, 0.9215686, 0, 1, 1,
0.9427481, -0.7257845, 0.9052422, 0.9254902, 0, 1, 1,
0.9484102, 0.4002634, 2.472264, 0.9333333, 0, 1, 1,
0.9492922, 0.3575987, 1.374939, 0.9372549, 0, 1, 1,
0.9574931, -0.3663501, 2.098428, 0.945098, 0, 1, 1,
0.9621837, 0.9707616, -0.7940696, 0.9490196, 0, 1, 1,
0.9633982, -0.2563032, -0.4296489, 0.9568627, 0, 1, 1,
0.9643129, 0.6406924, 0.6588897, 0.9607843, 0, 1, 1,
0.9649271, -0.3718048, 2.426482, 0.9686275, 0, 1, 1,
0.9668674, 0.9502212, 1.186916, 0.972549, 0, 1, 1,
0.9669118, -0.8124647, 1.188596, 0.9803922, 0, 1, 1,
0.970235, -0.3047031, 4.30085, 0.9843137, 0, 1, 1,
0.9716812, 0.6408962, 1.105416, 0.9921569, 0, 1, 1,
0.9735703, -0.05542215, 2.515458, 0.9960784, 0, 1, 1,
0.9752622, 0.8921263, 2.147295, 1, 0, 0.9960784, 1,
0.9809696, 2.00297, 0.440041, 1, 0, 0.9882353, 1,
0.9850951, -1.293232, 4.573317, 1, 0, 0.9843137, 1,
0.9862012, 0.2950549, 1.490823, 1, 0, 0.9764706, 1,
0.9913394, 2.477016, 0.1345814, 1, 0, 0.972549, 1,
0.9917898, -0.5654638, 1.551381, 1, 0, 0.9647059, 1,
0.993434, 0.4389149, 2.623181, 1, 0, 0.9607843, 1,
1.000449, 0.8023286, 1.410217, 1, 0, 0.9529412, 1,
1.005219, 0.9063326, -0.2537819, 1, 0, 0.9490196, 1,
1.010831, -0.01745081, 2.127993, 1, 0, 0.9411765, 1,
1.011842, -0.4530688, 1.016037, 1, 0, 0.9372549, 1,
1.012242, -0.6659076, 3.035509, 1, 0, 0.9294118, 1,
1.034097, -0.6017779, 3.366239, 1, 0, 0.9254902, 1,
1.036605, -0.1599077, 1.678207, 1, 0, 0.9176471, 1,
1.038808, -1.089331, 3.115606, 1, 0, 0.9137255, 1,
1.040085, 0.9905914, 1.78414, 1, 0, 0.9058824, 1,
1.041381, -0.6331072, 1.367061, 1, 0, 0.9019608, 1,
1.045663, 0.4467657, 0.6463757, 1, 0, 0.8941177, 1,
1.047031, 0.003494827, 0.5244194, 1, 0, 0.8862745, 1,
1.050054, -1.015111, 2.652255, 1, 0, 0.8823529, 1,
1.050753, 0.150551, 2.627669, 1, 0, 0.8745098, 1,
1.06143, 0.9619524, 1.012669, 1, 0, 0.8705882, 1,
1.065763, -0.04647846, 3.280283, 1, 0, 0.8627451, 1,
1.070013, 1.608078, -1.208591, 1, 0, 0.8588235, 1,
1.071227, 0.4545199, 2.482838, 1, 0, 0.8509804, 1,
1.071516, -1.623151, 0.8942934, 1, 0, 0.8470588, 1,
1.080257, -0.3302491, 1.462945, 1, 0, 0.8392157, 1,
1.084682, -0.818055, 2.550858, 1, 0, 0.8352941, 1,
1.085379, 1.727062, -0.8790147, 1, 0, 0.827451, 1,
1.09619, 1.181906, 1.864298, 1, 0, 0.8235294, 1,
1.098045, 0.5119882, 1.518641, 1, 0, 0.8156863, 1,
1.104634, -0.1297532, 2.544142, 1, 0, 0.8117647, 1,
1.106376, 2.951042, -0.6749957, 1, 0, 0.8039216, 1,
1.1086, 1.903141, 0.1797642, 1, 0, 0.7960784, 1,
1.109766, 0.1511189, 3.180407, 1, 0, 0.7921569, 1,
1.118245, 0.1152107, 1.775612, 1, 0, 0.7843137, 1,
1.131934, 0.958688, 0.1463249, 1, 0, 0.7803922, 1,
1.132672, 0.5490803, 2.026094, 1, 0, 0.772549, 1,
1.134863, -0.3810007, 0.7885942, 1, 0, 0.7686275, 1,
1.135096, 0.4619258, 2.825307, 1, 0, 0.7607843, 1,
1.141693, -1.458959, 3.426558, 1, 0, 0.7568628, 1,
1.159279, -0.3630697, 2.02313, 1, 0, 0.7490196, 1,
1.161767, 2.021197, -0.8532306, 1, 0, 0.7450981, 1,
1.162584, 0.6953064, 0.06336609, 1, 0, 0.7372549, 1,
1.168429, -0.05475258, 0.2186363, 1, 0, 0.7333333, 1,
1.174296, -0.08757613, 1.145162, 1, 0, 0.7254902, 1,
1.177598, -0.19489, 2.504026, 1, 0, 0.7215686, 1,
1.180988, -0.2357138, 2.950379, 1, 0, 0.7137255, 1,
1.184675, -0.5963579, 3.341496, 1, 0, 0.7098039, 1,
1.185035, 2.793326, 0.7552485, 1, 0, 0.7019608, 1,
1.185609, -0.6821492, 1.650532, 1, 0, 0.6941177, 1,
1.189685, 2.556395, 2.72331, 1, 0, 0.6901961, 1,
1.191519, -1.38681, 3.807612, 1, 0, 0.682353, 1,
1.192189, -0.7120457, 2.28901, 1, 0, 0.6784314, 1,
1.203855, -1.015309, 1.138273, 1, 0, 0.6705883, 1,
1.203873, 0.8192964, 0.04886835, 1, 0, 0.6666667, 1,
1.208209, 0.2592676, 2.699494, 1, 0, 0.6588235, 1,
1.216549, 1.537447, -0.6115196, 1, 0, 0.654902, 1,
1.217542, -0.9769121, 2.157858, 1, 0, 0.6470588, 1,
1.217731, -0.2682646, 0.6671901, 1, 0, 0.6431373, 1,
1.224092, 0.5598958, 2.559667, 1, 0, 0.6352941, 1,
1.227088, -0.1016659, 0.1559828, 1, 0, 0.6313726, 1,
1.238034, 2.356528, -0.4608583, 1, 0, 0.6235294, 1,
1.244591, -0.4601032, 1.516428, 1, 0, 0.6196079, 1,
1.248301, 1.803648, 0.4686848, 1, 0, 0.6117647, 1,
1.259155, -0.3974778, 2.010685, 1, 0, 0.6078432, 1,
1.262349, -0.4165766, 0.801472, 1, 0, 0.6, 1,
1.267973, -0.2402801, 1.796402, 1, 0, 0.5921569, 1,
1.26891, 0.1173405, 0.1315574, 1, 0, 0.5882353, 1,
1.273074, 1.930406, 0.6046638, 1, 0, 0.5803922, 1,
1.273302, -2.022765, 4.165216, 1, 0, 0.5764706, 1,
1.275708, 0.5118881, 1.366638, 1, 0, 0.5686275, 1,
1.282982, 2.096032, 0.7483123, 1, 0, 0.5647059, 1,
1.284176, -0.6580678, 1.049823, 1, 0, 0.5568628, 1,
1.284724, 1.730223, -1.196292, 1, 0, 0.5529412, 1,
1.295978, -0.05842365, 0.9366305, 1, 0, 0.5450981, 1,
1.297384, 1.076824, 1.255332, 1, 0, 0.5411765, 1,
1.29747, 1.957743, -0.2389984, 1, 0, 0.5333334, 1,
1.297741, -1.718456, 1.93848, 1, 0, 0.5294118, 1,
1.297974, -1.381363, 3.616298, 1, 0, 0.5215687, 1,
1.300789, 0.601149, 0.4020887, 1, 0, 0.5176471, 1,
1.303504, 0.2966973, 3.369047, 1, 0, 0.509804, 1,
1.312443, 0.8141137, 2.418379, 1, 0, 0.5058824, 1,
1.314878, 0.8478675, 0.3080628, 1, 0, 0.4980392, 1,
1.31753, -0.2722766, -0.1683432, 1, 0, 0.4901961, 1,
1.332153, 0.1182412, 1.820459, 1, 0, 0.4862745, 1,
1.334551, 1.440293, 1.165972, 1, 0, 0.4784314, 1,
1.338402, -1.814466, 3.518393, 1, 0, 0.4745098, 1,
1.347416, 0.9053465, 1.920764, 1, 0, 0.4666667, 1,
1.351268, 0.6383902, 2.299448, 1, 0, 0.4627451, 1,
1.353825, -0.109026, 1.140669, 1, 0, 0.454902, 1,
1.357172, 0.6684456, 2.318522, 1, 0, 0.4509804, 1,
1.367039, -0.8629544, -0.03689765, 1, 0, 0.4431373, 1,
1.37321, -0.2766522, 1.447913, 1, 0, 0.4392157, 1,
1.375256, 0.2303298, 1.251661, 1, 0, 0.4313726, 1,
1.375904, 0.4266789, 2.463422, 1, 0, 0.427451, 1,
1.385972, 1.629564, 1.329319, 1, 0, 0.4196078, 1,
1.411524, 1.081084, 0.1538193, 1, 0, 0.4156863, 1,
1.426356, 0.2891096, 2.138506, 1, 0, 0.4078431, 1,
1.42718, -0.5462974, 0.8993251, 1, 0, 0.4039216, 1,
1.439357, 1.133847, 0.4530796, 1, 0, 0.3960784, 1,
1.440674, -0.8480478, 1.241173, 1, 0, 0.3882353, 1,
1.442009, 1.554749, 1.020284, 1, 0, 0.3843137, 1,
1.47709, 0.9207948, 0.7593733, 1, 0, 0.3764706, 1,
1.526766, -0.1423471, 1.813909, 1, 0, 0.372549, 1,
1.532181, 1.14867, 0.8651534, 1, 0, 0.3647059, 1,
1.54514, -0.5728089, 1.080555, 1, 0, 0.3607843, 1,
1.557448, -0.2893854, 2.736692, 1, 0, 0.3529412, 1,
1.558168, -0.4704966, 2.867481, 1, 0, 0.3490196, 1,
1.561682, -2.746429, 3.54285, 1, 0, 0.3411765, 1,
1.572767, 0.3365038, 1.708953, 1, 0, 0.3372549, 1,
1.579358, 0.9626192, 0.500479, 1, 0, 0.3294118, 1,
1.596339, -0.7956368, 1.339915, 1, 0, 0.3254902, 1,
1.596783, -1.957167, 4.391984, 1, 0, 0.3176471, 1,
1.596941, 0.2293945, 2.623548, 1, 0, 0.3137255, 1,
1.609356, -0.7708776, 0.1341432, 1, 0, 0.3058824, 1,
1.60981, -0.5476145, 1.688044, 1, 0, 0.2980392, 1,
1.610848, 0.3812734, 1.815599, 1, 0, 0.2941177, 1,
1.626966, -1.601231, 1.835035, 1, 0, 0.2862745, 1,
1.654366, -0.3445954, 2.292101, 1, 0, 0.282353, 1,
1.657161, 0.8123768, 0.4905504, 1, 0, 0.2745098, 1,
1.664424, 1.285012, -0.6052133, 1, 0, 0.2705882, 1,
1.674613, -0.9177328, 0.05551031, 1, 0, 0.2627451, 1,
1.69118, -0.1508549, 0.8375604, 1, 0, 0.2588235, 1,
1.715875, 1.359547, 0.7465786, 1, 0, 0.2509804, 1,
1.721337, -0.4405675, 0.6288256, 1, 0, 0.2470588, 1,
1.731056, 0.7860206, 1.129029, 1, 0, 0.2392157, 1,
1.751459, -0.9361204, 2.439935, 1, 0, 0.2352941, 1,
1.751546, 1.206628, 2.339438, 1, 0, 0.227451, 1,
1.77198, -1.046387, 3.054585, 1, 0, 0.2235294, 1,
1.817758, 0.5288798, 0.4983161, 1, 0, 0.2156863, 1,
1.843256, 0.04087043, 1.513909, 1, 0, 0.2117647, 1,
1.843577, -0.6540182, 1.730024, 1, 0, 0.2039216, 1,
1.849154, -0.6691868, 1.339675, 1, 0, 0.1960784, 1,
1.856437, 0.7465703, 0.3964907, 1, 0, 0.1921569, 1,
1.857409, 1.801656, 0.8821762, 1, 0, 0.1843137, 1,
1.898163, -1.461514, 1.869543, 1, 0, 0.1803922, 1,
1.906726, -1.3165, 2.080501, 1, 0, 0.172549, 1,
1.952746, 0.9892803, 3.203697, 1, 0, 0.1686275, 1,
1.982465, 2.503874, -0.942046, 1, 0, 0.1607843, 1,
1.991424, -0.4940308, 2.928908, 1, 0, 0.1568628, 1,
1.992265, -0.3734885, 2.612288, 1, 0, 0.1490196, 1,
2.002085, 1.782279, 2.201512, 1, 0, 0.145098, 1,
2.025664, 0.4440821, -1.126823, 1, 0, 0.1372549, 1,
2.027424, -0.9529108, 3.229948, 1, 0, 0.1333333, 1,
2.044578, -0.1710378, 1.724784, 1, 0, 0.1254902, 1,
2.054929, 0.7706549, 2.786344, 1, 0, 0.1215686, 1,
2.062997, -0.4043571, 0.4680783, 1, 0, 0.1137255, 1,
2.064147, 0.7071853, 2.703369, 1, 0, 0.1098039, 1,
2.143822, -3.038492, 3.46511, 1, 0, 0.1019608, 1,
2.160903, 0.2676019, 0.60162, 1, 0, 0.09411765, 1,
2.177423, -0.6689944, 2.325444, 1, 0, 0.09019608, 1,
2.204382, 1.617257, 0.673662, 1, 0, 0.08235294, 1,
2.257217, 0.2039842, 2.197124, 1, 0, 0.07843138, 1,
2.432834, -1.361148, 0.5384096, 1, 0, 0.07058824, 1,
2.471998, -0.8623927, 1.697021, 1, 0, 0.06666667, 1,
2.524355, -1.660848, 1.305842, 1, 0, 0.05882353, 1,
2.560017, 0.6056452, 0.00720904, 1, 0, 0.05490196, 1,
2.589938, 0.2532549, 0.2053833, 1, 0, 0.04705882, 1,
2.618344, 0.8189037, 0.7709804, 1, 0, 0.04313726, 1,
2.634529, -2.633509, 2.177581, 1, 0, 0.03529412, 1,
2.701764, -0.3046393, 0.5621311, 1, 0, 0.03137255, 1,
2.900603, 1.079463, 2.040044, 1, 0, 0.02352941, 1,
3.01164, -0.7116022, 1.744116, 1, 0, 0.01960784, 1,
3.082715, -0.7760248, 0.9630165, 1, 0, 0.01176471, 1,
3.395757, 0.8592272, 2.878706, 1, 0, 0.007843138, 1
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
0.06765223, -4.308916, -7.348197, 0, -0.5, 0.5, 0.5,
0.06765223, -4.308916, -7.348197, 1, -0.5, 0.5, 0.5,
0.06765223, -4.308916, -7.348197, 1, 1.5, 0.5, 0.5,
0.06765223, -4.308916, -7.348197, 0, 1.5, 0.5, 0.5
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
-4.38868, -0.1528307, -7.348197, 0, -0.5, 0.5, 0.5,
-4.38868, -0.1528307, -7.348197, 1, -0.5, 0.5, 0.5,
-4.38868, -0.1528307, -7.348197, 1, 1.5, 0.5, 0.5,
-4.38868, -0.1528307, -7.348197, 0, 1.5, 0.5, 0.5
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
-4.38868, -4.308916, -0.4110913, 0, -0.5, 0.5, 0.5,
-4.38868, -4.308916, -0.4110913, 1, -0.5, 0.5, 0.5,
-4.38868, -4.308916, -0.4110913, 1, 1.5, 0.5, 0.5,
-4.38868, -4.308916, -0.4110913, 0, 1.5, 0.5, 0.5
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
-3, -3.34982, -5.747326,
3, -3.34982, -5.747326,
-3, -3.34982, -5.747326,
-3, -3.509669, -6.014138,
-2, -3.34982, -5.747326,
-2, -3.509669, -6.014138,
-1, -3.34982, -5.747326,
-1, -3.509669, -6.014138,
0, -3.34982, -5.747326,
0, -3.509669, -6.014138,
1, -3.34982, -5.747326,
1, -3.509669, -6.014138,
2, -3.34982, -5.747326,
2, -3.509669, -6.014138,
3, -3.34982, -5.747326,
3, -3.509669, -6.014138
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
-3, -3.829368, -6.547761, 0, -0.5, 0.5, 0.5,
-3, -3.829368, -6.547761, 1, -0.5, 0.5, 0.5,
-3, -3.829368, -6.547761, 1, 1.5, 0.5, 0.5,
-3, -3.829368, -6.547761, 0, 1.5, 0.5, 0.5,
-2, -3.829368, -6.547761, 0, -0.5, 0.5, 0.5,
-2, -3.829368, -6.547761, 1, -0.5, 0.5, 0.5,
-2, -3.829368, -6.547761, 1, 1.5, 0.5, 0.5,
-2, -3.829368, -6.547761, 0, 1.5, 0.5, 0.5,
-1, -3.829368, -6.547761, 0, -0.5, 0.5, 0.5,
-1, -3.829368, -6.547761, 1, -0.5, 0.5, 0.5,
-1, -3.829368, -6.547761, 1, 1.5, 0.5, 0.5,
-1, -3.829368, -6.547761, 0, 1.5, 0.5, 0.5,
0, -3.829368, -6.547761, 0, -0.5, 0.5, 0.5,
0, -3.829368, -6.547761, 1, -0.5, 0.5, 0.5,
0, -3.829368, -6.547761, 1, 1.5, 0.5, 0.5,
0, -3.829368, -6.547761, 0, 1.5, 0.5, 0.5,
1, -3.829368, -6.547761, 0, -0.5, 0.5, 0.5,
1, -3.829368, -6.547761, 1, -0.5, 0.5, 0.5,
1, -3.829368, -6.547761, 1, 1.5, 0.5, 0.5,
1, -3.829368, -6.547761, 0, 1.5, 0.5, 0.5,
2, -3.829368, -6.547761, 0, -0.5, 0.5, 0.5,
2, -3.829368, -6.547761, 1, -0.5, 0.5, 0.5,
2, -3.829368, -6.547761, 1, 1.5, 0.5, 0.5,
2, -3.829368, -6.547761, 0, 1.5, 0.5, 0.5,
3, -3.829368, -6.547761, 0, -0.5, 0.5, 0.5,
3, -3.829368, -6.547761, 1, -0.5, 0.5, 0.5,
3, -3.829368, -6.547761, 1, 1.5, 0.5, 0.5,
3, -3.829368, -6.547761, 0, 1.5, 0.5, 0.5
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
-3.360295, -3, -5.747326,
-3.360295, 2, -5.747326,
-3.360295, -3, -5.747326,
-3.531693, -3, -6.014138,
-3.360295, -2, -5.747326,
-3.531693, -2, -6.014138,
-3.360295, -1, -5.747326,
-3.531693, -1, -6.014138,
-3.360295, 0, -5.747326,
-3.531693, 0, -6.014138,
-3.360295, 1, -5.747326,
-3.531693, 1, -6.014138,
-3.360295, 2, -5.747326,
-3.531693, 2, -6.014138
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
-3.874488, -3, -6.547761, 0, -0.5, 0.5, 0.5,
-3.874488, -3, -6.547761, 1, -0.5, 0.5, 0.5,
-3.874488, -3, -6.547761, 1, 1.5, 0.5, 0.5,
-3.874488, -3, -6.547761, 0, 1.5, 0.5, 0.5,
-3.874488, -2, -6.547761, 0, -0.5, 0.5, 0.5,
-3.874488, -2, -6.547761, 1, -0.5, 0.5, 0.5,
-3.874488, -2, -6.547761, 1, 1.5, 0.5, 0.5,
-3.874488, -2, -6.547761, 0, 1.5, 0.5, 0.5,
-3.874488, -1, -6.547761, 0, -0.5, 0.5, 0.5,
-3.874488, -1, -6.547761, 1, -0.5, 0.5, 0.5,
-3.874488, -1, -6.547761, 1, 1.5, 0.5, 0.5,
-3.874488, -1, -6.547761, 0, 1.5, 0.5, 0.5,
-3.874488, 0, -6.547761, 0, -0.5, 0.5, 0.5,
-3.874488, 0, -6.547761, 1, -0.5, 0.5, 0.5,
-3.874488, 0, -6.547761, 1, 1.5, 0.5, 0.5,
-3.874488, 0, -6.547761, 0, 1.5, 0.5, 0.5,
-3.874488, 1, -6.547761, 0, -0.5, 0.5, 0.5,
-3.874488, 1, -6.547761, 1, -0.5, 0.5, 0.5,
-3.874488, 1, -6.547761, 1, 1.5, 0.5, 0.5,
-3.874488, 1, -6.547761, 0, 1.5, 0.5, 0.5,
-3.874488, 2, -6.547761, 0, -0.5, 0.5, 0.5,
-3.874488, 2, -6.547761, 1, -0.5, 0.5, 0.5,
-3.874488, 2, -6.547761, 1, 1.5, 0.5, 0.5,
-3.874488, 2, -6.547761, 0, 1.5, 0.5, 0.5
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
-3.360295, -3.34982, -4,
-3.360295, -3.34982, 4,
-3.360295, -3.34982, -4,
-3.531693, -3.509669, -4,
-3.360295, -3.34982, -2,
-3.531693, -3.509669, -2,
-3.360295, -3.34982, 0,
-3.531693, -3.509669, 0,
-3.360295, -3.34982, 2,
-3.531693, -3.509669, 2,
-3.360295, -3.34982, 4,
-3.531693, -3.509669, 4
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
-3.874488, -3.829368, -4, 0, -0.5, 0.5, 0.5,
-3.874488, -3.829368, -4, 1, -0.5, 0.5, 0.5,
-3.874488, -3.829368, -4, 1, 1.5, 0.5, 0.5,
-3.874488, -3.829368, -4, 0, 1.5, 0.5, 0.5,
-3.874488, -3.829368, -2, 0, -0.5, 0.5, 0.5,
-3.874488, -3.829368, -2, 1, -0.5, 0.5, 0.5,
-3.874488, -3.829368, -2, 1, 1.5, 0.5, 0.5,
-3.874488, -3.829368, -2, 0, 1.5, 0.5, 0.5,
-3.874488, -3.829368, 0, 0, -0.5, 0.5, 0.5,
-3.874488, -3.829368, 0, 1, -0.5, 0.5, 0.5,
-3.874488, -3.829368, 0, 1, 1.5, 0.5, 0.5,
-3.874488, -3.829368, 0, 0, 1.5, 0.5, 0.5,
-3.874488, -3.829368, 2, 0, -0.5, 0.5, 0.5,
-3.874488, -3.829368, 2, 1, -0.5, 0.5, 0.5,
-3.874488, -3.829368, 2, 1, 1.5, 0.5, 0.5,
-3.874488, -3.829368, 2, 0, 1.5, 0.5, 0.5,
-3.874488, -3.829368, 4, 0, -0.5, 0.5, 0.5,
-3.874488, -3.829368, 4, 1, -0.5, 0.5, 0.5,
-3.874488, -3.829368, 4, 1, 1.5, 0.5, 0.5,
-3.874488, -3.829368, 4, 0, 1.5, 0.5, 0.5
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
-3.360295, -3.34982, -5.747326,
-3.360295, 3.044158, -5.747326,
-3.360295, -3.34982, 4.925143,
-3.360295, 3.044158, 4.925143,
-3.360295, -3.34982, -5.747326,
-3.360295, -3.34982, 4.925143,
-3.360295, 3.044158, -5.747326,
-3.360295, 3.044158, 4.925143,
-3.360295, -3.34982, -5.747326,
3.4956, -3.34982, -5.747326,
-3.360295, -3.34982, 4.925143,
3.4956, -3.34982, 4.925143,
-3.360295, 3.044158, -5.747326,
3.4956, 3.044158, -5.747326,
-3.360295, 3.044158, 4.925143,
3.4956, 3.044158, 4.925143,
3.4956, -3.34982, -5.747326,
3.4956, 3.044158, -5.747326,
3.4956, -3.34982, 4.925143,
3.4956, 3.044158, 4.925143,
3.4956, -3.34982, -5.747326,
3.4956, -3.34982, 4.925143,
3.4956, 3.044158, -5.747326,
3.4956, 3.044158, 4.925143
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
var radius = 7.585304;
var distance = 33.74788;
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
mvMatrix.translate( -0.06765223, 0.1528307, 0.4110913 );
mvMatrix.scale( 1.196252, 1.282672, 0.7684612 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.74788);
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
Fenamiphos<-read.table("Fenamiphos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Fenamiphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Fenamiphos' not found
```

```r
y<-Fenamiphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Fenamiphos' not found
```

```r
z<-Fenamiphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Fenamiphos' not found
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
-3.260452, 0.4757209, -0.337051, 0, 0, 1, 1, 1,
-2.678942, 2.706475, -1.3159, 1, 0, 0, 1, 1,
-2.460292, 1.07479, -1.117508, 1, 0, 0, 1, 1,
-2.45377, -0.5376286, -2.856978, 1, 0, 0, 1, 1,
-2.357146, -2.388618, -2.403986, 1, 0, 0, 1, 1,
-2.341548, -1.321011, -2.799712, 1, 0, 0, 1, 1,
-2.333304, 1.512219, -0.5009291, 0, 0, 0, 1, 1,
-2.289558, 0.553094, -1.207311, 0, 0, 0, 1, 1,
-2.225733, -1.433218, -2.941136, 0, 0, 0, 1, 1,
-2.218529, 0.3982985, -2.522796, 0, 0, 0, 1, 1,
-2.191978, -0.7049397, -1.794466, 0, 0, 0, 1, 1,
-2.149415, -0.1174665, -1.120395, 0, 0, 0, 1, 1,
-2.138921, -0.374974, -0.9532506, 0, 0, 0, 1, 1,
-2.12417, 0.2027539, -1.526459, 1, 1, 1, 1, 1,
-2.085422, -1.489775, -2.305027, 1, 1, 1, 1, 1,
-2.083864, -0.237954, -2.120839, 1, 1, 1, 1, 1,
-2.050005, 1.797121, -1.165615, 1, 1, 1, 1, 1,
-2.022205, 1.691745, 0.1831283, 1, 1, 1, 1, 1,
-2.003821, -0.3434317, -2.076622, 1, 1, 1, 1, 1,
-1.980151, -0.2362385, -0.206867, 1, 1, 1, 1, 1,
-1.971298, 2.565998, -0.6616631, 1, 1, 1, 1, 1,
-1.966709, 0.04903238, -0.7932231, 1, 1, 1, 1, 1,
-1.938305, -0.01264385, -2.213748, 1, 1, 1, 1, 1,
-1.927433, 1.332138, -1.315018, 1, 1, 1, 1, 1,
-1.921708, -1.594084, -1.55421, 1, 1, 1, 1, 1,
-1.920285, -0.1484409, -2.774345, 1, 1, 1, 1, 1,
-1.91915, 2.442263, -0.8194725, 1, 1, 1, 1, 1,
-1.869289, -1.856258, -3.500396, 1, 1, 1, 1, 1,
-1.867111, -1.70756, -0.8672953, 0, 0, 1, 1, 1,
-1.864223, 1.054922, -2.098786, 1, 0, 0, 1, 1,
-1.845271, 0.5245372, -0.6399695, 1, 0, 0, 1, 1,
-1.83104, 0.7399443, -2.94773, 1, 0, 0, 1, 1,
-1.830407, 0.0625748, 0.0496436, 1, 0, 0, 1, 1,
-1.76704, -0.9589198, -2.040954, 1, 0, 0, 1, 1,
-1.747343, -1.068586, -4.801426, 0, 0, 0, 1, 1,
-1.74293, -0.4078277, 0.4953766, 0, 0, 0, 1, 1,
-1.741548, 0.7436924, -1.928004, 0, 0, 0, 1, 1,
-1.730953, -1.25719, -2.600135, 0, 0, 0, 1, 1,
-1.720006, -0.904124, -2.746146, 0, 0, 0, 1, 1,
-1.690745, -1.544233, -2.823926, 0, 0, 0, 1, 1,
-1.670696, -0.1975089, -2.774913, 0, 0, 0, 1, 1,
-1.667009, 0.8285676, -2.760681, 1, 1, 1, 1, 1,
-1.631785, 0.6348848, -1.434713, 1, 1, 1, 1, 1,
-1.629651, 0.7664336, 1.029039, 1, 1, 1, 1, 1,
-1.624826, -1.391684, -2.514185, 1, 1, 1, 1, 1,
-1.601662, 1.135474, -2.039877, 1, 1, 1, 1, 1,
-1.597841, -1.264529, -1.544442, 1, 1, 1, 1, 1,
-1.589172, -1.107751, -3.179343, 1, 1, 1, 1, 1,
-1.575514, -0.7137694, -1.727352, 1, 1, 1, 1, 1,
-1.568014, 0.06713457, -1.326029, 1, 1, 1, 1, 1,
-1.562313, -1.232793, -4.218007, 1, 1, 1, 1, 1,
-1.560674, -0.7557696, -1.444829, 1, 1, 1, 1, 1,
-1.550639, -0.7692667, -2.27614, 1, 1, 1, 1, 1,
-1.546379, -2.178855, -3.306468, 1, 1, 1, 1, 1,
-1.540437, -0.052217, -2.444228, 1, 1, 1, 1, 1,
-1.527659, 2.129614, -1.70006, 1, 1, 1, 1, 1,
-1.509502, 0.1424234, -3.097208, 0, 0, 1, 1, 1,
-1.496398, 1.186173, -0.1343777, 1, 0, 0, 1, 1,
-1.493286, -1.094198, -3.200247, 1, 0, 0, 1, 1,
-1.471237, 0.66665, -2.335644, 1, 0, 0, 1, 1,
-1.470715, 0.193003, -0.2623591, 1, 0, 0, 1, 1,
-1.469718, 0.3196798, -2.968954, 1, 0, 0, 1, 1,
-1.466915, -1.184207, -2.686868, 0, 0, 0, 1, 1,
-1.460121, 0.3292724, -0.4229575, 0, 0, 0, 1, 1,
-1.458635, 0.414922, -1.52031, 0, 0, 0, 1, 1,
-1.458426, -1.038878, -2.66887, 0, 0, 0, 1, 1,
-1.444188, 0.5135537, -0.4408373, 0, 0, 0, 1, 1,
-1.442185, 1.956147, 1.686696, 0, 0, 0, 1, 1,
-1.439741, -0.6810098, -2.220276, 0, 0, 0, 1, 1,
-1.42222, 0.9154314, -1.320059, 1, 1, 1, 1, 1,
-1.41073, -0.3634391, -4.793684, 1, 1, 1, 1, 1,
-1.389635, 0.4225705, -2.766746, 1, 1, 1, 1, 1,
-1.383577, -0.100887, -2.76877, 1, 1, 1, 1, 1,
-1.383369, 0.08082653, -0.911995, 1, 1, 1, 1, 1,
-1.380732, -1.223386, -1.674682, 1, 1, 1, 1, 1,
-1.377092, -1.578915, -1.508388, 1, 1, 1, 1, 1,
-1.37574, -1.139672, -2.915697, 1, 1, 1, 1, 1,
-1.369143, -0.606306, -1.253969, 1, 1, 1, 1, 1,
-1.36061, -1.304729, -0.04211842, 1, 1, 1, 1, 1,
-1.354808, -0.0926973, -0.8895602, 1, 1, 1, 1, 1,
-1.350073, -2.189509, -3.442902, 1, 1, 1, 1, 1,
-1.347812, -0.2620315, -2.672605, 1, 1, 1, 1, 1,
-1.344299, 0.1257552, -3.357023, 1, 1, 1, 1, 1,
-1.344095, -0.9070958, -1.622797, 1, 1, 1, 1, 1,
-1.342546, -1.182888, -2.615789, 0, 0, 1, 1, 1,
-1.334477, 0.416578, -1.272183, 1, 0, 0, 1, 1,
-1.327858, 1.398877, -0.3670554, 1, 0, 0, 1, 1,
-1.318627, 0.4479785, 0.3076512, 1, 0, 0, 1, 1,
-1.315045, -0.4624803, -2.581911, 1, 0, 0, 1, 1,
-1.307348, 0.2435111, -1.401142, 1, 0, 0, 1, 1,
-1.307342, 0.2238176, -2.647378, 0, 0, 0, 1, 1,
-1.303842, 0.1561197, -2.421356, 0, 0, 0, 1, 1,
-1.297688, -0.6020721, -1.617686, 0, 0, 0, 1, 1,
-1.295797, -1.262413, 0.5354503, 0, 0, 0, 1, 1,
-1.281969, 2.454395, 0.06603123, 0, 0, 0, 1, 1,
-1.277656, 0.1099294, 0.3923654, 0, 0, 0, 1, 1,
-1.275674, 0.1922742, -2.270369, 0, 0, 0, 1, 1,
-1.275074, -0.05849122, -1.254056, 1, 1, 1, 1, 1,
-1.269963, 0.555778, -2.453101, 1, 1, 1, 1, 1,
-1.26577, -2.138507, -2.386864, 1, 1, 1, 1, 1,
-1.260974, 0.4884447, -1.191571, 1, 1, 1, 1, 1,
-1.260375, 1.855043, 0.3651973, 1, 1, 1, 1, 1,
-1.259902, 0.7172296, -1.895005, 1, 1, 1, 1, 1,
-1.259458, -1.516296, -0.8440151, 1, 1, 1, 1, 1,
-1.253215, 0.9210277, -0.5378043, 1, 1, 1, 1, 1,
-1.243538, -1.132503, -2.773606, 1, 1, 1, 1, 1,
-1.242176, -1.132676, -2.379643, 1, 1, 1, 1, 1,
-1.238117, 0.02253804, 0.1178615, 1, 1, 1, 1, 1,
-1.235468, -1.509152, -3.505543, 1, 1, 1, 1, 1,
-1.234866, -0.2992831, -1.66063, 1, 1, 1, 1, 1,
-1.232145, -1.017362, -3.574231, 1, 1, 1, 1, 1,
-1.229256, -1.195674, -1.637181, 1, 1, 1, 1, 1,
-1.22165, -0.8654994, -1.877487, 0, 0, 1, 1, 1,
-1.218296, -0.645303, -0.9303682, 1, 0, 0, 1, 1,
-1.217323, 1.32737, 0.5926118, 1, 0, 0, 1, 1,
-1.214985, -1.174776, -2.29348, 1, 0, 0, 1, 1,
-1.209126, 0.689791, -1.009317, 1, 0, 0, 1, 1,
-1.198003, -0.2528797, -1.560871, 1, 0, 0, 1, 1,
-1.196213, -1.83917, -2.065677, 0, 0, 0, 1, 1,
-1.194941, -0.36375, -1.876143, 0, 0, 0, 1, 1,
-1.186654, 0.1858129, -2.941772, 0, 0, 0, 1, 1,
-1.165174, -0.3353142, -2.215415, 0, 0, 0, 1, 1,
-1.156572, -0.5860398, -2.261708, 0, 0, 0, 1, 1,
-1.155457, 0.7057362, -1.511443, 0, 0, 0, 1, 1,
-1.146544, 1.186697, 0.6758455, 0, 0, 0, 1, 1,
-1.141302, -0.7818805, -2.026447, 1, 1, 1, 1, 1,
-1.131543, 2.159048, -0.04006432, 1, 1, 1, 1, 1,
-1.121056, -1.257472, -3.053112, 1, 1, 1, 1, 1,
-1.120692, -0.5803492, -1.493947, 1, 1, 1, 1, 1,
-1.118454, 0.8295447, -1.898118, 1, 1, 1, 1, 1,
-1.117857, 0.6605586, -0.8315231, 1, 1, 1, 1, 1,
-1.111645, -2.053645, -1.913153, 1, 1, 1, 1, 1,
-1.11, -0.9817853, -3.045296, 1, 1, 1, 1, 1,
-1.108276, 1.421075, -1.600174, 1, 1, 1, 1, 1,
-1.105425, 0.9606459, -0.2914611, 1, 1, 1, 1, 1,
-1.103026, -0.8499578, -0.6854787, 1, 1, 1, 1, 1,
-1.100072, -1.627276, -2.073687, 1, 1, 1, 1, 1,
-1.089626, 1.824306, -0.739034, 1, 1, 1, 1, 1,
-1.068941, -0.7060474, -2.195166, 1, 1, 1, 1, 1,
-1.068215, -0.2258376, -1.942517, 1, 1, 1, 1, 1,
-1.06646, -0.3495233, -2.686343, 0, 0, 1, 1, 1,
-1.063774, -0.5363038, -1.367059, 1, 0, 0, 1, 1,
-1.058663, -0.4549289, -2.504843, 1, 0, 0, 1, 1,
-1.058308, -0.5442541, -2.474425, 1, 0, 0, 1, 1,
-1.050796, 0.05691101, -2.043234, 1, 0, 0, 1, 1,
-1.047622, 0.6294338, -0.8003653, 1, 0, 0, 1, 1,
-1.041672, 0.226914, -1.687022, 0, 0, 0, 1, 1,
-1.03926, -0.1268577, -2.222339, 0, 0, 0, 1, 1,
-1.038341, -0.2968, -2.038267, 0, 0, 0, 1, 1,
-1.034524, -1.249105, -1.877609, 0, 0, 0, 1, 1,
-1.033438, -0.8264509, -2.80658, 0, 0, 0, 1, 1,
-1.025961, 0.4892176, -1.650682, 0, 0, 0, 1, 1,
-1.013258, -0.3262027, -1.717282, 0, 0, 0, 1, 1,
-1.012241, 0.6950352, -1.498503, 1, 1, 1, 1, 1,
-1.009945, 0.4139473, -1.40996, 1, 1, 1, 1, 1,
-1.007882, 0.08837873, -1.728964, 1, 1, 1, 1, 1,
-1.00484, 0.9037399, -1.191469, 1, 1, 1, 1, 1,
-0.9960507, -0.8319146, -3.539366, 1, 1, 1, 1, 1,
-0.9947606, 0.9539878, 0.5595374, 1, 1, 1, 1, 1,
-0.9934077, 0.9565349, -1.240679, 1, 1, 1, 1, 1,
-0.9901477, -0.3572393, -2.431476, 1, 1, 1, 1, 1,
-0.9894378, -0.9948713, -2.640559, 1, 1, 1, 1, 1,
-0.9778578, -1.147639, -4.22085, 1, 1, 1, 1, 1,
-0.9777896, -0.133709, -0.5893211, 1, 1, 1, 1, 1,
-0.9769163, -1.54098, -2.346607, 1, 1, 1, 1, 1,
-0.9716789, 0.5617896, -0.6251246, 1, 1, 1, 1, 1,
-0.9679765, -1.244544, -2.640185, 1, 1, 1, 1, 1,
-0.9678692, -0.3340627, -2.371554, 1, 1, 1, 1, 1,
-0.9589126, -1.006029, -3.121135, 0, 0, 1, 1, 1,
-0.9447312, -1.270877, -2.923043, 1, 0, 0, 1, 1,
-0.9379726, -0.5925487, -2.417731, 1, 0, 0, 1, 1,
-0.9379355, -0.2935493, -1.501882, 1, 0, 0, 1, 1,
-0.9239689, -0.9753988, -3.138882, 1, 0, 0, 1, 1,
-0.9234613, -1.320369, -2.079947, 1, 0, 0, 1, 1,
-0.9210325, 0.5609584, -2.068904, 0, 0, 0, 1, 1,
-0.9176472, 0.6953996, 1.376259, 0, 0, 0, 1, 1,
-0.9153727, -0.9187418, -2.165118, 0, 0, 0, 1, 1,
-0.9113205, 1.353711, -2.049016, 0, 0, 0, 1, 1,
-0.9056777, -1.033299, -1.900739, 0, 0, 0, 1, 1,
-0.9015319, -0.4345345, -2.006612, 0, 0, 0, 1, 1,
-0.8967964, -0.1791423, -1.715902, 0, 0, 0, 1, 1,
-0.8960976, -1.333796, -2.824356, 1, 1, 1, 1, 1,
-0.8951564, 1.152848, 0.0864862, 1, 1, 1, 1, 1,
-0.8926562, -0.9766981, -1.526737, 1, 1, 1, 1, 1,
-0.8876048, 0.1403991, -1.323671, 1, 1, 1, 1, 1,
-0.8859583, 1.902918, -0.865423, 1, 1, 1, 1, 1,
-0.8758977, 0.09942552, -0.4534958, 1, 1, 1, 1, 1,
-0.8744019, 1.273166, -0.8995901, 1, 1, 1, 1, 1,
-0.8708686, 0.8792955, -0.3324011, 1, 1, 1, 1, 1,
-0.8604019, 0.8111016, -0.5838222, 1, 1, 1, 1, 1,
-0.85583, 0.0282413, -2.077139, 1, 1, 1, 1, 1,
-0.8544272, 0.7535698, -2.851845, 1, 1, 1, 1, 1,
-0.8531992, 0.8650998, 0.9501814, 1, 1, 1, 1, 1,
-0.8530219, -0.446161, -2.526551, 1, 1, 1, 1, 1,
-0.8521733, 0.2295718, 0.7521629, 1, 1, 1, 1, 1,
-0.851999, 1.020362, -0.4258834, 1, 1, 1, 1, 1,
-0.8485717, 1.655722, -0.2695719, 0, 0, 1, 1, 1,
-0.8459544, 0.7797346, -1.638262, 1, 0, 0, 1, 1,
-0.8436843, 0.9196578, -0.2464915, 1, 0, 0, 1, 1,
-0.8385585, 1.435078, -1.209887, 1, 0, 0, 1, 1,
-0.8330288, -0.9297329, -2.80423, 1, 0, 0, 1, 1,
-0.813266, 1.348981, -0.5979272, 1, 0, 0, 1, 1,
-0.8079374, 0.491767, -1.232964, 0, 0, 0, 1, 1,
-0.8054774, -1.201325, -1.895144, 0, 0, 0, 1, 1,
-0.7983716, 0.3554683, -2.31848, 0, 0, 0, 1, 1,
-0.7887374, -1.203344, -3.716585, 0, 0, 0, 1, 1,
-0.7864699, 1.851837, -1.554463, 0, 0, 0, 1, 1,
-0.7818589, -0.505539, -3.039011, 0, 0, 0, 1, 1,
-0.7784215, -0.09078362, -3.354581, 0, 0, 0, 1, 1,
-0.7758868, 0.5812818, -1.373266, 1, 1, 1, 1, 1,
-0.7756053, 1.26194, -1.873457, 1, 1, 1, 1, 1,
-0.7709324, 0.04239738, -0.9324356, 1, 1, 1, 1, 1,
-0.7695895, -0.3125268, -0.9494963, 1, 1, 1, 1, 1,
-0.767345, -1.001047, -3.04621, 1, 1, 1, 1, 1,
-0.7655913, 0.890916, -1.047098, 1, 1, 1, 1, 1,
-0.7650313, -0.8144619, -3.13915, 1, 1, 1, 1, 1,
-0.7612189, 1.287281, 0.008736939, 1, 1, 1, 1, 1,
-0.7514215, -1.167898, -2.871473, 1, 1, 1, 1, 1,
-0.7495678, 1.634795, 0.5222515, 1, 1, 1, 1, 1,
-0.7443823, -1.513842, -1.03728, 1, 1, 1, 1, 1,
-0.7420852, -1.408021, -3.201078, 1, 1, 1, 1, 1,
-0.7413348, 1.475611, -0.703705, 1, 1, 1, 1, 1,
-0.7396677, 0.2128351, -1.326994, 1, 1, 1, 1, 1,
-0.7353258, 0.6127476, -1.363898, 1, 1, 1, 1, 1,
-0.7342776, -1.919852, -3.317204, 0, 0, 1, 1, 1,
-0.7242731, 0.7329003, -0.2102685, 1, 0, 0, 1, 1,
-0.7228253, 1.702145, -1.873668, 1, 0, 0, 1, 1,
-0.7209848, -0.8277052, -2.479842, 1, 0, 0, 1, 1,
-0.7172725, 1.093299, -0.4077307, 1, 0, 0, 1, 1,
-0.6799414, -0.984373, -2.877069, 1, 0, 0, 1, 1,
-0.676266, -3.256703, -5.591902, 0, 0, 0, 1, 1,
-0.6733757, -1.796318, -3.202423, 0, 0, 0, 1, 1,
-0.6687826, 1.353101, -0.7117339, 0, 0, 0, 1, 1,
-0.6664094, 0.4056375, -2.745072, 0, 0, 0, 1, 1,
-0.6566072, -1.548857, -2.280894, 0, 0, 0, 1, 1,
-0.6562899, -0.7297774, -2.368129, 0, 0, 0, 1, 1,
-0.654353, -1.007513, -5.243963, 0, 0, 0, 1, 1,
-0.6543049, 0.4567991, -1.18013, 1, 1, 1, 1, 1,
-0.6531835, -0.3666167, -2.218004, 1, 1, 1, 1, 1,
-0.6489253, 2.020123, 0.06996533, 1, 1, 1, 1, 1,
-0.6460856, 0.03768269, -1.326927, 1, 1, 1, 1, 1,
-0.6448205, 1.232632, 0.9570208, 1, 1, 1, 1, 1,
-0.644647, -0.9199063, -1.582762, 1, 1, 1, 1, 1,
-0.6439982, 0.7593592, -0.02122999, 1, 1, 1, 1, 1,
-0.6365935, 0.498665, -0.8592767, 1, 1, 1, 1, 1,
-0.6335841, 1.282617, -2.508733, 1, 1, 1, 1, 1,
-0.6314791, -0.7672971, -1.435773, 1, 1, 1, 1, 1,
-0.6296929, -1.105855, -1.27156, 1, 1, 1, 1, 1,
-0.6221405, 1.142853, -1.768318, 1, 1, 1, 1, 1,
-0.6217273, -0.6371758, -3.884425, 1, 1, 1, 1, 1,
-0.6188219, 0.7891281, 0.3822351, 1, 1, 1, 1, 1,
-0.6154613, 0.9365818, -0.2028973, 1, 1, 1, 1, 1,
-0.6130351, -1.014112, -2.805594, 0, 0, 1, 1, 1,
-0.6120308, -1.409582, -3.085483, 1, 0, 0, 1, 1,
-0.6118327, -0.6142468, -1.942319, 1, 0, 0, 1, 1,
-0.6108832, 0.6952873, -2.191808, 1, 0, 0, 1, 1,
-0.6084142, -1.09095, -1.212201, 1, 0, 0, 1, 1,
-0.6044564, 0.8576339, -1.12227, 1, 0, 0, 1, 1,
-0.6019526, -0.2112129, -2.450241, 0, 0, 0, 1, 1,
-0.5988314, -0.869675, -2.210423, 0, 0, 0, 1, 1,
-0.5976506, -0.4609081, -3.083236, 0, 0, 0, 1, 1,
-0.596023, -0.8026735, -3.212669, 0, 0, 0, 1, 1,
-0.5956177, -0.9640335, -2.742607, 0, 0, 0, 1, 1,
-0.5932813, -1.596171, -2.553637, 0, 0, 0, 1, 1,
-0.5921843, -0.6938142, -4.42081, 0, 0, 0, 1, 1,
-0.5909188, -1.270645, -3.130849, 1, 1, 1, 1, 1,
-0.587476, -0.2201406, -2.491822, 1, 1, 1, 1, 1,
-0.586815, 0.4091459, 0.4957087, 1, 1, 1, 1, 1,
-0.5836386, 0.7232903, 0.2622536, 1, 1, 1, 1, 1,
-0.5827406, -1.583371, -3.306804, 1, 1, 1, 1, 1,
-0.5827307, -0.7545673, -3.156225, 1, 1, 1, 1, 1,
-0.5794472, 0.1892403, -2.851244, 1, 1, 1, 1, 1,
-0.5759273, 0.04553623, -2.66801, 1, 1, 1, 1, 1,
-0.5731338, 1.046974, -1.478002, 1, 1, 1, 1, 1,
-0.5694366, 0.3682342, 0.893145, 1, 1, 1, 1, 1,
-0.5679554, -0.3918014, -3.844888, 1, 1, 1, 1, 1,
-0.5646472, 0.3188584, -1.182852, 1, 1, 1, 1, 1,
-0.5634145, 0.1025553, -0.9283648, 1, 1, 1, 1, 1,
-0.5592759, 0.1114125, -0.6696038, 1, 1, 1, 1, 1,
-0.5589107, 0.5763163, -1.799874, 1, 1, 1, 1, 1,
-0.5571284, -0.3259599, -1.966102, 0, 0, 1, 1, 1,
-0.5531027, -1.874509, -2.987959, 1, 0, 0, 1, 1,
-0.5475752, -0.2332405, -2.143169, 1, 0, 0, 1, 1,
-0.5467679, 1.478814, -1.183629, 1, 0, 0, 1, 1,
-0.5447303, -1.269397, -2.204096, 1, 0, 0, 1, 1,
-0.536467, 0.9663715, -0.2482051, 1, 0, 0, 1, 1,
-0.5317721, -0.10447, -4.253524, 0, 0, 0, 1, 1,
-0.5302508, -0.7262838, -1.386774, 0, 0, 0, 1, 1,
-0.5294263, 1.62354, -0.4240816, 0, 0, 0, 1, 1,
-0.5232767, -0.09957825, 0.06475312, 0, 0, 0, 1, 1,
-0.5188111, 0.5522066, 0.2466149, 0, 0, 0, 1, 1,
-0.5179965, -0.00121938, -3.075109, 0, 0, 0, 1, 1,
-0.5139869, -1.261901, -2.764345, 0, 0, 0, 1, 1,
-0.5117214, -0.4894007, -1.615684, 1, 1, 1, 1, 1,
-0.5108598, -0.9592661, -2.932108, 1, 1, 1, 1, 1,
-0.5050031, -1.479133, -2.450856, 1, 1, 1, 1, 1,
-0.5041402, 0.7975973, -0.3849153, 1, 1, 1, 1, 1,
-0.5030524, -0.3909643, -3.180555, 1, 1, 1, 1, 1,
-0.5008739, 0.6852953, 0.4966156, 1, 1, 1, 1, 1,
-0.4987649, 0.679989, -3.055569, 1, 1, 1, 1, 1,
-0.4987567, -1.101696, -2.754021, 1, 1, 1, 1, 1,
-0.4941026, 0.888148, -1.114196, 1, 1, 1, 1, 1,
-0.4924846, 0.4469198, -1.107118, 1, 1, 1, 1, 1,
-0.4911273, 0.2353198, -1.150751, 1, 1, 1, 1, 1,
-0.4853173, 1.402539, -1.959261, 1, 1, 1, 1, 1,
-0.4811836, -0.6644403, -3.110622, 1, 1, 1, 1, 1,
-0.4798151, -0.7423719, -2.434435, 1, 1, 1, 1, 1,
-0.4790322, -1.212645, -2.831342, 1, 1, 1, 1, 1,
-0.4741645, -1.227616, -2.947861, 0, 0, 1, 1, 1,
-0.4716016, -0.03763344, -2.767384, 1, 0, 0, 1, 1,
-0.4690252, 0.2950273, -0.968605, 1, 0, 0, 1, 1,
-0.4684777, -1.443802, -3.413936, 1, 0, 0, 1, 1,
-0.4678936, -2.080099, -1.056175, 1, 0, 0, 1, 1,
-0.4523429, -0.5149838, -3.742343, 1, 0, 0, 1, 1,
-0.4514737, 1.253919, 0.4851037, 0, 0, 0, 1, 1,
-0.4482954, 0.7072716, -1.127535, 0, 0, 0, 1, 1,
-0.4475117, 0.2225714, -1.913908, 0, 0, 0, 1, 1,
-0.4470472, -0.7282255, -2.332656, 0, 0, 0, 1, 1,
-0.4452795, -0.78984, -0.3788036, 0, 0, 0, 1, 1,
-0.4422419, -0.2013321, -1.781314, 0, 0, 0, 1, 1,
-0.4399355, 0.6131926, -1.633036, 0, 0, 0, 1, 1,
-0.4373427, 0.07896818, -2.156473, 1, 1, 1, 1, 1,
-0.4351664, -0.2512408, -3.561737, 1, 1, 1, 1, 1,
-0.4346863, 0.9909307, -0.6734897, 1, 1, 1, 1, 1,
-0.4343691, -1.032168, -2.290407, 1, 1, 1, 1, 1,
-0.4330579, 0.6774194, -1.731876, 1, 1, 1, 1, 1,
-0.4298159, 1.12196, -0.753131, 1, 1, 1, 1, 1,
-0.4288346, -0.3704652, -0.3616538, 1, 1, 1, 1, 1,
-0.4287098, 1.077939, -0.8885621, 1, 1, 1, 1, 1,
-0.4266112, -0.8542284, -2.899134, 1, 1, 1, 1, 1,
-0.4242032, -0.4319264, -2.841377, 1, 1, 1, 1, 1,
-0.4218121, 1.613267, -2.705034, 1, 1, 1, 1, 1,
-0.4213915, -1.234869, -4.358644, 1, 1, 1, 1, 1,
-0.4203486, 0.04860855, -1.152903, 1, 1, 1, 1, 1,
-0.4194154, 0.647786, 0.7245947, 1, 1, 1, 1, 1,
-0.4162258, 0.07827692, -1.663468, 1, 1, 1, 1, 1,
-0.4124595, -0.8201867, -2.377171, 0, 0, 1, 1, 1,
-0.4120953, 0.6840869, 0.5491613, 1, 0, 0, 1, 1,
-0.4076132, -0.2039169, -1.626315, 1, 0, 0, 1, 1,
-0.4066285, -0.04728646, -1.79374, 1, 0, 0, 1, 1,
-0.4046586, 0.1461516, -2.56197, 1, 0, 0, 1, 1,
-0.4034544, 0.7864342, -1.386409, 1, 0, 0, 1, 1,
-0.4006929, 0.00889384, -2.422649, 0, 0, 0, 1, 1,
-0.3986063, -1.287329, -2.958938, 0, 0, 0, 1, 1,
-0.392576, 1.209214, -0.3088852, 0, 0, 0, 1, 1,
-0.390749, -0.3917808, -3.141619, 0, 0, 0, 1, 1,
-0.3874788, 0.1619937, -3.35734, 0, 0, 0, 1, 1,
-0.3839711, -0.6517127, -2.571547, 0, 0, 0, 1, 1,
-0.3805406, 1.56037, 0.7681965, 0, 0, 0, 1, 1,
-0.3769549, -1.482129, -4.762406, 1, 1, 1, 1, 1,
-0.3760149, -0.4508432, -1.688716, 1, 1, 1, 1, 1,
-0.3758934, 0.3035544, -1.893616, 1, 1, 1, 1, 1,
-0.3727341, 1.230917, -1.027688, 1, 1, 1, 1, 1,
-0.3697565, -0.3566124, -2.168805, 1, 1, 1, 1, 1,
-0.3671507, 1.287097, -0.1860645, 1, 1, 1, 1, 1,
-0.363192, -0.1223044, -3.37247, 1, 1, 1, 1, 1,
-0.3630046, 0.9518932, 0.2108195, 1, 1, 1, 1, 1,
-0.3611319, -0.6934147, -2.765544, 1, 1, 1, 1, 1,
-0.3583981, 0.84917, 0.1125075, 1, 1, 1, 1, 1,
-0.3569742, -0.7123998, -3.341737, 1, 1, 1, 1, 1,
-0.3526387, -1.809303, -3.366956, 1, 1, 1, 1, 1,
-0.3522714, -2.319867, -4.380903, 1, 1, 1, 1, 1,
-0.3522511, -0.2859739, -2.620427, 1, 1, 1, 1, 1,
-0.3521962, 0.000329703, -0.7366326, 1, 1, 1, 1, 1,
-0.3518128, -0.5548242, -2.9456, 0, 0, 1, 1, 1,
-0.3506564, 1.461293, -1.351979, 1, 0, 0, 1, 1,
-0.3485952, -0.08492333, -3.69717, 1, 0, 0, 1, 1,
-0.3439647, 0.1809149, -1.684223, 1, 0, 0, 1, 1,
-0.33968, -0.7491335, -3.290293, 1, 0, 0, 1, 1,
-0.3394968, 0.2180492, -1.606142, 1, 0, 0, 1, 1,
-0.339138, 0.009866459, -3.636149, 0, 0, 0, 1, 1,
-0.3378807, 1.33938, -0.3855216, 0, 0, 0, 1, 1,
-0.3341128, -1.213064, -1.356025, 0, 0, 0, 1, 1,
-0.3338383, -0.696515, -1.804712, 0, 0, 0, 1, 1,
-0.333511, -1.437218, -2.787476, 0, 0, 0, 1, 1,
-0.3323997, -1.117123, -3.104286, 0, 0, 0, 1, 1,
-0.3312401, -1.62029, -2.284725, 0, 0, 0, 1, 1,
-0.3308808, -0.860007, -3.690428, 1, 1, 1, 1, 1,
-0.3260958, -0.9292989, -3.116158, 1, 1, 1, 1, 1,
-0.3251498, 0.699407, 0.039551, 1, 1, 1, 1, 1,
-0.3244177, -0.8926781, -2.087389, 1, 1, 1, 1, 1,
-0.3119269, -0.8159729, -2.30768, 1, 1, 1, 1, 1,
-0.3088294, -0.6577082, -2.974325, 1, 1, 1, 1, 1,
-0.3086338, 0.0370987, -2.145274, 1, 1, 1, 1, 1,
-0.3058419, 0.09996136, -1.206636, 1, 1, 1, 1, 1,
-0.3050219, -0.4474532, -2.21207, 1, 1, 1, 1, 1,
-0.3047577, -0.5304594, -0.9832602, 1, 1, 1, 1, 1,
-0.3035361, -0.1524465, -2.125782, 1, 1, 1, 1, 1,
-0.3026266, 0.3766835, -1.099038, 1, 1, 1, 1, 1,
-0.3002007, -0.08500135, -0.4480443, 1, 1, 1, 1, 1,
-0.2945172, -0.7281147, -2.278761, 1, 1, 1, 1, 1,
-0.2888455, -0.5689114, -3.285676, 1, 1, 1, 1, 1,
-0.2854482, -1.142131, -2.068241, 0, 0, 1, 1, 1,
-0.285225, -0.4350729, -4.271366, 1, 0, 0, 1, 1,
-0.2845515, -0.2421113, -3.089663, 1, 0, 0, 1, 1,
-0.2832761, -2.151993, -1.861043, 1, 0, 0, 1, 1,
-0.2815029, 0.595107, 0.2061197, 1, 0, 0, 1, 1,
-0.2759196, 0.90066, 0.2232946, 1, 0, 0, 1, 1,
-0.2707221, -0.08695285, -1.122435, 0, 0, 0, 1, 1,
-0.2697821, -0.6749953, -2.034019, 0, 0, 0, 1, 1,
-0.2687974, -0.573688, -2.865337, 0, 0, 0, 1, 1,
-0.2681987, -0.1076198, -1.175711, 0, 0, 0, 1, 1,
-0.2644032, -0.9632449, -3.078528, 0, 0, 0, 1, 1,
-0.2633669, -1.21456, -4.987902, 0, 0, 0, 1, 1,
-0.2619594, 0.8202097, -0.70451, 0, 0, 0, 1, 1,
-0.2473248, -0.3033684, -3.111519, 1, 1, 1, 1, 1,
-0.2368251, 0.2879871, -2.083996, 1, 1, 1, 1, 1,
-0.2368083, -0.2731339, -2.226674, 1, 1, 1, 1, 1,
-0.2302412, -0.2964022, -2.214837, 1, 1, 1, 1, 1,
-0.2302243, -0.8301354, -4.442941, 1, 1, 1, 1, 1,
-0.2271715, -0.6315352, -3.627774, 1, 1, 1, 1, 1,
-0.2203975, -0.287881, -2.077261, 1, 1, 1, 1, 1,
-0.2167729, 0.2605094, -1.641214, 1, 1, 1, 1, 1,
-0.2164507, -1.287546, -2.735539, 1, 1, 1, 1, 1,
-0.2138186, 0.4518411, -0.1939931, 1, 1, 1, 1, 1,
-0.2127264, -0.2506808, -1.282677, 1, 1, 1, 1, 1,
-0.2089085, -0.2925861, -2.559877, 1, 1, 1, 1, 1,
-0.2031141, 0.8048606, -1.718056, 1, 1, 1, 1, 1,
-0.1995371, -0.3040388, -0.9358177, 1, 1, 1, 1, 1,
-0.1910549, -0.2360451, -3.430715, 1, 1, 1, 1, 1,
-0.1870455, 0.1023994, 0.556592, 0, 0, 1, 1, 1,
-0.1863541, -0.2364241, -1.369289, 1, 0, 0, 1, 1,
-0.1831717, 0.3401332, -1.353131, 1, 0, 0, 1, 1,
-0.1795709, -0.4432411, -1.871815, 1, 0, 0, 1, 1,
-0.1782052, -1.594742, -3.595306, 1, 0, 0, 1, 1,
-0.1680728, 0.957189, 0.9164968, 1, 0, 0, 1, 1,
-0.1667656, -0.5911456, -1.617276, 0, 0, 0, 1, 1,
-0.1662518, 1.33206, 0.05711879, 0, 0, 0, 1, 1,
-0.1646946, 0.5712646, -1.465798, 0, 0, 0, 1, 1,
-0.1640309, 0.5530886, -0.2073564, 0, 0, 0, 1, 1,
-0.1614069, -1.44212, -4.795853, 0, 0, 0, 1, 1,
-0.1523997, 0.4947358, -0.6150999, 0, 0, 0, 1, 1,
-0.140764, -2.298977, -2.232645, 0, 0, 0, 1, 1,
-0.1301779, 0.6492057, -0.5581472, 1, 1, 1, 1, 1,
-0.1279244, -1.6858, -2.164766, 1, 1, 1, 1, 1,
-0.1260915, -0.5903929, -1.354849, 1, 1, 1, 1, 1,
-0.1241717, -1.885518, -4.846724, 1, 1, 1, 1, 1,
-0.1205255, -0.5220681, -3.7247, 1, 1, 1, 1, 1,
-0.1200247, 0.6963648, -0.2639764, 1, 1, 1, 1, 1,
-0.1196555, -1.186268, -3.706184, 1, 1, 1, 1, 1,
-0.1192668, -0.3322257, -3.033142, 1, 1, 1, 1, 1,
-0.1177231, 1.409565, 0.4494075, 1, 1, 1, 1, 1,
-0.1156436, -1.104869, -2.607046, 1, 1, 1, 1, 1,
-0.1151032, -0.3626949, -2.006065, 1, 1, 1, 1, 1,
-0.1148495, -0.3860441, -3.540289, 1, 1, 1, 1, 1,
-0.1146333, 1.041759, 1.25929, 1, 1, 1, 1, 1,
-0.11401, 1.189655, 0.8639335, 1, 1, 1, 1, 1,
-0.1133396, 0.1332846, -1.290248, 1, 1, 1, 1, 1,
-0.1096309, -1.150969, -3.511728, 0, 0, 1, 1, 1,
-0.1072275, -0.4659102, -2.2328, 1, 0, 0, 1, 1,
-0.1037895, 0.0485003, -1.70027, 1, 0, 0, 1, 1,
-0.1035613, -1.38319, -2.998098, 1, 0, 0, 1, 1,
-0.1032554, -1.332235, -3.023498, 1, 0, 0, 1, 1,
-0.09794205, 0.9729584, 1.073591, 1, 0, 0, 1, 1,
-0.09675884, -0.2754916, -2.431432, 0, 0, 0, 1, 1,
-0.09660674, -0.05593606, -1.920376, 0, 0, 0, 1, 1,
-0.09629796, 0.3048986, -0.3944415, 0, 0, 0, 1, 1,
-0.09488983, 1.217387, 0.9759585, 0, 0, 0, 1, 1,
-0.09025744, -2.064229, -2.256581, 0, 0, 0, 1, 1,
-0.08959047, 0.8352179, 0.5387998, 0, 0, 0, 1, 1,
-0.08789173, -0.5772923, -2.596569, 0, 0, 0, 1, 1,
-0.08590899, 0.5985236, -1.188692, 1, 1, 1, 1, 1,
-0.07743769, -1.378431, -4.008632, 1, 1, 1, 1, 1,
-0.07563207, 1.668444, -0.1986167, 1, 1, 1, 1, 1,
-0.07473836, -0.72217, -3.1831, 1, 1, 1, 1, 1,
-0.07454135, 1.105079, -0.371733, 1, 1, 1, 1, 1,
-0.07259326, 0.1603812, 0.2494754, 1, 1, 1, 1, 1,
-0.06239333, 1.066188, 0.2753701, 1, 1, 1, 1, 1,
-0.05877126, 0.8472924, -0.346987, 1, 1, 1, 1, 1,
-0.05815319, -0.1323084, -3.199339, 1, 1, 1, 1, 1,
-0.05744026, -0.4772157, -2.605111, 1, 1, 1, 1, 1,
-0.04886965, -0.055512, -1.45392, 1, 1, 1, 1, 1,
-0.04534934, 1.020787, 0.1856732, 1, 1, 1, 1, 1,
-0.04182963, -1.235987, -2.207517, 1, 1, 1, 1, 1,
-0.0408789, -0.8136268, -2.930576, 1, 1, 1, 1, 1,
-0.03803419, 2.077219, 1.231773, 1, 1, 1, 1, 1,
-0.03751903, 0.8667412, 0.8826648, 0, 0, 1, 1, 1,
-0.03674221, 0.8296392, -0.221829, 1, 0, 0, 1, 1,
-0.03511089, 0.6205881, -0.669176, 1, 0, 0, 1, 1,
-0.03417359, 1.743646, -0.627213, 1, 0, 0, 1, 1,
-0.0330736, 0.5194451, -0.05219884, 1, 0, 0, 1, 1,
-0.03224886, 1.334847, -0.478153, 1, 0, 0, 1, 1,
-0.03134451, 0.7145281, -0.6759614, 0, 0, 0, 1, 1,
-0.03054369, 0.05554748, -1.312378, 0, 0, 0, 1, 1,
-0.03001839, -0.7751355, -3.757883, 0, 0, 0, 1, 1,
-0.02899833, -1.302962, -2.581977, 0, 0, 0, 1, 1,
-0.02881041, 1.212698, 1.31914, 0, 0, 0, 1, 1,
-0.02831161, 1.133489, 1.298393, 0, 0, 0, 1, 1,
-0.02753236, -0.6142517, -4.631577, 0, 0, 0, 1, 1,
-0.02507633, 0.8858688, 1.320066, 1, 1, 1, 1, 1,
-0.02391804, -0.7976302, -2.412173, 1, 1, 1, 1, 1,
-0.02227709, -2.210146, -2.084829, 1, 1, 1, 1, 1,
-0.02029936, 0.7109422, 0.5336183, 1, 1, 1, 1, 1,
-0.01887753, 0.5544349, -0.9343132, 1, 1, 1, 1, 1,
-0.0155497, -2.175257, -2.722451, 1, 1, 1, 1, 1,
-0.01491056, 0.2295958, 0.9759496, 1, 1, 1, 1, 1,
-0.01393293, 0.4811686, 0.04496711, 1, 1, 1, 1, 1,
-0.008295704, -0.3160982, -1.932387, 1, 1, 1, 1, 1,
-0.007382567, -0.2474675, -2.102298, 1, 1, 1, 1, 1,
-0.006331025, 2.082225, 1.112193, 1, 1, 1, 1, 1,
-0.005776816, -1.147783, -2.502981, 1, 1, 1, 1, 1,
-0.005369124, -1.009353, -2.418784, 1, 1, 1, 1, 1,
-0.004534626, -0.7265317, -3.818043, 1, 1, 1, 1, 1,
-0.001044775, -0.68053, -4.02562, 1, 1, 1, 1, 1,
-0.0005342909, -1.135954, -2.588431, 0, 0, 1, 1, 1,
0.000975245, 1.098984, 0.1564374, 1, 0, 0, 1, 1,
0.005502551, -0.8222639, 3.185948, 1, 0, 0, 1, 1,
0.009599992, 1.001436, -0.6028006, 1, 0, 0, 1, 1,
0.02102794, -0.2215726, 3.680571, 1, 0, 0, 1, 1,
0.02240165, 1.355573, -0.4247223, 1, 0, 0, 1, 1,
0.02368839, -0.001808692, 2.567718, 0, 0, 0, 1, 1,
0.02419827, -0.8029852, 1.474282, 0, 0, 0, 1, 1,
0.02700602, -0.7073104, 1.696282, 0, 0, 0, 1, 1,
0.02835299, -0.1358534, 3.715262, 0, 0, 0, 1, 1,
0.03262908, 0.3847015, -1.595082, 0, 0, 0, 1, 1,
0.03525966, 0.9563104, 0.4848623, 0, 0, 0, 1, 1,
0.03943542, -0.2359605, 2.767993, 0, 0, 0, 1, 1,
0.04598602, 0.3361136, 0.1860024, 1, 1, 1, 1, 1,
0.04853037, 0.4427483, 1.189164, 1, 1, 1, 1, 1,
0.05798547, 0.9713219, -1.420556, 1, 1, 1, 1, 1,
0.05940208, -0.03715048, 1.556135, 1, 1, 1, 1, 1,
0.06438189, -0.4974084, 3.58043, 1, 1, 1, 1, 1,
0.06442164, -1.072387, 3.918752, 1, 1, 1, 1, 1,
0.06446987, -0.06405708, 2.662296, 1, 1, 1, 1, 1,
0.07010001, 1.224158, -0.2218854, 1, 1, 1, 1, 1,
0.0712487, -1.633007, 0.6750145, 1, 1, 1, 1, 1,
0.07146052, -0.1183206, 4.338541, 1, 1, 1, 1, 1,
0.07483099, -1.757651, 1.238298, 1, 1, 1, 1, 1,
0.07863718, -0.8422822, 3.69442, 1, 1, 1, 1, 1,
0.07906242, 2.887375, -0.8853893, 1, 1, 1, 1, 1,
0.08096403, -0.5218136, 4.224632, 1, 1, 1, 1, 1,
0.08130832, -0.3535986, 1.3438, 1, 1, 1, 1, 1,
0.08772968, 0.3519236, -0.1031981, 0, 0, 1, 1, 1,
0.09962509, -1.447382, 4.453275, 1, 0, 0, 1, 1,
0.1023037, 0.8358162, 1.232165, 1, 0, 0, 1, 1,
0.1095565, 0.2244589, 0.1236087, 1, 0, 0, 1, 1,
0.115591, -1.814227, 1.593685, 1, 0, 0, 1, 1,
0.121991, -1.468177, 3.068141, 1, 0, 0, 1, 1,
0.1250396, -0.7391823, 2.979135, 0, 0, 0, 1, 1,
0.1268539, 0.1672243, 0.9959728, 0, 0, 0, 1, 1,
0.1272183, -0.4677901, 1.436971, 0, 0, 0, 1, 1,
0.1330833, -1.335484, 4.118748, 0, 0, 0, 1, 1,
0.1362341, -0.2624899, 2.889457, 0, 0, 0, 1, 1,
0.1373906, 0.04940859, 3.423156, 0, 0, 0, 1, 1,
0.1443451, -0.4538269, 4.011056, 0, 0, 0, 1, 1,
0.1489938, -0.8571461, 4.769719, 1, 1, 1, 1, 1,
0.1493515, -1.329834, 2.638, 1, 1, 1, 1, 1,
0.1518154, -1.767319, 4.201472, 1, 1, 1, 1, 1,
0.1601104, -0.9911494, 1.779403, 1, 1, 1, 1, 1,
0.1609322, 0.8567181, 1.3101, 1, 1, 1, 1, 1,
0.164305, 0.1241072, 2.002935, 1, 1, 1, 1, 1,
0.1646394, 2.575593, 1.070714, 1, 1, 1, 1, 1,
0.1721443, 2.052451, 0.04020713, 1, 1, 1, 1, 1,
0.179116, 1.132782, -1.114281, 1, 1, 1, 1, 1,
0.1791241, 0.4090946, 0.3870649, 1, 1, 1, 1, 1,
0.1825427, -1.429013, 3.337365, 1, 1, 1, 1, 1,
0.1837618, -1.139746, 4.077184, 1, 1, 1, 1, 1,
0.1846877, 1.321101, -1.636962, 1, 1, 1, 1, 1,
0.1871399, 0.2299766, 0.5030595, 1, 1, 1, 1, 1,
0.1872791, 0.4877855, 0.7764039, 1, 1, 1, 1, 1,
0.1901749, -0.2298314, 2.309572, 0, 0, 1, 1, 1,
0.1910709, -0.3853171, 2.938958, 1, 0, 0, 1, 1,
0.1965142, -0.3203266, 2.77145, 1, 0, 0, 1, 1,
0.1997186, 0.1654287, 0.8633912, 1, 0, 0, 1, 1,
0.1999914, 1.140245, 0.256731, 1, 0, 0, 1, 1,
0.2002167, 2.271422, 2.05734, 1, 0, 0, 1, 1,
0.20106, 0.4947021, 1.250027, 0, 0, 0, 1, 1,
0.206258, 1.114938, -0.08747055, 0, 0, 0, 1, 1,
0.2064294, 2.094543, 0.1589707, 0, 0, 0, 1, 1,
0.2066574, -0.648316, 0.5463092, 0, 0, 0, 1, 1,
0.2068777, 0.6348331, -0.3874342, 0, 0, 0, 1, 1,
0.2072179, 0.9034182, 0.1911241, 0, 0, 0, 1, 1,
0.210208, 0.556045, 1.324643, 0, 0, 0, 1, 1,
0.2207208, 0.9082998, -0.9007494, 1, 1, 1, 1, 1,
0.2239419, -0.3185288, 3.293816, 1, 1, 1, 1, 1,
0.2246889, -1.844641, 3.127484, 1, 1, 1, 1, 1,
0.2287686, -0.07218397, 2.303182, 1, 1, 1, 1, 1,
0.2293879, -0.8285115, 3.544623, 1, 1, 1, 1, 1,
0.2302345, -1.132152, 2.552021, 1, 1, 1, 1, 1,
0.2335803, -1.549872, 1.831437, 1, 1, 1, 1, 1,
0.2348541, 1.3484, -0.1199186, 1, 1, 1, 1, 1,
0.2366733, 0.698725, -0.5146643, 1, 1, 1, 1, 1,
0.2410714, 0.007518802, 0.5276966, 1, 1, 1, 1, 1,
0.2429185, -2.295853, 1.118417, 1, 1, 1, 1, 1,
0.2430253, 0.8686766, 0.3530026, 1, 1, 1, 1, 1,
0.244694, 0.01330513, 1.380375, 1, 1, 1, 1, 1,
0.2458718, 0.6731486, 1.099807, 1, 1, 1, 1, 1,
0.2488419, 0.6094523, -0.09154555, 1, 1, 1, 1, 1,
0.251289, -1.047677, 2.395946, 0, 0, 1, 1, 1,
0.2546014, 0.7182223, 1.926718, 1, 0, 0, 1, 1,
0.260652, -1.587816, 3.503903, 1, 0, 0, 1, 1,
0.262073, -0.8980795, 1.745781, 1, 0, 0, 1, 1,
0.2703962, 0.2863171, 1.183734, 1, 0, 0, 1, 1,
0.2719644, 1.14609, 0.5860783, 1, 0, 0, 1, 1,
0.2733691, -0.003513417, 0.779346, 0, 0, 0, 1, 1,
0.2811055, 0.7119094, 0.9119843, 0, 0, 0, 1, 1,
0.2816376, 0.1403862, 1.035346, 0, 0, 0, 1, 1,
0.283364, -1.779517, 4.35516, 0, 0, 0, 1, 1,
0.2895465, -0.8840445, 2.681563, 0, 0, 0, 1, 1,
0.2915137, -1.512386, 2.036708, 0, 0, 0, 1, 1,
0.2922493, 2.289135, -1.229245, 0, 0, 0, 1, 1,
0.2931105, 0.3613857, 0.5327361, 1, 1, 1, 1, 1,
0.2936454, -0.04576435, 3.067756, 1, 1, 1, 1, 1,
0.2975232, -0.1035858, 2.643106, 1, 1, 1, 1, 1,
0.2996269, -0.3541984, 1.640924, 1, 1, 1, 1, 1,
0.2996637, 1.049846, 0.6425387, 1, 1, 1, 1, 1,
0.3020579, 1.299506, 0.6121719, 1, 1, 1, 1, 1,
0.3059819, 0.2540695, 0.2714869, 1, 1, 1, 1, 1,
0.308178, 0.3818151, 1.013937, 1, 1, 1, 1, 1,
0.3093387, -0.9758588, 2.339748, 1, 1, 1, 1, 1,
0.3145348, -0.03822605, 1.118603, 1, 1, 1, 1, 1,
0.3164544, 0.5185868, 2.072993, 1, 1, 1, 1, 1,
0.3169265, -0.6003879, 2.463541, 1, 1, 1, 1, 1,
0.3207252, -1.382193, 2.552608, 1, 1, 1, 1, 1,
0.3210793, 1.269714, -0.02686905, 1, 1, 1, 1, 1,
0.3219259, -1.150269, 2.561931, 1, 1, 1, 1, 1,
0.3263495, 0.3359063, 1.692764, 0, 0, 1, 1, 1,
0.3264502, 0.6790721, 1.534159, 1, 0, 0, 1, 1,
0.3266034, -0.02917388, 2.804125, 1, 0, 0, 1, 1,
0.3317897, -2.471309, 2.464389, 1, 0, 0, 1, 1,
0.3343266, 0.4247096, -0.1111159, 1, 0, 0, 1, 1,
0.334403, -1.351763, 2.417299, 1, 0, 0, 1, 1,
0.3356881, 1.357632, 0.7690427, 0, 0, 0, 1, 1,
0.3371158, -0.424207, -0.2253034, 0, 0, 0, 1, 1,
0.3384866, -1.345739, 2.09149, 0, 0, 0, 1, 1,
0.3386761, 1.687557, 1.398165, 0, 0, 0, 1, 1,
0.3401447, 1.194633, 2.030154, 0, 0, 0, 1, 1,
0.3505756, -1.451282, 2.669441, 0, 0, 0, 1, 1,
0.3518288, -0.3511093, 2.71183, 0, 0, 0, 1, 1,
0.352076, -0.1027937, 2.642025, 1, 1, 1, 1, 1,
0.3524182, -0.1430333, 2.397026, 1, 1, 1, 1, 1,
0.3538328, 1.766655, 2.221575, 1, 1, 1, 1, 1,
0.3644153, -0.1774196, 3.123911, 1, 1, 1, 1, 1,
0.3661171, 0.7156886, -0.8794222, 1, 1, 1, 1, 1,
0.3667096, 1.381126, -0.1100181, 1, 1, 1, 1, 1,
0.3729816, -0.1544901, 1.395959, 1, 1, 1, 1, 1,
0.3771124, 1.243034, 1.568899, 1, 1, 1, 1, 1,
0.3867232, -0.0233087, 2.770378, 1, 1, 1, 1, 1,
0.3874576, 0.5203178, -0.888216, 1, 1, 1, 1, 1,
0.3937065, 0.8776072, 0.2823692, 1, 1, 1, 1, 1,
0.3953281, -0.09455916, 0.4212482, 1, 1, 1, 1, 1,
0.3983282, 0.8685488, 0.09705096, 1, 1, 1, 1, 1,
0.4095488, -0.7225056, 2.397612, 1, 1, 1, 1, 1,
0.4120828, 1.073517, -1.766645, 1, 1, 1, 1, 1,
0.412219, 1.391203, 1.464092, 0, 0, 1, 1, 1,
0.4140937, -1.130164, 2.971693, 1, 0, 0, 1, 1,
0.4213874, 1.16845, -0.209765, 1, 0, 0, 1, 1,
0.4235805, -0.4960951, 3.107972, 1, 0, 0, 1, 1,
0.426232, 0.3491597, 1.970454, 1, 0, 0, 1, 1,
0.4278357, -0.8743587, 3.728791, 1, 0, 0, 1, 1,
0.4279671, 0.9148307, 0.2781569, 0, 0, 0, 1, 1,
0.4282447, -0.3037668, 2.251235, 0, 0, 0, 1, 1,
0.4294529, -2.175947, 1.287859, 0, 0, 0, 1, 1,
0.4339455, 1.786519, 1.137504, 0, 0, 0, 1, 1,
0.4368269, -0.8540738, 2.691008, 0, 0, 0, 1, 1,
0.4417666, 0.05843905, 2.591305, 0, 0, 0, 1, 1,
0.4418408, 0.3476796, 0.3001118, 0, 0, 0, 1, 1,
0.4418927, -1.62458, 2.207408, 1, 1, 1, 1, 1,
0.4445762, -0.03459224, 2.186535, 1, 1, 1, 1, 1,
0.4498744, -0.4056379, 1.653892, 1, 1, 1, 1, 1,
0.452976, 1.255542, 0.1672929, 1, 1, 1, 1, 1,
0.4600541, 1.624266, 0.2697778, 1, 1, 1, 1, 1,
0.4632269, -0.6946505, 1.40877, 1, 1, 1, 1, 1,
0.4661403, 0.2276434, 2.167597, 1, 1, 1, 1, 1,
0.4684745, -0.6653925, 3.178988, 1, 1, 1, 1, 1,
0.4744149, 0.6675388, 2.952984, 1, 1, 1, 1, 1,
0.4750299, 0.7495111, 1.203017, 1, 1, 1, 1, 1,
0.477206, 0.8763161, 0.1519121, 1, 1, 1, 1, 1,
0.4782043, -0.3006116, 0.8362303, 1, 1, 1, 1, 1,
0.4826652, -0.2932429, 0.6363016, 1, 1, 1, 1, 1,
0.4847739, -1.128584, 2.309266, 1, 1, 1, 1, 1,
0.4894756, 0.361736, 2.662123, 1, 1, 1, 1, 1,
0.4898938, -0.532797, 3.171373, 0, 0, 1, 1, 1,
0.490583, -0.3170649, 0.6445978, 1, 0, 0, 1, 1,
0.4911279, -0.5835027, 0.8519716, 1, 0, 0, 1, 1,
0.4913593, -0.85923, 3.891247, 1, 0, 0, 1, 1,
0.4940464, -1.186069, 2.992164, 1, 0, 0, 1, 1,
0.49502, -0.1951145, 3.662707, 1, 0, 0, 1, 1,
0.4972274, -0.5340192, 2.386193, 0, 0, 0, 1, 1,
0.4976966, 0.5510892, 0.8445966, 0, 0, 0, 1, 1,
0.4977362, -1.099966, 2.558379, 0, 0, 0, 1, 1,
0.5018973, 0.1959577, 2.314147, 0, 0, 0, 1, 1,
0.5021755, -0.8162032, 2.344209, 0, 0, 0, 1, 1,
0.5049729, -0.2523738, 2.249396, 0, 0, 0, 1, 1,
0.5085449, 1.092999, 0.04216994, 0, 0, 0, 1, 1,
0.5088267, -1.166639, 0.9344723, 1, 1, 1, 1, 1,
0.5100753, 1.777759, 1.664933, 1, 1, 1, 1, 1,
0.5102263, 1.371054, 0.1414387, 1, 1, 1, 1, 1,
0.511189, 0.2363493, 0.2159262, 1, 1, 1, 1, 1,
0.5151478, 0.442728, 1.620735, 1, 1, 1, 1, 1,
0.5167702, -0.2985315, 3.981201, 1, 1, 1, 1, 1,
0.5180421, -0.09052027, 0.919458, 1, 1, 1, 1, 1,
0.5215133, 0.5446073, 1.414985, 1, 1, 1, 1, 1,
0.5222946, -0.806432, 2.937607, 1, 1, 1, 1, 1,
0.5232994, 0.00929014, 2.161771, 1, 1, 1, 1, 1,
0.525165, 0.480633, -0.1547695, 1, 1, 1, 1, 1,
0.5301311, 0.1076873, 1.340368, 1, 1, 1, 1, 1,
0.5303841, -0.1852166, 0.3758934, 1, 1, 1, 1, 1,
0.531783, -0.6620269, 2.798497, 1, 1, 1, 1, 1,
0.535289, 0.08556797, 1.827174, 1, 1, 1, 1, 1,
0.5368998, 1.199992, -1.347631, 0, 0, 1, 1, 1,
0.5388162, -0.9795401, 1.999796, 1, 0, 0, 1, 1,
0.5394065, -0.2046845, 0.7602592, 1, 0, 0, 1, 1,
0.5418789, -2.685769, 2.104965, 1, 0, 0, 1, 1,
0.5447214, -0.5768155, 3.261534, 1, 0, 0, 1, 1,
0.5471796, -0.8694705, 1.636242, 1, 0, 0, 1, 1,
0.5597758, -2.72975, 2.197641, 0, 0, 0, 1, 1,
0.5613583, 0.5263867, 1.446064, 0, 0, 0, 1, 1,
0.5629715, -0.5689905, 2.045284, 0, 0, 0, 1, 1,
0.5634702, 0.1847711, 0.7415668, 0, 0, 0, 1, 1,
0.5702906, 2.253205, 2.305568, 0, 0, 0, 1, 1,
0.5740386, 1.941402, 0.3005019, 0, 0, 0, 1, 1,
0.5753224, 1.979932, 1.477393, 0, 0, 0, 1, 1,
0.5778322, -1.189291, 3.583131, 1, 1, 1, 1, 1,
0.5790055, -0.02136776, 3.651174, 1, 1, 1, 1, 1,
0.5886141, -0.3086116, 2.755552, 1, 1, 1, 1, 1,
0.5889065, -1.252391, 2.104549, 1, 1, 1, 1, 1,
0.5892256, -1.027446, 2.807864, 1, 1, 1, 1, 1,
0.5910933, -0.6986225, 1.081686, 1, 1, 1, 1, 1,
0.5951214, -0.4070401, 1.943875, 1, 1, 1, 1, 1,
0.5958702, -0.6433854, 1.577658, 1, 1, 1, 1, 1,
0.5972428, 0.5575086, 0.1919647, 1, 1, 1, 1, 1,
0.6093127, 0.3740899, 0.3449732, 1, 1, 1, 1, 1,
0.6102984, 2.050202, -1.303327, 1, 1, 1, 1, 1,
0.6107939, 0.04330538, 0.322922, 1, 1, 1, 1, 1,
0.6108792, 2.025291, -0.544054, 1, 1, 1, 1, 1,
0.6188198, -0.488375, 0.6442388, 1, 1, 1, 1, 1,
0.6248752, 1.347265, -0.6737801, 1, 1, 1, 1, 1,
0.6253212, -0.3395842, 2.294054, 0, 0, 1, 1, 1,
0.6348403, -0.6533429, 3.021318, 1, 0, 0, 1, 1,
0.6386808, 0.1072434, 2.256947, 1, 0, 0, 1, 1,
0.6387542, -0.1800058, 1.023592, 1, 0, 0, 1, 1,
0.640363, -1.010129, 0.829815, 1, 0, 0, 1, 1,
0.6414026, -0.1938526, 1.939824, 1, 0, 0, 1, 1,
0.6421652, 0.4095286, 1.701585, 0, 0, 0, 1, 1,
0.643981, -1.890044, 2.461315, 0, 0, 0, 1, 1,
0.6456746, -0.4716186, 3.048436, 0, 0, 0, 1, 1,
0.6466762, -0.4051552, 2.98041, 0, 0, 0, 1, 1,
0.6529739, -2.112723, 3.066081, 0, 0, 0, 1, 1,
0.6600923, -0.3919811, 0.9738477, 0, 0, 0, 1, 1,
0.6624869, 0.06716111, -0.8621629, 0, 0, 0, 1, 1,
0.6718449, -0.3378357, 1.35387, 1, 1, 1, 1, 1,
0.6722443, -1.043831, 3.856508, 1, 1, 1, 1, 1,
0.6757497, -0.368109, 1.860473, 1, 1, 1, 1, 1,
0.6846594, -0.1620744, 2.740126, 1, 1, 1, 1, 1,
0.685574, 0.4188499, 0.4675709, 1, 1, 1, 1, 1,
0.6862067, 0.2411371, -0.3920245, 1, 1, 1, 1, 1,
0.7047523, 0.8346001, 1.657419, 1, 1, 1, 1, 1,
0.7112996, 0.1009913, 2.6902, 1, 1, 1, 1, 1,
0.7119008, 1.605235, -0.7615961, 1, 1, 1, 1, 1,
0.7137602, -0.238436, 1.670619, 1, 1, 1, 1, 1,
0.717464, -0.234322, 0.4561718, 1, 1, 1, 1, 1,
0.7195907, -0.9455405, 2.968756, 1, 1, 1, 1, 1,
0.7229208, -0.7774135, 2.141671, 1, 1, 1, 1, 1,
0.7270019, 0.06001746, 1.027968, 1, 1, 1, 1, 1,
0.7275489, -0.8069377, 1.628245, 1, 1, 1, 1, 1,
0.7296979, -0.5481286, 3.409905, 0, 0, 1, 1, 1,
0.7315679, 0.9159439, 1.772551, 1, 0, 0, 1, 1,
0.7353358, -0.6540893, 2.389729, 1, 0, 0, 1, 1,
0.7396615, -0.9016593, 0.8975087, 1, 0, 0, 1, 1,
0.7439408, 0.2742707, 1.949302, 1, 0, 0, 1, 1,
0.7459347, 0.7424706, 1.855052, 1, 0, 0, 1, 1,
0.7466218, -0.9841835, 1.363111, 0, 0, 0, 1, 1,
0.7475589, -0.1491314, 0.007294932, 0, 0, 0, 1, 1,
0.7542831, -0.1701649, 1.501472, 0, 0, 0, 1, 1,
0.7579498, -1.006388, 2.713271, 0, 0, 0, 1, 1,
0.7689556, -0.4507611, 1.063821, 0, 0, 0, 1, 1,
0.7707168, 0.3160156, 2.403592, 0, 0, 0, 1, 1,
0.7719427, 0.9014415, -0.1477102, 0, 0, 0, 1, 1,
0.7744503, 2.131203, 1.682441, 1, 1, 1, 1, 1,
0.7761635, 0.1694472, 2.913647, 1, 1, 1, 1, 1,
0.7781856, -1.41287, 2.357634, 1, 1, 1, 1, 1,
0.7809532, 0.8732088, 1.873491, 1, 1, 1, 1, 1,
0.7859159, 0.03337304, 0.6470866, 1, 1, 1, 1, 1,
0.7885774, -0.01237072, 0.7403776, 1, 1, 1, 1, 1,
0.7948828, -1.261147, 2.183316, 1, 1, 1, 1, 1,
0.8030344, 1.721797, 1.693738, 1, 1, 1, 1, 1,
0.803342, 1.296305, 0.8226023, 1, 1, 1, 1, 1,
0.8066507, 0.5561364, 1.728757, 1, 1, 1, 1, 1,
0.8083053, -0.4505033, 2.295951, 1, 1, 1, 1, 1,
0.8120332, 0.5770872, -0.5083264, 1, 1, 1, 1, 1,
0.8128088, -0.4909165, 2.775806, 1, 1, 1, 1, 1,
0.8139285, 1.102385, 1.262051, 1, 1, 1, 1, 1,
0.8151758, 1.021872, -0.5711315, 1, 1, 1, 1, 1,
0.8219045, 0.8212632, 0.415419, 0, 0, 1, 1, 1,
0.8226512, 0.7192444, 0.05992037, 1, 0, 0, 1, 1,
0.8253471, 0.5949306, 1.855504, 1, 0, 0, 1, 1,
0.8270772, 0.1576082, 1.817643, 1, 0, 0, 1, 1,
0.82789, -2.237852, 3.665301, 1, 0, 0, 1, 1,
0.8326583, -0.3475356, 2.809566, 1, 0, 0, 1, 1,
0.8365204, -0.5852725, 0.6408656, 0, 0, 0, 1, 1,
0.8371059, 0.09592679, 2.190086, 0, 0, 0, 1, 1,
0.8375058, 1.685572, -0.6628033, 0, 0, 0, 1, 1,
0.8447348, 0.1420184, 1.663771, 0, 0, 0, 1, 1,
0.8489921, 1.591124, 0.6961086, 0, 0, 0, 1, 1,
0.8503453, 0.2678466, 2.541485, 0, 0, 0, 1, 1,
0.8543224, 2.457957, -1.267156, 0, 0, 0, 1, 1,
0.8557948, 0.9595521, -0.4773347, 1, 1, 1, 1, 1,
0.8560776, 2.717056, -0.08181408, 1, 1, 1, 1, 1,
0.8563571, 1.444396, 0.2952083, 1, 1, 1, 1, 1,
0.8596021, 0.4336655, 1.333944, 1, 1, 1, 1, 1,
0.8613591, -1.076391, 1.213811, 1, 1, 1, 1, 1,
0.8688841, -0.3307859, 2.538662, 1, 1, 1, 1, 1,
0.8691611, 0.1900079, 0.06433656, 1, 1, 1, 1, 1,
0.8711571, -0.4113947, 2.648108, 1, 1, 1, 1, 1,
0.8713667, 0.2555459, -0.09416274, 1, 1, 1, 1, 1,
0.8792737, 1.628684, 2.51651, 1, 1, 1, 1, 1,
0.8794854, 0.5928726, 0.9430876, 1, 1, 1, 1, 1,
0.8796403, -0.6244658, 3.604225, 1, 1, 1, 1, 1,
0.8807042, -0.4708505, 1.459522, 1, 1, 1, 1, 1,
0.8847372, 0.6757342, -0.3959709, 1, 1, 1, 1, 1,
0.8876111, -2.807269, 3.469955, 1, 1, 1, 1, 1,
0.8925321, 0.9518788, 0.1290388, 0, 0, 1, 1, 1,
0.896517, 0.234198, 2.768138, 1, 0, 0, 1, 1,
0.9019098, -0.4247432, 2.314638, 1, 0, 0, 1, 1,
0.9190913, -0.1392754, 3.542509, 1, 0, 0, 1, 1,
0.9288456, 0.5683042, 2.084621, 1, 0, 0, 1, 1,
0.9300366, -0.9163595, 0.6103791, 1, 0, 0, 1, 1,
0.930539, -0.3160764, 0.4172819, 0, 0, 0, 1, 1,
0.9307919, 1.425427, 0.8522912, 0, 0, 0, 1, 1,
0.9379218, -0.05726004, 0.9476869, 0, 0, 0, 1, 1,
0.9427481, -0.7257845, 0.9052422, 0, 0, 0, 1, 1,
0.9484102, 0.4002634, 2.472264, 0, 0, 0, 1, 1,
0.9492922, 0.3575987, 1.374939, 0, 0, 0, 1, 1,
0.9574931, -0.3663501, 2.098428, 0, 0, 0, 1, 1,
0.9621837, 0.9707616, -0.7940696, 1, 1, 1, 1, 1,
0.9633982, -0.2563032, -0.4296489, 1, 1, 1, 1, 1,
0.9643129, 0.6406924, 0.6588897, 1, 1, 1, 1, 1,
0.9649271, -0.3718048, 2.426482, 1, 1, 1, 1, 1,
0.9668674, 0.9502212, 1.186916, 1, 1, 1, 1, 1,
0.9669118, -0.8124647, 1.188596, 1, 1, 1, 1, 1,
0.970235, -0.3047031, 4.30085, 1, 1, 1, 1, 1,
0.9716812, 0.6408962, 1.105416, 1, 1, 1, 1, 1,
0.9735703, -0.05542215, 2.515458, 1, 1, 1, 1, 1,
0.9752622, 0.8921263, 2.147295, 1, 1, 1, 1, 1,
0.9809696, 2.00297, 0.440041, 1, 1, 1, 1, 1,
0.9850951, -1.293232, 4.573317, 1, 1, 1, 1, 1,
0.9862012, 0.2950549, 1.490823, 1, 1, 1, 1, 1,
0.9913394, 2.477016, 0.1345814, 1, 1, 1, 1, 1,
0.9917898, -0.5654638, 1.551381, 1, 1, 1, 1, 1,
0.993434, 0.4389149, 2.623181, 0, 0, 1, 1, 1,
1.000449, 0.8023286, 1.410217, 1, 0, 0, 1, 1,
1.005219, 0.9063326, -0.2537819, 1, 0, 0, 1, 1,
1.010831, -0.01745081, 2.127993, 1, 0, 0, 1, 1,
1.011842, -0.4530688, 1.016037, 1, 0, 0, 1, 1,
1.012242, -0.6659076, 3.035509, 1, 0, 0, 1, 1,
1.034097, -0.6017779, 3.366239, 0, 0, 0, 1, 1,
1.036605, -0.1599077, 1.678207, 0, 0, 0, 1, 1,
1.038808, -1.089331, 3.115606, 0, 0, 0, 1, 1,
1.040085, 0.9905914, 1.78414, 0, 0, 0, 1, 1,
1.041381, -0.6331072, 1.367061, 0, 0, 0, 1, 1,
1.045663, 0.4467657, 0.6463757, 0, 0, 0, 1, 1,
1.047031, 0.003494827, 0.5244194, 0, 0, 0, 1, 1,
1.050054, -1.015111, 2.652255, 1, 1, 1, 1, 1,
1.050753, 0.150551, 2.627669, 1, 1, 1, 1, 1,
1.06143, 0.9619524, 1.012669, 1, 1, 1, 1, 1,
1.065763, -0.04647846, 3.280283, 1, 1, 1, 1, 1,
1.070013, 1.608078, -1.208591, 1, 1, 1, 1, 1,
1.071227, 0.4545199, 2.482838, 1, 1, 1, 1, 1,
1.071516, -1.623151, 0.8942934, 1, 1, 1, 1, 1,
1.080257, -0.3302491, 1.462945, 1, 1, 1, 1, 1,
1.084682, -0.818055, 2.550858, 1, 1, 1, 1, 1,
1.085379, 1.727062, -0.8790147, 1, 1, 1, 1, 1,
1.09619, 1.181906, 1.864298, 1, 1, 1, 1, 1,
1.098045, 0.5119882, 1.518641, 1, 1, 1, 1, 1,
1.104634, -0.1297532, 2.544142, 1, 1, 1, 1, 1,
1.106376, 2.951042, -0.6749957, 1, 1, 1, 1, 1,
1.1086, 1.903141, 0.1797642, 1, 1, 1, 1, 1,
1.109766, 0.1511189, 3.180407, 0, 0, 1, 1, 1,
1.118245, 0.1152107, 1.775612, 1, 0, 0, 1, 1,
1.131934, 0.958688, 0.1463249, 1, 0, 0, 1, 1,
1.132672, 0.5490803, 2.026094, 1, 0, 0, 1, 1,
1.134863, -0.3810007, 0.7885942, 1, 0, 0, 1, 1,
1.135096, 0.4619258, 2.825307, 1, 0, 0, 1, 1,
1.141693, -1.458959, 3.426558, 0, 0, 0, 1, 1,
1.159279, -0.3630697, 2.02313, 0, 0, 0, 1, 1,
1.161767, 2.021197, -0.8532306, 0, 0, 0, 1, 1,
1.162584, 0.6953064, 0.06336609, 0, 0, 0, 1, 1,
1.168429, -0.05475258, 0.2186363, 0, 0, 0, 1, 1,
1.174296, -0.08757613, 1.145162, 0, 0, 0, 1, 1,
1.177598, -0.19489, 2.504026, 0, 0, 0, 1, 1,
1.180988, -0.2357138, 2.950379, 1, 1, 1, 1, 1,
1.184675, -0.5963579, 3.341496, 1, 1, 1, 1, 1,
1.185035, 2.793326, 0.7552485, 1, 1, 1, 1, 1,
1.185609, -0.6821492, 1.650532, 1, 1, 1, 1, 1,
1.189685, 2.556395, 2.72331, 1, 1, 1, 1, 1,
1.191519, -1.38681, 3.807612, 1, 1, 1, 1, 1,
1.192189, -0.7120457, 2.28901, 1, 1, 1, 1, 1,
1.203855, -1.015309, 1.138273, 1, 1, 1, 1, 1,
1.203873, 0.8192964, 0.04886835, 1, 1, 1, 1, 1,
1.208209, 0.2592676, 2.699494, 1, 1, 1, 1, 1,
1.216549, 1.537447, -0.6115196, 1, 1, 1, 1, 1,
1.217542, -0.9769121, 2.157858, 1, 1, 1, 1, 1,
1.217731, -0.2682646, 0.6671901, 1, 1, 1, 1, 1,
1.224092, 0.5598958, 2.559667, 1, 1, 1, 1, 1,
1.227088, -0.1016659, 0.1559828, 1, 1, 1, 1, 1,
1.238034, 2.356528, -0.4608583, 0, 0, 1, 1, 1,
1.244591, -0.4601032, 1.516428, 1, 0, 0, 1, 1,
1.248301, 1.803648, 0.4686848, 1, 0, 0, 1, 1,
1.259155, -0.3974778, 2.010685, 1, 0, 0, 1, 1,
1.262349, -0.4165766, 0.801472, 1, 0, 0, 1, 1,
1.267973, -0.2402801, 1.796402, 1, 0, 0, 1, 1,
1.26891, 0.1173405, 0.1315574, 0, 0, 0, 1, 1,
1.273074, 1.930406, 0.6046638, 0, 0, 0, 1, 1,
1.273302, -2.022765, 4.165216, 0, 0, 0, 1, 1,
1.275708, 0.5118881, 1.366638, 0, 0, 0, 1, 1,
1.282982, 2.096032, 0.7483123, 0, 0, 0, 1, 1,
1.284176, -0.6580678, 1.049823, 0, 0, 0, 1, 1,
1.284724, 1.730223, -1.196292, 0, 0, 0, 1, 1,
1.295978, -0.05842365, 0.9366305, 1, 1, 1, 1, 1,
1.297384, 1.076824, 1.255332, 1, 1, 1, 1, 1,
1.29747, 1.957743, -0.2389984, 1, 1, 1, 1, 1,
1.297741, -1.718456, 1.93848, 1, 1, 1, 1, 1,
1.297974, -1.381363, 3.616298, 1, 1, 1, 1, 1,
1.300789, 0.601149, 0.4020887, 1, 1, 1, 1, 1,
1.303504, 0.2966973, 3.369047, 1, 1, 1, 1, 1,
1.312443, 0.8141137, 2.418379, 1, 1, 1, 1, 1,
1.314878, 0.8478675, 0.3080628, 1, 1, 1, 1, 1,
1.31753, -0.2722766, -0.1683432, 1, 1, 1, 1, 1,
1.332153, 0.1182412, 1.820459, 1, 1, 1, 1, 1,
1.334551, 1.440293, 1.165972, 1, 1, 1, 1, 1,
1.338402, -1.814466, 3.518393, 1, 1, 1, 1, 1,
1.347416, 0.9053465, 1.920764, 1, 1, 1, 1, 1,
1.351268, 0.6383902, 2.299448, 1, 1, 1, 1, 1,
1.353825, -0.109026, 1.140669, 0, 0, 1, 1, 1,
1.357172, 0.6684456, 2.318522, 1, 0, 0, 1, 1,
1.367039, -0.8629544, -0.03689765, 1, 0, 0, 1, 1,
1.37321, -0.2766522, 1.447913, 1, 0, 0, 1, 1,
1.375256, 0.2303298, 1.251661, 1, 0, 0, 1, 1,
1.375904, 0.4266789, 2.463422, 1, 0, 0, 1, 1,
1.385972, 1.629564, 1.329319, 0, 0, 0, 1, 1,
1.411524, 1.081084, 0.1538193, 0, 0, 0, 1, 1,
1.426356, 0.2891096, 2.138506, 0, 0, 0, 1, 1,
1.42718, -0.5462974, 0.8993251, 0, 0, 0, 1, 1,
1.439357, 1.133847, 0.4530796, 0, 0, 0, 1, 1,
1.440674, -0.8480478, 1.241173, 0, 0, 0, 1, 1,
1.442009, 1.554749, 1.020284, 0, 0, 0, 1, 1,
1.47709, 0.9207948, 0.7593733, 1, 1, 1, 1, 1,
1.526766, -0.1423471, 1.813909, 1, 1, 1, 1, 1,
1.532181, 1.14867, 0.8651534, 1, 1, 1, 1, 1,
1.54514, -0.5728089, 1.080555, 1, 1, 1, 1, 1,
1.557448, -0.2893854, 2.736692, 1, 1, 1, 1, 1,
1.558168, -0.4704966, 2.867481, 1, 1, 1, 1, 1,
1.561682, -2.746429, 3.54285, 1, 1, 1, 1, 1,
1.572767, 0.3365038, 1.708953, 1, 1, 1, 1, 1,
1.579358, 0.9626192, 0.500479, 1, 1, 1, 1, 1,
1.596339, -0.7956368, 1.339915, 1, 1, 1, 1, 1,
1.596783, -1.957167, 4.391984, 1, 1, 1, 1, 1,
1.596941, 0.2293945, 2.623548, 1, 1, 1, 1, 1,
1.609356, -0.7708776, 0.1341432, 1, 1, 1, 1, 1,
1.60981, -0.5476145, 1.688044, 1, 1, 1, 1, 1,
1.610848, 0.3812734, 1.815599, 1, 1, 1, 1, 1,
1.626966, -1.601231, 1.835035, 0, 0, 1, 1, 1,
1.654366, -0.3445954, 2.292101, 1, 0, 0, 1, 1,
1.657161, 0.8123768, 0.4905504, 1, 0, 0, 1, 1,
1.664424, 1.285012, -0.6052133, 1, 0, 0, 1, 1,
1.674613, -0.9177328, 0.05551031, 1, 0, 0, 1, 1,
1.69118, -0.1508549, 0.8375604, 1, 0, 0, 1, 1,
1.715875, 1.359547, 0.7465786, 0, 0, 0, 1, 1,
1.721337, -0.4405675, 0.6288256, 0, 0, 0, 1, 1,
1.731056, 0.7860206, 1.129029, 0, 0, 0, 1, 1,
1.751459, -0.9361204, 2.439935, 0, 0, 0, 1, 1,
1.751546, 1.206628, 2.339438, 0, 0, 0, 1, 1,
1.77198, -1.046387, 3.054585, 0, 0, 0, 1, 1,
1.817758, 0.5288798, 0.4983161, 0, 0, 0, 1, 1,
1.843256, 0.04087043, 1.513909, 1, 1, 1, 1, 1,
1.843577, -0.6540182, 1.730024, 1, 1, 1, 1, 1,
1.849154, -0.6691868, 1.339675, 1, 1, 1, 1, 1,
1.856437, 0.7465703, 0.3964907, 1, 1, 1, 1, 1,
1.857409, 1.801656, 0.8821762, 1, 1, 1, 1, 1,
1.898163, -1.461514, 1.869543, 1, 1, 1, 1, 1,
1.906726, -1.3165, 2.080501, 1, 1, 1, 1, 1,
1.952746, 0.9892803, 3.203697, 1, 1, 1, 1, 1,
1.982465, 2.503874, -0.942046, 1, 1, 1, 1, 1,
1.991424, -0.4940308, 2.928908, 1, 1, 1, 1, 1,
1.992265, -0.3734885, 2.612288, 1, 1, 1, 1, 1,
2.002085, 1.782279, 2.201512, 1, 1, 1, 1, 1,
2.025664, 0.4440821, -1.126823, 1, 1, 1, 1, 1,
2.027424, -0.9529108, 3.229948, 1, 1, 1, 1, 1,
2.044578, -0.1710378, 1.724784, 1, 1, 1, 1, 1,
2.054929, 0.7706549, 2.786344, 0, 0, 1, 1, 1,
2.062997, -0.4043571, 0.4680783, 1, 0, 0, 1, 1,
2.064147, 0.7071853, 2.703369, 1, 0, 0, 1, 1,
2.143822, -3.038492, 3.46511, 1, 0, 0, 1, 1,
2.160903, 0.2676019, 0.60162, 1, 0, 0, 1, 1,
2.177423, -0.6689944, 2.325444, 1, 0, 0, 1, 1,
2.204382, 1.617257, 0.673662, 0, 0, 0, 1, 1,
2.257217, 0.2039842, 2.197124, 0, 0, 0, 1, 1,
2.432834, -1.361148, 0.5384096, 0, 0, 0, 1, 1,
2.471998, -0.8623927, 1.697021, 0, 0, 0, 1, 1,
2.524355, -1.660848, 1.305842, 0, 0, 0, 1, 1,
2.560017, 0.6056452, 0.00720904, 0, 0, 0, 1, 1,
2.589938, 0.2532549, 0.2053833, 0, 0, 0, 1, 1,
2.618344, 0.8189037, 0.7709804, 1, 1, 1, 1, 1,
2.634529, -2.633509, 2.177581, 1, 1, 1, 1, 1,
2.701764, -0.3046393, 0.5621311, 1, 1, 1, 1, 1,
2.900603, 1.079463, 2.040044, 1, 1, 1, 1, 1,
3.01164, -0.7116022, 1.744116, 1, 1, 1, 1, 1,
3.082715, -0.7760248, 0.9630165, 1, 1, 1, 1, 1,
3.395757, 0.8592272, 2.878706, 1, 1, 1, 1, 1
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
var radius = 9.448269;
var distance = 33.18665;
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
mvMatrix.translate( -0.06765223, 0.1528307, 0.4110913 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.18665);
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
