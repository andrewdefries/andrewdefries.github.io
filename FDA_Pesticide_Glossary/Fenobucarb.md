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
-3.597187, -1.404744, -2.400621, 1, 0, 0, 1,
-3.348296, -0.04393208, -2.627444, 1, 0.007843138, 0, 1,
-3.118328, -0.7269834, -2.431516, 1, 0.01176471, 0, 1,
-3.049114, 1.289282, -1.848573, 1, 0.01960784, 0, 1,
-2.925712, 0.4562822, -0.5072066, 1, 0.02352941, 0, 1,
-2.814251, 0.2812347, -2.252859, 1, 0.03137255, 0, 1,
-2.784663, -0.2078754, -1.797292, 1, 0.03529412, 0, 1,
-2.760291, 2.387543, -1.788075, 1, 0.04313726, 0, 1,
-2.753949, -0.2623288, -1.097365, 1, 0.04705882, 0, 1,
-2.670324, 0.8924521, -2.758671, 1, 0.05490196, 0, 1,
-2.617104, 0.1998905, -2.458611, 1, 0.05882353, 0, 1,
-2.545351, 1.310567, 0.3323282, 1, 0.06666667, 0, 1,
-2.507532, -1.246127, -0.1936304, 1, 0.07058824, 0, 1,
-2.454145, 0.2188449, -1.337202, 1, 0.07843138, 0, 1,
-2.438385, 0.005130684, -1.88761, 1, 0.08235294, 0, 1,
-2.404525, -1.087808, -1.636558, 1, 0.09019608, 0, 1,
-2.394427, 1.407102, -1.798037, 1, 0.09411765, 0, 1,
-2.328806, -0.08653655, -1.461217, 1, 0.1019608, 0, 1,
-2.321908, 0.2828617, -1.522029, 1, 0.1098039, 0, 1,
-2.256009, 0.3424517, -1.654572, 1, 0.1137255, 0, 1,
-2.255005, -0.3389091, -2.67937, 1, 0.1215686, 0, 1,
-2.253255, -0.3540877, -0.07366384, 1, 0.1254902, 0, 1,
-2.234977, -0.1286173, -3.428725, 1, 0.1333333, 0, 1,
-2.202345, 1.894344, -0.4863997, 1, 0.1372549, 0, 1,
-2.173404, -0.1139502, -1.694266, 1, 0.145098, 0, 1,
-2.166722, 0.422319, -1.071201, 1, 0.1490196, 0, 1,
-2.163925, 0.447472, -2.327391, 1, 0.1568628, 0, 1,
-2.152049, 1.455759, -0.4856481, 1, 0.1607843, 0, 1,
-2.144756, -0.3308775, -1.317264, 1, 0.1686275, 0, 1,
-2.09856, -0.8316758, -1.144003, 1, 0.172549, 0, 1,
-2.050663, -0.04786595, -2.68752, 1, 0.1803922, 0, 1,
-2.010229, 0.3947596, -2.264549, 1, 0.1843137, 0, 1,
-1.994541, -0.7778127, -1.486288, 1, 0.1921569, 0, 1,
-1.985984, 0.2298307, 0.006788256, 1, 0.1960784, 0, 1,
-1.96361, 0.05168479, -2.603846, 1, 0.2039216, 0, 1,
-1.945542, 2.076677, -1.05258, 1, 0.2117647, 0, 1,
-1.901858, 0.2750864, -0.8458281, 1, 0.2156863, 0, 1,
-1.893999, 1.251305, -0.5056183, 1, 0.2235294, 0, 1,
-1.885013, -1.094959, -1.699988, 1, 0.227451, 0, 1,
-1.873605, 1.511706, 0.01283905, 1, 0.2352941, 0, 1,
-1.856149, 0.4113892, 0.4269035, 1, 0.2392157, 0, 1,
-1.851718, -0.3297465, -2.628637, 1, 0.2470588, 0, 1,
-1.84136, 0.26772, -2.884932, 1, 0.2509804, 0, 1,
-1.814697, -0.5651394, -0.6865093, 1, 0.2588235, 0, 1,
-1.807521, -1.675286, -1.562412, 1, 0.2627451, 0, 1,
-1.804864, 0.07812558, -2.937786, 1, 0.2705882, 0, 1,
-1.792242, -0.4565164, -1.413323, 1, 0.2745098, 0, 1,
-1.785715, 2.583456, 1.704202, 1, 0.282353, 0, 1,
-1.780661, -1.688581, -2.098403, 1, 0.2862745, 0, 1,
-1.763393, -1.121484, -2.623778, 1, 0.2941177, 0, 1,
-1.758187, 0.5715762, -1.771333, 1, 0.3019608, 0, 1,
-1.742809, 0.06208477, 0.5670907, 1, 0.3058824, 0, 1,
-1.729839, 0.7404506, -3.592614, 1, 0.3137255, 0, 1,
-1.718392, -1.235062, -1.525169, 1, 0.3176471, 0, 1,
-1.695814, 1.019166, 0.2929131, 1, 0.3254902, 0, 1,
-1.686789, 0.2481913, -2.707252, 1, 0.3294118, 0, 1,
-1.684608, 0.6732296, -0.8170031, 1, 0.3372549, 0, 1,
-1.676404, -0.6297719, -1.682682, 1, 0.3411765, 0, 1,
-1.648255, 0.04731449, -2.716598, 1, 0.3490196, 0, 1,
-1.6436, 0.2104837, -1.419688, 1, 0.3529412, 0, 1,
-1.639948, 1.389664, -1.585284, 1, 0.3607843, 0, 1,
-1.616105, -1.857993, -2.742696, 1, 0.3647059, 0, 1,
-1.611865, -1.33147, -2.349844, 1, 0.372549, 0, 1,
-1.582009, -1.166531, -1.188716, 1, 0.3764706, 0, 1,
-1.539765, 1.411106, -0.02221199, 1, 0.3843137, 0, 1,
-1.539477, 0.7468001, -0.09142295, 1, 0.3882353, 0, 1,
-1.527825, -1.189238, -3.179155, 1, 0.3960784, 0, 1,
-1.52774, 0.811484, -1.32766, 1, 0.4039216, 0, 1,
-1.523659, -0.927315, -0.7575505, 1, 0.4078431, 0, 1,
-1.522915, -1.090038, -1.892665, 1, 0.4156863, 0, 1,
-1.522415, -0.3577785, -1.545371, 1, 0.4196078, 0, 1,
-1.5147, 0.250059, -0.696757, 1, 0.427451, 0, 1,
-1.51097, -0.2243843, 0.9792979, 1, 0.4313726, 0, 1,
-1.492204, -0.7644209, -2.985529, 1, 0.4392157, 0, 1,
-1.48917, -0.2995508, -1.464116, 1, 0.4431373, 0, 1,
-1.462147, -1.151198, -2.556133, 1, 0.4509804, 0, 1,
-1.458474, 0.1190628, -3.232773, 1, 0.454902, 0, 1,
-1.455553, 3.50709, 0.1329581, 1, 0.4627451, 0, 1,
-1.449884, -0.3295312, -1.221513, 1, 0.4666667, 0, 1,
-1.43905, 0.9474846, -0.0838004, 1, 0.4745098, 0, 1,
-1.408823, 0.867246, -0.5687298, 1, 0.4784314, 0, 1,
-1.389145, -0.5043979, -2.405753, 1, 0.4862745, 0, 1,
-1.371239, 0.8024399, -0.1053655, 1, 0.4901961, 0, 1,
-1.358461, -0.3171945, -2.597238, 1, 0.4980392, 0, 1,
-1.355141, -0.2902826, -1.12728, 1, 0.5058824, 0, 1,
-1.353262, 0.5871707, -1.617979, 1, 0.509804, 0, 1,
-1.347844, 1.977454, -1.374808, 1, 0.5176471, 0, 1,
-1.34291, 0.4368822, -3.37095, 1, 0.5215687, 0, 1,
-1.334114, -1.972583, -2.550709, 1, 0.5294118, 0, 1,
-1.333242, 0.1599901, -1.711696, 1, 0.5333334, 0, 1,
-1.330099, -1.866618, -4.186445, 1, 0.5411765, 0, 1,
-1.323294, -3.497062, -3.09932, 1, 0.5450981, 0, 1,
-1.321244, 2.047506, -1.659655, 1, 0.5529412, 0, 1,
-1.320531, -0.07039571, -3.203857, 1, 0.5568628, 0, 1,
-1.314631, 0.3030513, -0.7635458, 1, 0.5647059, 0, 1,
-1.307628, 0.3425925, -3.95118, 1, 0.5686275, 0, 1,
-1.298763, -0.6209249, -2.688062, 1, 0.5764706, 0, 1,
-1.287842, -0.1074675, -2.951506, 1, 0.5803922, 0, 1,
-1.278637, 0.2400882, -0.3177751, 1, 0.5882353, 0, 1,
-1.259847, 0.6361333, -1.268044, 1, 0.5921569, 0, 1,
-1.254594, 0.1000001, -0.687593, 1, 0.6, 0, 1,
-1.249182, 0.581533, -2.030008, 1, 0.6078432, 0, 1,
-1.239427, -1.404308, -3.933992, 1, 0.6117647, 0, 1,
-1.21884, 0.4076412, -1.941025, 1, 0.6196079, 0, 1,
-1.21721, -1.178041, -1.90227, 1, 0.6235294, 0, 1,
-1.216285, 1.499353, -0.2142021, 1, 0.6313726, 0, 1,
-1.214586, 1.035655, -0.3175122, 1, 0.6352941, 0, 1,
-1.212454, -0.4391129, -3.148402, 1, 0.6431373, 0, 1,
-1.212399, 0.2010948, -1.145516, 1, 0.6470588, 0, 1,
-1.209821, 0.07339807, -0.9470599, 1, 0.654902, 0, 1,
-1.202882, -0.02008818, -2.877925, 1, 0.6588235, 0, 1,
-1.19943, 0.3702545, -0.7565378, 1, 0.6666667, 0, 1,
-1.198344, 0.883173, -1.408759, 1, 0.6705883, 0, 1,
-1.196979, 0.6452075, -2.079791, 1, 0.6784314, 0, 1,
-1.184497, 1.03638, -1.141297, 1, 0.682353, 0, 1,
-1.18146, 0.8183293, -0.9780098, 1, 0.6901961, 0, 1,
-1.17548, -0.04213556, -0.8190906, 1, 0.6941177, 0, 1,
-1.174206, -1.098724, -2.340205, 1, 0.7019608, 0, 1,
-1.172737, -0.8358465, -1.478623, 1, 0.7098039, 0, 1,
-1.170172, -0.5163035, -2.080345, 1, 0.7137255, 0, 1,
-1.164649, 0.2300442, -1.396018, 1, 0.7215686, 0, 1,
-1.146217, 0.5299245, -1.894094, 1, 0.7254902, 0, 1,
-1.142628, -0.09907435, -1.30121, 1, 0.7333333, 0, 1,
-1.142369, -1.444857, -3.8059, 1, 0.7372549, 0, 1,
-1.135574, -1.154731, -4.071034, 1, 0.7450981, 0, 1,
-1.121928, 2.045467, 0.1080584, 1, 0.7490196, 0, 1,
-1.121722, 0.5608322, -0.8983123, 1, 0.7568628, 0, 1,
-1.121662, -0.6882342, -1.86498, 1, 0.7607843, 0, 1,
-1.11632, -0.2636851, -1.360779, 1, 0.7686275, 0, 1,
-1.115045, -0.9739721, -1.707164, 1, 0.772549, 0, 1,
-1.115005, -0.5824985, -2.856966, 1, 0.7803922, 0, 1,
-1.111378, -0.5778361, -2.563431, 1, 0.7843137, 0, 1,
-1.110911, -0.244871, -3.628538, 1, 0.7921569, 0, 1,
-1.104189, 1.059746, -0.4666204, 1, 0.7960784, 0, 1,
-1.102958, 2.503418, 0.9704933, 1, 0.8039216, 0, 1,
-1.096888, 2.144943, -0.8246635, 1, 0.8117647, 0, 1,
-1.090184, 0.877092, -1.094129, 1, 0.8156863, 0, 1,
-1.089433, 0.5058321, -0.03283125, 1, 0.8235294, 0, 1,
-1.088426, 0.4717573, -0.9044676, 1, 0.827451, 0, 1,
-1.087617, -0.01146204, -1.185919, 1, 0.8352941, 0, 1,
-1.08401, -0.6048616, -2.937949, 1, 0.8392157, 0, 1,
-1.080776, -1.61209, -1.242429, 1, 0.8470588, 0, 1,
-1.079663, 0.6750085, -0.82301, 1, 0.8509804, 0, 1,
-1.077535, 0.4388588, -1.05734, 1, 0.8588235, 0, 1,
-1.064991, -0.1340362, 0.8304796, 1, 0.8627451, 0, 1,
-1.05768, 0.2466604, -1.366808, 1, 0.8705882, 0, 1,
-1.054121, 0.2866805, -1.009788, 1, 0.8745098, 0, 1,
-1.049262, 0.3825386, 0.5353134, 1, 0.8823529, 0, 1,
-1.042804, 1.244766, 0.2018649, 1, 0.8862745, 0, 1,
-1.038871, 1.190518, -2.677104, 1, 0.8941177, 0, 1,
-1.036241, 3.270984, -1.960306, 1, 0.8980392, 0, 1,
-1.034409, 0.2018521, -2.444239, 1, 0.9058824, 0, 1,
-1.030334, 0.3103815, -0.5169988, 1, 0.9137255, 0, 1,
-1.025996, -0.3259945, -0.9399694, 1, 0.9176471, 0, 1,
-1.016078, -0.8582543, -2.925493, 1, 0.9254902, 0, 1,
-1.015055, -0.5143194, -3.639886, 1, 0.9294118, 0, 1,
-1.010189, 0.3836398, -0.4661739, 1, 0.9372549, 0, 1,
-1.003987, -0.4638714, -3.978447, 1, 0.9411765, 0, 1,
-0.9821162, -1.582574, -2.203001, 1, 0.9490196, 0, 1,
-0.981225, -0.8433461, -2.493994, 1, 0.9529412, 0, 1,
-0.9742342, 0.6459004, 0.2397773, 1, 0.9607843, 0, 1,
-0.9734844, 0.4269656, -0.6245024, 1, 0.9647059, 0, 1,
-0.9724873, -0.2436245, -3.820302, 1, 0.972549, 0, 1,
-0.9700276, 0.06595134, -2.060486, 1, 0.9764706, 0, 1,
-0.9669223, -0.4225813, -1.74587, 1, 0.9843137, 0, 1,
-0.9653562, 0.9976826, -0.07882232, 1, 0.9882353, 0, 1,
-0.9626228, 0.609945, -1.536901, 1, 0.9960784, 0, 1,
-0.9623244, -1.280267, -3.249839, 0.9960784, 1, 0, 1,
-0.9608732, -0.8846157, -2.798402, 0.9921569, 1, 0, 1,
-0.9538845, 1.327177, 0.5655642, 0.9843137, 1, 0, 1,
-0.9479601, -0.8435633, -2.121085, 0.9803922, 1, 0, 1,
-0.9473368, 1.175494, -1.536995, 0.972549, 1, 0, 1,
-0.9436657, 1.635572, -2.086446, 0.9686275, 1, 0, 1,
-0.9340773, 0.1921042, -0.4920595, 0.9607843, 1, 0, 1,
-0.9271601, 1.408678, -2.719186, 0.9568627, 1, 0, 1,
-0.9248166, -0.1091964, -2.472772, 0.9490196, 1, 0, 1,
-0.9241758, 0.6475964, -1.830275, 0.945098, 1, 0, 1,
-0.9226786, 0.7113247, -0.494514, 0.9372549, 1, 0, 1,
-0.9216933, 1.099469, -1.073154, 0.9333333, 1, 0, 1,
-0.9193651, -1.087253, -2.053826, 0.9254902, 1, 0, 1,
-0.9183484, 1.974313, -2.020103, 0.9215686, 1, 0, 1,
-0.9027032, 0.04000619, -2.23674, 0.9137255, 1, 0, 1,
-0.900288, 0.06810701, -1.919486, 0.9098039, 1, 0, 1,
-0.8987742, 0.9583592, 1.883626, 0.9019608, 1, 0, 1,
-0.8966482, -0.1241468, -1.83488, 0.8941177, 1, 0, 1,
-0.8956951, -0.8024992, -2.072597, 0.8901961, 1, 0, 1,
-0.8895881, -0.2491806, -2.520025, 0.8823529, 1, 0, 1,
-0.8884896, 0.1769679, -2.174115, 0.8784314, 1, 0, 1,
-0.8723089, -0.2441405, -2.506866, 0.8705882, 1, 0, 1,
-0.8640009, 0.9646316, -1.119003, 0.8666667, 1, 0, 1,
-0.8635596, 1.313483, -1.076935, 0.8588235, 1, 0, 1,
-0.8633898, 0.264405, -1.414607, 0.854902, 1, 0, 1,
-0.8594689, 2.088805, -2.174416, 0.8470588, 1, 0, 1,
-0.8568843, 0.6073747, -1.71923, 0.8431373, 1, 0, 1,
-0.8541077, -0.2682282, -1.789718, 0.8352941, 1, 0, 1,
-0.8518476, -0.4039721, -3.113615, 0.8313726, 1, 0, 1,
-0.8509606, -1.742017, -3.195947, 0.8235294, 1, 0, 1,
-0.8505861, 1.524116, -1.050418, 0.8196079, 1, 0, 1,
-0.8473152, 0.6871763, -0.7962216, 0.8117647, 1, 0, 1,
-0.8408267, 1.444682, -1.342687, 0.8078431, 1, 0, 1,
-0.8351786, -1.681483, -4.000735, 0.8, 1, 0, 1,
-0.8346933, 1.145828, -2.040869, 0.7921569, 1, 0, 1,
-0.8299582, -1.384202, -1.796177, 0.7882353, 1, 0, 1,
-0.8246695, 0.1744465, -1.470635, 0.7803922, 1, 0, 1,
-0.814439, 0.5816555, 1.528479, 0.7764706, 1, 0, 1,
-0.8114034, -1.040871, -2.001801, 0.7686275, 1, 0, 1,
-0.811184, 1.523109, 0.3437877, 0.7647059, 1, 0, 1,
-0.8106086, -0.4503099, -1.919883, 0.7568628, 1, 0, 1,
-0.8056556, -0.2436199, -0.4183111, 0.7529412, 1, 0, 1,
-0.7902511, -0.09678024, -0.07835989, 0.7450981, 1, 0, 1,
-0.7881788, -0.08905885, -2.267945, 0.7411765, 1, 0, 1,
-0.7857642, -0.491704, -2.225584, 0.7333333, 1, 0, 1,
-0.7825952, -1.406103, -1.48663, 0.7294118, 1, 0, 1,
-0.7796956, 1.956483, -2.390276, 0.7215686, 1, 0, 1,
-0.7783711, -0.7277091, -1.583338, 0.7176471, 1, 0, 1,
-0.7766019, 1.890832, -0.8025952, 0.7098039, 1, 0, 1,
-0.7741605, -0.2561547, -3.098564, 0.7058824, 1, 0, 1,
-0.7688246, -0.5606688, -1.912915, 0.6980392, 1, 0, 1,
-0.7678412, -0.1107628, -2.467072, 0.6901961, 1, 0, 1,
-0.7566291, 1.009036, -1.112403, 0.6862745, 1, 0, 1,
-0.7559876, -0.2360843, 0.414292, 0.6784314, 1, 0, 1,
-0.7477301, -1.285924, 1.169171, 0.6745098, 1, 0, 1,
-0.7449902, 0.1258538, -1.599448, 0.6666667, 1, 0, 1,
-0.7442884, 1.792848, -1.906963, 0.6627451, 1, 0, 1,
-0.7440717, -1.10023, -4.193146, 0.654902, 1, 0, 1,
-0.7402277, 0.2165116, -2.680637, 0.6509804, 1, 0, 1,
-0.7382441, -0.4671738, -2.843513, 0.6431373, 1, 0, 1,
-0.7353306, -0.1646328, -1.501738, 0.6392157, 1, 0, 1,
-0.7321102, -0.7069563, -1.605547, 0.6313726, 1, 0, 1,
-0.7297423, 1.704986, -1.374239, 0.627451, 1, 0, 1,
-0.7282097, -0.7027143, -2.258454, 0.6196079, 1, 0, 1,
-0.7240805, 1.187753, 0.683598, 0.6156863, 1, 0, 1,
-0.7237975, 1.470426, 0.6914069, 0.6078432, 1, 0, 1,
-0.7185562, -0.7100133, -2.598233, 0.6039216, 1, 0, 1,
-0.7183046, 0.5465156, 0.4831037, 0.5960785, 1, 0, 1,
-0.7129402, 0.8303373, -1.715386, 0.5882353, 1, 0, 1,
-0.7085767, -1.240582, -1.810848, 0.5843138, 1, 0, 1,
-0.7050617, 0.2087672, -1.286619, 0.5764706, 1, 0, 1,
-0.7050377, 2.176039, -0.4923922, 0.572549, 1, 0, 1,
-0.7037387, 0.5426336, -2.083547, 0.5647059, 1, 0, 1,
-0.7031843, 0.5188196, -1.575861, 0.5607843, 1, 0, 1,
-0.6989889, 0.2218865, -2.417476, 0.5529412, 1, 0, 1,
-0.6915462, -0.2565417, -1.443218, 0.5490196, 1, 0, 1,
-0.6877601, 0.7619064, -2.133246, 0.5411765, 1, 0, 1,
-0.6862127, -1.256297, -3.496166, 0.5372549, 1, 0, 1,
-0.6843438, -0.4684977, -1.377087, 0.5294118, 1, 0, 1,
-0.6788992, -0.2199239, -1.522516, 0.5254902, 1, 0, 1,
-0.6641917, -1.123061, -3.732323, 0.5176471, 1, 0, 1,
-0.6622494, -0.9556596, -1.532886, 0.5137255, 1, 0, 1,
-0.6612603, 0.4933149, -0.3237726, 0.5058824, 1, 0, 1,
-0.6602531, 1.217215, 0.5865569, 0.5019608, 1, 0, 1,
-0.6565972, -1.556302, -4.661306, 0.4941176, 1, 0, 1,
-0.6512699, -0.0435995, -1.229125, 0.4862745, 1, 0, 1,
-0.6445945, 1.045491, 0.5860258, 0.4823529, 1, 0, 1,
-0.6319667, -0.03470756, -2.280521, 0.4745098, 1, 0, 1,
-0.6314042, -0.2886829, 0.7930032, 0.4705882, 1, 0, 1,
-0.6296715, 0.3425894, -1.467024, 0.4627451, 1, 0, 1,
-0.6279231, -0.5393775, -0.5390551, 0.4588235, 1, 0, 1,
-0.6275026, -0.5436133, -1.195641, 0.4509804, 1, 0, 1,
-0.6250645, 0.1375159, -1.148101, 0.4470588, 1, 0, 1,
-0.6109234, -0.1830312, -1.087682, 0.4392157, 1, 0, 1,
-0.6108705, -0.1484369, -2.724887, 0.4352941, 1, 0, 1,
-0.6083534, -0.1975266, -0.5595255, 0.427451, 1, 0, 1,
-0.6022658, 0.5804177, -0.05739106, 0.4235294, 1, 0, 1,
-0.6019709, -1.432031, -2.237454, 0.4156863, 1, 0, 1,
-0.6015199, 0.3715274, 1.030071, 0.4117647, 1, 0, 1,
-0.6005223, -0.2375029, -1.38384, 0.4039216, 1, 0, 1,
-0.6003463, 0.7710915, -3.451253, 0.3960784, 1, 0, 1,
-0.6001138, -0.07482667, -1.446885, 0.3921569, 1, 0, 1,
-0.5920388, -1.413955, -1.831115, 0.3843137, 1, 0, 1,
-0.591056, -0.537563, -2.78427, 0.3803922, 1, 0, 1,
-0.590535, 1.010061, -0.5689673, 0.372549, 1, 0, 1,
-0.5836041, 1.585983, 1.552381, 0.3686275, 1, 0, 1,
-0.5835302, -0.61292, -2.105495, 0.3607843, 1, 0, 1,
-0.5819377, -0.4045178, -1.614004, 0.3568628, 1, 0, 1,
-0.5812728, -0.595242, -1.993373, 0.3490196, 1, 0, 1,
-0.5788478, 0.402992, -0.5903587, 0.345098, 1, 0, 1,
-0.5767227, 0.3724782, -0.4092659, 0.3372549, 1, 0, 1,
-0.5745506, -0.5726025, -1.960436, 0.3333333, 1, 0, 1,
-0.574497, 1.030411, -0.4840819, 0.3254902, 1, 0, 1,
-0.5707239, -0.8378801, -2.650666, 0.3215686, 1, 0, 1,
-0.5695471, -0.0108258, -1.612602, 0.3137255, 1, 0, 1,
-0.566954, 0.154754, -2.332003, 0.3098039, 1, 0, 1,
-0.565267, -0.3021919, -1.500581, 0.3019608, 1, 0, 1,
-0.5618337, -2.751089, -3.417958, 0.2941177, 1, 0, 1,
-0.561159, 1.400464, -0.3035418, 0.2901961, 1, 0, 1,
-0.5594671, -0.1779536, -2.135245, 0.282353, 1, 0, 1,
-0.5593146, 0.05843654, -3.284531, 0.2784314, 1, 0, 1,
-0.5533357, 1.596461, 1.204844, 0.2705882, 1, 0, 1,
-0.5527075, -0.7336039, -3.908234, 0.2666667, 1, 0, 1,
-0.5524141, 0.2013776, 0.2238786, 0.2588235, 1, 0, 1,
-0.5484063, 0.6318219, -2.266021, 0.254902, 1, 0, 1,
-0.5417063, -1.082931, -3.766557, 0.2470588, 1, 0, 1,
-0.5386655, 1.30641, -1.03475, 0.2431373, 1, 0, 1,
-0.5357298, 1.543497, 0.6593392, 0.2352941, 1, 0, 1,
-0.530932, 0.1457668, -0.4603433, 0.2313726, 1, 0, 1,
-0.5252814, 0.3401522, -1.098926, 0.2235294, 1, 0, 1,
-0.5229928, -1.398702, -1.158698, 0.2196078, 1, 0, 1,
-0.5181566, -0.867461, -2.261074, 0.2117647, 1, 0, 1,
-0.5142683, 0.4681477, -1.968763, 0.2078431, 1, 0, 1,
-0.513704, 0.009774177, 0.07603051, 0.2, 1, 0, 1,
-0.5103527, 0.522646, 1.383698, 0.1921569, 1, 0, 1,
-0.508329, -0.9734664, -2.711766, 0.1882353, 1, 0, 1,
-0.5072806, -0.04472189, -1.703946, 0.1803922, 1, 0, 1,
-0.5058629, 1.034098, 0.7950608, 0.1764706, 1, 0, 1,
-0.5043244, -1.595212, -2.066007, 0.1686275, 1, 0, 1,
-0.5036925, 0.5846894, 0.09080955, 0.1647059, 1, 0, 1,
-0.4983517, 0.3319498, -2.819233, 0.1568628, 1, 0, 1,
-0.4886934, -1.354762, -2.355559, 0.1529412, 1, 0, 1,
-0.4847473, 1.577365, -1.284436, 0.145098, 1, 0, 1,
-0.4822857, 0.5062619, -1.205376, 0.1411765, 1, 0, 1,
-0.4771377, -0.4991785, -1.860599, 0.1333333, 1, 0, 1,
-0.4768336, 0.5757903, -0.9253305, 0.1294118, 1, 0, 1,
-0.4765493, -1.69655, -1.223095, 0.1215686, 1, 0, 1,
-0.4733854, -0.4836042, -2.018086, 0.1176471, 1, 0, 1,
-0.4710828, -2.396118, -4.75752, 0.1098039, 1, 0, 1,
-0.469308, 0.6904234, 0.6051287, 0.1058824, 1, 0, 1,
-0.4662081, 1.410031, -0.5283056, 0.09803922, 1, 0, 1,
-0.4657024, 0.2125205, -1.08645, 0.09019608, 1, 0, 1,
-0.4627688, 1.882741, 1.525849, 0.08627451, 1, 0, 1,
-0.4546968, -0.5573021, -1.766719, 0.07843138, 1, 0, 1,
-0.4506443, 0.4247738, -1.223551, 0.07450981, 1, 0, 1,
-0.4502528, 0.118432, -1.546245, 0.06666667, 1, 0, 1,
-0.4446351, 0.7700518, -1.026617, 0.0627451, 1, 0, 1,
-0.4419522, -1.400094, -3.616556, 0.05490196, 1, 0, 1,
-0.4406572, -0.5668418, -2.16889, 0.05098039, 1, 0, 1,
-0.4405412, 0.886951, -0.2102795, 0.04313726, 1, 0, 1,
-0.4348703, -0.008192749, -2.259617, 0.03921569, 1, 0, 1,
-0.4338188, 1.548986, -1.872982, 0.03137255, 1, 0, 1,
-0.4315663, -1.302569, -3.548712, 0.02745098, 1, 0, 1,
-0.4297695, -0.1559971, -2.638023, 0.01960784, 1, 0, 1,
-0.4202209, -0.0335999, -1.0431, 0.01568628, 1, 0, 1,
-0.4177728, 1.667425, -1.138684, 0.007843138, 1, 0, 1,
-0.4177466, -1.457569, -2.258951, 0.003921569, 1, 0, 1,
-0.4149618, -0.3235127, -2.485513, 0, 1, 0.003921569, 1,
-0.4149007, 0.871139, 1.731465, 0, 1, 0.01176471, 1,
-0.4142736, -0.2811355, -3.883414, 0, 1, 0.01568628, 1,
-0.4127758, 0.1866439, -2.621611, 0, 1, 0.02352941, 1,
-0.4112402, -0.2525909, -3.898928, 0, 1, 0.02745098, 1,
-0.4077483, -0.266156, -1.763333, 0, 1, 0.03529412, 1,
-0.4004108, 1.495931, 1.865629, 0, 1, 0.03921569, 1,
-0.4001096, 2.439662, 0.856442, 0, 1, 0.04705882, 1,
-0.3987715, -0.527559, -3.07139, 0, 1, 0.05098039, 1,
-0.3986132, -1.108826, -2.432851, 0, 1, 0.05882353, 1,
-0.3976192, 1.33077, 0.7959524, 0, 1, 0.0627451, 1,
-0.3964743, 1.336262, 0.009961509, 0, 1, 0.07058824, 1,
-0.3962622, -1.497643, -1.394116, 0, 1, 0.07450981, 1,
-0.3962109, -0.7934698, -1.688148, 0, 1, 0.08235294, 1,
-0.3939874, 0.7191233, -1.43576, 0, 1, 0.08627451, 1,
-0.3880983, -0.8455345, -3.196945, 0, 1, 0.09411765, 1,
-0.3797666, 0.02637272, -1.463617, 0, 1, 0.1019608, 1,
-0.3769991, 0.2264363, -0.9038362, 0, 1, 0.1058824, 1,
-0.3759817, 0.6403603, 0.2179705, 0, 1, 0.1137255, 1,
-0.3759057, 0.5362137, -0.9585124, 0, 1, 0.1176471, 1,
-0.3729075, -2.562898, -3.914931, 0, 1, 0.1254902, 1,
-0.3723904, 1.602098, 0.4070262, 0, 1, 0.1294118, 1,
-0.3717161, 0.5012562, 0.359948, 0, 1, 0.1372549, 1,
-0.3701569, -0.638325, -4.0715, 0, 1, 0.1411765, 1,
-0.3689011, -1.366548, -1.725957, 0, 1, 0.1490196, 1,
-0.3613871, -1.242331, -2.175858, 0, 1, 0.1529412, 1,
-0.3590541, 0.9330144, -0.7947801, 0, 1, 0.1607843, 1,
-0.3532735, -0.3250329, -0.7134271, 0, 1, 0.1647059, 1,
-0.3509854, 0.01200994, 0.2685607, 0, 1, 0.172549, 1,
-0.3472703, -0.80101, -1.820866, 0, 1, 0.1764706, 1,
-0.3472602, -0.8030316, -4.487564, 0, 1, 0.1843137, 1,
-0.3429088, 1.286072, 0.2616651, 0, 1, 0.1882353, 1,
-0.3381366, -1.27054, -2.22271, 0, 1, 0.1960784, 1,
-0.3355379, -1.471302, -2.846408, 0, 1, 0.2039216, 1,
-0.3349287, 0.4356941, -0.838566, 0, 1, 0.2078431, 1,
-0.3348329, 1.923413, -1.178937, 0, 1, 0.2156863, 1,
-0.3308631, 1.08515, -0.823853, 0, 1, 0.2196078, 1,
-0.3304633, -0.7645343, -2.452432, 0, 1, 0.227451, 1,
-0.3279319, 0.5196794, 0.2762123, 0, 1, 0.2313726, 1,
-0.3265217, 0.5113063, -2.945564, 0, 1, 0.2392157, 1,
-0.3241608, -0.6797919, -1.636184, 0, 1, 0.2431373, 1,
-0.3205574, -1.313306, -1.937517, 0, 1, 0.2509804, 1,
-0.3198492, -1.050183, -3.210768, 0, 1, 0.254902, 1,
-0.3182873, -0.1420136, -1.129617, 0, 1, 0.2627451, 1,
-0.3176107, -0.9663, -3.223361, 0, 1, 0.2666667, 1,
-0.3137181, -0.627232, -3.230973, 0, 1, 0.2745098, 1,
-0.3119815, -0.01125536, -1.765575, 0, 1, 0.2784314, 1,
-0.3086054, 2.083864, 1.541391, 0, 1, 0.2862745, 1,
-0.3065154, 1.021662, 1.168764, 0, 1, 0.2901961, 1,
-0.2978102, -0.2232782, -1.808841, 0, 1, 0.2980392, 1,
-0.2964583, -0.02741376, -1.474088, 0, 1, 0.3058824, 1,
-0.2914661, 0.8247839, -1.251257, 0, 1, 0.3098039, 1,
-0.284326, -1.016082, -2.043875, 0, 1, 0.3176471, 1,
-0.2807868, 0.5691658, 0.8326564, 0, 1, 0.3215686, 1,
-0.2787337, 0.1805636, -0.1994447, 0, 1, 0.3294118, 1,
-0.2780722, 0.02402491, -1.76319, 0, 1, 0.3333333, 1,
-0.2750401, -0.4304546, -3.369107, 0, 1, 0.3411765, 1,
-0.2720188, -0.9789788, -3.764148, 0, 1, 0.345098, 1,
-0.2714992, 0.3176272, -1.23015, 0, 1, 0.3529412, 1,
-0.2705071, 2.739511, 0.4767269, 0, 1, 0.3568628, 1,
-0.259286, -0.09782071, -2.534729, 0, 1, 0.3647059, 1,
-0.2567455, 0.7932638, -0.4235567, 0, 1, 0.3686275, 1,
-0.2562229, 0.5188709, -1.555792, 0, 1, 0.3764706, 1,
-0.253057, 0.05600802, -2.881673, 0, 1, 0.3803922, 1,
-0.250758, 1.062831, 0.6504827, 0, 1, 0.3882353, 1,
-0.2430387, 0.95838, 0.6007532, 0, 1, 0.3921569, 1,
-0.2417205, -0.23136, -3.224816, 0, 1, 0.4, 1,
-0.2408122, 1.453226, -1.203547, 0, 1, 0.4078431, 1,
-0.2356185, 0.7302119, 0.3327064, 0, 1, 0.4117647, 1,
-0.2345901, -1.117095, -3.02198, 0, 1, 0.4196078, 1,
-0.2326985, 0.8280182, 0.2024262, 0, 1, 0.4235294, 1,
-0.2278835, 1.466614, -1.341069, 0, 1, 0.4313726, 1,
-0.2258551, 0.6351612, -0.9552209, 0, 1, 0.4352941, 1,
-0.2241892, 1.062089, 0.033016, 0, 1, 0.4431373, 1,
-0.2238841, -2.732938, -2.849348, 0, 1, 0.4470588, 1,
-0.219896, -0.317105, -1.919199, 0, 1, 0.454902, 1,
-0.2194351, -0.001753882, -1.330505, 0, 1, 0.4588235, 1,
-0.2184244, -0.9312707, -2.340632, 0, 1, 0.4666667, 1,
-0.217242, -1.340897, -2.935802, 0, 1, 0.4705882, 1,
-0.2122716, -0.4141227, -3.668215, 0, 1, 0.4784314, 1,
-0.2097782, -1.436234, -2.789391, 0, 1, 0.4823529, 1,
-0.2076138, 0.1967365, -1.201522, 0, 1, 0.4901961, 1,
-0.2054022, -1.063703, -3.100348, 0, 1, 0.4941176, 1,
-0.2024789, 0.7370467, -2.143281, 0, 1, 0.5019608, 1,
-0.1973532, -0.05809629, -2.537057, 0, 1, 0.509804, 1,
-0.1937921, -0.5533515, -3.122531, 0, 1, 0.5137255, 1,
-0.1815281, -1.03894, -4.241605, 0, 1, 0.5215687, 1,
-0.1800576, 0.7586193, 2.002498, 0, 1, 0.5254902, 1,
-0.1797092, -1.210245, -2.888223, 0, 1, 0.5333334, 1,
-0.1771756, 0.3708718, -1.297727, 0, 1, 0.5372549, 1,
-0.176492, 0.03851897, -1.694133, 0, 1, 0.5450981, 1,
-0.1747573, -0.2417301, -2.280994, 0, 1, 0.5490196, 1,
-0.1720965, -1.482703, -1.765249, 0, 1, 0.5568628, 1,
-0.1667927, -2.103659, -3.87659, 0, 1, 0.5607843, 1,
-0.1646362, 0.3254632, 0.4784103, 0, 1, 0.5686275, 1,
-0.1617262, -0.7876596, -4.731621, 0, 1, 0.572549, 1,
-0.1605775, 0.9833053, -0.2614716, 0, 1, 0.5803922, 1,
-0.1572234, -0.5987642, -3.739125, 0, 1, 0.5843138, 1,
-0.1563764, -1.032179, -3.249441, 0, 1, 0.5921569, 1,
-0.1549512, 1.562996, -0.6034721, 0, 1, 0.5960785, 1,
-0.1537797, -0.2349896, -4.08591, 0, 1, 0.6039216, 1,
-0.1537069, -0.3744904, -4.310399, 0, 1, 0.6117647, 1,
-0.1515218, 0.35956, -1.71163, 0, 1, 0.6156863, 1,
-0.1509788, 0.5965618, 0.9024612, 0, 1, 0.6235294, 1,
-0.1488712, -1.100046, -3.837955, 0, 1, 0.627451, 1,
-0.1483613, 0.1556445, -2.092391, 0, 1, 0.6352941, 1,
-0.145594, -1.096425, -4.397215, 0, 1, 0.6392157, 1,
-0.1435282, -0.9190974, -2.03573, 0, 1, 0.6470588, 1,
-0.142567, -0.4733187, -4.936766, 0, 1, 0.6509804, 1,
-0.142451, 0.4789967, 0.03341046, 0, 1, 0.6588235, 1,
-0.139144, 0.3582195, 0.07507341, 0, 1, 0.6627451, 1,
-0.1378418, 0.6507334, -1.046718, 0, 1, 0.6705883, 1,
-0.1364568, -1.100629, -3.887239, 0, 1, 0.6745098, 1,
-0.1332739, 0.3300614, -0.06043519, 0, 1, 0.682353, 1,
-0.1327162, 1.055828, -1.67596, 0, 1, 0.6862745, 1,
-0.13127, -1.449731, -3.676993, 0, 1, 0.6941177, 1,
-0.1295146, -0.956082, -2.877294, 0, 1, 0.7019608, 1,
-0.1282301, 1.260764, 0.1561736, 0, 1, 0.7058824, 1,
-0.1260392, 0.05102099, -2.396209, 0, 1, 0.7137255, 1,
-0.1254591, -1.665628, -3.194756, 0, 1, 0.7176471, 1,
-0.1246361, -0.2706249, -4.797653, 0, 1, 0.7254902, 1,
-0.1235452, 1.043677, -0.6343663, 0, 1, 0.7294118, 1,
-0.1179308, -1.213767, -1.657803, 0, 1, 0.7372549, 1,
-0.1067922, 0.9315521, -0.04265984, 0, 1, 0.7411765, 1,
-0.1026045, 0.3890257, -0.2949035, 0, 1, 0.7490196, 1,
-0.09472685, -0.6033055, -4.901533, 0, 1, 0.7529412, 1,
-0.09040512, 0.1422645, -0.3168254, 0, 1, 0.7607843, 1,
-0.08273221, 0.9171178, 1.42528, 0, 1, 0.7647059, 1,
-0.08197374, 0.3168905, -1.595889, 0, 1, 0.772549, 1,
-0.08116306, 0.9240474, 0.4864243, 0, 1, 0.7764706, 1,
-0.08052853, -0.2034103, -2.786547, 0, 1, 0.7843137, 1,
-0.07684386, -0.4720367, -3.923915, 0, 1, 0.7882353, 1,
-0.07474912, 1.00817, -0.4174663, 0, 1, 0.7960784, 1,
-0.07458379, -1.30253, -3.397968, 0, 1, 0.8039216, 1,
-0.07429234, -0.6923745, -2.628479, 0, 1, 0.8078431, 1,
-0.07196084, 0.230644, -0.6555229, 0, 1, 0.8156863, 1,
-0.06820212, -0.9780403, -2.620167, 0, 1, 0.8196079, 1,
-0.06461997, 0.233071, -0.1521575, 0, 1, 0.827451, 1,
-0.06216683, 0.2211664, 0.8895468, 0, 1, 0.8313726, 1,
-0.06204731, -0.2517797, -2.935525, 0, 1, 0.8392157, 1,
-0.05980468, -0.5555723, -0.4224714, 0, 1, 0.8431373, 1,
-0.04936058, -1.00051, -1.972289, 0, 1, 0.8509804, 1,
-0.04735902, 0.268976, 0.3993977, 0, 1, 0.854902, 1,
-0.0381109, 0.3752013, -0.4919936, 0, 1, 0.8627451, 1,
-0.02722631, 0.5169351, -0.2718809, 0, 1, 0.8666667, 1,
-0.02510934, 2.44744, -0.3711024, 0, 1, 0.8745098, 1,
-0.02439916, 0.8370364, 2.160994, 0, 1, 0.8784314, 1,
-0.02346157, -0.1256445, -2.04694, 0, 1, 0.8862745, 1,
-0.02179176, 0.01347909, -0.7258517, 0, 1, 0.8901961, 1,
-0.01453885, 2.021259, -2.514743, 0, 1, 0.8980392, 1,
-0.008920243, 1.560733, 0.7939389, 0, 1, 0.9058824, 1,
-0.008533089, -0.05728266, -2.775125, 0, 1, 0.9098039, 1,
-0.007707635, 0.6751608, 0.9345484, 0, 1, 0.9176471, 1,
-0.002786216, -0.0675019, -3.699896, 0, 1, 0.9215686, 1,
-0.001039192, 1.50498, -0.08206046, 0, 1, 0.9294118, 1,
0.0009730558, -0.220374, 4.615023, 0, 1, 0.9333333, 1,
0.001586759, -1.256636, 3.600991, 0, 1, 0.9411765, 1,
0.003515761, -1.475386, 4.224669, 0, 1, 0.945098, 1,
0.004920037, -0.190415, 1.251583, 0, 1, 0.9529412, 1,
0.006848926, 1.455996, 1.1989, 0, 1, 0.9568627, 1,
0.00817717, 0.9944877, 0.2507065, 0, 1, 0.9647059, 1,
0.008348505, 0.8663669, -1.727483, 0, 1, 0.9686275, 1,
0.009323272, 1.522163, -1.424334, 0, 1, 0.9764706, 1,
0.01022497, -0.971867, 3.273898, 0, 1, 0.9803922, 1,
0.01031698, 0.5277497, -0.7798926, 0, 1, 0.9882353, 1,
0.01098814, 0.05039822, -0.8839968, 0, 1, 0.9921569, 1,
0.01227763, 0.6079028, 1.333717, 0, 1, 1, 1,
0.01653759, -0.5096511, 2.075716, 0, 0.9921569, 1, 1,
0.01754116, -0.9286706, 3.300347, 0, 0.9882353, 1, 1,
0.01869374, -1.063836, 2.209064, 0, 0.9803922, 1, 1,
0.01913235, 0.6992887, -1.045987, 0, 0.9764706, 1, 1,
0.02553668, -1.051929, 3.296655, 0, 0.9686275, 1, 1,
0.02634525, 0.2081667, 0.2740055, 0, 0.9647059, 1, 1,
0.02787292, -0.4833464, 2.092844, 0, 0.9568627, 1, 1,
0.02927843, 0.3931091, 0.8713655, 0, 0.9529412, 1, 1,
0.03024485, 0.8602331, -0.2496739, 0, 0.945098, 1, 1,
0.03033612, -0.1576537, 3.750929, 0, 0.9411765, 1, 1,
0.03350801, -1.401727, 3.722337, 0, 0.9333333, 1, 1,
0.03536488, -0.9903197, 1.632112, 0, 0.9294118, 1, 1,
0.04200744, -1.095104, 3.304029, 0, 0.9215686, 1, 1,
0.04383066, 0.7189771, -0.05421727, 0, 0.9176471, 1, 1,
0.04429932, -0.5967693, 0.6524844, 0, 0.9098039, 1, 1,
0.04472015, -0.5657153, 3.349842, 0, 0.9058824, 1, 1,
0.05378211, 0.04962626, 0.9619502, 0, 0.8980392, 1, 1,
0.05642707, -1.129183, 2.332829, 0, 0.8901961, 1, 1,
0.05727734, 0.1414432, 1.126021, 0, 0.8862745, 1, 1,
0.05827102, -0.3633007, 1.114283, 0, 0.8784314, 1, 1,
0.05874713, 0.3163349, -0.7130807, 0, 0.8745098, 1, 1,
0.0613092, 0.1308026, 0.3139911, 0, 0.8666667, 1, 1,
0.06133767, 0.8329313, 2.264768, 0, 0.8627451, 1, 1,
0.06276474, 0.8668312, 1.236, 0, 0.854902, 1, 1,
0.06293948, -0.8752559, 3.186945, 0, 0.8509804, 1, 1,
0.06365155, -0.1851233, 1.892897, 0, 0.8431373, 1, 1,
0.06489572, -1.218493, 2.239392, 0, 0.8392157, 1, 1,
0.06584071, 0.3011395, -0.1857121, 0, 0.8313726, 1, 1,
0.06702561, 1.225708, 0.4427528, 0, 0.827451, 1, 1,
0.07074348, -1.697764, 3.05194, 0, 0.8196079, 1, 1,
0.07289194, 0.9916239, -0.1677297, 0, 0.8156863, 1, 1,
0.07291033, 1.090415, 0.4958649, 0, 0.8078431, 1, 1,
0.07773197, -0.3486275, 2.875685, 0, 0.8039216, 1, 1,
0.07942282, 0.04700161, 0.6968795, 0, 0.7960784, 1, 1,
0.0826616, 0.1241285, 2.049103, 0, 0.7882353, 1, 1,
0.09347349, 0.0007814155, 3.027408, 0, 0.7843137, 1, 1,
0.09596483, 0.4697623, 0.2360495, 0, 0.7764706, 1, 1,
0.1024849, -0.3365024, 3.285303, 0, 0.772549, 1, 1,
0.1044149, -0.03701451, 0.9515166, 0, 0.7647059, 1, 1,
0.1046066, -0.08959661, 1.913404, 0, 0.7607843, 1, 1,
0.1051732, -1.33996, 3.280732, 0, 0.7529412, 1, 1,
0.1065904, -0.9808236, 3.632587, 0, 0.7490196, 1, 1,
0.1070739, -0.2073345, 2.906317, 0, 0.7411765, 1, 1,
0.1083962, 0.8327118, 1.072098, 0, 0.7372549, 1, 1,
0.1162747, 1.519031, -2.179583, 0, 0.7294118, 1, 1,
0.1222618, 0.2400485, 0.5251575, 0, 0.7254902, 1, 1,
0.1327612, -0.8845946, 2.384498, 0, 0.7176471, 1, 1,
0.136306, 0.1834861, 0.8595138, 0, 0.7137255, 1, 1,
0.1398133, 0.6296756, 0.4699361, 0, 0.7058824, 1, 1,
0.1441019, -0.9600899, 2.732467, 0, 0.6980392, 1, 1,
0.146447, 0.2716923, -0.1035686, 0, 0.6941177, 1, 1,
0.151769, 0.7364874, -0.9576057, 0, 0.6862745, 1, 1,
0.1526496, -1.710485, 3.600973, 0, 0.682353, 1, 1,
0.1553652, 0.3465724, -1.42009, 0, 0.6745098, 1, 1,
0.1555748, -1.69709, 4.216017, 0, 0.6705883, 1, 1,
0.1563884, 0.7319847, 1.650823, 0, 0.6627451, 1, 1,
0.1614069, -0.3470465, 3.557338, 0, 0.6588235, 1, 1,
0.161746, -0.6279914, 1.279374, 0, 0.6509804, 1, 1,
0.1630729, 1.37497, -0.7689326, 0, 0.6470588, 1, 1,
0.1647937, 1.389384, 0.5314203, 0, 0.6392157, 1, 1,
0.1662768, -0.1226797, 2.819947, 0, 0.6352941, 1, 1,
0.1677437, 0.8895231, 1.443333, 0, 0.627451, 1, 1,
0.1693334, 0.2493152, 0.8663616, 0, 0.6235294, 1, 1,
0.1705978, 2.820786, 0.05759135, 0, 0.6156863, 1, 1,
0.1736014, 0.4551967, 0.04346324, 0, 0.6117647, 1, 1,
0.1763872, -0.3815158, 2.851138, 0, 0.6039216, 1, 1,
0.1766487, -0.06485324, -0.1212995, 0, 0.5960785, 1, 1,
0.1791974, 1.374002, 0.8841264, 0, 0.5921569, 1, 1,
0.179483, 0.9742433, 0.6409085, 0, 0.5843138, 1, 1,
0.1802416, 0.2497599, 1.605671, 0, 0.5803922, 1, 1,
0.1824397, -0.35633, 3.455248, 0, 0.572549, 1, 1,
0.182802, 0.1923738, 2.089957, 0, 0.5686275, 1, 1,
0.1861942, -0.03957167, 1.793181, 0, 0.5607843, 1, 1,
0.1920061, -0.7072927, 1.943461, 0, 0.5568628, 1, 1,
0.1928497, 1.313156, 0.2375703, 0, 0.5490196, 1, 1,
0.1953587, -0.9433321, 3.915154, 0, 0.5450981, 1, 1,
0.2041112, -0.2364877, 3.209331, 0, 0.5372549, 1, 1,
0.2064437, -0.9962668, 3.64516, 0, 0.5333334, 1, 1,
0.2138478, 0.1906948, 2.146816, 0, 0.5254902, 1, 1,
0.2170573, 0.3357569, -0.02933192, 0, 0.5215687, 1, 1,
0.2174461, -0.3317996, 2.569755, 0, 0.5137255, 1, 1,
0.2175887, 1.028514, 0.6656576, 0, 0.509804, 1, 1,
0.2206484, -0.8688977, 2.061477, 0, 0.5019608, 1, 1,
0.2233335, 1.208267, -1.314861, 0, 0.4941176, 1, 1,
0.2259191, 0.9451097, -0.05513311, 0, 0.4901961, 1, 1,
0.2388751, 0.4925882, -0.3727545, 0, 0.4823529, 1, 1,
0.2392884, -1.574383, 5.237185, 0, 0.4784314, 1, 1,
0.241407, 0.2157522, -0.7389546, 0, 0.4705882, 1, 1,
0.241471, 0.0533051, 0.4650001, 0, 0.4666667, 1, 1,
0.2418209, 1.840024, -0.7013139, 0, 0.4588235, 1, 1,
0.2430337, 0.9419202, -0.1222589, 0, 0.454902, 1, 1,
0.2507691, -1.797626, 4.663776, 0, 0.4470588, 1, 1,
0.2519085, -1.018447, 1.401115, 0, 0.4431373, 1, 1,
0.2524001, 0.9440027, -0.2652624, 0, 0.4352941, 1, 1,
0.2531285, -0.1140596, 1.720438, 0, 0.4313726, 1, 1,
0.2549829, -1.650902, 2.428182, 0, 0.4235294, 1, 1,
0.257584, 0.1854112, 1.543982, 0, 0.4196078, 1, 1,
0.2610328, 0.5128372, 0.01926961, 0, 0.4117647, 1, 1,
0.2612863, -0.5355795, 3.021452, 0, 0.4078431, 1, 1,
0.2625774, -0.1352137, 2.527262, 0, 0.4, 1, 1,
0.2656335, 0.5024891, -0.2941024, 0, 0.3921569, 1, 1,
0.266505, 0.8421314, 0.9250647, 0, 0.3882353, 1, 1,
0.270054, 0.9681876, -0.3323434, 0, 0.3803922, 1, 1,
0.270205, -0.4942091, 2.340517, 0, 0.3764706, 1, 1,
0.2809054, 0.3682725, -0.2035833, 0, 0.3686275, 1, 1,
0.2815128, 0.3559471, -1.130616, 0, 0.3647059, 1, 1,
0.2857761, 0.480666, 0.1060918, 0, 0.3568628, 1, 1,
0.2891661, 0.4265444, -0.4051321, 0, 0.3529412, 1, 1,
0.2941689, 0.1239015, 2.023154, 0, 0.345098, 1, 1,
0.301219, -0.5511537, 1.904442, 0, 0.3411765, 1, 1,
0.3080882, 0.1096742, 0.3445216, 0, 0.3333333, 1, 1,
0.3091126, -0.4487095, 2.359653, 0, 0.3294118, 1, 1,
0.3154131, -0.9982223, 3.635713, 0, 0.3215686, 1, 1,
0.3187973, -0.186287, 0.5933319, 0, 0.3176471, 1, 1,
0.3211529, -0.8835667, 2.560833, 0, 0.3098039, 1, 1,
0.3238254, 0.1417314, 0.9953611, 0, 0.3058824, 1, 1,
0.3270849, -1.210246, 1.282643, 0, 0.2980392, 1, 1,
0.3276116, -0.8778135, 2.366153, 0, 0.2901961, 1, 1,
0.3299235, -0.3516227, 3.079771, 0, 0.2862745, 1, 1,
0.3366252, -0.1546592, 0.5963647, 0, 0.2784314, 1, 1,
0.3383027, 0.3841452, 1.646548, 0, 0.2745098, 1, 1,
0.3406764, -2.08992, 1.975546, 0, 0.2666667, 1, 1,
0.3432996, 1.239824, -0.919881, 0, 0.2627451, 1, 1,
0.3517666, 1.053173, 1.387836, 0, 0.254902, 1, 1,
0.3595393, 0.8338075, 2.210005, 0, 0.2509804, 1, 1,
0.3614059, 1.43285, -1.091729, 0, 0.2431373, 1, 1,
0.3632863, -0.6879093, 3.065022, 0, 0.2392157, 1, 1,
0.3701611, -1.459845, 2.596692, 0, 0.2313726, 1, 1,
0.371063, 1.241051, 0.2868945, 0, 0.227451, 1, 1,
0.3720214, 0.7372801, -1.113114, 0, 0.2196078, 1, 1,
0.3739591, -0.8329718, 0.9585437, 0, 0.2156863, 1, 1,
0.3854434, 0.466853, -0.329598, 0, 0.2078431, 1, 1,
0.3884705, -1.211316, 1.933281, 0, 0.2039216, 1, 1,
0.3938993, -0.01783651, 3.263298, 0, 0.1960784, 1, 1,
0.3965639, -0.03467961, 4.065482, 0, 0.1882353, 1, 1,
0.396734, -0.7874433, 2.018, 0, 0.1843137, 1, 1,
0.3980493, -0.9137253, 2.940582, 0, 0.1764706, 1, 1,
0.3997495, 1.301687, 0.4957964, 0, 0.172549, 1, 1,
0.4008731, 0.8624678, -0.7598051, 0, 0.1647059, 1, 1,
0.4082671, 0.3335648, 0.4613961, 0, 0.1607843, 1, 1,
0.4084676, 0.518721, 0.2377484, 0, 0.1529412, 1, 1,
0.4120379, -0.8529238, 3.042185, 0, 0.1490196, 1, 1,
0.4127371, -0.03337035, -0.3581474, 0, 0.1411765, 1, 1,
0.4153146, 0.2706248, 0.5719476, 0, 0.1372549, 1, 1,
0.4180878, 0.05836133, 2.541041, 0, 0.1294118, 1, 1,
0.4185397, -0.08363053, 3.009022, 0, 0.1254902, 1, 1,
0.4186201, 0.9710274, -0.5826573, 0, 0.1176471, 1, 1,
0.4229441, -0.3074108, 2.602983, 0, 0.1137255, 1, 1,
0.4231908, -0.3234767, 2.853697, 0, 0.1058824, 1, 1,
0.4255655, -0.4810784, 2.543136, 0, 0.09803922, 1, 1,
0.4273469, -0.2212998, 3.339499, 0, 0.09411765, 1, 1,
0.429232, 0.2994358, 0.6290353, 0, 0.08627451, 1, 1,
0.4335066, -1.007473, 2.290696, 0, 0.08235294, 1, 1,
0.4383837, 0.03755782, 0.9796519, 0, 0.07450981, 1, 1,
0.4410873, -1.127046, 1.111112, 0, 0.07058824, 1, 1,
0.4411486, -0.1777022, 2.273495, 0, 0.0627451, 1, 1,
0.4457403, 0.7100466, -1.180513, 0, 0.05882353, 1, 1,
0.4460498, 0.3252181, 2.421669, 0, 0.05098039, 1, 1,
0.4489948, -0.7311054, 0.6336339, 0, 0.04705882, 1, 1,
0.4505172, 0.5939609, -0.8001953, 0, 0.03921569, 1, 1,
0.4558937, -1.654279, 1.528109, 0, 0.03529412, 1, 1,
0.4571138, 0.08904027, 1.918697, 0, 0.02745098, 1, 1,
0.4573703, -0.1788857, 1.227263, 0, 0.02352941, 1, 1,
0.4576278, -0.2542974, 2.543674, 0, 0.01568628, 1, 1,
0.4583834, 0.1165605, 1.304861, 0, 0.01176471, 1, 1,
0.4619181, 0.2670654, 1.58492, 0, 0.003921569, 1, 1,
0.4619332, 1.682916, 0.5934876, 0.003921569, 0, 1, 1,
0.4674899, 0.6677225, 0.7832203, 0.007843138, 0, 1, 1,
0.4675614, -1.049125, 3.084031, 0.01568628, 0, 1, 1,
0.4678851, 0.05701498, 1.471923, 0.01960784, 0, 1, 1,
0.4840454, -0.5067679, 2.555676, 0.02745098, 0, 1, 1,
0.4902761, 0.06521706, 0.9027144, 0.03137255, 0, 1, 1,
0.4903276, -1.377307, 2.395091, 0.03921569, 0, 1, 1,
0.4931791, -0.7745112, 1.795387, 0.04313726, 0, 1, 1,
0.4942437, -2.349822, 1.36618, 0.05098039, 0, 1, 1,
0.5000284, -0.14635, 0.2238653, 0.05490196, 0, 1, 1,
0.5019973, -0.03914284, 0.6494603, 0.0627451, 0, 1, 1,
0.5039961, -0.6992451, 3.835166, 0.06666667, 0, 1, 1,
0.5051127, -0.9864709, 5.192208, 0.07450981, 0, 1, 1,
0.506776, -0.3779295, 3.659911, 0.07843138, 0, 1, 1,
0.5177832, 1.071175, 0.6830629, 0.08627451, 0, 1, 1,
0.5219913, 0.2294041, 1.12126, 0.09019608, 0, 1, 1,
0.524048, -0.5993154, 1.076898, 0.09803922, 0, 1, 1,
0.5260919, -2.445429, 2.978432, 0.1058824, 0, 1, 1,
0.5294451, -1.786002, 3.785927, 0.1098039, 0, 1, 1,
0.5353483, -1.380619, 2.251605, 0.1176471, 0, 1, 1,
0.5363724, -1.600281, 0.4722064, 0.1215686, 0, 1, 1,
0.536944, -1.629416, 2.006389, 0.1294118, 0, 1, 1,
0.5412034, 2.0144, -0.364446, 0.1333333, 0, 1, 1,
0.542899, -0.4750112, 2.646689, 0.1411765, 0, 1, 1,
0.5431946, -1.449728, 3.004004, 0.145098, 0, 1, 1,
0.5434104, 1.067472, -1.668127, 0.1529412, 0, 1, 1,
0.5474468, 0.6696869, 1.127293, 0.1568628, 0, 1, 1,
0.5507185, 0.8640673, 1.310513, 0.1647059, 0, 1, 1,
0.5566882, 0.8338898, -0.4661036, 0.1686275, 0, 1, 1,
0.5570788, -0.4974136, 2.930063, 0.1764706, 0, 1, 1,
0.5602466, -0.4795917, 1.509918, 0.1803922, 0, 1, 1,
0.561342, -0.9385546, 1.111589, 0.1882353, 0, 1, 1,
0.5629205, -0.2749263, 2.96331, 0.1921569, 0, 1, 1,
0.564468, 1.039913, 1.060181, 0.2, 0, 1, 1,
0.5660416, 0.6730483, -0.5831466, 0.2078431, 0, 1, 1,
0.5663678, -0.0568992, 1.506068, 0.2117647, 0, 1, 1,
0.5691825, -0.4186725, 0.8744591, 0.2196078, 0, 1, 1,
0.5814861, -1.361329, 1.81717, 0.2235294, 0, 1, 1,
0.5819281, -0.7796339, 1.677854, 0.2313726, 0, 1, 1,
0.5834737, 0.792679, 1.19677, 0.2352941, 0, 1, 1,
0.5860211, -1.678736, 1.753434, 0.2431373, 0, 1, 1,
0.5933039, -0.4364666, 2.322216, 0.2470588, 0, 1, 1,
0.5937786, -0.6785861, 2.615025, 0.254902, 0, 1, 1,
0.5949142, -0.08860894, 0.9009032, 0.2588235, 0, 1, 1,
0.5963476, -0.156363, 1.916059, 0.2666667, 0, 1, 1,
0.596851, -1.754234, 4.010063, 0.2705882, 0, 1, 1,
0.6009034, 0.06896539, 0.7052481, 0.2784314, 0, 1, 1,
0.6085665, -0.3473374, 1.846899, 0.282353, 0, 1, 1,
0.6102339, 1.099546, 1.38581, 0.2901961, 0, 1, 1,
0.6103926, -0.8439767, 2.03164, 0.2941177, 0, 1, 1,
0.6125405, -0.09417312, 1.91092, 0.3019608, 0, 1, 1,
0.6139925, 0.8434793, -0.239391, 0.3098039, 0, 1, 1,
0.617752, -0.5371129, 1.274269, 0.3137255, 0, 1, 1,
0.622227, 0.3552089, 1.264761, 0.3215686, 0, 1, 1,
0.6244888, -0.4974972, 0.6869025, 0.3254902, 0, 1, 1,
0.6314517, -0.4417928, 2.420453, 0.3333333, 0, 1, 1,
0.6339712, -0.09777358, -0.5746605, 0.3372549, 0, 1, 1,
0.637795, -0.7105949, 3.605443, 0.345098, 0, 1, 1,
0.6398807, 0.7272737, 1.028518, 0.3490196, 0, 1, 1,
0.6419706, -1.138818, 2.489158, 0.3568628, 0, 1, 1,
0.6423063, -0.6329637, 3.801063, 0.3607843, 0, 1, 1,
0.6428211, 1.157167, 0.9927831, 0.3686275, 0, 1, 1,
0.6471101, 0.1236006, -1.345222, 0.372549, 0, 1, 1,
0.6475482, -1.046543, 2.537146, 0.3803922, 0, 1, 1,
0.6482111, 0.2352949, -0.5600337, 0.3843137, 0, 1, 1,
0.6499795, 0.3211119, 0.2396487, 0.3921569, 0, 1, 1,
0.6551584, 0.9667515, 0.1414679, 0.3960784, 0, 1, 1,
0.6561956, 0.1935109, 0.4554633, 0.4039216, 0, 1, 1,
0.6575926, 0.2659537, 0.3062445, 0.4117647, 0, 1, 1,
0.6604237, 0.4143298, 2.405351, 0.4156863, 0, 1, 1,
0.6609004, 0.9456405, 1.964205, 0.4235294, 0, 1, 1,
0.6617454, 0.4174331, 0.8719983, 0.427451, 0, 1, 1,
0.6661511, 0.344153, 0.8223198, 0.4352941, 0, 1, 1,
0.6688158, 1.383341, -0.2293784, 0.4392157, 0, 1, 1,
0.6703252, 1.187014, 1.313455, 0.4470588, 0, 1, 1,
0.67343, 0.1967194, 1.966738, 0.4509804, 0, 1, 1,
0.6736838, -0.04863425, 2.483217, 0.4588235, 0, 1, 1,
0.6811213, -0.1221042, 2.92802, 0.4627451, 0, 1, 1,
0.6883906, -1.813217, 2.875638, 0.4705882, 0, 1, 1,
0.693507, -0.2425764, 2.684547, 0.4745098, 0, 1, 1,
0.6962242, 0.4582541, 1.71392, 0.4823529, 0, 1, 1,
0.6969672, -0.2235853, -0.3431106, 0.4862745, 0, 1, 1,
0.6976436, 0.3638496, 1.327146, 0.4941176, 0, 1, 1,
0.6989434, 0.3228594, 1.049088, 0.5019608, 0, 1, 1,
0.7027179, -0.8977885, 1.270205, 0.5058824, 0, 1, 1,
0.7105942, 0.4890816, -0.875083, 0.5137255, 0, 1, 1,
0.714999, 2.456265, 0.1607922, 0.5176471, 0, 1, 1,
0.7172876, -0.03912811, 1.739264, 0.5254902, 0, 1, 1,
0.7223059, 0.4367982, -1.66601, 0.5294118, 0, 1, 1,
0.7255753, 0.7027462, -0.3286134, 0.5372549, 0, 1, 1,
0.7263563, 0.4142925, 0.7175968, 0.5411765, 0, 1, 1,
0.7331349, 0.4873355, 1.600367, 0.5490196, 0, 1, 1,
0.7375687, 0.7824262, 1.070414, 0.5529412, 0, 1, 1,
0.7393155, -0.4589408, 3.173626, 0.5607843, 0, 1, 1,
0.7411839, -0.4768426, 4.687074, 0.5647059, 0, 1, 1,
0.742775, -1.101006, 2.325987, 0.572549, 0, 1, 1,
0.751316, -0.7212358, 2.175263, 0.5764706, 0, 1, 1,
0.7534854, -0.7338326, 1.298869, 0.5843138, 0, 1, 1,
0.7548332, 0.8752349, 0.1934601, 0.5882353, 0, 1, 1,
0.7562262, -1.316965, 1.992159, 0.5960785, 0, 1, 1,
0.7574056, -0.439611, 1.997337, 0.6039216, 0, 1, 1,
0.764562, 0.1207175, 0.2871522, 0.6078432, 0, 1, 1,
0.7668138, 1.209911, 1.489406, 0.6156863, 0, 1, 1,
0.7671163, -1.418039, 3.087847, 0.6196079, 0, 1, 1,
0.7681017, 0.9041954, 3.338366, 0.627451, 0, 1, 1,
0.7691209, 0.8403232, -0.5556349, 0.6313726, 0, 1, 1,
0.7703754, 1.780611, 0.7583851, 0.6392157, 0, 1, 1,
0.7803867, -0.2556095, 1.208686, 0.6431373, 0, 1, 1,
0.7886757, 1.147335, 2.526304, 0.6509804, 0, 1, 1,
0.7889953, 0.1619796, 2.651021, 0.654902, 0, 1, 1,
0.7906268, 1.522076, -0.1929446, 0.6627451, 0, 1, 1,
0.7909889, -0.1182214, 1.142853, 0.6666667, 0, 1, 1,
0.8009757, -1.442754, 2.068288, 0.6745098, 0, 1, 1,
0.8031509, 0.4467612, 0.4456862, 0.6784314, 0, 1, 1,
0.8063796, -1.873031, 2.998312, 0.6862745, 0, 1, 1,
0.8080748, -0.2627687, 0.3803812, 0.6901961, 0, 1, 1,
0.8149529, -0.3158592, 2.650151, 0.6980392, 0, 1, 1,
0.8150604, 1.585572, 0.1676016, 0.7058824, 0, 1, 1,
0.8173304, -0.5918782, 0.1740107, 0.7098039, 0, 1, 1,
0.8211468, -1.276086, 3.87392, 0.7176471, 0, 1, 1,
0.8234248, -0.1313835, 2.73686, 0.7215686, 0, 1, 1,
0.8235863, -0.08770265, 2.251788, 0.7294118, 0, 1, 1,
0.8291422, 0.3875672, 0.4777149, 0.7333333, 0, 1, 1,
0.82978, -0.5236204, 3.895138, 0.7411765, 0, 1, 1,
0.8299429, -0.6779264, 0.9398174, 0.7450981, 0, 1, 1,
0.8339524, 0.9940082, 0.1571117, 0.7529412, 0, 1, 1,
0.8350396, -0.2617377, 2.484941, 0.7568628, 0, 1, 1,
0.8400558, -0.01361471, 3.176459, 0.7647059, 0, 1, 1,
0.8426883, -0.8611541, 3.078807, 0.7686275, 0, 1, 1,
0.8533577, -0.3279501, 1.045354, 0.7764706, 0, 1, 1,
0.8541963, 0.2502519, 0.9067274, 0.7803922, 0, 1, 1,
0.8553671, -0.1499533, 1.768915, 0.7882353, 0, 1, 1,
0.8613292, -1.213758, 2.951725, 0.7921569, 0, 1, 1,
0.8698369, 1.670989, -0.6053394, 0.8, 0, 1, 1,
0.8725283, 0.4598764, 1.174187, 0.8078431, 0, 1, 1,
0.8730758, -1.154368, 1.724477, 0.8117647, 0, 1, 1,
0.8750848, 0.2308727, 1.036403, 0.8196079, 0, 1, 1,
0.8780373, -0.8457339, 2.450233, 0.8235294, 0, 1, 1,
0.8790023, 0.9361671, 2.103832, 0.8313726, 0, 1, 1,
0.8791752, 1.247769, -0.08666699, 0.8352941, 0, 1, 1,
0.8792152, 1.037196, 1.034562, 0.8431373, 0, 1, 1,
0.8809726, 0.863885, 0.8950491, 0.8470588, 0, 1, 1,
0.8836972, -0.5886677, 4.940444, 0.854902, 0, 1, 1,
0.8919147, -0.4377424, 3.576949, 0.8588235, 0, 1, 1,
0.8933951, 0.6826187, 1.935608, 0.8666667, 0, 1, 1,
0.8987319, 0.06388567, 0.7913876, 0.8705882, 0, 1, 1,
0.9001155, -0.04946967, 1.503847, 0.8784314, 0, 1, 1,
0.9070929, -1.815892, 4.443748, 0.8823529, 0, 1, 1,
0.907742, -0.3188446, 1.910281, 0.8901961, 0, 1, 1,
0.9089525, 0.6244748, 0.6437386, 0.8941177, 0, 1, 1,
0.90927, 0.7639369, 2.470036, 0.9019608, 0, 1, 1,
0.90974, 0.142317, 1.639849, 0.9098039, 0, 1, 1,
0.9128869, -0.9036539, 0.8062069, 0.9137255, 0, 1, 1,
0.9228782, -0.5605546, 2.321255, 0.9215686, 0, 1, 1,
0.930738, -1.709267, 3.478227, 0.9254902, 0, 1, 1,
0.9373118, -1.244361, 3.068962, 0.9333333, 0, 1, 1,
0.9379958, -2.383833, 1.68407, 0.9372549, 0, 1, 1,
0.943274, 0.02551872, 1.655917, 0.945098, 0, 1, 1,
0.9488375, -2.463086, 3.760481, 0.9490196, 0, 1, 1,
0.9499019, -0.4211854, 1.774331, 0.9568627, 0, 1, 1,
0.9575185, -0.663502, 2.610867, 0.9607843, 0, 1, 1,
0.9607701, -0.6650715, 3.136577, 0.9686275, 0, 1, 1,
0.9668689, -0.6235963, 1.107095, 0.972549, 0, 1, 1,
0.9694439, -0.1077801, 2.9935, 0.9803922, 0, 1, 1,
0.9737114, 0.8910847, 0.4077563, 0.9843137, 0, 1, 1,
0.9835589, 1.553872, -0.2385615, 0.9921569, 0, 1, 1,
0.9844593, 0.417866, 2.500741, 0.9960784, 0, 1, 1,
0.9884447, -0.8138577, 2.724485, 1, 0, 0.9960784, 1,
0.9953644, -1.269039, 3.565755, 1, 0, 0.9882353, 1,
0.9989616, -0.3901168, 1.588902, 1, 0, 0.9843137, 1,
1.000805, -0.5520934, 1.04597, 1, 0, 0.9764706, 1,
1.00619, 0.5112153, 2.42184, 1, 0, 0.972549, 1,
1.01435, 0.7142161, 1.844906, 1, 0, 0.9647059, 1,
1.020872, -0.06625173, 0.311382, 1, 0, 0.9607843, 1,
1.024337, -0.2003447, 1.659508, 1, 0, 0.9529412, 1,
1.025048, 0.3994133, 3.560594, 1, 0, 0.9490196, 1,
1.025384, 0.2941552, 0.8730358, 1, 0, 0.9411765, 1,
1.026886, 1.160821, 0.3440203, 1, 0, 0.9372549, 1,
1.030345, -0.3168901, 0.2342533, 1, 0, 0.9294118, 1,
1.034006, 1.203772, -0.09979548, 1, 0, 0.9254902, 1,
1.045809, -0.7864597, 2.283968, 1, 0, 0.9176471, 1,
1.066974, -0.7250326, 2.837304, 1, 0, 0.9137255, 1,
1.067596, -0.8922744, 1.071345, 1, 0, 0.9058824, 1,
1.069814, 0.02944694, 0.4027736, 1, 0, 0.9019608, 1,
1.081822, 0.3883629, 3.409502, 1, 0, 0.8941177, 1,
1.083465, 0.2943204, 2.019426, 1, 0, 0.8862745, 1,
1.092957, -0.1712825, 1.991254, 1, 0, 0.8823529, 1,
1.096093, 0.1774657, 2.261613, 1, 0, 0.8745098, 1,
1.100272, 1.750382, 1.310542, 1, 0, 0.8705882, 1,
1.101362, 0.6445616, 0.6157012, 1, 0, 0.8627451, 1,
1.107088, -0.3999709, 3.027002, 1, 0, 0.8588235, 1,
1.10729, 0.5036758, 1.886228, 1, 0, 0.8509804, 1,
1.108917, -1.086817, 3.231439, 1, 0, 0.8470588, 1,
1.11125, 1.082631, 0.256234, 1, 0, 0.8392157, 1,
1.112862, 0.134518, 1.704552, 1, 0, 0.8352941, 1,
1.115598, -0.8484196, 1.634704, 1, 0, 0.827451, 1,
1.115913, 0.545752, 2.419255, 1, 0, 0.8235294, 1,
1.125576, 0.6919878, 1.783346, 1, 0, 0.8156863, 1,
1.128103, 0.9621135, -0.9716863, 1, 0, 0.8117647, 1,
1.12948, -0.6533252, 2.911629, 1, 0, 0.8039216, 1,
1.129566, -2.076375, 1.452294, 1, 0, 0.7960784, 1,
1.130752, 0.6309286, -0.6173021, 1, 0, 0.7921569, 1,
1.138362, 0.1257428, 2.494867, 1, 0, 0.7843137, 1,
1.139424, 0.1355883, 0.6786719, 1, 0, 0.7803922, 1,
1.152648, 1.215326, 0.1562891, 1, 0, 0.772549, 1,
1.186371, -0.9379517, 3.218302, 1, 0, 0.7686275, 1,
1.189759, 0.4166958, 2.048218, 1, 0, 0.7607843, 1,
1.19272, -0.4926426, 2.90262, 1, 0, 0.7568628, 1,
1.196686, -0.1762358, 1.147476, 1, 0, 0.7490196, 1,
1.199385, 0.07786583, 0.3381616, 1, 0, 0.7450981, 1,
1.203908, -0.315933, 0.3059753, 1, 0, 0.7372549, 1,
1.2083, -0.4742896, 0.5273351, 1, 0, 0.7333333, 1,
1.210434, -0.3282784, 2.508985, 1, 0, 0.7254902, 1,
1.21449, 0.0117814, 2.715415, 1, 0, 0.7215686, 1,
1.22493, -2.674118, 1.70987, 1, 0, 0.7137255, 1,
1.229338, -1.26661, 2.42658, 1, 0, 0.7098039, 1,
1.230834, -0.4912415, -1.168028, 1, 0, 0.7019608, 1,
1.234808, 0.9823341, 0.5716048, 1, 0, 0.6941177, 1,
1.238782, 0.8051815, 1.106944, 1, 0, 0.6901961, 1,
1.240697, -1.201191, 2.823417, 1, 0, 0.682353, 1,
1.251405, 1.548228, 1.227542, 1, 0, 0.6784314, 1,
1.259092, -1.455233, 2.702522, 1, 0, 0.6705883, 1,
1.26211, -1.047596, 2.283593, 1, 0, 0.6666667, 1,
1.271145, -1.619757, 1.958759, 1, 0, 0.6588235, 1,
1.272604, -0.5077753, 1.480816, 1, 0, 0.654902, 1,
1.273328, -0.5361959, 1.28761, 1, 0, 0.6470588, 1,
1.277593, 0.222304, 3.301856, 1, 0, 0.6431373, 1,
1.282031, 0.3069931, 0.3064015, 1, 0, 0.6352941, 1,
1.282649, -0.5514143, 1.666886, 1, 0, 0.6313726, 1,
1.290009, 0.6330384, 1.455558, 1, 0, 0.6235294, 1,
1.293067, -1.644652, 4.049166, 1, 0, 0.6196079, 1,
1.295726, 0.6262238, 2.035815, 1, 0, 0.6117647, 1,
1.300917, -0.2103499, 1.302764, 1, 0, 0.6078432, 1,
1.307752, -0.3373766, 2.103797, 1, 0, 0.6, 1,
1.308021, 1.828898, -1.192397, 1, 0, 0.5921569, 1,
1.309606, -0.3055819, 1.261928, 1, 0, 0.5882353, 1,
1.323652, 0.2445694, -0.5312638, 1, 0, 0.5803922, 1,
1.327969, 1.243193, 1.771015, 1, 0, 0.5764706, 1,
1.332358, -0.2133229, 1.264334, 1, 0, 0.5686275, 1,
1.333162, -0.2341366, 0.977692, 1, 0, 0.5647059, 1,
1.342751, 1.441883, 0.7512784, 1, 0, 0.5568628, 1,
1.343006, -2.23087, 2.462167, 1, 0, 0.5529412, 1,
1.343451, 0.8914051, -0.8272747, 1, 0, 0.5450981, 1,
1.351687, 1.451537, -0.6239709, 1, 0, 0.5411765, 1,
1.359399, -1.767808, 3.196622, 1, 0, 0.5333334, 1,
1.361225, -0.05237094, 0.7906029, 1, 0, 0.5294118, 1,
1.361245, 0.740995, -0.4417362, 1, 0, 0.5215687, 1,
1.361781, 0.4582626, 2.218384, 1, 0, 0.5176471, 1,
1.369739, -1.860902, 0.8297606, 1, 0, 0.509804, 1,
1.380341, 0.404167, 1.300651, 1, 0, 0.5058824, 1,
1.380957, -0.1707092, -0.2542233, 1, 0, 0.4980392, 1,
1.383905, -0.3361337, 2.695892, 1, 0, 0.4901961, 1,
1.383948, 0.0514441, 1.715533, 1, 0, 0.4862745, 1,
1.388278, -0.9475799, 1.989306, 1, 0, 0.4784314, 1,
1.413691, -0.5434855, 2.409742, 1, 0, 0.4745098, 1,
1.419768, -0.4742288, 2.580338, 1, 0, 0.4666667, 1,
1.429332, -0.1922401, 1.247045, 1, 0, 0.4627451, 1,
1.430042, -0.4055966, 2.981684, 1, 0, 0.454902, 1,
1.44021, -0.8795046, 4.315143, 1, 0, 0.4509804, 1,
1.465077, 0.6367308, 1.5722, 1, 0, 0.4431373, 1,
1.4657, -1.085121, 2.689977, 1, 0, 0.4392157, 1,
1.465735, 0.1691497, 1.707507, 1, 0, 0.4313726, 1,
1.466105, 0.1745538, 1.940725, 1, 0, 0.427451, 1,
1.477471, -0.7717731, 4.880786, 1, 0, 0.4196078, 1,
1.493337, -0.4063303, 1.768136, 1, 0, 0.4156863, 1,
1.494604, -0.1904493, 1.29436, 1, 0, 0.4078431, 1,
1.497796, -1.086892, 0.9414333, 1, 0, 0.4039216, 1,
1.528116, -0.7434158, 1.279093, 1, 0, 0.3960784, 1,
1.532116, -0.06971938, 1.070657, 1, 0, 0.3882353, 1,
1.534127, 0.1378268, -0.1061862, 1, 0, 0.3843137, 1,
1.534535, 1.203753, 3.190794, 1, 0, 0.3764706, 1,
1.53621, -0.04627334, 3.053553, 1, 0, 0.372549, 1,
1.54326, -1.31824, 2.018331, 1, 0, 0.3647059, 1,
1.547011, 1.369562, 0.8535801, 1, 0, 0.3607843, 1,
1.547023, 0.9818998, 0.9578236, 1, 0, 0.3529412, 1,
1.547083, 0.8745877, 0.9602457, 1, 0, 0.3490196, 1,
1.550243, 0.7827607, 1.869651, 1, 0, 0.3411765, 1,
1.551393, 0.4767599, 2.430304, 1, 0, 0.3372549, 1,
1.554086, 0.1604706, 2.05586, 1, 0, 0.3294118, 1,
1.560918, 0.8467388, 0.05947836, 1, 0, 0.3254902, 1,
1.565422, 0.5696334, 1.072943, 1, 0, 0.3176471, 1,
1.581978, -1.149517, 2.434681, 1, 0, 0.3137255, 1,
1.595038, 0.7684484, 1.481047, 1, 0, 0.3058824, 1,
1.603265, 0.8065737, 2.615247, 1, 0, 0.2980392, 1,
1.606712, -0.2398659, 2.078185, 1, 0, 0.2941177, 1,
1.612381, 1.695644, -0.5289159, 1, 0, 0.2862745, 1,
1.613172, -0.7343355, 3.47027, 1, 0, 0.282353, 1,
1.61662, 1.06771, -0.2126252, 1, 0, 0.2745098, 1,
1.646976, -0.3934694, 0.1218234, 1, 0, 0.2705882, 1,
1.658316, 0.09397342, 2.087688, 1, 0, 0.2627451, 1,
1.667233, -1.096917, 1.703201, 1, 0, 0.2588235, 1,
1.670907, 0.01160745, 2.228895, 1, 0, 0.2509804, 1,
1.700447, -0.05079399, 0.1796864, 1, 0, 0.2470588, 1,
1.708263, 0.9452491, 2.071679, 1, 0, 0.2392157, 1,
1.708458, -1.807159, 2.093142, 1, 0, 0.2352941, 1,
1.742992, 0.7936717, 2.642475, 1, 0, 0.227451, 1,
1.766927, 1.849679, 2.99684, 1, 0, 0.2235294, 1,
1.775289, -0.3995927, 1.544593, 1, 0, 0.2156863, 1,
1.779318, -0.3386947, 2.383006, 1, 0, 0.2117647, 1,
1.783745, -0.9128706, 1.174921, 1, 0, 0.2039216, 1,
1.786903, 0.8026216, 1.173579, 1, 0, 0.1960784, 1,
1.801416, -0.04718121, 0.7195209, 1, 0, 0.1921569, 1,
1.802971, 1.659513, 1.733008, 1, 0, 0.1843137, 1,
1.807857, -1.374649, 2.598415, 1, 0, 0.1803922, 1,
1.814775, 0.3395261, 1.624602, 1, 0, 0.172549, 1,
1.816613, 1.491041, 1.568564, 1, 0, 0.1686275, 1,
1.849663, -1.066865, 1.012837, 1, 0, 0.1607843, 1,
1.858967, 2.750585, 0.8305339, 1, 0, 0.1568628, 1,
1.955112, -2.4521, 1.592041, 1, 0, 0.1490196, 1,
2.001713, -1.085229, 3.676669, 1, 0, 0.145098, 1,
2.01023, 0.7913622, 2.732482, 1, 0, 0.1372549, 1,
2.010967, -0.5282777, 1.611884, 1, 0, 0.1333333, 1,
2.019349, 0.9872083, 1.008185, 1, 0, 0.1254902, 1,
2.032806, 0.1470177, 1.993296, 1, 0, 0.1215686, 1,
2.0474, 0.7760703, 2.379543, 1, 0, 0.1137255, 1,
2.098481, -0.6646179, 1.265027, 1, 0, 0.1098039, 1,
2.138227, -1.10544, 1.584956, 1, 0, 0.1019608, 1,
2.149894, 1.98283, 1.544139, 1, 0, 0.09411765, 1,
2.171024, -0.7236803, 0.830645, 1, 0, 0.09019608, 1,
2.208005, -0.7435527, 1.383976, 1, 0, 0.08235294, 1,
2.235701, 0.8890718, 2.287112, 1, 0, 0.07843138, 1,
2.237323, 1.868906, 1.723049, 1, 0, 0.07058824, 1,
2.286331, -0.5031508, 1.874333, 1, 0, 0.06666667, 1,
2.297813, 0.3951866, 2.619546, 1, 0, 0.05882353, 1,
2.397886, 1.43306, 2.629097, 1, 0, 0.05490196, 1,
2.411837, 0.2382386, 0.8368781, 1, 0, 0.04705882, 1,
2.498405, 0.1059454, 1.656298, 1, 0, 0.04313726, 1,
2.52926, 0.3805853, 1.906121, 1, 0, 0.03529412, 1,
2.817919, 0.6888812, 0.9610106, 1, 0, 0.03137255, 1,
2.992571, 0.5049626, -0.7579607, 1, 0, 0.02352941, 1,
3.067447, 0.4933814, 0.9112628, 1, 0, 0.01960784, 1,
3.069051, 2.058808, 1.100568, 1, 0, 0.01176471, 1,
3.903837, -0.1032062, 2.912146, 1, 0, 0.007843138, 1
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
0.1533252, -4.684266, -6.66125, 0, -0.5, 0.5, 0.5,
0.1533252, -4.684266, -6.66125, 1, -0.5, 0.5, 0.5,
0.1533252, -4.684266, -6.66125, 1, 1.5, 0.5, 0.5,
0.1533252, -4.684266, -6.66125, 0, 1.5, 0.5, 0.5
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
-4.86861, 0.005013943, -6.66125, 0, -0.5, 0.5, 0.5,
-4.86861, 0.005013943, -6.66125, 1, -0.5, 0.5, 0.5,
-4.86861, 0.005013943, -6.66125, 1, 1.5, 0.5, 0.5,
-4.86861, 0.005013943, -6.66125, 0, 1.5, 0.5, 0.5
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
-4.86861, -4.684266, 0.1502094, 0, -0.5, 0.5, 0.5,
-4.86861, -4.684266, 0.1502094, 1, -0.5, 0.5, 0.5,
-4.86861, -4.684266, 0.1502094, 1, 1.5, 0.5, 0.5,
-4.86861, -4.684266, 0.1502094, 0, 1.5, 0.5, 0.5
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
-2, -3.602124, -5.089375,
2, -3.602124, -5.089375,
-2, -3.602124, -5.089375,
-2, -3.782481, -5.351354,
0, -3.602124, -5.089375,
0, -3.782481, -5.351354,
2, -3.602124, -5.089375,
2, -3.782481, -5.351354
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
-2, -4.143195, -5.875313, 0, -0.5, 0.5, 0.5,
-2, -4.143195, -5.875313, 1, -0.5, 0.5, 0.5,
-2, -4.143195, -5.875313, 1, 1.5, 0.5, 0.5,
-2, -4.143195, -5.875313, 0, 1.5, 0.5, 0.5,
0, -4.143195, -5.875313, 0, -0.5, 0.5, 0.5,
0, -4.143195, -5.875313, 1, -0.5, 0.5, 0.5,
0, -4.143195, -5.875313, 1, 1.5, 0.5, 0.5,
0, -4.143195, -5.875313, 0, 1.5, 0.5, 0.5,
2, -4.143195, -5.875313, 0, -0.5, 0.5, 0.5,
2, -4.143195, -5.875313, 1, -0.5, 0.5, 0.5,
2, -4.143195, -5.875313, 1, 1.5, 0.5, 0.5,
2, -4.143195, -5.875313, 0, 1.5, 0.5, 0.5
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
-3.709702, -2, -5.089375,
-3.709702, 2, -5.089375,
-3.709702, -2, -5.089375,
-3.902853, -2, -5.351354,
-3.709702, 0, -5.089375,
-3.902853, 0, -5.351354,
-3.709702, 2, -5.089375,
-3.902853, 2, -5.351354
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
-4.289156, -2, -5.875313, 0, -0.5, 0.5, 0.5,
-4.289156, -2, -5.875313, 1, -0.5, 0.5, 0.5,
-4.289156, -2, -5.875313, 1, 1.5, 0.5, 0.5,
-4.289156, -2, -5.875313, 0, 1.5, 0.5, 0.5,
-4.289156, 0, -5.875313, 0, -0.5, 0.5, 0.5,
-4.289156, 0, -5.875313, 1, -0.5, 0.5, 0.5,
-4.289156, 0, -5.875313, 1, 1.5, 0.5, 0.5,
-4.289156, 0, -5.875313, 0, 1.5, 0.5, 0.5,
-4.289156, 2, -5.875313, 0, -0.5, 0.5, 0.5,
-4.289156, 2, -5.875313, 1, -0.5, 0.5, 0.5,
-4.289156, 2, -5.875313, 1, 1.5, 0.5, 0.5,
-4.289156, 2, -5.875313, 0, 1.5, 0.5, 0.5
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
-3.709702, -3.602124, -4,
-3.709702, -3.602124, 4,
-3.709702, -3.602124, -4,
-3.902853, -3.782481, -4,
-3.709702, -3.602124, -2,
-3.902853, -3.782481, -2,
-3.709702, -3.602124, 0,
-3.902853, -3.782481, 0,
-3.709702, -3.602124, 2,
-3.902853, -3.782481, 2,
-3.709702, -3.602124, 4,
-3.902853, -3.782481, 4
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
-4.289156, -4.143195, -4, 0, -0.5, 0.5, 0.5,
-4.289156, -4.143195, -4, 1, -0.5, 0.5, 0.5,
-4.289156, -4.143195, -4, 1, 1.5, 0.5, 0.5,
-4.289156, -4.143195, -4, 0, 1.5, 0.5, 0.5,
-4.289156, -4.143195, -2, 0, -0.5, 0.5, 0.5,
-4.289156, -4.143195, -2, 1, -0.5, 0.5, 0.5,
-4.289156, -4.143195, -2, 1, 1.5, 0.5, 0.5,
-4.289156, -4.143195, -2, 0, 1.5, 0.5, 0.5,
-4.289156, -4.143195, 0, 0, -0.5, 0.5, 0.5,
-4.289156, -4.143195, 0, 1, -0.5, 0.5, 0.5,
-4.289156, -4.143195, 0, 1, 1.5, 0.5, 0.5,
-4.289156, -4.143195, 0, 0, 1.5, 0.5, 0.5,
-4.289156, -4.143195, 2, 0, -0.5, 0.5, 0.5,
-4.289156, -4.143195, 2, 1, -0.5, 0.5, 0.5,
-4.289156, -4.143195, 2, 1, 1.5, 0.5, 0.5,
-4.289156, -4.143195, 2, 0, 1.5, 0.5, 0.5,
-4.289156, -4.143195, 4, 0, -0.5, 0.5, 0.5,
-4.289156, -4.143195, 4, 1, -0.5, 0.5, 0.5,
-4.289156, -4.143195, 4, 1, 1.5, 0.5, 0.5,
-4.289156, -4.143195, 4, 0, 1.5, 0.5, 0.5
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
-3.709702, -3.602124, -5.089375,
-3.709702, 3.612152, -5.089375,
-3.709702, -3.602124, 5.389794,
-3.709702, 3.612152, 5.389794,
-3.709702, -3.602124, -5.089375,
-3.709702, -3.602124, 5.389794,
-3.709702, 3.612152, -5.089375,
-3.709702, 3.612152, 5.389794,
-3.709702, -3.602124, -5.089375,
4.016353, -3.602124, -5.089375,
-3.709702, -3.602124, 5.389794,
4.016353, -3.602124, 5.389794,
-3.709702, 3.612152, -5.089375,
4.016353, 3.612152, -5.089375,
-3.709702, 3.612152, 5.389794,
4.016353, 3.612152, 5.389794,
4.016353, -3.602124, -5.089375,
4.016353, 3.612152, -5.089375,
4.016353, -3.602124, 5.389794,
4.016353, 3.612152, 5.389794,
4.016353, -3.602124, -5.089375,
4.016353, -3.602124, 5.389794,
4.016353, 3.612152, -5.089375,
4.016353, 3.612152, 5.389794
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
var radius = 7.948076;
var distance = 35.36189;
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
mvMatrix.translate( -0.1533252, -0.005013943, -0.1502094 );
mvMatrix.scale( 1.11229, 1.191196, 0.8200666 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.36189);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Fenobucarb<-read.table("Fenobucarb.xyz")
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
-3.597187, -1.404744, -2.400621, 0, 0, 1, 1, 1,
-3.348296, -0.04393208, -2.627444, 1, 0, 0, 1, 1,
-3.118328, -0.7269834, -2.431516, 1, 0, 0, 1, 1,
-3.049114, 1.289282, -1.848573, 1, 0, 0, 1, 1,
-2.925712, 0.4562822, -0.5072066, 1, 0, 0, 1, 1,
-2.814251, 0.2812347, -2.252859, 1, 0, 0, 1, 1,
-2.784663, -0.2078754, -1.797292, 0, 0, 0, 1, 1,
-2.760291, 2.387543, -1.788075, 0, 0, 0, 1, 1,
-2.753949, -0.2623288, -1.097365, 0, 0, 0, 1, 1,
-2.670324, 0.8924521, -2.758671, 0, 0, 0, 1, 1,
-2.617104, 0.1998905, -2.458611, 0, 0, 0, 1, 1,
-2.545351, 1.310567, 0.3323282, 0, 0, 0, 1, 1,
-2.507532, -1.246127, -0.1936304, 0, 0, 0, 1, 1,
-2.454145, 0.2188449, -1.337202, 1, 1, 1, 1, 1,
-2.438385, 0.005130684, -1.88761, 1, 1, 1, 1, 1,
-2.404525, -1.087808, -1.636558, 1, 1, 1, 1, 1,
-2.394427, 1.407102, -1.798037, 1, 1, 1, 1, 1,
-2.328806, -0.08653655, -1.461217, 1, 1, 1, 1, 1,
-2.321908, 0.2828617, -1.522029, 1, 1, 1, 1, 1,
-2.256009, 0.3424517, -1.654572, 1, 1, 1, 1, 1,
-2.255005, -0.3389091, -2.67937, 1, 1, 1, 1, 1,
-2.253255, -0.3540877, -0.07366384, 1, 1, 1, 1, 1,
-2.234977, -0.1286173, -3.428725, 1, 1, 1, 1, 1,
-2.202345, 1.894344, -0.4863997, 1, 1, 1, 1, 1,
-2.173404, -0.1139502, -1.694266, 1, 1, 1, 1, 1,
-2.166722, 0.422319, -1.071201, 1, 1, 1, 1, 1,
-2.163925, 0.447472, -2.327391, 1, 1, 1, 1, 1,
-2.152049, 1.455759, -0.4856481, 1, 1, 1, 1, 1,
-2.144756, -0.3308775, -1.317264, 0, 0, 1, 1, 1,
-2.09856, -0.8316758, -1.144003, 1, 0, 0, 1, 1,
-2.050663, -0.04786595, -2.68752, 1, 0, 0, 1, 1,
-2.010229, 0.3947596, -2.264549, 1, 0, 0, 1, 1,
-1.994541, -0.7778127, -1.486288, 1, 0, 0, 1, 1,
-1.985984, 0.2298307, 0.006788256, 1, 0, 0, 1, 1,
-1.96361, 0.05168479, -2.603846, 0, 0, 0, 1, 1,
-1.945542, 2.076677, -1.05258, 0, 0, 0, 1, 1,
-1.901858, 0.2750864, -0.8458281, 0, 0, 0, 1, 1,
-1.893999, 1.251305, -0.5056183, 0, 0, 0, 1, 1,
-1.885013, -1.094959, -1.699988, 0, 0, 0, 1, 1,
-1.873605, 1.511706, 0.01283905, 0, 0, 0, 1, 1,
-1.856149, 0.4113892, 0.4269035, 0, 0, 0, 1, 1,
-1.851718, -0.3297465, -2.628637, 1, 1, 1, 1, 1,
-1.84136, 0.26772, -2.884932, 1, 1, 1, 1, 1,
-1.814697, -0.5651394, -0.6865093, 1, 1, 1, 1, 1,
-1.807521, -1.675286, -1.562412, 1, 1, 1, 1, 1,
-1.804864, 0.07812558, -2.937786, 1, 1, 1, 1, 1,
-1.792242, -0.4565164, -1.413323, 1, 1, 1, 1, 1,
-1.785715, 2.583456, 1.704202, 1, 1, 1, 1, 1,
-1.780661, -1.688581, -2.098403, 1, 1, 1, 1, 1,
-1.763393, -1.121484, -2.623778, 1, 1, 1, 1, 1,
-1.758187, 0.5715762, -1.771333, 1, 1, 1, 1, 1,
-1.742809, 0.06208477, 0.5670907, 1, 1, 1, 1, 1,
-1.729839, 0.7404506, -3.592614, 1, 1, 1, 1, 1,
-1.718392, -1.235062, -1.525169, 1, 1, 1, 1, 1,
-1.695814, 1.019166, 0.2929131, 1, 1, 1, 1, 1,
-1.686789, 0.2481913, -2.707252, 1, 1, 1, 1, 1,
-1.684608, 0.6732296, -0.8170031, 0, 0, 1, 1, 1,
-1.676404, -0.6297719, -1.682682, 1, 0, 0, 1, 1,
-1.648255, 0.04731449, -2.716598, 1, 0, 0, 1, 1,
-1.6436, 0.2104837, -1.419688, 1, 0, 0, 1, 1,
-1.639948, 1.389664, -1.585284, 1, 0, 0, 1, 1,
-1.616105, -1.857993, -2.742696, 1, 0, 0, 1, 1,
-1.611865, -1.33147, -2.349844, 0, 0, 0, 1, 1,
-1.582009, -1.166531, -1.188716, 0, 0, 0, 1, 1,
-1.539765, 1.411106, -0.02221199, 0, 0, 0, 1, 1,
-1.539477, 0.7468001, -0.09142295, 0, 0, 0, 1, 1,
-1.527825, -1.189238, -3.179155, 0, 0, 0, 1, 1,
-1.52774, 0.811484, -1.32766, 0, 0, 0, 1, 1,
-1.523659, -0.927315, -0.7575505, 0, 0, 0, 1, 1,
-1.522915, -1.090038, -1.892665, 1, 1, 1, 1, 1,
-1.522415, -0.3577785, -1.545371, 1, 1, 1, 1, 1,
-1.5147, 0.250059, -0.696757, 1, 1, 1, 1, 1,
-1.51097, -0.2243843, 0.9792979, 1, 1, 1, 1, 1,
-1.492204, -0.7644209, -2.985529, 1, 1, 1, 1, 1,
-1.48917, -0.2995508, -1.464116, 1, 1, 1, 1, 1,
-1.462147, -1.151198, -2.556133, 1, 1, 1, 1, 1,
-1.458474, 0.1190628, -3.232773, 1, 1, 1, 1, 1,
-1.455553, 3.50709, 0.1329581, 1, 1, 1, 1, 1,
-1.449884, -0.3295312, -1.221513, 1, 1, 1, 1, 1,
-1.43905, 0.9474846, -0.0838004, 1, 1, 1, 1, 1,
-1.408823, 0.867246, -0.5687298, 1, 1, 1, 1, 1,
-1.389145, -0.5043979, -2.405753, 1, 1, 1, 1, 1,
-1.371239, 0.8024399, -0.1053655, 1, 1, 1, 1, 1,
-1.358461, -0.3171945, -2.597238, 1, 1, 1, 1, 1,
-1.355141, -0.2902826, -1.12728, 0, 0, 1, 1, 1,
-1.353262, 0.5871707, -1.617979, 1, 0, 0, 1, 1,
-1.347844, 1.977454, -1.374808, 1, 0, 0, 1, 1,
-1.34291, 0.4368822, -3.37095, 1, 0, 0, 1, 1,
-1.334114, -1.972583, -2.550709, 1, 0, 0, 1, 1,
-1.333242, 0.1599901, -1.711696, 1, 0, 0, 1, 1,
-1.330099, -1.866618, -4.186445, 0, 0, 0, 1, 1,
-1.323294, -3.497062, -3.09932, 0, 0, 0, 1, 1,
-1.321244, 2.047506, -1.659655, 0, 0, 0, 1, 1,
-1.320531, -0.07039571, -3.203857, 0, 0, 0, 1, 1,
-1.314631, 0.3030513, -0.7635458, 0, 0, 0, 1, 1,
-1.307628, 0.3425925, -3.95118, 0, 0, 0, 1, 1,
-1.298763, -0.6209249, -2.688062, 0, 0, 0, 1, 1,
-1.287842, -0.1074675, -2.951506, 1, 1, 1, 1, 1,
-1.278637, 0.2400882, -0.3177751, 1, 1, 1, 1, 1,
-1.259847, 0.6361333, -1.268044, 1, 1, 1, 1, 1,
-1.254594, 0.1000001, -0.687593, 1, 1, 1, 1, 1,
-1.249182, 0.581533, -2.030008, 1, 1, 1, 1, 1,
-1.239427, -1.404308, -3.933992, 1, 1, 1, 1, 1,
-1.21884, 0.4076412, -1.941025, 1, 1, 1, 1, 1,
-1.21721, -1.178041, -1.90227, 1, 1, 1, 1, 1,
-1.216285, 1.499353, -0.2142021, 1, 1, 1, 1, 1,
-1.214586, 1.035655, -0.3175122, 1, 1, 1, 1, 1,
-1.212454, -0.4391129, -3.148402, 1, 1, 1, 1, 1,
-1.212399, 0.2010948, -1.145516, 1, 1, 1, 1, 1,
-1.209821, 0.07339807, -0.9470599, 1, 1, 1, 1, 1,
-1.202882, -0.02008818, -2.877925, 1, 1, 1, 1, 1,
-1.19943, 0.3702545, -0.7565378, 1, 1, 1, 1, 1,
-1.198344, 0.883173, -1.408759, 0, 0, 1, 1, 1,
-1.196979, 0.6452075, -2.079791, 1, 0, 0, 1, 1,
-1.184497, 1.03638, -1.141297, 1, 0, 0, 1, 1,
-1.18146, 0.8183293, -0.9780098, 1, 0, 0, 1, 1,
-1.17548, -0.04213556, -0.8190906, 1, 0, 0, 1, 1,
-1.174206, -1.098724, -2.340205, 1, 0, 0, 1, 1,
-1.172737, -0.8358465, -1.478623, 0, 0, 0, 1, 1,
-1.170172, -0.5163035, -2.080345, 0, 0, 0, 1, 1,
-1.164649, 0.2300442, -1.396018, 0, 0, 0, 1, 1,
-1.146217, 0.5299245, -1.894094, 0, 0, 0, 1, 1,
-1.142628, -0.09907435, -1.30121, 0, 0, 0, 1, 1,
-1.142369, -1.444857, -3.8059, 0, 0, 0, 1, 1,
-1.135574, -1.154731, -4.071034, 0, 0, 0, 1, 1,
-1.121928, 2.045467, 0.1080584, 1, 1, 1, 1, 1,
-1.121722, 0.5608322, -0.8983123, 1, 1, 1, 1, 1,
-1.121662, -0.6882342, -1.86498, 1, 1, 1, 1, 1,
-1.11632, -0.2636851, -1.360779, 1, 1, 1, 1, 1,
-1.115045, -0.9739721, -1.707164, 1, 1, 1, 1, 1,
-1.115005, -0.5824985, -2.856966, 1, 1, 1, 1, 1,
-1.111378, -0.5778361, -2.563431, 1, 1, 1, 1, 1,
-1.110911, -0.244871, -3.628538, 1, 1, 1, 1, 1,
-1.104189, 1.059746, -0.4666204, 1, 1, 1, 1, 1,
-1.102958, 2.503418, 0.9704933, 1, 1, 1, 1, 1,
-1.096888, 2.144943, -0.8246635, 1, 1, 1, 1, 1,
-1.090184, 0.877092, -1.094129, 1, 1, 1, 1, 1,
-1.089433, 0.5058321, -0.03283125, 1, 1, 1, 1, 1,
-1.088426, 0.4717573, -0.9044676, 1, 1, 1, 1, 1,
-1.087617, -0.01146204, -1.185919, 1, 1, 1, 1, 1,
-1.08401, -0.6048616, -2.937949, 0, 0, 1, 1, 1,
-1.080776, -1.61209, -1.242429, 1, 0, 0, 1, 1,
-1.079663, 0.6750085, -0.82301, 1, 0, 0, 1, 1,
-1.077535, 0.4388588, -1.05734, 1, 0, 0, 1, 1,
-1.064991, -0.1340362, 0.8304796, 1, 0, 0, 1, 1,
-1.05768, 0.2466604, -1.366808, 1, 0, 0, 1, 1,
-1.054121, 0.2866805, -1.009788, 0, 0, 0, 1, 1,
-1.049262, 0.3825386, 0.5353134, 0, 0, 0, 1, 1,
-1.042804, 1.244766, 0.2018649, 0, 0, 0, 1, 1,
-1.038871, 1.190518, -2.677104, 0, 0, 0, 1, 1,
-1.036241, 3.270984, -1.960306, 0, 0, 0, 1, 1,
-1.034409, 0.2018521, -2.444239, 0, 0, 0, 1, 1,
-1.030334, 0.3103815, -0.5169988, 0, 0, 0, 1, 1,
-1.025996, -0.3259945, -0.9399694, 1, 1, 1, 1, 1,
-1.016078, -0.8582543, -2.925493, 1, 1, 1, 1, 1,
-1.015055, -0.5143194, -3.639886, 1, 1, 1, 1, 1,
-1.010189, 0.3836398, -0.4661739, 1, 1, 1, 1, 1,
-1.003987, -0.4638714, -3.978447, 1, 1, 1, 1, 1,
-0.9821162, -1.582574, -2.203001, 1, 1, 1, 1, 1,
-0.981225, -0.8433461, -2.493994, 1, 1, 1, 1, 1,
-0.9742342, 0.6459004, 0.2397773, 1, 1, 1, 1, 1,
-0.9734844, 0.4269656, -0.6245024, 1, 1, 1, 1, 1,
-0.9724873, -0.2436245, -3.820302, 1, 1, 1, 1, 1,
-0.9700276, 0.06595134, -2.060486, 1, 1, 1, 1, 1,
-0.9669223, -0.4225813, -1.74587, 1, 1, 1, 1, 1,
-0.9653562, 0.9976826, -0.07882232, 1, 1, 1, 1, 1,
-0.9626228, 0.609945, -1.536901, 1, 1, 1, 1, 1,
-0.9623244, -1.280267, -3.249839, 1, 1, 1, 1, 1,
-0.9608732, -0.8846157, -2.798402, 0, 0, 1, 1, 1,
-0.9538845, 1.327177, 0.5655642, 1, 0, 0, 1, 1,
-0.9479601, -0.8435633, -2.121085, 1, 0, 0, 1, 1,
-0.9473368, 1.175494, -1.536995, 1, 0, 0, 1, 1,
-0.9436657, 1.635572, -2.086446, 1, 0, 0, 1, 1,
-0.9340773, 0.1921042, -0.4920595, 1, 0, 0, 1, 1,
-0.9271601, 1.408678, -2.719186, 0, 0, 0, 1, 1,
-0.9248166, -0.1091964, -2.472772, 0, 0, 0, 1, 1,
-0.9241758, 0.6475964, -1.830275, 0, 0, 0, 1, 1,
-0.9226786, 0.7113247, -0.494514, 0, 0, 0, 1, 1,
-0.9216933, 1.099469, -1.073154, 0, 0, 0, 1, 1,
-0.9193651, -1.087253, -2.053826, 0, 0, 0, 1, 1,
-0.9183484, 1.974313, -2.020103, 0, 0, 0, 1, 1,
-0.9027032, 0.04000619, -2.23674, 1, 1, 1, 1, 1,
-0.900288, 0.06810701, -1.919486, 1, 1, 1, 1, 1,
-0.8987742, 0.9583592, 1.883626, 1, 1, 1, 1, 1,
-0.8966482, -0.1241468, -1.83488, 1, 1, 1, 1, 1,
-0.8956951, -0.8024992, -2.072597, 1, 1, 1, 1, 1,
-0.8895881, -0.2491806, -2.520025, 1, 1, 1, 1, 1,
-0.8884896, 0.1769679, -2.174115, 1, 1, 1, 1, 1,
-0.8723089, -0.2441405, -2.506866, 1, 1, 1, 1, 1,
-0.8640009, 0.9646316, -1.119003, 1, 1, 1, 1, 1,
-0.8635596, 1.313483, -1.076935, 1, 1, 1, 1, 1,
-0.8633898, 0.264405, -1.414607, 1, 1, 1, 1, 1,
-0.8594689, 2.088805, -2.174416, 1, 1, 1, 1, 1,
-0.8568843, 0.6073747, -1.71923, 1, 1, 1, 1, 1,
-0.8541077, -0.2682282, -1.789718, 1, 1, 1, 1, 1,
-0.8518476, -0.4039721, -3.113615, 1, 1, 1, 1, 1,
-0.8509606, -1.742017, -3.195947, 0, 0, 1, 1, 1,
-0.8505861, 1.524116, -1.050418, 1, 0, 0, 1, 1,
-0.8473152, 0.6871763, -0.7962216, 1, 0, 0, 1, 1,
-0.8408267, 1.444682, -1.342687, 1, 0, 0, 1, 1,
-0.8351786, -1.681483, -4.000735, 1, 0, 0, 1, 1,
-0.8346933, 1.145828, -2.040869, 1, 0, 0, 1, 1,
-0.8299582, -1.384202, -1.796177, 0, 0, 0, 1, 1,
-0.8246695, 0.1744465, -1.470635, 0, 0, 0, 1, 1,
-0.814439, 0.5816555, 1.528479, 0, 0, 0, 1, 1,
-0.8114034, -1.040871, -2.001801, 0, 0, 0, 1, 1,
-0.811184, 1.523109, 0.3437877, 0, 0, 0, 1, 1,
-0.8106086, -0.4503099, -1.919883, 0, 0, 0, 1, 1,
-0.8056556, -0.2436199, -0.4183111, 0, 0, 0, 1, 1,
-0.7902511, -0.09678024, -0.07835989, 1, 1, 1, 1, 1,
-0.7881788, -0.08905885, -2.267945, 1, 1, 1, 1, 1,
-0.7857642, -0.491704, -2.225584, 1, 1, 1, 1, 1,
-0.7825952, -1.406103, -1.48663, 1, 1, 1, 1, 1,
-0.7796956, 1.956483, -2.390276, 1, 1, 1, 1, 1,
-0.7783711, -0.7277091, -1.583338, 1, 1, 1, 1, 1,
-0.7766019, 1.890832, -0.8025952, 1, 1, 1, 1, 1,
-0.7741605, -0.2561547, -3.098564, 1, 1, 1, 1, 1,
-0.7688246, -0.5606688, -1.912915, 1, 1, 1, 1, 1,
-0.7678412, -0.1107628, -2.467072, 1, 1, 1, 1, 1,
-0.7566291, 1.009036, -1.112403, 1, 1, 1, 1, 1,
-0.7559876, -0.2360843, 0.414292, 1, 1, 1, 1, 1,
-0.7477301, -1.285924, 1.169171, 1, 1, 1, 1, 1,
-0.7449902, 0.1258538, -1.599448, 1, 1, 1, 1, 1,
-0.7442884, 1.792848, -1.906963, 1, 1, 1, 1, 1,
-0.7440717, -1.10023, -4.193146, 0, 0, 1, 1, 1,
-0.7402277, 0.2165116, -2.680637, 1, 0, 0, 1, 1,
-0.7382441, -0.4671738, -2.843513, 1, 0, 0, 1, 1,
-0.7353306, -0.1646328, -1.501738, 1, 0, 0, 1, 1,
-0.7321102, -0.7069563, -1.605547, 1, 0, 0, 1, 1,
-0.7297423, 1.704986, -1.374239, 1, 0, 0, 1, 1,
-0.7282097, -0.7027143, -2.258454, 0, 0, 0, 1, 1,
-0.7240805, 1.187753, 0.683598, 0, 0, 0, 1, 1,
-0.7237975, 1.470426, 0.6914069, 0, 0, 0, 1, 1,
-0.7185562, -0.7100133, -2.598233, 0, 0, 0, 1, 1,
-0.7183046, 0.5465156, 0.4831037, 0, 0, 0, 1, 1,
-0.7129402, 0.8303373, -1.715386, 0, 0, 0, 1, 1,
-0.7085767, -1.240582, -1.810848, 0, 0, 0, 1, 1,
-0.7050617, 0.2087672, -1.286619, 1, 1, 1, 1, 1,
-0.7050377, 2.176039, -0.4923922, 1, 1, 1, 1, 1,
-0.7037387, 0.5426336, -2.083547, 1, 1, 1, 1, 1,
-0.7031843, 0.5188196, -1.575861, 1, 1, 1, 1, 1,
-0.6989889, 0.2218865, -2.417476, 1, 1, 1, 1, 1,
-0.6915462, -0.2565417, -1.443218, 1, 1, 1, 1, 1,
-0.6877601, 0.7619064, -2.133246, 1, 1, 1, 1, 1,
-0.6862127, -1.256297, -3.496166, 1, 1, 1, 1, 1,
-0.6843438, -0.4684977, -1.377087, 1, 1, 1, 1, 1,
-0.6788992, -0.2199239, -1.522516, 1, 1, 1, 1, 1,
-0.6641917, -1.123061, -3.732323, 1, 1, 1, 1, 1,
-0.6622494, -0.9556596, -1.532886, 1, 1, 1, 1, 1,
-0.6612603, 0.4933149, -0.3237726, 1, 1, 1, 1, 1,
-0.6602531, 1.217215, 0.5865569, 1, 1, 1, 1, 1,
-0.6565972, -1.556302, -4.661306, 1, 1, 1, 1, 1,
-0.6512699, -0.0435995, -1.229125, 0, 0, 1, 1, 1,
-0.6445945, 1.045491, 0.5860258, 1, 0, 0, 1, 1,
-0.6319667, -0.03470756, -2.280521, 1, 0, 0, 1, 1,
-0.6314042, -0.2886829, 0.7930032, 1, 0, 0, 1, 1,
-0.6296715, 0.3425894, -1.467024, 1, 0, 0, 1, 1,
-0.6279231, -0.5393775, -0.5390551, 1, 0, 0, 1, 1,
-0.6275026, -0.5436133, -1.195641, 0, 0, 0, 1, 1,
-0.6250645, 0.1375159, -1.148101, 0, 0, 0, 1, 1,
-0.6109234, -0.1830312, -1.087682, 0, 0, 0, 1, 1,
-0.6108705, -0.1484369, -2.724887, 0, 0, 0, 1, 1,
-0.6083534, -0.1975266, -0.5595255, 0, 0, 0, 1, 1,
-0.6022658, 0.5804177, -0.05739106, 0, 0, 0, 1, 1,
-0.6019709, -1.432031, -2.237454, 0, 0, 0, 1, 1,
-0.6015199, 0.3715274, 1.030071, 1, 1, 1, 1, 1,
-0.6005223, -0.2375029, -1.38384, 1, 1, 1, 1, 1,
-0.6003463, 0.7710915, -3.451253, 1, 1, 1, 1, 1,
-0.6001138, -0.07482667, -1.446885, 1, 1, 1, 1, 1,
-0.5920388, -1.413955, -1.831115, 1, 1, 1, 1, 1,
-0.591056, -0.537563, -2.78427, 1, 1, 1, 1, 1,
-0.590535, 1.010061, -0.5689673, 1, 1, 1, 1, 1,
-0.5836041, 1.585983, 1.552381, 1, 1, 1, 1, 1,
-0.5835302, -0.61292, -2.105495, 1, 1, 1, 1, 1,
-0.5819377, -0.4045178, -1.614004, 1, 1, 1, 1, 1,
-0.5812728, -0.595242, -1.993373, 1, 1, 1, 1, 1,
-0.5788478, 0.402992, -0.5903587, 1, 1, 1, 1, 1,
-0.5767227, 0.3724782, -0.4092659, 1, 1, 1, 1, 1,
-0.5745506, -0.5726025, -1.960436, 1, 1, 1, 1, 1,
-0.574497, 1.030411, -0.4840819, 1, 1, 1, 1, 1,
-0.5707239, -0.8378801, -2.650666, 0, 0, 1, 1, 1,
-0.5695471, -0.0108258, -1.612602, 1, 0, 0, 1, 1,
-0.566954, 0.154754, -2.332003, 1, 0, 0, 1, 1,
-0.565267, -0.3021919, -1.500581, 1, 0, 0, 1, 1,
-0.5618337, -2.751089, -3.417958, 1, 0, 0, 1, 1,
-0.561159, 1.400464, -0.3035418, 1, 0, 0, 1, 1,
-0.5594671, -0.1779536, -2.135245, 0, 0, 0, 1, 1,
-0.5593146, 0.05843654, -3.284531, 0, 0, 0, 1, 1,
-0.5533357, 1.596461, 1.204844, 0, 0, 0, 1, 1,
-0.5527075, -0.7336039, -3.908234, 0, 0, 0, 1, 1,
-0.5524141, 0.2013776, 0.2238786, 0, 0, 0, 1, 1,
-0.5484063, 0.6318219, -2.266021, 0, 0, 0, 1, 1,
-0.5417063, -1.082931, -3.766557, 0, 0, 0, 1, 1,
-0.5386655, 1.30641, -1.03475, 1, 1, 1, 1, 1,
-0.5357298, 1.543497, 0.6593392, 1, 1, 1, 1, 1,
-0.530932, 0.1457668, -0.4603433, 1, 1, 1, 1, 1,
-0.5252814, 0.3401522, -1.098926, 1, 1, 1, 1, 1,
-0.5229928, -1.398702, -1.158698, 1, 1, 1, 1, 1,
-0.5181566, -0.867461, -2.261074, 1, 1, 1, 1, 1,
-0.5142683, 0.4681477, -1.968763, 1, 1, 1, 1, 1,
-0.513704, 0.009774177, 0.07603051, 1, 1, 1, 1, 1,
-0.5103527, 0.522646, 1.383698, 1, 1, 1, 1, 1,
-0.508329, -0.9734664, -2.711766, 1, 1, 1, 1, 1,
-0.5072806, -0.04472189, -1.703946, 1, 1, 1, 1, 1,
-0.5058629, 1.034098, 0.7950608, 1, 1, 1, 1, 1,
-0.5043244, -1.595212, -2.066007, 1, 1, 1, 1, 1,
-0.5036925, 0.5846894, 0.09080955, 1, 1, 1, 1, 1,
-0.4983517, 0.3319498, -2.819233, 1, 1, 1, 1, 1,
-0.4886934, -1.354762, -2.355559, 0, 0, 1, 1, 1,
-0.4847473, 1.577365, -1.284436, 1, 0, 0, 1, 1,
-0.4822857, 0.5062619, -1.205376, 1, 0, 0, 1, 1,
-0.4771377, -0.4991785, -1.860599, 1, 0, 0, 1, 1,
-0.4768336, 0.5757903, -0.9253305, 1, 0, 0, 1, 1,
-0.4765493, -1.69655, -1.223095, 1, 0, 0, 1, 1,
-0.4733854, -0.4836042, -2.018086, 0, 0, 0, 1, 1,
-0.4710828, -2.396118, -4.75752, 0, 0, 0, 1, 1,
-0.469308, 0.6904234, 0.6051287, 0, 0, 0, 1, 1,
-0.4662081, 1.410031, -0.5283056, 0, 0, 0, 1, 1,
-0.4657024, 0.2125205, -1.08645, 0, 0, 0, 1, 1,
-0.4627688, 1.882741, 1.525849, 0, 0, 0, 1, 1,
-0.4546968, -0.5573021, -1.766719, 0, 0, 0, 1, 1,
-0.4506443, 0.4247738, -1.223551, 1, 1, 1, 1, 1,
-0.4502528, 0.118432, -1.546245, 1, 1, 1, 1, 1,
-0.4446351, 0.7700518, -1.026617, 1, 1, 1, 1, 1,
-0.4419522, -1.400094, -3.616556, 1, 1, 1, 1, 1,
-0.4406572, -0.5668418, -2.16889, 1, 1, 1, 1, 1,
-0.4405412, 0.886951, -0.2102795, 1, 1, 1, 1, 1,
-0.4348703, -0.008192749, -2.259617, 1, 1, 1, 1, 1,
-0.4338188, 1.548986, -1.872982, 1, 1, 1, 1, 1,
-0.4315663, -1.302569, -3.548712, 1, 1, 1, 1, 1,
-0.4297695, -0.1559971, -2.638023, 1, 1, 1, 1, 1,
-0.4202209, -0.0335999, -1.0431, 1, 1, 1, 1, 1,
-0.4177728, 1.667425, -1.138684, 1, 1, 1, 1, 1,
-0.4177466, -1.457569, -2.258951, 1, 1, 1, 1, 1,
-0.4149618, -0.3235127, -2.485513, 1, 1, 1, 1, 1,
-0.4149007, 0.871139, 1.731465, 1, 1, 1, 1, 1,
-0.4142736, -0.2811355, -3.883414, 0, 0, 1, 1, 1,
-0.4127758, 0.1866439, -2.621611, 1, 0, 0, 1, 1,
-0.4112402, -0.2525909, -3.898928, 1, 0, 0, 1, 1,
-0.4077483, -0.266156, -1.763333, 1, 0, 0, 1, 1,
-0.4004108, 1.495931, 1.865629, 1, 0, 0, 1, 1,
-0.4001096, 2.439662, 0.856442, 1, 0, 0, 1, 1,
-0.3987715, -0.527559, -3.07139, 0, 0, 0, 1, 1,
-0.3986132, -1.108826, -2.432851, 0, 0, 0, 1, 1,
-0.3976192, 1.33077, 0.7959524, 0, 0, 0, 1, 1,
-0.3964743, 1.336262, 0.009961509, 0, 0, 0, 1, 1,
-0.3962622, -1.497643, -1.394116, 0, 0, 0, 1, 1,
-0.3962109, -0.7934698, -1.688148, 0, 0, 0, 1, 1,
-0.3939874, 0.7191233, -1.43576, 0, 0, 0, 1, 1,
-0.3880983, -0.8455345, -3.196945, 1, 1, 1, 1, 1,
-0.3797666, 0.02637272, -1.463617, 1, 1, 1, 1, 1,
-0.3769991, 0.2264363, -0.9038362, 1, 1, 1, 1, 1,
-0.3759817, 0.6403603, 0.2179705, 1, 1, 1, 1, 1,
-0.3759057, 0.5362137, -0.9585124, 1, 1, 1, 1, 1,
-0.3729075, -2.562898, -3.914931, 1, 1, 1, 1, 1,
-0.3723904, 1.602098, 0.4070262, 1, 1, 1, 1, 1,
-0.3717161, 0.5012562, 0.359948, 1, 1, 1, 1, 1,
-0.3701569, -0.638325, -4.0715, 1, 1, 1, 1, 1,
-0.3689011, -1.366548, -1.725957, 1, 1, 1, 1, 1,
-0.3613871, -1.242331, -2.175858, 1, 1, 1, 1, 1,
-0.3590541, 0.9330144, -0.7947801, 1, 1, 1, 1, 1,
-0.3532735, -0.3250329, -0.7134271, 1, 1, 1, 1, 1,
-0.3509854, 0.01200994, 0.2685607, 1, 1, 1, 1, 1,
-0.3472703, -0.80101, -1.820866, 1, 1, 1, 1, 1,
-0.3472602, -0.8030316, -4.487564, 0, 0, 1, 1, 1,
-0.3429088, 1.286072, 0.2616651, 1, 0, 0, 1, 1,
-0.3381366, -1.27054, -2.22271, 1, 0, 0, 1, 1,
-0.3355379, -1.471302, -2.846408, 1, 0, 0, 1, 1,
-0.3349287, 0.4356941, -0.838566, 1, 0, 0, 1, 1,
-0.3348329, 1.923413, -1.178937, 1, 0, 0, 1, 1,
-0.3308631, 1.08515, -0.823853, 0, 0, 0, 1, 1,
-0.3304633, -0.7645343, -2.452432, 0, 0, 0, 1, 1,
-0.3279319, 0.5196794, 0.2762123, 0, 0, 0, 1, 1,
-0.3265217, 0.5113063, -2.945564, 0, 0, 0, 1, 1,
-0.3241608, -0.6797919, -1.636184, 0, 0, 0, 1, 1,
-0.3205574, -1.313306, -1.937517, 0, 0, 0, 1, 1,
-0.3198492, -1.050183, -3.210768, 0, 0, 0, 1, 1,
-0.3182873, -0.1420136, -1.129617, 1, 1, 1, 1, 1,
-0.3176107, -0.9663, -3.223361, 1, 1, 1, 1, 1,
-0.3137181, -0.627232, -3.230973, 1, 1, 1, 1, 1,
-0.3119815, -0.01125536, -1.765575, 1, 1, 1, 1, 1,
-0.3086054, 2.083864, 1.541391, 1, 1, 1, 1, 1,
-0.3065154, 1.021662, 1.168764, 1, 1, 1, 1, 1,
-0.2978102, -0.2232782, -1.808841, 1, 1, 1, 1, 1,
-0.2964583, -0.02741376, -1.474088, 1, 1, 1, 1, 1,
-0.2914661, 0.8247839, -1.251257, 1, 1, 1, 1, 1,
-0.284326, -1.016082, -2.043875, 1, 1, 1, 1, 1,
-0.2807868, 0.5691658, 0.8326564, 1, 1, 1, 1, 1,
-0.2787337, 0.1805636, -0.1994447, 1, 1, 1, 1, 1,
-0.2780722, 0.02402491, -1.76319, 1, 1, 1, 1, 1,
-0.2750401, -0.4304546, -3.369107, 1, 1, 1, 1, 1,
-0.2720188, -0.9789788, -3.764148, 1, 1, 1, 1, 1,
-0.2714992, 0.3176272, -1.23015, 0, 0, 1, 1, 1,
-0.2705071, 2.739511, 0.4767269, 1, 0, 0, 1, 1,
-0.259286, -0.09782071, -2.534729, 1, 0, 0, 1, 1,
-0.2567455, 0.7932638, -0.4235567, 1, 0, 0, 1, 1,
-0.2562229, 0.5188709, -1.555792, 1, 0, 0, 1, 1,
-0.253057, 0.05600802, -2.881673, 1, 0, 0, 1, 1,
-0.250758, 1.062831, 0.6504827, 0, 0, 0, 1, 1,
-0.2430387, 0.95838, 0.6007532, 0, 0, 0, 1, 1,
-0.2417205, -0.23136, -3.224816, 0, 0, 0, 1, 1,
-0.2408122, 1.453226, -1.203547, 0, 0, 0, 1, 1,
-0.2356185, 0.7302119, 0.3327064, 0, 0, 0, 1, 1,
-0.2345901, -1.117095, -3.02198, 0, 0, 0, 1, 1,
-0.2326985, 0.8280182, 0.2024262, 0, 0, 0, 1, 1,
-0.2278835, 1.466614, -1.341069, 1, 1, 1, 1, 1,
-0.2258551, 0.6351612, -0.9552209, 1, 1, 1, 1, 1,
-0.2241892, 1.062089, 0.033016, 1, 1, 1, 1, 1,
-0.2238841, -2.732938, -2.849348, 1, 1, 1, 1, 1,
-0.219896, -0.317105, -1.919199, 1, 1, 1, 1, 1,
-0.2194351, -0.001753882, -1.330505, 1, 1, 1, 1, 1,
-0.2184244, -0.9312707, -2.340632, 1, 1, 1, 1, 1,
-0.217242, -1.340897, -2.935802, 1, 1, 1, 1, 1,
-0.2122716, -0.4141227, -3.668215, 1, 1, 1, 1, 1,
-0.2097782, -1.436234, -2.789391, 1, 1, 1, 1, 1,
-0.2076138, 0.1967365, -1.201522, 1, 1, 1, 1, 1,
-0.2054022, -1.063703, -3.100348, 1, 1, 1, 1, 1,
-0.2024789, 0.7370467, -2.143281, 1, 1, 1, 1, 1,
-0.1973532, -0.05809629, -2.537057, 1, 1, 1, 1, 1,
-0.1937921, -0.5533515, -3.122531, 1, 1, 1, 1, 1,
-0.1815281, -1.03894, -4.241605, 0, 0, 1, 1, 1,
-0.1800576, 0.7586193, 2.002498, 1, 0, 0, 1, 1,
-0.1797092, -1.210245, -2.888223, 1, 0, 0, 1, 1,
-0.1771756, 0.3708718, -1.297727, 1, 0, 0, 1, 1,
-0.176492, 0.03851897, -1.694133, 1, 0, 0, 1, 1,
-0.1747573, -0.2417301, -2.280994, 1, 0, 0, 1, 1,
-0.1720965, -1.482703, -1.765249, 0, 0, 0, 1, 1,
-0.1667927, -2.103659, -3.87659, 0, 0, 0, 1, 1,
-0.1646362, 0.3254632, 0.4784103, 0, 0, 0, 1, 1,
-0.1617262, -0.7876596, -4.731621, 0, 0, 0, 1, 1,
-0.1605775, 0.9833053, -0.2614716, 0, 0, 0, 1, 1,
-0.1572234, -0.5987642, -3.739125, 0, 0, 0, 1, 1,
-0.1563764, -1.032179, -3.249441, 0, 0, 0, 1, 1,
-0.1549512, 1.562996, -0.6034721, 1, 1, 1, 1, 1,
-0.1537797, -0.2349896, -4.08591, 1, 1, 1, 1, 1,
-0.1537069, -0.3744904, -4.310399, 1, 1, 1, 1, 1,
-0.1515218, 0.35956, -1.71163, 1, 1, 1, 1, 1,
-0.1509788, 0.5965618, 0.9024612, 1, 1, 1, 1, 1,
-0.1488712, -1.100046, -3.837955, 1, 1, 1, 1, 1,
-0.1483613, 0.1556445, -2.092391, 1, 1, 1, 1, 1,
-0.145594, -1.096425, -4.397215, 1, 1, 1, 1, 1,
-0.1435282, -0.9190974, -2.03573, 1, 1, 1, 1, 1,
-0.142567, -0.4733187, -4.936766, 1, 1, 1, 1, 1,
-0.142451, 0.4789967, 0.03341046, 1, 1, 1, 1, 1,
-0.139144, 0.3582195, 0.07507341, 1, 1, 1, 1, 1,
-0.1378418, 0.6507334, -1.046718, 1, 1, 1, 1, 1,
-0.1364568, -1.100629, -3.887239, 1, 1, 1, 1, 1,
-0.1332739, 0.3300614, -0.06043519, 1, 1, 1, 1, 1,
-0.1327162, 1.055828, -1.67596, 0, 0, 1, 1, 1,
-0.13127, -1.449731, -3.676993, 1, 0, 0, 1, 1,
-0.1295146, -0.956082, -2.877294, 1, 0, 0, 1, 1,
-0.1282301, 1.260764, 0.1561736, 1, 0, 0, 1, 1,
-0.1260392, 0.05102099, -2.396209, 1, 0, 0, 1, 1,
-0.1254591, -1.665628, -3.194756, 1, 0, 0, 1, 1,
-0.1246361, -0.2706249, -4.797653, 0, 0, 0, 1, 1,
-0.1235452, 1.043677, -0.6343663, 0, 0, 0, 1, 1,
-0.1179308, -1.213767, -1.657803, 0, 0, 0, 1, 1,
-0.1067922, 0.9315521, -0.04265984, 0, 0, 0, 1, 1,
-0.1026045, 0.3890257, -0.2949035, 0, 0, 0, 1, 1,
-0.09472685, -0.6033055, -4.901533, 0, 0, 0, 1, 1,
-0.09040512, 0.1422645, -0.3168254, 0, 0, 0, 1, 1,
-0.08273221, 0.9171178, 1.42528, 1, 1, 1, 1, 1,
-0.08197374, 0.3168905, -1.595889, 1, 1, 1, 1, 1,
-0.08116306, 0.9240474, 0.4864243, 1, 1, 1, 1, 1,
-0.08052853, -0.2034103, -2.786547, 1, 1, 1, 1, 1,
-0.07684386, -0.4720367, -3.923915, 1, 1, 1, 1, 1,
-0.07474912, 1.00817, -0.4174663, 1, 1, 1, 1, 1,
-0.07458379, -1.30253, -3.397968, 1, 1, 1, 1, 1,
-0.07429234, -0.6923745, -2.628479, 1, 1, 1, 1, 1,
-0.07196084, 0.230644, -0.6555229, 1, 1, 1, 1, 1,
-0.06820212, -0.9780403, -2.620167, 1, 1, 1, 1, 1,
-0.06461997, 0.233071, -0.1521575, 1, 1, 1, 1, 1,
-0.06216683, 0.2211664, 0.8895468, 1, 1, 1, 1, 1,
-0.06204731, -0.2517797, -2.935525, 1, 1, 1, 1, 1,
-0.05980468, -0.5555723, -0.4224714, 1, 1, 1, 1, 1,
-0.04936058, -1.00051, -1.972289, 1, 1, 1, 1, 1,
-0.04735902, 0.268976, 0.3993977, 0, 0, 1, 1, 1,
-0.0381109, 0.3752013, -0.4919936, 1, 0, 0, 1, 1,
-0.02722631, 0.5169351, -0.2718809, 1, 0, 0, 1, 1,
-0.02510934, 2.44744, -0.3711024, 1, 0, 0, 1, 1,
-0.02439916, 0.8370364, 2.160994, 1, 0, 0, 1, 1,
-0.02346157, -0.1256445, -2.04694, 1, 0, 0, 1, 1,
-0.02179176, 0.01347909, -0.7258517, 0, 0, 0, 1, 1,
-0.01453885, 2.021259, -2.514743, 0, 0, 0, 1, 1,
-0.008920243, 1.560733, 0.7939389, 0, 0, 0, 1, 1,
-0.008533089, -0.05728266, -2.775125, 0, 0, 0, 1, 1,
-0.007707635, 0.6751608, 0.9345484, 0, 0, 0, 1, 1,
-0.002786216, -0.0675019, -3.699896, 0, 0, 0, 1, 1,
-0.001039192, 1.50498, -0.08206046, 0, 0, 0, 1, 1,
0.0009730558, -0.220374, 4.615023, 1, 1, 1, 1, 1,
0.001586759, -1.256636, 3.600991, 1, 1, 1, 1, 1,
0.003515761, -1.475386, 4.224669, 1, 1, 1, 1, 1,
0.004920037, -0.190415, 1.251583, 1, 1, 1, 1, 1,
0.006848926, 1.455996, 1.1989, 1, 1, 1, 1, 1,
0.00817717, 0.9944877, 0.2507065, 1, 1, 1, 1, 1,
0.008348505, 0.8663669, -1.727483, 1, 1, 1, 1, 1,
0.009323272, 1.522163, -1.424334, 1, 1, 1, 1, 1,
0.01022497, -0.971867, 3.273898, 1, 1, 1, 1, 1,
0.01031698, 0.5277497, -0.7798926, 1, 1, 1, 1, 1,
0.01098814, 0.05039822, -0.8839968, 1, 1, 1, 1, 1,
0.01227763, 0.6079028, 1.333717, 1, 1, 1, 1, 1,
0.01653759, -0.5096511, 2.075716, 1, 1, 1, 1, 1,
0.01754116, -0.9286706, 3.300347, 1, 1, 1, 1, 1,
0.01869374, -1.063836, 2.209064, 1, 1, 1, 1, 1,
0.01913235, 0.6992887, -1.045987, 0, 0, 1, 1, 1,
0.02553668, -1.051929, 3.296655, 1, 0, 0, 1, 1,
0.02634525, 0.2081667, 0.2740055, 1, 0, 0, 1, 1,
0.02787292, -0.4833464, 2.092844, 1, 0, 0, 1, 1,
0.02927843, 0.3931091, 0.8713655, 1, 0, 0, 1, 1,
0.03024485, 0.8602331, -0.2496739, 1, 0, 0, 1, 1,
0.03033612, -0.1576537, 3.750929, 0, 0, 0, 1, 1,
0.03350801, -1.401727, 3.722337, 0, 0, 0, 1, 1,
0.03536488, -0.9903197, 1.632112, 0, 0, 0, 1, 1,
0.04200744, -1.095104, 3.304029, 0, 0, 0, 1, 1,
0.04383066, 0.7189771, -0.05421727, 0, 0, 0, 1, 1,
0.04429932, -0.5967693, 0.6524844, 0, 0, 0, 1, 1,
0.04472015, -0.5657153, 3.349842, 0, 0, 0, 1, 1,
0.05378211, 0.04962626, 0.9619502, 1, 1, 1, 1, 1,
0.05642707, -1.129183, 2.332829, 1, 1, 1, 1, 1,
0.05727734, 0.1414432, 1.126021, 1, 1, 1, 1, 1,
0.05827102, -0.3633007, 1.114283, 1, 1, 1, 1, 1,
0.05874713, 0.3163349, -0.7130807, 1, 1, 1, 1, 1,
0.0613092, 0.1308026, 0.3139911, 1, 1, 1, 1, 1,
0.06133767, 0.8329313, 2.264768, 1, 1, 1, 1, 1,
0.06276474, 0.8668312, 1.236, 1, 1, 1, 1, 1,
0.06293948, -0.8752559, 3.186945, 1, 1, 1, 1, 1,
0.06365155, -0.1851233, 1.892897, 1, 1, 1, 1, 1,
0.06489572, -1.218493, 2.239392, 1, 1, 1, 1, 1,
0.06584071, 0.3011395, -0.1857121, 1, 1, 1, 1, 1,
0.06702561, 1.225708, 0.4427528, 1, 1, 1, 1, 1,
0.07074348, -1.697764, 3.05194, 1, 1, 1, 1, 1,
0.07289194, 0.9916239, -0.1677297, 1, 1, 1, 1, 1,
0.07291033, 1.090415, 0.4958649, 0, 0, 1, 1, 1,
0.07773197, -0.3486275, 2.875685, 1, 0, 0, 1, 1,
0.07942282, 0.04700161, 0.6968795, 1, 0, 0, 1, 1,
0.0826616, 0.1241285, 2.049103, 1, 0, 0, 1, 1,
0.09347349, 0.0007814155, 3.027408, 1, 0, 0, 1, 1,
0.09596483, 0.4697623, 0.2360495, 1, 0, 0, 1, 1,
0.1024849, -0.3365024, 3.285303, 0, 0, 0, 1, 1,
0.1044149, -0.03701451, 0.9515166, 0, 0, 0, 1, 1,
0.1046066, -0.08959661, 1.913404, 0, 0, 0, 1, 1,
0.1051732, -1.33996, 3.280732, 0, 0, 0, 1, 1,
0.1065904, -0.9808236, 3.632587, 0, 0, 0, 1, 1,
0.1070739, -0.2073345, 2.906317, 0, 0, 0, 1, 1,
0.1083962, 0.8327118, 1.072098, 0, 0, 0, 1, 1,
0.1162747, 1.519031, -2.179583, 1, 1, 1, 1, 1,
0.1222618, 0.2400485, 0.5251575, 1, 1, 1, 1, 1,
0.1327612, -0.8845946, 2.384498, 1, 1, 1, 1, 1,
0.136306, 0.1834861, 0.8595138, 1, 1, 1, 1, 1,
0.1398133, 0.6296756, 0.4699361, 1, 1, 1, 1, 1,
0.1441019, -0.9600899, 2.732467, 1, 1, 1, 1, 1,
0.146447, 0.2716923, -0.1035686, 1, 1, 1, 1, 1,
0.151769, 0.7364874, -0.9576057, 1, 1, 1, 1, 1,
0.1526496, -1.710485, 3.600973, 1, 1, 1, 1, 1,
0.1553652, 0.3465724, -1.42009, 1, 1, 1, 1, 1,
0.1555748, -1.69709, 4.216017, 1, 1, 1, 1, 1,
0.1563884, 0.7319847, 1.650823, 1, 1, 1, 1, 1,
0.1614069, -0.3470465, 3.557338, 1, 1, 1, 1, 1,
0.161746, -0.6279914, 1.279374, 1, 1, 1, 1, 1,
0.1630729, 1.37497, -0.7689326, 1, 1, 1, 1, 1,
0.1647937, 1.389384, 0.5314203, 0, 0, 1, 1, 1,
0.1662768, -0.1226797, 2.819947, 1, 0, 0, 1, 1,
0.1677437, 0.8895231, 1.443333, 1, 0, 0, 1, 1,
0.1693334, 0.2493152, 0.8663616, 1, 0, 0, 1, 1,
0.1705978, 2.820786, 0.05759135, 1, 0, 0, 1, 1,
0.1736014, 0.4551967, 0.04346324, 1, 0, 0, 1, 1,
0.1763872, -0.3815158, 2.851138, 0, 0, 0, 1, 1,
0.1766487, -0.06485324, -0.1212995, 0, 0, 0, 1, 1,
0.1791974, 1.374002, 0.8841264, 0, 0, 0, 1, 1,
0.179483, 0.9742433, 0.6409085, 0, 0, 0, 1, 1,
0.1802416, 0.2497599, 1.605671, 0, 0, 0, 1, 1,
0.1824397, -0.35633, 3.455248, 0, 0, 0, 1, 1,
0.182802, 0.1923738, 2.089957, 0, 0, 0, 1, 1,
0.1861942, -0.03957167, 1.793181, 1, 1, 1, 1, 1,
0.1920061, -0.7072927, 1.943461, 1, 1, 1, 1, 1,
0.1928497, 1.313156, 0.2375703, 1, 1, 1, 1, 1,
0.1953587, -0.9433321, 3.915154, 1, 1, 1, 1, 1,
0.2041112, -0.2364877, 3.209331, 1, 1, 1, 1, 1,
0.2064437, -0.9962668, 3.64516, 1, 1, 1, 1, 1,
0.2138478, 0.1906948, 2.146816, 1, 1, 1, 1, 1,
0.2170573, 0.3357569, -0.02933192, 1, 1, 1, 1, 1,
0.2174461, -0.3317996, 2.569755, 1, 1, 1, 1, 1,
0.2175887, 1.028514, 0.6656576, 1, 1, 1, 1, 1,
0.2206484, -0.8688977, 2.061477, 1, 1, 1, 1, 1,
0.2233335, 1.208267, -1.314861, 1, 1, 1, 1, 1,
0.2259191, 0.9451097, -0.05513311, 1, 1, 1, 1, 1,
0.2388751, 0.4925882, -0.3727545, 1, 1, 1, 1, 1,
0.2392884, -1.574383, 5.237185, 1, 1, 1, 1, 1,
0.241407, 0.2157522, -0.7389546, 0, 0, 1, 1, 1,
0.241471, 0.0533051, 0.4650001, 1, 0, 0, 1, 1,
0.2418209, 1.840024, -0.7013139, 1, 0, 0, 1, 1,
0.2430337, 0.9419202, -0.1222589, 1, 0, 0, 1, 1,
0.2507691, -1.797626, 4.663776, 1, 0, 0, 1, 1,
0.2519085, -1.018447, 1.401115, 1, 0, 0, 1, 1,
0.2524001, 0.9440027, -0.2652624, 0, 0, 0, 1, 1,
0.2531285, -0.1140596, 1.720438, 0, 0, 0, 1, 1,
0.2549829, -1.650902, 2.428182, 0, 0, 0, 1, 1,
0.257584, 0.1854112, 1.543982, 0, 0, 0, 1, 1,
0.2610328, 0.5128372, 0.01926961, 0, 0, 0, 1, 1,
0.2612863, -0.5355795, 3.021452, 0, 0, 0, 1, 1,
0.2625774, -0.1352137, 2.527262, 0, 0, 0, 1, 1,
0.2656335, 0.5024891, -0.2941024, 1, 1, 1, 1, 1,
0.266505, 0.8421314, 0.9250647, 1, 1, 1, 1, 1,
0.270054, 0.9681876, -0.3323434, 1, 1, 1, 1, 1,
0.270205, -0.4942091, 2.340517, 1, 1, 1, 1, 1,
0.2809054, 0.3682725, -0.2035833, 1, 1, 1, 1, 1,
0.2815128, 0.3559471, -1.130616, 1, 1, 1, 1, 1,
0.2857761, 0.480666, 0.1060918, 1, 1, 1, 1, 1,
0.2891661, 0.4265444, -0.4051321, 1, 1, 1, 1, 1,
0.2941689, 0.1239015, 2.023154, 1, 1, 1, 1, 1,
0.301219, -0.5511537, 1.904442, 1, 1, 1, 1, 1,
0.3080882, 0.1096742, 0.3445216, 1, 1, 1, 1, 1,
0.3091126, -0.4487095, 2.359653, 1, 1, 1, 1, 1,
0.3154131, -0.9982223, 3.635713, 1, 1, 1, 1, 1,
0.3187973, -0.186287, 0.5933319, 1, 1, 1, 1, 1,
0.3211529, -0.8835667, 2.560833, 1, 1, 1, 1, 1,
0.3238254, 0.1417314, 0.9953611, 0, 0, 1, 1, 1,
0.3270849, -1.210246, 1.282643, 1, 0, 0, 1, 1,
0.3276116, -0.8778135, 2.366153, 1, 0, 0, 1, 1,
0.3299235, -0.3516227, 3.079771, 1, 0, 0, 1, 1,
0.3366252, -0.1546592, 0.5963647, 1, 0, 0, 1, 1,
0.3383027, 0.3841452, 1.646548, 1, 0, 0, 1, 1,
0.3406764, -2.08992, 1.975546, 0, 0, 0, 1, 1,
0.3432996, 1.239824, -0.919881, 0, 0, 0, 1, 1,
0.3517666, 1.053173, 1.387836, 0, 0, 0, 1, 1,
0.3595393, 0.8338075, 2.210005, 0, 0, 0, 1, 1,
0.3614059, 1.43285, -1.091729, 0, 0, 0, 1, 1,
0.3632863, -0.6879093, 3.065022, 0, 0, 0, 1, 1,
0.3701611, -1.459845, 2.596692, 0, 0, 0, 1, 1,
0.371063, 1.241051, 0.2868945, 1, 1, 1, 1, 1,
0.3720214, 0.7372801, -1.113114, 1, 1, 1, 1, 1,
0.3739591, -0.8329718, 0.9585437, 1, 1, 1, 1, 1,
0.3854434, 0.466853, -0.329598, 1, 1, 1, 1, 1,
0.3884705, -1.211316, 1.933281, 1, 1, 1, 1, 1,
0.3938993, -0.01783651, 3.263298, 1, 1, 1, 1, 1,
0.3965639, -0.03467961, 4.065482, 1, 1, 1, 1, 1,
0.396734, -0.7874433, 2.018, 1, 1, 1, 1, 1,
0.3980493, -0.9137253, 2.940582, 1, 1, 1, 1, 1,
0.3997495, 1.301687, 0.4957964, 1, 1, 1, 1, 1,
0.4008731, 0.8624678, -0.7598051, 1, 1, 1, 1, 1,
0.4082671, 0.3335648, 0.4613961, 1, 1, 1, 1, 1,
0.4084676, 0.518721, 0.2377484, 1, 1, 1, 1, 1,
0.4120379, -0.8529238, 3.042185, 1, 1, 1, 1, 1,
0.4127371, -0.03337035, -0.3581474, 1, 1, 1, 1, 1,
0.4153146, 0.2706248, 0.5719476, 0, 0, 1, 1, 1,
0.4180878, 0.05836133, 2.541041, 1, 0, 0, 1, 1,
0.4185397, -0.08363053, 3.009022, 1, 0, 0, 1, 1,
0.4186201, 0.9710274, -0.5826573, 1, 0, 0, 1, 1,
0.4229441, -0.3074108, 2.602983, 1, 0, 0, 1, 1,
0.4231908, -0.3234767, 2.853697, 1, 0, 0, 1, 1,
0.4255655, -0.4810784, 2.543136, 0, 0, 0, 1, 1,
0.4273469, -0.2212998, 3.339499, 0, 0, 0, 1, 1,
0.429232, 0.2994358, 0.6290353, 0, 0, 0, 1, 1,
0.4335066, -1.007473, 2.290696, 0, 0, 0, 1, 1,
0.4383837, 0.03755782, 0.9796519, 0, 0, 0, 1, 1,
0.4410873, -1.127046, 1.111112, 0, 0, 0, 1, 1,
0.4411486, -0.1777022, 2.273495, 0, 0, 0, 1, 1,
0.4457403, 0.7100466, -1.180513, 1, 1, 1, 1, 1,
0.4460498, 0.3252181, 2.421669, 1, 1, 1, 1, 1,
0.4489948, -0.7311054, 0.6336339, 1, 1, 1, 1, 1,
0.4505172, 0.5939609, -0.8001953, 1, 1, 1, 1, 1,
0.4558937, -1.654279, 1.528109, 1, 1, 1, 1, 1,
0.4571138, 0.08904027, 1.918697, 1, 1, 1, 1, 1,
0.4573703, -0.1788857, 1.227263, 1, 1, 1, 1, 1,
0.4576278, -0.2542974, 2.543674, 1, 1, 1, 1, 1,
0.4583834, 0.1165605, 1.304861, 1, 1, 1, 1, 1,
0.4619181, 0.2670654, 1.58492, 1, 1, 1, 1, 1,
0.4619332, 1.682916, 0.5934876, 1, 1, 1, 1, 1,
0.4674899, 0.6677225, 0.7832203, 1, 1, 1, 1, 1,
0.4675614, -1.049125, 3.084031, 1, 1, 1, 1, 1,
0.4678851, 0.05701498, 1.471923, 1, 1, 1, 1, 1,
0.4840454, -0.5067679, 2.555676, 1, 1, 1, 1, 1,
0.4902761, 0.06521706, 0.9027144, 0, 0, 1, 1, 1,
0.4903276, -1.377307, 2.395091, 1, 0, 0, 1, 1,
0.4931791, -0.7745112, 1.795387, 1, 0, 0, 1, 1,
0.4942437, -2.349822, 1.36618, 1, 0, 0, 1, 1,
0.5000284, -0.14635, 0.2238653, 1, 0, 0, 1, 1,
0.5019973, -0.03914284, 0.6494603, 1, 0, 0, 1, 1,
0.5039961, -0.6992451, 3.835166, 0, 0, 0, 1, 1,
0.5051127, -0.9864709, 5.192208, 0, 0, 0, 1, 1,
0.506776, -0.3779295, 3.659911, 0, 0, 0, 1, 1,
0.5177832, 1.071175, 0.6830629, 0, 0, 0, 1, 1,
0.5219913, 0.2294041, 1.12126, 0, 0, 0, 1, 1,
0.524048, -0.5993154, 1.076898, 0, 0, 0, 1, 1,
0.5260919, -2.445429, 2.978432, 0, 0, 0, 1, 1,
0.5294451, -1.786002, 3.785927, 1, 1, 1, 1, 1,
0.5353483, -1.380619, 2.251605, 1, 1, 1, 1, 1,
0.5363724, -1.600281, 0.4722064, 1, 1, 1, 1, 1,
0.536944, -1.629416, 2.006389, 1, 1, 1, 1, 1,
0.5412034, 2.0144, -0.364446, 1, 1, 1, 1, 1,
0.542899, -0.4750112, 2.646689, 1, 1, 1, 1, 1,
0.5431946, -1.449728, 3.004004, 1, 1, 1, 1, 1,
0.5434104, 1.067472, -1.668127, 1, 1, 1, 1, 1,
0.5474468, 0.6696869, 1.127293, 1, 1, 1, 1, 1,
0.5507185, 0.8640673, 1.310513, 1, 1, 1, 1, 1,
0.5566882, 0.8338898, -0.4661036, 1, 1, 1, 1, 1,
0.5570788, -0.4974136, 2.930063, 1, 1, 1, 1, 1,
0.5602466, -0.4795917, 1.509918, 1, 1, 1, 1, 1,
0.561342, -0.9385546, 1.111589, 1, 1, 1, 1, 1,
0.5629205, -0.2749263, 2.96331, 1, 1, 1, 1, 1,
0.564468, 1.039913, 1.060181, 0, 0, 1, 1, 1,
0.5660416, 0.6730483, -0.5831466, 1, 0, 0, 1, 1,
0.5663678, -0.0568992, 1.506068, 1, 0, 0, 1, 1,
0.5691825, -0.4186725, 0.8744591, 1, 0, 0, 1, 1,
0.5814861, -1.361329, 1.81717, 1, 0, 0, 1, 1,
0.5819281, -0.7796339, 1.677854, 1, 0, 0, 1, 1,
0.5834737, 0.792679, 1.19677, 0, 0, 0, 1, 1,
0.5860211, -1.678736, 1.753434, 0, 0, 0, 1, 1,
0.5933039, -0.4364666, 2.322216, 0, 0, 0, 1, 1,
0.5937786, -0.6785861, 2.615025, 0, 0, 0, 1, 1,
0.5949142, -0.08860894, 0.9009032, 0, 0, 0, 1, 1,
0.5963476, -0.156363, 1.916059, 0, 0, 0, 1, 1,
0.596851, -1.754234, 4.010063, 0, 0, 0, 1, 1,
0.6009034, 0.06896539, 0.7052481, 1, 1, 1, 1, 1,
0.6085665, -0.3473374, 1.846899, 1, 1, 1, 1, 1,
0.6102339, 1.099546, 1.38581, 1, 1, 1, 1, 1,
0.6103926, -0.8439767, 2.03164, 1, 1, 1, 1, 1,
0.6125405, -0.09417312, 1.91092, 1, 1, 1, 1, 1,
0.6139925, 0.8434793, -0.239391, 1, 1, 1, 1, 1,
0.617752, -0.5371129, 1.274269, 1, 1, 1, 1, 1,
0.622227, 0.3552089, 1.264761, 1, 1, 1, 1, 1,
0.6244888, -0.4974972, 0.6869025, 1, 1, 1, 1, 1,
0.6314517, -0.4417928, 2.420453, 1, 1, 1, 1, 1,
0.6339712, -0.09777358, -0.5746605, 1, 1, 1, 1, 1,
0.637795, -0.7105949, 3.605443, 1, 1, 1, 1, 1,
0.6398807, 0.7272737, 1.028518, 1, 1, 1, 1, 1,
0.6419706, -1.138818, 2.489158, 1, 1, 1, 1, 1,
0.6423063, -0.6329637, 3.801063, 1, 1, 1, 1, 1,
0.6428211, 1.157167, 0.9927831, 0, 0, 1, 1, 1,
0.6471101, 0.1236006, -1.345222, 1, 0, 0, 1, 1,
0.6475482, -1.046543, 2.537146, 1, 0, 0, 1, 1,
0.6482111, 0.2352949, -0.5600337, 1, 0, 0, 1, 1,
0.6499795, 0.3211119, 0.2396487, 1, 0, 0, 1, 1,
0.6551584, 0.9667515, 0.1414679, 1, 0, 0, 1, 1,
0.6561956, 0.1935109, 0.4554633, 0, 0, 0, 1, 1,
0.6575926, 0.2659537, 0.3062445, 0, 0, 0, 1, 1,
0.6604237, 0.4143298, 2.405351, 0, 0, 0, 1, 1,
0.6609004, 0.9456405, 1.964205, 0, 0, 0, 1, 1,
0.6617454, 0.4174331, 0.8719983, 0, 0, 0, 1, 1,
0.6661511, 0.344153, 0.8223198, 0, 0, 0, 1, 1,
0.6688158, 1.383341, -0.2293784, 0, 0, 0, 1, 1,
0.6703252, 1.187014, 1.313455, 1, 1, 1, 1, 1,
0.67343, 0.1967194, 1.966738, 1, 1, 1, 1, 1,
0.6736838, -0.04863425, 2.483217, 1, 1, 1, 1, 1,
0.6811213, -0.1221042, 2.92802, 1, 1, 1, 1, 1,
0.6883906, -1.813217, 2.875638, 1, 1, 1, 1, 1,
0.693507, -0.2425764, 2.684547, 1, 1, 1, 1, 1,
0.6962242, 0.4582541, 1.71392, 1, 1, 1, 1, 1,
0.6969672, -0.2235853, -0.3431106, 1, 1, 1, 1, 1,
0.6976436, 0.3638496, 1.327146, 1, 1, 1, 1, 1,
0.6989434, 0.3228594, 1.049088, 1, 1, 1, 1, 1,
0.7027179, -0.8977885, 1.270205, 1, 1, 1, 1, 1,
0.7105942, 0.4890816, -0.875083, 1, 1, 1, 1, 1,
0.714999, 2.456265, 0.1607922, 1, 1, 1, 1, 1,
0.7172876, -0.03912811, 1.739264, 1, 1, 1, 1, 1,
0.7223059, 0.4367982, -1.66601, 1, 1, 1, 1, 1,
0.7255753, 0.7027462, -0.3286134, 0, 0, 1, 1, 1,
0.7263563, 0.4142925, 0.7175968, 1, 0, 0, 1, 1,
0.7331349, 0.4873355, 1.600367, 1, 0, 0, 1, 1,
0.7375687, 0.7824262, 1.070414, 1, 0, 0, 1, 1,
0.7393155, -0.4589408, 3.173626, 1, 0, 0, 1, 1,
0.7411839, -0.4768426, 4.687074, 1, 0, 0, 1, 1,
0.742775, -1.101006, 2.325987, 0, 0, 0, 1, 1,
0.751316, -0.7212358, 2.175263, 0, 0, 0, 1, 1,
0.7534854, -0.7338326, 1.298869, 0, 0, 0, 1, 1,
0.7548332, 0.8752349, 0.1934601, 0, 0, 0, 1, 1,
0.7562262, -1.316965, 1.992159, 0, 0, 0, 1, 1,
0.7574056, -0.439611, 1.997337, 0, 0, 0, 1, 1,
0.764562, 0.1207175, 0.2871522, 0, 0, 0, 1, 1,
0.7668138, 1.209911, 1.489406, 1, 1, 1, 1, 1,
0.7671163, -1.418039, 3.087847, 1, 1, 1, 1, 1,
0.7681017, 0.9041954, 3.338366, 1, 1, 1, 1, 1,
0.7691209, 0.8403232, -0.5556349, 1, 1, 1, 1, 1,
0.7703754, 1.780611, 0.7583851, 1, 1, 1, 1, 1,
0.7803867, -0.2556095, 1.208686, 1, 1, 1, 1, 1,
0.7886757, 1.147335, 2.526304, 1, 1, 1, 1, 1,
0.7889953, 0.1619796, 2.651021, 1, 1, 1, 1, 1,
0.7906268, 1.522076, -0.1929446, 1, 1, 1, 1, 1,
0.7909889, -0.1182214, 1.142853, 1, 1, 1, 1, 1,
0.8009757, -1.442754, 2.068288, 1, 1, 1, 1, 1,
0.8031509, 0.4467612, 0.4456862, 1, 1, 1, 1, 1,
0.8063796, -1.873031, 2.998312, 1, 1, 1, 1, 1,
0.8080748, -0.2627687, 0.3803812, 1, 1, 1, 1, 1,
0.8149529, -0.3158592, 2.650151, 1, 1, 1, 1, 1,
0.8150604, 1.585572, 0.1676016, 0, 0, 1, 1, 1,
0.8173304, -0.5918782, 0.1740107, 1, 0, 0, 1, 1,
0.8211468, -1.276086, 3.87392, 1, 0, 0, 1, 1,
0.8234248, -0.1313835, 2.73686, 1, 0, 0, 1, 1,
0.8235863, -0.08770265, 2.251788, 1, 0, 0, 1, 1,
0.8291422, 0.3875672, 0.4777149, 1, 0, 0, 1, 1,
0.82978, -0.5236204, 3.895138, 0, 0, 0, 1, 1,
0.8299429, -0.6779264, 0.9398174, 0, 0, 0, 1, 1,
0.8339524, 0.9940082, 0.1571117, 0, 0, 0, 1, 1,
0.8350396, -0.2617377, 2.484941, 0, 0, 0, 1, 1,
0.8400558, -0.01361471, 3.176459, 0, 0, 0, 1, 1,
0.8426883, -0.8611541, 3.078807, 0, 0, 0, 1, 1,
0.8533577, -0.3279501, 1.045354, 0, 0, 0, 1, 1,
0.8541963, 0.2502519, 0.9067274, 1, 1, 1, 1, 1,
0.8553671, -0.1499533, 1.768915, 1, 1, 1, 1, 1,
0.8613292, -1.213758, 2.951725, 1, 1, 1, 1, 1,
0.8698369, 1.670989, -0.6053394, 1, 1, 1, 1, 1,
0.8725283, 0.4598764, 1.174187, 1, 1, 1, 1, 1,
0.8730758, -1.154368, 1.724477, 1, 1, 1, 1, 1,
0.8750848, 0.2308727, 1.036403, 1, 1, 1, 1, 1,
0.8780373, -0.8457339, 2.450233, 1, 1, 1, 1, 1,
0.8790023, 0.9361671, 2.103832, 1, 1, 1, 1, 1,
0.8791752, 1.247769, -0.08666699, 1, 1, 1, 1, 1,
0.8792152, 1.037196, 1.034562, 1, 1, 1, 1, 1,
0.8809726, 0.863885, 0.8950491, 1, 1, 1, 1, 1,
0.8836972, -0.5886677, 4.940444, 1, 1, 1, 1, 1,
0.8919147, -0.4377424, 3.576949, 1, 1, 1, 1, 1,
0.8933951, 0.6826187, 1.935608, 1, 1, 1, 1, 1,
0.8987319, 0.06388567, 0.7913876, 0, 0, 1, 1, 1,
0.9001155, -0.04946967, 1.503847, 1, 0, 0, 1, 1,
0.9070929, -1.815892, 4.443748, 1, 0, 0, 1, 1,
0.907742, -0.3188446, 1.910281, 1, 0, 0, 1, 1,
0.9089525, 0.6244748, 0.6437386, 1, 0, 0, 1, 1,
0.90927, 0.7639369, 2.470036, 1, 0, 0, 1, 1,
0.90974, 0.142317, 1.639849, 0, 0, 0, 1, 1,
0.9128869, -0.9036539, 0.8062069, 0, 0, 0, 1, 1,
0.9228782, -0.5605546, 2.321255, 0, 0, 0, 1, 1,
0.930738, -1.709267, 3.478227, 0, 0, 0, 1, 1,
0.9373118, -1.244361, 3.068962, 0, 0, 0, 1, 1,
0.9379958, -2.383833, 1.68407, 0, 0, 0, 1, 1,
0.943274, 0.02551872, 1.655917, 0, 0, 0, 1, 1,
0.9488375, -2.463086, 3.760481, 1, 1, 1, 1, 1,
0.9499019, -0.4211854, 1.774331, 1, 1, 1, 1, 1,
0.9575185, -0.663502, 2.610867, 1, 1, 1, 1, 1,
0.9607701, -0.6650715, 3.136577, 1, 1, 1, 1, 1,
0.9668689, -0.6235963, 1.107095, 1, 1, 1, 1, 1,
0.9694439, -0.1077801, 2.9935, 1, 1, 1, 1, 1,
0.9737114, 0.8910847, 0.4077563, 1, 1, 1, 1, 1,
0.9835589, 1.553872, -0.2385615, 1, 1, 1, 1, 1,
0.9844593, 0.417866, 2.500741, 1, 1, 1, 1, 1,
0.9884447, -0.8138577, 2.724485, 1, 1, 1, 1, 1,
0.9953644, -1.269039, 3.565755, 1, 1, 1, 1, 1,
0.9989616, -0.3901168, 1.588902, 1, 1, 1, 1, 1,
1.000805, -0.5520934, 1.04597, 1, 1, 1, 1, 1,
1.00619, 0.5112153, 2.42184, 1, 1, 1, 1, 1,
1.01435, 0.7142161, 1.844906, 1, 1, 1, 1, 1,
1.020872, -0.06625173, 0.311382, 0, 0, 1, 1, 1,
1.024337, -0.2003447, 1.659508, 1, 0, 0, 1, 1,
1.025048, 0.3994133, 3.560594, 1, 0, 0, 1, 1,
1.025384, 0.2941552, 0.8730358, 1, 0, 0, 1, 1,
1.026886, 1.160821, 0.3440203, 1, 0, 0, 1, 1,
1.030345, -0.3168901, 0.2342533, 1, 0, 0, 1, 1,
1.034006, 1.203772, -0.09979548, 0, 0, 0, 1, 1,
1.045809, -0.7864597, 2.283968, 0, 0, 0, 1, 1,
1.066974, -0.7250326, 2.837304, 0, 0, 0, 1, 1,
1.067596, -0.8922744, 1.071345, 0, 0, 0, 1, 1,
1.069814, 0.02944694, 0.4027736, 0, 0, 0, 1, 1,
1.081822, 0.3883629, 3.409502, 0, 0, 0, 1, 1,
1.083465, 0.2943204, 2.019426, 0, 0, 0, 1, 1,
1.092957, -0.1712825, 1.991254, 1, 1, 1, 1, 1,
1.096093, 0.1774657, 2.261613, 1, 1, 1, 1, 1,
1.100272, 1.750382, 1.310542, 1, 1, 1, 1, 1,
1.101362, 0.6445616, 0.6157012, 1, 1, 1, 1, 1,
1.107088, -0.3999709, 3.027002, 1, 1, 1, 1, 1,
1.10729, 0.5036758, 1.886228, 1, 1, 1, 1, 1,
1.108917, -1.086817, 3.231439, 1, 1, 1, 1, 1,
1.11125, 1.082631, 0.256234, 1, 1, 1, 1, 1,
1.112862, 0.134518, 1.704552, 1, 1, 1, 1, 1,
1.115598, -0.8484196, 1.634704, 1, 1, 1, 1, 1,
1.115913, 0.545752, 2.419255, 1, 1, 1, 1, 1,
1.125576, 0.6919878, 1.783346, 1, 1, 1, 1, 1,
1.128103, 0.9621135, -0.9716863, 1, 1, 1, 1, 1,
1.12948, -0.6533252, 2.911629, 1, 1, 1, 1, 1,
1.129566, -2.076375, 1.452294, 1, 1, 1, 1, 1,
1.130752, 0.6309286, -0.6173021, 0, 0, 1, 1, 1,
1.138362, 0.1257428, 2.494867, 1, 0, 0, 1, 1,
1.139424, 0.1355883, 0.6786719, 1, 0, 0, 1, 1,
1.152648, 1.215326, 0.1562891, 1, 0, 0, 1, 1,
1.186371, -0.9379517, 3.218302, 1, 0, 0, 1, 1,
1.189759, 0.4166958, 2.048218, 1, 0, 0, 1, 1,
1.19272, -0.4926426, 2.90262, 0, 0, 0, 1, 1,
1.196686, -0.1762358, 1.147476, 0, 0, 0, 1, 1,
1.199385, 0.07786583, 0.3381616, 0, 0, 0, 1, 1,
1.203908, -0.315933, 0.3059753, 0, 0, 0, 1, 1,
1.2083, -0.4742896, 0.5273351, 0, 0, 0, 1, 1,
1.210434, -0.3282784, 2.508985, 0, 0, 0, 1, 1,
1.21449, 0.0117814, 2.715415, 0, 0, 0, 1, 1,
1.22493, -2.674118, 1.70987, 1, 1, 1, 1, 1,
1.229338, -1.26661, 2.42658, 1, 1, 1, 1, 1,
1.230834, -0.4912415, -1.168028, 1, 1, 1, 1, 1,
1.234808, 0.9823341, 0.5716048, 1, 1, 1, 1, 1,
1.238782, 0.8051815, 1.106944, 1, 1, 1, 1, 1,
1.240697, -1.201191, 2.823417, 1, 1, 1, 1, 1,
1.251405, 1.548228, 1.227542, 1, 1, 1, 1, 1,
1.259092, -1.455233, 2.702522, 1, 1, 1, 1, 1,
1.26211, -1.047596, 2.283593, 1, 1, 1, 1, 1,
1.271145, -1.619757, 1.958759, 1, 1, 1, 1, 1,
1.272604, -0.5077753, 1.480816, 1, 1, 1, 1, 1,
1.273328, -0.5361959, 1.28761, 1, 1, 1, 1, 1,
1.277593, 0.222304, 3.301856, 1, 1, 1, 1, 1,
1.282031, 0.3069931, 0.3064015, 1, 1, 1, 1, 1,
1.282649, -0.5514143, 1.666886, 1, 1, 1, 1, 1,
1.290009, 0.6330384, 1.455558, 0, 0, 1, 1, 1,
1.293067, -1.644652, 4.049166, 1, 0, 0, 1, 1,
1.295726, 0.6262238, 2.035815, 1, 0, 0, 1, 1,
1.300917, -0.2103499, 1.302764, 1, 0, 0, 1, 1,
1.307752, -0.3373766, 2.103797, 1, 0, 0, 1, 1,
1.308021, 1.828898, -1.192397, 1, 0, 0, 1, 1,
1.309606, -0.3055819, 1.261928, 0, 0, 0, 1, 1,
1.323652, 0.2445694, -0.5312638, 0, 0, 0, 1, 1,
1.327969, 1.243193, 1.771015, 0, 0, 0, 1, 1,
1.332358, -0.2133229, 1.264334, 0, 0, 0, 1, 1,
1.333162, -0.2341366, 0.977692, 0, 0, 0, 1, 1,
1.342751, 1.441883, 0.7512784, 0, 0, 0, 1, 1,
1.343006, -2.23087, 2.462167, 0, 0, 0, 1, 1,
1.343451, 0.8914051, -0.8272747, 1, 1, 1, 1, 1,
1.351687, 1.451537, -0.6239709, 1, 1, 1, 1, 1,
1.359399, -1.767808, 3.196622, 1, 1, 1, 1, 1,
1.361225, -0.05237094, 0.7906029, 1, 1, 1, 1, 1,
1.361245, 0.740995, -0.4417362, 1, 1, 1, 1, 1,
1.361781, 0.4582626, 2.218384, 1, 1, 1, 1, 1,
1.369739, -1.860902, 0.8297606, 1, 1, 1, 1, 1,
1.380341, 0.404167, 1.300651, 1, 1, 1, 1, 1,
1.380957, -0.1707092, -0.2542233, 1, 1, 1, 1, 1,
1.383905, -0.3361337, 2.695892, 1, 1, 1, 1, 1,
1.383948, 0.0514441, 1.715533, 1, 1, 1, 1, 1,
1.388278, -0.9475799, 1.989306, 1, 1, 1, 1, 1,
1.413691, -0.5434855, 2.409742, 1, 1, 1, 1, 1,
1.419768, -0.4742288, 2.580338, 1, 1, 1, 1, 1,
1.429332, -0.1922401, 1.247045, 1, 1, 1, 1, 1,
1.430042, -0.4055966, 2.981684, 0, 0, 1, 1, 1,
1.44021, -0.8795046, 4.315143, 1, 0, 0, 1, 1,
1.465077, 0.6367308, 1.5722, 1, 0, 0, 1, 1,
1.4657, -1.085121, 2.689977, 1, 0, 0, 1, 1,
1.465735, 0.1691497, 1.707507, 1, 0, 0, 1, 1,
1.466105, 0.1745538, 1.940725, 1, 0, 0, 1, 1,
1.477471, -0.7717731, 4.880786, 0, 0, 0, 1, 1,
1.493337, -0.4063303, 1.768136, 0, 0, 0, 1, 1,
1.494604, -0.1904493, 1.29436, 0, 0, 0, 1, 1,
1.497796, -1.086892, 0.9414333, 0, 0, 0, 1, 1,
1.528116, -0.7434158, 1.279093, 0, 0, 0, 1, 1,
1.532116, -0.06971938, 1.070657, 0, 0, 0, 1, 1,
1.534127, 0.1378268, -0.1061862, 0, 0, 0, 1, 1,
1.534535, 1.203753, 3.190794, 1, 1, 1, 1, 1,
1.53621, -0.04627334, 3.053553, 1, 1, 1, 1, 1,
1.54326, -1.31824, 2.018331, 1, 1, 1, 1, 1,
1.547011, 1.369562, 0.8535801, 1, 1, 1, 1, 1,
1.547023, 0.9818998, 0.9578236, 1, 1, 1, 1, 1,
1.547083, 0.8745877, 0.9602457, 1, 1, 1, 1, 1,
1.550243, 0.7827607, 1.869651, 1, 1, 1, 1, 1,
1.551393, 0.4767599, 2.430304, 1, 1, 1, 1, 1,
1.554086, 0.1604706, 2.05586, 1, 1, 1, 1, 1,
1.560918, 0.8467388, 0.05947836, 1, 1, 1, 1, 1,
1.565422, 0.5696334, 1.072943, 1, 1, 1, 1, 1,
1.581978, -1.149517, 2.434681, 1, 1, 1, 1, 1,
1.595038, 0.7684484, 1.481047, 1, 1, 1, 1, 1,
1.603265, 0.8065737, 2.615247, 1, 1, 1, 1, 1,
1.606712, -0.2398659, 2.078185, 1, 1, 1, 1, 1,
1.612381, 1.695644, -0.5289159, 0, 0, 1, 1, 1,
1.613172, -0.7343355, 3.47027, 1, 0, 0, 1, 1,
1.61662, 1.06771, -0.2126252, 1, 0, 0, 1, 1,
1.646976, -0.3934694, 0.1218234, 1, 0, 0, 1, 1,
1.658316, 0.09397342, 2.087688, 1, 0, 0, 1, 1,
1.667233, -1.096917, 1.703201, 1, 0, 0, 1, 1,
1.670907, 0.01160745, 2.228895, 0, 0, 0, 1, 1,
1.700447, -0.05079399, 0.1796864, 0, 0, 0, 1, 1,
1.708263, 0.9452491, 2.071679, 0, 0, 0, 1, 1,
1.708458, -1.807159, 2.093142, 0, 0, 0, 1, 1,
1.742992, 0.7936717, 2.642475, 0, 0, 0, 1, 1,
1.766927, 1.849679, 2.99684, 0, 0, 0, 1, 1,
1.775289, -0.3995927, 1.544593, 0, 0, 0, 1, 1,
1.779318, -0.3386947, 2.383006, 1, 1, 1, 1, 1,
1.783745, -0.9128706, 1.174921, 1, 1, 1, 1, 1,
1.786903, 0.8026216, 1.173579, 1, 1, 1, 1, 1,
1.801416, -0.04718121, 0.7195209, 1, 1, 1, 1, 1,
1.802971, 1.659513, 1.733008, 1, 1, 1, 1, 1,
1.807857, -1.374649, 2.598415, 1, 1, 1, 1, 1,
1.814775, 0.3395261, 1.624602, 1, 1, 1, 1, 1,
1.816613, 1.491041, 1.568564, 1, 1, 1, 1, 1,
1.849663, -1.066865, 1.012837, 1, 1, 1, 1, 1,
1.858967, 2.750585, 0.8305339, 1, 1, 1, 1, 1,
1.955112, -2.4521, 1.592041, 1, 1, 1, 1, 1,
2.001713, -1.085229, 3.676669, 1, 1, 1, 1, 1,
2.01023, 0.7913622, 2.732482, 1, 1, 1, 1, 1,
2.010967, -0.5282777, 1.611884, 1, 1, 1, 1, 1,
2.019349, 0.9872083, 1.008185, 1, 1, 1, 1, 1,
2.032806, 0.1470177, 1.993296, 0, 0, 1, 1, 1,
2.0474, 0.7760703, 2.379543, 1, 0, 0, 1, 1,
2.098481, -0.6646179, 1.265027, 1, 0, 0, 1, 1,
2.138227, -1.10544, 1.584956, 1, 0, 0, 1, 1,
2.149894, 1.98283, 1.544139, 1, 0, 0, 1, 1,
2.171024, -0.7236803, 0.830645, 1, 0, 0, 1, 1,
2.208005, -0.7435527, 1.383976, 0, 0, 0, 1, 1,
2.235701, 0.8890718, 2.287112, 0, 0, 0, 1, 1,
2.237323, 1.868906, 1.723049, 0, 0, 0, 1, 1,
2.286331, -0.5031508, 1.874333, 0, 0, 0, 1, 1,
2.297813, 0.3951866, 2.619546, 0, 0, 0, 1, 1,
2.397886, 1.43306, 2.629097, 0, 0, 0, 1, 1,
2.411837, 0.2382386, 0.8368781, 0, 0, 0, 1, 1,
2.498405, 0.1059454, 1.656298, 1, 1, 1, 1, 1,
2.52926, 0.3805853, 1.906121, 1, 1, 1, 1, 1,
2.817919, 0.6888812, 0.9610106, 1, 1, 1, 1, 1,
2.992571, 0.5049626, -0.7579607, 1, 1, 1, 1, 1,
3.067447, 0.4933814, 0.9112628, 1, 1, 1, 1, 1,
3.069051, 2.058808, 1.100568, 1, 1, 1, 1, 1,
3.903837, -0.1032062, 2.912146, 1, 1, 1, 1, 1
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
var radius = 9.831768;
var distance = 34.53367;
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
mvMatrix.translate( -0.1533251, -0.005013943, -0.1502094 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.53367);
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
