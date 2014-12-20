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
-3.280889, -1.38364, -2.107754, 1, 0, 0, 1,
-3.213552, -0.06522315, -3.206191, 1, 0.007843138, 0, 1,
-3.190751, 0.1805712, -0.2960882, 1, 0.01176471, 0, 1,
-3.027585, 1.566542, -0.4857644, 1, 0.01960784, 0, 1,
-2.739127, -0.313296, -0.8865501, 1, 0.02352941, 0, 1,
-2.716893, -0.5316393, -1.63404, 1, 0.03137255, 0, 1,
-2.662909, -1.050671, -2.291787, 1, 0.03529412, 0, 1,
-2.651193, -1.471747, -0.5468528, 1, 0.04313726, 0, 1,
-2.61633, 0.05555447, 0.1809594, 1, 0.04705882, 0, 1,
-2.457555, -0.5610987, -2.645601, 1, 0.05490196, 0, 1,
-2.453138, -0.5551201, -0.4638348, 1, 0.05882353, 0, 1,
-2.408312, 0.191633, -1.217929, 1, 0.06666667, 0, 1,
-2.318292, 1.831877, -1.023248, 1, 0.07058824, 0, 1,
-2.283329, -0.07773619, -1.421244, 1, 0.07843138, 0, 1,
-2.22441, -0.2761075, -2.304413, 1, 0.08235294, 0, 1,
-2.207036, -1.315415, -1.173267, 1, 0.09019608, 0, 1,
-2.206847, -0.2718935, -2.478719, 1, 0.09411765, 0, 1,
-2.15771, 0.4276709, -1.640297, 1, 0.1019608, 0, 1,
-2.119553, -0.6216623, -1.50741, 1, 0.1098039, 0, 1,
-2.10713, 1.615489, -2.142678, 1, 0.1137255, 0, 1,
-2.099578, 0.7098221, -3.51255, 1, 0.1215686, 0, 1,
-2.075011, -0.5530933, -1.549675, 1, 0.1254902, 0, 1,
-2.038063, -0.5088407, -1.241134, 1, 0.1333333, 0, 1,
-2.033749, 0.3259216, -1.796942, 1, 0.1372549, 0, 1,
-2.022821, -0.7298301, -2.32241, 1, 0.145098, 0, 1,
-2.017302, 0.0461736, -1.639229, 1, 0.1490196, 0, 1,
-1.986135, -0.5627288, -1.628968, 1, 0.1568628, 0, 1,
-1.956073, -0.1744882, -2.172053, 1, 0.1607843, 0, 1,
-1.952295, 0.2761041, -2.257513, 1, 0.1686275, 0, 1,
-1.922879, 1.638648, 0.08063654, 1, 0.172549, 0, 1,
-1.918634, -0.7693138, -2.328795, 1, 0.1803922, 0, 1,
-1.909009, 1.2954, -0.2680649, 1, 0.1843137, 0, 1,
-1.898103, -0.8487327, -2.420001, 1, 0.1921569, 0, 1,
-1.889741, -2.405477, -2.211434, 1, 0.1960784, 0, 1,
-1.821844, 1.184789, -1.914223, 1, 0.2039216, 0, 1,
-1.781931, 0.08438877, -0.2690052, 1, 0.2117647, 0, 1,
-1.75265, 0.1150549, -1.416658, 1, 0.2156863, 0, 1,
-1.737827, -1.012926, -1.467974, 1, 0.2235294, 0, 1,
-1.731614, -0.6375493, -2.515931, 1, 0.227451, 0, 1,
-1.72321, -0.06282872, -1.829897, 1, 0.2352941, 0, 1,
-1.704796, -0.06609557, -1.295753, 1, 0.2392157, 0, 1,
-1.703625, 0.720401, -0.5475298, 1, 0.2470588, 0, 1,
-1.698585, 2.256284, -1.373939, 1, 0.2509804, 0, 1,
-1.688518, 0.2045701, -2.831486, 1, 0.2588235, 0, 1,
-1.659865, 2.074077, -0.1680235, 1, 0.2627451, 0, 1,
-1.656523, 1.068684, -2.415242, 1, 0.2705882, 0, 1,
-1.646467, -0.05044495, -0.6696262, 1, 0.2745098, 0, 1,
-1.640711, -0.06575175, -0.08017724, 1, 0.282353, 0, 1,
-1.614743, 0.4061525, -1.212867, 1, 0.2862745, 0, 1,
-1.611148, -0.5363994, -0.9675436, 1, 0.2941177, 0, 1,
-1.606217, 0.4176572, 0.3605407, 1, 0.3019608, 0, 1,
-1.576816, -0.1130397, -0.9657701, 1, 0.3058824, 0, 1,
-1.571355, -0.0295845, -0.494301, 1, 0.3137255, 0, 1,
-1.547655, 0.1724427, -0.5773875, 1, 0.3176471, 0, 1,
-1.537929, -0.4348433, -0.9932595, 1, 0.3254902, 0, 1,
-1.534102, 0.2361779, -1.476984, 1, 0.3294118, 0, 1,
-1.520449, 0.2828138, -1.028259, 1, 0.3372549, 0, 1,
-1.518589, -0.1201507, -1.887703, 1, 0.3411765, 0, 1,
-1.512781, -1.209643, -1.388246, 1, 0.3490196, 0, 1,
-1.477565, 2.712418, 2.061155, 1, 0.3529412, 0, 1,
-1.475205, 0.77852, -1.411559, 1, 0.3607843, 0, 1,
-1.461025, -0.324269, -2.15984, 1, 0.3647059, 0, 1,
-1.460375, 1.274623, -1.404211, 1, 0.372549, 0, 1,
-1.450514, -1.652601, -1.340834, 1, 0.3764706, 0, 1,
-1.440373, 1.058887, -0.7202135, 1, 0.3843137, 0, 1,
-1.43463, -0.2483453, -1.829126, 1, 0.3882353, 0, 1,
-1.425998, 0.05696265, -3.162618, 1, 0.3960784, 0, 1,
-1.42361, 1.041091, -1.501101, 1, 0.4039216, 0, 1,
-1.412982, -1.061376, -3.58149, 1, 0.4078431, 0, 1,
-1.409273, -1.278018, -3.231994, 1, 0.4156863, 0, 1,
-1.396636, 0.7498032, -0.9969239, 1, 0.4196078, 0, 1,
-1.392463, 1.589448, -0.4712469, 1, 0.427451, 0, 1,
-1.387028, -0.6143236, -2.166131, 1, 0.4313726, 0, 1,
-1.375772, -1.259048, -1.838252, 1, 0.4392157, 0, 1,
-1.349154, 1.338871, 0.251877, 1, 0.4431373, 0, 1,
-1.342047, -0.281881, -1.833846, 1, 0.4509804, 0, 1,
-1.330353, 0.7072828, -0.4087845, 1, 0.454902, 0, 1,
-1.323122, -0.4386589, -1.364523, 1, 0.4627451, 0, 1,
-1.320561, -0.5509837, -1.34199, 1, 0.4666667, 0, 1,
-1.304139, 0.1852675, -1.632914, 1, 0.4745098, 0, 1,
-1.2965, -0.7265552, -1.296195, 1, 0.4784314, 0, 1,
-1.290802, 0.5087593, -1.67619, 1, 0.4862745, 0, 1,
-1.288847, -1.602512, -2.071937, 1, 0.4901961, 0, 1,
-1.286641, -1.083956, -2.714525, 1, 0.4980392, 0, 1,
-1.284655, -0.8071334, -2.033828, 1, 0.5058824, 0, 1,
-1.276155, -0.1363542, -1.435383, 1, 0.509804, 0, 1,
-1.269895, 1.207501, -0.8361052, 1, 0.5176471, 0, 1,
-1.252308, -0.4654444, -0.4110709, 1, 0.5215687, 0, 1,
-1.247326, 0.63089, -2.548962, 1, 0.5294118, 0, 1,
-1.230748, -1.416471, -2.350536, 1, 0.5333334, 0, 1,
-1.225417, 0.1633286, -2.304379, 1, 0.5411765, 0, 1,
-1.215065, 0.9703352, -0.9776388, 1, 0.5450981, 0, 1,
-1.212454, 1.450619, -1.508268, 1, 0.5529412, 0, 1,
-1.212337, 1.400057, 0.7754309, 1, 0.5568628, 0, 1,
-1.20598, -0.5177633, -0.9443793, 1, 0.5647059, 0, 1,
-1.204068, 0.6893644, -3.549995, 1, 0.5686275, 0, 1,
-1.203288, -0.2130298, -2.935563, 1, 0.5764706, 0, 1,
-1.20253, 0.612634, -0.3008251, 1, 0.5803922, 0, 1,
-1.202306, 1.878894, -2.015558, 1, 0.5882353, 0, 1,
-1.199926, -0.3096378, -1.356248, 1, 0.5921569, 0, 1,
-1.196877, 1.016082, -0.9454717, 1, 0.6, 0, 1,
-1.189264, 0.5953242, -0.3513413, 1, 0.6078432, 0, 1,
-1.183694, -0.6334852, -1.935269, 1, 0.6117647, 0, 1,
-1.183297, 0.02765845, -0.748484, 1, 0.6196079, 0, 1,
-1.179293, -0.8506059, -2.030675, 1, 0.6235294, 0, 1,
-1.172752, 0.1410227, -0.5147076, 1, 0.6313726, 0, 1,
-1.165665, 0.001744814, -0.6322761, 1, 0.6352941, 0, 1,
-1.161902, -0.4550887, -2.730042, 1, 0.6431373, 0, 1,
-1.154573, -0.5833927, -1.967502, 1, 0.6470588, 0, 1,
-1.142702, -0.8004578, -1.328822, 1, 0.654902, 0, 1,
-1.140464, 0.07123036, -0.5537794, 1, 0.6588235, 0, 1,
-1.133931, 0.328156, -1.196533, 1, 0.6666667, 0, 1,
-1.118166, -0.3875435, 0.2040519, 1, 0.6705883, 0, 1,
-1.115044, 0.3768802, -0.6988836, 1, 0.6784314, 0, 1,
-1.113492, 1.420779, -1.55886, 1, 0.682353, 0, 1,
-1.111019, -0.6800748, 0.6731303, 1, 0.6901961, 0, 1,
-1.109891, 0.9374307, -0.4791815, 1, 0.6941177, 0, 1,
-1.10806, 0.7628846, -1.234043, 1, 0.7019608, 0, 1,
-1.10382, -1.228806, -3.593692, 1, 0.7098039, 0, 1,
-1.103694, 1.104284, -0.107304, 1, 0.7137255, 0, 1,
-1.089853, -1.312462, -3.544372, 1, 0.7215686, 0, 1,
-1.088681, -0.5470256, -2.335563, 1, 0.7254902, 0, 1,
-1.084483, -0.1902751, -3.65967, 1, 0.7333333, 0, 1,
-1.082543, -0.2389637, -2.449218, 1, 0.7372549, 0, 1,
-1.081638, 0.4257799, -1.434213, 1, 0.7450981, 0, 1,
-1.079647, 0.6825637, -1.276589, 1, 0.7490196, 0, 1,
-1.064975, 0.3314768, -1.371892, 1, 0.7568628, 0, 1,
-1.064171, -0.2190588, -1.044703, 1, 0.7607843, 0, 1,
-1.052693, -0.9741144, -1.706245, 1, 0.7686275, 0, 1,
-1.045709, -0.2072408, -2.530377, 1, 0.772549, 0, 1,
-1.043851, -1.100059, -1.182444, 1, 0.7803922, 0, 1,
-1.030618, -0.2993599, -1.488804, 1, 0.7843137, 0, 1,
-1.030532, -0.4803342, -2.986116, 1, 0.7921569, 0, 1,
-1.021682, -1.604909, -2.695292, 1, 0.7960784, 0, 1,
-1.02132, -1.053295, -0.1235863, 1, 0.8039216, 0, 1,
-1.00161, -0.6574566, -2.191518, 1, 0.8117647, 0, 1,
-1.000801, -0.8380732, -2.66493, 1, 0.8156863, 0, 1,
-0.9978635, 0.03296241, -0.2577964, 1, 0.8235294, 0, 1,
-0.9960767, 0.5178058, -1.481462, 1, 0.827451, 0, 1,
-0.9909409, -0.03313982, -1.513964, 1, 0.8352941, 0, 1,
-0.9882054, 0.4754443, -1.094294, 1, 0.8392157, 0, 1,
-0.9857707, -1.638223, -1.759792, 1, 0.8470588, 0, 1,
-0.9809623, 0.5209315, -0.799069, 1, 0.8509804, 0, 1,
-0.9748418, 0.4641775, -1.59203, 1, 0.8588235, 0, 1,
-0.9690794, -0.3367433, -2.430364, 1, 0.8627451, 0, 1,
-0.9599775, -0.7788275, -2.946666, 1, 0.8705882, 0, 1,
-0.9595655, 1.843351, -1.312726, 1, 0.8745098, 0, 1,
-0.9565679, -0.02878009, -1.360588, 1, 0.8823529, 0, 1,
-0.95596, 0.6565758, -1.949466, 1, 0.8862745, 0, 1,
-0.9452685, 0.2747156, -2.16453, 1, 0.8941177, 0, 1,
-0.9444025, -0.0385963, -0.991389, 1, 0.8980392, 0, 1,
-0.9360949, -0.3724044, -0.6594845, 1, 0.9058824, 0, 1,
-0.9282451, 0.9349067, 0.7898791, 1, 0.9137255, 0, 1,
-0.9185296, 0.2479057, -0.8657865, 1, 0.9176471, 0, 1,
-0.9168797, -0.6551489, -0.7443692, 1, 0.9254902, 0, 1,
-0.9159796, -0.3913983, -1.90777, 1, 0.9294118, 0, 1,
-0.9077284, -1.054227, -1.483177, 1, 0.9372549, 0, 1,
-0.9019405, 0.3488167, -2.42104, 1, 0.9411765, 0, 1,
-0.9018961, 0.6514485, -0.4615081, 1, 0.9490196, 0, 1,
-0.9011981, 0.1468223, -0.1986559, 1, 0.9529412, 0, 1,
-0.8950021, 0.4053313, -1.670928, 1, 0.9607843, 0, 1,
-0.8941596, -0.4815065, -1.543315, 1, 0.9647059, 0, 1,
-0.8940775, -0.6732641, -1.883278, 1, 0.972549, 0, 1,
-0.8935182, -1.00194, -1.997955, 1, 0.9764706, 0, 1,
-0.8933581, -1.792691, -2.10439, 1, 0.9843137, 0, 1,
-0.8827819, 0.6803743, 0.2806542, 1, 0.9882353, 0, 1,
-0.8826862, -1.285614, -3.337406, 1, 0.9960784, 0, 1,
-0.8750784, 0.419421, -1.461123, 0.9960784, 1, 0, 1,
-0.8666954, 0.08713001, -0.473741, 0.9921569, 1, 0, 1,
-0.8602241, 1.358086, 1.322338, 0.9843137, 1, 0, 1,
-0.8560095, 2.147094, -0.552708, 0.9803922, 1, 0, 1,
-0.8481908, 1.695543, 0.003037172, 0.972549, 1, 0, 1,
-0.8463876, -1.094548, -3.078895, 0.9686275, 1, 0, 1,
-0.8436767, -0.05953946, -0.9587537, 0.9607843, 1, 0, 1,
-0.8409586, 2.299856, 0.4652722, 0.9568627, 1, 0, 1,
-0.8381937, 1.163442, -2.392612, 0.9490196, 1, 0, 1,
-0.8368719, 0.2393642, -3.705841, 0.945098, 1, 0, 1,
-0.8363473, -0.7247955, -2.142524, 0.9372549, 1, 0, 1,
-0.8351279, -0.214542, -4.043115, 0.9333333, 1, 0, 1,
-0.8320748, 0.09925298, -1.285941, 0.9254902, 1, 0, 1,
-0.8312392, -0.666128, -3.705559, 0.9215686, 1, 0, 1,
-0.8306172, 0.5368615, -3.093954, 0.9137255, 1, 0, 1,
-0.8305227, -1.062412, -0.02978642, 0.9098039, 1, 0, 1,
-0.8281931, 0.7755522, -0.09020402, 0.9019608, 1, 0, 1,
-0.8263936, -0.07839406, -0.7692125, 0.8941177, 1, 0, 1,
-0.8259852, -0.3203792, -0.8886611, 0.8901961, 1, 0, 1,
-0.8244525, 2.940552, -0.9200163, 0.8823529, 1, 0, 1,
-0.8227049, 0.4843774, -0.5728512, 0.8784314, 1, 0, 1,
-0.8078856, 0.0525937, -2.061323, 0.8705882, 1, 0, 1,
-0.8021936, 0.7480088, -0.4744137, 0.8666667, 1, 0, 1,
-0.8008303, 1.353998, -0.07883137, 0.8588235, 1, 0, 1,
-0.8004234, 0.7257296, -0.2136618, 0.854902, 1, 0, 1,
-0.8000542, -0.7019591, -1.828483, 0.8470588, 1, 0, 1,
-0.7946262, 1.593418, -1.611457, 0.8431373, 1, 0, 1,
-0.7943013, -0.7923099, -3.677898, 0.8352941, 1, 0, 1,
-0.7915996, 0.3678495, -1.571567, 0.8313726, 1, 0, 1,
-0.7869664, -2.608485, -3.440876, 0.8235294, 1, 0, 1,
-0.7860013, 1.374478, -1.109248, 0.8196079, 1, 0, 1,
-0.7854581, 0.120409, -1.637047, 0.8117647, 1, 0, 1,
-0.7772433, 0.6484866, -0.33883, 0.8078431, 1, 0, 1,
-0.7757406, 0.3323461, 1.26886, 0.8, 1, 0, 1,
-0.7708683, -0.3079477, -1.378082, 0.7921569, 1, 0, 1,
-0.7685843, -1.138674, -3.426153, 0.7882353, 1, 0, 1,
-0.761628, 1.104444, -0.5249361, 0.7803922, 1, 0, 1,
-0.7611848, 1.52547, 0.3921752, 0.7764706, 1, 0, 1,
-0.7611505, 1.544039, -0.1272811, 0.7686275, 1, 0, 1,
-0.7548063, -1.208414, -2.767791, 0.7647059, 1, 0, 1,
-0.7514783, 1.341749, -0.2372531, 0.7568628, 1, 0, 1,
-0.7498792, -1.916555, -2.255803, 0.7529412, 1, 0, 1,
-0.7438831, -0.5730569, -1.822728, 0.7450981, 1, 0, 1,
-0.7404464, 1.702676, -0.6936488, 0.7411765, 1, 0, 1,
-0.7397242, -1.167157, -2.740959, 0.7333333, 1, 0, 1,
-0.7381042, 0.4371013, -2.374972, 0.7294118, 1, 0, 1,
-0.7364633, -0.373372, -2.610461, 0.7215686, 1, 0, 1,
-0.7338696, 0.9208515, -0.1525232, 0.7176471, 1, 0, 1,
-0.7330182, -0.2137188, -0.4134958, 0.7098039, 1, 0, 1,
-0.7314684, -1.05923, -2.19792, 0.7058824, 1, 0, 1,
-0.7274127, 1.274921, -0.2652078, 0.6980392, 1, 0, 1,
-0.7252801, 0.4303839, -1.549318, 0.6901961, 1, 0, 1,
-0.723929, -0.4635699, -2.598419, 0.6862745, 1, 0, 1,
-0.7195968, -0.8324025, -1.65354, 0.6784314, 1, 0, 1,
-0.7171742, 1.114988, 0.6395775, 0.6745098, 1, 0, 1,
-0.7064008, -0.9102114, -4.458485, 0.6666667, 1, 0, 1,
-0.7053621, 0.3407151, -0.3750309, 0.6627451, 1, 0, 1,
-0.7020051, -0.5371585, -2.158773, 0.654902, 1, 0, 1,
-0.7019489, -0.04576431, -2.259223, 0.6509804, 1, 0, 1,
-0.6980077, 0.2895424, -1.59089, 0.6431373, 1, 0, 1,
-0.6851156, 0.9597677, -0.7369889, 0.6392157, 1, 0, 1,
-0.6809242, 0.7281113, -0.7229136, 0.6313726, 1, 0, 1,
-0.6772184, 0.4352371, -1.680269, 0.627451, 1, 0, 1,
-0.6765682, 0.409249, -1.719249, 0.6196079, 1, 0, 1,
-0.6739095, 0.1547474, -0.6127077, 0.6156863, 1, 0, 1,
-0.672156, 0.6660529, 1.06943, 0.6078432, 1, 0, 1,
-0.6712283, 0.9707201, -1.239075, 0.6039216, 1, 0, 1,
-0.6708256, -0.1522279, -0.96492, 0.5960785, 1, 0, 1,
-0.6683643, -0.2531466, -2.122973, 0.5882353, 1, 0, 1,
-0.6628965, 0.1717272, -1.219542, 0.5843138, 1, 0, 1,
-0.6563694, -0.8707533, -2.645433, 0.5764706, 1, 0, 1,
-0.6530682, 0.8139169, 0.3897967, 0.572549, 1, 0, 1,
-0.6529198, 0.05178534, -2.133075, 0.5647059, 1, 0, 1,
-0.6435544, 0.3936467, -0.5801864, 0.5607843, 1, 0, 1,
-0.6429393, -0.03810148, 0.5529819, 0.5529412, 1, 0, 1,
-0.6396955, -0.8711603, -1.686487, 0.5490196, 1, 0, 1,
-0.6369432, 0.02668068, -2.246571, 0.5411765, 1, 0, 1,
-0.636779, -0.1257891, -1.248147, 0.5372549, 1, 0, 1,
-0.6337801, -0.05881877, -1.46009, 0.5294118, 1, 0, 1,
-0.6229487, 2.136322, -0.3000848, 0.5254902, 1, 0, 1,
-0.6198753, 0.1472648, -1.760166, 0.5176471, 1, 0, 1,
-0.6186764, -1.587614, -3.15066, 0.5137255, 1, 0, 1,
-0.6153795, -0.9137655, -3.33086, 0.5058824, 1, 0, 1,
-0.6087924, 1.229154, 0.4219479, 0.5019608, 1, 0, 1,
-0.600774, -0.4138017, -2.218978, 0.4941176, 1, 0, 1,
-0.5985958, -0.005190221, -3.184081, 0.4862745, 1, 0, 1,
-0.594034, 0.3146992, -2.769514, 0.4823529, 1, 0, 1,
-0.5920244, -1.410162, -2.353681, 0.4745098, 1, 0, 1,
-0.5900459, -0.4789362, -0.7807598, 0.4705882, 1, 0, 1,
-0.5876873, 0.6952538, -0.3704387, 0.4627451, 1, 0, 1,
-0.584512, -0.4225913, -2.72975, 0.4588235, 1, 0, 1,
-0.5841799, 0.3519881, 0.8617795, 0.4509804, 1, 0, 1,
-0.5828018, -0.07895927, -2.970862, 0.4470588, 1, 0, 1,
-0.5776481, 0.4643303, 0.865101, 0.4392157, 1, 0, 1,
-0.5774906, 0.2022051, -1.849212, 0.4352941, 1, 0, 1,
-0.5768434, -0.5075732, -3.235326, 0.427451, 1, 0, 1,
-0.5757132, -2.435936, -3.55221, 0.4235294, 1, 0, 1,
-0.5737937, 0.3846743, -0.1917745, 0.4156863, 1, 0, 1,
-0.5701946, 0.7438887, -1.863953, 0.4117647, 1, 0, 1,
-0.5692795, -0.8369229, -1.231136, 0.4039216, 1, 0, 1,
-0.568145, -0.4902736, -1.980543, 0.3960784, 1, 0, 1,
-0.5561227, -0.5267556, -2.567589, 0.3921569, 1, 0, 1,
-0.5539444, 1.403217, -0.40286, 0.3843137, 1, 0, 1,
-0.5494069, 0.02746484, -3.665437, 0.3803922, 1, 0, 1,
-0.5491487, -0.631587, -1.921559, 0.372549, 1, 0, 1,
-0.5485852, 1.448279, 0.5418209, 0.3686275, 1, 0, 1,
-0.5476027, 1.112504, -0.4842263, 0.3607843, 1, 0, 1,
-0.5429301, 1.056354, -0.4782234, 0.3568628, 1, 0, 1,
-0.5398197, -0.1565346, -3.086763, 0.3490196, 1, 0, 1,
-0.538131, -0.683546, -1.394197, 0.345098, 1, 0, 1,
-0.5316294, 0.553721, -0.2031088, 0.3372549, 1, 0, 1,
-0.5248387, -0.6864578, -1.692812, 0.3333333, 1, 0, 1,
-0.5241412, 0.4361378, -0.5169399, 0.3254902, 1, 0, 1,
-0.5147886, -0.5457658, -3.529322, 0.3215686, 1, 0, 1,
-0.5103638, 0.9791313, -0.2636072, 0.3137255, 1, 0, 1,
-0.5098615, -2.493232, -3.351439, 0.3098039, 1, 0, 1,
-0.5090367, -1.337786, -4.710074, 0.3019608, 1, 0, 1,
-0.507759, -0.04951442, -2.434922, 0.2941177, 1, 0, 1,
-0.5064693, -1.388423, -2.866687, 0.2901961, 1, 0, 1,
-0.5021151, -0.370036, -3.329053, 0.282353, 1, 0, 1,
-0.4964226, 1.306887, -0.1243216, 0.2784314, 1, 0, 1,
-0.4963082, -1.512989, -2.707092, 0.2705882, 1, 0, 1,
-0.4962031, 2.107623, -0.8340628, 0.2666667, 1, 0, 1,
-0.4928784, 0.4346631, -0.1740118, 0.2588235, 1, 0, 1,
-0.4906699, -0.2778243, -0.4575616, 0.254902, 1, 0, 1,
-0.4893374, -1.883655, -3.1887, 0.2470588, 1, 0, 1,
-0.4816923, -0.6380071, -3.907306, 0.2431373, 1, 0, 1,
-0.4782124, -1.534941, -3.702438, 0.2352941, 1, 0, 1,
-0.4772136, 0.07134651, -2.259906, 0.2313726, 1, 0, 1,
-0.4749204, 0.2768847, -1.120872, 0.2235294, 1, 0, 1,
-0.4732312, 0.2340683, -2.359892, 0.2196078, 1, 0, 1,
-0.4726228, -0.2495308, -2.084157, 0.2117647, 1, 0, 1,
-0.4711911, -0.6647493, -1.157316, 0.2078431, 1, 0, 1,
-0.4664962, -1.014072, -3.667603, 0.2, 1, 0, 1,
-0.4578285, 0.7837244, 0.9344421, 0.1921569, 1, 0, 1,
-0.4574195, -1.525807, -2.883183, 0.1882353, 1, 0, 1,
-0.4562511, 0.1055382, -1.827822, 0.1803922, 1, 0, 1,
-0.4488138, 0.5361031, -3.276589, 0.1764706, 1, 0, 1,
-0.4432488, 2.397189, 2.305866, 0.1686275, 1, 0, 1,
-0.4381278, 0.5422135, -0.9624016, 0.1647059, 1, 0, 1,
-0.4248336, -1.544275, -1.575208, 0.1568628, 1, 0, 1,
-0.4245357, -0.4515353, -0.7107589, 0.1529412, 1, 0, 1,
-0.4235956, 1.650517, -0.6022249, 0.145098, 1, 0, 1,
-0.4156696, -0.01192131, -0.5012791, 0.1411765, 1, 0, 1,
-0.4121028, -1.959921, -3.210197, 0.1333333, 1, 0, 1,
-0.4094279, 0.04091806, -3.037372, 0.1294118, 1, 0, 1,
-0.4081684, -1.266306, -3.245813, 0.1215686, 1, 0, 1,
-0.4069972, 1.458885, 0.2633441, 0.1176471, 1, 0, 1,
-0.4056005, -0.06986739, 0.8210912, 0.1098039, 1, 0, 1,
-0.3982438, 0.8929106, -0.6904369, 0.1058824, 1, 0, 1,
-0.3887557, -0.1900423, -1.900294, 0.09803922, 1, 0, 1,
-0.3879677, 0.1748651, -0.9394078, 0.09019608, 1, 0, 1,
-0.3853091, -0.5115367, -4.233146, 0.08627451, 1, 0, 1,
-0.378316, 0.9987363, 0.2473962, 0.07843138, 1, 0, 1,
-0.3776179, -0.5370049, -2.797715, 0.07450981, 1, 0, 1,
-0.3760308, -0.2604769, -1.932686, 0.06666667, 1, 0, 1,
-0.3712106, 0.3730687, -0.8670166, 0.0627451, 1, 0, 1,
-0.3688489, -1.219438, -2.975832, 0.05490196, 1, 0, 1,
-0.3671742, -0.6211278, -1.785133, 0.05098039, 1, 0, 1,
-0.3631305, -0.6380916, -2.279161, 0.04313726, 1, 0, 1,
-0.3624002, 0.8973842, -1.632397, 0.03921569, 1, 0, 1,
-0.362216, 0.04836317, -2.660847, 0.03137255, 1, 0, 1,
-0.3605863, 1.890233, -1.584812, 0.02745098, 1, 0, 1,
-0.360512, -1.425292, -3.482257, 0.01960784, 1, 0, 1,
-0.3570998, 0.9886739, 0.04304151, 0.01568628, 1, 0, 1,
-0.3546653, -1.068948, -4.109055, 0.007843138, 1, 0, 1,
-0.3540518, -0.3206894, -1.731287, 0.003921569, 1, 0, 1,
-0.345798, -2.248874, -3.252557, 0, 1, 0.003921569, 1,
-0.3439077, 0.3397464, -0.6279175, 0, 1, 0.01176471, 1,
-0.3426407, 0.5863168, -0.274022, 0, 1, 0.01568628, 1,
-0.3408241, -0.21153, -0.6565453, 0, 1, 0.02352941, 1,
-0.3403963, 0.4348543, -2.157501, 0, 1, 0.02745098, 1,
-0.3401559, -0.6722016, -2.659308, 0, 1, 0.03529412, 1,
-0.3395994, 0.2805289, -2.955034, 0, 1, 0.03921569, 1,
-0.3382767, 1.171813, 0.1893126, 0, 1, 0.04705882, 1,
-0.3381967, 0.9779339, -2.247042, 0, 1, 0.05098039, 1,
-0.3346768, -0.2240437, -1.730572, 0, 1, 0.05882353, 1,
-0.3289669, -0.510457, -2.236003, 0, 1, 0.0627451, 1,
-0.3279608, 1.058494, -1.596744, 0, 1, 0.07058824, 1,
-0.3262336, 0.716956, -0.437107, 0, 1, 0.07450981, 1,
-0.3222121, -0.467669, -1.947662, 0, 1, 0.08235294, 1,
-0.321443, 0.4541065, -1.255372, 0, 1, 0.08627451, 1,
-0.3171687, -1.028034, -3.012485, 0, 1, 0.09411765, 1,
-0.316842, -1.286674, -2.656842, 0, 1, 0.1019608, 1,
-0.314676, 0.7264277, -0.5786984, 0, 1, 0.1058824, 1,
-0.3111498, 0.357372, -0.5106567, 0, 1, 0.1137255, 1,
-0.3089424, -0.8989305, -3.639609, 0, 1, 0.1176471, 1,
-0.3064924, 0.6831002, -0.2439613, 0, 1, 0.1254902, 1,
-0.3051761, 0.1671183, -1.007167, 0, 1, 0.1294118, 1,
-0.3034113, -1.152168, -4.896839, 0, 1, 0.1372549, 1,
-0.3025738, -0.3418127, -3.875915, 0, 1, 0.1411765, 1,
-0.3004519, 0.8832624, -1.216241, 0, 1, 0.1490196, 1,
-0.2985365, -1.78839, -1.999103, 0, 1, 0.1529412, 1,
-0.2940397, -0.9519746, -3.168642, 0, 1, 0.1607843, 1,
-0.2913282, -0.314139, -1.653832, 0, 1, 0.1647059, 1,
-0.2902413, -1.449485, -2.461028, 0, 1, 0.172549, 1,
-0.2872462, 1.150825, -0.3688827, 0, 1, 0.1764706, 1,
-0.2842911, -0.360366, -0.9921041, 0, 1, 0.1843137, 1,
-0.2785381, -0.02153094, -2.920936, 0, 1, 0.1882353, 1,
-0.2767942, 1.660051, -0.5645958, 0, 1, 0.1960784, 1,
-0.2749313, -0.3355144, -1.75416, 0, 1, 0.2039216, 1,
-0.2747929, -0.006963086, -0.2093125, 0, 1, 0.2078431, 1,
-0.2746344, -0.6886637, -3.17069, 0, 1, 0.2156863, 1,
-0.2718376, 0.03421976, 0.19262, 0, 1, 0.2196078, 1,
-0.26904, -1.428245, -4.488896, 0, 1, 0.227451, 1,
-0.2639366, -1.665088, -2.88409, 0, 1, 0.2313726, 1,
-0.2568082, -0.5330942, -4.52863, 0, 1, 0.2392157, 1,
-0.2546357, -0.2657142, -1.326376, 0, 1, 0.2431373, 1,
-0.2544437, -0.03658472, -2.492419, 0, 1, 0.2509804, 1,
-0.2481354, 0.4697028, 0.5206057, 0, 1, 0.254902, 1,
-0.2464504, -0.0452197, -1.077106, 0, 1, 0.2627451, 1,
-0.2461943, 1.600551, -0.5409756, 0, 1, 0.2666667, 1,
-0.2458926, -0.9833559, -0.9290021, 0, 1, 0.2745098, 1,
-0.2445433, 0.9036642, -0.5532315, 0, 1, 0.2784314, 1,
-0.2437901, -1.285077, -2.823406, 0, 1, 0.2862745, 1,
-0.2433928, -0.645776, -1.753937, 0, 1, 0.2901961, 1,
-0.2374526, 0.8458642, -0.2874056, 0, 1, 0.2980392, 1,
-0.2356257, 0.1420981, -1.62225, 0, 1, 0.3058824, 1,
-0.2353984, 0.8339089, 1.524722, 0, 1, 0.3098039, 1,
-0.2235174, -0.3655877, -0.8662079, 0, 1, 0.3176471, 1,
-0.2200912, -1.754841, -2.140439, 0, 1, 0.3215686, 1,
-0.2198976, 2.193436, 1.409496, 0, 1, 0.3294118, 1,
-0.216768, -0.5623711, -2.593335, 0, 1, 0.3333333, 1,
-0.2143004, 0.08344611, 0.01118132, 0, 1, 0.3411765, 1,
-0.2132188, 0.7201123, -1.076447, 0, 1, 0.345098, 1,
-0.2123336, -0.4259732, -3.249117, 0, 1, 0.3529412, 1,
-0.2066484, -0.4714945, -0.8279804, 0, 1, 0.3568628, 1,
-0.2028103, -0.5459179, -3.036419, 0, 1, 0.3647059, 1,
-0.198764, 1.002444, -1.512578, 0, 1, 0.3686275, 1,
-0.1985395, -1.02185, -1.976073, 0, 1, 0.3764706, 1,
-0.1974497, -0.01091466, -0.6366792, 0, 1, 0.3803922, 1,
-0.1969966, -2.223792, -3.313644, 0, 1, 0.3882353, 1,
-0.1951202, 1.845583, -0.6049403, 0, 1, 0.3921569, 1,
-0.1942206, 0.1612283, 0.758373, 0, 1, 0.4, 1,
-0.1904141, -0.06798203, -1.106088, 0, 1, 0.4078431, 1,
-0.181389, 1.384161, 0.9553645, 0, 1, 0.4117647, 1,
-0.1768286, 1.773723, 1.27849, 0, 1, 0.4196078, 1,
-0.174061, 0.6057006, -0.7718961, 0, 1, 0.4235294, 1,
-0.1739681, 0.9055412, -0.357777, 0, 1, 0.4313726, 1,
-0.168854, 0.8870265, 0.019964, 0, 1, 0.4352941, 1,
-0.1662231, 1.444347, 0.4140338, 0, 1, 0.4431373, 1,
-0.1643217, -1.533406, -3.559223, 0, 1, 0.4470588, 1,
-0.1633515, 0.3061315, 0.1485691, 0, 1, 0.454902, 1,
-0.1620534, 1.318586, -0.4130965, 0, 1, 0.4588235, 1,
-0.1616777, 0.5903665, 0.4994017, 0, 1, 0.4666667, 1,
-0.1609915, -0.0890213, -0.8635614, 0, 1, 0.4705882, 1,
-0.151621, 0.9735475, -2.706593, 0, 1, 0.4784314, 1,
-0.149434, 0.2528259, -0.5170985, 0, 1, 0.4823529, 1,
-0.1489088, 0.8481997, -1.339287, 0, 1, 0.4901961, 1,
-0.1474527, 1.124602, 0.4185225, 0, 1, 0.4941176, 1,
-0.1458253, 1.362063, 1.485406, 0, 1, 0.5019608, 1,
-0.1442513, -0.5952221, -3.677478, 0, 1, 0.509804, 1,
-0.1430642, -0.3547677, -3.242124, 0, 1, 0.5137255, 1,
-0.1410115, 0.03545895, -2.607922, 0, 1, 0.5215687, 1,
-0.140702, -0.02535835, -1.781903, 0, 1, 0.5254902, 1,
-0.138753, -0.1987579, -3.723089, 0, 1, 0.5333334, 1,
-0.1379898, -1.263881, -4.135963, 0, 1, 0.5372549, 1,
-0.1367098, -0.2076278, -1.446093, 0, 1, 0.5450981, 1,
-0.1322039, 1.028317, -0.1864664, 0, 1, 0.5490196, 1,
-0.1299536, -1.024568, -2.63329, 0, 1, 0.5568628, 1,
-0.1294111, -1.342325, -3.342077, 0, 1, 0.5607843, 1,
-0.1271567, 0.6121088, 0.5427426, 0, 1, 0.5686275, 1,
-0.1235982, 0.02728479, -0.5944237, 0, 1, 0.572549, 1,
-0.1215758, 0.2737697, -0.5447502, 0, 1, 0.5803922, 1,
-0.1180106, 1.0259, -0.9081042, 0, 1, 0.5843138, 1,
-0.1093529, -1.994409, -1.90208, 0, 1, 0.5921569, 1,
-0.1031266, 0.272353, -0.07902369, 0, 1, 0.5960785, 1,
-0.1024746, 0.9478188, -1.269814, 0, 1, 0.6039216, 1,
-0.1019341, -0.9241031, -3.397141, 0, 1, 0.6117647, 1,
-0.1011563, -0.576376, -2.455544, 0, 1, 0.6156863, 1,
-0.09149076, 1.128869, 0.1544109, 0, 1, 0.6235294, 1,
-0.08898373, 0.4648805, -2.207093, 0, 1, 0.627451, 1,
-0.08240483, -1.319283, -1.638495, 0, 1, 0.6352941, 1,
-0.08022898, 0.2864478, 0.8584439, 0, 1, 0.6392157, 1,
-0.07758634, 0.08220779, -0.1345248, 0, 1, 0.6470588, 1,
-0.07102386, 1.429924, -0.245808, 0, 1, 0.6509804, 1,
-0.0695437, 1.221263, 1.721132, 0, 1, 0.6588235, 1,
-0.06481129, -0.7084734, -2.230957, 0, 1, 0.6627451, 1,
-0.06451155, 0.3261541, -0.9932972, 0, 1, 0.6705883, 1,
-0.05966146, -1.631822, -1.670735, 0, 1, 0.6745098, 1,
-0.05869567, 0.1907967, 0.1892251, 0, 1, 0.682353, 1,
-0.05769042, -0.6517023, -2.606158, 0, 1, 0.6862745, 1,
-0.05479345, 0.5765975, -0.408961, 0, 1, 0.6941177, 1,
-0.04896892, 0.7063104, 0.1788262, 0, 1, 0.7019608, 1,
-0.04414329, 0.07947323, -1.125237, 0, 1, 0.7058824, 1,
-0.04237508, -0.4373042, -3.018747, 0, 1, 0.7137255, 1,
-0.0331999, -0.4480184, -2.956788, 0, 1, 0.7176471, 1,
-0.03294387, -2.333381, -3.370584, 0, 1, 0.7254902, 1,
-0.03182951, 0.28986, -0.25519, 0, 1, 0.7294118, 1,
-0.02715684, -0.03252595, -3.437071, 0, 1, 0.7372549, 1,
-0.02109187, -1.047181, -3.651293, 0, 1, 0.7411765, 1,
-0.01780652, -0.3549207, -3.631282, 0, 1, 0.7490196, 1,
-0.01651959, 0.6534404, 0.3795264, 0, 1, 0.7529412, 1,
-0.01335982, -0.1005762, -3.161812, 0, 1, 0.7607843, 1,
-0.01225205, -0.9464715, -2.258885, 0, 1, 0.7647059, 1,
-0.01213321, 1.000669, 0.1974982, 0, 1, 0.772549, 1,
-0.01197659, 0.3465017, -0.3466349, 0, 1, 0.7764706, 1,
-0.01183992, 0.6997822, -0.6128246, 0, 1, 0.7843137, 1,
-0.01043586, -0.2942631, -3.40666, 0, 1, 0.7882353, 1,
-0.009394376, 0.1743013, 0.977643, 0, 1, 0.7960784, 1,
-0.006933457, -1.329423, -2.304439, 0, 1, 0.8039216, 1,
-0.004255863, -0.2095867, -2.699382, 0, 1, 0.8078431, 1,
-0.003884105, 0.1310482, -1.351124, 0, 1, 0.8156863, 1,
-0.003343073, -0.6045166, -2.495808, 0, 1, 0.8196079, 1,
-0.002034157, 0.4297713, -0.576769, 0, 1, 0.827451, 1,
0.00123835, -0.304271, 3.759474, 0, 1, 0.8313726, 1,
0.003161107, 1.608896, -0.1346775, 0, 1, 0.8392157, 1,
0.01037545, 2.38678, -0.0701407, 0, 1, 0.8431373, 1,
0.01156381, 1.531906, 1.293885, 0, 1, 0.8509804, 1,
0.01274697, 0.6165541, 1.274303, 0, 1, 0.854902, 1,
0.01393779, -1.288303, 2.272039, 0, 1, 0.8627451, 1,
0.01573874, 0.03371289, 0.8053049, 0, 1, 0.8666667, 1,
0.0163584, -0.2628979, 2.694951, 0, 1, 0.8745098, 1,
0.0187239, -1.018299, 3.365408, 0, 1, 0.8784314, 1,
0.02119237, 1.027448, -1.548039, 0, 1, 0.8862745, 1,
0.02492367, 0.4328679, 0.9374878, 0, 1, 0.8901961, 1,
0.02494702, -0.4623932, 3.289998, 0, 1, 0.8980392, 1,
0.03410299, 0.03201804, 1.058688, 0, 1, 0.9058824, 1,
0.03709118, 2.042964, -1.18637, 0, 1, 0.9098039, 1,
0.03719028, -1.317095, 3.360394, 0, 1, 0.9176471, 1,
0.03731949, 1.834039, -0.2385401, 0, 1, 0.9215686, 1,
0.03837037, 1.467248, -3.921198, 0, 1, 0.9294118, 1,
0.0465016, -0.1307233, 2.66694, 0, 1, 0.9333333, 1,
0.04824118, -1.114838, 3.588826, 0, 1, 0.9411765, 1,
0.04978793, 1.513014, -0.3945783, 0, 1, 0.945098, 1,
0.05391377, 1.842667, -0.8135627, 0, 1, 0.9529412, 1,
0.05441572, -0.3173444, 3.397882, 0, 1, 0.9568627, 1,
0.05497075, 1.452636, -0.527003, 0, 1, 0.9647059, 1,
0.05661345, 1.272875, 1.531861, 0, 1, 0.9686275, 1,
0.05731647, -1.350746, 2.699705, 0, 1, 0.9764706, 1,
0.05752632, 0.8826373, 0.8657879, 0, 1, 0.9803922, 1,
0.06135548, -1.072632, 3.456229, 0, 1, 0.9882353, 1,
0.06204792, 0.5941261, -0.5015695, 0, 1, 0.9921569, 1,
0.06274176, 0.1425864, -0.3458962, 0, 1, 1, 1,
0.06288608, 0.8839748, 1.463936, 0, 0.9921569, 1, 1,
0.06361242, -0.05959733, 3.625356, 0, 0.9882353, 1, 1,
0.06982937, -0.4861301, 4.241297, 0, 0.9803922, 1, 1,
0.07063965, 0.04202196, 1.292611, 0, 0.9764706, 1, 1,
0.07259528, 0.5986565, -0.7388214, 0, 0.9686275, 1, 1,
0.07694064, -0.8769999, 3.085621, 0, 0.9647059, 1, 1,
0.0851753, -0.593479, 1.92849, 0, 0.9568627, 1, 1,
0.0853053, 0.7752534, 1.126441, 0, 0.9529412, 1, 1,
0.08683624, 1.540077, -0.8593308, 0, 0.945098, 1, 1,
0.08865724, -1.599254, 3.625714, 0, 0.9411765, 1, 1,
0.09002449, 1.472553, -0.6249663, 0, 0.9333333, 1, 1,
0.09148646, 0.3621009, 0.2415832, 0, 0.9294118, 1, 1,
0.09725116, 0.4332393, 1.494572, 0, 0.9215686, 1, 1,
0.09817604, -0.9287238, 3.346077, 0, 0.9176471, 1, 1,
0.0985259, 0.6241617, -1.345089, 0, 0.9098039, 1, 1,
0.09907519, 0.1386823, -0.7257994, 0, 0.9058824, 1, 1,
0.1010756, -0.2483747, 2.834123, 0, 0.8980392, 1, 1,
0.1022438, 0.1329157, 0.2541612, 0, 0.8901961, 1, 1,
0.1028876, 0.7704731, 0.6882358, 0, 0.8862745, 1, 1,
0.1032761, 1.283403, 0.5167004, 0, 0.8784314, 1, 1,
0.1037954, -0.6863501, 2.879318, 0, 0.8745098, 1, 1,
0.1059721, -0.4690757, 1.780726, 0, 0.8666667, 1, 1,
0.1068349, 0.5484673, 0.6714178, 0, 0.8627451, 1, 1,
0.10945, -0.5391743, 2.16186, 0, 0.854902, 1, 1,
0.1130499, 0.9888568, -1.355721, 0, 0.8509804, 1, 1,
0.1167251, -1.316534, 3.284432, 0, 0.8431373, 1, 1,
0.124794, 1.128618, -0.1466831, 0, 0.8392157, 1, 1,
0.128287, -0.439208, 3.221633, 0, 0.8313726, 1, 1,
0.1294166, -0.08516008, 2.176296, 0, 0.827451, 1, 1,
0.1324166, -0.1296172, 4.521725, 0, 0.8196079, 1, 1,
0.1324518, -0.4053979, 4.785108, 0, 0.8156863, 1, 1,
0.1347872, 0.8429822, -0.4323763, 0, 0.8078431, 1, 1,
0.1428201, -0.4505359, 2.605724, 0, 0.8039216, 1, 1,
0.1445788, -1.60005, 3.615897, 0, 0.7960784, 1, 1,
0.1478394, -0.8776723, 3.607182, 0, 0.7882353, 1, 1,
0.1483211, 1.7551, -0.9293413, 0, 0.7843137, 1, 1,
0.1490881, -0.1244975, 2.037042, 0, 0.7764706, 1, 1,
0.149775, 0.8026912, -2.317708, 0, 0.772549, 1, 1,
0.1498079, 0.7326937, 0.4507705, 0, 0.7647059, 1, 1,
0.1505499, 1.642349, 0.3143982, 0, 0.7607843, 1, 1,
0.1531265, -0.2194156, 2.733922, 0, 0.7529412, 1, 1,
0.1553858, 0.1621666, -1.205595, 0, 0.7490196, 1, 1,
0.1620427, 0.7660616, -0.7481746, 0, 0.7411765, 1, 1,
0.1635658, 0.726725, -0.1077253, 0, 0.7372549, 1, 1,
0.1670094, -0.4037675, 1.377992, 0, 0.7294118, 1, 1,
0.171754, -0.1930644, 2.040727, 0, 0.7254902, 1, 1,
0.173975, 0.1669301, 1.255468, 0, 0.7176471, 1, 1,
0.1752779, -0.7763339, 1.562698, 0, 0.7137255, 1, 1,
0.1788241, 0.008215679, 1.823929, 0, 0.7058824, 1, 1,
0.178978, -0.4562739, 2.220438, 0, 0.6980392, 1, 1,
0.1857516, 0.1496879, 2.898055, 0, 0.6941177, 1, 1,
0.1952456, 1.079169, -0.7506385, 0, 0.6862745, 1, 1,
0.1998331, 0.4676266, 1.060852, 0, 0.682353, 1, 1,
0.2006472, 1.060366, 2.278231, 0, 0.6745098, 1, 1,
0.2036851, -0.3640378, 0.8157692, 0, 0.6705883, 1, 1,
0.20429, -0.0731708, 2.497551, 0, 0.6627451, 1, 1,
0.2044931, -1.43231, 3.807779, 0, 0.6588235, 1, 1,
0.2059555, 1.480469, -1.713593, 0, 0.6509804, 1, 1,
0.2072771, 0.4618922, -0.2992287, 0, 0.6470588, 1, 1,
0.207992, 0.5136842, 0.7911015, 0, 0.6392157, 1, 1,
0.2131676, -1.185827, 5.579878, 0, 0.6352941, 1, 1,
0.2138645, 0.1927556, -0.04482085, 0, 0.627451, 1, 1,
0.2173519, 0.3205469, 2.573209, 0, 0.6235294, 1, 1,
0.2199766, 0.501617, 1.797309, 0, 0.6156863, 1, 1,
0.2216195, 0.472486, 0.6283256, 0, 0.6117647, 1, 1,
0.2240582, -0.4605387, 1.465697, 0, 0.6039216, 1, 1,
0.2252579, 1.33196, -1.593971, 0, 0.5960785, 1, 1,
0.2262569, -0.3325671, 2.733087, 0, 0.5921569, 1, 1,
0.2271619, 1.494841, 1.126669, 0, 0.5843138, 1, 1,
0.2289403, -0.8206816, 1.571738, 0, 0.5803922, 1, 1,
0.2297278, -0.1772649, 0.7612093, 0, 0.572549, 1, 1,
0.23485, 0.5931286, 1.188652, 0, 0.5686275, 1, 1,
0.2445905, 1.609462, -0.2992837, 0, 0.5607843, 1, 1,
0.2494269, -0.008810658, 2.277978, 0, 0.5568628, 1, 1,
0.2525656, 1.301745, 0.6990718, 0, 0.5490196, 1, 1,
0.2591005, 0.5552221, -2.744015, 0, 0.5450981, 1, 1,
0.2596609, -0.3014809, 3.971748, 0, 0.5372549, 1, 1,
0.2617351, -0.8241649, 2.186804, 0, 0.5333334, 1, 1,
0.2633584, 1.185282, -1.107716, 0, 0.5254902, 1, 1,
0.2647865, -1.063216, 4.498496, 0, 0.5215687, 1, 1,
0.2721626, -1.098264, 1.983831, 0, 0.5137255, 1, 1,
0.2744626, -0.114753, 2.211581, 0, 0.509804, 1, 1,
0.2745948, 0.4865247, -0.792443, 0, 0.5019608, 1, 1,
0.2774493, -0.2857575, 3.647933, 0, 0.4941176, 1, 1,
0.2779249, -0.1111894, 1.646747, 0, 0.4901961, 1, 1,
0.2785533, 0.9387169, -0.7883351, 0, 0.4823529, 1, 1,
0.2801932, 0.2742025, -0.4102436, 0, 0.4784314, 1, 1,
0.2813756, -0.8162624, 2.700033, 0, 0.4705882, 1, 1,
0.2815251, 0.9868506, 0.3503672, 0, 0.4666667, 1, 1,
0.2816135, 0.6871274, 0.2589325, 0, 0.4588235, 1, 1,
0.2824103, 0.02726794, 0.6027275, 0, 0.454902, 1, 1,
0.2830073, 0.4902067, -1.068573, 0, 0.4470588, 1, 1,
0.2871436, -1.069148, 1.58363, 0, 0.4431373, 1, 1,
0.2884426, 0.2336321, -0.09680594, 0, 0.4352941, 1, 1,
0.2893023, 0.3131354, 1.860096, 0, 0.4313726, 1, 1,
0.289653, -0.6675025, 2.990067, 0, 0.4235294, 1, 1,
0.2915885, 0.4917419, 0.3685059, 0, 0.4196078, 1, 1,
0.3017953, 0.6239544, -0.3256387, 0, 0.4117647, 1, 1,
0.3018135, 0.6973057, 2.090518, 0, 0.4078431, 1, 1,
0.3081236, -0.6402675, 2.058003, 0, 0.4, 1, 1,
0.3161661, 2.02793, 0.3302656, 0, 0.3921569, 1, 1,
0.3170638, 0.3262042, 1.168212, 0, 0.3882353, 1, 1,
0.3176266, -0.9897089, 2.253497, 0, 0.3803922, 1, 1,
0.3207865, 0.04819747, 1.86119, 0, 0.3764706, 1, 1,
0.3208901, 0.3612722, 1.026054, 0, 0.3686275, 1, 1,
0.3229464, -0.3699278, 3.476884, 0, 0.3647059, 1, 1,
0.3241797, 1.106977, -0.6860754, 0, 0.3568628, 1, 1,
0.3248775, 0.7321362, 1.603282, 0, 0.3529412, 1, 1,
0.3252488, -0.6913458, 2.28539, 0, 0.345098, 1, 1,
0.3255294, -0.6309064, 4.949414, 0, 0.3411765, 1, 1,
0.3281123, 0.8047759, 0.4953291, 0, 0.3333333, 1, 1,
0.3296042, -1.294054, 3.037115, 0, 0.3294118, 1, 1,
0.3312606, -0.2741967, 2.068122, 0, 0.3215686, 1, 1,
0.345417, 0.08118294, -0.07655933, 0, 0.3176471, 1, 1,
0.3480701, -0.3515563, 2.955809, 0, 0.3098039, 1, 1,
0.3535224, -0.2645602, 2.054062, 0, 0.3058824, 1, 1,
0.3565068, 0.5904466, -0.1202643, 0, 0.2980392, 1, 1,
0.356521, 0.2277894, 1.565307, 0, 0.2901961, 1, 1,
0.3566091, 0.4904959, 1.253318, 0, 0.2862745, 1, 1,
0.359337, 0.7291264, 1.766023, 0, 0.2784314, 1, 1,
0.3629377, 0.1210307, 1.259872, 0, 0.2745098, 1, 1,
0.3658268, -1.010453, 2.831044, 0, 0.2666667, 1, 1,
0.3672101, 3.08796, -1.069048, 0, 0.2627451, 1, 1,
0.3681174, -0.6344361, 1.782795, 0, 0.254902, 1, 1,
0.3719363, -0.4709691, 0.9228809, 0, 0.2509804, 1, 1,
0.3749079, 0.182087, 2.389117, 0, 0.2431373, 1, 1,
0.3757144, 0.2320056, 2.366688, 0, 0.2392157, 1, 1,
0.3823955, 0.9869156, 0.2237115, 0, 0.2313726, 1, 1,
0.3828851, 0.6625178, 0.1528244, 0, 0.227451, 1, 1,
0.3835325, 0.7908769, 1.662227, 0, 0.2196078, 1, 1,
0.3852901, 0.4003499, -0.04599254, 0, 0.2156863, 1, 1,
0.3868027, -0.1922249, 1.535869, 0, 0.2078431, 1, 1,
0.3886822, 1.780915, 2.567576, 0, 0.2039216, 1, 1,
0.3890139, 1.108582, -0.2609248, 0, 0.1960784, 1, 1,
0.3898012, 1.190862, -1.281676, 0, 0.1882353, 1, 1,
0.3911794, 0.1785061, 2.832017, 0, 0.1843137, 1, 1,
0.3926158, -0.5366821, 0.8841906, 0, 0.1764706, 1, 1,
0.3931473, 1.299273, 0.7199984, 0, 0.172549, 1, 1,
0.3951839, -0.2833728, 1.08179, 0, 0.1647059, 1, 1,
0.3956316, 0.1296284, 0.8755544, 0, 0.1607843, 1, 1,
0.3992825, -0.2106107, 2.10914, 0, 0.1529412, 1, 1,
0.4045569, -1.07095, 2.687634, 0, 0.1490196, 1, 1,
0.4264533, -1.367894, 2.956069, 0, 0.1411765, 1, 1,
0.4287421, -0.5433676, 2.854411, 0, 0.1372549, 1, 1,
0.4293547, -0.4685493, 0.08192819, 0, 0.1294118, 1, 1,
0.4454399, 1.008279, 0.2905553, 0, 0.1254902, 1, 1,
0.4500952, -0.01352855, 0.9667419, 0, 0.1176471, 1, 1,
0.4528834, -1.191444, 2.84859, 0, 0.1137255, 1, 1,
0.4563909, -0.56044, 2.988173, 0, 0.1058824, 1, 1,
0.4609411, -0.07765897, 3.301507, 0, 0.09803922, 1, 1,
0.4630001, -0.5815051, 2.503974, 0, 0.09411765, 1, 1,
0.464274, -1.552878, 3.403716, 0, 0.08627451, 1, 1,
0.4675076, 0.5919737, 1.384902, 0, 0.08235294, 1, 1,
0.467717, 0.947706, -0.07677586, 0, 0.07450981, 1, 1,
0.474574, -1.24764, 2.207538, 0, 0.07058824, 1, 1,
0.4747427, 0.8665467, -0.1496996, 0, 0.0627451, 1, 1,
0.4763937, -0.3414295, 3.904837, 0, 0.05882353, 1, 1,
0.4771561, 0.5930975, 0.1921546, 0, 0.05098039, 1, 1,
0.4778442, 0.4462647, 0.1185137, 0, 0.04705882, 1, 1,
0.4798049, -0.4237676, 1.97618, 0, 0.03921569, 1, 1,
0.4806681, 0.9520174, 1.484662, 0, 0.03529412, 1, 1,
0.4832581, 1.514764, 0.1170451, 0, 0.02745098, 1, 1,
0.48584, 0.1931719, -0.2440359, 0, 0.02352941, 1, 1,
0.4898606, 0.7268201, -0.2376729, 0, 0.01568628, 1, 1,
0.4909414, 0.787004, 0.1278547, 0, 0.01176471, 1, 1,
0.4923176, 0.4226637, 1.258665, 0, 0.003921569, 1, 1,
0.494215, 0.4132895, 1.506473, 0.003921569, 0, 1, 1,
0.4950739, 1.954075, 0.601583, 0.007843138, 0, 1, 1,
0.4983662, -0.200646, 0.4659151, 0.01568628, 0, 1, 1,
0.5025795, -1.151511, 4.673847, 0.01960784, 0, 1, 1,
0.5043721, 0.1077465, 1.916619, 0.02745098, 0, 1, 1,
0.5060397, 0.2769876, 3.289757, 0.03137255, 0, 1, 1,
0.5077813, 0.4378954, 1.714155, 0.03921569, 0, 1, 1,
0.5081111, 0.587823, -0.1317182, 0.04313726, 0, 1, 1,
0.5090809, -0.2493825, 0.173954, 0.05098039, 0, 1, 1,
0.5096549, 0.2126921, 1.224541, 0.05490196, 0, 1, 1,
0.5185909, 0.4140066, 0.7968949, 0.0627451, 0, 1, 1,
0.520149, 1.01789, 0.9243684, 0.06666667, 0, 1, 1,
0.5222551, 0.03618471, 0.6156391, 0.07450981, 0, 1, 1,
0.5227405, -0.08810943, 2.110191, 0.07843138, 0, 1, 1,
0.5267972, 0.2011595, -0.3263918, 0.08627451, 0, 1, 1,
0.5332223, -0.5616755, 1.062785, 0.09019608, 0, 1, 1,
0.5332741, -0.0835761, 1.16926, 0.09803922, 0, 1, 1,
0.5334431, 0.3539841, 1.099636, 0.1058824, 0, 1, 1,
0.5395331, -0.1291463, 1.396415, 0.1098039, 0, 1, 1,
0.5411671, -0.3662273, 4.629601, 0.1176471, 0, 1, 1,
0.5518602, 0.5344291, -0.5734802, 0.1215686, 0, 1, 1,
0.5552267, -0.4539939, 1.893036, 0.1294118, 0, 1, 1,
0.5579934, 0.5014871, 1.718495, 0.1333333, 0, 1, 1,
0.5586006, -1.636799, 1.942525, 0.1411765, 0, 1, 1,
0.5621572, -0.1006148, 0.5224619, 0.145098, 0, 1, 1,
0.5627974, 0.8813635, 0.310474, 0.1529412, 0, 1, 1,
0.5631418, -0.7083125, 3.658047, 0.1568628, 0, 1, 1,
0.5640605, -0.499436, 1.291004, 0.1647059, 0, 1, 1,
0.5650478, -0.8882859, 2.121502, 0.1686275, 0, 1, 1,
0.5720388, 1.099102, -3.020366, 0.1764706, 0, 1, 1,
0.5747496, -1.002312, 1.855131, 0.1803922, 0, 1, 1,
0.576163, 0.4237336, 1.057071, 0.1882353, 0, 1, 1,
0.5772819, 0.008634193, 2.30988, 0.1921569, 0, 1, 1,
0.5787051, 0.8644624, 1.378932, 0.2, 0, 1, 1,
0.5835803, -1.158361, 2.916542, 0.2078431, 0, 1, 1,
0.586122, 0.2549078, -1.893193, 0.2117647, 0, 1, 1,
0.5919849, 0.5827067, 0.6161491, 0.2196078, 0, 1, 1,
0.6039941, -0.06982671, 1.146949, 0.2235294, 0, 1, 1,
0.6064491, -0.3621443, 3.024899, 0.2313726, 0, 1, 1,
0.6065001, -0.5152866, 1.269421, 0.2352941, 0, 1, 1,
0.6068061, 1.049205, 1.278623, 0.2431373, 0, 1, 1,
0.6208439, -0.5397668, 1.288237, 0.2470588, 0, 1, 1,
0.6245397, 1.168704, -0.1302569, 0.254902, 0, 1, 1,
0.6277258, 0.5419364, -0.3299469, 0.2588235, 0, 1, 1,
0.6283631, 0.1429438, 2.411186, 0.2666667, 0, 1, 1,
0.6288224, 1.053598, 0.7718762, 0.2705882, 0, 1, 1,
0.6386938, -1.574325, 3.745669, 0.2784314, 0, 1, 1,
0.641741, 0.2844433, 1.198884, 0.282353, 0, 1, 1,
0.6429093, 2.85934, 0.9401437, 0.2901961, 0, 1, 1,
0.6460825, 1.404865, 2.454242, 0.2941177, 0, 1, 1,
0.6497293, 0.2533744, 0.3288092, 0.3019608, 0, 1, 1,
0.6527459, 0.3644816, 1.610632, 0.3098039, 0, 1, 1,
0.6596316, -0.06198189, 2.329887, 0.3137255, 0, 1, 1,
0.6639621, 0.4412399, -0.3746826, 0.3215686, 0, 1, 1,
0.671825, 0.8540944, -1.446437, 0.3254902, 0, 1, 1,
0.6751429, 0.6159424, 0.4305621, 0.3333333, 0, 1, 1,
0.6867914, -1.156226, 2.28826, 0.3372549, 0, 1, 1,
0.7014629, -0.2439477, 1.253069, 0.345098, 0, 1, 1,
0.7026143, -1.44504, 3.593606, 0.3490196, 0, 1, 1,
0.7036543, -0.8638355, 3.131741, 0.3568628, 0, 1, 1,
0.7118295, -0.9470509, 1.714662, 0.3607843, 0, 1, 1,
0.7177687, -0.5742352, 3.446636, 0.3686275, 0, 1, 1,
0.7190658, -0.9870781, 2.737916, 0.372549, 0, 1, 1,
0.7272113, 0.4911587, 1.23917, 0.3803922, 0, 1, 1,
0.7338962, 0.9859335, 3.34384, 0.3843137, 0, 1, 1,
0.7349131, 1.068059, -0.4595511, 0.3921569, 0, 1, 1,
0.7400984, 0.1342033, 0.5503861, 0.3960784, 0, 1, 1,
0.7444275, 0.04615385, 2.566123, 0.4039216, 0, 1, 1,
0.7459916, -0.7474952, 3.88285, 0.4117647, 0, 1, 1,
0.7462673, -2.194331, 3.7397, 0.4156863, 0, 1, 1,
0.7482358, 1.691722, 0.1702074, 0.4235294, 0, 1, 1,
0.7488275, 1.972121, -2.083287, 0.427451, 0, 1, 1,
0.7528622, -1.122688, 3.166444, 0.4352941, 0, 1, 1,
0.7582101, -0.2998559, 2.195013, 0.4392157, 0, 1, 1,
0.7656639, 1.139808, -0.6279793, 0.4470588, 0, 1, 1,
0.7658745, 1.225634, 1.100661, 0.4509804, 0, 1, 1,
0.7667707, 0.6299773, 2.714981, 0.4588235, 0, 1, 1,
0.770479, -0.6963357, 2.994438, 0.4627451, 0, 1, 1,
0.7711179, -0.3681984, 2.670549, 0.4705882, 0, 1, 1,
0.7724503, -1.665312, 2.072028, 0.4745098, 0, 1, 1,
0.7740953, -0.3030682, 3.676312, 0.4823529, 0, 1, 1,
0.7751867, 0.9755525, 1.479083, 0.4862745, 0, 1, 1,
0.7813546, -0.9995634, 2.796901, 0.4941176, 0, 1, 1,
0.7824358, -0.05556535, -1.44428, 0.5019608, 0, 1, 1,
0.782898, 0.3442282, 0.561404, 0.5058824, 0, 1, 1,
0.7871334, 0.3579834, 2.709176, 0.5137255, 0, 1, 1,
0.7911469, 1.482343, 1.402586, 0.5176471, 0, 1, 1,
0.7917342, -0.04526516, 3.146778, 0.5254902, 0, 1, 1,
0.7959882, 0.7119102, 1.182897, 0.5294118, 0, 1, 1,
0.7965679, -0.4066967, 1.862112, 0.5372549, 0, 1, 1,
0.7980431, 0.4316403, 0.3586714, 0.5411765, 0, 1, 1,
0.799637, 2.397928, 0.4129822, 0.5490196, 0, 1, 1,
0.8005317, 0.7877851, 0.5523629, 0.5529412, 0, 1, 1,
0.8008554, 0.01445218, 0.722111, 0.5607843, 0, 1, 1,
0.8058903, 0.8234527, 1.057826, 0.5647059, 0, 1, 1,
0.806282, -0.09117592, 1.846692, 0.572549, 0, 1, 1,
0.8093141, 0.6765571, 3.167002, 0.5764706, 0, 1, 1,
0.811129, 0.4807859, 0.3445192, 0.5843138, 0, 1, 1,
0.8127884, -2.027926, 2.453142, 0.5882353, 0, 1, 1,
0.8156549, -0.05340519, 0.3022613, 0.5960785, 0, 1, 1,
0.8178968, 0.5843639, 1.144999, 0.6039216, 0, 1, 1,
0.8217218, 1.309429, 0.9247561, 0.6078432, 0, 1, 1,
0.822296, 0.6006496, 4.086092, 0.6156863, 0, 1, 1,
0.824729, 1.624026, 0.9213195, 0.6196079, 0, 1, 1,
0.8253653, 1.082818, -0.3542432, 0.627451, 0, 1, 1,
0.8260438, -0.4604704, 1.132883, 0.6313726, 0, 1, 1,
0.8332611, -0.6047012, 3.958018, 0.6392157, 0, 1, 1,
0.8340011, -1.376793, 2.103724, 0.6431373, 0, 1, 1,
0.8346941, 0.1109813, -0.03872506, 0.6509804, 0, 1, 1,
0.8407993, 0.902855, 0.03823764, 0.654902, 0, 1, 1,
0.8459129, -0.02299246, 2.002322, 0.6627451, 0, 1, 1,
0.846427, 1.768448, 0.0705938, 0.6666667, 0, 1, 1,
0.8466451, 0.2332951, 1.285201, 0.6745098, 0, 1, 1,
0.8516771, -0.3744944, 1.217898, 0.6784314, 0, 1, 1,
0.8562874, 0.6962833, 2.08172, 0.6862745, 0, 1, 1,
0.8627779, 0.01411487, 1.01085, 0.6901961, 0, 1, 1,
0.8628383, -0.7428532, 4.295629, 0.6980392, 0, 1, 1,
0.8648887, 0.7626837, 1.384218, 0.7058824, 0, 1, 1,
0.8662136, 0.0001908781, 0.7028598, 0.7098039, 0, 1, 1,
0.8672544, -1.572924, 3.456086, 0.7176471, 0, 1, 1,
0.8680587, -0.1732444, 2.842466, 0.7215686, 0, 1, 1,
0.8696206, -0.0447633, 1.667103, 0.7294118, 0, 1, 1,
0.8802643, -0.7339915, 1.827604, 0.7333333, 0, 1, 1,
0.8806913, 0.3912371, 0.9329634, 0.7411765, 0, 1, 1,
0.8870519, -1.734906, 2.572454, 0.7450981, 0, 1, 1,
0.8871167, 1.535744, -0.1057206, 0.7529412, 0, 1, 1,
0.8894553, 1.639626, 2.012097, 0.7568628, 0, 1, 1,
0.8932123, 2.027475, 1.326684, 0.7647059, 0, 1, 1,
0.8935139, 1.773669, 2.310852, 0.7686275, 0, 1, 1,
0.8965204, 0.649042, -0.04932649, 0.7764706, 0, 1, 1,
0.9067799, 0.1652952, 1.1789, 0.7803922, 0, 1, 1,
0.9080196, 1.970279, 0.5428027, 0.7882353, 0, 1, 1,
0.9102674, -1.594194, 3.179157, 0.7921569, 0, 1, 1,
0.9116989, -0.7231296, 2.581313, 0.8, 0, 1, 1,
0.9158866, -1.500297, 2.700706, 0.8078431, 0, 1, 1,
0.9209114, -0.2100074, 2.133595, 0.8117647, 0, 1, 1,
0.9246894, 0.5396912, 0.429406, 0.8196079, 0, 1, 1,
0.9256023, -0.6069683, 1.608431, 0.8235294, 0, 1, 1,
0.9284264, -0.2508576, 1.276839, 0.8313726, 0, 1, 1,
0.9287366, 1.212528, 0.4236295, 0.8352941, 0, 1, 1,
0.9340563, -0.6589639, 3.593558, 0.8431373, 0, 1, 1,
0.9442192, 0.8855189, 0.5851614, 0.8470588, 0, 1, 1,
0.9548132, -0.3966074, 2.218627, 0.854902, 0, 1, 1,
0.9620305, -1.304705, 3.090734, 0.8588235, 0, 1, 1,
0.9634012, -0.2091034, 1.47304, 0.8666667, 0, 1, 1,
0.9698369, -2.163743, 3.246758, 0.8705882, 0, 1, 1,
0.9725732, -1.079247, 2.949616, 0.8784314, 0, 1, 1,
0.9727795, 0.2318636, 0.7718425, 0.8823529, 0, 1, 1,
0.9738557, 0.824143, 1.837268, 0.8901961, 0, 1, 1,
0.9747232, -0.01636211, 3.326283, 0.8941177, 0, 1, 1,
0.9781641, -0.7676968, 3.482118, 0.9019608, 0, 1, 1,
0.9787011, 0.198079, 1.55887, 0.9098039, 0, 1, 1,
0.9816151, 0.304364, 2.134176, 0.9137255, 0, 1, 1,
0.9832818, 0.05934542, 0.6526892, 0.9215686, 0, 1, 1,
0.9843798, 0.8389818, 2.72716, 0.9254902, 0, 1, 1,
0.9865968, 0.1930114, -0.1245226, 0.9333333, 0, 1, 1,
0.988862, 0.775071, 2.598322, 0.9372549, 0, 1, 1,
0.9908072, 0.3888646, 0.2999274, 0.945098, 0, 1, 1,
0.9970139, -0.9309052, 2.822345, 0.9490196, 0, 1, 1,
1.003279, -2.551717, 2.411566, 0.9568627, 0, 1, 1,
1.013395, 0.2251544, 0.8037933, 0.9607843, 0, 1, 1,
1.018665, 0.09650465, 1.672722, 0.9686275, 0, 1, 1,
1.019801, 0.6385118, 0.3395103, 0.972549, 0, 1, 1,
1.026488, 0.8863126, 0.5920849, 0.9803922, 0, 1, 1,
1.029309, -0.004249623, 0.4841506, 0.9843137, 0, 1, 1,
1.037649, 0.3929715, 0.3732339, 0.9921569, 0, 1, 1,
1.040802, -0.1843183, 1.002931, 0.9960784, 0, 1, 1,
1.056891, 0.5741726, 0.2508068, 1, 0, 0.9960784, 1,
1.057965, -1.359628, 3.441763, 1, 0, 0.9882353, 1,
1.069555, 1.743393, 1.556732, 1, 0, 0.9843137, 1,
1.071751, -0.004293772, 0.1229277, 1, 0, 0.9764706, 1,
1.072673, -0.565951, 1.449699, 1, 0, 0.972549, 1,
1.072836, 0.9783767, 1.495569, 1, 0, 0.9647059, 1,
1.078715, 1.03262, -0.7707732, 1, 0, 0.9607843, 1,
1.078802, 0.02338048, 1.552925, 1, 0, 0.9529412, 1,
1.098819, 1.085709, 1.497503, 1, 0, 0.9490196, 1,
1.105549, 0.3074422, -0.1505019, 1, 0, 0.9411765, 1,
1.107712, -0.2657157, 2.692221, 1, 0, 0.9372549, 1,
1.109793, -0.994641, 3.746814, 1, 0, 0.9294118, 1,
1.111727, -1.127097, 2.724002, 1, 0, 0.9254902, 1,
1.111969, 0.1353723, 1.541841, 1, 0, 0.9176471, 1,
1.11547, 0.6444252, -1.006738, 1, 0, 0.9137255, 1,
1.12037, -1.528003, 1.939498, 1, 0, 0.9058824, 1,
1.123109, 0.5816137, 2.19799, 1, 0, 0.9019608, 1,
1.12457, -0.3815334, 2.205254, 1, 0, 0.8941177, 1,
1.125747, -1.204493, 1.936519, 1, 0, 0.8862745, 1,
1.131502, -0.4624233, 2.962215, 1, 0, 0.8823529, 1,
1.134082, -1.211507, 1.295693, 1, 0, 0.8745098, 1,
1.137063, 1.281734, -1.671527, 1, 0, 0.8705882, 1,
1.144912, -1.358309, 1.373247, 1, 0, 0.8627451, 1,
1.153686, -0.01786456, 1.568394, 1, 0, 0.8588235, 1,
1.155642, 0.213787, 0.1723811, 1, 0, 0.8509804, 1,
1.156942, 0.5552813, -0.07912511, 1, 0, 0.8470588, 1,
1.162447, -0.7865093, 3.288033, 1, 0, 0.8392157, 1,
1.16675, 0.4286072, 3.166449, 1, 0, 0.8352941, 1,
1.171739, 0.06066438, 1.112008, 1, 0, 0.827451, 1,
1.173578, -0.3912622, 2.172642, 1, 0, 0.8235294, 1,
1.176889, 0.2366189, 0.9224008, 1, 0, 0.8156863, 1,
1.188654, -0.5079539, 1.791026, 1, 0, 0.8117647, 1,
1.189386, 1.017106, 1.142276, 1, 0, 0.8039216, 1,
1.191427, -0.2764913, 2.770377, 1, 0, 0.7960784, 1,
1.203096, -0.2529974, 1.08905, 1, 0, 0.7921569, 1,
1.205639, 1.30574, 1.516856, 1, 0, 0.7843137, 1,
1.207157, -2.082901, 2.820797, 1, 0, 0.7803922, 1,
1.218755, 0.5828087, 1.76145, 1, 0, 0.772549, 1,
1.21988, -1.10373, 2.836923, 1, 0, 0.7686275, 1,
1.224493, 0.2752665, 1.499823, 1, 0, 0.7607843, 1,
1.231589, -0.2597653, 1.318941, 1, 0, 0.7568628, 1,
1.23573, 1.254076, 2.435624, 1, 0, 0.7490196, 1,
1.239134, -0.7012771, 2.575614, 1, 0, 0.7450981, 1,
1.242824, -0.249545, 2.263111, 1, 0, 0.7372549, 1,
1.243994, 1.065875, -0.9218063, 1, 0, 0.7333333, 1,
1.247516, 0.8242917, 1.913658, 1, 0, 0.7254902, 1,
1.248379, -0.5013897, 2.603023, 1, 0, 0.7215686, 1,
1.255704, 0.7756166, 2.473664, 1, 0, 0.7137255, 1,
1.265572, -2.465514, 2.449899, 1, 0, 0.7098039, 1,
1.272928, -0.6164437, 1.173447, 1, 0, 0.7019608, 1,
1.273043, -0.7383922, 3.015614, 1, 0, 0.6941177, 1,
1.282468, -1.447037, 2.398144, 1, 0, 0.6901961, 1,
1.284053, 0.2271742, 1.867675, 1, 0, 0.682353, 1,
1.28618, -0.1790128, 1.234275, 1, 0, 0.6784314, 1,
1.298224, 0.2756682, 2.12961, 1, 0, 0.6705883, 1,
1.29841, -1.108151, 2.023844, 1, 0, 0.6666667, 1,
1.301649, -1.031109, 1.049883, 1, 0, 0.6588235, 1,
1.306382, 0.6827417, 0.1493904, 1, 0, 0.654902, 1,
1.307753, 1.108082, -0.08802038, 1, 0, 0.6470588, 1,
1.309339, 0.683436, 0.356949, 1, 0, 0.6431373, 1,
1.311365, -0.05357442, 1.64149, 1, 0, 0.6352941, 1,
1.311832, 0.7394749, 0.2913495, 1, 0, 0.6313726, 1,
1.314467, 0.281985, -1.526658, 1, 0, 0.6235294, 1,
1.317039, -0.806491, 2.883217, 1, 0, 0.6196079, 1,
1.317248, 1.122831, 0.5784714, 1, 0, 0.6117647, 1,
1.317864, 0.7456309, 0.194767, 1, 0, 0.6078432, 1,
1.320881, -0.7561685, 1.878573, 1, 0, 0.6, 1,
1.321082, 0.7448813, 1.423848, 1, 0, 0.5921569, 1,
1.324447, -0.9048301, 2.2272, 1, 0, 0.5882353, 1,
1.329189, 0.3628667, 2.252362, 1, 0, 0.5803922, 1,
1.330427, -1.520549, 3.66894, 1, 0, 0.5764706, 1,
1.339102, 0.6708789, 2.573461, 1, 0, 0.5686275, 1,
1.341306, -0.9795018, 1.671429, 1, 0, 0.5647059, 1,
1.347678, 0.8804378, 0.09857183, 1, 0, 0.5568628, 1,
1.348615, 0.9762582, 0.7786557, 1, 0, 0.5529412, 1,
1.351959, -1.061046, 2.888893, 1, 0, 0.5450981, 1,
1.35595, 0.1762111, 0.7424006, 1, 0, 0.5411765, 1,
1.357817, -0.9242945, 1.390875, 1, 0, 0.5333334, 1,
1.361808, 2.486224, -0.9590355, 1, 0, 0.5294118, 1,
1.366291, 0.6540756, 1.351452, 1, 0, 0.5215687, 1,
1.393929, -1.745999, 1.845708, 1, 0, 0.5176471, 1,
1.398891, -0.1126516, 3.319915, 1, 0, 0.509804, 1,
1.398952, 0.6887344, 1.63722, 1, 0, 0.5058824, 1,
1.408125, -1.188483, 3.334383, 1, 0, 0.4980392, 1,
1.410945, 1.244752, -0.494191, 1, 0, 0.4901961, 1,
1.414293, -0.09184825, 0.8106287, 1, 0, 0.4862745, 1,
1.431826, 0.7613235, -0.4798235, 1, 0, 0.4784314, 1,
1.432228, -0.0542298, 0.7498423, 1, 0, 0.4745098, 1,
1.440486, -0.09080723, 2.100481, 1, 0, 0.4666667, 1,
1.442454, -1.049849, 1.267099, 1, 0, 0.4627451, 1,
1.447968, 1.214868, 2.11949, 1, 0, 0.454902, 1,
1.457197, 2.354428, 0.7894993, 1, 0, 0.4509804, 1,
1.467087, 0.3719904, 0.6056465, 1, 0, 0.4431373, 1,
1.48295, 0.3230234, 0.5500774, 1, 0, 0.4392157, 1,
1.488536, -0.554426, 0.7757499, 1, 0, 0.4313726, 1,
1.501251, -1.735527, 4.879795, 1, 0, 0.427451, 1,
1.503161, 0.189054, 0.6359954, 1, 0, 0.4196078, 1,
1.505044, -0.492943, 0.6751465, 1, 0, 0.4156863, 1,
1.505731, -0.06132554, -0.3259793, 1, 0, 0.4078431, 1,
1.516677, -1.132252, 3.89706, 1, 0, 0.4039216, 1,
1.533139, 0.460856, 0.1531475, 1, 0, 0.3960784, 1,
1.545567, -1.634194, 1.893291, 1, 0, 0.3882353, 1,
1.556531, 0.400819, 2.132988, 1, 0, 0.3843137, 1,
1.564403, -0.8573576, 1.811389, 1, 0, 0.3764706, 1,
1.566385, 1.04235, 2.217565, 1, 0, 0.372549, 1,
1.5828, 0.6437186, 1.669348, 1, 0, 0.3647059, 1,
1.585992, 0.757401, -0.008838159, 1, 0, 0.3607843, 1,
1.620623, -1.188178, 2.752996, 1, 0, 0.3529412, 1,
1.63766, -0.2395046, 2.217082, 1, 0, 0.3490196, 1,
1.637859, -0.3664134, 0.6564656, 1, 0, 0.3411765, 1,
1.642545, -0.6215186, 1.567456, 1, 0, 0.3372549, 1,
1.652389, 0.9849763, 1.698105, 1, 0, 0.3294118, 1,
1.656728, 0.2075895, 0.08113914, 1, 0, 0.3254902, 1,
1.698495, -0.245262, 2.132849, 1, 0, 0.3176471, 1,
1.699109, -0.1532941, 0.7547963, 1, 0, 0.3137255, 1,
1.707739, -1.617571, 2.5078, 1, 0, 0.3058824, 1,
1.714801, -0.5222396, 1.043218, 1, 0, 0.2980392, 1,
1.723958, -0.2008336, 2.291618, 1, 0, 0.2941177, 1,
1.737319, 0.1154806, -1.05011, 1, 0, 0.2862745, 1,
1.738328, 0.5094708, 0.2563925, 1, 0, 0.282353, 1,
1.746538, -0.2072131, 1.717825, 1, 0, 0.2745098, 1,
1.748488, 1.70876, 0.3094816, 1, 0, 0.2705882, 1,
1.768924, 1.317845, 3.075993, 1, 0, 0.2627451, 1,
1.791935, -0.5356691, 2.649797, 1, 0, 0.2588235, 1,
1.804209, -0.1178296, 1.717897, 1, 0, 0.2509804, 1,
1.806068, 0.4081276, 0.6641306, 1, 0, 0.2470588, 1,
1.819884, 1.817227, 0.7182703, 1, 0, 0.2392157, 1,
1.821126, -0.2121328, 3.23429, 1, 0, 0.2352941, 1,
1.828508, -1.816315, 1.187163, 1, 0, 0.227451, 1,
1.831705, 0.5820666, 0.4911795, 1, 0, 0.2235294, 1,
1.854141, -0.008541227, 0.8227769, 1, 0, 0.2156863, 1,
1.865847, -1.358343, 1.688029, 1, 0, 0.2117647, 1,
1.878732, -2.950029, 1.256712, 1, 0, 0.2039216, 1,
1.905694, -0.210356, 1.711348, 1, 0, 0.1960784, 1,
1.913292, -1.232617, 1.370351, 1, 0, 0.1921569, 1,
1.935337, 0.3957777, -0.9486637, 1, 0, 0.1843137, 1,
1.936324, 1.75818, 0.1695412, 1, 0, 0.1803922, 1,
1.941039, -1.242854, 2.587718, 1, 0, 0.172549, 1,
1.941339, 1.283294, 0.4451692, 1, 0, 0.1686275, 1,
1.946885, -0.2118574, 0.8467873, 1, 0, 0.1607843, 1,
1.94831, -0.1675142, 3.918446, 1, 0, 0.1568628, 1,
1.958996, -0.2721947, 1.513977, 1, 0, 0.1490196, 1,
2.042735, 0.2349002, 3.379396, 1, 0, 0.145098, 1,
2.058975, -0.1873771, 1.655373, 1, 0, 0.1372549, 1,
2.062754, 2.819891, 1.884842, 1, 0, 0.1333333, 1,
2.062952, -0.2669303, 1.532479, 1, 0, 0.1254902, 1,
2.081965, 1.174291, 0.9007874, 1, 0, 0.1215686, 1,
2.083454, 0.05336263, 0.6052555, 1, 0, 0.1137255, 1,
2.133149, -0.0953882, 1.45088, 1, 0, 0.1098039, 1,
2.142087, -1.384667, 1.467749, 1, 0, 0.1019608, 1,
2.15232, 0.2733143, 1.413187, 1, 0, 0.09411765, 1,
2.155453, 0.84457, 1.616357, 1, 0, 0.09019608, 1,
2.169755, -0.1765907, 2.373544, 1, 0, 0.08235294, 1,
2.241241, -0.8239172, 2.536896, 1, 0, 0.07843138, 1,
2.261315, -2.075157, 0.4719701, 1, 0, 0.07058824, 1,
2.284386, 0.07920474, 1.007102, 1, 0, 0.06666667, 1,
2.326612, -1.869036, 2.278577, 1, 0, 0.05882353, 1,
2.346334, 0.6512762, 1.636962, 1, 0, 0.05490196, 1,
2.419846, -0.3969529, 0.7797658, 1, 0, 0.04705882, 1,
2.607859, -1.235027, 2.305564, 1, 0, 0.04313726, 1,
2.671892, 0.4326649, -0.5995288, 1, 0, 0.03529412, 1,
2.676796, 0.8213714, 1.546942, 1, 0, 0.03137255, 1,
2.763563, -1.169649, 1.960266, 1, 0, 0.02352941, 1,
2.830845, 0.9950861, 2.660376, 1, 0, 0.01960784, 1,
2.940145, 0.4460315, 0.9526939, 1, 0, 0.01176471, 1,
3.018319, 2.790112, 0.4415373, 1, 0, 0.007843138, 1
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
-0.1312848, -3.973468, -6.672642, 0, -0.5, 0.5, 0.5,
-0.1312848, -3.973468, -6.672642, 1, -0.5, 0.5, 0.5,
-0.1312848, -3.973468, -6.672642, 1, 1.5, 0.5, 0.5,
-0.1312848, -3.973468, -6.672642, 0, 1.5, 0.5, 0.5
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
-4.348604, 0.06896544, -6.672642, 0, -0.5, 0.5, 0.5,
-4.348604, 0.06896544, -6.672642, 1, -0.5, 0.5, 0.5,
-4.348604, 0.06896544, -6.672642, 1, 1.5, 0.5, 0.5,
-4.348604, 0.06896544, -6.672642, 0, 1.5, 0.5, 0.5
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
-4.348604, -3.973468, 0.3415198, 0, -0.5, 0.5, 0.5,
-4.348604, -3.973468, 0.3415198, 1, -0.5, 0.5, 0.5,
-4.348604, -3.973468, 0.3415198, 1, 1.5, 0.5, 0.5,
-4.348604, -3.973468, 0.3415198, 0, 1.5, 0.5, 0.5
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
-3, -3.040599, -5.053989,
3, -3.040599, -5.053989,
-3, -3.040599, -5.053989,
-3, -3.196077, -5.323765,
-2, -3.040599, -5.053989,
-2, -3.196077, -5.323765,
-1, -3.040599, -5.053989,
-1, -3.196077, -5.323765,
0, -3.040599, -5.053989,
0, -3.196077, -5.323765,
1, -3.040599, -5.053989,
1, -3.196077, -5.323765,
2, -3.040599, -5.053989,
2, -3.196077, -5.323765,
3, -3.040599, -5.053989,
3, -3.196077, -5.323765
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
-3, -3.507033, -5.863316, 0, -0.5, 0.5, 0.5,
-3, -3.507033, -5.863316, 1, -0.5, 0.5, 0.5,
-3, -3.507033, -5.863316, 1, 1.5, 0.5, 0.5,
-3, -3.507033, -5.863316, 0, 1.5, 0.5, 0.5,
-2, -3.507033, -5.863316, 0, -0.5, 0.5, 0.5,
-2, -3.507033, -5.863316, 1, -0.5, 0.5, 0.5,
-2, -3.507033, -5.863316, 1, 1.5, 0.5, 0.5,
-2, -3.507033, -5.863316, 0, 1.5, 0.5, 0.5,
-1, -3.507033, -5.863316, 0, -0.5, 0.5, 0.5,
-1, -3.507033, -5.863316, 1, -0.5, 0.5, 0.5,
-1, -3.507033, -5.863316, 1, 1.5, 0.5, 0.5,
-1, -3.507033, -5.863316, 0, 1.5, 0.5, 0.5,
0, -3.507033, -5.863316, 0, -0.5, 0.5, 0.5,
0, -3.507033, -5.863316, 1, -0.5, 0.5, 0.5,
0, -3.507033, -5.863316, 1, 1.5, 0.5, 0.5,
0, -3.507033, -5.863316, 0, 1.5, 0.5, 0.5,
1, -3.507033, -5.863316, 0, -0.5, 0.5, 0.5,
1, -3.507033, -5.863316, 1, -0.5, 0.5, 0.5,
1, -3.507033, -5.863316, 1, 1.5, 0.5, 0.5,
1, -3.507033, -5.863316, 0, 1.5, 0.5, 0.5,
2, -3.507033, -5.863316, 0, -0.5, 0.5, 0.5,
2, -3.507033, -5.863316, 1, -0.5, 0.5, 0.5,
2, -3.507033, -5.863316, 1, 1.5, 0.5, 0.5,
2, -3.507033, -5.863316, 0, 1.5, 0.5, 0.5,
3, -3.507033, -5.863316, 0, -0.5, 0.5, 0.5,
3, -3.507033, -5.863316, 1, -0.5, 0.5, 0.5,
3, -3.507033, -5.863316, 1, 1.5, 0.5, 0.5,
3, -3.507033, -5.863316, 0, 1.5, 0.5, 0.5
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
-3.375377, -2, -5.053989,
-3.375377, 3, -5.053989,
-3.375377, -2, -5.053989,
-3.537581, -2, -5.323765,
-3.375377, -1, -5.053989,
-3.537581, -1, -5.323765,
-3.375377, 0, -5.053989,
-3.537581, 0, -5.323765,
-3.375377, 1, -5.053989,
-3.537581, 1, -5.323765,
-3.375377, 2, -5.053989,
-3.537581, 2, -5.323765,
-3.375377, 3, -5.053989,
-3.537581, 3, -5.323765
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
-3.86199, -2, -5.863316, 0, -0.5, 0.5, 0.5,
-3.86199, -2, -5.863316, 1, -0.5, 0.5, 0.5,
-3.86199, -2, -5.863316, 1, 1.5, 0.5, 0.5,
-3.86199, -2, -5.863316, 0, 1.5, 0.5, 0.5,
-3.86199, -1, -5.863316, 0, -0.5, 0.5, 0.5,
-3.86199, -1, -5.863316, 1, -0.5, 0.5, 0.5,
-3.86199, -1, -5.863316, 1, 1.5, 0.5, 0.5,
-3.86199, -1, -5.863316, 0, 1.5, 0.5, 0.5,
-3.86199, 0, -5.863316, 0, -0.5, 0.5, 0.5,
-3.86199, 0, -5.863316, 1, -0.5, 0.5, 0.5,
-3.86199, 0, -5.863316, 1, 1.5, 0.5, 0.5,
-3.86199, 0, -5.863316, 0, 1.5, 0.5, 0.5,
-3.86199, 1, -5.863316, 0, -0.5, 0.5, 0.5,
-3.86199, 1, -5.863316, 1, -0.5, 0.5, 0.5,
-3.86199, 1, -5.863316, 1, 1.5, 0.5, 0.5,
-3.86199, 1, -5.863316, 0, 1.5, 0.5, 0.5,
-3.86199, 2, -5.863316, 0, -0.5, 0.5, 0.5,
-3.86199, 2, -5.863316, 1, -0.5, 0.5, 0.5,
-3.86199, 2, -5.863316, 1, 1.5, 0.5, 0.5,
-3.86199, 2, -5.863316, 0, 1.5, 0.5, 0.5,
-3.86199, 3, -5.863316, 0, -0.5, 0.5, 0.5,
-3.86199, 3, -5.863316, 1, -0.5, 0.5, 0.5,
-3.86199, 3, -5.863316, 1, 1.5, 0.5, 0.5,
-3.86199, 3, -5.863316, 0, 1.5, 0.5, 0.5
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
-3.375377, -3.040599, -4,
-3.375377, -3.040599, 4,
-3.375377, -3.040599, -4,
-3.537581, -3.196077, -4,
-3.375377, -3.040599, -2,
-3.537581, -3.196077, -2,
-3.375377, -3.040599, 0,
-3.537581, -3.196077, 0,
-3.375377, -3.040599, 2,
-3.537581, -3.196077, 2,
-3.375377, -3.040599, 4,
-3.537581, -3.196077, 4
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
-3.86199, -3.507033, -4, 0, -0.5, 0.5, 0.5,
-3.86199, -3.507033, -4, 1, -0.5, 0.5, 0.5,
-3.86199, -3.507033, -4, 1, 1.5, 0.5, 0.5,
-3.86199, -3.507033, -4, 0, 1.5, 0.5, 0.5,
-3.86199, -3.507033, -2, 0, -0.5, 0.5, 0.5,
-3.86199, -3.507033, -2, 1, -0.5, 0.5, 0.5,
-3.86199, -3.507033, -2, 1, 1.5, 0.5, 0.5,
-3.86199, -3.507033, -2, 0, 1.5, 0.5, 0.5,
-3.86199, -3.507033, 0, 0, -0.5, 0.5, 0.5,
-3.86199, -3.507033, 0, 1, -0.5, 0.5, 0.5,
-3.86199, -3.507033, 0, 1, 1.5, 0.5, 0.5,
-3.86199, -3.507033, 0, 0, 1.5, 0.5, 0.5,
-3.86199, -3.507033, 2, 0, -0.5, 0.5, 0.5,
-3.86199, -3.507033, 2, 1, -0.5, 0.5, 0.5,
-3.86199, -3.507033, 2, 1, 1.5, 0.5, 0.5,
-3.86199, -3.507033, 2, 0, 1.5, 0.5, 0.5,
-3.86199, -3.507033, 4, 0, -0.5, 0.5, 0.5,
-3.86199, -3.507033, 4, 1, -0.5, 0.5, 0.5,
-3.86199, -3.507033, 4, 1, 1.5, 0.5, 0.5,
-3.86199, -3.507033, 4, 0, 1.5, 0.5, 0.5
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
-3.375377, -3.040599, -5.053989,
-3.375377, 3.17853, -5.053989,
-3.375377, -3.040599, 5.737029,
-3.375377, 3.17853, 5.737029,
-3.375377, -3.040599, -5.053989,
-3.375377, -3.040599, 5.737029,
-3.375377, 3.17853, -5.053989,
-3.375377, 3.17853, 5.737029,
-3.375377, -3.040599, -5.053989,
3.112807, -3.040599, -5.053989,
-3.375377, -3.040599, 5.737029,
3.112807, -3.040599, 5.737029,
-3.375377, 3.17853, -5.053989,
3.112807, 3.17853, -5.053989,
-3.375377, 3.17853, 5.737029,
3.112807, 3.17853, 5.737029,
3.112807, -3.040599, -5.053989,
3.112807, 3.17853, -5.053989,
3.112807, -3.040599, 5.737029,
3.112807, 3.17853, 5.737029,
3.112807, -3.040599, -5.053989,
3.112807, -3.040599, 5.737029,
3.112807, 3.17853, -5.053989,
3.112807, 3.17853, 5.737029
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
var radius = 7.498962;
var distance = 33.36373;
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
mvMatrix.translate( 0.1312848, -0.06896544, -0.3415198 );
mvMatrix.scale( 1.24966, 1.303724, 0.7513678 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.36373);
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
Fenoxycarb<-read.table("Fenoxycarb.xyz")
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
-3.280889, -1.38364, -2.107754, 0, 0, 1, 1, 1,
-3.213552, -0.06522315, -3.206191, 1, 0, 0, 1, 1,
-3.190751, 0.1805712, -0.2960882, 1, 0, 0, 1, 1,
-3.027585, 1.566542, -0.4857644, 1, 0, 0, 1, 1,
-2.739127, -0.313296, -0.8865501, 1, 0, 0, 1, 1,
-2.716893, -0.5316393, -1.63404, 1, 0, 0, 1, 1,
-2.662909, -1.050671, -2.291787, 0, 0, 0, 1, 1,
-2.651193, -1.471747, -0.5468528, 0, 0, 0, 1, 1,
-2.61633, 0.05555447, 0.1809594, 0, 0, 0, 1, 1,
-2.457555, -0.5610987, -2.645601, 0, 0, 0, 1, 1,
-2.453138, -0.5551201, -0.4638348, 0, 0, 0, 1, 1,
-2.408312, 0.191633, -1.217929, 0, 0, 0, 1, 1,
-2.318292, 1.831877, -1.023248, 0, 0, 0, 1, 1,
-2.283329, -0.07773619, -1.421244, 1, 1, 1, 1, 1,
-2.22441, -0.2761075, -2.304413, 1, 1, 1, 1, 1,
-2.207036, -1.315415, -1.173267, 1, 1, 1, 1, 1,
-2.206847, -0.2718935, -2.478719, 1, 1, 1, 1, 1,
-2.15771, 0.4276709, -1.640297, 1, 1, 1, 1, 1,
-2.119553, -0.6216623, -1.50741, 1, 1, 1, 1, 1,
-2.10713, 1.615489, -2.142678, 1, 1, 1, 1, 1,
-2.099578, 0.7098221, -3.51255, 1, 1, 1, 1, 1,
-2.075011, -0.5530933, -1.549675, 1, 1, 1, 1, 1,
-2.038063, -0.5088407, -1.241134, 1, 1, 1, 1, 1,
-2.033749, 0.3259216, -1.796942, 1, 1, 1, 1, 1,
-2.022821, -0.7298301, -2.32241, 1, 1, 1, 1, 1,
-2.017302, 0.0461736, -1.639229, 1, 1, 1, 1, 1,
-1.986135, -0.5627288, -1.628968, 1, 1, 1, 1, 1,
-1.956073, -0.1744882, -2.172053, 1, 1, 1, 1, 1,
-1.952295, 0.2761041, -2.257513, 0, 0, 1, 1, 1,
-1.922879, 1.638648, 0.08063654, 1, 0, 0, 1, 1,
-1.918634, -0.7693138, -2.328795, 1, 0, 0, 1, 1,
-1.909009, 1.2954, -0.2680649, 1, 0, 0, 1, 1,
-1.898103, -0.8487327, -2.420001, 1, 0, 0, 1, 1,
-1.889741, -2.405477, -2.211434, 1, 0, 0, 1, 1,
-1.821844, 1.184789, -1.914223, 0, 0, 0, 1, 1,
-1.781931, 0.08438877, -0.2690052, 0, 0, 0, 1, 1,
-1.75265, 0.1150549, -1.416658, 0, 0, 0, 1, 1,
-1.737827, -1.012926, -1.467974, 0, 0, 0, 1, 1,
-1.731614, -0.6375493, -2.515931, 0, 0, 0, 1, 1,
-1.72321, -0.06282872, -1.829897, 0, 0, 0, 1, 1,
-1.704796, -0.06609557, -1.295753, 0, 0, 0, 1, 1,
-1.703625, 0.720401, -0.5475298, 1, 1, 1, 1, 1,
-1.698585, 2.256284, -1.373939, 1, 1, 1, 1, 1,
-1.688518, 0.2045701, -2.831486, 1, 1, 1, 1, 1,
-1.659865, 2.074077, -0.1680235, 1, 1, 1, 1, 1,
-1.656523, 1.068684, -2.415242, 1, 1, 1, 1, 1,
-1.646467, -0.05044495, -0.6696262, 1, 1, 1, 1, 1,
-1.640711, -0.06575175, -0.08017724, 1, 1, 1, 1, 1,
-1.614743, 0.4061525, -1.212867, 1, 1, 1, 1, 1,
-1.611148, -0.5363994, -0.9675436, 1, 1, 1, 1, 1,
-1.606217, 0.4176572, 0.3605407, 1, 1, 1, 1, 1,
-1.576816, -0.1130397, -0.9657701, 1, 1, 1, 1, 1,
-1.571355, -0.0295845, -0.494301, 1, 1, 1, 1, 1,
-1.547655, 0.1724427, -0.5773875, 1, 1, 1, 1, 1,
-1.537929, -0.4348433, -0.9932595, 1, 1, 1, 1, 1,
-1.534102, 0.2361779, -1.476984, 1, 1, 1, 1, 1,
-1.520449, 0.2828138, -1.028259, 0, 0, 1, 1, 1,
-1.518589, -0.1201507, -1.887703, 1, 0, 0, 1, 1,
-1.512781, -1.209643, -1.388246, 1, 0, 0, 1, 1,
-1.477565, 2.712418, 2.061155, 1, 0, 0, 1, 1,
-1.475205, 0.77852, -1.411559, 1, 0, 0, 1, 1,
-1.461025, -0.324269, -2.15984, 1, 0, 0, 1, 1,
-1.460375, 1.274623, -1.404211, 0, 0, 0, 1, 1,
-1.450514, -1.652601, -1.340834, 0, 0, 0, 1, 1,
-1.440373, 1.058887, -0.7202135, 0, 0, 0, 1, 1,
-1.43463, -0.2483453, -1.829126, 0, 0, 0, 1, 1,
-1.425998, 0.05696265, -3.162618, 0, 0, 0, 1, 1,
-1.42361, 1.041091, -1.501101, 0, 0, 0, 1, 1,
-1.412982, -1.061376, -3.58149, 0, 0, 0, 1, 1,
-1.409273, -1.278018, -3.231994, 1, 1, 1, 1, 1,
-1.396636, 0.7498032, -0.9969239, 1, 1, 1, 1, 1,
-1.392463, 1.589448, -0.4712469, 1, 1, 1, 1, 1,
-1.387028, -0.6143236, -2.166131, 1, 1, 1, 1, 1,
-1.375772, -1.259048, -1.838252, 1, 1, 1, 1, 1,
-1.349154, 1.338871, 0.251877, 1, 1, 1, 1, 1,
-1.342047, -0.281881, -1.833846, 1, 1, 1, 1, 1,
-1.330353, 0.7072828, -0.4087845, 1, 1, 1, 1, 1,
-1.323122, -0.4386589, -1.364523, 1, 1, 1, 1, 1,
-1.320561, -0.5509837, -1.34199, 1, 1, 1, 1, 1,
-1.304139, 0.1852675, -1.632914, 1, 1, 1, 1, 1,
-1.2965, -0.7265552, -1.296195, 1, 1, 1, 1, 1,
-1.290802, 0.5087593, -1.67619, 1, 1, 1, 1, 1,
-1.288847, -1.602512, -2.071937, 1, 1, 1, 1, 1,
-1.286641, -1.083956, -2.714525, 1, 1, 1, 1, 1,
-1.284655, -0.8071334, -2.033828, 0, 0, 1, 1, 1,
-1.276155, -0.1363542, -1.435383, 1, 0, 0, 1, 1,
-1.269895, 1.207501, -0.8361052, 1, 0, 0, 1, 1,
-1.252308, -0.4654444, -0.4110709, 1, 0, 0, 1, 1,
-1.247326, 0.63089, -2.548962, 1, 0, 0, 1, 1,
-1.230748, -1.416471, -2.350536, 1, 0, 0, 1, 1,
-1.225417, 0.1633286, -2.304379, 0, 0, 0, 1, 1,
-1.215065, 0.9703352, -0.9776388, 0, 0, 0, 1, 1,
-1.212454, 1.450619, -1.508268, 0, 0, 0, 1, 1,
-1.212337, 1.400057, 0.7754309, 0, 0, 0, 1, 1,
-1.20598, -0.5177633, -0.9443793, 0, 0, 0, 1, 1,
-1.204068, 0.6893644, -3.549995, 0, 0, 0, 1, 1,
-1.203288, -0.2130298, -2.935563, 0, 0, 0, 1, 1,
-1.20253, 0.612634, -0.3008251, 1, 1, 1, 1, 1,
-1.202306, 1.878894, -2.015558, 1, 1, 1, 1, 1,
-1.199926, -0.3096378, -1.356248, 1, 1, 1, 1, 1,
-1.196877, 1.016082, -0.9454717, 1, 1, 1, 1, 1,
-1.189264, 0.5953242, -0.3513413, 1, 1, 1, 1, 1,
-1.183694, -0.6334852, -1.935269, 1, 1, 1, 1, 1,
-1.183297, 0.02765845, -0.748484, 1, 1, 1, 1, 1,
-1.179293, -0.8506059, -2.030675, 1, 1, 1, 1, 1,
-1.172752, 0.1410227, -0.5147076, 1, 1, 1, 1, 1,
-1.165665, 0.001744814, -0.6322761, 1, 1, 1, 1, 1,
-1.161902, -0.4550887, -2.730042, 1, 1, 1, 1, 1,
-1.154573, -0.5833927, -1.967502, 1, 1, 1, 1, 1,
-1.142702, -0.8004578, -1.328822, 1, 1, 1, 1, 1,
-1.140464, 0.07123036, -0.5537794, 1, 1, 1, 1, 1,
-1.133931, 0.328156, -1.196533, 1, 1, 1, 1, 1,
-1.118166, -0.3875435, 0.2040519, 0, 0, 1, 1, 1,
-1.115044, 0.3768802, -0.6988836, 1, 0, 0, 1, 1,
-1.113492, 1.420779, -1.55886, 1, 0, 0, 1, 1,
-1.111019, -0.6800748, 0.6731303, 1, 0, 0, 1, 1,
-1.109891, 0.9374307, -0.4791815, 1, 0, 0, 1, 1,
-1.10806, 0.7628846, -1.234043, 1, 0, 0, 1, 1,
-1.10382, -1.228806, -3.593692, 0, 0, 0, 1, 1,
-1.103694, 1.104284, -0.107304, 0, 0, 0, 1, 1,
-1.089853, -1.312462, -3.544372, 0, 0, 0, 1, 1,
-1.088681, -0.5470256, -2.335563, 0, 0, 0, 1, 1,
-1.084483, -0.1902751, -3.65967, 0, 0, 0, 1, 1,
-1.082543, -0.2389637, -2.449218, 0, 0, 0, 1, 1,
-1.081638, 0.4257799, -1.434213, 0, 0, 0, 1, 1,
-1.079647, 0.6825637, -1.276589, 1, 1, 1, 1, 1,
-1.064975, 0.3314768, -1.371892, 1, 1, 1, 1, 1,
-1.064171, -0.2190588, -1.044703, 1, 1, 1, 1, 1,
-1.052693, -0.9741144, -1.706245, 1, 1, 1, 1, 1,
-1.045709, -0.2072408, -2.530377, 1, 1, 1, 1, 1,
-1.043851, -1.100059, -1.182444, 1, 1, 1, 1, 1,
-1.030618, -0.2993599, -1.488804, 1, 1, 1, 1, 1,
-1.030532, -0.4803342, -2.986116, 1, 1, 1, 1, 1,
-1.021682, -1.604909, -2.695292, 1, 1, 1, 1, 1,
-1.02132, -1.053295, -0.1235863, 1, 1, 1, 1, 1,
-1.00161, -0.6574566, -2.191518, 1, 1, 1, 1, 1,
-1.000801, -0.8380732, -2.66493, 1, 1, 1, 1, 1,
-0.9978635, 0.03296241, -0.2577964, 1, 1, 1, 1, 1,
-0.9960767, 0.5178058, -1.481462, 1, 1, 1, 1, 1,
-0.9909409, -0.03313982, -1.513964, 1, 1, 1, 1, 1,
-0.9882054, 0.4754443, -1.094294, 0, 0, 1, 1, 1,
-0.9857707, -1.638223, -1.759792, 1, 0, 0, 1, 1,
-0.9809623, 0.5209315, -0.799069, 1, 0, 0, 1, 1,
-0.9748418, 0.4641775, -1.59203, 1, 0, 0, 1, 1,
-0.9690794, -0.3367433, -2.430364, 1, 0, 0, 1, 1,
-0.9599775, -0.7788275, -2.946666, 1, 0, 0, 1, 1,
-0.9595655, 1.843351, -1.312726, 0, 0, 0, 1, 1,
-0.9565679, -0.02878009, -1.360588, 0, 0, 0, 1, 1,
-0.95596, 0.6565758, -1.949466, 0, 0, 0, 1, 1,
-0.9452685, 0.2747156, -2.16453, 0, 0, 0, 1, 1,
-0.9444025, -0.0385963, -0.991389, 0, 0, 0, 1, 1,
-0.9360949, -0.3724044, -0.6594845, 0, 0, 0, 1, 1,
-0.9282451, 0.9349067, 0.7898791, 0, 0, 0, 1, 1,
-0.9185296, 0.2479057, -0.8657865, 1, 1, 1, 1, 1,
-0.9168797, -0.6551489, -0.7443692, 1, 1, 1, 1, 1,
-0.9159796, -0.3913983, -1.90777, 1, 1, 1, 1, 1,
-0.9077284, -1.054227, -1.483177, 1, 1, 1, 1, 1,
-0.9019405, 0.3488167, -2.42104, 1, 1, 1, 1, 1,
-0.9018961, 0.6514485, -0.4615081, 1, 1, 1, 1, 1,
-0.9011981, 0.1468223, -0.1986559, 1, 1, 1, 1, 1,
-0.8950021, 0.4053313, -1.670928, 1, 1, 1, 1, 1,
-0.8941596, -0.4815065, -1.543315, 1, 1, 1, 1, 1,
-0.8940775, -0.6732641, -1.883278, 1, 1, 1, 1, 1,
-0.8935182, -1.00194, -1.997955, 1, 1, 1, 1, 1,
-0.8933581, -1.792691, -2.10439, 1, 1, 1, 1, 1,
-0.8827819, 0.6803743, 0.2806542, 1, 1, 1, 1, 1,
-0.8826862, -1.285614, -3.337406, 1, 1, 1, 1, 1,
-0.8750784, 0.419421, -1.461123, 1, 1, 1, 1, 1,
-0.8666954, 0.08713001, -0.473741, 0, 0, 1, 1, 1,
-0.8602241, 1.358086, 1.322338, 1, 0, 0, 1, 1,
-0.8560095, 2.147094, -0.552708, 1, 0, 0, 1, 1,
-0.8481908, 1.695543, 0.003037172, 1, 0, 0, 1, 1,
-0.8463876, -1.094548, -3.078895, 1, 0, 0, 1, 1,
-0.8436767, -0.05953946, -0.9587537, 1, 0, 0, 1, 1,
-0.8409586, 2.299856, 0.4652722, 0, 0, 0, 1, 1,
-0.8381937, 1.163442, -2.392612, 0, 0, 0, 1, 1,
-0.8368719, 0.2393642, -3.705841, 0, 0, 0, 1, 1,
-0.8363473, -0.7247955, -2.142524, 0, 0, 0, 1, 1,
-0.8351279, -0.214542, -4.043115, 0, 0, 0, 1, 1,
-0.8320748, 0.09925298, -1.285941, 0, 0, 0, 1, 1,
-0.8312392, -0.666128, -3.705559, 0, 0, 0, 1, 1,
-0.8306172, 0.5368615, -3.093954, 1, 1, 1, 1, 1,
-0.8305227, -1.062412, -0.02978642, 1, 1, 1, 1, 1,
-0.8281931, 0.7755522, -0.09020402, 1, 1, 1, 1, 1,
-0.8263936, -0.07839406, -0.7692125, 1, 1, 1, 1, 1,
-0.8259852, -0.3203792, -0.8886611, 1, 1, 1, 1, 1,
-0.8244525, 2.940552, -0.9200163, 1, 1, 1, 1, 1,
-0.8227049, 0.4843774, -0.5728512, 1, 1, 1, 1, 1,
-0.8078856, 0.0525937, -2.061323, 1, 1, 1, 1, 1,
-0.8021936, 0.7480088, -0.4744137, 1, 1, 1, 1, 1,
-0.8008303, 1.353998, -0.07883137, 1, 1, 1, 1, 1,
-0.8004234, 0.7257296, -0.2136618, 1, 1, 1, 1, 1,
-0.8000542, -0.7019591, -1.828483, 1, 1, 1, 1, 1,
-0.7946262, 1.593418, -1.611457, 1, 1, 1, 1, 1,
-0.7943013, -0.7923099, -3.677898, 1, 1, 1, 1, 1,
-0.7915996, 0.3678495, -1.571567, 1, 1, 1, 1, 1,
-0.7869664, -2.608485, -3.440876, 0, 0, 1, 1, 1,
-0.7860013, 1.374478, -1.109248, 1, 0, 0, 1, 1,
-0.7854581, 0.120409, -1.637047, 1, 0, 0, 1, 1,
-0.7772433, 0.6484866, -0.33883, 1, 0, 0, 1, 1,
-0.7757406, 0.3323461, 1.26886, 1, 0, 0, 1, 1,
-0.7708683, -0.3079477, -1.378082, 1, 0, 0, 1, 1,
-0.7685843, -1.138674, -3.426153, 0, 0, 0, 1, 1,
-0.761628, 1.104444, -0.5249361, 0, 0, 0, 1, 1,
-0.7611848, 1.52547, 0.3921752, 0, 0, 0, 1, 1,
-0.7611505, 1.544039, -0.1272811, 0, 0, 0, 1, 1,
-0.7548063, -1.208414, -2.767791, 0, 0, 0, 1, 1,
-0.7514783, 1.341749, -0.2372531, 0, 0, 0, 1, 1,
-0.7498792, -1.916555, -2.255803, 0, 0, 0, 1, 1,
-0.7438831, -0.5730569, -1.822728, 1, 1, 1, 1, 1,
-0.7404464, 1.702676, -0.6936488, 1, 1, 1, 1, 1,
-0.7397242, -1.167157, -2.740959, 1, 1, 1, 1, 1,
-0.7381042, 0.4371013, -2.374972, 1, 1, 1, 1, 1,
-0.7364633, -0.373372, -2.610461, 1, 1, 1, 1, 1,
-0.7338696, 0.9208515, -0.1525232, 1, 1, 1, 1, 1,
-0.7330182, -0.2137188, -0.4134958, 1, 1, 1, 1, 1,
-0.7314684, -1.05923, -2.19792, 1, 1, 1, 1, 1,
-0.7274127, 1.274921, -0.2652078, 1, 1, 1, 1, 1,
-0.7252801, 0.4303839, -1.549318, 1, 1, 1, 1, 1,
-0.723929, -0.4635699, -2.598419, 1, 1, 1, 1, 1,
-0.7195968, -0.8324025, -1.65354, 1, 1, 1, 1, 1,
-0.7171742, 1.114988, 0.6395775, 1, 1, 1, 1, 1,
-0.7064008, -0.9102114, -4.458485, 1, 1, 1, 1, 1,
-0.7053621, 0.3407151, -0.3750309, 1, 1, 1, 1, 1,
-0.7020051, -0.5371585, -2.158773, 0, 0, 1, 1, 1,
-0.7019489, -0.04576431, -2.259223, 1, 0, 0, 1, 1,
-0.6980077, 0.2895424, -1.59089, 1, 0, 0, 1, 1,
-0.6851156, 0.9597677, -0.7369889, 1, 0, 0, 1, 1,
-0.6809242, 0.7281113, -0.7229136, 1, 0, 0, 1, 1,
-0.6772184, 0.4352371, -1.680269, 1, 0, 0, 1, 1,
-0.6765682, 0.409249, -1.719249, 0, 0, 0, 1, 1,
-0.6739095, 0.1547474, -0.6127077, 0, 0, 0, 1, 1,
-0.672156, 0.6660529, 1.06943, 0, 0, 0, 1, 1,
-0.6712283, 0.9707201, -1.239075, 0, 0, 0, 1, 1,
-0.6708256, -0.1522279, -0.96492, 0, 0, 0, 1, 1,
-0.6683643, -0.2531466, -2.122973, 0, 0, 0, 1, 1,
-0.6628965, 0.1717272, -1.219542, 0, 0, 0, 1, 1,
-0.6563694, -0.8707533, -2.645433, 1, 1, 1, 1, 1,
-0.6530682, 0.8139169, 0.3897967, 1, 1, 1, 1, 1,
-0.6529198, 0.05178534, -2.133075, 1, 1, 1, 1, 1,
-0.6435544, 0.3936467, -0.5801864, 1, 1, 1, 1, 1,
-0.6429393, -0.03810148, 0.5529819, 1, 1, 1, 1, 1,
-0.6396955, -0.8711603, -1.686487, 1, 1, 1, 1, 1,
-0.6369432, 0.02668068, -2.246571, 1, 1, 1, 1, 1,
-0.636779, -0.1257891, -1.248147, 1, 1, 1, 1, 1,
-0.6337801, -0.05881877, -1.46009, 1, 1, 1, 1, 1,
-0.6229487, 2.136322, -0.3000848, 1, 1, 1, 1, 1,
-0.6198753, 0.1472648, -1.760166, 1, 1, 1, 1, 1,
-0.6186764, -1.587614, -3.15066, 1, 1, 1, 1, 1,
-0.6153795, -0.9137655, -3.33086, 1, 1, 1, 1, 1,
-0.6087924, 1.229154, 0.4219479, 1, 1, 1, 1, 1,
-0.600774, -0.4138017, -2.218978, 1, 1, 1, 1, 1,
-0.5985958, -0.005190221, -3.184081, 0, 0, 1, 1, 1,
-0.594034, 0.3146992, -2.769514, 1, 0, 0, 1, 1,
-0.5920244, -1.410162, -2.353681, 1, 0, 0, 1, 1,
-0.5900459, -0.4789362, -0.7807598, 1, 0, 0, 1, 1,
-0.5876873, 0.6952538, -0.3704387, 1, 0, 0, 1, 1,
-0.584512, -0.4225913, -2.72975, 1, 0, 0, 1, 1,
-0.5841799, 0.3519881, 0.8617795, 0, 0, 0, 1, 1,
-0.5828018, -0.07895927, -2.970862, 0, 0, 0, 1, 1,
-0.5776481, 0.4643303, 0.865101, 0, 0, 0, 1, 1,
-0.5774906, 0.2022051, -1.849212, 0, 0, 0, 1, 1,
-0.5768434, -0.5075732, -3.235326, 0, 0, 0, 1, 1,
-0.5757132, -2.435936, -3.55221, 0, 0, 0, 1, 1,
-0.5737937, 0.3846743, -0.1917745, 0, 0, 0, 1, 1,
-0.5701946, 0.7438887, -1.863953, 1, 1, 1, 1, 1,
-0.5692795, -0.8369229, -1.231136, 1, 1, 1, 1, 1,
-0.568145, -0.4902736, -1.980543, 1, 1, 1, 1, 1,
-0.5561227, -0.5267556, -2.567589, 1, 1, 1, 1, 1,
-0.5539444, 1.403217, -0.40286, 1, 1, 1, 1, 1,
-0.5494069, 0.02746484, -3.665437, 1, 1, 1, 1, 1,
-0.5491487, -0.631587, -1.921559, 1, 1, 1, 1, 1,
-0.5485852, 1.448279, 0.5418209, 1, 1, 1, 1, 1,
-0.5476027, 1.112504, -0.4842263, 1, 1, 1, 1, 1,
-0.5429301, 1.056354, -0.4782234, 1, 1, 1, 1, 1,
-0.5398197, -0.1565346, -3.086763, 1, 1, 1, 1, 1,
-0.538131, -0.683546, -1.394197, 1, 1, 1, 1, 1,
-0.5316294, 0.553721, -0.2031088, 1, 1, 1, 1, 1,
-0.5248387, -0.6864578, -1.692812, 1, 1, 1, 1, 1,
-0.5241412, 0.4361378, -0.5169399, 1, 1, 1, 1, 1,
-0.5147886, -0.5457658, -3.529322, 0, 0, 1, 1, 1,
-0.5103638, 0.9791313, -0.2636072, 1, 0, 0, 1, 1,
-0.5098615, -2.493232, -3.351439, 1, 0, 0, 1, 1,
-0.5090367, -1.337786, -4.710074, 1, 0, 0, 1, 1,
-0.507759, -0.04951442, -2.434922, 1, 0, 0, 1, 1,
-0.5064693, -1.388423, -2.866687, 1, 0, 0, 1, 1,
-0.5021151, -0.370036, -3.329053, 0, 0, 0, 1, 1,
-0.4964226, 1.306887, -0.1243216, 0, 0, 0, 1, 1,
-0.4963082, -1.512989, -2.707092, 0, 0, 0, 1, 1,
-0.4962031, 2.107623, -0.8340628, 0, 0, 0, 1, 1,
-0.4928784, 0.4346631, -0.1740118, 0, 0, 0, 1, 1,
-0.4906699, -0.2778243, -0.4575616, 0, 0, 0, 1, 1,
-0.4893374, -1.883655, -3.1887, 0, 0, 0, 1, 1,
-0.4816923, -0.6380071, -3.907306, 1, 1, 1, 1, 1,
-0.4782124, -1.534941, -3.702438, 1, 1, 1, 1, 1,
-0.4772136, 0.07134651, -2.259906, 1, 1, 1, 1, 1,
-0.4749204, 0.2768847, -1.120872, 1, 1, 1, 1, 1,
-0.4732312, 0.2340683, -2.359892, 1, 1, 1, 1, 1,
-0.4726228, -0.2495308, -2.084157, 1, 1, 1, 1, 1,
-0.4711911, -0.6647493, -1.157316, 1, 1, 1, 1, 1,
-0.4664962, -1.014072, -3.667603, 1, 1, 1, 1, 1,
-0.4578285, 0.7837244, 0.9344421, 1, 1, 1, 1, 1,
-0.4574195, -1.525807, -2.883183, 1, 1, 1, 1, 1,
-0.4562511, 0.1055382, -1.827822, 1, 1, 1, 1, 1,
-0.4488138, 0.5361031, -3.276589, 1, 1, 1, 1, 1,
-0.4432488, 2.397189, 2.305866, 1, 1, 1, 1, 1,
-0.4381278, 0.5422135, -0.9624016, 1, 1, 1, 1, 1,
-0.4248336, -1.544275, -1.575208, 1, 1, 1, 1, 1,
-0.4245357, -0.4515353, -0.7107589, 0, 0, 1, 1, 1,
-0.4235956, 1.650517, -0.6022249, 1, 0, 0, 1, 1,
-0.4156696, -0.01192131, -0.5012791, 1, 0, 0, 1, 1,
-0.4121028, -1.959921, -3.210197, 1, 0, 0, 1, 1,
-0.4094279, 0.04091806, -3.037372, 1, 0, 0, 1, 1,
-0.4081684, -1.266306, -3.245813, 1, 0, 0, 1, 1,
-0.4069972, 1.458885, 0.2633441, 0, 0, 0, 1, 1,
-0.4056005, -0.06986739, 0.8210912, 0, 0, 0, 1, 1,
-0.3982438, 0.8929106, -0.6904369, 0, 0, 0, 1, 1,
-0.3887557, -0.1900423, -1.900294, 0, 0, 0, 1, 1,
-0.3879677, 0.1748651, -0.9394078, 0, 0, 0, 1, 1,
-0.3853091, -0.5115367, -4.233146, 0, 0, 0, 1, 1,
-0.378316, 0.9987363, 0.2473962, 0, 0, 0, 1, 1,
-0.3776179, -0.5370049, -2.797715, 1, 1, 1, 1, 1,
-0.3760308, -0.2604769, -1.932686, 1, 1, 1, 1, 1,
-0.3712106, 0.3730687, -0.8670166, 1, 1, 1, 1, 1,
-0.3688489, -1.219438, -2.975832, 1, 1, 1, 1, 1,
-0.3671742, -0.6211278, -1.785133, 1, 1, 1, 1, 1,
-0.3631305, -0.6380916, -2.279161, 1, 1, 1, 1, 1,
-0.3624002, 0.8973842, -1.632397, 1, 1, 1, 1, 1,
-0.362216, 0.04836317, -2.660847, 1, 1, 1, 1, 1,
-0.3605863, 1.890233, -1.584812, 1, 1, 1, 1, 1,
-0.360512, -1.425292, -3.482257, 1, 1, 1, 1, 1,
-0.3570998, 0.9886739, 0.04304151, 1, 1, 1, 1, 1,
-0.3546653, -1.068948, -4.109055, 1, 1, 1, 1, 1,
-0.3540518, -0.3206894, -1.731287, 1, 1, 1, 1, 1,
-0.345798, -2.248874, -3.252557, 1, 1, 1, 1, 1,
-0.3439077, 0.3397464, -0.6279175, 1, 1, 1, 1, 1,
-0.3426407, 0.5863168, -0.274022, 0, 0, 1, 1, 1,
-0.3408241, -0.21153, -0.6565453, 1, 0, 0, 1, 1,
-0.3403963, 0.4348543, -2.157501, 1, 0, 0, 1, 1,
-0.3401559, -0.6722016, -2.659308, 1, 0, 0, 1, 1,
-0.3395994, 0.2805289, -2.955034, 1, 0, 0, 1, 1,
-0.3382767, 1.171813, 0.1893126, 1, 0, 0, 1, 1,
-0.3381967, 0.9779339, -2.247042, 0, 0, 0, 1, 1,
-0.3346768, -0.2240437, -1.730572, 0, 0, 0, 1, 1,
-0.3289669, -0.510457, -2.236003, 0, 0, 0, 1, 1,
-0.3279608, 1.058494, -1.596744, 0, 0, 0, 1, 1,
-0.3262336, 0.716956, -0.437107, 0, 0, 0, 1, 1,
-0.3222121, -0.467669, -1.947662, 0, 0, 0, 1, 1,
-0.321443, 0.4541065, -1.255372, 0, 0, 0, 1, 1,
-0.3171687, -1.028034, -3.012485, 1, 1, 1, 1, 1,
-0.316842, -1.286674, -2.656842, 1, 1, 1, 1, 1,
-0.314676, 0.7264277, -0.5786984, 1, 1, 1, 1, 1,
-0.3111498, 0.357372, -0.5106567, 1, 1, 1, 1, 1,
-0.3089424, -0.8989305, -3.639609, 1, 1, 1, 1, 1,
-0.3064924, 0.6831002, -0.2439613, 1, 1, 1, 1, 1,
-0.3051761, 0.1671183, -1.007167, 1, 1, 1, 1, 1,
-0.3034113, -1.152168, -4.896839, 1, 1, 1, 1, 1,
-0.3025738, -0.3418127, -3.875915, 1, 1, 1, 1, 1,
-0.3004519, 0.8832624, -1.216241, 1, 1, 1, 1, 1,
-0.2985365, -1.78839, -1.999103, 1, 1, 1, 1, 1,
-0.2940397, -0.9519746, -3.168642, 1, 1, 1, 1, 1,
-0.2913282, -0.314139, -1.653832, 1, 1, 1, 1, 1,
-0.2902413, -1.449485, -2.461028, 1, 1, 1, 1, 1,
-0.2872462, 1.150825, -0.3688827, 1, 1, 1, 1, 1,
-0.2842911, -0.360366, -0.9921041, 0, 0, 1, 1, 1,
-0.2785381, -0.02153094, -2.920936, 1, 0, 0, 1, 1,
-0.2767942, 1.660051, -0.5645958, 1, 0, 0, 1, 1,
-0.2749313, -0.3355144, -1.75416, 1, 0, 0, 1, 1,
-0.2747929, -0.006963086, -0.2093125, 1, 0, 0, 1, 1,
-0.2746344, -0.6886637, -3.17069, 1, 0, 0, 1, 1,
-0.2718376, 0.03421976, 0.19262, 0, 0, 0, 1, 1,
-0.26904, -1.428245, -4.488896, 0, 0, 0, 1, 1,
-0.2639366, -1.665088, -2.88409, 0, 0, 0, 1, 1,
-0.2568082, -0.5330942, -4.52863, 0, 0, 0, 1, 1,
-0.2546357, -0.2657142, -1.326376, 0, 0, 0, 1, 1,
-0.2544437, -0.03658472, -2.492419, 0, 0, 0, 1, 1,
-0.2481354, 0.4697028, 0.5206057, 0, 0, 0, 1, 1,
-0.2464504, -0.0452197, -1.077106, 1, 1, 1, 1, 1,
-0.2461943, 1.600551, -0.5409756, 1, 1, 1, 1, 1,
-0.2458926, -0.9833559, -0.9290021, 1, 1, 1, 1, 1,
-0.2445433, 0.9036642, -0.5532315, 1, 1, 1, 1, 1,
-0.2437901, -1.285077, -2.823406, 1, 1, 1, 1, 1,
-0.2433928, -0.645776, -1.753937, 1, 1, 1, 1, 1,
-0.2374526, 0.8458642, -0.2874056, 1, 1, 1, 1, 1,
-0.2356257, 0.1420981, -1.62225, 1, 1, 1, 1, 1,
-0.2353984, 0.8339089, 1.524722, 1, 1, 1, 1, 1,
-0.2235174, -0.3655877, -0.8662079, 1, 1, 1, 1, 1,
-0.2200912, -1.754841, -2.140439, 1, 1, 1, 1, 1,
-0.2198976, 2.193436, 1.409496, 1, 1, 1, 1, 1,
-0.216768, -0.5623711, -2.593335, 1, 1, 1, 1, 1,
-0.2143004, 0.08344611, 0.01118132, 1, 1, 1, 1, 1,
-0.2132188, 0.7201123, -1.076447, 1, 1, 1, 1, 1,
-0.2123336, -0.4259732, -3.249117, 0, 0, 1, 1, 1,
-0.2066484, -0.4714945, -0.8279804, 1, 0, 0, 1, 1,
-0.2028103, -0.5459179, -3.036419, 1, 0, 0, 1, 1,
-0.198764, 1.002444, -1.512578, 1, 0, 0, 1, 1,
-0.1985395, -1.02185, -1.976073, 1, 0, 0, 1, 1,
-0.1974497, -0.01091466, -0.6366792, 1, 0, 0, 1, 1,
-0.1969966, -2.223792, -3.313644, 0, 0, 0, 1, 1,
-0.1951202, 1.845583, -0.6049403, 0, 0, 0, 1, 1,
-0.1942206, 0.1612283, 0.758373, 0, 0, 0, 1, 1,
-0.1904141, -0.06798203, -1.106088, 0, 0, 0, 1, 1,
-0.181389, 1.384161, 0.9553645, 0, 0, 0, 1, 1,
-0.1768286, 1.773723, 1.27849, 0, 0, 0, 1, 1,
-0.174061, 0.6057006, -0.7718961, 0, 0, 0, 1, 1,
-0.1739681, 0.9055412, -0.357777, 1, 1, 1, 1, 1,
-0.168854, 0.8870265, 0.019964, 1, 1, 1, 1, 1,
-0.1662231, 1.444347, 0.4140338, 1, 1, 1, 1, 1,
-0.1643217, -1.533406, -3.559223, 1, 1, 1, 1, 1,
-0.1633515, 0.3061315, 0.1485691, 1, 1, 1, 1, 1,
-0.1620534, 1.318586, -0.4130965, 1, 1, 1, 1, 1,
-0.1616777, 0.5903665, 0.4994017, 1, 1, 1, 1, 1,
-0.1609915, -0.0890213, -0.8635614, 1, 1, 1, 1, 1,
-0.151621, 0.9735475, -2.706593, 1, 1, 1, 1, 1,
-0.149434, 0.2528259, -0.5170985, 1, 1, 1, 1, 1,
-0.1489088, 0.8481997, -1.339287, 1, 1, 1, 1, 1,
-0.1474527, 1.124602, 0.4185225, 1, 1, 1, 1, 1,
-0.1458253, 1.362063, 1.485406, 1, 1, 1, 1, 1,
-0.1442513, -0.5952221, -3.677478, 1, 1, 1, 1, 1,
-0.1430642, -0.3547677, -3.242124, 1, 1, 1, 1, 1,
-0.1410115, 0.03545895, -2.607922, 0, 0, 1, 1, 1,
-0.140702, -0.02535835, -1.781903, 1, 0, 0, 1, 1,
-0.138753, -0.1987579, -3.723089, 1, 0, 0, 1, 1,
-0.1379898, -1.263881, -4.135963, 1, 0, 0, 1, 1,
-0.1367098, -0.2076278, -1.446093, 1, 0, 0, 1, 1,
-0.1322039, 1.028317, -0.1864664, 1, 0, 0, 1, 1,
-0.1299536, -1.024568, -2.63329, 0, 0, 0, 1, 1,
-0.1294111, -1.342325, -3.342077, 0, 0, 0, 1, 1,
-0.1271567, 0.6121088, 0.5427426, 0, 0, 0, 1, 1,
-0.1235982, 0.02728479, -0.5944237, 0, 0, 0, 1, 1,
-0.1215758, 0.2737697, -0.5447502, 0, 0, 0, 1, 1,
-0.1180106, 1.0259, -0.9081042, 0, 0, 0, 1, 1,
-0.1093529, -1.994409, -1.90208, 0, 0, 0, 1, 1,
-0.1031266, 0.272353, -0.07902369, 1, 1, 1, 1, 1,
-0.1024746, 0.9478188, -1.269814, 1, 1, 1, 1, 1,
-0.1019341, -0.9241031, -3.397141, 1, 1, 1, 1, 1,
-0.1011563, -0.576376, -2.455544, 1, 1, 1, 1, 1,
-0.09149076, 1.128869, 0.1544109, 1, 1, 1, 1, 1,
-0.08898373, 0.4648805, -2.207093, 1, 1, 1, 1, 1,
-0.08240483, -1.319283, -1.638495, 1, 1, 1, 1, 1,
-0.08022898, 0.2864478, 0.8584439, 1, 1, 1, 1, 1,
-0.07758634, 0.08220779, -0.1345248, 1, 1, 1, 1, 1,
-0.07102386, 1.429924, -0.245808, 1, 1, 1, 1, 1,
-0.0695437, 1.221263, 1.721132, 1, 1, 1, 1, 1,
-0.06481129, -0.7084734, -2.230957, 1, 1, 1, 1, 1,
-0.06451155, 0.3261541, -0.9932972, 1, 1, 1, 1, 1,
-0.05966146, -1.631822, -1.670735, 1, 1, 1, 1, 1,
-0.05869567, 0.1907967, 0.1892251, 1, 1, 1, 1, 1,
-0.05769042, -0.6517023, -2.606158, 0, 0, 1, 1, 1,
-0.05479345, 0.5765975, -0.408961, 1, 0, 0, 1, 1,
-0.04896892, 0.7063104, 0.1788262, 1, 0, 0, 1, 1,
-0.04414329, 0.07947323, -1.125237, 1, 0, 0, 1, 1,
-0.04237508, -0.4373042, -3.018747, 1, 0, 0, 1, 1,
-0.0331999, -0.4480184, -2.956788, 1, 0, 0, 1, 1,
-0.03294387, -2.333381, -3.370584, 0, 0, 0, 1, 1,
-0.03182951, 0.28986, -0.25519, 0, 0, 0, 1, 1,
-0.02715684, -0.03252595, -3.437071, 0, 0, 0, 1, 1,
-0.02109187, -1.047181, -3.651293, 0, 0, 0, 1, 1,
-0.01780652, -0.3549207, -3.631282, 0, 0, 0, 1, 1,
-0.01651959, 0.6534404, 0.3795264, 0, 0, 0, 1, 1,
-0.01335982, -0.1005762, -3.161812, 0, 0, 0, 1, 1,
-0.01225205, -0.9464715, -2.258885, 1, 1, 1, 1, 1,
-0.01213321, 1.000669, 0.1974982, 1, 1, 1, 1, 1,
-0.01197659, 0.3465017, -0.3466349, 1, 1, 1, 1, 1,
-0.01183992, 0.6997822, -0.6128246, 1, 1, 1, 1, 1,
-0.01043586, -0.2942631, -3.40666, 1, 1, 1, 1, 1,
-0.009394376, 0.1743013, 0.977643, 1, 1, 1, 1, 1,
-0.006933457, -1.329423, -2.304439, 1, 1, 1, 1, 1,
-0.004255863, -0.2095867, -2.699382, 1, 1, 1, 1, 1,
-0.003884105, 0.1310482, -1.351124, 1, 1, 1, 1, 1,
-0.003343073, -0.6045166, -2.495808, 1, 1, 1, 1, 1,
-0.002034157, 0.4297713, -0.576769, 1, 1, 1, 1, 1,
0.00123835, -0.304271, 3.759474, 1, 1, 1, 1, 1,
0.003161107, 1.608896, -0.1346775, 1, 1, 1, 1, 1,
0.01037545, 2.38678, -0.0701407, 1, 1, 1, 1, 1,
0.01156381, 1.531906, 1.293885, 1, 1, 1, 1, 1,
0.01274697, 0.6165541, 1.274303, 0, 0, 1, 1, 1,
0.01393779, -1.288303, 2.272039, 1, 0, 0, 1, 1,
0.01573874, 0.03371289, 0.8053049, 1, 0, 0, 1, 1,
0.0163584, -0.2628979, 2.694951, 1, 0, 0, 1, 1,
0.0187239, -1.018299, 3.365408, 1, 0, 0, 1, 1,
0.02119237, 1.027448, -1.548039, 1, 0, 0, 1, 1,
0.02492367, 0.4328679, 0.9374878, 0, 0, 0, 1, 1,
0.02494702, -0.4623932, 3.289998, 0, 0, 0, 1, 1,
0.03410299, 0.03201804, 1.058688, 0, 0, 0, 1, 1,
0.03709118, 2.042964, -1.18637, 0, 0, 0, 1, 1,
0.03719028, -1.317095, 3.360394, 0, 0, 0, 1, 1,
0.03731949, 1.834039, -0.2385401, 0, 0, 0, 1, 1,
0.03837037, 1.467248, -3.921198, 0, 0, 0, 1, 1,
0.0465016, -0.1307233, 2.66694, 1, 1, 1, 1, 1,
0.04824118, -1.114838, 3.588826, 1, 1, 1, 1, 1,
0.04978793, 1.513014, -0.3945783, 1, 1, 1, 1, 1,
0.05391377, 1.842667, -0.8135627, 1, 1, 1, 1, 1,
0.05441572, -0.3173444, 3.397882, 1, 1, 1, 1, 1,
0.05497075, 1.452636, -0.527003, 1, 1, 1, 1, 1,
0.05661345, 1.272875, 1.531861, 1, 1, 1, 1, 1,
0.05731647, -1.350746, 2.699705, 1, 1, 1, 1, 1,
0.05752632, 0.8826373, 0.8657879, 1, 1, 1, 1, 1,
0.06135548, -1.072632, 3.456229, 1, 1, 1, 1, 1,
0.06204792, 0.5941261, -0.5015695, 1, 1, 1, 1, 1,
0.06274176, 0.1425864, -0.3458962, 1, 1, 1, 1, 1,
0.06288608, 0.8839748, 1.463936, 1, 1, 1, 1, 1,
0.06361242, -0.05959733, 3.625356, 1, 1, 1, 1, 1,
0.06982937, -0.4861301, 4.241297, 1, 1, 1, 1, 1,
0.07063965, 0.04202196, 1.292611, 0, 0, 1, 1, 1,
0.07259528, 0.5986565, -0.7388214, 1, 0, 0, 1, 1,
0.07694064, -0.8769999, 3.085621, 1, 0, 0, 1, 1,
0.0851753, -0.593479, 1.92849, 1, 0, 0, 1, 1,
0.0853053, 0.7752534, 1.126441, 1, 0, 0, 1, 1,
0.08683624, 1.540077, -0.8593308, 1, 0, 0, 1, 1,
0.08865724, -1.599254, 3.625714, 0, 0, 0, 1, 1,
0.09002449, 1.472553, -0.6249663, 0, 0, 0, 1, 1,
0.09148646, 0.3621009, 0.2415832, 0, 0, 0, 1, 1,
0.09725116, 0.4332393, 1.494572, 0, 0, 0, 1, 1,
0.09817604, -0.9287238, 3.346077, 0, 0, 0, 1, 1,
0.0985259, 0.6241617, -1.345089, 0, 0, 0, 1, 1,
0.09907519, 0.1386823, -0.7257994, 0, 0, 0, 1, 1,
0.1010756, -0.2483747, 2.834123, 1, 1, 1, 1, 1,
0.1022438, 0.1329157, 0.2541612, 1, 1, 1, 1, 1,
0.1028876, 0.7704731, 0.6882358, 1, 1, 1, 1, 1,
0.1032761, 1.283403, 0.5167004, 1, 1, 1, 1, 1,
0.1037954, -0.6863501, 2.879318, 1, 1, 1, 1, 1,
0.1059721, -0.4690757, 1.780726, 1, 1, 1, 1, 1,
0.1068349, 0.5484673, 0.6714178, 1, 1, 1, 1, 1,
0.10945, -0.5391743, 2.16186, 1, 1, 1, 1, 1,
0.1130499, 0.9888568, -1.355721, 1, 1, 1, 1, 1,
0.1167251, -1.316534, 3.284432, 1, 1, 1, 1, 1,
0.124794, 1.128618, -0.1466831, 1, 1, 1, 1, 1,
0.128287, -0.439208, 3.221633, 1, 1, 1, 1, 1,
0.1294166, -0.08516008, 2.176296, 1, 1, 1, 1, 1,
0.1324166, -0.1296172, 4.521725, 1, 1, 1, 1, 1,
0.1324518, -0.4053979, 4.785108, 1, 1, 1, 1, 1,
0.1347872, 0.8429822, -0.4323763, 0, 0, 1, 1, 1,
0.1428201, -0.4505359, 2.605724, 1, 0, 0, 1, 1,
0.1445788, -1.60005, 3.615897, 1, 0, 0, 1, 1,
0.1478394, -0.8776723, 3.607182, 1, 0, 0, 1, 1,
0.1483211, 1.7551, -0.9293413, 1, 0, 0, 1, 1,
0.1490881, -0.1244975, 2.037042, 1, 0, 0, 1, 1,
0.149775, 0.8026912, -2.317708, 0, 0, 0, 1, 1,
0.1498079, 0.7326937, 0.4507705, 0, 0, 0, 1, 1,
0.1505499, 1.642349, 0.3143982, 0, 0, 0, 1, 1,
0.1531265, -0.2194156, 2.733922, 0, 0, 0, 1, 1,
0.1553858, 0.1621666, -1.205595, 0, 0, 0, 1, 1,
0.1620427, 0.7660616, -0.7481746, 0, 0, 0, 1, 1,
0.1635658, 0.726725, -0.1077253, 0, 0, 0, 1, 1,
0.1670094, -0.4037675, 1.377992, 1, 1, 1, 1, 1,
0.171754, -0.1930644, 2.040727, 1, 1, 1, 1, 1,
0.173975, 0.1669301, 1.255468, 1, 1, 1, 1, 1,
0.1752779, -0.7763339, 1.562698, 1, 1, 1, 1, 1,
0.1788241, 0.008215679, 1.823929, 1, 1, 1, 1, 1,
0.178978, -0.4562739, 2.220438, 1, 1, 1, 1, 1,
0.1857516, 0.1496879, 2.898055, 1, 1, 1, 1, 1,
0.1952456, 1.079169, -0.7506385, 1, 1, 1, 1, 1,
0.1998331, 0.4676266, 1.060852, 1, 1, 1, 1, 1,
0.2006472, 1.060366, 2.278231, 1, 1, 1, 1, 1,
0.2036851, -0.3640378, 0.8157692, 1, 1, 1, 1, 1,
0.20429, -0.0731708, 2.497551, 1, 1, 1, 1, 1,
0.2044931, -1.43231, 3.807779, 1, 1, 1, 1, 1,
0.2059555, 1.480469, -1.713593, 1, 1, 1, 1, 1,
0.2072771, 0.4618922, -0.2992287, 1, 1, 1, 1, 1,
0.207992, 0.5136842, 0.7911015, 0, 0, 1, 1, 1,
0.2131676, -1.185827, 5.579878, 1, 0, 0, 1, 1,
0.2138645, 0.1927556, -0.04482085, 1, 0, 0, 1, 1,
0.2173519, 0.3205469, 2.573209, 1, 0, 0, 1, 1,
0.2199766, 0.501617, 1.797309, 1, 0, 0, 1, 1,
0.2216195, 0.472486, 0.6283256, 1, 0, 0, 1, 1,
0.2240582, -0.4605387, 1.465697, 0, 0, 0, 1, 1,
0.2252579, 1.33196, -1.593971, 0, 0, 0, 1, 1,
0.2262569, -0.3325671, 2.733087, 0, 0, 0, 1, 1,
0.2271619, 1.494841, 1.126669, 0, 0, 0, 1, 1,
0.2289403, -0.8206816, 1.571738, 0, 0, 0, 1, 1,
0.2297278, -0.1772649, 0.7612093, 0, 0, 0, 1, 1,
0.23485, 0.5931286, 1.188652, 0, 0, 0, 1, 1,
0.2445905, 1.609462, -0.2992837, 1, 1, 1, 1, 1,
0.2494269, -0.008810658, 2.277978, 1, 1, 1, 1, 1,
0.2525656, 1.301745, 0.6990718, 1, 1, 1, 1, 1,
0.2591005, 0.5552221, -2.744015, 1, 1, 1, 1, 1,
0.2596609, -0.3014809, 3.971748, 1, 1, 1, 1, 1,
0.2617351, -0.8241649, 2.186804, 1, 1, 1, 1, 1,
0.2633584, 1.185282, -1.107716, 1, 1, 1, 1, 1,
0.2647865, -1.063216, 4.498496, 1, 1, 1, 1, 1,
0.2721626, -1.098264, 1.983831, 1, 1, 1, 1, 1,
0.2744626, -0.114753, 2.211581, 1, 1, 1, 1, 1,
0.2745948, 0.4865247, -0.792443, 1, 1, 1, 1, 1,
0.2774493, -0.2857575, 3.647933, 1, 1, 1, 1, 1,
0.2779249, -0.1111894, 1.646747, 1, 1, 1, 1, 1,
0.2785533, 0.9387169, -0.7883351, 1, 1, 1, 1, 1,
0.2801932, 0.2742025, -0.4102436, 1, 1, 1, 1, 1,
0.2813756, -0.8162624, 2.700033, 0, 0, 1, 1, 1,
0.2815251, 0.9868506, 0.3503672, 1, 0, 0, 1, 1,
0.2816135, 0.6871274, 0.2589325, 1, 0, 0, 1, 1,
0.2824103, 0.02726794, 0.6027275, 1, 0, 0, 1, 1,
0.2830073, 0.4902067, -1.068573, 1, 0, 0, 1, 1,
0.2871436, -1.069148, 1.58363, 1, 0, 0, 1, 1,
0.2884426, 0.2336321, -0.09680594, 0, 0, 0, 1, 1,
0.2893023, 0.3131354, 1.860096, 0, 0, 0, 1, 1,
0.289653, -0.6675025, 2.990067, 0, 0, 0, 1, 1,
0.2915885, 0.4917419, 0.3685059, 0, 0, 0, 1, 1,
0.3017953, 0.6239544, -0.3256387, 0, 0, 0, 1, 1,
0.3018135, 0.6973057, 2.090518, 0, 0, 0, 1, 1,
0.3081236, -0.6402675, 2.058003, 0, 0, 0, 1, 1,
0.3161661, 2.02793, 0.3302656, 1, 1, 1, 1, 1,
0.3170638, 0.3262042, 1.168212, 1, 1, 1, 1, 1,
0.3176266, -0.9897089, 2.253497, 1, 1, 1, 1, 1,
0.3207865, 0.04819747, 1.86119, 1, 1, 1, 1, 1,
0.3208901, 0.3612722, 1.026054, 1, 1, 1, 1, 1,
0.3229464, -0.3699278, 3.476884, 1, 1, 1, 1, 1,
0.3241797, 1.106977, -0.6860754, 1, 1, 1, 1, 1,
0.3248775, 0.7321362, 1.603282, 1, 1, 1, 1, 1,
0.3252488, -0.6913458, 2.28539, 1, 1, 1, 1, 1,
0.3255294, -0.6309064, 4.949414, 1, 1, 1, 1, 1,
0.3281123, 0.8047759, 0.4953291, 1, 1, 1, 1, 1,
0.3296042, -1.294054, 3.037115, 1, 1, 1, 1, 1,
0.3312606, -0.2741967, 2.068122, 1, 1, 1, 1, 1,
0.345417, 0.08118294, -0.07655933, 1, 1, 1, 1, 1,
0.3480701, -0.3515563, 2.955809, 1, 1, 1, 1, 1,
0.3535224, -0.2645602, 2.054062, 0, 0, 1, 1, 1,
0.3565068, 0.5904466, -0.1202643, 1, 0, 0, 1, 1,
0.356521, 0.2277894, 1.565307, 1, 0, 0, 1, 1,
0.3566091, 0.4904959, 1.253318, 1, 0, 0, 1, 1,
0.359337, 0.7291264, 1.766023, 1, 0, 0, 1, 1,
0.3629377, 0.1210307, 1.259872, 1, 0, 0, 1, 1,
0.3658268, -1.010453, 2.831044, 0, 0, 0, 1, 1,
0.3672101, 3.08796, -1.069048, 0, 0, 0, 1, 1,
0.3681174, -0.6344361, 1.782795, 0, 0, 0, 1, 1,
0.3719363, -0.4709691, 0.9228809, 0, 0, 0, 1, 1,
0.3749079, 0.182087, 2.389117, 0, 0, 0, 1, 1,
0.3757144, 0.2320056, 2.366688, 0, 0, 0, 1, 1,
0.3823955, 0.9869156, 0.2237115, 0, 0, 0, 1, 1,
0.3828851, 0.6625178, 0.1528244, 1, 1, 1, 1, 1,
0.3835325, 0.7908769, 1.662227, 1, 1, 1, 1, 1,
0.3852901, 0.4003499, -0.04599254, 1, 1, 1, 1, 1,
0.3868027, -0.1922249, 1.535869, 1, 1, 1, 1, 1,
0.3886822, 1.780915, 2.567576, 1, 1, 1, 1, 1,
0.3890139, 1.108582, -0.2609248, 1, 1, 1, 1, 1,
0.3898012, 1.190862, -1.281676, 1, 1, 1, 1, 1,
0.3911794, 0.1785061, 2.832017, 1, 1, 1, 1, 1,
0.3926158, -0.5366821, 0.8841906, 1, 1, 1, 1, 1,
0.3931473, 1.299273, 0.7199984, 1, 1, 1, 1, 1,
0.3951839, -0.2833728, 1.08179, 1, 1, 1, 1, 1,
0.3956316, 0.1296284, 0.8755544, 1, 1, 1, 1, 1,
0.3992825, -0.2106107, 2.10914, 1, 1, 1, 1, 1,
0.4045569, -1.07095, 2.687634, 1, 1, 1, 1, 1,
0.4264533, -1.367894, 2.956069, 1, 1, 1, 1, 1,
0.4287421, -0.5433676, 2.854411, 0, 0, 1, 1, 1,
0.4293547, -0.4685493, 0.08192819, 1, 0, 0, 1, 1,
0.4454399, 1.008279, 0.2905553, 1, 0, 0, 1, 1,
0.4500952, -0.01352855, 0.9667419, 1, 0, 0, 1, 1,
0.4528834, -1.191444, 2.84859, 1, 0, 0, 1, 1,
0.4563909, -0.56044, 2.988173, 1, 0, 0, 1, 1,
0.4609411, -0.07765897, 3.301507, 0, 0, 0, 1, 1,
0.4630001, -0.5815051, 2.503974, 0, 0, 0, 1, 1,
0.464274, -1.552878, 3.403716, 0, 0, 0, 1, 1,
0.4675076, 0.5919737, 1.384902, 0, 0, 0, 1, 1,
0.467717, 0.947706, -0.07677586, 0, 0, 0, 1, 1,
0.474574, -1.24764, 2.207538, 0, 0, 0, 1, 1,
0.4747427, 0.8665467, -0.1496996, 0, 0, 0, 1, 1,
0.4763937, -0.3414295, 3.904837, 1, 1, 1, 1, 1,
0.4771561, 0.5930975, 0.1921546, 1, 1, 1, 1, 1,
0.4778442, 0.4462647, 0.1185137, 1, 1, 1, 1, 1,
0.4798049, -0.4237676, 1.97618, 1, 1, 1, 1, 1,
0.4806681, 0.9520174, 1.484662, 1, 1, 1, 1, 1,
0.4832581, 1.514764, 0.1170451, 1, 1, 1, 1, 1,
0.48584, 0.1931719, -0.2440359, 1, 1, 1, 1, 1,
0.4898606, 0.7268201, -0.2376729, 1, 1, 1, 1, 1,
0.4909414, 0.787004, 0.1278547, 1, 1, 1, 1, 1,
0.4923176, 0.4226637, 1.258665, 1, 1, 1, 1, 1,
0.494215, 0.4132895, 1.506473, 1, 1, 1, 1, 1,
0.4950739, 1.954075, 0.601583, 1, 1, 1, 1, 1,
0.4983662, -0.200646, 0.4659151, 1, 1, 1, 1, 1,
0.5025795, -1.151511, 4.673847, 1, 1, 1, 1, 1,
0.5043721, 0.1077465, 1.916619, 1, 1, 1, 1, 1,
0.5060397, 0.2769876, 3.289757, 0, 0, 1, 1, 1,
0.5077813, 0.4378954, 1.714155, 1, 0, 0, 1, 1,
0.5081111, 0.587823, -0.1317182, 1, 0, 0, 1, 1,
0.5090809, -0.2493825, 0.173954, 1, 0, 0, 1, 1,
0.5096549, 0.2126921, 1.224541, 1, 0, 0, 1, 1,
0.5185909, 0.4140066, 0.7968949, 1, 0, 0, 1, 1,
0.520149, 1.01789, 0.9243684, 0, 0, 0, 1, 1,
0.5222551, 0.03618471, 0.6156391, 0, 0, 0, 1, 1,
0.5227405, -0.08810943, 2.110191, 0, 0, 0, 1, 1,
0.5267972, 0.2011595, -0.3263918, 0, 0, 0, 1, 1,
0.5332223, -0.5616755, 1.062785, 0, 0, 0, 1, 1,
0.5332741, -0.0835761, 1.16926, 0, 0, 0, 1, 1,
0.5334431, 0.3539841, 1.099636, 0, 0, 0, 1, 1,
0.5395331, -0.1291463, 1.396415, 1, 1, 1, 1, 1,
0.5411671, -0.3662273, 4.629601, 1, 1, 1, 1, 1,
0.5518602, 0.5344291, -0.5734802, 1, 1, 1, 1, 1,
0.5552267, -0.4539939, 1.893036, 1, 1, 1, 1, 1,
0.5579934, 0.5014871, 1.718495, 1, 1, 1, 1, 1,
0.5586006, -1.636799, 1.942525, 1, 1, 1, 1, 1,
0.5621572, -0.1006148, 0.5224619, 1, 1, 1, 1, 1,
0.5627974, 0.8813635, 0.310474, 1, 1, 1, 1, 1,
0.5631418, -0.7083125, 3.658047, 1, 1, 1, 1, 1,
0.5640605, -0.499436, 1.291004, 1, 1, 1, 1, 1,
0.5650478, -0.8882859, 2.121502, 1, 1, 1, 1, 1,
0.5720388, 1.099102, -3.020366, 1, 1, 1, 1, 1,
0.5747496, -1.002312, 1.855131, 1, 1, 1, 1, 1,
0.576163, 0.4237336, 1.057071, 1, 1, 1, 1, 1,
0.5772819, 0.008634193, 2.30988, 1, 1, 1, 1, 1,
0.5787051, 0.8644624, 1.378932, 0, 0, 1, 1, 1,
0.5835803, -1.158361, 2.916542, 1, 0, 0, 1, 1,
0.586122, 0.2549078, -1.893193, 1, 0, 0, 1, 1,
0.5919849, 0.5827067, 0.6161491, 1, 0, 0, 1, 1,
0.6039941, -0.06982671, 1.146949, 1, 0, 0, 1, 1,
0.6064491, -0.3621443, 3.024899, 1, 0, 0, 1, 1,
0.6065001, -0.5152866, 1.269421, 0, 0, 0, 1, 1,
0.6068061, 1.049205, 1.278623, 0, 0, 0, 1, 1,
0.6208439, -0.5397668, 1.288237, 0, 0, 0, 1, 1,
0.6245397, 1.168704, -0.1302569, 0, 0, 0, 1, 1,
0.6277258, 0.5419364, -0.3299469, 0, 0, 0, 1, 1,
0.6283631, 0.1429438, 2.411186, 0, 0, 0, 1, 1,
0.6288224, 1.053598, 0.7718762, 0, 0, 0, 1, 1,
0.6386938, -1.574325, 3.745669, 1, 1, 1, 1, 1,
0.641741, 0.2844433, 1.198884, 1, 1, 1, 1, 1,
0.6429093, 2.85934, 0.9401437, 1, 1, 1, 1, 1,
0.6460825, 1.404865, 2.454242, 1, 1, 1, 1, 1,
0.6497293, 0.2533744, 0.3288092, 1, 1, 1, 1, 1,
0.6527459, 0.3644816, 1.610632, 1, 1, 1, 1, 1,
0.6596316, -0.06198189, 2.329887, 1, 1, 1, 1, 1,
0.6639621, 0.4412399, -0.3746826, 1, 1, 1, 1, 1,
0.671825, 0.8540944, -1.446437, 1, 1, 1, 1, 1,
0.6751429, 0.6159424, 0.4305621, 1, 1, 1, 1, 1,
0.6867914, -1.156226, 2.28826, 1, 1, 1, 1, 1,
0.7014629, -0.2439477, 1.253069, 1, 1, 1, 1, 1,
0.7026143, -1.44504, 3.593606, 1, 1, 1, 1, 1,
0.7036543, -0.8638355, 3.131741, 1, 1, 1, 1, 1,
0.7118295, -0.9470509, 1.714662, 1, 1, 1, 1, 1,
0.7177687, -0.5742352, 3.446636, 0, 0, 1, 1, 1,
0.7190658, -0.9870781, 2.737916, 1, 0, 0, 1, 1,
0.7272113, 0.4911587, 1.23917, 1, 0, 0, 1, 1,
0.7338962, 0.9859335, 3.34384, 1, 0, 0, 1, 1,
0.7349131, 1.068059, -0.4595511, 1, 0, 0, 1, 1,
0.7400984, 0.1342033, 0.5503861, 1, 0, 0, 1, 1,
0.7444275, 0.04615385, 2.566123, 0, 0, 0, 1, 1,
0.7459916, -0.7474952, 3.88285, 0, 0, 0, 1, 1,
0.7462673, -2.194331, 3.7397, 0, 0, 0, 1, 1,
0.7482358, 1.691722, 0.1702074, 0, 0, 0, 1, 1,
0.7488275, 1.972121, -2.083287, 0, 0, 0, 1, 1,
0.7528622, -1.122688, 3.166444, 0, 0, 0, 1, 1,
0.7582101, -0.2998559, 2.195013, 0, 0, 0, 1, 1,
0.7656639, 1.139808, -0.6279793, 1, 1, 1, 1, 1,
0.7658745, 1.225634, 1.100661, 1, 1, 1, 1, 1,
0.7667707, 0.6299773, 2.714981, 1, 1, 1, 1, 1,
0.770479, -0.6963357, 2.994438, 1, 1, 1, 1, 1,
0.7711179, -0.3681984, 2.670549, 1, 1, 1, 1, 1,
0.7724503, -1.665312, 2.072028, 1, 1, 1, 1, 1,
0.7740953, -0.3030682, 3.676312, 1, 1, 1, 1, 1,
0.7751867, 0.9755525, 1.479083, 1, 1, 1, 1, 1,
0.7813546, -0.9995634, 2.796901, 1, 1, 1, 1, 1,
0.7824358, -0.05556535, -1.44428, 1, 1, 1, 1, 1,
0.782898, 0.3442282, 0.561404, 1, 1, 1, 1, 1,
0.7871334, 0.3579834, 2.709176, 1, 1, 1, 1, 1,
0.7911469, 1.482343, 1.402586, 1, 1, 1, 1, 1,
0.7917342, -0.04526516, 3.146778, 1, 1, 1, 1, 1,
0.7959882, 0.7119102, 1.182897, 1, 1, 1, 1, 1,
0.7965679, -0.4066967, 1.862112, 0, 0, 1, 1, 1,
0.7980431, 0.4316403, 0.3586714, 1, 0, 0, 1, 1,
0.799637, 2.397928, 0.4129822, 1, 0, 0, 1, 1,
0.8005317, 0.7877851, 0.5523629, 1, 0, 0, 1, 1,
0.8008554, 0.01445218, 0.722111, 1, 0, 0, 1, 1,
0.8058903, 0.8234527, 1.057826, 1, 0, 0, 1, 1,
0.806282, -0.09117592, 1.846692, 0, 0, 0, 1, 1,
0.8093141, 0.6765571, 3.167002, 0, 0, 0, 1, 1,
0.811129, 0.4807859, 0.3445192, 0, 0, 0, 1, 1,
0.8127884, -2.027926, 2.453142, 0, 0, 0, 1, 1,
0.8156549, -0.05340519, 0.3022613, 0, 0, 0, 1, 1,
0.8178968, 0.5843639, 1.144999, 0, 0, 0, 1, 1,
0.8217218, 1.309429, 0.9247561, 0, 0, 0, 1, 1,
0.822296, 0.6006496, 4.086092, 1, 1, 1, 1, 1,
0.824729, 1.624026, 0.9213195, 1, 1, 1, 1, 1,
0.8253653, 1.082818, -0.3542432, 1, 1, 1, 1, 1,
0.8260438, -0.4604704, 1.132883, 1, 1, 1, 1, 1,
0.8332611, -0.6047012, 3.958018, 1, 1, 1, 1, 1,
0.8340011, -1.376793, 2.103724, 1, 1, 1, 1, 1,
0.8346941, 0.1109813, -0.03872506, 1, 1, 1, 1, 1,
0.8407993, 0.902855, 0.03823764, 1, 1, 1, 1, 1,
0.8459129, -0.02299246, 2.002322, 1, 1, 1, 1, 1,
0.846427, 1.768448, 0.0705938, 1, 1, 1, 1, 1,
0.8466451, 0.2332951, 1.285201, 1, 1, 1, 1, 1,
0.8516771, -0.3744944, 1.217898, 1, 1, 1, 1, 1,
0.8562874, 0.6962833, 2.08172, 1, 1, 1, 1, 1,
0.8627779, 0.01411487, 1.01085, 1, 1, 1, 1, 1,
0.8628383, -0.7428532, 4.295629, 1, 1, 1, 1, 1,
0.8648887, 0.7626837, 1.384218, 0, 0, 1, 1, 1,
0.8662136, 0.0001908781, 0.7028598, 1, 0, 0, 1, 1,
0.8672544, -1.572924, 3.456086, 1, 0, 0, 1, 1,
0.8680587, -0.1732444, 2.842466, 1, 0, 0, 1, 1,
0.8696206, -0.0447633, 1.667103, 1, 0, 0, 1, 1,
0.8802643, -0.7339915, 1.827604, 1, 0, 0, 1, 1,
0.8806913, 0.3912371, 0.9329634, 0, 0, 0, 1, 1,
0.8870519, -1.734906, 2.572454, 0, 0, 0, 1, 1,
0.8871167, 1.535744, -0.1057206, 0, 0, 0, 1, 1,
0.8894553, 1.639626, 2.012097, 0, 0, 0, 1, 1,
0.8932123, 2.027475, 1.326684, 0, 0, 0, 1, 1,
0.8935139, 1.773669, 2.310852, 0, 0, 0, 1, 1,
0.8965204, 0.649042, -0.04932649, 0, 0, 0, 1, 1,
0.9067799, 0.1652952, 1.1789, 1, 1, 1, 1, 1,
0.9080196, 1.970279, 0.5428027, 1, 1, 1, 1, 1,
0.9102674, -1.594194, 3.179157, 1, 1, 1, 1, 1,
0.9116989, -0.7231296, 2.581313, 1, 1, 1, 1, 1,
0.9158866, -1.500297, 2.700706, 1, 1, 1, 1, 1,
0.9209114, -0.2100074, 2.133595, 1, 1, 1, 1, 1,
0.9246894, 0.5396912, 0.429406, 1, 1, 1, 1, 1,
0.9256023, -0.6069683, 1.608431, 1, 1, 1, 1, 1,
0.9284264, -0.2508576, 1.276839, 1, 1, 1, 1, 1,
0.9287366, 1.212528, 0.4236295, 1, 1, 1, 1, 1,
0.9340563, -0.6589639, 3.593558, 1, 1, 1, 1, 1,
0.9442192, 0.8855189, 0.5851614, 1, 1, 1, 1, 1,
0.9548132, -0.3966074, 2.218627, 1, 1, 1, 1, 1,
0.9620305, -1.304705, 3.090734, 1, 1, 1, 1, 1,
0.9634012, -0.2091034, 1.47304, 1, 1, 1, 1, 1,
0.9698369, -2.163743, 3.246758, 0, 0, 1, 1, 1,
0.9725732, -1.079247, 2.949616, 1, 0, 0, 1, 1,
0.9727795, 0.2318636, 0.7718425, 1, 0, 0, 1, 1,
0.9738557, 0.824143, 1.837268, 1, 0, 0, 1, 1,
0.9747232, -0.01636211, 3.326283, 1, 0, 0, 1, 1,
0.9781641, -0.7676968, 3.482118, 1, 0, 0, 1, 1,
0.9787011, 0.198079, 1.55887, 0, 0, 0, 1, 1,
0.9816151, 0.304364, 2.134176, 0, 0, 0, 1, 1,
0.9832818, 0.05934542, 0.6526892, 0, 0, 0, 1, 1,
0.9843798, 0.8389818, 2.72716, 0, 0, 0, 1, 1,
0.9865968, 0.1930114, -0.1245226, 0, 0, 0, 1, 1,
0.988862, 0.775071, 2.598322, 0, 0, 0, 1, 1,
0.9908072, 0.3888646, 0.2999274, 0, 0, 0, 1, 1,
0.9970139, -0.9309052, 2.822345, 1, 1, 1, 1, 1,
1.003279, -2.551717, 2.411566, 1, 1, 1, 1, 1,
1.013395, 0.2251544, 0.8037933, 1, 1, 1, 1, 1,
1.018665, 0.09650465, 1.672722, 1, 1, 1, 1, 1,
1.019801, 0.6385118, 0.3395103, 1, 1, 1, 1, 1,
1.026488, 0.8863126, 0.5920849, 1, 1, 1, 1, 1,
1.029309, -0.004249623, 0.4841506, 1, 1, 1, 1, 1,
1.037649, 0.3929715, 0.3732339, 1, 1, 1, 1, 1,
1.040802, -0.1843183, 1.002931, 1, 1, 1, 1, 1,
1.056891, 0.5741726, 0.2508068, 1, 1, 1, 1, 1,
1.057965, -1.359628, 3.441763, 1, 1, 1, 1, 1,
1.069555, 1.743393, 1.556732, 1, 1, 1, 1, 1,
1.071751, -0.004293772, 0.1229277, 1, 1, 1, 1, 1,
1.072673, -0.565951, 1.449699, 1, 1, 1, 1, 1,
1.072836, 0.9783767, 1.495569, 1, 1, 1, 1, 1,
1.078715, 1.03262, -0.7707732, 0, 0, 1, 1, 1,
1.078802, 0.02338048, 1.552925, 1, 0, 0, 1, 1,
1.098819, 1.085709, 1.497503, 1, 0, 0, 1, 1,
1.105549, 0.3074422, -0.1505019, 1, 0, 0, 1, 1,
1.107712, -0.2657157, 2.692221, 1, 0, 0, 1, 1,
1.109793, -0.994641, 3.746814, 1, 0, 0, 1, 1,
1.111727, -1.127097, 2.724002, 0, 0, 0, 1, 1,
1.111969, 0.1353723, 1.541841, 0, 0, 0, 1, 1,
1.11547, 0.6444252, -1.006738, 0, 0, 0, 1, 1,
1.12037, -1.528003, 1.939498, 0, 0, 0, 1, 1,
1.123109, 0.5816137, 2.19799, 0, 0, 0, 1, 1,
1.12457, -0.3815334, 2.205254, 0, 0, 0, 1, 1,
1.125747, -1.204493, 1.936519, 0, 0, 0, 1, 1,
1.131502, -0.4624233, 2.962215, 1, 1, 1, 1, 1,
1.134082, -1.211507, 1.295693, 1, 1, 1, 1, 1,
1.137063, 1.281734, -1.671527, 1, 1, 1, 1, 1,
1.144912, -1.358309, 1.373247, 1, 1, 1, 1, 1,
1.153686, -0.01786456, 1.568394, 1, 1, 1, 1, 1,
1.155642, 0.213787, 0.1723811, 1, 1, 1, 1, 1,
1.156942, 0.5552813, -0.07912511, 1, 1, 1, 1, 1,
1.162447, -0.7865093, 3.288033, 1, 1, 1, 1, 1,
1.16675, 0.4286072, 3.166449, 1, 1, 1, 1, 1,
1.171739, 0.06066438, 1.112008, 1, 1, 1, 1, 1,
1.173578, -0.3912622, 2.172642, 1, 1, 1, 1, 1,
1.176889, 0.2366189, 0.9224008, 1, 1, 1, 1, 1,
1.188654, -0.5079539, 1.791026, 1, 1, 1, 1, 1,
1.189386, 1.017106, 1.142276, 1, 1, 1, 1, 1,
1.191427, -0.2764913, 2.770377, 1, 1, 1, 1, 1,
1.203096, -0.2529974, 1.08905, 0, 0, 1, 1, 1,
1.205639, 1.30574, 1.516856, 1, 0, 0, 1, 1,
1.207157, -2.082901, 2.820797, 1, 0, 0, 1, 1,
1.218755, 0.5828087, 1.76145, 1, 0, 0, 1, 1,
1.21988, -1.10373, 2.836923, 1, 0, 0, 1, 1,
1.224493, 0.2752665, 1.499823, 1, 0, 0, 1, 1,
1.231589, -0.2597653, 1.318941, 0, 0, 0, 1, 1,
1.23573, 1.254076, 2.435624, 0, 0, 0, 1, 1,
1.239134, -0.7012771, 2.575614, 0, 0, 0, 1, 1,
1.242824, -0.249545, 2.263111, 0, 0, 0, 1, 1,
1.243994, 1.065875, -0.9218063, 0, 0, 0, 1, 1,
1.247516, 0.8242917, 1.913658, 0, 0, 0, 1, 1,
1.248379, -0.5013897, 2.603023, 0, 0, 0, 1, 1,
1.255704, 0.7756166, 2.473664, 1, 1, 1, 1, 1,
1.265572, -2.465514, 2.449899, 1, 1, 1, 1, 1,
1.272928, -0.6164437, 1.173447, 1, 1, 1, 1, 1,
1.273043, -0.7383922, 3.015614, 1, 1, 1, 1, 1,
1.282468, -1.447037, 2.398144, 1, 1, 1, 1, 1,
1.284053, 0.2271742, 1.867675, 1, 1, 1, 1, 1,
1.28618, -0.1790128, 1.234275, 1, 1, 1, 1, 1,
1.298224, 0.2756682, 2.12961, 1, 1, 1, 1, 1,
1.29841, -1.108151, 2.023844, 1, 1, 1, 1, 1,
1.301649, -1.031109, 1.049883, 1, 1, 1, 1, 1,
1.306382, 0.6827417, 0.1493904, 1, 1, 1, 1, 1,
1.307753, 1.108082, -0.08802038, 1, 1, 1, 1, 1,
1.309339, 0.683436, 0.356949, 1, 1, 1, 1, 1,
1.311365, -0.05357442, 1.64149, 1, 1, 1, 1, 1,
1.311832, 0.7394749, 0.2913495, 1, 1, 1, 1, 1,
1.314467, 0.281985, -1.526658, 0, 0, 1, 1, 1,
1.317039, -0.806491, 2.883217, 1, 0, 0, 1, 1,
1.317248, 1.122831, 0.5784714, 1, 0, 0, 1, 1,
1.317864, 0.7456309, 0.194767, 1, 0, 0, 1, 1,
1.320881, -0.7561685, 1.878573, 1, 0, 0, 1, 1,
1.321082, 0.7448813, 1.423848, 1, 0, 0, 1, 1,
1.324447, -0.9048301, 2.2272, 0, 0, 0, 1, 1,
1.329189, 0.3628667, 2.252362, 0, 0, 0, 1, 1,
1.330427, -1.520549, 3.66894, 0, 0, 0, 1, 1,
1.339102, 0.6708789, 2.573461, 0, 0, 0, 1, 1,
1.341306, -0.9795018, 1.671429, 0, 0, 0, 1, 1,
1.347678, 0.8804378, 0.09857183, 0, 0, 0, 1, 1,
1.348615, 0.9762582, 0.7786557, 0, 0, 0, 1, 1,
1.351959, -1.061046, 2.888893, 1, 1, 1, 1, 1,
1.35595, 0.1762111, 0.7424006, 1, 1, 1, 1, 1,
1.357817, -0.9242945, 1.390875, 1, 1, 1, 1, 1,
1.361808, 2.486224, -0.9590355, 1, 1, 1, 1, 1,
1.366291, 0.6540756, 1.351452, 1, 1, 1, 1, 1,
1.393929, -1.745999, 1.845708, 1, 1, 1, 1, 1,
1.398891, -0.1126516, 3.319915, 1, 1, 1, 1, 1,
1.398952, 0.6887344, 1.63722, 1, 1, 1, 1, 1,
1.408125, -1.188483, 3.334383, 1, 1, 1, 1, 1,
1.410945, 1.244752, -0.494191, 1, 1, 1, 1, 1,
1.414293, -0.09184825, 0.8106287, 1, 1, 1, 1, 1,
1.431826, 0.7613235, -0.4798235, 1, 1, 1, 1, 1,
1.432228, -0.0542298, 0.7498423, 1, 1, 1, 1, 1,
1.440486, -0.09080723, 2.100481, 1, 1, 1, 1, 1,
1.442454, -1.049849, 1.267099, 1, 1, 1, 1, 1,
1.447968, 1.214868, 2.11949, 0, 0, 1, 1, 1,
1.457197, 2.354428, 0.7894993, 1, 0, 0, 1, 1,
1.467087, 0.3719904, 0.6056465, 1, 0, 0, 1, 1,
1.48295, 0.3230234, 0.5500774, 1, 0, 0, 1, 1,
1.488536, -0.554426, 0.7757499, 1, 0, 0, 1, 1,
1.501251, -1.735527, 4.879795, 1, 0, 0, 1, 1,
1.503161, 0.189054, 0.6359954, 0, 0, 0, 1, 1,
1.505044, -0.492943, 0.6751465, 0, 0, 0, 1, 1,
1.505731, -0.06132554, -0.3259793, 0, 0, 0, 1, 1,
1.516677, -1.132252, 3.89706, 0, 0, 0, 1, 1,
1.533139, 0.460856, 0.1531475, 0, 0, 0, 1, 1,
1.545567, -1.634194, 1.893291, 0, 0, 0, 1, 1,
1.556531, 0.400819, 2.132988, 0, 0, 0, 1, 1,
1.564403, -0.8573576, 1.811389, 1, 1, 1, 1, 1,
1.566385, 1.04235, 2.217565, 1, 1, 1, 1, 1,
1.5828, 0.6437186, 1.669348, 1, 1, 1, 1, 1,
1.585992, 0.757401, -0.008838159, 1, 1, 1, 1, 1,
1.620623, -1.188178, 2.752996, 1, 1, 1, 1, 1,
1.63766, -0.2395046, 2.217082, 1, 1, 1, 1, 1,
1.637859, -0.3664134, 0.6564656, 1, 1, 1, 1, 1,
1.642545, -0.6215186, 1.567456, 1, 1, 1, 1, 1,
1.652389, 0.9849763, 1.698105, 1, 1, 1, 1, 1,
1.656728, 0.2075895, 0.08113914, 1, 1, 1, 1, 1,
1.698495, -0.245262, 2.132849, 1, 1, 1, 1, 1,
1.699109, -0.1532941, 0.7547963, 1, 1, 1, 1, 1,
1.707739, -1.617571, 2.5078, 1, 1, 1, 1, 1,
1.714801, -0.5222396, 1.043218, 1, 1, 1, 1, 1,
1.723958, -0.2008336, 2.291618, 1, 1, 1, 1, 1,
1.737319, 0.1154806, -1.05011, 0, 0, 1, 1, 1,
1.738328, 0.5094708, 0.2563925, 1, 0, 0, 1, 1,
1.746538, -0.2072131, 1.717825, 1, 0, 0, 1, 1,
1.748488, 1.70876, 0.3094816, 1, 0, 0, 1, 1,
1.768924, 1.317845, 3.075993, 1, 0, 0, 1, 1,
1.791935, -0.5356691, 2.649797, 1, 0, 0, 1, 1,
1.804209, -0.1178296, 1.717897, 0, 0, 0, 1, 1,
1.806068, 0.4081276, 0.6641306, 0, 0, 0, 1, 1,
1.819884, 1.817227, 0.7182703, 0, 0, 0, 1, 1,
1.821126, -0.2121328, 3.23429, 0, 0, 0, 1, 1,
1.828508, -1.816315, 1.187163, 0, 0, 0, 1, 1,
1.831705, 0.5820666, 0.4911795, 0, 0, 0, 1, 1,
1.854141, -0.008541227, 0.8227769, 0, 0, 0, 1, 1,
1.865847, -1.358343, 1.688029, 1, 1, 1, 1, 1,
1.878732, -2.950029, 1.256712, 1, 1, 1, 1, 1,
1.905694, -0.210356, 1.711348, 1, 1, 1, 1, 1,
1.913292, -1.232617, 1.370351, 1, 1, 1, 1, 1,
1.935337, 0.3957777, -0.9486637, 1, 1, 1, 1, 1,
1.936324, 1.75818, 0.1695412, 1, 1, 1, 1, 1,
1.941039, -1.242854, 2.587718, 1, 1, 1, 1, 1,
1.941339, 1.283294, 0.4451692, 1, 1, 1, 1, 1,
1.946885, -0.2118574, 0.8467873, 1, 1, 1, 1, 1,
1.94831, -0.1675142, 3.918446, 1, 1, 1, 1, 1,
1.958996, -0.2721947, 1.513977, 1, 1, 1, 1, 1,
2.042735, 0.2349002, 3.379396, 1, 1, 1, 1, 1,
2.058975, -0.1873771, 1.655373, 1, 1, 1, 1, 1,
2.062754, 2.819891, 1.884842, 1, 1, 1, 1, 1,
2.062952, -0.2669303, 1.532479, 1, 1, 1, 1, 1,
2.081965, 1.174291, 0.9007874, 0, 0, 1, 1, 1,
2.083454, 0.05336263, 0.6052555, 1, 0, 0, 1, 1,
2.133149, -0.0953882, 1.45088, 1, 0, 0, 1, 1,
2.142087, -1.384667, 1.467749, 1, 0, 0, 1, 1,
2.15232, 0.2733143, 1.413187, 1, 0, 0, 1, 1,
2.155453, 0.84457, 1.616357, 1, 0, 0, 1, 1,
2.169755, -0.1765907, 2.373544, 0, 0, 0, 1, 1,
2.241241, -0.8239172, 2.536896, 0, 0, 0, 1, 1,
2.261315, -2.075157, 0.4719701, 0, 0, 0, 1, 1,
2.284386, 0.07920474, 1.007102, 0, 0, 0, 1, 1,
2.326612, -1.869036, 2.278577, 0, 0, 0, 1, 1,
2.346334, 0.6512762, 1.636962, 0, 0, 0, 1, 1,
2.419846, -0.3969529, 0.7797658, 0, 0, 0, 1, 1,
2.607859, -1.235027, 2.305564, 1, 1, 1, 1, 1,
2.671892, 0.4326649, -0.5995288, 1, 1, 1, 1, 1,
2.676796, 0.8213714, 1.546942, 1, 1, 1, 1, 1,
2.763563, -1.169649, 1.960266, 1, 1, 1, 1, 1,
2.830845, 0.9950861, 2.660376, 1, 1, 1, 1, 1,
2.940145, 0.4460315, 0.9526939, 1, 1, 1, 1, 1,
3.018319, 2.790112, 0.4415373, 1, 1, 1, 1, 1
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
var radius = 9.3525;
var distance = 32.85026;
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
mvMatrix.translate( 0.1312847, -0.06896544, -0.3415198 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.85026);
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
