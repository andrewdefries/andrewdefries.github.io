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
-3.155323, 0.1438797, -0.592407, 1, 0, 0, 1,
-2.893977, -1.139531, -1.131688, 1, 0.007843138, 0, 1,
-2.659327, -0.09009904, -1.304335, 1, 0.01176471, 0, 1,
-2.408478, -0.8375753, -1.787987, 1, 0.01960784, 0, 1,
-2.294922, -0.3806408, -3.179478, 1, 0.02352941, 0, 1,
-2.282059, -0.9876755, -1.763878, 1, 0.03137255, 0, 1,
-2.277204, 1.034508, -2.305491, 1, 0.03529412, 0, 1,
-2.245686, -0.05606458, -2.145851, 1, 0.04313726, 0, 1,
-2.205118, 0.06021615, -0.6492041, 1, 0.04705882, 0, 1,
-2.152554, -1.105301, -1.550811, 1, 0.05490196, 0, 1,
-2.074975, -0.02275476, -0.7363399, 1, 0.05882353, 0, 1,
-2.053062, 0.4001577, -2.348981, 1, 0.06666667, 0, 1,
-2.030045, -1.713254, -2.998387, 1, 0.07058824, 0, 1,
-2.02848, -0.7533757, -2.303396, 1, 0.07843138, 0, 1,
-2.012705, -0.9863545, -3.567743, 1, 0.08235294, 0, 1,
-2.00304, 0.1829838, -0.5539915, 1, 0.09019608, 0, 1,
-1.972574, 0.3981921, -1.124787, 1, 0.09411765, 0, 1,
-1.934755, -1.234858, -1.76643, 1, 0.1019608, 0, 1,
-1.905359, -0.0780222, -1.74395, 1, 0.1098039, 0, 1,
-1.886525, 0.6972041, 0.002897412, 1, 0.1137255, 0, 1,
-1.876537, 1.235957, 0.1658035, 1, 0.1215686, 0, 1,
-1.837693, -1.090729, -2.405698, 1, 0.1254902, 0, 1,
-1.826007, 0.1834429, 0.2456101, 1, 0.1333333, 0, 1,
-1.807398, -0.3682434, -2.058562, 1, 0.1372549, 0, 1,
-1.781292, -0.2686529, -1.829792, 1, 0.145098, 0, 1,
-1.75995, 0.3169044, -0.7458102, 1, 0.1490196, 0, 1,
-1.759107, 0.2270529, -1.352935, 1, 0.1568628, 0, 1,
-1.750228, -0.3648005, -1.945752, 1, 0.1607843, 0, 1,
-1.749141, -0.2258447, -2.908176, 1, 0.1686275, 0, 1,
-1.705362, -0.6514835, -3.682989, 1, 0.172549, 0, 1,
-1.695027, -1.823722, -2.788997, 1, 0.1803922, 0, 1,
-1.686611, 0.04859019, -0.9128929, 1, 0.1843137, 0, 1,
-1.675739, 0.9572182, -1.873871, 1, 0.1921569, 0, 1,
-1.661487, -0.2387471, -0.4299418, 1, 0.1960784, 0, 1,
-1.604012, -2.248938, -3.308332, 1, 0.2039216, 0, 1,
-1.601247, 1.014579, -0.3464112, 1, 0.2117647, 0, 1,
-1.597395, 0.0938874, 2.32772, 1, 0.2156863, 0, 1,
-1.595849, 0.7996163, -1.569851, 1, 0.2235294, 0, 1,
-1.594183, 0.1866865, -1.266471, 1, 0.227451, 0, 1,
-1.590326, -0.5077929, -1.164024, 1, 0.2352941, 0, 1,
-1.586949, 0.3543149, -0.5847208, 1, 0.2392157, 0, 1,
-1.58151, 0.2098264, -3.069592, 1, 0.2470588, 0, 1,
-1.578774, -0.2402302, -0.5349876, 1, 0.2509804, 0, 1,
-1.577877, -0.6961365, -3.14354, 1, 0.2588235, 0, 1,
-1.566806, -0.3642469, -2.278029, 1, 0.2627451, 0, 1,
-1.558499, 0.2568209, -2.074976, 1, 0.2705882, 0, 1,
-1.554629, 0.6879901, -1.627588, 1, 0.2745098, 0, 1,
-1.553436, -0.6686217, -2.751019, 1, 0.282353, 0, 1,
-1.546631, -0.5005919, -2.545298, 1, 0.2862745, 0, 1,
-1.545703, -1.651795, -1.765866, 1, 0.2941177, 0, 1,
-1.54124, 0.9847889, -0.9831464, 1, 0.3019608, 0, 1,
-1.527953, 0.8052199, -1.383984, 1, 0.3058824, 0, 1,
-1.523338, -0.72067, -1.679226, 1, 0.3137255, 0, 1,
-1.522058, 1.040943, 0.2869428, 1, 0.3176471, 0, 1,
-1.508523, -1.556535, -2.208225, 1, 0.3254902, 0, 1,
-1.50771, 1.412454, 0.8083624, 1, 0.3294118, 0, 1,
-1.504815, -0.2097116, -0.5203171, 1, 0.3372549, 0, 1,
-1.491299, 1.431379, -1.963131, 1, 0.3411765, 0, 1,
-1.4411, 0.3843505, -2.627559, 1, 0.3490196, 0, 1,
-1.437616, 0.7100788, -1.90972, 1, 0.3529412, 0, 1,
-1.430944, 0.5720174, -1.261162, 1, 0.3607843, 0, 1,
-1.428196, 1.181067, -0.03338619, 1, 0.3647059, 0, 1,
-1.422734, 0.6305463, -0.6540511, 1, 0.372549, 0, 1,
-1.417491, 0.655984, -1.89296, 1, 0.3764706, 0, 1,
-1.405767, 1.202278, -1.932499, 1, 0.3843137, 0, 1,
-1.404242, 0.4366591, -2.902264, 1, 0.3882353, 0, 1,
-1.379784, -1.1972, -2.996936, 1, 0.3960784, 0, 1,
-1.374933, -0.4873687, -3.533038, 1, 0.4039216, 0, 1,
-1.374878, -0.6283185, -1.913392, 1, 0.4078431, 0, 1,
-1.374677, -1.23444, -2.156617, 1, 0.4156863, 0, 1,
-1.372809, -0.7655144, -3.112576, 1, 0.4196078, 0, 1,
-1.366661, -0.05009965, 0.3761011, 1, 0.427451, 0, 1,
-1.353887, -0.2453175, -2.54528, 1, 0.4313726, 0, 1,
-1.352957, -0.3074223, -0.5707099, 1, 0.4392157, 0, 1,
-1.352449, 0.5569549, -0.4135309, 1, 0.4431373, 0, 1,
-1.349264, -0.07054766, -1.363256, 1, 0.4509804, 0, 1,
-1.344217, 0.4349012, 0.4423949, 1, 0.454902, 0, 1,
-1.335488, 0.3851179, -1.685583, 1, 0.4627451, 0, 1,
-1.330289, 0.331513, -0.2080771, 1, 0.4666667, 0, 1,
-1.328328, 0.1140971, -0.9306985, 1, 0.4745098, 0, 1,
-1.320315, -0.4942843, -3.205837, 1, 0.4784314, 0, 1,
-1.309477, -0.3868712, -1.699913, 1, 0.4862745, 0, 1,
-1.301702, 0.1447044, -0.6208438, 1, 0.4901961, 0, 1,
-1.29034, -0.7865683, -2.161689, 1, 0.4980392, 0, 1,
-1.281913, 0.855471, -1.144274, 1, 0.5058824, 0, 1,
-1.274741, -0.5076319, -3.44248, 1, 0.509804, 0, 1,
-1.268662, 0.07475355, -2.161864, 1, 0.5176471, 0, 1,
-1.265065, -1.681346, -3.065912, 1, 0.5215687, 0, 1,
-1.258769, -0.1863662, -1.069188, 1, 0.5294118, 0, 1,
-1.256732, -0.7954908, -3.022587, 1, 0.5333334, 0, 1,
-1.253041, 1.61209, -0.997526, 1, 0.5411765, 0, 1,
-1.251673, -0.3445532, -2.127987, 1, 0.5450981, 0, 1,
-1.245557, -1.490346, -3.221816, 1, 0.5529412, 0, 1,
-1.240994, 1.909969, -1.646808, 1, 0.5568628, 0, 1,
-1.239169, -1.161341, -1.844409, 1, 0.5647059, 0, 1,
-1.223895, -0.8288891, -0.5943072, 1, 0.5686275, 0, 1,
-1.209095, 1.458766, 1.207136, 1, 0.5764706, 0, 1,
-1.199676, 0.4992518, -1.320332, 1, 0.5803922, 0, 1,
-1.196081, -2.028321, -3.437934, 1, 0.5882353, 0, 1,
-1.190309, -0.610534, -0.7368027, 1, 0.5921569, 0, 1,
-1.186386, -0.507871, -1.893368, 1, 0.6, 0, 1,
-1.17833, 0.2737664, -1.525906, 1, 0.6078432, 0, 1,
-1.178249, 1.397854, -1.575583, 1, 0.6117647, 0, 1,
-1.175586, -0.9763918, -2.683852, 1, 0.6196079, 0, 1,
-1.174086, -0.03143969, -0.8579171, 1, 0.6235294, 0, 1,
-1.173536, -0.1880512, -1.84722, 1, 0.6313726, 0, 1,
-1.160218, 2.511006, -0.8908719, 1, 0.6352941, 0, 1,
-1.14743, 0.9280565, -1.252083, 1, 0.6431373, 0, 1,
-1.141891, 0.4983146, 0.2758768, 1, 0.6470588, 0, 1,
-1.13599, -0.190109, -2.347081, 1, 0.654902, 0, 1,
-1.135108, -0.3580409, -1.327599, 1, 0.6588235, 0, 1,
-1.132849, 0.2751903, -1.320067, 1, 0.6666667, 0, 1,
-1.131822, 0.3677667, -1.782827, 1, 0.6705883, 0, 1,
-1.130558, -0.4542449, -1.993436, 1, 0.6784314, 0, 1,
-1.125109, -1.269817, -2.338153, 1, 0.682353, 0, 1,
-1.118713, -0.06684782, -2.631372, 1, 0.6901961, 0, 1,
-1.107359, -1.059149, -1.897802, 1, 0.6941177, 0, 1,
-1.106758, -0.6311173, -3.000862, 1, 0.7019608, 0, 1,
-1.094626, 0.4263386, 0.5401064, 1, 0.7098039, 0, 1,
-1.093799, 0.03346245, -2.402583, 1, 0.7137255, 0, 1,
-1.091339, 0.225775, -1.89668, 1, 0.7215686, 0, 1,
-1.089981, -0.338723, -2.096869, 1, 0.7254902, 0, 1,
-1.083329, 0.8078035, 0.2430349, 1, 0.7333333, 0, 1,
-1.079468, 0.01409982, -1.019366, 1, 0.7372549, 0, 1,
-1.075363, 1.545127, -0.8530678, 1, 0.7450981, 0, 1,
-1.073617, 0.2393632, -1.147228, 1, 0.7490196, 0, 1,
-1.065627, 1.627931, -0.1812512, 1, 0.7568628, 0, 1,
-1.063046, 0.6811651, 0.3006997, 1, 0.7607843, 0, 1,
-1.051832, 1.26455, -1.955983, 1, 0.7686275, 0, 1,
-1.0429, -0.9211615, -2.651433, 1, 0.772549, 0, 1,
-1.042693, 0.8017626, -1.465635, 1, 0.7803922, 0, 1,
-1.041159, 0.9471419, -0.1939566, 1, 0.7843137, 0, 1,
-1.037204, -0.6503737, -1.0347, 1, 0.7921569, 0, 1,
-1.019137, 0.1122473, 0.4121238, 1, 0.7960784, 0, 1,
-1.014487, -0.2227415, -1.842763, 1, 0.8039216, 0, 1,
-1.008365, 1.134369, 0.8522426, 1, 0.8117647, 0, 1,
-1.004482, 0.2837099, -0.9889966, 1, 0.8156863, 0, 1,
-0.9926624, -1.134421, -3.49226, 1, 0.8235294, 0, 1,
-0.9924508, -0.6248082, -3.614998, 1, 0.827451, 0, 1,
-0.9901497, -0.2624361, -2.778669, 1, 0.8352941, 0, 1,
-0.9872884, -1.488429, -2.918341, 1, 0.8392157, 0, 1,
-0.9836657, 0.4951086, -1.352755, 1, 0.8470588, 0, 1,
-0.9805114, 0.922294, -0.4090396, 1, 0.8509804, 0, 1,
-0.9734792, -0.1364063, -0.2353489, 1, 0.8588235, 0, 1,
-0.9716305, 0.5322585, -1.283017, 1, 0.8627451, 0, 1,
-0.9712502, 0.5355937, -0.4384791, 1, 0.8705882, 0, 1,
-0.9706511, 0.130837, -1.476474, 1, 0.8745098, 0, 1,
-0.9705008, 1.171068, -0.8616716, 1, 0.8823529, 0, 1,
-0.9665843, 0.2189774, -2.032679, 1, 0.8862745, 0, 1,
-0.962841, 0.09798509, -1.020568, 1, 0.8941177, 0, 1,
-0.9590755, -0.786169, -3.578691, 1, 0.8980392, 0, 1,
-0.9582042, 0.8649099, -1.71839, 1, 0.9058824, 0, 1,
-0.9555696, 0.02755594, -1.736795, 1, 0.9137255, 0, 1,
-0.9547876, 0.1012823, 0.1931125, 1, 0.9176471, 0, 1,
-0.9508807, 0.7520862, -1.614563, 1, 0.9254902, 0, 1,
-0.9462552, 0.4012248, -0.9859353, 1, 0.9294118, 0, 1,
-0.9440671, -0.07398147, -1.329445, 1, 0.9372549, 0, 1,
-0.942245, 1.100976, -1.197688, 1, 0.9411765, 0, 1,
-0.9384972, 0.128327, -1.889929, 1, 0.9490196, 0, 1,
-0.9270833, 1.198002, -1.456166, 1, 0.9529412, 0, 1,
-0.9179493, 0.4399805, -1.109348, 1, 0.9607843, 0, 1,
-0.9155803, 2.664931, -0.5225607, 1, 0.9647059, 0, 1,
-0.9120492, -1.272177, -2.137556, 1, 0.972549, 0, 1,
-0.908457, 0.2960837, -1.3288, 1, 0.9764706, 0, 1,
-0.9058346, 0.5797511, -1.490064, 1, 0.9843137, 0, 1,
-0.9047979, 0.1814992, -1.153233, 1, 0.9882353, 0, 1,
-0.9042682, 0.4728296, -0.4052007, 1, 0.9960784, 0, 1,
-0.9032607, 0.5235788, -0.9934741, 0.9960784, 1, 0, 1,
-0.9027717, 1.061299, 0.9103265, 0.9921569, 1, 0, 1,
-0.9020523, -1.256355, -0.9640505, 0.9843137, 1, 0, 1,
-0.9011536, 0.3314296, -0.04592962, 0.9803922, 1, 0, 1,
-0.899793, -2.4626, -3.152847, 0.972549, 1, 0, 1,
-0.8966143, -1.616132, -1.991705, 0.9686275, 1, 0, 1,
-0.8931172, -0.2850894, 0.2275189, 0.9607843, 1, 0, 1,
-0.8906219, -0.4085332, -1.858982, 0.9568627, 1, 0, 1,
-0.8890496, -0.3740073, -3.566531, 0.9490196, 1, 0, 1,
-0.8840089, -0.246691, -2.298862, 0.945098, 1, 0, 1,
-0.8817374, -0.3042357, -0.8251682, 0.9372549, 1, 0, 1,
-0.881693, -3.256511, -4.018365, 0.9333333, 1, 0, 1,
-0.8810544, -0.7096071, -2.048641, 0.9254902, 1, 0, 1,
-0.8748915, 0.3268844, -2.206002, 0.9215686, 1, 0, 1,
-0.8704309, -1.685162, -2.17823, 0.9137255, 1, 0, 1,
-0.8683936, -0.0006662022, -2.512831, 0.9098039, 1, 0, 1,
-0.8678128, -1.011527, -2.785287, 0.9019608, 1, 0, 1,
-0.8609844, -0.5324844, -4.415099, 0.8941177, 1, 0, 1,
-0.8608791, 0.004930239, -2.298615, 0.8901961, 1, 0, 1,
-0.8601415, -0.4699998, -2.090515, 0.8823529, 1, 0, 1,
-0.8588095, 0.5684128, -2.341057, 0.8784314, 1, 0, 1,
-0.8581921, 0.5134533, -0.9822819, 0.8705882, 1, 0, 1,
-0.8443739, -2.078612, -3.59761, 0.8666667, 1, 0, 1,
-0.8423715, 1.106305, -0.7981491, 0.8588235, 1, 0, 1,
-0.841925, -0.245417, -1.473182, 0.854902, 1, 0, 1,
-0.8411194, -0.7710616, -1.097644, 0.8470588, 1, 0, 1,
-0.8368885, -0.9708655, -4.194049, 0.8431373, 1, 0, 1,
-0.8315628, 0.7243326, -0.2135766, 0.8352941, 1, 0, 1,
-0.8312406, 1.23324, -1.281595, 0.8313726, 1, 0, 1,
-0.8297691, -0.1101231, -1.183647, 0.8235294, 1, 0, 1,
-0.8294036, 0.2657635, -1.562964, 0.8196079, 1, 0, 1,
-0.8205319, 0.3411848, -3.903234, 0.8117647, 1, 0, 1,
-0.8202277, 1.396397, 0.0352881, 0.8078431, 1, 0, 1,
-0.8194883, -0.5058059, -2.042031, 0.8, 1, 0, 1,
-0.8104165, 0.2407746, -0.08862474, 0.7921569, 1, 0, 1,
-0.809265, -2.323049, -1.3185, 0.7882353, 1, 0, 1,
-0.8015387, -1.263264, -4.415553, 0.7803922, 1, 0, 1,
-0.7988742, -0.0753141, -1.804748, 0.7764706, 1, 0, 1,
-0.792292, 0.9688554, 1.001068, 0.7686275, 1, 0, 1,
-0.7873829, 0.5704911, -0.2986235, 0.7647059, 1, 0, 1,
-0.7841423, 1.017639, -1.272245, 0.7568628, 1, 0, 1,
-0.7828871, -1.176134, -3.218202, 0.7529412, 1, 0, 1,
-0.7732525, 2.009899, 1.251044, 0.7450981, 1, 0, 1,
-0.7725944, -0.785677, -2.328597, 0.7411765, 1, 0, 1,
-0.7720551, 0.4010159, -1.874827, 0.7333333, 1, 0, 1,
-0.7634544, 1.176333, -2.59869, 0.7294118, 1, 0, 1,
-0.7614502, 1.862667, -0.4275306, 0.7215686, 1, 0, 1,
-0.7470495, 0.9643144, -0.7133747, 0.7176471, 1, 0, 1,
-0.7435293, -1.747532, -3.508246, 0.7098039, 1, 0, 1,
-0.7368368, -0.1703743, -0.913577, 0.7058824, 1, 0, 1,
-0.735008, -0.7480292, -2.949212, 0.6980392, 1, 0, 1,
-0.7349724, -0.2356454, -1.423651, 0.6901961, 1, 0, 1,
-0.7322555, 0.7661888, -0.6942237, 0.6862745, 1, 0, 1,
-0.7289349, 0.3222806, -0.2257623, 0.6784314, 1, 0, 1,
-0.7164572, -0.1080147, -2.627768, 0.6745098, 1, 0, 1,
-0.7032719, 0.3662339, -1.425622, 0.6666667, 1, 0, 1,
-0.70028, 0.7928057, -0.8877918, 0.6627451, 1, 0, 1,
-0.6996889, -0.5395662, -2.119576, 0.654902, 1, 0, 1,
-0.6953195, -2.30907, -4.655288, 0.6509804, 1, 0, 1,
-0.6940452, 0.5474945, -1.398743, 0.6431373, 1, 0, 1,
-0.6929789, -0.3025677, -1.799636, 0.6392157, 1, 0, 1,
-0.6865216, -0.7443154, -3.860706, 0.6313726, 1, 0, 1,
-0.6853289, -1.255517, -3.314932, 0.627451, 1, 0, 1,
-0.681819, -1.362234, -3.287618, 0.6196079, 1, 0, 1,
-0.6808165, -0.7359072, -2.43592, 0.6156863, 1, 0, 1,
-0.6800066, -0.2816792, -1.030024, 0.6078432, 1, 0, 1,
-0.6789097, -0.4338532, -2.563012, 0.6039216, 1, 0, 1,
-0.6774297, -0.1329067, -4.175953, 0.5960785, 1, 0, 1,
-0.6707094, 1.20126, 0.09543053, 0.5882353, 1, 0, 1,
-0.6695694, 1.172078, -0.03992851, 0.5843138, 1, 0, 1,
-0.6645979, 0.6355558, -1.302851, 0.5764706, 1, 0, 1,
-0.6620451, -0.3977954, -1.393567, 0.572549, 1, 0, 1,
-0.6586894, -1.79136, -3.612628, 0.5647059, 1, 0, 1,
-0.656447, -0.7345288, -3.128863, 0.5607843, 1, 0, 1,
-0.6555722, -1.086345, -2.763804, 0.5529412, 1, 0, 1,
-0.6532173, 1.01036, -0.8465198, 0.5490196, 1, 0, 1,
-0.6522783, 0.6360906, -0.5778958, 0.5411765, 1, 0, 1,
-0.6503964, 0.4843836, -1.903171, 0.5372549, 1, 0, 1,
-0.6461551, -2.020992, -2.248344, 0.5294118, 1, 0, 1,
-0.6426529, 1.384132, -2.038416, 0.5254902, 1, 0, 1,
-0.6399202, -1.164854, -3.779423, 0.5176471, 1, 0, 1,
-0.6393189, -0.1313811, -1.469064, 0.5137255, 1, 0, 1,
-0.6271688, -0.3212962, -2.245444, 0.5058824, 1, 0, 1,
-0.6089502, 0.7528039, -0.6485212, 0.5019608, 1, 0, 1,
-0.6063493, 0.6477836, -0.9588068, 0.4941176, 1, 0, 1,
-0.6042946, 0.5475042, 0.3036243, 0.4862745, 1, 0, 1,
-0.6037167, 0.5161844, -1.244344, 0.4823529, 1, 0, 1,
-0.6000056, -0.100949, -0.903823, 0.4745098, 1, 0, 1,
-0.5981342, -1.003526, -3.607404, 0.4705882, 1, 0, 1,
-0.5967401, 0.1235758, -0.1251613, 0.4627451, 1, 0, 1,
-0.5942122, -0.5621064, -3.259415, 0.4588235, 1, 0, 1,
-0.5910004, -0.9115303, -1.409387, 0.4509804, 1, 0, 1,
-0.5849168, 0.4818574, -0.4700962, 0.4470588, 1, 0, 1,
-0.5842643, -0.331711, -2.235606, 0.4392157, 1, 0, 1,
-0.5771843, -0.3838262, -2.345628, 0.4352941, 1, 0, 1,
-0.5771059, 0.03005104, -0.6395643, 0.427451, 1, 0, 1,
-0.5763566, 0.6783207, -1.206588, 0.4235294, 1, 0, 1,
-0.5704489, -1.793644, -4.324643, 0.4156863, 1, 0, 1,
-0.5698672, -1.521477, -1.425513, 0.4117647, 1, 0, 1,
-0.5678678, -0.7766641, -1.629261, 0.4039216, 1, 0, 1,
-0.5612501, -0.8175732, -1.040527, 0.3960784, 1, 0, 1,
-0.5589005, 1.530842, -0.06685087, 0.3921569, 1, 0, 1,
-0.5553907, 1.960096, -0.1907088, 0.3843137, 1, 0, 1,
-0.5527021, -1.06156, -0.4357223, 0.3803922, 1, 0, 1,
-0.5512958, -2.375741, -3.478464, 0.372549, 1, 0, 1,
-0.5477787, 1.492264, -0.09338244, 0.3686275, 1, 0, 1,
-0.546175, 0.3287662, -1.418621, 0.3607843, 1, 0, 1,
-0.5452539, 0.9093033, 0.8435318, 0.3568628, 1, 0, 1,
-0.5439784, -0.7073734, -2.797846, 0.3490196, 1, 0, 1,
-0.5416967, 0.06801745, -1.672463, 0.345098, 1, 0, 1,
-0.5398589, -1.411358, -1.961607, 0.3372549, 1, 0, 1,
-0.534653, 0.1982674, -1.613843, 0.3333333, 1, 0, 1,
-0.5335545, 1.307023, -1.225696, 0.3254902, 1, 0, 1,
-0.5315651, -0.6942693, -2.351955, 0.3215686, 1, 0, 1,
-0.5286666, 1.155399, -1.972395, 0.3137255, 1, 0, 1,
-0.5231152, -2.001423, -2.589269, 0.3098039, 1, 0, 1,
-0.5223677, 0.1001525, -1.827873, 0.3019608, 1, 0, 1,
-0.5222002, 0.906308, -1.682395, 0.2941177, 1, 0, 1,
-0.5209512, -1.143683, -2.994365, 0.2901961, 1, 0, 1,
-0.5170713, -0.5453741, -1.771448, 0.282353, 1, 0, 1,
-0.5135501, 0.376815, -1.898894, 0.2784314, 1, 0, 1,
-0.5120835, -1.152957, -2.148527, 0.2705882, 1, 0, 1,
-0.5086038, -0.9987522, -3.301217, 0.2666667, 1, 0, 1,
-0.5070883, 0.8565654, -0.9700264, 0.2588235, 1, 0, 1,
-0.5018747, -0.2383992, -2.209202, 0.254902, 1, 0, 1,
-0.5018247, -0.7646354, -1.898283, 0.2470588, 1, 0, 1,
-0.5012444, 1.646913, -0.6945612, 0.2431373, 1, 0, 1,
-0.4987861, 1.329984, -0.9820067, 0.2352941, 1, 0, 1,
-0.4986974, 0.4742675, 1.768638, 0.2313726, 1, 0, 1,
-0.4974316, 0.4373584, -0.9642313, 0.2235294, 1, 0, 1,
-0.491329, 0.2947172, -1.250643, 0.2196078, 1, 0, 1,
-0.4908012, 1.327325, -0.688343, 0.2117647, 1, 0, 1,
-0.4875995, -1.94872, -1.348653, 0.2078431, 1, 0, 1,
-0.4869214, -0.1175338, -0.5615978, 0.2, 1, 0, 1,
-0.4769557, -1.43706, -3.621095, 0.1921569, 1, 0, 1,
-0.4757519, -1.313383, -4.432818, 0.1882353, 1, 0, 1,
-0.4750549, -1.272263, -2.397796, 0.1803922, 1, 0, 1,
-0.475034, -0.08073938, -2.569829, 0.1764706, 1, 0, 1,
-0.4732592, -1.559109, -2.569014, 0.1686275, 1, 0, 1,
-0.4697488, 0.3423302, -1.525427, 0.1647059, 1, 0, 1,
-0.4642447, -1.489545, -1.207367, 0.1568628, 1, 0, 1,
-0.4642337, 1.388074, 0.5230122, 0.1529412, 1, 0, 1,
-0.4632629, -0.7729817, -4.224123, 0.145098, 1, 0, 1,
-0.4629002, -0.6946012, -2.81386, 0.1411765, 1, 0, 1,
-0.4615149, 0.3628273, -2.522396, 0.1333333, 1, 0, 1,
-0.4597849, 0.8458979, -0.2525448, 0.1294118, 1, 0, 1,
-0.4593602, -1.961554, -2.726258, 0.1215686, 1, 0, 1,
-0.4559149, -0.09194617, -0.8474399, 0.1176471, 1, 0, 1,
-0.4558698, 1.021661, -0.01295947, 0.1098039, 1, 0, 1,
-0.4541849, 0.6369073, 1.733545, 0.1058824, 1, 0, 1,
-0.4521098, -1.201806, -0.7522299, 0.09803922, 1, 0, 1,
-0.4518092, 0.4924459, -0.8935723, 0.09019608, 1, 0, 1,
-0.4496044, -1.257121, -4.696031, 0.08627451, 1, 0, 1,
-0.4480899, 0.09620997, -0.8753594, 0.07843138, 1, 0, 1,
-0.4480399, -1.027962, -3.370466, 0.07450981, 1, 0, 1,
-0.4472843, -0.8451075, -1.697336, 0.06666667, 1, 0, 1,
-0.432985, -0.2728648, -1.451611, 0.0627451, 1, 0, 1,
-0.4297164, 1.126274, 0.9787526, 0.05490196, 1, 0, 1,
-0.4288854, 0.5967544, -1.534506, 0.05098039, 1, 0, 1,
-0.4224201, -0.6559066, -1.493391, 0.04313726, 1, 0, 1,
-0.4202083, 0.7485965, -2.40347, 0.03921569, 1, 0, 1,
-0.4169235, 0.01544836, -2.293486, 0.03137255, 1, 0, 1,
-0.4156023, -1.0823, -3.529122, 0.02745098, 1, 0, 1,
-0.4114412, -0.4412363, -3.277208, 0.01960784, 1, 0, 1,
-0.4084911, -0.173581, -0.7393365, 0.01568628, 1, 0, 1,
-0.3994083, 0.8241359, 0.1724575, 0.007843138, 1, 0, 1,
-0.3993597, -0.01154659, -2.703789, 0.003921569, 1, 0, 1,
-0.3926037, -0.7183289, -1.769529, 0, 1, 0.003921569, 1,
-0.3924384, 0.151556, -1.577257, 0, 1, 0.01176471, 1,
-0.3897392, 0.6316114, -0.6029667, 0, 1, 0.01568628, 1,
-0.3878858, 0.004358798, -0.9953757, 0, 1, 0.02352941, 1,
-0.3868782, 0.3235723, -1.707092, 0, 1, 0.02745098, 1,
-0.382818, 0.6225832, -1.206731, 0, 1, 0.03529412, 1,
-0.382465, -0.259017, -2.282325, 0, 1, 0.03921569, 1,
-0.3736272, -0.7193151, -1.896645, 0, 1, 0.04705882, 1,
-0.3735085, -1.898333, -3.552437, 0, 1, 0.05098039, 1,
-0.3732087, 0.3424529, 0.2771774, 0, 1, 0.05882353, 1,
-0.3714261, -0.1139002, -1.225026, 0, 1, 0.0627451, 1,
-0.369699, 1.699668, 0.6530994, 0, 1, 0.07058824, 1,
-0.3678657, -2.227867, -2.307201, 0, 1, 0.07450981, 1,
-0.3625937, 0.3130229, -0.05889553, 0, 1, 0.08235294, 1,
-0.3613219, -1.046734, -2.948873, 0, 1, 0.08627451, 1,
-0.3596414, 0.6058582, -0.8695931, 0, 1, 0.09411765, 1,
-0.3580016, -1.343725, -4.407662, 0, 1, 0.1019608, 1,
-0.3577494, -0.9155107, -3.561799, 0, 1, 0.1058824, 1,
-0.3519936, -0.9937112, -4.168378, 0, 1, 0.1137255, 1,
-0.3505654, -0.7586629, -2.562011, 0, 1, 0.1176471, 1,
-0.3477662, -0.1006574, -2.252911, 0, 1, 0.1254902, 1,
-0.3466005, -0.3253932, -2.134372, 0, 1, 0.1294118, 1,
-0.3389856, 1.847416, 0.3235939, 0, 1, 0.1372549, 1,
-0.3381079, -1.716701, -3.34596, 0, 1, 0.1411765, 1,
-0.3310421, -1.031119, -2.854293, 0, 1, 0.1490196, 1,
-0.3293043, -0.5783459, -3.630594, 0, 1, 0.1529412, 1,
-0.3269975, 0.6731321, -0.8506553, 0, 1, 0.1607843, 1,
-0.3268422, 0.5754399, -0.6183631, 0, 1, 0.1647059, 1,
-0.3243284, -0.4595879, -4.218483, 0, 1, 0.172549, 1,
-0.3241779, 0.4583984, -0.6593709, 0, 1, 0.1764706, 1,
-0.3176695, 1.285282, -0.3223885, 0, 1, 0.1843137, 1,
-0.3125005, 0.7442521, -0.8483694, 0, 1, 0.1882353, 1,
-0.3115284, -0.9402969, -2.708523, 0, 1, 0.1960784, 1,
-0.3114589, -0.2434193, -2.372764, 0, 1, 0.2039216, 1,
-0.3060816, 0.5864441, -0.7250909, 0, 1, 0.2078431, 1,
-0.3007386, 0.3198872, -0.3541234, 0, 1, 0.2156863, 1,
-0.2962095, -0.490799, -3.49018, 0, 1, 0.2196078, 1,
-0.2946987, -0.4603693, -1.752852, 0, 1, 0.227451, 1,
-0.2913005, 0.7825433, 0.2479236, 0, 1, 0.2313726, 1,
-0.2908353, -0.448152, -1.762463, 0, 1, 0.2392157, 1,
-0.2906413, 0.9296464, -0.7795321, 0, 1, 0.2431373, 1,
-0.2863783, 1.236657, -0.05169177, 0, 1, 0.2509804, 1,
-0.2860682, -0.5769351, -2.895876, 0, 1, 0.254902, 1,
-0.2853813, -0.4427087, -2.981008, 0, 1, 0.2627451, 1,
-0.2840393, -0.2726632, -2.856792, 0, 1, 0.2666667, 1,
-0.2811527, 2.007269, -1.258289, 0, 1, 0.2745098, 1,
-0.2790099, 0.3930471, -2.130919, 0, 1, 0.2784314, 1,
-0.2747698, 0.5390954, 0.2376771, 0, 1, 0.2862745, 1,
-0.2744188, -1.316123, -1.943478, 0, 1, 0.2901961, 1,
-0.2705073, -1.196564, -2.05653, 0, 1, 0.2980392, 1,
-0.2699324, -0.309209, -2.056338, 0, 1, 0.3058824, 1,
-0.2655719, 1.137419, 0.9255981, 0, 1, 0.3098039, 1,
-0.2654918, 0.6681114, -0.8515712, 0, 1, 0.3176471, 1,
-0.265374, 1.193614, 1.226317, 0, 1, 0.3215686, 1,
-0.2588729, 0.1073235, -1.399194, 0, 1, 0.3294118, 1,
-0.2535821, 1.127767, -0.7982514, 0, 1, 0.3333333, 1,
-0.2371503, 1.110095, -0.2893323, 0, 1, 0.3411765, 1,
-0.2354064, -0.05976757, -2.100034, 0, 1, 0.345098, 1,
-0.2295352, -0.8049431, -4.463095, 0, 1, 0.3529412, 1,
-0.229006, -0.6781834, -3.901926, 0, 1, 0.3568628, 1,
-0.2226337, -0.06741484, -2.669924, 0, 1, 0.3647059, 1,
-0.2222521, 0.5685465, -0.06132613, 0, 1, 0.3686275, 1,
-0.2212227, 0.2415081, -0.2679077, 0, 1, 0.3764706, 1,
-0.2202083, 1.227806, -1.043959, 0, 1, 0.3803922, 1,
-0.2122667, 0.0106229, -2.854594, 0, 1, 0.3882353, 1,
-0.2121476, -0.4878177, -1.063003, 0, 1, 0.3921569, 1,
-0.2079149, -1.995633, -2.754771, 0, 1, 0.4, 1,
-0.2075533, -0.2997991, -1.983534, 0, 1, 0.4078431, 1,
-0.2060579, 1.353381, -0.4301575, 0, 1, 0.4117647, 1,
-0.2026239, -0.1834149, -1.721482, 0, 1, 0.4196078, 1,
-0.2019219, 0.9490703, -0.2683088, 0, 1, 0.4235294, 1,
-0.1988426, 0.7201478, -0.4624468, 0, 1, 0.4313726, 1,
-0.1980764, 0.8464273, -2.110633, 0, 1, 0.4352941, 1,
-0.1975409, 1.8903, -0.3671231, 0, 1, 0.4431373, 1,
-0.1930799, -0.3926167, -4.383583, 0, 1, 0.4470588, 1,
-0.1930385, -1.529418, -3.737925, 0, 1, 0.454902, 1,
-0.1860266, -1.380455, -2.941367, 0, 1, 0.4588235, 1,
-0.1856351, 1.111376, 1.780007, 0, 1, 0.4666667, 1,
-0.181645, -0.5425811, -1.37174, 0, 1, 0.4705882, 1,
-0.1803419, 1.216686, 1.334032, 0, 1, 0.4784314, 1,
-0.1728771, 2.285354, 1.106964, 0, 1, 0.4823529, 1,
-0.166177, -0.2492029, -3.190466, 0, 1, 0.4901961, 1,
-0.1621116, 2.957841, -0.4790719, 0, 1, 0.4941176, 1,
-0.1609589, -1.409922, -3.594566, 0, 1, 0.5019608, 1,
-0.1534574, 1.403767, -0.640941, 0, 1, 0.509804, 1,
-0.1500371, 1.36733, 1.202769, 0, 1, 0.5137255, 1,
-0.1457489, -0.4784931, -2.510554, 0, 1, 0.5215687, 1,
-0.1416066, 0.9088112, -0.6940444, 0, 1, 0.5254902, 1,
-0.1390331, 0.3242006, -2.347502, 0, 1, 0.5333334, 1,
-0.1387395, -0.01815519, -0.5553016, 0, 1, 0.5372549, 1,
-0.1377316, -0.5806227, -2.250269, 0, 1, 0.5450981, 1,
-0.1297681, 1.418761, 0.8516495, 0, 1, 0.5490196, 1,
-0.1291118, 1.858228, 0.1896734, 0, 1, 0.5568628, 1,
-0.1275883, -0.1323878, -0.3443532, 0, 1, 0.5607843, 1,
-0.1244692, -0.6819006, -2.697737, 0, 1, 0.5686275, 1,
-0.1201272, -1.024656, -3.312994, 0, 1, 0.572549, 1,
-0.1166007, 1.366625, -1.881012, 0, 1, 0.5803922, 1,
-0.1128549, 0.105159, 0.4116068, 0, 1, 0.5843138, 1,
-0.1109728, -0.8042223, -4.281468, 0, 1, 0.5921569, 1,
-0.1101257, -0.2795612, -2.604181, 0, 1, 0.5960785, 1,
-0.1077808, 2.046152, -1.188186, 0, 1, 0.6039216, 1,
-0.1013801, -1.446962, -3.307452, 0, 1, 0.6117647, 1,
-0.09622251, 1.764917, -0.2637495, 0, 1, 0.6156863, 1,
-0.09613923, 0.8804623, 1.002018, 0, 1, 0.6235294, 1,
-0.09531979, 1.069252, -0.7280977, 0, 1, 0.627451, 1,
-0.09109945, -0.6658734, -2.118967, 0, 1, 0.6352941, 1,
-0.09040964, 1.189803, -0.1004853, 0, 1, 0.6392157, 1,
-0.08927586, 0.7692503, 0.404909, 0, 1, 0.6470588, 1,
-0.08848193, 0.2980515, 0.04078848, 0, 1, 0.6509804, 1,
-0.08765375, -0.07238709, -2.495647, 0, 1, 0.6588235, 1,
-0.07979199, -1.875331, -4.268713, 0, 1, 0.6627451, 1,
-0.07751536, 0.6541994, 0.6306881, 0, 1, 0.6705883, 1,
-0.07389701, -1.829814, -4.059715, 0, 1, 0.6745098, 1,
-0.0738223, -0.9326847, -1.787312, 0, 1, 0.682353, 1,
-0.0722197, 0.9544368, 0.6411393, 0, 1, 0.6862745, 1,
-0.06916945, 0.03739066, -2.525514, 0, 1, 0.6941177, 1,
-0.06745292, 0.1773893, 0.02537796, 0, 1, 0.7019608, 1,
-0.06618401, -0.4541187, -2.362048, 0, 1, 0.7058824, 1,
-0.06600586, 0.1831489, 0.4267484, 0, 1, 0.7137255, 1,
-0.0652649, -0.4823431, -2.586482, 0, 1, 0.7176471, 1,
-0.0644687, -0.2059587, -3.765081, 0, 1, 0.7254902, 1,
-0.06390789, -0.187583, -0.7502895, 0, 1, 0.7294118, 1,
-0.06148592, -0.08623112, -4.143061, 0, 1, 0.7372549, 1,
-0.06110112, 0.3073169, -0.6348854, 0, 1, 0.7411765, 1,
-0.04971409, -0.6009605, -3.782061, 0, 1, 0.7490196, 1,
-0.04960774, -0.665042, -4.340504, 0, 1, 0.7529412, 1,
-0.04143598, 0.2284454, 2.139704, 0, 1, 0.7607843, 1,
-0.03613691, 1.395353, 0.8695383, 0, 1, 0.7647059, 1,
-0.03605267, 0.8698683, -1.266542, 0, 1, 0.772549, 1,
-0.03522624, 0.7505229, -0.6711884, 0, 1, 0.7764706, 1,
-0.03398243, -0.1668387, -1.973156, 0, 1, 0.7843137, 1,
-0.03349182, -1.748663, -3.531801, 0, 1, 0.7882353, 1,
-0.03202679, 0.4805435, 0.9429939, 0, 1, 0.7960784, 1,
-0.03183724, 1.148727, -0.5136064, 0, 1, 0.8039216, 1,
-0.03102657, -1.379521, -1.952475, 0, 1, 0.8078431, 1,
-0.03005849, 0.215368, -1.30865, 0, 1, 0.8156863, 1,
-0.02725849, -1.351972, -1.125869, 0, 1, 0.8196079, 1,
-0.02270975, 0.3928382, 0.1658633, 0, 1, 0.827451, 1,
-0.02110607, -1.239537, -2.628599, 0, 1, 0.8313726, 1,
-0.01702448, -2.011784, -2.657219, 0, 1, 0.8392157, 1,
-0.0158339, -1.661238, -3.163837, 0, 1, 0.8431373, 1,
-0.01245783, 0.4793396, 0.08328819, 0, 1, 0.8509804, 1,
-0.01063554, 0.3875293, 1.171456, 0, 1, 0.854902, 1,
-0.01053626, 0.4240043, 0.1579935, 0, 1, 0.8627451, 1,
-0.007843344, 0.2759542, -0.5102938, 0, 1, 0.8666667, 1,
-0.005235008, 0.480253, -1.68323, 0, 1, 0.8745098, 1,
-0.004303466, -0.321717, -4.794382, 0, 1, 0.8784314, 1,
-0.004206322, 0.1616347, 0.59794, 0, 1, 0.8862745, 1,
-0.003507905, -0.08181441, -4.108242, 0, 1, 0.8901961, 1,
-0.001584583, -0.2879328, -4.960754, 0, 1, 0.8980392, 1,
9.729868e-05, -0.2730016, 3.302524, 0, 1, 0.9058824, 1,
0.0001677787, -0.4019569, 4.565407, 0, 1, 0.9098039, 1,
0.003525772, -0.3163299, 0.2119654, 0, 1, 0.9176471, 1,
0.003971705, -0.6815978, 3.925812, 0, 1, 0.9215686, 1,
0.004237849, 1.378876, 0.2048486, 0, 1, 0.9294118, 1,
0.005068492, 0.4549502, -0.9350443, 0, 1, 0.9333333, 1,
0.005831828, 1.137617, 1.002232, 0, 1, 0.9411765, 1,
0.01064659, 0.9020294, 0.6621359, 0, 1, 0.945098, 1,
0.01612444, -0.6074274, 3.762061, 0, 1, 0.9529412, 1,
0.01981407, -0.4079081, 2.928888, 0, 1, 0.9568627, 1,
0.02818941, -0.9255169, 2.545796, 0, 1, 0.9647059, 1,
0.0295176, 0.1352074, 1.577268, 0, 1, 0.9686275, 1,
0.03532359, 0.1862565, -0.7174848, 0, 1, 0.9764706, 1,
0.03753531, 1.225936, -2.969666, 0, 1, 0.9803922, 1,
0.03989943, -0.5651569, 4.395998, 0, 1, 0.9882353, 1,
0.04054518, -0.5348736, 3.823472, 0, 1, 0.9921569, 1,
0.04076421, 0.1610378, -1.858723, 0, 1, 1, 1,
0.04101555, -1.058605, 3.135769, 0, 0.9921569, 1, 1,
0.04135758, 0.7356356, -0.6012887, 0, 0.9882353, 1, 1,
0.0432439, 1.081575, -0.3696563, 0, 0.9803922, 1, 1,
0.0434755, -2.104126, 4.067204, 0, 0.9764706, 1, 1,
0.04382998, 0.6403879, 0.6730338, 0, 0.9686275, 1, 1,
0.0515457, -1.873097, 3.106404, 0, 0.9647059, 1, 1,
0.05195129, 0.3437099, 0.1601738, 0, 0.9568627, 1, 1,
0.05374162, 0.875442, -0.7462884, 0, 0.9529412, 1, 1,
0.05712687, 0.7335779, 0.4685547, 0, 0.945098, 1, 1,
0.05820734, -0.8515145, 2.200363, 0, 0.9411765, 1, 1,
0.05827191, -1.089716, 1.807975, 0, 0.9333333, 1, 1,
0.06591655, -0.6846144, 3.1379, 0, 0.9294118, 1, 1,
0.06600123, -1.704448, 2.885088, 0, 0.9215686, 1, 1,
0.06650819, 0.180564, 0.125052, 0, 0.9176471, 1, 1,
0.07348146, 0.5706114, 0.04888576, 0, 0.9098039, 1, 1,
0.07520919, 1.07874, -0.3361039, 0, 0.9058824, 1, 1,
0.07581969, -0.5698512, 0.8822351, 0, 0.8980392, 1, 1,
0.07633857, 0.1562715, 0.6386467, 0, 0.8901961, 1, 1,
0.07736081, 0.3819095, 1.976105, 0, 0.8862745, 1, 1,
0.08159357, 0.3402539, -0.3495644, 0, 0.8784314, 1, 1,
0.08251581, -0.9813698, 0.9076367, 0, 0.8745098, 1, 1,
0.08709649, 0.02947659, 0.3721692, 0, 0.8666667, 1, 1,
0.08738579, 1.030071, 0.08235373, 0, 0.8627451, 1, 1,
0.09150876, 0.6147439, -0.2388662, 0, 0.854902, 1, 1,
0.09428432, 1.114508, 0.6400531, 0, 0.8509804, 1, 1,
0.0943765, 0.06007713, 1.526269, 0, 0.8431373, 1, 1,
0.09801816, -1.190211, 3.341856, 0, 0.8392157, 1, 1,
0.09893606, 1.224997, -1.228953, 0, 0.8313726, 1, 1,
0.09977645, -1.611613, 3.394421, 0, 0.827451, 1, 1,
0.1032486, -1.399597, 2.836648, 0, 0.8196079, 1, 1,
0.1072231, 0.3946477, -1.453461, 0, 0.8156863, 1, 1,
0.1081232, -0.305929, 3.014121, 0, 0.8078431, 1, 1,
0.1150766, -0.9787769, 2.117887, 0, 0.8039216, 1, 1,
0.1151137, -0.533636, 3.214429, 0, 0.7960784, 1, 1,
0.1211688, -0.03265024, 2.13354, 0, 0.7882353, 1, 1,
0.1216115, 0.4025176, 2.034793, 0, 0.7843137, 1, 1,
0.1242053, 0.5737959, -0.7773178, 0, 0.7764706, 1, 1,
0.1319028, -0.5721671, 2.833712, 0, 0.772549, 1, 1,
0.132362, -0.1634073, 4.161342, 0, 0.7647059, 1, 1,
0.1369736, 2.707012, 1.30655, 0, 0.7607843, 1, 1,
0.1384191, -0.5499644, 2.673079, 0, 0.7529412, 1, 1,
0.1388939, 0.3588462, -1.74989, 0, 0.7490196, 1, 1,
0.1421948, -0.7481954, 1.4781, 0, 0.7411765, 1, 1,
0.1423078, -0.6638353, 1.155747, 0, 0.7372549, 1, 1,
0.1441625, 0.9978687, 0.1920269, 0, 0.7294118, 1, 1,
0.1459573, 0.6332761, 0.8534446, 0, 0.7254902, 1, 1,
0.1470517, 0.1097282, 0.8826851, 0, 0.7176471, 1, 1,
0.1478521, 1.848513, 0.9805194, 0, 0.7137255, 1, 1,
0.1479971, 0.6956969, 1.070949, 0, 0.7058824, 1, 1,
0.1508017, 0.03367727, 1.508761, 0, 0.6980392, 1, 1,
0.1542516, -1.39801, 4.097156, 0, 0.6941177, 1, 1,
0.1571647, 0.03833104, 1.62923, 0, 0.6862745, 1, 1,
0.1640972, -1.092221, 2.430785, 0, 0.682353, 1, 1,
0.1646747, -0.315031, 1.816369, 0, 0.6745098, 1, 1,
0.1721037, 1.406996, -0.4582515, 0, 0.6705883, 1, 1,
0.1737268, -1.299058, 2.045933, 0, 0.6627451, 1, 1,
0.1755894, 0.3401557, 1.247957, 0, 0.6588235, 1, 1,
0.1800845, -0.0761882, 2.030939, 0, 0.6509804, 1, 1,
0.1815284, 0.2332721, 1.288517, 0, 0.6470588, 1, 1,
0.1821702, 1.709363, -0.6534261, 0, 0.6392157, 1, 1,
0.1822306, 0.1285177, 1.086199, 0, 0.6352941, 1, 1,
0.1839897, -0.3253344, 3.733602, 0, 0.627451, 1, 1,
0.1852193, 0.1283133, -0.2156986, 0, 0.6235294, 1, 1,
0.1858606, 0.8587297, 0.4759446, 0, 0.6156863, 1, 1,
0.1879102, -0.1321386, 2.855872, 0, 0.6117647, 1, 1,
0.2022692, -2.064956, 2.3817, 0, 0.6039216, 1, 1,
0.2032359, -0.6604699, 2.483675, 0, 0.5960785, 1, 1,
0.203593, -0.3234179, 2.495043, 0, 0.5921569, 1, 1,
0.2058114, -1.09222, 2.844664, 0, 0.5843138, 1, 1,
0.2059484, -0.8913834, 1.885796, 0, 0.5803922, 1, 1,
0.2092882, -0.4346445, 2.795826, 0, 0.572549, 1, 1,
0.2117306, -0.143061, 3.146027, 0, 0.5686275, 1, 1,
0.2125768, -1.0341, 2.020122, 0, 0.5607843, 1, 1,
0.2139617, 1.796622, 1.272302, 0, 0.5568628, 1, 1,
0.2141119, 1.185541, 1.962523, 0, 0.5490196, 1, 1,
0.2160082, 0.187566, 1.473023, 0, 0.5450981, 1, 1,
0.2167225, -0.2476645, 2.333133, 0, 0.5372549, 1, 1,
0.2195062, -0.6275167, 4.621639, 0, 0.5333334, 1, 1,
0.2213768, -1.427013, 3.428166, 0, 0.5254902, 1, 1,
0.2244619, -0.3070418, 1.489923, 0, 0.5215687, 1, 1,
0.2249341, 0.3937564, 1.156384, 0, 0.5137255, 1, 1,
0.2265862, -0.6085382, 1.522273, 0, 0.509804, 1, 1,
0.2295294, -0.6454947, 2.398951, 0, 0.5019608, 1, 1,
0.2302349, -0.8997473, 1.953291, 0, 0.4941176, 1, 1,
0.2302893, -1.588454, 2.639407, 0, 0.4901961, 1, 1,
0.2303042, -0.01068185, 3.103123, 0, 0.4823529, 1, 1,
0.233041, 0.3569129, 1.164311, 0, 0.4784314, 1, 1,
0.2375235, 0.8721194, -0.6051146, 0, 0.4705882, 1, 1,
0.2427154, 0.1659981, 1.793094, 0, 0.4666667, 1, 1,
0.2487258, -0.4270851, 3.151989, 0, 0.4588235, 1, 1,
0.2489598, -1.428303, 4.135749, 0, 0.454902, 1, 1,
0.2511763, -0.3238229, 3.236473, 0, 0.4470588, 1, 1,
0.2539556, -0.05924626, 1.708892, 0, 0.4431373, 1, 1,
0.2552458, -0.454684, 3.092509, 0, 0.4352941, 1, 1,
0.2568506, 1.161096, -1.700371, 0, 0.4313726, 1, 1,
0.2627076, 0.2297509, 1.799644, 0, 0.4235294, 1, 1,
0.2638885, 0.5721081, -0.2478735, 0, 0.4196078, 1, 1,
0.2641038, -1.470766, 2.897821, 0, 0.4117647, 1, 1,
0.265462, -0.2025766, 1.087945, 0, 0.4078431, 1, 1,
0.2657742, 2.266364, 1.043739, 0, 0.4, 1, 1,
0.2703402, -0.7442553, 3.566759, 0, 0.3921569, 1, 1,
0.2752657, 1.032786, 1.061378, 0, 0.3882353, 1, 1,
0.2754785, 0.8314448, -0.231382, 0, 0.3803922, 1, 1,
0.277454, -0.3753629, 3.303109, 0, 0.3764706, 1, 1,
0.2874734, -1.055076, 2.547146, 0, 0.3686275, 1, 1,
0.2892006, -0.2327649, 1.571448, 0, 0.3647059, 1, 1,
0.2943108, 1.95265, 0.2170319, 0, 0.3568628, 1, 1,
0.2959467, -1.347226, 4.849864, 0, 0.3529412, 1, 1,
0.3003926, 0.4101556, -0.5402016, 0, 0.345098, 1, 1,
0.3011194, 0.1669001, 0.225223, 0, 0.3411765, 1, 1,
0.3055956, 1.643141, 2.52551, 0, 0.3333333, 1, 1,
0.3066446, 0.5864643, 1.187307, 0, 0.3294118, 1, 1,
0.3085282, 0.1187265, 1.200356, 0, 0.3215686, 1, 1,
0.3111613, 1.573283, 0.321772, 0, 0.3176471, 1, 1,
0.3129996, -0.4113359, 2.659067, 0, 0.3098039, 1, 1,
0.3135243, 0.2463098, 1.364241, 0, 0.3058824, 1, 1,
0.3172773, 1.203387, -0.5567082, 0, 0.2980392, 1, 1,
0.3183787, -1.144805, 1.942977, 0, 0.2901961, 1, 1,
0.3235916, 0.3704365, 1.153461, 0, 0.2862745, 1, 1,
0.3273003, -1.397289, 2.30318, 0, 0.2784314, 1, 1,
0.3330815, -1.668491, 2.987045, 0, 0.2745098, 1, 1,
0.3350804, 0.3567485, 0.5299316, 0, 0.2666667, 1, 1,
0.3414542, -0.1069093, 2.997607, 0, 0.2627451, 1, 1,
0.344594, 0.5390472, -0.2802315, 0, 0.254902, 1, 1,
0.3466785, -1.284205, 2.825775, 0, 0.2509804, 1, 1,
0.3515773, -0.04331647, 1.037676, 0, 0.2431373, 1, 1,
0.3521814, 0.8439002, 0.9086528, 0, 0.2392157, 1, 1,
0.3556616, 0.3827376, -0.1911992, 0, 0.2313726, 1, 1,
0.3571221, 1.142703, 1.127223, 0, 0.227451, 1, 1,
0.3657145, -2.344611, 2.11018, 0, 0.2196078, 1, 1,
0.3669477, -0.1534177, 1.426764, 0, 0.2156863, 1, 1,
0.3700964, -1.168847, 3.191591, 0, 0.2078431, 1, 1,
0.3737003, 0.9411309, -0.7502417, 0, 0.2039216, 1, 1,
0.3795422, 1.175928, 1.247726, 0, 0.1960784, 1, 1,
0.3808005, -1.492271, 4.539684, 0, 0.1882353, 1, 1,
0.380931, 0.6943154, 0.3003975, 0, 0.1843137, 1, 1,
0.3812027, 0.596628, 0.1439007, 0, 0.1764706, 1, 1,
0.3845325, -0.2166114, 1.263455, 0, 0.172549, 1, 1,
0.3898439, -0.873143, 4.694735, 0, 0.1647059, 1, 1,
0.396002, 1.675221, -0.3427723, 0, 0.1607843, 1, 1,
0.3975956, -0.6695213, 4.117642, 0, 0.1529412, 1, 1,
0.4058141, -1.323455, 2.457613, 0, 0.1490196, 1, 1,
0.4062971, -0.7237846, 1.27606, 0, 0.1411765, 1, 1,
0.4105401, 0.05008643, 2.03038, 0, 0.1372549, 1, 1,
0.411488, -1.571271, 3.50189, 0, 0.1294118, 1, 1,
0.4118604, 0.1080339, 2.203558, 0, 0.1254902, 1, 1,
0.4128639, 0.1656983, 1.615169, 0, 0.1176471, 1, 1,
0.4174662, 0.903322, 0.5843821, 0, 0.1137255, 1, 1,
0.4212972, -0.8743864, 2.196437, 0, 0.1058824, 1, 1,
0.4239777, -1.655315, 3.553833, 0, 0.09803922, 1, 1,
0.426883, 0.306918, 1.349349, 0, 0.09411765, 1, 1,
0.4287312, 0.6055489, -1.462416, 0, 0.08627451, 1, 1,
0.4308936, 1.013059, 0.1266987, 0, 0.08235294, 1, 1,
0.4348346, 0.3485537, 1.423639, 0, 0.07450981, 1, 1,
0.4371379, 1.009298, 0.04135093, 0, 0.07058824, 1, 1,
0.4400408, 0.5099735, 0.2870041, 0, 0.0627451, 1, 1,
0.4406228, 1.389226, 1.075675, 0, 0.05882353, 1, 1,
0.4413897, 0.8892015, 0.5122943, 0, 0.05098039, 1, 1,
0.4422136, 1.273886, 0.5947253, 0, 0.04705882, 1, 1,
0.4514381, -1.191607, 1.397147, 0, 0.03921569, 1, 1,
0.4520541, 0.8906862, 0.3297674, 0, 0.03529412, 1, 1,
0.454533, 2.070649, 0.08080009, 0, 0.02745098, 1, 1,
0.4547828, 1.450328, 0.6456517, 0, 0.02352941, 1, 1,
0.4585518, -1.084362, 2.106998, 0, 0.01568628, 1, 1,
0.464164, 1.386852, 1.440956, 0, 0.01176471, 1, 1,
0.465696, -0.4355317, 2.676345, 0, 0.003921569, 1, 1,
0.4673146, 0.9282713, 0.5995811, 0.003921569, 0, 1, 1,
0.4703461, 1.524244, 0.1039952, 0.007843138, 0, 1, 1,
0.4708309, -0.09791908, 2.594079, 0.01568628, 0, 1, 1,
0.4720236, -0.4844581, 2.216038, 0.01960784, 0, 1, 1,
0.4739417, -1.558563, 4.156908, 0.02745098, 0, 1, 1,
0.474678, 0.3604497, 1.227302, 0.03137255, 0, 1, 1,
0.4763876, -0.1809473, 1.989372, 0.03921569, 0, 1, 1,
0.4777916, 1.613968, 0.6007365, 0.04313726, 0, 1, 1,
0.4781831, -1.297901, 3.217814, 0.05098039, 0, 1, 1,
0.4809181, -0.6831619, 4.959328, 0.05490196, 0, 1, 1,
0.4839014, 0.4245237, 1.050951, 0.0627451, 0, 1, 1,
0.4856838, 1.562217, 0.3356646, 0.06666667, 0, 1, 1,
0.4878112, 0.04072636, 3.025708, 0.07450981, 0, 1, 1,
0.4880683, -0.9302161, 1.678503, 0.07843138, 0, 1, 1,
0.4929549, -1.999576, 2.691353, 0.08627451, 0, 1, 1,
0.4931094, 0.05549085, 0.02363903, 0.09019608, 0, 1, 1,
0.4934182, -0.3094065, 3.939904, 0.09803922, 0, 1, 1,
0.4948798, -0.8652828, 4.111642, 0.1058824, 0, 1, 1,
0.4977755, 1.392145, -0.3011155, 0.1098039, 0, 1, 1,
0.4998797, 1.020654, 0.981442, 0.1176471, 0, 1, 1,
0.5011382, 0.4067768, 0.4320871, 0.1215686, 0, 1, 1,
0.5023811, -1.702894, 2.85659, 0.1294118, 0, 1, 1,
0.5037251, -1.181024, 2.168579, 0.1333333, 0, 1, 1,
0.5038095, 0.3243958, 0.9034598, 0.1411765, 0, 1, 1,
0.5074592, 0.07419695, 2.39092, 0.145098, 0, 1, 1,
0.5105101, 0.7953925, 0.618031, 0.1529412, 0, 1, 1,
0.5148324, 1.036699, -0.9699593, 0.1568628, 0, 1, 1,
0.5172272, 0.01266684, 0.3776403, 0.1647059, 0, 1, 1,
0.5201136, 1.745433, 0.9427112, 0.1686275, 0, 1, 1,
0.5206252, -0.6948353, 2.014754, 0.1764706, 0, 1, 1,
0.5235668, 0.50876, -0.7682174, 0.1803922, 0, 1, 1,
0.5241081, 0.001741725, 1.462205, 0.1882353, 0, 1, 1,
0.5290685, -0.2771984, 2.640171, 0.1921569, 0, 1, 1,
0.5306999, -2.018509, 3.380198, 0.2, 0, 1, 1,
0.5318764, -0.2412732, 2.507006, 0.2078431, 0, 1, 1,
0.53475, -0.01544911, 1.499538, 0.2117647, 0, 1, 1,
0.5348148, 1.137341, 0.704995, 0.2196078, 0, 1, 1,
0.5348521, -0.6786379, 0.3031596, 0.2235294, 0, 1, 1,
0.5354182, 0.3984174, 0.4859942, 0.2313726, 0, 1, 1,
0.5377124, -0.05822388, 1.511909, 0.2352941, 0, 1, 1,
0.5441938, -0.4354628, 1.710841, 0.2431373, 0, 1, 1,
0.5522929, 0.7538647, 1.695976, 0.2470588, 0, 1, 1,
0.5540215, 0.4757726, 2.368404, 0.254902, 0, 1, 1,
0.5566965, -2.028291, 2.879954, 0.2588235, 0, 1, 1,
0.5570628, -0.7062497, 0.9363085, 0.2666667, 0, 1, 1,
0.5577624, 1.959952, -0.09722613, 0.2705882, 0, 1, 1,
0.5619193, -1.624196, 3.157767, 0.2784314, 0, 1, 1,
0.5653492, 0.3096516, 2.168952, 0.282353, 0, 1, 1,
0.567557, 0.4852254, 2.150034, 0.2901961, 0, 1, 1,
0.5717033, -0.7332345, 2.42004, 0.2941177, 0, 1, 1,
0.5725407, -1.344387, 4.097707, 0.3019608, 0, 1, 1,
0.5737603, 0.1833356, 1.632595, 0.3098039, 0, 1, 1,
0.5762132, -0.2505303, 2.350965, 0.3137255, 0, 1, 1,
0.5773689, 1.446952, 1.065025, 0.3215686, 0, 1, 1,
0.5789638, -1.196463, 3.287606, 0.3254902, 0, 1, 1,
0.5822025, 0.7937587, -0.4390822, 0.3333333, 0, 1, 1,
0.5838571, -1.049416, 4.170244, 0.3372549, 0, 1, 1,
0.5846801, -1.966545, 3.108167, 0.345098, 0, 1, 1,
0.5848134, 0.06237888, 1.570757, 0.3490196, 0, 1, 1,
0.5877695, -0.9009321, 2.478529, 0.3568628, 0, 1, 1,
0.5882732, 0.02885242, 2.296442, 0.3607843, 0, 1, 1,
0.5912486, -0.9606186, 3.295991, 0.3686275, 0, 1, 1,
0.5942497, 0.08320007, 1.256412, 0.372549, 0, 1, 1,
0.602933, -0.1344515, 1.331712, 0.3803922, 0, 1, 1,
0.6056273, 2.109615, -0.421769, 0.3843137, 0, 1, 1,
0.6081402, 0.4102306, 0.8502746, 0.3921569, 0, 1, 1,
0.6085126, -1.691012, 3.051476, 0.3960784, 0, 1, 1,
0.6091497, -0.1300907, 2.066021, 0.4039216, 0, 1, 1,
0.6103545, -0.2488167, 2.330271, 0.4117647, 0, 1, 1,
0.6184368, 0.3352328, 1.71215, 0.4156863, 0, 1, 1,
0.6232598, 1.879299, -0.1375844, 0.4235294, 0, 1, 1,
0.6265361, 0.2881956, 0.9571851, 0.427451, 0, 1, 1,
0.6286812, 1.371984, -0.6601562, 0.4352941, 0, 1, 1,
0.6293356, 0.5386177, -0.9935923, 0.4392157, 0, 1, 1,
0.6337037, 0.1492673, 1.523368, 0.4470588, 0, 1, 1,
0.6338472, -0.4205394, 0.5739314, 0.4509804, 0, 1, 1,
0.6422425, 1.409563, -0.05781041, 0.4588235, 0, 1, 1,
0.6427186, -0.8656783, 1.43091, 0.4627451, 0, 1, 1,
0.6442183, -0.1084172, 1.996993, 0.4705882, 0, 1, 1,
0.6484264, 0.4950112, 3.218492, 0.4745098, 0, 1, 1,
0.6536794, 2.4917, 0.3513169, 0.4823529, 0, 1, 1,
0.6570842, -0.6173992, 4.531504, 0.4862745, 0, 1, 1,
0.6644716, -0.9164745, 0.828504, 0.4941176, 0, 1, 1,
0.665153, -0.05668191, 0.968425, 0.5019608, 0, 1, 1,
0.6662459, -0.3645914, 1.706039, 0.5058824, 0, 1, 1,
0.6742905, -0.3208924, 1.027819, 0.5137255, 0, 1, 1,
0.6764239, -0.691843, 1.826739, 0.5176471, 0, 1, 1,
0.682456, -0.5311023, 2.039119, 0.5254902, 0, 1, 1,
0.6910262, 0.6270365, 2.01085, 0.5294118, 0, 1, 1,
0.6912247, 1.110263, 1.242949, 0.5372549, 0, 1, 1,
0.6989163, 1.061547, 0.9981819, 0.5411765, 0, 1, 1,
0.7005321, -0.8058903, 0.06539253, 0.5490196, 0, 1, 1,
0.703226, -0.4552127, 2.433097, 0.5529412, 0, 1, 1,
0.7190811, -0.4765293, 0.6875716, 0.5607843, 0, 1, 1,
0.7210402, -1.713945, 2.276665, 0.5647059, 0, 1, 1,
0.7233621, 0.7203864, 0.8308129, 0.572549, 0, 1, 1,
0.72666, -0.4511753, 0.8886586, 0.5764706, 0, 1, 1,
0.7329582, -2.592179, 2.176586, 0.5843138, 0, 1, 1,
0.7440424, -0.6966677, 1.841475, 0.5882353, 0, 1, 1,
0.7499573, 0.04551056, 1.401417, 0.5960785, 0, 1, 1,
0.7510017, -0.5250719, 3.097633, 0.6039216, 0, 1, 1,
0.7582979, 1.249146, -0.5011591, 0.6078432, 0, 1, 1,
0.7597076, -2.012147, 2.590722, 0.6156863, 0, 1, 1,
0.7630619, -0.5609356, 2.246105, 0.6196079, 0, 1, 1,
0.7650194, 1.93856, 1.800503, 0.627451, 0, 1, 1,
0.8021208, 1.230385, 1.389056, 0.6313726, 0, 1, 1,
0.8113312, 1.435602, 1.64355, 0.6392157, 0, 1, 1,
0.8150358, -1.237284, 3.447217, 0.6431373, 0, 1, 1,
0.8184799, -0.2642615, 0.9170465, 0.6509804, 0, 1, 1,
0.8187638, 0.9215805, -0.3136078, 0.654902, 0, 1, 1,
0.8218306, 1.109345, 0.8866377, 0.6627451, 0, 1, 1,
0.8223968, -0.6501247, 2.632256, 0.6666667, 0, 1, 1,
0.82743, -0.2128925, 3.410126, 0.6745098, 0, 1, 1,
0.8345487, 0.6493504, 2.328924, 0.6784314, 0, 1, 1,
0.8395659, 0.7918556, -1.326502, 0.6862745, 0, 1, 1,
0.8411987, -1.171358, 2.659126, 0.6901961, 0, 1, 1,
0.8450979, -1.871065, 1.363974, 0.6980392, 0, 1, 1,
0.8463773, -0.8198344, 2.467729, 0.7058824, 0, 1, 1,
0.8480077, -1.199964, 3.528922, 0.7098039, 0, 1, 1,
0.8483258, -1.23487, 1.714129, 0.7176471, 0, 1, 1,
0.8537195, -1.958823, 1.267156, 0.7215686, 0, 1, 1,
0.8544346, -1.212977, 2.179255, 0.7294118, 0, 1, 1,
0.861544, 1.04194, 1.835313, 0.7333333, 0, 1, 1,
0.8624896, 0.6581459, 0.2943126, 0.7411765, 0, 1, 1,
0.8679845, -1.060858, 2.27863, 0.7450981, 0, 1, 1,
0.8726917, 0.6153739, 1.362938, 0.7529412, 0, 1, 1,
0.8744818, 0.8492689, 0.5315933, 0.7568628, 0, 1, 1,
0.875499, -0.6362556, 1.105023, 0.7647059, 0, 1, 1,
0.8782144, -1.674779, 2.075414, 0.7686275, 0, 1, 1,
0.8786343, -0.7096386, 2.395036, 0.7764706, 0, 1, 1,
0.8829171, 1.310208, 0.6368178, 0.7803922, 0, 1, 1,
0.88804, 0.2919448, 0.5024143, 0.7882353, 0, 1, 1,
0.8885644, 0.008826953, 2.02509, 0.7921569, 0, 1, 1,
0.8940107, 0.5179, -0.01006423, 0.8, 0, 1, 1,
0.8958428, -1.185921, 2.348312, 0.8078431, 0, 1, 1,
0.896041, -1.419728, 3.368904, 0.8117647, 0, 1, 1,
0.9087986, 0.5772732, 1.186192, 0.8196079, 0, 1, 1,
0.9106466, -1.536327, 2.511448, 0.8235294, 0, 1, 1,
0.912555, 0.3897785, 0.5727707, 0.8313726, 0, 1, 1,
0.9168177, 1.914593, 0.8280534, 0.8352941, 0, 1, 1,
0.9191842, 0.0004074552, -0.9314272, 0.8431373, 0, 1, 1,
0.9193377, 1.370587, 0.7335332, 0.8470588, 0, 1, 1,
0.9224234, 2.783755, -0.8173482, 0.854902, 0, 1, 1,
0.9231316, 2.000641, -0.1960437, 0.8588235, 0, 1, 1,
0.9251185, 0.4625991, 0.5744612, 0.8666667, 0, 1, 1,
0.9272012, 0.2162985, 0.4300341, 0.8705882, 0, 1, 1,
0.9284389, -0.319884, 3.638347, 0.8784314, 0, 1, 1,
0.9291139, -0.4840584, 0.9436784, 0.8823529, 0, 1, 1,
0.933739, 0.6517164, 2.010813, 0.8901961, 0, 1, 1,
0.934746, 0.2516443, 1.607356, 0.8941177, 0, 1, 1,
0.939247, -0.5453348, 2.460239, 0.9019608, 0, 1, 1,
0.9441477, 1.273647, 0.8343226, 0.9098039, 0, 1, 1,
0.9481346, -1.907568, 3.276506, 0.9137255, 0, 1, 1,
0.9484187, 0.6695886, 2.608989, 0.9215686, 0, 1, 1,
0.9555038, -1.353082, 2.901642, 0.9254902, 0, 1, 1,
0.9556153, 1.410967, 0.9447765, 0.9333333, 0, 1, 1,
0.9586107, -0.0494307, 2.358122, 0.9372549, 0, 1, 1,
0.9617075, 0.8545686, 0.721875, 0.945098, 0, 1, 1,
0.9635234, 1.062402, -0.08838268, 0.9490196, 0, 1, 1,
0.9647773, 0.2546424, 0.4626314, 0.9568627, 0, 1, 1,
0.9693196, 0.06380183, 0.06796754, 0.9607843, 0, 1, 1,
0.9731684, -0.3159858, 1.584962, 0.9686275, 0, 1, 1,
0.9794332, 1.913424, 0.6397356, 0.972549, 0, 1, 1,
0.9982491, 0.2393835, 0.1895257, 0.9803922, 0, 1, 1,
1.01086, -0.313563, 1.247215, 0.9843137, 0, 1, 1,
1.01194, -0.2154342, 1.610688, 0.9921569, 0, 1, 1,
1.012038, 1.664829, 0.3975185, 0.9960784, 0, 1, 1,
1.019697, -0.608476, 1.276285, 1, 0, 0.9960784, 1,
1.022007, -1.192938, 2.760302, 1, 0, 0.9882353, 1,
1.027061, 0.7337569, 2.264603, 1, 0, 0.9843137, 1,
1.02744, 1.071784, -0.0367685, 1, 0, 0.9764706, 1,
1.030185, -0.1272345, 1.464894, 1, 0, 0.972549, 1,
1.033272, -1.426981, 2.349421, 1, 0, 0.9647059, 1,
1.034813, -0.5079517, 1.040286, 1, 0, 0.9607843, 1,
1.037326, 0.06373109, 1.549955, 1, 0, 0.9529412, 1,
1.0392, -0.2710636, 2.267552, 1, 0, 0.9490196, 1,
1.041022, 0.4857516, 2.073664, 1, 0, 0.9411765, 1,
1.04515, -1.479133, 1.658312, 1, 0, 0.9372549, 1,
1.051944, -0.997533, 3.181485, 1, 0, 0.9294118, 1,
1.055614, -0.3289238, 0.5457786, 1, 0, 0.9254902, 1,
1.061172, -0.5993575, 0.9812835, 1, 0, 0.9176471, 1,
1.061365, 0.2535682, 0.4648848, 1, 0, 0.9137255, 1,
1.064466, 0.6218846, 0.5624369, 1, 0, 0.9058824, 1,
1.064474, 0.5368336, 3.168144, 1, 0, 0.9019608, 1,
1.066166, 0.5920746, 0.1745517, 1, 0, 0.8941177, 1,
1.069538, -0.7552682, 2.417276, 1, 0, 0.8862745, 1,
1.070462, 0.6407924, 1.846286, 1, 0, 0.8823529, 1,
1.072437, 1.071823, 1.756378, 1, 0, 0.8745098, 1,
1.07647, -2.206913, 3.494124, 1, 0, 0.8705882, 1,
1.0779, -0.4611605, 2.017705, 1, 0, 0.8627451, 1,
1.078369, 1.703616, -0.3281565, 1, 0, 0.8588235, 1,
1.083123, 0.730797, 1.773642, 1, 0, 0.8509804, 1,
1.090245, 0.3065264, 2.171767, 1, 0, 0.8470588, 1,
1.094819, 0.8086481, 0.1335907, 1, 0, 0.8392157, 1,
1.096359, 1.203394, 0.1708322, 1, 0, 0.8352941, 1,
1.112726, -0.01431881, 1.585619, 1, 0, 0.827451, 1,
1.129174, -0.3355914, 1.295272, 1, 0, 0.8235294, 1,
1.130159, -0.7554596, 1.160266, 1, 0, 0.8156863, 1,
1.131275, -2.558627, 2.763788, 1, 0, 0.8117647, 1,
1.132036, 0.5754118, 1.514037, 1, 0, 0.8039216, 1,
1.135691, -1.576659, 4.648898, 1, 0, 0.7960784, 1,
1.139287, -1.053748, 2.067779, 1, 0, 0.7921569, 1,
1.144745, 1.261336, 0.2826315, 1, 0, 0.7843137, 1,
1.148088, -0.883621, 2.540054, 1, 0, 0.7803922, 1,
1.151686, 0.3383732, 0.9292301, 1, 0, 0.772549, 1,
1.162037, 2.050824, 1.098367, 1, 0, 0.7686275, 1,
1.166691, -0.8996521, 2.160071, 1, 0, 0.7607843, 1,
1.167469, -0.3656554, 2.348126, 1, 0, 0.7568628, 1,
1.177842, 1.822653, -1.255239, 1, 0, 0.7490196, 1,
1.180007, 0.3718317, 0.2482653, 1, 0, 0.7450981, 1,
1.18114, 1.423127, 0.5522133, 1, 0, 0.7372549, 1,
1.183383, 1.352261, 0.5137059, 1, 0, 0.7333333, 1,
1.19563, -1.460617, 2.263482, 1, 0, 0.7254902, 1,
1.200652, -1.128339, 3.133165, 1, 0, 0.7215686, 1,
1.203947, -0.1449752, 0.3698839, 1, 0, 0.7137255, 1,
1.20715, -0.2758815, 2.712077, 1, 0, 0.7098039, 1,
1.213536, 0.6743392, 0.2877747, 1, 0, 0.7019608, 1,
1.221246, 0.7286592, 0.7108735, 1, 0, 0.6941177, 1,
1.221463, 0.982288, 1.444412, 1, 0, 0.6901961, 1,
1.227168, 0.2301746, 1.782594, 1, 0, 0.682353, 1,
1.259706, 0.1708122, 2.14273, 1, 0, 0.6784314, 1,
1.263534, 0.6940394, 1.717391, 1, 0, 0.6705883, 1,
1.265309, -0.1830464, 0.8300732, 1, 0, 0.6666667, 1,
1.265366, 0.04228671, 1.931833, 1, 0, 0.6588235, 1,
1.267541, 0.5783038, 2.709537, 1, 0, 0.654902, 1,
1.269731, 0.8885421, 1.701584, 1, 0, 0.6470588, 1,
1.276664, -0.06086435, 0.6589677, 1, 0, 0.6431373, 1,
1.278196, -0.5763425, 3.826516, 1, 0, 0.6352941, 1,
1.288777, -0.9686799, 2.776816, 1, 0, 0.6313726, 1,
1.295604, 0.6055146, 1.350889, 1, 0, 0.6235294, 1,
1.295751, -0.8964017, 2.282983, 1, 0, 0.6196079, 1,
1.298641, -0.07827497, 1.203135, 1, 0, 0.6117647, 1,
1.301635, -0.4999551, 1.391282, 1, 0, 0.6078432, 1,
1.305842, -0.4788995, 1.16209, 1, 0, 0.6, 1,
1.306453, -0.5385605, 0.9314941, 1, 0, 0.5921569, 1,
1.333865, 1.191341, 0.9604015, 1, 0, 0.5882353, 1,
1.33557, 0.1760704, 1.55129, 1, 0, 0.5803922, 1,
1.335747, -0.619158, 2.358367, 1, 0, 0.5764706, 1,
1.339378, -0.3140551, 2.138855, 1, 0, 0.5686275, 1,
1.344808, -0.4135822, 4.099919, 1, 0, 0.5647059, 1,
1.347126, -0.5750425, 2.544734, 1, 0, 0.5568628, 1,
1.349828, -0.7910118, 2.300287, 1, 0, 0.5529412, 1,
1.350086, 0.4733587, 1.955586, 1, 0, 0.5450981, 1,
1.350718, 0.5728688, 1.30679, 1, 0, 0.5411765, 1,
1.352733, -0.877518, 3.674934, 1, 0, 0.5333334, 1,
1.355361, 1.666297, -0.05892057, 1, 0, 0.5294118, 1,
1.35929, 0.4797809, 2.474111, 1, 0, 0.5215687, 1,
1.364771, 1.388165, 0.3937443, 1, 0, 0.5176471, 1,
1.368993, -1.607726, 2.117355, 1, 0, 0.509804, 1,
1.391237, 0.04410809, 0.4389963, 1, 0, 0.5058824, 1,
1.397834, -0.3349669, 1.688781, 1, 0, 0.4980392, 1,
1.419973, -0.2694358, 1.007952, 1, 0, 0.4901961, 1,
1.428432, -2.048766, 2.778639, 1, 0, 0.4862745, 1,
1.429138, 1.115001, 0.06493247, 1, 0, 0.4784314, 1,
1.43787, 0.8586397, 0.792439, 1, 0, 0.4745098, 1,
1.438423, -0.465265, 1.92988, 1, 0, 0.4666667, 1,
1.447039, 1.031602, 1.254055, 1, 0, 0.4627451, 1,
1.456921, 1.217411, -0.5499587, 1, 0, 0.454902, 1,
1.460454, -0.7624074, 0.9392611, 1, 0, 0.4509804, 1,
1.470976, -0.2446538, 0.4431654, 1, 0, 0.4431373, 1,
1.471211, 1.497834, 2.31255, 1, 0, 0.4392157, 1,
1.476977, 0.3568721, 1.456564, 1, 0, 0.4313726, 1,
1.4834, -1.337442, 2.896226, 1, 0, 0.427451, 1,
1.489113, 0.006093804, 1.728254, 1, 0, 0.4196078, 1,
1.490512, -0.06032359, 1.213467, 1, 0, 0.4156863, 1,
1.501874, -0.8413427, 2.348471, 1, 0, 0.4078431, 1,
1.502037, 0.1370175, 2.353687, 1, 0, 0.4039216, 1,
1.504123, -0.4453774, 2.080767, 1, 0, 0.3960784, 1,
1.526261, -0.6980857, 2.986205, 1, 0, 0.3882353, 1,
1.533368, -0.1175624, 1.797627, 1, 0, 0.3843137, 1,
1.533481, -1.103215, 3.35687, 1, 0, 0.3764706, 1,
1.533799, -0.6051133, 2.89937, 1, 0, 0.372549, 1,
1.540642, 0.4752141, 0.9560018, 1, 0, 0.3647059, 1,
1.557029, 0.3155507, 1.578116, 1, 0, 0.3607843, 1,
1.561386, -0.4095954, 2.279831, 1, 0, 0.3529412, 1,
1.619771, -0.7849184, 1.470158, 1, 0, 0.3490196, 1,
1.631548, -0.7633293, 2.495881, 1, 0, 0.3411765, 1,
1.644956, -0.4968252, 2.027626, 1, 0, 0.3372549, 1,
1.656272, -1.842849, 2.493721, 1, 0, 0.3294118, 1,
1.658934, 1.953776, -0.8616114, 1, 0, 0.3254902, 1,
1.670884, -0.140902, 4.485089, 1, 0, 0.3176471, 1,
1.673776, 0.8666312, 1.416955, 1, 0, 0.3137255, 1,
1.680006, 0.5373639, 1.03971, 1, 0, 0.3058824, 1,
1.692484, 0.9844521, 0.711439, 1, 0, 0.2980392, 1,
1.729956, -0.6359158, 1.846113, 1, 0, 0.2941177, 1,
1.732303, -0.1399283, 1.092522, 1, 0, 0.2862745, 1,
1.735466, 0.2242753, 0.5212685, 1, 0, 0.282353, 1,
1.749788, 0.1505814, 2.163049, 1, 0, 0.2745098, 1,
1.756291, -1.155381, 0.197389, 1, 0, 0.2705882, 1,
1.773809, 1.308303, 0.7694855, 1, 0, 0.2627451, 1,
1.781188, 0.09365489, 0.8124279, 1, 0, 0.2588235, 1,
1.795031, -0.03152976, 2.126201, 1, 0, 0.2509804, 1,
1.795357, 0.3867241, 2.052508, 1, 0, 0.2470588, 1,
1.811353, 0.4493198, -0.1782378, 1, 0, 0.2392157, 1,
1.820071, -1.467485, 1.263606, 1, 0, 0.2352941, 1,
1.826648, -0.6952475, 1.160609, 1, 0, 0.227451, 1,
1.829073, 0.6358845, 0.7221007, 1, 0, 0.2235294, 1,
1.833179, -0.5123641, 3.941805, 1, 0, 0.2156863, 1,
1.838281, 0.2141088, 3.018915, 1, 0, 0.2117647, 1,
1.845702, -1.042033, 1.819082, 1, 0, 0.2039216, 1,
1.865576, 0.3289664, 1.046815, 1, 0, 0.1960784, 1,
1.86787, -0.6102818, 1.64455, 1, 0, 0.1921569, 1,
1.872333, -0.5507322, 2.967432, 1, 0, 0.1843137, 1,
1.89402, 0.8165483, 1.246544, 1, 0, 0.1803922, 1,
1.900736, 0.2350101, 1.14342, 1, 0, 0.172549, 1,
1.912699, -0.9487612, 2.232638, 1, 0, 0.1686275, 1,
1.917782, -0.0958919, -0.2868858, 1, 0, 0.1607843, 1,
1.950697, 2.212332, 1.55092, 1, 0, 0.1568628, 1,
1.956934, -0.0381689, 2.72882, 1, 0, 0.1490196, 1,
1.982922, 0.1548204, 0.7750968, 1, 0, 0.145098, 1,
2.008862, 0.1551446, 0.3437499, 1, 0, 0.1372549, 1,
2.027579, 1.368761, -0.06539696, 1, 0, 0.1333333, 1,
2.04669, -1.128311, 1.615243, 1, 0, 0.1254902, 1,
2.049963, -0.5439503, 0.612063, 1, 0, 0.1215686, 1,
2.060364, -0.8433525, 3.943675, 1, 0, 0.1137255, 1,
2.072113, 2.352784, 0.4417172, 1, 0, 0.1098039, 1,
2.104072, 1.313648, -0.9342527, 1, 0, 0.1019608, 1,
2.120955, 0.05731786, 0.7722059, 1, 0, 0.09411765, 1,
2.194402, -0.1248918, 1.890328, 1, 0, 0.09019608, 1,
2.205094, 0.2560908, 1.018991, 1, 0, 0.08235294, 1,
2.21882, 0.8966705, 0.5705864, 1, 0, 0.07843138, 1,
2.23283, -0.3815067, 2.957545, 1, 0, 0.07058824, 1,
2.248134, -0.3373934, 3.240176, 1, 0, 0.06666667, 1,
2.304337, -0.06292997, 0.04410535, 1, 0, 0.05882353, 1,
2.311916, 0.005362455, 0.1406644, 1, 0, 0.05490196, 1,
2.355006, -0.2779771, 1.309098, 1, 0, 0.04705882, 1,
2.364591, -0.07373003, 1.78892, 1, 0, 0.04313726, 1,
2.398177, -1.12414, 1.063382, 1, 0, 0.03529412, 1,
2.420297, 0.0147342, 1.450306, 1, 0, 0.03137255, 1,
2.437234, -1.044293, 0.8944234, 1, 0, 0.02352941, 1,
2.884357, 0.1186048, 1.268047, 1, 0, 0.01960784, 1,
2.962136, 0.8372348, 0.2598272, 1, 0, 0.01176471, 1,
3.415593, -0.4581234, 3.941117, 1, 0, 0.007843138, 1
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
0.1301348, -4.309844, -6.642209, 0, -0.5, 0.5, 0.5,
0.1301348, -4.309844, -6.642209, 1, -0.5, 0.5, 0.5,
0.1301348, -4.309844, -6.642209, 1, 1.5, 0.5, 0.5,
0.1301348, -4.309844, -6.642209, 0, 1.5, 0.5, 0.5
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
-4.269093, -0.1493347, -6.642209, 0, -0.5, 0.5, 0.5,
-4.269093, -0.1493347, -6.642209, 1, -0.5, 0.5, 0.5,
-4.269093, -0.1493347, -6.642209, 1, 1.5, 0.5, 0.5,
-4.269093, -0.1493347, -6.642209, 0, 1.5, 0.5, 0.5
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
-4.269093, -4.309844, -0.00071311, 0, -0.5, 0.5, 0.5,
-4.269093, -4.309844, -0.00071311, 1, -0.5, 0.5, 0.5,
-4.269093, -4.309844, -0.00071311, 1, 1.5, 0.5, 0.5,
-4.269093, -4.309844, -0.00071311, 0, 1.5, 0.5, 0.5
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
-3, -3.349726, -5.109556,
3, -3.349726, -5.109556,
-3, -3.349726, -5.109556,
-3, -3.509746, -5.364998,
-2, -3.349726, -5.109556,
-2, -3.509746, -5.364998,
-1, -3.349726, -5.109556,
-1, -3.509746, -5.364998,
0, -3.349726, -5.109556,
0, -3.509746, -5.364998,
1, -3.349726, -5.109556,
1, -3.509746, -5.364998,
2, -3.349726, -5.109556,
2, -3.509746, -5.364998,
3, -3.349726, -5.109556,
3, -3.509746, -5.364998
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
-3, -3.829785, -5.875882, 0, -0.5, 0.5, 0.5,
-3, -3.829785, -5.875882, 1, -0.5, 0.5, 0.5,
-3, -3.829785, -5.875882, 1, 1.5, 0.5, 0.5,
-3, -3.829785, -5.875882, 0, 1.5, 0.5, 0.5,
-2, -3.829785, -5.875882, 0, -0.5, 0.5, 0.5,
-2, -3.829785, -5.875882, 1, -0.5, 0.5, 0.5,
-2, -3.829785, -5.875882, 1, 1.5, 0.5, 0.5,
-2, -3.829785, -5.875882, 0, 1.5, 0.5, 0.5,
-1, -3.829785, -5.875882, 0, -0.5, 0.5, 0.5,
-1, -3.829785, -5.875882, 1, -0.5, 0.5, 0.5,
-1, -3.829785, -5.875882, 1, 1.5, 0.5, 0.5,
-1, -3.829785, -5.875882, 0, 1.5, 0.5, 0.5,
0, -3.829785, -5.875882, 0, -0.5, 0.5, 0.5,
0, -3.829785, -5.875882, 1, -0.5, 0.5, 0.5,
0, -3.829785, -5.875882, 1, 1.5, 0.5, 0.5,
0, -3.829785, -5.875882, 0, 1.5, 0.5, 0.5,
1, -3.829785, -5.875882, 0, -0.5, 0.5, 0.5,
1, -3.829785, -5.875882, 1, -0.5, 0.5, 0.5,
1, -3.829785, -5.875882, 1, 1.5, 0.5, 0.5,
1, -3.829785, -5.875882, 0, 1.5, 0.5, 0.5,
2, -3.829785, -5.875882, 0, -0.5, 0.5, 0.5,
2, -3.829785, -5.875882, 1, -0.5, 0.5, 0.5,
2, -3.829785, -5.875882, 1, 1.5, 0.5, 0.5,
2, -3.829785, -5.875882, 0, 1.5, 0.5, 0.5,
3, -3.829785, -5.875882, 0, -0.5, 0.5, 0.5,
3, -3.829785, -5.875882, 1, -0.5, 0.5, 0.5,
3, -3.829785, -5.875882, 1, 1.5, 0.5, 0.5,
3, -3.829785, -5.875882, 0, 1.5, 0.5, 0.5
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
-3.253887, -3, -5.109556,
-3.253887, 2, -5.109556,
-3.253887, -3, -5.109556,
-3.423088, -3, -5.364998,
-3.253887, -2, -5.109556,
-3.423088, -2, -5.364998,
-3.253887, -1, -5.109556,
-3.423088, -1, -5.364998,
-3.253887, 0, -5.109556,
-3.423088, 0, -5.364998,
-3.253887, 1, -5.109556,
-3.423088, 1, -5.364998,
-3.253887, 2, -5.109556,
-3.423088, 2, -5.364998
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
-3.76149, -3, -5.875882, 0, -0.5, 0.5, 0.5,
-3.76149, -3, -5.875882, 1, -0.5, 0.5, 0.5,
-3.76149, -3, -5.875882, 1, 1.5, 0.5, 0.5,
-3.76149, -3, -5.875882, 0, 1.5, 0.5, 0.5,
-3.76149, -2, -5.875882, 0, -0.5, 0.5, 0.5,
-3.76149, -2, -5.875882, 1, -0.5, 0.5, 0.5,
-3.76149, -2, -5.875882, 1, 1.5, 0.5, 0.5,
-3.76149, -2, -5.875882, 0, 1.5, 0.5, 0.5,
-3.76149, -1, -5.875882, 0, -0.5, 0.5, 0.5,
-3.76149, -1, -5.875882, 1, -0.5, 0.5, 0.5,
-3.76149, -1, -5.875882, 1, 1.5, 0.5, 0.5,
-3.76149, -1, -5.875882, 0, 1.5, 0.5, 0.5,
-3.76149, 0, -5.875882, 0, -0.5, 0.5, 0.5,
-3.76149, 0, -5.875882, 1, -0.5, 0.5, 0.5,
-3.76149, 0, -5.875882, 1, 1.5, 0.5, 0.5,
-3.76149, 0, -5.875882, 0, 1.5, 0.5, 0.5,
-3.76149, 1, -5.875882, 0, -0.5, 0.5, 0.5,
-3.76149, 1, -5.875882, 1, -0.5, 0.5, 0.5,
-3.76149, 1, -5.875882, 1, 1.5, 0.5, 0.5,
-3.76149, 1, -5.875882, 0, 1.5, 0.5, 0.5,
-3.76149, 2, -5.875882, 0, -0.5, 0.5, 0.5,
-3.76149, 2, -5.875882, 1, -0.5, 0.5, 0.5,
-3.76149, 2, -5.875882, 1, 1.5, 0.5, 0.5,
-3.76149, 2, -5.875882, 0, 1.5, 0.5, 0.5
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
-3.253887, -3.349726, -4,
-3.253887, -3.349726, 4,
-3.253887, -3.349726, -4,
-3.423088, -3.509746, -4,
-3.253887, -3.349726, -2,
-3.423088, -3.509746, -2,
-3.253887, -3.349726, 0,
-3.423088, -3.509746, 0,
-3.253887, -3.349726, 2,
-3.423088, -3.509746, 2,
-3.253887, -3.349726, 4,
-3.423088, -3.509746, 4
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
-3.76149, -3.829785, -4, 0, -0.5, 0.5, 0.5,
-3.76149, -3.829785, -4, 1, -0.5, 0.5, 0.5,
-3.76149, -3.829785, -4, 1, 1.5, 0.5, 0.5,
-3.76149, -3.829785, -4, 0, 1.5, 0.5, 0.5,
-3.76149, -3.829785, -2, 0, -0.5, 0.5, 0.5,
-3.76149, -3.829785, -2, 1, -0.5, 0.5, 0.5,
-3.76149, -3.829785, -2, 1, 1.5, 0.5, 0.5,
-3.76149, -3.829785, -2, 0, 1.5, 0.5, 0.5,
-3.76149, -3.829785, 0, 0, -0.5, 0.5, 0.5,
-3.76149, -3.829785, 0, 1, -0.5, 0.5, 0.5,
-3.76149, -3.829785, 0, 1, 1.5, 0.5, 0.5,
-3.76149, -3.829785, 0, 0, 1.5, 0.5, 0.5,
-3.76149, -3.829785, 2, 0, -0.5, 0.5, 0.5,
-3.76149, -3.829785, 2, 1, -0.5, 0.5, 0.5,
-3.76149, -3.829785, 2, 1, 1.5, 0.5, 0.5,
-3.76149, -3.829785, 2, 0, 1.5, 0.5, 0.5,
-3.76149, -3.829785, 4, 0, -0.5, 0.5, 0.5,
-3.76149, -3.829785, 4, 1, -0.5, 0.5, 0.5,
-3.76149, -3.829785, 4, 1, 1.5, 0.5, 0.5,
-3.76149, -3.829785, 4, 0, 1.5, 0.5, 0.5
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
-3.253887, -3.349726, -5.109556,
-3.253887, 3.051057, -5.109556,
-3.253887, -3.349726, 5.10813,
-3.253887, 3.051057, 5.10813,
-3.253887, -3.349726, -5.109556,
-3.253887, -3.349726, 5.10813,
-3.253887, 3.051057, -5.109556,
-3.253887, 3.051057, 5.10813,
-3.253887, -3.349726, -5.109556,
3.514156, -3.349726, -5.109556,
-3.253887, -3.349726, 5.10813,
3.514156, -3.349726, 5.10813,
-3.253887, 3.051057, -5.109556,
3.514156, 3.051057, -5.109556,
-3.253887, 3.051057, 5.10813,
3.514156, 3.051057, 5.10813,
3.514156, -3.349726, -5.109556,
3.514156, 3.051057, -5.109556,
3.514156, -3.349726, 5.10813,
3.514156, 3.051057, 5.10813,
3.514156, -3.349726, -5.109556,
3.514156, -3.349726, 5.10813,
3.514156, 3.051057, -5.109556,
3.514156, 3.051057, 5.10813
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
var radius = 7.383187;
var distance = 32.84863;
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
mvMatrix.translate( -0.1301348, 0.1493347, 0.00071311 );
mvMatrix.scale( 1.179491, 1.247167, 0.7812774 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.84863);
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
Fenamiphos<-read.table("Fenamiphos.xyz", skip=1)
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
-3.155323, 0.1438797, -0.592407, 0, 0, 1, 1, 1,
-2.893977, -1.139531, -1.131688, 1, 0, 0, 1, 1,
-2.659327, -0.09009904, -1.304335, 1, 0, 0, 1, 1,
-2.408478, -0.8375753, -1.787987, 1, 0, 0, 1, 1,
-2.294922, -0.3806408, -3.179478, 1, 0, 0, 1, 1,
-2.282059, -0.9876755, -1.763878, 1, 0, 0, 1, 1,
-2.277204, 1.034508, -2.305491, 0, 0, 0, 1, 1,
-2.245686, -0.05606458, -2.145851, 0, 0, 0, 1, 1,
-2.205118, 0.06021615, -0.6492041, 0, 0, 0, 1, 1,
-2.152554, -1.105301, -1.550811, 0, 0, 0, 1, 1,
-2.074975, -0.02275476, -0.7363399, 0, 0, 0, 1, 1,
-2.053062, 0.4001577, -2.348981, 0, 0, 0, 1, 1,
-2.030045, -1.713254, -2.998387, 0, 0, 0, 1, 1,
-2.02848, -0.7533757, -2.303396, 1, 1, 1, 1, 1,
-2.012705, -0.9863545, -3.567743, 1, 1, 1, 1, 1,
-2.00304, 0.1829838, -0.5539915, 1, 1, 1, 1, 1,
-1.972574, 0.3981921, -1.124787, 1, 1, 1, 1, 1,
-1.934755, -1.234858, -1.76643, 1, 1, 1, 1, 1,
-1.905359, -0.0780222, -1.74395, 1, 1, 1, 1, 1,
-1.886525, 0.6972041, 0.002897412, 1, 1, 1, 1, 1,
-1.876537, 1.235957, 0.1658035, 1, 1, 1, 1, 1,
-1.837693, -1.090729, -2.405698, 1, 1, 1, 1, 1,
-1.826007, 0.1834429, 0.2456101, 1, 1, 1, 1, 1,
-1.807398, -0.3682434, -2.058562, 1, 1, 1, 1, 1,
-1.781292, -0.2686529, -1.829792, 1, 1, 1, 1, 1,
-1.75995, 0.3169044, -0.7458102, 1, 1, 1, 1, 1,
-1.759107, 0.2270529, -1.352935, 1, 1, 1, 1, 1,
-1.750228, -0.3648005, -1.945752, 1, 1, 1, 1, 1,
-1.749141, -0.2258447, -2.908176, 0, 0, 1, 1, 1,
-1.705362, -0.6514835, -3.682989, 1, 0, 0, 1, 1,
-1.695027, -1.823722, -2.788997, 1, 0, 0, 1, 1,
-1.686611, 0.04859019, -0.9128929, 1, 0, 0, 1, 1,
-1.675739, 0.9572182, -1.873871, 1, 0, 0, 1, 1,
-1.661487, -0.2387471, -0.4299418, 1, 0, 0, 1, 1,
-1.604012, -2.248938, -3.308332, 0, 0, 0, 1, 1,
-1.601247, 1.014579, -0.3464112, 0, 0, 0, 1, 1,
-1.597395, 0.0938874, 2.32772, 0, 0, 0, 1, 1,
-1.595849, 0.7996163, -1.569851, 0, 0, 0, 1, 1,
-1.594183, 0.1866865, -1.266471, 0, 0, 0, 1, 1,
-1.590326, -0.5077929, -1.164024, 0, 0, 0, 1, 1,
-1.586949, 0.3543149, -0.5847208, 0, 0, 0, 1, 1,
-1.58151, 0.2098264, -3.069592, 1, 1, 1, 1, 1,
-1.578774, -0.2402302, -0.5349876, 1, 1, 1, 1, 1,
-1.577877, -0.6961365, -3.14354, 1, 1, 1, 1, 1,
-1.566806, -0.3642469, -2.278029, 1, 1, 1, 1, 1,
-1.558499, 0.2568209, -2.074976, 1, 1, 1, 1, 1,
-1.554629, 0.6879901, -1.627588, 1, 1, 1, 1, 1,
-1.553436, -0.6686217, -2.751019, 1, 1, 1, 1, 1,
-1.546631, -0.5005919, -2.545298, 1, 1, 1, 1, 1,
-1.545703, -1.651795, -1.765866, 1, 1, 1, 1, 1,
-1.54124, 0.9847889, -0.9831464, 1, 1, 1, 1, 1,
-1.527953, 0.8052199, -1.383984, 1, 1, 1, 1, 1,
-1.523338, -0.72067, -1.679226, 1, 1, 1, 1, 1,
-1.522058, 1.040943, 0.2869428, 1, 1, 1, 1, 1,
-1.508523, -1.556535, -2.208225, 1, 1, 1, 1, 1,
-1.50771, 1.412454, 0.8083624, 1, 1, 1, 1, 1,
-1.504815, -0.2097116, -0.5203171, 0, 0, 1, 1, 1,
-1.491299, 1.431379, -1.963131, 1, 0, 0, 1, 1,
-1.4411, 0.3843505, -2.627559, 1, 0, 0, 1, 1,
-1.437616, 0.7100788, -1.90972, 1, 0, 0, 1, 1,
-1.430944, 0.5720174, -1.261162, 1, 0, 0, 1, 1,
-1.428196, 1.181067, -0.03338619, 1, 0, 0, 1, 1,
-1.422734, 0.6305463, -0.6540511, 0, 0, 0, 1, 1,
-1.417491, 0.655984, -1.89296, 0, 0, 0, 1, 1,
-1.405767, 1.202278, -1.932499, 0, 0, 0, 1, 1,
-1.404242, 0.4366591, -2.902264, 0, 0, 0, 1, 1,
-1.379784, -1.1972, -2.996936, 0, 0, 0, 1, 1,
-1.374933, -0.4873687, -3.533038, 0, 0, 0, 1, 1,
-1.374878, -0.6283185, -1.913392, 0, 0, 0, 1, 1,
-1.374677, -1.23444, -2.156617, 1, 1, 1, 1, 1,
-1.372809, -0.7655144, -3.112576, 1, 1, 1, 1, 1,
-1.366661, -0.05009965, 0.3761011, 1, 1, 1, 1, 1,
-1.353887, -0.2453175, -2.54528, 1, 1, 1, 1, 1,
-1.352957, -0.3074223, -0.5707099, 1, 1, 1, 1, 1,
-1.352449, 0.5569549, -0.4135309, 1, 1, 1, 1, 1,
-1.349264, -0.07054766, -1.363256, 1, 1, 1, 1, 1,
-1.344217, 0.4349012, 0.4423949, 1, 1, 1, 1, 1,
-1.335488, 0.3851179, -1.685583, 1, 1, 1, 1, 1,
-1.330289, 0.331513, -0.2080771, 1, 1, 1, 1, 1,
-1.328328, 0.1140971, -0.9306985, 1, 1, 1, 1, 1,
-1.320315, -0.4942843, -3.205837, 1, 1, 1, 1, 1,
-1.309477, -0.3868712, -1.699913, 1, 1, 1, 1, 1,
-1.301702, 0.1447044, -0.6208438, 1, 1, 1, 1, 1,
-1.29034, -0.7865683, -2.161689, 1, 1, 1, 1, 1,
-1.281913, 0.855471, -1.144274, 0, 0, 1, 1, 1,
-1.274741, -0.5076319, -3.44248, 1, 0, 0, 1, 1,
-1.268662, 0.07475355, -2.161864, 1, 0, 0, 1, 1,
-1.265065, -1.681346, -3.065912, 1, 0, 0, 1, 1,
-1.258769, -0.1863662, -1.069188, 1, 0, 0, 1, 1,
-1.256732, -0.7954908, -3.022587, 1, 0, 0, 1, 1,
-1.253041, 1.61209, -0.997526, 0, 0, 0, 1, 1,
-1.251673, -0.3445532, -2.127987, 0, 0, 0, 1, 1,
-1.245557, -1.490346, -3.221816, 0, 0, 0, 1, 1,
-1.240994, 1.909969, -1.646808, 0, 0, 0, 1, 1,
-1.239169, -1.161341, -1.844409, 0, 0, 0, 1, 1,
-1.223895, -0.8288891, -0.5943072, 0, 0, 0, 1, 1,
-1.209095, 1.458766, 1.207136, 0, 0, 0, 1, 1,
-1.199676, 0.4992518, -1.320332, 1, 1, 1, 1, 1,
-1.196081, -2.028321, -3.437934, 1, 1, 1, 1, 1,
-1.190309, -0.610534, -0.7368027, 1, 1, 1, 1, 1,
-1.186386, -0.507871, -1.893368, 1, 1, 1, 1, 1,
-1.17833, 0.2737664, -1.525906, 1, 1, 1, 1, 1,
-1.178249, 1.397854, -1.575583, 1, 1, 1, 1, 1,
-1.175586, -0.9763918, -2.683852, 1, 1, 1, 1, 1,
-1.174086, -0.03143969, -0.8579171, 1, 1, 1, 1, 1,
-1.173536, -0.1880512, -1.84722, 1, 1, 1, 1, 1,
-1.160218, 2.511006, -0.8908719, 1, 1, 1, 1, 1,
-1.14743, 0.9280565, -1.252083, 1, 1, 1, 1, 1,
-1.141891, 0.4983146, 0.2758768, 1, 1, 1, 1, 1,
-1.13599, -0.190109, -2.347081, 1, 1, 1, 1, 1,
-1.135108, -0.3580409, -1.327599, 1, 1, 1, 1, 1,
-1.132849, 0.2751903, -1.320067, 1, 1, 1, 1, 1,
-1.131822, 0.3677667, -1.782827, 0, 0, 1, 1, 1,
-1.130558, -0.4542449, -1.993436, 1, 0, 0, 1, 1,
-1.125109, -1.269817, -2.338153, 1, 0, 0, 1, 1,
-1.118713, -0.06684782, -2.631372, 1, 0, 0, 1, 1,
-1.107359, -1.059149, -1.897802, 1, 0, 0, 1, 1,
-1.106758, -0.6311173, -3.000862, 1, 0, 0, 1, 1,
-1.094626, 0.4263386, 0.5401064, 0, 0, 0, 1, 1,
-1.093799, 0.03346245, -2.402583, 0, 0, 0, 1, 1,
-1.091339, 0.225775, -1.89668, 0, 0, 0, 1, 1,
-1.089981, -0.338723, -2.096869, 0, 0, 0, 1, 1,
-1.083329, 0.8078035, 0.2430349, 0, 0, 0, 1, 1,
-1.079468, 0.01409982, -1.019366, 0, 0, 0, 1, 1,
-1.075363, 1.545127, -0.8530678, 0, 0, 0, 1, 1,
-1.073617, 0.2393632, -1.147228, 1, 1, 1, 1, 1,
-1.065627, 1.627931, -0.1812512, 1, 1, 1, 1, 1,
-1.063046, 0.6811651, 0.3006997, 1, 1, 1, 1, 1,
-1.051832, 1.26455, -1.955983, 1, 1, 1, 1, 1,
-1.0429, -0.9211615, -2.651433, 1, 1, 1, 1, 1,
-1.042693, 0.8017626, -1.465635, 1, 1, 1, 1, 1,
-1.041159, 0.9471419, -0.1939566, 1, 1, 1, 1, 1,
-1.037204, -0.6503737, -1.0347, 1, 1, 1, 1, 1,
-1.019137, 0.1122473, 0.4121238, 1, 1, 1, 1, 1,
-1.014487, -0.2227415, -1.842763, 1, 1, 1, 1, 1,
-1.008365, 1.134369, 0.8522426, 1, 1, 1, 1, 1,
-1.004482, 0.2837099, -0.9889966, 1, 1, 1, 1, 1,
-0.9926624, -1.134421, -3.49226, 1, 1, 1, 1, 1,
-0.9924508, -0.6248082, -3.614998, 1, 1, 1, 1, 1,
-0.9901497, -0.2624361, -2.778669, 1, 1, 1, 1, 1,
-0.9872884, -1.488429, -2.918341, 0, 0, 1, 1, 1,
-0.9836657, 0.4951086, -1.352755, 1, 0, 0, 1, 1,
-0.9805114, 0.922294, -0.4090396, 1, 0, 0, 1, 1,
-0.9734792, -0.1364063, -0.2353489, 1, 0, 0, 1, 1,
-0.9716305, 0.5322585, -1.283017, 1, 0, 0, 1, 1,
-0.9712502, 0.5355937, -0.4384791, 1, 0, 0, 1, 1,
-0.9706511, 0.130837, -1.476474, 0, 0, 0, 1, 1,
-0.9705008, 1.171068, -0.8616716, 0, 0, 0, 1, 1,
-0.9665843, 0.2189774, -2.032679, 0, 0, 0, 1, 1,
-0.962841, 0.09798509, -1.020568, 0, 0, 0, 1, 1,
-0.9590755, -0.786169, -3.578691, 0, 0, 0, 1, 1,
-0.9582042, 0.8649099, -1.71839, 0, 0, 0, 1, 1,
-0.9555696, 0.02755594, -1.736795, 0, 0, 0, 1, 1,
-0.9547876, 0.1012823, 0.1931125, 1, 1, 1, 1, 1,
-0.9508807, 0.7520862, -1.614563, 1, 1, 1, 1, 1,
-0.9462552, 0.4012248, -0.9859353, 1, 1, 1, 1, 1,
-0.9440671, -0.07398147, -1.329445, 1, 1, 1, 1, 1,
-0.942245, 1.100976, -1.197688, 1, 1, 1, 1, 1,
-0.9384972, 0.128327, -1.889929, 1, 1, 1, 1, 1,
-0.9270833, 1.198002, -1.456166, 1, 1, 1, 1, 1,
-0.9179493, 0.4399805, -1.109348, 1, 1, 1, 1, 1,
-0.9155803, 2.664931, -0.5225607, 1, 1, 1, 1, 1,
-0.9120492, -1.272177, -2.137556, 1, 1, 1, 1, 1,
-0.908457, 0.2960837, -1.3288, 1, 1, 1, 1, 1,
-0.9058346, 0.5797511, -1.490064, 1, 1, 1, 1, 1,
-0.9047979, 0.1814992, -1.153233, 1, 1, 1, 1, 1,
-0.9042682, 0.4728296, -0.4052007, 1, 1, 1, 1, 1,
-0.9032607, 0.5235788, -0.9934741, 1, 1, 1, 1, 1,
-0.9027717, 1.061299, 0.9103265, 0, 0, 1, 1, 1,
-0.9020523, -1.256355, -0.9640505, 1, 0, 0, 1, 1,
-0.9011536, 0.3314296, -0.04592962, 1, 0, 0, 1, 1,
-0.899793, -2.4626, -3.152847, 1, 0, 0, 1, 1,
-0.8966143, -1.616132, -1.991705, 1, 0, 0, 1, 1,
-0.8931172, -0.2850894, 0.2275189, 1, 0, 0, 1, 1,
-0.8906219, -0.4085332, -1.858982, 0, 0, 0, 1, 1,
-0.8890496, -0.3740073, -3.566531, 0, 0, 0, 1, 1,
-0.8840089, -0.246691, -2.298862, 0, 0, 0, 1, 1,
-0.8817374, -0.3042357, -0.8251682, 0, 0, 0, 1, 1,
-0.881693, -3.256511, -4.018365, 0, 0, 0, 1, 1,
-0.8810544, -0.7096071, -2.048641, 0, 0, 0, 1, 1,
-0.8748915, 0.3268844, -2.206002, 0, 0, 0, 1, 1,
-0.8704309, -1.685162, -2.17823, 1, 1, 1, 1, 1,
-0.8683936, -0.0006662022, -2.512831, 1, 1, 1, 1, 1,
-0.8678128, -1.011527, -2.785287, 1, 1, 1, 1, 1,
-0.8609844, -0.5324844, -4.415099, 1, 1, 1, 1, 1,
-0.8608791, 0.004930239, -2.298615, 1, 1, 1, 1, 1,
-0.8601415, -0.4699998, -2.090515, 1, 1, 1, 1, 1,
-0.8588095, 0.5684128, -2.341057, 1, 1, 1, 1, 1,
-0.8581921, 0.5134533, -0.9822819, 1, 1, 1, 1, 1,
-0.8443739, -2.078612, -3.59761, 1, 1, 1, 1, 1,
-0.8423715, 1.106305, -0.7981491, 1, 1, 1, 1, 1,
-0.841925, -0.245417, -1.473182, 1, 1, 1, 1, 1,
-0.8411194, -0.7710616, -1.097644, 1, 1, 1, 1, 1,
-0.8368885, -0.9708655, -4.194049, 1, 1, 1, 1, 1,
-0.8315628, 0.7243326, -0.2135766, 1, 1, 1, 1, 1,
-0.8312406, 1.23324, -1.281595, 1, 1, 1, 1, 1,
-0.8297691, -0.1101231, -1.183647, 0, 0, 1, 1, 1,
-0.8294036, 0.2657635, -1.562964, 1, 0, 0, 1, 1,
-0.8205319, 0.3411848, -3.903234, 1, 0, 0, 1, 1,
-0.8202277, 1.396397, 0.0352881, 1, 0, 0, 1, 1,
-0.8194883, -0.5058059, -2.042031, 1, 0, 0, 1, 1,
-0.8104165, 0.2407746, -0.08862474, 1, 0, 0, 1, 1,
-0.809265, -2.323049, -1.3185, 0, 0, 0, 1, 1,
-0.8015387, -1.263264, -4.415553, 0, 0, 0, 1, 1,
-0.7988742, -0.0753141, -1.804748, 0, 0, 0, 1, 1,
-0.792292, 0.9688554, 1.001068, 0, 0, 0, 1, 1,
-0.7873829, 0.5704911, -0.2986235, 0, 0, 0, 1, 1,
-0.7841423, 1.017639, -1.272245, 0, 0, 0, 1, 1,
-0.7828871, -1.176134, -3.218202, 0, 0, 0, 1, 1,
-0.7732525, 2.009899, 1.251044, 1, 1, 1, 1, 1,
-0.7725944, -0.785677, -2.328597, 1, 1, 1, 1, 1,
-0.7720551, 0.4010159, -1.874827, 1, 1, 1, 1, 1,
-0.7634544, 1.176333, -2.59869, 1, 1, 1, 1, 1,
-0.7614502, 1.862667, -0.4275306, 1, 1, 1, 1, 1,
-0.7470495, 0.9643144, -0.7133747, 1, 1, 1, 1, 1,
-0.7435293, -1.747532, -3.508246, 1, 1, 1, 1, 1,
-0.7368368, -0.1703743, -0.913577, 1, 1, 1, 1, 1,
-0.735008, -0.7480292, -2.949212, 1, 1, 1, 1, 1,
-0.7349724, -0.2356454, -1.423651, 1, 1, 1, 1, 1,
-0.7322555, 0.7661888, -0.6942237, 1, 1, 1, 1, 1,
-0.7289349, 0.3222806, -0.2257623, 1, 1, 1, 1, 1,
-0.7164572, -0.1080147, -2.627768, 1, 1, 1, 1, 1,
-0.7032719, 0.3662339, -1.425622, 1, 1, 1, 1, 1,
-0.70028, 0.7928057, -0.8877918, 1, 1, 1, 1, 1,
-0.6996889, -0.5395662, -2.119576, 0, 0, 1, 1, 1,
-0.6953195, -2.30907, -4.655288, 1, 0, 0, 1, 1,
-0.6940452, 0.5474945, -1.398743, 1, 0, 0, 1, 1,
-0.6929789, -0.3025677, -1.799636, 1, 0, 0, 1, 1,
-0.6865216, -0.7443154, -3.860706, 1, 0, 0, 1, 1,
-0.6853289, -1.255517, -3.314932, 1, 0, 0, 1, 1,
-0.681819, -1.362234, -3.287618, 0, 0, 0, 1, 1,
-0.6808165, -0.7359072, -2.43592, 0, 0, 0, 1, 1,
-0.6800066, -0.2816792, -1.030024, 0, 0, 0, 1, 1,
-0.6789097, -0.4338532, -2.563012, 0, 0, 0, 1, 1,
-0.6774297, -0.1329067, -4.175953, 0, 0, 0, 1, 1,
-0.6707094, 1.20126, 0.09543053, 0, 0, 0, 1, 1,
-0.6695694, 1.172078, -0.03992851, 0, 0, 0, 1, 1,
-0.6645979, 0.6355558, -1.302851, 1, 1, 1, 1, 1,
-0.6620451, -0.3977954, -1.393567, 1, 1, 1, 1, 1,
-0.6586894, -1.79136, -3.612628, 1, 1, 1, 1, 1,
-0.656447, -0.7345288, -3.128863, 1, 1, 1, 1, 1,
-0.6555722, -1.086345, -2.763804, 1, 1, 1, 1, 1,
-0.6532173, 1.01036, -0.8465198, 1, 1, 1, 1, 1,
-0.6522783, 0.6360906, -0.5778958, 1, 1, 1, 1, 1,
-0.6503964, 0.4843836, -1.903171, 1, 1, 1, 1, 1,
-0.6461551, -2.020992, -2.248344, 1, 1, 1, 1, 1,
-0.6426529, 1.384132, -2.038416, 1, 1, 1, 1, 1,
-0.6399202, -1.164854, -3.779423, 1, 1, 1, 1, 1,
-0.6393189, -0.1313811, -1.469064, 1, 1, 1, 1, 1,
-0.6271688, -0.3212962, -2.245444, 1, 1, 1, 1, 1,
-0.6089502, 0.7528039, -0.6485212, 1, 1, 1, 1, 1,
-0.6063493, 0.6477836, -0.9588068, 1, 1, 1, 1, 1,
-0.6042946, 0.5475042, 0.3036243, 0, 0, 1, 1, 1,
-0.6037167, 0.5161844, -1.244344, 1, 0, 0, 1, 1,
-0.6000056, -0.100949, -0.903823, 1, 0, 0, 1, 1,
-0.5981342, -1.003526, -3.607404, 1, 0, 0, 1, 1,
-0.5967401, 0.1235758, -0.1251613, 1, 0, 0, 1, 1,
-0.5942122, -0.5621064, -3.259415, 1, 0, 0, 1, 1,
-0.5910004, -0.9115303, -1.409387, 0, 0, 0, 1, 1,
-0.5849168, 0.4818574, -0.4700962, 0, 0, 0, 1, 1,
-0.5842643, -0.331711, -2.235606, 0, 0, 0, 1, 1,
-0.5771843, -0.3838262, -2.345628, 0, 0, 0, 1, 1,
-0.5771059, 0.03005104, -0.6395643, 0, 0, 0, 1, 1,
-0.5763566, 0.6783207, -1.206588, 0, 0, 0, 1, 1,
-0.5704489, -1.793644, -4.324643, 0, 0, 0, 1, 1,
-0.5698672, -1.521477, -1.425513, 1, 1, 1, 1, 1,
-0.5678678, -0.7766641, -1.629261, 1, 1, 1, 1, 1,
-0.5612501, -0.8175732, -1.040527, 1, 1, 1, 1, 1,
-0.5589005, 1.530842, -0.06685087, 1, 1, 1, 1, 1,
-0.5553907, 1.960096, -0.1907088, 1, 1, 1, 1, 1,
-0.5527021, -1.06156, -0.4357223, 1, 1, 1, 1, 1,
-0.5512958, -2.375741, -3.478464, 1, 1, 1, 1, 1,
-0.5477787, 1.492264, -0.09338244, 1, 1, 1, 1, 1,
-0.546175, 0.3287662, -1.418621, 1, 1, 1, 1, 1,
-0.5452539, 0.9093033, 0.8435318, 1, 1, 1, 1, 1,
-0.5439784, -0.7073734, -2.797846, 1, 1, 1, 1, 1,
-0.5416967, 0.06801745, -1.672463, 1, 1, 1, 1, 1,
-0.5398589, -1.411358, -1.961607, 1, 1, 1, 1, 1,
-0.534653, 0.1982674, -1.613843, 1, 1, 1, 1, 1,
-0.5335545, 1.307023, -1.225696, 1, 1, 1, 1, 1,
-0.5315651, -0.6942693, -2.351955, 0, 0, 1, 1, 1,
-0.5286666, 1.155399, -1.972395, 1, 0, 0, 1, 1,
-0.5231152, -2.001423, -2.589269, 1, 0, 0, 1, 1,
-0.5223677, 0.1001525, -1.827873, 1, 0, 0, 1, 1,
-0.5222002, 0.906308, -1.682395, 1, 0, 0, 1, 1,
-0.5209512, -1.143683, -2.994365, 1, 0, 0, 1, 1,
-0.5170713, -0.5453741, -1.771448, 0, 0, 0, 1, 1,
-0.5135501, 0.376815, -1.898894, 0, 0, 0, 1, 1,
-0.5120835, -1.152957, -2.148527, 0, 0, 0, 1, 1,
-0.5086038, -0.9987522, -3.301217, 0, 0, 0, 1, 1,
-0.5070883, 0.8565654, -0.9700264, 0, 0, 0, 1, 1,
-0.5018747, -0.2383992, -2.209202, 0, 0, 0, 1, 1,
-0.5018247, -0.7646354, -1.898283, 0, 0, 0, 1, 1,
-0.5012444, 1.646913, -0.6945612, 1, 1, 1, 1, 1,
-0.4987861, 1.329984, -0.9820067, 1, 1, 1, 1, 1,
-0.4986974, 0.4742675, 1.768638, 1, 1, 1, 1, 1,
-0.4974316, 0.4373584, -0.9642313, 1, 1, 1, 1, 1,
-0.491329, 0.2947172, -1.250643, 1, 1, 1, 1, 1,
-0.4908012, 1.327325, -0.688343, 1, 1, 1, 1, 1,
-0.4875995, -1.94872, -1.348653, 1, 1, 1, 1, 1,
-0.4869214, -0.1175338, -0.5615978, 1, 1, 1, 1, 1,
-0.4769557, -1.43706, -3.621095, 1, 1, 1, 1, 1,
-0.4757519, -1.313383, -4.432818, 1, 1, 1, 1, 1,
-0.4750549, -1.272263, -2.397796, 1, 1, 1, 1, 1,
-0.475034, -0.08073938, -2.569829, 1, 1, 1, 1, 1,
-0.4732592, -1.559109, -2.569014, 1, 1, 1, 1, 1,
-0.4697488, 0.3423302, -1.525427, 1, 1, 1, 1, 1,
-0.4642447, -1.489545, -1.207367, 1, 1, 1, 1, 1,
-0.4642337, 1.388074, 0.5230122, 0, 0, 1, 1, 1,
-0.4632629, -0.7729817, -4.224123, 1, 0, 0, 1, 1,
-0.4629002, -0.6946012, -2.81386, 1, 0, 0, 1, 1,
-0.4615149, 0.3628273, -2.522396, 1, 0, 0, 1, 1,
-0.4597849, 0.8458979, -0.2525448, 1, 0, 0, 1, 1,
-0.4593602, -1.961554, -2.726258, 1, 0, 0, 1, 1,
-0.4559149, -0.09194617, -0.8474399, 0, 0, 0, 1, 1,
-0.4558698, 1.021661, -0.01295947, 0, 0, 0, 1, 1,
-0.4541849, 0.6369073, 1.733545, 0, 0, 0, 1, 1,
-0.4521098, -1.201806, -0.7522299, 0, 0, 0, 1, 1,
-0.4518092, 0.4924459, -0.8935723, 0, 0, 0, 1, 1,
-0.4496044, -1.257121, -4.696031, 0, 0, 0, 1, 1,
-0.4480899, 0.09620997, -0.8753594, 0, 0, 0, 1, 1,
-0.4480399, -1.027962, -3.370466, 1, 1, 1, 1, 1,
-0.4472843, -0.8451075, -1.697336, 1, 1, 1, 1, 1,
-0.432985, -0.2728648, -1.451611, 1, 1, 1, 1, 1,
-0.4297164, 1.126274, 0.9787526, 1, 1, 1, 1, 1,
-0.4288854, 0.5967544, -1.534506, 1, 1, 1, 1, 1,
-0.4224201, -0.6559066, -1.493391, 1, 1, 1, 1, 1,
-0.4202083, 0.7485965, -2.40347, 1, 1, 1, 1, 1,
-0.4169235, 0.01544836, -2.293486, 1, 1, 1, 1, 1,
-0.4156023, -1.0823, -3.529122, 1, 1, 1, 1, 1,
-0.4114412, -0.4412363, -3.277208, 1, 1, 1, 1, 1,
-0.4084911, -0.173581, -0.7393365, 1, 1, 1, 1, 1,
-0.3994083, 0.8241359, 0.1724575, 1, 1, 1, 1, 1,
-0.3993597, -0.01154659, -2.703789, 1, 1, 1, 1, 1,
-0.3926037, -0.7183289, -1.769529, 1, 1, 1, 1, 1,
-0.3924384, 0.151556, -1.577257, 1, 1, 1, 1, 1,
-0.3897392, 0.6316114, -0.6029667, 0, 0, 1, 1, 1,
-0.3878858, 0.004358798, -0.9953757, 1, 0, 0, 1, 1,
-0.3868782, 0.3235723, -1.707092, 1, 0, 0, 1, 1,
-0.382818, 0.6225832, -1.206731, 1, 0, 0, 1, 1,
-0.382465, -0.259017, -2.282325, 1, 0, 0, 1, 1,
-0.3736272, -0.7193151, -1.896645, 1, 0, 0, 1, 1,
-0.3735085, -1.898333, -3.552437, 0, 0, 0, 1, 1,
-0.3732087, 0.3424529, 0.2771774, 0, 0, 0, 1, 1,
-0.3714261, -0.1139002, -1.225026, 0, 0, 0, 1, 1,
-0.369699, 1.699668, 0.6530994, 0, 0, 0, 1, 1,
-0.3678657, -2.227867, -2.307201, 0, 0, 0, 1, 1,
-0.3625937, 0.3130229, -0.05889553, 0, 0, 0, 1, 1,
-0.3613219, -1.046734, -2.948873, 0, 0, 0, 1, 1,
-0.3596414, 0.6058582, -0.8695931, 1, 1, 1, 1, 1,
-0.3580016, -1.343725, -4.407662, 1, 1, 1, 1, 1,
-0.3577494, -0.9155107, -3.561799, 1, 1, 1, 1, 1,
-0.3519936, -0.9937112, -4.168378, 1, 1, 1, 1, 1,
-0.3505654, -0.7586629, -2.562011, 1, 1, 1, 1, 1,
-0.3477662, -0.1006574, -2.252911, 1, 1, 1, 1, 1,
-0.3466005, -0.3253932, -2.134372, 1, 1, 1, 1, 1,
-0.3389856, 1.847416, 0.3235939, 1, 1, 1, 1, 1,
-0.3381079, -1.716701, -3.34596, 1, 1, 1, 1, 1,
-0.3310421, -1.031119, -2.854293, 1, 1, 1, 1, 1,
-0.3293043, -0.5783459, -3.630594, 1, 1, 1, 1, 1,
-0.3269975, 0.6731321, -0.8506553, 1, 1, 1, 1, 1,
-0.3268422, 0.5754399, -0.6183631, 1, 1, 1, 1, 1,
-0.3243284, -0.4595879, -4.218483, 1, 1, 1, 1, 1,
-0.3241779, 0.4583984, -0.6593709, 1, 1, 1, 1, 1,
-0.3176695, 1.285282, -0.3223885, 0, 0, 1, 1, 1,
-0.3125005, 0.7442521, -0.8483694, 1, 0, 0, 1, 1,
-0.3115284, -0.9402969, -2.708523, 1, 0, 0, 1, 1,
-0.3114589, -0.2434193, -2.372764, 1, 0, 0, 1, 1,
-0.3060816, 0.5864441, -0.7250909, 1, 0, 0, 1, 1,
-0.3007386, 0.3198872, -0.3541234, 1, 0, 0, 1, 1,
-0.2962095, -0.490799, -3.49018, 0, 0, 0, 1, 1,
-0.2946987, -0.4603693, -1.752852, 0, 0, 0, 1, 1,
-0.2913005, 0.7825433, 0.2479236, 0, 0, 0, 1, 1,
-0.2908353, -0.448152, -1.762463, 0, 0, 0, 1, 1,
-0.2906413, 0.9296464, -0.7795321, 0, 0, 0, 1, 1,
-0.2863783, 1.236657, -0.05169177, 0, 0, 0, 1, 1,
-0.2860682, -0.5769351, -2.895876, 0, 0, 0, 1, 1,
-0.2853813, -0.4427087, -2.981008, 1, 1, 1, 1, 1,
-0.2840393, -0.2726632, -2.856792, 1, 1, 1, 1, 1,
-0.2811527, 2.007269, -1.258289, 1, 1, 1, 1, 1,
-0.2790099, 0.3930471, -2.130919, 1, 1, 1, 1, 1,
-0.2747698, 0.5390954, 0.2376771, 1, 1, 1, 1, 1,
-0.2744188, -1.316123, -1.943478, 1, 1, 1, 1, 1,
-0.2705073, -1.196564, -2.05653, 1, 1, 1, 1, 1,
-0.2699324, -0.309209, -2.056338, 1, 1, 1, 1, 1,
-0.2655719, 1.137419, 0.9255981, 1, 1, 1, 1, 1,
-0.2654918, 0.6681114, -0.8515712, 1, 1, 1, 1, 1,
-0.265374, 1.193614, 1.226317, 1, 1, 1, 1, 1,
-0.2588729, 0.1073235, -1.399194, 1, 1, 1, 1, 1,
-0.2535821, 1.127767, -0.7982514, 1, 1, 1, 1, 1,
-0.2371503, 1.110095, -0.2893323, 1, 1, 1, 1, 1,
-0.2354064, -0.05976757, -2.100034, 1, 1, 1, 1, 1,
-0.2295352, -0.8049431, -4.463095, 0, 0, 1, 1, 1,
-0.229006, -0.6781834, -3.901926, 1, 0, 0, 1, 1,
-0.2226337, -0.06741484, -2.669924, 1, 0, 0, 1, 1,
-0.2222521, 0.5685465, -0.06132613, 1, 0, 0, 1, 1,
-0.2212227, 0.2415081, -0.2679077, 1, 0, 0, 1, 1,
-0.2202083, 1.227806, -1.043959, 1, 0, 0, 1, 1,
-0.2122667, 0.0106229, -2.854594, 0, 0, 0, 1, 1,
-0.2121476, -0.4878177, -1.063003, 0, 0, 0, 1, 1,
-0.2079149, -1.995633, -2.754771, 0, 0, 0, 1, 1,
-0.2075533, -0.2997991, -1.983534, 0, 0, 0, 1, 1,
-0.2060579, 1.353381, -0.4301575, 0, 0, 0, 1, 1,
-0.2026239, -0.1834149, -1.721482, 0, 0, 0, 1, 1,
-0.2019219, 0.9490703, -0.2683088, 0, 0, 0, 1, 1,
-0.1988426, 0.7201478, -0.4624468, 1, 1, 1, 1, 1,
-0.1980764, 0.8464273, -2.110633, 1, 1, 1, 1, 1,
-0.1975409, 1.8903, -0.3671231, 1, 1, 1, 1, 1,
-0.1930799, -0.3926167, -4.383583, 1, 1, 1, 1, 1,
-0.1930385, -1.529418, -3.737925, 1, 1, 1, 1, 1,
-0.1860266, -1.380455, -2.941367, 1, 1, 1, 1, 1,
-0.1856351, 1.111376, 1.780007, 1, 1, 1, 1, 1,
-0.181645, -0.5425811, -1.37174, 1, 1, 1, 1, 1,
-0.1803419, 1.216686, 1.334032, 1, 1, 1, 1, 1,
-0.1728771, 2.285354, 1.106964, 1, 1, 1, 1, 1,
-0.166177, -0.2492029, -3.190466, 1, 1, 1, 1, 1,
-0.1621116, 2.957841, -0.4790719, 1, 1, 1, 1, 1,
-0.1609589, -1.409922, -3.594566, 1, 1, 1, 1, 1,
-0.1534574, 1.403767, -0.640941, 1, 1, 1, 1, 1,
-0.1500371, 1.36733, 1.202769, 1, 1, 1, 1, 1,
-0.1457489, -0.4784931, -2.510554, 0, 0, 1, 1, 1,
-0.1416066, 0.9088112, -0.6940444, 1, 0, 0, 1, 1,
-0.1390331, 0.3242006, -2.347502, 1, 0, 0, 1, 1,
-0.1387395, -0.01815519, -0.5553016, 1, 0, 0, 1, 1,
-0.1377316, -0.5806227, -2.250269, 1, 0, 0, 1, 1,
-0.1297681, 1.418761, 0.8516495, 1, 0, 0, 1, 1,
-0.1291118, 1.858228, 0.1896734, 0, 0, 0, 1, 1,
-0.1275883, -0.1323878, -0.3443532, 0, 0, 0, 1, 1,
-0.1244692, -0.6819006, -2.697737, 0, 0, 0, 1, 1,
-0.1201272, -1.024656, -3.312994, 0, 0, 0, 1, 1,
-0.1166007, 1.366625, -1.881012, 0, 0, 0, 1, 1,
-0.1128549, 0.105159, 0.4116068, 0, 0, 0, 1, 1,
-0.1109728, -0.8042223, -4.281468, 0, 0, 0, 1, 1,
-0.1101257, -0.2795612, -2.604181, 1, 1, 1, 1, 1,
-0.1077808, 2.046152, -1.188186, 1, 1, 1, 1, 1,
-0.1013801, -1.446962, -3.307452, 1, 1, 1, 1, 1,
-0.09622251, 1.764917, -0.2637495, 1, 1, 1, 1, 1,
-0.09613923, 0.8804623, 1.002018, 1, 1, 1, 1, 1,
-0.09531979, 1.069252, -0.7280977, 1, 1, 1, 1, 1,
-0.09109945, -0.6658734, -2.118967, 1, 1, 1, 1, 1,
-0.09040964, 1.189803, -0.1004853, 1, 1, 1, 1, 1,
-0.08927586, 0.7692503, 0.404909, 1, 1, 1, 1, 1,
-0.08848193, 0.2980515, 0.04078848, 1, 1, 1, 1, 1,
-0.08765375, -0.07238709, -2.495647, 1, 1, 1, 1, 1,
-0.07979199, -1.875331, -4.268713, 1, 1, 1, 1, 1,
-0.07751536, 0.6541994, 0.6306881, 1, 1, 1, 1, 1,
-0.07389701, -1.829814, -4.059715, 1, 1, 1, 1, 1,
-0.0738223, -0.9326847, -1.787312, 1, 1, 1, 1, 1,
-0.0722197, 0.9544368, 0.6411393, 0, 0, 1, 1, 1,
-0.06916945, 0.03739066, -2.525514, 1, 0, 0, 1, 1,
-0.06745292, 0.1773893, 0.02537796, 1, 0, 0, 1, 1,
-0.06618401, -0.4541187, -2.362048, 1, 0, 0, 1, 1,
-0.06600586, 0.1831489, 0.4267484, 1, 0, 0, 1, 1,
-0.0652649, -0.4823431, -2.586482, 1, 0, 0, 1, 1,
-0.0644687, -0.2059587, -3.765081, 0, 0, 0, 1, 1,
-0.06390789, -0.187583, -0.7502895, 0, 0, 0, 1, 1,
-0.06148592, -0.08623112, -4.143061, 0, 0, 0, 1, 1,
-0.06110112, 0.3073169, -0.6348854, 0, 0, 0, 1, 1,
-0.04971409, -0.6009605, -3.782061, 0, 0, 0, 1, 1,
-0.04960774, -0.665042, -4.340504, 0, 0, 0, 1, 1,
-0.04143598, 0.2284454, 2.139704, 0, 0, 0, 1, 1,
-0.03613691, 1.395353, 0.8695383, 1, 1, 1, 1, 1,
-0.03605267, 0.8698683, -1.266542, 1, 1, 1, 1, 1,
-0.03522624, 0.7505229, -0.6711884, 1, 1, 1, 1, 1,
-0.03398243, -0.1668387, -1.973156, 1, 1, 1, 1, 1,
-0.03349182, -1.748663, -3.531801, 1, 1, 1, 1, 1,
-0.03202679, 0.4805435, 0.9429939, 1, 1, 1, 1, 1,
-0.03183724, 1.148727, -0.5136064, 1, 1, 1, 1, 1,
-0.03102657, -1.379521, -1.952475, 1, 1, 1, 1, 1,
-0.03005849, 0.215368, -1.30865, 1, 1, 1, 1, 1,
-0.02725849, -1.351972, -1.125869, 1, 1, 1, 1, 1,
-0.02270975, 0.3928382, 0.1658633, 1, 1, 1, 1, 1,
-0.02110607, -1.239537, -2.628599, 1, 1, 1, 1, 1,
-0.01702448, -2.011784, -2.657219, 1, 1, 1, 1, 1,
-0.0158339, -1.661238, -3.163837, 1, 1, 1, 1, 1,
-0.01245783, 0.4793396, 0.08328819, 1, 1, 1, 1, 1,
-0.01063554, 0.3875293, 1.171456, 0, 0, 1, 1, 1,
-0.01053626, 0.4240043, 0.1579935, 1, 0, 0, 1, 1,
-0.007843344, 0.2759542, -0.5102938, 1, 0, 0, 1, 1,
-0.005235008, 0.480253, -1.68323, 1, 0, 0, 1, 1,
-0.004303466, -0.321717, -4.794382, 1, 0, 0, 1, 1,
-0.004206322, 0.1616347, 0.59794, 1, 0, 0, 1, 1,
-0.003507905, -0.08181441, -4.108242, 0, 0, 0, 1, 1,
-0.001584583, -0.2879328, -4.960754, 0, 0, 0, 1, 1,
9.729868e-05, -0.2730016, 3.302524, 0, 0, 0, 1, 1,
0.0001677787, -0.4019569, 4.565407, 0, 0, 0, 1, 1,
0.003525772, -0.3163299, 0.2119654, 0, 0, 0, 1, 1,
0.003971705, -0.6815978, 3.925812, 0, 0, 0, 1, 1,
0.004237849, 1.378876, 0.2048486, 0, 0, 0, 1, 1,
0.005068492, 0.4549502, -0.9350443, 1, 1, 1, 1, 1,
0.005831828, 1.137617, 1.002232, 1, 1, 1, 1, 1,
0.01064659, 0.9020294, 0.6621359, 1, 1, 1, 1, 1,
0.01612444, -0.6074274, 3.762061, 1, 1, 1, 1, 1,
0.01981407, -0.4079081, 2.928888, 1, 1, 1, 1, 1,
0.02818941, -0.9255169, 2.545796, 1, 1, 1, 1, 1,
0.0295176, 0.1352074, 1.577268, 1, 1, 1, 1, 1,
0.03532359, 0.1862565, -0.7174848, 1, 1, 1, 1, 1,
0.03753531, 1.225936, -2.969666, 1, 1, 1, 1, 1,
0.03989943, -0.5651569, 4.395998, 1, 1, 1, 1, 1,
0.04054518, -0.5348736, 3.823472, 1, 1, 1, 1, 1,
0.04076421, 0.1610378, -1.858723, 1, 1, 1, 1, 1,
0.04101555, -1.058605, 3.135769, 1, 1, 1, 1, 1,
0.04135758, 0.7356356, -0.6012887, 1, 1, 1, 1, 1,
0.0432439, 1.081575, -0.3696563, 1, 1, 1, 1, 1,
0.0434755, -2.104126, 4.067204, 0, 0, 1, 1, 1,
0.04382998, 0.6403879, 0.6730338, 1, 0, 0, 1, 1,
0.0515457, -1.873097, 3.106404, 1, 0, 0, 1, 1,
0.05195129, 0.3437099, 0.1601738, 1, 0, 0, 1, 1,
0.05374162, 0.875442, -0.7462884, 1, 0, 0, 1, 1,
0.05712687, 0.7335779, 0.4685547, 1, 0, 0, 1, 1,
0.05820734, -0.8515145, 2.200363, 0, 0, 0, 1, 1,
0.05827191, -1.089716, 1.807975, 0, 0, 0, 1, 1,
0.06591655, -0.6846144, 3.1379, 0, 0, 0, 1, 1,
0.06600123, -1.704448, 2.885088, 0, 0, 0, 1, 1,
0.06650819, 0.180564, 0.125052, 0, 0, 0, 1, 1,
0.07348146, 0.5706114, 0.04888576, 0, 0, 0, 1, 1,
0.07520919, 1.07874, -0.3361039, 0, 0, 0, 1, 1,
0.07581969, -0.5698512, 0.8822351, 1, 1, 1, 1, 1,
0.07633857, 0.1562715, 0.6386467, 1, 1, 1, 1, 1,
0.07736081, 0.3819095, 1.976105, 1, 1, 1, 1, 1,
0.08159357, 0.3402539, -0.3495644, 1, 1, 1, 1, 1,
0.08251581, -0.9813698, 0.9076367, 1, 1, 1, 1, 1,
0.08709649, 0.02947659, 0.3721692, 1, 1, 1, 1, 1,
0.08738579, 1.030071, 0.08235373, 1, 1, 1, 1, 1,
0.09150876, 0.6147439, -0.2388662, 1, 1, 1, 1, 1,
0.09428432, 1.114508, 0.6400531, 1, 1, 1, 1, 1,
0.0943765, 0.06007713, 1.526269, 1, 1, 1, 1, 1,
0.09801816, -1.190211, 3.341856, 1, 1, 1, 1, 1,
0.09893606, 1.224997, -1.228953, 1, 1, 1, 1, 1,
0.09977645, -1.611613, 3.394421, 1, 1, 1, 1, 1,
0.1032486, -1.399597, 2.836648, 1, 1, 1, 1, 1,
0.1072231, 0.3946477, -1.453461, 1, 1, 1, 1, 1,
0.1081232, -0.305929, 3.014121, 0, 0, 1, 1, 1,
0.1150766, -0.9787769, 2.117887, 1, 0, 0, 1, 1,
0.1151137, -0.533636, 3.214429, 1, 0, 0, 1, 1,
0.1211688, -0.03265024, 2.13354, 1, 0, 0, 1, 1,
0.1216115, 0.4025176, 2.034793, 1, 0, 0, 1, 1,
0.1242053, 0.5737959, -0.7773178, 1, 0, 0, 1, 1,
0.1319028, -0.5721671, 2.833712, 0, 0, 0, 1, 1,
0.132362, -0.1634073, 4.161342, 0, 0, 0, 1, 1,
0.1369736, 2.707012, 1.30655, 0, 0, 0, 1, 1,
0.1384191, -0.5499644, 2.673079, 0, 0, 0, 1, 1,
0.1388939, 0.3588462, -1.74989, 0, 0, 0, 1, 1,
0.1421948, -0.7481954, 1.4781, 0, 0, 0, 1, 1,
0.1423078, -0.6638353, 1.155747, 0, 0, 0, 1, 1,
0.1441625, 0.9978687, 0.1920269, 1, 1, 1, 1, 1,
0.1459573, 0.6332761, 0.8534446, 1, 1, 1, 1, 1,
0.1470517, 0.1097282, 0.8826851, 1, 1, 1, 1, 1,
0.1478521, 1.848513, 0.9805194, 1, 1, 1, 1, 1,
0.1479971, 0.6956969, 1.070949, 1, 1, 1, 1, 1,
0.1508017, 0.03367727, 1.508761, 1, 1, 1, 1, 1,
0.1542516, -1.39801, 4.097156, 1, 1, 1, 1, 1,
0.1571647, 0.03833104, 1.62923, 1, 1, 1, 1, 1,
0.1640972, -1.092221, 2.430785, 1, 1, 1, 1, 1,
0.1646747, -0.315031, 1.816369, 1, 1, 1, 1, 1,
0.1721037, 1.406996, -0.4582515, 1, 1, 1, 1, 1,
0.1737268, -1.299058, 2.045933, 1, 1, 1, 1, 1,
0.1755894, 0.3401557, 1.247957, 1, 1, 1, 1, 1,
0.1800845, -0.0761882, 2.030939, 1, 1, 1, 1, 1,
0.1815284, 0.2332721, 1.288517, 1, 1, 1, 1, 1,
0.1821702, 1.709363, -0.6534261, 0, 0, 1, 1, 1,
0.1822306, 0.1285177, 1.086199, 1, 0, 0, 1, 1,
0.1839897, -0.3253344, 3.733602, 1, 0, 0, 1, 1,
0.1852193, 0.1283133, -0.2156986, 1, 0, 0, 1, 1,
0.1858606, 0.8587297, 0.4759446, 1, 0, 0, 1, 1,
0.1879102, -0.1321386, 2.855872, 1, 0, 0, 1, 1,
0.2022692, -2.064956, 2.3817, 0, 0, 0, 1, 1,
0.2032359, -0.6604699, 2.483675, 0, 0, 0, 1, 1,
0.203593, -0.3234179, 2.495043, 0, 0, 0, 1, 1,
0.2058114, -1.09222, 2.844664, 0, 0, 0, 1, 1,
0.2059484, -0.8913834, 1.885796, 0, 0, 0, 1, 1,
0.2092882, -0.4346445, 2.795826, 0, 0, 0, 1, 1,
0.2117306, -0.143061, 3.146027, 0, 0, 0, 1, 1,
0.2125768, -1.0341, 2.020122, 1, 1, 1, 1, 1,
0.2139617, 1.796622, 1.272302, 1, 1, 1, 1, 1,
0.2141119, 1.185541, 1.962523, 1, 1, 1, 1, 1,
0.2160082, 0.187566, 1.473023, 1, 1, 1, 1, 1,
0.2167225, -0.2476645, 2.333133, 1, 1, 1, 1, 1,
0.2195062, -0.6275167, 4.621639, 1, 1, 1, 1, 1,
0.2213768, -1.427013, 3.428166, 1, 1, 1, 1, 1,
0.2244619, -0.3070418, 1.489923, 1, 1, 1, 1, 1,
0.2249341, 0.3937564, 1.156384, 1, 1, 1, 1, 1,
0.2265862, -0.6085382, 1.522273, 1, 1, 1, 1, 1,
0.2295294, -0.6454947, 2.398951, 1, 1, 1, 1, 1,
0.2302349, -0.8997473, 1.953291, 1, 1, 1, 1, 1,
0.2302893, -1.588454, 2.639407, 1, 1, 1, 1, 1,
0.2303042, -0.01068185, 3.103123, 1, 1, 1, 1, 1,
0.233041, 0.3569129, 1.164311, 1, 1, 1, 1, 1,
0.2375235, 0.8721194, -0.6051146, 0, 0, 1, 1, 1,
0.2427154, 0.1659981, 1.793094, 1, 0, 0, 1, 1,
0.2487258, -0.4270851, 3.151989, 1, 0, 0, 1, 1,
0.2489598, -1.428303, 4.135749, 1, 0, 0, 1, 1,
0.2511763, -0.3238229, 3.236473, 1, 0, 0, 1, 1,
0.2539556, -0.05924626, 1.708892, 1, 0, 0, 1, 1,
0.2552458, -0.454684, 3.092509, 0, 0, 0, 1, 1,
0.2568506, 1.161096, -1.700371, 0, 0, 0, 1, 1,
0.2627076, 0.2297509, 1.799644, 0, 0, 0, 1, 1,
0.2638885, 0.5721081, -0.2478735, 0, 0, 0, 1, 1,
0.2641038, -1.470766, 2.897821, 0, 0, 0, 1, 1,
0.265462, -0.2025766, 1.087945, 0, 0, 0, 1, 1,
0.2657742, 2.266364, 1.043739, 0, 0, 0, 1, 1,
0.2703402, -0.7442553, 3.566759, 1, 1, 1, 1, 1,
0.2752657, 1.032786, 1.061378, 1, 1, 1, 1, 1,
0.2754785, 0.8314448, -0.231382, 1, 1, 1, 1, 1,
0.277454, -0.3753629, 3.303109, 1, 1, 1, 1, 1,
0.2874734, -1.055076, 2.547146, 1, 1, 1, 1, 1,
0.2892006, -0.2327649, 1.571448, 1, 1, 1, 1, 1,
0.2943108, 1.95265, 0.2170319, 1, 1, 1, 1, 1,
0.2959467, -1.347226, 4.849864, 1, 1, 1, 1, 1,
0.3003926, 0.4101556, -0.5402016, 1, 1, 1, 1, 1,
0.3011194, 0.1669001, 0.225223, 1, 1, 1, 1, 1,
0.3055956, 1.643141, 2.52551, 1, 1, 1, 1, 1,
0.3066446, 0.5864643, 1.187307, 1, 1, 1, 1, 1,
0.3085282, 0.1187265, 1.200356, 1, 1, 1, 1, 1,
0.3111613, 1.573283, 0.321772, 1, 1, 1, 1, 1,
0.3129996, -0.4113359, 2.659067, 1, 1, 1, 1, 1,
0.3135243, 0.2463098, 1.364241, 0, 0, 1, 1, 1,
0.3172773, 1.203387, -0.5567082, 1, 0, 0, 1, 1,
0.3183787, -1.144805, 1.942977, 1, 0, 0, 1, 1,
0.3235916, 0.3704365, 1.153461, 1, 0, 0, 1, 1,
0.3273003, -1.397289, 2.30318, 1, 0, 0, 1, 1,
0.3330815, -1.668491, 2.987045, 1, 0, 0, 1, 1,
0.3350804, 0.3567485, 0.5299316, 0, 0, 0, 1, 1,
0.3414542, -0.1069093, 2.997607, 0, 0, 0, 1, 1,
0.344594, 0.5390472, -0.2802315, 0, 0, 0, 1, 1,
0.3466785, -1.284205, 2.825775, 0, 0, 0, 1, 1,
0.3515773, -0.04331647, 1.037676, 0, 0, 0, 1, 1,
0.3521814, 0.8439002, 0.9086528, 0, 0, 0, 1, 1,
0.3556616, 0.3827376, -0.1911992, 0, 0, 0, 1, 1,
0.3571221, 1.142703, 1.127223, 1, 1, 1, 1, 1,
0.3657145, -2.344611, 2.11018, 1, 1, 1, 1, 1,
0.3669477, -0.1534177, 1.426764, 1, 1, 1, 1, 1,
0.3700964, -1.168847, 3.191591, 1, 1, 1, 1, 1,
0.3737003, 0.9411309, -0.7502417, 1, 1, 1, 1, 1,
0.3795422, 1.175928, 1.247726, 1, 1, 1, 1, 1,
0.3808005, -1.492271, 4.539684, 1, 1, 1, 1, 1,
0.380931, 0.6943154, 0.3003975, 1, 1, 1, 1, 1,
0.3812027, 0.596628, 0.1439007, 1, 1, 1, 1, 1,
0.3845325, -0.2166114, 1.263455, 1, 1, 1, 1, 1,
0.3898439, -0.873143, 4.694735, 1, 1, 1, 1, 1,
0.396002, 1.675221, -0.3427723, 1, 1, 1, 1, 1,
0.3975956, -0.6695213, 4.117642, 1, 1, 1, 1, 1,
0.4058141, -1.323455, 2.457613, 1, 1, 1, 1, 1,
0.4062971, -0.7237846, 1.27606, 1, 1, 1, 1, 1,
0.4105401, 0.05008643, 2.03038, 0, 0, 1, 1, 1,
0.411488, -1.571271, 3.50189, 1, 0, 0, 1, 1,
0.4118604, 0.1080339, 2.203558, 1, 0, 0, 1, 1,
0.4128639, 0.1656983, 1.615169, 1, 0, 0, 1, 1,
0.4174662, 0.903322, 0.5843821, 1, 0, 0, 1, 1,
0.4212972, -0.8743864, 2.196437, 1, 0, 0, 1, 1,
0.4239777, -1.655315, 3.553833, 0, 0, 0, 1, 1,
0.426883, 0.306918, 1.349349, 0, 0, 0, 1, 1,
0.4287312, 0.6055489, -1.462416, 0, 0, 0, 1, 1,
0.4308936, 1.013059, 0.1266987, 0, 0, 0, 1, 1,
0.4348346, 0.3485537, 1.423639, 0, 0, 0, 1, 1,
0.4371379, 1.009298, 0.04135093, 0, 0, 0, 1, 1,
0.4400408, 0.5099735, 0.2870041, 0, 0, 0, 1, 1,
0.4406228, 1.389226, 1.075675, 1, 1, 1, 1, 1,
0.4413897, 0.8892015, 0.5122943, 1, 1, 1, 1, 1,
0.4422136, 1.273886, 0.5947253, 1, 1, 1, 1, 1,
0.4514381, -1.191607, 1.397147, 1, 1, 1, 1, 1,
0.4520541, 0.8906862, 0.3297674, 1, 1, 1, 1, 1,
0.454533, 2.070649, 0.08080009, 1, 1, 1, 1, 1,
0.4547828, 1.450328, 0.6456517, 1, 1, 1, 1, 1,
0.4585518, -1.084362, 2.106998, 1, 1, 1, 1, 1,
0.464164, 1.386852, 1.440956, 1, 1, 1, 1, 1,
0.465696, -0.4355317, 2.676345, 1, 1, 1, 1, 1,
0.4673146, 0.9282713, 0.5995811, 1, 1, 1, 1, 1,
0.4703461, 1.524244, 0.1039952, 1, 1, 1, 1, 1,
0.4708309, -0.09791908, 2.594079, 1, 1, 1, 1, 1,
0.4720236, -0.4844581, 2.216038, 1, 1, 1, 1, 1,
0.4739417, -1.558563, 4.156908, 1, 1, 1, 1, 1,
0.474678, 0.3604497, 1.227302, 0, 0, 1, 1, 1,
0.4763876, -0.1809473, 1.989372, 1, 0, 0, 1, 1,
0.4777916, 1.613968, 0.6007365, 1, 0, 0, 1, 1,
0.4781831, -1.297901, 3.217814, 1, 0, 0, 1, 1,
0.4809181, -0.6831619, 4.959328, 1, 0, 0, 1, 1,
0.4839014, 0.4245237, 1.050951, 1, 0, 0, 1, 1,
0.4856838, 1.562217, 0.3356646, 0, 0, 0, 1, 1,
0.4878112, 0.04072636, 3.025708, 0, 0, 0, 1, 1,
0.4880683, -0.9302161, 1.678503, 0, 0, 0, 1, 1,
0.4929549, -1.999576, 2.691353, 0, 0, 0, 1, 1,
0.4931094, 0.05549085, 0.02363903, 0, 0, 0, 1, 1,
0.4934182, -0.3094065, 3.939904, 0, 0, 0, 1, 1,
0.4948798, -0.8652828, 4.111642, 0, 0, 0, 1, 1,
0.4977755, 1.392145, -0.3011155, 1, 1, 1, 1, 1,
0.4998797, 1.020654, 0.981442, 1, 1, 1, 1, 1,
0.5011382, 0.4067768, 0.4320871, 1, 1, 1, 1, 1,
0.5023811, -1.702894, 2.85659, 1, 1, 1, 1, 1,
0.5037251, -1.181024, 2.168579, 1, 1, 1, 1, 1,
0.5038095, 0.3243958, 0.9034598, 1, 1, 1, 1, 1,
0.5074592, 0.07419695, 2.39092, 1, 1, 1, 1, 1,
0.5105101, 0.7953925, 0.618031, 1, 1, 1, 1, 1,
0.5148324, 1.036699, -0.9699593, 1, 1, 1, 1, 1,
0.5172272, 0.01266684, 0.3776403, 1, 1, 1, 1, 1,
0.5201136, 1.745433, 0.9427112, 1, 1, 1, 1, 1,
0.5206252, -0.6948353, 2.014754, 1, 1, 1, 1, 1,
0.5235668, 0.50876, -0.7682174, 1, 1, 1, 1, 1,
0.5241081, 0.001741725, 1.462205, 1, 1, 1, 1, 1,
0.5290685, -0.2771984, 2.640171, 1, 1, 1, 1, 1,
0.5306999, -2.018509, 3.380198, 0, 0, 1, 1, 1,
0.5318764, -0.2412732, 2.507006, 1, 0, 0, 1, 1,
0.53475, -0.01544911, 1.499538, 1, 0, 0, 1, 1,
0.5348148, 1.137341, 0.704995, 1, 0, 0, 1, 1,
0.5348521, -0.6786379, 0.3031596, 1, 0, 0, 1, 1,
0.5354182, 0.3984174, 0.4859942, 1, 0, 0, 1, 1,
0.5377124, -0.05822388, 1.511909, 0, 0, 0, 1, 1,
0.5441938, -0.4354628, 1.710841, 0, 0, 0, 1, 1,
0.5522929, 0.7538647, 1.695976, 0, 0, 0, 1, 1,
0.5540215, 0.4757726, 2.368404, 0, 0, 0, 1, 1,
0.5566965, -2.028291, 2.879954, 0, 0, 0, 1, 1,
0.5570628, -0.7062497, 0.9363085, 0, 0, 0, 1, 1,
0.5577624, 1.959952, -0.09722613, 0, 0, 0, 1, 1,
0.5619193, -1.624196, 3.157767, 1, 1, 1, 1, 1,
0.5653492, 0.3096516, 2.168952, 1, 1, 1, 1, 1,
0.567557, 0.4852254, 2.150034, 1, 1, 1, 1, 1,
0.5717033, -0.7332345, 2.42004, 1, 1, 1, 1, 1,
0.5725407, -1.344387, 4.097707, 1, 1, 1, 1, 1,
0.5737603, 0.1833356, 1.632595, 1, 1, 1, 1, 1,
0.5762132, -0.2505303, 2.350965, 1, 1, 1, 1, 1,
0.5773689, 1.446952, 1.065025, 1, 1, 1, 1, 1,
0.5789638, -1.196463, 3.287606, 1, 1, 1, 1, 1,
0.5822025, 0.7937587, -0.4390822, 1, 1, 1, 1, 1,
0.5838571, -1.049416, 4.170244, 1, 1, 1, 1, 1,
0.5846801, -1.966545, 3.108167, 1, 1, 1, 1, 1,
0.5848134, 0.06237888, 1.570757, 1, 1, 1, 1, 1,
0.5877695, -0.9009321, 2.478529, 1, 1, 1, 1, 1,
0.5882732, 0.02885242, 2.296442, 1, 1, 1, 1, 1,
0.5912486, -0.9606186, 3.295991, 0, 0, 1, 1, 1,
0.5942497, 0.08320007, 1.256412, 1, 0, 0, 1, 1,
0.602933, -0.1344515, 1.331712, 1, 0, 0, 1, 1,
0.6056273, 2.109615, -0.421769, 1, 0, 0, 1, 1,
0.6081402, 0.4102306, 0.8502746, 1, 0, 0, 1, 1,
0.6085126, -1.691012, 3.051476, 1, 0, 0, 1, 1,
0.6091497, -0.1300907, 2.066021, 0, 0, 0, 1, 1,
0.6103545, -0.2488167, 2.330271, 0, 0, 0, 1, 1,
0.6184368, 0.3352328, 1.71215, 0, 0, 0, 1, 1,
0.6232598, 1.879299, -0.1375844, 0, 0, 0, 1, 1,
0.6265361, 0.2881956, 0.9571851, 0, 0, 0, 1, 1,
0.6286812, 1.371984, -0.6601562, 0, 0, 0, 1, 1,
0.6293356, 0.5386177, -0.9935923, 0, 0, 0, 1, 1,
0.6337037, 0.1492673, 1.523368, 1, 1, 1, 1, 1,
0.6338472, -0.4205394, 0.5739314, 1, 1, 1, 1, 1,
0.6422425, 1.409563, -0.05781041, 1, 1, 1, 1, 1,
0.6427186, -0.8656783, 1.43091, 1, 1, 1, 1, 1,
0.6442183, -0.1084172, 1.996993, 1, 1, 1, 1, 1,
0.6484264, 0.4950112, 3.218492, 1, 1, 1, 1, 1,
0.6536794, 2.4917, 0.3513169, 1, 1, 1, 1, 1,
0.6570842, -0.6173992, 4.531504, 1, 1, 1, 1, 1,
0.6644716, -0.9164745, 0.828504, 1, 1, 1, 1, 1,
0.665153, -0.05668191, 0.968425, 1, 1, 1, 1, 1,
0.6662459, -0.3645914, 1.706039, 1, 1, 1, 1, 1,
0.6742905, -0.3208924, 1.027819, 1, 1, 1, 1, 1,
0.6764239, -0.691843, 1.826739, 1, 1, 1, 1, 1,
0.682456, -0.5311023, 2.039119, 1, 1, 1, 1, 1,
0.6910262, 0.6270365, 2.01085, 1, 1, 1, 1, 1,
0.6912247, 1.110263, 1.242949, 0, 0, 1, 1, 1,
0.6989163, 1.061547, 0.9981819, 1, 0, 0, 1, 1,
0.7005321, -0.8058903, 0.06539253, 1, 0, 0, 1, 1,
0.703226, -0.4552127, 2.433097, 1, 0, 0, 1, 1,
0.7190811, -0.4765293, 0.6875716, 1, 0, 0, 1, 1,
0.7210402, -1.713945, 2.276665, 1, 0, 0, 1, 1,
0.7233621, 0.7203864, 0.8308129, 0, 0, 0, 1, 1,
0.72666, -0.4511753, 0.8886586, 0, 0, 0, 1, 1,
0.7329582, -2.592179, 2.176586, 0, 0, 0, 1, 1,
0.7440424, -0.6966677, 1.841475, 0, 0, 0, 1, 1,
0.7499573, 0.04551056, 1.401417, 0, 0, 0, 1, 1,
0.7510017, -0.5250719, 3.097633, 0, 0, 0, 1, 1,
0.7582979, 1.249146, -0.5011591, 0, 0, 0, 1, 1,
0.7597076, -2.012147, 2.590722, 1, 1, 1, 1, 1,
0.7630619, -0.5609356, 2.246105, 1, 1, 1, 1, 1,
0.7650194, 1.93856, 1.800503, 1, 1, 1, 1, 1,
0.8021208, 1.230385, 1.389056, 1, 1, 1, 1, 1,
0.8113312, 1.435602, 1.64355, 1, 1, 1, 1, 1,
0.8150358, -1.237284, 3.447217, 1, 1, 1, 1, 1,
0.8184799, -0.2642615, 0.9170465, 1, 1, 1, 1, 1,
0.8187638, 0.9215805, -0.3136078, 1, 1, 1, 1, 1,
0.8218306, 1.109345, 0.8866377, 1, 1, 1, 1, 1,
0.8223968, -0.6501247, 2.632256, 1, 1, 1, 1, 1,
0.82743, -0.2128925, 3.410126, 1, 1, 1, 1, 1,
0.8345487, 0.6493504, 2.328924, 1, 1, 1, 1, 1,
0.8395659, 0.7918556, -1.326502, 1, 1, 1, 1, 1,
0.8411987, -1.171358, 2.659126, 1, 1, 1, 1, 1,
0.8450979, -1.871065, 1.363974, 1, 1, 1, 1, 1,
0.8463773, -0.8198344, 2.467729, 0, 0, 1, 1, 1,
0.8480077, -1.199964, 3.528922, 1, 0, 0, 1, 1,
0.8483258, -1.23487, 1.714129, 1, 0, 0, 1, 1,
0.8537195, -1.958823, 1.267156, 1, 0, 0, 1, 1,
0.8544346, -1.212977, 2.179255, 1, 0, 0, 1, 1,
0.861544, 1.04194, 1.835313, 1, 0, 0, 1, 1,
0.8624896, 0.6581459, 0.2943126, 0, 0, 0, 1, 1,
0.8679845, -1.060858, 2.27863, 0, 0, 0, 1, 1,
0.8726917, 0.6153739, 1.362938, 0, 0, 0, 1, 1,
0.8744818, 0.8492689, 0.5315933, 0, 0, 0, 1, 1,
0.875499, -0.6362556, 1.105023, 0, 0, 0, 1, 1,
0.8782144, -1.674779, 2.075414, 0, 0, 0, 1, 1,
0.8786343, -0.7096386, 2.395036, 0, 0, 0, 1, 1,
0.8829171, 1.310208, 0.6368178, 1, 1, 1, 1, 1,
0.88804, 0.2919448, 0.5024143, 1, 1, 1, 1, 1,
0.8885644, 0.008826953, 2.02509, 1, 1, 1, 1, 1,
0.8940107, 0.5179, -0.01006423, 1, 1, 1, 1, 1,
0.8958428, -1.185921, 2.348312, 1, 1, 1, 1, 1,
0.896041, -1.419728, 3.368904, 1, 1, 1, 1, 1,
0.9087986, 0.5772732, 1.186192, 1, 1, 1, 1, 1,
0.9106466, -1.536327, 2.511448, 1, 1, 1, 1, 1,
0.912555, 0.3897785, 0.5727707, 1, 1, 1, 1, 1,
0.9168177, 1.914593, 0.8280534, 1, 1, 1, 1, 1,
0.9191842, 0.0004074552, -0.9314272, 1, 1, 1, 1, 1,
0.9193377, 1.370587, 0.7335332, 1, 1, 1, 1, 1,
0.9224234, 2.783755, -0.8173482, 1, 1, 1, 1, 1,
0.9231316, 2.000641, -0.1960437, 1, 1, 1, 1, 1,
0.9251185, 0.4625991, 0.5744612, 1, 1, 1, 1, 1,
0.9272012, 0.2162985, 0.4300341, 0, 0, 1, 1, 1,
0.9284389, -0.319884, 3.638347, 1, 0, 0, 1, 1,
0.9291139, -0.4840584, 0.9436784, 1, 0, 0, 1, 1,
0.933739, 0.6517164, 2.010813, 1, 0, 0, 1, 1,
0.934746, 0.2516443, 1.607356, 1, 0, 0, 1, 1,
0.939247, -0.5453348, 2.460239, 1, 0, 0, 1, 1,
0.9441477, 1.273647, 0.8343226, 0, 0, 0, 1, 1,
0.9481346, -1.907568, 3.276506, 0, 0, 0, 1, 1,
0.9484187, 0.6695886, 2.608989, 0, 0, 0, 1, 1,
0.9555038, -1.353082, 2.901642, 0, 0, 0, 1, 1,
0.9556153, 1.410967, 0.9447765, 0, 0, 0, 1, 1,
0.9586107, -0.0494307, 2.358122, 0, 0, 0, 1, 1,
0.9617075, 0.8545686, 0.721875, 0, 0, 0, 1, 1,
0.9635234, 1.062402, -0.08838268, 1, 1, 1, 1, 1,
0.9647773, 0.2546424, 0.4626314, 1, 1, 1, 1, 1,
0.9693196, 0.06380183, 0.06796754, 1, 1, 1, 1, 1,
0.9731684, -0.3159858, 1.584962, 1, 1, 1, 1, 1,
0.9794332, 1.913424, 0.6397356, 1, 1, 1, 1, 1,
0.9982491, 0.2393835, 0.1895257, 1, 1, 1, 1, 1,
1.01086, -0.313563, 1.247215, 1, 1, 1, 1, 1,
1.01194, -0.2154342, 1.610688, 1, 1, 1, 1, 1,
1.012038, 1.664829, 0.3975185, 1, 1, 1, 1, 1,
1.019697, -0.608476, 1.276285, 1, 1, 1, 1, 1,
1.022007, -1.192938, 2.760302, 1, 1, 1, 1, 1,
1.027061, 0.7337569, 2.264603, 1, 1, 1, 1, 1,
1.02744, 1.071784, -0.0367685, 1, 1, 1, 1, 1,
1.030185, -0.1272345, 1.464894, 1, 1, 1, 1, 1,
1.033272, -1.426981, 2.349421, 1, 1, 1, 1, 1,
1.034813, -0.5079517, 1.040286, 0, 0, 1, 1, 1,
1.037326, 0.06373109, 1.549955, 1, 0, 0, 1, 1,
1.0392, -0.2710636, 2.267552, 1, 0, 0, 1, 1,
1.041022, 0.4857516, 2.073664, 1, 0, 0, 1, 1,
1.04515, -1.479133, 1.658312, 1, 0, 0, 1, 1,
1.051944, -0.997533, 3.181485, 1, 0, 0, 1, 1,
1.055614, -0.3289238, 0.5457786, 0, 0, 0, 1, 1,
1.061172, -0.5993575, 0.9812835, 0, 0, 0, 1, 1,
1.061365, 0.2535682, 0.4648848, 0, 0, 0, 1, 1,
1.064466, 0.6218846, 0.5624369, 0, 0, 0, 1, 1,
1.064474, 0.5368336, 3.168144, 0, 0, 0, 1, 1,
1.066166, 0.5920746, 0.1745517, 0, 0, 0, 1, 1,
1.069538, -0.7552682, 2.417276, 0, 0, 0, 1, 1,
1.070462, 0.6407924, 1.846286, 1, 1, 1, 1, 1,
1.072437, 1.071823, 1.756378, 1, 1, 1, 1, 1,
1.07647, -2.206913, 3.494124, 1, 1, 1, 1, 1,
1.0779, -0.4611605, 2.017705, 1, 1, 1, 1, 1,
1.078369, 1.703616, -0.3281565, 1, 1, 1, 1, 1,
1.083123, 0.730797, 1.773642, 1, 1, 1, 1, 1,
1.090245, 0.3065264, 2.171767, 1, 1, 1, 1, 1,
1.094819, 0.8086481, 0.1335907, 1, 1, 1, 1, 1,
1.096359, 1.203394, 0.1708322, 1, 1, 1, 1, 1,
1.112726, -0.01431881, 1.585619, 1, 1, 1, 1, 1,
1.129174, -0.3355914, 1.295272, 1, 1, 1, 1, 1,
1.130159, -0.7554596, 1.160266, 1, 1, 1, 1, 1,
1.131275, -2.558627, 2.763788, 1, 1, 1, 1, 1,
1.132036, 0.5754118, 1.514037, 1, 1, 1, 1, 1,
1.135691, -1.576659, 4.648898, 1, 1, 1, 1, 1,
1.139287, -1.053748, 2.067779, 0, 0, 1, 1, 1,
1.144745, 1.261336, 0.2826315, 1, 0, 0, 1, 1,
1.148088, -0.883621, 2.540054, 1, 0, 0, 1, 1,
1.151686, 0.3383732, 0.9292301, 1, 0, 0, 1, 1,
1.162037, 2.050824, 1.098367, 1, 0, 0, 1, 1,
1.166691, -0.8996521, 2.160071, 1, 0, 0, 1, 1,
1.167469, -0.3656554, 2.348126, 0, 0, 0, 1, 1,
1.177842, 1.822653, -1.255239, 0, 0, 0, 1, 1,
1.180007, 0.3718317, 0.2482653, 0, 0, 0, 1, 1,
1.18114, 1.423127, 0.5522133, 0, 0, 0, 1, 1,
1.183383, 1.352261, 0.5137059, 0, 0, 0, 1, 1,
1.19563, -1.460617, 2.263482, 0, 0, 0, 1, 1,
1.200652, -1.128339, 3.133165, 0, 0, 0, 1, 1,
1.203947, -0.1449752, 0.3698839, 1, 1, 1, 1, 1,
1.20715, -0.2758815, 2.712077, 1, 1, 1, 1, 1,
1.213536, 0.6743392, 0.2877747, 1, 1, 1, 1, 1,
1.221246, 0.7286592, 0.7108735, 1, 1, 1, 1, 1,
1.221463, 0.982288, 1.444412, 1, 1, 1, 1, 1,
1.227168, 0.2301746, 1.782594, 1, 1, 1, 1, 1,
1.259706, 0.1708122, 2.14273, 1, 1, 1, 1, 1,
1.263534, 0.6940394, 1.717391, 1, 1, 1, 1, 1,
1.265309, -0.1830464, 0.8300732, 1, 1, 1, 1, 1,
1.265366, 0.04228671, 1.931833, 1, 1, 1, 1, 1,
1.267541, 0.5783038, 2.709537, 1, 1, 1, 1, 1,
1.269731, 0.8885421, 1.701584, 1, 1, 1, 1, 1,
1.276664, -0.06086435, 0.6589677, 1, 1, 1, 1, 1,
1.278196, -0.5763425, 3.826516, 1, 1, 1, 1, 1,
1.288777, -0.9686799, 2.776816, 1, 1, 1, 1, 1,
1.295604, 0.6055146, 1.350889, 0, 0, 1, 1, 1,
1.295751, -0.8964017, 2.282983, 1, 0, 0, 1, 1,
1.298641, -0.07827497, 1.203135, 1, 0, 0, 1, 1,
1.301635, -0.4999551, 1.391282, 1, 0, 0, 1, 1,
1.305842, -0.4788995, 1.16209, 1, 0, 0, 1, 1,
1.306453, -0.5385605, 0.9314941, 1, 0, 0, 1, 1,
1.333865, 1.191341, 0.9604015, 0, 0, 0, 1, 1,
1.33557, 0.1760704, 1.55129, 0, 0, 0, 1, 1,
1.335747, -0.619158, 2.358367, 0, 0, 0, 1, 1,
1.339378, -0.3140551, 2.138855, 0, 0, 0, 1, 1,
1.344808, -0.4135822, 4.099919, 0, 0, 0, 1, 1,
1.347126, -0.5750425, 2.544734, 0, 0, 0, 1, 1,
1.349828, -0.7910118, 2.300287, 0, 0, 0, 1, 1,
1.350086, 0.4733587, 1.955586, 1, 1, 1, 1, 1,
1.350718, 0.5728688, 1.30679, 1, 1, 1, 1, 1,
1.352733, -0.877518, 3.674934, 1, 1, 1, 1, 1,
1.355361, 1.666297, -0.05892057, 1, 1, 1, 1, 1,
1.35929, 0.4797809, 2.474111, 1, 1, 1, 1, 1,
1.364771, 1.388165, 0.3937443, 1, 1, 1, 1, 1,
1.368993, -1.607726, 2.117355, 1, 1, 1, 1, 1,
1.391237, 0.04410809, 0.4389963, 1, 1, 1, 1, 1,
1.397834, -0.3349669, 1.688781, 1, 1, 1, 1, 1,
1.419973, -0.2694358, 1.007952, 1, 1, 1, 1, 1,
1.428432, -2.048766, 2.778639, 1, 1, 1, 1, 1,
1.429138, 1.115001, 0.06493247, 1, 1, 1, 1, 1,
1.43787, 0.8586397, 0.792439, 1, 1, 1, 1, 1,
1.438423, -0.465265, 1.92988, 1, 1, 1, 1, 1,
1.447039, 1.031602, 1.254055, 1, 1, 1, 1, 1,
1.456921, 1.217411, -0.5499587, 0, 0, 1, 1, 1,
1.460454, -0.7624074, 0.9392611, 1, 0, 0, 1, 1,
1.470976, -0.2446538, 0.4431654, 1, 0, 0, 1, 1,
1.471211, 1.497834, 2.31255, 1, 0, 0, 1, 1,
1.476977, 0.3568721, 1.456564, 1, 0, 0, 1, 1,
1.4834, -1.337442, 2.896226, 1, 0, 0, 1, 1,
1.489113, 0.006093804, 1.728254, 0, 0, 0, 1, 1,
1.490512, -0.06032359, 1.213467, 0, 0, 0, 1, 1,
1.501874, -0.8413427, 2.348471, 0, 0, 0, 1, 1,
1.502037, 0.1370175, 2.353687, 0, 0, 0, 1, 1,
1.504123, -0.4453774, 2.080767, 0, 0, 0, 1, 1,
1.526261, -0.6980857, 2.986205, 0, 0, 0, 1, 1,
1.533368, -0.1175624, 1.797627, 0, 0, 0, 1, 1,
1.533481, -1.103215, 3.35687, 1, 1, 1, 1, 1,
1.533799, -0.6051133, 2.89937, 1, 1, 1, 1, 1,
1.540642, 0.4752141, 0.9560018, 1, 1, 1, 1, 1,
1.557029, 0.3155507, 1.578116, 1, 1, 1, 1, 1,
1.561386, -0.4095954, 2.279831, 1, 1, 1, 1, 1,
1.619771, -0.7849184, 1.470158, 1, 1, 1, 1, 1,
1.631548, -0.7633293, 2.495881, 1, 1, 1, 1, 1,
1.644956, -0.4968252, 2.027626, 1, 1, 1, 1, 1,
1.656272, -1.842849, 2.493721, 1, 1, 1, 1, 1,
1.658934, 1.953776, -0.8616114, 1, 1, 1, 1, 1,
1.670884, -0.140902, 4.485089, 1, 1, 1, 1, 1,
1.673776, 0.8666312, 1.416955, 1, 1, 1, 1, 1,
1.680006, 0.5373639, 1.03971, 1, 1, 1, 1, 1,
1.692484, 0.9844521, 0.711439, 1, 1, 1, 1, 1,
1.729956, -0.6359158, 1.846113, 1, 1, 1, 1, 1,
1.732303, -0.1399283, 1.092522, 0, 0, 1, 1, 1,
1.735466, 0.2242753, 0.5212685, 1, 0, 0, 1, 1,
1.749788, 0.1505814, 2.163049, 1, 0, 0, 1, 1,
1.756291, -1.155381, 0.197389, 1, 0, 0, 1, 1,
1.773809, 1.308303, 0.7694855, 1, 0, 0, 1, 1,
1.781188, 0.09365489, 0.8124279, 1, 0, 0, 1, 1,
1.795031, -0.03152976, 2.126201, 0, 0, 0, 1, 1,
1.795357, 0.3867241, 2.052508, 0, 0, 0, 1, 1,
1.811353, 0.4493198, -0.1782378, 0, 0, 0, 1, 1,
1.820071, -1.467485, 1.263606, 0, 0, 0, 1, 1,
1.826648, -0.6952475, 1.160609, 0, 0, 0, 1, 1,
1.829073, 0.6358845, 0.7221007, 0, 0, 0, 1, 1,
1.833179, -0.5123641, 3.941805, 0, 0, 0, 1, 1,
1.838281, 0.2141088, 3.018915, 1, 1, 1, 1, 1,
1.845702, -1.042033, 1.819082, 1, 1, 1, 1, 1,
1.865576, 0.3289664, 1.046815, 1, 1, 1, 1, 1,
1.86787, -0.6102818, 1.64455, 1, 1, 1, 1, 1,
1.872333, -0.5507322, 2.967432, 1, 1, 1, 1, 1,
1.89402, 0.8165483, 1.246544, 1, 1, 1, 1, 1,
1.900736, 0.2350101, 1.14342, 1, 1, 1, 1, 1,
1.912699, -0.9487612, 2.232638, 1, 1, 1, 1, 1,
1.917782, -0.0958919, -0.2868858, 1, 1, 1, 1, 1,
1.950697, 2.212332, 1.55092, 1, 1, 1, 1, 1,
1.956934, -0.0381689, 2.72882, 1, 1, 1, 1, 1,
1.982922, 0.1548204, 0.7750968, 1, 1, 1, 1, 1,
2.008862, 0.1551446, 0.3437499, 1, 1, 1, 1, 1,
2.027579, 1.368761, -0.06539696, 1, 1, 1, 1, 1,
2.04669, -1.128311, 1.615243, 1, 1, 1, 1, 1,
2.049963, -0.5439503, 0.612063, 0, 0, 1, 1, 1,
2.060364, -0.8433525, 3.943675, 1, 0, 0, 1, 1,
2.072113, 2.352784, 0.4417172, 1, 0, 0, 1, 1,
2.104072, 1.313648, -0.9342527, 1, 0, 0, 1, 1,
2.120955, 0.05731786, 0.7722059, 1, 0, 0, 1, 1,
2.194402, -0.1248918, 1.890328, 1, 0, 0, 1, 1,
2.205094, 0.2560908, 1.018991, 0, 0, 0, 1, 1,
2.21882, 0.8966705, 0.5705864, 0, 0, 0, 1, 1,
2.23283, -0.3815067, 2.957545, 0, 0, 0, 1, 1,
2.248134, -0.3373934, 3.240176, 0, 0, 0, 1, 1,
2.304337, -0.06292997, 0.04410535, 0, 0, 0, 1, 1,
2.311916, 0.005362455, 0.1406644, 0, 0, 0, 1, 1,
2.355006, -0.2779771, 1.309098, 0, 0, 0, 1, 1,
2.364591, -0.07373003, 1.78892, 1, 1, 1, 1, 1,
2.398177, -1.12414, 1.063382, 1, 1, 1, 1, 1,
2.420297, 0.0147342, 1.450306, 1, 1, 1, 1, 1,
2.437234, -1.044293, 0.8944234, 1, 1, 1, 1, 1,
2.884357, 0.1186048, 1.268047, 1, 1, 1, 1, 1,
2.962136, 0.8372348, 0.2598272, 1, 1, 1, 1, 1,
3.415593, -0.4581234, 3.941117, 1, 1, 1, 1, 1
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
var radius = 9.252833;
var distance = 32.50019;
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
mvMatrix.translate( -0.1301348, 0.1493347, 0.00071311 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.50019);
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
