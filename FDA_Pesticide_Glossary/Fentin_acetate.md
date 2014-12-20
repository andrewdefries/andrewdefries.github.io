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
-2.597989, 0.2405047, -1.009655, 1, 0, 0, 1,
-2.506844, 0.4650835, -2.134067, 1, 0.007843138, 0, 1,
-2.45202, -0.2644586, -3.65946, 1, 0.01176471, 0, 1,
-2.432244, 0.07187319, -3.538687, 1, 0.01960784, 0, 1,
-2.368392, -0.1890309, -1.44338, 1, 0.02352941, 0, 1,
-2.36785, 0.3394487, -1.350284, 1, 0.03137255, 0, 1,
-2.35649, 0.3894808, 0.03338927, 1, 0.03529412, 0, 1,
-2.354333, -0.7998507, -2.043299, 1, 0.04313726, 0, 1,
-2.331541, 1.553213, -1.721106, 1, 0.04705882, 0, 1,
-2.3241, 0.1149945, -1.839882, 1, 0.05490196, 0, 1,
-2.282895, 0.3314074, -2.334015, 1, 0.05882353, 0, 1,
-2.27442, -0.3840314, -1.199673, 1, 0.06666667, 0, 1,
-2.190723, 0.08834803, -1.438007, 1, 0.07058824, 0, 1,
-2.150787, -0.6125971, -2.196471, 1, 0.07843138, 0, 1,
-2.142574, 0.08756753, -1.020902, 1, 0.08235294, 0, 1,
-2.138008, 1.394184, -2.703569, 1, 0.09019608, 0, 1,
-2.137576, 1.751137, -0.6172984, 1, 0.09411765, 0, 1,
-2.130323, 0.7974118, 0.03705795, 1, 0.1019608, 0, 1,
-2.12062, 0.9139953, 0.4940225, 1, 0.1098039, 0, 1,
-2.090194, 0.6246967, -1.76527, 1, 0.1137255, 0, 1,
-2.063443, -0.4376817, -2.68549, 1, 0.1215686, 0, 1,
-2.038537, 2.428526, -1.506995, 1, 0.1254902, 0, 1,
-1.965498, 0.04639766, -2.800634, 1, 0.1333333, 0, 1,
-1.964944, -0.9321253, -2.572018, 1, 0.1372549, 0, 1,
-1.95769, 0.9957916, -0.2100403, 1, 0.145098, 0, 1,
-1.934875, 0.5694439, -1.277401, 1, 0.1490196, 0, 1,
-1.886188, 0.1771372, -1.083108, 1, 0.1568628, 0, 1,
-1.880372, 1.160324, -1.062384, 1, 0.1607843, 0, 1,
-1.876543, -1.343355, -1.838035, 1, 0.1686275, 0, 1,
-1.862757, 0.118515, -1.183461, 1, 0.172549, 0, 1,
-1.81869, -0.505522, -1.830799, 1, 0.1803922, 0, 1,
-1.81625, -0.1296801, -3.66713, 1, 0.1843137, 0, 1,
-1.80051, -0.01829158, -0.5163764, 1, 0.1921569, 0, 1,
-1.799302, 1.02038, -1.494939, 1, 0.1960784, 0, 1,
-1.796252, -0.5057182, -1.304317, 1, 0.2039216, 0, 1,
-1.794619, -0.6712279, -1.363986, 1, 0.2117647, 0, 1,
-1.784129, 1.353128, -2.189464, 1, 0.2156863, 0, 1,
-1.780183, -1.905482, -2.963769, 1, 0.2235294, 0, 1,
-1.771059, 0.3080519, -0.8455775, 1, 0.227451, 0, 1,
-1.745669, 2.098444, 0.4851714, 1, 0.2352941, 0, 1,
-1.745485, 0.8731275, -0.4356907, 1, 0.2392157, 0, 1,
-1.741434, 0.5773851, -1.632703, 1, 0.2470588, 0, 1,
-1.731701, -0.1427201, -1.288362, 1, 0.2509804, 0, 1,
-1.710156, 0.2403762, -1.672456, 1, 0.2588235, 0, 1,
-1.69985, 2.529739, 0.05820989, 1, 0.2627451, 0, 1,
-1.699777, -0.662441, -1.408959, 1, 0.2705882, 0, 1,
-1.695318, -0.5223444, -0.6533539, 1, 0.2745098, 0, 1,
-1.69032, 0.09331676, -1.936237, 1, 0.282353, 0, 1,
-1.689959, -0.6678079, -2.117213, 1, 0.2862745, 0, 1,
-1.664216, 0.831064, -3.25262, 1, 0.2941177, 0, 1,
-1.663955, 1.628283, -1.489604, 1, 0.3019608, 0, 1,
-1.64681, 0.2781441, -3.229734, 1, 0.3058824, 0, 1,
-1.634942, -0.2966909, -1.745326, 1, 0.3137255, 0, 1,
-1.608332, 1.529233, -1.05645, 1, 0.3176471, 0, 1,
-1.600225, 0.799845, 0.1532102, 1, 0.3254902, 0, 1,
-1.58628, -0.1338112, -2.938092, 1, 0.3294118, 0, 1,
-1.584395, -0.9297069, -3.651924, 1, 0.3372549, 0, 1,
-1.577186, 1.30964, 0.6926115, 1, 0.3411765, 0, 1,
-1.56647, -0.1481712, -2.587235, 1, 0.3490196, 0, 1,
-1.560996, 0.2443669, -1.068981, 1, 0.3529412, 0, 1,
-1.551932, 0.1967877, -0.4012587, 1, 0.3607843, 0, 1,
-1.548451, -0.4259642, 0.4871109, 1, 0.3647059, 0, 1,
-1.536022, 1.139122, -1.261973, 1, 0.372549, 0, 1,
-1.523721, 1.264209, -1.242758, 1, 0.3764706, 0, 1,
-1.516155, 1.229726, -0.3520248, 1, 0.3843137, 0, 1,
-1.508023, -0.4591279, -1.292169, 1, 0.3882353, 0, 1,
-1.504698, -1.093207, -3.053486, 1, 0.3960784, 0, 1,
-1.500107, 1.576869, 1.319087, 1, 0.4039216, 0, 1,
-1.494709, 0.1645714, -1.340781, 1, 0.4078431, 0, 1,
-1.477971, -0.03123542, -3.31423, 1, 0.4156863, 0, 1,
-1.474953, -0.7451051, -4.465225, 1, 0.4196078, 0, 1,
-1.465409, -0.1629235, -3.425964, 1, 0.427451, 0, 1,
-1.462164, 1.26016, -1.614497, 1, 0.4313726, 0, 1,
-1.457311, 0.6791447, -0.7910023, 1, 0.4392157, 0, 1,
-1.453272, -0.9730828, -2.430813, 1, 0.4431373, 0, 1,
-1.434848, 0.413855, -3.487925, 1, 0.4509804, 0, 1,
-1.418606, -1.118208, -3.23194, 1, 0.454902, 0, 1,
-1.409804, -0.4589112, -1.281153, 1, 0.4627451, 0, 1,
-1.407534, 0.09153052, -1.749246, 1, 0.4666667, 0, 1,
-1.4061, -0.8885338, -2.290511, 1, 0.4745098, 0, 1,
-1.392174, -0.2779975, -2.921725, 1, 0.4784314, 0, 1,
-1.388637, 0.5107427, -2.854263, 1, 0.4862745, 0, 1,
-1.384627, -0.6303015, -1.554543, 1, 0.4901961, 0, 1,
-1.375999, -0.7086869, -1.521359, 1, 0.4980392, 0, 1,
-1.368051, 0.684521, -1.475303, 1, 0.5058824, 0, 1,
-1.366386, -1.364846, -1.990624, 1, 0.509804, 0, 1,
-1.365872, -0.4320577, -1.054945, 1, 0.5176471, 0, 1,
-1.362774, 0.2121019, -1.088392, 1, 0.5215687, 0, 1,
-1.362488, -0.4459379, -1.917426, 1, 0.5294118, 0, 1,
-1.351237, 2.044418, -0.6232228, 1, 0.5333334, 0, 1,
-1.325669, -0.7469434, -2.874404, 1, 0.5411765, 0, 1,
-1.306323, -2.173736, -1.775819, 1, 0.5450981, 0, 1,
-1.304036, 0.761567, -3.403325, 1, 0.5529412, 0, 1,
-1.298985, 0.5974753, -1.909741, 1, 0.5568628, 0, 1,
-1.296777, 0.9873482, -2.393251, 1, 0.5647059, 0, 1,
-1.295323, 0.3672691, -0.6372018, 1, 0.5686275, 0, 1,
-1.291818, -0.7829744, -1.686605, 1, 0.5764706, 0, 1,
-1.28093, 0.04123297, -2.073212, 1, 0.5803922, 0, 1,
-1.276985, 0.05612482, -0.8794023, 1, 0.5882353, 0, 1,
-1.276948, 0.6060039, 1.656743, 1, 0.5921569, 0, 1,
-1.270045, -0.2324852, -1.195075, 1, 0.6, 0, 1,
-1.267805, -0.1680901, -3.237526, 1, 0.6078432, 0, 1,
-1.264167, -0.7603448, -4.209548, 1, 0.6117647, 0, 1,
-1.264121, 0.05123782, 0.1209302, 1, 0.6196079, 0, 1,
-1.263186, 0.5906242, -1.299372, 1, 0.6235294, 0, 1,
-1.262715, 0.4338245, -1.298021, 1, 0.6313726, 0, 1,
-1.250696, -0.594904, -0.8431771, 1, 0.6352941, 0, 1,
-1.245906, 0.01365764, -2.822888, 1, 0.6431373, 0, 1,
-1.238775, 1.219883, -0.2958258, 1, 0.6470588, 0, 1,
-1.226264, 1.041773, -1.096101, 1, 0.654902, 0, 1,
-1.224933, 0.9104939, -2.178202, 1, 0.6588235, 0, 1,
-1.223097, -1.310352, -2.140833, 1, 0.6666667, 0, 1,
-1.221392, -0.2541277, -1.681773, 1, 0.6705883, 0, 1,
-1.21893, 2.389337, 0.3693289, 1, 0.6784314, 0, 1,
-1.20163, -0.3606736, -2.48647, 1, 0.682353, 0, 1,
-1.192, -0.3468091, -0.2634734, 1, 0.6901961, 0, 1,
-1.184552, -0.3317038, -3.159724, 1, 0.6941177, 0, 1,
-1.178859, 0.1705763, 0.4875678, 1, 0.7019608, 0, 1,
-1.176737, 0.6006792, -1.572501, 1, 0.7098039, 0, 1,
-1.175971, -0.731979, -1.773102, 1, 0.7137255, 0, 1,
-1.166009, -1.010889, -2.322962, 1, 0.7215686, 0, 1,
-1.162013, -0.1119576, -2.591949, 1, 0.7254902, 0, 1,
-1.161974, -0.4085415, -1.626552, 1, 0.7333333, 0, 1,
-1.157035, -0.3694734, -0.805209, 1, 0.7372549, 0, 1,
-1.156428, -0.427568, -1.360935, 1, 0.7450981, 0, 1,
-1.141248, -0.8349562, -1.183822, 1, 0.7490196, 0, 1,
-1.133068, 0.5333249, -1.588243, 1, 0.7568628, 0, 1,
-1.128317, -0.204127, -3.20392, 1, 0.7607843, 0, 1,
-1.126227, -0.301061, -2.195318, 1, 0.7686275, 0, 1,
-1.125109, 0.4257238, -1.265202, 1, 0.772549, 0, 1,
-1.124592, 0.6204641, -0.9228283, 1, 0.7803922, 0, 1,
-1.123217, 1.45151, -2.443412, 1, 0.7843137, 0, 1,
-1.112119, -0.7146859, -2.620336, 1, 0.7921569, 0, 1,
-1.111539, -0.2148359, -1.112552, 1, 0.7960784, 0, 1,
-1.111465, -0.1262114, -2.606307, 1, 0.8039216, 0, 1,
-1.109857, -0.8453329, -1.755334, 1, 0.8117647, 0, 1,
-1.107971, 1.536153, -1.41105, 1, 0.8156863, 0, 1,
-1.105547, -0.6129254, -2.924973, 1, 0.8235294, 0, 1,
-1.100555, -0.1781166, -2.277543, 1, 0.827451, 0, 1,
-1.090136, 1.375926, -0.6530316, 1, 0.8352941, 0, 1,
-1.085314, 1.083094, -0.5186679, 1, 0.8392157, 0, 1,
-1.084345, 0.05652912, -3.59397, 1, 0.8470588, 0, 1,
-1.079039, -0.9577673, -2.374008, 1, 0.8509804, 0, 1,
-1.068577, -1.40556, -1.758033, 1, 0.8588235, 0, 1,
-1.065725, 0.0978017, -1.064755, 1, 0.8627451, 0, 1,
-1.060125, 0.7296459, -0.9328716, 1, 0.8705882, 0, 1,
-1.05873, -0.2511694, -0.7228158, 1, 0.8745098, 0, 1,
-1.057636, 0.9650746, -0.7782812, 1, 0.8823529, 0, 1,
-1.055688, -1.868183, -0.6634209, 1, 0.8862745, 0, 1,
-1.054577, -0.02550059, -2.097346, 1, 0.8941177, 0, 1,
-1.052735, 0.04903682, -2.166885, 1, 0.8980392, 0, 1,
-1.047449, 0.9023896, -0.9799778, 1, 0.9058824, 0, 1,
-1.044108, -0.7196002, -1.341084, 1, 0.9137255, 0, 1,
-1.043366, -0.4252552, -0.8968043, 1, 0.9176471, 0, 1,
-1.037684, -0.09645871, -2.509562, 1, 0.9254902, 0, 1,
-1.026, -1.448269, -5.276182, 1, 0.9294118, 0, 1,
-1.024866, -0.1293186, -2.98288, 1, 0.9372549, 0, 1,
-1.024459, 0.1820169, -1.313142, 1, 0.9411765, 0, 1,
-1.021205, 0.1771293, -0.02177421, 1, 0.9490196, 0, 1,
-1.018096, -0.3038374, -2.515193, 1, 0.9529412, 0, 1,
-1.017303, 1.975984, -3.02626, 1, 0.9607843, 0, 1,
-1.016282, -0.02389107, -0.08834365, 1, 0.9647059, 0, 1,
-1.015224, -2.735678, -1.640467, 1, 0.972549, 0, 1,
-1.009004, 0.09317821, -1.563532, 1, 0.9764706, 0, 1,
-1.007962, -0.7102121, -1.344096, 1, 0.9843137, 0, 1,
-1.004442, -0.02671675, -3.096193, 1, 0.9882353, 0, 1,
-0.9984539, 0.3312605, -3.573535, 1, 0.9960784, 0, 1,
-0.9762486, -1.252045, -3.954631, 0.9960784, 1, 0, 1,
-0.9740885, 1.681314, -0.338162, 0.9921569, 1, 0, 1,
-0.9698871, -0.3166696, 0.8784457, 0.9843137, 1, 0, 1,
-0.9686946, -1.07766, -2.927861, 0.9803922, 1, 0, 1,
-0.9643091, -0.6945316, -2.503073, 0.972549, 1, 0, 1,
-0.95832, -0.5979683, -0.6240916, 0.9686275, 1, 0, 1,
-0.9560914, 0.9802482, -1.041691, 0.9607843, 1, 0, 1,
-0.9534637, 1.891392, -1.538627, 0.9568627, 1, 0, 1,
-0.9411759, 0.3257539, -0.8743427, 0.9490196, 1, 0, 1,
-0.9347082, -1.385671, 0.1912057, 0.945098, 1, 0, 1,
-0.9309542, -0.5284396, -3.648706, 0.9372549, 1, 0, 1,
-0.9276133, 0.2536197, -0.4679882, 0.9333333, 1, 0, 1,
-0.9256101, -0.764709, -1.155802, 0.9254902, 1, 0, 1,
-0.9253044, -0.3058904, -3.915827, 0.9215686, 1, 0, 1,
-0.9195503, -0.761958, -0.8058838, 0.9137255, 1, 0, 1,
-0.9168065, 0.4257897, -2.880831, 0.9098039, 1, 0, 1,
-0.9151194, -1.372121, -3.18142, 0.9019608, 1, 0, 1,
-0.9139326, -0.8641798, -2.486039, 0.8941177, 1, 0, 1,
-0.9137641, -1.56721, -2.519346, 0.8901961, 1, 0, 1,
-0.9127173, -1.21317, -2.58634, 0.8823529, 1, 0, 1,
-0.9099424, -0.5830647, -1.660294, 0.8784314, 1, 0, 1,
-0.9083359, -0.01052096, -2.166759, 0.8705882, 1, 0, 1,
-0.9042094, 0.1530496, -1.842418, 0.8666667, 1, 0, 1,
-0.9040407, -0.2505526, -2.290467, 0.8588235, 1, 0, 1,
-0.8955204, -0.01753556, -2.143499, 0.854902, 1, 0, 1,
-0.8873339, -0.6055911, -1.118809, 0.8470588, 1, 0, 1,
-0.8860893, 0.6002234, -0.8923031, 0.8431373, 1, 0, 1,
-0.8806613, -0.06249388, -2.981913, 0.8352941, 1, 0, 1,
-0.8732598, -0.0870455, -1.145177, 0.8313726, 1, 0, 1,
-0.8663135, 0.8596974, 0.6382996, 0.8235294, 1, 0, 1,
-0.855024, 0.6144997, -0.9710209, 0.8196079, 1, 0, 1,
-0.8383814, -1.407039, -1.969288, 0.8117647, 1, 0, 1,
-0.8353767, 1.584089, -1.280681, 0.8078431, 1, 0, 1,
-0.8322265, -0.09798394, -2.396199, 0.8, 1, 0, 1,
-0.8296197, 0.6264619, -1.996842, 0.7921569, 1, 0, 1,
-0.819733, 1.621386, -2.119074, 0.7882353, 1, 0, 1,
-0.8177515, -1.150889, -3.018802, 0.7803922, 1, 0, 1,
-0.8172958, -1.623939, -3.969777, 0.7764706, 1, 0, 1,
-0.8157415, -0.2657138, -2.197587, 0.7686275, 1, 0, 1,
-0.814096, 0.2750146, -0.1371754, 0.7647059, 1, 0, 1,
-0.8094969, 0.4322695, -0.8572978, 0.7568628, 1, 0, 1,
-0.8080424, 0.278363, -2.374897, 0.7529412, 1, 0, 1,
-0.805687, 0.6586328, -0.3775576, 0.7450981, 1, 0, 1,
-0.8046623, 0.6387453, 0.09349612, 0.7411765, 1, 0, 1,
-0.8030517, 1.478705, -1.690787, 0.7333333, 1, 0, 1,
-0.7992308, -0.181024, -2.533714, 0.7294118, 1, 0, 1,
-0.7949569, 0.9400271, -1.821946, 0.7215686, 1, 0, 1,
-0.7941963, 0.3153072, -1.012243, 0.7176471, 1, 0, 1,
-0.7917311, -0.828051, -3.685449, 0.7098039, 1, 0, 1,
-0.7892604, -0.08870479, -0.07491335, 0.7058824, 1, 0, 1,
-0.7876105, -1.204624, 0.04317793, 0.6980392, 1, 0, 1,
-0.7872091, 0.2258348, -1.641373, 0.6901961, 1, 0, 1,
-0.7866687, 0.277694, -1.402313, 0.6862745, 1, 0, 1,
-0.7786854, -0.7223604, -2.035402, 0.6784314, 1, 0, 1,
-0.7785434, 1.246019, -1.750453, 0.6745098, 1, 0, 1,
-0.7748875, 2.162538, 0.3524616, 0.6666667, 1, 0, 1,
-0.7725846, 0.6823701, -1.807897, 0.6627451, 1, 0, 1,
-0.7692463, -0.7840532, -0.9502523, 0.654902, 1, 0, 1,
-0.7572, -0.4732204, -1.368887, 0.6509804, 1, 0, 1,
-0.7477756, -1.511052, -2.203197, 0.6431373, 1, 0, 1,
-0.7428933, -0.1219971, -1.117017, 0.6392157, 1, 0, 1,
-0.742596, 0.5475819, -1.610063, 0.6313726, 1, 0, 1,
-0.7412938, 1.722164, -0.5671399, 0.627451, 1, 0, 1,
-0.7382703, -0.9670405, -3.143608, 0.6196079, 1, 0, 1,
-0.7314376, 0.02500471, -2.557664, 0.6156863, 1, 0, 1,
-0.728897, -1.047297, -1.947489, 0.6078432, 1, 0, 1,
-0.7281837, -0.01443472, -0.8440769, 0.6039216, 1, 0, 1,
-0.7249622, 0.03872154, -2.748143, 0.5960785, 1, 0, 1,
-0.7211466, -0.7111545, -2.430854, 0.5882353, 1, 0, 1,
-0.7165711, 1.140565, -1.190836, 0.5843138, 1, 0, 1,
-0.7162855, 1.895789, 0.05485192, 0.5764706, 1, 0, 1,
-0.7162442, 1.114125, -0.2500497, 0.572549, 1, 0, 1,
-0.7122527, -1.335703, -1.885043, 0.5647059, 1, 0, 1,
-0.7002307, 1.001616, -1.682326, 0.5607843, 1, 0, 1,
-0.6972718, -0.681933, -2.450655, 0.5529412, 1, 0, 1,
-0.6889301, -0.4175739, -4.120543, 0.5490196, 1, 0, 1,
-0.6869086, 0.4888426, -2.440188, 0.5411765, 1, 0, 1,
-0.6869041, 0.4409458, -1.711937, 0.5372549, 1, 0, 1,
-0.6846198, -0.08214773, -1.855682, 0.5294118, 1, 0, 1,
-0.6805285, 0.03417075, -3.286067, 0.5254902, 1, 0, 1,
-0.6791851, -0.8570355, -3.087538, 0.5176471, 1, 0, 1,
-0.6787939, 1.004608, 0.847625, 0.5137255, 1, 0, 1,
-0.6755059, 2.083208, 0.7614098, 0.5058824, 1, 0, 1,
-0.6731153, -0.495897, -2.820649, 0.5019608, 1, 0, 1,
-0.6674712, 1.368624, 1.251384, 0.4941176, 1, 0, 1,
-0.6645055, 0.3328258, 0.592209, 0.4862745, 1, 0, 1,
-0.6606947, -1.17522, -1.727658, 0.4823529, 1, 0, 1,
-0.6563187, 0.3979911, -0.3583731, 0.4745098, 1, 0, 1,
-0.6518035, -0.01549881, -1.966387, 0.4705882, 1, 0, 1,
-0.6513961, -1.10128, -3.413043, 0.4627451, 1, 0, 1,
-0.6494057, 0.7036841, -0.2832484, 0.4588235, 1, 0, 1,
-0.6465418, -1.71266, -2.661865, 0.4509804, 1, 0, 1,
-0.6424382, -0.2147674, -2.032584, 0.4470588, 1, 0, 1,
-0.6373615, -0.8932089, -3.882575, 0.4392157, 1, 0, 1,
-0.6358294, -1.034953, -0.9154885, 0.4352941, 1, 0, 1,
-0.6260647, -1.116309, -2.956883, 0.427451, 1, 0, 1,
-0.6217095, 0.3677618, -3.130463, 0.4235294, 1, 0, 1,
-0.6210681, -1.028992, -1.020112, 0.4156863, 1, 0, 1,
-0.6199312, -0.7524906, -2.642909, 0.4117647, 1, 0, 1,
-0.6177771, 0.685356, 1.718487, 0.4039216, 1, 0, 1,
-0.6119933, 0.1850536, -0.2544492, 0.3960784, 1, 0, 1,
-0.6099038, -1.217474, -2.969476, 0.3921569, 1, 0, 1,
-0.6025897, 0.3054127, -0.705344, 0.3843137, 1, 0, 1,
-0.6018891, 1.244121, -1.570068, 0.3803922, 1, 0, 1,
-0.5997577, 0.713272, -1.638988, 0.372549, 1, 0, 1,
-0.5977364, 0.6096995, 0.361559, 0.3686275, 1, 0, 1,
-0.597561, -0.2352389, -2.299654, 0.3607843, 1, 0, 1,
-0.5973582, -0.2600076, -3.335914, 0.3568628, 1, 0, 1,
-0.5970767, -2.217677, -3.497379, 0.3490196, 1, 0, 1,
-0.5968689, 0.2641499, -1.428915, 0.345098, 1, 0, 1,
-0.5937952, -0.774857, -3.536244, 0.3372549, 1, 0, 1,
-0.5822787, 0.4821535, 0.1541497, 0.3333333, 1, 0, 1,
-0.5771711, -0.1712618, -1.384174, 0.3254902, 1, 0, 1,
-0.575144, -0.7093614, -2.465584, 0.3215686, 1, 0, 1,
-0.5669138, -1.271454, -2.355599, 0.3137255, 1, 0, 1,
-0.566229, 0.2559542, -0.6727766, 0.3098039, 1, 0, 1,
-0.5635443, 0.06752687, 0.1746847, 0.3019608, 1, 0, 1,
-0.562985, -1.981106, -3.937733, 0.2941177, 1, 0, 1,
-0.5618539, -1.892538, -3.921986, 0.2901961, 1, 0, 1,
-0.5616783, -0.555033, -1.842404, 0.282353, 1, 0, 1,
-0.5509831, -0.7303582, -1.415111, 0.2784314, 1, 0, 1,
-0.5468988, -0.1226156, -1.515888, 0.2705882, 1, 0, 1,
-0.5457748, 1.330985, -0.4378819, 0.2666667, 1, 0, 1,
-0.5421817, 0.325579, -0.63339, 0.2588235, 1, 0, 1,
-0.5410498, 0.2427836, 0.9806685, 0.254902, 1, 0, 1,
-0.5400528, -1.925471, -2.17861, 0.2470588, 1, 0, 1,
-0.5371797, 1.595453, -0.8230937, 0.2431373, 1, 0, 1,
-0.5366338, -0.5355978, -1.799264, 0.2352941, 1, 0, 1,
-0.534408, 1.920407, -0.3935745, 0.2313726, 1, 0, 1,
-0.5276802, -0.2467594, -2.588222, 0.2235294, 1, 0, 1,
-0.5272289, -2.264058, -2.372411, 0.2196078, 1, 0, 1,
-0.525304, 0.5412458, -2.085429, 0.2117647, 1, 0, 1,
-0.5244372, -2.045714, -3.874209, 0.2078431, 1, 0, 1,
-0.5238013, 1.015087, 1.113545, 0.2, 1, 0, 1,
-0.5226744, -0.7470327, -1.313516, 0.1921569, 1, 0, 1,
-0.5225304, -1.208469, -2.667693, 0.1882353, 1, 0, 1,
-0.5215104, -1.442181, -1.837996, 0.1803922, 1, 0, 1,
-0.5193677, -0.4116527, -1.652384, 0.1764706, 1, 0, 1,
-0.5129625, 0.5312694, 0.5160431, 0.1686275, 1, 0, 1,
-0.5115386, -0.1734469, -0.315331, 0.1647059, 1, 0, 1,
-0.5099013, -1.113664, -3.323258, 0.1568628, 1, 0, 1,
-0.5054383, 0.3761924, -3.180609, 0.1529412, 1, 0, 1,
-0.5042922, 0.02959539, -3.437195, 0.145098, 1, 0, 1,
-0.5003752, -1.614352, -3.079532, 0.1411765, 1, 0, 1,
-0.4952802, -0.7143261, -1.92845, 0.1333333, 1, 0, 1,
-0.4948626, -0.6178838, -3.228421, 0.1294118, 1, 0, 1,
-0.4938037, 0.7923202, -0.6554606, 0.1215686, 1, 0, 1,
-0.4921313, 0.9767047, 0.2365285, 0.1176471, 1, 0, 1,
-0.4914707, 0.1314776, -1.125887, 0.1098039, 1, 0, 1,
-0.4907951, -1.138372, -2.489624, 0.1058824, 1, 0, 1,
-0.4906293, -0.5351076, 0.1478378, 0.09803922, 1, 0, 1,
-0.4884173, -0.395259, -2.065658, 0.09019608, 1, 0, 1,
-0.4876782, 0.009669973, -2.472419, 0.08627451, 1, 0, 1,
-0.4851861, 2.05925, 0.1064375, 0.07843138, 1, 0, 1,
-0.4759301, 0.130586, -0.4868109, 0.07450981, 1, 0, 1,
-0.4741217, 0.3141491, -3.736846, 0.06666667, 1, 0, 1,
-0.4738172, -0.2907077, -1.370079, 0.0627451, 1, 0, 1,
-0.4688655, -0.6481031, -2.773501, 0.05490196, 1, 0, 1,
-0.4665232, 0.8017721, -1.307209, 0.05098039, 1, 0, 1,
-0.466284, -0.6165694, -2.712194, 0.04313726, 1, 0, 1,
-0.464707, 0.7581827, -2.094232, 0.03921569, 1, 0, 1,
-0.4644987, -0.3440203, -1.064717, 0.03137255, 1, 0, 1,
-0.4596457, -0.08778179, -2.567764, 0.02745098, 1, 0, 1,
-0.4576842, 0.1737493, -1.868181, 0.01960784, 1, 0, 1,
-0.4543258, 1.273081, -1.411739, 0.01568628, 1, 0, 1,
-0.451017, -0.8563396, -2.918889, 0.007843138, 1, 0, 1,
-0.4505518, 0.01631725, -1.921127, 0.003921569, 1, 0, 1,
-0.449522, -0.5998212, -3.606308, 0, 1, 0.003921569, 1,
-0.4492936, -0.1053179, -0.7444525, 0, 1, 0.01176471, 1,
-0.4463576, -0.2298418, -1.342631, 0, 1, 0.01568628, 1,
-0.4449112, -1.773437, -2.19354, 0, 1, 0.02352941, 1,
-0.4419824, 0.7331171, -1.879338, 0, 1, 0.02745098, 1,
-0.4416294, 0.1317618, -3.297234, 0, 1, 0.03529412, 1,
-0.4264436, 0.3564118, -0.7900514, 0, 1, 0.03921569, 1,
-0.4251369, 0.6131986, -0.6881992, 0, 1, 0.04705882, 1,
-0.4236893, -0.2878671, -2.407104, 0, 1, 0.05098039, 1,
-0.4207178, 2.327858, 1.3685, 0, 1, 0.05882353, 1,
-0.4177827, 0.04646612, -2.268778, 0, 1, 0.0627451, 1,
-0.4174592, 0.1581, -0.5685254, 0, 1, 0.07058824, 1,
-0.4168492, 0.8002386, 0.01591741, 0, 1, 0.07450981, 1,
-0.4159109, 0.2901846, -1.358258, 0, 1, 0.08235294, 1,
-0.4100914, 0.4851056, -2.085056, 0, 1, 0.08627451, 1,
-0.4086601, 0.147268, 0.2030293, 0, 1, 0.09411765, 1,
-0.4081702, 1.224586, -0.6072153, 0, 1, 0.1019608, 1,
-0.3941801, 1.495365, -0.5149276, 0, 1, 0.1058824, 1,
-0.3938466, 0.1449796, -1.568464, 0, 1, 0.1137255, 1,
-0.3861872, 0.13655, -0.7555143, 0, 1, 0.1176471, 1,
-0.3856924, 1.946591, -1.139076, 0, 1, 0.1254902, 1,
-0.3772964, -1.149761, -1.950486, 0, 1, 0.1294118, 1,
-0.3768154, -0.2488854, -3.909012, 0, 1, 0.1372549, 1,
-0.3724015, 0.7356489, -2.79524, 0, 1, 0.1411765, 1,
-0.3711207, 1.669336, 0.1769204, 0, 1, 0.1490196, 1,
-0.3671583, 0.9702976, -0.9309087, 0, 1, 0.1529412, 1,
-0.3653118, -0.9099109, -2.06741, 0, 1, 0.1607843, 1,
-0.3649474, 0.4301853, -0.523699, 0, 1, 0.1647059, 1,
-0.359617, -0.344409, -1.450248, 0, 1, 0.172549, 1,
-0.3586726, -0.11269, -1.123033, 0, 1, 0.1764706, 1,
-0.3572354, -0.8535798, 0.2033482, 0, 1, 0.1843137, 1,
-0.3551807, -0.7984855, -2.364985, 0, 1, 0.1882353, 1,
-0.3520916, -1.05601, -2.321605, 0, 1, 0.1960784, 1,
-0.3500574, 0.1405831, -1.216112, 0, 1, 0.2039216, 1,
-0.3492354, -0.1224026, -3.24534, 0, 1, 0.2078431, 1,
-0.3456131, 1.298371, -0.4565389, 0, 1, 0.2156863, 1,
-0.3438222, -0.7609993, -2.407822, 0, 1, 0.2196078, 1,
-0.3348713, -0.06931844, -1.201021, 0, 1, 0.227451, 1,
-0.334222, -0.4689547, -3.673316, 0, 1, 0.2313726, 1,
-0.3307949, -0.5184236, -3.495072, 0, 1, 0.2392157, 1,
-0.3242731, -0.8667323, -2.712603, 0, 1, 0.2431373, 1,
-0.3203486, 1.671677, -1.202427, 0, 1, 0.2509804, 1,
-0.319183, 1.263173, -0.176132, 0, 1, 0.254902, 1,
-0.3167265, -0.7614138, -3.185169, 0, 1, 0.2627451, 1,
-0.3135183, 0.7577447, -0.3086312, 0, 1, 0.2666667, 1,
-0.3114179, 0.6794026, -0.8690441, 0, 1, 0.2745098, 1,
-0.3107174, 0.1851989, -1.386559, 0, 1, 0.2784314, 1,
-0.3046244, -0.6871209, -3.96765, 0, 1, 0.2862745, 1,
-0.2967263, -2.568333, -2.403819, 0, 1, 0.2901961, 1,
-0.2950291, -0.2319773, -0.4056743, 0, 1, 0.2980392, 1,
-0.2929282, 0.9482245, -2.437557, 0, 1, 0.3058824, 1,
-0.2896883, -0.5051444, -2.911361, 0, 1, 0.3098039, 1,
-0.2835594, 0.1113671, -2.226967, 0, 1, 0.3176471, 1,
-0.2817591, 0.3641919, -0.8181046, 0, 1, 0.3215686, 1,
-0.2805798, 1.468045, 0.7793775, 0, 1, 0.3294118, 1,
-0.2776172, -0.6227391, -0.7678589, 0, 1, 0.3333333, 1,
-0.2736191, -1.419418, -2.656898, 0, 1, 0.3411765, 1,
-0.2735479, 0.2951232, -1.159482, 0, 1, 0.345098, 1,
-0.2727484, -0.3866217, -3.051693, 0, 1, 0.3529412, 1,
-0.2720247, 0.5247876, -0.4630857, 0, 1, 0.3568628, 1,
-0.2715853, -0.8432261, -2.23528, 0, 1, 0.3647059, 1,
-0.2685857, -0.08842274, -1.347055, 0, 1, 0.3686275, 1,
-0.2680762, -0.08487587, -3.663046, 0, 1, 0.3764706, 1,
-0.2660565, 0.7876661, 0.9612669, 0, 1, 0.3803922, 1,
-0.2657434, -2.390044, -2.502746, 0, 1, 0.3882353, 1,
-0.2645381, 0.07301121, -0.2520158, 0, 1, 0.3921569, 1,
-0.263546, 1.058335, -0.5656264, 0, 1, 0.4, 1,
-0.2598649, 1.856314, -2.517068, 0, 1, 0.4078431, 1,
-0.2582583, 0.5379463, -1.828565, 0, 1, 0.4117647, 1,
-0.2576495, 1.695337, -0.8942766, 0, 1, 0.4196078, 1,
-0.2535398, -1.53398, -3.023787, 0, 1, 0.4235294, 1,
-0.2526157, 1.130791, -0.6237206, 0, 1, 0.4313726, 1,
-0.2516039, -0.03765607, -2.780626, 0, 1, 0.4352941, 1,
-0.2515881, 0.1735902, -1.715061, 0, 1, 0.4431373, 1,
-0.2422777, -1.408631, -3.180071, 0, 1, 0.4470588, 1,
-0.2400852, 0.2174217, -1.562154, 0, 1, 0.454902, 1,
-0.2382741, -0.2853482, -3.567783, 0, 1, 0.4588235, 1,
-0.2373276, 0.2304065, 1.448835, 0, 1, 0.4666667, 1,
-0.2358235, 0.623264, 0.4885102, 0, 1, 0.4705882, 1,
-0.2336147, 0.1020913, -0.2664742, 0, 1, 0.4784314, 1,
-0.2329127, -0.1242987, -2.565261, 0, 1, 0.4823529, 1,
-0.2328333, -0.07331107, -0.6668654, 0, 1, 0.4901961, 1,
-0.2324631, 1.094465, -0.9447129, 0, 1, 0.4941176, 1,
-0.2270039, -0.05754344, -0.1273442, 0, 1, 0.5019608, 1,
-0.2211301, -0.8086013, -4.645977, 0, 1, 0.509804, 1,
-0.215498, -0.2908387, -1.531548, 0, 1, 0.5137255, 1,
-0.2147882, 0.5775752, 0.005610885, 0, 1, 0.5215687, 1,
-0.2144951, 0.5517316, 2.254957, 0, 1, 0.5254902, 1,
-0.213378, 0.5599191, 0.4672418, 0, 1, 0.5333334, 1,
-0.2078269, -0.4458615, -1.6259, 0, 1, 0.5372549, 1,
-0.2078035, 1.130478, 0.2554948, 0, 1, 0.5450981, 1,
-0.20695, 0.4688333, -0.01891042, 0, 1, 0.5490196, 1,
-0.2064224, 0.04545999, -0.9712127, 0, 1, 0.5568628, 1,
-0.1955327, 1.454704, 0.01110176, 0, 1, 0.5607843, 1,
-0.1894917, -0.9712409, -2.25681, 0, 1, 0.5686275, 1,
-0.1891278, -1.283477, -2.059492, 0, 1, 0.572549, 1,
-0.1876107, -2.008556, -3.969944, 0, 1, 0.5803922, 1,
-0.1871565, -0.5427514, -3.521423, 0, 1, 0.5843138, 1,
-0.1862339, -0.1625029, -1.69181, 0, 1, 0.5921569, 1,
-0.1778755, 0.5174428, 0.7645341, 0, 1, 0.5960785, 1,
-0.1741789, 1.860608, -0.3431383, 0, 1, 0.6039216, 1,
-0.1694309, -0.48042, -1.766003, 0, 1, 0.6117647, 1,
-0.1684573, -2.750685, -4.018464, 0, 1, 0.6156863, 1,
-0.1654983, -0.5273558, -3.936052, 0, 1, 0.6235294, 1,
-0.1606633, 0.7871364, 1.489024, 0, 1, 0.627451, 1,
-0.1594371, 0.2077705, 0.3433413, 0, 1, 0.6352941, 1,
-0.1572303, -1.674918, -2.205921, 0, 1, 0.6392157, 1,
-0.1567821, -0.07467999, -1.828206, 0, 1, 0.6470588, 1,
-0.1563777, 0.02561006, -1.831002, 0, 1, 0.6509804, 1,
-0.1548211, -0.9582896, -3.765957, 0, 1, 0.6588235, 1,
-0.1487491, -0.9906229, -2.927876, 0, 1, 0.6627451, 1,
-0.1471452, -2.132912, -3.796693, 0, 1, 0.6705883, 1,
-0.1434226, 0.7527435, -0.05164669, 0, 1, 0.6745098, 1,
-0.1429252, 0.5761981, -1.017078, 0, 1, 0.682353, 1,
-0.1428138, 0.2053209, 0.3383997, 0, 1, 0.6862745, 1,
-0.1322949, 0.2570361, -1.043937, 0, 1, 0.6941177, 1,
-0.1205739, 0.8648786, -0.2322408, 0, 1, 0.7019608, 1,
-0.1197956, -1.479404, -2.871855, 0, 1, 0.7058824, 1,
-0.1161102, -0.9718508, -5.313763, 0, 1, 0.7137255, 1,
-0.1134332, -1.376675, -3.461108, 0, 1, 0.7176471, 1,
-0.1122244, -1.078156, -3.95857, 0, 1, 0.7254902, 1,
-0.1094161, -1.405765, -3.563305, 0, 1, 0.7294118, 1,
-0.1087727, -0.1141305, -2.775353, 0, 1, 0.7372549, 1,
-0.1071489, -0.5706277, -3.273555, 0, 1, 0.7411765, 1,
-0.1029969, 0.5275691, -0.02258401, 0, 1, 0.7490196, 1,
-0.1014475, -0.5569842, -2.879462, 0, 1, 0.7529412, 1,
-0.09969065, 0.8003715, 0.9878699, 0, 1, 0.7607843, 1,
-0.09895721, 1.099247, -1.403046, 0, 1, 0.7647059, 1,
-0.09772541, -0.251713, -3.135382, 0, 1, 0.772549, 1,
-0.09291426, -0.2246688, -2.840673, 0, 1, 0.7764706, 1,
-0.09200943, 0.6629729, 1.004374, 0, 1, 0.7843137, 1,
-0.08798298, -0.8885413, -3.175277, 0, 1, 0.7882353, 1,
-0.08709233, 0.5021389, 0.8887967, 0, 1, 0.7960784, 1,
-0.08228445, 1.748255, 1.553177, 0, 1, 0.8039216, 1,
-0.08054861, -0.6074726, -2.527251, 0, 1, 0.8078431, 1,
-0.07631154, 1.481721, 2.44253, 0, 1, 0.8156863, 1,
-0.07594482, 2.428478, -0.1317756, 0, 1, 0.8196079, 1,
-0.07572414, -1.808338, -3.435597, 0, 1, 0.827451, 1,
-0.07411746, 0.00896707, -1.343109, 0, 1, 0.8313726, 1,
-0.07325506, -0.9900768, -3.526392, 0, 1, 0.8392157, 1,
-0.07046907, 0.7216476, 1.335901, 0, 1, 0.8431373, 1,
-0.06912667, -0.9868824, -3.453631, 0, 1, 0.8509804, 1,
-0.0676984, 0.7574898, 0.1783879, 0, 1, 0.854902, 1,
-0.06506781, -0.4394691, -2.206248, 0, 1, 0.8627451, 1,
-0.0618195, -0.6681417, -5.107339, 0, 1, 0.8666667, 1,
-0.06144562, 0.1623916, 0.3450075, 0, 1, 0.8745098, 1,
-0.05792383, 0.8912018, -0.6474009, 0, 1, 0.8784314, 1,
-0.05635993, 2.160286, 0.2716182, 0, 1, 0.8862745, 1,
-0.05342406, 0.3593983, 1.974425, 0, 1, 0.8901961, 1,
-0.04884506, 0.3900034, 0.2292661, 0, 1, 0.8980392, 1,
-0.0428297, 0.7742144, 0.3937853, 0, 1, 0.9058824, 1,
-0.0414773, 1.51334, -0.370844, 0, 1, 0.9098039, 1,
-0.03927337, 1.003496, -2.521089, 0, 1, 0.9176471, 1,
-0.0377952, -0.4279428, -4.207182, 0, 1, 0.9215686, 1,
-0.03652042, -2.446793, -4.124139, 0, 1, 0.9294118, 1,
-0.03513769, 0.1455813, -1.724005, 0, 1, 0.9333333, 1,
-0.03382836, -1.141531, -2.145276, 0, 1, 0.9411765, 1,
-0.03193398, 0.7660176, 0.06723119, 0, 1, 0.945098, 1,
-0.03041179, 1.263469, 1.658033, 0, 1, 0.9529412, 1,
-0.02517915, 0.3725253, -0.5682812, 0, 1, 0.9568627, 1,
-0.02294209, -0.3079641, -2.644407, 0, 1, 0.9647059, 1,
-0.02074986, -0.02537257, -1.117155, 0, 1, 0.9686275, 1,
-0.01744514, 1.390122, 0.2189372, 0, 1, 0.9764706, 1,
-0.01618086, 2.161907, 0.4528272, 0, 1, 0.9803922, 1,
-0.01444928, -0.2076874, -4.708511, 0, 1, 0.9882353, 1,
-0.01218129, 0.1813888, -0.08050688, 0, 1, 0.9921569, 1,
-0.01123522, -0.5711078, -1.93525, 0, 1, 1, 1,
-0.00988315, -0.7369954, -3.320138, 0, 0.9921569, 1, 1,
-0.0002565822, -0.1481543, -2.968564, 0, 0.9882353, 1, 1,
0.003156169, -0.4294573, 4.212482, 0, 0.9803922, 1, 1,
0.008099736, 0.5811706, 0.08302893, 0, 0.9764706, 1, 1,
0.009712511, 0.1374611, -0.05401251, 0, 0.9686275, 1, 1,
0.01416774, 0.1902213, -0.8406879, 0, 0.9647059, 1, 1,
0.01898894, -1.14278, 3.40083, 0, 0.9568627, 1, 1,
0.01948785, -0.00772534, 0.8422412, 0, 0.9529412, 1, 1,
0.02002756, 0.8395333, -0.9258937, 0, 0.945098, 1, 1,
0.02682776, 1.764105, -0.04232394, 0, 0.9411765, 1, 1,
0.02716306, 0.9143059, 0.6275324, 0, 0.9333333, 1, 1,
0.02845971, -0.6107274, 1.869333, 0, 0.9294118, 1, 1,
0.03537529, 1.620575, 0.3518473, 0, 0.9215686, 1, 1,
0.03633695, -0.8483261, 5.456362, 0, 0.9176471, 1, 1,
0.03682005, -1.061159, 2.458627, 0, 0.9098039, 1, 1,
0.03740419, 1.85692, -0.152758, 0, 0.9058824, 1, 1,
0.04029787, -0.4621833, 3.789845, 0, 0.8980392, 1, 1,
0.04037141, -0.1289426, 2.153577, 0, 0.8901961, 1, 1,
0.04151879, -1.317444, 1.098871, 0, 0.8862745, 1, 1,
0.04254278, -1.011719, 1.8765, 0, 0.8784314, 1, 1,
0.04315958, -2.058484, 3.423883, 0, 0.8745098, 1, 1,
0.04434257, -0.1841212, 2.187148, 0, 0.8666667, 1, 1,
0.04447768, -0.8467624, 1.730215, 0, 0.8627451, 1, 1,
0.04818587, 0.3047594, -1.269953, 0, 0.854902, 1, 1,
0.04921632, 0.9281627, -0.4636005, 0, 0.8509804, 1, 1,
0.05107542, -1.086277, 2.306213, 0, 0.8431373, 1, 1,
0.05497295, -1.267599, 2.297853, 0, 0.8392157, 1, 1,
0.06117426, -2.126721, 2.064892, 0, 0.8313726, 1, 1,
0.06715538, -0.6033146, 3.890443, 0, 0.827451, 1, 1,
0.06881307, 0.8771216, -1.953097, 0, 0.8196079, 1, 1,
0.07058545, 0.8957977, -0.3985859, 0, 0.8156863, 1, 1,
0.0710192, -0.2161747, 2.481247, 0, 0.8078431, 1, 1,
0.07626425, -0.4965889, 3.473811, 0, 0.8039216, 1, 1,
0.0917277, 0.01507209, 2.32659, 0, 0.7960784, 1, 1,
0.09186839, -0.4134401, 2.849875, 0, 0.7882353, 1, 1,
0.09418234, -0.6555846, 3.450164, 0, 0.7843137, 1, 1,
0.0957856, -0.9546214, 0.990472, 0, 0.7764706, 1, 1,
0.09745475, -0.7187887, 1.935537, 0, 0.772549, 1, 1,
0.1052705, 0.5463539, -0.1391071, 0, 0.7647059, 1, 1,
0.107095, 2.54459, 0.3784859, 0, 0.7607843, 1, 1,
0.1074689, -0.2263148, 2.165498, 0, 0.7529412, 1, 1,
0.1082662, 1.745217, 3.153634, 0, 0.7490196, 1, 1,
0.1113631, -0.2605871, 1.597625, 0, 0.7411765, 1, 1,
0.1116425, -0.3580226, 3.78445, 0, 0.7372549, 1, 1,
0.1122612, -1.196965, 3.132117, 0, 0.7294118, 1, 1,
0.1141511, 0.771701, -2.123333, 0, 0.7254902, 1, 1,
0.1150272, -0.4159794, 2.037154, 0, 0.7176471, 1, 1,
0.1150374, 0.3320867, 0.4386371, 0, 0.7137255, 1, 1,
0.1184037, 0.4174089, -1.436171, 0, 0.7058824, 1, 1,
0.1194656, 1.354676, -0.5968894, 0, 0.6980392, 1, 1,
0.1228, 1.183523, 0.8837243, 0, 0.6941177, 1, 1,
0.1229903, -0.3803666, 3.847677, 0, 0.6862745, 1, 1,
0.1238385, 0.8273363, -0.8218381, 0, 0.682353, 1, 1,
0.125525, -1.364782, 3.796727, 0, 0.6745098, 1, 1,
0.1258839, -0.5532545, 4.413629, 0, 0.6705883, 1, 1,
0.1320083, -0.412854, 2.701445, 0, 0.6627451, 1, 1,
0.1347245, -0.09086558, 1.983158, 0, 0.6588235, 1, 1,
0.1353982, 0.5431343, 0.6202108, 0, 0.6509804, 1, 1,
0.1379015, -0.09985647, 1.891668, 0, 0.6470588, 1, 1,
0.1400284, 1.712591, -0.03966039, 0, 0.6392157, 1, 1,
0.1430104, -1.02154, 3.461013, 0, 0.6352941, 1, 1,
0.1430372, 1.950658, 1.833234, 0, 0.627451, 1, 1,
0.1431623, 0.1126375, 0.9544454, 0, 0.6235294, 1, 1,
0.1489599, 0.9023297, -0.725381, 0, 0.6156863, 1, 1,
0.149091, -1.821448, 3.913033, 0, 0.6117647, 1, 1,
0.150657, 1.434733, 2.67178, 0, 0.6039216, 1, 1,
0.1575712, 0.2711415, 0.04069981, 0, 0.5960785, 1, 1,
0.1598549, -0.3982565, 2.115244, 0, 0.5921569, 1, 1,
0.161184, -1.613724, 3.327726, 0, 0.5843138, 1, 1,
0.1615369, 0.464662, 0.158612, 0, 0.5803922, 1, 1,
0.162503, -0.4076152, 1.294894, 0, 0.572549, 1, 1,
0.1650809, -0.4799831, 0.9584407, 0, 0.5686275, 1, 1,
0.1670694, 0.2967873, 0.6076881, 0, 0.5607843, 1, 1,
0.1675082, -0.2923561, 2.464096, 0, 0.5568628, 1, 1,
0.1703422, -0.3202024, 3.028189, 0, 0.5490196, 1, 1,
0.171092, -0.5065966, 2.319647, 0, 0.5450981, 1, 1,
0.1722779, 0.5753971, 0.6787833, 0, 0.5372549, 1, 1,
0.1745355, -0.1715116, 2.379536, 0, 0.5333334, 1, 1,
0.1783504, 0.2024925, 2.552608, 0, 0.5254902, 1, 1,
0.1796443, -0.3504597, 2.031442, 0, 0.5215687, 1, 1,
0.1818266, -0.6294177, 3.185157, 0, 0.5137255, 1, 1,
0.1827125, -0.7945848, 1.183673, 0, 0.509804, 1, 1,
0.1843338, 0.1418361, 2.061808, 0, 0.5019608, 1, 1,
0.1845907, -1.522439, 3.389934, 0, 0.4941176, 1, 1,
0.1888566, -0.5404434, 2.687957, 0, 0.4901961, 1, 1,
0.1888605, -1.299022, 3.770247, 0, 0.4823529, 1, 1,
0.1898657, -0.05088391, 1.465221, 0, 0.4784314, 1, 1,
0.1909244, -2.564442, 1.835202, 0, 0.4705882, 1, 1,
0.1921351, 2.024559, -0.9835958, 0, 0.4666667, 1, 1,
0.1934839, -0.3205433, 2.464562, 0, 0.4588235, 1, 1,
0.1967518, -0.2139271, 2.862546, 0, 0.454902, 1, 1,
0.1970386, -1.789541, 2.301225, 0, 0.4470588, 1, 1,
0.1995814, -1.466299, 5.716097, 0, 0.4431373, 1, 1,
0.2012488, 1.146097, 2.060692, 0, 0.4352941, 1, 1,
0.2028822, 1.218191, -0.298206, 0, 0.4313726, 1, 1,
0.2046875, 0.6240845, 0.1695892, 0, 0.4235294, 1, 1,
0.2049532, -1.360714, 4.29546, 0, 0.4196078, 1, 1,
0.212683, 1.679657, -0.4510609, 0, 0.4117647, 1, 1,
0.2136819, 0.7412675, 0.8161022, 0, 0.4078431, 1, 1,
0.2152437, 0.592287, 0.4902369, 0, 0.4, 1, 1,
0.2234348, 0.1671902, 0.9362268, 0, 0.3921569, 1, 1,
0.2241684, 1.351407, -0.9160584, 0, 0.3882353, 1, 1,
0.227409, 0.1326537, 1.094067, 0, 0.3803922, 1, 1,
0.2292667, -0.157968, 2.962194, 0, 0.3764706, 1, 1,
0.2308277, -0.1449043, 3.256987, 0, 0.3686275, 1, 1,
0.2316017, 0.2139183, 0.9636286, 0, 0.3647059, 1, 1,
0.2346248, 0.6517893, 0.1359864, 0, 0.3568628, 1, 1,
0.2378584, 0.06106877, 3.351021, 0, 0.3529412, 1, 1,
0.2419255, 1.218055, 0.6071641, 0, 0.345098, 1, 1,
0.2461695, -1.143064, 0.6583204, 0, 0.3411765, 1, 1,
0.2461808, -0.286182, 3.223924, 0, 0.3333333, 1, 1,
0.2471281, 0.2037194, 0.8095745, 0, 0.3294118, 1, 1,
0.2498335, 0.1353729, 0.8258428, 0, 0.3215686, 1, 1,
0.2557218, 1.587107, -1.626648, 0, 0.3176471, 1, 1,
0.2564979, 1.159373, 1.024172, 0, 0.3098039, 1, 1,
0.2638716, 0.4265691, 1.54487, 0, 0.3058824, 1, 1,
0.263998, -0.2732499, 2.33964, 0, 0.2980392, 1, 1,
0.2677067, 0.150614, -0.533601, 0, 0.2901961, 1, 1,
0.2682014, 0.4243577, -0.268981, 0, 0.2862745, 1, 1,
0.2689044, 0.7372919, -2.105022, 0, 0.2784314, 1, 1,
0.273547, -1.534841, 2.013321, 0, 0.2745098, 1, 1,
0.274139, 0.5864269, 1.390342, 0, 0.2666667, 1, 1,
0.2777334, 1.041931, -0.4022913, 0, 0.2627451, 1, 1,
0.2812667, 0.4426815, 1.234638, 0, 0.254902, 1, 1,
0.2814568, -1.382869, 2.778417, 0, 0.2509804, 1, 1,
0.2818174, 0.6476883, -0.4444382, 0, 0.2431373, 1, 1,
0.2899756, 0.8007043, -1.053596, 0, 0.2392157, 1, 1,
0.2946056, -0.5616533, 5.339073, 0, 0.2313726, 1, 1,
0.2995327, -0.1633882, 1.291417, 0, 0.227451, 1, 1,
0.3058676, -1.032473, 3.292733, 0, 0.2196078, 1, 1,
0.3067081, 0.406546, 1.956541, 0, 0.2156863, 1, 1,
0.3073524, -0.176181, 1.981512, 0, 0.2078431, 1, 1,
0.3117675, -0.8407322, 4.552076, 0, 0.2039216, 1, 1,
0.3176622, -0.5858262, 2.646308, 0, 0.1960784, 1, 1,
0.3220688, 0.5785267, 0.5241354, 0, 0.1882353, 1, 1,
0.3293869, 0.8490453, 1.218347, 0, 0.1843137, 1, 1,
0.3309807, -0.5401401, 3.4316, 0, 0.1764706, 1, 1,
0.33446, 2.315984, 0.406869, 0, 0.172549, 1, 1,
0.3356948, 0.05641068, 1.238592, 0, 0.1647059, 1, 1,
0.3358957, -0.6339231, 3.06535, 0, 0.1607843, 1, 1,
0.3367914, -0.05484885, 2.176156, 0, 0.1529412, 1, 1,
0.3469602, -0.4845518, 2.091983, 0, 0.1490196, 1, 1,
0.3493031, -1.222803, 2.92472, 0, 0.1411765, 1, 1,
0.3498293, 0.6092501, 1.007251, 0, 0.1372549, 1, 1,
0.352082, -1.523648, 2.796645, 0, 0.1294118, 1, 1,
0.3585938, -0.9341186, 4.456127, 0, 0.1254902, 1, 1,
0.3631493, 2.16711, 0.3217515, 0, 0.1176471, 1, 1,
0.3634168, 0.1028738, -0.3356962, 0, 0.1137255, 1, 1,
0.3648815, 1.277885, -1.350053, 0, 0.1058824, 1, 1,
0.3658985, -0.1728366, 1.317728, 0, 0.09803922, 1, 1,
0.366037, -0.07509997, 0.6667681, 0, 0.09411765, 1, 1,
0.3688633, -0.9853291, 1.408751, 0, 0.08627451, 1, 1,
0.3691872, 0.4286598, 1.537259, 0, 0.08235294, 1, 1,
0.3699546, -1.186585, 4.154521, 0, 0.07450981, 1, 1,
0.3731478, -0.4730899, 1.409464, 0, 0.07058824, 1, 1,
0.380412, 0.4400789, 0.5778194, 0, 0.0627451, 1, 1,
0.3805035, 0.1808584, 1.231189, 0, 0.05882353, 1, 1,
0.3838836, -1.414523, 2.926434, 0, 0.05098039, 1, 1,
0.3853991, 0.6233236, 1.713758, 0, 0.04705882, 1, 1,
0.3860111, 0.3393088, 1.456681, 0, 0.03921569, 1, 1,
0.3872707, 0.4952193, -0.2881079, 0, 0.03529412, 1, 1,
0.3876524, 0.04856066, -1.369529, 0, 0.02745098, 1, 1,
0.3892162, 0.1411622, 1.392004, 0, 0.02352941, 1, 1,
0.3916787, 0.1483797, 2.245453, 0, 0.01568628, 1, 1,
0.3939632, -0.2052114, 2.214606, 0, 0.01176471, 1, 1,
0.3941615, -0.8626768, 3.015462, 0, 0.003921569, 1, 1,
0.3946985, 0.4774759, 2.850577, 0.003921569, 0, 1, 1,
0.4028678, 0.9252432, 0.02409656, 0.007843138, 0, 1, 1,
0.4033884, 0.9330977, 0.8935009, 0.01568628, 0, 1, 1,
0.4052203, -0.825768, 2.336891, 0.01960784, 0, 1, 1,
0.4071932, 0.4445982, -0.9160917, 0.02745098, 0, 1, 1,
0.4074355, -0.05215522, 1.050299, 0.03137255, 0, 1, 1,
0.4091985, 0.3815442, 0.09557763, 0.03921569, 0, 1, 1,
0.4113665, 0.2017738, 1.922868, 0.04313726, 0, 1, 1,
0.4114402, 0.8027451, 0.9004439, 0.05098039, 0, 1, 1,
0.4135706, -0.4330676, 2.128609, 0.05490196, 0, 1, 1,
0.414336, 1.066047, 0.1684897, 0.0627451, 0, 1, 1,
0.4186926, -0.3702501, 3.361403, 0.06666667, 0, 1, 1,
0.4214865, -0.4831975, 4.142043, 0.07450981, 0, 1, 1,
0.4223475, -0.8491102, 3.059083, 0.07843138, 0, 1, 1,
0.4265775, 0.3437954, 2.054672, 0.08627451, 0, 1, 1,
0.4284275, 1.091252, 1.60401, 0.09019608, 0, 1, 1,
0.4313928, 1.116022, -0.1852424, 0.09803922, 0, 1, 1,
0.4341019, 0.8299675, 1.384501, 0.1058824, 0, 1, 1,
0.4349375, 2.556957, -1.601119, 0.1098039, 0, 1, 1,
0.4353793, 1.501957, -0.491304, 0.1176471, 0, 1, 1,
0.4365557, -0.2493754, 2.122982, 0.1215686, 0, 1, 1,
0.4386624, 0.4804763, 1.575784, 0.1294118, 0, 1, 1,
0.4412957, 0.4051831, 1.667429, 0.1333333, 0, 1, 1,
0.4422558, 0.2045528, 1.736696, 0.1411765, 0, 1, 1,
0.4461842, -0.7143663, 3.093004, 0.145098, 0, 1, 1,
0.4489032, 0.4312076, 1.433971, 0.1529412, 0, 1, 1,
0.454323, -0.9132786, 3.482064, 0.1568628, 0, 1, 1,
0.4549998, -0.8929313, 2.520119, 0.1647059, 0, 1, 1,
0.458579, 2.417552, 1.969566, 0.1686275, 0, 1, 1,
0.4596886, 0.1142493, 0.3761366, 0.1764706, 0, 1, 1,
0.4636198, -0.7029849, 2.361851, 0.1803922, 0, 1, 1,
0.4657594, -0.5109779, 0.4830135, 0.1882353, 0, 1, 1,
0.467044, -0.3571878, -0.9592711, 0.1921569, 0, 1, 1,
0.4690484, 0.1087936, 1.979017, 0.2, 0, 1, 1,
0.4704823, -0.6977684, 1.80644, 0.2078431, 0, 1, 1,
0.4725244, 0.7041685, 1.969687, 0.2117647, 0, 1, 1,
0.4744877, -0.3058447, 1.778837, 0.2196078, 0, 1, 1,
0.475115, -0.7630954, 3.251788, 0.2235294, 0, 1, 1,
0.4751994, -0.08768947, 1.079021, 0.2313726, 0, 1, 1,
0.4773143, -0.4688041, 3.92254, 0.2352941, 0, 1, 1,
0.4785416, -0.8266404, 3.639349, 0.2431373, 0, 1, 1,
0.4790139, 0.1737664, 0.07709306, 0.2470588, 0, 1, 1,
0.4861266, 0.1372696, 2.613313, 0.254902, 0, 1, 1,
0.489341, 1.800959, 0.78986, 0.2588235, 0, 1, 1,
0.4909541, 0.1604915, 1.479221, 0.2666667, 0, 1, 1,
0.4962255, 0.4483851, 0.9800221, 0.2705882, 0, 1, 1,
0.4979545, 1.11462, 1.001431, 0.2784314, 0, 1, 1,
0.5035018, 1.570658, -1.067095, 0.282353, 0, 1, 1,
0.5082582, -0.7133332, 2.582422, 0.2901961, 0, 1, 1,
0.5105177, 0.3285768, 2.119626, 0.2941177, 0, 1, 1,
0.5124637, 0.6908683, 0.5743788, 0.3019608, 0, 1, 1,
0.5142362, -0.3539994, 3.345099, 0.3098039, 0, 1, 1,
0.5148011, 1.816857, 3.421434, 0.3137255, 0, 1, 1,
0.5188189, -0.3203776, 0.5113186, 0.3215686, 0, 1, 1,
0.5236089, 0.1799946, 2.103254, 0.3254902, 0, 1, 1,
0.5264577, 0.06126411, 2.129725, 0.3333333, 0, 1, 1,
0.5274897, 0.5052675, 2.72845, 0.3372549, 0, 1, 1,
0.5321066, 0.2500573, 1.705588, 0.345098, 0, 1, 1,
0.5337887, 0.7500029, 0.466165, 0.3490196, 0, 1, 1,
0.5356621, -0.711009, 1.364785, 0.3568628, 0, 1, 1,
0.5369556, -0.1325886, 1.478524, 0.3607843, 0, 1, 1,
0.540641, 1.157518, 1.163291, 0.3686275, 0, 1, 1,
0.5418691, -1.509061, 0.8250702, 0.372549, 0, 1, 1,
0.5446053, -1.232322, 2.961201, 0.3803922, 0, 1, 1,
0.5644181, -1.601108, 3.059214, 0.3843137, 0, 1, 1,
0.5683607, -1.830717, 3.562762, 0.3921569, 0, 1, 1,
0.5699703, 0.1934005, 0.7011002, 0.3960784, 0, 1, 1,
0.5712128, 2.003657, 1.112586, 0.4039216, 0, 1, 1,
0.5733994, 1.211211, -1.362535, 0.4117647, 0, 1, 1,
0.576109, -0.09187785, 2.743058, 0.4156863, 0, 1, 1,
0.5784206, -0.6545412, 1.588748, 0.4235294, 0, 1, 1,
0.5786474, -0.375214, 1.01567, 0.427451, 0, 1, 1,
0.5823239, -0.8436559, 2.34997, 0.4352941, 0, 1, 1,
0.58283, -0.4947574, 3.161041, 0.4392157, 0, 1, 1,
0.5867345, -1.112765, 3.139757, 0.4470588, 0, 1, 1,
0.5874146, -0.5307804, 4.80295, 0.4509804, 0, 1, 1,
0.5903525, 0.925422, -0.576765, 0.4588235, 0, 1, 1,
0.5915033, -0.1717511, 0.8149836, 0.4627451, 0, 1, 1,
0.5927506, 0.4215051, 1.842685, 0.4705882, 0, 1, 1,
0.5930653, -0.453329, 2.836978, 0.4745098, 0, 1, 1,
0.5941023, 0.479014, 1.923752, 0.4823529, 0, 1, 1,
0.597846, -0.7820352, 4.144287, 0.4862745, 0, 1, 1,
0.5985014, -0.8193715, 0.4326109, 0.4941176, 0, 1, 1,
0.6117254, 0.3868091, 1.819866, 0.5019608, 0, 1, 1,
0.614104, 0.4774217, 0.9989306, 0.5058824, 0, 1, 1,
0.6142076, 1.574311, 0.2685964, 0.5137255, 0, 1, 1,
0.6164523, 1.77282, 2.776901, 0.5176471, 0, 1, 1,
0.6175808, -0.7799821, 2.249083, 0.5254902, 0, 1, 1,
0.6197399, 0.6881281, 0.8637566, 0.5294118, 0, 1, 1,
0.6222165, -0.5122083, 1.842393, 0.5372549, 0, 1, 1,
0.6270038, -1.487891, 0.7172041, 0.5411765, 0, 1, 1,
0.6274287, -1.185241, 2.979384, 0.5490196, 0, 1, 1,
0.6287463, 0.115882, 3.239532, 0.5529412, 0, 1, 1,
0.6299663, 0.319339, 1.470658, 0.5607843, 0, 1, 1,
0.633205, -0.5956509, 3.043994, 0.5647059, 0, 1, 1,
0.6370243, -1.011433, -0.01078734, 0.572549, 0, 1, 1,
0.6448207, -0.6661003, 2.719762, 0.5764706, 0, 1, 1,
0.6479917, -1.14983, 2.420958, 0.5843138, 0, 1, 1,
0.6516843, -0.4510593, 1.012795, 0.5882353, 0, 1, 1,
0.6540174, 0.2020964, 0.3488201, 0.5960785, 0, 1, 1,
0.6552743, 0.5635338, 0.2981904, 0.6039216, 0, 1, 1,
0.6555675, -0.04421521, 1.829774, 0.6078432, 0, 1, 1,
0.6560035, 1.507485, 0.556003, 0.6156863, 0, 1, 1,
0.6574395, 0.491971, -0.06382295, 0.6196079, 0, 1, 1,
0.6596724, 1.002864, 1.067114, 0.627451, 0, 1, 1,
0.6610174, -0.4965505, 3.638671, 0.6313726, 0, 1, 1,
0.6610393, -0.1394806, 1.331995, 0.6392157, 0, 1, 1,
0.6754521, -1.26351, 3.050532, 0.6431373, 0, 1, 1,
0.6807429, -1.338722, 3.652014, 0.6509804, 0, 1, 1,
0.682948, 1.363715, -0.9293958, 0.654902, 0, 1, 1,
0.6848579, -1.883224, 0.8261359, 0.6627451, 0, 1, 1,
0.6867087, 0.3100276, 1.626033, 0.6666667, 0, 1, 1,
0.6892897, 0.2439972, 1.836349, 0.6745098, 0, 1, 1,
0.6978084, 0.5626146, -0.0009751433, 0.6784314, 0, 1, 1,
0.6987544, 0.8495553, -0.3626649, 0.6862745, 0, 1, 1,
0.7019697, -1.468089, 3.506155, 0.6901961, 0, 1, 1,
0.7027714, 0.2948119, 1.070283, 0.6980392, 0, 1, 1,
0.7028777, -2.092592, 2.550711, 0.7058824, 0, 1, 1,
0.7040672, 0.5511338, 2.396827, 0.7098039, 0, 1, 1,
0.7153844, 0.4403619, -0.009462901, 0.7176471, 0, 1, 1,
0.7164088, -0.8376839, 2.783851, 0.7215686, 0, 1, 1,
0.718433, -0.5091673, 1.268394, 0.7294118, 0, 1, 1,
0.7191126, 1.445342, 0.8448959, 0.7333333, 0, 1, 1,
0.7211016, -0.4356118, 2.315564, 0.7411765, 0, 1, 1,
0.7220488, 0.9349663, -0.3723789, 0.7450981, 0, 1, 1,
0.7289513, -0.008678226, 1.046893, 0.7529412, 0, 1, 1,
0.7310054, 1.888672, 0.2148401, 0.7568628, 0, 1, 1,
0.7320066, -0.1314764, 2.685282, 0.7647059, 0, 1, 1,
0.7326445, -2.591891, 1.891257, 0.7686275, 0, 1, 1,
0.7332844, -0.3792063, 1.794752, 0.7764706, 0, 1, 1,
0.7337661, 0.2139117, 1.03549, 0.7803922, 0, 1, 1,
0.7344994, 0.5871585, -0.1848769, 0.7882353, 0, 1, 1,
0.7383727, -0.9728101, 4.347234, 0.7921569, 0, 1, 1,
0.7463662, -0.376193, 0.1715411, 0.8, 0, 1, 1,
0.7465851, -0.191052, -0.09213063, 0.8078431, 0, 1, 1,
0.7482392, 0.3298428, 0.9774626, 0.8117647, 0, 1, 1,
0.7507086, 1.444197, -1.33714, 0.8196079, 0, 1, 1,
0.7542136, 1.429159, 1.309271, 0.8235294, 0, 1, 1,
0.7545933, 1.073181, 0.4043519, 0.8313726, 0, 1, 1,
0.7576655, 0.6111001, 1.28277, 0.8352941, 0, 1, 1,
0.7594132, 1.284754, -1.445575, 0.8431373, 0, 1, 1,
0.7832496, -0.1930536, 2.596047, 0.8470588, 0, 1, 1,
0.787998, 1.006898, 1.536053, 0.854902, 0, 1, 1,
0.7960592, -0.9679629, 1.69061, 0.8588235, 0, 1, 1,
0.7961598, -0.07904487, 0.0604264, 0.8666667, 0, 1, 1,
0.7987513, 0.2777009, 0.9867099, 0.8705882, 0, 1, 1,
0.8074266, 0.4025538, 0.2510411, 0.8784314, 0, 1, 1,
0.8129737, -0.1001274, 3.057866, 0.8823529, 0, 1, 1,
0.8153589, 0.1629837, 0.1038959, 0.8901961, 0, 1, 1,
0.8236064, -0.763626, 3.017569, 0.8941177, 0, 1, 1,
0.8258702, 0.1046288, 2.586733, 0.9019608, 0, 1, 1,
0.8264623, 0.03013572, 3.694774, 0.9098039, 0, 1, 1,
0.8266454, -1.032986, 1.531188, 0.9137255, 0, 1, 1,
0.8292648, -0.9477398, 3.021969, 0.9215686, 0, 1, 1,
0.8337162, 2.025975, -0.0554087, 0.9254902, 0, 1, 1,
0.8343382, -0.168432, 0.9033693, 0.9333333, 0, 1, 1,
0.8350185, 0.2910086, 2.724851, 0.9372549, 0, 1, 1,
0.8372553, 0.3918806, 0.7044523, 0.945098, 0, 1, 1,
0.8376409, 0.5579376, 3.510725, 0.9490196, 0, 1, 1,
0.8392422, -0.08792775, 1.632221, 0.9568627, 0, 1, 1,
0.8455287, -1.075373, 3.07506, 0.9607843, 0, 1, 1,
0.8490084, -0.8950117, 2.428877, 0.9686275, 0, 1, 1,
0.853973, 0.9159157, 1.248715, 0.972549, 0, 1, 1,
0.8616859, -0.7166964, 1.492069, 0.9803922, 0, 1, 1,
0.8634689, 0.04407064, 1.061806, 0.9843137, 0, 1, 1,
0.864702, -0.1818935, 1.980442, 0.9921569, 0, 1, 1,
0.871698, 0.9524971, 0.8173253, 0.9960784, 0, 1, 1,
0.875885, -0.2569861, 1.075923, 1, 0, 0.9960784, 1,
0.8806695, 0.5237008, 1.978776, 1, 0, 0.9882353, 1,
0.8863332, 1.130706, -1.095578, 1, 0, 0.9843137, 1,
0.8939627, -0.4300013, 3.128392, 1, 0, 0.9764706, 1,
0.8967528, -1.466312, 1.841762, 1, 0, 0.972549, 1,
0.9025197, 0.3115385, 1.547906, 1, 0, 0.9647059, 1,
0.9026183, 1.219332, 1.171926, 1, 0, 0.9607843, 1,
0.915132, 1.421495, 0.05784326, 1, 0, 0.9529412, 1,
0.9186929, -0.3543223, 3.994323, 1, 0, 0.9490196, 1,
0.9218729, 1.233777, 0.7513677, 1, 0, 0.9411765, 1,
0.9303185, 0.3399855, -0.5814994, 1, 0, 0.9372549, 1,
0.9410736, 0.7322285, 2.138424, 1, 0, 0.9294118, 1,
0.9413249, 0.3890172, 1.396527, 1, 0, 0.9254902, 1,
0.9431835, -1.510679, 3.243343, 1, 0, 0.9176471, 1,
0.9492771, -0.8847883, 2.587354, 1, 0, 0.9137255, 1,
0.9652925, 1.058714, 0.7412028, 1, 0, 0.9058824, 1,
0.9661484, -0.493028, 3.545127, 1, 0, 0.9019608, 1,
0.9725612, 0.4071429, 0.847716, 1, 0, 0.8941177, 1,
0.9735553, -1.169832, 2.695306, 1, 0, 0.8862745, 1,
0.9762548, 1.021617, 0.7366728, 1, 0, 0.8823529, 1,
0.9765272, 0.9455026, 1.931598, 1, 0, 0.8745098, 1,
0.9781746, 0.6899453, 0.1773627, 1, 0, 0.8705882, 1,
0.9803522, -0.9526647, 3.25842, 1, 0, 0.8627451, 1,
0.9827963, -0.09394072, 1.068764, 1, 0, 0.8588235, 1,
0.9953979, 0.6091712, 1.957925, 1, 0, 0.8509804, 1,
0.9975073, 0.256914, 1.729627, 1, 0, 0.8470588, 1,
1.015619, -0.2743766, 0.4666825, 1, 0, 0.8392157, 1,
1.023322, 0.1598075, -0.1799316, 1, 0, 0.8352941, 1,
1.024508, 0.1058914, 2.548989, 1, 0, 0.827451, 1,
1.027839, 0.6453139, 0.9360511, 1, 0, 0.8235294, 1,
1.049371, 1.969974, 0.6083575, 1, 0, 0.8156863, 1,
1.054425, -0.355142, 2.703225, 1, 0, 0.8117647, 1,
1.055779, 0.839234, 1.601371, 1, 0, 0.8039216, 1,
1.059657, 0.9885049, -0.04913081, 1, 0, 0.7960784, 1,
1.059676, -0.9945641, 2.354079, 1, 0, 0.7921569, 1,
1.062406, -1.032393, 2.880802, 1, 0, 0.7843137, 1,
1.062839, -1.496785, 2.381961, 1, 0, 0.7803922, 1,
1.070206, -0.4154484, 1.764707, 1, 0, 0.772549, 1,
1.081633, -0.6224414, 0.6141636, 1, 0, 0.7686275, 1,
1.089702, -0.3115737, 2.030661, 1, 0, 0.7607843, 1,
1.103701, 1.372075, -0.08682349, 1, 0, 0.7568628, 1,
1.110748, -0.1232447, 0.7544985, 1, 0, 0.7490196, 1,
1.125542, -0.374487, 2.568547, 1, 0, 0.7450981, 1,
1.130742, -0.7293798, 1.994155, 1, 0, 0.7372549, 1,
1.130812, -0.3952739, 1.191357, 1, 0, 0.7333333, 1,
1.140776, 1.346781, -2.024786, 1, 0, 0.7254902, 1,
1.146408, 0.6241233, 1.464731, 1, 0, 0.7215686, 1,
1.147543, 0.2294561, -0.6045656, 1, 0, 0.7137255, 1,
1.147553, -0.9913128, 1.209594, 1, 0, 0.7098039, 1,
1.149811, -0.8387256, 3.254578, 1, 0, 0.7019608, 1,
1.151049, 0.255802, 2.511776, 1, 0, 0.6941177, 1,
1.153785, 1.343418, -0.4248228, 1, 0, 0.6901961, 1,
1.166207, 2.309778, -0.08457579, 1, 0, 0.682353, 1,
1.173375, -1.560262, 2.626464, 1, 0, 0.6784314, 1,
1.177146, -1.671964, 3.66877, 1, 0, 0.6705883, 1,
1.177811, -0.2552403, 1.316452, 1, 0, 0.6666667, 1,
1.17865, 0.2810128, -0.5720564, 1, 0, 0.6588235, 1,
1.200765, -0.3891434, 3.186542, 1, 0, 0.654902, 1,
1.206366, -0.0197369, 3.298192, 1, 0, 0.6470588, 1,
1.211914, 0.9900807, 1.651148, 1, 0, 0.6431373, 1,
1.214202, 0.147371, 1.931611, 1, 0, 0.6352941, 1,
1.225296, -0.4935867, 2.495871, 1, 0, 0.6313726, 1,
1.233726, -0.01874395, 0.7028931, 1, 0, 0.6235294, 1,
1.237908, -0.8964271, 1.087502, 1, 0, 0.6196079, 1,
1.238814, -0.4127068, 4.112604, 1, 0, 0.6117647, 1,
1.241447, -1.052234, 2.267546, 1, 0, 0.6078432, 1,
1.242472, -1.317897, 2.008499, 1, 0, 0.6, 1,
1.250072, 0.4098624, 0.8945952, 1, 0, 0.5921569, 1,
1.256049, -0.6988558, 2.398767, 1, 0, 0.5882353, 1,
1.270579, -0.6303141, 3.165868, 1, 0, 0.5803922, 1,
1.279629, -0.8724709, 2.130074, 1, 0, 0.5764706, 1,
1.295306, -0.09612111, 2.163955, 1, 0, 0.5686275, 1,
1.297615, 0.4568986, 1.471082, 1, 0, 0.5647059, 1,
1.298966, -2.481925, 2.246281, 1, 0, 0.5568628, 1,
1.302093, -0.3320612, 1.563113, 1, 0, 0.5529412, 1,
1.328736, -0.1915042, 1.468613, 1, 0, 0.5450981, 1,
1.334183, 0.5755106, 2.233423, 1, 0, 0.5411765, 1,
1.345524, 0.7018253, 1.437437, 1, 0, 0.5333334, 1,
1.350324, 1.873675, 1.560866, 1, 0, 0.5294118, 1,
1.358258, -0.1440905, 3.012331, 1, 0, 0.5215687, 1,
1.367354, -0.1626211, 2.198522, 1, 0, 0.5176471, 1,
1.370734, -1.59848, 2.801406, 1, 0, 0.509804, 1,
1.375356, -0.4531989, 1.903583, 1, 0, 0.5058824, 1,
1.376776, 0.2241408, 0.5192809, 1, 0, 0.4980392, 1,
1.380718, 1.07434, 0.5703429, 1, 0, 0.4901961, 1,
1.396391, 0.3051412, -0.6683078, 1, 0, 0.4862745, 1,
1.397001, 0.3629788, 2.989023, 1, 0, 0.4784314, 1,
1.398752, -0.3509263, 1.517005, 1, 0, 0.4745098, 1,
1.400464, 0.3722019, 2.057472, 1, 0, 0.4666667, 1,
1.403755, -0.3676169, 1.918128, 1, 0, 0.4627451, 1,
1.414167, 0.1918874, 0.5781932, 1, 0, 0.454902, 1,
1.443314, 0.8332769, 1.060831, 1, 0, 0.4509804, 1,
1.44709, 0.1516843, 1.52573, 1, 0, 0.4431373, 1,
1.450993, 0.887171, 0.4535382, 1, 0, 0.4392157, 1,
1.471722, 0.4563243, 1.174744, 1, 0, 0.4313726, 1,
1.475447, -0.6641409, 1.6325, 1, 0, 0.427451, 1,
1.493806, 1.169816, -0.7038735, 1, 0, 0.4196078, 1,
1.505315, -1.254281, 1.189455, 1, 0, 0.4156863, 1,
1.507198, 0.2709019, 1.248436, 1, 0, 0.4078431, 1,
1.515232, 1.033382, 2.358223, 1, 0, 0.4039216, 1,
1.515321, -1.587693, 0.974982, 1, 0, 0.3960784, 1,
1.515872, 0.4894543, 2.014187, 1, 0, 0.3882353, 1,
1.52417, -0.2337614, 1.308778, 1, 0, 0.3843137, 1,
1.525787, -0.5927594, 2.946281, 1, 0, 0.3764706, 1,
1.527128, 0.101905, 1.397015, 1, 0, 0.372549, 1,
1.53834, 0.2838652, 3.467136, 1, 0, 0.3647059, 1,
1.549049, 2.484799, 1.684065, 1, 0, 0.3607843, 1,
1.550089, -0.07457333, 0.7780096, 1, 0, 0.3529412, 1,
1.56723, 0.6011678, 1.562445, 1, 0, 0.3490196, 1,
1.571642, -0.7979504, 2.628001, 1, 0, 0.3411765, 1,
1.581232, 1.263937, -0.1188224, 1, 0, 0.3372549, 1,
1.589195, -0.737708, 1.714503, 1, 0, 0.3294118, 1,
1.598385, -0.237278, 3.680365, 1, 0, 0.3254902, 1,
1.602798, -0.5046437, 1.474473, 1, 0, 0.3176471, 1,
1.620111, -0.4377353, 3.269921, 1, 0, 0.3137255, 1,
1.633205, 0.6242174, 0.08683372, 1, 0, 0.3058824, 1,
1.633601, -0.2904535, 1.94855, 1, 0, 0.2980392, 1,
1.636895, -0.9956787, 3.119085, 1, 0, 0.2941177, 1,
1.669259, -0.5752433, 2.326995, 1, 0, 0.2862745, 1,
1.674627, -0.7265504, 2.22815, 1, 0, 0.282353, 1,
1.676739, -1.103507, 2.198814, 1, 0, 0.2745098, 1,
1.679576, -0.5385157, 3.812943, 1, 0, 0.2705882, 1,
1.682363, 0.347301, 1.233245, 1, 0, 0.2627451, 1,
1.700355, -0.9296561, 2.623679, 1, 0, 0.2588235, 1,
1.710794, -1.139051, 2.26637, 1, 0, 0.2509804, 1,
1.750038, -0.9853752, 2.99752, 1, 0, 0.2470588, 1,
1.752498, 1.365613, 1.34806, 1, 0, 0.2392157, 1,
1.776575, -1.077105, 1.368222, 1, 0, 0.2352941, 1,
1.777854, 1.104862, 0.8347368, 1, 0, 0.227451, 1,
1.782084, 0.647778, 0.2333006, 1, 0, 0.2235294, 1,
1.788745, 0.8611127, 2.133396, 1, 0, 0.2156863, 1,
1.803015, 1.558976, 2.429729, 1, 0, 0.2117647, 1,
1.817208, 0.1328719, 2.71628, 1, 0, 0.2039216, 1,
1.822208, -0.8472217, 3.526307, 1, 0, 0.1960784, 1,
1.838224, -0.06138666, 1.821739, 1, 0, 0.1921569, 1,
1.861419, -0.04420066, 0.9090488, 1, 0, 0.1843137, 1,
1.86246, -1.154836, 2.98885, 1, 0, 0.1803922, 1,
1.866783, 0.3341748, 2.778669, 1, 0, 0.172549, 1,
1.871036, 1.470997, 1.831012, 1, 0, 0.1686275, 1,
1.877289, 0.2773674, 2.088017, 1, 0, 0.1607843, 1,
1.887862, 1.294063, 0.06919406, 1, 0, 0.1568628, 1,
1.916575, -0.1527666, 1.931113, 1, 0, 0.1490196, 1,
1.924157, -2.128067, 2.170423, 1, 0, 0.145098, 1,
1.929553, 0.2843927, 0.9000559, 1, 0, 0.1372549, 1,
1.969497, 0.3490791, 0.5497808, 1, 0, 0.1333333, 1,
1.992075, -0.9094262, 0.8622211, 1, 0, 0.1254902, 1,
2.000992, -0.8279167, 2.255152, 1, 0, 0.1215686, 1,
2.007127, -1.052929, 2.868183, 1, 0, 0.1137255, 1,
2.118783, -1.732494, 3.454941, 1, 0, 0.1098039, 1,
2.157361, -0.3308239, 0.5264371, 1, 0, 0.1019608, 1,
2.190783, -1.330831, 0.8957191, 1, 0, 0.09411765, 1,
2.212982, 0.2990442, 0.9791613, 1, 0, 0.09019608, 1,
2.221148, 0.1912469, 1.944321, 1, 0, 0.08235294, 1,
2.264601, 0.4949414, 1.194535, 1, 0, 0.07843138, 1,
2.299701, -0.6348414, 1.968384, 1, 0, 0.07058824, 1,
2.421453, -0.5077757, 3.165478, 1, 0, 0.06666667, 1,
2.428674, 0.1899989, 2.879181, 1, 0, 0.05882353, 1,
2.43304, 1.991598, 0.7809905, 1, 0, 0.05490196, 1,
2.508242, 0.26823, 0.1282699, 1, 0, 0.04705882, 1,
2.531934, 0.1281376, -0.1177696, 1, 0, 0.04313726, 1,
2.587203, -1.139101, 2.659118, 1, 0, 0.03529412, 1,
2.621897, 0.1885457, 1.018335, 1, 0, 0.03137255, 1,
2.973738, 0.2527603, 0.5492582, 1, 0, 0.02352941, 1,
3.333918, 0.70652, 1.027657, 1, 0, 0.01960784, 1,
3.420733, -0.9461387, 1.160956, 1, 0, 0.01176471, 1,
3.705142, 0.6650195, 0.8745962, 1, 0, 0.007843138, 1
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
0.5535765, -3.650331, -7.183324, 0, -0.5, 0.5, 0.5,
0.5535765, -3.650331, -7.183324, 1, -0.5, 0.5, 0.5,
0.5535765, -3.650331, -7.183324, 1, 1.5, 0.5, 0.5,
0.5535765, -3.650331, -7.183324, 0, 1.5, 0.5, 0.5
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
-3.66637, -0.0968641, -7.183324, 0, -0.5, 0.5, 0.5,
-3.66637, -0.0968641, -7.183324, 1, -0.5, 0.5, 0.5,
-3.66637, -0.0968641, -7.183324, 1, 1.5, 0.5, 0.5,
-3.66637, -0.0968641, -7.183324, 0, 1.5, 0.5, 0.5
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
-3.66637, -3.650331, 0.2011673, 0, -0.5, 0.5, 0.5,
-3.66637, -3.650331, 0.2011673, 1, -0.5, 0.5, 0.5,
-3.66637, -3.650331, 0.2011673, 1, 1.5, 0.5, 0.5,
-3.66637, -3.650331, 0.2011673, 0, 1.5, 0.5, 0.5
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
-2, -2.8303, -5.47921,
3, -2.8303, -5.47921,
-2, -2.8303, -5.47921,
-2, -2.966972, -5.763229,
-1, -2.8303, -5.47921,
-1, -2.966972, -5.763229,
0, -2.8303, -5.47921,
0, -2.966972, -5.763229,
1, -2.8303, -5.47921,
1, -2.966972, -5.763229,
2, -2.8303, -5.47921,
2, -2.966972, -5.763229,
3, -2.8303, -5.47921,
3, -2.966972, -5.763229
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
-2, -3.240315, -6.331267, 0, -0.5, 0.5, 0.5,
-2, -3.240315, -6.331267, 1, -0.5, 0.5, 0.5,
-2, -3.240315, -6.331267, 1, 1.5, 0.5, 0.5,
-2, -3.240315, -6.331267, 0, 1.5, 0.5, 0.5,
-1, -3.240315, -6.331267, 0, -0.5, 0.5, 0.5,
-1, -3.240315, -6.331267, 1, -0.5, 0.5, 0.5,
-1, -3.240315, -6.331267, 1, 1.5, 0.5, 0.5,
-1, -3.240315, -6.331267, 0, 1.5, 0.5, 0.5,
0, -3.240315, -6.331267, 0, -0.5, 0.5, 0.5,
0, -3.240315, -6.331267, 1, -0.5, 0.5, 0.5,
0, -3.240315, -6.331267, 1, 1.5, 0.5, 0.5,
0, -3.240315, -6.331267, 0, 1.5, 0.5, 0.5,
1, -3.240315, -6.331267, 0, -0.5, 0.5, 0.5,
1, -3.240315, -6.331267, 1, -0.5, 0.5, 0.5,
1, -3.240315, -6.331267, 1, 1.5, 0.5, 0.5,
1, -3.240315, -6.331267, 0, 1.5, 0.5, 0.5,
2, -3.240315, -6.331267, 0, -0.5, 0.5, 0.5,
2, -3.240315, -6.331267, 1, -0.5, 0.5, 0.5,
2, -3.240315, -6.331267, 1, 1.5, 0.5, 0.5,
2, -3.240315, -6.331267, 0, 1.5, 0.5, 0.5,
3, -3.240315, -6.331267, 0, -0.5, 0.5, 0.5,
3, -3.240315, -6.331267, 1, -0.5, 0.5, 0.5,
3, -3.240315, -6.331267, 1, 1.5, 0.5, 0.5,
3, -3.240315, -6.331267, 0, 1.5, 0.5, 0.5
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
-2.692536, -2, -5.47921,
-2.692536, 2, -5.47921,
-2.692536, -2, -5.47921,
-2.854842, -2, -5.763229,
-2.692536, -1, -5.47921,
-2.854842, -1, -5.763229,
-2.692536, 0, -5.47921,
-2.854842, 0, -5.763229,
-2.692536, 1, -5.47921,
-2.854842, 1, -5.763229,
-2.692536, 2, -5.47921,
-2.854842, 2, -5.763229
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
-3.179453, -2, -6.331267, 0, -0.5, 0.5, 0.5,
-3.179453, -2, -6.331267, 1, -0.5, 0.5, 0.5,
-3.179453, -2, -6.331267, 1, 1.5, 0.5, 0.5,
-3.179453, -2, -6.331267, 0, 1.5, 0.5, 0.5,
-3.179453, -1, -6.331267, 0, -0.5, 0.5, 0.5,
-3.179453, -1, -6.331267, 1, -0.5, 0.5, 0.5,
-3.179453, -1, -6.331267, 1, 1.5, 0.5, 0.5,
-3.179453, -1, -6.331267, 0, 1.5, 0.5, 0.5,
-3.179453, 0, -6.331267, 0, -0.5, 0.5, 0.5,
-3.179453, 0, -6.331267, 1, -0.5, 0.5, 0.5,
-3.179453, 0, -6.331267, 1, 1.5, 0.5, 0.5,
-3.179453, 0, -6.331267, 0, 1.5, 0.5, 0.5,
-3.179453, 1, -6.331267, 0, -0.5, 0.5, 0.5,
-3.179453, 1, -6.331267, 1, -0.5, 0.5, 0.5,
-3.179453, 1, -6.331267, 1, 1.5, 0.5, 0.5,
-3.179453, 1, -6.331267, 0, 1.5, 0.5, 0.5,
-3.179453, 2, -6.331267, 0, -0.5, 0.5, 0.5,
-3.179453, 2, -6.331267, 1, -0.5, 0.5, 0.5,
-3.179453, 2, -6.331267, 1, 1.5, 0.5, 0.5,
-3.179453, 2, -6.331267, 0, 1.5, 0.5, 0.5
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
-2.692536, -2.8303, -4,
-2.692536, -2.8303, 4,
-2.692536, -2.8303, -4,
-2.854842, -2.966972, -4,
-2.692536, -2.8303, -2,
-2.854842, -2.966972, -2,
-2.692536, -2.8303, 0,
-2.854842, -2.966972, 0,
-2.692536, -2.8303, 2,
-2.854842, -2.966972, 2,
-2.692536, -2.8303, 4,
-2.854842, -2.966972, 4
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
-3.179453, -3.240315, -4, 0, -0.5, 0.5, 0.5,
-3.179453, -3.240315, -4, 1, -0.5, 0.5, 0.5,
-3.179453, -3.240315, -4, 1, 1.5, 0.5, 0.5,
-3.179453, -3.240315, -4, 0, 1.5, 0.5, 0.5,
-3.179453, -3.240315, -2, 0, -0.5, 0.5, 0.5,
-3.179453, -3.240315, -2, 1, -0.5, 0.5, 0.5,
-3.179453, -3.240315, -2, 1, 1.5, 0.5, 0.5,
-3.179453, -3.240315, -2, 0, 1.5, 0.5, 0.5,
-3.179453, -3.240315, 0, 0, -0.5, 0.5, 0.5,
-3.179453, -3.240315, 0, 1, -0.5, 0.5, 0.5,
-3.179453, -3.240315, 0, 1, 1.5, 0.5, 0.5,
-3.179453, -3.240315, 0, 0, 1.5, 0.5, 0.5,
-3.179453, -3.240315, 2, 0, -0.5, 0.5, 0.5,
-3.179453, -3.240315, 2, 1, -0.5, 0.5, 0.5,
-3.179453, -3.240315, 2, 1, 1.5, 0.5, 0.5,
-3.179453, -3.240315, 2, 0, 1.5, 0.5, 0.5,
-3.179453, -3.240315, 4, 0, -0.5, 0.5, 0.5,
-3.179453, -3.240315, 4, 1, -0.5, 0.5, 0.5,
-3.179453, -3.240315, 4, 1, 1.5, 0.5, 0.5,
-3.179453, -3.240315, 4, 0, 1.5, 0.5, 0.5
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
-2.692536, -2.8303, -5.47921,
-2.692536, 2.636572, -5.47921,
-2.692536, -2.8303, 5.881545,
-2.692536, 2.636572, 5.881545,
-2.692536, -2.8303, -5.47921,
-2.692536, -2.8303, 5.881545,
-2.692536, 2.636572, -5.47921,
-2.692536, 2.636572, 5.881545,
-2.692536, -2.8303, -5.47921,
3.799689, -2.8303, -5.47921,
-2.692536, -2.8303, 5.881545,
3.799689, -2.8303, 5.881545,
-2.692536, 2.636572, -5.47921,
3.799689, 2.636572, -5.47921,
-2.692536, 2.636572, 5.881545,
3.799689, 2.636572, 5.881545,
3.799689, -2.8303, -5.47921,
3.799689, 2.636572, -5.47921,
3.799689, -2.8303, 5.881545,
3.799689, 2.636572, 5.881545,
3.799689, -2.8303, -5.47921,
3.799689, -2.8303, 5.881545,
3.799689, 2.636572, -5.47921,
3.799689, 2.636572, 5.881545
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
var radius = 7.572411;
var distance = 33.69051;
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
mvMatrix.translate( -0.5535765, 0.0968641, -0.2011673 );
mvMatrix.scale( 1.261114, 1.497646, 0.7206773 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.69051);
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
Fentin_acetate<-read.table("Fentin_acetate.xyz")
```

```
## Error in read.table("Fentin_acetate.xyz"): no lines available in input
```

```r
x<-Fentin_acetate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Fentin_acetate' not found
```

```r
y<-Fentin_acetate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Fentin_acetate' not found
```

```r
z<-Fentin_acetate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Fentin_acetate' not found
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
-2.597989, 0.2405047, -1.009655, 0, 0, 1, 1, 1,
-2.506844, 0.4650835, -2.134067, 1, 0, 0, 1, 1,
-2.45202, -0.2644586, -3.65946, 1, 0, 0, 1, 1,
-2.432244, 0.07187319, -3.538687, 1, 0, 0, 1, 1,
-2.368392, -0.1890309, -1.44338, 1, 0, 0, 1, 1,
-2.36785, 0.3394487, -1.350284, 1, 0, 0, 1, 1,
-2.35649, 0.3894808, 0.03338927, 0, 0, 0, 1, 1,
-2.354333, -0.7998507, -2.043299, 0, 0, 0, 1, 1,
-2.331541, 1.553213, -1.721106, 0, 0, 0, 1, 1,
-2.3241, 0.1149945, -1.839882, 0, 0, 0, 1, 1,
-2.282895, 0.3314074, -2.334015, 0, 0, 0, 1, 1,
-2.27442, -0.3840314, -1.199673, 0, 0, 0, 1, 1,
-2.190723, 0.08834803, -1.438007, 0, 0, 0, 1, 1,
-2.150787, -0.6125971, -2.196471, 1, 1, 1, 1, 1,
-2.142574, 0.08756753, -1.020902, 1, 1, 1, 1, 1,
-2.138008, 1.394184, -2.703569, 1, 1, 1, 1, 1,
-2.137576, 1.751137, -0.6172984, 1, 1, 1, 1, 1,
-2.130323, 0.7974118, 0.03705795, 1, 1, 1, 1, 1,
-2.12062, 0.9139953, 0.4940225, 1, 1, 1, 1, 1,
-2.090194, 0.6246967, -1.76527, 1, 1, 1, 1, 1,
-2.063443, -0.4376817, -2.68549, 1, 1, 1, 1, 1,
-2.038537, 2.428526, -1.506995, 1, 1, 1, 1, 1,
-1.965498, 0.04639766, -2.800634, 1, 1, 1, 1, 1,
-1.964944, -0.9321253, -2.572018, 1, 1, 1, 1, 1,
-1.95769, 0.9957916, -0.2100403, 1, 1, 1, 1, 1,
-1.934875, 0.5694439, -1.277401, 1, 1, 1, 1, 1,
-1.886188, 0.1771372, -1.083108, 1, 1, 1, 1, 1,
-1.880372, 1.160324, -1.062384, 1, 1, 1, 1, 1,
-1.876543, -1.343355, -1.838035, 0, 0, 1, 1, 1,
-1.862757, 0.118515, -1.183461, 1, 0, 0, 1, 1,
-1.81869, -0.505522, -1.830799, 1, 0, 0, 1, 1,
-1.81625, -0.1296801, -3.66713, 1, 0, 0, 1, 1,
-1.80051, -0.01829158, -0.5163764, 1, 0, 0, 1, 1,
-1.799302, 1.02038, -1.494939, 1, 0, 0, 1, 1,
-1.796252, -0.5057182, -1.304317, 0, 0, 0, 1, 1,
-1.794619, -0.6712279, -1.363986, 0, 0, 0, 1, 1,
-1.784129, 1.353128, -2.189464, 0, 0, 0, 1, 1,
-1.780183, -1.905482, -2.963769, 0, 0, 0, 1, 1,
-1.771059, 0.3080519, -0.8455775, 0, 0, 0, 1, 1,
-1.745669, 2.098444, 0.4851714, 0, 0, 0, 1, 1,
-1.745485, 0.8731275, -0.4356907, 0, 0, 0, 1, 1,
-1.741434, 0.5773851, -1.632703, 1, 1, 1, 1, 1,
-1.731701, -0.1427201, -1.288362, 1, 1, 1, 1, 1,
-1.710156, 0.2403762, -1.672456, 1, 1, 1, 1, 1,
-1.69985, 2.529739, 0.05820989, 1, 1, 1, 1, 1,
-1.699777, -0.662441, -1.408959, 1, 1, 1, 1, 1,
-1.695318, -0.5223444, -0.6533539, 1, 1, 1, 1, 1,
-1.69032, 0.09331676, -1.936237, 1, 1, 1, 1, 1,
-1.689959, -0.6678079, -2.117213, 1, 1, 1, 1, 1,
-1.664216, 0.831064, -3.25262, 1, 1, 1, 1, 1,
-1.663955, 1.628283, -1.489604, 1, 1, 1, 1, 1,
-1.64681, 0.2781441, -3.229734, 1, 1, 1, 1, 1,
-1.634942, -0.2966909, -1.745326, 1, 1, 1, 1, 1,
-1.608332, 1.529233, -1.05645, 1, 1, 1, 1, 1,
-1.600225, 0.799845, 0.1532102, 1, 1, 1, 1, 1,
-1.58628, -0.1338112, -2.938092, 1, 1, 1, 1, 1,
-1.584395, -0.9297069, -3.651924, 0, 0, 1, 1, 1,
-1.577186, 1.30964, 0.6926115, 1, 0, 0, 1, 1,
-1.56647, -0.1481712, -2.587235, 1, 0, 0, 1, 1,
-1.560996, 0.2443669, -1.068981, 1, 0, 0, 1, 1,
-1.551932, 0.1967877, -0.4012587, 1, 0, 0, 1, 1,
-1.548451, -0.4259642, 0.4871109, 1, 0, 0, 1, 1,
-1.536022, 1.139122, -1.261973, 0, 0, 0, 1, 1,
-1.523721, 1.264209, -1.242758, 0, 0, 0, 1, 1,
-1.516155, 1.229726, -0.3520248, 0, 0, 0, 1, 1,
-1.508023, -0.4591279, -1.292169, 0, 0, 0, 1, 1,
-1.504698, -1.093207, -3.053486, 0, 0, 0, 1, 1,
-1.500107, 1.576869, 1.319087, 0, 0, 0, 1, 1,
-1.494709, 0.1645714, -1.340781, 0, 0, 0, 1, 1,
-1.477971, -0.03123542, -3.31423, 1, 1, 1, 1, 1,
-1.474953, -0.7451051, -4.465225, 1, 1, 1, 1, 1,
-1.465409, -0.1629235, -3.425964, 1, 1, 1, 1, 1,
-1.462164, 1.26016, -1.614497, 1, 1, 1, 1, 1,
-1.457311, 0.6791447, -0.7910023, 1, 1, 1, 1, 1,
-1.453272, -0.9730828, -2.430813, 1, 1, 1, 1, 1,
-1.434848, 0.413855, -3.487925, 1, 1, 1, 1, 1,
-1.418606, -1.118208, -3.23194, 1, 1, 1, 1, 1,
-1.409804, -0.4589112, -1.281153, 1, 1, 1, 1, 1,
-1.407534, 0.09153052, -1.749246, 1, 1, 1, 1, 1,
-1.4061, -0.8885338, -2.290511, 1, 1, 1, 1, 1,
-1.392174, -0.2779975, -2.921725, 1, 1, 1, 1, 1,
-1.388637, 0.5107427, -2.854263, 1, 1, 1, 1, 1,
-1.384627, -0.6303015, -1.554543, 1, 1, 1, 1, 1,
-1.375999, -0.7086869, -1.521359, 1, 1, 1, 1, 1,
-1.368051, 0.684521, -1.475303, 0, 0, 1, 1, 1,
-1.366386, -1.364846, -1.990624, 1, 0, 0, 1, 1,
-1.365872, -0.4320577, -1.054945, 1, 0, 0, 1, 1,
-1.362774, 0.2121019, -1.088392, 1, 0, 0, 1, 1,
-1.362488, -0.4459379, -1.917426, 1, 0, 0, 1, 1,
-1.351237, 2.044418, -0.6232228, 1, 0, 0, 1, 1,
-1.325669, -0.7469434, -2.874404, 0, 0, 0, 1, 1,
-1.306323, -2.173736, -1.775819, 0, 0, 0, 1, 1,
-1.304036, 0.761567, -3.403325, 0, 0, 0, 1, 1,
-1.298985, 0.5974753, -1.909741, 0, 0, 0, 1, 1,
-1.296777, 0.9873482, -2.393251, 0, 0, 0, 1, 1,
-1.295323, 0.3672691, -0.6372018, 0, 0, 0, 1, 1,
-1.291818, -0.7829744, -1.686605, 0, 0, 0, 1, 1,
-1.28093, 0.04123297, -2.073212, 1, 1, 1, 1, 1,
-1.276985, 0.05612482, -0.8794023, 1, 1, 1, 1, 1,
-1.276948, 0.6060039, 1.656743, 1, 1, 1, 1, 1,
-1.270045, -0.2324852, -1.195075, 1, 1, 1, 1, 1,
-1.267805, -0.1680901, -3.237526, 1, 1, 1, 1, 1,
-1.264167, -0.7603448, -4.209548, 1, 1, 1, 1, 1,
-1.264121, 0.05123782, 0.1209302, 1, 1, 1, 1, 1,
-1.263186, 0.5906242, -1.299372, 1, 1, 1, 1, 1,
-1.262715, 0.4338245, -1.298021, 1, 1, 1, 1, 1,
-1.250696, -0.594904, -0.8431771, 1, 1, 1, 1, 1,
-1.245906, 0.01365764, -2.822888, 1, 1, 1, 1, 1,
-1.238775, 1.219883, -0.2958258, 1, 1, 1, 1, 1,
-1.226264, 1.041773, -1.096101, 1, 1, 1, 1, 1,
-1.224933, 0.9104939, -2.178202, 1, 1, 1, 1, 1,
-1.223097, -1.310352, -2.140833, 1, 1, 1, 1, 1,
-1.221392, -0.2541277, -1.681773, 0, 0, 1, 1, 1,
-1.21893, 2.389337, 0.3693289, 1, 0, 0, 1, 1,
-1.20163, -0.3606736, -2.48647, 1, 0, 0, 1, 1,
-1.192, -0.3468091, -0.2634734, 1, 0, 0, 1, 1,
-1.184552, -0.3317038, -3.159724, 1, 0, 0, 1, 1,
-1.178859, 0.1705763, 0.4875678, 1, 0, 0, 1, 1,
-1.176737, 0.6006792, -1.572501, 0, 0, 0, 1, 1,
-1.175971, -0.731979, -1.773102, 0, 0, 0, 1, 1,
-1.166009, -1.010889, -2.322962, 0, 0, 0, 1, 1,
-1.162013, -0.1119576, -2.591949, 0, 0, 0, 1, 1,
-1.161974, -0.4085415, -1.626552, 0, 0, 0, 1, 1,
-1.157035, -0.3694734, -0.805209, 0, 0, 0, 1, 1,
-1.156428, -0.427568, -1.360935, 0, 0, 0, 1, 1,
-1.141248, -0.8349562, -1.183822, 1, 1, 1, 1, 1,
-1.133068, 0.5333249, -1.588243, 1, 1, 1, 1, 1,
-1.128317, -0.204127, -3.20392, 1, 1, 1, 1, 1,
-1.126227, -0.301061, -2.195318, 1, 1, 1, 1, 1,
-1.125109, 0.4257238, -1.265202, 1, 1, 1, 1, 1,
-1.124592, 0.6204641, -0.9228283, 1, 1, 1, 1, 1,
-1.123217, 1.45151, -2.443412, 1, 1, 1, 1, 1,
-1.112119, -0.7146859, -2.620336, 1, 1, 1, 1, 1,
-1.111539, -0.2148359, -1.112552, 1, 1, 1, 1, 1,
-1.111465, -0.1262114, -2.606307, 1, 1, 1, 1, 1,
-1.109857, -0.8453329, -1.755334, 1, 1, 1, 1, 1,
-1.107971, 1.536153, -1.41105, 1, 1, 1, 1, 1,
-1.105547, -0.6129254, -2.924973, 1, 1, 1, 1, 1,
-1.100555, -0.1781166, -2.277543, 1, 1, 1, 1, 1,
-1.090136, 1.375926, -0.6530316, 1, 1, 1, 1, 1,
-1.085314, 1.083094, -0.5186679, 0, 0, 1, 1, 1,
-1.084345, 0.05652912, -3.59397, 1, 0, 0, 1, 1,
-1.079039, -0.9577673, -2.374008, 1, 0, 0, 1, 1,
-1.068577, -1.40556, -1.758033, 1, 0, 0, 1, 1,
-1.065725, 0.0978017, -1.064755, 1, 0, 0, 1, 1,
-1.060125, 0.7296459, -0.9328716, 1, 0, 0, 1, 1,
-1.05873, -0.2511694, -0.7228158, 0, 0, 0, 1, 1,
-1.057636, 0.9650746, -0.7782812, 0, 0, 0, 1, 1,
-1.055688, -1.868183, -0.6634209, 0, 0, 0, 1, 1,
-1.054577, -0.02550059, -2.097346, 0, 0, 0, 1, 1,
-1.052735, 0.04903682, -2.166885, 0, 0, 0, 1, 1,
-1.047449, 0.9023896, -0.9799778, 0, 0, 0, 1, 1,
-1.044108, -0.7196002, -1.341084, 0, 0, 0, 1, 1,
-1.043366, -0.4252552, -0.8968043, 1, 1, 1, 1, 1,
-1.037684, -0.09645871, -2.509562, 1, 1, 1, 1, 1,
-1.026, -1.448269, -5.276182, 1, 1, 1, 1, 1,
-1.024866, -0.1293186, -2.98288, 1, 1, 1, 1, 1,
-1.024459, 0.1820169, -1.313142, 1, 1, 1, 1, 1,
-1.021205, 0.1771293, -0.02177421, 1, 1, 1, 1, 1,
-1.018096, -0.3038374, -2.515193, 1, 1, 1, 1, 1,
-1.017303, 1.975984, -3.02626, 1, 1, 1, 1, 1,
-1.016282, -0.02389107, -0.08834365, 1, 1, 1, 1, 1,
-1.015224, -2.735678, -1.640467, 1, 1, 1, 1, 1,
-1.009004, 0.09317821, -1.563532, 1, 1, 1, 1, 1,
-1.007962, -0.7102121, -1.344096, 1, 1, 1, 1, 1,
-1.004442, -0.02671675, -3.096193, 1, 1, 1, 1, 1,
-0.9984539, 0.3312605, -3.573535, 1, 1, 1, 1, 1,
-0.9762486, -1.252045, -3.954631, 1, 1, 1, 1, 1,
-0.9740885, 1.681314, -0.338162, 0, 0, 1, 1, 1,
-0.9698871, -0.3166696, 0.8784457, 1, 0, 0, 1, 1,
-0.9686946, -1.07766, -2.927861, 1, 0, 0, 1, 1,
-0.9643091, -0.6945316, -2.503073, 1, 0, 0, 1, 1,
-0.95832, -0.5979683, -0.6240916, 1, 0, 0, 1, 1,
-0.9560914, 0.9802482, -1.041691, 1, 0, 0, 1, 1,
-0.9534637, 1.891392, -1.538627, 0, 0, 0, 1, 1,
-0.9411759, 0.3257539, -0.8743427, 0, 0, 0, 1, 1,
-0.9347082, -1.385671, 0.1912057, 0, 0, 0, 1, 1,
-0.9309542, -0.5284396, -3.648706, 0, 0, 0, 1, 1,
-0.9276133, 0.2536197, -0.4679882, 0, 0, 0, 1, 1,
-0.9256101, -0.764709, -1.155802, 0, 0, 0, 1, 1,
-0.9253044, -0.3058904, -3.915827, 0, 0, 0, 1, 1,
-0.9195503, -0.761958, -0.8058838, 1, 1, 1, 1, 1,
-0.9168065, 0.4257897, -2.880831, 1, 1, 1, 1, 1,
-0.9151194, -1.372121, -3.18142, 1, 1, 1, 1, 1,
-0.9139326, -0.8641798, -2.486039, 1, 1, 1, 1, 1,
-0.9137641, -1.56721, -2.519346, 1, 1, 1, 1, 1,
-0.9127173, -1.21317, -2.58634, 1, 1, 1, 1, 1,
-0.9099424, -0.5830647, -1.660294, 1, 1, 1, 1, 1,
-0.9083359, -0.01052096, -2.166759, 1, 1, 1, 1, 1,
-0.9042094, 0.1530496, -1.842418, 1, 1, 1, 1, 1,
-0.9040407, -0.2505526, -2.290467, 1, 1, 1, 1, 1,
-0.8955204, -0.01753556, -2.143499, 1, 1, 1, 1, 1,
-0.8873339, -0.6055911, -1.118809, 1, 1, 1, 1, 1,
-0.8860893, 0.6002234, -0.8923031, 1, 1, 1, 1, 1,
-0.8806613, -0.06249388, -2.981913, 1, 1, 1, 1, 1,
-0.8732598, -0.0870455, -1.145177, 1, 1, 1, 1, 1,
-0.8663135, 0.8596974, 0.6382996, 0, 0, 1, 1, 1,
-0.855024, 0.6144997, -0.9710209, 1, 0, 0, 1, 1,
-0.8383814, -1.407039, -1.969288, 1, 0, 0, 1, 1,
-0.8353767, 1.584089, -1.280681, 1, 0, 0, 1, 1,
-0.8322265, -0.09798394, -2.396199, 1, 0, 0, 1, 1,
-0.8296197, 0.6264619, -1.996842, 1, 0, 0, 1, 1,
-0.819733, 1.621386, -2.119074, 0, 0, 0, 1, 1,
-0.8177515, -1.150889, -3.018802, 0, 0, 0, 1, 1,
-0.8172958, -1.623939, -3.969777, 0, 0, 0, 1, 1,
-0.8157415, -0.2657138, -2.197587, 0, 0, 0, 1, 1,
-0.814096, 0.2750146, -0.1371754, 0, 0, 0, 1, 1,
-0.8094969, 0.4322695, -0.8572978, 0, 0, 0, 1, 1,
-0.8080424, 0.278363, -2.374897, 0, 0, 0, 1, 1,
-0.805687, 0.6586328, -0.3775576, 1, 1, 1, 1, 1,
-0.8046623, 0.6387453, 0.09349612, 1, 1, 1, 1, 1,
-0.8030517, 1.478705, -1.690787, 1, 1, 1, 1, 1,
-0.7992308, -0.181024, -2.533714, 1, 1, 1, 1, 1,
-0.7949569, 0.9400271, -1.821946, 1, 1, 1, 1, 1,
-0.7941963, 0.3153072, -1.012243, 1, 1, 1, 1, 1,
-0.7917311, -0.828051, -3.685449, 1, 1, 1, 1, 1,
-0.7892604, -0.08870479, -0.07491335, 1, 1, 1, 1, 1,
-0.7876105, -1.204624, 0.04317793, 1, 1, 1, 1, 1,
-0.7872091, 0.2258348, -1.641373, 1, 1, 1, 1, 1,
-0.7866687, 0.277694, -1.402313, 1, 1, 1, 1, 1,
-0.7786854, -0.7223604, -2.035402, 1, 1, 1, 1, 1,
-0.7785434, 1.246019, -1.750453, 1, 1, 1, 1, 1,
-0.7748875, 2.162538, 0.3524616, 1, 1, 1, 1, 1,
-0.7725846, 0.6823701, -1.807897, 1, 1, 1, 1, 1,
-0.7692463, -0.7840532, -0.9502523, 0, 0, 1, 1, 1,
-0.7572, -0.4732204, -1.368887, 1, 0, 0, 1, 1,
-0.7477756, -1.511052, -2.203197, 1, 0, 0, 1, 1,
-0.7428933, -0.1219971, -1.117017, 1, 0, 0, 1, 1,
-0.742596, 0.5475819, -1.610063, 1, 0, 0, 1, 1,
-0.7412938, 1.722164, -0.5671399, 1, 0, 0, 1, 1,
-0.7382703, -0.9670405, -3.143608, 0, 0, 0, 1, 1,
-0.7314376, 0.02500471, -2.557664, 0, 0, 0, 1, 1,
-0.728897, -1.047297, -1.947489, 0, 0, 0, 1, 1,
-0.7281837, -0.01443472, -0.8440769, 0, 0, 0, 1, 1,
-0.7249622, 0.03872154, -2.748143, 0, 0, 0, 1, 1,
-0.7211466, -0.7111545, -2.430854, 0, 0, 0, 1, 1,
-0.7165711, 1.140565, -1.190836, 0, 0, 0, 1, 1,
-0.7162855, 1.895789, 0.05485192, 1, 1, 1, 1, 1,
-0.7162442, 1.114125, -0.2500497, 1, 1, 1, 1, 1,
-0.7122527, -1.335703, -1.885043, 1, 1, 1, 1, 1,
-0.7002307, 1.001616, -1.682326, 1, 1, 1, 1, 1,
-0.6972718, -0.681933, -2.450655, 1, 1, 1, 1, 1,
-0.6889301, -0.4175739, -4.120543, 1, 1, 1, 1, 1,
-0.6869086, 0.4888426, -2.440188, 1, 1, 1, 1, 1,
-0.6869041, 0.4409458, -1.711937, 1, 1, 1, 1, 1,
-0.6846198, -0.08214773, -1.855682, 1, 1, 1, 1, 1,
-0.6805285, 0.03417075, -3.286067, 1, 1, 1, 1, 1,
-0.6791851, -0.8570355, -3.087538, 1, 1, 1, 1, 1,
-0.6787939, 1.004608, 0.847625, 1, 1, 1, 1, 1,
-0.6755059, 2.083208, 0.7614098, 1, 1, 1, 1, 1,
-0.6731153, -0.495897, -2.820649, 1, 1, 1, 1, 1,
-0.6674712, 1.368624, 1.251384, 1, 1, 1, 1, 1,
-0.6645055, 0.3328258, 0.592209, 0, 0, 1, 1, 1,
-0.6606947, -1.17522, -1.727658, 1, 0, 0, 1, 1,
-0.6563187, 0.3979911, -0.3583731, 1, 0, 0, 1, 1,
-0.6518035, -0.01549881, -1.966387, 1, 0, 0, 1, 1,
-0.6513961, -1.10128, -3.413043, 1, 0, 0, 1, 1,
-0.6494057, 0.7036841, -0.2832484, 1, 0, 0, 1, 1,
-0.6465418, -1.71266, -2.661865, 0, 0, 0, 1, 1,
-0.6424382, -0.2147674, -2.032584, 0, 0, 0, 1, 1,
-0.6373615, -0.8932089, -3.882575, 0, 0, 0, 1, 1,
-0.6358294, -1.034953, -0.9154885, 0, 0, 0, 1, 1,
-0.6260647, -1.116309, -2.956883, 0, 0, 0, 1, 1,
-0.6217095, 0.3677618, -3.130463, 0, 0, 0, 1, 1,
-0.6210681, -1.028992, -1.020112, 0, 0, 0, 1, 1,
-0.6199312, -0.7524906, -2.642909, 1, 1, 1, 1, 1,
-0.6177771, 0.685356, 1.718487, 1, 1, 1, 1, 1,
-0.6119933, 0.1850536, -0.2544492, 1, 1, 1, 1, 1,
-0.6099038, -1.217474, -2.969476, 1, 1, 1, 1, 1,
-0.6025897, 0.3054127, -0.705344, 1, 1, 1, 1, 1,
-0.6018891, 1.244121, -1.570068, 1, 1, 1, 1, 1,
-0.5997577, 0.713272, -1.638988, 1, 1, 1, 1, 1,
-0.5977364, 0.6096995, 0.361559, 1, 1, 1, 1, 1,
-0.597561, -0.2352389, -2.299654, 1, 1, 1, 1, 1,
-0.5973582, -0.2600076, -3.335914, 1, 1, 1, 1, 1,
-0.5970767, -2.217677, -3.497379, 1, 1, 1, 1, 1,
-0.5968689, 0.2641499, -1.428915, 1, 1, 1, 1, 1,
-0.5937952, -0.774857, -3.536244, 1, 1, 1, 1, 1,
-0.5822787, 0.4821535, 0.1541497, 1, 1, 1, 1, 1,
-0.5771711, -0.1712618, -1.384174, 1, 1, 1, 1, 1,
-0.575144, -0.7093614, -2.465584, 0, 0, 1, 1, 1,
-0.5669138, -1.271454, -2.355599, 1, 0, 0, 1, 1,
-0.566229, 0.2559542, -0.6727766, 1, 0, 0, 1, 1,
-0.5635443, 0.06752687, 0.1746847, 1, 0, 0, 1, 1,
-0.562985, -1.981106, -3.937733, 1, 0, 0, 1, 1,
-0.5618539, -1.892538, -3.921986, 1, 0, 0, 1, 1,
-0.5616783, -0.555033, -1.842404, 0, 0, 0, 1, 1,
-0.5509831, -0.7303582, -1.415111, 0, 0, 0, 1, 1,
-0.5468988, -0.1226156, -1.515888, 0, 0, 0, 1, 1,
-0.5457748, 1.330985, -0.4378819, 0, 0, 0, 1, 1,
-0.5421817, 0.325579, -0.63339, 0, 0, 0, 1, 1,
-0.5410498, 0.2427836, 0.9806685, 0, 0, 0, 1, 1,
-0.5400528, -1.925471, -2.17861, 0, 0, 0, 1, 1,
-0.5371797, 1.595453, -0.8230937, 1, 1, 1, 1, 1,
-0.5366338, -0.5355978, -1.799264, 1, 1, 1, 1, 1,
-0.534408, 1.920407, -0.3935745, 1, 1, 1, 1, 1,
-0.5276802, -0.2467594, -2.588222, 1, 1, 1, 1, 1,
-0.5272289, -2.264058, -2.372411, 1, 1, 1, 1, 1,
-0.525304, 0.5412458, -2.085429, 1, 1, 1, 1, 1,
-0.5244372, -2.045714, -3.874209, 1, 1, 1, 1, 1,
-0.5238013, 1.015087, 1.113545, 1, 1, 1, 1, 1,
-0.5226744, -0.7470327, -1.313516, 1, 1, 1, 1, 1,
-0.5225304, -1.208469, -2.667693, 1, 1, 1, 1, 1,
-0.5215104, -1.442181, -1.837996, 1, 1, 1, 1, 1,
-0.5193677, -0.4116527, -1.652384, 1, 1, 1, 1, 1,
-0.5129625, 0.5312694, 0.5160431, 1, 1, 1, 1, 1,
-0.5115386, -0.1734469, -0.315331, 1, 1, 1, 1, 1,
-0.5099013, -1.113664, -3.323258, 1, 1, 1, 1, 1,
-0.5054383, 0.3761924, -3.180609, 0, 0, 1, 1, 1,
-0.5042922, 0.02959539, -3.437195, 1, 0, 0, 1, 1,
-0.5003752, -1.614352, -3.079532, 1, 0, 0, 1, 1,
-0.4952802, -0.7143261, -1.92845, 1, 0, 0, 1, 1,
-0.4948626, -0.6178838, -3.228421, 1, 0, 0, 1, 1,
-0.4938037, 0.7923202, -0.6554606, 1, 0, 0, 1, 1,
-0.4921313, 0.9767047, 0.2365285, 0, 0, 0, 1, 1,
-0.4914707, 0.1314776, -1.125887, 0, 0, 0, 1, 1,
-0.4907951, -1.138372, -2.489624, 0, 0, 0, 1, 1,
-0.4906293, -0.5351076, 0.1478378, 0, 0, 0, 1, 1,
-0.4884173, -0.395259, -2.065658, 0, 0, 0, 1, 1,
-0.4876782, 0.009669973, -2.472419, 0, 0, 0, 1, 1,
-0.4851861, 2.05925, 0.1064375, 0, 0, 0, 1, 1,
-0.4759301, 0.130586, -0.4868109, 1, 1, 1, 1, 1,
-0.4741217, 0.3141491, -3.736846, 1, 1, 1, 1, 1,
-0.4738172, -0.2907077, -1.370079, 1, 1, 1, 1, 1,
-0.4688655, -0.6481031, -2.773501, 1, 1, 1, 1, 1,
-0.4665232, 0.8017721, -1.307209, 1, 1, 1, 1, 1,
-0.466284, -0.6165694, -2.712194, 1, 1, 1, 1, 1,
-0.464707, 0.7581827, -2.094232, 1, 1, 1, 1, 1,
-0.4644987, -0.3440203, -1.064717, 1, 1, 1, 1, 1,
-0.4596457, -0.08778179, -2.567764, 1, 1, 1, 1, 1,
-0.4576842, 0.1737493, -1.868181, 1, 1, 1, 1, 1,
-0.4543258, 1.273081, -1.411739, 1, 1, 1, 1, 1,
-0.451017, -0.8563396, -2.918889, 1, 1, 1, 1, 1,
-0.4505518, 0.01631725, -1.921127, 1, 1, 1, 1, 1,
-0.449522, -0.5998212, -3.606308, 1, 1, 1, 1, 1,
-0.4492936, -0.1053179, -0.7444525, 1, 1, 1, 1, 1,
-0.4463576, -0.2298418, -1.342631, 0, 0, 1, 1, 1,
-0.4449112, -1.773437, -2.19354, 1, 0, 0, 1, 1,
-0.4419824, 0.7331171, -1.879338, 1, 0, 0, 1, 1,
-0.4416294, 0.1317618, -3.297234, 1, 0, 0, 1, 1,
-0.4264436, 0.3564118, -0.7900514, 1, 0, 0, 1, 1,
-0.4251369, 0.6131986, -0.6881992, 1, 0, 0, 1, 1,
-0.4236893, -0.2878671, -2.407104, 0, 0, 0, 1, 1,
-0.4207178, 2.327858, 1.3685, 0, 0, 0, 1, 1,
-0.4177827, 0.04646612, -2.268778, 0, 0, 0, 1, 1,
-0.4174592, 0.1581, -0.5685254, 0, 0, 0, 1, 1,
-0.4168492, 0.8002386, 0.01591741, 0, 0, 0, 1, 1,
-0.4159109, 0.2901846, -1.358258, 0, 0, 0, 1, 1,
-0.4100914, 0.4851056, -2.085056, 0, 0, 0, 1, 1,
-0.4086601, 0.147268, 0.2030293, 1, 1, 1, 1, 1,
-0.4081702, 1.224586, -0.6072153, 1, 1, 1, 1, 1,
-0.3941801, 1.495365, -0.5149276, 1, 1, 1, 1, 1,
-0.3938466, 0.1449796, -1.568464, 1, 1, 1, 1, 1,
-0.3861872, 0.13655, -0.7555143, 1, 1, 1, 1, 1,
-0.3856924, 1.946591, -1.139076, 1, 1, 1, 1, 1,
-0.3772964, -1.149761, -1.950486, 1, 1, 1, 1, 1,
-0.3768154, -0.2488854, -3.909012, 1, 1, 1, 1, 1,
-0.3724015, 0.7356489, -2.79524, 1, 1, 1, 1, 1,
-0.3711207, 1.669336, 0.1769204, 1, 1, 1, 1, 1,
-0.3671583, 0.9702976, -0.9309087, 1, 1, 1, 1, 1,
-0.3653118, -0.9099109, -2.06741, 1, 1, 1, 1, 1,
-0.3649474, 0.4301853, -0.523699, 1, 1, 1, 1, 1,
-0.359617, -0.344409, -1.450248, 1, 1, 1, 1, 1,
-0.3586726, -0.11269, -1.123033, 1, 1, 1, 1, 1,
-0.3572354, -0.8535798, 0.2033482, 0, 0, 1, 1, 1,
-0.3551807, -0.7984855, -2.364985, 1, 0, 0, 1, 1,
-0.3520916, -1.05601, -2.321605, 1, 0, 0, 1, 1,
-0.3500574, 0.1405831, -1.216112, 1, 0, 0, 1, 1,
-0.3492354, -0.1224026, -3.24534, 1, 0, 0, 1, 1,
-0.3456131, 1.298371, -0.4565389, 1, 0, 0, 1, 1,
-0.3438222, -0.7609993, -2.407822, 0, 0, 0, 1, 1,
-0.3348713, -0.06931844, -1.201021, 0, 0, 0, 1, 1,
-0.334222, -0.4689547, -3.673316, 0, 0, 0, 1, 1,
-0.3307949, -0.5184236, -3.495072, 0, 0, 0, 1, 1,
-0.3242731, -0.8667323, -2.712603, 0, 0, 0, 1, 1,
-0.3203486, 1.671677, -1.202427, 0, 0, 0, 1, 1,
-0.319183, 1.263173, -0.176132, 0, 0, 0, 1, 1,
-0.3167265, -0.7614138, -3.185169, 1, 1, 1, 1, 1,
-0.3135183, 0.7577447, -0.3086312, 1, 1, 1, 1, 1,
-0.3114179, 0.6794026, -0.8690441, 1, 1, 1, 1, 1,
-0.3107174, 0.1851989, -1.386559, 1, 1, 1, 1, 1,
-0.3046244, -0.6871209, -3.96765, 1, 1, 1, 1, 1,
-0.2967263, -2.568333, -2.403819, 1, 1, 1, 1, 1,
-0.2950291, -0.2319773, -0.4056743, 1, 1, 1, 1, 1,
-0.2929282, 0.9482245, -2.437557, 1, 1, 1, 1, 1,
-0.2896883, -0.5051444, -2.911361, 1, 1, 1, 1, 1,
-0.2835594, 0.1113671, -2.226967, 1, 1, 1, 1, 1,
-0.2817591, 0.3641919, -0.8181046, 1, 1, 1, 1, 1,
-0.2805798, 1.468045, 0.7793775, 1, 1, 1, 1, 1,
-0.2776172, -0.6227391, -0.7678589, 1, 1, 1, 1, 1,
-0.2736191, -1.419418, -2.656898, 1, 1, 1, 1, 1,
-0.2735479, 0.2951232, -1.159482, 1, 1, 1, 1, 1,
-0.2727484, -0.3866217, -3.051693, 0, 0, 1, 1, 1,
-0.2720247, 0.5247876, -0.4630857, 1, 0, 0, 1, 1,
-0.2715853, -0.8432261, -2.23528, 1, 0, 0, 1, 1,
-0.2685857, -0.08842274, -1.347055, 1, 0, 0, 1, 1,
-0.2680762, -0.08487587, -3.663046, 1, 0, 0, 1, 1,
-0.2660565, 0.7876661, 0.9612669, 1, 0, 0, 1, 1,
-0.2657434, -2.390044, -2.502746, 0, 0, 0, 1, 1,
-0.2645381, 0.07301121, -0.2520158, 0, 0, 0, 1, 1,
-0.263546, 1.058335, -0.5656264, 0, 0, 0, 1, 1,
-0.2598649, 1.856314, -2.517068, 0, 0, 0, 1, 1,
-0.2582583, 0.5379463, -1.828565, 0, 0, 0, 1, 1,
-0.2576495, 1.695337, -0.8942766, 0, 0, 0, 1, 1,
-0.2535398, -1.53398, -3.023787, 0, 0, 0, 1, 1,
-0.2526157, 1.130791, -0.6237206, 1, 1, 1, 1, 1,
-0.2516039, -0.03765607, -2.780626, 1, 1, 1, 1, 1,
-0.2515881, 0.1735902, -1.715061, 1, 1, 1, 1, 1,
-0.2422777, -1.408631, -3.180071, 1, 1, 1, 1, 1,
-0.2400852, 0.2174217, -1.562154, 1, 1, 1, 1, 1,
-0.2382741, -0.2853482, -3.567783, 1, 1, 1, 1, 1,
-0.2373276, 0.2304065, 1.448835, 1, 1, 1, 1, 1,
-0.2358235, 0.623264, 0.4885102, 1, 1, 1, 1, 1,
-0.2336147, 0.1020913, -0.2664742, 1, 1, 1, 1, 1,
-0.2329127, -0.1242987, -2.565261, 1, 1, 1, 1, 1,
-0.2328333, -0.07331107, -0.6668654, 1, 1, 1, 1, 1,
-0.2324631, 1.094465, -0.9447129, 1, 1, 1, 1, 1,
-0.2270039, -0.05754344, -0.1273442, 1, 1, 1, 1, 1,
-0.2211301, -0.8086013, -4.645977, 1, 1, 1, 1, 1,
-0.215498, -0.2908387, -1.531548, 1, 1, 1, 1, 1,
-0.2147882, 0.5775752, 0.005610885, 0, 0, 1, 1, 1,
-0.2144951, 0.5517316, 2.254957, 1, 0, 0, 1, 1,
-0.213378, 0.5599191, 0.4672418, 1, 0, 0, 1, 1,
-0.2078269, -0.4458615, -1.6259, 1, 0, 0, 1, 1,
-0.2078035, 1.130478, 0.2554948, 1, 0, 0, 1, 1,
-0.20695, 0.4688333, -0.01891042, 1, 0, 0, 1, 1,
-0.2064224, 0.04545999, -0.9712127, 0, 0, 0, 1, 1,
-0.1955327, 1.454704, 0.01110176, 0, 0, 0, 1, 1,
-0.1894917, -0.9712409, -2.25681, 0, 0, 0, 1, 1,
-0.1891278, -1.283477, -2.059492, 0, 0, 0, 1, 1,
-0.1876107, -2.008556, -3.969944, 0, 0, 0, 1, 1,
-0.1871565, -0.5427514, -3.521423, 0, 0, 0, 1, 1,
-0.1862339, -0.1625029, -1.69181, 0, 0, 0, 1, 1,
-0.1778755, 0.5174428, 0.7645341, 1, 1, 1, 1, 1,
-0.1741789, 1.860608, -0.3431383, 1, 1, 1, 1, 1,
-0.1694309, -0.48042, -1.766003, 1, 1, 1, 1, 1,
-0.1684573, -2.750685, -4.018464, 1, 1, 1, 1, 1,
-0.1654983, -0.5273558, -3.936052, 1, 1, 1, 1, 1,
-0.1606633, 0.7871364, 1.489024, 1, 1, 1, 1, 1,
-0.1594371, 0.2077705, 0.3433413, 1, 1, 1, 1, 1,
-0.1572303, -1.674918, -2.205921, 1, 1, 1, 1, 1,
-0.1567821, -0.07467999, -1.828206, 1, 1, 1, 1, 1,
-0.1563777, 0.02561006, -1.831002, 1, 1, 1, 1, 1,
-0.1548211, -0.9582896, -3.765957, 1, 1, 1, 1, 1,
-0.1487491, -0.9906229, -2.927876, 1, 1, 1, 1, 1,
-0.1471452, -2.132912, -3.796693, 1, 1, 1, 1, 1,
-0.1434226, 0.7527435, -0.05164669, 1, 1, 1, 1, 1,
-0.1429252, 0.5761981, -1.017078, 1, 1, 1, 1, 1,
-0.1428138, 0.2053209, 0.3383997, 0, 0, 1, 1, 1,
-0.1322949, 0.2570361, -1.043937, 1, 0, 0, 1, 1,
-0.1205739, 0.8648786, -0.2322408, 1, 0, 0, 1, 1,
-0.1197956, -1.479404, -2.871855, 1, 0, 0, 1, 1,
-0.1161102, -0.9718508, -5.313763, 1, 0, 0, 1, 1,
-0.1134332, -1.376675, -3.461108, 1, 0, 0, 1, 1,
-0.1122244, -1.078156, -3.95857, 0, 0, 0, 1, 1,
-0.1094161, -1.405765, -3.563305, 0, 0, 0, 1, 1,
-0.1087727, -0.1141305, -2.775353, 0, 0, 0, 1, 1,
-0.1071489, -0.5706277, -3.273555, 0, 0, 0, 1, 1,
-0.1029969, 0.5275691, -0.02258401, 0, 0, 0, 1, 1,
-0.1014475, -0.5569842, -2.879462, 0, 0, 0, 1, 1,
-0.09969065, 0.8003715, 0.9878699, 0, 0, 0, 1, 1,
-0.09895721, 1.099247, -1.403046, 1, 1, 1, 1, 1,
-0.09772541, -0.251713, -3.135382, 1, 1, 1, 1, 1,
-0.09291426, -0.2246688, -2.840673, 1, 1, 1, 1, 1,
-0.09200943, 0.6629729, 1.004374, 1, 1, 1, 1, 1,
-0.08798298, -0.8885413, -3.175277, 1, 1, 1, 1, 1,
-0.08709233, 0.5021389, 0.8887967, 1, 1, 1, 1, 1,
-0.08228445, 1.748255, 1.553177, 1, 1, 1, 1, 1,
-0.08054861, -0.6074726, -2.527251, 1, 1, 1, 1, 1,
-0.07631154, 1.481721, 2.44253, 1, 1, 1, 1, 1,
-0.07594482, 2.428478, -0.1317756, 1, 1, 1, 1, 1,
-0.07572414, -1.808338, -3.435597, 1, 1, 1, 1, 1,
-0.07411746, 0.00896707, -1.343109, 1, 1, 1, 1, 1,
-0.07325506, -0.9900768, -3.526392, 1, 1, 1, 1, 1,
-0.07046907, 0.7216476, 1.335901, 1, 1, 1, 1, 1,
-0.06912667, -0.9868824, -3.453631, 1, 1, 1, 1, 1,
-0.0676984, 0.7574898, 0.1783879, 0, 0, 1, 1, 1,
-0.06506781, -0.4394691, -2.206248, 1, 0, 0, 1, 1,
-0.0618195, -0.6681417, -5.107339, 1, 0, 0, 1, 1,
-0.06144562, 0.1623916, 0.3450075, 1, 0, 0, 1, 1,
-0.05792383, 0.8912018, -0.6474009, 1, 0, 0, 1, 1,
-0.05635993, 2.160286, 0.2716182, 1, 0, 0, 1, 1,
-0.05342406, 0.3593983, 1.974425, 0, 0, 0, 1, 1,
-0.04884506, 0.3900034, 0.2292661, 0, 0, 0, 1, 1,
-0.0428297, 0.7742144, 0.3937853, 0, 0, 0, 1, 1,
-0.0414773, 1.51334, -0.370844, 0, 0, 0, 1, 1,
-0.03927337, 1.003496, -2.521089, 0, 0, 0, 1, 1,
-0.0377952, -0.4279428, -4.207182, 0, 0, 0, 1, 1,
-0.03652042, -2.446793, -4.124139, 0, 0, 0, 1, 1,
-0.03513769, 0.1455813, -1.724005, 1, 1, 1, 1, 1,
-0.03382836, -1.141531, -2.145276, 1, 1, 1, 1, 1,
-0.03193398, 0.7660176, 0.06723119, 1, 1, 1, 1, 1,
-0.03041179, 1.263469, 1.658033, 1, 1, 1, 1, 1,
-0.02517915, 0.3725253, -0.5682812, 1, 1, 1, 1, 1,
-0.02294209, -0.3079641, -2.644407, 1, 1, 1, 1, 1,
-0.02074986, -0.02537257, -1.117155, 1, 1, 1, 1, 1,
-0.01744514, 1.390122, 0.2189372, 1, 1, 1, 1, 1,
-0.01618086, 2.161907, 0.4528272, 1, 1, 1, 1, 1,
-0.01444928, -0.2076874, -4.708511, 1, 1, 1, 1, 1,
-0.01218129, 0.1813888, -0.08050688, 1, 1, 1, 1, 1,
-0.01123522, -0.5711078, -1.93525, 1, 1, 1, 1, 1,
-0.00988315, -0.7369954, -3.320138, 1, 1, 1, 1, 1,
-0.0002565822, -0.1481543, -2.968564, 1, 1, 1, 1, 1,
0.003156169, -0.4294573, 4.212482, 1, 1, 1, 1, 1,
0.008099736, 0.5811706, 0.08302893, 0, 0, 1, 1, 1,
0.009712511, 0.1374611, -0.05401251, 1, 0, 0, 1, 1,
0.01416774, 0.1902213, -0.8406879, 1, 0, 0, 1, 1,
0.01898894, -1.14278, 3.40083, 1, 0, 0, 1, 1,
0.01948785, -0.00772534, 0.8422412, 1, 0, 0, 1, 1,
0.02002756, 0.8395333, -0.9258937, 1, 0, 0, 1, 1,
0.02682776, 1.764105, -0.04232394, 0, 0, 0, 1, 1,
0.02716306, 0.9143059, 0.6275324, 0, 0, 0, 1, 1,
0.02845971, -0.6107274, 1.869333, 0, 0, 0, 1, 1,
0.03537529, 1.620575, 0.3518473, 0, 0, 0, 1, 1,
0.03633695, -0.8483261, 5.456362, 0, 0, 0, 1, 1,
0.03682005, -1.061159, 2.458627, 0, 0, 0, 1, 1,
0.03740419, 1.85692, -0.152758, 0, 0, 0, 1, 1,
0.04029787, -0.4621833, 3.789845, 1, 1, 1, 1, 1,
0.04037141, -0.1289426, 2.153577, 1, 1, 1, 1, 1,
0.04151879, -1.317444, 1.098871, 1, 1, 1, 1, 1,
0.04254278, -1.011719, 1.8765, 1, 1, 1, 1, 1,
0.04315958, -2.058484, 3.423883, 1, 1, 1, 1, 1,
0.04434257, -0.1841212, 2.187148, 1, 1, 1, 1, 1,
0.04447768, -0.8467624, 1.730215, 1, 1, 1, 1, 1,
0.04818587, 0.3047594, -1.269953, 1, 1, 1, 1, 1,
0.04921632, 0.9281627, -0.4636005, 1, 1, 1, 1, 1,
0.05107542, -1.086277, 2.306213, 1, 1, 1, 1, 1,
0.05497295, -1.267599, 2.297853, 1, 1, 1, 1, 1,
0.06117426, -2.126721, 2.064892, 1, 1, 1, 1, 1,
0.06715538, -0.6033146, 3.890443, 1, 1, 1, 1, 1,
0.06881307, 0.8771216, -1.953097, 1, 1, 1, 1, 1,
0.07058545, 0.8957977, -0.3985859, 1, 1, 1, 1, 1,
0.0710192, -0.2161747, 2.481247, 0, 0, 1, 1, 1,
0.07626425, -0.4965889, 3.473811, 1, 0, 0, 1, 1,
0.0917277, 0.01507209, 2.32659, 1, 0, 0, 1, 1,
0.09186839, -0.4134401, 2.849875, 1, 0, 0, 1, 1,
0.09418234, -0.6555846, 3.450164, 1, 0, 0, 1, 1,
0.0957856, -0.9546214, 0.990472, 1, 0, 0, 1, 1,
0.09745475, -0.7187887, 1.935537, 0, 0, 0, 1, 1,
0.1052705, 0.5463539, -0.1391071, 0, 0, 0, 1, 1,
0.107095, 2.54459, 0.3784859, 0, 0, 0, 1, 1,
0.1074689, -0.2263148, 2.165498, 0, 0, 0, 1, 1,
0.1082662, 1.745217, 3.153634, 0, 0, 0, 1, 1,
0.1113631, -0.2605871, 1.597625, 0, 0, 0, 1, 1,
0.1116425, -0.3580226, 3.78445, 0, 0, 0, 1, 1,
0.1122612, -1.196965, 3.132117, 1, 1, 1, 1, 1,
0.1141511, 0.771701, -2.123333, 1, 1, 1, 1, 1,
0.1150272, -0.4159794, 2.037154, 1, 1, 1, 1, 1,
0.1150374, 0.3320867, 0.4386371, 1, 1, 1, 1, 1,
0.1184037, 0.4174089, -1.436171, 1, 1, 1, 1, 1,
0.1194656, 1.354676, -0.5968894, 1, 1, 1, 1, 1,
0.1228, 1.183523, 0.8837243, 1, 1, 1, 1, 1,
0.1229903, -0.3803666, 3.847677, 1, 1, 1, 1, 1,
0.1238385, 0.8273363, -0.8218381, 1, 1, 1, 1, 1,
0.125525, -1.364782, 3.796727, 1, 1, 1, 1, 1,
0.1258839, -0.5532545, 4.413629, 1, 1, 1, 1, 1,
0.1320083, -0.412854, 2.701445, 1, 1, 1, 1, 1,
0.1347245, -0.09086558, 1.983158, 1, 1, 1, 1, 1,
0.1353982, 0.5431343, 0.6202108, 1, 1, 1, 1, 1,
0.1379015, -0.09985647, 1.891668, 1, 1, 1, 1, 1,
0.1400284, 1.712591, -0.03966039, 0, 0, 1, 1, 1,
0.1430104, -1.02154, 3.461013, 1, 0, 0, 1, 1,
0.1430372, 1.950658, 1.833234, 1, 0, 0, 1, 1,
0.1431623, 0.1126375, 0.9544454, 1, 0, 0, 1, 1,
0.1489599, 0.9023297, -0.725381, 1, 0, 0, 1, 1,
0.149091, -1.821448, 3.913033, 1, 0, 0, 1, 1,
0.150657, 1.434733, 2.67178, 0, 0, 0, 1, 1,
0.1575712, 0.2711415, 0.04069981, 0, 0, 0, 1, 1,
0.1598549, -0.3982565, 2.115244, 0, 0, 0, 1, 1,
0.161184, -1.613724, 3.327726, 0, 0, 0, 1, 1,
0.1615369, 0.464662, 0.158612, 0, 0, 0, 1, 1,
0.162503, -0.4076152, 1.294894, 0, 0, 0, 1, 1,
0.1650809, -0.4799831, 0.9584407, 0, 0, 0, 1, 1,
0.1670694, 0.2967873, 0.6076881, 1, 1, 1, 1, 1,
0.1675082, -0.2923561, 2.464096, 1, 1, 1, 1, 1,
0.1703422, -0.3202024, 3.028189, 1, 1, 1, 1, 1,
0.171092, -0.5065966, 2.319647, 1, 1, 1, 1, 1,
0.1722779, 0.5753971, 0.6787833, 1, 1, 1, 1, 1,
0.1745355, -0.1715116, 2.379536, 1, 1, 1, 1, 1,
0.1783504, 0.2024925, 2.552608, 1, 1, 1, 1, 1,
0.1796443, -0.3504597, 2.031442, 1, 1, 1, 1, 1,
0.1818266, -0.6294177, 3.185157, 1, 1, 1, 1, 1,
0.1827125, -0.7945848, 1.183673, 1, 1, 1, 1, 1,
0.1843338, 0.1418361, 2.061808, 1, 1, 1, 1, 1,
0.1845907, -1.522439, 3.389934, 1, 1, 1, 1, 1,
0.1888566, -0.5404434, 2.687957, 1, 1, 1, 1, 1,
0.1888605, -1.299022, 3.770247, 1, 1, 1, 1, 1,
0.1898657, -0.05088391, 1.465221, 1, 1, 1, 1, 1,
0.1909244, -2.564442, 1.835202, 0, 0, 1, 1, 1,
0.1921351, 2.024559, -0.9835958, 1, 0, 0, 1, 1,
0.1934839, -0.3205433, 2.464562, 1, 0, 0, 1, 1,
0.1967518, -0.2139271, 2.862546, 1, 0, 0, 1, 1,
0.1970386, -1.789541, 2.301225, 1, 0, 0, 1, 1,
0.1995814, -1.466299, 5.716097, 1, 0, 0, 1, 1,
0.2012488, 1.146097, 2.060692, 0, 0, 0, 1, 1,
0.2028822, 1.218191, -0.298206, 0, 0, 0, 1, 1,
0.2046875, 0.6240845, 0.1695892, 0, 0, 0, 1, 1,
0.2049532, -1.360714, 4.29546, 0, 0, 0, 1, 1,
0.212683, 1.679657, -0.4510609, 0, 0, 0, 1, 1,
0.2136819, 0.7412675, 0.8161022, 0, 0, 0, 1, 1,
0.2152437, 0.592287, 0.4902369, 0, 0, 0, 1, 1,
0.2234348, 0.1671902, 0.9362268, 1, 1, 1, 1, 1,
0.2241684, 1.351407, -0.9160584, 1, 1, 1, 1, 1,
0.227409, 0.1326537, 1.094067, 1, 1, 1, 1, 1,
0.2292667, -0.157968, 2.962194, 1, 1, 1, 1, 1,
0.2308277, -0.1449043, 3.256987, 1, 1, 1, 1, 1,
0.2316017, 0.2139183, 0.9636286, 1, 1, 1, 1, 1,
0.2346248, 0.6517893, 0.1359864, 1, 1, 1, 1, 1,
0.2378584, 0.06106877, 3.351021, 1, 1, 1, 1, 1,
0.2419255, 1.218055, 0.6071641, 1, 1, 1, 1, 1,
0.2461695, -1.143064, 0.6583204, 1, 1, 1, 1, 1,
0.2461808, -0.286182, 3.223924, 1, 1, 1, 1, 1,
0.2471281, 0.2037194, 0.8095745, 1, 1, 1, 1, 1,
0.2498335, 0.1353729, 0.8258428, 1, 1, 1, 1, 1,
0.2557218, 1.587107, -1.626648, 1, 1, 1, 1, 1,
0.2564979, 1.159373, 1.024172, 1, 1, 1, 1, 1,
0.2638716, 0.4265691, 1.54487, 0, 0, 1, 1, 1,
0.263998, -0.2732499, 2.33964, 1, 0, 0, 1, 1,
0.2677067, 0.150614, -0.533601, 1, 0, 0, 1, 1,
0.2682014, 0.4243577, -0.268981, 1, 0, 0, 1, 1,
0.2689044, 0.7372919, -2.105022, 1, 0, 0, 1, 1,
0.273547, -1.534841, 2.013321, 1, 0, 0, 1, 1,
0.274139, 0.5864269, 1.390342, 0, 0, 0, 1, 1,
0.2777334, 1.041931, -0.4022913, 0, 0, 0, 1, 1,
0.2812667, 0.4426815, 1.234638, 0, 0, 0, 1, 1,
0.2814568, -1.382869, 2.778417, 0, 0, 0, 1, 1,
0.2818174, 0.6476883, -0.4444382, 0, 0, 0, 1, 1,
0.2899756, 0.8007043, -1.053596, 0, 0, 0, 1, 1,
0.2946056, -0.5616533, 5.339073, 0, 0, 0, 1, 1,
0.2995327, -0.1633882, 1.291417, 1, 1, 1, 1, 1,
0.3058676, -1.032473, 3.292733, 1, 1, 1, 1, 1,
0.3067081, 0.406546, 1.956541, 1, 1, 1, 1, 1,
0.3073524, -0.176181, 1.981512, 1, 1, 1, 1, 1,
0.3117675, -0.8407322, 4.552076, 1, 1, 1, 1, 1,
0.3176622, -0.5858262, 2.646308, 1, 1, 1, 1, 1,
0.3220688, 0.5785267, 0.5241354, 1, 1, 1, 1, 1,
0.3293869, 0.8490453, 1.218347, 1, 1, 1, 1, 1,
0.3309807, -0.5401401, 3.4316, 1, 1, 1, 1, 1,
0.33446, 2.315984, 0.406869, 1, 1, 1, 1, 1,
0.3356948, 0.05641068, 1.238592, 1, 1, 1, 1, 1,
0.3358957, -0.6339231, 3.06535, 1, 1, 1, 1, 1,
0.3367914, -0.05484885, 2.176156, 1, 1, 1, 1, 1,
0.3469602, -0.4845518, 2.091983, 1, 1, 1, 1, 1,
0.3493031, -1.222803, 2.92472, 1, 1, 1, 1, 1,
0.3498293, 0.6092501, 1.007251, 0, 0, 1, 1, 1,
0.352082, -1.523648, 2.796645, 1, 0, 0, 1, 1,
0.3585938, -0.9341186, 4.456127, 1, 0, 0, 1, 1,
0.3631493, 2.16711, 0.3217515, 1, 0, 0, 1, 1,
0.3634168, 0.1028738, -0.3356962, 1, 0, 0, 1, 1,
0.3648815, 1.277885, -1.350053, 1, 0, 0, 1, 1,
0.3658985, -0.1728366, 1.317728, 0, 0, 0, 1, 1,
0.366037, -0.07509997, 0.6667681, 0, 0, 0, 1, 1,
0.3688633, -0.9853291, 1.408751, 0, 0, 0, 1, 1,
0.3691872, 0.4286598, 1.537259, 0, 0, 0, 1, 1,
0.3699546, -1.186585, 4.154521, 0, 0, 0, 1, 1,
0.3731478, -0.4730899, 1.409464, 0, 0, 0, 1, 1,
0.380412, 0.4400789, 0.5778194, 0, 0, 0, 1, 1,
0.3805035, 0.1808584, 1.231189, 1, 1, 1, 1, 1,
0.3838836, -1.414523, 2.926434, 1, 1, 1, 1, 1,
0.3853991, 0.6233236, 1.713758, 1, 1, 1, 1, 1,
0.3860111, 0.3393088, 1.456681, 1, 1, 1, 1, 1,
0.3872707, 0.4952193, -0.2881079, 1, 1, 1, 1, 1,
0.3876524, 0.04856066, -1.369529, 1, 1, 1, 1, 1,
0.3892162, 0.1411622, 1.392004, 1, 1, 1, 1, 1,
0.3916787, 0.1483797, 2.245453, 1, 1, 1, 1, 1,
0.3939632, -0.2052114, 2.214606, 1, 1, 1, 1, 1,
0.3941615, -0.8626768, 3.015462, 1, 1, 1, 1, 1,
0.3946985, 0.4774759, 2.850577, 1, 1, 1, 1, 1,
0.4028678, 0.9252432, 0.02409656, 1, 1, 1, 1, 1,
0.4033884, 0.9330977, 0.8935009, 1, 1, 1, 1, 1,
0.4052203, -0.825768, 2.336891, 1, 1, 1, 1, 1,
0.4071932, 0.4445982, -0.9160917, 1, 1, 1, 1, 1,
0.4074355, -0.05215522, 1.050299, 0, 0, 1, 1, 1,
0.4091985, 0.3815442, 0.09557763, 1, 0, 0, 1, 1,
0.4113665, 0.2017738, 1.922868, 1, 0, 0, 1, 1,
0.4114402, 0.8027451, 0.9004439, 1, 0, 0, 1, 1,
0.4135706, -0.4330676, 2.128609, 1, 0, 0, 1, 1,
0.414336, 1.066047, 0.1684897, 1, 0, 0, 1, 1,
0.4186926, -0.3702501, 3.361403, 0, 0, 0, 1, 1,
0.4214865, -0.4831975, 4.142043, 0, 0, 0, 1, 1,
0.4223475, -0.8491102, 3.059083, 0, 0, 0, 1, 1,
0.4265775, 0.3437954, 2.054672, 0, 0, 0, 1, 1,
0.4284275, 1.091252, 1.60401, 0, 0, 0, 1, 1,
0.4313928, 1.116022, -0.1852424, 0, 0, 0, 1, 1,
0.4341019, 0.8299675, 1.384501, 0, 0, 0, 1, 1,
0.4349375, 2.556957, -1.601119, 1, 1, 1, 1, 1,
0.4353793, 1.501957, -0.491304, 1, 1, 1, 1, 1,
0.4365557, -0.2493754, 2.122982, 1, 1, 1, 1, 1,
0.4386624, 0.4804763, 1.575784, 1, 1, 1, 1, 1,
0.4412957, 0.4051831, 1.667429, 1, 1, 1, 1, 1,
0.4422558, 0.2045528, 1.736696, 1, 1, 1, 1, 1,
0.4461842, -0.7143663, 3.093004, 1, 1, 1, 1, 1,
0.4489032, 0.4312076, 1.433971, 1, 1, 1, 1, 1,
0.454323, -0.9132786, 3.482064, 1, 1, 1, 1, 1,
0.4549998, -0.8929313, 2.520119, 1, 1, 1, 1, 1,
0.458579, 2.417552, 1.969566, 1, 1, 1, 1, 1,
0.4596886, 0.1142493, 0.3761366, 1, 1, 1, 1, 1,
0.4636198, -0.7029849, 2.361851, 1, 1, 1, 1, 1,
0.4657594, -0.5109779, 0.4830135, 1, 1, 1, 1, 1,
0.467044, -0.3571878, -0.9592711, 1, 1, 1, 1, 1,
0.4690484, 0.1087936, 1.979017, 0, 0, 1, 1, 1,
0.4704823, -0.6977684, 1.80644, 1, 0, 0, 1, 1,
0.4725244, 0.7041685, 1.969687, 1, 0, 0, 1, 1,
0.4744877, -0.3058447, 1.778837, 1, 0, 0, 1, 1,
0.475115, -0.7630954, 3.251788, 1, 0, 0, 1, 1,
0.4751994, -0.08768947, 1.079021, 1, 0, 0, 1, 1,
0.4773143, -0.4688041, 3.92254, 0, 0, 0, 1, 1,
0.4785416, -0.8266404, 3.639349, 0, 0, 0, 1, 1,
0.4790139, 0.1737664, 0.07709306, 0, 0, 0, 1, 1,
0.4861266, 0.1372696, 2.613313, 0, 0, 0, 1, 1,
0.489341, 1.800959, 0.78986, 0, 0, 0, 1, 1,
0.4909541, 0.1604915, 1.479221, 0, 0, 0, 1, 1,
0.4962255, 0.4483851, 0.9800221, 0, 0, 0, 1, 1,
0.4979545, 1.11462, 1.001431, 1, 1, 1, 1, 1,
0.5035018, 1.570658, -1.067095, 1, 1, 1, 1, 1,
0.5082582, -0.7133332, 2.582422, 1, 1, 1, 1, 1,
0.5105177, 0.3285768, 2.119626, 1, 1, 1, 1, 1,
0.5124637, 0.6908683, 0.5743788, 1, 1, 1, 1, 1,
0.5142362, -0.3539994, 3.345099, 1, 1, 1, 1, 1,
0.5148011, 1.816857, 3.421434, 1, 1, 1, 1, 1,
0.5188189, -0.3203776, 0.5113186, 1, 1, 1, 1, 1,
0.5236089, 0.1799946, 2.103254, 1, 1, 1, 1, 1,
0.5264577, 0.06126411, 2.129725, 1, 1, 1, 1, 1,
0.5274897, 0.5052675, 2.72845, 1, 1, 1, 1, 1,
0.5321066, 0.2500573, 1.705588, 1, 1, 1, 1, 1,
0.5337887, 0.7500029, 0.466165, 1, 1, 1, 1, 1,
0.5356621, -0.711009, 1.364785, 1, 1, 1, 1, 1,
0.5369556, -0.1325886, 1.478524, 1, 1, 1, 1, 1,
0.540641, 1.157518, 1.163291, 0, 0, 1, 1, 1,
0.5418691, -1.509061, 0.8250702, 1, 0, 0, 1, 1,
0.5446053, -1.232322, 2.961201, 1, 0, 0, 1, 1,
0.5644181, -1.601108, 3.059214, 1, 0, 0, 1, 1,
0.5683607, -1.830717, 3.562762, 1, 0, 0, 1, 1,
0.5699703, 0.1934005, 0.7011002, 1, 0, 0, 1, 1,
0.5712128, 2.003657, 1.112586, 0, 0, 0, 1, 1,
0.5733994, 1.211211, -1.362535, 0, 0, 0, 1, 1,
0.576109, -0.09187785, 2.743058, 0, 0, 0, 1, 1,
0.5784206, -0.6545412, 1.588748, 0, 0, 0, 1, 1,
0.5786474, -0.375214, 1.01567, 0, 0, 0, 1, 1,
0.5823239, -0.8436559, 2.34997, 0, 0, 0, 1, 1,
0.58283, -0.4947574, 3.161041, 0, 0, 0, 1, 1,
0.5867345, -1.112765, 3.139757, 1, 1, 1, 1, 1,
0.5874146, -0.5307804, 4.80295, 1, 1, 1, 1, 1,
0.5903525, 0.925422, -0.576765, 1, 1, 1, 1, 1,
0.5915033, -0.1717511, 0.8149836, 1, 1, 1, 1, 1,
0.5927506, 0.4215051, 1.842685, 1, 1, 1, 1, 1,
0.5930653, -0.453329, 2.836978, 1, 1, 1, 1, 1,
0.5941023, 0.479014, 1.923752, 1, 1, 1, 1, 1,
0.597846, -0.7820352, 4.144287, 1, 1, 1, 1, 1,
0.5985014, -0.8193715, 0.4326109, 1, 1, 1, 1, 1,
0.6117254, 0.3868091, 1.819866, 1, 1, 1, 1, 1,
0.614104, 0.4774217, 0.9989306, 1, 1, 1, 1, 1,
0.6142076, 1.574311, 0.2685964, 1, 1, 1, 1, 1,
0.6164523, 1.77282, 2.776901, 1, 1, 1, 1, 1,
0.6175808, -0.7799821, 2.249083, 1, 1, 1, 1, 1,
0.6197399, 0.6881281, 0.8637566, 1, 1, 1, 1, 1,
0.6222165, -0.5122083, 1.842393, 0, 0, 1, 1, 1,
0.6270038, -1.487891, 0.7172041, 1, 0, 0, 1, 1,
0.6274287, -1.185241, 2.979384, 1, 0, 0, 1, 1,
0.6287463, 0.115882, 3.239532, 1, 0, 0, 1, 1,
0.6299663, 0.319339, 1.470658, 1, 0, 0, 1, 1,
0.633205, -0.5956509, 3.043994, 1, 0, 0, 1, 1,
0.6370243, -1.011433, -0.01078734, 0, 0, 0, 1, 1,
0.6448207, -0.6661003, 2.719762, 0, 0, 0, 1, 1,
0.6479917, -1.14983, 2.420958, 0, 0, 0, 1, 1,
0.6516843, -0.4510593, 1.012795, 0, 0, 0, 1, 1,
0.6540174, 0.2020964, 0.3488201, 0, 0, 0, 1, 1,
0.6552743, 0.5635338, 0.2981904, 0, 0, 0, 1, 1,
0.6555675, -0.04421521, 1.829774, 0, 0, 0, 1, 1,
0.6560035, 1.507485, 0.556003, 1, 1, 1, 1, 1,
0.6574395, 0.491971, -0.06382295, 1, 1, 1, 1, 1,
0.6596724, 1.002864, 1.067114, 1, 1, 1, 1, 1,
0.6610174, -0.4965505, 3.638671, 1, 1, 1, 1, 1,
0.6610393, -0.1394806, 1.331995, 1, 1, 1, 1, 1,
0.6754521, -1.26351, 3.050532, 1, 1, 1, 1, 1,
0.6807429, -1.338722, 3.652014, 1, 1, 1, 1, 1,
0.682948, 1.363715, -0.9293958, 1, 1, 1, 1, 1,
0.6848579, -1.883224, 0.8261359, 1, 1, 1, 1, 1,
0.6867087, 0.3100276, 1.626033, 1, 1, 1, 1, 1,
0.6892897, 0.2439972, 1.836349, 1, 1, 1, 1, 1,
0.6978084, 0.5626146, -0.0009751433, 1, 1, 1, 1, 1,
0.6987544, 0.8495553, -0.3626649, 1, 1, 1, 1, 1,
0.7019697, -1.468089, 3.506155, 1, 1, 1, 1, 1,
0.7027714, 0.2948119, 1.070283, 1, 1, 1, 1, 1,
0.7028777, -2.092592, 2.550711, 0, 0, 1, 1, 1,
0.7040672, 0.5511338, 2.396827, 1, 0, 0, 1, 1,
0.7153844, 0.4403619, -0.009462901, 1, 0, 0, 1, 1,
0.7164088, -0.8376839, 2.783851, 1, 0, 0, 1, 1,
0.718433, -0.5091673, 1.268394, 1, 0, 0, 1, 1,
0.7191126, 1.445342, 0.8448959, 1, 0, 0, 1, 1,
0.7211016, -0.4356118, 2.315564, 0, 0, 0, 1, 1,
0.7220488, 0.9349663, -0.3723789, 0, 0, 0, 1, 1,
0.7289513, -0.008678226, 1.046893, 0, 0, 0, 1, 1,
0.7310054, 1.888672, 0.2148401, 0, 0, 0, 1, 1,
0.7320066, -0.1314764, 2.685282, 0, 0, 0, 1, 1,
0.7326445, -2.591891, 1.891257, 0, 0, 0, 1, 1,
0.7332844, -0.3792063, 1.794752, 0, 0, 0, 1, 1,
0.7337661, 0.2139117, 1.03549, 1, 1, 1, 1, 1,
0.7344994, 0.5871585, -0.1848769, 1, 1, 1, 1, 1,
0.7383727, -0.9728101, 4.347234, 1, 1, 1, 1, 1,
0.7463662, -0.376193, 0.1715411, 1, 1, 1, 1, 1,
0.7465851, -0.191052, -0.09213063, 1, 1, 1, 1, 1,
0.7482392, 0.3298428, 0.9774626, 1, 1, 1, 1, 1,
0.7507086, 1.444197, -1.33714, 1, 1, 1, 1, 1,
0.7542136, 1.429159, 1.309271, 1, 1, 1, 1, 1,
0.7545933, 1.073181, 0.4043519, 1, 1, 1, 1, 1,
0.7576655, 0.6111001, 1.28277, 1, 1, 1, 1, 1,
0.7594132, 1.284754, -1.445575, 1, 1, 1, 1, 1,
0.7832496, -0.1930536, 2.596047, 1, 1, 1, 1, 1,
0.787998, 1.006898, 1.536053, 1, 1, 1, 1, 1,
0.7960592, -0.9679629, 1.69061, 1, 1, 1, 1, 1,
0.7961598, -0.07904487, 0.0604264, 1, 1, 1, 1, 1,
0.7987513, 0.2777009, 0.9867099, 0, 0, 1, 1, 1,
0.8074266, 0.4025538, 0.2510411, 1, 0, 0, 1, 1,
0.8129737, -0.1001274, 3.057866, 1, 0, 0, 1, 1,
0.8153589, 0.1629837, 0.1038959, 1, 0, 0, 1, 1,
0.8236064, -0.763626, 3.017569, 1, 0, 0, 1, 1,
0.8258702, 0.1046288, 2.586733, 1, 0, 0, 1, 1,
0.8264623, 0.03013572, 3.694774, 0, 0, 0, 1, 1,
0.8266454, -1.032986, 1.531188, 0, 0, 0, 1, 1,
0.8292648, -0.9477398, 3.021969, 0, 0, 0, 1, 1,
0.8337162, 2.025975, -0.0554087, 0, 0, 0, 1, 1,
0.8343382, -0.168432, 0.9033693, 0, 0, 0, 1, 1,
0.8350185, 0.2910086, 2.724851, 0, 0, 0, 1, 1,
0.8372553, 0.3918806, 0.7044523, 0, 0, 0, 1, 1,
0.8376409, 0.5579376, 3.510725, 1, 1, 1, 1, 1,
0.8392422, -0.08792775, 1.632221, 1, 1, 1, 1, 1,
0.8455287, -1.075373, 3.07506, 1, 1, 1, 1, 1,
0.8490084, -0.8950117, 2.428877, 1, 1, 1, 1, 1,
0.853973, 0.9159157, 1.248715, 1, 1, 1, 1, 1,
0.8616859, -0.7166964, 1.492069, 1, 1, 1, 1, 1,
0.8634689, 0.04407064, 1.061806, 1, 1, 1, 1, 1,
0.864702, -0.1818935, 1.980442, 1, 1, 1, 1, 1,
0.871698, 0.9524971, 0.8173253, 1, 1, 1, 1, 1,
0.875885, -0.2569861, 1.075923, 1, 1, 1, 1, 1,
0.8806695, 0.5237008, 1.978776, 1, 1, 1, 1, 1,
0.8863332, 1.130706, -1.095578, 1, 1, 1, 1, 1,
0.8939627, -0.4300013, 3.128392, 1, 1, 1, 1, 1,
0.8967528, -1.466312, 1.841762, 1, 1, 1, 1, 1,
0.9025197, 0.3115385, 1.547906, 1, 1, 1, 1, 1,
0.9026183, 1.219332, 1.171926, 0, 0, 1, 1, 1,
0.915132, 1.421495, 0.05784326, 1, 0, 0, 1, 1,
0.9186929, -0.3543223, 3.994323, 1, 0, 0, 1, 1,
0.9218729, 1.233777, 0.7513677, 1, 0, 0, 1, 1,
0.9303185, 0.3399855, -0.5814994, 1, 0, 0, 1, 1,
0.9410736, 0.7322285, 2.138424, 1, 0, 0, 1, 1,
0.9413249, 0.3890172, 1.396527, 0, 0, 0, 1, 1,
0.9431835, -1.510679, 3.243343, 0, 0, 0, 1, 1,
0.9492771, -0.8847883, 2.587354, 0, 0, 0, 1, 1,
0.9652925, 1.058714, 0.7412028, 0, 0, 0, 1, 1,
0.9661484, -0.493028, 3.545127, 0, 0, 0, 1, 1,
0.9725612, 0.4071429, 0.847716, 0, 0, 0, 1, 1,
0.9735553, -1.169832, 2.695306, 0, 0, 0, 1, 1,
0.9762548, 1.021617, 0.7366728, 1, 1, 1, 1, 1,
0.9765272, 0.9455026, 1.931598, 1, 1, 1, 1, 1,
0.9781746, 0.6899453, 0.1773627, 1, 1, 1, 1, 1,
0.9803522, -0.9526647, 3.25842, 1, 1, 1, 1, 1,
0.9827963, -0.09394072, 1.068764, 1, 1, 1, 1, 1,
0.9953979, 0.6091712, 1.957925, 1, 1, 1, 1, 1,
0.9975073, 0.256914, 1.729627, 1, 1, 1, 1, 1,
1.015619, -0.2743766, 0.4666825, 1, 1, 1, 1, 1,
1.023322, 0.1598075, -0.1799316, 1, 1, 1, 1, 1,
1.024508, 0.1058914, 2.548989, 1, 1, 1, 1, 1,
1.027839, 0.6453139, 0.9360511, 1, 1, 1, 1, 1,
1.049371, 1.969974, 0.6083575, 1, 1, 1, 1, 1,
1.054425, -0.355142, 2.703225, 1, 1, 1, 1, 1,
1.055779, 0.839234, 1.601371, 1, 1, 1, 1, 1,
1.059657, 0.9885049, -0.04913081, 1, 1, 1, 1, 1,
1.059676, -0.9945641, 2.354079, 0, 0, 1, 1, 1,
1.062406, -1.032393, 2.880802, 1, 0, 0, 1, 1,
1.062839, -1.496785, 2.381961, 1, 0, 0, 1, 1,
1.070206, -0.4154484, 1.764707, 1, 0, 0, 1, 1,
1.081633, -0.6224414, 0.6141636, 1, 0, 0, 1, 1,
1.089702, -0.3115737, 2.030661, 1, 0, 0, 1, 1,
1.103701, 1.372075, -0.08682349, 0, 0, 0, 1, 1,
1.110748, -0.1232447, 0.7544985, 0, 0, 0, 1, 1,
1.125542, -0.374487, 2.568547, 0, 0, 0, 1, 1,
1.130742, -0.7293798, 1.994155, 0, 0, 0, 1, 1,
1.130812, -0.3952739, 1.191357, 0, 0, 0, 1, 1,
1.140776, 1.346781, -2.024786, 0, 0, 0, 1, 1,
1.146408, 0.6241233, 1.464731, 0, 0, 0, 1, 1,
1.147543, 0.2294561, -0.6045656, 1, 1, 1, 1, 1,
1.147553, -0.9913128, 1.209594, 1, 1, 1, 1, 1,
1.149811, -0.8387256, 3.254578, 1, 1, 1, 1, 1,
1.151049, 0.255802, 2.511776, 1, 1, 1, 1, 1,
1.153785, 1.343418, -0.4248228, 1, 1, 1, 1, 1,
1.166207, 2.309778, -0.08457579, 1, 1, 1, 1, 1,
1.173375, -1.560262, 2.626464, 1, 1, 1, 1, 1,
1.177146, -1.671964, 3.66877, 1, 1, 1, 1, 1,
1.177811, -0.2552403, 1.316452, 1, 1, 1, 1, 1,
1.17865, 0.2810128, -0.5720564, 1, 1, 1, 1, 1,
1.200765, -0.3891434, 3.186542, 1, 1, 1, 1, 1,
1.206366, -0.0197369, 3.298192, 1, 1, 1, 1, 1,
1.211914, 0.9900807, 1.651148, 1, 1, 1, 1, 1,
1.214202, 0.147371, 1.931611, 1, 1, 1, 1, 1,
1.225296, -0.4935867, 2.495871, 1, 1, 1, 1, 1,
1.233726, -0.01874395, 0.7028931, 0, 0, 1, 1, 1,
1.237908, -0.8964271, 1.087502, 1, 0, 0, 1, 1,
1.238814, -0.4127068, 4.112604, 1, 0, 0, 1, 1,
1.241447, -1.052234, 2.267546, 1, 0, 0, 1, 1,
1.242472, -1.317897, 2.008499, 1, 0, 0, 1, 1,
1.250072, 0.4098624, 0.8945952, 1, 0, 0, 1, 1,
1.256049, -0.6988558, 2.398767, 0, 0, 0, 1, 1,
1.270579, -0.6303141, 3.165868, 0, 0, 0, 1, 1,
1.279629, -0.8724709, 2.130074, 0, 0, 0, 1, 1,
1.295306, -0.09612111, 2.163955, 0, 0, 0, 1, 1,
1.297615, 0.4568986, 1.471082, 0, 0, 0, 1, 1,
1.298966, -2.481925, 2.246281, 0, 0, 0, 1, 1,
1.302093, -0.3320612, 1.563113, 0, 0, 0, 1, 1,
1.328736, -0.1915042, 1.468613, 1, 1, 1, 1, 1,
1.334183, 0.5755106, 2.233423, 1, 1, 1, 1, 1,
1.345524, 0.7018253, 1.437437, 1, 1, 1, 1, 1,
1.350324, 1.873675, 1.560866, 1, 1, 1, 1, 1,
1.358258, -0.1440905, 3.012331, 1, 1, 1, 1, 1,
1.367354, -0.1626211, 2.198522, 1, 1, 1, 1, 1,
1.370734, -1.59848, 2.801406, 1, 1, 1, 1, 1,
1.375356, -0.4531989, 1.903583, 1, 1, 1, 1, 1,
1.376776, 0.2241408, 0.5192809, 1, 1, 1, 1, 1,
1.380718, 1.07434, 0.5703429, 1, 1, 1, 1, 1,
1.396391, 0.3051412, -0.6683078, 1, 1, 1, 1, 1,
1.397001, 0.3629788, 2.989023, 1, 1, 1, 1, 1,
1.398752, -0.3509263, 1.517005, 1, 1, 1, 1, 1,
1.400464, 0.3722019, 2.057472, 1, 1, 1, 1, 1,
1.403755, -0.3676169, 1.918128, 1, 1, 1, 1, 1,
1.414167, 0.1918874, 0.5781932, 0, 0, 1, 1, 1,
1.443314, 0.8332769, 1.060831, 1, 0, 0, 1, 1,
1.44709, 0.1516843, 1.52573, 1, 0, 0, 1, 1,
1.450993, 0.887171, 0.4535382, 1, 0, 0, 1, 1,
1.471722, 0.4563243, 1.174744, 1, 0, 0, 1, 1,
1.475447, -0.6641409, 1.6325, 1, 0, 0, 1, 1,
1.493806, 1.169816, -0.7038735, 0, 0, 0, 1, 1,
1.505315, -1.254281, 1.189455, 0, 0, 0, 1, 1,
1.507198, 0.2709019, 1.248436, 0, 0, 0, 1, 1,
1.515232, 1.033382, 2.358223, 0, 0, 0, 1, 1,
1.515321, -1.587693, 0.974982, 0, 0, 0, 1, 1,
1.515872, 0.4894543, 2.014187, 0, 0, 0, 1, 1,
1.52417, -0.2337614, 1.308778, 0, 0, 0, 1, 1,
1.525787, -0.5927594, 2.946281, 1, 1, 1, 1, 1,
1.527128, 0.101905, 1.397015, 1, 1, 1, 1, 1,
1.53834, 0.2838652, 3.467136, 1, 1, 1, 1, 1,
1.549049, 2.484799, 1.684065, 1, 1, 1, 1, 1,
1.550089, -0.07457333, 0.7780096, 1, 1, 1, 1, 1,
1.56723, 0.6011678, 1.562445, 1, 1, 1, 1, 1,
1.571642, -0.7979504, 2.628001, 1, 1, 1, 1, 1,
1.581232, 1.263937, -0.1188224, 1, 1, 1, 1, 1,
1.589195, -0.737708, 1.714503, 1, 1, 1, 1, 1,
1.598385, -0.237278, 3.680365, 1, 1, 1, 1, 1,
1.602798, -0.5046437, 1.474473, 1, 1, 1, 1, 1,
1.620111, -0.4377353, 3.269921, 1, 1, 1, 1, 1,
1.633205, 0.6242174, 0.08683372, 1, 1, 1, 1, 1,
1.633601, -0.2904535, 1.94855, 1, 1, 1, 1, 1,
1.636895, -0.9956787, 3.119085, 1, 1, 1, 1, 1,
1.669259, -0.5752433, 2.326995, 0, 0, 1, 1, 1,
1.674627, -0.7265504, 2.22815, 1, 0, 0, 1, 1,
1.676739, -1.103507, 2.198814, 1, 0, 0, 1, 1,
1.679576, -0.5385157, 3.812943, 1, 0, 0, 1, 1,
1.682363, 0.347301, 1.233245, 1, 0, 0, 1, 1,
1.700355, -0.9296561, 2.623679, 1, 0, 0, 1, 1,
1.710794, -1.139051, 2.26637, 0, 0, 0, 1, 1,
1.750038, -0.9853752, 2.99752, 0, 0, 0, 1, 1,
1.752498, 1.365613, 1.34806, 0, 0, 0, 1, 1,
1.776575, -1.077105, 1.368222, 0, 0, 0, 1, 1,
1.777854, 1.104862, 0.8347368, 0, 0, 0, 1, 1,
1.782084, 0.647778, 0.2333006, 0, 0, 0, 1, 1,
1.788745, 0.8611127, 2.133396, 0, 0, 0, 1, 1,
1.803015, 1.558976, 2.429729, 1, 1, 1, 1, 1,
1.817208, 0.1328719, 2.71628, 1, 1, 1, 1, 1,
1.822208, -0.8472217, 3.526307, 1, 1, 1, 1, 1,
1.838224, -0.06138666, 1.821739, 1, 1, 1, 1, 1,
1.861419, -0.04420066, 0.9090488, 1, 1, 1, 1, 1,
1.86246, -1.154836, 2.98885, 1, 1, 1, 1, 1,
1.866783, 0.3341748, 2.778669, 1, 1, 1, 1, 1,
1.871036, 1.470997, 1.831012, 1, 1, 1, 1, 1,
1.877289, 0.2773674, 2.088017, 1, 1, 1, 1, 1,
1.887862, 1.294063, 0.06919406, 1, 1, 1, 1, 1,
1.916575, -0.1527666, 1.931113, 1, 1, 1, 1, 1,
1.924157, -2.128067, 2.170423, 1, 1, 1, 1, 1,
1.929553, 0.2843927, 0.9000559, 1, 1, 1, 1, 1,
1.969497, 0.3490791, 0.5497808, 1, 1, 1, 1, 1,
1.992075, -0.9094262, 0.8622211, 1, 1, 1, 1, 1,
2.000992, -0.8279167, 2.255152, 0, 0, 1, 1, 1,
2.007127, -1.052929, 2.868183, 1, 0, 0, 1, 1,
2.118783, -1.732494, 3.454941, 1, 0, 0, 1, 1,
2.157361, -0.3308239, 0.5264371, 1, 0, 0, 1, 1,
2.190783, -1.330831, 0.8957191, 1, 0, 0, 1, 1,
2.212982, 0.2990442, 0.9791613, 1, 0, 0, 1, 1,
2.221148, 0.1912469, 1.944321, 0, 0, 0, 1, 1,
2.264601, 0.4949414, 1.194535, 0, 0, 0, 1, 1,
2.299701, -0.6348414, 1.968384, 0, 0, 0, 1, 1,
2.421453, -0.5077757, 3.165478, 0, 0, 0, 1, 1,
2.428674, 0.1899989, 2.879181, 0, 0, 0, 1, 1,
2.43304, 1.991598, 0.7809905, 0, 0, 0, 1, 1,
2.508242, 0.26823, 0.1282699, 0, 0, 0, 1, 1,
2.531934, 0.1281376, -0.1177696, 1, 1, 1, 1, 1,
2.587203, -1.139101, 2.659118, 1, 1, 1, 1, 1,
2.621897, 0.1885457, 1.018335, 1, 1, 1, 1, 1,
2.973738, 0.2527603, 0.5492582, 1, 1, 1, 1, 1,
3.333918, 0.70652, 1.027657, 1, 1, 1, 1, 1,
3.420733, -0.9461387, 1.160956, 1, 1, 1, 1, 1,
3.705142, 0.6650195, 0.8745962, 1, 1, 1, 1, 1
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
var radius = 9.400349;
var distance = 33.01833;
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
mvMatrix.translate( -0.5535764, 0.0968641, -0.2011673 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.01833);
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
