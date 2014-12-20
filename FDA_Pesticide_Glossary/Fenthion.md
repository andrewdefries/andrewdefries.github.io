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
-3.307735, -0.3149894, -2.100068, 1, 0, 0, 1,
-2.932889, -1.599282, -3.232367, 1, 0.007843138, 0, 1,
-2.657675, 0.6649938, -2.464315, 1, 0.01176471, 0, 1,
-2.572987, -1.602399, 0.1697108, 1, 0.01960784, 0, 1,
-2.467807, 1.316643, -0.6664108, 1, 0.02352941, 0, 1,
-2.35923, -0.7058399, -1.81554, 1, 0.03137255, 0, 1,
-2.213492, 0.6012692, -1.62576, 1, 0.03529412, 0, 1,
-2.145676, -0.005718021, -0.8564901, 1, 0.04313726, 0, 1,
-2.119628, 0.7922483, -1.644502, 1, 0.04705882, 0, 1,
-2.11472, 1.219214, 1.876993, 1, 0.05490196, 0, 1,
-2.098267, -1.068405, -0.8705724, 1, 0.05882353, 0, 1,
-2.097174, -0.6677271, -1.876524, 1, 0.06666667, 0, 1,
-2.078755, 0.02745296, -1.395187, 1, 0.07058824, 0, 1,
-2.07369, 0.04806288, -1.541192, 1, 0.07843138, 0, 1,
-2.068469, -0.4517877, -1.261219, 1, 0.08235294, 0, 1,
-2.059501, -0.3005352, -1.414771, 1, 0.09019608, 0, 1,
-2.037321, 0.1100371, -1.042327, 1, 0.09411765, 0, 1,
-2.026565, -0.7745162, -3.11356, 1, 0.1019608, 0, 1,
-2.024307, -0.2531673, -0.04671856, 1, 0.1098039, 0, 1,
-2.006867, -1.482288, -3.045836, 1, 0.1137255, 0, 1,
-1.994621, -1.452643, -2.310241, 1, 0.1215686, 0, 1,
-1.973611, -1.126465, -0.2681734, 1, 0.1254902, 0, 1,
-1.97298, -0.02769219, -1.191814, 1, 0.1333333, 0, 1,
-1.961229, -0.06938901, -1.813439, 1, 0.1372549, 0, 1,
-1.952872, -0.1214573, -3.087851, 1, 0.145098, 0, 1,
-1.934567, 0.5952516, -0.2937016, 1, 0.1490196, 0, 1,
-1.921133, 0.9929315, -0.9604174, 1, 0.1568628, 0, 1,
-1.846238, -0.03147124, -1.586609, 1, 0.1607843, 0, 1,
-1.834884, -0.315136, -1.652234, 1, 0.1686275, 0, 1,
-1.81831, 0.8581996, -1.19292, 1, 0.172549, 0, 1,
-1.801728, 0.03409803, -1.189035, 1, 0.1803922, 0, 1,
-1.775174, 0.7131401, -2.583248, 1, 0.1843137, 0, 1,
-1.773021, 0.2406734, -1.061767, 1, 0.1921569, 0, 1,
-1.754928, -0.5368378, -2.059044, 1, 0.1960784, 0, 1,
-1.751251, 0.08246685, -1.984269, 1, 0.2039216, 0, 1,
-1.731782, -0.4756292, -2.232445, 1, 0.2117647, 0, 1,
-1.71577, -0.04756393, -2.521761, 1, 0.2156863, 0, 1,
-1.701699, 1.893504, -0.7833021, 1, 0.2235294, 0, 1,
-1.683561, 0.1600814, -0.8796468, 1, 0.227451, 0, 1,
-1.673074, -1.110494, -2.126561, 1, 0.2352941, 0, 1,
-1.663872, 0.4111249, -1.751231, 1, 0.2392157, 0, 1,
-1.648095, -1.848693, -2.904501, 1, 0.2470588, 0, 1,
-1.637808, -0.6940656, -1.516366, 1, 0.2509804, 0, 1,
-1.631268, 0.349645, -1.654964, 1, 0.2588235, 0, 1,
-1.622472, 0.9321369, 0.03598612, 1, 0.2627451, 0, 1,
-1.616494, 1.91334, -1.524507, 1, 0.2705882, 0, 1,
-1.600384, -1.189674, -3.339243, 1, 0.2745098, 0, 1,
-1.596112, 0.1601228, -2.166745, 1, 0.282353, 0, 1,
-1.594333, 0.5410689, -1.454902, 1, 0.2862745, 0, 1,
-1.5934, -0.2587397, -1.074205, 1, 0.2941177, 0, 1,
-1.590302, -0.7753833, -1.582782, 1, 0.3019608, 0, 1,
-1.567297, 0.4174069, -1.039122, 1, 0.3058824, 0, 1,
-1.560562, 2.640345, -0.7051648, 1, 0.3137255, 0, 1,
-1.560389, 1.008389, -3.178379, 1, 0.3176471, 0, 1,
-1.542234, -1.793138, -2.525011, 1, 0.3254902, 0, 1,
-1.54139, 0.2745588, -2.714519, 1, 0.3294118, 0, 1,
-1.538517, 0.3936821, 0.5735963, 1, 0.3372549, 0, 1,
-1.531031, 1.027248, 0.09700718, 1, 0.3411765, 0, 1,
-1.52038, -0.3842692, -2.532276, 1, 0.3490196, 0, 1,
-1.514181, -0.6642724, 0.3279769, 1, 0.3529412, 0, 1,
-1.512055, 0.7507921, -2.322104, 1, 0.3607843, 0, 1,
-1.506517, -0.265061, -2.573881, 1, 0.3647059, 0, 1,
-1.488099, -0.9709326, -1.376894, 1, 0.372549, 0, 1,
-1.485594, -0.5895628, -3.618384, 1, 0.3764706, 0, 1,
-1.482556, 1.76589, -0.8098741, 1, 0.3843137, 0, 1,
-1.474041, 0.4333152, -0.07709408, 1, 0.3882353, 0, 1,
-1.458867, -1.117319, -1.938184, 1, 0.3960784, 0, 1,
-1.446102, 0.4755658, 0.4144532, 1, 0.4039216, 0, 1,
-1.442935, 1.401941, -0.4522926, 1, 0.4078431, 0, 1,
-1.437431, 1.34531, -1.189327, 1, 0.4156863, 0, 1,
-1.434264, 0.6587759, -1.993679, 1, 0.4196078, 0, 1,
-1.429816, 0.5814891, -0.574317, 1, 0.427451, 0, 1,
-1.428347, -1.790395, -2.043584, 1, 0.4313726, 0, 1,
-1.400059, 0.9056671, -1.337274, 1, 0.4392157, 0, 1,
-1.397918, 1.132042, -0.7143505, 1, 0.4431373, 0, 1,
-1.395371, 0.1188614, 1.725224, 1, 0.4509804, 0, 1,
-1.395136, 1.012777, 0.02679842, 1, 0.454902, 0, 1,
-1.394485, -1.152187, -1.027568, 1, 0.4627451, 0, 1,
-1.393322, -1.192973, -1.210137, 1, 0.4666667, 0, 1,
-1.389032, 0.5306706, -1.350902, 1, 0.4745098, 0, 1,
-1.387276, 0.581464, -1.301636, 1, 0.4784314, 0, 1,
-1.385553, 0.6518701, -1.774224, 1, 0.4862745, 0, 1,
-1.378412, -0.1393371, -4.659245, 1, 0.4901961, 0, 1,
-1.37507, -0.5267718, -1.337508, 1, 0.4980392, 0, 1,
-1.368542, 0.9591894, -1.044963, 1, 0.5058824, 0, 1,
-1.358881, -0.8023331, -2.472162, 1, 0.509804, 0, 1,
-1.356178, -2.230496, -3.052938, 1, 0.5176471, 0, 1,
-1.355508, 0.2526063, -0.7905746, 1, 0.5215687, 0, 1,
-1.345304, -0.5688559, -1.468433, 1, 0.5294118, 0, 1,
-1.34362, -0.6698987, -2.895018, 1, 0.5333334, 0, 1,
-1.32822, -1.115813, -1.913498, 1, 0.5411765, 0, 1,
-1.325379, -0.1209415, -0.04218425, 1, 0.5450981, 0, 1,
-1.321954, 0.6070225, -0.7647993, 1, 0.5529412, 0, 1,
-1.319756, -3.341899, -2.798977, 1, 0.5568628, 0, 1,
-1.317773, 0.02584521, -0.5337667, 1, 0.5647059, 0, 1,
-1.312539, -1.417569, -3.866417, 1, 0.5686275, 0, 1,
-1.309222, -0.4903602, -1.596717, 1, 0.5764706, 0, 1,
-1.302426, 1.598329, -2.36132, 1, 0.5803922, 0, 1,
-1.292619, -1.500336, -4.141661, 1, 0.5882353, 0, 1,
-1.283329, -0.3002859, -1.890788, 1, 0.5921569, 0, 1,
-1.280732, 0.925751, -2.560665, 1, 0.6, 0, 1,
-1.261027, 0.8360725, 1.350961, 1, 0.6078432, 0, 1,
-1.252775, -1.044873, -2.334625, 1, 0.6117647, 0, 1,
-1.251355, -1.369269, -1.769933, 1, 0.6196079, 0, 1,
-1.250345, 0.9606838, -0.4544406, 1, 0.6235294, 0, 1,
-1.247813, 1.082663, -1.153255, 1, 0.6313726, 0, 1,
-1.245703, -0.172162, -2.410784, 1, 0.6352941, 0, 1,
-1.244702, -1.063404, -2.072106, 1, 0.6431373, 0, 1,
-1.244066, -1.06238, -4.155297, 1, 0.6470588, 0, 1,
-1.229319, -1.247182, -2.288522, 1, 0.654902, 0, 1,
-1.222743, -0.9401911, -2.508857, 1, 0.6588235, 0, 1,
-1.222625, -0.05766126, -0.620177, 1, 0.6666667, 0, 1,
-1.219898, -0.4075364, -1.06113, 1, 0.6705883, 0, 1,
-1.210006, -0.180748, 0.5283757, 1, 0.6784314, 0, 1,
-1.203126, -0.04002187, -2.032144, 1, 0.682353, 0, 1,
-1.200338, 0.1528755, -0.7957168, 1, 0.6901961, 0, 1,
-1.198404, 0.6002947, -2.155467, 1, 0.6941177, 0, 1,
-1.192902, 0.1323963, 0.01426866, 1, 0.7019608, 0, 1,
-1.188972, -1.176769, -1.551935, 1, 0.7098039, 0, 1,
-1.179274, 1.269158, -3.479233, 1, 0.7137255, 0, 1,
-1.166322, 0.6709554, -1.914229, 1, 0.7215686, 0, 1,
-1.165524, -0.9733667, -1.277558, 1, 0.7254902, 0, 1,
-1.164359, 0.2153094, -1.305216, 1, 0.7333333, 0, 1,
-1.16317, 0.2681202, -0.9159869, 1, 0.7372549, 0, 1,
-1.151477, 0.4473585, -0.4846611, 1, 0.7450981, 0, 1,
-1.14296, 0.007686119, -1.103453, 1, 0.7490196, 0, 1,
-1.137434, -1.548943, -1.704399, 1, 0.7568628, 0, 1,
-1.133144, -1.267392, -1.871139, 1, 0.7607843, 0, 1,
-1.131495, -0.9998872, -4.425879, 1, 0.7686275, 0, 1,
-1.128905, 0.04258763, -2.582977, 1, 0.772549, 0, 1,
-1.128493, -0.5471974, -4.722356, 1, 0.7803922, 0, 1,
-1.12842, 0.9642013, 0.04761943, 1, 0.7843137, 0, 1,
-1.124224, -0.1006643, -1.27225, 1, 0.7921569, 0, 1,
-1.116053, 1.288566, -0.6275744, 1, 0.7960784, 0, 1,
-1.108247, -0.329358, -2.426693, 1, 0.8039216, 0, 1,
-1.096146, 0.6142214, -0.9075899, 1, 0.8117647, 0, 1,
-1.094715, 1.89656, -1.693129, 1, 0.8156863, 0, 1,
-1.093587, 0.02054322, -2.042119, 1, 0.8235294, 0, 1,
-1.092331, 0.4932632, 1.29281, 1, 0.827451, 0, 1,
-1.091374, 2.154905, -0.5115263, 1, 0.8352941, 0, 1,
-1.084637, -1.871063, -2.029331, 1, 0.8392157, 0, 1,
-1.083542, 0.04739402, -2.351595, 1, 0.8470588, 0, 1,
-1.071251, -1.024206, -0.8428339, 1, 0.8509804, 0, 1,
-1.068458, 0.6612878, -2.707978, 1, 0.8588235, 0, 1,
-1.068274, 1.321015, -0.8309861, 1, 0.8627451, 0, 1,
-1.066219, -0.6918567, -3.243456, 1, 0.8705882, 0, 1,
-1.059414, 0.8450801, 0.2858537, 1, 0.8745098, 0, 1,
-1.057371, -2.508586, -4.401317, 1, 0.8823529, 0, 1,
-1.04936, 0.3080539, -1.444777, 1, 0.8862745, 0, 1,
-1.047502, -2.142326, -3.785246, 1, 0.8941177, 0, 1,
-1.047039, 0.6314071, -1.566733, 1, 0.8980392, 0, 1,
-1.038146, 0.5153864, -1.71357, 1, 0.9058824, 0, 1,
-1.036577, 1.161153, -0.7525451, 1, 0.9137255, 0, 1,
-1.033369, -0.9573131, -2.602982, 1, 0.9176471, 0, 1,
-1.022691, -1.618488, -2.561574, 1, 0.9254902, 0, 1,
-1.020172, 0.08877483, -0.5109445, 1, 0.9294118, 0, 1,
-1.018453, -0.4453505, -0.9914479, 1, 0.9372549, 0, 1,
-1.01382, -0.5216869, -2.334002, 1, 0.9411765, 0, 1,
-1.010274, -1.685877, -1.688728, 1, 0.9490196, 0, 1,
-1.005194, -0.1429878, -1.820215, 1, 0.9529412, 0, 1,
-1.003478, -0.5660326, -2.349636, 1, 0.9607843, 0, 1,
-1.003435, -0.08080476, -0.9388515, 1, 0.9647059, 0, 1,
-1.002663, 0.3403007, -2.094356, 1, 0.972549, 0, 1,
-1.000714, -0.003378867, -1.819568, 1, 0.9764706, 0, 1,
-0.998208, -0.6511183, 0.115881, 1, 0.9843137, 0, 1,
-0.9924896, -0.3666595, -3.751251, 1, 0.9882353, 0, 1,
-0.9895626, -1.266743, -1.176248, 1, 0.9960784, 0, 1,
-0.9869313, 0.6004643, -3.076549, 0.9960784, 1, 0, 1,
-0.9817845, 1.125613, -0.4056219, 0.9921569, 1, 0, 1,
-0.9765041, 1.633106, -0.5457422, 0.9843137, 1, 0, 1,
-0.975868, 1.749904, -2.257699, 0.9803922, 1, 0, 1,
-0.9733022, 0.2666382, -2.27231, 0.972549, 1, 0, 1,
-0.9730406, -0.3790794, -1.840774, 0.9686275, 1, 0, 1,
-0.9675223, -0.3222595, -1.954068, 0.9607843, 1, 0, 1,
-0.9667206, 1.954829, 0.408947, 0.9568627, 1, 0, 1,
-0.9665349, 1.487846, 0.8352976, 0.9490196, 1, 0, 1,
-0.9648318, -0.6547237, -3.643648, 0.945098, 1, 0, 1,
-0.9598278, -1.508262, -2.83878, 0.9372549, 1, 0, 1,
-0.9591634, -0.5983309, -1.746247, 0.9333333, 1, 0, 1,
-0.9485888, 0.3381815, -1.153908, 0.9254902, 1, 0, 1,
-0.9458814, 1.588535, -1.454712, 0.9215686, 1, 0, 1,
-0.9457051, -0.3951657, -1.542104, 0.9137255, 1, 0, 1,
-0.9406173, -0.6767713, -2.351782, 0.9098039, 1, 0, 1,
-0.9387919, -3.115512, -1.486247, 0.9019608, 1, 0, 1,
-0.9368719, -1.39439, -2.824925, 0.8941177, 1, 0, 1,
-0.9352231, -0.5672668, -1.073516, 0.8901961, 1, 0, 1,
-0.9328537, 0.51217, -1.699608, 0.8823529, 1, 0, 1,
-0.9251415, 2.085754, -2.508728, 0.8784314, 1, 0, 1,
-0.9151623, 1.051509, -0.7324901, 0.8705882, 1, 0, 1,
-0.9140463, 0.2712326, 1.163823, 0.8666667, 1, 0, 1,
-0.9082672, -0.7420198, -1.251582, 0.8588235, 1, 0, 1,
-0.9068605, -0.1563385, -1.068003, 0.854902, 1, 0, 1,
-0.8935335, 0.6963996, -0.4917024, 0.8470588, 1, 0, 1,
-0.8909817, -1.044132, -3.204257, 0.8431373, 1, 0, 1,
-0.8904182, 0.234046, -0.7840653, 0.8352941, 1, 0, 1,
-0.8896284, 0.3514347, -0.6765805, 0.8313726, 1, 0, 1,
-0.8869497, -0.6547779, -2.5567, 0.8235294, 1, 0, 1,
-0.8860585, -0.1684715, -0.7425908, 0.8196079, 1, 0, 1,
-0.8849156, -1.01799, -3.202353, 0.8117647, 1, 0, 1,
-0.8786771, -1.016461, -0.4564322, 0.8078431, 1, 0, 1,
-0.8773869, -1.76102, -2.867271, 0.8, 1, 0, 1,
-0.8621122, -0.7313979, -1.168743, 0.7921569, 1, 0, 1,
-0.8552035, 1.51438, -1.125946, 0.7882353, 1, 0, 1,
-0.8550601, 0.7762528, -0.5396056, 0.7803922, 1, 0, 1,
-0.8537391, -0.9781393, -4.120932, 0.7764706, 1, 0, 1,
-0.8505897, 0.2537917, -2.985593, 0.7686275, 1, 0, 1,
-0.8331873, 1.841589, -0.4011737, 0.7647059, 1, 0, 1,
-0.8302934, -0.4902833, -3.354176, 0.7568628, 1, 0, 1,
-0.8288336, 0.9835686, -2.013581, 0.7529412, 1, 0, 1,
-0.827994, -0.5791136, -2.187138, 0.7450981, 1, 0, 1,
-0.8260891, -2.637674, -2.99199, 0.7411765, 1, 0, 1,
-0.8256809, -0.64735, -1.33219, 0.7333333, 1, 0, 1,
-0.8253418, -0.5278179, -2.902009, 0.7294118, 1, 0, 1,
-0.8151881, -1.100019, -2.933638, 0.7215686, 1, 0, 1,
-0.8134515, -1.975152, -1.231422, 0.7176471, 1, 0, 1,
-0.8132836, -1.923559, -1.362203, 0.7098039, 1, 0, 1,
-0.8129163, 0.2295274, -2.479278, 0.7058824, 1, 0, 1,
-0.811152, 0.2059506, -0.5183221, 0.6980392, 1, 0, 1,
-0.8103297, 0.9611491, -1.118508, 0.6901961, 1, 0, 1,
-0.7937964, 1.129656, 0.0901847, 0.6862745, 1, 0, 1,
-0.7892313, -1.153733, -4.301989, 0.6784314, 1, 0, 1,
-0.7887437, -1.771902, -3.666395, 0.6745098, 1, 0, 1,
-0.7861387, -0.1779099, -0.240001, 0.6666667, 1, 0, 1,
-0.7794937, -0.8719703, -2.411678, 0.6627451, 1, 0, 1,
-0.7782365, 0.1711569, -1.886528, 0.654902, 1, 0, 1,
-0.7769443, 0.7400983, -1.373327, 0.6509804, 1, 0, 1,
-0.7764502, 0.01113667, -2.080878, 0.6431373, 1, 0, 1,
-0.7763847, -2.729386, -3.541019, 0.6392157, 1, 0, 1,
-0.77232, -0.4029878, -3.728702, 0.6313726, 1, 0, 1,
-0.7717314, 0.9822653, -1.925406, 0.627451, 1, 0, 1,
-0.7693049, 0.5827285, -1.380094, 0.6196079, 1, 0, 1,
-0.7665879, -1.207185, -2.463487, 0.6156863, 1, 0, 1,
-0.7649716, -0.7188684, -3.171843, 0.6078432, 1, 0, 1,
-0.7634446, 0.7569489, -1.627257, 0.6039216, 1, 0, 1,
-0.7617338, -0.9605378, -3.73205, 0.5960785, 1, 0, 1,
-0.7564702, -1.970363, -3.674733, 0.5882353, 1, 0, 1,
-0.7552413, 0.5162916, -1.316377, 0.5843138, 1, 0, 1,
-0.7518787, -0.2377474, -0.5607823, 0.5764706, 1, 0, 1,
-0.7510683, -0.317852, -2.202537, 0.572549, 1, 0, 1,
-0.7507021, 0.5728009, -2.637251, 0.5647059, 1, 0, 1,
-0.7450954, 0.009654923, -1.293639, 0.5607843, 1, 0, 1,
-0.7436258, 0.266864, -0.9484195, 0.5529412, 1, 0, 1,
-0.7382414, -2.032758, -2.302877, 0.5490196, 1, 0, 1,
-0.7286237, 0.3777936, -0.1531783, 0.5411765, 1, 0, 1,
-0.7280215, -0.977452, -2.213502, 0.5372549, 1, 0, 1,
-0.7274618, 0.3656029, -1.519445, 0.5294118, 1, 0, 1,
-0.7253314, -0.9410561, -1.885877, 0.5254902, 1, 0, 1,
-0.72398, -0.8168213, -3.232727, 0.5176471, 1, 0, 1,
-0.7176236, 0.00574371, -2.080498, 0.5137255, 1, 0, 1,
-0.7153752, 0.6657698, 0.1070152, 0.5058824, 1, 0, 1,
-0.7101119, -0.04824522, 0.4301854, 0.5019608, 1, 0, 1,
-0.7099184, -1.61432, -4.575805, 0.4941176, 1, 0, 1,
-0.7096495, -0.3372299, -2.192577, 0.4862745, 1, 0, 1,
-0.7022521, 0.4176372, -0.2796839, 0.4823529, 1, 0, 1,
-0.7013059, -0.3328382, -2.155867, 0.4745098, 1, 0, 1,
-0.6929008, -1.483981, -2.615311, 0.4705882, 1, 0, 1,
-0.6918226, -0.88616, -1.488901, 0.4627451, 1, 0, 1,
-0.688228, -0.8505147, -2.775071, 0.4588235, 1, 0, 1,
-0.6860443, -0.3504481, 0.4861757, 0.4509804, 1, 0, 1,
-0.6836395, 0.527112, -0.5776684, 0.4470588, 1, 0, 1,
-0.6812871, 1.394752, -0.04080448, 0.4392157, 1, 0, 1,
-0.6791199, -1.337435, -1.911493, 0.4352941, 1, 0, 1,
-0.6784649, 1.072049, -1.658173, 0.427451, 1, 0, 1,
-0.676864, -0.669135, -3.96108, 0.4235294, 1, 0, 1,
-0.6760476, 1.906935, 0.6393861, 0.4156863, 1, 0, 1,
-0.6704111, 1.353396, -0.8558416, 0.4117647, 1, 0, 1,
-0.6608503, 0.2482963, -0.8844928, 0.4039216, 1, 0, 1,
-0.6585473, 0.9018205, -1.10663, 0.3960784, 1, 0, 1,
-0.657317, -0.3320197, -2.227349, 0.3921569, 1, 0, 1,
-0.6539363, -0.7018715, -1.497529, 0.3843137, 1, 0, 1,
-0.6440365, -0.189735, -3.352063, 0.3803922, 1, 0, 1,
-0.6438458, 1.317281, -0.2081728, 0.372549, 1, 0, 1,
-0.6395371, -1.280797, -3.349619, 0.3686275, 1, 0, 1,
-0.6293713, -0.05886212, -1.819173, 0.3607843, 1, 0, 1,
-0.6286985, -0.5811667, -2.863478, 0.3568628, 1, 0, 1,
-0.6230586, -0.8751398, -2.891118, 0.3490196, 1, 0, 1,
-0.6215484, 1.884267, -0.2206851, 0.345098, 1, 0, 1,
-0.619237, 1.091447, 0.5292759, 0.3372549, 1, 0, 1,
-0.6185235, 1.124356, -0.74981, 0.3333333, 1, 0, 1,
-0.6171573, 0.3112904, -0.8658758, 0.3254902, 1, 0, 1,
-0.608958, 0.08927188, -1.110391, 0.3215686, 1, 0, 1,
-0.6074457, 0.199523, -1.011071, 0.3137255, 1, 0, 1,
-0.6042932, -0.8335376, -1.488224, 0.3098039, 1, 0, 1,
-0.5917476, 0.09834738, -1.21414, 0.3019608, 1, 0, 1,
-0.5883951, -0.104061, -1.49938, 0.2941177, 1, 0, 1,
-0.5876415, 1.368227, 0.3927881, 0.2901961, 1, 0, 1,
-0.5864241, 0.3862823, 0.1814771, 0.282353, 1, 0, 1,
-0.5817963, -2.41717, -4.24934, 0.2784314, 1, 0, 1,
-0.5776468, 0.1813523, -1.725612, 0.2705882, 1, 0, 1,
-0.5769907, 2.15964, 0.8474203, 0.2666667, 1, 0, 1,
-0.5745553, -1.477389, -3.529802, 0.2588235, 1, 0, 1,
-0.5729095, 1.048894, 1.060924, 0.254902, 1, 0, 1,
-0.572693, -2.233645, -4.221127, 0.2470588, 1, 0, 1,
-0.5704431, -0.08995689, -1.500337, 0.2431373, 1, 0, 1,
-0.5674594, 0.5166335, -1.454158, 0.2352941, 1, 0, 1,
-0.5656999, 1.035468, -1.400092, 0.2313726, 1, 0, 1,
-0.5647048, -0.8515856, -5.31834, 0.2235294, 1, 0, 1,
-0.5601673, -1.795274, -2.159411, 0.2196078, 1, 0, 1,
-0.5567491, 0.2261587, -1.445034, 0.2117647, 1, 0, 1,
-0.5527869, -0.1548936, -1.478505, 0.2078431, 1, 0, 1,
-0.5512954, -0.2902597, -2.486269, 0.2, 1, 0, 1,
-0.5497741, -1.162409, -3.853432, 0.1921569, 1, 0, 1,
-0.54761, -0.5443693, -2.012146, 0.1882353, 1, 0, 1,
-0.5411815, 0.6833115, -1.575231, 0.1803922, 1, 0, 1,
-0.5367721, 0.1396062, -0.9028757, 0.1764706, 1, 0, 1,
-0.5347821, -0.422053, -2.3358, 0.1686275, 1, 0, 1,
-0.5328899, 0.5985181, -0.2560291, 0.1647059, 1, 0, 1,
-0.529688, 0.508897, 0.5010281, 0.1568628, 1, 0, 1,
-0.512362, -0.3660154, -2.60206, 0.1529412, 1, 0, 1,
-0.5091915, -1.556548, -2.572354, 0.145098, 1, 0, 1,
-0.5089252, 0.4024595, -1.631322, 0.1411765, 1, 0, 1,
-0.5079986, -1.086792, -3.128213, 0.1333333, 1, 0, 1,
-0.5057514, 0.6406083, 1.114948, 0.1294118, 1, 0, 1,
-0.502195, -0.6482823, -2.869781, 0.1215686, 1, 0, 1,
-0.5017102, -0.878418, -2.565734, 0.1176471, 1, 0, 1,
-0.5000509, 0.4956329, -0.1012524, 0.1098039, 1, 0, 1,
-0.4992038, 0.1571801, -0.298766, 0.1058824, 1, 0, 1,
-0.4969312, 0.4339729, -0.297736, 0.09803922, 1, 0, 1,
-0.4969228, -1.375609, -1.216218, 0.09019608, 1, 0, 1,
-0.4965, -0.366383, -1.268691, 0.08627451, 1, 0, 1,
-0.4959563, 0.06869979, -1.458377, 0.07843138, 1, 0, 1,
-0.484912, -0.5552213, -2.068824, 0.07450981, 1, 0, 1,
-0.4764584, -0.3134321, -2.237885, 0.06666667, 1, 0, 1,
-0.4667501, -1.04583, -2.737088, 0.0627451, 1, 0, 1,
-0.4663284, 1.385342, -0.2870597, 0.05490196, 1, 0, 1,
-0.4647528, 0.1682533, -0.735891, 0.05098039, 1, 0, 1,
-0.4624599, 0.06032854, -2.639826, 0.04313726, 1, 0, 1,
-0.4621878, 2.445179, 0.5702927, 0.03921569, 1, 0, 1,
-0.4613943, -0.8922604, -1.65354, 0.03137255, 1, 0, 1,
-0.4593224, 0.1371028, -1.508276, 0.02745098, 1, 0, 1,
-0.4557308, 1.370725, -0.3826467, 0.01960784, 1, 0, 1,
-0.4557244, -1.270863, -2.665132, 0.01568628, 1, 0, 1,
-0.4551304, 2.022829, -2.021526, 0.007843138, 1, 0, 1,
-0.4551281, -0.2009887, -1.021701, 0.003921569, 1, 0, 1,
-0.4512089, 0.5119542, -0.3239322, 0, 1, 0.003921569, 1,
-0.4391609, -1.711784, -4.452253, 0, 1, 0.01176471, 1,
-0.435361, 0.7517884, -1.053329, 0, 1, 0.01568628, 1,
-0.4317407, 0.7858549, -0.9964688, 0, 1, 0.02352941, 1,
-0.4288467, -1.263807, -1.78329, 0, 1, 0.02745098, 1,
-0.4208725, 0.6253562, -0.8495647, 0, 1, 0.03529412, 1,
-0.4200004, -0.2765247, -0.8792273, 0, 1, 0.03921569, 1,
-0.4172494, 1.486036, 1.151845, 0, 1, 0.04705882, 1,
-0.4166776, 0.3906351, -1.678043, 0, 1, 0.05098039, 1,
-0.4162456, -1.301796, -3.254185, 0, 1, 0.05882353, 1,
-0.4162404, 1.278806, 2.286824, 0, 1, 0.0627451, 1,
-0.4160191, 1.416182, -0.5221087, 0, 1, 0.07058824, 1,
-0.4107973, -0.7929122, -2.697332, 0, 1, 0.07450981, 1,
-0.4083345, 0.09568284, -1.693058, 0, 1, 0.08235294, 1,
-0.406672, 0.2578117, -1.077545, 0, 1, 0.08627451, 1,
-0.4059608, 0.7504436, -2.083127, 0, 1, 0.09411765, 1,
-0.4050448, -1.592902, -2.200027, 0, 1, 0.1019608, 1,
-0.404496, -0.782921, -5.35496, 0, 1, 0.1058824, 1,
-0.4039785, -0.57573, -2.438062, 0, 1, 0.1137255, 1,
-0.4007186, -0.6877946, -2.840544, 0, 1, 0.1176471, 1,
-0.3959447, 0.02805231, -0.941036, 0, 1, 0.1254902, 1,
-0.3899282, 1.361628, 1.102115, 0, 1, 0.1294118, 1,
-0.3845769, 1.152643, 0.1838106, 0, 1, 0.1372549, 1,
-0.3837025, -0.2126587, -0.8928741, 0, 1, 0.1411765, 1,
-0.3836441, 0.7331299, -1.359724, 0, 1, 0.1490196, 1,
-0.3824862, -0.7071454, -3.2919, 0, 1, 0.1529412, 1,
-0.3750024, -0.6484839, -3.456475, 0, 1, 0.1607843, 1,
-0.3711909, 0.5242885, -2.349934, 0, 1, 0.1647059, 1,
-0.3710521, 0.4681263, -3.032666, 0, 1, 0.172549, 1,
-0.3658762, -0.005841572, -0.9284356, 0, 1, 0.1764706, 1,
-0.3636861, 1.161141, -1.43436, 0, 1, 0.1843137, 1,
-0.3618437, 0.1048258, -2.257525, 0, 1, 0.1882353, 1,
-0.3600274, -0.786403, -1.146184, 0, 1, 0.1960784, 1,
-0.35957, -0.8964338, -2.050988, 0, 1, 0.2039216, 1,
-0.3586332, -0.2773901, -1.526862, 0, 1, 0.2078431, 1,
-0.3584192, 1.61528, -1.512923, 0, 1, 0.2156863, 1,
-0.3559018, -0.1365457, -3.148088, 0, 1, 0.2196078, 1,
-0.3458189, 0.2514269, -0.05513359, 0, 1, 0.227451, 1,
-0.3419867, 1.118176, 0.2638111, 0, 1, 0.2313726, 1,
-0.3385036, -1.080969, -4.509399, 0, 1, 0.2392157, 1,
-0.3333862, -0.4841737, -1.026543, 0, 1, 0.2431373, 1,
-0.3327943, -1.161025, -1.684399, 0, 1, 0.2509804, 1,
-0.3320132, -0.9713116, -1.885491, 0, 1, 0.254902, 1,
-0.3316911, -2.292901, -2.054725, 0, 1, 0.2627451, 1,
-0.3247499, 0.5605169, -1.174103, 0, 1, 0.2666667, 1,
-0.3235427, -2.064809, -5.687276, 0, 1, 0.2745098, 1,
-0.3179592, 0.3163377, -1.703582, 0, 1, 0.2784314, 1,
-0.3176602, -0.2224089, -1.021291, 0, 1, 0.2862745, 1,
-0.3156192, 0.04703142, -1.212915, 0, 1, 0.2901961, 1,
-0.3136038, 0.7926863, 0.1494032, 0, 1, 0.2980392, 1,
-0.312316, 1.060788, -0.4002705, 0, 1, 0.3058824, 1,
-0.3116152, 0.8348424, 1.276601, 0, 1, 0.3098039, 1,
-0.3089841, -1.08869, -1.696344, 0, 1, 0.3176471, 1,
-0.3041089, -1.167972, -2.604167, 0, 1, 0.3215686, 1,
-0.3020463, 1.566218, -0.2615778, 0, 1, 0.3294118, 1,
-0.299161, -1.611078, -3.906225, 0, 1, 0.3333333, 1,
-0.2975898, -1.137515, -3.309124, 0, 1, 0.3411765, 1,
-0.2956952, 0.9013866, -0.4616392, 0, 1, 0.345098, 1,
-0.292667, 0.3788502, -1.435487, 0, 1, 0.3529412, 1,
-0.292654, -0.2413741, -2.161964, 0, 1, 0.3568628, 1,
-0.2899005, 0.1260039, -2.318144, 0, 1, 0.3647059, 1,
-0.2868255, -1.236179, -1.937351, 0, 1, 0.3686275, 1,
-0.2819823, -0.8622385, -2.546218, 0, 1, 0.3764706, 1,
-0.2802837, 0.8255872, -0.4920453, 0, 1, 0.3803922, 1,
-0.2776396, -0.9721897, -2.967952, 0, 1, 0.3882353, 1,
-0.2731403, -0.8522229, -2.972275, 0, 1, 0.3921569, 1,
-0.2727694, 0.7921229, -0.1975285, 0, 1, 0.4, 1,
-0.2662229, 0.3528171, -2.932197, 0, 1, 0.4078431, 1,
-0.2644482, -0.163712, -3.119922, 0, 1, 0.4117647, 1,
-0.2639946, 1.57422, 0.8176906, 0, 1, 0.4196078, 1,
-0.2587741, 1.412189, -1.737776, 0, 1, 0.4235294, 1,
-0.2583116, 0.5789295, -1.604475, 0, 1, 0.4313726, 1,
-0.2554295, 0.3463142, -2.51875, 0, 1, 0.4352941, 1,
-0.2541232, 0.5358015, -2.446719, 0, 1, 0.4431373, 1,
-0.2509307, 1.743105, 0.9041764, 0, 1, 0.4470588, 1,
-0.2457315, 0.05956561, -2.459848, 0, 1, 0.454902, 1,
-0.2449988, 0.7519843, 0.1553939, 0, 1, 0.4588235, 1,
-0.2443399, 1.082377, 0.9547753, 0, 1, 0.4666667, 1,
-0.2412706, 0.1951028, -2.868775, 0, 1, 0.4705882, 1,
-0.2406511, 0.6427079, -2.088926, 0, 1, 0.4784314, 1,
-0.2404448, 0.9484895, 1.999833, 0, 1, 0.4823529, 1,
-0.2399438, 0.7252952, -0.5077839, 0, 1, 0.4901961, 1,
-0.2357737, -0.8806128, -4.148954, 0, 1, 0.4941176, 1,
-0.233237, -0.8486251, -2.907365, 0, 1, 0.5019608, 1,
-0.2317184, 0.5457756, -0.667119, 0, 1, 0.509804, 1,
-0.231705, -0.008157405, -2.29355, 0, 1, 0.5137255, 1,
-0.2255834, 0.1983194, -1.674864, 0, 1, 0.5215687, 1,
-0.2250416, 0.5037981, -0.5765662, 0, 1, 0.5254902, 1,
-0.2236647, 1.222188, -2.814686, 0, 1, 0.5333334, 1,
-0.2211799, -0.3052705, -1.433387, 0, 1, 0.5372549, 1,
-0.2194314, -0.1199392, -2.943882, 0, 1, 0.5450981, 1,
-0.2097013, -2.603804, -3.023394, 0, 1, 0.5490196, 1,
-0.2070912, 0.1783631, -1.915189, 0, 1, 0.5568628, 1,
-0.2062168, -1.259748, -1.328119, 0, 1, 0.5607843, 1,
-0.2045731, -0.5561419, -3.760986, 0, 1, 0.5686275, 1,
-0.204281, -1.822153, -2.844018, 0, 1, 0.572549, 1,
-0.2028639, 2.128141, 0.6020291, 0, 1, 0.5803922, 1,
-0.202438, 0.1831082, -1.294383, 0, 1, 0.5843138, 1,
-0.1967597, 1.057083, 0.7595251, 0, 1, 0.5921569, 1,
-0.1961179, -1.01109, -4.053044, 0, 1, 0.5960785, 1,
-0.1946252, -0.4466796, -1.897217, 0, 1, 0.6039216, 1,
-0.1933466, -0.0289844, -1.178378, 0, 1, 0.6117647, 1,
-0.1921673, -1.828268, -2.769765, 0, 1, 0.6156863, 1,
-0.1895094, 0.4237588, -0.277251, 0, 1, 0.6235294, 1,
-0.1841079, 0.4262561, -1.818006, 0, 1, 0.627451, 1,
-0.1823938, 1.282699, 0.1635547, 0, 1, 0.6352941, 1,
-0.1821322, -0.1871668, -0.01020174, 0, 1, 0.6392157, 1,
-0.1799214, -0.3902961, -3.623559, 0, 1, 0.6470588, 1,
-0.1798714, 1.845104, -1.313876, 0, 1, 0.6509804, 1,
-0.1788054, -0.631484, -1.722472, 0, 1, 0.6588235, 1,
-0.1782931, 0.2140399, -0.875755, 0, 1, 0.6627451, 1,
-0.1766199, 0.2220162, -0.3455586, 0, 1, 0.6705883, 1,
-0.1759351, 1.990808, 0.1531962, 0, 1, 0.6745098, 1,
-0.1748575, -0.5867285, -4.917253, 0, 1, 0.682353, 1,
-0.1732448, 1.163209, 0.1669013, 0, 1, 0.6862745, 1,
-0.1716128, 0.6820719, -0.3294187, 0, 1, 0.6941177, 1,
-0.1687143, 2.567507, 0.9584706, 0, 1, 0.7019608, 1,
-0.1637319, 0.3081556, -2.357718, 0, 1, 0.7058824, 1,
-0.16031, -0.06290038, -2.07244, 0, 1, 0.7137255, 1,
-0.160125, -0.1688098, -2.035441, 0, 1, 0.7176471, 1,
-0.1544775, -0.6017624, -3.720815, 0, 1, 0.7254902, 1,
-0.1499652, -0.8918403, -2.960139, 0, 1, 0.7294118, 1,
-0.1415611, 1.125979, 1.539848, 0, 1, 0.7372549, 1,
-0.1396651, 1.462108, -0.4711989, 0, 1, 0.7411765, 1,
-0.1375384, -1.115847, -2.104609, 0, 1, 0.7490196, 1,
-0.1360606, 1.283435, -0.6876927, 0, 1, 0.7529412, 1,
-0.1346458, -0.8279614, -2.439929, 0, 1, 0.7607843, 1,
-0.1339313, 2.262346, -0.5433626, 0, 1, 0.7647059, 1,
-0.1300277, 1.908062, -1.573671, 0, 1, 0.772549, 1,
-0.128986, -1.947423, -3.108248, 0, 1, 0.7764706, 1,
-0.1262612, -1.277995, -3.71297, 0, 1, 0.7843137, 1,
-0.1261782, 0.3860453, -0.2339518, 0, 1, 0.7882353, 1,
-0.1251028, 0.070572, -0.9423147, 0, 1, 0.7960784, 1,
-0.1245561, -0.5864807, -4.093722, 0, 1, 0.8039216, 1,
-0.1207815, -1.297287, -3.329175, 0, 1, 0.8078431, 1,
-0.1199722, 0.5371175, 0.1013032, 0, 1, 0.8156863, 1,
-0.1196302, -0.2611782, -3.503138, 0, 1, 0.8196079, 1,
-0.117188, -0.2309423, -3.754587, 0, 1, 0.827451, 1,
-0.1143148, 0.4268967, 1.503118, 0, 1, 0.8313726, 1,
-0.1120175, -1.353853, -2.908497, 0, 1, 0.8392157, 1,
-0.1091634, 0.1720811, -2.397737, 0, 1, 0.8431373, 1,
-0.1047499, -1.103243, -3.527153, 0, 1, 0.8509804, 1,
-0.1035987, 0.6318035, 0.8841739, 0, 1, 0.854902, 1,
-0.1004815, 2.379325, -0.5576262, 0, 1, 0.8627451, 1,
-0.0966784, 1.395423, -0.489877, 0, 1, 0.8666667, 1,
-0.09505407, -1.552419, -3.093179, 0, 1, 0.8745098, 1,
-0.08951548, -0.4887047, -4.140668, 0, 1, 0.8784314, 1,
-0.0849907, 1.189499, 0.5529647, 0, 1, 0.8862745, 1,
-0.08361035, 1.062024, 1.369907, 0, 1, 0.8901961, 1,
-0.08304211, -0.8036522, -3.283929, 0, 1, 0.8980392, 1,
-0.07828312, -0.07025659, -1.408251, 0, 1, 0.9058824, 1,
-0.07774939, -0.2849997, -3.142072, 0, 1, 0.9098039, 1,
-0.07499266, -0.2968826, -1.70378, 0, 1, 0.9176471, 1,
-0.07302146, 1.093423, -1.474633, 0, 1, 0.9215686, 1,
-0.07172438, -0.1522054, -2.616314, 0, 1, 0.9294118, 1,
-0.07154927, -0.9232832, -2.536061, 0, 1, 0.9333333, 1,
-0.06892263, 0.5723637, 2.395761, 0, 1, 0.9411765, 1,
-0.06857923, -0.8048464, -2.047538, 0, 1, 0.945098, 1,
-0.06851133, 0.1235331, -1.266837, 0, 1, 0.9529412, 1,
-0.0616501, -0.4766825, -2.425218, 0, 1, 0.9568627, 1,
-0.04358242, -0.1440356, -4.706156, 0, 1, 0.9647059, 1,
-0.04222393, -0.128075, -4.416548, 0, 1, 0.9686275, 1,
-0.04189643, -0.02932398, -3.084095, 0, 1, 0.9764706, 1,
-0.04145077, 1.627498, 1.275189, 0, 1, 0.9803922, 1,
-0.03750728, -0.5243805, -3.949895, 0, 1, 0.9882353, 1,
-0.03442248, 1.035991, 0.6354999, 0, 1, 0.9921569, 1,
-0.03325975, -0.4229254, -3.852172, 0, 1, 1, 1,
-0.03288194, -0.6030689, -1.857223, 0, 0.9921569, 1, 1,
-0.02784034, 0.2719831, 0.4935627, 0, 0.9882353, 1, 1,
-0.02588316, 0.8434753, -0.4316768, 0, 0.9803922, 1, 1,
-0.02312159, -0.4509768, -2.619208, 0, 0.9764706, 1, 1,
-0.01640218, 1.896231, 0.5088706, 0, 0.9686275, 1, 1,
-0.01537387, 0.286, -0.7182119, 0, 0.9647059, 1, 1,
-0.01430925, -0.1910449, -2.677635, 0, 0.9568627, 1, 1,
-0.01134525, -0.3842735, -2.489804, 0, 0.9529412, 1, 1,
-0.009954834, -0.2834089, -2.378592, 0, 0.945098, 1, 1,
-0.009944326, 0.01257881, -1.31419, 0, 0.9411765, 1, 1,
-0.009068602, 0.8466201, -0.6896294, 0, 0.9333333, 1, 1,
-0.004733746, -0.4212456, -4.188999, 0, 0.9294118, 1, 1,
-0.002359038, 0.01807201, -0.8616402, 0, 0.9215686, 1, 1,
-0.0007538004, -1.074312, -5.814884, 0, 0.9176471, 1, 1,
0.000422818, -0.01899691, 2.852278, 0, 0.9098039, 1, 1,
0.008718321, -0.3538003, 4.033355, 0, 0.9058824, 1, 1,
0.01159695, -0.642745, 2.971147, 0, 0.8980392, 1, 1,
0.01185272, -1.054158, 3.498854, 0, 0.8901961, 1, 1,
0.0123389, 2.07765, 1.725118, 0, 0.8862745, 1, 1,
0.01262997, 1.377382, -0.4952643, 0, 0.8784314, 1, 1,
0.01387888, -0.938908, 3.758796, 0, 0.8745098, 1, 1,
0.01906615, -1.386727, 3.959917, 0, 0.8666667, 1, 1,
0.0202971, 0.1185411, 0.9357801, 0, 0.8627451, 1, 1,
0.02281981, 0.06257526, 2.171867, 0, 0.854902, 1, 1,
0.02409752, 0.3825401, -0.2868272, 0, 0.8509804, 1, 1,
0.02643583, 1.490648, 0.3176247, 0, 0.8431373, 1, 1,
0.0271278, 0.6493231, 1.316465, 0, 0.8392157, 1, 1,
0.02746643, 0.1799115, 1.190586, 0, 0.8313726, 1, 1,
0.0320069, 0.2228972, 1.010074, 0, 0.827451, 1, 1,
0.04031442, 0.632757, -0.146244, 0, 0.8196079, 1, 1,
0.04863789, -0.5231817, 3.167722, 0, 0.8156863, 1, 1,
0.05461585, 1.031338, 2.862021, 0, 0.8078431, 1, 1,
0.06544155, -0.9824921, 2.434778, 0, 0.8039216, 1, 1,
0.0666798, -0.2761925, 3.82667, 0, 0.7960784, 1, 1,
0.0669281, -2.233123, 3.350917, 0, 0.7882353, 1, 1,
0.06708848, -0.2674773, 2.586689, 0, 0.7843137, 1, 1,
0.06723998, 1.309309, 0.626866, 0, 0.7764706, 1, 1,
0.0675886, -0.03718773, 0.380835, 0, 0.772549, 1, 1,
0.07249436, -1.33769, 0.2377666, 0, 0.7647059, 1, 1,
0.07305852, 0.9590435, 0.8430922, 0, 0.7607843, 1, 1,
0.0744509, 0.05974488, 0.01639159, 0, 0.7529412, 1, 1,
0.07619508, -0.6166208, 2.882843, 0, 0.7490196, 1, 1,
0.07774077, 0.3622103, -0.04809667, 0, 0.7411765, 1, 1,
0.07911197, -0.2950929, 1.376621, 0, 0.7372549, 1, 1,
0.07984473, -1.410899, 4.116568, 0, 0.7294118, 1, 1,
0.0836352, 0.7502567, -1.654722, 0, 0.7254902, 1, 1,
0.09384967, 0.250514, -1.634492, 0, 0.7176471, 1, 1,
0.09490096, 0.9318955, -0.2935793, 0, 0.7137255, 1, 1,
0.09853466, -0.08515876, 3.45806, 0, 0.7058824, 1, 1,
0.1038402, 1.186695, -0.8864293, 0, 0.6980392, 1, 1,
0.1079145, 0.1413142, -0.48657, 0, 0.6941177, 1, 1,
0.1080746, 1.126734, -0.6164721, 0, 0.6862745, 1, 1,
0.1100719, 0.07485797, 1.439475, 0, 0.682353, 1, 1,
0.1142341, -0.7120389, 2.853035, 0, 0.6745098, 1, 1,
0.1155374, 2.133521, 1.177991, 0, 0.6705883, 1, 1,
0.1237786, -0.05955351, 1.083553, 0, 0.6627451, 1, 1,
0.1246646, 0.8437965, 1.161162, 0, 0.6588235, 1, 1,
0.1302391, 0.3150047, 0.7245144, 0, 0.6509804, 1, 1,
0.130385, -0.4382162, 3.713474, 0, 0.6470588, 1, 1,
0.1313737, 0.0558575, 2.183775, 0, 0.6392157, 1, 1,
0.1319037, 1.349939, -0.5943797, 0, 0.6352941, 1, 1,
0.1319746, -1.36366, 4.146205, 0, 0.627451, 1, 1,
0.1374487, 0.442639, 0.7604976, 0, 0.6235294, 1, 1,
0.1384813, -0.1586058, 3.988109, 0, 0.6156863, 1, 1,
0.143948, -0.7473147, 1.576837, 0, 0.6117647, 1, 1,
0.1439639, 0.1877902, 0.7500033, 0, 0.6039216, 1, 1,
0.1462067, -1.006044, 4.172193, 0, 0.5960785, 1, 1,
0.1503741, 1.452533, -0.1243138, 0, 0.5921569, 1, 1,
0.1521628, -0.1762411, 3.499233, 0, 0.5843138, 1, 1,
0.1571849, 0.3759563, 0.9826813, 0, 0.5803922, 1, 1,
0.1592093, 0.6781242, -0.003524693, 0, 0.572549, 1, 1,
0.1632809, 0.617898, 1.238232, 0, 0.5686275, 1, 1,
0.1671725, -0.8152335, 3.305311, 0, 0.5607843, 1, 1,
0.1692833, 0.4141603, 1.077593, 0, 0.5568628, 1, 1,
0.1703696, -0.8134085, 2.46857, 0, 0.5490196, 1, 1,
0.1722986, 0.8094583, 1.160743, 0, 0.5450981, 1, 1,
0.1749486, 0.05949446, 1.772331, 0, 0.5372549, 1, 1,
0.1840826, 0.06170943, 1.883399, 0, 0.5333334, 1, 1,
0.1847924, 0.2175367, 1.430075, 0, 0.5254902, 1, 1,
0.1874058, -0.9671518, 2.825223, 0, 0.5215687, 1, 1,
0.1941437, 0.9190189, 0.6234366, 0, 0.5137255, 1, 1,
0.1956213, 0.3558498, -0.7659805, 0, 0.509804, 1, 1,
0.1982682, 0.5553451, 1.767586, 0, 0.5019608, 1, 1,
0.1991778, 0.2200848, 1.361908, 0, 0.4941176, 1, 1,
0.2032425, -0.8287682, 3.166139, 0, 0.4901961, 1, 1,
0.207219, -0.03659084, 2.02196, 0, 0.4823529, 1, 1,
0.2118786, 1.442501, 0.3393284, 0, 0.4784314, 1, 1,
0.2152076, -1.043764, 3.369105, 0, 0.4705882, 1, 1,
0.2153559, 0.5675207, -1.077383, 0, 0.4666667, 1, 1,
0.216627, 1.280703, -0.1153171, 0, 0.4588235, 1, 1,
0.2167605, -1.624766, 4.716143, 0, 0.454902, 1, 1,
0.2303238, 0.8394125, 1.866196, 0, 0.4470588, 1, 1,
0.2303335, 1.313889, 0.6768551, 0, 0.4431373, 1, 1,
0.2347349, 0.156582, 1.84137, 0, 0.4352941, 1, 1,
0.2363679, 0.110796, 1.858298, 0, 0.4313726, 1, 1,
0.2387137, 0.9730114, 0.1853521, 0, 0.4235294, 1, 1,
0.2391711, 0.5931309, 0.9993944, 0, 0.4196078, 1, 1,
0.2416878, -0.7931296, 2.58329, 0, 0.4117647, 1, 1,
0.242382, -0.2214244, -0.01886686, 0, 0.4078431, 1, 1,
0.246779, -0.2035821, 1.681767, 0, 0.4, 1, 1,
0.2514106, -1.004214, 3.837885, 0, 0.3921569, 1, 1,
0.2518442, -1.507064, 4.498473, 0, 0.3882353, 1, 1,
0.2537667, -0.3554356, 1.624983, 0, 0.3803922, 1, 1,
0.2551663, -0.1563614, 1.218775, 0, 0.3764706, 1, 1,
0.2556203, 0.08161768, 2.068778, 0, 0.3686275, 1, 1,
0.2603837, 0.5796311, 0.204786, 0, 0.3647059, 1, 1,
0.2618986, -0.09292448, 2.023706, 0, 0.3568628, 1, 1,
0.263309, -0.04988449, 1.408622, 0, 0.3529412, 1, 1,
0.2636164, -0.6099909, 3.607111, 0, 0.345098, 1, 1,
0.2642286, 0.382586, 0.9700937, 0, 0.3411765, 1, 1,
0.264536, 0.5177706, 1.296497, 0, 0.3333333, 1, 1,
0.2656627, 0.5003468, 0.9141618, 0, 0.3294118, 1, 1,
0.2666685, -0.4857495, 2.551769, 0, 0.3215686, 1, 1,
0.2674894, 1.293491, 1.628021, 0, 0.3176471, 1, 1,
0.2782785, 0.7781534, 0.08279617, 0, 0.3098039, 1, 1,
0.2804799, 0.7257369, -0.0722966, 0, 0.3058824, 1, 1,
0.2806739, 0.6184847, -0.4886638, 0, 0.2980392, 1, 1,
0.2806978, 1.130319, 0.6845405, 0, 0.2901961, 1, 1,
0.2834097, 1.798571, 0.1407702, 0, 0.2862745, 1, 1,
0.295951, 0.2982639, 1.484879, 0, 0.2784314, 1, 1,
0.298561, 1.290913, -0.9352783, 0, 0.2745098, 1, 1,
0.303489, 1.610797, 0.5752503, 0, 0.2666667, 1, 1,
0.3115741, -0.4180907, 0.8593538, 0, 0.2627451, 1, 1,
0.3122874, 0.0970454, 1.014983, 0, 0.254902, 1, 1,
0.3141365, -0.6191237, 4.435429, 0, 0.2509804, 1, 1,
0.3173225, 0.1180527, 1.932651, 0, 0.2431373, 1, 1,
0.3187824, -1.895691, 0.7445694, 0, 0.2392157, 1, 1,
0.3217658, -0.2904742, 0.4455082, 0, 0.2313726, 1, 1,
0.323116, -0.2228958, 4.064045, 0, 0.227451, 1, 1,
0.3254831, -0.2961928, 2.918329, 0, 0.2196078, 1, 1,
0.3276366, 0.2282525, 1.260905, 0, 0.2156863, 1, 1,
0.3288667, -0.8349455, 2.548218, 0, 0.2078431, 1, 1,
0.3290456, 0.3941189, -0.1129249, 0, 0.2039216, 1, 1,
0.331986, 1.722295, 0.3337806, 0, 0.1960784, 1, 1,
0.3341902, 1.176369, 1.373153, 0, 0.1882353, 1, 1,
0.3359492, -1.835144, 3.080216, 0, 0.1843137, 1, 1,
0.3363515, -1.806231, 3.69116, 0, 0.1764706, 1, 1,
0.3406328, -0.2962589, 3.386602, 0, 0.172549, 1, 1,
0.342187, -0.747588, 2.414907, 0, 0.1647059, 1, 1,
0.3427056, 1.986577, 0.4340588, 0, 0.1607843, 1, 1,
0.3493324, -0.8526294, 2.981063, 0, 0.1529412, 1, 1,
0.3516441, -0.5803552, 2.535559, 0, 0.1490196, 1, 1,
0.3520854, -1.033232, 2.662606, 0, 0.1411765, 1, 1,
0.3526985, -0.1185613, 1.082351, 0, 0.1372549, 1, 1,
0.3611831, 0.3541722, 0.7224604, 0, 0.1294118, 1, 1,
0.3618301, 1.212714, 1.255333, 0, 0.1254902, 1, 1,
0.3618644, -1.326773, 3.515697, 0, 0.1176471, 1, 1,
0.3620903, -0.03078603, 1.035429, 0, 0.1137255, 1, 1,
0.3621658, 0.006123985, 3.526892, 0, 0.1058824, 1, 1,
0.3623979, -0.06334547, 2.617746, 0, 0.09803922, 1, 1,
0.36373, -0.743293, 2.116343, 0, 0.09411765, 1, 1,
0.3637814, -0.3710527, 2.892937, 0, 0.08627451, 1, 1,
0.365177, -1.282534, 2.568434, 0, 0.08235294, 1, 1,
0.3661522, -0.4730647, 2.936441, 0, 0.07450981, 1, 1,
0.3674303, -0.006486774, 1.826307, 0, 0.07058824, 1, 1,
0.3686168, 2.142878, 0.6348209, 0, 0.0627451, 1, 1,
0.3709455, -0.5057472, 1.253121, 0, 0.05882353, 1, 1,
0.3760253, -1.760962, 1.994565, 0, 0.05098039, 1, 1,
0.3762464, -1.168533, 1.06475, 0, 0.04705882, 1, 1,
0.3802881, -1.464335, 2.978218, 0, 0.03921569, 1, 1,
0.3872931, 1.285186, 0.3497805, 0, 0.03529412, 1, 1,
0.3896938, 0.3360408, 0.0006624436, 0, 0.02745098, 1, 1,
0.3899128, 0.1449168, 1.239672, 0, 0.02352941, 1, 1,
0.3952723, 0.0008108019, 1.482253, 0, 0.01568628, 1, 1,
0.3954201, -0.6076903, 2.752714, 0, 0.01176471, 1, 1,
0.3959206, 0.006434307, -1.540738, 0, 0.003921569, 1, 1,
0.3964046, -0.9627984, 1.657184, 0.003921569, 0, 1, 1,
0.4027275, 2.697697, -0.6476569, 0.007843138, 0, 1, 1,
0.4030964, 0.4801674, 1.484348, 0.01568628, 0, 1, 1,
0.4051555, -0.0005522754, -1.840404, 0.01960784, 0, 1, 1,
0.4051557, 0.5155318, 1.676377, 0.02745098, 0, 1, 1,
0.4073331, -1.202627, 2.736269, 0.03137255, 0, 1, 1,
0.4110524, -0.2125331, 1.74611, 0.03921569, 0, 1, 1,
0.4135644, 1.246704, -0.83393, 0.04313726, 0, 1, 1,
0.4274836, 0.09583837, 1.007647, 0.05098039, 0, 1, 1,
0.4303213, -0.5355676, 0.9399999, 0.05490196, 0, 1, 1,
0.4307168, 0.3734198, 1.257444, 0.0627451, 0, 1, 1,
0.4373461, -0.734585, 2.139236, 0.06666667, 0, 1, 1,
0.437539, -0.465883, 2.222616, 0.07450981, 0, 1, 1,
0.4376406, -0.6455209, 1.961075, 0.07843138, 0, 1, 1,
0.4386994, 1.26233, 0.3442583, 0.08627451, 0, 1, 1,
0.4406542, -1.005445, 2.446959, 0.09019608, 0, 1, 1,
0.4429771, -1.153532, 4.253152, 0.09803922, 0, 1, 1,
0.4451471, -0.7712017, 3.982375, 0.1058824, 0, 1, 1,
0.4497743, 0.5735551, -0.6241522, 0.1098039, 0, 1, 1,
0.4524372, -0.1242242, 1.468557, 0.1176471, 0, 1, 1,
0.4554903, -1.492388, 3.939916, 0.1215686, 0, 1, 1,
0.4604649, -0.9028399, 3.207428, 0.1294118, 0, 1, 1,
0.462478, -0.8594385, 3.490149, 0.1333333, 0, 1, 1,
0.4644897, -1.619477, 2.644656, 0.1411765, 0, 1, 1,
0.4650336, 1.028315, 1.090064, 0.145098, 0, 1, 1,
0.4669465, 0.4949458, 2.128084, 0.1529412, 0, 1, 1,
0.4700932, -1.611406, 3.063318, 0.1568628, 0, 1, 1,
0.4714281, -1.016096, 2.499591, 0.1647059, 0, 1, 1,
0.4774782, -1.091215, 3.471822, 0.1686275, 0, 1, 1,
0.4776424, -0.8452825, 3.298753, 0.1764706, 0, 1, 1,
0.4783807, 1.559933, 1.298075, 0.1803922, 0, 1, 1,
0.4787149, -0.9664307, 2.860631, 0.1882353, 0, 1, 1,
0.4823332, 0.1351388, -0.183597, 0.1921569, 0, 1, 1,
0.4880038, -0.2950329, 0.6573264, 0.2, 0, 1, 1,
0.4930012, 1.203137, 0.6836062, 0.2078431, 0, 1, 1,
0.4933335, -1.879383, 2.648948, 0.2117647, 0, 1, 1,
0.498626, -0.1328929, 2.664253, 0.2196078, 0, 1, 1,
0.5017174, -1.187279, 2.917855, 0.2235294, 0, 1, 1,
0.5086198, 0.6827008, 0.1333509, 0.2313726, 0, 1, 1,
0.5091609, -0.3600895, 0.03888585, 0.2352941, 0, 1, 1,
0.5130711, 1.444564, 0.808344, 0.2431373, 0, 1, 1,
0.5203521, -0.4024665, 3.784141, 0.2470588, 0, 1, 1,
0.5220267, 2.140935, 2.57284, 0.254902, 0, 1, 1,
0.5225292, 0.2397579, 0.3718452, 0.2588235, 0, 1, 1,
0.5226425, -0.6934938, 3.234994, 0.2666667, 0, 1, 1,
0.52957, -0.3710483, 1.643662, 0.2705882, 0, 1, 1,
0.5299702, -1.838185, 3.821171, 0.2784314, 0, 1, 1,
0.5305641, 0.4543256, 0.7747212, 0.282353, 0, 1, 1,
0.5401229, 1.109783, -0.8675226, 0.2901961, 0, 1, 1,
0.5403168, 0.8360266, -0.2499114, 0.2941177, 0, 1, 1,
0.5407398, -2.490257, 2.161172, 0.3019608, 0, 1, 1,
0.5417364, -0.6067716, 2.013532, 0.3098039, 0, 1, 1,
0.555303, -0.1383246, 1.154162, 0.3137255, 0, 1, 1,
0.5556597, -1.347327, 2.612114, 0.3215686, 0, 1, 1,
0.5558389, -1.385954, 3.752316, 0.3254902, 0, 1, 1,
0.5602447, 0.7570701, 1.760435, 0.3333333, 0, 1, 1,
0.5612094, -0.1393482, 2.348135, 0.3372549, 0, 1, 1,
0.5614941, 0.8734282, 0.6122621, 0.345098, 0, 1, 1,
0.5639687, -0.439387, 0.8931505, 0.3490196, 0, 1, 1,
0.565564, -0.9225667, 2.18829, 0.3568628, 0, 1, 1,
0.5680021, -2.278753, 3.575706, 0.3607843, 0, 1, 1,
0.5699058, -0.6204799, 3.448858, 0.3686275, 0, 1, 1,
0.5700447, -0.8175529, 1.890386, 0.372549, 0, 1, 1,
0.5752171, 1.397125, -0.3236258, 0.3803922, 0, 1, 1,
0.5794148, 0.9056958, 1.143408, 0.3843137, 0, 1, 1,
0.5805262, -0.2707889, 1.741755, 0.3921569, 0, 1, 1,
0.5835849, 0.526317, 0.6642045, 0.3960784, 0, 1, 1,
0.5884891, -0.9658531, 1.000979, 0.4039216, 0, 1, 1,
0.5925976, -1.279111, 2.836863, 0.4117647, 0, 1, 1,
0.59343, -0.2521803, 1.014365, 0.4156863, 0, 1, 1,
0.5990877, -0.2131006, 1.101046, 0.4235294, 0, 1, 1,
0.600233, -1.003155, 2.762621, 0.427451, 0, 1, 1,
0.6026729, 0.2148436, 2.107897, 0.4352941, 0, 1, 1,
0.6095978, 0.4953019, 1.766349, 0.4392157, 0, 1, 1,
0.6125528, 0.6509874, 0.8372492, 0.4470588, 0, 1, 1,
0.6138195, -1.35346, 2.93474, 0.4509804, 0, 1, 1,
0.6192376, -1.700669, 2.669768, 0.4588235, 0, 1, 1,
0.6195555, 0.5252337, 1.940958, 0.4627451, 0, 1, 1,
0.621704, 0.4440717, 1.535099, 0.4705882, 0, 1, 1,
0.6243199, 1.439811, -0.119964, 0.4745098, 0, 1, 1,
0.6265404, -0.9718025, 2.468772, 0.4823529, 0, 1, 1,
0.6295407, -0.3897234, 2.692686, 0.4862745, 0, 1, 1,
0.6307237, -0.374652, 1.553424, 0.4941176, 0, 1, 1,
0.6323193, -0.9451463, 3.914078, 0.5019608, 0, 1, 1,
0.6329039, -0.8818817, 1.110038, 0.5058824, 0, 1, 1,
0.6368914, 1.747193, 1.689248, 0.5137255, 0, 1, 1,
0.64572, 0.5211829, 0.1625623, 0.5176471, 0, 1, 1,
0.6458673, -0.0218055, 1.959109, 0.5254902, 0, 1, 1,
0.6480224, -1.132736, 3.548571, 0.5294118, 0, 1, 1,
0.6480563, -0.3360073, 2.348676, 0.5372549, 0, 1, 1,
0.6520638, -1.109118, 1.857689, 0.5411765, 0, 1, 1,
0.6538422, -1.490716, 2.587203, 0.5490196, 0, 1, 1,
0.6553124, 0.357848, 1.274875, 0.5529412, 0, 1, 1,
0.6640834, -0.5378729, 2.223995, 0.5607843, 0, 1, 1,
0.6670396, -0.9009359, 1.861967, 0.5647059, 0, 1, 1,
0.6741385, -1.485082, 3.659836, 0.572549, 0, 1, 1,
0.6794426, -0.3254406, 1.669388, 0.5764706, 0, 1, 1,
0.6805782, -0.03753446, 0.9719171, 0.5843138, 0, 1, 1,
0.6810033, -1.623036, 3.039021, 0.5882353, 0, 1, 1,
0.6824632, -0.3019511, 1.016505, 0.5960785, 0, 1, 1,
0.6834641, -0.3453513, 2.972103, 0.6039216, 0, 1, 1,
0.6843215, -0.3852667, 2.617297, 0.6078432, 0, 1, 1,
0.6868976, -0.08300649, 2.857126, 0.6156863, 0, 1, 1,
0.6912709, 0.7690604, 3.602836, 0.6196079, 0, 1, 1,
0.6927469, 0.5180188, 1.794713, 0.627451, 0, 1, 1,
0.6937603, -0.3935649, 3.46764, 0.6313726, 0, 1, 1,
0.6972238, 0.007993437, 1.217628, 0.6392157, 0, 1, 1,
0.7010884, 3.442449, -0.09815543, 0.6431373, 0, 1, 1,
0.7045724, -1.148517, 1.981957, 0.6509804, 0, 1, 1,
0.7086471, 0.8655687, 2.365598, 0.654902, 0, 1, 1,
0.7125201, 1.493961, 0.5789839, 0.6627451, 0, 1, 1,
0.7228477, 0.1709122, 1.643744, 0.6666667, 0, 1, 1,
0.7249392, 2.617714, 0.827875, 0.6745098, 0, 1, 1,
0.7305077, 0.2725922, 2.5343, 0.6784314, 0, 1, 1,
0.7308242, 0.02000923, 0.472244, 0.6862745, 0, 1, 1,
0.7453005, -0.1650549, 0.3218477, 0.6901961, 0, 1, 1,
0.7496212, -0.7838837, 1.514187, 0.6980392, 0, 1, 1,
0.750561, -1.127098, 2.904519, 0.7058824, 0, 1, 1,
0.7545072, -0.4248949, 1.086906, 0.7098039, 0, 1, 1,
0.7549172, -0.6207662, 1.416484, 0.7176471, 0, 1, 1,
0.7608092, -0.3597448, 0.8739884, 0.7215686, 0, 1, 1,
0.762917, -0.1309209, 1.784136, 0.7294118, 0, 1, 1,
0.7724296, 0.8924813, 1.247858, 0.7333333, 0, 1, 1,
0.7738919, 0.556299, -0.7825839, 0.7411765, 0, 1, 1,
0.7885305, 0.2993652, 1.203898, 0.7450981, 0, 1, 1,
0.7904783, -1.009128, 1.965091, 0.7529412, 0, 1, 1,
0.7916451, 0.219752, 1.874157, 0.7568628, 0, 1, 1,
0.7936639, 1.350267, 0.09521269, 0.7647059, 0, 1, 1,
0.7973104, -0.3770885, 2.208709, 0.7686275, 0, 1, 1,
0.8077606, 0.6421667, 1.320716, 0.7764706, 0, 1, 1,
0.8088427, 1.348269, 0.4792738, 0.7803922, 0, 1, 1,
0.8102907, -0.7466219, 3.347955, 0.7882353, 0, 1, 1,
0.8168523, -0.3032259, 1.942363, 0.7921569, 0, 1, 1,
0.8211519, -0.5644594, 0.8928033, 0.8, 0, 1, 1,
0.8244871, -0.3116555, 2.721659, 0.8078431, 0, 1, 1,
0.830353, -2.346405, 5.320131, 0.8117647, 0, 1, 1,
0.8332534, -0.1792807, 1.097723, 0.8196079, 0, 1, 1,
0.8382386, 0.0673527, 3.286738, 0.8235294, 0, 1, 1,
0.8397335, -0.9519988, -0.1709623, 0.8313726, 0, 1, 1,
0.840084, -0.856258, 1.282166, 0.8352941, 0, 1, 1,
0.8437148, -0.2145254, 0.9907318, 0.8431373, 0, 1, 1,
0.8469152, 0.4110333, 1.420859, 0.8470588, 0, 1, 1,
0.848832, 2.023789, 0.3826345, 0.854902, 0, 1, 1,
0.8491394, -0.3363011, 2.001205, 0.8588235, 0, 1, 1,
0.8525347, 0.653026, 1.632547, 0.8666667, 0, 1, 1,
0.8532006, -0.8989819, 1.315911, 0.8705882, 0, 1, 1,
0.8542863, 1.750306, -0.4041976, 0.8784314, 0, 1, 1,
0.8561143, -0.8128241, 2.333829, 0.8823529, 0, 1, 1,
0.8563188, 2.376507, -0.7898179, 0.8901961, 0, 1, 1,
0.8571978, 1.76892, 1.444395, 0.8941177, 0, 1, 1,
0.860745, -0.02555521, 1.096076, 0.9019608, 0, 1, 1,
0.8638614, -0.5332466, 3.454048, 0.9098039, 0, 1, 1,
0.8702688, -0.3832198, 1.712012, 0.9137255, 0, 1, 1,
0.8722691, -0.7589176, 3.369567, 0.9215686, 0, 1, 1,
0.8734563, 1.165171, 1.98706, 0.9254902, 0, 1, 1,
0.8741875, 0.7705116, -0.5487033, 0.9333333, 0, 1, 1,
0.8742321, -0.6961071, 3.04021, 0.9372549, 0, 1, 1,
0.875823, -1.701285, 3.199232, 0.945098, 0, 1, 1,
0.8809885, -1.797897, 4.141847, 0.9490196, 0, 1, 1,
0.8880566, -1.006705, 0.8118446, 0.9568627, 0, 1, 1,
0.8903556, 0.1020402, 2.979993, 0.9607843, 0, 1, 1,
0.8968614, -0.3605665, 2.064453, 0.9686275, 0, 1, 1,
0.9035331, -0.2772525, 1.163507, 0.972549, 0, 1, 1,
0.911483, -0.04082122, 1.176123, 0.9803922, 0, 1, 1,
0.9122204, 0.6865239, 1.378323, 0.9843137, 0, 1, 1,
0.9124917, 0.1224065, 0.347626, 0.9921569, 0, 1, 1,
0.9131742, 0.6118955, 0.6729466, 0.9960784, 0, 1, 1,
0.9150935, 1.524282, 1.807002, 1, 0, 0.9960784, 1,
0.916221, 1.237193, 1.195402, 1, 0, 0.9882353, 1,
0.9210543, 0.1308907, 0.5675411, 1, 0, 0.9843137, 1,
0.9264486, 0.02216475, 3.210822, 1, 0, 0.9764706, 1,
0.9430847, 1.861806, -0.3064615, 1, 0, 0.972549, 1,
0.9444405, 2.234287, 0.7103456, 1, 0, 0.9647059, 1,
0.9529192, -1.58837, 2.243679, 1, 0, 0.9607843, 1,
0.9550333, 0.1348106, 1.732152, 1, 0, 0.9529412, 1,
0.9648916, -2.007476, 2.035963, 1, 0, 0.9490196, 1,
0.9653962, -2.67258, 3.659237, 1, 0, 0.9411765, 1,
0.968905, 0.2445183, 1.377736, 1, 0, 0.9372549, 1,
0.9711425, 0.06887379, 1.531105, 1, 0, 0.9294118, 1,
0.9713005, -0.2538365, 4.992039, 1, 0, 0.9254902, 1,
0.9739988, 0.8435164, 1.015331, 1, 0, 0.9176471, 1,
0.9764449, 0.2893968, 1.122453, 1, 0, 0.9137255, 1,
0.9790801, -1.416588, 3.824211, 1, 0, 0.9058824, 1,
0.9796036, 0.07523057, -0.5286858, 1, 0, 0.9019608, 1,
0.9799687, -0.7609809, 1.640383, 1, 0, 0.8941177, 1,
0.9879887, 0.4429095, 0.48621, 1, 0, 0.8862745, 1,
0.991751, 1.145123, 2.250471, 1, 0, 0.8823529, 1,
0.9925923, -0.3305608, 1.427278, 1, 0, 0.8745098, 1,
0.9938838, 1.434209, 1.116064, 1, 0, 0.8705882, 1,
0.9967449, 0.3831766, 0.709864, 1, 0, 0.8627451, 1,
1.018874, 1.432448, 1.419031, 1, 0, 0.8588235, 1,
1.02536, -0.4264202, 1.577193, 1, 0, 0.8509804, 1,
1.034194, -1.319193, 1.489031, 1, 0, 0.8470588, 1,
1.035861, -0.6795578, 2.591794, 1, 0, 0.8392157, 1,
1.044661, 0.7704443, 1.236557, 1, 0, 0.8352941, 1,
1.04989, -0.3188759, 2.015402, 1, 0, 0.827451, 1,
1.050793, -0.6960128, 1.366812, 1, 0, 0.8235294, 1,
1.052425, -0.7958734, 3.051287, 1, 0, 0.8156863, 1,
1.053153, 1.420128, 2.035393, 1, 0, 0.8117647, 1,
1.055606, -1.047402, 2.371549, 1, 0, 0.8039216, 1,
1.058361, 0.9345901, -0.1471118, 1, 0, 0.7960784, 1,
1.060423, 1.991848, 0.5527216, 1, 0, 0.7921569, 1,
1.060815, 0.2588637, 2.234834, 1, 0, 0.7843137, 1,
1.067809, 0.1531259, 1.731755, 1, 0, 0.7803922, 1,
1.076313, 0.9153551, 0.8461717, 1, 0, 0.772549, 1,
1.077805, -1.380311, 1.85421, 1, 0, 0.7686275, 1,
1.078327, 1.864541, 2.148874, 1, 0, 0.7607843, 1,
1.092025, -0.7505504, 2.330755, 1, 0, 0.7568628, 1,
1.105148, -0.1040119, 2.513547, 1, 0, 0.7490196, 1,
1.108845, -0.05093712, 2.690856, 1, 0, 0.7450981, 1,
1.117361, 1.203117, 1.629147, 1, 0, 0.7372549, 1,
1.119369, 0.9753247, 0.8007209, 1, 0, 0.7333333, 1,
1.129107, -1.127711, 2.037039, 1, 0, 0.7254902, 1,
1.131951, 0.199949, 2.086421, 1, 0, 0.7215686, 1,
1.136467, 1.048886, 1.185805, 1, 0, 0.7137255, 1,
1.140418, -0.8328167, 1.768123, 1, 0, 0.7098039, 1,
1.14556, 0.9573585, 2.408889, 1, 0, 0.7019608, 1,
1.152106, 2.578376, 0.1830496, 1, 0, 0.6941177, 1,
1.154826, 1.035373, 0.870684, 1, 0, 0.6901961, 1,
1.158013, -1.36743, 0.9746305, 1, 0, 0.682353, 1,
1.176764, -0.0333759, 0.5556035, 1, 0, 0.6784314, 1,
1.177223, 0.7979088, 1.18554, 1, 0, 0.6705883, 1,
1.178754, 1.025469, -0.06375454, 1, 0, 0.6666667, 1,
1.181768, 1.189796, 1.596342, 1, 0, 0.6588235, 1,
1.183933, -0.8900829, 4.114715, 1, 0, 0.654902, 1,
1.187122, 1.937656, 0.8992638, 1, 0, 0.6470588, 1,
1.192097, -0.8992501, 4.544766, 1, 0, 0.6431373, 1,
1.193603, 0.4713323, 0.7367988, 1, 0, 0.6352941, 1,
1.197875, -0.02705955, 1.655866, 1, 0, 0.6313726, 1,
1.200253, -0.78499, 2.964088, 1, 0, 0.6235294, 1,
1.208642, -1.036015, 1.764858, 1, 0, 0.6196079, 1,
1.229797, 0.5273801, 1.16336, 1, 0, 0.6117647, 1,
1.230434, 0.8514653, 0.6850795, 1, 0, 0.6078432, 1,
1.232642, 0.7505131, 1.811762, 1, 0, 0.6, 1,
1.233342, 1.894921, 1.715063, 1, 0, 0.5921569, 1,
1.236586, 1.86086, -0.9504536, 1, 0, 0.5882353, 1,
1.242554, -0.1841979, 1.202181, 1, 0, 0.5803922, 1,
1.259994, 0.7535529, 1.949632, 1, 0, 0.5764706, 1,
1.262826, -0.1671958, 3.481758, 1, 0, 0.5686275, 1,
1.272188, -0.7887027, 1.317541, 1, 0, 0.5647059, 1,
1.273546, 0.342913, 1.523, 1, 0, 0.5568628, 1,
1.274553, 0.37161, 3.323395, 1, 0, 0.5529412, 1,
1.275936, -0.7524242, 1.685581, 1, 0, 0.5450981, 1,
1.276077, 0.2980888, 1.713961, 1, 0, 0.5411765, 1,
1.286253, -0.1046444, 1.769017, 1, 0, 0.5333334, 1,
1.296613, 0.9969658, 0.651304, 1, 0, 0.5294118, 1,
1.301324, -0.5600051, 1.084545, 1, 0, 0.5215687, 1,
1.301917, 0.3822992, -0.3273924, 1, 0, 0.5176471, 1,
1.320695, 1.294811, 0.453822, 1, 0, 0.509804, 1,
1.328839, 1.21119, 1.51079, 1, 0, 0.5058824, 1,
1.338656, -1.018798, 2.05228, 1, 0, 0.4980392, 1,
1.340179, 0.6156017, -0.06009778, 1, 0, 0.4901961, 1,
1.348629, -1.754702, 2.450682, 1, 0, 0.4862745, 1,
1.353678, 0.1999677, 1.313329, 1, 0, 0.4784314, 1,
1.354428, 0.08424453, 2.028864, 1, 0, 0.4745098, 1,
1.356223, -2.877453, 2.512005, 1, 0, 0.4666667, 1,
1.358678, 1.381002, 1.828895, 1, 0, 0.4627451, 1,
1.372493, -0.9001873, 2.198101, 1, 0, 0.454902, 1,
1.387024, 0.8285197, 2.307346, 1, 0, 0.4509804, 1,
1.389535, -1.695802, 2.41712, 1, 0, 0.4431373, 1,
1.410275, -0.02873386, -0.1449745, 1, 0, 0.4392157, 1,
1.430809, 0.03892656, 0.4054546, 1, 0, 0.4313726, 1,
1.436348, -1.123548, 1.754533, 1, 0, 0.427451, 1,
1.443089, 0.9173853, 1.050309, 1, 0, 0.4196078, 1,
1.443112, 2.174085, 0.8697782, 1, 0, 0.4156863, 1,
1.449675, 1.746493, -0.6173161, 1, 0, 0.4078431, 1,
1.46102, 0.6827731, 2.122004, 1, 0, 0.4039216, 1,
1.469178, 0.4174824, 2.481924, 1, 0, 0.3960784, 1,
1.485017, -0.3013706, 1.937897, 1, 0, 0.3882353, 1,
1.491401, -0.8371797, -0.3077088, 1, 0, 0.3843137, 1,
1.497376, 0.5606681, 1.972903, 1, 0, 0.3764706, 1,
1.498589, 0.2256655, -0.04827127, 1, 0, 0.372549, 1,
1.505855, -0.2483771, 2.634744, 1, 0, 0.3647059, 1,
1.510835, -1.285811, 3.130286, 1, 0, 0.3607843, 1,
1.51333, -0.1052499, 1.377444, 1, 0, 0.3529412, 1,
1.5238, -0.2128602, 1.540992, 1, 0, 0.3490196, 1,
1.530559, 1.19804, 1.132914, 1, 0, 0.3411765, 1,
1.538095, -0.4337619, 2.676934, 1, 0, 0.3372549, 1,
1.539792, -0.1968675, 3.370318, 1, 0, 0.3294118, 1,
1.539963, -1.336489, 2.035855, 1, 0, 0.3254902, 1,
1.561246, -0.190586, 2.137233, 1, 0, 0.3176471, 1,
1.572522, -1.379432, 1.338852, 1, 0, 0.3137255, 1,
1.588074, -1.461316, 2.677349, 1, 0, 0.3058824, 1,
1.62828, -1.131573, 3.87142, 1, 0, 0.2980392, 1,
1.630864, 2.429774, 1.056467, 1, 0, 0.2941177, 1,
1.635817, 0.6742959, 1.060147, 1, 0, 0.2862745, 1,
1.656739, -0.8555957, 1.020873, 1, 0, 0.282353, 1,
1.670033, 0.6590979, 1.462891, 1, 0, 0.2745098, 1,
1.703206, 0.2123358, 0.260842, 1, 0, 0.2705882, 1,
1.70972, 0.3591301, 2.429861, 1, 0, 0.2627451, 1,
1.714276, -0.3977834, 0.3897272, 1, 0, 0.2588235, 1,
1.778406, -0.5945089, 2.467952, 1, 0, 0.2509804, 1,
1.820479, 2.033577, 1.130481, 1, 0, 0.2470588, 1,
1.841731, 0.65944, 1.551321, 1, 0, 0.2392157, 1,
1.849711, 0.2679304, 0.8603148, 1, 0, 0.2352941, 1,
1.860011, 0.3224188, -0.8332999, 1, 0, 0.227451, 1,
1.876094, 2.671178, -0.148139, 1, 0, 0.2235294, 1,
1.876845, 0.9703134, 3.688261, 1, 0, 0.2156863, 1,
1.877523, -0.8584345, 1.163661, 1, 0, 0.2117647, 1,
1.881427, 0.4460928, 3.2818, 1, 0, 0.2039216, 1,
1.884353, -0.4300401, 2.278718, 1, 0, 0.1960784, 1,
1.886682, -0.6736878, -0.5262023, 1, 0, 0.1921569, 1,
1.894634, 0.1645769, 1.80736, 1, 0, 0.1843137, 1,
1.921204, -0.4549842, 2.835801, 1, 0, 0.1803922, 1,
1.925254, -0.1149527, 0.9834017, 1, 0, 0.172549, 1,
1.929462, -0.3662196, 1.168133, 1, 0, 0.1686275, 1,
1.949775, 0.365337, 1.359086, 1, 0, 0.1607843, 1,
1.978919, 0.1543298, 2.583494, 1, 0, 0.1568628, 1,
2.005758, 1.279884, 1.916811, 1, 0, 0.1490196, 1,
2.047348, -0.4041948, 0.1834833, 1, 0, 0.145098, 1,
2.068753, -0.1762665, 2.124401, 1, 0, 0.1372549, 1,
2.089038, 1.607353, -0.2994061, 1, 0, 0.1333333, 1,
2.125419, -1.0369, 2.319804, 1, 0, 0.1254902, 1,
2.215862, -0.4941557, 1.650444, 1, 0, 0.1215686, 1,
2.237043, -1.278, 3.522882, 1, 0, 0.1137255, 1,
2.244986, -1.259273, 1.785316, 1, 0, 0.1098039, 1,
2.246785, -1.791492, 2.692603, 1, 0, 0.1019608, 1,
2.282085, 0.9354477, 0.565268, 1, 0, 0.09411765, 1,
2.296988, -0.9066508, 2.418588, 1, 0, 0.09019608, 1,
2.318465, 1.553653, 0.1782409, 1, 0, 0.08235294, 1,
2.320542, -0.1036062, -0.8471487, 1, 0, 0.07843138, 1,
2.375957, 1.531184, 1.543804, 1, 0, 0.07058824, 1,
2.412056, -0.6096811, -0.1774586, 1, 0, 0.06666667, 1,
2.486552, -0.8344038, 1.542615, 1, 0, 0.05882353, 1,
2.534261, -1.235559, -0.9215733, 1, 0, 0.05490196, 1,
2.547437, -0.5068123, 2.201751, 1, 0, 0.04705882, 1,
2.657843, 0.1922623, 2.035258, 1, 0, 0.04313726, 1,
2.810169, -0.9736556, 0.7210134, 1, 0, 0.03529412, 1,
2.883797, -0.6823341, 1.497002, 1, 0, 0.03137255, 1,
2.896929, -0.1881505, 3.336684, 1, 0, 0.02352941, 1,
3.163802, 0.03367802, 2.911187, 1, 0, 0.01960784, 1,
3.279062, -0.7749455, 2.660798, 1, 0, 0.01176471, 1,
3.314866, 0.2438043, 0.3689906, 1, 0, 0.007843138, 1
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
0.003565311, -4.491847, -7.702269, 0, -0.5, 0.5, 0.5,
0.003565311, -4.491847, -7.702269, 1, -0.5, 0.5, 0.5,
0.003565311, -4.491847, -7.702269, 1, 1.5, 0.5, 0.5,
0.003565311, -4.491847, -7.702269, 0, 1.5, 0.5, 0.5
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
-4.430266, 0.05027461, -7.702269, 0, -0.5, 0.5, 0.5,
-4.430266, 0.05027461, -7.702269, 1, -0.5, 0.5, 0.5,
-4.430266, 0.05027461, -7.702269, 1, 1.5, 0.5, 0.5,
-4.430266, 0.05027461, -7.702269, 0, 1.5, 0.5, 0.5
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
-4.430266, -4.491847, -0.2473764, 0, -0.5, 0.5, 0.5,
-4.430266, -4.491847, -0.2473764, 1, -0.5, 0.5, 0.5,
-4.430266, -4.491847, -0.2473764, 1, 1.5, 0.5, 0.5,
-4.430266, -4.491847, -0.2473764, 0, 1.5, 0.5, 0.5
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
-3, -3.443665, -5.981909,
3, -3.443665, -5.981909,
-3, -3.443665, -5.981909,
-3, -3.618361, -6.268636,
-2, -3.443665, -5.981909,
-2, -3.618361, -6.268636,
-1, -3.443665, -5.981909,
-1, -3.618361, -6.268636,
0, -3.443665, -5.981909,
0, -3.618361, -6.268636,
1, -3.443665, -5.981909,
1, -3.618361, -6.268636,
2, -3.443665, -5.981909,
2, -3.618361, -6.268636,
3, -3.443665, -5.981909,
3, -3.618361, -6.268636
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
-3, -3.967756, -6.842089, 0, -0.5, 0.5, 0.5,
-3, -3.967756, -6.842089, 1, -0.5, 0.5, 0.5,
-3, -3.967756, -6.842089, 1, 1.5, 0.5, 0.5,
-3, -3.967756, -6.842089, 0, 1.5, 0.5, 0.5,
-2, -3.967756, -6.842089, 0, -0.5, 0.5, 0.5,
-2, -3.967756, -6.842089, 1, -0.5, 0.5, 0.5,
-2, -3.967756, -6.842089, 1, 1.5, 0.5, 0.5,
-2, -3.967756, -6.842089, 0, 1.5, 0.5, 0.5,
-1, -3.967756, -6.842089, 0, -0.5, 0.5, 0.5,
-1, -3.967756, -6.842089, 1, -0.5, 0.5, 0.5,
-1, -3.967756, -6.842089, 1, 1.5, 0.5, 0.5,
-1, -3.967756, -6.842089, 0, 1.5, 0.5, 0.5,
0, -3.967756, -6.842089, 0, -0.5, 0.5, 0.5,
0, -3.967756, -6.842089, 1, -0.5, 0.5, 0.5,
0, -3.967756, -6.842089, 1, 1.5, 0.5, 0.5,
0, -3.967756, -6.842089, 0, 1.5, 0.5, 0.5,
1, -3.967756, -6.842089, 0, -0.5, 0.5, 0.5,
1, -3.967756, -6.842089, 1, -0.5, 0.5, 0.5,
1, -3.967756, -6.842089, 1, 1.5, 0.5, 0.5,
1, -3.967756, -6.842089, 0, 1.5, 0.5, 0.5,
2, -3.967756, -6.842089, 0, -0.5, 0.5, 0.5,
2, -3.967756, -6.842089, 1, -0.5, 0.5, 0.5,
2, -3.967756, -6.842089, 1, 1.5, 0.5, 0.5,
2, -3.967756, -6.842089, 0, 1.5, 0.5, 0.5,
3, -3.967756, -6.842089, 0, -0.5, 0.5, 0.5,
3, -3.967756, -6.842089, 1, -0.5, 0.5, 0.5,
3, -3.967756, -6.842089, 1, 1.5, 0.5, 0.5,
3, -3.967756, -6.842089, 0, 1.5, 0.5, 0.5
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
-3.407074, -3, -5.981909,
-3.407074, 3, -5.981909,
-3.407074, -3, -5.981909,
-3.577606, -3, -6.268636,
-3.407074, -2, -5.981909,
-3.577606, -2, -6.268636,
-3.407074, -1, -5.981909,
-3.577606, -1, -6.268636,
-3.407074, 0, -5.981909,
-3.577606, 0, -6.268636,
-3.407074, 1, -5.981909,
-3.577606, 1, -6.268636,
-3.407074, 2, -5.981909,
-3.577606, 2, -6.268636,
-3.407074, 3, -5.981909,
-3.577606, 3, -6.268636
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
-3.91867, -3, -6.842089, 0, -0.5, 0.5, 0.5,
-3.91867, -3, -6.842089, 1, -0.5, 0.5, 0.5,
-3.91867, -3, -6.842089, 1, 1.5, 0.5, 0.5,
-3.91867, -3, -6.842089, 0, 1.5, 0.5, 0.5,
-3.91867, -2, -6.842089, 0, -0.5, 0.5, 0.5,
-3.91867, -2, -6.842089, 1, -0.5, 0.5, 0.5,
-3.91867, -2, -6.842089, 1, 1.5, 0.5, 0.5,
-3.91867, -2, -6.842089, 0, 1.5, 0.5, 0.5,
-3.91867, -1, -6.842089, 0, -0.5, 0.5, 0.5,
-3.91867, -1, -6.842089, 1, -0.5, 0.5, 0.5,
-3.91867, -1, -6.842089, 1, 1.5, 0.5, 0.5,
-3.91867, -1, -6.842089, 0, 1.5, 0.5, 0.5,
-3.91867, 0, -6.842089, 0, -0.5, 0.5, 0.5,
-3.91867, 0, -6.842089, 1, -0.5, 0.5, 0.5,
-3.91867, 0, -6.842089, 1, 1.5, 0.5, 0.5,
-3.91867, 0, -6.842089, 0, 1.5, 0.5, 0.5,
-3.91867, 1, -6.842089, 0, -0.5, 0.5, 0.5,
-3.91867, 1, -6.842089, 1, -0.5, 0.5, 0.5,
-3.91867, 1, -6.842089, 1, 1.5, 0.5, 0.5,
-3.91867, 1, -6.842089, 0, 1.5, 0.5, 0.5,
-3.91867, 2, -6.842089, 0, -0.5, 0.5, 0.5,
-3.91867, 2, -6.842089, 1, -0.5, 0.5, 0.5,
-3.91867, 2, -6.842089, 1, 1.5, 0.5, 0.5,
-3.91867, 2, -6.842089, 0, 1.5, 0.5, 0.5,
-3.91867, 3, -6.842089, 0, -0.5, 0.5, 0.5,
-3.91867, 3, -6.842089, 1, -0.5, 0.5, 0.5,
-3.91867, 3, -6.842089, 1, 1.5, 0.5, 0.5,
-3.91867, 3, -6.842089, 0, 1.5, 0.5, 0.5
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
-3.407074, -3.443665, -4,
-3.407074, -3.443665, 4,
-3.407074, -3.443665, -4,
-3.577606, -3.618361, -4,
-3.407074, -3.443665, -2,
-3.577606, -3.618361, -2,
-3.407074, -3.443665, 0,
-3.577606, -3.618361, 0,
-3.407074, -3.443665, 2,
-3.577606, -3.618361, 2,
-3.407074, -3.443665, 4,
-3.577606, -3.618361, 4
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
-3.91867, -3.967756, -4, 0, -0.5, 0.5, 0.5,
-3.91867, -3.967756, -4, 1, -0.5, 0.5, 0.5,
-3.91867, -3.967756, -4, 1, 1.5, 0.5, 0.5,
-3.91867, -3.967756, -4, 0, 1.5, 0.5, 0.5,
-3.91867, -3.967756, -2, 0, -0.5, 0.5, 0.5,
-3.91867, -3.967756, -2, 1, -0.5, 0.5, 0.5,
-3.91867, -3.967756, -2, 1, 1.5, 0.5, 0.5,
-3.91867, -3.967756, -2, 0, 1.5, 0.5, 0.5,
-3.91867, -3.967756, 0, 0, -0.5, 0.5, 0.5,
-3.91867, -3.967756, 0, 1, -0.5, 0.5, 0.5,
-3.91867, -3.967756, 0, 1, 1.5, 0.5, 0.5,
-3.91867, -3.967756, 0, 0, 1.5, 0.5, 0.5,
-3.91867, -3.967756, 2, 0, -0.5, 0.5, 0.5,
-3.91867, -3.967756, 2, 1, -0.5, 0.5, 0.5,
-3.91867, -3.967756, 2, 1, 1.5, 0.5, 0.5,
-3.91867, -3.967756, 2, 0, 1.5, 0.5, 0.5,
-3.91867, -3.967756, 4, 0, -0.5, 0.5, 0.5,
-3.91867, -3.967756, 4, 1, -0.5, 0.5, 0.5,
-3.91867, -3.967756, 4, 1, 1.5, 0.5, 0.5,
-3.91867, -3.967756, 4, 0, 1.5, 0.5, 0.5
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
-3.407074, -3.443665, -5.981909,
-3.407074, 3.544214, -5.981909,
-3.407074, -3.443665, 5.487156,
-3.407074, 3.544214, 5.487156,
-3.407074, -3.443665, -5.981909,
-3.407074, -3.443665, 5.487156,
-3.407074, 3.544214, -5.981909,
-3.407074, 3.544214, 5.487156,
-3.407074, -3.443665, -5.981909,
3.414205, -3.443665, -5.981909,
-3.407074, -3.443665, 5.487156,
3.414205, -3.443665, 5.487156,
-3.407074, 3.544214, -5.981909,
3.414205, 3.544214, -5.981909,
-3.407074, 3.544214, 5.487156,
3.414205, 3.544214, 5.487156,
3.414205, -3.443665, -5.981909,
3.414205, 3.544214, -5.981909,
3.414205, -3.443665, 5.487156,
3.414205, 3.544214, 5.487156,
3.414205, -3.443665, -5.981909,
3.414205, -3.443665, 5.487156,
3.414205, 3.544214, -5.981909,
3.414205, 3.544214, 5.487156
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
var radius = 8.043452;
var distance = 35.78623;
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
mvMatrix.translate( -0.003565311, -0.05027461, 0.2473764 );
mvMatrix.scale( 1.274942, 1.244546, 0.7582778 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.78623);
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
## Error in read.table("Fenthion.xyz"): no lines available in input
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
-3.307735, -0.3149894, -2.100068, 0, 0, 1, 1, 1,
-2.932889, -1.599282, -3.232367, 1, 0, 0, 1, 1,
-2.657675, 0.6649938, -2.464315, 1, 0, 0, 1, 1,
-2.572987, -1.602399, 0.1697108, 1, 0, 0, 1, 1,
-2.467807, 1.316643, -0.6664108, 1, 0, 0, 1, 1,
-2.35923, -0.7058399, -1.81554, 1, 0, 0, 1, 1,
-2.213492, 0.6012692, -1.62576, 0, 0, 0, 1, 1,
-2.145676, -0.005718021, -0.8564901, 0, 0, 0, 1, 1,
-2.119628, 0.7922483, -1.644502, 0, 0, 0, 1, 1,
-2.11472, 1.219214, 1.876993, 0, 0, 0, 1, 1,
-2.098267, -1.068405, -0.8705724, 0, 0, 0, 1, 1,
-2.097174, -0.6677271, -1.876524, 0, 0, 0, 1, 1,
-2.078755, 0.02745296, -1.395187, 0, 0, 0, 1, 1,
-2.07369, 0.04806288, -1.541192, 1, 1, 1, 1, 1,
-2.068469, -0.4517877, -1.261219, 1, 1, 1, 1, 1,
-2.059501, -0.3005352, -1.414771, 1, 1, 1, 1, 1,
-2.037321, 0.1100371, -1.042327, 1, 1, 1, 1, 1,
-2.026565, -0.7745162, -3.11356, 1, 1, 1, 1, 1,
-2.024307, -0.2531673, -0.04671856, 1, 1, 1, 1, 1,
-2.006867, -1.482288, -3.045836, 1, 1, 1, 1, 1,
-1.994621, -1.452643, -2.310241, 1, 1, 1, 1, 1,
-1.973611, -1.126465, -0.2681734, 1, 1, 1, 1, 1,
-1.97298, -0.02769219, -1.191814, 1, 1, 1, 1, 1,
-1.961229, -0.06938901, -1.813439, 1, 1, 1, 1, 1,
-1.952872, -0.1214573, -3.087851, 1, 1, 1, 1, 1,
-1.934567, 0.5952516, -0.2937016, 1, 1, 1, 1, 1,
-1.921133, 0.9929315, -0.9604174, 1, 1, 1, 1, 1,
-1.846238, -0.03147124, -1.586609, 1, 1, 1, 1, 1,
-1.834884, -0.315136, -1.652234, 0, 0, 1, 1, 1,
-1.81831, 0.8581996, -1.19292, 1, 0, 0, 1, 1,
-1.801728, 0.03409803, -1.189035, 1, 0, 0, 1, 1,
-1.775174, 0.7131401, -2.583248, 1, 0, 0, 1, 1,
-1.773021, 0.2406734, -1.061767, 1, 0, 0, 1, 1,
-1.754928, -0.5368378, -2.059044, 1, 0, 0, 1, 1,
-1.751251, 0.08246685, -1.984269, 0, 0, 0, 1, 1,
-1.731782, -0.4756292, -2.232445, 0, 0, 0, 1, 1,
-1.71577, -0.04756393, -2.521761, 0, 0, 0, 1, 1,
-1.701699, 1.893504, -0.7833021, 0, 0, 0, 1, 1,
-1.683561, 0.1600814, -0.8796468, 0, 0, 0, 1, 1,
-1.673074, -1.110494, -2.126561, 0, 0, 0, 1, 1,
-1.663872, 0.4111249, -1.751231, 0, 0, 0, 1, 1,
-1.648095, -1.848693, -2.904501, 1, 1, 1, 1, 1,
-1.637808, -0.6940656, -1.516366, 1, 1, 1, 1, 1,
-1.631268, 0.349645, -1.654964, 1, 1, 1, 1, 1,
-1.622472, 0.9321369, 0.03598612, 1, 1, 1, 1, 1,
-1.616494, 1.91334, -1.524507, 1, 1, 1, 1, 1,
-1.600384, -1.189674, -3.339243, 1, 1, 1, 1, 1,
-1.596112, 0.1601228, -2.166745, 1, 1, 1, 1, 1,
-1.594333, 0.5410689, -1.454902, 1, 1, 1, 1, 1,
-1.5934, -0.2587397, -1.074205, 1, 1, 1, 1, 1,
-1.590302, -0.7753833, -1.582782, 1, 1, 1, 1, 1,
-1.567297, 0.4174069, -1.039122, 1, 1, 1, 1, 1,
-1.560562, 2.640345, -0.7051648, 1, 1, 1, 1, 1,
-1.560389, 1.008389, -3.178379, 1, 1, 1, 1, 1,
-1.542234, -1.793138, -2.525011, 1, 1, 1, 1, 1,
-1.54139, 0.2745588, -2.714519, 1, 1, 1, 1, 1,
-1.538517, 0.3936821, 0.5735963, 0, 0, 1, 1, 1,
-1.531031, 1.027248, 0.09700718, 1, 0, 0, 1, 1,
-1.52038, -0.3842692, -2.532276, 1, 0, 0, 1, 1,
-1.514181, -0.6642724, 0.3279769, 1, 0, 0, 1, 1,
-1.512055, 0.7507921, -2.322104, 1, 0, 0, 1, 1,
-1.506517, -0.265061, -2.573881, 1, 0, 0, 1, 1,
-1.488099, -0.9709326, -1.376894, 0, 0, 0, 1, 1,
-1.485594, -0.5895628, -3.618384, 0, 0, 0, 1, 1,
-1.482556, 1.76589, -0.8098741, 0, 0, 0, 1, 1,
-1.474041, 0.4333152, -0.07709408, 0, 0, 0, 1, 1,
-1.458867, -1.117319, -1.938184, 0, 0, 0, 1, 1,
-1.446102, 0.4755658, 0.4144532, 0, 0, 0, 1, 1,
-1.442935, 1.401941, -0.4522926, 0, 0, 0, 1, 1,
-1.437431, 1.34531, -1.189327, 1, 1, 1, 1, 1,
-1.434264, 0.6587759, -1.993679, 1, 1, 1, 1, 1,
-1.429816, 0.5814891, -0.574317, 1, 1, 1, 1, 1,
-1.428347, -1.790395, -2.043584, 1, 1, 1, 1, 1,
-1.400059, 0.9056671, -1.337274, 1, 1, 1, 1, 1,
-1.397918, 1.132042, -0.7143505, 1, 1, 1, 1, 1,
-1.395371, 0.1188614, 1.725224, 1, 1, 1, 1, 1,
-1.395136, 1.012777, 0.02679842, 1, 1, 1, 1, 1,
-1.394485, -1.152187, -1.027568, 1, 1, 1, 1, 1,
-1.393322, -1.192973, -1.210137, 1, 1, 1, 1, 1,
-1.389032, 0.5306706, -1.350902, 1, 1, 1, 1, 1,
-1.387276, 0.581464, -1.301636, 1, 1, 1, 1, 1,
-1.385553, 0.6518701, -1.774224, 1, 1, 1, 1, 1,
-1.378412, -0.1393371, -4.659245, 1, 1, 1, 1, 1,
-1.37507, -0.5267718, -1.337508, 1, 1, 1, 1, 1,
-1.368542, 0.9591894, -1.044963, 0, 0, 1, 1, 1,
-1.358881, -0.8023331, -2.472162, 1, 0, 0, 1, 1,
-1.356178, -2.230496, -3.052938, 1, 0, 0, 1, 1,
-1.355508, 0.2526063, -0.7905746, 1, 0, 0, 1, 1,
-1.345304, -0.5688559, -1.468433, 1, 0, 0, 1, 1,
-1.34362, -0.6698987, -2.895018, 1, 0, 0, 1, 1,
-1.32822, -1.115813, -1.913498, 0, 0, 0, 1, 1,
-1.325379, -0.1209415, -0.04218425, 0, 0, 0, 1, 1,
-1.321954, 0.6070225, -0.7647993, 0, 0, 0, 1, 1,
-1.319756, -3.341899, -2.798977, 0, 0, 0, 1, 1,
-1.317773, 0.02584521, -0.5337667, 0, 0, 0, 1, 1,
-1.312539, -1.417569, -3.866417, 0, 0, 0, 1, 1,
-1.309222, -0.4903602, -1.596717, 0, 0, 0, 1, 1,
-1.302426, 1.598329, -2.36132, 1, 1, 1, 1, 1,
-1.292619, -1.500336, -4.141661, 1, 1, 1, 1, 1,
-1.283329, -0.3002859, -1.890788, 1, 1, 1, 1, 1,
-1.280732, 0.925751, -2.560665, 1, 1, 1, 1, 1,
-1.261027, 0.8360725, 1.350961, 1, 1, 1, 1, 1,
-1.252775, -1.044873, -2.334625, 1, 1, 1, 1, 1,
-1.251355, -1.369269, -1.769933, 1, 1, 1, 1, 1,
-1.250345, 0.9606838, -0.4544406, 1, 1, 1, 1, 1,
-1.247813, 1.082663, -1.153255, 1, 1, 1, 1, 1,
-1.245703, -0.172162, -2.410784, 1, 1, 1, 1, 1,
-1.244702, -1.063404, -2.072106, 1, 1, 1, 1, 1,
-1.244066, -1.06238, -4.155297, 1, 1, 1, 1, 1,
-1.229319, -1.247182, -2.288522, 1, 1, 1, 1, 1,
-1.222743, -0.9401911, -2.508857, 1, 1, 1, 1, 1,
-1.222625, -0.05766126, -0.620177, 1, 1, 1, 1, 1,
-1.219898, -0.4075364, -1.06113, 0, 0, 1, 1, 1,
-1.210006, -0.180748, 0.5283757, 1, 0, 0, 1, 1,
-1.203126, -0.04002187, -2.032144, 1, 0, 0, 1, 1,
-1.200338, 0.1528755, -0.7957168, 1, 0, 0, 1, 1,
-1.198404, 0.6002947, -2.155467, 1, 0, 0, 1, 1,
-1.192902, 0.1323963, 0.01426866, 1, 0, 0, 1, 1,
-1.188972, -1.176769, -1.551935, 0, 0, 0, 1, 1,
-1.179274, 1.269158, -3.479233, 0, 0, 0, 1, 1,
-1.166322, 0.6709554, -1.914229, 0, 0, 0, 1, 1,
-1.165524, -0.9733667, -1.277558, 0, 0, 0, 1, 1,
-1.164359, 0.2153094, -1.305216, 0, 0, 0, 1, 1,
-1.16317, 0.2681202, -0.9159869, 0, 0, 0, 1, 1,
-1.151477, 0.4473585, -0.4846611, 0, 0, 0, 1, 1,
-1.14296, 0.007686119, -1.103453, 1, 1, 1, 1, 1,
-1.137434, -1.548943, -1.704399, 1, 1, 1, 1, 1,
-1.133144, -1.267392, -1.871139, 1, 1, 1, 1, 1,
-1.131495, -0.9998872, -4.425879, 1, 1, 1, 1, 1,
-1.128905, 0.04258763, -2.582977, 1, 1, 1, 1, 1,
-1.128493, -0.5471974, -4.722356, 1, 1, 1, 1, 1,
-1.12842, 0.9642013, 0.04761943, 1, 1, 1, 1, 1,
-1.124224, -0.1006643, -1.27225, 1, 1, 1, 1, 1,
-1.116053, 1.288566, -0.6275744, 1, 1, 1, 1, 1,
-1.108247, -0.329358, -2.426693, 1, 1, 1, 1, 1,
-1.096146, 0.6142214, -0.9075899, 1, 1, 1, 1, 1,
-1.094715, 1.89656, -1.693129, 1, 1, 1, 1, 1,
-1.093587, 0.02054322, -2.042119, 1, 1, 1, 1, 1,
-1.092331, 0.4932632, 1.29281, 1, 1, 1, 1, 1,
-1.091374, 2.154905, -0.5115263, 1, 1, 1, 1, 1,
-1.084637, -1.871063, -2.029331, 0, 0, 1, 1, 1,
-1.083542, 0.04739402, -2.351595, 1, 0, 0, 1, 1,
-1.071251, -1.024206, -0.8428339, 1, 0, 0, 1, 1,
-1.068458, 0.6612878, -2.707978, 1, 0, 0, 1, 1,
-1.068274, 1.321015, -0.8309861, 1, 0, 0, 1, 1,
-1.066219, -0.6918567, -3.243456, 1, 0, 0, 1, 1,
-1.059414, 0.8450801, 0.2858537, 0, 0, 0, 1, 1,
-1.057371, -2.508586, -4.401317, 0, 0, 0, 1, 1,
-1.04936, 0.3080539, -1.444777, 0, 0, 0, 1, 1,
-1.047502, -2.142326, -3.785246, 0, 0, 0, 1, 1,
-1.047039, 0.6314071, -1.566733, 0, 0, 0, 1, 1,
-1.038146, 0.5153864, -1.71357, 0, 0, 0, 1, 1,
-1.036577, 1.161153, -0.7525451, 0, 0, 0, 1, 1,
-1.033369, -0.9573131, -2.602982, 1, 1, 1, 1, 1,
-1.022691, -1.618488, -2.561574, 1, 1, 1, 1, 1,
-1.020172, 0.08877483, -0.5109445, 1, 1, 1, 1, 1,
-1.018453, -0.4453505, -0.9914479, 1, 1, 1, 1, 1,
-1.01382, -0.5216869, -2.334002, 1, 1, 1, 1, 1,
-1.010274, -1.685877, -1.688728, 1, 1, 1, 1, 1,
-1.005194, -0.1429878, -1.820215, 1, 1, 1, 1, 1,
-1.003478, -0.5660326, -2.349636, 1, 1, 1, 1, 1,
-1.003435, -0.08080476, -0.9388515, 1, 1, 1, 1, 1,
-1.002663, 0.3403007, -2.094356, 1, 1, 1, 1, 1,
-1.000714, -0.003378867, -1.819568, 1, 1, 1, 1, 1,
-0.998208, -0.6511183, 0.115881, 1, 1, 1, 1, 1,
-0.9924896, -0.3666595, -3.751251, 1, 1, 1, 1, 1,
-0.9895626, -1.266743, -1.176248, 1, 1, 1, 1, 1,
-0.9869313, 0.6004643, -3.076549, 1, 1, 1, 1, 1,
-0.9817845, 1.125613, -0.4056219, 0, 0, 1, 1, 1,
-0.9765041, 1.633106, -0.5457422, 1, 0, 0, 1, 1,
-0.975868, 1.749904, -2.257699, 1, 0, 0, 1, 1,
-0.9733022, 0.2666382, -2.27231, 1, 0, 0, 1, 1,
-0.9730406, -0.3790794, -1.840774, 1, 0, 0, 1, 1,
-0.9675223, -0.3222595, -1.954068, 1, 0, 0, 1, 1,
-0.9667206, 1.954829, 0.408947, 0, 0, 0, 1, 1,
-0.9665349, 1.487846, 0.8352976, 0, 0, 0, 1, 1,
-0.9648318, -0.6547237, -3.643648, 0, 0, 0, 1, 1,
-0.9598278, -1.508262, -2.83878, 0, 0, 0, 1, 1,
-0.9591634, -0.5983309, -1.746247, 0, 0, 0, 1, 1,
-0.9485888, 0.3381815, -1.153908, 0, 0, 0, 1, 1,
-0.9458814, 1.588535, -1.454712, 0, 0, 0, 1, 1,
-0.9457051, -0.3951657, -1.542104, 1, 1, 1, 1, 1,
-0.9406173, -0.6767713, -2.351782, 1, 1, 1, 1, 1,
-0.9387919, -3.115512, -1.486247, 1, 1, 1, 1, 1,
-0.9368719, -1.39439, -2.824925, 1, 1, 1, 1, 1,
-0.9352231, -0.5672668, -1.073516, 1, 1, 1, 1, 1,
-0.9328537, 0.51217, -1.699608, 1, 1, 1, 1, 1,
-0.9251415, 2.085754, -2.508728, 1, 1, 1, 1, 1,
-0.9151623, 1.051509, -0.7324901, 1, 1, 1, 1, 1,
-0.9140463, 0.2712326, 1.163823, 1, 1, 1, 1, 1,
-0.9082672, -0.7420198, -1.251582, 1, 1, 1, 1, 1,
-0.9068605, -0.1563385, -1.068003, 1, 1, 1, 1, 1,
-0.8935335, 0.6963996, -0.4917024, 1, 1, 1, 1, 1,
-0.8909817, -1.044132, -3.204257, 1, 1, 1, 1, 1,
-0.8904182, 0.234046, -0.7840653, 1, 1, 1, 1, 1,
-0.8896284, 0.3514347, -0.6765805, 1, 1, 1, 1, 1,
-0.8869497, -0.6547779, -2.5567, 0, 0, 1, 1, 1,
-0.8860585, -0.1684715, -0.7425908, 1, 0, 0, 1, 1,
-0.8849156, -1.01799, -3.202353, 1, 0, 0, 1, 1,
-0.8786771, -1.016461, -0.4564322, 1, 0, 0, 1, 1,
-0.8773869, -1.76102, -2.867271, 1, 0, 0, 1, 1,
-0.8621122, -0.7313979, -1.168743, 1, 0, 0, 1, 1,
-0.8552035, 1.51438, -1.125946, 0, 0, 0, 1, 1,
-0.8550601, 0.7762528, -0.5396056, 0, 0, 0, 1, 1,
-0.8537391, -0.9781393, -4.120932, 0, 0, 0, 1, 1,
-0.8505897, 0.2537917, -2.985593, 0, 0, 0, 1, 1,
-0.8331873, 1.841589, -0.4011737, 0, 0, 0, 1, 1,
-0.8302934, -0.4902833, -3.354176, 0, 0, 0, 1, 1,
-0.8288336, 0.9835686, -2.013581, 0, 0, 0, 1, 1,
-0.827994, -0.5791136, -2.187138, 1, 1, 1, 1, 1,
-0.8260891, -2.637674, -2.99199, 1, 1, 1, 1, 1,
-0.8256809, -0.64735, -1.33219, 1, 1, 1, 1, 1,
-0.8253418, -0.5278179, -2.902009, 1, 1, 1, 1, 1,
-0.8151881, -1.100019, -2.933638, 1, 1, 1, 1, 1,
-0.8134515, -1.975152, -1.231422, 1, 1, 1, 1, 1,
-0.8132836, -1.923559, -1.362203, 1, 1, 1, 1, 1,
-0.8129163, 0.2295274, -2.479278, 1, 1, 1, 1, 1,
-0.811152, 0.2059506, -0.5183221, 1, 1, 1, 1, 1,
-0.8103297, 0.9611491, -1.118508, 1, 1, 1, 1, 1,
-0.7937964, 1.129656, 0.0901847, 1, 1, 1, 1, 1,
-0.7892313, -1.153733, -4.301989, 1, 1, 1, 1, 1,
-0.7887437, -1.771902, -3.666395, 1, 1, 1, 1, 1,
-0.7861387, -0.1779099, -0.240001, 1, 1, 1, 1, 1,
-0.7794937, -0.8719703, -2.411678, 1, 1, 1, 1, 1,
-0.7782365, 0.1711569, -1.886528, 0, 0, 1, 1, 1,
-0.7769443, 0.7400983, -1.373327, 1, 0, 0, 1, 1,
-0.7764502, 0.01113667, -2.080878, 1, 0, 0, 1, 1,
-0.7763847, -2.729386, -3.541019, 1, 0, 0, 1, 1,
-0.77232, -0.4029878, -3.728702, 1, 0, 0, 1, 1,
-0.7717314, 0.9822653, -1.925406, 1, 0, 0, 1, 1,
-0.7693049, 0.5827285, -1.380094, 0, 0, 0, 1, 1,
-0.7665879, -1.207185, -2.463487, 0, 0, 0, 1, 1,
-0.7649716, -0.7188684, -3.171843, 0, 0, 0, 1, 1,
-0.7634446, 0.7569489, -1.627257, 0, 0, 0, 1, 1,
-0.7617338, -0.9605378, -3.73205, 0, 0, 0, 1, 1,
-0.7564702, -1.970363, -3.674733, 0, 0, 0, 1, 1,
-0.7552413, 0.5162916, -1.316377, 0, 0, 0, 1, 1,
-0.7518787, -0.2377474, -0.5607823, 1, 1, 1, 1, 1,
-0.7510683, -0.317852, -2.202537, 1, 1, 1, 1, 1,
-0.7507021, 0.5728009, -2.637251, 1, 1, 1, 1, 1,
-0.7450954, 0.009654923, -1.293639, 1, 1, 1, 1, 1,
-0.7436258, 0.266864, -0.9484195, 1, 1, 1, 1, 1,
-0.7382414, -2.032758, -2.302877, 1, 1, 1, 1, 1,
-0.7286237, 0.3777936, -0.1531783, 1, 1, 1, 1, 1,
-0.7280215, -0.977452, -2.213502, 1, 1, 1, 1, 1,
-0.7274618, 0.3656029, -1.519445, 1, 1, 1, 1, 1,
-0.7253314, -0.9410561, -1.885877, 1, 1, 1, 1, 1,
-0.72398, -0.8168213, -3.232727, 1, 1, 1, 1, 1,
-0.7176236, 0.00574371, -2.080498, 1, 1, 1, 1, 1,
-0.7153752, 0.6657698, 0.1070152, 1, 1, 1, 1, 1,
-0.7101119, -0.04824522, 0.4301854, 1, 1, 1, 1, 1,
-0.7099184, -1.61432, -4.575805, 1, 1, 1, 1, 1,
-0.7096495, -0.3372299, -2.192577, 0, 0, 1, 1, 1,
-0.7022521, 0.4176372, -0.2796839, 1, 0, 0, 1, 1,
-0.7013059, -0.3328382, -2.155867, 1, 0, 0, 1, 1,
-0.6929008, -1.483981, -2.615311, 1, 0, 0, 1, 1,
-0.6918226, -0.88616, -1.488901, 1, 0, 0, 1, 1,
-0.688228, -0.8505147, -2.775071, 1, 0, 0, 1, 1,
-0.6860443, -0.3504481, 0.4861757, 0, 0, 0, 1, 1,
-0.6836395, 0.527112, -0.5776684, 0, 0, 0, 1, 1,
-0.6812871, 1.394752, -0.04080448, 0, 0, 0, 1, 1,
-0.6791199, -1.337435, -1.911493, 0, 0, 0, 1, 1,
-0.6784649, 1.072049, -1.658173, 0, 0, 0, 1, 1,
-0.676864, -0.669135, -3.96108, 0, 0, 0, 1, 1,
-0.6760476, 1.906935, 0.6393861, 0, 0, 0, 1, 1,
-0.6704111, 1.353396, -0.8558416, 1, 1, 1, 1, 1,
-0.6608503, 0.2482963, -0.8844928, 1, 1, 1, 1, 1,
-0.6585473, 0.9018205, -1.10663, 1, 1, 1, 1, 1,
-0.657317, -0.3320197, -2.227349, 1, 1, 1, 1, 1,
-0.6539363, -0.7018715, -1.497529, 1, 1, 1, 1, 1,
-0.6440365, -0.189735, -3.352063, 1, 1, 1, 1, 1,
-0.6438458, 1.317281, -0.2081728, 1, 1, 1, 1, 1,
-0.6395371, -1.280797, -3.349619, 1, 1, 1, 1, 1,
-0.6293713, -0.05886212, -1.819173, 1, 1, 1, 1, 1,
-0.6286985, -0.5811667, -2.863478, 1, 1, 1, 1, 1,
-0.6230586, -0.8751398, -2.891118, 1, 1, 1, 1, 1,
-0.6215484, 1.884267, -0.2206851, 1, 1, 1, 1, 1,
-0.619237, 1.091447, 0.5292759, 1, 1, 1, 1, 1,
-0.6185235, 1.124356, -0.74981, 1, 1, 1, 1, 1,
-0.6171573, 0.3112904, -0.8658758, 1, 1, 1, 1, 1,
-0.608958, 0.08927188, -1.110391, 0, 0, 1, 1, 1,
-0.6074457, 0.199523, -1.011071, 1, 0, 0, 1, 1,
-0.6042932, -0.8335376, -1.488224, 1, 0, 0, 1, 1,
-0.5917476, 0.09834738, -1.21414, 1, 0, 0, 1, 1,
-0.5883951, -0.104061, -1.49938, 1, 0, 0, 1, 1,
-0.5876415, 1.368227, 0.3927881, 1, 0, 0, 1, 1,
-0.5864241, 0.3862823, 0.1814771, 0, 0, 0, 1, 1,
-0.5817963, -2.41717, -4.24934, 0, 0, 0, 1, 1,
-0.5776468, 0.1813523, -1.725612, 0, 0, 0, 1, 1,
-0.5769907, 2.15964, 0.8474203, 0, 0, 0, 1, 1,
-0.5745553, -1.477389, -3.529802, 0, 0, 0, 1, 1,
-0.5729095, 1.048894, 1.060924, 0, 0, 0, 1, 1,
-0.572693, -2.233645, -4.221127, 0, 0, 0, 1, 1,
-0.5704431, -0.08995689, -1.500337, 1, 1, 1, 1, 1,
-0.5674594, 0.5166335, -1.454158, 1, 1, 1, 1, 1,
-0.5656999, 1.035468, -1.400092, 1, 1, 1, 1, 1,
-0.5647048, -0.8515856, -5.31834, 1, 1, 1, 1, 1,
-0.5601673, -1.795274, -2.159411, 1, 1, 1, 1, 1,
-0.5567491, 0.2261587, -1.445034, 1, 1, 1, 1, 1,
-0.5527869, -0.1548936, -1.478505, 1, 1, 1, 1, 1,
-0.5512954, -0.2902597, -2.486269, 1, 1, 1, 1, 1,
-0.5497741, -1.162409, -3.853432, 1, 1, 1, 1, 1,
-0.54761, -0.5443693, -2.012146, 1, 1, 1, 1, 1,
-0.5411815, 0.6833115, -1.575231, 1, 1, 1, 1, 1,
-0.5367721, 0.1396062, -0.9028757, 1, 1, 1, 1, 1,
-0.5347821, -0.422053, -2.3358, 1, 1, 1, 1, 1,
-0.5328899, 0.5985181, -0.2560291, 1, 1, 1, 1, 1,
-0.529688, 0.508897, 0.5010281, 1, 1, 1, 1, 1,
-0.512362, -0.3660154, -2.60206, 0, 0, 1, 1, 1,
-0.5091915, -1.556548, -2.572354, 1, 0, 0, 1, 1,
-0.5089252, 0.4024595, -1.631322, 1, 0, 0, 1, 1,
-0.5079986, -1.086792, -3.128213, 1, 0, 0, 1, 1,
-0.5057514, 0.6406083, 1.114948, 1, 0, 0, 1, 1,
-0.502195, -0.6482823, -2.869781, 1, 0, 0, 1, 1,
-0.5017102, -0.878418, -2.565734, 0, 0, 0, 1, 1,
-0.5000509, 0.4956329, -0.1012524, 0, 0, 0, 1, 1,
-0.4992038, 0.1571801, -0.298766, 0, 0, 0, 1, 1,
-0.4969312, 0.4339729, -0.297736, 0, 0, 0, 1, 1,
-0.4969228, -1.375609, -1.216218, 0, 0, 0, 1, 1,
-0.4965, -0.366383, -1.268691, 0, 0, 0, 1, 1,
-0.4959563, 0.06869979, -1.458377, 0, 0, 0, 1, 1,
-0.484912, -0.5552213, -2.068824, 1, 1, 1, 1, 1,
-0.4764584, -0.3134321, -2.237885, 1, 1, 1, 1, 1,
-0.4667501, -1.04583, -2.737088, 1, 1, 1, 1, 1,
-0.4663284, 1.385342, -0.2870597, 1, 1, 1, 1, 1,
-0.4647528, 0.1682533, -0.735891, 1, 1, 1, 1, 1,
-0.4624599, 0.06032854, -2.639826, 1, 1, 1, 1, 1,
-0.4621878, 2.445179, 0.5702927, 1, 1, 1, 1, 1,
-0.4613943, -0.8922604, -1.65354, 1, 1, 1, 1, 1,
-0.4593224, 0.1371028, -1.508276, 1, 1, 1, 1, 1,
-0.4557308, 1.370725, -0.3826467, 1, 1, 1, 1, 1,
-0.4557244, -1.270863, -2.665132, 1, 1, 1, 1, 1,
-0.4551304, 2.022829, -2.021526, 1, 1, 1, 1, 1,
-0.4551281, -0.2009887, -1.021701, 1, 1, 1, 1, 1,
-0.4512089, 0.5119542, -0.3239322, 1, 1, 1, 1, 1,
-0.4391609, -1.711784, -4.452253, 1, 1, 1, 1, 1,
-0.435361, 0.7517884, -1.053329, 0, 0, 1, 1, 1,
-0.4317407, 0.7858549, -0.9964688, 1, 0, 0, 1, 1,
-0.4288467, -1.263807, -1.78329, 1, 0, 0, 1, 1,
-0.4208725, 0.6253562, -0.8495647, 1, 0, 0, 1, 1,
-0.4200004, -0.2765247, -0.8792273, 1, 0, 0, 1, 1,
-0.4172494, 1.486036, 1.151845, 1, 0, 0, 1, 1,
-0.4166776, 0.3906351, -1.678043, 0, 0, 0, 1, 1,
-0.4162456, -1.301796, -3.254185, 0, 0, 0, 1, 1,
-0.4162404, 1.278806, 2.286824, 0, 0, 0, 1, 1,
-0.4160191, 1.416182, -0.5221087, 0, 0, 0, 1, 1,
-0.4107973, -0.7929122, -2.697332, 0, 0, 0, 1, 1,
-0.4083345, 0.09568284, -1.693058, 0, 0, 0, 1, 1,
-0.406672, 0.2578117, -1.077545, 0, 0, 0, 1, 1,
-0.4059608, 0.7504436, -2.083127, 1, 1, 1, 1, 1,
-0.4050448, -1.592902, -2.200027, 1, 1, 1, 1, 1,
-0.404496, -0.782921, -5.35496, 1, 1, 1, 1, 1,
-0.4039785, -0.57573, -2.438062, 1, 1, 1, 1, 1,
-0.4007186, -0.6877946, -2.840544, 1, 1, 1, 1, 1,
-0.3959447, 0.02805231, -0.941036, 1, 1, 1, 1, 1,
-0.3899282, 1.361628, 1.102115, 1, 1, 1, 1, 1,
-0.3845769, 1.152643, 0.1838106, 1, 1, 1, 1, 1,
-0.3837025, -0.2126587, -0.8928741, 1, 1, 1, 1, 1,
-0.3836441, 0.7331299, -1.359724, 1, 1, 1, 1, 1,
-0.3824862, -0.7071454, -3.2919, 1, 1, 1, 1, 1,
-0.3750024, -0.6484839, -3.456475, 1, 1, 1, 1, 1,
-0.3711909, 0.5242885, -2.349934, 1, 1, 1, 1, 1,
-0.3710521, 0.4681263, -3.032666, 1, 1, 1, 1, 1,
-0.3658762, -0.005841572, -0.9284356, 1, 1, 1, 1, 1,
-0.3636861, 1.161141, -1.43436, 0, 0, 1, 1, 1,
-0.3618437, 0.1048258, -2.257525, 1, 0, 0, 1, 1,
-0.3600274, -0.786403, -1.146184, 1, 0, 0, 1, 1,
-0.35957, -0.8964338, -2.050988, 1, 0, 0, 1, 1,
-0.3586332, -0.2773901, -1.526862, 1, 0, 0, 1, 1,
-0.3584192, 1.61528, -1.512923, 1, 0, 0, 1, 1,
-0.3559018, -0.1365457, -3.148088, 0, 0, 0, 1, 1,
-0.3458189, 0.2514269, -0.05513359, 0, 0, 0, 1, 1,
-0.3419867, 1.118176, 0.2638111, 0, 0, 0, 1, 1,
-0.3385036, -1.080969, -4.509399, 0, 0, 0, 1, 1,
-0.3333862, -0.4841737, -1.026543, 0, 0, 0, 1, 1,
-0.3327943, -1.161025, -1.684399, 0, 0, 0, 1, 1,
-0.3320132, -0.9713116, -1.885491, 0, 0, 0, 1, 1,
-0.3316911, -2.292901, -2.054725, 1, 1, 1, 1, 1,
-0.3247499, 0.5605169, -1.174103, 1, 1, 1, 1, 1,
-0.3235427, -2.064809, -5.687276, 1, 1, 1, 1, 1,
-0.3179592, 0.3163377, -1.703582, 1, 1, 1, 1, 1,
-0.3176602, -0.2224089, -1.021291, 1, 1, 1, 1, 1,
-0.3156192, 0.04703142, -1.212915, 1, 1, 1, 1, 1,
-0.3136038, 0.7926863, 0.1494032, 1, 1, 1, 1, 1,
-0.312316, 1.060788, -0.4002705, 1, 1, 1, 1, 1,
-0.3116152, 0.8348424, 1.276601, 1, 1, 1, 1, 1,
-0.3089841, -1.08869, -1.696344, 1, 1, 1, 1, 1,
-0.3041089, -1.167972, -2.604167, 1, 1, 1, 1, 1,
-0.3020463, 1.566218, -0.2615778, 1, 1, 1, 1, 1,
-0.299161, -1.611078, -3.906225, 1, 1, 1, 1, 1,
-0.2975898, -1.137515, -3.309124, 1, 1, 1, 1, 1,
-0.2956952, 0.9013866, -0.4616392, 1, 1, 1, 1, 1,
-0.292667, 0.3788502, -1.435487, 0, 0, 1, 1, 1,
-0.292654, -0.2413741, -2.161964, 1, 0, 0, 1, 1,
-0.2899005, 0.1260039, -2.318144, 1, 0, 0, 1, 1,
-0.2868255, -1.236179, -1.937351, 1, 0, 0, 1, 1,
-0.2819823, -0.8622385, -2.546218, 1, 0, 0, 1, 1,
-0.2802837, 0.8255872, -0.4920453, 1, 0, 0, 1, 1,
-0.2776396, -0.9721897, -2.967952, 0, 0, 0, 1, 1,
-0.2731403, -0.8522229, -2.972275, 0, 0, 0, 1, 1,
-0.2727694, 0.7921229, -0.1975285, 0, 0, 0, 1, 1,
-0.2662229, 0.3528171, -2.932197, 0, 0, 0, 1, 1,
-0.2644482, -0.163712, -3.119922, 0, 0, 0, 1, 1,
-0.2639946, 1.57422, 0.8176906, 0, 0, 0, 1, 1,
-0.2587741, 1.412189, -1.737776, 0, 0, 0, 1, 1,
-0.2583116, 0.5789295, -1.604475, 1, 1, 1, 1, 1,
-0.2554295, 0.3463142, -2.51875, 1, 1, 1, 1, 1,
-0.2541232, 0.5358015, -2.446719, 1, 1, 1, 1, 1,
-0.2509307, 1.743105, 0.9041764, 1, 1, 1, 1, 1,
-0.2457315, 0.05956561, -2.459848, 1, 1, 1, 1, 1,
-0.2449988, 0.7519843, 0.1553939, 1, 1, 1, 1, 1,
-0.2443399, 1.082377, 0.9547753, 1, 1, 1, 1, 1,
-0.2412706, 0.1951028, -2.868775, 1, 1, 1, 1, 1,
-0.2406511, 0.6427079, -2.088926, 1, 1, 1, 1, 1,
-0.2404448, 0.9484895, 1.999833, 1, 1, 1, 1, 1,
-0.2399438, 0.7252952, -0.5077839, 1, 1, 1, 1, 1,
-0.2357737, -0.8806128, -4.148954, 1, 1, 1, 1, 1,
-0.233237, -0.8486251, -2.907365, 1, 1, 1, 1, 1,
-0.2317184, 0.5457756, -0.667119, 1, 1, 1, 1, 1,
-0.231705, -0.008157405, -2.29355, 1, 1, 1, 1, 1,
-0.2255834, 0.1983194, -1.674864, 0, 0, 1, 1, 1,
-0.2250416, 0.5037981, -0.5765662, 1, 0, 0, 1, 1,
-0.2236647, 1.222188, -2.814686, 1, 0, 0, 1, 1,
-0.2211799, -0.3052705, -1.433387, 1, 0, 0, 1, 1,
-0.2194314, -0.1199392, -2.943882, 1, 0, 0, 1, 1,
-0.2097013, -2.603804, -3.023394, 1, 0, 0, 1, 1,
-0.2070912, 0.1783631, -1.915189, 0, 0, 0, 1, 1,
-0.2062168, -1.259748, -1.328119, 0, 0, 0, 1, 1,
-0.2045731, -0.5561419, -3.760986, 0, 0, 0, 1, 1,
-0.204281, -1.822153, -2.844018, 0, 0, 0, 1, 1,
-0.2028639, 2.128141, 0.6020291, 0, 0, 0, 1, 1,
-0.202438, 0.1831082, -1.294383, 0, 0, 0, 1, 1,
-0.1967597, 1.057083, 0.7595251, 0, 0, 0, 1, 1,
-0.1961179, -1.01109, -4.053044, 1, 1, 1, 1, 1,
-0.1946252, -0.4466796, -1.897217, 1, 1, 1, 1, 1,
-0.1933466, -0.0289844, -1.178378, 1, 1, 1, 1, 1,
-0.1921673, -1.828268, -2.769765, 1, 1, 1, 1, 1,
-0.1895094, 0.4237588, -0.277251, 1, 1, 1, 1, 1,
-0.1841079, 0.4262561, -1.818006, 1, 1, 1, 1, 1,
-0.1823938, 1.282699, 0.1635547, 1, 1, 1, 1, 1,
-0.1821322, -0.1871668, -0.01020174, 1, 1, 1, 1, 1,
-0.1799214, -0.3902961, -3.623559, 1, 1, 1, 1, 1,
-0.1798714, 1.845104, -1.313876, 1, 1, 1, 1, 1,
-0.1788054, -0.631484, -1.722472, 1, 1, 1, 1, 1,
-0.1782931, 0.2140399, -0.875755, 1, 1, 1, 1, 1,
-0.1766199, 0.2220162, -0.3455586, 1, 1, 1, 1, 1,
-0.1759351, 1.990808, 0.1531962, 1, 1, 1, 1, 1,
-0.1748575, -0.5867285, -4.917253, 1, 1, 1, 1, 1,
-0.1732448, 1.163209, 0.1669013, 0, 0, 1, 1, 1,
-0.1716128, 0.6820719, -0.3294187, 1, 0, 0, 1, 1,
-0.1687143, 2.567507, 0.9584706, 1, 0, 0, 1, 1,
-0.1637319, 0.3081556, -2.357718, 1, 0, 0, 1, 1,
-0.16031, -0.06290038, -2.07244, 1, 0, 0, 1, 1,
-0.160125, -0.1688098, -2.035441, 1, 0, 0, 1, 1,
-0.1544775, -0.6017624, -3.720815, 0, 0, 0, 1, 1,
-0.1499652, -0.8918403, -2.960139, 0, 0, 0, 1, 1,
-0.1415611, 1.125979, 1.539848, 0, 0, 0, 1, 1,
-0.1396651, 1.462108, -0.4711989, 0, 0, 0, 1, 1,
-0.1375384, -1.115847, -2.104609, 0, 0, 0, 1, 1,
-0.1360606, 1.283435, -0.6876927, 0, 0, 0, 1, 1,
-0.1346458, -0.8279614, -2.439929, 0, 0, 0, 1, 1,
-0.1339313, 2.262346, -0.5433626, 1, 1, 1, 1, 1,
-0.1300277, 1.908062, -1.573671, 1, 1, 1, 1, 1,
-0.128986, -1.947423, -3.108248, 1, 1, 1, 1, 1,
-0.1262612, -1.277995, -3.71297, 1, 1, 1, 1, 1,
-0.1261782, 0.3860453, -0.2339518, 1, 1, 1, 1, 1,
-0.1251028, 0.070572, -0.9423147, 1, 1, 1, 1, 1,
-0.1245561, -0.5864807, -4.093722, 1, 1, 1, 1, 1,
-0.1207815, -1.297287, -3.329175, 1, 1, 1, 1, 1,
-0.1199722, 0.5371175, 0.1013032, 1, 1, 1, 1, 1,
-0.1196302, -0.2611782, -3.503138, 1, 1, 1, 1, 1,
-0.117188, -0.2309423, -3.754587, 1, 1, 1, 1, 1,
-0.1143148, 0.4268967, 1.503118, 1, 1, 1, 1, 1,
-0.1120175, -1.353853, -2.908497, 1, 1, 1, 1, 1,
-0.1091634, 0.1720811, -2.397737, 1, 1, 1, 1, 1,
-0.1047499, -1.103243, -3.527153, 1, 1, 1, 1, 1,
-0.1035987, 0.6318035, 0.8841739, 0, 0, 1, 1, 1,
-0.1004815, 2.379325, -0.5576262, 1, 0, 0, 1, 1,
-0.0966784, 1.395423, -0.489877, 1, 0, 0, 1, 1,
-0.09505407, -1.552419, -3.093179, 1, 0, 0, 1, 1,
-0.08951548, -0.4887047, -4.140668, 1, 0, 0, 1, 1,
-0.0849907, 1.189499, 0.5529647, 1, 0, 0, 1, 1,
-0.08361035, 1.062024, 1.369907, 0, 0, 0, 1, 1,
-0.08304211, -0.8036522, -3.283929, 0, 0, 0, 1, 1,
-0.07828312, -0.07025659, -1.408251, 0, 0, 0, 1, 1,
-0.07774939, -0.2849997, -3.142072, 0, 0, 0, 1, 1,
-0.07499266, -0.2968826, -1.70378, 0, 0, 0, 1, 1,
-0.07302146, 1.093423, -1.474633, 0, 0, 0, 1, 1,
-0.07172438, -0.1522054, -2.616314, 0, 0, 0, 1, 1,
-0.07154927, -0.9232832, -2.536061, 1, 1, 1, 1, 1,
-0.06892263, 0.5723637, 2.395761, 1, 1, 1, 1, 1,
-0.06857923, -0.8048464, -2.047538, 1, 1, 1, 1, 1,
-0.06851133, 0.1235331, -1.266837, 1, 1, 1, 1, 1,
-0.0616501, -0.4766825, -2.425218, 1, 1, 1, 1, 1,
-0.04358242, -0.1440356, -4.706156, 1, 1, 1, 1, 1,
-0.04222393, -0.128075, -4.416548, 1, 1, 1, 1, 1,
-0.04189643, -0.02932398, -3.084095, 1, 1, 1, 1, 1,
-0.04145077, 1.627498, 1.275189, 1, 1, 1, 1, 1,
-0.03750728, -0.5243805, -3.949895, 1, 1, 1, 1, 1,
-0.03442248, 1.035991, 0.6354999, 1, 1, 1, 1, 1,
-0.03325975, -0.4229254, -3.852172, 1, 1, 1, 1, 1,
-0.03288194, -0.6030689, -1.857223, 1, 1, 1, 1, 1,
-0.02784034, 0.2719831, 0.4935627, 1, 1, 1, 1, 1,
-0.02588316, 0.8434753, -0.4316768, 1, 1, 1, 1, 1,
-0.02312159, -0.4509768, -2.619208, 0, 0, 1, 1, 1,
-0.01640218, 1.896231, 0.5088706, 1, 0, 0, 1, 1,
-0.01537387, 0.286, -0.7182119, 1, 0, 0, 1, 1,
-0.01430925, -0.1910449, -2.677635, 1, 0, 0, 1, 1,
-0.01134525, -0.3842735, -2.489804, 1, 0, 0, 1, 1,
-0.009954834, -0.2834089, -2.378592, 1, 0, 0, 1, 1,
-0.009944326, 0.01257881, -1.31419, 0, 0, 0, 1, 1,
-0.009068602, 0.8466201, -0.6896294, 0, 0, 0, 1, 1,
-0.004733746, -0.4212456, -4.188999, 0, 0, 0, 1, 1,
-0.002359038, 0.01807201, -0.8616402, 0, 0, 0, 1, 1,
-0.0007538004, -1.074312, -5.814884, 0, 0, 0, 1, 1,
0.000422818, -0.01899691, 2.852278, 0, 0, 0, 1, 1,
0.008718321, -0.3538003, 4.033355, 0, 0, 0, 1, 1,
0.01159695, -0.642745, 2.971147, 1, 1, 1, 1, 1,
0.01185272, -1.054158, 3.498854, 1, 1, 1, 1, 1,
0.0123389, 2.07765, 1.725118, 1, 1, 1, 1, 1,
0.01262997, 1.377382, -0.4952643, 1, 1, 1, 1, 1,
0.01387888, -0.938908, 3.758796, 1, 1, 1, 1, 1,
0.01906615, -1.386727, 3.959917, 1, 1, 1, 1, 1,
0.0202971, 0.1185411, 0.9357801, 1, 1, 1, 1, 1,
0.02281981, 0.06257526, 2.171867, 1, 1, 1, 1, 1,
0.02409752, 0.3825401, -0.2868272, 1, 1, 1, 1, 1,
0.02643583, 1.490648, 0.3176247, 1, 1, 1, 1, 1,
0.0271278, 0.6493231, 1.316465, 1, 1, 1, 1, 1,
0.02746643, 0.1799115, 1.190586, 1, 1, 1, 1, 1,
0.0320069, 0.2228972, 1.010074, 1, 1, 1, 1, 1,
0.04031442, 0.632757, -0.146244, 1, 1, 1, 1, 1,
0.04863789, -0.5231817, 3.167722, 1, 1, 1, 1, 1,
0.05461585, 1.031338, 2.862021, 0, 0, 1, 1, 1,
0.06544155, -0.9824921, 2.434778, 1, 0, 0, 1, 1,
0.0666798, -0.2761925, 3.82667, 1, 0, 0, 1, 1,
0.0669281, -2.233123, 3.350917, 1, 0, 0, 1, 1,
0.06708848, -0.2674773, 2.586689, 1, 0, 0, 1, 1,
0.06723998, 1.309309, 0.626866, 1, 0, 0, 1, 1,
0.0675886, -0.03718773, 0.380835, 0, 0, 0, 1, 1,
0.07249436, -1.33769, 0.2377666, 0, 0, 0, 1, 1,
0.07305852, 0.9590435, 0.8430922, 0, 0, 0, 1, 1,
0.0744509, 0.05974488, 0.01639159, 0, 0, 0, 1, 1,
0.07619508, -0.6166208, 2.882843, 0, 0, 0, 1, 1,
0.07774077, 0.3622103, -0.04809667, 0, 0, 0, 1, 1,
0.07911197, -0.2950929, 1.376621, 0, 0, 0, 1, 1,
0.07984473, -1.410899, 4.116568, 1, 1, 1, 1, 1,
0.0836352, 0.7502567, -1.654722, 1, 1, 1, 1, 1,
0.09384967, 0.250514, -1.634492, 1, 1, 1, 1, 1,
0.09490096, 0.9318955, -0.2935793, 1, 1, 1, 1, 1,
0.09853466, -0.08515876, 3.45806, 1, 1, 1, 1, 1,
0.1038402, 1.186695, -0.8864293, 1, 1, 1, 1, 1,
0.1079145, 0.1413142, -0.48657, 1, 1, 1, 1, 1,
0.1080746, 1.126734, -0.6164721, 1, 1, 1, 1, 1,
0.1100719, 0.07485797, 1.439475, 1, 1, 1, 1, 1,
0.1142341, -0.7120389, 2.853035, 1, 1, 1, 1, 1,
0.1155374, 2.133521, 1.177991, 1, 1, 1, 1, 1,
0.1237786, -0.05955351, 1.083553, 1, 1, 1, 1, 1,
0.1246646, 0.8437965, 1.161162, 1, 1, 1, 1, 1,
0.1302391, 0.3150047, 0.7245144, 1, 1, 1, 1, 1,
0.130385, -0.4382162, 3.713474, 1, 1, 1, 1, 1,
0.1313737, 0.0558575, 2.183775, 0, 0, 1, 1, 1,
0.1319037, 1.349939, -0.5943797, 1, 0, 0, 1, 1,
0.1319746, -1.36366, 4.146205, 1, 0, 0, 1, 1,
0.1374487, 0.442639, 0.7604976, 1, 0, 0, 1, 1,
0.1384813, -0.1586058, 3.988109, 1, 0, 0, 1, 1,
0.143948, -0.7473147, 1.576837, 1, 0, 0, 1, 1,
0.1439639, 0.1877902, 0.7500033, 0, 0, 0, 1, 1,
0.1462067, -1.006044, 4.172193, 0, 0, 0, 1, 1,
0.1503741, 1.452533, -0.1243138, 0, 0, 0, 1, 1,
0.1521628, -0.1762411, 3.499233, 0, 0, 0, 1, 1,
0.1571849, 0.3759563, 0.9826813, 0, 0, 0, 1, 1,
0.1592093, 0.6781242, -0.003524693, 0, 0, 0, 1, 1,
0.1632809, 0.617898, 1.238232, 0, 0, 0, 1, 1,
0.1671725, -0.8152335, 3.305311, 1, 1, 1, 1, 1,
0.1692833, 0.4141603, 1.077593, 1, 1, 1, 1, 1,
0.1703696, -0.8134085, 2.46857, 1, 1, 1, 1, 1,
0.1722986, 0.8094583, 1.160743, 1, 1, 1, 1, 1,
0.1749486, 0.05949446, 1.772331, 1, 1, 1, 1, 1,
0.1840826, 0.06170943, 1.883399, 1, 1, 1, 1, 1,
0.1847924, 0.2175367, 1.430075, 1, 1, 1, 1, 1,
0.1874058, -0.9671518, 2.825223, 1, 1, 1, 1, 1,
0.1941437, 0.9190189, 0.6234366, 1, 1, 1, 1, 1,
0.1956213, 0.3558498, -0.7659805, 1, 1, 1, 1, 1,
0.1982682, 0.5553451, 1.767586, 1, 1, 1, 1, 1,
0.1991778, 0.2200848, 1.361908, 1, 1, 1, 1, 1,
0.2032425, -0.8287682, 3.166139, 1, 1, 1, 1, 1,
0.207219, -0.03659084, 2.02196, 1, 1, 1, 1, 1,
0.2118786, 1.442501, 0.3393284, 1, 1, 1, 1, 1,
0.2152076, -1.043764, 3.369105, 0, 0, 1, 1, 1,
0.2153559, 0.5675207, -1.077383, 1, 0, 0, 1, 1,
0.216627, 1.280703, -0.1153171, 1, 0, 0, 1, 1,
0.2167605, -1.624766, 4.716143, 1, 0, 0, 1, 1,
0.2303238, 0.8394125, 1.866196, 1, 0, 0, 1, 1,
0.2303335, 1.313889, 0.6768551, 1, 0, 0, 1, 1,
0.2347349, 0.156582, 1.84137, 0, 0, 0, 1, 1,
0.2363679, 0.110796, 1.858298, 0, 0, 0, 1, 1,
0.2387137, 0.9730114, 0.1853521, 0, 0, 0, 1, 1,
0.2391711, 0.5931309, 0.9993944, 0, 0, 0, 1, 1,
0.2416878, -0.7931296, 2.58329, 0, 0, 0, 1, 1,
0.242382, -0.2214244, -0.01886686, 0, 0, 0, 1, 1,
0.246779, -0.2035821, 1.681767, 0, 0, 0, 1, 1,
0.2514106, -1.004214, 3.837885, 1, 1, 1, 1, 1,
0.2518442, -1.507064, 4.498473, 1, 1, 1, 1, 1,
0.2537667, -0.3554356, 1.624983, 1, 1, 1, 1, 1,
0.2551663, -0.1563614, 1.218775, 1, 1, 1, 1, 1,
0.2556203, 0.08161768, 2.068778, 1, 1, 1, 1, 1,
0.2603837, 0.5796311, 0.204786, 1, 1, 1, 1, 1,
0.2618986, -0.09292448, 2.023706, 1, 1, 1, 1, 1,
0.263309, -0.04988449, 1.408622, 1, 1, 1, 1, 1,
0.2636164, -0.6099909, 3.607111, 1, 1, 1, 1, 1,
0.2642286, 0.382586, 0.9700937, 1, 1, 1, 1, 1,
0.264536, 0.5177706, 1.296497, 1, 1, 1, 1, 1,
0.2656627, 0.5003468, 0.9141618, 1, 1, 1, 1, 1,
0.2666685, -0.4857495, 2.551769, 1, 1, 1, 1, 1,
0.2674894, 1.293491, 1.628021, 1, 1, 1, 1, 1,
0.2782785, 0.7781534, 0.08279617, 1, 1, 1, 1, 1,
0.2804799, 0.7257369, -0.0722966, 0, 0, 1, 1, 1,
0.2806739, 0.6184847, -0.4886638, 1, 0, 0, 1, 1,
0.2806978, 1.130319, 0.6845405, 1, 0, 0, 1, 1,
0.2834097, 1.798571, 0.1407702, 1, 0, 0, 1, 1,
0.295951, 0.2982639, 1.484879, 1, 0, 0, 1, 1,
0.298561, 1.290913, -0.9352783, 1, 0, 0, 1, 1,
0.303489, 1.610797, 0.5752503, 0, 0, 0, 1, 1,
0.3115741, -0.4180907, 0.8593538, 0, 0, 0, 1, 1,
0.3122874, 0.0970454, 1.014983, 0, 0, 0, 1, 1,
0.3141365, -0.6191237, 4.435429, 0, 0, 0, 1, 1,
0.3173225, 0.1180527, 1.932651, 0, 0, 0, 1, 1,
0.3187824, -1.895691, 0.7445694, 0, 0, 0, 1, 1,
0.3217658, -0.2904742, 0.4455082, 0, 0, 0, 1, 1,
0.323116, -0.2228958, 4.064045, 1, 1, 1, 1, 1,
0.3254831, -0.2961928, 2.918329, 1, 1, 1, 1, 1,
0.3276366, 0.2282525, 1.260905, 1, 1, 1, 1, 1,
0.3288667, -0.8349455, 2.548218, 1, 1, 1, 1, 1,
0.3290456, 0.3941189, -0.1129249, 1, 1, 1, 1, 1,
0.331986, 1.722295, 0.3337806, 1, 1, 1, 1, 1,
0.3341902, 1.176369, 1.373153, 1, 1, 1, 1, 1,
0.3359492, -1.835144, 3.080216, 1, 1, 1, 1, 1,
0.3363515, -1.806231, 3.69116, 1, 1, 1, 1, 1,
0.3406328, -0.2962589, 3.386602, 1, 1, 1, 1, 1,
0.342187, -0.747588, 2.414907, 1, 1, 1, 1, 1,
0.3427056, 1.986577, 0.4340588, 1, 1, 1, 1, 1,
0.3493324, -0.8526294, 2.981063, 1, 1, 1, 1, 1,
0.3516441, -0.5803552, 2.535559, 1, 1, 1, 1, 1,
0.3520854, -1.033232, 2.662606, 1, 1, 1, 1, 1,
0.3526985, -0.1185613, 1.082351, 0, 0, 1, 1, 1,
0.3611831, 0.3541722, 0.7224604, 1, 0, 0, 1, 1,
0.3618301, 1.212714, 1.255333, 1, 0, 0, 1, 1,
0.3618644, -1.326773, 3.515697, 1, 0, 0, 1, 1,
0.3620903, -0.03078603, 1.035429, 1, 0, 0, 1, 1,
0.3621658, 0.006123985, 3.526892, 1, 0, 0, 1, 1,
0.3623979, -0.06334547, 2.617746, 0, 0, 0, 1, 1,
0.36373, -0.743293, 2.116343, 0, 0, 0, 1, 1,
0.3637814, -0.3710527, 2.892937, 0, 0, 0, 1, 1,
0.365177, -1.282534, 2.568434, 0, 0, 0, 1, 1,
0.3661522, -0.4730647, 2.936441, 0, 0, 0, 1, 1,
0.3674303, -0.006486774, 1.826307, 0, 0, 0, 1, 1,
0.3686168, 2.142878, 0.6348209, 0, 0, 0, 1, 1,
0.3709455, -0.5057472, 1.253121, 1, 1, 1, 1, 1,
0.3760253, -1.760962, 1.994565, 1, 1, 1, 1, 1,
0.3762464, -1.168533, 1.06475, 1, 1, 1, 1, 1,
0.3802881, -1.464335, 2.978218, 1, 1, 1, 1, 1,
0.3872931, 1.285186, 0.3497805, 1, 1, 1, 1, 1,
0.3896938, 0.3360408, 0.0006624436, 1, 1, 1, 1, 1,
0.3899128, 0.1449168, 1.239672, 1, 1, 1, 1, 1,
0.3952723, 0.0008108019, 1.482253, 1, 1, 1, 1, 1,
0.3954201, -0.6076903, 2.752714, 1, 1, 1, 1, 1,
0.3959206, 0.006434307, -1.540738, 1, 1, 1, 1, 1,
0.3964046, -0.9627984, 1.657184, 1, 1, 1, 1, 1,
0.4027275, 2.697697, -0.6476569, 1, 1, 1, 1, 1,
0.4030964, 0.4801674, 1.484348, 1, 1, 1, 1, 1,
0.4051555, -0.0005522754, -1.840404, 1, 1, 1, 1, 1,
0.4051557, 0.5155318, 1.676377, 1, 1, 1, 1, 1,
0.4073331, -1.202627, 2.736269, 0, 0, 1, 1, 1,
0.4110524, -0.2125331, 1.74611, 1, 0, 0, 1, 1,
0.4135644, 1.246704, -0.83393, 1, 0, 0, 1, 1,
0.4274836, 0.09583837, 1.007647, 1, 0, 0, 1, 1,
0.4303213, -0.5355676, 0.9399999, 1, 0, 0, 1, 1,
0.4307168, 0.3734198, 1.257444, 1, 0, 0, 1, 1,
0.4373461, -0.734585, 2.139236, 0, 0, 0, 1, 1,
0.437539, -0.465883, 2.222616, 0, 0, 0, 1, 1,
0.4376406, -0.6455209, 1.961075, 0, 0, 0, 1, 1,
0.4386994, 1.26233, 0.3442583, 0, 0, 0, 1, 1,
0.4406542, -1.005445, 2.446959, 0, 0, 0, 1, 1,
0.4429771, -1.153532, 4.253152, 0, 0, 0, 1, 1,
0.4451471, -0.7712017, 3.982375, 0, 0, 0, 1, 1,
0.4497743, 0.5735551, -0.6241522, 1, 1, 1, 1, 1,
0.4524372, -0.1242242, 1.468557, 1, 1, 1, 1, 1,
0.4554903, -1.492388, 3.939916, 1, 1, 1, 1, 1,
0.4604649, -0.9028399, 3.207428, 1, 1, 1, 1, 1,
0.462478, -0.8594385, 3.490149, 1, 1, 1, 1, 1,
0.4644897, -1.619477, 2.644656, 1, 1, 1, 1, 1,
0.4650336, 1.028315, 1.090064, 1, 1, 1, 1, 1,
0.4669465, 0.4949458, 2.128084, 1, 1, 1, 1, 1,
0.4700932, -1.611406, 3.063318, 1, 1, 1, 1, 1,
0.4714281, -1.016096, 2.499591, 1, 1, 1, 1, 1,
0.4774782, -1.091215, 3.471822, 1, 1, 1, 1, 1,
0.4776424, -0.8452825, 3.298753, 1, 1, 1, 1, 1,
0.4783807, 1.559933, 1.298075, 1, 1, 1, 1, 1,
0.4787149, -0.9664307, 2.860631, 1, 1, 1, 1, 1,
0.4823332, 0.1351388, -0.183597, 1, 1, 1, 1, 1,
0.4880038, -0.2950329, 0.6573264, 0, 0, 1, 1, 1,
0.4930012, 1.203137, 0.6836062, 1, 0, 0, 1, 1,
0.4933335, -1.879383, 2.648948, 1, 0, 0, 1, 1,
0.498626, -0.1328929, 2.664253, 1, 0, 0, 1, 1,
0.5017174, -1.187279, 2.917855, 1, 0, 0, 1, 1,
0.5086198, 0.6827008, 0.1333509, 1, 0, 0, 1, 1,
0.5091609, -0.3600895, 0.03888585, 0, 0, 0, 1, 1,
0.5130711, 1.444564, 0.808344, 0, 0, 0, 1, 1,
0.5203521, -0.4024665, 3.784141, 0, 0, 0, 1, 1,
0.5220267, 2.140935, 2.57284, 0, 0, 0, 1, 1,
0.5225292, 0.2397579, 0.3718452, 0, 0, 0, 1, 1,
0.5226425, -0.6934938, 3.234994, 0, 0, 0, 1, 1,
0.52957, -0.3710483, 1.643662, 0, 0, 0, 1, 1,
0.5299702, -1.838185, 3.821171, 1, 1, 1, 1, 1,
0.5305641, 0.4543256, 0.7747212, 1, 1, 1, 1, 1,
0.5401229, 1.109783, -0.8675226, 1, 1, 1, 1, 1,
0.5403168, 0.8360266, -0.2499114, 1, 1, 1, 1, 1,
0.5407398, -2.490257, 2.161172, 1, 1, 1, 1, 1,
0.5417364, -0.6067716, 2.013532, 1, 1, 1, 1, 1,
0.555303, -0.1383246, 1.154162, 1, 1, 1, 1, 1,
0.5556597, -1.347327, 2.612114, 1, 1, 1, 1, 1,
0.5558389, -1.385954, 3.752316, 1, 1, 1, 1, 1,
0.5602447, 0.7570701, 1.760435, 1, 1, 1, 1, 1,
0.5612094, -0.1393482, 2.348135, 1, 1, 1, 1, 1,
0.5614941, 0.8734282, 0.6122621, 1, 1, 1, 1, 1,
0.5639687, -0.439387, 0.8931505, 1, 1, 1, 1, 1,
0.565564, -0.9225667, 2.18829, 1, 1, 1, 1, 1,
0.5680021, -2.278753, 3.575706, 1, 1, 1, 1, 1,
0.5699058, -0.6204799, 3.448858, 0, 0, 1, 1, 1,
0.5700447, -0.8175529, 1.890386, 1, 0, 0, 1, 1,
0.5752171, 1.397125, -0.3236258, 1, 0, 0, 1, 1,
0.5794148, 0.9056958, 1.143408, 1, 0, 0, 1, 1,
0.5805262, -0.2707889, 1.741755, 1, 0, 0, 1, 1,
0.5835849, 0.526317, 0.6642045, 1, 0, 0, 1, 1,
0.5884891, -0.9658531, 1.000979, 0, 0, 0, 1, 1,
0.5925976, -1.279111, 2.836863, 0, 0, 0, 1, 1,
0.59343, -0.2521803, 1.014365, 0, 0, 0, 1, 1,
0.5990877, -0.2131006, 1.101046, 0, 0, 0, 1, 1,
0.600233, -1.003155, 2.762621, 0, 0, 0, 1, 1,
0.6026729, 0.2148436, 2.107897, 0, 0, 0, 1, 1,
0.6095978, 0.4953019, 1.766349, 0, 0, 0, 1, 1,
0.6125528, 0.6509874, 0.8372492, 1, 1, 1, 1, 1,
0.6138195, -1.35346, 2.93474, 1, 1, 1, 1, 1,
0.6192376, -1.700669, 2.669768, 1, 1, 1, 1, 1,
0.6195555, 0.5252337, 1.940958, 1, 1, 1, 1, 1,
0.621704, 0.4440717, 1.535099, 1, 1, 1, 1, 1,
0.6243199, 1.439811, -0.119964, 1, 1, 1, 1, 1,
0.6265404, -0.9718025, 2.468772, 1, 1, 1, 1, 1,
0.6295407, -0.3897234, 2.692686, 1, 1, 1, 1, 1,
0.6307237, -0.374652, 1.553424, 1, 1, 1, 1, 1,
0.6323193, -0.9451463, 3.914078, 1, 1, 1, 1, 1,
0.6329039, -0.8818817, 1.110038, 1, 1, 1, 1, 1,
0.6368914, 1.747193, 1.689248, 1, 1, 1, 1, 1,
0.64572, 0.5211829, 0.1625623, 1, 1, 1, 1, 1,
0.6458673, -0.0218055, 1.959109, 1, 1, 1, 1, 1,
0.6480224, -1.132736, 3.548571, 1, 1, 1, 1, 1,
0.6480563, -0.3360073, 2.348676, 0, 0, 1, 1, 1,
0.6520638, -1.109118, 1.857689, 1, 0, 0, 1, 1,
0.6538422, -1.490716, 2.587203, 1, 0, 0, 1, 1,
0.6553124, 0.357848, 1.274875, 1, 0, 0, 1, 1,
0.6640834, -0.5378729, 2.223995, 1, 0, 0, 1, 1,
0.6670396, -0.9009359, 1.861967, 1, 0, 0, 1, 1,
0.6741385, -1.485082, 3.659836, 0, 0, 0, 1, 1,
0.6794426, -0.3254406, 1.669388, 0, 0, 0, 1, 1,
0.6805782, -0.03753446, 0.9719171, 0, 0, 0, 1, 1,
0.6810033, -1.623036, 3.039021, 0, 0, 0, 1, 1,
0.6824632, -0.3019511, 1.016505, 0, 0, 0, 1, 1,
0.6834641, -0.3453513, 2.972103, 0, 0, 0, 1, 1,
0.6843215, -0.3852667, 2.617297, 0, 0, 0, 1, 1,
0.6868976, -0.08300649, 2.857126, 1, 1, 1, 1, 1,
0.6912709, 0.7690604, 3.602836, 1, 1, 1, 1, 1,
0.6927469, 0.5180188, 1.794713, 1, 1, 1, 1, 1,
0.6937603, -0.3935649, 3.46764, 1, 1, 1, 1, 1,
0.6972238, 0.007993437, 1.217628, 1, 1, 1, 1, 1,
0.7010884, 3.442449, -0.09815543, 1, 1, 1, 1, 1,
0.7045724, -1.148517, 1.981957, 1, 1, 1, 1, 1,
0.7086471, 0.8655687, 2.365598, 1, 1, 1, 1, 1,
0.7125201, 1.493961, 0.5789839, 1, 1, 1, 1, 1,
0.7228477, 0.1709122, 1.643744, 1, 1, 1, 1, 1,
0.7249392, 2.617714, 0.827875, 1, 1, 1, 1, 1,
0.7305077, 0.2725922, 2.5343, 1, 1, 1, 1, 1,
0.7308242, 0.02000923, 0.472244, 1, 1, 1, 1, 1,
0.7453005, -0.1650549, 0.3218477, 1, 1, 1, 1, 1,
0.7496212, -0.7838837, 1.514187, 1, 1, 1, 1, 1,
0.750561, -1.127098, 2.904519, 0, 0, 1, 1, 1,
0.7545072, -0.4248949, 1.086906, 1, 0, 0, 1, 1,
0.7549172, -0.6207662, 1.416484, 1, 0, 0, 1, 1,
0.7608092, -0.3597448, 0.8739884, 1, 0, 0, 1, 1,
0.762917, -0.1309209, 1.784136, 1, 0, 0, 1, 1,
0.7724296, 0.8924813, 1.247858, 1, 0, 0, 1, 1,
0.7738919, 0.556299, -0.7825839, 0, 0, 0, 1, 1,
0.7885305, 0.2993652, 1.203898, 0, 0, 0, 1, 1,
0.7904783, -1.009128, 1.965091, 0, 0, 0, 1, 1,
0.7916451, 0.219752, 1.874157, 0, 0, 0, 1, 1,
0.7936639, 1.350267, 0.09521269, 0, 0, 0, 1, 1,
0.7973104, -0.3770885, 2.208709, 0, 0, 0, 1, 1,
0.8077606, 0.6421667, 1.320716, 0, 0, 0, 1, 1,
0.8088427, 1.348269, 0.4792738, 1, 1, 1, 1, 1,
0.8102907, -0.7466219, 3.347955, 1, 1, 1, 1, 1,
0.8168523, -0.3032259, 1.942363, 1, 1, 1, 1, 1,
0.8211519, -0.5644594, 0.8928033, 1, 1, 1, 1, 1,
0.8244871, -0.3116555, 2.721659, 1, 1, 1, 1, 1,
0.830353, -2.346405, 5.320131, 1, 1, 1, 1, 1,
0.8332534, -0.1792807, 1.097723, 1, 1, 1, 1, 1,
0.8382386, 0.0673527, 3.286738, 1, 1, 1, 1, 1,
0.8397335, -0.9519988, -0.1709623, 1, 1, 1, 1, 1,
0.840084, -0.856258, 1.282166, 1, 1, 1, 1, 1,
0.8437148, -0.2145254, 0.9907318, 1, 1, 1, 1, 1,
0.8469152, 0.4110333, 1.420859, 1, 1, 1, 1, 1,
0.848832, 2.023789, 0.3826345, 1, 1, 1, 1, 1,
0.8491394, -0.3363011, 2.001205, 1, 1, 1, 1, 1,
0.8525347, 0.653026, 1.632547, 1, 1, 1, 1, 1,
0.8532006, -0.8989819, 1.315911, 0, 0, 1, 1, 1,
0.8542863, 1.750306, -0.4041976, 1, 0, 0, 1, 1,
0.8561143, -0.8128241, 2.333829, 1, 0, 0, 1, 1,
0.8563188, 2.376507, -0.7898179, 1, 0, 0, 1, 1,
0.8571978, 1.76892, 1.444395, 1, 0, 0, 1, 1,
0.860745, -0.02555521, 1.096076, 1, 0, 0, 1, 1,
0.8638614, -0.5332466, 3.454048, 0, 0, 0, 1, 1,
0.8702688, -0.3832198, 1.712012, 0, 0, 0, 1, 1,
0.8722691, -0.7589176, 3.369567, 0, 0, 0, 1, 1,
0.8734563, 1.165171, 1.98706, 0, 0, 0, 1, 1,
0.8741875, 0.7705116, -0.5487033, 0, 0, 0, 1, 1,
0.8742321, -0.6961071, 3.04021, 0, 0, 0, 1, 1,
0.875823, -1.701285, 3.199232, 0, 0, 0, 1, 1,
0.8809885, -1.797897, 4.141847, 1, 1, 1, 1, 1,
0.8880566, -1.006705, 0.8118446, 1, 1, 1, 1, 1,
0.8903556, 0.1020402, 2.979993, 1, 1, 1, 1, 1,
0.8968614, -0.3605665, 2.064453, 1, 1, 1, 1, 1,
0.9035331, -0.2772525, 1.163507, 1, 1, 1, 1, 1,
0.911483, -0.04082122, 1.176123, 1, 1, 1, 1, 1,
0.9122204, 0.6865239, 1.378323, 1, 1, 1, 1, 1,
0.9124917, 0.1224065, 0.347626, 1, 1, 1, 1, 1,
0.9131742, 0.6118955, 0.6729466, 1, 1, 1, 1, 1,
0.9150935, 1.524282, 1.807002, 1, 1, 1, 1, 1,
0.916221, 1.237193, 1.195402, 1, 1, 1, 1, 1,
0.9210543, 0.1308907, 0.5675411, 1, 1, 1, 1, 1,
0.9264486, 0.02216475, 3.210822, 1, 1, 1, 1, 1,
0.9430847, 1.861806, -0.3064615, 1, 1, 1, 1, 1,
0.9444405, 2.234287, 0.7103456, 1, 1, 1, 1, 1,
0.9529192, -1.58837, 2.243679, 0, 0, 1, 1, 1,
0.9550333, 0.1348106, 1.732152, 1, 0, 0, 1, 1,
0.9648916, -2.007476, 2.035963, 1, 0, 0, 1, 1,
0.9653962, -2.67258, 3.659237, 1, 0, 0, 1, 1,
0.968905, 0.2445183, 1.377736, 1, 0, 0, 1, 1,
0.9711425, 0.06887379, 1.531105, 1, 0, 0, 1, 1,
0.9713005, -0.2538365, 4.992039, 0, 0, 0, 1, 1,
0.9739988, 0.8435164, 1.015331, 0, 0, 0, 1, 1,
0.9764449, 0.2893968, 1.122453, 0, 0, 0, 1, 1,
0.9790801, -1.416588, 3.824211, 0, 0, 0, 1, 1,
0.9796036, 0.07523057, -0.5286858, 0, 0, 0, 1, 1,
0.9799687, -0.7609809, 1.640383, 0, 0, 0, 1, 1,
0.9879887, 0.4429095, 0.48621, 0, 0, 0, 1, 1,
0.991751, 1.145123, 2.250471, 1, 1, 1, 1, 1,
0.9925923, -0.3305608, 1.427278, 1, 1, 1, 1, 1,
0.9938838, 1.434209, 1.116064, 1, 1, 1, 1, 1,
0.9967449, 0.3831766, 0.709864, 1, 1, 1, 1, 1,
1.018874, 1.432448, 1.419031, 1, 1, 1, 1, 1,
1.02536, -0.4264202, 1.577193, 1, 1, 1, 1, 1,
1.034194, -1.319193, 1.489031, 1, 1, 1, 1, 1,
1.035861, -0.6795578, 2.591794, 1, 1, 1, 1, 1,
1.044661, 0.7704443, 1.236557, 1, 1, 1, 1, 1,
1.04989, -0.3188759, 2.015402, 1, 1, 1, 1, 1,
1.050793, -0.6960128, 1.366812, 1, 1, 1, 1, 1,
1.052425, -0.7958734, 3.051287, 1, 1, 1, 1, 1,
1.053153, 1.420128, 2.035393, 1, 1, 1, 1, 1,
1.055606, -1.047402, 2.371549, 1, 1, 1, 1, 1,
1.058361, 0.9345901, -0.1471118, 1, 1, 1, 1, 1,
1.060423, 1.991848, 0.5527216, 0, 0, 1, 1, 1,
1.060815, 0.2588637, 2.234834, 1, 0, 0, 1, 1,
1.067809, 0.1531259, 1.731755, 1, 0, 0, 1, 1,
1.076313, 0.9153551, 0.8461717, 1, 0, 0, 1, 1,
1.077805, -1.380311, 1.85421, 1, 0, 0, 1, 1,
1.078327, 1.864541, 2.148874, 1, 0, 0, 1, 1,
1.092025, -0.7505504, 2.330755, 0, 0, 0, 1, 1,
1.105148, -0.1040119, 2.513547, 0, 0, 0, 1, 1,
1.108845, -0.05093712, 2.690856, 0, 0, 0, 1, 1,
1.117361, 1.203117, 1.629147, 0, 0, 0, 1, 1,
1.119369, 0.9753247, 0.8007209, 0, 0, 0, 1, 1,
1.129107, -1.127711, 2.037039, 0, 0, 0, 1, 1,
1.131951, 0.199949, 2.086421, 0, 0, 0, 1, 1,
1.136467, 1.048886, 1.185805, 1, 1, 1, 1, 1,
1.140418, -0.8328167, 1.768123, 1, 1, 1, 1, 1,
1.14556, 0.9573585, 2.408889, 1, 1, 1, 1, 1,
1.152106, 2.578376, 0.1830496, 1, 1, 1, 1, 1,
1.154826, 1.035373, 0.870684, 1, 1, 1, 1, 1,
1.158013, -1.36743, 0.9746305, 1, 1, 1, 1, 1,
1.176764, -0.0333759, 0.5556035, 1, 1, 1, 1, 1,
1.177223, 0.7979088, 1.18554, 1, 1, 1, 1, 1,
1.178754, 1.025469, -0.06375454, 1, 1, 1, 1, 1,
1.181768, 1.189796, 1.596342, 1, 1, 1, 1, 1,
1.183933, -0.8900829, 4.114715, 1, 1, 1, 1, 1,
1.187122, 1.937656, 0.8992638, 1, 1, 1, 1, 1,
1.192097, -0.8992501, 4.544766, 1, 1, 1, 1, 1,
1.193603, 0.4713323, 0.7367988, 1, 1, 1, 1, 1,
1.197875, -0.02705955, 1.655866, 1, 1, 1, 1, 1,
1.200253, -0.78499, 2.964088, 0, 0, 1, 1, 1,
1.208642, -1.036015, 1.764858, 1, 0, 0, 1, 1,
1.229797, 0.5273801, 1.16336, 1, 0, 0, 1, 1,
1.230434, 0.8514653, 0.6850795, 1, 0, 0, 1, 1,
1.232642, 0.7505131, 1.811762, 1, 0, 0, 1, 1,
1.233342, 1.894921, 1.715063, 1, 0, 0, 1, 1,
1.236586, 1.86086, -0.9504536, 0, 0, 0, 1, 1,
1.242554, -0.1841979, 1.202181, 0, 0, 0, 1, 1,
1.259994, 0.7535529, 1.949632, 0, 0, 0, 1, 1,
1.262826, -0.1671958, 3.481758, 0, 0, 0, 1, 1,
1.272188, -0.7887027, 1.317541, 0, 0, 0, 1, 1,
1.273546, 0.342913, 1.523, 0, 0, 0, 1, 1,
1.274553, 0.37161, 3.323395, 0, 0, 0, 1, 1,
1.275936, -0.7524242, 1.685581, 1, 1, 1, 1, 1,
1.276077, 0.2980888, 1.713961, 1, 1, 1, 1, 1,
1.286253, -0.1046444, 1.769017, 1, 1, 1, 1, 1,
1.296613, 0.9969658, 0.651304, 1, 1, 1, 1, 1,
1.301324, -0.5600051, 1.084545, 1, 1, 1, 1, 1,
1.301917, 0.3822992, -0.3273924, 1, 1, 1, 1, 1,
1.320695, 1.294811, 0.453822, 1, 1, 1, 1, 1,
1.328839, 1.21119, 1.51079, 1, 1, 1, 1, 1,
1.338656, -1.018798, 2.05228, 1, 1, 1, 1, 1,
1.340179, 0.6156017, -0.06009778, 1, 1, 1, 1, 1,
1.348629, -1.754702, 2.450682, 1, 1, 1, 1, 1,
1.353678, 0.1999677, 1.313329, 1, 1, 1, 1, 1,
1.354428, 0.08424453, 2.028864, 1, 1, 1, 1, 1,
1.356223, -2.877453, 2.512005, 1, 1, 1, 1, 1,
1.358678, 1.381002, 1.828895, 1, 1, 1, 1, 1,
1.372493, -0.9001873, 2.198101, 0, 0, 1, 1, 1,
1.387024, 0.8285197, 2.307346, 1, 0, 0, 1, 1,
1.389535, -1.695802, 2.41712, 1, 0, 0, 1, 1,
1.410275, -0.02873386, -0.1449745, 1, 0, 0, 1, 1,
1.430809, 0.03892656, 0.4054546, 1, 0, 0, 1, 1,
1.436348, -1.123548, 1.754533, 1, 0, 0, 1, 1,
1.443089, 0.9173853, 1.050309, 0, 0, 0, 1, 1,
1.443112, 2.174085, 0.8697782, 0, 0, 0, 1, 1,
1.449675, 1.746493, -0.6173161, 0, 0, 0, 1, 1,
1.46102, 0.6827731, 2.122004, 0, 0, 0, 1, 1,
1.469178, 0.4174824, 2.481924, 0, 0, 0, 1, 1,
1.485017, -0.3013706, 1.937897, 0, 0, 0, 1, 1,
1.491401, -0.8371797, -0.3077088, 0, 0, 0, 1, 1,
1.497376, 0.5606681, 1.972903, 1, 1, 1, 1, 1,
1.498589, 0.2256655, -0.04827127, 1, 1, 1, 1, 1,
1.505855, -0.2483771, 2.634744, 1, 1, 1, 1, 1,
1.510835, -1.285811, 3.130286, 1, 1, 1, 1, 1,
1.51333, -0.1052499, 1.377444, 1, 1, 1, 1, 1,
1.5238, -0.2128602, 1.540992, 1, 1, 1, 1, 1,
1.530559, 1.19804, 1.132914, 1, 1, 1, 1, 1,
1.538095, -0.4337619, 2.676934, 1, 1, 1, 1, 1,
1.539792, -0.1968675, 3.370318, 1, 1, 1, 1, 1,
1.539963, -1.336489, 2.035855, 1, 1, 1, 1, 1,
1.561246, -0.190586, 2.137233, 1, 1, 1, 1, 1,
1.572522, -1.379432, 1.338852, 1, 1, 1, 1, 1,
1.588074, -1.461316, 2.677349, 1, 1, 1, 1, 1,
1.62828, -1.131573, 3.87142, 1, 1, 1, 1, 1,
1.630864, 2.429774, 1.056467, 1, 1, 1, 1, 1,
1.635817, 0.6742959, 1.060147, 0, 0, 1, 1, 1,
1.656739, -0.8555957, 1.020873, 1, 0, 0, 1, 1,
1.670033, 0.6590979, 1.462891, 1, 0, 0, 1, 1,
1.703206, 0.2123358, 0.260842, 1, 0, 0, 1, 1,
1.70972, 0.3591301, 2.429861, 1, 0, 0, 1, 1,
1.714276, -0.3977834, 0.3897272, 1, 0, 0, 1, 1,
1.778406, -0.5945089, 2.467952, 0, 0, 0, 1, 1,
1.820479, 2.033577, 1.130481, 0, 0, 0, 1, 1,
1.841731, 0.65944, 1.551321, 0, 0, 0, 1, 1,
1.849711, 0.2679304, 0.8603148, 0, 0, 0, 1, 1,
1.860011, 0.3224188, -0.8332999, 0, 0, 0, 1, 1,
1.876094, 2.671178, -0.148139, 0, 0, 0, 1, 1,
1.876845, 0.9703134, 3.688261, 0, 0, 0, 1, 1,
1.877523, -0.8584345, 1.163661, 1, 1, 1, 1, 1,
1.881427, 0.4460928, 3.2818, 1, 1, 1, 1, 1,
1.884353, -0.4300401, 2.278718, 1, 1, 1, 1, 1,
1.886682, -0.6736878, -0.5262023, 1, 1, 1, 1, 1,
1.894634, 0.1645769, 1.80736, 1, 1, 1, 1, 1,
1.921204, -0.4549842, 2.835801, 1, 1, 1, 1, 1,
1.925254, -0.1149527, 0.9834017, 1, 1, 1, 1, 1,
1.929462, -0.3662196, 1.168133, 1, 1, 1, 1, 1,
1.949775, 0.365337, 1.359086, 1, 1, 1, 1, 1,
1.978919, 0.1543298, 2.583494, 1, 1, 1, 1, 1,
2.005758, 1.279884, 1.916811, 1, 1, 1, 1, 1,
2.047348, -0.4041948, 0.1834833, 1, 1, 1, 1, 1,
2.068753, -0.1762665, 2.124401, 1, 1, 1, 1, 1,
2.089038, 1.607353, -0.2994061, 1, 1, 1, 1, 1,
2.125419, -1.0369, 2.319804, 1, 1, 1, 1, 1,
2.215862, -0.4941557, 1.650444, 0, 0, 1, 1, 1,
2.237043, -1.278, 3.522882, 1, 0, 0, 1, 1,
2.244986, -1.259273, 1.785316, 1, 0, 0, 1, 1,
2.246785, -1.791492, 2.692603, 1, 0, 0, 1, 1,
2.282085, 0.9354477, 0.565268, 1, 0, 0, 1, 1,
2.296988, -0.9066508, 2.418588, 1, 0, 0, 1, 1,
2.318465, 1.553653, 0.1782409, 0, 0, 0, 1, 1,
2.320542, -0.1036062, -0.8471487, 0, 0, 0, 1, 1,
2.375957, 1.531184, 1.543804, 0, 0, 0, 1, 1,
2.412056, -0.6096811, -0.1774586, 0, 0, 0, 1, 1,
2.486552, -0.8344038, 1.542615, 0, 0, 0, 1, 1,
2.534261, -1.235559, -0.9215733, 0, 0, 0, 1, 1,
2.547437, -0.5068123, 2.201751, 0, 0, 0, 1, 1,
2.657843, 0.1922623, 2.035258, 1, 1, 1, 1, 1,
2.810169, -0.9736556, 0.7210134, 1, 1, 1, 1, 1,
2.883797, -0.6823341, 1.497002, 1, 1, 1, 1, 1,
2.896929, -0.1881505, 3.336684, 1, 1, 1, 1, 1,
3.163802, 0.03367802, 2.911187, 1, 1, 1, 1, 1,
3.279062, -0.7749455, 2.660798, 1, 1, 1, 1, 1,
3.314866, 0.2438043, 0.3689906, 1, 1, 1, 1, 1
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
var radius = 9.900652;
var distance = 34.77562;
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
mvMatrix.translate( -0.003565311, -0.05027461, 0.2473764 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.77562);
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
