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
-3.718059, 0.8532459, -0.03904097, 1, 0, 0, 1,
-3.03038, -1.209629, -2.704785, 1, 0.007843138, 0, 1,
-2.969501, 0.4515449, -0.9613106, 1, 0.01176471, 0, 1,
-2.940197, 1.020972, -1.271997, 1, 0.01960784, 0, 1,
-2.832908, -0.4716628, -0.5891646, 1, 0.02352941, 0, 1,
-2.688987, 0.5999154, -0.3858302, 1, 0.03137255, 0, 1,
-2.583943, -0.799855, -1.33234, 1, 0.03529412, 0, 1,
-2.560896, -0.002654411, -0.7969978, 1, 0.04313726, 0, 1,
-2.540639, 0.9596899, 0.9987627, 1, 0.04705882, 0, 1,
-2.408996, 1.143062, 0.1386886, 1, 0.05490196, 0, 1,
-2.31592, 0.08513774, -2.973672, 1, 0.05882353, 0, 1,
-2.314662, 0.2940332, -1.654188, 1, 0.06666667, 0, 1,
-2.188883, -1.159187, -1.945798, 1, 0.07058824, 0, 1,
-2.180403, 1.285331, 0.5410938, 1, 0.07843138, 0, 1,
-2.177079, 0.1113997, -1.179383, 1, 0.08235294, 0, 1,
-2.14364, -0.5569, -3.067791, 1, 0.09019608, 0, 1,
-2.124442, 0.7841799, -2.328693, 1, 0.09411765, 0, 1,
-2.062485, 1.756491, 0.1803259, 1, 0.1019608, 0, 1,
-2.049871, -0.4066696, -1.286695, 1, 0.1098039, 0, 1,
-2.011969, -0.5962356, -1.014391, 1, 0.1137255, 0, 1,
-2.010458, 2.115654, -2.284662, 1, 0.1215686, 0, 1,
-1.986525, 0.6972723, -2.525024, 1, 0.1254902, 0, 1,
-1.968464, -0.1997449, -3.041493, 1, 0.1333333, 0, 1,
-1.955093, -0.1853171, -2.292311, 1, 0.1372549, 0, 1,
-1.91936, 0.6020443, -0.5764467, 1, 0.145098, 0, 1,
-1.889043, -0.5132974, -0.7932155, 1, 0.1490196, 0, 1,
-1.83312, -0.5537628, -3.067706, 1, 0.1568628, 0, 1,
-1.833004, -0.9924219, -1.571202, 1, 0.1607843, 0, 1,
-1.801482, 0.05485623, -1.130388, 1, 0.1686275, 0, 1,
-1.799119, 0.327654, -0.1799957, 1, 0.172549, 0, 1,
-1.784548, 1.476394, 1.345258, 1, 0.1803922, 0, 1,
-1.784479, 0.5361145, -0.479488, 1, 0.1843137, 0, 1,
-1.768296, -0.6800225, 0.1448653, 1, 0.1921569, 0, 1,
-1.764855, 0.514944, -2.169768, 1, 0.1960784, 0, 1,
-1.755408, 0.7613971, -0.1661362, 1, 0.2039216, 0, 1,
-1.754869, -1.237216, -3.194547, 1, 0.2117647, 0, 1,
-1.733719, 0.2523423, -0.9312577, 1, 0.2156863, 0, 1,
-1.708857, -1.516702, -3.161745, 1, 0.2235294, 0, 1,
-1.700636, 0.6631317, 0.2564978, 1, 0.227451, 0, 1,
-1.67418, 0.6766646, -1.075822, 1, 0.2352941, 0, 1,
-1.637658, 0.2231005, -2.806282, 1, 0.2392157, 0, 1,
-1.629439, -1.104076, -1.04943, 1, 0.2470588, 0, 1,
-1.628909, -0.5477978, -1.445163, 1, 0.2509804, 0, 1,
-1.603863, 1.225676, -0.4065979, 1, 0.2588235, 0, 1,
-1.595759, 2.412762, -1.282345, 1, 0.2627451, 0, 1,
-1.589051, 1.522779, -0.5610602, 1, 0.2705882, 0, 1,
-1.55373, 0.2992918, -2.45745, 1, 0.2745098, 0, 1,
-1.551583, 0.5701309, -2.835334, 1, 0.282353, 0, 1,
-1.549891, -0.7490451, -1.346838, 1, 0.2862745, 0, 1,
-1.546884, 0.1534254, -0.9459729, 1, 0.2941177, 0, 1,
-1.546335, 0.09495506, -1.786288, 1, 0.3019608, 0, 1,
-1.535891, -0.6301359, -1.651073, 1, 0.3058824, 0, 1,
-1.533597, -0.9849048, -3.131247, 1, 0.3137255, 0, 1,
-1.524322, 2.50995, -0.01762632, 1, 0.3176471, 0, 1,
-1.5219, 0.1252827, -0.9981523, 1, 0.3254902, 0, 1,
-1.510131, -1.261968, -2.89921, 1, 0.3294118, 0, 1,
-1.509561, 0.5849419, 0.9388022, 1, 0.3372549, 0, 1,
-1.503363, -0.3631241, -2.201782, 1, 0.3411765, 0, 1,
-1.499836, 0.443997, -1.11145, 1, 0.3490196, 0, 1,
-1.495785, -0.9480646, -1.620616, 1, 0.3529412, 0, 1,
-1.495385, 2.297339, -0.3169981, 1, 0.3607843, 0, 1,
-1.493963, -0.4919919, 0.09068277, 1, 0.3647059, 0, 1,
-1.490217, 0.1355637, -2.209906, 1, 0.372549, 0, 1,
-1.485951, 1.235408, -0.3593635, 1, 0.3764706, 0, 1,
-1.484308, -1.363202, -4.242928, 1, 0.3843137, 0, 1,
-1.480008, 0.2103296, -0.8265459, 1, 0.3882353, 0, 1,
-1.479758, 0.318909, -1.594239, 1, 0.3960784, 0, 1,
-1.477545, -0.1269448, -2.502071, 1, 0.4039216, 0, 1,
-1.477048, -2.061268, -3.22145, 1, 0.4078431, 0, 1,
-1.465197, -0.1623688, -0.316788, 1, 0.4156863, 0, 1,
-1.449092, -0.3404145, -0.1480658, 1, 0.4196078, 0, 1,
-1.444968, -1.117833, -4.067633, 1, 0.427451, 0, 1,
-1.413629, 0.3533579, -1.69284, 1, 0.4313726, 0, 1,
-1.410577, 0.4053829, -1.771004, 1, 0.4392157, 0, 1,
-1.399878, -0.9301564, -2.498717, 1, 0.4431373, 0, 1,
-1.399632, -1.154004, -2.298699, 1, 0.4509804, 0, 1,
-1.398975, -0.8957995, -2.069582, 1, 0.454902, 0, 1,
-1.392007, 1.349231, -2.181514, 1, 0.4627451, 0, 1,
-1.391246, 1.218934, 0.8705323, 1, 0.4666667, 0, 1,
-1.390794, -0.2325878, -1.658106, 1, 0.4745098, 0, 1,
-1.389943, -1.00653, -1.492416, 1, 0.4784314, 0, 1,
-1.388642, 1.736914, -1.253164, 1, 0.4862745, 0, 1,
-1.377008, -0.634688, -1.473439, 1, 0.4901961, 0, 1,
-1.375137, -2.065404, -2.427473, 1, 0.4980392, 0, 1,
-1.371548, 0.4105321, -0.9340742, 1, 0.5058824, 0, 1,
-1.371442, -0.5621263, -2.251712, 1, 0.509804, 0, 1,
-1.370077, -0.1392928, -0.6963865, 1, 0.5176471, 0, 1,
-1.361242, 0.4349179, -1.521243, 1, 0.5215687, 0, 1,
-1.347819, 0.2137967, -0.6689538, 1, 0.5294118, 0, 1,
-1.339184, 1.789929, -2.494673, 1, 0.5333334, 0, 1,
-1.335805, 1.124434, -2.944424, 1, 0.5411765, 0, 1,
-1.322462, -0.6347535, -2.829674, 1, 0.5450981, 0, 1,
-1.321504, 0.0578987, -2.097611, 1, 0.5529412, 0, 1,
-1.315852, -0.9073957, -2.62925, 1, 0.5568628, 0, 1,
-1.305173, 2.033402, -0.4884925, 1, 0.5647059, 0, 1,
-1.286805, -1.034086, -1.375732, 1, 0.5686275, 0, 1,
-1.279482, -1.144304, -3.274022, 1, 0.5764706, 0, 1,
-1.277358, 0.06490164, -1.295784, 1, 0.5803922, 0, 1,
-1.272454, -0.301107, -1.059767, 1, 0.5882353, 0, 1,
-1.271573, -1.334857, -3.377285, 1, 0.5921569, 0, 1,
-1.265133, -1.946941, -3.543264, 1, 0.6, 0, 1,
-1.265024, -2.547875, -2.020152, 1, 0.6078432, 0, 1,
-1.261067, -1.31864, -3.035743, 1, 0.6117647, 0, 1,
-1.258678, 0.8292045, -1.796891, 1, 0.6196079, 0, 1,
-1.256126, 0.375342, -2.317408, 1, 0.6235294, 0, 1,
-1.251564, 0.8572448, -2.329139, 1, 0.6313726, 0, 1,
-1.250558, -1.203465, -2.080955, 1, 0.6352941, 0, 1,
-1.2439, 0.6510732, -0.3622468, 1, 0.6431373, 0, 1,
-1.243783, 0.5554922, -0.7242542, 1, 0.6470588, 0, 1,
-1.241596, 0.3223144, -0.3308058, 1, 0.654902, 0, 1,
-1.239754, 0.6720493, 0.03019877, 1, 0.6588235, 0, 1,
-1.23674, 0.5801252, -1.425146, 1, 0.6666667, 0, 1,
-1.231415, -1.286651, -3.308318, 1, 0.6705883, 0, 1,
-1.224509, 0.4425687, -0.1002955, 1, 0.6784314, 0, 1,
-1.220711, -0.02899827, -2.038503, 1, 0.682353, 0, 1,
-1.217041, -0.1866083, -0.215501, 1, 0.6901961, 0, 1,
-1.216294, -1.218386, -3.028444, 1, 0.6941177, 0, 1,
-1.201831, 1.784464, 2.19756, 1, 0.7019608, 0, 1,
-1.195753, 1.123005, -1.162475, 1, 0.7098039, 0, 1,
-1.184564, -1.314966, -1.552889, 1, 0.7137255, 0, 1,
-1.17943, -1.065335, -2.045686, 1, 0.7215686, 0, 1,
-1.162715, -0.2991694, -1.677034, 1, 0.7254902, 0, 1,
-1.162695, -0.01221706, -0.67466, 1, 0.7333333, 0, 1,
-1.161714, -0.08990262, -2.472519, 1, 0.7372549, 0, 1,
-1.160411, 0.1646522, -1.383946, 1, 0.7450981, 0, 1,
-1.158875, -0.06760773, -1.861593, 1, 0.7490196, 0, 1,
-1.152308, 0.4868872, -4.334638, 1, 0.7568628, 0, 1,
-1.144128, -0.5314078, -0.0917861, 1, 0.7607843, 0, 1,
-1.142224, -0.2931313, -2.934038, 1, 0.7686275, 0, 1,
-1.122499, -0.9584432, -2.319554, 1, 0.772549, 0, 1,
-1.1213, 0.01862284, -1.032582, 1, 0.7803922, 0, 1,
-1.117193, -0.03417707, -2.702875, 1, 0.7843137, 0, 1,
-1.115641, -0.9511055, -0.9682726, 1, 0.7921569, 0, 1,
-1.109972, -0.2806208, -3.242646, 1, 0.7960784, 0, 1,
-1.106683, 1.761909, -0.8651282, 1, 0.8039216, 0, 1,
-1.105508, -1.141056, -3.340048, 1, 0.8117647, 0, 1,
-1.101621, 0.8928617, 0.7472651, 1, 0.8156863, 0, 1,
-1.099859, -0.8542849, -1.8054, 1, 0.8235294, 0, 1,
-1.097272, -1.16507, -2.83787, 1, 0.827451, 0, 1,
-1.09189, -0.03209328, 0.2824078, 1, 0.8352941, 0, 1,
-1.091133, 0.3413243, -1.136184, 1, 0.8392157, 0, 1,
-1.081504, -1.060992, -2.099775, 1, 0.8470588, 0, 1,
-1.077271, -0.2288077, -1.511314, 1, 0.8509804, 0, 1,
-1.070638, 1.001101, 1.003984, 1, 0.8588235, 0, 1,
-1.066299, 0.6665871, 1.028828, 1, 0.8627451, 0, 1,
-1.064962, -0.2584457, -3.028608, 1, 0.8705882, 0, 1,
-1.062317, 0.07648868, -2.921816, 1, 0.8745098, 0, 1,
-1.056932, -0.4551858, -2.638664, 1, 0.8823529, 0, 1,
-1.045114, -1.28593, -3.087462, 1, 0.8862745, 0, 1,
-1.031775, -0.1788657, -3.092226, 1, 0.8941177, 0, 1,
-1.030486, 0.751394, -2.136811, 1, 0.8980392, 0, 1,
-1.023725, -0.3683128, -3.197265, 1, 0.9058824, 0, 1,
-1.022449, 0.09941152, -0.8147338, 1, 0.9137255, 0, 1,
-1.016702, -1.4527, -1.402128, 1, 0.9176471, 0, 1,
-1.007231, 0.3981574, -1.15759, 1, 0.9254902, 0, 1,
-1.003251, 0.7790778, -0.9407602, 1, 0.9294118, 0, 1,
-1.001389, 2.600381, -1.127623, 1, 0.9372549, 0, 1,
-0.9997404, 0.6341371, -0.3098566, 1, 0.9411765, 0, 1,
-0.9990878, 0.5542136, -1.11429, 1, 0.9490196, 0, 1,
-0.9983438, 0.6793877, -0.8699465, 1, 0.9529412, 0, 1,
-0.9975353, 1.103617, 0.872352, 1, 0.9607843, 0, 1,
-0.9937266, 1.350859, -1.8713, 1, 0.9647059, 0, 1,
-0.9936877, 0.05787635, -1.922316, 1, 0.972549, 0, 1,
-0.9850426, -1.242982, -2.17867, 1, 0.9764706, 0, 1,
-0.9824525, -0.7192516, -2.206166, 1, 0.9843137, 0, 1,
-0.9807808, 2.328122, -0.7637166, 1, 0.9882353, 0, 1,
-0.9776751, -1.361632, -2.941384, 1, 0.9960784, 0, 1,
-0.9759993, 0.2704186, -1.980587, 0.9960784, 1, 0, 1,
-0.9630985, -0.6029202, -1.286857, 0.9921569, 1, 0, 1,
-0.9623394, 0.7668419, -1.440736, 0.9843137, 1, 0, 1,
-0.9618826, -1.973736, -2.749031, 0.9803922, 1, 0, 1,
-0.9583009, -0.1886038, -0.8576331, 0.972549, 1, 0, 1,
-0.9580698, -0.8927554, -3.052844, 0.9686275, 1, 0, 1,
-0.9525478, 0.7253971, -2.426215, 0.9607843, 1, 0, 1,
-0.9522908, 0.07900661, 0.5544003, 0.9568627, 1, 0, 1,
-0.9522271, -0.6128735, -1.983628, 0.9490196, 1, 0, 1,
-0.9512946, -0.5321628, -2.268361, 0.945098, 1, 0, 1,
-0.946103, 1.126335, -0.3834683, 0.9372549, 1, 0, 1,
-0.9440282, 1.493385, 1.995539, 0.9333333, 1, 0, 1,
-0.9408162, -1.814869, -3.749259, 0.9254902, 1, 0, 1,
-0.9392375, -1.260532, -1.613606, 0.9215686, 1, 0, 1,
-0.9384831, 1.82691, -2.29878, 0.9137255, 1, 0, 1,
-0.9358543, -0.1647939, -2.093712, 0.9098039, 1, 0, 1,
-0.9324587, -0.1119416, -1.134239, 0.9019608, 1, 0, 1,
-0.9256971, -0.1287679, -1.688434, 0.8941177, 1, 0, 1,
-0.9252214, -0.3567753, -2.431647, 0.8901961, 1, 0, 1,
-0.9244351, 2.125113, -2.458485, 0.8823529, 1, 0, 1,
-0.9228838, 0.3228881, -0.7555969, 0.8784314, 1, 0, 1,
-0.9205664, 0.7759693, -0.5012172, 0.8705882, 1, 0, 1,
-0.9190238, -0.8125591, -2.021979, 0.8666667, 1, 0, 1,
-0.9155344, 1.147825, -3.646497, 0.8588235, 1, 0, 1,
-0.9148097, 0.04395847, -3.838994, 0.854902, 1, 0, 1,
-0.9123832, -0.3067444, -1.63222, 0.8470588, 1, 0, 1,
-0.9106076, 1.163296, -1.713258, 0.8431373, 1, 0, 1,
-0.908049, 0.99841, -0.5105301, 0.8352941, 1, 0, 1,
-0.9061714, 1.240883, -2.410276, 0.8313726, 1, 0, 1,
-0.9059649, 1.123565, -0.1424806, 0.8235294, 1, 0, 1,
-0.8959107, -0.3620003, -0.6659061, 0.8196079, 1, 0, 1,
-0.8944991, -1.205722, -0.3077619, 0.8117647, 1, 0, 1,
-0.8931544, -0.2043405, -1.717417, 0.8078431, 1, 0, 1,
-0.8916769, 0.2160471, -1.436896, 0.8, 1, 0, 1,
-0.8848693, -0.3877478, -1.40015, 0.7921569, 1, 0, 1,
-0.8825412, 0.8111871, -2.315646, 0.7882353, 1, 0, 1,
-0.8784778, -0.5452283, -2.429894, 0.7803922, 1, 0, 1,
-0.8777503, 0.2882556, -2.013397, 0.7764706, 1, 0, 1,
-0.8772424, -0.5349484, -1.523454, 0.7686275, 1, 0, 1,
-0.8575802, 0.7518639, -1.075981, 0.7647059, 1, 0, 1,
-0.8560976, 0.07341717, -0.2310866, 0.7568628, 1, 0, 1,
-0.8546795, 0.3083812, -2.665709, 0.7529412, 1, 0, 1,
-0.8526633, 1.027936, -0.4317882, 0.7450981, 1, 0, 1,
-0.8514419, 0.6782757, -0.5567554, 0.7411765, 1, 0, 1,
-0.8509213, -0.7913313, -1.957562, 0.7333333, 1, 0, 1,
-0.8448329, -0.9097971, -2.824398, 0.7294118, 1, 0, 1,
-0.8384546, 0.6070758, -0.5625647, 0.7215686, 1, 0, 1,
-0.8351551, -0.1847699, -0.624953, 0.7176471, 1, 0, 1,
-0.8323849, -1.319375, -1.244172, 0.7098039, 1, 0, 1,
-0.823611, -2.264278, -2.974848, 0.7058824, 1, 0, 1,
-0.8188965, 0.7066543, -0.6570627, 0.6980392, 1, 0, 1,
-0.8179737, -1.617559, -3.642514, 0.6901961, 1, 0, 1,
-0.8158494, -1.25414, -1.747159, 0.6862745, 1, 0, 1,
-0.8146946, 0.1302047, -1.819747, 0.6784314, 1, 0, 1,
-0.8142177, 0.5838477, -0.1623536, 0.6745098, 1, 0, 1,
-0.8134338, 0.02742874, -0.4756891, 0.6666667, 1, 0, 1,
-0.8104503, 0.1780141, -1.377842, 0.6627451, 1, 0, 1,
-0.8042536, -0.3213504, -3.028187, 0.654902, 1, 0, 1,
-0.7985507, 1.059456, -0.01364753, 0.6509804, 1, 0, 1,
-0.7952904, 0.6104347, 0.4046971, 0.6431373, 1, 0, 1,
-0.7919825, -0.8169854, -1.673437, 0.6392157, 1, 0, 1,
-0.7895881, 0.3669594, -0.6965699, 0.6313726, 1, 0, 1,
-0.786973, -2.549101, -2.577199, 0.627451, 1, 0, 1,
-0.7861155, -0.6345438, -1.306365, 0.6196079, 1, 0, 1,
-0.7832022, -1.101112, -1.099733, 0.6156863, 1, 0, 1,
-0.7822123, 0.1105852, -2.477481, 0.6078432, 1, 0, 1,
-0.7793182, 0.09537125, -1.34703, 0.6039216, 1, 0, 1,
-0.7781108, 0.4476175, -1.986242, 0.5960785, 1, 0, 1,
-0.7678115, -1.57855, -4.002861, 0.5882353, 1, 0, 1,
-0.7618886, -0.2745254, -0.3389426, 0.5843138, 1, 0, 1,
-0.7604125, -0.4311834, -3.78253, 0.5764706, 1, 0, 1,
-0.7588602, -0.8565891, -1.866711, 0.572549, 1, 0, 1,
-0.7572686, -0.0866866, -0.8212833, 0.5647059, 1, 0, 1,
-0.7519808, 0.3407361, 0.9064643, 0.5607843, 1, 0, 1,
-0.7464193, 0.600831, -1.88709, 0.5529412, 1, 0, 1,
-0.7462014, -0.5924367, -1.096523, 0.5490196, 1, 0, 1,
-0.7410874, -0.03757381, -2.087024, 0.5411765, 1, 0, 1,
-0.7372147, -1.439199, -3.047296, 0.5372549, 1, 0, 1,
-0.7345256, 1.062414, -1.119423, 0.5294118, 1, 0, 1,
-0.7314965, 1.1568, -0.4384701, 0.5254902, 1, 0, 1,
-0.7293563, -0.9079851, -2.579663, 0.5176471, 1, 0, 1,
-0.727931, 0.6806147, -0.412466, 0.5137255, 1, 0, 1,
-0.7082483, -1.222775, -2.61203, 0.5058824, 1, 0, 1,
-0.7075992, -0.9576408, -1.601212, 0.5019608, 1, 0, 1,
-0.704587, 2.065923, -2.168846, 0.4941176, 1, 0, 1,
-0.703086, -0.997946, -0.9439335, 0.4862745, 1, 0, 1,
-0.7007648, -1.059953, -2.585358, 0.4823529, 1, 0, 1,
-0.696462, 0.2891101, -2.01245, 0.4745098, 1, 0, 1,
-0.6945493, -1.633861, -2.129981, 0.4705882, 1, 0, 1,
-0.6931846, 0.3138944, 0.2105717, 0.4627451, 1, 0, 1,
-0.6931507, 0.4747058, -0.04191566, 0.4588235, 1, 0, 1,
-0.6886743, -0.4473671, -4.445396, 0.4509804, 1, 0, 1,
-0.6858576, -0.5740447, -3.074791, 0.4470588, 1, 0, 1,
-0.6759982, -0.0552524, -3.088347, 0.4392157, 1, 0, 1,
-0.673982, -0.5160266, -2.618953, 0.4352941, 1, 0, 1,
-0.6670423, -0.8108723, -3.210052, 0.427451, 1, 0, 1,
-0.6634834, 0.2420551, 0.06581089, 0.4235294, 1, 0, 1,
-0.6626025, 1.675181, 2.03307, 0.4156863, 1, 0, 1,
-0.6515339, -0.2966403, -0.461268, 0.4117647, 1, 0, 1,
-0.6512415, -2.575785, -2.111222, 0.4039216, 1, 0, 1,
-0.6508207, 1.786115, -0.1790514, 0.3960784, 1, 0, 1,
-0.6466623, -0.4483352, -3.292976, 0.3921569, 1, 0, 1,
-0.640489, -1.700355, -2.0762, 0.3843137, 1, 0, 1,
-0.6394286, -0.2205097, -3.655777, 0.3803922, 1, 0, 1,
-0.6372439, 1.473159, -1.624574, 0.372549, 1, 0, 1,
-0.6356505, -1.332434, -1.447008, 0.3686275, 1, 0, 1,
-0.6349261, 0.8216217, -2.552089, 0.3607843, 1, 0, 1,
-0.634733, -0.9617234, -3.32679, 0.3568628, 1, 0, 1,
-0.6345587, -1.56232, -2.63183, 0.3490196, 1, 0, 1,
-0.6338806, -1.108092, -0.7013184, 0.345098, 1, 0, 1,
-0.6314161, -0.6945983, -1.562107, 0.3372549, 1, 0, 1,
-0.6309804, 1.32849, -0.3807475, 0.3333333, 1, 0, 1,
-0.627384, 0.7016428, 1.06542, 0.3254902, 1, 0, 1,
-0.6250151, -0.3719878, -1.432923, 0.3215686, 1, 0, 1,
-0.6203061, -1.745469, -3.366103, 0.3137255, 1, 0, 1,
-0.6105895, -0.8201156, -1.143784, 0.3098039, 1, 0, 1,
-0.6103338, -1.907205, -2.564312, 0.3019608, 1, 0, 1,
-0.6102024, -1.795514, -3.955299, 0.2941177, 1, 0, 1,
-0.6089064, -1.218856, -0.9734825, 0.2901961, 1, 0, 1,
-0.6061875, 1.742798, -0.5120908, 0.282353, 1, 0, 1,
-0.6061015, -1.344201, -1.831258, 0.2784314, 1, 0, 1,
-0.6053232, 0.7948685, -0.9133075, 0.2705882, 1, 0, 1,
-0.6050807, -0.3329976, -1.643421, 0.2666667, 1, 0, 1,
-0.5992926, 0.3591563, 0.6416823, 0.2588235, 1, 0, 1,
-0.5986557, 1.238631, -0.7906328, 0.254902, 1, 0, 1,
-0.5946576, -1.583216, -3.142963, 0.2470588, 1, 0, 1,
-0.5927209, -2.205857, -3.314346, 0.2431373, 1, 0, 1,
-0.5861816, -0.1220822, -0.6422236, 0.2352941, 1, 0, 1,
-0.5837165, -0.2471952, -3.037749, 0.2313726, 1, 0, 1,
-0.5811158, 0.0001856613, -2.366195, 0.2235294, 1, 0, 1,
-0.578561, 0.5419565, -0.8840654, 0.2196078, 1, 0, 1,
-0.5766766, -1.220689, -2.896574, 0.2117647, 1, 0, 1,
-0.5715764, 0.3823148, -0.9881365, 0.2078431, 1, 0, 1,
-0.5681742, 0.9415478, 0.1388642, 0.2, 1, 0, 1,
-0.5667052, 0.6157373, -0.0670905, 0.1921569, 1, 0, 1,
-0.5629517, -2.107942, -0.7588053, 0.1882353, 1, 0, 1,
-0.5616301, -0.2048314, -2.808757, 0.1803922, 1, 0, 1,
-0.5602705, 0.6891019, -1.888614, 0.1764706, 1, 0, 1,
-0.5542982, 0.8931797, -0.3304503, 0.1686275, 1, 0, 1,
-0.5532341, 0.6237491, 1.102942, 0.1647059, 1, 0, 1,
-0.5501223, -0.03079123, -2.255144, 0.1568628, 1, 0, 1,
-0.538869, -1.175024, -2.446799, 0.1529412, 1, 0, 1,
-0.5378767, -1.679507, -3.134125, 0.145098, 1, 0, 1,
-0.535551, -2.085666, -3.803979, 0.1411765, 1, 0, 1,
-0.534031, 0.509241, -0.5314412, 0.1333333, 1, 0, 1,
-0.5303572, -0.9632825, -2.110141, 0.1294118, 1, 0, 1,
-0.5288279, 1.10707, -1.923767, 0.1215686, 1, 0, 1,
-0.5268081, 1.436255, -0.1742932, 0.1176471, 1, 0, 1,
-0.5206441, -0.6427957, -2.026843, 0.1098039, 1, 0, 1,
-0.5198661, -0.7067899, -3.118191, 0.1058824, 1, 0, 1,
-0.5183585, -0.5360349, -1.589336, 0.09803922, 1, 0, 1,
-0.5104332, -1.547854, -2.228711, 0.09019608, 1, 0, 1,
-0.5079366, 0.04705223, -0.7745671, 0.08627451, 1, 0, 1,
-0.5071214, -0.128235, -2.809933, 0.07843138, 1, 0, 1,
-0.5067448, -0.04137785, -0.5755625, 0.07450981, 1, 0, 1,
-0.5057137, 1.338176, -0.5511562, 0.06666667, 1, 0, 1,
-0.5053959, 2.438808, 0.2326106, 0.0627451, 1, 0, 1,
-0.5010902, 0.5192345, -0.1265686, 0.05490196, 1, 0, 1,
-0.4901965, -0.478283, -1.455557, 0.05098039, 1, 0, 1,
-0.4850456, -0.6517042, -3.439179, 0.04313726, 1, 0, 1,
-0.4839744, -1.466048, -3.079307, 0.03921569, 1, 0, 1,
-0.4782767, -1.674274, -3.898975, 0.03137255, 1, 0, 1,
-0.4776444, -0.6517974, -1.456035, 0.02745098, 1, 0, 1,
-0.4731518, -0.1726206, -1.817097, 0.01960784, 1, 0, 1,
-0.4705239, -2.845973, -3.202503, 0.01568628, 1, 0, 1,
-0.4647144, 0.2521712, -2.344559, 0.007843138, 1, 0, 1,
-0.456275, -0.1868974, -2.100211, 0.003921569, 1, 0, 1,
-0.4508922, 0.1274529, -1.599913, 0, 1, 0.003921569, 1,
-0.4492196, 0.560243, -0.6250153, 0, 1, 0.01176471, 1,
-0.4463019, 1.454621, -0.8835372, 0, 1, 0.01568628, 1,
-0.4453932, -1.530173, -2.638218, 0, 1, 0.02352941, 1,
-0.4440952, 0.1738099, -1.404588, 0, 1, 0.02745098, 1,
-0.4334916, 0.5555812, -0.530248, 0, 1, 0.03529412, 1,
-0.4334229, -0.481897, -2.509317, 0, 1, 0.03921569, 1,
-0.4304448, -0.6925135, -3.419962, 0, 1, 0.04705882, 1,
-0.4296897, 1.73103, 0.3067664, 0, 1, 0.05098039, 1,
-0.4292161, -0.3196044, -3.692816, 0, 1, 0.05882353, 1,
-0.427516, 0.9145804, -1.349246, 0, 1, 0.0627451, 1,
-0.4242541, -2.215981, -5.090713, 0, 1, 0.07058824, 1,
-0.4228836, 0.2223522, -1.416099, 0, 1, 0.07450981, 1,
-0.4214055, -0.009433287, -2.755779, 0, 1, 0.08235294, 1,
-0.4210561, -0.1116323, -2.282548, 0, 1, 0.08627451, 1,
-0.4201791, 0.1470991, -3.238877, 0, 1, 0.09411765, 1,
-0.4197368, -1.836036, -3.704972, 0, 1, 0.1019608, 1,
-0.4188771, 0.5208294, -0.06551694, 0, 1, 0.1058824, 1,
-0.4186555, -0.5506595, -2.258417, 0, 1, 0.1137255, 1,
-0.4170827, -0.7199522, -1.535432, 0, 1, 0.1176471, 1,
-0.4136099, -0.7383258, -1.803084, 0, 1, 0.1254902, 1,
-0.4133677, 1.510955, -0.3737755, 0, 1, 0.1294118, 1,
-0.4127711, -0.02744922, -1.462625, 0, 1, 0.1372549, 1,
-0.404584, -0.07961508, -2.327132, 0, 1, 0.1411765, 1,
-0.4020773, -0.9860979, -3.124705, 0, 1, 0.1490196, 1,
-0.4013924, 1.322025, -1.276877, 0, 1, 0.1529412, 1,
-0.4006512, 0.9840174, -0.1107538, 0, 1, 0.1607843, 1,
-0.3969399, 0.2609778, -0.1981299, 0, 1, 0.1647059, 1,
-0.3952638, -0.2451952, -2.696361, 0, 1, 0.172549, 1,
-0.3847303, 0.1920105, -1.585501, 0, 1, 0.1764706, 1,
-0.3838054, -0.9316553, -2.484403, 0, 1, 0.1843137, 1,
-0.3787396, -0.1085122, -1.187853, 0, 1, 0.1882353, 1,
-0.3753185, -2.49975, -3.42709, 0, 1, 0.1960784, 1,
-0.3680763, 1.407676, -0.2044547, 0, 1, 0.2039216, 1,
-0.3627455, 0.1969295, -1.041799, 0, 1, 0.2078431, 1,
-0.3608776, -1.152887, -2.103586, 0, 1, 0.2156863, 1,
-0.3608437, -2.191162, -1.743471, 0, 1, 0.2196078, 1,
-0.3595407, -0.4322481, -1.49622, 0, 1, 0.227451, 1,
-0.3545106, 1.896684, -0.6946965, 0, 1, 0.2313726, 1,
-0.3497583, -0.424421, -0.8835241, 0, 1, 0.2392157, 1,
-0.3474441, -0.8834799, -1.526119, 0, 1, 0.2431373, 1,
-0.3471105, 1.09309, -0.7067862, 0, 1, 0.2509804, 1,
-0.346202, -0.9860454, -3.029368, 0, 1, 0.254902, 1,
-0.3404303, -0.7455562, -3.828702, 0, 1, 0.2627451, 1,
-0.3361298, -1.301089, -3.539532, 0, 1, 0.2666667, 1,
-0.3355366, -0.7292492, -1.58277, 0, 1, 0.2745098, 1,
-0.333747, 0.7590646, -1.856459, 0, 1, 0.2784314, 1,
-0.3284675, -1.137619, -3.887913, 0, 1, 0.2862745, 1,
-0.325383, 0.08736292, -1.955294, 0, 1, 0.2901961, 1,
-0.3252497, 1.29088, -0.1428321, 0, 1, 0.2980392, 1,
-0.3236921, -1.003822, -2.230676, 0, 1, 0.3058824, 1,
-0.3197012, 1.529104, -0.4342279, 0, 1, 0.3098039, 1,
-0.3192081, -2.055734, -3.95177, 0, 1, 0.3176471, 1,
-0.3125769, -1.342788, -2.352986, 0, 1, 0.3215686, 1,
-0.3081914, 0.830142, -1.350789, 0, 1, 0.3294118, 1,
-0.3062188, 0.7580835, -0.7780441, 0, 1, 0.3333333, 1,
-0.3056393, 0.03871372, -3.965387, 0, 1, 0.3411765, 1,
-0.3051677, -1.079247, -1.072936, 0, 1, 0.345098, 1,
-0.3004699, -2.337002, -3.663803, 0, 1, 0.3529412, 1,
-0.2961141, 0.4106241, -0.9295133, 0, 1, 0.3568628, 1,
-0.2948207, 0.9602675, -0.1851082, 0, 1, 0.3647059, 1,
-0.2899165, -1.573412, -1.5623, 0, 1, 0.3686275, 1,
-0.2892885, -0.0658721, -1.089043, 0, 1, 0.3764706, 1,
-0.2824086, 0.7790281, 1.095937, 0, 1, 0.3803922, 1,
-0.2755733, 0.4056326, -2.52359, 0, 1, 0.3882353, 1,
-0.2750616, -0.9284909, -2.982486, 0, 1, 0.3921569, 1,
-0.2700269, 0.06192749, -2.901196, 0, 1, 0.4, 1,
-0.2679147, -0.2736688, -3.518631, 0, 1, 0.4078431, 1,
-0.2526463, 0.6199338, -1.562108, 0, 1, 0.4117647, 1,
-0.252336, 0.00297322, -1.473538, 0, 1, 0.4196078, 1,
-0.2518346, -1.081453, -3.920223, 0, 1, 0.4235294, 1,
-0.2431952, 0.3857757, -0.4056807, 0, 1, 0.4313726, 1,
-0.2408083, 0.5783398, -0.8218164, 0, 1, 0.4352941, 1,
-0.2386537, 0.2437688, -1.704504, 0, 1, 0.4431373, 1,
-0.2315921, 0.73159, -0.3242786, 0, 1, 0.4470588, 1,
-0.2281823, 0.5762184, -0.2140576, 0, 1, 0.454902, 1,
-0.2255484, -0.08840249, -2.299436, 0, 1, 0.4588235, 1,
-0.2227892, 0.105152, -0.8107858, 0, 1, 0.4666667, 1,
-0.2220325, 0.2537201, 1.241882, 0, 1, 0.4705882, 1,
-0.2208993, 1.776641, -0.2904084, 0, 1, 0.4784314, 1,
-0.220478, -0.1353197, -2.025892, 0, 1, 0.4823529, 1,
-0.2149235, 0.687969, 1.101835, 0, 1, 0.4901961, 1,
-0.2148775, -0.5353647, -3.269942, 0, 1, 0.4941176, 1,
-0.2140344, 0.6650189, 0.5843829, 0, 1, 0.5019608, 1,
-0.2128724, -0.497953, -2.363163, 0, 1, 0.509804, 1,
-0.2048974, 0.1369097, 0.7370602, 0, 1, 0.5137255, 1,
-0.2038819, -0.457395, -3.424451, 0, 1, 0.5215687, 1,
-0.2007508, 1.379622, 0.7672329, 0, 1, 0.5254902, 1,
-0.1971162, 0.7860551, -0.1599508, 0, 1, 0.5333334, 1,
-0.1931017, -0.5322848, -2.15059, 0, 1, 0.5372549, 1,
-0.192755, 0.7382163, -0.602977, 0, 1, 0.5450981, 1,
-0.1883833, -0.3172856, -4.104786, 0, 1, 0.5490196, 1,
-0.18424, 0.09836057, -0.7165926, 0, 1, 0.5568628, 1,
-0.182258, -0.1322532, -3.071228, 0, 1, 0.5607843, 1,
-0.1821954, 0.3863998, -0.6734614, 0, 1, 0.5686275, 1,
-0.1815538, 0.2579996, 0.1777908, 0, 1, 0.572549, 1,
-0.1806004, -0.8655749, -2.909599, 0, 1, 0.5803922, 1,
-0.1722115, -0.1564263, -2.497918, 0, 1, 0.5843138, 1,
-0.1718257, -0.5369775, -2.639092, 0, 1, 0.5921569, 1,
-0.1692942, -1.40793, -3.569724, 0, 1, 0.5960785, 1,
-0.1657259, 0.8050995, -0.6111075, 0, 1, 0.6039216, 1,
-0.1641541, -0.474411, -3.754039, 0, 1, 0.6117647, 1,
-0.164101, -1.600075, -2.444733, 0, 1, 0.6156863, 1,
-0.1639445, 1.220438, -0.1288419, 0, 1, 0.6235294, 1,
-0.1631602, 1.248708, -1.064901, 0, 1, 0.627451, 1,
-0.159758, -0.2630422, -1.809492, 0, 1, 0.6352941, 1,
-0.1563533, 1.379071, -0.7338699, 0, 1, 0.6392157, 1,
-0.1550018, -0.9562694, -4.050507, 0, 1, 0.6470588, 1,
-0.1540203, -0.8772812, -2.854048, 0, 1, 0.6509804, 1,
-0.1538815, -1.87964, -3.508816, 0, 1, 0.6588235, 1,
-0.1535802, -1.033705, -3.530045, 0, 1, 0.6627451, 1,
-0.1502119, -1.531927, -3.175068, 0, 1, 0.6705883, 1,
-0.1486859, -2.918545, -4.051317, 0, 1, 0.6745098, 1,
-0.1476651, 1.727597, 0.8997605, 0, 1, 0.682353, 1,
-0.1473853, -1.227408, -3.285254, 0, 1, 0.6862745, 1,
-0.1450686, 1.6286, -1.969888, 0, 1, 0.6941177, 1,
-0.1442265, 0.5821024, -0.4409526, 0, 1, 0.7019608, 1,
-0.1392552, -1.036783, -2.098982, 0, 1, 0.7058824, 1,
-0.1321398, -0.2389922, -0.8826832, 0, 1, 0.7137255, 1,
-0.1302578, 0.4850462, 1.737485, 0, 1, 0.7176471, 1,
-0.1289536, -1.202644, -3.114093, 0, 1, 0.7254902, 1,
-0.1248982, 0.7866494, -1.07967, 0, 1, 0.7294118, 1,
-0.1244706, -0.5420709, -2.148313, 0, 1, 0.7372549, 1,
-0.1155146, 1.565172, 2.194276, 0, 1, 0.7411765, 1,
-0.1150797, -0.8972673, -3.325634, 0, 1, 0.7490196, 1,
-0.1139039, 2.137976, -0.1679948, 0, 1, 0.7529412, 1,
-0.1098967, -1.675694, -4.149858, 0, 1, 0.7607843, 1,
-0.1086168, -0.4828213, -3.579789, 0, 1, 0.7647059, 1,
-0.1082236, -0.1997003, -1.511922, 0, 1, 0.772549, 1,
-0.1063593, -0.01578639, -1.243534, 0, 1, 0.7764706, 1,
-0.1041237, -0.3445007, -3.132753, 0, 1, 0.7843137, 1,
-0.1024796, 0.8151124, -1.221624, 0, 1, 0.7882353, 1,
-0.1019658, -1.088586, -4.363024, 0, 1, 0.7960784, 1,
-0.09805278, -0.7149792, -3.349421, 0, 1, 0.8039216, 1,
-0.09589823, 0.7954972, -0.3335152, 0, 1, 0.8078431, 1,
-0.09095225, 1.131733, 0.687243, 0, 1, 0.8156863, 1,
-0.08911764, -1.111175, -2.875373, 0, 1, 0.8196079, 1,
-0.08875667, -0.1586291, -3.914028, 0, 1, 0.827451, 1,
-0.08550164, 0.4877543, 0.3302102, 0, 1, 0.8313726, 1,
-0.08326064, 0.5487503, 0.06952115, 0, 1, 0.8392157, 1,
-0.08024517, -0.7496103, -2.89877, 0, 1, 0.8431373, 1,
-0.07898962, 1.33438, -1.445134, 0, 1, 0.8509804, 1,
-0.07847139, -0.6519176, -1.58106, 0, 1, 0.854902, 1,
-0.07528724, -0.6146321, -2.619722, 0, 1, 0.8627451, 1,
-0.07115479, 1.487281, -0.09577961, 0, 1, 0.8666667, 1,
-0.07087851, 0.2627933, -0.04108939, 0, 1, 0.8745098, 1,
-0.06994559, 1.118571, -1.873668, 0, 1, 0.8784314, 1,
-0.06946518, 1.101031, -0.402874, 0, 1, 0.8862745, 1,
-0.06940524, 0.524583, 0.176227, 0, 1, 0.8901961, 1,
-0.06205157, -0.2812527, -2.396382, 0, 1, 0.8980392, 1,
-0.06203496, 0.4081278, -0.4739192, 0, 1, 0.9058824, 1,
-0.06144127, -0.5198804, -2.892207, 0, 1, 0.9098039, 1,
-0.05797502, 0.3793438, -0.7148907, 0, 1, 0.9176471, 1,
-0.05409649, -0.6687767, -3.710575, 0, 1, 0.9215686, 1,
-0.05308838, -0.3341213, -1.941727, 0, 1, 0.9294118, 1,
-0.05268754, 0.9365631, 0.8508002, 0, 1, 0.9333333, 1,
-0.0507557, -0.8044465, -3.275611, 0, 1, 0.9411765, 1,
-0.04652272, -0.1366902, -2.249563, 0, 1, 0.945098, 1,
-0.04592024, -2.860133, -3.9038, 0, 1, 0.9529412, 1,
-0.03908024, -0.6058318, -2.452814, 0, 1, 0.9568627, 1,
-0.03757155, -1.918442, -3.545477, 0, 1, 0.9647059, 1,
-0.03649367, -1.66859, -2.306271, 0, 1, 0.9686275, 1,
-0.03059668, 0.5526361, -0.8876251, 0, 1, 0.9764706, 1,
-0.02672848, -0.2999801, -2.718426, 0, 1, 0.9803922, 1,
-0.02164887, 0.3652173, -0.6688524, 0, 1, 0.9882353, 1,
-0.01939712, 0.3822414, 0.0008235503, 0, 1, 0.9921569, 1,
-0.01674022, 0.05894859, 0.5293209, 0, 1, 1, 1,
-0.0163377, 0.4775317, -2.877953, 0, 0.9921569, 1, 1,
-0.01254129, 1.029847, -0.04895116, 0, 0.9882353, 1, 1,
-0.00814267, 0.460676, 0.6399269, 0, 0.9803922, 1, 1,
-0.006355502, -0.7305253, -2.165944, 0, 0.9764706, 1, 1,
-0.006017292, 1.240171, 0.4281734, 0, 0.9686275, 1, 1,
0.0008726442, -0.271335, 4.940978, 0, 0.9647059, 1, 1,
0.008897052, 0.01558047, 0.8240181, 0, 0.9568627, 1, 1,
0.009208119, -0.7434007, 3.339285, 0, 0.9529412, 1, 1,
0.01361617, 0.1319329, 0.5909714, 0, 0.945098, 1, 1,
0.014354, 1.032627, 0.2251901, 0, 0.9411765, 1, 1,
0.01786998, 1.770752, 1.386365, 0, 0.9333333, 1, 1,
0.02052146, 0.1795773, 0.7120554, 0, 0.9294118, 1, 1,
0.02060349, 0.9062207, 1.605876, 0, 0.9215686, 1, 1,
0.0224702, -0.1034971, 4.270708, 0, 0.9176471, 1, 1,
0.02392429, -1.049768, 3.323479, 0, 0.9098039, 1, 1,
0.02755719, -0.233689, 1.914079, 0, 0.9058824, 1, 1,
0.03591881, 2.000557, 1.060269, 0, 0.8980392, 1, 1,
0.0360111, -0.4167936, 1.947071, 0, 0.8901961, 1, 1,
0.03604016, -3.256927, 2.428061, 0, 0.8862745, 1, 1,
0.03617575, 0.3975601, -1.095055, 0, 0.8784314, 1, 1,
0.03907828, -1.044455, 2.791242, 0, 0.8745098, 1, 1,
0.04263872, -0.6251071, 2.421026, 0, 0.8666667, 1, 1,
0.04482955, -1.314697, 4.507922, 0, 0.8627451, 1, 1,
0.04860589, 2.319771, -0.847944, 0, 0.854902, 1, 1,
0.05019682, -0.8768237, 2.331071, 0, 0.8509804, 1, 1,
0.05269063, -0.1620174, 1.338423, 0, 0.8431373, 1, 1,
0.0544309, -0.3012765, 4.85221, 0, 0.8392157, 1, 1,
0.05700899, -0.9088989, 3.440561, 0, 0.8313726, 1, 1,
0.05788938, 1.124567, -0.7428319, 0, 0.827451, 1, 1,
0.05995094, 0.5465977, 1.059753, 0, 0.8196079, 1, 1,
0.06051102, 0.2137589, -1.058654, 0, 0.8156863, 1, 1,
0.06061246, -0.1863008, 0.6410167, 0, 0.8078431, 1, 1,
0.06111915, -0.3479042, 2.116008, 0, 0.8039216, 1, 1,
0.06785201, 0.6855398, 0.1152141, 0, 0.7960784, 1, 1,
0.06804825, -0.04249182, 1.106785, 0, 0.7882353, 1, 1,
0.07207391, 2.161895, 1.182984, 0, 0.7843137, 1, 1,
0.07258661, 0.5953344, 0.7579527, 0, 0.7764706, 1, 1,
0.07417529, -0.5195827, 3.45295, 0, 0.772549, 1, 1,
0.08049534, -0.06392778, 3.373641, 0, 0.7647059, 1, 1,
0.08476111, 0.06990834, -0.625713, 0, 0.7607843, 1, 1,
0.08816946, 0.3231939, 0.006744427, 0, 0.7529412, 1, 1,
0.08826776, 0.6818601, -1.243648, 0, 0.7490196, 1, 1,
0.09024545, -0.7818219, 2.078341, 0, 0.7411765, 1, 1,
0.09298459, 0.2302687, -0.4950111, 0, 0.7372549, 1, 1,
0.0985513, 1.055017, 1.643865, 0, 0.7294118, 1, 1,
0.1035208, 0.7264506, 1.370156, 0, 0.7254902, 1, 1,
0.107085, -0.4448434, 3.358902, 0, 0.7176471, 1, 1,
0.1079791, 0.2295107, 0.5771925, 0, 0.7137255, 1, 1,
0.1123488, 0.04226884, 1.659609, 0, 0.7058824, 1, 1,
0.1217933, 0.8377348, 1.473818, 0, 0.6980392, 1, 1,
0.1218088, 0.1339971, 0.08674995, 0, 0.6941177, 1, 1,
0.1264257, 2.625254, -0.3366251, 0, 0.6862745, 1, 1,
0.1292936, -0.2839198, 2.192189, 0, 0.682353, 1, 1,
0.1325493, 0.8102817, 0.3616421, 0, 0.6745098, 1, 1,
0.1334312, 0.1708531, 0.7519103, 0, 0.6705883, 1, 1,
0.1368752, 1.586825, 1.519825, 0, 0.6627451, 1, 1,
0.138647, -0.5646008, 2.037913, 0, 0.6588235, 1, 1,
0.1443428, -0.1619815, 0.3919323, 0, 0.6509804, 1, 1,
0.1494323, -1.2041, 3.581156, 0, 0.6470588, 1, 1,
0.1500785, -0.3810948, 2.39887, 0, 0.6392157, 1, 1,
0.1506695, -0.8366456, 2.740216, 0, 0.6352941, 1, 1,
0.1510457, -0.6418468, 2.826292, 0, 0.627451, 1, 1,
0.1513173, -1.189046, 1.836048, 0, 0.6235294, 1, 1,
0.1551785, -0.696937, 4.604568, 0, 0.6156863, 1, 1,
0.1612599, -0.1547635, 2.460471, 0, 0.6117647, 1, 1,
0.1719497, 1.433458, 0.3123917, 0, 0.6039216, 1, 1,
0.1785625, -0.4765323, 2.739722, 0, 0.5960785, 1, 1,
0.1806199, 0.006073087, 1.426307, 0, 0.5921569, 1, 1,
0.180646, -0.5859594, 2.749149, 0, 0.5843138, 1, 1,
0.1856274, -0.08854932, 2.270437, 0, 0.5803922, 1, 1,
0.187228, -0.3034264, 2.26532, 0, 0.572549, 1, 1,
0.1880392, 1.389285, 0.68419, 0, 0.5686275, 1, 1,
0.1889227, 0.2042712, 1.262715, 0, 0.5607843, 1, 1,
0.1904129, 0.5961444, 2.683682, 0, 0.5568628, 1, 1,
0.1920461, -1.298428, 3.412519, 0, 0.5490196, 1, 1,
0.2013896, 1.123027, -0.4264603, 0, 0.5450981, 1, 1,
0.20225, -0.7260165, 1.358461, 0, 0.5372549, 1, 1,
0.2038817, -0.6602566, 3.42339, 0, 0.5333334, 1, 1,
0.2048644, 0.6809458, 0.3448225, 0, 0.5254902, 1, 1,
0.2057085, -1.79806, 2.370213, 0, 0.5215687, 1, 1,
0.2102027, -0.2562544, 2.010681, 0, 0.5137255, 1, 1,
0.2119576, -0.2846055, 0.5688395, 0, 0.509804, 1, 1,
0.2128393, 2.574148, 0.9546433, 0, 0.5019608, 1, 1,
0.2135136, 0.6936237, -0.7577572, 0, 0.4941176, 1, 1,
0.216247, -0.1028806, 1.971459, 0, 0.4901961, 1, 1,
0.2210375, -0.2033456, 2.115784, 0, 0.4823529, 1, 1,
0.2225125, -2.546868, 2.850883, 0, 0.4784314, 1, 1,
0.2247917, -0.601108, 5.396826, 0, 0.4705882, 1, 1,
0.2321404, -1.752378, 3.967633, 0, 0.4666667, 1, 1,
0.2323969, 0.2092623, 1.924967, 0, 0.4588235, 1, 1,
0.2335298, 0.7189806, -0.4785499, 0, 0.454902, 1, 1,
0.2335472, 0.32793, 0.8125992, 0, 0.4470588, 1, 1,
0.2397878, 0.4574223, 1.211605, 0, 0.4431373, 1, 1,
0.2411527, -1.018316, 4.014676, 0, 0.4352941, 1, 1,
0.2431873, -0.9687542, 1.443481, 0, 0.4313726, 1, 1,
0.2471533, 1.958246, 1.107952, 0, 0.4235294, 1, 1,
0.2485948, 0.7744785, 1.203101, 0, 0.4196078, 1, 1,
0.2533319, 1.507383, -0.3781159, 0, 0.4117647, 1, 1,
0.253399, 1.688931, 1.395977, 0, 0.4078431, 1, 1,
0.2550872, -0.2118848, 2.860091, 0, 0.4, 1, 1,
0.2568872, 0.6818527, 0.0262791, 0, 0.3921569, 1, 1,
0.2572228, -0.2835664, 1.046161, 0, 0.3882353, 1, 1,
0.25745, -2.026988, 1.445747, 0, 0.3803922, 1, 1,
0.2594394, 1.390189, 0.8607289, 0, 0.3764706, 1, 1,
0.2637802, -1.176608, 3.408766, 0, 0.3686275, 1, 1,
0.2675198, 0.1222607, 1.4996, 0, 0.3647059, 1, 1,
0.2682578, 0.5999885, 0.139287, 0, 0.3568628, 1, 1,
0.2684672, -0.8454083, 2.491294, 0, 0.3529412, 1, 1,
0.2732423, 1.341789, 1.181644, 0, 0.345098, 1, 1,
0.2733191, -1.604082, 3.726923, 0, 0.3411765, 1, 1,
0.2755374, -0.650065, 2.309527, 0, 0.3333333, 1, 1,
0.2794781, -1.208224, 1.698946, 0, 0.3294118, 1, 1,
0.2806376, 0.7766263, 0.9349087, 0, 0.3215686, 1, 1,
0.2811966, 1.135554, 0.6423545, 0, 0.3176471, 1, 1,
0.2817495, -0.2066394, 3.024482, 0, 0.3098039, 1, 1,
0.2829236, 0.4268388, 1.36998, 0, 0.3058824, 1, 1,
0.2918514, -0.2691031, 1.976863, 0, 0.2980392, 1, 1,
0.2929856, -1.016262, 3.024344, 0, 0.2901961, 1, 1,
0.2932905, 1.31668, 0.5970051, 0, 0.2862745, 1, 1,
0.2940696, 0.8755651, -1.012369, 0, 0.2784314, 1, 1,
0.2966382, 1.770496, 0.4291008, 0, 0.2745098, 1, 1,
0.2971874, 0.4508474, 0.8702689, 0, 0.2666667, 1, 1,
0.2998275, 0.808392, 0.5432202, 0, 0.2627451, 1, 1,
0.3031518, 0.9846007, 1.423689, 0, 0.254902, 1, 1,
0.307327, 0.8693866, -0.05805136, 0, 0.2509804, 1, 1,
0.3076821, 0.9305991, -0.5659072, 0, 0.2431373, 1, 1,
0.3082173, -0.5602103, 2.430027, 0, 0.2392157, 1, 1,
0.3116582, 0.5203017, -0.2454899, 0, 0.2313726, 1, 1,
0.3131393, 0.06568182, -1.03937, 0, 0.227451, 1, 1,
0.3141596, -1.311463, 4.202304, 0, 0.2196078, 1, 1,
0.3151981, -0.6496044, 3.509281, 0, 0.2156863, 1, 1,
0.3167176, -0.5554424, 1.790784, 0, 0.2078431, 1, 1,
0.3171772, 0.4245565, 0.3757178, 0, 0.2039216, 1, 1,
0.3176173, -1.093881, 3.156299, 0, 0.1960784, 1, 1,
0.3208083, -0.5989882, 2.624034, 0, 0.1882353, 1, 1,
0.3290205, -0.0601992, 2.246222, 0, 0.1843137, 1, 1,
0.3378753, -0.7598537, 1.796144, 0, 0.1764706, 1, 1,
0.3398942, -0.2137444, 3.140794, 0, 0.172549, 1, 1,
0.3422994, 0.4427001, 1.49302, 0, 0.1647059, 1, 1,
0.343099, 0.3381184, 1.57618, 0, 0.1607843, 1, 1,
0.3479672, -1.747718, 4.138969, 0, 0.1529412, 1, 1,
0.3480106, -0.05718812, 2.1095, 0, 0.1490196, 1, 1,
0.3515027, 0.5841115, 0.7440022, 0, 0.1411765, 1, 1,
0.3518675, -0.3684612, 2.508375, 0, 0.1372549, 1, 1,
0.3533034, -0.9591064, 2.705176, 0, 0.1294118, 1, 1,
0.3589757, 0.33497, 0.7707554, 0, 0.1254902, 1, 1,
0.3603877, -0.05913486, 1.182073, 0, 0.1176471, 1, 1,
0.3613952, -0.2240552, 0.926271, 0, 0.1137255, 1, 1,
0.3763393, -1.896598, 4.051216, 0, 0.1058824, 1, 1,
0.3838469, 1.261402, -0.6967477, 0, 0.09803922, 1, 1,
0.3850496, -0.9988784, 3.773042, 0, 0.09411765, 1, 1,
0.3853373, -0.8993549, 1.515482, 0, 0.08627451, 1, 1,
0.3856285, -0.1308041, 1.169785, 0, 0.08235294, 1, 1,
0.385951, 0.03298081, 1.501682, 0, 0.07450981, 1, 1,
0.3890931, -1.345087, 2.716903, 0, 0.07058824, 1, 1,
0.3951552, -0.4777192, 1.505936, 0, 0.0627451, 1, 1,
0.4060043, 0.9885338, 0.2341218, 0, 0.05882353, 1, 1,
0.4107442, 1.452652, 1.432853, 0, 0.05098039, 1, 1,
0.4151075, 1.145877, -0.9544999, 0, 0.04705882, 1, 1,
0.4174546, 0.4507495, -1.018572, 0, 0.03921569, 1, 1,
0.4263136, 0.8600258, 0.2653121, 0, 0.03529412, 1, 1,
0.4279945, 2.802445, 2.088165, 0, 0.02745098, 1, 1,
0.4296207, -0.9195799, 1.090058, 0, 0.02352941, 1, 1,
0.4296297, -0.2461535, 1.584481, 0, 0.01568628, 1, 1,
0.4299145, -1.444348, 3.328047, 0, 0.01176471, 1, 1,
0.4346191, -0.73094, 2.125842, 0, 0.003921569, 1, 1,
0.4347159, -0.6838553, 3.016455, 0.003921569, 0, 1, 1,
0.4351816, 1.00607, -0.5613225, 0.007843138, 0, 1, 1,
0.4356661, 1.343305, 0.6986472, 0.01568628, 0, 1, 1,
0.437417, 0.3537618, 0.6528115, 0.01960784, 0, 1, 1,
0.4377894, -0.2505912, 1.684977, 0.02745098, 0, 1, 1,
0.4403127, -1.300564, 2.966371, 0.03137255, 0, 1, 1,
0.4469399, -0.74297, 2.339567, 0.03921569, 0, 1, 1,
0.4490944, 1.258036, 2.032407, 0.04313726, 0, 1, 1,
0.4542898, 1.125352, -0.3496816, 0.05098039, 0, 1, 1,
0.4551883, -0.8644357, 2.889043, 0.05490196, 0, 1, 1,
0.4562339, -0.2807419, 1.506815, 0.0627451, 0, 1, 1,
0.4634564, 0.8761377, 0.4146492, 0.06666667, 0, 1, 1,
0.46992, -0.7752312, 1.790349, 0.07450981, 0, 1, 1,
0.4713168, 0.2120125, 1.425905, 0.07843138, 0, 1, 1,
0.4725272, 1.964074, 0.8632632, 0.08627451, 0, 1, 1,
0.4729257, -0.9701166, 2.874613, 0.09019608, 0, 1, 1,
0.4738024, 0.2032712, 2.042598, 0.09803922, 0, 1, 1,
0.4777811, -0.2230639, 2.824048, 0.1058824, 0, 1, 1,
0.4782926, 1.510748, 0.03885642, 0.1098039, 0, 1, 1,
0.4851987, -1.065009, 4.065206, 0.1176471, 0, 1, 1,
0.4852445, -0.1941797, 2.153013, 0.1215686, 0, 1, 1,
0.4866595, -0.3094081, 2.248444, 0.1294118, 0, 1, 1,
0.4868486, 1.590605, -0.1527662, 0.1333333, 0, 1, 1,
0.4895173, 0.1626184, -0.2388234, 0.1411765, 0, 1, 1,
0.4905089, -1.507854, 2.123935, 0.145098, 0, 1, 1,
0.5014337, 0.1411757, 1.957435, 0.1529412, 0, 1, 1,
0.5020677, 0.09247147, 0.8422774, 0.1568628, 0, 1, 1,
0.5041232, 0.3998859, 0.05848728, 0.1647059, 0, 1, 1,
0.5065988, 0.6152168, 1.752852, 0.1686275, 0, 1, 1,
0.5091473, 1.525728, -0.947856, 0.1764706, 0, 1, 1,
0.5113717, 0.1336195, 0.03628651, 0.1803922, 0, 1, 1,
0.5184941, 1.457948, 1.316623, 0.1882353, 0, 1, 1,
0.5189356, -1.313461, 3.150226, 0.1921569, 0, 1, 1,
0.5194348, -0.9863196, 0.8982991, 0.2, 0, 1, 1,
0.5225555, 0.511034, 1.517349, 0.2078431, 0, 1, 1,
0.5237187, -0.3795753, 4.467296, 0.2117647, 0, 1, 1,
0.5237368, -1.697637, 3.551802, 0.2196078, 0, 1, 1,
0.5297061, -0.3105841, 2.264881, 0.2235294, 0, 1, 1,
0.5304772, -0.8933592, 2.885283, 0.2313726, 0, 1, 1,
0.5319192, -1.219248, 2.999743, 0.2352941, 0, 1, 1,
0.5319822, 0.05167346, 1.767379, 0.2431373, 0, 1, 1,
0.533419, 1.592808, -0.3269651, 0.2470588, 0, 1, 1,
0.5442354, 1.11292, 0.8378919, 0.254902, 0, 1, 1,
0.5475073, 0.8278544, -0.6798704, 0.2588235, 0, 1, 1,
0.5513328, 0.5615039, 0.08931253, 0.2666667, 0, 1, 1,
0.5524523, -0.5291478, 1.552732, 0.2705882, 0, 1, 1,
0.5525028, -0.4915117, 2.919817, 0.2784314, 0, 1, 1,
0.5559791, -0.2527674, 2.124105, 0.282353, 0, 1, 1,
0.5580074, -0.3163738, 2.054306, 0.2901961, 0, 1, 1,
0.5603623, -3.565942, 2.212982, 0.2941177, 0, 1, 1,
0.5633744, -1.963612, 2.340215, 0.3019608, 0, 1, 1,
0.5643397, -1.157934, 2.957541, 0.3098039, 0, 1, 1,
0.5666916, 0.9313862, 0.6506471, 0.3137255, 0, 1, 1,
0.5675268, 0.4860876, 0.2781431, 0.3215686, 0, 1, 1,
0.5772212, 0.468192, 1.088015, 0.3254902, 0, 1, 1,
0.5789094, -0.956348, 2.51159, 0.3333333, 0, 1, 1,
0.5797249, -0.2280161, 2.132841, 0.3372549, 0, 1, 1,
0.5807848, 0.04766181, 2.645637, 0.345098, 0, 1, 1,
0.5835349, -1.405477, 3.435348, 0.3490196, 0, 1, 1,
0.5844867, 2.121431, 2.167788, 0.3568628, 0, 1, 1,
0.5927708, 1.460559, 0.4135633, 0.3607843, 0, 1, 1,
0.594439, -0.886739, 3.580454, 0.3686275, 0, 1, 1,
0.594865, -0.8629307, 4.853127, 0.372549, 0, 1, 1,
0.5986404, -0.2885562, 2.507338, 0.3803922, 0, 1, 1,
0.5989333, 0.7604763, 0.7439925, 0.3843137, 0, 1, 1,
0.6001549, 0.2827044, 1.37713, 0.3921569, 0, 1, 1,
0.6058129, -0.03901009, 2.359392, 0.3960784, 0, 1, 1,
0.6072922, 0.4790006, 0.3356768, 0.4039216, 0, 1, 1,
0.6162238, 1.18388, -0.1798331, 0.4117647, 0, 1, 1,
0.6187443, 0.5479804, 1.145305, 0.4156863, 0, 1, 1,
0.6204275, -0.6205088, 3.783707, 0.4235294, 0, 1, 1,
0.6286741, -0.6600088, 1.582792, 0.427451, 0, 1, 1,
0.6351868, 1.043753, 0.06846102, 0.4352941, 0, 1, 1,
0.6356358, -0.1341229, 2.654488, 0.4392157, 0, 1, 1,
0.6365577, 1.237582, 0.3581716, 0.4470588, 0, 1, 1,
0.6377256, 0.1704597, 0.5588402, 0.4509804, 0, 1, 1,
0.6388893, -0.2271294, 2.433557, 0.4588235, 0, 1, 1,
0.6454608, -1.150781, 2.129182, 0.4627451, 0, 1, 1,
0.6458778, 0.6700212, 0.6877538, 0.4705882, 0, 1, 1,
0.6477339, 0.7240408, 2.029685, 0.4745098, 0, 1, 1,
0.6506005, -0.2759553, 1.521094, 0.4823529, 0, 1, 1,
0.653437, -0.5618316, 1.640653, 0.4862745, 0, 1, 1,
0.658252, -1.576011, 4.084437, 0.4941176, 0, 1, 1,
0.6611559, -0.9311528, 3.534497, 0.5019608, 0, 1, 1,
0.671463, -0.7539499, 2.626904, 0.5058824, 0, 1, 1,
0.6766879, -0.413663, 1.913618, 0.5137255, 0, 1, 1,
0.6772693, 2.225538, 2.029635, 0.5176471, 0, 1, 1,
0.6803918, -0.2509727, 2.10984, 0.5254902, 0, 1, 1,
0.6809782, -0.8454949, 1.413002, 0.5294118, 0, 1, 1,
0.6835003, -0.764461, 2.855585, 0.5372549, 0, 1, 1,
0.684634, 1.239908, -0.639988, 0.5411765, 0, 1, 1,
0.6854066, -0.2816968, 3.26354, 0.5490196, 0, 1, 1,
0.6891086, 1.630126, 0.7580098, 0.5529412, 0, 1, 1,
0.696448, 0.09670945, 0.4776372, 0.5607843, 0, 1, 1,
0.7032264, -1.147435, 3.203341, 0.5647059, 0, 1, 1,
0.7086507, 0.2878052, 1.328048, 0.572549, 0, 1, 1,
0.7124846, 2.09596, -2.408905, 0.5764706, 0, 1, 1,
0.7144828, 0.3784935, 0.5203648, 0.5843138, 0, 1, 1,
0.7195938, 1.113632, -0.04013042, 0.5882353, 0, 1, 1,
0.72708, -0.928654, 2.446696, 0.5960785, 0, 1, 1,
0.7317448, 1.354663, -0.08328274, 0.6039216, 0, 1, 1,
0.7341236, -0.1508796, 1.564928, 0.6078432, 0, 1, 1,
0.7408623, 1.963456, 2.2034, 0.6156863, 0, 1, 1,
0.7420928, -0.3717348, 2.355885, 0.6196079, 0, 1, 1,
0.7437922, 0.5349343, 0.6681216, 0.627451, 0, 1, 1,
0.7438096, -0.09698919, 3.864247, 0.6313726, 0, 1, 1,
0.7446933, 0.3410824, 1.041424, 0.6392157, 0, 1, 1,
0.7466562, -0.8565586, 2.601631, 0.6431373, 0, 1, 1,
0.7599149, -1.280731, 1.804083, 0.6509804, 0, 1, 1,
0.7600732, -0.4052195, 1.118678, 0.654902, 0, 1, 1,
0.7608594, -0.3786038, 1.497674, 0.6627451, 0, 1, 1,
0.7655409, 0.3741693, -0.6006065, 0.6666667, 0, 1, 1,
0.7690179, 0.6888646, 2.073375, 0.6745098, 0, 1, 1,
0.7706028, 1.144295, -0.5260217, 0.6784314, 0, 1, 1,
0.7734829, 0.7407916, 0.4396988, 0.6862745, 0, 1, 1,
0.7737687, 0.5928766, 2.239946, 0.6901961, 0, 1, 1,
0.7767275, -1.313994, 1.063293, 0.6980392, 0, 1, 1,
0.780718, 1.050772, -1.109726, 0.7058824, 0, 1, 1,
0.7809467, 1.087205, 0.08761109, 0.7098039, 0, 1, 1,
0.7834321, -0.2068139, -0.6770684, 0.7176471, 0, 1, 1,
0.7840914, -0.3056751, 2.555237, 0.7215686, 0, 1, 1,
0.7843257, 2.099482, 1.496758, 0.7294118, 0, 1, 1,
0.7903062, 0.5101386, 2.227705, 0.7333333, 0, 1, 1,
0.7939541, -0.6736047, 0.4806477, 0.7411765, 0, 1, 1,
0.7970867, 0.6995928, 0.07852628, 0.7450981, 0, 1, 1,
0.8029715, 0.8760468, 0.9292957, 0.7529412, 0, 1, 1,
0.8100911, -0.25568, 1.258212, 0.7568628, 0, 1, 1,
0.8198408, -0.09027449, 1.795509, 0.7647059, 0, 1, 1,
0.8267982, -0.9305515, 2.42298, 0.7686275, 0, 1, 1,
0.8288261, -1.078768, 3.007035, 0.7764706, 0, 1, 1,
0.8310328, 2.318493, 0.4785818, 0.7803922, 0, 1, 1,
0.8354774, 0.8804685, 0.8127645, 0.7882353, 0, 1, 1,
0.8379766, -0.3767129, 0.9351768, 0.7921569, 0, 1, 1,
0.8405546, -0.3364839, 3.550535, 0.8, 0, 1, 1,
0.8428177, -0.7132379, 1.25779, 0.8078431, 0, 1, 1,
0.8496674, 1.380778, 0.0588803, 0.8117647, 0, 1, 1,
0.8503841, 0.8070315, -0.4216161, 0.8196079, 0, 1, 1,
0.8623293, -1.252201, 2.211157, 0.8235294, 0, 1, 1,
0.8639528, 1.141411, 1.27767, 0.8313726, 0, 1, 1,
0.86415, -0.141267, 2.631731, 0.8352941, 0, 1, 1,
0.8644079, -0.8240241, 3.655169, 0.8431373, 0, 1, 1,
0.8661838, -0.1564468, 0.8184522, 0.8470588, 0, 1, 1,
0.871395, -0.849652, 1.156897, 0.854902, 0, 1, 1,
0.8756918, -1.18617, 2.798648, 0.8588235, 0, 1, 1,
0.8845232, -0.2455866, 1.93076, 0.8666667, 0, 1, 1,
0.8893606, -2.157352, 2.35854, 0.8705882, 0, 1, 1,
0.8942626, -2.072434, 3.706822, 0.8784314, 0, 1, 1,
0.9031462, 1.130502, 1.140503, 0.8823529, 0, 1, 1,
0.9033564, 0.9487138, 1.61036, 0.8901961, 0, 1, 1,
0.9151112, 0.9837312, 1.043527, 0.8941177, 0, 1, 1,
0.9170889, 1.082917, 1.134661, 0.9019608, 0, 1, 1,
0.9191879, -1.762694, 2.506347, 0.9098039, 0, 1, 1,
0.9194047, -1.273906, 2.900058, 0.9137255, 0, 1, 1,
0.9243619, -0.2718639, 1.617657, 0.9215686, 0, 1, 1,
0.9272629, -0.4592709, 4.107561, 0.9254902, 0, 1, 1,
0.9291236, 1.297205, 0.2579237, 0.9333333, 0, 1, 1,
0.9353662, 0.2661701, -0.6384596, 0.9372549, 0, 1, 1,
0.9391771, 0.4756968, 0.5750666, 0.945098, 0, 1, 1,
0.9399316, -0.357388, 2.371661, 0.9490196, 0, 1, 1,
0.9465429, -0.4810333, 0.6594281, 0.9568627, 0, 1, 1,
0.9515173, -0.2006319, 1.732298, 0.9607843, 0, 1, 1,
0.9518178, 0.4602228, 1.00761, 0.9686275, 0, 1, 1,
0.9585329, 1.053549, 0.08284233, 0.972549, 0, 1, 1,
0.9616515, 0.5793405, 0.7072868, 0.9803922, 0, 1, 1,
0.9635389, 1.026188, 0.5948688, 0.9843137, 0, 1, 1,
0.9668761, -0.5248072, 4.591914, 0.9921569, 0, 1, 1,
0.9691324, -0.1288171, 2.998079, 0.9960784, 0, 1, 1,
0.9692104, 1.447554, 1.588889, 1, 0, 0.9960784, 1,
0.971181, -1.802355, 1.954542, 1, 0, 0.9882353, 1,
0.9864479, 0.9470299, 1.677101, 1, 0, 0.9843137, 1,
0.9886298, 0.9243337, 0.6374117, 1, 0, 0.9764706, 1,
0.9906432, -0.9430588, 1.309115, 1, 0, 0.972549, 1,
0.9930588, 1.603926, 0.2799483, 1, 0, 0.9647059, 1,
0.9931779, 1.324017, 1.172147, 1, 0, 0.9607843, 1,
0.9962739, 0.7029756, 1.56039, 1, 0, 0.9529412, 1,
0.9965221, -0.7222613, 4.645993, 1, 0, 0.9490196, 1,
1.001562, -0.7335492, 3.253815, 1, 0, 0.9411765, 1,
1.01663, 1.200324, 0.03983782, 1, 0, 0.9372549, 1,
1.018313, 0.2435956, 2.42539, 1, 0, 0.9294118, 1,
1.020557, -0.1708719, 2.815477, 1, 0, 0.9254902, 1,
1.026315, 0.6286979, 1.675072, 1, 0, 0.9176471, 1,
1.026564, 2.406205, -0.3356489, 1, 0, 0.9137255, 1,
1.032817, 0.05289223, 2.40509, 1, 0, 0.9058824, 1,
1.057542, 0.516849, -0.4410856, 1, 0, 0.9019608, 1,
1.059299, 1.036926, 2.050514, 1, 0, 0.8941177, 1,
1.063797, 0.9776782, 0.5749758, 1, 0, 0.8862745, 1,
1.066701, 1.214372, 1.76785, 1, 0, 0.8823529, 1,
1.069206, 0.263416, 2.390056, 1, 0, 0.8745098, 1,
1.069566, -0.02759672, 3.268776, 1, 0, 0.8705882, 1,
1.073546, 0.2152637, 3.038424, 1, 0, 0.8627451, 1,
1.081339, -0.2594094, 2.42228, 1, 0, 0.8588235, 1,
1.082242, -0.4731397, 1.780739, 1, 0, 0.8509804, 1,
1.096744, -0.3542323, 1.555388, 1, 0, 0.8470588, 1,
1.104877, 0.2621065, 0.1973809, 1, 0, 0.8392157, 1,
1.115613, -1.417235, 2.615801, 1, 0, 0.8352941, 1,
1.120642, 0.6309795, 2.082115, 1, 0, 0.827451, 1,
1.122937, -0.4996652, 1.135539, 1, 0, 0.8235294, 1,
1.123741, -0.8215854, 0.2761645, 1, 0, 0.8156863, 1,
1.124898, 0.09192117, -0.3622311, 1, 0, 0.8117647, 1,
1.129094, 1.718711, 1.115391, 1, 0, 0.8039216, 1,
1.135669, -0.821839, 0.86115, 1, 0, 0.7960784, 1,
1.136139, 0.28411, 0.6313068, 1, 0, 0.7921569, 1,
1.136367, 0.9507076, -0.800009, 1, 0, 0.7843137, 1,
1.152888, 0.2134397, 2.140759, 1, 0, 0.7803922, 1,
1.154737, -0.9096807, 1.322894, 1, 0, 0.772549, 1,
1.159004, 0.8965393, 1.871777, 1, 0, 0.7686275, 1,
1.162067, -1.227917, 2.413644, 1, 0, 0.7607843, 1,
1.162891, 0.217056, 2.822502, 1, 0, 0.7568628, 1,
1.167847, 1.53524, 2.020533, 1, 0, 0.7490196, 1,
1.180508, -1.42802, 5.005678, 1, 0, 0.7450981, 1,
1.183514, 0.6148946, 1.652012, 1, 0, 0.7372549, 1,
1.187329, -0.8379011, 1.415465, 1, 0, 0.7333333, 1,
1.188805, -0.7593878, 1.59953, 1, 0, 0.7254902, 1,
1.195356, -1.764791, 3.197492, 1, 0, 0.7215686, 1,
1.195578, 0.4279309, 3.210969, 1, 0, 0.7137255, 1,
1.195794, -0.7273948, 3.276219, 1, 0, 0.7098039, 1,
1.209878, 0.9407221, -0.5366517, 1, 0, 0.7019608, 1,
1.214492, -1.374732, 3.648229, 1, 0, 0.6941177, 1,
1.214873, 1.667626, -0.2570907, 1, 0, 0.6901961, 1,
1.219188, -0.7815906, 1.945208, 1, 0, 0.682353, 1,
1.23513, 2.392363, 0.667579, 1, 0, 0.6784314, 1,
1.241799, 1.022792, -0.5475035, 1, 0, 0.6705883, 1,
1.256286, -1.718546, 3.412304, 1, 0, 0.6666667, 1,
1.25731, -0.1122443, 4.076554, 1, 0, 0.6588235, 1,
1.260317, 1.503435, 0.7251247, 1, 0, 0.654902, 1,
1.262466, -0.7540148, 0.4797705, 1, 0, 0.6470588, 1,
1.262472, 1.236624, 0.3610238, 1, 0, 0.6431373, 1,
1.264598, 0.1020594, 1.764372, 1, 0, 0.6352941, 1,
1.267796, -1.056987, 1.393415, 1, 0, 0.6313726, 1,
1.268595, -1.187184, 1.499206, 1, 0, 0.6235294, 1,
1.279284, 0.6321363, 2.469937, 1, 0, 0.6196079, 1,
1.280513, -1.015161, 3.099513, 1, 0, 0.6117647, 1,
1.28234, 0.9946212, 1.323625, 1, 0, 0.6078432, 1,
1.325774, -0.6112501, 2.129758, 1, 0, 0.6, 1,
1.326246, -0.04308131, 1.277119, 1, 0, 0.5921569, 1,
1.332132, 0.5218461, 1.424639, 1, 0, 0.5882353, 1,
1.336502, 0.6882687, 2.028544, 1, 0, 0.5803922, 1,
1.339209, 1.302906, 0.7292841, 1, 0, 0.5764706, 1,
1.346422, -0.1585318, -0.1575985, 1, 0, 0.5686275, 1,
1.348601, 2.090109, 1.577533, 1, 0, 0.5647059, 1,
1.358121, -0.3809102, 2.688118, 1, 0, 0.5568628, 1,
1.359701, -0.3024707, 1.323699, 1, 0, 0.5529412, 1,
1.36501, 1.313808, 0.6906641, 1, 0, 0.5450981, 1,
1.369552, 0.3037274, 1.526755, 1, 0, 0.5411765, 1,
1.382951, -0.2440437, 2.140892, 1, 0, 0.5333334, 1,
1.399591, -2.066909, 3.901799, 1, 0, 0.5294118, 1,
1.406426, 2.54906, 1.339427, 1, 0, 0.5215687, 1,
1.408556, -0.6752368, 3.846847, 1, 0, 0.5176471, 1,
1.409083, -0.994755, 2.787359, 1, 0, 0.509804, 1,
1.412211, 0.3621397, 1.488215, 1, 0, 0.5058824, 1,
1.412477, 1.704676, -0.2505789, 1, 0, 0.4980392, 1,
1.415917, -0.4973893, 1.070896, 1, 0, 0.4901961, 1,
1.429497, 0.7974651, 1.173049, 1, 0, 0.4862745, 1,
1.434443, 1.286961, 1.781846, 1, 0, 0.4784314, 1,
1.455807, -0.3724102, 2.564053, 1, 0, 0.4745098, 1,
1.474373, -0.1977564, 0.4178435, 1, 0, 0.4666667, 1,
1.474447, -1.717592, 3.069382, 1, 0, 0.4627451, 1,
1.483748, 0.9562451, 1.092327, 1, 0, 0.454902, 1,
1.484445, -0.3853753, 0.9642072, 1, 0, 0.4509804, 1,
1.488059, 0.178272, 1.706004, 1, 0, 0.4431373, 1,
1.495724, -1.703941, 0.708806, 1, 0, 0.4392157, 1,
1.500731, 0.0270197, 2.183995, 1, 0, 0.4313726, 1,
1.504423, 0.2407466, 1.378571, 1, 0, 0.427451, 1,
1.529786, -0.9995053, 0.3308323, 1, 0, 0.4196078, 1,
1.532588, -0.3736264, 3.09996, 1, 0, 0.4156863, 1,
1.543093, 1.868682, 2.429451, 1, 0, 0.4078431, 1,
1.544429, 0.3175478, 1.286738, 1, 0, 0.4039216, 1,
1.550238, 0.09951065, 3.430476, 1, 0, 0.3960784, 1,
1.555055, 0.1731106, 2.262589, 1, 0, 0.3882353, 1,
1.555069, 0.6424276, 0.5840788, 1, 0, 0.3843137, 1,
1.56765, 2.87835, -2.004245, 1, 0, 0.3764706, 1,
1.570127, 0.7178931, 3.11369, 1, 0, 0.372549, 1,
1.579466, -0.7684119, 1.276641, 1, 0, 0.3647059, 1,
1.592706, 2.529816, 0.2609133, 1, 0, 0.3607843, 1,
1.599414, 0.9753355, 0.569186, 1, 0, 0.3529412, 1,
1.604487, -0.8450999, 1.227102, 1, 0, 0.3490196, 1,
1.608129, 0.6538568, 1.187413, 1, 0, 0.3411765, 1,
1.610274, -1.920149, 2.79021, 1, 0, 0.3372549, 1,
1.628928, -1.154838, 3.380906, 1, 0, 0.3294118, 1,
1.633823, -0.5990877, 1.757972, 1, 0, 0.3254902, 1,
1.638837, -0.2607754, 2.922603, 1, 0, 0.3176471, 1,
1.641542, 0.8003677, 1.348279, 1, 0, 0.3137255, 1,
1.644086, -0.578685, 1.377302, 1, 0, 0.3058824, 1,
1.678734, 1.453002, 1.862593, 1, 0, 0.2980392, 1,
1.683559, 0.6462143, 1.027916, 1, 0, 0.2941177, 1,
1.684414, 1.005909, 0.5364342, 1, 0, 0.2862745, 1,
1.686731, 0.7940012, 2.604983, 1, 0, 0.282353, 1,
1.687155, -1.514792, 3.983705, 1, 0, 0.2745098, 1,
1.689469, 0.2658109, 1.482883, 1, 0, 0.2705882, 1,
1.698122, 0.8174815, 1.393851, 1, 0, 0.2627451, 1,
1.702492, 0.9667721, 0.6262356, 1, 0, 0.2588235, 1,
1.71156, -1.814717, 3.024091, 1, 0, 0.2509804, 1,
1.734486, -1.716729, 3.067372, 1, 0, 0.2470588, 1,
1.736888, 0.3652804, 1.954614, 1, 0, 0.2392157, 1,
1.767785, 0.418195, 3.397502, 1, 0, 0.2352941, 1,
1.770687, -0.1544374, 2.011303, 1, 0, 0.227451, 1,
1.770727, 0.2046617, 1.604539, 1, 0, 0.2235294, 1,
1.77636, -2.369797, 2.249733, 1, 0, 0.2156863, 1,
1.778893, 1.121068, 0.7345107, 1, 0, 0.2117647, 1,
1.798966, -1.229784, 3.288685, 1, 0, 0.2039216, 1,
1.804711, 0.514837, -0.08998321, 1, 0, 0.1960784, 1,
1.81783, -0.9875339, 3.881588, 1, 0, 0.1921569, 1,
1.844435, 0.1486432, 0.6824391, 1, 0, 0.1843137, 1,
1.857641, -1.944498, 2.250493, 1, 0, 0.1803922, 1,
1.878984, 2.270525, 1.142931, 1, 0, 0.172549, 1,
1.909206, -0.3584794, 3.400334, 1, 0, 0.1686275, 1,
1.940018, 0.9691525, 1.125108, 1, 0, 0.1607843, 1,
1.950806, 0.9386643, 2.738157, 1, 0, 0.1568628, 1,
1.958185, 0.3824097, 1.388652, 1, 0, 0.1490196, 1,
1.97681, -0.3124229, 0.2618639, 1, 0, 0.145098, 1,
2.011947, 1.969923, -1.177388, 1, 0, 0.1372549, 1,
2.028478, -0.6785045, 3.064327, 1, 0, 0.1333333, 1,
2.048826, -0.2402127, 0.9414304, 1, 0, 0.1254902, 1,
2.053814, -0.6555921, 2.675399, 1, 0, 0.1215686, 1,
2.061017, -1.36028, 1.498882, 1, 0, 0.1137255, 1,
2.093484, -0.620185, 3.226685, 1, 0, 0.1098039, 1,
2.096906, -0.3324606, 2.110797, 1, 0, 0.1019608, 1,
2.103576, -0.8536092, 2.285827, 1, 0, 0.09411765, 1,
2.127841, -0.575369, 2.060169, 1, 0, 0.09019608, 1,
2.208959, -0.5693652, 4.55735, 1, 0, 0.08235294, 1,
2.245831, 0.02661514, 2.00105, 1, 0, 0.07843138, 1,
2.292994, 0.7102048, 0.7410598, 1, 0, 0.07058824, 1,
2.304387, 0.3840607, 1.148904, 1, 0, 0.06666667, 1,
2.319715, 1.897519, -0.07160167, 1, 0, 0.05882353, 1,
2.352395, -0.1173479, 3.116784, 1, 0, 0.05490196, 1,
2.386076, -1.922525, 2.614638, 1, 0, 0.04705882, 1,
2.476316, -0.1887541, 0.06823331, 1, 0, 0.04313726, 1,
2.503979, 0.01911258, -0.257609, 1, 0, 0.03529412, 1,
2.628163, -0.3084428, -0.06267298, 1, 0, 0.03137255, 1,
2.731596, 0.3585533, 0.184482, 1, 0, 0.02352941, 1,
2.850044, -2.173643, 2.102481, 1, 0, 0.01960784, 1,
2.961478, 0.03594956, -0.3122892, 1, 0, 0.01176471, 1,
3.01991, -2.11772, 3.229767, 1, 0, 0.007843138, 1
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
-0.3490746, -4.658249, -6.868351, 0, -0.5, 0.5, 0.5,
-0.3490746, -4.658249, -6.868351, 1, -0.5, 0.5, 0.5,
-0.3490746, -4.658249, -6.868351, 1, 1.5, 0.5, 0.5,
-0.3490746, -4.658249, -6.868351, 0, 1.5, 0.5, 0.5
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
-4.860145, -0.3437959, -6.868351, 0, -0.5, 0.5, 0.5,
-4.860145, -0.3437959, -6.868351, 1, -0.5, 0.5, 0.5,
-4.860145, -0.3437959, -6.868351, 1, 1.5, 0.5, 0.5,
-4.860145, -0.3437959, -6.868351, 0, 1.5, 0.5, 0.5
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
-4.860145, -4.658249, 0.1530566, 0, -0.5, 0.5, 0.5,
-4.860145, -4.658249, 0.1530566, 1, -0.5, 0.5, 0.5,
-4.860145, -4.658249, 0.1530566, 1, 1.5, 0.5, 0.5,
-4.860145, -4.658249, 0.1530566, 0, 1.5, 0.5, 0.5
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
-3, -3.662606, -5.248025,
3, -3.662606, -5.248025,
-3, -3.662606, -5.248025,
-3, -3.828547, -5.51808,
-2, -3.662606, -5.248025,
-2, -3.828547, -5.51808,
-1, -3.662606, -5.248025,
-1, -3.828547, -5.51808,
0, -3.662606, -5.248025,
0, -3.828547, -5.51808,
1, -3.662606, -5.248025,
1, -3.828547, -5.51808,
2, -3.662606, -5.248025,
2, -3.828547, -5.51808,
3, -3.662606, -5.248025,
3, -3.828547, -5.51808
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
-3, -4.160428, -6.058188, 0, -0.5, 0.5, 0.5,
-3, -4.160428, -6.058188, 1, -0.5, 0.5, 0.5,
-3, -4.160428, -6.058188, 1, 1.5, 0.5, 0.5,
-3, -4.160428, -6.058188, 0, 1.5, 0.5, 0.5,
-2, -4.160428, -6.058188, 0, -0.5, 0.5, 0.5,
-2, -4.160428, -6.058188, 1, -0.5, 0.5, 0.5,
-2, -4.160428, -6.058188, 1, 1.5, 0.5, 0.5,
-2, -4.160428, -6.058188, 0, 1.5, 0.5, 0.5,
-1, -4.160428, -6.058188, 0, -0.5, 0.5, 0.5,
-1, -4.160428, -6.058188, 1, -0.5, 0.5, 0.5,
-1, -4.160428, -6.058188, 1, 1.5, 0.5, 0.5,
-1, -4.160428, -6.058188, 0, 1.5, 0.5, 0.5,
0, -4.160428, -6.058188, 0, -0.5, 0.5, 0.5,
0, -4.160428, -6.058188, 1, -0.5, 0.5, 0.5,
0, -4.160428, -6.058188, 1, 1.5, 0.5, 0.5,
0, -4.160428, -6.058188, 0, 1.5, 0.5, 0.5,
1, -4.160428, -6.058188, 0, -0.5, 0.5, 0.5,
1, -4.160428, -6.058188, 1, -0.5, 0.5, 0.5,
1, -4.160428, -6.058188, 1, 1.5, 0.5, 0.5,
1, -4.160428, -6.058188, 0, 1.5, 0.5, 0.5,
2, -4.160428, -6.058188, 0, -0.5, 0.5, 0.5,
2, -4.160428, -6.058188, 1, -0.5, 0.5, 0.5,
2, -4.160428, -6.058188, 1, 1.5, 0.5, 0.5,
2, -4.160428, -6.058188, 0, 1.5, 0.5, 0.5,
3, -4.160428, -6.058188, 0, -0.5, 0.5, 0.5,
3, -4.160428, -6.058188, 1, -0.5, 0.5, 0.5,
3, -4.160428, -6.058188, 1, 1.5, 0.5, 0.5,
3, -4.160428, -6.058188, 0, 1.5, 0.5, 0.5
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
-3.819129, -3, -5.248025,
-3.819129, 2, -5.248025,
-3.819129, -3, -5.248025,
-3.992631, -3, -5.51808,
-3.819129, -2, -5.248025,
-3.992631, -2, -5.51808,
-3.819129, -1, -5.248025,
-3.992631, -1, -5.51808,
-3.819129, 0, -5.248025,
-3.992631, 0, -5.51808,
-3.819129, 1, -5.248025,
-3.992631, 1, -5.51808,
-3.819129, 2, -5.248025,
-3.992631, 2, -5.51808
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
-4.339637, -3, -6.058188, 0, -0.5, 0.5, 0.5,
-4.339637, -3, -6.058188, 1, -0.5, 0.5, 0.5,
-4.339637, -3, -6.058188, 1, 1.5, 0.5, 0.5,
-4.339637, -3, -6.058188, 0, 1.5, 0.5, 0.5,
-4.339637, -2, -6.058188, 0, -0.5, 0.5, 0.5,
-4.339637, -2, -6.058188, 1, -0.5, 0.5, 0.5,
-4.339637, -2, -6.058188, 1, 1.5, 0.5, 0.5,
-4.339637, -2, -6.058188, 0, 1.5, 0.5, 0.5,
-4.339637, -1, -6.058188, 0, -0.5, 0.5, 0.5,
-4.339637, -1, -6.058188, 1, -0.5, 0.5, 0.5,
-4.339637, -1, -6.058188, 1, 1.5, 0.5, 0.5,
-4.339637, -1, -6.058188, 0, 1.5, 0.5, 0.5,
-4.339637, 0, -6.058188, 0, -0.5, 0.5, 0.5,
-4.339637, 0, -6.058188, 1, -0.5, 0.5, 0.5,
-4.339637, 0, -6.058188, 1, 1.5, 0.5, 0.5,
-4.339637, 0, -6.058188, 0, 1.5, 0.5, 0.5,
-4.339637, 1, -6.058188, 0, -0.5, 0.5, 0.5,
-4.339637, 1, -6.058188, 1, -0.5, 0.5, 0.5,
-4.339637, 1, -6.058188, 1, 1.5, 0.5, 0.5,
-4.339637, 1, -6.058188, 0, 1.5, 0.5, 0.5,
-4.339637, 2, -6.058188, 0, -0.5, 0.5, 0.5,
-4.339637, 2, -6.058188, 1, -0.5, 0.5, 0.5,
-4.339637, 2, -6.058188, 1, 1.5, 0.5, 0.5,
-4.339637, 2, -6.058188, 0, 1.5, 0.5, 0.5
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
-3.819129, -3.662606, -4,
-3.819129, -3.662606, 4,
-3.819129, -3.662606, -4,
-3.992631, -3.828547, -4,
-3.819129, -3.662606, -2,
-3.992631, -3.828547, -2,
-3.819129, -3.662606, 0,
-3.992631, -3.828547, 0,
-3.819129, -3.662606, 2,
-3.992631, -3.828547, 2,
-3.819129, -3.662606, 4,
-3.992631, -3.828547, 4
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
-4.339637, -4.160428, -4, 0, -0.5, 0.5, 0.5,
-4.339637, -4.160428, -4, 1, -0.5, 0.5, 0.5,
-4.339637, -4.160428, -4, 1, 1.5, 0.5, 0.5,
-4.339637, -4.160428, -4, 0, 1.5, 0.5, 0.5,
-4.339637, -4.160428, -2, 0, -0.5, 0.5, 0.5,
-4.339637, -4.160428, -2, 1, -0.5, 0.5, 0.5,
-4.339637, -4.160428, -2, 1, 1.5, 0.5, 0.5,
-4.339637, -4.160428, -2, 0, 1.5, 0.5, 0.5,
-4.339637, -4.160428, 0, 0, -0.5, 0.5, 0.5,
-4.339637, -4.160428, 0, 1, -0.5, 0.5, 0.5,
-4.339637, -4.160428, 0, 1, 1.5, 0.5, 0.5,
-4.339637, -4.160428, 0, 0, 1.5, 0.5, 0.5,
-4.339637, -4.160428, 2, 0, -0.5, 0.5, 0.5,
-4.339637, -4.160428, 2, 1, -0.5, 0.5, 0.5,
-4.339637, -4.160428, 2, 1, 1.5, 0.5, 0.5,
-4.339637, -4.160428, 2, 0, 1.5, 0.5, 0.5,
-4.339637, -4.160428, 4, 0, -0.5, 0.5, 0.5,
-4.339637, -4.160428, 4, 1, -0.5, 0.5, 0.5,
-4.339637, -4.160428, 4, 1, 1.5, 0.5, 0.5,
-4.339637, -4.160428, 4, 0, 1.5, 0.5, 0.5
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
-3.819129, -3.662606, -5.248025,
-3.819129, 2.975014, -5.248025,
-3.819129, -3.662606, 5.554139,
-3.819129, 2.975014, 5.554139,
-3.819129, -3.662606, -5.248025,
-3.819129, -3.662606, 5.554139,
-3.819129, 2.975014, -5.248025,
-3.819129, 2.975014, 5.554139,
-3.819129, -3.662606, -5.248025,
3.12098, -3.662606, -5.248025,
-3.819129, -3.662606, 5.554139,
3.12098, -3.662606, 5.554139,
-3.819129, 2.975014, -5.248025,
3.12098, 2.975014, -5.248025,
-3.819129, 2.975014, 5.554139,
3.12098, 2.975014, 5.554139,
3.12098, -3.662606, -5.248025,
3.12098, 2.975014, -5.248025,
3.12098, -3.662606, 5.554139,
3.12098, 2.975014, 5.554139,
3.12098, -3.662606, -5.248025,
3.12098, -3.662606, 5.554139,
3.12098, 2.975014, -5.248025,
3.12098, 2.975014, 5.554139
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
var radius = 7.718003;
var distance = 34.33826;
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
mvMatrix.translate( 0.3490746, 0.3437959, -0.1530566 );
mvMatrix.scale( 1.20241, 1.257206, 0.772517 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.33826);
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
Flumetralin<-read.table("Flumetralin.xyz", skip=1)
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
-3.718059, 0.8532459, -0.03904097, 0, 0, 1, 1, 1,
-3.03038, -1.209629, -2.704785, 1, 0, 0, 1, 1,
-2.969501, 0.4515449, -0.9613106, 1, 0, 0, 1, 1,
-2.940197, 1.020972, -1.271997, 1, 0, 0, 1, 1,
-2.832908, -0.4716628, -0.5891646, 1, 0, 0, 1, 1,
-2.688987, 0.5999154, -0.3858302, 1, 0, 0, 1, 1,
-2.583943, -0.799855, -1.33234, 0, 0, 0, 1, 1,
-2.560896, -0.002654411, -0.7969978, 0, 0, 0, 1, 1,
-2.540639, 0.9596899, 0.9987627, 0, 0, 0, 1, 1,
-2.408996, 1.143062, 0.1386886, 0, 0, 0, 1, 1,
-2.31592, 0.08513774, -2.973672, 0, 0, 0, 1, 1,
-2.314662, 0.2940332, -1.654188, 0, 0, 0, 1, 1,
-2.188883, -1.159187, -1.945798, 0, 0, 0, 1, 1,
-2.180403, 1.285331, 0.5410938, 1, 1, 1, 1, 1,
-2.177079, 0.1113997, -1.179383, 1, 1, 1, 1, 1,
-2.14364, -0.5569, -3.067791, 1, 1, 1, 1, 1,
-2.124442, 0.7841799, -2.328693, 1, 1, 1, 1, 1,
-2.062485, 1.756491, 0.1803259, 1, 1, 1, 1, 1,
-2.049871, -0.4066696, -1.286695, 1, 1, 1, 1, 1,
-2.011969, -0.5962356, -1.014391, 1, 1, 1, 1, 1,
-2.010458, 2.115654, -2.284662, 1, 1, 1, 1, 1,
-1.986525, 0.6972723, -2.525024, 1, 1, 1, 1, 1,
-1.968464, -0.1997449, -3.041493, 1, 1, 1, 1, 1,
-1.955093, -0.1853171, -2.292311, 1, 1, 1, 1, 1,
-1.91936, 0.6020443, -0.5764467, 1, 1, 1, 1, 1,
-1.889043, -0.5132974, -0.7932155, 1, 1, 1, 1, 1,
-1.83312, -0.5537628, -3.067706, 1, 1, 1, 1, 1,
-1.833004, -0.9924219, -1.571202, 1, 1, 1, 1, 1,
-1.801482, 0.05485623, -1.130388, 0, 0, 1, 1, 1,
-1.799119, 0.327654, -0.1799957, 1, 0, 0, 1, 1,
-1.784548, 1.476394, 1.345258, 1, 0, 0, 1, 1,
-1.784479, 0.5361145, -0.479488, 1, 0, 0, 1, 1,
-1.768296, -0.6800225, 0.1448653, 1, 0, 0, 1, 1,
-1.764855, 0.514944, -2.169768, 1, 0, 0, 1, 1,
-1.755408, 0.7613971, -0.1661362, 0, 0, 0, 1, 1,
-1.754869, -1.237216, -3.194547, 0, 0, 0, 1, 1,
-1.733719, 0.2523423, -0.9312577, 0, 0, 0, 1, 1,
-1.708857, -1.516702, -3.161745, 0, 0, 0, 1, 1,
-1.700636, 0.6631317, 0.2564978, 0, 0, 0, 1, 1,
-1.67418, 0.6766646, -1.075822, 0, 0, 0, 1, 1,
-1.637658, 0.2231005, -2.806282, 0, 0, 0, 1, 1,
-1.629439, -1.104076, -1.04943, 1, 1, 1, 1, 1,
-1.628909, -0.5477978, -1.445163, 1, 1, 1, 1, 1,
-1.603863, 1.225676, -0.4065979, 1, 1, 1, 1, 1,
-1.595759, 2.412762, -1.282345, 1, 1, 1, 1, 1,
-1.589051, 1.522779, -0.5610602, 1, 1, 1, 1, 1,
-1.55373, 0.2992918, -2.45745, 1, 1, 1, 1, 1,
-1.551583, 0.5701309, -2.835334, 1, 1, 1, 1, 1,
-1.549891, -0.7490451, -1.346838, 1, 1, 1, 1, 1,
-1.546884, 0.1534254, -0.9459729, 1, 1, 1, 1, 1,
-1.546335, 0.09495506, -1.786288, 1, 1, 1, 1, 1,
-1.535891, -0.6301359, -1.651073, 1, 1, 1, 1, 1,
-1.533597, -0.9849048, -3.131247, 1, 1, 1, 1, 1,
-1.524322, 2.50995, -0.01762632, 1, 1, 1, 1, 1,
-1.5219, 0.1252827, -0.9981523, 1, 1, 1, 1, 1,
-1.510131, -1.261968, -2.89921, 1, 1, 1, 1, 1,
-1.509561, 0.5849419, 0.9388022, 0, 0, 1, 1, 1,
-1.503363, -0.3631241, -2.201782, 1, 0, 0, 1, 1,
-1.499836, 0.443997, -1.11145, 1, 0, 0, 1, 1,
-1.495785, -0.9480646, -1.620616, 1, 0, 0, 1, 1,
-1.495385, 2.297339, -0.3169981, 1, 0, 0, 1, 1,
-1.493963, -0.4919919, 0.09068277, 1, 0, 0, 1, 1,
-1.490217, 0.1355637, -2.209906, 0, 0, 0, 1, 1,
-1.485951, 1.235408, -0.3593635, 0, 0, 0, 1, 1,
-1.484308, -1.363202, -4.242928, 0, 0, 0, 1, 1,
-1.480008, 0.2103296, -0.8265459, 0, 0, 0, 1, 1,
-1.479758, 0.318909, -1.594239, 0, 0, 0, 1, 1,
-1.477545, -0.1269448, -2.502071, 0, 0, 0, 1, 1,
-1.477048, -2.061268, -3.22145, 0, 0, 0, 1, 1,
-1.465197, -0.1623688, -0.316788, 1, 1, 1, 1, 1,
-1.449092, -0.3404145, -0.1480658, 1, 1, 1, 1, 1,
-1.444968, -1.117833, -4.067633, 1, 1, 1, 1, 1,
-1.413629, 0.3533579, -1.69284, 1, 1, 1, 1, 1,
-1.410577, 0.4053829, -1.771004, 1, 1, 1, 1, 1,
-1.399878, -0.9301564, -2.498717, 1, 1, 1, 1, 1,
-1.399632, -1.154004, -2.298699, 1, 1, 1, 1, 1,
-1.398975, -0.8957995, -2.069582, 1, 1, 1, 1, 1,
-1.392007, 1.349231, -2.181514, 1, 1, 1, 1, 1,
-1.391246, 1.218934, 0.8705323, 1, 1, 1, 1, 1,
-1.390794, -0.2325878, -1.658106, 1, 1, 1, 1, 1,
-1.389943, -1.00653, -1.492416, 1, 1, 1, 1, 1,
-1.388642, 1.736914, -1.253164, 1, 1, 1, 1, 1,
-1.377008, -0.634688, -1.473439, 1, 1, 1, 1, 1,
-1.375137, -2.065404, -2.427473, 1, 1, 1, 1, 1,
-1.371548, 0.4105321, -0.9340742, 0, 0, 1, 1, 1,
-1.371442, -0.5621263, -2.251712, 1, 0, 0, 1, 1,
-1.370077, -0.1392928, -0.6963865, 1, 0, 0, 1, 1,
-1.361242, 0.4349179, -1.521243, 1, 0, 0, 1, 1,
-1.347819, 0.2137967, -0.6689538, 1, 0, 0, 1, 1,
-1.339184, 1.789929, -2.494673, 1, 0, 0, 1, 1,
-1.335805, 1.124434, -2.944424, 0, 0, 0, 1, 1,
-1.322462, -0.6347535, -2.829674, 0, 0, 0, 1, 1,
-1.321504, 0.0578987, -2.097611, 0, 0, 0, 1, 1,
-1.315852, -0.9073957, -2.62925, 0, 0, 0, 1, 1,
-1.305173, 2.033402, -0.4884925, 0, 0, 0, 1, 1,
-1.286805, -1.034086, -1.375732, 0, 0, 0, 1, 1,
-1.279482, -1.144304, -3.274022, 0, 0, 0, 1, 1,
-1.277358, 0.06490164, -1.295784, 1, 1, 1, 1, 1,
-1.272454, -0.301107, -1.059767, 1, 1, 1, 1, 1,
-1.271573, -1.334857, -3.377285, 1, 1, 1, 1, 1,
-1.265133, -1.946941, -3.543264, 1, 1, 1, 1, 1,
-1.265024, -2.547875, -2.020152, 1, 1, 1, 1, 1,
-1.261067, -1.31864, -3.035743, 1, 1, 1, 1, 1,
-1.258678, 0.8292045, -1.796891, 1, 1, 1, 1, 1,
-1.256126, 0.375342, -2.317408, 1, 1, 1, 1, 1,
-1.251564, 0.8572448, -2.329139, 1, 1, 1, 1, 1,
-1.250558, -1.203465, -2.080955, 1, 1, 1, 1, 1,
-1.2439, 0.6510732, -0.3622468, 1, 1, 1, 1, 1,
-1.243783, 0.5554922, -0.7242542, 1, 1, 1, 1, 1,
-1.241596, 0.3223144, -0.3308058, 1, 1, 1, 1, 1,
-1.239754, 0.6720493, 0.03019877, 1, 1, 1, 1, 1,
-1.23674, 0.5801252, -1.425146, 1, 1, 1, 1, 1,
-1.231415, -1.286651, -3.308318, 0, 0, 1, 1, 1,
-1.224509, 0.4425687, -0.1002955, 1, 0, 0, 1, 1,
-1.220711, -0.02899827, -2.038503, 1, 0, 0, 1, 1,
-1.217041, -0.1866083, -0.215501, 1, 0, 0, 1, 1,
-1.216294, -1.218386, -3.028444, 1, 0, 0, 1, 1,
-1.201831, 1.784464, 2.19756, 1, 0, 0, 1, 1,
-1.195753, 1.123005, -1.162475, 0, 0, 0, 1, 1,
-1.184564, -1.314966, -1.552889, 0, 0, 0, 1, 1,
-1.17943, -1.065335, -2.045686, 0, 0, 0, 1, 1,
-1.162715, -0.2991694, -1.677034, 0, 0, 0, 1, 1,
-1.162695, -0.01221706, -0.67466, 0, 0, 0, 1, 1,
-1.161714, -0.08990262, -2.472519, 0, 0, 0, 1, 1,
-1.160411, 0.1646522, -1.383946, 0, 0, 0, 1, 1,
-1.158875, -0.06760773, -1.861593, 1, 1, 1, 1, 1,
-1.152308, 0.4868872, -4.334638, 1, 1, 1, 1, 1,
-1.144128, -0.5314078, -0.0917861, 1, 1, 1, 1, 1,
-1.142224, -0.2931313, -2.934038, 1, 1, 1, 1, 1,
-1.122499, -0.9584432, -2.319554, 1, 1, 1, 1, 1,
-1.1213, 0.01862284, -1.032582, 1, 1, 1, 1, 1,
-1.117193, -0.03417707, -2.702875, 1, 1, 1, 1, 1,
-1.115641, -0.9511055, -0.9682726, 1, 1, 1, 1, 1,
-1.109972, -0.2806208, -3.242646, 1, 1, 1, 1, 1,
-1.106683, 1.761909, -0.8651282, 1, 1, 1, 1, 1,
-1.105508, -1.141056, -3.340048, 1, 1, 1, 1, 1,
-1.101621, 0.8928617, 0.7472651, 1, 1, 1, 1, 1,
-1.099859, -0.8542849, -1.8054, 1, 1, 1, 1, 1,
-1.097272, -1.16507, -2.83787, 1, 1, 1, 1, 1,
-1.09189, -0.03209328, 0.2824078, 1, 1, 1, 1, 1,
-1.091133, 0.3413243, -1.136184, 0, 0, 1, 1, 1,
-1.081504, -1.060992, -2.099775, 1, 0, 0, 1, 1,
-1.077271, -0.2288077, -1.511314, 1, 0, 0, 1, 1,
-1.070638, 1.001101, 1.003984, 1, 0, 0, 1, 1,
-1.066299, 0.6665871, 1.028828, 1, 0, 0, 1, 1,
-1.064962, -0.2584457, -3.028608, 1, 0, 0, 1, 1,
-1.062317, 0.07648868, -2.921816, 0, 0, 0, 1, 1,
-1.056932, -0.4551858, -2.638664, 0, 0, 0, 1, 1,
-1.045114, -1.28593, -3.087462, 0, 0, 0, 1, 1,
-1.031775, -0.1788657, -3.092226, 0, 0, 0, 1, 1,
-1.030486, 0.751394, -2.136811, 0, 0, 0, 1, 1,
-1.023725, -0.3683128, -3.197265, 0, 0, 0, 1, 1,
-1.022449, 0.09941152, -0.8147338, 0, 0, 0, 1, 1,
-1.016702, -1.4527, -1.402128, 1, 1, 1, 1, 1,
-1.007231, 0.3981574, -1.15759, 1, 1, 1, 1, 1,
-1.003251, 0.7790778, -0.9407602, 1, 1, 1, 1, 1,
-1.001389, 2.600381, -1.127623, 1, 1, 1, 1, 1,
-0.9997404, 0.6341371, -0.3098566, 1, 1, 1, 1, 1,
-0.9990878, 0.5542136, -1.11429, 1, 1, 1, 1, 1,
-0.9983438, 0.6793877, -0.8699465, 1, 1, 1, 1, 1,
-0.9975353, 1.103617, 0.872352, 1, 1, 1, 1, 1,
-0.9937266, 1.350859, -1.8713, 1, 1, 1, 1, 1,
-0.9936877, 0.05787635, -1.922316, 1, 1, 1, 1, 1,
-0.9850426, -1.242982, -2.17867, 1, 1, 1, 1, 1,
-0.9824525, -0.7192516, -2.206166, 1, 1, 1, 1, 1,
-0.9807808, 2.328122, -0.7637166, 1, 1, 1, 1, 1,
-0.9776751, -1.361632, -2.941384, 1, 1, 1, 1, 1,
-0.9759993, 0.2704186, -1.980587, 1, 1, 1, 1, 1,
-0.9630985, -0.6029202, -1.286857, 0, 0, 1, 1, 1,
-0.9623394, 0.7668419, -1.440736, 1, 0, 0, 1, 1,
-0.9618826, -1.973736, -2.749031, 1, 0, 0, 1, 1,
-0.9583009, -0.1886038, -0.8576331, 1, 0, 0, 1, 1,
-0.9580698, -0.8927554, -3.052844, 1, 0, 0, 1, 1,
-0.9525478, 0.7253971, -2.426215, 1, 0, 0, 1, 1,
-0.9522908, 0.07900661, 0.5544003, 0, 0, 0, 1, 1,
-0.9522271, -0.6128735, -1.983628, 0, 0, 0, 1, 1,
-0.9512946, -0.5321628, -2.268361, 0, 0, 0, 1, 1,
-0.946103, 1.126335, -0.3834683, 0, 0, 0, 1, 1,
-0.9440282, 1.493385, 1.995539, 0, 0, 0, 1, 1,
-0.9408162, -1.814869, -3.749259, 0, 0, 0, 1, 1,
-0.9392375, -1.260532, -1.613606, 0, 0, 0, 1, 1,
-0.9384831, 1.82691, -2.29878, 1, 1, 1, 1, 1,
-0.9358543, -0.1647939, -2.093712, 1, 1, 1, 1, 1,
-0.9324587, -0.1119416, -1.134239, 1, 1, 1, 1, 1,
-0.9256971, -0.1287679, -1.688434, 1, 1, 1, 1, 1,
-0.9252214, -0.3567753, -2.431647, 1, 1, 1, 1, 1,
-0.9244351, 2.125113, -2.458485, 1, 1, 1, 1, 1,
-0.9228838, 0.3228881, -0.7555969, 1, 1, 1, 1, 1,
-0.9205664, 0.7759693, -0.5012172, 1, 1, 1, 1, 1,
-0.9190238, -0.8125591, -2.021979, 1, 1, 1, 1, 1,
-0.9155344, 1.147825, -3.646497, 1, 1, 1, 1, 1,
-0.9148097, 0.04395847, -3.838994, 1, 1, 1, 1, 1,
-0.9123832, -0.3067444, -1.63222, 1, 1, 1, 1, 1,
-0.9106076, 1.163296, -1.713258, 1, 1, 1, 1, 1,
-0.908049, 0.99841, -0.5105301, 1, 1, 1, 1, 1,
-0.9061714, 1.240883, -2.410276, 1, 1, 1, 1, 1,
-0.9059649, 1.123565, -0.1424806, 0, 0, 1, 1, 1,
-0.8959107, -0.3620003, -0.6659061, 1, 0, 0, 1, 1,
-0.8944991, -1.205722, -0.3077619, 1, 0, 0, 1, 1,
-0.8931544, -0.2043405, -1.717417, 1, 0, 0, 1, 1,
-0.8916769, 0.2160471, -1.436896, 1, 0, 0, 1, 1,
-0.8848693, -0.3877478, -1.40015, 1, 0, 0, 1, 1,
-0.8825412, 0.8111871, -2.315646, 0, 0, 0, 1, 1,
-0.8784778, -0.5452283, -2.429894, 0, 0, 0, 1, 1,
-0.8777503, 0.2882556, -2.013397, 0, 0, 0, 1, 1,
-0.8772424, -0.5349484, -1.523454, 0, 0, 0, 1, 1,
-0.8575802, 0.7518639, -1.075981, 0, 0, 0, 1, 1,
-0.8560976, 0.07341717, -0.2310866, 0, 0, 0, 1, 1,
-0.8546795, 0.3083812, -2.665709, 0, 0, 0, 1, 1,
-0.8526633, 1.027936, -0.4317882, 1, 1, 1, 1, 1,
-0.8514419, 0.6782757, -0.5567554, 1, 1, 1, 1, 1,
-0.8509213, -0.7913313, -1.957562, 1, 1, 1, 1, 1,
-0.8448329, -0.9097971, -2.824398, 1, 1, 1, 1, 1,
-0.8384546, 0.6070758, -0.5625647, 1, 1, 1, 1, 1,
-0.8351551, -0.1847699, -0.624953, 1, 1, 1, 1, 1,
-0.8323849, -1.319375, -1.244172, 1, 1, 1, 1, 1,
-0.823611, -2.264278, -2.974848, 1, 1, 1, 1, 1,
-0.8188965, 0.7066543, -0.6570627, 1, 1, 1, 1, 1,
-0.8179737, -1.617559, -3.642514, 1, 1, 1, 1, 1,
-0.8158494, -1.25414, -1.747159, 1, 1, 1, 1, 1,
-0.8146946, 0.1302047, -1.819747, 1, 1, 1, 1, 1,
-0.8142177, 0.5838477, -0.1623536, 1, 1, 1, 1, 1,
-0.8134338, 0.02742874, -0.4756891, 1, 1, 1, 1, 1,
-0.8104503, 0.1780141, -1.377842, 1, 1, 1, 1, 1,
-0.8042536, -0.3213504, -3.028187, 0, 0, 1, 1, 1,
-0.7985507, 1.059456, -0.01364753, 1, 0, 0, 1, 1,
-0.7952904, 0.6104347, 0.4046971, 1, 0, 0, 1, 1,
-0.7919825, -0.8169854, -1.673437, 1, 0, 0, 1, 1,
-0.7895881, 0.3669594, -0.6965699, 1, 0, 0, 1, 1,
-0.786973, -2.549101, -2.577199, 1, 0, 0, 1, 1,
-0.7861155, -0.6345438, -1.306365, 0, 0, 0, 1, 1,
-0.7832022, -1.101112, -1.099733, 0, 0, 0, 1, 1,
-0.7822123, 0.1105852, -2.477481, 0, 0, 0, 1, 1,
-0.7793182, 0.09537125, -1.34703, 0, 0, 0, 1, 1,
-0.7781108, 0.4476175, -1.986242, 0, 0, 0, 1, 1,
-0.7678115, -1.57855, -4.002861, 0, 0, 0, 1, 1,
-0.7618886, -0.2745254, -0.3389426, 0, 0, 0, 1, 1,
-0.7604125, -0.4311834, -3.78253, 1, 1, 1, 1, 1,
-0.7588602, -0.8565891, -1.866711, 1, 1, 1, 1, 1,
-0.7572686, -0.0866866, -0.8212833, 1, 1, 1, 1, 1,
-0.7519808, 0.3407361, 0.9064643, 1, 1, 1, 1, 1,
-0.7464193, 0.600831, -1.88709, 1, 1, 1, 1, 1,
-0.7462014, -0.5924367, -1.096523, 1, 1, 1, 1, 1,
-0.7410874, -0.03757381, -2.087024, 1, 1, 1, 1, 1,
-0.7372147, -1.439199, -3.047296, 1, 1, 1, 1, 1,
-0.7345256, 1.062414, -1.119423, 1, 1, 1, 1, 1,
-0.7314965, 1.1568, -0.4384701, 1, 1, 1, 1, 1,
-0.7293563, -0.9079851, -2.579663, 1, 1, 1, 1, 1,
-0.727931, 0.6806147, -0.412466, 1, 1, 1, 1, 1,
-0.7082483, -1.222775, -2.61203, 1, 1, 1, 1, 1,
-0.7075992, -0.9576408, -1.601212, 1, 1, 1, 1, 1,
-0.704587, 2.065923, -2.168846, 1, 1, 1, 1, 1,
-0.703086, -0.997946, -0.9439335, 0, 0, 1, 1, 1,
-0.7007648, -1.059953, -2.585358, 1, 0, 0, 1, 1,
-0.696462, 0.2891101, -2.01245, 1, 0, 0, 1, 1,
-0.6945493, -1.633861, -2.129981, 1, 0, 0, 1, 1,
-0.6931846, 0.3138944, 0.2105717, 1, 0, 0, 1, 1,
-0.6931507, 0.4747058, -0.04191566, 1, 0, 0, 1, 1,
-0.6886743, -0.4473671, -4.445396, 0, 0, 0, 1, 1,
-0.6858576, -0.5740447, -3.074791, 0, 0, 0, 1, 1,
-0.6759982, -0.0552524, -3.088347, 0, 0, 0, 1, 1,
-0.673982, -0.5160266, -2.618953, 0, 0, 0, 1, 1,
-0.6670423, -0.8108723, -3.210052, 0, 0, 0, 1, 1,
-0.6634834, 0.2420551, 0.06581089, 0, 0, 0, 1, 1,
-0.6626025, 1.675181, 2.03307, 0, 0, 0, 1, 1,
-0.6515339, -0.2966403, -0.461268, 1, 1, 1, 1, 1,
-0.6512415, -2.575785, -2.111222, 1, 1, 1, 1, 1,
-0.6508207, 1.786115, -0.1790514, 1, 1, 1, 1, 1,
-0.6466623, -0.4483352, -3.292976, 1, 1, 1, 1, 1,
-0.640489, -1.700355, -2.0762, 1, 1, 1, 1, 1,
-0.6394286, -0.2205097, -3.655777, 1, 1, 1, 1, 1,
-0.6372439, 1.473159, -1.624574, 1, 1, 1, 1, 1,
-0.6356505, -1.332434, -1.447008, 1, 1, 1, 1, 1,
-0.6349261, 0.8216217, -2.552089, 1, 1, 1, 1, 1,
-0.634733, -0.9617234, -3.32679, 1, 1, 1, 1, 1,
-0.6345587, -1.56232, -2.63183, 1, 1, 1, 1, 1,
-0.6338806, -1.108092, -0.7013184, 1, 1, 1, 1, 1,
-0.6314161, -0.6945983, -1.562107, 1, 1, 1, 1, 1,
-0.6309804, 1.32849, -0.3807475, 1, 1, 1, 1, 1,
-0.627384, 0.7016428, 1.06542, 1, 1, 1, 1, 1,
-0.6250151, -0.3719878, -1.432923, 0, 0, 1, 1, 1,
-0.6203061, -1.745469, -3.366103, 1, 0, 0, 1, 1,
-0.6105895, -0.8201156, -1.143784, 1, 0, 0, 1, 1,
-0.6103338, -1.907205, -2.564312, 1, 0, 0, 1, 1,
-0.6102024, -1.795514, -3.955299, 1, 0, 0, 1, 1,
-0.6089064, -1.218856, -0.9734825, 1, 0, 0, 1, 1,
-0.6061875, 1.742798, -0.5120908, 0, 0, 0, 1, 1,
-0.6061015, -1.344201, -1.831258, 0, 0, 0, 1, 1,
-0.6053232, 0.7948685, -0.9133075, 0, 0, 0, 1, 1,
-0.6050807, -0.3329976, -1.643421, 0, 0, 0, 1, 1,
-0.5992926, 0.3591563, 0.6416823, 0, 0, 0, 1, 1,
-0.5986557, 1.238631, -0.7906328, 0, 0, 0, 1, 1,
-0.5946576, -1.583216, -3.142963, 0, 0, 0, 1, 1,
-0.5927209, -2.205857, -3.314346, 1, 1, 1, 1, 1,
-0.5861816, -0.1220822, -0.6422236, 1, 1, 1, 1, 1,
-0.5837165, -0.2471952, -3.037749, 1, 1, 1, 1, 1,
-0.5811158, 0.0001856613, -2.366195, 1, 1, 1, 1, 1,
-0.578561, 0.5419565, -0.8840654, 1, 1, 1, 1, 1,
-0.5766766, -1.220689, -2.896574, 1, 1, 1, 1, 1,
-0.5715764, 0.3823148, -0.9881365, 1, 1, 1, 1, 1,
-0.5681742, 0.9415478, 0.1388642, 1, 1, 1, 1, 1,
-0.5667052, 0.6157373, -0.0670905, 1, 1, 1, 1, 1,
-0.5629517, -2.107942, -0.7588053, 1, 1, 1, 1, 1,
-0.5616301, -0.2048314, -2.808757, 1, 1, 1, 1, 1,
-0.5602705, 0.6891019, -1.888614, 1, 1, 1, 1, 1,
-0.5542982, 0.8931797, -0.3304503, 1, 1, 1, 1, 1,
-0.5532341, 0.6237491, 1.102942, 1, 1, 1, 1, 1,
-0.5501223, -0.03079123, -2.255144, 1, 1, 1, 1, 1,
-0.538869, -1.175024, -2.446799, 0, 0, 1, 1, 1,
-0.5378767, -1.679507, -3.134125, 1, 0, 0, 1, 1,
-0.535551, -2.085666, -3.803979, 1, 0, 0, 1, 1,
-0.534031, 0.509241, -0.5314412, 1, 0, 0, 1, 1,
-0.5303572, -0.9632825, -2.110141, 1, 0, 0, 1, 1,
-0.5288279, 1.10707, -1.923767, 1, 0, 0, 1, 1,
-0.5268081, 1.436255, -0.1742932, 0, 0, 0, 1, 1,
-0.5206441, -0.6427957, -2.026843, 0, 0, 0, 1, 1,
-0.5198661, -0.7067899, -3.118191, 0, 0, 0, 1, 1,
-0.5183585, -0.5360349, -1.589336, 0, 0, 0, 1, 1,
-0.5104332, -1.547854, -2.228711, 0, 0, 0, 1, 1,
-0.5079366, 0.04705223, -0.7745671, 0, 0, 0, 1, 1,
-0.5071214, -0.128235, -2.809933, 0, 0, 0, 1, 1,
-0.5067448, -0.04137785, -0.5755625, 1, 1, 1, 1, 1,
-0.5057137, 1.338176, -0.5511562, 1, 1, 1, 1, 1,
-0.5053959, 2.438808, 0.2326106, 1, 1, 1, 1, 1,
-0.5010902, 0.5192345, -0.1265686, 1, 1, 1, 1, 1,
-0.4901965, -0.478283, -1.455557, 1, 1, 1, 1, 1,
-0.4850456, -0.6517042, -3.439179, 1, 1, 1, 1, 1,
-0.4839744, -1.466048, -3.079307, 1, 1, 1, 1, 1,
-0.4782767, -1.674274, -3.898975, 1, 1, 1, 1, 1,
-0.4776444, -0.6517974, -1.456035, 1, 1, 1, 1, 1,
-0.4731518, -0.1726206, -1.817097, 1, 1, 1, 1, 1,
-0.4705239, -2.845973, -3.202503, 1, 1, 1, 1, 1,
-0.4647144, 0.2521712, -2.344559, 1, 1, 1, 1, 1,
-0.456275, -0.1868974, -2.100211, 1, 1, 1, 1, 1,
-0.4508922, 0.1274529, -1.599913, 1, 1, 1, 1, 1,
-0.4492196, 0.560243, -0.6250153, 1, 1, 1, 1, 1,
-0.4463019, 1.454621, -0.8835372, 0, 0, 1, 1, 1,
-0.4453932, -1.530173, -2.638218, 1, 0, 0, 1, 1,
-0.4440952, 0.1738099, -1.404588, 1, 0, 0, 1, 1,
-0.4334916, 0.5555812, -0.530248, 1, 0, 0, 1, 1,
-0.4334229, -0.481897, -2.509317, 1, 0, 0, 1, 1,
-0.4304448, -0.6925135, -3.419962, 1, 0, 0, 1, 1,
-0.4296897, 1.73103, 0.3067664, 0, 0, 0, 1, 1,
-0.4292161, -0.3196044, -3.692816, 0, 0, 0, 1, 1,
-0.427516, 0.9145804, -1.349246, 0, 0, 0, 1, 1,
-0.4242541, -2.215981, -5.090713, 0, 0, 0, 1, 1,
-0.4228836, 0.2223522, -1.416099, 0, 0, 0, 1, 1,
-0.4214055, -0.009433287, -2.755779, 0, 0, 0, 1, 1,
-0.4210561, -0.1116323, -2.282548, 0, 0, 0, 1, 1,
-0.4201791, 0.1470991, -3.238877, 1, 1, 1, 1, 1,
-0.4197368, -1.836036, -3.704972, 1, 1, 1, 1, 1,
-0.4188771, 0.5208294, -0.06551694, 1, 1, 1, 1, 1,
-0.4186555, -0.5506595, -2.258417, 1, 1, 1, 1, 1,
-0.4170827, -0.7199522, -1.535432, 1, 1, 1, 1, 1,
-0.4136099, -0.7383258, -1.803084, 1, 1, 1, 1, 1,
-0.4133677, 1.510955, -0.3737755, 1, 1, 1, 1, 1,
-0.4127711, -0.02744922, -1.462625, 1, 1, 1, 1, 1,
-0.404584, -0.07961508, -2.327132, 1, 1, 1, 1, 1,
-0.4020773, -0.9860979, -3.124705, 1, 1, 1, 1, 1,
-0.4013924, 1.322025, -1.276877, 1, 1, 1, 1, 1,
-0.4006512, 0.9840174, -0.1107538, 1, 1, 1, 1, 1,
-0.3969399, 0.2609778, -0.1981299, 1, 1, 1, 1, 1,
-0.3952638, -0.2451952, -2.696361, 1, 1, 1, 1, 1,
-0.3847303, 0.1920105, -1.585501, 1, 1, 1, 1, 1,
-0.3838054, -0.9316553, -2.484403, 0, 0, 1, 1, 1,
-0.3787396, -0.1085122, -1.187853, 1, 0, 0, 1, 1,
-0.3753185, -2.49975, -3.42709, 1, 0, 0, 1, 1,
-0.3680763, 1.407676, -0.2044547, 1, 0, 0, 1, 1,
-0.3627455, 0.1969295, -1.041799, 1, 0, 0, 1, 1,
-0.3608776, -1.152887, -2.103586, 1, 0, 0, 1, 1,
-0.3608437, -2.191162, -1.743471, 0, 0, 0, 1, 1,
-0.3595407, -0.4322481, -1.49622, 0, 0, 0, 1, 1,
-0.3545106, 1.896684, -0.6946965, 0, 0, 0, 1, 1,
-0.3497583, -0.424421, -0.8835241, 0, 0, 0, 1, 1,
-0.3474441, -0.8834799, -1.526119, 0, 0, 0, 1, 1,
-0.3471105, 1.09309, -0.7067862, 0, 0, 0, 1, 1,
-0.346202, -0.9860454, -3.029368, 0, 0, 0, 1, 1,
-0.3404303, -0.7455562, -3.828702, 1, 1, 1, 1, 1,
-0.3361298, -1.301089, -3.539532, 1, 1, 1, 1, 1,
-0.3355366, -0.7292492, -1.58277, 1, 1, 1, 1, 1,
-0.333747, 0.7590646, -1.856459, 1, 1, 1, 1, 1,
-0.3284675, -1.137619, -3.887913, 1, 1, 1, 1, 1,
-0.325383, 0.08736292, -1.955294, 1, 1, 1, 1, 1,
-0.3252497, 1.29088, -0.1428321, 1, 1, 1, 1, 1,
-0.3236921, -1.003822, -2.230676, 1, 1, 1, 1, 1,
-0.3197012, 1.529104, -0.4342279, 1, 1, 1, 1, 1,
-0.3192081, -2.055734, -3.95177, 1, 1, 1, 1, 1,
-0.3125769, -1.342788, -2.352986, 1, 1, 1, 1, 1,
-0.3081914, 0.830142, -1.350789, 1, 1, 1, 1, 1,
-0.3062188, 0.7580835, -0.7780441, 1, 1, 1, 1, 1,
-0.3056393, 0.03871372, -3.965387, 1, 1, 1, 1, 1,
-0.3051677, -1.079247, -1.072936, 1, 1, 1, 1, 1,
-0.3004699, -2.337002, -3.663803, 0, 0, 1, 1, 1,
-0.2961141, 0.4106241, -0.9295133, 1, 0, 0, 1, 1,
-0.2948207, 0.9602675, -0.1851082, 1, 0, 0, 1, 1,
-0.2899165, -1.573412, -1.5623, 1, 0, 0, 1, 1,
-0.2892885, -0.0658721, -1.089043, 1, 0, 0, 1, 1,
-0.2824086, 0.7790281, 1.095937, 1, 0, 0, 1, 1,
-0.2755733, 0.4056326, -2.52359, 0, 0, 0, 1, 1,
-0.2750616, -0.9284909, -2.982486, 0, 0, 0, 1, 1,
-0.2700269, 0.06192749, -2.901196, 0, 0, 0, 1, 1,
-0.2679147, -0.2736688, -3.518631, 0, 0, 0, 1, 1,
-0.2526463, 0.6199338, -1.562108, 0, 0, 0, 1, 1,
-0.252336, 0.00297322, -1.473538, 0, 0, 0, 1, 1,
-0.2518346, -1.081453, -3.920223, 0, 0, 0, 1, 1,
-0.2431952, 0.3857757, -0.4056807, 1, 1, 1, 1, 1,
-0.2408083, 0.5783398, -0.8218164, 1, 1, 1, 1, 1,
-0.2386537, 0.2437688, -1.704504, 1, 1, 1, 1, 1,
-0.2315921, 0.73159, -0.3242786, 1, 1, 1, 1, 1,
-0.2281823, 0.5762184, -0.2140576, 1, 1, 1, 1, 1,
-0.2255484, -0.08840249, -2.299436, 1, 1, 1, 1, 1,
-0.2227892, 0.105152, -0.8107858, 1, 1, 1, 1, 1,
-0.2220325, 0.2537201, 1.241882, 1, 1, 1, 1, 1,
-0.2208993, 1.776641, -0.2904084, 1, 1, 1, 1, 1,
-0.220478, -0.1353197, -2.025892, 1, 1, 1, 1, 1,
-0.2149235, 0.687969, 1.101835, 1, 1, 1, 1, 1,
-0.2148775, -0.5353647, -3.269942, 1, 1, 1, 1, 1,
-0.2140344, 0.6650189, 0.5843829, 1, 1, 1, 1, 1,
-0.2128724, -0.497953, -2.363163, 1, 1, 1, 1, 1,
-0.2048974, 0.1369097, 0.7370602, 1, 1, 1, 1, 1,
-0.2038819, -0.457395, -3.424451, 0, 0, 1, 1, 1,
-0.2007508, 1.379622, 0.7672329, 1, 0, 0, 1, 1,
-0.1971162, 0.7860551, -0.1599508, 1, 0, 0, 1, 1,
-0.1931017, -0.5322848, -2.15059, 1, 0, 0, 1, 1,
-0.192755, 0.7382163, -0.602977, 1, 0, 0, 1, 1,
-0.1883833, -0.3172856, -4.104786, 1, 0, 0, 1, 1,
-0.18424, 0.09836057, -0.7165926, 0, 0, 0, 1, 1,
-0.182258, -0.1322532, -3.071228, 0, 0, 0, 1, 1,
-0.1821954, 0.3863998, -0.6734614, 0, 0, 0, 1, 1,
-0.1815538, 0.2579996, 0.1777908, 0, 0, 0, 1, 1,
-0.1806004, -0.8655749, -2.909599, 0, 0, 0, 1, 1,
-0.1722115, -0.1564263, -2.497918, 0, 0, 0, 1, 1,
-0.1718257, -0.5369775, -2.639092, 0, 0, 0, 1, 1,
-0.1692942, -1.40793, -3.569724, 1, 1, 1, 1, 1,
-0.1657259, 0.8050995, -0.6111075, 1, 1, 1, 1, 1,
-0.1641541, -0.474411, -3.754039, 1, 1, 1, 1, 1,
-0.164101, -1.600075, -2.444733, 1, 1, 1, 1, 1,
-0.1639445, 1.220438, -0.1288419, 1, 1, 1, 1, 1,
-0.1631602, 1.248708, -1.064901, 1, 1, 1, 1, 1,
-0.159758, -0.2630422, -1.809492, 1, 1, 1, 1, 1,
-0.1563533, 1.379071, -0.7338699, 1, 1, 1, 1, 1,
-0.1550018, -0.9562694, -4.050507, 1, 1, 1, 1, 1,
-0.1540203, -0.8772812, -2.854048, 1, 1, 1, 1, 1,
-0.1538815, -1.87964, -3.508816, 1, 1, 1, 1, 1,
-0.1535802, -1.033705, -3.530045, 1, 1, 1, 1, 1,
-0.1502119, -1.531927, -3.175068, 1, 1, 1, 1, 1,
-0.1486859, -2.918545, -4.051317, 1, 1, 1, 1, 1,
-0.1476651, 1.727597, 0.8997605, 1, 1, 1, 1, 1,
-0.1473853, -1.227408, -3.285254, 0, 0, 1, 1, 1,
-0.1450686, 1.6286, -1.969888, 1, 0, 0, 1, 1,
-0.1442265, 0.5821024, -0.4409526, 1, 0, 0, 1, 1,
-0.1392552, -1.036783, -2.098982, 1, 0, 0, 1, 1,
-0.1321398, -0.2389922, -0.8826832, 1, 0, 0, 1, 1,
-0.1302578, 0.4850462, 1.737485, 1, 0, 0, 1, 1,
-0.1289536, -1.202644, -3.114093, 0, 0, 0, 1, 1,
-0.1248982, 0.7866494, -1.07967, 0, 0, 0, 1, 1,
-0.1244706, -0.5420709, -2.148313, 0, 0, 0, 1, 1,
-0.1155146, 1.565172, 2.194276, 0, 0, 0, 1, 1,
-0.1150797, -0.8972673, -3.325634, 0, 0, 0, 1, 1,
-0.1139039, 2.137976, -0.1679948, 0, 0, 0, 1, 1,
-0.1098967, -1.675694, -4.149858, 0, 0, 0, 1, 1,
-0.1086168, -0.4828213, -3.579789, 1, 1, 1, 1, 1,
-0.1082236, -0.1997003, -1.511922, 1, 1, 1, 1, 1,
-0.1063593, -0.01578639, -1.243534, 1, 1, 1, 1, 1,
-0.1041237, -0.3445007, -3.132753, 1, 1, 1, 1, 1,
-0.1024796, 0.8151124, -1.221624, 1, 1, 1, 1, 1,
-0.1019658, -1.088586, -4.363024, 1, 1, 1, 1, 1,
-0.09805278, -0.7149792, -3.349421, 1, 1, 1, 1, 1,
-0.09589823, 0.7954972, -0.3335152, 1, 1, 1, 1, 1,
-0.09095225, 1.131733, 0.687243, 1, 1, 1, 1, 1,
-0.08911764, -1.111175, -2.875373, 1, 1, 1, 1, 1,
-0.08875667, -0.1586291, -3.914028, 1, 1, 1, 1, 1,
-0.08550164, 0.4877543, 0.3302102, 1, 1, 1, 1, 1,
-0.08326064, 0.5487503, 0.06952115, 1, 1, 1, 1, 1,
-0.08024517, -0.7496103, -2.89877, 1, 1, 1, 1, 1,
-0.07898962, 1.33438, -1.445134, 1, 1, 1, 1, 1,
-0.07847139, -0.6519176, -1.58106, 0, 0, 1, 1, 1,
-0.07528724, -0.6146321, -2.619722, 1, 0, 0, 1, 1,
-0.07115479, 1.487281, -0.09577961, 1, 0, 0, 1, 1,
-0.07087851, 0.2627933, -0.04108939, 1, 0, 0, 1, 1,
-0.06994559, 1.118571, -1.873668, 1, 0, 0, 1, 1,
-0.06946518, 1.101031, -0.402874, 1, 0, 0, 1, 1,
-0.06940524, 0.524583, 0.176227, 0, 0, 0, 1, 1,
-0.06205157, -0.2812527, -2.396382, 0, 0, 0, 1, 1,
-0.06203496, 0.4081278, -0.4739192, 0, 0, 0, 1, 1,
-0.06144127, -0.5198804, -2.892207, 0, 0, 0, 1, 1,
-0.05797502, 0.3793438, -0.7148907, 0, 0, 0, 1, 1,
-0.05409649, -0.6687767, -3.710575, 0, 0, 0, 1, 1,
-0.05308838, -0.3341213, -1.941727, 0, 0, 0, 1, 1,
-0.05268754, 0.9365631, 0.8508002, 1, 1, 1, 1, 1,
-0.0507557, -0.8044465, -3.275611, 1, 1, 1, 1, 1,
-0.04652272, -0.1366902, -2.249563, 1, 1, 1, 1, 1,
-0.04592024, -2.860133, -3.9038, 1, 1, 1, 1, 1,
-0.03908024, -0.6058318, -2.452814, 1, 1, 1, 1, 1,
-0.03757155, -1.918442, -3.545477, 1, 1, 1, 1, 1,
-0.03649367, -1.66859, -2.306271, 1, 1, 1, 1, 1,
-0.03059668, 0.5526361, -0.8876251, 1, 1, 1, 1, 1,
-0.02672848, -0.2999801, -2.718426, 1, 1, 1, 1, 1,
-0.02164887, 0.3652173, -0.6688524, 1, 1, 1, 1, 1,
-0.01939712, 0.3822414, 0.0008235503, 1, 1, 1, 1, 1,
-0.01674022, 0.05894859, 0.5293209, 1, 1, 1, 1, 1,
-0.0163377, 0.4775317, -2.877953, 1, 1, 1, 1, 1,
-0.01254129, 1.029847, -0.04895116, 1, 1, 1, 1, 1,
-0.00814267, 0.460676, 0.6399269, 1, 1, 1, 1, 1,
-0.006355502, -0.7305253, -2.165944, 0, 0, 1, 1, 1,
-0.006017292, 1.240171, 0.4281734, 1, 0, 0, 1, 1,
0.0008726442, -0.271335, 4.940978, 1, 0, 0, 1, 1,
0.008897052, 0.01558047, 0.8240181, 1, 0, 0, 1, 1,
0.009208119, -0.7434007, 3.339285, 1, 0, 0, 1, 1,
0.01361617, 0.1319329, 0.5909714, 1, 0, 0, 1, 1,
0.014354, 1.032627, 0.2251901, 0, 0, 0, 1, 1,
0.01786998, 1.770752, 1.386365, 0, 0, 0, 1, 1,
0.02052146, 0.1795773, 0.7120554, 0, 0, 0, 1, 1,
0.02060349, 0.9062207, 1.605876, 0, 0, 0, 1, 1,
0.0224702, -0.1034971, 4.270708, 0, 0, 0, 1, 1,
0.02392429, -1.049768, 3.323479, 0, 0, 0, 1, 1,
0.02755719, -0.233689, 1.914079, 0, 0, 0, 1, 1,
0.03591881, 2.000557, 1.060269, 1, 1, 1, 1, 1,
0.0360111, -0.4167936, 1.947071, 1, 1, 1, 1, 1,
0.03604016, -3.256927, 2.428061, 1, 1, 1, 1, 1,
0.03617575, 0.3975601, -1.095055, 1, 1, 1, 1, 1,
0.03907828, -1.044455, 2.791242, 1, 1, 1, 1, 1,
0.04263872, -0.6251071, 2.421026, 1, 1, 1, 1, 1,
0.04482955, -1.314697, 4.507922, 1, 1, 1, 1, 1,
0.04860589, 2.319771, -0.847944, 1, 1, 1, 1, 1,
0.05019682, -0.8768237, 2.331071, 1, 1, 1, 1, 1,
0.05269063, -0.1620174, 1.338423, 1, 1, 1, 1, 1,
0.0544309, -0.3012765, 4.85221, 1, 1, 1, 1, 1,
0.05700899, -0.9088989, 3.440561, 1, 1, 1, 1, 1,
0.05788938, 1.124567, -0.7428319, 1, 1, 1, 1, 1,
0.05995094, 0.5465977, 1.059753, 1, 1, 1, 1, 1,
0.06051102, 0.2137589, -1.058654, 1, 1, 1, 1, 1,
0.06061246, -0.1863008, 0.6410167, 0, 0, 1, 1, 1,
0.06111915, -0.3479042, 2.116008, 1, 0, 0, 1, 1,
0.06785201, 0.6855398, 0.1152141, 1, 0, 0, 1, 1,
0.06804825, -0.04249182, 1.106785, 1, 0, 0, 1, 1,
0.07207391, 2.161895, 1.182984, 1, 0, 0, 1, 1,
0.07258661, 0.5953344, 0.7579527, 1, 0, 0, 1, 1,
0.07417529, -0.5195827, 3.45295, 0, 0, 0, 1, 1,
0.08049534, -0.06392778, 3.373641, 0, 0, 0, 1, 1,
0.08476111, 0.06990834, -0.625713, 0, 0, 0, 1, 1,
0.08816946, 0.3231939, 0.006744427, 0, 0, 0, 1, 1,
0.08826776, 0.6818601, -1.243648, 0, 0, 0, 1, 1,
0.09024545, -0.7818219, 2.078341, 0, 0, 0, 1, 1,
0.09298459, 0.2302687, -0.4950111, 0, 0, 0, 1, 1,
0.0985513, 1.055017, 1.643865, 1, 1, 1, 1, 1,
0.1035208, 0.7264506, 1.370156, 1, 1, 1, 1, 1,
0.107085, -0.4448434, 3.358902, 1, 1, 1, 1, 1,
0.1079791, 0.2295107, 0.5771925, 1, 1, 1, 1, 1,
0.1123488, 0.04226884, 1.659609, 1, 1, 1, 1, 1,
0.1217933, 0.8377348, 1.473818, 1, 1, 1, 1, 1,
0.1218088, 0.1339971, 0.08674995, 1, 1, 1, 1, 1,
0.1264257, 2.625254, -0.3366251, 1, 1, 1, 1, 1,
0.1292936, -0.2839198, 2.192189, 1, 1, 1, 1, 1,
0.1325493, 0.8102817, 0.3616421, 1, 1, 1, 1, 1,
0.1334312, 0.1708531, 0.7519103, 1, 1, 1, 1, 1,
0.1368752, 1.586825, 1.519825, 1, 1, 1, 1, 1,
0.138647, -0.5646008, 2.037913, 1, 1, 1, 1, 1,
0.1443428, -0.1619815, 0.3919323, 1, 1, 1, 1, 1,
0.1494323, -1.2041, 3.581156, 1, 1, 1, 1, 1,
0.1500785, -0.3810948, 2.39887, 0, 0, 1, 1, 1,
0.1506695, -0.8366456, 2.740216, 1, 0, 0, 1, 1,
0.1510457, -0.6418468, 2.826292, 1, 0, 0, 1, 1,
0.1513173, -1.189046, 1.836048, 1, 0, 0, 1, 1,
0.1551785, -0.696937, 4.604568, 1, 0, 0, 1, 1,
0.1612599, -0.1547635, 2.460471, 1, 0, 0, 1, 1,
0.1719497, 1.433458, 0.3123917, 0, 0, 0, 1, 1,
0.1785625, -0.4765323, 2.739722, 0, 0, 0, 1, 1,
0.1806199, 0.006073087, 1.426307, 0, 0, 0, 1, 1,
0.180646, -0.5859594, 2.749149, 0, 0, 0, 1, 1,
0.1856274, -0.08854932, 2.270437, 0, 0, 0, 1, 1,
0.187228, -0.3034264, 2.26532, 0, 0, 0, 1, 1,
0.1880392, 1.389285, 0.68419, 0, 0, 0, 1, 1,
0.1889227, 0.2042712, 1.262715, 1, 1, 1, 1, 1,
0.1904129, 0.5961444, 2.683682, 1, 1, 1, 1, 1,
0.1920461, -1.298428, 3.412519, 1, 1, 1, 1, 1,
0.2013896, 1.123027, -0.4264603, 1, 1, 1, 1, 1,
0.20225, -0.7260165, 1.358461, 1, 1, 1, 1, 1,
0.2038817, -0.6602566, 3.42339, 1, 1, 1, 1, 1,
0.2048644, 0.6809458, 0.3448225, 1, 1, 1, 1, 1,
0.2057085, -1.79806, 2.370213, 1, 1, 1, 1, 1,
0.2102027, -0.2562544, 2.010681, 1, 1, 1, 1, 1,
0.2119576, -0.2846055, 0.5688395, 1, 1, 1, 1, 1,
0.2128393, 2.574148, 0.9546433, 1, 1, 1, 1, 1,
0.2135136, 0.6936237, -0.7577572, 1, 1, 1, 1, 1,
0.216247, -0.1028806, 1.971459, 1, 1, 1, 1, 1,
0.2210375, -0.2033456, 2.115784, 1, 1, 1, 1, 1,
0.2225125, -2.546868, 2.850883, 1, 1, 1, 1, 1,
0.2247917, -0.601108, 5.396826, 0, 0, 1, 1, 1,
0.2321404, -1.752378, 3.967633, 1, 0, 0, 1, 1,
0.2323969, 0.2092623, 1.924967, 1, 0, 0, 1, 1,
0.2335298, 0.7189806, -0.4785499, 1, 0, 0, 1, 1,
0.2335472, 0.32793, 0.8125992, 1, 0, 0, 1, 1,
0.2397878, 0.4574223, 1.211605, 1, 0, 0, 1, 1,
0.2411527, -1.018316, 4.014676, 0, 0, 0, 1, 1,
0.2431873, -0.9687542, 1.443481, 0, 0, 0, 1, 1,
0.2471533, 1.958246, 1.107952, 0, 0, 0, 1, 1,
0.2485948, 0.7744785, 1.203101, 0, 0, 0, 1, 1,
0.2533319, 1.507383, -0.3781159, 0, 0, 0, 1, 1,
0.253399, 1.688931, 1.395977, 0, 0, 0, 1, 1,
0.2550872, -0.2118848, 2.860091, 0, 0, 0, 1, 1,
0.2568872, 0.6818527, 0.0262791, 1, 1, 1, 1, 1,
0.2572228, -0.2835664, 1.046161, 1, 1, 1, 1, 1,
0.25745, -2.026988, 1.445747, 1, 1, 1, 1, 1,
0.2594394, 1.390189, 0.8607289, 1, 1, 1, 1, 1,
0.2637802, -1.176608, 3.408766, 1, 1, 1, 1, 1,
0.2675198, 0.1222607, 1.4996, 1, 1, 1, 1, 1,
0.2682578, 0.5999885, 0.139287, 1, 1, 1, 1, 1,
0.2684672, -0.8454083, 2.491294, 1, 1, 1, 1, 1,
0.2732423, 1.341789, 1.181644, 1, 1, 1, 1, 1,
0.2733191, -1.604082, 3.726923, 1, 1, 1, 1, 1,
0.2755374, -0.650065, 2.309527, 1, 1, 1, 1, 1,
0.2794781, -1.208224, 1.698946, 1, 1, 1, 1, 1,
0.2806376, 0.7766263, 0.9349087, 1, 1, 1, 1, 1,
0.2811966, 1.135554, 0.6423545, 1, 1, 1, 1, 1,
0.2817495, -0.2066394, 3.024482, 1, 1, 1, 1, 1,
0.2829236, 0.4268388, 1.36998, 0, 0, 1, 1, 1,
0.2918514, -0.2691031, 1.976863, 1, 0, 0, 1, 1,
0.2929856, -1.016262, 3.024344, 1, 0, 0, 1, 1,
0.2932905, 1.31668, 0.5970051, 1, 0, 0, 1, 1,
0.2940696, 0.8755651, -1.012369, 1, 0, 0, 1, 1,
0.2966382, 1.770496, 0.4291008, 1, 0, 0, 1, 1,
0.2971874, 0.4508474, 0.8702689, 0, 0, 0, 1, 1,
0.2998275, 0.808392, 0.5432202, 0, 0, 0, 1, 1,
0.3031518, 0.9846007, 1.423689, 0, 0, 0, 1, 1,
0.307327, 0.8693866, -0.05805136, 0, 0, 0, 1, 1,
0.3076821, 0.9305991, -0.5659072, 0, 0, 0, 1, 1,
0.3082173, -0.5602103, 2.430027, 0, 0, 0, 1, 1,
0.3116582, 0.5203017, -0.2454899, 0, 0, 0, 1, 1,
0.3131393, 0.06568182, -1.03937, 1, 1, 1, 1, 1,
0.3141596, -1.311463, 4.202304, 1, 1, 1, 1, 1,
0.3151981, -0.6496044, 3.509281, 1, 1, 1, 1, 1,
0.3167176, -0.5554424, 1.790784, 1, 1, 1, 1, 1,
0.3171772, 0.4245565, 0.3757178, 1, 1, 1, 1, 1,
0.3176173, -1.093881, 3.156299, 1, 1, 1, 1, 1,
0.3208083, -0.5989882, 2.624034, 1, 1, 1, 1, 1,
0.3290205, -0.0601992, 2.246222, 1, 1, 1, 1, 1,
0.3378753, -0.7598537, 1.796144, 1, 1, 1, 1, 1,
0.3398942, -0.2137444, 3.140794, 1, 1, 1, 1, 1,
0.3422994, 0.4427001, 1.49302, 1, 1, 1, 1, 1,
0.343099, 0.3381184, 1.57618, 1, 1, 1, 1, 1,
0.3479672, -1.747718, 4.138969, 1, 1, 1, 1, 1,
0.3480106, -0.05718812, 2.1095, 1, 1, 1, 1, 1,
0.3515027, 0.5841115, 0.7440022, 1, 1, 1, 1, 1,
0.3518675, -0.3684612, 2.508375, 0, 0, 1, 1, 1,
0.3533034, -0.9591064, 2.705176, 1, 0, 0, 1, 1,
0.3589757, 0.33497, 0.7707554, 1, 0, 0, 1, 1,
0.3603877, -0.05913486, 1.182073, 1, 0, 0, 1, 1,
0.3613952, -0.2240552, 0.926271, 1, 0, 0, 1, 1,
0.3763393, -1.896598, 4.051216, 1, 0, 0, 1, 1,
0.3838469, 1.261402, -0.6967477, 0, 0, 0, 1, 1,
0.3850496, -0.9988784, 3.773042, 0, 0, 0, 1, 1,
0.3853373, -0.8993549, 1.515482, 0, 0, 0, 1, 1,
0.3856285, -0.1308041, 1.169785, 0, 0, 0, 1, 1,
0.385951, 0.03298081, 1.501682, 0, 0, 0, 1, 1,
0.3890931, -1.345087, 2.716903, 0, 0, 0, 1, 1,
0.3951552, -0.4777192, 1.505936, 0, 0, 0, 1, 1,
0.4060043, 0.9885338, 0.2341218, 1, 1, 1, 1, 1,
0.4107442, 1.452652, 1.432853, 1, 1, 1, 1, 1,
0.4151075, 1.145877, -0.9544999, 1, 1, 1, 1, 1,
0.4174546, 0.4507495, -1.018572, 1, 1, 1, 1, 1,
0.4263136, 0.8600258, 0.2653121, 1, 1, 1, 1, 1,
0.4279945, 2.802445, 2.088165, 1, 1, 1, 1, 1,
0.4296207, -0.9195799, 1.090058, 1, 1, 1, 1, 1,
0.4296297, -0.2461535, 1.584481, 1, 1, 1, 1, 1,
0.4299145, -1.444348, 3.328047, 1, 1, 1, 1, 1,
0.4346191, -0.73094, 2.125842, 1, 1, 1, 1, 1,
0.4347159, -0.6838553, 3.016455, 1, 1, 1, 1, 1,
0.4351816, 1.00607, -0.5613225, 1, 1, 1, 1, 1,
0.4356661, 1.343305, 0.6986472, 1, 1, 1, 1, 1,
0.437417, 0.3537618, 0.6528115, 1, 1, 1, 1, 1,
0.4377894, -0.2505912, 1.684977, 1, 1, 1, 1, 1,
0.4403127, -1.300564, 2.966371, 0, 0, 1, 1, 1,
0.4469399, -0.74297, 2.339567, 1, 0, 0, 1, 1,
0.4490944, 1.258036, 2.032407, 1, 0, 0, 1, 1,
0.4542898, 1.125352, -0.3496816, 1, 0, 0, 1, 1,
0.4551883, -0.8644357, 2.889043, 1, 0, 0, 1, 1,
0.4562339, -0.2807419, 1.506815, 1, 0, 0, 1, 1,
0.4634564, 0.8761377, 0.4146492, 0, 0, 0, 1, 1,
0.46992, -0.7752312, 1.790349, 0, 0, 0, 1, 1,
0.4713168, 0.2120125, 1.425905, 0, 0, 0, 1, 1,
0.4725272, 1.964074, 0.8632632, 0, 0, 0, 1, 1,
0.4729257, -0.9701166, 2.874613, 0, 0, 0, 1, 1,
0.4738024, 0.2032712, 2.042598, 0, 0, 0, 1, 1,
0.4777811, -0.2230639, 2.824048, 0, 0, 0, 1, 1,
0.4782926, 1.510748, 0.03885642, 1, 1, 1, 1, 1,
0.4851987, -1.065009, 4.065206, 1, 1, 1, 1, 1,
0.4852445, -0.1941797, 2.153013, 1, 1, 1, 1, 1,
0.4866595, -0.3094081, 2.248444, 1, 1, 1, 1, 1,
0.4868486, 1.590605, -0.1527662, 1, 1, 1, 1, 1,
0.4895173, 0.1626184, -0.2388234, 1, 1, 1, 1, 1,
0.4905089, -1.507854, 2.123935, 1, 1, 1, 1, 1,
0.5014337, 0.1411757, 1.957435, 1, 1, 1, 1, 1,
0.5020677, 0.09247147, 0.8422774, 1, 1, 1, 1, 1,
0.5041232, 0.3998859, 0.05848728, 1, 1, 1, 1, 1,
0.5065988, 0.6152168, 1.752852, 1, 1, 1, 1, 1,
0.5091473, 1.525728, -0.947856, 1, 1, 1, 1, 1,
0.5113717, 0.1336195, 0.03628651, 1, 1, 1, 1, 1,
0.5184941, 1.457948, 1.316623, 1, 1, 1, 1, 1,
0.5189356, -1.313461, 3.150226, 1, 1, 1, 1, 1,
0.5194348, -0.9863196, 0.8982991, 0, 0, 1, 1, 1,
0.5225555, 0.511034, 1.517349, 1, 0, 0, 1, 1,
0.5237187, -0.3795753, 4.467296, 1, 0, 0, 1, 1,
0.5237368, -1.697637, 3.551802, 1, 0, 0, 1, 1,
0.5297061, -0.3105841, 2.264881, 1, 0, 0, 1, 1,
0.5304772, -0.8933592, 2.885283, 1, 0, 0, 1, 1,
0.5319192, -1.219248, 2.999743, 0, 0, 0, 1, 1,
0.5319822, 0.05167346, 1.767379, 0, 0, 0, 1, 1,
0.533419, 1.592808, -0.3269651, 0, 0, 0, 1, 1,
0.5442354, 1.11292, 0.8378919, 0, 0, 0, 1, 1,
0.5475073, 0.8278544, -0.6798704, 0, 0, 0, 1, 1,
0.5513328, 0.5615039, 0.08931253, 0, 0, 0, 1, 1,
0.5524523, -0.5291478, 1.552732, 0, 0, 0, 1, 1,
0.5525028, -0.4915117, 2.919817, 1, 1, 1, 1, 1,
0.5559791, -0.2527674, 2.124105, 1, 1, 1, 1, 1,
0.5580074, -0.3163738, 2.054306, 1, 1, 1, 1, 1,
0.5603623, -3.565942, 2.212982, 1, 1, 1, 1, 1,
0.5633744, -1.963612, 2.340215, 1, 1, 1, 1, 1,
0.5643397, -1.157934, 2.957541, 1, 1, 1, 1, 1,
0.5666916, 0.9313862, 0.6506471, 1, 1, 1, 1, 1,
0.5675268, 0.4860876, 0.2781431, 1, 1, 1, 1, 1,
0.5772212, 0.468192, 1.088015, 1, 1, 1, 1, 1,
0.5789094, -0.956348, 2.51159, 1, 1, 1, 1, 1,
0.5797249, -0.2280161, 2.132841, 1, 1, 1, 1, 1,
0.5807848, 0.04766181, 2.645637, 1, 1, 1, 1, 1,
0.5835349, -1.405477, 3.435348, 1, 1, 1, 1, 1,
0.5844867, 2.121431, 2.167788, 1, 1, 1, 1, 1,
0.5927708, 1.460559, 0.4135633, 1, 1, 1, 1, 1,
0.594439, -0.886739, 3.580454, 0, 0, 1, 1, 1,
0.594865, -0.8629307, 4.853127, 1, 0, 0, 1, 1,
0.5986404, -0.2885562, 2.507338, 1, 0, 0, 1, 1,
0.5989333, 0.7604763, 0.7439925, 1, 0, 0, 1, 1,
0.6001549, 0.2827044, 1.37713, 1, 0, 0, 1, 1,
0.6058129, -0.03901009, 2.359392, 1, 0, 0, 1, 1,
0.6072922, 0.4790006, 0.3356768, 0, 0, 0, 1, 1,
0.6162238, 1.18388, -0.1798331, 0, 0, 0, 1, 1,
0.6187443, 0.5479804, 1.145305, 0, 0, 0, 1, 1,
0.6204275, -0.6205088, 3.783707, 0, 0, 0, 1, 1,
0.6286741, -0.6600088, 1.582792, 0, 0, 0, 1, 1,
0.6351868, 1.043753, 0.06846102, 0, 0, 0, 1, 1,
0.6356358, -0.1341229, 2.654488, 0, 0, 0, 1, 1,
0.6365577, 1.237582, 0.3581716, 1, 1, 1, 1, 1,
0.6377256, 0.1704597, 0.5588402, 1, 1, 1, 1, 1,
0.6388893, -0.2271294, 2.433557, 1, 1, 1, 1, 1,
0.6454608, -1.150781, 2.129182, 1, 1, 1, 1, 1,
0.6458778, 0.6700212, 0.6877538, 1, 1, 1, 1, 1,
0.6477339, 0.7240408, 2.029685, 1, 1, 1, 1, 1,
0.6506005, -0.2759553, 1.521094, 1, 1, 1, 1, 1,
0.653437, -0.5618316, 1.640653, 1, 1, 1, 1, 1,
0.658252, -1.576011, 4.084437, 1, 1, 1, 1, 1,
0.6611559, -0.9311528, 3.534497, 1, 1, 1, 1, 1,
0.671463, -0.7539499, 2.626904, 1, 1, 1, 1, 1,
0.6766879, -0.413663, 1.913618, 1, 1, 1, 1, 1,
0.6772693, 2.225538, 2.029635, 1, 1, 1, 1, 1,
0.6803918, -0.2509727, 2.10984, 1, 1, 1, 1, 1,
0.6809782, -0.8454949, 1.413002, 1, 1, 1, 1, 1,
0.6835003, -0.764461, 2.855585, 0, 0, 1, 1, 1,
0.684634, 1.239908, -0.639988, 1, 0, 0, 1, 1,
0.6854066, -0.2816968, 3.26354, 1, 0, 0, 1, 1,
0.6891086, 1.630126, 0.7580098, 1, 0, 0, 1, 1,
0.696448, 0.09670945, 0.4776372, 1, 0, 0, 1, 1,
0.7032264, -1.147435, 3.203341, 1, 0, 0, 1, 1,
0.7086507, 0.2878052, 1.328048, 0, 0, 0, 1, 1,
0.7124846, 2.09596, -2.408905, 0, 0, 0, 1, 1,
0.7144828, 0.3784935, 0.5203648, 0, 0, 0, 1, 1,
0.7195938, 1.113632, -0.04013042, 0, 0, 0, 1, 1,
0.72708, -0.928654, 2.446696, 0, 0, 0, 1, 1,
0.7317448, 1.354663, -0.08328274, 0, 0, 0, 1, 1,
0.7341236, -0.1508796, 1.564928, 0, 0, 0, 1, 1,
0.7408623, 1.963456, 2.2034, 1, 1, 1, 1, 1,
0.7420928, -0.3717348, 2.355885, 1, 1, 1, 1, 1,
0.7437922, 0.5349343, 0.6681216, 1, 1, 1, 1, 1,
0.7438096, -0.09698919, 3.864247, 1, 1, 1, 1, 1,
0.7446933, 0.3410824, 1.041424, 1, 1, 1, 1, 1,
0.7466562, -0.8565586, 2.601631, 1, 1, 1, 1, 1,
0.7599149, -1.280731, 1.804083, 1, 1, 1, 1, 1,
0.7600732, -0.4052195, 1.118678, 1, 1, 1, 1, 1,
0.7608594, -0.3786038, 1.497674, 1, 1, 1, 1, 1,
0.7655409, 0.3741693, -0.6006065, 1, 1, 1, 1, 1,
0.7690179, 0.6888646, 2.073375, 1, 1, 1, 1, 1,
0.7706028, 1.144295, -0.5260217, 1, 1, 1, 1, 1,
0.7734829, 0.7407916, 0.4396988, 1, 1, 1, 1, 1,
0.7737687, 0.5928766, 2.239946, 1, 1, 1, 1, 1,
0.7767275, -1.313994, 1.063293, 1, 1, 1, 1, 1,
0.780718, 1.050772, -1.109726, 0, 0, 1, 1, 1,
0.7809467, 1.087205, 0.08761109, 1, 0, 0, 1, 1,
0.7834321, -0.2068139, -0.6770684, 1, 0, 0, 1, 1,
0.7840914, -0.3056751, 2.555237, 1, 0, 0, 1, 1,
0.7843257, 2.099482, 1.496758, 1, 0, 0, 1, 1,
0.7903062, 0.5101386, 2.227705, 1, 0, 0, 1, 1,
0.7939541, -0.6736047, 0.4806477, 0, 0, 0, 1, 1,
0.7970867, 0.6995928, 0.07852628, 0, 0, 0, 1, 1,
0.8029715, 0.8760468, 0.9292957, 0, 0, 0, 1, 1,
0.8100911, -0.25568, 1.258212, 0, 0, 0, 1, 1,
0.8198408, -0.09027449, 1.795509, 0, 0, 0, 1, 1,
0.8267982, -0.9305515, 2.42298, 0, 0, 0, 1, 1,
0.8288261, -1.078768, 3.007035, 0, 0, 0, 1, 1,
0.8310328, 2.318493, 0.4785818, 1, 1, 1, 1, 1,
0.8354774, 0.8804685, 0.8127645, 1, 1, 1, 1, 1,
0.8379766, -0.3767129, 0.9351768, 1, 1, 1, 1, 1,
0.8405546, -0.3364839, 3.550535, 1, 1, 1, 1, 1,
0.8428177, -0.7132379, 1.25779, 1, 1, 1, 1, 1,
0.8496674, 1.380778, 0.0588803, 1, 1, 1, 1, 1,
0.8503841, 0.8070315, -0.4216161, 1, 1, 1, 1, 1,
0.8623293, -1.252201, 2.211157, 1, 1, 1, 1, 1,
0.8639528, 1.141411, 1.27767, 1, 1, 1, 1, 1,
0.86415, -0.141267, 2.631731, 1, 1, 1, 1, 1,
0.8644079, -0.8240241, 3.655169, 1, 1, 1, 1, 1,
0.8661838, -0.1564468, 0.8184522, 1, 1, 1, 1, 1,
0.871395, -0.849652, 1.156897, 1, 1, 1, 1, 1,
0.8756918, -1.18617, 2.798648, 1, 1, 1, 1, 1,
0.8845232, -0.2455866, 1.93076, 1, 1, 1, 1, 1,
0.8893606, -2.157352, 2.35854, 0, 0, 1, 1, 1,
0.8942626, -2.072434, 3.706822, 1, 0, 0, 1, 1,
0.9031462, 1.130502, 1.140503, 1, 0, 0, 1, 1,
0.9033564, 0.9487138, 1.61036, 1, 0, 0, 1, 1,
0.9151112, 0.9837312, 1.043527, 1, 0, 0, 1, 1,
0.9170889, 1.082917, 1.134661, 1, 0, 0, 1, 1,
0.9191879, -1.762694, 2.506347, 0, 0, 0, 1, 1,
0.9194047, -1.273906, 2.900058, 0, 0, 0, 1, 1,
0.9243619, -0.2718639, 1.617657, 0, 0, 0, 1, 1,
0.9272629, -0.4592709, 4.107561, 0, 0, 0, 1, 1,
0.9291236, 1.297205, 0.2579237, 0, 0, 0, 1, 1,
0.9353662, 0.2661701, -0.6384596, 0, 0, 0, 1, 1,
0.9391771, 0.4756968, 0.5750666, 0, 0, 0, 1, 1,
0.9399316, -0.357388, 2.371661, 1, 1, 1, 1, 1,
0.9465429, -0.4810333, 0.6594281, 1, 1, 1, 1, 1,
0.9515173, -0.2006319, 1.732298, 1, 1, 1, 1, 1,
0.9518178, 0.4602228, 1.00761, 1, 1, 1, 1, 1,
0.9585329, 1.053549, 0.08284233, 1, 1, 1, 1, 1,
0.9616515, 0.5793405, 0.7072868, 1, 1, 1, 1, 1,
0.9635389, 1.026188, 0.5948688, 1, 1, 1, 1, 1,
0.9668761, -0.5248072, 4.591914, 1, 1, 1, 1, 1,
0.9691324, -0.1288171, 2.998079, 1, 1, 1, 1, 1,
0.9692104, 1.447554, 1.588889, 1, 1, 1, 1, 1,
0.971181, -1.802355, 1.954542, 1, 1, 1, 1, 1,
0.9864479, 0.9470299, 1.677101, 1, 1, 1, 1, 1,
0.9886298, 0.9243337, 0.6374117, 1, 1, 1, 1, 1,
0.9906432, -0.9430588, 1.309115, 1, 1, 1, 1, 1,
0.9930588, 1.603926, 0.2799483, 1, 1, 1, 1, 1,
0.9931779, 1.324017, 1.172147, 0, 0, 1, 1, 1,
0.9962739, 0.7029756, 1.56039, 1, 0, 0, 1, 1,
0.9965221, -0.7222613, 4.645993, 1, 0, 0, 1, 1,
1.001562, -0.7335492, 3.253815, 1, 0, 0, 1, 1,
1.01663, 1.200324, 0.03983782, 1, 0, 0, 1, 1,
1.018313, 0.2435956, 2.42539, 1, 0, 0, 1, 1,
1.020557, -0.1708719, 2.815477, 0, 0, 0, 1, 1,
1.026315, 0.6286979, 1.675072, 0, 0, 0, 1, 1,
1.026564, 2.406205, -0.3356489, 0, 0, 0, 1, 1,
1.032817, 0.05289223, 2.40509, 0, 0, 0, 1, 1,
1.057542, 0.516849, -0.4410856, 0, 0, 0, 1, 1,
1.059299, 1.036926, 2.050514, 0, 0, 0, 1, 1,
1.063797, 0.9776782, 0.5749758, 0, 0, 0, 1, 1,
1.066701, 1.214372, 1.76785, 1, 1, 1, 1, 1,
1.069206, 0.263416, 2.390056, 1, 1, 1, 1, 1,
1.069566, -0.02759672, 3.268776, 1, 1, 1, 1, 1,
1.073546, 0.2152637, 3.038424, 1, 1, 1, 1, 1,
1.081339, -0.2594094, 2.42228, 1, 1, 1, 1, 1,
1.082242, -0.4731397, 1.780739, 1, 1, 1, 1, 1,
1.096744, -0.3542323, 1.555388, 1, 1, 1, 1, 1,
1.104877, 0.2621065, 0.1973809, 1, 1, 1, 1, 1,
1.115613, -1.417235, 2.615801, 1, 1, 1, 1, 1,
1.120642, 0.6309795, 2.082115, 1, 1, 1, 1, 1,
1.122937, -0.4996652, 1.135539, 1, 1, 1, 1, 1,
1.123741, -0.8215854, 0.2761645, 1, 1, 1, 1, 1,
1.124898, 0.09192117, -0.3622311, 1, 1, 1, 1, 1,
1.129094, 1.718711, 1.115391, 1, 1, 1, 1, 1,
1.135669, -0.821839, 0.86115, 1, 1, 1, 1, 1,
1.136139, 0.28411, 0.6313068, 0, 0, 1, 1, 1,
1.136367, 0.9507076, -0.800009, 1, 0, 0, 1, 1,
1.152888, 0.2134397, 2.140759, 1, 0, 0, 1, 1,
1.154737, -0.9096807, 1.322894, 1, 0, 0, 1, 1,
1.159004, 0.8965393, 1.871777, 1, 0, 0, 1, 1,
1.162067, -1.227917, 2.413644, 1, 0, 0, 1, 1,
1.162891, 0.217056, 2.822502, 0, 0, 0, 1, 1,
1.167847, 1.53524, 2.020533, 0, 0, 0, 1, 1,
1.180508, -1.42802, 5.005678, 0, 0, 0, 1, 1,
1.183514, 0.6148946, 1.652012, 0, 0, 0, 1, 1,
1.187329, -0.8379011, 1.415465, 0, 0, 0, 1, 1,
1.188805, -0.7593878, 1.59953, 0, 0, 0, 1, 1,
1.195356, -1.764791, 3.197492, 0, 0, 0, 1, 1,
1.195578, 0.4279309, 3.210969, 1, 1, 1, 1, 1,
1.195794, -0.7273948, 3.276219, 1, 1, 1, 1, 1,
1.209878, 0.9407221, -0.5366517, 1, 1, 1, 1, 1,
1.214492, -1.374732, 3.648229, 1, 1, 1, 1, 1,
1.214873, 1.667626, -0.2570907, 1, 1, 1, 1, 1,
1.219188, -0.7815906, 1.945208, 1, 1, 1, 1, 1,
1.23513, 2.392363, 0.667579, 1, 1, 1, 1, 1,
1.241799, 1.022792, -0.5475035, 1, 1, 1, 1, 1,
1.256286, -1.718546, 3.412304, 1, 1, 1, 1, 1,
1.25731, -0.1122443, 4.076554, 1, 1, 1, 1, 1,
1.260317, 1.503435, 0.7251247, 1, 1, 1, 1, 1,
1.262466, -0.7540148, 0.4797705, 1, 1, 1, 1, 1,
1.262472, 1.236624, 0.3610238, 1, 1, 1, 1, 1,
1.264598, 0.1020594, 1.764372, 1, 1, 1, 1, 1,
1.267796, -1.056987, 1.393415, 1, 1, 1, 1, 1,
1.268595, -1.187184, 1.499206, 0, 0, 1, 1, 1,
1.279284, 0.6321363, 2.469937, 1, 0, 0, 1, 1,
1.280513, -1.015161, 3.099513, 1, 0, 0, 1, 1,
1.28234, 0.9946212, 1.323625, 1, 0, 0, 1, 1,
1.325774, -0.6112501, 2.129758, 1, 0, 0, 1, 1,
1.326246, -0.04308131, 1.277119, 1, 0, 0, 1, 1,
1.332132, 0.5218461, 1.424639, 0, 0, 0, 1, 1,
1.336502, 0.6882687, 2.028544, 0, 0, 0, 1, 1,
1.339209, 1.302906, 0.7292841, 0, 0, 0, 1, 1,
1.346422, -0.1585318, -0.1575985, 0, 0, 0, 1, 1,
1.348601, 2.090109, 1.577533, 0, 0, 0, 1, 1,
1.358121, -0.3809102, 2.688118, 0, 0, 0, 1, 1,
1.359701, -0.3024707, 1.323699, 0, 0, 0, 1, 1,
1.36501, 1.313808, 0.6906641, 1, 1, 1, 1, 1,
1.369552, 0.3037274, 1.526755, 1, 1, 1, 1, 1,
1.382951, -0.2440437, 2.140892, 1, 1, 1, 1, 1,
1.399591, -2.066909, 3.901799, 1, 1, 1, 1, 1,
1.406426, 2.54906, 1.339427, 1, 1, 1, 1, 1,
1.408556, -0.6752368, 3.846847, 1, 1, 1, 1, 1,
1.409083, -0.994755, 2.787359, 1, 1, 1, 1, 1,
1.412211, 0.3621397, 1.488215, 1, 1, 1, 1, 1,
1.412477, 1.704676, -0.2505789, 1, 1, 1, 1, 1,
1.415917, -0.4973893, 1.070896, 1, 1, 1, 1, 1,
1.429497, 0.7974651, 1.173049, 1, 1, 1, 1, 1,
1.434443, 1.286961, 1.781846, 1, 1, 1, 1, 1,
1.455807, -0.3724102, 2.564053, 1, 1, 1, 1, 1,
1.474373, -0.1977564, 0.4178435, 1, 1, 1, 1, 1,
1.474447, -1.717592, 3.069382, 1, 1, 1, 1, 1,
1.483748, 0.9562451, 1.092327, 0, 0, 1, 1, 1,
1.484445, -0.3853753, 0.9642072, 1, 0, 0, 1, 1,
1.488059, 0.178272, 1.706004, 1, 0, 0, 1, 1,
1.495724, -1.703941, 0.708806, 1, 0, 0, 1, 1,
1.500731, 0.0270197, 2.183995, 1, 0, 0, 1, 1,
1.504423, 0.2407466, 1.378571, 1, 0, 0, 1, 1,
1.529786, -0.9995053, 0.3308323, 0, 0, 0, 1, 1,
1.532588, -0.3736264, 3.09996, 0, 0, 0, 1, 1,
1.543093, 1.868682, 2.429451, 0, 0, 0, 1, 1,
1.544429, 0.3175478, 1.286738, 0, 0, 0, 1, 1,
1.550238, 0.09951065, 3.430476, 0, 0, 0, 1, 1,
1.555055, 0.1731106, 2.262589, 0, 0, 0, 1, 1,
1.555069, 0.6424276, 0.5840788, 0, 0, 0, 1, 1,
1.56765, 2.87835, -2.004245, 1, 1, 1, 1, 1,
1.570127, 0.7178931, 3.11369, 1, 1, 1, 1, 1,
1.579466, -0.7684119, 1.276641, 1, 1, 1, 1, 1,
1.592706, 2.529816, 0.2609133, 1, 1, 1, 1, 1,
1.599414, 0.9753355, 0.569186, 1, 1, 1, 1, 1,
1.604487, -0.8450999, 1.227102, 1, 1, 1, 1, 1,
1.608129, 0.6538568, 1.187413, 1, 1, 1, 1, 1,
1.610274, -1.920149, 2.79021, 1, 1, 1, 1, 1,
1.628928, -1.154838, 3.380906, 1, 1, 1, 1, 1,
1.633823, -0.5990877, 1.757972, 1, 1, 1, 1, 1,
1.638837, -0.2607754, 2.922603, 1, 1, 1, 1, 1,
1.641542, 0.8003677, 1.348279, 1, 1, 1, 1, 1,
1.644086, -0.578685, 1.377302, 1, 1, 1, 1, 1,
1.678734, 1.453002, 1.862593, 1, 1, 1, 1, 1,
1.683559, 0.6462143, 1.027916, 1, 1, 1, 1, 1,
1.684414, 1.005909, 0.5364342, 0, 0, 1, 1, 1,
1.686731, 0.7940012, 2.604983, 1, 0, 0, 1, 1,
1.687155, -1.514792, 3.983705, 1, 0, 0, 1, 1,
1.689469, 0.2658109, 1.482883, 1, 0, 0, 1, 1,
1.698122, 0.8174815, 1.393851, 1, 0, 0, 1, 1,
1.702492, 0.9667721, 0.6262356, 1, 0, 0, 1, 1,
1.71156, -1.814717, 3.024091, 0, 0, 0, 1, 1,
1.734486, -1.716729, 3.067372, 0, 0, 0, 1, 1,
1.736888, 0.3652804, 1.954614, 0, 0, 0, 1, 1,
1.767785, 0.418195, 3.397502, 0, 0, 0, 1, 1,
1.770687, -0.1544374, 2.011303, 0, 0, 0, 1, 1,
1.770727, 0.2046617, 1.604539, 0, 0, 0, 1, 1,
1.77636, -2.369797, 2.249733, 0, 0, 0, 1, 1,
1.778893, 1.121068, 0.7345107, 1, 1, 1, 1, 1,
1.798966, -1.229784, 3.288685, 1, 1, 1, 1, 1,
1.804711, 0.514837, -0.08998321, 1, 1, 1, 1, 1,
1.81783, -0.9875339, 3.881588, 1, 1, 1, 1, 1,
1.844435, 0.1486432, 0.6824391, 1, 1, 1, 1, 1,
1.857641, -1.944498, 2.250493, 1, 1, 1, 1, 1,
1.878984, 2.270525, 1.142931, 1, 1, 1, 1, 1,
1.909206, -0.3584794, 3.400334, 1, 1, 1, 1, 1,
1.940018, 0.9691525, 1.125108, 1, 1, 1, 1, 1,
1.950806, 0.9386643, 2.738157, 1, 1, 1, 1, 1,
1.958185, 0.3824097, 1.388652, 1, 1, 1, 1, 1,
1.97681, -0.3124229, 0.2618639, 1, 1, 1, 1, 1,
2.011947, 1.969923, -1.177388, 1, 1, 1, 1, 1,
2.028478, -0.6785045, 3.064327, 1, 1, 1, 1, 1,
2.048826, -0.2402127, 0.9414304, 1, 1, 1, 1, 1,
2.053814, -0.6555921, 2.675399, 0, 0, 1, 1, 1,
2.061017, -1.36028, 1.498882, 1, 0, 0, 1, 1,
2.093484, -0.620185, 3.226685, 1, 0, 0, 1, 1,
2.096906, -0.3324606, 2.110797, 1, 0, 0, 1, 1,
2.103576, -0.8536092, 2.285827, 1, 0, 0, 1, 1,
2.127841, -0.575369, 2.060169, 1, 0, 0, 1, 1,
2.208959, -0.5693652, 4.55735, 0, 0, 0, 1, 1,
2.245831, 0.02661514, 2.00105, 0, 0, 0, 1, 1,
2.292994, 0.7102048, 0.7410598, 0, 0, 0, 1, 1,
2.304387, 0.3840607, 1.148904, 0, 0, 0, 1, 1,
2.319715, 1.897519, -0.07160167, 0, 0, 0, 1, 1,
2.352395, -0.1173479, 3.116784, 0, 0, 0, 1, 1,
2.386076, -1.922525, 2.614638, 0, 0, 0, 1, 1,
2.476316, -0.1887541, 0.06823331, 1, 1, 1, 1, 1,
2.503979, 0.01911258, -0.257609, 1, 1, 1, 1, 1,
2.628163, -0.3084428, -0.06267298, 1, 1, 1, 1, 1,
2.731596, 0.3585533, 0.184482, 1, 1, 1, 1, 1,
2.850044, -2.173643, 2.102481, 1, 1, 1, 1, 1,
2.961478, 0.03594956, -0.3122892, 1, 1, 1, 1, 1,
3.01991, -2.11772, 3.229767, 1, 1, 1, 1, 1
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
var radius = 9.583216;
var distance = 33.66064;
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
mvMatrix.translate( 0.3490748, 0.3437959, -0.1530566 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.66064);
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
