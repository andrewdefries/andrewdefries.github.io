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
-3.241354, 0.7597102, 0.1591344, 1, 0, 0, 1,
-3.042233, 1.300434, 0.3029237, 1, 0.007843138, 0, 1,
-2.879483, -0.0009829801, -2.125872, 1, 0.01176471, 0, 1,
-2.814298, -0.1844132, -0.895759, 1, 0.01960784, 0, 1,
-2.702451, 0.1605033, 0.007299749, 1, 0.02352941, 0, 1,
-2.601076, 0.9801692, 0.3627755, 1, 0.03137255, 0, 1,
-2.574564, 0.4589103, -1.931736, 1, 0.03529412, 0, 1,
-2.475877, -2.236895, -2.553529, 1, 0.04313726, 0, 1,
-2.461807, 0.890197, -1.062726, 1, 0.04705882, 0, 1,
-2.430917, -1.14302, -0.6907493, 1, 0.05490196, 0, 1,
-2.398543, -0.06607051, -2.011481, 1, 0.05882353, 0, 1,
-2.359441, 0.4390733, -2.111763, 1, 0.06666667, 0, 1,
-2.201576, -1.346167, -1.788168, 1, 0.07058824, 0, 1,
-2.178501, 0.5005164, 0.09711747, 1, 0.07843138, 0, 1,
-2.170261, -2.100799, -0.3800724, 1, 0.08235294, 0, 1,
-2.150213, 0.277755, -1.032745, 1, 0.09019608, 0, 1,
-2.130875, -0.2089397, 0.3767539, 1, 0.09411765, 0, 1,
-2.126423, 0.8370334, -2.332991, 1, 0.1019608, 0, 1,
-2.105791, 2.926183, -0.753475, 1, 0.1098039, 0, 1,
-2.070433, 0.8130231, 0.1998088, 1, 0.1137255, 0, 1,
-2.015797, 0.1097036, -1.693128, 1, 0.1215686, 0, 1,
-2.008452, -0.1568785, -0.5594804, 1, 0.1254902, 0, 1,
-1.986274, -0.292037, -2.349953, 1, 0.1333333, 0, 1,
-1.984692, 0.8553464, 0.1509544, 1, 0.1372549, 0, 1,
-1.923707, 0.973803, 0.4940416, 1, 0.145098, 0, 1,
-1.907841, -1.023864, -3.352124, 1, 0.1490196, 0, 1,
-1.882168, -0.7490895, -2.136089, 1, 0.1568628, 0, 1,
-1.880563, -0.1135999, -1.108189, 1, 0.1607843, 0, 1,
-1.870233, -0.7962613, -2.166572, 1, 0.1686275, 0, 1,
-1.867398, -2.260904, -0.9702095, 1, 0.172549, 0, 1,
-1.856003, 0.06766345, -1.444798, 1, 0.1803922, 0, 1,
-1.855768, -0.3117064, -3.666976, 1, 0.1843137, 0, 1,
-1.844509, -1.950664, -3.412089, 1, 0.1921569, 0, 1,
-1.844098, -0.705016, -1.073863, 1, 0.1960784, 0, 1,
-1.834736, -2.228544, -2.230017, 1, 0.2039216, 0, 1,
-1.824347, -0.07612684, -0.5660259, 1, 0.2117647, 0, 1,
-1.816336, 0.1147357, -2.132263, 1, 0.2156863, 0, 1,
-1.81225, 1.92482, -0.6294038, 1, 0.2235294, 0, 1,
-1.809092, 1.267331, 0.1560043, 1, 0.227451, 0, 1,
-1.8078, 1.800601, -0.6044968, 1, 0.2352941, 0, 1,
-1.805712, -0.8064737, -2.412361, 1, 0.2392157, 0, 1,
-1.793908, -0.7984151, -2.761739, 1, 0.2470588, 0, 1,
-1.754361, 1.472429, 1.516797, 1, 0.2509804, 0, 1,
-1.736901, 1.15334, -0.3298465, 1, 0.2588235, 0, 1,
-1.730052, -0.8754035, -0.6671957, 1, 0.2627451, 0, 1,
-1.720691, 0.4340615, -0.05898837, 1, 0.2705882, 0, 1,
-1.694068, 0.5945694, -1.410354, 1, 0.2745098, 0, 1,
-1.671363, -0.9336445, -2.414362, 1, 0.282353, 0, 1,
-1.667529, 1.086774, -1.340939, 1, 0.2862745, 0, 1,
-1.625236, -0.366007, -1.445159, 1, 0.2941177, 0, 1,
-1.625164, -1.667198, -1.100023, 1, 0.3019608, 0, 1,
-1.624196, 0.5349573, -2.284825, 1, 0.3058824, 0, 1,
-1.621771, -0.6538789, -0.8689956, 1, 0.3137255, 0, 1,
-1.605396, -0.2432025, -4.465237, 1, 0.3176471, 0, 1,
-1.598959, -0.1946325, -1.710028, 1, 0.3254902, 0, 1,
-1.595995, 0.1356099, 0.4188577, 1, 0.3294118, 0, 1,
-1.588589, 0.5940558, -2.203698, 1, 0.3372549, 0, 1,
-1.586085, -0.6873725, -1.127246, 1, 0.3411765, 0, 1,
-1.578682, -0.06249831, -2.013088, 1, 0.3490196, 0, 1,
-1.574562, -0.2840788, 0.1984493, 1, 0.3529412, 0, 1,
-1.570297, 2.324195, -2.002074, 1, 0.3607843, 0, 1,
-1.559053, -0.1998627, -1.420284, 1, 0.3647059, 0, 1,
-1.557709, 1.390095, -0.1351644, 1, 0.372549, 0, 1,
-1.555674, -0.7554511, -1.641051, 1, 0.3764706, 0, 1,
-1.552698, -0.06075382, -0.07971776, 1, 0.3843137, 0, 1,
-1.55119, -0.9230495, -0.8510467, 1, 0.3882353, 0, 1,
-1.536557, 0.8463374, -2.235336, 1, 0.3960784, 0, 1,
-1.504304, 0.1478497, -1.024373, 1, 0.4039216, 0, 1,
-1.491302, -0.8633922, -2.164949, 1, 0.4078431, 0, 1,
-1.490642, -0.6344486, 0.07345338, 1, 0.4156863, 0, 1,
-1.488129, -1.397935, -2.237182, 1, 0.4196078, 0, 1,
-1.487292, -2.243428, -2.022646, 1, 0.427451, 0, 1,
-1.48399, 0.3198218, -0.1152749, 1, 0.4313726, 0, 1,
-1.475294, 0.2978193, -2.151974, 1, 0.4392157, 0, 1,
-1.457283, 0.6818624, -1.15151, 1, 0.4431373, 0, 1,
-1.45681, -1.59905, 0.4103834, 1, 0.4509804, 0, 1,
-1.45145, -0.03977691, -2.674527, 1, 0.454902, 0, 1,
-1.446442, -2.432574, -3.000768, 1, 0.4627451, 0, 1,
-1.419445, -1.671275, -1.20402, 1, 0.4666667, 0, 1,
-1.418073, 0.997306, 0.06883433, 1, 0.4745098, 0, 1,
-1.413859, -0.6280341, -4.96348, 1, 0.4784314, 0, 1,
-1.4068, 1.17267, -2.019396, 1, 0.4862745, 0, 1,
-1.395738, -0.1688326, -2.308238, 1, 0.4901961, 0, 1,
-1.392628, 0.1528927, -0.9644063, 1, 0.4980392, 0, 1,
-1.383296, 0.1169071, -0.2610016, 1, 0.5058824, 0, 1,
-1.381947, 0.3258435, 0.1627709, 1, 0.509804, 0, 1,
-1.380216, 0.05928874, -2.179383, 1, 0.5176471, 0, 1,
-1.373349, -1.08652, -2.36283, 1, 0.5215687, 0, 1,
-1.372064, -0.5453008, -2.559184, 1, 0.5294118, 0, 1,
-1.369184, -0.5619856, -2.695538, 1, 0.5333334, 0, 1,
-1.366833, -0.661857, -2.009419, 1, 0.5411765, 0, 1,
-1.365769, -1.660461, -1.377676, 1, 0.5450981, 0, 1,
-1.350491, -0.6631857, -2.328522, 1, 0.5529412, 0, 1,
-1.3438, -0.3129409, -1.816591, 1, 0.5568628, 0, 1,
-1.335224, 0.2659288, 0.3341357, 1, 0.5647059, 0, 1,
-1.331863, -0.2757447, -2.050868, 1, 0.5686275, 0, 1,
-1.330968, 0.2495754, -1.460988, 1, 0.5764706, 0, 1,
-1.315599, 2.148288, -1.031065, 1, 0.5803922, 0, 1,
-1.305426, 1.624696, -0.4160261, 1, 0.5882353, 0, 1,
-1.304758, -0.03900421, -2.903525, 1, 0.5921569, 0, 1,
-1.274376, -0.5785348, -2.166513, 1, 0.6, 0, 1,
-1.268302, 0.04701203, 0.006025535, 1, 0.6078432, 0, 1,
-1.264796, -0.0312401, -1.447655, 1, 0.6117647, 0, 1,
-1.257771, -0.2627466, -0.6558011, 1, 0.6196079, 0, 1,
-1.254156, 1.235798, -0.4835097, 1, 0.6235294, 0, 1,
-1.250908, 0.3772635, -1.26642, 1, 0.6313726, 0, 1,
-1.245239, -1.245787, -1.962367, 1, 0.6352941, 0, 1,
-1.23639, -0.497572, -2.900446, 1, 0.6431373, 0, 1,
-1.235514, -1.973761, -3.548627, 1, 0.6470588, 0, 1,
-1.228511, 0.5199558, -1.70102, 1, 0.654902, 0, 1,
-1.225965, -1.537038, -0.370089, 1, 0.6588235, 0, 1,
-1.225101, -1.4493, -3.82318, 1, 0.6666667, 0, 1,
-1.201939, -0.03632875, -1.070617, 1, 0.6705883, 0, 1,
-1.200082, 1.44292, 0.5424162, 1, 0.6784314, 0, 1,
-1.199142, -0.2504304, -2.228351, 1, 0.682353, 0, 1,
-1.198297, -0.04240474, -1.011238, 1, 0.6901961, 0, 1,
-1.19513, -0.6545205, -2.332084, 1, 0.6941177, 0, 1,
-1.188108, -0.9778215, -1.745872, 1, 0.7019608, 0, 1,
-1.187216, -0.1549686, -0.6718803, 1, 0.7098039, 0, 1,
-1.182599, 2.485442, -0.7334971, 1, 0.7137255, 0, 1,
-1.179203, 0.8416806, -0.7837243, 1, 0.7215686, 0, 1,
-1.177037, -0.7903324, -2.065701, 1, 0.7254902, 0, 1,
-1.172958, -0.4751294, -4.019316, 1, 0.7333333, 0, 1,
-1.166258, 0.185557, -1.394052, 1, 0.7372549, 0, 1,
-1.16285, -2.093434, -4.745855, 1, 0.7450981, 0, 1,
-1.146098, 1.8514, -0.6409115, 1, 0.7490196, 0, 1,
-1.145129, 1.014115, -1.310946, 1, 0.7568628, 0, 1,
-1.142148, -0.6854581, -1.498479, 1, 0.7607843, 0, 1,
-1.132706, 0.9697728, -2.940215, 1, 0.7686275, 0, 1,
-1.131336, -1.217523, -2.64946, 1, 0.772549, 0, 1,
-1.126763, -1.958588, -2.412462, 1, 0.7803922, 0, 1,
-1.122175, -0.04217461, -0.8323873, 1, 0.7843137, 0, 1,
-1.121604, 0.393821, 0.4794157, 1, 0.7921569, 0, 1,
-1.119163, -0.4961666, -2.433033, 1, 0.7960784, 0, 1,
-1.105853, 1.405903, -0.2635302, 1, 0.8039216, 0, 1,
-1.103273, -0.2001598, -2.140145, 1, 0.8117647, 0, 1,
-1.094565, -0.08522303, -2.220214, 1, 0.8156863, 0, 1,
-1.089882, 0.9167419, 0.3146352, 1, 0.8235294, 0, 1,
-1.084792, 0.5855951, -1.337418, 1, 0.827451, 0, 1,
-1.082938, -0.4038617, -5.541251, 1, 0.8352941, 0, 1,
-1.081442, -0.9171723, -2.006839, 1, 0.8392157, 0, 1,
-1.075667, 1.963242, -0.2125171, 1, 0.8470588, 0, 1,
-1.075468, -0.6709785, -2.403283, 1, 0.8509804, 0, 1,
-1.063468, -0.4242879, -2.326902, 1, 0.8588235, 0, 1,
-1.052219, 0.7951058, -1.466135, 1, 0.8627451, 0, 1,
-1.049334, 0.6190001, -1.382338, 1, 0.8705882, 0, 1,
-1.037193, 0.1065955, -2.25642, 1, 0.8745098, 0, 1,
-1.030165, -0.1717187, -1.142347, 1, 0.8823529, 0, 1,
-1.029897, -2.201329, -3.159338, 1, 0.8862745, 0, 1,
-1.023801, 1.306194, -0.2415461, 1, 0.8941177, 0, 1,
-1.022097, 0.9774029, 0.02553525, 1, 0.8980392, 0, 1,
-1.015748, -1.539337, -1.759318, 1, 0.9058824, 0, 1,
-1.009776, 1.49414, -0.0282881, 1, 0.9137255, 0, 1,
-1.003062, 0.243844, -2.074703, 1, 0.9176471, 0, 1,
-1.002088, 0.3126348, -0.06106849, 1, 0.9254902, 0, 1,
-1.000865, -0.9746009, -2.53783, 1, 0.9294118, 0, 1,
-0.9981397, -0.3885534, -1.207089, 1, 0.9372549, 0, 1,
-0.9981031, 0.2220133, -2.00966, 1, 0.9411765, 0, 1,
-0.9969776, 0.8138556, -0.5895257, 1, 0.9490196, 0, 1,
-0.9893471, 0.5744287, -0.9814489, 1, 0.9529412, 0, 1,
-0.9887542, 1.846136, 0.3567373, 1, 0.9607843, 0, 1,
-0.9850425, -0.1439907, -1.404995, 1, 0.9647059, 0, 1,
-0.9815759, 2.34495, -0.3454087, 1, 0.972549, 0, 1,
-0.9776019, -0.9893903, -1.28707, 1, 0.9764706, 0, 1,
-0.9740394, -1.10652, -1.655608, 1, 0.9843137, 0, 1,
-0.968556, -0.3104996, -2.180759, 1, 0.9882353, 0, 1,
-0.9678555, -0.8253961, -1.746585, 1, 0.9960784, 0, 1,
-0.9660392, -0.8013583, -1.794538, 0.9960784, 1, 0, 1,
-0.954726, -0.2442975, -1.87867, 0.9921569, 1, 0, 1,
-0.9507142, 2.018831, -1.506061, 0.9843137, 1, 0, 1,
-0.9488714, -0.0633893, -1.16328, 0.9803922, 1, 0, 1,
-0.9426827, -0.478303, -1.672956, 0.972549, 1, 0, 1,
-0.9426235, 0.07120184, -1.479129, 0.9686275, 1, 0, 1,
-0.9424177, -1.532387, -3.787122, 0.9607843, 1, 0, 1,
-0.9412198, -0.6512175, -2.904093, 0.9568627, 1, 0, 1,
-0.9360669, 0.7486086, -0.8555815, 0.9490196, 1, 0, 1,
-0.9354929, -1.221966, -3.746235, 0.945098, 1, 0, 1,
-0.9334354, 0.01706819, -1.537923, 0.9372549, 1, 0, 1,
-0.9322758, -0.6304919, -2.849088, 0.9333333, 1, 0, 1,
-0.9291713, -0.650856, -2.425898, 0.9254902, 1, 0, 1,
-0.927399, 0.6617563, 0.9438279, 0.9215686, 1, 0, 1,
-0.925261, 0.1728896, -0.9504334, 0.9137255, 1, 0, 1,
-0.9236477, -0.6341906, -1.829331, 0.9098039, 1, 0, 1,
-0.9222425, 0.5641705, -1.771683, 0.9019608, 1, 0, 1,
-0.9219659, -0.5956234, -2.63269, 0.8941177, 1, 0, 1,
-0.9168307, -0.2397539, -1.794034, 0.8901961, 1, 0, 1,
-0.916471, -0.01610606, -1.379624, 0.8823529, 1, 0, 1,
-0.9146241, -0.6585696, -3.840326, 0.8784314, 1, 0, 1,
-0.9087267, -0.9328461, -1.119664, 0.8705882, 1, 0, 1,
-0.9087125, 0.05296505, -2.280892, 0.8666667, 1, 0, 1,
-0.9009457, 1.235991, -0.6956789, 0.8588235, 1, 0, 1,
-0.8964379, 0.4779324, -1.900013, 0.854902, 1, 0, 1,
-0.8953709, 0.1349889, -1.804963, 0.8470588, 1, 0, 1,
-0.8930387, -0.02167851, -0.2439666, 0.8431373, 1, 0, 1,
-0.8876641, -0.6908344, -2.590083, 0.8352941, 1, 0, 1,
-0.8767965, -1.484063, -3.884079, 0.8313726, 1, 0, 1,
-0.8716506, -0.4137768, -1.316825, 0.8235294, 1, 0, 1,
-0.8708758, 0.8412222, 0.4306571, 0.8196079, 1, 0, 1,
-0.8654677, 0.01557071, -1.246552, 0.8117647, 1, 0, 1,
-0.863064, -0.204596, -2.581913, 0.8078431, 1, 0, 1,
-0.8620338, 0.1881114, -1.251206, 0.8, 1, 0, 1,
-0.8593976, -1.007964, -2.595445, 0.7921569, 1, 0, 1,
-0.8375427, -1.099574, -2.74569, 0.7882353, 1, 0, 1,
-0.8227242, -1.301298, -3.387307, 0.7803922, 1, 0, 1,
-0.8223379, 0.5590025, -0.2830986, 0.7764706, 1, 0, 1,
-0.8209568, -0.3497817, 0.2168113, 0.7686275, 1, 0, 1,
-0.8207257, 0.1332461, -0.2815322, 0.7647059, 1, 0, 1,
-0.8187762, -0.5855853, -2.40706, 0.7568628, 1, 0, 1,
-0.8162088, 0.2479582, -0.1927251, 0.7529412, 1, 0, 1,
-0.8133227, 0.6753191, 0.01294882, 0.7450981, 1, 0, 1,
-0.8092288, -0.7522714, -1.929117, 0.7411765, 1, 0, 1,
-0.808811, -2.136274, -0.7716413, 0.7333333, 1, 0, 1,
-0.8054689, -0.7860841, -0.3994914, 0.7294118, 1, 0, 1,
-0.8027229, -0.6899216, -2.042298, 0.7215686, 1, 0, 1,
-0.8018835, -0.1282915, -0.02256386, 0.7176471, 1, 0, 1,
-0.7986255, 0.6554738, -1.436847, 0.7098039, 1, 0, 1,
-0.7951167, -0.553579, -1.831686, 0.7058824, 1, 0, 1,
-0.7893537, 0.4223385, 1.256387, 0.6980392, 1, 0, 1,
-0.7893018, 0.1817506, -0.002416605, 0.6901961, 1, 0, 1,
-0.7875689, 1.003704, -0.2884275, 0.6862745, 1, 0, 1,
-0.7773958, 0.1488353, -3.59878, 0.6784314, 1, 0, 1,
-0.7773289, 0.08909547, -0.1515759, 0.6745098, 1, 0, 1,
-0.7710267, 0.3672111, -0.4612509, 0.6666667, 1, 0, 1,
-0.7672893, -1.277749, -3.178531, 0.6627451, 1, 0, 1,
-0.7643569, -0.4682578, -4.148932, 0.654902, 1, 0, 1,
-0.7637337, 0.236726, -1.087918, 0.6509804, 1, 0, 1,
-0.7607818, 0.5607501, -0.964063, 0.6431373, 1, 0, 1,
-0.754553, -0.7611799, -2.807231, 0.6392157, 1, 0, 1,
-0.7498602, 0.9363175, -0.2226086, 0.6313726, 1, 0, 1,
-0.7480627, 0.1217039, -0.9674772, 0.627451, 1, 0, 1,
-0.7373928, -1.565765, -2.815238, 0.6196079, 1, 0, 1,
-0.7328905, -0.3464261, -1.268848, 0.6156863, 1, 0, 1,
-0.7324343, -0.3790547, -3.279227, 0.6078432, 1, 0, 1,
-0.7301709, -0.1855033, -1.485656, 0.6039216, 1, 0, 1,
-0.7234976, -1.475131, -2.676624, 0.5960785, 1, 0, 1,
-0.7219735, 0.5775705, -1.79297, 0.5882353, 1, 0, 1,
-0.7205497, -0.3100711, -1.164762, 0.5843138, 1, 0, 1,
-0.7151831, 0.1849229, -1.862307, 0.5764706, 1, 0, 1,
-0.7108643, 1.251179, -0.6847607, 0.572549, 1, 0, 1,
-0.706966, -0.6138899, -3.957053, 0.5647059, 1, 0, 1,
-0.7069489, -1.122531, -1.158277, 0.5607843, 1, 0, 1,
-0.7044597, 0.557493, -0.9560123, 0.5529412, 1, 0, 1,
-0.7024559, 1.384428, -0.7268956, 0.5490196, 1, 0, 1,
-0.7019044, 1.310563, -1.416119, 0.5411765, 1, 0, 1,
-0.7018633, -1.495538, -1.934225, 0.5372549, 1, 0, 1,
-0.6993349, 0.3332987, -0.7366747, 0.5294118, 1, 0, 1,
-0.6955181, 0.6756632, -1.257289, 0.5254902, 1, 0, 1,
-0.6907892, 1.190048, -0.8798431, 0.5176471, 1, 0, 1,
-0.6884488, -0.08495595, -1.251465, 0.5137255, 1, 0, 1,
-0.6854337, -0.4591535, -2.497749, 0.5058824, 1, 0, 1,
-0.6849569, -1.563517, -2.266075, 0.5019608, 1, 0, 1,
-0.6839396, 1.287747, -0.6307064, 0.4941176, 1, 0, 1,
-0.683341, 0.491028, -0.9689466, 0.4862745, 1, 0, 1,
-0.6786019, 1.269197, -0.9156864, 0.4823529, 1, 0, 1,
-0.6764535, 0.3040651, 0.6087956, 0.4745098, 1, 0, 1,
-0.6668832, -0.4016648, -2.849411, 0.4705882, 1, 0, 1,
-0.6655247, -0.7526581, -2.576238, 0.4627451, 1, 0, 1,
-0.6646619, -0.5411909, -2.667526, 0.4588235, 1, 0, 1,
-0.6592236, -0.363805, -2.505462, 0.4509804, 1, 0, 1,
-0.6556327, -0.1988626, -0.7333451, 0.4470588, 1, 0, 1,
-0.6546713, -0.2043982, -0.8004562, 0.4392157, 1, 0, 1,
-0.6483808, -0.2568772, -0.9205093, 0.4352941, 1, 0, 1,
-0.6479333, -0.2164712, -0.1553101, 0.427451, 1, 0, 1,
-0.6476962, -0.1246842, -2.504259, 0.4235294, 1, 0, 1,
-0.640235, -0.6739528, -3.31313, 0.4156863, 1, 0, 1,
-0.6390098, -2.054735, -1.05539, 0.4117647, 1, 0, 1,
-0.6347898, 0.464098, -0.8801603, 0.4039216, 1, 0, 1,
-0.6270046, -0.04657956, -0.09134686, 0.3960784, 1, 0, 1,
-0.6216639, -0.02591123, -1.142311, 0.3921569, 1, 0, 1,
-0.6205919, -0.9163768, -3.375578, 0.3843137, 1, 0, 1,
-0.6202428, 1.034752, -0.1818682, 0.3803922, 1, 0, 1,
-0.6188093, -0.5109112, -1.221514, 0.372549, 1, 0, 1,
-0.6160203, 0.8551251, -0.5319971, 0.3686275, 1, 0, 1,
-0.6130573, 0.3859502, -0.5375613, 0.3607843, 1, 0, 1,
-0.6127815, 0.7656986, 0.3964857, 0.3568628, 1, 0, 1,
-0.6070648, -0.4030496, -2.387385, 0.3490196, 1, 0, 1,
-0.6068881, 0.06916539, -1.435331, 0.345098, 1, 0, 1,
-0.6053699, 1.279625, 1.484049, 0.3372549, 1, 0, 1,
-0.6033047, 0.7764481, -1.586731, 0.3333333, 1, 0, 1,
-0.6018718, -0.813485, -1.593716, 0.3254902, 1, 0, 1,
-0.6016865, 0.8236471, -0.02537485, 0.3215686, 1, 0, 1,
-0.6013786, -0.4439108, -3.563861, 0.3137255, 1, 0, 1,
-0.5975393, -0.5500983, -1.77092, 0.3098039, 1, 0, 1,
-0.5972586, -1.430063, -1.941285, 0.3019608, 1, 0, 1,
-0.5894427, 1.02548, 0.8274325, 0.2941177, 1, 0, 1,
-0.588066, -0.9716945, -1.863819, 0.2901961, 1, 0, 1,
-0.5781666, 0.3614644, 0.916899, 0.282353, 1, 0, 1,
-0.5751104, -0.6210017, -0.37971, 0.2784314, 1, 0, 1,
-0.5630236, -0.5885007, -1.524107, 0.2705882, 1, 0, 1,
-0.5569728, 1.629028, 0.3576262, 0.2666667, 1, 0, 1,
-0.5547015, -1.221456, -1.813868, 0.2588235, 1, 0, 1,
-0.5507697, 1.845601, 0.4534259, 0.254902, 1, 0, 1,
-0.5496106, -0.9763454, -1.729885, 0.2470588, 1, 0, 1,
-0.5451882, -1.846581, -2.184317, 0.2431373, 1, 0, 1,
-0.5437701, 0.3484443, -0.1685815, 0.2352941, 1, 0, 1,
-0.5377586, 0.1635597, 0.07544226, 0.2313726, 1, 0, 1,
-0.5328231, 1.228077, -0.6437629, 0.2235294, 1, 0, 1,
-0.5321648, 0.1392956, -0.7362812, 0.2196078, 1, 0, 1,
-0.5310401, -1.176525, -2.026056, 0.2117647, 1, 0, 1,
-0.5271431, 0.005419201, -0.7080883, 0.2078431, 1, 0, 1,
-0.5177888, 1.02283, -0.7503636, 0.2, 1, 0, 1,
-0.5160463, 0.4674883, -0.009666498, 0.1921569, 1, 0, 1,
-0.5158623, 0.1221626, -0.1172567, 0.1882353, 1, 0, 1,
-0.5151083, -1.083464, -3.889375, 0.1803922, 1, 0, 1,
-0.5133851, 0.733385, -0.07554666, 0.1764706, 1, 0, 1,
-0.5130951, -2.156274, -3.745932, 0.1686275, 1, 0, 1,
-0.5117165, 0.9099527, -2.19026, 0.1647059, 1, 0, 1,
-0.5099853, -1.89402, -2.319118, 0.1568628, 1, 0, 1,
-0.5050206, -0.1220181, -2.517058, 0.1529412, 1, 0, 1,
-0.5041341, 0.6278763, 0.3134349, 0.145098, 1, 0, 1,
-0.5038477, 0.6246669, -0.8345602, 0.1411765, 1, 0, 1,
-0.4988791, -0.6733083, -2.375484, 0.1333333, 1, 0, 1,
-0.4982686, -0.6020381, -1.72662, 0.1294118, 1, 0, 1,
-0.4931835, -0.6678745, -2.566507, 0.1215686, 1, 0, 1,
-0.4925084, 0.3062295, -0.5913597, 0.1176471, 1, 0, 1,
-0.4917586, -1.152948, -3.530938, 0.1098039, 1, 0, 1,
-0.4904702, -0.1465551, -0.8452982, 0.1058824, 1, 0, 1,
-0.4878952, -0.6003853, -2.220721, 0.09803922, 1, 0, 1,
-0.4877128, -2.659078, -3.209287, 0.09019608, 1, 0, 1,
-0.4847182, -0.2699212, -0.8593094, 0.08627451, 1, 0, 1,
-0.4808099, 0.6925525, -1.753602, 0.07843138, 1, 0, 1,
-0.4764158, 0.2249873, -0.5409656, 0.07450981, 1, 0, 1,
-0.4758334, 0.6593419, -1.119055, 0.06666667, 1, 0, 1,
-0.468427, 0.5429963, 0.6290886, 0.0627451, 1, 0, 1,
-0.4680797, 0.3799932, -1.311425, 0.05490196, 1, 0, 1,
-0.4660706, 0.4723859, -3.043635, 0.05098039, 1, 0, 1,
-0.4649383, 0.167233, -0.06359472, 0.04313726, 1, 0, 1,
-0.4649342, 0.3565926, -3.391965, 0.03921569, 1, 0, 1,
-0.4609956, 0.3883267, 0.01255295, 0.03137255, 1, 0, 1,
-0.459914, 1.593494, -0.777945, 0.02745098, 1, 0, 1,
-0.4588208, -0.2595308, -3.860882, 0.01960784, 1, 0, 1,
-0.4526865, -0.8204542, -5.186814, 0.01568628, 1, 0, 1,
-0.4495553, -1.250282, -2.867511, 0.007843138, 1, 0, 1,
-0.4491695, -0.04856672, -0.4682538, 0.003921569, 1, 0, 1,
-0.4464666, -0.2765445, -1.943002, 0, 1, 0.003921569, 1,
-0.444004, 0.5036175, -1.002597, 0, 1, 0.01176471, 1,
-0.4435214, -0.3674683, -1.395057, 0, 1, 0.01568628, 1,
-0.441603, -0.7818898, -2.160741, 0, 1, 0.02352941, 1,
-0.4381155, 1.940348, -0.7614599, 0, 1, 0.02745098, 1,
-0.4375244, -0.4460942, -2.955141, 0, 1, 0.03529412, 1,
-0.4369787, -1.410176, -4.089637, 0, 1, 0.03921569, 1,
-0.4272442, -0.1323579, -2.008038, 0, 1, 0.04705882, 1,
-0.4260533, -0.395141, -1.343479, 0, 1, 0.05098039, 1,
-0.4212807, -1.726944, -1.863029, 0, 1, 0.05882353, 1,
-0.4163507, 0.3811186, -0.3717961, 0, 1, 0.0627451, 1,
-0.4140017, 0.713291, -0.5784802, 0, 1, 0.07058824, 1,
-0.4121126, -0.412676, -2.914388, 0, 1, 0.07450981, 1,
-0.4117763, -1.896972, -2.595343, 0, 1, 0.08235294, 1,
-0.4058853, 0.7457885, -0.8582516, 0, 1, 0.08627451, 1,
-0.405559, -1.147944, -3.551594, 0, 1, 0.09411765, 1,
-0.4008102, -1.38718, -2.740154, 0, 1, 0.1019608, 1,
-0.3989027, -1.305909, -2.81836, 0, 1, 0.1058824, 1,
-0.3973428, 1.79625, -0.5145485, 0, 1, 0.1137255, 1,
-0.3962036, 0.2557584, -0.7953615, 0, 1, 0.1176471, 1,
-0.3941325, 0.3982347, 0.5685459, 0, 1, 0.1254902, 1,
-0.39271, 1.139875, 1.601474, 0, 1, 0.1294118, 1,
-0.3856602, 1.568677, -0.08609703, 0, 1, 0.1372549, 1,
-0.3854132, 1.758233, -1.317291, 0, 1, 0.1411765, 1,
-0.3821962, 2.524583, -0.1190998, 0, 1, 0.1490196, 1,
-0.3791746, -0.08926053, -3.836022, 0, 1, 0.1529412, 1,
-0.3762991, -1.199376, -3.329136, 0, 1, 0.1607843, 1,
-0.367851, -0.07359091, -1.123328, 0, 1, 0.1647059, 1,
-0.3665059, 0.1689517, -1.385583, 0, 1, 0.172549, 1,
-0.3645728, -0.03364467, -2.69789, 0, 1, 0.1764706, 1,
-0.3629752, 0.494764, -0.589339, 0, 1, 0.1843137, 1,
-0.3627735, 0.5835026, -2.410997, 0, 1, 0.1882353, 1,
-0.3607747, 0.173541, -1.289044, 0, 1, 0.1960784, 1,
-0.3599898, 0.9892306, -0.3384813, 0, 1, 0.2039216, 1,
-0.3551539, 0.02519774, -1.506593, 0, 1, 0.2078431, 1,
-0.354217, -0.71668, -1.826424, 0, 1, 0.2156863, 1,
-0.3490116, -0.05846444, -2.255957, 0, 1, 0.2196078, 1,
-0.3448222, -0.5481427, -2.147245, 0, 1, 0.227451, 1,
-0.3407814, -0.7884341, -3.175593, 0, 1, 0.2313726, 1,
-0.3393917, -0.2200169, -0.5503811, 0, 1, 0.2392157, 1,
-0.3378974, 2.380443, 1.286777, 0, 1, 0.2431373, 1,
-0.3377886, 1.255441, -0.7335128, 0, 1, 0.2509804, 1,
-0.3349367, -0.03617355, -2.640453, 0, 1, 0.254902, 1,
-0.3344172, -0.1779941, -2.028124, 0, 1, 0.2627451, 1,
-0.3331964, 0.1075412, -2.479703, 0, 1, 0.2666667, 1,
-0.3320124, 1.351374, -0.2019218, 0, 1, 0.2745098, 1,
-0.3305199, -1.001923, -1.76673, 0, 1, 0.2784314, 1,
-0.3297029, -0.2522603, -1.835404, 0, 1, 0.2862745, 1,
-0.3232106, 0.7378866, -0.6713442, 0, 1, 0.2901961, 1,
-0.3215426, 0.8579112, -1.931791, 0, 1, 0.2980392, 1,
-0.3197788, 1.589612, -0.3329333, 0, 1, 0.3058824, 1,
-0.3194216, 0.2099522, -0.4940396, 0, 1, 0.3098039, 1,
-0.3161471, 0.04916881, -1.503679, 0, 1, 0.3176471, 1,
-0.3145012, 0.6906109, -2.279538, 0, 1, 0.3215686, 1,
-0.3131371, 0.2156517, -0.8250363, 0, 1, 0.3294118, 1,
-0.312013, 1.708031, -0.9307302, 0, 1, 0.3333333, 1,
-0.301024, 0.07446455, -0.4953523, 0, 1, 0.3411765, 1,
-0.2971639, -0.5848552, -1.560889, 0, 1, 0.345098, 1,
-0.2967219, -0.5091424, -1.286988, 0, 1, 0.3529412, 1,
-0.2964306, 0.6093015, -0.8820321, 0, 1, 0.3568628, 1,
-0.2962841, 1.348588, -2.250078, 0, 1, 0.3647059, 1,
-0.2926684, 0.7923554, 0.5636579, 0, 1, 0.3686275, 1,
-0.2909723, -0.872385, -3.043787, 0, 1, 0.3764706, 1,
-0.2892546, -0.4552703, -3.333203, 0, 1, 0.3803922, 1,
-0.2867252, 0.8502123, -0.05753244, 0, 1, 0.3882353, 1,
-0.2860582, -0.6236306, -1.191602, 0, 1, 0.3921569, 1,
-0.2852212, -0.3646657, -2.597661, 0, 1, 0.4, 1,
-0.2845741, 0.5505741, 0.4387612, 0, 1, 0.4078431, 1,
-0.2722473, -1.249605, -2.0853, 0, 1, 0.4117647, 1,
-0.2712105, -1.294131, -3.449909, 0, 1, 0.4196078, 1,
-0.2688036, 0.3857908, -0.4172335, 0, 1, 0.4235294, 1,
-0.2660814, -0.6303037, -2.337443, 0, 1, 0.4313726, 1,
-0.2643138, 0.007376275, -1.192735, 0, 1, 0.4352941, 1,
-0.2599929, -1.348061, -2.911817, 0, 1, 0.4431373, 1,
-0.2593732, 2.065576, -0.5133892, 0, 1, 0.4470588, 1,
-0.25923, 0.3239441, 0.03801655, 0, 1, 0.454902, 1,
-0.2585612, 0.5587173, -1.208699, 0, 1, 0.4588235, 1,
-0.2583039, -0.7445874, -3.774318, 0, 1, 0.4666667, 1,
-0.2554958, -0.4232382, -2.118012, 0, 1, 0.4705882, 1,
-0.2551905, -0.07078403, -3.118077, 0, 1, 0.4784314, 1,
-0.2490018, -1.461774, -2.731637, 0, 1, 0.4823529, 1,
-0.236914, -0.07948065, -1.152153, 0, 1, 0.4901961, 1,
-0.2366504, -0.6763565, -2.433124, 0, 1, 0.4941176, 1,
-0.2355854, -0.572635, -3.069323, 0, 1, 0.5019608, 1,
-0.2324717, -0.9763483, -0.6923495, 0, 1, 0.509804, 1,
-0.2323657, 1.32913, -1.969568, 0, 1, 0.5137255, 1,
-0.2283707, 0.6567279, -0.6649222, 0, 1, 0.5215687, 1,
-0.2281952, 1.407166, 0.4553235, 0, 1, 0.5254902, 1,
-0.224134, -0.6961232, -2.982351, 0, 1, 0.5333334, 1,
-0.22375, 0.4770762, -0.678839, 0, 1, 0.5372549, 1,
-0.2220326, -0.6639359, -5.855975, 0, 1, 0.5450981, 1,
-0.2212263, 0.342715, -0.6995483, 0, 1, 0.5490196, 1,
-0.2163645, 1.841598, -0.4094771, 0, 1, 0.5568628, 1,
-0.2134259, -0.6619194, -3.012743, 0, 1, 0.5607843, 1,
-0.2111797, -1.472103, -2.699142, 0, 1, 0.5686275, 1,
-0.2009436, 0.2314616, -1.960116, 0, 1, 0.572549, 1,
-0.2001793, 0.5192372, -0.7714182, 0, 1, 0.5803922, 1,
-0.1969193, 1.163764, 1.400963, 0, 1, 0.5843138, 1,
-0.1899009, 1.334564, -0.2295644, 0, 1, 0.5921569, 1,
-0.1871455, 0.6924672, 0.3523509, 0, 1, 0.5960785, 1,
-0.1820475, 0.4502155, -1.846023, 0, 1, 0.6039216, 1,
-0.1810832, -1.714971, -3.276531, 0, 1, 0.6117647, 1,
-0.1786554, -1.114679, -2.524215, 0, 1, 0.6156863, 1,
-0.1749319, -0.2106215, -3.207709, 0, 1, 0.6235294, 1,
-0.16894, 1.332739, 1.69112, 0, 1, 0.627451, 1,
-0.1686723, -0.2366115, -2.077886, 0, 1, 0.6352941, 1,
-0.1685334, 1.392123, -1.573605, 0, 1, 0.6392157, 1,
-0.1667501, -1.524871, -3.872401, 0, 1, 0.6470588, 1,
-0.164277, -0.2965169, -0.6357365, 0, 1, 0.6509804, 1,
-0.1609027, -0.6800987, -2.474573, 0, 1, 0.6588235, 1,
-0.1562798, 1.713384, -0.2787272, 0, 1, 0.6627451, 1,
-0.1554503, -0.2802259, -1.68092, 0, 1, 0.6705883, 1,
-0.1447519, -0.9275803, -3.678835, 0, 1, 0.6745098, 1,
-0.1371957, -0.2257563, -3.212507, 0, 1, 0.682353, 1,
-0.1367528, -0.6392437, -5.10535, 0, 1, 0.6862745, 1,
-0.1345606, 0.2271798, -1.43653, 0, 1, 0.6941177, 1,
-0.131335, 1.213962, 0.8639493, 0, 1, 0.7019608, 1,
-0.1306904, 1.709482, -0.901294, 0, 1, 0.7058824, 1,
-0.1300847, -0.4820193, -1.601212, 0, 1, 0.7137255, 1,
-0.1229355, 0.7150634, 0.9490068, 0, 1, 0.7176471, 1,
-0.1200244, 1.30571, -0.8720428, 0, 1, 0.7254902, 1,
-0.1151427, 0.3769408, -1.147371, 0, 1, 0.7294118, 1,
-0.1142353, 0.4569102, 0.2659093, 0, 1, 0.7372549, 1,
-0.1134107, 0.1737504, 0.2056909, 0, 1, 0.7411765, 1,
-0.1083586, 0.5493539, 0.3287243, 0, 1, 0.7490196, 1,
-0.1062662, 0.7311398, 0.866861, 0, 1, 0.7529412, 1,
-0.1050843, 1.267137, 0.8922364, 0, 1, 0.7607843, 1,
-0.1026077, -0.7634312, -1.60921, 0, 1, 0.7647059, 1,
-0.1014112, 0.9290193, -0.04473021, 0, 1, 0.772549, 1,
-0.1000272, 0.9635274, 0.4867894, 0, 1, 0.7764706, 1,
-0.09716789, -1.43742, -2.34022, 0, 1, 0.7843137, 1,
-0.09681199, -2.4482, -2.157572, 0, 1, 0.7882353, 1,
-0.09560014, 1.008665, -1.01204, 0, 1, 0.7960784, 1,
-0.09084696, 0.1085499, -1.884756, 0, 1, 0.8039216, 1,
-0.08923557, 1.328545, -2.667656, 0, 1, 0.8078431, 1,
-0.08190579, 0.6678444, -0.6916093, 0, 1, 0.8156863, 1,
-0.08177131, 1.525854, 0.1890536, 0, 1, 0.8196079, 1,
-0.07931416, -0.6965221, -2.630449, 0, 1, 0.827451, 1,
-0.07695285, -2.140783, -3.170136, 0, 1, 0.8313726, 1,
-0.07367059, -0.9786901, -2.366651, 0, 1, 0.8392157, 1,
-0.07311761, 1.178781, -1.271817, 0, 1, 0.8431373, 1,
-0.06815409, 0.488319, 1.829587, 0, 1, 0.8509804, 1,
-0.06519769, 0.2870975, -1.144524, 0, 1, 0.854902, 1,
-0.06343204, 0.566026, 0.6000564, 0, 1, 0.8627451, 1,
-0.05971911, 1.057599, 1.660512, 0, 1, 0.8666667, 1,
-0.05555123, -0.7866147, -4.330394, 0, 1, 0.8745098, 1,
-0.05339925, 0.7686428, -0.121567, 0, 1, 0.8784314, 1,
-0.05075407, 0.8886003, -1.390114, 0, 1, 0.8862745, 1,
-0.04821658, 0.2561896, 0.01403262, 0, 1, 0.8901961, 1,
-0.04497017, -0.1159815, -2.045751, 0, 1, 0.8980392, 1,
-0.03779817, -0.8261941, -3.535172, 0, 1, 0.9058824, 1,
-0.0364485, -0.1398743, -2.585321, 0, 1, 0.9098039, 1,
-0.03467768, -0.2692252, -2.188145, 0, 1, 0.9176471, 1,
-0.0297456, -0.8538635, -2.388269, 0, 1, 0.9215686, 1,
-0.02810222, 0.437451, 0.7879109, 0, 1, 0.9294118, 1,
-0.0219847, -0.3189319, -4.425991, 0, 1, 0.9333333, 1,
-0.02043206, -0.05658957, -2.47422, 0, 1, 0.9411765, 1,
-0.01656573, -1.689339, -3.604134, 0, 1, 0.945098, 1,
-0.01290229, 0.6736351, 0.387969, 0, 1, 0.9529412, 1,
-0.01092444, 0.02252058, -0.0164256, 0, 1, 0.9568627, 1,
-0.009696439, 0.5822556, 0.5127537, 0, 1, 0.9647059, 1,
-0.009059999, 0.1966423, -0.3881136, 0, 1, 0.9686275, 1,
-0.005312571, -0.07801805, -2.043118, 0, 1, 0.9764706, 1,
-0.002487695, 0.4412855, 1.177925, 0, 1, 0.9803922, 1,
-0.002290023, 0.9161918, 0.3078908, 0, 1, 0.9882353, 1,
-0.001851691, 0.8491451, -1.4893, 0, 1, 0.9921569, 1,
-0.001026807, 0.8648899, 0.4163649, 0, 1, 1, 1,
0.006304595, 0.4288073, -0.07976284, 0, 0.9921569, 1, 1,
0.0072632, -0.4877151, 3.064568, 0, 0.9882353, 1, 1,
0.01415546, -1.462875, 3.082808, 0, 0.9803922, 1, 1,
0.01820503, 1.248161, -0.04099942, 0, 0.9764706, 1, 1,
0.02537452, 0.4329337, 1.107316, 0, 0.9686275, 1, 1,
0.03349291, 0.2852123, 1.061493, 0, 0.9647059, 1, 1,
0.03491527, -0.4718318, 3.246506, 0, 0.9568627, 1, 1,
0.03636155, 1.259121, -1.316605, 0, 0.9529412, 1, 1,
0.0369072, -0.7871386, 2.614647, 0, 0.945098, 1, 1,
0.03816316, 0.05262088, 2.594091, 0, 0.9411765, 1, 1,
0.03888224, -0.04280946, 2.45324, 0, 0.9333333, 1, 1,
0.04007123, 0.1597051, -0.83152, 0, 0.9294118, 1, 1,
0.04418453, 0.7866446, 1.883602, 0, 0.9215686, 1, 1,
0.04425058, -0.6598678, 3.279463, 0, 0.9176471, 1, 1,
0.05228502, -0.4936647, 2.218054, 0, 0.9098039, 1, 1,
0.05240266, 0.2705981, -0.1376793, 0, 0.9058824, 1, 1,
0.0538379, 1.575249, 0.5082036, 0, 0.8980392, 1, 1,
0.05538627, -0.9726887, 1.686106, 0, 0.8901961, 1, 1,
0.05846193, 0.8677825, 1.054187, 0, 0.8862745, 1, 1,
0.05869554, -0.2340125, 1.196524, 0, 0.8784314, 1, 1,
0.06105056, -1.608789, 3.512134, 0, 0.8745098, 1, 1,
0.06210589, 1.08357, -0.7629704, 0, 0.8666667, 1, 1,
0.0698867, 1.066884, -0.6266173, 0, 0.8627451, 1, 1,
0.07625852, -1.324803, 3.845372, 0, 0.854902, 1, 1,
0.07845976, -0.6126688, 3.336692, 0, 0.8509804, 1, 1,
0.08340921, 0.3700974, 0.3720001, 0, 0.8431373, 1, 1,
0.08706353, -1.636493, 2.871024, 0, 0.8392157, 1, 1,
0.0897901, 0.4039988, -0.3437265, 0, 0.8313726, 1, 1,
0.08995416, -0.7299874, 4.165051, 0, 0.827451, 1, 1,
0.09388065, 0.7526937, -1.025313, 0, 0.8196079, 1, 1,
0.09430543, 1.084402, 1.629265, 0, 0.8156863, 1, 1,
0.09520619, 0.4850176, 2.040088, 0, 0.8078431, 1, 1,
0.09964942, -0.9867331, 3.714759, 0, 0.8039216, 1, 1,
0.09998751, -0.3299446, 4.023097, 0, 0.7960784, 1, 1,
0.1013848, -0.1444222, 2.028989, 0, 0.7882353, 1, 1,
0.1026209, -0.2749263, 4.188799, 0, 0.7843137, 1, 1,
0.1067986, -0.2191146, 3.16655, 0, 0.7764706, 1, 1,
0.1111509, 1.236139, -0.1752415, 0, 0.772549, 1, 1,
0.1120309, -1.150046, 0.1234581, 0, 0.7647059, 1, 1,
0.1122103, -0.03640068, 1.28101, 0, 0.7607843, 1, 1,
0.1130963, 0.9034771, 2.013684, 0, 0.7529412, 1, 1,
0.1142912, 0.1559658, 0.4751627, 0, 0.7490196, 1, 1,
0.1144371, -0.4826634, 2.669839, 0, 0.7411765, 1, 1,
0.1182912, -0.5888281, 3.736074, 0, 0.7372549, 1, 1,
0.1189545, 0.2003375, 1.93548, 0, 0.7294118, 1, 1,
0.1224768, 0.6906634, 0.7662556, 0, 0.7254902, 1, 1,
0.124475, -1.224894, 3.571966, 0, 0.7176471, 1, 1,
0.1258648, -0.1473395, 4.414582, 0, 0.7137255, 1, 1,
0.1263089, 1.229937, 1.366372, 0, 0.7058824, 1, 1,
0.1272603, -0.5611138, 3.179205, 0, 0.6980392, 1, 1,
0.1287973, 0.8062176, 0.381566, 0, 0.6941177, 1, 1,
0.1305405, 0.4317614, 0.1865149, 0, 0.6862745, 1, 1,
0.1319429, -0.7934721, 4.042016, 0, 0.682353, 1, 1,
0.1334081, 0.4382438, 0.262244, 0, 0.6745098, 1, 1,
0.141301, -0.1479809, 3.336718, 0, 0.6705883, 1, 1,
0.1417094, 0.1172334, -0.3461021, 0, 0.6627451, 1, 1,
0.1449902, 0.3470491, -0.4200314, 0, 0.6588235, 1, 1,
0.1461596, -1.865358, 3.322145, 0, 0.6509804, 1, 1,
0.1471555, -0.4459461, 3.0502, 0, 0.6470588, 1, 1,
0.1474898, 0.4726702, 0.8332056, 0, 0.6392157, 1, 1,
0.1481207, 1.125138, 1.380298, 0, 0.6352941, 1, 1,
0.1500182, 0.3638075, -0.1996071, 0, 0.627451, 1, 1,
0.1510587, -0.1840487, 1.562481, 0, 0.6235294, 1, 1,
0.1544066, 0.0741631, 0.5921719, 0, 0.6156863, 1, 1,
0.1564089, -1.112876, 3.98644, 0, 0.6117647, 1, 1,
0.1564919, 0.4460022, 1.761488, 0, 0.6039216, 1, 1,
0.1603869, 0.5165122, 0.9029798, 0, 0.5960785, 1, 1,
0.1609977, -1.301238, 2.886147, 0, 0.5921569, 1, 1,
0.1656307, -0.4454879, 2.196032, 0, 0.5843138, 1, 1,
0.170418, -1.589836, 3.1968, 0, 0.5803922, 1, 1,
0.1711643, 0.3982648, -1.546382, 0, 0.572549, 1, 1,
0.1748017, -0.5656589, 3.93087, 0, 0.5686275, 1, 1,
0.1823249, -0.7607098, 4.314045, 0, 0.5607843, 1, 1,
0.1834079, -0.842882, 4.312195, 0, 0.5568628, 1, 1,
0.1858735, -0.369048, 1.326147, 0, 0.5490196, 1, 1,
0.1880905, 0.8160588, -0.7000678, 0, 0.5450981, 1, 1,
0.1887335, -1.169786, 1.209996, 0, 0.5372549, 1, 1,
0.1928492, -0.5926796, 3.245671, 0, 0.5333334, 1, 1,
0.196003, -0.4656765, 3.260779, 0, 0.5254902, 1, 1,
0.1976583, -1.403976, 3.302758, 0, 0.5215687, 1, 1,
0.1978015, 0.6083933, 1.187475, 0, 0.5137255, 1, 1,
0.2097729, -1.061435, 4.359344, 0, 0.509804, 1, 1,
0.2121855, 0.5027874, -1.657294, 0, 0.5019608, 1, 1,
0.2134249, -0.06208727, 1.577311, 0, 0.4941176, 1, 1,
0.2156502, 1.615859, 0.9128137, 0, 0.4901961, 1, 1,
0.21833, 2.073259, 2.478539, 0, 0.4823529, 1, 1,
0.2192022, -0.4417629, 2.095406, 0, 0.4784314, 1, 1,
0.2254455, -0.4724569, 2.46966, 0, 0.4705882, 1, 1,
0.2255313, -1.218667, 1.922082, 0, 0.4666667, 1, 1,
0.2278707, -0.3485633, 2.504285, 0, 0.4588235, 1, 1,
0.2311249, -0.08135685, 0.9713309, 0, 0.454902, 1, 1,
0.2341982, 1.823784, -0.601739, 0, 0.4470588, 1, 1,
0.2357993, -2.023551, 3.881574, 0, 0.4431373, 1, 1,
0.2374941, 0.1740985, 2.819209, 0, 0.4352941, 1, 1,
0.2383271, 0.5648772, 1.409533, 0, 0.4313726, 1, 1,
0.2414115, -1.154029, 3.437382, 0, 0.4235294, 1, 1,
0.2426077, 1.216263, 1.131079, 0, 0.4196078, 1, 1,
0.2428148, 0.7603233, 2.26445, 0, 0.4117647, 1, 1,
0.2492588, -0.3008777, 3.973459, 0, 0.4078431, 1, 1,
0.2493318, 1.680887, 1.562964, 0, 0.4, 1, 1,
0.2536036, 1.485988, 0.6603377, 0, 0.3921569, 1, 1,
0.2593732, 1.756201, 0.1903263, 0, 0.3882353, 1, 1,
0.2596033, -0.2782373, 0.8947316, 0, 0.3803922, 1, 1,
0.2615763, 0.008484715, 2.036786, 0, 0.3764706, 1, 1,
0.2627327, 0.8126284, -0.3668003, 0, 0.3686275, 1, 1,
0.2630132, -1.453123, 2.410129, 0, 0.3647059, 1, 1,
0.263272, 1.993997, -0.1651888, 0, 0.3568628, 1, 1,
0.2633208, -0.5242959, 0.8080389, 0, 0.3529412, 1, 1,
0.2645626, -1.127777, 2.581943, 0, 0.345098, 1, 1,
0.2684615, -0.4857737, 1.875877, 0, 0.3411765, 1, 1,
0.271613, 0.7198759, 0.6224188, 0, 0.3333333, 1, 1,
0.2748566, -1.260492, 2.578024, 0, 0.3294118, 1, 1,
0.2817644, -0.8771713, 3.387899, 0, 0.3215686, 1, 1,
0.2840359, -0.6403632, 1.930892, 0, 0.3176471, 1, 1,
0.2854705, -1.008615, 0.7416672, 0, 0.3098039, 1, 1,
0.2884699, -0.9013617, 3.08912, 0, 0.3058824, 1, 1,
0.290145, -1.487234, 4.425566, 0, 0.2980392, 1, 1,
0.2919925, -0.2438327, 2.763065, 0, 0.2901961, 1, 1,
0.298748, 0.6993802, -0.001392198, 0, 0.2862745, 1, 1,
0.3029348, -1.017991, 3.806394, 0, 0.2784314, 1, 1,
0.3046904, 1.340311, -0.7148042, 0, 0.2745098, 1, 1,
0.3048638, 0.7330883, -1.842881, 0, 0.2666667, 1, 1,
0.3074148, 0.5495314, 0.3076257, 0, 0.2627451, 1, 1,
0.3096329, 1.819955, -0.4215175, 0, 0.254902, 1, 1,
0.3111373, -0.0161614, 2.256804, 0, 0.2509804, 1, 1,
0.3133875, -1.267907, 4.643142, 0, 0.2431373, 1, 1,
0.3136332, -0.7732777, 3.335526, 0, 0.2392157, 1, 1,
0.3163542, 1.092803, -0.5565812, 0, 0.2313726, 1, 1,
0.3180867, -0.008229299, 1.514254, 0, 0.227451, 1, 1,
0.3257136, 1.732042, -0.6054389, 0, 0.2196078, 1, 1,
0.3292444, -1.056762, 4.512073, 0, 0.2156863, 1, 1,
0.33032, 0.2191009, 1.234948, 0, 0.2078431, 1, 1,
0.3344706, 1.290889, 0.1762282, 0, 0.2039216, 1, 1,
0.3362117, 0.9878931, 1.242088, 0, 0.1960784, 1, 1,
0.3394273, -2.255943, 2.433248, 0, 0.1882353, 1, 1,
0.3400921, 1.530702, 0.1523746, 0, 0.1843137, 1, 1,
0.3578209, 1.56637, -1.398721, 0, 0.1764706, 1, 1,
0.3676164, -0.6971157, -0.482516, 0, 0.172549, 1, 1,
0.3685831, -0.7953613, 2.160181, 0, 0.1647059, 1, 1,
0.370171, -0.1119787, 1.917945, 0, 0.1607843, 1, 1,
0.3726952, 0.3569348, -0.7917554, 0, 0.1529412, 1, 1,
0.3743464, -0.3589335, 4.399722, 0, 0.1490196, 1, 1,
0.3749451, -0.18745, 3.207371, 0, 0.1411765, 1, 1,
0.3765593, -3.061294, 3.265114, 0, 0.1372549, 1, 1,
0.3778365, 1.635493, -0.2135838, 0, 0.1294118, 1, 1,
0.3795142, 0.6066629, 1.623199, 0, 0.1254902, 1, 1,
0.3796185, -0.0595206, 0.6784003, 0, 0.1176471, 1, 1,
0.3823051, 0.5757213, 0.6708438, 0, 0.1137255, 1, 1,
0.3825921, 0.6378323, 0.04786357, 0, 0.1058824, 1, 1,
0.3827136, -0.4597386, 1.62961, 0, 0.09803922, 1, 1,
0.3828094, 0.3894862, 0.8872632, 0, 0.09411765, 1, 1,
0.3835822, 1.496281, 1.383259, 0, 0.08627451, 1, 1,
0.3870019, -1.129904, 2.145276, 0, 0.08235294, 1, 1,
0.389493, 1.219, -1.979293, 0, 0.07450981, 1, 1,
0.3926422, -1.556233, 1.925497, 0, 0.07058824, 1, 1,
0.3950188, -1.891768, 1.352771, 0, 0.0627451, 1, 1,
0.3970858, -0.1779983, 2.305201, 0, 0.05882353, 1, 1,
0.3973156, -1.824936, 3.833139, 0, 0.05098039, 1, 1,
0.3982679, -0.3865527, 0.6532453, 0, 0.04705882, 1, 1,
0.4015796, -0.364572, 3.852245, 0, 0.03921569, 1, 1,
0.4015838, -0.1329812, 3.327386, 0, 0.03529412, 1, 1,
0.4032276, -1.509962, 3.911975, 0, 0.02745098, 1, 1,
0.4036804, -0.09495493, 1.974517, 0, 0.02352941, 1, 1,
0.4061708, -1.469585, 2.020972, 0, 0.01568628, 1, 1,
0.4066749, -0.1679616, 2.878692, 0, 0.01176471, 1, 1,
0.4081597, 0.3189801, 1.423058, 0, 0.003921569, 1, 1,
0.4084757, 1.029925, -0.675489, 0.003921569, 0, 1, 1,
0.4086184, -1.282595, 2.234117, 0.007843138, 0, 1, 1,
0.4179665, 0.03632118, -0.09203254, 0.01568628, 0, 1, 1,
0.418839, 1.483846, 0.9786914, 0.01960784, 0, 1, 1,
0.4234338, -1.448457, 4.838789, 0.02745098, 0, 1, 1,
0.4257749, -2.577085, 3.374022, 0.03137255, 0, 1, 1,
0.4315206, -2.193393, 4.406705, 0.03921569, 0, 1, 1,
0.4326923, 2.040893, 0.1624902, 0.04313726, 0, 1, 1,
0.4371848, 1.00415, 1.342672, 0.05098039, 0, 1, 1,
0.440356, 0.1504131, 0.8142347, 0.05490196, 0, 1, 1,
0.443696, 0.2288969, 3.272528, 0.0627451, 0, 1, 1,
0.4442838, 1.613523, -1.789217, 0.06666667, 0, 1, 1,
0.4458213, -0.01403969, 1.515074, 0.07450981, 0, 1, 1,
0.4474128, -0.6504999, 1.697148, 0.07843138, 0, 1, 1,
0.4478509, 0.9743091, 0.718821, 0.08627451, 0, 1, 1,
0.4522423, 0.3932021, 0.8088225, 0.09019608, 0, 1, 1,
0.4553343, 1.630428, -0.5495867, 0.09803922, 0, 1, 1,
0.4634072, 0.2267198, 0.4795383, 0.1058824, 0, 1, 1,
0.4634879, -0.8056015, 4.600594, 0.1098039, 0, 1, 1,
0.47155, 0.8786953, 2.270542, 0.1176471, 0, 1, 1,
0.4717859, 0.4666518, -0.08856807, 0.1215686, 0, 1, 1,
0.4772629, -2.111069, 2.529993, 0.1294118, 0, 1, 1,
0.4784738, 0.90525, 1.149327, 0.1333333, 0, 1, 1,
0.4886945, -0.1107187, 1.96052, 0.1411765, 0, 1, 1,
0.4893526, -0.197789, 2.69432, 0.145098, 0, 1, 1,
0.4914171, -0.932707, 0.9687599, 0.1529412, 0, 1, 1,
0.4929217, -0.7405258, 1.913204, 0.1568628, 0, 1, 1,
0.496026, -0.1200619, 3.094505, 0.1647059, 0, 1, 1,
0.4977838, -0.4211503, 1.469847, 0.1686275, 0, 1, 1,
0.5011265, 0.5284542, 2.019999, 0.1764706, 0, 1, 1,
0.5024891, 0.2211319, 2.974626, 0.1803922, 0, 1, 1,
0.5044138, 0.7813638, 1.169796, 0.1882353, 0, 1, 1,
0.5065159, 1.53758, -0.6883156, 0.1921569, 0, 1, 1,
0.5072305, 0.3344986, 2.382154, 0.2, 0, 1, 1,
0.5074358, -0.7086319, 3.126183, 0.2078431, 0, 1, 1,
0.5077558, 0.00870535, 3.083601, 0.2117647, 0, 1, 1,
0.5132227, 0.3122712, -0.768943, 0.2196078, 0, 1, 1,
0.5158111, 0.01518081, 0.2216751, 0.2235294, 0, 1, 1,
0.5203164, -2.28706, 3.791073, 0.2313726, 0, 1, 1,
0.5209364, 0.1430657, -0.06724861, 0.2352941, 0, 1, 1,
0.5223532, -0.8471337, 1.848181, 0.2431373, 0, 1, 1,
0.5290114, -1.270384, 1.64089, 0.2470588, 0, 1, 1,
0.5299236, -1.385898, 2.315063, 0.254902, 0, 1, 1,
0.5309765, -1.148181, 2.847959, 0.2588235, 0, 1, 1,
0.5404825, 1.054058, -0.09098769, 0.2666667, 0, 1, 1,
0.5410562, -1.406585, 4.294484, 0.2705882, 0, 1, 1,
0.5474179, 1.557268, 0.5997567, 0.2784314, 0, 1, 1,
0.5506225, -0.004759367, 2.215619, 0.282353, 0, 1, 1,
0.5513861, 0.3274702, 0.5722206, 0.2901961, 0, 1, 1,
0.5523638, 0.3206777, 3.226079, 0.2941177, 0, 1, 1,
0.5601506, -1.823254, 2.638469, 0.3019608, 0, 1, 1,
0.5613595, 0.4221323, -0.2441869, 0.3098039, 0, 1, 1,
0.5616095, -0.9957429, 1.001678, 0.3137255, 0, 1, 1,
0.5653061, 0.2920295, 0.649209, 0.3215686, 0, 1, 1,
0.5679937, -0.3830438, 2.669975, 0.3254902, 0, 1, 1,
0.5700208, -1.262203, 2.496227, 0.3333333, 0, 1, 1,
0.5910372, -1.429138, 1.779796, 0.3372549, 0, 1, 1,
0.5928007, -1.471575, 3.355012, 0.345098, 0, 1, 1,
0.5930487, 2.030049, 0.9337008, 0.3490196, 0, 1, 1,
0.5953964, -1.186128, 3.128041, 0.3568628, 0, 1, 1,
0.5964068, -0.4755175, 2.928941, 0.3607843, 0, 1, 1,
0.5990882, 0.05611313, 1.537372, 0.3686275, 0, 1, 1,
0.6010457, -0.7630926, 2.888395, 0.372549, 0, 1, 1,
0.6015626, 0.8309386, 1.205982, 0.3803922, 0, 1, 1,
0.603985, -0.3903176, 1.707294, 0.3843137, 0, 1, 1,
0.6067744, 2.76602, 0.5201355, 0.3921569, 0, 1, 1,
0.6098251, -0.6651305, 0.8890446, 0.3960784, 0, 1, 1,
0.6104906, -0.2732869, 1.739444, 0.4039216, 0, 1, 1,
0.6111962, -0.7729462, 3.143598, 0.4117647, 0, 1, 1,
0.6161003, 0.6334069, 1.420466, 0.4156863, 0, 1, 1,
0.6161706, 0.04214853, 2.344991, 0.4235294, 0, 1, 1,
0.6199357, -0.5268538, 2.42287, 0.427451, 0, 1, 1,
0.6219493, -0.952454, 2.803021, 0.4352941, 0, 1, 1,
0.6237715, -0.4663835, 3.538173, 0.4392157, 0, 1, 1,
0.6267398, -1.165808, 1.804367, 0.4470588, 0, 1, 1,
0.6325022, -1.46918, 2.012677, 0.4509804, 0, 1, 1,
0.6368875, 0.1340204, 0.9294313, 0.4588235, 0, 1, 1,
0.6370802, -0.2401306, 1.57666, 0.4627451, 0, 1, 1,
0.637866, -0.6455459, 2.537735, 0.4705882, 0, 1, 1,
0.6389115, -0.3753558, 3.676129, 0.4745098, 0, 1, 1,
0.6389816, 1.196868, -0.2144118, 0.4823529, 0, 1, 1,
0.6407332, 0.8458272, 1.699988, 0.4862745, 0, 1, 1,
0.6409562, 1.910248, 0.3245783, 0.4941176, 0, 1, 1,
0.6500701, 1.367943, 0.8907413, 0.5019608, 0, 1, 1,
0.6536182, -0.5455995, 1.529165, 0.5058824, 0, 1, 1,
0.661995, 0.8270092, 0.5442541, 0.5137255, 0, 1, 1,
0.6634821, -0.03046747, 3.383539, 0.5176471, 0, 1, 1,
0.6701968, -0.2276232, 3.182357, 0.5254902, 0, 1, 1,
0.6720029, -0.2441661, 0.4515083, 0.5294118, 0, 1, 1,
0.677152, -0.4203043, 1.214159, 0.5372549, 0, 1, 1,
0.6775719, -0.69631, 3.04885, 0.5411765, 0, 1, 1,
0.6778693, -0.7844523, 2.813338, 0.5490196, 0, 1, 1,
0.6821257, 0.1444418, 1.864213, 0.5529412, 0, 1, 1,
0.687149, 0.1422076, 2.14361, 0.5607843, 0, 1, 1,
0.6894624, -0.3514513, 2.502133, 0.5647059, 0, 1, 1,
0.6976354, -1.024218, 2.503603, 0.572549, 0, 1, 1,
0.7009278, 0.1429748, 0.07327349, 0.5764706, 0, 1, 1,
0.7053288, 1.429902, 4.187284, 0.5843138, 0, 1, 1,
0.7073016, -0.3277181, 1.887924, 0.5882353, 0, 1, 1,
0.7182314, -1.287258, 2.923435, 0.5960785, 0, 1, 1,
0.7236528, -0.186728, 1.303481, 0.6039216, 0, 1, 1,
0.7326056, -0.7906379, 0.5939527, 0.6078432, 0, 1, 1,
0.7348765, 0.8383243, 1.590956, 0.6156863, 0, 1, 1,
0.7522115, -0.3366485, 1.122517, 0.6196079, 0, 1, 1,
0.7545295, 0.8111058, 1.928839, 0.627451, 0, 1, 1,
0.7549776, 0.6377873, -1.339984, 0.6313726, 0, 1, 1,
0.7565597, -0.2899863, 1.385689, 0.6392157, 0, 1, 1,
0.7586589, -1.642113, 4.079438, 0.6431373, 0, 1, 1,
0.7612695, -0.4440148, 1.533546, 0.6509804, 0, 1, 1,
0.7621742, 1.260129, 0.5341628, 0.654902, 0, 1, 1,
0.7682378, 0.2239901, 1.516194, 0.6627451, 0, 1, 1,
0.7732589, -0.08469275, 0.9386862, 0.6666667, 0, 1, 1,
0.7741812, 0.4605155, -0.04391208, 0.6745098, 0, 1, 1,
0.7757787, 0.09457543, 1.394988, 0.6784314, 0, 1, 1,
0.7815762, -0.1672787, 2.732898, 0.6862745, 0, 1, 1,
0.7823496, 1.781608, 1.799363, 0.6901961, 0, 1, 1,
0.7824678, -0.8104873, 2.465409, 0.6980392, 0, 1, 1,
0.7837114, -0.171283, 0.7907761, 0.7058824, 0, 1, 1,
0.7838008, 1.295976, 2.569208, 0.7098039, 0, 1, 1,
0.785056, 0.9420707, 0.3394842, 0.7176471, 0, 1, 1,
0.7890806, 1.300935, 0.05475157, 0.7215686, 0, 1, 1,
0.7939266, -0.5031057, 2.423878, 0.7294118, 0, 1, 1,
0.8035828, -0.6807793, 3.622603, 0.7333333, 0, 1, 1,
0.8096549, 0.7779602, 0.688093, 0.7411765, 0, 1, 1,
0.8101993, -1.281831, 1.354253, 0.7450981, 0, 1, 1,
0.8113053, -0.5601835, 1.393184, 0.7529412, 0, 1, 1,
0.8122563, 0.4067657, 1.53311, 0.7568628, 0, 1, 1,
0.8247901, -0.2033209, 1.37666, 0.7647059, 0, 1, 1,
0.8315089, 1.387795, 0.7134957, 0.7686275, 0, 1, 1,
0.8316455, 0.5243144, 1.99961, 0.7764706, 0, 1, 1,
0.8319318, -0.7927591, 1.470788, 0.7803922, 0, 1, 1,
0.8346265, -0.9296235, 4.177865, 0.7882353, 0, 1, 1,
0.8352032, -1.280406, 3.059175, 0.7921569, 0, 1, 1,
0.8361115, 0.1127571, 3.809423, 0.8, 0, 1, 1,
0.8384389, -2.376374, 3.437564, 0.8078431, 0, 1, 1,
0.846684, 1.879858, 0.8840623, 0.8117647, 0, 1, 1,
0.8469592, 0.516111, 0.917964, 0.8196079, 0, 1, 1,
0.8498738, 1.121688, 1.299472, 0.8235294, 0, 1, 1,
0.8526492, 0.6537299, 1.074221, 0.8313726, 0, 1, 1,
0.8534734, -0.4873189, 2.057474, 0.8352941, 0, 1, 1,
0.8547465, -0.4461506, 1.814287, 0.8431373, 0, 1, 1,
0.855372, 0.2875821, 0.5319591, 0.8470588, 0, 1, 1,
0.8553844, -1.482019, 1.198032, 0.854902, 0, 1, 1,
0.8564878, 1.448196, -0.01021666, 0.8588235, 0, 1, 1,
0.8567429, -0.7502882, 2.356798, 0.8666667, 0, 1, 1,
0.8700429, -1.099408, 2.031421, 0.8705882, 0, 1, 1,
0.8744911, 0.8622127, 2.101009, 0.8784314, 0, 1, 1,
0.8746912, 1.349272, -0.2190702, 0.8823529, 0, 1, 1,
0.8838621, 0.5009006, 0.6496815, 0.8901961, 0, 1, 1,
0.8848261, 1.688008, -1.121813, 0.8941177, 0, 1, 1,
0.8895537, 0.04764264, 1.670125, 0.9019608, 0, 1, 1,
0.8910707, 0.5744671, 1.41583, 0.9098039, 0, 1, 1,
0.8943792, 0.4919706, 1.694746, 0.9137255, 0, 1, 1,
0.8948861, 0.6127271, 1.829659, 0.9215686, 0, 1, 1,
0.9002979, -1.512419, 3.476875, 0.9254902, 0, 1, 1,
0.9023553, 0.8158156, 0.4285342, 0.9333333, 0, 1, 1,
0.9068867, -0.1595104, 2.888674, 0.9372549, 0, 1, 1,
0.9074129, 0.7703357, 0.2377089, 0.945098, 0, 1, 1,
0.9091275, 1.922978, 0.3289091, 0.9490196, 0, 1, 1,
0.911343, 0.9477851, 0.756914, 0.9568627, 0, 1, 1,
0.9258239, 0.3536757, 2.283899, 0.9607843, 0, 1, 1,
0.9266399, -0.7132124, 1.841125, 0.9686275, 0, 1, 1,
0.9275058, -1.223194, 2.056874, 0.972549, 0, 1, 1,
0.9290954, -2.524301, 2.324912, 0.9803922, 0, 1, 1,
0.9310002, -0.6190562, 2.528971, 0.9843137, 0, 1, 1,
0.9420462, -0.6334058, 2.998215, 0.9921569, 0, 1, 1,
0.9441962, -0.07606123, 1.176079, 0.9960784, 0, 1, 1,
0.9443698, 0.2761185, 2.013912, 1, 0, 0.9960784, 1,
0.9540733, -1.252309, 2.25476, 1, 0, 0.9882353, 1,
0.9581261, 0.8964121, -0.2821772, 1, 0, 0.9843137, 1,
0.9588388, 0.002418386, 0.4870773, 1, 0, 0.9764706, 1,
0.9696351, 1.372951, -1.567641, 1, 0, 0.972549, 1,
0.9698305, -0.5165148, 2.14126, 1, 0, 0.9647059, 1,
0.9721588, -0.9280426, 2.440845, 1, 0, 0.9607843, 1,
0.9729743, -1.83085, 1.870754, 1, 0, 0.9529412, 1,
0.9784811, -0.5801916, 0.6139901, 1, 0, 0.9490196, 1,
0.9810593, 0.3403482, 0.2361706, 1, 0, 0.9411765, 1,
0.9989617, -0.1065621, 0.3378694, 1, 0, 0.9372549, 1,
0.9997963, 0.2980781, 1.742084, 1, 0, 0.9294118, 1,
0.9998577, -0.3269573, 0.6855552, 1, 0, 0.9254902, 1,
1.005357, 1.548114, 0.6098973, 1, 0, 0.9176471, 1,
1.007754, -0.753623, 0.379065, 1, 0, 0.9137255, 1,
1.008087, -0.007055001, 1.395573, 1, 0, 0.9058824, 1,
1.008621, 1.363993, 1.355642, 1, 0, 0.9019608, 1,
1.020782, 0.1759238, -1.439352, 1, 0, 0.8941177, 1,
1.021787, 0.1887253, 2.320301, 1, 0, 0.8862745, 1,
1.024612, -1.593626, 1.903408, 1, 0, 0.8823529, 1,
1.029206, -0.7738901, 1.662291, 1, 0, 0.8745098, 1,
1.030673, 1.044476, 0.8630474, 1, 0, 0.8705882, 1,
1.031297, -1.235256, 3.95593, 1, 0, 0.8627451, 1,
1.031812, -0.8222113, 1.534863, 1, 0, 0.8588235, 1,
1.032927, -0.3080338, 2.01303, 1, 0, 0.8509804, 1,
1.046005, -0.1958972, 1.460293, 1, 0, 0.8470588, 1,
1.047329, 1.176838, 1.614334, 1, 0, 0.8392157, 1,
1.052797, 1.344944, 0.4667658, 1, 0, 0.8352941, 1,
1.061734, -0.7762224, 4.499776, 1, 0, 0.827451, 1,
1.070229, -0.5101419, 3.592968, 1, 0, 0.8235294, 1,
1.081171, 0.9131504, 1.391678, 1, 0, 0.8156863, 1,
1.081473, -0.6760284, 2.622998, 1, 0, 0.8117647, 1,
1.084654, 0.4242849, 0.4231261, 1, 0, 0.8039216, 1,
1.089358, -0.499791, 0.9379061, 1, 0, 0.7960784, 1,
1.092987, 0.7477558, 0.409025, 1, 0, 0.7921569, 1,
1.097901, -0.2711127, 2.251807, 1, 0, 0.7843137, 1,
1.098062, 0.117936, 1.739634, 1, 0, 0.7803922, 1,
1.10618, 2.147526, 1.380812, 1, 0, 0.772549, 1,
1.109792, 2.35551, 0.3299655, 1, 0, 0.7686275, 1,
1.113933, 0.6097382, 3.049015, 1, 0, 0.7607843, 1,
1.117498, -0.09795707, 1.826077, 1, 0, 0.7568628, 1,
1.128283, -0.2712196, 1.65458, 1, 0, 0.7490196, 1,
1.128905, -0.8921455, 3.037768, 1, 0, 0.7450981, 1,
1.138679, -1.313387, 2.783284, 1, 0, 0.7372549, 1,
1.144844, -0.6231206, 3.013053, 1, 0, 0.7333333, 1,
1.148938, -1.597768, 2.42643, 1, 0, 0.7254902, 1,
1.151297, 2.446647, 1.068199, 1, 0, 0.7215686, 1,
1.152389, -1.485267, 2.389376, 1, 0, 0.7137255, 1,
1.166435, 0.2032651, 0.7622089, 1, 0, 0.7098039, 1,
1.174541, 1.115143, -0.5591264, 1, 0, 0.7019608, 1,
1.174991, -0.01962391, 0.7431121, 1, 0, 0.6941177, 1,
1.182513, -1.199033, 4.069098, 1, 0, 0.6901961, 1,
1.197286, 0.2170441, 1.211843, 1, 0, 0.682353, 1,
1.198017, -0.5140635, 1.957182, 1, 0, 0.6784314, 1,
1.225698, -0.8996563, 1.79043, 1, 0, 0.6705883, 1,
1.229697, 0.6265047, 1.655268, 1, 0, 0.6666667, 1,
1.230951, -0.723141, 2.898915, 1, 0, 0.6588235, 1,
1.232787, 0.6656067, -0.1461415, 1, 0, 0.654902, 1,
1.233428, 0.7976859, 1.766786, 1, 0, 0.6470588, 1,
1.256753, 0.1784659, -0.1618282, 1, 0, 0.6431373, 1,
1.267339, -2.350432, 4.607337, 1, 0, 0.6352941, 1,
1.268784, 0.2277897, 2.087812, 1, 0, 0.6313726, 1,
1.285921, 1.889588, -1.613712, 1, 0, 0.6235294, 1,
1.291527, 0.2584937, 1.125882, 1, 0, 0.6196079, 1,
1.306785, -0.2707381, 2.552592, 1, 0, 0.6117647, 1,
1.318354, -0.3319548, 2.823682, 1, 0, 0.6078432, 1,
1.330773, 1.647171, 0.1667139, 1, 0, 0.6, 1,
1.340101, -2.414417, 3.369373, 1, 0, 0.5921569, 1,
1.346949, -1.129288, 1.898998, 1, 0, 0.5882353, 1,
1.351841, 1.15962, -0.04170135, 1, 0, 0.5803922, 1,
1.355812, -0.8582061, 2.026405, 1, 0, 0.5764706, 1,
1.368317, -0.460032, 1.879969, 1, 0, 0.5686275, 1,
1.371913, -1.593848, 2.790821, 1, 0, 0.5647059, 1,
1.387081, 0.4548615, 1.159326, 1, 0, 0.5568628, 1,
1.388369, -1.581844, 0.8220586, 1, 0, 0.5529412, 1,
1.399346, 0.8359377, 1.339007, 1, 0, 0.5450981, 1,
1.417775, -0.6607476, 3.322119, 1, 0, 0.5411765, 1,
1.41821, 2.284275, 0.006238763, 1, 0, 0.5333334, 1,
1.420368, -0.8865397, 3.302965, 1, 0, 0.5294118, 1,
1.422264, 0.7695497, 2.99882, 1, 0, 0.5215687, 1,
1.428093, -0.3766676, 2.508106, 1, 0, 0.5176471, 1,
1.429074, -1.560436, 2.256477, 1, 0, 0.509804, 1,
1.432194, -0.8882218, 2.562035, 1, 0, 0.5058824, 1,
1.435283, -1.132902, 1.915224, 1, 0, 0.4980392, 1,
1.443827, -0.4171522, 2.938375, 1, 0, 0.4901961, 1,
1.449396, 0.09900619, 0.1964191, 1, 0, 0.4862745, 1,
1.453569, 0.4542908, 0.6879184, 1, 0, 0.4784314, 1,
1.45867, 0.5491797, 1.121985, 1, 0, 0.4745098, 1,
1.465842, 0.5914248, -0.3977661, 1, 0, 0.4666667, 1,
1.476166, -1.368756, 2.057442, 1, 0, 0.4627451, 1,
1.478323, 0.08599469, -0.2121179, 1, 0, 0.454902, 1,
1.480857, 1.406232, 1.273996, 1, 0, 0.4509804, 1,
1.487325, 0.7118729, 0.6891931, 1, 0, 0.4431373, 1,
1.517204, -1.628691, 0.8165579, 1, 0, 0.4392157, 1,
1.517247, -1.22955, 3.731595, 1, 0, 0.4313726, 1,
1.52565, 1.775849, 0.2483902, 1, 0, 0.427451, 1,
1.528457, 0.8899105, 1.369847, 1, 0, 0.4196078, 1,
1.546587, -0.873317, 1.465755, 1, 0, 0.4156863, 1,
1.554667, 0.4611708, 0.7506931, 1, 0, 0.4078431, 1,
1.569431, 0.6185894, 2.636502, 1, 0, 0.4039216, 1,
1.571183, -1.237893e-05, 2.665962, 1, 0, 0.3960784, 1,
1.57691, 0.3591152, 1.376831, 1, 0, 0.3882353, 1,
1.58432, 0.05606562, 2.793164, 1, 0, 0.3843137, 1,
1.585169, 0.2487436, 1.134619, 1, 0, 0.3764706, 1,
1.586424, 0.2729082, 2.421384, 1, 0, 0.372549, 1,
1.607661, -1.242544, 0.6190155, 1, 0, 0.3647059, 1,
1.609527, 0.7368318, 1.748885, 1, 0, 0.3607843, 1,
1.619481, 0.06929859, 0.1888541, 1, 0, 0.3529412, 1,
1.628202, 0.9727778, 2.468391, 1, 0, 0.3490196, 1,
1.636698, 0.9015837, 1.371626, 1, 0, 0.3411765, 1,
1.643182, 0.04791861, 2.267746, 1, 0, 0.3372549, 1,
1.644549, -0.9617408, 2.255509, 1, 0, 0.3294118, 1,
1.648121, -1.575373, 1.424271, 1, 0, 0.3254902, 1,
1.667627, 0.9036949, 1.122143, 1, 0, 0.3176471, 1,
1.674342, -0.8973041, 1.652998, 1, 0, 0.3137255, 1,
1.701504, -1.153676, 0.3070827, 1, 0, 0.3058824, 1,
1.706365, 1.632988, 1.643348, 1, 0, 0.2980392, 1,
1.710848, 1.316372, 1.016358, 1, 0, 0.2941177, 1,
1.719402, -0.4866114, 2.115066, 1, 0, 0.2862745, 1,
1.730267, -0.2349949, 2.721529, 1, 0, 0.282353, 1,
1.738024, -0.8131651, 2.074004, 1, 0, 0.2745098, 1,
1.742074, 0.6992137, 2.210652, 1, 0, 0.2705882, 1,
1.747217, -1.309867, 0.6910179, 1, 0, 0.2627451, 1,
1.7604, 0.3409973, 1.07975, 1, 0, 0.2588235, 1,
1.793684, 0.09426873, 1.49858, 1, 0, 0.2509804, 1,
1.798255, 0.2154067, 2.357302, 1, 0, 0.2470588, 1,
1.807011, -0.5190959, 1.12922, 1, 0, 0.2392157, 1,
1.808831, 1.489702, 2.226339, 1, 0, 0.2352941, 1,
1.811575, -1.007188, 3.082561, 1, 0, 0.227451, 1,
1.84041, 2.365957, -1.060673, 1, 0, 0.2235294, 1,
1.843349, 1.754069, 1.502501, 1, 0, 0.2156863, 1,
1.853482, 0.4486014, 3.295342, 1, 0, 0.2117647, 1,
1.858542, -0.347971, 2.883147, 1, 0, 0.2039216, 1,
1.869018, 1.058437, -0.03853353, 1, 0, 0.1960784, 1,
1.877692, -0.2184281, 1.620755, 1, 0, 0.1921569, 1,
1.881766, -0.8026893, 0.5514693, 1, 0, 0.1843137, 1,
1.882171, 0.1046016, 0.5402079, 1, 0, 0.1803922, 1,
1.918357, 0.4348182, 1.227156, 1, 0, 0.172549, 1,
1.923254, -0.1046748, 2.203178, 1, 0, 0.1686275, 1,
1.929489, 1.939615, 1.361857, 1, 0, 0.1607843, 1,
1.943888, 0.3616199, 1.351918, 1, 0, 0.1568628, 1,
1.962889, -0.7853284, 1.214901, 1, 0, 0.1490196, 1,
1.96328, -0.8701548, 2.668015, 1, 0, 0.145098, 1,
1.966435, 0.720669, 3.076995, 1, 0, 0.1372549, 1,
1.969614, -0.01056611, 1.428762, 1, 0, 0.1333333, 1,
2.011446, -0.1219443, 1.907534, 1, 0, 0.1254902, 1,
2.019712, -0.420528, 0.8000653, 1, 0, 0.1215686, 1,
2.020986, -0.3955481, 1.188896, 1, 0, 0.1137255, 1,
2.025163, -0.8882653, 0.8609, 1, 0, 0.1098039, 1,
2.033654, -0.7997033, 2.847179, 1, 0, 0.1019608, 1,
2.040067, 0.3924261, 1.956174, 1, 0, 0.09411765, 1,
2.114788, 2.114846, 0.8060341, 1, 0, 0.09019608, 1,
2.148921, -0.6236115, 2.011825, 1, 0, 0.08235294, 1,
2.187797, -0.4093619, 1.932765, 1, 0, 0.07843138, 1,
2.220598, -0.4966981, 0.6204485, 1, 0, 0.07058824, 1,
2.256357, 0.6419464, 0.2508871, 1, 0, 0.06666667, 1,
2.280781, -0.6442846, 1.129247, 1, 0, 0.05882353, 1,
2.31375, 1.304158, 2.255997, 1, 0, 0.05490196, 1,
2.41275, -0.07048987, 1.254667, 1, 0, 0.04705882, 1,
2.477875, 0.4755988, 2.248759, 1, 0, 0.04313726, 1,
2.755914, 0.520418, 1.157208, 1, 0, 0.03529412, 1,
2.871274, -0.2143767, 1.202229, 1, 0, 0.03137255, 1,
2.942631, 1.047906, 0.934679, 1, 0, 0.02352941, 1,
3.166197, 0.8116055, 1.323194, 1, 0, 0.01960784, 1,
3.207869, -0.4291925, 3.310776, 1, 0, 0.01176471, 1,
3.997343, -0.007966795, 1.858034, 1, 0, 0.007843138, 1
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
0.3779943, -4.076171, -7.668737, 0, -0.5, 0.5, 0.5,
0.3779943, -4.076171, -7.668737, 1, -0.5, 0.5, 0.5,
0.3779943, -4.076171, -7.668737, 1, 1.5, 0.5, 0.5,
0.3779943, -4.076171, -7.668737, 0, 1.5, 0.5, 0.5
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
-4.468313, -0.06755579, -7.668737, 0, -0.5, 0.5, 0.5,
-4.468313, -0.06755579, -7.668737, 1, -0.5, 0.5, 0.5,
-4.468313, -0.06755579, -7.668737, 1, 1.5, 0.5, 0.5,
-4.468313, -0.06755579, -7.668737, 0, 1.5, 0.5, 0.5
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
-4.468313, -4.076171, -0.5085926, 0, -0.5, 0.5, 0.5,
-4.468313, -4.076171, -0.5085926, 1, -0.5, 0.5, 0.5,
-4.468313, -4.076171, -0.5085926, 1, 1.5, 0.5, 0.5,
-4.468313, -4.076171, -0.5085926, 0, 1.5, 0.5, 0.5
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
-2, -3.151106, -6.016396,
2, -3.151106, -6.016396,
-2, -3.151106, -6.016396,
-2, -3.305284, -6.291786,
0, -3.151106, -6.016396,
0, -3.305284, -6.291786,
2, -3.151106, -6.016396,
2, -3.305284, -6.291786
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
"0",
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
-2, -3.613639, -6.842566, 0, -0.5, 0.5, 0.5,
-2, -3.613639, -6.842566, 1, -0.5, 0.5, 0.5,
-2, -3.613639, -6.842566, 1, 1.5, 0.5, 0.5,
-2, -3.613639, -6.842566, 0, 1.5, 0.5, 0.5,
0, -3.613639, -6.842566, 0, -0.5, 0.5, 0.5,
0, -3.613639, -6.842566, 1, -0.5, 0.5, 0.5,
0, -3.613639, -6.842566, 1, 1.5, 0.5, 0.5,
0, -3.613639, -6.842566, 0, 1.5, 0.5, 0.5,
2, -3.613639, -6.842566, 0, -0.5, 0.5, 0.5,
2, -3.613639, -6.842566, 1, -0.5, 0.5, 0.5,
2, -3.613639, -6.842566, 1, 1.5, 0.5, 0.5,
2, -3.613639, -6.842566, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.349934, -3, -6.016396,
-3.349934, 2, -6.016396,
-3.349934, -3, -6.016396,
-3.536331, -3, -6.291786,
-3.349934, -2, -6.016396,
-3.536331, -2, -6.291786,
-3.349934, -1, -6.016396,
-3.536331, -1, -6.291786,
-3.349934, 0, -6.016396,
-3.536331, 0, -6.291786,
-3.349934, 1, -6.016396,
-3.536331, 1, -6.291786,
-3.349934, 2, -6.016396,
-3.536331, 2, -6.291786
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
-3.909124, -3, -6.842566, 0, -0.5, 0.5, 0.5,
-3.909124, -3, -6.842566, 1, -0.5, 0.5, 0.5,
-3.909124, -3, -6.842566, 1, 1.5, 0.5, 0.5,
-3.909124, -3, -6.842566, 0, 1.5, 0.5, 0.5,
-3.909124, -2, -6.842566, 0, -0.5, 0.5, 0.5,
-3.909124, -2, -6.842566, 1, -0.5, 0.5, 0.5,
-3.909124, -2, -6.842566, 1, 1.5, 0.5, 0.5,
-3.909124, -2, -6.842566, 0, 1.5, 0.5, 0.5,
-3.909124, -1, -6.842566, 0, -0.5, 0.5, 0.5,
-3.909124, -1, -6.842566, 1, -0.5, 0.5, 0.5,
-3.909124, -1, -6.842566, 1, 1.5, 0.5, 0.5,
-3.909124, -1, -6.842566, 0, 1.5, 0.5, 0.5,
-3.909124, 0, -6.842566, 0, -0.5, 0.5, 0.5,
-3.909124, 0, -6.842566, 1, -0.5, 0.5, 0.5,
-3.909124, 0, -6.842566, 1, 1.5, 0.5, 0.5,
-3.909124, 0, -6.842566, 0, 1.5, 0.5, 0.5,
-3.909124, 1, -6.842566, 0, -0.5, 0.5, 0.5,
-3.909124, 1, -6.842566, 1, -0.5, 0.5, 0.5,
-3.909124, 1, -6.842566, 1, 1.5, 0.5, 0.5,
-3.909124, 1, -6.842566, 0, 1.5, 0.5, 0.5,
-3.909124, 2, -6.842566, 0, -0.5, 0.5, 0.5,
-3.909124, 2, -6.842566, 1, -0.5, 0.5, 0.5,
-3.909124, 2, -6.842566, 1, 1.5, 0.5, 0.5,
-3.909124, 2, -6.842566, 0, 1.5, 0.5, 0.5
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
-3.349934, -3.151106, -4,
-3.349934, -3.151106, 4,
-3.349934, -3.151106, -4,
-3.536331, -3.305284, -4,
-3.349934, -3.151106, -2,
-3.536331, -3.305284, -2,
-3.349934, -3.151106, 0,
-3.536331, -3.305284, 0,
-3.349934, -3.151106, 2,
-3.536331, -3.305284, 2,
-3.349934, -3.151106, 4,
-3.536331, -3.305284, 4
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
-3.909124, -3.613639, -4, 0, -0.5, 0.5, 0.5,
-3.909124, -3.613639, -4, 1, -0.5, 0.5, 0.5,
-3.909124, -3.613639, -4, 1, 1.5, 0.5, 0.5,
-3.909124, -3.613639, -4, 0, 1.5, 0.5, 0.5,
-3.909124, -3.613639, -2, 0, -0.5, 0.5, 0.5,
-3.909124, -3.613639, -2, 1, -0.5, 0.5, 0.5,
-3.909124, -3.613639, -2, 1, 1.5, 0.5, 0.5,
-3.909124, -3.613639, -2, 0, 1.5, 0.5, 0.5,
-3.909124, -3.613639, 0, 0, -0.5, 0.5, 0.5,
-3.909124, -3.613639, 0, 1, -0.5, 0.5, 0.5,
-3.909124, -3.613639, 0, 1, 1.5, 0.5, 0.5,
-3.909124, -3.613639, 0, 0, 1.5, 0.5, 0.5,
-3.909124, -3.613639, 2, 0, -0.5, 0.5, 0.5,
-3.909124, -3.613639, 2, 1, -0.5, 0.5, 0.5,
-3.909124, -3.613639, 2, 1, 1.5, 0.5, 0.5,
-3.909124, -3.613639, 2, 0, 1.5, 0.5, 0.5,
-3.909124, -3.613639, 4, 0, -0.5, 0.5, 0.5,
-3.909124, -3.613639, 4, 1, -0.5, 0.5, 0.5,
-3.909124, -3.613639, 4, 1, 1.5, 0.5, 0.5,
-3.909124, -3.613639, 4, 0, 1.5, 0.5, 0.5
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
-3.349934, -3.151106, -6.016396,
-3.349934, 3.015995, -6.016396,
-3.349934, -3.151106, 4.999211,
-3.349934, 3.015995, 4.999211,
-3.349934, -3.151106, -6.016396,
-3.349934, -3.151106, 4.999211,
-3.349934, 3.015995, -6.016396,
-3.349934, 3.015995, 4.999211,
-3.349934, -3.151106, -6.016396,
4.105923, -3.151106, -6.016396,
-3.349934, -3.151106, 4.999211,
4.105923, -3.151106, 4.999211,
-3.349934, 3.015995, -6.016396,
4.105923, 3.015995, -6.016396,
-3.349934, 3.015995, 4.999211,
4.105923, 3.015995, 4.999211,
4.105923, -3.151106, -6.016396,
4.105923, 3.015995, -6.016396,
4.105923, -3.151106, 4.999211,
4.105923, 3.015995, 4.999211,
4.105923, -3.151106, -6.016396,
4.105923, -3.151106, 4.999211,
4.105923, 3.015995, -6.016396,
4.105923, 3.015995, 4.999211
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
var radius = 7.829083;
var distance = 34.83247;
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
mvMatrix.translate( -0.3779943, 0.06755579, 0.5085926 );
mvMatrix.scale( 1.135343, 1.372599, 0.7684513 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.83247);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Fluometuron<-read.table("Fluometuron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Fluometuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'Fluometuron' not found
```

```r
y<-Fluometuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'Fluometuron' not found
```

```r
z<-Fluometuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'Fluometuron' not found
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
-3.241354, 0.7597102, 0.1591344, 0, 0, 1, 1, 1,
-3.042233, 1.300434, 0.3029237, 1, 0, 0, 1, 1,
-2.879483, -0.0009829801, -2.125872, 1, 0, 0, 1, 1,
-2.814298, -0.1844132, -0.895759, 1, 0, 0, 1, 1,
-2.702451, 0.1605033, 0.007299749, 1, 0, 0, 1, 1,
-2.601076, 0.9801692, 0.3627755, 1, 0, 0, 1, 1,
-2.574564, 0.4589103, -1.931736, 0, 0, 0, 1, 1,
-2.475877, -2.236895, -2.553529, 0, 0, 0, 1, 1,
-2.461807, 0.890197, -1.062726, 0, 0, 0, 1, 1,
-2.430917, -1.14302, -0.6907493, 0, 0, 0, 1, 1,
-2.398543, -0.06607051, -2.011481, 0, 0, 0, 1, 1,
-2.359441, 0.4390733, -2.111763, 0, 0, 0, 1, 1,
-2.201576, -1.346167, -1.788168, 0, 0, 0, 1, 1,
-2.178501, 0.5005164, 0.09711747, 1, 1, 1, 1, 1,
-2.170261, -2.100799, -0.3800724, 1, 1, 1, 1, 1,
-2.150213, 0.277755, -1.032745, 1, 1, 1, 1, 1,
-2.130875, -0.2089397, 0.3767539, 1, 1, 1, 1, 1,
-2.126423, 0.8370334, -2.332991, 1, 1, 1, 1, 1,
-2.105791, 2.926183, -0.753475, 1, 1, 1, 1, 1,
-2.070433, 0.8130231, 0.1998088, 1, 1, 1, 1, 1,
-2.015797, 0.1097036, -1.693128, 1, 1, 1, 1, 1,
-2.008452, -0.1568785, -0.5594804, 1, 1, 1, 1, 1,
-1.986274, -0.292037, -2.349953, 1, 1, 1, 1, 1,
-1.984692, 0.8553464, 0.1509544, 1, 1, 1, 1, 1,
-1.923707, 0.973803, 0.4940416, 1, 1, 1, 1, 1,
-1.907841, -1.023864, -3.352124, 1, 1, 1, 1, 1,
-1.882168, -0.7490895, -2.136089, 1, 1, 1, 1, 1,
-1.880563, -0.1135999, -1.108189, 1, 1, 1, 1, 1,
-1.870233, -0.7962613, -2.166572, 0, 0, 1, 1, 1,
-1.867398, -2.260904, -0.9702095, 1, 0, 0, 1, 1,
-1.856003, 0.06766345, -1.444798, 1, 0, 0, 1, 1,
-1.855768, -0.3117064, -3.666976, 1, 0, 0, 1, 1,
-1.844509, -1.950664, -3.412089, 1, 0, 0, 1, 1,
-1.844098, -0.705016, -1.073863, 1, 0, 0, 1, 1,
-1.834736, -2.228544, -2.230017, 0, 0, 0, 1, 1,
-1.824347, -0.07612684, -0.5660259, 0, 0, 0, 1, 1,
-1.816336, 0.1147357, -2.132263, 0, 0, 0, 1, 1,
-1.81225, 1.92482, -0.6294038, 0, 0, 0, 1, 1,
-1.809092, 1.267331, 0.1560043, 0, 0, 0, 1, 1,
-1.8078, 1.800601, -0.6044968, 0, 0, 0, 1, 1,
-1.805712, -0.8064737, -2.412361, 0, 0, 0, 1, 1,
-1.793908, -0.7984151, -2.761739, 1, 1, 1, 1, 1,
-1.754361, 1.472429, 1.516797, 1, 1, 1, 1, 1,
-1.736901, 1.15334, -0.3298465, 1, 1, 1, 1, 1,
-1.730052, -0.8754035, -0.6671957, 1, 1, 1, 1, 1,
-1.720691, 0.4340615, -0.05898837, 1, 1, 1, 1, 1,
-1.694068, 0.5945694, -1.410354, 1, 1, 1, 1, 1,
-1.671363, -0.9336445, -2.414362, 1, 1, 1, 1, 1,
-1.667529, 1.086774, -1.340939, 1, 1, 1, 1, 1,
-1.625236, -0.366007, -1.445159, 1, 1, 1, 1, 1,
-1.625164, -1.667198, -1.100023, 1, 1, 1, 1, 1,
-1.624196, 0.5349573, -2.284825, 1, 1, 1, 1, 1,
-1.621771, -0.6538789, -0.8689956, 1, 1, 1, 1, 1,
-1.605396, -0.2432025, -4.465237, 1, 1, 1, 1, 1,
-1.598959, -0.1946325, -1.710028, 1, 1, 1, 1, 1,
-1.595995, 0.1356099, 0.4188577, 1, 1, 1, 1, 1,
-1.588589, 0.5940558, -2.203698, 0, 0, 1, 1, 1,
-1.586085, -0.6873725, -1.127246, 1, 0, 0, 1, 1,
-1.578682, -0.06249831, -2.013088, 1, 0, 0, 1, 1,
-1.574562, -0.2840788, 0.1984493, 1, 0, 0, 1, 1,
-1.570297, 2.324195, -2.002074, 1, 0, 0, 1, 1,
-1.559053, -0.1998627, -1.420284, 1, 0, 0, 1, 1,
-1.557709, 1.390095, -0.1351644, 0, 0, 0, 1, 1,
-1.555674, -0.7554511, -1.641051, 0, 0, 0, 1, 1,
-1.552698, -0.06075382, -0.07971776, 0, 0, 0, 1, 1,
-1.55119, -0.9230495, -0.8510467, 0, 0, 0, 1, 1,
-1.536557, 0.8463374, -2.235336, 0, 0, 0, 1, 1,
-1.504304, 0.1478497, -1.024373, 0, 0, 0, 1, 1,
-1.491302, -0.8633922, -2.164949, 0, 0, 0, 1, 1,
-1.490642, -0.6344486, 0.07345338, 1, 1, 1, 1, 1,
-1.488129, -1.397935, -2.237182, 1, 1, 1, 1, 1,
-1.487292, -2.243428, -2.022646, 1, 1, 1, 1, 1,
-1.48399, 0.3198218, -0.1152749, 1, 1, 1, 1, 1,
-1.475294, 0.2978193, -2.151974, 1, 1, 1, 1, 1,
-1.457283, 0.6818624, -1.15151, 1, 1, 1, 1, 1,
-1.45681, -1.59905, 0.4103834, 1, 1, 1, 1, 1,
-1.45145, -0.03977691, -2.674527, 1, 1, 1, 1, 1,
-1.446442, -2.432574, -3.000768, 1, 1, 1, 1, 1,
-1.419445, -1.671275, -1.20402, 1, 1, 1, 1, 1,
-1.418073, 0.997306, 0.06883433, 1, 1, 1, 1, 1,
-1.413859, -0.6280341, -4.96348, 1, 1, 1, 1, 1,
-1.4068, 1.17267, -2.019396, 1, 1, 1, 1, 1,
-1.395738, -0.1688326, -2.308238, 1, 1, 1, 1, 1,
-1.392628, 0.1528927, -0.9644063, 1, 1, 1, 1, 1,
-1.383296, 0.1169071, -0.2610016, 0, 0, 1, 1, 1,
-1.381947, 0.3258435, 0.1627709, 1, 0, 0, 1, 1,
-1.380216, 0.05928874, -2.179383, 1, 0, 0, 1, 1,
-1.373349, -1.08652, -2.36283, 1, 0, 0, 1, 1,
-1.372064, -0.5453008, -2.559184, 1, 0, 0, 1, 1,
-1.369184, -0.5619856, -2.695538, 1, 0, 0, 1, 1,
-1.366833, -0.661857, -2.009419, 0, 0, 0, 1, 1,
-1.365769, -1.660461, -1.377676, 0, 0, 0, 1, 1,
-1.350491, -0.6631857, -2.328522, 0, 0, 0, 1, 1,
-1.3438, -0.3129409, -1.816591, 0, 0, 0, 1, 1,
-1.335224, 0.2659288, 0.3341357, 0, 0, 0, 1, 1,
-1.331863, -0.2757447, -2.050868, 0, 0, 0, 1, 1,
-1.330968, 0.2495754, -1.460988, 0, 0, 0, 1, 1,
-1.315599, 2.148288, -1.031065, 1, 1, 1, 1, 1,
-1.305426, 1.624696, -0.4160261, 1, 1, 1, 1, 1,
-1.304758, -0.03900421, -2.903525, 1, 1, 1, 1, 1,
-1.274376, -0.5785348, -2.166513, 1, 1, 1, 1, 1,
-1.268302, 0.04701203, 0.006025535, 1, 1, 1, 1, 1,
-1.264796, -0.0312401, -1.447655, 1, 1, 1, 1, 1,
-1.257771, -0.2627466, -0.6558011, 1, 1, 1, 1, 1,
-1.254156, 1.235798, -0.4835097, 1, 1, 1, 1, 1,
-1.250908, 0.3772635, -1.26642, 1, 1, 1, 1, 1,
-1.245239, -1.245787, -1.962367, 1, 1, 1, 1, 1,
-1.23639, -0.497572, -2.900446, 1, 1, 1, 1, 1,
-1.235514, -1.973761, -3.548627, 1, 1, 1, 1, 1,
-1.228511, 0.5199558, -1.70102, 1, 1, 1, 1, 1,
-1.225965, -1.537038, -0.370089, 1, 1, 1, 1, 1,
-1.225101, -1.4493, -3.82318, 1, 1, 1, 1, 1,
-1.201939, -0.03632875, -1.070617, 0, 0, 1, 1, 1,
-1.200082, 1.44292, 0.5424162, 1, 0, 0, 1, 1,
-1.199142, -0.2504304, -2.228351, 1, 0, 0, 1, 1,
-1.198297, -0.04240474, -1.011238, 1, 0, 0, 1, 1,
-1.19513, -0.6545205, -2.332084, 1, 0, 0, 1, 1,
-1.188108, -0.9778215, -1.745872, 1, 0, 0, 1, 1,
-1.187216, -0.1549686, -0.6718803, 0, 0, 0, 1, 1,
-1.182599, 2.485442, -0.7334971, 0, 0, 0, 1, 1,
-1.179203, 0.8416806, -0.7837243, 0, 0, 0, 1, 1,
-1.177037, -0.7903324, -2.065701, 0, 0, 0, 1, 1,
-1.172958, -0.4751294, -4.019316, 0, 0, 0, 1, 1,
-1.166258, 0.185557, -1.394052, 0, 0, 0, 1, 1,
-1.16285, -2.093434, -4.745855, 0, 0, 0, 1, 1,
-1.146098, 1.8514, -0.6409115, 1, 1, 1, 1, 1,
-1.145129, 1.014115, -1.310946, 1, 1, 1, 1, 1,
-1.142148, -0.6854581, -1.498479, 1, 1, 1, 1, 1,
-1.132706, 0.9697728, -2.940215, 1, 1, 1, 1, 1,
-1.131336, -1.217523, -2.64946, 1, 1, 1, 1, 1,
-1.126763, -1.958588, -2.412462, 1, 1, 1, 1, 1,
-1.122175, -0.04217461, -0.8323873, 1, 1, 1, 1, 1,
-1.121604, 0.393821, 0.4794157, 1, 1, 1, 1, 1,
-1.119163, -0.4961666, -2.433033, 1, 1, 1, 1, 1,
-1.105853, 1.405903, -0.2635302, 1, 1, 1, 1, 1,
-1.103273, -0.2001598, -2.140145, 1, 1, 1, 1, 1,
-1.094565, -0.08522303, -2.220214, 1, 1, 1, 1, 1,
-1.089882, 0.9167419, 0.3146352, 1, 1, 1, 1, 1,
-1.084792, 0.5855951, -1.337418, 1, 1, 1, 1, 1,
-1.082938, -0.4038617, -5.541251, 1, 1, 1, 1, 1,
-1.081442, -0.9171723, -2.006839, 0, 0, 1, 1, 1,
-1.075667, 1.963242, -0.2125171, 1, 0, 0, 1, 1,
-1.075468, -0.6709785, -2.403283, 1, 0, 0, 1, 1,
-1.063468, -0.4242879, -2.326902, 1, 0, 0, 1, 1,
-1.052219, 0.7951058, -1.466135, 1, 0, 0, 1, 1,
-1.049334, 0.6190001, -1.382338, 1, 0, 0, 1, 1,
-1.037193, 0.1065955, -2.25642, 0, 0, 0, 1, 1,
-1.030165, -0.1717187, -1.142347, 0, 0, 0, 1, 1,
-1.029897, -2.201329, -3.159338, 0, 0, 0, 1, 1,
-1.023801, 1.306194, -0.2415461, 0, 0, 0, 1, 1,
-1.022097, 0.9774029, 0.02553525, 0, 0, 0, 1, 1,
-1.015748, -1.539337, -1.759318, 0, 0, 0, 1, 1,
-1.009776, 1.49414, -0.0282881, 0, 0, 0, 1, 1,
-1.003062, 0.243844, -2.074703, 1, 1, 1, 1, 1,
-1.002088, 0.3126348, -0.06106849, 1, 1, 1, 1, 1,
-1.000865, -0.9746009, -2.53783, 1, 1, 1, 1, 1,
-0.9981397, -0.3885534, -1.207089, 1, 1, 1, 1, 1,
-0.9981031, 0.2220133, -2.00966, 1, 1, 1, 1, 1,
-0.9969776, 0.8138556, -0.5895257, 1, 1, 1, 1, 1,
-0.9893471, 0.5744287, -0.9814489, 1, 1, 1, 1, 1,
-0.9887542, 1.846136, 0.3567373, 1, 1, 1, 1, 1,
-0.9850425, -0.1439907, -1.404995, 1, 1, 1, 1, 1,
-0.9815759, 2.34495, -0.3454087, 1, 1, 1, 1, 1,
-0.9776019, -0.9893903, -1.28707, 1, 1, 1, 1, 1,
-0.9740394, -1.10652, -1.655608, 1, 1, 1, 1, 1,
-0.968556, -0.3104996, -2.180759, 1, 1, 1, 1, 1,
-0.9678555, -0.8253961, -1.746585, 1, 1, 1, 1, 1,
-0.9660392, -0.8013583, -1.794538, 1, 1, 1, 1, 1,
-0.954726, -0.2442975, -1.87867, 0, 0, 1, 1, 1,
-0.9507142, 2.018831, -1.506061, 1, 0, 0, 1, 1,
-0.9488714, -0.0633893, -1.16328, 1, 0, 0, 1, 1,
-0.9426827, -0.478303, -1.672956, 1, 0, 0, 1, 1,
-0.9426235, 0.07120184, -1.479129, 1, 0, 0, 1, 1,
-0.9424177, -1.532387, -3.787122, 1, 0, 0, 1, 1,
-0.9412198, -0.6512175, -2.904093, 0, 0, 0, 1, 1,
-0.9360669, 0.7486086, -0.8555815, 0, 0, 0, 1, 1,
-0.9354929, -1.221966, -3.746235, 0, 0, 0, 1, 1,
-0.9334354, 0.01706819, -1.537923, 0, 0, 0, 1, 1,
-0.9322758, -0.6304919, -2.849088, 0, 0, 0, 1, 1,
-0.9291713, -0.650856, -2.425898, 0, 0, 0, 1, 1,
-0.927399, 0.6617563, 0.9438279, 0, 0, 0, 1, 1,
-0.925261, 0.1728896, -0.9504334, 1, 1, 1, 1, 1,
-0.9236477, -0.6341906, -1.829331, 1, 1, 1, 1, 1,
-0.9222425, 0.5641705, -1.771683, 1, 1, 1, 1, 1,
-0.9219659, -0.5956234, -2.63269, 1, 1, 1, 1, 1,
-0.9168307, -0.2397539, -1.794034, 1, 1, 1, 1, 1,
-0.916471, -0.01610606, -1.379624, 1, 1, 1, 1, 1,
-0.9146241, -0.6585696, -3.840326, 1, 1, 1, 1, 1,
-0.9087267, -0.9328461, -1.119664, 1, 1, 1, 1, 1,
-0.9087125, 0.05296505, -2.280892, 1, 1, 1, 1, 1,
-0.9009457, 1.235991, -0.6956789, 1, 1, 1, 1, 1,
-0.8964379, 0.4779324, -1.900013, 1, 1, 1, 1, 1,
-0.8953709, 0.1349889, -1.804963, 1, 1, 1, 1, 1,
-0.8930387, -0.02167851, -0.2439666, 1, 1, 1, 1, 1,
-0.8876641, -0.6908344, -2.590083, 1, 1, 1, 1, 1,
-0.8767965, -1.484063, -3.884079, 1, 1, 1, 1, 1,
-0.8716506, -0.4137768, -1.316825, 0, 0, 1, 1, 1,
-0.8708758, 0.8412222, 0.4306571, 1, 0, 0, 1, 1,
-0.8654677, 0.01557071, -1.246552, 1, 0, 0, 1, 1,
-0.863064, -0.204596, -2.581913, 1, 0, 0, 1, 1,
-0.8620338, 0.1881114, -1.251206, 1, 0, 0, 1, 1,
-0.8593976, -1.007964, -2.595445, 1, 0, 0, 1, 1,
-0.8375427, -1.099574, -2.74569, 0, 0, 0, 1, 1,
-0.8227242, -1.301298, -3.387307, 0, 0, 0, 1, 1,
-0.8223379, 0.5590025, -0.2830986, 0, 0, 0, 1, 1,
-0.8209568, -0.3497817, 0.2168113, 0, 0, 0, 1, 1,
-0.8207257, 0.1332461, -0.2815322, 0, 0, 0, 1, 1,
-0.8187762, -0.5855853, -2.40706, 0, 0, 0, 1, 1,
-0.8162088, 0.2479582, -0.1927251, 0, 0, 0, 1, 1,
-0.8133227, 0.6753191, 0.01294882, 1, 1, 1, 1, 1,
-0.8092288, -0.7522714, -1.929117, 1, 1, 1, 1, 1,
-0.808811, -2.136274, -0.7716413, 1, 1, 1, 1, 1,
-0.8054689, -0.7860841, -0.3994914, 1, 1, 1, 1, 1,
-0.8027229, -0.6899216, -2.042298, 1, 1, 1, 1, 1,
-0.8018835, -0.1282915, -0.02256386, 1, 1, 1, 1, 1,
-0.7986255, 0.6554738, -1.436847, 1, 1, 1, 1, 1,
-0.7951167, -0.553579, -1.831686, 1, 1, 1, 1, 1,
-0.7893537, 0.4223385, 1.256387, 1, 1, 1, 1, 1,
-0.7893018, 0.1817506, -0.002416605, 1, 1, 1, 1, 1,
-0.7875689, 1.003704, -0.2884275, 1, 1, 1, 1, 1,
-0.7773958, 0.1488353, -3.59878, 1, 1, 1, 1, 1,
-0.7773289, 0.08909547, -0.1515759, 1, 1, 1, 1, 1,
-0.7710267, 0.3672111, -0.4612509, 1, 1, 1, 1, 1,
-0.7672893, -1.277749, -3.178531, 1, 1, 1, 1, 1,
-0.7643569, -0.4682578, -4.148932, 0, 0, 1, 1, 1,
-0.7637337, 0.236726, -1.087918, 1, 0, 0, 1, 1,
-0.7607818, 0.5607501, -0.964063, 1, 0, 0, 1, 1,
-0.754553, -0.7611799, -2.807231, 1, 0, 0, 1, 1,
-0.7498602, 0.9363175, -0.2226086, 1, 0, 0, 1, 1,
-0.7480627, 0.1217039, -0.9674772, 1, 0, 0, 1, 1,
-0.7373928, -1.565765, -2.815238, 0, 0, 0, 1, 1,
-0.7328905, -0.3464261, -1.268848, 0, 0, 0, 1, 1,
-0.7324343, -0.3790547, -3.279227, 0, 0, 0, 1, 1,
-0.7301709, -0.1855033, -1.485656, 0, 0, 0, 1, 1,
-0.7234976, -1.475131, -2.676624, 0, 0, 0, 1, 1,
-0.7219735, 0.5775705, -1.79297, 0, 0, 0, 1, 1,
-0.7205497, -0.3100711, -1.164762, 0, 0, 0, 1, 1,
-0.7151831, 0.1849229, -1.862307, 1, 1, 1, 1, 1,
-0.7108643, 1.251179, -0.6847607, 1, 1, 1, 1, 1,
-0.706966, -0.6138899, -3.957053, 1, 1, 1, 1, 1,
-0.7069489, -1.122531, -1.158277, 1, 1, 1, 1, 1,
-0.7044597, 0.557493, -0.9560123, 1, 1, 1, 1, 1,
-0.7024559, 1.384428, -0.7268956, 1, 1, 1, 1, 1,
-0.7019044, 1.310563, -1.416119, 1, 1, 1, 1, 1,
-0.7018633, -1.495538, -1.934225, 1, 1, 1, 1, 1,
-0.6993349, 0.3332987, -0.7366747, 1, 1, 1, 1, 1,
-0.6955181, 0.6756632, -1.257289, 1, 1, 1, 1, 1,
-0.6907892, 1.190048, -0.8798431, 1, 1, 1, 1, 1,
-0.6884488, -0.08495595, -1.251465, 1, 1, 1, 1, 1,
-0.6854337, -0.4591535, -2.497749, 1, 1, 1, 1, 1,
-0.6849569, -1.563517, -2.266075, 1, 1, 1, 1, 1,
-0.6839396, 1.287747, -0.6307064, 1, 1, 1, 1, 1,
-0.683341, 0.491028, -0.9689466, 0, 0, 1, 1, 1,
-0.6786019, 1.269197, -0.9156864, 1, 0, 0, 1, 1,
-0.6764535, 0.3040651, 0.6087956, 1, 0, 0, 1, 1,
-0.6668832, -0.4016648, -2.849411, 1, 0, 0, 1, 1,
-0.6655247, -0.7526581, -2.576238, 1, 0, 0, 1, 1,
-0.6646619, -0.5411909, -2.667526, 1, 0, 0, 1, 1,
-0.6592236, -0.363805, -2.505462, 0, 0, 0, 1, 1,
-0.6556327, -0.1988626, -0.7333451, 0, 0, 0, 1, 1,
-0.6546713, -0.2043982, -0.8004562, 0, 0, 0, 1, 1,
-0.6483808, -0.2568772, -0.9205093, 0, 0, 0, 1, 1,
-0.6479333, -0.2164712, -0.1553101, 0, 0, 0, 1, 1,
-0.6476962, -0.1246842, -2.504259, 0, 0, 0, 1, 1,
-0.640235, -0.6739528, -3.31313, 0, 0, 0, 1, 1,
-0.6390098, -2.054735, -1.05539, 1, 1, 1, 1, 1,
-0.6347898, 0.464098, -0.8801603, 1, 1, 1, 1, 1,
-0.6270046, -0.04657956, -0.09134686, 1, 1, 1, 1, 1,
-0.6216639, -0.02591123, -1.142311, 1, 1, 1, 1, 1,
-0.6205919, -0.9163768, -3.375578, 1, 1, 1, 1, 1,
-0.6202428, 1.034752, -0.1818682, 1, 1, 1, 1, 1,
-0.6188093, -0.5109112, -1.221514, 1, 1, 1, 1, 1,
-0.6160203, 0.8551251, -0.5319971, 1, 1, 1, 1, 1,
-0.6130573, 0.3859502, -0.5375613, 1, 1, 1, 1, 1,
-0.6127815, 0.7656986, 0.3964857, 1, 1, 1, 1, 1,
-0.6070648, -0.4030496, -2.387385, 1, 1, 1, 1, 1,
-0.6068881, 0.06916539, -1.435331, 1, 1, 1, 1, 1,
-0.6053699, 1.279625, 1.484049, 1, 1, 1, 1, 1,
-0.6033047, 0.7764481, -1.586731, 1, 1, 1, 1, 1,
-0.6018718, -0.813485, -1.593716, 1, 1, 1, 1, 1,
-0.6016865, 0.8236471, -0.02537485, 0, 0, 1, 1, 1,
-0.6013786, -0.4439108, -3.563861, 1, 0, 0, 1, 1,
-0.5975393, -0.5500983, -1.77092, 1, 0, 0, 1, 1,
-0.5972586, -1.430063, -1.941285, 1, 0, 0, 1, 1,
-0.5894427, 1.02548, 0.8274325, 1, 0, 0, 1, 1,
-0.588066, -0.9716945, -1.863819, 1, 0, 0, 1, 1,
-0.5781666, 0.3614644, 0.916899, 0, 0, 0, 1, 1,
-0.5751104, -0.6210017, -0.37971, 0, 0, 0, 1, 1,
-0.5630236, -0.5885007, -1.524107, 0, 0, 0, 1, 1,
-0.5569728, 1.629028, 0.3576262, 0, 0, 0, 1, 1,
-0.5547015, -1.221456, -1.813868, 0, 0, 0, 1, 1,
-0.5507697, 1.845601, 0.4534259, 0, 0, 0, 1, 1,
-0.5496106, -0.9763454, -1.729885, 0, 0, 0, 1, 1,
-0.5451882, -1.846581, -2.184317, 1, 1, 1, 1, 1,
-0.5437701, 0.3484443, -0.1685815, 1, 1, 1, 1, 1,
-0.5377586, 0.1635597, 0.07544226, 1, 1, 1, 1, 1,
-0.5328231, 1.228077, -0.6437629, 1, 1, 1, 1, 1,
-0.5321648, 0.1392956, -0.7362812, 1, 1, 1, 1, 1,
-0.5310401, -1.176525, -2.026056, 1, 1, 1, 1, 1,
-0.5271431, 0.005419201, -0.7080883, 1, 1, 1, 1, 1,
-0.5177888, 1.02283, -0.7503636, 1, 1, 1, 1, 1,
-0.5160463, 0.4674883, -0.009666498, 1, 1, 1, 1, 1,
-0.5158623, 0.1221626, -0.1172567, 1, 1, 1, 1, 1,
-0.5151083, -1.083464, -3.889375, 1, 1, 1, 1, 1,
-0.5133851, 0.733385, -0.07554666, 1, 1, 1, 1, 1,
-0.5130951, -2.156274, -3.745932, 1, 1, 1, 1, 1,
-0.5117165, 0.9099527, -2.19026, 1, 1, 1, 1, 1,
-0.5099853, -1.89402, -2.319118, 1, 1, 1, 1, 1,
-0.5050206, -0.1220181, -2.517058, 0, 0, 1, 1, 1,
-0.5041341, 0.6278763, 0.3134349, 1, 0, 0, 1, 1,
-0.5038477, 0.6246669, -0.8345602, 1, 0, 0, 1, 1,
-0.4988791, -0.6733083, -2.375484, 1, 0, 0, 1, 1,
-0.4982686, -0.6020381, -1.72662, 1, 0, 0, 1, 1,
-0.4931835, -0.6678745, -2.566507, 1, 0, 0, 1, 1,
-0.4925084, 0.3062295, -0.5913597, 0, 0, 0, 1, 1,
-0.4917586, -1.152948, -3.530938, 0, 0, 0, 1, 1,
-0.4904702, -0.1465551, -0.8452982, 0, 0, 0, 1, 1,
-0.4878952, -0.6003853, -2.220721, 0, 0, 0, 1, 1,
-0.4877128, -2.659078, -3.209287, 0, 0, 0, 1, 1,
-0.4847182, -0.2699212, -0.8593094, 0, 0, 0, 1, 1,
-0.4808099, 0.6925525, -1.753602, 0, 0, 0, 1, 1,
-0.4764158, 0.2249873, -0.5409656, 1, 1, 1, 1, 1,
-0.4758334, 0.6593419, -1.119055, 1, 1, 1, 1, 1,
-0.468427, 0.5429963, 0.6290886, 1, 1, 1, 1, 1,
-0.4680797, 0.3799932, -1.311425, 1, 1, 1, 1, 1,
-0.4660706, 0.4723859, -3.043635, 1, 1, 1, 1, 1,
-0.4649383, 0.167233, -0.06359472, 1, 1, 1, 1, 1,
-0.4649342, 0.3565926, -3.391965, 1, 1, 1, 1, 1,
-0.4609956, 0.3883267, 0.01255295, 1, 1, 1, 1, 1,
-0.459914, 1.593494, -0.777945, 1, 1, 1, 1, 1,
-0.4588208, -0.2595308, -3.860882, 1, 1, 1, 1, 1,
-0.4526865, -0.8204542, -5.186814, 1, 1, 1, 1, 1,
-0.4495553, -1.250282, -2.867511, 1, 1, 1, 1, 1,
-0.4491695, -0.04856672, -0.4682538, 1, 1, 1, 1, 1,
-0.4464666, -0.2765445, -1.943002, 1, 1, 1, 1, 1,
-0.444004, 0.5036175, -1.002597, 1, 1, 1, 1, 1,
-0.4435214, -0.3674683, -1.395057, 0, 0, 1, 1, 1,
-0.441603, -0.7818898, -2.160741, 1, 0, 0, 1, 1,
-0.4381155, 1.940348, -0.7614599, 1, 0, 0, 1, 1,
-0.4375244, -0.4460942, -2.955141, 1, 0, 0, 1, 1,
-0.4369787, -1.410176, -4.089637, 1, 0, 0, 1, 1,
-0.4272442, -0.1323579, -2.008038, 1, 0, 0, 1, 1,
-0.4260533, -0.395141, -1.343479, 0, 0, 0, 1, 1,
-0.4212807, -1.726944, -1.863029, 0, 0, 0, 1, 1,
-0.4163507, 0.3811186, -0.3717961, 0, 0, 0, 1, 1,
-0.4140017, 0.713291, -0.5784802, 0, 0, 0, 1, 1,
-0.4121126, -0.412676, -2.914388, 0, 0, 0, 1, 1,
-0.4117763, -1.896972, -2.595343, 0, 0, 0, 1, 1,
-0.4058853, 0.7457885, -0.8582516, 0, 0, 0, 1, 1,
-0.405559, -1.147944, -3.551594, 1, 1, 1, 1, 1,
-0.4008102, -1.38718, -2.740154, 1, 1, 1, 1, 1,
-0.3989027, -1.305909, -2.81836, 1, 1, 1, 1, 1,
-0.3973428, 1.79625, -0.5145485, 1, 1, 1, 1, 1,
-0.3962036, 0.2557584, -0.7953615, 1, 1, 1, 1, 1,
-0.3941325, 0.3982347, 0.5685459, 1, 1, 1, 1, 1,
-0.39271, 1.139875, 1.601474, 1, 1, 1, 1, 1,
-0.3856602, 1.568677, -0.08609703, 1, 1, 1, 1, 1,
-0.3854132, 1.758233, -1.317291, 1, 1, 1, 1, 1,
-0.3821962, 2.524583, -0.1190998, 1, 1, 1, 1, 1,
-0.3791746, -0.08926053, -3.836022, 1, 1, 1, 1, 1,
-0.3762991, -1.199376, -3.329136, 1, 1, 1, 1, 1,
-0.367851, -0.07359091, -1.123328, 1, 1, 1, 1, 1,
-0.3665059, 0.1689517, -1.385583, 1, 1, 1, 1, 1,
-0.3645728, -0.03364467, -2.69789, 1, 1, 1, 1, 1,
-0.3629752, 0.494764, -0.589339, 0, 0, 1, 1, 1,
-0.3627735, 0.5835026, -2.410997, 1, 0, 0, 1, 1,
-0.3607747, 0.173541, -1.289044, 1, 0, 0, 1, 1,
-0.3599898, 0.9892306, -0.3384813, 1, 0, 0, 1, 1,
-0.3551539, 0.02519774, -1.506593, 1, 0, 0, 1, 1,
-0.354217, -0.71668, -1.826424, 1, 0, 0, 1, 1,
-0.3490116, -0.05846444, -2.255957, 0, 0, 0, 1, 1,
-0.3448222, -0.5481427, -2.147245, 0, 0, 0, 1, 1,
-0.3407814, -0.7884341, -3.175593, 0, 0, 0, 1, 1,
-0.3393917, -0.2200169, -0.5503811, 0, 0, 0, 1, 1,
-0.3378974, 2.380443, 1.286777, 0, 0, 0, 1, 1,
-0.3377886, 1.255441, -0.7335128, 0, 0, 0, 1, 1,
-0.3349367, -0.03617355, -2.640453, 0, 0, 0, 1, 1,
-0.3344172, -0.1779941, -2.028124, 1, 1, 1, 1, 1,
-0.3331964, 0.1075412, -2.479703, 1, 1, 1, 1, 1,
-0.3320124, 1.351374, -0.2019218, 1, 1, 1, 1, 1,
-0.3305199, -1.001923, -1.76673, 1, 1, 1, 1, 1,
-0.3297029, -0.2522603, -1.835404, 1, 1, 1, 1, 1,
-0.3232106, 0.7378866, -0.6713442, 1, 1, 1, 1, 1,
-0.3215426, 0.8579112, -1.931791, 1, 1, 1, 1, 1,
-0.3197788, 1.589612, -0.3329333, 1, 1, 1, 1, 1,
-0.3194216, 0.2099522, -0.4940396, 1, 1, 1, 1, 1,
-0.3161471, 0.04916881, -1.503679, 1, 1, 1, 1, 1,
-0.3145012, 0.6906109, -2.279538, 1, 1, 1, 1, 1,
-0.3131371, 0.2156517, -0.8250363, 1, 1, 1, 1, 1,
-0.312013, 1.708031, -0.9307302, 1, 1, 1, 1, 1,
-0.301024, 0.07446455, -0.4953523, 1, 1, 1, 1, 1,
-0.2971639, -0.5848552, -1.560889, 1, 1, 1, 1, 1,
-0.2967219, -0.5091424, -1.286988, 0, 0, 1, 1, 1,
-0.2964306, 0.6093015, -0.8820321, 1, 0, 0, 1, 1,
-0.2962841, 1.348588, -2.250078, 1, 0, 0, 1, 1,
-0.2926684, 0.7923554, 0.5636579, 1, 0, 0, 1, 1,
-0.2909723, -0.872385, -3.043787, 1, 0, 0, 1, 1,
-0.2892546, -0.4552703, -3.333203, 1, 0, 0, 1, 1,
-0.2867252, 0.8502123, -0.05753244, 0, 0, 0, 1, 1,
-0.2860582, -0.6236306, -1.191602, 0, 0, 0, 1, 1,
-0.2852212, -0.3646657, -2.597661, 0, 0, 0, 1, 1,
-0.2845741, 0.5505741, 0.4387612, 0, 0, 0, 1, 1,
-0.2722473, -1.249605, -2.0853, 0, 0, 0, 1, 1,
-0.2712105, -1.294131, -3.449909, 0, 0, 0, 1, 1,
-0.2688036, 0.3857908, -0.4172335, 0, 0, 0, 1, 1,
-0.2660814, -0.6303037, -2.337443, 1, 1, 1, 1, 1,
-0.2643138, 0.007376275, -1.192735, 1, 1, 1, 1, 1,
-0.2599929, -1.348061, -2.911817, 1, 1, 1, 1, 1,
-0.2593732, 2.065576, -0.5133892, 1, 1, 1, 1, 1,
-0.25923, 0.3239441, 0.03801655, 1, 1, 1, 1, 1,
-0.2585612, 0.5587173, -1.208699, 1, 1, 1, 1, 1,
-0.2583039, -0.7445874, -3.774318, 1, 1, 1, 1, 1,
-0.2554958, -0.4232382, -2.118012, 1, 1, 1, 1, 1,
-0.2551905, -0.07078403, -3.118077, 1, 1, 1, 1, 1,
-0.2490018, -1.461774, -2.731637, 1, 1, 1, 1, 1,
-0.236914, -0.07948065, -1.152153, 1, 1, 1, 1, 1,
-0.2366504, -0.6763565, -2.433124, 1, 1, 1, 1, 1,
-0.2355854, -0.572635, -3.069323, 1, 1, 1, 1, 1,
-0.2324717, -0.9763483, -0.6923495, 1, 1, 1, 1, 1,
-0.2323657, 1.32913, -1.969568, 1, 1, 1, 1, 1,
-0.2283707, 0.6567279, -0.6649222, 0, 0, 1, 1, 1,
-0.2281952, 1.407166, 0.4553235, 1, 0, 0, 1, 1,
-0.224134, -0.6961232, -2.982351, 1, 0, 0, 1, 1,
-0.22375, 0.4770762, -0.678839, 1, 0, 0, 1, 1,
-0.2220326, -0.6639359, -5.855975, 1, 0, 0, 1, 1,
-0.2212263, 0.342715, -0.6995483, 1, 0, 0, 1, 1,
-0.2163645, 1.841598, -0.4094771, 0, 0, 0, 1, 1,
-0.2134259, -0.6619194, -3.012743, 0, 0, 0, 1, 1,
-0.2111797, -1.472103, -2.699142, 0, 0, 0, 1, 1,
-0.2009436, 0.2314616, -1.960116, 0, 0, 0, 1, 1,
-0.2001793, 0.5192372, -0.7714182, 0, 0, 0, 1, 1,
-0.1969193, 1.163764, 1.400963, 0, 0, 0, 1, 1,
-0.1899009, 1.334564, -0.2295644, 0, 0, 0, 1, 1,
-0.1871455, 0.6924672, 0.3523509, 1, 1, 1, 1, 1,
-0.1820475, 0.4502155, -1.846023, 1, 1, 1, 1, 1,
-0.1810832, -1.714971, -3.276531, 1, 1, 1, 1, 1,
-0.1786554, -1.114679, -2.524215, 1, 1, 1, 1, 1,
-0.1749319, -0.2106215, -3.207709, 1, 1, 1, 1, 1,
-0.16894, 1.332739, 1.69112, 1, 1, 1, 1, 1,
-0.1686723, -0.2366115, -2.077886, 1, 1, 1, 1, 1,
-0.1685334, 1.392123, -1.573605, 1, 1, 1, 1, 1,
-0.1667501, -1.524871, -3.872401, 1, 1, 1, 1, 1,
-0.164277, -0.2965169, -0.6357365, 1, 1, 1, 1, 1,
-0.1609027, -0.6800987, -2.474573, 1, 1, 1, 1, 1,
-0.1562798, 1.713384, -0.2787272, 1, 1, 1, 1, 1,
-0.1554503, -0.2802259, -1.68092, 1, 1, 1, 1, 1,
-0.1447519, -0.9275803, -3.678835, 1, 1, 1, 1, 1,
-0.1371957, -0.2257563, -3.212507, 1, 1, 1, 1, 1,
-0.1367528, -0.6392437, -5.10535, 0, 0, 1, 1, 1,
-0.1345606, 0.2271798, -1.43653, 1, 0, 0, 1, 1,
-0.131335, 1.213962, 0.8639493, 1, 0, 0, 1, 1,
-0.1306904, 1.709482, -0.901294, 1, 0, 0, 1, 1,
-0.1300847, -0.4820193, -1.601212, 1, 0, 0, 1, 1,
-0.1229355, 0.7150634, 0.9490068, 1, 0, 0, 1, 1,
-0.1200244, 1.30571, -0.8720428, 0, 0, 0, 1, 1,
-0.1151427, 0.3769408, -1.147371, 0, 0, 0, 1, 1,
-0.1142353, 0.4569102, 0.2659093, 0, 0, 0, 1, 1,
-0.1134107, 0.1737504, 0.2056909, 0, 0, 0, 1, 1,
-0.1083586, 0.5493539, 0.3287243, 0, 0, 0, 1, 1,
-0.1062662, 0.7311398, 0.866861, 0, 0, 0, 1, 1,
-0.1050843, 1.267137, 0.8922364, 0, 0, 0, 1, 1,
-0.1026077, -0.7634312, -1.60921, 1, 1, 1, 1, 1,
-0.1014112, 0.9290193, -0.04473021, 1, 1, 1, 1, 1,
-0.1000272, 0.9635274, 0.4867894, 1, 1, 1, 1, 1,
-0.09716789, -1.43742, -2.34022, 1, 1, 1, 1, 1,
-0.09681199, -2.4482, -2.157572, 1, 1, 1, 1, 1,
-0.09560014, 1.008665, -1.01204, 1, 1, 1, 1, 1,
-0.09084696, 0.1085499, -1.884756, 1, 1, 1, 1, 1,
-0.08923557, 1.328545, -2.667656, 1, 1, 1, 1, 1,
-0.08190579, 0.6678444, -0.6916093, 1, 1, 1, 1, 1,
-0.08177131, 1.525854, 0.1890536, 1, 1, 1, 1, 1,
-0.07931416, -0.6965221, -2.630449, 1, 1, 1, 1, 1,
-0.07695285, -2.140783, -3.170136, 1, 1, 1, 1, 1,
-0.07367059, -0.9786901, -2.366651, 1, 1, 1, 1, 1,
-0.07311761, 1.178781, -1.271817, 1, 1, 1, 1, 1,
-0.06815409, 0.488319, 1.829587, 1, 1, 1, 1, 1,
-0.06519769, 0.2870975, -1.144524, 0, 0, 1, 1, 1,
-0.06343204, 0.566026, 0.6000564, 1, 0, 0, 1, 1,
-0.05971911, 1.057599, 1.660512, 1, 0, 0, 1, 1,
-0.05555123, -0.7866147, -4.330394, 1, 0, 0, 1, 1,
-0.05339925, 0.7686428, -0.121567, 1, 0, 0, 1, 1,
-0.05075407, 0.8886003, -1.390114, 1, 0, 0, 1, 1,
-0.04821658, 0.2561896, 0.01403262, 0, 0, 0, 1, 1,
-0.04497017, -0.1159815, -2.045751, 0, 0, 0, 1, 1,
-0.03779817, -0.8261941, -3.535172, 0, 0, 0, 1, 1,
-0.0364485, -0.1398743, -2.585321, 0, 0, 0, 1, 1,
-0.03467768, -0.2692252, -2.188145, 0, 0, 0, 1, 1,
-0.0297456, -0.8538635, -2.388269, 0, 0, 0, 1, 1,
-0.02810222, 0.437451, 0.7879109, 0, 0, 0, 1, 1,
-0.0219847, -0.3189319, -4.425991, 1, 1, 1, 1, 1,
-0.02043206, -0.05658957, -2.47422, 1, 1, 1, 1, 1,
-0.01656573, -1.689339, -3.604134, 1, 1, 1, 1, 1,
-0.01290229, 0.6736351, 0.387969, 1, 1, 1, 1, 1,
-0.01092444, 0.02252058, -0.0164256, 1, 1, 1, 1, 1,
-0.009696439, 0.5822556, 0.5127537, 1, 1, 1, 1, 1,
-0.009059999, 0.1966423, -0.3881136, 1, 1, 1, 1, 1,
-0.005312571, -0.07801805, -2.043118, 1, 1, 1, 1, 1,
-0.002487695, 0.4412855, 1.177925, 1, 1, 1, 1, 1,
-0.002290023, 0.9161918, 0.3078908, 1, 1, 1, 1, 1,
-0.001851691, 0.8491451, -1.4893, 1, 1, 1, 1, 1,
-0.001026807, 0.8648899, 0.4163649, 1, 1, 1, 1, 1,
0.006304595, 0.4288073, -0.07976284, 1, 1, 1, 1, 1,
0.0072632, -0.4877151, 3.064568, 1, 1, 1, 1, 1,
0.01415546, -1.462875, 3.082808, 1, 1, 1, 1, 1,
0.01820503, 1.248161, -0.04099942, 0, 0, 1, 1, 1,
0.02537452, 0.4329337, 1.107316, 1, 0, 0, 1, 1,
0.03349291, 0.2852123, 1.061493, 1, 0, 0, 1, 1,
0.03491527, -0.4718318, 3.246506, 1, 0, 0, 1, 1,
0.03636155, 1.259121, -1.316605, 1, 0, 0, 1, 1,
0.0369072, -0.7871386, 2.614647, 1, 0, 0, 1, 1,
0.03816316, 0.05262088, 2.594091, 0, 0, 0, 1, 1,
0.03888224, -0.04280946, 2.45324, 0, 0, 0, 1, 1,
0.04007123, 0.1597051, -0.83152, 0, 0, 0, 1, 1,
0.04418453, 0.7866446, 1.883602, 0, 0, 0, 1, 1,
0.04425058, -0.6598678, 3.279463, 0, 0, 0, 1, 1,
0.05228502, -0.4936647, 2.218054, 0, 0, 0, 1, 1,
0.05240266, 0.2705981, -0.1376793, 0, 0, 0, 1, 1,
0.0538379, 1.575249, 0.5082036, 1, 1, 1, 1, 1,
0.05538627, -0.9726887, 1.686106, 1, 1, 1, 1, 1,
0.05846193, 0.8677825, 1.054187, 1, 1, 1, 1, 1,
0.05869554, -0.2340125, 1.196524, 1, 1, 1, 1, 1,
0.06105056, -1.608789, 3.512134, 1, 1, 1, 1, 1,
0.06210589, 1.08357, -0.7629704, 1, 1, 1, 1, 1,
0.0698867, 1.066884, -0.6266173, 1, 1, 1, 1, 1,
0.07625852, -1.324803, 3.845372, 1, 1, 1, 1, 1,
0.07845976, -0.6126688, 3.336692, 1, 1, 1, 1, 1,
0.08340921, 0.3700974, 0.3720001, 1, 1, 1, 1, 1,
0.08706353, -1.636493, 2.871024, 1, 1, 1, 1, 1,
0.0897901, 0.4039988, -0.3437265, 1, 1, 1, 1, 1,
0.08995416, -0.7299874, 4.165051, 1, 1, 1, 1, 1,
0.09388065, 0.7526937, -1.025313, 1, 1, 1, 1, 1,
0.09430543, 1.084402, 1.629265, 1, 1, 1, 1, 1,
0.09520619, 0.4850176, 2.040088, 0, 0, 1, 1, 1,
0.09964942, -0.9867331, 3.714759, 1, 0, 0, 1, 1,
0.09998751, -0.3299446, 4.023097, 1, 0, 0, 1, 1,
0.1013848, -0.1444222, 2.028989, 1, 0, 0, 1, 1,
0.1026209, -0.2749263, 4.188799, 1, 0, 0, 1, 1,
0.1067986, -0.2191146, 3.16655, 1, 0, 0, 1, 1,
0.1111509, 1.236139, -0.1752415, 0, 0, 0, 1, 1,
0.1120309, -1.150046, 0.1234581, 0, 0, 0, 1, 1,
0.1122103, -0.03640068, 1.28101, 0, 0, 0, 1, 1,
0.1130963, 0.9034771, 2.013684, 0, 0, 0, 1, 1,
0.1142912, 0.1559658, 0.4751627, 0, 0, 0, 1, 1,
0.1144371, -0.4826634, 2.669839, 0, 0, 0, 1, 1,
0.1182912, -0.5888281, 3.736074, 0, 0, 0, 1, 1,
0.1189545, 0.2003375, 1.93548, 1, 1, 1, 1, 1,
0.1224768, 0.6906634, 0.7662556, 1, 1, 1, 1, 1,
0.124475, -1.224894, 3.571966, 1, 1, 1, 1, 1,
0.1258648, -0.1473395, 4.414582, 1, 1, 1, 1, 1,
0.1263089, 1.229937, 1.366372, 1, 1, 1, 1, 1,
0.1272603, -0.5611138, 3.179205, 1, 1, 1, 1, 1,
0.1287973, 0.8062176, 0.381566, 1, 1, 1, 1, 1,
0.1305405, 0.4317614, 0.1865149, 1, 1, 1, 1, 1,
0.1319429, -0.7934721, 4.042016, 1, 1, 1, 1, 1,
0.1334081, 0.4382438, 0.262244, 1, 1, 1, 1, 1,
0.141301, -0.1479809, 3.336718, 1, 1, 1, 1, 1,
0.1417094, 0.1172334, -0.3461021, 1, 1, 1, 1, 1,
0.1449902, 0.3470491, -0.4200314, 1, 1, 1, 1, 1,
0.1461596, -1.865358, 3.322145, 1, 1, 1, 1, 1,
0.1471555, -0.4459461, 3.0502, 1, 1, 1, 1, 1,
0.1474898, 0.4726702, 0.8332056, 0, 0, 1, 1, 1,
0.1481207, 1.125138, 1.380298, 1, 0, 0, 1, 1,
0.1500182, 0.3638075, -0.1996071, 1, 0, 0, 1, 1,
0.1510587, -0.1840487, 1.562481, 1, 0, 0, 1, 1,
0.1544066, 0.0741631, 0.5921719, 1, 0, 0, 1, 1,
0.1564089, -1.112876, 3.98644, 1, 0, 0, 1, 1,
0.1564919, 0.4460022, 1.761488, 0, 0, 0, 1, 1,
0.1603869, 0.5165122, 0.9029798, 0, 0, 0, 1, 1,
0.1609977, -1.301238, 2.886147, 0, 0, 0, 1, 1,
0.1656307, -0.4454879, 2.196032, 0, 0, 0, 1, 1,
0.170418, -1.589836, 3.1968, 0, 0, 0, 1, 1,
0.1711643, 0.3982648, -1.546382, 0, 0, 0, 1, 1,
0.1748017, -0.5656589, 3.93087, 0, 0, 0, 1, 1,
0.1823249, -0.7607098, 4.314045, 1, 1, 1, 1, 1,
0.1834079, -0.842882, 4.312195, 1, 1, 1, 1, 1,
0.1858735, -0.369048, 1.326147, 1, 1, 1, 1, 1,
0.1880905, 0.8160588, -0.7000678, 1, 1, 1, 1, 1,
0.1887335, -1.169786, 1.209996, 1, 1, 1, 1, 1,
0.1928492, -0.5926796, 3.245671, 1, 1, 1, 1, 1,
0.196003, -0.4656765, 3.260779, 1, 1, 1, 1, 1,
0.1976583, -1.403976, 3.302758, 1, 1, 1, 1, 1,
0.1978015, 0.6083933, 1.187475, 1, 1, 1, 1, 1,
0.2097729, -1.061435, 4.359344, 1, 1, 1, 1, 1,
0.2121855, 0.5027874, -1.657294, 1, 1, 1, 1, 1,
0.2134249, -0.06208727, 1.577311, 1, 1, 1, 1, 1,
0.2156502, 1.615859, 0.9128137, 1, 1, 1, 1, 1,
0.21833, 2.073259, 2.478539, 1, 1, 1, 1, 1,
0.2192022, -0.4417629, 2.095406, 1, 1, 1, 1, 1,
0.2254455, -0.4724569, 2.46966, 0, 0, 1, 1, 1,
0.2255313, -1.218667, 1.922082, 1, 0, 0, 1, 1,
0.2278707, -0.3485633, 2.504285, 1, 0, 0, 1, 1,
0.2311249, -0.08135685, 0.9713309, 1, 0, 0, 1, 1,
0.2341982, 1.823784, -0.601739, 1, 0, 0, 1, 1,
0.2357993, -2.023551, 3.881574, 1, 0, 0, 1, 1,
0.2374941, 0.1740985, 2.819209, 0, 0, 0, 1, 1,
0.2383271, 0.5648772, 1.409533, 0, 0, 0, 1, 1,
0.2414115, -1.154029, 3.437382, 0, 0, 0, 1, 1,
0.2426077, 1.216263, 1.131079, 0, 0, 0, 1, 1,
0.2428148, 0.7603233, 2.26445, 0, 0, 0, 1, 1,
0.2492588, -0.3008777, 3.973459, 0, 0, 0, 1, 1,
0.2493318, 1.680887, 1.562964, 0, 0, 0, 1, 1,
0.2536036, 1.485988, 0.6603377, 1, 1, 1, 1, 1,
0.2593732, 1.756201, 0.1903263, 1, 1, 1, 1, 1,
0.2596033, -0.2782373, 0.8947316, 1, 1, 1, 1, 1,
0.2615763, 0.008484715, 2.036786, 1, 1, 1, 1, 1,
0.2627327, 0.8126284, -0.3668003, 1, 1, 1, 1, 1,
0.2630132, -1.453123, 2.410129, 1, 1, 1, 1, 1,
0.263272, 1.993997, -0.1651888, 1, 1, 1, 1, 1,
0.2633208, -0.5242959, 0.8080389, 1, 1, 1, 1, 1,
0.2645626, -1.127777, 2.581943, 1, 1, 1, 1, 1,
0.2684615, -0.4857737, 1.875877, 1, 1, 1, 1, 1,
0.271613, 0.7198759, 0.6224188, 1, 1, 1, 1, 1,
0.2748566, -1.260492, 2.578024, 1, 1, 1, 1, 1,
0.2817644, -0.8771713, 3.387899, 1, 1, 1, 1, 1,
0.2840359, -0.6403632, 1.930892, 1, 1, 1, 1, 1,
0.2854705, -1.008615, 0.7416672, 1, 1, 1, 1, 1,
0.2884699, -0.9013617, 3.08912, 0, 0, 1, 1, 1,
0.290145, -1.487234, 4.425566, 1, 0, 0, 1, 1,
0.2919925, -0.2438327, 2.763065, 1, 0, 0, 1, 1,
0.298748, 0.6993802, -0.001392198, 1, 0, 0, 1, 1,
0.3029348, -1.017991, 3.806394, 1, 0, 0, 1, 1,
0.3046904, 1.340311, -0.7148042, 1, 0, 0, 1, 1,
0.3048638, 0.7330883, -1.842881, 0, 0, 0, 1, 1,
0.3074148, 0.5495314, 0.3076257, 0, 0, 0, 1, 1,
0.3096329, 1.819955, -0.4215175, 0, 0, 0, 1, 1,
0.3111373, -0.0161614, 2.256804, 0, 0, 0, 1, 1,
0.3133875, -1.267907, 4.643142, 0, 0, 0, 1, 1,
0.3136332, -0.7732777, 3.335526, 0, 0, 0, 1, 1,
0.3163542, 1.092803, -0.5565812, 0, 0, 0, 1, 1,
0.3180867, -0.008229299, 1.514254, 1, 1, 1, 1, 1,
0.3257136, 1.732042, -0.6054389, 1, 1, 1, 1, 1,
0.3292444, -1.056762, 4.512073, 1, 1, 1, 1, 1,
0.33032, 0.2191009, 1.234948, 1, 1, 1, 1, 1,
0.3344706, 1.290889, 0.1762282, 1, 1, 1, 1, 1,
0.3362117, 0.9878931, 1.242088, 1, 1, 1, 1, 1,
0.3394273, -2.255943, 2.433248, 1, 1, 1, 1, 1,
0.3400921, 1.530702, 0.1523746, 1, 1, 1, 1, 1,
0.3578209, 1.56637, -1.398721, 1, 1, 1, 1, 1,
0.3676164, -0.6971157, -0.482516, 1, 1, 1, 1, 1,
0.3685831, -0.7953613, 2.160181, 1, 1, 1, 1, 1,
0.370171, -0.1119787, 1.917945, 1, 1, 1, 1, 1,
0.3726952, 0.3569348, -0.7917554, 1, 1, 1, 1, 1,
0.3743464, -0.3589335, 4.399722, 1, 1, 1, 1, 1,
0.3749451, -0.18745, 3.207371, 1, 1, 1, 1, 1,
0.3765593, -3.061294, 3.265114, 0, 0, 1, 1, 1,
0.3778365, 1.635493, -0.2135838, 1, 0, 0, 1, 1,
0.3795142, 0.6066629, 1.623199, 1, 0, 0, 1, 1,
0.3796185, -0.0595206, 0.6784003, 1, 0, 0, 1, 1,
0.3823051, 0.5757213, 0.6708438, 1, 0, 0, 1, 1,
0.3825921, 0.6378323, 0.04786357, 1, 0, 0, 1, 1,
0.3827136, -0.4597386, 1.62961, 0, 0, 0, 1, 1,
0.3828094, 0.3894862, 0.8872632, 0, 0, 0, 1, 1,
0.3835822, 1.496281, 1.383259, 0, 0, 0, 1, 1,
0.3870019, -1.129904, 2.145276, 0, 0, 0, 1, 1,
0.389493, 1.219, -1.979293, 0, 0, 0, 1, 1,
0.3926422, -1.556233, 1.925497, 0, 0, 0, 1, 1,
0.3950188, -1.891768, 1.352771, 0, 0, 0, 1, 1,
0.3970858, -0.1779983, 2.305201, 1, 1, 1, 1, 1,
0.3973156, -1.824936, 3.833139, 1, 1, 1, 1, 1,
0.3982679, -0.3865527, 0.6532453, 1, 1, 1, 1, 1,
0.4015796, -0.364572, 3.852245, 1, 1, 1, 1, 1,
0.4015838, -0.1329812, 3.327386, 1, 1, 1, 1, 1,
0.4032276, -1.509962, 3.911975, 1, 1, 1, 1, 1,
0.4036804, -0.09495493, 1.974517, 1, 1, 1, 1, 1,
0.4061708, -1.469585, 2.020972, 1, 1, 1, 1, 1,
0.4066749, -0.1679616, 2.878692, 1, 1, 1, 1, 1,
0.4081597, 0.3189801, 1.423058, 1, 1, 1, 1, 1,
0.4084757, 1.029925, -0.675489, 1, 1, 1, 1, 1,
0.4086184, -1.282595, 2.234117, 1, 1, 1, 1, 1,
0.4179665, 0.03632118, -0.09203254, 1, 1, 1, 1, 1,
0.418839, 1.483846, 0.9786914, 1, 1, 1, 1, 1,
0.4234338, -1.448457, 4.838789, 1, 1, 1, 1, 1,
0.4257749, -2.577085, 3.374022, 0, 0, 1, 1, 1,
0.4315206, -2.193393, 4.406705, 1, 0, 0, 1, 1,
0.4326923, 2.040893, 0.1624902, 1, 0, 0, 1, 1,
0.4371848, 1.00415, 1.342672, 1, 0, 0, 1, 1,
0.440356, 0.1504131, 0.8142347, 1, 0, 0, 1, 1,
0.443696, 0.2288969, 3.272528, 1, 0, 0, 1, 1,
0.4442838, 1.613523, -1.789217, 0, 0, 0, 1, 1,
0.4458213, -0.01403969, 1.515074, 0, 0, 0, 1, 1,
0.4474128, -0.6504999, 1.697148, 0, 0, 0, 1, 1,
0.4478509, 0.9743091, 0.718821, 0, 0, 0, 1, 1,
0.4522423, 0.3932021, 0.8088225, 0, 0, 0, 1, 1,
0.4553343, 1.630428, -0.5495867, 0, 0, 0, 1, 1,
0.4634072, 0.2267198, 0.4795383, 0, 0, 0, 1, 1,
0.4634879, -0.8056015, 4.600594, 1, 1, 1, 1, 1,
0.47155, 0.8786953, 2.270542, 1, 1, 1, 1, 1,
0.4717859, 0.4666518, -0.08856807, 1, 1, 1, 1, 1,
0.4772629, -2.111069, 2.529993, 1, 1, 1, 1, 1,
0.4784738, 0.90525, 1.149327, 1, 1, 1, 1, 1,
0.4886945, -0.1107187, 1.96052, 1, 1, 1, 1, 1,
0.4893526, -0.197789, 2.69432, 1, 1, 1, 1, 1,
0.4914171, -0.932707, 0.9687599, 1, 1, 1, 1, 1,
0.4929217, -0.7405258, 1.913204, 1, 1, 1, 1, 1,
0.496026, -0.1200619, 3.094505, 1, 1, 1, 1, 1,
0.4977838, -0.4211503, 1.469847, 1, 1, 1, 1, 1,
0.5011265, 0.5284542, 2.019999, 1, 1, 1, 1, 1,
0.5024891, 0.2211319, 2.974626, 1, 1, 1, 1, 1,
0.5044138, 0.7813638, 1.169796, 1, 1, 1, 1, 1,
0.5065159, 1.53758, -0.6883156, 1, 1, 1, 1, 1,
0.5072305, 0.3344986, 2.382154, 0, 0, 1, 1, 1,
0.5074358, -0.7086319, 3.126183, 1, 0, 0, 1, 1,
0.5077558, 0.00870535, 3.083601, 1, 0, 0, 1, 1,
0.5132227, 0.3122712, -0.768943, 1, 0, 0, 1, 1,
0.5158111, 0.01518081, 0.2216751, 1, 0, 0, 1, 1,
0.5203164, -2.28706, 3.791073, 1, 0, 0, 1, 1,
0.5209364, 0.1430657, -0.06724861, 0, 0, 0, 1, 1,
0.5223532, -0.8471337, 1.848181, 0, 0, 0, 1, 1,
0.5290114, -1.270384, 1.64089, 0, 0, 0, 1, 1,
0.5299236, -1.385898, 2.315063, 0, 0, 0, 1, 1,
0.5309765, -1.148181, 2.847959, 0, 0, 0, 1, 1,
0.5404825, 1.054058, -0.09098769, 0, 0, 0, 1, 1,
0.5410562, -1.406585, 4.294484, 0, 0, 0, 1, 1,
0.5474179, 1.557268, 0.5997567, 1, 1, 1, 1, 1,
0.5506225, -0.004759367, 2.215619, 1, 1, 1, 1, 1,
0.5513861, 0.3274702, 0.5722206, 1, 1, 1, 1, 1,
0.5523638, 0.3206777, 3.226079, 1, 1, 1, 1, 1,
0.5601506, -1.823254, 2.638469, 1, 1, 1, 1, 1,
0.5613595, 0.4221323, -0.2441869, 1, 1, 1, 1, 1,
0.5616095, -0.9957429, 1.001678, 1, 1, 1, 1, 1,
0.5653061, 0.2920295, 0.649209, 1, 1, 1, 1, 1,
0.5679937, -0.3830438, 2.669975, 1, 1, 1, 1, 1,
0.5700208, -1.262203, 2.496227, 1, 1, 1, 1, 1,
0.5910372, -1.429138, 1.779796, 1, 1, 1, 1, 1,
0.5928007, -1.471575, 3.355012, 1, 1, 1, 1, 1,
0.5930487, 2.030049, 0.9337008, 1, 1, 1, 1, 1,
0.5953964, -1.186128, 3.128041, 1, 1, 1, 1, 1,
0.5964068, -0.4755175, 2.928941, 1, 1, 1, 1, 1,
0.5990882, 0.05611313, 1.537372, 0, 0, 1, 1, 1,
0.6010457, -0.7630926, 2.888395, 1, 0, 0, 1, 1,
0.6015626, 0.8309386, 1.205982, 1, 0, 0, 1, 1,
0.603985, -0.3903176, 1.707294, 1, 0, 0, 1, 1,
0.6067744, 2.76602, 0.5201355, 1, 0, 0, 1, 1,
0.6098251, -0.6651305, 0.8890446, 1, 0, 0, 1, 1,
0.6104906, -0.2732869, 1.739444, 0, 0, 0, 1, 1,
0.6111962, -0.7729462, 3.143598, 0, 0, 0, 1, 1,
0.6161003, 0.6334069, 1.420466, 0, 0, 0, 1, 1,
0.6161706, 0.04214853, 2.344991, 0, 0, 0, 1, 1,
0.6199357, -0.5268538, 2.42287, 0, 0, 0, 1, 1,
0.6219493, -0.952454, 2.803021, 0, 0, 0, 1, 1,
0.6237715, -0.4663835, 3.538173, 0, 0, 0, 1, 1,
0.6267398, -1.165808, 1.804367, 1, 1, 1, 1, 1,
0.6325022, -1.46918, 2.012677, 1, 1, 1, 1, 1,
0.6368875, 0.1340204, 0.9294313, 1, 1, 1, 1, 1,
0.6370802, -0.2401306, 1.57666, 1, 1, 1, 1, 1,
0.637866, -0.6455459, 2.537735, 1, 1, 1, 1, 1,
0.6389115, -0.3753558, 3.676129, 1, 1, 1, 1, 1,
0.6389816, 1.196868, -0.2144118, 1, 1, 1, 1, 1,
0.6407332, 0.8458272, 1.699988, 1, 1, 1, 1, 1,
0.6409562, 1.910248, 0.3245783, 1, 1, 1, 1, 1,
0.6500701, 1.367943, 0.8907413, 1, 1, 1, 1, 1,
0.6536182, -0.5455995, 1.529165, 1, 1, 1, 1, 1,
0.661995, 0.8270092, 0.5442541, 1, 1, 1, 1, 1,
0.6634821, -0.03046747, 3.383539, 1, 1, 1, 1, 1,
0.6701968, -0.2276232, 3.182357, 1, 1, 1, 1, 1,
0.6720029, -0.2441661, 0.4515083, 1, 1, 1, 1, 1,
0.677152, -0.4203043, 1.214159, 0, 0, 1, 1, 1,
0.6775719, -0.69631, 3.04885, 1, 0, 0, 1, 1,
0.6778693, -0.7844523, 2.813338, 1, 0, 0, 1, 1,
0.6821257, 0.1444418, 1.864213, 1, 0, 0, 1, 1,
0.687149, 0.1422076, 2.14361, 1, 0, 0, 1, 1,
0.6894624, -0.3514513, 2.502133, 1, 0, 0, 1, 1,
0.6976354, -1.024218, 2.503603, 0, 0, 0, 1, 1,
0.7009278, 0.1429748, 0.07327349, 0, 0, 0, 1, 1,
0.7053288, 1.429902, 4.187284, 0, 0, 0, 1, 1,
0.7073016, -0.3277181, 1.887924, 0, 0, 0, 1, 1,
0.7182314, -1.287258, 2.923435, 0, 0, 0, 1, 1,
0.7236528, -0.186728, 1.303481, 0, 0, 0, 1, 1,
0.7326056, -0.7906379, 0.5939527, 0, 0, 0, 1, 1,
0.7348765, 0.8383243, 1.590956, 1, 1, 1, 1, 1,
0.7522115, -0.3366485, 1.122517, 1, 1, 1, 1, 1,
0.7545295, 0.8111058, 1.928839, 1, 1, 1, 1, 1,
0.7549776, 0.6377873, -1.339984, 1, 1, 1, 1, 1,
0.7565597, -0.2899863, 1.385689, 1, 1, 1, 1, 1,
0.7586589, -1.642113, 4.079438, 1, 1, 1, 1, 1,
0.7612695, -0.4440148, 1.533546, 1, 1, 1, 1, 1,
0.7621742, 1.260129, 0.5341628, 1, 1, 1, 1, 1,
0.7682378, 0.2239901, 1.516194, 1, 1, 1, 1, 1,
0.7732589, -0.08469275, 0.9386862, 1, 1, 1, 1, 1,
0.7741812, 0.4605155, -0.04391208, 1, 1, 1, 1, 1,
0.7757787, 0.09457543, 1.394988, 1, 1, 1, 1, 1,
0.7815762, -0.1672787, 2.732898, 1, 1, 1, 1, 1,
0.7823496, 1.781608, 1.799363, 1, 1, 1, 1, 1,
0.7824678, -0.8104873, 2.465409, 1, 1, 1, 1, 1,
0.7837114, -0.171283, 0.7907761, 0, 0, 1, 1, 1,
0.7838008, 1.295976, 2.569208, 1, 0, 0, 1, 1,
0.785056, 0.9420707, 0.3394842, 1, 0, 0, 1, 1,
0.7890806, 1.300935, 0.05475157, 1, 0, 0, 1, 1,
0.7939266, -0.5031057, 2.423878, 1, 0, 0, 1, 1,
0.8035828, -0.6807793, 3.622603, 1, 0, 0, 1, 1,
0.8096549, 0.7779602, 0.688093, 0, 0, 0, 1, 1,
0.8101993, -1.281831, 1.354253, 0, 0, 0, 1, 1,
0.8113053, -0.5601835, 1.393184, 0, 0, 0, 1, 1,
0.8122563, 0.4067657, 1.53311, 0, 0, 0, 1, 1,
0.8247901, -0.2033209, 1.37666, 0, 0, 0, 1, 1,
0.8315089, 1.387795, 0.7134957, 0, 0, 0, 1, 1,
0.8316455, 0.5243144, 1.99961, 0, 0, 0, 1, 1,
0.8319318, -0.7927591, 1.470788, 1, 1, 1, 1, 1,
0.8346265, -0.9296235, 4.177865, 1, 1, 1, 1, 1,
0.8352032, -1.280406, 3.059175, 1, 1, 1, 1, 1,
0.8361115, 0.1127571, 3.809423, 1, 1, 1, 1, 1,
0.8384389, -2.376374, 3.437564, 1, 1, 1, 1, 1,
0.846684, 1.879858, 0.8840623, 1, 1, 1, 1, 1,
0.8469592, 0.516111, 0.917964, 1, 1, 1, 1, 1,
0.8498738, 1.121688, 1.299472, 1, 1, 1, 1, 1,
0.8526492, 0.6537299, 1.074221, 1, 1, 1, 1, 1,
0.8534734, -0.4873189, 2.057474, 1, 1, 1, 1, 1,
0.8547465, -0.4461506, 1.814287, 1, 1, 1, 1, 1,
0.855372, 0.2875821, 0.5319591, 1, 1, 1, 1, 1,
0.8553844, -1.482019, 1.198032, 1, 1, 1, 1, 1,
0.8564878, 1.448196, -0.01021666, 1, 1, 1, 1, 1,
0.8567429, -0.7502882, 2.356798, 1, 1, 1, 1, 1,
0.8700429, -1.099408, 2.031421, 0, 0, 1, 1, 1,
0.8744911, 0.8622127, 2.101009, 1, 0, 0, 1, 1,
0.8746912, 1.349272, -0.2190702, 1, 0, 0, 1, 1,
0.8838621, 0.5009006, 0.6496815, 1, 0, 0, 1, 1,
0.8848261, 1.688008, -1.121813, 1, 0, 0, 1, 1,
0.8895537, 0.04764264, 1.670125, 1, 0, 0, 1, 1,
0.8910707, 0.5744671, 1.41583, 0, 0, 0, 1, 1,
0.8943792, 0.4919706, 1.694746, 0, 0, 0, 1, 1,
0.8948861, 0.6127271, 1.829659, 0, 0, 0, 1, 1,
0.9002979, -1.512419, 3.476875, 0, 0, 0, 1, 1,
0.9023553, 0.8158156, 0.4285342, 0, 0, 0, 1, 1,
0.9068867, -0.1595104, 2.888674, 0, 0, 0, 1, 1,
0.9074129, 0.7703357, 0.2377089, 0, 0, 0, 1, 1,
0.9091275, 1.922978, 0.3289091, 1, 1, 1, 1, 1,
0.911343, 0.9477851, 0.756914, 1, 1, 1, 1, 1,
0.9258239, 0.3536757, 2.283899, 1, 1, 1, 1, 1,
0.9266399, -0.7132124, 1.841125, 1, 1, 1, 1, 1,
0.9275058, -1.223194, 2.056874, 1, 1, 1, 1, 1,
0.9290954, -2.524301, 2.324912, 1, 1, 1, 1, 1,
0.9310002, -0.6190562, 2.528971, 1, 1, 1, 1, 1,
0.9420462, -0.6334058, 2.998215, 1, 1, 1, 1, 1,
0.9441962, -0.07606123, 1.176079, 1, 1, 1, 1, 1,
0.9443698, 0.2761185, 2.013912, 1, 1, 1, 1, 1,
0.9540733, -1.252309, 2.25476, 1, 1, 1, 1, 1,
0.9581261, 0.8964121, -0.2821772, 1, 1, 1, 1, 1,
0.9588388, 0.002418386, 0.4870773, 1, 1, 1, 1, 1,
0.9696351, 1.372951, -1.567641, 1, 1, 1, 1, 1,
0.9698305, -0.5165148, 2.14126, 1, 1, 1, 1, 1,
0.9721588, -0.9280426, 2.440845, 0, 0, 1, 1, 1,
0.9729743, -1.83085, 1.870754, 1, 0, 0, 1, 1,
0.9784811, -0.5801916, 0.6139901, 1, 0, 0, 1, 1,
0.9810593, 0.3403482, 0.2361706, 1, 0, 0, 1, 1,
0.9989617, -0.1065621, 0.3378694, 1, 0, 0, 1, 1,
0.9997963, 0.2980781, 1.742084, 1, 0, 0, 1, 1,
0.9998577, -0.3269573, 0.6855552, 0, 0, 0, 1, 1,
1.005357, 1.548114, 0.6098973, 0, 0, 0, 1, 1,
1.007754, -0.753623, 0.379065, 0, 0, 0, 1, 1,
1.008087, -0.007055001, 1.395573, 0, 0, 0, 1, 1,
1.008621, 1.363993, 1.355642, 0, 0, 0, 1, 1,
1.020782, 0.1759238, -1.439352, 0, 0, 0, 1, 1,
1.021787, 0.1887253, 2.320301, 0, 0, 0, 1, 1,
1.024612, -1.593626, 1.903408, 1, 1, 1, 1, 1,
1.029206, -0.7738901, 1.662291, 1, 1, 1, 1, 1,
1.030673, 1.044476, 0.8630474, 1, 1, 1, 1, 1,
1.031297, -1.235256, 3.95593, 1, 1, 1, 1, 1,
1.031812, -0.8222113, 1.534863, 1, 1, 1, 1, 1,
1.032927, -0.3080338, 2.01303, 1, 1, 1, 1, 1,
1.046005, -0.1958972, 1.460293, 1, 1, 1, 1, 1,
1.047329, 1.176838, 1.614334, 1, 1, 1, 1, 1,
1.052797, 1.344944, 0.4667658, 1, 1, 1, 1, 1,
1.061734, -0.7762224, 4.499776, 1, 1, 1, 1, 1,
1.070229, -0.5101419, 3.592968, 1, 1, 1, 1, 1,
1.081171, 0.9131504, 1.391678, 1, 1, 1, 1, 1,
1.081473, -0.6760284, 2.622998, 1, 1, 1, 1, 1,
1.084654, 0.4242849, 0.4231261, 1, 1, 1, 1, 1,
1.089358, -0.499791, 0.9379061, 1, 1, 1, 1, 1,
1.092987, 0.7477558, 0.409025, 0, 0, 1, 1, 1,
1.097901, -0.2711127, 2.251807, 1, 0, 0, 1, 1,
1.098062, 0.117936, 1.739634, 1, 0, 0, 1, 1,
1.10618, 2.147526, 1.380812, 1, 0, 0, 1, 1,
1.109792, 2.35551, 0.3299655, 1, 0, 0, 1, 1,
1.113933, 0.6097382, 3.049015, 1, 0, 0, 1, 1,
1.117498, -0.09795707, 1.826077, 0, 0, 0, 1, 1,
1.128283, -0.2712196, 1.65458, 0, 0, 0, 1, 1,
1.128905, -0.8921455, 3.037768, 0, 0, 0, 1, 1,
1.138679, -1.313387, 2.783284, 0, 0, 0, 1, 1,
1.144844, -0.6231206, 3.013053, 0, 0, 0, 1, 1,
1.148938, -1.597768, 2.42643, 0, 0, 0, 1, 1,
1.151297, 2.446647, 1.068199, 0, 0, 0, 1, 1,
1.152389, -1.485267, 2.389376, 1, 1, 1, 1, 1,
1.166435, 0.2032651, 0.7622089, 1, 1, 1, 1, 1,
1.174541, 1.115143, -0.5591264, 1, 1, 1, 1, 1,
1.174991, -0.01962391, 0.7431121, 1, 1, 1, 1, 1,
1.182513, -1.199033, 4.069098, 1, 1, 1, 1, 1,
1.197286, 0.2170441, 1.211843, 1, 1, 1, 1, 1,
1.198017, -0.5140635, 1.957182, 1, 1, 1, 1, 1,
1.225698, -0.8996563, 1.79043, 1, 1, 1, 1, 1,
1.229697, 0.6265047, 1.655268, 1, 1, 1, 1, 1,
1.230951, -0.723141, 2.898915, 1, 1, 1, 1, 1,
1.232787, 0.6656067, -0.1461415, 1, 1, 1, 1, 1,
1.233428, 0.7976859, 1.766786, 1, 1, 1, 1, 1,
1.256753, 0.1784659, -0.1618282, 1, 1, 1, 1, 1,
1.267339, -2.350432, 4.607337, 1, 1, 1, 1, 1,
1.268784, 0.2277897, 2.087812, 1, 1, 1, 1, 1,
1.285921, 1.889588, -1.613712, 0, 0, 1, 1, 1,
1.291527, 0.2584937, 1.125882, 1, 0, 0, 1, 1,
1.306785, -0.2707381, 2.552592, 1, 0, 0, 1, 1,
1.318354, -0.3319548, 2.823682, 1, 0, 0, 1, 1,
1.330773, 1.647171, 0.1667139, 1, 0, 0, 1, 1,
1.340101, -2.414417, 3.369373, 1, 0, 0, 1, 1,
1.346949, -1.129288, 1.898998, 0, 0, 0, 1, 1,
1.351841, 1.15962, -0.04170135, 0, 0, 0, 1, 1,
1.355812, -0.8582061, 2.026405, 0, 0, 0, 1, 1,
1.368317, -0.460032, 1.879969, 0, 0, 0, 1, 1,
1.371913, -1.593848, 2.790821, 0, 0, 0, 1, 1,
1.387081, 0.4548615, 1.159326, 0, 0, 0, 1, 1,
1.388369, -1.581844, 0.8220586, 0, 0, 0, 1, 1,
1.399346, 0.8359377, 1.339007, 1, 1, 1, 1, 1,
1.417775, -0.6607476, 3.322119, 1, 1, 1, 1, 1,
1.41821, 2.284275, 0.006238763, 1, 1, 1, 1, 1,
1.420368, -0.8865397, 3.302965, 1, 1, 1, 1, 1,
1.422264, 0.7695497, 2.99882, 1, 1, 1, 1, 1,
1.428093, -0.3766676, 2.508106, 1, 1, 1, 1, 1,
1.429074, -1.560436, 2.256477, 1, 1, 1, 1, 1,
1.432194, -0.8882218, 2.562035, 1, 1, 1, 1, 1,
1.435283, -1.132902, 1.915224, 1, 1, 1, 1, 1,
1.443827, -0.4171522, 2.938375, 1, 1, 1, 1, 1,
1.449396, 0.09900619, 0.1964191, 1, 1, 1, 1, 1,
1.453569, 0.4542908, 0.6879184, 1, 1, 1, 1, 1,
1.45867, 0.5491797, 1.121985, 1, 1, 1, 1, 1,
1.465842, 0.5914248, -0.3977661, 1, 1, 1, 1, 1,
1.476166, -1.368756, 2.057442, 1, 1, 1, 1, 1,
1.478323, 0.08599469, -0.2121179, 0, 0, 1, 1, 1,
1.480857, 1.406232, 1.273996, 1, 0, 0, 1, 1,
1.487325, 0.7118729, 0.6891931, 1, 0, 0, 1, 1,
1.517204, -1.628691, 0.8165579, 1, 0, 0, 1, 1,
1.517247, -1.22955, 3.731595, 1, 0, 0, 1, 1,
1.52565, 1.775849, 0.2483902, 1, 0, 0, 1, 1,
1.528457, 0.8899105, 1.369847, 0, 0, 0, 1, 1,
1.546587, -0.873317, 1.465755, 0, 0, 0, 1, 1,
1.554667, 0.4611708, 0.7506931, 0, 0, 0, 1, 1,
1.569431, 0.6185894, 2.636502, 0, 0, 0, 1, 1,
1.571183, -1.237893e-05, 2.665962, 0, 0, 0, 1, 1,
1.57691, 0.3591152, 1.376831, 0, 0, 0, 1, 1,
1.58432, 0.05606562, 2.793164, 0, 0, 0, 1, 1,
1.585169, 0.2487436, 1.134619, 1, 1, 1, 1, 1,
1.586424, 0.2729082, 2.421384, 1, 1, 1, 1, 1,
1.607661, -1.242544, 0.6190155, 1, 1, 1, 1, 1,
1.609527, 0.7368318, 1.748885, 1, 1, 1, 1, 1,
1.619481, 0.06929859, 0.1888541, 1, 1, 1, 1, 1,
1.628202, 0.9727778, 2.468391, 1, 1, 1, 1, 1,
1.636698, 0.9015837, 1.371626, 1, 1, 1, 1, 1,
1.643182, 0.04791861, 2.267746, 1, 1, 1, 1, 1,
1.644549, -0.9617408, 2.255509, 1, 1, 1, 1, 1,
1.648121, -1.575373, 1.424271, 1, 1, 1, 1, 1,
1.667627, 0.9036949, 1.122143, 1, 1, 1, 1, 1,
1.674342, -0.8973041, 1.652998, 1, 1, 1, 1, 1,
1.701504, -1.153676, 0.3070827, 1, 1, 1, 1, 1,
1.706365, 1.632988, 1.643348, 1, 1, 1, 1, 1,
1.710848, 1.316372, 1.016358, 1, 1, 1, 1, 1,
1.719402, -0.4866114, 2.115066, 0, 0, 1, 1, 1,
1.730267, -0.2349949, 2.721529, 1, 0, 0, 1, 1,
1.738024, -0.8131651, 2.074004, 1, 0, 0, 1, 1,
1.742074, 0.6992137, 2.210652, 1, 0, 0, 1, 1,
1.747217, -1.309867, 0.6910179, 1, 0, 0, 1, 1,
1.7604, 0.3409973, 1.07975, 1, 0, 0, 1, 1,
1.793684, 0.09426873, 1.49858, 0, 0, 0, 1, 1,
1.798255, 0.2154067, 2.357302, 0, 0, 0, 1, 1,
1.807011, -0.5190959, 1.12922, 0, 0, 0, 1, 1,
1.808831, 1.489702, 2.226339, 0, 0, 0, 1, 1,
1.811575, -1.007188, 3.082561, 0, 0, 0, 1, 1,
1.84041, 2.365957, -1.060673, 0, 0, 0, 1, 1,
1.843349, 1.754069, 1.502501, 0, 0, 0, 1, 1,
1.853482, 0.4486014, 3.295342, 1, 1, 1, 1, 1,
1.858542, -0.347971, 2.883147, 1, 1, 1, 1, 1,
1.869018, 1.058437, -0.03853353, 1, 1, 1, 1, 1,
1.877692, -0.2184281, 1.620755, 1, 1, 1, 1, 1,
1.881766, -0.8026893, 0.5514693, 1, 1, 1, 1, 1,
1.882171, 0.1046016, 0.5402079, 1, 1, 1, 1, 1,
1.918357, 0.4348182, 1.227156, 1, 1, 1, 1, 1,
1.923254, -0.1046748, 2.203178, 1, 1, 1, 1, 1,
1.929489, 1.939615, 1.361857, 1, 1, 1, 1, 1,
1.943888, 0.3616199, 1.351918, 1, 1, 1, 1, 1,
1.962889, -0.7853284, 1.214901, 1, 1, 1, 1, 1,
1.96328, -0.8701548, 2.668015, 1, 1, 1, 1, 1,
1.966435, 0.720669, 3.076995, 1, 1, 1, 1, 1,
1.969614, -0.01056611, 1.428762, 1, 1, 1, 1, 1,
2.011446, -0.1219443, 1.907534, 1, 1, 1, 1, 1,
2.019712, -0.420528, 0.8000653, 0, 0, 1, 1, 1,
2.020986, -0.3955481, 1.188896, 1, 0, 0, 1, 1,
2.025163, -0.8882653, 0.8609, 1, 0, 0, 1, 1,
2.033654, -0.7997033, 2.847179, 1, 0, 0, 1, 1,
2.040067, 0.3924261, 1.956174, 1, 0, 0, 1, 1,
2.114788, 2.114846, 0.8060341, 1, 0, 0, 1, 1,
2.148921, -0.6236115, 2.011825, 0, 0, 0, 1, 1,
2.187797, -0.4093619, 1.932765, 0, 0, 0, 1, 1,
2.220598, -0.4966981, 0.6204485, 0, 0, 0, 1, 1,
2.256357, 0.6419464, 0.2508871, 0, 0, 0, 1, 1,
2.280781, -0.6442846, 1.129247, 0, 0, 0, 1, 1,
2.31375, 1.304158, 2.255997, 0, 0, 0, 1, 1,
2.41275, -0.07048987, 1.254667, 0, 0, 0, 1, 1,
2.477875, 0.4755988, 2.248759, 1, 1, 1, 1, 1,
2.755914, 0.520418, 1.157208, 1, 1, 1, 1, 1,
2.871274, -0.2143767, 1.202229, 1, 1, 1, 1, 1,
2.942631, 1.047906, 0.934679, 1, 1, 1, 1, 1,
3.166197, 0.8116055, 1.323194, 1, 1, 1, 1, 1,
3.207869, -0.4291925, 3.310776, 1, 1, 1, 1, 1,
3.997343, -0.007966795, 1.858034, 1, 1, 1, 1, 1
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
var radius = 9.688595;
var distance = 34.03078;
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
mvMatrix.translate( -0.3779943, 0.06755579, 0.5085926 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.03078);
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
