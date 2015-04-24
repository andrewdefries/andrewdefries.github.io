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
-3.294239, -0.6478609, -2.788466, 1, 0, 0, 1,
-3.198698, -0.4526004, -3.08816, 1, 0.007843138, 0, 1,
-3.175344, 0.9850976, -0.9572234, 1, 0.01176471, 0, 1,
-2.853531, -0.2296148, -0.5016383, 1, 0.01960784, 0, 1,
-2.465044, -1.055637, -1.96253, 1, 0.02352941, 0, 1,
-2.366156, -0.565502, -2.131868, 1, 0.03137255, 0, 1,
-2.265681, 0.3270995, -1.158267, 1, 0.03529412, 0, 1,
-2.233255, -0.1760065, -4.25767, 1, 0.04313726, 0, 1,
-2.179277, 0.7007414, -0.001786947, 1, 0.04705882, 0, 1,
-2.15681, 0.8527813, -0.5895424, 1, 0.05490196, 0, 1,
-2.109523, 0.9721761, 1.656679, 1, 0.05882353, 0, 1,
-2.092314, 0.6552897, -1.942977, 1, 0.06666667, 0, 1,
-2.056771, -1.94252, -1.129008, 1, 0.07058824, 0, 1,
-2.027874, 1.186603, -0.8299832, 1, 0.07843138, 0, 1,
-2.013589, -0.2957405, -3.257992, 1, 0.08235294, 0, 1,
-1.998133, 0.2632832, -2.440612, 1, 0.09019608, 0, 1,
-1.985219, -0.145158, -0.9778197, 1, 0.09411765, 0, 1,
-1.966569, -0.2788857, -1.938168, 1, 0.1019608, 0, 1,
-1.965916, 2.883107, -0.2031656, 1, 0.1098039, 0, 1,
-1.960553, -1.201541, -1.864001, 1, 0.1137255, 0, 1,
-1.957354, 0.6457229, -2.186985, 1, 0.1215686, 0, 1,
-1.954555, -0.9398844, -1.772332, 1, 0.1254902, 0, 1,
-1.935293, 0.52394, -2.732175, 1, 0.1333333, 0, 1,
-1.91921, 0.5419983, -2.004621, 1, 0.1372549, 0, 1,
-1.901453, 0.228467, -0.1949858, 1, 0.145098, 0, 1,
-1.896501, -1.431642, -2.844121, 1, 0.1490196, 0, 1,
-1.893894, -0.2517983, -1.631492, 1, 0.1568628, 0, 1,
-1.886263, -0.4801654, -0.3053481, 1, 0.1607843, 0, 1,
-1.878345, 0.2961483, -2.666332, 1, 0.1686275, 0, 1,
-1.875301, 0.1574223, -1.040334, 1, 0.172549, 0, 1,
-1.815777, -1.274303, -2.951998, 1, 0.1803922, 0, 1,
-1.792393, 1.292384, -0.4304448, 1, 0.1843137, 0, 1,
-1.785503, 0.5931913, -1.710534, 1, 0.1921569, 0, 1,
-1.770346, 0.7794678, -0.7796034, 1, 0.1960784, 0, 1,
-1.765773, -0.1587702, -0.8756252, 1, 0.2039216, 0, 1,
-1.757337, -1.128654, -0.5860429, 1, 0.2117647, 0, 1,
-1.716565, -0.7151864, -1.651025, 1, 0.2156863, 0, 1,
-1.714424, 0.3565354, -3.159102, 1, 0.2235294, 0, 1,
-1.708229, 0.3150002, -0.8606024, 1, 0.227451, 0, 1,
-1.703267, 0.2232579, -1.405953, 1, 0.2352941, 0, 1,
-1.687613, -0.06357146, -2.002591, 1, 0.2392157, 0, 1,
-1.6824, 0.4068272, -0.8715762, 1, 0.2470588, 0, 1,
-1.675667, -0.5481454, -3.38011, 1, 0.2509804, 0, 1,
-1.648093, -1.674618, -2.503168, 1, 0.2588235, 0, 1,
-1.629123, 0.9335152, -1.132728, 1, 0.2627451, 0, 1,
-1.622183, 0.2534911, -2.402396, 1, 0.2705882, 0, 1,
-1.621329, -0.3240506, -2.409245, 1, 0.2745098, 0, 1,
-1.589033, 0.3699335, -2.263392, 1, 0.282353, 0, 1,
-1.588476, 0.7781255, -0.6846468, 1, 0.2862745, 0, 1,
-1.583219, 0.4488195, -3.352259, 1, 0.2941177, 0, 1,
-1.559806, -0.679652, -0.1980459, 1, 0.3019608, 0, 1,
-1.55703, 0.6005934, -1.188614, 1, 0.3058824, 0, 1,
-1.554503, 0.3736529, -1.624547, 1, 0.3137255, 0, 1,
-1.553103, -0.6535773, -1.724242, 1, 0.3176471, 0, 1,
-1.551026, -0.2810016, -1.625861, 1, 0.3254902, 0, 1,
-1.534441, -0.2709154, -2.323436, 1, 0.3294118, 0, 1,
-1.53011, 2.051357, -4.750173, 1, 0.3372549, 0, 1,
-1.506366, 1.352529, 0.3257596, 1, 0.3411765, 0, 1,
-1.497919, -0.1506708, -3.488466, 1, 0.3490196, 0, 1,
-1.481298, -1.129724, -0.510246, 1, 0.3529412, 0, 1,
-1.463351, 0.2208778, -2.388155, 1, 0.3607843, 0, 1,
-1.441394, -1.323135, -1.473933, 1, 0.3647059, 0, 1,
-1.438398, -0.2272778, -1.379376, 1, 0.372549, 0, 1,
-1.436709, -0.8441188, -1.146583, 1, 0.3764706, 0, 1,
-1.43285, 1.277657, -1.158032, 1, 0.3843137, 0, 1,
-1.431593, 0.3521203, -1.862914, 1, 0.3882353, 0, 1,
-1.422924, 1.046907, -0.1190917, 1, 0.3960784, 0, 1,
-1.419569, -0.556871, -1.736323, 1, 0.4039216, 0, 1,
-1.382687, 0.02509879, -3.699168, 1, 0.4078431, 0, 1,
-1.380308, -0.536947, -3.595242, 1, 0.4156863, 0, 1,
-1.380134, -1.091674, -1.318444, 1, 0.4196078, 0, 1,
-1.378857, -1.696184, -1.192982, 1, 0.427451, 0, 1,
-1.362841, -1.652648, -1.595605, 1, 0.4313726, 0, 1,
-1.358187, 0.9581524, -0.5453277, 1, 0.4392157, 0, 1,
-1.354468, -2.176548, -3.042032, 1, 0.4431373, 0, 1,
-1.349956, -0.4123245, -1.556772, 1, 0.4509804, 0, 1,
-1.339438, -0.9674937, -2.302723, 1, 0.454902, 0, 1,
-1.332626, 1.880754, -2.001325, 1, 0.4627451, 0, 1,
-1.323121, 1.75789, -0.8447945, 1, 0.4666667, 0, 1,
-1.321704, 1.06866, -0.2272583, 1, 0.4745098, 0, 1,
-1.317336, 0.8602676, -1.234812, 1, 0.4784314, 0, 1,
-1.315676, -0.1982466, -0.6816464, 1, 0.4862745, 0, 1,
-1.314428, 0.3432381, -0.2538114, 1, 0.4901961, 0, 1,
-1.312833, 0.5627586, -0.8092861, 1, 0.4980392, 0, 1,
-1.310512, -0.7539667, -2.188264, 1, 0.5058824, 0, 1,
-1.299269, 0.1246366, -1.739823, 1, 0.509804, 0, 1,
-1.290947, -2.077285, -2.534436, 1, 0.5176471, 0, 1,
-1.28586, -0.7079303, -1.680209, 1, 0.5215687, 0, 1,
-1.282969, 1.095325, -0.808412, 1, 0.5294118, 0, 1,
-1.275275, -0.3804074, -1.918441, 1, 0.5333334, 0, 1,
-1.270297, -2.13381, -1.807234, 1, 0.5411765, 0, 1,
-1.257699, -0.6461858, -2.260097, 1, 0.5450981, 0, 1,
-1.25216, -0.3777026, -0.5622248, 1, 0.5529412, 0, 1,
-1.24305, -0.007863121, -1.64406, 1, 0.5568628, 0, 1,
-1.237542, -0.1597489, -2.729705, 1, 0.5647059, 0, 1,
-1.229666, 0.6338046, 0.4095069, 1, 0.5686275, 0, 1,
-1.217638, 0.267364, 0.06220397, 1, 0.5764706, 0, 1,
-1.212568, 1.067601, -1.471997, 1, 0.5803922, 0, 1,
-1.209799, 0.09517255, -1.492895, 1, 0.5882353, 0, 1,
-1.207736, 0.1613113, -1.768028, 1, 0.5921569, 0, 1,
-1.204187, -0.4621075, -1.379542, 1, 0.6, 0, 1,
-1.200024, -0.8399674, -2.853004, 1, 0.6078432, 0, 1,
-1.195249, -0.09683099, -0.7185218, 1, 0.6117647, 0, 1,
-1.192901, 0.5398109, 0.9511898, 1, 0.6196079, 0, 1,
-1.179061, 0.9294295, -1.947832, 1, 0.6235294, 0, 1,
-1.159113, 0.6637369, 0.06142655, 1, 0.6313726, 0, 1,
-1.152022, 0.2340243, -1.705658, 1, 0.6352941, 0, 1,
-1.140569, -0.4027706, -2.73292, 1, 0.6431373, 0, 1,
-1.133879, 1.399091, -1.432366, 1, 0.6470588, 0, 1,
-1.114474, -1.220434, -2.57995, 1, 0.654902, 0, 1,
-1.1131, 1.909469, -0.8328781, 1, 0.6588235, 0, 1,
-1.113058, 1.365197, -1.492078, 1, 0.6666667, 0, 1,
-1.108932, -0.4011711, -2.309675, 1, 0.6705883, 0, 1,
-1.108884, -0.3394023, -2.235785, 1, 0.6784314, 0, 1,
-1.099785, -1.380955, -1.917337, 1, 0.682353, 0, 1,
-1.096286, 0.2711118, -2.152148, 1, 0.6901961, 0, 1,
-1.093597, 0.7914727, -1.506986, 1, 0.6941177, 0, 1,
-1.090254, -0.2124712, -0.9916801, 1, 0.7019608, 0, 1,
-1.089246, -0.2390118, -2.263286, 1, 0.7098039, 0, 1,
-1.08882, 0.4678576, -0.2051899, 1, 0.7137255, 0, 1,
-1.088647, 0.4738531, -2.055623, 1, 0.7215686, 0, 1,
-1.086948, 0.1850975, -0.9351335, 1, 0.7254902, 0, 1,
-1.084125, 0.4005728, -1.505528, 1, 0.7333333, 0, 1,
-1.083233, 0.4593677, -2.628359, 1, 0.7372549, 0, 1,
-1.080674, 1.264488, -0.1086984, 1, 0.7450981, 0, 1,
-1.076975, -0.8094477, -2.193333, 1, 0.7490196, 0, 1,
-1.069095, 0.379104, -1.239645, 1, 0.7568628, 0, 1,
-1.068139, -1.160231, -3.155739, 1, 0.7607843, 0, 1,
-1.062766, -1.412641, -2.484319, 1, 0.7686275, 0, 1,
-1.058768, 0.28433, -3.18731, 1, 0.772549, 0, 1,
-1.057438, -0.04185821, -1.519141, 1, 0.7803922, 0, 1,
-1.05676, 0.1255353, -0.6765827, 1, 0.7843137, 0, 1,
-1.053481, 0.02711618, -1.290085, 1, 0.7921569, 0, 1,
-1.04715, 0.06145208, -2.182036, 1, 0.7960784, 0, 1,
-1.043941, 1.819914, -1.906597, 1, 0.8039216, 0, 1,
-1.037616, -0.9914314, -2.689246, 1, 0.8117647, 0, 1,
-1.031063, 0.6188292, -2.254282, 1, 0.8156863, 0, 1,
-1.029049, -1.895234, -2.82886, 1, 0.8235294, 0, 1,
-1.026857, -0.5132488, -2.125661, 1, 0.827451, 0, 1,
-1.024643, 2.814626, -0.166123, 1, 0.8352941, 0, 1,
-1.021002, 1.340582, 0.5359862, 1, 0.8392157, 0, 1,
-1.020239, -0.6731632, -4.239638, 1, 0.8470588, 0, 1,
-1.014803, -0.07637026, -0.8867656, 1, 0.8509804, 0, 1,
-1.0117, 1.911695, 0.382637, 1, 0.8588235, 0, 1,
-1.011328, 0.1939575, -1.058594, 1, 0.8627451, 0, 1,
-1.002704, -0.5121732, -2.000583, 1, 0.8705882, 0, 1,
-1.001448, 0.8444895, -0.3625136, 1, 0.8745098, 0, 1,
-0.9997259, -0.4585729, -2.042808, 1, 0.8823529, 0, 1,
-0.9963793, -0.1898806, -3.187027, 1, 0.8862745, 0, 1,
-0.9909277, 0.008370144, -0.5565021, 1, 0.8941177, 0, 1,
-0.9855046, 1.539584, 0.1538941, 1, 0.8980392, 0, 1,
-0.9854509, -0.9452899, -2.12633, 1, 0.9058824, 0, 1,
-0.9819289, -0.1607582, -2.680549, 1, 0.9137255, 0, 1,
-0.9793883, -1.106435, -3.281177, 1, 0.9176471, 0, 1,
-0.9790541, 0.6586549, -2.111862, 1, 0.9254902, 0, 1,
-0.9763801, -1.000152, -0.951883, 1, 0.9294118, 0, 1,
-0.966558, -0.07690482, -3.229897, 1, 0.9372549, 0, 1,
-0.9601811, 0.004874716, -0.7674748, 1, 0.9411765, 0, 1,
-0.9567583, -0.09102124, -1.262578, 1, 0.9490196, 0, 1,
-0.9548877, -0.7845894, -1.298386, 1, 0.9529412, 0, 1,
-0.9514549, -1.315592, -1.758501, 1, 0.9607843, 0, 1,
-0.9511182, 1.759923, 0.02714641, 1, 0.9647059, 0, 1,
-0.9491166, -0.2377268, -1.95287, 1, 0.972549, 0, 1,
-0.9471747, 0.2925664, -2.221569, 1, 0.9764706, 0, 1,
-0.946283, -0.4909621, -2.141694, 1, 0.9843137, 0, 1,
-0.940208, -2.786701, -1.918599, 1, 0.9882353, 0, 1,
-0.9371167, -1.203241, -3.579156, 1, 0.9960784, 0, 1,
-0.9242852, 1.223554, -0.5895181, 0.9960784, 1, 0, 1,
-0.9242736, 0.04609918, -2.970453, 0.9921569, 1, 0, 1,
-0.9198256, 0.04185662, -2.074214, 0.9843137, 1, 0, 1,
-0.9122427, -1.759462, -3.25257, 0.9803922, 1, 0, 1,
-0.911808, 0.1948902, -0.8815402, 0.972549, 1, 0, 1,
-0.9117395, -0.9825391, -1.547274, 0.9686275, 1, 0, 1,
-0.9099174, -0.6257279, -1.902804, 0.9607843, 1, 0, 1,
-0.9067273, -0.0929651, -0.858859, 0.9568627, 1, 0, 1,
-0.9017999, -0.4055123, -3.131664, 0.9490196, 1, 0, 1,
-0.8987903, -1.182607, -2.332867, 0.945098, 1, 0, 1,
-0.8916234, -0.5574176, -0.8099583, 0.9372549, 1, 0, 1,
-0.8866938, 1.756739, -0.4788386, 0.9333333, 1, 0, 1,
-0.8845129, -0.04242221, -1.123648, 0.9254902, 1, 0, 1,
-0.8822385, 1.05054, -0.8335437, 0.9215686, 1, 0, 1,
-0.8761126, 1.402184, -1.103124, 0.9137255, 1, 0, 1,
-0.8737805, 0.04432858, -1.917344, 0.9098039, 1, 0, 1,
-0.8736137, -1.316594, -1.725865, 0.9019608, 1, 0, 1,
-0.8693501, -0.09494115, -0.193408, 0.8941177, 1, 0, 1,
-0.8676823, -0.2857996, -1.637804, 0.8901961, 1, 0, 1,
-0.8654597, -0.212438, -1.324872, 0.8823529, 1, 0, 1,
-0.8651842, -2.137609, -2.40793, 0.8784314, 1, 0, 1,
-0.8568325, -0.5283657, -2.441503, 0.8705882, 1, 0, 1,
-0.8489259, 0.6823225, -2.154897, 0.8666667, 1, 0, 1,
-0.846479, 1.310028, -1.581544, 0.8588235, 1, 0, 1,
-0.8464648, 0.1168064, -1.289595, 0.854902, 1, 0, 1,
-0.8370319, 0.7968164, -1.287944, 0.8470588, 1, 0, 1,
-0.8338807, -1.272092, -2.680561, 0.8431373, 1, 0, 1,
-0.8317415, -0.0325371, -2.601593, 0.8352941, 1, 0, 1,
-0.8278795, -0.07815163, -1.769174, 0.8313726, 1, 0, 1,
-0.8271509, -0.2551318, -1.468151, 0.8235294, 1, 0, 1,
-0.8230762, -2.25003, -3.696671, 0.8196079, 1, 0, 1,
-0.8212385, 0.4755504, 0.783596, 0.8117647, 1, 0, 1,
-0.8128574, 0.5290167, -2.355871, 0.8078431, 1, 0, 1,
-0.8120884, -0.7435334, -3.164672, 0.8, 1, 0, 1,
-0.8096899, -0.1323528, -2.939548, 0.7921569, 1, 0, 1,
-0.8092705, 0.7915013, -2.07584, 0.7882353, 1, 0, 1,
-0.8039538, 0.5344189, -1.446156, 0.7803922, 1, 0, 1,
-0.8031151, -0.3550965, -3.010707, 0.7764706, 1, 0, 1,
-0.8004736, 0.4544335, 1.119744, 0.7686275, 1, 0, 1,
-0.7981939, 1.189797, -1.996775, 0.7647059, 1, 0, 1,
-0.796798, 0.7069322, -0.1840475, 0.7568628, 1, 0, 1,
-0.7940215, -0.004530645, -3.208208, 0.7529412, 1, 0, 1,
-0.7930617, -0.5909355, -1.452345, 0.7450981, 1, 0, 1,
-0.7913711, 1.395317, -1.512587, 0.7411765, 1, 0, 1,
-0.7902565, -0.1174042, -3.355524, 0.7333333, 1, 0, 1,
-0.7897935, -1.040424, -4.128565, 0.7294118, 1, 0, 1,
-0.7880211, -0.1571154, -3.884787, 0.7215686, 1, 0, 1,
-0.7857131, 1.616503, 0.4975627, 0.7176471, 1, 0, 1,
-0.7804078, -0.01745711, -2.841496, 0.7098039, 1, 0, 1,
-0.7758604, 0.8210564, -1.42326, 0.7058824, 1, 0, 1,
-0.7619641, 0.178103, -1.9476, 0.6980392, 1, 0, 1,
-0.7573349, 1.376153, -1.293061, 0.6901961, 1, 0, 1,
-0.7412049, -0.8459045, -0.9990765, 0.6862745, 1, 0, 1,
-0.73579, 1.888405, -0.1391975, 0.6784314, 1, 0, 1,
-0.7339215, -1.41046, 0.6233501, 0.6745098, 1, 0, 1,
-0.7325881, 1.560229, 0.3876945, 0.6666667, 1, 0, 1,
-0.7297959, 2.002071, -1.479471, 0.6627451, 1, 0, 1,
-0.7230706, -1.330974, -2.76155, 0.654902, 1, 0, 1,
-0.7223855, 0.4238346, -1.741998, 0.6509804, 1, 0, 1,
-0.7103711, 0.2002394, -1.149737, 0.6431373, 1, 0, 1,
-0.70209, 0.1984179, -1.026363, 0.6392157, 1, 0, 1,
-0.694126, -0.5458685, -1.467254, 0.6313726, 1, 0, 1,
-0.6896572, -0.505499, -0.5373724, 0.627451, 1, 0, 1,
-0.6885371, -1.30783, -3.860972, 0.6196079, 1, 0, 1,
-0.6833089, -1.586172, -3.113454, 0.6156863, 1, 0, 1,
-0.6830063, 0.4883744, 0.1459761, 0.6078432, 1, 0, 1,
-0.6828934, -2.737962, -2.69062, 0.6039216, 1, 0, 1,
-0.6801848, 0.3100835, -1.84949, 0.5960785, 1, 0, 1,
-0.6787198, 1.859651, 0.3726598, 0.5882353, 1, 0, 1,
-0.6784139, -0.2898409, -1.960256, 0.5843138, 1, 0, 1,
-0.6742471, -0.2144677, -1.968955, 0.5764706, 1, 0, 1,
-0.6713966, 0.6391421, -1.53967, 0.572549, 1, 0, 1,
-0.6711217, -1.106822, -2.19698, 0.5647059, 1, 0, 1,
-0.6640983, -0.9301137, -1.746774, 0.5607843, 1, 0, 1,
-0.6611636, 0.4387953, -0.1193871, 0.5529412, 1, 0, 1,
-0.6568658, 1.125901, -1.101637, 0.5490196, 1, 0, 1,
-0.6533295, 0.6041551, -2.032689, 0.5411765, 1, 0, 1,
-0.6532148, 0.9491279, -0.3727218, 0.5372549, 1, 0, 1,
-0.6531057, -1.137735, -2.60669, 0.5294118, 1, 0, 1,
-0.65295, -0.00223033, -1.000767, 0.5254902, 1, 0, 1,
-0.6490415, -0.8341632, -1.620575, 0.5176471, 1, 0, 1,
-0.6468819, -0.6998237, -2.492857, 0.5137255, 1, 0, 1,
-0.6460909, -0.2307864, -2.076116, 0.5058824, 1, 0, 1,
-0.6351122, -0.1472757, -1.664289, 0.5019608, 1, 0, 1,
-0.6301955, -1.11593, -2.206233, 0.4941176, 1, 0, 1,
-0.6244212, -0.04279876, -1.219565, 0.4862745, 1, 0, 1,
-0.6220953, 2.69419, -0.5849599, 0.4823529, 1, 0, 1,
-0.6205897, 1.241396, -0.7424023, 0.4745098, 1, 0, 1,
-0.6156541, -0.2516308, -1.661048, 0.4705882, 1, 0, 1,
-0.6146201, 0.4387499, -1.943007, 0.4627451, 1, 0, 1,
-0.6122567, 0.5956417, 0.02023121, 0.4588235, 1, 0, 1,
-0.6099345, -0.0588907, -0.9356202, 0.4509804, 1, 0, 1,
-0.608641, 1.357195, -1.555975, 0.4470588, 1, 0, 1,
-0.6079724, 1.190409, -0.5495378, 0.4392157, 1, 0, 1,
-0.6029677, 0.957545, -0.6494731, 0.4352941, 1, 0, 1,
-0.5973023, -0.3878068, -3.343877, 0.427451, 1, 0, 1,
-0.5943537, -0.009098052, -0.8511173, 0.4235294, 1, 0, 1,
-0.5916614, 0.05353802, -1.604344, 0.4156863, 1, 0, 1,
-0.5905446, -0.6469268, -2.200201, 0.4117647, 1, 0, 1,
-0.5898753, -0.6083574, -1.079557, 0.4039216, 1, 0, 1,
-0.5861254, -1.835891, -3.022003, 0.3960784, 1, 0, 1,
-0.5825086, 0.07063748, -3.291307, 0.3921569, 1, 0, 1,
-0.581389, 0.2729279, -0.7446072, 0.3843137, 1, 0, 1,
-0.5807943, 0.1113465, -2.797077, 0.3803922, 1, 0, 1,
-0.5762452, -0.2554113, -1.568793, 0.372549, 1, 0, 1,
-0.5741515, -0.5311232, -3.210603, 0.3686275, 1, 0, 1,
-0.5705601, -0.5552672, -3.270051, 0.3607843, 1, 0, 1,
-0.5693884, 0.279702, -2.070136, 0.3568628, 1, 0, 1,
-0.5691204, -0.6783838, -1.676839, 0.3490196, 1, 0, 1,
-0.5661088, -0.4155436, -2.573981, 0.345098, 1, 0, 1,
-0.5596922, 0.1535469, -2.076219, 0.3372549, 1, 0, 1,
-0.5564144, -0.8007404, -1.925472, 0.3333333, 1, 0, 1,
-0.5526505, -0.6118222, -2.991942, 0.3254902, 1, 0, 1,
-0.5505058, -0.2162131, -2.648238, 0.3215686, 1, 0, 1,
-0.5490248, -0.0952539, -2.660094, 0.3137255, 1, 0, 1,
-0.546358, 1.042856, -0.5385633, 0.3098039, 1, 0, 1,
-0.5462113, 0.06314909, -1.340909, 0.3019608, 1, 0, 1,
-0.5381112, -2.189775, -2.388788, 0.2941177, 1, 0, 1,
-0.5379347, -0.1628692, 0.1399364, 0.2901961, 1, 0, 1,
-0.5366775, -0.1799884, -3.16408, 0.282353, 1, 0, 1,
-0.5366744, -0.1485666, -1.951971, 0.2784314, 1, 0, 1,
-0.5353412, 0.9097229, -0.6195112, 0.2705882, 1, 0, 1,
-0.5339941, 2.069434, -0.1641734, 0.2666667, 1, 0, 1,
-0.5336585, 1.06719, -1.078156, 0.2588235, 1, 0, 1,
-0.5334058, 0.3293723, -0.4197786, 0.254902, 1, 0, 1,
-0.5303338, -0.6976401, -2.692053, 0.2470588, 1, 0, 1,
-0.5300478, 1.487858, 0.6862869, 0.2431373, 1, 0, 1,
-0.5249403, -0.2063656, -1.242348, 0.2352941, 1, 0, 1,
-0.5238163, 0.4766306, -1.226929, 0.2313726, 1, 0, 1,
-0.5233584, 0.3522782, -0.4782374, 0.2235294, 1, 0, 1,
-0.5217333, -0.6721218, -2.079151, 0.2196078, 1, 0, 1,
-0.5196368, -2.307137, -1.056008, 0.2117647, 1, 0, 1,
-0.5173834, -0.4793284, -0.5445906, 0.2078431, 1, 0, 1,
-0.5101985, 0.8190904, -0.3880281, 0.2, 1, 0, 1,
-0.5095392, -0.2789045, -2.443266, 0.1921569, 1, 0, 1,
-0.5089378, -0.02880237, -2.192301, 0.1882353, 1, 0, 1,
-0.5088125, -0.02984926, -3.22483, 0.1803922, 1, 0, 1,
-0.5074447, 1.177773, 0.06788359, 0.1764706, 1, 0, 1,
-0.5068004, -0.02246817, -1.007578, 0.1686275, 1, 0, 1,
-0.5050167, 0.225383, -2.752423, 0.1647059, 1, 0, 1,
-0.5029045, 0.05823498, -2.458949, 0.1568628, 1, 0, 1,
-0.5001269, -0.04795329, -3.567551, 0.1529412, 1, 0, 1,
-0.4970635, -0.1816916, -3.385281, 0.145098, 1, 0, 1,
-0.4878694, -0.3510011, -2.698109, 0.1411765, 1, 0, 1,
-0.4875714, 1.188542, -0.6105826, 0.1333333, 1, 0, 1,
-0.4857647, -2.328721, -1.104192, 0.1294118, 1, 0, 1,
-0.4847912, -0.0233008, -2.998107, 0.1215686, 1, 0, 1,
-0.4825585, 0.1704471, -2.564583, 0.1176471, 1, 0, 1,
-0.4795619, 0.9807087, -0.1413622, 0.1098039, 1, 0, 1,
-0.4750168, -0.9271939, -0.3356645, 0.1058824, 1, 0, 1,
-0.4732756, 0.6005086, 0.1800704, 0.09803922, 1, 0, 1,
-0.4691572, 1.50685, -0.07625919, 0.09019608, 1, 0, 1,
-0.4678528, 0.9138255, -0.8574075, 0.08627451, 1, 0, 1,
-0.4650315, -0.8296558, -2.558931, 0.07843138, 1, 0, 1,
-0.4631724, 0.1520927, 0.02874614, 0.07450981, 1, 0, 1,
-0.4628642, -1.540673, -1.738687, 0.06666667, 1, 0, 1,
-0.4498866, -0.518786, -2.57552, 0.0627451, 1, 0, 1,
-0.4447494, 0.6040387, -1.035141, 0.05490196, 1, 0, 1,
-0.4435753, -0.6049359, -1.2154, 0.05098039, 1, 0, 1,
-0.4389482, -0.1373419, -1.6961, 0.04313726, 1, 0, 1,
-0.4368903, 0.2554595, 0.4068251, 0.03921569, 1, 0, 1,
-0.4363261, -0.8817233, -1.819759, 0.03137255, 1, 0, 1,
-0.4351835, 0.2744097, -2.368701, 0.02745098, 1, 0, 1,
-0.4240635, 0.5580307, -0.0392805, 0.01960784, 1, 0, 1,
-0.4197655, 1.409778, -0.764447, 0.01568628, 1, 0, 1,
-0.4189109, 0.6920452, 1.392145, 0.007843138, 1, 0, 1,
-0.4157945, -0.7279782, -3.489802, 0.003921569, 1, 0, 1,
-0.4139087, 0.852423, -0.3592421, 0, 1, 0.003921569, 1,
-0.4101596, 0.5190641, -2.592758, 0, 1, 0.01176471, 1,
-0.4055966, 0.2182861, -1.290409, 0, 1, 0.01568628, 1,
-0.4040484, -0.5540339, -3.782568, 0, 1, 0.02352941, 1,
-0.4022692, -1.584286, -2.559237, 0, 1, 0.02745098, 1,
-0.3944562, 0.1174349, -2.560395, 0, 1, 0.03529412, 1,
-0.3938602, 0.7827808, -0.9018137, 0, 1, 0.03921569, 1,
-0.3924164, 1.0415, -2.814319, 0, 1, 0.04705882, 1,
-0.3885239, 0.05132099, -2.031339, 0, 1, 0.05098039, 1,
-0.387908, 0.05780448, -1.949978, 0, 1, 0.05882353, 1,
-0.3838988, 0.3941392, -0.2256572, 0, 1, 0.0627451, 1,
-0.3818602, 0.9385033, -1.158263, 0, 1, 0.07058824, 1,
-0.3789458, 0.9537615, -0.07487711, 0, 1, 0.07450981, 1,
-0.3788551, -0.6649433, -3.430921, 0, 1, 0.08235294, 1,
-0.3769875, -0.1539619, -1.362893, 0, 1, 0.08627451, 1,
-0.3696018, 0.7001995, -0.4035307, 0, 1, 0.09411765, 1,
-0.3646054, 1.818824, 1.299446, 0, 1, 0.1019608, 1,
-0.3621592, 0.6613879, 0.1145836, 0, 1, 0.1058824, 1,
-0.3615568, -1.484977, -3.624485, 0, 1, 0.1137255, 1,
-0.360627, 1.096127, 1.428208, 0, 1, 0.1176471, 1,
-0.3546105, 0.7344702, -0.9463087, 0, 1, 0.1254902, 1,
-0.3535272, 1.381957, -1.620311, 0, 1, 0.1294118, 1,
-0.3479681, -0.4890535, -1.224657, 0, 1, 0.1372549, 1,
-0.335483, 1.10691, 0.7161676, 0, 1, 0.1411765, 1,
-0.3315489, 1.200706, -0.6791089, 0, 1, 0.1490196, 1,
-0.3299441, 0.1191906, -1.094062, 0, 1, 0.1529412, 1,
-0.3285704, 0.1775062, -1.426858, 0, 1, 0.1607843, 1,
-0.3282606, 0.6646166, -0.3545575, 0, 1, 0.1647059, 1,
-0.3255322, 0.3865694, -0.2560394, 0, 1, 0.172549, 1,
-0.3248837, 2.01481, 0.7802913, 0, 1, 0.1764706, 1,
-0.3188968, -0.9359821, -2.011458, 0, 1, 0.1843137, 1,
-0.3159156, 0.2408089, 0.161532, 0, 1, 0.1882353, 1,
-0.3158106, 0.9761345, 1.766322, 0, 1, 0.1960784, 1,
-0.31215, -0.2844814, -1.335336, 0, 1, 0.2039216, 1,
-0.3082994, 1.314165, -0.2207429, 0, 1, 0.2078431, 1,
-0.3055358, 0.6987185, -1.779116, 0, 1, 0.2156863, 1,
-0.3047601, -0.1603361, -1.618542, 0, 1, 0.2196078, 1,
-0.2924585, -0.05980748, -2.570744, 0, 1, 0.227451, 1,
-0.291359, -0.2981783, -2.438588, 0, 1, 0.2313726, 1,
-0.2859356, -0.4419393, -1.666206, 0, 1, 0.2392157, 1,
-0.2836664, -0.2633674, -3.933291, 0, 1, 0.2431373, 1,
-0.2806261, -0.4756737, -4.49151, 0, 1, 0.2509804, 1,
-0.2801204, -1.110491, -2.083778, 0, 1, 0.254902, 1,
-0.2792791, -0.5543258, -3.018576, 0, 1, 0.2627451, 1,
-0.2765348, -0.2232798, 0.04135755, 0, 1, 0.2666667, 1,
-0.2763409, -0.6079702, -2.018373, 0, 1, 0.2745098, 1,
-0.2717842, 0.1517787, -1.020532, 0, 1, 0.2784314, 1,
-0.2715556, 0.1943141, -2.145946, 0, 1, 0.2862745, 1,
-0.2707908, 0.956543, 0.08057179, 0, 1, 0.2901961, 1,
-0.2688609, 0.8702483, -0.102402, 0, 1, 0.2980392, 1,
-0.2688319, -0.09931869, -2.75706, 0, 1, 0.3058824, 1,
-0.2659318, -0.6149924, -3.001193, 0, 1, 0.3098039, 1,
-0.2656383, 0.3249303, 0.1329262, 0, 1, 0.3176471, 1,
-0.2609397, 0.1420184, -1.704188, 0, 1, 0.3215686, 1,
-0.2586249, -1.011895, -3.105876, 0, 1, 0.3294118, 1,
-0.2577924, 0.0743034, -1.55808, 0, 1, 0.3333333, 1,
-0.2540142, 1.090573, 0.5607033, 0, 1, 0.3411765, 1,
-0.2493876, 0.6697483, -1.088836, 0, 1, 0.345098, 1,
-0.2480844, -1.86468, -4.987051, 0, 1, 0.3529412, 1,
-0.2478132, 1.029338, -0.5931799, 0, 1, 0.3568628, 1,
-0.2474731, 0.4564144, -1.489967, 0, 1, 0.3647059, 1,
-0.2465495, 1.193352, -1.844098, 0, 1, 0.3686275, 1,
-0.2433006, -0.08364137, -3.551391, 0, 1, 0.3764706, 1,
-0.236478, 1.577151, 1.086787, 0, 1, 0.3803922, 1,
-0.2353982, -1.123147, -3.916764, 0, 1, 0.3882353, 1,
-0.2339042, 0.9210103, -0.4946588, 0, 1, 0.3921569, 1,
-0.2286704, 0.2933404, 0.1431699, 0, 1, 0.4, 1,
-0.2285312, -0.1851266, -1.742073, 0, 1, 0.4078431, 1,
-0.2275341, -0.5419726, -2.994803, 0, 1, 0.4117647, 1,
-0.2270192, 1.811958, 0.329746, 0, 1, 0.4196078, 1,
-0.2183489, -1.145034, -0.6679825, 0, 1, 0.4235294, 1,
-0.2147412, 0.306976, -1.90753, 0, 1, 0.4313726, 1,
-0.2142061, 0.4308712, -1.256915, 0, 1, 0.4352941, 1,
-0.2139881, 0.08697699, -0.3476806, 0, 1, 0.4431373, 1,
-0.211595, 0.5230005, -0.6402191, 0, 1, 0.4470588, 1,
-0.2090699, 1.147988, -1.473697, 0, 1, 0.454902, 1,
-0.2088461, 0.3582563, -1.126631, 0, 1, 0.4588235, 1,
-0.2082872, 0.9383548, 0.5057169, 0, 1, 0.4666667, 1,
-0.2002175, -1.332083, -2.524099, 0, 1, 0.4705882, 1,
-0.1978095, -0.3670566, -2.212217, 0, 1, 0.4784314, 1,
-0.1955116, -0.8056472, -2.595094, 0, 1, 0.4823529, 1,
-0.1947519, -0.5794278, -2.800183, 0, 1, 0.4901961, 1,
-0.1937485, -0.8668191, -4.054099, 0, 1, 0.4941176, 1,
-0.1921435, -1.501674, -5.34728, 0, 1, 0.5019608, 1,
-0.1916926, 0.4832257, 0.9039726, 0, 1, 0.509804, 1,
-0.1912537, 0.2429489, -2.621221, 0, 1, 0.5137255, 1,
-0.1882667, 1.32542, -0.9124216, 0, 1, 0.5215687, 1,
-0.1873153, -0.3610635, -0.3239646, 0, 1, 0.5254902, 1,
-0.1827318, -0.6264294, -3.98284, 0, 1, 0.5333334, 1,
-0.1826206, -1.046554, -4.742898, 0, 1, 0.5372549, 1,
-0.180119, 1.315848, -0.5475097, 0, 1, 0.5450981, 1,
-0.1798576, -0.8804945, -5.299815, 0, 1, 0.5490196, 1,
-0.17449, 0.8918214, -0.469917, 0, 1, 0.5568628, 1,
-0.1718015, -1.577122, -4.583157, 0, 1, 0.5607843, 1,
-0.1702582, 1.498354, -1.197681, 0, 1, 0.5686275, 1,
-0.1688436, -1.594902, -3.232525, 0, 1, 0.572549, 1,
-0.1686323, 1.231878, 1.21793, 0, 1, 0.5803922, 1,
-0.1677706, 1.487301, 1.360495, 0, 1, 0.5843138, 1,
-0.1657277, -1.986055, -3.636667, 0, 1, 0.5921569, 1,
-0.1593665, -0.6719015, -2.65093, 0, 1, 0.5960785, 1,
-0.1570022, -0.5798842, -3.939478, 0, 1, 0.6039216, 1,
-0.1519506, 0.9031497, -0.4900664, 0, 1, 0.6117647, 1,
-0.147059, -2.359898, -3.872724, 0, 1, 0.6156863, 1,
-0.1445557, -0.4135258, -0.07179562, 0, 1, 0.6235294, 1,
-0.1440448, -0.009477764, -0.6010522, 0, 1, 0.627451, 1,
-0.1438225, -1.163419, -4.252884, 0, 1, 0.6352941, 1,
-0.141979, -0.8174949, -3.83499, 0, 1, 0.6392157, 1,
-0.1361267, -0.2682267, -2.034572, 0, 1, 0.6470588, 1,
-0.1360589, 0.6262932, -0.7119282, 0, 1, 0.6509804, 1,
-0.1336982, -0.2534247, -3.172902, 0, 1, 0.6588235, 1,
-0.1269314, -0.09217777, -2.693639, 0, 1, 0.6627451, 1,
-0.1263616, 1.526596, 0.6962554, 0, 1, 0.6705883, 1,
-0.1243627, -1.348598, -4.955161, 0, 1, 0.6745098, 1,
-0.1215316, -0.4898528, -2.284366, 0, 1, 0.682353, 1,
-0.1191897, 0.6736528, -0.295076, 0, 1, 0.6862745, 1,
-0.1181808, -1.245711, -4.223027, 0, 1, 0.6941177, 1,
-0.1180158, 0.6528528, 1.195566, 0, 1, 0.7019608, 1,
-0.114, -1.582791, -3.099234, 0, 1, 0.7058824, 1,
-0.1137012, 0.506847, -0.2723033, 0, 1, 0.7137255, 1,
-0.1120473, -0.3946736, -1.926192, 0, 1, 0.7176471, 1,
-0.1052281, 1.650927, -1.399133, 0, 1, 0.7254902, 1,
-0.1044782, 2.041038, -0.1057829, 0, 1, 0.7294118, 1,
-0.1028243, 1.757124, 0.5511597, 0, 1, 0.7372549, 1,
-0.1026123, 0.977999, -0.7496138, 0, 1, 0.7411765, 1,
-0.102475, -0.6605208, -2.337804, 0, 1, 0.7490196, 1,
-0.1001918, 0.6549184, -0.2377978, 0, 1, 0.7529412, 1,
-0.09952309, 0.4038583, 0.190784, 0, 1, 0.7607843, 1,
-0.09726631, -0.8459712, -1.982703, 0, 1, 0.7647059, 1,
-0.09230213, 1.649854, 0.05273759, 0, 1, 0.772549, 1,
-0.08929914, 0.1369322, -1.080672, 0, 1, 0.7764706, 1,
-0.08521406, -0.8263708, -0.4011106, 0, 1, 0.7843137, 1,
-0.08451481, 1.242686, -0.2808775, 0, 1, 0.7882353, 1,
-0.08397312, 0.2002141, -0.06493603, 0, 1, 0.7960784, 1,
-0.08350034, -0.7330161, -3.671835, 0, 1, 0.8039216, 1,
-0.0832526, 0.4302965, 1.422245, 0, 1, 0.8078431, 1,
-0.07982456, -0.6941739, -1.661273, 0, 1, 0.8156863, 1,
-0.07741247, 1.836278, -2.138551, 0, 1, 0.8196079, 1,
-0.07430614, 0.5033687, 0.9166754, 0, 1, 0.827451, 1,
-0.07333719, 0.7658121, 0.7259573, 0, 1, 0.8313726, 1,
-0.07033352, 0.08227614, -1.947834, 0, 1, 0.8392157, 1,
-0.06936983, 0.8262233, 1.230254, 0, 1, 0.8431373, 1,
-0.06766994, 1.048232, -1.264073, 0, 1, 0.8509804, 1,
-0.06069012, 2.015055, -1.152061, 0, 1, 0.854902, 1,
-0.05555303, 0.8551383, -0.3845694, 0, 1, 0.8627451, 1,
-0.05531874, 0.02920476, -2.981096, 0, 1, 0.8666667, 1,
-0.05248026, -0.07089239, -1.689677, 0, 1, 0.8745098, 1,
-0.05103971, -0.4300703, -3.29177, 0, 1, 0.8784314, 1,
-0.04903753, 2.171706, -0.8783396, 0, 1, 0.8862745, 1,
-0.04288477, -0.9923281, -2.199204, 0, 1, 0.8901961, 1,
-0.04265374, 1.593516, -1.295348, 0, 1, 0.8980392, 1,
-0.04144312, 0.3504623, 0.6356946, 0, 1, 0.9058824, 1,
-0.04107876, 2.124806, 0.1793949, 0, 1, 0.9098039, 1,
-0.03739337, 1.322087, 0.1022421, 0, 1, 0.9176471, 1,
-0.03410515, 0.6333037, -0.7383767, 0, 1, 0.9215686, 1,
-0.03232836, -0.5957649, -3.858462, 0, 1, 0.9294118, 1,
-0.02848598, -0.8154915, -2.712196, 0, 1, 0.9333333, 1,
-0.02121173, -0.8445013, -4.533957, 0, 1, 0.9411765, 1,
-0.02029283, 0.472095, 0.2651085, 0, 1, 0.945098, 1,
-0.009286916, -0.6786592, -4.214817, 0, 1, 0.9529412, 1,
-0.006948994, -0.5470701, -3.206329, 0, 1, 0.9568627, 1,
-0.006604325, -0.4843963, -3.153904, 0, 1, 0.9647059, 1,
-0.005821264, 2.217017, -0.4986361, 0, 1, 0.9686275, 1,
0.007393715, 0.7487683, -0.5843666, 0, 1, 0.9764706, 1,
0.008252362, -0.1895649, 4.375869, 0, 1, 0.9803922, 1,
0.01293585, -0.2429185, 3.269186, 0, 1, 0.9882353, 1,
0.0165695, 0.1447268, -1.048936, 0, 1, 0.9921569, 1,
0.01658089, -0.1830473, 3.590739, 0, 1, 1, 1,
0.01748768, 0.2728901, 0.1253858, 0, 0.9921569, 1, 1,
0.01856391, 0.4944768, 1.991111, 0, 0.9882353, 1, 1,
0.01862574, 1.228858, -0.5219909, 0, 0.9803922, 1, 1,
0.01965903, -0.2113752, 2.695778, 0, 0.9764706, 1, 1,
0.02193354, -0.1736112, 4.180514, 0, 0.9686275, 1, 1,
0.02316477, 1.241501, -1.773899, 0, 0.9647059, 1, 1,
0.02357418, -0.4990101, 1.80333, 0, 0.9568627, 1, 1,
0.02412974, -0.03980066, 3.824398, 0, 0.9529412, 1, 1,
0.02451173, 1.493751, 1.345901, 0, 0.945098, 1, 1,
0.02832831, 1.176895, 0.1366025, 0, 0.9411765, 1, 1,
0.02865786, -0.6690239, 2.336313, 0, 0.9333333, 1, 1,
0.02956933, -0.4647253, 3.401523, 0, 0.9294118, 1, 1,
0.03446363, 0.3605563, 0.9478773, 0, 0.9215686, 1, 1,
0.03743682, 0.3743463, 0.00352071, 0, 0.9176471, 1, 1,
0.03852236, 0.07802678, 1.426813, 0, 0.9098039, 1, 1,
0.04531976, -0.02406661, 1.563895, 0, 0.9058824, 1, 1,
0.04955074, -1.3753, 3.043683, 0, 0.8980392, 1, 1,
0.05273689, 0.971032, 0.05878783, 0, 0.8901961, 1, 1,
0.05869812, -1.465004, 3.164405, 0, 0.8862745, 1, 1,
0.06004165, -0.260577, 2.573071, 0, 0.8784314, 1, 1,
0.06243975, -0.6769212, 1.243245, 0, 0.8745098, 1, 1,
0.06637626, -1.933247, 2.721912, 0, 0.8666667, 1, 1,
0.06788116, 0.4893361, 0.3110409, 0, 0.8627451, 1, 1,
0.06794117, 0.3457817, -0.4523343, 0, 0.854902, 1, 1,
0.07098544, 1.398304, 0.6832349, 0, 0.8509804, 1, 1,
0.07115933, -1.977806, 1.797695, 0, 0.8431373, 1, 1,
0.07195561, -0.2830305, 3.605266, 0, 0.8392157, 1, 1,
0.0727775, 0.02088615, 0.6238417, 0, 0.8313726, 1, 1,
0.07563163, -0.3418018, 3.670886, 0, 0.827451, 1, 1,
0.07567118, -0.6496932, 2.044684, 0, 0.8196079, 1, 1,
0.07698356, 0.5573993, -0.02102228, 0, 0.8156863, 1, 1,
0.07952637, 1.133655, -0.3326967, 0, 0.8078431, 1, 1,
0.07979655, 1.371604, -0.708177, 0, 0.8039216, 1, 1,
0.08392554, -0.4954165, 4.289721, 0, 0.7960784, 1, 1,
0.08570044, 0.3800422, 0.5521902, 0, 0.7882353, 1, 1,
0.08696831, 0.2972254, -0.7433338, 0, 0.7843137, 1, 1,
0.08748558, 0.8883454, -0.3033403, 0, 0.7764706, 1, 1,
0.08907884, 0.2796531, -0.2285769, 0, 0.772549, 1, 1,
0.08991033, 0.2896924, 1.027932, 0, 0.7647059, 1, 1,
0.09054248, -0.5199644, 3.792005, 0, 0.7607843, 1, 1,
0.09315092, -0.5511199, 3.834641, 0, 0.7529412, 1, 1,
0.09572868, 0.2826163, 0.8935342, 0, 0.7490196, 1, 1,
0.10392, 0.6741382, 0.6540442, 0, 0.7411765, 1, 1,
0.1064986, -0.9879944, 4.896147, 0, 0.7372549, 1, 1,
0.1094177, -0.3919811, 1.505805, 0, 0.7294118, 1, 1,
0.1099288, 0.2499722, 1.669691, 0, 0.7254902, 1, 1,
0.1153825, -1.237109, 3.088469, 0, 0.7176471, 1, 1,
0.1160904, 0.9898933, 0.176728, 0, 0.7137255, 1, 1,
0.119158, 0.2265911, -0.235447, 0, 0.7058824, 1, 1,
0.1209956, -1.37439, 2.89223, 0, 0.6980392, 1, 1,
0.1242489, 0.347906, 0.9571134, 0, 0.6941177, 1, 1,
0.1278394, -2.061414, 3.319118, 0, 0.6862745, 1, 1,
0.1318417, 1.649726, 0.1725262, 0, 0.682353, 1, 1,
0.1364065, 0.09878772, -0.725657, 0, 0.6745098, 1, 1,
0.1369373, 1.265623, 1.762784, 0, 0.6705883, 1, 1,
0.1378988, 1.12376, 1.966705, 0, 0.6627451, 1, 1,
0.1379617, 0.06242605, 2.055654, 0, 0.6588235, 1, 1,
0.1414996, 1.774506, -0.3785751, 0, 0.6509804, 1, 1,
0.1424985, -1.837931, 1.980834, 0, 0.6470588, 1, 1,
0.1502641, -0.7617063, 2.748853, 0, 0.6392157, 1, 1,
0.1513931, 0.00128952, 2.155322, 0, 0.6352941, 1, 1,
0.1517117, -0.005663501, 1.637746, 0, 0.627451, 1, 1,
0.1584272, 0.5406668, -0.08303604, 0, 0.6235294, 1, 1,
0.1602625, -0.4433002, 2.592442, 0, 0.6156863, 1, 1,
0.1608521, 0.3711979, 1.595012, 0, 0.6117647, 1, 1,
0.1616613, 0.1198143, -0.1827067, 0, 0.6039216, 1, 1,
0.1644315, -0.2653094, 2.877646, 0, 0.5960785, 1, 1,
0.1685922, 0.5222847, 1.064647, 0, 0.5921569, 1, 1,
0.1695367, 0.81809, -0.6407298, 0, 0.5843138, 1, 1,
0.170135, 0.8034949, 2.855635, 0, 0.5803922, 1, 1,
0.1727236, -0.689876, 2.643344, 0, 0.572549, 1, 1,
0.1775563, -0.1462543, 2.082482, 0, 0.5686275, 1, 1,
0.180283, -0.08415063, 2.342925, 0, 0.5607843, 1, 1,
0.1840975, 0.1270004, 1.918391, 0, 0.5568628, 1, 1,
0.1879465, -0.7270084, 2.270076, 0, 0.5490196, 1, 1,
0.1910182, 0.1733693, -2.073159, 0, 0.5450981, 1, 1,
0.1913854, 0.8059113, -0.1449957, 0, 0.5372549, 1, 1,
0.1935241, 1.09177, 0.9062061, 0, 0.5333334, 1, 1,
0.1964665, 0.09982907, 1.563116, 0, 0.5254902, 1, 1,
0.1971115, -0.5920746, 3.293689, 0, 0.5215687, 1, 1,
0.1997118, -0.5428817, 2.504683, 0, 0.5137255, 1, 1,
0.2003206, 0.2486271, 0.445367, 0, 0.509804, 1, 1,
0.2022932, -0.4521717, 3.210874, 0, 0.5019608, 1, 1,
0.2037191, 0.07267712, 0.3554458, 0, 0.4941176, 1, 1,
0.2064507, -0.1442491, 1.09935, 0, 0.4901961, 1, 1,
0.2081679, -1.165311, 2.336201, 0, 0.4823529, 1, 1,
0.2094141, 0.6377223, -1.000468, 0, 0.4784314, 1, 1,
0.2104874, 0.418603, 0.7324594, 0, 0.4705882, 1, 1,
0.2113038, -1.46206, 1.721619, 0, 0.4666667, 1, 1,
0.2138144, -0.4189216, 2.622843, 0, 0.4588235, 1, 1,
0.2185178, 0.09952119, 1.861922, 0, 0.454902, 1, 1,
0.2222681, -0.0620581, 3.405071, 0, 0.4470588, 1, 1,
0.2223839, -0.8914187, 2.873159, 0, 0.4431373, 1, 1,
0.2231993, -0.01419806, 1.053657, 0, 0.4352941, 1, 1,
0.225367, 2.137741, 0.4760645, 0, 0.4313726, 1, 1,
0.2260845, -0.1027118, 3.161954, 0, 0.4235294, 1, 1,
0.2338114, 0.4272258, 1.472819, 0, 0.4196078, 1, 1,
0.2375578, 0.4160461, -0.8262608, 0, 0.4117647, 1, 1,
0.242398, -0.9931239, 2.803348, 0, 0.4078431, 1, 1,
0.2466002, -0.02492511, 1.113794, 0, 0.4, 1, 1,
0.2493002, -0.04604312, 3.198464, 0, 0.3921569, 1, 1,
0.2497176, -0.6417062, 2.896266, 0, 0.3882353, 1, 1,
0.2530718, 0.1675454, 0.6539733, 0, 0.3803922, 1, 1,
0.2635622, 0.6090545, -1.652943, 0, 0.3764706, 1, 1,
0.2698558, 0.6068091, -0.6946673, 0, 0.3686275, 1, 1,
0.2730466, -0.5491563, 2.038388, 0, 0.3647059, 1, 1,
0.2767598, -0.9068788, 4.592389, 0, 0.3568628, 1, 1,
0.2811107, 0.4393818, 1.263985, 0, 0.3529412, 1, 1,
0.286709, -0.812887, 2.787691, 0, 0.345098, 1, 1,
0.2870629, -0.6480919, 3.518033, 0, 0.3411765, 1, 1,
0.2927787, -0.09211892, 1.464726, 0, 0.3333333, 1, 1,
0.3007478, 0.8874866, 0.007565139, 0, 0.3294118, 1, 1,
0.3074964, -0.2364385, 3.129177, 0, 0.3215686, 1, 1,
0.3097083, 0.7469181, -2.430182, 0, 0.3176471, 1, 1,
0.3097995, -0.1109562, 1.867806, 0, 0.3098039, 1, 1,
0.3098443, -0.3359359, 4.284259, 0, 0.3058824, 1, 1,
0.3119524, -1.128749, 2.646736, 0, 0.2980392, 1, 1,
0.3140386, 1.240093, 1.087165, 0, 0.2901961, 1, 1,
0.3187596, 0.9320726, 1.774025, 0, 0.2862745, 1, 1,
0.3192242, 0.8793189, -0.0389234, 0, 0.2784314, 1, 1,
0.32098, 0.1603777, 1.504437, 0, 0.2745098, 1, 1,
0.3240429, -0.04660521, 2.010473, 0, 0.2666667, 1, 1,
0.3245162, 1.663968, 0.5285788, 0, 0.2627451, 1, 1,
0.3263167, 0.4029517, 1.079594, 0, 0.254902, 1, 1,
0.3269437, 0.3614282, 1.40709, 0, 0.2509804, 1, 1,
0.3274297, 0.8998668, 1.857812, 0, 0.2431373, 1, 1,
0.3420134, 1.969403, 1.433552, 0, 0.2392157, 1, 1,
0.3441805, 0.1763862, 0.2841106, 0, 0.2313726, 1, 1,
0.3539942, 0.3036472, 0.2387063, 0, 0.227451, 1, 1,
0.3552227, -0.6613007, 2.725946, 0, 0.2196078, 1, 1,
0.3570617, -0.8868283, 3.475621, 0, 0.2156863, 1, 1,
0.3576156, -1.468328, 2.68054, 0, 0.2078431, 1, 1,
0.3599873, -0.1449611, 2.189776, 0, 0.2039216, 1, 1,
0.3661322, 0.3223238, -0.8107774, 0, 0.1960784, 1, 1,
0.3676178, 0.7511969, 0.1822916, 0, 0.1882353, 1, 1,
0.36917, 1.135859, -0.9839811, 0, 0.1843137, 1, 1,
0.3719787, 1.022203, -0.9491701, 0, 0.1764706, 1, 1,
0.3827685, -0.5331567, 4.094717, 0, 0.172549, 1, 1,
0.3865011, -1.439255, 1.455923, 0, 0.1647059, 1, 1,
0.3871829, -0.2549302, 1.701094, 0, 0.1607843, 1, 1,
0.3991701, -1.532964, 1.925711, 0, 0.1529412, 1, 1,
0.3996795, -0.2152438, -0.7394605, 0, 0.1490196, 1, 1,
0.4021229, -0.05335829, 1.097353, 0, 0.1411765, 1, 1,
0.4053334, 1.074108, 0.5517232, 0, 0.1372549, 1, 1,
0.406101, 0.2677452, 3.283698, 0, 0.1294118, 1, 1,
0.4078441, 0.1464259, 1.809091, 0, 0.1254902, 1, 1,
0.4098766, 0.6792194, 0.5629862, 0, 0.1176471, 1, 1,
0.4120813, 0.5987023, -0.5438438, 0, 0.1137255, 1, 1,
0.4125114, 0.07909235, -0.5920844, 0, 0.1058824, 1, 1,
0.4125371, -0.6120498, 1.260059, 0, 0.09803922, 1, 1,
0.413432, 0.1672793, 0.2916492, 0, 0.09411765, 1, 1,
0.4138703, 2.155113, 0.3473103, 0, 0.08627451, 1, 1,
0.4175231, -0.4388586, 3.598035, 0, 0.08235294, 1, 1,
0.4187633, 0.6146383, 1.561134, 0, 0.07450981, 1, 1,
0.4203644, -0.2081021, 1.988995, 0, 0.07058824, 1, 1,
0.4228592, -1.439588, 3.565778, 0, 0.0627451, 1, 1,
0.4257732, -0.3447107, 1.357131, 0, 0.05882353, 1, 1,
0.4278259, 1.059068, 0.9723671, 0, 0.05098039, 1, 1,
0.4348463, 0.3491836, 1.839761, 0, 0.04705882, 1, 1,
0.4375675, -1.196949, 3.311552, 0, 0.03921569, 1, 1,
0.4377141, 1.646812, 0.7394177, 0, 0.03529412, 1, 1,
0.4381077, 1.066981, 0.4261027, 0, 0.02745098, 1, 1,
0.4412774, 1.568108, 0.4438898, 0, 0.02352941, 1, 1,
0.4423075, 1.525812, 0.9810309, 0, 0.01568628, 1, 1,
0.443232, 1.090879, -0.1160864, 0, 0.01176471, 1, 1,
0.4440156, -1.446837, 2.231384, 0, 0.003921569, 1, 1,
0.44421, -0.1583816, 3.931545, 0.003921569, 0, 1, 1,
0.4452751, -1.309343, 2.53224, 0.007843138, 0, 1, 1,
0.4456135, -0.4464933, 3.059428, 0.01568628, 0, 1, 1,
0.4508961, -1.283409, 1.804317, 0.01960784, 0, 1, 1,
0.4523991, -0.1653769, 1.692032, 0.02745098, 0, 1, 1,
0.4531737, -1.011255, 4.307801, 0.03137255, 0, 1, 1,
0.4534545, -0.377476, 1.807617, 0.03921569, 0, 1, 1,
0.4604147, -0.3761342, 5.333563, 0.04313726, 0, 1, 1,
0.4651411, -0.4858558, 2.519384, 0.05098039, 0, 1, 1,
0.4663733, -1.365773, 3.901112, 0.05490196, 0, 1, 1,
0.4667219, -0.4645744, 3.627934, 0.0627451, 0, 1, 1,
0.467057, -0.04705897, 1.790043, 0.06666667, 0, 1, 1,
0.4712434, -1.449854, 1.193549, 0.07450981, 0, 1, 1,
0.4782916, 1.481244, 1.111757, 0.07843138, 0, 1, 1,
0.4808432, -1.461782, 3.070851, 0.08627451, 0, 1, 1,
0.4824616, 0.192744, 2.055822, 0.09019608, 0, 1, 1,
0.4826281, 0.7925631, -1.056475, 0.09803922, 0, 1, 1,
0.4837793, -0.4194429, 2.560925, 0.1058824, 0, 1, 1,
0.4888171, -0.2523998, 1.378936, 0.1098039, 0, 1, 1,
0.4923112, 0.6706892, -0.1991307, 0.1176471, 0, 1, 1,
0.4923477, 1.634714, -1.932484, 0.1215686, 0, 1, 1,
0.492851, 0.7113462, -1.688605, 0.1294118, 0, 1, 1,
0.4946475, -1.378854, 4.13181, 0.1333333, 0, 1, 1,
0.4973785, 0.8194358, 0.1654442, 0.1411765, 0, 1, 1,
0.5008754, 0.1627601, 0.6539608, 0.145098, 0, 1, 1,
0.5048149, -0.9651769, 3.350564, 0.1529412, 0, 1, 1,
0.5130824, 0.9310484, -0.1184051, 0.1568628, 0, 1, 1,
0.5170157, 0.8180028, -0.3711765, 0.1647059, 0, 1, 1,
0.5231296, -1.080219, 1.222985, 0.1686275, 0, 1, 1,
0.5233477, -1.561505, 1.084776, 0.1764706, 0, 1, 1,
0.5234339, -1.315478, 2.439282, 0.1803922, 0, 1, 1,
0.536879, 0.8238688, 0.591725, 0.1882353, 0, 1, 1,
0.5380188, -1.520602, 2.462548, 0.1921569, 0, 1, 1,
0.5381864, 0.2582934, 1.778945, 0.2, 0, 1, 1,
0.5399725, 0.3378041, 1.878833, 0.2078431, 0, 1, 1,
0.5426241, 0.1430717, 0.7886744, 0.2117647, 0, 1, 1,
0.5428427, 0.1216164, 0.7633353, 0.2196078, 0, 1, 1,
0.549626, 0.2352272, 0.4467532, 0.2235294, 0, 1, 1,
0.552615, 0.2013821, 2.29164, 0.2313726, 0, 1, 1,
0.5564712, -0.3277567, 3.873824, 0.2352941, 0, 1, 1,
0.5600016, 1.30308, 0.8152784, 0.2431373, 0, 1, 1,
0.560145, 0.6613872, -1.872209, 0.2470588, 0, 1, 1,
0.5603551, 0.8831761, 2.036601, 0.254902, 0, 1, 1,
0.5612744, -0.8447074, 3.213588, 0.2588235, 0, 1, 1,
0.5620458, 0.4051083, 0.1626414, 0.2666667, 0, 1, 1,
0.5632286, -1.475632, 1.550828, 0.2705882, 0, 1, 1,
0.5665793, 0.2205347, 0.6764399, 0.2784314, 0, 1, 1,
0.5667166, -0.006290383, 0.8442907, 0.282353, 0, 1, 1,
0.5683367, -0.7726299, 2.155862, 0.2901961, 0, 1, 1,
0.5738432, -1.638227, 3.567423, 0.2941177, 0, 1, 1,
0.5740469, 0.621063, 0.3059573, 0.3019608, 0, 1, 1,
0.5772692, -0.8309003, 1.580227, 0.3098039, 0, 1, 1,
0.5808961, -0.7582355, 2.019942, 0.3137255, 0, 1, 1,
0.5861969, -0.3219084, 3.136834, 0.3215686, 0, 1, 1,
0.5866593, 0.2826721, 1.576412, 0.3254902, 0, 1, 1,
0.5898751, 1.155347, -0.636471, 0.3333333, 0, 1, 1,
0.5900907, 0.1114369, 3.714993, 0.3372549, 0, 1, 1,
0.5928153, -0.6215374, 2.952877, 0.345098, 0, 1, 1,
0.5930957, 0.6851029, 0.5819573, 0.3490196, 0, 1, 1,
0.5941197, 1.195988, -0.2027944, 0.3568628, 0, 1, 1,
0.6030904, 1.663958, 0.8288468, 0.3607843, 0, 1, 1,
0.6046699, 1.153429, -1.923947, 0.3686275, 0, 1, 1,
0.6067904, 0.4716834, 1.624851, 0.372549, 0, 1, 1,
0.6086023, 2.779578, -0.2874565, 0.3803922, 0, 1, 1,
0.6108506, 1.071198, 0.729175, 0.3843137, 0, 1, 1,
0.6115591, -0.7666447, 3.030237, 0.3921569, 0, 1, 1,
0.6226639, 1.379932, 1.89058, 0.3960784, 0, 1, 1,
0.6239104, 0.2142266, 4.03351, 0.4039216, 0, 1, 1,
0.6263062, 0.5146566, 2.651228, 0.4117647, 0, 1, 1,
0.6290982, 1.785926, -1.167533, 0.4156863, 0, 1, 1,
0.6327566, -0.6256369, 3.718153, 0.4235294, 0, 1, 1,
0.6355225, 0.4442996, 1.245904, 0.427451, 0, 1, 1,
0.6362615, -0.6640552, 3.823981, 0.4352941, 0, 1, 1,
0.6413835, -1.173997, 3.165306, 0.4392157, 0, 1, 1,
0.6424602, 2.409261, -1.020207, 0.4470588, 0, 1, 1,
0.6444829, -1.572515, 3.458656, 0.4509804, 0, 1, 1,
0.6452181, -1.132757, 3.028492, 0.4588235, 0, 1, 1,
0.6482092, -1.65668, 1.762332, 0.4627451, 0, 1, 1,
0.653763, 0.06775638, 0.3751497, 0.4705882, 0, 1, 1,
0.6585779, 0.5108858, 2.531143, 0.4745098, 0, 1, 1,
0.6610613, 2.376966, -0.2188427, 0.4823529, 0, 1, 1,
0.6643846, -0.9726213, 2.227601, 0.4862745, 0, 1, 1,
0.6669724, 0.6924651, -0.6556749, 0.4941176, 0, 1, 1,
0.6688319, 0.02238244, 1.522491, 0.5019608, 0, 1, 1,
0.6736347, -0.1220452, 1.207813, 0.5058824, 0, 1, 1,
0.6745382, 0.4600411, -0.1599066, 0.5137255, 0, 1, 1,
0.6753443, 1.11652, 0.03320698, 0.5176471, 0, 1, 1,
0.6761074, 0.05001242, 0.07862794, 0.5254902, 0, 1, 1,
0.6771407, 1.903942, 1.029664, 0.5294118, 0, 1, 1,
0.6781572, 0.8625838, 1.723322, 0.5372549, 0, 1, 1,
0.6808643, -0.1680697, 1.425748, 0.5411765, 0, 1, 1,
0.6855334, -0.7492692, 2.419599, 0.5490196, 0, 1, 1,
0.6881696, -1.626789, 3.029543, 0.5529412, 0, 1, 1,
0.692673, -0.6465005, 3.171245, 0.5607843, 0, 1, 1,
0.6999121, 0.02935886, 0.2119772, 0.5647059, 0, 1, 1,
0.7004967, 1.432584, -0.829702, 0.572549, 0, 1, 1,
0.7018557, 0.5933808, 1.497285, 0.5764706, 0, 1, 1,
0.7119631, 0.0217654, 0.02700339, 0.5843138, 0, 1, 1,
0.71572, 1.89245, 1.047863, 0.5882353, 0, 1, 1,
0.7241893, 0.2174047, 1.066253, 0.5960785, 0, 1, 1,
0.7267888, 1.296015, 0.1105051, 0.6039216, 0, 1, 1,
0.731509, -1.786657, 1.299347, 0.6078432, 0, 1, 1,
0.73153, 1.629385, 0.1369728, 0.6156863, 0, 1, 1,
0.739472, 0.4785015, 1.507461, 0.6196079, 0, 1, 1,
0.7418117, 0.822197, 1.01071, 0.627451, 0, 1, 1,
0.7461975, 0.8195304, 1.944093, 0.6313726, 0, 1, 1,
0.7466848, -0.5284646, 1.718359, 0.6392157, 0, 1, 1,
0.7496222, 0.376489, 1.248007, 0.6431373, 0, 1, 1,
0.7508092, 1.659606, 1.519395, 0.6509804, 0, 1, 1,
0.7533122, 1.239009, -0.3937991, 0.654902, 0, 1, 1,
0.7538397, 0.006746608, -0.1547076, 0.6627451, 0, 1, 1,
0.7546052, 1.741544, 0.1934193, 0.6666667, 0, 1, 1,
0.7576351, 0.6787087, 1.157452, 0.6745098, 0, 1, 1,
0.7576678, -1.854117, 2.064736, 0.6784314, 0, 1, 1,
0.7614857, 1.609498, -0.1613986, 0.6862745, 0, 1, 1,
0.7627825, -0.8628314, 3.337034, 0.6901961, 0, 1, 1,
0.7630249, 0.8780234, 0.7917795, 0.6980392, 0, 1, 1,
0.7633902, 0.6996146, 2.257732, 0.7058824, 0, 1, 1,
0.7676806, -0.01662704, 1.117055, 0.7098039, 0, 1, 1,
0.7681274, 0.1394809, 0.7540227, 0.7176471, 0, 1, 1,
0.7716947, 0.003693242, 1.870027, 0.7215686, 0, 1, 1,
0.7780942, 0.01367089, 3.26617, 0.7294118, 0, 1, 1,
0.7812539, 0.1104402, 2.953732, 0.7333333, 0, 1, 1,
0.7812542, -0.8514761, 3.075365, 0.7411765, 0, 1, 1,
0.7867244, 0.8558756, 0.3827698, 0.7450981, 0, 1, 1,
0.7870786, -0.469043, 1.526962, 0.7529412, 0, 1, 1,
0.7997732, 0.7603151, 0.7569411, 0.7568628, 0, 1, 1,
0.8044369, -0.237233, 2.049834, 0.7647059, 0, 1, 1,
0.8070638, 1.352167, -1.501794, 0.7686275, 0, 1, 1,
0.8084337, -1.16018, 4.120487, 0.7764706, 0, 1, 1,
0.813255, -0.6320066, 2.370092, 0.7803922, 0, 1, 1,
0.8165042, -0.6291403, 1.622049, 0.7882353, 0, 1, 1,
0.8165898, 0.2805573, 2.40306, 0.7921569, 0, 1, 1,
0.8196822, -0.2674409, 2.801528, 0.8, 0, 1, 1,
0.8199486, 1.044492, 1.842193, 0.8078431, 0, 1, 1,
0.8268045, -0.2238324, 2.664742, 0.8117647, 0, 1, 1,
0.8286982, -0.04637605, 1.871322, 0.8196079, 0, 1, 1,
0.8309768, 1.169532, 1.337158, 0.8235294, 0, 1, 1,
0.8469661, 1.431337, 1.000144, 0.8313726, 0, 1, 1,
0.8746643, 0.2229891, 2.179214, 0.8352941, 0, 1, 1,
0.8813196, 0.00978619, 0.1313848, 0.8431373, 0, 1, 1,
0.881804, -1.68344, 2.394996, 0.8470588, 0, 1, 1,
0.8929498, -0.4329503, 0.9735463, 0.854902, 0, 1, 1,
0.8939527, -0.6192937, 1.229611, 0.8588235, 0, 1, 1,
0.8965641, -0.1810489, 3.491639, 0.8666667, 0, 1, 1,
0.9097352, 0.1514829, 1.03723, 0.8705882, 0, 1, 1,
0.9138454, 0.4020416, 0.2497894, 0.8784314, 0, 1, 1,
0.914587, 0.7077848, 1.767165, 0.8823529, 0, 1, 1,
0.9148386, -0.5642837, 1.82126, 0.8901961, 0, 1, 1,
0.9161826, -1.202311, 3.751693, 0.8941177, 0, 1, 1,
0.9182253, -0.6490039, 2.561893, 0.9019608, 0, 1, 1,
0.9222398, 0.3720953, 2.1436, 0.9098039, 0, 1, 1,
0.9229551, 0.5706676, 0.6537817, 0.9137255, 0, 1, 1,
0.9245183, -1.384887, 0.9461804, 0.9215686, 0, 1, 1,
0.9245835, 0.6962327, 1.279039, 0.9254902, 0, 1, 1,
0.9274737, -0.5733126, 2.656476, 0.9333333, 0, 1, 1,
0.9287587, -0.6458192, 4.025821, 0.9372549, 0, 1, 1,
0.9301123, -0.6371824, 1.337652, 0.945098, 0, 1, 1,
0.9315453, 0.1405013, 0.2725749, 0.9490196, 0, 1, 1,
0.9384205, -0.6903173, 2.163111, 0.9568627, 0, 1, 1,
0.9423237, -0.1508955, 0.6180401, 0.9607843, 0, 1, 1,
0.9432249, 0.145762, 2.60547, 0.9686275, 0, 1, 1,
0.9523453, 0.4074841, 1.164701, 0.972549, 0, 1, 1,
0.9561081, 0.2431281, 0.1989942, 0.9803922, 0, 1, 1,
0.9608362, -0.01267413, 2.081228, 0.9843137, 0, 1, 1,
0.965551, 0.4205794, 0.6192324, 0.9921569, 0, 1, 1,
0.9668314, -0.1719573, 1.538217, 0.9960784, 0, 1, 1,
0.9671052, 1.220666, -0.06163501, 1, 0, 0.9960784, 1,
0.9683835, -1.614269, 1.150824, 1, 0, 0.9882353, 1,
0.977974, -1.196618, 1.698937, 1, 0, 0.9843137, 1,
0.9795939, 1.603457, -0.4433137, 1, 0, 0.9764706, 1,
0.9811074, 1.618994, 0.6075816, 1, 0, 0.972549, 1,
0.9934456, 1.233403, -0.9757612, 1, 0, 0.9647059, 1,
0.9973035, -1.077054, 2.337431, 1, 0, 0.9607843, 1,
1.006109, 0.5099587, -0.8646936, 1, 0, 0.9529412, 1,
1.006839, 1.859274, 1.241224, 1, 0, 0.9490196, 1,
1.010667, -0.3756435, 3.023101, 1, 0, 0.9411765, 1,
1.014099, 1.468683, -0.5862149, 1, 0, 0.9372549, 1,
1.015233, -0.04679811, 2.396378, 1, 0, 0.9294118, 1,
1.019028, 0.009628124, 1.724673, 1, 0, 0.9254902, 1,
1.032158, 0.06422178, 1.935977, 1, 0, 0.9176471, 1,
1.040272, 0.4936935, 1.023444, 1, 0, 0.9137255, 1,
1.040919, -0.6388183, 1.567971, 1, 0, 0.9058824, 1,
1.041871, 0.8765716, 1.589797, 1, 0, 0.9019608, 1,
1.042993, -0.7154305, 3.007655, 1, 0, 0.8941177, 1,
1.043255, -0.6801051, 3.928684, 1, 0, 0.8862745, 1,
1.047905, 0.4644385, 1.889316, 1, 0, 0.8823529, 1,
1.052676, -0.480209, 1.242199, 1, 0, 0.8745098, 1,
1.058567, 1.680738, 2.62175, 1, 0, 0.8705882, 1,
1.066357, 1.193358, 0.8505806, 1, 0, 0.8627451, 1,
1.070392, -0.5513584, 3.142084, 1, 0, 0.8588235, 1,
1.089186, 0.4968013, 0.2955725, 1, 0, 0.8509804, 1,
1.090186, 0.3965043, 0.6994252, 1, 0, 0.8470588, 1,
1.109079, -0.8182904, 2.913084, 1, 0, 0.8392157, 1,
1.114227, -0.1726259, 1.458268, 1, 0, 0.8352941, 1,
1.114671, 0.2037801, -1.339409, 1, 0, 0.827451, 1,
1.130958, 0.004862268, 2.950471, 1, 0, 0.8235294, 1,
1.149048, 0.4280884, 1.94393, 1, 0, 0.8156863, 1,
1.152558, 0.220345, 2.594425, 1, 0, 0.8117647, 1,
1.152864, -1.70208, 2.564905, 1, 0, 0.8039216, 1,
1.155946, 0.6174622, 0.1997345, 1, 0, 0.7960784, 1,
1.162061, 0.308825, 0.05335707, 1, 0, 0.7921569, 1,
1.164991, -1.162407, 2.987741, 1, 0, 0.7843137, 1,
1.165492, 0.3631378, 2.609367, 1, 0, 0.7803922, 1,
1.17113, -0.9941224, 1.619542, 1, 0, 0.772549, 1,
1.176944, -0.8402522, 3.538663, 1, 0, 0.7686275, 1,
1.178264, 1.050597, 0.7019941, 1, 0, 0.7607843, 1,
1.178983, 0.88618, -0.3544056, 1, 0, 0.7568628, 1,
1.179764, 1.521095, 0.9000539, 1, 0, 0.7490196, 1,
1.181725, -1.166762, 4.138695, 1, 0, 0.7450981, 1,
1.184799, 1.154585, 0.3680856, 1, 0, 0.7372549, 1,
1.192587, -1.034828, 3.685333, 1, 0, 0.7333333, 1,
1.193157, 0.4151133, 1.055086, 1, 0, 0.7254902, 1,
1.201145, -0.3386445, 2.420626, 1, 0, 0.7215686, 1,
1.2049, 0.3974486, 1.431059, 1, 0, 0.7137255, 1,
1.211744, 0.2635226, 3.709322, 1, 0, 0.7098039, 1,
1.217112, 0.353842, 1.160492, 1, 0, 0.7019608, 1,
1.219517, -1.598229, 2.471408, 1, 0, 0.6941177, 1,
1.225994, -1.102873, 4.371924, 1, 0, 0.6901961, 1,
1.226989, 0.6313319, 1.752664, 1, 0, 0.682353, 1,
1.228062, 0.07039318, 1.053901, 1, 0, 0.6784314, 1,
1.231357, -0.40562, 3.677648, 1, 0, 0.6705883, 1,
1.236057, 0.554525, 0.2091766, 1, 0, 0.6666667, 1,
1.236544, 1.652068, 0.3420762, 1, 0, 0.6588235, 1,
1.240293, 1.465513, 0.03527412, 1, 0, 0.654902, 1,
1.24408, 1.8403, 0.8206987, 1, 0, 0.6470588, 1,
1.245112, 0.3067171, 0.2679432, 1, 0, 0.6431373, 1,
1.255223, 0.08574123, 1.173151, 1, 0, 0.6352941, 1,
1.256806, -0.298948, 2.394841, 1, 0, 0.6313726, 1,
1.257612, 1.239142, -1.369567, 1, 0, 0.6235294, 1,
1.262848, -0.1182902, 2.702214, 1, 0, 0.6196079, 1,
1.265966, -1.246277, 0.8363109, 1, 0, 0.6117647, 1,
1.266763, 1.044779, 1.866583, 1, 0, 0.6078432, 1,
1.267931, -0.1987379, 2.530896, 1, 0, 0.6, 1,
1.271159, 1.717122, 1.801629, 1, 0, 0.5921569, 1,
1.274613, 0.9453098, -0.4964868, 1, 0, 0.5882353, 1,
1.281579, 0.5529533, 1.387408, 1, 0, 0.5803922, 1,
1.286619, -0.8779274, 2.198548, 1, 0, 0.5764706, 1,
1.308373, -0.4881679, 2.666655, 1, 0, 0.5686275, 1,
1.309706, 1.099677, 0.002227869, 1, 0, 0.5647059, 1,
1.312859, -0.4864956, 3.530094, 1, 0, 0.5568628, 1,
1.313062, -0.1292566, 1.297169, 1, 0, 0.5529412, 1,
1.313072, -1.346319, 2.70038, 1, 0, 0.5450981, 1,
1.314179, -0.211827, -0.2030665, 1, 0, 0.5411765, 1,
1.319665, 1.468824, 1.56475, 1, 0, 0.5333334, 1,
1.324822, -0.7682914, 1.420734, 1, 0, 0.5294118, 1,
1.329448, 0.3289645, 1.813141, 1, 0, 0.5215687, 1,
1.335527, 0.641248, 0.4822399, 1, 0, 0.5176471, 1,
1.337462, -0.1495353, 2.977111, 1, 0, 0.509804, 1,
1.339502, 1.436522, 1.173719, 1, 0, 0.5058824, 1,
1.344624, 0.4655889, 1.026406, 1, 0, 0.4980392, 1,
1.387495, 0.9349856, 1.412631, 1, 0, 0.4901961, 1,
1.394616, 0.5406592, 1.082232, 1, 0, 0.4862745, 1,
1.397738, -0.1242563, 1.428033, 1, 0, 0.4784314, 1,
1.402409, -0.08183218, 1.859284, 1, 0, 0.4745098, 1,
1.412415, 0.7003474, 1.15853, 1, 0, 0.4666667, 1,
1.41537, 1.391635, 0.8452212, 1, 0, 0.4627451, 1,
1.427739, -2.620955, 3.01543, 1, 0, 0.454902, 1,
1.431993, -0.269957, 1.915432, 1, 0, 0.4509804, 1,
1.439986, 0.8037705, -0.1496682, 1, 0, 0.4431373, 1,
1.443873, 0.8501116, 0.6040483, 1, 0, 0.4392157, 1,
1.44785, -0.7823758, 2.593666, 1, 0, 0.4313726, 1,
1.460671, -0.3992215, 0.5122879, 1, 0, 0.427451, 1,
1.498281, 0.607015, 3.460479, 1, 0, 0.4196078, 1,
1.523335, -0.263029, 0.781956, 1, 0, 0.4156863, 1,
1.5243, 0.691, 2.532325, 1, 0, 0.4078431, 1,
1.539274, -0.0714485, 2.062429, 1, 0, 0.4039216, 1,
1.543038, -0.6289591, 2.913117, 1, 0, 0.3960784, 1,
1.543608, 0.5893607, 2.251473, 1, 0, 0.3882353, 1,
1.559154, 0.8800393, 0.5785715, 1, 0, 0.3843137, 1,
1.581983, 0.6599616, 0.1374792, 1, 0, 0.3764706, 1,
1.593236, 0.2092075, 0.8491536, 1, 0, 0.372549, 1,
1.605403, 1.68942, 2.336664, 1, 0, 0.3647059, 1,
1.606125, -0.290405, 0.6471291, 1, 0, 0.3607843, 1,
1.608882, 0.6894562, 2.772407, 1, 0, 0.3529412, 1,
1.623077, 0.2305037, 1.801732, 1, 0, 0.3490196, 1,
1.632381, 1.382712, 0.5795532, 1, 0, 0.3411765, 1,
1.640251, -1.107528, 1.562732, 1, 0, 0.3372549, 1,
1.64528, 0.2033329, 0.01545789, 1, 0, 0.3294118, 1,
1.661908, -0.2541305, 1.439273, 1, 0, 0.3254902, 1,
1.685382, 2.315402, 1.908719, 1, 0, 0.3176471, 1,
1.690437, -0.9203823, 2.061582, 1, 0, 0.3137255, 1,
1.739804, -1.190929, 2.488211, 1, 0, 0.3058824, 1,
1.741721, 0.1410895, 1.983947, 1, 0, 0.2980392, 1,
1.750996, -0.02536858, 1.826695, 1, 0, 0.2941177, 1,
1.756396, 0.3756101, 2.421064, 1, 0, 0.2862745, 1,
1.759976, -0.4301426, 0.8341103, 1, 0, 0.282353, 1,
1.773848, 0.9926963, 1.064093, 1, 0, 0.2745098, 1,
1.775094, 0.6378388, 0.9516413, 1, 0, 0.2705882, 1,
1.792131, 0.8550375, 1.06264, 1, 0, 0.2627451, 1,
1.793369, 0.7898928, 0.5027949, 1, 0, 0.2588235, 1,
1.807382, -0.6528201, 1.101113, 1, 0, 0.2509804, 1,
1.811302, 1.133301, 0.3985551, 1, 0, 0.2470588, 1,
1.812193, 1.385285, 1.182199, 1, 0, 0.2392157, 1,
1.812375, -0.3099309, -0.2783923, 1, 0, 0.2352941, 1,
1.821743, 0.01938734, 1.478247, 1, 0, 0.227451, 1,
1.821758, 0.01011428, 3.917872, 1, 0, 0.2235294, 1,
1.843678, 0.333007, 0.8150426, 1, 0, 0.2156863, 1,
1.853797, 1.253438, 2.332786, 1, 0, 0.2117647, 1,
1.859248, 1.439437, 2.048493, 1, 0, 0.2039216, 1,
1.859801, -0.9399296, 3.666514, 1, 0, 0.1960784, 1,
1.891839, 1.181974, 1.551751, 1, 0, 0.1921569, 1,
1.906242, 0.4115459, -0.3927146, 1, 0, 0.1843137, 1,
1.906695, 1.475708, 1.862282, 1, 0, 0.1803922, 1,
1.914692, -0.07563324, 0.06192043, 1, 0, 0.172549, 1,
1.965327, -0.05198549, 1.754058, 1, 0, 0.1686275, 1,
1.995332, -0.7844976, 1.708032, 1, 0, 0.1607843, 1,
2.057297, 0.08398591, 1.061907, 1, 0, 0.1568628, 1,
2.061532, -0.606218, 0.4280029, 1, 0, 0.1490196, 1,
2.062025, -0.9868779, 1.784672, 1, 0, 0.145098, 1,
2.103938, 1.238869, 1.229526, 1, 0, 0.1372549, 1,
2.107168, 0.3433416, 2.025952, 1, 0, 0.1333333, 1,
2.184221, -0.6145801, 1.976412, 1, 0, 0.1254902, 1,
2.189341, -0.9562246, 2.125077, 1, 0, 0.1215686, 1,
2.200249, 0.1557106, 2.144326, 1, 0, 0.1137255, 1,
2.214486, -2.546385, 1.960267, 1, 0, 0.1098039, 1,
2.251852, -1.118803, 2.7081, 1, 0, 0.1019608, 1,
2.265585, 0.0127441, -0.8600355, 1, 0, 0.09411765, 1,
2.269165, 1.418131, 0.01818315, 1, 0, 0.09019608, 1,
2.27381, 0.06895834, -0.5666082, 1, 0, 0.08235294, 1,
2.284848, -1.046292, 2.21387, 1, 0, 0.07843138, 1,
2.31324, 1.421811, 2.23653, 1, 0, 0.07058824, 1,
2.33918, -0.7678343, 0.7071763, 1, 0, 0.06666667, 1,
2.357287, 2.757139, 0.8218307, 1, 0, 0.05882353, 1,
2.366622, 2.038825, -0.3280017, 1, 0, 0.05490196, 1,
2.408912, 0.6431559, 2.82127, 1, 0, 0.04705882, 1,
2.409856, -0.2220892, 0.7943845, 1, 0, 0.04313726, 1,
2.436739, -0.4212759, 1.294266, 1, 0, 0.03529412, 1,
2.439797, -0.166786, 0.8294103, 1, 0, 0.03137255, 1,
2.444689, 0.7056303, 0.7350016, 1, 0, 0.02352941, 1,
2.681737, -1.282431, 2.201651, 1, 0, 0.01960784, 1,
2.726908, -0.7641555, 2.238029, 1, 0, 0.01176471, 1,
3.225854, -1.373105, 2.987737, 1, 0, 0.007843138, 1
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
-0.0341928, -3.747734, -7.157682, 0, -0.5, 0.5, 0.5,
-0.0341928, -3.747734, -7.157682, 1, -0.5, 0.5, 0.5,
-0.0341928, -3.747734, -7.157682, 1, 1.5, 0.5, 0.5,
-0.0341928, -3.747734, -7.157682, 0, 1.5, 0.5, 0.5
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
-4.399395, 0.04820323, -7.157682, 0, -0.5, 0.5, 0.5,
-4.399395, 0.04820323, -7.157682, 1, -0.5, 0.5, 0.5,
-4.399395, 0.04820323, -7.157682, 1, 1.5, 0.5, 0.5,
-4.399395, 0.04820323, -7.157682, 0, 1.5, 0.5, 0.5
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
-4.399395, -3.747734, -0.00685811, 0, -0.5, 0.5, 0.5,
-4.399395, -3.747734, -0.00685811, 1, -0.5, 0.5, 0.5,
-4.399395, -3.747734, -0.00685811, 1, 1.5, 0.5, 0.5,
-4.399395, -3.747734, -0.00685811, 0, 1.5, 0.5, 0.5
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
-3, -2.871748, -5.507492,
3, -2.871748, -5.507492,
-3, -2.871748, -5.507492,
-3, -3.017746, -5.782524,
-2, -2.871748, -5.507492,
-2, -3.017746, -5.782524,
-1, -2.871748, -5.507492,
-1, -3.017746, -5.782524,
0, -2.871748, -5.507492,
0, -3.017746, -5.782524,
1, -2.871748, -5.507492,
1, -3.017746, -5.782524,
2, -2.871748, -5.507492,
2, -3.017746, -5.782524,
3, -2.871748, -5.507492,
3, -3.017746, -5.782524
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
-3, -3.309741, -6.332587, 0, -0.5, 0.5, 0.5,
-3, -3.309741, -6.332587, 1, -0.5, 0.5, 0.5,
-3, -3.309741, -6.332587, 1, 1.5, 0.5, 0.5,
-3, -3.309741, -6.332587, 0, 1.5, 0.5, 0.5,
-2, -3.309741, -6.332587, 0, -0.5, 0.5, 0.5,
-2, -3.309741, -6.332587, 1, -0.5, 0.5, 0.5,
-2, -3.309741, -6.332587, 1, 1.5, 0.5, 0.5,
-2, -3.309741, -6.332587, 0, 1.5, 0.5, 0.5,
-1, -3.309741, -6.332587, 0, -0.5, 0.5, 0.5,
-1, -3.309741, -6.332587, 1, -0.5, 0.5, 0.5,
-1, -3.309741, -6.332587, 1, 1.5, 0.5, 0.5,
-1, -3.309741, -6.332587, 0, 1.5, 0.5, 0.5,
0, -3.309741, -6.332587, 0, -0.5, 0.5, 0.5,
0, -3.309741, -6.332587, 1, -0.5, 0.5, 0.5,
0, -3.309741, -6.332587, 1, 1.5, 0.5, 0.5,
0, -3.309741, -6.332587, 0, 1.5, 0.5, 0.5,
1, -3.309741, -6.332587, 0, -0.5, 0.5, 0.5,
1, -3.309741, -6.332587, 1, -0.5, 0.5, 0.5,
1, -3.309741, -6.332587, 1, 1.5, 0.5, 0.5,
1, -3.309741, -6.332587, 0, 1.5, 0.5, 0.5,
2, -3.309741, -6.332587, 0, -0.5, 0.5, 0.5,
2, -3.309741, -6.332587, 1, -0.5, 0.5, 0.5,
2, -3.309741, -6.332587, 1, 1.5, 0.5, 0.5,
2, -3.309741, -6.332587, 0, 1.5, 0.5, 0.5,
3, -3.309741, -6.332587, 0, -0.5, 0.5, 0.5,
3, -3.309741, -6.332587, 1, -0.5, 0.5, 0.5,
3, -3.309741, -6.332587, 1, 1.5, 0.5, 0.5,
3, -3.309741, -6.332587, 0, 1.5, 0.5, 0.5
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
-3.392041, -2, -5.507492,
-3.392041, 2, -5.507492,
-3.392041, -2, -5.507492,
-3.559933, -2, -5.782524,
-3.392041, -1, -5.507492,
-3.559933, -1, -5.782524,
-3.392041, 0, -5.507492,
-3.559933, 0, -5.782524,
-3.392041, 1, -5.507492,
-3.559933, 1, -5.782524,
-3.392041, 2, -5.507492,
-3.559933, 2, -5.782524
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
-3.895718, -2, -6.332587, 0, -0.5, 0.5, 0.5,
-3.895718, -2, -6.332587, 1, -0.5, 0.5, 0.5,
-3.895718, -2, -6.332587, 1, 1.5, 0.5, 0.5,
-3.895718, -2, -6.332587, 0, 1.5, 0.5, 0.5,
-3.895718, -1, -6.332587, 0, -0.5, 0.5, 0.5,
-3.895718, -1, -6.332587, 1, -0.5, 0.5, 0.5,
-3.895718, -1, -6.332587, 1, 1.5, 0.5, 0.5,
-3.895718, -1, -6.332587, 0, 1.5, 0.5, 0.5,
-3.895718, 0, -6.332587, 0, -0.5, 0.5, 0.5,
-3.895718, 0, -6.332587, 1, -0.5, 0.5, 0.5,
-3.895718, 0, -6.332587, 1, 1.5, 0.5, 0.5,
-3.895718, 0, -6.332587, 0, 1.5, 0.5, 0.5,
-3.895718, 1, -6.332587, 0, -0.5, 0.5, 0.5,
-3.895718, 1, -6.332587, 1, -0.5, 0.5, 0.5,
-3.895718, 1, -6.332587, 1, 1.5, 0.5, 0.5,
-3.895718, 1, -6.332587, 0, 1.5, 0.5, 0.5,
-3.895718, 2, -6.332587, 0, -0.5, 0.5, 0.5,
-3.895718, 2, -6.332587, 1, -0.5, 0.5, 0.5,
-3.895718, 2, -6.332587, 1, 1.5, 0.5, 0.5,
-3.895718, 2, -6.332587, 0, 1.5, 0.5, 0.5
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
-3.392041, -2.871748, -4,
-3.392041, -2.871748, 4,
-3.392041, -2.871748, -4,
-3.559933, -3.017746, -4,
-3.392041, -2.871748, -2,
-3.559933, -3.017746, -2,
-3.392041, -2.871748, 0,
-3.559933, -3.017746, 0,
-3.392041, -2.871748, 2,
-3.559933, -3.017746, 2,
-3.392041, -2.871748, 4,
-3.559933, -3.017746, 4
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
-3.895718, -3.309741, -4, 0, -0.5, 0.5, 0.5,
-3.895718, -3.309741, -4, 1, -0.5, 0.5, 0.5,
-3.895718, -3.309741, -4, 1, 1.5, 0.5, 0.5,
-3.895718, -3.309741, -4, 0, 1.5, 0.5, 0.5,
-3.895718, -3.309741, -2, 0, -0.5, 0.5, 0.5,
-3.895718, -3.309741, -2, 1, -0.5, 0.5, 0.5,
-3.895718, -3.309741, -2, 1, 1.5, 0.5, 0.5,
-3.895718, -3.309741, -2, 0, 1.5, 0.5, 0.5,
-3.895718, -3.309741, 0, 0, -0.5, 0.5, 0.5,
-3.895718, -3.309741, 0, 1, -0.5, 0.5, 0.5,
-3.895718, -3.309741, 0, 1, 1.5, 0.5, 0.5,
-3.895718, -3.309741, 0, 0, 1.5, 0.5, 0.5,
-3.895718, -3.309741, 2, 0, -0.5, 0.5, 0.5,
-3.895718, -3.309741, 2, 1, -0.5, 0.5, 0.5,
-3.895718, -3.309741, 2, 1, 1.5, 0.5, 0.5,
-3.895718, -3.309741, 2, 0, 1.5, 0.5, 0.5,
-3.895718, -3.309741, 4, 0, -0.5, 0.5, 0.5,
-3.895718, -3.309741, 4, 1, -0.5, 0.5, 0.5,
-3.895718, -3.309741, 4, 1, 1.5, 0.5, 0.5,
-3.895718, -3.309741, 4, 0, 1.5, 0.5, 0.5
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
-3.392041, -2.871748, -5.507492,
-3.392041, 2.968154, -5.507492,
-3.392041, -2.871748, 5.493776,
-3.392041, 2.968154, 5.493776,
-3.392041, -2.871748, -5.507492,
-3.392041, -2.871748, 5.493776,
-3.392041, 2.968154, -5.507492,
-3.392041, 2.968154, 5.493776,
-3.392041, -2.871748, -5.507492,
3.323655, -2.871748, -5.507492,
-3.392041, -2.871748, 5.493776,
3.323655, -2.871748, 5.493776,
-3.392041, 2.968154, -5.507492,
3.323655, 2.968154, -5.507492,
-3.392041, 2.968154, 5.493776,
3.323655, 2.968154, 5.493776,
3.323655, -2.871748, -5.507492,
3.323655, 2.968154, -5.507492,
3.323655, -2.871748, 5.493776,
3.323655, 2.968154, 5.493776,
3.323655, -2.871748, -5.507492,
3.323655, -2.871748, 5.493776,
3.323655, 2.968154, -5.507492,
3.323655, 2.968154, 5.493776
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
var radius = 7.556022;
var distance = 33.6176;
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
mvMatrix.translate( 0.0341928, -0.04820323, 0.00685811 );
mvMatrix.scale( 1.216511, 1.398948, 0.7426161 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.6176);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Fenoxycarb<-read.table("Fenoxycarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Fenoxycarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Fenoxycarb' not found
```

```r
y<-Fenoxycarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Fenoxycarb' not found
```

```r
z<-Fenoxycarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Fenoxycarb' not found
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
-3.294239, -0.6478609, -2.788466, 0, 0, 1, 1, 1,
-3.198698, -0.4526004, -3.08816, 1, 0, 0, 1, 1,
-3.175344, 0.9850976, -0.9572234, 1, 0, 0, 1, 1,
-2.853531, -0.2296148, -0.5016383, 1, 0, 0, 1, 1,
-2.465044, -1.055637, -1.96253, 1, 0, 0, 1, 1,
-2.366156, -0.565502, -2.131868, 1, 0, 0, 1, 1,
-2.265681, 0.3270995, -1.158267, 0, 0, 0, 1, 1,
-2.233255, -0.1760065, -4.25767, 0, 0, 0, 1, 1,
-2.179277, 0.7007414, -0.001786947, 0, 0, 0, 1, 1,
-2.15681, 0.8527813, -0.5895424, 0, 0, 0, 1, 1,
-2.109523, 0.9721761, 1.656679, 0, 0, 0, 1, 1,
-2.092314, 0.6552897, -1.942977, 0, 0, 0, 1, 1,
-2.056771, -1.94252, -1.129008, 0, 0, 0, 1, 1,
-2.027874, 1.186603, -0.8299832, 1, 1, 1, 1, 1,
-2.013589, -0.2957405, -3.257992, 1, 1, 1, 1, 1,
-1.998133, 0.2632832, -2.440612, 1, 1, 1, 1, 1,
-1.985219, -0.145158, -0.9778197, 1, 1, 1, 1, 1,
-1.966569, -0.2788857, -1.938168, 1, 1, 1, 1, 1,
-1.965916, 2.883107, -0.2031656, 1, 1, 1, 1, 1,
-1.960553, -1.201541, -1.864001, 1, 1, 1, 1, 1,
-1.957354, 0.6457229, -2.186985, 1, 1, 1, 1, 1,
-1.954555, -0.9398844, -1.772332, 1, 1, 1, 1, 1,
-1.935293, 0.52394, -2.732175, 1, 1, 1, 1, 1,
-1.91921, 0.5419983, -2.004621, 1, 1, 1, 1, 1,
-1.901453, 0.228467, -0.1949858, 1, 1, 1, 1, 1,
-1.896501, -1.431642, -2.844121, 1, 1, 1, 1, 1,
-1.893894, -0.2517983, -1.631492, 1, 1, 1, 1, 1,
-1.886263, -0.4801654, -0.3053481, 1, 1, 1, 1, 1,
-1.878345, 0.2961483, -2.666332, 0, 0, 1, 1, 1,
-1.875301, 0.1574223, -1.040334, 1, 0, 0, 1, 1,
-1.815777, -1.274303, -2.951998, 1, 0, 0, 1, 1,
-1.792393, 1.292384, -0.4304448, 1, 0, 0, 1, 1,
-1.785503, 0.5931913, -1.710534, 1, 0, 0, 1, 1,
-1.770346, 0.7794678, -0.7796034, 1, 0, 0, 1, 1,
-1.765773, -0.1587702, -0.8756252, 0, 0, 0, 1, 1,
-1.757337, -1.128654, -0.5860429, 0, 0, 0, 1, 1,
-1.716565, -0.7151864, -1.651025, 0, 0, 0, 1, 1,
-1.714424, 0.3565354, -3.159102, 0, 0, 0, 1, 1,
-1.708229, 0.3150002, -0.8606024, 0, 0, 0, 1, 1,
-1.703267, 0.2232579, -1.405953, 0, 0, 0, 1, 1,
-1.687613, -0.06357146, -2.002591, 0, 0, 0, 1, 1,
-1.6824, 0.4068272, -0.8715762, 1, 1, 1, 1, 1,
-1.675667, -0.5481454, -3.38011, 1, 1, 1, 1, 1,
-1.648093, -1.674618, -2.503168, 1, 1, 1, 1, 1,
-1.629123, 0.9335152, -1.132728, 1, 1, 1, 1, 1,
-1.622183, 0.2534911, -2.402396, 1, 1, 1, 1, 1,
-1.621329, -0.3240506, -2.409245, 1, 1, 1, 1, 1,
-1.589033, 0.3699335, -2.263392, 1, 1, 1, 1, 1,
-1.588476, 0.7781255, -0.6846468, 1, 1, 1, 1, 1,
-1.583219, 0.4488195, -3.352259, 1, 1, 1, 1, 1,
-1.559806, -0.679652, -0.1980459, 1, 1, 1, 1, 1,
-1.55703, 0.6005934, -1.188614, 1, 1, 1, 1, 1,
-1.554503, 0.3736529, -1.624547, 1, 1, 1, 1, 1,
-1.553103, -0.6535773, -1.724242, 1, 1, 1, 1, 1,
-1.551026, -0.2810016, -1.625861, 1, 1, 1, 1, 1,
-1.534441, -0.2709154, -2.323436, 1, 1, 1, 1, 1,
-1.53011, 2.051357, -4.750173, 0, 0, 1, 1, 1,
-1.506366, 1.352529, 0.3257596, 1, 0, 0, 1, 1,
-1.497919, -0.1506708, -3.488466, 1, 0, 0, 1, 1,
-1.481298, -1.129724, -0.510246, 1, 0, 0, 1, 1,
-1.463351, 0.2208778, -2.388155, 1, 0, 0, 1, 1,
-1.441394, -1.323135, -1.473933, 1, 0, 0, 1, 1,
-1.438398, -0.2272778, -1.379376, 0, 0, 0, 1, 1,
-1.436709, -0.8441188, -1.146583, 0, 0, 0, 1, 1,
-1.43285, 1.277657, -1.158032, 0, 0, 0, 1, 1,
-1.431593, 0.3521203, -1.862914, 0, 0, 0, 1, 1,
-1.422924, 1.046907, -0.1190917, 0, 0, 0, 1, 1,
-1.419569, -0.556871, -1.736323, 0, 0, 0, 1, 1,
-1.382687, 0.02509879, -3.699168, 0, 0, 0, 1, 1,
-1.380308, -0.536947, -3.595242, 1, 1, 1, 1, 1,
-1.380134, -1.091674, -1.318444, 1, 1, 1, 1, 1,
-1.378857, -1.696184, -1.192982, 1, 1, 1, 1, 1,
-1.362841, -1.652648, -1.595605, 1, 1, 1, 1, 1,
-1.358187, 0.9581524, -0.5453277, 1, 1, 1, 1, 1,
-1.354468, -2.176548, -3.042032, 1, 1, 1, 1, 1,
-1.349956, -0.4123245, -1.556772, 1, 1, 1, 1, 1,
-1.339438, -0.9674937, -2.302723, 1, 1, 1, 1, 1,
-1.332626, 1.880754, -2.001325, 1, 1, 1, 1, 1,
-1.323121, 1.75789, -0.8447945, 1, 1, 1, 1, 1,
-1.321704, 1.06866, -0.2272583, 1, 1, 1, 1, 1,
-1.317336, 0.8602676, -1.234812, 1, 1, 1, 1, 1,
-1.315676, -0.1982466, -0.6816464, 1, 1, 1, 1, 1,
-1.314428, 0.3432381, -0.2538114, 1, 1, 1, 1, 1,
-1.312833, 0.5627586, -0.8092861, 1, 1, 1, 1, 1,
-1.310512, -0.7539667, -2.188264, 0, 0, 1, 1, 1,
-1.299269, 0.1246366, -1.739823, 1, 0, 0, 1, 1,
-1.290947, -2.077285, -2.534436, 1, 0, 0, 1, 1,
-1.28586, -0.7079303, -1.680209, 1, 0, 0, 1, 1,
-1.282969, 1.095325, -0.808412, 1, 0, 0, 1, 1,
-1.275275, -0.3804074, -1.918441, 1, 0, 0, 1, 1,
-1.270297, -2.13381, -1.807234, 0, 0, 0, 1, 1,
-1.257699, -0.6461858, -2.260097, 0, 0, 0, 1, 1,
-1.25216, -0.3777026, -0.5622248, 0, 0, 0, 1, 1,
-1.24305, -0.007863121, -1.64406, 0, 0, 0, 1, 1,
-1.237542, -0.1597489, -2.729705, 0, 0, 0, 1, 1,
-1.229666, 0.6338046, 0.4095069, 0, 0, 0, 1, 1,
-1.217638, 0.267364, 0.06220397, 0, 0, 0, 1, 1,
-1.212568, 1.067601, -1.471997, 1, 1, 1, 1, 1,
-1.209799, 0.09517255, -1.492895, 1, 1, 1, 1, 1,
-1.207736, 0.1613113, -1.768028, 1, 1, 1, 1, 1,
-1.204187, -0.4621075, -1.379542, 1, 1, 1, 1, 1,
-1.200024, -0.8399674, -2.853004, 1, 1, 1, 1, 1,
-1.195249, -0.09683099, -0.7185218, 1, 1, 1, 1, 1,
-1.192901, 0.5398109, 0.9511898, 1, 1, 1, 1, 1,
-1.179061, 0.9294295, -1.947832, 1, 1, 1, 1, 1,
-1.159113, 0.6637369, 0.06142655, 1, 1, 1, 1, 1,
-1.152022, 0.2340243, -1.705658, 1, 1, 1, 1, 1,
-1.140569, -0.4027706, -2.73292, 1, 1, 1, 1, 1,
-1.133879, 1.399091, -1.432366, 1, 1, 1, 1, 1,
-1.114474, -1.220434, -2.57995, 1, 1, 1, 1, 1,
-1.1131, 1.909469, -0.8328781, 1, 1, 1, 1, 1,
-1.113058, 1.365197, -1.492078, 1, 1, 1, 1, 1,
-1.108932, -0.4011711, -2.309675, 0, 0, 1, 1, 1,
-1.108884, -0.3394023, -2.235785, 1, 0, 0, 1, 1,
-1.099785, -1.380955, -1.917337, 1, 0, 0, 1, 1,
-1.096286, 0.2711118, -2.152148, 1, 0, 0, 1, 1,
-1.093597, 0.7914727, -1.506986, 1, 0, 0, 1, 1,
-1.090254, -0.2124712, -0.9916801, 1, 0, 0, 1, 1,
-1.089246, -0.2390118, -2.263286, 0, 0, 0, 1, 1,
-1.08882, 0.4678576, -0.2051899, 0, 0, 0, 1, 1,
-1.088647, 0.4738531, -2.055623, 0, 0, 0, 1, 1,
-1.086948, 0.1850975, -0.9351335, 0, 0, 0, 1, 1,
-1.084125, 0.4005728, -1.505528, 0, 0, 0, 1, 1,
-1.083233, 0.4593677, -2.628359, 0, 0, 0, 1, 1,
-1.080674, 1.264488, -0.1086984, 0, 0, 0, 1, 1,
-1.076975, -0.8094477, -2.193333, 1, 1, 1, 1, 1,
-1.069095, 0.379104, -1.239645, 1, 1, 1, 1, 1,
-1.068139, -1.160231, -3.155739, 1, 1, 1, 1, 1,
-1.062766, -1.412641, -2.484319, 1, 1, 1, 1, 1,
-1.058768, 0.28433, -3.18731, 1, 1, 1, 1, 1,
-1.057438, -0.04185821, -1.519141, 1, 1, 1, 1, 1,
-1.05676, 0.1255353, -0.6765827, 1, 1, 1, 1, 1,
-1.053481, 0.02711618, -1.290085, 1, 1, 1, 1, 1,
-1.04715, 0.06145208, -2.182036, 1, 1, 1, 1, 1,
-1.043941, 1.819914, -1.906597, 1, 1, 1, 1, 1,
-1.037616, -0.9914314, -2.689246, 1, 1, 1, 1, 1,
-1.031063, 0.6188292, -2.254282, 1, 1, 1, 1, 1,
-1.029049, -1.895234, -2.82886, 1, 1, 1, 1, 1,
-1.026857, -0.5132488, -2.125661, 1, 1, 1, 1, 1,
-1.024643, 2.814626, -0.166123, 1, 1, 1, 1, 1,
-1.021002, 1.340582, 0.5359862, 0, 0, 1, 1, 1,
-1.020239, -0.6731632, -4.239638, 1, 0, 0, 1, 1,
-1.014803, -0.07637026, -0.8867656, 1, 0, 0, 1, 1,
-1.0117, 1.911695, 0.382637, 1, 0, 0, 1, 1,
-1.011328, 0.1939575, -1.058594, 1, 0, 0, 1, 1,
-1.002704, -0.5121732, -2.000583, 1, 0, 0, 1, 1,
-1.001448, 0.8444895, -0.3625136, 0, 0, 0, 1, 1,
-0.9997259, -0.4585729, -2.042808, 0, 0, 0, 1, 1,
-0.9963793, -0.1898806, -3.187027, 0, 0, 0, 1, 1,
-0.9909277, 0.008370144, -0.5565021, 0, 0, 0, 1, 1,
-0.9855046, 1.539584, 0.1538941, 0, 0, 0, 1, 1,
-0.9854509, -0.9452899, -2.12633, 0, 0, 0, 1, 1,
-0.9819289, -0.1607582, -2.680549, 0, 0, 0, 1, 1,
-0.9793883, -1.106435, -3.281177, 1, 1, 1, 1, 1,
-0.9790541, 0.6586549, -2.111862, 1, 1, 1, 1, 1,
-0.9763801, -1.000152, -0.951883, 1, 1, 1, 1, 1,
-0.966558, -0.07690482, -3.229897, 1, 1, 1, 1, 1,
-0.9601811, 0.004874716, -0.7674748, 1, 1, 1, 1, 1,
-0.9567583, -0.09102124, -1.262578, 1, 1, 1, 1, 1,
-0.9548877, -0.7845894, -1.298386, 1, 1, 1, 1, 1,
-0.9514549, -1.315592, -1.758501, 1, 1, 1, 1, 1,
-0.9511182, 1.759923, 0.02714641, 1, 1, 1, 1, 1,
-0.9491166, -0.2377268, -1.95287, 1, 1, 1, 1, 1,
-0.9471747, 0.2925664, -2.221569, 1, 1, 1, 1, 1,
-0.946283, -0.4909621, -2.141694, 1, 1, 1, 1, 1,
-0.940208, -2.786701, -1.918599, 1, 1, 1, 1, 1,
-0.9371167, -1.203241, -3.579156, 1, 1, 1, 1, 1,
-0.9242852, 1.223554, -0.5895181, 1, 1, 1, 1, 1,
-0.9242736, 0.04609918, -2.970453, 0, 0, 1, 1, 1,
-0.9198256, 0.04185662, -2.074214, 1, 0, 0, 1, 1,
-0.9122427, -1.759462, -3.25257, 1, 0, 0, 1, 1,
-0.911808, 0.1948902, -0.8815402, 1, 0, 0, 1, 1,
-0.9117395, -0.9825391, -1.547274, 1, 0, 0, 1, 1,
-0.9099174, -0.6257279, -1.902804, 1, 0, 0, 1, 1,
-0.9067273, -0.0929651, -0.858859, 0, 0, 0, 1, 1,
-0.9017999, -0.4055123, -3.131664, 0, 0, 0, 1, 1,
-0.8987903, -1.182607, -2.332867, 0, 0, 0, 1, 1,
-0.8916234, -0.5574176, -0.8099583, 0, 0, 0, 1, 1,
-0.8866938, 1.756739, -0.4788386, 0, 0, 0, 1, 1,
-0.8845129, -0.04242221, -1.123648, 0, 0, 0, 1, 1,
-0.8822385, 1.05054, -0.8335437, 0, 0, 0, 1, 1,
-0.8761126, 1.402184, -1.103124, 1, 1, 1, 1, 1,
-0.8737805, 0.04432858, -1.917344, 1, 1, 1, 1, 1,
-0.8736137, -1.316594, -1.725865, 1, 1, 1, 1, 1,
-0.8693501, -0.09494115, -0.193408, 1, 1, 1, 1, 1,
-0.8676823, -0.2857996, -1.637804, 1, 1, 1, 1, 1,
-0.8654597, -0.212438, -1.324872, 1, 1, 1, 1, 1,
-0.8651842, -2.137609, -2.40793, 1, 1, 1, 1, 1,
-0.8568325, -0.5283657, -2.441503, 1, 1, 1, 1, 1,
-0.8489259, 0.6823225, -2.154897, 1, 1, 1, 1, 1,
-0.846479, 1.310028, -1.581544, 1, 1, 1, 1, 1,
-0.8464648, 0.1168064, -1.289595, 1, 1, 1, 1, 1,
-0.8370319, 0.7968164, -1.287944, 1, 1, 1, 1, 1,
-0.8338807, -1.272092, -2.680561, 1, 1, 1, 1, 1,
-0.8317415, -0.0325371, -2.601593, 1, 1, 1, 1, 1,
-0.8278795, -0.07815163, -1.769174, 1, 1, 1, 1, 1,
-0.8271509, -0.2551318, -1.468151, 0, 0, 1, 1, 1,
-0.8230762, -2.25003, -3.696671, 1, 0, 0, 1, 1,
-0.8212385, 0.4755504, 0.783596, 1, 0, 0, 1, 1,
-0.8128574, 0.5290167, -2.355871, 1, 0, 0, 1, 1,
-0.8120884, -0.7435334, -3.164672, 1, 0, 0, 1, 1,
-0.8096899, -0.1323528, -2.939548, 1, 0, 0, 1, 1,
-0.8092705, 0.7915013, -2.07584, 0, 0, 0, 1, 1,
-0.8039538, 0.5344189, -1.446156, 0, 0, 0, 1, 1,
-0.8031151, -0.3550965, -3.010707, 0, 0, 0, 1, 1,
-0.8004736, 0.4544335, 1.119744, 0, 0, 0, 1, 1,
-0.7981939, 1.189797, -1.996775, 0, 0, 0, 1, 1,
-0.796798, 0.7069322, -0.1840475, 0, 0, 0, 1, 1,
-0.7940215, -0.004530645, -3.208208, 0, 0, 0, 1, 1,
-0.7930617, -0.5909355, -1.452345, 1, 1, 1, 1, 1,
-0.7913711, 1.395317, -1.512587, 1, 1, 1, 1, 1,
-0.7902565, -0.1174042, -3.355524, 1, 1, 1, 1, 1,
-0.7897935, -1.040424, -4.128565, 1, 1, 1, 1, 1,
-0.7880211, -0.1571154, -3.884787, 1, 1, 1, 1, 1,
-0.7857131, 1.616503, 0.4975627, 1, 1, 1, 1, 1,
-0.7804078, -0.01745711, -2.841496, 1, 1, 1, 1, 1,
-0.7758604, 0.8210564, -1.42326, 1, 1, 1, 1, 1,
-0.7619641, 0.178103, -1.9476, 1, 1, 1, 1, 1,
-0.7573349, 1.376153, -1.293061, 1, 1, 1, 1, 1,
-0.7412049, -0.8459045, -0.9990765, 1, 1, 1, 1, 1,
-0.73579, 1.888405, -0.1391975, 1, 1, 1, 1, 1,
-0.7339215, -1.41046, 0.6233501, 1, 1, 1, 1, 1,
-0.7325881, 1.560229, 0.3876945, 1, 1, 1, 1, 1,
-0.7297959, 2.002071, -1.479471, 1, 1, 1, 1, 1,
-0.7230706, -1.330974, -2.76155, 0, 0, 1, 1, 1,
-0.7223855, 0.4238346, -1.741998, 1, 0, 0, 1, 1,
-0.7103711, 0.2002394, -1.149737, 1, 0, 0, 1, 1,
-0.70209, 0.1984179, -1.026363, 1, 0, 0, 1, 1,
-0.694126, -0.5458685, -1.467254, 1, 0, 0, 1, 1,
-0.6896572, -0.505499, -0.5373724, 1, 0, 0, 1, 1,
-0.6885371, -1.30783, -3.860972, 0, 0, 0, 1, 1,
-0.6833089, -1.586172, -3.113454, 0, 0, 0, 1, 1,
-0.6830063, 0.4883744, 0.1459761, 0, 0, 0, 1, 1,
-0.6828934, -2.737962, -2.69062, 0, 0, 0, 1, 1,
-0.6801848, 0.3100835, -1.84949, 0, 0, 0, 1, 1,
-0.6787198, 1.859651, 0.3726598, 0, 0, 0, 1, 1,
-0.6784139, -0.2898409, -1.960256, 0, 0, 0, 1, 1,
-0.6742471, -0.2144677, -1.968955, 1, 1, 1, 1, 1,
-0.6713966, 0.6391421, -1.53967, 1, 1, 1, 1, 1,
-0.6711217, -1.106822, -2.19698, 1, 1, 1, 1, 1,
-0.6640983, -0.9301137, -1.746774, 1, 1, 1, 1, 1,
-0.6611636, 0.4387953, -0.1193871, 1, 1, 1, 1, 1,
-0.6568658, 1.125901, -1.101637, 1, 1, 1, 1, 1,
-0.6533295, 0.6041551, -2.032689, 1, 1, 1, 1, 1,
-0.6532148, 0.9491279, -0.3727218, 1, 1, 1, 1, 1,
-0.6531057, -1.137735, -2.60669, 1, 1, 1, 1, 1,
-0.65295, -0.00223033, -1.000767, 1, 1, 1, 1, 1,
-0.6490415, -0.8341632, -1.620575, 1, 1, 1, 1, 1,
-0.6468819, -0.6998237, -2.492857, 1, 1, 1, 1, 1,
-0.6460909, -0.2307864, -2.076116, 1, 1, 1, 1, 1,
-0.6351122, -0.1472757, -1.664289, 1, 1, 1, 1, 1,
-0.6301955, -1.11593, -2.206233, 1, 1, 1, 1, 1,
-0.6244212, -0.04279876, -1.219565, 0, 0, 1, 1, 1,
-0.6220953, 2.69419, -0.5849599, 1, 0, 0, 1, 1,
-0.6205897, 1.241396, -0.7424023, 1, 0, 0, 1, 1,
-0.6156541, -0.2516308, -1.661048, 1, 0, 0, 1, 1,
-0.6146201, 0.4387499, -1.943007, 1, 0, 0, 1, 1,
-0.6122567, 0.5956417, 0.02023121, 1, 0, 0, 1, 1,
-0.6099345, -0.0588907, -0.9356202, 0, 0, 0, 1, 1,
-0.608641, 1.357195, -1.555975, 0, 0, 0, 1, 1,
-0.6079724, 1.190409, -0.5495378, 0, 0, 0, 1, 1,
-0.6029677, 0.957545, -0.6494731, 0, 0, 0, 1, 1,
-0.5973023, -0.3878068, -3.343877, 0, 0, 0, 1, 1,
-0.5943537, -0.009098052, -0.8511173, 0, 0, 0, 1, 1,
-0.5916614, 0.05353802, -1.604344, 0, 0, 0, 1, 1,
-0.5905446, -0.6469268, -2.200201, 1, 1, 1, 1, 1,
-0.5898753, -0.6083574, -1.079557, 1, 1, 1, 1, 1,
-0.5861254, -1.835891, -3.022003, 1, 1, 1, 1, 1,
-0.5825086, 0.07063748, -3.291307, 1, 1, 1, 1, 1,
-0.581389, 0.2729279, -0.7446072, 1, 1, 1, 1, 1,
-0.5807943, 0.1113465, -2.797077, 1, 1, 1, 1, 1,
-0.5762452, -0.2554113, -1.568793, 1, 1, 1, 1, 1,
-0.5741515, -0.5311232, -3.210603, 1, 1, 1, 1, 1,
-0.5705601, -0.5552672, -3.270051, 1, 1, 1, 1, 1,
-0.5693884, 0.279702, -2.070136, 1, 1, 1, 1, 1,
-0.5691204, -0.6783838, -1.676839, 1, 1, 1, 1, 1,
-0.5661088, -0.4155436, -2.573981, 1, 1, 1, 1, 1,
-0.5596922, 0.1535469, -2.076219, 1, 1, 1, 1, 1,
-0.5564144, -0.8007404, -1.925472, 1, 1, 1, 1, 1,
-0.5526505, -0.6118222, -2.991942, 1, 1, 1, 1, 1,
-0.5505058, -0.2162131, -2.648238, 0, 0, 1, 1, 1,
-0.5490248, -0.0952539, -2.660094, 1, 0, 0, 1, 1,
-0.546358, 1.042856, -0.5385633, 1, 0, 0, 1, 1,
-0.5462113, 0.06314909, -1.340909, 1, 0, 0, 1, 1,
-0.5381112, -2.189775, -2.388788, 1, 0, 0, 1, 1,
-0.5379347, -0.1628692, 0.1399364, 1, 0, 0, 1, 1,
-0.5366775, -0.1799884, -3.16408, 0, 0, 0, 1, 1,
-0.5366744, -0.1485666, -1.951971, 0, 0, 0, 1, 1,
-0.5353412, 0.9097229, -0.6195112, 0, 0, 0, 1, 1,
-0.5339941, 2.069434, -0.1641734, 0, 0, 0, 1, 1,
-0.5336585, 1.06719, -1.078156, 0, 0, 0, 1, 1,
-0.5334058, 0.3293723, -0.4197786, 0, 0, 0, 1, 1,
-0.5303338, -0.6976401, -2.692053, 0, 0, 0, 1, 1,
-0.5300478, 1.487858, 0.6862869, 1, 1, 1, 1, 1,
-0.5249403, -0.2063656, -1.242348, 1, 1, 1, 1, 1,
-0.5238163, 0.4766306, -1.226929, 1, 1, 1, 1, 1,
-0.5233584, 0.3522782, -0.4782374, 1, 1, 1, 1, 1,
-0.5217333, -0.6721218, -2.079151, 1, 1, 1, 1, 1,
-0.5196368, -2.307137, -1.056008, 1, 1, 1, 1, 1,
-0.5173834, -0.4793284, -0.5445906, 1, 1, 1, 1, 1,
-0.5101985, 0.8190904, -0.3880281, 1, 1, 1, 1, 1,
-0.5095392, -0.2789045, -2.443266, 1, 1, 1, 1, 1,
-0.5089378, -0.02880237, -2.192301, 1, 1, 1, 1, 1,
-0.5088125, -0.02984926, -3.22483, 1, 1, 1, 1, 1,
-0.5074447, 1.177773, 0.06788359, 1, 1, 1, 1, 1,
-0.5068004, -0.02246817, -1.007578, 1, 1, 1, 1, 1,
-0.5050167, 0.225383, -2.752423, 1, 1, 1, 1, 1,
-0.5029045, 0.05823498, -2.458949, 1, 1, 1, 1, 1,
-0.5001269, -0.04795329, -3.567551, 0, 0, 1, 1, 1,
-0.4970635, -0.1816916, -3.385281, 1, 0, 0, 1, 1,
-0.4878694, -0.3510011, -2.698109, 1, 0, 0, 1, 1,
-0.4875714, 1.188542, -0.6105826, 1, 0, 0, 1, 1,
-0.4857647, -2.328721, -1.104192, 1, 0, 0, 1, 1,
-0.4847912, -0.0233008, -2.998107, 1, 0, 0, 1, 1,
-0.4825585, 0.1704471, -2.564583, 0, 0, 0, 1, 1,
-0.4795619, 0.9807087, -0.1413622, 0, 0, 0, 1, 1,
-0.4750168, -0.9271939, -0.3356645, 0, 0, 0, 1, 1,
-0.4732756, 0.6005086, 0.1800704, 0, 0, 0, 1, 1,
-0.4691572, 1.50685, -0.07625919, 0, 0, 0, 1, 1,
-0.4678528, 0.9138255, -0.8574075, 0, 0, 0, 1, 1,
-0.4650315, -0.8296558, -2.558931, 0, 0, 0, 1, 1,
-0.4631724, 0.1520927, 0.02874614, 1, 1, 1, 1, 1,
-0.4628642, -1.540673, -1.738687, 1, 1, 1, 1, 1,
-0.4498866, -0.518786, -2.57552, 1, 1, 1, 1, 1,
-0.4447494, 0.6040387, -1.035141, 1, 1, 1, 1, 1,
-0.4435753, -0.6049359, -1.2154, 1, 1, 1, 1, 1,
-0.4389482, -0.1373419, -1.6961, 1, 1, 1, 1, 1,
-0.4368903, 0.2554595, 0.4068251, 1, 1, 1, 1, 1,
-0.4363261, -0.8817233, -1.819759, 1, 1, 1, 1, 1,
-0.4351835, 0.2744097, -2.368701, 1, 1, 1, 1, 1,
-0.4240635, 0.5580307, -0.0392805, 1, 1, 1, 1, 1,
-0.4197655, 1.409778, -0.764447, 1, 1, 1, 1, 1,
-0.4189109, 0.6920452, 1.392145, 1, 1, 1, 1, 1,
-0.4157945, -0.7279782, -3.489802, 1, 1, 1, 1, 1,
-0.4139087, 0.852423, -0.3592421, 1, 1, 1, 1, 1,
-0.4101596, 0.5190641, -2.592758, 1, 1, 1, 1, 1,
-0.4055966, 0.2182861, -1.290409, 0, 0, 1, 1, 1,
-0.4040484, -0.5540339, -3.782568, 1, 0, 0, 1, 1,
-0.4022692, -1.584286, -2.559237, 1, 0, 0, 1, 1,
-0.3944562, 0.1174349, -2.560395, 1, 0, 0, 1, 1,
-0.3938602, 0.7827808, -0.9018137, 1, 0, 0, 1, 1,
-0.3924164, 1.0415, -2.814319, 1, 0, 0, 1, 1,
-0.3885239, 0.05132099, -2.031339, 0, 0, 0, 1, 1,
-0.387908, 0.05780448, -1.949978, 0, 0, 0, 1, 1,
-0.3838988, 0.3941392, -0.2256572, 0, 0, 0, 1, 1,
-0.3818602, 0.9385033, -1.158263, 0, 0, 0, 1, 1,
-0.3789458, 0.9537615, -0.07487711, 0, 0, 0, 1, 1,
-0.3788551, -0.6649433, -3.430921, 0, 0, 0, 1, 1,
-0.3769875, -0.1539619, -1.362893, 0, 0, 0, 1, 1,
-0.3696018, 0.7001995, -0.4035307, 1, 1, 1, 1, 1,
-0.3646054, 1.818824, 1.299446, 1, 1, 1, 1, 1,
-0.3621592, 0.6613879, 0.1145836, 1, 1, 1, 1, 1,
-0.3615568, -1.484977, -3.624485, 1, 1, 1, 1, 1,
-0.360627, 1.096127, 1.428208, 1, 1, 1, 1, 1,
-0.3546105, 0.7344702, -0.9463087, 1, 1, 1, 1, 1,
-0.3535272, 1.381957, -1.620311, 1, 1, 1, 1, 1,
-0.3479681, -0.4890535, -1.224657, 1, 1, 1, 1, 1,
-0.335483, 1.10691, 0.7161676, 1, 1, 1, 1, 1,
-0.3315489, 1.200706, -0.6791089, 1, 1, 1, 1, 1,
-0.3299441, 0.1191906, -1.094062, 1, 1, 1, 1, 1,
-0.3285704, 0.1775062, -1.426858, 1, 1, 1, 1, 1,
-0.3282606, 0.6646166, -0.3545575, 1, 1, 1, 1, 1,
-0.3255322, 0.3865694, -0.2560394, 1, 1, 1, 1, 1,
-0.3248837, 2.01481, 0.7802913, 1, 1, 1, 1, 1,
-0.3188968, -0.9359821, -2.011458, 0, 0, 1, 1, 1,
-0.3159156, 0.2408089, 0.161532, 1, 0, 0, 1, 1,
-0.3158106, 0.9761345, 1.766322, 1, 0, 0, 1, 1,
-0.31215, -0.2844814, -1.335336, 1, 0, 0, 1, 1,
-0.3082994, 1.314165, -0.2207429, 1, 0, 0, 1, 1,
-0.3055358, 0.6987185, -1.779116, 1, 0, 0, 1, 1,
-0.3047601, -0.1603361, -1.618542, 0, 0, 0, 1, 1,
-0.2924585, -0.05980748, -2.570744, 0, 0, 0, 1, 1,
-0.291359, -0.2981783, -2.438588, 0, 0, 0, 1, 1,
-0.2859356, -0.4419393, -1.666206, 0, 0, 0, 1, 1,
-0.2836664, -0.2633674, -3.933291, 0, 0, 0, 1, 1,
-0.2806261, -0.4756737, -4.49151, 0, 0, 0, 1, 1,
-0.2801204, -1.110491, -2.083778, 0, 0, 0, 1, 1,
-0.2792791, -0.5543258, -3.018576, 1, 1, 1, 1, 1,
-0.2765348, -0.2232798, 0.04135755, 1, 1, 1, 1, 1,
-0.2763409, -0.6079702, -2.018373, 1, 1, 1, 1, 1,
-0.2717842, 0.1517787, -1.020532, 1, 1, 1, 1, 1,
-0.2715556, 0.1943141, -2.145946, 1, 1, 1, 1, 1,
-0.2707908, 0.956543, 0.08057179, 1, 1, 1, 1, 1,
-0.2688609, 0.8702483, -0.102402, 1, 1, 1, 1, 1,
-0.2688319, -0.09931869, -2.75706, 1, 1, 1, 1, 1,
-0.2659318, -0.6149924, -3.001193, 1, 1, 1, 1, 1,
-0.2656383, 0.3249303, 0.1329262, 1, 1, 1, 1, 1,
-0.2609397, 0.1420184, -1.704188, 1, 1, 1, 1, 1,
-0.2586249, -1.011895, -3.105876, 1, 1, 1, 1, 1,
-0.2577924, 0.0743034, -1.55808, 1, 1, 1, 1, 1,
-0.2540142, 1.090573, 0.5607033, 1, 1, 1, 1, 1,
-0.2493876, 0.6697483, -1.088836, 1, 1, 1, 1, 1,
-0.2480844, -1.86468, -4.987051, 0, 0, 1, 1, 1,
-0.2478132, 1.029338, -0.5931799, 1, 0, 0, 1, 1,
-0.2474731, 0.4564144, -1.489967, 1, 0, 0, 1, 1,
-0.2465495, 1.193352, -1.844098, 1, 0, 0, 1, 1,
-0.2433006, -0.08364137, -3.551391, 1, 0, 0, 1, 1,
-0.236478, 1.577151, 1.086787, 1, 0, 0, 1, 1,
-0.2353982, -1.123147, -3.916764, 0, 0, 0, 1, 1,
-0.2339042, 0.9210103, -0.4946588, 0, 0, 0, 1, 1,
-0.2286704, 0.2933404, 0.1431699, 0, 0, 0, 1, 1,
-0.2285312, -0.1851266, -1.742073, 0, 0, 0, 1, 1,
-0.2275341, -0.5419726, -2.994803, 0, 0, 0, 1, 1,
-0.2270192, 1.811958, 0.329746, 0, 0, 0, 1, 1,
-0.2183489, -1.145034, -0.6679825, 0, 0, 0, 1, 1,
-0.2147412, 0.306976, -1.90753, 1, 1, 1, 1, 1,
-0.2142061, 0.4308712, -1.256915, 1, 1, 1, 1, 1,
-0.2139881, 0.08697699, -0.3476806, 1, 1, 1, 1, 1,
-0.211595, 0.5230005, -0.6402191, 1, 1, 1, 1, 1,
-0.2090699, 1.147988, -1.473697, 1, 1, 1, 1, 1,
-0.2088461, 0.3582563, -1.126631, 1, 1, 1, 1, 1,
-0.2082872, 0.9383548, 0.5057169, 1, 1, 1, 1, 1,
-0.2002175, -1.332083, -2.524099, 1, 1, 1, 1, 1,
-0.1978095, -0.3670566, -2.212217, 1, 1, 1, 1, 1,
-0.1955116, -0.8056472, -2.595094, 1, 1, 1, 1, 1,
-0.1947519, -0.5794278, -2.800183, 1, 1, 1, 1, 1,
-0.1937485, -0.8668191, -4.054099, 1, 1, 1, 1, 1,
-0.1921435, -1.501674, -5.34728, 1, 1, 1, 1, 1,
-0.1916926, 0.4832257, 0.9039726, 1, 1, 1, 1, 1,
-0.1912537, 0.2429489, -2.621221, 1, 1, 1, 1, 1,
-0.1882667, 1.32542, -0.9124216, 0, 0, 1, 1, 1,
-0.1873153, -0.3610635, -0.3239646, 1, 0, 0, 1, 1,
-0.1827318, -0.6264294, -3.98284, 1, 0, 0, 1, 1,
-0.1826206, -1.046554, -4.742898, 1, 0, 0, 1, 1,
-0.180119, 1.315848, -0.5475097, 1, 0, 0, 1, 1,
-0.1798576, -0.8804945, -5.299815, 1, 0, 0, 1, 1,
-0.17449, 0.8918214, -0.469917, 0, 0, 0, 1, 1,
-0.1718015, -1.577122, -4.583157, 0, 0, 0, 1, 1,
-0.1702582, 1.498354, -1.197681, 0, 0, 0, 1, 1,
-0.1688436, -1.594902, -3.232525, 0, 0, 0, 1, 1,
-0.1686323, 1.231878, 1.21793, 0, 0, 0, 1, 1,
-0.1677706, 1.487301, 1.360495, 0, 0, 0, 1, 1,
-0.1657277, -1.986055, -3.636667, 0, 0, 0, 1, 1,
-0.1593665, -0.6719015, -2.65093, 1, 1, 1, 1, 1,
-0.1570022, -0.5798842, -3.939478, 1, 1, 1, 1, 1,
-0.1519506, 0.9031497, -0.4900664, 1, 1, 1, 1, 1,
-0.147059, -2.359898, -3.872724, 1, 1, 1, 1, 1,
-0.1445557, -0.4135258, -0.07179562, 1, 1, 1, 1, 1,
-0.1440448, -0.009477764, -0.6010522, 1, 1, 1, 1, 1,
-0.1438225, -1.163419, -4.252884, 1, 1, 1, 1, 1,
-0.141979, -0.8174949, -3.83499, 1, 1, 1, 1, 1,
-0.1361267, -0.2682267, -2.034572, 1, 1, 1, 1, 1,
-0.1360589, 0.6262932, -0.7119282, 1, 1, 1, 1, 1,
-0.1336982, -0.2534247, -3.172902, 1, 1, 1, 1, 1,
-0.1269314, -0.09217777, -2.693639, 1, 1, 1, 1, 1,
-0.1263616, 1.526596, 0.6962554, 1, 1, 1, 1, 1,
-0.1243627, -1.348598, -4.955161, 1, 1, 1, 1, 1,
-0.1215316, -0.4898528, -2.284366, 1, 1, 1, 1, 1,
-0.1191897, 0.6736528, -0.295076, 0, 0, 1, 1, 1,
-0.1181808, -1.245711, -4.223027, 1, 0, 0, 1, 1,
-0.1180158, 0.6528528, 1.195566, 1, 0, 0, 1, 1,
-0.114, -1.582791, -3.099234, 1, 0, 0, 1, 1,
-0.1137012, 0.506847, -0.2723033, 1, 0, 0, 1, 1,
-0.1120473, -0.3946736, -1.926192, 1, 0, 0, 1, 1,
-0.1052281, 1.650927, -1.399133, 0, 0, 0, 1, 1,
-0.1044782, 2.041038, -0.1057829, 0, 0, 0, 1, 1,
-0.1028243, 1.757124, 0.5511597, 0, 0, 0, 1, 1,
-0.1026123, 0.977999, -0.7496138, 0, 0, 0, 1, 1,
-0.102475, -0.6605208, -2.337804, 0, 0, 0, 1, 1,
-0.1001918, 0.6549184, -0.2377978, 0, 0, 0, 1, 1,
-0.09952309, 0.4038583, 0.190784, 0, 0, 0, 1, 1,
-0.09726631, -0.8459712, -1.982703, 1, 1, 1, 1, 1,
-0.09230213, 1.649854, 0.05273759, 1, 1, 1, 1, 1,
-0.08929914, 0.1369322, -1.080672, 1, 1, 1, 1, 1,
-0.08521406, -0.8263708, -0.4011106, 1, 1, 1, 1, 1,
-0.08451481, 1.242686, -0.2808775, 1, 1, 1, 1, 1,
-0.08397312, 0.2002141, -0.06493603, 1, 1, 1, 1, 1,
-0.08350034, -0.7330161, -3.671835, 1, 1, 1, 1, 1,
-0.0832526, 0.4302965, 1.422245, 1, 1, 1, 1, 1,
-0.07982456, -0.6941739, -1.661273, 1, 1, 1, 1, 1,
-0.07741247, 1.836278, -2.138551, 1, 1, 1, 1, 1,
-0.07430614, 0.5033687, 0.9166754, 1, 1, 1, 1, 1,
-0.07333719, 0.7658121, 0.7259573, 1, 1, 1, 1, 1,
-0.07033352, 0.08227614, -1.947834, 1, 1, 1, 1, 1,
-0.06936983, 0.8262233, 1.230254, 1, 1, 1, 1, 1,
-0.06766994, 1.048232, -1.264073, 1, 1, 1, 1, 1,
-0.06069012, 2.015055, -1.152061, 0, 0, 1, 1, 1,
-0.05555303, 0.8551383, -0.3845694, 1, 0, 0, 1, 1,
-0.05531874, 0.02920476, -2.981096, 1, 0, 0, 1, 1,
-0.05248026, -0.07089239, -1.689677, 1, 0, 0, 1, 1,
-0.05103971, -0.4300703, -3.29177, 1, 0, 0, 1, 1,
-0.04903753, 2.171706, -0.8783396, 1, 0, 0, 1, 1,
-0.04288477, -0.9923281, -2.199204, 0, 0, 0, 1, 1,
-0.04265374, 1.593516, -1.295348, 0, 0, 0, 1, 1,
-0.04144312, 0.3504623, 0.6356946, 0, 0, 0, 1, 1,
-0.04107876, 2.124806, 0.1793949, 0, 0, 0, 1, 1,
-0.03739337, 1.322087, 0.1022421, 0, 0, 0, 1, 1,
-0.03410515, 0.6333037, -0.7383767, 0, 0, 0, 1, 1,
-0.03232836, -0.5957649, -3.858462, 0, 0, 0, 1, 1,
-0.02848598, -0.8154915, -2.712196, 1, 1, 1, 1, 1,
-0.02121173, -0.8445013, -4.533957, 1, 1, 1, 1, 1,
-0.02029283, 0.472095, 0.2651085, 1, 1, 1, 1, 1,
-0.009286916, -0.6786592, -4.214817, 1, 1, 1, 1, 1,
-0.006948994, -0.5470701, -3.206329, 1, 1, 1, 1, 1,
-0.006604325, -0.4843963, -3.153904, 1, 1, 1, 1, 1,
-0.005821264, 2.217017, -0.4986361, 1, 1, 1, 1, 1,
0.007393715, 0.7487683, -0.5843666, 1, 1, 1, 1, 1,
0.008252362, -0.1895649, 4.375869, 1, 1, 1, 1, 1,
0.01293585, -0.2429185, 3.269186, 1, 1, 1, 1, 1,
0.0165695, 0.1447268, -1.048936, 1, 1, 1, 1, 1,
0.01658089, -0.1830473, 3.590739, 1, 1, 1, 1, 1,
0.01748768, 0.2728901, 0.1253858, 1, 1, 1, 1, 1,
0.01856391, 0.4944768, 1.991111, 1, 1, 1, 1, 1,
0.01862574, 1.228858, -0.5219909, 1, 1, 1, 1, 1,
0.01965903, -0.2113752, 2.695778, 0, 0, 1, 1, 1,
0.02193354, -0.1736112, 4.180514, 1, 0, 0, 1, 1,
0.02316477, 1.241501, -1.773899, 1, 0, 0, 1, 1,
0.02357418, -0.4990101, 1.80333, 1, 0, 0, 1, 1,
0.02412974, -0.03980066, 3.824398, 1, 0, 0, 1, 1,
0.02451173, 1.493751, 1.345901, 1, 0, 0, 1, 1,
0.02832831, 1.176895, 0.1366025, 0, 0, 0, 1, 1,
0.02865786, -0.6690239, 2.336313, 0, 0, 0, 1, 1,
0.02956933, -0.4647253, 3.401523, 0, 0, 0, 1, 1,
0.03446363, 0.3605563, 0.9478773, 0, 0, 0, 1, 1,
0.03743682, 0.3743463, 0.00352071, 0, 0, 0, 1, 1,
0.03852236, 0.07802678, 1.426813, 0, 0, 0, 1, 1,
0.04531976, -0.02406661, 1.563895, 0, 0, 0, 1, 1,
0.04955074, -1.3753, 3.043683, 1, 1, 1, 1, 1,
0.05273689, 0.971032, 0.05878783, 1, 1, 1, 1, 1,
0.05869812, -1.465004, 3.164405, 1, 1, 1, 1, 1,
0.06004165, -0.260577, 2.573071, 1, 1, 1, 1, 1,
0.06243975, -0.6769212, 1.243245, 1, 1, 1, 1, 1,
0.06637626, -1.933247, 2.721912, 1, 1, 1, 1, 1,
0.06788116, 0.4893361, 0.3110409, 1, 1, 1, 1, 1,
0.06794117, 0.3457817, -0.4523343, 1, 1, 1, 1, 1,
0.07098544, 1.398304, 0.6832349, 1, 1, 1, 1, 1,
0.07115933, -1.977806, 1.797695, 1, 1, 1, 1, 1,
0.07195561, -0.2830305, 3.605266, 1, 1, 1, 1, 1,
0.0727775, 0.02088615, 0.6238417, 1, 1, 1, 1, 1,
0.07563163, -0.3418018, 3.670886, 1, 1, 1, 1, 1,
0.07567118, -0.6496932, 2.044684, 1, 1, 1, 1, 1,
0.07698356, 0.5573993, -0.02102228, 1, 1, 1, 1, 1,
0.07952637, 1.133655, -0.3326967, 0, 0, 1, 1, 1,
0.07979655, 1.371604, -0.708177, 1, 0, 0, 1, 1,
0.08392554, -0.4954165, 4.289721, 1, 0, 0, 1, 1,
0.08570044, 0.3800422, 0.5521902, 1, 0, 0, 1, 1,
0.08696831, 0.2972254, -0.7433338, 1, 0, 0, 1, 1,
0.08748558, 0.8883454, -0.3033403, 1, 0, 0, 1, 1,
0.08907884, 0.2796531, -0.2285769, 0, 0, 0, 1, 1,
0.08991033, 0.2896924, 1.027932, 0, 0, 0, 1, 1,
0.09054248, -0.5199644, 3.792005, 0, 0, 0, 1, 1,
0.09315092, -0.5511199, 3.834641, 0, 0, 0, 1, 1,
0.09572868, 0.2826163, 0.8935342, 0, 0, 0, 1, 1,
0.10392, 0.6741382, 0.6540442, 0, 0, 0, 1, 1,
0.1064986, -0.9879944, 4.896147, 0, 0, 0, 1, 1,
0.1094177, -0.3919811, 1.505805, 1, 1, 1, 1, 1,
0.1099288, 0.2499722, 1.669691, 1, 1, 1, 1, 1,
0.1153825, -1.237109, 3.088469, 1, 1, 1, 1, 1,
0.1160904, 0.9898933, 0.176728, 1, 1, 1, 1, 1,
0.119158, 0.2265911, -0.235447, 1, 1, 1, 1, 1,
0.1209956, -1.37439, 2.89223, 1, 1, 1, 1, 1,
0.1242489, 0.347906, 0.9571134, 1, 1, 1, 1, 1,
0.1278394, -2.061414, 3.319118, 1, 1, 1, 1, 1,
0.1318417, 1.649726, 0.1725262, 1, 1, 1, 1, 1,
0.1364065, 0.09878772, -0.725657, 1, 1, 1, 1, 1,
0.1369373, 1.265623, 1.762784, 1, 1, 1, 1, 1,
0.1378988, 1.12376, 1.966705, 1, 1, 1, 1, 1,
0.1379617, 0.06242605, 2.055654, 1, 1, 1, 1, 1,
0.1414996, 1.774506, -0.3785751, 1, 1, 1, 1, 1,
0.1424985, -1.837931, 1.980834, 1, 1, 1, 1, 1,
0.1502641, -0.7617063, 2.748853, 0, 0, 1, 1, 1,
0.1513931, 0.00128952, 2.155322, 1, 0, 0, 1, 1,
0.1517117, -0.005663501, 1.637746, 1, 0, 0, 1, 1,
0.1584272, 0.5406668, -0.08303604, 1, 0, 0, 1, 1,
0.1602625, -0.4433002, 2.592442, 1, 0, 0, 1, 1,
0.1608521, 0.3711979, 1.595012, 1, 0, 0, 1, 1,
0.1616613, 0.1198143, -0.1827067, 0, 0, 0, 1, 1,
0.1644315, -0.2653094, 2.877646, 0, 0, 0, 1, 1,
0.1685922, 0.5222847, 1.064647, 0, 0, 0, 1, 1,
0.1695367, 0.81809, -0.6407298, 0, 0, 0, 1, 1,
0.170135, 0.8034949, 2.855635, 0, 0, 0, 1, 1,
0.1727236, -0.689876, 2.643344, 0, 0, 0, 1, 1,
0.1775563, -0.1462543, 2.082482, 0, 0, 0, 1, 1,
0.180283, -0.08415063, 2.342925, 1, 1, 1, 1, 1,
0.1840975, 0.1270004, 1.918391, 1, 1, 1, 1, 1,
0.1879465, -0.7270084, 2.270076, 1, 1, 1, 1, 1,
0.1910182, 0.1733693, -2.073159, 1, 1, 1, 1, 1,
0.1913854, 0.8059113, -0.1449957, 1, 1, 1, 1, 1,
0.1935241, 1.09177, 0.9062061, 1, 1, 1, 1, 1,
0.1964665, 0.09982907, 1.563116, 1, 1, 1, 1, 1,
0.1971115, -0.5920746, 3.293689, 1, 1, 1, 1, 1,
0.1997118, -0.5428817, 2.504683, 1, 1, 1, 1, 1,
0.2003206, 0.2486271, 0.445367, 1, 1, 1, 1, 1,
0.2022932, -0.4521717, 3.210874, 1, 1, 1, 1, 1,
0.2037191, 0.07267712, 0.3554458, 1, 1, 1, 1, 1,
0.2064507, -0.1442491, 1.09935, 1, 1, 1, 1, 1,
0.2081679, -1.165311, 2.336201, 1, 1, 1, 1, 1,
0.2094141, 0.6377223, -1.000468, 1, 1, 1, 1, 1,
0.2104874, 0.418603, 0.7324594, 0, 0, 1, 1, 1,
0.2113038, -1.46206, 1.721619, 1, 0, 0, 1, 1,
0.2138144, -0.4189216, 2.622843, 1, 0, 0, 1, 1,
0.2185178, 0.09952119, 1.861922, 1, 0, 0, 1, 1,
0.2222681, -0.0620581, 3.405071, 1, 0, 0, 1, 1,
0.2223839, -0.8914187, 2.873159, 1, 0, 0, 1, 1,
0.2231993, -0.01419806, 1.053657, 0, 0, 0, 1, 1,
0.225367, 2.137741, 0.4760645, 0, 0, 0, 1, 1,
0.2260845, -0.1027118, 3.161954, 0, 0, 0, 1, 1,
0.2338114, 0.4272258, 1.472819, 0, 0, 0, 1, 1,
0.2375578, 0.4160461, -0.8262608, 0, 0, 0, 1, 1,
0.242398, -0.9931239, 2.803348, 0, 0, 0, 1, 1,
0.2466002, -0.02492511, 1.113794, 0, 0, 0, 1, 1,
0.2493002, -0.04604312, 3.198464, 1, 1, 1, 1, 1,
0.2497176, -0.6417062, 2.896266, 1, 1, 1, 1, 1,
0.2530718, 0.1675454, 0.6539733, 1, 1, 1, 1, 1,
0.2635622, 0.6090545, -1.652943, 1, 1, 1, 1, 1,
0.2698558, 0.6068091, -0.6946673, 1, 1, 1, 1, 1,
0.2730466, -0.5491563, 2.038388, 1, 1, 1, 1, 1,
0.2767598, -0.9068788, 4.592389, 1, 1, 1, 1, 1,
0.2811107, 0.4393818, 1.263985, 1, 1, 1, 1, 1,
0.286709, -0.812887, 2.787691, 1, 1, 1, 1, 1,
0.2870629, -0.6480919, 3.518033, 1, 1, 1, 1, 1,
0.2927787, -0.09211892, 1.464726, 1, 1, 1, 1, 1,
0.3007478, 0.8874866, 0.007565139, 1, 1, 1, 1, 1,
0.3074964, -0.2364385, 3.129177, 1, 1, 1, 1, 1,
0.3097083, 0.7469181, -2.430182, 1, 1, 1, 1, 1,
0.3097995, -0.1109562, 1.867806, 1, 1, 1, 1, 1,
0.3098443, -0.3359359, 4.284259, 0, 0, 1, 1, 1,
0.3119524, -1.128749, 2.646736, 1, 0, 0, 1, 1,
0.3140386, 1.240093, 1.087165, 1, 0, 0, 1, 1,
0.3187596, 0.9320726, 1.774025, 1, 0, 0, 1, 1,
0.3192242, 0.8793189, -0.0389234, 1, 0, 0, 1, 1,
0.32098, 0.1603777, 1.504437, 1, 0, 0, 1, 1,
0.3240429, -0.04660521, 2.010473, 0, 0, 0, 1, 1,
0.3245162, 1.663968, 0.5285788, 0, 0, 0, 1, 1,
0.3263167, 0.4029517, 1.079594, 0, 0, 0, 1, 1,
0.3269437, 0.3614282, 1.40709, 0, 0, 0, 1, 1,
0.3274297, 0.8998668, 1.857812, 0, 0, 0, 1, 1,
0.3420134, 1.969403, 1.433552, 0, 0, 0, 1, 1,
0.3441805, 0.1763862, 0.2841106, 0, 0, 0, 1, 1,
0.3539942, 0.3036472, 0.2387063, 1, 1, 1, 1, 1,
0.3552227, -0.6613007, 2.725946, 1, 1, 1, 1, 1,
0.3570617, -0.8868283, 3.475621, 1, 1, 1, 1, 1,
0.3576156, -1.468328, 2.68054, 1, 1, 1, 1, 1,
0.3599873, -0.1449611, 2.189776, 1, 1, 1, 1, 1,
0.3661322, 0.3223238, -0.8107774, 1, 1, 1, 1, 1,
0.3676178, 0.7511969, 0.1822916, 1, 1, 1, 1, 1,
0.36917, 1.135859, -0.9839811, 1, 1, 1, 1, 1,
0.3719787, 1.022203, -0.9491701, 1, 1, 1, 1, 1,
0.3827685, -0.5331567, 4.094717, 1, 1, 1, 1, 1,
0.3865011, -1.439255, 1.455923, 1, 1, 1, 1, 1,
0.3871829, -0.2549302, 1.701094, 1, 1, 1, 1, 1,
0.3991701, -1.532964, 1.925711, 1, 1, 1, 1, 1,
0.3996795, -0.2152438, -0.7394605, 1, 1, 1, 1, 1,
0.4021229, -0.05335829, 1.097353, 1, 1, 1, 1, 1,
0.4053334, 1.074108, 0.5517232, 0, 0, 1, 1, 1,
0.406101, 0.2677452, 3.283698, 1, 0, 0, 1, 1,
0.4078441, 0.1464259, 1.809091, 1, 0, 0, 1, 1,
0.4098766, 0.6792194, 0.5629862, 1, 0, 0, 1, 1,
0.4120813, 0.5987023, -0.5438438, 1, 0, 0, 1, 1,
0.4125114, 0.07909235, -0.5920844, 1, 0, 0, 1, 1,
0.4125371, -0.6120498, 1.260059, 0, 0, 0, 1, 1,
0.413432, 0.1672793, 0.2916492, 0, 0, 0, 1, 1,
0.4138703, 2.155113, 0.3473103, 0, 0, 0, 1, 1,
0.4175231, -0.4388586, 3.598035, 0, 0, 0, 1, 1,
0.4187633, 0.6146383, 1.561134, 0, 0, 0, 1, 1,
0.4203644, -0.2081021, 1.988995, 0, 0, 0, 1, 1,
0.4228592, -1.439588, 3.565778, 0, 0, 0, 1, 1,
0.4257732, -0.3447107, 1.357131, 1, 1, 1, 1, 1,
0.4278259, 1.059068, 0.9723671, 1, 1, 1, 1, 1,
0.4348463, 0.3491836, 1.839761, 1, 1, 1, 1, 1,
0.4375675, -1.196949, 3.311552, 1, 1, 1, 1, 1,
0.4377141, 1.646812, 0.7394177, 1, 1, 1, 1, 1,
0.4381077, 1.066981, 0.4261027, 1, 1, 1, 1, 1,
0.4412774, 1.568108, 0.4438898, 1, 1, 1, 1, 1,
0.4423075, 1.525812, 0.9810309, 1, 1, 1, 1, 1,
0.443232, 1.090879, -0.1160864, 1, 1, 1, 1, 1,
0.4440156, -1.446837, 2.231384, 1, 1, 1, 1, 1,
0.44421, -0.1583816, 3.931545, 1, 1, 1, 1, 1,
0.4452751, -1.309343, 2.53224, 1, 1, 1, 1, 1,
0.4456135, -0.4464933, 3.059428, 1, 1, 1, 1, 1,
0.4508961, -1.283409, 1.804317, 1, 1, 1, 1, 1,
0.4523991, -0.1653769, 1.692032, 1, 1, 1, 1, 1,
0.4531737, -1.011255, 4.307801, 0, 0, 1, 1, 1,
0.4534545, -0.377476, 1.807617, 1, 0, 0, 1, 1,
0.4604147, -0.3761342, 5.333563, 1, 0, 0, 1, 1,
0.4651411, -0.4858558, 2.519384, 1, 0, 0, 1, 1,
0.4663733, -1.365773, 3.901112, 1, 0, 0, 1, 1,
0.4667219, -0.4645744, 3.627934, 1, 0, 0, 1, 1,
0.467057, -0.04705897, 1.790043, 0, 0, 0, 1, 1,
0.4712434, -1.449854, 1.193549, 0, 0, 0, 1, 1,
0.4782916, 1.481244, 1.111757, 0, 0, 0, 1, 1,
0.4808432, -1.461782, 3.070851, 0, 0, 0, 1, 1,
0.4824616, 0.192744, 2.055822, 0, 0, 0, 1, 1,
0.4826281, 0.7925631, -1.056475, 0, 0, 0, 1, 1,
0.4837793, -0.4194429, 2.560925, 0, 0, 0, 1, 1,
0.4888171, -0.2523998, 1.378936, 1, 1, 1, 1, 1,
0.4923112, 0.6706892, -0.1991307, 1, 1, 1, 1, 1,
0.4923477, 1.634714, -1.932484, 1, 1, 1, 1, 1,
0.492851, 0.7113462, -1.688605, 1, 1, 1, 1, 1,
0.4946475, -1.378854, 4.13181, 1, 1, 1, 1, 1,
0.4973785, 0.8194358, 0.1654442, 1, 1, 1, 1, 1,
0.5008754, 0.1627601, 0.6539608, 1, 1, 1, 1, 1,
0.5048149, -0.9651769, 3.350564, 1, 1, 1, 1, 1,
0.5130824, 0.9310484, -0.1184051, 1, 1, 1, 1, 1,
0.5170157, 0.8180028, -0.3711765, 1, 1, 1, 1, 1,
0.5231296, -1.080219, 1.222985, 1, 1, 1, 1, 1,
0.5233477, -1.561505, 1.084776, 1, 1, 1, 1, 1,
0.5234339, -1.315478, 2.439282, 1, 1, 1, 1, 1,
0.536879, 0.8238688, 0.591725, 1, 1, 1, 1, 1,
0.5380188, -1.520602, 2.462548, 1, 1, 1, 1, 1,
0.5381864, 0.2582934, 1.778945, 0, 0, 1, 1, 1,
0.5399725, 0.3378041, 1.878833, 1, 0, 0, 1, 1,
0.5426241, 0.1430717, 0.7886744, 1, 0, 0, 1, 1,
0.5428427, 0.1216164, 0.7633353, 1, 0, 0, 1, 1,
0.549626, 0.2352272, 0.4467532, 1, 0, 0, 1, 1,
0.552615, 0.2013821, 2.29164, 1, 0, 0, 1, 1,
0.5564712, -0.3277567, 3.873824, 0, 0, 0, 1, 1,
0.5600016, 1.30308, 0.8152784, 0, 0, 0, 1, 1,
0.560145, 0.6613872, -1.872209, 0, 0, 0, 1, 1,
0.5603551, 0.8831761, 2.036601, 0, 0, 0, 1, 1,
0.5612744, -0.8447074, 3.213588, 0, 0, 0, 1, 1,
0.5620458, 0.4051083, 0.1626414, 0, 0, 0, 1, 1,
0.5632286, -1.475632, 1.550828, 0, 0, 0, 1, 1,
0.5665793, 0.2205347, 0.6764399, 1, 1, 1, 1, 1,
0.5667166, -0.006290383, 0.8442907, 1, 1, 1, 1, 1,
0.5683367, -0.7726299, 2.155862, 1, 1, 1, 1, 1,
0.5738432, -1.638227, 3.567423, 1, 1, 1, 1, 1,
0.5740469, 0.621063, 0.3059573, 1, 1, 1, 1, 1,
0.5772692, -0.8309003, 1.580227, 1, 1, 1, 1, 1,
0.5808961, -0.7582355, 2.019942, 1, 1, 1, 1, 1,
0.5861969, -0.3219084, 3.136834, 1, 1, 1, 1, 1,
0.5866593, 0.2826721, 1.576412, 1, 1, 1, 1, 1,
0.5898751, 1.155347, -0.636471, 1, 1, 1, 1, 1,
0.5900907, 0.1114369, 3.714993, 1, 1, 1, 1, 1,
0.5928153, -0.6215374, 2.952877, 1, 1, 1, 1, 1,
0.5930957, 0.6851029, 0.5819573, 1, 1, 1, 1, 1,
0.5941197, 1.195988, -0.2027944, 1, 1, 1, 1, 1,
0.6030904, 1.663958, 0.8288468, 1, 1, 1, 1, 1,
0.6046699, 1.153429, -1.923947, 0, 0, 1, 1, 1,
0.6067904, 0.4716834, 1.624851, 1, 0, 0, 1, 1,
0.6086023, 2.779578, -0.2874565, 1, 0, 0, 1, 1,
0.6108506, 1.071198, 0.729175, 1, 0, 0, 1, 1,
0.6115591, -0.7666447, 3.030237, 1, 0, 0, 1, 1,
0.6226639, 1.379932, 1.89058, 1, 0, 0, 1, 1,
0.6239104, 0.2142266, 4.03351, 0, 0, 0, 1, 1,
0.6263062, 0.5146566, 2.651228, 0, 0, 0, 1, 1,
0.6290982, 1.785926, -1.167533, 0, 0, 0, 1, 1,
0.6327566, -0.6256369, 3.718153, 0, 0, 0, 1, 1,
0.6355225, 0.4442996, 1.245904, 0, 0, 0, 1, 1,
0.6362615, -0.6640552, 3.823981, 0, 0, 0, 1, 1,
0.6413835, -1.173997, 3.165306, 0, 0, 0, 1, 1,
0.6424602, 2.409261, -1.020207, 1, 1, 1, 1, 1,
0.6444829, -1.572515, 3.458656, 1, 1, 1, 1, 1,
0.6452181, -1.132757, 3.028492, 1, 1, 1, 1, 1,
0.6482092, -1.65668, 1.762332, 1, 1, 1, 1, 1,
0.653763, 0.06775638, 0.3751497, 1, 1, 1, 1, 1,
0.6585779, 0.5108858, 2.531143, 1, 1, 1, 1, 1,
0.6610613, 2.376966, -0.2188427, 1, 1, 1, 1, 1,
0.6643846, -0.9726213, 2.227601, 1, 1, 1, 1, 1,
0.6669724, 0.6924651, -0.6556749, 1, 1, 1, 1, 1,
0.6688319, 0.02238244, 1.522491, 1, 1, 1, 1, 1,
0.6736347, -0.1220452, 1.207813, 1, 1, 1, 1, 1,
0.6745382, 0.4600411, -0.1599066, 1, 1, 1, 1, 1,
0.6753443, 1.11652, 0.03320698, 1, 1, 1, 1, 1,
0.6761074, 0.05001242, 0.07862794, 1, 1, 1, 1, 1,
0.6771407, 1.903942, 1.029664, 1, 1, 1, 1, 1,
0.6781572, 0.8625838, 1.723322, 0, 0, 1, 1, 1,
0.6808643, -0.1680697, 1.425748, 1, 0, 0, 1, 1,
0.6855334, -0.7492692, 2.419599, 1, 0, 0, 1, 1,
0.6881696, -1.626789, 3.029543, 1, 0, 0, 1, 1,
0.692673, -0.6465005, 3.171245, 1, 0, 0, 1, 1,
0.6999121, 0.02935886, 0.2119772, 1, 0, 0, 1, 1,
0.7004967, 1.432584, -0.829702, 0, 0, 0, 1, 1,
0.7018557, 0.5933808, 1.497285, 0, 0, 0, 1, 1,
0.7119631, 0.0217654, 0.02700339, 0, 0, 0, 1, 1,
0.71572, 1.89245, 1.047863, 0, 0, 0, 1, 1,
0.7241893, 0.2174047, 1.066253, 0, 0, 0, 1, 1,
0.7267888, 1.296015, 0.1105051, 0, 0, 0, 1, 1,
0.731509, -1.786657, 1.299347, 0, 0, 0, 1, 1,
0.73153, 1.629385, 0.1369728, 1, 1, 1, 1, 1,
0.739472, 0.4785015, 1.507461, 1, 1, 1, 1, 1,
0.7418117, 0.822197, 1.01071, 1, 1, 1, 1, 1,
0.7461975, 0.8195304, 1.944093, 1, 1, 1, 1, 1,
0.7466848, -0.5284646, 1.718359, 1, 1, 1, 1, 1,
0.7496222, 0.376489, 1.248007, 1, 1, 1, 1, 1,
0.7508092, 1.659606, 1.519395, 1, 1, 1, 1, 1,
0.7533122, 1.239009, -0.3937991, 1, 1, 1, 1, 1,
0.7538397, 0.006746608, -0.1547076, 1, 1, 1, 1, 1,
0.7546052, 1.741544, 0.1934193, 1, 1, 1, 1, 1,
0.7576351, 0.6787087, 1.157452, 1, 1, 1, 1, 1,
0.7576678, -1.854117, 2.064736, 1, 1, 1, 1, 1,
0.7614857, 1.609498, -0.1613986, 1, 1, 1, 1, 1,
0.7627825, -0.8628314, 3.337034, 1, 1, 1, 1, 1,
0.7630249, 0.8780234, 0.7917795, 1, 1, 1, 1, 1,
0.7633902, 0.6996146, 2.257732, 0, 0, 1, 1, 1,
0.7676806, -0.01662704, 1.117055, 1, 0, 0, 1, 1,
0.7681274, 0.1394809, 0.7540227, 1, 0, 0, 1, 1,
0.7716947, 0.003693242, 1.870027, 1, 0, 0, 1, 1,
0.7780942, 0.01367089, 3.26617, 1, 0, 0, 1, 1,
0.7812539, 0.1104402, 2.953732, 1, 0, 0, 1, 1,
0.7812542, -0.8514761, 3.075365, 0, 0, 0, 1, 1,
0.7867244, 0.8558756, 0.3827698, 0, 0, 0, 1, 1,
0.7870786, -0.469043, 1.526962, 0, 0, 0, 1, 1,
0.7997732, 0.7603151, 0.7569411, 0, 0, 0, 1, 1,
0.8044369, -0.237233, 2.049834, 0, 0, 0, 1, 1,
0.8070638, 1.352167, -1.501794, 0, 0, 0, 1, 1,
0.8084337, -1.16018, 4.120487, 0, 0, 0, 1, 1,
0.813255, -0.6320066, 2.370092, 1, 1, 1, 1, 1,
0.8165042, -0.6291403, 1.622049, 1, 1, 1, 1, 1,
0.8165898, 0.2805573, 2.40306, 1, 1, 1, 1, 1,
0.8196822, -0.2674409, 2.801528, 1, 1, 1, 1, 1,
0.8199486, 1.044492, 1.842193, 1, 1, 1, 1, 1,
0.8268045, -0.2238324, 2.664742, 1, 1, 1, 1, 1,
0.8286982, -0.04637605, 1.871322, 1, 1, 1, 1, 1,
0.8309768, 1.169532, 1.337158, 1, 1, 1, 1, 1,
0.8469661, 1.431337, 1.000144, 1, 1, 1, 1, 1,
0.8746643, 0.2229891, 2.179214, 1, 1, 1, 1, 1,
0.8813196, 0.00978619, 0.1313848, 1, 1, 1, 1, 1,
0.881804, -1.68344, 2.394996, 1, 1, 1, 1, 1,
0.8929498, -0.4329503, 0.9735463, 1, 1, 1, 1, 1,
0.8939527, -0.6192937, 1.229611, 1, 1, 1, 1, 1,
0.8965641, -0.1810489, 3.491639, 1, 1, 1, 1, 1,
0.9097352, 0.1514829, 1.03723, 0, 0, 1, 1, 1,
0.9138454, 0.4020416, 0.2497894, 1, 0, 0, 1, 1,
0.914587, 0.7077848, 1.767165, 1, 0, 0, 1, 1,
0.9148386, -0.5642837, 1.82126, 1, 0, 0, 1, 1,
0.9161826, -1.202311, 3.751693, 1, 0, 0, 1, 1,
0.9182253, -0.6490039, 2.561893, 1, 0, 0, 1, 1,
0.9222398, 0.3720953, 2.1436, 0, 0, 0, 1, 1,
0.9229551, 0.5706676, 0.6537817, 0, 0, 0, 1, 1,
0.9245183, -1.384887, 0.9461804, 0, 0, 0, 1, 1,
0.9245835, 0.6962327, 1.279039, 0, 0, 0, 1, 1,
0.9274737, -0.5733126, 2.656476, 0, 0, 0, 1, 1,
0.9287587, -0.6458192, 4.025821, 0, 0, 0, 1, 1,
0.9301123, -0.6371824, 1.337652, 0, 0, 0, 1, 1,
0.9315453, 0.1405013, 0.2725749, 1, 1, 1, 1, 1,
0.9384205, -0.6903173, 2.163111, 1, 1, 1, 1, 1,
0.9423237, -0.1508955, 0.6180401, 1, 1, 1, 1, 1,
0.9432249, 0.145762, 2.60547, 1, 1, 1, 1, 1,
0.9523453, 0.4074841, 1.164701, 1, 1, 1, 1, 1,
0.9561081, 0.2431281, 0.1989942, 1, 1, 1, 1, 1,
0.9608362, -0.01267413, 2.081228, 1, 1, 1, 1, 1,
0.965551, 0.4205794, 0.6192324, 1, 1, 1, 1, 1,
0.9668314, -0.1719573, 1.538217, 1, 1, 1, 1, 1,
0.9671052, 1.220666, -0.06163501, 1, 1, 1, 1, 1,
0.9683835, -1.614269, 1.150824, 1, 1, 1, 1, 1,
0.977974, -1.196618, 1.698937, 1, 1, 1, 1, 1,
0.9795939, 1.603457, -0.4433137, 1, 1, 1, 1, 1,
0.9811074, 1.618994, 0.6075816, 1, 1, 1, 1, 1,
0.9934456, 1.233403, -0.9757612, 1, 1, 1, 1, 1,
0.9973035, -1.077054, 2.337431, 0, 0, 1, 1, 1,
1.006109, 0.5099587, -0.8646936, 1, 0, 0, 1, 1,
1.006839, 1.859274, 1.241224, 1, 0, 0, 1, 1,
1.010667, -0.3756435, 3.023101, 1, 0, 0, 1, 1,
1.014099, 1.468683, -0.5862149, 1, 0, 0, 1, 1,
1.015233, -0.04679811, 2.396378, 1, 0, 0, 1, 1,
1.019028, 0.009628124, 1.724673, 0, 0, 0, 1, 1,
1.032158, 0.06422178, 1.935977, 0, 0, 0, 1, 1,
1.040272, 0.4936935, 1.023444, 0, 0, 0, 1, 1,
1.040919, -0.6388183, 1.567971, 0, 0, 0, 1, 1,
1.041871, 0.8765716, 1.589797, 0, 0, 0, 1, 1,
1.042993, -0.7154305, 3.007655, 0, 0, 0, 1, 1,
1.043255, -0.6801051, 3.928684, 0, 0, 0, 1, 1,
1.047905, 0.4644385, 1.889316, 1, 1, 1, 1, 1,
1.052676, -0.480209, 1.242199, 1, 1, 1, 1, 1,
1.058567, 1.680738, 2.62175, 1, 1, 1, 1, 1,
1.066357, 1.193358, 0.8505806, 1, 1, 1, 1, 1,
1.070392, -0.5513584, 3.142084, 1, 1, 1, 1, 1,
1.089186, 0.4968013, 0.2955725, 1, 1, 1, 1, 1,
1.090186, 0.3965043, 0.6994252, 1, 1, 1, 1, 1,
1.109079, -0.8182904, 2.913084, 1, 1, 1, 1, 1,
1.114227, -0.1726259, 1.458268, 1, 1, 1, 1, 1,
1.114671, 0.2037801, -1.339409, 1, 1, 1, 1, 1,
1.130958, 0.004862268, 2.950471, 1, 1, 1, 1, 1,
1.149048, 0.4280884, 1.94393, 1, 1, 1, 1, 1,
1.152558, 0.220345, 2.594425, 1, 1, 1, 1, 1,
1.152864, -1.70208, 2.564905, 1, 1, 1, 1, 1,
1.155946, 0.6174622, 0.1997345, 1, 1, 1, 1, 1,
1.162061, 0.308825, 0.05335707, 0, 0, 1, 1, 1,
1.164991, -1.162407, 2.987741, 1, 0, 0, 1, 1,
1.165492, 0.3631378, 2.609367, 1, 0, 0, 1, 1,
1.17113, -0.9941224, 1.619542, 1, 0, 0, 1, 1,
1.176944, -0.8402522, 3.538663, 1, 0, 0, 1, 1,
1.178264, 1.050597, 0.7019941, 1, 0, 0, 1, 1,
1.178983, 0.88618, -0.3544056, 0, 0, 0, 1, 1,
1.179764, 1.521095, 0.9000539, 0, 0, 0, 1, 1,
1.181725, -1.166762, 4.138695, 0, 0, 0, 1, 1,
1.184799, 1.154585, 0.3680856, 0, 0, 0, 1, 1,
1.192587, -1.034828, 3.685333, 0, 0, 0, 1, 1,
1.193157, 0.4151133, 1.055086, 0, 0, 0, 1, 1,
1.201145, -0.3386445, 2.420626, 0, 0, 0, 1, 1,
1.2049, 0.3974486, 1.431059, 1, 1, 1, 1, 1,
1.211744, 0.2635226, 3.709322, 1, 1, 1, 1, 1,
1.217112, 0.353842, 1.160492, 1, 1, 1, 1, 1,
1.219517, -1.598229, 2.471408, 1, 1, 1, 1, 1,
1.225994, -1.102873, 4.371924, 1, 1, 1, 1, 1,
1.226989, 0.6313319, 1.752664, 1, 1, 1, 1, 1,
1.228062, 0.07039318, 1.053901, 1, 1, 1, 1, 1,
1.231357, -0.40562, 3.677648, 1, 1, 1, 1, 1,
1.236057, 0.554525, 0.2091766, 1, 1, 1, 1, 1,
1.236544, 1.652068, 0.3420762, 1, 1, 1, 1, 1,
1.240293, 1.465513, 0.03527412, 1, 1, 1, 1, 1,
1.24408, 1.8403, 0.8206987, 1, 1, 1, 1, 1,
1.245112, 0.3067171, 0.2679432, 1, 1, 1, 1, 1,
1.255223, 0.08574123, 1.173151, 1, 1, 1, 1, 1,
1.256806, -0.298948, 2.394841, 1, 1, 1, 1, 1,
1.257612, 1.239142, -1.369567, 0, 0, 1, 1, 1,
1.262848, -0.1182902, 2.702214, 1, 0, 0, 1, 1,
1.265966, -1.246277, 0.8363109, 1, 0, 0, 1, 1,
1.266763, 1.044779, 1.866583, 1, 0, 0, 1, 1,
1.267931, -0.1987379, 2.530896, 1, 0, 0, 1, 1,
1.271159, 1.717122, 1.801629, 1, 0, 0, 1, 1,
1.274613, 0.9453098, -0.4964868, 0, 0, 0, 1, 1,
1.281579, 0.5529533, 1.387408, 0, 0, 0, 1, 1,
1.286619, -0.8779274, 2.198548, 0, 0, 0, 1, 1,
1.308373, -0.4881679, 2.666655, 0, 0, 0, 1, 1,
1.309706, 1.099677, 0.002227869, 0, 0, 0, 1, 1,
1.312859, -0.4864956, 3.530094, 0, 0, 0, 1, 1,
1.313062, -0.1292566, 1.297169, 0, 0, 0, 1, 1,
1.313072, -1.346319, 2.70038, 1, 1, 1, 1, 1,
1.314179, -0.211827, -0.2030665, 1, 1, 1, 1, 1,
1.319665, 1.468824, 1.56475, 1, 1, 1, 1, 1,
1.324822, -0.7682914, 1.420734, 1, 1, 1, 1, 1,
1.329448, 0.3289645, 1.813141, 1, 1, 1, 1, 1,
1.335527, 0.641248, 0.4822399, 1, 1, 1, 1, 1,
1.337462, -0.1495353, 2.977111, 1, 1, 1, 1, 1,
1.339502, 1.436522, 1.173719, 1, 1, 1, 1, 1,
1.344624, 0.4655889, 1.026406, 1, 1, 1, 1, 1,
1.387495, 0.9349856, 1.412631, 1, 1, 1, 1, 1,
1.394616, 0.5406592, 1.082232, 1, 1, 1, 1, 1,
1.397738, -0.1242563, 1.428033, 1, 1, 1, 1, 1,
1.402409, -0.08183218, 1.859284, 1, 1, 1, 1, 1,
1.412415, 0.7003474, 1.15853, 1, 1, 1, 1, 1,
1.41537, 1.391635, 0.8452212, 1, 1, 1, 1, 1,
1.427739, -2.620955, 3.01543, 0, 0, 1, 1, 1,
1.431993, -0.269957, 1.915432, 1, 0, 0, 1, 1,
1.439986, 0.8037705, -0.1496682, 1, 0, 0, 1, 1,
1.443873, 0.8501116, 0.6040483, 1, 0, 0, 1, 1,
1.44785, -0.7823758, 2.593666, 1, 0, 0, 1, 1,
1.460671, -0.3992215, 0.5122879, 1, 0, 0, 1, 1,
1.498281, 0.607015, 3.460479, 0, 0, 0, 1, 1,
1.523335, -0.263029, 0.781956, 0, 0, 0, 1, 1,
1.5243, 0.691, 2.532325, 0, 0, 0, 1, 1,
1.539274, -0.0714485, 2.062429, 0, 0, 0, 1, 1,
1.543038, -0.6289591, 2.913117, 0, 0, 0, 1, 1,
1.543608, 0.5893607, 2.251473, 0, 0, 0, 1, 1,
1.559154, 0.8800393, 0.5785715, 0, 0, 0, 1, 1,
1.581983, 0.6599616, 0.1374792, 1, 1, 1, 1, 1,
1.593236, 0.2092075, 0.8491536, 1, 1, 1, 1, 1,
1.605403, 1.68942, 2.336664, 1, 1, 1, 1, 1,
1.606125, -0.290405, 0.6471291, 1, 1, 1, 1, 1,
1.608882, 0.6894562, 2.772407, 1, 1, 1, 1, 1,
1.623077, 0.2305037, 1.801732, 1, 1, 1, 1, 1,
1.632381, 1.382712, 0.5795532, 1, 1, 1, 1, 1,
1.640251, -1.107528, 1.562732, 1, 1, 1, 1, 1,
1.64528, 0.2033329, 0.01545789, 1, 1, 1, 1, 1,
1.661908, -0.2541305, 1.439273, 1, 1, 1, 1, 1,
1.685382, 2.315402, 1.908719, 1, 1, 1, 1, 1,
1.690437, -0.9203823, 2.061582, 1, 1, 1, 1, 1,
1.739804, -1.190929, 2.488211, 1, 1, 1, 1, 1,
1.741721, 0.1410895, 1.983947, 1, 1, 1, 1, 1,
1.750996, -0.02536858, 1.826695, 1, 1, 1, 1, 1,
1.756396, 0.3756101, 2.421064, 0, 0, 1, 1, 1,
1.759976, -0.4301426, 0.8341103, 1, 0, 0, 1, 1,
1.773848, 0.9926963, 1.064093, 1, 0, 0, 1, 1,
1.775094, 0.6378388, 0.9516413, 1, 0, 0, 1, 1,
1.792131, 0.8550375, 1.06264, 1, 0, 0, 1, 1,
1.793369, 0.7898928, 0.5027949, 1, 0, 0, 1, 1,
1.807382, -0.6528201, 1.101113, 0, 0, 0, 1, 1,
1.811302, 1.133301, 0.3985551, 0, 0, 0, 1, 1,
1.812193, 1.385285, 1.182199, 0, 0, 0, 1, 1,
1.812375, -0.3099309, -0.2783923, 0, 0, 0, 1, 1,
1.821743, 0.01938734, 1.478247, 0, 0, 0, 1, 1,
1.821758, 0.01011428, 3.917872, 0, 0, 0, 1, 1,
1.843678, 0.333007, 0.8150426, 0, 0, 0, 1, 1,
1.853797, 1.253438, 2.332786, 1, 1, 1, 1, 1,
1.859248, 1.439437, 2.048493, 1, 1, 1, 1, 1,
1.859801, -0.9399296, 3.666514, 1, 1, 1, 1, 1,
1.891839, 1.181974, 1.551751, 1, 1, 1, 1, 1,
1.906242, 0.4115459, -0.3927146, 1, 1, 1, 1, 1,
1.906695, 1.475708, 1.862282, 1, 1, 1, 1, 1,
1.914692, -0.07563324, 0.06192043, 1, 1, 1, 1, 1,
1.965327, -0.05198549, 1.754058, 1, 1, 1, 1, 1,
1.995332, -0.7844976, 1.708032, 1, 1, 1, 1, 1,
2.057297, 0.08398591, 1.061907, 1, 1, 1, 1, 1,
2.061532, -0.606218, 0.4280029, 1, 1, 1, 1, 1,
2.062025, -0.9868779, 1.784672, 1, 1, 1, 1, 1,
2.103938, 1.238869, 1.229526, 1, 1, 1, 1, 1,
2.107168, 0.3433416, 2.025952, 1, 1, 1, 1, 1,
2.184221, -0.6145801, 1.976412, 1, 1, 1, 1, 1,
2.189341, -0.9562246, 2.125077, 0, 0, 1, 1, 1,
2.200249, 0.1557106, 2.144326, 1, 0, 0, 1, 1,
2.214486, -2.546385, 1.960267, 1, 0, 0, 1, 1,
2.251852, -1.118803, 2.7081, 1, 0, 0, 1, 1,
2.265585, 0.0127441, -0.8600355, 1, 0, 0, 1, 1,
2.269165, 1.418131, 0.01818315, 1, 0, 0, 1, 1,
2.27381, 0.06895834, -0.5666082, 0, 0, 0, 1, 1,
2.284848, -1.046292, 2.21387, 0, 0, 0, 1, 1,
2.31324, 1.421811, 2.23653, 0, 0, 0, 1, 1,
2.33918, -0.7678343, 0.7071763, 0, 0, 0, 1, 1,
2.357287, 2.757139, 0.8218307, 0, 0, 0, 1, 1,
2.366622, 2.038825, -0.3280017, 0, 0, 0, 1, 1,
2.408912, 0.6431559, 2.82127, 0, 0, 0, 1, 1,
2.409856, -0.2220892, 0.7943845, 1, 1, 1, 1, 1,
2.436739, -0.4212759, 1.294266, 1, 1, 1, 1, 1,
2.439797, -0.166786, 0.8294103, 1, 1, 1, 1, 1,
2.444689, 0.7056303, 0.7350016, 1, 1, 1, 1, 1,
2.681737, -1.282431, 2.201651, 1, 1, 1, 1, 1,
2.726908, -0.7641555, 2.238029, 1, 1, 1, 1, 1,
3.225854, -1.373105, 2.987737, 1, 1, 1, 1, 1
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
var radius = 9.401972;
var distance = 33.02402;
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
mvMatrix.translate( 0.03419256, -0.04820323, 0.00685811 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.02402);
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