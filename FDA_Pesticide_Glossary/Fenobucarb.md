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
-3.651465, -0.04851743, -0.9578313, 1, 0, 0, 1,
-3.323361, -0.7421023, -2.664863, 1, 0.007843138, 0, 1,
-2.902768, 0.6714785, 0.7925675, 1, 0.01176471, 0, 1,
-2.562574, -0.007371571, -0.8825039, 1, 0.01960784, 0, 1,
-2.449345, 1.204212, -1.715951, 1, 0.02352941, 0, 1,
-2.404987, 0.8373492, -1.326214, 1, 0.03137255, 0, 1,
-2.297941, 0.7232181, -0.4216711, 1, 0.03529412, 0, 1,
-2.285783, 0.5577793, -1.789269, 1, 0.04313726, 0, 1,
-2.249306, 0.1235091, -0.7243399, 1, 0.04705882, 0, 1,
-2.16267, 1.066589, -1.618656, 1, 0.05490196, 0, 1,
-2.155154, 0.289, -2.687294, 1, 0.05882353, 0, 1,
-2.13401, 0.2812969, -2.836044, 1, 0.06666667, 0, 1,
-2.130744, 0.3983496, -2.386024, 1, 0.07058824, 0, 1,
-2.103676, 1.359226, 1.39634, 1, 0.07843138, 0, 1,
-2.06536, 0.9746397, -1.791854, 1, 0.08235294, 0, 1,
-2.044476, -0.9521616, -1.488849, 1, 0.09019608, 0, 1,
-2.0079, -1.99075, -3.367879, 1, 0.09411765, 0, 1,
-2.006428, 1.442424, -1.320811, 1, 0.1019608, 0, 1,
-1.997673, -0.1608119, -1.076651, 1, 0.1098039, 0, 1,
-1.995777, -1.415847, -3.834591, 1, 0.1137255, 0, 1,
-1.988687, -2.506051, -4.24084, 1, 0.1215686, 0, 1,
-1.979887, 0.3305287, -3.869551, 1, 0.1254902, 0, 1,
-1.957543, -0.4938835, -1.889635, 1, 0.1333333, 0, 1,
-1.955134, 0.07647379, 0.4111831, 1, 0.1372549, 0, 1,
-1.936327, 1.206269, -1.368112, 1, 0.145098, 0, 1,
-1.933116, 0.1566221, -1.414471, 1, 0.1490196, 0, 1,
-1.892096, -1.085972, -1.451681, 1, 0.1568628, 0, 1,
-1.866505, 1.522427, 0.7065665, 1, 0.1607843, 0, 1,
-1.866377, 0.9407488, 1.09397, 1, 0.1686275, 0, 1,
-1.861152, 1.054959, -0.3037802, 1, 0.172549, 0, 1,
-1.789942, -2.401249, -1.194774, 1, 0.1803922, 0, 1,
-1.773486, -2.36038, -0.08137622, 1, 0.1843137, 0, 1,
-1.767551, -0.4688807, -2.097522, 1, 0.1921569, 0, 1,
-1.752179, -0.9592046, -1.195314, 1, 0.1960784, 0, 1,
-1.743198, -0.8333191, -1.607823, 1, 0.2039216, 0, 1,
-1.727168, -1.185779, -1.986783, 1, 0.2117647, 0, 1,
-1.707242, 0.7582178, 0.0542725, 1, 0.2156863, 0, 1,
-1.700148, -1.219506, -3.742866, 1, 0.2235294, 0, 1,
-1.682806, -0.7806416, -2.48273, 1, 0.227451, 0, 1,
-1.666806, -0.07372911, -2.112607, 1, 0.2352941, 0, 1,
-1.650661, 1.387538, -3.074423, 1, 0.2392157, 0, 1,
-1.622599, 0.2239034, -0.7453648, 1, 0.2470588, 0, 1,
-1.621225, 1.214446, -2.183086, 1, 0.2509804, 0, 1,
-1.613729, 1.103953, -1.016843, 1, 0.2588235, 0, 1,
-1.610297, -1.462836, -2.84906, 1, 0.2627451, 0, 1,
-1.595351, -0.5550266, -2.592555, 1, 0.2705882, 0, 1,
-1.591233, 0.03196479, -1.973035, 1, 0.2745098, 0, 1,
-1.586843, -1.914974, -1.617636, 1, 0.282353, 0, 1,
-1.559771, -0.6015307, -1.554724, 1, 0.2862745, 0, 1,
-1.551237, 0.3681332, -2.026031, 1, 0.2941177, 0, 1,
-1.528461, 1.561452, -1.835653, 1, 0.3019608, 0, 1,
-1.522406, 0.2099567, -0.2892748, 1, 0.3058824, 0, 1,
-1.521448, -0.3962623, -3.01616, 1, 0.3137255, 0, 1,
-1.519405, -0.4548127, -2.176809, 1, 0.3176471, 0, 1,
-1.517134, 1.127646, -1.996421, 1, 0.3254902, 0, 1,
-1.509704, 1.740297, 0.150816, 1, 0.3294118, 0, 1,
-1.508384, 0.1575757, -0.1706894, 1, 0.3372549, 0, 1,
-1.508278, -0.2410666, -1.769322, 1, 0.3411765, 0, 1,
-1.49411, 0.5802081, -0.8073266, 1, 0.3490196, 0, 1,
-1.493458, 0.3802915, -2.787788, 1, 0.3529412, 0, 1,
-1.488098, -1.289464, -2.375714, 1, 0.3607843, 0, 1,
-1.487827, -0.3727067, -2.414521, 1, 0.3647059, 0, 1,
-1.479371, 0.9302469, -2.388635, 1, 0.372549, 0, 1,
-1.478765, -1.039814, -2.410568, 1, 0.3764706, 0, 1,
-1.475918, -1.155781, -2.384118, 1, 0.3843137, 0, 1,
-1.445234, 0.354117, 0.05004988, 1, 0.3882353, 0, 1,
-1.444632, 0.8192146, 0.7798527, 1, 0.3960784, 0, 1,
-1.441011, -0.4904156, -1.950971, 1, 0.4039216, 0, 1,
-1.432112, -1.337658, -2.471792, 1, 0.4078431, 0, 1,
-1.430929, -0.6053041, -0.848313, 1, 0.4156863, 0, 1,
-1.42909, -1.435576, -2.010394, 1, 0.4196078, 0, 1,
-1.416177, 0.09809981, -1.157227, 1, 0.427451, 0, 1,
-1.413728, -1.745242, -1.427722, 1, 0.4313726, 0, 1,
-1.4126, 2.37917, 0.2263582, 1, 0.4392157, 0, 1,
-1.41086, -0.6524269, -1.870276, 1, 0.4431373, 0, 1,
-1.409276, -0.05291283, -1.390334, 1, 0.4509804, 0, 1,
-1.390159, 1.324687, -1.548851, 1, 0.454902, 0, 1,
-1.38741, -1.77717, -0.6039409, 1, 0.4627451, 0, 1,
-1.384278, 0.8147419, 0.7060167, 1, 0.4666667, 0, 1,
-1.381611, 0.3192553, -0.7839354, 1, 0.4745098, 0, 1,
-1.372233, 0.8179052, 0.08041152, 1, 0.4784314, 0, 1,
-1.370398, 0.9649907, -1.140113, 1, 0.4862745, 0, 1,
-1.370394, 1.174203, 1.304834, 1, 0.4901961, 0, 1,
-1.367217, -1.129409, -1.892446, 1, 0.4980392, 0, 1,
-1.365119, -0.4246826, -1.538359, 1, 0.5058824, 0, 1,
-1.360137, 0.4447829, -1.02037, 1, 0.509804, 0, 1,
-1.351045, 0.9233732, -1.648811, 1, 0.5176471, 0, 1,
-1.343009, -0.6741292, -2.076651, 1, 0.5215687, 0, 1,
-1.339409, -0.5565569, -2.952677, 1, 0.5294118, 0, 1,
-1.336175, -0.7071986, -4.526104, 1, 0.5333334, 0, 1,
-1.336076, -0.1614874, -1.597579, 1, 0.5411765, 0, 1,
-1.334761, 1.47774, -2.283723, 1, 0.5450981, 0, 1,
-1.333648, 0.498838, -0.5269504, 1, 0.5529412, 0, 1,
-1.328664, -0.9829079, -3.065031, 1, 0.5568628, 0, 1,
-1.326962, -0.7283635, -1.792294, 1, 0.5647059, 0, 1,
-1.32615, -2.188805, -2.00192, 1, 0.5686275, 0, 1,
-1.32451, 0.8791378, -2.161407, 1, 0.5764706, 0, 1,
-1.31631, -0.1364375, -3.309684, 1, 0.5803922, 0, 1,
-1.315093, 0.8919134, -0.7927869, 1, 0.5882353, 0, 1,
-1.312969, -1.293264, -1.591483, 1, 0.5921569, 0, 1,
-1.312715, -0.809976, -1.109132, 1, 0.6, 0, 1,
-1.312003, 0.6564421, -1.926379, 1, 0.6078432, 0, 1,
-1.311749, -0.4946719, -2.01102, 1, 0.6117647, 0, 1,
-1.307084, 0.03555887, -2.793901, 1, 0.6196079, 0, 1,
-1.303173, 1.119854, -2.468462, 1, 0.6235294, 0, 1,
-1.297972, -2.280281, -2.305983, 1, 0.6313726, 0, 1,
-1.285986, -0.239754, -2.032599, 1, 0.6352941, 0, 1,
-1.26708, 0.3836944, -1.518453, 1, 0.6431373, 0, 1,
-1.24901, -0.04950636, -3.064272, 1, 0.6470588, 0, 1,
-1.244575, 0.7146623, 0.1018219, 1, 0.654902, 0, 1,
-1.243746, 1.207209, -0.07835966, 1, 0.6588235, 0, 1,
-1.239413, -0.3731934, -0.7719403, 1, 0.6666667, 0, 1,
-1.234865, 0.5592954, 0.8512713, 1, 0.6705883, 0, 1,
-1.233682, -0.9431688, -3.822527, 1, 0.6784314, 0, 1,
-1.217827, 0.2386469, -0.02450569, 1, 0.682353, 0, 1,
-1.214684, 0.2936793, -1.195893, 1, 0.6901961, 0, 1,
-1.214504, -1.801625, -2.348523, 1, 0.6941177, 0, 1,
-1.212939, 1.441487, 0.3186964, 1, 0.7019608, 0, 1,
-1.210774, -0.1768936, -2.240182, 1, 0.7098039, 0, 1,
-1.202736, -0.3266775, -1.125519, 1, 0.7137255, 0, 1,
-1.191763, 0.2233045, -1.915856, 1, 0.7215686, 0, 1,
-1.191478, 0.69816, 1.359796, 1, 0.7254902, 0, 1,
-1.176753, 0.6611439, -0.2163688, 1, 0.7333333, 0, 1,
-1.170349, -1.334276, -2.272262, 1, 0.7372549, 0, 1,
-1.164395, 1.166671, -0.7635469, 1, 0.7450981, 0, 1,
-1.161738, -0.007172851, -1.413927, 1, 0.7490196, 0, 1,
-1.160788, -0.2591234, -0.2867969, 1, 0.7568628, 0, 1,
-1.160234, -0.4236607, -2.418604, 1, 0.7607843, 0, 1,
-1.152681, -0.5519612, -1.685662, 1, 0.7686275, 0, 1,
-1.148431, 0.8908331, -0.7573911, 1, 0.772549, 0, 1,
-1.141399, 0.01051962, -2.664036, 1, 0.7803922, 0, 1,
-1.14139, 0.6869856, -0.201371, 1, 0.7843137, 0, 1,
-1.140409, 0.5644251, -0.3027462, 1, 0.7921569, 0, 1,
-1.139872, -0.1667409, -1.998062, 1, 0.7960784, 0, 1,
-1.139136, 0.6942746, -2.550882, 1, 0.8039216, 0, 1,
-1.130677, 0.5192582, -0.3142573, 1, 0.8117647, 0, 1,
-1.129447, -1.206205, -1.134293, 1, 0.8156863, 0, 1,
-1.122095, -0.2471905, -1.626189, 1, 0.8235294, 0, 1,
-1.120534, 1.522812, -1.681714, 1, 0.827451, 0, 1,
-1.117048, 0.4812236, -1.188888, 1, 0.8352941, 0, 1,
-1.113649, -0.5894943, -1.833883, 1, 0.8392157, 0, 1,
-1.108709, -1.561976, -1.46031, 1, 0.8470588, 0, 1,
-1.108276, -0.6450913, 0.2151662, 1, 0.8509804, 0, 1,
-1.101358, -1.194016, -2.689476, 1, 0.8588235, 0, 1,
-1.091651, -1.695903, -1.720513, 1, 0.8627451, 0, 1,
-1.083354, 1.238725, -0.3894489, 1, 0.8705882, 0, 1,
-1.075709, 0.9259573, -0.7424616, 1, 0.8745098, 0, 1,
-1.069618, 1.591655, -0.1846929, 1, 0.8823529, 0, 1,
-1.063146, -0.6133054, -1.687406, 1, 0.8862745, 0, 1,
-1.04478, -0.7200115, -1.488024, 1, 0.8941177, 0, 1,
-1.043446, 0.2428374, -2.072929, 1, 0.8980392, 0, 1,
-1.03715, -1.745141, -2.45404, 1, 0.9058824, 0, 1,
-1.028667, -2.100105, -3.128377, 1, 0.9137255, 0, 1,
-1.025935, -0.4100684, -3.509098, 1, 0.9176471, 0, 1,
-1.022812, 1.486291, -1.27608, 1, 0.9254902, 0, 1,
-1.018431, 0.3637496, -0.3368037, 1, 0.9294118, 0, 1,
-1.015686, -0.5157543, -1.631457, 1, 0.9372549, 0, 1,
-1.001848, -1.467743, -1.18697, 1, 0.9411765, 0, 1,
-0.9982924, -0.2989274, -3.347675, 1, 0.9490196, 0, 1,
-0.9954872, -0.1526298, -1.497673, 1, 0.9529412, 0, 1,
-0.9845382, -0.2541968, 0.26589, 1, 0.9607843, 0, 1,
-0.9837752, 0.2808361, -1.597023, 1, 0.9647059, 0, 1,
-0.9740896, -0.1892398, -1.785075, 1, 0.972549, 0, 1,
-0.970429, -0.5341737, -0.8717872, 1, 0.9764706, 0, 1,
-0.9660791, -0.03292835, -1.869585, 1, 0.9843137, 0, 1,
-0.9612879, -2.613068, -2.02821, 1, 0.9882353, 0, 1,
-0.9608476, 1.126274, -0.7826532, 1, 0.9960784, 0, 1,
-0.9568164, 1.064878, -0.8386, 0.9960784, 1, 0, 1,
-0.953226, -0.7603038, -3.248792, 0.9921569, 1, 0, 1,
-0.9514572, 1.684696, -0.3939874, 0.9843137, 1, 0, 1,
-0.9512358, -0.5102147, -3.005411, 0.9803922, 1, 0, 1,
-0.9496052, -0.53271, -1.887858, 0.972549, 1, 0, 1,
-0.9470988, -0.1861944, -2.602006, 0.9686275, 1, 0, 1,
-0.9450793, -0.1563352, -3.623713, 0.9607843, 1, 0, 1,
-0.9434682, 0.1307825, -1.328011, 0.9568627, 1, 0, 1,
-0.943163, 0.03095125, -0.7018875, 0.9490196, 1, 0, 1,
-0.9413044, 0.7882944, -0.9731461, 0.945098, 1, 0, 1,
-0.9376872, -1.843603, -2.208578, 0.9372549, 1, 0, 1,
-0.9364666, 1.36944, -0.9845452, 0.9333333, 1, 0, 1,
-0.9313239, -0.01190154, -1.789919, 0.9254902, 1, 0, 1,
-0.9218211, 2.115226, -0.4210193, 0.9215686, 1, 0, 1,
-0.9212183, 0.2814795, -1.410626, 0.9137255, 1, 0, 1,
-0.9087068, 0.06315441, -1.126792, 0.9098039, 1, 0, 1,
-0.9055065, 1.862042, -0.4484286, 0.9019608, 1, 0, 1,
-0.9047365, 2.02617, -0.8236836, 0.8941177, 1, 0, 1,
-0.9032765, 1.759858, 0.4695542, 0.8901961, 1, 0, 1,
-0.8941426, 0.4630852, -1.668572, 0.8823529, 1, 0, 1,
-0.892154, -0.07118163, -1.484979, 0.8784314, 1, 0, 1,
-0.8913577, -0.6618994, -1.881915, 0.8705882, 1, 0, 1,
-0.8806323, -1.557744, -2.244947, 0.8666667, 1, 0, 1,
-0.8801606, 2.107909, -1.400369, 0.8588235, 1, 0, 1,
-0.8742682, 0.09602017, -4.119901, 0.854902, 1, 0, 1,
-0.8710647, 0.1371619, -2.702694, 0.8470588, 1, 0, 1,
-0.8658669, -0.9162318, -2.126492, 0.8431373, 1, 0, 1,
-0.8636142, -0.2073525, -2.217787, 0.8352941, 1, 0, 1,
-0.8630624, -0.6396725, -2.654557, 0.8313726, 1, 0, 1,
-0.8569071, -0.7317773, -3.135645, 0.8235294, 1, 0, 1,
-0.8562267, -1.663456, -3.331191, 0.8196079, 1, 0, 1,
-0.8479117, -1.697078, -3.520487, 0.8117647, 1, 0, 1,
-0.8471233, 0.01326824, -1.334196, 0.8078431, 1, 0, 1,
-0.8442719, -1.517097, -3.131456, 0.8, 1, 0, 1,
-0.8364763, 1.77144, -0.6986695, 0.7921569, 1, 0, 1,
-0.8312875, -0.5775251, -2.333647, 0.7882353, 1, 0, 1,
-0.8307816, 1.188089, -0.3296829, 0.7803922, 1, 0, 1,
-0.8301103, 0.6139835, 0.6253047, 0.7764706, 1, 0, 1,
-0.8296573, 0.4959986, -2.050482, 0.7686275, 1, 0, 1,
-0.8263505, -0.9080721, -3.450429, 0.7647059, 1, 0, 1,
-0.8239859, -0.7552705, -2.082807, 0.7568628, 1, 0, 1,
-0.8179703, 0.71891, -1.130462, 0.7529412, 1, 0, 1,
-0.8133174, -0.8544762, -2.600739, 0.7450981, 1, 0, 1,
-0.8042937, 1.207563, -1.631372, 0.7411765, 1, 0, 1,
-0.8005233, 0.05757724, -0.8478115, 0.7333333, 1, 0, 1,
-0.7990602, -1.35572, -2.610646, 0.7294118, 1, 0, 1,
-0.7929038, -0.2591924, -2.086514, 0.7215686, 1, 0, 1,
-0.7918022, 0.9190596, -0.6296723, 0.7176471, 1, 0, 1,
-0.7888229, 0.7197406, -0.3164932, 0.7098039, 1, 0, 1,
-0.7848245, -1.050939, -1.987516, 0.7058824, 1, 0, 1,
-0.783208, 0.3263133, -1.857853, 0.6980392, 1, 0, 1,
-0.7803443, -0.001593034, -1.032368, 0.6901961, 1, 0, 1,
-0.7796676, 0.5629753, -0.00795494, 0.6862745, 1, 0, 1,
-0.7687511, 0.2062109, -0.7958577, 0.6784314, 1, 0, 1,
-0.7679718, 0.7897472, -0.1381852, 0.6745098, 1, 0, 1,
-0.7591774, -2.140506, -4.106338, 0.6666667, 1, 0, 1,
-0.7534917, 0.7095187, -1.455824, 0.6627451, 1, 0, 1,
-0.7492964, -0.9660202, -3.707714, 0.654902, 1, 0, 1,
-0.7491758, 0.5518985, -1.406976, 0.6509804, 1, 0, 1,
-0.7487734, -0.3950512, -2.122086, 0.6431373, 1, 0, 1,
-0.7438361, -0.3315697, -2.378015, 0.6392157, 1, 0, 1,
-0.7408231, 0.6969713, -0.08965731, 0.6313726, 1, 0, 1,
-0.7374553, -0.7838691, -3.020751, 0.627451, 1, 0, 1,
-0.7371239, -0.3784392, -2.667226, 0.6196079, 1, 0, 1,
-0.7299839, -0.326057, -0.4584, 0.6156863, 1, 0, 1,
-0.7245337, -1.913718, -2.064114, 0.6078432, 1, 0, 1,
-0.718127, -0.4766338, -1.871741, 0.6039216, 1, 0, 1,
-0.7144972, -1.280082, -0.7702379, 0.5960785, 1, 0, 1,
-0.7087945, 0.9150613, -2.05194, 0.5882353, 1, 0, 1,
-0.707149, 2.14699, -0.4070245, 0.5843138, 1, 0, 1,
-0.7061214, 0.06964674, -0.3647591, 0.5764706, 1, 0, 1,
-0.7024995, -0.1933448, -1.298766, 0.572549, 1, 0, 1,
-0.6990594, 0.4799986, -0.7122095, 0.5647059, 1, 0, 1,
-0.6976722, -0.246203, -1.967708, 0.5607843, 1, 0, 1,
-0.6960198, -0.2164556, -3.0324, 0.5529412, 1, 0, 1,
-0.694524, -0.4125073, -2.430907, 0.5490196, 1, 0, 1,
-0.6920372, -2.29164, -1.828364, 0.5411765, 1, 0, 1,
-0.6903628, 0.1077462, -1.311223, 0.5372549, 1, 0, 1,
-0.689926, -0.2624519, -2.933836, 0.5294118, 1, 0, 1,
-0.6896369, -1.68225, -3.81102, 0.5254902, 1, 0, 1,
-0.6854602, -1.492413, -2.383373, 0.5176471, 1, 0, 1,
-0.6827376, -0.6666315, -3.640313, 0.5137255, 1, 0, 1,
-0.6826736, 0.8462454, 0.06455152, 0.5058824, 1, 0, 1,
-0.6787015, 0.3877442, -0.2483271, 0.5019608, 1, 0, 1,
-0.677574, 0.6170478, -0.8419355, 0.4941176, 1, 0, 1,
-0.6763005, 1.688541, 0.412644, 0.4862745, 1, 0, 1,
-0.6705521, 2.099481, -0.8514243, 0.4823529, 1, 0, 1,
-0.6642424, -0.5179162, -2.12294, 0.4745098, 1, 0, 1,
-0.6573709, 0.1895317, -1.443252, 0.4705882, 1, 0, 1,
-0.6562148, 0.4900067, 0.07650414, 0.4627451, 1, 0, 1,
-0.6554064, 0.1326066, -0.565074, 0.4588235, 1, 0, 1,
-0.6472664, 0.9988738, -0.1549354, 0.4509804, 1, 0, 1,
-0.6458188, 0.8088721, -2.324402, 0.4470588, 1, 0, 1,
-0.6454278, -0.1315563, -0.538574, 0.4392157, 1, 0, 1,
-0.6449682, -1.506123, -2.875774, 0.4352941, 1, 0, 1,
-0.6427346, -0.2399515, -2.803136, 0.427451, 1, 0, 1,
-0.6426751, -1.366226, -2.055232, 0.4235294, 1, 0, 1,
-0.6392127, 2.034978, 0.3635681, 0.4156863, 1, 0, 1,
-0.6329445, -0.3399334, -2.061435, 0.4117647, 1, 0, 1,
-0.6287919, 0.4880314, -0.3083822, 0.4039216, 1, 0, 1,
-0.6260853, 1.575585, -1.725604, 0.3960784, 1, 0, 1,
-0.6257064, 0.2659048, -3.100105, 0.3921569, 1, 0, 1,
-0.6255108, -0.1067564, -2.018808, 0.3843137, 1, 0, 1,
-0.622766, -1.758705, -0.5893871, 0.3803922, 1, 0, 1,
-0.6226919, 1.76126, -0.6382054, 0.372549, 1, 0, 1,
-0.6181399, 0.6598697, -0.6548704, 0.3686275, 1, 0, 1,
-0.6173453, 1.981424, -0.3677022, 0.3607843, 1, 0, 1,
-0.6099705, 0.9186819, 0.02775767, 0.3568628, 1, 0, 1,
-0.6088302, 0.9414145, -1.340703, 0.3490196, 1, 0, 1,
-0.6077069, 1.111642, -0.5333481, 0.345098, 1, 0, 1,
-0.6034473, 0.3081102, -1.989686, 0.3372549, 1, 0, 1,
-0.6012689, -0.9816644, -2.083535, 0.3333333, 1, 0, 1,
-0.5943639, 0.506911, -2.698898, 0.3254902, 1, 0, 1,
-0.5926006, -0.4958331, -3.565572, 0.3215686, 1, 0, 1,
-0.5917224, -0.46391, -2.659951, 0.3137255, 1, 0, 1,
-0.5903266, -0.2705198, -1.253915, 0.3098039, 1, 0, 1,
-0.5869501, -0.1867088, -2.598109, 0.3019608, 1, 0, 1,
-0.580606, 0.2640263, -0.9115247, 0.2941177, 1, 0, 1,
-0.579895, -1.370348, -2.415253, 0.2901961, 1, 0, 1,
-0.5755066, -0.3700889, -2.985959, 0.282353, 1, 0, 1,
-0.5752932, 0.2848855, -0.2024922, 0.2784314, 1, 0, 1,
-0.5705441, 0.2732724, -1.167901, 0.2705882, 1, 0, 1,
-0.5591228, 1.51229, -1.891234, 0.2666667, 1, 0, 1,
-0.5565504, 0.02917171, -0.2672714, 0.2588235, 1, 0, 1,
-0.5545204, 1.454265, 0.4034247, 0.254902, 1, 0, 1,
-0.5482354, 2.024208, -1.238773, 0.2470588, 1, 0, 1,
-0.5480294, 0.2082994, -2.83112, 0.2431373, 1, 0, 1,
-0.5466557, 0.7088058, -1.134762, 0.2352941, 1, 0, 1,
-0.5386143, -1.116256, -1.86127, 0.2313726, 1, 0, 1,
-0.5384904, -0.9344114, -2.563157, 0.2235294, 1, 0, 1,
-0.530193, -0.9146903, -1.280156, 0.2196078, 1, 0, 1,
-0.5300688, -1.7067, -3.846772, 0.2117647, 1, 0, 1,
-0.5264325, -0.3493091, -1.604777, 0.2078431, 1, 0, 1,
-0.5241242, 0.5401638, -0.03384661, 0.2, 1, 0, 1,
-0.5222612, -0.6030177, -1.982895, 0.1921569, 1, 0, 1,
-0.517045, -0.5646318, -3.576435, 0.1882353, 1, 0, 1,
-0.5131505, -1.69926, -3.941477, 0.1803922, 1, 0, 1,
-0.5024882, -0.5270475, -2.62917, 0.1764706, 1, 0, 1,
-0.5010588, 0.568643, 0.2531618, 0.1686275, 1, 0, 1,
-0.4995575, 0.618923, -1.175457, 0.1647059, 1, 0, 1,
-0.4969189, 0.6497246, -2.021288, 0.1568628, 1, 0, 1,
-0.4951709, -0.0683649, 0.3468162, 0.1529412, 1, 0, 1,
-0.4943557, -0.4975369, -2.691402, 0.145098, 1, 0, 1,
-0.4942131, -0.9039169, -1.511769, 0.1411765, 1, 0, 1,
-0.4941674, 0.7723515, 0.4290225, 0.1333333, 1, 0, 1,
-0.4923135, 0.250858, 0.8078425, 0.1294118, 1, 0, 1,
-0.490475, 1.113411, -0.7126846, 0.1215686, 1, 0, 1,
-0.4901572, 0.8584332, -0.4020817, 0.1176471, 1, 0, 1,
-0.489069, -0.1627955, -2.046884, 0.1098039, 1, 0, 1,
-0.4866917, -0.7439303, -3.35875, 0.1058824, 1, 0, 1,
-0.4855899, 0.834518, 0.5154155, 0.09803922, 1, 0, 1,
-0.48429, -0.2976391, -1.758525, 0.09019608, 1, 0, 1,
-0.4835244, 0.9443956, -1.320221, 0.08627451, 1, 0, 1,
-0.476906, -0.6542526, -2.38289, 0.07843138, 1, 0, 1,
-0.4767517, 0.7047197, 0.9116223, 0.07450981, 1, 0, 1,
-0.4759847, -1.172407, -2.781694, 0.06666667, 1, 0, 1,
-0.4705135, -0.8506222, -3.429985, 0.0627451, 1, 0, 1,
-0.4703634, 1.169551, 0.6112376, 0.05490196, 1, 0, 1,
-0.4665969, -1.648198, -4.483952, 0.05098039, 1, 0, 1,
-0.4652645, -0.5003498, -4.023568, 0.04313726, 1, 0, 1,
-0.4533059, 0.7893857, -0.7454308, 0.03921569, 1, 0, 1,
-0.4465898, -0.9969515, -2.424306, 0.03137255, 1, 0, 1,
-0.444979, 1.621869, 0.06594805, 0.02745098, 1, 0, 1,
-0.4427679, 0.2138817, -1.236631, 0.01960784, 1, 0, 1,
-0.4372071, -0.5742135, -2.933804, 0.01568628, 1, 0, 1,
-0.4370427, -0.1024605, -1.325633, 0.007843138, 1, 0, 1,
-0.4363487, -1.095479, -3.395088, 0.003921569, 1, 0, 1,
-0.4350948, -0.04310045, -1.099137, 0, 1, 0.003921569, 1,
-0.4329058, 2.097197, 1.20152, 0, 1, 0.01176471, 1,
-0.4318342, -0.9118531, -3.807732, 0, 1, 0.01568628, 1,
-0.4310266, 0.06868671, -1.63718, 0, 1, 0.02352941, 1,
-0.4270706, -0.01258404, -2.449857, 0, 1, 0.02745098, 1,
-0.423748, 0.7156025, -0.7632416, 0, 1, 0.03529412, 1,
-0.4205248, 0.3827513, -1.336379, 0, 1, 0.03921569, 1,
-0.4196585, 1.513574, 0.05762482, 0, 1, 0.04705882, 1,
-0.4169247, -0.1438263, -1.82695, 0, 1, 0.05098039, 1,
-0.4111396, 1.024911, -0.7232394, 0, 1, 0.05882353, 1,
-0.4098077, 0.9634704, -1.229711, 0, 1, 0.0627451, 1,
-0.4095923, -0.6615283, -2.639295, 0, 1, 0.07058824, 1,
-0.4087695, -0.05572183, -5.108469, 0, 1, 0.07450981, 1,
-0.4042928, 0.7921396, 0.8375197, 0, 1, 0.08235294, 1,
-0.3997335, -0.8576002, -1.023193, 0, 1, 0.08627451, 1,
-0.3971119, 0.02880544, -1.014649, 0, 1, 0.09411765, 1,
-0.3953567, -0.3745997, -2.726913, 0, 1, 0.1019608, 1,
-0.3947787, 0.5521762, -1.595515, 0, 1, 0.1058824, 1,
-0.3940599, 0.8992863, -0.4642562, 0, 1, 0.1137255, 1,
-0.3909362, 1.119476, -0.4798904, 0, 1, 0.1176471, 1,
-0.3909324, 0.4947865, 1.167777, 0, 1, 0.1254902, 1,
-0.3889513, 0.636967, -0.6951091, 0, 1, 0.1294118, 1,
-0.3808555, -0.5412816, -2.092106, 0, 1, 0.1372549, 1,
-0.3785238, -0.7864299, -3.687917, 0, 1, 0.1411765, 1,
-0.376416, 1.093565, -1.257982, 0, 1, 0.1490196, 1,
-0.3739218, 0.7350397, -0.8922856, 0, 1, 0.1529412, 1,
-0.3687097, 0.4888908, -0.6718325, 0, 1, 0.1607843, 1,
-0.358811, -0.5184776, -2.353199, 0, 1, 0.1647059, 1,
-0.3570479, -0.432599, -0.8716707, 0, 1, 0.172549, 1,
-0.3563142, -1.208566, -3.54256, 0, 1, 0.1764706, 1,
-0.3546554, -0.013056, -1.996203, 0, 1, 0.1843137, 1,
-0.3532354, 2.091918, -0.07780178, 0, 1, 0.1882353, 1,
-0.3443982, 1.228579, -1.402783, 0, 1, 0.1960784, 1,
-0.3440286, -0.9248569, -2.941853, 0, 1, 0.2039216, 1,
-0.3432092, -0.5753374, -2.350742, 0, 1, 0.2078431, 1,
-0.3417779, 0.2760359, -2.505573, 0, 1, 0.2156863, 1,
-0.3407768, -0.05032252, -2.112525, 0, 1, 0.2196078, 1,
-0.3381694, -0.01768085, -1.952407, 0, 1, 0.227451, 1,
-0.3355407, 1.037873, -1.208637, 0, 1, 0.2313726, 1,
-0.3288946, -0.7218094, -4.376425, 0, 1, 0.2392157, 1,
-0.3253319, 1.275082, 0.630141, 0, 1, 0.2431373, 1,
-0.3220064, 0.5004292, 1.110513, 0, 1, 0.2509804, 1,
-0.316615, -0.1958503, 0.9984623, 0, 1, 0.254902, 1,
-0.3150552, 0.8336627, 0.9189045, 0, 1, 0.2627451, 1,
-0.3095485, -0.9645123, -3.371997, 0, 1, 0.2666667, 1,
-0.3063522, 0.6934624, 0.638526, 0, 1, 0.2745098, 1,
-0.3052138, -1.130675, -3.08716, 0, 1, 0.2784314, 1,
-0.3032321, 1.222442, -0.9342614, 0, 1, 0.2862745, 1,
-0.3022272, -1.239665, -3.455059, 0, 1, 0.2901961, 1,
-0.2972529, 1.492591, -0.2699252, 0, 1, 0.2980392, 1,
-0.2965151, -0.2572589, -1.734665, 0, 1, 0.3058824, 1,
-0.290852, -1.831215, -2.35213, 0, 1, 0.3098039, 1,
-0.2845681, -1.142064, -1.708136, 0, 1, 0.3176471, 1,
-0.2748776, -1.486217, -2.331766, 0, 1, 0.3215686, 1,
-0.2706165, 0.9427668, -1.918347, 0, 1, 0.3294118, 1,
-0.2647003, -0.3859963, -2.033395, 0, 1, 0.3333333, 1,
-0.2638153, 0.1674502, -2.584852, 0, 1, 0.3411765, 1,
-0.2614272, 0.5755611, -1.783397, 0, 1, 0.345098, 1,
-0.2610914, 0.4084346, 0.912038, 0, 1, 0.3529412, 1,
-0.2586186, 0.04482312, -2.362472, 0, 1, 0.3568628, 1,
-0.2550065, 0.2140379, -0.7413143, 0, 1, 0.3647059, 1,
-0.252213, 1.462982, 0.3015202, 0, 1, 0.3686275, 1,
-0.2491543, 0.2797912, 0.9300432, 0, 1, 0.3764706, 1,
-0.2433481, -0.8018535, -3.343087, 0, 1, 0.3803922, 1,
-0.2423203, -0.3851687, -3.385748, 0, 1, 0.3882353, 1,
-0.2417198, -0.6690629, -1.824893, 0, 1, 0.3921569, 1,
-0.2342623, -0.4262067, -0.6308262, 0, 1, 0.4, 1,
-0.2289214, -0.1154424, -1.534758, 0, 1, 0.4078431, 1,
-0.2220778, 1.17618, -0.4867795, 0, 1, 0.4117647, 1,
-0.2216555, 0.9887058, -0.426131, 0, 1, 0.4196078, 1,
-0.2190644, 0.5741475, -0.7327079, 0, 1, 0.4235294, 1,
-0.2135509, 0.722742, -1.877843, 0, 1, 0.4313726, 1,
-0.2062958, 1.30995, -3.038449, 0, 1, 0.4352941, 1,
-0.2054389, 0.7669238, -1.560758, 0, 1, 0.4431373, 1,
-0.2023804, 0.08459013, -3.84069, 0, 1, 0.4470588, 1,
-0.1996171, -0.02306163, -1.9049, 0, 1, 0.454902, 1,
-0.1981427, -1.486911, -3.129426, 0, 1, 0.4588235, 1,
-0.1976625, 2.17406, 0.6205632, 0, 1, 0.4666667, 1,
-0.1973691, 0.399369, -0.3910254, 0, 1, 0.4705882, 1,
-0.196738, 1.369105, -0.07853641, 0, 1, 0.4784314, 1,
-0.1930431, 1.188458, 0.4395636, 0, 1, 0.4823529, 1,
-0.1913402, 1.253434, 0.05111266, 0, 1, 0.4901961, 1,
-0.1872222, -0.5628874, -1.3848, 0, 1, 0.4941176, 1,
-0.1835218, -1.327131, -4.26264, 0, 1, 0.5019608, 1,
-0.1820218, 0.4168556, -0.441071, 0, 1, 0.509804, 1,
-0.1753026, -0.2440854, -2.399917, 0, 1, 0.5137255, 1,
-0.1741359, -0.3452626, -0.6103989, 0, 1, 0.5215687, 1,
-0.1692454, 1.985462, 1.187231, 0, 1, 0.5254902, 1,
-0.1684811, -0.9076367, -3.547347, 0, 1, 0.5333334, 1,
-0.1683587, 0.7088969, -0.007068776, 0, 1, 0.5372549, 1,
-0.1652214, -0.3919047, -2.292042, 0, 1, 0.5450981, 1,
-0.1612368, 0.1894799, 0.2949685, 0, 1, 0.5490196, 1,
-0.1555708, -2.475345, -1.828906, 0, 1, 0.5568628, 1,
-0.1521725, 1.443042, 0.8539274, 0, 1, 0.5607843, 1,
-0.1507194, 1.281746, -0.4003636, 0, 1, 0.5686275, 1,
-0.1503943, 0.1699607, -0.822804, 0, 1, 0.572549, 1,
-0.1491202, -1.080114, -3.020337, 0, 1, 0.5803922, 1,
-0.1440876, -0.9646856, -4.023371, 0, 1, 0.5843138, 1,
-0.142563, -0.3531927, -2.038598, 0, 1, 0.5921569, 1,
-0.1414609, 1.103779, 0.2578161, 0, 1, 0.5960785, 1,
-0.1413297, 0.3000061, -1.545931, 0, 1, 0.6039216, 1,
-0.1269676, 0.3799666, 0.3774876, 0, 1, 0.6117647, 1,
-0.1255156, 0.7889817, 1.28963, 0, 1, 0.6156863, 1,
-0.1244987, 0.6402509, -0.1283498, 0, 1, 0.6235294, 1,
-0.1182498, 1.301328, 3.122622, 0, 1, 0.627451, 1,
-0.1125732, 1.536357, -0.813407, 0, 1, 0.6352941, 1,
-0.1068218, 1.517607, 2.076624, 0, 1, 0.6392157, 1,
-0.1055801, -0.3109591, -3.309822, 0, 1, 0.6470588, 1,
-0.09994516, 1.012446, -2.251051, 0, 1, 0.6509804, 1,
-0.09987646, -0.1949538, -3.119427, 0, 1, 0.6588235, 1,
-0.09971505, 0.5407465, -1.117688, 0, 1, 0.6627451, 1,
-0.09805128, -0.9700098, -2.437872, 0, 1, 0.6705883, 1,
-0.09575141, -1.387798, -3.057765, 0, 1, 0.6745098, 1,
-0.0951744, -1.058312, -2.597536, 0, 1, 0.682353, 1,
-0.09497622, -1.527088, -2.219099, 0, 1, 0.6862745, 1,
-0.09196269, -1.273155, -1.871671, 0, 1, 0.6941177, 1,
-0.09138536, 1.529875, -2.381431, 0, 1, 0.7019608, 1,
-0.09084039, -0.5266197, -2.686816, 0, 1, 0.7058824, 1,
-0.09066035, 0.09489986, -1.201976, 0, 1, 0.7137255, 1,
-0.09057651, 0.303126, -0.7230207, 0, 1, 0.7176471, 1,
-0.08982977, -0.1327922, -2.899508, 0, 1, 0.7254902, 1,
-0.08882712, 0.2300016, -0.9395623, 0, 1, 0.7294118, 1,
-0.07678138, 1.301226, 1.580588, 0, 1, 0.7372549, 1,
-0.07190628, 0.4962646, 0.7924625, 0, 1, 0.7411765, 1,
-0.06988306, -2.115062, -1.830052, 0, 1, 0.7490196, 1,
-0.06969303, 1.05033, 2.548418, 0, 1, 0.7529412, 1,
-0.06829545, 0.7363761, 2.120098, 0, 1, 0.7607843, 1,
-0.06794193, 0.6968294, 1.461077, 0, 1, 0.7647059, 1,
-0.06372155, 0.726521, -0.1745762, 0, 1, 0.772549, 1,
-0.06368606, -0.7278982, -3.853112, 0, 1, 0.7764706, 1,
-0.06276698, 0.2300656, -0.07126689, 0, 1, 0.7843137, 1,
-0.05198909, -0.06018172, -3.694723, 0, 1, 0.7882353, 1,
-0.05171964, 0.1565138, 1.288906, 0, 1, 0.7960784, 1,
-0.05109698, 0.1568911, 0.0582304, 0, 1, 0.8039216, 1,
-0.05055783, -0.442602, -2.700064, 0, 1, 0.8078431, 1,
-0.04688827, -0.9470174, -3.330786, 0, 1, 0.8156863, 1,
-0.04522944, -0.6676341, -3.430407, 0, 1, 0.8196079, 1,
-0.04374055, -0.4416775, -4.072415, 0, 1, 0.827451, 1,
-0.04233669, 0.4993445, -0.4132703, 0, 1, 0.8313726, 1,
-0.0419682, -0.3780081, -2.315833, 0, 1, 0.8392157, 1,
-0.03512346, -1.709237, -3.127368, 0, 1, 0.8431373, 1,
-0.03385468, 0.3270021, -1.201568, 0, 1, 0.8509804, 1,
-0.03363662, 0.7719838, -0.9478799, 0, 1, 0.854902, 1,
-0.03111785, -0.7730071, -3.688747, 0, 1, 0.8627451, 1,
-0.02963333, -1.091844, -2.300472, 0, 1, 0.8666667, 1,
-0.02920513, 0.3449959, -0.06708722, 0, 1, 0.8745098, 1,
-0.02839795, -0.7367225, -2.740881, 0, 1, 0.8784314, 1,
-0.02805548, 0.6146542, 1.80802, 0, 1, 0.8862745, 1,
-0.02562764, -0.468415, -2.058791, 0, 1, 0.8901961, 1,
-0.02351117, -1.438622, -2.888382, 0, 1, 0.8980392, 1,
-0.02294681, 1.643674, -0.7507129, 0, 1, 0.9058824, 1,
-0.01434231, -0.9644083, -1.29807, 0, 1, 0.9098039, 1,
-0.01117048, 0.3027849, -0.5228558, 0, 1, 0.9176471, 1,
-0.01050586, 0.1192322, 0.2310535, 0, 1, 0.9215686, 1,
-0.00834937, -1.00374, 0.04160122, 0, 1, 0.9294118, 1,
-0.004885945, 0.6927462, 0.1747566, 0, 1, 0.9333333, 1,
-0.001825544, 0.009219194, -1.444146, 0, 1, 0.9411765, 1,
0.001290553, -0.1682189, 3.204818, 0, 1, 0.945098, 1,
0.005010189, 2.02764, -2.149903, 0, 1, 0.9529412, 1,
0.007993221, -0.457381, 3.713733, 0, 1, 0.9568627, 1,
0.01248123, 1.204019, 0.2254111, 0, 1, 0.9647059, 1,
0.01604125, 0.03227581, -1.148906, 0, 1, 0.9686275, 1,
0.01850896, -1.60603, 4.393939, 0, 1, 0.9764706, 1,
0.01950526, 0.87466, 1.354638, 0, 1, 0.9803922, 1,
0.02068023, -0.3605517, 1.163955, 0, 1, 0.9882353, 1,
0.02074566, -0.525761, 1.936733, 0, 1, 0.9921569, 1,
0.02107634, -1.23448, 2.997495, 0, 1, 1, 1,
0.0269497, 0.07799724, -2.491601, 0, 0.9921569, 1, 1,
0.03372877, 0.4927336, 1.259107, 0, 0.9882353, 1, 1,
0.03668341, -0.09532087, 2.318686, 0, 0.9803922, 1, 1,
0.03825179, 0.389225, 0.4557793, 0, 0.9764706, 1, 1,
0.03936715, 0.2056005, 0.8201197, 0, 0.9686275, 1, 1,
0.04189936, -0.2045606, 3.040495, 0, 0.9647059, 1, 1,
0.04489177, 2.227977, 0.9466382, 0, 0.9568627, 1, 1,
0.04765996, 0.6349533, -1.460723, 0, 0.9529412, 1, 1,
0.04830355, -1.046238, 2.088258, 0, 0.945098, 1, 1,
0.05507386, -0.2511433, 3.608355, 0, 0.9411765, 1, 1,
0.05681921, 0.2511719, 0.6886802, 0, 0.9333333, 1, 1,
0.05813521, -0.7913297, 2.131887, 0, 0.9294118, 1, 1,
0.05886631, 2.115224, -0.836933, 0, 0.9215686, 1, 1,
0.06068731, -0.3418741, 3.955242, 0, 0.9176471, 1, 1,
0.0618341, 0.7225519, 0.6807154, 0, 0.9098039, 1, 1,
0.0623757, 1.179777, -0.5194603, 0, 0.9058824, 1, 1,
0.06971429, -1.617381, 2.617432, 0, 0.8980392, 1, 1,
0.07788064, -0.828756, 3.01741, 0, 0.8901961, 1, 1,
0.08464399, 0.810768, 1.838021, 0, 0.8862745, 1, 1,
0.08566298, 0.9394158, 0.4841221, 0, 0.8784314, 1, 1,
0.08685808, -1.761572, 4.134303, 0, 0.8745098, 1, 1,
0.08747219, -0.0895087, 1.911861, 0, 0.8666667, 1, 1,
0.09119743, -0.9850677, 2.625067, 0, 0.8627451, 1, 1,
0.09127299, 0.1463526, -0.2936231, 0, 0.854902, 1, 1,
0.09517194, -0.9392017, 2.246238, 0, 0.8509804, 1, 1,
0.09587768, -0.5018688, 2.403573, 0, 0.8431373, 1, 1,
0.09659907, -0.2348875, 3.840862, 0, 0.8392157, 1, 1,
0.1001586, 1.239288, -1.670705, 0, 0.8313726, 1, 1,
0.1007362, -2.016906, 1.848745, 0, 0.827451, 1, 1,
0.1020057, 0.6396863, -0.658604, 0, 0.8196079, 1, 1,
0.1035643, 0.07992435, 1.445232, 0, 0.8156863, 1, 1,
0.103805, -0.2688482, 2.58068, 0, 0.8078431, 1, 1,
0.1051628, 1.692411, 0.4297085, 0, 0.8039216, 1, 1,
0.1094263, -0.1091549, 3.61155, 0, 0.7960784, 1, 1,
0.109445, 0.5825074, 0.7121373, 0, 0.7882353, 1, 1,
0.1101365, 0.9701751, 0.7776304, 0, 0.7843137, 1, 1,
0.1132458, 1.478422, -1.274592, 0, 0.7764706, 1, 1,
0.1174755, 0.4199443, 1.439862, 0, 0.772549, 1, 1,
0.1191397, -1.705638, 2.914529, 0, 0.7647059, 1, 1,
0.1214881, -0.8331035, 2.509493, 0, 0.7607843, 1, 1,
0.1274439, -0.7812569, 2.068062, 0, 0.7529412, 1, 1,
0.128691, 0.156706, 1.422437, 0, 0.7490196, 1, 1,
0.1287738, -1.829904, 3.171546, 0, 0.7411765, 1, 1,
0.1290076, 0.4774439, 1.518803, 0, 0.7372549, 1, 1,
0.1356725, -0.1839591, 2.722912, 0, 0.7294118, 1, 1,
0.1365616, -1.675024, 2.949367, 0, 0.7254902, 1, 1,
0.1379022, -0.1022853, 2.882965, 0, 0.7176471, 1, 1,
0.1422482, 1.904062, -1.194854, 0, 0.7137255, 1, 1,
0.1424891, 0.4664016, 1.49542, 0, 0.7058824, 1, 1,
0.1430697, -0.4381145, 3.631078, 0, 0.6980392, 1, 1,
0.144493, 1.183871, 0.9623218, 0, 0.6941177, 1, 1,
0.1445245, 1.076341, -0.4307649, 0, 0.6862745, 1, 1,
0.1473633, 1.326782, -0.5496194, 0, 0.682353, 1, 1,
0.1522211, -0.8281227, 1.237153, 0, 0.6745098, 1, 1,
0.1532085, -0.419342, 2.404519, 0, 0.6705883, 1, 1,
0.1621168, 0.6032543, -1.038711, 0, 0.6627451, 1, 1,
0.1627259, -0.7598194, 2.791925, 0, 0.6588235, 1, 1,
0.1640199, -3.434983, 4.63428, 0, 0.6509804, 1, 1,
0.1650567, -0.5918768, 2.57314, 0, 0.6470588, 1, 1,
0.1653742, 1.657015, 0.4754992, 0, 0.6392157, 1, 1,
0.1742226, 1.45818, -0.1122137, 0, 0.6352941, 1, 1,
0.1792529, -0.6435567, 2.353618, 0, 0.627451, 1, 1,
0.1795034, -0.2197656, 2.384712, 0, 0.6235294, 1, 1,
0.1796684, 0.3323222, 1.783746, 0, 0.6156863, 1, 1,
0.1871466, 1.343081, 2.075414, 0, 0.6117647, 1, 1,
0.1876975, -0.5039036, 1.690043, 0, 0.6039216, 1, 1,
0.1903522, 0.4732468, -0.3687001, 0, 0.5960785, 1, 1,
0.1909625, -0.4328644, 3.928327, 0, 0.5921569, 1, 1,
0.1919781, -0.2958954, 1.698806, 0, 0.5843138, 1, 1,
0.1948491, 0.6558462, 1.731666, 0, 0.5803922, 1, 1,
0.200042, -1.05918, 2.372127, 0, 0.572549, 1, 1,
0.2106292, -1.871884, 2.810595, 0, 0.5686275, 1, 1,
0.2117225, -1.39167, 3.851448, 0, 0.5607843, 1, 1,
0.2135396, -1.412839, 4.20121, 0, 0.5568628, 1, 1,
0.2154502, 0.8486991, -1.028451, 0, 0.5490196, 1, 1,
0.2188191, 1.29054, -0.1578833, 0, 0.5450981, 1, 1,
0.2244041, -0.738933, 3.18679, 0, 0.5372549, 1, 1,
0.2275763, 1.32223, 0.6208816, 0, 0.5333334, 1, 1,
0.2280702, -1.240983, 2.740348, 0, 0.5254902, 1, 1,
0.231607, 0.4483683, -0.6260809, 0, 0.5215687, 1, 1,
0.2316495, 0.8806927, 0.9338366, 0, 0.5137255, 1, 1,
0.2348403, 0.5226048, 1.866194, 0, 0.509804, 1, 1,
0.2361769, 0.2780598, -0.4839015, 0, 0.5019608, 1, 1,
0.2375422, 1.731629, -1.342984, 0, 0.4941176, 1, 1,
0.2534348, 0.4720892, 0.5644624, 0, 0.4901961, 1, 1,
0.254981, -0.5074987, 0.7604346, 0, 0.4823529, 1, 1,
0.2559413, -1.534501, 2.751023, 0, 0.4784314, 1, 1,
0.2566801, -0.251878, 2.179266, 0, 0.4705882, 1, 1,
0.2589774, 0.2648431, 0.9768955, 0, 0.4666667, 1, 1,
0.2654988, 1.300858, -0.7580773, 0, 0.4588235, 1, 1,
0.2669612, -1.136956, 1.835412, 0, 0.454902, 1, 1,
0.2695985, 1.09048, 1.681759, 0, 0.4470588, 1, 1,
0.2735803, -0.8523533, 2.909092, 0, 0.4431373, 1, 1,
0.2776739, 0.7107628, 0.8873239, 0, 0.4352941, 1, 1,
0.2826153, 0.02811514, 1.206399, 0, 0.4313726, 1, 1,
0.2859758, 2.011964, 0.4377994, 0, 0.4235294, 1, 1,
0.2863869, -1.353713, 3.497329, 0, 0.4196078, 1, 1,
0.2864024, -1.340155, 2.493445, 0, 0.4117647, 1, 1,
0.2882196, 0.9895235, 0.2995108, 0, 0.4078431, 1, 1,
0.2902393, -0.7413764, 2.216208, 0, 0.4, 1, 1,
0.2929402, -0.3366126, 2.334159, 0, 0.3921569, 1, 1,
0.3042405, -0.3467081, 2.27958, 0, 0.3882353, 1, 1,
0.3054733, -0.2732735, 1.605133, 0, 0.3803922, 1, 1,
0.3054985, 0.4507868, -0.2037939, 0, 0.3764706, 1, 1,
0.3079564, -0.4419269, 2.108066, 0, 0.3686275, 1, 1,
0.3132052, -0.2240265, 3.1443, 0, 0.3647059, 1, 1,
0.3134221, 0.2147123, 1.777719, 0, 0.3568628, 1, 1,
0.3164234, -1.876597, 3.303502, 0, 0.3529412, 1, 1,
0.316817, -1.336589, 5.066949, 0, 0.345098, 1, 1,
0.3195809, 0.1964444, 0.9049601, 0, 0.3411765, 1, 1,
0.3210246, 1.013847, -0.5832008, 0, 0.3333333, 1, 1,
0.3210748, 1.093137, 1.326983, 0, 0.3294118, 1, 1,
0.3217139, -0.7337924, 0.7719786, 0, 0.3215686, 1, 1,
0.3241187, -0.2123867, 2.400258, 0, 0.3176471, 1, 1,
0.3266108, -0.9266434, 2.465498, 0, 0.3098039, 1, 1,
0.3272897, -3.064737, 2.939719, 0, 0.3058824, 1, 1,
0.3283685, 0.6913358, 0.3988563, 0, 0.2980392, 1, 1,
0.3368954, 0.00437062, 0.0753403, 0, 0.2901961, 1, 1,
0.3407124, 1.317342, 0.9208565, 0, 0.2862745, 1, 1,
0.3407331, 0.9390099, -0.3364569, 0, 0.2784314, 1, 1,
0.3497988, 1.424148, -0.1909812, 0, 0.2745098, 1, 1,
0.3501342, -1.441369, 3.517625, 0, 0.2666667, 1, 1,
0.3506546, -0.05249283, 2.157911, 0, 0.2627451, 1, 1,
0.3521562, -0.270797, 3.452949, 0, 0.254902, 1, 1,
0.3526585, -0.4764284, 2.765921, 0, 0.2509804, 1, 1,
0.358567, 0.9000217, -0.3692789, 0, 0.2431373, 1, 1,
0.3588801, -1.007766, 2.93343, 0, 0.2392157, 1, 1,
0.3611379, 0.5459359, -0.2258897, 0, 0.2313726, 1, 1,
0.3652418, -1.264462, 1.06835, 0, 0.227451, 1, 1,
0.3654546, 0.4018184, -0.3019032, 0, 0.2196078, 1, 1,
0.3706415, 0.8766114, 0.3840924, 0, 0.2156863, 1, 1,
0.3760052, 0.4040691, 2.044106, 0, 0.2078431, 1, 1,
0.3810723, -1.702023, 1.564618, 0, 0.2039216, 1, 1,
0.3814737, -0.7842603, 4.150841, 0, 0.1960784, 1, 1,
0.3822834, 1.165267, 0.1663585, 0, 0.1882353, 1, 1,
0.3823094, 0.3487602, 0.6661313, 0, 0.1843137, 1, 1,
0.3825155, -0.08536267, 2.727432, 0, 0.1764706, 1, 1,
0.3854543, 0.3059738, 2.743822, 0, 0.172549, 1, 1,
0.3929864, 0.8173161, -0.8796628, 0, 0.1647059, 1, 1,
0.393785, 0.3012224, 0.9513648, 0, 0.1607843, 1, 1,
0.3949517, 1.73004, -0.5496553, 0, 0.1529412, 1, 1,
0.3969449, 0.6659119, -0.5688056, 0, 0.1490196, 1, 1,
0.3991218, 0.7965573, -0.6534318, 0, 0.1411765, 1, 1,
0.3999534, 0.7396027, 0.06480341, 0, 0.1372549, 1, 1,
0.401808, -0.3839499, 1.587753, 0, 0.1294118, 1, 1,
0.4059478, 0.9463363, 1.713333, 0, 0.1254902, 1, 1,
0.408606, -1.57215, 1.991834, 0, 0.1176471, 1, 1,
0.4186374, -0.2012065, 2.907449, 0, 0.1137255, 1, 1,
0.4193479, 0.2738904, 1.440287, 0, 0.1058824, 1, 1,
0.4210185, -0.4647059, 2.873709, 0, 0.09803922, 1, 1,
0.4278371, -0.5355139, 2.473717, 0, 0.09411765, 1, 1,
0.4351298, 0.04995785, 1.115347, 0, 0.08627451, 1, 1,
0.4353008, 1.180581, 1.088009, 0, 0.08235294, 1, 1,
0.4375162, -0.1428452, 1.459491, 0, 0.07450981, 1, 1,
0.4393598, 0.7362283, -0.0716882, 0, 0.07058824, 1, 1,
0.4412398, 0.1021253, 0.8872437, 0, 0.0627451, 1, 1,
0.4494601, 1.172701, -0.6355792, 0, 0.05882353, 1, 1,
0.451527, 1.868898, 0.2973897, 0, 0.05098039, 1, 1,
0.4533569, 0.6721756, 0.01184163, 0, 0.04705882, 1, 1,
0.4534658, -0.1949131, 2.666909, 0, 0.03921569, 1, 1,
0.4542713, -0.2062184, 3.731693, 0, 0.03529412, 1, 1,
0.4595241, -1.14369, 1.007829, 0, 0.02745098, 1, 1,
0.4601249, -0.2129963, 0.9270063, 0, 0.02352941, 1, 1,
0.4611539, -2.59974, 3.123729, 0, 0.01568628, 1, 1,
0.4634854, -1.339105, 3.426558, 0, 0.01176471, 1, 1,
0.4645666, -1.291226, 2.390067, 0, 0.003921569, 1, 1,
0.4661879, 0.3681818, 0.4190474, 0.003921569, 0, 1, 1,
0.4701318, -1.473497, 3.738348, 0.007843138, 0, 1, 1,
0.4717825, 0.1865098, 0.2455946, 0.01568628, 0, 1, 1,
0.4748655, 0.5652757, -0.5087536, 0.01960784, 0, 1, 1,
0.4772241, -0.6681824, 2.924912, 0.02745098, 0, 1, 1,
0.4810653, 1.780177, -1.428427, 0.03137255, 0, 1, 1,
0.4832841, -0.8783027, 3.78218, 0.03921569, 0, 1, 1,
0.4842373, 0.7933837, 0.4777078, 0.04313726, 0, 1, 1,
0.4861575, -0.9893704, 3.918705, 0.05098039, 0, 1, 1,
0.4867651, -0.9410518, 2.368565, 0.05490196, 0, 1, 1,
0.4870263, -0.5903084, 2.170689, 0.0627451, 0, 1, 1,
0.4916778, -1.277931, 3.230085, 0.06666667, 0, 1, 1,
0.4921997, -0.3533135, 1.95592, 0.07450981, 0, 1, 1,
0.4997491, 0.6075767, 2.100302, 0.07843138, 0, 1, 1,
0.502944, 0.5171537, 0.05671532, 0.08627451, 0, 1, 1,
0.5052228, 1.154387, 1.518085, 0.09019608, 0, 1, 1,
0.5071692, 0.8701702, 0.397331, 0.09803922, 0, 1, 1,
0.5170869, 0.463655, 2.292558, 0.1058824, 0, 1, 1,
0.5176328, 0.007583815, 2.175859, 0.1098039, 0, 1, 1,
0.5255767, -0.2036201, 3.610833, 0.1176471, 0, 1, 1,
0.5283608, -1.172432, 1.497782, 0.1215686, 0, 1, 1,
0.5339535, -0.1292167, 3.251765, 0.1294118, 0, 1, 1,
0.5357212, 0.8470538, -0.2471312, 0.1333333, 0, 1, 1,
0.5371364, 0.3856059, -0.111704, 0.1411765, 0, 1, 1,
0.5393954, -1.084094, 3.653126, 0.145098, 0, 1, 1,
0.539878, -1.543051, 3.25909, 0.1529412, 0, 1, 1,
0.5450868, 1.073301, 2.058777, 0.1568628, 0, 1, 1,
0.5466515, -0.8182944, 2.309261, 0.1647059, 0, 1, 1,
0.5509225, 0.3794893, 0.01483367, 0.1686275, 0, 1, 1,
0.5603729, 2.02691, 1.471187, 0.1764706, 0, 1, 1,
0.5610026, 0.3627458, 0.8744035, 0.1803922, 0, 1, 1,
0.566892, 1.380862, 0.5248073, 0.1882353, 0, 1, 1,
0.5672665, -0.5281557, 2.660458, 0.1921569, 0, 1, 1,
0.5694157, 0.1704377, 1.286995, 0.2, 0, 1, 1,
0.577419, -0.4194803, 2.135924, 0.2078431, 0, 1, 1,
0.5790607, 0.1368513, -0.0842703, 0.2117647, 0, 1, 1,
0.5791948, 1.434532, -1.006312, 0.2196078, 0, 1, 1,
0.5795209, 0.2982855, 1.458941, 0.2235294, 0, 1, 1,
0.5884796, 1.406065, 0.7684239, 0.2313726, 0, 1, 1,
0.5903714, 2.445522, 0.8370354, 0.2352941, 0, 1, 1,
0.5906421, -0.3390204, 4.21924, 0.2431373, 0, 1, 1,
0.6068752, 0.6095552, -0.2772996, 0.2470588, 0, 1, 1,
0.6108561, -0.9973888, 1.311361, 0.254902, 0, 1, 1,
0.6112067, -1.13687, 3.535574, 0.2588235, 0, 1, 1,
0.612716, 1.399662, 0.0576039, 0.2666667, 0, 1, 1,
0.6132488, 0.6609582, -1.843949, 0.2705882, 0, 1, 1,
0.6134948, -0.4209365, 0.8587065, 0.2784314, 0, 1, 1,
0.6139838, -0.1122848, 0.8849182, 0.282353, 0, 1, 1,
0.6149404, 1.3047, -0.37685, 0.2901961, 0, 1, 1,
0.6171702, 0.6052484, -0.3035436, 0.2941177, 0, 1, 1,
0.6208883, 0.7454311, 2.845258, 0.3019608, 0, 1, 1,
0.6214173, 0.2956986, 1.523768, 0.3098039, 0, 1, 1,
0.6224532, -0.2399341, 2.882293, 0.3137255, 0, 1, 1,
0.6226242, -0.8230768, 3.32664, 0.3215686, 0, 1, 1,
0.6230091, 0.08336245, 0.8657384, 0.3254902, 0, 1, 1,
0.6266366, 0.286481, 1.597487, 0.3333333, 0, 1, 1,
0.6276451, 1.654543, -0.01589075, 0.3372549, 0, 1, 1,
0.6319435, -0.2608913, 1.530698, 0.345098, 0, 1, 1,
0.6366675, -1.072614, 1.284736, 0.3490196, 0, 1, 1,
0.6367645, 1.574066, 0.06891622, 0.3568628, 0, 1, 1,
0.6389768, -0.8399906, 2.628644, 0.3607843, 0, 1, 1,
0.6404063, 0.2476093, 1.137261, 0.3686275, 0, 1, 1,
0.6409169, -0.4775894, 1.778628, 0.372549, 0, 1, 1,
0.6444524, 0.07559285, 1.15973, 0.3803922, 0, 1, 1,
0.6477914, 0.1596077, 2.254054, 0.3843137, 0, 1, 1,
0.6490657, -1.790818, 1.928908, 0.3921569, 0, 1, 1,
0.6500227, -0.3042147, 3.043917, 0.3960784, 0, 1, 1,
0.6606591, -2.828539, 4.550496, 0.4039216, 0, 1, 1,
0.660759, 0.4756576, 3.140805, 0.4117647, 0, 1, 1,
0.6689864, 1.440654, -0.5758865, 0.4156863, 0, 1, 1,
0.6690227, 0.2130532, 0.8571086, 0.4235294, 0, 1, 1,
0.6701211, 0.8536735, 0.4919218, 0.427451, 0, 1, 1,
0.6716597, 1.455, 1.222288, 0.4352941, 0, 1, 1,
0.6747302, -0.3011551, 1.833064, 0.4392157, 0, 1, 1,
0.6756178, 1.874564, -0.3361116, 0.4470588, 0, 1, 1,
0.6765046, -0.7771923, 2.407095, 0.4509804, 0, 1, 1,
0.680584, 0.5227252, 1.488043, 0.4588235, 0, 1, 1,
0.6824818, -0.1389206, 2.55233, 0.4627451, 0, 1, 1,
0.6834134, -1.206236, 2.920459, 0.4705882, 0, 1, 1,
0.6866918, 0.6729776, -1.273471, 0.4745098, 0, 1, 1,
0.6904033, -0.7160891, 1.468575, 0.4823529, 0, 1, 1,
0.7024927, 0.06008513, 1.8583, 0.4862745, 0, 1, 1,
0.7080504, -0.03333343, -0.4897124, 0.4941176, 0, 1, 1,
0.7083548, -0.6355342, 2.477835, 0.5019608, 0, 1, 1,
0.7120577, -0.09843771, 3.140328, 0.5058824, 0, 1, 1,
0.7126997, -0.270009, 1.076967, 0.5137255, 0, 1, 1,
0.7209265, -1.594309, 2.084731, 0.5176471, 0, 1, 1,
0.7245005, -1.534985, 1.412534, 0.5254902, 0, 1, 1,
0.7275422, 0.5439236, 0.8526202, 0.5294118, 0, 1, 1,
0.7305338, -1.096706, 2.46698, 0.5372549, 0, 1, 1,
0.7417085, 0.03269224, 0.8938428, 0.5411765, 0, 1, 1,
0.7475156, -1.706718, 2.357442, 0.5490196, 0, 1, 1,
0.7493715, -0.8088856, 1.60095, 0.5529412, 0, 1, 1,
0.7514609, 1.071081, 0.2220491, 0.5607843, 0, 1, 1,
0.7525938, 0.3095038, 2.486156, 0.5647059, 0, 1, 1,
0.756546, 0.4891581, 0.4971711, 0.572549, 0, 1, 1,
0.7569242, -0.2631101, 2.232196, 0.5764706, 0, 1, 1,
0.7637217, -0.7303007, 2.063512, 0.5843138, 0, 1, 1,
0.7717109, 0.09845446, 0.1733795, 0.5882353, 0, 1, 1,
0.7757709, 1.022396, 2.105467, 0.5960785, 0, 1, 1,
0.7759392, 0.09130076, 1.683426, 0.6039216, 0, 1, 1,
0.7823266, -1.033016, 1.37718, 0.6078432, 0, 1, 1,
0.7824883, 0.7720116, -1.052682, 0.6156863, 0, 1, 1,
0.7825788, 1.69423, -0.05356315, 0.6196079, 0, 1, 1,
0.7906736, 1.02141, 2.090947, 0.627451, 0, 1, 1,
0.7953804, 1.136857, 2.868448, 0.6313726, 0, 1, 1,
0.7970946, -0.4375442, 0.7719374, 0.6392157, 0, 1, 1,
0.7993323, 0.6504334, 0.7935899, 0.6431373, 0, 1, 1,
0.8018385, -1.110188, 1.755017, 0.6509804, 0, 1, 1,
0.8061846, -1.09222, 3.74853, 0.654902, 0, 1, 1,
0.8070699, 0.4964066, 0.2503532, 0.6627451, 0, 1, 1,
0.8081008, -1.50683, 4.056232, 0.6666667, 0, 1, 1,
0.8105888, 0.6461565, 0.1952857, 0.6745098, 0, 1, 1,
0.8183933, -0.4905156, 1.922925, 0.6784314, 0, 1, 1,
0.819708, 0.7599426, -0.2786568, 0.6862745, 0, 1, 1,
0.8226768, -0.5285913, 0.6035903, 0.6901961, 0, 1, 1,
0.8246104, -0.3559973, 1.474701, 0.6980392, 0, 1, 1,
0.8269811, -1.363492, 2.013825, 0.7058824, 0, 1, 1,
0.8274401, 0.8719964, 1.394236, 0.7098039, 0, 1, 1,
0.8316086, 0.4181254, -1.028134, 0.7176471, 0, 1, 1,
0.8521475, 1.70961, 0.3773127, 0.7215686, 0, 1, 1,
0.8593919, 0.1554599, 0.8193365, 0.7294118, 0, 1, 1,
0.8605624, 0.0518691, 1.240761, 0.7333333, 0, 1, 1,
0.8640999, 0.4190783, 0.9903789, 0.7411765, 0, 1, 1,
0.8674053, 0.5992166, 0.3086721, 0.7450981, 0, 1, 1,
0.8705585, 0.3372158, 2.197793, 0.7529412, 0, 1, 1,
0.8714073, 0.8978941, 2.081218, 0.7568628, 0, 1, 1,
0.8793942, -0.1325394, 1.583924, 0.7647059, 0, 1, 1,
0.8821964, 1.846171, -0.2180814, 0.7686275, 0, 1, 1,
0.8917271, -0.2265095, 2.649808, 0.7764706, 0, 1, 1,
0.8976929, 0.0579964, 0.4630368, 0.7803922, 0, 1, 1,
0.898775, -0.9947161, 3.08768, 0.7882353, 0, 1, 1,
0.9009984, -1.594689, 2.857778, 0.7921569, 0, 1, 1,
0.9023083, -0.6644139, 2.269525, 0.8, 0, 1, 1,
0.9043759, 0.3977209, 1.868954, 0.8078431, 0, 1, 1,
0.9055846, 0.09520743, 0.6428668, 0.8117647, 0, 1, 1,
0.9106116, -1.088685, 1.509508, 0.8196079, 0, 1, 1,
0.9197513, -0.4816077, 1.616168, 0.8235294, 0, 1, 1,
0.9201993, -0.5645683, 1.077459, 0.8313726, 0, 1, 1,
0.9244748, -1.100034, 2.597913, 0.8352941, 0, 1, 1,
0.9273279, 0.637387, 1.419552, 0.8431373, 0, 1, 1,
0.9293853, -0.600855, 2.050338, 0.8470588, 0, 1, 1,
0.9298462, 0.2081402, -0.05244347, 0.854902, 0, 1, 1,
0.9306927, -0.5450726, 4.016922, 0.8588235, 0, 1, 1,
0.9318138, -0.6057952, 3.067099, 0.8666667, 0, 1, 1,
0.9319634, -0.7639245, 1.588124, 0.8705882, 0, 1, 1,
0.9343498, 0.8613793, 0.08025581, 0.8784314, 0, 1, 1,
0.9348049, -0.0184253, -1.132575, 0.8823529, 0, 1, 1,
0.9377533, 0.1174835, 0.2022546, 0.8901961, 0, 1, 1,
0.9415264, -0.9911599, 1.983158, 0.8941177, 0, 1, 1,
0.9450759, 1.456074, 0.4115465, 0.9019608, 0, 1, 1,
0.9526067, -1.536525, 3.090004, 0.9098039, 0, 1, 1,
0.9576228, -0.6876353, 3.821673, 0.9137255, 0, 1, 1,
0.9699328, -2.071445, 2.783407, 0.9215686, 0, 1, 1,
0.9763989, 0.8685565, 3.018024, 0.9254902, 0, 1, 1,
0.9783081, 0.6789744, 0.4012656, 0.9333333, 0, 1, 1,
0.979837, -0.5058805, 2.173763, 0.9372549, 0, 1, 1,
0.9898416, 1.025288, -0.1682446, 0.945098, 0, 1, 1,
0.9903495, 1.80143, 0.7456263, 0.9490196, 0, 1, 1,
0.9934178, -0.88107, 3.583985, 0.9568627, 0, 1, 1,
0.9991384, 0.407064, 1.479496, 0.9607843, 0, 1, 1,
1.008939, 0.06906576, 2.910015, 0.9686275, 0, 1, 1,
1.009089, 0.3878103, -0.4578026, 0.972549, 0, 1, 1,
1.011931, -0.9613908, 1.384255, 0.9803922, 0, 1, 1,
1.011949, -1.887357, 1.967938, 0.9843137, 0, 1, 1,
1.018036, -1.250617, 1.424086, 0.9921569, 0, 1, 1,
1.018794, 0.4232908, 0.6201218, 0.9960784, 0, 1, 1,
1.033765, -1.394124, 2.171163, 1, 0, 0.9960784, 1,
1.039772, -0.6606459, 2.890485, 1, 0, 0.9882353, 1,
1.04159, -0.3594311, 2.051436, 1, 0, 0.9843137, 1,
1.044612, -0.00402975, 0.8832041, 1, 0, 0.9764706, 1,
1.046417, -0.6540192, 2.393258, 1, 0, 0.972549, 1,
1.046563, 0.1432352, 0.5784995, 1, 0, 0.9647059, 1,
1.049006, 0.3006387, 1.662758, 1, 0, 0.9607843, 1,
1.049435, -1.526461, 2.665909, 1, 0, 0.9529412, 1,
1.058639, -1.288413, 1.63904, 1, 0, 0.9490196, 1,
1.060636, 0.3343632, 1.530561, 1, 0, 0.9411765, 1,
1.065334, 1.302496, 0.5985162, 1, 0, 0.9372549, 1,
1.066063, -1.34811, 2.320761, 1, 0, 0.9294118, 1,
1.068922, -0.03419125, 0.03408759, 1, 0, 0.9254902, 1,
1.069503, -0.4405531, 2.990549, 1, 0, 0.9176471, 1,
1.075532, -0.6522352, 1.556175, 1, 0, 0.9137255, 1,
1.080838, 0.2725033, 1.280719, 1, 0, 0.9058824, 1,
1.083194, 1.376154, 1.850249, 1, 0, 0.9019608, 1,
1.090699, 0.3773166, 1.384344, 1, 0, 0.8941177, 1,
1.096534, 1.37732, -1.007023, 1, 0, 0.8862745, 1,
1.102839, -0.8210662, 2.280526, 1, 0, 0.8823529, 1,
1.106449, -1.07391, 4.354244, 1, 0, 0.8745098, 1,
1.107183, -0.01082066, 0.1373148, 1, 0, 0.8705882, 1,
1.10838, -0.9140161, 2.631423, 1, 0, 0.8627451, 1,
1.110973, -0.1703716, 2.223037, 1, 0, 0.8588235, 1,
1.132495, 0.4027315, 1.690287, 1, 0, 0.8509804, 1,
1.142753, 0.3169818, 0.9433792, 1, 0, 0.8470588, 1,
1.148382, 0.770464, -0.1950525, 1, 0, 0.8392157, 1,
1.149344, -0.09589915, 0.7511286, 1, 0, 0.8352941, 1,
1.15059, 1.0435, -0.3505821, 1, 0, 0.827451, 1,
1.151165, 0.4062884, 1.443378, 1, 0, 0.8235294, 1,
1.155727, 0.2304, 2.330114, 1, 0, 0.8156863, 1,
1.174278, -1.385205, 4.207071, 1, 0, 0.8117647, 1,
1.177044, -2.471437, 2.613268, 1, 0, 0.8039216, 1,
1.178927, -0.4254416, 1.537303, 1, 0, 0.7960784, 1,
1.180669, -0.08459326, 1.094475, 1, 0, 0.7921569, 1,
1.183394, -0.09728357, 2.490797, 1, 0, 0.7843137, 1,
1.186236, -1.041806, 1.394547, 1, 0, 0.7803922, 1,
1.194811, -1.995438, 2.478776, 1, 0, 0.772549, 1,
1.195527, -0.6823401, 1.802823, 1, 0, 0.7686275, 1,
1.196922, 0.2810843, 0.9736999, 1, 0, 0.7607843, 1,
1.211639, -0.9998096, 2.643633, 1, 0, 0.7568628, 1,
1.212536, 1.586378, -1.437184, 1, 0, 0.7490196, 1,
1.218705, -0.5307304, 1.622738, 1, 0, 0.7450981, 1,
1.221266, 1.684438, 0.8130841, 1, 0, 0.7372549, 1,
1.221584, -0.8595397, 3.745953, 1, 0, 0.7333333, 1,
1.233173, -0.9494792, 1.92388, 1, 0, 0.7254902, 1,
1.246843, -1.7769, 0.7123206, 1, 0, 0.7215686, 1,
1.250067, 0.8206726, 0.7455698, 1, 0, 0.7137255, 1,
1.252441, 1.472614, 0.8087416, 1, 0, 0.7098039, 1,
1.254167, 0.8010199, 1.418736, 1, 0, 0.7019608, 1,
1.254531, -0.4841535, 2.509665, 1, 0, 0.6941177, 1,
1.264929, 0.02805224, 1.945364, 1, 0, 0.6901961, 1,
1.276615, 0.8138316, 2.526392, 1, 0, 0.682353, 1,
1.277823, -0.233174, 1.968362, 1, 0, 0.6784314, 1,
1.284662, -0.5696608, 2.060694, 1, 0, 0.6705883, 1,
1.284724, -2.041115, 3.995102, 1, 0, 0.6666667, 1,
1.289729, -0.6349322, 1.79722, 1, 0, 0.6588235, 1,
1.291861, -0.5203713, 2.766623, 1, 0, 0.654902, 1,
1.2941, -0.5739124, 0.7514531, 1, 0, 0.6470588, 1,
1.296485, 1.695199, 0.001242365, 1, 0, 0.6431373, 1,
1.301407, -0.3048556, 1.934364, 1, 0, 0.6352941, 1,
1.30223, 0.3054415, 0.9101715, 1, 0, 0.6313726, 1,
1.302421, -0.4449154, 1.474945, 1, 0, 0.6235294, 1,
1.312295, 1.094618, -0.05522259, 1, 0, 0.6196079, 1,
1.312792, 0.1852231, 1.302827, 1, 0, 0.6117647, 1,
1.313822, 1.24858, 1.488205, 1, 0, 0.6078432, 1,
1.316866, -0.05850697, 2.741522, 1, 0, 0.6, 1,
1.328711, -0.1674626, 4.285466, 1, 0, 0.5921569, 1,
1.330954, 0.06159319, 0.8299621, 1, 0, 0.5882353, 1,
1.342675, -0.4721383, 2.618576, 1, 0, 0.5803922, 1,
1.343356, 1.196742, 0.7986238, 1, 0, 0.5764706, 1,
1.351058, -0.5709568, 0.2942138, 1, 0, 0.5686275, 1,
1.371946, 0.7041356, 2.205267, 1, 0, 0.5647059, 1,
1.384767, -0.8153666, 2.504947, 1, 0, 0.5568628, 1,
1.38583, -0.5753582, 1.714805, 1, 0, 0.5529412, 1,
1.389314, -0.8783284, 1.065595, 1, 0, 0.5450981, 1,
1.389876, -0.4716346, 2.665825, 1, 0, 0.5411765, 1,
1.392039, 0.9203134, 1.537232, 1, 0, 0.5333334, 1,
1.401161, 0.4266226, 2.560036, 1, 0, 0.5294118, 1,
1.410413, 0.7408087, -0.6832148, 1, 0, 0.5215687, 1,
1.414054, 0.2120971, 0.7176505, 1, 0, 0.5176471, 1,
1.422524, -0.2428975, 1.640599, 1, 0, 0.509804, 1,
1.423695, -0.05905386, 0.8908623, 1, 0, 0.5058824, 1,
1.42401, 0.1974144, 2.503105, 1, 0, 0.4980392, 1,
1.426583, -0.7086819, 1.087454, 1, 0, 0.4901961, 1,
1.428201, 0.2511536, 0.9692063, 1, 0, 0.4862745, 1,
1.432214, -0.7841045, 0.8976898, 1, 0, 0.4784314, 1,
1.434754, -1.194686, 1.918279, 1, 0, 0.4745098, 1,
1.439966, -0.9868861, 0.9974709, 1, 0, 0.4666667, 1,
1.446706, 0.7823863, 2.825261, 1, 0, 0.4627451, 1,
1.451101, 0.9529805, 0.217056, 1, 0, 0.454902, 1,
1.45146, 1.212367, 0.2361549, 1, 0, 0.4509804, 1,
1.457538, 0.6082208, 1.251181, 1, 0, 0.4431373, 1,
1.460175, -0.3807361, 0.7153578, 1, 0, 0.4392157, 1,
1.46669, -0.2957674, 1.147447, 1, 0, 0.4313726, 1,
1.468115, -0.3437546, 1.360378, 1, 0, 0.427451, 1,
1.468126, 2.14501, 1.460336, 1, 0, 0.4196078, 1,
1.470452, -0.826959, 2.896077, 1, 0, 0.4156863, 1,
1.471221, 0.6281879, 1.987254, 1, 0, 0.4078431, 1,
1.477066, -0.09909113, 3.446742, 1, 0, 0.4039216, 1,
1.477114, -0.2257706, 2.834742, 1, 0, 0.3960784, 1,
1.48937, 0.8947674, 0.6574207, 1, 0, 0.3882353, 1,
1.516385, 1.171673, 1.83924, 1, 0, 0.3843137, 1,
1.528362, 1.700549, 1.684787, 1, 0, 0.3764706, 1,
1.54343, 0.3914482, 2.879386, 1, 0, 0.372549, 1,
1.543875, -1.681442, 0.7659028, 1, 0, 0.3647059, 1,
1.547796, 1.60371, 0.6725008, 1, 0, 0.3607843, 1,
1.55614, 1.096254, 0.2221066, 1, 0, 0.3529412, 1,
1.5603, -1.624024, 2.361297, 1, 0, 0.3490196, 1,
1.564336, 0.7846109, -0.7117568, 1, 0, 0.3411765, 1,
1.569324, -1.466216, 2.893571, 1, 0, 0.3372549, 1,
1.573774, -0.4991491, 1.875896, 1, 0, 0.3294118, 1,
1.579066, 0.001647747, -0.7510814, 1, 0, 0.3254902, 1,
1.586177, 1.004998, -0.7950286, 1, 0, 0.3176471, 1,
1.606933, 1.255263, -0.2503903, 1, 0, 0.3137255, 1,
1.612674, 0.6631429, 1.227799, 1, 0, 0.3058824, 1,
1.623301, 1.041101, 1.700586, 1, 0, 0.2980392, 1,
1.631768, -0.4159413, 0.9995405, 1, 0, 0.2941177, 1,
1.63636, -0.7228814, 1.744567, 1, 0, 0.2862745, 1,
1.637837, 0.08833519, 0.04569985, 1, 0, 0.282353, 1,
1.643954, -0.3674533, 3.732246, 1, 0, 0.2745098, 1,
1.658919, -0.5208864, 1.057094, 1, 0, 0.2705882, 1,
1.673383, 0.3063442, 1.970104, 1, 0, 0.2627451, 1,
1.674085, 0.6978806, 2.111425, 1, 0, 0.2588235, 1,
1.677922, 0.9725649, 3.089836, 1, 0, 0.2509804, 1,
1.693269, 0.2312839, 0.8832936, 1, 0, 0.2470588, 1,
1.710625, 1.528454, -1.134884, 1, 0, 0.2392157, 1,
1.728402, -0.1436701, 2.140376, 1, 0, 0.2352941, 1,
1.732679, -0.9737648, 2.126108, 1, 0, 0.227451, 1,
1.737935, 1.348926, 1.169948, 1, 0, 0.2235294, 1,
1.762471, -0.4150687, 2.100957, 1, 0, 0.2156863, 1,
1.76313, -0.7122226, 3.588126, 1, 0, 0.2117647, 1,
1.773264, 0.0103142, 0.7389511, 1, 0, 0.2039216, 1,
1.783424, 1.106742, 1.878187, 1, 0, 0.1960784, 1,
1.784083, -1.686855, 2.319054, 1, 0, 0.1921569, 1,
1.791338, -0.4287281, 0.2976671, 1, 0, 0.1843137, 1,
1.797949, -0.4960859, 1.115892, 1, 0, 0.1803922, 1,
1.819015, -0.5843, 3.734204, 1, 0, 0.172549, 1,
1.841828, -0.8168488, 1.152965, 1, 0, 0.1686275, 1,
1.842491, 0.4997525, 1.658364, 1, 0, 0.1607843, 1,
1.847368, 0.2467171, 1.024631, 1, 0, 0.1568628, 1,
1.875488, 0.3396793, 0.7093112, 1, 0, 0.1490196, 1,
1.89923, -0.03807728, 1.755993, 1, 0, 0.145098, 1,
1.932821, -0.4126588, 0.5127938, 1, 0, 0.1372549, 1,
1.949916, -0.3239417, 0.04705932, 1, 0, 0.1333333, 1,
1.96027, -0.9923266, 1.178814, 1, 0, 0.1254902, 1,
1.961692, -2.300576, 4.235805, 1, 0, 0.1215686, 1,
1.966654, -0.837309, 0.8373985, 1, 0, 0.1137255, 1,
2.020321, 2.191757, 0.5436828, 1, 0, 0.1098039, 1,
2.032873, 0.6291174, 1.95741, 1, 0, 0.1019608, 1,
2.034386, -0.1202913, 2.039948, 1, 0, 0.09411765, 1,
2.079426, 0.6792005, 1.883785, 1, 0, 0.09019608, 1,
2.085647, -1.391775, 2.295394, 1, 0, 0.08235294, 1,
2.100561, 0.2073226, -0.6859757, 1, 0, 0.07843138, 1,
2.117394, 0.8123443, 2.171876, 1, 0, 0.07058824, 1,
2.225407, -0.1326998, 2.593162, 1, 0, 0.06666667, 1,
2.251876, -0.007317081, 1.965415, 1, 0, 0.05882353, 1,
2.30157, -0.4910936, 2.425475, 1, 0, 0.05490196, 1,
2.40256, 0.2342689, -0.03254062, 1, 0, 0.04705882, 1,
2.476114, 0.3005323, 1.345391, 1, 0, 0.04313726, 1,
2.547692, -1.26826, 2.06353, 1, 0, 0.03529412, 1,
2.581837, -0.4104403, 2.387465, 1, 0, 0.03137255, 1,
2.618432, -0.8099514, 1.989776, 1, 0, 0.02352941, 1,
2.620597, 1.006299, 0.8625261, 1, 0, 0.01960784, 1,
2.734858, 0.3416276, 3.30347, 1, 0, 0.01176471, 1,
2.939567, 0.5834725, 2.655981, 1, 0, 0.007843138, 1
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
-0.355949, -4.431729, -6.833202, 0, -0.5, 0.5, 0.5,
-0.355949, -4.431729, -6.833202, 1, -0.5, 0.5, 0.5,
-0.355949, -4.431729, -6.833202, 1, 1.5, 0.5, 0.5,
-0.355949, -4.431729, -6.833202, 0, 1.5, 0.5, 0.5
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
-4.768645, -0.4947306, -6.833202, 0, -0.5, 0.5, 0.5,
-4.768645, -0.4947306, -6.833202, 1, -0.5, 0.5, 0.5,
-4.768645, -0.4947306, -6.833202, 1, 1.5, 0.5, 0.5,
-4.768645, -0.4947306, -6.833202, 0, 1.5, 0.5, 0.5
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
-4.768645, -4.431729, -0.02075958, 0, -0.5, 0.5, 0.5,
-4.768645, -4.431729, -0.02075958, 1, -0.5, 0.5, 0.5,
-4.768645, -4.431729, -0.02075958, 1, 1.5, 0.5, 0.5,
-4.768645, -4.431729, -0.02075958, 0, 1.5, 0.5, 0.5
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
-3, -3.523191, -5.2611,
2, -3.523191, -5.2611,
-3, -3.523191, -5.2611,
-3, -3.674614, -5.523117,
-2, -3.523191, -5.2611,
-2, -3.674614, -5.523117,
-1, -3.523191, -5.2611,
-1, -3.674614, -5.523117,
0, -3.523191, -5.2611,
0, -3.674614, -5.523117,
1, -3.523191, -5.2611,
1, -3.674614, -5.523117,
2, -3.523191, -5.2611,
2, -3.674614, -5.523117
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
-3, -3.97746, -6.047151, 0, -0.5, 0.5, 0.5,
-3, -3.97746, -6.047151, 1, -0.5, 0.5, 0.5,
-3, -3.97746, -6.047151, 1, 1.5, 0.5, 0.5,
-3, -3.97746, -6.047151, 0, 1.5, 0.5, 0.5,
-2, -3.97746, -6.047151, 0, -0.5, 0.5, 0.5,
-2, -3.97746, -6.047151, 1, -0.5, 0.5, 0.5,
-2, -3.97746, -6.047151, 1, 1.5, 0.5, 0.5,
-2, -3.97746, -6.047151, 0, 1.5, 0.5, 0.5,
-1, -3.97746, -6.047151, 0, -0.5, 0.5, 0.5,
-1, -3.97746, -6.047151, 1, -0.5, 0.5, 0.5,
-1, -3.97746, -6.047151, 1, 1.5, 0.5, 0.5,
-1, -3.97746, -6.047151, 0, 1.5, 0.5, 0.5,
0, -3.97746, -6.047151, 0, -0.5, 0.5, 0.5,
0, -3.97746, -6.047151, 1, -0.5, 0.5, 0.5,
0, -3.97746, -6.047151, 1, 1.5, 0.5, 0.5,
0, -3.97746, -6.047151, 0, 1.5, 0.5, 0.5,
1, -3.97746, -6.047151, 0, -0.5, 0.5, 0.5,
1, -3.97746, -6.047151, 1, -0.5, 0.5, 0.5,
1, -3.97746, -6.047151, 1, 1.5, 0.5, 0.5,
1, -3.97746, -6.047151, 0, 1.5, 0.5, 0.5,
2, -3.97746, -6.047151, 0, -0.5, 0.5, 0.5,
2, -3.97746, -6.047151, 1, -0.5, 0.5, 0.5,
2, -3.97746, -6.047151, 1, 1.5, 0.5, 0.5,
2, -3.97746, -6.047151, 0, 1.5, 0.5, 0.5
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
-3.750331, -3, -5.2611,
-3.750331, 2, -5.2611,
-3.750331, -3, -5.2611,
-3.92005, -3, -5.523117,
-3.750331, -2, -5.2611,
-3.92005, -2, -5.523117,
-3.750331, -1, -5.2611,
-3.92005, -1, -5.523117,
-3.750331, 0, -5.2611,
-3.92005, 0, -5.523117,
-3.750331, 1, -5.2611,
-3.92005, 1, -5.523117,
-3.750331, 2, -5.2611,
-3.92005, 2, -5.523117
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
-4.259488, -3, -6.047151, 0, -0.5, 0.5, 0.5,
-4.259488, -3, -6.047151, 1, -0.5, 0.5, 0.5,
-4.259488, -3, -6.047151, 1, 1.5, 0.5, 0.5,
-4.259488, -3, -6.047151, 0, 1.5, 0.5, 0.5,
-4.259488, -2, -6.047151, 0, -0.5, 0.5, 0.5,
-4.259488, -2, -6.047151, 1, -0.5, 0.5, 0.5,
-4.259488, -2, -6.047151, 1, 1.5, 0.5, 0.5,
-4.259488, -2, -6.047151, 0, 1.5, 0.5, 0.5,
-4.259488, -1, -6.047151, 0, -0.5, 0.5, 0.5,
-4.259488, -1, -6.047151, 1, -0.5, 0.5, 0.5,
-4.259488, -1, -6.047151, 1, 1.5, 0.5, 0.5,
-4.259488, -1, -6.047151, 0, 1.5, 0.5, 0.5,
-4.259488, 0, -6.047151, 0, -0.5, 0.5, 0.5,
-4.259488, 0, -6.047151, 1, -0.5, 0.5, 0.5,
-4.259488, 0, -6.047151, 1, 1.5, 0.5, 0.5,
-4.259488, 0, -6.047151, 0, 1.5, 0.5, 0.5,
-4.259488, 1, -6.047151, 0, -0.5, 0.5, 0.5,
-4.259488, 1, -6.047151, 1, -0.5, 0.5, 0.5,
-4.259488, 1, -6.047151, 1, 1.5, 0.5, 0.5,
-4.259488, 1, -6.047151, 0, 1.5, 0.5, 0.5,
-4.259488, 2, -6.047151, 0, -0.5, 0.5, 0.5,
-4.259488, 2, -6.047151, 1, -0.5, 0.5, 0.5,
-4.259488, 2, -6.047151, 1, 1.5, 0.5, 0.5,
-4.259488, 2, -6.047151, 0, 1.5, 0.5, 0.5
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
-3.750331, -3.523191, -4,
-3.750331, -3.523191, 4,
-3.750331, -3.523191, -4,
-3.92005, -3.674614, -4,
-3.750331, -3.523191, -2,
-3.92005, -3.674614, -2,
-3.750331, -3.523191, 0,
-3.92005, -3.674614, 0,
-3.750331, -3.523191, 2,
-3.92005, -3.674614, 2,
-3.750331, -3.523191, 4,
-3.92005, -3.674614, 4
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
-4.259488, -3.97746, -4, 0, -0.5, 0.5, 0.5,
-4.259488, -3.97746, -4, 1, -0.5, 0.5, 0.5,
-4.259488, -3.97746, -4, 1, 1.5, 0.5, 0.5,
-4.259488, -3.97746, -4, 0, 1.5, 0.5, 0.5,
-4.259488, -3.97746, -2, 0, -0.5, 0.5, 0.5,
-4.259488, -3.97746, -2, 1, -0.5, 0.5, 0.5,
-4.259488, -3.97746, -2, 1, 1.5, 0.5, 0.5,
-4.259488, -3.97746, -2, 0, 1.5, 0.5, 0.5,
-4.259488, -3.97746, 0, 0, -0.5, 0.5, 0.5,
-4.259488, -3.97746, 0, 1, -0.5, 0.5, 0.5,
-4.259488, -3.97746, 0, 1, 1.5, 0.5, 0.5,
-4.259488, -3.97746, 0, 0, 1.5, 0.5, 0.5,
-4.259488, -3.97746, 2, 0, -0.5, 0.5, 0.5,
-4.259488, -3.97746, 2, 1, -0.5, 0.5, 0.5,
-4.259488, -3.97746, 2, 1, 1.5, 0.5, 0.5,
-4.259488, -3.97746, 2, 0, 1.5, 0.5, 0.5,
-4.259488, -3.97746, 4, 0, -0.5, 0.5, 0.5,
-4.259488, -3.97746, 4, 1, -0.5, 0.5, 0.5,
-4.259488, -3.97746, 4, 1, 1.5, 0.5, 0.5,
-4.259488, -3.97746, 4, 0, 1.5, 0.5, 0.5
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
-3.750331, -3.523191, -5.2611,
-3.750331, 2.53373, -5.2611,
-3.750331, -3.523191, 5.219581,
-3.750331, 2.53373, 5.219581,
-3.750331, -3.523191, -5.2611,
-3.750331, -3.523191, 5.219581,
-3.750331, 2.53373, -5.2611,
-3.750331, 2.53373, 5.219581,
-3.750331, -3.523191, -5.2611,
3.038433, -3.523191, -5.2611,
-3.750331, -3.523191, 5.219581,
3.038433, -3.523191, 5.219581,
-3.750331, 2.53373, -5.2611,
3.038433, 2.53373, -5.2611,
-3.750331, 2.53373, 5.219581,
3.038433, 2.53373, 5.219581,
3.038433, -3.523191, -5.2611,
3.038433, 2.53373, -5.2611,
3.038433, -3.523191, 5.219581,
3.038433, 2.53373, 5.219581,
3.038433, -3.523191, -5.2611,
3.038433, -3.523191, 5.219581,
3.038433, 2.53373, -5.2611,
3.038433, 2.53373, 5.219581
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
var radius = 7.410955;
var distance = 32.97218;
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
mvMatrix.translate( 0.355949, 0.4947306, 0.02075958 );
mvMatrix.scale( 1.180314, 1.322928, 0.7645372 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.97218);
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
Fenobucarb<-read.table("Fenobucarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Fenobucarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Fenobucarb' not found
```

```r
y<-Fenobucarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Fenobucarb' not found
```

```r
z<-Fenobucarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Fenobucarb' not found
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
-3.651465, -0.04851743, -0.9578313, 0, 0, 1, 1, 1,
-3.323361, -0.7421023, -2.664863, 1, 0, 0, 1, 1,
-2.902768, 0.6714785, 0.7925675, 1, 0, 0, 1, 1,
-2.562574, -0.007371571, -0.8825039, 1, 0, 0, 1, 1,
-2.449345, 1.204212, -1.715951, 1, 0, 0, 1, 1,
-2.404987, 0.8373492, -1.326214, 1, 0, 0, 1, 1,
-2.297941, 0.7232181, -0.4216711, 0, 0, 0, 1, 1,
-2.285783, 0.5577793, -1.789269, 0, 0, 0, 1, 1,
-2.249306, 0.1235091, -0.7243399, 0, 0, 0, 1, 1,
-2.16267, 1.066589, -1.618656, 0, 0, 0, 1, 1,
-2.155154, 0.289, -2.687294, 0, 0, 0, 1, 1,
-2.13401, 0.2812969, -2.836044, 0, 0, 0, 1, 1,
-2.130744, 0.3983496, -2.386024, 0, 0, 0, 1, 1,
-2.103676, 1.359226, 1.39634, 1, 1, 1, 1, 1,
-2.06536, 0.9746397, -1.791854, 1, 1, 1, 1, 1,
-2.044476, -0.9521616, -1.488849, 1, 1, 1, 1, 1,
-2.0079, -1.99075, -3.367879, 1, 1, 1, 1, 1,
-2.006428, 1.442424, -1.320811, 1, 1, 1, 1, 1,
-1.997673, -0.1608119, -1.076651, 1, 1, 1, 1, 1,
-1.995777, -1.415847, -3.834591, 1, 1, 1, 1, 1,
-1.988687, -2.506051, -4.24084, 1, 1, 1, 1, 1,
-1.979887, 0.3305287, -3.869551, 1, 1, 1, 1, 1,
-1.957543, -0.4938835, -1.889635, 1, 1, 1, 1, 1,
-1.955134, 0.07647379, 0.4111831, 1, 1, 1, 1, 1,
-1.936327, 1.206269, -1.368112, 1, 1, 1, 1, 1,
-1.933116, 0.1566221, -1.414471, 1, 1, 1, 1, 1,
-1.892096, -1.085972, -1.451681, 1, 1, 1, 1, 1,
-1.866505, 1.522427, 0.7065665, 1, 1, 1, 1, 1,
-1.866377, 0.9407488, 1.09397, 0, 0, 1, 1, 1,
-1.861152, 1.054959, -0.3037802, 1, 0, 0, 1, 1,
-1.789942, -2.401249, -1.194774, 1, 0, 0, 1, 1,
-1.773486, -2.36038, -0.08137622, 1, 0, 0, 1, 1,
-1.767551, -0.4688807, -2.097522, 1, 0, 0, 1, 1,
-1.752179, -0.9592046, -1.195314, 1, 0, 0, 1, 1,
-1.743198, -0.8333191, -1.607823, 0, 0, 0, 1, 1,
-1.727168, -1.185779, -1.986783, 0, 0, 0, 1, 1,
-1.707242, 0.7582178, 0.0542725, 0, 0, 0, 1, 1,
-1.700148, -1.219506, -3.742866, 0, 0, 0, 1, 1,
-1.682806, -0.7806416, -2.48273, 0, 0, 0, 1, 1,
-1.666806, -0.07372911, -2.112607, 0, 0, 0, 1, 1,
-1.650661, 1.387538, -3.074423, 0, 0, 0, 1, 1,
-1.622599, 0.2239034, -0.7453648, 1, 1, 1, 1, 1,
-1.621225, 1.214446, -2.183086, 1, 1, 1, 1, 1,
-1.613729, 1.103953, -1.016843, 1, 1, 1, 1, 1,
-1.610297, -1.462836, -2.84906, 1, 1, 1, 1, 1,
-1.595351, -0.5550266, -2.592555, 1, 1, 1, 1, 1,
-1.591233, 0.03196479, -1.973035, 1, 1, 1, 1, 1,
-1.586843, -1.914974, -1.617636, 1, 1, 1, 1, 1,
-1.559771, -0.6015307, -1.554724, 1, 1, 1, 1, 1,
-1.551237, 0.3681332, -2.026031, 1, 1, 1, 1, 1,
-1.528461, 1.561452, -1.835653, 1, 1, 1, 1, 1,
-1.522406, 0.2099567, -0.2892748, 1, 1, 1, 1, 1,
-1.521448, -0.3962623, -3.01616, 1, 1, 1, 1, 1,
-1.519405, -0.4548127, -2.176809, 1, 1, 1, 1, 1,
-1.517134, 1.127646, -1.996421, 1, 1, 1, 1, 1,
-1.509704, 1.740297, 0.150816, 1, 1, 1, 1, 1,
-1.508384, 0.1575757, -0.1706894, 0, 0, 1, 1, 1,
-1.508278, -0.2410666, -1.769322, 1, 0, 0, 1, 1,
-1.49411, 0.5802081, -0.8073266, 1, 0, 0, 1, 1,
-1.493458, 0.3802915, -2.787788, 1, 0, 0, 1, 1,
-1.488098, -1.289464, -2.375714, 1, 0, 0, 1, 1,
-1.487827, -0.3727067, -2.414521, 1, 0, 0, 1, 1,
-1.479371, 0.9302469, -2.388635, 0, 0, 0, 1, 1,
-1.478765, -1.039814, -2.410568, 0, 0, 0, 1, 1,
-1.475918, -1.155781, -2.384118, 0, 0, 0, 1, 1,
-1.445234, 0.354117, 0.05004988, 0, 0, 0, 1, 1,
-1.444632, 0.8192146, 0.7798527, 0, 0, 0, 1, 1,
-1.441011, -0.4904156, -1.950971, 0, 0, 0, 1, 1,
-1.432112, -1.337658, -2.471792, 0, 0, 0, 1, 1,
-1.430929, -0.6053041, -0.848313, 1, 1, 1, 1, 1,
-1.42909, -1.435576, -2.010394, 1, 1, 1, 1, 1,
-1.416177, 0.09809981, -1.157227, 1, 1, 1, 1, 1,
-1.413728, -1.745242, -1.427722, 1, 1, 1, 1, 1,
-1.4126, 2.37917, 0.2263582, 1, 1, 1, 1, 1,
-1.41086, -0.6524269, -1.870276, 1, 1, 1, 1, 1,
-1.409276, -0.05291283, -1.390334, 1, 1, 1, 1, 1,
-1.390159, 1.324687, -1.548851, 1, 1, 1, 1, 1,
-1.38741, -1.77717, -0.6039409, 1, 1, 1, 1, 1,
-1.384278, 0.8147419, 0.7060167, 1, 1, 1, 1, 1,
-1.381611, 0.3192553, -0.7839354, 1, 1, 1, 1, 1,
-1.372233, 0.8179052, 0.08041152, 1, 1, 1, 1, 1,
-1.370398, 0.9649907, -1.140113, 1, 1, 1, 1, 1,
-1.370394, 1.174203, 1.304834, 1, 1, 1, 1, 1,
-1.367217, -1.129409, -1.892446, 1, 1, 1, 1, 1,
-1.365119, -0.4246826, -1.538359, 0, 0, 1, 1, 1,
-1.360137, 0.4447829, -1.02037, 1, 0, 0, 1, 1,
-1.351045, 0.9233732, -1.648811, 1, 0, 0, 1, 1,
-1.343009, -0.6741292, -2.076651, 1, 0, 0, 1, 1,
-1.339409, -0.5565569, -2.952677, 1, 0, 0, 1, 1,
-1.336175, -0.7071986, -4.526104, 1, 0, 0, 1, 1,
-1.336076, -0.1614874, -1.597579, 0, 0, 0, 1, 1,
-1.334761, 1.47774, -2.283723, 0, 0, 0, 1, 1,
-1.333648, 0.498838, -0.5269504, 0, 0, 0, 1, 1,
-1.328664, -0.9829079, -3.065031, 0, 0, 0, 1, 1,
-1.326962, -0.7283635, -1.792294, 0, 0, 0, 1, 1,
-1.32615, -2.188805, -2.00192, 0, 0, 0, 1, 1,
-1.32451, 0.8791378, -2.161407, 0, 0, 0, 1, 1,
-1.31631, -0.1364375, -3.309684, 1, 1, 1, 1, 1,
-1.315093, 0.8919134, -0.7927869, 1, 1, 1, 1, 1,
-1.312969, -1.293264, -1.591483, 1, 1, 1, 1, 1,
-1.312715, -0.809976, -1.109132, 1, 1, 1, 1, 1,
-1.312003, 0.6564421, -1.926379, 1, 1, 1, 1, 1,
-1.311749, -0.4946719, -2.01102, 1, 1, 1, 1, 1,
-1.307084, 0.03555887, -2.793901, 1, 1, 1, 1, 1,
-1.303173, 1.119854, -2.468462, 1, 1, 1, 1, 1,
-1.297972, -2.280281, -2.305983, 1, 1, 1, 1, 1,
-1.285986, -0.239754, -2.032599, 1, 1, 1, 1, 1,
-1.26708, 0.3836944, -1.518453, 1, 1, 1, 1, 1,
-1.24901, -0.04950636, -3.064272, 1, 1, 1, 1, 1,
-1.244575, 0.7146623, 0.1018219, 1, 1, 1, 1, 1,
-1.243746, 1.207209, -0.07835966, 1, 1, 1, 1, 1,
-1.239413, -0.3731934, -0.7719403, 1, 1, 1, 1, 1,
-1.234865, 0.5592954, 0.8512713, 0, 0, 1, 1, 1,
-1.233682, -0.9431688, -3.822527, 1, 0, 0, 1, 1,
-1.217827, 0.2386469, -0.02450569, 1, 0, 0, 1, 1,
-1.214684, 0.2936793, -1.195893, 1, 0, 0, 1, 1,
-1.214504, -1.801625, -2.348523, 1, 0, 0, 1, 1,
-1.212939, 1.441487, 0.3186964, 1, 0, 0, 1, 1,
-1.210774, -0.1768936, -2.240182, 0, 0, 0, 1, 1,
-1.202736, -0.3266775, -1.125519, 0, 0, 0, 1, 1,
-1.191763, 0.2233045, -1.915856, 0, 0, 0, 1, 1,
-1.191478, 0.69816, 1.359796, 0, 0, 0, 1, 1,
-1.176753, 0.6611439, -0.2163688, 0, 0, 0, 1, 1,
-1.170349, -1.334276, -2.272262, 0, 0, 0, 1, 1,
-1.164395, 1.166671, -0.7635469, 0, 0, 0, 1, 1,
-1.161738, -0.007172851, -1.413927, 1, 1, 1, 1, 1,
-1.160788, -0.2591234, -0.2867969, 1, 1, 1, 1, 1,
-1.160234, -0.4236607, -2.418604, 1, 1, 1, 1, 1,
-1.152681, -0.5519612, -1.685662, 1, 1, 1, 1, 1,
-1.148431, 0.8908331, -0.7573911, 1, 1, 1, 1, 1,
-1.141399, 0.01051962, -2.664036, 1, 1, 1, 1, 1,
-1.14139, 0.6869856, -0.201371, 1, 1, 1, 1, 1,
-1.140409, 0.5644251, -0.3027462, 1, 1, 1, 1, 1,
-1.139872, -0.1667409, -1.998062, 1, 1, 1, 1, 1,
-1.139136, 0.6942746, -2.550882, 1, 1, 1, 1, 1,
-1.130677, 0.5192582, -0.3142573, 1, 1, 1, 1, 1,
-1.129447, -1.206205, -1.134293, 1, 1, 1, 1, 1,
-1.122095, -0.2471905, -1.626189, 1, 1, 1, 1, 1,
-1.120534, 1.522812, -1.681714, 1, 1, 1, 1, 1,
-1.117048, 0.4812236, -1.188888, 1, 1, 1, 1, 1,
-1.113649, -0.5894943, -1.833883, 0, 0, 1, 1, 1,
-1.108709, -1.561976, -1.46031, 1, 0, 0, 1, 1,
-1.108276, -0.6450913, 0.2151662, 1, 0, 0, 1, 1,
-1.101358, -1.194016, -2.689476, 1, 0, 0, 1, 1,
-1.091651, -1.695903, -1.720513, 1, 0, 0, 1, 1,
-1.083354, 1.238725, -0.3894489, 1, 0, 0, 1, 1,
-1.075709, 0.9259573, -0.7424616, 0, 0, 0, 1, 1,
-1.069618, 1.591655, -0.1846929, 0, 0, 0, 1, 1,
-1.063146, -0.6133054, -1.687406, 0, 0, 0, 1, 1,
-1.04478, -0.7200115, -1.488024, 0, 0, 0, 1, 1,
-1.043446, 0.2428374, -2.072929, 0, 0, 0, 1, 1,
-1.03715, -1.745141, -2.45404, 0, 0, 0, 1, 1,
-1.028667, -2.100105, -3.128377, 0, 0, 0, 1, 1,
-1.025935, -0.4100684, -3.509098, 1, 1, 1, 1, 1,
-1.022812, 1.486291, -1.27608, 1, 1, 1, 1, 1,
-1.018431, 0.3637496, -0.3368037, 1, 1, 1, 1, 1,
-1.015686, -0.5157543, -1.631457, 1, 1, 1, 1, 1,
-1.001848, -1.467743, -1.18697, 1, 1, 1, 1, 1,
-0.9982924, -0.2989274, -3.347675, 1, 1, 1, 1, 1,
-0.9954872, -0.1526298, -1.497673, 1, 1, 1, 1, 1,
-0.9845382, -0.2541968, 0.26589, 1, 1, 1, 1, 1,
-0.9837752, 0.2808361, -1.597023, 1, 1, 1, 1, 1,
-0.9740896, -0.1892398, -1.785075, 1, 1, 1, 1, 1,
-0.970429, -0.5341737, -0.8717872, 1, 1, 1, 1, 1,
-0.9660791, -0.03292835, -1.869585, 1, 1, 1, 1, 1,
-0.9612879, -2.613068, -2.02821, 1, 1, 1, 1, 1,
-0.9608476, 1.126274, -0.7826532, 1, 1, 1, 1, 1,
-0.9568164, 1.064878, -0.8386, 1, 1, 1, 1, 1,
-0.953226, -0.7603038, -3.248792, 0, 0, 1, 1, 1,
-0.9514572, 1.684696, -0.3939874, 1, 0, 0, 1, 1,
-0.9512358, -0.5102147, -3.005411, 1, 0, 0, 1, 1,
-0.9496052, -0.53271, -1.887858, 1, 0, 0, 1, 1,
-0.9470988, -0.1861944, -2.602006, 1, 0, 0, 1, 1,
-0.9450793, -0.1563352, -3.623713, 1, 0, 0, 1, 1,
-0.9434682, 0.1307825, -1.328011, 0, 0, 0, 1, 1,
-0.943163, 0.03095125, -0.7018875, 0, 0, 0, 1, 1,
-0.9413044, 0.7882944, -0.9731461, 0, 0, 0, 1, 1,
-0.9376872, -1.843603, -2.208578, 0, 0, 0, 1, 1,
-0.9364666, 1.36944, -0.9845452, 0, 0, 0, 1, 1,
-0.9313239, -0.01190154, -1.789919, 0, 0, 0, 1, 1,
-0.9218211, 2.115226, -0.4210193, 0, 0, 0, 1, 1,
-0.9212183, 0.2814795, -1.410626, 1, 1, 1, 1, 1,
-0.9087068, 0.06315441, -1.126792, 1, 1, 1, 1, 1,
-0.9055065, 1.862042, -0.4484286, 1, 1, 1, 1, 1,
-0.9047365, 2.02617, -0.8236836, 1, 1, 1, 1, 1,
-0.9032765, 1.759858, 0.4695542, 1, 1, 1, 1, 1,
-0.8941426, 0.4630852, -1.668572, 1, 1, 1, 1, 1,
-0.892154, -0.07118163, -1.484979, 1, 1, 1, 1, 1,
-0.8913577, -0.6618994, -1.881915, 1, 1, 1, 1, 1,
-0.8806323, -1.557744, -2.244947, 1, 1, 1, 1, 1,
-0.8801606, 2.107909, -1.400369, 1, 1, 1, 1, 1,
-0.8742682, 0.09602017, -4.119901, 1, 1, 1, 1, 1,
-0.8710647, 0.1371619, -2.702694, 1, 1, 1, 1, 1,
-0.8658669, -0.9162318, -2.126492, 1, 1, 1, 1, 1,
-0.8636142, -0.2073525, -2.217787, 1, 1, 1, 1, 1,
-0.8630624, -0.6396725, -2.654557, 1, 1, 1, 1, 1,
-0.8569071, -0.7317773, -3.135645, 0, 0, 1, 1, 1,
-0.8562267, -1.663456, -3.331191, 1, 0, 0, 1, 1,
-0.8479117, -1.697078, -3.520487, 1, 0, 0, 1, 1,
-0.8471233, 0.01326824, -1.334196, 1, 0, 0, 1, 1,
-0.8442719, -1.517097, -3.131456, 1, 0, 0, 1, 1,
-0.8364763, 1.77144, -0.6986695, 1, 0, 0, 1, 1,
-0.8312875, -0.5775251, -2.333647, 0, 0, 0, 1, 1,
-0.8307816, 1.188089, -0.3296829, 0, 0, 0, 1, 1,
-0.8301103, 0.6139835, 0.6253047, 0, 0, 0, 1, 1,
-0.8296573, 0.4959986, -2.050482, 0, 0, 0, 1, 1,
-0.8263505, -0.9080721, -3.450429, 0, 0, 0, 1, 1,
-0.8239859, -0.7552705, -2.082807, 0, 0, 0, 1, 1,
-0.8179703, 0.71891, -1.130462, 0, 0, 0, 1, 1,
-0.8133174, -0.8544762, -2.600739, 1, 1, 1, 1, 1,
-0.8042937, 1.207563, -1.631372, 1, 1, 1, 1, 1,
-0.8005233, 0.05757724, -0.8478115, 1, 1, 1, 1, 1,
-0.7990602, -1.35572, -2.610646, 1, 1, 1, 1, 1,
-0.7929038, -0.2591924, -2.086514, 1, 1, 1, 1, 1,
-0.7918022, 0.9190596, -0.6296723, 1, 1, 1, 1, 1,
-0.7888229, 0.7197406, -0.3164932, 1, 1, 1, 1, 1,
-0.7848245, -1.050939, -1.987516, 1, 1, 1, 1, 1,
-0.783208, 0.3263133, -1.857853, 1, 1, 1, 1, 1,
-0.7803443, -0.001593034, -1.032368, 1, 1, 1, 1, 1,
-0.7796676, 0.5629753, -0.00795494, 1, 1, 1, 1, 1,
-0.7687511, 0.2062109, -0.7958577, 1, 1, 1, 1, 1,
-0.7679718, 0.7897472, -0.1381852, 1, 1, 1, 1, 1,
-0.7591774, -2.140506, -4.106338, 1, 1, 1, 1, 1,
-0.7534917, 0.7095187, -1.455824, 1, 1, 1, 1, 1,
-0.7492964, -0.9660202, -3.707714, 0, 0, 1, 1, 1,
-0.7491758, 0.5518985, -1.406976, 1, 0, 0, 1, 1,
-0.7487734, -0.3950512, -2.122086, 1, 0, 0, 1, 1,
-0.7438361, -0.3315697, -2.378015, 1, 0, 0, 1, 1,
-0.7408231, 0.6969713, -0.08965731, 1, 0, 0, 1, 1,
-0.7374553, -0.7838691, -3.020751, 1, 0, 0, 1, 1,
-0.7371239, -0.3784392, -2.667226, 0, 0, 0, 1, 1,
-0.7299839, -0.326057, -0.4584, 0, 0, 0, 1, 1,
-0.7245337, -1.913718, -2.064114, 0, 0, 0, 1, 1,
-0.718127, -0.4766338, -1.871741, 0, 0, 0, 1, 1,
-0.7144972, -1.280082, -0.7702379, 0, 0, 0, 1, 1,
-0.7087945, 0.9150613, -2.05194, 0, 0, 0, 1, 1,
-0.707149, 2.14699, -0.4070245, 0, 0, 0, 1, 1,
-0.7061214, 0.06964674, -0.3647591, 1, 1, 1, 1, 1,
-0.7024995, -0.1933448, -1.298766, 1, 1, 1, 1, 1,
-0.6990594, 0.4799986, -0.7122095, 1, 1, 1, 1, 1,
-0.6976722, -0.246203, -1.967708, 1, 1, 1, 1, 1,
-0.6960198, -0.2164556, -3.0324, 1, 1, 1, 1, 1,
-0.694524, -0.4125073, -2.430907, 1, 1, 1, 1, 1,
-0.6920372, -2.29164, -1.828364, 1, 1, 1, 1, 1,
-0.6903628, 0.1077462, -1.311223, 1, 1, 1, 1, 1,
-0.689926, -0.2624519, -2.933836, 1, 1, 1, 1, 1,
-0.6896369, -1.68225, -3.81102, 1, 1, 1, 1, 1,
-0.6854602, -1.492413, -2.383373, 1, 1, 1, 1, 1,
-0.6827376, -0.6666315, -3.640313, 1, 1, 1, 1, 1,
-0.6826736, 0.8462454, 0.06455152, 1, 1, 1, 1, 1,
-0.6787015, 0.3877442, -0.2483271, 1, 1, 1, 1, 1,
-0.677574, 0.6170478, -0.8419355, 1, 1, 1, 1, 1,
-0.6763005, 1.688541, 0.412644, 0, 0, 1, 1, 1,
-0.6705521, 2.099481, -0.8514243, 1, 0, 0, 1, 1,
-0.6642424, -0.5179162, -2.12294, 1, 0, 0, 1, 1,
-0.6573709, 0.1895317, -1.443252, 1, 0, 0, 1, 1,
-0.6562148, 0.4900067, 0.07650414, 1, 0, 0, 1, 1,
-0.6554064, 0.1326066, -0.565074, 1, 0, 0, 1, 1,
-0.6472664, 0.9988738, -0.1549354, 0, 0, 0, 1, 1,
-0.6458188, 0.8088721, -2.324402, 0, 0, 0, 1, 1,
-0.6454278, -0.1315563, -0.538574, 0, 0, 0, 1, 1,
-0.6449682, -1.506123, -2.875774, 0, 0, 0, 1, 1,
-0.6427346, -0.2399515, -2.803136, 0, 0, 0, 1, 1,
-0.6426751, -1.366226, -2.055232, 0, 0, 0, 1, 1,
-0.6392127, 2.034978, 0.3635681, 0, 0, 0, 1, 1,
-0.6329445, -0.3399334, -2.061435, 1, 1, 1, 1, 1,
-0.6287919, 0.4880314, -0.3083822, 1, 1, 1, 1, 1,
-0.6260853, 1.575585, -1.725604, 1, 1, 1, 1, 1,
-0.6257064, 0.2659048, -3.100105, 1, 1, 1, 1, 1,
-0.6255108, -0.1067564, -2.018808, 1, 1, 1, 1, 1,
-0.622766, -1.758705, -0.5893871, 1, 1, 1, 1, 1,
-0.6226919, 1.76126, -0.6382054, 1, 1, 1, 1, 1,
-0.6181399, 0.6598697, -0.6548704, 1, 1, 1, 1, 1,
-0.6173453, 1.981424, -0.3677022, 1, 1, 1, 1, 1,
-0.6099705, 0.9186819, 0.02775767, 1, 1, 1, 1, 1,
-0.6088302, 0.9414145, -1.340703, 1, 1, 1, 1, 1,
-0.6077069, 1.111642, -0.5333481, 1, 1, 1, 1, 1,
-0.6034473, 0.3081102, -1.989686, 1, 1, 1, 1, 1,
-0.6012689, -0.9816644, -2.083535, 1, 1, 1, 1, 1,
-0.5943639, 0.506911, -2.698898, 1, 1, 1, 1, 1,
-0.5926006, -0.4958331, -3.565572, 0, 0, 1, 1, 1,
-0.5917224, -0.46391, -2.659951, 1, 0, 0, 1, 1,
-0.5903266, -0.2705198, -1.253915, 1, 0, 0, 1, 1,
-0.5869501, -0.1867088, -2.598109, 1, 0, 0, 1, 1,
-0.580606, 0.2640263, -0.9115247, 1, 0, 0, 1, 1,
-0.579895, -1.370348, -2.415253, 1, 0, 0, 1, 1,
-0.5755066, -0.3700889, -2.985959, 0, 0, 0, 1, 1,
-0.5752932, 0.2848855, -0.2024922, 0, 0, 0, 1, 1,
-0.5705441, 0.2732724, -1.167901, 0, 0, 0, 1, 1,
-0.5591228, 1.51229, -1.891234, 0, 0, 0, 1, 1,
-0.5565504, 0.02917171, -0.2672714, 0, 0, 0, 1, 1,
-0.5545204, 1.454265, 0.4034247, 0, 0, 0, 1, 1,
-0.5482354, 2.024208, -1.238773, 0, 0, 0, 1, 1,
-0.5480294, 0.2082994, -2.83112, 1, 1, 1, 1, 1,
-0.5466557, 0.7088058, -1.134762, 1, 1, 1, 1, 1,
-0.5386143, -1.116256, -1.86127, 1, 1, 1, 1, 1,
-0.5384904, -0.9344114, -2.563157, 1, 1, 1, 1, 1,
-0.530193, -0.9146903, -1.280156, 1, 1, 1, 1, 1,
-0.5300688, -1.7067, -3.846772, 1, 1, 1, 1, 1,
-0.5264325, -0.3493091, -1.604777, 1, 1, 1, 1, 1,
-0.5241242, 0.5401638, -0.03384661, 1, 1, 1, 1, 1,
-0.5222612, -0.6030177, -1.982895, 1, 1, 1, 1, 1,
-0.517045, -0.5646318, -3.576435, 1, 1, 1, 1, 1,
-0.5131505, -1.69926, -3.941477, 1, 1, 1, 1, 1,
-0.5024882, -0.5270475, -2.62917, 1, 1, 1, 1, 1,
-0.5010588, 0.568643, 0.2531618, 1, 1, 1, 1, 1,
-0.4995575, 0.618923, -1.175457, 1, 1, 1, 1, 1,
-0.4969189, 0.6497246, -2.021288, 1, 1, 1, 1, 1,
-0.4951709, -0.0683649, 0.3468162, 0, 0, 1, 1, 1,
-0.4943557, -0.4975369, -2.691402, 1, 0, 0, 1, 1,
-0.4942131, -0.9039169, -1.511769, 1, 0, 0, 1, 1,
-0.4941674, 0.7723515, 0.4290225, 1, 0, 0, 1, 1,
-0.4923135, 0.250858, 0.8078425, 1, 0, 0, 1, 1,
-0.490475, 1.113411, -0.7126846, 1, 0, 0, 1, 1,
-0.4901572, 0.8584332, -0.4020817, 0, 0, 0, 1, 1,
-0.489069, -0.1627955, -2.046884, 0, 0, 0, 1, 1,
-0.4866917, -0.7439303, -3.35875, 0, 0, 0, 1, 1,
-0.4855899, 0.834518, 0.5154155, 0, 0, 0, 1, 1,
-0.48429, -0.2976391, -1.758525, 0, 0, 0, 1, 1,
-0.4835244, 0.9443956, -1.320221, 0, 0, 0, 1, 1,
-0.476906, -0.6542526, -2.38289, 0, 0, 0, 1, 1,
-0.4767517, 0.7047197, 0.9116223, 1, 1, 1, 1, 1,
-0.4759847, -1.172407, -2.781694, 1, 1, 1, 1, 1,
-0.4705135, -0.8506222, -3.429985, 1, 1, 1, 1, 1,
-0.4703634, 1.169551, 0.6112376, 1, 1, 1, 1, 1,
-0.4665969, -1.648198, -4.483952, 1, 1, 1, 1, 1,
-0.4652645, -0.5003498, -4.023568, 1, 1, 1, 1, 1,
-0.4533059, 0.7893857, -0.7454308, 1, 1, 1, 1, 1,
-0.4465898, -0.9969515, -2.424306, 1, 1, 1, 1, 1,
-0.444979, 1.621869, 0.06594805, 1, 1, 1, 1, 1,
-0.4427679, 0.2138817, -1.236631, 1, 1, 1, 1, 1,
-0.4372071, -0.5742135, -2.933804, 1, 1, 1, 1, 1,
-0.4370427, -0.1024605, -1.325633, 1, 1, 1, 1, 1,
-0.4363487, -1.095479, -3.395088, 1, 1, 1, 1, 1,
-0.4350948, -0.04310045, -1.099137, 1, 1, 1, 1, 1,
-0.4329058, 2.097197, 1.20152, 1, 1, 1, 1, 1,
-0.4318342, -0.9118531, -3.807732, 0, 0, 1, 1, 1,
-0.4310266, 0.06868671, -1.63718, 1, 0, 0, 1, 1,
-0.4270706, -0.01258404, -2.449857, 1, 0, 0, 1, 1,
-0.423748, 0.7156025, -0.7632416, 1, 0, 0, 1, 1,
-0.4205248, 0.3827513, -1.336379, 1, 0, 0, 1, 1,
-0.4196585, 1.513574, 0.05762482, 1, 0, 0, 1, 1,
-0.4169247, -0.1438263, -1.82695, 0, 0, 0, 1, 1,
-0.4111396, 1.024911, -0.7232394, 0, 0, 0, 1, 1,
-0.4098077, 0.9634704, -1.229711, 0, 0, 0, 1, 1,
-0.4095923, -0.6615283, -2.639295, 0, 0, 0, 1, 1,
-0.4087695, -0.05572183, -5.108469, 0, 0, 0, 1, 1,
-0.4042928, 0.7921396, 0.8375197, 0, 0, 0, 1, 1,
-0.3997335, -0.8576002, -1.023193, 0, 0, 0, 1, 1,
-0.3971119, 0.02880544, -1.014649, 1, 1, 1, 1, 1,
-0.3953567, -0.3745997, -2.726913, 1, 1, 1, 1, 1,
-0.3947787, 0.5521762, -1.595515, 1, 1, 1, 1, 1,
-0.3940599, 0.8992863, -0.4642562, 1, 1, 1, 1, 1,
-0.3909362, 1.119476, -0.4798904, 1, 1, 1, 1, 1,
-0.3909324, 0.4947865, 1.167777, 1, 1, 1, 1, 1,
-0.3889513, 0.636967, -0.6951091, 1, 1, 1, 1, 1,
-0.3808555, -0.5412816, -2.092106, 1, 1, 1, 1, 1,
-0.3785238, -0.7864299, -3.687917, 1, 1, 1, 1, 1,
-0.376416, 1.093565, -1.257982, 1, 1, 1, 1, 1,
-0.3739218, 0.7350397, -0.8922856, 1, 1, 1, 1, 1,
-0.3687097, 0.4888908, -0.6718325, 1, 1, 1, 1, 1,
-0.358811, -0.5184776, -2.353199, 1, 1, 1, 1, 1,
-0.3570479, -0.432599, -0.8716707, 1, 1, 1, 1, 1,
-0.3563142, -1.208566, -3.54256, 1, 1, 1, 1, 1,
-0.3546554, -0.013056, -1.996203, 0, 0, 1, 1, 1,
-0.3532354, 2.091918, -0.07780178, 1, 0, 0, 1, 1,
-0.3443982, 1.228579, -1.402783, 1, 0, 0, 1, 1,
-0.3440286, -0.9248569, -2.941853, 1, 0, 0, 1, 1,
-0.3432092, -0.5753374, -2.350742, 1, 0, 0, 1, 1,
-0.3417779, 0.2760359, -2.505573, 1, 0, 0, 1, 1,
-0.3407768, -0.05032252, -2.112525, 0, 0, 0, 1, 1,
-0.3381694, -0.01768085, -1.952407, 0, 0, 0, 1, 1,
-0.3355407, 1.037873, -1.208637, 0, 0, 0, 1, 1,
-0.3288946, -0.7218094, -4.376425, 0, 0, 0, 1, 1,
-0.3253319, 1.275082, 0.630141, 0, 0, 0, 1, 1,
-0.3220064, 0.5004292, 1.110513, 0, 0, 0, 1, 1,
-0.316615, -0.1958503, 0.9984623, 0, 0, 0, 1, 1,
-0.3150552, 0.8336627, 0.9189045, 1, 1, 1, 1, 1,
-0.3095485, -0.9645123, -3.371997, 1, 1, 1, 1, 1,
-0.3063522, 0.6934624, 0.638526, 1, 1, 1, 1, 1,
-0.3052138, -1.130675, -3.08716, 1, 1, 1, 1, 1,
-0.3032321, 1.222442, -0.9342614, 1, 1, 1, 1, 1,
-0.3022272, -1.239665, -3.455059, 1, 1, 1, 1, 1,
-0.2972529, 1.492591, -0.2699252, 1, 1, 1, 1, 1,
-0.2965151, -0.2572589, -1.734665, 1, 1, 1, 1, 1,
-0.290852, -1.831215, -2.35213, 1, 1, 1, 1, 1,
-0.2845681, -1.142064, -1.708136, 1, 1, 1, 1, 1,
-0.2748776, -1.486217, -2.331766, 1, 1, 1, 1, 1,
-0.2706165, 0.9427668, -1.918347, 1, 1, 1, 1, 1,
-0.2647003, -0.3859963, -2.033395, 1, 1, 1, 1, 1,
-0.2638153, 0.1674502, -2.584852, 1, 1, 1, 1, 1,
-0.2614272, 0.5755611, -1.783397, 1, 1, 1, 1, 1,
-0.2610914, 0.4084346, 0.912038, 0, 0, 1, 1, 1,
-0.2586186, 0.04482312, -2.362472, 1, 0, 0, 1, 1,
-0.2550065, 0.2140379, -0.7413143, 1, 0, 0, 1, 1,
-0.252213, 1.462982, 0.3015202, 1, 0, 0, 1, 1,
-0.2491543, 0.2797912, 0.9300432, 1, 0, 0, 1, 1,
-0.2433481, -0.8018535, -3.343087, 1, 0, 0, 1, 1,
-0.2423203, -0.3851687, -3.385748, 0, 0, 0, 1, 1,
-0.2417198, -0.6690629, -1.824893, 0, 0, 0, 1, 1,
-0.2342623, -0.4262067, -0.6308262, 0, 0, 0, 1, 1,
-0.2289214, -0.1154424, -1.534758, 0, 0, 0, 1, 1,
-0.2220778, 1.17618, -0.4867795, 0, 0, 0, 1, 1,
-0.2216555, 0.9887058, -0.426131, 0, 0, 0, 1, 1,
-0.2190644, 0.5741475, -0.7327079, 0, 0, 0, 1, 1,
-0.2135509, 0.722742, -1.877843, 1, 1, 1, 1, 1,
-0.2062958, 1.30995, -3.038449, 1, 1, 1, 1, 1,
-0.2054389, 0.7669238, -1.560758, 1, 1, 1, 1, 1,
-0.2023804, 0.08459013, -3.84069, 1, 1, 1, 1, 1,
-0.1996171, -0.02306163, -1.9049, 1, 1, 1, 1, 1,
-0.1981427, -1.486911, -3.129426, 1, 1, 1, 1, 1,
-0.1976625, 2.17406, 0.6205632, 1, 1, 1, 1, 1,
-0.1973691, 0.399369, -0.3910254, 1, 1, 1, 1, 1,
-0.196738, 1.369105, -0.07853641, 1, 1, 1, 1, 1,
-0.1930431, 1.188458, 0.4395636, 1, 1, 1, 1, 1,
-0.1913402, 1.253434, 0.05111266, 1, 1, 1, 1, 1,
-0.1872222, -0.5628874, -1.3848, 1, 1, 1, 1, 1,
-0.1835218, -1.327131, -4.26264, 1, 1, 1, 1, 1,
-0.1820218, 0.4168556, -0.441071, 1, 1, 1, 1, 1,
-0.1753026, -0.2440854, -2.399917, 1, 1, 1, 1, 1,
-0.1741359, -0.3452626, -0.6103989, 0, 0, 1, 1, 1,
-0.1692454, 1.985462, 1.187231, 1, 0, 0, 1, 1,
-0.1684811, -0.9076367, -3.547347, 1, 0, 0, 1, 1,
-0.1683587, 0.7088969, -0.007068776, 1, 0, 0, 1, 1,
-0.1652214, -0.3919047, -2.292042, 1, 0, 0, 1, 1,
-0.1612368, 0.1894799, 0.2949685, 1, 0, 0, 1, 1,
-0.1555708, -2.475345, -1.828906, 0, 0, 0, 1, 1,
-0.1521725, 1.443042, 0.8539274, 0, 0, 0, 1, 1,
-0.1507194, 1.281746, -0.4003636, 0, 0, 0, 1, 1,
-0.1503943, 0.1699607, -0.822804, 0, 0, 0, 1, 1,
-0.1491202, -1.080114, -3.020337, 0, 0, 0, 1, 1,
-0.1440876, -0.9646856, -4.023371, 0, 0, 0, 1, 1,
-0.142563, -0.3531927, -2.038598, 0, 0, 0, 1, 1,
-0.1414609, 1.103779, 0.2578161, 1, 1, 1, 1, 1,
-0.1413297, 0.3000061, -1.545931, 1, 1, 1, 1, 1,
-0.1269676, 0.3799666, 0.3774876, 1, 1, 1, 1, 1,
-0.1255156, 0.7889817, 1.28963, 1, 1, 1, 1, 1,
-0.1244987, 0.6402509, -0.1283498, 1, 1, 1, 1, 1,
-0.1182498, 1.301328, 3.122622, 1, 1, 1, 1, 1,
-0.1125732, 1.536357, -0.813407, 1, 1, 1, 1, 1,
-0.1068218, 1.517607, 2.076624, 1, 1, 1, 1, 1,
-0.1055801, -0.3109591, -3.309822, 1, 1, 1, 1, 1,
-0.09994516, 1.012446, -2.251051, 1, 1, 1, 1, 1,
-0.09987646, -0.1949538, -3.119427, 1, 1, 1, 1, 1,
-0.09971505, 0.5407465, -1.117688, 1, 1, 1, 1, 1,
-0.09805128, -0.9700098, -2.437872, 1, 1, 1, 1, 1,
-0.09575141, -1.387798, -3.057765, 1, 1, 1, 1, 1,
-0.0951744, -1.058312, -2.597536, 1, 1, 1, 1, 1,
-0.09497622, -1.527088, -2.219099, 0, 0, 1, 1, 1,
-0.09196269, -1.273155, -1.871671, 1, 0, 0, 1, 1,
-0.09138536, 1.529875, -2.381431, 1, 0, 0, 1, 1,
-0.09084039, -0.5266197, -2.686816, 1, 0, 0, 1, 1,
-0.09066035, 0.09489986, -1.201976, 1, 0, 0, 1, 1,
-0.09057651, 0.303126, -0.7230207, 1, 0, 0, 1, 1,
-0.08982977, -0.1327922, -2.899508, 0, 0, 0, 1, 1,
-0.08882712, 0.2300016, -0.9395623, 0, 0, 0, 1, 1,
-0.07678138, 1.301226, 1.580588, 0, 0, 0, 1, 1,
-0.07190628, 0.4962646, 0.7924625, 0, 0, 0, 1, 1,
-0.06988306, -2.115062, -1.830052, 0, 0, 0, 1, 1,
-0.06969303, 1.05033, 2.548418, 0, 0, 0, 1, 1,
-0.06829545, 0.7363761, 2.120098, 0, 0, 0, 1, 1,
-0.06794193, 0.6968294, 1.461077, 1, 1, 1, 1, 1,
-0.06372155, 0.726521, -0.1745762, 1, 1, 1, 1, 1,
-0.06368606, -0.7278982, -3.853112, 1, 1, 1, 1, 1,
-0.06276698, 0.2300656, -0.07126689, 1, 1, 1, 1, 1,
-0.05198909, -0.06018172, -3.694723, 1, 1, 1, 1, 1,
-0.05171964, 0.1565138, 1.288906, 1, 1, 1, 1, 1,
-0.05109698, 0.1568911, 0.0582304, 1, 1, 1, 1, 1,
-0.05055783, -0.442602, -2.700064, 1, 1, 1, 1, 1,
-0.04688827, -0.9470174, -3.330786, 1, 1, 1, 1, 1,
-0.04522944, -0.6676341, -3.430407, 1, 1, 1, 1, 1,
-0.04374055, -0.4416775, -4.072415, 1, 1, 1, 1, 1,
-0.04233669, 0.4993445, -0.4132703, 1, 1, 1, 1, 1,
-0.0419682, -0.3780081, -2.315833, 1, 1, 1, 1, 1,
-0.03512346, -1.709237, -3.127368, 1, 1, 1, 1, 1,
-0.03385468, 0.3270021, -1.201568, 1, 1, 1, 1, 1,
-0.03363662, 0.7719838, -0.9478799, 0, 0, 1, 1, 1,
-0.03111785, -0.7730071, -3.688747, 1, 0, 0, 1, 1,
-0.02963333, -1.091844, -2.300472, 1, 0, 0, 1, 1,
-0.02920513, 0.3449959, -0.06708722, 1, 0, 0, 1, 1,
-0.02839795, -0.7367225, -2.740881, 1, 0, 0, 1, 1,
-0.02805548, 0.6146542, 1.80802, 1, 0, 0, 1, 1,
-0.02562764, -0.468415, -2.058791, 0, 0, 0, 1, 1,
-0.02351117, -1.438622, -2.888382, 0, 0, 0, 1, 1,
-0.02294681, 1.643674, -0.7507129, 0, 0, 0, 1, 1,
-0.01434231, -0.9644083, -1.29807, 0, 0, 0, 1, 1,
-0.01117048, 0.3027849, -0.5228558, 0, 0, 0, 1, 1,
-0.01050586, 0.1192322, 0.2310535, 0, 0, 0, 1, 1,
-0.00834937, -1.00374, 0.04160122, 0, 0, 0, 1, 1,
-0.004885945, 0.6927462, 0.1747566, 1, 1, 1, 1, 1,
-0.001825544, 0.009219194, -1.444146, 1, 1, 1, 1, 1,
0.001290553, -0.1682189, 3.204818, 1, 1, 1, 1, 1,
0.005010189, 2.02764, -2.149903, 1, 1, 1, 1, 1,
0.007993221, -0.457381, 3.713733, 1, 1, 1, 1, 1,
0.01248123, 1.204019, 0.2254111, 1, 1, 1, 1, 1,
0.01604125, 0.03227581, -1.148906, 1, 1, 1, 1, 1,
0.01850896, -1.60603, 4.393939, 1, 1, 1, 1, 1,
0.01950526, 0.87466, 1.354638, 1, 1, 1, 1, 1,
0.02068023, -0.3605517, 1.163955, 1, 1, 1, 1, 1,
0.02074566, -0.525761, 1.936733, 1, 1, 1, 1, 1,
0.02107634, -1.23448, 2.997495, 1, 1, 1, 1, 1,
0.0269497, 0.07799724, -2.491601, 1, 1, 1, 1, 1,
0.03372877, 0.4927336, 1.259107, 1, 1, 1, 1, 1,
0.03668341, -0.09532087, 2.318686, 1, 1, 1, 1, 1,
0.03825179, 0.389225, 0.4557793, 0, 0, 1, 1, 1,
0.03936715, 0.2056005, 0.8201197, 1, 0, 0, 1, 1,
0.04189936, -0.2045606, 3.040495, 1, 0, 0, 1, 1,
0.04489177, 2.227977, 0.9466382, 1, 0, 0, 1, 1,
0.04765996, 0.6349533, -1.460723, 1, 0, 0, 1, 1,
0.04830355, -1.046238, 2.088258, 1, 0, 0, 1, 1,
0.05507386, -0.2511433, 3.608355, 0, 0, 0, 1, 1,
0.05681921, 0.2511719, 0.6886802, 0, 0, 0, 1, 1,
0.05813521, -0.7913297, 2.131887, 0, 0, 0, 1, 1,
0.05886631, 2.115224, -0.836933, 0, 0, 0, 1, 1,
0.06068731, -0.3418741, 3.955242, 0, 0, 0, 1, 1,
0.0618341, 0.7225519, 0.6807154, 0, 0, 0, 1, 1,
0.0623757, 1.179777, -0.5194603, 0, 0, 0, 1, 1,
0.06971429, -1.617381, 2.617432, 1, 1, 1, 1, 1,
0.07788064, -0.828756, 3.01741, 1, 1, 1, 1, 1,
0.08464399, 0.810768, 1.838021, 1, 1, 1, 1, 1,
0.08566298, 0.9394158, 0.4841221, 1, 1, 1, 1, 1,
0.08685808, -1.761572, 4.134303, 1, 1, 1, 1, 1,
0.08747219, -0.0895087, 1.911861, 1, 1, 1, 1, 1,
0.09119743, -0.9850677, 2.625067, 1, 1, 1, 1, 1,
0.09127299, 0.1463526, -0.2936231, 1, 1, 1, 1, 1,
0.09517194, -0.9392017, 2.246238, 1, 1, 1, 1, 1,
0.09587768, -0.5018688, 2.403573, 1, 1, 1, 1, 1,
0.09659907, -0.2348875, 3.840862, 1, 1, 1, 1, 1,
0.1001586, 1.239288, -1.670705, 1, 1, 1, 1, 1,
0.1007362, -2.016906, 1.848745, 1, 1, 1, 1, 1,
0.1020057, 0.6396863, -0.658604, 1, 1, 1, 1, 1,
0.1035643, 0.07992435, 1.445232, 1, 1, 1, 1, 1,
0.103805, -0.2688482, 2.58068, 0, 0, 1, 1, 1,
0.1051628, 1.692411, 0.4297085, 1, 0, 0, 1, 1,
0.1094263, -0.1091549, 3.61155, 1, 0, 0, 1, 1,
0.109445, 0.5825074, 0.7121373, 1, 0, 0, 1, 1,
0.1101365, 0.9701751, 0.7776304, 1, 0, 0, 1, 1,
0.1132458, 1.478422, -1.274592, 1, 0, 0, 1, 1,
0.1174755, 0.4199443, 1.439862, 0, 0, 0, 1, 1,
0.1191397, -1.705638, 2.914529, 0, 0, 0, 1, 1,
0.1214881, -0.8331035, 2.509493, 0, 0, 0, 1, 1,
0.1274439, -0.7812569, 2.068062, 0, 0, 0, 1, 1,
0.128691, 0.156706, 1.422437, 0, 0, 0, 1, 1,
0.1287738, -1.829904, 3.171546, 0, 0, 0, 1, 1,
0.1290076, 0.4774439, 1.518803, 0, 0, 0, 1, 1,
0.1356725, -0.1839591, 2.722912, 1, 1, 1, 1, 1,
0.1365616, -1.675024, 2.949367, 1, 1, 1, 1, 1,
0.1379022, -0.1022853, 2.882965, 1, 1, 1, 1, 1,
0.1422482, 1.904062, -1.194854, 1, 1, 1, 1, 1,
0.1424891, 0.4664016, 1.49542, 1, 1, 1, 1, 1,
0.1430697, -0.4381145, 3.631078, 1, 1, 1, 1, 1,
0.144493, 1.183871, 0.9623218, 1, 1, 1, 1, 1,
0.1445245, 1.076341, -0.4307649, 1, 1, 1, 1, 1,
0.1473633, 1.326782, -0.5496194, 1, 1, 1, 1, 1,
0.1522211, -0.8281227, 1.237153, 1, 1, 1, 1, 1,
0.1532085, -0.419342, 2.404519, 1, 1, 1, 1, 1,
0.1621168, 0.6032543, -1.038711, 1, 1, 1, 1, 1,
0.1627259, -0.7598194, 2.791925, 1, 1, 1, 1, 1,
0.1640199, -3.434983, 4.63428, 1, 1, 1, 1, 1,
0.1650567, -0.5918768, 2.57314, 1, 1, 1, 1, 1,
0.1653742, 1.657015, 0.4754992, 0, 0, 1, 1, 1,
0.1742226, 1.45818, -0.1122137, 1, 0, 0, 1, 1,
0.1792529, -0.6435567, 2.353618, 1, 0, 0, 1, 1,
0.1795034, -0.2197656, 2.384712, 1, 0, 0, 1, 1,
0.1796684, 0.3323222, 1.783746, 1, 0, 0, 1, 1,
0.1871466, 1.343081, 2.075414, 1, 0, 0, 1, 1,
0.1876975, -0.5039036, 1.690043, 0, 0, 0, 1, 1,
0.1903522, 0.4732468, -0.3687001, 0, 0, 0, 1, 1,
0.1909625, -0.4328644, 3.928327, 0, 0, 0, 1, 1,
0.1919781, -0.2958954, 1.698806, 0, 0, 0, 1, 1,
0.1948491, 0.6558462, 1.731666, 0, 0, 0, 1, 1,
0.200042, -1.05918, 2.372127, 0, 0, 0, 1, 1,
0.2106292, -1.871884, 2.810595, 0, 0, 0, 1, 1,
0.2117225, -1.39167, 3.851448, 1, 1, 1, 1, 1,
0.2135396, -1.412839, 4.20121, 1, 1, 1, 1, 1,
0.2154502, 0.8486991, -1.028451, 1, 1, 1, 1, 1,
0.2188191, 1.29054, -0.1578833, 1, 1, 1, 1, 1,
0.2244041, -0.738933, 3.18679, 1, 1, 1, 1, 1,
0.2275763, 1.32223, 0.6208816, 1, 1, 1, 1, 1,
0.2280702, -1.240983, 2.740348, 1, 1, 1, 1, 1,
0.231607, 0.4483683, -0.6260809, 1, 1, 1, 1, 1,
0.2316495, 0.8806927, 0.9338366, 1, 1, 1, 1, 1,
0.2348403, 0.5226048, 1.866194, 1, 1, 1, 1, 1,
0.2361769, 0.2780598, -0.4839015, 1, 1, 1, 1, 1,
0.2375422, 1.731629, -1.342984, 1, 1, 1, 1, 1,
0.2534348, 0.4720892, 0.5644624, 1, 1, 1, 1, 1,
0.254981, -0.5074987, 0.7604346, 1, 1, 1, 1, 1,
0.2559413, -1.534501, 2.751023, 1, 1, 1, 1, 1,
0.2566801, -0.251878, 2.179266, 0, 0, 1, 1, 1,
0.2589774, 0.2648431, 0.9768955, 1, 0, 0, 1, 1,
0.2654988, 1.300858, -0.7580773, 1, 0, 0, 1, 1,
0.2669612, -1.136956, 1.835412, 1, 0, 0, 1, 1,
0.2695985, 1.09048, 1.681759, 1, 0, 0, 1, 1,
0.2735803, -0.8523533, 2.909092, 1, 0, 0, 1, 1,
0.2776739, 0.7107628, 0.8873239, 0, 0, 0, 1, 1,
0.2826153, 0.02811514, 1.206399, 0, 0, 0, 1, 1,
0.2859758, 2.011964, 0.4377994, 0, 0, 0, 1, 1,
0.2863869, -1.353713, 3.497329, 0, 0, 0, 1, 1,
0.2864024, -1.340155, 2.493445, 0, 0, 0, 1, 1,
0.2882196, 0.9895235, 0.2995108, 0, 0, 0, 1, 1,
0.2902393, -0.7413764, 2.216208, 0, 0, 0, 1, 1,
0.2929402, -0.3366126, 2.334159, 1, 1, 1, 1, 1,
0.3042405, -0.3467081, 2.27958, 1, 1, 1, 1, 1,
0.3054733, -0.2732735, 1.605133, 1, 1, 1, 1, 1,
0.3054985, 0.4507868, -0.2037939, 1, 1, 1, 1, 1,
0.3079564, -0.4419269, 2.108066, 1, 1, 1, 1, 1,
0.3132052, -0.2240265, 3.1443, 1, 1, 1, 1, 1,
0.3134221, 0.2147123, 1.777719, 1, 1, 1, 1, 1,
0.3164234, -1.876597, 3.303502, 1, 1, 1, 1, 1,
0.316817, -1.336589, 5.066949, 1, 1, 1, 1, 1,
0.3195809, 0.1964444, 0.9049601, 1, 1, 1, 1, 1,
0.3210246, 1.013847, -0.5832008, 1, 1, 1, 1, 1,
0.3210748, 1.093137, 1.326983, 1, 1, 1, 1, 1,
0.3217139, -0.7337924, 0.7719786, 1, 1, 1, 1, 1,
0.3241187, -0.2123867, 2.400258, 1, 1, 1, 1, 1,
0.3266108, -0.9266434, 2.465498, 1, 1, 1, 1, 1,
0.3272897, -3.064737, 2.939719, 0, 0, 1, 1, 1,
0.3283685, 0.6913358, 0.3988563, 1, 0, 0, 1, 1,
0.3368954, 0.00437062, 0.0753403, 1, 0, 0, 1, 1,
0.3407124, 1.317342, 0.9208565, 1, 0, 0, 1, 1,
0.3407331, 0.9390099, -0.3364569, 1, 0, 0, 1, 1,
0.3497988, 1.424148, -0.1909812, 1, 0, 0, 1, 1,
0.3501342, -1.441369, 3.517625, 0, 0, 0, 1, 1,
0.3506546, -0.05249283, 2.157911, 0, 0, 0, 1, 1,
0.3521562, -0.270797, 3.452949, 0, 0, 0, 1, 1,
0.3526585, -0.4764284, 2.765921, 0, 0, 0, 1, 1,
0.358567, 0.9000217, -0.3692789, 0, 0, 0, 1, 1,
0.3588801, -1.007766, 2.93343, 0, 0, 0, 1, 1,
0.3611379, 0.5459359, -0.2258897, 0, 0, 0, 1, 1,
0.3652418, -1.264462, 1.06835, 1, 1, 1, 1, 1,
0.3654546, 0.4018184, -0.3019032, 1, 1, 1, 1, 1,
0.3706415, 0.8766114, 0.3840924, 1, 1, 1, 1, 1,
0.3760052, 0.4040691, 2.044106, 1, 1, 1, 1, 1,
0.3810723, -1.702023, 1.564618, 1, 1, 1, 1, 1,
0.3814737, -0.7842603, 4.150841, 1, 1, 1, 1, 1,
0.3822834, 1.165267, 0.1663585, 1, 1, 1, 1, 1,
0.3823094, 0.3487602, 0.6661313, 1, 1, 1, 1, 1,
0.3825155, -0.08536267, 2.727432, 1, 1, 1, 1, 1,
0.3854543, 0.3059738, 2.743822, 1, 1, 1, 1, 1,
0.3929864, 0.8173161, -0.8796628, 1, 1, 1, 1, 1,
0.393785, 0.3012224, 0.9513648, 1, 1, 1, 1, 1,
0.3949517, 1.73004, -0.5496553, 1, 1, 1, 1, 1,
0.3969449, 0.6659119, -0.5688056, 1, 1, 1, 1, 1,
0.3991218, 0.7965573, -0.6534318, 1, 1, 1, 1, 1,
0.3999534, 0.7396027, 0.06480341, 0, 0, 1, 1, 1,
0.401808, -0.3839499, 1.587753, 1, 0, 0, 1, 1,
0.4059478, 0.9463363, 1.713333, 1, 0, 0, 1, 1,
0.408606, -1.57215, 1.991834, 1, 0, 0, 1, 1,
0.4186374, -0.2012065, 2.907449, 1, 0, 0, 1, 1,
0.4193479, 0.2738904, 1.440287, 1, 0, 0, 1, 1,
0.4210185, -0.4647059, 2.873709, 0, 0, 0, 1, 1,
0.4278371, -0.5355139, 2.473717, 0, 0, 0, 1, 1,
0.4351298, 0.04995785, 1.115347, 0, 0, 0, 1, 1,
0.4353008, 1.180581, 1.088009, 0, 0, 0, 1, 1,
0.4375162, -0.1428452, 1.459491, 0, 0, 0, 1, 1,
0.4393598, 0.7362283, -0.0716882, 0, 0, 0, 1, 1,
0.4412398, 0.1021253, 0.8872437, 0, 0, 0, 1, 1,
0.4494601, 1.172701, -0.6355792, 1, 1, 1, 1, 1,
0.451527, 1.868898, 0.2973897, 1, 1, 1, 1, 1,
0.4533569, 0.6721756, 0.01184163, 1, 1, 1, 1, 1,
0.4534658, -0.1949131, 2.666909, 1, 1, 1, 1, 1,
0.4542713, -0.2062184, 3.731693, 1, 1, 1, 1, 1,
0.4595241, -1.14369, 1.007829, 1, 1, 1, 1, 1,
0.4601249, -0.2129963, 0.9270063, 1, 1, 1, 1, 1,
0.4611539, -2.59974, 3.123729, 1, 1, 1, 1, 1,
0.4634854, -1.339105, 3.426558, 1, 1, 1, 1, 1,
0.4645666, -1.291226, 2.390067, 1, 1, 1, 1, 1,
0.4661879, 0.3681818, 0.4190474, 1, 1, 1, 1, 1,
0.4701318, -1.473497, 3.738348, 1, 1, 1, 1, 1,
0.4717825, 0.1865098, 0.2455946, 1, 1, 1, 1, 1,
0.4748655, 0.5652757, -0.5087536, 1, 1, 1, 1, 1,
0.4772241, -0.6681824, 2.924912, 1, 1, 1, 1, 1,
0.4810653, 1.780177, -1.428427, 0, 0, 1, 1, 1,
0.4832841, -0.8783027, 3.78218, 1, 0, 0, 1, 1,
0.4842373, 0.7933837, 0.4777078, 1, 0, 0, 1, 1,
0.4861575, -0.9893704, 3.918705, 1, 0, 0, 1, 1,
0.4867651, -0.9410518, 2.368565, 1, 0, 0, 1, 1,
0.4870263, -0.5903084, 2.170689, 1, 0, 0, 1, 1,
0.4916778, -1.277931, 3.230085, 0, 0, 0, 1, 1,
0.4921997, -0.3533135, 1.95592, 0, 0, 0, 1, 1,
0.4997491, 0.6075767, 2.100302, 0, 0, 0, 1, 1,
0.502944, 0.5171537, 0.05671532, 0, 0, 0, 1, 1,
0.5052228, 1.154387, 1.518085, 0, 0, 0, 1, 1,
0.5071692, 0.8701702, 0.397331, 0, 0, 0, 1, 1,
0.5170869, 0.463655, 2.292558, 0, 0, 0, 1, 1,
0.5176328, 0.007583815, 2.175859, 1, 1, 1, 1, 1,
0.5255767, -0.2036201, 3.610833, 1, 1, 1, 1, 1,
0.5283608, -1.172432, 1.497782, 1, 1, 1, 1, 1,
0.5339535, -0.1292167, 3.251765, 1, 1, 1, 1, 1,
0.5357212, 0.8470538, -0.2471312, 1, 1, 1, 1, 1,
0.5371364, 0.3856059, -0.111704, 1, 1, 1, 1, 1,
0.5393954, -1.084094, 3.653126, 1, 1, 1, 1, 1,
0.539878, -1.543051, 3.25909, 1, 1, 1, 1, 1,
0.5450868, 1.073301, 2.058777, 1, 1, 1, 1, 1,
0.5466515, -0.8182944, 2.309261, 1, 1, 1, 1, 1,
0.5509225, 0.3794893, 0.01483367, 1, 1, 1, 1, 1,
0.5603729, 2.02691, 1.471187, 1, 1, 1, 1, 1,
0.5610026, 0.3627458, 0.8744035, 1, 1, 1, 1, 1,
0.566892, 1.380862, 0.5248073, 1, 1, 1, 1, 1,
0.5672665, -0.5281557, 2.660458, 1, 1, 1, 1, 1,
0.5694157, 0.1704377, 1.286995, 0, 0, 1, 1, 1,
0.577419, -0.4194803, 2.135924, 1, 0, 0, 1, 1,
0.5790607, 0.1368513, -0.0842703, 1, 0, 0, 1, 1,
0.5791948, 1.434532, -1.006312, 1, 0, 0, 1, 1,
0.5795209, 0.2982855, 1.458941, 1, 0, 0, 1, 1,
0.5884796, 1.406065, 0.7684239, 1, 0, 0, 1, 1,
0.5903714, 2.445522, 0.8370354, 0, 0, 0, 1, 1,
0.5906421, -0.3390204, 4.21924, 0, 0, 0, 1, 1,
0.6068752, 0.6095552, -0.2772996, 0, 0, 0, 1, 1,
0.6108561, -0.9973888, 1.311361, 0, 0, 0, 1, 1,
0.6112067, -1.13687, 3.535574, 0, 0, 0, 1, 1,
0.612716, 1.399662, 0.0576039, 0, 0, 0, 1, 1,
0.6132488, 0.6609582, -1.843949, 0, 0, 0, 1, 1,
0.6134948, -0.4209365, 0.8587065, 1, 1, 1, 1, 1,
0.6139838, -0.1122848, 0.8849182, 1, 1, 1, 1, 1,
0.6149404, 1.3047, -0.37685, 1, 1, 1, 1, 1,
0.6171702, 0.6052484, -0.3035436, 1, 1, 1, 1, 1,
0.6208883, 0.7454311, 2.845258, 1, 1, 1, 1, 1,
0.6214173, 0.2956986, 1.523768, 1, 1, 1, 1, 1,
0.6224532, -0.2399341, 2.882293, 1, 1, 1, 1, 1,
0.6226242, -0.8230768, 3.32664, 1, 1, 1, 1, 1,
0.6230091, 0.08336245, 0.8657384, 1, 1, 1, 1, 1,
0.6266366, 0.286481, 1.597487, 1, 1, 1, 1, 1,
0.6276451, 1.654543, -0.01589075, 1, 1, 1, 1, 1,
0.6319435, -0.2608913, 1.530698, 1, 1, 1, 1, 1,
0.6366675, -1.072614, 1.284736, 1, 1, 1, 1, 1,
0.6367645, 1.574066, 0.06891622, 1, 1, 1, 1, 1,
0.6389768, -0.8399906, 2.628644, 1, 1, 1, 1, 1,
0.6404063, 0.2476093, 1.137261, 0, 0, 1, 1, 1,
0.6409169, -0.4775894, 1.778628, 1, 0, 0, 1, 1,
0.6444524, 0.07559285, 1.15973, 1, 0, 0, 1, 1,
0.6477914, 0.1596077, 2.254054, 1, 0, 0, 1, 1,
0.6490657, -1.790818, 1.928908, 1, 0, 0, 1, 1,
0.6500227, -0.3042147, 3.043917, 1, 0, 0, 1, 1,
0.6606591, -2.828539, 4.550496, 0, 0, 0, 1, 1,
0.660759, 0.4756576, 3.140805, 0, 0, 0, 1, 1,
0.6689864, 1.440654, -0.5758865, 0, 0, 0, 1, 1,
0.6690227, 0.2130532, 0.8571086, 0, 0, 0, 1, 1,
0.6701211, 0.8536735, 0.4919218, 0, 0, 0, 1, 1,
0.6716597, 1.455, 1.222288, 0, 0, 0, 1, 1,
0.6747302, -0.3011551, 1.833064, 0, 0, 0, 1, 1,
0.6756178, 1.874564, -0.3361116, 1, 1, 1, 1, 1,
0.6765046, -0.7771923, 2.407095, 1, 1, 1, 1, 1,
0.680584, 0.5227252, 1.488043, 1, 1, 1, 1, 1,
0.6824818, -0.1389206, 2.55233, 1, 1, 1, 1, 1,
0.6834134, -1.206236, 2.920459, 1, 1, 1, 1, 1,
0.6866918, 0.6729776, -1.273471, 1, 1, 1, 1, 1,
0.6904033, -0.7160891, 1.468575, 1, 1, 1, 1, 1,
0.7024927, 0.06008513, 1.8583, 1, 1, 1, 1, 1,
0.7080504, -0.03333343, -0.4897124, 1, 1, 1, 1, 1,
0.7083548, -0.6355342, 2.477835, 1, 1, 1, 1, 1,
0.7120577, -0.09843771, 3.140328, 1, 1, 1, 1, 1,
0.7126997, -0.270009, 1.076967, 1, 1, 1, 1, 1,
0.7209265, -1.594309, 2.084731, 1, 1, 1, 1, 1,
0.7245005, -1.534985, 1.412534, 1, 1, 1, 1, 1,
0.7275422, 0.5439236, 0.8526202, 1, 1, 1, 1, 1,
0.7305338, -1.096706, 2.46698, 0, 0, 1, 1, 1,
0.7417085, 0.03269224, 0.8938428, 1, 0, 0, 1, 1,
0.7475156, -1.706718, 2.357442, 1, 0, 0, 1, 1,
0.7493715, -0.8088856, 1.60095, 1, 0, 0, 1, 1,
0.7514609, 1.071081, 0.2220491, 1, 0, 0, 1, 1,
0.7525938, 0.3095038, 2.486156, 1, 0, 0, 1, 1,
0.756546, 0.4891581, 0.4971711, 0, 0, 0, 1, 1,
0.7569242, -0.2631101, 2.232196, 0, 0, 0, 1, 1,
0.7637217, -0.7303007, 2.063512, 0, 0, 0, 1, 1,
0.7717109, 0.09845446, 0.1733795, 0, 0, 0, 1, 1,
0.7757709, 1.022396, 2.105467, 0, 0, 0, 1, 1,
0.7759392, 0.09130076, 1.683426, 0, 0, 0, 1, 1,
0.7823266, -1.033016, 1.37718, 0, 0, 0, 1, 1,
0.7824883, 0.7720116, -1.052682, 1, 1, 1, 1, 1,
0.7825788, 1.69423, -0.05356315, 1, 1, 1, 1, 1,
0.7906736, 1.02141, 2.090947, 1, 1, 1, 1, 1,
0.7953804, 1.136857, 2.868448, 1, 1, 1, 1, 1,
0.7970946, -0.4375442, 0.7719374, 1, 1, 1, 1, 1,
0.7993323, 0.6504334, 0.7935899, 1, 1, 1, 1, 1,
0.8018385, -1.110188, 1.755017, 1, 1, 1, 1, 1,
0.8061846, -1.09222, 3.74853, 1, 1, 1, 1, 1,
0.8070699, 0.4964066, 0.2503532, 1, 1, 1, 1, 1,
0.8081008, -1.50683, 4.056232, 1, 1, 1, 1, 1,
0.8105888, 0.6461565, 0.1952857, 1, 1, 1, 1, 1,
0.8183933, -0.4905156, 1.922925, 1, 1, 1, 1, 1,
0.819708, 0.7599426, -0.2786568, 1, 1, 1, 1, 1,
0.8226768, -0.5285913, 0.6035903, 1, 1, 1, 1, 1,
0.8246104, -0.3559973, 1.474701, 1, 1, 1, 1, 1,
0.8269811, -1.363492, 2.013825, 0, 0, 1, 1, 1,
0.8274401, 0.8719964, 1.394236, 1, 0, 0, 1, 1,
0.8316086, 0.4181254, -1.028134, 1, 0, 0, 1, 1,
0.8521475, 1.70961, 0.3773127, 1, 0, 0, 1, 1,
0.8593919, 0.1554599, 0.8193365, 1, 0, 0, 1, 1,
0.8605624, 0.0518691, 1.240761, 1, 0, 0, 1, 1,
0.8640999, 0.4190783, 0.9903789, 0, 0, 0, 1, 1,
0.8674053, 0.5992166, 0.3086721, 0, 0, 0, 1, 1,
0.8705585, 0.3372158, 2.197793, 0, 0, 0, 1, 1,
0.8714073, 0.8978941, 2.081218, 0, 0, 0, 1, 1,
0.8793942, -0.1325394, 1.583924, 0, 0, 0, 1, 1,
0.8821964, 1.846171, -0.2180814, 0, 0, 0, 1, 1,
0.8917271, -0.2265095, 2.649808, 0, 0, 0, 1, 1,
0.8976929, 0.0579964, 0.4630368, 1, 1, 1, 1, 1,
0.898775, -0.9947161, 3.08768, 1, 1, 1, 1, 1,
0.9009984, -1.594689, 2.857778, 1, 1, 1, 1, 1,
0.9023083, -0.6644139, 2.269525, 1, 1, 1, 1, 1,
0.9043759, 0.3977209, 1.868954, 1, 1, 1, 1, 1,
0.9055846, 0.09520743, 0.6428668, 1, 1, 1, 1, 1,
0.9106116, -1.088685, 1.509508, 1, 1, 1, 1, 1,
0.9197513, -0.4816077, 1.616168, 1, 1, 1, 1, 1,
0.9201993, -0.5645683, 1.077459, 1, 1, 1, 1, 1,
0.9244748, -1.100034, 2.597913, 1, 1, 1, 1, 1,
0.9273279, 0.637387, 1.419552, 1, 1, 1, 1, 1,
0.9293853, -0.600855, 2.050338, 1, 1, 1, 1, 1,
0.9298462, 0.2081402, -0.05244347, 1, 1, 1, 1, 1,
0.9306927, -0.5450726, 4.016922, 1, 1, 1, 1, 1,
0.9318138, -0.6057952, 3.067099, 1, 1, 1, 1, 1,
0.9319634, -0.7639245, 1.588124, 0, 0, 1, 1, 1,
0.9343498, 0.8613793, 0.08025581, 1, 0, 0, 1, 1,
0.9348049, -0.0184253, -1.132575, 1, 0, 0, 1, 1,
0.9377533, 0.1174835, 0.2022546, 1, 0, 0, 1, 1,
0.9415264, -0.9911599, 1.983158, 1, 0, 0, 1, 1,
0.9450759, 1.456074, 0.4115465, 1, 0, 0, 1, 1,
0.9526067, -1.536525, 3.090004, 0, 0, 0, 1, 1,
0.9576228, -0.6876353, 3.821673, 0, 0, 0, 1, 1,
0.9699328, -2.071445, 2.783407, 0, 0, 0, 1, 1,
0.9763989, 0.8685565, 3.018024, 0, 0, 0, 1, 1,
0.9783081, 0.6789744, 0.4012656, 0, 0, 0, 1, 1,
0.979837, -0.5058805, 2.173763, 0, 0, 0, 1, 1,
0.9898416, 1.025288, -0.1682446, 0, 0, 0, 1, 1,
0.9903495, 1.80143, 0.7456263, 1, 1, 1, 1, 1,
0.9934178, -0.88107, 3.583985, 1, 1, 1, 1, 1,
0.9991384, 0.407064, 1.479496, 1, 1, 1, 1, 1,
1.008939, 0.06906576, 2.910015, 1, 1, 1, 1, 1,
1.009089, 0.3878103, -0.4578026, 1, 1, 1, 1, 1,
1.011931, -0.9613908, 1.384255, 1, 1, 1, 1, 1,
1.011949, -1.887357, 1.967938, 1, 1, 1, 1, 1,
1.018036, -1.250617, 1.424086, 1, 1, 1, 1, 1,
1.018794, 0.4232908, 0.6201218, 1, 1, 1, 1, 1,
1.033765, -1.394124, 2.171163, 1, 1, 1, 1, 1,
1.039772, -0.6606459, 2.890485, 1, 1, 1, 1, 1,
1.04159, -0.3594311, 2.051436, 1, 1, 1, 1, 1,
1.044612, -0.00402975, 0.8832041, 1, 1, 1, 1, 1,
1.046417, -0.6540192, 2.393258, 1, 1, 1, 1, 1,
1.046563, 0.1432352, 0.5784995, 1, 1, 1, 1, 1,
1.049006, 0.3006387, 1.662758, 0, 0, 1, 1, 1,
1.049435, -1.526461, 2.665909, 1, 0, 0, 1, 1,
1.058639, -1.288413, 1.63904, 1, 0, 0, 1, 1,
1.060636, 0.3343632, 1.530561, 1, 0, 0, 1, 1,
1.065334, 1.302496, 0.5985162, 1, 0, 0, 1, 1,
1.066063, -1.34811, 2.320761, 1, 0, 0, 1, 1,
1.068922, -0.03419125, 0.03408759, 0, 0, 0, 1, 1,
1.069503, -0.4405531, 2.990549, 0, 0, 0, 1, 1,
1.075532, -0.6522352, 1.556175, 0, 0, 0, 1, 1,
1.080838, 0.2725033, 1.280719, 0, 0, 0, 1, 1,
1.083194, 1.376154, 1.850249, 0, 0, 0, 1, 1,
1.090699, 0.3773166, 1.384344, 0, 0, 0, 1, 1,
1.096534, 1.37732, -1.007023, 0, 0, 0, 1, 1,
1.102839, -0.8210662, 2.280526, 1, 1, 1, 1, 1,
1.106449, -1.07391, 4.354244, 1, 1, 1, 1, 1,
1.107183, -0.01082066, 0.1373148, 1, 1, 1, 1, 1,
1.10838, -0.9140161, 2.631423, 1, 1, 1, 1, 1,
1.110973, -0.1703716, 2.223037, 1, 1, 1, 1, 1,
1.132495, 0.4027315, 1.690287, 1, 1, 1, 1, 1,
1.142753, 0.3169818, 0.9433792, 1, 1, 1, 1, 1,
1.148382, 0.770464, -0.1950525, 1, 1, 1, 1, 1,
1.149344, -0.09589915, 0.7511286, 1, 1, 1, 1, 1,
1.15059, 1.0435, -0.3505821, 1, 1, 1, 1, 1,
1.151165, 0.4062884, 1.443378, 1, 1, 1, 1, 1,
1.155727, 0.2304, 2.330114, 1, 1, 1, 1, 1,
1.174278, -1.385205, 4.207071, 1, 1, 1, 1, 1,
1.177044, -2.471437, 2.613268, 1, 1, 1, 1, 1,
1.178927, -0.4254416, 1.537303, 1, 1, 1, 1, 1,
1.180669, -0.08459326, 1.094475, 0, 0, 1, 1, 1,
1.183394, -0.09728357, 2.490797, 1, 0, 0, 1, 1,
1.186236, -1.041806, 1.394547, 1, 0, 0, 1, 1,
1.194811, -1.995438, 2.478776, 1, 0, 0, 1, 1,
1.195527, -0.6823401, 1.802823, 1, 0, 0, 1, 1,
1.196922, 0.2810843, 0.9736999, 1, 0, 0, 1, 1,
1.211639, -0.9998096, 2.643633, 0, 0, 0, 1, 1,
1.212536, 1.586378, -1.437184, 0, 0, 0, 1, 1,
1.218705, -0.5307304, 1.622738, 0, 0, 0, 1, 1,
1.221266, 1.684438, 0.8130841, 0, 0, 0, 1, 1,
1.221584, -0.8595397, 3.745953, 0, 0, 0, 1, 1,
1.233173, -0.9494792, 1.92388, 0, 0, 0, 1, 1,
1.246843, -1.7769, 0.7123206, 0, 0, 0, 1, 1,
1.250067, 0.8206726, 0.7455698, 1, 1, 1, 1, 1,
1.252441, 1.472614, 0.8087416, 1, 1, 1, 1, 1,
1.254167, 0.8010199, 1.418736, 1, 1, 1, 1, 1,
1.254531, -0.4841535, 2.509665, 1, 1, 1, 1, 1,
1.264929, 0.02805224, 1.945364, 1, 1, 1, 1, 1,
1.276615, 0.8138316, 2.526392, 1, 1, 1, 1, 1,
1.277823, -0.233174, 1.968362, 1, 1, 1, 1, 1,
1.284662, -0.5696608, 2.060694, 1, 1, 1, 1, 1,
1.284724, -2.041115, 3.995102, 1, 1, 1, 1, 1,
1.289729, -0.6349322, 1.79722, 1, 1, 1, 1, 1,
1.291861, -0.5203713, 2.766623, 1, 1, 1, 1, 1,
1.2941, -0.5739124, 0.7514531, 1, 1, 1, 1, 1,
1.296485, 1.695199, 0.001242365, 1, 1, 1, 1, 1,
1.301407, -0.3048556, 1.934364, 1, 1, 1, 1, 1,
1.30223, 0.3054415, 0.9101715, 1, 1, 1, 1, 1,
1.302421, -0.4449154, 1.474945, 0, 0, 1, 1, 1,
1.312295, 1.094618, -0.05522259, 1, 0, 0, 1, 1,
1.312792, 0.1852231, 1.302827, 1, 0, 0, 1, 1,
1.313822, 1.24858, 1.488205, 1, 0, 0, 1, 1,
1.316866, -0.05850697, 2.741522, 1, 0, 0, 1, 1,
1.328711, -0.1674626, 4.285466, 1, 0, 0, 1, 1,
1.330954, 0.06159319, 0.8299621, 0, 0, 0, 1, 1,
1.342675, -0.4721383, 2.618576, 0, 0, 0, 1, 1,
1.343356, 1.196742, 0.7986238, 0, 0, 0, 1, 1,
1.351058, -0.5709568, 0.2942138, 0, 0, 0, 1, 1,
1.371946, 0.7041356, 2.205267, 0, 0, 0, 1, 1,
1.384767, -0.8153666, 2.504947, 0, 0, 0, 1, 1,
1.38583, -0.5753582, 1.714805, 0, 0, 0, 1, 1,
1.389314, -0.8783284, 1.065595, 1, 1, 1, 1, 1,
1.389876, -0.4716346, 2.665825, 1, 1, 1, 1, 1,
1.392039, 0.9203134, 1.537232, 1, 1, 1, 1, 1,
1.401161, 0.4266226, 2.560036, 1, 1, 1, 1, 1,
1.410413, 0.7408087, -0.6832148, 1, 1, 1, 1, 1,
1.414054, 0.2120971, 0.7176505, 1, 1, 1, 1, 1,
1.422524, -0.2428975, 1.640599, 1, 1, 1, 1, 1,
1.423695, -0.05905386, 0.8908623, 1, 1, 1, 1, 1,
1.42401, 0.1974144, 2.503105, 1, 1, 1, 1, 1,
1.426583, -0.7086819, 1.087454, 1, 1, 1, 1, 1,
1.428201, 0.2511536, 0.9692063, 1, 1, 1, 1, 1,
1.432214, -0.7841045, 0.8976898, 1, 1, 1, 1, 1,
1.434754, -1.194686, 1.918279, 1, 1, 1, 1, 1,
1.439966, -0.9868861, 0.9974709, 1, 1, 1, 1, 1,
1.446706, 0.7823863, 2.825261, 1, 1, 1, 1, 1,
1.451101, 0.9529805, 0.217056, 0, 0, 1, 1, 1,
1.45146, 1.212367, 0.2361549, 1, 0, 0, 1, 1,
1.457538, 0.6082208, 1.251181, 1, 0, 0, 1, 1,
1.460175, -0.3807361, 0.7153578, 1, 0, 0, 1, 1,
1.46669, -0.2957674, 1.147447, 1, 0, 0, 1, 1,
1.468115, -0.3437546, 1.360378, 1, 0, 0, 1, 1,
1.468126, 2.14501, 1.460336, 0, 0, 0, 1, 1,
1.470452, -0.826959, 2.896077, 0, 0, 0, 1, 1,
1.471221, 0.6281879, 1.987254, 0, 0, 0, 1, 1,
1.477066, -0.09909113, 3.446742, 0, 0, 0, 1, 1,
1.477114, -0.2257706, 2.834742, 0, 0, 0, 1, 1,
1.48937, 0.8947674, 0.6574207, 0, 0, 0, 1, 1,
1.516385, 1.171673, 1.83924, 0, 0, 0, 1, 1,
1.528362, 1.700549, 1.684787, 1, 1, 1, 1, 1,
1.54343, 0.3914482, 2.879386, 1, 1, 1, 1, 1,
1.543875, -1.681442, 0.7659028, 1, 1, 1, 1, 1,
1.547796, 1.60371, 0.6725008, 1, 1, 1, 1, 1,
1.55614, 1.096254, 0.2221066, 1, 1, 1, 1, 1,
1.5603, -1.624024, 2.361297, 1, 1, 1, 1, 1,
1.564336, 0.7846109, -0.7117568, 1, 1, 1, 1, 1,
1.569324, -1.466216, 2.893571, 1, 1, 1, 1, 1,
1.573774, -0.4991491, 1.875896, 1, 1, 1, 1, 1,
1.579066, 0.001647747, -0.7510814, 1, 1, 1, 1, 1,
1.586177, 1.004998, -0.7950286, 1, 1, 1, 1, 1,
1.606933, 1.255263, -0.2503903, 1, 1, 1, 1, 1,
1.612674, 0.6631429, 1.227799, 1, 1, 1, 1, 1,
1.623301, 1.041101, 1.700586, 1, 1, 1, 1, 1,
1.631768, -0.4159413, 0.9995405, 1, 1, 1, 1, 1,
1.63636, -0.7228814, 1.744567, 0, 0, 1, 1, 1,
1.637837, 0.08833519, 0.04569985, 1, 0, 0, 1, 1,
1.643954, -0.3674533, 3.732246, 1, 0, 0, 1, 1,
1.658919, -0.5208864, 1.057094, 1, 0, 0, 1, 1,
1.673383, 0.3063442, 1.970104, 1, 0, 0, 1, 1,
1.674085, 0.6978806, 2.111425, 1, 0, 0, 1, 1,
1.677922, 0.9725649, 3.089836, 0, 0, 0, 1, 1,
1.693269, 0.2312839, 0.8832936, 0, 0, 0, 1, 1,
1.710625, 1.528454, -1.134884, 0, 0, 0, 1, 1,
1.728402, -0.1436701, 2.140376, 0, 0, 0, 1, 1,
1.732679, -0.9737648, 2.126108, 0, 0, 0, 1, 1,
1.737935, 1.348926, 1.169948, 0, 0, 0, 1, 1,
1.762471, -0.4150687, 2.100957, 0, 0, 0, 1, 1,
1.76313, -0.7122226, 3.588126, 1, 1, 1, 1, 1,
1.773264, 0.0103142, 0.7389511, 1, 1, 1, 1, 1,
1.783424, 1.106742, 1.878187, 1, 1, 1, 1, 1,
1.784083, -1.686855, 2.319054, 1, 1, 1, 1, 1,
1.791338, -0.4287281, 0.2976671, 1, 1, 1, 1, 1,
1.797949, -0.4960859, 1.115892, 1, 1, 1, 1, 1,
1.819015, -0.5843, 3.734204, 1, 1, 1, 1, 1,
1.841828, -0.8168488, 1.152965, 1, 1, 1, 1, 1,
1.842491, 0.4997525, 1.658364, 1, 1, 1, 1, 1,
1.847368, 0.2467171, 1.024631, 1, 1, 1, 1, 1,
1.875488, 0.3396793, 0.7093112, 1, 1, 1, 1, 1,
1.89923, -0.03807728, 1.755993, 1, 1, 1, 1, 1,
1.932821, -0.4126588, 0.5127938, 1, 1, 1, 1, 1,
1.949916, -0.3239417, 0.04705932, 1, 1, 1, 1, 1,
1.96027, -0.9923266, 1.178814, 1, 1, 1, 1, 1,
1.961692, -2.300576, 4.235805, 0, 0, 1, 1, 1,
1.966654, -0.837309, 0.8373985, 1, 0, 0, 1, 1,
2.020321, 2.191757, 0.5436828, 1, 0, 0, 1, 1,
2.032873, 0.6291174, 1.95741, 1, 0, 0, 1, 1,
2.034386, -0.1202913, 2.039948, 1, 0, 0, 1, 1,
2.079426, 0.6792005, 1.883785, 1, 0, 0, 1, 1,
2.085647, -1.391775, 2.295394, 0, 0, 0, 1, 1,
2.100561, 0.2073226, -0.6859757, 0, 0, 0, 1, 1,
2.117394, 0.8123443, 2.171876, 0, 0, 0, 1, 1,
2.225407, -0.1326998, 2.593162, 0, 0, 0, 1, 1,
2.251876, -0.007317081, 1.965415, 0, 0, 0, 1, 1,
2.30157, -0.4910936, 2.425475, 0, 0, 0, 1, 1,
2.40256, 0.2342689, -0.03254062, 0, 0, 0, 1, 1,
2.476114, 0.3005323, 1.345391, 1, 1, 1, 1, 1,
2.547692, -1.26826, 2.06353, 1, 1, 1, 1, 1,
2.581837, -0.4104403, 2.387465, 1, 1, 1, 1, 1,
2.618432, -0.8099514, 1.989776, 1, 1, 1, 1, 1,
2.620597, 1.006299, 0.8625261, 1, 1, 1, 1, 1,
2.734858, 0.3416276, 3.30347, 1, 1, 1, 1, 1,
2.939567, 0.5834725, 2.655981, 1, 1, 1, 1, 1
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
var radius = 9.271196;
var distance = 32.56468;
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
mvMatrix.translate( 0.355949, 0.4947305, 0.02075958 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.56468);
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
