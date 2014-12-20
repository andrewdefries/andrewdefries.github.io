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
-2.829411, 1.012333, -1.896001, 1, 0, 0, 1,
-2.757455, 0.4211913, -0.6855897, 1, 0.007843138, 0, 1,
-2.731495, 0.6372172, 0.8045136, 1, 0.01176471, 0, 1,
-2.706061, 0.07415962, -3.196219, 1, 0.01960784, 0, 1,
-2.705438, 0.08178889, -0.877173, 1, 0.02352941, 0, 1,
-2.661385, -1.205009, -2.863413, 1, 0.03137255, 0, 1,
-2.524737, 0.02439293, -0.2792405, 1, 0.03529412, 0, 1,
-2.474917, -0.8518437, -1.95067, 1, 0.04313726, 0, 1,
-2.406418, -0.4926061, -0.6758903, 1, 0.04705882, 0, 1,
-2.380342, 1.253384, -1.788227, 1, 0.05490196, 0, 1,
-2.361603, -0.6072835, -1.703752, 1, 0.05882353, 0, 1,
-2.345078, 0.3631001, -3.89697, 1, 0.06666667, 0, 1,
-2.343559, 0.2085042, 1.15228, 1, 0.07058824, 0, 1,
-2.291647, 0.1590268, -2.014333, 1, 0.07843138, 0, 1,
-2.262218, -1.666094, -2.388775, 1, 0.08235294, 0, 1,
-2.249066, -1.676565, -1.804317, 1, 0.09019608, 0, 1,
-2.229264, 0.2409317, -1.637079, 1, 0.09411765, 0, 1,
-2.197052, 2.147784, -0.9712443, 1, 0.1019608, 0, 1,
-2.125668, -0.3001538, -2.451543, 1, 0.1098039, 0, 1,
-2.113025, -0.3489184, -2.101895, 1, 0.1137255, 0, 1,
-2.095769, 0.5433859, -0.5457619, 1, 0.1215686, 0, 1,
-2.087092, 1.644326, 0.338679, 1, 0.1254902, 0, 1,
-2.005822, -1.200991, -1.815652, 1, 0.1333333, 0, 1,
-1.991253, 0.01564493, -3.805221, 1, 0.1372549, 0, 1,
-1.98687, -0.1048307, -1.755996, 1, 0.145098, 0, 1,
-1.972001, -1.666819, -2.296775, 1, 0.1490196, 0, 1,
-1.934875, 0.7349521, -0.07696094, 1, 0.1568628, 0, 1,
-1.916098, 0.6757811, -1.78702, 1, 0.1607843, 0, 1,
-1.910926, -0.7055581, -3.073927, 1, 0.1686275, 0, 1,
-1.88869, 1.216351, -1.101065, 1, 0.172549, 0, 1,
-1.879671, 0.2382768, -0.2417201, 1, 0.1803922, 0, 1,
-1.876738, 0.1967557, -2.555781, 1, 0.1843137, 0, 1,
-1.875882, -0.6416095, -1.732775, 1, 0.1921569, 0, 1,
-1.852047, 0.4376081, 1.16624, 1, 0.1960784, 0, 1,
-1.848059, -0.6067219, -2.750295, 1, 0.2039216, 0, 1,
-1.830026, -1.088102, -2.539696, 1, 0.2117647, 0, 1,
-1.771736, -1.009416, -3.438687, 1, 0.2156863, 0, 1,
-1.771164, -1.576146, -3.09476, 1, 0.2235294, 0, 1,
-1.770558, -0.1147258, -1.356741, 1, 0.227451, 0, 1,
-1.767816, 0.09640802, 0.3856718, 1, 0.2352941, 0, 1,
-1.766226, 0.9142439, 0.7852516, 1, 0.2392157, 0, 1,
-1.760969, 0.5863783, -1.996193, 1, 0.2470588, 0, 1,
-1.74775, 0.8771612, -1.343364, 1, 0.2509804, 0, 1,
-1.747382, -0.4926036, -2.699504, 1, 0.2588235, 0, 1,
-1.745067, -0.2090941, -1.86271, 1, 0.2627451, 0, 1,
-1.726763, 0.06421927, -1.474912, 1, 0.2705882, 0, 1,
-1.710719, -0.07965379, -3.102149, 1, 0.2745098, 0, 1,
-1.710101, -0.1105361, -1.759005, 1, 0.282353, 0, 1,
-1.702023, 0.5855392, -0.5512947, 1, 0.2862745, 0, 1,
-1.693009, 1.192661, -1.209813, 1, 0.2941177, 0, 1,
-1.671331, -0.5037327, -1.5392, 1, 0.3019608, 0, 1,
-1.657094, 0.4547897, -2.277118, 1, 0.3058824, 0, 1,
-1.63789, 0.567971, -2.389686, 1, 0.3137255, 0, 1,
-1.616844, 0.702352, -0.865405, 1, 0.3176471, 0, 1,
-1.616699, 1.397382, -0.5621511, 1, 0.3254902, 0, 1,
-1.596703, -1.873423, -2.576235, 1, 0.3294118, 0, 1,
-1.591353, 0.6921403, -1.704887, 1, 0.3372549, 0, 1,
-1.574374, 0.5573516, -1.654293, 1, 0.3411765, 0, 1,
-1.568506, 0.2469935, -0.9577572, 1, 0.3490196, 0, 1,
-1.561602, 0.4902666, -0.01035604, 1, 0.3529412, 0, 1,
-1.552969, 0.9110127, -0.605781, 1, 0.3607843, 0, 1,
-1.54933, 0.5924249, -0.7683726, 1, 0.3647059, 0, 1,
-1.532533, -0.2760945, -0.01050881, 1, 0.372549, 0, 1,
-1.531288, -0.9766105, -1.625163, 1, 0.3764706, 0, 1,
-1.491273, 0.2034532, -0.7255794, 1, 0.3843137, 0, 1,
-1.489448, 0.0406462, -1.215614, 1, 0.3882353, 0, 1,
-1.463271, 0.05304996, -0.9418212, 1, 0.3960784, 0, 1,
-1.460884, 0.4667453, 0.2855204, 1, 0.4039216, 0, 1,
-1.459874, -1.137034, -1.187577, 1, 0.4078431, 0, 1,
-1.435374, 0.2298863, -0.1332135, 1, 0.4156863, 0, 1,
-1.427391, 0.3094851, -1.367122, 1, 0.4196078, 0, 1,
-1.419096, -0.6332291, -0.7727419, 1, 0.427451, 0, 1,
-1.417937, 2.97299, -0.9990582, 1, 0.4313726, 0, 1,
-1.412489, 2.343407, 0.1064397, 1, 0.4392157, 0, 1,
-1.398381, -0.4586577, -0.3933125, 1, 0.4431373, 0, 1,
-1.398032, 0.806242, -0.6865248, 1, 0.4509804, 0, 1,
-1.39358, -1.768931, -3.989175, 1, 0.454902, 0, 1,
-1.37857, 1.143317, -1.209571, 1, 0.4627451, 0, 1,
-1.37166, 0.06204006, -0.9063421, 1, 0.4666667, 0, 1,
-1.363824, 0.3224448, -3.130831, 1, 0.4745098, 0, 1,
-1.361237, 0.9693148, -0.6156545, 1, 0.4784314, 0, 1,
-1.359786, -1.551868, -1.950107, 1, 0.4862745, 0, 1,
-1.350932, 0.3408925, -2.819774, 1, 0.4901961, 0, 1,
-1.346261, -0.4646546, -2.280383, 1, 0.4980392, 0, 1,
-1.339833, -0.8388249, -1.961983, 1, 0.5058824, 0, 1,
-1.339496, -0.7800871, -1.605752, 1, 0.509804, 0, 1,
-1.320101, -0.7202785, -2.005837, 1, 0.5176471, 0, 1,
-1.309552, -0.07943663, -1.949984, 1, 0.5215687, 0, 1,
-1.307862, -1.056549, -2.987011, 1, 0.5294118, 0, 1,
-1.305654, 0.6189211, 0.3215031, 1, 0.5333334, 0, 1,
-1.303013, 0.6021211, -2.066114, 1, 0.5411765, 0, 1,
-1.301809, 1.41233, 0.5075108, 1, 0.5450981, 0, 1,
-1.30179, 1.868089, -0.1102667, 1, 0.5529412, 0, 1,
-1.291791, 0.3010117, -1.529433, 1, 0.5568628, 0, 1,
-1.288498, 0.1703051, -1.49222, 1, 0.5647059, 0, 1,
-1.284247, -0.3349032, -1.943139, 1, 0.5686275, 0, 1,
-1.275757, 0.4812211, -3.35319, 1, 0.5764706, 0, 1,
-1.265439, 0.6345972, -0.5112951, 1, 0.5803922, 0, 1,
-1.260098, -1.459766, -1.110776, 1, 0.5882353, 0, 1,
-1.255897, 1.477035, 0.9065461, 1, 0.5921569, 0, 1,
-1.241565, 0.7972717, -1.193601, 1, 0.6, 0, 1,
-1.239112, -0.299518, -0.06459653, 1, 0.6078432, 0, 1,
-1.234442, -1.726108, -2.617872, 1, 0.6117647, 0, 1,
-1.233042, 1.456882, -0.4041287, 1, 0.6196079, 0, 1,
-1.232273, 2.03792, 0.791633, 1, 0.6235294, 0, 1,
-1.231514, 0.7525319, -0.3564258, 1, 0.6313726, 0, 1,
-1.228045, -0.2703424, -1.48466, 1, 0.6352941, 0, 1,
-1.227244, 0.480172, -1.103638, 1, 0.6431373, 0, 1,
-1.2218, 0.02609875, -2.530305, 1, 0.6470588, 0, 1,
-1.219221, -0.1517466, -2.789052, 1, 0.654902, 0, 1,
-1.214845, 1.225568, -0.02942166, 1, 0.6588235, 0, 1,
-1.213954, -0.06736171, -2.321476, 1, 0.6666667, 0, 1,
-1.213521, -0.7561441, -1.95318, 1, 0.6705883, 0, 1,
-1.203636, -0.6929725, -3.276643, 1, 0.6784314, 0, 1,
-1.20291, 0.6504931, -1.04445, 1, 0.682353, 0, 1,
-1.193297, 0.8799743, 0.9349352, 1, 0.6901961, 0, 1,
-1.190516, -0.7713013, -1.971063, 1, 0.6941177, 0, 1,
-1.182685, -0.3181255, -1.351847, 1, 0.7019608, 0, 1,
-1.17769, -0.6429948, -2.800832, 1, 0.7098039, 0, 1,
-1.175957, 1.749031, -1.177374, 1, 0.7137255, 0, 1,
-1.174726, 0.5348676, -2.055609, 1, 0.7215686, 0, 1,
-1.172325, 0.4949097, -0.2760608, 1, 0.7254902, 0, 1,
-1.163278, 1.72631, 0.1922431, 1, 0.7333333, 0, 1,
-1.161697, 0.8964246, -0.8579042, 1, 0.7372549, 0, 1,
-1.161471, -0.5742289, -0.311891, 1, 0.7450981, 0, 1,
-1.1572, 0.6561509, -1.813879, 1, 0.7490196, 0, 1,
-1.150917, -0.1315666, -3.355295, 1, 0.7568628, 0, 1,
-1.150767, -0.3485393, -2.730407, 1, 0.7607843, 0, 1,
-1.149315, 0.1511091, -1.650295, 1, 0.7686275, 0, 1,
-1.146069, 0.5346786, -1.551913, 1, 0.772549, 0, 1,
-1.136678, -0.1723472, -1.165515, 1, 0.7803922, 0, 1,
-1.133183, 0.8826457, -0.1671042, 1, 0.7843137, 0, 1,
-1.130215, -0.8431085, -3.513753, 1, 0.7921569, 0, 1,
-1.12974, -0.5803831, -1.803288, 1, 0.7960784, 0, 1,
-1.127435, 0.09633046, -2.89092, 1, 0.8039216, 0, 1,
-1.12351, 0.7929764, -0.9839537, 1, 0.8117647, 0, 1,
-1.123056, -1.05312, -2.128942, 1, 0.8156863, 0, 1,
-1.121575, 0.855857, -0.5947418, 1, 0.8235294, 0, 1,
-1.103082, 1.011859, -0.9144577, 1, 0.827451, 0, 1,
-1.10147, 1.214858, 0.605257, 1, 0.8352941, 0, 1,
-1.101173, -0.04849025, -2.869886, 1, 0.8392157, 0, 1,
-1.095546, 1.306973, -0.2338217, 1, 0.8470588, 0, 1,
-1.095331, 1.121929, -1.909664, 1, 0.8509804, 0, 1,
-1.09131, 0.09950582, -1.987976, 1, 0.8588235, 0, 1,
-1.081615, 0.926308, -2.252974, 1, 0.8627451, 0, 1,
-1.076929, -1.157914, -2.478495, 1, 0.8705882, 0, 1,
-1.075945, 1.125118, -0.1027213, 1, 0.8745098, 0, 1,
-1.073468, -0.4034472, -1.850433, 1, 0.8823529, 0, 1,
-1.069111, 0.4745684, -0.6514779, 1, 0.8862745, 0, 1,
-1.066736, -0.01414044, -0.326106, 1, 0.8941177, 0, 1,
-1.061896, -0.1979741, -2.897022, 1, 0.8980392, 0, 1,
-1.057987, 0.5128339, -1.029135, 1, 0.9058824, 0, 1,
-1.052961, 1.223686, -1.783542, 1, 0.9137255, 0, 1,
-1.046812, 0.2862067, -0.4408982, 1, 0.9176471, 0, 1,
-1.035662, -1.582641, -3.573765, 1, 0.9254902, 0, 1,
-1.0344, -1.095589, -2.793414, 1, 0.9294118, 0, 1,
-1.021017, 0.993341, -1.736279, 1, 0.9372549, 0, 1,
-1.018033, -0.4648212, -0.7988605, 1, 0.9411765, 0, 1,
-1.015368, 0.6660129, -0.4697401, 1, 0.9490196, 0, 1,
-1.010162, -0.1160025, -1.824695, 1, 0.9529412, 0, 1,
-1.006177, 0.8656734, -1.200687, 1, 0.9607843, 0, 1,
-0.9994944, -1.66217, -2.743647, 1, 0.9647059, 0, 1,
-0.9941844, 0.1983837, 0.1252197, 1, 0.972549, 0, 1,
-0.9913892, -0.07180529, -1.751243, 1, 0.9764706, 0, 1,
-0.9870616, -0.8041655, -1.388377, 1, 0.9843137, 0, 1,
-0.9828542, -0.5043097, -2.690431, 1, 0.9882353, 0, 1,
-0.9744822, -1.161891, -4.011324, 1, 0.9960784, 0, 1,
-0.96782, -0.8974983, -1.55829, 0.9960784, 1, 0, 1,
-0.967628, -1.816939, -1.36645, 0.9921569, 1, 0, 1,
-0.9665496, -1.88232, -1.358096, 0.9843137, 1, 0, 1,
-0.9546615, -1.645637, -2.148423, 0.9803922, 1, 0, 1,
-0.9538484, -0.05719095, -0.6210315, 0.972549, 1, 0, 1,
-0.952666, -0.2105889, -2.754668, 0.9686275, 1, 0, 1,
-0.9494227, 0.6312189, -1.799031, 0.9607843, 1, 0, 1,
-0.9484676, -1.039094, -2.161709, 0.9568627, 1, 0, 1,
-0.9451468, 0.02418695, -2.819836, 0.9490196, 1, 0, 1,
-0.940419, 0.9779224, -0.5231376, 0.945098, 1, 0, 1,
-0.9399029, -0.04525068, -0.5929479, 0.9372549, 1, 0, 1,
-0.9369058, 1.646798, 0.05752766, 0.9333333, 1, 0, 1,
-0.9365582, -0.104198, -2.406216, 0.9254902, 1, 0, 1,
-0.934278, -0.8405131, -2.035843, 0.9215686, 1, 0, 1,
-0.9339251, 0.4270182, -1.264363, 0.9137255, 1, 0, 1,
-0.9257314, -0.9594376, -1.774835, 0.9098039, 1, 0, 1,
-0.9247242, 0.9701763, -2.273007, 0.9019608, 1, 0, 1,
-0.9144176, -0.3185008, -3.622123, 0.8941177, 1, 0, 1,
-0.9139217, -0.133225, -1.323511, 0.8901961, 1, 0, 1,
-0.9063287, 0.306588, -1.064075, 0.8823529, 1, 0, 1,
-0.8937242, -0.007470928, -2.906026, 0.8784314, 1, 0, 1,
-0.8867084, 0.5730227, 0.5531365, 0.8705882, 1, 0, 1,
-0.8852072, 1.214825, -0.3860207, 0.8666667, 1, 0, 1,
-0.8822916, 0.143567, -2.848357, 0.8588235, 1, 0, 1,
-0.873273, 0.1927859, -1.676895, 0.854902, 1, 0, 1,
-0.8682498, 0.3755516, -1.738058, 0.8470588, 1, 0, 1,
-0.8664176, -0.9055678, -1.074888, 0.8431373, 1, 0, 1,
-0.8610505, -1.222339, -3.098487, 0.8352941, 1, 0, 1,
-0.8603194, 0.2792662, -1.601371, 0.8313726, 1, 0, 1,
-0.858382, -1.142387, -3.121037, 0.8235294, 1, 0, 1,
-0.8565328, 0.550077, -2.050784, 0.8196079, 1, 0, 1,
-0.8490138, -0.4471231, -2.655202, 0.8117647, 1, 0, 1,
-0.8341261, 1.947059, 0.3540555, 0.8078431, 1, 0, 1,
-0.8331065, 0.0682286, -1.291177, 0.8, 1, 0, 1,
-0.8282175, -0.8554354, -1.854167, 0.7921569, 1, 0, 1,
-0.827099, 0.8391557, -1.29104, 0.7882353, 1, 0, 1,
-0.8255466, 1.057884, -2.397485, 0.7803922, 1, 0, 1,
-0.8219963, 1.600527, 0.206736, 0.7764706, 1, 0, 1,
-0.8146607, -0.1108512, -1.517057, 0.7686275, 1, 0, 1,
-0.8131239, 3.624958, 0.06418447, 0.7647059, 1, 0, 1,
-0.8091949, 0.1161267, -1.391634, 0.7568628, 1, 0, 1,
-0.8089948, 0.3030149, -1.224976, 0.7529412, 1, 0, 1,
-0.8079733, 1.94846, -0.4767342, 0.7450981, 1, 0, 1,
-0.8079555, 0.02626634, -1.145705, 0.7411765, 1, 0, 1,
-0.8062179, -0.6201201, -2.673845, 0.7333333, 1, 0, 1,
-0.7966983, -0.3267802, -4.227355, 0.7294118, 1, 0, 1,
-0.7941456, 0.07074642, -1.71387, 0.7215686, 1, 0, 1,
-0.7939637, 0.4991652, 0.4547115, 0.7176471, 1, 0, 1,
-0.7939051, -0.3121336, -2.719357, 0.7098039, 1, 0, 1,
-0.7894025, 2.087149, 1.114144, 0.7058824, 1, 0, 1,
-0.7861617, 1.593249, -1.785972, 0.6980392, 1, 0, 1,
-0.7815664, 0.2904058, -2.037335, 0.6901961, 1, 0, 1,
-0.778358, 1.575246, 0.4868513, 0.6862745, 1, 0, 1,
-0.7746716, 0.03619309, 0.4565578, 0.6784314, 1, 0, 1,
-0.7716632, -0.1251071, -0.4478646, 0.6745098, 1, 0, 1,
-0.7659366, 1.419915, 0.4025007, 0.6666667, 1, 0, 1,
-0.7612755, -2.067482, -2.315803, 0.6627451, 1, 0, 1,
-0.7581972, 0.9976959, 0.1148554, 0.654902, 1, 0, 1,
-0.7533011, 0.2863487, -0.4080978, 0.6509804, 1, 0, 1,
-0.7495626, 1.600399, -1.505724, 0.6431373, 1, 0, 1,
-0.7493291, -0.5922474, 0.8266681, 0.6392157, 1, 0, 1,
-0.746497, -2.375749, -4.168906, 0.6313726, 1, 0, 1,
-0.7463719, -0.5504755, -0.1946657, 0.627451, 1, 0, 1,
-0.7454067, 2.347418, -0.6317059, 0.6196079, 1, 0, 1,
-0.7354486, -0.06638812, -3.023203, 0.6156863, 1, 0, 1,
-0.7345446, -1.75836, -4.245501, 0.6078432, 1, 0, 1,
-0.7289233, -1.210623, -2.942166, 0.6039216, 1, 0, 1,
-0.7240092, -0.7772602, -2.130725, 0.5960785, 1, 0, 1,
-0.7221951, -0.5072832, -2.795137, 0.5882353, 1, 0, 1,
-0.7212902, -1.608978, -2.809797, 0.5843138, 1, 0, 1,
-0.7208282, -1.095224, -3.147758, 0.5764706, 1, 0, 1,
-0.7141395, -0.1664343, -3.40902, 0.572549, 1, 0, 1,
-0.6997787, -0.6048521, 0.09523418, 0.5647059, 1, 0, 1,
-0.6992953, -1.032426, -1.996351, 0.5607843, 1, 0, 1,
-0.695479, 0.3069706, -1.69688, 0.5529412, 1, 0, 1,
-0.6939601, -1.208889, -0.8993847, 0.5490196, 1, 0, 1,
-0.6908937, 0.7735242, -1.139283, 0.5411765, 1, 0, 1,
-0.6906361, -0.1064493, -2.740319, 0.5372549, 1, 0, 1,
-0.6886217, -0.07765981, -1.047479, 0.5294118, 1, 0, 1,
-0.6839349, -1.18358, -4.207504, 0.5254902, 1, 0, 1,
-0.683889, 0.728645, -3.333651, 0.5176471, 1, 0, 1,
-0.6804879, -0.2080339, -0.9191282, 0.5137255, 1, 0, 1,
-0.6743436, -1.888735, -5.421337, 0.5058824, 1, 0, 1,
-0.6676372, -0.3424574, -3.831931, 0.5019608, 1, 0, 1,
-0.6623873, 0.6695967, -1.179883, 0.4941176, 1, 0, 1,
-0.6611531, -0.6206095, -4.624457, 0.4862745, 1, 0, 1,
-0.6540479, 0.6336447, -0.9689986, 0.4823529, 1, 0, 1,
-0.6491581, 1.144217, -1.036463, 0.4745098, 1, 0, 1,
-0.6484454, 0.04142275, -2.160383, 0.4705882, 1, 0, 1,
-0.6426663, -0.1255656, -2.103505, 0.4627451, 1, 0, 1,
-0.6400818, 1.138122, 0.9163679, 0.4588235, 1, 0, 1,
-0.6323309, -0.1762666, -2.4252, 0.4509804, 1, 0, 1,
-0.6314172, -0.08681411, -2.599853, 0.4470588, 1, 0, 1,
-0.6298604, 0.9678261, -0.7431141, 0.4392157, 1, 0, 1,
-0.6296184, -0.4957115, -0.9292187, 0.4352941, 1, 0, 1,
-0.6287606, -1.212164, -3.01726, 0.427451, 1, 0, 1,
-0.6127213, -0.8648667, -1.741136, 0.4235294, 1, 0, 1,
-0.6124362, 0.5167909, -1.467479, 0.4156863, 1, 0, 1,
-0.6104237, 0.583976, -0.5484493, 0.4117647, 1, 0, 1,
-0.5998377, 0.8708563, -1.472341, 0.4039216, 1, 0, 1,
-0.5968739, -0.9468923, -2.568773, 0.3960784, 1, 0, 1,
-0.59527, -0.2269383, -3.766664, 0.3921569, 1, 0, 1,
-0.5938814, 0.2644781, -1.570888, 0.3843137, 1, 0, 1,
-0.5915923, 1.652281, 0.8836856, 0.3803922, 1, 0, 1,
-0.5892129, -1.298866, -3.056067, 0.372549, 1, 0, 1,
-0.5876583, -0.2791261, -1.005884, 0.3686275, 1, 0, 1,
-0.5822765, 0.5383973, -0.05345725, 0.3607843, 1, 0, 1,
-0.58196, 0.3053851, -3.508042, 0.3568628, 1, 0, 1,
-0.5818663, 0.3799815, -1.893847, 0.3490196, 1, 0, 1,
-0.5707297, -0.03491579, -0.714085, 0.345098, 1, 0, 1,
-0.5702038, 0.5261144, -0.5297579, 0.3372549, 1, 0, 1,
-0.5670555, 0.2840921, -1.227147, 0.3333333, 1, 0, 1,
-0.5662434, -0.8910559, -2.076871, 0.3254902, 1, 0, 1,
-0.5660256, -0.3911649, -1.779067, 0.3215686, 1, 0, 1,
-0.56226, 1.199205, -0.3651188, 0.3137255, 1, 0, 1,
-0.5615278, 0.2569252, -1.556139, 0.3098039, 1, 0, 1,
-0.5615141, -0.4117747, -1.729137, 0.3019608, 1, 0, 1,
-0.560069, 0.9175675, 0.5600051, 0.2941177, 1, 0, 1,
-0.5570725, -0.7075148, -3.75325, 0.2901961, 1, 0, 1,
-0.5542861, 0.2644171, -1.368211, 0.282353, 1, 0, 1,
-0.5530233, 0.1697773, -2.915368, 0.2784314, 1, 0, 1,
-0.5501514, 0.5913344, -1.406755, 0.2705882, 1, 0, 1,
-0.543313, 0.5194155, 0.3344524, 0.2666667, 1, 0, 1,
-0.5431679, -0.3455833, -1.234553, 0.2588235, 1, 0, 1,
-0.5353892, -0.4144588, -1.719214, 0.254902, 1, 0, 1,
-0.5278264, -0.0344215, -1.431858, 0.2470588, 1, 0, 1,
-0.5258225, 0.3680571, -0.8394595, 0.2431373, 1, 0, 1,
-0.5159289, 0.7434391, 0.1733873, 0.2352941, 1, 0, 1,
-0.5121613, 1.186739, -0.4936029, 0.2313726, 1, 0, 1,
-0.510686, 0.0467942, 0.9882779, 0.2235294, 1, 0, 1,
-0.5060064, -0.7234924, -3.187999, 0.2196078, 1, 0, 1,
-0.5038275, -1.289035, -2.848981, 0.2117647, 1, 0, 1,
-0.5028418, 0.3206428, 0.1346565, 0.2078431, 1, 0, 1,
-0.5012237, -0.5904121, -3.237215, 0.2, 1, 0, 1,
-0.4971543, -0.5048237, -2.573108, 0.1921569, 1, 0, 1,
-0.4948526, 1.405393, -0.7644252, 0.1882353, 1, 0, 1,
-0.4942826, -0.4050669, -2.264826, 0.1803922, 1, 0, 1,
-0.4906314, 0.8811805, 0.08379956, 0.1764706, 1, 0, 1,
-0.4819303, -1.039217, -1.497077, 0.1686275, 1, 0, 1,
-0.4780801, -0.1294847, -0.655452, 0.1647059, 1, 0, 1,
-0.4736063, 1.686013, -1.067117, 0.1568628, 1, 0, 1,
-0.4729412, -0.2871694, -1.553261, 0.1529412, 1, 0, 1,
-0.4727992, -1.649673, -2.618454, 0.145098, 1, 0, 1,
-0.4718061, -0.5697287, -1.667115, 0.1411765, 1, 0, 1,
-0.464217, -0.2522327, -1.711329, 0.1333333, 1, 0, 1,
-0.4625393, 1.828077, -0.5644991, 0.1294118, 1, 0, 1,
-0.4583549, 2.867476, -1.25012, 0.1215686, 1, 0, 1,
-0.4563417, -0.9915232, -2.922297, 0.1176471, 1, 0, 1,
-0.4532702, 0.09064578, -2.888318, 0.1098039, 1, 0, 1,
-0.4505819, 1.028202, -1.220794, 0.1058824, 1, 0, 1,
-0.4503292, 0.06418918, 0.4349517, 0.09803922, 1, 0, 1,
-0.4484638, -0.01494471, -1.57267, 0.09019608, 1, 0, 1,
-0.4474348, 1.672196, -0.4413282, 0.08627451, 1, 0, 1,
-0.4467475, -0.4381427, -0.9608899, 0.07843138, 1, 0, 1,
-0.4445168, -0.05119903, -2.625959, 0.07450981, 1, 0, 1,
-0.4431276, -1.135232, -3.471332, 0.06666667, 1, 0, 1,
-0.4414243, 0.1391073, -1.338314, 0.0627451, 1, 0, 1,
-0.4351183, -0.3662659, -2.000206, 0.05490196, 1, 0, 1,
-0.4349362, -0.4459335, -3.977714, 0.05098039, 1, 0, 1,
-0.4345649, 0.02861238, -0.6831725, 0.04313726, 1, 0, 1,
-0.4302819, 0.2287752, -1.162504, 0.03921569, 1, 0, 1,
-0.4261896, 0.2017697, -1.646054, 0.03137255, 1, 0, 1,
-0.4256127, -0.7960459, -3.23373, 0.02745098, 1, 0, 1,
-0.4248233, -1.382026, -1.974034, 0.01960784, 1, 0, 1,
-0.422819, 0.5661867, 0.3152123, 0.01568628, 1, 0, 1,
-0.4217663, -1.325166, -2.775104, 0.007843138, 1, 0, 1,
-0.4174626, -0.7512949, -1.859071, 0.003921569, 1, 0, 1,
-0.4155739, -1.279758, -3.980399, 0, 1, 0.003921569, 1,
-0.4155647, 0.7441337, 0.2219854, 0, 1, 0.01176471, 1,
-0.412695, 0.3870085, -0.9974392, 0, 1, 0.01568628, 1,
-0.412464, 1.168638, 0.2381368, 0, 1, 0.02352941, 1,
-0.4090683, 0.3072819, -0.6704436, 0, 1, 0.02745098, 1,
-0.4071902, -0.2197835, -1.298283, 0, 1, 0.03529412, 1,
-0.4058663, 1.983198, 0.0440098, 0, 1, 0.03921569, 1,
-0.4051779, 0.2943083, -2.567048, 0, 1, 0.04705882, 1,
-0.4014668, -1.504133, -2.291507, 0, 1, 0.05098039, 1,
-0.4013644, 0.1561432, -1.196558, 0, 1, 0.05882353, 1,
-0.4011987, 0.5133419, 0.3699269, 0, 1, 0.0627451, 1,
-0.3987994, -1.188044, -2.495067, 0, 1, 0.07058824, 1,
-0.398132, 0.5446187, -2.101996, 0, 1, 0.07450981, 1,
-0.39432, 1.26079, 0.6456115, 0, 1, 0.08235294, 1,
-0.3921475, 0.7604438, -1.519499, 0, 1, 0.08627451, 1,
-0.3910279, 1.60809, 0.47848, 0, 1, 0.09411765, 1,
-0.3843036, 1.313831, -0.6002603, 0, 1, 0.1019608, 1,
-0.3830234, -1.16822, -2.363142, 0, 1, 0.1058824, 1,
-0.3809451, -0.9511666, -1.685795, 0, 1, 0.1137255, 1,
-0.3797556, -1.134434, -1.73338, 0, 1, 0.1176471, 1,
-0.3764123, -0.2556385, -1.894109, 0, 1, 0.1254902, 1,
-0.3746983, 0.5220548, -1.408839, 0, 1, 0.1294118, 1,
-0.3743403, 0.08685938, -1.631547, 0, 1, 0.1372549, 1,
-0.3716854, -1.118626, -2.747146, 0, 1, 0.1411765, 1,
-0.3715573, -0.4734922, -2.85048, 0, 1, 0.1490196, 1,
-0.3616525, -0.8368099, -0.00299044, 0, 1, 0.1529412, 1,
-0.360366, 2.254818, 0.06662916, 0, 1, 0.1607843, 1,
-0.3593109, 0.7953801, -1.595379, 0, 1, 0.1647059, 1,
-0.3590207, 2.107371, 1.251799, 0, 1, 0.172549, 1,
-0.3564271, 0.3974469, 0.06384663, 0, 1, 0.1764706, 1,
-0.3552909, -0.7109134, -1.858505, 0, 1, 0.1843137, 1,
-0.3551342, 0.8559578, -0.7495349, 0, 1, 0.1882353, 1,
-0.3465014, -1.793702, -2.85138, 0, 1, 0.1960784, 1,
-0.345327, -0.544489, -1.499761, 0, 1, 0.2039216, 1,
-0.3434841, -1.17203, -2.120019, 0, 1, 0.2078431, 1,
-0.3424147, -0.9255763, -2.147377, 0, 1, 0.2156863, 1,
-0.338501, -1.003096, -2.061782, 0, 1, 0.2196078, 1,
-0.3346161, 1.025151, -0.8482071, 0, 1, 0.227451, 1,
-0.3326824, 0.8190361, 0.2953261, 0, 1, 0.2313726, 1,
-0.3312908, 0.9091504, 0.8751226, 0, 1, 0.2392157, 1,
-0.3312511, -0.5411228, -1.962222, 0, 1, 0.2431373, 1,
-0.3307908, -0.8112568, -3.934401, 0, 1, 0.2509804, 1,
-0.3269275, 1.558839, -1.269566, 0, 1, 0.254902, 1,
-0.3236497, -1.777409, -3.780337, 0, 1, 0.2627451, 1,
-0.3210087, 0.5345683, -1.6238, 0, 1, 0.2666667, 1,
-0.3194951, 1.30921, -1.039519, 0, 1, 0.2745098, 1,
-0.3176951, 0.2470656, -2.861938, 0, 1, 0.2784314, 1,
-0.3136034, -0.2821078, -1.736995, 0, 1, 0.2862745, 1,
-0.3111033, -0.6791198, -3.197585, 0, 1, 0.2901961, 1,
-0.3103933, 0.3956746, -0.9610014, 0, 1, 0.2980392, 1,
-0.3059037, 0.7341948, 0.3638574, 0, 1, 0.3058824, 1,
-0.3055064, 0.7754165, -0.01631722, 0, 1, 0.3098039, 1,
-0.3054414, 0.01367592, -2.128564, 0, 1, 0.3176471, 1,
-0.2989101, 0.3615841, -0.3903705, 0, 1, 0.3215686, 1,
-0.2968174, 2.746611, -0.1026796, 0, 1, 0.3294118, 1,
-0.2878415, 0.3537826, -1.663952, 0, 1, 0.3333333, 1,
-0.2853984, 0.7542179, -0.3705606, 0, 1, 0.3411765, 1,
-0.2836892, 0.6635324, 0.6224349, 0, 1, 0.345098, 1,
-0.2835891, 1.369422, -0.1896761, 0, 1, 0.3529412, 1,
-0.2745833, 0.139076, 0.4845399, 0, 1, 0.3568628, 1,
-0.2736245, 1.278069, -0.9404185, 0, 1, 0.3647059, 1,
-0.2666897, -0.2563792, -1.506873, 0, 1, 0.3686275, 1,
-0.2592386, 1.226403, -0.169401, 0, 1, 0.3764706, 1,
-0.2576679, -0.3911803, -2.17342, 0, 1, 0.3803922, 1,
-0.2539286, 0.8981947, -0.2426344, 0, 1, 0.3882353, 1,
-0.2515826, 0.3681264, -0.6184235, 0, 1, 0.3921569, 1,
-0.2493186, 0.3421569, 1.220269, 0, 1, 0.4, 1,
-0.2468915, 0.4950145, 0.2844286, 0, 1, 0.4078431, 1,
-0.2428804, 0.2534031, -1.408577, 0, 1, 0.4117647, 1,
-0.2415083, 2.20344, 0.9505605, 0, 1, 0.4196078, 1,
-0.236301, -2.639556, -2.453324, 0, 1, 0.4235294, 1,
-0.2333696, -0.74199, -1.983539, 0, 1, 0.4313726, 1,
-0.2315653, -0.4195787, -2.455634, 0, 1, 0.4352941, 1,
-0.2290321, -2.062226, -3.019055, 0, 1, 0.4431373, 1,
-0.2261004, 0.3993439, 0.2897132, 0, 1, 0.4470588, 1,
-0.2257855, -0.878963, -4.302507, 0, 1, 0.454902, 1,
-0.223648, 0.8089225, -0.9570282, 0, 1, 0.4588235, 1,
-0.2216946, 0.5729842, -0.003664651, 0, 1, 0.4666667, 1,
-0.2140145, 1.107776, -0.1547723, 0, 1, 0.4705882, 1,
-0.2125657, 1.163993, -0.6615982, 0, 1, 0.4784314, 1,
-0.2110825, -0.5535119, -3.779063, 0, 1, 0.4823529, 1,
-0.2074758, 0.2905224, 0.9838915, 0, 1, 0.4901961, 1,
-0.1994106, 1.350008, 0.06447222, 0, 1, 0.4941176, 1,
-0.1966309, 0.5224985, 0.5367304, 0, 1, 0.5019608, 1,
-0.1954156, -0.08731017, -0.5840057, 0, 1, 0.509804, 1,
-0.1912349, 0.7939593, -0.5618629, 0, 1, 0.5137255, 1,
-0.1840367, 0.5411295, 0.344923, 0, 1, 0.5215687, 1,
-0.183166, 0.9546455, 0.5034413, 0, 1, 0.5254902, 1,
-0.1826037, -0.13795, -2.882712, 0, 1, 0.5333334, 1,
-0.177812, -0.4655324, -1.88141, 0, 1, 0.5372549, 1,
-0.1752501, 1.157411, -2.935257, 0, 1, 0.5450981, 1,
-0.1743763, 1.111551, 0.06374776, 0, 1, 0.5490196, 1,
-0.1742124, 0.2710024, -0.154985, 0, 1, 0.5568628, 1,
-0.1659748, -1.362876, -3.400053, 0, 1, 0.5607843, 1,
-0.1656294, 0.6576736, 0.4941325, 0, 1, 0.5686275, 1,
-0.1634105, 0.07853155, -0.6767466, 0, 1, 0.572549, 1,
-0.1593047, -0.5874794, -2.889194, 0, 1, 0.5803922, 1,
-0.1587411, -0.04217644, -2.360056, 0, 1, 0.5843138, 1,
-0.1585755, 0.08080359, -1.55077, 0, 1, 0.5921569, 1,
-0.1494202, 2.328837, -1.321616, 0, 1, 0.5960785, 1,
-0.1438427, -0.2935749, -2.837088, 0, 1, 0.6039216, 1,
-0.1425768, 0.8893921, -0.1236104, 0, 1, 0.6117647, 1,
-0.1350252, 1.331935, -1.119577, 0, 1, 0.6156863, 1,
-0.1344497, -1.451971, -2.650035, 0, 1, 0.6235294, 1,
-0.1322971, 0.1414631, -2.804569, 0, 1, 0.627451, 1,
-0.1267812, 0.7234251, -1.814562, 0, 1, 0.6352941, 1,
-0.1249675, -0.9938843, -3.890403, 0, 1, 0.6392157, 1,
-0.120108, 0.3689497, 0.1422749, 0, 1, 0.6470588, 1,
-0.1174755, 0.199454, -1.246669, 0, 1, 0.6509804, 1,
-0.1132302, -0.8277504, -4.22661, 0, 1, 0.6588235, 1,
-0.1100811, 0.8892164, -0.8937306, 0, 1, 0.6627451, 1,
-0.1093315, -0.5849698, -4.076443, 0, 1, 0.6705883, 1,
-0.1066893, -0.7353188, -4.137285, 0, 1, 0.6745098, 1,
-0.09995018, 0.2740652, -0.4253173, 0, 1, 0.682353, 1,
-0.09461234, 0.3024479, -0.916214, 0, 1, 0.6862745, 1,
-0.09450434, -0.6297941, -2.890884, 0, 1, 0.6941177, 1,
-0.09401506, -1.525984, -2.047672, 0, 1, 0.7019608, 1,
-0.08874001, 0.9601801, 0.3541022, 0, 1, 0.7058824, 1,
-0.07764794, 0.3738034, 0.1249072, 0, 1, 0.7137255, 1,
-0.06977358, -0.7914504, -3.433227, 0, 1, 0.7176471, 1,
-0.06931876, 0.1191114, -0.6512923, 0, 1, 0.7254902, 1,
-0.06927175, 1.286047, 0.3068752, 0, 1, 0.7294118, 1,
-0.06790754, -0.111252, -3.818325, 0, 1, 0.7372549, 1,
-0.06624246, 1.019969, -0.2302836, 0, 1, 0.7411765, 1,
-0.06339704, 1.51336, 0.4290203, 0, 1, 0.7490196, 1,
-0.05950776, 0.2886283, -0.916791, 0, 1, 0.7529412, 1,
-0.0566309, 0.7036377, -0.3847449, 0, 1, 0.7607843, 1,
-0.05648625, 2.131485, 0.9141882, 0, 1, 0.7647059, 1,
-0.05133773, 0.006771712, 1.030046, 0, 1, 0.772549, 1,
-0.04629416, -0.1023178, -4.609691, 0, 1, 0.7764706, 1,
-0.04567937, 0.1804872, 0.2555968, 0, 1, 0.7843137, 1,
-0.04506055, -0.2264296, -3.331719, 0, 1, 0.7882353, 1,
-0.04419778, -0.3571128, -2.694145, 0, 1, 0.7960784, 1,
-0.04409067, 1.047595, -0.5424822, 0, 1, 0.8039216, 1,
-0.04376862, -0.8454969, -2.608403, 0, 1, 0.8078431, 1,
-0.04359155, 0.2706778, 0.3548725, 0, 1, 0.8156863, 1,
-0.04322078, 0.1681235, 0.1210527, 0, 1, 0.8196079, 1,
-0.0366936, 1.459884, -1.65073, 0, 1, 0.827451, 1,
-0.03468931, 0.7809519, 1.021334, 0, 1, 0.8313726, 1,
-0.03338067, -0.4297693, -3.907976, 0, 1, 0.8392157, 1,
-0.02958925, -0.2442047, -3.871877, 0, 1, 0.8431373, 1,
-0.02923741, -0.8556056, -2.686707, 0, 1, 0.8509804, 1,
-0.0274674, 1.919606, -1.579782, 0, 1, 0.854902, 1,
-0.0244581, 0.3090634, 0.4526762, 0, 1, 0.8627451, 1,
-0.02424731, -0.8047149, -3.926865, 0, 1, 0.8666667, 1,
-0.02095658, 0.3900741, 0.08272227, 0, 1, 0.8745098, 1,
-0.01477342, 1.559365, 0.05911048, 0, 1, 0.8784314, 1,
-0.01463886, 0.592413, -1.976096, 0, 1, 0.8862745, 1,
-0.008096996, 1.510369, 0.1255529, 0, 1, 0.8901961, 1,
-0.007742215, 0.442344, 1.270354, 0, 1, 0.8980392, 1,
-0.007730872, -0.4965459, -3.857685, 0, 1, 0.9058824, 1,
-0.001195422, -2.130454, -2.360973, 0, 1, 0.9098039, 1,
-0.0009599099, 1.433288, -1.533995, 0, 1, 0.9176471, 1,
-0.0004992377, 1.266122, -0.0438724, 0, 1, 0.9215686, 1,
0.0006871714, -1.901052, 1.786536, 0, 1, 0.9294118, 1,
0.002066018, 1.401413, 1.689178, 0, 1, 0.9333333, 1,
0.005828001, -1.031275, 3.410365, 0, 1, 0.9411765, 1,
0.007362546, -1.053081, 2.309601, 0, 1, 0.945098, 1,
0.01009617, 0.1109327, -1.626446, 0, 1, 0.9529412, 1,
0.01419937, -0.8588215, 4.600894, 0, 1, 0.9568627, 1,
0.01470409, -0.8602561, 2.777532, 0, 1, 0.9647059, 1,
0.01500202, -0.7854272, 2.313183, 0, 1, 0.9686275, 1,
0.02369553, 1.000028, -2.771467, 0, 1, 0.9764706, 1,
0.03188025, -2.374837, 2.550788, 0, 1, 0.9803922, 1,
0.03264431, 0.6248974, 0.1638302, 0, 1, 0.9882353, 1,
0.03937144, -0.08946052, 3.338448, 0, 1, 0.9921569, 1,
0.04606016, 0.6604177, 0.2306565, 0, 1, 1, 1,
0.04612, -0.6197584, 3.475263, 0, 0.9921569, 1, 1,
0.05141497, 0.9178684, 0.1419507, 0, 0.9882353, 1, 1,
0.05641934, -1.688756, 3.11429, 0, 0.9803922, 1, 1,
0.05934361, -0.3517866, 2.623424, 0, 0.9764706, 1, 1,
0.05995338, 1.578055, -0.4128239, 0, 0.9686275, 1, 1,
0.06158892, 1.804086, -0.06811696, 0, 0.9647059, 1, 1,
0.06248389, -0.6286472, 3.023087, 0, 0.9568627, 1, 1,
0.06740086, 0.3869988, 1.313905, 0, 0.9529412, 1, 1,
0.06951654, 1.809637, -0.6491783, 0, 0.945098, 1, 1,
0.07029255, -0.3958755, 3.203809, 0, 0.9411765, 1, 1,
0.07190452, 1.46875, -0.2855768, 0, 0.9333333, 1, 1,
0.07242239, 1.678094, -0.8587857, 0, 0.9294118, 1, 1,
0.07318342, -2.014923, 4.961398, 0, 0.9215686, 1, 1,
0.07339363, 0.3046184, 0.601211, 0, 0.9176471, 1, 1,
0.077081, -0.06589872, 2.347138, 0, 0.9098039, 1, 1,
0.07877547, 1.425007, 0.1053834, 0, 0.9058824, 1, 1,
0.08129702, -1.285154, 4.117879, 0, 0.8980392, 1, 1,
0.08142348, -0.102509, 2.616553, 0, 0.8901961, 1, 1,
0.08697874, -0.9405977, 3.736648, 0, 0.8862745, 1, 1,
0.08781173, -0.9833255, 5.123736, 0, 0.8784314, 1, 1,
0.09287264, 0.08770254, -0.2906506, 0, 0.8745098, 1, 1,
0.09728424, 0.9394422, -0.8693117, 0, 0.8666667, 1, 1,
0.1046491, -0.344112, 3.106768, 0, 0.8627451, 1, 1,
0.1056991, 2.029995, 2.334888, 0, 0.854902, 1, 1,
0.1129695, 1.188158, -0.6318619, 0, 0.8509804, 1, 1,
0.1149827, 1.775892, -0.9076347, 0, 0.8431373, 1, 1,
0.1191317, -0.2708102, 1.859567, 0, 0.8392157, 1, 1,
0.1243475, -0.2052305, 4.016642, 0, 0.8313726, 1, 1,
0.1264239, 0.916009, 0.2881782, 0, 0.827451, 1, 1,
0.1271251, 1.105797, 0.06556898, 0, 0.8196079, 1, 1,
0.1287867, -1.482467, 2.53459, 0, 0.8156863, 1, 1,
0.1297126, -0.2483284, 2.931046, 0, 0.8078431, 1, 1,
0.1321447, 0.9801621, -0.4901344, 0, 0.8039216, 1, 1,
0.1332019, 0.6117858, 1.188939, 0, 0.7960784, 1, 1,
0.1337375, 0.0108788, 2.858254, 0, 0.7882353, 1, 1,
0.1350742, 2.423761, 0.5000155, 0, 0.7843137, 1, 1,
0.1363744, -0.387557, 2.867131, 0, 0.7764706, 1, 1,
0.1381044, 1.011525, -0.199946, 0, 0.772549, 1, 1,
0.1386215, 0.5150023, -1.265388, 0, 0.7647059, 1, 1,
0.1393402, -0.233011, 3.123326, 0, 0.7607843, 1, 1,
0.1431235, 0.6102723, 0.2868834, 0, 0.7529412, 1, 1,
0.1503397, -0.3630973, 1.546783, 0, 0.7490196, 1, 1,
0.1509418, 0.3050505, 0.7300487, 0, 0.7411765, 1, 1,
0.1527968, -0.7480351, 2.731455, 0, 0.7372549, 1, 1,
0.1534414, 0.1039716, -0.005452424, 0, 0.7294118, 1, 1,
0.1631049, 0.9437615, -1.245954, 0, 0.7254902, 1, 1,
0.166061, 0.1829847, 1.773139, 0, 0.7176471, 1, 1,
0.1679018, 1.981463, 2.019711, 0, 0.7137255, 1, 1,
0.1681381, -0.3185008, 4.023962, 0, 0.7058824, 1, 1,
0.1686696, 1.012416, -0.04472658, 0, 0.6980392, 1, 1,
0.1711489, -1.00361, 3.472658, 0, 0.6941177, 1, 1,
0.1740756, 0.1707076, 2.240415, 0, 0.6862745, 1, 1,
0.1746477, -0.3140511, 1.192137, 0, 0.682353, 1, 1,
0.1758503, 0.9711502, 0.9456143, 0, 0.6745098, 1, 1,
0.178811, -0.9683829, 3.266548, 0, 0.6705883, 1, 1,
0.1849824, 0.6879934, -0.5654812, 0, 0.6627451, 1, 1,
0.1853115, 0.7355764, -1.601709, 0, 0.6588235, 1, 1,
0.1866152, 0.8831225, -0.2198585, 0, 0.6509804, 1, 1,
0.1930836, 0.1165531, 1.528547, 0, 0.6470588, 1, 1,
0.1938359, -2.493116, 3.234893, 0, 0.6392157, 1, 1,
0.1949457, 0.5088782, -0.1623926, 0, 0.6352941, 1, 1,
0.1961702, -0.3169169, 2.896052, 0, 0.627451, 1, 1,
0.1989353, -0.5319836, 3.528165, 0, 0.6235294, 1, 1,
0.2047247, 0.5690905, 0.5927066, 0, 0.6156863, 1, 1,
0.2078463, -0.9585907, 1.974157, 0, 0.6117647, 1, 1,
0.2095913, 0.3469499, 0.1414154, 0, 0.6039216, 1, 1,
0.211154, -0.4624946, 2.312809, 0, 0.5960785, 1, 1,
0.2147537, -0.5499771, 2.80429, 0, 0.5921569, 1, 1,
0.2173842, 1.116153, -1.613232, 0, 0.5843138, 1, 1,
0.2194818, -0.528028, 1.064823, 0, 0.5803922, 1, 1,
0.2201941, 0.507814, -0.7910866, 0, 0.572549, 1, 1,
0.221763, -1.808353, 1.44001, 0, 0.5686275, 1, 1,
0.2219634, -0.5033232, 1.576803, 0, 0.5607843, 1, 1,
0.2220735, 1.157613, -0.2745487, 0, 0.5568628, 1, 1,
0.2222062, 0.2066745, 0.7917822, 0, 0.5490196, 1, 1,
0.2261855, 0.2635188, 0.01725061, 0, 0.5450981, 1, 1,
0.2285273, 1.616752, -1.001662, 0, 0.5372549, 1, 1,
0.2370134, 0.5668349, 0.5839986, 0, 0.5333334, 1, 1,
0.2401963, 0.1617344, 0.1360502, 0, 0.5254902, 1, 1,
0.240263, 0.2643544, -0.3659891, 0, 0.5215687, 1, 1,
0.2432275, -2.036364, 4.039202, 0, 0.5137255, 1, 1,
0.2450292, -0.03643331, 2.127708, 0, 0.509804, 1, 1,
0.2463432, 0.1535022, 1.337431, 0, 0.5019608, 1, 1,
0.2477725, -0.1219214, 3.348948, 0, 0.4941176, 1, 1,
0.2506673, -0.5839128, 1.164224, 0, 0.4901961, 1, 1,
0.2549388, 0.7790201, 0.3041003, 0, 0.4823529, 1, 1,
0.2559415, 1.371025, 0.7942078, 0, 0.4784314, 1, 1,
0.259087, -1.210377, 2.622819, 0, 0.4705882, 1, 1,
0.2604775, -0.2579361, 4.748892, 0, 0.4666667, 1, 1,
0.2673793, -0.04784684, 2.723465, 0, 0.4588235, 1, 1,
0.2727368, 0.1461391, 0.2270297, 0, 0.454902, 1, 1,
0.2735174, 0.7526265, 1.363331, 0, 0.4470588, 1, 1,
0.2744749, 0.8374025, 1.442761, 0, 0.4431373, 1, 1,
0.2746385, 0.6143557, -0.1620356, 0, 0.4352941, 1, 1,
0.2757302, -0.724905, -0.7053138, 0, 0.4313726, 1, 1,
0.2764147, 1.898111, -0.4993742, 0, 0.4235294, 1, 1,
0.2823597, -1.061271, 2.255433, 0, 0.4196078, 1, 1,
0.2838713, -0.5362141, 2.65602, 0, 0.4117647, 1, 1,
0.2840278, -1.488818, 3.605863, 0, 0.4078431, 1, 1,
0.2869145, -0.3413446, 2.935197, 0, 0.4, 1, 1,
0.2887723, 0.7236735, 0.5194237, 0, 0.3921569, 1, 1,
0.2890683, -1.052381, 2.910945, 0, 0.3882353, 1, 1,
0.2923198, 0.5579199, -0.6825247, 0, 0.3803922, 1, 1,
0.2933997, 1.555898, 0.2745669, 0, 0.3764706, 1, 1,
0.2936512, -0.76248, 4.390542, 0, 0.3686275, 1, 1,
0.3002895, -0.1256279, 2.774864, 0, 0.3647059, 1, 1,
0.3038978, 1.139384, 1.354661, 0, 0.3568628, 1, 1,
0.304271, 0.7398428, -0.7155219, 0, 0.3529412, 1, 1,
0.3061559, 0.8160887, 1.03232, 0, 0.345098, 1, 1,
0.3073038, -1.152378, 2.530554, 0, 0.3411765, 1, 1,
0.3095867, 1.441651, 0.308929, 0, 0.3333333, 1, 1,
0.3100749, -0.2936224, 2.963047, 0, 0.3294118, 1, 1,
0.3101299, 1.03303, 0.9825525, 0, 0.3215686, 1, 1,
0.3127207, -0.1112704, 1.843489, 0, 0.3176471, 1, 1,
0.3131743, -0.2862791, 3.580821, 0, 0.3098039, 1, 1,
0.3168038, -1.245985, 2.932306, 0, 0.3058824, 1, 1,
0.3200979, -1.118016, 3.159811, 0, 0.2980392, 1, 1,
0.3203073, -0.390636, 3.765169, 0, 0.2901961, 1, 1,
0.3239981, -0.7305956, 2.77272, 0, 0.2862745, 1, 1,
0.3280255, 0.5694124, 1.374509, 0, 0.2784314, 1, 1,
0.3317243, 1.066571, -0.693244, 0, 0.2745098, 1, 1,
0.3326556, 0.8204083, 1.264221, 0, 0.2666667, 1, 1,
0.3361415, 1.627949, 0.5437556, 0, 0.2627451, 1, 1,
0.3387916, -0.2773352, 1.980638, 0, 0.254902, 1, 1,
0.3432451, 1.143592, 1.259686, 0, 0.2509804, 1, 1,
0.344626, -0.4886426, 5.557918, 0, 0.2431373, 1, 1,
0.345427, 1.831168, -1.121478, 0, 0.2392157, 1, 1,
0.3507491, -0.4495829, 2.25728, 0, 0.2313726, 1, 1,
0.3512037, 0.001717768, -0.1151701, 0, 0.227451, 1, 1,
0.3541286, 0.1668834, 2.388175, 0, 0.2196078, 1, 1,
0.3641426, -0.1294753, 2.910733, 0, 0.2156863, 1, 1,
0.3715976, 1.978085, -0.391195, 0, 0.2078431, 1, 1,
0.371735, -1.435827, 0.6007017, 0, 0.2039216, 1, 1,
0.3720407, 1.084137, 0.1999274, 0, 0.1960784, 1, 1,
0.3744198, 0.207062, 0.1990692, 0, 0.1882353, 1, 1,
0.3748387, -0.6770387, 4.325805, 0, 0.1843137, 1, 1,
0.383143, 2.122051, 0.2429355, 0, 0.1764706, 1, 1,
0.3839873, -2.074984, 3.854154, 0, 0.172549, 1, 1,
0.3873233, -0.3489774, 2.331086, 0, 0.1647059, 1, 1,
0.3880312, 1.013441, -0.3927801, 0, 0.1607843, 1, 1,
0.3883022, -0.9390296, 2.107454, 0, 0.1529412, 1, 1,
0.3900379, -0.09727059, 1.330097, 0, 0.1490196, 1, 1,
0.3941286, 0.8694294, 3.123571, 0, 0.1411765, 1, 1,
0.3959984, 1.157059, 0.5564594, 0, 0.1372549, 1, 1,
0.3992522, 0.4401274, 2.090295, 0, 0.1294118, 1, 1,
0.3998799, -0.1447454, 1.560443, 0, 0.1254902, 1, 1,
0.4050873, 1.79121, 0.167594, 0, 0.1176471, 1, 1,
0.4098233, 3.294679, -0.7235636, 0, 0.1137255, 1, 1,
0.410363, 0.4268647, 0.130703, 0, 0.1058824, 1, 1,
0.4122816, 0.7904761, 0.9108358, 0, 0.09803922, 1, 1,
0.4146107, -0.2888821, 2.24285, 0, 0.09411765, 1, 1,
0.4177952, 0.9091561, 0.9840695, 0, 0.08627451, 1, 1,
0.4197459, 0.09182119, -1.175983, 0, 0.08235294, 1, 1,
0.4214971, 0.6464228, 0.09197924, 0, 0.07450981, 1, 1,
0.422438, -0.2162653, 2.349296, 0, 0.07058824, 1, 1,
0.4228287, -0.8167419, 3.271085, 0, 0.0627451, 1, 1,
0.4232071, 0.8063393, -1.130896, 0, 0.05882353, 1, 1,
0.4246069, 0.09231059, 1.831616, 0, 0.05098039, 1, 1,
0.4254504, -0.3594893, 2.487051, 0, 0.04705882, 1, 1,
0.426554, 0.5749603, 0.06970163, 0, 0.03921569, 1, 1,
0.4280937, -0.1774116, 4.013424, 0, 0.03529412, 1, 1,
0.4291689, -2.202412, 3.803695, 0, 0.02745098, 1, 1,
0.4310571, -1.476534, 3.056121, 0, 0.02352941, 1, 1,
0.4349889, -0.1581744, 2.034677, 0, 0.01568628, 1, 1,
0.442042, -1.100093, 2.438425, 0, 0.01176471, 1, 1,
0.4424141, 0.4124567, 2.152561, 0, 0.003921569, 1, 1,
0.4425271, -1.308677, 3.030097, 0.003921569, 0, 1, 1,
0.4425414, -0.4641914, 3.712093, 0.007843138, 0, 1, 1,
0.4426818, -0.9093987, 2.055005, 0.01568628, 0, 1, 1,
0.4469044, -2.938504, 1.92937, 0.01960784, 0, 1, 1,
0.4520945, 2.273608, 1.508796, 0.02745098, 0, 1, 1,
0.4560108, -0.09434276, 2.278588, 0.03137255, 0, 1, 1,
0.4569961, -0.7022041, 3.706417, 0.03921569, 0, 1, 1,
0.4583662, 0.3812731, 0.2029389, 0.04313726, 0, 1, 1,
0.4588325, -0.7010457, 1.243373, 0.05098039, 0, 1, 1,
0.4601437, -0.3140811, 1.475378, 0.05490196, 0, 1, 1,
0.4687253, 2.40185, -0.4597483, 0.0627451, 0, 1, 1,
0.4704433, -1.080724, 1.96035, 0.06666667, 0, 1, 1,
0.4719977, 0.6195709, 0.6865, 0.07450981, 0, 1, 1,
0.4752696, -0.02007174, 2.517679, 0.07843138, 0, 1, 1,
0.48096, 0.332238, 1.711673, 0.08627451, 0, 1, 1,
0.4857379, -0.2457487, 1.039378, 0.09019608, 0, 1, 1,
0.4861907, -0.6618223, 2.672481, 0.09803922, 0, 1, 1,
0.4869474, 0.115726, 0.4053183, 0.1058824, 0, 1, 1,
0.4913311, -1.04322, 2.660152, 0.1098039, 0, 1, 1,
0.4922931, -1.412106, 2.800416, 0.1176471, 0, 1, 1,
0.4970081, 1.135059, 0.1327116, 0.1215686, 0, 1, 1,
0.5047393, -1.809658, 3.491043, 0.1294118, 0, 1, 1,
0.5073245, -2.251814, 2.849731, 0.1333333, 0, 1, 1,
0.5099866, -2.546477, 3.887498, 0.1411765, 0, 1, 1,
0.5108783, -0.8527492, 3.131924, 0.145098, 0, 1, 1,
0.511424, 0.7046629, 1.642792, 0.1529412, 0, 1, 1,
0.5149261, -0.005779115, 3.855119, 0.1568628, 0, 1, 1,
0.5201585, -1.095209, 2.71014, 0.1647059, 0, 1, 1,
0.5213778, 1.56101, 0.6620727, 0.1686275, 0, 1, 1,
0.5243212, 1.338484, 1.949974, 0.1764706, 0, 1, 1,
0.5265504, 0.3874688, 1.905089, 0.1803922, 0, 1, 1,
0.5358216, 0.5273272, -0.01549577, 0.1882353, 0, 1, 1,
0.5391852, -0.04681027, 0.3556103, 0.1921569, 0, 1, 1,
0.5432337, -0.2111865, 0.5251362, 0.2, 0, 1, 1,
0.5465395, 0.6375406, 0.1233061, 0.2078431, 0, 1, 1,
0.5488376, -0.4667986, 1.500217, 0.2117647, 0, 1, 1,
0.5542661, 0.8577572, 0.7009011, 0.2196078, 0, 1, 1,
0.5546425, -1.890438, 3.6777, 0.2235294, 0, 1, 1,
0.5558712, -0.4897641, 2.50004, 0.2313726, 0, 1, 1,
0.5558749, -0.7499803, 0.9470211, 0.2352941, 0, 1, 1,
0.5596144, 0.2908891, 2.3257, 0.2431373, 0, 1, 1,
0.5633263, 0.9608865, 1.935463, 0.2470588, 0, 1, 1,
0.5633974, -0.3351026, 1.583459, 0.254902, 0, 1, 1,
0.5759173, -0.5690113, 2.994902, 0.2588235, 0, 1, 1,
0.5783268, -1.723229, 2.708125, 0.2666667, 0, 1, 1,
0.5819024, 1.426667, 1.537003, 0.2705882, 0, 1, 1,
0.5823531, 0.730528, 0.5834953, 0.2784314, 0, 1, 1,
0.5852491, 0.8632174, 0.09595666, 0.282353, 0, 1, 1,
0.585469, -0.4233005, 3.006208, 0.2901961, 0, 1, 1,
0.5879277, 1.557715, 0.123591, 0.2941177, 0, 1, 1,
0.5879462, -0.8311359, 2.566471, 0.3019608, 0, 1, 1,
0.5924323, -1.443496, 2.265643, 0.3098039, 0, 1, 1,
0.5997595, -0.9984942, 1.546896, 0.3137255, 0, 1, 1,
0.6018274, -0.4058211, 1.982232, 0.3215686, 0, 1, 1,
0.6024654, -0.07178833, -0.01894584, 0.3254902, 0, 1, 1,
0.6042894, -0.1948327, 2.826969, 0.3333333, 0, 1, 1,
0.604844, -1.394056, 2.700873, 0.3372549, 0, 1, 1,
0.6098555, 0.3384621, 0.9182281, 0.345098, 0, 1, 1,
0.6140414, 1.783571, 0.4331044, 0.3490196, 0, 1, 1,
0.6187696, -0.7228186, 1.199421, 0.3568628, 0, 1, 1,
0.6193197, -0.3861513, 4.376791, 0.3607843, 0, 1, 1,
0.6222191, -0.9321851, 2.191017, 0.3686275, 0, 1, 1,
0.6237238, 0.9024871, 0.0401795, 0.372549, 0, 1, 1,
0.6242024, -2.176207, 3.170949, 0.3803922, 0, 1, 1,
0.6304041, 0.8018797, 1.294358, 0.3843137, 0, 1, 1,
0.6370085, -1.046587, 2.668422, 0.3921569, 0, 1, 1,
0.6370602, 1.014398, 0.4948548, 0.3960784, 0, 1, 1,
0.6471109, 1.453158, -1.230121, 0.4039216, 0, 1, 1,
0.6482334, 0.251523, -0.04989321, 0.4117647, 0, 1, 1,
0.6496785, 0.8631502, -0.2382728, 0.4156863, 0, 1, 1,
0.6519649, 0.2320628, 0.9050056, 0.4235294, 0, 1, 1,
0.6519771, 0.7555299, 0.4214908, 0.427451, 0, 1, 1,
0.6545286, 1.399133, -0.05453315, 0.4352941, 0, 1, 1,
0.6545727, -0.715057, 1.279391, 0.4392157, 0, 1, 1,
0.6564628, -0.38105, 1.006852, 0.4470588, 0, 1, 1,
0.6565524, 2.214943, 0.7644199, 0.4509804, 0, 1, 1,
0.6640077, -1.913035, 3.162765, 0.4588235, 0, 1, 1,
0.6683404, -1.12534, 2.578013, 0.4627451, 0, 1, 1,
0.6708358, -0.5836869, 2.387558, 0.4705882, 0, 1, 1,
0.6791125, 0.2140269, 1.256608, 0.4745098, 0, 1, 1,
0.6795451, -1.556594, 2.265723, 0.4823529, 0, 1, 1,
0.6804502, -1.784028, 1.147289, 0.4862745, 0, 1, 1,
0.6818827, -0.9521642, 3.441247, 0.4941176, 0, 1, 1,
0.6826727, 0.3453881, 3.087381, 0.5019608, 0, 1, 1,
0.7048016, 1.444499, 1.448618, 0.5058824, 0, 1, 1,
0.7052747, -0.4730353, 3.493824, 0.5137255, 0, 1, 1,
0.7187614, 0.1043008, 4.326828, 0.5176471, 0, 1, 1,
0.721972, 0.2121965, -0.8870724, 0.5254902, 0, 1, 1,
0.7236311, 1.068226, -0.1632109, 0.5294118, 0, 1, 1,
0.7237616, -0.7867956, 2.139494, 0.5372549, 0, 1, 1,
0.7250947, -1.611996, 3.735209, 0.5411765, 0, 1, 1,
0.7356887, 0.7366084, -0.2604423, 0.5490196, 0, 1, 1,
0.7378859, -1.196005, 2.258118, 0.5529412, 0, 1, 1,
0.7403379, 0.7078188, -0.1004326, 0.5607843, 0, 1, 1,
0.7431266, -0.6487353, 0.3638259, 0.5647059, 0, 1, 1,
0.7482865, -0.6792008, 2.362645, 0.572549, 0, 1, 1,
0.7553039, 0.4516122, 1.682457, 0.5764706, 0, 1, 1,
0.7554437, -0.9764293, 3.129115, 0.5843138, 0, 1, 1,
0.7561174, 1.083728, 0.1541625, 0.5882353, 0, 1, 1,
0.7572746, 1.445865, -0.5617586, 0.5960785, 0, 1, 1,
0.7577168, 1.492043, -0.1992044, 0.6039216, 0, 1, 1,
0.7592455, 0.7675676, 0.1143005, 0.6078432, 0, 1, 1,
0.7629973, -0.9319783, 0.7342139, 0.6156863, 0, 1, 1,
0.7725853, -0.2333801, 0.9352542, 0.6196079, 0, 1, 1,
0.7725999, -0.6138732, 2.199364, 0.627451, 0, 1, 1,
0.7772236, 0.228033, 0.9335568, 0.6313726, 0, 1, 1,
0.7782542, -1.340145, 2.912886, 0.6392157, 0, 1, 1,
0.7807464, -1.131429, 4.118746, 0.6431373, 0, 1, 1,
0.7820237, -0.4653128, 1.985713, 0.6509804, 0, 1, 1,
0.7912915, -0.4274266, 2.104032, 0.654902, 0, 1, 1,
0.7955314, 0.1657979, 0.5395035, 0.6627451, 0, 1, 1,
0.808264, 1.883687, 1.05832, 0.6666667, 0, 1, 1,
0.8087354, 0.3162502, 0.9728255, 0.6745098, 0, 1, 1,
0.8191469, 1.33048, 1.025479, 0.6784314, 0, 1, 1,
0.8250462, 0.1471436, 1.3644, 0.6862745, 0, 1, 1,
0.827732, -1.18303, 1.743542, 0.6901961, 0, 1, 1,
0.8287329, 1.907686, 0.2289123, 0.6980392, 0, 1, 1,
0.8295876, 0.1092832, 1.775849, 0.7058824, 0, 1, 1,
0.8343361, -0.3015662, 2.406213, 0.7098039, 0, 1, 1,
0.8347801, -1.09453, 0.4387664, 0.7176471, 0, 1, 1,
0.8352282, 2.042922, 1.238414, 0.7215686, 0, 1, 1,
0.8388876, 1.401674, -0.3854065, 0.7294118, 0, 1, 1,
0.8391797, -0.6298686, 2.767698, 0.7333333, 0, 1, 1,
0.8429755, 0.7590994, 2.068645, 0.7411765, 0, 1, 1,
0.844584, -1.24689, 1.957488, 0.7450981, 0, 1, 1,
0.8478406, -0.9880358, 2.457314, 0.7529412, 0, 1, 1,
0.8481119, 2.096863, 0.4781629, 0.7568628, 0, 1, 1,
0.8482306, 0.6118864, 0.660486, 0.7647059, 0, 1, 1,
0.8508036, -1.117234, 2.105641, 0.7686275, 0, 1, 1,
0.8543915, -1.469143, 3.544297, 0.7764706, 0, 1, 1,
0.8581518, -0.1566896, 2.435901, 0.7803922, 0, 1, 1,
0.8585649, 1.236947, 0.8879894, 0.7882353, 0, 1, 1,
0.8615599, 0.5471723, -0.1849951, 0.7921569, 0, 1, 1,
0.8671916, 0.4717067, -0.5332671, 0.8, 0, 1, 1,
0.8682594, -0.3647672, 2.406166, 0.8078431, 0, 1, 1,
0.873334, 0.05446914, 2.235839, 0.8117647, 0, 1, 1,
0.8746439, 0.1551793, 1.240731, 0.8196079, 0, 1, 1,
0.8794065, -1.346631, 2.011193, 0.8235294, 0, 1, 1,
0.8810968, -0.5758931, 1.381171, 0.8313726, 0, 1, 1,
0.8816447, 0.20789, -0.250216, 0.8352941, 0, 1, 1,
0.8973844, 0.2708359, -0.3247363, 0.8431373, 0, 1, 1,
0.900538, -0.5115907, 1.089262, 0.8470588, 0, 1, 1,
0.9111697, -1.731169, 3.257055, 0.854902, 0, 1, 1,
0.9143255, 0.7469739, 1.486543, 0.8588235, 0, 1, 1,
0.9145126, 1.714267, 0.7182524, 0.8666667, 0, 1, 1,
0.9186685, 1.387342, 1.239188, 0.8705882, 0, 1, 1,
0.9226964, -1.229907, 4.161742, 0.8784314, 0, 1, 1,
0.9228786, -0.6023089, 3.164249, 0.8823529, 0, 1, 1,
0.925487, -0.4561035, 0.1005773, 0.8901961, 0, 1, 1,
0.9275113, -0.6200744, 2.409584, 0.8941177, 0, 1, 1,
0.9292833, -0.178573, 1.796097, 0.9019608, 0, 1, 1,
0.9299416, -0.8816578, 2.041666, 0.9098039, 0, 1, 1,
0.9305486, -1.156833, 2.434046, 0.9137255, 0, 1, 1,
0.9325468, 1.227157, 0.9911509, 0.9215686, 0, 1, 1,
0.9332031, 0.5972838, 0.7070867, 0.9254902, 0, 1, 1,
0.9419183, 1.311448, 0.6700963, 0.9333333, 0, 1, 1,
0.9419565, -2.280775, 1.994674, 0.9372549, 0, 1, 1,
0.9423298, -1.152687, 1.92362, 0.945098, 0, 1, 1,
0.94933, -1.684201, 1.566343, 0.9490196, 0, 1, 1,
0.9517153, 1.107347, 1.793082, 0.9568627, 0, 1, 1,
0.9519112, 0.3182094, 1.721012, 0.9607843, 0, 1, 1,
0.9536269, -0.9271284, 3.258731, 0.9686275, 0, 1, 1,
0.9560034, -0.8914432, 1.649374, 0.972549, 0, 1, 1,
0.9628319, 0.2336492, 0.4971914, 0.9803922, 0, 1, 1,
0.964435, 0.4123573, -0.724642, 0.9843137, 0, 1, 1,
0.9657183, 0.2607254, 1.977249, 0.9921569, 0, 1, 1,
0.9707178, 1.069644, 1.025073, 0.9960784, 0, 1, 1,
0.9733057, 0.3703416, 1.237654, 1, 0, 0.9960784, 1,
0.9737224, 0.9540344, -0.05850663, 1, 0, 0.9882353, 1,
0.9751438, -0.7380836, 2.713235, 1, 0, 0.9843137, 1,
0.9761657, -1.215144, 2.463503, 1, 0, 0.9764706, 1,
0.9934987, -0.7722824, 1.799203, 1, 0, 0.972549, 1,
0.9983686, 1.145093, 0.3223571, 1, 0, 0.9647059, 1,
1.000207, -0.3643599, 1.464051, 1, 0, 0.9607843, 1,
1.000576, 0.246996, 1.271782, 1, 0, 0.9529412, 1,
1.001723, 1.715356, 1.437255, 1, 0, 0.9490196, 1,
1.001987, 1.350185, 2.233588, 1, 0, 0.9411765, 1,
1.005671, 1.489981, 0.8261565, 1, 0, 0.9372549, 1,
1.005679, 0.4573702, 0.1849285, 1, 0, 0.9294118, 1,
1.009643, -0.5569704, 0.6056988, 1, 0, 0.9254902, 1,
1.012949, 0.9489092, 1.308095, 1, 0, 0.9176471, 1,
1.025797, -0.04045172, 0.6653365, 1, 0, 0.9137255, 1,
1.02729, 2.514199, -0.4265171, 1, 0, 0.9058824, 1,
1.02987, 1.0893, 0.1179117, 1, 0, 0.9019608, 1,
1.036214, -0.5604591, 1.491692, 1, 0, 0.8941177, 1,
1.039617, 0.5372615, -0.8710822, 1, 0, 0.8862745, 1,
1.040458, -0.450651, 2.456929, 1, 0, 0.8823529, 1,
1.040992, 1.569923, 0.3128773, 1, 0, 0.8745098, 1,
1.043054, 2.990409, -0.3376954, 1, 0, 0.8705882, 1,
1.046641, 0.9190358, -0.2553478, 1, 0, 0.8627451, 1,
1.050465, -0.2047937, 0.5366801, 1, 0, 0.8588235, 1,
1.052522, -1.061057, 2.895092, 1, 0, 0.8509804, 1,
1.052723, 1.904055, 0.206507, 1, 0, 0.8470588, 1,
1.053451, -0.3696151, 3.079085, 1, 0, 0.8392157, 1,
1.057239, 0.3446831, 2.244936, 1, 0, 0.8352941, 1,
1.070068, -1.354225, 3.338629, 1, 0, 0.827451, 1,
1.072151, -0.2187412, 2.173099, 1, 0, 0.8235294, 1,
1.072595, 0.4039859, 0.9729738, 1, 0, 0.8156863, 1,
1.08122, -0.3296674, 1.957433, 1, 0, 0.8117647, 1,
1.082976, -0.5068984, 3.045487, 1, 0, 0.8039216, 1,
1.084986, 0.3872041, 1.065043, 1, 0, 0.7960784, 1,
1.088062, -0.5906432, -0.1706234, 1, 0, 0.7921569, 1,
1.089517, -0.6193311, 2.864768, 1, 0, 0.7843137, 1,
1.114668, -0.02060366, 1.718804, 1, 0, 0.7803922, 1,
1.114829, 0.5735214, 1.432352, 1, 0, 0.772549, 1,
1.11485, -0.5331833, 3.467332, 1, 0, 0.7686275, 1,
1.132956, -0.4902602, 3.040764, 1, 0, 0.7607843, 1,
1.136311, 0.6438732, 0.3960541, 1, 0, 0.7568628, 1,
1.14322, 0.7505693, 1.50412, 1, 0, 0.7490196, 1,
1.148789, -0.7103629, 2.102826, 1, 0, 0.7450981, 1,
1.154925, -0.3966843, 1.860925, 1, 0, 0.7372549, 1,
1.155473, 0.1639938, 1.524318, 1, 0, 0.7333333, 1,
1.163316, -0.3713969, 2.220446, 1, 0, 0.7254902, 1,
1.167093, -1.224821, 2.479315, 1, 0, 0.7215686, 1,
1.172771, -0.05477786, 0.5668171, 1, 0, 0.7137255, 1,
1.173504, 0.8645857, -0.9040469, 1, 0, 0.7098039, 1,
1.179248, -1.079217, 2.24889, 1, 0, 0.7019608, 1,
1.186926, -0.3870338, 2.95246, 1, 0, 0.6941177, 1,
1.187623, 0.07848694, 2.57488, 1, 0, 0.6901961, 1,
1.188614, 1.532163, 1.007544, 1, 0, 0.682353, 1,
1.189551, 0.01206536, 0.5252717, 1, 0, 0.6784314, 1,
1.223323, 1.073323, 1.866591, 1, 0, 0.6705883, 1,
1.238106, -1.524401, 3.613734, 1, 0, 0.6666667, 1,
1.243929, -0.1091773, 2.843373, 1, 0, 0.6588235, 1,
1.255781, 0.4219584, 2.195935, 1, 0, 0.654902, 1,
1.274538, 0.07999872, 2.640172, 1, 0, 0.6470588, 1,
1.275383, 3.005321, -0.6341628, 1, 0, 0.6431373, 1,
1.277436, 0.8623505, -0.3777287, 1, 0, 0.6352941, 1,
1.283678, -0.5768182, 0.1560813, 1, 0, 0.6313726, 1,
1.286619, -0.01071205, 2.077542, 1, 0, 0.6235294, 1,
1.28889, -0.8633068, 1.098714, 1, 0, 0.6196079, 1,
1.306383, 1.110258, 0.7669027, 1, 0, 0.6117647, 1,
1.312924, -0.05006504, 1.9239, 1, 0, 0.6078432, 1,
1.319949, 0.07960143, 0.3342501, 1, 0, 0.6, 1,
1.325308, 0.127314, 3.106517, 1, 0, 0.5921569, 1,
1.326327, -0.9516782, 3.395281, 1, 0, 0.5882353, 1,
1.32879, -0.6104885, 2.277815, 1, 0, 0.5803922, 1,
1.33689, 2.856322, -1.399171, 1, 0, 0.5764706, 1,
1.348632, 0.5399835, 3.042846, 1, 0, 0.5686275, 1,
1.352952, 0.7343714, 0.5947888, 1, 0, 0.5647059, 1,
1.354145, 0.4163441, 1.031515, 1, 0, 0.5568628, 1,
1.358584, 0.3958347, 1.139146, 1, 0, 0.5529412, 1,
1.364473, 0.849481, 1.253539, 1, 0, 0.5450981, 1,
1.366536, 0.3080526, 0.4048983, 1, 0, 0.5411765, 1,
1.370173, -1.086276, 2.234685, 1, 0, 0.5333334, 1,
1.395156, -0.2686751, 2.544394, 1, 0, 0.5294118, 1,
1.415953, 1.109319, 0.4877576, 1, 0, 0.5215687, 1,
1.41972, 0.847939, 2.178949, 1, 0, 0.5176471, 1,
1.420048, 0.5477778, -0.2375234, 1, 0, 0.509804, 1,
1.433764, 2.429231, 2.268885, 1, 0, 0.5058824, 1,
1.435455, -1.367965, 2.257206, 1, 0, 0.4980392, 1,
1.454225, -1.051928, 1.821059, 1, 0, 0.4901961, 1,
1.455911, 0.5872378, -0.3592731, 1, 0, 0.4862745, 1,
1.464979, 0.339774, 1.633545, 1, 0, 0.4784314, 1,
1.467907, -1.03718, 1.821729, 1, 0, 0.4745098, 1,
1.471343, 0.4634759, 0.7967008, 1, 0, 0.4666667, 1,
1.478708, 0.2111997, 2.154462, 1, 0, 0.4627451, 1,
1.492319, -0.7371422, 0.8411748, 1, 0, 0.454902, 1,
1.504187, 1.755923, 1.117767, 1, 0, 0.4509804, 1,
1.50778, 0.3538184, 0.8526531, 1, 0, 0.4431373, 1,
1.510587, -1.189873, 2.70525, 1, 0, 0.4392157, 1,
1.517977, -0.1840214, 3.911061, 1, 0, 0.4313726, 1,
1.518816, 0.1683158, 1.727231, 1, 0, 0.427451, 1,
1.525543, -0.7451984, 0.171589, 1, 0, 0.4196078, 1,
1.525844, 0.5660933, -0.3205939, 1, 0, 0.4156863, 1,
1.527515, 0.8844268, 0.8154444, 1, 0, 0.4078431, 1,
1.533965, -0.5301091, 1.403921, 1, 0, 0.4039216, 1,
1.538172, -1.304309, 0.7147439, 1, 0, 0.3960784, 1,
1.542789, 1.627829, 1.431013, 1, 0, 0.3882353, 1,
1.54431, 0.2851326, 2.896542, 1, 0, 0.3843137, 1,
1.546042, 0.5466406, 1.158659, 1, 0, 0.3764706, 1,
1.549709, 0.1676407, 0.9875864, 1, 0, 0.372549, 1,
1.560031, 0.5993486, 0.7371197, 1, 0, 0.3647059, 1,
1.567031, 0.7886688, 2.405621, 1, 0, 0.3607843, 1,
1.582965, 0.9737846, 2.30901, 1, 0, 0.3529412, 1,
1.614091, 0.5062021, 2.091045, 1, 0, 0.3490196, 1,
1.618191, -2.26994, 2.891617, 1, 0, 0.3411765, 1,
1.624007, 0.6470212, 2.468874, 1, 0, 0.3372549, 1,
1.642653, -0.7178089, 2.351, 1, 0, 0.3294118, 1,
1.684768, 0.2993687, 1.59084, 1, 0, 0.3254902, 1,
1.691216, 1.197535, 0.5829886, 1, 0, 0.3176471, 1,
1.693102, -0.8553383, 2.697358, 1, 0, 0.3137255, 1,
1.699321, -2.117656, 2.795065, 1, 0, 0.3058824, 1,
1.699909, 0.3970622, 1.556319, 1, 0, 0.2980392, 1,
1.707204, 1.144782, -0.287598, 1, 0, 0.2941177, 1,
1.711381, -0.1542511, 1.169026, 1, 0, 0.2862745, 1,
1.716765, -0.6089955, 1.354313, 1, 0, 0.282353, 1,
1.732013, -0.6951362, 3.174592, 1, 0, 0.2745098, 1,
1.759334, -0.4136068, 0.466395, 1, 0, 0.2705882, 1,
1.770635, 0.3113099, 0.3824266, 1, 0, 0.2627451, 1,
1.77831, 0.4675612, 1.265122, 1, 0, 0.2588235, 1,
1.778854, 0.5952416, 1.688999, 1, 0, 0.2509804, 1,
1.795653, -0.8071634, 1.146776, 1, 0, 0.2470588, 1,
1.797194, -0.4179465, 2.490964, 1, 0, 0.2392157, 1,
1.804811, 0.2896324, 2.122119, 1, 0, 0.2352941, 1,
1.805836, -0.7331223, 1.332803, 1, 0, 0.227451, 1,
1.81619, -1.063244, 3.328266, 1, 0, 0.2235294, 1,
1.825966, 0.7920323, 2.432276, 1, 0, 0.2156863, 1,
1.890708, 1.505326, -0.2120015, 1, 0, 0.2117647, 1,
1.920971, -0.05019031, 2.587202, 1, 0, 0.2039216, 1,
1.923489, 0.7953641, 1.203067, 1, 0, 0.1960784, 1,
1.925375, 1.332755, 0.3825949, 1, 0, 0.1921569, 1,
1.940532, -0.8735335, 2.025758, 1, 0, 0.1843137, 1,
1.948861, 1.847131, -0.3385838, 1, 0, 0.1803922, 1,
1.954887, 0.4026207, 0.505803, 1, 0, 0.172549, 1,
1.999303, 1.436873, 1.119824, 1, 0, 0.1686275, 1,
2.00324, -1.079623, 1.44024, 1, 0, 0.1607843, 1,
2.026095, -1.750195, 2.759576, 1, 0, 0.1568628, 1,
2.026405, -0.4432647, 2.71614, 1, 0, 0.1490196, 1,
2.040412, -2.219243, 2.867624, 1, 0, 0.145098, 1,
2.057186, 0.7121276, 0.7065588, 1, 0, 0.1372549, 1,
2.080019, -0.5699569, -1.004049, 1, 0, 0.1333333, 1,
2.127133, 0.5339921, 1.414647, 1, 0, 0.1254902, 1,
2.134799, -0.01604521, 2.046775, 1, 0, 0.1215686, 1,
2.146507, -0.7486688, 0.6637008, 1, 0, 0.1137255, 1,
2.149022, 1.01264, 2.302327, 1, 0, 0.1098039, 1,
2.172041, -1.049087, 2.779164, 1, 0, 0.1019608, 1,
2.200253, -0.784173, -0.2681794, 1, 0, 0.09411765, 1,
2.208769, -0.3923135, 4.65426, 1, 0, 0.09019608, 1,
2.258838, -1.049127, 2.212951, 1, 0, 0.08235294, 1,
2.296997, -0.3950381, 0.9032252, 1, 0, 0.07843138, 1,
2.298637, 0.4065802, 2.751027, 1, 0, 0.07058824, 1,
2.300063, -0.1677999, 1.455616, 1, 0, 0.06666667, 1,
2.310849, 0.1078877, 2.011679, 1, 0, 0.05882353, 1,
2.330134, 0.7654881, 1.432959, 1, 0, 0.05490196, 1,
2.359467, -0.2628196, 1.065263, 1, 0, 0.04705882, 1,
2.368761, 0.4776751, 2.228378, 1, 0, 0.04313726, 1,
2.387793, -0.8275074, 0.56134, 1, 0, 0.03529412, 1,
2.440733, -0.2246109, 4.187191, 1, 0, 0.03137255, 1,
2.487275, 0.7859472, -0.7841181, 1, 0, 0.02352941, 1,
2.577199, 0.7269034, 0.6038991, 1, 0, 0.01960784, 1,
2.897079, 0.1341325, 1.855905, 1, 0, 0.01176471, 1,
3.78166, -1.773838, 1.944084, 1, 0, 0.007843138, 1
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
0.4761244, -4.051012, -7.282321, 0, -0.5, 0.5, 0.5,
0.4761244, -4.051012, -7.282321, 1, -0.5, 0.5, 0.5,
0.4761244, -4.051012, -7.282321, 1, 1.5, 0.5, 0.5,
0.4761244, -4.051012, -7.282321, 0, 1.5, 0.5, 0.5
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
-3.949988, 0.3432268, -7.282321, 0, -0.5, 0.5, 0.5,
-3.949988, 0.3432268, -7.282321, 1, -0.5, 0.5, 0.5,
-3.949988, 0.3432268, -7.282321, 1, 1.5, 0.5, 0.5,
-3.949988, 0.3432268, -7.282321, 0, 1.5, 0.5, 0.5
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
-3.949988, -4.051012, 0.06829047, 0, -0.5, 0.5, 0.5,
-3.949988, -4.051012, 0.06829047, 1, -0.5, 0.5, 0.5,
-3.949988, -4.051012, 0.06829047, 1, 1.5, 0.5, 0.5,
-3.949988, -4.051012, 0.06829047, 0, 1.5, 0.5, 0.5
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
-2, -3.036956, -5.586026,
3, -3.036956, -5.586026,
-2, -3.036956, -5.586026,
-2, -3.205966, -5.868742,
-1, -3.036956, -5.586026,
-1, -3.205966, -5.868742,
0, -3.036956, -5.586026,
0, -3.205966, -5.868742,
1, -3.036956, -5.586026,
1, -3.205966, -5.868742,
2, -3.036956, -5.586026,
2, -3.205966, -5.868742,
3, -3.036956, -5.586026,
3, -3.205966, -5.868742
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
-2, -3.543984, -6.434174, 0, -0.5, 0.5, 0.5,
-2, -3.543984, -6.434174, 1, -0.5, 0.5, 0.5,
-2, -3.543984, -6.434174, 1, 1.5, 0.5, 0.5,
-2, -3.543984, -6.434174, 0, 1.5, 0.5, 0.5,
-1, -3.543984, -6.434174, 0, -0.5, 0.5, 0.5,
-1, -3.543984, -6.434174, 1, -0.5, 0.5, 0.5,
-1, -3.543984, -6.434174, 1, 1.5, 0.5, 0.5,
-1, -3.543984, -6.434174, 0, 1.5, 0.5, 0.5,
0, -3.543984, -6.434174, 0, -0.5, 0.5, 0.5,
0, -3.543984, -6.434174, 1, -0.5, 0.5, 0.5,
0, -3.543984, -6.434174, 1, 1.5, 0.5, 0.5,
0, -3.543984, -6.434174, 0, 1.5, 0.5, 0.5,
1, -3.543984, -6.434174, 0, -0.5, 0.5, 0.5,
1, -3.543984, -6.434174, 1, -0.5, 0.5, 0.5,
1, -3.543984, -6.434174, 1, 1.5, 0.5, 0.5,
1, -3.543984, -6.434174, 0, 1.5, 0.5, 0.5,
2, -3.543984, -6.434174, 0, -0.5, 0.5, 0.5,
2, -3.543984, -6.434174, 1, -0.5, 0.5, 0.5,
2, -3.543984, -6.434174, 1, 1.5, 0.5, 0.5,
2, -3.543984, -6.434174, 0, 1.5, 0.5, 0.5,
3, -3.543984, -6.434174, 0, -0.5, 0.5, 0.5,
3, -3.543984, -6.434174, 1, -0.5, 0.5, 0.5,
3, -3.543984, -6.434174, 1, 1.5, 0.5, 0.5,
3, -3.543984, -6.434174, 0, 1.5, 0.5, 0.5
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
-2.928577, -2, -5.586026,
-2.928577, 3, -5.586026,
-2.928577, -2, -5.586026,
-3.098812, -2, -5.868742,
-2.928577, -1, -5.586026,
-3.098812, -1, -5.868742,
-2.928577, 0, -5.586026,
-3.098812, 0, -5.868742,
-2.928577, 1, -5.586026,
-3.098812, 1, -5.868742,
-2.928577, 2, -5.586026,
-3.098812, 2, -5.868742,
-2.928577, 3, -5.586026,
-3.098812, 3, -5.868742
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
-3.439282, -2, -6.434174, 0, -0.5, 0.5, 0.5,
-3.439282, -2, -6.434174, 1, -0.5, 0.5, 0.5,
-3.439282, -2, -6.434174, 1, 1.5, 0.5, 0.5,
-3.439282, -2, -6.434174, 0, 1.5, 0.5, 0.5,
-3.439282, -1, -6.434174, 0, -0.5, 0.5, 0.5,
-3.439282, -1, -6.434174, 1, -0.5, 0.5, 0.5,
-3.439282, -1, -6.434174, 1, 1.5, 0.5, 0.5,
-3.439282, -1, -6.434174, 0, 1.5, 0.5, 0.5,
-3.439282, 0, -6.434174, 0, -0.5, 0.5, 0.5,
-3.439282, 0, -6.434174, 1, -0.5, 0.5, 0.5,
-3.439282, 0, -6.434174, 1, 1.5, 0.5, 0.5,
-3.439282, 0, -6.434174, 0, 1.5, 0.5, 0.5,
-3.439282, 1, -6.434174, 0, -0.5, 0.5, 0.5,
-3.439282, 1, -6.434174, 1, -0.5, 0.5, 0.5,
-3.439282, 1, -6.434174, 1, 1.5, 0.5, 0.5,
-3.439282, 1, -6.434174, 0, 1.5, 0.5, 0.5,
-3.439282, 2, -6.434174, 0, -0.5, 0.5, 0.5,
-3.439282, 2, -6.434174, 1, -0.5, 0.5, 0.5,
-3.439282, 2, -6.434174, 1, 1.5, 0.5, 0.5,
-3.439282, 2, -6.434174, 0, 1.5, 0.5, 0.5,
-3.439282, 3, -6.434174, 0, -0.5, 0.5, 0.5,
-3.439282, 3, -6.434174, 1, -0.5, 0.5, 0.5,
-3.439282, 3, -6.434174, 1, 1.5, 0.5, 0.5,
-3.439282, 3, -6.434174, 0, 1.5, 0.5, 0.5
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
-2.928577, -3.036956, -4,
-2.928577, -3.036956, 4,
-2.928577, -3.036956, -4,
-3.098812, -3.205966, -4,
-2.928577, -3.036956, -2,
-3.098812, -3.205966, -2,
-2.928577, -3.036956, 0,
-3.098812, -3.205966, 0,
-2.928577, -3.036956, 2,
-3.098812, -3.205966, 2,
-2.928577, -3.036956, 4,
-3.098812, -3.205966, 4
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
-3.439282, -3.543984, -4, 0, -0.5, 0.5, 0.5,
-3.439282, -3.543984, -4, 1, -0.5, 0.5, 0.5,
-3.439282, -3.543984, -4, 1, 1.5, 0.5, 0.5,
-3.439282, -3.543984, -4, 0, 1.5, 0.5, 0.5,
-3.439282, -3.543984, -2, 0, -0.5, 0.5, 0.5,
-3.439282, -3.543984, -2, 1, -0.5, 0.5, 0.5,
-3.439282, -3.543984, -2, 1, 1.5, 0.5, 0.5,
-3.439282, -3.543984, -2, 0, 1.5, 0.5, 0.5,
-3.439282, -3.543984, 0, 0, -0.5, 0.5, 0.5,
-3.439282, -3.543984, 0, 1, -0.5, 0.5, 0.5,
-3.439282, -3.543984, 0, 1, 1.5, 0.5, 0.5,
-3.439282, -3.543984, 0, 0, 1.5, 0.5, 0.5,
-3.439282, -3.543984, 2, 0, -0.5, 0.5, 0.5,
-3.439282, -3.543984, 2, 1, -0.5, 0.5, 0.5,
-3.439282, -3.543984, 2, 1, 1.5, 0.5, 0.5,
-3.439282, -3.543984, 2, 0, 1.5, 0.5, 0.5,
-3.439282, -3.543984, 4, 0, -0.5, 0.5, 0.5,
-3.439282, -3.543984, 4, 1, -0.5, 0.5, 0.5,
-3.439282, -3.543984, 4, 1, 1.5, 0.5, 0.5,
-3.439282, -3.543984, 4, 0, 1.5, 0.5, 0.5
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
-2.928577, -3.036956, -5.586026,
-2.928577, 3.72341, -5.586026,
-2.928577, -3.036956, 5.722607,
-2.928577, 3.72341, 5.722607,
-2.928577, -3.036956, -5.586026,
-2.928577, -3.036956, 5.722607,
-2.928577, 3.72341, -5.586026,
-2.928577, 3.72341, 5.722607,
-2.928577, -3.036956, -5.586026,
3.880826, -3.036956, -5.586026,
-2.928577, -3.036956, 5.722607,
3.880826, -3.036956, 5.722607,
-2.928577, 3.72341, -5.586026,
3.880826, 3.72341, -5.586026,
-2.928577, 3.72341, 5.722607,
3.880826, 3.72341, 5.722607,
3.880826, -3.036956, -5.586026,
3.880826, 3.72341, -5.586026,
3.880826, -3.036956, 5.722607,
3.880826, 3.72341, 5.722607,
3.880826, -3.036956, -5.586026,
3.880826, -3.036956, 5.722607,
3.880826, 3.72341, -5.586026,
3.880826, 3.72341, 5.722607
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
var radius = 7.919414;
var distance = 35.23437;
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
mvMatrix.translate( -0.4761244, -0.3432268, -0.06829047 );
mvMatrix.scale( 1.257471, 1.266592, 0.757176 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.23437);
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
Fenthion<-read.table("Fenthion.xyz", skip=1)
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
-2.829411, 1.012333, -1.896001, 0, 0, 1, 1, 1,
-2.757455, 0.4211913, -0.6855897, 1, 0, 0, 1, 1,
-2.731495, 0.6372172, 0.8045136, 1, 0, 0, 1, 1,
-2.706061, 0.07415962, -3.196219, 1, 0, 0, 1, 1,
-2.705438, 0.08178889, -0.877173, 1, 0, 0, 1, 1,
-2.661385, -1.205009, -2.863413, 1, 0, 0, 1, 1,
-2.524737, 0.02439293, -0.2792405, 0, 0, 0, 1, 1,
-2.474917, -0.8518437, -1.95067, 0, 0, 0, 1, 1,
-2.406418, -0.4926061, -0.6758903, 0, 0, 0, 1, 1,
-2.380342, 1.253384, -1.788227, 0, 0, 0, 1, 1,
-2.361603, -0.6072835, -1.703752, 0, 0, 0, 1, 1,
-2.345078, 0.3631001, -3.89697, 0, 0, 0, 1, 1,
-2.343559, 0.2085042, 1.15228, 0, 0, 0, 1, 1,
-2.291647, 0.1590268, -2.014333, 1, 1, 1, 1, 1,
-2.262218, -1.666094, -2.388775, 1, 1, 1, 1, 1,
-2.249066, -1.676565, -1.804317, 1, 1, 1, 1, 1,
-2.229264, 0.2409317, -1.637079, 1, 1, 1, 1, 1,
-2.197052, 2.147784, -0.9712443, 1, 1, 1, 1, 1,
-2.125668, -0.3001538, -2.451543, 1, 1, 1, 1, 1,
-2.113025, -0.3489184, -2.101895, 1, 1, 1, 1, 1,
-2.095769, 0.5433859, -0.5457619, 1, 1, 1, 1, 1,
-2.087092, 1.644326, 0.338679, 1, 1, 1, 1, 1,
-2.005822, -1.200991, -1.815652, 1, 1, 1, 1, 1,
-1.991253, 0.01564493, -3.805221, 1, 1, 1, 1, 1,
-1.98687, -0.1048307, -1.755996, 1, 1, 1, 1, 1,
-1.972001, -1.666819, -2.296775, 1, 1, 1, 1, 1,
-1.934875, 0.7349521, -0.07696094, 1, 1, 1, 1, 1,
-1.916098, 0.6757811, -1.78702, 1, 1, 1, 1, 1,
-1.910926, -0.7055581, -3.073927, 0, 0, 1, 1, 1,
-1.88869, 1.216351, -1.101065, 1, 0, 0, 1, 1,
-1.879671, 0.2382768, -0.2417201, 1, 0, 0, 1, 1,
-1.876738, 0.1967557, -2.555781, 1, 0, 0, 1, 1,
-1.875882, -0.6416095, -1.732775, 1, 0, 0, 1, 1,
-1.852047, 0.4376081, 1.16624, 1, 0, 0, 1, 1,
-1.848059, -0.6067219, -2.750295, 0, 0, 0, 1, 1,
-1.830026, -1.088102, -2.539696, 0, 0, 0, 1, 1,
-1.771736, -1.009416, -3.438687, 0, 0, 0, 1, 1,
-1.771164, -1.576146, -3.09476, 0, 0, 0, 1, 1,
-1.770558, -0.1147258, -1.356741, 0, 0, 0, 1, 1,
-1.767816, 0.09640802, 0.3856718, 0, 0, 0, 1, 1,
-1.766226, 0.9142439, 0.7852516, 0, 0, 0, 1, 1,
-1.760969, 0.5863783, -1.996193, 1, 1, 1, 1, 1,
-1.74775, 0.8771612, -1.343364, 1, 1, 1, 1, 1,
-1.747382, -0.4926036, -2.699504, 1, 1, 1, 1, 1,
-1.745067, -0.2090941, -1.86271, 1, 1, 1, 1, 1,
-1.726763, 0.06421927, -1.474912, 1, 1, 1, 1, 1,
-1.710719, -0.07965379, -3.102149, 1, 1, 1, 1, 1,
-1.710101, -0.1105361, -1.759005, 1, 1, 1, 1, 1,
-1.702023, 0.5855392, -0.5512947, 1, 1, 1, 1, 1,
-1.693009, 1.192661, -1.209813, 1, 1, 1, 1, 1,
-1.671331, -0.5037327, -1.5392, 1, 1, 1, 1, 1,
-1.657094, 0.4547897, -2.277118, 1, 1, 1, 1, 1,
-1.63789, 0.567971, -2.389686, 1, 1, 1, 1, 1,
-1.616844, 0.702352, -0.865405, 1, 1, 1, 1, 1,
-1.616699, 1.397382, -0.5621511, 1, 1, 1, 1, 1,
-1.596703, -1.873423, -2.576235, 1, 1, 1, 1, 1,
-1.591353, 0.6921403, -1.704887, 0, 0, 1, 1, 1,
-1.574374, 0.5573516, -1.654293, 1, 0, 0, 1, 1,
-1.568506, 0.2469935, -0.9577572, 1, 0, 0, 1, 1,
-1.561602, 0.4902666, -0.01035604, 1, 0, 0, 1, 1,
-1.552969, 0.9110127, -0.605781, 1, 0, 0, 1, 1,
-1.54933, 0.5924249, -0.7683726, 1, 0, 0, 1, 1,
-1.532533, -0.2760945, -0.01050881, 0, 0, 0, 1, 1,
-1.531288, -0.9766105, -1.625163, 0, 0, 0, 1, 1,
-1.491273, 0.2034532, -0.7255794, 0, 0, 0, 1, 1,
-1.489448, 0.0406462, -1.215614, 0, 0, 0, 1, 1,
-1.463271, 0.05304996, -0.9418212, 0, 0, 0, 1, 1,
-1.460884, 0.4667453, 0.2855204, 0, 0, 0, 1, 1,
-1.459874, -1.137034, -1.187577, 0, 0, 0, 1, 1,
-1.435374, 0.2298863, -0.1332135, 1, 1, 1, 1, 1,
-1.427391, 0.3094851, -1.367122, 1, 1, 1, 1, 1,
-1.419096, -0.6332291, -0.7727419, 1, 1, 1, 1, 1,
-1.417937, 2.97299, -0.9990582, 1, 1, 1, 1, 1,
-1.412489, 2.343407, 0.1064397, 1, 1, 1, 1, 1,
-1.398381, -0.4586577, -0.3933125, 1, 1, 1, 1, 1,
-1.398032, 0.806242, -0.6865248, 1, 1, 1, 1, 1,
-1.39358, -1.768931, -3.989175, 1, 1, 1, 1, 1,
-1.37857, 1.143317, -1.209571, 1, 1, 1, 1, 1,
-1.37166, 0.06204006, -0.9063421, 1, 1, 1, 1, 1,
-1.363824, 0.3224448, -3.130831, 1, 1, 1, 1, 1,
-1.361237, 0.9693148, -0.6156545, 1, 1, 1, 1, 1,
-1.359786, -1.551868, -1.950107, 1, 1, 1, 1, 1,
-1.350932, 0.3408925, -2.819774, 1, 1, 1, 1, 1,
-1.346261, -0.4646546, -2.280383, 1, 1, 1, 1, 1,
-1.339833, -0.8388249, -1.961983, 0, 0, 1, 1, 1,
-1.339496, -0.7800871, -1.605752, 1, 0, 0, 1, 1,
-1.320101, -0.7202785, -2.005837, 1, 0, 0, 1, 1,
-1.309552, -0.07943663, -1.949984, 1, 0, 0, 1, 1,
-1.307862, -1.056549, -2.987011, 1, 0, 0, 1, 1,
-1.305654, 0.6189211, 0.3215031, 1, 0, 0, 1, 1,
-1.303013, 0.6021211, -2.066114, 0, 0, 0, 1, 1,
-1.301809, 1.41233, 0.5075108, 0, 0, 0, 1, 1,
-1.30179, 1.868089, -0.1102667, 0, 0, 0, 1, 1,
-1.291791, 0.3010117, -1.529433, 0, 0, 0, 1, 1,
-1.288498, 0.1703051, -1.49222, 0, 0, 0, 1, 1,
-1.284247, -0.3349032, -1.943139, 0, 0, 0, 1, 1,
-1.275757, 0.4812211, -3.35319, 0, 0, 0, 1, 1,
-1.265439, 0.6345972, -0.5112951, 1, 1, 1, 1, 1,
-1.260098, -1.459766, -1.110776, 1, 1, 1, 1, 1,
-1.255897, 1.477035, 0.9065461, 1, 1, 1, 1, 1,
-1.241565, 0.7972717, -1.193601, 1, 1, 1, 1, 1,
-1.239112, -0.299518, -0.06459653, 1, 1, 1, 1, 1,
-1.234442, -1.726108, -2.617872, 1, 1, 1, 1, 1,
-1.233042, 1.456882, -0.4041287, 1, 1, 1, 1, 1,
-1.232273, 2.03792, 0.791633, 1, 1, 1, 1, 1,
-1.231514, 0.7525319, -0.3564258, 1, 1, 1, 1, 1,
-1.228045, -0.2703424, -1.48466, 1, 1, 1, 1, 1,
-1.227244, 0.480172, -1.103638, 1, 1, 1, 1, 1,
-1.2218, 0.02609875, -2.530305, 1, 1, 1, 1, 1,
-1.219221, -0.1517466, -2.789052, 1, 1, 1, 1, 1,
-1.214845, 1.225568, -0.02942166, 1, 1, 1, 1, 1,
-1.213954, -0.06736171, -2.321476, 1, 1, 1, 1, 1,
-1.213521, -0.7561441, -1.95318, 0, 0, 1, 1, 1,
-1.203636, -0.6929725, -3.276643, 1, 0, 0, 1, 1,
-1.20291, 0.6504931, -1.04445, 1, 0, 0, 1, 1,
-1.193297, 0.8799743, 0.9349352, 1, 0, 0, 1, 1,
-1.190516, -0.7713013, -1.971063, 1, 0, 0, 1, 1,
-1.182685, -0.3181255, -1.351847, 1, 0, 0, 1, 1,
-1.17769, -0.6429948, -2.800832, 0, 0, 0, 1, 1,
-1.175957, 1.749031, -1.177374, 0, 0, 0, 1, 1,
-1.174726, 0.5348676, -2.055609, 0, 0, 0, 1, 1,
-1.172325, 0.4949097, -0.2760608, 0, 0, 0, 1, 1,
-1.163278, 1.72631, 0.1922431, 0, 0, 0, 1, 1,
-1.161697, 0.8964246, -0.8579042, 0, 0, 0, 1, 1,
-1.161471, -0.5742289, -0.311891, 0, 0, 0, 1, 1,
-1.1572, 0.6561509, -1.813879, 1, 1, 1, 1, 1,
-1.150917, -0.1315666, -3.355295, 1, 1, 1, 1, 1,
-1.150767, -0.3485393, -2.730407, 1, 1, 1, 1, 1,
-1.149315, 0.1511091, -1.650295, 1, 1, 1, 1, 1,
-1.146069, 0.5346786, -1.551913, 1, 1, 1, 1, 1,
-1.136678, -0.1723472, -1.165515, 1, 1, 1, 1, 1,
-1.133183, 0.8826457, -0.1671042, 1, 1, 1, 1, 1,
-1.130215, -0.8431085, -3.513753, 1, 1, 1, 1, 1,
-1.12974, -0.5803831, -1.803288, 1, 1, 1, 1, 1,
-1.127435, 0.09633046, -2.89092, 1, 1, 1, 1, 1,
-1.12351, 0.7929764, -0.9839537, 1, 1, 1, 1, 1,
-1.123056, -1.05312, -2.128942, 1, 1, 1, 1, 1,
-1.121575, 0.855857, -0.5947418, 1, 1, 1, 1, 1,
-1.103082, 1.011859, -0.9144577, 1, 1, 1, 1, 1,
-1.10147, 1.214858, 0.605257, 1, 1, 1, 1, 1,
-1.101173, -0.04849025, -2.869886, 0, 0, 1, 1, 1,
-1.095546, 1.306973, -0.2338217, 1, 0, 0, 1, 1,
-1.095331, 1.121929, -1.909664, 1, 0, 0, 1, 1,
-1.09131, 0.09950582, -1.987976, 1, 0, 0, 1, 1,
-1.081615, 0.926308, -2.252974, 1, 0, 0, 1, 1,
-1.076929, -1.157914, -2.478495, 1, 0, 0, 1, 1,
-1.075945, 1.125118, -0.1027213, 0, 0, 0, 1, 1,
-1.073468, -0.4034472, -1.850433, 0, 0, 0, 1, 1,
-1.069111, 0.4745684, -0.6514779, 0, 0, 0, 1, 1,
-1.066736, -0.01414044, -0.326106, 0, 0, 0, 1, 1,
-1.061896, -0.1979741, -2.897022, 0, 0, 0, 1, 1,
-1.057987, 0.5128339, -1.029135, 0, 0, 0, 1, 1,
-1.052961, 1.223686, -1.783542, 0, 0, 0, 1, 1,
-1.046812, 0.2862067, -0.4408982, 1, 1, 1, 1, 1,
-1.035662, -1.582641, -3.573765, 1, 1, 1, 1, 1,
-1.0344, -1.095589, -2.793414, 1, 1, 1, 1, 1,
-1.021017, 0.993341, -1.736279, 1, 1, 1, 1, 1,
-1.018033, -0.4648212, -0.7988605, 1, 1, 1, 1, 1,
-1.015368, 0.6660129, -0.4697401, 1, 1, 1, 1, 1,
-1.010162, -0.1160025, -1.824695, 1, 1, 1, 1, 1,
-1.006177, 0.8656734, -1.200687, 1, 1, 1, 1, 1,
-0.9994944, -1.66217, -2.743647, 1, 1, 1, 1, 1,
-0.9941844, 0.1983837, 0.1252197, 1, 1, 1, 1, 1,
-0.9913892, -0.07180529, -1.751243, 1, 1, 1, 1, 1,
-0.9870616, -0.8041655, -1.388377, 1, 1, 1, 1, 1,
-0.9828542, -0.5043097, -2.690431, 1, 1, 1, 1, 1,
-0.9744822, -1.161891, -4.011324, 1, 1, 1, 1, 1,
-0.96782, -0.8974983, -1.55829, 1, 1, 1, 1, 1,
-0.967628, -1.816939, -1.36645, 0, 0, 1, 1, 1,
-0.9665496, -1.88232, -1.358096, 1, 0, 0, 1, 1,
-0.9546615, -1.645637, -2.148423, 1, 0, 0, 1, 1,
-0.9538484, -0.05719095, -0.6210315, 1, 0, 0, 1, 1,
-0.952666, -0.2105889, -2.754668, 1, 0, 0, 1, 1,
-0.9494227, 0.6312189, -1.799031, 1, 0, 0, 1, 1,
-0.9484676, -1.039094, -2.161709, 0, 0, 0, 1, 1,
-0.9451468, 0.02418695, -2.819836, 0, 0, 0, 1, 1,
-0.940419, 0.9779224, -0.5231376, 0, 0, 0, 1, 1,
-0.9399029, -0.04525068, -0.5929479, 0, 0, 0, 1, 1,
-0.9369058, 1.646798, 0.05752766, 0, 0, 0, 1, 1,
-0.9365582, -0.104198, -2.406216, 0, 0, 0, 1, 1,
-0.934278, -0.8405131, -2.035843, 0, 0, 0, 1, 1,
-0.9339251, 0.4270182, -1.264363, 1, 1, 1, 1, 1,
-0.9257314, -0.9594376, -1.774835, 1, 1, 1, 1, 1,
-0.9247242, 0.9701763, -2.273007, 1, 1, 1, 1, 1,
-0.9144176, -0.3185008, -3.622123, 1, 1, 1, 1, 1,
-0.9139217, -0.133225, -1.323511, 1, 1, 1, 1, 1,
-0.9063287, 0.306588, -1.064075, 1, 1, 1, 1, 1,
-0.8937242, -0.007470928, -2.906026, 1, 1, 1, 1, 1,
-0.8867084, 0.5730227, 0.5531365, 1, 1, 1, 1, 1,
-0.8852072, 1.214825, -0.3860207, 1, 1, 1, 1, 1,
-0.8822916, 0.143567, -2.848357, 1, 1, 1, 1, 1,
-0.873273, 0.1927859, -1.676895, 1, 1, 1, 1, 1,
-0.8682498, 0.3755516, -1.738058, 1, 1, 1, 1, 1,
-0.8664176, -0.9055678, -1.074888, 1, 1, 1, 1, 1,
-0.8610505, -1.222339, -3.098487, 1, 1, 1, 1, 1,
-0.8603194, 0.2792662, -1.601371, 1, 1, 1, 1, 1,
-0.858382, -1.142387, -3.121037, 0, 0, 1, 1, 1,
-0.8565328, 0.550077, -2.050784, 1, 0, 0, 1, 1,
-0.8490138, -0.4471231, -2.655202, 1, 0, 0, 1, 1,
-0.8341261, 1.947059, 0.3540555, 1, 0, 0, 1, 1,
-0.8331065, 0.0682286, -1.291177, 1, 0, 0, 1, 1,
-0.8282175, -0.8554354, -1.854167, 1, 0, 0, 1, 1,
-0.827099, 0.8391557, -1.29104, 0, 0, 0, 1, 1,
-0.8255466, 1.057884, -2.397485, 0, 0, 0, 1, 1,
-0.8219963, 1.600527, 0.206736, 0, 0, 0, 1, 1,
-0.8146607, -0.1108512, -1.517057, 0, 0, 0, 1, 1,
-0.8131239, 3.624958, 0.06418447, 0, 0, 0, 1, 1,
-0.8091949, 0.1161267, -1.391634, 0, 0, 0, 1, 1,
-0.8089948, 0.3030149, -1.224976, 0, 0, 0, 1, 1,
-0.8079733, 1.94846, -0.4767342, 1, 1, 1, 1, 1,
-0.8079555, 0.02626634, -1.145705, 1, 1, 1, 1, 1,
-0.8062179, -0.6201201, -2.673845, 1, 1, 1, 1, 1,
-0.7966983, -0.3267802, -4.227355, 1, 1, 1, 1, 1,
-0.7941456, 0.07074642, -1.71387, 1, 1, 1, 1, 1,
-0.7939637, 0.4991652, 0.4547115, 1, 1, 1, 1, 1,
-0.7939051, -0.3121336, -2.719357, 1, 1, 1, 1, 1,
-0.7894025, 2.087149, 1.114144, 1, 1, 1, 1, 1,
-0.7861617, 1.593249, -1.785972, 1, 1, 1, 1, 1,
-0.7815664, 0.2904058, -2.037335, 1, 1, 1, 1, 1,
-0.778358, 1.575246, 0.4868513, 1, 1, 1, 1, 1,
-0.7746716, 0.03619309, 0.4565578, 1, 1, 1, 1, 1,
-0.7716632, -0.1251071, -0.4478646, 1, 1, 1, 1, 1,
-0.7659366, 1.419915, 0.4025007, 1, 1, 1, 1, 1,
-0.7612755, -2.067482, -2.315803, 1, 1, 1, 1, 1,
-0.7581972, 0.9976959, 0.1148554, 0, 0, 1, 1, 1,
-0.7533011, 0.2863487, -0.4080978, 1, 0, 0, 1, 1,
-0.7495626, 1.600399, -1.505724, 1, 0, 0, 1, 1,
-0.7493291, -0.5922474, 0.8266681, 1, 0, 0, 1, 1,
-0.746497, -2.375749, -4.168906, 1, 0, 0, 1, 1,
-0.7463719, -0.5504755, -0.1946657, 1, 0, 0, 1, 1,
-0.7454067, 2.347418, -0.6317059, 0, 0, 0, 1, 1,
-0.7354486, -0.06638812, -3.023203, 0, 0, 0, 1, 1,
-0.7345446, -1.75836, -4.245501, 0, 0, 0, 1, 1,
-0.7289233, -1.210623, -2.942166, 0, 0, 0, 1, 1,
-0.7240092, -0.7772602, -2.130725, 0, 0, 0, 1, 1,
-0.7221951, -0.5072832, -2.795137, 0, 0, 0, 1, 1,
-0.7212902, -1.608978, -2.809797, 0, 0, 0, 1, 1,
-0.7208282, -1.095224, -3.147758, 1, 1, 1, 1, 1,
-0.7141395, -0.1664343, -3.40902, 1, 1, 1, 1, 1,
-0.6997787, -0.6048521, 0.09523418, 1, 1, 1, 1, 1,
-0.6992953, -1.032426, -1.996351, 1, 1, 1, 1, 1,
-0.695479, 0.3069706, -1.69688, 1, 1, 1, 1, 1,
-0.6939601, -1.208889, -0.8993847, 1, 1, 1, 1, 1,
-0.6908937, 0.7735242, -1.139283, 1, 1, 1, 1, 1,
-0.6906361, -0.1064493, -2.740319, 1, 1, 1, 1, 1,
-0.6886217, -0.07765981, -1.047479, 1, 1, 1, 1, 1,
-0.6839349, -1.18358, -4.207504, 1, 1, 1, 1, 1,
-0.683889, 0.728645, -3.333651, 1, 1, 1, 1, 1,
-0.6804879, -0.2080339, -0.9191282, 1, 1, 1, 1, 1,
-0.6743436, -1.888735, -5.421337, 1, 1, 1, 1, 1,
-0.6676372, -0.3424574, -3.831931, 1, 1, 1, 1, 1,
-0.6623873, 0.6695967, -1.179883, 1, 1, 1, 1, 1,
-0.6611531, -0.6206095, -4.624457, 0, 0, 1, 1, 1,
-0.6540479, 0.6336447, -0.9689986, 1, 0, 0, 1, 1,
-0.6491581, 1.144217, -1.036463, 1, 0, 0, 1, 1,
-0.6484454, 0.04142275, -2.160383, 1, 0, 0, 1, 1,
-0.6426663, -0.1255656, -2.103505, 1, 0, 0, 1, 1,
-0.6400818, 1.138122, 0.9163679, 1, 0, 0, 1, 1,
-0.6323309, -0.1762666, -2.4252, 0, 0, 0, 1, 1,
-0.6314172, -0.08681411, -2.599853, 0, 0, 0, 1, 1,
-0.6298604, 0.9678261, -0.7431141, 0, 0, 0, 1, 1,
-0.6296184, -0.4957115, -0.9292187, 0, 0, 0, 1, 1,
-0.6287606, -1.212164, -3.01726, 0, 0, 0, 1, 1,
-0.6127213, -0.8648667, -1.741136, 0, 0, 0, 1, 1,
-0.6124362, 0.5167909, -1.467479, 0, 0, 0, 1, 1,
-0.6104237, 0.583976, -0.5484493, 1, 1, 1, 1, 1,
-0.5998377, 0.8708563, -1.472341, 1, 1, 1, 1, 1,
-0.5968739, -0.9468923, -2.568773, 1, 1, 1, 1, 1,
-0.59527, -0.2269383, -3.766664, 1, 1, 1, 1, 1,
-0.5938814, 0.2644781, -1.570888, 1, 1, 1, 1, 1,
-0.5915923, 1.652281, 0.8836856, 1, 1, 1, 1, 1,
-0.5892129, -1.298866, -3.056067, 1, 1, 1, 1, 1,
-0.5876583, -0.2791261, -1.005884, 1, 1, 1, 1, 1,
-0.5822765, 0.5383973, -0.05345725, 1, 1, 1, 1, 1,
-0.58196, 0.3053851, -3.508042, 1, 1, 1, 1, 1,
-0.5818663, 0.3799815, -1.893847, 1, 1, 1, 1, 1,
-0.5707297, -0.03491579, -0.714085, 1, 1, 1, 1, 1,
-0.5702038, 0.5261144, -0.5297579, 1, 1, 1, 1, 1,
-0.5670555, 0.2840921, -1.227147, 1, 1, 1, 1, 1,
-0.5662434, -0.8910559, -2.076871, 1, 1, 1, 1, 1,
-0.5660256, -0.3911649, -1.779067, 0, 0, 1, 1, 1,
-0.56226, 1.199205, -0.3651188, 1, 0, 0, 1, 1,
-0.5615278, 0.2569252, -1.556139, 1, 0, 0, 1, 1,
-0.5615141, -0.4117747, -1.729137, 1, 0, 0, 1, 1,
-0.560069, 0.9175675, 0.5600051, 1, 0, 0, 1, 1,
-0.5570725, -0.7075148, -3.75325, 1, 0, 0, 1, 1,
-0.5542861, 0.2644171, -1.368211, 0, 0, 0, 1, 1,
-0.5530233, 0.1697773, -2.915368, 0, 0, 0, 1, 1,
-0.5501514, 0.5913344, -1.406755, 0, 0, 0, 1, 1,
-0.543313, 0.5194155, 0.3344524, 0, 0, 0, 1, 1,
-0.5431679, -0.3455833, -1.234553, 0, 0, 0, 1, 1,
-0.5353892, -0.4144588, -1.719214, 0, 0, 0, 1, 1,
-0.5278264, -0.0344215, -1.431858, 0, 0, 0, 1, 1,
-0.5258225, 0.3680571, -0.8394595, 1, 1, 1, 1, 1,
-0.5159289, 0.7434391, 0.1733873, 1, 1, 1, 1, 1,
-0.5121613, 1.186739, -0.4936029, 1, 1, 1, 1, 1,
-0.510686, 0.0467942, 0.9882779, 1, 1, 1, 1, 1,
-0.5060064, -0.7234924, -3.187999, 1, 1, 1, 1, 1,
-0.5038275, -1.289035, -2.848981, 1, 1, 1, 1, 1,
-0.5028418, 0.3206428, 0.1346565, 1, 1, 1, 1, 1,
-0.5012237, -0.5904121, -3.237215, 1, 1, 1, 1, 1,
-0.4971543, -0.5048237, -2.573108, 1, 1, 1, 1, 1,
-0.4948526, 1.405393, -0.7644252, 1, 1, 1, 1, 1,
-0.4942826, -0.4050669, -2.264826, 1, 1, 1, 1, 1,
-0.4906314, 0.8811805, 0.08379956, 1, 1, 1, 1, 1,
-0.4819303, -1.039217, -1.497077, 1, 1, 1, 1, 1,
-0.4780801, -0.1294847, -0.655452, 1, 1, 1, 1, 1,
-0.4736063, 1.686013, -1.067117, 1, 1, 1, 1, 1,
-0.4729412, -0.2871694, -1.553261, 0, 0, 1, 1, 1,
-0.4727992, -1.649673, -2.618454, 1, 0, 0, 1, 1,
-0.4718061, -0.5697287, -1.667115, 1, 0, 0, 1, 1,
-0.464217, -0.2522327, -1.711329, 1, 0, 0, 1, 1,
-0.4625393, 1.828077, -0.5644991, 1, 0, 0, 1, 1,
-0.4583549, 2.867476, -1.25012, 1, 0, 0, 1, 1,
-0.4563417, -0.9915232, -2.922297, 0, 0, 0, 1, 1,
-0.4532702, 0.09064578, -2.888318, 0, 0, 0, 1, 1,
-0.4505819, 1.028202, -1.220794, 0, 0, 0, 1, 1,
-0.4503292, 0.06418918, 0.4349517, 0, 0, 0, 1, 1,
-0.4484638, -0.01494471, -1.57267, 0, 0, 0, 1, 1,
-0.4474348, 1.672196, -0.4413282, 0, 0, 0, 1, 1,
-0.4467475, -0.4381427, -0.9608899, 0, 0, 0, 1, 1,
-0.4445168, -0.05119903, -2.625959, 1, 1, 1, 1, 1,
-0.4431276, -1.135232, -3.471332, 1, 1, 1, 1, 1,
-0.4414243, 0.1391073, -1.338314, 1, 1, 1, 1, 1,
-0.4351183, -0.3662659, -2.000206, 1, 1, 1, 1, 1,
-0.4349362, -0.4459335, -3.977714, 1, 1, 1, 1, 1,
-0.4345649, 0.02861238, -0.6831725, 1, 1, 1, 1, 1,
-0.4302819, 0.2287752, -1.162504, 1, 1, 1, 1, 1,
-0.4261896, 0.2017697, -1.646054, 1, 1, 1, 1, 1,
-0.4256127, -0.7960459, -3.23373, 1, 1, 1, 1, 1,
-0.4248233, -1.382026, -1.974034, 1, 1, 1, 1, 1,
-0.422819, 0.5661867, 0.3152123, 1, 1, 1, 1, 1,
-0.4217663, -1.325166, -2.775104, 1, 1, 1, 1, 1,
-0.4174626, -0.7512949, -1.859071, 1, 1, 1, 1, 1,
-0.4155739, -1.279758, -3.980399, 1, 1, 1, 1, 1,
-0.4155647, 0.7441337, 0.2219854, 1, 1, 1, 1, 1,
-0.412695, 0.3870085, -0.9974392, 0, 0, 1, 1, 1,
-0.412464, 1.168638, 0.2381368, 1, 0, 0, 1, 1,
-0.4090683, 0.3072819, -0.6704436, 1, 0, 0, 1, 1,
-0.4071902, -0.2197835, -1.298283, 1, 0, 0, 1, 1,
-0.4058663, 1.983198, 0.0440098, 1, 0, 0, 1, 1,
-0.4051779, 0.2943083, -2.567048, 1, 0, 0, 1, 1,
-0.4014668, -1.504133, -2.291507, 0, 0, 0, 1, 1,
-0.4013644, 0.1561432, -1.196558, 0, 0, 0, 1, 1,
-0.4011987, 0.5133419, 0.3699269, 0, 0, 0, 1, 1,
-0.3987994, -1.188044, -2.495067, 0, 0, 0, 1, 1,
-0.398132, 0.5446187, -2.101996, 0, 0, 0, 1, 1,
-0.39432, 1.26079, 0.6456115, 0, 0, 0, 1, 1,
-0.3921475, 0.7604438, -1.519499, 0, 0, 0, 1, 1,
-0.3910279, 1.60809, 0.47848, 1, 1, 1, 1, 1,
-0.3843036, 1.313831, -0.6002603, 1, 1, 1, 1, 1,
-0.3830234, -1.16822, -2.363142, 1, 1, 1, 1, 1,
-0.3809451, -0.9511666, -1.685795, 1, 1, 1, 1, 1,
-0.3797556, -1.134434, -1.73338, 1, 1, 1, 1, 1,
-0.3764123, -0.2556385, -1.894109, 1, 1, 1, 1, 1,
-0.3746983, 0.5220548, -1.408839, 1, 1, 1, 1, 1,
-0.3743403, 0.08685938, -1.631547, 1, 1, 1, 1, 1,
-0.3716854, -1.118626, -2.747146, 1, 1, 1, 1, 1,
-0.3715573, -0.4734922, -2.85048, 1, 1, 1, 1, 1,
-0.3616525, -0.8368099, -0.00299044, 1, 1, 1, 1, 1,
-0.360366, 2.254818, 0.06662916, 1, 1, 1, 1, 1,
-0.3593109, 0.7953801, -1.595379, 1, 1, 1, 1, 1,
-0.3590207, 2.107371, 1.251799, 1, 1, 1, 1, 1,
-0.3564271, 0.3974469, 0.06384663, 1, 1, 1, 1, 1,
-0.3552909, -0.7109134, -1.858505, 0, 0, 1, 1, 1,
-0.3551342, 0.8559578, -0.7495349, 1, 0, 0, 1, 1,
-0.3465014, -1.793702, -2.85138, 1, 0, 0, 1, 1,
-0.345327, -0.544489, -1.499761, 1, 0, 0, 1, 1,
-0.3434841, -1.17203, -2.120019, 1, 0, 0, 1, 1,
-0.3424147, -0.9255763, -2.147377, 1, 0, 0, 1, 1,
-0.338501, -1.003096, -2.061782, 0, 0, 0, 1, 1,
-0.3346161, 1.025151, -0.8482071, 0, 0, 0, 1, 1,
-0.3326824, 0.8190361, 0.2953261, 0, 0, 0, 1, 1,
-0.3312908, 0.9091504, 0.8751226, 0, 0, 0, 1, 1,
-0.3312511, -0.5411228, -1.962222, 0, 0, 0, 1, 1,
-0.3307908, -0.8112568, -3.934401, 0, 0, 0, 1, 1,
-0.3269275, 1.558839, -1.269566, 0, 0, 0, 1, 1,
-0.3236497, -1.777409, -3.780337, 1, 1, 1, 1, 1,
-0.3210087, 0.5345683, -1.6238, 1, 1, 1, 1, 1,
-0.3194951, 1.30921, -1.039519, 1, 1, 1, 1, 1,
-0.3176951, 0.2470656, -2.861938, 1, 1, 1, 1, 1,
-0.3136034, -0.2821078, -1.736995, 1, 1, 1, 1, 1,
-0.3111033, -0.6791198, -3.197585, 1, 1, 1, 1, 1,
-0.3103933, 0.3956746, -0.9610014, 1, 1, 1, 1, 1,
-0.3059037, 0.7341948, 0.3638574, 1, 1, 1, 1, 1,
-0.3055064, 0.7754165, -0.01631722, 1, 1, 1, 1, 1,
-0.3054414, 0.01367592, -2.128564, 1, 1, 1, 1, 1,
-0.2989101, 0.3615841, -0.3903705, 1, 1, 1, 1, 1,
-0.2968174, 2.746611, -0.1026796, 1, 1, 1, 1, 1,
-0.2878415, 0.3537826, -1.663952, 1, 1, 1, 1, 1,
-0.2853984, 0.7542179, -0.3705606, 1, 1, 1, 1, 1,
-0.2836892, 0.6635324, 0.6224349, 1, 1, 1, 1, 1,
-0.2835891, 1.369422, -0.1896761, 0, 0, 1, 1, 1,
-0.2745833, 0.139076, 0.4845399, 1, 0, 0, 1, 1,
-0.2736245, 1.278069, -0.9404185, 1, 0, 0, 1, 1,
-0.2666897, -0.2563792, -1.506873, 1, 0, 0, 1, 1,
-0.2592386, 1.226403, -0.169401, 1, 0, 0, 1, 1,
-0.2576679, -0.3911803, -2.17342, 1, 0, 0, 1, 1,
-0.2539286, 0.8981947, -0.2426344, 0, 0, 0, 1, 1,
-0.2515826, 0.3681264, -0.6184235, 0, 0, 0, 1, 1,
-0.2493186, 0.3421569, 1.220269, 0, 0, 0, 1, 1,
-0.2468915, 0.4950145, 0.2844286, 0, 0, 0, 1, 1,
-0.2428804, 0.2534031, -1.408577, 0, 0, 0, 1, 1,
-0.2415083, 2.20344, 0.9505605, 0, 0, 0, 1, 1,
-0.236301, -2.639556, -2.453324, 0, 0, 0, 1, 1,
-0.2333696, -0.74199, -1.983539, 1, 1, 1, 1, 1,
-0.2315653, -0.4195787, -2.455634, 1, 1, 1, 1, 1,
-0.2290321, -2.062226, -3.019055, 1, 1, 1, 1, 1,
-0.2261004, 0.3993439, 0.2897132, 1, 1, 1, 1, 1,
-0.2257855, -0.878963, -4.302507, 1, 1, 1, 1, 1,
-0.223648, 0.8089225, -0.9570282, 1, 1, 1, 1, 1,
-0.2216946, 0.5729842, -0.003664651, 1, 1, 1, 1, 1,
-0.2140145, 1.107776, -0.1547723, 1, 1, 1, 1, 1,
-0.2125657, 1.163993, -0.6615982, 1, 1, 1, 1, 1,
-0.2110825, -0.5535119, -3.779063, 1, 1, 1, 1, 1,
-0.2074758, 0.2905224, 0.9838915, 1, 1, 1, 1, 1,
-0.1994106, 1.350008, 0.06447222, 1, 1, 1, 1, 1,
-0.1966309, 0.5224985, 0.5367304, 1, 1, 1, 1, 1,
-0.1954156, -0.08731017, -0.5840057, 1, 1, 1, 1, 1,
-0.1912349, 0.7939593, -0.5618629, 1, 1, 1, 1, 1,
-0.1840367, 0.5411295, 0.344923, 0, 0, 1, 1, 1,
-0.183166, 0.9546455, 0.5034413, 1, 0, 0, 1, 1,
-0.1826037, -0.13795, -2.882712, 1, 0, 0, 1, 1,
-0.177812, -0.4655324, -1.88141, 1, 0, 0, 1, 1,
-0.1752501, 1.157411, -2.935257, 1, 0, 0, 1, 1,
-0.1743763, 1.111551, 0.06374776, 1, 0, 0, 1, 1,
-0.1742124, 0.2710024, -0.154985, 0, 0, 0, 1, 1,
-0.1659748, -1.362876, -3.400053, 0, 0, 0, 1, 1,
-0.1656294, 0.6576736, 0.4941325, 0, 0, 0, 1, 1,
-0.1634105, 0.07853155, -0.6767466, 0, 0, 0, 1, 1,
-0.1593047, -0.5874794, -2.889194, 0, 0, 0, 1, 1,
-0.1587411, -0.04217644, -2.360056, 0, 0, 0, 1, 1,
-0.1585755, 0.08080359, -1.55077, 0, 0, 0, 1, 1,
-0.1494202, 2.328837, -1.321616, 1, 1, 1, 1, 1,
-0.1438427, -0.2935749, -2.837088, 1, 1, 1, 1, 1,
-0.1425768, 0.8893921, -0.1236104, 1, 1, 1, 1, 1,
-0.1350252, 1.331935, -1.119577, 1, 1, 1, 1, 1,
-0.1344497, -1.451971, -2.650035, 1, 1, 1, 1, 1,
-0.1322971, 0.1414631, -2.804569, 1, 1, 1, 1, 1,
-0.1267812, 0.7234251, -1.814562, 1, 1, 1, 1, 1,
-0.1249675, -0.9938843, -3.890403, 1, 1, 1, 1, 1,
-0.120108, 0.3689497, 0.1422749, 1, 1, 1, 1, 1,
-0.1174755, 0.199454, -1.246669, 1, 1, 1, 1, 1,
-0.1132302, -0.8277504, -4.22661, 1, 1, 1, 1, 1,
-0.1100811, 0.8892164, -0.8937306, 1, 1, 1, 1, 1,
-0.1093315, -0.5849698, -4.076443, 1, 1, 1, 1, 1,
-0.1066893, -0.7353188, -4.137285, 1, 1, 1, 1, 1,
-0.09995018, 0.2740652, -0.4253173, 1, 1, 1, 1, 1,
-0.09461234, 0.3024479, -0.916214, 0, 0, 1, 1, 1,
-0.09450434, -0.6297941, -2.890884, 1, 0, 0, 1, 1,
-0.09401506, -1.525984, -2.047672, 1, 0, 0, 1, 1,
-0.08874001, 0.9601801, 0.3541022, 1, 0, 0, 1, 1,
-0.07764794, 0.3738034, 0.1249072, 1, 0, 0, 1, 1,
-0.06977358, -0.7914504, -3.433227, 1, 0, 0, 1, 1,
-0.06931876, 0.1191114, -0.6512923, 0, 0, 0, 1, 1,
-0.06927175, 1.286047, 0.3068752, 0, 0, 0, 1, 1,
-0.06790754, -0.111252, -3.818325, 0, 0, 0, 1, 1,
-0.06624246, 1.019969, -0.2302836, 0, 0, 0, 1, 1,
-0.06339704, 1.51336, 0.4290203, 0, 0, 0, 1, 1,
-0.05950776, 0.2886283, -0.916791, 0, 0, 0, 1, 1,
-0.0566309, 0.7036377, -0.3847449, 0, 0, 0, 1, 1,
-0.05648625, 2.131485, 0.9141882, 1, 1, 1, 1, 1,
-0.05133773, 0.006771712, 1.030046, 1, 1, 1, 1, 1,
-0.04629416, -0.1023178, -4.609691, 1, 1, 1, 1, 1,
-0.04567937, 0.1804872, 0.2555968, 1, 1, 1, 1, 1,
-0.04506055, -0.2264296, -3.331719, 1, 1, 1, 1, 1,
-0.04419778, -0.3571128, -2.694145, 1, 1, 1, 1, 1,
-0.04409067, 1.047595, -0.5424822, 1, 1, 1, 1, 1,
-0.04376862, -0.8454969, -2.608403, 1, 1, 1, 1, 1,
-0.04359155, 0.2706778, 0.3548725, 1, 1, 1, 1, 1,
-0.04322078, 0.1681235, 0.1210527, 1, 1, 1, 1, 1,
-0.0366936, 1.459884, -1.65073, 1, 1, 1, 1, 1,
-0.03468931, 0.7809519, 1.021334, 1, 1, 1, 1, 1,
-0.03338067, -0.4297693, -3.907976, 1, 1, 1, 1, 1,
-0.02958925, -0.2442047, -3.871877, 1, 1, 1, 1, 1,
-0.02923741, -0.8556056, -2.686707, 1, 1, 1, 1, 1,
-0.0274674, 1.919606, -1.579782, 0, 0, 1, 1, 1,
-0.0244581, 0.3090634, 0.4526762, 1, 0, 0, 1, 1,
-0.02424731, -0.8047149, -3.926865, 1, 0, 0, 1, 1,
-0.02095658, 0.3900741, 0.08272227, 1, 0, 0, 1, 1,
-0.01477342, 1.559365, 0.05911048, 1, 0, 0, 1, 1,
-0.01463886, 0.592413, -1.976096, 1, 0, 0, 1, 1,
-0.008096996, 1.510369, 0.1255529, 0, 0, 0, 1, 1,
-0.007742215, 0.442344, 1.270354, 0, 0, 0, 1, 1,
-0.007730872, -0.4965459, -3.857685, 0, 0, 0, 1, 1,
-0.001195422, -2.130454, -2.360973, 0, 0, 0, 1, 1,
-0.0009599099, 1.433288, -1.533995, 0, 0, 0, 1, 1,
-0.0004992377, 1.266122, -0.0438724, 0, 0, 0, 1, 1,
0.0006871714, -1.901052, 1.786536, 0, 0, 0, 1, 1,
0.002066018, 1.401413, 1.689178, 1, 1, 1, 1, 1,
0.005828001, -1.031275, 3.410365, 1, 1, 1, 1, 1,
0.007362546, -1.053081, 2.309601, 1, 1, 1, 1, 1,
0.01009617, 0.1109327, -1.626446, 1, 1, 1, 1, 1,
0.01419937, -0.8588215, 4.600894, 1, 1, 1, 1, 1,
0.01470409, -0.8602561, 2.777532, 1, 1, 1, 1, 1,
0.01500202, -0.7854272, 2.313183, 1, 1, 1, 1, 1,
0.02369553, 1.000028, -2.771467, 1, 1, 1, 1, 1,
0.03188025, -2.374837, 2.550788, 1, 1, 1, 1, 1,
0.03264431, 0.6248974, 0.1638302, 1, 1, 1, 1, 1,
0.03937144, -0.08946052, 3.338448, 1, 1, 1, 1, 1,
0.04606016, 0.6604177, 0.2306565, 1, 1, 1, 1, 1,
0.04612, -0.6197584, 3.475263, 1, 1, 1, 1, 1,
0.05141497, 0.9178684, 0.1419507, 1, 1, 1, 1, 1,
0.05641934, -1.688756, 3.11429, 1, 1, 1, 1, 1,
0.05934361, -0.3517866, 2.623424, 0, 0, 1, 1, 1,
0.05995338, 1.578055, -0.4128239, 1, 0, 0, 1, 1,
0.06158892, 1.804086, -0.06811696, 1, 0, 0, 1, 1,
0.06248389, -0.6286472, 3.023087, 1, 0, 0, 1, 1,
0.06740086, 0.3869988, 1.313905, 1, 0, 0, 1, 1,
0.06951654, 1.809637, -0.6491783, 1, 0, 0, 1, 1,
0.07029255, -0.3958755, 3.203809, 0, 0, 0, 1, 1,
0.07190452, 1.46875, -0.2855768, 0, 0, 0, 1, 1,
0.07242239, 1.678094, -0.8587857, 0, 0, 0, 1, 1,
0.07318342, -2.014923, 4.961398, 0, 0, 0, 1, 1,
0.07339363, 0.3046184, 0.601211, 0, 0, 0, 1, 1,
0.077081, -0.06589872, 2.347138, 0, 0, 0, 1, 1,
0.07877547, 1.425007, 0.1053834, 0, 0, 0, 1, 1,
0.08129702, -1.285154, 4.117879, 1, 1, 1, 1, 1,
0.08142348, -0.102509, 2.616553, 1, 1, 1, 1, 1,
0.08697874, -0.9405977, 3.736648, 1, 1, 1, 1, 1,
0.08781173, -0.9833255, 5.123736, 1, 1, 1, 1, 1,
0.09287264, 0.08770254, -0.2906506, 1, 1, 1, 1, 1,
0.09728424, 0.9394422, -0.8693117, 1, 1, 1, 1, 1,
0.1046491, -0.344112, 3.106768, 1, 1, 1, 1, 1,
0.1056991, 2.029995, 2.334888, 1, 1, 1, 1, 1,
0.1129695, 1.188158, -0.6318619, 1, 1, 1, 1, 1,
0.1149827, 1.775892, -0.9076347, 1, 1, 1, 1, 1,
0.1191317, -0.2708102, 1.859567, 1, 1, 1, 1, 1,
0.1243475, -0.2052305, 4.016642, 1, 1, 1, 1, 1,
0.1264239, 0.916009, 0.2881782, 1, 1, 1, 1, 1,
0.1271251, 1.105797, 0.06556898, 1, 1, 1, 1, 1,
0.1287867, -1.482467, 2.53459, 1, 1, 1, 1, 1,
0.1297126, -0.2483284, 2.931046, 0, 0, 1, 1, 1,
0.1321447, 0.9801621, -0.4901344, 1, 0, 0, 1, 1,
0.1332019, 0.6117858, 1.188939, 1, 0, 0, 1, 1,
0.1337375, 0.0108788, 2.858254, 1, 0, 0, 1, 1,
0.1350742, 2.423761, 0.5000155, 1, 0, 0, 1, 1,
0.1363744, -0.387557, 2.867131, 1, 0, 0, 1, 1,
0.1381044, 1.011525, -0.199946, 0, 0, 0, 1, 1,
0.1386215, 0.5150023, -1.265388, 0, 0, 0, 1, 1,
0.1393402, -0.233011, 3.123326, 0, 0, 0, 1, 1,
0.1431235, 0.6102723, 0.2868834, 0, 0, 0, 1, 1,
0.1503397, -0.3630973, 1.546783, 0, 0, 0, 1, 1,
0.1509418, 0.3050505, 0.7300487, 0, 0, 0, 1, 1,
0.1527968, -0.7480351, 2.731455, 0, 0, 0, 1, 1,
0.1534414, 0.1039716, -0.005452424, 1, 1, 1, 1, 1,
0.1631049, 0.9437615, -1.245954, 1, 1, 1, 1, 1,
0.166061, 0.1829847, 1.773139, 1, 1, 1, 1, 1,
0.1679018, 1.981463, 2.019711, 1, 1, 1, 1, 1,
0.1681381, -0.3185008, 4.023962, 1, 1, 1, 1, 1,
0.1686696, 1.012416, -0.04472658, 1, 1, 1, 1, 1,
0.1711489, -1.00361, 3.472658, 1, 1, 1, 1, 1,
0.1740756, 0.1707076, 2.240415, 1, 1, 1, 1, 1,
0.1746477, -0.3140511, 1.192137, 1, 1, 1, 1, 1,
0.1758503, 0.9711502, 0.9456143, 1, 1, 1, 1, 1,
0.178811, -0.9683829, 3.266548, 1, 1, 1, 1, 1,
0.1849824, 0.6879934, -0.5654812, 1, 1, 1, 1, 1,
0.1853115, 0.7355764, -1.601709, 1, 1, 1, 1, 1,
0.1866152, 0.8831225, -0.2198585, 1, 1, 1, 1, 1,
0.1930836, 0.1165531, 1.528547, 1, 1, 1, 1, 1,
0.1938359, -2.493116, 3.234893, 0, 0, 1, 1, 1,
0.1949457, 0.5088782, -0.1623926, 1, 0, 0, 1, 1,
0.1961702, -0.3169169, 2.896052, 1, 0, 0, 1, 1,
0.1989353, -0.5319836, 3.528165, 1, 0, 0, 1, 1,
0.2047247, 0.5690905, 0.5927066, 1, 0, 0, 1, 1,
0.2078463, -0.9585907, 1.974157, 1, 0, 0, 1, 1,
0.2095913, 0.3469499, 0.1414154, 0, 0, 0, 1, 1,
0.211154, -0.4624946, 2.312809, 0, 0, 0, 1, 1,
0.2147537, -0.5499771, 2.80429, 0, 0, 0, 1, 1,
0.2173842, 1.116153, -1.613232, 0, 0, 0, 1, 1,
0.2194818, -0.528028, 1.064823, 0, 0, 0, 1, 1,
0.2201941, 0.507814, -0.7910866, 0, 0, 0, 1, 1,
0.221763, -1.808353, 1.44001, 0, 0, 0, 1, 1,
0.2219634, -0.5033232, 1.576803, 1, 1, 1, 1, 1,
0.2220735, 1.157613, -0.2745487, 1, 1, 1, 1, 1,
0.2222062, 0.2066745, 0.7917822, 1, 1, 1, 1, 1,
0.2261855, 0.2635188, 0.01725061, 1, 1, 1, 1, 1,
0.2285273, 1.616752, -1.001662, 1, 1, 1, 1, 1,
0.2370134, 0.5668349, 0.5839986, 1, 1, 1, 1, 1,
0.2401963, 0.1617344, 0.1360502, 1, 1, 1, 1, 1,
0.240263, 0.2643544, -0.3659891, 1, 1, 1, 1, 1,
0.2432275, -2.036364, 4.039202, 1, 1, 1, 1, 1,
0.2450292, -0.03643331, 2.127708, 1, 1, 1, 1, 1,
0.2463432, 0.1535022, 1.337431, 1, 1, 1, 1, 1,
0.2477725, -0.1219214, 3.348948, 1, 1, 1, 1, 1,
0.2506673, -0.5839128, 1.164224, 1, 1, 1, 1, 1,
0.2549388, 0.7790201, 0.3041003, 1, 1, 1, 1, 1,
0.2559415, 1.371025, 0.7942078, 1, 1, 1, 1, 1,
0.259087, -1.210377, 2.622819, 0, 0, 1, 1, 1,
0.2604775, -0.2579361, 4.748892, 1, 0, 0, 1, 1,
0.2673793, -0.04784684, 2.723465, 1, 0, 0, 1, 1,
0.2727368, 0.1461391, 0.2270297, 1, 0, 0, 1, 1,
0.2735174, 0.7526265, 1.363331, 1, 0, 0, 1, 1,
0.2744749, 0.8374025, 1.442761, 1, 0, 0, 1, 1,
0.2746385, 0.6143557, -0.1620356, 0, 0, 0, 1, 1,
0.2757302, -0.724905, -0.7053138, 0, 0, 0, 1, 1,
0.2764147, 1.898111, -0.4993742, 0, 0, 0, 1, 1,
0.2823597, -1.061271, 2.255433, 0, 0, 0, 1, 1,
0.2838713, -0.5362141, 2.65602, 0, 0, 0, 1, 1,
0.2840278, -1.488818, 3.605863, 0, 0, 0, 1, 1,
0.2869145, -0.3413446, 2.935197, 0, 0, 0, 1, 1,
0.2887723, 0.7236735, 0.5194237, 1, 1, 1, 1, 1,
0.2890683, -1.052381, 2.910945, 1, 1, 1, 1, 1,
0.2923198, 0.5579199, -0.6825247, 1, 1, 1, 1, 1,
0.2933997, 1.555898, 0.2745669, 1, 1, 1, 1, 1,
0.2936512, -0.76248, 4.390542, 1, 1, 1, 1, 1,
0.3002895, -0.1256279, 2.774864, 1, 1, 1, 1, 1,
0.3038978, 1.139384, 1.354661, 1, 1, 1, 1, 1,
0.304271, 0.7398428, -0.7155219, 1, 1, 1, 1, 1,
0.3061559, 0.8160887, 1.03232, 1, 1, 1, 1, 1,
0.3073038, -1.152378, 2.530554, 1, 1, 1, 1, 1,
0.3095867, 1.441651, 0.308929, 1, 1, 1, 1, 1,
0.3100749, -0.2936224, 2.963047, 1, 1, 1, 1, 1,
0.3101299, 1.03303, 0.9825525, 1, 1, 1, 1, 1,
0.3127207, -0.1112704, 1.843489, 1, 1, 1, 1, 1,
0.3131743, -0.2862791, 3.580821, 1, 1, 1, 1, 1,
0.3168038, -1.245985, 2.932306, 0, 0, 1, 1, 1,
0.3200979, -1.118016, 3.159811, 1, 0, 0, 1, 1,
0.3203073, -0.390636, 3.765169, 1, 0, 0, 1, 1,
0.3239981, -0.7305956, 2.77272, 1, 0, 0, 1, 1,
0.3280255, 0.5694124, 1.374509, 1, 0, 0, 1, 1,
0.3317243, 1.066571, -0.693244, 1, 0, 0, 1, 1,
0.3326556, 0.8204083, 1.264221, 0, 0, 0, 1, 1,
0.3361415, 1.627949, 0.5437556, 0, 0, 0, 1, 1,
0.3387916, -0.2773352, 1.980638, 0, 0, 0, 1, 1,
0.3432451, 1.143592, 1.259686, 0, 0, 0, 1, 1,
0.344626, -0.4886426, 5.557918, 0, 0, 0, 1, 1,
0.345427, 1.831168, -1.121478, 0, 0, 0, 1, 1,
0.3507491, -0.4495829, 2.25728, 0, 0, 0, 1, 1,
0.3512037, 0.001717768, -0.1151701, 1, 1, 1, 1, 1,
0.3541286, 0.1668834, 2.388175, 1, 1, 1, 1, 1,
0.3641426, -0.1294753, 2.910733, 1, 1, 1, 1, 1,
0.3715976, 1.978085, -0.391195, 1, 1, 1, 1, 1,
0.371735, -1.435827, 0.6007017, 1, 1, 1, 1, 1,
0.3720407, 1.084137, 0.1999274, 1, 1, 1, 1, 1,
0.3744198, 0.207062, 0.1990692, 1, 1, 1, 1, 1,
0.3748387, -0.6770387, 4.325805, 1, 1, 1, 1, 1,
0.383143, 2.122051, 0.2429355, 1, 1, 1, 1, 1,
0.3839873, -2.074984, 3.854154, 1, 1, 1, 1, 1,
0.3873233, -0.3489774, 2.331086, 1, 1, 1, 1, 1,
0.3880312, 1.013441, -0.3927801, 1, 1, 1, 1, 1,
0.3883022, -0.9390296, 2.107454, 1, 1, 1, 1, 1,
0.3900379, -0.09727059, 1.330097, 1, 1, 1, 1, 1,
0.3941286, 0.8694294, 3.123571, 1, 1, 1, 1, 1,
0.3959984, 1.157059, 0.5564594, 0, 0, 1, 1, 1,
0.3992522, 0.4401274, 2.090295, 1, 0, 0, 1, 1,
0.3998799, -0.1447454, 1.560443, 1, 0, 0, 1, 1,
0.4050873, 1.79121, 0.167594, 1, 0, 0, 1, 1,
0.4098233, 3.294679, -0.7235636, 1, 0, 0, 1, 1,
0.410363, 0.4268647, 0.130703, 1, 0, 0, 1, 1,
0.4122816, 0.7904761, 0.9108358, 0, 0, 0, 1, 1,
0.4146107, -0.2888821, 2.24285, 0, 0, 0, 1, 1,
0.4177952, 0.9091561, 0.9840695, 0, 0, 0, 1, 1,
0.4197459, 0.09182119, -1.175983, 0, 0, 0, 1, 1,
0.4214971, 0.6464228, 0.09197924, 0, 0, 0, 1, 1,
0.422438, -0.2162653, 2.349296, 0, 0, 0, 1, 1,
0.4228287, -0.8167419, 3.271085, 0, 0, 0, 1, 1,
0.4232071, 0.8063393, -1.130896, 1, 1, 1, 1, 1,
0.4246069, 0.09231059, 1.831616, 1, 1, 1, 1, 1,
0.4254504, -0.3594893, 2.487051, 1, 1, 1, 1, 1,
0.426554, 0.5749603, 0.06970163, 1, 1, 1, 1, 1,
0.4280937, -0.1774116, 4.013424, 1, 1, 1, 1, 1,
0.4291689, -2.202412, 3.803695, 1, 1, 1, 1, 1,
0.4310571, -1.476534, 3.056121, 1, 1, 1, 1, 1,
0.4349889, -0.1581744, 2.034677, 1, 1, 1, 1, 1,
0.442042, -1.100093, 2.438425, 1, 1, 1, 1, 1,
0.4424141, 0.4124567, 2.152561, 1, 1, 1, 1, 1,
0.4425271, -1.308677, 3.030097, 1, 1, 1, 1, 1,
0.4425414, -0.4641914, 3.712093, 1, 1, 1, 1, 1,
0.4426818, -0.9093987, 2.055005, 1, 1, 1, 1, 1,
0.4469044, -2.938504, 1.92937, 1, 1, 1, 1, 1,
0.4520945, 2.273608, 1.508796, 1, 1, 1, 1, 1,
0.4560108, -0.09434276, 2.278588, 0, 0, 1, 1, 1,
0.4569961, -0.7022041, 3.706417, 1, 0, 0, 1, 1,
0.4583662, 0.3812731, 0.2029389, 1, 0, 0, 1, 1,
0.4588325, -0.7010457, 1.243373, 1, 0, 0, 1, 1,
0.4601437, -0.3140811, 1.475378, 1, 0, 0, 1, 1,
0.4687253, 2.40185, -0.4597483, 1, 0, 0, 1, 1,
0.4704433, -1.080724, 1.96035, 0, 0, 0, 1, 1,
0.4719977, 0.6195709, 0.6865, 0, 0, 0, 1, 1,
0.4752696, -0.02007174, 2.517679, 0, 0, 0, 1, 1,
0.48096, 0.332238, 1.711673, 0, 0, 0, 1, 1,
0.4857379, -0.2457487, 1.039378, 0, 0, 0, 1, 1,
0.4861907, -0.6618223, 2.672481, 0, 0, 0, 1, 1,
0.4869474, 0.115726, 0.4053183, 0, 0, 0, 1, 1,
0.4913311, -1.04322, 2.660152, 1, 1, 1, 1, 1,
0.4922931, -1.412106, 2.800416, 1, 1, 1, 1, 1,
0.4970081, 1.135059, 0.1327116, 1, 1, 1, 1, 1,
0.5047393, -1.809658, 3.491043, 1, 1, 1, 1, 1,
0.5073245, -2.251814, 2.849731, 1, 1, 1, 1, 1,
0.5099866, -2.546477, 3.887498, 1, 1, 1, 1, 1,
0.5108783, -0.8527492, 3.131924, 1, 1, 1, 1, 1,
0.511424, 0.7046629, 1.642792, 1, 1, 1, 1, 1,
0.5149261, -0.005779115, 3.855119, 1, 1, 1, 1, 1,
0.5201585, -1.095209, 2.71014, 1, 1, 1, 1, 1,
0.5213778, 1.56101, 0.6620727, 1, 1, 1, 1, 1,
0.5243212, 1.338484, 1.949974, 1, 1, 1, 1, 1,
0.5265504, 0.3874688, 1.905089, 1, 1, 1, 1, 1,
0.5358216, 0.5273272, -0.01549577, 1, 1, 1, 1, 1,
0.5391852, -0.04681027, 0.3556103, 1, 1, 1, 1, 1,
0.5432337, -0.2111865, 0.5251362, 0, 0, 1, 1, 1,
0.5465395, 0.6375406, 0.1233061, 1, 0, 0, 1, 1,
0.5488376, -0.4667986, 1.500217, 1, 0, 0, 1, 1,
0.5542661, 0.8577572, 0.7009011, 1, 0, 0, 1, 1,
0.5546425, -1.890438, 3.6777, 1, 0, 0, 1, 1,
0.5558712, -0.4897641, 2.50004, 1, 0, 0, 1, 1,
0.5558749, -0.7499803, 0.9470211, 0, 0, 0, 1, 1,
0.5596144, 0.2908891, 2.3257, 0, 0, 0, 1, 1,
0.5633263, 0.9608865, 1.935463, 0, 0, 0, 1, 1,
0.5633974, -0.3351026, 1.583459, 0, 0, 0, 1, 1,
0.5759173, -0.5690113, 2.994902, 0, 0, 0, 1, 1,
0.5783268, -1.723229, 2.708125, 0, 0, 0, 1, 1,
0.5819024, 1.426667, 1.537003, 0, 0, 0, 1, 1,
0.5823531, 0.730528, 0.5834953, 1, 1, 1, 1, 1,
0.5852491, 0.8632174, 0.09595666, 1, 1, 1, 1, 1,
0.585469, -0.4233005, 3.006208, 1, 1, 1, 1, 1,
0.5879277, 1.557715, 0.123591, 1, 1, 1, 1, 1,
0.5879462, -0.8311359, 2.566471, 1, 1, 1, 1, 1,
0.5924323, -1.443496, 2.265643, 1, 1, 1, 1, 1,
0.5997595, -0.9984942, 1.546896, 1, 1, 1, 1, 1,
0.6018274, -0.4058211, 1.982232, 1, 1, 1, 1, 1,
0.6024654, -0.07178833, -0.01894584, 1, 1, 1, 1, 1,
0.6042894, -0.1948327, 2.826969, 1, 1, 1, 1, 1,
0.604844, -1.394056, 2.700873, 1, 1, 1, 1, 1,
0.6098555, 0.3384621, 0.9182281, 1, 1, 1, 1, 1,
0.6140414, 1.783571, 0.4331044, 1, 1, 1, 1, 1,
0.6187696, -0.7228186, 1.199421, 1, 1, 1, 1, 1,
0.6193197, -0.3861513, 4.376791, 1, 1, 1, 1, 1,
0.6222191, -0.9321851, 2.191017, 0, 0, 1, 1, 1,
0.6237238, 0.9024871, 0.0401795, 1, 0, 0, 1, 1,
0.6242024, -2.176207, 3.170949, 1, 0, 0, 1, 1,
0.6304041, 0.8018797, 1.294358, 1, 0, 0, 1, 1,
0.6370085, -1.046587, 2.668422, 1, 0, 0, 1, 1,
0.6370602, 1.014398, 0.4948548, 1, 0, 0, 1, 1,
0.6471109, 1.453158, -1.230121, 0, 0, 0, 1, 1,
0.6482334, 0.251523, -0.04989321, 0, 0, 0, 1, 1,
0.6496785, 0.8631502, -0.2382728, 0, 0, 0, 1, 1,
0.6519649, 0.2320628, 0.9050056, 0, 0, 0, 1, 1,
0.6519771, 0.7555299, 0.4214908, 0, 0, 0, 1, 1,
0.6545286, 1.399133, -0.05453315, 0, 0, 0, 1, 1,
0.6545727, -0.715057, 1.279391, 0, 0, 0, 1, 1,
0.6564628, -0.38105, 1.006852, 1, 1, 1, 1, 1,
0.6565524, 2.214943, 0.7644199, 1, 1, 1, 1, 1,
0.6640077, -1.913035, 3.162765, 1, 1, 1, 1, 1,
0.6683404, -1.12534, 2.578013, 1, 1, 1, 1, 1,
0.6708358, -0.5836869, 2.387558, 1, 1, 1, 1, 1,
0.6791125, 0.2140269, 1.256608, 1, 1, 1, 1, 1,
0.6795451, -1.556594, 2.265723, 1, 1, 1, 1, 1,
0.6804502, -1.784028, 1.147289, 1, 1, 1, 1, 1,
0.6818827, -0.9521642, 3.441247, 1, 1, 1, 1, 1,
0.6826727, 0.3453881, 3.087381, 1, 1, 1, 1, 1,
0.7048016, 1.444499, 1.448618, 1, 1, 1, 1, 1,
0.7052747, -0.4730353, 3.493824, 1, 1, 1, 1, 1,
0.7187614, 0.1043008, 4.326828, 1, 1, 1, 1, 1,
0.721972, 0.2121965, -0.8870724, 1, 1, 1, 1, 1,
0.7236311, 1.068226, -0.1632109, 1, 1, 1, 1, 1,
0.7237616, -0.7867956, 2.139494, 0, 0, 1, 1, 1,
0.7250947, -1.611996, 3.735209, 1, 0, 0, 1, 1,
0.7356887, 0.7366084, -0.2604423, 1, 0, 0, 1, 1,
0.7378859, -1.196005, 2.258118, 1, 0, 0, 1, 1,
0.7403379, 0.7078188, -0.1004326, 1, 0, 0, 1, 1,
0.7431266, -0.6487353, 0.3638259, 1, 0, 0, 1, 1,
0.7482865, -0.6792008, 2.362645, 0, 0, 0, 1, 1,
0.7553039, 0.4516122, 1.682457, 0, 0, 0, 1, 1,
0.7554437, -0.9764293, 3.129115, 0, 0, 0, 1, 1,
0.7561174, 1.083728, 0.1541625, 0, 0, 0, 1, 1,
0.7572746, 1.445865, -0.5617586, 0, 0, 0, 1, 1,
0.7577168, 1.492043, -0.1992044, 0, 0, 0, 1, 1,
0.7592455, 0.7675676, 0.1143005, 0, 0, 0, 1, 1,
0.7629973, -0.9319783, 0.7342139, 1, 1, 1, 1, 1,
0.7725853, -0.2333801, 0.9352542, 1, 1, 1, 1, 1,
0.7725999, -0.6138732, 2.199364, 1, 1, 1, 1, 1,
0.7772236, 0.228033, 0.9335568, 1, 1, 1, 1, 1,
0.7782542, -1.340145, 2.912886, 1, 1, 1, 1, 1,
0.7807464, -1.131429, 4.118746, 1, 1, 1, 1, 1,
0.7820237, -0.4653128, 1.985713, 1, 1, 1, 1, 1,
0.7912915, -0.4274266, 2.104032, 1, 1, 1, 1, 1,
0.7955314, 0.1657979, 0.5395035, 1, 1, 1, 1, 1,
0.808264, 1.883687, 1.05832, 1, 1, 1, 1, 1,
0.8087354, 0.3162502, 0.9728255, 1, 1, 1, 1, 1,
0.8191469, 1.33048, 1.025479, 1, 1, 1, 1, 1,
0.8250462, 0.1471436, 1.3644, 1, 1, 1, 1, 1,
0.827732, -1.18303, 1.743542, 1, 1, 1, 1, 1,
0.8287329, 1.907686, 0.2289123, 1, 1, 1, 1, 1,
0.8295876, 0.1092832, 1.775849, 0, 0, 1, 1, 1,
0.8343361, -0.3015662, 2.406213, 1, 0, 0, 1, 1,
0.8347801, -1.09453, 0.4387664, 1, 0, 0, 1, 1,
0.8352282, 2.042922, 1.238414, 1, 0, 0, 1, 1,
0.8388876, 1.401674, -0.3854065, 1, 0, 0, 1, 1,
0.8391797, -0.6298686, 2.767698, 1, 0, 0, 1, 1,
0.8429755, 0.7590994, 2.068645, 0, 0, 0, 1, 1,
0.844584, -1.24689, 1.957488, 0, 0, 0, 1, 1,
0.8478406, -0.9880358, 2.457314, 0, 0, 0, 1, 1,
0.8481119, 2.096863, 0.4781629, 0, 0, 0, 1, 1,
0.8482306, 0.6118864, 0.660486, 0, 0, 0, 1, 1,
0.8508036, -1.117234, 2.105641, 0, 0, 0, 1, 1,
0.8543915, -1.469143, 3.544297, 0, 0, 0, 1, 1,
0.8581518, -0.1566896, 2.435901, 1, 1, 1, 1, 1,
0.8585649, 1.236947, 0.8879894, 1, 1, 1, 1, 1,
0.8615599, 0.5471723, -0.1849951, 1, 1, 1, 1, 1,
0.8671916, 0.4717067, -0.5332671, 1, 1, 1, 1, 1,
0.8682594, -0.3647672, 2.406166, 1, 1, 1, 1, 1,
0.873334, 0.05446914, 2.235839, 1, 1, 1, 1, 1,
0.8746439, 0.1551793, 1.240731, 1, 1, 1, 1, 1,
0.8794065, -1.346631, 2.011193, 1, 1, 1, 1, 1,
0.8810968, -0.5758931, 1.381171, 1, 1, 1, 1, 1,
0.8816447, 0.20789, -0.250216, 1, 1, 1, 1, 1,
0.8973844, 0.2708359, -0.3247363, 1, 1, 1, 1, 1,
0.900538, -0.5115907, 1.089262, 1, 1, 1, 1, 1,
0.9111697, -1.731169, 3.257055, 1, 1, 1, 1, 1,
0.9143255, 0.7469739, 1.486543, 1, 1, 1, 1, 1,
0.9145126, 1.714267, 0.7182524, 1, 1, 1, 1, 1,
0.9186685, 1.387342, 1.239188, 0, 0, 1, 1, 1,
0.9226964, -1.229907, 4.161742, 1, 0, 0, 1, 1,
0.9228786, -0.6023089, 3.164249, 1, 0, 0, 1, 1,
0.925487, -0.4561035, 0.1005773, 1, 0, 0, 1, 1,
0.9275113, -0.6200744, 2.409584, 1, 0, 0, 1, 1,
0.9292833, -0.178573, 1.796097, 1, 0, 0, 1, 1,
0.9299416, -0.8816578, 2.041666, 0, 0, 0, 1, 1,
0.9305486, -1.156833, 2.434046, 0, 0, 0, 1, 1,
0.9325468, 1.227157, 0.9911509, 0, 0, 0, 1, 1,
0.9332031, 0.5972838, 0.7070867, 0, 0, 0, 1, 1,
0.9419183, 1.311448, 0.6700963, 0, 0, 0, 1, 1,
0.9419565, -2.280775, 1.994674, 0, 0, 0, 1, 1,
0.9423298, -1.152687, 1.92362, 0, 0, 0, 1, 1,
0.94933, -1.684201, 1.566343, 1, 1, 1, 1, 1,
0.9517153, 1.107347, 1.793082, 1, 1, 1, 1, 1,
0.9519112, 0.3182094, 1.721012, 1, 1, 1, 1, 1,
0.9536269, -0.9271284, 3.258731, 1, 1, 1, 1, 1,
0.9560034, -0.8914432, 1.649374, 1, 1, 1, 1, 1,
0.9628319, 0.2336492, 0.4971914, 1, 1, 1, 1, 1,
0.964435, 0.4123573, -0.724642, 1, 1, 1, 1, 1,
0.9657183, 0.2607254, 1.977249, 1, 1, 1, 1, 1,
0.9707178, 1.069644, 1.025073, 1, 1, 1, 1, 1,
0.9733057, 0.3703416, 1.237654, 1, 1, 1, 1, 1,
0.9737224, 0.9540344, -0.05850663, 1, 1, 1, 1, 1,
0.9751438, -0.7380836, 2.713235, 1, 1, 1, 1, 1,
0.9761657, -1.215144, 2.463503, 1, 1, 1, 1, 1,
0.9934987, -0.7722824, 1.799203, 1, 1, 1, 1, 1,
0.9983686, 1.145093, 0.3223571, 1, 1, 1, 1, 1,
1.000207, -0.3643599, 1.464051, 0, 0, 1, 1, 1,
1.000576, 0.246996, 1.271782, 1, 0, 0, 1, 1,
1.001723, 1.715356, 1.437255, 1, 0, 0, 1, 1,
1.001987, 1.350185, 2.233588, 1, 0, 0, 1, 1,
1.005671, 1.489981, 0.8261565, 1, 0, 0, 1, 1,
1.005679, 0.4573702, 0.1849285, 1, 0, 0, 1, 1,
1.009643, -0.5569704, 0.6056988, 0, 0, 0, 1, 1,
1.012949, 0.9489092, 1.308095, 0, 0, 0, 1, 1,
1.025797, -0.04045172, 0.6653365, 0, 0, 0, 1, 1,
1.02729, 2.514199, -0.4265171, 0, 0, 0, 1, 1,
1.02987, 1.0893, 0.1179117, 0, 0, 0, 1, 1,
1.036214, -0.5604591, 1.491692, 0, 0, 0, 1, 1,
1.039617, 0.5372615, -0.8710822, 0, 0, 0, 1, 1,
1.040458, -0.450651, 2.456929, 1, 1, 1, 1, 1,
1.040992, 1.569923, 0.3128773, 1, 1, 1, 1, 1,
1.043054, 2.990409, -0.3376954, 1, 1, 1, 1, 1,
1.046641, 0.9190358, -0.2553478, 1, 1, 1, 1, 1,
1.050465, -0.2047937, 0.5366801, 1, 1, 1, 1, 1,
1.052522, -1.061057, 2.895092, 1, 1, 1, 1, 1,
1.052723, 1.904055, 0.206507, 1, 1, 1, 1, 1,
1.053451, -0.3696151, 3.079085, 1, 1, 1, 1, 1,
1.057239, 0.3446831, 2.244936, 1, 1, 1, 1, 1,
1.070068, -1.354225, 3.338629, 1, 1, 1, 1, 1,
1.072151, -0.2187412, 2.173099, 1, 1, 1, 1, 1,
1.072595, 0.4039859, 0.9729738, 1, 1, 1, 1, 1,
1.08122, -0.3296674, 1.957433, 1, 1, 1, 1, 1,
1.082976, -0.5068984, 3.045487, 1, 1, 1, 1, 1,
1.084986, 0.3872041, 1.065043, 1, 1, 1, 1, 1,
1.088062, -0.5906432, -0.1706234, 0, 0, 1, 1, 1,
1.089517, -0.6193311, 2.864768, 1, 0, 0, 1, 1,
1.114668, -0.02060366, 1.718804, 1, 0, 0, 1, 1,
1.114829, 0.5735214, 1.432352, 1, 0, 0, 1, 1,
1.11485, -0.5331833, 3.467332, 1, 0, 0, 1, 1,
1.132956, -0.4902602, 3.040764, 1, 0, 0, 1, 1,
1.136311, 0.6438732, 0.3960541, 0, 0, 0, 1, 1,
1.14322, 0.7505693, 1.50412, 0, 0, 0, 1, 1,
1.148789, -0.7103629, 2.102826, 0, 0, 0, 1, 1,
1.154925, -0.3966843, 1.860925, 0, 0, 0, 1, 1,
1.155473, 0.1639938, 1.524318, 0, 0, 0, 1, 1,
1.163316, -0.3713969, 2.220446, 0, 0, 0, 1, 1,
1.167093, -1.224821, 2.479315, 0, 0, 0, 1, 1,
1.172771, -0.05477786, 0.5668171, 1, 1, 1, 1, 1,
1.173504, 0.8645857, -0.9040469, 1, 1, 1, 1, 1,
1.179248, -1.079217, 2.24889, 1, 1, 1, 1, 1,
1.186926, -0.3870338, 2.95246, 1, 1, 1, 1, 1,
1.187623, 0.07848694, 2.57488, 1, 1, 1, 1, 1,
1.188614, 1.532163, 1.007544, 1, 1, 1, 1, 1,
1.189551, 0.01206536, 0.5252717, 1, 1, 1, 1, 1,
1.223323, 1.073323, 1.866591, 1, 1, 1, 1, 1,
1.238106, -1.524401, 3.613734, 1, 1, 1, 1, 1,
1.243929, -0.1091773, 2.843373, 1, 1, 1, 1, 1,
1.255781, 0.4219584, 2.195935, 1, 1, 1, 1, 1,
1.274538, 0.07999872, 2.640172, 1, 1, 1, 1, 1,
1.275383, 3.005321, -0.6341628, 1, 1, 1, 1, 1,
1.277436, 0.8623505, -0.3777287, 1, 1, 1, 1, 1,
1.283678, -0.5768182, 0.1560813, 1, 1, 1, 1, 1,
1.286619, -0.01071205, 2.077542, 0, 0, 1, 1, 1,
1.28889, -0.8633068, 1.098714, 1, 0, 0, 1, 1,
1.306383, 1.110258, 0.7669027, 1, 0, 0, 1, 1,
1.312924, -0.05006504, 1.9239, 1, 0, 0, 1, 1,
1.319949, 0.07960143, 0.3342501, 1, 0, 0, 1, 1,
1.325308, 0.127314, 3.106517, 1, 0, 0, 1, 1,
1.326327, -0.9516782, 3.395281, 0, 0, 0, 1, 1,
1.32879, -0.6104885, 2.277815, 0, 0, 0, 1, 1,
1.33689, 2.856322, -1.399171, 0, 0, 0, 1, 1,
1.348632, 0.5399835, 3.042846, 0, 0, 0, 1, 1,
1.352952, 0.7343714, 0.5947888, 0, 0, 0, 1, 1,
1.354145, 0.4163441, 1.031515, 0, 0, 0, 1, 1,
1.358584, 0.3958347, 1.139146, 0, 0, 0, 1, 1,
1.364473, 0.849481, 1.253539, 1, 1, 1, 1, 1,
1.366536, 0.3080526, 0.4048983, 1, 1, 1, 1, 1,
1.370173, -1.086276, 2.234685, 1, 1, 1, 1, 1,
1.395156, -0.2686751, 2.544394, 1, 1, 1, 1, 1,
1.415953, 1.109319, 0.4877576, 1, 1, 1, 1, 1,
1.41972, 0.847939, 2.178949, 1, 1, 1, 1, 1,
1.420048, 0.5477778, -0.2375234, 1, 1, 1, 1, 1,
1.433764, 2.429231, 2.268885, 1, 1, 1, 1, 1,
1.435455, -1.367965, 2.257206, 1, 1, 1, 1, 1,
1.454225, -1.051928, 1.821059, 1, 1, 1, 1, 1,
1.455911, 0.5872378, -0.3592731, 1, 1, 1, 1, 1,
1.464979, 0.339774, 1.633545, 1, 1, 1, 1, 1,
1.467907, -1.03718, 1.821729, 1, 1, 1, 1, 1,
1.471343, 0.4634759, 0.7967008, 1, 1, 1, 1, 1,
1.478708, 0.2111997, 2.154462, 1, 1, 1, 1, 1,
1.492319, -0.7371422, 0.8411748, 0, 0, 1, 1, 1,
1.504187, 1.755923, 1.117767, 1, 0, 0, 1, 1,
1.50778, 0.3538184, 0.8526531, 1, 0, 0, 1, 1,
1.510587, -1.189873, 2.70525, 1, 0, 0, 1, 1,
1.517977, -0.1840214, 3.911061, 1, 0, 0, 1, 1,
1.518816, 0.1683158, 1.727231, 1, 0, 0, 1, 1,
1.525543, -0.7451984, 0.171589, 0, 0, 0, 1, 1,
1.525844, 0.5660933, -0.3205939, 0, 0, 0, 1, 1,
1.527515, 0.8844268, 0.8154444, 0, 0, 0, 1, 1,
1.533965, -0.5301091, 1.403921, 0, 0, 0, 1, 1,
1.538172, -1.304309, 0.7147439, 0, 0, 0, 1, 1,
1.542789, 1.627829, 1.431013, 0, 0, 0, 1, 1,
1.54431, 0.2851326, 2.896542, 0, 0, 0, 1, 1,
1.546042, 0.5466406, 1.158659, 1, 1, 1, 1, 1,
1.549709, 0.1676407, 0.9875864, 1, 1, 1, 1, 1,
1.560031, 0.5993486, 0.7371197, 1, 1, 1, 1, 1,
1.567031, 0.7886688, 2.405621, 1, 1, 1, 1, 1,
1.582965, 0.9737846, 2.30901, 1, 1, 1, 1, 1,
1.614091, 0.5062021, 2.091045, 1, 1, 1, 1, 1,
1.618191, -2.26994, 2.891617, 1, 1, 1, 1, 1,
1.624007, 0.6470212, 2.468874, 1, 1, 1, 1, 1,
1.642653, -0.7178089, 2.351, 1, 1, 1, 1, 1,
1.684768, 0.2993687, 1.59084, 1, 1, 1, 1, 1,
1.691216, 1.197535, 0.5829886, 1, 1, 1, 1, 1,
1.693102, -0.8553383, 2.697358, 1, 1, 1, 1, 1,
1.699321, -2.117656, 2.795065, 1, 1, 1, 1, 1,
1.699909, 0.3970622, 1.556319, 1, 1, 1, 1, 1,
1.707204, 1.144782, -0.287598, 1, 1, 1, 1, 1,
1.711381, -0.1542511, 1.169026, 0, 0, 1, 1, 1,
1.716765, -0.6089955, 1.354313, 1, 0, 0, 1, 1,
1.732013, -0.6951362, 3.174592, 1, 0, 0, 1, 1,
1.759334, -0.4136068, 0.466395, 1, 0, 0, 1, 1,
1.770635, 0.3113099, 0.3824266, 1, 0, 0, 1, 1,
1.77831, 0.4675612, 1.265122, 1, 0, 0, 1, 1,
1.778854, 0.5952416, 1.688999, 0, 0, 0, 1, 1,
1.795653, -0.8071634, 1.146776, 0, 0, 0, 1, 1,
1.797194, -0.4179465, 2.490964, 0, 0, 0, 1, 1,
1.804811, 0.2896324, 2.122119, 0, 0, 0, 1, 1,
1.805836, -0.7331223, 1.332803, 0, 0, 0, 1, 1,
1.81619, -1.063244, 3.328266, 0, 0, 0, 1, 1,
1.825966, 0.7920323, 2.432276, 0, 0, 0, 1, 1,
1.890708, 1.505326, -0.2120015, 1, 1, 1, 1, 1,
1.920971, -0.05019031, 2.587202, 1, 1, 1, 1, 1,
1.923489, 0.7953641, 1.203067, 1, 1, 1, 1, 1,
1.925375, 1.332755, 0.3825949, 1, 1, 1, 1, 1,
1.940532, -0.8735335, 2.025758, 1, 1, 1, 1, 1,
1.948861, 1.847131, -0.3385838, 1, 1, 1, 1, 1,
1.954887, 0.4026207, 0.505803, 1, 1, 1, 1, 1,
1.999303, 1.436873, 1.119824, 1, 1, 1, 1, 1,
2.00324, -1.079623, 1.44024, 1, 1, 1, 1, 1,
2.026095, -1.750195, 2.759576, 1, 1, 1, 1, 1,
2.026405, -0.4432647, 2.71614, 1, 1, 1, 1, 1,
2.040412, -2.219243, 2.867624, 1, 1, 1, 1, 1,
2.057186, 0.7121276, 0.7065588, 1, 1, 1, 1, 1,
2.080019, -0.5699569, -1.004049, 1, 1, 1, 1, 1,
2.127133, 0.5339921, 1.414647, 1, 1, 1, 1, 1,
2.134799, -0.01604521, 2.046775, 0, 0, 1, 1, 1,
2.146507, -0.7486688, 0.6637008, 1, 0, 0, 1, 1,
2.149022, 1.01264, 2.302327, 1, 0, 0, 1, 1,
2.172041, -1.049087, 2.779164, 1, 0, 0, 1, 1,
2.200253, -0.784173, -0.2681794, 1, 0, 0, 1, 1,
2.208769, -0.3923135, 4.65426, 1, 0, 0, 1, 1,
2.258838, -1.049127, 2.212951, 0, 0, 0, 1, 1,
2.296997, -0.3950381, 0.9032252, 0, 0, 0, 1, 1,
2.298637, 0.4065802, 2.751027, 0, 0, 0, 1, 1,
2.300063, -0.1677999, 1.455616, 0, 0, 0, 1, 1,
2.310849, 0.1078877, 2.011679, 0, 0, 0, 1, 1,
2.330134, 0.7654881, 1.432959, 0, 0, 0, 1, 1,
2.359467, -0.2628196, 1.065263, 0, 0, 0, 1, 1,
2.368761, 0.4776751, 2.228378, 1, 1, 1, 1, 1,
2.387793, -0.8275074, 0.56134, 1, 1, 1, 1, 1,
2.440733, -0.2246109, 4.187191, 1, 1, 1, 1, 1,
2.487275, 0.7859472, -0.7841181, 1, 1, 1, 1, 1,
2.577199, 0.7269034, 0.6038991, 1, 1, 1, 1, 1,
2.897079, 0.1341325, 1.855905, 1, 1, 1, 1, 1,
3.78166, -1.773838, 1.944084, 1, 1, 1, 1, 1
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
var radius = 9.776155;
var distance = 34.33833;
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
mvMatrix.translate( -0.4761245, -0.3432268, -0.06829047 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.33833);
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
