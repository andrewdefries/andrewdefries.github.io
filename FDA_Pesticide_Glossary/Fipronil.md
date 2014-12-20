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
-2.640074, -1.867581, -3.502133, 1, 0, 0, 1,
-2.596199, -1.424984, -1.624477, 1, 0.007843138, 0, 1,
-2.585573, 0.4914254, -3.935162, 1, 0.01176471, 0, 1,
-2.492645, 0.7894422, 0.4955122, 1, 0.01960784, 0, 1,
-2.47726, -1.092328, -2.007263, 1, 0.02352941, 0, 1,
-2.397708, 0.04796863, -0.7299751, 1, 0.03137255, 0, 1,
-2.286949, 0.6414216, 0.2873927, 1, 0.03529412, 0, 1,
-2.281746, 0.2855141, -1.178573, 1, 0.04313726, 0, 1,
-2.272876, -1.097489, -2.153063, 1, 0.04705882, 0, 1,
-2.243709, -0.3033227, -0.3233767, 1, 0.05490196, 0, 1,
-2.231547, 2.747613, -0.02233075, 1, 0.05882353, 0, 1,
-2.219903, 0.3525151, -1.551747, 1, 0.06666667, 0, 1,
-2.213416, 2.01655, -1.134685, 1, 0.07058824, 0, 1,
-2.200354, 0.206536, -2.804377, 1, 0.07843138, 0, 1,
-2.171323, -0.5951321, -3.526358, 1, 0.08235294, 0, 1,
-2.166938, 0.6165401, -1.924878, 1, 0.09019608, 0, 1,
-2.146593, -0.5453713, 0.002172933, 1, 0.09411765, 0, 1,
-2.13949, 0.7771925, -2.073785, 1, 0.1019608, 0, 1,
-2.089206, -0.8420005, -2.231836, 1, 0.1098039, 0, 1,
-2.084001, 1.524157, 0.09790686, 1, 0.1137255, 0, 1,
-2.041973, 0.568251, -1.335529, 1, 0.1215686, 0, 1,
-2.01878, -1.130996, -2.545035, 1, 0.1254902, 0, 1,
-1.983924, -1.366958, -2.036747, 1, 0.1333333, 0, 1,
-1.98308, -0.3288018, -2.286083, 1, 0.1372549, 0, 1,
-1.907262, -0.4331035, -2.36201, 1, 0.145098, 0, 1,
-1.891298, 0.8338978, 0.8731169, 1, 0.1490196, 0, 1,
-1.890138, 1.844441, 0.7064521, 1, 0.1568628, 0, 1,
-1.882154, 0.2463054, -1.385417, 1, 0.1607843, 0, 1,
-1.880801, 0.3706356, -2.637495, 1, 0.1686275, 0, 1,
-1.87524, 0.540208, -1.17081, 1, 0.172549, 0, 1,
-1.865157, -0.2864428, -1.879136, 1, 0.1803922, 0, 1,
-1.851549, 0.02514407, -2.261866, 1, 0.1843137, 0, 1,
-1.838815, 0.8582456, -1.56905, 1, 0.1921569, 0, 1,
-1.812979, -1.760793, -1.423627, 1, 0.1960784, 0, 1,
-1.805549, 0.2256702, -0.8831097, 1, 0.2039216, 0, 1,
-1.793681, 0.8462353, -1.353045, 1, 0.2117647, 0, 1,
-1.786473, -0.4453752, -1.797254, 1, 0.2156863, 0, 1,
-1.784432, 0.8858941, -1.246343, 1, 0.2235294, 0, 1,
-1.747416, -1.332412, -1.564851, 1, 0.227451, 0, 1,
-1.745688, 0.7764286, -1.305449, 1, 0.2352941, 0, 1,
-1.741284, 0.6436818, 0.6205429, 1, 0.2392157, 0, 1,
-1.71559, 1.796407, 0.7114303, 1, 0.2470588, 0, 1,
-1.708647, -0.5498415, -0.06515345, 1, 0.2509804, 0, 1,
-1.695356, -1.213075, -1.545255, 1, 0.2588235, 0, 1,
-1.657483, 0.6171283, 1.409973, 1, 0.2627451, 0, 1,
-1.65546, -1.130067, -1.766472, 1, 0.2705882, 0, 1,
-1.645659, -0.3685367, -2.174032, 1, 0.2745098, 0, 1,
-1.642892, 0.3497606, 0.2461749, 1, 0.282353, 0, 1,
-1.63598, 0.4853076, -1.573588, 1, 0.2862745, 0, 1,
-1.635519, -1.582808, -3.249447, 1, 0.2941177, 0, 1,
-1.617931, 0.6621031, -1.462246, 1, 0.3019608, 0, 1,
-1.611534, -0.7428199, -2.584983, 1, 0.3058824, 0, 1,
-1.60494, -0.01828299, 0.0695426, 1, 0.3137255, 0, 1,
-1.588112, 0.11662, -0.885093, 1, 0.3176471, 0, 1,
-1.587809, -0.4359201, -2.372984, 1, 0.3254902, 0, 1,
-1.586473, -0.2195154, -1.366486, 1, 0.3294118, 0, 1,
-1.559302, -0.2944464, -1.656554, 1, 0.3372549, 0, 1,
-1.545022, -1.582359, -2.285611, 1, 0.3411765, 0, 1,
-1.542888, -1.021436, -0.7478001, 1, 0.3490196, 0, 1,
-1.529729, -1.01512, -2.749488, 1, 0.3529412, 0, 1,
-1.523722, 0.3839331, -1.247313, 1, 0.3607843, 0, 1,
-1.517402, 0.5596234, -1.768606, 1, 0.3647059, 0, 1,
-1.509751, -1.868603, -2.801559, 1, 0.372549, 0, 1,
-1.505636, -0.2457974, -0.9305044, 1, 0.3764706, 0, 1,
-1.50467, 1.498956, -1.219584, 1, 0.3843137, 0, 1,
-1.500136, -0.5546024, -0.8275535, 1, 0.3882353, 0, 1,
-1.498256, 0.5509762, -1.629022, 1, 0.3960784, 0, 1,
-1.463877, -0.8187506, -1.762416, 1, 0.4039216, 0, 1,
-1.46341, -0.6617953, -0.9859468, 1, 0.4078431, 0, 1,
-1.460066, 0.04608144, -0.7013521, 1, 0.4156863, 0, 1,
-1.453753, 1.126027, -2.36677, 1, 0.4196078, 0, 1,
-1.444999, 0.8032386, -1.658037, 1, 0.427451, 0, 1,
-1.444452, -0.2214425, -1.326344, 1, 0.4313726, 0, 1,
-1.433421, -0.2683864, -2.051882, 1, 0.4392157, 0, 1,
-1.431868, -0.3928193, -0.3141821, 1, 0.4431373, 0, 1,
-1.424677, -0.6120632, 0.1048952, 1, 0.4509804, 0, 1,
-1.4234, -0.5845059, -0.6629906, 1, 0.454902, 0, 1,
-1.419846, -0.0943358, -2.897753, 1, 0.4627451, 0, 1,
-1.403019, 1.79795, 0.4321481, 1, 0.4666667, 0, 1,
-1.392819, -2.071121, -1.568939, 1, 0.4745098, 0, 1,
-1.372574, -1.832563, -1.9703, 1, 0.4784314, 0, 1,
-1.369151, 0.8263794, -2.835396, 1, 0.4862745, 0, 1,
-1.364576, 0.6129286, -1.167132, 1, 0.4901961, 0, 1,
-1.351711, -0.306192, -2.787631, 1, 0.4980392, 0, 1,
-1.346993, -0.7508082, -2.498847, 1, 0.5058824, 0, 1,
-1.339409, 2.078141, -1.458608, 1, 0.509804, 0, 1,
-1.328396, 0.04289823, 0.8358715, 1, 0.5176471, 0, 1,
-1.323337, 0.7204453, 0.4123543, 1, 0.5215687, 0, 1,
-1.321424, 2.090599, -0.4484815, 1, 0.5294118, 0, 1,
-1.317775, 1.244369, -1.448829, 1, 0.5333334, 0, 1,
-1.311143, 1.05482, -1.404649, 1, 0.5411765, 0, 1,
-1.301613, -1.090309, -2.245119, 1, 0.5450981, 0, 1,
-1.301194, -0.2703761, 0.4457254, 1, 0.5529412, 0, 1,
-1.297601, 0.08113344, -0.04299714, 1, 0.5568628, 0, 1,
-1.297381, 0.6119235, -2.898891, 1, 0.5647059, 0, 1,
-1.296689, -0.2200812, 0.07609995, 1, 0.5686275, 0, 1,
-1.28916, -0.9641481, -3.165185, 1, 0.5764706, 0, 1,
-1.278421, -1.508482, -4.405559, 1, 0.5803922, 0, 1,
-1.273759, -1.065501, -3.507385, 1, 0.5882353, 0, 1,
-1.272904, 0.4926357, -2.211697, 1, 0.5921569, 0, 1,
-1.272455, 2.547331, 0.6206151, 1, 0.6, 0, 1,
-1.263519, 0.770714, 2.00649, 1, 0.6078432, 0, 1,
-1.255136, -0.1236273, -1.845499, 1, 0.6117647, 0, 1,
-1.254288, -0.2189676, -1.442449, 1, 0.6196079, 0, 1,
-1.243683, -0.05867852, -1.369195, 1, 0.6235294, 0, 1,
-1.228978, 1.092895, -0.2685215, 1, 0.6313726, 0, 1,
-1.224516, -0.7845989, -2.374837, 1, 0.6352941, 0, 1,
-1.213426, 0.02163883, -0.8240561, 1, 0.6431373, 0, 1,
-1.211019, 0.07209242, -2.382549, 1, 0.6470588, 0, 1,
-1.192032, 1.184684, -1.041764, 1, 0.654902, 0, 1,
-1.191624, 0.8909657, -0.7651762, 1, 0.6588235, 0, 1,
-1.185081, 0.4544601, -1.532566, 1, 0.6666667, 0, 1,
-1.180529, -0.2642922, -2.374708, 1, 0.6705883, 0, 1,
-1.166313, -2.485414, -3.779485, 1, 0.6784314, 0, 1,
-1.16427, -0.101821, -0.3970989, 1, 0.682353, 0, 1,
-1.163869, -1.825218, -3.503516, 1, 0.6901961, 0, 1,
-1.156285, 0.3646921, 0.09929474, 1, 0.6941177, 0, 1,
-1.150261, -0.9981692, -2.583704, 1, 0.7019608, 0, 1,
-1.148473, -1.411872, -2.19451, 1, 0.7098039, 0, 1,
-1.145847, 2.363669, 0.2109175, 1, 0.7137255, 0, 1,
-1.14226, -0.8516453, -2.124077, 1, 0.7215686, 0, 1,
-1.139657, 2.129782, -1.440302, 1, 0.7254902, 0, 1,
-1.138622, 2.74922, 1.496497, 1, 0.7333333, 0, 1,
-1.136623, -0.04947118, -0.8646336, 1, 0.7372549, 0, 1,
-1.128859, 0.189273, -1.626956, 1, 0.7450981, 0, 1,
-1.123247, 0.7731881, -0.01783037, 1, 0.7490196, 0, 1,
-1.121829, -0.7487134, -2.213816, 1, 0.7568628, 0, 1,
-1.121256, -0.2767634, -0.3031954, 1, 0.7607843, 0, 1,
-1.120663, -0.5956737, -1.422199, 1, 0.7686275, 0, 1,
-1.117488, 0.1268321, -2.75831, 1, 0.772549, 0, 1,
-1.113303, 0.3284941, -0.451766, 1, 0.7803922, 0, 1,
-1.112406, 0.1563496, -1.493482, 1, 0.7843137, 0, 1,
-1.110599, -0.003194761, -2.213735, 1, 0.7921569, 0, 1,
-1.108283, 0.4151411, -0.3685319, 1, 0.7960784, 0, 1,
-1.106242, -1.138662, -2.998944, 1, 0.8039216, 0, 1,
-1.103862, 0.4234016, -1.793445, 1, 0.8117647, 0, 1,
-1.103141, 0.357752, 0.4901447, 1, 0.8156863, 0, 1,
-1.097162, -0.3536506, -1.035504, 1, 0.8235294, 0, 1,
-1.09642, -0.6640086, -3.014348, 1, 0.827451, 0, 1,
-1.092602, 0.01061112, -0.6187561, 1, 0.8352941, 0, 1,
-1.087058, 0.2968453, -0.3859237, 1, 0.8392157, 0, 1,
-1.084204, 1.490126, -2.820214, 1, 0.8470588, 0, 1,
-1.083839, 0.9848839, -1.180136, 1, 0.8509804, 0, 1,
-1.073926, -0.1051311, 0.6925421, 1, 0.8588235, 0, 1,
-1.056885, -0.7720506, -0.9608396, 1, 0.8627451, 0, 1,
-1.055907, -0.7278792, -1.163651, 1, 0.8705882, 0, 1,
-1.05118, 1.054269, -1.169198, 1, 0.8745098, 0, 1,
-1.048002, -0.2792876, -2.91941, 1, 0.8823529, 0, 1,
-1.045543, 0.2787378, -2.41728, 1, 0.8862745, 0, 1,
-1.042809, -1.128411, -1.404618, 1, 0.8941177, 0, 1,
-1.041811, 1.243519, -1.429091, 1, 0.8980392, 0, 1,
-1.035787, -1.087809, -2.781973, 1, 0.9058824, 0, 1,
-1.032436, -1.80038, -1.715265, 1, 0.9137255, 0, 1,
-1.020776, -0.2628734, -0.3245841, 1, 0.9176471, 0, 1,
-1.000883, 1.444808, -0.1976224, 1, 0.9254902, 0, 1,
-1.000783, -0.6495814, -2.079386, 1, 0.9294118, 0, 1,
-0.9960813, 2.012558, -1.08804, 1, 0.9372549, 0, 1,
-0.995956, -2.007306, -1.833243, 1, 0.9411765, 0, 1,
-0.9902642, -0.3940221, -1.300406, 1, 0.9490196, 0, 1,
-0.989989, 0.7497171, 1.182264, 1, 0.9529412, 0, 1,
-0.9897401, 0.6463142, -0.2577549, 1, 0.9607843, 0, 1,
-0.9881935, 0.4422639, -3.010719, 1, 0.9647059, 0, 1,
-0.9861059, 0.5679522, -0.3103189, 1, 0.972549, 0, 1,
-0.9840073, 2.61115, -0.7184461, 1, 0.9764706, 0, 1,
-0.9835268, 0.7973007, -0.5734155, 1, 0.9843137, 0, 1,
-0.9810434, -0.7932919, -1.15163, 1, 0.9882353, 0, 1,
-0.9806418, -2.752865, -3.565109, 1, 0.9960784, 0, 1,
-0.9779258, 0.8389783, -1.328762, 0.9960784, 1, 0, 1,
-0.9742699, 0.8158566, -1.329211, 0.9921569, 1, 0, 1,
-0.9735394, -0.9489233, -0.8126603, 0.9843137, 1, 0, 1,
-0.9698116, -0.7138218, -3.193951, 0.9803922, 1, 0, 1,
-0.9681029, 0.956005, -1.119105, 0.972549, 1, 0, 1,
-0.9637039, 1.667926, -0.1743568, 0.9686275, 1, 0, 1,
-0.9636357, -0.6012306, -3.035194, 0.9607843, 1, 0, 1,
-0.9620164, -0.2759728, -2.623752, 0.9568627, 1, 0, 1,
-0.9611536, 1.65993, -1.218718, 0.9490196, 1, 0, 1,
-0.9601313, 0.006160872, -2.602524, 0.945098, 1, 0, 1,
-0.9535642, 1.023672, -1.024628, 0.9372549, 1, 0, 1,
-0.9524098, -0.5711774, -2.332072, 0.9333333, 1, 0, 1,
-0.9508514, -0.7880648, -2.3244, 0.9254902, 1, 0, 1,
-0.9505468, 0.5940151, -1.459645, 0.9215686, 1, 0, 1,
-0.9481368, -1.355684, -2.823505, 0.9137255, 1, 0, 1,
-0.93949, 0.7897534, -0.8586759, 0.9098039, 1, 0, 1,
-0.9317984, -1.320839, -1.53139, 0.9019608, 1, 0, 1,
-0.9270782, -1.630452, -1.650078, 0.8941177, 1, 0, 1,
-0.9264401, 0.8975786, 0.04966511, 0.8901961, 1, 0, 1,
-0.9253902, 1.185147, -1.889473, 0.8823529, 1, 0, 1,
-0.9232807, -0.518448, -1.050497, 0.8784314, 1, 0, 1,
-0.9196639, -0.2738753, -0.1777336, 0.8705882, 1, 0, 1,
-0.9075903, -1.590415, -3.350893, 0.8666667, 1, 0, 1,
-0.9034277, -1.725936, -4.047822, 0.8588235, 1, 0, 1,
-0.9020172, 0.8683963, 1.19194, 0.854902, 1, 0, 1,
-0.9004109, -0.7597868, -3.19615, 0.8470588, 1, 0, 1,
-0.8967904, 1.481293, -2.147432, 0.8431373, 1, 0, 1,
-0.8914301, -2.221596, -0.8929226, 0.8352941, 1, 0, 1,
-0.8913133, -0.209516, -2.110846, 0.8313726, 1, 0, 1,
-0.8894712, -0.4658676, -4.17066, 0.8235294, 1, 0, 1,
-0.8888899, -1.34332, -4.620553, 0.8196079, 1, 0, 1,
-0.8877547, -0.7730847, -1.156636, 0.8117647, 1, 0, 1,
-0.8855355, -0.877818, -2.679871, 0.8078431, 1, 0, 1,
-0.8817445, -1.25562, -3.348089, 0.8, 1, 0, 1,
-0.8750959, -0.1803674, -1.281362, 0.7921569, 1, 0, 1,
-0.8731211, 0.03304268, -1.730904, 0.7882353, 1, 0, 1,
-0.8722071, 0.329265, -0.4767123, 0.7803922, 1, 0, 1,
-0.8678187, -0.7515537, -3.273357, 0.7764706, 1, 0, 1,
-0.8628047, -1.282318, -1.627295, 0.7686275, 1, 0, 1,
-0.8583436, 1.889617, -1.656355, 0.7647059, 1, 0, 1,
-0.8566729, -0.4320847, -1.779033, 0.7568628, 1, 0, 1,
-0.8508965, 0.1208388, -1.069201, 0.7529412, 1, 0, 1,
-0.850858, -1.50002, -2.731828, 0.7450981, 1, 0, 1,
-0.8462431, -0.6907782, -2.641279, 0.7411765, 1, 0, 1,
-0.8449115, 0.04530859, -1.534123, 0.7333333, 1, 0, 1,
-0.8432344, -0.2013366, -2.19295, 0.7294118, 1, 0, 1,
-0.8426524, -0.7356758, -2.258867, 0.7215686, 1, 0, 1,
-0.8418122, 0.2398399, -1.089902, 0.7176471, 1, 0, 1,
-0.8409703, 1.697472, 0.2299779, 0.7098039, 1, 0, 1,
-0.8368886, 0.4693871, -0.769958, 0.7058824, 1, 0, 1,
-0.8356234, 0.3437675, -1.674713, 0.6980392, 1, 0, 1,
-0.8351001, 0.771644, -1.518799, 0.6901961, 1, 0, 1,
-0.8307306, 0.0876128, -1.48029, 0.6862745, 1, 0, 1,
-0.8305519, 0.06662014, -2.135681, 0.6784314, 1, 0, 1,
-0.8300747, 0.06219994, -2.670266, 0.6745098, 1, 0, 1,
-0.8266372, 1.131171, -0.8201569, 0.6666667, 1, 0, 1,
-0.824944, -0.3907032, -1.419977, 0.6627451, 1, 0, 1,
-0.8244127, 1.156538, -1.194447, 0.654902, 1, 0, 1,
-0.8235779, -0.7617456, -3.200599, 0.6509804, 1, 0, 1,
-0.8226373, 1.968882, -1.630868, 0.6431373, 1, 0, 1,
-0.8223175, 0.8014207, -1.209498, 0.6392157, 1, 0, 1,
-0.8206885, 0.9951338, -1.294242, 0.6313726, 1, 0, 1,
-0.818737, -0.7741324, -1.376318, 0.627451, 1, 0, 1,
-0.8172239, -1.988788, -3.31352, 0.6196079, 1, 0, 1,
-0.8152382, -2.036564, -2.983265, 0.6156863, 1, 0, 1,
-0.8144039, 0.9641796, -0.7248827, 0.6078432, 1, 0, 1,
-0.8056806, -1.650663, -3.250835, 0.6039216, 1, 0, 1,
-0.8022704, 0.862669, -0.2666354, 0.5960785, 1, 0, 1,
-0.8003201, -0.3435398, -1.155283, 0.5882353, 1, 0, 1,
-0.7965798, 0.09877332, -1.418763, 0.5843138, 1, 0, 1,
-0.794898, 0.9067862, -1.625087, 0.5764706, 1, 0, 1,
-0.7929512, -1.313077, -4.723372, 0.572549, 1, 0, 1,
-0.790921, -0.3951417, -3.524595, 0.5647059, 1, 0, 1,
-0.7748557, 1.064756, -1.10982, 0.5607843, 1, 0, 1,
-0.7742023, 1.112069, 0.6266662, 0.5529412, 1, 0, 1,
-0.7726263, 1.287523, -0.7958955, 0.5490196, 1, 0, 1,
-0.7700309, 1.110405, -0.3711567, 0.5411765, 1, 0, 1,
-0.7689845, -1.028463, -1.996693, 0.5372549, 1, 0, 1,
-0.7579741, 0.9923281, 0.1045624, 0.5294118, 1, 0, 1,
-0.7576922, 2.128082, -0.7712469, 0.5254902, 1, 0, 1,
-0.7553914, 0.606708, -1.429602, 0.5176471, 1, 0, 1,
-0.751558, 1.02712, -0.4464105, 0.5137255, 1, 0, 1,
-0.7500262, -1.383772, -1.535576, 0.5058824, 1, 0, 1,
-0.7463163, 1.619364, 0.6117671, 0.5019608, 1, 0, 1,
-0.745975, 0.04076722, -0.7706482, 0.4941176, 1, 0, 1,
-0.7444256, 0.9506067, 0.1940924, 0.4862745, 1, 0, 1,
-0.7434135, -0.790152, -3.563518, 0.4823529, 1, 0, 1,
-0.7387562, -0.3542489, -2.114147, 0.4745098, 1, 0, 1,
-0.7334676, -0.07742716, -1.232058, 0.4705882, 1, 0, 1,
-0.7290371, -1.346128, -2.072088, 0.4627451, 1, 0, 1,
-0.7273254, -0.4809457, -1.484906, 0.4588235, 1, 0, 1,
-0.7229702, 0.02212626, -0.08076881, 0.4509804, 1, 0, 1,
-0.7217956, -0.7823116, -1.752457, 0.4470588, 1, 0, 1,
-0.7213375, 2.346023, 0.262539, 0.4392157, 1, 0, 1,
-0.7179245, -0.8894442, -1.708646, 0.4352941, 1, 0, 1,
-0.7133528, -0.7621453, -1.429371, 0.427451, 1, 0, 1,
-0.7064666, -0.7320536, -2.205265, 0.4235294, 1, 0, 1,
-0.7046881, 0.7382253, 0.8103, 0.4156863, 1, 0, 1,
-0.7001652, -0.3011889, -4.051202, 0.4117647, 1, 0, 1,
-0.6962568, -0.4823641, -3.158169, 0.4039216, 1, 0, 1,
-0.6933297, -0.2076852, -2.475747, 0.3960784, 1, 0, 1,
-0.6933107, -1.434416, -2.617112, 0.3921569, 1, 0, 1,
-0.6807206, -1.025569, -2.288492, 0.3843137, 1, 0, 1,
-0.6801431, -0.7197697, -3.166609, 0.3803922, 1, 0, 1,
-0.673889, 0.9212494, -1.080381, 0.372549, 1, 0, 1,
-0.6646581, 1.118631, -1.624634, 0.3686275, 1, 0, 1,
-0.6638389, 0.08761682, -3.442176, 0.3607843, 1, 0, 1,
-0.662329, -0.1081486, -2.573233, 0.3568628, 1, 0, 1,
-0.65133, -0.01586142, -1.564385, 0.3490196, 1, 0, 1,
-0.6492664, -0.6709482, -2.245659, 0.345098, 1, 0, 1,
-0.6485859, -1.359319, -2.248459, 0.3372549, 1, 0, 1,
-0.6467537, 0.4823355, -1.242523, 0.3333333, 1, 0, 1,
-0.6452804, -2.116414, -2.444532, 0.3254902, 1, 0, 1,
-0.6425126, 0.1797208, -3.097155, 0.3215686, 1, 0, 1,
-0.6420746, -2.24208, -2.838695, 0.3137255, 1, 0, 1,
-0.6400789, 0.7441079, -0.5842566, 0.3098039, 1, 0, 1,
-0.639494, 1.136532, 1.94481, 0.3019608, 1, 0, 1,
-0.6356759, 0.1640944, -2.868815, 0.2941177, 1, 0, 1,
-0.6354595, 1.074239, -1.292695, 0.2901961, 1, 0, 1,
-0.6341252, 1.156557, -0.6503313, 0.282353, 1, 0, 1,
-0.6285754, 1.202752, -0.5931418, 0.2784314, 1, 0, 1,
-0.6278891, 1.157848, -1.286413, 0.2705882, 1, 0, 1,
-0.6230022, 0.764462, -1.231518, 0.2666667, 1, 0, 1,
-0.6195794, 0.4666632, -1.778268, 0.2588235, 1, 0, 1,
-0.6168385, -0.4905092, -2.503367, 0.254902, 1, 0, 1,
-0.6137201, -1.603621, -2.882655, 0.2470588, 1, 0, 1,
-0.6131214, 0.8770654, 0.1647396, 0.2431373, 1, 0, 1,
-0.6115582, -0.2994561, -2.439604, 0.2352941, 1, 0, 1,
-0.5973683, -1.859044, -3.451195, 0.2313726, 1, 0, 1,
-0.5972462, -0.6631976, -1.331512, 0.2235294, 1, 0, 1,
-0.5962397, 1.020006, -0.1332637, 0.2196078, 1, 0, 1,
-0.5960737, -1.178653, -2.541998, 0.2117647, 1, 0, 1,
-0.5956065, 0.8974351, 0.2317616, 0.2078431, 1, 0, 1,
-0.591609, 1.414241, -0.1253638, 0.2, 1, 0, 1,
-0.5856975, 0.5241412, -0.02489271, 0.1921569, 1, 0, 1,
-0.5855058, 0.02442944, -1.777941, 0.1882353, 1, 0, 1,
-0.5840191, -0.1811389, -1.088302, 0.1803922, 1, 0, 1,
-0.5839908, -1.134684, -3.83548, 0.1764706, 1, 0, 1,
-0.5815212, -0.5975543, -3.125492, 0.1686275, 1, 0, 1,
-0.5746089, 0.4979815, -0.2404422, 0.1647059, 1, 0, 1,
-0.5740138, 0.2470785, -0.5616748, 0.1568628, 1, 0, 1,
-0.5725602, 1.062076, -1.522424, 0.1529412, 1, 0, 1,
-0.5723019, 0.9938064, -0.5242226, 0.145098, 1, 0, 1,
-0.5695459, -0.8100184, -2.185113, 0.1411765, 1, 0, 1,
-0.5661346, -0.4000563, -1.449269, 0.1333333, 1, 0, 1,
-0.5647697, -0.00319667, -1.21267, 0.1294118, 1, 0, 1,
-0.5620297, -2.098473, -2.046325, 0.1215686, 1, 0, 1,
-0.5612738, -0.1729769, -2.712134, 0.1176471, 1, 0, 1,
-0.5609244, -0.4269074, -1.866402, 0.1098039, 1, 0, 1,
-0.5600112, -0.4526603, -1.94754, 0.1058824, 1, 0, 1,
-0.5595649, 0.7270609, 0.08275884, 0.09803922, 1, 0, 1,
-0.5588125, 0.2563128, -1.523948, 0.09019608, 1, 0, 1,
-0.5501637, -0.9554375, -2.016146, 0.08627451, 1, 0, 1,
-0.5498009, 1.129466, 0.08552473, 0.07843138, 1, 0, 1,
-0.5426612, -1.092424, -1.525332, 0.07450981, 1, 0, 1,
-0.54234, 1.144165, -0.6960046, 0.06666667, 1, 0, 1,
-0.5410398, 0.2004136, -1.311756, 0.0627451, 1, 0, 1,
-0.5404304, -0.2374722, -2.589085, 0.05490196, 1, 0, 1,
-0.5399874, -2.290983, -3.342438, 0.05098039, 1, 0, 1,
-0.5363408, 2.183621, -1.402204, 0.04313726, 1, 0, 1,
-0.5345116, -0.1540683, -1.731943, 0.03921569, 1, 0, 1,
-0.532284, -0.5883638, -2.5705, 0.03137255, 1, 0, 1,
-0.5318378, -0.6917068, -0.3060704, 0.02745098, 1, 0, 1,
-0.5266203, 0.6222529, -1.360732, 0.01960784, 1, 0, 1,
-0.5250139, -0.5112965, -3.888423, 0.01568628, 1, 0, 1,
-0.521682, 0.3365312, -2.158553, 0.007843138, 1, 0, 1,
-0.5189825, -0.7569031, -3.21148, 0.003921569, 1, 0, 1,
-0.518843, -0.6508143, -2.283819, 0, 1, 0.003921569, 1,
-0.5174926, 0.4899068, 0.2176375, 0, 1, 0.01176471, 1,
-0.5107984, 0.3712623, -0.7108768, 0, 1, 0.01568628, 1,
-0.5085778, -0.1455422, -2.86777, 0, 1, 0.02352941, 1,
-0.5063564, -1.569125, -3.360628, 0, 1, 0.02745098, 1,
-0.5053583, 0.3458081, -1.797113, 0, 1, 0.03529412, 1,
-0.5034083, -0.5421557, -4.287126, 0, 1, 0.03921569, 1,
-0.5033287, -0.3153624, -2.691895, 0, 1, 0.04705882, 1,
-0.5027834, 1.681882, -0.7244937, 0, 1, 0.05098039, 1,
-0.5023708, -1.185515, -3.963439, 0, 1, 0.05882353, 1,
-0.5011821, -1.100868, -3.806434, 0, 1, 0.0627451, 1,
-0.5009256, -0.5664156, -1.080378, 0, 1, 0.07058824, 1,
-0.490336, -0.001370112, -3.596818, 0, 1, 0.07450981, 1,
-0.4839455, -0.07049208, -0.9998149, 0, 1, 0.08235294, 1,
-0.4797058, 2.15609, -0.2061419, 0, 1, 0.08627451, 1,
-0.4788265, 0.6731668, 0.3787198, 0, 1, 0.09411765, 1,
-0.4780211, -0.1592762, -1.401369, 0, 1, 0.1019608, 1,
-0.4762085, -1.246663, -3.239584, 0, 1, 0.1058824, 1,
-0.4730792, -0.5737312, -2.056867, 0, 1, 0.1137255, 1,
-0.473002, 0.4973372, 0.1742688, 0, 1, 0.1176471, 1,
-0.4723438, 0.9886127, 0.7854928, 0, 1, 0.1254902, 1,
-0.471345, -1.456001, -2.765308, 0, 1, 0.1294118, 1,
-0.4705714, -1.314935, -3.159302, 0, 1, 0.1372549, 1,
-0.4702653, 0.6484063, -1.090717, 0, 1, 0.1411765, 1,
-0.4701782, 1.550963, -1.51918, 0, 1, 0.1490196, 1,
-0.4671425, 0.1106687, -1.808149, 0, 1, 0.1529412, 1,
-0.4650669, -1.335642, -3.871152, 0, 1, 0.1607843, 1,
-0.4634817, -1.436048, -5.127898, 0, 1, 0.1647059, 1,
-0.4593593, -0.8184452, -2.393009, 0, 1, 0.172549, 1,
-0.4590308, 1.145856, -2.49067, 0, 1, 0.1764706, 1,
-0.4584637, 0.6174944, -1.378167, 0, 1, 0.1843137, 1,
-0.4583453, 0.9407859, -0.9530911, 0, 1, 0.1882353, 1,
-0.4579095, 0.03301578, -1.307491, 0, 1, 0.1960784, 1,
-0.4479819, 0.2670755, -1.586584, 0, 1, 0.2039216, 1,
-0.4472559, 0.08670083, 0.9640746, 0, 1, 0.2078431, 1,
-0.4424417, -1.474558, -4.242815, 0, 1, 0.2156863, 1,
-0.441464, 0.9705747, -0.8062418, 0, 1, 0.2196078, 1,
-0.4351728, -1.190837, -4.616655, 0, 1, 0.227451, 1,
-0.4324051, -0.03285437, -1.431775, 0, 1, 0.2313726, 1,
-0.4318213, -2.890287, -1.431235, 0, 1, 0.2392157, 1,
-0.4314278, 0.5845181, -0.4884489, 0, 1, 0.2431373, 1,
-0.4297661, 0.92129, 0.182394, 0, 1, 0.2509804, 1,
-0.4274532, 1.04561, -0.01501225, 0, 1, 0.254902, 1,
-0.4255677, 0.4270869, -1.726572, 0, 1, 0.2627451, 1,
-0.4245976, 0.4018121, -0.8831463, 0, 1, 0.2666667, 1,
-0.4230133, 0.9322731, -2.052422, 0, 1, 0.2745098, 1,
-0.4212005, 1.49172, -0.3103181, 0, 1, 0.2784314, 1,
-0.4187538, -0.7141098, -3.933529, 0, 1, 0.2862745, 1,
-0.4176786, 1.521542, 0.4739792, 0, 1, 0.2901961, 1,
-0.4173038, -0.1299726, -1.216837, 0, 1, 0.2980392, 1,
-0.4171407, -0.5808572, -2.466563, 0, 1, 0.3058824, 1,
-0.4142842, 1.018752, -0.7749451, 0, 1, 0.3098039, 1,
-0.4128341, -1.967706, -3.675087, 0, 1, 0.3176471, 1,
-0.4095997, 0.03117533, -1.581096, 0, 1, 0.3215686, 1,
-0.4069485, -0.6186185, -3.156255, 0, 1, 0.3294118, 1,
-0.4028082, -0.03227287, -1.079253, 0, 1, 0.3333333, 1,
-0.4026088, -1.42818, -3.379421, 0, 1, 0.3411765, 1,
-0.3992498, 0.8422142, -0.1230055, 0, 1, 0.345098, 1,
-0.3990463, -0.1480432, -0.9395714, 0, 1, 0.3529412, 1,
-0.3932611, 0.2333372, -1.92792, 0, 1, 0.3568628, 1,
-0.3899646, 0.9823466, -0.08242709, 0, 1, 0.3647059, 1,
-0.3892655, 0.7283105, -0.1495179, 0, 1, 0.3686275, 1,
-0.385646, -0.1034927, 0.04621483, 0, 1, 0.3764706, 1,
-0.3850764, -0.7966545, -3.249037, 0, 1, 0.3803922, 1,
-0.3841841, 0.0016817, 0.1441714, 0, 1, 0.3882353, 1,
-0.383202, -2.434953, -1.302476, 0, 1, 0.3921569, 1,
-0.3806283, -1.792047, -2.719588, 0, 1, 0.4, 1,
-0.3735009, -0.8990456, -1.538594, 0, 1, 0.4078431, 1,
-0.3729736, -0.05953684, -5.002941, 0, 1, 0.4117647, 1,
-0.3721071, -0.001972033, -2.156276, 0, 1, 0.4196078, 1,
-0.3712961, 0.3160315, 1.272239, 0, 1, 0.4235294, 1,
-0.3697431, 0.5074295, -0.5012862, 0, 1, 0.4313726, 1,
-0.3678387, 1.052494, 0.2825931, 0, 1, 0.4352941, 1,
-0.3670155, -0.7033823, -4.470209, 0, 1, 0.4431373, 1,
-0.3630708, -0.8199686, -1.408078, 0, 1, 0.4470588, 1,
-0.3630404, 0.0542565, -0.351737, 0, 1, 0.454902, 1,
-0.3620948, -1.099826, -3.598253, 0, 1, 0.4588235, 1,
-0.3569738, -1.032944, -2.03155, 0, 1, 0.4666667, 1,
-0.3549705, -0.5279763, -3.255777, 0, 1, 0.4705882, 1,
-0.3546317, 0.2516974, -0.09083591, 0, 1, 0.4784314, 1,
-0.3529935, 1.218051, 0.2111626, 0, 1, 0.4823529, 1,
-0.3526916, 1.16625, 0.2596907, 0, 1, 0.4901961, 1,
-0.3372326, -0.3873937, -2.268889, 0, 1, 0.4941176, 1,
-0.3285162, 0.09498475, -1.547017, 0, 1, 0.5019608, 1,
-0.3221734, 0.7814887, -0.8908456, 0, 1, 0.509804, 1,
-0.3178383, 0.6940902, 0.03970622, 0, 1, 0.5137255, 1,
-0.3138579, -0.1584454, -1.155567, 0, 1, 0.5215687, 1,
-0.3136836, 1.472506, -0.1856094, 0, 1, 0.5254902, 1,
-0.3134174, 0.1494168, -0.4196733, 0, 1, 0.5333334, 1,
-0.3070607, -0.2251528, -0.790039, 0, 1, 0.5372549, 1,
-0.3045198, 1.053079, 0.1298835, 0, 1, 0.5450981, 1,
-0.3034952, 1.591867, -1.760311, 0, 1, 0.5490196, 1,
-0.30344, -0.2986298, -2.398676, 0, 1, 0.5568628, 1,
-0.3030075, -0.7405515, -2.078679, 0, 1, 0.5607843, 1,
-0.3024563, -1.028171, -2.082107, 0, 1, 0.5686275, 1,
-0.3009795, 0.5369677, -0.7623284, 0, 1, 0.572549, 1,
-0.2992938, 0.5446331, -0.1603188, 0, 1, 0.5803922, 1,
-0.2954926, 2.261795, 0.7333114, 0, 1, 0.5843138, 1,
-0.2935999, 0.6958407, 0.9160141, 0, 1, 0.5921569, 1,
-0.293258, -0.1362548, -2.696097, 0, 1, 0.5960785, 1,
-0.2921254, 0.2676653, -0.9231514, 0, 1, 0.6039216, 1,
-0.2864635, 0.5406739, -0.156148, 0, 1, 0.6117647, 1,
-0.2854082, 1.016212, -0.4172224, 0, 1, 0.6156863, 1,
-0.2812265, 0.3656999, 0.1838002, 0, 1, 0.6235294, 1,
-0.2809841, 0.018408, -1.563623, 0, 1, 0.627451, 1,
-0.2779222, 2.13774, 1.033682, 0, 1, 0.6352941, 1,
-0.2769349, 0.5775581, -2.039503, 0, 1, 0.6392157, 1,
-0.2766548, -1.42024, -3.671246, 0, 1, 0.6470588, 1,
-0.2750876, 1.64341, 0.3677473, 0, 1, 0.6509804, 1,
-0.2626472, 0.05980498, -1.387193, 0, 1, 0.6588235, 1,
-0.2613295, 1.248059, -0.6794292, 0, 1, 0.6627451, 1,
-0.2613242, -0.7450272, -1.949952, 0, 1, 0.6705883, 1,
-0.2597719, -1.657491, -2.706195, 0, 1, 0.6745098, 1,
-0.2468288, 0.3703115, -0.854167, 0, 1, 0.682353, 1,
-0.2446274, -0.4376477, -3.790635, 0, 1, 0.6862745, 1,
-0.2391083, 1.430775, -2.425328, 0, 1, 0.6941177, 1,
-0.2360431, 0.3863311, -0.3947782, 0, 1, 0.7019608, 1,
-0.2352811, -1.868863, -4.656014, 0, 1, 0.7058824, 1,
-0.2322612, 1.092909, -3.156337, 0, 1, 0.7137255, 1,
-0.2293975, -0.5172964, -1.438156, 0, 1, 0.7176471, 1,
-0.2228215, -1.157383, -2.426574, 0, 1, 0.7254902, 1,
-0.2222654, 0.6013259, 0.8578715, 0, 1, 0.7294118, 1,
-0.2189572, 0.2932049, -1.583342, 0, 1, 0.7372549, 1,
-0.2184595, 0.8144365, 1.174362, 0, 1, 0.7411765, 1,
-0.2085809, 0.8017492, -0.4244338, 0, 1, 0.7490196, 1,
-0.2070091, 0.6646317, -1.586861, 0, 1, 0.7529412, 1,
-0.2059087, 0.8890066, -1.107969, 0, 1, 0.7607843, 1,
-0.1983628, 2.980186, -0.3134326, 0, 1, 0.7647059, 1,
-0.1916677, 0.2049992, -1.144431, 0, 1, 0.772549, 1,
-0.1912355, 1.314209, -0.13829, 0, 1, 0.7764706, 1,
-0.1860358, -0.1495407, -3.235784, 0, 1, 0.7843137, 1,
-0.1755351, 0.006694201, -2.019033, 0, 1, 0.7882353, 1,
-0.1733962, 0.4399557, -0.2442483, 0, 1, 0.7960784, 1,
-0.1725892, 0.05599198, -0.971679, 0, 1, 0.8039216, 1,
-0.1706057, -1.208542, -2.568292, 0, 1, 0.8078431, 1,
-0.1642432, 0.134892, -0.9718583, 0, 1, 0.8156863, 1,
-0.1628402, 0.09268332, 0.07807717, 0, 1, 0.8196079, 1,
-0.1617768, 0.7560732, -1.386038, 0, 1, 0.827451, 1,
-0.1617432, 0.2340137, 0.1298999, 0, 1, 0.8313726, 1,
-0.1591181, 0.2246806, -1.037942, 0, 1, 0.8392157, 1,
-0.1558119, 1.627139, -0.5559723, 0, 1, 0.8431373, 1,
-0.1542888, 0.4171776, -0.8630101, 0, 1, 0.8509804, 1,
-0.1527486, 0.08930299, -3.543056, 0, 1, 0.854902, 1,
-0.1479042, -0.3360219, -2.529602, 0, 1, 0.8627451, 1,
-0.1455634, -0.6731619, -3.571954, 0, 1, 0.8666667, 1,
-0.1433476, -2.575217, -1.008156, 0, 1, 0.8745098, 1,
-0.1430468, 1.620337, -0.4676148, 0, 1, 0.8784314, 1,
-0.1429791, -0.137923, -2.946289, 0, 1, 0.8862745, 1,
-0.1394164, 0.715589, -0.5644703, 0, 1, 0.8901961, 1,
-0.139366, 1.170275, 1.36146, 0, 1, 0.8980392, 1,
-0.139101, 0.621082, -0.1374437, 0, 1, 0.9058824, 1,
-0.1376477, 0.6473449, -1.560306, 0, 1, 0.9098039, 1,
-0.1344188, -1.06571, -2.797855, 0, 1, 0.9176471, 1,
-0.1263544, -1.51265, -2.086446, 0, 1, 0.9215686, 1,
-0.1236151, -0.4453458, -2.502281, 0, 1, 0.9294118, 1,
-0.1152419, 0.8748187, -0.02328845, 0, 1, 0.9333333, 1,
-0.1131333, 0.8623233, -0.7081628, 0, 1, 0.9411765, 1,
-0.111355, 0.5481519, 1.159984, 0, 1, 0.945098, 1,
-0.1086024, -0.2153521, -1.749256, 0, 1, 0.9529412, 1,
-0.1081211, 1.184781, 1.883547, 0, 1, 0.9568627, 1,
-0.1079122, -3.72433, -3.908413, 0, 1, 0.9647059, 1,
-0.104092, 0.7211737, -0.8927405, 0, 1, 0.9686275, 1,
-0.1003037, -0.4393919, -1.574611, 0, 1, 0.9764706, 1,
-0.09942529, 0.8960062, -0.1379749, 0, 1, 0.9803922, 1,
-0.09920414, -0.3671336, -2.094273, 0, 1, 0.9882353, 1,
-0.09853658, -0.7926999, -3.471732, 0, 1, 0.9921569, 1,
-0.09846159, 1.228918, 0.4275422, 0, 1, 1, 1,
-0.0959876, -0.7136068, -5.548384, 0, 0.9921569, 1, 1,
-0.09566318, -0.6430579, -2.203884, 0, 0.9882353, 1, 1,
-0.09186656, 0.003388037, -1.847944, 0, 0.9803922, 1, 1,
-0.09122633, 1.162096, -0.2473552, 0, 0.9764706, 1, 1,
-0.08813068, -1.233094, -5.248445, 0, 0.9686275, 1, 1,
-0.08673481, 0.5555217, 0.5440307, 0, 0.9647059, 1, 1,
-0.0827456, 1.141544, 1.423063, 0, 0.9568627, 1, 1,
-0.08188013, -1.698205, -4.185835, 0, 0.9529412, 1, 1,
-0.08167315, -0.4393197, -2.221518, 0, 0.945098, 1, 1,
-0.07868646, 1.993278, -0.4846625, 0, 0.9411765, 1, 1,
-0.07738411, 0.7383875, -0.6070164, 0, 0.9333333, 1, 1,
-0.06398503, 1.063103, -1.271952, 0, 0.9294118, 1, 1,
-0.06342736, -0.1595462, -3.615162, 0, 0.9215686, 1, 1,
-0.06123164, 2.437854, 0.4711288, 0, 0.9176471, 1, 1,
-0.05859899, 0.4894392, 0.9259272, 0, 0.9098039, 1, 1,
-0.05273059, -0.4760456, -4.731432, 0, 0.9058824, 1, 1,
-0.05242146, -0.7540507, -2.935262, 0, 0.8980392, 1, 1,
-0.04851194, -0.02287732, -3.690617, 0, 0.8901961, 1, 1,
-0.0471494, 0.9830554, -1.386713, 0, 0.8862745, 1, 1,
-0.04426147, 0.06231205, -2.249764, 0, 0.8784314, 1, 1,
-0.04296003, 1.38007, 0.234425, 0, 0.8745098, 1, 1,
-0.03899099, 0.5996029, -0.4698489, 0, 0.8666667, 1, 1,
-0.03535309, -1.609469, -2.509003, 0, 0.8627451, 1, 1,
-0.03388674, -0.7366726, -2.854391, 0, 0.854902, 1, 1,
-0.03078484, 0.2787139, 0.4183677, 0, 0.8509804, 1, 1,
-0.03006438, -0.6856423, -4.554984, 0, 0.8431373, 1, 1,
-0.02756737, 0.6098602, -1.645808, 0, 0.8392157, 1, 1,
-0.02740912, -0.720259, -2.637151, 0, 0.8313726, 1, 1,
-0.02516311, 0.3641852, -1.705128, 0, 0.827451, 1, 1,
-0.02456378, -0.04298028, -1.96424, 0, 0.8196079, 1, 1,
-0.02211589, 0.455767, -0.1263972, 0, 0.8156863, 1, 1,
-0.01592586, -0.7105054, -4.402365, 0, 0.8078431, 1, 1,
-0.00861145, -0.3411368, -2.799355, 0, 0.8039216, 1, 1,
-0.004972083, 0.2565119, -0.5022702, 0, 0.7960784, 1, 1,
-0.004039424, -0.09894896, -1.928104, 0, 0.7882353, 1, 1,
-0.002500916, -0.3241411, -3.352795, 0, 0.7843137, 1, 1,
0.007355105, -0.4000627, 3.736734, 0, 0.7764706, 1, 1,
0.008007736, -1.514379, 2.058119, 0, 0.772549, 1, 1,
0.008865965, -0.2021632, 2.125463, 0, 0.7647059, 1, 1,
0.01280225, -0.4771624, 1.521727, 0, 0.7607843, 1, 1,
0.01511832, 0.1797377, 0.8258067, 0, 0.7529412, 1, 1,
0.01595326, -0.7585996, 4.013103, 0, 0.7490196, 1, 1,
0.02043577, 2.302712, 2.305149, 0, 0.7411765, 1, 1,
0.02211107, -0.1070367, 3.365624, 0, 0.7372549, 1, 1,
0.02370291, -0.1258876, 3.690758, 0, 0.7294118, 1, 1,
0.02467384, 0.1899093, -0.3255843, 0, 0.7254902, 1, 1,
0.02549954, -1.141992, 3.249465, 0, 0.7176471, 1, 1,
0.02559552, 0.8902293, 0.2690734, 0, 0.7137255, 1, 1,
0.02828623, -1.170839, 0.9160917, 0, 0.7058824, 1, 1,
0.02934767, 0.5525296, -1.529741, 0, 0.6980392, 1, 1,
0.03446766, 0.6200687, 0.1543408, 0, 0.6941177, 1, 1,
0.04120117, 0.8007375, -0.7972075, 0, 0.6862745, 1, 1,
0.04165484, -0.04383559, 2.512971, 0, 0.682353, 1, 1,
0.04316311, 0.7377194, -0.1996385, 0, 0.6745098, 1, 1,
0.04778096, 0.5506043, -0.1653953, 0, 0.6705883, 1, 1,
0.04960139, -1.325669, 2.22946, 0, 0.6627451, 1, 1,
0.055821, 0.3162718, 0.5146629, 0, 0.6588235, 1, 1,
0.06069653, 1.222249, -0.876442, 0, 0.6509804, 1, 1,
0.06183201, 0.2658147, 0.1908065, 0, 0.6470588, 1, 1,
0.06251749, -1.691627, 3.488946, 0, 0.6392157, 1, 1,
0.06724096, 0.4768671, 1.686279, 0, 0.6352941, 1, 1,
0.0684761, -1.426154, 3.403287, 0, 0.627451, 1, 1,
0.07161088, -0.2890079, 3.71767, 0, 0.6235294, 1, 1,
0.07388523, 0.8677714, -0.5384024, 0, 0.6156863, 1, 1,
0.07608391, -1.336678, 4.582595, 0, 0.6117647, 1, 1,
0.07619794, -1.266357, 3.481212, 0, 0.6039216, 1, 1,
0.07961733, -0.0174681, 2.39964, 0, 0.5960785, 1, 1,
0.08030008, -1.135041, 3.112274, 0, 0.5921569, 1, 1,
0.08346428, 0.9701048, -0.06533282, 0, 0.5843138, 1, 1,
0.08510052, 1.070828, 0.3957163, 0, 0.5803922, 1, 1,
0.08653089, 0.5867209, 0.320121, 0, 0.572549, 1, 1,
0.08986981, -1.209726, 2.440152, 0, 0.5686275, 1, 1,
0.0959636, 1.030287, -1.143305, 0, 0.5607843, 1, 1,
0.09638351, -2.09387, 2.685535, 0, 0.5568628, 1, 1,
0.09817979, -0.4179281, 1.675278, 0, 0.5490196, 1, 1,
0.1046578, -0.7266351, 2.411955, 0, 0.5450981, 1, 1,
0.104957, 0.1467225, -0.3559208, 0, 0.5372549, 1, 1,
0.1064174, -2.13059, 2.626092, 0, 0.5333334, 1, 1,
0.1151703, -0.5609104, 2.501024, 0, 0.5254902, 1, 1,
0.1166687, 0.6672273, 0.442725, 0, 0.5215687, 1, 1,
0.1218705, 1.36411, 0.2485174, 0, 0.5137255, 1, 1,
0.1263394, -0.4732535, 3.037831, 0, 0.509804, 1, 1,
0.1266129, -0.4667166, 1.834806, 0, 0.5019608, 1, 1,
0.1275492, -0.2177103, 2.070374, 0, 0.4941176, 1, 1,
0.1327902, 0.816328, -1.373273, 0, 0.4901961, 1, 1,
0.1352399, 0.3814887, 0.4080062, 0, 0.4823529, 1, 1,
0.1354599, 0.9365952, -0.4267201, 0, 0.4784314, 1, 1,
0.1361682, -1.188175, 2.946166, 0, 0.4705882, 1, 1,
0.1395941, -1.433981, 1.153491, 0, 0.4666667, 1, 1,
0.1513774, 0.4342785, -0.06455217, 0, 0.4588235, 1, 1,
0.1517637, -0.5702611, 2.979589, 0, 0.454902, 1, 1,
0.1556352, 0.4357759, 1.316016, 0, 0.4470588, 1, 1,
0.1561272, 2.373796, -0.3641105, 0, 0.4431373, 1, 1,
0.1602064, -0.9224142, 4.84206, 0, 0.4352941, 1, 1,
0.1605573, -0.5296872, 3.392122, 0, 0.4313726, 1, 1,
0.1609119, -0.9159757, 4.484331, 0, 0.4235294, 1, 1,
0.1618417, 0.6283053, 0.5676681, 0, 0.4196078, 1, 1,
0.1642858, -2.981364, 1.782538, 0, 0.4117647, 1, 1,
0.1681784, -0.04833734, 1.332824, 0, 0.4078431, 1, 1,
0.1690267, 0.0682231, 2.681193, 0, 0.4, 1, 1,
0.1692426, 0.557341, 0.9322223, 0, 0.3921569, 1, 1,
0.1698551, -0.1694194, 3.764627, 0, 0.3882353, 1, 1,
0.1726576, 0.340142, 0.5325953, 0, 0.3803922, 1, 1,
0.1735872, 0.2207508, 0.5784011, 0, 0.3764706, 1, 1,
0.1821336, 0.8487754, 0.3506071, 0, 0.3686275, 1, 1,
0.1843763, 0.2501414, 1.689431, 0, 0.3647059, 1, 1,
0.1858045, 0.7729496, 2.274924, 0, 0.3568628, 1, 1,
0.1922685, 0.7088165, 1.056117, 0, 0.3529412, 1, 1,
0.194181, -0.006946876, 3.159754, 0, 0.345098, 1, 1,
0.1948776, -1.599261, 5.415395, 0, 0.3411765, 1, 1,
0.2107128, -0.5648096, 2.578106, 0, 0.3333333, 1, 1,
0.2121674, -0.6778838, 3.037632, 0, 0.3294118, 1, 1,
0.2129473, 0.9515539, -0.9645592, 0, 0.3215686, 1, 1,
0.2169148, 0.01275919, 1.495682, 0, 0.3176471, 1, 1,
0.2198272, -0.3818741, 2.506388, 0, 0.3098039, 1, 1,
0.2201884, 1.142007, -0.03496391, 0, 0.3058824, 1, 1,
0.2240831, 0.2359615, 0.6624601, 0, 0.2980392, 1, 1,
0.2274369, -0.9099638, 3.497667, 0, 0.2901961, 1, 1,
0.2279598, 0.272328, -0.5763975, 0, 0.2862745, 1, 1,
0.2327378, -0.1070663, 2.17476, 0, 0.2784314, 1, 1,
0.2337804, 0.8152066, -0.3039428, 0, 0.2745098, 1, 1,
0.2348896, -0.7201115, 3.638919, 0, 0.2666667, 1, 1,
0.2380722, -2.890377, 3.324816, 0, 0.2627451, 1, 1,
0.238633, 1.422704, 2.878816, 0, 0.254902, 1, 1,
0.2408447, -0.6975852, 2.261836, 0, 0.2509804, 1, 1,
0.2531884, -0.2505523, 2.429201, 0, 0.2431373, 1, 1,
0.2630947, 0.4023479, 1.307645, 0, 0.2392157, 1, 1,
0.2668936, -1.595608, 2.599346, 0, 0.2313726, 1, 1,
0.2673533, 0.3512919, 1.210708, 0, 0.227451, 1, 1,
0.2687674, -0.1564001, 1.674502, 0, 0.2196078, 1, 1,
0.2693877, -0.06572243, 2.568165, 0, 0.2156863, 1, 1,
0.2701536, 0.1855549, 0.08035253, 0, 0.2078431, 1, 1,
0.2766354, 0.2251019, 0.5807452, 0, 0.2039216, 1, 1,
0.2780511, 1.524274, -1.148154, 0, 0.1960784, 1, 1,
0.2827466, -0.9161682, 2.333479, 0, 0.1882353, 1, 1,
0.2855857, -0.1571447, 2.424893, 0, 0.1843137, 1, 1,
0.2880481, -0.2154829, 2.754605, 0, 0.1764706, 1, 1,
0.2910702, -0.3958025, 2.510132, 0, 0.172549, 1, 1,
0.292139, -0.5380771, 2.409607, 0, 0.1647059, 1, 1,
0.2924068, 0.5402894, 0.9450618, 0, 0.1607843, 1, 1,
0.3044565, -1.01411, 0.7310366, 0, 0.1529412, 1, 1,
0.3053021, -0.176057, 2.34716, 0, 0.1490196, 1, 1,
0.3094893, 1.165651, 0.8777378, 0, 0.1411765, 1, 1,
0.3107135, 0.3094648, 2.392516, 0, 0.1372549, 1, 1,
0.3109292, 0.9778715, 0.3588201, 0, 0.1294118, 1, 1,
0.3141996, 0.7085831, -1.911707, 0, 0.1254902, 1, 1,
0.3184427, -0.2768254, 2.759388, 0, 0.1176471, 1, 1,
0.3186808, 0.6185438, 0.6090221, 0, 0.1137255, 1, 1,
0.3192276, 0.2511335, 0.238507, 0, 0.1058824, 1, 1,
0.3213364, 0.3068358, 0.9322455, 0, 0.09803922, 1, 1,
0.3247892, 0.151602, 0.2062728, 0, 0.09411765, 1, 1,
0.3248667, 0.964527, 1.780048, 0, 0.08627451, 1, 1,
0.3290696, 1.858391, 0.7225019, 0, 0.08235294, 1, 1,
0.3335746, 1.714368, -0.2083316, 0, 0.07450981, 1, 1,
0.3336937, -1.362, 4.209055, 0, 0.07058824, 1, 1,
0.3379849, 0.06701894, 1.785403, 0, 0.0627451, 1, 1,
0.339386, 0.2895389, 0.9801095, 0, 0.05882353, 1, 1,
0.344849, 0.7774459, 0.439431, 0, 0.05098039, 1, 1,
0.3451308, 1.596197, 1.363811, 0, 0.04705882, 1, 1,
0.3500478, 0.340926, -0.1594941, 0, 0.03921569, 1, 1,
0.3546164, 0.4027499, 0.8597254, 0, 0.03529412, 1, 1,
0.3553991, 1.137836, -0.5253288, 0, 0.02745098, 1, 1,
0.3638815, 0.7752569, -0.9150723, 0, 0.02352941, 1, 1,
0.364488, 0.5532693, 1.12171, 0, 0.01568628, 1, 1,
0.3706317, -1.066432, 2.798344, 0, 0.01176471, 1, 1,
0.3736011, -2.543884, 2.971716, 0, 0.003921569, 1, 1,
0.3740856, 1.197016, -0.5888343, 0.003921569, 0, 1, 1,
0.3744552, -0.2291803, 2.569773, 0.007843138, 0, 1, 1,
0.3760518, -1.437263, 3.604598, 0.01568628, 0, 1, 1,
0.3770884, 0.5819672, 1.279562, 0.01960784, 0, 1, 1,
0.3784647, -0.03942633, 2.414988, 0.02745098, 0, 1, 1,
0.3815743, 0.675459, -0.0416856, 0.03137255, 0, 1, 1,
0.3894423, -0.7730579, 1.236474, 0.03921569, 0, 1, 1,
0.3917449, -2.022937, 3.88619, 0.04313726, 0, 1, 1,
0.3949293, -0.2199993, 0.690859, 0.05098039, 0, 1, 1,
0.4019251, -1.149985, 2.586032, 0.05490196, 0, 1, 1,
0.4043351, -0.9936032, 3.997521, 0.0627451, 0, 1, 1,
0.4115092, -0.448297, 1.325292, 0.06666667, 0, 1, 1,
0.4125321, 1.264158, 0.6433378, 0.07450981, 0, 1, 1,
0.4171075, 1.141233, 0.6210575, 0.07843138, 0, 1, 1,
0.4184645, -1.487873, 2.078025, 0.08627451, 0, 1, 1,
0.418854, 0.02874013, 0.672612, 0.09019608, 0, 1, 1,
0.4200254, -0.07598791, 1.174835, 0.09803922, 0, 1, 1,
0.4201957, 1.312164, -0.8658665, 0.1058824, 0, 1, 1,
0.4206632, -0.8226987, 2.282392, 0.1098039, 0, 1, 1,
0.4240834, 0.8838162, 1.375658, 0.1176471, 0, 1, 1,
0.4268411, -0.4455351, 1.811982, 0.1215686, 0, 1, 1,
0.4311943, 0.3340091, 1.401188, 0.1294118, 0, 1, 1,
0.4324689, 0.02645947, 1.641538, 0.1333333, 0, 1, 1,
0.4326297, 1.049098, -0.5797036, 0.1411765, 0, 1, 1,
0.4375184, -0.7200437, 2.585397, 0.145098, 0, 1, 1,
0.4390658, 0.7216638, -0.1745985, 0.1529412, 0, 1, 1,
0.442739, 0.1218681, 2.245353, 0.1568628, 0, 1, 1,
0.4584516, -0.715809, 2.65941, 0.1647059, 0, 1, 1,
0.4588144, -0.5832521, 1.128343, 0.1686275, 0, 1, 1,
0.4667557, -0.5374295, 2.080539, 0.1764706, 0, 1, 1,
0.4683897, 0.5420766, 1.637642, 0.1803922, 0, 1, 1,
0.4684612, 1.129743, -0.3918072, 0.1882353, 0, 1, 1,
0.4708113, -0.2633141, 2.264769, 0.1921569, 0, 1, 1,
0.4758671, 1.132423, 0.03758743, 0.2, 0, 1, 1,
0.477328, -1.140076, 2.330442, 0.2078431, 0, 1, 1,
0.4784636, -0.1401669, 0.9350569, 0.2117647, 0, 1, 1,
0.4812022, 0.2979794, 0.8052099, 0.2196078, 0, 1, 1,
0.4815102, 1.410731, -1.903539, 0.2235294, 0, 1, 1,
0.4825744, -0.3554571, 3.879423, 0.2313726, 0, 1, 1,
0.4910919, 0.3626552, 2.284156, 0.2352941, 0, 1, 1,
0.4915064, -2.534509, 3.504149, 0.2431373, 0, 1, 1,
0.4915457, 0.1163312, 1.889629, 0.2470588, 0, 1, 1,
0.4924035, -1.866243, 4.432321, 0.254902, 0, 1, 1,
0.4954981, -0.2494543, 3.057779, 0.2588235, 0, 1, 1,
0.5007557, -0.2368083, 1.261681, 0.2666667, 0, 1, 1,
0.501029, -1.006371, 1.873769, 0.2705882, 0, 1, 1,
0.5020334, 1.074599, -0.6929561, 0.2784314, 0, 1, 1,
0.5071549, -0.1511399, 0.03790011, 0.282353, 0, 1, 1,
0.5132077, 0.7847042, 1.21749, 0.2901961, 0, 1, 1,
0.5175723, -0.1426978, 2.562085, 0.2941177, 0, 1, 1,
0.5181366, -0.861405, 2.230713, 0.3019608, 0, 1, 1,
0.5206876, 0.9933352, 0.4739042, 0.3098039, 0, 1, 1,
0.5226297, -0.2011535, 2.62415, 0.3137255, 0, 1, 1,
0.527311, -0.08762904, 1.294456, 0.3215686, 0, 1, 1,
0.5306143, 1.834635, 1.043592, 0.3254902, 0, 1, 1,
0.5329355, 0.7892797, 0.2598186, 0.3333333, 0, 1, 1,
0.5401551, -0.8692595, 2.056544, 0.3372549, 0, 1, 1,
0.541796, 0.5355713, -1.140094, 0.345098, 0, 1, 1,
0.5458186, 0.1342423, -0.7525459, 0.3490196, 0, 1, 1,
0.5501061, -1.129496, 3.483777, 0.3568628, 0, 1, 1,
0.5518998, -0.6463926, 3.683205, 0.3607843, 0, 1, 1,
0.5581065, -0.9878688, 3.087876, 0.3686275, 0, 1, 1,
0.5597607, -0.3291936, 3.978825, 0.372549, 0, 1, 1,
0.5637233, -0.6547624, -0.333245, 0.3803922, 0, 1, 1,
0.5747223, -1.037489, 1.476342, 0.3843137, 0, 1, 1,
0.5750461, -2.057177, 3.50571, 0.3921569, 0, 1, 1,
0.5756613, 0.6976467, -0.6798959, 0.3960784, 0, 1, 1,
0.577915, 1.169785, 0.4590368, 0.4039216, 0, 1, 1,
0.5781459, 0.5512604, 0.4631382, 0.4117647, 0, 1, 1,
0.5785413, 0.8042168, 0.08180206, 0.4156863, 0, 1, 1,
0.5806682, -0.07092464, 0.5022129, 0.4235294, 0, 1, 1,
0.5810153, 0.5703824, 0.4548197, 0.427451, 0, 1, 1,
0.5820308, 0.6120438, 0.7386066, 0.4352941, 0, 1, 1,
0.5907261, 0.4959128, 0.6675932, 0.4392157, 0, 1, 1,
0.5943106, -1.355431, 2.692633, 0.4470588, 0, 1, 1,
0.5972952, -1.216436, 4.770966, 0.4509804, 0, 1, 1,
0.5987347, 1.599829, 0.3132838, 0.4588235, 0, 1, 1,
0.603381, -0.1106005, 0.6270238, 0.4627451, 0, 1, 1,
0.6051561, -0.2064039, 3.667485, 0.4705882, 0, 1, 1,
0.6066914, -0.5408159, 1.333378, 0.4745098, 0, 1, 1,
0.611993, -0.4263303, 1.121701, 0.4823529, 0, 1, 1,
0.612746, 0.2367474, 2.17789, 0.4862745, 0, 1, 1,
0.6166121, 1.312784, 0.8101442, 0.4941176, 0, 1, 1,
0.6361068, 1.682856, -0.1703034, 0.5019608, 0, 1, 1,
0.6362838, 0.8750499, -0.7614039, 0.5058824, 0, 1, 1,
0.6382189, 0.680897, -0.701847, 0.5137255, 0, 1, 1,
0.6392953, -1.452782, 4.55408, 0.5176471, 0, 1, 1,
0.6464051, 1.084341, -0.2750626, 0.5254902, 0, 1, 1,
0.646807, -1.232132, 2.586871, 0.5294118, 0, 1, 1,
0.6470127, 1.549379, 1.048903, 0.5372549, 0, 1, 1,
0.6517406, -0.8768958, 3.671051, 0.5411765, 0, 1, 1,
0.6532654, 0.7866964, 0.01093734, 0.5490196, 0, 1, 1,
0.6555474, 0.05250859, 1.768126, 0.5529412, 0, 1, 1,
0.6586466, 0.8726783, 0.5342103, 0.5607843, 0, 1, 1,
0.6589657, -0.1204544, 1.757631, 0.5647059, 0, 1, 1,
0.6594822, 0.9205567, 1.351374, 0.572549, 0, 1, 1,
0.6596, -0.05031586, 1.09336, 0.5764706, 0, 1, 1,
0.6632128, 0.435875, 1.644975, 0.5843138, 0, 1, 1,
0.6638168, 0.3290417, 0.5579348, 0.5882353, 0, 1, 1,
0.6649856, -0.7646645, 3.795854, 0.5960785, 0, 1, 1,
0.6651878, 0.01826958, -0.522303, 0.6039216, 0, 1, 1,
0.6680927, -1.689621, 1.623618, 0.6078432, 0, 1, 1,
0.6729426, 0.203464, 1.19373, 0.6156863, 0, 1, 1,
0.6775945, -0.1651578, 1.945421, 0.6196079, 0, 1, 1,
0.6843542, -0.05001822, 0.5039307, 0.627451, 0, 1, 1,
0.6849813, 1.38308, 0.9716776, 0.6313726, 0, 1, 1,
0.6885501, -2.674556, 3.288447, 0.6392157, 0, 1, 1,
0.6944864, -0.3512637, 1.642222, 0.6431373, 0, 1, 1,
0.6959911, 0.0948312, 3.352049, 0.6509804, 0, 1, 1,
0.6982883, -0.9527081, 2.268919, 0.654902, 0, 1, 1,
0.7009984, 1.749745, 0.6037043, 0.6627451, 0, 1, 1,
0.7022841, 0.3423572, 0.4220407, 0.6666667, 0, 1, 1,
0.7088238, -0.2487042, 1.807501, 0.6745098, 0, 1, 1,
0.7172362, -1.261509, 1.970404, 0.6784314, 0, 1, 1,
0.7208362, -1.172155, 2.096235, 0.6862745, 0, 1, 1,
0.7252101, 0.8075756, 0.8754237, 0.6901961, 0, 1, 1,
0.7263953, -0.9460778, 2.457793, 0.6980392, 0, 1, 1,
0.7314806, 2.490148, 2.210766, 0.7058824, 0, 1, 1,
0.7375052, -1.590215, 2.603682, 0.7098039, 0, 1, 1,
0.7409201, -0.9580415, 4.074793, 0.7176471, 0, 1, 1,
0.7451513, 0.1835971, 1.084463, 0.7215686, 0, 1, 1,
0.7460058, -1.187405, 3.629843, 0.7294118, 0, 1, 1,
0.7460819, 0.8308005, -1.290037, 0.7333333, 0, 1, 1,
0.7466265, -1.214786, 2.17076, 0.7411765, 0, 1, 1,
0.7510013, -0.4630291, 3.938567, 0.7450981, 0, 1, 1,
0.7513657, -1.180297, 4.071436, 0.7529412, 0, 1, 1,
0.7589118, -0.2851963, 1.199603, 0.7568628, 0, 1, 1,
0.7599607, 1.145595, 0.5495628, 0.7647059, 0, 1, 1,
0.7690217, -0.6037452, 1.886221, 0.7686275, 0, 1, 1,
0.7761821, -0.5950279, 2.964312, 0.7764706, 0, 1, 1,
0.7780893, -0.5574797, 3.782269, 0.7803922, 0, 1, 1,
0.7877284, -0.8232298, 0.1070846, 0.7882353, 0, 1, 1,
0.7884893, -0.5934436, 1.424226, 0.7921569, 0, 1, 1,
0.7894398, -1.816464, 2.736002, 0.8, 0, 1, 1,
0.7900635, -0.6433972, 5.150918, 0.8078431, 0, 1, 1,
0.7943767, -1.466779, 1.888888, 0.8117647, 0, 1, 1,
0.7948303, -0.3673483, 1.73713, 0.8196079, 0, 1, 1,
0.7969357, -0.1854407, 2.092642, 0.8235294, 0, 1, 1,
0.8004726, 0.3731828, 1.403533, 0.8313726, 0, 1, 1,
0.8089179, 0.768232, 0.522172, 0.8352941, 0, 1, 1,
0.8117401, 0.03761293, 0.7382621, 0.8431373, 0, 1, 1,
0.8173323, 0.5105716, -0.3573708, 0.8470588, 0, 1, 1,
0.8205759, 0.6030681, 0.05352185, 0.854902, 0, 1, 1,
0.8214662, 0.9898606, 1.950744, 0.8588235, 0, 1, 1,
0.82881, 1.176305, 1.555725, 0.8666667, 0, 1, 1,
0.831319, -0.2618984, 3.237244, 0.8705882, 0, 1, 1,
0.833462, 0.1349004, 1.331415, 0.8784314, 0, 1, 1,
0.8447638, 0.2029326, 2.066582, 0.8823529, 0, 1, 1,
0.8453404, -1.786072, 2.721692, 0.8901961, 0, 1, 1,
0.8506233, -0.5797642, 2.450122, 0.8941177, 0, 1, 1,
0.8552298, -0.6373708, 2.916378, 0.9019608, 0, 1, 1,
0.8581331, -0.06872872, 2.795212, 0.9098039, 0, 1, 1,
0.8617147, -1.956245, 1.533447, 0.9137255, 0, 1, 1,
0.8784618, -0.4637863, 3.507909, 0.9215686, 0, 1, 1,
0.8790616, 1.237053, -0.2943833, 0.9254902, 0, 1, 1,
0.8890132, 0.3285831, 0.06617651, 0.9333333, 0, 1, 1,
0.8953102, 2.425063, -1.949841, 0.9372549, 0, 1, 1,
0.8955467, -0.581342, 4.854969, 0.945098, 0, 1, 1,
0.8972532, -0.3887077, 3.170388, 0.9490196, 0, 1, 1,
0.9014903, 0.4171993, 2.240314, 0.9568627, 0, 1, 1,
0.9054704, 0.4351062, 1.682554, 0.9607843, 0, 1, 1,
0.9079152, 0.2781717, 1.456047, 0.9686275, 0, 1, 1,
0.9185347, -0.3373214, 2.108781, 0.972549, 0, 1, 1,
0.9269261, -0.2579698, 0.5130712, 0.9803922, 0, 1, 1,
0.9282028, 0.5007899, 0.5707236, 0.9843137, 0, 1, 1,
0.929437, 0.383283, 0.8933289, 0.9921569, 0, 1, 1,
0.9303204, -0.2532279, 1.200858, 0.9960784, 0, 1, 1,
0.9401891, -0.4052904, 3.189453, 1, 0, 0.9960784, 1,
0.9430206, 0.801511, 1.850578, 1, 0, 0.9882353, 1,
0.9450878, -1.780153, 3.980861, 1, 0, 0.9843137, 1,
0.9466844, -1.03959, 2.114104, 1, 0, 0.9764706, 1,
0.9588936, 0.5729419, 2.825789, 1, 0, 0.972549, 1,
0.9619808, 0.1143564, 0.6474347, 1, 0, 0.9647059, 1,
0.9631944, -0.5121178, 0.6624125, 1, 0, 0.9607843, 1,
0.967743, 1.230662, -0.864206, 1, 0, 0.9529412, 1,
0.9690207, -0.293502, 0.2631394, 1, 0, 0.9490196, 1,
0.9738765, 0.1704821, 2.611701, 1, 0, 0.9411765, 1,
0.980829, -1.355414, 3.340919, 1, 0, 0.9372549, 1,
0.9840846, 0.1175272, 3.566831, 1, 0, 0.9294118, 1,
0.9857211, 0.2507604, 0.8709571, 1, 0, 0.9254902, 1,
0.9921845, -0.3706072, 0.06157162, 1, 0, 0.9176471, 1,
0.9925075, -1.228377, 3.109724, 1, 0, 0.9137255, 1,
0.9992549, -1.379237, 2.788204, 1, 0, 0.9058824, 1,
1.011988, 0.5686041, 2.328351, 1, 0, 0.9019608, 1,
1.013306, -0.1945185, 1.658569, 1, 0, 0.8941177, 1,
1.01399, 1.609991, 0.6118353, 1, 0, 0.8862745, 1,
1.014745, 0.2707255, 2.64969, 1, 0, 0.8823529, 1,
1.021397, 2.444563, -0.2834161, 1, 0, 0.8745098, 1,
1.022979, 0.8900067, -0.84773, 1, 0, 0.8705882, 1,
1.026664, 0.6201148, 1.951109, 1, 0, 0.8627451, 1,
1.036643, -0.2842483, 2.465165, 1, 0, 0.8588235, 1,
1.044027, 1.366925, 0.7106085, 1, 0, 0.8509804, 1,
1.049209, -0.01543327, 2.591206, 1, 0, 0.8470588, 1,
1.057946, 1.722715, -0.4798622, 1, 0, 0.8392157, 1,
1.060175, -0.225026, 2.22085, 1, 0, 0.8352941, 1,
1.073007, 0.3923355, 2.228981, 1, 0, 0.827451, 1,
1.087585, 1.227782, 0.7162747, 1, 0, 0.8235294, 1,
1.088169, 0.3992176, -0.2796296, 1, 0, 0.8156863, 1,
1.090495, -0.4925243, 2.233984, 1, 0, 0.8117647, 1,
1.095047, 0.3381275, 1.90801, 1, 0, 0.8039216, 1,
1.097343, 0.07913551, 2.410854, 1, 0, 0.7960784, 1,
1.102731, -0.2330266, 1.53535, 1, 0, 0.7921569, 1,
1.104698, 0.1871144, 2.92903, 1, 0, 0.7843137, 1,
1.112886, -0.899587, 1.025595, 1, 0, 0.7803922, 1,
1.119061, -1.728034, 2.357862, 1, 0, 0.772549, 1,
1.120098, -0.1643013, 2.168547, 1, 0, 0.7686275, 1,
1.121282, -0.7720526, 2.225238, 1, 0, 0.7607843, 1,
1.124823, -0.9140319, 2.681905, 1, 0, 0.7568628, 1,
1.130031, 0.4840852, 1.493045, 1, 0, 0.7490196, 1,
1.143947, 0.5292783, 1.634181, 1, 0, 0.7450981, 1,
1.144169, -0.7456002, 2.7126, 1, 0, 0.7372549, 1,
1.151629, 0.7087902, 1.112376, 1, 0, 0.7333333, 1,
1.153125, 0.3472345, 0.08170424, 1, 0, 0.7254902, 1,
1.153994, 0.07907976, 1.43991, 1, 0, 0.7215686, 1,
1.156231, 0.5099123, 0.594897, 1, 0, 0.7137255, 1,
1.159827, 1.755143, 0.6982433, 1, 0, 0.7098039, 1,
1.162169, 1.341431, 0.9776132, 1, 0, 0.7019608, 1,
1.163074, -1.584922, 2.282764, 1, 0, 0.6941177, 1,
1.172657, 0.3311855, 0.5002727, 1, 0, 0.6901961, 1,
1.177107, -0.4074835, 1.454068, 1, 0, 0.682353, 1,
1.185094, -0.8948556, 2.62744, 1, 0, 0.6784314, 1,
1.185978, 1.800373, -0.002510398, 1, 0, 0.6705883, 1,
1.211955, -1.172951, 1.300292, 1, 0, 0.6666667, 1,
1.215185, -1.431924, 2.167569, 1, 0, 0.6588235, 1,
1.22285, -1.519885, 2.559095, 1, 0, 0.654902, 1,
1.22572, 0.7222168, -0.09485995, 1, 0, 0.6470588, 1,
1.228094, -0.276901, 0.9058247, 1, 0, 0.6431373, 1,
1.232823, -0.5538086, 3.260158, 1, 0, 0.6352941, 1,
1.235288, -0.05575619, 2.503755, 1, 0, 0.6313726, 1,
1.236323, 1.196784, 1.590722, 1, 0, 0.6235294, 1,
1.241556, -0.8575044, 1.81394, 1, 0, 0.6196079, 1,
1.242643, -1.460795, 2.241206, 1, 0, 0.6117647, 1,
1.253381, 0.7850526, 1.143871, 1, 0, 0.6078432, 1,
1.254079, -1.302163, 2.813237, 1, 0, 0.6, 1,
1.263648, 0.3870795, 0.541708, 1, 0, 0.5921569, 1,
1.27194, 0.4220525, 0.8143108, 1, 0, 0.5882353, 1,
1.275493, 0.5407741, 1.184359, 1, 0, 0.5803922, 1,
1.275551, -0.1030384, 1.04829, 1, 0, 0.5764706, 1,
1.292843, 0.04356473, 1.895656, 1, 0, 0.5686275, 1,
1.301603, -1.876808, 2.674509, 1, 0, 0.5647059, 1,
1.30227, -0.4170934, 2.223687, 1, 0, 0.5568628, 1,
1.316352, -0.3281255, 2.61678, 1, 0, 0.5529412, 1,
1.316473, -0.226594, 1.951799, 1, 0, 0.5450981, 1,
1.31758, -1.026751, 1.274685, 1, 0, 0.5411765, 1,
1.317684, 0.5873157, 1.134158, 1, 0, 0.5333334, 1,
1.319239, 0.1669472, 0.7249429, 1, 0, 0.5294118, 1,
1.321419, 0.8743184, 1.708664, 1, 0, 0.5215687, 1,
1.334496, 0.9913779, 1.785036, 1, 0, 0.5176471, 1,
1.339711, 0.7161294, 1.74573, 1, 0, 0.509804, 1,
1.341649, -0.08980954, 1.968619, 1, 0, 0.5058824, 1,
1.363719, 0.1883348, 1.844863, 1, 0, 0.4980392, 1,
1.366423, -0.03313849, 1.439107, 1, 0, 0.4901961, 1,
1.371065, -0.799382, 3.159679, 1, 0, 0.4862745, 1,
1.371614, 1.111235, 0.9652849, 1, 0, 0.4784314, 1,
1.379188, -1.221042, 3.415804, 1, 0, 0.4745098, 1,
1.38825, 0.8125843, -0.2181531, 1, 0, 0.4666667, 1,
1.410904, 0.7374529, 1.937998, 1, 0, 0.4627451, 1,
1.432711, -1.705086, 2.485153, 1, 0, 0.454902, 1,
1.433602, -0.06854742, 2.552245, 1, 0, 0.4509804, 1,
1.442523, -0.3896978, 1.071593, 1, 0, 0.4431373, 1,
1.449683, 0.2784312, 0.5644253, 1, 0, 0.4392157, 1,
1.454079, 1.992891, 1.795161, 1, 0, 0.4313726, 1,
1.457996, -0.7039871, 1.703261, 1, 0, 0.427451, 1,
1.472011, 1.564453, 0.2751731, 1, 0, 0.4196078, 1,
1.475247, -0.2049948, 1.962954, 1, 0, 0.4156863, 1,
1.479777, 0.4283343, -0.3123413, 1, 0, 0.4078431, 1,
1.512972, -2.884248, 1.575805, 1, 0, 0.4039216, 1,
1.533881, -0.3456974, 2.023138, 1, 0, 0.3960784, 1,
1.538144, 0.4016174, 1.191622, 1, 0, 0.3882353, 1,
1.544426, -0.679117, 1.331306, 1, 0, 0.3843137, 1,
1.546008, 0.2018639, 0.9491673, 1, 0, 0.3764706, 1,
1.546377, -0.4564419, 1.294873, 1, 0, 0.372549, 1,
1.54679, -0.07609502, 0.4130175, 1, 0, 0.3647059, 1,
1.54831, -0.1914497, 1.251284, 1, 0, 0.3607843, 1,
1.560216, -1.600621, 0.3007254, 1, 0, 0.3529412, 1,
1.560573, 0.3021617, 3.771794, 1, 0, 0.3490196, 1,
1.562414, 1.129392, 0.7439321, 1, 0, 0.3411765, 1,
1.565392, 0.1082478, 0.8664344, 1, 0, 0.3372549, 1,
1.568056, 0.286626, 1.92859, 1, 0, 0.3294118, 1,
1.568625, -0.1197273, 3.032681, 1, 0, 0.3254902, 1,
1.568846, -0.1916304, 0.8983756, 1, 0, 0.3176471, 1,
1.594128, 1.058743, 1.161031, 1, 0, 0.3137255, 1,
1.602623, 2.680229, 0.6806952, 1, 0, 0.3058824, 1,
1.60622, 0.3093615, 3.52797, 1, 0, 0.2980392, 1,
1.640195, -0.4413806, 1.13258, 1, 0, 0.2941177, 1,
1.64301, 0.2434284, 0.4580165, 1, 0, 0.2862745, 1,
1.648541, -1.756973, 2.148171, 1, 0, 0.282353, 1,
1.665349, -0.1613913, 1.617677, 1, 0, 0.2745098, 1,
1.68073, -0.6733978, 2.67624, 1, 0, 0.2705882, 1,
1.695233, 1.622215, 0.5324534, 1, 0, 0.2627451, 1,
1.705894, 0.4509639, 0.3068484, 1, 0, 0.2588235, 1,
1.73795, 0.1748478, 0.9441865, 1, 0, 0.2509804, 1,
1.742198, 0.435543, -0.3285593, 1, 0, 0.2470588, 1,
1.749636, -1.882098, 1.895475, 1, 0, 0.2392157, 1,
1.757466, -0.464858, 1.120524, 1, 0, 0.2352941, 1,
1.758411, -1.227375, 0.954095, 1, 0, 0.227451, 1,
1.803003, -1.160946, 0.270685, 1, 0, 0.2235294, 1,
1.817631, -1.27617, 2.867089, 1, 0, 0.2156863, 1,
1.821719, -0.7748303, 3.406459, 1, 0, 0.2117647, 1,
1.828734, -0.2493199, 2.750039, 1, 0, 0.2039216, 1,
1.849174, -0.7674006, 2.109509, 1, 0, 0.1960784, 1,
1.849558, -0.1162163, 2.742704, 1, 0, 0.1921569, 1,
1.871279, 1.105457, 0.9997618, 1, 0, 0.1843137, 1,
1.883296, 0.8582394, 1.5712, 1, 0, 0.1803922, 1,
1.889273, 1.566811, 1.884009, 1, 0, 0.172549, 1,
1.912125, 1.370449, -0.1106984, 1, 0, 0.1686275, 1,
1.926565, 0.4997848, 0.498742, 1, 0, 0.1607843, 1,
1.934588, 1.333667, 0.3052029, 1, 0, 0.1568628, 1,
1.954181, -0.5880821, 1.827333, 1, 0, 0.1490196, 1,
1.977105, -0.7917986, 2.630887, 1, 0, 0.145098, 1,
1.977425, -0.181387, 1.802013, 1, 0, 0.1372549, 1,
1.9821, -1.249859, 1.045768, 1, 0, 0.1333333, 1,
2.000222, -0.1975319, 1.802599, 1, 0, 0.1254902, 1,
2.028599, 0.5267664, 3.011472, 1, 0, 0.1215686, 1,
2.047778, -0.7670498, 2.205456, 1, 0, 0.1137255, 1,
2.056057, 1.783803, -0.758432, 1, 0, 0.1098039, 1,
2.083915, 0.8799347, 1.438295, 1, 0, 0.1019608, 1,
2.091685, -0.8410178, 2.916786, 1, 0, 0.09411765, 1,
2.15923, -0.7812056, 3.545135, 1, 0, 0.09019608, 1,
2.167823, 0.1730879, 0.6017002, 1, 0, 0.08235294, 1,
2.176841, 0.04877665, 1.896183, 1, 0, 0.07843138, 1,
2.225358, -0.2716545, 1.938335, 1, 0, 0.07058824, 1,
2.227809, -1.152949, 3.030334, 1, 0, 0.06666667, 1,
2.237236, -0.982015, 1.027522, 1, 0, 0.05882353, 1,
2.338537, -0.2095284, 2.860851, 1, 0, 0.05490196, 1,
2.35186, -0.2682944, 1.046305, 1, 0, 0.04705882, 1,
2.353263, -2.226526, 2.438212, 1, 0, 0.04313726, 1,
2.444276, -0.03278269, 1.061194, 1, 0, 0.03529412, 1,
2.453166, -1.968705, 1.738077, 1, 0, 0.03137255, 1,
2.515711, -1.340364, 2.114806, 1, 0, 0.02352941, 1,
2.565457, -1.562098, 3.687516, 1, 0, 0.01960784, 1,
2.71221, 0.1167492, 2.701866, 1, 0, 0.01176471, 1,
3.326392, -0.2145635, 3.148824, 1, 0, 0.007843138, 1
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
0.3431588, -4.860745, -7.406744, 0, -0.5, 0.5, 0.5,
0.3431588, -4.860745, -7.406744, 1, -0.5, 0.5, 0.5,
0.3431588, -4.860745, -7.406744, 1, 1.5, 0.5, 0.5,
0.3431588, -4.860745, -7.406744, 0, 1.5, 0.5, 0.5
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
-3.651391, -0.3720717, -7.406744, 0, -0.5, 0.5, 0.5,
-3.651391, -0.3720717, -7.406744, 1, -0.5, 0.5, 0.5,
-3.651391, -0.3720717, -7.406744, 1, 1.5, 0.5, 0.5,
-3.651391, -0.3720717, -7.406744, 0, 1.5, 0.5, 0.5
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
-3.651391, -4.860745, -0.06649446, 0, -0.5, 0.5, 0.5,
-3.651391, -4.860745, -0.06649446, 1, -0.5, 0.5, 0.5,
-3.651391, -4.860745, -0.06649446, 1, 1.5, 0.5, 0.5,
-3.651391, -4.860745, -0.06649446, 0, 1.5, 0.5, 0.5
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
-2, -3.824898, -5.712841,
3, -3.824898, -5.712841,
-2, -3.824898, -5.712841,
-2, -3.997539, -5.995158,
-1, -3.824898, -5.712841,
-1, -3.997539, -5.995158,
0, -3.824898, -5.712841,
0, -3.997539, -5.995158,
1, -3.824898, -5.712841,
1, -3.997539, -5.995158,
2, -3.824898, -5.712841,
2, -3.997539, -5.995158,
3, -3.824898, -5.712841,
3, -3.997539, -5.995158
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
-2, -4.342821, -6.559792, 0, -0.5, 0.5, 0.5,
-2, -4.342821, -6.559792, 1, -0.5, 0.5, 0.5,
-2, -4.342821, -6.559792, 1, 1.5, 0.5, 0.5,
-2, -4.342821, -6.559792, 0, 1.5, 0.5, 0.5,
-1, -4.342821, -6.559792, 0, -0.5, 0.5, 0.5,
-1, -4.342821, -6.559792, 1, -0.5, 0.5, 0.5,
-1, -4.342821, -6.559792, 1, 1.5, 0.5, 0.5,
-1, -4.342821, -6.559792, 0, 1.5, 0.5, 0.5,
0, -4.342821, -6.559792, 0, -0.5, 0.5, 0.5,
0, -4.342821, -6.559792, 1, -0.5, 0.5, 0.5,
0, -4.342821, -6.559792, 1, 1.5, 0.5, 0.5,
0, -4.342821, -6.559792, 0, 1.5, 0.5, 0.5,
1, -4.342821, -6.559792, 0, -0.5, 0.5, 0.5,
1, -4.342821, -6.559792, 1, -0.5, 0.5, 0.5,
1, -4.342821, -6.559792, 1, 1.5, 0.5, 0.5,
1, -4.342821, -6.559792, 0, 1.5, 0.5, 0.5,
2, -4.342821, -6.559792, 0, -0.5, 0.5, 0.5,
2, -4.342821, -6.559792, 1, -0.5, 0.5, 0.5,
2, -4.342821, -6.559792, 1, 1.5, 0.5, 0.5,
2, -4.342821, -6.559792, 0, 1.5, 0.5, 0.5,
3, -4.342821, -6.559792, 0, -0.5, 0.5, 0.5,
3, -4.342821, -6.559792, 1, -0.5, 0.5, 0.5,
3, -4.342821, -6.559792, 1, 1.5, 0.5, 0.5,
3, -4.342821, -6.559792, 0, 1.5, 0.5, 0.5
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
-2.729572, -3, -5.712841,
-2.729572, 2, -5.712841,
-2.729572, -3, -5.712841,
-2.883208, -3, -5.995158,
-2.729572, -2, -5.712841,
-2.883208, -2, -5.995158,
-2.729572, -1, -5.712841,
-2.883208, -1, -5.995158,
-2.729572, 0, -5.712841,
-2.883208, 0, -5.995158,
-2.729572, 1, -5.712841,
-2.883208, 1, -5.995158,
-2.729572, 2, -5.712841,
-2.883208, 2, -5.995158
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
-3.190481, -3, -6.559792, 0, -0.5, 0.5, 0.5,
-3.190481, -3, -6.559792, 1, -0.5, 0.5, 0.5,
-3.190481, -3, -6.559792, 1, 1.5, 0.5, 0.5,
-3.190481, -3, -6.559792, 0, 1.5, 0.5, 0.5,
-3.190481, -2, -6.559792, 0, -0.5, 0.5, 0.5,
-3.190481, -2, -6.559792, 1, -0.5, 0.5, 0.5,
-3.190481, -2, -6.559792, 1, 1.5, 0.5, 0.5,
-3.190481, -2, -6.559792, 0, 1.5, 0.5, 0.5,
-3.190481, -1, -6.559792, 0, -0.5, 0.5, 0.5,
-3.190481, -1, -6.559792, 1, -0.5, 0.5, 0.5,
-3.190481, -1, -6.559792, 1, 1.5, 0.5, 0.5,
-3.190481, -1, -6.559792, 0, 1.5, 0.5, 0.5,
-3.190481, 0, -6.559792, 0, -0.5, 0.5, 0.5,
-3.190481, 0, -6.559792, 1, -0.5, 0.5, 0.5,
-3.190481, 0, -6.559792, 1, 1.5, 0.5, 0.5,
-3.190481, 0, -6.559792, 0, 1.5, 0.5, 0.5,
-3.190481, 1, -6.559792, 0, -0.5, 0.5, 0.5,
-3.190481, 1, -6.559792, 1, -0.5, 0.5, 0.5,
-3.190481, 1, -6.559792, 1, 1.5, 0.5, 0.5,
-3.190481, 1, -6.559792, 0, 1.5, 0.5, 0.5,
-3.190481, 2, -6.559792, 0, -0.5, 0.5, 0.5,
-3.190481, 2, -6.559792, 1, -0.5, 0.5, 0.5,
-3.190481, 2, -6.559792, 1, 1.5, 0.5, 0.5,
-3.190481, 2, -6.559792, 0, 1.5, 0.5, 0.5
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
-2.729572, -3.824898, -4,
-2.729572, -3.824898, 4,
-2.729572, -3.824898, -4,
-2.883208, -3.997539, -4,
-2.729572, -3.824898, -2,
-2.883208, -3.997539, -2,
-2.729572, -3.824898, 0,
-2.883208, -3.997539, 0,
-2.729572, -3.824898, 2,
-2.883208, -3.997539, 2,
-2.729572, -3.824898, 4,
-2.883208, -3.997539, 4
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
-3.190481, -4.342821, -4, 0, -0.5, 0.5, 0.5,
-3.190481, -4.342821, -4, 1, -0.5, 0.5, 0.5,
-3.190481, -4.342821, -4, 1, 1.5, 0.5, 0.5,
-3.190481, -4.342821, -4, 0, 1.5, 0.5, 0.5,
-3.190481, -4.342821, -2, 0, -0.5, 0.5, 0.5,
-3.190481, -4.342821, -2, 1, -0.5, 0.5, 0.5,
-3.190481, -4.342821, -2, 1, 1.5, 0.5, 0.5,
-3.190481, -4.342821, -2, 0, 1.5, 0.5, 0.5,
-3.190481, -4.342821, 0, 0, -0.5, 0.5, 0.5,
-3.190481, -4.342821, 0, 1, -0.5, 0.5, 0.5,
-3.190481, -4.342821, 0, 1, 1.5, 0.5, 0.5,
-3.190481, -4.342821, 0, 0, 1.5, 0.5, 0.5,
-3.190481, -4.342821, 2, 0, -0.5, 0.5, 0.5,
-3.190481, -4.342821, 2, 1, -0.5, 0.5, 0.5,
-3.190481, -4.342821, 2, 1, 1.5, 0.5, 0.5,
-3.190481, -4.342821, 2, 0, 1.5, 0.5, 0.5,
-3.190481, -4.342821, 4, 0, -0.5, 0.5, 0.5,
-3.190481, -4.342821, 4, 1, -0.5, 0.5, 0.5,
-3.190481, -4.342821, 4, 1, 1.5, 0.5, 0.5,
-3.190481, -4.342821, 4, 0, 1.5, 0.5, 0.5
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
-2.729572, -3.824898, -5.712841,
-2.729572, 3.080754, -5.712841,
-2.729572, -3.824898, 5.579852,
-2.729572, 3.080754, 5.579852,
-2.729572, -3.824898, -5.712841,
-2.729572, -3.824898, 5.579852,
-2.729572, 3.080754, -5.712841,
-2.729572, 3.080754, 5.579852,
-2.729572, -3.824898, -5.712841,
3.415889, -3.824898, -5.712841,
-2.729572, -3.824898, 5.579852,
3.415889, -3.824898, 5.579852,
-2.729572, 3.080754, -5.712841,
3.415889, 3.080754, -5.712841,
-2.729572, 3.080754, 5.579852,
3.415889, 3.080754, 5.579852,
3.415889, -3.824898, -5.712841,
3.415889, 3.080754, -5.712841,
3.415889, -3.824898, 5.579852,
3.415889, 3.080754, 5.579852,
3.415889, -3.824898, -5.712841,
3.415889, -3.824898, 5.579852,
3.415889, 3.080754, -5.712841,
3.415889, 3.080754, 5.579852
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
var radius = 7.792817;
var distance = 34.67112;
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
mvMatrix.translate( -0.3431588, 0.3720717, 0.06649446 );
mvMatrix.scale( 1.371052, 1.220123, 0.7461238 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.67112);
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
Fipronil<-read.table("Fipronil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Fipronil$V2
```

```
## Error in eval(expr, envir, enclos): object 'Fipronil' not found
```

```r
y<-Fipronil$V3
```

```
## Error in eval(expr, envir, enclos): object 'Fipronil' not found
```

```r
z<-Fipronil$V4
```

```
## Error in eval(expr, envir, enclos): object 'Fipronil' not found
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
-2.640074, -1.867581, -3.502133, 0, 0, 1, 1, 1,
-2.596199, -1.424984, -1.624477, 1, 0, 0, 1, 1,
-2.585573, 0.4914254, -3.935162, 1, 0, 0, 1, 1,
-2.492645, 0.7894422, 0.4955122, 1, 0, 0, 1, 1,
-2.47726, -1.092328, -2.007263, 1, 0, 0, 1, 1,
-2.397708, 0.04796863, -0.7299751, 1, 0, 0, 1, 1,
-2.286949, 0.6414216, 0.2873927, 0, 0, 0, 1, 1,
-2.281746, 0.2855141, -1.178573, 0, 0, 0, 1, 1,
-2.272876, -1.097489, -2.153063, 0, 0, 0, 1, 1,
-2.243709, -0.3033227, -0.3233767, 0, 0, 0, 1, 1,
-2.231547, 2.747613, -0.02233075, 0, 0, 0, 1, 1,
-2.219903, 0.3525151, -1.551747, 0, 0, 0, 1, 1,
-2.213416, 2.01655, -1.134685, 0, 0, 0, 1, 1,
-2.200354, 0.206536, -2.804377, 1, 1, 1, 1, 1,
-2.171323, -0.5951321, -3.526358, 1, 1, 1, 1, 1,
-2.166938, 0.6165401, -1.924878, 1, 1, 1, 1, 1,
-2.146593, -0.5453713, 0.002172933, 1, 1, 1, 1, 1,
-2.13949, 0.7771925, -2.073785, 1, 1, 1, 1, 1,
-2.089206, -0.8420005, -2.231836, 1, 1, 1, 1, 1,
-2.084001, 1.524157, 0.09790686, 1, 1, 1, 1, 1,
-2.041973, 0.568251, -1.335529, 1, 1, 1, 1, 1,
-2.01878, -1.130996, -2.545035, 1, 1, 1, 1, 1,
-1.983924, -1.366958, -2.036747, 1, 1, 1, 1, 1,
-1.98308, -0.3288018, -2.286083, 1, 1, 1, 1, 1,
-1.907262, -0.4331035, -2.36201, 1, 1, 1, 1, 1,
-1.891298, 0.8338978, 0.8731169, 1, 1, 1, 1, 1,
-1.890138, 1.844441, 0.7064521, 1, 1, 1, 1, 1,
-1.882154, 0.2463054, -1.385417, 1, 1, 1, 1, 1,
-1.880801, 0.3706356, -2.637495, 0, 0, 1, 1, 1,
-1.87524, 0.540208, -1.17081, 1, 0, 0, 1, 1,
-1.865157, -0.2864428, -1.879136, 1, 0, 0, 1, 1,
-1.851549, 0.02514407, -2.261866, 1, 0, 0, 1, 1,
-1.838815, 0.8582456, -1.56905, 1, 0, 0, 1, 1,
-1.812979, -1.760793, -1.423627, 1, 0, 0, 1, 1,
-1.805549, 0.2256702, -0.8831097, 0, 0, 0, 1, 1,
-1.793681, 0.8462353, -1.353045, 0, 0, 0, 1, 1,
-1.786473, -0.4453752, -1.797254, 0, 0, 0, 1, 1,
-1.784432, 0.8858941, -1.246343, 0, 0, 0, 1, 1,
-1.747416, -1.332412, -1.564851, 0, 0, 0, 1, 1,
-1.745688, 0.7764286, -1.305449, 0, 0, 0, 1, 1,
-1.741284, 0.6436818, 0.6205429, 0, 0, 0, 1, 1,
-1.71559, 1.796407, 0.7114303, 1, 1, 1, 1, 1,
-1.708647, -0.5498415, -0.06515345, 1, 1, 1, 1, 1,
-1.695356, -1.213075, -1.545255, 1, 1, 1, 1, 1,
-1.657483, 0.6171283, 1.409973, 1, 1, 1, 1, 1,
-1.65546, -1.130067, -1.766472, 1, 1, 1, 1, 1,
-1.645659, -0.3685367, -2.174032, 1, 1, 1, 1, 1,
-1.642892, 0.3497606, 0.2461749, 1, 1, 1, 1, 1,
-1.63598, 0.4853076, -1.573588, 1, 1, 1, 1, 1,
-1.635519, -1.582808, -3.249447, 1, 1, 1, 1, 1,
-1.617931, 0.6621031, -1.462246, 1, 1, 1, 1, 1,
-1.611534, -0.7428199, -2.584983, 1, 1, 1, 1, 1,
-1.60494, -0.01828299, 0.0695426, 1, 1, 1, 1, 1,
-1.588112, 0.11662, -0.885093, 1, 1, 1, 1, 1,
-1.587809, -0.4359201, -2.372984, 1, 1, 1, 1, 1,
-1.586473, -0.2195154, -1.366486, 1, 1, 1, 1, 1,
-1.559302, -0.2944464, -1.656554, 0, 0, 1, 1, 1,
-1.545022, -1.582359, -2.285611, 1, 0, 0, 1, 1,
-1.542888, -1.021436, -0.7478001, 1, 0, 0, 1, 1,
-1.529729, -1.01512, -2.749488, 1, 0, 0, 1, 1,
-1.523722, 0.3839331, -1.247313, 1, 0, 0, 1, 1,
-1.517402, 0.5596234, -1.768606, 1, 0, 0, 1, 1,
-1.509751, -1.868603, -2.801559, 0, 0, 0, 1, 1,
-1.505636, -0.2457974, -0.9305044, 0, 0, 0, 1, 1,
-1.50467, 1.498956, -1.219584, 0, 0, 0, 1, 1,
-1.500136, -0.5546024, -0.8275535, 0, 0, 0, 1, 1,
-1.498256, 0.5509762, -1.629022, 0, 0, 0, 1, 1,
-1.463877, -0.8187506, -1.762416, 0, 0, 0, 1, 1,
-1.46341, -0.6617953, -0.9859468, 0, 0, 0, 1, 1,
-1.460066, 0.04608144, -0.7013521, 1, 1, 1, 1, 1,
-1.453753, 1.126027, -2.36677, 1, 1, 1, 1, 1,
-1.444999, 0.8032386, -1.658037, 1, 1, 1, 1, 1,
-1.444452, -0.2214425, -1.326344, 1, 1, 1, 1, 1,
-1.433421, -0.2683864, -2.051882, 1, 1, 1, 1, 1,
-1.431868, -0.3928193, -0.3141821, 1, 1, 1, 1, 1,
-1.424677, -0.6120632, 0.1048952, 1, 1, 1, 1, 1,
-1.4234, -0.5845059, -0.6629906, 1, 1, 1, 1, 1,
-1.419846, -0.0943358, -2.897753, 1, 1, 1, 1, 1,
-1.403019, 1.79795, 0.4321481, 1, 1, 1, 1, 1,
-1.392819, -2.071121, -1.568939, 1, 1, 1, 1, 1,
-1.372574, -1.832563, -1.9703, 1, 1, 1, 1, 1,
-1.369151, 0.8263794, -2.835396, 1, 1, 1, 1, 1,
-1.364576, 0.6129286, -1.167132, 1, 1, 1, 1, 1,
-1.351711, -0.306192, -2.787631, 1, 1, 1, 1, 1,
-1.346993, -0.7508082, -2.498847, 0, 0, 1, 1, 1,
-1.339409, 2.078141, -1.458608, 1, 0, 0, 1, 1,
-1.328396, 0.04289823, 0.8358715, 1, 0, 0, 1, 1,
-1.323337, 0.7204453, 0.4123543, 1, 0, 0, 1, 1,
-1.321424, 2.090599, -0.4484815, 1, 0, 0, 1, 1,
-1.317775, 1.244369, -1.448829, 1, 0, 0, 1, 1,
-1.311143, 1.05482, -1.404649, 0, 0, 0, 1, 1,
-1.301613, -1.090309, -2.245119, 0, 0, 0, 1, 1,
-1.301194, -0.2703761, 0.4457254, 0, 0, 0, 1, 1,
-1.297601, 0.08113344, -0.04299714, 0, 0, 0, 1, 1,
-1.297381, 0.6119235, -2.898891, 0, 0, 0, 1, 1,
-1.296689, -0.2200812, 0.07609995, 0, 0, 0, 1, 1,
-1.28916, -0.9641481, -3.165185, 0, 0, 0, 1, 1,
-1.278421, -1.508482, -4.405559, 1, 1, 1, 1, 1,
-1.273759, -1.065501, -3.507385, 1, 1, 1, 1, 1,
-1.272904, 0.4926357, -2.211697, 1, 1, 1, 1, 1,
-1.272455, 2.547331, 0.6206151, 1, 1, 1, 1, 1,
-1.263519, 0.770714, 2.00649, 1, 1, 1, 1, 1,
-1.255136, -0.1236273, -1.845499, 1, 1, 1, 1, 1,
-1.254288, -0.2189676, -1.442449, 1, 1, 1, 1, 1,
-1.243683, -0.05867852, -1.369195, 1, 1, 1, 1, 1,
-1.228978, 1.092895, -0.2685215, 1, 1, 1, 1, 1,
-1.224516, -0.7845989, -2.374837, 1, 1, 1, 1, 1,
-1.213426, 0.02163883, -0.8240561, 1, 1, 1, 1, 1,
-1.211019, 0.07209242, -2.382549, 1, 1, 1, 1, 1,
-1.192032, 1.184684, -1.041764, 1, 1, 1, 1, 1,
-1.191624, 0.8909657, -0.7651762, 1, 1, 1, 1, 1,
-1.185081, 0.4544601, -1.532566, 1, 1, 1, 1, 1,
-1.180529, -0.2642922, -2.374708, 0, 0, 1, 1, 1,
-1.166313, -2.485414, -3.779485, 1, 0, 0, 1, 1,
-1.16427, -0.101821, -0.3970989, 1, 0, 0, 1, 1,
-1.163869, -1.825218, -3.503516, 1, 0, 0, 1, 1,
-1.156285, 0.3646921, 0.09929474, 1, 0, 0, 1, 1,
-1.150261, -0.9981692, -2.583704, 1, 0, 0, 1, 1,
-1.148473, -1.411872, -2.19451, 0, 0, 0, 1, 1,
-1.145847, 2.363669, 0.2109175, 0, 0, 0, 1, 1,
-1.14226, -0.8516453, -2.124077, 0, 0, 0, 1, 1,
-1.139657, 2.129782, -1.440302, 0, 0, 0, 1, 1,
-1.138622, 2.74922, 1.496497, 0, 0, 0, 1, 1,
-1.136623, -0.04947118, -0.8646336, 0, 0, 0, 1, 1,
-1.128859, 0.189273, -1.626956, 0, 0, 0, 1, 1,
-1.123247, 0.7731881, -0.01783037, 1, 1, 1, 1, 1,
-1.121829, -0.7487134, -2.213816, 1, 1, 1, 1, 1,
-1.121256, -0.2767634, -0.3031954, 1, 1, 1, 1, 1,
-1.120663, -0.5956737, -1.422199, 1, 1, 1, 1, 1,
-1.117488, 0.1268321, -2.75831, 1, 1, 1, 1, 1,
-1.113303, 0.3284941, -0.451766, 1, 1, 1, 1, 1,
-1.112406, 0.1563496, -1.493482, 1, 1, 1, 1, 1,
-1.110599, -0.003194761, -2.213735, 1, 1, 1, 1, 1,
-1.108283, 0.4151411, -0.3685319, 1, 1, 1, 1, 1,
-1.106242, -1.138662, -2.998944, 1, 1, 1, 1, 1,
-1.103862, 0.4234016, -1.793445, 1, 1, 1, 1, 1,
-1.103141, 0.357752, 0.4901447, 1, 1, 1, 1, 1,
-1.097162, -0.3536506, -1.035504, 1, 1, 1, 1, 1,
-1.09642, -0.6640086, -3.014348, 1, 1, 1, 1, 1,
-1.092602, 0.01061112, -0.6187561, 1, 1, 1, 1, 1,
-1.087058, 0.2968453, -0.3859237, 0, 0, 1, 1, 1,
-1.084204, 1.490126, -2.820214, 1, 0, 0, 1, 1,
-1.083839, 0.9848839, -1.180136, 1, 0, 0, 1, 1,
-1.073926, -0.1051311, 0.6925421, 1, 0, 0, 1, 1,
-1.056885, -0.7720506, -0.9608396, 1, 0, 0, 1, 1,
-1.055907, -0.7278792, -1.163651, 1, 0, 0, 1, 1,
-1.05118, 1.054269, -1.169198, 0, 0, 0, 1, 1,
-1.048002, -0.2792876, -2.91941, 0, 0, 0, 1, 1,
-1.045543, 0.2787378, -2.41728, 0, 0, 0, 1, 1,
-1.042809, -1.128411, -1.404618, 0, 0, 0, 1, 1,
-1.041811, 1.243519, -1.429091, 0, 0, 0, 1, 1,
-1.035787, -1.087809, -2.781973, 0, 0, 0, 1, 1,
-1.032436, -1.80038, -1.715265, 0, 0, 0, 1, 1,
-1.020776, -0.2628734, -0.3245841, 1, 1, 1, 1, 1,
-1.000883, 1.444808, -0.1976224, 1, 1, 1, 1, 1,
-1.000783, -0.6495814, -2.079386, 1, 1, 1, 1, 1,
-0.9960813, 2.012558, -1.08804, 1, 1, 1, 1, 1,
-0.995956, -2.007306, -1.833243, 1, 1, 1, 1, 1,
-0.9902642, -0.3940221, -1.300406, 1, 1, 1, 1, 1,
-0.989989, 0.7497171, 1.182264, 1, 1, 1, 1, 1,
-0.9897401, 0.6463142, -0.2577549, 1, 1, 1, 1, 1,
-0.9881935, 0.4422639, -3.010719, 1, 1, 1, 1, 1,
-0.9861059, 0.5679522, -0.3103189, 1, 1, 1, 1, 1,
-0.9840073, 2.61115, -0.7184461, 1, 1, 1, 1, 1,
-0.9835268, 0.7973007, -0.5734155, 1, 1, 1, 1, 1,
-0.9810434, -0.7932919, -1.15163, 1, 1, 1, 1, 1,
-0.9806418, -2.752865, -3.565109, 1, 1, 1, 1, 1,
-0.9779258, 0.8389783, -1.328762, 1, 1, 1, 1, 1,
-0.9742699, 0.8158566, -1.329211, 0, 0, 1, 1, 1,
-0.9735394, -0.9489233, -0.8126603, 1, 0, 0, 1, 1,
-0.9698116, -0.7138218, -3.193951, 1, 0, 0, 1, 1,
-0.9681029, 0.956005, -1.119105, 1, 0, 0, 1, 1,
-0.9637039, 1.667926, -0.1743568, 1, 0, 0, 1, 1,
-0.9636357, -0.6012306, -3.035194, 1, 0, 0, 1, 1,
-0.9620164, -0.2759728, -2.623752, 0, 0, 0, 1, 1,
-0.9611536, 1.65993, -1.218718, 0, 0, 0, 1, 1,
-0.9601313, 0.006160872, -2.602524, 0, 0, 0, 1, 1,
-0.9535642, 1.023672, -1.024628, 0, 0, 0, 1, 1,
-0.9524098, -0.5711774, -2.332072, 0, 0, 0, 1, 1,
-0.9508514, -0.7880648, -2.3244, 0, 0, 0, 1, 1,
-0.9505468, 0.5940151, -1.459645, 0, 0, 0, 1, 1,
-0.9481368, -1.355684, -2.823505, 1, 1, 1, 1, 1,
-0.93949, 0.7897534, -0.8586759, 1, 1, 1, 1, 1,
-0.9317984, -1.320839, -1.53139, 1, 1, 1, 1, 1,
-0.9270782, -1.630452, -1.650078, 1, 1, 1, 1, 1,
-0.9264401, 0.8975786, 0.04966511, 1, 1, 1, 1, 1,
-0.9253902, 1.185147, -1.889473, 1, 1, 1, 1, 1,
-0.9232807, -0.518448, -1.050497, 1, 1, 1, 1, 1,
-0.9196639, -0.2738753, -0.1777336, 1, 1, 1, 1, 1,
-0.9075903, -1.590415, -3.350893, 1, 1, 1, 1, 1,
-0.9034277, -1.725936, -4.047822, 1, 1, 1, 1, 1,
-0.9020172, 0.8683963, 1.19194, 1, 1, 1, 1, 1,
-0.9004109, -0.7597868, -3.19615, 1, 1, 1, 1, 1,
-0.8967904, 1.481293, -2.147432, 1, 1, 1, 1, 1,
-0.8914301, -2.221596, -0.8929226, 1, 1, 1, 1, 1,
-0.8913133, -0.209516, -2.110846, 1, 1, 1, 1, 1,
-0.8894712, -0.4658676, -4.17066, 0, 0, 1, 1, 1,
-0.8888899, -1.34332, -4.620553, 1, 0, 0, 1, 1,
-0.8877547, -0.7730847, -1.156636, 1, 0, 0, 1, 1,
-0.8855355, -0.877818, -2.679871, 1, 0, 0, 1, 1,
-0.8817445, -1.25562, -3.348089, 1, 0, 0, 1, 1,
-0.8750959, -0.1803674, -1.281362, 1, 0, 0, 1, 1,
-0.8731211, 0.03304268, -1.730904, 0, 0, 0, 1, 1,
-0.8722071, 0.329265, -0.4767123, 0, 0, 0, 1, 1,
-0.8678187, -0.7515537, -3.273357, 0, 0, 0, 1, 1,
-0.8628047, -1.282318, -1.627295, 0, 0, 0, 1, 1,
-0.8583436, 1.889617, -1.656355, 0, 0, 0, 1, 1,
-0.8566729, -0.4320847, -1.779033, 0, 0, 0, 1, 1,
-0.8508965, 0.1208388, -1.069201, 0, 0, 0, 1, 1,
-0.850858, -1.50002, -2.731828, 1, 1, 1, 1, 1,
-0.8462431, -0.6907782, -2.641279, 1, 1, 1, 1, 1,
-0.8449115, 0.04530859, -1.534123, 1, 1, 1, 1, 1,
-0.8432344, -0.2013366, -2.19295, 1, 1, 1, 1, 1,
-0.8426524, -0.7356758, -2.258867, 1, 1, 1, 1, 1,
-0.8418122, 0.2398399, -1.089902, 1, 1, 1, 1, 1,
-0.8409703, 1.697472, 0.2299779, 1, 1, 1, 1, 1,
-0.8368886, 0.4693871, -0.769958, 1, 1, 1, 1, 1,
-0.8356234, 0.3437675, -1.674713, 1, 1, 1, 1, 1,
-0.8351001, 0.771644, -1.518799, 1, 1, 1, 1, 1,
-0.8307306, 0.0876128, -1.48029, 1, 1, 1, 1, 1,
-0.8305519, 0.06662014, -2.135681, 1, 1, 1, 1, 1,
-0.8300747, 0.06219994, -2.670266, 1, 1, 1, 1, 1,
-0.8266372, 1.131171, -0.8201569, 1, 1, 1, 1, 1,
-0.824944, -0.3907032, -1.419977, 1, 1, 1, 1, 1,
-0.8244127, 1.156538, -1.194447, 0, 0, 1, 1, 1,
-0.8235779, -0.7617456, -3.200599, 1, 0, 0, 1, 1,
-0.8226373, 1.968882, -1.630868, 1, 0, 0, 1, 1,
-0.8223175, 0.8014207, -1.209498, 1, 0, 0, 1, 1,
-0.8206885, 0.9951338, -1.294242, 1, 0, 0, 1, 1,
-0.818737, -0.7741324, -1.376318, 1, 0, 0, 1, 1,
-0.8172239, -1.988788, -3.31352, 0, 0, 0, 1, 1,
-0.8152382, -2.036564, -2.983265, 0, 0, 0, 1, 1,
-0.8144039, 0.9641796, -0.7248827, 0, 0, 0, 1, 1,
-0.8056806, -1.650663, -3.250835, 0, 0, 0, 1, 1,
-0.8022704, 0.862669, -0.2666354, 0, 0, 0, 1, 1,
-0.8003201, -0.3435398, -1.155283, 0, 0, 0, 1, 1,
-0.7965798, 0.09877332, -1.418763, 0, 0, 0, 1, 1,
-0.794898, 0.9067862, -1.625087, 1, 1, 1, 1, 1,
-0.7929512, -1.313077, -4.723372, 1, 1, 1, 1, 1,
-0.790921, -0.3951417, -3.524595, 1, 1, 1, 1, 1,
-0.7748557, 1.064756, -1.10982, 1, 1, 1, 1, 1,
-0.7742023, 1.112069, 0.6266662, 1, 1, 1, 1, 1,
-0.7726263, 1.287523, -0.7958955, 1, 1, 1, 1, 1,
-0.7700309, 1.110405, -0.3711567, 1, 1, 1, 1, 1,
-0.7689845, -1.028463, -1.996693, 1, 1, 1, 1, 1,
-0.7579741, 0.9923281, 0.1045624, 1, 1, 1, 1, 1,
-0.7576922, 2.128082, -0.7712469, 1, 1, 1, 1, 1,
-0.7553914, 0.606708, -1.429602, 1, 1, 1, 1, 1,
-0.751558, 1.02712, -0.4464105, 1, 1, 1, 1, 1,
-0.7500262, -1.383772, -1.535576, 1, 1, 1, 1, 1,
-0.7463163, 1.619364, 0.6117671, 1, 1, 1, 1, 1,
-0.745975, 0.04076722, -0.7706482, 1, 1, 1, 1, 1,
-0.7444256, 0.9506067, 0.1940924, 0, 0, 1, 1, 1,
-0.7434135, -0.790152, -3.563518, 1, 0, 0, 1, 1,
-0.7387562, -0.3542489, -2.114147, 1, 0, 0, 1, 1,
-0.7334676, -0.07742716, -1.232058, 1, 0, 0, 1, 1,
-0.7290371, -1.346128, -2.072088, 1, 0, 0, 1, 1,
-0.7273254, -0.4809457, -1.484906, 1, 0, 0, 1, 1,
-0.7229702, 0.02212626, -0.08076881, 0, 0, 0, 1, 1,
-0.7217956, -0.7823116, -1.752457, 0, 0, 0, 1, 1,
-0.7213375, 2.346023, 0.262539, 0, 0, 0, 1, 1,
-0.7179245, -0.8894442, -1.708646, 0, 0, 0, 1, 1,
-0.7133528, -0.7621453, -1.429371, 0, 0, 0, 1, 1,
-0.7064666, -0.7320536, -2.205265, 0, 0, 0, 1, 1,
-0.7046881, 0.7382253, 0.8103, 0, 0, 0, 1, 1,
-0.7001652, -0.3011889, -4.051202, 1, 1, 1, 1, 1,
-0.6962568, -0.4823641, -3.158169, 1, 1, 1, 1, 1,
-0.6933297, -0.2076852, -2.475747, 1, 1, 1, 1, 1,
-0.6933107, -1.434416, -2.617112, 1, 1, 1, 1, 1,
-0.6807206, -1.025569, -2.288492, 1, 1, 1, 1, 1,
-0.6801431, -0.7197697, -3.166609, 1, 1, 1, 1, 1,
-0.673889, 0.9212494, -1.080381, 1, 1, 1, 1, 1,
-0.6646581, 1.118631, -1.624634, 1, 1, 1, 1, 1,
-0.6638389, 0.08761682, -3.442176, 1, 1, 1, 1, 1,
-0.662329, -0.1081486, -2.573233, 1, 1, 1, 1, 1,
-0.65133, -0.01586142, -1.564385, 1, 1, 1, 1, 1,
-0.6492664, -0.6709482, -2.245659, 1, 1, 1, 1, 1,
-0.6485859, -1.359319, -2.248459, 1, 1, 1, 1, 1,
-0.6467537, 0.4823355, -1.242523, 1, 1, 1, 1, 1,
-0.6452804, -2.116414, -2.444532, 1, 1, 1, 1, 1,
-0.6425126, 0.1797208, -3.097155, 0, 0, 1, 1, 1,
-0.6420746, -2.24208, -2.838695, 1, 0, 0, 1, 1,
-0.6400789, 0.7441079, -0.5842566, 1, 0, 0, 1, 1,
-0.639494, 1.136532, 1.94481, 1, 0, 0, 1, 1,
-0.6356759, 0.1640944, -2.868815, 1, 0, 0, 1, 1,
-0.6354595, 1.074239, -1.292695, 1, 0, 0, 1, 1,
-0.6341252, 1.156557, -0.6503313, 0, 0, 0, 1, 1,
-0.6285754, 1.202752, -0.5931418, 0, 0, 0, 1, 1,
-0.6278891, 1.157848, -1.286413, 0, 0, 0, 1, 1,
-0.6230022, 0.764462, -1.231518, 0, 0, 0, 1, 1,
-0.6195794, 0.4666632, -1.778268, 0, 0, 0, 1, 1,
-0.6168385, -0.4905092, -2.503367, 0, 0, 0, 1, 1,
-0.6137201, -1.603621, -2.882655, 0, 0, 0, 1, 1,
-0.6131214, 0.8770654, 0.1647396, 1, 1, 1, 1, 1,
-0.6115582, -0.2994561, -2.439604, 1, 1, 1, 1, 1,
-0.5973683, -1.859044, -3.451195, 1, 1, 1, 1, 1,
-0.5972462, -0.6631976, -1.331512, 1, 1, 1, 1, 1,
-0.5962397, 1.020006, -0.1332637, 1, 1, 1, 1, 1,
-0.5960737, -1.178653, -2.541998, 1, 1, 1, 1, 1,
-0.5956065, 0.8974351, 0.2317616, 1, 1, 1, 1, 1,
-0.591609, 1.414241, -0.1253638, 1, 1, 1, 1, 1,
-0.5856975, 0.5241412, -0.02489271, 1, 1, 1, 1, 1,
-0.5855058, 0.02442944, -1.777941, 1, 1, 1, 1, 1,
-0.5840191, -0.1811389, -1.088302, 1, 1, 1, 1, 1,
-0.5839908, -1.134684, -3.83548, 1, 1, 1, 1, 1,
-0.5815212, -0.5975543, -3.125492, 1, 1, 1, 1, 1,
-0.5746089, 0.4979815, -0.2404422, 1, 1, 1, 1, 1,
-0.5740138, 0.2470785, -0.5616748, 1, 1, 1, 1, 1,
-0.5725602, 1.062076, -1.522424, 0, 0, 1, 1, 1,
-0.5723019, 0.9938064, -0.5242226, 1, 0, 0, 1, 1,
-0.5695459, -0.8100184, -2.185113, 1, 0, 0, 1, 1,
-0.5661346, -0.4000563, -1.449269, 1, 0, 0, 1, 1,
-0.5647697, -0.00319667, -1.21267, 1, 0, 0, 1, 1,
-0.5620297, -2.098473, -2.046325, 1, 0, 0, 1, 1,
-0.5612738, -0.1729769, -2.712134, 0, 0, 0, 1, 1,
-0.5609244, -0.4269074, -1.866402, 0, 0, 0, 1, 1,
-0.5600112, -0.4526603, -1.94754, 0, 0, 0, 1, 1,
-0.5595649, 0.7270609, 0.08275884, 0, 0, 0, 1, 1,
-0.5588125, 0.2563128, -1.523948, 0, 0, 0, 1, 1,
-0.5501637, -0.9554375, -2.016146, 0, 0, 0, 1, 1,
-0.5498009, 1.129466, 0.08552473, 0, 0, 0, 1, 1,
-0.5426612, -1.092424, -1.525332, 1, 1, 1, 1, 1,
-0.54234, 1.144165, -0.6960046, 1, 1, 1, 1, 1,
-0.5410398, 0.2004136, -1.311756, 1, 1, 1, 1, 1,
-0.5404304, -0.2374722, -2.589085, 1, 1, 1, 1, 1,
-0.5399874, -2.290983, -3.342438, 1, 1, 1, 1, 1,
-0.5363408, 2.183621, -1.402204, 1, 1, 1, 1, 1,
-0.5345116, -0.1540683, -1.731943, 1, 1, 1, 1, 1,
-0.532284, -0.5883638, -2.5705, 1, 1, 1, 1, 1,
-0.5318378, -0.6917068, -0.3060704, 1, 1, 1, 1, 1,
-0.5266203, 0.6222529, -1.360732, 1, 1, 1, 1, 1,
-0.5250139, -0.5112965, -3.888423, 1, 1, 1, 1, 1,
-0.521682, 0.3365312, -2.158553, 1, 1, 1, 1, 1,
-0.5189825, -0.7569031, -3.21148, 1, 1, 1, 1, 1,
-0.518843, -0.6508143, -2.283819, 1, 1, 1, 1, 1,
-0.5174926, 0.4899068, 0.2176375, 1, 1, 1, 1, 1,
-0.5107984, 0.3712623, -0.7108768, 0, 0, 1, 1, 1,
-0.5085778, -0.1455422, -2.86777, 1, 0, 0, 1, 1,
-0.5063564, -1.569125, -3.360628, 1, 0, 0, 1, 1,
-0.5053583, 0.3458081, -1.797113, 1, 0, 0, 1, 1,
-0.5034083, -0.5421557, -4.287126, 1, 0, 0, 1, 1,
-0.5033287, -0.3153624, -2.691895, 1, 0, 0, 1, 1,
-0.5027834, 1.681882, -0.7244937, 0, 0, 0, 1, 1,
-0.5023708, -1.185515, -3.963439, 0, 0, 0, 1, 1,
-0.5011821, -1.100868, -3.806434, 0, 0, 0, 1, 1,
-0.5009256, -0.5664156, -1.080378, 0, 0, 0, 1, 1,
-0.490336, -0.001370112, -3.596818, 0, 0, 0, 1, 1,
-0.4839455, -0.07049208, -0.9998149, 0, 0, 0, 1, 1,
-0.4797058, 2.15609, -0.2061419, 0, 0, 0, 1, 1,
-0.4788265, 0.6731668, 0.3787198, 1, 1, 1, 1, 1,
-0.4780211, -0.1592762, -1.401369, 1, 1, 1, 1, 1,
-0.4762085, -1.246663, -3.239584, 1, 1, 1, 1, 1,
-0.4730792, -0.5737312, -2.056867, 1, 1, 1, 1, 1,
-0.473002, 0.4973372, 0.1742688, 1, 1, 1, 1, 1,
-0.4723438, 0.9886127, 0.7854928, 1, 1, 1, 1, 1,
-0.471345, -1.456001, -2.765308, 1, 1, 1, 1, 1,
-0.4705714, -1.314935, -3.159302, 1, 1, 1, 1, 1,
-0.4702653, 0.6484063, -1.090717, 1, 1, 1, 1, 1,
-0.4701782, 1.550963, -1.51918, 1, 1, 1, 1, 1,
-0.4671425, 0.1106687, -1.808149, 1, 1, 1, 1, 1,
-0.4650669, -1.335642, -3.871152, 1, 1, 1, 1, 1,
-0.4634817, -1.436048, -5.127898, 1, 1, 1, 1, 1,
-0.4593593, -0.8184452, -2.393009, 1, 1, 1, 1, 1,
-0.4590308, 1.145856, -2.49067, 1, 1, 1, 1, 1,
-0.4584637, 0.6174944, -1.378167, 0, 0, 1, 1, 1,
-0.4583453, 0.9407859, -0.9530911, 1, 0, 0, 1, 1,
-0.4579095, 0.03301578, -1.307491, 1, 0, 0, 1, 1,
-0.4479819, 0.2670755, -1.586584, 1, 0, 0, 1, 1,
-0.4472559, 0.08670083, 0.9640746, 1, 0, 0, 1, 1,
-0.4424417, -1.474558, -4.242815, 1, 0, 0, 1, 1,
-0.441464, 0.9705747, -0.8062418, 0, 0, 0, 1, 1,
-0.4351728, -1.190837, -4.616655, 0, 0, 0, 1, 1,
-0.4324051, -0.03285437, -1.431775, 0, 0, 0, 1, 1,
-0.4318213, -2.890287, -1.431235, 0, 0, 0, 1, 1,
-0.4314278, 0.5845181, -0.4884489, 0, 0, 0, 1, 1,
-0.4297661, 0.92129, 0.182394, 0, 0, 0, 1, 1,
-0.4274532, 1.04561, -0.01501225, 0, 0, 0, 1, 1,
-0.4255677, 0.4270869, -1.726572, 1, 1, 1, 1, 1,
-0.4245976, 0.4018121, -0.8831463, 1, 1, 1, 1, 1,
-0.4230133, 0.9322731, -2.052422, 1, 1, 1, 1, 1,
-0.4212005, 1.49172, -0.3103181, 1, 1, 1, 1, 1,
-0.4187538, -0.7141098, -3.933529, 1, 1, 1, 1, 1,
-0.4176786, 1.521542, 0.4739792, 1, 1, 1, 1, 1,
-0.4173038, -0.1299726, -1.216837, 1, 1, 1, 1, 1,
-0.4171407, -0.5808572, -2.466563, 1, 1, 1, 1, 1,
-0.4142842, 1.018752, -0.7749451, 1, 1, 1, 1, 1,
-0.4128341, -1.967706, -3.675087, 1, 1, 1, 1, 1,
-0.4095997, 0.03117533, -1.581096, 1, 1, 1, 1, 1,
-0.4069485, -0.6186185, -3.156255, 1, 1, 1, 1, 1,
-0.4028082, -0.03227287, -1.079253, 1, 1, 1, 1, 1,
-0.4026088, -1.42818, -3.379421, 1, 1, 1, 1, 1,
-0.3992498, 0.8422142, -0.1230055, 1, 1, 1, 1, 1,
-0.3990463, -0.1480432, -0.9395714, 0, 0, 1, 1, 1,
-0.3932611, 0.2333372, -1.92792, 1, 0, 0, 1, 1,
-0.3899646, 0.9823466, -0.08242709, 1, 0, 0, 1, 1,
-0.3892655, 0.7283105, -0.1495179, 1, 0, 0, 1, 1,
-0.385646, -0.1034927, 0.04621483, 1, 0, 0, 1, 1,
-0.3850764, -0.7966545, -3.249037, 1, 0, 0, 1, 1,
-0.3841841, 0.0016817, 0.1441714, 0, 0, 0, 1, 1,
-0.383202, -2.434953, -1.302476, 0, 0, 0, 1, 1,
-0.3806283, -1.792047, -2.719588, 0, 0, 0, 1, 1,
-0.3735009, -0.8990456, -1.538594, 0, 0, 0, 1, 1,
-0.3729736, -0.05953684, -5.002941, 0, 0, 0, 1, 1,
-0.3721071, -0.001972033, -2.156276, 0, 0, 0, 1, 1,
-0.3712961, 0.3160315, 1.272239, 0, 0, 0, 1, 1,
-0.3697431, 0.5074295, -0.5012862, 1, 1, 1, 1, 1,
-0.3678387, 1.052494, 0.2825931, 1, 1, 1, 1, 1,
-0.3670155, -0.7033823, -4.470209, 1, 1, 1, 1, 1,
-0.3630708, -0.8199686, -1.408078, 1, 1, 1, 1, 1,
-0.3630404, 0.0542565, -0.351737, 1, 1, 1, 1, 1,
-0.3620948, -1.099826, -3.598253, 1, 1, 1, 1, 1,
-0.3569738, -1.032944, -2.03155, 1, 1, 1, 1, 1,
-0.3549705, -0.5279763, -3.255777, 1, 1, 1, 1, 1,
-0.3546317, 0.2516974, -0.09083591, 1, 1, 1, 1, 1,
-0.3529935, 1.218051, 0.2111626, 1, 1, 1, 1, 1,
-0.3526916, 1.16625, 0.2596907, 1, 1, 1, 1, 1,
-0.3372326, -0.3873937, -2.268889, 1, 1, 1, 1, 1,
-0.3285162, 0.09498475, -1.547017, 1, 1, 1, 1, 1,
-0.3221734, 0.7814887, -0.8908456, 1, 1, 1, 1, 1,
-0.3178383, 0.6940902, 0.03970622, 1, 1, 1, 1, 1,
-0.3138579, -0.1584454, -1.155567, 0, 0, 1, 1, 1,
-0.3136836, 1.472506, -0.1856094, 1, 0, 0, 1, 1,
-0.3134174, 0.1494168, -0.4196733, 1, 0, 0, 1, 1,
-0.3070607, -0.2251528, -0.790039, 1, 0, 0, 1, 1,
-0.3045198, 1.053079, 0.1298835, 1, 0, 0, 1, 1,
-0.3034952, 1.591867, -1.760311, 1, 0, 0, 1, 1,
-0.30344, -0.2986298, -2.398676, 0, 0, 0, 1, 1,
-0.3030075, -0.7405515, -2.078679, 0, 0, 0, 1, 1,
-0.3024563, -1.028171, -2.082107, 0, 0, 0, 1, 1,
-0.3009795, 0.5369677, -0.7623284, 0, 0, 0, 1, 1,
-0.2992938, 0.5446331, -0.1603188, 0, 0, 0, 1, 1,
-0.2954926, 2.261795, 0.7333114, 0, 0, 0, 1, 1,
-0.2935999, 0.6958407, 0.9160141, 0, 0, 0, 1, 1,
-0.293258, -0.1362548, -2.696097, 1, 1, 1, 1, 1,
-0.2921254, 0.2676653, -0.9231514, 1, 1, 1, 1, 1,
-0.2864635, 0.5406739, -0.156148, 1, 1, 1, 1, 1,
-0.2854082, 1.016212, -0.4172224, 1, 1, 1, 1, 1,
-0.2812265, 0.3656999, 0.1838002, 1, 1, 1, 1, 1,
-0.2809841, 0.018408, -1.563623, 1, 1, 1, 1, 1,
-0.2779222, 2.13774, 1.033682, 1, 1, 1, 1, 1,
-0.2769349, 0.5775581, -2.039503, 1, 1, 1, 1, 1,
-0.2766548, -1.42024, -3.671246, 1, 1, 1, 1, 1,
-0.2750876, 1.64341, 0.3677473, 1, 1, 1, 1, 1,
-0.2626472, 0.05980498, -1.387193, 1, 1, 1, 1, 1,
-0.2613295, 1.248059, -0.6794292, 1, 1, 1, 1, 1,
-0.2613242, -0.7450272, -1.949952, 1, 1, 1, 1, 1,
-0.2597719, -1.657491, -2.706195, 1, 1, 1, 1, 1,
-0.2468288, 0.3703115, -0.854167, 1, 1, 1, 1, 1,
-0.2446274, -0.4376477, -3.790635, 0, 0, 1, 1, 1,
-0.2391083, 1.430775, -2.425328, 1, 0, 0, 1, 1,
-0.2360431, 0.3863311, -0.3947782, 1, 0, 0, 1, 1,
-0.2352811, -1.868863, -4.656014, 1, 0, 0, 1, 1,
-0.2322612, 1.092909, -3.156337, 1, 0, 0, 1, 1,
-0.2293975, -0.5172964, -1.438156, 1, 0, 0, 1, 1,
-0.2228215, -1.157383, -2.426574, 0, 0, 0, 1, 1,
-0.2222654, 0.6013259, 0.8578715, 0, 0, 0, 1, 1,
-0.2189572, 0.2932049, -1.583342, 0, 0, 0, 1, 1,
-0.2184595, 0.8144365, 1.174362, 0, 0, 0, 1, 1,
-0.2085809, 0.8017492, -0.4244338, 0, 0, 0, 1, 1,
-0.2070091, 0.6646317, -1.586861, 0, 0, 0, 1, 1,
-0.2059087, 0.8890066, -1.107969, 0, 0, 0, 1, 1,
-0.1983628, 2.980186, -0.3134326, 1, 1, 1, 1, 1,
-0.1916677, 0.2049992, -1.144431, 1, 1, 1, 1, 1,
-0.1912355, 1.314209, -0.13829, 1, 1, 1, 1, 1,
-0.1860358, -0.1495407, -3.235784, 1, 1, 1, 1, 1,
-0.1755351, 0.006694201, -2.019033, 1, 1, 1, 1, 1,
-0.1733962, 0.4399557, -0.2442483, 1, 1, 1, 1, 1,
-0.1725892, 0.05599198, -0.971679, 1, 1, 1, 1, 1,
-0.1706057, -1.208542, -2.568292, 1, 1, 1, 1, 1,
-0.1642432, 0.134892, -0.9718583, 1, 1, 1, 1, 1,
-0.1628402, 0.09268332, 0.07807717, 1, 1, 1, 1, 1,
-0.1617768, 0.7560732, -1.386038, 1, 1, 1, 1, 1,
-0.1617432, 0.2340137, 0.1298999, 1, 1, 1, 1, 1,
-0.1591181, 0.2246806, -1.037942, 1, 1, 1, 1, 1,
-0.1558119, 1.627139, -0.5559723, 1, 1, 1, 1, 1,
-0.1542888, 0.4171776, -0.8630101, 1, 1, 1, 1, 1,
-0.1527486, 0.08930299, -3.543056, 0, 0, 1, 1, 1,
-0.1479042, -0.3360219, -2.529602, 1, 0, 0, 1, 1,
-0.1455634, -0.6731619, -3.571954, 1, 0, 0, 1, 1,
-0.1433476, -2.575217, -1.008156, 1, 0, 0, 1, 1,
-0.1430468, 1.620337, -0.4676148, 1, 0, 0, 1, 1,
-0.1429791, -0.137923, -2.946289, 1, 0, 0, 1, 1,
-0.1394164, 0.715589, -0.5644703, 0, 0, 0, 1, 1,
-0.139366, 1.170275, 1.36146, 0, 0, 0, 1, 1,
-0.139101, 0.621082, -0.1374437, 0, 0, 0, 1, 1,
-0.1376477, 0.6473449, -1.560306, 0, 0, 0, 1, 1,
-0.1344188, -1.06571, -2.797855, 0, 0, 0, 1, 1,
-0.1263544, -1.51265, -2.086446, 0, 0, 0, 1, 1,
-0.1236151, -0.4453458, -2.502281, 0, 0, 0, 1, 1,
-0.1152419, 0.8748187, -0.02328845, 1, 1, 1, 1, 1,
-0.1131333, 0.8623233, -0.7081628, 1, 1, 1, 1, 1,
-0.111355, 0.5481519, 1.159984, 1, 1, 1, 1, 1,
-0.1086024, -0.2153521, -1.749256, 1, 1, 1, 1, 1,
-0.1081211, 1.184781, 1.883547, 1, 1, 1, 1, 1,
-0.1079122, -3.72433, -3.908413, 1, 1, 1, 1, 1,
-0.104092, 0.7211737, -0.8927405, 1, 1, 1, 1, 1,
-0.1003037, -0.4393919, -1.574611, 1, 1, 1, 1, 1,
-0.09942529, 0.8960062, -0.1379749, 1, 1, 1, 1, 1,
-0.09920414, -0.3671336, -2.094273, 1, 1, 1, 1, 1,
-0.09853658, -0.7926999, -3.471732, 1, 1, 1, 1, 1,
-0.09846159, 1.228918, 0.4275422, 1, 1, 1, 1, 1,
-0.0959876, -0.7136068, -5.548384, 1, 1, 1, 1, 1,
-0.09566318, -0.6430579, -2.203884, 1, 1, 1, 1, 1,
-0.09186656, 0.003388037, -1.847944, 1, 1, 1, 1, 1,
-0.09122633, 1.162096, -0.2473552, 0, 0, 1, 1, 1,
-0.08813068, -1.233094, -5.248445, 1, 0, 0, 1, 1,
-0.08673481, 0.5555217, 0.5440307, 1, 0, 0, 1, 1,
-0.0827456, 1.141544, 1.423063, 1, 0, 0, 1, 1,
-0.08188013, -1.698205, -4.185835, 1, 0, 0, 1, 1,
-0.08167315, -0.4393197, -2.221518, 1, 0, 0, 1, 1,
-0.07868646, 1.993278, -0.4846625, 0, 0, 0, 1, 1,
-0.07738411, 0.7383875, -0.6070164, 0, 0, 0, 1, 1,
-0.06398503, 1.063103, -1.271952, 0, 0, 0, 1, 1,
-0.06342736, -0.1595462, -3.615162, 0, 0, 0, 1, 1,
-0.06123164, 2.437854, 0.4711288, 0, 0, 0, 1, 1,
-0.05859899, 0.4894392, 0.9259272, 0, 0, 0, 1, 1,
-0.05273059, -0.4760456, -4.731432, 0, 0, 0, 1, 1,
-0.05242146, -0.7540507, -2.935262, 1, 1, 1, 1, 1,
-0.04851194, -0.02287732, -3.690617, 1, 1, 1, 1, 1,
-0.0471494, 0.9830554, -1.386713, 1, 1, 1, 1, 1,
-0.04426147, 0.06231205, -2.249764, 1, 1, 1, 1, 1,
-0.04296003, 1.38007, 0.234425, 1, 1, 1, 1, 1,
-0.03899099, 0.5996029, -0.4698489, 1, 1, 1, 1, 1,
-0.03535309, -1.609469, -2.509003, 1, 1, 1, 1, 1,
-0.03388674, -0.7366726, -2.854391, 1, 1, 1, 1, 1,
-0.03078484, 0.2787139, 0.4183677, 1, 1, 1, 1, 1,
-0.03006438, -0.6856423, -4.554984, 1, 1, 1, 1, 1,
-0.02756737, 0.6098602, -1.645808, 1, 1, 1, 1, 1,
-0.02740912, -0.720259, -2.637151, 1, 1, 1, 1, 1,
-0.02516311, 0.3641852, -1.705128, 1, 1, 1, 1, 1,
-0.02456378, -0.04298028, -1.96424, 1, 1, 1, 1, 1,
-0.02211589, 0.455767, -0.1263972, 1, 1, 1, 1, 1,
-0.01592586, -0.7105054, -4.402365, 0, 0, 1, 1, 1,
-0.00861145, -0.3411368, -2.799355, 1, 0, 0, 1, 1,
-0.004972083, 0.2565119, -0.5022702, 1, 0, 0, 1, 1,
-0.004039424, -0.09894896, -1.928104, 1, 0, 0, 1, 1,
-0.002500916, -0.3241411, -3.352795, 1, 0, 0, 1, 1,
0.007355105, -0.4000627, 3.736734, 1, 0, 0, 1, 1,
0.008007736, -1.514379, 2.058119, 0, 0, 0, 1, 1,
0.008865965, -0.2021632, 2.125463, 0, 0, 0, 1, 1,
0.01280225, -0.4771624, 1.521727, 0, 0, 0, 1, 1,
0.01511832, 0.1797377, 0.8258067, 0, 0, 0, 1, 1,
0.01595326, -0.7585996, 4.013103, 0, 0, 0, 1, 1,
0.02043577, 2.302712, 2.305149, 0, 0, 0, 1, 1,
0.02211107, -0.1070367, 3.365624, 0, 0, 0, 1, 1,
0.02370291, -0.1258876, 3.690758, 1, 1, 1, 1, 1,
0.02467384, 0.1899093, -0.3255843, 1, 1, 1, 1, 1,
0.02549954, -1.141992, 3.249465, 1, 1, 1, 1, 1,
0.02559552, 0.8902293, 0.2690734, 1, 1, 1, 1, 1,
0.02828623, -1.170839, 0.9160917, 1, 1, 1, 1, 1,
0.02934767, 0.5525296, -1.529741, 1, 1, 1, 1, 1,
0.03446766, 0.6200687, 0.1543408, 1, 1, 1, 1, 1,
0.04120117, 0.8007375, -0.7972075, 1, 1, 1, 1, 1,
0.04165484, -0.04383559, 2.512971, 1, 1, 1, 1, 1,
0.04316311, 0.7377194, -0.1996385, 1, 1, 1, 1, 1,
0.04778096, 0.5506043, -0.1653953, 1, 1, 1, 1, 1,
0.04960139, -1.325669, 2.22946, 1, 1, 1, 1, 1,
0.055821, 0.3162718, 0.5146629, 1, 1, 1, 1, 1,
0.06069653, 1.222249, -0.876442, 1, 1, 1, 1, 1,
0.06183201, 0.2658147, 0.1908065, 1, 1, 1, 1, 1,
0.06251749, -1.691627, 3.488946, 0, 0, 1, 1, 1,
0.06724096, 0.4768671, 1.686279, 1, 0, 0, 1, 1,
0.0684761, -1.426154, 3.403287, 1, 0, 0, 1, 1,
0.07161088, -0.2890079, 3.71767, 1, 0, 0, 1, 1,
0.07388523, 0.8677714, -0.5384024, 1, 0, 0, 1, 1,
0.07608391, -1.336678, 4.582595, 1, 0, 0, 1, 1,
0.07619794, -1.266357, 3.481212, 0, 0, 0, 1, 1,
0.07961733, -0.0174681, 2.39964, 0, 0, 0, 1, 1,
0.08030008, -1.135041, 3.112274, 0, 0, 0, 1, 1,
0.08346428, 0.9701048, -0.06533282, 0, 0, 0, 1, 1,
0.08510052, 1.070828, 0.3957163, 0, 0, 0, 1, 1,
0.08653089, 0.5867209, 0.320121, 0, 0, 0, 1, 1,
0.08986981, -1.209726, 2.440152, 0, 0, 0, 1, 1,
0.0959636, 1.030287, -1.143305, 1, 1, 1, 1, 1,
0.09638351, -2.09387, 2.685535, 1, 1, 1, 1, 1,
0.09817979, -0.4179281, 1.675278, 1, 1, 1, 1, 1,
0.1046578, -0.7266351, 2.411955, 1, 1, 1, 1, 1,
0.104957, 0.1467225, -0.3559208, 1, 1, 1, 1, 1,
0.1064174, -2.13059, 2.626092, 1, 1, 1, 1, 1,
0.1151703, -0.5609104, 2.501024, 1, 1, 1, 1, 1,
0.1166687, 0.6672273, 0.442725, 1, 1, 1, 1, 1,
0.1218705, 1.36411, 0.2485174, 1, 1, 1, 1, 1,
0.1263394, -0.4732535, 3.037831, 1, 1, 1, 1, 1,
0.1266129, -0.4667166, 1.834806, 1, 1, 1, 1, 1,
0.1275492, -0.2177103, 2.070374, 1, 1, 1, 1, 1,
0.1327902, 0.816328, -1.373273, 1, 1, 1, 1, 1,
0.1352399, 0.3814887, 0.4080062, 1, 1, 1, 1, 1,
0.1354599, 0.9365952, -0.4267201, 1, 1, 1, 1, 1,
0.1361682, -1.188175, 2.946166, 0, 0, 1, 1, 1,
0.1395941, -1.433981, 1.153491, 1, 0, 0, 1, 1,
0.1513774, 0.4342785, -0.06455217, 1, 0, 0, 1, 1,
0.1517637, -0.5702611, 2.979589, 1, 0, 0, 1, 1,
0.1556352, 0.4357759, 1.316016, 1, 0, 0, 1, 1,
0.1561272, 2.373796, -0.3641105, 1, 0, 0, 1, 1,
0.1602064, -0.9224142, 4.84206, 0, 0, 0, 1, 1,
0.1605573, -0.5296872, 3.392122, 0, 0, 0, 1, 1,
0.1609119, -0.9159757, 4.484331, 0, 0, 0, 1, 1,
0.1618417, 0.6283053, 0.5676681, 0, 0, 0, 1, 1,
0.1642858, -2.981364, 1.782538, 0, 0, 0, 1, 1,
0.1681784, -0.04833734, 1.332824, 0, 0, 0, 1, 1,
0.1690267, 0.0682231, 2.681193, 0, 0, 0, 1, 1,
0.1692426, 0.557341, 0.9322223, 1, 1, 1, 1, 1,
0.1698551, -0.1694194, 3.764627, 1, 1, 1, 1, 1,
0.1726576, 0.340142, 0.5325953, 1, 1, 1, 1, 1,
0.1735872, 0.2207508, 0.5784011, 1, 1, 1, 1, 1,
0.1821336, 0.8487754, 0.3506071, 1, 1, 1, 1, 1,
0.1843763, 0.2501414, 1.689431, 1, 1, 1, 1, 1,
0.1858045, 0.7729496, 2.274924, 1, 1, 1, 1, 1,
0.1922685, 0.7088165, 1.056117, 1, 1, 1, 1, 1,
0.194181, -0.006946876, 3.159754, 1, 1, 1, 1, 1,
0.1948776, -1.599261, 5.415395, 1, 1, 1, 1, 1,
0.2107128, -0.5648096, 2.578106, 1, 1, 1, 1, 1,
0.2121674, -0.6778838, 3.037632, 1, 1, 1, 1, 1,
0.2129473, 0.9515539, -0.9645592, 1, 1, 1, 1, 1,
0.2169148, 0.01275919, 1.495682, 1, 1, 1, 1, 1,
0.2198272, -0.3818741, 2.506388, 1, 1, 1, 1, 1,
0.2201884, 1.142007, -0.03496391, 0, 0, 1, 1, 1,
0.2240831, 0.2359615, 0.6624601, 1, 0, 0, 1, 1,
0.2274369, -0.9099638, 3.497667, 1, 0, 0, 1, 1,
0.2279598, 0.272328, -0.5763975, 1, 0, 0, 1, 1,
0.2327378, -0.1070663, 2.17476, 1, 0, 0, 1, 1,
0.2337804, 0.8152066, -0.3039428, 1, 0, 0, 1, 1,
0.2348896, -0.7201115, 3.638919, 0, 0, 0, 1, 1,
0.2380722, -2.890377, 3.324816, 0, 0, 0, 1, 1,
0.238633, 1.422704, 2.878816, 0, 0, 0, 1, 1,
0.2408447, -0.6975852, 2.261836, 0, 0, 0, 1, 1,
0.2531884, -0.2505523, 2.429201, 0, 0, 0, 1, 1,
0.2630947, 0.4023479, 1.307645, 0, 0, 0, 1, 1,
0.2668936, -1.595608, 2.599346, 0, 0, 0, 1, 1,
0.2673533, 0.3512919, 1.210708, 1, 1, 1, 1, 1,
0.2687674, -0.1564001, 1.674502, 1, 1, 1, 1, 1,
0.2693877, -0.06572243, 2.568165, 1, 1, 1, 1, 1,
0.2701536, 0.1855549, 0.08035253, 1, 1, 1, 1, 1,
0.2766354, 0.2251019, 0.5807452, 1, 1, 1, 1, 1,
0.2780511, 1.524274, -1.148154, 1, 1, 1, 1, 1,
0.2827466, -0.9161682, 2.333479, 1, 1, 1, 1, 1,
0.2855857, -0.1571447, 2.424893, 1, 1, 1, 1, 1,
0.2880481, -0.2154829, 2.754605, 1, 1, 1, 1, 1,
0.2910702, -0.3958025, 2.510132, 1, 1, 1, 1, 1,
0.292139, -0.5380771, 2.409607, 1, 1, 1, 1, 1,
0.2924068, 0.5402894, 0.9450618, 1, 1, 1, 1, 1,
0.3044565, -1.01411, 0.7310366, 1, 1, 1, 1, 1,
0.3053021, -0.176057, 2.34716, 1, 1, 1, 1, 1,
0.3094893, 1.165651, 0.8777378, 1, 1, 1, 1, 1,
0.3107135, 0.3094648, 2.392516, 0, 0, 1, 1, 1,
0.3109292, 0.9778715, 0.3588201, 1, 0, 0, 1, 1,
0.3141996, 0.7085831, -1.911707, 1, 0, 0, 1, 1,
0.3184427, -0.2768254, 2.759388, 1, 0, 0, 1, 1,
0.3186808, 0.6185438, 0.6090221, 1, 0, 0, 1, 1,
0.3192276, 0.2511335, 0.238507, 1, 0, 0, 1, 1,
0.3213364, 0.3068358, 0.9322455, 0, 0, 0, 1, 1,
0.3247892, 0.151602, 0.2062728, 0, 0, 0, 1, 1,
0.3248667, 0.964527, 1.780048, 0, 0, 0, 1, 1,
0.3290696, 1.858391, 0.7225019, 0, 0, 0, 1, 1,
0.3335746, 1.714368, -0.2083316, 0, 0, 0, 1, 1,
0.3336937, -1.362, 4.209055, 0, 0, 0, 1, 1,
0.3379849, 0.06701894, 1.785403, 0, 0, 0, 1, 1,
0.339386, 0.2895389, 0.9801095, 1, 1, 1, 1, 1,
0.344849, 0.7774459, 0.439431, 1, 1, 1, 1, 1,
0.3451308, 1.596197, 1.363811, 1, 1, 1, 1, 1,
0.3500478, 0.340926, -0.1594941, 1, 1, 1, 1, 1,
0.3546164, 0.4027499, 0.8597254, 1, 1, 1, 1, 1,
0.3553991, 1.137836, -0.5253288, 1, 1, 1, 1, 1,
0.3638815, 0.7752569, -0.9150723, 1, 1, 1, 1, 1,
0.364488, 0.5532693, 1.12171, 1, 1, 1, 1, 1,
0.3706317, -1.066432, 2.798344, 1, 1, 1, 1, 1,
0.3736011, -2.543884, 2.971716, 1, 1, 1, 1, 1,
0.3740856, 1.197016, -0.5888343, 1, 1, 1, 1, 1,
0.3744552, -0.2291803, 2.569773, 1, 1, 1, 1, 1,
0.3760518, -1.437263, 3.604598, 1, 1, 1, 1, 1,
0.3770884, 0.5819672, 1.279562, 1, 1, 1, 1, 1,
0.3784647, -0.03942633, 2.414988, 1, 1, 1, 1, 1,
0.3815743, 0.675459, -0.0416856, 0, 0, 1, 1, 1,
0.3894423, -0.7730579, 1.236474, 1, 0, 0, 1, 1,
0.3917449, -2.022937, 3.88619, 1, 0, 0, 1, 1,
0.3949293, -0.2199993, 0.690859, 1, 0, 0, 1, 1,
0.4019251, -1.149985, 2.586032, 1, 0, 0, 1, 1,
0.4043351, -0.9936032, 3.997521, 1, 0, 0, 1, 1,
0.4115092, -0.448297, 1.325292, 0, 0, 0, 1, 1,
0.4125321, 1.264158, 0.6433378, 0, 0, 0, 1, 1,
0.4171075, 1.141233, 0.6210575, 0, 0, 0, 1, 1,
0.4184645, -1.487873, 2.078025, 0, 0, 0, 1, 1,
0.418854, 0.02874013, 0.672612, 0, 0, 0, 1, 1,
0.4200254, -0.07598791, 1.174835, 0, 0, 0, 1, 1,
0.4201957, 1.312164, -0.8658665, 0, 0, 0, 1, 1,
0.4206632, -0.8226987, 2.282392, 1, 1, 1, 1, 1,
0.4240834, 0.8838162, 1.375658, 1, 1, 1, 1, 1,
0.4268411, -0.4455351, 1.811982, 1, 1, 1, 1, 1,
0.4311943, 0.3340091, 1.401188, 1, 1, 1, 1, 1,
0.4324689, 0.02645947, 1.641538, 1, 1, 1, 1, 1,
0.4326297, 1.049098, -0.5797036, 1, 1, 1, 1, 1,
0.4375184, -0.7200437, 2.585397, 1, 1, 1, 1, 1,
0.4390658, 0.7216638, -0.1745985, 1, 1, 1, 1, 1,
0.442739, 0.1218681, 2.245353, 1, 1, 1, 1, 1,
0.4584516, -0.715809, 2.65941, 1, 1, 1, 1, 1,
0.4588144, -0.5832521, 1.128343, 1, 1, 1, 1, 1,
0.4667557, -0.5374295, 2.080539, 1, 1, 1, 1, 1,
0.4683897, 0.5420766, 1.637642, 1, 1, 1, 1, 1,
0.4684612, 1.129743, -0.3918072, 1, 1, 1, 1, 1,
0.4708113, -0.2633141, 2.264769, 1, 1, 1, 1, 1,
0.4758671, 1.132423, 0.03758743, 0, 0, 1, 1, 1,
0.477328, -1.140076, 2.330442, 1, 0, 0, 1, 1,
0.4784636, -0.1401669, 0.9350569, 1, 0, 0, 1, 1,
0.4812022, 0.2979794, 0.8052099, 1, 0, 0, 1, 1,
0.4815102, 1.410731, -1.903539, 1, 0, 0, 1, 1,
0.4825744, -0.3554571, 3.879423, 1, 0, 0, 1, 1,
0.4910919, 0.3626552, 2.284156, 0, 0, 0, 1, 1,
0.4915064, -2.534509, 3.504149, 0, 0, 0, 1, 1,
0.4915457, 0.1163312, 1.889629, 0, 0, 0, 1, 1,
0.4924035, -1.866243, 4.432321, 0, 0, 0, 1, 1,
0.4954981, -0.2494543, 3.057779, 0, 0, 0, 1, 1,
0.5007557, -0.2368083, 1.261681, 0, 0, 0, 1, 1,
0.501029, -1.006371, 1.873769, 0, 0, 0, 1, 1,
0.5020334, 1.074599, -0.6929561, 1, 1, 1, 1, 1,
0.5071549, -0.1511399, 0.03790011, 1, 1, 1, 1, 1,
0.5132077, 0.7847042, 1.21749, 1, 1, 1, 1, 1,
0.5175723, -0.1426978, 2.562085, 1, 1, 1, 1, 1,
0.5181366, -0.861405, 2.230713, 1, 1, 1, 1, 1,
0.5206876, 0.9933352, 0.4739042, 1, 1, 1, 1, 1,
0.5226297, -0.2011535, 2.62415, 1, 1, 1, 1, 1,
0.527311, -0.08762904, 1.294456, 1, 1, 1, 1, 1,
0.5306143, 1.834635, 1.043592, 1, 1, 1, 1, 1,
0.5329355, 0.7892797, 0.2598186, 1, 1, 1, 1, 1,
0.5401551, -0.8692595, 2.056544, 1, 1, 1, 1, 1,
0.541796, 0.5355713, -1.140094, 1, 1, 1, 1, 1,
0.5458186, 0.1342423, -0.7525459, 1, 1, 1, 1, 1,
0.5501061, -1.129496, 3.483777, 1, 1, 1, 1, 1,
0.5518998, -0.6463926, 3.683205, 1, 1, 1, 1, 1,
0.5581065, -0.9878688, 3.087876, 0, 0, 1, 1, 1,
0.5597607, -0.3291936, 3.978825, 1, 0, 0, 1, 1,
0.5637233, -0.6547624, -0.333245, 1, 0, 0, 1, 1,
0.5747223, -1.037489, 1.476342, 1, 0, 0, 1, 1,
0.5750461, -2.057177, 3.50571, 1, 0, 0, 1, 1,
0.5756613, 0.6976467, -0.6798959, 1, 0, 0, 1, 1,
0.577915, 1.169785, 0.4590368, 0, 0, 0, 1, 1,
0.5781459, 0.5512604, 0.4631382, 0, 0, 0, 1, 1,
0.5785413, 0.8042168, 0.08180206, 0, 0, 0, 1, 1,
0.5806682, -0.07092464, 0.5022129, 0, 0, 0, 1, 1,
0.5810153, 0.5703824, 0.4548197, 0, 0, 0, 1, 1,
0.5820308, 0.6120438, 0.7386066, 0, 0, 0, 1, 1,
0.5907261, 0.4959128, 0.6675932, 0, 0, 0, 1, 1,
0.5943106, -1.355431, 2.692633, 1, 1, 1, 1, 1,
0.5972952, -1.216436, 4.770966, 1, 1, 1, 1, 1,
0.5987347, 1.599829, 0.3132838, 1, 1, 1, 1, 1,
0.603381, -0.1106005, 0.6270238, 1, 1, 1, 1, 1,
0.6051561, -0.2064039, 3.667485, 1, 1, 1, 1, 1,
0.6066914, -0.5408159, 1.333378, 1, 1, 1, 1, 1,
0.611993, -0.4263303, 1.121701, 1, 1, 1, 1, 1,
0.612746, 0.2367474, 2.17789, 1, 1, 1, 1, 1,
0.6166121, 1.312784, 0.8101442, 1, 1, 1, 1, 1,
0.6361068, 1.682856, -0.1703034, 1, 1, 1, 1, 1,
0.6362838, 0.8750499, -0.7614039, 1, 1, 1, 1, 1,
0.6382189, 0.680897, -0.701847, 1, 1, 1, 1, 1,
0.6392953, -1.452782, 4.55408, 1, 1, 1, 1, 1,
0.6464051, 1.084341, -0.2750626, 1, 1, 1, 1, 1,
0.646807, -1.232132, 2.586871, 1, 1, 1, 1, 1,
0.6470127, 1.549379, 1.048903, 0, 0, 1, 1, 1,
0.6517406, -0.8768958, 3.671051, 1, 0, 0, 1, 1,
0.6532654, 0.7866964, 0.01093734, 1, 0, 0, 1, 1,
0.6555474, 0.05250859, 1.768126, 1, 0, 0, 1, 1,
0.6586466, 0.8726783, 0.5342103, 1, 0, 0, 1, 1,
0.6589657, -0.1204544, 1.757631, 1, 0, 0, 1, 1,
0.6594822, 0.9205567, 1.351374, 0, 0, 0, 1, 1,
0.6596, -0.05031586, 1.09336, 0, 0, 0, 1, 1,
0.6632128, 0.435875, 1.644975, 0, 0, 0, 1, 1,
0.6638168, 0.3290417, 0.5579348, 0, 0, 0, 1, 1,
0.6649856, -0.7646645, 3.795854, 0, 0, 0, 1, 1,
0.6651878, 0.01826958, -0.522303, 0, 0, 0, 1, 1,
0.6680927, -1.689621, 1.623618, 0, 0, 0, 1, 1,
0.6729426, 0.203464, 1.19373, 1, 1, 1, 1, 1,
0.6775945, -0.1651578, 1.945421, 1, 1, 1, 1, 1,
0.6843542, -0.05001822, 0.5039307, 1, 1, 1, 1, 1,
0.6849813, 1.38308, 0.9716776, 1, 1, 1, 1, 1,
0.6885501, -2.674556, 3.288447, 1, 1, 1, 1, 1,
0.6944864, -0.3512637, 1.642222, 1, 1, 1, 1, 1,
0.6959911, 0.0948312, 3.352049, 1, 1, 1, 1, 1,
0.6982883, -0.9527081, 2.268919, 1, 1, 1, 1, 1,
0.7009984, 1.749745, 0.6037043, 1, 1, 1, 1, 1,
0.7022841, 0.3423572, 0.4220407, 1, 1, 1, 1, 1,
0.7088238, -0.2487042, 1.807501, 1, 1, 1, 1, 1,
0.7172362, -1.261509, 1.970404, 1, 1, 1, 1, 1,
0.7208362, -1.172155, 2.096235, 1, 1, 1, 1, 1,
0.7252101, 0.8075756, 0.8754237, 1, 1, 1, 1, 1,
0.7263953, -0.9460778, 2.457793, 1, 1, 1, 1, 1,
0.7314806, 2.490148, 2.210766, 0, 0, 1, 1, 1,
0.7375052, -1.590215, 2.603682, 1, 0, 0, 1, 1,
0.7409201, -0.9580415, 4.074793, 1, 0, 0, 1, 1,
0.7451513, 0.1835971, 1.084463, 1, 0, 0, 1, 1,
0.7460058, -1.187405, 3.629843, 1, 0, 0, 1, 1,
0.7460819, 0.8308005, -1.290037, 1, 0, 0, 1, 1,
0.7466265, -1.214786, 2.17076, 0, 0, 0, 1, 1,
0.7510013, -0.4630291, 3.938567, 0, 0, 0, 1, 1,
0.7513657, -1.180297, 4.071436, 0, 0, 0, 1, 1,
0.7589118, -0.2851963, 1.199603, 0, 0, 0, 1, 1,
0.7599607, 1.145595, 0.5495628, 0, 0, 0, 1, 1,
0.7690217, -0.6037452, 1.886221, 0, 0, 0, 1, 1,
0.7761821, -0.5950279, 2.964312, 0, 0, 0, 1, 1,
0.7780893, -0.5574797, 3.782269, 1, 1, 1, 1, 1,
0.7877284, -0.8232298, 0.1070846, 1, 1, 1, 1, 1,
0.7884893, -0.5934436, 1.424226, 1, 1, 1, 1, 1,
0.7894398, -1.816464, 2.736002, 1, 1, 1, 1, 1,
0.7900635, -0.6433972, 5.150918, 1, 1, 1, 1, 1,
0.7943767, -1.466779, 1.888888, 1, 1, 1, 1, 1,
0.7948303, -0.3673483, 1.73713, 1, 1, 1, 1, 1,
0.7969357, -0.1854407, 2.092642, 1, 1, 1, 1, 1,
0.8004726, 0.3731828, 1.403533, 1, 1, 1, 1, 1,
0.8089179, 0.768232, 0.522172, 1, 1, 1, 1, 1,
0.8117401, 0.03761293, 0.7382621, 1, 1, 1, 1, 1,
0.8173323, 0.5105716, -0.3573708, 1, 1, 1, 1, 1,
0.8205759, 0.6030681, 0.05352185, 1, 1, 1, 1, 1,
0.8214662, 0.9898606, 1.950744, 1, 1, 1, 1, 1,
0.82881, 1.176305, 1.555725, 1, 1, 1, 1, 1,
0.831319, -0.2618984, 3.237244, 0, 0, 1, 1, 1,
0.833462, 0.1349004, 1.331415, 1, 0, 0, 1, 1,
0.8447638, 0.2029326, 2.066582, 1, 0, 0, 1, 1,
0.8453404, -1.786072, 2.721692, 1, 0, 0, 1, 1,
0.8506233, -0.5797642, 2.450122, 1, 0, 0, 1, 1,
0.8552298, -0.6373708, 2.916378, 1, 0, 0, 1, 1,
0.8581331, -0.06872872, 2.795212, 0, 0, 0, 1, 1,
0.8617147, -1.956245, 1.533447, 0, 0, 0, 1, 1,
0.8784618, -0.4637863, 3.507909, 0, 0, 0, 1, 1,
0.8790616, 1.237053, -0.2943833, 0, 0, 0, 1, 1,
0.8890132, 0.3285831, 0.06617651, 0, 0, 0, 1, 1,
0.8953102, 2.425063, -1.949841, 0, 0, 0, 1, 1,
0.8955467, -0.581342, 4.854969, 0, 0, 0, 1, 1,
0.8972532, -0.3887077, 3.170388, 1, 1, 1, 1, 1,
0.9014903, 0.4171993, 2.240314, 1, 1, 1, 1, 1,
0.9054704, 0.4351062, 1.682554, 1, 1, 1, 1, 1,
0.9079152, 0.2781717, 1.456047, 1, 1, 1, 1, 1,
0.9185347, -0.3373214, 2.108781, 1, 1, 1, 1, 1,
0.9269261, -0.2579698, 0.5130712, 1, 1, 1, 1, 1,
0.9282028, 0.5007899, 0.5707236, 1, 1, 1, 1, 1,
0.929437, 0.383283, 0.8933289, 1, 1, 1, 1, 1,
0.9303204, -0.2532279, 1.200858, 1, 1, 1, 1, 1,
0.9401891, -0.4052904, 3.189453, 1, 1, 1, 1, 1,
0.9430206, 0.801511, 1.850578, 1, 1, 1, 1, 1,
0.9450878, -1.780153, 3.980861, 1, 1, 1, 1, 1,
0.9466844, -1.03959, 2.114104, 1, 1, 1, 1, 1,
0.9588936, 0.5729419, 2.825789, 1, 1, 1, 1, 1,
0.9619808, 0.1143564, 0.6474347, 1, 1, 1, 1, 1,
0.9631944, -0.5121178, 0.6624125, 0, 0, 1, 1, 1,
0.967743, 1.230662, -0.864206, 1, 0, 0, 1, 1,
0.9690207, -0.293502, 0.2631394, 1, 0, 0, 1, 1,
0.9738765, 0.1704821, 2.611701, 1, 0, 0, 1, 1,
0.980829, -1.355414, 3.340919, 1, 0, 0, 1, 1,
0.9840846, 0.1175272, 3.566831, 1, 0, 0, 1, 1,
0.9857211, 0.2507604, 0.8709571, 0, 0, 0, 1, 1,
0.9921845, -0.3706072, 0.06157162, 0, 0, 0, 1, 1,
0.9925075, -1.228377, 3.109724, 0, 0, 0, 1, 1,
0.9992549, -1.379237, 2.788204, 0, 0, 0, 1, 1,
1.011988, 0.5686041, 2.328351, 0, 0, 0, 1, 1,
1.013306, -0.1945185, 1.658569, 0, 0, 0, 1, 1,
1.01399, 1.609991, 0.6118353, 0, 0, 0, 1, 1,
1.014745, 0.2707255, 2.64969, 1, 1, 1, 1, 1,
1.021397, 2.444563, -0.2834161, 1, 1, 1, 1, 1,
1.022979, 0.8900067, -0.84773, 1, 1, 1, 1, 1,
1.026664, 0.6201148, 1.951109, 1, 1, 1, 1, 1,
1.036643, -0.2842483, 2.465165, 1, 1, 1, 1, 1,
1.044027, 1.366925, 0.7106085, 1, 1, 1, 1, 1,
1.049209, -0.01543327, 2.591206, 1, 1, 1, 1, 1,
1.057946, 1.722715, -0.4798622, 1, 1, 1, 1, 1,
1.060175, -0.225026, 2.22085, 1, 1, 1, 1, 1,
1.073007, 0.3923355, 2.228981, 1, 1, 1, 1, 1,
1.087585, 1.227782, 0.7162747, 1, 1, 1, 1, 1,
1.088169, 0.3992176, -0.2796296, 1, 1, 1, 1, 1,
1.090495, -0.4925243, 2.233984, 1, 1, 1, 1, 1,
1.095047, 0.3381275, 1.90801, 1, 1, 1, 1, 1,
1.097343, 0.07913551, 2.410854, 1, 1, 1, 1, 1,
1.102731, -0.2330266, 1.53535, 0, 0, 1, 1, 1,
1.104698, 0.1871144, 2.92903, 1, 0, 0, 1, 1,
1.112886, -0.899587, 1.025595, 1, 0, 0, 1, 1,
1.119061, -1.728034, 2.357862, 1, 0, 0, 1, 1,
1.120098, -0.1643013, 2.168547, 1, 0, 0, 1, 1,
1.121282, -0.7720526, 2.225238, 1, 0, 0, 1, 1,
1.124823, -0.9140319, 2.681905, 0, 0, 0, 1, 1,
1.130031, 0.4840852, 1.493045, 0, 0, 0, 1, 1,
1.143947, 0.5292783, 1.634181, 0, 0, 0, 1, 1,
1.144169, -0.7456002, 2.7126, 0, 0, 0, 1, 1,
1.151629, 0.7087902, 1.112376, 0, 0, 0, 1, 1,
1.153125, 0.3472345, 0.08170424, 0, 0, 0, 1, 1,
1.153994, 0.07907976, 1.43991, 0, 0, 0, 1, 1,
1.156231, 0.5099123, 0.594897, 1, 1, 1, 1, 1,
1.159827, 1.755143, 0.6982433, 1, 1, 1, 1, 1,
1.162169, 1.341431, 0.9776132, 1, 1, 1, 1, 1,
1.163074, -1.584922, 2.282764, 1, 1, 1, 1, 1,
1.172657, 0.3311855, 0.5002727, 1, 1, 1, 1, 1,
1.177107, -0.4074835, 1.454068, 1, 1, 1, 1, 1,
1.185094, -0.8948556, 2.62744, 1, 1, 1, 1, 1,
1.185978, 1.800373, -0.002510398, 1, 1, 1, 1, 1,
1.211955, -1.172951, 1.300292, 1, 1, 1, 1, 1,
1.215185, -1.431924, 2.167569, 1, 1, 1, 1, 1,
1.22285, -1.519885, 2.559095, 1, 1, 1, 1, 1,
1.22572, 0.7222168, -0.09485995, 1, 1, 1, 1, 1,
1.228094, -0.276901, 0.9058247, 1, 1, 1, 1, 1,
1.232823, -0.5538086, 3.260158, 1, 1, 1, 1, 1,
1.235288, -0.05575619, 2.503755, 1, 1, 1, 1, 1,
1.236323, 1.196784, 1.590722, 0, 0, 1, 1, 1,
1.241556, -0.8575044, 1.81394, 1, 0, 0, 1, 1,
1.242643, -1.460795, 2.241206, 1, 0, 0, 1, 1,
1.253381, 0.7850526, 1.143871, 1, 0, 0, 1, 1,
1.254079, -1.302163, 2.813237, 1, 0, 0, 1, 1,
1.263648, 0.3870795, 0.541708, 1, 0, 0, 1, 1,
1.27194, 0.4220525, 0.8143108, 0, 0, 0, 1, 1,
1.275493, 0.5407741, 1.184359, 0, 0, 0, 1, 1,
1.275551, -0.1030384, 1.04829, 0, 0, 0, 1, 1,
1.292843, 0.04356473, 1.895656, 0, 0, 0, 1, 1,
1.301603, -1.876808, 2.674509, 0, 0, 0, 1, 1,
1.30227, -0.4170934, 2.223687, 0, 0, 0, 1, 1,
1.316352, -0.3281255, 2.61678, 0, 0, 0, 1, 1,
1.316473, -0.226594, 1.951799, 1, 1, 1, 1, 1,
1.31758, -1.026751, 1.274685, 1, 1, 1, 1, 1,
1.317684, 0.5873157, 1.134158, 1, 1, 1, 1, 1,
1.319239, 0.1669472, 0.7249429, 1, 1, 1, 1, 1,
1.321419, 0.8743184, 1.708664, 1, 1, 1, 1, 1,
1.334496, 0.9913779, 1.785036, 1, 1, 1, 1, 1,
1.339711, 0.7161294, 1.74573, 1, 1, 1, 1, 1,
1.341649, -0.08980954, 1.968619, 1, 1, 1, 1, 1,
1.363719, 0.1883348, 1.844863, 1, 1, 1, 1, 1,
1.366423, -0.03313849, 1.439107, 1, 1, 1, 1, 1,
1.371065, -0.799382, 3.159679, 1, 1, 1, 1, 1,
1.371614, 1.111235, 0.9652849, 1, 1, 1, 1, 1,
1.379188, -1.221042, 3.415804, 1, 1, 1, 1, 1,
1.38825, 0.8125843, -0.2181531, 1, 1, 1, 1, 1,
1.410904, 0.7374529, 1.937998, 1, 1, 1, 1, 1,
1.432711, -1.705086, 2.485153, 0, 0, 1, 1, 1,
1.433602, -0.06854742, 2.552245, 1, 0, 0, 1, 1,
1.442523, -0.3896978, 1.071593, 1, 0, 0, 1, 1,
1.449683, 0.2784312, 0.5644253, 1, 0, 0, 1, 1,
1.454079, 1.992891, 1.795161, 1, 0, 0, 1, 1,
1.457996, -0.7039871, 1.703261, 1, 0, 0, 1, 1,
1.472011, 1.564453, 0.2751731, 0, 0, 0, 1, 1,
1.475247, -0.2049948, 1.962954, 0, 0, 0, 1, 1,
1.479777, 0.4283343, -0.3123413, 0, 0, 0, 1, 1,
1.512972, -2.884248, 1.575805, 0, 0, 0, 1, 1,
1.533881, -0.3456974, 2.023138, 0, 0, 0, 1, 1,
1.538144, 0.4016174, 1.191622, 0, 0, 0, 1, 1,
1.544426, -0.679117, 1.331306, 0, 0, 0, 1, 1,
1.546008, 0.2018639, 0.9491673, 1, 1, 1, 1, 1,
1.546377, -0.4564419, 1.294873, 1, 1, 1, 1, 1,
1.54679, -0.07609502, 0.4130175, 1, 1, 1, 1, 1,
1.54831, -0.1914497, 1.251284, 1, 1, 1, 1, 1,
1.560216, -1.600621, 0.3007254, 1, 1, 1, 1, 1,
1.560573, 0.3021617, 3.771794, 1, 1, 1, 1, 1,
1.562414, 1.129392, 0.7439321, 1, 1, 1, 1, 1,
1.565392, 0.1082478, 0.8664344, 1, 1, 1, 1, 1,
1.568056, 0.286626, 1.92859, 1, 1, 1, 1, 1,
1.568625, -0.1197273, 3.032681, 1, 1, 1, 1, 1,
1.568846, -0.1916304, 0.8983756, 1, 1, 1, 1, 1,
1.594128, 1.058743, 1.161031, 1, 1, 1, 1, 1,
1.602623, 2.680229, 0.6806952, 1, 1, 1, 1, 1,
1.60622, 0.3093615, 3.52797, 1, 1, 1, 1, 1,
1.640195, -0.4413806, 1.13258, 1, 1, 1, 1, 1,
1.64301, 0.2434284, 0.4580165, 0, 0, 1, 1, 1,
1.648541, -1.756973, 2.148171, 1, 0, 0, 1, 1,
1.665349, -0.1613913, 1.617677, 1, 0, 0, 1, 1,
1.68073, -0.6733978, 2.67624, 1, 0, 0, 1, 1,
1.695233, 1.622215, 0.5324534, 1, 0, 0, 1, 1,
1.705894, 0.4509639, 0.3068484, 1, 0, 0, 1, 1,
1.73795, 0.1748478, 0.9441865, 0, 0, 0, 1, 1,
1.742198, 0.435543, -0.3285593, 0, 0, 0, 1, 1,
1.749636, -1.882098, 1.895475, 0, 0, 0, 1, 1,
1.757466, -0.464858, 1.120524, 0, 0, 0, 1, 1,
1.758411, -1.227375, 0.954095, 0, 0, 0, 1, 1,
1.803003, -1.160946, 0.270685, 0, 0, 0, 1, 1,
1.817631, -1.27617, 2.867089, 0, 0, 0, 1, 1,
1.821719, -0.7748303, 3.406459, 1, 1, 1, 1, 1,
1.828734, -0.2493199, 2.750039, 1, 1, 1, 1, 1,
1.849174, -0.7674006, 2.109509, 1, 1, 1, 1, 1,
1.849558, -0.1162163, 2.742704, 1, 1, 1, 1, 1,
1.871279, 1.105457, 0.9997618, 1, 1, 1, 1, 1,
1.883296, 0.8582394, 1.5712, 1, 1, 1, 1, 1,
1.889273, 1.566811, 1.884009, 1, 1, 1, 1, 1,
1.912125, 1.370449, -0.1106984, 1, 1, 1, 1, 1,
1.926565, 0.4997848, 0.498742, 1, 1, 1, 1, 1,
1.934588, 1.333667, 0.3052029, 1, 1, 1, 1, 1,
1.954181, -0.5880821, 1.827333, 1, 1, 1, 1, 1,
1.977105, -0.7917986, 2.630887, 1, 1, 1, 1, 1,
1.977425, -0.181387, 1.802013, 1, 1, 1, 1, 1,
1.9821, -1.249859, 1.045768, 1, 1, 1, 1, 1,
2.000222, -0.1975319, 1.802599, 1, 1, 1, 1, 1,
2.028599, 0.5267664, 3.011472, 0, 0, 1, 1, 1,
2.047778, -0.7670498, 2.205456, 1, 0, 0, 1, 1,
2.056057, 1.783803, -0.758432, 1, 0, 0, 1, 1,
2.083915, 0.8799347, 1.438295, 1, 0, 0, 1, 1,
2.091685, -0.8410178, 2.916786, 1, 0, 0, 1, 1,
2.15923, -0.7812056, 3.545135, 1, 0, 0, 1, 1,
2.167823, 0.1730879, 0.6017002, 0, 0, 0, 1, 1,
2.176841, 0.04877665, 1.896183, 0, 0, 0, 1, 1,
2.225358, -0.2716545, 1.938335, 0, 0, 0, 1, 1,
2.227809, -1.152949, 3.030334, 0, 0, 0, 1, 1,
2.237236, -0.982015, 1.027522, 0, 0, 0, 1, 1,
2.338537, -0.2095284, 2.860851, 0, 0, 0, 1, 1,
2.35186, -0.2682944, 1.046305, 0, 0, 0, 1, 1,
2.353263, -2.226526, 2.438212, 1, 1, 1, 1, 1,
2.444276, -0.03278269, 1.061194, 1, 1, 1, 1, 1,
2.453166, -1.968705, 1.738077, 1, 1, 1, 1, 1,
2.515711, -1.340364, 2.114806, 1, 1, 1, 1, 1,
2.565457, -1.562098, 3.687516, 1, 1, 1, 1, 1,
2.71221, 0.1167492, 2.701866, 1, 1, 1, 1, 1,
3.326392, -0.2145635, 3.148824, 1, 1, 1, 1, 1
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
var radius = 9.641372;
var distance = 33.86491;
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
mvMatrix.translate( -0.3431588, 0.3720719, 0.06649446 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.86491);
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
