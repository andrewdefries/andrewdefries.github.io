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
-3.415975, -1.347786, -2.017274, 1, 0, 0, 1,
-3.075639, -1.131685, -2.402473, 1, 0.007843138, 0, 1,
-2.868965, 1.009672, -0.7754714, 1, 0.01176471, 0, 1,
-2.850475, 0.4216039, -0.9737057, 1, 0.01960784, 0, 1,
-2.667819, 0.9837319, -0.8308558, 1, 0.02352941, 0, 1,
-2.591229, -1.429958, -2.277247, 1, 0.03137255, 0, 1,
-2.558621, -0.1943153, -0.6528956, 1, 0.03529412, 0, 1,
-2.488074, 0.8465221, -2.051265, 1, 0.04313726, 0, 1,
-2.462484, -0.8402562, -1.647324, 1, 0.04705882, 0, 1,
-2.434341, 0.4865679, -2.701336, 1, 0.05490196, 0, 1,
-2.376706, 0.2449968, -0.5747495, 1, 0.05882353, 0, 1,
-2.36092, -0.5464676, -3.31057, 1, 0.06666667, 0, 1,
-2.230543, -1.568811, -1.809972, 1, 0.07058824, 0, 1,
-2.186052, -0.7214188, -0.5119874, 1, 0.07843138, 0, 1,
-2.181929, 0.09802683, -2.425486, 1, 0.08235294, 0, 1,
-2.054624, 0.7001776, 0.1472944, 1, 0.09019608, 0, 1,
-1.988493, -1.31818, -2.382225, 1, 0.09411765, 0, 1,
-1.970695, 0.3606213, -1.080751, 1, 0.1019608, 0, 1,
-1.96901, -0.8564032, -2.334125, 1, 0.1098039, 0, 1,
-1.952256, 0.01360733, -3.014821, 1, 0.1137255, 0, 1,
-1.951588, -1.269217, -0.2591377, 1, 0.1215686, 0, 1,
-1.910859, -0.909905, -1.791874, 1, 0.1254902, 0, 1,
-1.900643, -1.095872, -2.301202, 1, 0.1333333, 0, 1,
-1.867908, 1.595324, -1.287078, 1, 0.1372549, 0, 1,
-1.855953, -0.3661037, -2.403643, 1, 0.145098, 0, 1,
-1.830965, 1.592428, -0.8270485, 1, 0.1490196, 0, 1,
-1.830887, -1.770572, -1.793836, 1, 0.1568628, 0, 1,
-1.816698, -1.00681, -1.90817, 1, 0.1607843, 0, 1,
-1.804638, -0.7894036, -1.319023, 1, 0.1686275, 0, 1,
-1.799751, -0.5260981, -3.059072, 1, 0.172549, 0, 1,
-1.793491, -0.813201, -1.306574, 1, 0.1803922, 0, 1,
-1.759198, 1.009515, -0.9917961, 1, 0.1843137, 0, 1,
-1.706523, -0.2059185, -1.669492, 1, 0.1921569, 0, 1,
-1.673648, -0.03394346, -3.587233, 1, 0.1960784, 0, 1,
-1.673057, -0.5520912, -2.026583, 1, 0.2039216, 0, 1,
-1.668317, -0.1999441, -1.357061, 1, 0.2117647, 0, 1,
-1.667662, -0.7941689, -3.341809, 1, 0.2156863, 0, 1,
-1.659948, 1.481617, -1.194365, 1, 0.2235294, 0, 1,
-1.646081, 0.2394336, -2.646588, 1, 0.227451, 0, 1,
-1.637356, 0.02220177, -1.669833, 1, 0.2352941, 0, 1,
-1.625021, 2.206972, 0.5665979, 1, 0.2392157, 0, 1,
-1.614667, -0.7206798, -2.282824, 1, 0.2470588, 0, 1,
-1.6091, -0.3489053, -1.672747, 1, 0.2509804, 0, 1,
-1.603507, -0.08039799, -3.229436, 1, 0.2588235, 0, 1,
-1.601695, 0.08264361, -1.313909, 1, 0.2627451, 0, 1,
-1.592894, 1.721825, -0.8574332, 1, 0.2705882, 0, 1,
-1.581417, 1.31862, -0.9998291, 1, 0.2745098, 0, 1,
-1.57378, -1.386089, -2.183409, 1, 0.282353, 0, 1,
-1.559154, -0.7982838, -1.277417, 1, 0.2862745, 0, 1,
-1.549835, 0.06875329, -2.623651, 1, 0.2941177, 0, 1,
-1.549029, 0.9796869, -1.611793, 1, 0.3019608, 0, 1,
-1.546575, 1.98683, 0.8251753, 1, 0.3058824, 0, 1,
-1.538315, 1.622298, -0.5752801, 1, 0.3137255, 0, 1,
-1.52837, -0.9763365, -1.304075, 1, 0.3176471, 0, 1,
-1.519099, 0.9188677, -3.144401, 1, 0.3254902, 0, 1,
-1.509666, -2.243763, -2.221673, 1, 0.3294118, 0, 1,
-1.503245, -1.923084, -0.9419448, 1, 0.3372549, 0, 1,
-1.485826, 0.5008008, -2.010226, 1, 0.3411765, 0, 1,
-1.478484, 1.215954, -1.236572, 1, 0.3490196, 0, 1,
-1.474874, 0.7113959, -4.116706, 1, 0.3529412, 0, 1,
-1.465567, -1.130342, -1.60817, 1, 0.3607843, 0, 1,
-1.459035, -3.393779, -3.199256, 1, 0.3647059, 0, 1,
-1.456311, -0.2674713, -0.1095336, 1, 0.372549, 0, 1,
-1.455486, 2.756895, 0.01365549, 1, 0.3764706, 0, 1,
-1.455269, 0.3346756, -0.6224417, 1, 0.3843137, 0, 1,
-1.437087, -2.03063, -1.358355, 1, 0.3882353, 0, 1,
-1.43524, -0.9528528, -1.437033, 1, 0.3960784, 0, 1,
-1.400324, 0.6883448, -1.378942, 1, 0.4039216, 0, 1,
-1.39679, -0.2627494, -2.09499, 1, 0.4078431, 0, 1,
-1.394577, 0.1401496, -1.195916, 1, 0.4156863, 0, 1,
-1.393218, 0.7021416, -1.454191, 1, 0.4196078, 0, 1,
-1.378412, -0.5060846, -1.398187, 1, 0.427451, 0, 1,
-1.376984, 0.5278963, -0.4675747, 1, 0.4313726, 0, 1,
-1.368922, 0.524902, -1.172725, 1, 0.4392157, 0, 1,
-1.366737, 0.6373159, -1.176671, 1, 0.4431373, 0, 1,
-1.361262, 1.365927, 0.9237778, 1, 0.4509804, 0, 1,
-1.356394, -1.032996, -2.497567, 1, 0.454902, 0, 1,
-1.34042, 0.6420778, -0.1002754, 1, 0.4627451, 0, 1,
-1.339114, 1.388516, 0.6023204, 1, 0.4666667, 0, 1,
-1.334132, -0.6517253, -2.140277, 1, 0.4745098, 0, 1,
-1.33371, 1.000047, 1.697573, 1, 0.4784314, 0, 1,
-1.331692, -0.7737151, -0.92027, 1, 0.4862745, 0, 1,
-1.327608, 2.557374, -0.2560863, 1, 0.4901961, 0, 1,
-1.315192, 1.519505, 0.7257187, 1, 0.4980392, 0, 1,
-1.310603, 0.06466552, -2.239457, 1, 0.5058824, 0, 1,
-1.304411, 2.435347, 1.334196, 1, 0.509804, 0, 1,
-1.303265, 0.5833629, -0.2235181, 1, 0.5176471, 0, 1,
-1.295631, 0.435537, -0.9257802, 1, 0.5215687, 0, 1,
-1.28515, -0.7615626, -1.283527, 1, 0.5294118, 0, 1,
-1.282249, -1.397264, -2.411817, 1, 0.5333334, 0, 1,
-1.279694, -0.1436291, -3.145996, 1, 0.5411765, 0, 1,
-1.279333, 0.7231862, -1.64179, 1, 0.5450981, 0, 1,
-1.275461, 0.5343206, -0.9527208, 1, 0.5529412, 0, 1,
-1.271267, 1.038702, -1.239114, 1, 0.5568628, 0, 1,
-1.270419, -0.196836, -0.3442608, 1, 0.5647059, 0, 1,
-1.267256, 0.468008, -1.272689, 1, 0.5686275, 0, 1,
-1.257873, 0.5263063, -0.6705253, 1, 0.5764706, 0, 1,
-1.253294, 0.9650889, -0.6281028, 1, 0.5803922, 0, 1,
-1.251938, 0.5416875, -1.555595, 1, 0.5882353, 0, 1,
-1.248721, -0.5868997, -2.977302, 1, 0.5921569, 0, 1,
-1.247066, -0.7514535, -1.769772, 1, 0.6, 0, 1,
-1.242691, -0.9648364, -1.678503, 1, 0.6078432, 0, 1,
-1.238776, 0.4418403, -1.023165, 1, 0.6117647, 0, 1,
-1.23639, -0.6324947, -3.070261, 1, 0.6196079, 0, 1,
-1.231166, -2.211549, -1.101066, 1, 0.6235294, 0, 1,
-1.230723, 0.5012735, 0.1565845, 1, 0.6313726, 0, 1,
-1.223065, -0.1389511, -1.810704, 1, 0.6352941, 0, 1,
-1.218852, 1.410687, -1.270851, 1, 0.6431373, 0, 1,
-1.217319, 1.673414, -2.233168, 1, 0.6470588, 0, 1,
-1.216178, -0.5467253, -1.765986, 1, 0.654902, 0, 1,
-1.198093, 0.1766547, -0.6761913, 1, 0.6588235, 0, 1,
-1.195585, -0.2767321, -1.442681, 1, 0.6666667, 0, 1,
-1.190697, -0.01267162, -1.830539, 1, 0.6705883, 0, 1,
-1.188997, -0.5284755, -1.150319, 1, 0.6784314, 0, 1,
-1.186306, -0.2700978, -1.38384, 1, 0.682353, 0, 1,
-1.184511, 0.6235532, -1.499996, 1, 0.6901961, 0, 1,
-1.181019, 0.7803927, -1.924707, 1, 0.6941177, 0, 1,
-1.171507, -0.404867, -1.908455, 1, 0.7019608, 0, 1,
-1.163342, 1.860397, 0.8737874, 1, 0.7098039, 0, 1,
-1.156805, 2.659979, -2.636617, 1, 0.7137255, 0, 1,
-1.155662, -1.164776, -4.216904, 1, 0.7215686, 0, 1,
-1.147661, 0.4741035, -0.9655088, 1, 0.7254902, 0, 1,
-1.142263, -0.6439875, -1.901904, 1, 0.7333333, 0, 1,
-1.140526, 0.393395, -1.525565, 1, 0.7372549, 0, 1,
-1.137051, 0.7816849, -2.442706, 1, 0.7450981, 0, 1,
-1.132381, -1.066944, -1.84935, 1, 0.7490196, 0, 1,
-1.130851, -0.9072542, -2.590188, 1, 0.7568628, 0, 1,
-1.109766, 0.9650727, 0.4069473, 1, 0.7607843, 0, 1,
-1.10137, -1.682488, -1.588799, 1, 0.7686275, 0, 1,
-1.096416, -0.7963771, -2.53652, 1, 0.772549, 0, 1,
-1.094757, 1.024688, -1.12258, 1, 0.7803922, 0, 1,
-1.093426, 0.7690148, -1.162271, 1, 0.7843137, 0, 1,
-1.091064, -1.535963, -2.980161, 1, 0.7921569, 0, 1,
-1.087293, -1.10275, -1.334711, 1, 0.7960784, 0, 1,
-1.084481, -1.030712, -3.269207, 1, 0.8039216, 0, 1,
-1.07872, -0.5079563, -1.136997, 1, 0.8117647, 0, 1,
-1.077527, -1.087046, -2.234227, 1, 0.8156863, 0, 1,
-1.075731, 0.8523619, -1.462137, 1, 0.8235294, 0, 1,
-1.069336, -0.5123752, -2.619038, 1, 0.827451, 0, 1,
-1.064606, 0.9202983, -0.01001948, 1, 0.8352941, 0, 1,
-1.063478, -1.742328, -2.261691, 1, 0.8392157, 0, 1,
-1.06012, 1.015552, -1.580389, 1, 0.8470588, 0, 1,
-1.059735, 1.145431, -0.4288356, 1, 0.8509804, 0, 1,
-1.058147, 0.9923483, -0.8884403, 1, 0.8588235, 0, 1,
-1.048473, 2.41685, -0.7293674, 1, 0.8627451, 0, 1,
-1.046247, 0.7548124, -4.47124, 1, 0.8705882, 0, 1,
-1.041845, -1.624256, -3.686675, 1, 0.8745098, 0, 1,
-1.035025, 1.957921, -0.4750145, 1, 0.8823529, 0, 1,
-1.033655, 0.01979486, -2.348141, 1, 0.8862745, 0, 1,
-1.031576, 0.5565308, -2.191687, 1, 0.8941177, 0, 1,
-1.031358, -0.3730831, -1.779364, 1, 0.8980392, 0, 1,
-1.02256, -1.225778, -2.97897, 1, 0.9058824, 0, 1,
-1.016203, -0.1387839, 1.374757, 1, 0.9137255, 0, 1,
-1.013973, -0.852208, -1.030487, 1, 0.9176471, 0, 1,
-1.005782, -0.7192054, -1.821872, 1, 0.9254902, 0, 1,
-1.004016, 0.5497267, -1.959501, 1, 0.9294118, 0, 1,
-0.9976498, 0.8434091, -2.248828, 1, 0.9372549, 0, 1,
-0.9913429, -0.9055273, -3.465453, 1, 0.9411765, 0, 1,
-0.9879634, -1.477798, -2.842376, 1, 0.9490196, 0, 1,
-0.979629, 1.108452, -0.4507468, 1, 0.9529412, 0, 1,
-0.9785244, -1.079024, -3.192245, 1, 0.9607843, 0, 1,
-0.9775994, -0.5080816, -1.590077, 1, 0.9647059, 0, 1,
-0.9754325, -0.1308195, -1.627355, 1, 0.972549, 0, 1,
-0.9729381, -2.860466, -2.364948, 1, 0.9764706, 0, 1,
-0.9716681, 0.04493493, -1.589119, 1, 0.9843137, 0, 1,
-0.9570689, -0.7980104, -3.882608, 1, 0.9882353, 0, 1,
-0.9527035, -0.2308009, -4.148533, 1, 0.9960784, 0, 1,
-0.9505618, 0.46653, -0.7739099, 0.9960784, 1, 0, 1,
-0.949412, -1.097616, -3.71464, 0.9921569, 1, 0, 1,
-0.9471747, 1.211886, 0.1581561, 0.9843137, 1, 0, 1,
-0.9445738, 0.1673983, -1.59623, 0.9803922, 1, 0, 1,
-0.9399227, 0.1830527, -2.46623, 0.972549, 1, 0, 1,
-0.9386399, 0.20151, -1.694911, 0.9686275, 1, 0, 1,
-0.9360347, -0.5660459, -2.11477, 0.9607843, 1, 0, 1,
-0.9358322, 0.2283661, -0.5240236, 0.9568627, 1, 0, 1,
-0.9326354, -0.2631234, -0.1520288, 0.9490196, 1, 0, 1,
-0.925392, 0.1944896, -2.438445, 0.945098, 1, 0, 1,
-0.9196267, -0.1343448, -0.779131, 0.9372549, 1, 0, 1,
-0.9180802, -0.08563146, 0.5496389, 0.9333333, 1, 0, 1,
-0.9169152, -0.3419826, -1.927917, 0.9254902, 1, 0, 1,
-0.9059581, -0.09792813, -3.133104, 0.9215686, 1, 0, 1,
-0.9015999, -0.3114299, -2.605964, 0.9137255, 1, 0, 1,
-0.8996588, 0.5375138, -2.053769, 0.9098039, 1, 0, 1,
-0.8947787, -0.3139705, -2.33358, 0.9019608, 1, 0, 1,
-0.8890295, 0.2442056, -0.2569968, 0.8941177, 1, 0, 1,
-0.8821307, 0.6594084, 0.7490419, 0.8901961, 1, 0, 1,
-0.8707104, -0.3555454, -2.279161, 0.8823529, 1, 0, 1,
-0.8650566, 1.15374, -0.3190383, 0.8784314, 1, 0, 1,
-0.8644687, 0.7398304, -0.885534, 0.8705882, 1, 0, 1,
-0.8642694, -0.4694237, -2.347579, 0.8666667, 1, 0, 1,
-0.8642679, 1.755553, -0.5893351, 0.8588235, 1, 0, 1,
-0.8624959, 1.284754, 0.8087538, 0.854902, 1, 0, 1,
-0.861707, 0.6606467, -1.932743, 0.8470588, 1, 0, 1,
-0.8511946, 1.430596, -2.551284, 0.8431373, 1, 0, 1,
-0.8502036, -1.420172, -3.219422, 0.8352941, 1, 0, 1,
-0.8417987, 3.299127, 0.801156, 0.8313726, 1, 0, 1,
-0.8326449, -0.6286117, -3.235845, 0.8235294, 1, 0, 1,
-0.8298786, -1.505073, -2.82572, 0.8196079, 1, 0, 1,
-0.8292073, 0.111974, -0.7720888, 0.8117647, 1, 0, 1,
-0.8218493, 0.7076898, -1.180691, 0.8078431, 1, 0, 1,
-0.8175194, -1.790484, -3.824118, 0.8, 1, 0, 1,
-0.8152099, 0.5798401, -1.554402, 0.7921569, 1, 0, 1,
-0.8067665, -0.06725498, -0.0317528, 0.7882353, 1, 0, 1,
-0.8050911, -0.1420301, -3.11745, 0.7803922, 1, 0, 1,
-0.8034379, 2.252666, 1.984849, 0.7764706, 1, 0, 1,
-0.7965636, -1.599007, -2.71799, 0.7686275, 1, 0, 1,
-0.7917138, -0.6497973, -2.020885, 0.7647059, 1, 0, 1,
-0.7912548, -0.5878531, -1.823785, 0.7568628, 1, 0, 1,
-0.7899601, 0.3505205, -0.7102218, 0.7529412, 1, 0, 1,
-0.785409, -0.2955916, 0.7765601, 0.7450981, 1, 0, 1,
-0.7812427, -1.210874, -2.158049, 0.7411765, 1, 0, 1,
-0.77925, -1.255202, -2.502122, 0.7333333, 1, 0, 1,
-0.7747167, -1.030405, -2.556099, 0.7294118, 1, 0, 1,
-0.7745098, 0.2985814, -1.485565, 0.7215686, 1, 0, 1,
-0.7697114, 0.5090391, -0.4992557, 0.7176471, 1, 0, 1,
-0.7695842, 1.41784, -1.258417, 0.7098039, 1, 0, 1,
-0.7595693, 0.130979, -0.07783897, 0.7058824, 1, 0, 1,
-0.7570102, 1.74234, 0.578319, 0.6980392, 1, 0, 1,
-0.7548652, 0.7607616, -1.033383, 0.6901961, 1, 0, 1,
-0.7535143, 1.853415, -2.406057, 0.6862745, 1, 0, 1,
-0.7476313, -1.723373, -3.046172, 0.6784314, 1, 0, 1,
-0.7459758, -2.024983, -3.29151, 0.6745098, 1, 0, 1,
-0.7421955, 0.9629798, 1.25816, 0.6666667, 1, 0, 1,
-0.7407719, -1.48249, -3.390289, 0.6627451, 1, 0, 1,
-0.7357548, -0.5007195, -1.378386, 0.654902, 1, 0, 1,
-0.7286595, -0.5404384, -1.524234, 0.6509804, 1, 0, 1,
-0.725103, -0.6803573, -3.13532, 0.6431373, 1, 0, 1,
-0.720012, -1.666334, -2.743288, 0.6392157, 1, 0, 1,
-0.7173458, -1.09878, -4.9992, 0.6313726, 1, 0, 1,
-0.7162493, 0.6253372, -0.1888945, 0.627451, 1, 0, 1,
-0.7124094, 0.5236823, 0.07835598, 0.6196079, 1, 0, 1,
-0.71233, -0.2613071, -2.966809, 0.6156863, 1, 0, 1,
-0.7059591, -0.3996825, -0.7726989, 0.6078432, 1, 0, 1,
-0.7054334, -0.5884459, -1.640649, 0.6039216, 1, 0, 1,
-0.7034094, -1.336459, -2.069463, 0.5960785, 1, 0, 1,
-0.7017484, -0.9374802, -4.283912, 0.5882353, 1, 0, 1,
-0.6998521, 0.3212913, 0.9863848, 0.5843138, 1, 0, 1,
-0.6943404, -0.133887, -1.543865, 0.5764706, 1, 0, 1,
-0.6838744, -1.473646, -3.331581, 0.572549, 1, 0, 1,
-0.6830981, -0.7235078, -3.809729, 0.5647059, 1, 0, 1,
-0.678861, 0.4515609, -0.1957817, 0.5607843, 1, 0, 1,
-0.6782547, -0.2242392, -0.5410151, 0.5529412, 1, 0, 1,
-0.673359, -0.07041162, -0.6688597, 0.5490196, 1, 0, 1,
-0.6723392, -0.3561429, -2.579643, 0.5411765, 1, 0, 1,
-0.6700796, 0.023731, -0.1085775, 0.5372549, 1, 0, 1,
-0.667582, -1.290477, -1.050033, 0.5294118, 1, 0, 1,
-0.6675273, 0.5803757, -1.690414, 0.5254902, 1, 0, 1,
-0.6673371, 1.969813, -3.133206, 0.5176471, 1, 0, 1,
-0.6663439, 1.190235, 0.06832483, 0.5137255, 1, 0, 1,
-0.6660795, 1.197752, -1.597503, 0.5058824, 1, 0, 1,
-0.6655506, -0.9397081, -1.086613, 0.5019608, 1, 0, 1,
-0.6633285, -0.09062591, -2.506905, 0.4941176, 1, 0, 1,
-0.6500646, -1.244319, -3.505275, 0.4862745, 1, 0, 1,
-0.6485646, 1.298546, -0.5430539, 0.4823529, 1, 0, 1,
-0.6483069, 0.5586353, -2.4115, 0.4745098, 1, 0, 1,
-0.6482592, -0.6326439, -2.81998, 0.4705882, 1, 0, 1,
-0.6418052, -0.7890586, -2.528224, 0.4627451, 1, 0, 1,
-0.6373897, 1.125359, -1.578698, 0.4588235, 1, 0, 1,
-0.6358253, -1.13341, -3.215827, 0.4509804, 1, 0, 1,
-0.6280829, 2.016505, -0.8766361, 0.4470588, 1, 0, 1,
-0.6253178, 1.32099, -0.8870531, 0.4392157, 1, 0, 1,
-0.623193, -0.8344024, -3.138002, 0.4352941, 1, 0, 1,
-0.6231498, -0.4628303, -3.102983, 0.427451, 1, 0, 1,
-0.6227878, 0.8935287, 0.8846943, 0.4235294, 1, 0, 1,
-0.6224799, -0.9182757, -2.754686, 0.4156863, 1, 0, 1,
-0.6212139, -0.04923629, -0.9982541, 0.4117647, 1, 0, 1,
-0.621025, 0.3061376, -1.768522, 0.4039216, 1, 0, 1,
-0.6165181, 0.4837284, 2.027773, 0.3960784, 1, 0, 1,
-0.6163877, 0.8281773, -1.721643, 0.3921569, 1, 0, 1,
-0.6124717, -1.55093, -4.735904, 0.3843137, 1, 0, 1,
-0.6091594, -0.8906999, -0.009578242, 0.3803922, 1, 0, 1,
-0.6045246, 0.8896313, -0.6392438, 0.372549, 1, 0, 1,
-0.5993602, 1.178301, 0.1526949, 0.3686275, 1, 0, 1,
-0.5952538, 0.8415709, 0.0612601, 0.3607843, 1, 0, 1,
-0.5915094, 2.425929, -0.4958096, 0.3568628, 1, 0, 1,
-0.5913656, -0.6958954, -1.5906, 0.3490196, 1, 0, 1,
-0.588783, -1.264753, -4.073185, 0.345098, 1, 0, 1,
-0.5787691, 0.01918675, 0.3417807, 0.3372549, 1, 0, 1,
-0.5761085, 0.432692, -0.1197597, 0.3333333, 1, 0, 1,
-0.5735303, -0.6092172, -3.910158, 0.3254902, 1, 0, 1,
-0.5678191, 0.4096553, -0.9591613, 0.3215686, 1, 0, 1,
-0.5630825, 0.8985465, -0.09458054, 0.3137255, 1, 0, 1,
-0.5589547, 0.9014995, -0.7827176, 0.3098039, 1, 0, 1,
-0.5561891, -1.501712, -1.121686, 0.3019608, 1, 0, 1,
-0.5553092, -0.5063693, -3.962439, 0.2941177, 1, 0, 1,
-0.5516317, -0.8311138, -3.207385, 0.2901961, 1, 0, 1,
-0.5484907, -0.9060922, -1.155555, 0.282353, 1, 0, 1,
-0.5457154, 1.053559, -1.00108, 0.2784314, 1, 0, 1,
-0.5337464, -1.297073, -2.07017, 0.2705882, 1, 0, 1,
-0.5320876, 1.334473, -1.369774, 0.2666667, 1, 0, 1,
-0.5280829, 1.858611, 0.7249621, 0.2588235, 1, 0, 1,
-0.5261149, -1.026852, -4.256138, 0.254902, 1, 0, 1,
-0.5251381, 0.1508861, -1.97227, 0.2470588, 1, 0, 1,
-0.5245112, 0.8629267, -0.5317841, 0.2431373, 1, 0, 1,
-0.5232692, -0.3942994, -1.177369, 0.2352941, 1, 0, 1,
-0.5232545, 0.8324049, 0.836037, 0.2313726, 1, 0, 1,
-0.522517, 1.108917, -1.319071, 0.2235294, 1, 0, 1,
-0.5217345, -0.5446027, -3.77321, 0.2196078, 1, 0, 1,
-0.5201264, 0.8694821, 1.568542, 0.2117647, 1, 0, 1,
-0.5153217, 0.5997226, -2.591147, 0.2078431, 1, 0, 1,
-0.5069689, -0.9348535, -2.267114, 0.2, 1, 0, 1,
-0.5061672, -0.3019042, -2.024819, 0.1921569, 1, 0, 1,
-0.5054082, -0.7096307, -1.400706, 0.1882353, 1, 0, 1,
-0.5015708, 0.6439235, -1.710733, 0.1803922, 1, 0, 1,
-0.5005044, -0.7189977, -3.315592, 0.1764706, 1, 0, 1,
-0.5002267, 0.5337043, -0.4944206, 0.1686275, 1, 0, 1,
-0.4973845, 1.394705, -1.014998, 0.1647059, 1, 0, 1,
-0.4954514, -1.516379, -3.512513, 0.1568628, 1, 0, 1,
-0.4923585, 1.841922, 0.8961578, 0.1529412, 1, 0, 1,
-0.4917831, -0.8614887, -3.30846, 0.145098, 1, 0, 1,
-0.4910685, -0.5712178, -2.197142, 0.1411765, 1, 0, 1,
-0.4888577, -0.3548961, -3.190392, 0.1333333, 1, 0, 1,
-0.4840074, 1.571312, 2.68743, 0.1294118, 1, 0, 1,
-0.4821583, -1.107551, -2.148911, 0.1215686, 1, 0, 1,
-0.4753603, -0.5481836, -4.400626, 0.1176471, 1, 0, 1,
-0.4750434, -2.009949, -4.357074, 0.1098039, 1, 0, 1,
-0.4698701, 1.352838, -0.4275141, 0.1058824, 1, 0, 1,
-0.4683556, 0.3089369, 0.7552482, 0.09803922, 1, 0, 1,
-0.4667591, 0.9832365, -0.4711289, 0.09019608, 1, 0, 1,
-0.4643821, -0.5536885, -3.174319, 0.08627451, 1, 0, 1,
-0.4633988, 0.6144316, -0.2261991, 0.07843138, 1, 0, 1,
-0.4595726, -1.42217, -2.779569, 0.07450981, 1, 0, 1,
-0.4584347, -0.775638, -3.171261, 0.06666667, 1, 0, 1,
-0.4566238, -0.261932, -0.01771609, 0.0627451, 1, 0, 1,
-0.4539042, -1.141468, -0.4853485, 0.05490196, 1, 0, 1,
-0.4492126, -2.399779, -4.10213, 0.05098039, 1, 0, 1,
-0.440834, -0.769048, -2.78293, 0.04313726, 1, 0, 1,
-0.4392915, 0.09849446, -0.7394205, 0.03921569, 1, 0, 1,
-0.4365607, -0.7441519, -2.590971, 0.03137255, 1, 0, 1,
-0.4308192, 0.3177795, -2.748069, 0.02745098, 1, 0, 1,
-0.4273598, 0.2872711, -0.5152544, 0.01960784, 1, 0, 1,
-0.4238994, 1.586102, 0.5140975, 0.01568628, 1, 0, 1,
-0.4196438, 1.029768, -0.3684998, 0.007843138, 1, 0, 1,
-0.4178129, -0.1277268, -1.343507, 0.003921569, 1, 0, 1,
-0.4141476, -0.5250106, -2.59715, 0, 1, 0.003921569, 1,
-0.4083586, 0.3914709, -1.334236, 0, 1, 0.01176471, 1,
-0.4050206, 2.091361, 0.01320878, 0, 1, 0.01568628, 1,
-0.4010819, -0.3840844, -0.9132054, 0, 1, 0.02352941, 1,
-0.3982941, -0.7675399, -2.930312, 0, 1, 0.02745098, 1,
-0.3961477, -1.386539, -2.425374, 0, 1, 0.03529412, 1,
-0.3952349, 1.296175, -1.193415, 0, 1, 0.03921569, 1,
-0.3941377, -2.16361, -0.7489915, 0, 1, 0.04705882, 1,
-0.3933257, 0.5868411, -1.075867, 0, 1, 0.05098039, 1,
-0.3860126, -0.5977685, -3.284982, 0, 1, 0.05882353, 1,
-0.3814085, 2.046648, 0.4546273, 0, 1, 0.0627451, 1,
-0.3804945, 0.36821, 0.3365974, 0, 1, 0.07058824, 1,
-0.3804481, -0.8063347, -2.75327, 0, 1, 0.07450981, 1,
-0.3794098, -0.3660834, -3.904852, 0, 1, 0.08235294, 1,
-0.3759051, -0.8978454, -5.108051, 0, 1, 0.08627451, 1,
-0.3754396, -0.8525368, -1.601234, 0, 1, 0.09411765, 1,
-0.3745507, 0.011702, -3.175038, 0, 1, 0.1019608, 1,
-0.3715757, 1.476313, -0.4072619, 0, 1, 0.1058824, 1,
-0.3707244, -0.1424167, -2.215333, 0, 1, 0.1137255, 1,
-0.3667135, -1.482783, -6.542828, 0, 1, 0.1176471, 1,
-0.3657137, -0.675496, -3.577107, 0, 1, 0.1254902, 1,
-0.3612497, -0.9298844, -3.190178, 0, 1, 0.1294118, 1,
-0.3587544, 1.502726, 1.196922, 0, 1, 0.1372549, 1,
-0.3566996, 0.5158619, -0.5900501, 0, 1, 0.1411765, 1,
-0.3545867, -0.2157831, -0.4073141, 0, 1, 0.1490196, 1,
-0.3504709, 0.2533508, 0.1669411, 0, 1, 0.1529412, 1,
-0.3490826, 1.064932, 2.043166, 0, 1, 0.1607843, 1,
-0.3445133, 0.685788, -2.660802, 0, 1, 0.1647059, 1,
-0.3436473, -1.263721, -2.276742, 0, 1, 0.172549, 1,
-0.3391635, -0.6795386, -3.568973, 0, 1, 0.1764706, 1,
-0.3384408, 0.6469186, -1.62668, 0, 1, 0.1843137, 1,
-0.3340988, -0.4505158, -2.169416, 0, 1, 0.1882353, 1,
-0.3327821, 0.1943614, 0.9768416, 0, 1, 0.1960784, 1,
-0.3282046, -0.2811821, -3.131879, 0, 1, 0.2039216, 1,
-0.327006, 0.7793367, -0.4303164, 0, 1, 0.2078431, 1,
-0.3207945, 0.1514059, -0.8952367, 0, 1, 0.2156863, 1,
-0.320457, -0.2223078, -0.1379829, 0, 1, 0.2196078, 1,
-0.3174161, -1.056487, -2.655796, 0, 1, 0.227451, 1,
-0.3173941, 1.285827, 0.6625416, 0, 1, 0.2313726, 1,
-0.3142672, -0.2869013, -3.355108, 0, 1, 0.2392157, 1,
-0.3120556, -0.6541678, -1.970408, 0, 1, 0.2431373, 1,
-0.3111131, -0.6905929, -3.911926, 0, 1, 0.2509804, 1,
-0.3085964, 0.5522153, -0.2305175, 0, 1, 0.254902, 1,
-0.3076994, 1.548837, 0.3107603, 0, 1, 0.2627451, 1,
-0.3043962, 0.7631122, -0.01996512, 0, 1, 0.2666667, 1,
-0.3040538, 0.5513169, -1.002067, 0, 1, 0.2745098, 1,
-0.3002287, -0.4785052, -2.415922, 0, 1, 0.2784314, 1,
-0.2983838, 0.1483945, -1.637658, 0, 1, 0.2862745, 1,
-0.2914266, -1.402338, -1.856343, 0, 1, 0.2901961, 1,
-0.2908228, -0.3695517, -3.967983, 0, 1, 0.2980392, 1,
-0.2904085, -0.7036462, -0.6115223, 0, 1, 0.3058824, 1,
-0.2856968, -0.5509757, -3.235019, 0, 1, 0.3098039, 1,
-0.2856289, -0.8158861, -1.822352, 0, 1, 0.3176471, 1,
-0.2816925, -1.159114, -3.541374, 0, 1, 0.3215686, 1,
-0.2692571, -1.271486, -1.565191, 0, 1, 0.3294118, 1,
-0.2646412, -0.1241149, -1.958964, 0, 1, 0.3333333, 1,
-0.2640507, 0.7771485, -0.9296773, 0, 1, 0.3411765, 1,
-0.2609412, 0.6949404, -0.8191394, 0, 1, 0.345098, 1,
-0.2573759, 2.166602, -0.06776284, 0, 1, 0.3529412, 1,
-0.2516579, 1.936368, 0.3847, 0, 1, 0.3568628, 1,
-0.2486697, 2.972036, -0.1574294, 0, 1, 0.3647059, 1,
-0.2481384, -0.93714, -1.049372, 0, 1, 0.3686275, 1,
-0.2420516, 0.5280355, -0.1015724, 0, 1, 0.3764706, 1,
-0.2323651, -0.1736778, -2.907301, 0, 1, 0.3803922, 1,
-0.2318303, -0.9600203, -2.512387, 0, 1, 0.3882353, 1,
-0.2250698, 0.007258962, -1.59062, 0, 1, 0.3921569, 1,
-0.2241404, -1.61764, -2.672814, 0, 1, 0.4, 1,
-0.2215137, -1.047083, -2.111532, 0, 1, 0.4078431, 1,
-0.2165867, -2.061485, -3.218189, 0, 1, 0.4117647, 1,
-0.2152427, -0.1770266, -1.788335, 0, 1, 0.4196078, 1,
-0.2086428, -0.8965575, -3.01119, 0, 1, 0.4235294, 1,
-0.2084034, 0.4543127, 0.917406, 0, 1, 0.4313726, 1,
-0.202503, -0.8911518, -3.073396, 0, 1, 0.4352941, 1,
-0.2011746, 0.01555209, -2.874201, 0, 1, 0.4431373, 1,
-0.2009126, 0.1456142, -0.7374666, 0, 1, 0.4470588, 1,
-0.1933309, -1.91874, -3.364866, 0, 1, 0.454902, 1,
-0.1905449, -0.0742268, -1.589519, 0, 1, 0.4588235, 1,
-0.1900336, 1.30095, -1.592409, 0, 1, 0.4666667, 1,
-0.1889189, -1.157013, -2.759614, 0, 1, 0.4705882, 1,
-0.1888103, 1.719654, 0.04544324, 0, 1, 0.4784314, 1,
-0.1855471, 0.1471692, -0.7570116, 0, 1, 0.4823529, 1,
-0.1791386, -1.575593, -1.434985, 0, 1, 0.4901961, 1,
-0.1777895, -0.7808677, -4.953118, 0, 1, 0.4941176, 1,
-0.1771672, -0.1624231, -1.602778, 0, 1, 0.5019608, 1,
-0.1691129, 0.2094281, 0.5636339, 0, 1, 0.509804, 1,
-0.1634352, 0.5093407, -0.4821048, 0, 1, 0.5137255, 1,
-0.1624454, 0.3086314, -0.7159569, 0, 1, 0.5215687, 1,
-0.1567996, -0.8098679, -4.029, 0, 1, 0.5254902, 1,
-0.1564106, 1.657925, 0.03999071, 0, 1, 0.5333334, 1,
-0.1522249, -0.4456154, -4.638068, 0, 1, 0.5372549, 1,
-0.1497432, -0.8529759, -2.492066, 0, 1, 0.5450981, 1,
-0.1465657, -1.958138, -3.699002, 0, 1, 0.5490196, 1,
-0.1430592, 0.9461322, 0.7645296, 0, 1, 0.5568628, 1,
-0.1399455, 0.6286781, 0.7942217, 0, 1, 0.5607843, 1,
-0.1394847, -0.5716968, -2.586125, 0, 1, 0.5686275, 1,
-0.1380904, 1.380767, -1.842367, 0, 1, 0.572549, 1,
-0.1287381, 1.230467, 0.8169588, 0, 1, 0.5803922, 1,
-0.1276298, -0.2518465, -0.5704152, 0, 1, 0.5843138, 1,
-0.1248854, 0.3785986, 0.5095127, 0, 1, 0.5921569, 1,
-0.1240557, -0.05069783, -0.8497425, 0, 1, 0.5960785, 1,
-0.1156148, 0.7926546, -0.8955659, 0, 1, 0.6039216, 1,
-0.1146486, 0.4270547, -2.362654, 0, 1, 0.6117647, 1,
-0.1134827, -0.1708174, -2.886223, 0, 1, 0.6156863, 1,
-0.1056268, 0.3385656, 1.468596, 0, 1, 0.6235294, 1,
-0.1007109, -0.3281129, -4.481128, 0, 1, 0.627451, 1,
-0.1001075, 0.8416952, -1.963248, 0, 1, 0.6352941, 1,
-0.09755059, 1.853094, 0.8034014, 0, 1, 0.6392157, 1,
-0.09202128, 0.4565011, -0.5937277, 0, 1, 0.6470588, 1,
-0.09121656, 0.6570739, -0.305989, 0, 1, 0.6509804, 1,
-0.09079207, 1.620975, -0.4536581, 0, 1, 0.6588235, 1,
-0.08799199, 1.614025, -0.525117, 0, 1, 0.6627451, 1,
-0.08690163, 1.083863, 0.7320636, 0, 1, 0.6705883, 1,
-0.08647533, 0.9717956, -1.095706, 0, 1, 0.6745098, 1,
-0.0820383, -0.2220508, -3.550549, 0, 1, 0.682353, 1,
-0.08121868, -0.6584537, -2.88342, 0, 1, 0.6862745, 1,
-0.08027005, -0.5590105, -2.155982, 0, 1, 0.6941177, 1,
-0.08013947, 1.754821, -0.3911949, 0, 1, 0.7019608, 1,
-0.07966159, -1.181372, -3.243601, 0, 1, 0.7058824, 1,
-0.0663861, -1.172804, -1.949618, 0, 1, 0.7137255, 1,
-0.06444816, 0.369489, -0.2282878, 0, 1, 0.7176471, 1,
-0.06163853, -0.5835528, -3.449562, 0, 1, 0.7254902, 1,
-0.06124797, -0.8678552, -2.221686, 0, 1, 0.7294118, 1,
-0.05748469, 0.9089432, 0.4598714, 0, 1, 0.7372549, 1,
-0.05042225, -0.3203993, -2.90643, 0, 1, 0.7411765, 1,
-0.04905649, 0.6835271, -1.056565, 0, 1, 0.7490196, 1,
-0.04790298, 0.02280527, -0.4102035, 0, 1, 0.7529412, 1,
-0.04710039, 0.7827243, 0.6191016, 0, 1, 0.7607843, 1,
-0.04705957, 0.01075675, -2.635143, 0, 1, 0.7647059, 1,
-0.04595332, 0.3462198, -2.42857, 0, 1, 0.772549, 1,
-0.04536536, 0.2256893, 0.8482797, 0, 1, 0.7764706, 1,
-0.0445161, -1.985695, -4.219587, 0, 1, 0.7843137, 1,
-0.04035513, -0.5041353, -2.72917, 0, 1, 0.7882353, 1,
-0.03175354, -0.0936561, -2.711843, 0, 1, 0.7960784, 1,
-0.02958056, 1.560017, 1.40201, 0, 1, 0.8039216, 1,
-0.02291771, 1.672621, 1.740571, 0, 1, 0.8078431, 1,
-0.02153284, -0.04534921, -3.435468, 0, 1, 0.8156863, 1,
-0.02103491, -0.518003, -1.440476, 0, 1, 0.8196079, 1,
-0.0195986, 0.9381785, 0.1567609, 0, 1, 0.827451, 1,
-0.01957531, -0.2299105, -1.996405, 0, 1, 0.8313726, 1,
-0.01430552, 0.07471637, 1.171052, 0, 1, 0.8392157, 1,
-0.01219763, -0.179261, -2.021348, 0, 1, 0.8431373, 1,
-0.01051572, 1.065018, -1.010831, 0, 1, 0.8509804, 1,
-0.008977828, -1.326771, -3.302719, 0, 1, 0.854902, 1,
-0.005577519, -0.2603274, -3.364225, 0, 1, 0.8627451, 1,
-0.005365579, 0.198805, -2.108063, 0, 1, 0.8666667, 1,
-0.004217563, 0.377019, -0.4871983, 0, 1, 0.8745098, 1,
-0.002646927, 0.09801389, -2.263239, 0, 1, 0.8784314, 1,
0.0005354554, 0.6136315, 0.7516192, 0, 1, 0.8862745, 1,
0.003628375, 1.755958, -0.07494672, 0, 1, 0.8901961, 1,
0.01143339, -0.3771022, 2.475542, 0, 1, 0.8980392, 1,
0.01328591, -0.003426306, 2.698209, 0, 1, 0.9058824, 1,
0.01496664, 0.2138865, -0.8666654, 0, 1, 0.9098039, 1,
0.02424585, -0.9654282, 2.916232, 0, 1, 0.9176471, 1,
0.02927844, -0.3019791, 3.294574, 0, 1, 0.9215686, 1,
0.03298657, -1.556037, 4.58505, 0, 1, 0.9294118, 1,
0.03973532, 0.0972121, 1.367706, 0, 1, 0.9333333, 1,
0.04043679, -1.138974, 3.743623, 0, 1, 0.9411765, 1,
0.0440514, 0.4878426, 0.9244913, 0, 1, 0.945098, 1,
0.04874698, -0.09996966, 2.62071, 0, 1, 0.9529412, 1,
0.04973592, 0.8492287, -0.2213104, 0, 1, 0.9568627, 1,
0.05429085, -0.9252487, 3.519483, 0, 1, 0.9647059, 1,
0.05508176, -0.3382731, 2.561322, 0, 1, 0.9686275, 1,
0.0557034, 0.4815212, -1.131475, 0, 1, 0.9764706, 1,
0.05695313, -0.8781492, 3.380726, 0, 1, 0.9803922, 1,
0.05725648, -0.8603027, 4.290648, 0, 1, 0.9882353, 1,
0.05996473, -0.1633887, 2.56487, 0, 1, 0.9921569, 1,
0.06245765, -0.3381915, 3.358473, 0, 1, 1, 1,
0.0639846, 0.8412539, -0.5115953, 0, 0.9921569, 1, 1,
0.06463508, 2.925646, 0.05578635, 0, 0.9882353, 1, 1,
0.06894871, 0.03820177, 1.688729, 0, 0.9803922, 1, 1,
0.06930681, -0.08116621, 0.567607, 0, 0.9764706, 1, 1,
0.0711912, 0.9474898, 0.4091615, 0, 0.9686275, 1, 1,
0.07777189, -1.576297, 3.684942, 0, 0.9647059, 1, 1,
0.07825004, -0.3977866, 3.645771, 0, 0.9568627, 1, 1,
0.07918265, 0.08301586, -0.7097712, 0, 0.9529412, 1, 1,
0.0836065, -0.6042854, 3.484163, 0, 0.945098, 1, 1,
0.08614758, -0.03086773, 1.746076, 0, 0.9411765, 1, 1,
0.08739106, -0.4540677, 1.217688, 0, 0.9333333, 1, 1,
0.0948453, -0.9439923, 2.9999, 0, 0.9294118, 1, 1,
0.09806871, 0.8942637, 0.7584219, 0, 0.9215686, 1, 1,
0.1008915, -0.2184844, 3.342406, 0, 0.9176471, 1, 1,
0.1021048, -0.1713221, 2.365615, 0, 0.9098039, 1, 1,
0.1084479, -0.5073087, 3.69434, 0, 0.9058824, 1, 1,
0.1141189, -1.14106, 2.493455, 0, 0.8980392, 1, 1,
0.122471, 0.1116828, 0.5828422, 0, 0.8901961, 1, 1,
0.1226932, -1.893805, 2.315431, 0, 0.8862745, 1, 1,
0.1256289, 0.8342402, -0.1297563, 0, 0.8784314, 1, 1,
0.1265706, 1.817324, 0.5098351, 0, 0.8745098, 1, 1,
0.1269817, 2.00871, 0.2818076, 0, 0.8666667, 1, 1,
0.1335966, 0.8745348, -1.218767, 0, 0.8627451, 1, 1,
0.1365258, 0.3321465, -0.05574657, 0, 0.854902, 1, 1,
0.142671, 1.337343, -0.646591, 0, 0.8509804, 1, 1,
0.1474598, -0.7356802, 0.9306694, 0, 0.8431373, 1, 1,
0.1479431, 0.6885026, 1.235006, 0, 0.8392157, 1, 1,
0.1491311, -0.6727819, 3.892185, 0, 0.8313726, 1, 1,
0.1492997, 0.7022532, 0.5189355, 0, 0.827451, 1, 1,
0.151057, -0.2763187, 1.470261, 0, 0.8196079, 1, 1,
0.1522434, 1.555561, -1.297493, 0, 0.8156863, 1, 1,
0.1525395, 1.232183, 0.519421, 0, 0.8078431, 1, 1,
0.1527217, -0.2262567, 0.03678469, 0, 0.8039216, 1, 1,
0.1549692, -0.1982251, 2.378223, 0, 0.7960784, 1, 1,
0.1570469, -0.03823134, 1.306201, 0, 0.7882353, 1, 1,
0.1571693, -0.7602784, 3.455312, 0, 0.7843137, 1, 1,
0.1649033, 0.7558101, 0.2753229, 0, 0.7764706, 1, 1,
0.1661572, 1.173941, -0.5920104, 0, 0.772549, 1, 1,
0.1690948, 1.204311, -1.437364, 0, 0.7647059, 1, 1,
0.1706861, 0.07293244, 0.8216725, 0, 0.7607843, 1, 1,
0.1728471, 0.4523321, -1.034546, 0, 0.7529412, 1, 1,
0.1734416, 0.3518178, -1.012992, 0, 0.7490196, 1, 1,
0.175102, -0.6248213, 2.402039, 0, 0.7411765, 1, 1,
0.1764745, 0.8942361, 0.5136634, 0, 0.7372549, 1, 1,
0.1784236, 0.9510433, 0.985342, 0, 0.7294118, 1, 1,
0.1790404, -0.1151627, 3.043786, 0, 0.7254902, 1, 1,
0.1819881, -0.7140728, 3.306809, 0, 0.7176471, 1, 1,
0.1857277, 0.2796202, -0.2441494, 0, 0.7137255, 1, 1,
0.1873567, 0.5261403, 2.715247, 0, 0.7058824, 1, 1,
0.188814, -0.3652252, 3.295161, 0, 0.6980392, 1, 1,
0.1903727, 1.223963, 0.821326, 0, 0.6941177, 1, 1,
0.1920709, 0.6083717, 0.05644703, 0, 0.6862745, 1, 1,
0.197609, -0.8641479, 2.700684, 0, 0.682353, 1, 1,
0.2021551, -2.204338, 3.273793, 0, 0.6745098, 1, 1,
0.2068392, -1.69711, 3.040217, 0, 0.6705883, 1, 1,
0.2112755, 1.077688, 0.6195134, 0, 0.6627451, 1, 1,
0.2138753, 0.616081, 1.235636, 0, 0.6588235, 1, 1,
0.2139107, 1.9433, 1.136995, 0, 0.6509804, 1, 1,
0.2140778, 0.2796001, 1.267122, 0, 0.6470588, 1, 1,
0.2149975, 0.0619281, 1.248621, 0, 0.6392157, 1, 1,
0.2160422, 0.1316134, 0.9185433, 0, 0.6352941, 1, 1,
0.2173495, -0.01255467, 0.6505306, 0, 0.627451, 1, 1,
0.219439, -0.5308268, 3.533744, 0, 0.6235294, 1, 1,
0.2216229, -1.737642, 2.64438, 0, 0.6156863, 1, 1,
0.222278, 0.6378219, 0.2744352, 0, 0.6117647, 1, 1,
0.2284306, 0.9288622, 0.985752, 0, 0.6039216, 1, 1,
0.2293794, 2.43297, -1.480811, 0, 0.5960785, 1, 1,
0.2322093, 0.4582616, 1.687692, 0, 0.5921569, 1, 1,
0.2326506, -0.4390871, 2.001116, 0, 0.5843138, 1, 1,
0.2347918, 1.281325, -1.058963, 0, 0.5803922, 1, 1,
0.238349, -0.1245514, 2.550431, 0, 0.572549, 1, 1,
0.2384755, -0.6723756, 2.375838, 0, 0.5686275, 1, 1,
0.2393313, -0.8810567, 3.289444, 0, 0.5607843, 1, 1,
0.2400025, 0.3391868, -0.1571592, 0, 0.5568628, 1, 1,
0.2428707, -0.4730187, 2.654243, 0, 0.5490196, 1, 1,
0.2436589, -1.090666, 2.186227, 0, 0.5450981, 1, 1,
0.243688, 0.1047161, 0.2819853, 0, 0.5372549, 1, 1,
0.2443276, -0.4385342, 2.83604, 0, 0.5333334, 1, 1,
0.2475261, 1.397983, -0.7089818, 0, 0.5254902, 1, 1,
0.247684, 0.7147999, 1.168049, 0, 0.5215687, 1, 1,
0.2491617, -0.4724838, 2.625567, 0, 0.5137255, 1, 1,
0.2492804, -0.3506757, 0.44053, 0, 0.509804, 1, 1,
0.2525817, -0.7030726, 2.538681, 0, 0.5019608, 1, 1,
0.2536845, 1.455249, 1.078048, 0, 0.4941176, 1, 1,
0.2554707, 0.1977651, 0.9129171, 0, 0.4901961, 1, 1,
0.2608118, -0.848527, 2.856771, 0, 0.4823529, 1, 1,
0.2612824, 1.506576, 1.55263, 0, 0.4784314, 1, 1,
0.262567, 0.712279, 0.6111176, 0, 0.4705882, 1, 1,
0.2657352, -0.6665846, 2.430774, 0, 0.4666667, 1, 1,
0.2671583, 0.6169791, -0.1521736, 0, 0.4588235, 1, 1,
0.2737536, -0.8533204, 3.808829, 0, 0.454902, 1, 1,
0.2753707, 0.7998426, 1.524785, 0, 0.4470588, 1, 1,
0.2789758, -0.8529222, 2.595244, 0, 0.4431373, 1, 1,
0.281083, -0.7638111, 3.095209, 0, 0.4352941, 1, 1,
0.2818841, 0.01999422, 1.938476, 0, 0.4313726, 1, 1,
0.2871394, -0.8484224, 3.604873, 0, 0.4235294, 1, 1,
0.2898031, -0.5611547, 3.084898, 0, 0.4196078, 1, 1,
0.2970855, -0.005011629, 2.00985, 0, 0.4117647, 1, 1,
0.2977511, -1.040752, 1.881284, 0, 0.4078431, 1, 1,
0.304823, 0.2110521, 0.8698971, 0, 0.4, 1, 1,
0.3137253, 0.5102495, 0.07173592, 0, 0.3921569, 1, 1,
0.3151631, 1.966591, -0.4684204, 0, 0.3882353, 1, 1,
0.3161623, 0.3019942, 0.769055, 0, 0.3803922, 1, 1,
0.3182933, -0.498456, 3.031374, 0, 0.3764706, 1, 1,
0.3247384, 1.082222, 0.3801087, 0, 0.3686275, 1, 1,
0.3255233, -1.124788, 0.9934911, 0, 0.3647059, 1, 1,
0.3303955, 0.7809474, 0.4321236, 0, 0.3568628, 1, 1,
0.332537, -2.71762, 3.816657, 0, 0.3529412, 1, 1,
0.333874, 0.05804137, 2.102442, 0, 0.345098, 1, 1,
0.3395663, -1.016948, 1.334981, 0, 0.3411765, 1, 1,
0.3450733, -0.01647397, 0.3246076, 0, 0.3333333, 1, 1,
0.3492162, -0.3047736, 0.2087293, 0, 0.3294118, 1, 1,
0.352655, -0.0657552, 0.9959554, 0, 0.3215686, 1, 1,
0.3527657, -2.75304, 3.199439, 0, 0.3176471, 1, 1,
0.3614752, 0.3730466, 1.69203, 0, 0.3098039, 1, 1,
0.3659925, -0.944762, 3.698538, 0, 0.3058824, 1, 1,
0.3718868, -1.308884, 4.050096, 0, 0.2980392, 1, 1,
0.3724792, 0.9326732, 2.350165, 0, 0.2901961, 1, 1,
0.3811795, -0.9523147, 1.026596, 0, 0.2862745, 1, 1,
0.3855368, -0.2572466, 1.575987, 0, 0.2784314, 1, 1,
0.3872495, -0.5667058, 2.542551, 0, 0.2745098, 1, 1,
0.3875328, 0.7575023, -0.6697905, 0, 0.2666667, 1, 1,
0.3887753, 0.9764799, 0.5507103, 0, 0.2627451, 1, 1,
0.3905328, 0.1441941, 2.029955, 0, 0.254902, 1, 1,
0.3906788, 0.0132042, 0.8395032, 0, 0.2509804, 1, 1,
0.3944148, 0.2393738, 2.200187, 0, 0.2431373, 1, 1,
0.3955459, -0.9464136, 3.51719, 0, 0.2392157, 1, 1,
0.4035905, 0.1026028, 1.811639, 0, 0.2313726, 1, 1,
0.4063679, 0.0789855, 1.601223, 0, 0.227451, 1, 1,
0.4090366, 1.104298, 1.535696, 0, 0.2196078, 1, 1,
0.4098816, -1.557468, 1.690117, 0, 0.2156863, 1, 1,
0.4099207, -0.8587129, 3.793283, 0, 0.2078431, 1, 1,
0.4121588, 0.08448518, 1.551873, 0, 0.2039216, 1, 1,
0.4122223, 0.2402513, 2.258734, 0, 0.1960784, 1, 1,
0.4141947, -0.755628, 1.859612, 0, 0.1882353, 1, 1,
0.4147353, 0.6657849, 1.990873, 0, 0.1843137, 1, 1,
0.4170738, 0.1645569, 2.404095, 0, 0.1764706, 1, 1,
0.4212354, 0.6853777, 1.927084, 0, 0.172549, 1, 1,
0.4225211, 0.2640549, 2.231469, 0, 0.1647059, 1, 1,
0.4232141, -0.09319225, 2.389426, 0, 0.1607843, 1, 1,
0.4310325, 1.582313, 0.8521857, 0, 0.1529412, 1, 1,
0.4313909, 1.182862, -2.162716, 0, 0.1490196, 1, 1,
0.4335594, -1.393593, 3.35239, 0, 0.1411765, 1, 1,
0.4352042, 0.6459678, 1.590548, 0, 0.1372549, 1, 1,
0.439875, -0.9787781, 3.058563, 0, 0.1294118, 1, 1,
0.4514535, -0.7977771, 3.462957, 0, 0.1254902, 1, 1,
0.45329, 0.1289488, 1.704848, 0, 0.1176471, 1, 1,
0.4593547, -1.527177, 2.335515, 0, 0.1137255, 1, 1,
0.4620873, -1.192274, 3.593559, 0, 0.1058824, 1, 1,
0.4667909, -0.6696405, 3.819691, 0, 0.09803922, 1, 1,
0.4715177, 0.8681837, 0.905512, 0, 0.09411765, 1, 1,
0.4717826, 0.6454606, 1.761511, 0, 0.08627451, 1, 1,
0.4729147, 0.4772494, 1.560905, 0, 0.08235294, 1, 1,
0.4741157, 0.3680081, -0.6276708, 0, 0.07450981, 1, 1,
0.4742067, -0.2136136, 2.435244, 0, 0.07058824, 1, 1,
0.4747285, -0.9713663, 2.05444, 0, 0.0627451, 1, 1,
0.475835, -0.8472954, 3.589354, 0, 0.05882353, 1, 1,
0.477542, 0.3033652, 1.152297, 0, 0.05098039, 1, 1,
0.4836349, -0.02673068, 2.352233, 0, 0.04705882, 1, 1,
0.4853049, -0.566875, 0.679019, 0, 0.03921569, 1, 1,
0.4870476, -0.7487233, 2.385177, 0, 0.03529412, 1, 1,
0.4907143, -1.114353, 2.078296, 0, 0.02745098, 1, 1,
0.491239, 0.9249286, 0.7900498, 0, 0.02352941, 1, 1,
0.4959269, -0.1365403, 3.330438, 0, 0.01568628, 1, 1,
0.4975884, 0.8031322, 0.9310144, 0, 0.01176471, 1, 1,
0.500146, -1.417166, 3.449322, 0, 0.003921569, 1, 1,
0.5013404, 0.2968429, 1.08563, 0.003921569, 0, 1, 1,
0.5015911, -0.1822647, -0.8022987, 0.007843138, 0, 1, 1,
0.5087739, 0.2612341, 0.5908179, 0.01568628, 0, 1, 1,
0.5105882, 0.5208537, 1.132711, 0.01960784, 0, 1, 1,
0.5137242, -1.416682, 2.710637, 0.02745098, 0, 1, 1,
0.5162875, 0.09908315, 2.677441, 0.03137255, 0, 1, 1,
0.5170802, -0.145462, 1.36439, 0.03921569, 0, 1, 1,
0.519991, 0.3394252, 3.337604, 0.04313726, 0, 1, 1,
0.5205299, 0.2566459, 0.3873934, 0.05098039, 0, 1, 1,
0.5236277, -0.9869003, 2.166186, 0.05490196, 0, 1, 1,
0.5244332, 0.06213205, 3.249682, 0.0627451, 0, 1, 1,
0.525852, 1.274301, -0.696501, 0.06666667, 0, 1, 1,
0.5268252, 0.2980476, 0.03757499, 0.07450981, 0, 1, 1,
0.5312635, -1.408989, 4.285956, 0.07843138, 0, 1, 1,
0.5353523, 2.003439, -1.112666, 0.08627451, 0, 1, 1,
0.5371894, -0.9814472, 4.509543, 0.09019608, 0, 1, 1,
0.5371994, -0.4152492, 2.26986, 0.09803922, 0, 1, 1,
0.5381643, -0.660297, 1.834857, 0.1058824, 0, 1, 1,
0.539806, 1.50183, 2.436844, 0.1098039, 0, 1, 1,
0.5420241, -1.259338, 1.421804, 0.1176471, 0, 1, 1,
0.5452567, -0.3743219, 2.082205, 0.1215686, 0, 1, 1,
0.5493748, 0.06576151, 1.574983, 0.1294118, 0, 1, 1,
0.5548942, -1.224028, 1.493742, 0.1333333, 0, 1, 1,
0.5607172, -0.08011919, 1.209094, 0.1411765, 0, 1, 1,
0.5655581, -2.289306, 1.934234, 0.145098, 0, 1, 1,
0.5739441, 1.347613, 0.2834606, 0.1529412, 0, 1, 1,
0.5759132, 1.154145, -0.4844206, 0.1568628, 0, 1, 1,
0.5767847, 0.123599, -0.58878, 0.1647059, 0, 1, 1,
0.5781247, 0.7847917, 1.159624, 0.1686275, 0, 1, 1,
0.5784096, -0.7305898, 3.29757, 0.1764706, 0, 1, 1,
0.5803899, -1.381973, 2.885092, 0.1803922, 0, 1, 1,
0.5838108, -0.7115921, 4.742616, 0.1882353, 0, 1, 1,
0.5847222, 1.007396, 0.4332638, 0.1921569, 0, 1, 1,
0.5851119, -0.8814125, 2.294153, 0.2, 0, 1, 1,
0.587501, -2.136292, 2.543821, 0.2078431, 0, 1, 1,
0.5877631, 0.7887402, -1.587984, 0.2117647, 0, 1, 1,
0.5945809, -0.4572744, 3.694737, 0.2196078, 0, 1, 1,
0.6015097, 0.9571161, 1.938691, 0.2235294, 0, 1, 1,
0.6044833, 0.8534196, 0.4060643, 0.2313726, 0, 1, 1,
0.6120769, 0.9842539, -0.02131434, 0.2352941, 0, 1, 1,
0.6128945, -0.1697956, 2.31955, 0.2431373, 0, 1, 1,
0.6138588, 0.7465842, 1.301345, 0.2470588, 0, 1, 1,
0.616792, 0.8992965, 1.244466, 0.254902, 0, 1, 1,
0.6196665, 1.426346, 0.7547486, 0.2588235, 0, 1, 1,
0.6249524, 2.231154, 0.04762754, 0.2666667, 0, 1, 1,
0.6250734, 0.935507, 1.918045, 0.2705882, 0, 1, 1,
0.6264384, -1.128628, 3.257166, 0.2784314, 0, 1, 1,
0.6326184, -0.5670162, 1.520641, 0.282353, 0, 1, 1,
0.6454477, -0.8446357, 0.8735685, 0.2901961, 0, 1, 1,
0.6457298, -0.8917827, 2.126448, 0.2941177, 0, 1, 1,
0.6540374, 1.733564, -0.939205, 0.3019608, 0, 1, 1,
0.6542426, 0.8472814, 0.711967, 0.3098039, 0, 1, 1,
0.6627036, -1.553126, 3.658736, 0.3137255, 0, 1, 1,
0.6638333, -0.5306949, 0.5169006, 0.3215686, 0, 1, 1,
0.6645691, -1.320923, 4.095426, 0.3254902, 0, 1, 1,
0.6687108, 0.4608916, 0.9337585, 0.3333333, 0, 1, 1,
0.6714098, 1.132444, -0.2596173, 0.3372549, 0, 1, 1,
0.6718836, -0.7428616, 2.052986, 0.345098, 0, 1, 1,
0.6720333, 2.411689, 1.436878, 0.3490196, 0, 1, 1,
0.6738625, -0.7477889, 2.791314, 0.3568628, 0, 1, 1,
0.690366, -1.857962, 1.410515, 0.3607843, 0, 1, 1,
0.691195, 0.1226178, 2.253802, 0.3686275, 0, 1, 1,
0.6926041, 1.15626, 0.4864369, 0.372549, 0, 1, 1,
0.6931224, 0.08616219, 1.524319, 0.3803922, 0, 1, 1,
0.6953515, 0.2350935, 1.882772, 0.3843137, 0, 1, 1,
0.7022658, 0.3199997, 1.128215, 0.3921569, 0, 1, 1,
0.7045168, -0.7718349, 2.228387, 0.3960784, 0, 1, 1,
0.704572, -1.62353, 4.05052, 0.4039216, 0, 1, 1,
0.706608, 0.05972303, 1.451842, 0.4117647, 0, 1, 1,
0.7077249, 0.8693752, -0.8451932, 0.4156863, 0, 1, 1,
0.7092267, 1.047813, 1.029601, 0.4235294, 0, 1, 1,
0.7105354, -0.5245278, 0.2547157, 0.427451, 0, 1, 1,
0.7208194, 0.2345264, -0.3725899, 0.4352941, 0, 1, 1,
0.7210609, -0.07295916, 3.892192, 0.4392157, 0, 1, 1,
0.7212698, -1.060344, 2.865127, 0.4470588, 0, 1, 1,
0.7225661, 0.1704843, 1.15243, 0.4509804, 0, 1, 1,
0.7225999, -1.458919, 2.14963, 0.4588235, 0, 1, 1,
0.7265834, -2.038919, 1.635633, 0.4627451, 0, 1, 1,
0.7276315, 2.018358, 0.5081992, 0.4705882, 0, 1, 1,
0.7277014, 0.722037, 0.2628811, 0.4745098, 0, 1, 1,
0.7277921, -0.975347, 2.559011, 0.4823529, 0, 1, 1,
0.7374638, -1.221641, 3.643572, 0.4862745, 0, 1, 1,
0.7391578, 0.3869324, 0.8211836, 0.4941176, 0, 1, 1,
0.7401057, 1.051828, 1.780397, 0.5019608, 0, 1, 1,
0.7449769, 1.189959, -0.3460284, 0.5058824, 0, 1, 1,
0.746002, -0.4808323, 1.668021, 0.5137255, 0, 1, 1,
0.7469233, 0.1734077, 0.989552, 0.5176471, 0, 1, 1,
0.7554884, 1.129002, 0.4570693, 0.5254902, 0, 1, 1,
0.7589684, 1.69364, -0.2162357, 0.5294118, 0, 1, 1,
0.7598863, -0.2247929, 1.395935, 0.5372549, 0, 1, 1,
0.762106, -0.2548826, 2.114633, 0.5411765, 0, 1, 1,
0.7676561, -0.6360036, 2.332103, 0.5490196, 0, 1, 1,
0.767842, 1.735729, 0.001188059, 0.5529412, 0, 1, 1,
0.7694478, 1.042289, 1.036036, 0.5607843, 0, 1, 1,
0.7705459, 0.3456991, 1.779956, 0.5647059, 0, 1, 1,
0.7751912, 0.4749137, 2.574091, 0.572549, 0, 1, 1,
0.779878, -0.05766174, -0.1309235, 0.5764706, 0, 1, 1,
0.7811435, 1.799452, 0.1190095, 0.5843138, 0, 1, 1,
0.7861603, 0.9272624, 2.254545, 0.5882353, 0, 1, 1,
0.7890297, -0.2021786, 2.29441, 0.5960785, 0, 1, 1,
0.7941084, -1.423827, 4.570045, 0.6039216, 0, 1, 1,
0.7973211, -0.9517479, 3.285189, 0.6078432, 0, 1, 1,
0.7994316, -0.1490428, 2.028654, 0.6156863, 0, 1, 1,
0.8011135, 0.5096316, 2.240047, 0.6196079, 0, 1, 1,
0.8110735, -0.3967208, 3.046493, 0.627451, 0, 1, 1,
0.814772, -0.3950894, 0.549961, 0.6313726, 0, 1, 1,
0.8191516, 0.8671594, 0.105124, 0.6392157, 0, 1, 1,
0.8197539, 0.3291787, 1.603704, 0.6431373, 0, 1, 1,
0.8216767, -1.350977, -0.06580351, 0.6509804, 0, 1, 1,
0.8324992, 0.3908066, 1.769109, 0.654902, 0, 1, 1,
0.8372284, 0.4514403, 2.371897, 0.6627451, 0, 1, 1,
0.8465034, -1.717642, 2.169284, 0.6666667, 0, 1, 1,
0.8476523, -0.7805035, 2.766775, 0.6745098, 0, 1, 1,
0.8481649, 0.3057673, 0.2892284, 0.6784314, 0, 1, 1,
0.8486222, -1.402931, 1.9084, 0.6862745, 0, 1, 1,
0.8520584, 1.580989, -1.18357, 0.6901961, 0, 1, 1,
0.854206, 0.5979329, 0.4872252, 0.6980392, 0, 1, 1,
0.8572497, 0.7675731, 0.1186634, 0.7058824, 0, 1, 1,
0.8592493, -1.213196, 1.514489, 0.7098039, 0, 1, 1,
0.8627141, -0.1226691, 2.341499, 0.7176471, 0, 1, 1,
0.8643913, 0.4601108, 1.718601, 0.7215686, 0, 1, 1,
0.8651803, 0.4408885, 1.274393, 0.7294118, 0, 1, 1,
0.8686458, 0.2204601, 1.857362, 0.7333333, 0, 1, 1,
0.8843733, 0.4037928, 0.947212, 0.7411765, 0, 1, 1,
0.8845615, -0.5099552, 1.045865, 0.7450981, 0, 1, 1,
0.8859429, -1.937956, 2.397641, 0.7529412, 0, 1, 1,
0.8866921, -0.4308979, 2.035835, 0.7568628, 0, 1, 1,
0.888105, 0.1690655, 1.889802, 0.7647059, 0, 1, 1,
0.8917674, 2.039315, 0.8823767, 0.7686275, 0, 1, 1,
0.8988877, 1.20461, 1.445184, 0.7764706, 0, 1, 1,
0.9026011, -1.225232, 2.601598, 0.7803922, 0, 1, 1,
0.9039859, 1.846036, 0.3950688, 0.7882353, 0, 1, 1,
0.9059461, -0.05449029, -0.7756019, 0.7921569, 0, 1, 1,
0.9082232, -0.7149758, 2.1841, 0.8, 0, 1, 1,
0.9102501, 0.5919138, 1.432079, 0.8078431, 0, 1, 1,
0.912001, 0.2694453, 1.843061, 0.8117647, 0, 1, 1,
0.9136668, -1.310833, 1.120095, 0.8196079, 0, 1, 1,
0.9211762, -0.3867283, 2.007038, 0.8235294, 0, 1, 1,
0.9220127, -0.130851, 2.300482, 0.8313726, 0, 1, 1,
0.9240724, 1.112021, 2.051114, 0.8352941, 0, 1, 1,
0.9279099, -1.553615, 2.32917, 0.8431373, 0, 1, 1,
0.9329453, -1.209499, 1.606438, 0.8470588, 0, 1, 1,
0.9349419, 0.5760361, 1.616644, 0.854902, 0, 1, 1,
0.9416292, 0.1425479, 1.591898, 0.8588235, 0, 1, 1,
0.942182, 0.6529364, 0.4342599, 0.8666667, 0, 1, 1,
0.9501321, 0.2397234, 1.947755, 0.8705882, 0, 1, 1,
0.960193, 0.2110253, 3.312879, 0.8784314, 0, 1, 1,
0.9611615, 0.006036353, 1.958243, 0.8823529, 0, 1, 1,
0.9616494, -0.8020828, 1.995024, 0.8901961, 0, 1, 1,
0.9650542, -0.354532, 0.287598, 0.8941177, 0, 1, 1,
0.9744021, 0.06619624, 2.273525, 0.9019608, 0, 1, 1,
0.9768329, -0.5650494, 4.083479, 0.9098039, 0, 1, 1,
0.9805689, -0.4027919, 1.862986, 0.9137255, 0, 1, 1,
0.9808154, 0.1529938, 1.320423, 0.9215686, 0, 1, 1,
0.9818491, 0.2598946, 1.618624, 0.9254902, 0, 1, 1,
0.9842011, 1.192333, 3.398725, 0.9333333, 0, 1, 1,
0.9867968, 1.227187, 2.109771, 0.9372549, 0, 1, 1,
0.9872161, -1.798905, 3.377831, 0.945098, 0, 1, 1,
0.9881921, 0.4754036, 2.74933, 0.9490196, 0, 1, 1,
0.999374, 0.04985629, 0.8301266, 0.9568627, 0, 1, 1,
1.009098, -1.039494, 2.61868, 0.9607843, 0, 1, 1,
1.011292, -0.55339, 2.929969, 0.9686275, 0, 1, 1,
1.011393, -1.044924, 0.9210711, 0.972549, 0, 1, 1,
1.011835, -1.665657, 1.360857, 0.9803922, 0, 1, 1,
1.016582, 0.8432031, 0.7464621, 0.9843137, 0, 1, 1,
1.016717, -1.465368, 2.14826, 0.9921569, 0, 1, 1,
1.019487, 0.240133, 0.5606989, 0.9960784, 0, 1, 1,
1.021059, 0.2457013, 2.424723, 1, 0, 0.9960784, 1,
1.023509, -0.1271984, 1.052409, 1, 0, 0.9882353, 1,
1.033173, -0.9078519, 1.676686, 1, 0, 0.9843137, 1,
1.034006, -0.5143412, -0.3691999, 1, 0, 0.9764706, 1,
1.041767, -0.7449796, 1.550952, 1, 0, 0.972549, 1,
1.043602, 1.164499, 2.07662, 1, 0, 0.9647059, 1,
1.051899, 0.966821, 2.287466, 1, 0, 0.9607843, 1,
1.069528, 2.294467, 0.8212856, 1, 0, 0.9529412, 1,
1.071221, 1.169888, 0.6971816, 1, 0, 0.9490196, 1,
1.071427, 1.523079, -0.3218873, 1, 0, 0.9411765, 1,
1.077777, 0.1917256, 1.341728, 1, 0, 0.9372549, 1,
1.079971, 0.1968867, 0.6348931, 1, 0, 0.9294118, 1,
1.08228, 1.491926, -0.5586672, 1, 0, 0.9254902, 1,
1.082793, -1.215014, 2.507642, 1, 0, 0.9176471, 1,
1.085644, 0.7198078, 2.874639, 1, 0, 0.9137255, 1,
1.086376, 0.2389704, 1.021743, 1, 0, 0.9058824, 1,
1.087387, 1.174403, 0.9608086, 1, 0, 0.9019608, 1,
1.094617, 0.3343508, 0.6812217, 1, 0, 0.8941177, 1,
1.09882, 0.1785342, 0.16569, 1, 0, 0.8862745, 1,
1.099755, -1.078546, 2.138103, 1, 0, 0.8823529, 1,
1.100454, 0.9881662, 0.4260293, 1, 0, 0.8745098, 1,
1.105029, -0.9885489, 1.745806, 1, 0, 0.8705882, 1,
1.108084, 1.3079, 0.09444851, 1, 0, 0.8627451, 1,
1.109761, 0.8209471, 0.9879419, 1, 0, 0.8588235, 1,
1.11232, -0.5154831, 1.738056, 1, 0, 0.8509804, 1,
1.117607, 1.22558, 1.582253, 1, 0, 0.8470588, 1,
1.128542, 0.6845723, 1.615377, 1, 0, 0.8392157, 1,
1.130994, 0.2357421, 1.52113, 1, 0, 0.8352941, 1,
1.134252, 0.7164479, 0.2461532, 1, 0, 0.827451, 1,
1.134578, -2.693542, 0.9786921, 1, 0, 0.8235294, 1,
1.138266, 0.9173475, -0.7506722, 1, 0, 0.8156863, 1,
1.143483, 0.177151, 1.140666, 1, 0, 0.8117647, 1,
1.166891, 0.3928112, 0.8330931, 1, 0, 0.8039216, 1,
1.172309, -0.1879519, 2.769629, 1, 0, 0.7960784, 1,
1.173404, -0.07447957, 2.175481, 1, 0, 0.7921569, 1,
1.175645, -0.4688384, 2.234692, 1, 0, 0.7843137, 1,
1.181975, 0.08484308, 1.661559, 1, 0, 0.7803922, 1,
1.182257, -0.6453345, 3.539217, 1, 0, 0.772549, 1,
1.188288, 0.6322536, 0.8885461, 1, 0, 0.7686275, 1,
1.18848, 0.5602109, 0.9665058, 1, 0, 0.7607843, 1,
1.190493, -0.8871441, 1.91921, 1, 0, 0.7568628, 1,
1.197551, 1.188322, 1.323658, 1, 0, 0.7490196, 1,
1.203567, -0.2540519, -0.6425434, 1, 0, 0.7450981, 1,
1.207105, -1.311407, 0.6511068, 1, 0, 0.7372549, 1,
1.220748, 2.361336, 0.674087, 1, 0, 0.7333333, 1,
1.23223, -0.3349357, 1.033751, 1, 0, 0.7254902, 1,
1.232689, 1.555488, 1.123286, 1, 0, 0.7215686, 1,
1.233929, -0.009646047, 2.700498, 1, 0, 0.7137255, 1,
1.235833, -0.9871169, 3.110928, 1, 0, 0.7098039, 1,
1.236811, 0.7653239, 0.4680651, 1, 0, 0.7019608, 1,
1.243455, -0.8379177, 0.7281932, 1, 0, 0.6941177, 1,
1.246275, -0.04269309, 1.778566, 1, 0, 0.6901961, 1,
1.247008, -0.5982636, 1.968022, 1, 0, 0.682353, 1,
1.25778, 0.4785152, 0.7677752, 1, 0, 0.6784314, 1,
1.259402, -0.4725397, 1.825081, 1, 0, 0.6705883, 1,
1.275296, -0.6020342, 0.8218943, 1, 0, 0.6666667, 1,
1.278361, -0.6579074, 2.073858, 1, 0, 0.6588235, 1,
1.283196, -0.009539521, 3.070889, 1, 0, 0.654902, 1,
1.28444, -0.8145633, 3.406745, 1, 0, 0.6470588, 1,
1.285228, 0.170788, 0.5245195, 1, 0, 0.6431373, 1,
1.287811, -0.611372, 1.235162, 1, 0, 0.6352941, 1,
1.296601, -0.2168336, 2.025426, 1, 0, 0.6313726, 1,
1.297889, 1.499908, 0.6130524, 1, 0, 0.6235294, 1,
1.316565, 0.01713214, 2.07038, 1, 0, 0.6196079, 1,
1.319291, 0.1991024, 1.14971, 1, 0, 0.6117647, 1,
1.326385, 0.7267498, 0.2450611, 1, 0, 0.6078432, 1,
1.330182, -0.5851025, 1.90083, 1, 0, 0.6, 1,
1.339265, 0.6992737, 1.446217, 1, 0, 0.5921569, 1,
1.356304, 0.8715644, 0.3353256, 1, 0, 0.5882353, 1,
1.356376, -1.458499, 1.383651, 1, 0, 0.5803922, 1,
1.358598, 0.0366853, 3.658559, 1, 0, 0.5764706, 1,
1.366764, -0.8552635, 3.883696, 1, 0, 0.5686275, 1,
1.371839, -1.995084, 2.431879, 1, 0, 0.5647059, 1,
1.382598, -0.04151316, 2.384156, 1, 0, 0.5568628, 1,
1.383318, 0.2514714, 2.827199, 1, 0, 0.5529412, 1,
1.390355, -1.505369, 2.728715, 1, 0, 0.5450981, 1,
1.401343, -0.5900763, 2.228935, 1, 0, 0.5411765, 1,
1.424167, 0.6853207, 1.250702, 1, 0, 0.5333334, 1,
1.424605, 0.6970168, -0.5894435, 1, 0, 0.5294118, 1,
1.434007, 0.5794798, 1.679791, 1, 0, 0.5215687, 1,
1.43909, -0.1226008, -0.4591693, 1, 0, 0.5176471, 1,
1.444276, -0.7036167, 1.380927, 1, 0, 0.509804, 1,
1.46069, 1.546007, 0.176537, 1, 0, 0.5058824, 1,
1.465445, 0.001851431, 2.145172, 1, 0, 0.4980392, 1,
1.465963, -1.260609, 2.315331, 1, 0, 0.4901961, 1,
1.47167, -0.2114347, 1.559182, 1, 0, 0.4862745, 1,
1.477557, 0.625002, -0.1332752, 1, 0, 0.4784314, 1,
1.47774, 1.431134, 1.457347, 1, 0, 0.4745098, 1,
1.478836, 0.889366, -0.1115909, 1, 0, 0.4666667, 1,
1.481084, -1.278968, 1.181772, 1, 0, 0.4627451, 1,
1.482636, 0.1775312, -0.6740823, 1, 0, 0.454902, 1,
1.496323, -1.607148, 3.653069, 1, 0, 0.4509804, 1,
1.50311, 1.055781, 0.8166763, 1, 0, 0.4431373, 1,
1.506959, -0.1266717, 1.953964, 1, 0, 0.4392157, 1,
1.525601, 1.790324, 1.152116, 1, 0, 0.4313726, 1,
1.530172, 0.06904715, 0.4171233, 1, 0, 0.427451, 1,
1.535869, 0.3802904, 1.316184, 1, 0, 0.4196078, 1,
1.539394, 0.2267878, 3.270207, 1, 0, 0.4156863, 1,
1.555155, 0.1547655, 1.238754, 1, 0, 0.4078431, 1,
1.557841, 0.919058, 1.129031, 1, 0, 0.4039216, 1,
1.562725, 1.24882, 0.7775187, 1, 0, 0.3960784, 1,
1.565285, -0.7650774, 2.494744, 1, 0, 0.3882353, 1,
1.566876, -0.5663904, 0.8641106, 1, 0, 0.3843137, 1,
1.574752, -0.5768864, 2.790267, 1, 0, 0.3764706, 1,
1.586228, 1.006526, 3.049992, 1, 0, 0.372549, 1,
1.591737, -0.2228751, 1.335516, 1, 0, 0.3647059, 1,
1.600429, -1.004887, 1.755423, 1, 0, 0.3607843, 1,
1.600641, 1.127394, 0.7418317, 1, 0, 0.3529412, 1,
1.602137, -0.6774932, 1.521344, 1, 0, 0.3490196, 1,
1.616658, 1.64865, 0.264044, 1, 0, 0.3411765, 1,
1.617998, 0.7073349, 0.832493, 1, 0, 0.3372549, 1,
1.623355, -0.6397181, 2.106522, 1, 0, 0.3294118, 1,
1.630724, 0.3321544, 1.796379, 1, 0, 0.3254902, 1,
1.651756, 1.466788, 1.586469, 1, 0, 0.3176471, 1,
1.663722, 0.6048062, 1.909922, 1, 0, 0.3137255, 1,
1.667878, -0.3174804, 1.667956, 1, 0, 0.3058824, 1,
1.669326, -1.321769, 2.682337, 1, 0, 0.2980392, 1,
1.67018, 0.84487, 0.7282817, 1, 0, 0.2941177, 1,
1.693653, -1.207101, 3.176819, 1, 0, 0.2862745, 1,
1.694356, 0.1070849, 2.305073, 1, 0, 0.282353, 1,
1.706234, -0.2858902, 3.220927, 1, 0, 0.2745098, 1,
1.713464, 0.6855785, -1.13115, 1, 0, 0.2705882, 1,
1.714066, -0.4780345, 3.831198, 1, 0, 0.2627451, 1,
1.721345, 1.169144, 0.6721392, 1, 0, 0.2588235, 1,
1.721448, 0.2144772, 2.362379, 1, 0, 0.2509804, 1,
1.747741, 0.6815224, 0.4257554, 1, 0, 0.2470588, 1,
1.749941, 0.3759118, 0.8125343, 1, 0, 0.2392157, 1,
1.772156, -0.3766997, 0.9187036, 1, 0, 0.2352941, 1,
1.779785, -1.361375, 3.850841, 1, 0, 0.227451, 1,
1.781026, -1.413735, 0.9911718, 1, 0, 0.2235294, 1,
1.791801, -1.012508, 4.383026, 1, 0, 0.2156863, 1,
1.800649, -0.5861704, 3.411053, 1, 0, 0.2117647, 1,
1.812222, 0.5868902, 2.352993, 1, 0, 0.2039216, 1,
1.818226, 1.620909, 0.8899547, 1, 0, 0.1960784, 1,
1.82993, -0.3004227, 1.682127, 1, 0, 0.1921569, 1,
1.85045, 0.09030579, 0.6422544, 1, 0, 0.1843137, 1,
1.886565, 0.5130111, 1.315356, 1, 0, 0.1803922, 1,
1.913973, 0.3206033, -0.1866088, 1, 0, 0.172549, 1,
1.914177, 0.8181096, 0.5785013, 1, 0, 0.1686275, 1,
1.918211, -0.001589991, 0.4213921, 1, 0, 0.1607843, 1,
1.923542, -0.7265589, 1.156585, 1, 0, 0.1568628, 1,
1.924721, 0.9208286, -1.399463, 1, 0, 0.1490196, 1,
1.938841, -0.3513496, 1.780746, 1, 0, 0.145098, 1,
1.939298, -1.184926, 3.228602, 1, 0, 0.1372549, 1,
1.958762, -1.327203, 2.280512, 1, 0, 0.1333333, 1,
1.985252, -0.6746454, 1.868791, 1, 0, 0.1254902, 1,
1.994533, 0.3592184, 2.025187, 1, 0, 0.1215686, 1,
2.012857, 0.7855342, 0.7847508, 1, 0, 0.1137255, 1,
2.046125, -1.437941, 3.249812, 1, 0, 0.1098039, 1,
2.05424, -0.2112326, 1.796151, 1, 0, 0.1019608, 1,
2.058793, 0.07991793, 0.3612995, 1, 0, 0.09411765, 1,
2.089398, -0.04098153, 0.4372967, 1, 0, 0.09019608, 1,
2.142262, 0.1390644, 2.13124, 1, 0, 0.08235294, 1,
2.153898, -0.05363912, 2.08233, 1, 0, 0.07843138, 1,
2.164978, 1.791144, 1.190491, 1, 0, 0.07058824, 1,
2.184116, -0.2623149, 2.489342, 1, 0, 0.06666667, 1,
2.194447, -0.8393452, 2.723074, 1, 0, 0.05882353, 1,
2.211102, 0.8760689, 1.904033, 1, 0, 0.05490196, 1,
2.211923, -0.0501226, 1.783446, 1, 0, 0.04705882, 1,
2.218901, 0.2714206, 0.8011048, 1, 0, 0.04313726, 1,
2.329039, -2.717896, 3.033136, 1, 0, 0.03529412, 1,
2.356376, -0.9591978, 1.919566, 1, 0, 0.03137255, 1,
2.395103, 0.2658333, -0.06382537, 1, 0, 0.02352941, 1,
2.470782, -0.393118, 1.785243, 1, 0, 0.01960784, 1,
2.528562, 1.046646, 1.75133, 1, 0, 0.01176471, 1,
2.658817, 2.455171, -0.3035072, 1, 0, 0.007843138, 1
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
-0.3785793, -4.528226, -8.45571, 0, -0.5, 0.5, 0.5,
-0.3785793, -4.528226, -8.45571, 1, -0.5, 0.5, 0.5,
-0.3785793, -4.528226, -8.45571, 1, 1.5, 0.5, 0.5,
-0.3785793, -4.528226, -8.45571, 0, 1.5, 0.5, 0.5
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
-4.445652, -0.04732609, -8.45571, 0, -0.5, 0.5, 0.5,
-4.445652, -0.04732609, -8.45571, 1, -0.5, 0.5, 0.5,
-4.445652, -0.04732609, -8.45571, 1, 1.5, 0.5, 0.5,
-4.445652, -0.04732609, -8.45571, 0, 1.5, 0.5, 0.5
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
-4.445652, -4.528226, -0.9001062, 0, -0.5, 0.5, 0.5,
-4.445652, -4.528226, -0.9001062, 1, -0.5, 0.5, 0.5,
-4.445652, -4.528226, -0.9001062, 1, 1.5, 0.5, 0.5,
-4.445652, -4.528226, -0.9001062, 0, 1.5, 0.5, 0.5
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
-3, -3.494173, -6.71211,
2, -3.494173, -6.71211,
-3, -3.494173, -6.71211,
-3, -3.666515, -7.00271,
-2, -3.494173, -6.71211,
-2, -3.666515, -7.00271,
-1, -3.494173, -6.71211,
-1, -3.666515, -7.00271,
0, -3.494173, -6.71211,
0, -3.666515, -7.00271,
1, -3.494173, -6.71211,
1, -3.666515, -7.00271,
2, -3.494173, -6.71211,
2, -3.666515, -7.00271
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
-3, -4.011199, -7.58391, 0, -0.5, 0.5, 0.5,
-3, -4.011199, -7.58391, 1, -0.5, 0.5, 0.5,
-3, -4.011199, -7.58391, 1, 1.5, 0.5, 0.5,
-3, -4.011199, -7.58391, 0, 1.5, 0.5, 0.5,
-2, -4.011199, -7.58391, 0, -0.5, 0.5, 0.5,
-2, -4.011199, -7.58391, 1, -0.5, 0.5, 0.5,
-2, -4.011199, -7.58391, 1, 1.5, 0.5, 0.5,
-2, -4.011199, -7.58391, 0, 1.5, 0.5, 0.5,
-1, -4.011199, -7.58391, 0, -0.5, 0.5, 0.5,
-1, -4.011199, -7.58391, 1, -0.5, 0.5, 0.5,
-1, -4.011199, -7.58391, 1, 1.5, 0.5, 0.5,
-1, -4.011199, -7.58391, 0, 1.5, 0.5, 0.5,
0, -4.011199, -7.58391, 0, -0.5, 0.5, 0.5,
0, -4.011199, -7.58391, 1, -0.5, 0.5, 0.5,
0, -4.011199, -7.58391, 1, 1.5, 0.5, 0.5,
0, -4.011199, -7.58391, 0, 1.5, 0.5, 0.5,
1, -4.011199, -7.58391, 0, -0.5, 0.5, 0.5,
1, -4.011199, -7.58391, 1, -0.5, 0.5, 0.5,
1, -4.011199, -7.58391, 1, 1.5, 0.5, 0.5,
1, -4.011199, -7.58391, 0, 1.5, 0.5, 0.5,
2, -4.011199, -7.58391, 0, -0.5, 0.5, 0.5,
2, -4.011199, -7.58391, 1, -0.5, 0.5, 0.5,
2, -4.011199, -7.58391, 1, 1.5, 0.5, 0.5,
2, -4.011199, -7.58391, 0, 1.5, 0.5, 0.5
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
-3.507097, -3, -6.71211,
-3.507097, 3, -6.71211,
-3.507097, -3, -6.71211,
-3.663523, -3, -7.00271,
-3.507097, -2, -6.71211,
-3.663523, -2, -7.00271,
-3.507097, -1, -6.71211,
-3.663523, -1, -7.00271,
-3.507097, 0, -6.71211,
-3.663523, 0, -7.00271,
-3.507097, 1, -6.71211,
-3.663523, 1, -7.00271,
-3.507097, 2, -6.71211,
-3.663523, 2, -7.00271,
-3.507097, 3, -6.71211,
-3.663523, 3, -7.00271
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
-3.976375, -3, -7.58391, 0, -0.5, 0.5, 0.5,
-3.976375, -3, -7.58391, 1, -0.5, 0.5, 0.5,
-3.976375, -3, -7.58391, 1, 1.5, 0.5, 0.5,
-3.976375, -3, -7.58391, 0, 1.5, 0.5, 0.5,
-3.976375, -2, -7.58391, 0, -0.5, 0.5, 0.5,
-3.976375, -2, -7.58391, 1, -0.5, 0.5, 0.5,
-3.976375, -2, -7.58391, 1, 1.5, 0.5, 0.5,
-3.976375, -2, -7.58391, 0, 1.5, 0.5, 0.5,
-3.976375, -1, -7.58391, 0, -0.5, 0.5, 0.5,
-3.976375, -1, -7.58391, 1, -0.5, 0.5, 0.5,
-3.976375, -1, -7.58391, 1, 1.5, 0.5, 0.5,
-3.976375, -1, -7.58391, 0, 1.5, 0.5, 0.5,
-3.976375, 0, -7.58391, 0, -0.5, 0.5, 0.5,
-3.976375, 0, -7.58391, 1, -0.5, 0.5, 0.5,
-3.976375, 0, -7.58391, 1, 1.5, 0.5, 0.5,
-3.976375, 0, -7.58391, 0, 1.5, 0.5, 0.5,
-3.976375, 1, -7.58391, 0, -0.5, 0.5, 0.5,
-3.976375, 1, -7.58391, 1, -0.5, 0.5, 0.5,
-3.976375, 1, -7.58391, 1, 1.5, 0.5, 0.5,
-3.976375, 1, -7.58391, 0, 1.5, 0.5, 0.5,
-3.976375, 2, -7.58391, 0, -0.5, 0.5, 0.5,
-3.976375, 2, -7.58391, 1, -0.5, 0.5, 0.5,
-3.976375, 2, -7.58391, 1, 1.5, 0.5, 0.5,
-3.976375, 2, -7.58391, 0, 1.5, 0.5, 0.5,
-3.976375, 3, -7.58391, 0, -0.5, 0.5, 0.5,
-3.976375, 3, -7.58391, 1, -0.5, 0.5, 0.5,
-3.976375, 3, -7.58391, 1, 1.5, 0.5, 0.5,
-3.976375, 3, -7.58391, 0, 1.5, 0.5, 0.5
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
-3.507097, -3.494173, -6,
-3.507097, -3.494173, 4,
-3.507097, -3.494173, -6,
-3.663523, -3.666515, -6,
-3.507097, -3.494173, -4,
-3.663523, -3.666515, -4,
-3.507097, -3.494173, -2,
-3.663523, -3.666515, -2,
-3.507097, -3.494173, 0,
-3.663523, -3.666515, 0,
-3.507097, -3.494173, 2,
-3.663523, -3.666515, 2,
-3.507097, -3.494173, 4,
-3.663523, -3.666515, 4
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
"-6",
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
-3.976375, -4.011199, -6, 0, -0.5, 0.5, 0.5,
-3.976375, -4.011199, -6, 1, -0.5, 0.5, 0.5,
-3.976375, -4.011199, -6, 1, 1.5, 0.5, 0.5,
-3.976375, -4.011199, -6, 0, 1.5, 0.5, 0.5,
-3.976375, -4.011199, -4, 0, -0.5, 0.5, 0.5,
-3.976375, -4.011199, -4, 1, -0.5, 0.5, 0.5,
-3.976375, -4.011199, -4, 1, 1.5, 0.5, 0.5,
-3.976375, -4.011199, -4, 0, 1.5, 0.5, 0.5,
-3.976375, -4.011199, -2, 0, -0.5, 0.5, 0.5,
-3.976375, -4.011199, -2, 1, -0.5, 0.5, 0.5,
-3.976375, -4.011199, -2, 1, 1.5, 0.5, 0.5,
-3.976375, -4.011199, -2, 0, 1.5, 0.5, 0.5,
-3.976375, -4.011199, 0, 0, -0.5, 0.5, 0.5,
-3.976375, -4.011199, 0, 1, -0.5, 0.5, 0.5,
-3.976375, -4.011199, 0, 1, 1.5, 0.5, 0.5,
-3.976375, -4.011199, 0, 0, 1.5, 0.5, 0.5,
-3.976375, -4.011199, 2, 0, -0.5, 0.5, 0.5,
-3.976375, -4.011199, 2, 1, -0.5, 0.5, 0.5,
-3.976375, -4.011199, 2, 1, 1.5, 0.5, 0.5,
-3.976375, -4.011199, 2, 0, 1.5, 0.5, 0.5,
-3.976375, -4.011199, 4, 0, -0.5, 0.5, 0.5,
-3.976375, -4.011199, 4, 1, -0.5, 0.5, 0.5,
-3.976375, -4.011199, 4, 1, 1.5, 0.5, 0.5,
-3.976375, -4.011199, 4, 0, 1.5, 0.5, 0.5
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
-3.507097, -3.494173, -6.71211,
-3.507097, 3.39952, -6.71211,
-3.507097, -3.494173, 4.911897,
-3.507097, 3.39952, 4.911897,
-3.507097, -3.494173, -6.71211,
-3.507097, -3.494173, 4.911897,
-3.507097, 3.39952, -6.71211,
-3.507097, 3.39952, 4.911897,
-3.507097, -3.494173, -6.71211,
2.749939, -3.494173, -6.71211,
-3.507097, -3.494173, 4.911897,
2.749939, -3.494173, 4.911897,
-3.507097, 3.39952, -6.71211,
2.749939, 3.39952, -6.71211,
-3.507097, 3.39952, 4.911897,
2.749939, 3.39952, 4.911897,
2.749939, -3.494173, -6.71211,
2.749939, 3.39952, -6.71211,
2.749939, -3.494173, 4.911897,
2.749939, 3.39952, 4.911897,
2.749939, -3.494173, -6.71211,
2.749939, -3.494173, 4.911897,
2.749939, 3.39952, -6.71211,
2.749939, 3.39952, 4.911897
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
var radius = 7.952387;
var distance = 35.38107;
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
mvMatrix.translate( 0.3785793, 0.04732609, 0.9001062 );
mvMatrix.scale( 1.374177, 1.247267, 0.7396998 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.38107);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Flumetralin<-read.table("Flumetralin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Flumetralin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Flumetralin' not found
```

```r
y<-Flumetralin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Flumetralin' not found
```

```r
z<-Flumetralin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Flumetralin' not found
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
-3.415975, -1.347786, -2.017274, 0, 0, 1, 1, 1,
-3.075639, -1.131685, -2.402473, 1, 0, 0, 1, 1,
-2.868965, 1.009672, -0.7754714, 1, 0, 0, 1, 1,
-2.850475, 0.4216039, -0.9737057, 1, 0, 0, 1, 1,
-2.667819, 0.9837319, -0.8308558, 1, 0, 0, 1, 1,
-2.591229, -1.429958, -2.277247, 1, 0, 0, 1, 1,
-2.558621, -0.1943153, -0.6528956, 0, 0, 0, 1, 1,
-2.488074, 0.8465221, -2.051265, 0, 0, 0, 1, 1,
-2.462484, -0.8402562, -1.647324, 0, 0, 0, 1, 1,
-2.434341, 0.4865679, -2.701336, 0, 0, 0, 1, 1,
-2.376706, 0.2449968, -0.5747495, 0, 0, 0, 1, 1,
-2.36092, -0.5464676, -3.31057, 0, 0, 0, 1, 1,
-2.230543, -1.568811, -1.809972, 0, 0, 0, 1, 1,
-2.186052, -0.7214188, -0.5119874, 1, 1, 1, 1, 1,
-2.181929, 0.09802683, -2.425486, 1, 1, 1, 1, 1,
-2.054624, 0.7001776, 0.1472944, 1, 1, 1, 1, 1,
-1.988493, -1.31818, -2.382225, 1, 1, 1, 1, 1,
-1.970695, 0.3606213, -1.080751, 1, 1, 1, 1, 1,
-1.96901, -0.8564032, -2.334125, 1, 1, 1, 1, 1,
-1.952256, 0.01360733, -3.014821, 1, 1, 1, 1, 1,
-1.951588, -1.269217, -0.2591377, 1, 1, 1, 1, 1,
-1.910859, -0.909905, -1.791874, 1, 1, 1, 1, 1,
-1.900643, -1.095872, -2.301202, 1, 1, 1, 1, 1,
-1.867908, 1.595324, -1.287078, 1, 1, 1, 1, 1,
-1.855953, -0.3661037, -2.403643, 1, 1, 1, 1, 1,
-1.830965, 1.592428, -0.8270485, 1, 1, 1, 1, 1,
-1.830887, -1.770572, -1.793836, 1, 1, 1, 1, 1,
-1.816698, -1.00681, -1.90817, 1, 1, 1, 1, 1,
-1.804638, -0.7894036, -1.319023, 0, 0, 1, 1, 1,
-1.799751, -0.5260981, -3.059072, 1, 0, 0, 1, 1,
-1.793491, -0.813201, -1.306574, 1, 0, 0, 1, 1,
-1.759198, 1.009515, -0.9917961, 1, 0, 0, 1, 1,
-1.706523, -0.2059185, -1.669492, 1, 0, 0, 1, 1,
-1.673648, -0.03394346, -3.587233, 1, 0, 0, 1, 1,
-1.673057, -0.5520912, -2.026583, 0, 0, 0, 1, 1,
-1.668317, -0.1999441, -1.357061, 0, 0, 0, 1, 1,
-1.667662, -0.7941689, -3.341809, 0, 0, 0, 1, 1,
-1.659948, 1.481617, -1.194365, 0, 0, 0, 1, 1,
-1.646081, 0.2394336, -2.646588, 0, 0, 0, 1, 1,
-1.637356, 0.02220177, -1.669833, 0, 0, 0, 1, 1,
-1.625021, 2.206972, 0.5665979, 0, 0, 0, 1, 1,
-1.614667, -0.7206798, -2.282824, 1, 1, 1, 1, 1,
-1.6091, -0.3489053, -1.672747, 1, 1, 1, 1, 1,
-1.603507, -0.08039799, -3.229436, 1, 1, 1, 1, 1,
-1.601695, 0.08264361, -1.313909, 1, 1, 1, 1, 1,
-1.592894, 1.721825, -0.8574332, 1, 1, 1, 1, 1,
-1.581417, 1.31862, -0.9998291, 1, 1, 1, 1, 1,
-1.57378, -1.386089, -2.183409, 1, 1, 1, 1, 1,
-1.559154, -0.7982838, -1.277417, 1, 1, 1, 1, 1,
-1.549835, 0.06875329, -2.623651, 1, 1, 1, 1, 1,
-1.549029, 0.9796869, -1.611793, 1, 1, 1, 1, 1,
-1.546575, 1.98683, 0.8251753, 1, 1, 1, 1, 1,
-1.538315, 1.622298, -0.5752801, 1, 1, 1, 1, 1,
-1.52837, -0.9763365, -1.304075, 1, 1, 1, 1, 1,
-1.519099, 0.9188677, -3.144401, 1, 1, 1, 1, 1,
-1.509666, -2.243763, -2.221673, 1, 1, 1, 1, 1,
-1.503245, -1.923084, -0.9419448, 0, 0, 1, 1, 1,
-1.485826, 0.5008008, -2.010226, 1, 0, 0, 1, 1,
-1.478484, 1.215954, -1.236572, 1, 0, 0, 1, 1,
-1.474874, 0.7113959, -4.116706, 1, 0, 0, 1, 1,
-1.465567, -1.130342, -1.60817, 1, 0, 0, 1, 1,
-1.459035, -3.393779, -3.199256, 1, 0, 0, 1, 1,
-1.456311, -0.2674713, -0.1095336, 0, 0, 0, 1, 1,
-1.455486, 2.756895, 0.01365549, 0, 0, 0, 1, 1,
-1.455269, 0.3346756, -0.6224417, 0, 0, 0, 1, 1,
-1.437087, -2.03063, -1.358355, 0, 0, 0, 1, 1,
-1.43524, -0.9528528, -1.437033, 0, 0, 0, 1, 1,
-1.400324, 0.6883448, -1.378942, 0, 0, 0, 1, 1,
-1.39679, -0.2627494, -2.09499, 0, 0, 0, 1, 1,
-1.394577, 0.1401496, -1.195916, 1, 1, 1, 1, 1,
-1.393218, 0.7021416, -1.454191, 1, 1, 1, 1, 1,
-1.378412, -0.5060846, -1.398187, 1, 1, 1, 1, 1,
-1.376984, 0.5278963, -0.4675747, 1, 1, 1, 1, 1,
-1.368922, 0.524902, -1.172725, 1, 1, 1, 1, 1,
-1.366737, 0.6373159, -1.176671, 1, 1, 1, 1, 1,
-1.361262, 1.365927, 0.9237778, 1, 1, 1, 1, 1,
-1.356394, -1.032996, -2.497567, 1, 1, 1, 1, 1,
-1.34042, 0.6420778, -0.1002754, 1, 1, 1, 1, 1,
-1.339114, 1.388516, 0.6023204, 1, 1, 1, 1, 1,
-1.334132, -0.6517253, -2.140277, 1, 1, 1, 1, 1,
-1.33371, 1.000047, 1.697573, 1, 1, 1, 1, 1,
-1.331692, -0.7737151, -0.92027, 1, 1, 1, 1, 1,
-1.327608, 2.557374, -0.2560863, 1, 1, 1, 1, 1,
-1.315192, 1.519505, 0.7257187, 1, 1, 1, 1, 1,
-1.310603, 0.06466552, -2.239457, 0, 0, 1, 1, 1,
-1.304411, 2.435347, 1.334196, 1, 0, 0, 1, 1,
-1.303265, 0.5833629, -0.2235181, 1, 0, 0, 1, 1,
-1.295631, 0.435537, -0.9257802, 1, 0, 0, 1, 1,
-1.28515, -0.7615626, -1.283527, 1, 0, 0, 1, 1,
-1.282249, -1.397264, -2.411817, 1, 0, 0, 1, 1,
-1.279694, -0.1436291, -3.145996, 0, 0, 0, 1, 1,
-1.279333, 0.7231862, -1.64179, 0, 0, 0, 1, 1,
-1.275461, 0.5343206, -0.9527208, 0, 0, 0, 1, 1,
-1.271267, 1.038702, -1.239114, 0, 0, 0, 1, 1,
-1.270419, -0.196836, -0.3442608, 0, 0, 0, 1, 1,
-1.267256, 0.468008, -1.272689, 0, 0, 0, 1, 1,
-1.257873, 0.5263063, -0.6705253, 0, 0, 0, 1, 1,
-1.253294, 0.9650889, -0.6281028, 1, 1, 1, 1, 1,
-1.251938, 0.5416875, -1.555595, 1, 1, 1, 1, 1,
-1.248721, -0.5868997, -2.977302, 1, 1, 1, 1, 1,
-1.247066, -0.7514535, -1.769772, 1, 1, 1, 1, 1,
-1.242691, -0.9648364, -1.678503, 1, 1, 1, 1, 1,
-1.238776, 0.4418403, -1.023165, 1, 1, 1, 1, 1,
-1.23639, -0.6324947, -3.070261, 1, 1, 1, 1, 1,
-1.231166, -2.211549, -1.101066, 1, 1, 1, 1, 1,
-1.230723, 0.5012735, 0.1565845, 1, 1, 1, 1, 1,
-1.223065, -0.1389511, -1.810704, 1, 1, 1, 1, 1,
-1.218852, 1.410687, -1.270851, 1, 1, 1, 1, 1,
-1.217319, 1.673414, -2.233168, 1, 1, 1, 1, 1,
-1.216178, -0.5467253, -1.765986, 1, 1, 1, 1, 1,
-1.198093, 0.1766547, -0.6761913, 1, 1, 1, 1, 1,
-1.195585, -0.2767321, -1.442681, 1, 1, 1, 1, 1,
-1.190697, -0.01267162, -1.830539, 0, 0, 1, 1, 1,
-1.188997, -0.5284755, -1.150319, 1, 0, 0, 1, 1,
-1.186306, -0.2700978, -1.38384, 1, 0, 0, 1, 1,
-1.184511, 0.6235532, -1.499996, 1, 0, 0, 1, 1,
-1.181019, 0.7803927, -1.924707, 1, 0, 0, 1, 1,
-1.171507, -0.404867, -1.908455, 1, 0, 0, 1, 1,
-1.163342, 1.860397, 0.8737874, 0, 0, 0, 1, 1,
-1.156805, 2.659979, -2.636617, 0, 0, 0, 1, 1,
-1.155662, -1.164776, -4.216904, 0, 0, 0, 1, 1,
-1.147661, 0.4741035, -0.9655088, 0, 0, 0, 1, 1,
-1.142263, -0.6439875, -1.901904, 0, 0, 0, 1, 1,
-1.140526, 0.393395, -1.525565, 0, 0, 0, 1, 1,
-1.137051, 0.7816849, -2.442706, 0, 0, 0, 1, 1,
-1.132381, -1.066944, -1.84935, 1, 1, 1, 1, 1,
-1.130851, -0.9072542, -2.590188, 1, 1, 1, 1, 1,
-1.109766, 0.9650727, 0.4069473, 1, 1, 1, 1, 1,
-1.10137, -1.682488, -1.588799, 1, 1, 1, 1, 1,
-1.096416, -0.7963771, -2.53652, 1, 1, 1, 1, 1,
-1.094757, 1.024688, -1.12258, 1, 1, 1, 1, 1,
-1.093426, 0.7690148, -1.162271, 1, 1, 1, 1, 1,
-1.091064, -1.535963, -2.980161, 1, 1, 1, 1, 1,
-1.087293, -1.10275, -1.334711, 1, 1, 1, 1, 1,
-1.084481, -1.030712, -3.269207, 1, 1, 1, 1, 1,
-1.07872, -0.5079563, -1.136997, 1, 1, 1, 1, 1,
-1.077527, -1.087046, -2.234227, 1, 1, 1, 1, 1,
-1.075731, 0.8523619, -1.462137, 1, 1, 1, 1, 1,
-1.069336, -0.5123752, -2.619038, 1, 1, 1, 1, 1,
-1.064606, 0.9202983, -0.01001948, 1, 1, 1, 1, 1,
-1.063478, -1.742328, -2.261691, 0, 0, 1, 1, 1,
-1.06012, 1.015552, -1.580389, 1, 0, 0, 1, 1,
-1.059735, 1.145431, -0.4288356, 1, 0, 0, 1, 1,
-1.058147, 0.9923483, -0.8884403, 1, 0, 0, 1, 1,
-1.048473, 2.41685, -0.7293674, 1, 0, 0, 1, 1,
-1.046247, 0.7548124, -4.47124, 1, 0, 0, 1, 1,
-1.041845, -1.624256, -3.686675, 0, 0, 0, 1, 1,
-1.035025, 1.957921, -0.4750145, 0, 0, 0, 1, 1,
-1.033655, 0.01979486, -2.348141, 0, 0, 0, 1, 1,
-1.031576, 0.5565308, -2.191687, 0, 0, 0, 1, 1,
-1.031358, -0.3730831, -1.779364, 0, 0, 0, 1, 1,
-1.02256, -1.225778, -2.97897, 0, 0, 0, 1, 1,
-1.016203, -0.1387839, 1.374757, 0, 0, 0, 1, 1,
-1.013973, -0.852208, -1.030487, 1, 1, 1, 1, 1,
-1.005782, -0.7192054, -1.821872, 1, 1, 1, 1, 1,
-1.004016, 0.5497267, -1.959501, 1, 1, 1, 1, 1,
-0.9976498, 0.8434091, -2.248828, 1, 1, 1, 1, 1,
-0.9913429, -0.9055273, -3.465453, 1, 1, 1, 1, 1,
-0.9879634, -1.477798, -2.842376, 1, 1, 1, 1, 1,
-0.979629, 1.108452, -0.4507468, 1, 1, 1, 1, 1,
-0.9785244, -1.079024, -3.192245, 1, 1, 1, 1, 1,
-0.9775994, -0.5080816, -1.590077, 1, 1, 1, 1, 1,
-0.9754325, -0.1308195, -1.627355, 1, 1, 1, 1, 1,
-0.9729381, -2.860466, -2.364948, 1, 1, 1, 1, 1,
-0.9716681, 0.04493493, -1.589119, 1, 1, 1, 1, 1,
-0.9570689, -0.7980104, -3.882608, 1, 1, 1, 1, 1,
-0.9527035, -0.2308009, -4.148533, 1, 1, 1, 1, 1,
-0.9505618, 0.46653, -0.7739099, 1, 1, 1, 1, 1,
-0.949412, -1.097616, -3.71464, 0, 0, 1, 1, 1,
-0.9471747, 1.211886, 0.1581561, 1, 0, 0, 1, 1,
-0.9445738, 0.1673983, -1.59623, 1, 0, 0, 1, 1,
-0.9399227, 0.1830527, -2.46623, 1, 0, 0, 1, 1,
-0.9386399, 0.20151, -1.694911, 1, 0, 0, 1, 1,
-0.9360347, -0.5660459, -2.11477, 1, 0, 0, 1, 1,
-0.9358322, 0.2283661, -0.5240236, 0, 0, 0, 1, 1,
-0.9326354, -0.2631234, -0.1520288, 0, 0, 0, 1, 1,
-0.925392, 0.1944896, -2.438445, 0, 0, 0, 1, 1,
-0.9196267, -0.1343448, -0.779131, 0, 0, 0, 1, 1,
-0.9180802, -0.08563146, 0.5496389, 0, 0, 0, 1, 1,
-0.9169152, -0.3419826, -1.927917, 0, 0, 0, 1, 1,
-0.9059581, -0.09792813, -3.133104, 0, 0, 0, 1, 1,
-0.9015999, -0.3114299, -2.605964, 1, 1, 1, 1, 1,
-0.8996588, 0.5375138, -2.053769, 1, 1, 1, 1, 1,
-0.8947787, -0.3139705, -2.33358, 1, 1, 1, 1, 1,
-0.8890295, 0.2442056, -0.2569968, 1, 1, 1, 1, 1,
-0.8821307, 0.6594084, 0.7490419, 1, 1, 1, 1, 1,
-0.8707104, -0.3555454, -2.279161, 1, 1, 1, 1, 1,
-0.8650566, 1.15374, -0.3190383, 1, 1, 1, 1, 1,
-0.8644687, 0.7398304, -0.885534, 1, 1, 1, 1, 1,
-0.8642694, -0.4694237, -2.347579, 1, 1, 1, 1, 1,
-0.8642679, 1.755553, -0.5893351, 1, 1, 1, 1, 1,
-0.8624959, 1.284754, 0.8087538, 1, 1, 1, 1, 1,
-0.861707, 0.6606467, -1.932743, 1, 1, 1, 1, 1,
-0.8511946, 1.430596, -2.551284, 1, 1, 1, 1, 1,
-0.8502036, -1.420172, -3.219422, 1, 1, 1, 1, 1,
-0.8417987, 3.299127, 0.801156, 1, 1, 1, 1, 1,
-0.8326449, -0.6286117, -3.235845, 0, 0, 1, 1, 1,
-0.8298786, -1.505073, -2.82572, 1, 0, 0, 1, 1,
-0.8292073, 0.111974, -0.7720888, 1, 0, 0, 1, 1,
-0.8218493, 0.7076898, -1.180691, 1, 0, 0, 1, 1,
-0.8175194, -1.790484, -3.824118, 1, 0, 0, 1, 1,
-0.8152099, 0.5798401, -1.554402, 1, 0, 0, 1, 1,
-0.8067665, -0.06725498, -0.0317528, 0, 0, 0, 1, 1,
-0.8050911, -0.1420301, -3.11745, 0, 0, 0, 1, 1,
-0.8034379, 2.252666, 1.984849, 0, 0, 0, 1, 1,
-0.7965636, -1.599007, -2.71799, 0, 0, 0, 1, 1,
-0.7917138, -0.6497973, -2.020885, 0, 0, 0, 1, 1,
-0.7912548, -0.5878531, -1.823785, 0, 0, 0, 1, 1,
-0.7899601, 0.3505205, -0.7102218, 0, 0, 0, 1, 1,
-0.785409, -0.2955916, 0.7765601, 1, 1, 1, 1, 1,
-0.7812427, -1.210874, -2.158049, 1, 1, 1, 1, 1,
-0.77925, -1.255202, -2.502122, 1, 1, 1, 1, 1,
-0.7747167, -1.030405, -2.556099, 1, 1, 1, 1, 1,
-0.7745098, 0.2985814, -1.485565, 1, 1, 1, 1, 1,
-0.7697114, 0.5090391, -0.4992557, 1, 1, 1, 1, 1,
-0.7695842, 1.41784, -1.258417, 1, 1, 1, 1, 1,
-0.7595693, 0.130979, -0.07783897, 1, 1, 1, 1, 1,
-0.7570102, 1.74234, 0.578319, 1, 1, 1, 1, 1,
-0.7548652, 0.7607616, -1.033383, 1, 1, 1, 1, 1,
-0.7535143, 1.853415, -2.406057, 1, 1, 1, 1, 1,
-0.7476313, -1.723373, -3.046172, 1, 1, 1, 1, 1,
-0.7459758, -2.024983, -3.29151, 1, 1, 1, 1, 1,
-0.7421955, 0.9629798, 1.25816, 1, 1, 1, 1, 1,
-0.7407719, -1.48249, -3.390289, 1, 1, 1, 1, 1,
-0.7357548, -0.5007195, -1.378386, 0, 0, 1, 1, 1,
-0.7286595, -0.5404384, -1.524234, 1, 0, 0, 1, 1,
-0.725103, -0.6803573, -3.13532, 1, 0, 0, 1, 1,
-0.720012, -1.666334, -2.743288, 1, 0, 0, 1, 1,
-0.7173458, -1.09878, -4.9992, 1, 0, 0, 1, 1,
-0.7162493, 0.6253372, -0.1888945, 1, 0, 0, 1, 1,
-0.7124094, 0.5236823, 0.07835598, 0, 0, 0, 1, 1,
-0.71233, -0.2613071, -2.966809, 0, 0, 0, 1, 1,
-0.7059591, -0.3996825, -0.7726989, 0, 0, 0, 1, 1,
-0.7054334, -0.5884459, -1.640649, 0, 0, 0, 1, 1,
-0.7034094, -1.336459, -2.069463, 0, 0, 0, 1, 1,
-0.7017484, -0.9374802, -4.283912, 0, 0, 0, 1, 1,
-0.6998521, 0.3212913, 0.9863848, 0, 0, 0, 1, 1,
-0.6943404, -0.133887, -1.543865, 1, 1, 1, 1, 1,
-0.6838744, -1.473646, -3.331581, 1, 1, 1, 1, 1,
-0.6830981, -0.7235078, -3.809729, 1, 1, 1, 1, 1,
-0.678861, 0.4515609, -0.1957817, 1, 1, 1, 1, 1,
-0.6782547, -0.2242392, -0.5410151, 1, 1, 1, 1, 1,
-0.673359, -0.07041162, -0.6688597, 1, 1, 1, 1, 1,
-0.6723392, -0.3561429, -2.579643, 1, 1, 1, 1, 1,
-0.6700796, 0.023731, -0.1085775, 1, 1, 1, 1, 1,
-0.667582, -1.290477, -1.050033, 1, 1, 1, 1, 1,
-0.6675273, 0.5803757, -1.690414, 1, 1, 1, 1, 1,
-0.6673371, 1.969813, -3.133206, 1, 1, 1, 1, 1,
-0.6663439, 1.190235, 0.06832483, 1, 1, 1, 1, 1,
-0.6660795, 1.197752, -1.597503, 1, 1, 1, 1, 1,
-0.6655506, -0.9397081, -1.086613, 1, 1, 1, 1, 1,
-0.6633285, -0.09062591, -2.506905, 1, 1, 1, 1, 1,
-0.6500646, -1.244319, -3.505275, 0, 0, 1, 1, 1,
-0.6485646, 1.298546, -0.5430539, 1, 0, 0, 1, 1,
-0.6483069, 0.5586353, -2.4115, 1, 0, 0, 1, 1,
-0.6482592, -0.6326439, -2.81998, 1, 0, 0, 1, 1,
-0.6418052, -0.7890586, -2.528224, 1, 0, 0, 1, 1,
-0.6373897, 1.125359, -1.578698, 1, 0, 0, 1, 1,
-0.6358253, -1.13341, -3.215827, 0, 0, 0, 1, 1,
-0.6280829, 2.016505, -0.8766361, 0, 0, 0, 1, 1,
-0.6253178, 1.32099, -0.8870531, 0, 0, 0, 1, 1,
-0.623193, -0.8344024, -3.138002, 0, 0, 0, 1, 1,
-0.6231498, -0.4628303, -3.102983, 0, 0, 0, 1, 1,
-0.6227878, 0.8935287, 0.8846943, 0, 0, 0, 1, 1,
-0.6224799, -0.9182757, -2.754686, 0, 0, 0, 1, 1,
-0.6212139, -0.04923629, -0.9982541, 1, 1, 1, 1, 1,
-0.621025, 0.3061376, -1.768522, 1, 1, 1, 1, 1,
-0.6165181, 0.4837284, 2.027773, 1, 1, 1, 1, 1,
-0.6163877, 0.8281773, -1.721643, 1, 1, 1, 1, 1,
-0.6124717, -1.55093, -4.735904, 1, 1, 1, 1, 1,
-0.6091594, -0.8906999, -0.009578242, 1, 1, 1, 1, 1,
-0.6045246, 0.8896313, -0.6392438, 1, 1, 1, 1, 1,
-0.5993602, 1.178301, 0.1526949, 1, 1, 1, 1, 1,
-0.5952538, 0.8415709, 0.0612601, 1, 1, 1, 1, 1,
-0.5915094, 2.425929, -0.4958096, 1, 1, 1, 1, 1,
-0.5913656, -0.6958954, -1.5906, 1, 1, 1, 1, 1,
-0.588783, -1.264753, -4.073185, 1, 1, 1, 1, 1,
-0.5787691, 0.01918675, 0.3417807, 1, 1, 1, 1, 1,
-0.5761085, 0.432692, -0.1197597, 1, 1, 1, 1, 1,
-0.5735303, -0.6092172, -3.910158, 1, 1, 1, 1, 1,
-0.5678191, 0.4096553, -0.9591613, 0, 0, 1, 1, 1,
-0.5630825, 0.8985465, -0.09458054, 1, 0, 0, 1, 1,
-0.5589547, 0.9014995, -0.7827176, 1, 0, 0, 1, 1,
-0.5561891, -1.501712, -1.121686, 1, 0, 0, 1, 1,
-0.5553092, -0.5063693, -3.962439, 1, 0, 0, 1, 1,
-0.5516317, -0.8311138, -3.207385, 1, 0, 0, 1, 1,
-0.5484907, -0.9060922, -1.155555, 0, 0, 0, 1, 1,
-0.5457154, 1.053559, -1.00108, 0, 0, 0, 1, 1,
-0.5337464, -1.297073, -2.07017, 0, 0, 0, 1, 1,
-0.5320876, 1.334473, -1.369774, 0, 0, 0, 1, 1,
-0.5280829, 1.858611, 0.7249621, 0, 0, 0, 1, 1,
-0.5261149, -1.026852, -4.256138, 0, 0, 0, 1, 1,
-0.5251381, 0.1508861, -1.97227, 0, 0, 0, 1, 1,
-0.5245112, 0.8629267, -0.5317841, 1, 1, 1, 1, 1,
-0.5232692, -0.3942994, -1.177369, 1, 1, 1, 1, 1,
-0.5232545, 0.8324049, 0.836037, 1, 1, 1, 1, 1,
-0.522517, 1.108917, -1.319071, 1, 1, 1, 1, 1,
-0.5217345, -0.5446027, -3.77321, 1, 1, 1, 1, 1,
-0.5201264, 0.8694821, 1.568542, 1, 1, 1, 1, 1,
-0.5153217, 0.5997226, -2.591147, 1, 1, 1, 1, 1,
-0.5069689, -0.9348535, -2.267114, 1, 1, 1, 1, 1,
-0.5061672, -0.3019042, -2.024819, 1, 1, 1, 1, 1,
-0.5054082, -0.7096307, -1.400706, 1, 1, 1, 1, 1,
-0.5015708, 0.6439235, -1.710733, 1, 1, 1, 1, 1,
-0.5005044, -0.7189977, -3.315592, 1, 1, 1, 1, 1,
-0.5002267, 0.5337043, -0.4944206, 1, 1, 1, 1, 1,
-0.4973845, 1.394705, -1.014998, 1, 1, 1, 1, 1,
-0.4954514, -1.516379, -3.512513, 1, 1, 1, 1, 1,
-0.4923585, 1.841922, 0.8961578, 0, 0, 1, 1, 1,
-0.4917831, -0.8614887, -3.30846, 1, 0, 0, 1, 1,
-0.4910685, -0.5712178, -2.197142, 1, 0, 0, 1, 1,
-0.4888577, -0.3548961, -3.190392, 1, 0, 0, 1, 1,
-0.4840074, 1.571312, 2.68743, 1, 0, 0, 1, 1,
-0.4821583, -1.107551, -2.148911, 1, 0, 0, 1, 1,
-0.4753603, -0.5481836, -4.400626, 0, 0, 0, 1, 1,
-0.4750434, -2.009949, -4.357074, 0, 0, 0, 1, 1,
-0.4698701, 1.352838, -0.4275141, 0, 0, 0, 1, 1,
-0.4683556, 0.3089369, 0.7552482, 0, 0, 0, 1, 1,
-0.4667591, 0.9832365, -0.4711289, 0, 0, 0, 1, 1,
-0.4643821, -0.5536885, -3.174319, 0, 0, 0, 1, 1,
-0.4633988, 0.6144316, -0.2261991, 0, 0, 0, 1, 1,
-0.4595726, -1.42217, -2.779569, 1, 1, 1, 1, 1,
-0.4584347, -0.775638, -3.171261, 1, 1, 1, 1, 1,
-0.4566238, -0.261932, -0.01771609, 1, 1, 1, 1, 1,
-0.4539042, -1.141468, -0.4853485, 1, 1, 1, 1, 1,
-0.4492126, -2.399779, -4.10213, 1, 1, 1, 1, 1,
-0.440834, -0.769048, -2.78293, 1, 1, 1, 1, 1,
-0.4392915, 0.09849446, -0.7394205, 1, 1, 1, 1, 1,
-0.4365607, -0.7441519, -2.590971, 1, 1, 1, 1, 1,
-0.4308192, 0.3177795, -2.748069, 1, 1, 1, 1, 1,
-0.4273598, 0.2872711, -0.5152544, 1, 1, 1, 1, 1,
-0.4238994, 1.586102, 0.5140975, 1, 1, 1, 1, 1,
-0.4196438, 1.029768, -0.3684998, 1, 1, 1, 1, 1,
-0.4178129, -0.1277268, -1.343507, 1, 1, 1, 1, 1,
-0.4141476, -0.5250106, -2.59715, 1, 1, 1, 1, 1,
-0.4083586, 0.3914709, -1.334236, 1, 1, 1, 1, 1,
-0.4050206, 2.091361, 0.01320878, 0, 0, 1, 1, 1,
-0.4010819, -0.3840844, -0.9132054, 1, 0, 0, 1, 1,
-0.3982941, -0.7675399, -2.930312, 1, 0, 0, 1, 1,
-0.3961477, -1.386539, -2.425374, 1, 0, 0, 1, 1,
-0.3952349, 1.296175, -1.193415, 1, 0, 0, 1, 1,
-0.3941377, -2.16361, -0.7489915, 1, 0, 0, 1, 1,
-0.3933257, 0.5868411, -1.075867, 0, 0, 0, 1, 1,
-0.3860126, -0.5977685, -3.284982, 0, 0, 0, 1, 1,
-0.3814085, 2.046648, 0.4546273, 0, 0, 0, 1, 1,
-0.3804945, 0.36821, 0.3365974, 0, 0, 0, 1, 1,
-0.3804481, -0.8063347, -2.75327, 0, 0, 0, 1, 1,
-0.3794098, -0.3660834, -3.904852, 0, 0, 0, 1, 1,
-0.3759051, -0.8978454, -5.108051, 0, 0, 0, 1, 1,
-0.3754396, -0.8525368, -1.601234, 1, 1, 1, 1, 1,
-0.3745507, 0.011702, -3.175038, 1, 1, 1, 1, 1,
-0.3715757, 1.476313, -0.4072619, 1, 1, 1, 1, 1,
-0.3707244, -0.1424167, -2.215333, 1, 1, 1, 1, 1,
-0.3667135, -1.482783, -6.542828, 1, 1, 1, 1, 1,
-0.3657137, -0.675496, -3.577107, 1, 1, 1, 1, 1,
-0.3612497, -0.9298844, -3.190178, 1, 1, 1, 1, 1,
-0.3587544, 1.502726, 1.196922, 1, 1, 1, 1, 1,
-0.3566996, 0.5158619, -0.5900501, 1, 1, 1, 1, 1,
-0.3545867, -0.2157831, -0.4073141, 1, 1, 1, 1, 1,
-0.3504709, 0.2533508, 0.1669411, 1, 1, 1, 1, 1,
-0.3490826, 1.064932, 2.043166, 1, 1, 1, 1, 1,
-0.3445133, 0.685788, -2.660802, 1, 1, 1, 1, 1,
-0.3436473, -1.263721, -2.276742, 1, 1, 1, 1, 1,
-0.3391635, -0.6795386, -3.568973, 1, 1, 1, 1, 1,
-0.3384408, 0.6469186, -1.62668, 0, 0, 1, 1, 1,
-0.3340988, -0.4505158, -2.169416, 1, 0, 0, 1, 1,
-0.3327821, 0.1943614, 0.9768416, 1, 0, 0, 1, 1,
-0.3282046, -0.2811821, -3.131879, 1, 0, 0, 1, 1,
-0.327006, 0.7793367, -0.4303164, 1, 0, 0, 1, 1,
-0.3207945, 0.1514059, -0.8952367, 1, 0, 0, 1, 1,
-0.320457, -0.2223078, -0.1379829, 0, 0, 0, 1, 1,
-0.3174161, -1.056487, -2.655796, 0, 0, 0, 1, 1,
-0.3173941, 1.285827, 0.6625416, 0, 0, 0, 1, 1,
-0.3142672, -0.2869013, -3.355108, 0, 0, 0, 1, 1,
-0.3120556, -0.6541678, -1.970408, 0, 0, 0, 1, 1,
-0.3111131, -0.6905929, -3.911926, 0, 0, 0, 1, 1,
-0.3085964, 0.5522153, -0.2305175, 0, 0, 0, 1, 1,
-0.3076994, 1.548837, 0.3107603, 1, 1, 1, 1, 1,
-0.3043962, 0.7631122, -0.01996512, 1, 1, 1, 1, 1,
-0.3040538, 0.5513169, -1.002067, 1, 1, 1, 1, 1,
-0.3002287, -0.4785052, -2.415922, 1, 1, 1, 1, 1,
-0.2983838, 0.1483945, -1.637658, 1, 1, 1, 1, 1,
-0.2914266, -1.402338, -1.856343, 1, 1, 1, 1, 1,
-0.2908228, -0.3695517, -3.967983, 1, 1, 1, 1, 1,
-0.2904085, -0.7036462, -0.6115223, 1, 1, 1, 1, 1,
-0.2856968, -0.5509757, -3.235019, 1, 1, 1, 1, 1,
-0.2856289, -0.8158861, -1.822352, 1, 1, 1, 1, 1,
-0.2816925, -1.159114, -3.541374, 1, 1, 1, 1, 1,
-0.2692571, -1.271486, -1.565191, 1, 1, 1, 1, 1,
-0.2646412, -0.1241149, -1.958964, 1, 1, 1, 1, 1,
-0.2640507, 0.7771485, -0.9296773, 1, 1, 1, 1, 1,
-0.2609412, 0.6949404, -0.8191394, 1, 1, 1, 1, 1,
-0.2573759, 2.166602, -0.06776284, 0, 0, 1, 1, 1,
-0.2516579, 1.936368, 0.3847, 1, 0, 0, 1, 1,
-0.2486697, 2.972036, -0.1574294, 1, 0, 0, 1, 1,
-0.2481384, -0.93714, -1.049372, 1, 0, 0, 1, 1,
-0.2420516, 0.5280355, -0.1015724, 1, 0, 0, 1, 1,
-0.2323651, -0.1736778, -2.907301, 1, 0, 0, 1, 1,
-0.2318303, -0.9600203, -2.512387, 0, 0, 0, 1, 1,
-0.2250698, 0.007258962, -1.59062, 0, 0, 0, 1, 1,
-0.2241404, -1.61764, -2.672814, 0, 0, 0, 1, 1,
-0.2215137, -1.047083, -2.111532, 0, 0, 0, 1, 1,
-0.2165867, -2.061485, -3.218189, 0, 0, 0, 1, 1,
-0.2152427, -0.1770266, -1.788335, 0, 0, 0, 1, 1,
-0.2086428, -0.8965575, -3.01119, 0, 0, 0, 1, 1,
-0.2084034, 0.4543127, 0.917406, 1, 1, 1, 1, 1,
-0.202503, -0.8911518, -3.073396, 1, 1, 1, 1, 1,
-0.2011746, 0.01555209, -2.874201, 1, 1, 1, 1, 1,
-0.2009126, 0.1456142, -0.7374666, 1, 1, 1, 1, 1,
-0.1933309, -1.91874, -3.364866, 1, 1, 1, 1, 1,
-0.1905449, -0.0742268, -1.589519, 1, 1, 1, 1, 1,
-0.1900336, 1.30095, -1.592409, 1, 1, 1, 1, 1,
-0.1889189, -1.157013, -2.759614, 1, 1, 1, 1, 1,
-0.1888103, 1.719654, 0.04544324, 1, 1, 1, 1, 1,
-0.1855471, 0.1471692, -0.7570116, 1, 1, 1, 1, 1,
-0.1791386, -1.575593, -1.434985, 1, 1, 1, 1, 1,
-0.1777895, -0.7808677, -4.953118, 1, 1, 1, 1, 1,
-0.1771672, -0.1624231, -1.602778, 1, 1, 1, 1, 1,
-0.1691129, 0.2094281, 0.5636339, 1, 1, 1, 1, 1,
-0.1634352, 0.5093407, -0.4821048, 1, 1, 1, 1, 1,
-0.1624454, 0.3086314, -0.7159569, 0, 0, 1, 1, 1,
-0.1567996, -0.8098679, -4.029, 1, 0, 0, 1, 1,
-0.1564106, 1.657925, 0.03999071, 1, 0, 0, 1, 1,
-0.1522249, -0.4456154, -4.638068, 1, 0, 0, 1, 1,
-0.1497432, -0.8529759, -2.492066, 1, 0, 0, 1, 1,
-0.1465657, -1.958138, -3.699002, 1, 0, 0, 1, 1,
-0.1430592, 0.9461322, 0.7645296, 0, 0, 0, 1, 1,
-0.1399455, 0.6286781, 0.7942217, 0, 0, 0, 1, 1,
-0.1394847, -0.5716968, -2.586125, 0, 0, 0, 1, 1,
-0.1380904, 1.380767, -1.842367, 0, 0, 0, 1, 1,
-0.1287381, 1.230467, 0.8169588, 0, 0, 0, 1, 1,
-0.1276298, -0.2518465, -0.5704152, 0, 0, 0, 1, 1,
-0.1248854, 0.3785986, 0.5095127, 0, 0, 0, 1, 1,
-0.1240557, -0.05069783, -0.8497425, 1, 1, 1, 1, 1,
-0.1156148, 0.7926546, -0.8955659, 1, 1, 1, 1, 1,
-0.1146486, 0.4270547, -2.362654, 1, 1, 1, 1, 1,
-0.1134827, -0.1708174, -2.886223, 1, 1, 1, 1, 1,
-0.1056268, 0.3385656, 1.468596, 1, 1, 1, 1, 1,
-0.1007109, -0.3281129, -4.481128, 1, 1, 1, 1, 1,
-0.1001075, 0.8416952, -1.963248, 1, 1, 1, 1, 1,
-0.09755059, 1.853094, 0.8034014, 1, 1, 1, 1, 1,
-0.09202128, 0.4565011, -0.5937277, 1, 1, 1, 1, 1,
-0.09121656, 0.6570739, -0.305989, 1, 1, 1, 1, 1,
-0.09079207, 1.620975, -0.4536581, 1, 1, 1, 1, 1,
-0.08799199, 1.614025, -0.525117, 1, 1, 1, 1, 1,
-0.08690163, 1.083863, 0.7320636, 1, 1, 1, 1, 1,
-0.08647533, 0.9717956, -1.095706, 1, 1, 1, 1, 1,
-0.0820383, -0.2220508, -3.550549, 1, 1, 1, 1, 1,
-0.08121868, -0.6584537, -2.88342, 0, 0, 1, 1, 1,
-0.08027005, -0.5590105, -2.155982, 1, 0, 0, 1, 1,
-0.08013947, 1.754821, -0.3911949, 1, 0, 0, 1, 1,
-0.07966159, -1.181372, -3.243601, 1, 0, 0, 1, 1,
-0.0663861, -1.172804, -1.949618, 1, 0, 0, 1, 1,
-0.06444816, 0.369489, -0.2282878, 1, 0, 0, 1, 1,
-0.06163853, -0.5835528, -3.449562, 0, 0, 0, 1, 1,
-0.06124797, -0.8678552, -2.221686, 0, 0, 0, 1, 1,
-0.05748469, 0.9089432, 0.4598714, 0, 0, 0, 1, 1,
-0.05042225, -0.3203993, -2.90643, 0, 0, 0, 1, 1,
-0.04905649, 0.6835271, -1.056565, 0, 0, 0, 1, 1,
-0.04790298, 0.02280527, -0.4102035, 0, 0, 0, 1, 1,
-0.04710039, 0.7827243, 0.6191016, 0, 0, 0, 1, 1,
-0.04705957, 0.01075675, -2.635143, 1, 1, 1, 1, 1,
-0.04595332, 0.3462198, -2.42857, 1, 1, 1, 1, 1,
-0.04536536, 0.2256893, 0.8482797, 1, 1, 1, 1, 1,
-0.0445161, -1.985695, -4.219587, 1, 1, 1, 1, 1,
-0.04035513, -0.5041353, -2.72917, 1, 1, 1, 1, 1,
-0.03175354, -0.0936561, -2.711843, 1, 1, 1, 1, 1,
-0.02958056, 1.560017, 1.40201, 1, 1, 1, 1, 1,
-0.02291771, 1.672621, 1.740571, 1, 1, 1, 1, 1,
-0.02153284, -0.04534921, -3.435468, 1, 1, 1, 1, 1,
-0.02103491, -0.518003, -1.440476, 1, 1, 1, 1, 1,
-0.0195986, 0.9381785, 0.1567609, 1, 1, 1, 1, 1,
-0.01957531, -0.2299105, -1.996405, 1, 1, 1, 1, 1,
-0.01430552, 0.07471637, 1.171052, 1, 1, 1, 1, 1,
-0.01219763, -0.179261, -2.021348, 1, 1, 1, 1, 1,
-0.01051572, 1.065018, -1.010831, 1, 1, 1, 1, 1,
-0.008977828, -1.326771, -3.302719, 0, 0, 1, 1, 1,
-0.005577519, -0.2603274, -3.364225, 1, 0, 0, 1, 1,
-0.005365579, 0.198805, -2.108063, 1, 0, 0, 1, 1,
-0.004217563, 0.377019, -0.4871983, 1, 0, 0, 1, 1,
-0.002646927, 0.09801389, -2.263239, 1, 0, 0, 1, 1,
0.0005354554, 0.6136315, 0.7516192, 1, 0, 0, 1, 1,
0.003628375, 1.755958, -0.07494672, 0, 0, 0, 1, 1,
0.01143339, -0.3771022, 2.475542, 0, 0, 0, 1, 1,
0.01328591, -0.003426306, 2.698209, 0, 0, 0, 1, 1,
0.01496664, 0.2138865, -0.8666654, 0, 0, 0, 1, 1,
0.02424585, -0.9654282, 2.916232, 0, 0, 0, 1, 1,
0.02927844, -0.3019791, 3.294574, 0, 0, 0, 1, 1,
0.03298657, -1.556037, 4.58505, 0, 0, 0, 1, 1,
0.03973532, 0.0972121, 1.367706, 1, 1, 1, 1, 1,
0.04043679, -1.138974, 3.743623, 1, 1, 1, 1, 1,
0.0440514, 0.4878426, 0.9244913, 1, 1, 1, 1, 1,
0.04874698, -0.09996966, 2.62071, 1, 1, 1, 1, 1,
0.04973592, 0.8492287, -0.2213104, 1, 1, 1, 1, 1,
0.05429085, -0.9252487, 3.519483, 1, 1, 1, 1, 1,
0.05508176, -0.3382731, 2.561322, 1, 1, 1, 1, 1,
0.0557034, 0.4815212, -1.131475, 1, 1, 1, 1, 1,
0.05695313, -0.8781492, 3.380726, 1, 1, 1, 1, 1,
0.05725648, -0.8603027, 4.290648, 1, 1, 1, 1, 1,
0.05996473, -0.1633887, 2.56487, 1, 1, 1, 1, 1,
0.06245765, -0.3381915, 3.358473, 1, 1, 1, 1, 1,
0.0639846, 0.8412539, -0.5115953, 1, 1, 1, 1, 1,
0.06463508, 2.925646, 0.05578635, 1, 1, 1, 1, 1,
0.06894871, 0.03820177, 1.688729, 1, 1, 1, 1, 1,
0.06930681, -0.08116621, 0.567607, 0, 0, 1, 1, 1,
0.0711912, 0.9474898, 0.4091615, 1, 0, 0, 1, 1,
0.07777189, -1.576297, 3.684942, 1, 0, 0, 1, 1,
0.07825004, -0.3977866, 3.645771, 1, 0, 0, 1, 1,
0.07918265, 0.08301586, -0.7097712, 1, 0, 0, 1, 1,
0.0836065, -0.6042854, 3.484163, 1, 0, 0, 1, 1,
0.08614758, -0.03086773, 1.746076, 0, 0, 0, 1, 1,
0.08739106, -0.4540677, 1.217688, 0, 0, 0, 1, 1,
0.0948453, -0.9439923, 2.9999, 0, 0, 0, 1, 1,
0.09806871, 0.8942637, 0.7584219, 0, 0, 0, 1, 1,
0.1008915, -0.2184844, 3.342406, 0, 0, 0, 1, 1,
0.1021048, -0.1713221, 2.365615, 0, 0, 0, 1, 1,
0.1084479, -0.5073087, 3.69434, 0, 0, 0, 1, 1,
0.1141189, -1.14106, 2.493455, 1, 1, 1, 1, 1,
0.122471, 0.1116828, 0.5828422, 1, 1, 1, 1, 1,
0.1226932, -1.893805, 2.315431, 1, 1, 1, 1, 1,
0.1256289, 0.8342402, -0.1297563, 1, 1, 1, 1, 1,
0.1265706, 1.817324, 0.5098351, 1, 1, 1, 1, 1,
0.1269817, 2.00871, 0.2818076, 1, 1, 1, 1, 1,
0.1335966, 0.8745348, -1.218767, 1, 1, 1, 1, 1,
0.1365258, 0.3321465, -0.05574657, 1, 1, 1, 1, 1,
0.142671, 1.337343, -0.646591, 1, 1, 1, 1, 1,
0.1474598, -0.7356802, 0.9306694, 1, 1, 1, 1, 1,
0.1479431, 0.6885026, 1.235006, 1, 1, 1, 1, 1,
0.1491311, -0.6727819, 3.892185, 1, 1, 1, 1, 1,
0.1492997, 0.7022532, 0.5189355, 1, 1, 1, 1, 1,
0.151057, -0.2763187, 1.470261, 1, 1, 1, 1, 1,
0.1522434, 1.555561, -1.297493, 1, 1, 1, 1, 1,
0.1525395, 1.232183, 0.519421, 0, 0, 1, 1, 1,
0.1527217, -0.2262567, 0.03678469, 1, 0, 0, 1, 1,
0.1549692, -0.1982251, 2.378223, 1, 0, 0, 1, 1,
0.1570469, -0.03823134, 1.306201, 1, 0, 0, 1, 1,
0.1571693, -0.7602784, 3.455312, 1, 0, 0, 1, 1,
0.1649033, 0.7558101, 0.2753229, 1, 0, 0, 1, 1,
0.1661572, 1.173941, -0.5920104, 0, 0, 0, 1, 1,
0.1690948, 1.204311, -1.437364, 0, 0, 0, 1, 1,
0.1706861, 0.07293244, 0.8216725, 0, 0, 0, 1, 1,
0.1728471, 0.4523321, -1.034546, 0, 0, 0, 1, 1,
0.1734416, 0.3518178, -1.012992, 0, 0, 0, 1, 1,
0.175102, -0.6248213, 2.402039, 0, 0, 0, 1, 1,
0.1764745, 0.8942361, 0.5136634, 0, 0, 0, 1, 1,
0.1784236, 0.9510433, 0.985342, 1, 1, 1, 1, 1,
0.1790404, -0.1151627, 3.043786, 1, 1, 1, 1, 1,
0.1819881, -0.7140728, 3.306809, 1, 1, 1, 1, 1,
0.1857277, 0.2796202, -0.2441494, 1, 1, 1, 1, 1,
0.1873567, 0.5261403, 2.715247, 1, 1, 1, 1, 1,
0.188814, -0.3652252, 3.295161, 1, 1, 1, 1, 1,
0.1903727, 1.223963, 0.821326, 1, 1, 1, 1, 1,
0.1920709, 0.6083717, 0.05644703, 1, 1, 1, 1, 1,
0.197609, -0.8641479, 2.700684, 1, 1, 1, 1, 1,
0.2021551, -2.204338, 3.273793, 1, 1, 1, 1, 1,
0.2068392, -1.69711, 3.040217, 1, 1, 1, 1, 1,
0.2112755, 1.077688, 0.6195134, 1, 1, 1, 1, 1,
0.2138753, 0.616081, 1.235636, 1, 1, 1, 1, 1,
0.2139107, 1.9433, 1.136995, 1, 1, 1, 1, 1,
0.2140778, 0.2796001, 1.267122, 1, 1, 1, 1, 1,
0.2149975, 0.0619281, 1.248621, 0, 0, 1, 1, 1,
0.2160422, 0.1316134, 0.9185433, 1, 0, 0, 1, 1,
0.2173495, -0.01255467, 0.6505306, 1, 0, 0, 1, 1,
0.219439, -0.5308268, 3.533744, 1, 0, 0, 1, 1,
0.2216229, -1.737642, 2.64438, 1, 0, 0, 1, 1,
0.222278, 0.6378219, 0.2744352, 1, 0, 0, 1, 1,
0.2284306, 0.9288622, 0.985752, 0, 0, 0, 1, 1,
0.2293794, 2.43297, -1.480811, 0, 0, 0, 1, 1,
0.2322093, 0.4582616, 1.687692, 0, 0, 0, 1, 1,
0.2326506, -0.4390871, 2.001116, 0, 0, 0, 1, 1,
0.2347918, 1.281325, -1.058963, 0, 0, 0, 1, 1,
0.238349, -0.1245514, 2.550431, 0, 0, 0, 1, 1,
0.2384755, -0.6723756, 2.375838, 0, 0, 0, 1, 1,
0.2393313, -0.8810567, 3.289444, 1, 1, 1, 1, 1,
0.2400025, 0.3391868, -0.1571592, 1, 1, 1, 1, 1,
0.2428707, -0.4730187, 2.654243, 1, 1, 1, 1, 1,
0.2436589, -1.090666, 2.186227, 1, 1, 1, 1, 1,
0.243688, 0.1047161, 0.2819853, 1, 1, 1, 1, 1,
0.2443276, -0.4385342, 2.83604, 1, 1, 1, 1, 1,
0.2475261, 1.397983, -0.7089818, 1, 1, 1, 1, 1,
0.247684, 0.7147999, 1.168049, 1, 1, 1, 1, 1,
0.2491617, -0.4724838, 2.625567, 1, 1, 1, 1, 1,
0.2492804, -0.3506757, 0.44053, 1, 1, 1, 1, 1,
0.2525817, -0.7030726, 2.538681, 1, 1, 1, 1, 1,
0.2536845, 1.455249, 1.078048, 1, 1, 1, 1, 1,
0.2554707, 0.1977651, 0.9129171, 1, 1, 1, 1, 1,
0.2608118, -0.848527, 2.856771, 1, 1, 1, 1, 1,
0.2612824, 1.506576, 1.55263, 1, 1, 1, 1, 1,
0.262567, 0.712279, 0.6111176, 0, 0, 1, 1, 1,
0.2657352, -0.6665846, 2.430774, 1, 0, 0, 1, 1,
0.2671583, 0.6169791, -0.1521736, 1, 0, 0, 1, 1,
0.2737536, -0.8533204, 3.808829, 1, 0, 0, 1, 1,
0.2753707, 0.7998426, 1.524785, 1, 0, 0, 1, 1,
0.2789758, -0.8529222, 2.595244, 1, 0, 0, 1, 1,
0.281083, -0.7638111, 3.095209, 0, 0, 0, 1, 1,
0.2818841, 0.01999422, 1.938476, 0, 0, 0, 1, 1,
0.2871394, -0.8484224, 3.604873, 0, 0, 0, 1, 1,
0.2898031, -0.5611547, 3.084898, 0, 0, 0, 1, 1,
0.2970855, -0.005011629, 2.00985, 0, 0, 0, 1, 1,
0.2977511, -1.040752, 1.881284, 0, 0, 0, 1, 1,
0.304823, 0.2110521, 0.8698971, 0, 0, 0, 1, 1,
0.3137253, 0.5102495, 0.07173592, 1, 1, 1, 1, 1,
0.3151631, 1.966591, -0.4684204, 1, 1, 1, 1, 1,
0.3161623, 0.3019942, 0.769055, 1, 1, 1, 1, 1,
0.3182933, -0.498456, 3.031374, 1, 1, 1, 1, 1,
0.3247384, 1.082222, 0.3801087, 1, 1, 1, 1, 1,
0.3255233, -1.124788, 0.9934911, 1, 1, 1, 1, 1,
0.3303955, 0.7809474, 0.4321236, 1, 1, 1, 1, 1,
0.332537, -2.71762, 3.816657, 1, 1, 1, 1, 1,
0.333874, 0.05804137, 2.102442, 1, 1, 1, 1, 1,
0.3395663, -1.016948, 1.334981, 1, 1, 1, 1, 1,
0.3450733, -0.01647397, 0.3246076, 1, 1, 1, 1, 1,
0.3492162, -0.3047736, 0.2087293, 1, 1, 1, 1, 1,
0.352655, -0.0657552, 0.9959554, 1, 1, 1, 1, 1,
0.3527657, -2.75304, 3.199439, 1, 1, 1, 1, 1,
0.3614752, 0.3730466, 1.69203, 1, 1, 1, 1, 1,
0.3659925, -0.944762, 3.698538, 0, 0, 1, 1, 1,
0.3718868, -1.308884, 4.050096, 1, 0, 0, 1, 1,
0.3724792, 0.9326732, 2.350165, 1, 0, 0, 1, 1,
0.3811795, -0.9523147, 1.026596, 1, 0, 0, 1, 1,
0.3855368, -0.2572466, 1.575987, 1, 0, 0, 1, 1,
0.3872495, -0.5667058, 2.542551, 1, 0, 0, 1, 1,
0.3875328, 0.7575023, -0.6697905, 0, 0, 0, 1, 1,
0.3887753, 0.9764799, 0.5507103, 0, 0, 0, 1, 1,
0.3905328, 0.1441941, 2.029955, 0, 0, 0, 1, 1,
0.3906788, 0.0132042, 0.8395032, 0, 0, 0, 1, 1,
0.3944148, 0.2393738, 2.200187, 0, 0, 0, 1, 1,
0.3955459, -0.9464136, 3.51719, 0, 0, 0, 1, 1,
0.4035905, 0.1026028, 1.811639, 0, 0, 0, 1, 1,
0.4063679, 0.0789855, 1.601223, 1, 1, 1, 1, 1,
0.4090366, 1.104298, 1.535696, 1, 1, 1, 1, 1,
0.4098816, -1.557468, 1.690117, 1, 1, 1, 1, 1,
0.4099207, -0.8587129, 3.793283, 1, 1, 1, 1, 1,
0.4121588, 0.08448518, 1.551873, 1, 1, 1, 1, 1,
0.4122223, 0.2402513, 2.258734, 1, 1, 1, 1, 1,
0.4141947, -0.755628, 1.859612, 1, 1, 1, 1, 1,
0.4147353, 0.6657849, 1.990873, 1, 1, 1, 1, 1,
0.4170738, 0.1645569, 2.404095, 1, 1, 1, 1, 1,
0.4212354, 0.6853777, 1.927084, 1, 1, 1, 1, 1,
0.4225211, 0.2640549, 2.231469, 1, 1, 1, 1, 1,
0.4232141, -0.09319225, 2.389426, 1, 1, 1, 1, 1,
0.4310325, 1.582313, 0.8521857, 1, 1, 1, 1, 1,
0.4313909, 1.182862, -2.162716, 1, 1, 1, 1, 1,
0.4335594, -1.393593, 3.35239, 1, 1, 1, 1, 1,
0.4352042, 0.6459678, 1.590548, 0, 0, 1, 1, 1,
0.439875, -0.9787781, 3.058563, 1, 0, 0, 1, 1,
0.4514535, -0.7977771, 3.462957, 1, 0, 0, 1, 1,
0.45329, 0.1289488, 1.704848, 1, 0, 0, 1, 1,
0.4593547, -1.527177, 2.335515, 1, 0, 0, 1, 1,
0.4620873, -1.192274, 3.593559, 1, 0, 0, 1, 1,
0.4667909, -0.6696405, 3.819691, 0, 0, 0, 1, 1,
0.4715177, 0.8681837, 0.905512, 0, 0, 0, 1, 1,
0.4717826, 0.6454606, 1.761511, 0, 0, 0, 1, 1,
0.4729147, 0.4772494, 1.560905, 0, 0, 0, 1, 1,
0.4741157, 0.3680081, -0.6276708, 0, 0, 0, 1, 1,
0.4742067, -0.2136136, 2.435244, 0, 0, 0, 1, 1,
0.4747285, -0.9713663, 2.05444, 0, 0, 0, 1, 1,
0.475835, -0.8472954, 3.589354, 1, 1, 1, 1, 1,
0.477542, 0.3033652, 1.152297, 1, 1, 1, 1, 1,
0.4836349, -0.02673068, 2.352233, 1, 1, 1, 1, 1,
0.4853049, -0.566875, 0.679019, 1, 1, 1, 1, 1,
0.4870476, -0.7487233, 2.385177, 1, 1, 1, 1, 1,
0.4907143, -1.114353, 2.078296, 1, 1, 1, 1, 1,
0.491239, 0.9249286, 0.7900498, 1, 1, 1, 1, 1,
0.4959269, -0.1365403, 3.330438, 1, 1, 1, 1, 1,
0.4975884, 0.8031322, 0.9310144, 1, 1, 1, 1, 1,
0.500146, -1.417166, 3.449322, 1, 1, 1, 1, 1,
0.5013404, 0.2968429, 1.08563, 1, 1, 1, 1, 1,
0.5015911, -0.1822647, -0.8022987, 1, 1, 1, 1, 1,
0.5087739, 0.2612341, 0.5908179, 1, 1, 1, 1, 1,
0.5105882, 0.5208537, 1.132711, 1, 1, 1, 1, 1,
0.5137242, -1.416682, 2.710637, 1, 1, 1, 1, 1,
0.5162875, 0.09908315, 2.677441, 0, 0, 1, 1, 1,
0.5170802, -0.145462, 1.36439, 1, 0, 0, 1, 1,
0.519991, 0.3394252, 3.337604, 1, 0, 0, 1, 1,
0.5205299, 0.2566459, 0.3873934, 1, 0, 0, 1, 1,
0.5236277, -0.9869003, 2.166186, 1, 0, 0, 1, 1,
0.5244332, 0.06213205, 3.249682, 1, 0, 0, 1, 1,
0.525852, 1.274301, -0.696501, 0, 0, 0, 1, 1,
0.5268252, 0.2980476, 0.03757499, 0, 0, 0, 1, 1,
0.5312635, -1.408989, 4.285956, 0, 0, 0, 1, 1,
0.5353523, 2.003439, -1.112666, 0, 0, 0, 1, 1,
0.5371894, -0.9814472, 4.509543, 0, 0, 0, 1, 1,
0.5371994, -0.4152492, 2.26986, 0, 0, 0, 1, 1,
0.5381643, -0.660297, 1.834857, 0, 0, 0, 1, 1,
0.539806, 1.50183, 2.436844, 1, 1, 1, 1, 1,
0.5420241, -1.259338, 1.421804, 1, 1, 1, 1, 1,
0.5452567, -0.3743219, 2.082205, 1, 1, 1, 1, 1,
0.5493748, 0.06576151, 1.574983, 1, 1, 1, 1, 1,
0.5548942, -1.224028, 1.493742, 1, 1, 1, 1, 1,
0.5607172, -0.08011919, 1.209094, 1, 1, 1, 1, 1,
0.5655581, -2.289306, 1.934234, 1, 1, 1, 1, 1,
0.5739441, 1.347613, 0.2834606, 1, 1, 1, 1, 1,
0.5759132, 1.154145, -0.4844206, 1, 1, 1, 1, 1,
0.5767847, 0.123599, -0.58878, 1, 1, 1, 1, 1,
0.5781247, 0.7847917, 1.159624, 1, 1, 1, 1, 1,
0.5784096, -0.7305898, 3.29757, 1, 1, 1, 1, 1,
0.5803899, -1.381973, 2.885092, 1, 1, 1, 1, 1,
0.5838108, -0.7115921, 4.742616, 1, 1, 1, 1, 1,
0.5847222, 1.007396, 0.4332638, 1, 1, 1, 1, 1,
0.5851119, -0.8814125, 2.294153, 0, 0, 1, 1, 1,
0.587501, -2.136292, 2.543821, 1, 0, 0, 1, 1,
0.5877631, 0.7887402, -1.587984, 1, 0, 0, 1, 1,
0.5945809, -0.4572744, 3.694737, 1, 0, 0, 1, 1,
0.6015097, 0.9571161, 1.938691, 1, 0, 0, 1, 1,
0.6044833, 0.8534196, 0.4060643, 1, 0, 0, 1, 1,
0.6120769, 0.9842539, -0.02131434, 0, 0, 0, 1, 1,
0.6128945, -0.1697956, 2.31955, 0, 0, 0, 1, 1,
0.6138588, 0.7465842, 1.301345, 0, 0, 0, 1, 1,
0.616792, 0.8992965, 1.244466, 0, 0, 0, 1, 1,
0.6196665, 1.426346, 0.7547486, 0, 0, 0, 1, 1,
0.6249524, 2.231154, 0.04762754, 0, 0, 0, 1, 1,
0.6250734, 0.935507, 1.918045, 0, 0, 0, 1, 1,
0.6264384, -1.128628, 3.257166, 1, 1, 1, 1, 1,
0.6326184, -0.5670162, 1.520641, 1, 1, 1, 1, 1,
0.6454477, -0.8446357, 0.8735685, 1, 1, 1, 1, 1,
0.6457298, -0.8917827, 2.126448, 1, 1, 1, 1, 1,
0.6540374, 1.733564, -0.939205, 1, 1, 1, 1, 1,
0.6542426, 0.8472814, 0.711967, 1, 1, 1, 1, 1,
0.6627036, -1.553126, 3.658736, 1, 1, 1, 1, 1,
0.6638333, -0.5306949, 0.5169006, 1, 1, 1, 1, 1,
0.6645691, -1.320923, 4.095426, 1, 1, 1, 1, 1,
0.6687108, 0.4608916, 0.9337585, 1, 1, 1, 1, 1,
0.6714098, 1.132444, -0.2596173, 1, 1, 1, 1, 1,
0.6718836, -0.7428616, 2.052986, 1, 1, 1, 1, 1,
0.6720333, 2.411689, 1.436878, 1, 1, 1, 1, 1,
0.6738625, -0.7477889, 2.791314, 1, 1, 1, 1, 1,
0.690366, -1.857962, 1.410515, 1, 1, 1, 1, 1,
0.691195, 0.1226178, 2.253802, 0, 0, 1, 1, 1,
0.6926041, 1.15626, 0.4864369, 1, 0, 0, 1, 1,
0.6931224, 0.08616219, 1.524319, 1, 0, 0, 1, 1,
0.6953515, 0.2350935, 1.882772, 1, 0, 0, 1, 1,
0.7022658, 0.3199997, 1.128215, 1, 0, 0, 1, 1,
0.7045168, -0.7718349, 2.228387, 1, 0, 0, 1, 1,
0.704572, -1.62353, 4.05052, 0, 0, 0, 1, 1,
0.706608, 0.05972303, 1.451842, 0, 0, 0, 1, 1,
0.7077249, 0.8693752, -0.8451932, 0, 0, 0, 1, 1,
0.7092267, 1.047813, 1.029601, 0, 0, 0, 1, 1,
0.7105354, -0.5245278, 0.2547157, 0, 0, 0, 1, 1,
0.7208194, 0.2345264, -0.3725899, 0, 0, 0, 1, 1,
0.7210609, -0.07295916, 3.892192, 0, 0, 0, 1, 1,
0.7212698, -1.060344, 2.865127, 1, 1, 1, 1, 1,
0.7225661, 0.1704843, 1.15243, 1, 1, 1, 1, 1,
0.7225999, -1.458919, 2.14963, 1, 1, 1, 1, 1,
0.7265834, -2.038919, 1.635633, 1, 1, 1, 1, 1,
0.7276315, 2.018358, 0.5081992, 1, 1, 1, 1, 1,
0.7277014, 0.722037, 0.2628811, 1, 1, 1, 1, 1,
0.7277921, -0.975347, 2.559011, 1, 1, 1, 1, 1,
0.7374638, -1.221641, 3.643572, 1, 1, 1, 1, 1,
0.7391578, 0.3869324, 0.8211836, 1, 1, 1, 1, 1,
0.7401057, 1.051828, 1.780397, 1, 1, 1, 1, 1,
0.7449769, 1.189959, -0.3460284, 1, 1, 1, 1, 1,
0.746002, -0.4808323, 1.668021, 1, 1, 1, 1, 1,
0.7469233, 0.1734077, 0.989552, 1, 1, 1, 1, 1,
0.7554884, 1.129002, 0.4570693, 1, 1, 1, 1, 1,
0.7589684, 1.69364, -0.2162357, 1, 1, 1, 1, 1,
0.7598863, -0.2247929, 1.395935, 0, 0, 1, 1, 1,
0.762106, -0.2548826, 2.114633, 1, 0, 0, 1, 1,
0.7676561, -0.6360036, 2.332103, 1, 0, 0, 1, 1,
0.767842, 1.735729, 0.001188059, 1, 0, 0, 1, 1,
0.7694478, 1.042289, 1.036036, 1, 0, 0, 1, 1,
0.7705459, 0.3456991, 1.779956, 1, 0, 0, 1, 1,
0.7751912, 0.4749137, 2.574091, 0, 0, 0, 1, 1,
0.779878, -0.05766174, -0.1309235, 0, 0, 0, 1, 1,
0.7811435, 1.799452, 0.1190095, 0, 0, 0, 1, 1,
0.7861603, 0.9272624, 2.254545, 0, 0, 0, 1, 1,
0.7890297, -0.2021786, 2.29441, 0, 0, 0, 1, 1,
0.7941084, -1.423827, 4.570045, 0, 0, 0, 1, 1,
0.7973211, -0.9517479, 3.285189, 0, 0, 0, 1, 1,
0.7994316, -0.1490428, 2.028654, 1, 1, 1, 1, 1,
0.8011135, 0.5096316, 2.240047, 1, 1, 1, 1, 1,
0.8110735, -0.3967208, 3.046493, 1, 1, 1, 1, 1,
0.814772, -0.3950894, 0.549961, 1, 1, 1, 1, 1,
0.8191516, 0.8671594, 0.105124, 1, 1, 1, 1, 1,
0.8197539, 0.3291787, 1.603704, 1, 1, 1, 1, 1,
0.8216767, -1.350977, -0.06580351, 1, 1, 1, 1, 1,
0.8324992, 0.3908066, 1.769109, 1, 1, 1, 1, 1,
0.8372284, 0.4514403, 2.371897, 1, 1, 1, 1, 1,
0.8465034, -1.717642, 2.169284, 1, 1, 1, 1, 1,
0.8476523, -0.7805035, 2.766775, 1, 1, 1, 1, 1,
0.8481649, 0.3057673, 0.2892284, 1, 1, 1, 1, 1,
0.8486222, -1.402931, 1.9084, 1, 1, 1, 1, 1,
0.8520584, 1.580989, -1.18357, 1, 1, 1, 1, 1,
0.854206, 0.5979329, 0.4872252, 1, 1, 1, 1, 1,
0.8572497, 0.7675731, 0.1186634, 0, 0, 1, 1, 1,
0.8592493, -1.213196, 1.514489, 1, 0, 0, 1, 1,
0.8627141, -0.1226691, 2.341499, 1, 0, 0, 1, 1,
0.8643913, 0.4601108, 1.718601, 1, 0, 0, 1, 1,
0.8651803, 0.4408885, 1.274393, 1, 0, 0, 1, 1,
0.8686458, 0.2204601, 1.857362, 1, 0, 0, 1, 1,
0.8843733, 0.4037928, 0.947212, 0, 0, 0, 1, 1,
0.8845615, -0.5099552, 1.045865, 0, 0, 0, 1, 1,
0.8859429, -1.937956, 2.397641, 0, 0, 0, 1, 1,
0.8866921, -0.4308979, 2.035835, 0, 0, 0, 1, 1,
0.888105, 0.1690655, 1.889802, 0, 0, 0, 1, 1,
0.8917674, 2.039315, 0.8823767, 0, 0, 0, 1, 1,
0.8988877, 1.20461, 1.445184, 0, 0, 0, 1, 1,
0.9026011, -1.225232, 2.601598, 1, 1, 1, 1, 1,
0.9039859, 1.846036, 0.3950688, 1, 1, 1, 1, 1,
0.9059461, -0.05449029, -0.7756019, 1, 1, 1, 1, 1,
0.9082232, -0.7149758, 2.1841, 1, 1, 1, 1, 1,
0.9102501, 0.5919138, 1.432079, 1, 1, 1, 1, 1,
0.912001, 0.2694453, 1.843061, 1, 1, 1, 1, 1,
0.9136668, -1.310833, 1.120095, 1, 1, 1, 1, 1,
0.9211762, -0.3867283, 2.007038, 1, 1, 1, 1, 1,
0.9220127, -0.130851, 2.300482, 1, 1, 1, 1, 1,
0.9240724, 1.112021, 2.051114, 1, 1, 1, 1, 1,
0.9279099, -1.553615, 2.32917, 1, 1, 1, 1, 1,
0.9329453, -1.209499, 1.606438, 1, 1, 1, 1, 1,
0.9349419, 0.5760361, 1.616644, 1, 1, 1, 1, 1,
0.9416292, 0.1425479, 1.591898, 1, 1, 1, 1, 1,
0.942182, 0.6529364, 0.4342599, 1, 1, 1, 1, 1,
0.9501321, 0.2397234, 1.947755, 0, 0, 1, 1, 1,
0.960193, 0.2110253, 3.312879, 1, 0, 0, 1, 1,
0.9611615, 0.006036353, 1.958243, 1, 0, 0, 1, 1,
0.9616494, -0.8020828, 1.995024, 1, 0, 0, 1, 1,
0.9650542, -0.354532, 0.287598, 1, 0, 0, 1, 1,
0.9744021, 0.06619624, 2.273525, 1, 0, 0, 1, 1,
0.9768329, -0.5650494, 4.083479, 0, 0, 0, 1, 1,
0.9805689, -0.4027919, 1.862986, 0, 0, 0, 1, 1,
0.9808154, 0.1529938, 1.320423, 0, 0, 0, 1, 1,
0.9818491, 0.2598946, 1.618624, 0, 0, 0, 1, 1,
0.9842011, 1.192333, 3.398725, 0, 0, 0, 1, 1,
0.9867968, 1.227187, 2.109771, 0, 0, 0, 1, 1,
0.9872161, -1.798905, 3.377831, 0, 0, 0, 1, 1,
0.9881921, 0.4754036, 2.74933, 1, 1, 1, 1, 1,
0.999374, 0.04985629, 0.8301266, 1, 1, 1, 1, 1,
1.009098, -1.039494, 2.61868, 1, 1, 1, 1, 1,
1.011292, -0.55339, 2.929969, 1, 1, 1, 1, 1,
1.011393, -1.044924, 0.9210711, 1, 1, 1, 1, 1,
1.011835, -1.665657, 1.360857, 1, 1, 1, 1, 1,
1.016582, 0.8432031, 0.7464621, 1, 1, 1, 1, 1,
1.016717, -1.465368, 2.14826, 1, 1, 1, 1, 1,
1.019487, 0.240133, 0.5606989, 1, 1, 1, 1, 1,
1.021059, 0.2457013, 2.424723, 1, 1, 1, 1, 1,
1.023509, -0.1271984, 1.052409, 1, 1, 1, 1, 1,
1.033173, -0.9078519, 1.676686, 1, 1, 1, 1, 1,
1.034006, -0.5143412, -0.3691999, 1, 1, 1, 1, 1,
1.041767, -0.7449796, 1.550952, 1, 1, 1, 1, 1,
1.043602, 1.164499, 2.07662, 1, 1, 1, 1, 1,
1.051899, 0.966821, 2.287466, 0, 0, 1, 1, 1,
1.069528, 2.294467, 0.8212856, 1, 0, 0, 1, 1,
1.071221, 1.169888, 0.6971816, 1, 0, 0, 1, 1,
1.071427, 1.523079, -0.3218873, 1, 0, 0, 1, 1,
1.077777, 0.1917256, 1.341728, 1, 0, 0, 1, 1,
1.079971, 0.1968867, 0.6348931, 1, 0, 0, 1, 1,
1.08228, 1.491926, -0.5586672, 0, 0, 0, 1, 1,
1.082793, -1.215014, 2.507642, 0, 0, 0, 1, 1,
1.085644, 0.7198078, 2.874639, 0, 0, 0, 1, 1,
1.086376, 0.2389704, 1.021743, 0, 0, 0, 1, 1,
1.087387, 1.174403, 0.9608086, 0, 0, 0, 1, 1,
1.094617, 0.3343508, 0.6812217, 0, 0, 0, 1, 1,
1.09882, 0.1785342, 0.16569, 0, 0, 0, 1, 1,
1.099755, -1.078546, 2.138103, 1, 1, 1, 1, 1,
1.100454, 0.9881662, 0.4260293, 1, 1, 1, 1, 1,
1.105029, -0.9885489, 1.745806, 1, 1, 1, 1, 1,
1.108084, 1.3079, 0.09444851, 1, 1, 1, 1, 1,
1.109761, 0.8209471, 0.9879419, 1, 1, 1, 1, 1,
1.11232, -0.5154831, 1.738056, 1, 1, 1, 1, 1,
1.117607, 1.22558, 1.582253, 1, 1, 1, 1, 1,
1.128542, 0.6845723, 1.615377, 1, 1, 1, 1, 1,
1.130994, 0.2357421, 1.52113, 1, 1, 1, 1, 1,
1.134252, 0.7164479, 0.2461532, 1, 1, 1, 1, 1,
1.134578, -2.693542, 0.9786921, 1, 1, 1, 1, 1,
1.138266, 0.9173475, -0.7506722, 1, 1, 1, 1, 1,
1.143483, 0.177151, 1.140666, 1, 1, 1, 1, 1,
1.166891, 0.3928112, 0.8330931, 1, 1, 1, 1, 1,
1.172309, -0.1879519, 2.769629, 1, 1, 1, 1, 1,
1.173404, -0.07447957, 2.175481, 0, 0, 1, 1, 1,
1.175645, -0.4688384, 2.234692, 1, 0, 0, 1, 1,
1.181975, 0.08484308, 1.661559, 1, 0, 0, 1, 1,
1.182257, -0.6453345, 3.539217, 1, 0, 0, 1, 1,
1.188288, 0.6322536, 0.8885461, 1, 0, 0, 1, 1,
1.18848, 0.5602109, 0.9665058, 1, 0, 0, 1, 1,
1.190493, -0.8871441, 1.91921, 0, 0, 0, 1, 1,
1.197551, 1.188322, 1.323658, 0, 0, 0, 1, 1,
1.203567, -0.2540519, -0.6425434, 0, 0, 0, 1, 1,
1.207105, -1.311407, 0.6511068, 0, 0, 0, 1, 1,
1.220748, 2.361336, 0.674087, 0, 0, 0, 1, 1,
1.23223, -0.3349357, 1.033751, 0, 0, 0, 1, 1,
1.232689, 1.555488, 1.123286, 0, 0, 0, 1, 1,
1.233929, -0.009646047, 2.700498, 1, 1, 1, 1, 1,
1.235833, -0.9871169, 3.110928, 1, 1, 1, 1, 1,
1.236811, 0.7653239, 0.4680651, 1, 1, 1, 1, 1,
1.243455, -0.8379177, 0.7281932, 1, 1, 1, 1, 1,
1.246275, -0.04269309, 1.778566, 1, 1, 1, 1, 1,
1.247008, -0.5982636, 1.968022, 1, 1, 1, 1, 1,
1.25778, 0.4785152, 0.7677752, 1, 1, 1, 1, 1,
1.259402, -0.4725397, 1.825081, 1, 1, 1, 1, 1,
1.275296, -0.6020342, 0.8218943, 1, 1, 1, 1, 1,
1.278361, -0.6579074, 2.073858, 1, 1, 1, 1, 1,
1.283196, -0.009539521, 3.070889, 1, 1, 1, 1, 1,
1.28444, -0.8145633, 3.406745, 1, 1, 1, 1, 1,
1.285228, 0.170788, 0.5245195, 1, 1, 1, 1, 1,
1.287811, -0.611372, 1.235162, 1, 1, 1, 1, 1,
1.296601, -0.2168336, 2.025426, 1, 1, 1, 1, 1,
1.297889, 1.499908, 0.6130524, 0, 0, 1, 1, 1,
1.316565, 0.01713214, 2.07038, 1, 0, 0, 1, 1,
1.319291, 0.1991024, 1.14971, 1, 0, 0, 1, 1,
1.326385, 0.7267498, 0.2450611, 1, 0, 0, 1, 1,
1.330182, -0.5851025, 1.90083, 1, 0, 0, 1, 1,
1.339265, 0.6992737, 1.446217, 1, 0, 0, 1, 1,
1.356304, 0.8715644, 0.3353256, 0, 0, 0, 1, 1,
1.356376, -1.458499, 1.383651, 0, 0, 0, 1, 1,
1.358598, 0.0366853, 3.658559, 0, 0, 0, 1, 1,
1.366764, -0.8552635, 3.883696, 0, 0, 0, 1, 1,
1.371839, -1.995084, 2.431879, 0, 0, 0, 1, 1,
1.382598, -0.04151316, 2.384156, 0, 0, 0, 1, 1,
1.383318, 0.2514714, 2.827199, 0, 0, 0, 1, 1,
1.390355, -1.505369, 2.728715, 1, 1, 1, 1, 1,
1.401343, -0.5900763, 2.228935, 1, 1, 1, 1, 1,
1.424167, 0.6853207, 1.250702, 1, 1, 1, 1, 1,
1.424605, 0.6970168, -0.5894435, 1, 1, 1, 1, 1,
1.434007, 0.5794798, 1.679791, 1, 1, 1, 1, 1,
1.43909, -0.1226008, -0.4591693, 1, 1, 1, 1, 1,
1.444276, -0.7036167, 1.380927, 1, 1, 1, 1, 1,
1.46069, 1.546007, 0.176537, 1, 1, 1, 1, 1,
1.465445, 0.001851431, 2.145172, 1, 1, 1, 1, 1,
1.465963, -1.260609, 2.315331, 1, 1, 1, 1, 1,
1.47167, -0.2114347, 1.559182, 1, 1, 1, 1, 1,
1.477557, 0.625002, -0.1332752, 1, 1, 1, 1, 1,
1.47774, 1.431134, 1.457347, 1, 1, 1, 1, 1,
1.478836, 0.889366, -0.1115909, 1, 1, 1, 1, 1,
1.481084, -1.278968, 1.181772, 1, 1, 1, 1, 1,
1.482636, 0.1775312, -0.6740823, 0, 0, 1, 1, 1,
1.496323, -1.607148, 3.653069, 1, 0, 0, 1, 1,
1.50311, 1.055781, 0.8166763, 1, 0, 0, 1, 1,
1.506959, -0.1266717, 1.953964, 1, 0, 0, 1, 1,
1.525601, 1.790324, 1.152116, 1, 0, 0, 1, 1,
1.530172, 0.06904715, 0.4171233, 1, 0, 0, 1, 1,
1.535869, 0.3802904, 1.316184, 0, 0, 0, 1, 1,
1.539394, 0.2267878, 3.270207, 0, 0, 0, 1, 1,
1.555155, 0.1547655, 1.238754, 0, 0, 0, 1, 1,
1.557841, 0.919058, 1.129031, 0, 0, 0, 1, 1,
1.562725, 1.24882, 0.7775187, 0, 0, 0, 1, 1,
1.565285, -0.7650774, 2.494744, 0, 0, 0, 1, 1,
1.566876, -0.5663904, 0.8641106, 0, 0, 0, 1, 1,
1.574752, -0.5768864, 2.790267, 1, 1, 1, 1, 1,
1.586228, 1.006526, 3.049992, 1, 1, 1, 1, 1,
1.591737, -0.2228751, 1.335516, 1, 1, 1, 1, 1,
1.600429, -1.004887, 1.755423, 1, 1, 1, 1, 1,
1.600641, 1.127394, 0.7418317, 1, 1, 1, 1, 1,
1.602137, -0.6774932, 1.521344, 1, 1, 1, 1, 1,
1.616658, 1.64865, 0.264044, 1, 1, 1, 1, 1,
1.617998, 0.7073349, 0.832493, 1, 1, 1, 1, 1,
1.623355, -0.6397181, 2.106522, 1, 1, 1, 1, 1,
1.630724, 0.3321544, 1.796379, 1, 1, 1, 1, 1,
1.651756, 1.466788, 1.586469, 1, 1, 1, 1, 1,
1.663722, 0.6048062, 1.909922, 1, 1, 1, 1, 1,
1.667878, -0.3174804, 1.667956, 1, 1, 1, 1, 1,
1.669326, -1.321769, 2.682337, 1, 1, 1, 1, 1,
1.67018, 0.84487, 0.7282817, 1, 1, 1, 1, 1,
1.693653, -1.207101, 3.176819, 0, 0, 1, 1, 1,
1.694356, 0.1070849, 2.305073, 1, 0, 0, 1, 1,
1.706234, -0.2858902, 3.220927, 1, 0, 0, 1, 1,
1.713464, 0.6855785, -1.13115, 1, 0, 0, 1, 1,
1.714066, -0.4780345, 3.831198, 1, 0, 0, 1, 1,
1.721345, 1.169144, 0.6721392, 1, 0, 0, 1, 1,
1.721448, 0.2144772, 2.362379, 0, 0, 0, 1, 1,
1.747741, 0.6815224, 0.4257554, 0, 0, 0, 1, 1,
1.749941, 0.3759118, 0.8125343, 0, 0, 0, 1, 1,
1.772156, -0.3766997, 0.9187036, 0, 0, 0, 1, 1,
1.779785, -1.361375, 3.850841, 0, 0, 0, 1, 1,
1.781026, -1.413735, 0.9911718, 0, 0, 0, 1, 1,
1.791801, -1.012508, 4.383026, 0, 0, 0, 1, 1,
1.800649, -0.5861704, 3.411053, 1, 1, 1, 1, 1,
1.812222, 0.5868902, 2.352993, 1, 1, 1, 1, 1,
1.818226, 1.620909, 0.8899547, 1, 1, 1, 1, 1,
1.82993, -0.3004227, 1.682127, 1, 1, 1, 1, 1,
1.85045, 0.09030579, 0.6422544, 1, 1, 1, 1, 1,
1.886565, 0.5130111, 1.315356, 1, 1, 1, 1, 1,
1.913973, 0.3206033, -0.1866088, 1, 1, 1, 1, 1,
1.914177, 0.8181096, 0.5785013, 1, 1, 1, 1, 1,
1.918211, -0.001589991, 0.4213921, 1, 1, 1, 1, 1,
1.923542, -0.7265589, 1.156585, 1, 1, 1, 1, 1,
1.924721, 0.9208286, -1.399463, 1, 1, 1, 1, 1,
1.938841, -0.3513496, 1.780746, 1, 1, 1, 1, 1,
1.939298, -1.184926, 3.228602, 1, 1, 1, 1, 1,
1.958762, -1.327203, 2.280512, 1, 1, 1, 1, 1,
1.985252, -0.6746454, 1.868791, 1, 1, 1, 1, 1,
1.994533, 0.3592184, 2.025187, 0, 0, 1, 1, 1,
2.012857, 0.7855342, 0.7847508, 1, 0, 0, 1, 1,
2.046125, -1.437941, 3.249812, 1, 0, 0, 1, 1,
2.05424, -0.2112326, 1.796151, 1, 0, 0, 1, 1,
2.058793, 0.07991793, 0.3612995, 1, 0, 0, 1, 1,
2.089398, -0.04098153, 0.4372967, 1, 0, 0, 1, 1,
2.142262, 0.1390644, 2.13124, 0, 0, 0, 1, 1,
2.153898, -0.05363912, 2.08233, 0, 0, 0, 1, 1,
2.164978, 1.791144, 1.190491, 0, 0, 0, 1, 1,
2.184116, -0.2623149, 2.489342, 0, 0, 0, 1, 1,
2.194447, -0.8393452, 2.723074, 0, 0, 0, 1, 1,
2.211102, 0.8760689, 1.904033, 0, 0, 0, 1, 1,
2.211923, -0.0501226, 1.783446, 0, 0, 0, 1, 1,
2.218901, 0.2714206, 0.8011048, 1, 1, 1, 1, 1,
2.329039, -2.717896, 3.033136, 1, 1, 1, 1, 1,
2.356376, -0.9591978, 1.919566, 1, 1, 1, 1, 1,
2.395103, 0.2658333, -0.06382537, 1, 1, 1, 1, 1,
2.470782, -0.393118, 1.785243, 1, 1, 1, 1, 1,
2.528562, 1.046646, 1.75133, 1, 1, 1, 1, 1,
2.658817, 2.455171, -0.3035072, 1, 1, 1, 1, 1
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
var radius = 9.79667;
var distance = 34.41039;
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
mvMatrix.translate( 0.3785794, 0.04732609, 0.9001062 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.41039);
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
