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
-2.428241, 0.3760153, 0.1238685, 1, 0, 0, 1,
-2.397651, 1.061658, -1.960149, 1, 0.007843138, 0, 1,
-2.360888, 1.497507, -0.9991077, 1, 0.01176471, 0, 1,
-2.333759, 0.22165, -3.10856, 1, 0.01960784, 0, 1,
-2.324162, -0.02833294, -2.656657, 1, 0.02352941, 0, 1,
-2.320691, 1.669395, 0.161487, 1, 0.03137255, 0, 1,
-2.276956, -1.009792, -1.180897, 1, 0.03529412, 0, 1,
-2.268003, -1.515237, -3.372935, 1, 0.04313726, 0, 1,
-2.243098, 0.05788739, -0.6265163, 1, 0.04705882, 0, 1,
-2.147954, -0.7849291, -1.455587, 1, 0.05490196, 0, 1,
-2.089454, 0.05747871, -1.655201, 1, 0.05882353, 0, 1,
-2.085858, 0.3873465, -1.235747, 1, 0.06666667, 0, 1,
-2.039004, -0.3526295, -2.578259, 1, 0.07058824, 0, 1,
-2.015049, -0.1236298, -1.863191, 1, 0.07843138, 0, 1,
-2.004738, 0.0837021, -0.7406235, 1, 0.08235294, 0, 1,
-2.003066, -0.09528229, -1.464761, 1, 0.09019608, 0, 1,
-1.951879, -0.3087357, -0.3637053, 1, 0.09411765, 0, 1,
-1.94465, 1.567606, -1.675355, 1, 0.1019608, 0, 1,
-1.943925, 1.405596, -0.9630445, 1, 0.1098039, 0, 1,
-1.942862, 0.3389801, -1.64009, 1, 0.1137255, 0, 1,
-1.934444, -0.03658863, -1.127554, 1, 0.1215686, 0, 1,
-1.930071, 1.264363, -1.82758, 1, 0.1254902, 0, 1,
-1.918602, -0.5203922, -2.072927, 1, 0.1333333, 0, 1,
-1.913849, 0.1084759, -1.258143, 1, 0.1372549, 0, 1,
-1.907423, 0.08915267, -0.4990045, 1, 0.145098, 0, 1,
-1.887438, -0.5667854, -2.90142, 1, 0.1490196, 0, 1,
-1.872997, -0.0163095, -1.207044, 1, 0.1568628, 0, 1,
-1.870226, 0.5773801, -1.146046, 1, 0.1607843, 0, 1,
-1.865135, -0.7906204, -1.965387, 1, 0.1686275, 0, 1,
-1.85984, 0.5889202, -0.9656771, 1, 0.172549, 0, 1,
-1.84927, -0.7774649, -2.8147, 1, 0.1803922, 0, 1,
-1.844302, -1.349625, -2.819031, 1, 0.1843137, 0, 1,
-1.81197, 0.3352035, -2.150328, 1, 0.1921569, 0, 1,
-1.806568, -2.531046, -2.395177, 1, 0.1960784, 0, 1,
-1.793293, -0.1074335, -1.672969, 1, 0.2039216, 0, 1,
-1.782923, -1.60417, -1.954704, 1, 0.2117647, 0, 1,
-1.759823, 0.7279113, -1.019323, 1, 0.2156863, 0, 1,
-1.753008, 0.5788508, -1.309551, 1, 0.2235294, 0, 1,
-1.728057, 0.3556164, -2.548641, 1, 0.227451, 0, 1,
-1.67765, 0.9759457, -1.146063, 1, 0.2352941, 0, 1,
-1.673825, -0.6200993, -0.9927884, 1, 0.2392157, 0, 1,
-1.644258, 0.08836573, -1.730109, 1, 0.2470588, 0, 1,
-1.644187, -0.1653394, -2.553032, 1, 0.2509804, 0, 1,
-1.638862, -1.765162, -1.633632, 1, 0.2588235, 0, 1,
-1.635444, 1.551727, -2.40687, 1, 0.2627451, 0, 1,
-1.631702, -1.052617, -0.8266588, 1, 0.2705882, 0, 1,
-1.610635, -0.7630551, -2.686031, 1, 0.2745098, 0, 1,
-1.607973, -0.357553, -0.6877857, 1, 0.282353, 0, 1,
-1.606703, -2.601354, -1.712131, 1, 0.2862745, 0, 1,
-1.590115, -0.688511, -1.144479, 1, 0.2941177, 0, 1,
-1.575842, -1.862383, -2.135329, 1, 0.3019608, 0, 1,
-1.570433, 0.2942338, -3.234358, 1, 0.3058824, 0, 1,
-1.569844, 2.338503, -0.01174576, 1, 0.3137255, 0, 1,
-1.569322, 0.2167653, -1.859032, 1, 0.3176471, 0, 1,
-1.554978, 0.7743796, -2.793437, 1, 0.3254902, 0, 1,
-1.552898, -0.114571, -1.406418, 1, 0.3294118, 0, 1,
-1.550432, -0.111884, -2.282231, 1, 0.3372549, 0, 1,
-1.530271, -0.1409029, -1.260706, 1, 0.3411765, 0, 1,
-1.526527, 0.8061985, 0.8649451, 1, 0.3490196, 0, 1,
-1.52081, 0.7378638, 0.001125803, 1, 0.3529412, 0, 1,
-1.515311, 0.2391155, -1.398882, 1, 0.3607843, 0, 1,
-1.513609, -0.9967057, -3.058931, 1, 0.3647059, 0, 1,
-1.504661, 0.7244961, -1.599448, 1, 0.372549, 0, 1,
-1.503261, 0.7168031, -1.154148, 1, 0.3764706, 0, 1,
-1.496889, -0.195708, -2.629148, 1, 0.3843137, 0, 1,
-1.495247, -1.237805, -2.547525, 1, 0.3882353, 0, 1,
-1.486054, -1.291809, -3.080982, 1, 0.3960784, 0, 1,
-1.485876, 1.134734, -2.214046, 1, 0.4039216, 0, 1,
-1.479811, 0.8344122, -1.203598, 1, 0.4078431, 0, 1,
-1.477107, 0.5243446, -0.08169627, 1, 0.4156863, 0, 1,
-1.467819, -1.156505, 0.1154339, 1, 0.4196078, 0, 1,
-1.456989, 0.7655697, -3.116419, 1, 0.427451, 0, 1,
-1.438359, -1.167783, -1.66724, 1, 0.4313726, 0, 1,
-1.432087, -0.4653727, -2.08828, 1, 0.4392157, 0, 1,
-1.426625, -2.02251, -3.322146, 1, 0.4431373, 0, 1,
-1.419863, -0.4651008, -2.050946, 1, 0.4509804, 0, 1,
-1.4175, 0.6292682, -2.522109, 1, 0.454902, 0, 1,
-1.407047, 0.3796005, -0.7826283, 1, 0.4627451, 0, 1,
-1.400026, -0.6422986, -0.3813029, 1, 0.4666667, 0, 1,
-1.387899, 1.26977, 0.135323, 1, 0.4745098, 0, 1,
-1.374064, 0.9527637, -1.594024, 1, 0.4784314, 0, 1,
-1.365521, -0.3670987, -2.29665, 1, 0.4862745, 0, 1,
-1.356164, -0.1910064, -1.317717, 1, 0.4901961, 0, 1,
-1.342965, -0.6796554, -3.377729, 1, 0.4980392, 0, 1,
-1.341282, -0.6784084, -1.667407, 1, 0.5058824, 0, 1,
-1.340983, 1.434213, -0.7263256, 1, 0.509804, 0, 1,
-1.335255, 0.9594448, -0.1833684, 1, 0.5176471, 0, 1,
-1.327472, -0.202862, -3.25148, 1, 0.5215687, 0, 1,
-1.319345, -0.7589717, -2.37216, 1, 0.5294118, 0, 1,
-1.312665, 0.6252021, -0.6742727, 1, 0.5333334, 0, 1,
-1.311105, 0.04195294, -0.9446117, 1, 0.5411765, 0, 1,
-1.307425, 0.1951464, -0.6641742, 1, 0.5450981, 0, 1,
-1.299654, -0.5078773, -1.948832, 1, 0.5529412, 0, 1,
-1.298587, 1.944422, 0.533834, 1, 0.5568628, 0, 1,
-1.293861, 1.60177, -1.462098, 1, 0.5647059, 0, 1,
-1.293151, -0.1836145, -2.188304, 1, 0.5686275, 0, 1,
-1.290876, -0.03044574, -1.956583, 1, 0.5764706, 0, 1,
-1.287573, 0.5309556, -2.740229, 1, 0.5803922, 0, 1,
-1.279467, 1.783501, -0.2538574, 1, 0.5882353, 0, 1,
-1.278081, -0.727866, -2.741323, 1, 0.5921569, 0, 1,
-1.270039, -0.643856, -1.021751, 1, 0.6, 0, 1,
-1.259431, 0.2455312, -2.831173, 1, 0.6078432, 0, 1,
-1.258658, -3.068543, -2.856426, 1, 0.6117647, 0, 1,
-1.256759, 0.8424311, -0.4087663, 1, 0.6196079, 0, 1,
-1.247507, 0.5230798, -0.3619192, 1, 0.6235294, 0, 1,
-1.239342, 0.4573067, -0.5508372, 1, 0.6313726, 0, 1,
-1.236254, -0.9412146, -1.214161, 1, 0.6352941, 0, 1,
-1.231344, 0.2197327, -2.040716, 1, 0.6431373, 0, 1,
-1.228927, 1.09506, -2.154476, 1, 0.6470588, 0, 1,
-1.228781, 0.369678, 0.03088619, 1, 0.654902, 0, 1,
-1.223845, -1.182875, -2.798144, 1, 0.6588235, 0, 1,
-1.222072, 4.278633e-05, -0.7391722, 1, 0.6666667, 0, 1,
-1.221038, 0.008704321, -1.693969, 1, 0.6705883, 0, 1,
-1.220944, -1.958418, -1.513017, 1, 0.6784314, 0, 1,
-1.211846, 1.968044, 0.5797291, 1, 0.682353, 0, 1,
-1.197569, 0.7998139, -1.487293, 1, 0.6901961, 0, 1,
-1.187955, -0.4815475, -1.604108, 1, 0.6941177, 0, 1,
-1.178478, 1.435942, -0.4896322, 1, 0.7019608, 0, 1,
-1.17528, 2.129732, -0.5999965, 1, 0.7098039, 0, 1,
-1.169211, 1.246565, -1.395721, 1, 0.7137255, 0, 1,
-1.1631, -2.272085, -0.5440705, 1, 0.7215686, 0, 1,
-1.160302, -1.030171, -2.365012, 1, 0.7254902, 0, 1,
-1.150912, 1.811498, -0.83097, 1, 0.7333333, 0, 1,
-1.148555, 0.6942959, -0.004877747, 1, 0.7372549, 0, 1,
-1.143889, 0.4107021, -1.793783, 1, 0.7450981, 0, 1,
-1.142037, 0.5999786, -1.241026, 1, 0.7490196, 0, 1,
-1.138614, -1.079829, -2.567677, 1, 0.7568628, 0, 1,
-1.116981, 0.5559201, 0.762018, 1, 0.7607843, 0, 1,
-1.115413, 0.5195591, -0.4920093, 1, 0.7686275, 0, 1,
-1.11332, 2.444814, 1.350027, 1, 0.772549, 0, 1,
-1.111619, -2.278273, -2.714154, 1, 0.7803922, 0, 1,
-1.111409, 0.3339643, -0.05611365, 1, 0.7843137, 0, 1,
-1.102677, 1.246632, -2.324726, 1, 0.7921569, 0, 1,
-1.096648, 0.2507393, -2.489223, 1, 0.7960784, 0, 1,
-1.092252, -0.8406752, -1.594864, 1, 0.8039216, 0, 1,
-1.081861, -0.630554, -3.268419, 1, 0.8117647, 0, 1,
-1.073478, 0.1533419, -1.928214, 1, 0.8156863, 0, 1,
-1.068963, 0.4108713, -0.7425042, 1, 0.8235294, 0, 1,
-1.066842, 1.562895, -1.071615, 1, 0.827451, 0, 1,
-1.064198, 0.9501387, -0.5239119, 1, 0.8352941, 0, 1,
-1.06346, 1.408978, 1.810172, 1, 0.8392157, 0, 1,
-1.063385, 0.8384391, -2.259339, 1, 0.8470588, 0, 1,
-1.06061, -0.8588226, -1.972148, 1, 0.8509804, 0, 1,
-1.054932, -0.4612301, -1.978354, 1, 0.8588235, 0, 1,
-1.047014, -0.4590661, -2.752853, 1, 0.8627451, 0, 1,
-1.043952, -1.410358, -2.34861, 1, 0.8705882, 0, 1,
-1.042417, 0.8432561, -0.1011712, 1, 0.8745098, 0, 1,
-1.038031, 0.09152907, -2.75107, 1, 0.8823529, 0, 1,
-1.023313, -0.4115043, -1.425835, 1, 0.8862745, 0, 1,
-1.021727, -0.6515728, -1.921159, 1, 0.8941177, 0, 1,
-1.020231, -2.248578, -3.671, 1, 0.8980392, 0, 1,
-1.018384, -0.17996, -2.441781, 1, 0.9058824, 0, 1,
-1.018056, 0.3158016, -2.029558, 1, 0.9137255, 0, 1,
-1.017226, -0.7415981, -2.928394, 1, 0.9176471, 0, 1,
-1.015626, 0.9328123, -0.4313648, 1, 0.9254902, 0, 1,
-1.008911, 0.8156397, -2.403685, 1, 0.9294118, 0, 1,
-1.007543, -0.1895561, -2.243859, 1, 0.9372549, 0, 1,
-1.004935, 1.289634, 1.554804, 1, 0.9411765, 0, 1,
-1.003465, -0.08287308, -0.9076924, 1, 0.9490196, 0, 1,
-1.000732, -1.393073, -1.902178, 1, 0.9529412, 0, 1,
-0.9962922, 0.1797522, -1.864272, 1, 0.9607843, 0, 1,
-0.9920642, 0.2035672, -2.414202, 1, 0.9647059, 0, 1,
-0.9899092, 0.261791, -0.8607608, 1, 0.972549, 0, 1,
-0.9865723, -0.9589573, -0.6433577, 1, 0.9764706, 0, 1,
-0.9600157, -0.5819905, -3.690065, 1, 0.9843137, 0, 1,
-0.9579834, 0.215692, -2.218036, 1, 0.9882353, 0, 1,
-0.9521085, 1.236988, 0.05582974, 1, 0.9960784, 0, 1,
-0.9512767, -1.007739, -3.122193, 0.9960784, 1, 0, 1,
-0.9497527, -0.8325576, -2.3948, 0.9921569, 1, 0, 1,
-0.9482731, 0.6675016, 1.096519, 0.9843137, 1, 0, 1,
-0.9438887, 1.390549, -1.514301, 0.9803922, 1, 0, 1,
-0.9408009, -0.009780468, -1.576028, 0.972549, 1, 0, 1,
-0.9359474, 1.162328, -0.0394351, 0.9686275, 1, 0, 1,
-0.9304817, 0.985265, -0.9363273, 0.9607843, 1, 0, 1,
-0.9291503, 1.095, -2.600883, 0.9568627, 1, 0, 1,
-0.9265157, -0.5267509, -1.424099, 0.9490196, 1, 0, 1,
-0.9245062, 0.3489521, -1.530221, 0.945098, 1, 0, 1,
-0.9210809, -0.3257736, -3.182621, 0.9372549, 1, 0, 1,
-0.9207032, 0.7575798, -1.558828, 0.9333333, 1, 0, 1,
-0.9173318, -1.053363, -2.864916, 0.9254902, 1, 0, 1,
-0.9143901, -1.101806, -3.760033, 0.9215686, 1, 0, 1,
-0.9137439, -0.4525942, -1.738589, 0.9137255, 1, 0, 1,
-0.9129883, -0.6822269, -2.222505, 0.9098039, 1, 0, 1,
-0.9088148, 1.193319, -2.053167, 0.9019608, 1, 0, 1,
-0.8994181, 0.7703154, -0.1642782, 0.8941177, 1, 0, 1,
-0.8974152, 0.7539604, -1.798243, 0.8901961, 1, 0, 1,
-0.8947514, -0.2835484, -0.7645982, 0.8823529, 1, 0, 1,
-0.8880481, -1.198488, -1.840495, 0.8784314, 1, 0, 1,
-0.8844745, 0.02333407, -0.1256573, 0.8705882, 1, 0, 1,
-0.8837946, -1.154898, -1.355664, 0.8666667, 1, 0, 1,
-0.8771774, -0.7882375, -2.02524, 0.8588235, 1, 0, 1,
-0.8732219, 0.7790225, -0.204453, 0.854902, 1, 0, 1,
-0.8709082, -1.1807, -2.142144, 0.8470588, 1, 0, 1,
-0.855889, 1.6127, -0.5378653, 0.8431373, 1, 0, 1,
-0.8509262, -0.6784628, -1.962152, 0.8352941, 1, 0, 1,
-0.8505843, 0.2248893, -1.181399, 0.8313726, 1, 0, 1,
-0.848245, -0.6962774, -2.11735, 0.8235294, 1, 0, 1,
-0.836756, -0.3415212, -2.288726, 0.8196079, 1, 0, 1,
-0.8361781, 1.600114, -0.4642196, 0.8117647, 1, 0, 1,
-0.8338516, 0.830422, -0.574915, 0.8078431, 1, 0, 1,
-0.826583, 0.53894, 0.09764887, 0.8, 1, 0, 1,
-0.8259388, -0.4176165, -1.426573, 0.7921569, 1, 0, 1,
-0.8254329, -0.2085157, -1.77593, 0.7882353, 1, 0, 1,
-0.8209203, 0.7226184, 0.5000529, 0.7803922, 1, 0, 1,
-0.8185787, -0.07486612, -1.971738, 0.7764706, 1, 0, 1,
-0.8064394, 0.9795474, -0.5947426, 0.7686275, 1, 0, 1,
-0.8050349, -1.322301, -2.277452, 0.7647059, 1, 0, 1,
-0.8014063, 0.6205419, -0.7013566, 0.7568628, 1, 0, 1,
-0.7879955, -0.02928339, -1.147018, 0.7529412, 1, 0, 1,
-0.7861181, 0.2645064, -1.772085, 0.7450981, 1, 0, 1,
-0.783786, 0.03844129, -2.05698, 0.7411765, 1, 0, 1,
-0.7806647, 0.07066172, -1.661346, 0.7333333, 1, 0, 1,
-0.7791322, 0.8253965, -0.6770557, 0.7294118, 1, 0, 1,
-0.7772226, -0.4989524, -3.342298, 0.7215686, 1, 0, 1,
-0.7768417, 0.6475261, -1.059742, 0.7176471, 1, 0, 1,
-0.7632486, 0.9353384, -1.276026, 0.7098039, 1, 0, 1,
-0.7620799, -0.08899404, -0.8325555, 0.7058824, 1, 0, 1,
-0.7600584, -2.036255, -2.426648, 0.6980392, 1, 0, 1,
-0.7575891, 0.3453042, 0.1178233, 0.6901961, 1, 0, 1,
-0.7572881, 0.5283949, -0.7297747, 0.6862745, 1, 0, 1,
-0.7542644, -0.4751014, -1.631061, 0.6784314, 1, 0, 1,
-0.7516379, 0.153112, -0.6267983, 0.6745098, 1, 0, 1,
-0.7468633, 0.3635028, -2.93424, 0.6666667, 1, 0, 1,
-0.7436007, -1.087885, -1.598128, 0.6627451, 1, 0, 1,
-0.7426874, 0.2523322, -0.6571292, 0.654902, 1, 0, 1,
-0.7422159, -0.37973, -2.31628, 0.6509804, 1, 0, 1,
-0.7414052, -0.2112533, -2.054965, 0.6431373, 1, 0, 1,
-0.738201, 1.237334, -2.206632, 0.6392157, 1, 0, 1,
-0.7340868, -0.07623281, -1.598041, 0.6313726, 1, 0, 1,
-0.7313794, -0.3043419, -2.491452, 0.627451, 1, 0, 1,
-0.7297201, 0.9226174, -1.79195, 0.6196079, 1, 0, 1,
-0.7265312, -0.1471751, -0.8492527, 0.6156863, 1, 0, 1,
-0.7232228, -1.152456, -1.779124, 0.6078432, 1, 0, 1,
-0.7163172, 0.07974721, -0.3122273, 0.6039216, 1, 0, 1,
-0.7127948, 0.6045237, -0.8771501, 0.5960785, 1, 0, 1,
-0.7127301, 0.2762117, -0.3273185, 0.5882353, 1, 0, 1,
-0.7125407, -0.7348469, -2.52087, 0.5843138, 1, 0, 1,
-0.7123398, -0.9944168, -1.797187, 0.5764706, 1, 0, 1,
-0.7100329, 0.6401321, 1.072063, 0.572549, 1, 0, 1,
-0.7077511, 1.215008, 0.3255359, 0.5647059, 1, 0, 1,
-0.707644, -1.46012, -2.147589, 0.5607843, 1, 0, 1,
-0.7049729, 0.2798509, -1.115725, 0.5529412, 1, 0, 1,
-0.6945646, 0.4899543, -0.3612045, 0.5490196, 1, 0, 1,
-0.6898044, -0.8551956, -3.237874, 0.5411765, 1, 0, 1,
-0.6883677, 0.8884994, -0.7962938, 0.5372549, 1, 0, 1,
-0.6866762, -2.222728, -3.354937, 0.5294118, 1, 0, 1,
-0.6860762, -1.027148, -1.345797, 0.5254902, 1, 0, 1,
-0.6849996, -0.1547314, -3.371439, 0.5176471, 1, 0, 1,
-0.6817182, -0.07712576, -1.963551, 0.5137255, 1, 0, 1,
-0.6757203, -0.9285042, -2.174408, 0.5058824, 1, 0, 1,
-0.6673638, -0.1792504, -1.440394, 0.5019608, 1, 0, 1,
-0.6631866, -0.9596047, -2.794194, 0.4941176, 1, 0, 1,
-0.6626665, -2.40257, -2.020507, 0.4862745, 1, 0, 1,
-0.6626432, 0.5333391, -1.401885, 0.4823529, 1, 0, 1,
-0.6591679, 0.4889541, 0.1656596, 0.4745098, 1, 0, 1,
-0.6586915, 2.747533, 0.0689242, 0.4705882, 1, 0, 1,
-0.6583178, -0.4100085, -3.91145, 0.4627451, 1, 0, 1,
-0.6582534, -0.4353687, -1.717659, 0.4588235, 1, 0, 1,
-0.651525, -1.542871, -3.73052, 0.4509804, 1, 0, 1,
-0.6503947, -0.04285435, -2.864886, 0.4470588, 1, 0, 1,
-0.6446118, -0.383906, -3.927481, 0.4392157, 1, 0, 1,
-0.6401944, 0.9863555, -3.163627, 0.4352941, 1, 0, 1,
-0.6398821, -0.8264714, -2.519818, 0.427451, 1, 0, 1,
-0.6393076, 0.1185278, -0.02690724, 0.4235294, 1, 0, 1,
-0.6382256, 0.009730102, -1.729928, 0.4156863, 1, 0, 1,
-0.6367712, -0.7473072, -1.806238, 0.4117647, 1, 0, 1,
-0.634846, 1.302183, -0.0009588004, 0.4039216, 1, 0, 1,
-0.6335813, -0.7661207, -2.259886, 0.3960784, 1, 0, 1,
-0.6306124, 0.4934133, -0.8884563, 0.3921569, 1, 0, 1,
-0.6305408, -1.253448, -3.693659, 0.3843137, 1, 0, 1,
-0.6277243, -1.813492, -3.084184, 0.3803922, 1, 0, 1,
-0.6265934, -0.9600887, -3.232195, 0.372549, 1, 0, 1,
-0.6242598, -0.32262, -2.831059, 0.3686275, 1, 0, 1,
-0.6229916, -0.7151766, -5.263915, 0.3607843, 1, 0, 1,
-0.6182505, -0.5910284, -3.337827, 0.3568628, 1, 0, 1,
-0.6090996, -0.6112829, -1.624897, 0.3490196, 1, 0, 1,
-0.6069766, 0.1232907, -1.147921, 0.345098, 1, 0, 1,
-0.6067147, -0.2203736, -2.705489, 0.3372549, 1, 0, 1,
-0.6037157, -0.107885, -0.7160739, 0.3333333, 1, 0, 1,
-0.5965845, -0.6525443, -3.000286, 0.3254902, 1, 0, 1,
-0.5953842, -0.168925, -1.69877, 0.3215686, 1, 0, 1,
-0.59248, -0.0421358, -0.4078526, 0.3137255, 1, 0, 1,
-0.5830283, 0.8445913, -0.03041038, 0.3098039, 1, 0, 1,
-0.5807399, 0.9304077, -2.560477, 0.3019608, 1, 0, 1,
-0.5807264, 0.7084842, -1.1874, 0.2941177, 1, 0, 1,
-0.5782728, 0.4163717, -0.8952919, 0.2901961, 1, 0, 1,
-0.5772135, -2.071026, -3.389637, 0.282353, 1, 0, 1,
-0.5761986, 0.5049276, -1.97751, 0.2784314, 1, 0, 1,
-0.5712685, 1.198088, 0.2249737, 0.2705882, 1, 0, 1,
-0.568391, 0.004942574, -0.5177334, 0.2666667, 1, 0, 1,
-0.5657045, 0.5286947, -1.747565, 0.2588235, 1, 0, 1,
-0.5627923, 0.4518116, -0.3348387, 0.254902, 1, 0, 1,
-0.5559003, -1.62792, -2.666353, 0.2470588, 1, 0, 1,
-0.5471447, -1.403589, -3.513851, 0.2431373, 1, 0, 1,
-0.5438342, 0.5853398, -1.019975, 0.2352941, 1, 0, 1,
-0.5411113, 1.166482, 0.1330792, 0.2313726, 1, 0, 1,
-0.5344273, 0.9670368, -0.1482689, 0.2235294, 1, 0, 1,
-0.5341732, -0.4505346, -1.412226, 0.2196078, 1, 0, 1,
-0.5337632, 0.4112944, -0.3643857, 0.2117647, 1, 0, 1,
-0.5337408, -0.5851067, -2.635758, 0.2078431, 1, 0, 1,
-0.5333822, 0.1363228, -1.949603, 0.2, 1, 0, 1,
-0.5237139, 1.192758, -1.745108, 0.1921569, 1, 0, 1,
-0.5220357, -0.7989717, -4.85928, 0.1882353, 1, 0, 1,
-0.5212473, -0.3919237, -0.4859001, 0.1803922, 1, 0, 1,
-0.5210915, -0.7966789, -2.920763, 0.1764706, 1, 0, 1,
-0.5187914, 0.8150659, -0.5046548, 0.1686275, 1, 0, 1,
-0.516701, -0.2380799, -0.9907179, 0.1647059, 1, 0, 1,
-0.5160408, -0.529329, -2.561917, 0.1568628, 1, 0, 1,
-0.516013, -1.2701, -2.151445, 0.1529412, 1, 0, 1,
-0.512694, -0.9883457, -5.230604, 0.145098, 1, 0, 1,
-0.5063374, 1.344886, -0.2455416, 0.1411765, 1, 0, 1,
-0.5017418, -1.090175, -3.29688, 0.1333333, 1, 0, 1,
-0.4977651, 0.5568334, -0.5695299, 0.1294118, 1, 0, 1,
-0.4970433, 0.05822824, -0.9761677, 0.1215686, 1, 0, 1,
-0.4923798, 1.624722, 0.623115, 0.1176471, 1, 0, 1,
-0.4912443, 0.4652617, -0.3906692, 0.1098039, 1, 0, 1,
-0.4902939, 0.5075985, 1.18024, 0.1058824, 1, 0, 1,
-0.4873518, -1.377831, -2.565154, 0.09803922, 1, 0, 1,
-0.4854355, -1.08482, -2.590465, 0.09019608, 1, 0, 1,
-0.4850589, 0.2406835, -0.7207934, 0.08627451, 1, 0, 1,
-0.4816329, -1.033991, -2.516525, 0.07843138, 1, 0, 1,
-0.4807837, -1.330497, -3.301626, 0.07450981, 1, 0, 1,
-0.4807126, -0.3011001, -2.356066, 0.06666667, 1, 0, 1,
-0.4772222, 0.5201976, -1.865651, 0.0627451, 1, 0, 1,
-0.4755352, -0.3293886, -0.1257527, 0.05490196, 1, 0, 1,
-0.4666015, 1.545181, 0.6421857, 0.05098039, 1, 0, 1,
-0.4617382, -0.3440498, -2.470945, 0.04313726, 1, 0, 1,
-0.4595267, -0.2939864, -1.540579, 0.03921569, 1, 0, 1,
-0.4571133, -0.3638023, -2.181619, 0.03137255, 1, 0, 1,
-0.453232, -2.698328, -3.773849, 0.02745098, 1, 0, 1,
-0.450956, -1.17861, -1.693829, 0.01960784, 1, 0, 1,
-0.4507654, 1.467397, -1.480151, 0.01568628, 1, 0, 1,
-0.4467404, -0.5322159, -1.633866, 0.007843138, 1, 0, 1,
-0.4456882, 0.7688234, -1.39064, 0.003921569, 1, 0, 1,
-0.4419396, 1.258434, 1.310564, 0, 1, 0.003921569, 1,
-0.4381054, 0.319169, 0.8448504, 0, 1, 0.01176471, 1,
-0.4372601, 1.316541, 0.8588599, 0, 1, 0.01568628, 1,
-0.4324535, -1.684057, -3.726377, 0, 1, 0.02352941, 1,
-0.4312088, -0.09580855, 0.8924214, 0, 1, 0.02745098, 1,
-0.4234679, -0.0486857, -0.8302919, 0, 1, 0.03529412, 1,
-0.4224364, -0.09945468, -1.073811, 0, 1, 0.03921569, 1,
-0.4214085, -1.259099, -4.25089, 0, 1, 0.04705882, 1,
-0.4134278, 0.03748878, -2.793214, 0, 1, 0.05098039, 1,
-0.4116138, -0.3931029, -3.338835, 0, 1, 0.05882353, 1,
-0.4049158, 0.8946527, -0.4081792, 0, 1, 0.0627451, 1,
-0.4043988, 0.7365659, -0.472592, 0, 1, 0.07058824, 1,
-0.4031921, 0.6630573, -0.7474273, 0, 1, 0.07450981, 1,
-0.4018174, -1.955338, -3.416683, 0, 1, 0.08235294, 1,
-0.3964451, 0.2575211, -3.987813, 0, 1, 0.08627451, 1,
-0.3940049, -1.402998, -3.187071, 0, 1, 0.09411765, 1,
-0.3938957, -1.576679, -2.760541, 0, 1, 0.1019608, 1,
-0.3899527, 0.4863684, -1.571485, 0, 1, 0.1058824, 1,
-0.3874372, -0.1816252, -2.349638, 0, 1, 0.1137255, 1,
-0.3859661, 0.8940067, -2.030405, 0, 1, 0.1176471, 1,
-0.3834831, 1.611526, 0.7009277, 0, 1, 0.1254902, 1,
-0.3822833, 0.4914558, -0.5616746, 0, 1, 0.1294118, 1,
-0.3803604, -0.7145579, -2.074457, 0, 1, 0.1372549, 1,
-0.380087, -1.288508, -2.377192, 0, 1, 0.1411765, 1,
-0.3797531, 0.2375897, -0.8352746, 0, 1, 0.1490196, 1,
-0.3779341, 1.835112, -0.6686746, 0, 1, 0.1529412, 1,
-0.3752234, 0.7235815, 0.9761213, 0, 1, 0.1607843, 1,
-0.3732085, -1.061412, -4.859878, 0, 1, 0.1647059, 1,
-0.3725939, -2.469489, -2.399178, 0, 1, 0.172549, 1,
-0.372475, -0.5765137, -2.461535, 0, 1, 0.1764706, 1,
-0.372034, 0.890186, -0.5082692, 0, 1, 0.1843137, 1,
-0.3665274, 0.7473224, -2.062786, 0, 1, 0.1882353, 1,
-0.3657955, 0.4292542, -0.6098751, 0, 1, 0.1960784, 1,
-0.3646227, 0.8073375, -0.6606349, 0, 1, 0.2039216, 1,
-0.3628571, -1.871734, -3.362966, 0, 1, 0.2078431, 1,
-0.3609168, 0.1241696, -1.711525, 0, 1, 0.2156863, 1,
-0.3602046, 2.185233, 0.4835812, 0, 1, 0.2196078, 1,
-0.3580146, 1.332308, -0.2978386, 0, 1, 0.227451, 1,
-0.3576873, 0.3301116, -0.431069, 0, 1, 0.2313726, 1,
-0.3570749, -2.812039, -1.289325, 0, 1, 0.2392157, 1,
-0.3562591, -0.04672308, -0.8512512, 0, 1, 0.2431373, 1,
-0.3558195, -1.072631, -2.797647, 0, 1, 0.2509804, 1,
-0.3527111, 0.05207656, -1.075507, 0, 1, 0.254902, 1,
-0.3510163, 0.2316239, -1.11579, 0, 1, 0.2627451, 1,
-0.3501366, -0.7728117, -1.95539, 0, 1, 0.2666667, 1,
-0.3475437, -0.7955267, -4.3023, 0, 1, 0.2745098, 1,
-0.3462143, -0.9519631, -2.818604, 0, 1, 0.2784314, 1,
-0.3439636, -0.4240368, -1.22428, 0, 1, 0.2862745, 1,
-0.3431112, -0.1180979, -2.779328, 0, 1, 0.2901961, 1,
-0.3418226, -0.6426639, -2.282352, 0, 1, 0.2980392, 1,
-0.3381993, -1.406083, -1.897731, 0, 1, 0.3058824, 1,
-0.3358755, 0.635499, -0.2887615, 0, 1, 0.3098039, 1,
-0.33523, -2.119452, -2.860965, 0, 1, 0.3176471, 1,
-0.3348595, 0.6797673, 0.1397094, 0, 1, 0.3215686, 1,
-0.3334091, 0.804772, -0.8755319, 0, 1, 0.3294118, 1,
-0.3289355, 1.924442, -0.7028531, 0, 1, 0.3333333, 1,
-0.3289018, -0.8636783, -3.744172, 0, 1, 0.3411765, 1,
-0.3189121, -0.3854973, -0.9789358, 0, 1, 0.345098, 1,
-0.3186864, 0.0899493, -2.487832, 0, 1, 0.3529412, 1,
-0.3112072, 0.120377, -1.61764, 0, 1, 0.3568628, 1,
-0.3042356, -0.5063, -1.841422, 0, 1, 0.3647059, 1,
-0.2974381, -0.2021363, -1.830808, 0, 1, 0.3686275, 1,
-0.2973604, 3.204524, -0.04284385, 0, 1, 0.3764706, 1,
-0.2970763, 0.03293694, -2.284736, 0, 1, 0.3803922, 1,
-0.2952643, 1.572876, 0.659668, 0, 1, 0.3882353, 1,
-0.2887368, 0.5314301, -1.319865, 0, 1, 0.3921569, 1,
-0.2847972, 2.968632, -0.9850736, 0, 1, 0.4, 1,
-0.2830518, 0.3638093, -1.708977, 0, 1, 0.4078431, 1,
-0.2796811, -1.618276, -0.4941331, 0, 1, 0.4117647, 1,
-0.279032, 0.7718092, -0.8358042, 0, 1, 0.4196078, 1,
-0.2733854, 0.9607363, -0.01407587, 0, 1, 0.4235294, 1,
-0.269614, -0.526409, -2.58577, 0, 1, 0.4313726, 1,
-0.2590766, 0.06415913, -1.16729, 0, 1, 0.4352941, 1,
-0.2573445, -1.223395, -3.870563, 0, 1, 0.4431373, 1,
-0.256954, -2.406, -3.983245, 0, 1, 0.4470588, 1,
-0.2542722, 0.5176582, -0.6136242, 0, 1, 0.454902, 1,
-0.2540197, 2.278338, -1.622504, 0, 1, 0.4588235, 1,
-0.252257, -1.278107, -1.584401, 0, 1, 0.4666667, 1,
-0.2501524, 0.6382954, -3.487795, 0, 1, 0.4705882, 1,
-0.2475257, -0.1138603, -2.621911, 0, 1, 0.4784314, 1,
-0.2465677, -0.2893138, -1.17796, 0, 1, 0.4823529, 1,
-0.2449195, 0.6953453, -0.5958725, 0, 1, 0.4901961, 1,
-0.2431197, 1.454477, -0.2193501, 0, 1, 0.4941176, 1,
-0.240308, 1.260565, 0.4781452, 0, 1, 0.5019608, 1,
-0.2358892, 0.4834396, 0.2682305, 0, 1, 0.509804, 1,
-0.2303894, 0.7741493, -0.6293682, 0, 1, 0.5137255, 1,
-0.2301305, -0.07879222, -2.179048, 0, 1, 0.5215687, 1,
-0.2261131, -1.313995, -3.493025, 0, 1, 0.5254902, 1,
-0.2235993, 2.308173, -1.026096, 0, 1, 0.5333334, 1,
-0.2211738, 1.315252, -1.017832, 0, 1, 0.5372549, 1,
-0.2171135, 0.9460641, -0.9740271, 0, 1, 0.5450981, 1,
-0.2170227, -0.1330754, -1.827482, 0, 1, 0.5490196, 1,
-0.2162465, 0.2666518, 0.1265826, 0, 1, 0.5568628, 1,
-0.2160453, 1.682632, 0.4979409, 0, 1, 0.5607843, 1,
-0.2155589, 0.7635013, -1.052679, 0, 1, 0.5686275, 1,
-0.2153964, -0.2723148, -2.09519, 0, 1, 0.572549, 1,
-0.2152532, 0.7517279, -0.05255965, 0, 1, 0.5803922, 1,
-0.2127026, 1.367391, 0.4339359, 0, 1, 0.5843138, 1,
-0.2124211, 1.357667, -1.722614, 0, 1, 0.5921569, 1,
-0.2118842, 2.071354, 0.3364969, 0, 1, 0.5960785, 1,
-0.2109307, 0.3271777, -0.3918781, 0, 1, 0.6039216, 1,
-0.1981801, 1.06229, 0.1128392, 0, 1, 0.6117647, 1,
-0.1963252, 0.4498975, -0.2230347, 0, 1, 0.6156863, 1,
-0.1960703, -0.1366518, -1.855495, 0, 1, 0.6235294, 1,
-0.196046, -1.335165, -3.509367, 0, 1, 0.627451, 1,
-0.1924955, 0.4547243, 0.6821191, 0, 1, 0.6352941, 1,
-0.1919774, -1.038082, -3.449889, 0, 1, 0.6392157, 1,
-0.189548, 0.9623863, -1.092731, 0, 1, 0.6470588, 1,
-0.1844883, -0.06185281, -1.321185, 0, 1, 0.6509804, 1,
-0.1807823, -0.3250896, -3.579966, 0, 1, 0.6588235, 1,
-0.179328, 0.6220273, -0.8817633, 0, 1, 0.6627451, 1,
-0.175861, -1.359766, -3.24281, 0, 1, 0.6705883, 1,
-0.175813, -1.057993, -2.600832, 0, 1, 0.6745098, 1,
-0.175746, -0.4462658, -2.051366, 0, 1, 0.682353, 1,
-0.1740925, 0.7265849, 0.8097177, 0, 1, 0.6862745, 1,
-0.1706107, 1.358439, -0.4456109, 0, 1, 0.6941177, 1,
-0.1702866, 0.6078159, 0.774427, 0, 1, 0.7019608, 1,
-0.1696479, -2.309638, -2.019924, 0, 1, 0.7058824, 1,
-0.1623976, 0.5420083, -1.697317, 0, 1, 0.7137255, 1,
-0.1577214, 0.8366787, 1.671465, 0, 1, 0.7176471, 1,
-0.1575843, 1.281486, 0.05456186, 0, 1, 0.7254902, 1,
-0.1556957, 0.8589929, 0.5765381, 0, 1, 0.7294118, 1,
-0.154094, -0.4467146, -1.57333, 0, 1, 0.7372549, 1,
-0.1534025, 0.09647726, -1.692052, 0, 1, 0.7411765, 1,
-0.146599, -1.124689, -1.772929, 0, 1, 0.7490196, 1,
-0.1448794, -0.5489044, -2.32003, 0, 1, 0.7529412, 1,
-0.1436044, -1.641839, -3.175067, 0, 1, 0.7607843, 1,
-0.142279, 0.7395322, 0.4010699, 0, 1, 0.7647059, 1,
-0.1397652, 1.242721, 0.4369232, 0, 1, 0.772549, 1,
-0.1384538, 0.6195797, -0.7932269, 0, 1, 0.7764706, 1,
-0.1352201, 0.3412983, 0.1524005, 0, 1, 0.7843137, 1,
-0.1336235, -0.4352382, -1.734975, 0, 1, 0.7882353, 1,
-0.1328024, 0.4894797, -2.619886, 0, 1, 0.7960784, 1,
-0.1305429, -0.7507372, -3.907531, 0, 1, 0.8039216, 1,
-0.1266587, 0.1632563, -1.492976, 0, 1, 0.8078431, 1,
-0.1266371, -0.2804937, -3.173398, 0, 1, 0.8156863, 1,
-0.1264043, -1.497863, -3.960193, 0, 1, 0.8196079, 1,
-0.1253575, -0.1436588, -1.226052, 0, 1, 0.827451, 1,
-0.1216218, -0.8168901, -1.54638, 0, 1, 0.8313726, 1,
-0.1134472, 1.536776, 0.7176688, 0, 1, 0.8392157, 1,
-0.1122419, 1.385013, -0.7102266, 0, 1, 0.8431373, 1,
-0.1107052, 1.269254, 1.274565, 0, 1, 0.8509804, 1,
-0.1104786, 0.7200401, -1.774713, 0, 1, 0.854902, 1,
-0.1066412, 0.3866592, -0.608938, 0, 1, 0.8627451, 1,
-0.1060949, -0.00802652, -1.441279, 0, 1, 0.8666667, 1,
-0.1040676, -0.3064133, -2.832105, 0, 1, 0.8745098, 1,
-0.1022643, 1.396142, 0.4180285, 0, 1, 0.8784314, 1,
-0.101848, 2.803058, -0.2580914, 0, 1, 0.8862745, 1,
-0.101497, 0.6327345, -0.2068442, 0, 1, 0.8901961, 1,
-0.1013448, -0.2563725, -1.398959, 0, 1, 0.8980392, 1,
-0.101058, 0.1502591, 0.9818473, 0, 1, 0.9058824, 1,
-0.1007252, 2.053639, 0.7989699, 0, 1, 0.9098039, 1,
-0.09696772, 0.1506722, -1.78487, 0, 1, 0.9176471, 1,
-0.0935931, 0.5953403, -0.2326435, 0, 1, 0.9215686, 1,
-0.09259782, 1.047241, 0.02210013, 0, 1, 0.9294118, 1,
-0.08963707, -1.131425, -1.797907, 0, 1, 0.9333333, 1,
-0.08950379, -1.515107, -4.327508, 0, 1, 0.9411765, 1,
-0.08229595, 0.01102598, -1.124502, 0, 1, 0.945098, 1,
-0.08120708, -0.5069537, -2.556934, 0, 1, 0.9529412, 1,
-0.08077666, 0.730992, -1.037148, 0, 1, 0.9568627, 1,
-0.08029197, -0.7375162, -2.955173, 0, 1, 0.9647059, 1,
-0.0789393, -0.2046846, -4.381845, 0, 1, 0.9686275, 1,
-0.07854237, -1.02661, -3.477544, 0, 1, 0.9764706, 1,
-0.07728637, 0.421313, -0.8675535, 0, 1, 0.9803922, 1,
-0.06684367, 1.341859, 0.3012755, 0, 1, 0.9882353, 1,
-0.06485045, 0.4259825, -1.078771, 0, 1, 0.9921569, 1,
-0.06479523, -0.155966, -2.439448, 0, 1, 1, 1,
-0.06214317, -1.309609, -2.784823, 0, 0.9921569, 1, 1,
-0.05979801, 1.130036, 0.2020365, 0, 0.9882353, 1, 1,
-0.05281033, 0.4532512, 0.4575643, 0, 0.9803922, 1, 1,
-0.05255368, -0.5411081, -4.107238, 0, 0.9764706, 1, 1,
-0.04997282, 0.7534723, -0.2042316, 0, 0.9686275, 1, 1,
-0.04272531, 0.1994398, 1.641169, 0, 0.9647059, 1, 1,
-0.04232438, -0.6915122, -3.536609, 0, 0.9568627, 1, 1,
-0.0419357, 0.3782844, -1.066459, 0, 0.9529412, 1, 1,
-0.03930567, -0.3892215, -5.601007, 0, 0.945098, 1, 1,
-0.03685671, -0.7972099, -1.772329, 0, 0.9411765, 1, 1,
-0.03316749, 1.252955, -0.5097182, 0, 0.9333333, 1, 1,
-0.03159037, 2.673175, -1.228597, 0, 0.9294118, 1, 1,
-0.02947129, 1.024713, -0.2264306, 0, 0.9215686, 1, 1,
-0.02673329, 0.8768998, 0.5599595, 0, 0.9176471, 1, 1,
-0.02431615, 0.4900306, -0.9821458, 0, 0.9098039, 1, 1,
-0.01762043, -0.6928296, -2.059674, 0, 0.9058824, 1, 1,
-0.0156788, -1.436292, -4.109363, 0, 0.8980392, 1, 1,
-0.01324433, 1.384571, -0.8656723, 0, 0.8901961, 1, 1,
-0.01201568, -0.1149945, -4.008917, 0, 0.8862745, 1, 1,
-0.01080341, -1.402796, -3.593324, 0, 0.8784314, 1, 1,
0.004634175, -1.057572, 0.4628761, 0, 0.8745098, 1, 1,
0.009430662, 0.7230781, -0.008363672, 0, 0.8666667, 1, 1,
0.01025873, -0.9515408, 3.608032, 0, 0.8627451, 1, 1,
0.01230239, -0.9777616, 4.553787, 0, 0.854902, 1, 1,
0.01386008, -0.4416846, 4.080399, 0, 0.8509804, 1, 1,
0.02386268, 1.211909, 0.7487316, 0, 0.8431373, 1, 1,
0.02506792, 1.624963, -0.3176706, 0, 0.8392157, 1, 1,
0.03261881, -0.4724966, 2.884801, 0, 0.8313726, 1, 1,
0.03277229, 0.7473652, 2.125378, 0, 0.827451, 1, 1,
0.03836918, -0.3044976, 3.052656, 0, 0.8196079, 1, 1,
0.04261906, 0.9980582, 1.69481, 0, 0.8156863, 1, 1,
0.04397245, 0.2228263, -1.919968, 0, 0.8078431, 1, 1,
0.04527359, -0.6759645, 5.090677, 0, 0.8039216, 1, 1,
0.04691436, 0.1062593, 0.6788133, 0, 0.7960784, 1, 1,
0.04736546, -0.6389484, 4.686508, 0, 0.7882353, 1, 1,
0.05115249, -0.1943517, 3.327716, 0, 0.7843137, 1, 1,
0.05424253, -0.1353639, 3.524285, 0, 0.7764706, 1, 1,
0.0542855, 0.1251613, 0.3436767, 0, 0.772549, 1, 1,
0.05694988, 0.1385185, 0.9870476, 0, 0.7647059, 1, 1,
0.05923324, -0.9294128, 1.6545, 0, 0.7607843, 1, 1,
0.05942025, -1.764879, 4.942008, 0, 0.7529412, 1, 1,
0.06439782, -0.9176047, 1.800314, 0, 0.7490196, 1, 1,
0.07162502, -0.5453183, 3.416711, 0, 0.7411765, 1, 1,
0.07534008, -0.2697487, 2.586217, 0, 0.7372549, 1, 1,
0.07693695, 1.605391, -0.6328039, 0, 0.7294118, 1, 1,
0.07698705, 1.260792, 0.1249846, 0, 0.7254902, 1, 1,
0.0815219, 1.887945, -1.013102, 0, 0.7176471, 1, 1,
0.08185755, -0.5646451, 3.021155, 0, 0.7137255, 1, 1,
0.08219247, 1.562444, 0.110222, 0, 0.7058824, 1, 1,
0.08232123, 1.980259, 1.027282, 0, 0.6980392, 1, 1,
0.0824661, -1.046996, 3.053471, 0, 0.6941177, 1, 1,
0.08443024, 1.068637, -0.4365928, 0, 0.6862745, 1, 1,
0.0860362, -0.2084964, 2.865468, 0, 0.682353, 1, 1,
0.08760986, -0.1297507, 2.144379, 0, 0.6745098, 1, 1,
0.08881021, -0.9793764, 2.630552, 0, 0.6705883, 1, 1,
0.08901402, -0.4029044, 2.921101, 0, 0.6627451, 1, 1,
0.09653585, 1.357909, -0.8256047, 0, 0.6588235, 1, 1,
0.09745632, -0.9885, 3.636162, 0, 0.6509804, 1, 1,
0.09786431, 0.5871378, -1.328326, 0, 0.6470588, 1, 1,
0.09843048, 1.923928, -0.1795398, 0, 0.6392157, 1, 1,
0.09894374, 0.1996851, 0.7294297, 0, 0.6352941, 1, 1,
0.09917978, -0.1099551, 0.8024702, 0, 0.627451, 1, 1,
0.1005822, 0.9524676, 0.3851255, 0, 0.6235294, 1, 1,
0.1058709, -0.07297986, 2.801329, 0, 0.6156863, 1, 1,
0.105938, 0.1547754, -0.432377, 0, 0.6117647, 1, 1,
0.1071821, 0.5498372, -0.3050552, 0, 0.6039216, 1, 1,
0.107974, -0.1547973, 3.332288, 0, 0.5960785, 1, 1,
0.108773, 0.04361484, 0.2286142, 0, 0.5921569, 1, 1,
0.1114459, -0.3482634, 5.045754, 0, 0.5843138, 1, 1,
0.1137918, -2.205868, 2.894362, 0, 0.5803922, 1, 1,
0.1153018, -0.2237656, 2.210586, 0, 0.572549, 1, 1,
0.1183391, 0.1167194, 0.5552375, 0, 0.5686275, 1, 1,
0.1192899, 1.334177, 0.8631592, 0, 0.5607843, 1, 1,
0.1207949, 0.5182136, 0.02193098, 0, 0.5568628, 1, 1,
0.1213968, -1.440523, 2.008219, 0, 0.5490196, 1, 1,
0.1244317, 1.260965, 0.6124749, 0, 0.5450981, 1, 1,
0.1245703, 0.8601287, -0.7292328, 0, 0.5372549, 1, 1,
0.1261653, -0.8692281, 3.805525, 0, 0.5333334, 1, 1,
0.1300446, -0.8570721, 2.327229, 0, 0.5254902, 1, 1,
0.1368929, 1.045791, 1.4556, 0, 0.5215687, 1, 1,
0.136986, 1.664982, -0.8457748, 0, 0.5137255, 1, 1,
0.1387753, 0.4290203, 0.1178922, 0, 0.509804, 1, 1,
0.1423236, 0.5389407, 0.8706209, 0, 0.5019608, 1, 1,
0.1456807, 0.5341468, 3.082389, 0, 0.4941176, 1, 1,
0.1475377, 0.6575664, 2.017718, 0, 0.4901961, 1, 1,
0.1476388, -0.6614685, 3.241346, 0, 0.4823529, 1, 1,
0.1563271, 0.07474432, -0.2779231, 0, 0.4784314, 1, 1,
0.1574661, -0.005518322, 1.771939, 0, 0.4705882, 1, 1,
0.158413, 0.08376555, 3.372377, 0, 0.4666667, 1, 1,
0.1617192, 1.085815, 0.171232, 0, 0.4588235, 1, 1,
0.1669424, 0.2709562, 1.205573, 0, 0.454902, 1, 1,
0.1681844, -0.09017133, 2.065182, 0, 0.4470588, 1, 1,
0.172415, -0.8756022, 2.766381, 0, 0.4431373, 1, 1,
0.1786152, 0.8043153, 1.529129, 0, 0.4352941, 1, 1,
0.17942, 1.068632, 1.338616, 0, 0.4313726, 1, 1,
0.1919354, -0.3186429, 2.8289, 0, 0.4235294, 1, 1,
0.1963878, 0.5966963, 0.3039169, 0, 0.4196078, 1, 1,
0.1968144, -0.7566949, 2.050983, 0, 0.4117647, 1, 1,
0.1993168, 0.9439183, -1.418387, 0, 0.4078431, 1, 1,
0.2049429, 0.3778961, 0.4258459, 0, 0.4, 1, 1,
0.2069262, 0.5560176, -0.5381522, 0, 0.3921569, 1, 1,
0.2094291, -0.03742718, 1.832566, 0, 0.3882353, 1, 1,
0.2102861, -1.308896, 1.970256, 0, 0.3803922, 1, 1,
0.2162989, 0.009214764, 2.903534, 0, 0.3764706, 1, 1,
0.2195074, -1.667262, 4.78521, 0, 0.3686275, 1, 1,
0.2207519, 0.6646025, 0.9858983, 0, 0.3647059, 1, 1,
0.2238784, -0.3239745, 2.128683, 0, 0.3568628, 1, 1,
0.2239178, -0.4039856, 3.289979, 0, 0.3529412, 1, 1,
0.2287261, -1.228916, 3.113695, 0, 0.345098, 1, 1,
0.2336357, 1.585932, -1.22444, 0, 0.3411765, 1, 1,
0.2398972, -1.499443, 1.884131, 0, 0.3333333, 1, 1,
0.2453665, 0.8942116, 0.6776279, 0, 0.3294118, 1, 1,
0.247044, 2.492738, -0.0137673, 0, 0.3215686, 1, 1,
0.2475208, -1.758774, 3.184419, 0, 0.3176471, 1, 1,
0.25374, 0.8936711, 0.6631592, 0, 0.3098039, 1, 1,
0.2541581, -0.9398243, 3.522222, 0, 0.3058824, 1, 1,
0.2554896, 0.5906231, 0.09560575, 0, 0.2980392, 1, 1,
0.2558432, 0.07320016, 1.520061, 0, 0.2901961, 1, 1,
0.260259, -0.1771691, 2.710052, 0, 0.2862745, 1, 1,
0.2603146, -0.8006182, 3.26318, 0, 0.2784314, 1, 1,
0.2603969, -1.168865, 1.955895, 0, 0.2745098, 1, 1,
0.2627205, 0.6208178, 0.2743712, 0, 0.2666667, 1, 1,
0.2665798, 0.00351586, 0.8580339, 0, 0.2627451, 1, 1,
0.2668165, -0.2716096, 2.715233, 0, 0.254902, 1, 1,
0.2670685, -1.516206, 3.597832, 0, 0.2509804, 1, 1,
0.2683817, -0.2514674, 2.485817, 0, 0.2431373, 1, 1,
0.269168, -0.06602492, 0.4777114, 0, 0.2392157, 1, 1,
0.2703697, -0.7824332, 3.810137, 0, 0.2313726, 1, 1,
0.2712396, 1.620622, 0.01048279, 0, 0.227451, 1, 1,
0.2777766, 0.922213, -1.525977, 0, 0.2196078, 1, 1,
0.277868, 0.2349994, 0.5119576, 0, 0.2156863, 1, 1,
0.2806437, 0.1796558, 0.706057, 0, 0.2078431, 1, 1,
0.2865585, 0.1360168, 1.853881, 0, 0.2039216, 1, 1,
0.2919876, 0.4476185, 0.5913513, 0, 0.1960784, 1, 1,
0.2923225, 0.2195853, 1.48602, 0, 0.1882353, 1, 1,
0.2960822, -1.025668, 1.428817, 0, 0.1843137, 1, 1,
0.2970649, -0.320123, 0.7280765, 0, 0.1764706, 1, 1,
0.2976002, 1.042632, 0.5211473, 0, 0.172549, 1, 1,
0.302194, -0.3421616, 2.594415, 0, 0.1647059, 1, 1,
0.3031766, -0.6237011, 3.988561, 0, 0.1607843, 1, 1,
0.3070882, 1.75734, -1.561545, 0, 0.1529412, 1, 1,
0.3109425, 0.1183273, 0.585261, 0, 0.1490196, 1, 1,
0.3118594, -0.7070479, 3.353627, 0, 0.1411765, 1, 1,
0.3132358, -1.974483, 3.911201, 0, 0.1372549, 1, 1,
0.3140991, -0.7100354, 4.209425, 0, 0.1294118, 1, 1,
0.316233, 1.439874, -0.3468232, 0, 0.1254902, 1, 1,
0.3172355, 0.378044, 1.540097, 0, 0.1176471, 1, 1,
0.3181655, -1.693805, 3.345313, 0, 0.1137255, 1, 1,
0.3185659, 0.8156746, -0.420368, 0, 0.1058824, 1, 1,
0.3189878, -0.3061166, 1.938006, 0, 0.09803922, 1, 1,
0.3190725, -1.430073, 2.061716, 0, 0.09411765, 1, 1,
0.3238251, -3.20975, 3.729332, 0, 0.08627451, 1, 1,
0.3251041, -1.676031, 3.716188, 0, 0.08235294, 1, 1,
0.3276638, 0.07645558, 1.795828, 0, 0.07450981, 1, 1,
0.3309854, -0.4838882, 3.028296, 0, 0.07058824, 1, 1,
0.3311289, -1.110095, 2.122202, 0, 0.0627451, 1, 1,
0.333472, 1.725087, -0.0949, 0, 0.05882353, 1, 1,
0.333994, -0.4161385, 2.863683, 0, 0.05098039, 1, 1,
0.3355457, -1.186356, 2.916527, 0, 0.04705882, 1, 1,
0.3370432, -0.4850641, 1.772212, 0, 0.03921569, 1, 1,
0.3401487, -2.011389, 3.248186, 0, 0.03529412, 1, 1,
0.3438793, -0.4531758, 2.364888, 0, 0.02745098, 1, 1,
0.345894, -0.1935546, 3.343282, 0, 0.02352941, 1, 1,
0.3497486, 0.3377514, 3.029703, 0, 0.01568628, 1, 1,
0.3503878, -0.2742512, 2.794533, 0, 0.01176471, 1, 1,
0.3587761, -0.5899236, 3.778621, 0, 0.003921569, 1, 1,
0.3636555, 0.1280776, 1.48757, 0.003921569, 0, 1, 1,
0.3640191, 0.1097405, 0.592851, 0.007843138, 0, 1, 1,
0.3658938, -0.2686668, 2.665804, 0.01568628, 0, 1, 1,
0.3684259, -0.3243669, 2.842778, 0.01960784, 0, 1, 1,
0.3708828, -0.3805554, 1.758961, 0.02745098, 0, 1, 1,
0.3710353, 1.041239, 0.2176557, 0.03137255, 0, 1, 1,
0.371236, 0.4930885, 0.6887703, 0.03921569, 0, 1, 1,
0.3722707, -0.78615, 2.576922, 0.04313726, 0, 1, 1,
0.3733333, -0.7576728, 2.948007, 0.05098039, 0, 1, 1,
0.3744562, 0.548514, -0.5312086, 0.05490196, 0, 1, 1,
0.37552, 2.051961, 0.2820854, 0.0627451, 0, 1, 1,
0.384335, -0.1313842, 2.08959, 0.06666667, 0, 1, 1,
0.3895243, -2.063827, 2.294609, 0.07450981, 0, 1, 1,
0.3953992, -0.6583941, 1.903136, 0.07843138, 0, 1, 1,
0.3966813, 0.9682718, 0.3036429, 0.08627451, 0, 1, 1,
0.4016014, -0.8820776, 2.645168, 0.09019608, 0, 1, 1,
0.4046568, -0.3556291, 0.5223913, 0.09803922, 0, 1, 1,
0.4084724, -1.892898, 2.483586, 0.1058824, 0, 1, 1,
0.4086519, 0.2016766, 0.973444, 0.1098039, 0, 1, 1,
0.4104829, 0.9083738, 1.399807, 0.1176471, 0, 1, 1,
0.4167064, 2.206096, 1.236076, 0.1215686, 0, 1, 1,
0.417861, 0.02859937, 2.209607, 0.1294118, 0, 1, 1,
0.4215117, 0.5331379, -0.02426274, 0.1333333, 0, 1, 1,
0.4259113, 0.8649445, 2.40024, 0.1411765, 0, 1, 1,
0.42777, -1.730968, 2.391763, 0.145098, 0, 1, 1,
0.4282179, -0.09341174, 1.325479, 0.1529412, 0, 1, 1,
0.4293847, -1.367577, 2.588175, 0.1568628, 0, 1, 1,
0.4354772, 1.233092, 0.5067198, 0.1647059, 0, 1, 1,
0.4362727, -0.2368283, 2.582627, 0.1686275, 0, 1, 1,
0.4364406, 0.09324835, 0.3186131, 0.1764706, 0, 1, 1,
0.4370182, -0.4814301, 0.03287049, 0.1803922, 0, 1, 1,
0.4381698, 0.1998997, 1.713471, 0.1882353, 0, 1, 1,
0.4397238, -0.4571768, 0.8325216, 0.1921569, 0, 1, 1,
0.4424182, 0.2300605, 1.144834, 0.2, 0, 1, 1,
0.44304, 0.4127981, 0.5177546, 0.2078431, 0, 1, 1,
0.4471813, -0.5973653, 2.763773, 0.2117647, 0, 1, 1,
0.4478084, -0.4086688, 1.343164, 0.2196078, 0, 1, 1,
0.4486985, 0.4612529, 0.2642087, 0.2235294, 0, 1, 1,
0.4548178, 0.4014938, 1.813534, 0.2313726, 0, 1, 1,
0.4590349, 0.5336142, 1.055582, 0.2352941, 0, 1, 1,
0.4656028, 0.1041757, 0.6668621, 0.2431373, 0, 1, 1,
0.4658338, -1.019138, 3.244556, 0.2470588, 0, 1, 1,
0.4791677, 0.8451733, 0.8081537, 0.254902, 0, 1, 1,
0.4807345, -0.3077389, 2.547589, 0.2588235, 0, 1, 1,
0.4822223, -1.969727, 3.577689, 0.2666667, 0, 1, 1,
0.4862462, -1.006875, 4.234056, 0.2705882, 0, 1, 1,
0.4870766, -0.4999215, 2.503562, 0.2784314, 0, 1, 1,
0.4879238, -0.5232866, 0.6952286, 0.282353, 0, 1, 1,
0.4887834, 0.08043187, 0.7134328, 0.2901961, 0, 1, 1,
0.4888595, 0.8591156, 0.9699192, 0.2941177, 0, 1, 1,
0.4945179, -0.8440982, 3.096107, 0.3019608, 0, 1, 1,
0.4946798, 0.2155047, 2.497331, 0.3098039, 0, 1, 1,
0.4986202, 0.6087017, -0.438198, 0.3137255, 0, 1, 1,
0.50662, -0.4592138, 3.752903, 0.3215686, 0, 1, 1,
0.5114905, 0.449487, 1.018495, 0.3254902, 0, 1, 1,
0.511685, 0.3916099, 1.834094, 0.3333333, 0, 1, 1,
0.512363, -0.5820415, 2.566625, 0.3372549, 0, 1, 1,
0.5141264, 0.1168106, 1.556471, 0.345098, 0, 1, 1,
0.5163851, 0.2589476, 0.6226615, 0.3490196, 0, 1, 1,
0.5180956, 0.09387852, -0.9994708, 0.3568628, 0, 1, 1,
0.5186818, -1.853991, 2.789971, 0.3607843, 0, 1, 1,
0.519945, 1.392529, -1.433571, 0.3686275, 0, 1, 1,
0.5224433, 0.7651201, 0.3711034, 0.372549, 0, 1, 1,
0.5231885, 0.6025752, -0.3558627, 0.3803922, 0, 1, 1,
0.5271382, 0.04332545, 1.342132, 0.3843137, 0, 1, 1,
0.5300072, 0.2214975, 0.5283526, 0.3921569, 0, 1, 1,
0.5354289, 2.322338, 1.160399, 0.3960784, 0, 1, 1,
0.5365365, 0.6096648, 1.032618, 0.4039216, 0, 1, 1,
0.5432163, -1.161988, 1.256195, 0.4117647, 0, 1, 1,
0.5459266, 0.2987435, 1.291599, 0.4156863, 0, 1, 1,
0.5476521, -0.6615824, 4.541223, 0.4235294, 0, 1, 1,
0.5566701, -1.054659, 2.321553, 0.427451, 0, 1, 1,
0.5577236, 1.268969, 2.709105, 0.4352941, 0, 1, 1,
0.5586811, -0.8262751, 2.743393, 0.4392157, 0, 1, 1,
0.5594395, 0.1936954, 1.261444, 0.4470588, 0, 1, 1,
0.572588, -1.146871, 1.918718, 0.4509804, 0, 1, 1,
0.5743619, 1.859785, 0.7915775, 0.4588235, 0, 1, 1,
0.5746839, -0.4934575, 1.716091, 0.4627451, 0, 1, 1,
0.5776554, 0.2931558, 1.147435, 0.4705882, 0, 1, 1,
0.5798144, 0.6604318, -0.8276861, 0.4745098, 0, 1, 1,
0.5829342, 1.334291, -0.6677782, 0.4823529, 0, 1, 1,
0.5847529, 0.4551834, 0.3756091, 0.4862745, 0, 1, 1,
0.5877131, -0.5149702, 1.499976, 0.4941176, 0, 1, 1,
0.5889999, -0.7191225, 2.350742, 0.5019608, 0, 1, 1,
0.5919036, 0.658605, -0.7090096, 0.5058824, 0, 1, 1,
0.5985447, -0.2737942, 3.053658, 0.5137255, 0, 1, 1,
0.5992123, -0.4216011, 2.448364, 0.5176471, 0, 1, 1,
0.6035957, -0.5356557, 0.9570855, 0.5254902, 0, 1, 1,
0.6078656, 0.1088183, -0.1805165, 0.5294118, 0, 1, 1,
0.6099415, -0.2336554, 2.667299, 0.5372549, 0, 1, 1,
0.6201266, -0.02302384, 0.744328, 0.5411765, 0, 1, 1,
0.6217701, 0.3437854, 1.214355, 0.5490196, 0, 1, 1,
0.6281256, 1.727504, 0.1526647, 0.5529412, 0, 1, 1,
0.6288223, 1.162557, 0.698328, 0.5607843, 0, 1, 1,
0.6317775, 0.3611832, -0.6329416, 0.5647059, 0, 1, 1,
0.6342346, -0.4152195, 3.853977, 0.572549, 0, 1, 1,
0.6395036, 0.9341819, 2.720129, 0.5764706, 0, 1, 1,
0.6418691, -1.190952, 2.971071, 0.5843138, 0, 1, 1,
0.6420118, -1.093415, 2.709005, 0.5882353, 0, 1, 1,
0.6431642, -0.3421515, 2.002752, 0.5960785, 0, 1, 1,
0.6431826, 0.1670812, 0.6431242, 0.6039216, 0, 1, 1,
0.64439, 1.067624, 0.3397231, 0.6078432, 0, 1, 1,
0.6558678, -0.5966172, 0.4721147, 0.6156863, 0, 1, 1,
0.657656, -1.265639, 2.939624, 0.6196079, 0, 1, 1,
0.6581023, 2.853361, 0.7068375, 0.627451, 0, 1, 1,
0.6585616, 0.5642254, -0.771363, 0.6313726, 0, 1, 1,
0.6630685, 1.087151, -0.04342771, 0.6392157, 0, 1, 1,
0.6650842, 0.01173488, 1.49163, 0.6431373, 0, 1, 1,
0.6661579, 1.234998, 1.959045, 0.6509804, 0, 1, 1,
0.6676114, -1.845129, 4.080521, 0.654902, 0, 1, 1,
0.6725111, -1.060455, 1.374062, 0.6627451, 0, 1, 1,
0.6725309, -0.1988728, 1.562698, 0.6666667, 0, 1, 1,
0.6755449, -0.9202605, 3.43838, 0.6745098, 0, 1, 1,
0.6777242, -1.188493, 2.048785, 0.6784314, 0, 1, 1,
0.678539, 1.982355, 0.7639136, 0.6862745, 0, 1, 1,
0.6825069, 0.403631, 1.189221, 0.6901961, 0, 1, 1,
0.688438, 1.014769, 2.060787, 0.6980392, 0, 1, 1,
0.6915417, 0.2397447, 2.085691, 0.7058824, 0, 1, 1,
0.692754, 0.845311, 0.6570531, 0.7098039, 0, 1, 1,
0.6976141, 0.0814316, 1.001553, 0.7176471, 0, 1, 1,
0.709331, 1.056392, -0.7008767, 0.7215686, 0, 1, 1,
0.7105436, -1.284718, 3.424092, 0.7294118, 0, 1, 1,
0.7132847, -0.07578546, -0.6792299, 0.7333333, 0, 1, 1,
0.7195563, 0.802762, 1.575957, 0.7411765, 0, 1, 1,
0.7244466, -0.09806613, 1.581314, 0.7450981, 0, 1, 1,
0.739818, 0.335358, 0.4888335, 0.7529412, 0, 1, 1,
0.7419582, 1.017464, 1.781755, 0.7568628, 0, 1, 1,
0.7447899, 0.2731066, 1.463707, 0.7647059, 0, 1, 1,
0.7532825, 0.4043739, -0.2335598, 0.7686275, 0, 1, 1,
0.7539223, 0.9832743, 1.674605, 0.7764706, 0, 1, 1,
0.7543184, -1.066148, 1.931858, 0.7803922, 0, 1, 1,
0.7558715, -0.427143, 3.373096, 0.7882353, 0, 1, 1,
0.7562991, -0.998152, 1.775239, 0.7921569, 0, 1, 1,
0.7570125, 0.1097469, 3.229563, 0.8, 0, 1, 1,
0.7580662, -1.110322, 1.663437, 0.8078431, 0, 1, 1,
0.7594308, -0.8768489, 2.26412, 0.8117647, 0, 1, 1,
0.7623021, 0.03709849, 0.1627082, 0.8196079, 0, 1, 1,
0.7646617, -1.320297, 1.885763, 0.8235294, 0, 1, 1,
0.7653425, 0.9305839, 1.842247, 0.8313726, 0, 1, 1,
0.7673993, 0.4869205, 0.09858825, 0.8352941, 0, 1, 1,
0.7724662, -0.8943026, 2.24943, 0.8431373, 0, 1, 1,
0.7732476, 0.2258048, 0.9461005, 0.8470588, 0, 1, 1,
0.7745839, -2.46068, 3.219283, 0.854902, 0, 1, 1,
0.7829264, 1.709946, -1.048473, 0.8588235, 0, 1, 1,
0.7838122, -0.5404095, 3.357024, 0.8666667, 0, 1, 1,
0.7860937, 1.323152, 0.2036415, 0.8705882, 0, 1, 1,
0.7923908, 0.478624, 0.8945567, 0.8784314, 0, 1, 1,
0.7975395, -0.5682047, 1.689505, 0.8823529, 0, 1, 1,
0.802194, 1.082081, 3.057624, 0.8901961, 0, 1, 1,
0.8080189, 0.330279, 1.002812, 0.8941177, 0, 1, 1,
0.810979, -0.5614337, 1.404559, 0.9019608, 0, 1, 1,
0.8128765, -0.5591459, 0.6887556, 0.9098039, 0, 1, 1,
0.8138195, 0.4878266, 1.780927, 0.9137255, 0, 1, 1,
0.8161555, 1.325968, 0.5658725, 0.9215686, 0, 1, 1,
0.8169522, -0.8622828, 2.448669, 0.9254902, 0, 1, 1,
0.8172813, 1.65281, -0.2498815, 0.9333333, 0, 1, 1,
0.8200126, -0.009574964, 1.879369, 0.9372549, 0, 1, 1,
0.8366441, -0.4552226, 1.056259, 0.945098, 0, 1, 1,
0.8433471, 1.328473, -0.5643706, 0.9490196, 0, 1, 1,
0.8441353, -0.1243448, 1.269858, 0.9568627, 0, 1, 1,
0.8526377, 1.48777, -0.5108475, 0.9607843, 0, 1, 1,
0.8553721, 1.761203, -1.516106, 0.9686275, 0, 1, 1,
0.8644595, -1.260971, 2.468907, 0.972549, 0, 1, 1,
0.8664414, 1.377714, 0.8127471, 0.9803922, 0, 1, 1,
0.8708083, 0.1725243, 2.350228, 0.9843137, 0, 1, 1,
0.876224, 1.033899, 0.9754378, 0.9921569, 0, 1, 1,
0.8812158, -0.2546985, 1.190011, 0.9960784, 0, 1, 1,
0.8822324, 1.651939, -0.7192488, 1, 0, 0.9960784, 1,
0.883634, 0.7613767, 1.120726, 1, 0, 0.9882353, 1,
0.8855671, 0.3982689, -0.4744573, 1, 0, 0.9843137, 1,
0.8925623, -0.9865905, 2.932809, 1, 0, 0.9764706, 1,
0.9058338, 0.7694262, 1.972537, 1, 0, 0.972549, 1,
0.9070372, -0.1737288, 2.533823, 1, 0, 0.9647059, 1,
0.909496, 0.9277505, 0.5188147, 1, 0, 0.9607843, 1,
0.9113963, -0.3019651, 0.7491574, 1, 0, 0.9529412, 1,
0.9114113, -1.577058, 1.857013, 1, 0, 0.9490196, 1,
0.9142748, 0.5662501, -0.2109813, 1, 0, 0.9411765, 1,
0.9245234, 0.3671284, 1.04166, 1, 0, 0.9372549, 1,
0.9254858, -0.2196995, 2.485557, 1, 0, 0.9294118, 1,
0.9427617, 2.932054, 2.064685, 1, 0, 0.9254902, 1,
0.9461302, -0.7598, 0.6088926, 1, 0, 0.9176471, 1,
0.946674, 1.512121, 0.3884392, 1, 0, 0.9137255, 1,
0.9537969, -0.6343657, 1.578798, 1, 0, 0.9058824, 1,
0.9545854, 0.9568851, -1.567007, 1, 0, 0.9019608, 1,
0.9582688, 0.6946068, -0.05110336, 1, 0, 0.8941177, 1,
0.9648946, -1.634279, 1.887017, 1, 0, 0.8862745, 1,
0.965023, -0.2933983, 0.8525162, 1, 0, 0.8823529, 1,
0.9692546, -1.016076, 2.239439, 1, 0, 0.8745098, 1,
0.9769184, -0.5168374, 2.708026, 1, 0, 0.8705882, 1,
0.9779064, 0.04797693, 1.117915, 1, 0, 0.8627451, 1,
0.9826272, -0.1880396, 2.993799, 1, 0, 0.8588235, 1,
0.9864848, -2.101243, 3.492347, 1, 0, 0.8509804, 1,
0.9904823, 0.8487947, 1.154038, 1, 0, 0.8470588, 1,
0.9989259, 1.193629, 2.264416, 1, 0, 0.8392157, 1,
1.002675, -1.294684, 1.335321, 1, 0, 0.8352941, 1,
1.005037, -0.7150889, 2.5037, 1, 0, 0.827451, 1,
1.007312, 0.2825894, 1.461008, 1, 0, 0.8235294, 1,
1.02338, -2.549343, 3.679785, 1, 0, 0.8156863, 1,
1.023492, 0.4661341, 0.5879572, 1, 0, 0.8117647, 1,
1.027057, -2.087477, 2.522165, 1, 0, 0.8039216, 1,
1.027853, -1.645421, 2.052472, 1, 0, 0.7960784, 1,
1.031556, -0.02138395, 1.417755, 1, 0, 0.7921569, 1,
1.039825, -0.9265434, 2.615386, 1, 0, 0.7843137, 1,
1.045401, -0.8916758, 2.090789, 1, 0, 0.7803922, 1,
1.045588, 0.140288, 0.9136203, 1, 0, 0.772549, 1,
1.049335, 1.712398, 2.529571, 1, 0, 0.7686275, 1,
1.057375, -0.5804881, 3.106773, 1, 0, 0.7607843, 1,
1.059901, 0.5269299, -0.2145686, 1, 0, 0.7568628, 1,
1.064582, 1.739019, 0.582965, 1, 0, 0.7490196, 1,
1.068538, -0.4585362, 1.338741, 1, 0, 0.7450981, 1,
1.069072, -2.173925, 3.130689, 1, 0, 0.7372549, 1,
1.073712, -0.5746571, 1.380287, 1, 0, 0.7333333, 1,
1.080908, 0.6079375, 2.350589, 1, 0, 0.7254902, 1,
1.082912, -1.293227, 3.145875, 1, 0, 0.7215686, 1,
1.097219, -0.07005432, 2.721395, 1, 0, 0.7137255, 1,
1.099391, 0.0688656, 1.996063, 1, 0, 0.7098039, 1,
1.101049, -1.391154, 1.626434, 1, 0, 0.7019608, 1,
1.103753, 0.3633684, 1.921441, 1, 0, 0.6941177, 1,
1.105701, -0.573736, 1.57299, 1, 0, 0.6901961, 1,
1.107832, -0.2053976, 0.4290755, 1, 0, 0.682353, 1,
1.117937, -1.862049, 3.239454, 1, 0, 0.6784314, 1,
1.118969, 2.074897, -1.188085, 1, 0, 0.6705883, 1,
1.122097, -0.2143186, 2.790899, 1, 0, 0.6666667, 1,
1.132317, -1.9971, 2.653203, 1, 0, 0.6588235, 1,
1.142009, -1.735851, 3.047328, 1, 0, 0.654902, 1,
1.151382, 0.2713656, 2.023905, 1, 0, 0.6470588, 1,
1.159156, 0.3507564, 1.05305, 1, 0, 0.6431373, 1,
1.167866, -1.157954, 2.554961, 1, 0, 0.6352941, 1,
1.168906, 0.2143742, 1.169692, 1, 0, 0.6313726, 1,
1.171216, -1.546106, 4.392355, 1, 0, 0.6235294, 1,
1.171587, 0.8231015, 1.441002, 1, 0, 0.6196079, 1,
1.180052, -0.1730929, 1.211179, 1, 0, 0.6117647, 1,
1.186121, 0.3612537, 1.267497, 1, 0, 0.6078432, 1,
1.193303, 0.7642033, -0.204493, 1, 0, 0.6, 1,
1.20418, -2.122058, 3.300493, 1, 0, 0.5921569, 1,
1.204835, 2.381945, -1.168397, 1, 0, 0.5882353, 1,
1.212049, 0.4832623, 1.819594, 1, 0, 0.5803922, 1,
1.213869, 0.2880165, 1.498958, 1, 0, 0.5764706, 1,
1.215964, 0.5673856, 1.64385, 1, 0, 0.5686275, 1,
1.218129, -0.5486296, 2.269953, 1, 0, 0.5647059, 1,
1.234764, -0.2473169, 1.645255, 1, 0, 0.5568628, 1,
1.248377, 1.357334, 1.034799, 1, 0, 0.5529412, 1,
1.252797, 0.3389809, -0.1370917, 1, 0, 0.5450981, 1,
1.256072, 0.4788649, 1.466503, 1, 0, 0.5411765, 1,
1.264364, 0.782838, -0.7026498, 1, 0, 0.5333334, 1,
1.267532, 1.600642, 0.5080751, 1, 0, 0.5294118, 1,
1.273699, 0.05180627, -0.1076823, 1, 0, 0.5215687, 1,
1.29169, 0.5429498, 1.641488, 1, 0, 0.5176471, 1,
1.306609, 0.02093294, 1.199345, 1, 0, 0.509804, 1,
1.312684, -0.8056339, 2.161106, 1, 0, 0.5058824, 1,
1.316309, -0.7786278, 2.631222, 1, 0, 0.4980392, 1,
1.325021, -0.1078437, 1.218277, 1, 0, 0.4901961, 1,
1.325377, -1.180551, 3.142706, 1, 0, 0.4862745, 1,
1.331147, -0.2961439, 2.367942, 1, 0, 0.4784314, 1,
1.358836, 2.726785, 0.2868792, 1, 0, 0.4745098, 1,
1.367337, -0.788729, 0.9329839, 1, 0, 0.4666667, 1,
1.371511, -1.351991, 3.897794, 1, 0, 0.4627451, 1,
1.380247, 0.2706913, 1.178707, 1, 0, 0.454902, 1,
1.383323, 0.6864806, 1.249903, 1, 0, 0.4509804, 1,
1.392153, -0.1825589, 2.360512, 1, 0, 0.4431373, 1,
1.408545, -1.790674, 0.4843356, 1, 0, 0.4392157, 1,
1.42179, -0.6963837, 2.143661, 1, 0, 0.4313726, 1,
1.442504, -1.544607, 3.443162, 1, 0, 0.427451, 1,
1.446377, 0.07777689, 0.809878, 1, 0, 0.4196078, 1,
1.448222, -1.698508, 2.51644, 1, 0, 0.4156863, 1,
1.451228, -1.188502, 2.844933, 1, 0, 0.4078431, 1,
1.452802, -0.7712543, 2.04555, 1, 0, 0.4039216, 1,
1.465115, 0.432202, 0.8348406, 1, 0, 0.3960784, 1,
1.479439, 0.3355196, 0.3822348, 1, 0, 0.3882353, 1,
1.481372, 1.411424, 0.7174597, 1, 0, 0.3843137, 1,
1.490394, -0.2918733, 0.08609378, 1, 0, 0.3764706, 1,
1.498334, -0.1071243, 3.024631, 1, 0, 0.372549, 1,
1.514517, -0.2342821, 2.044096, 1, 0, 0.3647059, 1,
1.545055, -1.53852, 2.018796, 1, 0, 0.3607843, 1,
1.5514, 0.5663657, 1.224007, 1, 0, 0.3529412, 1,
1.552806, 0.2797845, 2.084126, 1, 0, 0.3490196, 1,
1.575957, 1.2305, 3.601743, 1, 0, 0.3411765, 1,
1.587352, -1.423857, 1.626906, 1, 0, 0.3372549, 1,
1.588974, -0.08529498, 0.6173145, 1, 0, 0.3294118, 1,
1.597104, 1.015726, 0.772734, 1, 0, 0.3254902, 1,
1.606209, -0.4427599, 0.4061607, 1, 0, 0.3176471, 1,
1.608489, -0.4045037, 0.7613198, 1, 0, 0.3137255, 1,
1.609283, 1.221946, 0.1726865, 1, 0, 0.3058824, 1,
1.610065, -1.052702, 1.690599, 1, 0, 0.2980392, 1,
1.615618, -0.7952933, 0.6647443, 1, 0, 0.2941177, 1,
1.616433, 0.5612141, 1.92043, 1, 0, 0.2862745, 1,
1.641515, -1.190031, 3.876464, 1, 0, 0.282353, 1,
1.64301, 0.5751253, 1.141881, 1, 0, 0.2745098, 1,
1.665334, -0.01693824, 1.134333, 1, 0, 0.2705882, 1,
1.668053, -0.3617533, 2.737187, 1, 0, 0.2627451, 1,
1.682016, 1.633584, 1.456611, 1, 0, 0.2588235, 1,
1.692203, -0.008516594, -0.1003766, 1, 0, 0.2509804, 1,
1.700973, -1.072603, 0.8828437, 1, 0, 0.2470588, 1,
1.748513, 0.7766331, 1.312217, 1, 0, 0.2392157, 1,
1.774687, -0.8120154, 2.612477, 1, 0, 0.2352941, 1,
1.77932, -1.028043, 2.447022, 1, 0, 0.227451, 1,
1.793464, -0.4754265, 1.36694, 1, 0, 0.2235294, 1,
1.801466, 1.375598, 0.8606609, 1, 0, 0.2156863, 1,
1.821315, -0.1093017, 2.745879, 1, 0, 0.2117647, 1,
1.825639, 0.7613336, -0.5949389, 1, 0, 0.2039216, 1,
1.832977, 0.7977504, 0.3950285, 1, 0, 0.1960784, 1,
1.849921, 1.245943, 1.837061, 1, 0, 0.1921569, 1,
1.852402, -0.2195693, 1.074967, 1, 0, 0.1843137, 1,
1.867017, -0.5686073, 1.26467, 1, 0, 0.1803922, 1,
1.871526, -1.217259, 1.762865, 1, 0, 0.172549, 1,
1.889951, 0.8469024, 0.4426451, 1, 0, 0.1686275, 1,
1.895184, -1.085451, 2.52126, 1, 0, 0.1607843, 1,
1.923504, -0.4898195, 2.971984, 1, 0, 0.1568628, 1,
1.926014, 0.1026401, 0.7986847, 1, 0, 0.1490196, 1,
1.936942, -0.02642019, 1.828254, 1, 0, 0.145098, 1,
1.973889, 0.6528799, -0.01449301, 1, 0, 0.1372549, 1,
1.986426, -0.2031844, 1.987099, 1, 0, 0.1333333, 1,
1.990662, 0.3283336, -0.3209218, 1, 0, 0.1254902, 1,
2.009403, 1.267935, 0.0002887717, 1, 0, 0.1215686, 1,
2.06621, 0.7648423, 2.3801, 1, 0, 0.1137255, 1,
2.07672, 1.570835, -0.06796383, 1, 0, 0.1098039, 1,
2.127461, -1.745756, 1.928774, 1, 0, 0.1019608, 1,
2.147773, -0.7170525, 0.8612297, 1, 0, 0.09411765, 1,
2.191056, 0.2493777, 1.459611, 1, 0, 0.09019608, 1,
2.191393, 0.6941573, 3.032373, 1, 0, 0.08235294, 1,
2.205006, 0.9021271, 1.514919, 1, 0, 0.07843138, 1,
2.243929, 2.119637, 1.491094, 1, 0, 0.07058824, 1,
2.260495, 0.7804094, 1.61746, 1, 0, 0.06666667, 1,
2.323787, -0.6600082, 1.491987, 1, 0, 0.05882353, 1,
2.365963, -1.209161, 1.729963, 1, 0, 0.05490196, 1,
2.38792, 0.2567113, 1.769637, 1, 0, 0.04705882, 1,
2.454911, -0.8752587, 0.1010333, 1, 0, 0.04313726, 1,
2.572366, 0.5283171, 0.7308057, 1, 0, 0.03529412, 1,
2.630774, -1.290192, 3.599137, 1, 0, 0.03137255, 1,
2.680513, -0.9733152, 2.014806, 1, 0, 0.02352941, 1,
2.722863, 0.02773138, 1.794071, 1, 0, 0.01960784, 1,
2.952386, -0.4979505, 2.267724, 1, 0, 0.01176471, 1,
2.977301, 0.2906527, 0.6077165, 1, 0, 0.007843138, 1
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
0.2745296, -4.29697, -7.413248, 0, -0.5, 0.5, 0.5,
0.2745296, -4.29697, -7.413248, 1, -0.5, 0.5, 0.5,
0.2745296, -4.29697, -7.413248, 1, 1.5, 0.5, 0.5,
0.2745296, -4.29697, -7.413248, 0, 1.5, 0.5, 0.5
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
-3.344481, -0.002613068, -7.413248, 0, -0.5, 0.5, 0.5,
-3.344481, -0.002613068, -7.413248, 1, -0.5, 0.5, 0.5,
-3.344481, -0.002613068, -7.413248, 1, 1.5, 0.5, 0.5,
-3.344481, -0.002613068, -7.413248, 0, 1.5, 0.5, 0.5
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
-3.344481, -4.29697, -0.2551649, 0, -0.5, 0.5, 0.5,
-3.344481, -4.29697, -0.2551649, 1, -0.5, 0.5, 0.5,
-3.344481, -4.29697, -0.2551649, 1, 1.5, 0.5, 0.5,
-3.344481, -4.29697, -0.2551649, 0, 1.5, 0.5, 0.5
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
-2, -3.305964, -5.761382,
2, -3.305964, -5.761382,
-2, -3.305964, -5.761382,
-2, -3.471132, -6.036693,
-1, -3.305964, -5.761382,
-1, -3.471132, -6.036693,
0, -3.305964, -5.761382,
0, -3.471132, -6.036693,
1, -3.305964, -5.761382,
1, -3.471132, -6.036693,
2, -3.305964, -5.761382,
2, -3.471132, -6.036693
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
-2, -3.801467, -6.587315, 0, -0.5, 0.5, 0.5,
-2, -3.801467, -6.587315, 1, -0.5, 0.5, 0.5,
-2, -3.801467, -6.587315, 1, 1.5, 0.5, 0.5,
-2, -3.801467, -6.587315, 0, 1.5, 0.5, 0.5,
-1, -3.801467, -6.587315, 0, -0.5, 0.5, 0.5,
-1, -3.801467, -6.587315, 1, -0.5, 0.5, 0.5,
-1, -3.801467, -6.587315, 1, 1.5, 0.5, 0.5,
-1, -3.801467, -6.587315, 0, 1.5, 0.5, 0.5,
0, -3.801467, -6.587315, 0, -0.5, 0.5, 0.5,
0, -3.801467, -6.587315, 1, -0.5, 0.5, 0.5,
0, -3.801467, -6.587315, 1, 1.5, 0.5, 0.5,
0, -3.801467, -6.587315, 0, 1.5, 0.5, 0.5,
1, -3.801467, -6.587315, 0, -0.5, 0.5, 0.5,
1, -3.801467, -6.587315, 1, -0.5, 0.5, 0.5,
1, -3.801467, -6.587315, 1, 1.5, 0.5, 0.5,
1, -3.801467, -6.587315, 0, 1.5, 0.5, 0.5,
2, -3.801467, -6.587315, 0, -0.5, 0.5, 0.5,
2, -3.801467, -6.587315, 1, -0.5, 0.5, 0.5,
2, -3.801467, -6.587315, 1, 1.5, 0.5, 0.5,
2, -3.801467, -6.587315, 0, 1.5, 0.5, 0.5
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
-2.509325, -3, -5.761382,
-2.509325, 3, -5.761382,
-2.509325, -3, -5.761382,
-2.648517, -3, -6.036693,
-2.509325, -2, -5.761382,
-2.648517, -2, -6.036693,
-2.509325, -1, -5.761382,
-2.648517, -1, -6.036693,
-2.509325, 0, -5.761382,
-2.648517, 0, -6.036693,
-2.509325, 1, -5.761382,
-2.648517, 1, -6.036693,
-2.509325, 2, -5.761382,
-2.648517, 2, -6.036693,
-2.509325, 3, -5.761382,
-2.648517, 3, -6.036693
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
-2.926903, -3, -6.587315, 0, -0.5, 0.5, 0.5,
-2.926903, -3, -6.587315, 1, -0.5, 0.5, 0.5,
-2.926903, -3, -6.587315, 1, 1.5, 0.5, 0.5,
-2.926903, -3, -6.587315, 0, 1.5, 0.5, 0.5,
-2.926903, -2, -6.587315, 0, -0.5, 0.5, 0.5,
-2.926903, -2, -6.587315, 1, -0.5, 0.5, 0.5,
-2.926903, -2, -6.587315, 1, 1.5, 0.5, 0.5,
-2.926903, -2, -6.587315, 0, 1.5, 0.5, 0.5,
-2.926903, -1, -6.587315, 0, -0.5, 0.5, 0.5,
-2.926903, -1, -6.587315, 1, -0.5, 0.5, 0.5,
-2.926903, -1, -6.587315, 1, 1.5, 0.5, 0.5,
-2.926903, -1, -6.587315, 0, 1.5, 0.5, 0.5,
-2.926903, 0, -6.587315, 0, -0.5, 0.5, 0.5,
-2.926903, 0, -6.587315, 1, -0.5, 0.5, 0.5,
-2.926903, 0, -6.587315, 1, 1.5, 0.5, 0.5,
-2.926903, 0, -6.587315, 0, 1.5, 0.5, 0.5,
-2.926903, 1, -6.587315, 0, -0.5, 0.5, 0.5,
-2.926903, 1, -6.587315, 1, -0.5, 0.5, 0.5,
-2.926903, 1, -6.587315, 1, 1.5, 0.5, 0.5,
-2.926903, 1, -6.587315, 0, 1.5, 0.5, 0.5,
-2.926903, 2, -6.587315, 0, -0.5, 0.5, 0.5,
-2.926903, 2, -6.587315, 1, -0.5, 0.5, 0.5,
-2.926903, 2, -6.587315, 1, 1.5, 0.5, 0.5,
-2.926903, 2, -6.587315, 0, 1.5, 0.5, 0.5,
-2.926903, 3, -6.587315, 0, -0.5, 0.5, 0.5,
-2.926903, 3, -6.587315, 1, -0.5, 0.5, 0.5,
-2.926903, 3, -6.587315, 1, 1.5, 0.5, 0.5,
-2.926903, 3, -6.587315, 0, 1.5, 0.5, 0.5
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
-2.509325, -3.305964, -4,
-2.509325, -3.305964, 4,
-2.509325, -3.305964, -4,
-2.648517, -3.471132, -4,
-2.509325, -3.305964, -2,
-2.648517, -3.471132, -2,
-2.509325, -3.305964, 0,
-2.648517, -3.471132, 0,
-2.509325, -3.305964, 2,
-2.648517, -3.471132, 2,
-2.509325, -3.305964, 4,
-2.648517, -3.471132, 4
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
-2.926903, -3.801467, -4, 0, -0.5, 0.5, 0.5,
-2.926903, -3.801467, -4, 1, -0.5, 0.5, 0.5,
-2.926903, -3.801467, -4, 1, 1.5, 0.5, 0.5,
-2.926903, -3.801467, -4, 0, 1.5, 0.5, 0.5,
-2.926903, -3.801467, -2, 0, -0.5, 0.5, 0.5,
-2.926903, -3.801467, -2, 1, -0.5, 0.5, 0.5,
-2.926903, -3.801467, -2, 1, 1.5, 0.5, 0.5,
-2.926903, -3.801467, -2, 0, 1.5, 0.5, 0.5,
-2.926903, -3.801467, 0, 0, -0.5, 0.5, 0.5,
-2.926903, -3.801467, 0, 1, -0.5, 0.5, 0.5,
-2.926903, -3.801467, 0, 1, 1.5, 0.5, 0.5,
-2.926903, -3.801467, 0, 0, 1.5, 0.5, 0.5,
-2.926903, -3.801467, 2, 0, -0.5, 0.5, 0.5,
-2.926903, -3.801467, 2, 1, -0.5, 0.5, 0.5,
-2.926903, -3.801467, 2, 1, 1.5, 0.5, 0.5,
-2.926903, -3.801467, 2, 0, 1.5, 0.5, 0.5,
-2.926903, -3.801467, 4, 0, -0.5, 0.5, 0.5,
-2.926903, -3.801467, 4, 1, -0.5, 0.5, 0.5,
-2.926903, -3.801467, 4, 1, 1.5, 0.5, 0.5,
-2.926903, -3.801467, 4, 0, 1.5, 0.5, 0.5
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
-2.509325, -3.305964, -5.761382,
-2.509325, 3.300738, -5.761382,
-2.509325, -3.305964, 5.251052,
-2.509325, 3.300738, 5.251052,
-2.509325, -3.305964, -5.761382,
-2.509325, -3.305964, 5.251052,
-2.509325, 3.300738, -5.761382,
-2.509325, 3.300738, 5.251052,
-2.509325, -3.305964, -5.761382,
3.058384, -3.305964, -5.761382,
-2.509325, -3.305964, 5.251052,
3.058384, -3.305964, 5.251052,
-2.509325, 3.300738, -5.761382,
3.058384, 3.300738, -5.761382,
-2.509325, 3.300738, 5.251052,
3.058384, 3.300738, 5.251052,
3.058384, -3.305964, -5.761382,
3.058384, 3.300738, -5.761382,
3.058384, -3.305964, 5.251052,
3.058384, 3.300738, 5.251052,
3.058384, -3.305964, -5.761382,
3.058384, -3.305964, 5.251052,
3.058384, 3.300738, -5.761382,
3.058384, 3.300738, 5.251052
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
var radius = 7.474233;
var distance = 33.25371;
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
mvMatrix.translate( -0.2745296, 0.002613068, 0.2551649 );
mvMatrix.scale( 1.451457, 1.223195, 0.733833 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.25371);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Fensulfothion<-read.table("Fensulfothion.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Fensulfothion$V2
```

```
## Error in eval(expr, envir, enclos): object 'Fensulfothion' not found
```

```r
y<-Fensulfothion$V3
```

```
## Error in eval(expr, envir, enclos): object 'Fensulfothion' not found
```

```r
z<-Fensulfothion$V4
```

```
## Error in eval(expr, envir, enclos): object 'Fensulfothion' not found
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
-2.428241, 0.3760153, 0.1238685, 0, 0, 1, 1, 1,
-2.397651, 1.061658, -1.960149, 1, 0, 0, 1, 1,
-2.360888, 1.497507, -0.9991077, 1, 0, 0, 1, 1,
-2.333759, 0.22165, -3.10856, 1, 0, 0, 1, 1,
-2.324162, -0.02833294, -2.656657, 1, 0, 0, 1, 1,
-2.320691, 1.669395, 0.161487, 1, 0, 0, 1, 1,
-2.276956, -1.009792, -1.180897, 0, 0, 0, 1, 1,
-2.268003, -1.515237, -3.372935, 0, 0, 0, 1, 1,
-2.243098, 0.05788739, -0.6265163, 0, 0, 0, 1, 1,
-2.147954, -0.7849291, -1.455587, 0, 0, 0, 1, 1,
-2.089454, 0.05747871, -1.655201, 0, 0, 0, 1, 1,
-2.085858, 0.3873465, -1.235747, 0, 0, 0, 1, 1,
-2.039004, -0.3526295, -2.578259, 0, 0, 0, 1, 1,
-2.015049, -0.1236298, -1.863191, 1, 1, 1, 1, 1,
-2.004738, 0.0837021, -0.7406235, 1, 1, 1, 1, 1,
-2.003066, -0.09528229, -1.464761, 1, 1, 1, 1, 1,
-1.951879, -0.3087357, -0.3637053, 1, 1, 1, 1, 1,
-1.94465, 1.567606, -1.675355, 1, 1, 1, 1, 1,
-1.943925, 1.405596, -0.9630445, 1, 1, 1, 1, 1,
-1.942862, 0.3389801, -1.64009, 1, 1, 1, 1, 1,
-1.934444, -0.03658863, -1.127554, 1, 1, 1, 1, 1,
-1.930071, 1.264363, -1.82758, 1, 1, 1, 1, 1,
-1.918602, -0.5203922, -2.072927, 1, 1, 1, 1, 1,
-1.913849, 0.1084759, -1.258143, 1, 1, 1, 1, 1,
-1.907423, 0.08915267, -0.4990045, 1, 1, 1, 1, 1,
-1.887438, -0.5667854, -2.90142, 1, 1, 1, 1, 1,
-1.872997, -0.0163095, -1.207044, 1, 1, 1, 1, 1,
-1.870226, 0.5773801, -1.146046, 1, 1, 1, 1, 1,
-1.865135, -0.7906204, -1.965387, 0, 0, 1, 1, 1,
-1.85984, 0.5889202, -0.9656771, 1, 0, 0, 1, 1,
-1.84927, -0.7774649, -2.8147, 1, 0, 0, 1, 1,
-1.844302, -1.349625, -2.819031, 1, 0, 0, 1, 1,
-1.81197, 0.3352035, -2.150328, 1, 0, 0, 1, 1,
-1.806568, -2.531046, -2.395177, 1, 0, 0, 1, 1,
-1.793293, -0.1074335, -1.672969, 0, 0, 0, 1, 1,
-1.782923, -1.60417, -1.954704, 0, 0, 0, 1, 1,
-1.759823, 0.7279113, -1.019323, 0, 0, 0, 1, 1,
-1.753008, 0.5788508, -1.309551, 0, 0, 0, 1, 1,
-1.728057, 0.3556164, -2.548641, 0, 0, 0, 1, 1,
-1.67765, 0.9759457, -1.146063, 0, 0, 0, 1, 1,
-1.673825, -0.6200993, -0.9927884, 0, 0, 0, 1, 1,
-1.644258, 0.08836573, -1.730109, 1, 1, 1, 1, 1,
-1.644187, -0.1653394, -2.553032, 1, 1, 1, 1, 1,
-1.638862, -1.765162, -1.633632, 1, 1, 1, 1, 1,
-1.635444, 1.551727, -2.40687, 1, 1, 1, 1, 1,
-1.631702, -1.052617, -0.8266588, 1, 1, 1, 1, 1,
-1.610635, -0.7630551, -2.686031, 1, 1, 1, 1, 1,
-1.607973, -0.357553, -0.6877857, 1, 1, 1, 1, 1,
-1.606703, -2.601354, -1.712131, 1, 1, 1, 1, 1,
-1.590115, -0.688511, -1.144479, 1, 1, 1, 1, 1,
-1.575842, -1.862383, -2.135329, 1, 1, 1, 1, 1,
-1.570433, 0.2942338, -3.234358, 1, 1, 1, 1, 1,
-1.569844, 2.338503, -0.01174576, 1, 1, 1, 1, 1,
-1.569322, 0.2167653, -1.859032, 1, 1, 1, 1, 1,
-1.554978, 0.7743796, -2.793437, 1, 1, 1, 1, 1,
-1.552898, -0.114571, -1.406418, 1, 1, 1, 1, 1,
-1.550432, -0.111884, -2.282231, 0, 0, 1, 1, 1,
-1.530271, -0.1409029, -1.260706, 1, 0, 0, 1, 1,
-1.526527, 0.8061985, 0.8649451, 1, 0, 0, 1, 1,
-1.52081, 0.7378638, 0.001125803, 1, 0, 0, 1, 1,
-1.515311, 0.2391155, -1.398882, 1, 0, 0, 1, 1,
-1.513609, -0.9967057, -3.058931, 1, 0, 0, 1, 1,
-1.504661, 0.7244961, -1.599448, 0, 0, 0, 1, 1,
-1.503261, 0.7168031, -1.154148, 0, 0, 0, 1, 1,
-1.496889, -0.195708, -2.629148, 0, 0, 0, 1, 1,
-1.495247, -1.237805, -2.547525, 0, 0, 0, 1, 1,
-1.486054, -1.291809, -3.080982, 0, 0, 0, 1, 1,
-1.485876, 1.134734, -2.214046, 0, 0, 0, 1, 1,
-1.479811, 0.8344122, -1.203598, 0, 0, 0, 1, 1,
-1.477107, 0.5243446, -0.08169627, 1, 1, 1, 1, 1,
-1.467819, -1.156505, 0.1154339, 1, 1, 1, 1, 1,
-1.456989, 0.7655697, -3.116419, 1, 1, 1, 1, 1,
-1.438359, -1.167783, -1.66724, 1, 1, 1, 1, 1,
-1.432087, -0.4653727, -2.08828, 1, 1, 1, 1, 1,
-1.426625, -2.02251, -3.322146, 1, 1, 1, 1, 1,
-1.419863, -0.4651008, -2.050946, 1, 1, 1, 1, 1,
-1.4175, 0.6292682, -2.522109, 1, 1, 1, 1, 1,
-1.407047, 0.3796005, -0.7826283, 1, 1, 1, 1, 1,
-1.400026, -0.6422986, -0.3813029, 1, 1, 1, 1, 1,
-1.387899, 1.26977, 0.135323, 1, 1, 1, 1, 1,
-1.374064, 0.9527637, -1.594024, 1, 1, 1, 1, 1,
-1.365521, -0.3670987, -2.29665, 1, 1, 1, 1, 1,
-1.356164, -0.1910064, -1.317717, 1, 1, 1, 1, 1,
-1.342965, -0.6796554, -3.377729, 1, 1, 1, 1, 1,
-1.341282, -0.6784084, -1.667407, 0, 0, 1, 1, 1,
-1.340983, 1.434213, -0.7263256, 1, 0, 0, 1, 1,
-1.335255, 0.9594448, -0.1833684, 1, 0, 0, 1, 1,
-1.327472, -0.202862, -3.25148, 1, 0, 0, 1, 1,
-1.319345, -0.7589717, -2.37216, 1, 0, 0, 1, 1,
-1.312665, 0.6252021, -0.6742727, 1, 0, 0, 1, 1,
-1.311105, 0.04195294, -0.9446117, 0, 0, 0, 1, 1,
-1.307425, 0.1951464, -0.6641742, 0, 0, 0, 1, 1,
-1.299654, -0.5078773, -1.948832, 0, 0, 0, 1, 1,
-1.298587, 1.944422, 0.533834, 0, 0, 0, 1, 1,
-1.293861, 1.60177, -1.462098, 0, 0, 0, 1, 1,
-1.293151, -0.1836145, -2.188304, 0, 0, 0, 1, 1,
-1.290876, -0.03044574, -1.956583, 0, 0, 0, 1, 1,
-1.287573, 0.5309556, -2.740229, 1, 1, 1, 1, 1,
-1.279467, 1.783501, -0.2538574, 1, 1, 1, 1, 1,
-1.278081, -0.727866, -2.741323, 1, 1, 1, 1, 1,
-1.270039, -0.643856, -1.021751, 1, 1, 1, 1, 1,
-1.259431, 0.2455312, -2.831173, 1, 1, 1, 1, 1,
-1.258658, -3.068543, -2.856426, 1, 1, 1, 1, 1,
-1.256759, 0.8424311, -0.4087663, 1, 1, 1, 1, 1,
-1.247507, 0.5230798, -0.3619192, 1, 1, 1, 1, 1,
-1.239342, 0.4573067, -0.5508372, 1, 1, 1, 1, 1,
-1.236254, -0.9412146, -1.214161, 1, 1, 1, 1, 1,
-1.231344, 0.2197327, -2.040716, 1, 1, 1, 1, 1,
-1.228927, 1.09506, -2.154476, 1, 1, 1, 1, 1,
-1.228781, 0.369678, 0.03088619, 1, 1, 1, 1, 1,
-1.223845, -1.182875, -2.798144, 1, 1, 1, 1, 1,
-1.222072, 4.278633e-05, -0.7391722, 1, 1, 1, 1, 1,
-1.221038, 0.008704321, -1.693969, 0, 0, 1, 1, 1,
-1.220944, -1.958418, -1.513017, 1, 0, 0, 1, 1,
-1.211846, 1.968044, 0.5797291, 1, 0, 0, 1, 1,
-1.197569, 0.7998139, -1.487293, 1, 0, 0, 1, 1,
-1.187955, -0.4815475, -1.604108, 1, 0, 0, 1, 1,
-1.178478, 1.435942, -0.4896322, 1, 0, 0, 1, 1,
-1.17528, 2.129732, -0.5999965, 0, 0, 0, 1, 1,
-1.169211, 1.246565, -1.395721, 0, 0, 0, 1, 1,
-1.1631, -2.272085, -0.5440705, 0, 0, 0, 1, 1,
-1.160302, -1.030171, -2.365012, 0, 0, 0, 1, 1,
-1.150912, 1.811498, -0.83097, 0, 0, 0, 1, 1,
-1.148555, 0.6942959, -0.004877747, 0, 0, 0, 1, 1,
-1.143889, 0.4107021, -1.793783, 0, 0, 0, 1, 1,
-1.142037, 0.5999786, -1.241026, 1, 1, 1, 1, 1,
-1.138614, -1.079829, -2.567677, 1, 1, 1, 1, 1,
-1.116981, 0.5559201, 0.762018, 1, 1, 1, 1, 1,
-1.115413, 0.5195591, -0.4920093, 1, 1, 1, 1, 1,
-1.11332, 2.444814, 1.350027, 1, 1, 1, 1, 1,
-1.111619, -2.278273, -2.714154, 1, 1, 1, 1, 1,
-1.111409, 0.3339643, -0.05611365, 1, 1, 1, 1, 1,
-1.102677, 1.246632, -2.324726, 1, 1, 1, 1, 1,
-1.096648, 0.2507393, -2.489223, 1, 1, 1, 1, 1,
-1.092252, -0.8406752, -1.594864, 1, 1, 1, 1, 1,
-1.081861, -0.630554, -3.268419, 1, 1, 1, 1, 1,
-1.073478, 0.1533419, -1.928214, 1, 1, 1, 1, 1,
-1.068963, 0.4108713, -0.7425042, 1, 1, 1, 1, 1,
-1.066842, 1.562895, -1.071615, 1, 1, 1, 1, 1,
-1.064198, 0.9501387, -0.5239119, 1, 1, 1, 1, 1,
-1.06346, 1.408978, 1.810172, 0, 0, 1, 1, 1,
-1.063385, 0.8384391, -2.259339, 1, 0, 0, 1, 1,
-1.06061, -0.8588226, -1.972148, 1, 0, 0, 1, 1,
-1.054932, -0.4612301, -1.978354, 1, 0, 0, 1, 1,
-1.047014, -0.4590661, -2.752853, 1, 0, 0, 1, 1,
-1.043952, -1.410358, -2.34861, 1, 0, 0, 1, 1,
-1.042417, 0.8432561, -0.1011712, 0, 0, 0, 1, 1,
-1.038031, 0.09152907, -2.75107, 0, 0, 0, 1, 1,
-1.023313, -0.4115043, -1.425835, 0, 0, 0, 1, 1,
-1.021727, -0.6515728, -1.921159, 0, 0, 0, 1, 1,
-1.020231, -2.248578, -3.671, 0, 0, 0, 1, 1,
-1.018384, -0.17996, -2.441781, 0, 0, 0, 1, 1,
-1.018056, 0.3158016, -2.029558, 0, 0, 0, 1, 1,
-1.017226, -0.7415981, -2.928394, 1, 1, 1, 1, 1,
-1.015626, 0.9328123, -0.4313648, 1, 1, 1, 1, 1,
-1.008911, 0.8156397, -2.403685, 1, 1, 1, 1, 1,
-1.007543, -0.1895561, -2.243859, 1, 1, 1, 1, 1,
-1.004935, 1.289634, 1.554804, 1, 1, 1, 1, 1,
-1.003465, -0.08287308, -0.9076924, 1, 1, 1, 1, 1,
-1.000732, -1.393073, -1.902178, 1, 1, 1, 1, 1,
-0.9962922, 0.1797522, -1.864272, 1, 1, 1, 1, 1,
-0.9920642, 0.2035672, -2.414202, 1, 1, 1, 1, 1,
-0.9899092, 0.261791, -0.8607608, 1, 1, 1, 1, 1,
-0.9865723, -0.9589573, -0.6433577, 1, 1, 1, 1, 1,
-0.9600157, -0.5819905, -3.690065, 1, 1, 1, 1, 1,
-0.9579834, 0.215692, -2.218036, 1, 1, 1, 1, 1,
-0.9521085, 1.236988, 0.05582974, 1, 1, 1, 1, 1,
-0.9512767, -1.007739, -3.122193, 1, 1, 1, 1, 1,
-0.9497527, -0.8325576, -2.3948, 0, 0, 1, 1, 1,
-0.9482731, 0.6675016, 1.096519, 1, 0, 0, 1, 1,
-0.9438887, 1.390549, -1.514301, 1, 0, 0, 1, 1,
-0.9408009, -0.009780468, -1.576028, 1, 0, 0, 1, 1,
-0.9359474, 1.162328, -0.0394351, 1, 0, 0, 1, 1,
-0.9304817, 0.985265, -0.9363273, 1, 0, 0, 1, 1,
-0.9291503, 1.095, -2.600883, 0, 0, 0, 1, 1,
-0.9265157, -0.5267509, -1.424099, 0, 0, 0, 1, 1,
-0.9245062, 0.3489521, -1.530221, 0, 0, 0, 1, 1,
-0.9210809, -0.3257736, -3.182621, 0, 0, 0, 1, 1,
-0.9207032, 0.7575798, -1.558828, 0, 0, 0, 1, 1,
-0.9173318, -1.053363, -2.864916, 0, 0, 0, 1, 1,
-0.9143901, -1.101806, -3.760033, 0, 0, 0, 1, 1,
-0.9137439, -0.4525942, -1.738589, 1, 1, 1, 1, 1,
-0.9129883, -0.6822269, -2.222505, 1, 1, 1, 1, 1,
-0.9088148, 1.193319, -2.053167, 1, 1, 1, 1, 1,
-0.8994181, 0.7703154, -0.1642782, 1, 1, 1, 1, 1,
-0.8974152, 0.7539604, -1.798243, 1, 1, 1, 1, 1,
-0.8947514, -0.2835484, -0.7645982, 1, 1, 1, 1, 1,
-0.8880481, -1.198488, -1.840495, 1, 1, 1, 1, 1,
-0.8844745, 0.02333407, -0.1256573, 1, 1, 1, 1, 1,
-0.8837946, -1.154898, -1.355664, 1, 1, 1, 1, 1,
-0.8771774, -0.7882375, -2.02524, 1, 1, 1, 1, 1,
-0.8732219, 0.7790225, -0.204453, 1, 1, 1, 1, 1,
-0.8709082, -1.1807, -2.142144, 1, 1, 1, 1, 1,
-0.855889, 1.6127, -0.5378653, 1, 1, 1, 1, 1,
-0.8509262, -0.6784628, -1.962152, 1, 1, 1, 1, 1,
-0.8505843, 0.2248893, -1.181399, 1, 1, 1, 1, 1,
-0.848245, -0.6962774, -2.11735, 0, 0, 1, 1, 1,
-0.836756, -0.3415212, -2.288726, 1, 0, 0, 1, 1,
-0.8361781, 1.600114, -0.4642196, 1, 0, 0, 1, 1,
-0.8338516, 0.830422, -0.574915, 1, 0, 0, 1, 1,
-0.826583, 0.53894, 0.09764887, 1, 0, 0, 1, 1,
-0.8259388, -0.4176165, -1.426573, 1, 0, 0, 1, 1,
-0.8254329, -0.2085157, -1.77593, 0, 0, 0, 1, 1,
-0.8209203, 0.7226184, 0.5000529, 0, 0, 0, 1, 1,
-0.8185787, -0.07486612, -1.971738, 0, 0, 0, 1, 1,
-0.8064394, 0.9795474, -0.5947426, 0, 0, 0, 1, 1,
-0.8050349, -1.322301, -2.277452, 0, 0, 0, 1, 1,
-0.8014063, 0.6205419, -0.7013566, 0, 0, 0, 1, 1,
-0.7879955, -0.02928339, -1.147018, 0, 0, 0, 1, 1,
-0.7861181, 0.2645064, -1.772085, 1, 1, 1, 1, 1,
-0.783786, 0.03844129, -2.05698, 1, 1, 1, 1, 1,
-0.7806647, 0.07066172, -1.661346, 1, 1, 1, 1, 1,
-0.7791322, 0.8253965, -0.6770557, 1, 1, 1, 1, 1,
-0.7772226, -0.4989524, -3.342298, 1, 1, 1, 1, 1,
-0.7768417, 0.6475261, -1.059742, 1, 1, 1, 1, 1,
-0.7632486, 0.9353384, -1.276026, 1, 1, 1, 1, 1,
-0.7620799, -0.08899404, -0.8325555, 1, 1, 1, 1, 1,
-0.7600584, -2.036255, -2.426648, 1, 1, 1, 1, 1,
-0.7575891, 0.3453042, 0.1178233, 1, 1, 1, 1, 1,
-0.7572881, 0.5283949, -0.7297747, 1, 1, 1, 1, 1,
-0.7542644, -0.4751014, -1.631061, 1, 1, 1, 1, 1,
-0.7516379, 0.153112, -0.6267983, 1, 1, 1, 1, 1,
-0.7468633, 0.3635028, -2.93424, 1, 1, 1, 1, 1,
-0.7436007, -1.087885, -1.598128, 1, 1, 1, 1, 1,
-0.7426874, 0.2523322, -0.6571292, 0, 0, 1, 1, 1,
-0.7422159, -0.37973, -2.31628, 1, 0, 0, 1, 1,
-0.7414052, -0.2112533, -2.054965, 1, 0, 0, 1, 1,
-0.738201, 1.237334, -2.206632, 1, 0, 0, 1, 1,
-0.7340868, -0.07623281, -1.598041, 1, 0, 0, 1, 1,
-0.7313794, -0.3043419, -2.491452, 1, 0, 0, 1, 1,
-0.7297201, 0.9226174, -1.79195, 0, 0, 0, 1, 1,
-0.7265312, -0.1471751, -0.8492527, 0, 0, 0, 1, 1,
-0.7232228, -1.152456, -1.779124, 0, 0, 0, 1, 1,
-0.7163172, 0.07974721, -0.3122273, 0, 0, 0, 1, 1,
-0.7127948, 0.6045237, -0.8771501, 0, 0, 0, 1, 1,
-0.7127301, 0.2762117, -0.3273185, 0, 0, 0, 1, 1,
-0.7125407, -0.7348469, -2.52087, 0, 0, 0, 1, 1,
-0.7123398, -0.9944168, -1.797187, 1, 1, 1, 1, 1,
-0.7100329, 0.6401321, 1.072063, 1, 1, 1, 1, 1,
-0.7077511, 1.215008, 0.3255359, 1, 1, 1, 1, 1,
-0.707644, -1.46012, -2.147589, 1, 1, 1, 1, 1,
-0.7049729, 0.2798509, -1.115725, 1, 1, 1, 1, 1,
-0.6945646, 0.4899543, -0.3612045, 1, 1, 1, 1, 1,
-0.6898044, -0.8551956, -3.237874, 1, 1, 1, 1, 1,
-0.6883677, 0.8884994, -0.7962938, 1, 1, 1, 1, 1,
-0.6866762, -2.222728, -3.354937, 1, 1, 1, 1, 1,
-0.6860762, -1.027148, -1.345797, 1, 1, 1, 1, 1,
-0.6849996, -0.1547314, -3.371439, 1, 1, 1, 1, 1,
-0.6817182, -0.07712576, -1.963551, 1, 1, 1, 1, 1,
-0.6757203, -0.9285042, -2.174408, 1, 1, 1, 1, 1,
-0.6673638, -0.1792504, -1.440394, 1, 1, 1, 1, 1,
-0.6631866, -0.9596047, -2.794194, 1, 1, 1, 1, 1,
-0.6626665, -2.40257, -2.020507, 0, 0, 1, 1, 1,
-0.6626432, 0.5333391, -1.401885, 1, 0, 0, 1, 1,
-0.6591679, 0.4889541, 0.1656596, 1, 0, 0, 1, 1,
-0.6586915, 2.747533, 0.0689242, 1, 0, 0, 1, 1,
-0.6583178, -0.4100085, -3.91145, 1, 0, 0, 1, 1,
-0.6582534, -0.4353687, -1.717659, 1, 0, 0, 1, 1,
-0.651525, -1.542871, -3.73052, 0, 0, 0, 1, 1,
-0.6503947, -0.04285435, -2.864886, 0, 0, 0, 1, 1,
-0.6446118, -0.383906, -3.927481, 0, 0, 0, 1, 1,
-0.6401944, 0.9863555, -3.163627, 0, 0, 0, 1, 1,
-0.6398821, -0.8264714, -2.519818, 0, 0, 0, 1, 1,
-0.6393076, 0.1185278, -0.02690724, 0, 0, 0, 1, 1,
-0.6382256, 0.009730102, -1.729928, 0, 0, 0, 1, 1,
-0.6367712, -0.7473072, -1.806238, 1, 1, 1, 1, 1,
-0.634846, 1.302183, -0.0009588004, 1, 1, 1, 1, 1,
-0.6335813, -0.7661207, -2.259886, 1, 1, 1, 1, 1,
-0.6306124, 0.4934133, -0.8884563, 1, 1, 1, 1, 1,
-0.6305408, -1.253448, -3.693659, 1, 1, 1, 1, 1,
-0.6277243, -1.813492, -3.084184, 1, 1, 1, 1, 1,
-0.6265934, -0.9600887, -3.232195, 1, 1, 1, 1, 1,
-0.6242598, -0.32262, -2.831059, 1, 1, 1, 1, 1,
-0.6229916, -0.7151766, -5.263915, 1, 1, 1, 1, 1,
-0.6182505, -0.5910284, -3.337827, 1, 1, 1, 1, 1,
-0.6090996, -0.6112829, -1.624897, 1, 1, 1, 1, 1,
-0.6069766, 0.1232907, -1.147921, 1, 1, 1, 1, 1,
-0.6067147, -0.2203736, -2.705489, 1, 1, 1, 1, 1,
-0.6037157, -0.107885, -0.7160739, 1, 1, 1, 1, 1,
-0.5965845, -0.6525443, -3.000286, 1, 1, 1, 1, 1,
-0.5953842, -0.168925, -1.69877, 0, 0, 1, 1, 1,
-0.59248, -0.0421358, -0.4078526, 1, 0, 0, 1, 1,
-0.5830283, 0.8445913, -0.03041038, 1, 0, 0, 1, 1,
-0.5807399, 0.9304077, -2.560477, 1, 0, 0, 1, 1,
-0.5807264, 0.7084842, -1.1874, 1, 0, 0, 1, 1,
-0.5782728, 0.4163717, -0.8952919, 1, 0, 0, 1, 1,
-0.5772135, -2.071026, -3.389637, 0, 0, 0, 1, 1,
-0.5761986, 0.5049276, -1.97751, 0, 0, 0, 1, 1,
-0.5712685, 1.198088, 0.2249737, 0, 0, 0, 1, 1,
-0.568391, 0.004942574, -0.5177334, 0, 0, 0, 1, 1,
-0.5657045, 0.5286947, -1.747565, 0, 0, 0, 1, 1,
-0.5627923, 0.4518116, -0.3348387, 0, 0, 0, 1, 1,
-0.5559003, -1.62792, -2.666353, 0, 0, 0, 1, 1,
-0.5471447, -1.403589, -3.513851, 1, 1, 1, 1, 1,
-0.5438342, 0.5853398, -1.019975, 1, 1, 1, 1, 1,
-0.5411113, 1.166482, 0.1330792, 1, 1, 1, 1, 1,
-0.5344273, 0.9670368, -0.1482689, 1, 1, 1, 1, 1,
-0.5341732, -0.4505346, -1.412226, 1, 1, 1, 1, 1,
-0.5337632, 0.4112944, -0.3643857, 1, 1, 1, 1, 1,
-0.5337408, -0.5851067, -2.635758, 1, 1, 1, 1, 1,
-0.5333822, 0.1363228, -1.949603, 1, 1, 1, 1, 1,
-0.5237139, 1.192758, -1.745108, 1, 1, 1, 1, 1,
-0.5220357, -0.7989717, -4.85928, 1, 1, 1, 1, 1,
-0.5212473, -0.3919237, -0.4859001, 1, 1, 1, 1, 1,
-0.5210915, -0.7966789, -2.920763, 1, 1, 1, 1, 1,
-0.5187914, 0.8150659, -0.5046548, 1, 1, 1, 1, 1,
-0.516701, -0.2380799, -0.9907179, 1, 1, 1, 1, 1,
-0.5160408, -0.529329, -2.561917, 1, 1, 1, 1, 1,
-0.516013, -1.2701, -2.151445, 0, 0, 1, 1, 1,
-0.512694, -0.9883457, -5.230604, 1, 0, 0, 1, 1,
-0.5063374, 1.344886, -0.2455416, 1, 0, 0, 1, 1,
-0.5017418, -1.090175, -3.29688, 1, 0, 0, 1, 1,
-0.4977651, 0.5568334, -0.5695299, 1, 0, 0, 1, 1,
-0.4970433, 0.05822824, -0.9761677, 1, 0, 0, 1, 1,
-0.4923798, 1.624722, 0.623115, 0, 0, 0, 1, 1,
-0.4912443, 0.4652617, -0.3906692, 0, 0, 0, 1, 1,
-0.4902939, 0.5075985, 1.18024, 0, 0, 0, 1, 1,
-0.4873518, -1.377831, -2.565154, 0, 0, 0, 1, 1,
-0.4854355, -1.08482, -2.590465, 0, 0, 0, 1, 1,
-0.4850589, 0.2406835, -0.7207934, 0, 0, 0, 1, 1,
-0.4816329, -1.033991, -2.516525, 0, 0, 0, 1, 1,
-0.4807837, -1.330497, -3.301626, 1, 1, 1, 1, 1,
-0.4807126, -0.3011001, -2.356066, 1, 1, 1, 1, 1,
-0.4772222, 0.5201976, -1.865651, 1, 1, 1, 1, 1,
-0.4755352, -0.3293886, -0.1257527, 1, 1, 1, 1, 1,
-0.4666015, 1.545181, 0.6421857, 1, 1, 1, 1, 1,
-0.4617382, -0.3440498, -2.470945, 1, 1, 1, 1, 1,
-0.4595267, -0.2939864, -1.540579, 1, 1, 1, 1, 1,
-0.4571133, -0.3638023, -2.181619, 1, 1, 1, 1, 1,
-0.453232, -2.698328, -3.773849, 1, 1, 1, 1, 1,
-0.450956, -1.17861, -1.693829, 1, 1, 1, 1, 1,
-0.4507654, 1.467397, -1.480151, 1, 1, 1, 1, 1,
-0.4467404, -0.5322159, -1.633866, 1, 1, 1, 1, 1,
-0.4456882, 0.7688234, -1.39064, 1, 1, 1, 1, 1,
-0.4419396, 1.258434, 1.310564, 1, 1, 1, 1, 1,
-0.4381054, 0.319169, 0.8448504, 1, 1, 1, 1, 1,
-0.4372601, 1.316541, 0.8588599, 0, 0, 1, 1, 1,
-0.4324535, -1.684057, -3.726377, 1, 0, 0, 1, 1,
-0.4312088, -0.09580855, 0.8924214, 1, 0, 0, 1, 1,
-0.4234679, -0.0486857, -0.8302919, 1, 0, 0, 1, 1,
-0.4224364, -0.09945468, -1.073811, 1, 0, 0, 1, 1,
-0.4214085, -1.259099, -4.25089, 1, 0, 0, 1, 1,
-0.4134278, 0.03748878, -2.793214, 0, 0, 0, 1, 1,
-0.4116138, -0.3931029, -3.338835, 0, 0, 0, 1, 1,
-0.4049158, 0.8946527, -0.4081792, 0, 0, 0, 1, 1,
-0.4043988, 0.7365659, -0.472592, 0, 0, 0, 1, 1,
-0.4031921, 0.6630573, -0.7474273, 0, 0, 0, 1, 1,
-0.4018174, -1.955338, -3.416683, 0, 0, 0, 1, 1,
-0.3964451, 0.2575211, -3.987813, 0, 0, 0, 1, 1,
-0.3940049, -1.402998, -3.187071, 1, 1, 1, 1, 1,
-0.3938957, -1.576679, -2.760541, 1, 1, 1, 1, 1,
-0.3899527, 0.4863684, -1.571485, 1, 1, 1, 1, 1,
-0.3874372, -0.1816252, -2.349638, 1, 1, 1, 1, 1,
-0.3859661, 0.8940067, -2.030405, 1, 1, 1, 1, 1,
-0.3834831, 1.611526, 0.7009277, 1, 1, 1, 1, 1,
-0.3822833, 0.4914558, -0.5616746, 1, 1, 1, 1, 1,
-0.3803604, -0.7145579, -2.074457, 1, 1, 1, 1, 1,
-0.380087, -1.288508, -2.377192, 1, 1, 1, 1, 1,
-0.3797531, 0.2375897, -0.8352746, 1, 1, 1, 1, 1,
-0.3779341, 1.835112, -0.6686746, 1, 1, 1, 1, 1,
-0.3752234, 0.7235815, 0.9761213, 1, 1, 1, 1, 1,
-0.3732085, -1.061412, -4.859878, 1, 1, 1, 1, 1,
-0.3725939, -2.469489, -2.399178, 1, 1, 1, 1, 1,
-0.372475, -0.5765137, -2.461535, 1, 1, 1, 1, 1,
-0.372034, 0.890186, -0.5082692, 0, 0, 1, 1, 1,
-0.3665274, 0.7473224, -2.062786, 1, 0, 0, 1, 1,
-0.3657955, 0.4292542, -0.6098751, 1, 0, 0, 1, 1,
-0.3646227, 0.8073375, -0.6606349, 1, 0, 0, 1, 1,
-0.3628571, -1.871734, -3.362966, 1, 0, 0, 1, 1,
-0.3609168, 0.1241696, -1.711525, 1, 0, 0, 1, 1,
-0.3602046, 2.185233, 0.4835812, 0, 0, 0, 1, 1,
-0.3580146, 1.332308, -0.2978386, 0, 0, 0, 1, 1,
-0.3576873, 0.3301116, -0.431069, 0, 0, 0, 1, 1,
-0.3570749, -2.812039, -1.289325, 0, 0, 0, 1, 1,
-0.3562591, -0.04672308, -0.8512512, 0, 0, 0, 1, 1,
-0.3558195, -1.072631, -2.797647, 0, 0, 0, 1, 1,
-0.3527111, 0.05207656, -1.075507, 0, 0, 0, 1, 1,
-0.3510163, 0.2316239, -1.11579, 1, 1, 1, 1, 1,
-0.3501366, -0.7728117, -1.95539, 1, 1, 1, 1, 1,
-0.3475437, -0.7955267, -4.3023, 1, 1, 1, 1, 1,
-0.3462143, -0.9519631, -2.818604, 1, 1, 1, 1, 1,
-0.3439636, -0.4240368, -1.22428, 1, 1, 1, 1, 1,
-0.3431112, -0.1180979, -2.779328, 1, 1, 1, 1, 1,
-0.3418226, -0.6426639, -2.282352, 1, 1, 1, 1, 1,
-0.3381993, -1.406083, -1.897731, 1, 1, 1, 1, 1,
-0.3358755, 0.635499, -0.2887615, 1, 1, 1, 1, 1,
-0.33523, -2.119452, -2.860965, 1, 1, 1, 1, 1,
-0.3348595, 0.6797673, 0.1397094, 1, 1, 1, 1, 1,
-0.3334091, 0.804772, -0.8755319, 1, 1, 1, 1, 1,
-0.3289355, 1.924442, -0.7028531, 1, 1, 1, 1, 1,
-0.3289018, -0.8636783, -3.744172, 1, 1, 1, 1, 1,
-0.3189121, -0.3854973, -0.9789358, 1, 1, 1, 1, 1,
-0.3186864, 0.0899493, -2.487832, 0, 0, 1, 1, 1,
-0.3112072, 0.120377, -1.61764, 1, 0, 0, 1, 1,
-0.3042356, -0.5063, -1.841422, 1, 0, 0, 1, 1,
-0.2974381, -0.2021363, -1.830808, 1, 0, 0, 1, 1,
-0.2973604, 3.204524, -0.04284385, 1, 0, 0, 1, 1,
-0.2970763, 0.03293694, -2.284736, 1, 0, 0, 1, 1,
-0.2952643, 1.572876, 0.659668, 0, 0, 0, 1, 1,
-0.2887368, 0.5314301, -1.319865, 0, 0, 0, 1, 1,
-0.2847972, 2.968632, -0.9850736, 0, 0, 0, 1, 1,
-0.2830518, 0.3638093, -1.708977, 0, 0, 0, 1, 1,
-0.2796811, -1.618276, -0.4941331, 0, 0, 0, 1, 1,
-0.279032, 0.7718092, -0.8358042, 0, 0, 0, 1, 1,
-0.2733854, 0.9607363, -0.01407587, 0, 0, 0, 1, 1,
-0.269614, -0.526409, -2.58577, 1, 1, 1, 1, 1,
-0.2590766, 0.06415913, -1.16729, 1, 1, 1, 1, 1,
-0.2573445, -1.223395, -3.870563, 1, 1, 1, 1, 1,
-0.256954, -2.406, -3.983245, 1, 1, 1, 1, 1,
-0.2542722, 0.5176582, -0.6136242, 1, 1, 1, 1, 1,
-0.2540197, 2.278338, -1.622504, 1, 1, 1, 1, 1,
-0.252257, -1.278107, -1.584401, 1, 1, 1, 1, 1,
-0.2501524, 0.6382954, -3.487795, 1, 1, 1, 1, 1,
-0.2475257, -0.1138603, -2.621911, 1, 1, 1, 1, 1,
-0.2465677, -0.2893138, -1.17796, 1, 1, 1, 1, 1,
-0.2449195, 0.6953453, -0.5958725, 1, 1, 1, 1, 1,
-0.2431197, 1.454477, -0.2193501, 1, 1, 1, 1, 1,
-0.240308, 1.260565, 0.4781452, 1, 1, 1, 1, 1,
-0.2358892, 0.4834396, 0.2682305, 1, 1, 1, 1, 1,
-0.2303894, 0.7741493, -0.6293682, 1, 1, 1, 1, 1,
-0.2301305, -0.07879222, -2.179048, 0, 0, 1, 1, 1,
-0.2261131, -1.313995, -3.493025, 1, 0, 0, 1, 1,
-0.2235993, 2.308173, -1.026096, 1, 0, 0, 1, 1,
-0.2211738, 1.315252, -1.017832, 1, 0, 0, 1, 1,
-0.2171135, 0.9460641, -0.9740271, 1, 0, 0, 1, 1,
-0.2170227, -0.1330754, -1.827482, 1, 0, 0, 1, 1,
-0.2162465, 0.2666518, 0.1265826, 0, 0, 0, 1, 1,
-0.2160453, 1.682632, 0.4979409, 0, 0, 0, 1, 1,
-0.2155589, 0.7635013, -1.052679, 0, 0, 0, 1, 1,
-0.2153964, -0.2723148, -2.09519, 0, 0, 0, 1, 1,
-0.2152532, 0.7517279, -0.05255965, 0, 0, 0, 1, 1,
-0.2127026, 1.367391, 0.4339359, 0, 0, 0, 1, 1,
-0.2124211, 1.357667, -1.722614, 0, 0, 0, 1, 1,
-0.2118842, 2.071354, 0.3364969, 1, 1, 1, 1, 1,
-0.2109307, 0.3271777, -0.3918781, 1, 1, 1, 1, 1,
-0.1981801, 1.06229, 0.1128392, 1, 1, 1, 1, 1,
-0.1963252, 0.4498975, -0.2230347, 1, 1, 1, 1, 1,
-0.1960703, -0.1366518, -1.855495, 1, 1, 1, 1, 1,
-0.196046, -1.335165, -3.509367, 1, 1, 1, 1, 1,
-0.1924955, 0.4547243, 0.6821191, 1, 1, 1, 1, 1,
-0.1919774, -1.038082, -3.449889, 1, 1, 1, 1, 1,
-0.189548, 0.9623863, -1.092731, 1, 1, 1, 1, 1,
-0.1844883, -0.06185281, -1.321185, 1, 1, 1, 1, 1,
-0.1807823, -0.3250896, -3.579966, 1, 1, 1, 1, 1,
-0.179328, 0.6220273, -0.8817633, 1, 1, 1, 1, 1,
-0.175861, -1.359766, -3.24281, 1, 1, 1, 1, 1,
-0.175813, -1.057993, -2.600832, 1, 1, 1, 1, 1,
-0.175746, -0.4462658, -2.051366, 1, 1, 1, 1, 1,
-0.1740925, 0.7265849, 0.8097177, 0, 0, 1, 1, 1,
-0.1706107, 1.358439, -0.4456109, 1, 0, 0, 1, 1,
-0.1702866, 0.6078159, 0.774427, 1, 0, 0, 1, 1,
-0.1696479, -2.309638, -2.019924, 1, 0, 0, 1, 1,
-0.1623976, 0.5420083, -1.697317, 1, 0, 0, 1, 1,
-0.1577214, 0.8366787, 1.671465, 1, 0, 0, 1, 1,
-0.1575843, 1.281486, 0.05456186, 0, 0, 0, 1, 1,
-0.1556957, 0.8589929, 0.5765381, 0, 0, 0, 1, 1,
-0.154094, -0.4467146, -1.57333, 0, 0, 0, 1, 1,
-0.1534025, 0.09647726, -1.692052, 0, 0, 0, 1, 1,
-0.146599, -1.124689, -1.772929, 0, 0, 0, 1, 1,
-0.1448794, -0.5489044, -2.32003, 0, 0, 0, 1, 1,
-0.1436044, -1.641839, -3.175067, 0, 0, 0, 1, 1,
-0.142279, 0.7395322, 0.4010699, 1, 1, 1, 1, 1,
-0.1397652, 1.242721, 0.4369232, 1, 1, 1, 1, 1,
-0.1384538, 0.6195797, -0.7932269, 1, 1, 1, 1, 1,
-0.1352201, 0.3412983, 0.1524005, 1, 1, 1, 1, 1,
-0.1336235, -0.4352382, -1.734975, 1, 1, 1, 1, 1,
-0.1328024, 0.4894797, -2.619886, 1, 1, 1, 1, 1,
-0.1305429, -0.7507372, -3.907531, 1, 1, 1, 1, 1,
-0.1266587, 0.1632563, -1.492976, 1, 1, 1, 1, 1,
-0.1266371, -0.2804937, -3.173398, 1, 1, 1, 1, 1,
-0.1264043, -1.497863, -3.960193, 1, 1, 1, 1, 1,
-0.1253575, -0.1436588, -1.226052, 1, 1, 1, 1, 1,
-0.1216218, -0.8168901, -1.54638, 1, 1, 1, 1, 1,
-0.1134472, 1.536776, 0.7176688, 1, 1, 1, 1, 1,
-0.1122419, 1.385013, -0.7102266, 1, 1, 1, 1, 1,
-0.1107052, 1.269254, 1.274565, 1, 1, 1, 1, 1,
-0.1104786, 0.7200401, -1.774713, 0, 0, 1, 1, 1,
-0.1066412, 0.3866592, -0.608938, 1, 0, 0, 1, 1,
-0.1060949, -0.00802652, -1.441279, 1, 0, 0, 1, 1,
-0.1040676, -0.3064133, -2.832105, 1, 0, 0, 1, 1,
-0.1022643, 1.396142, 0.4180285, 1, 0, 0, 1, 1,
-0.101848, 2.803058, -0.2580914, 1, 0, 0, 1, 1,
-0.101497, 0.6327345, -0.2068442, 0, 0, 0, 1, 1,
-0.1013448, -0.2563725, -1.398959, 0, 0, 0, 1, 1,
-0.101058, 0.1502591, 0.9818473, 0, 0, 0, 1, 1,
-0.1007252, 2.053639, 0.7989699, 0, 0, 0, 1, 1,
-0.09696772, 0.1506722, -1.78487, 0, 0, 0, 1, 1,
-0.0935931, 0.5953403, -0.2326435, 0, 0, 0, 1, 1,
-0.09259782, 1.047241, 0.02210013, 0, 0, 0, 1, 1,
-0.08963707, -1.131425, -1.797907, 1, 1, 1, 1, 1,
-0.08950379, -1.515107, -4.327508, 1, 1, 1, 1, 1,
-0.08229595, 0.01102598, -1.124502, 1, 1, 1, 1, 1,
-0.08120708, -0.5069537, -2.556934, 1, 1, 1, 1, 1,
-0.08077666, 0.730992, -1.037148, 1, 1, 1, 1, 1,
-0.08029197, -0.7375162, -2.955173, 1, 1, 1, 1, 1,
-0.0789393, -0.2046846, -4.381845, 1, 1, 1, 1, 1,
-0.07854237, -1.02661, -3.477544, 1, 1, 1, 1, 1,
-0.07728637, 0.421313, -0.8675535, 1, 1, 1, 1, 1,
-0.06684367, 1.341859, 0.3012755, 1, 1, 1, 1, 1,
-0.06485045, 0.4259825, -1.078771, 1, 1, 1, 1, 1,
-0.06479523, -0.155966, -2.439448, 1, 1, 1, 1, 1,
-0.06214317, -1.309609, -2.784823, 1, 1, 1, 1, 1,
-0.05979801, 1.130036, 0.2020365, 1, 1, 1, 1, 1,
-0.05281033, 0.4532512, 0.4575643, 1, 1, 1, 1, 1,
-0.05255368, -0.5411081, -4.107238, 0, 0, 1, 1, 1,
-0.04997282, 0.7534723, -0.2042316, 1, 0, 0, 1, 1,
-0.04272531, 0.1994398, 1.641169, 1, 0, 0, 1, 1,
-0.04232438, -0.6915122, -3.536609, 1, 0, 0, 1, 1,
-0.0419357, 0.3782844, -1.066459, 1, 0, 0, 1, 1,
-0.03930567, -0.3892215, -5.601007, 1, 0, 0, 1, 1,
-0.03685671, -0.7972099, -1.772329, 0, 0, 0, 1, 1,
-0.03316749, 1.252955, -0.5097182, 0, 0, 0, 1, 1,
-0.03159037, 2.673175, -1.228597, 0, 0, 0, 1, 1,
-0.02947129, 1.024713, -0.2264306, 0, 0, 0, 1, 1,
-0.02673329, 0.8768998, 0.5599595, 0, 0, 0, 1, 1,
-0.02431615, 0.4900306, -0.9821458, 0, 0, 0, 1, 1,
-0.01762043, -0.6928296, -2.059674, 0, 0, 0, 1, 1,
-0.0156788, -1.436292, -4.109363, 1, 1, 1, 1, 1,
-0.01324433, 1.384571, -0.8656723, 1, 1, 1, 1, 1,
-0.01201568, -0.1149945, -4.008917, 1, 1, 1, 1, 1,
-0.01080341, -1.402796, -3.593324, 1, 1, 1, 1, 1,
0.004634175, -1.057572, 0.4628761, 1, 1, 1, 1, 1,
0.009430662, 0.7230781, -0.008363672, 1, 1, 1, 1, 1,
0.01025873, -0.9515408, 3.608032, 1, 1, 1, 1, 1,
0.01230239, -0.9777616, 4.553787, 1, 1, 1, 1, 1,
0.01386008, -0.4416846, 4.080399, 1, 1, 1, 1, 1,
0.02386268, 1.211909, 0.7487316, 1, 1, 1, 1, 1,
0.02506792, 1.624963, -0.3176706, 1, 1, 1, 1, 1,
0.03261881, -0.4724966, 2.884801, 1, 1, 1, 1, 1,
0.03277229, 0.7473652, 2.125378, 1, 1, 1, 1, 1,
0.03836918, -0.3044976, 3.052656, 1, 1, 1, 1, 1,
0.04261906, 0.9980582, 1.69481, 1, 1, 1, 1, 1,
0.04397245, 0.2228263, -1.919968, 0, 0, 1, 1, 1,
0.04527359, -0.6759645, 5.090677, 1, 0, 0, 1, 1,
0.04691436, 0.1062593, 0.6788133, 1, 0, 0, 1, 1,
0.04736546, -0.6389484, 4.686508, 1, 0, 0, 1, 1,
0.05115249, -0.1943517, 3.327716, 1, 0, 0, 1, 1,
0.05424253, -0.1353639, 3.524285, 1, 0, 0, 1, 1,
0.0542855, 0.1251613, 0.3436767, 0, 0, 0, 1, 1,
0.05694988, 0.1385185, 0.9870476, 0, 0, 0, 1, 1,
0.05923324, -0.9294128, 1.6545, 0, 0, 0, 1, 1,
0.05942025, -1.764879, 4.942008, 0, 0, 0, 1, 1,
0.06439782, -0.9176047, 1.800314, 0, 0, 0, 1, 1,
0.07162502, -0.5453183, 3.416711, 0, 0, 0, 1, 1,
0.07534008, -0.2697487, 2.586217, 0, 0, 0, 1, 1,
0.07693695, 1.605391, -0.6328039, 1, 1, 1, 1, 1,
0.07698705, 1.260792, 0.1249846, 1, 1, 1, 1, 1,
0.0815219, 1.887945, -1.013102, 1, 1, 1, 1, 1,
0.08185755, -0.5646451, 3.021155, 1, 1, 1, 1, 1,
0.08219247, 1.562444, 0.110222, 1, 1, 1, 1, 1,
0.08232123, 1.980259, 1.027282, 1, 1, 1, 1, 1,
0.0824661, -1.046996, 3.053471, 1, 1, 1, 1, 1,
0.08443024, 1.068637, -0.4365928, 1, 1, 1, 1, 1,
0.0860362, -0.2084964, 2.865468, 1, 1, 1, 1, 1,
0.08760986, -0.1297507, 2.144379, 1, 1, 1, 1, 1,
0.08881021, -0.9793764, 2.630552, 1, 1, 1, 1, 1,
0.08901402, -0.4029044, 2.921101, 1, 1, 1, 1, 1,
0.09653585, 1.357909, -0.8256047, 1, 1, 1, 1, 1,
0.09745632, -0.9885, 3.636162, 1, 1, 1, 1, 1,
0.09786431, 0.5871378, -1.328326, 1, 1, 1, 1, 1,
0.09843048, 1.923928, -0.1795398, 0, 0, 1, 1, 1,
0.09894374, 0.1996851, 0.7294297, 1, 0, 0, 1, 1,
0.09917978, -0.1099551, 0.8024702, 1, 0, 0, 1, 1,
0.1005822, 0.9524676, 0.3851255, 1, 0, 0, 1, 1,
0.1058709, -0.07297986, 2.801329, 1, 0, 0, 1, 1,
0.105938, 0.1547754, -0.432377, 1, 0, 0, 1, 1,
0.1071821, 0.5498372, -0.3050552, 0, 0, 0, 1, 1,
0.107974, -0.1547973, 3.332288, 0, 0, 0, 1, 1,
0.108773, 0.04361484, 0.2286142, 0, 0, 0, 1, 1,
0.1114459, -0.3482634, 5.045754, 0, 0, 0, 1, 1,
0.1137918, -2.205868, 2.894362, 0, 0, 0, 1, 1,
0.1153018, -0.2237656, 2.210586, 0, 0, 0, 1, 1,
0.1183391, 0.1167194, 0.5552375, 0, 0, 0, 1, 1,
0.1192899, 1.334177, 0.8631592, 1, 1, 1, 1, 1,
0.1207949, 0.5182136, 0.02193098, 1, 1, 1, 1, 1,
0.1213968, -1.440523, 2.008219, 1, 1, 1, 1, 1,
0.1244317, 1.260965, 0.6124749, 1, 1, 1, 1, 1,
0.1245703, 0.8601287, -0.7292328, 1, 1, 1, 1, 1,
0.1261653, -0.8692281, 3.805525, 1, 1, 1, 1, 1,
0.1300446, -0.8570721, 2.327229, 1, 1, 1, 1, 1,
0.1368929, 1.045791, 1.4556, 1, 1, 1, 1, 1,
0.136986, 1.664982, -0.8457748, 1, 1, 1, 1, 1,
0.1387753, 0.4290203, 0.1178922, 1, 1, 1, 1, 1,
0.1423236, 0.5389407, 0.8706209, 1, 1, 1, 1, 1,
0.1456807, 0.5341468, 3.082389, 1, 1, 1, 1, 1,
0.1475377, 0.6575664, 2.017718, 1, 1, 1, 1, 1,
0.1476388, -0.6614685, 3.241346, 1, 1, 1, 1, 1,
0.1563271, 0.07474432, -0.2779231, 1, 1, 1, 1, 1,
0.1574661, -0.005518322, 1.771939, 0, 0, 1, 1, 1,
0.158413, 0.08376555, 3.372377, 1, 0, 0, 1, 1,
0.1617192, 1.085815, 0.171232, 1, 0, 0, 1, 1,
0.1669424, 0.2709562, 1.205573, 1, 0, 0, 1, 1,
0.1681844, -0.09017133, 2.065182, 1, 0, 0, 1, 1,
0.172415, -0.8756022, 2.766381, 1, 0, 0, 1, 1,
0.1786152, 0.8043153, 1.529129, 0, 0, 0, 1, 1,
0.17942, 1.068632, 1.338616, 0, 0, 0, 1, 1,
0.1919354, -0.3186429, 2.8289, 0, 0, 0, 1, 1,
0.1963878, 0.5966963, 0.3039169, 0, 0, 0, 1, 1,
0.1968144, -0.7566949, 2.050983, 0, 0, 0, 1, 1,
0.1993168, 0.9439183, -1.418387, 0, 0, 0, 1, 1,
0.2049429, 0.3778961, 0.4258459, 0, 0, 0, 1, 1,
0.2069262, 0.5560176, -0.5381522, 1, 1, 1, 1, 1,
0.2094291, -0.03742718, 1.832566, 1, 1, 1, 1, 1,
0.2102861, -1.308896, 1.970256, 1, 1, 1, 1, 1,
0.2162989, 0.009214764, 2.903534, 1, 1, 1, 1, 1,
0.2195074, -1.667262, 4.78521, 1, 1, 1, 1, 1,
0.2207519, 0.6646025, 0.9858983, 1, 1, 1, 1, 1,
0.2238784, -0.3239745, 2.128683, 1, 1, 1, 1, 1,
0.2239178, -0.4039856, 3.289979, 1, 1, 1, 1, 1,
0.2287261, -1.228916, 3.113695, 1, 1, 1, 1, 1,
0.2336357, 1.585932, -1.22444, 1, 1, 1, 1, 1,
0.2398972, -1.499443, 1.884131, 1, 1, 1, 1, 1,
0.2453665, 0.8942116, 0.6776279, 1, 1, 1, 1, 1,
0.247044, 2.492738, -0.0137673, 1, 1, 1, 1, 1,
0.2475208, -1.758774, 3.184419, 1, 1, 1, 1, 1,
0.25374, 0.8936711, 0.6631592, 1, 1, 1, 1, 1,
0.2541581, -0.9398243, 3.522222, 0, 0, 1, 1, 1,
0.2554896, 0.5906231, 0.09560575, 1, 0, 0, 1, 1,
0.2558432, 0.07320016, 1.520061, 1, 0, 0, 1, 1,
0.260259, -0.1771691, 2.710052, 1, 0, 0, 1, 1,
0.2603146, -0.8006182, 3.26318, 1, 0, 0, 1, 1,
0.2603969, -1.168865, 1.955895, 1, 0, 0, 1, 1,
0.2627205, 0.6208178, 0.2743712, 0, 0, 0, 1, 1,
0.2665798, 0.00351586, 0.8580339, 0, 0, 0, 1, 1,
0.2668165, -0.2716096, 2.715233, 0, 0, 0, 1, 1,
0.2670685, -1.516206, 3.597832, 0, 0, 0, 1, 1,
0.2683817, -0.2514674, 2.485817, 0, 0, 0, 1, 1,
0.269168, -0.06602492, 0.4777114, 0, 0, 0, 1, 1,
0.2703697, -0.7824332, 3.810137, 0, 0, 0, 1, 1,
0.2712396, 1.620622, 0.01048279, 1, 1, 1, 1, 1,
0.2777766, 0.922213, -1.525977, 1, 1, 1, 1, 1,
0.277868, 0.2349994, 0.5119576, 1, 1, 1, 1, 1,
0.2806437, 0.1796558, 0.706057, 1, 1, 1, 1, 1,
0.2865585, 0.1360168, 1.853881, 1, 1, 1, 1, 1,
0.2919876, 0.4476185, 0.5913513, 1, 1, 1, 1, 1,
0.2923225, 0.2195853, 1.48602, 1, 1, 1, 1, 1,
0.2960822, -1.025668, 1.428817, 1, 1, 1, 1, 1,
0.2970649, -0.320123, 0.7280765, 1, 1, 1, 1, 1,
0.2976002, 1.042632, 0.5211473, 1, 1, 1, 1, 1,
0.302194, -0.3421616, 2.594415, 1, 1, 1, 1, 1,
0.3031766, -0.6237011, 3.988561, 1, 1, 1, 1, 1,
0.3070882, 1.75734, -1.561545, 1, 1, 1, 1, 1,
0.3109425, 0.1183273, 0.585261, 1, 1, 1, 1, 1,
0.3118594, -0.7070479, 3.353627, 1, 1, 1, 1, 1,
0.3132358, -1.974483, 3.911201, 0, 0, 1, 1, 1,
0.3140991, -0.7100354, 4.209425, 1, 0, 0, 1, 1,
0.316233, 1.439874, -0.3468232, 1, 0, 0, 1, 1,
0.3172355, 0.378044, 1.540097, 1, 0, 0, 1, 1,
0.3181655, -1.693805, 3.345313, 1, 0, 0, 1, 1,
0.3185659, 0.8156746, -0.420368, 1, 0, 0, 1, 1,
0.3189878, -0.3061166, 1.938006, 0, 0, 0, 1, 1,
0.3190725, -1.430073, 2.061716, 0, 0, 0, 1, 1,
0.3238251, -3.20975, 3.729332, 0, 0, 0, 1, 1,
0.3251041, -1.676031, 3.716188, 0, 0, 0, 1, 1,
0.3276638, 0.07645558, 1.795828, 0, 0, 0, 1, 1,
0.3309854, -0.4838882, 3.028296, 0, 0, 0, 1, 1,
0.3311289, -1.110095, 2.122202, 0, 0, 0, 1, 1,
0.333472, 1.725087, -0.0949, 1, 1, 1, 1, 1,
0.333994, -0.4161385, 2.863683, 1, 1, 1, 1, 1,
0.3355457, -1.186356, 2.916527, 1, 1, 1, 1, 1,
0.3370432, -0.4850641, 1.772212, 1, 1, 1, 1, 1,
0.3401487, -2.011389, 3.248186, 1, 1, 1, 1, 1,
0.3438793, -0.4531758, 2.364888, 1, 1, 1, 1, 1,
0.345894, -0.1935546, 3.343282, 1, 1, 1, 1, 1,
0.3497486, 0.3377514, 3.029703, 1, 1, 1, 1, 1,
0.3503878, -0.2742512, 2.794533, 1, 1, 1, 1, 1,
0.3587761, -0.5899236, 3.778621, 1, 1, 1, 1, 1,
0.3636555, 0.1280776, 1.48757, 1, 1, 1, 1, 1,
0.3640191, 0.1097405, 0.592851, 1, 1, 1, 1, 1,
0.3658938, -0.2686668, 2.665804, 1, 1, 1, 1, 1,
0.3684259, -0.3243669, 2.842778, 1, 1, 1, 1, 1,
0.3708828, -0.3805554, 1.758961, 1, 1, 1, 1, 1,
0.3710353, 1.041239, 0.2176557, 0, 0, 1, 1, 1,
0.371236, 0.4930885, 0.6887703, 1, 0, 0, 1, 1,
0.3722707, -0.78615, 2.576922, 1, 0, 0, 1, 1,
0.3733333, -0.7576728, 2.948007, 1, 0, 0, 1, 1,
0.3744562, 0.548514, -0.5312086, 1, 0, 0, 1, 1,
0.37552, 2.051961, 0.2820854, 1, 0, 0, 1, 1,
0.384335, -0.1313842, 2.08959, 0, 0, 0, 1, 1,
0.3895243, -2.063827, 2.294609, 0, 0, 0, 1, 1,
0.3953992, -0.6583941, 1.903136, 0, 0, 0, 1, 1,
0.3966813, 0.9682718, 0.3036429, 0, 0, 0, 1, 1,
0.4016014, -0.8820776, 2.645168, 0, 0, 0, 1, 1,
0.4046568, -0.3556291, 0.5223913, 0, 0, 0, 1, 1,
0.4084724, -1.892898, 2.483586, 0, 0, 0, 1, 1,
0.4086519, 0.2016766, 0.973444, 1, 1, 1, 1, 1,
0.4104829, 0.9083738, 1.399807, 1, 1, 1, 1, 1,
0.4167064, 2.206096, 1.236076, 1, 1, 1, 1, 1,
0.417861, 0.02859937, 2.209607, 1, 1, 1, 1, 1,
0.4215117, 0.5331379, -0.02426274, 1, 1, 1, 1, 1,
0.4259113, 0.8649445, 2.40024, 1, 1, 1, 1, 1,
0.42777, -1.730968, 2.391763, 1, 1, 1, 1, 1,
0.4282179, -0.09341174, 1.325479, 1, 1, 1, 1, 1,
0.4293847, -1.367577, 2.588175, 1, 1, 1, 1, 1,
0.4354772, 1.233092, 0.5067198, 1, 1, 1, 1, 1,
0.4362727, -0.2368283, 2.582627, 1, 1, 1, 1, 1,
0.4364406, 0.09324835, 0.3186131, 1, 1, 1, 1, 1,
0.4370182, -0.4814301, 0.03287049, 1, 1, 1, 1, 1,
0.4381698, 0.1998997, 1.713471, 1, 1, 1, 1, 1,
0.4397238, -0.4571768, 0.8325216, 1, 1, 1, 1, 1,
0.4424182, 0.2300605, 1.144834, 0, 0, 1, 1, 1,
0.44304, 0.4127981, 0.5177546, 1, 0, 0, 1, 1,
0.4471813, -0.5973653, 2.763773, 1, 0, 0, 1, 1,
0.4478084, -0.4086688, 1.343164, 1, 0, 0, 1, 1,
0.4486985, 0.4612529, 0.2642087, 1, 0, 0, 1, 1,
0.4548178, 0.4014938, 1.813534, 1, 0, 0, 1, 1,
0.4590349, 0.5336142, 1.055582, 0, 0, 0, 1, 1,
0.4656028, 0.1041757, 0.6668621, 0, 0, 0, 1, 1,
0.4658338, -1.019138, 3.244556, 0, 0, 0, 1, 1,
0.4791677, 0.8451733, 0.8081537, 0, 0, 0, 1, 1,
0.4807345, -0.3077389, 2.547589, 0, 0, 0, 1, 1,
0.4822223, -1.969727, 3.577689, 0, 0, 0, 1, 1,
0.4862462, -1.006875, 4.234056, 0, 0, 0, 1, 1,
0.4870766, -0.4999215, 2.503562, 1, 1, 1, 1, 1,
0.4879238, -0.5232866, 0.6952286, 1, 1, 1, 1, 1,
0.4887834, 0.08043187, 0.7134328, 1, 1, 1, 1, 1,
0.4888595, 0.8591156, 0.9699192, 1, 1, 1, 1, 1,
0.4945179, -0.8440982, 3.096107, 1, 1, 1, 1, 1,
0.4946798, 0.2155047, 2.497331, 1, 1, 1, 1, 1,
0.4986202, 0.6087017, -0.438198, 1, 1, 1, 1, 1,
0.50662, -0.4592138, 3.752903, 1, 1, 1, 1, 1,
0.5114905, 0.449487, 1.018495, 1, 1, 1, 1, 1,
0.511685, 0.3916099, 1.834094, 1, 1, 1, 1, 1,
0.512363, -0.5820415, 2.566625, 1, 1, 1, 1, 1,
0.5141264, 0.1168106, 1.556471, 1, 1, 1, 1, 1,
0.5163851, 0.2589476, 0.6226615, 1, 1, 1, 1, 1,
0.5180956, 0.09387852, -0.9994708, 1, 1, 1, 1, 1,
0.5186818, -1.853991, 2.789971, 1, 1, 1, 1, 1,
0.519945, 1.392529, -1.433571, 0, 0, 1, 1, 1,
0.5224433, 0.7651201, 0.3711034, 1, 0, 0, 1, 1,
0.5231885, 0.6025752, -0.3558627, 1, 0, 0, 1, 1,
0.5271382, 0.04332545, 1.342132, 1, 0, 0, 1, 1,
0.5300072, 0.2214975, 0.5283526, 1, 0, 0, 1, 1,
0.5354289, 2.322338, 1.160399, 1, 0, 0, 1, 1,
0.5365365, 0.6096648, 1.032618, 0, 0, 0, 1, 1,
0.5432163, -1.161988, 1.256195, 0, 0, 0, 1, 1,
0.5459266, 0.2987435, 1.291599, 0, 0, 0, 1, 1,
0.5476521, -0.6615824, 4.541223, 0, 0, 0, 1, 1,
0.5566701, -1.054659, 2.321553, 0, 0, 0, 1, 1,
0.5577236, 1.268969, 2.709105, 0, 0, 0, 1, 1,
0.5586811, -0.8262751, 2.743393, 0, 0, 0, 1, 1,
0.5594395, 0.1936954, 1.261444, 1, 1, 1, 1, 1,
0.572588, -1.146871, 1.918718, 1, 1, 1, 1, 1,
0.5743619, 1.859785, 0.7915775, 1, 1, 1, 1, 1,
0.5746839, -0.4934575, 1.716091, 1, 1, 1, 1, 1,
0.5776554, 0.2931558, 1.147435, 1, 1, 1, 1, 1,
0.5798144, 0.6604318, -0.8276861, 1, 1, 1, 1, 1,
0.5829342, 1.334291, -0.6677782, 1, 1, 1, 1, 1,
0.5847529, 0.4551834, 0.3756091, 1, 1, 1, 1, 1,
0.5877131, -0.5149702, 1.499976, 1, 1, 1, 1, 1,
0.5889999, -0.7191225, 2.350742, 1, 1, 1, 1, 1,
0.5919036, 0.658605, -0.7090096, 1, 1, 1, 1, 1,
0.5985447, -0.2737942, 3.053658, 1, 1, 1, 1, 1,
0.5992123, -0.4216011, 2.448364, 1, 1, 1, 1, 1,
0.6035957, -0.5356557, 0.9570855, 1, 1, 1, 1, 1,
0.6078656, 0.1088183, -0.1805165, 1, 1, 1, 1, 1,
0.6099415, -0.2336554, 2.667299, 0, 0, 1, 1, 1,
0.6201266, -0.02302384, 0.744328, 1, 0, 0, 1, 1,
0.6217701, 0.3437854, 1.214355, 1, 0, 0, 1, 1,
0.6281256, 1.727504, 0.1526647, 1, 0, 0, 1, 1,
0.6288223, 1.162557, 0.698328, 1, 0, 0, 1, 1,
0.6317775, 0.3611832, -0.6329416, 1, 0, 0, 1, 1,
0.6342346, -0.4152195, 3.853977, 0, 0, 0, 1, 1,
0.6395036, 0.9341819, 2.720129, 0, 0, 0, 1, 1,
0.6418691, -1.190952, 2.971071, 0, 0, 0, 1, 1,
0.6420118, -1.093415, 2.709005, 0, 0, 0, 1, 1,
0.6431642, -0.3421515, 2.002752, 0, 0, 0, 1, 1,
0.6431826, 0.1670812, 0.6431242, 0, 0, 0, 1, 1,
0.64439, 1.067624, 0.3397231, 0, 0, 0, 1, 1,
0.6558678, -0.5966172, 0.4721147, 1, 1, 1, 1, 1,
0.657656, -1.265639, 2.939624, 1, 1, 1, 1, 1,
0.6581023, 2.853361, 0.7068375, 1, 1, 1, 1, 1,
0.6585616, 0.5642254, -0.771363, 1, 1, 1, 1, 1,
0.6630685, 1.087151, -0.04342771, 1, 1, 1, 1, 1,
0.6650842, 0.01173488, 1.49163, 1, 1, 1, 1, 1,
0.6661579, 1.234998, 1.959045, 1, 1, 1, 1, 1,
0.6676114, -1.845129, 4.080521, 1, 1, 1, 1, 1,
0.6725111, -1.060455, 1.374062, 1, 1, 1, 1, 1,
0.6725309, -0.1988728, 1.562698, 1, 1, 1, 1, 1,
0.6755449, -0.9202605, 3.43838, 1, 1, 1, 1, 1,
0.6777242, -1.188493, 2.048785, 1, 1, 1, 1, 1,
0.678539, 1.982355, 0.7639136, 1, 1, 1, 1, 1,
0.6825069, 0.403631, 1.189221, 1, 1, 1, 1, 1,
0.688438, 1.014769, 2.060787, 1, 1, 1, 1, 1,
0.6915417, 0.2397447, 2.085691, 0, 0, 1, 1, 1,
0.692754, 0.845311, 0.6570531, 1, 0, 0, 1, 1,
0.6976141, 0.0814316, 1.001553, 1, 0, 0, 1, 1,
0.709331, 1.056392, -0.7008767, 1, 0, 0, 1, 1,
0.7105436, -1.284718, 3.424092, 1, 0, 0, 1, 1,
0.7132847, -0.07578546, -0.6792299, 1, 0, 0, 1, 1,
0.7195563, 0.802762, 1.575957, 0, 0, 0, 1, 1,
0.7244466, -0.09806613, 1.581314, 0, 0, 0, 1, 1,
0.739818, 0.335358, 0.4888335, 0, 0, 0, 1, 1,
0.7419582, 1.017464, 1.781755, 0, 0, 0, 1, 1,
0.7447899, 0.2731066, 1.463707, 0, 0, 0, 1, 1,
0.7532825, 0.4043739, -0.2335598, 0, 0, 0, 1, 1,
0.7539223, 0.9832743, 1.674605, 0, 0, 0, 1, 1,
0.7543184, -1.066148, 1.931858, 1, 1, 1, 1, 1,
0.7558715, -0.427143, 3.373096, 1, 1, 1, 1, 1,
0.7562991, -0.998152, 1.775239, 1, 1, 1, 1, 1,
0.7570125, 0.1097469, 3.229563, 1, 1, 1, 1, 1,
0.7580662, -1.110322, 1.663437, 1, 1, 1, 1, 1,
0.7594308, -0.8768489, 2.26412, 1, 1, 1, 1, 1,
0.7623021, 0.03709849, 0.1627082, 1, 1, 1, 1, 1,
0.7646617, -1.320297, 1.885763, 1, 1, 1, 1, 1,
0.7653425, 0.9305839, 1.842247, 1, 1, 1, 1, 1,
0.7673993, 0.4869205, 0.09858825, 1, 1, 1, 1, 1,
0.7724662, -0.8943026, 2.24943, 1, 1, 1, 1, 1,
0.7732476, 0.2258048, 0.9461005, 1, 1, 1, 1, 1,
0.7745839, -2.46068, 3.219283, 1, 1, 1, 1, 1,
0.7829264, 1.709946, -1.048473, 1, 1, 1, 1, 1,
0.7838122, -0.5404095, 3.357024, 1, 1, 1, 1, 1,
0.7860937, 1.323152, 0.2036415, 0, 0, 1, 1, 1,
0.7923908, 0.478624, 0.8945567, 1, 0, 0, 1, 1,
0.7975395, -0.5682047, 1.689505, 1, 0, 0, 1, 1,
0.802194, 1.082081, 3.057624, 1, 0, 0, 1, 1,
0.8080189, 0.330279, 1.002812, 1, 0, 0, 1, 1,
0.810979, -0.5614337, 1.404559, 1, 0, 0, 1, 1,
0.8128765, -0.5591459, 0.6887556, 0, 0, 0, 1, 1,
0.8138195, 0.4878266, 1.780927, 0, 0, 0, 1, 1,
0.8161555, 1.325968, 0.5658725, 0, 0, 0, 1, 1,
0.8169522, -0.8622828, 2.448669, 0, 0, 0, 1, 1,
0.8172813, 1.65281, -0.2498815, 0, 0, 0, 1, 1,
0.8200126, -0.009574964, 1.879369, 0, 0, 0, 1, 1,
0.8366441, -0.4552226, 1.056259, 0, 0, 0, 1, 1,
0.8433471, 1.328473, -0.5643706, 1, 1, 1, 1, 1,
0.8441353, -0.1243448, 1.269858, 1, 1, 1, 1, 1,
0.8526377, 1.48777, -0.5108475, 1, 1, 1, 1, 1,
0.8553721, 1.761203, -1.516106, 1, 1, 1, 1, 1,
0.8644595, -1.260971, 2.468907, 1, 1, 1, 1, 1,
0.8664414, 1.377714, 0.8127471, 1, 1, 1, 1, 1,
0.8708083, 0.1725243, 2.350228, 1, 1, 1, 1, 1,
0.876224, 1.033899, 0.9754378, 1, 1, 1, 1, 1,
0.8812158, -0.2546985, 1.190011, 1, 1, 1, 1, 1,
0.8822324, 1.651939, -0.7192488, 1, 1, 1, 1, 1,
0.883634, 0.7613767, 1.120726, 1, 1, 1, 1, 1,
0.8855671, 0.3982689, -0.4744573, 1, 1, 1, 1, 1,
0.8925623, -0.9865905, 2.932809, 1, 1, 1, 1, 1,
0.9058338, 0.7694262, 1.972537, 1, 1, 1, 1, 1,
0.9070372, -0.1737288, 2.533823, 1, 1, 1, 1, 1,
0.909496, 0.9277505, 0.5188147, 0, 0, 1, 1, 1,
0.9113963, -0.3019651, 0.7491574, 1, 0, 0, 1, 1,
0.9114113, -1.577058, 1.857013, 1, 0, 0, 1, 1,
0.9142748, 0.5662501, -0.2109813, 1, 0, 0, 1, 1,
0.9245234, 0.3671284, 1.04166, 1, 0, 0, 1, 1,
0.9254858, -0.2196995, 2.485557, 1, 0, 0, 1, 1,
0.9427617, 2.932054, 2.064685, 0, 0, 0, 1, 1,
0.9461302, -0.7598, 0.6088926, 0, 0, 0, 1, 1,
0.946674, 1.512121, 0.3884392, 0, 0, 0, 1, 1,
0.9537969, -0.6343657, 1.578798, 0, 0, 0, 1, 1,
0.9545854, 0.9568851, -1.567007, 0, 0, 0, 1, 1,
0.9582688, 0.6946068, -0.05110336, 0, 0, 0, 1, 1,
0.9648946, -1.634279, 1.887017, 0, 0, 0, 1, 1,
0.965023, -0.2933983, 0.8525162, 1, 1, 1, 1, 1,
0.9692546, -1.016076, 2.239439, 1, 1, 1, 1, 1,
0.9769184, -0.5168374, 2.708026, 1, 1, 1, 1, 1,
0.9779064, 0.04797693, 1.117915, 1, 1, 1, 1, 1,
0.9826272, -0.1880396, 2.993799, 1, 1, 1, 1, 1,
0.9864848, -2.101243, 3.492347, 1, 1, 1, 1, 1,
0.9904823, 0.8487947, 1.154038, 1, 1, 1, 1, 1,
0.9989259, 1.193629, 2.264416, 1, 1, 1, 1, 1,
1.002675, -1.294684, 1.335321, 1, 1, 1, 1, 1,
1.005037, -0.7150889, 2.5037, 1, 1, 1, 1, 1,
1.007312, 0.2825894, 1.461008, 1, 1, 1, 1, 1,
1.02338, -2.549343, 3.679785, 1, 1, 1, 1, 1,
1.023492, 0.4661341, 0.5879572, 1, 1, 1, 1, 1,
1.027057, -2.087477, 2.522165, 1, 1, 1, 1, 1,
1.027853, -1.645421, 2.052472, 1, 1, 1, 1, 1,
1.031556, -0.02138395, 1.417755, 0, 0, 1, 1, 1,
1.039825, -0.9265434, 2.615386, 1, 0, 0, 1, 1,
1.045401, -0.8916758, 2.090789, 1, 0, 0, 1, 1,
1.045588, 0.140288, 0.9136203, 1, 0, 0, 1, 1,
1.049335, 1.712398, 2.529571, 1, 0, 0, 1, 1,
1.057375, -0.5804881, 3.106773, 1, 0, 0, 1, 1,
1.059901, 0.5269299, -0.2145686, 0, 0, 0, 1, 1,
1.064582, 1.739019, 0.582965, 0, 0, 0, 1, 1,
1.068538, -0.4585362, 1.338741, 0, 0, 0, 1, 1,
1.069072, -2.173925, 3.130689, 0, 0, 0, 1, 1,
1.073712, -0.5746571, 1.380287, 0, 0, 0, 1, 1,
1.080908, 0.6079375, 2.350589, 0, 0, 0, 1, 1,
1.082912, -1.293227, 3.145875, 0, 0, 0, 1, 1,
1.097219, -0.07005432, 2.721395, 1, 1, 1, 1, 1,
1.099391, 0.0688656, 1.996063, 1, 1, 1, 1, 1,
1.101049, -1.391154, 1.626434, 1, 1, 1, 1, 1,
1.103753, 0.3633684, 1.921441, 1, 1, 1, 1, 1,
1.105701, -0.573736, 1.57299, 1, 1, 1, 1, 1,
1.107832, -0.2053976, 0.4290755, 1, 1, 1, 1, 1,
1.117937, -1.862049, 3.239454, 1, 1, 1, 1, 1,
1.118969, 2.074897, -1.188085, 1, 1, 1, 1, 1,
1.122097, -0.2143186, 2.790899, 1, 1, 1, 1, 1,
1.132317, -1.9971, 2.653203, 1, 1, 1, 1, 1,
1.142009, -1.735851, 3.047328, 1, 1, 1, 1, 1,
1.151382, 0.2713656, 2.023905, 1, 1, 1, 1, 1,
1.159156, 0.3507564, 1.05305, 1, 1, 1, 1, 1,
1.167866, -1.157954, 2.554961, 1, 1, 1, 1, 1,
1.168906, 0.2143742, 1.169692, 1, 1, 1, 1, 1,
1.171216, -1.546106, 4.392355, 0, 0, 1, 1, 1,
1.171587, 0.8231015, 1.441002, 1, 0, 0, 1, 1,
1.180052, -0.1730929, 1.211179, 1, 0, 0, 1, 1,
1.186121, 0.3612537, 1.267497, 1, 0, 0, 1, 1,
1.193303, 0.7642033, -0.204493, 1, 0, 0, 1, 1,
1.20418, -2.122058, 3.300493, 1, 0, 0, 1, 1,
1.204835, 2.381945, -1.168397, 0, 0, 0, 1, 1,
1.212049, 0.4832623, 1.819594, 0, 0, 0, 1, 1,
1.213869, 0.2880165, 1.498958, 0, 0, 0, 1, 1,
1.215964, 0.5673856, 1.64385, 0, 0, 0, 1, 1,
1.218129, -0.5486296, 2.269953, 0, 0, 0, 1, 1,
1.234764, -0.2473169, 1.645255, 0, 0, 0, 1, 1,
1.248377, 1.357334, 1.034799, 0, 0, 0, 1, 1,
1.252797, 0.3389809, -0.1370917, 1, 1, 1, 1, 1,
1.256072, 0.4788649, 1.466503, 1, 1, 1, 1, 1,
1.264364, 0.782838, -0.7026498, 1, 1, 1, 1, 1,
1.267532, 1.600642, 0.5080751, 1, 1, 1, 1, 1,
1.273699, 0.05180627, -0.1076823, 1, 1, 1, 1, 1,
1.29169, 0.5429498, 1.641488, 1, 1, 1, 1, 1,
1.306609, 0.02093294, 1.199345, 1, 1, 1, 1, 1,
1.312684, -0.8056339, 2.161106, 1, 1, 1, 1, 1,
1.316309, -0.7786278, 2.631222, 1, 1, 1, 1, 1,
1.325021, -0.1078437, 1.218277, 1, 1, 1, 1, 1,
1.325377, -1.180551, 3.142706, 1, 1, 1, 1, 1,
1.331147, -0.2961439, 2.367942, 1, 1, 1, 1, 1,
1.358836, 2.726785, 0.2868792, 1, 1, 1, 1, 1,
1.367337, -0.788729, 0.9329839, 1, 1, 1, 1, 1,
1.371511, -1.351991, 3.897794, 1, 1, 1, 1, 1,
1.380247, 0.2706913, 1.178707, 0, 0, 1, 1, 1,
1.383323, 0.6864806, 1.249903, 1, 0, 0, 1, 1,
1.392153, -0.1825589, 2.360512, 1, 0, 0, 1, 1,
1.408545, -1.790674, 0.4843356, 1, 0, 0, 1, 1,
1.42179, -0.6963837, 2.143661, 1, 0, 0, 1, 1,
1.442504, -1.544607, 3.443162, 1, 0, 0, 1, 1,
1.446377, 0.07777689, 0.809878, 0, 0, 0, 1, 1,
1.448222, -1.698508, 2.51644, 0, 0, 0, 1, 1,
1.451228, -1.188502, 2.844933, 0, 0, 0, 1, 1,
1.452802, -0.7712543, 2.04555, 0, 0, 0, 1, 1,
1.465115, 0.432202, 0.8348406, 0, 0, 0, 1, 1,
1.479439, 0.3355196, 0.3822348, 0, 0, 0, 1, 1,
1.481372, 1.411424, 0.7174597, 0, 0, 0, 1, 1,
1.490394, -0.2918733, 0.08609378, 1, 1, 1, 1, 1,
1.498334, -0.1071243, 3.024631, 1, 1, 1, 1, 1,
1.514517, -0.2342821, 2.044096, 1, 1, 1, 1, 1,
1.545055, -1.53852, 2.018796, 1, 1, 1, 1, 1,
1.5514, 0.5663657, 1.224007, 1, 1, 1, 1, 1,
1.552806, 0.2797845, 2.084126, 1, 1, 1, 1, 1,
1.575957, 1.2305, 3.601743, 1, 1, 1, 1, 1,
1.587352, -1.423857, 1.626906, 1, 1, 1, 1, 1,
1.588974, -0.08529498, 0.6173145, 1, 1, 1, 1, 1,
1.597104, 1.015726, 0.772734, 1, 1, 1, 1, 1,
1.606209, -0.4427599, 0.4061607, 1, 1, 1, 1, 1,
1.608489, -0.4045037, 0.7613198, 1, 1, 1, 1, 1,
1.609283, 1.221946, 0.1726865, 1, 1, 1, 1, 1,
1.610065, -1.052702, 1.690599, 1, 1, 1, 1, 1,
1.615618, -0.7952933, 0.6647443, 1, 1, 1, 1, 1,
1.616433, 0.5612141, 1.92043, 0, 0, 1, 1, 1,
1.641515, -1.190031, 3.876464, 1, 0, 0, 1, 1,
1.64301, 0.5751253, 1.141881, 1, 0, 0, 1, 1,
1.665334, -0.01693824, 1.134333, 1, 0, 0, 1, 1,
1.668053, -0.3617533, 2.737187, 1, 0, 0, 1, 1,
1.682016, 1.633584, 1.456611, 1, 0, 0, 1, 1,
1.692203, -0.008516594, -0.1003766, 0, 0, 0, 1, 1,
1.700973, -1.072603, 0.8828437, 0, 0, 0, 1, 1,
1.748513, 0.7766331, 1.312217, 0, 0, 0, 1, 1,
1.774687, -0.8120154, 2.612477, 0, 0, 0, 1, 1,
1.77932, -1.028043, 2.447022, 0, 0, 0, 1, 1,
1.793464, -0.4754265, 1.36694, 0, 0, 0, 1, 1,
1.801466, 1.375598, 0.8606609, 0, 0, 0, 1, 1,
1.821315, -0.1093017, 2.745879, 1, 1, 1, 1, 1,
1.825639, 0.7613336, -0.5949389, 1, 1, 1, 1, 1,
1.832977, 0.7977504, 0.3950285, 1, 1, 1, 1, 1,
1.849921, 1.245943, 1.837061, 1, 1, 1, 1, 1,
1.852402, -0.2195693, 1.074967, 1, 1, 1, 1, 1,
1.867017, -0.5686073, 1.26467, 1, 1, 1, 1, 1,
1.871526, -1.217259, 1.762865, 1, 1, 1, 1, 1,
1.889951, 0.8469024, 0.4426451, 1, 1, 1, 1, 1,
1.895184, -1.085451, 2.52126, 1, 1, 1, 1, 1,
1.923504, -0.4898195, 2.971984, 1, 1, 1, 1, 1,
1.926014, 0.1026401, 0.7986847, 1, 1, 1, 1, 1,
1.936942, -0.02642019, 1.828254, 1, 1, 1, 1, 1,
1.973889, 0.6528799, -0.01449301, 1, 1, 1, 1, 1,
1.986426, -0.2031844, 1.987099, 1, 1, 1, 1, 1,
1.990662, 0.3283336, -0.3209218, 1, 1, 1, 1, 1,
2.009403, 1.267935, 0.0002887717, 0, 0, 1, 1, 1,
2.06621, 0.7648423, 2.3801, 1, 0, 0, 1, 1,
2.07672, 1.570835, -0.06796383, 1, 0, 0, 1, 1,
2.127461, -1.745756, 1.928774, 1, 0, 0, 1, 1,
2.147773, -0.7170525, 0.8612297, 1, 0, 0, 1, 1,
2.191056, 0.2493777, 1.459611, 1, 0, 0, 1, 1,
2.191393, 0.6941573, 3.032373, 0, 0, 0, 1, 1,
2.205006, 0.9021271, 1.514919, 0, 0, 0, 1, 1,
2.243929, 2.119637, 1.491094, 0, 0, 0, 1, 1,
2.260495, 0.7804094, 1.61746, 0, 0, 0, 1, 1,
2.323787, -0.6600082, 1.491987, 0, 0, 0, 1, 1,
2.365963, -1.209161, 1.729963, 0, 0, 0, 1, 1,
2.38792, 0.2567113, 1.769637, 0, 0, 0, 1, 1,
2.454911, -0.8752587, 0.1010333, 1, 1, 1, 1, 1,
2.572366, 0.5283171, 0.7308057, 1, 1, 1, 1, 1,
2.630774, -1.290192, 3.599137, 1, 1, 1, 1, 1,
2.680513, -0.9733152, 2.014806, 1, 1, 1, 1, 1,
2.722863, 0.02773138, 1.794071, 1, 1, 1, 1, 1,
2.952386, -0.4979505, 2.267724, 1, 1, 1, 1, 1,
2.977301, 0.2906527, 0.6077165, 1, 1, 1, 1, 1
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
var radius = 9.313059;
var distance = 32.71172;
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
mvMatrix.translate( -0.2745296, 0.002613068, 0.2551649 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.71172);
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
