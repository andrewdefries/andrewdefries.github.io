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
-3.412308, -0.02766141, -0.0009217039, 1, 0, 0, 1,
-3.382452, 0.7429448, 1.422283, 1, 0.007843138, 0, 1,
-3.130268, -0.6924032, -1.042448, 1, 0.01176471, 0, 1,
-3.054834, -0.3685735, -1.097007, 1, 0.01960784, 0, 1,
-2.77443, 1.655651, -0.3189396, 1, 0.02352941, 0, 1,
-2.749091, -0.8520409, -0.2438494, 1, 0.03137255, 0, 1,
-2.705396, -0.4751038, -2.574158, 1, 0.03529412, 0, 1,
-2.614749, 0.4869801, -1.46577, 1, 0.04313726, 0, 1,
-2.603648, -0.7754175, -1.060827, 1, 0.04705882, 0, 1,
-2.590003, 0.2157125, -1.110098, 1, 0.05490196, 0, 1,
-2.544914, -1.634137, -2.216864, 1, 0.05882353, 0, 1,
-2.499698, -0.1214614, -1.092674, 1, 0.06666667, 0, 1,
-2.41533, -0.8830312, -1.870211, 1, 0.07058824, 0, 1,
-2.370427, -0.9838529, -1.975265, 1, 0.07843138, 0, 1,
-2.351071, -0.5831852, -1.738997, 1, 0.08235294, 0, 1,
-2.349913, 1.127452, -1.719155, 1, 0.09019608, 0, 1,
-2.277806, 0.679367, -1.884568, 1, 0.09411765, 0, 1,
-2.26981, -0.7443941, -0.4210207, 1, 0.1019608, 0, 1,
-2.241235, -0.009442793, -1.846302, 1, 0.1098039, 0, 1,
-2.236969, 0.05210036, -0.4198378, 1, 0.1137255, 0, 1,
-2.208227, 1.163615, 0.6721948, 1, 0.1215686, 0, 1,
-2.202006, 0.714949, -1.87739, 1, 0.1254902, 0, 1,
-2.185078, -0.2890758, -2.744075, 1, 0.1333333, 0, 1,
-2.119533, 1.202194, -0.9738188, 1, 0.1372549, 0, 1,
-2.108733, -0.5451013, -0.8462031, 1, 0.145098, 0, 1,
-2.100277, -1.633611, -2.271454, 1, 0.1490196, 0, 1,
-2.07577, -1.132394, -1.39924, 1, 0.1568628, 0, 1,
-2.073874, -0.1750881, -1.984374, 1, 0.1607843, 0, 1,
-2.065891, -1.028485, -0.7827882, 1, 0.1686275, 0, 1,
-2.027892, -0.7040762, -1.348655, 1, 0.172549, 0, 1,
-2.007419, -0.406794, -1.933025, 1, 0.1803922, 0, 1,
-1.985973, 0.6301581, -3.400963, 1, 0.1843137, 0, 1,
-1.979096, 0.07080182, -0.08319168, 1, 0.1921569, 0, 1,
-1.967725, -0.5218828, -1.225501, 1, 0.1960784, 0, 1,
-1.941929, -0.549875, -2.3239, 1, 0.2039216, 0, 1,
-1.929501, 0.002173838, -1.591207, 1, 0.2117647, 0, 1,
-1.927529, 0.2847212, -0.6416929, 1, 0.2156863, 0, 1,
-1.919683, 0.8324896, -2.066815, 1, 0.2235294, 0, 1,
-1.912997, 0.9436392, -0.8048632, 1, 0.227451, 0, 1,
-1.894929, 1.638821, 0.9254395, 1, 0.2352941, 0, 1,
-1.891693, -2.658514, -2.197607, 1, 0.2392157, 0, 1,
-1.879767, 0.0483577, -0.7062179, 1, 0.2470588, 0, 1,
-1.858229, -2.463287, -3.165465, 1, 0.2509804, 0, 1,
-1.846513, -0.9890462, -2.340845, 1, 0.2588235, 0, 1,
-1.83723, -0.4616349, -4.182583, 1, 0.2627451, 0, 1,
-1.781714, -1.782851, -1.756414, 1, 0.2705882, 0, 1,
-1.770927, -0.04846749, -1.754528, 1, 0.2745098, 0, 1,
-1.761262, -0.5266436, -1.189981, 1, 0.282353, 0, 1,
-1.760291, 0.1914299, -0.4633096, 1, 0.2862745, 0, 1,
-1.717777, -1.148826, -1.484141, 1, 0.2941177, 0, 1,
-1.715423, -0.673641, -2.636947, 1, 0.3019608, 0, 1,
-1.667986, 2.070129, -0.06695336, 1, 0.3058824, 0, 1,
-1.655851, 0.7301409, -1.232169, 1, 0.3137255, 0, 1,
-1.616704, -0.7234921, -2.42643, 1, 0.3176471, 0, 1,
-1.616352, -1.478045, -2.885767, 1, 0.3254902, 0, 1,
-1.596753, -1.836717, -2.528691, 1, 0.3294118, 0, 1,
-1.586257, -1.055988, -3.406817, 1, 0.3372549, 0, 1,
-1.578275, -1.847343, -2.529345, 1, 0.3411765, 0, 1,
-1.555598, 2.738709, -0.478015, 1, 0.3490196, 0, 1,
-1.555339, 0.5344383, -1.98814, 1, 0.3529412, 0, 1,
-1.540146, -0.4884022, -1.717031, 1, 0.3607843, 0, 1,
-1.533388, 0.1402741, -1.921197, 1, 0.3647059, 0, 1,
-1.527568, -2.516076, -3.708453, 1, 0.372549, 0, 1,
-1.5213, -0.2605431, -1.263343, 1, 0.3764706, 0, 1,
-1.516405, -1.983015, -3.776313, 1, 0.3843137, 0, 1,
-1.515058, -0.2111929, -1.680752, 1, 0.3882353, 0, 1,
-1.50797, -1.595347, -2.633749, 1, 0.3960784, 0, 1,
-1.502174, -0.9273729, -1.101427, 1, 0.4039216, 0, 1,
-1.500312, -0.163628, -1.09606, 1, 0.4078431, 0, 1,
-1.485951, -0.1955455, -1.002744, 1, 0.4156863, 0, 1,
-1.485535, -1.665003, -2.58732, 1, 0.4196078, 0, 1,
-1.480875, -0.6060917, -2.605754, 1, 0.427451, 0, 1,
-1.476229, -2.089778, -2.172724, 1, 0.4313726, 0, 1,
-1.475086, -0.1399232, -2.446029, 1, 0.4392157, 0, 1,
-1.474011, 1.534397, -1.660368, 1, 0.4431373, 0, 1,
-1.467149, -1.294957, -1.997021, 1, 0.4509804, 0, 1,
-1.463784, -0.252265, -2.838049, 1, 0.454902, 0, 1,
-1.456128, 0.009543273, -1.530803, 1, 0.4627451, 0, 1,
-1.449002, -0.3060775, -2.034923, 1, 0.4666667, 0, 1,
-1.436138, 0.3925889, -3.611578, 1, 0.4745098, 0, 1,
-1.426993, -0.140292, -2.765838, 1, 0.4784314, 0, 1,
-1.423748, -0.3738291, -1.791027, 1, 0.4862745, 0, 1,
-1.40389, -0.1061956, -0.6466345, 1, 0.4901961, 0, 1,
-1.401394, -0.6274669, -2.16261, 1, 0.4980392, 0, 1,
-1.399659, 0.2318988, -1.988921, 1, 0.5058824, 0, 1,
-1.38442, -1.170013, -2.648712, 1, 0.509804, 0, 1,
-1.383417, -0.3713865, -1.538833, 1, 0.5176471, 0, 1,
-1.376106, 0.6887285, -0.1876011, 1, 0.5215687, 0, 1,
-1.369354, 1.053519, 1.340586, 1, 0.5294118, 0, 1,
-1.35882, -0.0512114, -0.5659622, 1, 0.5333334, 0, 1,
-1.356564, 0.2425146, -0.827455, 1, 0.5411765, 0, 1,
-1.354751, -0.3263007, -2.348112, 1, 0.5450981, 0, 1,
-1.336837, -1.502799, -2.162023, 1, 0.5529412, 0, 1,
-1.33559, -1.311893, -2.198006, 1, 0.5568628, 0, 1,
-1.334427, 1.486258, -2.649447, 1, 0.5647059, 0, 1,
-1.322299, -1.3348, -2.023623, 1, 0.5686275, 0, 1,
-1.321291, 2.268104, -1.623063, 1, 0.5764706, 0, 1,
-1.320596, 0.6426402, -0.6203716, 1, 0.5803922, 0, 1,
-1.31962, -0.6030965, -1.811015, 1, 0.5882353, 0, 1,
-1.317456, -0.6147411, -2.010542, 1, 0.5921569, 0, 1,
-1.291783, 0.1899753, -0.7399601, 1, 0.6, 0, 1,
-1.289647, -1.303919, -5.269427, 1, 0.6078432, 0, 1,
-1.287625, -1.96349, -2.545554, 1, 0.6117647, 0, 1,
-1.279622, -1.134523, -2.290183, 1, 0.6196079, 0, 1,
-1.26973, 0.2904605, -1.129135, 1, 0.6235294, 0, 1,
-1.267653, -0.7936358, -1.82559, 1, 0.6313726, 0, 1,
-1.267243, -0.9354159, -2.951749, 1, 0.6352941, 0, 1,
-1.264305, -1.351235, -1.181217, 1, 0.6431373, 0, 1,
-1.258512, 1.068482, -0.3140223, 1, 0.6470588, 0, 1,
-1.258351, 0.9289795, -0.4416513, 1, 0.654902, 0, 1,
-1.25658, -1.027416, -2.931688, 1, 0.6588235, 0, 1,
-1.256009, 2.675877, -0.8451182, 1, 0.6666667, 0, 1,
-1.255744, 0.6980964, -1.473924, 1, 0.6705883, 0, 1,
-1.253365, -1.246245, -2.275617, 1, 0.6784314, 0, 1,
-1.245155, 1.669517, -2.294113, 1, 0.682353, 0, 1,
-1.239653, -0.6914952, -1.6804, 1, 0.6901961, 0, 1,
-1.23426, -1.249701, -2.096562, 1, 0.6941177, 0, 1,
-1.23176, -0.4001196, -1.849415, 1, 0.7019608, 0, 1,
-1.226637, 0.5221941, -2.586973, 1, 0.7098039, 0, 1,
-1.22282, 1.454012, -2.520167, 1, 0.7137255, 0, 1,
-1.220685, -0.3535352, -3.701603, 1, 0.7215686, 0, 1,
-1.217741, -0.1080092, -3.559155, 1, 0.7254902, 0, 1,
-1.21104, -1.228844, -2.351382, 1, 0.7333333, 0, 1,
-1.209603, -3.179386, -3.389715, 1, 0.7372549, 0, 1,
-1.194554, -0.3629208, -2.540124, 1, 0.7450981, 0, 1,
-1.193469, 1.412889, 0.2778375, 1, 0.7490196, 0, 1,
-1.192639, 0.6054577, -0.3101303, 1, 0.7568628, 0, 1,
-1.191985, -0.3017067, -1.523938, 1, 0.7607843, 0, 1,
-1.191347, -0.3047575, 0.2552046, 1, 0.7686275, 0, 1,
-1.184269, -0.7211953, -3.081209, 1, 0.772549, 0, 1,
-1.17458, -0.0202904, -2.086541, 1, 0.7803922, 0, 1,
-1.171945, 1.697854, -2.150739, 1, 0.7843137, 0, 1,
-1.171358, 1.383241, -1.503346, 1, 0.7921569, 0, 1,
-1.162923, -0.9713824, -3.827287, 1, 0.7960784, 0, 1,
-1.16207, 0.1454094, -0.8280876, 1, 0.8039216, 0, 1,
-1.161106, -0.3866052, -1.7358, 1, 0.8117647, 0, 1,
-1.160352, -0.6620395, -1.744919, 1, 0.8156863, 0, 1,
-1.159022, 1.580897, -2.237787, 1, 0.8235294, 0, 1,
-1.157824, -1.209859, -4.067608, 1, 0.827451, 0, 1,
-1.155806, -0.4397767, -1.345898, 1, 0.8352941, 0, 1,
-1.150902, 2.00875, -0.8861894, 1, 0.8392157, 0, 1,
-1.148916, -1.144055, -3.309062, 1, 0.8470588, 0, 1,
-1.147505, 0.8830339, -1.016071, 1, 0.8509804, 0, 1,
-1.141101, 0.7984919, 0.2148377, 1, 0.8588235, 0, 1,
-1.097205, 0.2450114, -1.045692, 1, 0.8627451, 0, 1,
-1.09239, -0.5522961, -1.539778, 1, 0.8705882, 0, 1,
-1.087375, -0.809105, -3.071206, 1, 0.8745098, 0, 1,
-1.087209, -0.7738169, -1.101195, 1, 0.8823529, 0, 1,
-1.080233, 0.2581393, -2.964321, 1, 0.8862745, 0, 1,
-1.063852, 0.09332868, -2.281292, 1, 0.8941177, 0, 1,
-1.06152, 0.04464456, -2.004617, 1, 0.8980392, 0, 1,
-1.053577, 0.3078049, 0.4862864, 1, 0.9058824, 0, 1,
-1.047904, 0.6528893, -1.279023, 1, 0.9137255, 0, 1,
-1.040172, 1.590632, -1.254469, 1, 0.9176471, 0, 1,
-1.039841, -0.1471958, -2.406008, 1, 0.9254902, 0, 1,
-1.035553, 0.4650973, -1.460145, 1, 0.9294118, 0, 1,
-1.035448, -0.8829783, -1.641285, 1, 0.9372549, 0, 1,
-1.022439, 0.2272746, -2.096126, 1, 0.9411765, 0, 1,
-1.01985, -0.4700896, -2.30478, 1, 0.9490196, 0, 1,
-1.015999, 0.9640024, -2.144926, 1, 0.9529412, 0, 1,
-1.008513, -0.3669351, -3.696534, 1, 0.9607843, 0, 1,
-1.007877, 0.3732181, -3.737216, 1, 0.9647059, 0, 1,
-1.007069, 0.306752, -1.416322, 1, 0.972549, 0, 1,
-1.000875, -1.27865, -2.442712, 1, 0.9764706, 0, 1,
-0.9996802, -0.6537684, -3.224782, 1, 0.9843137, 0, 1,
-0.9914536, 0.1513976, -0.3973473, 1, 0.9882353, 0, 1,
-0.9902916, 0.4477269, -0.612858, 1, 0.9960784, 0, 1,
-0.9902831, -1.122186, -1.364756, 0.9960784, 1, 0, 1,
-0.9798934, 0.3405026, -1.995515, 0.9921569, 1, 0, 1,
-0.9607751, 0.3350413, -0.6599342, 0.9843137, 1, 0, 1,
-0.9519742, 0.3700819, -0.8333749, 0.9803922, 1, 0, 1,
-0.9517441, 1.535783, 0.03787422, 0.972549, 1, 0, 1,
-0.9428671, -0.7367292, -2.122854, 0.9686275, 1, 0, 1,
-0.9426935, -1.122521, -2.803088, 0.9607843, 1, 0, 1,
-0.941204, -0.4870077, -0.8862218, 0.9568627, 1, 0, 1,
-0.9334697, -0.1425078, -1.619562, 0.9490196, 1, 0, 1,
-0.9240422, 0.6163377, -0.8422058, 0.945098, 1, 0, 1,
-0.9237163, 1.146066, -0.8513228, 0.9372549, 1, 0, 1,
-0.9199463, -1.116829, -2.945027, 0.9333333, 1, 0, 1,
-0.910094, 0.3536052, -0.6191624, 0.9254902, 1, 0, 1,
-0.9069108, -0.190227, -1.38691, 0.9215686, 1, 0, 1,
-0.9064792, -0.0004520917, -1.644181, 0.9137255, 1, 0, 1,
-0.904802, 0.1077157, -1.089697, 0.9098039, 1, 0, 1,
-0.904408, -1.412454, -2.622967, 0.9019608, 1, 0, 1,
-0.9036419, 1.921753, -0.8446186, 0.8941177, 1, 0, 1,
-0.8991891, 0.9994224, -0.7292916, 0.8901961, 1, 0, 1,
-0.8940818, 0.07088488, -1.8623, 0.8823529, 1, 0, 1,
-0.8936216, -0.7611449, -2.131285, 0.8784314, 1, 0, 1,
-0.8788218, -1.467432, -2.20501, 0.8705882, 1, 0, 1,
-0.8773248, 0.6053193, -0.7484835, 0.8666667, 1, 0, 1,
-0.8736702, 0.6101906, -0.6464116, 0.8588235, 1, 0, 1,
-0.8664218, 0.6697735, -1.580951, 0.854902, 1, 0, 1,
-0.8629089, 0.6911037, -0.2450435, 0.8470588, 1, 0, 1,
-0.8614611, 0.3267797, -1.106339, 0.8431373, 1, 0, 1,
-0.8613436, -2.409037, -2.213641, 0.8352941, 1, 0, 1,
-0.8577892, -1.965825, -2.572736, 0.8313726, 1, 0, 1,
-0.8449948, -0.2396149, -2.495283, 0.8235294, 1, 0, 1,
-0.8425171, 0.079339, -0.3972039, 0.8196079, 1, 0, 1,
-0.8414021, -0.7771365, -3.83062, 0.8117647, 1, 0, 1,
-0.8408206, -1.604023, -1.595124, 0.8078431, 1, 0, 1,
-0.8403416, 1.951988, -1.076669, 0.8, 1, 0, 1,
-0.8393742, 1.782589, 0.2850423, 0.7921569, 1, 0, 1,
-0.8383958, -0.5386848, -1.358217, 0.7882353, 1, 0, 1,
-0.8292426, -0.2395633, -2.429665, 0.7803922, 1, 0, 1,
-0.8274587, -1.456708, -1.50885, 0.7764706, 1, 0, 1,
-0.8263415, -0.5472022, -3.089885, 0.7686275, 1, 0, 1,
-0.8257143, 0.1488649, -3.482895, 0.7647059, 1, 0, 1,
-0.818411, 0.2523908, -1.316906, 0.7568628, 1, 0, 1,
-0.8179266, 0.5953251, -0.2331381, 0.7529412, 1, 0, 1,
-0.8130053, 0.9666924, -2.591987, 0.7450981, 1, 0, 1,
-0.8125152, 0.7709101, -1.627757, 0.7411765, 1, 0, 1,
-0.8115923, -2.346978, -2.137746, 0.7333333, 1, 0, 1,
-0.8084614, -1.036951, -2.953773, 0.7294118, 1, 0, 1,
-0.8079205, 0.4743813, -0.3015895, 0.7215686, 1, 0, 1,
-0.8054147, 0.3168728, -0.8664654, 0.7176471, 1, 0, 1,
-0.8038493, -0.1859456, -3.085289, 0.7098039, 1, 0, 1,
-0.8038486, 2.014629, -0.4734659, 0.7058824, 1, 0, 1,
-0.8035701, -0.7708257, -3.102782, 0.6980392, 1, 0, 1,
-0.8034795, -1.039202, -2.591546, 0.6901961, 1, 0, 1,
-0.8033789, 0.1840815, -3.153942, 0.6862745, 1, 0, 1,
-0.7885752, 1.71414, -0.7718015, 0.6784314, 1, 0, 1,
-0.7859769, -1.454339, -2.114269, 0.6745098, 1, 0, 1,
-0.7857404, 0.1403835, -1.622916, 0.6666667, 1, 0, 1,
-0.7846241, -0.1192275, -1.951537, 0.6627451, 1, 0, 1,
-0.7827982, 0.7750875, -0.8696873, 0.654902, 1, 0, 1,
-0.7776093, -0.4143658, -0.7897102, 0.6509804, 1, 0, 1,
-0.7744652, -1.070097, -2.310184, 0.6431373, 1, 0, 1,
-0.7731421, 0.1867905, -1.253637, 0.6392157, 1, 0, 1,
-0.7705883, -1.690578, -1.517065, 0.6313726, 1, 0, 1,
-0.7660154, -0.3493797, -3.019059, 0.627451, 1, 0, 1,
-0.7619235, -1.2444, -2.96707, 0.6196079, 1, 0, 1,
-0.7601568, 0.3991935, -0.5484592, 0.6156863, 1, 0, 1,
-0.7576811, 0.5869789, -0.2302388, 0.6078432, 1, 0, 1,
-0.7483428, 0.05889552, -0.7439677, 0.6039216, 1, 0, 1,
-0.7477073, -0.3729137, -1.902194, 0.5960785, 1, 0, 1,
-0.7458667, -0.4670377, -1.385451, 0.5882353, 1, 0, 1,
-0.7383044, 0.2639698, -0.9956329, 0.5843138, 1, 0, 1,
-0.7326037, -1.682205, -2.619337, 0.5764706, 1, 0, 1,
-0.7272921, 0.008378563, -0.2001907, 0.572549, 1, 0, 1,
-0.7266452, 0.4203276, -1.799241, 0.5647059, 1, 0, 1,
-0.724751, 1.997201, -1.64177, 0.5607843, 1, 0, 1,
-0.7227071, -0.8719676, -4.773089, 0.5529412, 1, 0, 1,
-0.7158599, 0.6096322, -0.6650642, 0.5490196, 1, 0, 1,
-0.7157357, 0.04330884, -1.819683, 0.5411765, 1, 0, 1,
-0.7146693, 0.8196052, -0.702978, 0.5372549, 1, 0, 1,
-0.7141816, -2.018857, -4.638147, 0.5294118, 1, 0, 1,
-0.7110116, 0.06920919, -0.581748, 0.5254902, 1, 0, 1,
-0.707673, 0.5474411, -1.23104, 0.5176471, 1, 0, 1,
-0.7074955, -0.3798501, -3.840683, 0.5137255, 1, 0, 1,
-0.7063031, 0.8047618, -0.2173547, 0.5058824, 1, 0, 1,
-0.7046534, 0.9863912, -0.01147917, 0.5019608, 1, 0, 1,
-0.6950335, 0.4943839, -1.40438, 0.4941176, 1, 0, 1,
-0.6860026, 0.926161, -0.1602036, 0.4862745, 1, 0, 1,
-0.6822403, -0.8125694, -0.8242897, 0.4823529, 1, 0, 1,
-0.6808346, -0.5104542, -0.1502676, 0.4745098, 1, 0, 1,
-0.6752937, -0.06242437, -2.193011, 0.4705882, 1, 0, 1,
-0.6746228, 0.003745196, -1.110088, 0.4627451, 1, 0, 1,
-0.672612, -0.05156845, -0.3939327, 0.4588235, 1, 0, 1,
-0.6718888, -1.364059, -1.922341, 0.4509804, 1, 0, 1,
-0.6645205, 0.1547716, -0.9967501, 0.4470588, 1, 0, 1,
-0.6586248, -0.0471657, -0.37713, 0.4392157, 1, 0, 1,
-0.6519335, -1.191765, -2.548312, 0.4352941, 1, 0, 1,
-0.6499382, 0.6918382, 1.143917, 0.427451, 1, 0, 1,
-0.6491424, -0.8743315, -3.162335, 0.4235294, 1, 0, 1,
-0.6487207, 0.9264523, -1.659481, 0.4156863, 1, 0, 1,
-0.647252, -0.6320229, -2.865212, 0.4117647, 1, 0, 1,
-0.6468893, -0.859938, -2.970376, 0.4039216, 1, 0, 1,
-0.6454356, 0.4233567, -1.973185, 0.3960784, 1, 0, 1,
-0.6427678, 0.3874583, -1.653534, 0.3921569, 1, 0, 1,
-0.6411922, 1.870901, -0.2568513, 0.3843137, 1, 0, 1,
-0.6402296, -0.8989357, -0.8856785, 0.3803922, 1, 0, 1,
-0.6352264, -0.6493095, -1.537559, 0.372549, 1, 0, 1,
-0.6261774, -2.269625, -1.731765, 0.3686275, 1, 0, 1,
-0.6236217, -0.3240276, -0.4499506, 0.3607843, 1, 0, 1,
-0.6204824, 1.117086, 0.00931161, 0.3568628, 1, 0, 1,
-0.6197243, -0.9315011, -2.71406, 0.3490196, 1, 0, 1,
-0.6195228, 0.8073974, -0.9025732, 0.345098, 1, 0, 1,
-0.6147116, 0.7442697, -1.91725, 0.3372549, 1, 0, 1,
-0.6127746, 0.7337418, -0.3528881, 0.3333333, 1, 0, 1,
-0.6121857, -0.1767659, -0.01962519, 0.3254902, 1, 0, 1,
-0.6100898, 0.8132265, 1.164671, 0.3215686, 1, 0, 1,
-0.6064944, -1.257653, -4.088553, 0.3137255, 1, 0, 1,
-0.606061, 0.3233798, -0.7952376, 0.3098039, 1, 0, 1,
-0.6034455, -0.08198941, -1.461335, 0.3019608, 1, 0, 1,
-0.5988804, -1.561119, -3.217711, 0.2941177, 1, 0, 1,
-0.5944304, 0.8842683, 0.7988813, 0.2901961, 1, 0, 1,
-0.5940717, 1.19007, 0.4765433, 0.282353, 1, 0, 1,
-0.5935557, 0.8990635, 0.1823089, 0.2784314, 1, 0, 1,
-0.5889997, -0.675869, -1.893061, 0.2705882, 1, 0, 1,
-0.5829425, -0.72933, -2.446362, 0.2666667, 1, 0, 1,
-0.5821813, -0.0017304, -2.47833, 0.2588235, 1, 0, 1,
-0.5808388, 0.09514751, -0.4917033, 0.254902, 1, 0, 1,
-0.5774111, 0.05717605, -4.198935, 0.2470588, 1, 0, 1,
-0.5772479, -0.5034334, -1.300943, 0.2431373, 1, 0, 1,
-0.5746265, 0.1865505, -1.814468, 0.2352941, 1, 0, 1,
-0.5744101, 0.7805441, -0.08527782, 0.2313726, 1, 0, 1,
-0.574352, 1.419206, -1.012807, 0.2235294, 1, 0, 1,
-0.5731596, 0.3832429, -1.31718, 0.2196078, 1, 0, 1,
-0.5730497, -1.732068, -2.027632, 0.2117647, 1, 0, 1,
-0.5697641, -0.7409196, -1.271408, 0.2078431, 1, 0, 1,
-0.5695382, -0.7955353, -4.275395, 0.2, 1, 0, 1,
-0.5645329, 0.4670841, 0.3243898, 0.1921569, 1, 0, 1,
-0.5601629, 1.535742, -1.333715, 0.1882353, 1, 0, 1,
-0.5528269, 0.2475798, 0.04007959, 0.1803922, 1, 0, 1,
-0.5497724, -0.2772169, -2.268339, 0.1764706, 1, 0, 1,
-0.5495513, 0.8745979, -2.272802, 0.1686275, 1, 0, 1,
-0.5481868, 3.255449, -2.190958, 0.1647059, 1, 0, 1,
-0.5448084, 0.04034625, -1.94979, 0.1568628, 1, 0, 1,
-0.5436289, 0.3363724, -0.9867376, 0.1529412, 1, 0, 1,
-0.5390555, 0.06630135, -0.01819748, 0.145098, 1, 0, 1,
-0.5365725, -0.4888957, -0.6014445, 0.1411765, 1, 0, 1,
-0.5310252, 0.07821108, -2.215407, 0.1333333, 1, 0, 1,
-0.5309663, 0.1415339, -2.495846, 0.1294118, 1, 0, 1,
-0.528797, -0.701661, -1.377424, 0.1215686, 1, 0, 1,
-0.5222145, -2.538977, -2.754371, 0.1176471, 1, 0, 1,
-0.520448, -1.911084, -3.843634, 0.1098039, 1, 0, 1,
-0.5192648, -1.883311, -2.884339, 0.1058824, 1, 0, 1,
-0.5146459, 1.367717, 1.421732, 0.09803922, 1, 0, 1,
-0.5143945, 0.881626, -0.3071642, 0.09019608, 1, 0, 1,
-0.5113906, -0.6370241, -2.576069, 0.08627451, 1, 0, 1,
-0.5079253, -1.130389, -2.344921, 0.07843138, 1, 0, 1,
-0.5070243, -1.291115, -2.928192, 0.07450981, 1, 0, 1,
-0.5055168, 0.2280627, -1.617145, 0.06666667, 1, 0, 1,
-0.4995931, 2.354811, -0.3552883, 0.0627451, 1, 0, 1,
-0.4949946, 1.48202, 0.4938616, 0.05490196, 1, 0, 1,
-0.4916764, 0.6306299, -2.201771, 0.05098039, 1, 0, 1,
-0.490835, 0.3762428, -0.7733344, 0.04313726, 1, 0, 1,
-0.4902089, 0.03560459, -1.279886, 0.03921569, 1, 0, 1,
-0.4898762, 1.303189, -0.5213755, 0.03137255, 1, 0, 1,
-0.4871495, -1.932866, -2.525897, 0.02745098, 1, 0, 1,
-0.486489, 1.166683, 0.1245219, 0.01960784, 1, 0, 1,
-0.4824182, -1.157585, -3.061258, 0.01568628, 1, 0, 1,
-0.4796057, -0.3337232, -1.021732, 0.007843138, 1, 0, 1,
-0.4754826, 0.02697982, -0.8987887, 0.003921569, 1, 0, 1,
-0.4721777, 1.462313, 0.3004576, 0, 1, 0.003921569, 1,
-0.4697822, 1.103052, -1.026339, 0, 1, 0.01176471, 1,
-0.4694049, -0.2920262, -4.524139, 0, 1, 0.01568628, 1,
-0.4641165, -0.9785849, -2.27887, 0, 1, 0.02352941, 1,
-0.4621436, 1.236139, -1.090566, 0, 1, 0.02745098, 1,
-0.4608189, 0.06877346, -2.106109, 0, 1, 0.03529412, 1,
-0.4564082, 1.046964, -0.8542996, 0, 1, 0.03921569, 1,
-0.4551157, 0.7162262, -0.5872399, 0, 1, 0.04705882, 1,
-0.4507033, -0.5759034, -3.041919, 0, 1, 0.05098039, 1,
-0.4477156, -0.7899671, -3.582014, 0, 1, 0.05882353, 1,
-0.4476363, 0.1551865, -2.013093, 0, 1, 0.0627451, 1,
-0.4466239, -0.3368675, -1.866657, 0, 1, 0.07058824, 1,
-0.4415584, -1.87244, -5.136219, 0, 1, 0.07450981, 1,
-0.4401979, 1.120544, 0.5232527, 0, 1, 0.08235294, 1,
-0.4288838, -0.0657323, -2.086926, 0, 1, 0.08627451, 1,
-0.4284051, 1.053455, -1.3293, 0, 1, 0.09411765, 1,
-0.4282138, 0.009458246, -2.561435, 0, 1, 0.1019608, 1,
-0.4279048, -0.3183536, -1.691164, 0, 1, 0.1058824, 1,
-0.4275994, -1.226604, -1.533589, 0, 1, 0.1137255, 1,
-0.4264106, 0.3940074, -0.6522327, 0, 1, 0.1176471, 1,
-0.4241697, 0.8319573, -0.9437101, 0, 1, 0.1254902, 1,
-0.4198289, 2.357816, -0.3554657, 0, 1, 0.1294118, 1,
-0.4170223, -0.3354752, -2.274473, 0, 1, 0.1372549, 1,
-0.4092566, 0.6271557, -2.534978, 0, 1, 0.1411765, 1,
-0.4092081, -0.6345421, -3.3646, 0, 1, 0.1490196, 1,
-0.4053245, 0.0248418, -3.0156, 0, 1, 0.1529412, 1,
-0.4044098, -1.691114, -3.671368, 0, 1, 0.1607843, 1,
-0.4036151, -0.02694708, -3.906067, 0, 1, 0.1647059, 1,
-0.4035561, -2.210614, -3.959383, 0, 1, 0.172549, 1,
-0.400625, 0.5614996, -0.6065366, 0, 1, 0.1764706, 1,
-0.3971509, 0.4723529, 0.02651806, 0, 1, 0.1843137, 1,
-0.3951371, -1.59861, -3.690803, 0, 1, 0.1882353, 1,
-0.3856678, 0.512998, 0.2553285, 0, 1, 0.1960784, 1,
-0.3843915, -0.5159903, -1.682313, 0, 1, 0.2039216, 1,
-0.3839832, 1.049498, -1.596159, 0, 1, 0.2078431, 1,
-0.3837859, 0.313032, -1.992308, 0, 1, 0.2156863, 1,
-0.380986, 0.4246342, -1.193221, 0, 1, 0.2196078, 1,
-0.3806942, 0.2416362, -2.153466, 0, 1, 0.227451, 1,
-0.3663383, -2.138041, -2.414081, 0, 1, 0.2313726, 1,
-0.3661432, -1.808064, -2.532637, 0, 1, 0.2392157, 1,
-0.3640058, -0.5903752, -2.481702, 0, 1, 0.2431373, 1,
-0.3602897, 0.7731494, -0.06960154, 0, 1, 0.2509804, 1,
-0.3565334, -0.02480196, 0.3705649, 0, 1, 0.254902, 1,
-0.3557945, -0.2235712, -2.14518, 0, 1, 0.2627451, 1,
-0.3506055, 0.3950937, -1.624365, 0, 1, 0.2666667, 1,
-0.3486203, 1.011835, -0.1677072, 0, 1, 0.2745098, 1,
-0.348608, -0.2392894, -2.551861, 0, 1, 0.2784314, 1,
-0.3456141, 1.057237, -0.8166546, 0, 1, 0.2862745, 1,
-0.3451248, 0.3567028, 0.06131541, 0, 1, 0.2901961, 1,
-0.3442906, 0.5007569, -1.281802, 0, 1, 0.2980392, 1,
-0.3435638, 0.4234118, -0.5477613, 0, 1, 0.3058824, 1,
-0.3399843, -0.7319899, -3.307509, 0, 1, 0.3098039, 1,
-0.338366, 1.380628, -0.6870261, 0, 1, 0.3176471, 1,
-0.3319423, -0.4917346, -1.880495, 0, 1, 0.3215686, 1,
-0.3286642, -0.7396955, -3.828636, 0, 1, 0.3294118, 1,
-0.3286191, -0.1449301, -1.678519, 0, 1, 0.3333333, 1,
-0.3277586, 0.8471941, -0.4601484, 0, 1, 0.3411765, 1,
-0.3250661, -1.052891, -3.681216, 0, 1, 0.345098, 1,
-0.3226362, -0.4962031, -2.276193, 0, 1, 0.3529412, 1,
-0.3223349, -0.1482719, -3.328717, 0, 1, 0.3568628, 1,
-0.3201219, 0.3266777, 1.024858, 0, 1, 0.3647059, 1,
-0.3149162, 1.252141, -0.871951, 0, 1, 0.3686275, 1,
-0.3145457, -0.967809, -2.053584, 0, 1, 0.3764706, 1,
-0.3100802, 1.436098, -0.4656368, 0, 1, 0.3803922, 1,
-0.3066872, 0.1265849, -2.539745, 0, 1, 0.3882353, 1,
-0.3049881, -0.007811735, -1.275675, 0, 1, 0.3921569, 1,
-0.2993545, 0.9892493, -0.1861701, 0, 1, 0.4, 1,
-0.2985227, -0.555738, -4.431022, 0, 1, 0.4078431, 1,
-0.2976729, -1.377737, -3.680601, 0, 1, 0.4117647, 1,
-0.2975271, 0.7690173, 0.2926083, 0, 1, 0.4196078, 1,
-0.2907221, 0.2898629, -1.384358, 0, 1, 0.4235294, 1,
-0.2883582, -1.107403, -3.840655, 0, 1, 0.4313726, 1,
-0.2844997, -1.860067, -2.680595, 0, 1, 0.4352941, 1,
-0.2797498, -0.3673047, -1.436041, 0, 1, 0.4431373, 1,
-0.279482, -1.124013, -2.923125, 0, 1, 0.4470588, 1,
-0.278635, -0.3671153, -2.396752, 0, 1, 0.454902, 1,
-0.2764801, 0.4725764, -1.011102, 0, 1, 0.4588235, 1,
-0.2760415, 0.4589099, -0.1793847, 0, 1, 0.4666667, 1,
-0.2752479, -1.949555, -4.690197, 0, 1, 0.4705882, 1,
-0.2722811, 0.3548687, -0.9632472, 0, 1, 0.4784314, 1,
-0.270434, -0.7735969, -3.199692, 0, 1, 0.4823529, 1,
-0.261782, -0.2554769, -2.8048, 0, 1, 0.4901961, 1,
-0.2617199, -0.2924411, -2.155011, 0, 1, 0.4941176, 1,
-0.2593352, -0.6916638, -1.832618, 0, 1, 0.5019608, 1,
-0.2553041, 0.5067786, 0.4655792, 0, 1, 0.509804, 1,
-0.2528513, -0.5295995, -2.825152, 0, 1, 0.5137255, 1,
-0.2520385, 0.790147, -0.2059559, 0, 1, 0.5215687, 1,
-0.2386061, 1.874275, 0.1264242, 0, 1, 0.5254902, 1,
-0.2356246, -0.6176553, -3.432774, 0, 1, 0.5333334, 1,
-0.2314213, -0.1829791, -1.868937, 0, 1, 0.5372549, 1,
-0.2310325, 1.976913, 0.2550025, 0, 1, 0.5450981, 1,
-0.223, -1.295325, -3.041567, 0, 1, 0.5490196, 1,
-0.2139562, 0.5108218, -0.1768182, 0, 1, 0.5568628, 1,
-0.2084789, -0.2470556, -1.32498, 0, 1, 0.5607843, 1,
-0.2083423, 0.8359119, -0.2282214, 0, 1, 0.5686275, 1,
-0.2067309, 0.2226151, -0.5244085, 0, 1, 0.572549, 1,
-0.2061598, 0.1135643, -0.5525061, 0, 1, 0.5803922, 1,
-0.2014255, -0.668165, -4.109663, 0, 1, 0.5843138, 1,
-0.1910703, -0.2143984, -1.032488, 0, 1, 0.5921569, 1,
-0.1898386, 0.5930517, -0.2531696, 0, 1, 0.5960785, 1,
-0.1863782, 0.6012664, 0.1027012, 0, 1, 0.6039216, 1,
-0.1845865, 0.3043317, 1.687692, 0, 1, 0.6117647, 1,
-0.1809658, 1.352556, -0.3832427, 0, 1, 0.6156863, 1,
-0.1770259, 0.8427259, 1.361369, 0, 1, 0.6235294, 1,
-0.1730532, 1.411581, -1.032864, 0, 1, 0.627451, 1,
-0.1706442, 0.1694147, -0.02838077, 0, 1, 0.6352941, 1,
-0.1696198, 0.05288173, -2.680616, 0, 1, 0.6392157, 1,
-0.1651606, -0.8770855, -3.602058, 0, 1, 0.6470588, 1,
-0.1644268, -0.4382695, -2.267697, 0, 1, 0.6509804, 1,
-0.1613673, -0.3475375, -3.606646, 0, 1, 0.6588235, 1,
-0.1578724, -0.5985414, -3.45223, 0, 1, 0.6627451, 1,
-0.156509, -0.8828991, -1.672535, 0, 1, 0.6705883, 1,
-0.1532643, -0.4442746, -3.470868, 0, 1, 0.6745098, 1,
-0.1519072, -0.5156656, -3.40678, 0, 1, 0.682353, 1,
-0.1448923, 1.013282, -0.06167874, 0, 1, 0.6862745, 1,
-0.1434699, 0.6863866, -1.384235, 0, 1, 0.6941177, 1,
-0.1421376, -0.2515278, -1.615713, 0, 1, 0.7019608, 1,
-0.1365066, -0.4899814, -2.661267, 0, 1, 0.7058824, 1,
-0.1338567, -0.0560908, -2.738806, 0, 1, 0.7137255, 1,
-0.133559, 0.789022, 1.661638, 0, 1, 0.7176471, 1,
-0.1271015, 1.111161, -3.524506, 0, 1, 0.7254902, 1,
-0.1257819, 1.519548, 1.601423, 0, 1, 0.7294118, 1,
-0.1256965, -0.8439552, -0.15704, 0, 1, 0.7372549, 1,
-0.1236469, 0.6773302, 0.9641106, 0, 1, 0.7411765, 1,
-0.1222754, -1.404572, -2.585418, 0, 1, 0.7490196, 1,
-0.1213757, 0.1002823, 0.1511089, 0, 1, 0.7529412, 1,
-0.1213203, 0.4913591, -0.455155, 0, 1, 0.7607843, 1,
-0.1197567, -0.1020452, -1.583573, 0, 1, 0.7647059, 1,
-0.1180919, 1.368431, -0.426428, 0, 1, 0.772549, 1,
-0.1166493, -0.1403156, -3.733044, 0, 1, 0.7764706, 1,
-0.1165718, 0.6334022, -0.6007067, 0, 1, 0.7843137, 1,
-0.1085779, 0.1380077, 0.7379611, 0, 1, 0.7882353, 1,
-0.1078045, 0.04222048, 0.09197106, 0, 1, 0.7960784, 1,
-0.1072425, 0.2305704, -1.996598, 0, 1, 0.8039216, 1,
-0.1056046, 1.063176, 0.05270557, 0, 1, 0.8078431, 1,
-0.09075948, 0.6474956, 0.621742, 0, 1, 0.8156863, 1,
-0.08781695, 0.3259887, 0.1664876, 0, 1, 0.8196079, 1,
-0.08589467, -0.4970165, -2.117841, 0, 1, 0.827451, 1,
-0.08426668, 0.3260864, -0.4950684, 0, 1, 0.8313726, 1,
-0.08280645, -0.6285276, -2.953566, 0, 1, 0.8392157, 1,
-0.07788526, 0.9312134, -0.3297638, 0, 1, 0.8431373, 1,
-0.07368212, -0.552502, -3.704979, 0, 1, 0.8509804, 1,
-0.0736322, 1.408015, 0.4409314, 0, 1, 0.854902, 1,
-0.07164276, -1.481329, -1.442953, 0, 1, 0.8627451, 1,
-0.06501819, 1.532455, -1.50748, 0, 1, 0.8666667, 1,
-0.06443142, -0.08268494, -1.19974, 0, 1, 0.8745098, 1,
-0.0607072, 0.3058725, 0.537213, 0, 1, 0.8784314, 1,
-0.05911526, -0.2111866, -4.539074, 0, 1, 0.8862745, 1,
-0.05797835, 1.885511, -1.135554, 0, 1, 0.8901961, 1,
-0.05684259, -0.49128, -1.05155, 0, 1, 0.8980392, 1,
-0.05432703, -0.3041986, -3.650858, 0, 1, 0.9058824, 1,
-0.05391291, -1.356341, -3.645799, 0, 1, 0.9098039, 1,
-0.05309879, -0.02748641, -1.596729, 0, 1, 0.9176471, 1,
-0.04958899, 0.9989431, 0.4721445, 0, 1, 0.9215686, 1,
-0.04661834, 1.435951, 0.1578392, 0, 1, 0.9294118, 1,
-0.04434747, -0.09968024, -3.250244, 0, 1, 0.9333333, 1,
-0.04325771, 0.9674142, 0.6897876, 0, 1, 0.9411765, 1,
-0.03950598, 0.2030768, 0.1522791, 0, 1, 0.945098, 1,
-0.03664349, 1.129785, 0.8031079, 0, 1, 0.9529412, 1,
-0.03364595, 0.2915559, -1.368565, 0, 1, 0.9568627, 1,
-0.03188183, 0.08804442, 0.6227874, 0, 1, 0.9647059, 1,
-0.03062731, 1.193843, 1.873558, 0, 1, 0.9686275, 1,
-0.02935999, 1.533182, 0.9620564, 0, 1, 0.9764706, 1,
-0.02917026, 0.2925639, -0.6742481, 0, 1, 0.9803922, 1,
-0.02855494, -0.7258102, -4.865278, 0, 1, 0.9882353, 1,
-0.02593306, -0.4724078, -2.59538, 0, 1, 0.9921569, 1,
-0.02396813, 0.8832939, -1.035353, 0, 1, 1, 1,
-0.02392238, -0.6453092, -2.906751, 0, 0.9921569, 1, 1,
-0.02106948, 0.6632519, -0.5249212, 0, 0.9882353, 1, 1,
-0.01992354, 0.3642348, 0.4852273, 0, 0.9803922, 1, 1,
-0.01648286, 0.9166832, 0.09365184, 0, 0.9764706, 1, 1,
-0.01487852, -0.4940254, -3.67629, 0, 0.9686275, 1, 1,
-0.01261438, 0.2372974, 0.7690797, 0, 0.9647059, 1, 1,
-0.01035126, 0.1825961, -1.311866, 0, 0.9568627, 1, 1,
-0.01028232, 0.5556878, -2.343709, 0, 0.9529412, 1, 1,
-0.007352219, -0.5170504, -2.173906, 0, 0.945098, 1, 1,
-0.00536313, 0.9270219, 0.7973179, 0, 0.9411765, 1, 1,
0.0003172054, -0.526134, 2.890005, 0, 0.9333333, 1, 1,
0.002176275, -0.2343499, 3.152063, 0, 0.9294118, 1, 1,
0.006430222, -1.214253, 4.707777, 0, 0.9215686, 1, 1,
0.01487205, 0.4402784, 0.2199486, 0, 0.9176471, 1, 1,
0.0158403, 1.534734, 0.4628384, 0, 0.9098039, 1, 1,
0.01695676, -0.7846658, 4.216999, 0, 0.9058824, 1, 1,
0.01749448, 0.8653473, 0.5673879, 0, 0.8980392, 1, 1,
0.0188704, -0.1525324, 3.614989, 0, 0.8901961, 1, 1,
0.02041064, 0.09107174, 0.8224452, 0, 0.8862745, 1, 1,
0.02227705, -0.5228535, 3.107254, 0, 0.8784314, 1, 1,
0.02231627, -1.154002, 3.733646, 0, 0.8745098, 1, 1,
0.02498144, -0.3034299, 1.583919, 0, 0.8666667, 1, 1,
0.02666506, 0.09348254, 0.8504102, 0, 0.8627451, 1, 1,
0.03613772, -0.2115573, 1.574709, 0, 0.854902, 1, 1,
0.04319621, 1.412769, -1.022384, 0, 0.8509804, 1, 1,
0.04582096, -0.4111924, 2.031115, 0, 0.8431373, 1, 1,
0.04784522, 1.176964, 0.9438716, 0, 0.8392157, 1, 1,
0.04857568, 0.06644672, -0.769335, 0, 0.8313726, 1, 1,
0.06142031, 1.30254, -0.3109859, 0, 0.827451, 1, 1,
0.0617509, -0.1431711, 3.733461, 0, 0.8196079, 1, 1,
0.06400824, -1.746339, 2.373861, 0, 0.8156863, 1, 1,
0.06593751, 0.3939249, -0.9476078, 0, 0.8078431, 1, 1,
0.06662433, 1.352621, -0.5062037, 0, 0.8039216, 1, 1,
0.06700844, 1.0468, 0.5503893, 0, 0.7960784, 1, 1,
0.07187071, -0.7405851, 3.275243, 0, 0.7882353, 1, 1,
0.07400487, -1.294291, 3.198682, 0, 0.7843137, 1, 1,
0.07585992, -1.385503, 2.988724, 0, 0.7764706, 1, 1,
0.08096274, -1.176618, 2.381495, 0, 0.772549, 1, 1,
0.0821783, -1.828252, 4.780212, 0, 0.7647059, 1, 1,
0.08369897, 0.01819949, 1.386799, 0, 0.7607843, 1, 1,
0.08482768, 1.423229, 0.3781008, 0, 0.7529412, 1, 1,
0.08835493, 0.7884054, 0.9347721, 0, 0.7490196, 1, 1,
0.0891683, -0.4331464, 5.227244, 0, 0.7411765, 1, 1,
0.08941953, -0.4265415, 3.064965, 0, 0.7372549, 1, 1,
0.09524744, -0.2674167, 3.537229, 0, 0.7294118, 1, 1,
0.09923591, 0.6421499, 0.8106855, 0, 0.7254902, 1, 1,
0.09978107, 0.5933218, 0.5723512, 0, 0.7176471, 1, 1,
0.1011555, -0.3136728, 2.648782, 0, 0.7137255, 1, 1,
0.1031596, 0.3505887, 1.000275, 0, 0.7058824, 1, 1,
0.1061311, 0.1097094, 1.068614, 0, 0.6980392, 1, 1,
0.1066874, 0.4613965, -2.541227, 0, 0.6941177, 1, 1,
0.1093045, 0.3287787, 0.4991646, 0, 0.6862745, 1, 1,
0.122062, 0.5025653, 1.415933, 0, 0.682353, 1, 1,
0.1238574, 1.24701, 0.04556143, 0, 0.6745098, 1, 1,
0.1241973, -0.6307443, 2.524167, 0, 0.6705883, 1, 1,
0.1269989, -1.564172, 2.435502, 0, 0.6627451, 1, 1,
0.1285954, -0.2185407, 3.516774, 0, 0.6588235, 1, 1,
0.1296233, 1.101632, 0.7052655, 0, 0.6509804, 1, 1,
0.1313441, -1.593241, 1.72153, 0, 0.6470588, 1, 1,
0.1320784, 0.3140245, 0.7541125, 0, 0.6392157, 1, 1,
0.1326389, 0.1680579, -0.79755, 0, 0.6352941, 1, 1,
0.134494, 1.349388, 0.7219217, 0, 0.627451, 1, 1,
0.1392804, 0.7783238, 1.674568, 0, 0.6235294, 1, 1,
0.1393684, 0.7283288, 0.755931, 0, 0.6156863, 1, 1,
0.1414285, -0.5598966, 3.535245, 0, 0.6117647, 1, 1,
0.1488544, 0.3133849, 0.469854, 0, 0.6039216, 1, 1,
0.1501651, -0.3853246, 2.491596, 0, 0.5960785, 1, 1,
0.1519779, -0.373054, 1.954159, 0, 0.5921569, 1, 1,
0.1527681, 1.225634, -0.1469634, 0, 0.5843138, 1, 1,
0.1528131, 1.892402, -0.3668337, 0, 0.5803922, 1, 1,
0.1533288, 1.354299, -0.4280344, 0, 0.572549, 1, 1,
0.1573703, 0.2756577, 0.6033715, 0, 0.5686275, 1, 1,
0.1666276, 0.3204079, 1.913025, 0, 0.5607843, 1, 1,
0.1681016, 0.241546, 0.8309326, 0, 0.5568628, 1, 1,
0.1692475, -1.452657, 2.521394, 0, 0.5490196, 1, 1,
0.1698379, 1.226729, -0.5945649, 0, 0.5450981, 1, 1,
0.1797293, -0.3529099, 3.682924, 0, 0.5372549, 1, 1,
0.1917928, 0.3473709, 1.721937, 0, 0.5333334, 1, 1,
0.1942404, -0.05293611, 1.176189, 0, 0.5254902, 1, 1,
0.1962042, -1.910092, 2.116068, 0, 0.5215687, 1, 1,
0.2043076, 0.355601, 1.490417, 0, 0.5137255, 1, 1,
0.2142287, -0.8035834, 2.070413, 0, 0.509804, 1, 1,
0.2149659, 0.871516, -0.9341557, 0, 0.5019608, 1, 1,
0.2187142, 0.51249, -0.512319, 0, 0.4941176, 1, 1,
0.2202565, -1.73125, 3.355755, 0, 0.4901961, 1, 1,
0.2207093, -1.446962, 4.409891, 0, 0.4823529, 1, 1,
0.2210787, -1.469244, 2.869194, 0, 0.4784314, 1, 1,
0.2217703, -0.1694561, 3.579496, 0, 0.4705882, 1, 1,
0.2236788, 0.06994289, 0.977545, 0, 0.4666667, 1, 1,
0.2249946, -0.8412781, 3.132595, 0, 0.4588235, 1, 1,
0.2317116, -1.34189, 1.720579, 0, 0.454902, 1, 1,
0.23554, 0.8537744, 0.1844955, 0, 0.4470588, 1, 1,
0.2381006, 0.6460434, -0.6909723, 0, 0.4431373, 1, 1,
0.2384872, 2.072586, 0.8314322, 0, 0.4352941, 1, 1,
0.2396444, -0.9162148, 2.615447, 0, 0.4313726, 1, 1,
0.2421368, -0.6554182, 2.446193, 0, 0.4235294, 1, 1,
0.2443908, 1.077055, 1.798561, 0, 0.4196078, 1, 1,
0.2457503, 0.2316702, 0.2812946, 0, 0.4117647, 1, 1,
0.2470864, -0.4488401, 1.480442, 0, 0.4078431, 1, 1,
0.2471776, 0.1319157, 0.3268249, 0, 0.4, 1, 1,
0.2520111, 1.052678, 0.5260286, 0, 0.3921569, 1, 1,
0.2529062, -0.9409871, 2.952147, 0, 0.3882353, 1, 1,
0.253475, 1.502293, 0.9673267, 0, 0.3803922, 1, 1,
0.2564513, -1.28561, 1.519051, 0, 0.3764706, 1, 1,
0.256549, 0.6423422, 1.787341, 0, 0.3686275, 1, 1,
0.2577653, 1.358274, -2.111312, 0, 0.3647059, 1, 1,
0.2607372, 0.4350812, -0.7605777, 0, 0.3568628, 1, 1,
0.2612804, 2.419812, 0.9583132, 0, 0.3529412, 1, 1,
0.2625108, -1.290233, 2.75609, 0, 0.345098, 1, 1,
0.2626914, 0.05594921, 1.616616, 0, 0.3411765, 1, 1,
0.2633608, -0.4155858, 0.5669605, 0, 0.3333333, 1, 1,
0.2636497, -0.137904, 1.903615, 0, 0.3294118, 1, 1,
0.2639335, 1.251071, 0.583094, 0, 0.3215686, 1, 1,
0.2656254, 0.8654498, 0.2581185, 0, 0.3176471, 1, 1,
0.2669339, -0.6015774, 2.652094, 0, 0.3098039, 1, 1,
0.2722385, -1.724442, 1.514182, 0, 0.3058824, 1, 1,
0.2799311, 0.3281526, 1.427067, 0, 0.2980392, 1, 1,
0.281311, 0.6406869, 0.05014768, 0, 0.2901961, 1, 1,
0.2896296, -1.350454, 2.901536, 0, 0.2862745, 1, 1,
0.2929916, -0.5887895, 2.336259, 0, 0.2784314, 1, 1,
0.2974871, 1.143054, 0.2342862, 0, 0.2745098, 1, 1,
0.3118748, 0.116909, 1.911759, 0, 0.2666667, 1, 1,
0.3128, 0.7845417, 0.8101007, 0, 0.2627451, 1, 1,
0.3129885, -0.5372761, 2.094948, 0, 0.254902, 1, 1,
0.3158193, 0.08027716, 1.398753, 0, 0.2509804, 1, 1,
0.3194154, -1.002036, 3.236035, 0, 0.2431373, 1, 1,
0.3242393, 0.9749303, 0.4909981, 0, 0.2392157, 1, 1,
0.3256213, -0.2990091, 4.356695, 0, 0.2313726, 1, 1,
0.3264652, 0.144851, 1.315611, 0, 0.227451, 1, 1,
0.3290674, 1.782058, 0.3954933, 0, 0.2196078, 1, 1,
0.3306727, 0.382152, 1.792828, 0, 0.2156863, 1, 1,
0.3368616, -2.361238, 2.455036, 0, 0.2078431, 1, 1,
0.3440736, -0.9658976, 2.444641, 0, 0.2039216, 1, 1,
0.3484596, -1.039646, 2.704534, 0, 0.1960784, 1, 1,
0.3547918, 0.5762382, -0.05840934, 0, 0.1882353, 1, 1,
0.3575054, -0.2374898, 2.686481, 0, 0.1843137, 1, 1,
0.3639844, 0.4266284, 1.633082, 0, 0.1764706, 1, 1,
0.3683109, 0.1561216, 1.284065, 0, 0.172549, 1, 1,
0.3752895, -1.08084, 1.79295, 0, 0.1647059, 1, 1,
0.3793821, -0.8877962, 3.601144, 0, 0.1607843, 1, 1,
0.3801737, -0.9420337, 4.228813, 0, 0.1529412, 1, 1,
0.3825151, -0.0599981, 1.616079, 0, 0.1490196, 1, 1,
0.38417, -0.4778982, 3.366791, 0, 0.1411765, 1, 1,
0.3867256, -0.0224986, 0.2810137, 0, 0.1372549, 1, 1,
0.3881888, 2.023875, 0.637697, 0, 0.1294118, 1, 1,
0.3916555, -0.5483159, -0.5942445, 0, 0.1254902, 1, 1,
0.3929071, 0.02037349, 0.5558771, 0, 0.1176471, 1, 1,
0.3991578, -1.017354, 2.773431, 0, 0.1137255, 1, 1,
0.401735, -0.9721745, 3.660352, 0, 0.1058824, 1, 1,
0.4043939, 0.8651974, 1.969777, 0, 0.09803922, 1, 1,
0.4062985, 0.4077582, -0.3639657, 0, 0.09411765, 1, 1,
0.40703, 0.06079062, 0.3363963, 0, 0.08627451, 1, 1,
0.4125004, 0.2602125, 0.6803709, 0, 0.08235294, 1, 1,
0.4205663, 0.4506129, 0.2347022, 0, 0.07450981, 1, 1,
0.426932, 0.1060473, -0.02762833, 0, 0.07058824, 1, 1,
0.4273159, -0.7652035, 2.592756, 0, 0.0627451, 1, 1,
0.4290085, -0.3707328, 2.014641, 0, 0.05882353, 1, 1,
0.4314696, -1.482704, 3.281851, 0, 0.05098039, 1, 1,
0.4385934, 0.3835633, 0.7338375, 0, 0.04705882, 1, 1,
0.4388953, 0.2797807, 1.701993, 0, 0.03921569, 1, 1,
0.446335, 0.03884045, 3.832522, 0, 0.03529412, 1, 1,
0.4480672, -1.704051, 3.023709, 0, 0.02745098, 1, 1,
0.4493707, 0.6419922, -0.4882583, 0, 0.02352941, 1, 1,
0.4598069, -0.5838305, 1.321093, 0, 0.01568628, 1, 1,
0.4619296, -0.4361968, 0.2839589, 0, 0.01176471, 1, 1,
0.4645388, 0.06889493, 2.020545, 0, 0.003921569, 1, 1,
0.4699011, 0.7683064, -1.389494, 0.003921569, 0, 1, 1,
0.4700589, 0.07571165, 2.197784, 0.007843138, 0, 1, 1,
0.4729433, -0.985211, 1.142496, 0.01568628, 0, 1, 1,
0.4736896, -0.7654145, 2.324019, 0.01960784, 0, 1, 1,
0.4740923, 0.3806654, 0.3016447, 0.02745098, 0, 1, 1,
0.4783674, 0.8691508, 1.905774, 0.03137255, 0, 1, 1,
0.4784718, 0.3087635, 0.5876373, 0.03921569, 0, 1, 1,
0.479379, -0.834224, 2.966268, 0.04313726, 0, 1, 1,
0.4816518, 0.02866647, 0.9898275, 0.05098039, 0, 1, 1,
0.4893309, 0.1861229, 2.120108, 0.05490196, 0, 1, 1,
0.494166, -0.2805931, 0.4150504, 0.0627451, 0, 1, 1,
0.4968226, -0.2716056, 2.15815, 0.06666667, 0, 1, 1,
0.5007706, -1.04437, 2.872896, 0.07450981, 0, 1, 1,
0.5028597, -1.410574, 3.53288, 0.07843138, 0, 1, 1,
0.5029342, -0.192664, 1.513813, 0.08627451, 0, 1, 1,
0.5030951, -0.1073675, 3.671652, 0.09019608, 0, 1, 1,
0.5040227, -0.6698232, 2.227468, 0.09803922, 0, 1, 1,
0.5089244, -0.4079518, 3.893727, 0.1058824, 0, 1, 1,
0.510987, 0.3716526, 0.3693133, 0.1098039, 0, 1, 1,
0.5210898, 1.302247, -0.1547113, 0.1176471, 0, 1, 1,
0.522805, 1.299518, -0.09406496, 0.1215686, 0, 1, 1,
0.5287048, 1.352427, -0.008206535, 0.1294118, 0, 1, 1,
0.5320727, -0.7584778, 4.092613, 0.1333333, 0, 1, 1,
0.5341898, -0.09630733, 1.531646, 0.1411765, 0, 1, 1,
0.5349343, -0.6923742, 1.28914, 0.145098, 0, 1, 1,
0.5350642, 0.9907903, 1.405263, 0.1529412, 0, 1, 1,
0.5354525, 1.763376, -0.8103452, 0.1568628, 0, 1, 1,
0.5392855, 0.2219043, 2.140089, 0.1647059, 0, 1, 1,
0.5431978, -1.725845, 2.965249, 0.1686275, 0, 1, 1,
0.5437047, -1.300977, 3.45471, 0.1764706, 0, 1, 1,
0.5440604, -1.524774, 3.760822, 0.1803922, 0, 1, 1,
0.5483466, -0.1668238, 2.919056, 0.1882353, 0, 1, 1,
0.548686, 0.5060014, 3.552615, 0.1921569, 0, 1, 1,
0.5496349, 1.022253, 1.40784, 0.2, 0, 1, 1,
0.5502443, 0.032334, 2.052603, 0.2078431, 0, 1, 1,
0.5505069, -0.5699498, 2.500333, 0.2117647, 0, 1, 1,
0.5521688, 0.4624541, -1.004207, 0.2196078, 0, 1, 1,
0.5525642, 0.5076067, 0.03456301, 0.2235294, 0, 1, 1,
0.5561978, 0.9573883, 0.7146751, 0.2313726, 0, 1, 1,
0.5580945, 0.1191453, 1.255336, 0.2352941, 0, 1, 1,
0.5625904, -0.7035784, 2.644453, 0.2431373, 0, 1, 1,
0.5633608, -0.0294409, -0.391646, 0.2470588, 0, 1, 1,
0.5638022, -1.220863, 2.243182, 0.254902, 0, 1, 1,
0.5640309, -0.946292, 2.703041, 0.2588235, 0, 1, 1,
0.5661387, 0.7108223, 1.069368, 0.2666667, 0, 1, 1,
0.5733457, 0.6787378, -0.09145954, 0.2705882, 0, 1, 1,
0.5797833, 1.805575, 0.7438384, 0.2784314, 0, 1, 1,
0.5799475, -0.3847363, 1.017547, 0.282353, 0, 1, 1,
0.5807859, 0.6657213, 1.708695, 0.2901961, 0, 1, 1,
0.5826454, 0.09709633, 0.8455427, 0.2941177, 0, 1, 1,
0.585672, -2.652957, 3.696306, 0.3019608, 0, 1, 1,
0.58907, -0.5670226, 2.84855, 0.3098039, 0, 1, 1,
0.5898352, -0.3969658, 3.03816, 0.3137255, 0, 1, 1,
0.5937693, 1.492783, 0.5420865, 0.3215686, 0, 1, 1,
0.5942472, -0.4831634, 1.23762, 0.3254902, 0, 1, 1,
0.5949315, 1.144183, 1.447642, 0.3333333, 0, 1, 1,
0.5975214, 0.1383702, 1.313172, 0.3372549, 0, 1, 1,
0.5986619, 0.1382148, 0.6568362, 0.345098, 0, 1, 1,
0.6024632, 0.8998575, 0.6038898, 0.3490196, 0, 1, 1,
0.6025853, 1.396562, 0.2804453, 0.3568628, 0, 1, 1,
0.6035269, -1.693217, 4.472416, 0.3607843, 0, 1, 1,
0.6044117, 0.3430926, 1.765958, 0.3686275, 0, 1, 1,
0.6057182, -0.6087305, 2.285344, 0.372549, 0, 1, 1,
0.6067041, -0.3419184, 4.114122, 0.3803922, 0, 1, 1,
0.6095455, 1.642421, -0.4339739, 0.3843137, 0, 1, 1,
0.6121968, 0.7289287, 0.2207154, 0.3921569, 0, 1, 1,
0.6129086, -0.8894339, 1.418424, 0.3960784, 0, 1, 1,
0.6141673, -1.06752, 2.510088, 0.4039216, 0, 1, 1,
0.6148169, 0.1329307, 0.900264, 0.4117647, 0, 1, 1,
0.6156901, 0.1360875, -0.3556858, 0.4156863, 0, 1, 1,
0.6181959, -1.46873, 2.970378, 0.4235294, 0, 1, 1,
0.6223837, -0.09646972, 2.026915, 0.427451, 0, 1, 1,
0.6228519, 0.5531583, 0.3119344, 0.4352941, 0, 1, 1,
0.6267827, -2.118531, 3.973094, 0.4392157, 0, 1, 1,
0.629414, -1.483077, 3.751304, 0.4470588, 0, 1, 1,
0.6302273, -0.5202206, 3.128572, 0.4509804, 0, 1, 1,
0.6302341, 1.380454, -1.17024, 0.4588235, 0, 1, 1,
0.6376366, 0.4182362, 0.8160778, 0.4627451, 0, 1, 1,
0.6495036, -0.7903932, 2.645141, 0.4705882, 0, 1, 1,
0.651398, 1.111297, 1.572679, 0.4745098, 0, 1, 1,
0.6558254, 0.4888778, 1.766645, 0.4823529, 0, 1, 1,
0.6568359, -1.150167, 3.1392, 0.4862745, 0, 1, 1,
0.6573471, -1.90567, 1.933197, 0.4941176, 0, 1, 1,
0.6598262, 1.026028, 0.4735764, 0.5019608, 0, 1, 1,
0.6623382, 0.3103129, 1.845288, 0.5058824, 0, 1, 1,
0.6698754, -0.2048394, -0.1580203, 0.5137255, 0, 1, 1,
0.6741518, -0.3941909, 0.8448209, 0.5176471, 0, 1, 1,
0.6747881, -0.9752024, 2.310497, 0.5254902, 0, 1, 1,
0.6809231, -0.8550828, 2.493452, 0.5294118, 0, 1, 1,
0.6822312, 0.448558, 2.657022, 0.5372549, 0, 1, 1,
0.6824453, 0.2649298, 1.572586, 0.5411765, 0, 1, 1,
0.6889325, -1.409796, 3.626397, 0.5490196, 0, 1, 1,
0.6918713, 1.906891, -0.547148, 0.5529412, 0, 1, 1,
0.699821, 1.885295, 1.437443, 0.5607843, 0, 1, 1,
0.7037282, -0.06278647, 3.126664, 0.5647059, 0, 1, 1,
0.7045708, 0.3420486, 1.585273, 0.572549, 0, 1, 1,
0.7051833, -0.3343743, 2.406153, 0.5764706, 0, 1, 1,
0.7057554, -1.359462, 3.172658, 0.5843138, 0, 1, 1,
0.7058029, 1.084743, 0.3505465, 0.5882353, 0, 1, 1,
0.7107842, -0.9634883, 2.981793, 0.5960785, 0, 1, 1,
0.7116443, 0.4991504, 0.3041484, 0.6039216, 0, 1, 1,
0.7148043, -0.5325009, 4.683531, 0.6078432, 0, 1, 1,
0.7169147, 0.6934254, 0.3485536, 0.6156863, 0, 1, 1,
0.7182945, -0.8872179, 1.899666, 0.6196079, 0, 1, 1,
0.7230417, 1.327273, -0.08869871, 0.627451, 0, 1, 1,
0.7242147, -0.64526, 1.658463, 0.6313726, 0, 1, 1,
0.7286961, 0.03827916, 0.9535611, 0.6392157, 0, 1, 1,
0.7319323, 0.4098685, 0.2535782, 0.6431373, 0, 1, 1,
0.7322233, -0.426218, 1.788571, 0.6509804, 0, 1, 1,
0.7351419, -0.9729449, 2.896297, 0.654902, 0, 1, 1,
0.7372699, -0.1410794, -0.0722174, 0.6627451, 0, 1, 1,
0.7397706, -1.958897, 3.53404, 0.6666667, 0, 1, 1,
0.7429562, 0.4513337, 1.345453, 0.6745098, 0, 1, 1,
0.7481541, 0.4439677, 1.761112, 0.6784314, 0, 1, 1,
0.7496118, -0.7335151, 2.170578, 0.6862745, 0, 1, 1,
0.7588882, -1.367078, 4.579693, 0.6901961, 0, 1, 1,
0.7647687, -0.857884, 2.478354, 0.6980392, 0, 1, 1,
0.7651016, 1.803228, -0.1331472, 0.7058824, 0, 1, 1,
0.7719181, 0.4176452, 3.133886, 0.7098039, 0, 1, 1,
0.7725301, 0.2835306, 1.573247, 0.7176471, 0, 1, 1,
0.7747942, -0.1768021, 0.7737293, 0.7215686, 0, 1, 1,
0.7781569, -1.431469, 3.129271, 0.7294118, 0, 1, 1,
0.7880562, -1.32987, 2.639144, 0.7333333, 0, 1, 1,
0.7893551, -1.053162, 2.073925, 0.7411765, 0, 1, 1,
0.793043, 0.3440891, 1.51977, 0.7450981, 0, 1, 1,
0.7954032, -1.186958, 3.190722, 0.7529412, 0, 1, 1,
0.7963023, -0.4429999, 2.690674, 0.7568628, 0, 1, 1,
0.8021668, -0.06961922, 2.373174, 0.7647059, 0, 1, 1,
0.8024651, 0.2568651, 0.7979829, 0.7686275, 0, 1, 1,
0.8081899, -1.573452, 1.586256, 0.7764706, 0, 1, 1,
0.8086294, 0.482021, 1.590415, 0.7803922, 0, 1, 1,
0.8094907, -1.70744, 2.729661, 0.7882353, 0, 1, 1,
0.8097678, 0.03593177, 0.9045951, 0.7921569, 0, 1, 1,
0.8190396, -2.704591, 1.387618, 0.8, 0, 1, 1,
0.820042, 1.172459, 0.4508637, 0.8078431, 0, 1, 1,
0.820185, 1.539492, -0.3941531, 0.8117647, 0, 1, 1,
0.8230197, -0.6017433, 1.610232, 0.8196079, 0, 1, 1,
0.8256244, 0.265372, 1.907737, 0.8235294, 0, 1, 1,
0.8256975, -1.397582, 2.608968, 0.8313726, 0, 1, 1,
0.8264773, -1.220527, 2.40218, 0.8352941, 0, 1, 1,
0.8332845, 0.7002924, -0.4642662, 0.8431373, 0, 1, 1,
0.8349878, 0.9087081, -0.7991953, 0.8470588, 0, 1, 1,
0.8384537, 0.9617627, 0.4068415, 0.854902, 0, 1, 1,
0.8448184, 0.1885965, 0.9002364, 0.8588235, 0, 1, 1,
0.8542362, 1.346802, -3.030548, 0.8666667, 0, 1, 1,
0.8544292, -0.8443514, 2.682362, 0.8705882, 0, 1, 1,
0.8569188, 0.2206338, 2.891706, 0.8784314, 0, 1, 1,
0.8570352, -0.6731761, 1.941904, 0.8823529, 0, 1, 1,
0.8581835, 0.664072, -1.004824, 0.8901961, 0, 1, 1,
0.8599713, 0.2003145, -0.2971253, 0.8941177, 0, 1, 1,
0.8709141, -1.378934, 2.377817, 0.9019608, 0, 1, 1,
0.8716543, -1.777837, 2.953768, 0.9098039, 0, 1, 1,
0.8763366, -0.1115628, 1.176902, 0.9137255, 0, 1, 1,
0.876728, -0.2969716, 4.520819, 0.9215686, 0, 1, 1,
0.87888, 0.8330204, 0.8503976, 0.9254902, 0, 1, 1,
0.8837802, 1.02698, 1.297216, 0.9333333, 0, 1, 1,
0.8874773, 1.014122, 1.49885, 0.9372549, 0, 1, 1,
0.8883282, -0.2464859, 1.8428, 0.945098, 0, 1, 1,
0.8895491, 0.4174744, 3.022747, 0.9490196, 0, 1, 1,
0.8909401, -0.2271018, 1.245036, 0.9568627, 0, 1, 1,
0.8944941, 0.7434078, 0.2338291, 0.9607843, 0, 1, 1,
0.899107, -0.5728315, 1.988194, 0.9686275, 0, 1, 1,
0.8993875, -0.01321554, 1.302256, 0.972549, 0, 1, 1,
0.9018551, 0.2471933, 1.226762, 0.9803922, 0, 1, 1,
0.9080536, 0.6858876, -0.3425187, 0.9843137, 0, 1, 1,
0.9217475, 0.4155301, 1.376181, 0.9921569, 0, 1, 1,
0.924334, 0.710134, 2.620896, 0.9960784, 0, 1, 1,
0.9248954, -0.4488839, 1.937091, 1, 0, 0.9960784, 1,
0.9261699, -0.03080085, 1.813676, 1, 0, 0.9882353, 1,
0.9362764, 0.6832557, 0.2151863, 1, 0, 0.9843137, 1,
0.9404199, -2.764356, 2.415437, 1, 0, 0.9764706, 1,
0.9466355, -0.9438342, 2.566401, 1, 0, 0.972549, 1,
0.9489273, -1.163046, 2.975184, 1, 0, 0.9647059, 1,
0.9500995, -0.2448471, 3.371336, 1, 0, 0.9607843, 1,
0.9514053, -0.1621945, 2.871934, 1, 0, 0.9529412, 1,
0.9533156, -0.09251444, 2.269252, 1, 0, 0.9490196, 1,
0.9535096, 0.615786, 1.374058, 1, 0, 0.9411765, 1,
0.953997, 0.1472697, 1.679774, 1, 0, 0.9372549, 1,
0.9582093, 0.6915397, -0.3529657, 1, 0, 0.9294118, 1,
0.9622248, 0.02170911, 1.759123, 1, 0, 0.9254902, 1,
0.9666067, 0.2126233, 0.9865744, 1, 0, 0.9176471, 1,
0.9751125, 0.4514954, 1.427348, 1, 0, 0.9137255, 1,
0.9759515, 0.1939459, 1.031186, 1, 0, 0.9058824, 1,
0.9790769, -1.605576, 2.140343, 1, 0, 0.9019608, 1,
0.9821903, -0.1742994, 1.931682, 1, 0, 0.8941177, 1,
0.9852011, 0.7293032, 1.708769, 1, 0, 0.8862745, 1,
0.9877314, 0.7522038, -1.315039, 1, 0, 0.8823529, 1,
0.9937655, 0.9176956, 0.2324083, 1, 0, 0.8745098, 1,
0.9983912, 0.1646409, 2.127249, 1, 0, 0.8705882, 1,
1.001355, 0.3486482, 1.199648, 1, 0, 0.8627451, 1,
1.003669, -0.2694781, 1.873498, 1, 0, 0.8588235, 1,
1.007318, -1.328262, 1.87895, 1, 0, 0.8509804, 1,
1.008059, 0.2742626, 2.269476, 1, 0, 0.8470588, 1,
1.009869, -0.02656168, 1.401705, 1, 0, 0.8392157, 1,
1.017137, 1.946378, 1.395961, 1, 0, 0.8352941, 1,
1.020563, -0.193889, 2.214351, 1, 0, 0.827451, 1,
1.026221, 0.526372, 2.519774, 1, 0, 0.8235294, 1,
1.027837, 0.3830731, 0.2399012, 1, 0, 0.8156863, 1,
1.032917, -0.07392555, 0.5011704, 1, 0, 0.8117647, 1,
1.042626, 0.562565, 2.148827, 1, 0, 0.8039216, 1,
1.045616, -0.1938424, 3.313783, 1, 0, 0.7960784, 1,
1.049019, 1.518558, 0.740032, 1, 0, 0.7921569, 1,
1.049648, 0.1318554, 1.608617, 1, 0, 0.7843137, 1,
1.050676, -1.361931, 1.232629, 1, 0, 0.7803922, 1,
1.057485, -0.7962502, 2.681979, 1, 0, 0.772549, 1,
1.06049, 0.1910775, 1.927896, 1, 0, 0.7686275, 1,
1.072463, -1.325037, 3.027432, 1, 0, 0.7607843, 1,
1.073259, 0.4840343, 1.84676, 1, 0, 0.7568628, 1,
1.07748, -0.0528511, 0.6231822, 1, 0, 0.7490196, 1,
1.088168, -0.008562194, 3.658774, 1, 0, 0.7450981, 1,
1.089687, -0.6807551, 1.958656, 1, 0, 0.7372549, 1,
1.10719, 0.9843218, -0.9304788, 1, 0, 0.7333333, 1,
1.113369, -0.1413412, 0.7768815, 1, 0, 0.7254902, 1,
1.125203, -1.01931, 2.511772, 1, 0, 0.7215686, 1,
1.131617, -0.5995479, 1.449072, 1, 0, 0.7137255, 1,
1.152255, -0.9121512, 2.77808, 1, 0, 0.7098039, 1,
1.15593, -0.8592635, 2.44883, 1, 0, 0.7019608, 1,
1.159653, -1.200344, 3.89323, 1, 0, 0.6941177, 1,
1.167547, 0.9768779, -0.8316683, 1, 0, 0.6901961, 1,
1.172714, 1.610223, 0.4507925, 1, 0, 0.682353, 1,
1.175027, 1.01581, -0.9850371, 1, 0, 0.6784314, 1,
1.180506, -0.01581135, 0.1262881, 1, 0, 0.6705883, 1,
1.185938, -0.4972135, 5.126679, 1, 0, 0.6666667, 1,
1.196452, 0.005963478, 1.325748, 1, 0, 0.6588235, 1,
1.199101, 0.6269122, 0.4872139, 1, 0, 0.654902, 1,
1.215281, 1.015523, 2.158264, 1, 0, 0.6470588, 1,
1.216337, 0.1656159, 0.8096077, 1, 0, 0.6431373, 1,
1.217691, -0.5130368, -0.239997, 1, 0, 0.6352941, 1,
1.22519, -1.715022, 2.763739, 1, 0, 0.6313726, 1,
1.228141, 0.3325059, 1.457878, 1, 0, 0.6235294, 1,
1.23729, 0.3168412, 1.333257, 1, 0, 0.6196079, 1,
1.240566, 0.6005756, 1.666485, 1, 0, 0.6117647, 1,
1.241342, 1.048229, -0.2052364, 1, 0, 0.6078432, 1,
1.256766, 1.169001, 1.466853, 1, 0, 0.6, 1,
1.262677, -0.4276317, 2.766918, 1, 0, 0.5921569, 1,
1.278435, 0.9738128, 1.077448, 1, 0, 0.5882353, 1,
1.283928, 1.251358, -1.002015, 1, 0, 0.5803922, 1,
1.294752, 0.2094329, 2.3179, 1, 0, 0.5764706, 1,
1.299793, -0.2886967, 2.898059, 1, 0, 0.5686275, 1,
1.300284, 0.7054942, 2.058662, 1, 0, 0.5647059, 1,
1.302211, 0.3421339, 2.202737, 1, 0, 0.5568628, 1,
1.308333, -0.004225732, 1.069908, 1, 0, 0.5529412, 1,
1.309923, -0.5052696, 1.453085, 1, 0, 0.5450981, 1,
1.326186, -0.3763281, 1.187714, 1, 0, 0.5411765, 1,
1.336113, 0.6515836, -0.3726233, 1, 0, 0.5333334, 1,
1.336295, -0.8304871, 1.494166, 1, 0, 0.5294118, 1,
1.339569, 0.4432763, 2.108348, 1, 0, 0.5215687, 1,
1.350781, -1.024592, 1.836015, 1, 0, 0.5176471, 1,
1.371964, 1.580021, 0.5406127, 1, 0, 0.509804, 1,
1.377153, 0.8684683, 2.246711, 1, 0, 0.5058824, 1,
1.388221, 0.3092018, 0.8851892, 1, 0, 0.4980392, 1,
1.390937, 2.209009, 0.1798851, 1, 0, 0.4901961, 1,
1.391582, 0.508992, 0.7176417, 1, 0, 0.4862745, 1,
1.395354, -1.193762, 1.758298, 1, 0, 0.4784314, 1,
1.402266, -1.201333, 3.474716, 1, 0, 0.4745098, 1,
1.402869, -0.6195617, 2.602839, 1, 0, 0.4666667, 1,
1.416749, 1.20079, -0.5194624, 1, 0, 0.4627451, 1,
1.423831, -1.082494, 1.483374, 1, 0, 0.454902, 1,
1.442127, 0.7103884, 0.2230645, 1, 0, 0.4509804, 1,
1.452716, 0.5019069, 3.296832, 1, 0, 0.4431373, 1,
1.461249, 0.06331211, 1.589214, 1, 0, 0.4392157, 1,
1.462211, 0.3238908, 3.435491, 1, 0, 0.4313726, 1,
1.468785, 1.611958, -0.100453, 1, 0, 0.427451, 1,
1.471516, -1.825734, 1.434258, 1, 0, 0.4196078, 1,
1.472109, -1.015904, 2.07649, 1, 0, 0.4156863, 1,
1.472471, 2.131612, 1.725449, 1, 0, 0.4078431, 1,
1.478441, -2.13552, 2.377574, 1, 0, 0.4039216, 1,
1.480851, 1.213302, 0.7222788, 1, 0, 0.3960784, 1,
1.493979, -0.7297629, 0.6038667, 1, 0, 0.3882353, 1,
1.497763, -1.022135, 0.3297551, 1, 0, 0.3843137, 1,
1.506752, 0.6085738, 0.4411984, 1, 0, 0.3764706, 1,
1.508831, -0.1684902, 1.427368, 1, 0, 0.372549, 1,
1.513884, 1.289286, -0.4918349, 1, 0, 0.3647059, 1,
1.534403, 2.721031, 0.6733336, 1, 0, 0.3607843, 1,
1.540446, -0.2945845, 1.265521, 1, 0, 0.3529412, 1,
1.552846, -0.04364658, 2.637766, 1, 0, 0.3490196, 1,
1.557485, 0.6931073, 0.4901238, 1, 0, 0.3411765, 1,
1.562716, 0.7167812, 1.408679, 1, 0, 0.3372549, 1,
1.571812, 1.603367, 0.1087828, 1, 0, 0.3294118, 1,
1.576458, -1.02093, 1.82713, 1, 0, 0.3254902, 1,
1.577415, 0.4919132, -0.736648, 1, 0, 0.3176471, 1,
1.592917, -0.1477076, 1.383575, 1, 0, 0.3137255, 1,
1.595788, -1.167318, 4.078683, 1, 0, 0.3058824, 1,
1.645954, -0.755282, 2.520183, 1, 0, 0.2980392, 1,
1.660576, 0.06921852, 0.7909984, 1, 0, 0.2941177, 1,
1.669317, 0.6457919, -0.429612, 1, 0, 0.2862745, 1,
1.674687, -0.1424942, 1.476888, 1, 0, 0.282353, 1,
1.696042, 0.9229161, 1.95468, 1, 0, 0.2745098, 1,
1.704725, 0.4414277, 3.230148, 1, 0, 0.2705882, 1,
1.709707, 0.5772773, -0.3481657, 1, 0, 0.2627451, 1,
1.71884, 1.870242, -0.3280321, 1, 0, 0.2588235, 1,
1.729262, 0.1911713, 2.049288, 1, 0, 0.2509804, 1,
1.736962, -0.5424601, 0.1930071, 1, 0, 0.2470588, 1,
1.741617, -0.06823528, 0.8808925, 1, 0, 0.2392157, 1,
1.745772, -0.387008, 2.342907, 1, 0, 0.2352941, 1,
1.755385, 0.724451, -0.07539828, 1, 0, 0.227451, 1,
1.766684, 0.1649998, 2.367115, 1, 0, 0.2235294, 1,
1.788024, -0.5564917, 0.6869334, 1, 0, 0.2156863, 1,
1.807537, -0.2876373, 2.92252, 1, 0, 0.2117647, 1,
1.81657, 0.2076751, -1.046464, 1, 0, 0.2039216, 1,
1.818065, 1.65967, 1.140938, 1, 0, 0.1960784, 1,
1.827138, -0.3410131, 1.683219, 1, 0, 0.1921569, 1,
1.833691, 0.2453917, 0.1201737, 1, 0, 0.1843137, 1,
1.833813, -1.101276, 2.384028, 1, 0, 0.1803922, 1,
1.858472, 0.3655362, -0.06906891, 1, 0, 0.172549, 1,
1.860069, -0.325995, 2.906212, 1, 0, 0.1686275, 1,
1.863524, -0.7129419, 2.517101, 1, 0, 0.1607843, 1,
1.882821, -0.9836982, 2.321947, 1, 0, 0.1568628, 1,
1.951609, -0.1557353, 2.096229, 1, 0, 0.1490196, 1,
1.955332, -2.095561, 1.885064, 1, 0, 0.145098, 1,
1.969667, -0.3082574, 2.282348, 1, 0, 0.1372549, 1,
2.014341, 1.693796, 1.28126, 1, 0, 0.1333333, 1,
2.016357, 0.1510879, 2.488058, 1, 0, 0.1254902, 1,
2.01916, 1.153726, 0.06213963, 1, 0, 0.1215686, 1,
2.021804, -0.3366837, 0.03326679, 1, 0, 0.1137255, 1,
2.022477, -0.5943601, 2.783491, 1, 0, 0.1098039, 1,
2.03728, -0.4771841, 1.089089, 1, 0, 0.1019608, 1,
2.041753, -0.5144798, 1.360767, 1, 0, 0.09411765, 1,
2.045379, 0.5562154, 3.661796, 1, 0, 0.09019608, 1,
2.072507, 1.008919, 0.1989608, 1, 0, 0.08235294, 1,
2.101644, -1.925359, 1.262866, 1, 0, 0.07843138, 1,
2.114861, 0.2546521, 0.484118, 1, 0, 0.07058824, 1,
2.14867, 1.92328, -0.4051303, 1, 0, 0.06666667, 1,
2.150261, -0.2900042, 1.461208, 1, 0, 0.05882353, 1,
2.20167, -0.8596839, 1.747998, 1, 0, 0.05490196, 1,
2.205412, 0.2307999, 2.399166, 1, 0, 0.04705882, 1,
2.219535, -1.996058, 3.793297, 1, 0, 0.04313726, 1,
2.285115, 1.016345, 0.1799468, 1, 0, 0.03529412, 1,
2.33257, -0.2530171, 3.013561, 1, 0, 0.03137255, 1,
2.397144, -0.02869451, 2.964258, 1, 0, 0.02352941, 1,
2.459031, -0.4325716, 4.466872, 1, 0, 0.01960784, 1,
2.550017, -0.7461848, 2.590374, 1, 0, 0.01176471, 1,
2.78383, -1.511161, 1.278616, 1, 0, 0.007843138, 1
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
-0.3142388, -4.270091, -7.048613, 0, -0.5, 0.5, 0.5,
-0.3142388, -4.270091, -7.048613, 1, -0.5, 0.5, 0.5,
-0.3142388, -4.270091, -7.048613, 1, 1.5, 0.5, 0.5,
-0.3142388, -4.270091, -7.048613, 0, 1.5, 0.5, 0.5
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
-4.462554, 0.03803122, -7.048613, 0, -0.5, 0.5, 0.5,
-4.462554, 0.03803122, -7.048613, 1, -0.5, 0.5, 0.5,
-4.462554, 0.03803122, -7.048613, 1, 1.5, 0.5, 0.5,
-4.462554, 0.03803122, -7.048613, 0, 1.5, 0.5, 0.5
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
-4.462554, -4.270091, -0.02109122, 0, -0.5, 0.5, 0.5,
-4.462554, -4.270091, -0.02109122, 1, -0.5, 0.5, 0.5,
-4.462554, -4.270091, -0.02109122, 1, 1.5, 0.5, 0.5,
-4.462554, -4.270091, -0.02109122, 0, 1.5, 0.5, 0.5
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
-3, -3.275909, -5.426877,
2, -3.275909, -5.426877,
-3, -3.275909, -5.426877,
-3, -3.441606, -5.697166,
-2, -3.275909, -5.426877,
-2, -3.441606, -5.697166,
-1, -3.275909, -5.426877,
-1, -3.441606, -5.697166,
0, -3.275909, -5.426877,
0, -3.441606, -5.697166,
1, -3.275909, -5.426877,
1, -3.441606, -5.697166,
2, -3.275909, -5.426877,
2, -3.441606, -5.697166
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
-3, -3.773, -6.237745, 0, -0.5, 0.5, 0.5,
-3, -3.773, -6.237745, 1, -0.5, 0.5, 0.5,
-3, -3.773, -6.237745, 1, 1.5, 0.5, 0.5,
-3, -3.773, -6.237745, 0, 1.5, 0.5, 0.5,
-2, -3.773, -6.237745, 0, -0.5, 0.5, 0.5,
-2, -3.773, -6.237745, 1, -0.5, 0.5, 0.5,
-2, -3.773, -6.237745, 1, 1.5, 0.5, 0.5,
-2, -3.773, -6.237745, 0, 1.5, 0.5, 0.5,
-1, -3.773, -6.237745, 0, -0.5, 0.5, 0.5,
-1, -3.773, -6.237745, 1, -0.5, 0.5, 0.5,
-1, -3.773, -6.237745, 1, 1.5, 0.5, 0.5,
-1, -3.773, -6.237745, 0, 1.5, 0.5, 0.5,
0, -3.773, -6.237745, 0, -0.5, 0.5, 0.5,
0, -3.773, -6.237745, 1, -0.5, 0.5, 0.5,
0, -3.773, -6.237745, 1, 1.5, 0.5, 0.5,
0, -3.773, -6.237745, 0, 1.5, 0.5, 0.5,
1, -3.773, -6.237745, 0, -0.5, 0.5, 0.5,
1, -3.773, -6.237745, 1, -0.5, 0.5, 0.5,
1, -3.773, -6.237745, 1, 1.5, 0.5, 0.5,
1, -3.773, -6.237745, 0, 1.5, 0.5, 0.5,
2, -3.773, -6.237745, 0, -0.5, 0.5, 0.5,
2, -3.773, -6.237745, 1, -0.5, 0.5, 0.5,
2, -3.773, -6.237745, 1, 1.5, 0.5, 0.5,
2, -3.773, -6.237745, 0, 1.5, 0.5, 0.5
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
-3.50525, -3, -5.426877,
-3.50525, 3, -5.426877,
-3.50525, -3, -5.426877,
-3.664801, -3, -5.697166,
-3.50525, -2, -5.426877,
-3.664801, -2, -5.697166,
-3.50525, -1, -5.426877,
-3.664801, -1, -5.697166,
-3.50525, 0, -5.426877,
-3.664801, 0, -5.697166,
-3.50525, 1, -5.426877,
-3.664801, 1, -5.697166,
-3.50525, 2, -5.426877,
-3.664801, 2, -5.697166,
-3.50525, 3, -5.426877,
-3.664801, 3, -5.697166
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
-3.983902, -3, -6.237745, 0, -0.5, 0.5, 0.5,
-3.983902, -3, -6.237745, 1, -0.5, 0.5, 0.5,
-3.983902, -3, -6.237745, 1, 1.5, 0.5, 0.5,
-3.983902, -3, -6.237745, 0, 1.5, 0.5, 0.5,
-3.983902, -2, -6.237745, 0, -0.5, 0.5, 0.5,
-3.983902, -2, -6.237745, 1, -0.5, 0.5, 0.5,
-3.983902, -2, -6.237745, 1, 1.5, 0.5, 0.5,
-3.983902, -2, -6.237745, 0, 1.5, 0.5, 0.5,
-3.983902, -1, -6.237745, 0, -0.5, 0.5, 0.5,
-3.983902, -1, -6.237745, 1, -0.5, 0.5, 0.5,
-3.983902, -1, -6.237745, 1, 1.5, 0.5, 0.5,
-3.983902, -1, -6.237745, 0, 1.5, 0.5, 0.5,
-3.983902, 0, -6.237745, 0, -0.5, 0.5, 0.5,
-3.983902, 0, -6.237745, 1, -0.5, 0.5, 0.5,
-3.983902, 0, -6.237745, 1, 1.5, 0.5, 0.5,
-3.983902, 0, -6.237745, 0, 1.5, 0.5, 0.5,
-3.983902, 1, -6.237745, 0, -0.5, 0.5, 0.5,
-3.983902, 1, -6.237745, 1, -0.5, 0.5, 0.5,
-3.983902, 1, -6.237745, 1, 1.5, 0.5, 0.5,
-3.983902, 1, -6.237745, 0, 1.5, 0.5, 0.5,
-3.983902, 2, -6.237745, 0, -0.5, 0.5, 0.5,
-3.983902, 2, -6.237745, 1, -0.5, 0.5, 0.5,
-3.983902, 2, -6.237745, 1, 1.5, 0.5, 0.5,
-3.983902, 2, -6.237745, 0, 1.5, 0.5, 0.5,
-3.983902, 3, -6.237745, 0, -0.5, 0.5, 0.5,
-3.983902, 3, -6.237745, 1, -0.5, 0.5, 0.5,
-3.983902, 3, -6.237745, 1, 1.5, 0.5, 0.5,
-3.983902, 3, -6.237745, 0, 1.5, 0.5, 0.5
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
-3.50525, -3.275909, -4,
-3.50525, -3.275909, 4,
-3.50525, -3.275909, -4,
-3.664801, -3.441606, -4,
-3.50525, -3.275909, -2,
-3.664801, -3.441606, -2,
-3.50525, -3.275909, 0,
-3.664801, -3.441606, 0,
-3.50525, -3.275909, 2,
-3.664801, -3.441606, 2,
-3.50525, -3.275909, 4,
-3.664801, -3.441606, 4
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
-3.983902, -3.773, -4, 0, -0.5, 0.5, 0.5,
-3.983902, -3.773, -4, 1, -0.5, 0.5, 0.5,
-3.983902, -3.773, -4, 1, 1.5, 0.5, 0.5,
-3.983902, -3.773, -4, 0, 1.5, 0.5, 0.5,
-3.983902, -3.773, -2, 0, -0.5, 0.5, 0.5,
-3.983902, -3.773, -2, 1, -0.5, 0.5, 0.5,
-3.983902, -3.773, -2, 1, 1.5, 0.5, 0.5,
-3.983902, -3.773, -2, 0, 1.5, 0.5, 0.5,
-3.983902, -3.773, 0, 0, -0.5, 0.5, 0.5,
-3.983902, -3.773, 0, 1, -0.5, 0.5, 0.5,
-3.983902, -3.773, 0, 1, 1.5, 0.5, 0.5,
-3.983902, -3.773, 0, 0, 1.5, 0.5, 0.5,
-3.983902, -3.773, 2, 0, -0.5, 0.5, 0.5,
-3.983902, -3.773, 2, 1, -0.5, 0.5, 0.5,
-3.983902, -3.773, 2, 1, 1.5, 0.5, 0.5,
-3.983902, -3.773, 2, 0, 1.5, 0.5, 0.5,
-3.983902, -3.773, 4, 0, -0.5, 0.5, 0.5,
-3.983902, -3.773, 4, 1, -0.5, 0.5, 0.5,
-3.983902, -3.773, 4, 1, 1.5, 0.5, 0.5,
-3.983902, -3.773, 4, 0, 1.5, 0.5, 0.5
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
-3.50525, -3.275909, -5.426877,
-3.50525, 3.351971, -5.426877,
-3.50525, -3.275909, 5.384695,
-3.50525, 3.351971, 5.384695,
-3.50525, -3.275909, -5.426877,
-3.50525, -3.275909, 5.384695,
-3.50525, 3.351971, -5.426877,
-3.50525, 3.351971, 5.384695,
-3.50525, -3.275909, -5.426877,
2.876772, -3.275909, -5.426877,
-3.50525, -3.275909, 5.384695,
2.876772, -3.275909, 5.384695,
-3.50525, 3.351971, -5.426877,
2.876772, 3.351971, -5.426877,
-3.50525, 3.351971, 5.384695,
2.876772, 3.351971, 5.384695,
2.876772, -3.275909, -5.426877,
2.876772, 3.351971, -5.426877,
2.876772, -3.275909, 5.384695,
2.876772, 3.351971, 5.384695,
2.876772, -3.275909, -5.426877,
2.876772, -3.275909, 5.384695,
2.876772, 3.351971, -5.426877,
2.876772, 3.351971, 5.384695
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
var radius = 7.580815;
var distance = 33.7279;
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
mvMatrix.translate( 0.3142388, -0.03803122, 0.02109122 );
mvMatrix.scale( 1.284315, 1.236674, 0.7581252 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.7279);
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
Fenthion<-read.table("Fenthion.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Fenthion$V2
```

```
## Error in eval(expr, envir, enclos): object 'Fenthion' not found
```

```r
y<-Fenthion$V3
```

```
## Error in eval(expr, envir, enclos): object 'Fenthion' not found
```

```r
z<-Fenthion$V4
```

```
## Error in eval(expr, envir, enclos): object 'Fenthion' not found
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
-3.412308, -0.02766141, -0.0009217039, 0, 0, 1, 1, 1,
-3.382452, 0.7429448, 1.422283, 1, 0, 0, 1, 1,
-3.130268, -0.6924032, -1.042448, 1, 0, 0, 1, 1,
-3.054834, -0.3685735, -1.097007, 1, 0, 0, 1, 1,
-2.77443, 1.655651, -0.3189396, 1, 0, 0, 1, 1,
-2.749091, -0.8520409, -0.2438494, 1, 0, 0, 1, 1,
-2.705396, -0.4751038, -2.574158, 0, 0, 0, 1, 1,
-2.614749, 0.4869801, -1.46577, 0, 0, 0, 1, 1,
-2.603648, -0.7754175, -1.060827, 0, 0, 0, 1, 1,
-2.590003, 0.2157125, -1.110098, 0, 0, 0, 1, 1,
-2.544914, -1.634137, -2.216864, 0, 0, 0, 1, 1,
-2.499698, -0.1214614, -1.092674, 0, 0, 0, 1, 1,
-2.41533, -0.8830312, -1.870211, 0, 0, 0, 1, 1,
-2.370427, -0.9838529, -1.975265, 1, 1, 1, 1, 1,
-2.351071, -0.5831852, -1.738997, 1, 1, 1, 1, 1,
-2.349913, 1.127452, -1.719155, 1, 1, 1, 1, 1,
-2.277806, 0.679367, -1.884568, 1, 1, 1, 1, 1,
-2.26981, -0.7443941, -0.4210207, 1, 1, 1, 1, 1,
-2.241235, -0.009442793, -1.846302, 1, 1, 1, 1, 1,
-2.236969, 0.05210036, -0.4198378, 1, 1, 1, 1, 1,
-2.208227, 1.163615, 0.6721948, 1, 1, 1, 1, 1,
-2.202006, 0.714949, -1.87739, 1, 1, 1, 1, 1,
-2.185078, -0.2890758, -2.744075, 1, 1, 1, 1, 1,
-2.119533, 1.202194, -0.9738188, 1, 1, 1, 1, 1,
-2.108733, -0.5451013, -0.8462031, 1, 1, 1, 1, 1,
-2.100277, -1.633611, -2.271454, 1, 1, 1, 1, 1,
-2.07577, -1.132394, -1.39924, 1, 1, 1, 1, 1,
-2.073874, -0.1750881, -1.984374, 1, 1, 1, 1, 1,
-2.065891, -1.028485, -0.7827882, 0, 0, 1, 1, 1,
-2.027892, -0.7040762, -1.348655, 1, 0, 0, 1, 1,
-2.007419, -0.406794, -1.933025, 1, 0, 0, 1, 1,
-1.985973, 0.6301581, -3.400963, 1, 0, 0, 1, 1,
-1.979096, 0.07080182, -0.08319168, 1, 0, 0, 1, 1,
-1.967725, -0.5218828, -1.225501, 1, 0, 0, 1, 1,
-1.941929, -0.549875, -2.3239, 0, 0, 0, 1, 1,
-1.929501, 0.002173838, -1.591207, 0, 0, 0, 1, 1,
-1.927529, 0.2847212, -0.6416929, 0, 0, 0, 1, 1,
-1.919683, 0.8324896, -2.066815, 0, 0, 0, 1, 1,
-1.912997, 0.9436392, -0.8048632, 0, 0, 0, 1, 1,
-1.894929, 1.638821, 0.9254395, 0, 0, 0, 1, 1,
-1.891693, -2.658514, -2.197607, 0, 0, 0, 1, 1,
-1.879767, 0.0483577, -0.7062179, 1, 1, 1, 1, 1,
-1.858229, -2.463287, -3.165465, 1, 1, 1, 1, 1,
-1.846513, -0.9890462, -2.340845, 1, 1, 1, 1, 1,
-1.83723, -0.4616349, -4.182583, 1, 1, 1, 1, 1,
-1.781714, -1.782851, -1.756414, 1, 1, 1, 1, 1,
-1.770927, -0.04846749, -1.754528, 1, 1, 1, 1, 1,
-1.761262, -0.5266436, -1.189981, 1, 1, 1, 1, 1,
-1.760291, 0.1914299, -0.4633096, 1, 1, 1, 1, 1,
-1.717777, -1.148826, -1.484141, 1, 1, 1, 1, 1,
-1.715423, -0.673641, -2.636947, 1, 1, 1, 1, 1,
-1.667986, 2.070129, -0.06695336, 1, 1, 1, 1, 1,
-1.655851, 0.7301409, -1.232169, 1, 1, 1, 1, 1,
-1.616704, -0.7234921, -2.42643, 1, 1, 1, 1, 1,
-1.616352, -1.478045, -2.885767, 1, 1, 1, 1, 1,
-1.596753, -1.836717, -2.528691, 1, 1, 1, 1, 1,
-1.586257, -1.055988, -3.406817, 0, 0, 1, 1, 1,
-1.578275, -1.847343, -2.529345, 1, 0, 0, 1, 1,
-1.555598, 2.738709, -0.478015, 1, 0, 0, 1, 1,
-1.555339, 0.5344383, -1.98814, 1, 0, 0, 1, 1,
-1.540146, -0.4884022, -1.717031, 1, 0, 0, 1, 1,
-1.533388, 0.1402741, -1.921197, 1, 0, 0, 1, 1,
-1.527568, -2.516076, -3.708453, 0, 0, 0, 1, 1,
-1.5213, -0.2605431, -1.263343, 0, 0, 0, 1, 1,
-1.516405, -1.983015, -3.776313, 0, 0, 0, 1, 1,
-1.515058, -0.2111929, -1.680752, 0, 0, 0, 1, 1,
-1.50797, -1.595347, -2.633749, 0, 0, 0, 1, 1,
-1.502174, -0.9273729, -1.101427, 0, 0, 0, 1, 1,
-1.500312, -0.163628, -1.09606, 0, 0, 0, 1, 1,
-1.485951, -0.1955455, -1.002744, 1, 1, 1, 1, 1,
-1.485535, -1.665003, -2.58732, 1, 1, 1, 1, 1,
-1.480875, -0.6060917, -2.605754, 1, 1, 1, 1, 1,
-1.476229, -2.089778, -2.172724, 1, 1, 1, 1, 1,
-1.475086, -0.1399232, -2.446029, 1, 1, 1, 1, 1,
-1.474011, 1.534397, -1.660368, 1, 1, 1, 1, 1,
-1.467149, -1.294957, -1.997021, 1, 1, 1, 1, 1,
-1.463784, -0.252265, -2.838049, 1, 1, 1, 1, 1,
-1.456128, 0.009543273, -1.530803, 1, 1, 1, 1, 1,
-1.449002, -0.3060775, -2.034923, 1, 1, 1, 1, 1,
-1.436138, 0.3925889, -3.611578, 1, 1, 1, 1, 1,
-1.426993, -0.140292, -2.765838, 1, 1, 1, 1, 1,
-1.423748, -0.3738291, -1.791027, 1, 1, 1, 1, 1,
-1.40389, -0.1061956, -0.6466345, 1, 1, 1, 1, 1,
-1.401394, -0.6274669, -2.16261, 1, 1, 1, 1, 1,
-1.399659, 0.2318988, -1.988921, 0, 0, 1, 1, 1,
-1.38442, -1.170013, -2.648712, 1, 0, 0, 1, 1,
-1.383417, -0.3713865, -1.538833, 1, 0, 0, 1, 1,
-1.376106, 0.6887285, -0.1876011, 1, 0, 0, 1, 1,
-1.369354, 1.053519, 1.340586, 1, 0, 0, 1, 1,
-1.35882, -0.0512114, -0.5659622, 1, 0, 0, 1, 1,
-1.356564, 0.2425146, -0.827455, 0, 0, 0, 1, 1,
-1.354751, -0.3263007, -2.348112, 0, 0, 0, 1, 1,
-1.336837, -1.502799, -2.162023, 0, 0, 0, 1, 1,
-1.33559, -1.311893, -2.198006, 0, 0, 0, 1, 1,
-1.334427, 1.486258, -2.649447, 0, 0, 0, 1, 1,
-1.322299, -1.3348, -2.023623, 0, 0, 0, 1, 1,
-1.321291, 2.268104, -1.623063, 0, 0, 0, 1, 1,
-1.320596, 0.6426402, -0.6203716, 1, 1, 1, 1, 1,
-1.31962, -0.6030965, -1.811015, 1, 1, 1, 1, 1,
-1.317456, -0.6147411, -2.010542, 1, 1, 1, 1, 1,
-1.291783, 0.1899753, -0.7399601, 1, 1, 1, 1, 1,
-1.289647, -1.303919, -5.269427, 1, 1, 1, 1, 1,
-1.287625, -1.96349, -2.545554, 1, 1, 1, 1, 1,
-1.279622, -1.134523, -2.290183, 1, 1, 1, 1, 1,
-1.26973, 0.2904605, -1.129135, 1, 1, 1, 1, 1,
-1.267653, -0.7936358, -1.82559, 1, 1, 1, 1, 1,
-1.267243, -0.9354159, -2.951749, 1, 1, 1, 1, 1,
-1.264305, -1.351235, -1.181217, 1, 1, 1, 1, 1,
-1.258512, 1.068482, -0.3140223, 1, 1, 1, 1, 1,
-1.258351, 0.9289795, -0.4416513, 1, 1, 1, 1, 1,
-1.25658, -1.027416, -2.931688, 1, 1, 1, 1, 1,
-1.256009, 2.675877, -0.8451182, 1, 1, 1, 1, 1,
-1.255744, 0.6980964, -1.473924, 0, 0, 1, 1, 1,
-1.253365, -1.246245, -2.275617, 1, 0, 0, 1, 1,
-1.245155, 1.669517, -2.294113, 1, 0, 0, 1, 1,
-1.239653, -0.6914952, -1.6804, 1, 0, 0, 1, 1,
-1.23426, -1.249701, -2.096562, 1, 0, 0, 1, 1,
-1.23176, -0.4001196, -1.849415, 1, 0, 0, 1, 1,
-1.226637, 0.5221941, -2.586973, 0, 0, 0, 1, 1,
-1.22282, 1.454012, -2.520167, 0, 0, 0, 1, 1,
-1.220685, -0.3535352, -3.701603, 0, 0, 0, 1, 1,
-1.217741, -0.1080092, -3.559155, 0, 0, 0, 1, 1,
-1.21104, -1.228844, -2.351382, 0, 0, 0, 1, 1,
-1.209603, -3.179386, -3.389715, 0, 0, 0, 1, 1,
-1.194554, -0.3629208, -2.540124, 0, 0, 0, 1, 1,
-1.193469, 1.412889, 0.2778375, 1, 1, 1, 1, 1,
-1.192639, 0.6054577, -0.3101303, 1, 1, 1, 1, 1,
-1.191985, -0.3017067, -1.523938, 1, 1, 1, 1, 1,
-1.191347, -0.3047575, 0.2552046, 1, 1, 1, 1, 1,
-1.184269, -0.7211953, -3.081209, 1, 1, 1, 1, 1,
-1.17458, -0.0202904, -2.086541, 1, 1, 1, 1, 1,
-1.171945, 1.697854, -2.150739, 1, 1, 1, 1, 1,
-1.171358, 1.383241, -1.503346, 1, 1, 1, 1, 1,
-1.162923, -0.9713824, -3.827287, 1, 1, 1, 1, 1,
-1.16207, 0.1454094, -0.8280876, 1, 1, 1, 1, 1,
-1.161106, -0.3866052, -1.7358, 1, 1, 1, 1, 1,
-1.160352, -0.6620395, -1.744919, 1, 1, 1, 1, 1,
-1.159022, 1.580897, -2.237787, 1, 1, 1, 1, 1,
-1.157824, -1.209859, -4.067608, 1, 1, 1, 1, 1,
-1.155806, -0.4397767, -1.345898, 1, 1, 1, 1, 1,
-1.150902, 2.00875, -0.8861894, 0, 0, 1, 1, 1,
-1.148916, -1.144055, -3.309062, 1, 0, 0, 1, 1,
-1.147505, 0.8830339, -1.016071, 1, 0, 0, 1, 1,
-1.141101, 0.7984919, 0.2148377, 1, 0, 0, 1, 1,
-1.097205, 0.2450114, -1.045692, 1, 0, 0, 1, 1,
-1.09239, -0.5522961, -1.539778, 1, 0, 0, 1, 1,
-1.087375, -0.809105, -3.071206, 0, 0, 0, 1, 1,
-1.087209, -0.7738169, -1.101195, 0, 0, 0, 1, 1,
-1.080233, 0.2581393, -2.964321, 0, 0, 0, 1, 1,
-1.063852, 0.09332868, -2.281292, 0, 0, 0, 1, 1,
-1.06152, 0.04464456, -2.004617, 0, 0, 0, 1, 1,
-1.053577, 0.3078049, 0.4862864, 0, 0, 0, 1, 1,
-1.047904, 0.6528893, -1.279023, 0, 0, 0, 1, 1,
-1.040172, 1.590632, -1.254469, 1, 1, 1, 1, 1,
-1.039841, -0.1471958, -2.406008, 1, 1, 1, 1, 1,
-1.035553, 0.4650973, -1.460145, 1, 1, 1, 1, 1,
-1.035448, -0.8829783, -1.641285, 1, 1, 1, 1, 1,
-1.022439, 0.2272746, -2.096126, 1, 1, 1, 1, 1,
-1.01985, -0.4700896, -2.30478, 1, 1, 1, 1, 1,
-1.015999, 0.9640024, -2.144926, 1, 1, 1, 1, 1,
-1.008513, -0.3669351, -3.696534, 1, 1, 1, 1, 1,
-1.007877, 0.3732181, -3.737216, 1, 1, 1, 1, 1,
-1.007069, 0.306752, -1.416322, 1, 1, 1, 1, 1,
-1.000875, -1.27865, -2.442712, 1, 1, 1, 1, 1,
-0.9996802, -0.6537684, -3.224782, 1, 1, 1, 1, 1,
-0.9914536, 0.1513976, -0.3973473, 1, 1, 1, 1, 1,
-0.9902916, 0.4477269, -0.612858, 1, 1, 1, 1, 1,
-0.9902831, -1.122186, -1.364756, 1, 1, 1, 1, 1,
-0.9798934, 0.3405026, -1.995515, 0, 0, 1, 1, 1,
-0.9607751, 0.3350413, -0.6599342, 1, 0, 0, 1, 1,
-0.9519742, 0.3700819, -0.8333749, 1, 0, 0, 1, 1,
-0.9517441, 1.535783, 0.03787422, 1, 0, 0, 1, 1,
-0.9428671, -0.7367292, -2.122854, 1, 0, 0, 1, 1,
-0.9426935, -1.122521, -2.803088, 1, 0, 0, 1, 1,
-0.941204, -0.4870077, -0.8862218, 0, 0, 0, 1, 1,
-0.9334697, -0.1425078, -1.619562, 0, 0, 0, 1, 1,
-0.9240422, 0.6163377, -0.8422058, 0, 0, 0, 1, 1,
-0.9237163, 1.146066, -0.8513228, 0, 0, 0, 1, 1,
-0.9199463, -1.116829, -2.945027, 0, 0, 0, 1, 1,
-0.910094, 0.3536052, -0.6191624, 0, 0, 0, 1, 1,
-0.9069108, -0.190227, -1.38691, 0, 0, 0, 1, 1,
-0.9064792, -0.0004520917, -1.644181, 1, 1, 1, 1, 1,
-0.904802, 0.1077157, -1.089697, 1, 1, 1, 1, 1,
-0.904408, -1.412454, -2.622967, 1, 1, 1, 1, 1,
-0.9036419, 1.921753, -0.8446186, 1, 1, 1, 1, 1,
-0.8991891, 0.9994224, -0.7292916, 1, 1, 1, 1, 1,
-0.8940818, 0.07088488, -1.8623, 1, 1, 1, 1, 1,
-0.8936216, -0.7611449, -2.131285, 1, 1, 1, 1, 1,
-0.8788218, -1.467432, -2.20501, 1, 1, 1, 1, 1,
-0.8773248, 0.6053193, -0.7484835, 1, 1, 1, 1, 1,
-0.8736702, 0.6101906, -0.6464116, 1, 1, 1, 1, 1,
-0.8664218, 0.6697735, -1.580951, 1, 1, 1, 1, 1,
-0.8629089, 0.6911037, -0.2450435, 1, 1, 1, 1, 1,
-0.8614611, 0.3267797, -1.106339, 1, 1, 1, 1, 1,
-0.8613436, -2.409037, -2.213641, 1, 1, 1, 1, 1,
-0.8577892, -1.965825, -2.572736, 1, 1, 1, 1, 1,
-0.8449948, -0.2396149, -2.495283, 0, 0, 1, 1, 1,
-0.8425171, 0.079339, -0.3972039, 1, 0, 0, 1, 1,
-0.8414021, -0.7771365, -3.83062, 1, 0, 0, 1, 1,
-0.8408206, -1.604023, -1.595124, 1, 0, 0, 1, 1,
-0.8403416, 1.951988, -1.076669, 1, 0, 0, 1, 1,
-0.8393742, 1.782589, 0.2850423, 1, 0, 0, 1, 1,
-0.8383958, -0.5386848, -1.358217, 0, 0, 0, 1, 1,
-0.8292426, -0.2395633, -2.429665, 0, 0, 0, 1, 1,
-0.8274587, -1.456708, -1.50885, 0, 0, 0, 1, 1,
-0.8263415, -0.5472022, -3.089885, 0, 0, 0, 1, 1,
-0.8257143, 0.1488649, -3.482895, 0, 0, 0, 1, 1,
-0.818411, 0.2523908, -1.316906, 0, 0, 0, 1, 1,
-0.8179266, 0.5953251, -0.2331381, 0, 0, 0, 1, 1,
-0.8130053, 0.9666924, -2.591987, 1, 1, 1, 1, 1,
-0.8125152, 0.7709101, -1.627757, 1, 1, 1, 1, 1,
-0.8115923, -2.346978, -2.137746, 1, 1, 1, 1, 1,
-0.8084614, -1.036951, -2.953773, 1, 1, 1, 1, 1,
-0.8079205, 0.4743813, -0.3015895, 1, 1, 1, 1, 1,
-0.8054147, 0.3168728, -0.8664654, 1, 1, 1, 1, 1,
-0.8038493, -0.1859456, -3.085289, 1, 1, 1, 1, 1,
-0.8038486, 2.014629, -0.4734659, 1, 1, 1, 1, 1,
-0.8035701, -0.7708257, -3.102782, 1, 1, 1, 1, 1,
-0.8034795, -1.039202, -2.591546, 1, 1, 1, 1, 1,
-0.8033789, 0.1840815, -3.153942, 1, 1, 1, 1, 1,
-0.7885752, 1.71414, -0.7718015, 1, 1, 1, 1, 1,
-0.7859769, -1.454339, -2.114269, 1, 1, 1, 1, 1,
-0.7857404, 0.1403835, -1.622916, 1, 1, 1, 1, 1,
-0.7846241, -0.1192275, -1.951537, 1, 1, 1, 1, 1,
-0.7827982, 0.7750875, -0.8696873, 0, 0, 1, 1, 1,
-0.7776093, -0.4143658, -0.7897102, 1, 0, 0, 1, 1,
-0.7744652, -1.070097, -2.310184, 1, 0, 0, 1, 1,
-0.7731421, 0.1867905, -1.253637, 1, 0, 0, 1, 1,
-0.7705883, -1.690578, -1.517065, 1, 0, 0, 1, 1,
-0.7660154, -0.3493797, -3.019059, 1, 0, 0, 1, 1,
-0.7619235, -1.2444, -2.96707, 0, 0, 0, 1, 1,
-0.7601568, 0.3991935, -0.5484592, 0, 0, 0, 1, 1,
-0.7576811, 0.5869789, -0.2302388, 0, 0, 0, 1, 1,
-0.7483428, 0.05889552, -0.7439677, 0, 0, 0, 1, 1,
-0.7477073, -0.3729137, -1.902194, 0, 0, 0, 1, 1,
-0.7458667, -0.4670377, -1.385451, 0, 0, 0, 1, 1,
-0.7383044, 0.2639698, -0.9956329, 0, 0, 0, 1, 1,
-0.7326037, -1.682205, -2.619337, 1, 1, 1, 1, 1,
-0.7272921, 0.008378563, -0.2001907, 1, 1, 1, 1, 1,
-0.7266452, 0.4203276, -1.799241, 1, 1, 1, 1, 1,
-0.724751, 1.997201, -1.64177, 1, 1, 1, 1, 1,
-0.7227071, -0.8719676, -4.773089, 1, 1, 1, 1, 1,
-0.7158599, 0.6096322, -0.6650642, 1, 1, 1, 1, 1,
-0.7157357, 0.04330884, -1.819683, 1, 1, 1, 1, 1,
-0.7146693, 0.8196052, -0.702978, 1, 1, 1, 1, 1,
-0.7141816, -2.018857, -4.638147, 1, 1, 1, 1, 1,
-0.7110116, 0.06920919, -0.581748, 1, 1, 1, 1, 1,
-0.707673, 0.5474411, -1.23104, 1, 1, 1, 1, 1,
-0.7074955, -0.3798501, -3.840683, 1, 1, 1, 1, 1,
-0.7063031, 0.8047618, -0.2173547, 1, 1, 1, 1, 1,
-0.7046534, 0.9863912, -0.01147917, 1, 1, 1, 1, 1,
-0.6950335, 0.4943839, -1.40438, 1, 1, 1, 1, 1,
-0.6860026, 0.926161, -0.1602036, 0, 0, 1, 1, 1,
-0.6822403, -0.8125694, -0.8242897, 1, 0, 0, 1, 1,
-0.6808346, -0.5104542, -0.1502676, 1, 0, 0, 1, 1,
-0.6752937, -0.06242437, -2.193011, 1, 0, 0, 1, 1,
-0.6746228, 0.003745196, -1.110088, 1, 0, 0, 1, 1,
-0.672612, -0.05156845, -0.3939327, 1, 0, 0, 1, 1,
-0.6718888, -1.364059, -1.922341, 0, 0, 0, 1, 1,
-0.6645205, 0.1547716, -0.9967501, 0, 0, 0, 1, 1,
-0.6586248, -0.0471657, -0.37713, 0, 0, 0, 1, 1,
-0.6519335, -1.191765, -2.548312, 0, 0, 0, 1, 1,
-0.6499382, 0.6918382, 1.143917, 0, 0, 0, 1, 1,
-0.6491424, -0.8743315, -3.162335, 0, 0, 0, 1, 1,
-0.6487207, 0.9264523, -1.659481, 0, 0, 0, 1, 1,
-0.647252, -0.6320229, -2.865212, 1, 1, 1, 1, 1,
-0.6468893, -0.859938, -2.970376, 1, 1, 1, 1, 1,
-0.6454356, 0.4233567, -1.973185, 1, 1, 1, 1, 1,
-0.6427678, 0.3874583, -1.653534, 1, 1, 1, 1, 1,
-0.6411922, 1.870901, -0.2568513, 1, 1, 1, 1, 1,
-0.6402296, -0.8989357, -0.8856785, 1, 1, 1, 1, 1,
-0.6352264, -0.6493095, -1.537559, 1, 1, 1, 1, 1,
-0.6261774, -2.269625, -1.731765, 1, 1, 1, 1, 1,
-0.6236217, -0.3240276, -0.4499506, 1, 1, 1, 1, 1,
-0.6204824, 1.117086, 0.00931161, 1, 1, 1, 1, 1,
-0.6197243, -0.9315011, -2.71406, 1, 1, 1, 1, 1,
-0.6195228, 0.8073974, -0.9025732, 1, 1, 1, 1, 1,
-0.6147116, 0.7442697, -1.91725, 1, 1, 1, 1, 1,
-0.6127746, 0.7337418, -0.3528881, 1, 1, 1, 1, 1,
-0.6121857, -0.1767659, -0.01962519, 1, 1, 1, 1, 1,
-0.6100898, 0.8132265, 1.164671, 0, 0, 1, 1, 1,
-0.6064944, -1.257653, -4.088553, 1, 0, 0, 1, 1,
-0.606061, 0.3233798, -0.7952376, 1, 0, 0, 1, 1,
-0.6034455, -0.08198941, -1.461335, 1, 0, 0, 1, 1,
-0.5988804, -1.561119, -3.217711, 1, 0, 0, 1, 1,
-0.5944304, 0.8842683, 0.7988813, 1, 0, 0, 1, 1,
-0.5940717, 1.19007, 0.4765433, 0, 0, 0, 1, 1,
-0.5935557, 0.8990635, 0.1823089, 0, 0, 0, 1, 1,
-0.5889997, -0.675869, -1.893061, 0, 0, 0, 1, 1,
-0.5829425, -0.72933, -2.446362, 0, 0, 0, 1, 1,
-0.5821813, -0.0017304, -2.47833, 0, 0, 0, 1, 1,
-0.5808388, 0.09514751, -0.4917033, 0, 0, 0, 1, 1,
-0.5774111, 0.05717605, -4.198935, 0, 0, 0, 1, 1,
-0.5772479, -0.5034334, -1.300943, 1, 1, 1, 1, 1,
-0.5746265, 0.1865505, -1.814468, 1, 1, 1, 1, 1,
-0.5744101, 0.7805441, -0.08527782, 1, 1, 1, 1, 1,
-0.574352, 1.419206, -1.012807, 1, 1, 1, 1, 1,
-0.5731596, 0.3832429, -1.31718, 1, 1, 1, 1, 1,
-0.5730497, -1.732068, -2.027632, 1, 1, 1, 1, 1,
-0.5697641, -0.7409196, -1.271408, 1, 1, 1, 1, 1,
-0.5695382, -0.7955353, -4.275395, 1, 1, 1, 1, 1,
-0.5645329, 0.4670841, 0.3243898, 1, 1, 1, 1, 1,
-0.5601629, 1.535742, -1.333715, 1, 1, 1, 1, 1,
-0.5528269, 0.2475798, 0.04007959, 1, 1, 1, 1, 1,
-0.5497724, -0.2772169, -2.268339, 1, 1, 1, 1, 1,
-0.5495513, 0.8745979, -2.272802, 1, 1, 1, 1, 1,
-0.5481868, 3.255449, -2.190958, 1, 1, 1, 1, 1,
-0.5448084, 0.04034625, -1.94979, 1, 1, 1, 1, 1,
-0.5436289, 0.3363724, -0.9867376, 0, 0, 1, 1, 1,
-0.5390555, 0.06630135, -0.01819748, 1, 0, 0, 1, 1,
-0.5365725, -0.4888957, -0.6014445, 1, 0, 0, 1, 1,
-0.5310252, 0.07821108, -2.215407, 1, 0, 0, 1, 1,
-0.5309663, 0.1415339, -2.495846, 1, 0, 0, 1, 1,
-0.528797, -0.701661, -1.377424, 1, 0, 0, 1, 1,
-0.5222145, -2.538977, -2.754371, 0, 0, 0, 1, 1,
-0.520448, -1.911084, -3.843634, 0, 0, 0, 1, 1,
-0.5192648, -1.883311, -2.884339, 0, 0, 0, 1, 1,
-0.5146459, 1.367717, 1.421732, 0, 0, 0, 1, 1,
-0.5143945, 0.881626, -0.3071642, 0, 0, 0, 1, 1,
-0.5113906, -0.6370241, -2.576069, 0, 0, 0, 1, 1,
-0.5079253, -1.130389, -2.344921, 0, 0, 0, 1, 1,
-0.5070243, -1.291115, -2.928192, 1, 1, 1, 1, 1,
-0.5055168, 0.2280627, -1.617145, 1, 1, 1, 1, 1,
-0.4995931, 2.354811, -0.3552883, 1, 1, 1, 1, 1,
-0.4949946, 1.48202, 0.4938616, 1, 1, 1, 1, 1,
-0.4916764, 0.6306299, -2.201771, 1, 1, 1, 1, 1,
-0.490835, 0.3762428, -0.7733344, 1, 1, 1, 1, 1,
-0.4902089, 0.03560459, -1.279886, 1, 1, 1, 1, 1,
-0.4898762, 1.303189, -0.5213755, 1, 1, 1, 1, 1,
-0.4871495, -1.932866, -2.525897, 1, 1, 1, 1, 1,
-0.486489, 1.166683, 0.1245219, 1, 1, 1, 1, 1,
-0.4824182, -1.157585, -3.061258, 1, 1, 1, 1, 1,
-0.4796057, -0.3337232, -1.021732, 1, 1, 1, 1, 1,
-0.4754826, 0.02697982, -0.8987887, 1, 1, 1, 1, 1,
-0.4721777, 1.462313, 0.3004576, 1, 1, 1, 1, 1,
-0.4697822, 1.103052, -1.026339, 1, 1, 1, 1, 1,
-0.4694049, -0.2920262, -4.524139, 0, 0, 1, 1, 1,
-0.4641165, -0.9785849, -2.27887, 1, 0, 0, 1, 1,
-0.4621436, 1.236139, -1.090566, 1, 0, 0, 1, 1,
-0.4608189, 0.06877346, -2.106109, 1, 0, 0, 1, 1,
-0.4564082, 1.046964, -0.8542996, 1, 0, 0, 1, 1,
-0.4551157, 0.7162262, -0.5872399, 1, 0, 0, 1, 1,
-0.4507033, -0.5759034, -3.041919, 0, 0, 0, 1, 1,
-0.4477156, -0.7899671, -3.582014, 0, 0, 0, 1, 1,
-0.4476363, 0.1551865, -2.013093, 0, 0, 0, 1, 1,
-0.4466239, -0.3368675, -1.866657, 0, 0, 0, 1, 1,
-0.4415584, -1.87244, -5.136219, 0, 0, 0, 1, 1,
-0.4401979, 1.120544, 0.5232527, 0, 0, 0, 1, 1,
-0.4288838, -0.0657323, -2.086926, 0, 0, 0, 1, 1,
-0.4284051, 1.053455, -1.3293, 1, 1, 1, 1, 1,
-0.4282138, 0.009458246, -2.561435, 1, 1, 1, 1, 1,
-0.4279048, -0.3183536, -1.691164, 1, 1, 1, 1, 1,
-0.4275994, -1.226604, -1.533589, 1, 1, 1, 1, 1,
-0.4264106, 0.3940074, -0.6522327, 1, 1, 1, 1, 1,
-0.4241697, 0.8319573, -0.9437101, 1, 1, 1, 1, 1,
-0.4198289, 2.357816, -0.3554657, 1, 1, 1, 1, 1,
-0.4170223, -0.3354752, -2.274473, 1, 1, 1, 1, 1,
-0.4092566, 0.6271557, -2.534978, 1, 1, 1, 1, 1,
-0.4092081, -0.6345421, -3.3646, 1, 1, 1, 1, 1,
-0.4053245, 0.0248418, -3.0156, 1, 1, 1, 1, 1,
-0.4044098, -1.691114, -3.671368, 1, 1, 1, 1, 1,
-0.4036151, -0.02694708, -3.906067, 1, 1, 1, 1, 1,
-0.4035561, -2.210614, -3.959383, 1, 1, 1, 1, 1,
-0.400625, 0.5614996, -0.6065366, 1, 1, 1, 1, 1,
-0.3971509, 0.4723529, 0.02651806, 0, 0, 1, 1, 1,
-0.3951371, -1.59861, -3.690803, 1, 0, 0, 1, 1,
-0.3856678, 0.512998, 0.2553285, 1, 0, 0, 1, 1,
-0.3843915, -0.5159903, -1.682313, 1, 0, 0, 1, 1,
-0.3839832, 1.049498, -1.596159, 1, 0, 0, 1, 1,
-0.3837859, 0.313032, -1.992308, 1, 0, 0, 1, 1,
-0.380986, 0.4246342, -1.193221, 0, 0, 0, 1, 1,
-0.3806942, 0.2416362, -2.153466, 0, 0, 0, 1, 1,
-0.3663383, -2.138041, -2.414081, 0, 0, 0, 1, 1,
-0.3661432, -1.808064, -2.532637, 0, 0, 0, 1, 1,
-0.3640058, -0.5903752, -2.481702, 0, 0, 0, 1, 1,
-0.3602897, 0.7731494, -0.06960154, 0, 0, 0, 1, 1,
-0.3565334, -0.02480196, 0.3705649, 0, 0, 0, 1, 1,
-0.3557945, -0.2235712, -2.14518, 1, 1, 1, 1, 1,
-0.3506055, 0.3950937, -1.624365, 1, 1, 1, 1, 1,
-0.3486203, 1.011835, -0.1677072, 1, 1, 1, 1, 1,
-0.348608, -0.2392894, -2.551861, 1, 1, 1, 1, 1,
-0.3456141, 1.057237, -0.8166546, 1, 1, 1, 1, 1,
-0.3451248, 0.3567028, 0.06131541, 1, 1, 1, 1, 1,
-0.3442906, 0.5007569, -1.281802, 1, 1, 1, 1, 1,
-0.3435638, 0.4234118, -0.5477613, 1, 1, 1, 1, 1,
-0.3399843, -0.7319899, -3.307509, 1, 1, 1, 1, 1,
-0.338366, 1.380628, -0.6870261, 1, 1, 1, 1, 1,
-0.3319423, -0.4917346, -1.880495, 1, 1, 1, 1, 1,
-0.3286642, -0.7396955, -3.828636, 1, 1, 1, 1, 1,
-0.3286191, -0.1449301, -1.678519, 1, 1, 1, 1, 1,
-0.3277586, 0.8471941, -0.4601484, 1, 1, 1, 1, 1,
-0.3250661, -1.052891, -3.681216, 1, 1, 1, 1, 1,
-0.3226362, -0.4962031, -2.276193, 0, 0, 1, 1, 1,
-0.3223349, -0.1482719, -3.328717, 1, 0, 0, 1, 1,
-0.3201219, 0.3266777, 1.024858, 1, 0, 0, 1, 1,
-0.3149162, 1.252141, -0.871951, 1, 0, 0, 1, 1,
-0.3145457, -0.967809, -2.053584, 1, 0, 0, 1, 1,
-0.3100802, 1.436098, -0.4656368, 1, 0, 0, 1, 1,
-0.3066872, 0.1265849, -2.539745, 0, 0, 0, 1, 1,
-0.3049881, -0.007811735, -1.275675, 0, 0, 0, 1, 1,
-0.2993545, 0.9892493, -0.1861701, 0, 0, 0, 1, 1,
-0.2985227, -0.555738, -4.431022, 0, 0, 0, 1, 1,
-0.2976729, -1.377737, -3.680601, 0, 0, 0, 1, 1,
-0.2975271, 0.7690173, 0.2926083, 0, 0, 0, 1, 1,
-0.2907221, 0.2898629, -1.384358, 0, 0, 0, 1, 1,
-0.2883582, -1.107403, -3.840655, 1, 1, 1, 1, 1,
-0.2844997, -1.860067, -2.680595, 1, 1, 1, 1, 1,
-0.2797498, -0.3673047, -1.436041, 1, 1, 1, 1, 1,
-0.279482, -1.124013, -2.923125, 1, 1, 1, 1, 1,
-0.278635, -0.3671153, -2.396752, 1, 1, 1, 1, 1,
-0.2764801, 0.4725764, -1.011102, 1, 1, 1, 1, 1,
-0.2760415, 0.4589099, -0.1793847, 1, 1, 1, 1, 1,
-0.2752479, -1.949555, -4.690197, 1, 1, 1, 1, 1,
-0.2722811, 0.3548687, -0.9632472, 1, 1, 1, 1, 1,
-0.270434, -0.7735969, -3.199692, 1, 1, 1, 1, 1,
-0.261782, -0.2554769, -2.8048, 1, 1, 1, 1, 1,
-0.2617199, -0.2924411, -2.155011, 1, 1, 1, 1, 1,
-0.2593352, -0.6916638, -1.832618, 1, 1, 1, 1, 1,
-0.2553041, 0.5067786, 0.4655792, 1, 1, 1, 1, 1,
-0.2528513, -0.5295995, -2.825152, 1, 1, 1, 1, 1,
-0.2520385, 0.790147, -0.2059559, 0, 0, 1, 1, 1,
-0.2386061, 1.874275, 0.1264242, 1, 0, 0, 1, 1,
-0.2356246, -0.6176553, -3.432774, 1, 0, 0, 1, 1,
-0.2314213, -0.1829791, -1.868937, 1, 0, 0, 1, 1,
-0.2310325, 1.976913, 0.2550025, 1, 0, 0, 1, 1,
-0.223, -1.295325, -3.041567, 1, 0, 0, 1, 1,
-0.2139562, 0.5108218, -0.1768182, 0, 0, 0, 1, 1,
-0.2084789, -0.2470556, -1.32498, 0, 0, 0, 1, 1,
-0.2083423, 0.8359119, -0.2282214, 0, 0, 0, 1, 1,
-0.2067309, 0.2226151, -0.5244085, 0, 0, 0, 1, 1,
-0.2061598, 0.1135643, -0.5525061, 0, 0, 0, 1, 1,
-0.2014255, -0.668165, -4.109663, 0, 0, 0, 1, 1,
-0.1910703, -0.2143984, -1.032488, 0, 0, 0, 1, 1,
-0.1898386, 0.5930517, -0.2531696, 1, 1, 1, 1, 1,
-0.1863782, 0.6012664, 0.1027012, 1, 1, 1, 1, 1,
-0.1845865, 0.3043317, 1.687692, 1, 1, 1, 1, 1,
-0.1809658, 1.352556, -0.3832427, 1, 1, 1, 1, 1,
-0.1770259, 0.8427259, 1.361369, 1, 1, 1, 1, 1,
-0.1730532, 1.411581, -1.032864, 1, 1, 1, 1, 1,
-0.1706442, 0.1694147, -0.02838077, 1, 1, 1, 1, 1,
-0.1696198, 0.05288173, -2.680616, 1, 1, 1, 1, 1,
-0.1651606, -0.8770855, -3.602058, 1, 1, 1, 1, 1,
-0.1644268, -0.4382695, -2.267697, 1, 1, 1, 1, 1,
-0.1613673, -0.3475375, -3.606646, 1, 1, 1, 1, 1,
-0.1578724, -0.5985414, -3.45223, 1, 1, 1, 1, 1,
-0.156509, -0.8828991, -1.672535, 1, 1, 1, 1, 1,
-0.1532643, -0.4442746, -3.470868, 1, 1, 1, 1, 1,
-0.1519072, -0.5156656, -3.40678, 1, 1, 1, 1, 1,
-0.1448923, 1.013282, -0.06167874, 0, 0, 1, 1, 1,
-0.1434699, 0.6863866, -1.384235, 1, 0, 0, 1, 1,
-0.1421376, -0.2515278, -1.615713, 1, 0, 0, 1, 1,
-0.1365066, -0.4899814, -2.661267, 1, 0, 0, 1, 1,
-0.1338567, -0.0560908, -2.738806, 1, 0, 0, 1, 1,
-0.133559, 0.789022, 1.661638, 1, 0, 0, 1, 1,
-0.1271015, 1.111161, -3.524506, 0, 0, 0, 1, 1,
-0.1257819, 1.519548, 1.601423, 0, 0, 0, 1, 1,
-0.1256965, -0.8439552, -0.15704, 0, 0, 0, 1, 1,
-0.1236469, 0.6773302, 0.9641106, 0, 0, 0, 1, 1,
-0.1222754, -1.404572, -2.585418, 0, 0, 0, 1, 1,
-0.1213757, 0.1002823, 0.1511089, 0, 0, 0, 1, 1,
-0.1213203, 0.4913591, -0.455155, 0, 0, 0, 1, 1,
-0.1197567, -0.1020452, -1.583573, 1, 1, 1, 1, 1,
-0.1180919, 1.368431, -0.426428, 1, 1, 1, 1, 1,
-0.1166493, -0.1403156, -3.733044, 1, 1, 1, 1, 1,
-0.1165718, 0.6334022, -0.6007067, 1, 1, 1, 1, 1,
-0.1085779, 0.1380077, 0.7379611, 1, 1, 1, 1, 1,
-0.1078045, 0.04222048, 0.09197106, 1, 1, 1, 1, 1,
-0.1072425, 0.2305704, -1.996598, 1, 1, 1, 1, 1,
-0.1056046, 1.063176, 0.05270557, 1, 1, 1, 1, 1,
-0.09075948, 0.6474956, 0.621742, 1, 1, 1, 1, 1,
-0.08781695, 0.3259887, 0.1664876, 1, 1, 1, 1, 1,
-0.08589467, -0.4970165, -2.117841, 1, 1, 1, 1, 1,
-0.08426668, 0.3260864, -0.4950684, 1, 1, 1, 1, 1,
-0.08280645, -0.6285276, -2.953566, 1, 1, 1, 1, 1,
-0.07788526, 0.9312134, -0.3297638, 1, 1, 1, 1, 1,
-0.07368212, -0.552502, -3.704979, 1, 1, 1, 1, 1,
-0.0736322, 1.408015, 0.4409314, 0, 0, 1, 1, 1,
-0.07164276, -1.481329, -1.442953, 1, 0, 0, 1, 1,
-0.06501819, 1.532455, -1.50748, 1, 0, 0, 1, 1,
-0.06443142, -0.08268494, -1.19974, 1, 0, 0, 1, 1,
-0.0607072, 0.3058725, 0.537213, 1, 0, 0, 1, 1,
-0.05911526, -0.2111866, -4.539074, 1, 0, 0, 1, 1,
-0.05797835, 1.885511, -1.135554, 0, 0, 0, 1, 1,
-0.05684259, -0.49128, -1.05155, 0, 0, 0, 1, 1,
-0.05432703, -0.3041986, -3.650858, 0, 0, 0, 1, 1,
-0.05391291, -1.356341, -3.645799, 0, 0, 0, 1, 1,
-0.05309879, -0.02748641, -1.596729, 0, 0, 0, 1, 1,
-0.04958899, 0.9989431, 0.4721445, 0, 0, 0, 1, 1,
-0.04661834, 1.435951, 0.1578392, 0, 0, 0, 1, 1,
-0.04434747, -0.09968024, -3.250244, 1, 1, 1, 1, 1,
-0.04325771, 0.9674142, 0.6897876, 1, 1, 1, 1, 1,
-0.03950598, 0.2030768, 0.1522791, 1, 1, 1, 1, 1,
-0.03664349, 1.129785, 0.8031079, 1, 1, 1, 1, 1,
-0.03364595, 0.2915559, -1.368565, 1, 1, 1, 1, 1,
-0.03188183, 0.08804442, 0.6227874, 1, 1, 1, 1, 1,
-0.03062731, 1.193843, 1.873558, 1, 1, 1, 1, 1,
-0.02935999, 1.533182, 0.9620564, 1, 1, 1, 1, 1,
-0.02917026, 0.2925639, -0.6742481, 1, 1, 1, 1, 1,
-0.02855494, -0.7258102, -4.865278, 1, 1, 1, 1, 1,
-0.02593306, -0.4724078, -2.59538, 1, 1, 1, 1, 1,
-0.02396813, 0.8832939, -1.035353, 1, 1, 1, 1, 1,
-0.02392238, -0.6453092, -2.906751, 1, 1, 1, 1, 1,
-0.02106948, 0.6632519, -0.5249212, 1, 1, 1, 1, 1,
-0.01992354, 0.3642348, 0.4852273, 1, 1, 1, 1, 1,
-0.01648286, 0.9166832, 0.09365184, 0, 0, 1, 1, 1,
-0.01487852, -0.4940254, -3.67629, 1, 0, 0, 1, 1,
-0.01261438, 0.2372974, 0.7690797, 1, 0, 0, 1, 1,
-0.01035126, 0.1825961, -1.311866, 1, 0, 0, 1, 1,
-0.01028232, 0.5556878, -2.343709, 1, 0, 0, 1, 1,
-0.007352219, -0.5170504, -2.173906, 1, 0, 0, 1, 1,
-0.00536313, 0.9270219, 0.7973179, 0, 0, 0, 1, 1,
0.0003172054, -0.526134, 2.890005, 0, 0, 0, 1, 1,
0.002176275, -0.2343499, 3.152063, 0, 0, 0, 1, 1,
0.006430222, -1.214253, 4.707777, 0, 0, 0, 1, 1,
0.01487205, 0.4402784, 0.2199486, 0, 0, 0, 1, 1,
0.0158403, 1.534734, 0.4628384, 0, 0, 0, 1, 1,
0.01695676, -0.7846658, 4.216999, 0, 0, 0, 1, 1,
0.01749448, 0.8653473, 0.5673879, 1, 1, 1, 1, 1,
0.0188704, -0.1525324, 3.614989, 1, 1, 1, 1, 1,
0.02041064, 0.09107174, 0.8224452, 1, 1, 1, 1, 1,
0.02227705, -0.5228535, 3.107254, 1, 1, 1, 1, 1,
0.02231627, -1.154002, 3.733646, 1, 1, 1, 1, 1,
0.02498144, -0.3034299, 1.583919, 1, 1, 1, 1, 1,
0.02666506, 0.09348254, 0.8504102, 1, 1, 1, 1, 1,
0.03613772, -0.2115573, 1.574709, 1, 1, 1, 1, 1,
0.04319621, 1.412769, -1.022384, 1, 1, 1, 1, 1,
0.04582096, -0.4111924, 2.031115, 1, 1, 1, 1, 1,
0.04784522, 1.176964, 0.9438716, 1, 1, 1, 1, 1,
0.04857568, 0.06644672, -0.769335, 1, 1, 1, 1, 1,
0.06142031, 1.30254, -0.3109859, 1, 1, 1, 1, 1,
0.0617509, -0.1431711, 3.733461, 1, 1, 1, 1, 1,
0.06400824, -1.746339, 2.373861, 1, 1, 1, 1, 1,
0.06593751, 0.3939249, -0.9476078, 0, 0, 1, 1, 1,
0.06662433, 1.352621, -0.5062037, 1, 0, 0, 1, 1,
0.06700844, 1.0468, 0.5503893, 1, 0, 0, 1, 1,
0.07187071, -0.7405851, 3.275243, 1, 0, 0, 1, 1,
0.07400487, -1.294291, 3.198682, 1, 0, 0, 1, 1,
0.07585992, -1.385503, 2.988724, 1, 0, 0, 1, 1,
0.08096274, -1.176618, 2.381495, 0, 0, 0, 1, 1,
0.0821783, -1.828252, 4.780212, 0, 0, 0, 1, 1,
0.08369897, 0.01819949, 1.386799, 0, 0, 0, 1, 1,
0.08482768, 1.423229, 0.3781008, 0, 0, 0, 1, 1,
0.08835493, 0.7884054, 0.9347721, 0, 0, 0, 1, 1,
0.0891683, -0.4331464, 5.227244, 0, 0, 0, 1, 1,
0.08941953, -0.4265415, 3.064965, 0, 0, 0, 1, 1,
0.09524744, -0.2674167, 3.537229, 1, 1, 1, 1, 1,
0.09923591, 0.6421499, 0.8106855, 1, 1, 1, 1, 1,
0.09978107, 0.5933218, 0.5723512, 1, 1, 1, 1, 1,
0.1011555, -0.3136728, 2.648782, 1, 1, 1, 1, 1,
0.1031596, 0.3505887, 1.000275, 1, 1, 1, 1, 1,
0.1061311, 0.1097094, 1.068614, 1, 1, 1, 1, 1,
0.1066874, 0.4613965, -2.541227, 1, 1, 1, 1, 1,
0.1093045, 0.3287787, 0.4991646, 1, 1, 1, 1, 1,
0.122062, 0.5025653, 1.415933, 1, 1, 1, 1, 1,
0.1238574, 1.24701, 0.04556143, 1, 1, 1, 1, 1,
0.1241973, -0.6307443, 2.524167, 1, 1, 1, 1, 1,
0.1269989, -1.564172, 2.435502, 1, 1, 1, 1, 1,
0.1285954, -0.2185407, 3.516774, 1, 1, 1, 1, 1,
0.1296233, 1.101632, 0.7052655, 1, 1, 1, 1, 1,
0.1313441, -1.593241, 1.72153, 1, 1, 1, 1, 1,
0.1320784, 0.3140245, 0.7541125, 0, 0, 1, 1, 1,
0.1326389, 0.1680579, -0.79755, 1, 0, 0, 1, 1,
0.134494, 1.349388, 0.7219217, 1, 0, 0, 1, 1,
0.1392804, 0.7783238, 1.674568, 1, 0, 0, 1, 1,
0.1393684, 0.7283288, 0.755931, 1, 0, 0, 1, 1,
0.1414285, -0.5598966, 3.535245, 1, 0, 0, 1, 1,
0.1488544, 0.3133849, 0.469854, 0, 0, 0, 1, 1,
0.1501651, -0.3853246, 2.491596, 0, 0, 0, 1, 1,
0.1519779, -0.373054, 1.954159, 0, 0, 0, 1, 1,
0.1527681, 1.225634, -0.1469634, 0, 0, 0, 1, 1,
0.1528131, 1.892402, -0.3668337, 0, 0, 0, 1, 1,
0.1533288, 1.354299, -0.4280344, 0, 0, 0, 1, 1,
0.1573703, 0.2756577, 0.6033715, 0, 0, 0, 1, 1,
0.1666276, 0.3204079, 1.913025, 1, 1, 1, 1, 1,
0.1681016, 0.241546, 0.8309326, 1, 1, 1, 1, 1,
0.1692475, -1.452657, 2.521394, 1, 1, 1, 1, 1,
0.1698379, 1.226729, -0.5945649, 1, 1, 1, 1, 1,
0.1797293, -0.3529099, 3.682924, 1, 1, 1, 1, 1,
0.1917928, 0.3473709, 1.721937, 1, 1, 1, 1, 1,
0.1942404, -0.05293611, 1.176189, 1, 1, 1, 1, 1,
0.1962042, -1.910092, 2.116068, 1, 1, 1, 1, 1,
0.2043076, 0.355601, 1.490417, 1, 1, 1, 1, 1,
0.2142287, -0.8035834, 2.070413, 1, 1, 1, 1, 1,
0.2149659, 0.871516, -0.9341557, 1, 1, 1, 1, 1,
0.2187142, 0.51249, -0.512319, 1, 1, 1, 1, 1,
0.2202565, -1.73125, 3.355755, 1, 1, 1, 1, 1,
0.2207093, -1.446962, 4.409891, 1, 1, 1, 1, 1,
0.2210787, -1.469244, 2.869194, 1, 1, 1, 1, 1,
0.2217703, -0.1694561, 3.579496, 0, 0, 1, 1, 1,
0.2236788, 0.06994289, 0.977545, 1, 0, 0, 1, 1,
0.2249946, -0.8412781, 3.132595, 1, 0, 0, 1, 1,
0.2317116, -1.34189, 1.720579, 1, 0, 0, 1, 1,
0.23554, 0.8537744, 0.1844955, 1, 0, 0, 1, 1,
0.2381006, 0.6460434, -0.6909723, 1, 0, 0, 1, 1,
0.2384872, 2.072586, 0.8314322, 0, 0, 0, 1, 1,
0.2396444, -0.9162148, 2.615447, 0, 0, 0, 1, 1,
0.2421368, -0.6554182, 2.446193, 0, 0, 0, 1, 1,
0.2443908, 1.077055, 1.798561, 0, 0, 0, 1, 1,
0.2457503, 0.2316702, 0.2812946, 0, 0, 0, 1, 1,
0.2470864, -0.4488401, 1.480442, 0, 0, 0, 1, 1,
0.2471776, 0.1319157, 0.3268249, 0, 0, 0, 1, 1,
0.2520111, 1.052678, 0.5260286, 1, 1, 1, 1, 1,
0.2529062, -0.9409871, 2.952147, 1, 1, 1, 1, 1,
0.253475, 1.502293, 0.9673267, 1, 1, 1, 1, 1,
0.2564513, -1.28561, 1.519051, 1, 1, 1, 1, 1,
0.256549, 0.6423422, 1.787341, 1, 1, 1, 1, 1,
0.2577653, 1.358274, -2.111312, 1, 1, 1, 1, 1,
0.2607372, 0.4350812, -0.7605777, 1, 1, 1, 1, 1,
0.2612804, 2.419812, 0.9583132, 1, 1, 1, 1, 1,
0.2625108, -1.290233, 2.75609, 1, 1, 1, 1, 1,
0.2626914, 0.05594921, 1.616616, 1, 1, 1, 1, 1,
0.2633608, -0.4155858, 0.5669605, 1, 1, 1, 1, 1,
0.2636497, -0.137904, 1.903615, 1, 1, 1, 1, 1,
0.2639335, 1.251071, 0.583094, 1, 1, 1, 1, 1,
0.2656254, 0.8654498, 0.2581185, 1, 1, 1, 1, 1,
0.2669339, -0.6015774, 2.652094, 1, 1, 1, 1, 1,
0.2722385, -1.724442, 1.514182, 0, 0, 1, 1, 1,
0.2799311, 0.3281526, 1.427067, 1, 0, 0, 1, 1,
0.281311, 0.6406869, 0.05014768, 1, 0, 0, 1, 1,
0.2896296, -1.350454, 2.901536, 1, 0, 0, 1, 1,
0.2929916, -0.5887895, 2.336259, 1, 0, 0, 1, 1,
0.2974871, 1.143054, 0.2342862, 1, 0, 0, 1, 1,
0.3118748, 0.116909, 1.911759, 0, 0, 0, 1, 1,
0.3128, 0.7845417, 0.8101007, 0, 0, 0, 1, 1,
0.3129885, -0.5372761, 2.094948, 0, 0, 0, 1, 1,
0.3158193, 0.08027716, 1.398753, 0, 0, 0, 1, 1,
0.3194154, -1.002036, 3.236035, 0, 0, 0, 1, 1,
0.3242393, 0.9749303, 0.4909981, 0, 0, 0, 1, 1,
0.3256213, -0.2990091, 4.356695, 0, 0, 0, 1, 1,
0.3264652, 0.144851, 1.315611, 1, 1, 1, 1, 1,
0.3290674, 1.782058, 0.3954933, 1, 1, 1, 1, 1,
0.3306727, 0.382152, 1.792828, 1, 1, 1, 1, 1,
0.3368616, -2.361238, 2.455036, 1, 1, 1, 1, 1,
0.3440736, -0.9658976, 2.444641, 1, 1, 1, 1, 1,
0.3484596, -1.039646, 2.704534, 1, 1, 1, 1, 1,
0.3547918, 0.5762382, -0.05840934, 1, 1, 1, 1, 1,
0.3575054, -0.2374898, 2.686481, 1, 1, 1, 1, 1,
0.3639844, 0.4266284, 1.633082, 1, 1, 1, 1, 1,
0.3683109, 0.1561216, 1.284065, 1, 1, 1, 1, 1,
0.3752895, -1.08084, 1.79295, 1, 1, 1, 1, 1,
0.3793821, -0.8877962, 3.601144, 1, 1, 1, 1, 1,
0.3801737, -0.9420337, 4.228813, 1, 1, 1, 1, 1,
0.3825151, -0.0599981, 1.616079, 1, 1, 1, 1, 1,
0.38417, -0.4778982, 3.366791, 1, 1, 1, 1, 1,
0.3867256, -0.0224986, 0.2810137, 0, 0, 1, 1, 1,
0.3881888, 2.023875, 0.637697, 1, 0, 0, 1, 1,
0.3916555, -0.5483159, -0.5942445, 1, 0, 0, 1, 1,
0.3929071, 0.02037349, 0.5558771, 1, 0, 0, 1, 1,
0.3991578, -1.017354, 2.773431, 1, 0, 0, 1, 1,
0.401735, -0.9721745, 3.660352, 1, 0, 0, 1, 1,
0.4043939, 0.8651974, 1.969777, 0, 0, 0, 1, 1,
0.4062985, 0.4077582, -0.3639657, 0, 0, 0, 1, 1,
0.40703, 0.06079062, 0.3363963, 0, 0, 0, 1, 1,
0.4125004, 0.2602125, 0.6803709, 0, 0, 0, 1, 1,
0.4205663, 0.4506129, 0.2347022, 0, 0, 0, 1, 1,
0.426932, 0.1060473, -0.02762833, 0, 0, 0, 1, 1,
0.4273159, -0.7652035, 2.592756, 0, 0, 0, 1, 1,
0.4290085, -0.3707328, 2.014641, 1, 1, 1, 1, 1,
0.4314696, -1.482704, 3.281851, 1, 1, 1, 1, 1,
0.4385934, 0.3835633, 0.7338375, 1, 1, 1, 1, 1,
0.4388953, 0.2797807, 1.701993, 1, 1, 1, 1, 1,
0.446335, 0.03884045, 3.832522, 1, 1, 1, 1, 1,
0.4480672, -1.704051, 3.023709, 1, 1, 1, 1, 1,
0.4493707, 0.6419922, -0.4882583, 1, 1, 1, 1, 1,
0.4598069, -0.5838305, 1.321093, 1, 1, 1, 1, 1,
0.4619296, -0.4361968, 0.2839589, 1, 1, 1, 1, 1,
0.4645388, 0.06889493, 2.020545, 1, 1, 1, 1, 1,
0.4699011, 0.7683064, -1.389494, 1, 1, 1, 1, 1,
0.4700589, 0.07571165, 2.197784, 1, 1, 1, 1, 1,
0.4729433, -0.985211, 1.142496, 1, 1, 1, 1, 1,
0.4736896, -0.7654145, 2.324019, 1, 1, 1, 1, 1,
0.4740923, 0.3806654, 0.3016447, 1, 1, 1, 1, 1,
0.4783674, 0.8691508, 1.905774, 0, 0, 1, 1, 1,
0.4784718, 0.3087635, 0.5876373, 1, 0, 0, 1, 1,
0.479379, -0.834224, 2.966268, 1, 0, 0, 1, 1,
0.4816518, 0.02866647, 0.9898275, 1, 0, 0, 1, 1,
0.4893309, 0.1861229, 2.120108, 1, 0, 0, 1, 1,
0.494166, -0.2805931, 0.4150504, 1, 0, 0, 1, 1,
0.4968226, -0.2716056, 2.15815, 0, 0, 0, 1, 1,
0.5007706, -1.04437, 2.872896, 0, 0, 0, 1, 1,
0.5028597, -1.410574, 3.53288, 0, 0, 0, 1, 1,
0.5029342, -0.192664, 1.513813, 0, 0, 0, 1, 1,
0.5030951, -0.1073675, 3.671652, 0, 0, 0, 1, 1,
0.5040227, -0.6698232, 2.227468, 0, 0, 0, 1, 1,
0.5089244, -0.4079518, 3.893727, 0, 0, 0, 1, 1,
0.510987, 0.3716526, 0.3693133, 1, 1, 1, 1, 1,
0.5210898, 1.302247, -0.1547113, 1, 1, 1, 1, 1,
0.522805, 1.299518, -0.09406496, 1, 1, 1, 1, 1,
0.5287048, 1.352427, -0.008206535, 1, 1, 1, 1, 1,
0.5320727, -0.7584778, 4.092613, 1, 1, 1, 1, 1,
0.5341898, -0.09630733, 1.531646, 1, 1, 1, 1, 1,
0.5349343, -0.6923742, 1.28914, 1, 1, 1, 1, 1,
0.5350642, 0.9907903, 1.405263, 1, 1, 1, 1, 1,
0.5354525, 1.763376, -0.8103452, 1, 1, 1, 1, 1,
0.5392855, 0.2219043, 2.140089, 1, 1, 1, 1, 1,
0.5431978, -1.725845, 2.965249, 1, 1, 1, 1, 1,
0.5437047, -1.300977, 3.45471, 1, 1, 1, 1, 1,
0.5440604, -1.524774, 3.760822, 1, 1, 1, 1, 1,
0.5483466, -0.1668238, 2.919056, 1, 1, 1, 1, 1,
0.548686, 0.5060014, 3.552615, 1, 1, 1, 1, 1,
0.5496349, 1.022253, 1.40784, 0, 0, 1, 1, 1,
0.5502443, 0.032334, 2.052603, 1, 0, 0, 1, 1,
0.5505069, -0.5699498, 2.500333, 1, 0, 0, 1, 1,
0.5521688, 0.4624541, -1.004207, 1, 0, 0, 1, 1,
0.5525642, 0.5076067, 0.03456301, 1, 0, 0, 1, 1,
0.5561978, 0.9573883, 0.7146751, 1, 0, 0, 1, 1,
0.5580945, 0.1191453, 1.255336, 0, 0, 0, 1, 1,
0.5625904, -0.7035784, 2.644453, 0, 0, 0, 1, 1,
0.5633608, -0.0294409, -0.391646, 0, 0, 0, 1, 1,
0.5638022, -1.220863, 2.243182, 0, 0, 0, 1, 1,
0.5640309, -0.946292, 2.703041, 0, 0, 0, 1, 1,
0.5661387, 0.7108223, 1.069368, 0, 0, 0, 1, 1,
0.5733457, 0.6787378, -0.09145954, 0, 0, 0, 1, 1,
0.5797833, 1.805575, 0.7438384, 1, 1, 1, 1, 1,
0.5799475, -0.3847363, 1.017547, 1, 1, 1, 1, 1,
0.5807859, 0.6657213, 1.708695, 1, 1, 1, 1, 1,
0.5826454, 0.09709633, 0.8455427, 1, 1, 1, 1, 1,
0.585672, -2.652957, 3.696306, 1, 1, 1, 1, 1,
0.58907, -0.5670226, 2.84855, 1, 1, 1, 1, 1,
0.5898352, -0.3969658, 3.03816, 1, 1, 1, 1, 1,
0.5937693, 1.492783, 0.5420865, 1, 1, 1, 1, 1,
0.5942472, -0.4831634, 1.23762, 1, 1, 1, 1, 1,
0.5949315, 1.144183, 1.447642, 1, 1, 1, 1, 1,
0.5975214, 0.1383702, 1.313172, 1, 1, 1, 1, 1,
0.5986619, 0.1382148, 0.6568362, 1, 1, 1, 1, 1,
0.6024632, 0.8998575, 0.6038898, 1, 1, 1, 1, 1,
0.6025853, 1.396562, 0.2804453, 1, 1, 1, 1, 1,
0.6035269, -1.693217, 4.472416, 1, 1, 1, 1, 1,
0.6044117, 0.3430926, 1.765958, 0, 0, 1, 1, 1,
0.6057182, -0.6087305, 2.285344, 1, 0, 0, 1, 1,
0.6067041, -0.3419184, 4.114122, 1, 0, 0, 1, 1,
0.6095455, 1.642421, -0.4339739, 1, 0, 0, 1, 1,
0.6121968, 0.7289287, 0.2207154, 1, 0, 0, 1, 1,
0.6129086, -0.8894339, 1.418424, 1, 0, 0, 1, 1,
0.6141673, -1.06752, 2.510088, 0, 0, 0, 1, 1,
0.6148169, 0.1329307, 0.900264, 0, 0, 0, 1, 1,
0.6156901, 0.1360875, -0.3556858, 0, 0, 0, 1, 1,
0.6181959, -1.46873, 2.970378, 0, 0, 0, 1, 1,
0.6223837, -0.09646972, 2.026915, 0, 0, 0, 1, 1,
0.6228519, 0.5531583, 0.3119344, 0, 0, 0, 1, 1,
0.6267827, -2.118531, 3.973094, 0, 0, 0, 1, 1,
0.629414, -1.483077, 3.751304, 1, 1, 1, 1, 1,
0.6302273, -0.5202206, 3.128572, 1, 1, 1, 1, 1,
0.6302341, 1.380454, -1.17024, 1, 1, 1, 1, 1,
0.6376366, 0.4182362, 0.8160778, 1, 1, 1, 1, 1,
0.6495036, -0.7903932, 2.645141, 1, 1, 1, 1, 1,
0.651398, 1.111297, 1.572679, 1, 1, 1, 1, 1,
0.6558254, 0.4888778, 1.766645, 1, 1, 1, 1, 1,
0.6568359, -1.150167, 3.1392, 1, 1, 1, 1, 1,
0.6573471, -1.90567, 1.933197, 1, 1, 1, 1, 1,
0.6598262, 1.026028, 0.4735764, 1, 1, 1, 1, 1,
0.6623382, 0.3103129, 1.845288, 1, 1, 1, 1, 1,
0.6698754, -0.2048394, -0.1580203, 1, 1, 1, 1, 1,
0.6741518, -0.3941909, 0.8448209, 1, 1, 1, 1, 1,
0.6747881, -0.9752024, 2.310497, 1, 1, 1, 1, 1,
0.6809231, -0.8550828, 2.493452, 1, 1, 1, 1, 1,
0.6822312, 0.448558, 2.657022, 0, 0, 1, 1, 1,
0.6824453, 0.2649298, 1.572586, 1, 0, 0, 1, 1,
0.6889325, -1.409796, 3.626397, 1, 0, 0, 1, 1,
0.6918713, 1.906891, -0.547148, 1, 0, 0, 1, 1,
0.699821, 1.885295, 1.437443, 1, 0, 0, 1, 1,
0.7037282, -0.06278647, 3.126664, 1, 0, 0, 1, 1,
0.7045708, 0.3420486, 1.585273, 0, 0, 0, 1, 1,
0.7051833, -0.3343743, 2.406153, 0, 0, 0, 1, 1,
0.7057554, -1.359462, 3.172658, 0, 0, 0, 1, 1,
0.7058029, 1.084743, 0.3505465, 0, 0, 0, 1, 1,
0.7107842, -0.9634883, 2.981793, 0, 0, 0, 1, 1,
0.7116443, 0.4991504, 0.3041484, 0, 0, 0, 1, 1,
0.7148043, -0.5325009, 4.683531, 0, 0, 0, 1, 1,
0.7169147, 0.6934254, 0.3485536, 1, 1, 1, 1, 1,
0.7182945, -0.8872179, 1.899666, 1, 1, 1, 1, 1,
0.7230417, 1.327273, -0.08869871, 1, 1, 1, 1, 1,
0.7242147, -0.64526, 1.658463, 1, 1, 1, 1, 1,
0.7286961, 0.03827916, 0.9535611, 1, 1, 1, 1, 1,
0.7319323, 0.4098685, 0.2535782, 1, 1, 1, 1, 1,
0.7322233, -0.426218, 1.788571, 1, 1, 1, 1, 1,
0.7351419, -0.9729449, 2.896297, 1, 1, 1, 1, 1,
0.7372699, -0.1410794, -0.0722174, 1, 1, 1, 1, 1,
0.7397706, -1.958897, 3.53404, 1, 1, 1, 1, 1,
0.7429562, 0.4513337, 1.345453, 1, 1, 1, 1, 1,
0.7481541, 0.4439677, 1.761112, 1, 1, 1, 1, 1,
0.7496118, -0.7335151, 2.170578, 1, 1, 1, 1, 1,
0.7588882, -1.367078, 4.579693, 1, 1, 1, 1, 1,
0.7647687, -0.857884, 2.478354, 1, 1, 1, 1, 1,
0.7651016, 1.803228, -0.1331472, 0, 0, 1, 1, 1,
0.7719181, 0.4176452, 3.133886, 1, 0, 0, 1, 1,
0.7725301, 0.2835306, 1.573247, 1, 0, 0, 1, 1,
0.7747942, -0.1768021, 0.7737293, 1, 0, 0, 1, 1,
0.7781569, -1.431469, 3.129271, 1, 0, 0, 1, 1,
0.7880562, -1.32987, 2.639144, 1, 0, 0, 1, 1,
0.7893551, -1.053162, 2.073925, 0, 0, 0, 1, 1,
0.793043, 0.3440891, 1.51977, 0, 0, 0, 1, 1,
0.7954032, -1.186958, 3.190722, 0, 0, 0, 1, 1,
0.7963023, -0.4429999, 2.690674, 0, 0, 0, 1, 1,
0.8021668, -0.06961922, 2.373174, 0, 0, 0, 1, 1,
0.8024651, 0.2568651, 0.7979829, 0, 0, 0, 1, 1,
0.8081899, -1.573452, 1.586256, 0, 0, 0, 1, 1,
0.8086294, 0.482021, 1.590415, 1, 1, 1, 1, 1,
0.8094907, -1.70744, 2.729661, 1, 1, 1, 1, 1,
0.8097678, 0.03593177, 0.9045951, 1, 1, 1, 1, 1,
0.8190396, -2.704591, 1.387618, 1, 1, 1, 1, 1,
0.820042, 1.172459, 0.4508637, 1, 1, 1, 1, 1,
0.820185, 1.539492, -0.3941531, 1, 1, 1, 1, 1,
0.8230197, -0.6017433, 1.610232, 1, 1, 1, 1, 1,
0.8256244, 0.265372, 1.907737, 1, 1, 1, 1, 1,
0.8256975, -1.397582, 2.608968, 1, 1, 1, 1, 1,
0.8264773, -1.220527, 2.40218, 1, 1, 1, 1, 1,
0.8332845, 0.7002924, -0.4642662, 1, 1, 1, 1, 1,
0.8349878, 0.9087081, -0.7991953, 1, 1, 1, 1, 1,
0.8384537, 0.9617627, 0.4068415, 1, 1, 1, 1, 1,
0.8448184, 0.1885965, 0.9002364, 1, 1, 1, 1, 1,
0.8542362, 1.346802, -3.030548, 1, 1, 1, 1, 1,
0.8544292, -0.8443514, 2.682362, 0, 0, 1, 1, 1,
0.8569188, 0.2206338, 2.891706, 1, 0, 0, 1, 1,
0.8570352, -0.6731761, 1.941904, 1, 0, 0, 1, 1,
0.8581835, 0.664072, -1.004824, 1, 0, 0, 1, 1,
0.8599713, 0.2003145, -0.2971253, 1, 0, 0, 1, 1,
0.8709141, -1.378934, 2.377817, 1, 0, 0, 1, 1,
0.8716543, -1.777837, 2.953768, 0, 0, 0, 1, 1,
0.8763366, -0.1115628, 1.176902, 0, 0, 0, 1, 1,
0.876728, -0.2969716, 4.520819, 0, 0, 0, 1, 1,
0.87888, 0.8330204, 0.8503976, 0, 0, 0, 1, 1,
0.8837802, 1.02698, 1.297216, 0, 0, 0, 1, 1,
0.8874773, 1.014122, 1.49885, 0, 0, 0, 1, 1,
0.8883282, -0.2464859, 1.8428, 0, 0, 0, 1, 1,
0.8895491, 0.4174744, 3.022747, 1, 1, 1, 1, 1,
0.8909401, -0.2271018, 1.245036, 1, 1, 1, 1, 1,
0.8944941, 0.7434078, 0.2338291, 1, 1, 1, 1, 1,
0.899107, -0.5728315, 1.988194, 1, 1, 1, 1, 1,
0.8993875, -0.01321554, 1.302256, 1, 1, 1, 1, 1,
0.9018551, 0.2471933, 1.226762, 1, 1, 1, 1, 1,
0.9080536, 0.6858876, -0.3425187, 1, 1, 1, 1, 1,
0.9217475, 0.4155301, 1.376181, 1, 1, 1, 1, 1,
0.924334, 0.710134, 2.620896, 1, 1, 1, 1, 1,
0.9248954, -0.4488839, 1.937091, 1, 1, 1, 1, 1,
0.9261699, -0.03080085, 1.813676, 1, 1, 1, 1, 1,
0.9362764, 0.6832557, 0.2151863, 1, 1, 1, 1, 1,
0.9404199, -2.764356, 2.415437, 1, 1, 1, 1, 1,
0.9466355, -0.9438342, 2.566401, 1, 1, 1, 1, 1,
0.9489273, -1.163046, 2.975184, 1, 1, 1, 1, 1,
0.9500995, -0.2448471, 3.371336, 0, 0, 1, 1, 1,
0.9514053, -0.1621945, 2.871934, 1, 0, 0, 1, 1,
0.9533156, -0.09251444, 2.269252, 1, 0, 0, 1, 1,
0.9535096, 0.615786, 1.374058, 1, 0, 0, 1, 1,
0.953997, 0.1472697, 1.679774, 1, 0, 0, 1, 1,
0.9582093, 0.6915397, -0.3529657, 1, 0, 0, 1, 1,
0.9622248, 0.02170911, 1.759123, 0, 0, 0, 1, 1,
0.9666067, 0.2126233, 0.9865744, 0, 0, 0, 1, 1,
0.9751125, 0.4514954, 1.427348, 0, 0, 0, 1, 1,
0.9759515, 0.1939459, 1.031186, 0, 0, 0, 1, 1,
0.9790769, -1.605576, 2.140343, 0, 0, 0, 1, 1,
0.9821903, -0.1742994, 1.931682, 0, 0, 0, 1, 1,
0.9852011, 0.7293032, 1.708769, 0, 0, 0, 1, 1,
0.9877314, 0.7522038, -1.315039, 1, 1, 1, 1, 1,
0.9937655, 0.9176956, 0.2324083, 1, 1, 1, 1, 1,
0.9983912, 0.1646409, 2.127249, 1, 1, 1, 1, 1,
1.001355, 0.3486482, 1.199648, 1, 1, 1, 1, 1,
1.003669, -0.2694781, 1.873498, 1, 1, 1, 1, 1,
1.007318, -1.328262, 1.87895, 1, 1, 1, 1, 1,
1.008059, 0.2742626, 2.269476, 1, 1, 1, 1, 1,
1.009869, -0.02656168, 1.401705, 1, 1, 1, 1, 1,
1.017137, 1.946378, 1.395961, 1, 1, 1, 1, 1,
1.020563, -0.193889, 2.214351, 1, 1, 1, 1, 1,
1.026221, 0.526372, 2.519774, 1, 1, 1, 1, 1,
1.027837, 0.3830731, 0.2399012, 1, 1, 1, 1, 1,
1.032917, -0.07392555, 0.5011704, 1, 1, 1, 1, 1,
1.042626, 0.562565, 2.148827, 1, 1, 1, 1, 1,
1.045616, -0.1938424, 3.313783, 1, 1, 1, 1, 1,
1.049019, 1.518558, 0.740032, 0, 0, 1, 1, 1,
1.049648, 0.1318554, 1.608617, 1, 0, 0, 1, 1,
1.050676, -1.361931, 1.232629, 1, 0, 0, 1, 1,
1.057485, -0.7962502, 2.681979, 1, 0, 0, 1, 1,
1.06049, 0.1910775, 1.927896, 1, 0, 0, 1, 1,
1.072463, -1.325037, 3.027432, 1, 0, 0, 1, 1,
1.073259, 0.4840343, 1.84676, 0, 0, 0, 1, 1,
1.07748, -0.0528511, 0.6231822, 0, 0, 0, 1, 1,
1.088168, -0.008562194, 3.658774, 0, 0, 0, 1, 1,
1.089687, -0.6807551, 1.958656, 0, 0, 0, 1, 1,
1.10719, 0.9843218, -0.9304788, 0, 0, 0, 1, 1,
1.113369, -0.1413412, 0.7768815, 0, 0, 0, 1, 1,
1.125203, -1.01931, 2.511772, 0, 0, 0, 1, 1,
1.131617, -0.5995479, 1.449072, 1, 1, 1, 1, 1,
1.152255, -0.9121512, 2.77808, 1, 1, 1, 1, 1,
1.15593, -0.8592635, 2.44883, 1, 1, 1, 1, 1,
1.159653, -1.200344, 3.89323, 1, 1, 1, 1, 1,
1.167547, 0.9768779, -0.8316683, 1, 1, 1, 1, 1,
1.172714, 1.610223, 0.4507925, 1, 1, 1, 1, 1,
1.175027, 1.01581, -0.9850371, 1, 1, 1, 1, 1,
1.180506, -0.01581135, 0.1262881, 1, 1, 1, 1, 1,
1.185938, -0.4972135, 5.126679, 1, 1, 1, 1, 1,
1.196452, 0.005963478, 1.325748, 1, 1, 1, 1, 1,
1.199101, 0.6269122, 0.4872139, 1, 1, 1, 1, 1,
1.215281, 1.015523, 2.158264, 1, 1, 1, 1, 1,
1.216337, 0.1656159, 0.8096077, 1, 1, 1, 1, 1,
1.217691, -0.5130368, -0.239997, 1, 1, 1, 1, 1,
1.22519, -1.715022, 2.763739, 1, 1, 1, 1, 1,
1.228141, 0.3325059, 1.457878, 0, 0, 1, 1, 1,
1.23729, 0.3168412, 1.333257, 1, 0, 0, 1, 1,
1.240566, 0.6005756, 1.666485, 1, 0, 0, 1, 1,
1.241342, 1.048229, -0.2052364, 1, 0, 0, 1, 1,
1.256766, 1.169001, 1.466853, 1, 0, 0, 1, 1,
1.262677, -0.4276317, 2.766918, 1, 0, 0, 1, 1,
1.278435, 0.9738128, 1.077448, 0, 0, 0, 1, 1,
1.283928, 1.251358, -1.002015, 0, 0, 0, 1, 1,
1.294752, 0.2094329, 2.3179, 0, 0, 0, 1, 1,
1.299793, -0.2886967, 2.898059, 0, 0, 0, 1, 1,
1.300284, 0.7054942, 2.058662, 0, 0, 0, 1, 1,
1.302211, 0.3421339, 2.202737, 0, 0, 0, 1, 1,
1.308333, -0.004225732, 1.069908, 0, 0, 0, 1, 1,
1.309923, -0.5052696, 1.453085, 1, 1, 1, 1, 1,
1.326186, -0.3763281, 1.187714, 1, 1, 1, 1, 1,
1.336113, 0.6515836, -0.3726233, 1, 1, 1, 1, 1,
1.336295, -0.8304871, 1.494166, 1, 1, 1, 1, 1,
1.339569, 0.4432763, 2.108348, 1, 1, 1, 1, 1,
1.350781, -1.024592, 1.836015, 1, 1, 1, 1, 1,
1.371964, 1.580021, 0.5406127, 1, 1, 1, 1, 1,
1.377153, 0.8684683, 2.246711, 1, 1, 1, 1, 1,
1.388221, 0.3092018, 0.8851892, 1, 1, 1, 1, 1,
1.390937, 2.209009, 0.1798851, 1, 1, 1, 1, 1,
1.391582, 0.508992, 0.7176417, 1, 1, 1, 1, 1,
1.395354, -1.193762, 1.758298, 1, 1, 1, 1, 1,
1.402266, -1.201333, 3.474716, 1, 1, 1, 1, 1,
1.402869, -0.6195617, 2.602839, 1, 1, 1, 1, 1,
1.416749, 1.20079, -0.5194624, 1, 1, 1, 1, 1,
1.423831, -1.082494, 1.483374, 0, 0, 1, 1, 1,
1.442127, 0.7103884, 0.2230645, 1, 0, 0, 1, 1,
1.452716, 0.5019069, 3.296832, 1, 0, 0, 1, 1,
1.461249, 0.06331211, 1.589214, 1, 0, 0, 1, 1,
1.462211, 0.3238908, 3.435491, 1, 0, 0, 1, 1,
1.468785, 1.611958, -0.100453, 1, 0, 0, 1, 1,
1.471516, -1.825734, 1.434258, 0, 0, 0, 1, 1,
1.472109, -1.015904, 2.07649, 0, 0, 0, 1, 1,
1.472471, 2.131612, 1.725449, 0, 0, 0, 1, 1,
1.478441, -2.13552, 2.377574, 0, 0, 0, 1, 1,
1.480851, 1.213302, 0.7222788, 0, 0, 0, 1, 1,
1.493979, -0.7297629, 0.6038667, 0, 0, 0, 1, 1,
1.497763, -1.022135, 0.3297551, 0, 0, 0, 1, 1,
1.506752, 0.6085738, 0.4411984, 1, 1, 1, 1, 1,
1.508831, -0.1684902, 1.427368, 1, 1, 1, 1, 1,
1.513884, 1.289286, -0.4918349, 1, 1, 1, 1, 1,
1.534403, 2.721031, 0.6733336, 1, 1, 1, 1, 1,
1.540446, -0.2945845, 1.265521, 1, 1, 1, 1, 1,
1.552846, -0.04364658, 2.637766, 1, 1, 1, 1, 1,
1.557485, 0.6931073, 0.4901238, 1, 1, 1, 1, 1,
1.562716, 0.7167812, 1.408679, 1, 1, 1, 1, 1,
1.571812, 1.603367, 0.1087828, 1, 1, 1, 1, 1,
1.576458, -1.02093, 1.82713, 1, 1, 1, 1, 1,
1.577415, 0.4919132, -0.736648, 1, 1, 1, 1, 1,
1.592917, -0.1477076, 1.383575, 1, 1, 1, 1, 1,
1.595788, -1.167318, 4.078683, 1, 1, 1, 1, 1,
1.645954, -0.755282, 2.520183, 1, 1, 1, 1, 1,
1.660576, 0.06921852, 0.7909984, 1, 1, 1, 1, 1,
1.669317, 0.6457919, -0.429612, 0, 0, 1, 1, 1,
1.674687, -0.1424942, 1.476888, 1, 0, 0, 1, 1,
1.696042, 0.9229161, 1.95468, 1, 0, 0, 1, 1,
1.704725, 0.4414277, 3.230148, 1, 0, 0, 1, 1,
1.709707, 0.5772773, -0.3481657, 1, 0, 0, 1, 1,
1.71884, 1.870242, -0.3280321, 1, 0, 0, 1, 1,
1.729262, 0.1911713, 2.049288, 0, 0, 0, 1, 1,
1.736962, -0.5424601, 0.1930071, 0, 0, 0, 1, 1,
1.741617, -0.06823528, 0.8808925, 0, 0, 0, 1, 1,
1.745772, -0.387008, 2.342907, 0, 0, 0, 1, 1,
1.755385, 0.724451, -0.07539828, 0, 0, 0, 1, 1,
1.766684, 0.1649998, 2.367115, 0, 0, 0, 1, 1,
1.788024, -0.5564917, 0.6869334, 0, 0, 0, 1, 1,
1.807537, -0.2876373, 2.92252, 1, 1, 1, 1, 1,
1.81657, 0.2076751, -1.046464, 1, 1, 1, 1, 1,
1.818065, 1.65967, 1.140938, 1, 1, 1, 1, 1,
1.827138, -0.3410131, 1.683219, 1, 1, 1, 1, 1,
1.833691, 0.2453917, 0.1201737, 1, 1, 1, 1, 1,
1.833813, -1.101276, 2.384028, 1, 1, 1, 1, 1,
1.858472, 0.3655362, -0.06906891, 1, 1, 1, 1, 1,
1.860069, -0.325995, 2.906212, 1, 1, 1, 1, 1,
1.863524, -0.7129419, 2.517101, 1, 1, 1, 1, 1,
1.882821, -0.9836982, 2.321947, 1, 1, 1, 1, 1,
1.951609, -0.1557353, 2.096229, 1, 1, 1, 1, 1,
1.955332, -2.095561, 1.885064, 1, 1, 1, 1, 1,
1.969667, -0.3082574, 2.282348, 1, 1, 1, 1, 1,
2.014341, 1.693796, 1.28126, 1, 1, 1, 1, 1,
2.016357, 0.1510879, 2.488058, 1, 1, 1, 1, 1,
2.01916, 1.153726, 0.06213963, 0, 0, 1, 1, 1,
2.021804, -0.3366837, 0.03326679, 1, 0, 0, 1, 1,
2.022477, -0.5943601, 2.783491, 1, 0, 0, 1, 1,
2.03728, -0.4771841, 1.089089, 1, 0, 0, 1, 1,
2.041753, -0.5144798, 1.360767, 1, 0, 0, 1, 1,
2.045379, 0.5562154, 3.661796, 1, 0, 0, 1, 1,
2.072507, 1.008919, 0.1989608, 0, 0, 0, 1, 1,
2.101644, -1.925359, 1.262866, 0, 0, 0, 1, 1,
2.114861, 0.2546521, 0.484118, 0, 0, 0, 1, 1,
2.14867, 1.92328, -0.4051303, 0, 0, 0, 1, 1,
2.150261, -0.2900042, 1.461208, 0, 0, 0, 1, 1,
2.20167, -0.8596839, 1.747998, 0, 0, 0, 1, 1,
2.205412, 0.2307999, 2.399166, 0, 0, 0, 1, 1,
2.219535, -1.996058, 3.793297, 1, 1, 1, 1, 1,
2.285115, 1.016345, 0.1799468, 1, 1, 1, 1, 1,
2.33257, -0.2530171, 3.013561, 1, 1, 1, 1, 1,
2.397144, -0.02869451, 2.964258, 1, 1, 1, 1, 1,
2.459031, -0.4325716, 4.466872, 1, 1, 1, 1, 1,
2.550017, -0.7461848, 2.590374, 1, 1, 1, 1, 1,
2.78383, -1.511161, 1.278616, 1, 1, 1, 1, 1
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
var radius = 9.438389;
var distance = 33.15194;
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
mvMatrix.translate( 0.3142387, -0.0380311, 0.02109122 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.15194);
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
