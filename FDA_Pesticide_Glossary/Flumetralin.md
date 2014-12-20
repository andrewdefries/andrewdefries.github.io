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
-3.267354, -1.472514, -2.421444, 1, 0, 0, 1,
-2.959957, 0.857594, -1.216291, 1, 0.007843138, 0, 1,
-2.781946, -1.636585, -1.282193, 1, 0.01176471, 0, 1,
-2.698153, 1.096254, -2.685635, 1, 0.01960784, 0, 1,
-2.601708, -0.07652413, -2.377464, 1, 0.02352941, 0, 1,
-2.425953, -0.2735135, -1.967931, 1, 0.03137255, 0, 1,
-2.406179, 0.9064824, 0.1941208, 1, 0.03529412, 0, 1,
-2.362624, 0.01903033, -1.93841, 1, 0.04313726, 0, 1,
-2.324524, -0.2683965, -3.258666, 1, 0.04705882, 0, 1,
-2.316983, -0.4054744, -2.536764, 1, 0.05490196, 0, 1,
-2.286642, 2.082239, 0.4421687, 1, 0.05882353, 0, 1,
-2.280609, 0.8851515, -1.322695, 1, 0.06666667, 0, 1,
-2.265185, -1.012771, -1.204585, 1, 0.07058824, 0, 1,
-2.236497, -1.106101, -0.09390021, 1, 0.07843138, 0, 1,
-2.217981, 0.9243106, 1.198761, 1, 0.08235294, 0, 1,
-2.199474, -2.060067, -2.702859, 1, 0.09019608, 0, 1,
-2.183265, 0.8139696, -1.708326, 1, 0.09411765, 0, 1,
-2.157987, -2.465088, -1.592367, 1, 0.1019608, 0, 1,
-2.135798, 0.5487989, -1.868505, 1, 0.1098039, 0, 1,
-2.120419, -0.1557985, -1.878053, 1, 0.1137255, 0, 1,
-2.054755, 1.162045, -1.411853, 1, 0.1215686, 0, 1,
-2.049324, 0.7227869, -1.950762, 1, 0.1254902, 0, 1,
-2.009416, -0.2763706, -2.058432, 1, 0.1333333, 0, 1,
-1.982691, -0.4754119, -1.404497, 1, 0.1372549, 0, 1,
-1.964012, 1.353643, 0.5277867, 1, 0.145098, 0, 1,
-1.946684, 1.716957, -1.673807, 1, 0.1490196, 0, 1,
-1.912771, -0.09001929, -1.929884, 1, 0.1568628, 0, 1,
-1.904372, -0.1854262, -1.273029, 1, 0.1607843, 0, 1,
-1.875966, 1.859055, -1.610358, 1, 0.1686275, 0, 1,
-1.838163, -0.9781641, -1.01008, 1, 0.172549, 0, 1,
-1.829595, -0.3499757, -2.067627, 1, 0.1803922, 0, 1,
-1.79482, -1.239295, -3.020936, 1, 0.1843137, 0, 1,
-1.784476, -0.8095477, -2.864806, 1, 0.1921569, 0, 1,
-1.772867, -0.03170051, 0.2131389, 1, 0.1960784, 0, 1,
-1.74217, 0.8891078, -0.3214484, 1, 0.2039216, 0, 1,
-1.731793, -0.9031738, 0.5739168, 1, 0.2117647, 0, 1,
-1.717723, 0.9028964, -2.160377, 1, 0.2156863, 0, 1,
-1.709047, 0.3358615, -3.35588, 1, 0.2235294, 0, 1,
-1.674415, 0.9741549, -0.3826654, 1, 0.227451, 0, 1,
-1.670907, 0.1800598, -2.932525, 1, 0.2352941, 0, 1,
-1.666724, 0.5371432, -2.089103, 1, 0.2392157, 0, 1,
-1.635041, -0.6413786, -2.71869, 1, 0.2470588, 0, 1,
-1.602385, 2.778483, -0.187512, 1, 0.2509804, 0, 1,
-1.58498, 0.5705699, -0.3534048, 1, 0.2588235, 0, 1,
-1.579933, 0.6924363, -0.6512029, 1, 0.2627451, 0, 1,
-1.579878, 0.6001959, -1.857868, 1, 0.2705882, 0, 1,
-1.564785, -0.3615676, -2.678856, 1, 0.2745098, 0, 1,
-1.561079, 0.2280828, -0.8109466, 1, 0.282353, 0, 1,
-1.545376, -0.2079998, -3.383711, 1, 0.2862745, 0, 1,
-1.527267, 1.040899, 0.6168148, 1, 0.2941177, 0, 1,
-1.521426, -0.885821, -1.772942, 1, 0.3019608, 0, 1,
-1.519007, 0.2022099, -1.148144, 1, 0.3058824, 0, 1,
-1.512255, 1.606253, -0.2107109, 1, 0.3137255, 0, 1,
-1.506849, 2.006836, -0.2431503, 1, 0.3176471, 0, 1,
-1.506379, 0.4362546, 0.3031894, 1, 0.3254902, 0, 1,
-1.504979, 1.079062, -2.777556, 1, 0.3294118, 0, 1,
-1.499568, -0.7797517, -1.974964, 1, 0.3372549, 0, 1,
-1.499429, -0.6105886, -3.504237, 1, 0.3411765, 0, 1,
-1.490872, -0.4046894, -2.478303, 1, 0.3490196, 0, 1,
-1.461063, -0.4768868, -1.910856, 1, 0.3529412, 0, 1,
-1.460296, -0.6811622, -2.448491, 1, 0.3607843, 0, 1,
-1.458761, -0.3686967, -2.572736, 1, 0.3647059, 0, 1,
-1.458233, 1.354431, 1.695983, 1, 0.372549, 0, 1,
-1.446552, 0.9565747, -1.123861, 1, 0.3764706, 0, 1,
-1.430202, -1.159144, -0.9927385, 1, 0.3843137, 0, 1,
-1.429258, -0.5972095, -2.507865, 1, 0.3882353, 0, 1,
-1.423671, -0.6634737, -1.856541, 1, 0.3960784, 0, 1,
-1.421437, -0.8886429, -3.828479, 1, 0.4039216, 0, 1,
-1.41928, -1.360368, -1.958636, 1, 0.4078431, 0, 1,
-1.404166, -0.05832737, -1.056216, 1, 0.4156863, 0, 1,
-1.399616, -1.129303, -1.269928, 1, 0.4196078, 0, 1,
-1.396765, 0.2572491, -1.063193, 1, 0.427451, 0, 1,
-1.395722, -0.3918188, -1.271165, 1, 0.4313726, 0, 1,
-1.380811, -1.61603, -3.064066, 1, 0.4392157, 0, 1,
-1.378896, -0.5397884, -2.599632, 1, 0.4431373, 0, 1,
-1.378778, -1.206071, -2.19864, 1, 0.4509804, 0, 1,
-1.366039, 0.1515723, -1.816324, 1, 0.454902, 0, 1,
-1.359461, -0.2656707, -0.8237891, 1, 0.4627451, 0, 1,
-1.356198, -1.046928, -1.092719, 1, 0.4666667, 0, 1,
-1.350672, 1.118178, -2.682413, 1, 0.4745098, 0, 1,
-1.349653, -0.1304507, -1.398215, 1, 0.4784314, 0, 1,
-1.346497, -0.01743687, -1.778768, 1, 0.4862745, 0, 1,
-1.336831, 1.460028, -1.837431, 1, 0.4901961, 0, 1,
-1.334032, -0.4055316, 1.182762, 1, 0.4980392, 0, 1,
-1.325369, -0.1371243, -2.223641, 1, 0.5058824, 0, 1,
-1.310022, -0.4587585, -1.756138, 1, 0.509804, 0, 1,
-1.309971, 0.8649426, -1.289149, 1, 0.5176471, 0, 1,
-1.3087, -1.844937, -0.4003592, 1, 0.5215687, 0, 1,
-1.306972, 0.3822312, -0.5172387, 1, 0.5294118, 0, 1,
-1.3036, -1.206807, -1.602734, 1, 0.5333334, 0, 1,
-1.299336, 1.197197, -0.9081624, 1, 0.5411765, 0, 1,
-1.282068, -0.2061698, -1.506136, 1, 0.5450981, 0, 1,
-1.280241, -0.4078493, -0.3754758, 1, 0.5529412, 0, 1,
-1.269816, 0.4832369, -0.8003159, 1, 0.5568628, 0, 1,
-1.24023, 1.870707, 1.130299, 1, 0.5647059, 0, 1,
-1.23284, -0.04658199, -2.015154, 1, 0.5686275, 0, 1,
-1.23145, 0.1183847, -0.1519219, 1, 0.5764706, 0, 1,
-1.226363, 1.345477, -1.259805, 1, 0.5803922, 0, 1,
-1.222262, 0.4369373, -1.906116, 1, 0.5882353, 0, 1,
-1.214148, 0.4209925, -2.340793, 1, 0.5921569, 0, 1,
-1.210721, 1.38858, 0.3536261, 1, 0.6, 0, 1,
-1.208803, 0.4441707, 0.5569078, 1, 0.6078432, 0, 1,
-1.204038, -0.08521391, -2.882836, 1, 0.6117647, 0, 1,
-1.198001, 1.640907, -0.1543212, 1, 0.6196079, 0, 1,
-1.196855, 1.804015, -0.5421911, 1, 0.6235294, 0, 1,
-1.190924, 1.108509, 0.752744, 1, 0.6313726, 0, 1,
-1.186737, 0.5502482, -1.425885, 1, 0.6352941, 0, 1,
-1.181967, -0.6775253, -2.805235, 1, 0.6431373, 0, 1,
-1.181568, -0.8043197, -0.5726902, 1, 0.6470588, 0, 1,
-1.175708, 0.1083635, -1.535425, 1, 0.654902, 0, 1,
-1.173555, -0.865519, -0.3322979, 1, 0.6588235, 0, 1,
-1.170941, 0.6802268, -2.276715, 1, 0.6666667, 0, 1,
-1.166833, 0.6713775, -1.424044, 1, 0.6705883, 0, 1,
-1.158104, 0.6831874, 1.15051, 1, 0.6784314, 0, 1,
-1.157372, -1.012372, -1.826363, 1, 0.682353, 0, 1,
-1.156937, -1.185961, -2.045885, 1, 0.6901961, 0, 1,
-1.15019, 1.132873, -1.830153, 1, 0.6941177, 0, 1,
-1.148003, -0.2967405, -3.345782, 1, 0.7019608, 0, 1,
-1.147691, 0.8271411, -0.8102472, 1, 0.7098039, 0, 1,
-1.094673, -0.7618371, -1.649385, 1, 0.7137255, 0, 1,
-1.092879, 0.9734762, -2.875267, 1, 0.7215686, 0, 1,
-1.092761, -0.2908238, -0.01197102, 1, 0.7254902, 0, 1,
-1.092276, 0.4249549, 0.06508777, 1, 0.7333333, 0, 1,
-1.084383, 2.254945, 1.78863, 1, 0.7372549, 0, 1,
-1.083033, -0.1324431, -1.537777, 1, 0.7450981, 0, 1,
-1.079502, -0.5133146, -1.734854, 1, 0.7490196, 0, 1,
-1.077428, -1.259993, -3.326706, 1, 0.7568628, 0, 1,
-1.076953, 0.862373, 0.6635368, 1, 0.7607843, 0, 1,
-1.07473, 1.344354, -0.1256896, 1, 0.7686275, 0, 1,
-1.065428, 0.03856279, -2.09622, 1, 0.772549, 0, 1,
-1.064371, -1.08485, -0.4434571, 1, 0.7803922, 0, 1,
-1.061872, 1.088639, -0.2029438, 1, 0.7843137, 0, 1,
-1.056053, -0.8591677, -2.610722, 1, 0.7921569, 0, 1,
-1.054949, 0.1717291, -1.144114, 1, 0.7960784, 0, 1,
-1.041636, -0.904281, -0.5050179, 1, 0.8039216, 0, 1,
-1.041144, -2.200668, -2.194586, 1, 0.8117647, 0, 1,
-1.037067, -1.101396, -2.789293, 1, 0.8156863, 0, 1,
-1.035226, 1.22095, -1.966055, 1, 0.8235294, 0, 1,
-1.030518, 0.9663677, -2.120605, 1, 0.827451, 0, 1,
-1.030137, 0.411074, -1.367982, 1, 0.8352941, 0, 1,
-1.027032, -0.8277786, -1.378212, 1, 0.8392157, 0, 1,
-1.024858, -1.45227, -2.199977, 1, 0.8470588, 0, 1,
-1.0241, 0.1227644, -1.248308, 1, 0.8509804, 0, 1,
-1.022239, -1.843345, -2.303917, 1, 0.8588235, 0, 1,
-1.021405, -0.8487824, -2.81622, 1, 0.8627451, 0, 1,
-1.020369, -1.770132, -1.490637, 1, 0.8705882, 0, 1,
-1.017652, -0.2464042, -1.819548, 1, 0.8745098, 0, 1,
-1.014907, 0.2887221, -2.721105, 1, 0.8823529, 0, 1,
-1.012418, -0.8277785, -3.07155, 1, 0.8862745, 0, 1,
-1.008115, -0.3174318, 0.5910316, 1, 0.8941177, 0, 1,
-0.9988929, 0.8090162, -2.651198, 1, 0.8980392, 0, 1,
-0.9958818, 0.8179782, -2.057611, 1, 0.9058824, 0, 1,
-0.9890609, 1.453967, 0.9418759, 1, 0.9137255, 0, 1,
-0.9871715, -0.9410971, -3.046819, 1, 0.9176471, 0, 1,
-0.9839512, -0.2223696, -1.634713, 1, 0.9254902, 0, 1,
-0.9804018, -1.447204, -2.75157, 1, 0.9294118, 0, 1,
-0.9727219, 0.3919812, -0.2688324, 1, 0.9372549, 0, 1,
-0.9700667, 1.358867, 0.7750329, 1, 0.9411765, 0, 1,
-0.9633498, -0.05034041, -1.765499, 1, 0.9490196, 0, 1,
-0.9583941, 0.3030848, 0.1079704, 1, 0.9529412, 0, 1,
-0.9542279, 0.9324995, -0.6819571, 1, 0.9607843, 0, 1,
-0.953347, 0.1889933, -1.248763, 1, 0.9647059, 0, 1,
-0.9472387, -1.110565, -1.381653, 1, 0.972549, 0, 1,
-0.9468122, 0.8804617, 0.06214373, 1, 0.9764706, 0, 1,
-0.9387334, -1.263968, -2.88009, 1, 0.9843137, 0, 1,
-0.921559, 0.7096348, -0.01287623, 1, 0.9882353, 0, 1,
-0.9113612, -0.7460511, -3.73224, 1, 0.9960784, 0, 1,
-0.910257, -1.216276, -2.077641, 0.9960784, 1, 0, 1,
-0.9092, -0.9122072, -2.592707, 0.9921569, 1, 0, 1,
-0.9090056, -0.2154431, -1.861561, 0.9843137, 1, 0, 1,
-0.9083241, 1.680235, -1.204832, 0.9803922, 1, 0, 1,
-0.9050397, 1.313551, 1.186644, 0.972549, 1, 0, 1,
-0.897176, -0.2530937, -2.718061, 0.9686275, 1, 0, 1,
-0.8911412, 0.4088199, -0.7433256, 0.9607843, 1, 0, 1,
-0.8905519, 1.072299, -1.272571, 0.9568627, 1, 0, 1,
-0.8903165, 0.6210551, -1.148924, 0.9490196, 1, 0, 1,
-0.8882577, 0.6469659, -2.241285, 0.945098, 1, 0, 1,
-0.8882398, -0.05979304, -2.49114, 0.9372549, 1, 0, 1,
-0.8841922, 1.885591, -0.1136034, 0.9333333, 1, 0, 1,
-0.8815572, 0.8269715, 0.1201371, 0.9254902, 1, 0, 1,
-0.8762999, -0.9240776, -3.039648, 0.9215686, 1, 0, 1,
-0.8681906, 0.6700585, 0.4670231, 0.9137255, 1, 0, 1,
-0.8669416, 1.409021, -0.488483, 0.9098039, 1, 0, 1,
-0.8635921, -0.2373885, 0.4600275, 0.9019608, 1, 0, 1,
-0.8619463, 0.5559744, -2.780356, 0.8941177, 1, 0, 1,
-0.8555854, 0.5285574, -0.6748581, 0.8901961, 1, 0, 1,
-0.8439004, 0.9020138, 0.03391172, 0.8823529, 1, 0, 1,
-0.8367571, 1.882943, -2.014587, 0.8784314, 1, 0, 1,
-0.8321858, 0.5161449, -0.4059801, 0.8705882, 1, 0, 1,
-0.8304001, 0.3240953, 0.4518465, 0.8666667, 1, 0, 1,
-0.8256845, 0.3638442, -1.237968, 0.8588235, 1, 0, 1,
-0.8228406, -2.023158, -3.093096, 0.854902, 1, 0, 1,
-0.8177716, -0.7458488, -2.98438, 0.8470588, 1, 0, 1,
-0.8135203, 2.927358, -1.649065, 0.8431373, 1, 0, 1,
-0.8066562, -0.7769802, -3.881185, 0.8352941, 1, 0, 1,
-0.8057868, 1.07945, 1.159735, 0.8313726, 1, 0, 1,
-0.8048912, -0.3055125, -1.560415, 0.8235294, 1, 0, 1,
-0.8007514, 1.439416, 0.07289345, 0.8196079, 1, 0, 1,
-0.7979361, -0.003874921, -0.6164743, 0.8117647, 1, 0, 1,
-0.7854844, -0.3843714, -1.745819, 0.8078431, 1, 0, 1,
-0.77961, 1.074579, -1.624535, 0.8, 1, 0, 1,
-0.778879, 1.33591, -1.450911, 0.7921569, 1, 0, 1,
-0.7751763, -1.193568, -3.340654, 0.7882353, 1, 0, 1,
-0.7717075, 0.09843071, -0.3160427, 0.7803922, 1, 0, 1,
-0.7676301, -0.5190998, -1.77847, 0.7764706, 1, 0, 1,
-0.764104, 0.6364981, 0.3278002, 0.7686275, 1, 0, 1,
-0.7521156, -0.6473019, -2.640337, 0.7647059, 1, 0, 1,
-0.7505527, 0.2697596, 0.868374, 0.7568628, 1, 0, 1,
-0.7494276, 0.7667339, 0.9261845, 0.7529412, 1, 0, 1,
-0.7482907, -0.59775, -2.925278, 0.7450981, 1, 0, 1,
-0.7481456, -0.336264, -5.179456, 0.7411765, 1, 0, 1,
-0.7466797, -1.227454, -2.189653, 0.7333333, 1, 0, 1,
-0.7408644, 0.5571148, 0.06723252, 0.7294118, 1, 0, 1,
-0.7382436, 0.4380511, -2.815637, 0.7215686, 1, 0, 1,
-0.7365249, -0.1381821, -2.526411, 0.7176471, 1, 0, 1,
-0.7346193, 0.8145266, 0.3092944, 0.7098039, 1, 0, 1,
-0.7319003, -0.08712, -2.584474, 0.7058824, 1, 0, 1,
-0.7297812, 0.4415213, -1.113382, 0.6980392, 1, 0, 1,
-0.7295979, -1.831922, -3.797386, 0.6901961, 1, 0, 1,
-0.7285953, -1.721391, -3.837521, 0.6862745, 1, 0, 1,
-0.7280605, -1.82041, -4.353937, 0.6784314, 1, 0, 1,
-0.7186355, 0.4946858, -3.719866, 0.6745098, 1, 0, 1,
-0.7134848, 0.6337405, -2.164862, 0.6666667, 1, 0, 1,
-0.7110193, -1.223103, -2.164878, 0.6627451, 1, 0, 1,
-0.7105601, -1.215838, -1.325992, 0.654902, 1, 0, 1,
-0.7074104, 0.06496411, -0.5781348, 0.6509804, 1, 0, 1,
-0.7032986, 0.3463072, 0.01619158, 0.6431373, 1, 0, 1,
-0.6979261, -0.005935903, -1.331591, 0.6392157, 1, 0, 1,
-0.6933375, -0.8154063, -2.140124, 0.6313726, 1, 0, 1,
-0.6916319, 0.5886826, -2.762497, 0.627451, 1, 0, 1,
-0.6862767, -1.229125, -3.07504, 0.6196079, 1, 0, 1,
-0.6845197, 0.7786676, -1.155629, 0.6156863, 1, 0, 1,
-0.6804282, 0.8618903, -0.8543566, 0.6078432, 1, 0, 1,
-0.668086, -0.3961546, -4.264749, 0.6039216, 1, 0, 1,
-0.6646402, 0.07999372, -1.024136, 0.5960785, 1, 0, 1,
-0.6641297, -0.035596, -3.376805, 0.5882353, 1, 0, 1,
-0.661887, 1.616756, -0.5152984, 0.5843138, 1, 0, 1,
-0.6597714, 1.18502, -0.951271, 0.5764706, 1, 0, 1,
-0.6571958, -1.145204, -5.159136, 0.572549, 1, 0, 1,
-0.6529067, 0.27468, -0.6027238, 0.5647059, 1, 0, 1,
-0.6490229, -0.7668653, -3.282289, 0.5607843, 1, 0, 1,
-0.6454196, 0.01928337, -1.323679, 0.5529412, 1, 0, 1,
-0.6444827, 0.2152404, -2.245367, 0.5490196, 1, 0, 1,
-0.6390698, 0.4657459, -1.247544, 0.5411765, 1, 0, 1,
-0.6378842, -1.072939, -4.720275, 0.5372549, 1, 0, 1,
-0.6352426, 0.2331015, -2.013128, 0.5294118, 1, 0, 1,
-0.6351604, -0.5669575, -2.406199, 0.5254902, 1, 0, 1,
-0.6339468, 0.02634983, -2.283375, 0.5176471, 1, 0, 1,
-0.6305054, -0.5239969, -0.4585213, 0.5137255, 1, 0, 1,
-0.6272133, 1.163729, -0.8313612, 0.5058824, 1, 0, 1,
-0.6244962, -0.5251067, -3.161629, 0.5019608, 1, 0, 1,
-0.6244798, 0.6179588, 0.8063728, 0.4941176, 1, 0, 1,
-0.6242572, 1.150558, 0.8720639, 0.4862745, 1, 0, 1,
-0.623442, -0.1938401, -2.567949, 0.4823529, 1, 0, 1,
-0.6165323, -0.04956746, -1.269125, 0.4745098, 1, 0, 1,
-0.6157004, -0.8254816, -2.695966, 0.4705882, 1, 0, 1,
-0.6151267, -0.1436319, -2.320819, 0.4627451, 1, 0, 1,
-0.6066879, -0.638846, -1.884685, 0.4588235, 1, 0, 1,
-0.6055879, 0.3588144, 1.20918, 0.4509804, 1, 0, 1,
-0.6031992, 0.6190408, -2.068666, 0.4470588, 1, 0, 1,
-0.5981796, 0.539332, -2.149323, 0.4392157, 1, 0, 1,
-0.5940155, 0.5361634, -1.510834, 0.4352941, 1, 0, 1,
-0.5857249, -1.351209, -3.943399, 0.427451, 1, 0, 1,
-0.5850279, 1.155755, -1.530847, 0.4235294, 1, 0, 1,
-0.5836812, 1.524248, -1.503838, 0.4156863, 1, 0, 1,
-0.5784876, 0.6146964, -0.9257765, 0.4117647, 1, 0, 1,
-0.5738513, -0.2124707, -0.6089315, 0.4039216, 1, 0, 1,
-0.572689, 0.6309456, -1.132097, 0.3960784, 1, 0, 1,
-0.5725972, -0.2063803, -1.575362, 0.3921569, 1, 0, 1,
-0.5723848, 1.120188, -0.0744118, 0.3843137, 1, 0, 1,
-0.5542156, 0.5881175, -0.4746948, 0.3803922, 1, 0, 1,
-0.5516092, -0.1566981, -0.5743992, 0.372549, 1, 0, 1,
-0.5414523, 0.07925592, -0.5319377, 0.3686275, 1, 0, 1,
-0.5396195, 1.022242, -0.4019913, 0.3607843, 1, 0, 1,
-0.532962, 0.5440611, -2.087182, 0.3568628, 1, 0, 1,
-0.5310513, 0.9363915, -0.385776, 0.3490196, 1, 0, 1,
-0.5293786, -0.0035525, -0.2468893, 0.345098, 1, 0, 1,
-0.5260783, 0.3832534, -1.243679, 0.3372549, 1, 0, 1,
-0.524702, -0.01480758, -0.9702, 0.3333333, 1, 0, 1,
-0.523605, -0.5781727, -1.391259, 0.3254902, 1, 0, 1,
-0.5200369, 0.1209072, -1.555553, 0.3215686, 1, 0, 1,
-0.5187474, 0.2376484, -1.213162, 0.3137255, 1, 0, 1,
-0.5180438, 0.6830682, -0.2591727, 0.3098039, 1, 0, 1,
-0.5170239, -0.6097104, -2.08006, 0.3019608, 1, 0, 1,
-0.5158542, 0.2053077, -0.143595, 0.2941177, 1, 0, 1,
-0.5139527, -1.80615, -2.460939, 0.2901961, 1, 0, 1,
-0.513932, -0.3900909, -1.291143, 0.282353, 1, 0, 1,
-0.5121434, -0.1401672, -1.770851, 0.2784314, 1, 0, 1,
-0.5083134, 0.6183552, -2.27422, 0.2705882, 1, 0, 1,
-0.5079936, 1.514969, 0.09104207, 0.2666667, 1, 0, 1,
-0.5022561, 1.321972, 0.9905436, 0.2588235, 1, 0, 1,
-0.5013882, -0.2929624, -3.99992, 0.254902, 1, 0, 1,
-0.4963519, -0.2425617, -1.93299, 0.2470588, 1, 0, 1,
-0.4948325, -0.3004282, -3.066515, 0.2431373, 1, 0, 1,
-0.493321, 1.029456, -1.051794, 0.2352941, 1, 0, 1,
-0.4917397, -1.521617, -2.868186, 0.2313726, 1, 0, 1,
-0.4915818, 0.5756046, -0.07498173, 0.2235294, 1, 0, 1,
-0.4893847, -0.5968381, -2.012088, 0.2196078, 1, 0, 1,
-0.4888757, -1.891737, -3.296603, 0.2117647, 1, 0, 1,
-0.4887585, -2.712595, -2.449288, 0.2078431, 1, 0, 1,
-0.4878663, 0.8187434, -2.448075, 0.2, 1, 0, 1,
-0.4862849, 0.9081916, -0.4564126, 0.1921569, 1, 0, 1,
-0.4838271, -0.6865272, -2.594737, 0.1882353, 1, 0, 1,
-0.4835017, -0.01301375, -1.33728, 0.1803922, 1, 0, 1,
-0.4832093, 2.045555, -0.603462, 0.1764706, 1, 0, 1,
-0.4782878, -0.7786785, -4.156667, 0.1686275, 1, 0, 1,
-0.4752126, -0.2013395, 0.7304597, 0.1647059, 1, 0, 1,
-0.46735, 2.365642, 0.4096042, 0.1568628, 1, 0, 1,
-0.465334, -2.927948, -1.703973, 0.1529412, 1, 0, 1,
-0.4641942, 0.3136918, -0.5273048, 0.145098, 1, 0, 1,
-0.4635169, 1.54305, -0.006720686, 0.1411765, 1, 0, 1,
-0.4629696, 0.2155321, -1.533655, 0.1333333, 1, 0, 1,
-0.462873, 0.1880901, -1.995216, 0.1294118, 1, 0, 1,
-0.4627662, 0.7769166, 0.1730044, 0.1215686, 1, 0, 1,
-0.4608043, -0.03665733, -2.737209, 0.1176471, 1, 0, 1,
-0.4586765, 0.4869615, -1.001002, 0.1098039, 1, 0, 1,
-0.4548385, -0.5836757, -4.208287, 0.1058824, 1, 0, 1,
-0.4537941, -1.06162, -3.517827, 0.09803922, 1, 0, 1,
-0.4491822, -1.724635, -3.937524, 0.09019608, 1, 0, 1,
-0.448488, 0.2807544, -1.317967, 0.08627451, 1, 0, 1,
-0.4467028, 1.704378, -1.174919, 0.07843138, 1, 0, 1,
-0.445794, 1.336453, 0.2952994, 0.07450981, 1, 0, 1,
-0.4435963, 0.8633857, -0.9961004, 0.06666667, 1, 0, 1,
-0.4404077, -0.66561, -0.326709, 0.0627451, 1, 0, 1,
-0.4382006, 0.1462747, -0.6316012, 0.05490196, 1, 0, 1,
-0.4377967, -2.25554, -0.9394652, 0.05098039, 1, 0, 1,
-0.4367295, -1.243653, -2.749075, 0.04313726, 1, 0, 1,
-0.4325292, -0.01866211, -0.7941194, 0.03921569, 1, 0, 1,
-0.4304929, 1.52291, -1.011569, 0.03137255, 1, 0, 1,
-0.4302657, 0.4871792, -1.098315, 0.02745098, 1, 0, 1,
-0.4237855, -0.7301023, -3.300546, 0.01960784, 1, 0, 1,
-0.4172536, -0.5879508, -2.896869, 0.01568628, 1, 0, 1,
-0.4161652, -1.797987, -3.0574, 0.007843138, 1, 0, 1,
-0.4144483, 0.0608217, -2.460685, 0.003921569, 1, 0, 1,
-0.4127524, -1.041753, -4.998451, 0, 1, 0.003921569, 1,
-0.4122484, -0.8161137, -0.9495074, 0, 1, 0.01176471, 1,
-0.4119178, 1.496929, -0.5211296, 0, 1, 0.01568628, 1,
-0.4102748, -1.296028, -1.358042, 0, 1, 0.02352941, 1,
-0.4040337, -0.1528728, 0.6364326, 0, 1, 0.02745098, 1,
-0.3957837, 0.2747386, -1.977479, 0, 1, 0.03529412, 1,
-0.3944449, 0.207368, -0.9640345, 0, 1, 0.03921569, 1,
-0.3883041, -0.08277101, -2.29475, 0, 1, 0.04705882, 1,
-0.3862508, -0.9164713, -3.411389, 0, 1, 0.05098039, 1,
-0.3846371, -1.684666, -2.262748, 0, 1, 0.05882353, 1,
-0.3820621, 0.7157572, 0.2863219, 0, 1, 0.0627451, 1,
-0.380899, 0.5688769, 1.408545, 0, 1, 0.07058824, 1,
-0.3783513, -0.4787603, -0.6416516, 0, 1, 0.07450981, 1,
-0.3780356, -0.06078919, -2.200547, 0, 1, 0.08235294, 1,
-0.3776341, -0.2857158, -2.348244, 0, 1, 0.08627451, 1,
-0.3759901, 0.9208662, 0.528566, 0, 1, 0.09411765, 1,
-0.3758307, -1.159111, -2.079193, 0, 1, 0.1019608, 1,
-0.3755047, 0.701811, -0.9782484, 0, 1, 0.1058824, 1,
-0.3729163, 0.4394431, -1.860717, 0, 1, 0.1137255, 1,
-0.372093, -1.015625, -3.132465, 0, 1, 0.1176471, 1,
-0.3687774, 1.540671, -0.7174143, 0, 1, 0.1254902, 1,
-0.3680506, -2.19073, -2.49165, 0, 1, 0.1294118, 1,
-0.3670476, 0.08515634, -1.520002, 0, 1, 0.1372549, 1,
-0.3669572, -0.02247153, -2.121382, 0, 1, 0.1411765, 1,
-0.3663759, -1.027373, -2.122834, 0, 1, 0.1490196, 1,
-0.3644755, -0.1519971, -2.035571, 0, 1, 0.1529412, 1,
-0.3641415, -0.3477912, -3.557855, 0, 1, 0.1607843, 1,
-0.3626238, 1.204303, 0.7082558, 0, 1, 0.1647059, 1,
-0.3618048, 0.9886998, -0.4559243, 0, 1, 0.172549, 1,
-0.360352, 0.1453144, -0.7095953, 0, 1, 0.1764706, 1,
-0.3519135, -0.6032009, -2.447894, 0, 1, 0.1843137, 1,
-0.3512764, 0.2305345, -1.294892, 0, 1, 0.1882353, 1,
-0.3463201, 0.07039479, -2.112835, 0, 1, 0.1960784, 1,
-0.3445357, 1.202069, -0.4950942, 0, 1, 0.2039216, 1,
-0.3401126, 0.03858179, -1.267338, 0, 1, 0.2078431, 1,
-0.3367398, 0.2369405, -0.8710057, 0, 1, 0.2156863, 1,
-0.3366096, -0.653801, -3.011164, 0, 1, 0.2196078, 1,
-0.3304732, -0.3167046, -2.689035, 0, 1, 0.227451, 1,
-0.3280182, 0.4214777, -1.504438, 0, 1, 0.2313726, 1,
-0.3279939, 0.6415435, -1.49496, 0, 1, 0.2392157, 1,
-0.3207836, 0.6710877, -0.03502394, 0, 1, 0.2431373, 1,
-0.3206562, -0.5827441, -3.511308, 0, 1, 0.2509804, 1,
-0.317619, 1.077289, -0.09503176, 0, 1, 0.254902, 1,
-0.3174928, 0.5703826, -0.7245181, 0, 1, 0.2627451, 1,
-0.3159771, -0.5227433, -3.174407, 0, 1, 0.2666667, 1,
-0.31547, 1.52595, -0.9595088, 0, 1, 0.2745098, 1,
-0.3140478, 1.119052, -0.840028, 0, 1, 0.2784314, 1,
-0.3132041, 0.09768691, -1.631522, 0, 1, 0.2862745, 1,
-0.3120729, 0.1389069, -0.6893032, 0, 1, 0.2901961, 1,
-0.3075267, 1.321823, -0.03782592, 0, 1, 0.2980392, 1,
-0.3066823, -1.288785, -2.695963, 0, 1, 0.3058824, 1,
-0.3065006, -0.2483914, -2.168379, 0, 1, 0.3098039, 1,
-0.3056399, -0.8912726, -3.147643, 0, 1, 0.3176471, 1,
-0.3047676, 0.4932929, 0.9504486, 0, 1, 0.3215686, 1,
-0.3015943, -0.446655, -2.891837, 0, 1, 0.3294118, 1,
-0.2914464, 1.775097, 1.244736, 0, 1, 0.3333333, 1,
-0.2885204, -0.4808212, -2.409943, 0, 1, 0.3411765, 1,
-0.287545, 0.1490456, 0.220087, 0, 1, 0.345098, 1,
-0.2839727, -1.977939, -2.366359, 0, 1, 0.3529412, 1,
-0.2715403, -0.2183897, -2.061601, 0, 1, 0.3568628, 1,
-0.2710161, 0.3977003, -1.030321, 0, 1, 0.3647059, 1,
-0.2656879, -0.5503539, -1.997787, 0, 1, 0.3686275, 1,
-0.265532, 0.18044, -0.7805806, 0, 1, 0.3764706, 1,
-0.2650799, -0.09750428, -2.486249, 0, 1, 0.3803922, 1,
-0.2520579, 0.5050795, -1.321028, 0, 1, 0.3882353, 1,
-0.2472816, 0.7534837, -1.200357, 0, 1, 0.3921569, 1,
-0.2469818, -0.9491441, -3.102513, 0, 1, 0.4, 1,
-0.2363285, 0.5697582, 1.151299, 0, 1, 0.4078431, 1,
-0.2328503, 0.6518677, -1.57694, 0, 1, 0.4117647, 1,
-0.2325853, -0.5391252, -1.756114, 0, 1, 0.4196078, 1,
-0.2226565, 0.06022496, -0.5482005, 0, 1, 0.4235294, 1,
-0.216448, 0.9395379, -0.3834328, 0, 1, 0.4313726, 1,
-0.2164389, 0.7450855, -0.3569633, 0, 1, 0.4352941, 1,
-0.2146378, 1.627735, 0.09213307, 0, 1, 0.4431373, 1,
-0.2128652, -0.7688863, -2.696157, 0, 1, 0.4470588, 1,
-0.2115351, 0.009544778, -2.141036, 0, 1, 0.454902, 1,
-0.2067609, 0.1380314, -0.01096683, 0, 1, 0.4588235, 1,
-0.2050879, 0.321945, 0.08794991, 0, 1, 0.4666667, 1,
-0.1965601, 0.9788699, -1.323261, 0, 1, 0.4705882, 1,
-0.1957202, -2.14208, -4.977484, 0, 1, 0.4784314, 1,
-0.1764614, 0.2044481, 0.9114572, 0, 1, 0.4823529, 1,
-0.1762796, -1.592392, -2.468532, 0, 1, 0.4901961, 1,
-0.1743853, 1.334563, 0.4600798, 0, 1, 0.4941176, 1,
-0.1738221, 0.2848728, -0.999642, 0, 1, 0.5019608, 1,
-0.1732582, 0.3826747, -1.121741, 0, 1, 0.509804, 1,
-0.163275, -0.5256925, -1.778485, 0, 1, 0.5137255, 1,
-0.1592537, 0.5876954, -1.78753, 0, 1, 0.5215687, 1,
-0.1561965, -2.206623, -1.737727, 0, 1, 0.5254902, 1,
-0.153613, 0.6630329, 0.8213547, 0, 1, 0.5333334, 1,
-0.1483443, 0.3999564, -1.194703, 0, 1, 0.5372549, 1,
-0.1482661, 0.4613013, 1.171501, 0, 1, 0.5450981, 1,
-0.1442652, -0.6738923, -3.930063, 0, 1, 0.5490196, 1,
-0.1433426, 0.03137437, -3.088055, 0, 1, 0.5568628, 1,
-0.1393746, -0.8134139, -1.488278, 0, 1, 0.5607843, 1,
-0.1393521, 1.211465, -0.8495406, 0, 1, 0.5686275, 1,
-0.1387463, -0.1056628, -0.1605551, 0, 1, 0.572549, 1,
-0.1385434, 1.798026, -1.145436, 0, 1, 0.5803922, 1,
-0.137846, -0.9118701, -2.817252, 0, 1, 0.5843138, 1,
-0.1355276, -1.696863, -4.64114, 0, 1, 0.5921569, 1,
-0.1322986, -0.8758731, -1.457313, 0, 1, 0.5960785, 1,
-0.1317418, 0.5357845, -0.9737418, 0, 1, 0.6039216, 1,
-0.1316395, 0.9978548, 2.193484, 0, 1, 0.6117647, 1,
-0.1299642, -1.776971, -3.18709, 0, 1, 0.6156863, 1,
-0.1299403, -0.7058586, -3.126493, 0, 1, 0.6235294, 1,
-0.1287273, 0.8221232, -0.5599519, 0, 1, 0.627451, 1,
-0.1258944, 1.821045, -0.3405466, 0, 1, 0.6352941, 1,
-0.1248225, 0.6557531, -1.67507, 0, 1, 0.6392157, 1,
-0.1247303, -1.039509, -4.103945, 0, 1, 0.6470588, 1,
-0.1219204, -0.5997734, -1.406015, 0, 1, 0.6509804, 1,
-0.117681, 1.106579, -2.43948, 0, 1, 0.6588235, 1,
-0.1122221, 0.4710703, 1.100177, 0, 1, 0.6627451, 1,
-0.1096203, -0.6468471, -3.501626, 0, 1, 0.6705883, 1,
-0.1049328, 1.523965, -2.280778, 0, 1, 0.6745098, 1,
-0.1048696, -0.2941139, -2.506825, 0, 1, 0.682353, 1,
-0.104368, 0.1782033, -2.590709, 0, 1, 0.6862745, 1,
-0.1033624, 1.710782, 1.92854, 0, 1, 0.6941177, 1,
-0.103018, 1.087439, -0.7089196, 0, 1, 0.7019608, 1,
-0.1025234, 1.41243, -0.4509527, 0, 1, 0.7058824, 1,
-0.1017548, -1.118322, -3.506277, 0, 1, 0.7137255, 1,
-0.09760093, -0.07349782, -1.882488, 0, 1, 0.7176471, 1,
-0.09586293, 0.2114504, 0.3980026, 0, 1, 0.7254902, 1,
-0.09456358, 1.776272, -0.1708076, 0, 1, 0.7294118, 1,
-0.09168011, -0.2990161, -3.861032, 0, 1, 0.7372549, 1,
-0.08351076, -0.9391123, -3.961618, 0, 1, 0.7411765, 1,
-0.07617848, 0.4414636, 0.5228797, 0, 1, 0.7490196, 1,
-0.07615678, -0.183576, -2.999186, 0, 1, 0.7529412, 1,
-0.07607691, 1.928805, 0.2603354, 0, 1, 0.7607843, 1,
-0.07595923, 0.6550562, -1.939045, 0, 1, 0.7647059, 1,
-0.07559903, -0.07822393, -1.815879, 0, 1, 0.772549, 1,
-0.07424323, 0.6629922, 2.438278, 0, 1, 0.7764706, 1,
-0.07415659, 0.5665433, -1.171834, 0, 1, 0.7843137, 1,
-0.07374618, 1.437865, 1.836164, 0, 1, 0.7882353, 1,
-0.06532308, -1.152372, -3.773995, 0, 1, 0.7960784, 1,
-0.06471265, -0.8232284, -2.36502, 0, 1, 0.8039216, 1,
-0.0588905, 0.1370914, -0.03421048, 0, 1, 0.8078431, 1,
-0.05700162, 0.02182687, -0.4869518, 0, 1, 0.8156863, 1,
-0.05061195, -1.191889, -2.620099, 0, 1, 0.8196079, 1,
-0.04814439, 1.996532, -0.8973327, 0, 1, 0.827451, 1,
-0.04418658, -1.138712, -4.801382, 0, 1, 0.8313726, 1,
-0.04129971, -0.8040282, -2.127137, 0, 1, 0.8392157, 1,
-0.04005645, 0.8780594, -1.917207, 0, 1, 0.8431373, 1,
-0.04004664, 1.677159, -2.032535, 0, 1, 0.8509804, 1,
-0.03253152, 0.09660917, -0.2156654, 0, 1, 0.854902, 1,
-0.03251075, 1.24316, 0.7850326, 0, 1, 0.8627451, 1,
-0.031266, 0.2191226, 0.1219675, 0, 1, 0.8666667, 1,
-0.03060737, 1.407535, -0.7156006, 0, 1, 0.8745098, 1,
-0.0277422, 0.8248166, -0.05067326, 0, 1, 0.8784314, 1,
-0.02388295, 1.298251, -0.3183588, 0, 1, 0.8862745, 1,
-0.02195637, 1.193007, -0.6895534, 0, 1, 0.8901961, 1,
-0.0210358, 0.3542262, -0.8199757, 0, 1, 0.8980392, 1,
-0.01620517, -0.2266271, -3.345995, 0, 1, 0.9058824, 1,
-0.00856554, 0.4636982, -0.2366273, 0, 1, 0.9098039, 1,
-0.00736686, 0.5462596, -0.4720625, 0, 1, 0.9176471, 1,
-0.003458689, -0.3160433, -4.617627, 0, 1, 0.9215686, 1,
-0.002685406, -0.4425308, -4.285215, 0, 1, 0.9294118, 1,
-0.001722453, -1.337957, -4.123629, 0, 1, 0.9333333, 1,
-0.001013625, -0.7828041, -2.444405, 0, 1, 0.9411765, 1,
0.003249804, 0.4224501, 1.188393, 0, 1, 0.945098, 1,
0.005654621, 0.08432326, 0.01339114, 0, 1, 0.9529412, 1,
0.007846246, 0.1092739, -0.9670908, 0, 1, 0.9568627, 1,
0.008092109, 0.6479351, 1.559486, 0, 1, 0.9647059, 1,
0.00922931, -0.6898633, 2.759943, 0, 1, 0.9686275, 1,
0.009293422, 0.007443882, -0.05199892, 0, 1, 0.9764706, 1,
0.009942766, 1.590031, -1.039964, 0, 1, 0.9803922, 1,
0.01099292, -0.8024926, 5.758446, 0, 1, 0.9882353, 1,
0.01263637, -1.279301, 3.330439, 0, 1, 0.9921569, 1,
0.0141965, -0.5905592, 3.383041, 0, 1, 1, 1,
0.01909186, 0.7174078, 1.168504, 0, 0.9921569, 1, 1,
0.02208173, -0.339543, 0.4396685, 0, 0.9882353, 1, 1,
0.02389753, 1.05471, -0.007296663, 0, 0.9803922, 1, 1,
0.02472968, 0.337824, 1.652908, 0, 0.9764706, 1, 1,
0.0256182, -2.189879, 4.38058, 0, 0.9686275, 1, 1,
0.02948624, -0.2860466, 1.865085, 0, 0.9647059, 1, 1,
0.03695569, 1.184281, 1.119105, 0, 0.9568627, 1, 1,
0.03981796, -0.4892985, 3.389679, 0, 0.9529412, 1, 1,
0.04338465, -1.3779, 1.77693, 0, 0.945098, 1, 1,
0.04673488, -0.08973226, 3.370528, 0, 0.9411765, 1, 1,
0.0572174, -1.064712, 3.434773, 0, 0.9333333, 1, 1,
0.06002042, 0.3472061, -1.041899, 0, 0.9294118, 1, 1,
0.06130122, -1.664888, 2.223832, 0, 0.9215686, 1, 1,
0.0634103, -1.236285, 3.487659, 0, 0.9176471, 1, 1,
0.06712049, 1.216548, 0.680581, 0, 0.9098039, 1, 1,
0.06907417, 1.066665, 0.2021045, 0, 0.9058824, 1, 1,
0.06957605, -2.096123, 2.498293, 0, 0.8980392, 1, 1,
0.07161879, 0.2974113, 0.6607675, 0, 0.8901961, 1, 1,
0.07294183, 0.5252513, 1.369675, 0, 0.8862745, 1, 1,
0.07346197, 0.567414, -0.05054224, 0, 0.8784314, 1, 1,
0.07533254, -1.525336, 3.57565, 0, 0.8745098, 1, 1,
0.07620537, 0.4517586, -0.1398289, 0, 0.8666667, 1, 1,
0.07674048, 0.09276532, 0.4284839, 0, 0.8627451, 1, 1,
0.07698365, -0.6082834, 4.648169, 0, 0.854902, 1, 1,
0.08907004, 0.3591243, -0.08106208, 0, 0.8509804, 1, 1,
0.09844465, 0.3682706, -2.115158, 0, 0.8431373, 1, 1,
0.09975378, 0.3034224, 0.2509035, 0, 0.8392157, 1, 1,
0.1031982, -0.6598551, 4.404586, 0, 0.8313726, 1, 1,
0.1086521, 0.9876546, 1.760951, 0, 0.827451, 1, 1,
0.1111711, -0.8002482, 2.999475, 0, 0.8196079, 1, 1,
0.1150544, -0.9633202, 1.92904, 0, 0.8156863, 1, 1,
0.1217213, -0.01650479, 0.9087305, 0, 0.8078431, 1, 1,
0.1267132, 2.890836, -0.4761703, 0, 0.8039216, 1, 1,
0.1273723, -1.035078, 2.93048, 0, 0.7960784, 1, 1,
0.1305312, 0.8946292, -0.0250612, 0, 0.7882353, 1, 1,
0.1322689, -0.1384495, 0.1586605, 0, 0.7843137, 1, 1,
0.1352065, -0.8190454, 2.782227, 0, 0.7764706, 1, 1,
0.1353993, 0.5512881, -0.6250721, 0, 0.772549, 1, 1,
0.1361876, -0.4596962, 3.278962, 0, 0.7647059, 1, 1,
0.1396931, 0.1529822, -0.02232786, 0, 0.7607843, 1, 1,
0.1488994, -0.6801339, 2.651322, 0, 0.7529412, 1, 1,
0.1519334, 0.925591, -0.4011947, 0, 0.7490196, 1, 1,
0.1526871, 0.9623948, -0.4322363, 0, 0.7411765, 1, 1,
0.1572774, 0.4888268, -0.432344, 0, 0.7372549, 1, 1,
0.157293, -0.7157753, 2.56163, 0, 0.7294118, 1, 1,
0.1584426, -0.7644978, 3.29468, 0, 0.7254902, 1, 1,
0.1632649, -0.3959531, 4.244711, 0, 0.7176471, 1, 1,
0.1636322, -0.04772925, 3.062649, 0, 0.7137255, 1, 1,
0.1659878, -1.179998, 3.267095, 0, 0.7058824, 1, 1,
0.1676612, -1.704672, 0.9144256, 0, 0.6980392, 1, 1,
0.1686412, -0.2821599, 2.012377, 0, 0.6941177, 1, 1,
0.1696562, 0.4006859, 0.2034316, 0, 0.6862745, 1, 1,
0.1727783, 0.5975668, -0.2988106, 0, 0.682353, 1, 1,
0.1776833, 0.0686043, 0.05866227, 0, 0.6745098, 1, 1,
0.1778595, -0.7515, 3.862387, 0, 0.6705883, 1, 1,
0.1798221, -0.5581614, 3.568796, 0, 0.6627451, 1, 1,
0.1820176, -0.0577203, 1.606463, 0, 0.6588235, 1, 1,
0.187556, -0.07433218, 1.812496, 0, 0.6509804, 1, 1,
0.187714, 0.04335375, 2.320431, 0, 0.6470588, 1, 1,
0.1962513, -0.04349294, 2.036695, 0, 0.6392157, 1, 1,
0.1966721, -2.006011, 2.439181, 0, 0.6352941, 1, 1,
0.1978434, 1.155988, 1.331556, 0, 0.627451, 1, 1,
0.1989422, -0.09123311, -0.03736325, 0, 0.6235294, 1, 1,
0.2029204, 0.1080983, 0.3233995, 0, 0.6156863, 1, 1,
0.2049709, 1.186339, 3.186769, 0, 0.6117647, 1, 1,
0.2069232, 0.2777838, -0.5454096, 0, 0.6039216, 1, 1,
0.2074018, 0.5201895, 0.008624857, 0, 0.5960785, 1, 1,
0.2079302, -1.232913, 5.309054, 0, 0.5921569, 1, 1,
0.208661, 0.7292092, -2.10859, 0, 0.5843138, 1, 1,
0.2093817, 1.022662, 1.026626, 0, 0.5803922, 1, 1,
0.2112395, 0.2910232, 0.8011498, 0, 0.572549, 1, 1,
0.2179392, -0.3740725, 1.730368, 0, 0.5686275, 1, 1,
0.2204554, -0.05329946, 1.903093, 0, 0.5607843, 1, 1,
0.2215648, -0.5183083, 0.9561999, 0, 0.5568628, 1, 1,
0.2218863, -0.6816014, 2.456297, 0, 0.5490196, 1, 1,
0.2222703, -2.806196, 2.474399, 0, 0.5450981, 1, 1,
0.228092, 1.087835, 1.995991, 0, 0.5372549, 1, 1,
0.2306026, -1.306935, 4.064548, 0, 0.5333334, 1, 1,
0.2307488, 0.3895694, 1.299887, 0, 0.5254902, 1, 1,
0.232498, 1.094934, 2.980718, 0, 0.5215687, 1, 1,
0.2327003, 1.723184, 0.1739966, 0, 0.5137255, 1, 1,
0.2357826, -1.673993, 1.193488, 0, 0.509804, 1, 1,
0.2480618, 0.8669149, 0.5478866, 0, 0.5019608, 1, 1,
0.2508647, -0.4432992, 2.992861, 0, 0.4941176, 1, 1,
0.2514264, -0.1556433, 3.714828, 0, 0.4901961, 1, 1,
0.2546837, -0.4725013, 4.813789, 0, 0.4823529, 1, 1,
0.258325, -0.9820271, 2.19693, 0, 0.4784314, 1, 1,
0.2598297, -0.4820536, 1.747771, 0, 0.4705882, 1, 1,
0.2602579, 0.1848399, 1.761131, 0, 0.4666667, 1, 1,
0.2722741, -0.6919866, 1.981377, 0, 0.4588235, 1, 1,
0.2741389, -1.706812, 1.678276, 0, 0.454902, 1, 1,
0.2742833, 1.225768, 0.1431008, 0, 0.4470588, 1, 1,
0.2762968, -0.9256961, 3.463248, 0, 0.4431373, 1, 1,
0.2771135, 0.2083832, 0.3542188, 0, 0.4352941, 1, 1,
0.2771162, -0.5919198, 3.820929, 0, 0.4313726, 1, 1,
0.2777102, 1.4194, 1.665093, 0, 0.4235294, 1, 1,
0.2811011, -0.3464235, 1.688801, 0, 0.4196078, 1, 1,
0.2818389, 1.019534, 1.145954, 0, 0.4117647, 1, 1,
0.2821434, 0.7910332, 0.1978381, 0, 0.4078431, 1, 1,
0.2846991, 2.126046, -0.02827026, 0, 0.4, 1, 1,
0.2858442, 0.4392764, -0.08118054, 0, 0.3921569, 1, 1,
0.286119, -1.710389, 3.4956, 0, 0.3882353, 1, 1,
0.2881082, 0.155089, 1.719945, 0, 0.3803922, 1, 1,
0.294356, 0.3828431, -0.2030331, 0, 0.3764706, 1, 1,
0.2959134, 0.1849494, 3.741327, 0, 0.3686275, 1, 1,
0.3018712, 0.3523264, 1.305224, 0, 0.3647059, 1, 1,
0.3024675, -0.4371644, 3.199383, 0, 0.3568628, 1, 1,
0.3120828, -0.683741, 2.63086, 0, 0.3529412, 1, 1,
0.3137245, 0.8983713, -1.719825, 0, 0.345098, 1, 1,
0.3257697, -1.434199, 2.615434, 0, 0.3411765, 1, 1,
0.3259322, 1.032899, 3.49842, 0, 0.3333333, 1, 1,
0.3296135, 1.055201, 0.6314947, 0, 0.3294118, 1, 1,
0.3304678, -0.8522632, 2.831629, 0, 0.3215686, 1, 1,
0.3325947, -0.8354311, 0.8703924, 0, 0.3176471, 1, 1,
0.3357282, -1.243641, 3.448361, 0, 0.3098039, 1, 1,
0.3361369, 0.3082624, 2.753523, 0, 0.3058824, 1, 1,
0.3363567, 2.773018, -0.3542593, 0, 0.2980392, 1, 1,
0.3394051, 1.470623, 0.9332651, 0, 0.2901961, 1, 1,
0.3394328, -0.3691093, 1.632484, 0, 0.2862745, 1, 1,
0.3415865, -1.264051, 4.196676, 0, 0.2784314, 1, 1,
0.3432602, -1.387389, 1.622106, 0, 0.2745098, 1, 1,
0.3443401, -0.6568438, 1.300576, 0, 0.2666667, 1, 1,
0.3449249, -1.232366, 2.847961, 0, 0.2627451, 1, 1,
0.3455118, -0.0803249, 2.750995, 0, 0.254902, 1, 1,
0.3466893, 1.518999, -1.678713, 0, 0.2509804, 1, 1,
0.3469929, -0.7437794, 1.183683, 0, 0.2431373, 1, 1,
0.3480057, 2.025259, 1.888578, 0, 0.2392157, 1, 1,
0.3526745, -0.3281759, 2.121447, 0, 0.2313726, 1, 1,
0.3547915, -0.7597179, 3.226086, 0, 0.227451, 1, 1,
0.3561209, -0.1015444, 2.033576, 0, 0.2196078, 1, 1,
0.3623292, -0.2871695, 0.797398, 0, 0.2156863, 1, 1,
0.3655218, 0.3814188, 1.335704, 0, 0.2078431, 1, 1,
0.3679953, 0.1972968, 1.819427, 0, 0.2039216, 1, 1,
0.3691657, 0.3153911, -0.3115432, 0, 0.1960784, 1, 1,
0.3694839, -0.5356398, 1.109165, 0, 0.1882353, 1, 1,
0.3696948, 1.525838, 3.335468, 0, 0.1843137, 1, 1,
0.3723154, -0.7301326, 1.888907, 0, 0.1764706, 1, 1,
0.3781466, -0.4741915, 3.95752, 0, 0.172549, 1, 1,
0.380125, 0.7739239, 0.5110818, 0, 0.1647059, 1, 1,
0.3843896, -0.2612601, 2.499411, 0, 0.1607843, 1, 1,
0.3856366, 1.763776, 0.1413399, 0, 0.1529412, 1, 1,
0.3878978, 0.899604, 1.334938, 0, 0.1490196, 1, 1,
0.3891811, -1.614097, 3.411206, 0, 0.1411765, 1, 1,
0.3933459, -0.8057227, 2.072886, 0, 0.1372549, 1, 1,
0.3940533, -0.5259785, 3.909332, 0, 0.1294118, 1, 1,
0.3960399, -0.1329186, 2.739471, 0, 0.1254902, 1, 1,
0.4010396, -0.4134171, 1.314223, 0, 0.1176471, 1, 1,
0.4031953, -0.7669186, 2.451142, 0, 0.1137255, 1, 1,
0.403919, 0.01668887, 2.33331, 0, 0.1058824, 1, 1,
0.4043902, -0.2766201, 3.065916, 0, 0.09803922, 1, 1,
0.4090622, 0.28074, 0.8700275, 0, 0.09411765, 1, 1,
0.4127747, -2.442996, 3.659008, 0, 0.08627451, 1, 1,
0.4185898, -1.096045, 3.362528, 0, 0.08235294, 1, 1,
0.4206417, 0.3271061, 1.258188, 0, 0.07450981, 1, 1,
0.4212816, 0.8265221, -0.3283542, 0, 0.07058824, 1, 1,
0.4223485, -0.3241453, 1.410263, 0, 0.0627451, 1, 1,
0.4237818, -1.165246, 3.128453, 0, 0.05882353, 1, 1,
0.4265499, 1.059047, -0.6114032, 0, 0.05098039, 1, 1,
0.4288502, -0.6094015, 1.73231, 0, 0.04705882, 1, 1,
0.429726, 0.4936965, 0.7543834, 0, 0.03921569, 1, 1,
0.4317942, 0.5262036, 1.720718, 0, 0.03529412, 1, 1,
0.4324004, 1.147171, -0.02031876, 0, 0.02745098, 1, 1,
0.4348981, -1.052741, 2.214215, 0, 0.02352941, 1, 1,
0.443245, 0.7777063, 0.3772322, 0, 0.01568628, 1, 1,
0.4464138, 0.2286611, 0.4238043, 0, 0.01176471, 1, 1,
0.4470201, 0.5283268, -0.6831818, 0, 0.003921569, 1, 1,
0.4505887, -2.960319, 1.948535, 0.003921569, 0, 1, 1,
0.4511137, -0.03726941, -0.6398785, 0.007843138, 0, 1, 1,
0.4525376, -1.511761, 2.745177, 0.01568628, 0, 1, 1,
0.4547783, -2.493186, 4.10529, 0.01960784, 0, 1, 1,
0.454958, -0.9907514, 3.593668, 0.02745098, 0, 1, 1,
0.4557337, -0.1012726, 1.874551, 0.03137255, 0, 1, 1,
0.4577549, 1.542364, -1.142353, 0.03921569, 0, 1, 1,
0.4581369, 0.04080649, 2.147341, 0.04313726, 0, 1, 1,
0.4594099, -0.05779446, 2.310286, 0.05098039, 0, 1, 1,
0.4635555, 1.539781, -1.012509, 0.05490196, 0, 1, 1,
0.4664159, -0.02174428, 2.227123, 0.0627451, 0, 1, 1,
0.4707153, -0.214074, 2.009981, 0.06666667, 0, 1, 1,
0.4710709, -1.414124, 3.776502, 0.07450981, 0, 1, 1,
0.4725041, 0.05099134, 2.379066, 0.07843138, 0, 1, 1,
0.4765949, -0.9489172, 3.072804, 0.08627451, 0, 1, 1,
0.4769893, 1.307095, 1.011159, 0.09019608, 0, 1, 1,
0.4869439, -0.1605778, 1.962428, 0.09803922, 0, 1, 1,
0.4915253, 0.3179109, 2.688426, 0.1058824, 0, 1, 1,
0.4941382, 0.5044204, 0.6284648, 0.1098039, 0, 1, 1,
0.4951086, 0.06914984, 3.076846, 0.1176471, 0, 1, 1,
0.4952783, 0.9573089, 0.1846879, 0.1215686, 0, 1, 1,
0.4969887, -0.7936624, 2.699829, 0.1294118, 0, 1, 1,
0.5042618, -1.399574, 2.334314, 0.1333333, 0, 1, 1,
0.5055821, 1.495175, 1.794327, 0.1411765, 0, 1, 1,
0.506068, -0.1913671, 2.1866, 0.145098, 0, 1, 1,
0.5074857, 1.36108, -0.2869762, 0.1529412, 0, 1, 1,
0.5077703, 1.32321, 0.7908942, 0.1568628, 0, 1, 1,
0.5084397, -0.3056149, 2.259771, 0.1647059, 0, 1, 1,
0.5116303, 1.270239, 0.04331018, 0.1686275, 0, 1, 1,
0.5153237, -1.031277, 2.155212, 0.1764706, 0, 1, 1,
0.5162046, -0.1577642, 1.868993, 0.1803922, 0, 1, 1,
0.5181122, -1.660018, 3.124632, 0.1882353, 0, 1, 1,
0.5197036, 0.9270173, 0.9745287, 0.1921569, 0, 1, 1,
0.520917, 0.119293, -0.306996, 0.2, 0, 1, 1,
0.5225227, -0.2689047, 2.284835, 0.2078431, 0, 1, 1,
0.5229383, 1.468691, 0.7877432, 0.2117647, 0, 1, 1,
0.5307525, -0.6881524, 2.937556, 0.2196078, 0, 1, 1,
0.5375341, -0.3237494, 1.662035, 0.2235294, 0, 1, 1,
0.5397754, -0.6571944, 1.909332, 0.2313726, 0, 1, 1,
0.5438632, 0.31312, 0.4415838, 0.2352941, 0, 1, 1,
0.5459793, 0.3457224, 0.8931391, 0.2431373, 0, 1, 1,
0.546778, 0.4544374, 1.00553, 0.2470588, 0, 1, 1,
0.5499127, -0.08863739, 0.7902992, 0.254902, 0, 1, 1,
0.556289, 0.2747098, -0.1090129, 0.2588235, 0, 1, 1,
0.5564851, 0.7525523, 1.966168, 0.2666667, 0, 1, 1,
0.5582136, -0.03721703, 1.95923, 0.2705882, 0, 1, 1,
0.5620298, -0.7766284, 3.36671, 0.2784314, 0, 1, 1,
0.5621486, -1.159348, 3.544313, 0.282353, 0, 1, 1,
0.5637789, -0.2439034, 2.942762, 0.2901961, 0, 1, 1,
0.5639588, 0.4561228, -0.7722104, 0.2941177, 0, 1, 1,
0.5641672, -0.05210933, 0.1378895, 0.3019608, 0, 1, 1,
0.5719457, 2.005084, 0.8278795, 0.3098039, 0, 1, 1,
0.5735798, -0.07510957, 0.8478491, 0.3137255, 0, 1, 1,
0.5749768, 0.3685187, 0.04190628, 0.3215686, 0, 1, 1,
0.5779086, 0.5837865, 0.2582714, 0.3254902, 0, 1, 1,
0.5810111, -0.2635236, 2.6878, 0.3333333, 0, 1, 1,
0.5829164, 0.2624739, 1.737773, 0.3372549, 0, 1, 1,
0.5851582, 0.2564163, -0.3550573, 0.345098, 0, 1, 1,
0.5895395, 0.2512075, 0.3141043, 0.3490196, 0, 1, 1,
0.5897341, -0.8429352, 2.655618, 0.3568628, 0, 1, 1,
0.599294, 0.5997097, 1.725868, 0.3607843, 0, 1, 1,
0.6034494, 0.8205648, 0.696736, 0.3686275, 0, 1, 1,
0.6058848, -1.076177, 1.547878, 0.372549, 0, 1, 1,
0.6060941, -0.3119008, 2.600689, 0.3803922, 0, 1, 1,
0.6064928, -1.097054, 1.417257, 0.3843137, 0, 1, 1,
0.6089139, 0.1164291, 1.776198, 0.3921569, 0, 1, 1,
0.6100783, 1.208981, 2.14486, 0.3960784, 0, 1, 1,
0.6157932, -0.1547004, 1.143156, 0.4039216, 0, 1, 1,
0.6162871, -0.1526393, 0.8776813, 0.4117647, 0, 1, 1,
0.6266527, -1.301236, 5.445947, 0.4156863, 0, 1, 1,
0.6267452, -0.3890776, 0.4476873, 0.4235294, 0, 1, 1,
0.6300582, 0.1918141, 2.029125, 0.427451, 0, 1, 1,
0.6424995, -0.7858123, 2.021236, 0.4352941, 0, 1, 1,
0.6510515, -0.2275057, 1.371623, 0.4392157, 0, 1, 1,
0.6543444, -0.9325032, 3.604083, 0.4470588, 0, 1, 1,
0.657181, 0.0224148, 1.058423, 0.4509804, 0, 1, 1,
0.65806, 2.421542, -1.875015, 0.4588235, 0, 1, 1,
0.6588677, -0.09262843, -0.7998461, 0.4627451, 0, 1, 1,
0.6591384, 0.1635321, 2.289804, 0.4705882, 0, 1, 1,
0.6594033, -0.2436789, 2.428051, 0.4745098, 0, 1, 1,
0.6605433, -0.3171816, 0.8043153, 0.4823529, 0, 1, 1,
0.6644951, 1.070735, 1.832274, 0.4862745, 0, 1, 1,
0.666165, -2.012122, 4.042735, 0.4941176, 0, 1, 1,
0.666266, -0.8149646, 1.424083, 0.5019608, 0, 1, 1,
0.6682823, -1.09841, 2.051126, 0.5058824, 0, 1, 1,
0.6736074, 0.7109045, 1.426526, 0.5137255, 0, 1, 1,
0.6754121, -0.6486735, 2.179199, 0.5176471, 0, 1, 1,
0.67744, -0.4715689, 1.75746, 0.5254902, 0, 1, 1,
0.6782237, -1.619759, 2.424472, 0.5294118, 0, 1, 1,
0.6836045, 0.1218541, 0.6749181, 0.5372549, 0, 1, 1,
0.6837398, 0.6259397, 0.9117942, 0.5411765, 0, 1, 1,
0.6837866, -1.045746, 1.445515, 0.5490196, 0, 1, 1,
0.6845886, 1.333829, 1.294464, 0.5529412, 0, 1, 1,
0.6847343, 1.353005, 1.406433, 0.5607843, 0, 1, 1,
0.6862537, -1.650628, 2.369207, 0.5647059, 0, 1, 1,
0.6864842, 0.7433456, -0.4891764, 0.572549, 0, 1, 1,
0.6898291, -0.6383882, 3.864093, 0.5764706, 0, 1, 1,
0.6948347, -0.23716, 1.811479, 0.5843138, 0, 1, 1,
0.6980669, 0.6444999, 1.671771, 0.5882353, 0, 1, 1,
0.7002308, -0.4943041, 1.419875, 0.5960785, 0, 1, 1,
0.7003395, 0.4335652, 1.068367, 0.6039216, 0, 1, 1,
0.7021944, 0.8414149, 0.5830014, 0.6078432, 0, 1, 1,
0.7030086, 1.004643, 0.5486757, 0.6156863, 0, 1, 1,
0.7086518, 0.5832809, 3.037565, 0.6196079, 0, 1, 1,
0.7190135, 0.1895893, 2.096975, 0.627451, 0, 1, 1,
0.721001, 0.6251206, 1.800414, 0.6313726, 0, 1, 1,
0.7300131, -1.095188, 3.050529, 0.6392157, 0, 1, 1,
0.730528, -0.1015041, 1.886115, 0.6431373, 0, 1, 1,
0.7406729, 2.083028, 0.5264934, 0.6509804, 0, 1, 1,
0.7415633, 0.8500091, 0.2900744, 0.654902, 0, 1, 1,
0.7430924, -0.7589294, 2.551579, 0.6627451, 0, 1, 1,
0.7442106, 1.028055, 0.951425, 0.6666667, 0, 1, 1,
0.7521266, -0.8078355, 0.5971126, 0.6745098, 0, 1, 1,
0.7539204, 0.4118911, 0.7877067, 0.6784314, 0, 1, 1,
0.7559701, 1.109508, 1.404379, 0.6862745, 0, 1, 1,
0.7582519, -0.8939376, 1.373096, 0.6901961, 0, 1, 1,
0.758454, 1.319484, 0.6556857, 0.6980392, 0, 1, 1,
0.759326, -1.526214, 2.552927, 0.7058824, 0, 1, 1,
0.7690594, -0.8726944, 3.824169, 0.7098039, 0, 1, 1,
0.7692087, 0.4074549, 2.052419, 0.7176471, 0, 1, 1,
0.7699801, -0.7758306, 1.430902, 0.7215686, 0, 1, 1,
0.7724667, -0.6716099, 2.634103, 0.7294118, 0, 1, 1,
0.7775696, 0.6562481, 0.8804577, 0.7333333, 0, 1, 1,
0.7811634, 0.2453099, 0.3415722, 0.7411765, 0, 1, 1,
0.7842537, 0.465124, 1.315471, 0.7450981, 0, 1, 1,
0.7849756, -0.7104816, 3.659675, 0.7529412, 0, 1, 1,
0.7856653, -0.6259753, 1.545768, 0.7568628, 0, 1, 1,
0.7871064, 0.5111436, -0.2558251, 0.7647059, 0, 1, 1,
0.791584, -1.005383, 4.351923, 0.7686275, 0, 1, 1,
0.7984526, -0.3360435, 1.684681, 0.7764706, 0, 1, 1,
0.8008642, 0.6146665, 1.014944, 0.7803922, 0, 1, 1,
0.8024617, -0.7750834, 1.015399, 0.7882353, 0, 1, 1,
0.8149548, 1.350134, -0.52217, 0.7921569, 0, 1, 1,
0.8181871, -0.3472427, 1.506392, 0.8, 0, 1, 1,
0.8186991, -0.07096928, 1.143991, 0.8078431, 0, 1, 1,
0.8226184, -0.1536996, 1.900641, 0.8117647, 0, 1, 1,
0.8260566, -1.080625, 1.777174, 0.8196079, 0, 1, 1,
0.8277009, 0.5587854, 0.8299906, 0.8235294, 0, 1, 1,
0.8340386, 1.288708, 1.701441, 0.8313726, 0, 1, 1,
0.8402874, 0.9344413, 0.4273809, 0.8352941, 0, 1, 1,
0.8418497, -0.2843378, 2.717196, 0.8431373, 0, 1, 1,
0.849916, -1.104326, 0.06090222, 0.8470588, 0, 1, 1,
0.8528624, 0.2386698, 3.029713, 0.854902, 0, 1, 1,
0.8541325, 0.2599323, 0.7771909, 0.8588235, 0, 1, 1,
0.8544719, 1.009817, 1.188175, 0.8666667, 0, 1, 1,
0.8560404, 0.1117315, 0.2114241, 0.8705882, 0, 1, 1,
0.8562554, -0.7796584, 0.2363425, 0.8784314, 0, 1, 1,
0.8565289, -0.676419, 1.83933, 0.8823529, 0, 1, 1,
0.8584937, -0.3055587, 2.84532, 0.8901961, 0, 1, 1,
0.8591783, 0.05097486, 2.671948, 0.8941177, 0, 1, 1,
0.8607211, 0.04877574, 0.9813189, 0.9019608, 0, 1, 1,
0.8638523, 0.9283847, 1.279649, 0.9098039, 0, 1, 1,
0.8662449, -1.240195, 1.715366, 0.9137255, 0, 1, 1,
0.8685253, 0.8684886, 1.173383, 0.9215686, 0, 1, 1,
0.87082, 1.312031, -0.7786326, 0.9254902, 0, 1, 1,
0.8711343, 1.419657, 1.232996, 0.9333333, 0, 1, 1,
0.8733365, -0.8346573, 0.9883118, 0.9372549, 0, 1, 1,
0.878543, -0.004467803, 2.830438, 0.945098, 0, 1, 1,
0.8801727, 0.05286542, 3.525731, 0.9490196, 0, 1, 1,
0.8811519, 1.227593, 2.362834, 0.9568627, 0, 1, 1,
0.8819273, -0.299248, 0.9987999, 0.9607843, 0, 1, 1,
0.8838089, 0.1491415, 2.862044, 0.9686275, 0, 1, 1,
0.8845612, -0.7063504, 2.847865, 0.972549, 0, 1, 1,
0.9013259, 0.6880131, 0.7373602, 0.9803922, 0, 1, 1,
0.9024655, 1.096594, 1.669271, 0.9843137, 0, 1, 1,
0.9119946, 0.1073462, 1.732517, 0.9921569, 0, 1, 1,
0.9175987, 1.329572, 0.6334133, 0.9960784, 0, 1, 1,
0.9323636, 0.2986497, 0.4438883, 1, 0, 0.9960784, 1,
0.9382086, 0.6535497, -0.5113424, 1, 0, 0.9882353, 1,
0.9549844, 0.04152068, 1.691731, 1, 0, 0.9843137, 1,
0.9611272, 0.8206695, 2.256551, 1, 0, 0.9764706, 1,
0.9625795, -0.8519858, 1.982031, 1, 0, 0.972549, 1,
0.9630001, 1.93221, 1.240197, 1, 0, 0.9647059, 1,
0.9634552, 2.204892, 1.121145, 1, 0, 0.9607843, 1,
0.9644775, 1.62466, 0.6928098, 1, 0, 0.9529412, 1,
0.9672498, 1.185159, 1.451429, 1, 0, 0.9490196, 1,
0.9724538, -0.01760018, 1.348946, 1, 0, 0.9411765, 1,
0.9827816, -0.8368131, 1.797222, 1, 0, 0.9372549, 1,
0.9869233, -0.02631762, -0.6393527, 1, 0, 0.9294118, 1,
0.9928526, 0.931312, 0.622077, 1, 0, 0.9254902, 1,
0.9982312, -1.485481, 4.72356, 1, 0, 0.9176471, 1,
0.9998046, -0.03204651, 1.740911, 1, 0, 0.9137255, 1,
1.004496, -1.212932, 2.20238, 1, 0, 0.9058824, 1,
1.004537, 0.0172733, 2.612622, 1, 0, 0.9019608, 1,
1.007232, 1.263839, -1.267518, 1, 0, 0.8941177, 1,
1.008807, 2.542031, 1.759692, 1, 0, 0.8862745, 1,
1.010716, 0.905852, 1.421849, 1, 0, 0.8823529, 1,
1.013627, -0.4481881, 2.699508, 1, 0, 0.8745098, 1,
1.017011, -0.5803681, 3.318765, 1, 0, 0.8705882, 1,
1.022941, 1.569118, 1.887066, 1, 0, 0.8627451, 1,
1.026079, 0.04180852, 4.126484, 1, 0, 0.8588235, 1,
1.032179, 0.02607968, 1.206008, 1, 0, 0.8509804, 1,
1.033908, -1.325222, 2.41723, 1, 0, 0.8470588, 1,
1.038962, 0.4603229, 0.3133161, 1, 0, 0.8392157, 1,
1.052263, -0.4747542, 1.6994, 1, 0, 0.8352941, 1,
1.05539, -1.068859, 2.658917, 1, 0, 0.827451, 1,
1.057186, 0.884055, 1.641211, 1, 0, 0.8235294, 1,
1.062518, -0.6552168, 1.509499, 1, 0, 0.8156863, 1,
1.066643, -1.296722, 1.50579, 1, 0, 0.8117647, 1,
1.075805, 0.2375395, 1.498409, 1, 0, 0.8039216, 1,
1.090127, -0.1533003, 1.316096, 1, 0, 0.7960784, 1,
1.090219, -0.04092034, 0.5285271, 1, 0, 0.7921569, 1,
1.098118, 0.2718549, 1.593462, 1, 0, 0.7843137, 1,
1.101262, -1.730897, 2.435197, 1, 0, 0.7803922, 1,
1.115791, 0.5752392, 2.216882, 1, 0, 0.772549, 1,
1.118043, 1.687254, -1.183398, 1, 0, 0.7686275, 1,
1.118538, 1.715195, 0.867772, 1, 0, 0.7607843, 1,
1.121591, 0.4420591, 1.254894, 1, 0, 0.7568628, 1,
1.123329, 0.5585684, 0.6241024, 1, 0, 0.7490196, 1,
1.126818, -0.1486103, 2.163151, 1, 0, 0.7450981, 1,
1.139481, -1.264614, 3.370257, 1, 0, 0.7372549, 1,
1.148549, -0.396208, 3.057472, 1, 0, 0.7333333, 1,
1.150094, -1.616467, 1.688618, 1, 0, 0.7254902, 1,
1.150623, 0.4491639, 1.549572, 1, 0, 0.7215686, 1,
1.150781, -0.1560381, 3.833099, 1, 0, 0.7137255, 1,
1.1603, 0.3627301, 0.6046503, 1, 0, 0.7098039, 1,
1.173305, -0.507863, 1.635224, 1, 0, 0.7019608, 1,
1.173731, 0.4036875, 1.614714, 1, 0, 0.6941177, 1,
1.1739, -1.114314, 0.6265119, 1, 0, 0.6901961, 1,
1.178614, -0.3249621, 2.011995, 1, 0, 0.682353, 1,
1.179666, 1.270328, 0.8205836, 1, 0, 0.6784314, 1,
1.181882, -0.3382992, 2.346773, 1, 0, 0.6705883, 1,
1.185117, -1.268955, 2.533809, 1, 0, 0.6666667, 1,
1.190372, 0.4660451, -0.48267, 1, 0, 0.6588235, 1,
1.198606, -0.2320841, 2.693499, 1, 0, 0.654902, 1,
1.218859, -0.2595973, 2.780774, 1, 0, 0.6470588, 1,
1.218888, -0.01699552, 1.766582, 1, 0, 0.6431373, 1,
1.23455, 1.683542, -0.5596732, 1, 0, 0.6352941, 1,
1.248759, 1.610983, 1.730234, 1, 0, 0.6313726, 1,
1.250803, -0.4879853, 2.606641, 1, 0, 0.6235294, 1,
1.256846, 0.6984338, 1.218446, 1, 0, 0.6196079, 1,
1.266079, 1.290602, 0.6616024, 1, 0, 0.6117647, 1,
1.271983, -0.80542, 1.812304, 1, 0, 0.6078432, 1,
1.274356, -1.02939, 3.336949, 1, 0, 0.6, 1,
1.300887, 1.089203, 1.442772, 1, 0, 0.5921569, 1,
1.301008, 1.419728, -0.9437136, 1, 0, 0.5882353, 1,
1.304782, 2.244216, 1.97943, 1, 0, 0.5803922, 1,
1.310439, -0.3453924, 2.40913, 1, 0, 0.5764706, 1,
1.310734, -2.03504, 2.458873, 1, 0, 0.5686275, 1,
1.311955, -2.874393, 2.628253, 1, 0, 0.5647059, 1,
1.313857, -0.14048, 2.366768, 1, 0, 0.5568628, 1,
1.319066, -3.236717, 2.608529, 1, 0, 0.5529412, 1,
1.335547, 1.140071, 0.3745483, 1, 0, 0.5450981, 1,
1.336617, -0.3721057, 2.914072, 1, 0, 0.5411765, 1,
1.341166, 0.03469715, 1.348929, 1, 0, 0.5333334, 1,
1.34213, 0.6237424, 0.4545002, 1, 0, 0.5294118, 1,
1.353132, -0.260151, 0.6635802, 1, 0, 0.5215687, 1,
1.366231, -0.832947, 2.218577, 1, 0, 0.5176471, 1,
1.397744, 0.6482558, 2.401983, 1, 0, 0.509804, 1,
1.400808, -0.4476727, 2.186731, 1, 0, 0.5058824, 1,
1.41263, 1.189446, 0.8462203, 1, 0, 0.4980392, 1,
1.420884, 0.5382129, 0.6251407, 1, 0, 0.4901961, 1,
1.426541, 0.2598082, 2.01873, 1, 0, 0.4862745, 1,
1.426873, 2.385418, 0.5188577, 1, 0, 0.4784314, 1,
1.441696, 0.002679762, 1.165024, 1, 0, 0.4745098, 1,
1.447019, 0.6645802, 1.733086, 1, 0, 0.4666667, 1,
1.450389, 0.3441279, 1.852792, 1, 0, 0.4627451, 1,
1.46471, -1.271136, 2.623873, 1, 0, 0.454902, 1,
1.475607, 0.8453104, 0.3808891, 1, 0, 0.4509804, 1,
1.482893, 0.0901565, -0.01819863, 1, 0, 0.4431373, 1,
1.488328, 0.8580892, 0.03201765, 1, 0, 0.4392157, 1,
1.5044, 0.1259544, -0.1305134, 1, 0, 0.4313726, 1,
1.510409, -0.9103093, 2.948334, 1, 0, 0.427451, 1,
1.514554, -0.8705826, 4.033347, 1, 0, 0.4196078, 1,
1.519627, 0.4357543, 2.458777, 1, 0, 0.4156863, 1,
1.523336, 1.105376, 3.313551, 1, 0, 0.4078431, 1,
1.524352, -0.2215403, 1.332097, 1, 0, 0.4039216, 1,
1.525017, 0.9938095, 1.600412, 1, 0, 0.3960784, 1,
1.528116, 0.4749663, 0.2143145, 1, 0, 0.3882353, 1,
1.530482, -1.250081, 1.746495, 1, 0, 0.3843137, 1,
1.533701, 0.09731524, 1.567629, 1, 0, 0.3764706, 1,
1.539993, -0.4262815, 2.241701, 1, 0, 0.372549, 1,
1.540882, -0.1800444, 2.02753, 1, 0, 0.3647059, 1,
1.55662, -1.48776, 0.004506864, 1, 0, 0.3607843, 1,
1.558818, 1.67933, 2.004439, 1, 0, 0.3529412, 1,
1.570322, 1.861097, 1.191625, 1, 0, 0.3490196, 1,
1.57343, -1.131539, 2.117669, 1, 0, 0.3411765, 1,
1.582516, -0.2836076, 0.4213131, 1, 0, 0.3372549, 1,
1.5861, 0.03240741, 1.972682, 1, 0, 0.3294118, 1,
1.586147, 1.568444, 0.9664481, 1, 0, 0.3254902, 1,
1.597703, 0.004112111, 0.9536666, 1, 0, 0.3176471, 1,
1.638849, -0.4642428, 0.04245805, 1, 0, 0.3137255, 1,
1.639313, -0.443564, 1.900601, 1, 0, 0.3058824, 1,
1.642642, 0.9589129, -0.3427135, 1, 0, 0.2980392, 1,
1.647676, -1.228003, 1.43869, 1, 0, 0.2941177, 1,
1.655202, -0.86374, 3.74072, 1, 0, 0.2862745, 1,
1.655773, -2.029041, 2.573376, 1, 0, 0.282353, 1,
1.656918, -0.7017571, 2.523168, 1, 0, 0.2745098, 1,
1.667012, -1.111976, 1.953281, 1, 0, 0.2705882, 1,
1.677088, 1.70937, 0.5280375, 1, 0, 0.2627451, 1,
1.681337, -0.006763556, 1.517746, 1, 0, 0.2588235, 1,
1.682377, 0.4007403, -0.4444371, 1, 0, 0.2509804, 1,
1.69716, -1.193431, 2.880834, 1, 0, 0.2470588, 1,
1.704066, 0.5024551, 0.360057, 1, 0, 0.2392157, 1,
1.745769, -0.869916, 3.05627, 1, 0, 0.2352941, 1,
1.759877, 0.8664413, 2.410893, 1, 0, 0.227451, 1,
1.774176, 0.1397987, 1.406943, 1, 0, 0.2235294, 1,
1.780696, -0.8880696, 0.7217044, 1, 0, 0.2156863, 1,
1.789364, -0.9764146, 0.8496649, 1, 0, 0.2117647, 1,
1.790262, 0.9568411, 0.8637806, 1, 0, 0.2039216, 1,
1.822788, 0.8279564, 0.5290449, 1, 0, 0.1960784, 1,
1.830725, -1.13229, 1.694288, 1, 0, 0.1921569, 1,
1.842919, -0.3903493, -0.3137787, 1, 0, 0.1843137, 1,
1.844608, -0.1623349, 0.5701826, 1, 0, 0.1803922, 1,
1.846966, -0.1085031, 0.5469237, 1, 0, 0.172549, 1,
1.84707, -0.8529209, 1.58513, 1, 0, 0.1686275, 1,
1.855932, 1.087364, 0.3832719, 1, 0, 0.1607843, 1,
1.87859, 0.6005355, 1.855447, 1, 0, 0.1568628, 1,
1.891376, -0.3976122, 0.7965379, 1, 0, 0.1490196, 1,
1.928946, 1.308998, -1.923363, 1, 0, 0.145098, 1,
1.940725, -0.2305811, 0.8362967, 1, 0, 0.1372549, 1,
1.978257, 1.043224, 1.65429, 1, 0, 0.1333333, 1,
2.011141, -0.8849119, 3.368724, 1, 0, 0.1254902, 1,
2.016616, -1.338458, 1.484549, 1, 0, 0.1215686, 1,
2.046012, -1.717842, 1.095564, 1, 0, 0.1137255, 1,
2.04658, -0.0620349, 1.763615, 1, 0, 0.1098039, 1,
2.1194, 2.016296, 0.3584246, 1, 0, 0.1019608, 1,
2.126529, 1.043819, -0.4356441, 1, 0, 0.09411765, 1,
2.134975, -0.9213842, 1.674728, 1, 0, 0.09019608, 1,
2.163272, -0.2815888, 3.078196, 1, 0, 0.08235294, 1,
2.17373, -0.7330289, 1.219928, 1, 0, 0.07843138, 1,
2.177728, -0.9968612, 1.478772, 1, 0, 0.07058824, 1,
2.183062, -2.198004, 3.83916, 1, 0, 0.06666667, 1,
2.24735, 1.121231, 2.105287, 1, 0, 0.05882353, 1,
2.250177, 0.8588122, 1.078807, 1, 0, 0.05490196, 1,
2.282145, 0.07168091, 3.239021, 1, 0, 0.04705882, 1,
2.295313, 1.233037, 0.7369663, 1, 0, 0.04313726, 1,
2.373172, -1.563649, 0.7325078, 1, 0, 0.03529412, 1,
2.49236, 0.6392146, 1.267301, 1, 0, 0.03137255, 1,
2.823063, 0.3717885, 2.541561, 1, 0, 0.02352941, 1,
2.855279, -0.6583748, 2.60174, 1, 0, 0.01960784, 1,
2.971451, 1.075656, 1.036638, 1, 0, 0.01176471, 1,
3.310292, -1.848462, 0.2508945, 1, 0, 0.007843138, 1
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
0.02146912, -4.281528, -7.033431, 0, -0.5, 0.5, 0.5,
0.02146912, -4.281528, -7.033431, 1, -0.5, 0.5, 0.5,
0.02146912, -4.281528, -7.033431, 1, 1.5, 0.5, 0.5,
0.02146912, -4.281528, -7.033431, 0, 1.5, 0.5, 0.5
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
-4.382265, -0.1546794, -7.033431, 0, -0.5, 0.5, 0.5,
-4.382265, -0.1546794, -7.033431, 1, -0.5, 0.5, 0.5,
-4.382265, -0.1546794, -7.033431, 1, 1.5, 0.5, 0.5,
-4.382265, -0.1546794, -7.033431, 0, 1.5, 0.5, 0.5
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
-4.382265, -4.281528, 0.2894948, 0, -0.5, 0.5, 0.5,
-4.382265, -4.281528, 0.2894948, 1, -0.5, 0.5, 0.5,
-4.382265, -4.281528, 0.2894948, 1, 1.5, 0.5, 0.5,
-4.382265, -4.281528, 0.2894948, 0, 1.5, 0.5, 0.5
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
-3, -3.329178, -5.343525,
3, -3.329178, -5.343525,
-3, -3.329178, -5.343525,
-3, -3.487903, -5.625176,
-2, -3.329178, -5.343525,
-2, -3.487903, -5.625176,
-1, -3.329178, -5.343525,
-1, -3.487903, -5.625176,
0, -3.329178, -5.343525,
0, -3.487903, -5.625176,
1, -3.329178, -5.343525,
1, -3.487903, -5.625176,
2, -3.329178, -5.343525,
2, -3.487903, -5.625176,
3, -3.329178, -5.343525,
3, -3.487903, -5.625176
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
-3, -3.805353, -6.188478, 0, -0.5, 0.5, 0.5,
-3, -3.805353, -6.188478, 1, -0.5, 0.5, 0.5,
-3, -3.805353, -6.188478, 1, 1.5, 0.5, 0.5,
-3, -3.805353, -6.188478, 0, 1.5, 0.5, 0.5,
-2, -3.805353, -6.188478, 0, -0.5, 0.5, 0.5,
-2, -3.805353, -6.188478, 1, -0.5, 0.5, 0.5,
-2, -3.805353, -6.188478, 1, 1.5, 0.5, 0.5,
-2, -3.805353, -6.188478, 0, 1.5, 0.5, 0.5,
-1, -3.805353, -6.188478, 0, -0.5, 0.5, 0.5,
-1, -3.805353, -6.188478, 1, -0.5, 0.5, 0.5,
-1, -3.805353, -6.188478, 1, 1.5, 0.5, 0.5,
-1, -3.805353, -6.188478, 0, 1.5, 0.5, 0.5,
0, -3.805353, -6.188478, 0, -0.5, 0.5, 0.5,
0, -3.805353, -6.188478, 1, -0.5, 0.5, 0.5,
0, -3.805353, -6.188478, 1, 1.5, 0.5, 0.5,
0, -3.805353, -6.188478, 0, 1.5, 0.5, 0.5,
1, -3.805353, -6.188478, 0, -0.5, 0.5, 0.5,
1, -3.805353, -6.188478, 1, -0.5, 0.5, 0.5,
1, -3.805353, -6.188478, 1, 1.5, 0.5, 0.5,
1, -3.805353, -6.188478, 0, 1.5, 0.5, 0.5,
2, -3.805353, -6.188478, 0, -0.5, 0.5, 0.5,
2, -3.805353, -6.188478, 1, -0.5, 0.5, 0.5,
2, -3.805353, -6.188478, 1, 1.5, 0.5, 0.5,
2, -3.805353, -6.188478, 0, 1.5, 0.5, 0.5,
3, -3.805353, -6.188478, 0, -0.5, 0.5, 0.5,
3, -3.805353, -6.188478, 1, -0.5, 0.5, 0.5,
3, -3.805353, -6.188478, 1, 1.5, 0.5, 0.5,
3, -3.805353, -6.188478, 0, 1.5, 0.5, 0.5
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
-3.366018, -3, -5.343525,
-3.366018, 2, -5.343525,
-3.366018, -3, -5.343525,
-3.535393, -3, -5.625176,
-3.366018, -2, -5.343525,
-3.535393, -2, -5.625176,
-3.366018, -1, -5.343525,
-3.535393, -1, -5.625176,
-3.366018, 0, -5.343525,
-3.535393, 0, -5.625176,
-3.366018, 1, -5.343525,
-3.535393, 1, -5.625176,
-3.366018, 2, -5.343525,
-3.535393, 2, -5.625176
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
-3.874141, -3, -6.188478, 0, -0.5, 0.5, 0.5,
-3.874141, -3, -6.188478, 1, -0.5, 0.5, 0.5,
-3.874141, -3, -6.188478, 1, 1.5, 0.5, 0.5,
-3.874141, -3, -6.188478, 0, 1.5, 0.5, 0.5,
-3.874141, -2, -6.188478, 0, -0.5, 0.5, 0.5,
-3.874141, -2, -6.188478, 1, -0.5, 0.5, 0.5,
-3.874141, -2, -6.188478, 1, 1.5, 0.5, 0.5,
-3.874141, -2, -6.188478, 0, 1.5, 0.5, 0.5,
-3.874141, -1, -6.188478, 0, -0.5, 0.5, 0.5,
-3.874141, -1, -6.188478, 1, -0.5, 0.5, 0.5,
-3.874141, -1, -6.188478, 1, 1.5, 0.5, 0.5,
-3.874141, -1, -6.188478, 0, 1.5, 0.5, 0.5,
-3.874141, 0, -6.188478, 0, -0.5, 0.5, 0.5,
-3.874141, 0, -6.188478, 1, -0.5, 0.5, 0.5,
-3.874141, 0, -6.188478, 1, 1.5, 0.5, 0.5,
-3.874141, 0, -6.188478, 0, 1.5, 0.5, 0.5,
-3.874141, 1, -6.188478, 0, -0.5, 0.5, 0.5,
-3.874141, 1, -6.188478, 1, -0.5, 0.5, 0.5,
-3.874141, 1, -6.188478, 1, 1.5, 0.5, 0.5,
-3.874141, 1, -6.188478, 0, 1.5, 0.5, 0.5,
-3.874141, 2, -6.188478, 0, -0.5, 0.5, 0.5,
-3.874141, 2, -6.188478, 1, -0.5, 0.5, 0.5,
-3.874141, 2, -6.188478, 1, 1.5, 0.5, 0.5,
-3.874141, 2, -6.188478, 0, 1.5, 0.5, 0.5
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
-3.366018, -3.329178, -4,
-3.366018, -3.329178, 4,
-3.366018, -3.329178, -4,
-3.535393, -3.487903, -4,
-3.366018, -3.329178, -2,
-3.535393, -3.487903, -2,
-3.366018, -3.329178, 0,
-3.535393, -3.487903, 0,
-3.366018, -3.329178, 2,
-3.535393, -3.487903, 2,
-3.366018, -3.329178, 4,
-3.535393, -3.487903, 4
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
-3.874141, -3.805353, -4, 0, -0.5, 0.5, 0.5,
-3.874141, -3.805353, -4, 1, -0.5, 0.5, 0.5,
-3.874141, -3.805353, -4, 1, 1.5, 0.5, 0.5,
-3.874141, -3.805353, -4, 0, 1.5, 0.5, 0.5,
-3.874141, -3.805353, -2, 0, -0.5, 0.5, 0.5,
-3.874141, -3.805353, -2, 1, -0.5, 0.5, 0.5,
-3.874141, -3.805353, -2, 1, 1.5, 0.5, 0.5,
-3.874141, -3.805353, -2, 0, 1.5, 0.5, 0.5,
-3.874141, -3.805353, 0, 0, -0.5, 0.5, 0.5,
-3.874141, -3.805353, 0, 1, -0.5, 0.5, 0.5,
-3.874141, -3.805353, 0, 1, 1.5, 0.5, 0.5,
-3.874141, -3.805353, 0, 0, 1.5, 0.5, 0.5,
-3.874141, -3.805353, 2, 0, -0.5, 0.5, 0.5,
-3.874141, -3.805353, 2, 1, -0.5, 0.5, 0.5,
-3.874141, -3.805353, 2, 1, 1.5, 0.5, 0.5,
-3.874141, -3.805353, 2, 0, 1.5, 0.5, 0.5,
-3.874141, -3.805353, 4, 0, -0.5, 0.5, 0.5,
-3.874141, -3.805353, 4, 1, -0.5, 0.5, 0.5,
-3.874141, -3.805353, 4, 1, 1.5, 0.5, 0.5,
-3.874141, -3.805353, 4, 0, 1.5, 0.5, 0.5
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
-3.366018, -3.329178, -5.343525,
-3.366018, 3.019819, -5.343525,
-3.366018, -3.329178, 5.922514,
-3.366018, 3.019819, 5.922514,
-3.366018, -3.329178, -5.343525,
-3.366018, -3.329178, 5.922514,
-3.366018, 3.019819, -5.343525,
-3.366018, 3.019819, 5.922514,
-3.366018, -3.329178, -5.343525,
3.408957, -3.329178, -5.343525,
-3.366018, -3.329178, 5.922514,
3.408957, -3.329178, 5.922514,
-3.366018, 3.019819, -5.343525,
3.408957, 3.019819, -5.343525,
-3.366018, 3.019819, 5.922514,
3.408957, 3.019819, 5.922514,
3.408957, -3.329178, -5.343525,
3.408957, 3.019819, -5.343525,
3.408957, -3.329178, 5.922514,
3.408957, 3.019819, 5.922514,
3.408957, -3.329178, -5.343525,
3.408957, -3.329178, 5.922514,
3.408957, 3.019819, -5.343525,
3.408957, 3.019819, 5.922514
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
var radius = 7.795635;
var distance = 34.68366;
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
mvMatrix.translate( -0.02146912, 0.1546794, -0.2894948 );
mvMatrix.scale( 1.244107, 1.327579, 0.7481595 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.68366);
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
Flumetralin<-read.table("Flumetralin.xyz")
```

```
## Error in read.table("Flumetralin.xyz"): no lines available in input
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
-3.267354, -1.472514, -2.421444, 0, 0, 1, 1, 1,
-2.959957, 0.857594, -1.216291, 1, 0, 0, 1, 1,
-2.781946, -1.636585, -1.282193, 1, 0, 0, 1, 1,
-2.698153, 1.096254, -2.685635, 1, 0, 0, 1, 1,
-2.601708, -0.07652413, -2.377464, 1, 0, 0, 1, 1,
-2.425953, -0.2735135, -1.967931, 1, 0, 0, 1, 1,
-2.406179, 0.9064824, 0.1941208, 0, 0, 0, 1, 1,
-2.362624, 0.01903033, -1.93841, 0, 0, 0, 1, 1,
-2.324524, -0.2683965, -3.258666, 0, 0, 0, 1, 1,
-2.316983, -0.4054744, -2.536764, 0, 0, 0, 1, 1,
-2.286642, 2.082239, 0.4421687, 0, 0, 0, 1, 1,
-2.280609, 0.8851515, -1.322695, 0, 0, 0, 1, 1,
-2.265185, -1.012771, -1.204585, 0, 0, 0, 1, 1,
-2.236497, -1.106101, -0.09390021, 1, 1, 1, 1, 1,
-2.217981, 0.9243106, 1.198761, 1, 1, 1, 1, 1,
-2.199474, -2.060067, -2.702859, 1, 1, 1, 1, 1,
-2.183265, 0.8139696, -1.708326, 1, 1, 1, 1, 1,
-2.157987, -2.465088, -1.592367, 1, 1, 1, 1, 1,
-2.135798, 0.5487989, -1.868505, 1, 1, 1, 1, 1,
-2.120419, -0.1557985, -1.878053, 1, 1, 1, 1, 1,
-2.054755, 1.162045, -1.411853, 1, 1, 1, 1, 1,
-2.049324, 0.7227869, -1.950762, 1, 1, 1, 1, 1,
-2.009416, -0.2763706, -2.058432, 1, 1, 1, 1, 1,
-1.982691, -0.4754119, -1.404497, 1, 1, 1, 1, 1,
-1.964012, 1.353643, 0.5277867, 1, 1, 1, 1, 1,
-1.946684, 1.716957, -1.673807, 1, 1, 1, 1, 1,
-1.912771, -0.09001929, -1.929884, 1, 1, 1, 1, 1,
-1.904372, -0.1854262, -1.273029, 1, 1, 1, 1, 1,
-1.875966, 1.859055, -1.610358, 0, 0, 1, 1, 1,
-1.838163, -0.9781641, -1.01008, 1, 0, 0, 1, 1,
-1.829595, -0.3499757, -2.067627, 1, 0, 0, 1, 1,
-1.79482, -1.239295, -3.020936, 1, 0, 0, 1, 1,
-1.784476, -0.8095477, -2.864806, 1, 0, 0, 1, 1,
-1.772867, -0.03170051, 0.2131389, 1, 0, 0, 1, 1,
-1.74217, 0.8891078, -0.3214484, 0, 0, 0, 1, 1,
-1.731793, -0.9031738, 0.5739168, 0, 0, 0, 1, 1,
-1.717723, 0.9028964, -2.160377, 0, 0, 0, 1, 1,
-1.709047, 0.3358615, -3.35588, 0, 0, 0, 1, 1,
-1.674415, 0.9741549, -0.3826654, 0, 0, 0, 1, 1,
-1.670907, 0.1800598, -2.932525, 0, 0, 0, 1, 1,
-1.666724, 0.5371432, -2.089103, 0, 0, 0, 1, 1,
-1.635041, -0.6413786, -2.71869, 1, 1, 1, 1, 1,
-1.602385, 2.778483, -0.187512, 1, 1, 1, 1, 1,
-1.58498, 0.5705699, -0.3534048, 1, 1, 1, 1, 1,
-1.579933, 0.6924363, -0.6512029, 1, 1, 1, 1, 1,
-1.579878, 0.6001959, -1.857868, 1, 1, 1, 1, 1,
-1.564785, -0.3615676, -2.678856, 1, 1, 1, 1, 1,
-1.561079, 0.2280828, -0.8109466, 1, 1, 1, 1, 1,
-1.545376, -0.2079998, -3.383711, 1, 1, 1, 1, 1,
-1.527267, 1.040899, 0.6168148, 1, 1, 1, 1, 1,
-1.521426, -0.885821, -1.772942, 1, 1, 1, 1, 1,
-1.519007, 0.2022099, -1.148144, 1, 1, 1, 1, 1,
-1.512255, 1.606253, -0.2107109, 1, 1, 1, 1, 1,
-1.506849, 2.006836, -0.2431503, 1, 1, 1, 1, 1,
-1.506379, 0.4362546, 0.3031894, 1, 1, 1, 1, 1,
-1.504979, 1.079062, -2.777556, 1, 1, 1, 1, 1,
-1.499568, -0.7797517, -1.974964, 0, 0, 1, 1, 1,
-1.499429, -0.6105886, -3.504237, 1, 0, 0, 1, 1,
-1.490872, -0.4046894, -2.478303, 1, 0, 0, 1, 1,
-1.461063, -0.4768868, -1.910856, 1, 0, 0, 1, 1,
-1.460296, -0.6811622, -2.448491, 1, 0, 0, 1, 1,
-1.458761, -0.3686967, -2.572736, 1, 0, 0, 1, 1,
-1.458233, 1.354431, 1.695983, 0, 0, 0, 1, 1,
-1.446552, 0.9565747, -1.123861, 0, 0, 0, 1, 1,
-1.430202, -1.159144, -0.9927385, 0, 0, 0, 1, 1,
-1.429258, -0.5972095, -2.507865, 0, 0, 0, 1, 1,
-1.423671, -0.6634737, -1.856541, 0, 0, 0, 1, 1,
-1.421437, -0.8886429, -3.828479, 0, 0, 0, 1, 1,
-1.41928, -1.360368, -1.958636, 0, 0, 0, 1, 1,
-1.404166, -0.05832737, -1.056216, 1, 1, 1, 1, 1,
-1.399616, -1.129303, -1.269928, 1, 1, 1, 1, 1,
-1.396765, 0.2572491, -1.063193, 1, 1, 1, 1, 1,
-1.395722, -0.3918188, -1.271165, 1, 1, 1, 1, 1,
-1.380811, -1.61603, -3.064066, 1, 1, 1, 1, 1,
-1.378896, -0.5397884, -2.599632, 1, 1, 1, 1, 1,
-1.378778, -1.206071, -2.19864, 1, 1, 1, 1, 1,
-1.366039, 0.1515723, -1.816324, 1, 1, 1, 1, 1,
-1.359461, -0.2656707, -0.8237891, 1, 1, 1, 1, 1,
-1.356198, -1.046928, -1.092719, 1, 1, 1, 1, 1,
-1.350672, 1.118178, -2.682413, 1, 1, 1, 1, 1,
-1.349653, -0.1304507, -1.398215, 1, 1, 1, 1, 1,
-1.346497, -0.01743687, -1.778768, 1, 1, 1, 1, 1,
-1.336831, 1.460028, -1.837431, 1, 1, 1, 1, 1,
-1.334032, -0.4055316, 1.182762, 1, 1, 1, 1, 1,
-1.325369, -0.1371243, -2.223641, 0, 0, 1, 1, 1,
-1.310022, -0.4587585, -1.756138, 1, 0, 0, 1, 1,
-1.309971, 0.8649426, -1.289149, 1, 0, 0, 1, 1,
-1.3087, -1.844937, -0.4003592, 1, 0, 0, 1, 1,
-1.306972, 0.3822312, -0.5172387, 1, 0, 0, 1, 1,
-1.3036, -1.206807, -1.602734, 1, 0, 0, 1, 1,
-1.299336, 1.197197, -0.9081624, 0, 0, 0, 1, 1,
-1.282068, -0.2061698, -1.506136, 0, 0, 0, 1, 1,
-1.280241, -0.4078493, -0.3754758, 0, 0, 0, 1, 1,
-1.269816, 0.4832369, -0.8003159, 0, 0, 0, 1, 1,
-1.24023, 1.870707, 1.130299, 0, 0, 0, 1, 1,
-1.23284, -0.04658199, -2.015154, 0, 0, 0, 1, 1,
-1.23145, 0.1183847, -0.1519219, 0, 0, 0, 1, 1,
-1.226363, 1.345477, -1.259805, 1, 1, 1, 1, 1,
-1.222262, 0.4369373, -1.906116, 1, 1, 1, 1, 1,
-1.214148, 0.4209925, -2.340793, 1, 1, 1, 1, 1,
-1.210721, 1.38858, 0.3536261, 1, 1, 1, 1, 1,
-1.208803, 0.4441707, 0.5569078, 1, 1, 1, 1, 1,
-1.204038, -0.08521391, -2.882836, 1, 1, 1, 1, 1,
-1.198001, 1.640907, -0.1543212, 1, 1, 1, 1, 1,
-1.196855, 1.804015, -0.5421911, 1, 1, 1, 1, 1,
-1.190924, 1.108509, 0.752744, 1, 1, 1, 1, 1,
-1.186737, 0.5502482, -1.425885, 1, 1, 1, 1, 1,
-1.181967, -0.6775253, -2.805235, 1, 1, 1, 1, 1,
-1.181568, -0.8043197, -0.5726902, 1, 1, 1, 1, 1,
-1.175708, 0.1083635, -1.535425, 1, 1, 1, 1, 1,
-1.173555, -0.865519, -0.3322979, 1, 1, 1, 1, 1,
-1.170941, 0.6802268, -2.276715, 1, 1, 1, 1, 1,
-1.166833, 0.6713775, -1.424044, 0, 0, 1, 1, 1,
-1.158104, 0.6831874, 1.15051, 1, 0, 0, 1, 1,
-1.157372, -1.012372, -1.826363, 1, 0, 0, 1, 1,
-1.156937, -1.185961, -2.045885, 1, 0, 0, 1, 1,
-1.15019, 1.132873, -1.830153, 1, 0, 0, 1, 1,
-1.148003, -0.2967405, -3.345782, 1, 0, 0, 1, 1,
-1.147691, 0.8271411, -0.8102472, 0, 0, 0, 1, 1,
-1.094673, -0.7618371, -1.649385, 0, 0, 0, 1, 1,
-1.092879, 0.9734762, -2.875267, 0, 0, 0, 1, 1,
-1.092761, -0.2908238, -0.01197102, 0, 0, 0, 1, 1,
-1.092276, 0.4249549, 0.06508777, 0, 0, 0, 1, 1,
-1.084383, 2.254945, 1.78863, 0, 0, 0, 1, 1,
-1.083033, -0.1324431, -1.537777, 0, 0, 0, 1, 1,
-1.079502, -0.5133146, -1.734854, 1, 1, 1, 1, 1,
-1.077428, -1.259993, -3.326706, 1, 1, 1, 1, 1,
-1.076953, 0.862373, 0.6635368, 1, 1, 1, 1, 1,
-1.07473, 1.344354, -0.1256896, 1, 1, 1, 1, 1,
-1.065428, 0.03856279, -2.09622, 1, 1, 1, 1, 1,
-1.064371, -1.08485, -0.4434571, 1, 1, 1, 1, 1,
-1.061872, 1.088639, -0.2029438, 1, 1, 1, 1, 1,
-1.056053, -0.8591677, -2.610722, 1, 1, 1, 1, 1,
-1.054949, 0.1717291, -1.144114, 1, 1, 1, 1, 1,
-1.041636, -0.904281, -0.5050179, 1, 1, 1, 1, 1,
-1.041144, -2.200668, -2.194586, 1, 1, 1, 1, 1,
-1.037067, -1.101396, -2.789293, 1, 1, 1, 1, 1,
-1.035226, 1.22095, -1.966055, 1, 1, 1, 1, 1,
-1.030518, 0.9663677, -2.120605, 1, 1, 1, 1, 1,
-1.030137, 0.411074, -1.367982, 1, 1, 1, 1, 1,
-1.027032, -0.8277786, -1.378212, 0, 0, 1, 1, 1,
-1.024858, -1.45227, -2.199977, 1, 0, 0, 1, 1,
-1.0241, 0.1227644, -1.248308, 1, 0, 0, 1, 1,
-1.022239, -1.843345, -2.303917, 1, 0, 0, 1, 1,
-1.021405, -0.8487824, -2.81622, 1, 0, 0, 1, 1,
-1.020369, -1.770132, -1.490637, 1, 0, 0, 1, 1,
-1.017652, -0.2464042, -1.819548, 0, 0, 0, 1, 1,
-1.014907, 0.2887221, -2.721105, 0, 0, 0, 1, 1,
-1.012418, -0.8277785, -3.07155, 0, 0, 0, 1, 1,
-1.008115, -0.3174318, 0.5910316, 0, 0, 0, 1, 1,
-0.9988929, 0.8090162, -2.651198, 0, 0, 0, 1, 1,
-0.9958818, 0.8179782, -2.057611, 0, 0, 0, 1, 1,
-0.9890609, 1.453967, 0.9418759, 0, 0, 0, 1, 1,
-0.9871715, -0.9410971, -3.046819, 1, 1, 1, 1, 1,
-0.9839512, -0.2223696, -1.634713, 1, 1, 1, 1, 1,
-0.9804018, -1.447204, -2.75157, 1, 1, 1, 1, 1,
-0.9727219, 0.3919812, -0.2688324, 1, 1, 1, 1, 1,
-0.9700667, 1.358867, 0.7750329, 1, 1, 1, 1, 1,
-0.9633498, -0.05034041, -1.765499, 1, 1, 1, 1, 1,
-0.9583941, 0.3030848, 0.1079704, 1, 1, 1, 1, 1,
-0.9542279, 0.9324995, -0.6819571, 1, 1, 1, 1, 1,
-0.953347, 0.1889933, -1.248763, 1, 1, 1, 1, 1,
-0.9472387, -1.110565, -1.381653, 1, 1, 1, 1, 1,
-0.9468122, 0.8804617, 0.06214373, 1, 1, 1, 1, 1,
-0.9387334, -1.263968, -2.88009, 1, 1, 1, 1, 1,
-0.921559, 0.7096348, -0.01287623, 1, 1, 1, 1, 1,
-0.9113612, -0.7460511, -3.73224, 1, 1, 1, 1, 1,
-0.910257, -1.216276, -2.077641, 1, 1, 1, 1, 1,
-0.9092, -0.9122072, -2.592707, 0, 0, 1, 1, 1,
-0.9090056, -0.2154431, -1.861561, 1, 0, 0, 1, 1,
-0.9083241, 1.680235, -1.204832, 1, 0, 0, 1, 1,
-0.9050397, 1.313551, 1.186644, 1, 0, 0, 1, 1,
-0.897176, -0.2530937, -2.718061, 1, 0, 0, 1, 1,
-0.8911412, 0.4088199, -0.7433256, 1, 0, 0, 1, 1,
-0.8905519, 1.072299, -1.272571, 0, 0, 0, 1, 1,
-0.8903165, 0.6210551, -1.148924, 0, 0, 0, 1, 1,
-0.8882577, 0.6469659, -2.241285, 0, 0, 0, 1, 1,
-0.8882398, -0.05979304, -2.49114, 0, 0, 0, 1, 1,
-0.8841922, 1.885591, -0.1136034, 0, 0, 0, 1, 1,
-0.8815572, 0.8269715, 0.1201371, 0, 0, 0, 1, 1,
-0.8762999, -0.9240776, -3.039648, 0, 0, 0, 1, 1,
-0.8681906, 0.6700585, 0.4670231, 1, 1, 1, 1, 1,
-0.8669416, 1.409021, -0.488483, 1, 1, 1, 1, 1,
-0.8635921, -0.2373885, 0.4600275, 1, 1, 1, 1, 1,
-0.8619463, 0.5559744, -2.780356, 1, 1, 1, 1, 1,
-0.8555854, 0.5285574, -0.6748581, 1, 1, 1, 1, 1,
-0.8439004, 0.9020138, 0.03391172, 1, 1, 1, 1, 1,
-0.8367571, 1.882943, -2.014587, 1, 1, 1, 1, 1,
-0.8321858, 0.5161449, -0.4059801, 1, 1, 1, 1, 1,
-0.8304001, 0.3240953, 0.4518465, 1, 1, 1, 1, 1,
-0.8256845, 0.3638442, -1.237968, 1, 1, 1, 1, 1,
-0.8228406, -2.023158, -3.093096, 1, 1, 1, 1, 1,
-0.8177716, -0.7458488, -2.98438, 1, 1, 1, 1, 1,
-0.8135203, 2.927358, -1.649065, 1, 1, 1, 1, 1,
-0.8066562, -0.7769802, -3.881185, 1, 1, 1, 1, 1,
-0.8057868, 1.07945, 1.159735, 1, 1, 1, 1, 1,
-0.8048912, -0.3055125, -1.560415, 0, 0, 1, 1, 1,
-0.8007514, 1.439416, 0.07289345, 1, 0, 0, 1, 1,
-0.7979361, -0.003874921, -0.6164743, 1, 0, 0, 1, 1,
-0.7854844, -0.3843714, -1.745819, 1, 0, 0, 1, 1,
-0.77961, 1.074579, -1.624535, 1, 0, 0, 1, 1,
-0.778879, 1.33591, -1.450911, 1, 0, 0, 1, 1,
-0.7751763, -1.193568, -3.340654, 0, 0, 0, 1, 1,
-0.7717075, 0.09843071, -0.3160427, 0, 0, 0, 1, 1,
-0.7676301, -0.5190998, -1.77847, 0, 0, 0, 1, 1,
-0.764104, 0.6364981, 0.3278002, 0, 0, 0, 1, 1,
-0.7521156, -0.6473019, -2.640337, 0, 0, 0, 1, 1,
-0.7505527, 0.2697596, 0.868374, 0, 0, 0, 1, 1,
-0.7494276, 0.7667339, 0.9261845, 0, 0, 0, 1, 1,
-0.7482907, -0.59775, -2.925278, 1, 1, 1, 1, 1,
-0.7481456, -0.336264, -5.179456, 1, 1, 1, 1, 1,
-0.7466797, -1.227454, -2.189653, 1, 1, 1, 1, 1,
-0.7408644, 0.5571148, 0.06723252, 1, 1, 1, 1, 1,
-0.7382436, 0.4380511, -2.815637, 1, 1, 1, 1, 1,
-0.7365249, -0.1381821, -2.526411, 1, 1, 1, 1, 1,
-0.7346193, 0.8145266, 0.3092944, 1, 1, 1, 1, 1,
-0.7319003, -0.08712, -2.584474, 1, 1, 1, 1, 1,
-0.7297812, 0.4415213, -1.113382, 1, 1, 1, 1, 1,
-0.7295979, -1.831922, -3.797386, 1, 1, 1, 1, 1,
-0.7285953, -1.721391, -3.837521, 1, 1, 1, 1, 1,
-0.7280605, -1.82041, -4.353937, 1, 1, 1, 1, 1,
-0.7186355, 0.4946858, -3.719866, 1, 1, 1, 1, 1,
-0.7134848, 0.6337405, -2.164862, 1, 1, 1, 1, 1,
-0.7110193, -1.223103, -2.164878, 1, 1, 1, 1, 1,
-0.7105601, -1.215838, -1.325992, 0, 0, 1, 1, 1,
-0.7074104, 0.06496411, -0.5781348, 1, 0, 0, 1, 1,
-0.7032986, 0.3463072, 0.01619158, 1, 0, 0, 1, 1,
-0.6979261, -0.005935903, -1.331591, 1, 0, 0, 1, 1,
-0.6933375, -0.8154063, -2.140124, 1, 0, 0, 1, 1,
-0.6916319, 0.5886826, -2.762497, 1, 0, 0, 1, 1,
-0.6862767, -1.229125, -3.07504, 0, 0, 0, 1, 1,
-0.6845197, 0.7786676, -1.155629, 0, 0, 0, 1, 1,
-0.6804282, 0.8618903, -0.8543566, 0, 0, 0, 1, 1,
-0.668086, -0.3961546, -4.264749, 0, 0, 0, 1, 1,
-0.6646402, 0.07999372, -1.024136, 0, 0, 0, 1, 1,
-0.6641297, -0.035596, -3.376805, 0, 0, 0, 1, 1,
-0.661887, 1.616756, -0.5152984, 0, 0, 0, 1, 1,
-0.6597714, 1.18502, -0.951271, 1, 1, 1, 1, 1,
-0.6571958, -1.145204, -5.159136, 1, 1, 1, 1, 1,
-0.6529067, 0.27468, -0.6027238, 1, 1, 1, 1, 1,
-0.6490229, -0.7668653, -3.282289, 1, 1, 1, 1, 1,
-0.6454196, 0.01928337, -1.323679, 1, 1, 1, 1, 1,
-0.6444827, 0.2152404, -2.245367, 1, 1, 1, 1, 1,
-0.6390698, 0.4657459, -1.247544, 1, 1, 1, 1, 1,
-0.6378842, -1.072939, -4.720275, 1, 1, 1, 1, 1,
-0.6352426, 0.2331015, -2.013128, 1, 1, 1, 1, 1,
-0.6351604, -0.5669575, -2.406199, 1, 1, 1, 1, 1,
-0.6339468, 0.02634983, -2.283375, 1, 1, 1, 1, 1,
-0.6305054, -0.5239969, -0.4585213, 1, 1, 1, 1, 1,
-0.6272133, 1.163729, -0.8313612, 1, 1, 1, 1, 1,
-0.6244962, -0.5251067, -3.161629, 1, 1, 1, 1, 1,
-0.6244798, 0.6179588, 0.8063728, 1, 1, 1, 1, 1,
-0.6242572, 1.150558, 0.8720639, 0, 0, 1, 1, 1,
-0.623442, -0.1938401, -2.567949, 1, 0, 0, 1, 1,
-0.6165323, -0.04956746, -1.269125, 1, 0, 0, 1, 1,
-0.6157004, -0.8254816, -2.695966, 1, 0, 0, 1, 1,
-0.6151267, -0.1436319, -2.320819, 1, 0, 0, 1, 1,
-0.6066879, -0.638846, -1.884685, 1, 0, 0, 1, 1,
-0.6055879, 0.3588144, 1.20918, 0, 0, 0, 1, 1,
-0.6031992, 0.6190408, -2.068666, 0, 0, 0, 1, 1,
-0.5981796, 0.539332, -2.149323, 0, 0, 0, 1, 1,
-0.5940155, 0.5361634, -1.510834, 0, 0, 0, 1, 1,
-0.5857249, -1.351209, -3.943399, 0, 0, 0, 1, 1,
-0.5850279, 1.155755, -1.530847, 0, 0, 0, 1, 1,
-0.5836812, 1.524248, -1.503838, 0, 0, 0, 1, 1,
-0.5784876, 0.6146964, -0.9257765, 1, 1, 1, 1, 1,
-0.5738513, -0.2124707, -0.6089315, 1, 1, 1, 1, 1,
-0.572689, 0.6309456, -1.132097, 1, 1, 1, 1, 1,
-0.5725972, -0.2063803, -1.575362, 1, 1, 1, 1, 1,
-0.5723848, 1.120188, -0.0744118, 1, 1, 1, 1, 1,
-0.5542156, 0.5881175, -0.4746948, 1, 1, 1, 1, 1,
-0.5516092, -0.1566981, -0.5743992, 1, 1, 1, 1, 1,
-0.5414523, 0.07925592, -0.5319377, 1, 1, 1, 1, 1,
-0.5396195, 1.022242, -0.4019913, 1, 1, 1, 1, 1,
-0.532962, 0.5440611, -2.087182, 1, 1, 1, 1, 1,
-0.5310513, 0.9363915, -0.385776, 1, 1, 1, 1, 1,
-0.5293786, -0.0035525, -0.2468893, 1, 1, 1, 1, 1,
-0.5260783, 0.3832534, -1.243679, 1, 1, 1, 1, 1,
-0.524702, -0.01480758, -0.9702, 1, 1, 1, 1, 1,
-0.523605, -0.5781727, -1.391259, 1, 1, 1, 1, 1,
-0.5200369, 0.1209072, -1.555553, 0, 0, 1, 1, 1,
-0.5187474, 0.2376484, -1.213162, 1, 0, 0, 1, 1,
-0.5180438, 0.6830682, -0.2591727, 1, 0, 0, 1, 1,
-0.5170239, -0.6097104, -2.08006, 1, 0, 0, 1, 1,
-0.5158542, 0.2053077, -0.143595, 1, 0, 0, 1, 1,
-0.5139527, -1.80615, -2.460939, 1, 0, 0, 1, 1,
-0.513932, -0.3900909, -1.291143, 0, 0, 0, 1, 1,
-0.5121434, -0.1401672, -1.770851, 0, 0, 0, 1, 1,
-0.5083134, 0.6183552, -2.27422, 0, 0, 0, 1, 1,
-0.5079936, 1.514969, 0.09104207, 0, 0, 0, 1, 1,
-0.5022561, 1.321972, 0.9905436, 0, 0, 0, 1, 1,
-0.5013882, -0.2929624, -3.99992, 0, 0, 0, 1, 1,
-0.4963519, -0.2425617, -1.93299, 0, 0, 0, 1, 1,
-0.4948325, -0.3004282, -3.066515, 1, 1, 1, 1, 1,
-0.493321, 1.029456, -1.051794, 1, 1, 1, 1, 1,
-0.4917397, -1.521617, -2.868186, 1, 1, 1, 1, 1,
-0.4915818, 0.5756046, -0.07498173, 1, 1, 1, 1, 1,
-0.4893847, -0.5968381, -2.012088, 1, 1, 1, 1, 1,
-0.4888757, -1.891737, -3.296603, 1, 1, 1, 1, 1,
-0.4887585, -2.712595, -2.449288, 1, 1, 1, 1, 1,
-0.4878663, 0.8187434, -2.448075, 1, 1, 1, 1, 1,
-0.4862849, 0.9081916, -0.4564126, 1, 1, 1, 1, 1,
-0.4838271, -0.6865272, -2.594737, 1, 1, 1, 1, 1,
-0.4835017, -0.01301375, -1.33728, 1, 1, 1, 1, 1,
-0.4832093, 2.045555, -0.603462, 1, 1, 1, 1, 1,
-0.4782878, -0.7786785, -4.156667, 1, 1, 1, 1, 1,
-0.4752126, -0.2013395, 0.7304597, 1, 1, 1, 1, 1,
-0.46735, 2.365642, 0.4096042, 1, 1, 1, 1, 1,
-0.465334, -2.927948, -1.703973, 0, 0, 1, 1, 1,
-0.4641942, 0.3136918, -0.5273048, 1, 0, 0, 1, 1,
-0.4635169, 1.54305, -0.006720686, 1, 0, 0, 1, 1,
-0.4629696, 0.2155321, -1.533655, 1, 0, 0, 1, 1,
-0.462873, 0.1880901, -1.995216, 1, 0, 0, 1, 1,
-0.4627662, 0.7769166, 0.1730044, 1, 0, 0, 1, 1,
-0.4608043, -0.03665733, -2.737209, 0, 0, 0, 1, 1,
-0.4586765, 0.4869615, -1.001002, 0, 0, 0, 1, 1,
-0.4548385, -0.5836757, -4.208287, 0, 0, 0, 1, 1,
-0.4537941, -1.06162, -3.517827, 0, 0, 0, 1, 1,
-0.4491822, -1.724635, -3.937524, 0, 0, 0, 1, 1,
-0.448488, 0.2807544, -1.317967, 0, 0, 0, 1, 1,
-0.4467028, 1.704378, -1.174919, 0, 0, 0, 1, 1,
-0.445794, 1.336453, 0.2952994, 1, 1, 1, 1, 1,
-0.4435963, 0.8633857, -0.9961004, 1, 1, 1, 1, 1,
-0.4404077, -0.66561, -0.326709, 1, 1, 1, 1, 1,
-0.4382006, 0.1462747, -0.6316012, 1, 1, 1, 1, 1,
-0.4377967, -2.25554, -0.9394652, 1, 1, 1, 1, 1,
-0.4367295, -1.243653, -2.749075, 1, 1, 1, 1, 1,
-0.4325292, -0.01866211, -0.7941194, 1, 1, 1, 1, 1,
-0.4304929, 1.52291, -1.011569, 1, 1, 1, 1, 1,
-0.4302657, 0.4871792, -1.098315, 1, 1, 1, 1, 1,
-0.4237855, -0.7301023, -3.300546, 1, 1, 1, 1, 1,
-0.4172536, -0.5879508, -2.896869, 1, 1, 1, 1, 1,
-0.4161652, -1.797987, -3.0574, 1, 1, 1, 1, 1,
-0.4144483, 0.0608217, -2.460685, 1, 1, 1, 1, 1,
-0.4127524, -1.041753, -4.998451, 1, 1, 1, 1, 1,
-0.4122484, -0.8161137, -0.9495074, 1, 1, 1, 1, 1,
-0.4119178, 1.496929, -0.5211296, 0, 0, 1, 1, 1,
-0.4102748, -1.296028, -1.358042, 1, 0, 0, 1, 1,
-0.4040337, -0.1528728, 0.6364326, 1, 0, 0, 1, 1,
-0.3957837, 0.2747386, -1.977479, 1, 0, 0, 1, 1,
-0.3944449, 0.207368, -0.9640345, 1, 0, 0, 1, 1,
-0.3883041, -0.08277101, -2.29475, 1, 0, 0, 1, 1,
-0.3862508, -0.9164713, -3.411389, 0, 0, 0, 1, 1,
-0.3846371, -1.684666, -2.262748, 0, 0, 0, 1, 1,
-0.3820621, 0.7157572, 0.2863219, 0, 0, 0, 1, 1,
-0.380899, 0.5688769, 1.408545, 0, 0, 0, 1, 1,
-0.3783513, -0.4787603, -0.6416516, 0, 0, 0, 1, 1,
-0.3780356, -0.06078919, -2.200547, 0, 0, 0, 1, 1,
-0.3776341, -0.2857158, -2.348244, 0, 0, 0, 1, 1,
-0.3759901, 0.9208662, 0.528566, 1, 1, 1, 1, 1,
-0.3758307, -1.159111, -2.079193, 1, 1, 1, 1, 1,
-0.3755047, 0.701811, -0.9782484, 1, 1, 1, 1, 1,
-0.3729163, 0.4394431, -1.860717, 1, 1, 1, 1, 1,
-0.372093, -1.015625, -3.132465, 1, 1, 1, 1, 1,
-0.3687774, 1.540671, -0.7174143, 1, 1, 1, 1, 1,
-0.3680506, -2.19073, -2.49165, 1, 1, 1, 1, 1,
-0.3670476, 0.08515634, -1.520002, 1, 1, 1, 1, 1,
-0.3669572, -0.02247153, -2.121382, 1, 1, 1, 1, 1,
-0.3663759, -1.027373, -2.122834, 1, 1, 1, 1, 1,
-0.3644755, -0.1519971, -2.035571, 1, 1, 1, 1, 1,
-0.3641415, -0.3477912, -3.557855, 1, 1, 1, 1, 1,
-0.3626238, 1.204303, 0.7082558, 1, 1, 1, 1, 1,
-0.3618048, 0.9886998, -0.4559243, 1, 1, 1, 1, 1,
-0.360352, 0.1453144, -0.7095953, 1, 1, 1, 1, 1,
-0.3519135, -0.6032009, -2.447894, 0, 0, 1, 1, 1,
-0.3512764, 0.2305345, -1.294892, 1, 0, 0, 1, 1,
-0.3463201, 0.07039479, -2.112835, 1, 0, 0, 1, 1,
-0.3445357, 1.202069, -0.4950942, 1, 0, 0, 1, 1,
-0.3401126, 0.03858179, -1.267338, 1, 0, 0, 1, 1,
-0.3367398, 0.2369405, -0.8710057, 1, 0, 0, 1, 1,
-0.3366096, -0.653801, -3.011164, 0, 0, 0, 1, 1,
-0.3304732, -0.3167046, -2.689035, 0, 0, 0, 1, 1,
-0.3280182, 0.4214777, -1.504438, 0, 0, 0, 1, 1,
-0.3279939, 0.6415435, -1.49496, 0, 0, 0, 1, 1,
-0.3207836, 0.6710877, -0.03502394, 0, 0, 0, 1, 1,
-0.3206562, -0.5827441, -3.511308, 0, 0, 0, 1, 1,
-0.317619, 1.077289, -0.09503176, 0, 0, 0, 1, 1,
-0.3174928, 0.5703826, -0.7245181, 1, 1, 1, 1, 1,
-0.3159771, -0.5227433, -3.174407, 1, 1, 1, 1, 1,
-0.31547, 1.52595, -0.9595088, 1, 1, 1, 1, 1,
-0.3140478, 1.119052, -0.840028, 1, 1, 1, 1, 1,
-0.3132041, 0.09768691, -1.631522, 1, 1, 1, 1, 1,
-0.3120729, 0.1389069, -0.6893032, 1, 1, 1, 1, 1,
-0.3075267, 1.321823, -0.03782592, 1, 1, 1, 1, 1,
-0.3066823, -1.288785, -2.695963, 1, 1, 1, 1, 1,
-0.3065006, -0.2483914, -2.168379, 1, 1, 1, 1, 1,
-0.3056399, -0.8912726, -3.147643, 1, 1, 1, 1, 1,
-0.3047676, 0.4932929, 0.9504486, 1, 1, 1, 1, 1,
-0.3015943, -0.446655, -2.891837, 1, 1, 1, 1, 1,
-0.2914464, 1.775097, 1.244736, 1, 1, 1, 1, 1,
-0.2885204, -0.4808212, -2.409943, 1, 1, 1, 1, 1,
-0.287545, 0.1490456, 0.220087, 1, 1, 1, 1, 1,
-0.2839727, -1.977939, -2.366359, 0, 0, 1, 1, 1,
-0.2715403, -0.2183897, -2.061601, 1, 0, 0, 1, 1,
-0.2710161, 0.3977003, -1.030321, 1, 0, 0, 1, 1,
-0.2656879, -0.5503539, -1.997787, 1, 0, 0, 1, 1,
-0.265532, 0.18044, -0.7805806, 1, 0, 0, 1, 1,
-0.2650799, -0.09750428, -2.486249, 1, 0, 0, 1, 1,
-0.2520579, 0.5050795, -1.321028, 0, 0, 0, 1, 1,
-0.2472816, 0.7534837, -1.200357, 0, 0, 0, 1, 1,
-0.2469818, -0.9491441, -3.102513, 0, 0, 0, 1, 1,
-0.2363285, 0.5697582, 1.151299, 0, 0, 0, 1, 1,
-0.2328503, 0.6518677, -1.57694, 0, 0, 0, 1, 1,
-0.2325853, -0.5391252, -1.756114, 0, 0, 0, 1, 1,
-0.2226565, 0.06022496, -0.5482005, 0, 0, 0, 1, 1,
-0.216448, 0.9395379, -0.3834328, 1, 1, 1, 1, 1,
-0.2164389, 0.7450855, -0.3569633, 1, 1, 1, 1, 1,
-0.2146378, 1.627735, 0.09213307, 1, 1, 1, 1, 1,
-0.2128652, -0.7688863, -2.696157, 1, 1, 1, 1, 1,
-0.2115351, 0.009544778, -2.141036, 1, 1, 1, 1, 1,
-0.2067609, 0.1380314, -0.01096683, 1, 1, 1, 1, 1,
-0.2050879, 0.321945, 0.08794991, 1, 1, 1, 1, 1,
-0.1965601, 0.9788699, -1.323261, 1, 1, 1, 1, 1,
-0.1957202, -2.14208, -4.977484, 1, 1, 1, 1, 1,
-0.1764614, 0.2044481, 0.9114572, 1, 1, 1, 1, 1,
-0.1762796, -1.592392, -2.468532, 1, 1, 1, 1, 1,
-0.1743853, 1.334563, 0.4600798, 1, 1, 1, 1, 1,
-0.1738221, 0.2848728, -0.999642, 1, 1, 1, 1, 1,
-0.1732582, 0.3826747, -1.121741, 1, 1, 1, 1, 1,
-0.163275, -0.5256925, -1.778485, 1, 1, 1, 1, 1,
-0.1592537, 0.5876954, -1.78753, 0, 0, 1, 1, 1,
-0.1561965, -2.206623, -1.737727, 1, 0, 0, 1, 1,
-0.153613, 0.6630329, 0.8213547, 1, 0, 0, 1, 1,
-0.1483443, 0.3999564, -1.194703, 1, 0, 0, 1, 1,
-0.1482661, 0.4613013, 1.171501, 1, 0, 0, 1, 1,
-0.1442652, -0.6738923, -3.930063, 1, 0, 0, 1, 1,
-0.1433426, 0.03137437, -3.088055, 0, 0, 0, 1, 1,
-0.1393746, -0.8134139, -1.488278, 0, 0, 0, 1, 1,
-0.1393521, 1.211465, -0.8495406, 0, 0, 0, 1, 1,
-0.1387463, -0.1056628, -0.1605551, 0, 0, 0, 1, 1,
-0.1385434, 1.798026, -1.145436, 0, 0, 0, 1, 1,
-0.137846, -0.9118701, -2.817252, 0, 0, 0, 1, 1,
-0.1355276, -1.696863, -4.64114, 0, 0, 0, 1, 1,
-0.1322986, -0.8758731, -1.457313, 1, 1, 1, 1, 1,
-0.1317418, 0.5357845, -0.9737418, 1, 1, 1, 1, 1,
-0.1316395, 0.9978548, 2.193484, 1, 1, 1, 1, 1,
-0.1299642, -1.776971, -3.18709, 1, 1, 1, 1, 1,
-0.1299403, -0.7058586, -3.126493, 1, 1, 1, 1, 1,
-0.1287273, 0.8221232, -0.5599519, 1, 1, 1, 1, 1,
-0.1258944, 1.821045, -0.3405466, 1, 1, 1, 1, 1,
-0.1248225, 0.6557531, -1.67507, 1, 1, 1, 1, 1,
-0.1247303, -1.039509, -4.103945, 1, 1, 1, 1, 1,
-0.1219204, -0.5997734, -1.406015, 1, 1, 1, 1, 1,
-0.117681, 1.106579, -2.43948, 1, 1, 1, 1, 1,
-0.1122221, 0.4710703, 1.100177, 1, 1, 1, 1, 1,
-0.1096203, -0.6468471, -3.501626, 1, 1, 1, 1, 1,
-0.1049328, 1.523965, -2.280778, 1, 1, 1, 1, 1,
-0.1048696, -0.2941139, -2.506825, 1, 1, 1, 1, 1,
-0.104368, 0.1782033, -2.590709, 0, 0, 1, 1, 1,
-0.1033624, 1.710782, 1.92854, 1, 0, 0, 1, 1,
-0.103018, 1.087439, -0.7089196, 1, 0, 0, 1, 1,
-0.1025234, 1.41243, -0.4509527, 1, 0, 0, 1, 1,
-0.1017548, -1.118322, -3.506277, 1, 0, 0, 1, 1,
-0.09760093, -0.07349782, -1.882488, 1, 0, 0, 1, 1,
-0.09586293, 0.2114504, 0.3980026, 0, 0, 0, 1, 1,
-0.09456358, 1.776272, -0.1708076, 0, 0, 0, 1, 1,
-0.09168011, -0.2990161, -3.861032, 0, 0, 0, 1, 1,
-0.08351076, -0.9391123, -3.961618, 0, 0, 0, 1, 1,
-0.07617848, 0.4414636, 0.5228797, 0, 0, 0, 1, 1,
-0.07615678, -0.183576, -2.999186, 0, 0, 0, 1, 1,
-0.07607691, 1.928805, 0.2603354, 0, 0, 0, 1, 1,
-0.07595923, 0.6550562, -1.939045, 1, 1, 1, 1, 1,
-0.07559903, -0.07822393, -1.815879, 1, 1, 1, 1, 1,
-0.07424323, 0.6629922, 2.438278, 1, 1, 1, 1, 1,
-0.07415659, 0.5665433, -1.171834, 1, 1, 1, 1, 1,
-0.07374618, 1.437865, 1.836164, 1, 1, 1, 1, 1,
-0.06532308, -1.152372, -3.773995, 1, 1, 1, 1, 1,
-0.06471265, -0.8232284, -2.36502, 1, 1, 1, 1, 1,
-0.0588905, 0.1370914, -0.03421048, 1, 1, 1, 1, 1,
-0.05700162, 0.02182687, -0.4869518, 1, 1, 1, 1, 1,
-0.05061195, -1.191889, -2.620099, 1, 1, 1, 1, 1,
-0.04814439, 1.996532, -0.8973327, 1, 1, 1, 1, 1,
-0.04418658, -1.138712, -4.801382, 1, 1, 1, 1, 1,
-0.04129971, -0.8040282, -2.127137, 1, 1, 1, 1, 1,
-0.04005645, 0.8780594, -1.917207, 1, 1, 1, 1, 1,
-0.04004664, 1.677159, -2.032535, 1, 1, 1, 1, 1,
-0.03253152, 0.09660917, -0.2156654, 0, 0, 1, 1, 1,
-0.03251075, 1.24316, 0.7850326, 1, 0, 0, 1, 1,
-0.031266, 0.2191226, 0.1219675, 1, 0, 0, 1, 1,
-0.03060737, 1.407535, -0.7156006, 1, 0, 0, 1, 1,
-0.0277422, 0.8248166, -0.05067326, 1, 0, 0, 1, 1,
-0.02388295, 1.298251, -0.3183588, 1, 0, 0, 1, 1,
-0.02195637, 1.193007, -0.6895534, 0, 0, 0, 1, 1,
-0.0210358, 0.3542262, -0.8199757, 0, 0, 0, 1, 1,
-0.01620517, -0.2266271, -3.345995, 0, 0, 0, 1, 1,
-0.00856554, 0.4636982, -0.2366273, 0, 0, 0, 1, 1,
-0.00736686, 0.5462596, -0.4720625, 0, 0, 0, 1, 1,
-0.003458689, -0.3160433, -4.617627, 0, 0, 0, 1, 1,
-0.002685406, -0.4425308, -4.285215, 0, 0, 0, 1, 1,
-0.001722453, -1.337957, -4.123629, 1, 1, 1, 1, 1,
-0.001013625, -0.7828041, -2.444405, 1, 1, 1, 1, 1,
0.003249804, 0.4224501, 1.188393, 1, 1, 1, 1, 1,
0.005654621, 0.08432326, 0.01339114, 1, 1, 1, 1, 1,
0.007846246, 0.1092739, -0.9670908, 1, 1, 1, 1, 1,
0.008092109, 0.6479351, 1.559486, 1, 1, 1, 1, 1,
0.00922931, -0.6898633, 2.759943, 1, 1, 1, 1, 1,
0.009293422, 0.007443882, -0.05199892, 1, 1, 1, 1, 1,
0.009942766, 1.590031, -1.039964, 1, 1, 1, 1, 1,
0.01099292, -0.8024926, 5.758446, 1, 1, 1, 1, 1,
0.01263637, -1.279301, 3.330439, 1, 1, 1, 1, 1,
0.0141965, -0.5905592, 3.383041, 1, 1, 1, 1, 1,
0.01909186, 0.7174078, 1.168504, 1, 1, 1, 1, 1,
0.02208173, -0.339543, 0.4396685, 1, 1, 1, 1, 1,
0.02389753, 1.05471, -0.007296663, 1, 1, 1, 1, 1,
0.02472968, 0.337824, 1.652908, 0, 0, 1, 1, 1,
0.0256182, -2.189879, 4.38058, 1, 0, 0, 1, 1,
0.02948624, -0.2860466, 1.865085, 1, 0, 0, 1, 1,
0.03695569, 1.184281, 1.119105, 1, 0, 0, 1, 1,
0.03981796, -0.4892985, 3.389679, 1, 0, 0, 1, 1,
0.04338465, -1.3779, 1.77693, 1, 0, 0, 1, 1,
0.04673488, -0.08973226, 3.370528, 0, 0, 0, 1, 1,
0.0572174, -1.064712, 3.434773, 0, 0, 0, 1, 1,
0.06002042, 0.3472061, -1.041899, 0, 0, 0, 1, 1,
0.06130122, -1.664888, 2.223832, 0, 0, 0, 1, 1,
0.0634103, -1.236285, 3.487659, 0, 0, 0, 1, 1,
0.06712049, 1.216548, 0.680581, 0, 0, 0, 1, 1,
0.06907417, 1.066665, 0.2021045, 0, 0, 0, 1, 1,
0.06957605, -2.096123, 2.498293, 1, 1, 1, 1, 1,
0.07161879, 0.2974113, 0.6607675, 1, 1, 1, 1, 1,
0.07294183, 0.5252513, 1.369675, 1, 1, 1, 1, 1,
0.07346197, 0.567414, -0.05054224, 1, 1, 1, 1, 1,
0.07533254, -1.525336, 3.57565, 1, 1, 1, 1, 1,
0.07620537, 0.4517586, -0.1398289, 1, 1, 1, 1, 1,
0.07674048, 0.09276532, 0.4284839, 1, 1, 1, 1, 1,
0.07698365, -0.6082834, 4.648169, 1, 1, 1, 1, 1,
0.08907004, 0.3591243, -0.08106208, 1, 1, 1, 1, 1,
0.09844465, 0.3682706, -2.115158, 1, 1, 1, 1, 1,
0.09975378, 0.3034224, 0.2509035, 1, 1, 1, 1, 1,
0.1031982, -0.6598551, 4.404586, 1, 1, 1, 1, 1,
0.1086521, 0.9876546, 1.760951, 1, 1, 1, 1, 1,
0.1111711, -0.8002482, 2.999475, 1, 1, 1, 1, 1,
0.1150544, -0.9633202, 1.92904, 1, 1, 1, 1, 1,
0.1217213, -0.01650479, 0.9087305, 0, 0, 1, 1, 1,
0.1267132, 2.890836, -0.4761703, 1, 0, 0, 1, 1,
0.1273723, -1.035078, 2.93048, 1, 0, 0, 1, 1,
0.1305312, 0.8946292, -0.0250612, 1, 0, 0, 1, 1,
0.1322689, -0.1384495, 0.1586605, 1, 0, 0, 1, 1,
0.1352065, -0.8190454, 2.782227, 1, 0, 0, 1, 1,
0.1353993, 0.5512881, -0.6250721, 0, 0, 0, 1, 1,
0.1361876, -0.4596962, 3.278962, 0, 0, 0, 1, 1,
0.1396931, 0.1529822, -0.02232786, 0, 0, 0, 1, 1,
0.1488994, -0.6801339, 2.651322, 0, 0, 0, 1, 1,
0.1519334, 0.925591, -0.4011947, 0, 0, 0, 1, 1,
0.1526871, 0.9623948, -0.4322363, 0, 0, 0, 1, 1,
0.1572774, 0.4888268, -0.432344, 0, 0, 0, 1, 1,
0.157293, -0.7157753, 2.56163, 1, 1, 1, 1, 1,
0.1584426, -0.7644978, 3.29468, 1, 1, 1, 1, 1,
0.1632649, -0.3959531, 4.244711, 1, 1, 1, 1, 1,
0.1636322, -0.04772925, 3.062649, 1, 1, 1, 1, 1,
0.1659878, -1.179998, 3.267095, 1, 1, 1, 1, 1,
0.1676612, -1.704672, 0.9144256, 1, 1, 1, 1, 1,
0.1686412, -0.2821599, 2.012377, 1, 1, 1, 1, 1,
0.1696562, 0.4006859, 0.2034316, 1, 1, 1, 1, 1,
0.1727783, 0.5975668, -0.2988106, 1, 1, 1, 1, 1,
0.1776833, 0.0686043, 0.05866227, 1, 1, 1, 1, 1,
0.1778595, -0.7515, 3.862387, 1, 1, 1, 1, 1,
0.1798221, -0.5581614, 3.568796, 1, 1, 1, 1, 1,
0.1820176, -0.0577203, 1.606463, 1, 1, 1, 1, 1,
0.187556, -0.07433218, 1.812496, 1, 1, 1, 1, 1,
0.187714, 0.04335375, 2.320431, 1, 1, 1, 1, 1,
0.1962513, -0.04349294, 2.036695, 0, 0, 1, 1, 1,
0.1966721, -2.006011, 2.439181, 1, 0, 0, 1, 1,
0.1978434, 1.155988, 1.331556, 1, 0, 0, 1, 1,
0.1989422, -0.09123311, -0.03736325, 1, 0, 0, 1, 1,
0.2029204, 0.1080983, 0.3233995, 1, 0, 0, 1, 1,
0.2049709, 1.186339, 3.186769, 1, 0, 0, 1, 1,
0.2069232, 0.2777838, -0.5454096, 0, 0, 0, 1, 1,
0.2074018, 0.5201895, 0.008624857, 0, 0, 0, 1, 1,
0.2079302, -1.232913, 5.309054, 0, 0, 0, 1, 1,
0.208661, 0.7292092, -2.10859, 0, 0, 0, 1, 1,
0.2093817, 1.022662, 1.026626, 0, 0, 0, 1, 1,
0.2112395, 0.2910232, 0.8011498, 0, 0, 0, 1, 1,
0.2179392, -0.3740725, 1.730368, 0, 0, 0, 1, 1,
0.2204554, -0.05329946, 1.903093, 1, 1, 1, 1, 1,
0.2215648, -0.5183083, 0.9561999, 1, 1, 1, 1, 1,
0.2218863, -0.6816014, 2.456297, 1, 1, 1, 1, 1,
0.2222703, -2.806196, 2.474399, 1, 1, 1, 1, 1,
0.228092, 1.087835, 1.995991, 1, 1, 1, 1, 1,
0.2306026, -1.306935, 4.064548, 1, 1, 1, 1, 1,
0.2307488, 0.3895694, 1.299887, 1, 1, 1, 1, 1,
0.232498, 1.094934, 2.980718, 1, 1, 1, 1, 1,
0.2327003, 1.723184, 0.1739966, 1, 1, 1, 1, 1,
0.2357826, -1.673993, 1.193488, 1, 1, 1, 1, 1,
0.2480618, 0.8669149, 0.5478866, 1, 1, 1, 1, 1,
0.2508647, -0.4432992, 2.992861, 1, 1, 1, 1, 1,
0.2514264, -0.1556433, 3.714828, 1, 1, 1, 1, 1,
0.2546837, -0.4725013, 4.813789, 1, 1, 1, 1, 1,
0.258325, -0.9820271, 2.19693, 1, 1, 1, 1, 1,
0.2598297, -0.4820536, 1.747771, 0, 0, 1, 1, 1,
0.2602579, 0.1848399, 1.761131, 1, 0, 0, 1, 1,
0.2722741, -0.6919866, 1.981377, 1, 0, 0, 1, 1,
0.2741389, -1.706812, 1.678276, 1, 0, 0, 1, 1,
0.2742833, 1.225768, 0.1431008, 1, 0, 0, 1, 1,
0.2762968, -0.9256961, 3.463248, 1, 0, 0, 1, 1,
0.2771135, 0.2083832, 0.3542188, 0, 0, 0, 1, 1,
0.2771162, -0.5919198, 3.820929, 0, 0, 0, 1, 1,
0.2777102, 1.4194, 1.665093, 0, 0, 0, 1, 1,
0.2811011, -0.3464235, 1.688801, 0, 0, 0, 1, 1,
0.2818389, 1.019534, 1.145954, 0, 0, 0, 1, 1,
0.2821434, 0.7910332, 0.1978381, 0, 0, 0, 1, 1,
0.2846991, 2.126046, -0.02827026, 0, 0, 0, 1, 1,
0.2858442, 0.4392764, -0.08118054, 1, 1, 1, 1, 1,
0.286119, -1.710389, 3.4956, 1, 1, 1, 1, 1,
0.2881082, 0.155089, 1.719945, 1, 1, 1, 1, 1,
0.294356, 0.3828431, -0.2030331, 1, 1, 1, 1, 1,
0.2959134, 0.1849494, 3.741327, 1, 1, 1, 1, 1,
0.3018712, 0.3523264, 1.305224, 1, 1, 1, 1, 1,
0.3024675, -0.4371644, 3.199383, 1, 1, 1, 1, 1,
0.3120828, -0.683741, 2.63086, 1, 1, 1, 1, 1,
0.3137245, 0.8983713, -1.719825, 1, 1, 1, 1, 1,
0.3257697, -1.434199, 2.615434, 1, 1, 1, 1, 1,
0.3259322, 1.032899, 3.49842, 1, 1, 1, 1, 1,
0.3296135, 1.055201, 0.6314947, 1, 1, 1, 1, 1,
0.3304678, -0.8522632, 2.831629, 1, 1, 1, 1, 1,
0.3325947, -0.8354311, 0.8703924, 1, 1, 1, 1, 1,
0.3357282, -1.243641, 3.448361, 1, 1, 1, 1, 1,
0.3361369, 0.3082624, 2.753523, 0, 0, 1, 1, 1,
0.3363567, 2.773018, -0.3542593, 1, 0, 0, 1, 1,
0.3394051, 1.470623, 0.9332651, 1, 0, 0, 1, 1,
0.3394328, -0.3691093, 1.632484, 1, 0, 0, 1, 1,
0.3415865, -1.264051, 4.196676, 1, 0, 0, 1, 1,
0.3432602, -1.387389, 1.622106, 1, 0, 0, 1, 1,
0.3443401, -0.6568438, 1.300576, 0, 0, 0, 1, 1,
0.3449249, -1.232366, 2.847961, 0, 0, 0, 1, 1,
0.3455118, -0.0803249, 2.750995, 0, 0, 0, 1, 1,
0.3466893, 1.518999, -1.678713, 0, 0, 0, 1, 1,
0.3469929, -0.7437794, 1.183683, 0, 0, 0, 1, 1,
0.3480057, 2.025259, 1.888578, 0, 0, 0, 1, 1,
0.3526745, -0.3281759, 2.121447, 0, 0, 0, 1, 1,
0.3547915, -0.7597179, 3.226086, 1, 1, 1, 1, 1,
0.3561209, -0.1015444, 2.033576, 1, 1, 1, 1, 1,
0.3623292, -0.2871695, 0.797398, 1, 1, 1, 1, 1,
0.3655218, 0.3814188, 1.335704, 1, 1, 1, 1, 1,
0.3679953, 0.1972968, 1.819427, 1, 1, 1, 1, 1,
0.3691657, 0.3153911, -0.3115432, 1, 1, 1, 1, 1,
0.3694839, -0.5356398, 1.109165, 1, 1, 1, 1, 1,
0.3696948, 1.525838, 3.335468, 1, 1, 1, 1, 1,
0.3723154, -0.7301326, 1.888907, 1, 1, 1, 1, 1,
0.3781466, -0.4741915, 3.95752, 1, 1, 1, 1, 1,
0.380125, 0.7739239, 0.5110818, 1, 1, 1, 1, 1,
0.3843896, -0.2612601, 2.499411, 1, 1, 1, 1, 1,
0.3856366, 1.763776, 0.1413399, 1, 1, 1, 1, 1,
0.3878978, 0.899604, 1.334938, 1, 1, 1, 1, 1,
0.3891811, -1.614097, 3.411206, 1, 1, 1, 1, 1,
0.3933459, -0.8057227, 2.072886, 0, 0, 1, 1, 1,
0.3940533, -0.5259785, 3.909332, 1, 0, 0, 1, 1,
0.3960399, -0.1329186, 2.739471, 1, 0, 0, 1, 1,
0.4010396, -0.4134171, 1.314223, 1, 0, 0, 1, 1,
0.4031953, -0.7669186, 2.451142, 1, 0, 0, 1, 1,
0.403919, 0.01668887, 2.33331, 1, 0, 0, 1, 1,
0.4043902, -0.2766201, 3.065916, 0, 0, 0, 1, 1,
0.4090622, 0.28074, 0.8700275, 0, 0, 0, 1, 1,
0.4127747, -2.442996, 3.659008, 0, 0, 0, 1, 1,
0.4185898, -1.096045, 3.362528, 0, 0, 0, 1, 1,
0.4206417, 0.3271061, 1.258188, 0, 0, 0, 1, 1,
0.4212816, 0.8265221, -0.3283542, 0, 0, 0, 1, 1,
0.4223485, -0.3241453, 1.410263, 0, 0, 0, 1, 1,
0.4237818, -1.165246, 3.128453, 1, 1, 1, 1, 1,
0.4265499, 1.059047, -0.6114032, 1, 1, 1, 1, 1,
0.4288502, -0.6094015, 1.73231, 1, 1, 1, 1, 1,
0.429726, 0.4936965, 0.7543834, 1, 1, 1, 1, 1,
0.4317942, 0.5262036, 1.720718, 1, 1, 1, 1, 1,
0.4324004, 1.147171, -0.02031876, 1, 1, 1, 1, 1,
0.4348981, -1.052741, 2.214215, 1, 1, 1, 1, 1,
0.443245, 0.7777063, 0.3772322, 1, 1, 1, 1, 1,
0.4464138, 0.2286611, 0.4238043, 1, 1, 1, 1, 1,
0.4470201, 0.5283268, -0.6831818, 1, 1, 1, 1, 1,
0.4505887, -2.960319, 1.948535, 1, 1, 1, 1, 1,
0.4511137, -0.03726941, -0.6398785, 1, 1, 1, 1, 1,
0.4525376, -1.511761, 2.745177, 1, 1, 1, 1, 1,
0.4547783, -2.493186, 4.10529, 1, 1, 1, 1, 1,
0.454958, -0.9907514, 3.593668, 1, 1, 1, 1, 1,
0.4557337, -0.1012726, 1.874551, 0, 0, 1, 1, 1,
0.4577549, 1.542364, -1.142353, 1, 0, 0, 1, 1,
0.4581369, 0.04080649, 2.147341, 1, 0, 0, 1, 1,
0.4594099, -0.05779446, 2.310286, 1, 0, 0, 1, 1,
0.4635555, 1.539781, -1.012509, 1, 0, 0, 1, 1,
0.4664159, -0.02174428, 2.227123, 1, 0, 0, 1, 1,
0.4707153, -0.214074, 2.009981, 0, 0, 0, 1, 1,
0.4710709, -1.414124, 3.776502, 0, 0, 0, 1, 1,
0.4725041, 0.05099134, 2.379066, 0, 0, 0, 1, 1,
0.4765949, -0.9489172, 3.072804, 0, 0, 0, 1, 1,
0.4769893, 1.307095, 1.011159, 0, 0, 0, 1, 1,
0.4869439, -0.1605778, 1.962428, 0, 0, 0, 1, 1,
0.4915253, 0.3179109, 2.688426, 0, 0, 0, 1, 1,
0.4941382, 0.5044204, 0.6284648, 1, 1, 1, 1, 1,
0.4951086, 0.06914984, 3.076846, 1, 1, 1, 1, 1,
0.4952783, 0.9573089, 0.1846879, 1, 1, 1, 1, 1,
0.4969887, -0.7936624, 2.699829, 1, 1, 1, 1, 1,
0.5042618, -1.399574, 2.334314, 1, 1, 1, 1, 1,
0.5055821, 1.495175, 1.794327, 1, 1, 1, 1, 1,
0.506068, -0.1913671, 2.1866, 1, 1, 1, 1, 1,
0.5074857, 1.36108, -0.2869762, 1, 1, 1, 1, 1,
0.5077703, 1.32321, 0.7908942, 1, 1, 1, 1, 1,
0.5084397, -0.3056149, 2.259771, 1, 1, 1, 1, 1,
0.5116303, 1.270239, 0.04331018, 1, 1, 1, 1, 1,
0.5153237, -1.031277, 2.155212, 1, 1, 1, 1, 1,
0.5162046, -0.1577642, 1.868993, 1, 1, 1, 1, 1,
0.5181122, -1.660018, 3.124632, 1, 1, 1, 1, 1,
0.5197036, 0.9270173, 0.9745287, 1, 1, 1, 1, 1,
0.520917, 0.119293, -0.306996, 0, 0, 1, 1, 1,
0.5225227, -0.2689047, 2.284835, 1, 0, 0, 1, 1,
0.5229383, 1.468691, 0.7877432, 1, 0, 0, 1, 1,
0.5307525, -0.6881524, 2.937556, 1, 0, 0, 1, 1,
0.5375341, -0.3237494, 1.662035, 1, 0, 0, 1, 1,
0.5397754, -0.6571944, 1.909332, 1, 0, 0, 1, 1,
0.5438632, 0.31312, 0.4415838, 0, 0, 0, 1, 1,
0.5459793, 0.3457224, 0.8931391, 0, 0, 0, 1, 1,
0.546778, 0.4544374, 1.00553, 0, 0, 0, 1, 1,
0.5499127, -0.08863739, 0.7902992, 0, 0, 0, 1, 1,
0.556289, 0.2747098, -0.1090129, 0, 0, 0, 1, 1,
0.5564851, 0.7525523, 1.966168, 0, 0, 0, 1, 1,
0.5582136, -0.03721703, 1.95923, 0, 0, 0, 1, 1,
0.5620298, -0.7766284, 3.36671, 1, 1, 1, 1, 1,
0.5621486, -1.159348, 3.544313, 1, 1, 1, 1, 1,
0.5637789, -0.2439034, 2.942762, 1, 1, 1, 1, 1,
0.5639588, 0.4561228, -0.7722104, 1, 1, 1, 1, 1,
0.5641672, -0.05210933, 0.1378895, 1, 1, 1, 1, 1,
0.5719457, 2.005084, 0.8278795, 1, 1, 1, 1, 1,
0.5735798, -0.07510957, 0.8478491, 1, 1, 1, 1, 1,
0.5749768, 0.3685187, 0.04190628, 1, 1, 1, 1, 1,
0.5779086, 0.5837865, 0.2582714, 1, 1, 1, 1, 1,
0.5810111, -0.2635236, 2.6878, 1, 1, 1, 1, 1,
0.5829164, 0.2624739, 1.737773, 1, 1, 1, 1, 1,
0.5851582, 0.2564163, -0.3550573, 1, 1, 1, 1, 1,
0.5895395, 0.2512075, 0.3141043, 1, 1, 1, 1, 1,
0.5897341, -0.8429352, 2.655618, 1, 1, 1, 1, 1,
0.599294, 0.5997097, 1.725868, 1, 1, 1, 1, 1,
0.6034494, 0.8205648, 0.696736, 0, 0, 1, 1, 1,
0.6058848, -1.076177, 1.547878, 1, 0, 0, 1, 1,
0.6060941, -0.3119008, 2.600689, 1, 0, 0, 1, 1,
0.6064928, -1.097054, 1.417257, 1, 0, 0, 1, 1,
0.6089139, 0.1164291, 1.776198, 1, 0, 0, 1, 1,
0.6100783, 1.208981, 2.14486, 1, 0, 0, 1, 1,
0.6157932, -0.1547004, 1.143156, 0, 0, 0, 1, 1,
0.6162871, -0.1526393, 0.8776813, 0, 0, 0, 1, 1,
0.6266527, -1.301236, 5.445947, 0, 0, 0, 1, 1,
0.6267452, -0.3890776, 0.4476873, 0, 0, 0, 1, 1,
0.6300582, 0.1918141, 2.029125, 0, 0, 0, 1, 1,
0.6424995, -0.7858123, 2.021236, 0, 0, 0, 1, 1,
0.6510515, -0.2275057, 1.371623, 0, 0, 0, 1, 1,
0.6543444, -0.9325032, 3.604083, 1, 1, 1, 1, 1,
0.657181, 0.0224148, 1.058423, 1, 1, 1, 1, 1,
0.65806, 2.421542, -1.875015, 1, 1, 1, 1, 1,
0.6588677, -0.09262843, -0.7998461, 1, 1, 1, 1, 1,
0.6591384, 0.1635321, 2.289804, 1, 1, 1, 1, 1,
0.6594033, -0.2436789, 2.428051, 1, 1, 1, 1, 1,
0.6605433, -0.3171816, 0.8043153, 1, 1, 1, 1, 1,
0.6644951, 1.070735, 1.832274, 1, 1, 1, 1, 1,
0.666165, -2.012122, 4.042735, 1, 1, 1, 1, 1,
0.666266, -0.8149646, 1.424083, 1, 1, 1, 1, 1,
0.6682823, -1.09841, 2.051126, 1, 1, 1, 1, 1,
0.6736074, 0.7109045, 1.426526, 1, 1, 1, 1, 1,
0.6754121, -0.6486735, 2.179199, 1, 1, 1, 1, 1,
0.67744, -0.4715689, 1.75746, 1, 1, 1, 1, 1,
0.6782237, -1.619759, 2.424472, 1, 1, 1, 1, 1,
0.6836045, 0.1218541, 0.6749181, 0, 0, 1, 1, 1,
0.6837398, 0.6259397, 0.9117942, 1, 0, 0, 1, 1,
0.6837866, -1.045746, 1.445515, 1, 0, 0, 1, 1,
0.6845886, 1.333829, 1.294464, 1, 0, 0, 1, 1,
0.6847343, 1.353005, 1.406433, 1, 0, 0, 1, 1,
0.6862537, -1.650628, 2.369207, 1, 0, 0, 1, 1,
0.6864842, 0.7433456, -0.4891764, 0, 0, 0, 1, 1,
0.6898291, -0.6383882, 3.864093, 0, 0, 0, 1, 1,
0.6948347, -0.23716, 1.811479, 0, 0, 0, 1, 1,
0.6980669, 0.6444999, 1.671771, 0, 0, 0, 1, 1,
0.7002308, -0.4943041, 1.419875, 0, 0, 0, 1, 1,
0.7003395, 0.4335652, 1.068367, 0, 0, 0, 1, 1,
0.7021944, 0.8414149, 0.5830014, 0, 0, 0, 1, 1,
0.7030086, 1.004643, 0.5486757, 1, 1, 1, 1, 1,
0.7086518, 0.5832809, 3.037565, 1, 1, 1, 1, 1,
0.7190135, 0.1895893, 2.096975, 1, 1, 1, 1, 1,
0.721001, 0.6251206, 1.800414, 1, 1, 1, 1, 1,
0.7300131, -1.095188, 3.050529, 1, 1, 1, 1, 1,
0.730528, -0.1015041, 1.886115, 1, 1, 1, 1, 1,
0.7406729, 2.083028, 0.5264934, 1, 1, 1, 1, 1,
0.7415633, 0.8500091, 0.2900744, 1, 1, 1, 1, 1,
0.7430924, -0.7589294, 2.551579, 1, 1, 1, 1, 1,
0.7442106, 1.028055, 0.951425, 1, 1, 1, 1, 1,
0.7521266, -0.8078355, 0.5971126, 1, 1, 1, 1, 1,
0.7539204, 0.4118911, 0.7877067, 1, 1, 1, 1, 1,
0.7559701, 1.109508, 1.404379, 1, 1, 1, 1, 1,
0.7582519, -0.8939376, 1.373096, 1, 1, 1, 1, 1,
0.758454, 1.319484, 0.6556857, 1, 1, 1, 1, 1,
0.759326, -1.526214, 2.552927, 0, 0, 1, 1, 1,
0.7690594, -0.8726944, 3.824169, 1, 0, 0, 1, 1,
0.7692087, 0.4074549, 2.052419, 1, 0, 0, 1, 1,
0.7699801, -0.7758306, 1.430902, 1, 0, 0, 1, 1,
0.7724667, -0.6716099, 2.634103, 1, 0, 0, 1, 1,
0.7775696, 0.6562481, 0.8804577, 1, 0, 0, 1, 1,
0.7811634, 0.2453099, 0.3415722, 0, 0, 0, 1, 1,
0.7842537, 0.465124, 1.315471, 0, 0, 0, 1, 1,
0.7849756, -0.7104816, 3.659675, 0, 0, 0, 1, 1,
0.7856653, -0.6259753, 1.545768, 0, 0, 0, 1, 1,
0.7871064, 0.5111436, -0.2558251, 0, 0, 0, 1, 1,
0.791584, -1.005383, 4.351923, 0, 0, 0, 1, 1,
0.7984526, -0.3360435, 1.684681, 0, 0, 0, 1, 1,
0.8008642, 0.6146665, 1.014944, 1, 1, 1, 1, 1,
0.8024617, -0.7750834, 1.015399, 1, 1, 1, 1, 1,
0.8149548, 1.350134, -0.52217, 1, 1, 1, 1, 1,
0.8181871, -0.3472427, 1.506392, 1, 1, 1, 1, 1,
0.8186991, -0.07096928, 1.143991, 1, 1, 1, 1, 1,
0.8226184, -0.1536996, 1.900641, 1, 1, 1, 1, 1,
0.8260566, -1.080625, 1.777174, 1, 1, 1, 1, 1,
0.8277009, 0.5587854, 0.8299906, 1, 1, 1, 1, 1,
0.8340386, 1.288708, 1.701441, 1, 1, 1, 1, 1,
0.8402874, 0.9344413, 0.4273809, 1, 1, 1, 1, 1,
0.8418497, -0.2843378, 2.717196, 1, 1, 1, 1, 1,
0.849916, -1.104326, 0.06090222, 1, 1, 1, 1, 1,
0.8528624, 0.2386698, 3.029713, 1, 1, 1, 1, 1,
0.8541325, 0.2599323, 0.7771909, 1, 1, 1, 1, 1,
0.8544719, 1.009817, 1.188175, 1, 1, 1, 1, 1,
0.8560404, 0.1117315, 0.2114241, 0, 0, 1, 1, 1,
0.8562554, -0.7796584, 0.2363425, 1, 0, 0, 1, 1,
0.8565289, -0.676419, 1.83933, 1, 0, 0, 1, 1,
0.8584937, -0.3055587, 2.84532, 1, 0, 0, 1, 1,
0.8591783, 0.05097486, 2.671948, 1, 0, 0, 1, 1,
0.8607211, 0.04877574, 0.9813189, 1, 0, 0, 1, 1,
0.8638523, 0.9283847, 1.279649, 0, 0, 0, 1, 1,
0.8662449, -1.240195, 1.715366, 0, 0, 0, 1, 1,
0.8685253, 0.8684886, 1.173383, 0, 0, 0, 1, 1,
0.87082, 1.312031, -0.7786326, 0, 0, 0, 1, 1,
0.8711343, 1.419657, 1.232996, 0, 0, 0, 1, 1,
0.8733365, -0.8346573, 0.9883118, 0, 0, 0, 1, 1,
0.878543, -0.004467803, 2.830438, 0, 0, 0, 1, 1,
0.8801727, 0.05286542, 3.525731, 1, 1, 1, 1, 1,
0.8811519, 1.227593, 2.362834, 1, 1, 1, 1, 1,
0.8819273, -0.299248, 0.9987999, 1, 1, 1, 1, 1,
0.8838089, 0.1491415, 2.862044, 1, 1, 1, 1, 1,
0.8845612, -0.7063504, 2.847865, 1, 1, 1, 1, 1,
0.9013259, 0.6880131, 0.7373602, 1, 1, 1, 1, 1,
0.9024655, 1.096594, 1.669271, 1, 1, 1, 1, 1,
0.9119946, 0.1073462, 1.732517, 1, 1, 1, 1, 1,
0.9175987, 1.329572, 0.6334133, 1, 1, 1, 1, 1,
0.9323636, 0.2986497, 0.4438883, 1, 1, 1, 1, 1,
0.9382086, 0.6535497, -0.5113424, 1, 1, 1, 1, 1,
0.9549844, 0.04152068, 1.691731, 1, 1, 1, 1, 1,
0.9611272, 0.8206695, 2.256551, 1, 1, 1, 1, 1,
0.9625795, -0.8519858, 1.982031, 1, 1, 1, 1, 1,
0.9630001, 1.93221, 1.240197, 1, 1, 1, 1, 1,
0.9634552, 2.204892, 1.121145, 0, 0, 1, 1, 1,
0.9644775, 1.62466, 0.6928098, 1, 0, 0, 1, 1,
0.9672498, 1.185159, 1.451429, 1, 0, 0, 1, 1,
0.9724538, -0.01760018, 1.348946, 1, 0, 0, 1, 1,
0.9827816, -0.8368131, 1.797222, 1, 0, 0, 1, 1,
0.9869233, -0.02631762, -0.6393527, 1, 0, 0, 1, 1,
0.9928526, 0.931312, 0.622077, 0, 0, 0, 1, 1,
0.9982312, -1.485481, 4.72356, 0, 0, 0, 1, 1,
0.9998046, -0.03204651, 1.740911, 0, 0, 0, 1, 1,
1.004496, -1.212932, 2.20238, 0, 0, 0, 1, 1,
1.004537, 0.0172733, 2.612622, 0, 0, 0, 1, 1,
1.007232, 1.263839, -1.267518, 0, 0, 0, 1, 1,
1.008807, 2.542031, 1.759692, 0, 0, 0, 1, 1,
1.010716, 0.905852, 1.421849, 1, 1, 1, 1, 1,
1.013627, -0.4481881, 2.699508, 1, 1, 1, 1, 1,
1.017011, -0.5803681, 3.318765, 1, 1, 1, 1, 1,
1.022941, 1.569118, 1.887066, 1, 1, 1, 1, 1,
1.026079, 0.04180852, 4.126484, 1, 1, 1, 1, 1,
1.032179, 0.02607968, 1.206008, 1, 1, 1, 1, 1,
1.033908, -1.325222, 2.41723, 1, 1, 1, 1, 1,
1.038962, 0.4603229, 0.3133161, 1, 1, 1, 1, 1,
1.052263, -0.4747542, 1.6994, 1, 1, 1, 1, 1,
1.05539, -1.068859, 2.658917, 1, 1, 1, 1, 1,
1.057186, 0.884055, 1.641211, 1, 1, 1, 1, 1,
1.062518, -0.6552168, 1.509499, 1, 1, 1, 1, 1,
1.066643, -1.296722, 1.50579, 1, 1, 1, 1, 1,
1.075805, 0.2375395, 1.498409, 1, 1, 1, 1, 1,
1.090127, -0.1533003, 1.316096, 1, 1, 1, 1, 1,
1.090219, -0.04092034, 0.5285271, 0, 0, 1, 1, 1,
1.098118, 0.2718549, 1.593462, 1, 0, 0, 1, 1,
1.101262, -1.730897, 2.435197, 1, 0, 0, 1, 1,
1.115791, 0.5752392, 2.216882, 1, 0, 0, 1, 1,
1.118043, 1.687254, -1.183398, 1, 0, 0, 1, 1,
1.118538, 1.715195, 0.867772, 1, 0, 0, 1, 1,
1.121591, 0.4420591, 1.254894, 0, 0, 0, 1, 1,
1.123329, 0.5585684, 0.6241024, 0, 0, 0, 1, 1,
1.126818, -0.1486103, 2.163151, 0, 0, 0, 1, 1,
1.139481, -1.264614, 3.370257, 0, 0, 0, 1, 1,
1.148549, -0.396208, 3.057472, 0, 0, 0, 1, 1,
1.150094, -1.616467, 1.688618, 0, 0, 0, 1, 1,
1.150623, 0.4491639, 1.549572, 0, 0, 0, 1, 1,
1.150781, -0.1560381, 3.833099, 1, 1, 1, 1, 1,
1.1603, 0.3627301, 0.6046503, 1, 1, 1, 1, 1,
1.173305, -0.507863, 1.635224, 1, 1, 1, 1, 1,
1.173731, 0.4036875, 1.614714, 1, 1, 1, 1, 1,
1.1739, -1.114314, 0.6265119, 1, 1, 1, 1, 1,
1.178614, -0.3249621, 2.011995, 1, 1, 1, 1, 1,
1.179666, 1.270328, 0.8205836, 1, 1, 1, 1, 1,
1.181882, -0.3382992, 2.346773, 1, 1, 1, 1, 1,
1.185117, -1.268955, 2.533809, 1, 1, 1, 1, 1,
1.190372, 0.4660451, -0.48267, 1, 1, 1, 1, 1,
1.198606, -0.2320841, 2.693499, 1, 1, 1, 1, 1,
1.218859, -0.2595973, 2.780774, 1, 1, 1, 1, 1,
1.218888, -0.01699552, 1.766582, 1, 1, 1, 1, 1,
1.23455, 1.683542, -0.5596732, 1, 1, 1, 1, 1,
1.248759, 1.610983, 1.730234, 1, 1, 1, 1, 1,
1.250803, -0.4879853, 2.606641, 0, 0, 1, 1, 1,
1.256846, 0.6984338, 1.218446, 1, 0, 0, 1, 1,
1.266079, 1.290602, 0.6616024, 1, 0, 0, 1, 1,
1.271983, -0.80542, 1.812304, 1, 0, 0, 1, 1,
1.274356, -1.02939, 3.336949, 1, 0, 0, 1, 1,
1.300887, 1.089203, 1.442772, 1, 0, 0, 1, 1,
1.301008, 1.419728, -0.9437136, 0, 0, 0, 1, 1,
1.304782, 2.244216, 1.97943, 0, 0, 0, 1, 1,
1.310439, -0.3453924, 2.40913, 0, 0, 0, 1, 1,
1.310734, -2.03504, 2.458873, 0, 0, 0, 1, 1,
1.311955, -2.874393, 2.628253, 0, 0, 0, 1, 1,
1.313857, -0.14048, 2.366768, 0, 0, 0, 1, 1,
1.319066, -3.236717, 2.608529, 0, 0, 0, 1, 1,
1.335547, 1.140071, 0.3745483, 1, 1, 1, 1, 1,
1.336617, -0.3721057, 2.914072, 1, 1, 1, 1, 1,
1.341166, 0.03469715, 1.348929, 1, 1, 1, 1, 1,
1.34213, 0.6237424, 0.4545002, 1, 1, 1, 1, 1,
1.353132, -0.260151, 0.6635802, 1, 1, 1, 1, 1,
1.366231, -0.832947, 2.218577, 1, 1, 1, 1, 1,
1.397744, 0.6482558, 2.401983, 1, 1, 1, 1, 1,
1.400808, -0.4476727, 2.186731, 1, 1, 1, 1, 1,
1.41263, 1.189446, 0.8462203, 1, 1, 1, 1, 1,
1.420884, 0.5382129, 0.6251407, 1, 1, 1, 1, 1,
1.426541, 0.2598082, 2.01873, 1, 1, 1, 1, 1,
1.426873, 2.385418, 0.5188577, 1, 1, 1, 1, 1,
1.441696, 0.002679762, 1.165024, 1, 1, 1, 1, 1,
1.447019, 0.6645802, 1.733086, 1, 1, 1, 1, 1,
1.450389, 0.3441279, 1.852792, 1, 1, 1, 1, 1,
1.46471, -1.271136, 2.623873, 0, 0, 1, 1, 1,
1.475607, 0.8453104, 0.3808891, 1, 0, 0, 1, 1,
1.482893, 0.0901565, -0.01819863, 1, 0, 0, 1, 1,
1.488328, 0.8580892, 0.03201765, 1, 0, 0, 1, 1,
1.5044, 0.1259544, -0.1305134, 1, 0, 0, 1, 1,
1.510409, -0.9103093, 2.948334, 1, 0, 0, 1, 1,
1.514554, -0.8705826, 4.033347, 0, 0, 0, 1, 1,
1.519627, 0.4357543, 2.458777, 0, 0, 0, 1, 1,
1.523336, 1.105376, 3.313551, 0, 0, 0, 1, 1,
1.524352, -0.2215403, 1.332097, 0, 0, 0, 1, 1,
1.525017, 0.9938095, 1.600412, 0, 0, 0, 1, 1,
1.528116, 0.4749663, 0.2143145, 0, 0, 0, 1, 1,
1.530482, -1.250081, 1.746495, 0, 0, 0, 1, 1,
1.533701, 0.09731524, 1.567629, 1, 1, 1, 1, 1,
1.539993, -0.4262815, 2.241701, 1, 1, 1, 1, 1,
1.540882, -0.1800444, 2.02753, 1, 1, 1, 1, 1,
1.55662, -1.48776, 0.004506864, 1, 1, 1, 1, 1,
1.558818, 1.67933, 2.004439, 1, 1, 1, 1, 1,
1.570322, 1.861097, 1.191625, 1, 1, 1, 1, 1,
1.57343, -1.131539, 2.117669, 1, 1, 1, 1, 1,
1.582516, -0.2836076, 0.4213131, 1, 1, 1, 1, 1,
1.5861, 0.03240741, 1.972682, 1, 1, 1, 1, 1,
1.586147, 1.568444, 0.9664481, 1, 1, 1, 1, 1,
1.597703, 0.004112111, 0.9536666, 1, 1, 1, 1, 1,
1.638849, -0.4642428, 0.04245805, 1, 1, 1, 1, 1,
1.639313, -0.443564, 1.900601, 1, 1, 1, 1, 1,
1.642642, 0.9589129, -0.3427135, 1, 1, 1, 1, 1,
1.647676, -1.228003, 1.43869, 1, 1, 1, 1, 1,
1.655202, -0.86374, 3.74072, 0, 0, 1, 1, 1,
1.655773, -2.029041, 2.573376, 1, 0, 0, 1, 1,
1.656918, -0.7017571, 2.523168, 1, 0, 0, 1, 1,
1.667012, -1.111976, 1.953281, 1, 0, 0, 1, 1,
1.677088, 1.70937, 0.5280375, 1, 0, 0, 1, 1,
1.681337, -0.006763556, 1.517746, 1, 0, 0, 1, 1,
1.682377, 0.4007403, -0.4444371, 0, 0, 0, 1, 1,
1.69716, -1.193431, 2.880834, 0, 0, 0, 1, 1,
1.704066, 0.5024551, 0.360057, 0, 0, 0, 1, 1,
1.745769, -0.869916, 3.05627, 0, 0, 0, 1, 1,
1.759877, 0.8664413, 2.410893, 0, 0, 0, 1, 1,
1.774176, 0.1397987, 1.406943, 0, 0, 0, 1, 1,
1.780696, -0.8880696, 0.7217044, 0, 0, 0, 1, 1,
1.789364, -0.9764146, 0.8496649, 1, 1, 1, 1, 1,
1.790262, 0.9568411, 0.8637806, 1, 1, 1, 1, 1,
1.822788, 0.8279564, 0.5290449, 1, 1, 1, 1, 1,
1.830725, -1.13229, 1.694288, 1, 1, 1, 1, 1,
1.842919, -0.3903493, -0.3137787, 1, 1, 1, 1, 1,
1.844608, -0.1623349, 0.5701826, 1, 1, 1, 1, 1,
1.846966, -0.1085031, 0.5469237, 1, 1, 1, 1, 1,
1.84707, -0.8529209, 1.58513, 1, 1, 1, 1, 1,
1.855932, 1.087364, 0.3832719, 1, 1, 1, 1, 1,
1.87859, 0.6005355, 1.855447, 1, 1, 1, 1, 1,
1.891376, -0.3976122, 0.7965379, 1, 1, 1, 1, 1,
1.928946, 1.308998, -1.923363, 1, 1, 1, 1, 1,
1.940725, -0.2305811, 0.8362967, 1, 1, 1, 1, 1,
1.978257, 1.043224, 1.65429, 1, 1, 1, 1, 1,
2.011141, -0.8849119, 3.368724, 1, 1, 1, 1, 1,
2.016616, -1.338458, 1.484549, 0, 0, 1, 1, 1,
2.046012, -1.717842, 1.095564, 1, 0, 0, 1, 1,
2.04658, -0.0620349, 1.763615, 1, 0, 0, 1, 1,
2.1194, 2.016296, 0.3584246, 1, 0, 0, 1, 1,
2.126529, 1.043819, -0.4356441, 1, 0, 0, 1, 1,
2.134975, -0.9213842, 1.674728, 1, 0, 0, 1, 1,
2.163272, -0.2815888, 3.078196, 0, 0, 0, 1, 1,
2.17373, -0.7330289, 1.219928, 0, 0, 0, 1, 1,
2.177728, -0.9968612, 1.478772, 0, 0, 0, 1, 1,
2.183062, -2.198004, 3.83916, 0, 0, 0, 1, 1,
2.24735, 1.121231, 2.105287, 0, 0, 0, 1, 1,
2.250177, 0.8588122, 1.078807, 0, 0, 0, 1, 1,
2.282145, 0.07168091, 3.239021, 0, 0, 0, 1, 1,
2.295313, 1.233037, 0.7369663, 1, 1, 1, 1, 1,
2.373172, -1.563649, 0.7325078, 1, 1, 1, 1, 1,
2.49236, 0.6392146, 1.267301, 1, 1, 1, 1, 1,
2.823063, 0.3717885, 2.541561, 1, 1, 1, 1, 1,
2.855279, -0.6583748, 2.60174, 1, 1, 1, 1, 1,
2.971451, 1.075656, 1.036638, 1, 1, 1, 1, 1,
3.310292, -1.848462, 0.2508945, 1, 1, 1, 1, 1
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
var radius = 9.646464;
var distance = 33.8828;
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
mvMatrix.translate( -0.02146912, 0.1546794, -0.2894948 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.8828);
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
