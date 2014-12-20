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
-3.016336, -1.98418, -2.793504, 1, 0, 0, 1,
-2.922119, 0.5034093, 0.4054742, 1, 0.007843138, 0, 1,
-2.839272, 0.3939361, -0.9145278, 1, 0.01176471, 0, 1,
-2.786933, -0.8435383, -0.6779544, 1, 0.01960784, 0, 1,
-2.702287, 2.492258, -0.2880728, 1, 0.02352941, 0, 1,
-2.56188, 1.161301, -1.407008, 1, 0.03137255, 0, 1,
-2.559857, 0.4619707, -0.8836226, 1, 0.03529412, 0, 1,
-2.523387, -0.8685496, -2.200109, 1, 0.04313726, 0, 1,
-2.397664, -0.7080427, -2.15204, 1, 0.04705882, 0, 1,
-2.397069, -0.5959701, -3.232803, 1, 0.05490196, 0, 1,
-2.35965, 0.009031417, -0.620298, 1, 0.05882353, 0, 1,
-2.291439, 1.147815, -0.6183445, 1, 0.06666667, 0, 1,
-2.282614, 0.02816379, 0.04533878, 1, 0.07058824, 0, 1,
-2.245806, -1.437995, -2.592721, 1, 0.07843138, 0, 1,
-2.24292, -0.4721372, -1.410624, 1, 0.08235294, 0, 1,
-2.22341, 0.4652987, -1.4699, 1, 0.09019608, 0, 1,
-2.193505, 0.8223987, -2.606483, 1, 0.09411765, 0, 1,
-2.177284, 2.172568, -2.167819, 1, 0.1019608, 0, 1,
-2.163827, 1.221866, -2.767951, 1, 0.1098039, 0, 1,
-2.141893, -0.247957, -1.32249, 1, 0.1137255, 0, 1,
-2.140858, 0.9522084, -1.984191, 1, 0.1215686, 0, 1,
-2.137802, -0.6101799, -2.458885, 1, 0.1254902, 0, 1,
-2.119053, 1.74484, -2.253154, 1, 0.1333333, 0, 1,
-2.092149, 1.050208, 0.4142258, 1, 0.1372549, 0, 1,
-2.088811, -0.4089635, -1.15658, 1, 0.145098, 0, 1,
-2.025933, -0.5280527, -0.8182896, 1, 0.1490196, 0, 1,
-2.014937, -0.1523258, -2.309977, 1, 0.1568628, 0, 1,
-2.008666, -1.616875, -1.683954, 1, 0.1607843, 0, 1,
-2.006783, -0.1489895, -1.263908, 1, 0.1686275, 0, 1,
-1.992986, -0.2807042, -2.590922, 1, 0.172549, 0, 1,
-1.991709, 0.6579056, -2.348366, 1, 0.1803922, 0, 1,
-1.98395, -0.02031333, -2.05931, 1, 0.1843137, 0, 1,
-1.956009, 0.9136977, -2.117059, 1, 0.1921569, 0, 1,
-1.954362, -0.863442, -2.252028, 1, 0.1960784, 0, 1,
-1.934593, -2.32856, -0.9614277, 1, 0.2039216, 0, 1,
-1.918036, -0.5238562, -1.469236, 1, 0.2117647, 0, 1,
-1.917033, -0.2490102, -0.1133938, 1, 0.2156863, 0, 1,
-1.912308, -0.645678, -3.396591, 1, 0.2235294, 0, 1,
-1.825036, -0.1775517, -1.030163, 1, 0.227451, 0, 1,
-1.816765, -1.083005, -1.485831, 1, 0.2352941, 0, 1,
-1.789786, 1.106891, -0.4422086, 1, 0.2392157, 0, 1,
-1.785366, 0.1742164, -3.118735, 1, 0.2470588, 0, 1,
-1.767645, 0.08272199, 0.8598451, 1, 0.2509804, 0, 1,
-1.742897, 1.380753, -0.2435637, 1, 0.2588235, 0, 1,
-1.715714, -0.4337044, -2.140273, 1, 0.2627451, 0, 1,
-1.707586, 1.527937, 0.3786044, 1, 0.2705882, 0, 1,
-1.692493, 0.2716572, -2.583841, 1, 0.2745098, 0, 1,
-1.679787, 1.139389, -1.115718, 1, 0.282353, 0, 1,
-1.671976, 0.498414, -2.00467, 1, 0.2862745, 0, 1,
-1.67051, 0.6029587, -0.9457992, 1, 0.2941177, 0, 1,
-1.668141, -0.3569947, -3.174229, 1, 0.3019608, 0, 1,
-1.651629, -1.64613, -1.835313, 1, 0.3058824, 0, 1,
-1.641447, -0.3056144, -2.261953, 1, 0.3137255, 0, 1,
-1.626682, -1.011221, -3.165064, 1, 0.3176471, 0, 1,
-1.624202, 0.7620909, -1.504855, 1, 0.3254902, 0, 1,
-1.623223, 1.664907, -0.9123593, 1, 0.3294118, 0, 1,
-1.606622, 0.4187041, -0.5818027, 1, 0.3372549, 0, 1,
-1.601964, -0.3086408, -2.285753, 1, 0.3411765, 0, 1,
-1.594968, 2.458927, -0.4298341, 1, 0.3490196, 0, 1,
-1.58606, 0.8105878, -1.998672, 1, 0.3529412, 0, 1,
-1.580575, -0.6435851, -0.9069244, 1, 0.3607843, 0, 1,
-1.579289, -0.7497583, -0.3052469, 1, 0.3647059, 0, 1,
-1.57793, 1.01289, -0.5741848, 1, 0.372549, 0, 1,
-1.571262, -1.625289, -2.758608, 1, 0.3764706, 0, 1,
-1.559187, 0.1842548, -2.910228, 1, 0.3843137, 0, 1,
-1.537395, 1.133741, -2.037337, 1, 0.3882353, 0, 1,
-1.535525, 0.2246109, -3.384862, 1, 0.3960784, 0, 1,
-1.535293, -1.307226, -2.303807, 1, 0.4039216, 0, 1,
-1.525144, -0.6538116, -1.435022, 1, 0.4078431, 0, 1,
-1.514422, 2.033768, -1.73307, 1, 0.4156863, 0, 1,
-1.506822, -0.1519611, -0.4610575, 1, 0.4196078, 0, 1,
-1.505769, 1.220464, -1.717469, 1, 0.427451, 0, 1,
-1.497911, 0.5969477, -0.75622, 1, 0.4313726, 0, 1,
-1.488784, 0.3204874, -1.779186, 1, 0.4392157, 0, 1,
-1.486025, -0.557548, -1.500592, 1, 0.4431373, 0, 1,
-1.481169, -0.02723598, -1.817308, 1, 0.4509804, 0, 1,
-1.470104, -1.429958, -1.303636, 1, 0.454902, 0, 1,
-1.447854, -0.1452322, -0.7060157, 1, 0.4627451, 0, 1,
-1.447091, -0.5437613, -2.57218, 1, 0.4666667, 0, 1,
-1.439912, -0.5754982, -1.185486, 1, 0.4745098, 0, 1,
-1.437115, -0.2466545, -0.9632519, 1, 0.4784314, 0, 1,
-1.433338, -0.1989134, -2.414141, 1, 0.4862745, 0, 1,
-1.426733, -0.04666114, -1.030974, 1, 0.4901961, 0, 1,
-1.419616, -2.390407, -1.659225, 1, 0.4980392, 0, 1,
-1.406728, 1.310507, -0.3586607, 1, 0.5058824, 0, 1,
-1.399799, -0.8901028, -2.1775, 1, 0.509804, 0, 1,
-1.399279, -0.2676576, -2.969404, 1, 0.5176471, 0, 1,
-1.392124, -0.174871, -2.233361, 1, 0.5215687, 0, 1,
-1.390708, -2.108635, -2.039503, 1, 0.5294118, 0, 1,
-1.380707, -0.2362756, -2.583427, 1, 0.5333334, 0, 1,
-1.376693, 0.1253523, -1.582842, 1, 0.5411765, 0, 1,
-1.375207, 0.5152187, -1.211685, 1, 0.5450981, 0, 1,
-1.367584, -0.1616326, -1.01016, 1, 0.5529412, 0, 1,
-1.356151, -1.101658, -1.482413, 1, 0.5568628, 0, 1,
-1.35072, 0.7450827, 0.3228318, 1, 0.5647059, 0, 1,
-1.349568, 0.6183348, -2.542305, 1, 0.5686275, 0, 1,
-1.343084, 0.1179818, -0.6847172, 1, 0.5764706, 0, 1,
-1.327886, 1.023045, -2.298332, 1, 0.5803922, 0, 1,
-1.327511, -1.014991, -2.257718, 1, 0.5882353, 0, 1,
-1.314387, -0.1690386, -3.653845, 1, 0.5921569, 0, 1,
-1.288635, 0.3366264, -0.9964636, 1, 0.6, 0, 1,
-1.283815, -1.494654, -4.336908, 1, 0.6078432, 0, 1,
-1.28183, -0.4488404, -0.5607509, 1, 0.6117647, 0, 1,
-1.255906, 1.202659, -0.3631724, 1, 0.6196079, 0, 1,
-1.25413, -0.4721393, -0.9558592, 1, 0.6235294, 0, 1,
-1.243457, -0.1721603, -3.070269, 1, 0.6313726, 0, 1,
-1.229923, 0.02581096, -0.7238845, 1, 0.6352941, 0, 1,
-1.229883, -0.2372556, -3.053399, 1, 0.6431373, 0, 1,
-1.222458, 0.6002238, -0.3506433, 1, 0.6470588, 0, 1,
-1.218622, 0.7078992, -0.308176, 1, 0.654902, 0, 1,
-1.213143, -0.9039764, -3.373385, 1, 0.6588235, 0, 1,
-1.210737, -0.2166217, -1.813847, 1, 0.6666667, 0, 1,
-1.207734, -1.637826, -1.70672, 1, 0.6705883, 0, 1,
-1.205319, 0.4843478, -0.3844895, 1, 0.6784314, 0, 1,
-1.200039, 0.4280717, -0.9861196, 1, 0.682353, 0, 1,
-1.197282, 0.4875593, -0.9813401, 1, 0.6901961, 0, 1,
-1.197016, -1.010654, -1.467798, 1, 0.6941177, 0, 1,
-1.190994, 0.7885177, -1.955758, 1, 0.7019608, 0, 1,
-1.185213, 0.8263182, 1.630009, 1, 0.7098039, 0, 1,
-1.185047, 0.6523801, -3.43307, 1, 0.7137255, 0, 1,
-1.180584, -1.042335, -1.077383, 1, 0.7215686, 0, 1,
-1.174374, 0.03720737, -1.46424, 1, 0.7254902, 0, 1,
-1.172971, 0.9253784, -2.763216, 1, 0.7333333, 0, 1,
-1.17264, 1.034595, -0.2308806, 1, 0.7372549, 0, 1,
-1.167406, 0.01312556, -0.7612417, 1, 0.7450981, 0, 1,
-1.164423, -0.02550185, -3.323883, 1, 0.7490196, 0, 1,
-1.159706, -0.9827501, -2.925424, 1, 0.7568628, 0, 1,
-1.144213, 2.775867, -0.009298523, 1, 0.7607843, 0, 1,
-1.144196, -0.5783252, -1.245006, 1, 0.7686275, 0, 1,
-1.142259, -0.01473184, -2.088474, 1, 0.772549, 0, 1,
-1.139298, -0.9575676, -1.678792, 1, 0.7803922, 0, 1,
-1.137457, -1.484212, -3.44535, 1, 0.7843137, 0, 1,
-1.133759, -0.7029048, -4.100564, 1, 0.7921569, 0, 1,
-1.133421, 0.1664749, -1.536837, 1, 0.7960784, 0, 1,
-1.127967, 1.84775, -0.7509439, 1, 0.8039216, 0, 1,
-1.127902, 0.6311675, -0.7010357, 1, 0.8117647, 0, 1,
-1.118353, 1.210506, 0.2614584, 1, 0.8156863, 0, 1,
-1.117383, 0.00921101, -2.441053, 1, 0.8235294, 0, 1,
-1.116691, -0.6400353, -3.588871, 1, 0.827451, 0, 1,
-1.11665, -0.9082763, -0.2993677, 1, 0.8352941, 0, 1,
-1.114976, 0.64363, -0.05826827, 1, 0.8392157, 0, 1,
-1.110498, -1.011214, -2.716955, 1, 0.8470588, 0, 1,
-1.109928, -0.08484041, 1.07727, 1, 0.8509804, 0, 1,
-1.105647, -0.3699783, -1.081082, 1, 0.8588235, 0, 1,
-1.103108, -0.7097758, -1.913445, 1, 0.8627451, 0, 1,
-1.102829, 1.208961, -1.184621, 1, 0.8705882, 0, 1,
-1.092455, 1.152464, -1.180743, 1, 0.8745098, 0, 1,
-1.090303, 1.945417, 0.6161295, 1, 0.8823529, 0, 1,
-1.084401, 0.5190467, -0.7388762, 1, 0.8862745, 0, 1,
-1.080864, 0.1928339, -0.2243953, 1, 0.8941177, 0, 1,
-1.079512, 1.375883, -1.355056, 1, 0.8980392, 0, 1,
-1.067028, 0.1381674, -2.207823, 1, 0.9058824, 0, 1,
-1.064839, -0.2405556, -4.498167, 1, 0.9137255, 0, 1,
-1.062424, -0.8771313, -2.863668, 1, 0.9176471, 0, 1,
-1.059528, 0.2502567, -1.407409, 1, 0.9254902, 0, 1,
-1.057161, 0.7453324, -0.5815666, 1, 0.9294118, 0, 1,
-1.057133, -0.4629716, -2.53617, 1, 0.9372549, 0, 1,
-1.048881, 2.053089, -0.5295799, 1, 0.9411765, 0, 1,
-1.036206, 0.8462921, -1.950341, 1, 0.9490196, 0, 1,
-1.033606, -0.409388, -2.626534, 1, 0.9529412, 0, 1,
-1.027417, -0.93183, -3.001372, 1, 0.9607843, 0, 1,
-1.025238, -1.990994, -1.09481, 1, 0.9647059, 0, 1,
-1.021527, 0.4759048, -1.469401, 1, 0.972549, 0, 1,
-1.019146, -0.8164674, -2.769722, 1, 0.9764706, 0, 1,
-1.016294, 2.146854, -0.7623792, 1, 0.9843137, 0, 1,
-1.011557, 0.3256558, -1.313237, 1, 0.9882353, 0, 1,
-1.004571, -0.2919926, -1.935012, 1, 0.9960784, 0, 1,
-1.00097, 1.099612, 0.2327558, 0.9960784, 1, 0, 1,
-0.9984605, -0.9251413, -3.167471, 0.9921569, 1, 0, 1,
-0.9943441, -0.4334265, -2.569607, 0.9843137, 1, 0, 1,
-0.99093, -0.8961131, -1.831056, 0.9803922, 1, 0, 1,
-0.9897323, -0.801339, -1.013212, 0.972549, 1, 0, 1,
-0.9811372, 0.02935971, -3.724591, 0.9686275, 1, 0, 1,
-0.9667245, -0.6536273, -2.43802, 0.9607843, 1, 0, 1,
-0.9661457, -2.217316, -0.8952463, 0.9568627, 1, 0, 1,
-0.9558163, 1.930522, -0.7918707, 0.9490196, 1, 0, 1,
-0.9521757, 0.7449266, -1.104037, 0.945098, 1, 0, 1,
-0.9519636, 0.4976281, -0.6526119, 0.9372549, 1, 0, 1,
-0.9437491, -0.4516545, -3.261417, 0.9333333, 1, 0, 1,
-0.9372119, 0.4783809, -2.269921, 0.9254902, 1, 0, 1,
-0.9337473, -0.4227554, -2.048839, 0.9215686, 1, 0, 1,
-0.9330978, 0.03238328, -2.288465, 0.9137255, 1, 0, 1,
-0.9324699, -0.8668585, -2.958284, 0.9098039, 1, 0, 1,
-0.9273909, -0.1353178, -1.031539, 0.9019608, 1, 0, 1,
-0.9252013, 1.808128, 1.56167, 0.8941177, 1, 0, 1,
-0.9240465, 0.7268312, -0.5600798, 0.8901961, 1, 0, 1,
-0.9238375, 0.5907432, 0.5507029, 0.8823529, 1, 0, 1,
-0.923062, -1.096928, -3.748982, 0.8784314, 1, 0, 1,
-0.9228387, 2.06672, -0.3599346, 0.8705882, 1, 0, 1,
-0.9208788, 1.158435, -1.668184, 0.8666667, 1, 0, 1,
-0.9195957, 0.05597831, 0.488603, 0.8588235, 1, 0, 1,
-0.9081752, 0.4625354, -2.398583, 0.854902, 1, 0, 1,
-0.9052398, -0.2174921, -2.845427, 0.8470588, 1, 0, 1,
-0.9043385, -0.04753194, -1.331804, 0.8431373, 1, 0, 1,
-0.9036691, -0.7729095, -3.398555, 0.8352941, 1, 0, 1,
-0.8998197, 0.3161652, -2.93061, 0.8313726, 1, 0, 1,
-0.8936478, -1.257434, -3.102953, 0.8235294, 1, 0, 1,
-0.8886132, -1.146164, -2.114441, 0.8196079, 1, 0, 1,
-0.8789415, 0.06924891, -0.7604561, 0.8117647, 1, 0, 1,
-0.8651759, 0.7182849, -1.621258, 0.8078431, 1, 0, 1,
-0.8549168, -0.08811701, -2.746579, 0.8, 1, 0, 1,
-0.843178, -1.692285, -3.741156, 0.7921569, 1, 0, 1,
-0.8344413, 0.4699301, 0.2339531, 0.7882353, 1, 0, 1,
-0.8328478, 0.7541195, -1.573173, 0.7803922, 1, 0, 1,
-0.8285484, 0.6542878, 0.1991231, 0.7764706, 1, 0, 1,
-0.8282128, 0.791932, -3.323071, 0.7686275, 1, 0, 1,
-0.8272375, 0.1257877, -0.04316346, 0.7647059, 1, 0, 1,
-0.8252249, -0.107765, -1.350563, 0.7568628, 1, 0, 1,
-0.8204186, -1.160311, -1.725102, 0.7529412, 1, 0, 1,
-0.818475, 0.3502829, -2.101009, 0.7450981, 1, 0, 1,
-0.8180553, 0.2100786, -2.950445, 0.7411765, 1, 0, 1,
-0.8148292, -0.05551736, -2.183236, 0.7333333, 1, 0, 1,
-0.8104747, 0.09002426, -2.201436, 0.7294118, 1, 0, 1,
-0.8022773, -2.201021, -1.725986, 0.7215686, 1, 0, 1,
-0.8021737, -0.9469553, -2.80082, 0.7176471, 1, 0, 1,
-0.8007005, 0.8587328, -1.761974, 0.7098039, 1, 0, 1,
-0.7983385, 0.3956917, -0.8796601, 0.7058824, 1, 0, 1,
-0.7973075, 1.15242, 0.7906709, 0.6980392, 1, 0, 1,
-0.7972909, 0.7282119, 0.1945565, 0.6901961, 1, 0, 1,
-0.7881464, 0.03661731, -1.178181, 0.6862745, 1, 0, 1,
-0.7850046, 0.1861497, -2.900794, 0.6784314, 1, 0, 1,
-0.7798135, -0.4731448, -2.173506, 0.6745098, 1, 0, 1,
-0.7758805, -0.5861899, -2.180261, 0.6666667, 1, 0, 1,
-0.7757529, 1.763824, -1.314919, 0.6627451, 1, 0, 1,
-0.7742897, 1.004065, -1.767966, 0.654902, 1, 0, 1,
-0.7726204, 0.7580568, 0.9011489, 0.6509804, 1, 0, 1,
-0.7714422, -0.7966295, -0.9374074, 0.6431373, 1, 0, 1,
-0.7624697, 0.1397182, -1.255459, 0.6392157, 1, 0, 1,
-0.7608475, 0.8029238, -1.225856, 0.6313726, 1, 0, 1,
-0.7601278, 0.1971318, -3.041324, 0.627451, 1, 0, 1,
-0.7553201, -1.762171, -2.117836, 0.6196079, 1, 0, 1,
-0.7543293, -0.3523192, -1.733465, 0.6156863, 1, 0, 1,
-0.7487239, 0.717517, -2.834478, 0.6078432, 1, 0, 1,
-0.7425798, -0.8290892, -1.637831, 0.6039216, 1, 0, 1,
-0.7402947, 0.6565204, -2.005274, 0.5960785, 1, 0, 1,
-0.7392648, 0.03335218, -0.5630244, 0.5882353, 1, 0, 1,
-0.7355889, 0.05246989, -1.712682, 0.5843138, 1, 0, 1,
-0.7275321, -0.5760379, -0.8493983, 0.5764706, 1, 0, 1,
-0.725915, 0.05370328, -2.312829, 0.572549, 1, 0, 1,
-0.7253522, 0.6495013, 0.1854119, 0.5647059, 1, 0, 1,
-0.7238533, 0.426529, -3.298131, 0.5607843, 1, 0, 1,
-0.7235053, 0.05849182, -2.135604, 0.5529412, 1, 0, 1,
-0.7152098, 0.8294143, 0.3787816, 0.5490196, 1, 0, 1,
-0.7088834, 0.06107955, -1.603344, 0.5411765, 1, 0, 1,
-0.7081032, -0.8008845, -3.037737, 0.5372549, 1, 0, 1,
-0.7054474, -0.04406455, -1.68534, 0.5294118, 1, 0, 1,
-0.7019397, 0.9294484, -1.857727, 0.5254902, 1, 0, 1,
-0.6852699, 1.11489, -1.038229, 0.5176471, 1, 0, 1,
-0.6804736, -1.028722, -3.203695, 0.5137255, 1, 0, 1,
-0.6802742, -0.1109827, -1.300458, 0.5058824, 1, 0, 1,
-0.6741565, -0.6933607, -2.502321, 0.5019608, 1, 0, 1,
-0.6702169, 0.7529448, -0.4835162, 0.4941176, 1, 0, 1,
-0.6683471, -1.713894, -2.7372, 0.4862745, 1, 0, 1,
-0.6680883, 1.174775, -0.1242208, 0.4823529, 1, 0, 1,
-0.6661438, 0.8416587, -0.8446136, 0.4745098, 1, 0, 1,
-0.6621283, 0.4752731, -1.051754, 0.4705882, 1, 0, 1,
-0.6563194, -0.8959351, -2.823367, 0.4627451, 1, 0, 1,
-0.651251, -0.8765433, -1.37602, 0.4588235, 1, 0, 1,
-0.6489337, 0.1503527, -0.08282194, 0.4509804, 1, 0, 1,
-0.6418616, 1.011051, -0.9152044, 0.4470588, 1, 0, 1,
-0.6384268, -1.10912, -3.043229, 0.4392157, 1, 0, 1,
-0.6374685, 1.116781, -1.551706, 0.4352941, 1, 0, 1,
-0.6332527, -1.421193, -1.69809, 0.427451, 1, 0, 1,
-0.6197613, -1.535493, -4.70053, 0.4235294, 1, 0, 1,
-0.6142165, 0.6508752, 0.8263012, 0.4156863, 1, 0, 1,
-0.6128882, 0.1088126, 0.374995, 0.4117647, 1, 0, 1,
-0.6128576, -0.9609793, -2.438967, 0.4039216, 1, 0, 1,
-0.6089612, 0.7493574, -1.789403, 0.3960784, 1, 0, 1,
-0.6064704, -0.8555155, -2.571291, 0.3921569, 1, 0, 1,
-0.6058808, -0.5708116, -2.710562, 0.3843137, 1, 0, 1,
-0.6041424, -0.5627428, -2.335336, 0.3803922, 1, 0, 1,
-0.6030887, 1.295895, 0.6639643, 0.372549, 1, 0, 1,
-0.6013476, 1.318852, -2.678529, 0.3686275, 1, 0, 1,
-0.59987, -0.8185825, -2.654386, 0.3607843, 1, 0, 1,
-0.596673, 0.7945804, 0.8665954, 0.3568628, 1, 0, 1,
-0.5956246, -0.4015126, -2.706537, 0.3490196, 1, 0, 1,
-0.5945367, -0.03070983, -1.430678, 0.345098, 1, 0, 1,
-0.5931808, -0.02025977, -0.2149283, 0.3372549, 1, 0, 1,
-0.5904126, 0.1043163, -2.45851, 0.3333333, 1, 0, 1,
-0.5890026, 1.895611, -0.09394401, 0.3254902, 1, 0, 1,
-0.5853998, -0.3801278, -1.996859, 0.3215686, 1, 0, 1,
-0.583761, 0.1192242, -0.9989663, 0.3137255, 1, 0, 1,
-0.5833105, 2.682244, 0.3782915, 0.3098039, 1, 0, 1,
-0.5797092, -0.4510555, -3.250066, 0.3019608, 1, 0, 1,
-0.5791248, -1.88657, -1.881787, 0.2941177, 1, 0, 1,
-0.5778766, 0.9273243, 0.1532221, 0.2901961, 1, 0, 1,
-0.5745355, 2.429028, -0.6727138, 0.282353, 1, 0, 1,
-0.5740789, -0.1296471, 0.2985483, 0.2784314, 1, 0, 1,
-0.568884, -1.364645, -3.379242, 0.2705882, 1, 0, 1,
-0.5676648, -0.7990232, -2.133343, 0.2666667, 1, 0, 1,
-0.5643114, 0.1312116, -1.922058, 0.2588235, 1, 0, 1,
-0.5630051, 1.781528, 1.008815, 0.254902, 1, 0, 1,
-0.5611058, 0.003449583, -1.417359, 0.2470588, 1, 0, 1,
-0.5585592, 0.8805889, 0.1245274, 0.2431373, 1, 0, 1,
-0.5560868, -0.6544012, -2.067155, 0.2352941, 1, 0, 1,
-0.5485205, 0.3804253, -0.08768179, 0.2313726, 1, 0, 1,
-0.5468552, 0.6278875, -0.8366953, 0.2235294, 1, 0, 1,
-0.5460867, 0.9091259, -0.6688063, 0.2196078, 1, 0, 1,
-0.5433792, -0.2231084, -2.094908, 0.2117647, 1, 0, 1,
-0.5390224, -0.7701741, -0.8036491, 0.2078431, 1, 0, 1,
-0.5343087, -0.5408368, -0.1369228, 0.2, 1, 0, 1,
-0.5341411, -1.255324, -3.577213, 0.1921569, 1, 0, 1,
-0.5314313, 0.184442, 0.399704, 0.1882353, 1, 0, 1,
-0.5311084, 1.160056, 1.292102, 0.1803922, 1, 0, 1,
-0.5308973, 0.9431375, -0.4938671, 0.1764706, 1, 0, 1,
-0.5289627, 0.2252485, -1.839185, 0.1686275, 1, 0, 1,
-0.5257639, 1.116564, -2.330576, 0.1647059, 1, 0, 1,
-0.5255837, -0.5628625, -1.17158, 0.1568628, 1, 0, 1,
-0.5245622, 0.5678463, 0.614425, 0.1529412, 1, 0, 1,
-0.5232596, 0.8096184, -3.061688, 0.145098, 1, 0, 1,
-0.5174885, -0.262125, -2.086875, 0.1411765, 1, 0, 1,
-0.5164475, 0.02548297, -1.592235, 0.1333333, 1, 0, 1,
-0.5131937, -0.8647805, -4.38638, 0.1294118, 1, 0, 1,
-0.5117713, 0.7255822, -0.6784998, 0.1215686, 1, 0, 1,
-0.5025619, -2.504674, -3.451114, 0.1176471, 1, 0, 1,
-0.5010254, 1.312429, -2.325607, 0.1098039, 1, 0, 1,
-0.4937045, 1.200378, -1.380746, 0.1058824, 1, 0, 1,
-0.4893907, 0.401285, -1.145828, 0.09803922, 1, 0, 1,
-0.4851971, 0.5557352, -0.7639075, 0.09019608, 1, 0, 1,
-0.4813071, 0.3156791, -1.372776, 0.08627451, 1, 0, 1,
-0.4789147, 0.7369435, -0.3454577, 0.07843138, 1, 0, 1,
-0.4770894, 0.1151949, 0.3382213, 0.07450981, 1, 0, 1,
-0.4768033, -0.4317829, -1.441902, 0.06666667, 1, 0, 1,
-0.4758894, 0.3439173, -0.7848097, 0.0627451, 1, 0, 1,
-0.4637262, -1.493237, -2.134217, 0.05490196, 1, 0, 1,
-0.4601586, -1.474276, -2.245093, 0.05098039, 1, 0, 1,
-0.4495832, -1.683294, -4.476185, 0.04313726, 1, 0, 1,
-0.4440163, 0.009273752, -1.747992, 0.03921569, 1, 0, 1,
-0.4394967, -1.331833, -2.49287, 0.03137255, 1, 0, 1,
-0.4312037, 0.1218086, -1.036621, 0.02745098, 1, 0, 1,
-0.4264679, -0.7422988, 0.2909619, 0.01960784, 1, 0, 1,
-0.4246064, -0.185242, -0.4574927, 0.01568628, 1, 0, 1,
-0.4245981, 0.5345249, -1.844739, 0.007843138, 1, 0, 1,
-0.4225782, -0.9326365, -3.667387, 0.003921569, 1, 0, 1,
-0.4217363, -0.3767008, -0.6280355, 0, 1, 0.003921569, 1,
-0.4158169, -0.5690078, -2.514326, 0, 1, 0.01176471, 1,
-0.4088392, -1.403847, -2.942666, 0, 1, 0.01568628, 1,
-0.4085789, 0.008154943, -2.229087, 0, 1, 0.02352941, 1,
-0.401657, 0.32044, -1.637581, 0, 1, 0.02745098, 1,
-0.4013615, -0.04269126, -0.4702011, 0, 1, 0.03529412, 1,
-0.3984272, 1.049952, -0.9190524, 0, 1, 0.03921569, 1,
-0.3950764, 0.3743111, -1.47196, 0, 1, 0.04705882, 1,
-0.3941544, 0.5765356, -0.3815387, 0, 1, 0.05098039, 1,
-0.3933987, 0.3885625, -1.267257, 0, 1, 0.05882353, 1,
-0.3854203, 0.3839947, -2.565558, 0, 1, 0.0627451, 1,
-0.3812158, 0.8544585, -0.1630298, 0, 1, 0.07058824, 1,
-0.3770273, -0.8106103, -3.866684, 0, 1, 0.07450981, 1,
-0.3708921, 1.650379, -0.05312856, 0, 1, 0.08235294, 1,
-0.3675762, 0.4869232, 0.6187617, 0, 1, 0.08627451, 1,
-0.3652682, -0.0222645, -1.398625, 0, 1, 0.09411765, 1,
-0.3641332, -0.9283293, -3.574566, 0, 1, 0.1019608, 1,
-0.3593305, 1.059849, -2.04816, 0, 1, 0.1058824, 1,
-0.3571493, 0.7509275, -0.3429654, 0, 1, 0.1137255, 1,
-0.3483557, -1.08981, -2.825254, 0, 1, 0.1176471, 1,
-0.3402641, 0.2901682, -0.4306249, 0, 1, 0.1254902, 1,
-0.3312746, -0.3407564, -4.300622, 0, 1, 0.1294118, 1,
-0.3308861, 1.87713, -1.280635, 0, 1, 0.1372549, 1,
-0.3248337, -0.7780188, -2.910112, 0, 1, 0.1411765, 1,
-0.3199162, -0.06282963, -2.04992, 0, 1, 0.1490196, 1,
-0.3198068, -0.5849481, -2.789601, 0, 1, 0.1529412, 1,
-0.3121689, 1.326422, -0.9188243, 0, 1, 0.1607843, 1,
-0.3043356, -1.733092, -4.278644, 0, 1, 0.1647059, 1,
-0.3037595, 0.3693727, -0.2905674, 0, 1, 0.172549, 1,
-0.3034369, -0.3171412, -1.39805, 0, 1, 0.1764706, 1,
-0.3019907, -2.464512, -3.218139, 0, 1, 0.1843137, 1,
-0.2959131, -0.8150326, -3.144508, 0, 1, 0.1882353, 1,
-0.295846, -2.228056, -4.112919, 0, 1, 0.1960784, 1,
-0.2920416, 1.900899, -0.694862, 0, 1, 0.2039216, 1,
-0.2855467, -1.66528, -1.961006, 0, 1, 0.2078431, 1,
-0.2764446, 0.1201674, -1.136407, 0, 1, 0.2156863, 1,
-0.2750974, -0.01964989, 0.1670402, 0, 1, 0.2196078, 1,
-0.2730938, 0.6523449, -1.823235, 0, 1, 0.227451, 1,
-0.2727926, -0.04224949, -3.564048, 0, 1, 0.2313726, 1,
-0.2708771, -0.4237619, -1.738038, 0, 1, 0.2392157, 1,
-0.2708086, 1.137977, -0.5030072, 0, 1, 0.2431373, 1,
-0.270799, -0.06299223, -0.8237614, 0, 1, 0.2509804, 1,
-0.2608128, -1.336069, -2.793135, 0, 1, 0.254902, 1,
-0.2569714, 0.01071051, -1.424487, 0, 1, 0.2627451, 1,
-0.2554466, 0.428745, 0.36568, 0, 1, 0.2666667, 1,
-0.2552606, -0.5551819, -2.826955, 0, 1, 0.2745098, 1,
-0.2548787, 1.019633, 0.4999926, 0, 1, 0.2784314, 1,
-0.2536522, -0.5652902, -2.652485, 0, 1, 0.2862745, 1,
-0.2513097, -1.679161, -3.62363, 0, 1, 0.2901961, 1,
-0.2439442, 0.7688676, -0.4276834, 0, 1, 0.2980392, 1,
-0.2415118, -0.1644781, -0.8962978, 0, 1, 0.3058824, 1,
-0.2402851, 0.9778043, -0.1184652, 0, 1, 0.3098039, 1,
-0.2304844, 0.7268603, -1.55246, 0, 1, 0.3176471, 1,
-0.2249575, -0.8090723, -2.614203, 0, 1, 0.3215686, 1,
-0.21908, -0.9976676, -1.689682, 0, 1, 0.3294118, 1,
-0.2185956, -0.08783211, -2.916862, 0, 1, 0.3333333, 1,
-0.2122184, 2.066025, 1.494516, 0, 1, 0.3411765, 1,
-0.2116707, -1.711717, -4.145177, 0, 1, 0.345098, 1,
-0.2106078, -0.2036888, -2.565229, 0, 1, 0.3529412, 1,
-0.2075162, -0.1537302, -1.776452, 0, 1, 0.3568628, 1,
-0.2050353, 1.735625, -0.02800876, 0, 1, 0.3647059, 1,
-0.2029236, 0.4437232, -0.4730536, 0, 1, 0.3686275, 1,
-0.2027547, 0.6551988, 0.2564552, 0, 1, 0.3764706, 1,
-0.1851796, 1.88315, 0.03022389, 0, 1, 0.3803922, 1,
-0.1836042, 0.8620732, -2.094213, 0, 1, 0.3882353, 1,
-0.1800401, 0.03344878, -2.698925, 0, 1, 0.3921569, 1,
-0.1759123, -1.346329, -1.494032, 0, 1, 0.4, 1,
-0.1748383, 0.4745404, -2.250571, 0, 1, 0.4078431, 1,
-0.1735137, -0.9885628, -1.52251, 0, 1, 0.4117647, 1,
-0.1701304, 0.54369, 0.3275612, 0, 1, 0.4196078, 1,
-0.1668568, 0.07294711, -1.872977, 0, 1, 0.4235294, 1,
-0.1654206, -0.2715167, -0.9411851, 0, 1, 0.4313726, 1,
-0.1649714, 0.5098872, 0.8834381, 0, 1, 0.4352941, 1,
-0.1640154, -0.8906784, -2.375828, 0, 1, 0.4431373, 1,
-0.1625679, 1.023623, -0.7550458, 0, 1, 0.4470588, 1,
-0.1615528, -0.0158374, 0.06491658, 0, 1, 0.454902, 1,
-0.1595095, 0.6784757, 0.7442954, 0, 1, 0.4588235, 1,
-0.1591412, -0.2872177, -2.674713, 0, 1, 0.4666667, 1,
-0.158958, -1.230554, -3.96181, 0, 1, 0.4705882, 1,
-0.1555359, 1.053026, 0.6344348, 0, 1, 0.4784314, 1,
-0.1552207, -1.020306, -3.26463, 0, 1, 0.4823529, 1,
-0.1541046, 0.3438067, -1.563286, 0, 1, 0.4901961, 1,
-0.1510358, 0.2792183, -2.024832, 0, 1, 0.4941176, 1,
-0.1453396, 0.2214214, -0.1272817, 0, 1, 0.5019608, 1,
-0.1425464, -0.1747966, -1.972872, 0, 1, 0.509804, 1,
-0.1412017, -0.02355816, -1.182664, 0, 1, 0.5137255, 1,
-0.1409191, -1.000336, -2.915371, 0, 1, 0.5215687, 1,
-0.1394422, -1.404107, -2.99252, 0, 1, 0.5254902, 1,
-0.134359, -0.6631106, -1.144167, 0, 1, 0.5333334, 1,
-0.1312885, 0.3930295, -0.8895065, 0, 1, 0.5372549, 1,
-0.123346, -1.56653, -2.635221, 0, 1, 0.5450981, 1,
-0.1173862, -0.2832077, -3.125609, 0, 1, 0.5490196, 1,
-0.1094902, -1.188839, -1.637657, 0, 1, 0.5568628, 1,
-0.1034739, 0.3006913, -1.207106, 0, 1, 0.5607843, 1,
-0.0992617, -0.4391459, -2.846009, 0, 1, 0.5686275, 1,
-0.09715588, 1.184358, -0.6300434, 0, 1, 0.572549, 1,
-0.0893255, 1.430612, -0.7223828, 0, 1, 0.5803922, 1,
-0.08925597, 0.3495839, -1.348818, 0, 1, 0.5843138, 1,
-0.08699535, 0.8757862, -0.7909444, 0, 1, 0.5921569, 1,
-0.08579927, -2.145468, -3.239771, 0, 1, 0.5960785, 1,
-0.08396742, -0.2091575, -2.215448, 0, 1, 0.6039216, 1,
-0.0832705, 0.5737148, -0.0219763, 0, 1, 0.6117647, 1,
-0.08114558, 1.751764, 1.43971, 0, 1, 0.6156863, 1,
-0.07592551, -0.01967925, -2.118166, 0, 1, 0.6235294, 1,
-0.07330425, 0.1657615, -1.590106, 0, 1, 0.627451, 1,
-0.07281256, -0.8552129, -3.036296, 0, 1, 0.6352941, 1,
-0.07279143, -0.1910978, -3.994119, 0, 1, 0.6392157, 1,
-0.06918035, -0.03781226, -0.9107136, 0, 1, 0.6470588, 1,
-0.06274147, 1.105613, 0.0875833, 0, 1, 0.6509804, 1,
-0.06254101, 0.411206, 1.961132, 0, 1, 0.6588235, 1,
-0.06158902, -1.28322, -3.035825, 0, 1, 0.6627451, 1,
-0.06129642, -0.04068756, -1.653937, 0, 1, 0.6705883, 1,
-0.06010732, -0.5696249, -4.090059, 0, 1, 0.6745098, 1,
-0.05996812, 0.01729472, -1.805571, 0, 1, 0.682353, 1,
-0.05467044, -1.26307, -3.072997, 0, 1, 0.6862745, 1,
-0.05383595, 0.8143424, 0.6150987, 0, 1, 0.6941177, 1,
-0.0438613, 0.5957648, -1.345231, 0, 1, 0.7019608, 1,
-0.04257246, -0.2308756, -2.481367, 0, 1, 0.7058824, 1,
-0.03059399, -0.7679199, -2.014041, 0, 1, 0.7137255, 1,
-0.02555992, -0.5104815, -3.262693, 0, 1, 0.7176471, 1,
-0.0220087, 0.4783802, -1.295787, 0, 1, 0.7254902, 1,
-0.01980613, -0.811604, -1.327843, 0, 1, 0.7294118, 1,
-0.004360055, 0.7005001, -1.119096, 0, 1, 0.7372549, 1,
0.004978356, -0.7674239, 3.487366, 0, 1, 0.7411765, 1,
0.005856609, -1.221421, 2.679579, 0, 1, 0.7490196, 1,
0.006473819, 1.359997, 0.1780215, 0, 1, 0.7529412, 1,
0.01061848, 1.182694, 1.289189, 0, 1, 0.7607843, 1,
0.01102001, 0.7452728, 1.058095, 0, 1, 0.7647059, 1,
0.01106452, 0.3574569, 1.387169, 0, 1, 0.772549, 1,
0.02045724, 2.604661, 0.9532279, 0, 1, 0.7764706, 1,
0.02100156, 1.98051, -1.797018, 0, 1, 0.7843137, 1,
0.028122, -0.4884472, 2.19973, 0, 1, 0.7882353, 1,
0.02850921, -1.442159, 3.766219, 0, 1, 0.7960784, 1,
0.02961278, -1.435391, 4.254471, 0, 1, 0.8039216, 1,
0.02998628, 0.1474705, -0.294647, 0, 1, 0.8078431, 1,
0.03063667, -0.5244926, 1.238857, 0, 1, 0.8156863, 1,
0.03097552, -0.4711743, 2.507354, 0, 1, 0.8196079, 1,
0.03461107, 2.599423, 1.13957, 0, 1, 0.827451, 1,
0.03950846, -0.001423121, 1.920718, 0, 1, 0.8313726, 1,
0.03994571, -0.6719174, 5.292639, 0, 1, 0.8392157, 1,
0.04258177, -0.003439716, 2.951014, 0, 1, 0.8431373, 1,
0.0433035, 0.2981968, 1.518379, 0, 1, 0.8509804, 1,
0.04398261, -0.107195, 0.561093, 0, 1, 0.854902, 1,
0.04479175, 0.3609806, -0.2394735, 0, 1, 0.8627451, 1,
0.04553243, -0.5118803, 2.809552, 0, 1, 0.8666667, 1,
0.04587132, 0.2687947, 1.44906, 0, 1, 0.8745098, 1,
0.04947022, 0.5671816, 0.7866267, 0, 1, 0.8784314, 1,
0.05058626, -0.04612617, 2.028589, 0, 1, 0.8862745, 1,
0.05064325, 1.243071, -0.02467113, 0, 1, 0.8901961, 1,
0.05623331, -1.359171, 3.767863, 0, 1, 0.8980392, 1,
0.05635051, 0.7109998, 0.3480123, 0, 1, 0.9058824, 1,
0.06397375, -1.831815, 2.596044, 0, 1, 0.9098039, 1,
0.06688807, -2.056398, 2.839355, 0, 1, 0.9176471, 1,
0.06703206, -0.8399588, 2.83119, 0, 1, 0.9215686, 1,
0.07321431, -0.2588854, 3.352969, 0, 1, 0.9294118, 1,
0.07398636, -0.1375649, 2.079284, 0, 1, 0.9333333, 1,
0.07514974, -1.137753, 3.435239, 0, 1, 0.9411765, 1,
0.07541753, 0.7823663, 0.3601139, 0, 1, 0.945098, 1,
0.07546704, -1.14347, 4.170356, 0, 1, 0.9529412, 1,
0.08165023, -0.4079456, 1.628648, 0, 1, 0.9568627, 1,
0.08388158, 0.4414898, 1.106891, 0, 1, 0.9647059, 1,
0.09364732, 0.7635466, -0.6721272, 0, 1, 0.9686275, 1,
0.09540299, 0.5299483, 0.3834911, 0, 1, 0.9764706, 1,
0.09939697, -0.9424585, 3.517784, 0, 1, 0.9803922, 1,
0.09967313, -0.1657985, 2.933653, 0, 1, 0.9882353, 1,
0.1026583, -1.260943, 1.22779, 0, 1, 0.9921569, 1,
0.1035327, 1.777715, 1.076357, 0, 1, 1, 1,
0.1036578, -0.1621607, 4.328306, 0, 0.9921569, 1, 1,
0.1036782, 2.05863, -0.06061157, 0, 0.9882353, 1, 1,
0.1088032, -0.04356755, 2.224207, 0, 0.9803922, 1, 1,
0.1090003, -0.2303789, 3.027448, 0, 0.9764706, 1, 1,
0.1186938, 0.5307191, -0.9051536, 0, 0.9686275, 1, 1,
0.120897, 1.417201, -0.3324506, 0, 0.9647059, 1, 1,
0.1253943, -2.473152, 2.972522, 0, 0.9568627, 1, 1,
0.1289272, 0.1619138, -0.8263165, 0, 0.9529412, 1, 1,
0.1318542, 1.268031, 0.7662413, 0, 0.945098, 1, 1,
0.1319257, 0.4840823, 0.2339854, 0, 0.9411765, 1, 1,
0.1324831, 2.062814, -1.437405, 0, 0.9333333, 1, 1,
0.132736, -0.05113569, 1.533396, 0, 0.9294118, 1, 1,
0.1351047, -0.3323003, 3.187554, 0, 0.9215686, 1, 1,
0.1358517, -0.8790877, 3.253568, 0, 0.9176471, 1, 1,
0.1363275, -0.5624124, 2.099448, 0, 0.9098039, 1, 1,
0.1392896, -0.07289256, 1.869148, 0, 0.9058824, 1, 1,
0.1403906, 0.5835164, 1.690226, 0, 0.8980392, 1, 1,
0.1445133, -0.071139, 4.753322, 0, 0.8901961, 1, 1,
0.1450982, -0.6242201, 3.417871, 0, 0.8862745, 1, 1,
0.1491073, 0.4997729, 0.3817761, 0, 0.8784314, 1, 1,
0.1531332, -0.2685181, 3.442902, 0, 0.8745098, 1, 1,
0.1542823, -1.043858, 2.339872, 0, 0.8666667, 1, 1,
0.1564168, -0.4669507, 2.352255, 0, 0.8627451, 1, 1,
0.1599614, -1.084473, 3.405931, 0, 0.854902, 1, 1,
0.1635981, 1.598426, -0.9496338, 0, 0.8509804, 1, 1,
0.1650863, -0.1288467, 2.877259, 0, 0.8431373, 1, 1,
0.1650967, 0.6055545, 1.795682, 0, 0.8392157, 1, 1,
0.1655655, 1.019589, 1.589739, 0, 0.8313726, 1, 1,
0.1662274, -0.8711418, 4.270742, 0, 0.827451, 1, 1,
0.1678626, -1.828672, 2.946691, 0, 0.8196079, 1, 1,
0.1688338, 0.3673523, -0.08647403, 0, 0.8156863, 1, 1,
0.168976, 1.201776, 0.2086977, 0, 0.8078431, 1, 1,
0.1698053, 1.111985, 2.036604, 0, 0.8039216, 1, 1,
0.1706354, -0.005951829, 0.9891655, 0, 0.7960784, 1, 1,
0.1709188, -0.2685913, 4.115529, 0, 0.7882353, 1, 1,
0.1711223, 1.917053, -2.740913, 0, 0.7843137, 1, 1,
0.1762916, 1.01806, 1.831952, 0, 0.7764706, 1, 1,
0.176496, -0.3283732, 3.681481, 0, 0.772549, 1, 1,
0.1821828, -0.8397095, 1.165281, 0, 0.7647059, 1, 1,
0.1830492, 0.1756539, 1.700933, 0, 0.7607843, 1, 1,
0.1853441, 0.4330656, 0.08884428, 0, 0.7529412, 1, 1,
0.1876352, -0.1090828, 2.012799, 0, 0.7490196, 1, 1,
0.1926063, 1.756998, 1.09723, 0, 0.7411765, 1, 1,
0.1958185, -0.9957213, 4.330046, 0, 0.7372549, 1, 1,
0.195821, 1.265955, 1.179955, 0, 0.7294118, 1, 1,
0.1971938, -1.418444, 3.061506, 0, 0.7254902, 1, 1,
0.2029987, 0.3046589, 1.416745, 0, 0.7176471, 1, 1,
0.2041954, -0.6459367, 3.854864, 0, 0.7137255, 1, 1,
0.2063006, 0.2181705, 1.939002, 0, 0.7058824, 1, 1,
0.219043, -0.8384981, 5.599557, 0, 0.6980392, 1, 1,
0.2224125, -0.6415462, 1.71183, 0, 0.6941177, 1, 1,
0.2226152, -1.550462, 2.456139, 0, 0.6862745, 1, 1,
0.2277496, -1.09053, 3.804191, 0, 0.682353, 1, 1,
0.2299696, -0.3489649, 2.038084, 0, 0.6745098, 1, 1,
0.2324638, 0.5247104, 2.088391, 0, 0.6705883, 1, 1,
0.2347068, 0.1607026, 0.7608937, 0, 0.6627451, 1, 1,
0.2465835, 0.3512376, 2.127723, 0, 0.6588235, 1, 1,
0.2479216, -1.463073, 4.546213, 0, 0.6509804, 1, 1,
0.2546377, -0.6014681, 2.013291, 0, 0.6470588, 1, 1,
0.2573457, -0.7073917, 3.185887, 0, 0.6392157, 1, 1,
0.2586634, 1.457518, 1.382143, 0, 0.6352941, 1, 1,
0.2628692, 0.4569701, -1.228088, 0, 0.627451, 1, 1,
0.2628766, 1.578442, 0.4003905, 0, 0.6235294, 1, 1,
0.2644308, -0.8954931, 2.247553, 0, 0.6156863, 1, 1,
0.2664239, -1.081146, 1.69806, 0, 0.6117647, 1, 1,
0.2707359, -1.182261, 2.536229, 0, 0.6039216, 1, 1,
0.2720017, -0.4986295, 2.996178, 0, 0.5960785, 1, 1,
0.2725104, -1.559224, 2.96834, 0, 0.5921569, 1, 1,
0.2758936, -1.307951, 3.980679, 0, 0.5843138, 1, 1,
0.2821276, 0.4705777, 0.3758056, 0, 0.5803922, 1, 1,
0.2846743, -0.7165138, 3.18786, 0, 0.572549, 1, 1,
0.2859586, 0.8752966, 2.555977, 0, 0.5686275, 1, 1,
0.2886968, 0.4762168, -0.4336049, 0, 0.5607843, 1, 1,
0.2912672, 0.1922805, 1.512795, 0, 0.5568628, 1, 1,
0.2929705, 1.412749, 1.780367, 0, 0.5490196, 1, 1,
0.300914, -0.3348879, 2.228333, 0, 0.5450981, 1, 1,
0.3019368, -0.0143529, 5.155325, 0, 0.5372549, 1, 1,
0.3031116, -1.145835, 2.802751, 0, 0.5333334, 1, 1,
0.3110514, -0.5434995, 1.873439, 0, 0.5254902, 1, 1,
0.3129968, 0.7732927, -0.1349275, 0, 0.5215687, 1, 1,
0.3149593, -1.33247, 2.771232, 0, 0.5137255, 1, 1,
0.3163675, 2.178272, -1.206308, 0, 0.509804, 1, 1,
0.3165376, -0.2005595, 0.2808081, 0, 0.5019608, 1, 1,
0.3168983, -0.6050802, 4.235768, 0, 0.4941176, 1, 1,
0.3213738, -0.4439142, 1.368403, 0, 0.4901961, 1, 1,
0.3222101, 0.884403, 0.05297855, 0, 0.4823529, 1, 1,
0.3272394, 2.098997, -0.6218778, 0, 0.4784314, 1, 1,
0.3275565, 0.4605088, 0.2877114, 0, 0.4705882, 1, 1,
0.3336183, 1.525067, -0.1869359, 0, 0.4666667, 1, 1,
0.3346025, -2.517301, 3.796739, 0, 0.4588235, 1, 1,
0.3386133, 0.5332277, 0.2841776, 0, 0.454902, 1, 1,
0.3419994, -0.3297556, 3.064653, 0, 0.4470588, 1, 1,
0.3445827, 0.5089951, 0.3509168, 0, 0.4431373, 1, 1,
0.3462417, -1.869785, 1.677491, 0, 0.4352941, 1, 1,
0.3503996, 0.080341, 1.453326, 0, 0.4313726, 1, 1,
0.3531101, -0.6509982, 2.475386, 0, 0.4235294, 1, 1,
0.3574249, 0.07997502, 1.748288, 0, 0.4196078, 1, 1,
0.3592443, -2.140709, 4.566356, 0, 0.4117647, 1, 1,
0.3598721, 0.1965674, -0.1642518, 0, 0.4078431, 1, 1,
0.3611132, -0.8185981, 2.468467, 0, 0.4, 1, 1,
0.3638376, 0.2287588, 1.585392, 0, 0.3921569, 1, 1,
0.3656666, 1.009451, 1.352034, 0, 0.3882353, 1, 1,
0.368277, -1.561287, 3.227403, 0, 0.3803922, 1, 1,
0.368904, 2.04366, -2.269642, 0, 0.3764706, 1, 1,
0.3698711, -0.71706, -0.8417973, 0, 0.3686275, 1, 1,
0.3714232, -0.5198418, 0.7857718, 0, 0.3647059, 1, 1,
0.3750634, 1.528096, 0.5242073, 0, 0.3568628, 1, 1,
0.3762282, 0.426672, 0.6173543, 0, 0.3529412, 1, 1,
0.3765659, -1.296468, 2.993017, 0, 0.345098, 1, 1,
0.3820843, 0.2717523, 1.18895, 0, 0.3411765, 1, 1,
0.3847876, 0.908342, -0.3345641, 0, 0.3333333, 1, 1,
0.3971939, -2.190428, 3.952729, 0, 0.3294118, 1, 1,
0.4009779, 0.2086573, 1.069412, 0, 0.3215686, 1, 1,
0.4059774, 0.5132808, 0.6196526, 0, 0.3176471, 1, 1,
0.4098592, -0.5658009, 3.327342, 0, 0.3098039, 1, 1,
0.4109763, -0.3173037, 3.107701, 0, 0.3058824, 1, 1,
0.4115733, -1.014814, 3.184906, 0, 0.2980392, 1, 1,
0.4136953, -1.054956, 3.993248, 0, 0.2901961, 1, 1,
0.4141245, 0.04169388, 2.162653, 0, 0.2862745, 1, 1,
0.414483, 0.8373168, -1.208428, 0, 0.2784314, 1, 1,
0.4183039, -1.338566, 3.821647, 0, 0.2745098, 1, 1,
0.4208402, -1.398183, 1.902927, 0, 0.2666667, 1, 1,
0.4211659, -1.345336, 5.767876, 0, 0.2627451, 1, 1,
0.4232424, -1.583067, 2.234004, 0, 0.254902, 1, 1,
0.4254881, -0.8651958, 2.453038, 0, 0.2509804, 1, 1,
0.4295429, -0.001140222, 0.4835722, 0, 0.2431373, 1, 1,
0.4305725, 1.289141, -0.6848903, 0, 0.2392157, 1, 1,
0.4362893, -0.6276106, 2.438077, 0, 0.2313726, 1, 1,
0.4370048, 0.6833001, -0.7263817, 0, 0.227451, 1, 1,
0.4379185, 1.442959, 0.2042488, 0, 0.2196078, 1, 1,
0.4413102, -1.004186, 2.482864, 0, 0.2156863, 1, 1,
0.4422639, 0.6971178, -2.183788, 0, 0.2078431, 1, 1,
0.4444513, -1.397097, 3.15978, 0, 0.2039216, 1, 1,
0.4485657, -0.5971304, 2.377555, 0, 0.1960784, 1, 1,
0.4502444, 0.5919842, 1.110348, 0, 0.1882353, 1, 1,
0.4506007, -0.3980672, 3.047617, 0, 0.1843137, 1, 1,
0.4522116, -2.764684, 1.727661, 0, 0.1764706, 1, 1,
0.4526486, -0.1989078, 0.9825901, 0, 0.172549, 1, 1,
0.4544041, -1.365845, 1.611805, 0, 0.1647059, 1, 1,
0.4554394, -1.005202, 3.956674, 0, 0.1607843, 1, 1,
0.4579765, 0.2455904, 0.9544073, 0, 0.1529412, 1, 1,
0.4594967, -0.6231439, 1.747841, 0, 0.1490196, 1, 1,
0.4608001, 0.8272594, 0.9493364, 0, 0.1411765, 1, 1,
0.4610835, 0.3103497, 1.035819, 0, 0.1372549, 1, 1,
0.4611024, 0.1204136, 1.361959, 0, 0.1294118, 1, 1,
0.4642764, 0.5722204, 0.6536945, 0, 0.1254902, 1, 1,
0.4680826, 0.4404092, 0.9727929, 0, 0.1176471, 1, 1,
0.4733667, 2.058753, 0.7126174, 0, 0.1137255, 1, 1,
0.4734384, -0.5231813, 1.521085, 0, 0.1058824, 1, 1,
0.4784718, 1.49464, -0.1837136, 0, 0.09803922, 1, 1,
0.4852915, 1.099442, -0.4995147, 0, 0.09411765, 1, 1,
0.488601, -0.1075975, -0.2856199, 0, 0.08627451, 1, 1,
0.4907976, -0.2567798, 1.797232, 0, 0.08235294, 1, 1,
0.493144, -0.1369549, 1.272063, 0, 0.07450981, 1, 1,
0.4956148, 0.05552053, 2.643568, 0, 0.07058824, 1, 1,
0.4982282, 0.7337929, -0.9768358, 0, 0.0627451, 1, 1,
0.5109563, -0.5818776, 1.53711, 0, 0.05882353, 1, 1,
0.5182371, 0.08877794, 4.170317, 0, 0.05098039, 1, 1,
0.5187474, -0.7147936, 3.032663, 0, 0.04705882, 1, 1,
0.5210815, 1.151543, -0.5090059, 0, 0.03921569, 1, 1,
0.5254714, 1.090497, 0.3754984, 0, 0.03529412, 1, 1,
0.5289398, -0.4292889, 2.922722, 0, 0.02745098, 1, 1,
0.5303202, -0.4692336, 2.678216, 0, 0.02352941, 1, 1,
0.5329797, 1.406995, 1.220354, 0, 0.01568628, 1, 1,
0.534055, -0.9989758, 2.686157, 0, 0.01176471, 1, 1,
0.53441, -1.597249, 1.863811, 0, 0.003921569, 1, 1,
0.5402215, 0.4176248, 0.1481683, 0.003921569, 0, 1, 1,
0.5408534, -1.702451, 3.076358, 0.007843138, 0, 1, 1,
0.5409001, 0.5504634, -2.221553, 0.01568628, 0, 1, 1,
0.5414148, 1.444051, 0.27433, 0.01960784, 0, 1, 1,
0.5433595, 0.2645167, 0.5419091, 0.02745098, 0, 1, 1,
0.5475259, -0.02313052, 0.5720823, 0.03137255, 0, 1, 1,
0.5509816, 0.6288826, 0.9640746, 0.03921569, 0, 1, 1,
0.553762, -0.2799135, 2.075115, 0.04313726, 0, 1, 1,
0.5540792, -0.2500966, 2.41846, 0.05098039, 0, 1, 1,
0.5563834, 0.4041654, 3.468668, 0.05490196, 0, 1, 1,
0.5641562, -1.054725, 2.501729, 0.0627451, 0, 1, 1,
0.5647721, -0.3923155, 1.046517, 0.06666667, 0, 1, 1,
0.5649577, -0.580084, 1.307317, 0.07450981, 0, 1, 1,
0.5693263, -1.149223, 0.6289099, 0.07843138, 0, 1, 1,
0.5704747, -1.509878, 1.172325, 0.08627451, 0, 1, 1,
0.5722588, 0.887015, 0.5456707, 0.09019608, 0, 1, 1,
0.5738253, 0.19934, 0.4615253, 0.09803922, 0, 1, 1,
0.5740027, -0.8080159, 3.181501, 0.1058824, 0, 1, 1,
0.5747425, 0.2790879, 0.8871176, 0.1098039, 0, 1, 1,
0.5767721, 0.7857725, -0.508154, 0.1176471, 0, 1, 1,
0.5780457, 0.943542, -0.7038301, 0.1215686, 0, 1, 1,
0.5808778, -0.9874404, 1.483113, 0.1294118, 0, 1, 1,
0.5809422, 3.159285, -1.43844, 0.1333333, 0, 1, 1,
0.5813711, 0.2340253, 1.044241, 0.1411765, 0, 1, 1,
0.5889987, 0.1820714, 1.149721, 0.145098, 0, 1, 1,
0.5943251, -1.039617, 1.290101, 0.1529412, 0, 1, 1,
0.5945541, 2.094475, -0.7057397, 0.1568628, 0, 1, 1,
0.5981241, -0.4651344, 1.26832, 0.1647059, 0, 1, 1,
0.604589, 0.01638396, 1.757624, 0.1686275, 0, 1, 1,
0.605177, 0.03933647, 1.556614, 0.1764706, 0, 1, 1,
0.6054825, -0.9306484, 3.013915, 0.1803922, 0, 1, 1,
0.6085555, -0.0889428, 3.543832, 0.1882353, 0, 1, 1,
0.6113002, 0.1359142, 2.442776, 0.1921569, 0, 1, 1,
0.6122369, 1.810757, 0.5861441, 0.2, 0, 1, 1,
0.6178451, 0.09813145, 2.203085, 0.2078431, 0, 1, 1,
0.6187799, 0.7885784, -0.1253564, 0.2117647, 0, 1, 1,
0.6194639, -0.5565915, 0.8952228, 0.2196078, 0, 1, 1,
0.6222675, -0.980558, 2.784437, 0.2235294, 0, 1, 1,
0.6239001, -0.6761673, 1.30073, 0.2313726, 0, 1, 1,
0.6266686, -0.1628782, 2.955121, 0.2352941, 0, 1, 1,
0.629903, 0.15883, 1.763816, 0.2431373, 0, 1, 1,
0.6304376, -1.01177, 1.277359, 0.2470588, 0, 1, 1,
0.6313542, -0.07337435, 1.096185, 0.254902, 0, 1, 1,
0.6341101, 0.5313186, 0.8399184, 0.2588235, 0, 1, 1,
0.643118, 0.5056338, -0.1853598, 0.2666667, 0, 1, 1,
0.6440406, 0.01551388, 3.2201, 0.2705882, 0, 1, 1,
0.6524038, 1.125738, 0.3259749, 0.2784314, 0, 1, 1,
0.6530344, -0.1949672, 0.4976119, 0.282353, 0, 1, 1,
0.6589737, -0.5860155, 3.785362, 0.2901961, 0, 1, 1,
0.6596245, 2.733298, -0.6774715, 0.2941177, 0, 1, 1,
0.6622177, -0.4569843, 1.435218, 0.3019608, 0, 1, 1,
0.6627476, 1.186094, -0.06914914, 0.3098039, 0, 1, 1,
0.6631951, -1.500019, 2.466878, 0.3137255, 0, 1, 1,
0.66537, 1.317314, -0.6558484, 0.3215686, 0, 1, 1,
0.6669812, -0.4475843, 1.361645, 0.3254902, 0, 1, 1,
0.6707705, 0.03988378, 4.083452, 0.3333333, 0, 1, 1,
0.6713536, 0.7846081, 1.546437, 0.3372549, 0, 1, 1,
0.6755413, -1.62723, 2.573117, 0.345098, 0, 1, 1,
0.6757562, 0.3151022, -0.2110769, 0.3490196, 0, 1, 1,
0.6790624, 0.00736709, 2.689144, 0.3568628, 0, 1, 1,
0.6796274, 0.5330166, 0.5682212, 0.3607843, 0, 1, 1,
0.6857418, -0.4871938, 3.014204, 0.3686275, 0, 1, 1,
0.6871718, -0.5917574, 2.37908, 0.372549, 0, 1, 1,
0.6903911, 0.1159521, 3.434977, 0.3803922, 0, 1, 1,
0.6974508, -0.548015, 2.780499, 0.3843137, 0, 1, 1,
0.7001186, 1.087931, 1.91396, 0.3921569, 0, 1, 1,
0.7020066, -0.214035, 2.608727, 0.3960784, 0, 1, 1,
0.7032763, 0.4571283, -0.5333716, 0.4039216, 0, 1, 1,
0.7041848, 1.171924, 2.218421, 0.4117647, 0, 1, 1,
0.7070259, -1.731865, 2.340968, 0.4156863, 0, 1, 1,
0.7074914, -0.361364, 2.266631, 0.4235294, 0, 1, 1,
0.7077886, 0.135096, 1.630136, 0.427451, 0, 1, 1,
0.7141365, -0.642562, 1.879902, 0.4352941, 0, 1, 1,
0.715471, 1.201086, 0.9510968, 0.4392157, 0, 1, 1,
0.7190773, -0.2058444, 0.8610955, 0.4470588, 0, 1, 1,
0.7206574, -0.4713225, 2.43861, 0.4509804, 0, 1, 1,
0.7241851, -0.7154517, 1.600336, 0.4588235, 0, 1, 1,
0.7288045, 1.54169, -0.5839143, 0.4627451, 0, 1, 1,
0.729924, 1.403666, 1.834872, 0.4705882, 0, 1, 1,
0.7312018, -1.857823, 3.779325, 0.4745098, 0, 1, 1,
0.7315021, -1.007709, 2.264128, 0.4823529, 0, 1, 1,
0.7395692, -0.1633316, 1.47339, 0.4862745, 0, 1, 1,
0.7414445, 1.083737, 2.658327, 0.4941176, 0, 1, 1,
0.7422696, -0.2963668, 2.230445, 0.5019608, 0, 1, 1,
0.7432447, -1.317632, 1.712336, 0.5058824, 0, 1, 1,
0.7470372, -1.104924, 2.920605, 0.5137255, 0, 1, 1,
0.7512123, 0.1424592, 2.134458, 0.5176471, 0, 1, 1,
0.7524824, -1.314815, 2.951503, 0.5254902, 0, 1, 1,
0.7540658, -0.5627145, 2.182841, 0.5294118, 0, 1, 1,
0.7545207, -0.0897222, 1.724943, 0.5372549, 0, 1, 1,
0.7560496, 0.3068763, 2.370083, 0.5411765, 0, 1, 1,
0.756253, -2.731441, 2.988869, 0.5490196, 0, 1, 1,
0.7573102, -0.8192453, 1.553597, 0.5529412, 0, 1, 1,
0.7645798, -0.50494, 3.207913, 0.5607843, 0, 1, 1,
0.7675774, -0.6731696, 1.763729, 0.5647059, 0, 1, 1,
0.7698277, 0.7007356, 1.434421, 0.572549, 0, 1, 1,
0.7707726, 0.7167436, 1.70006, 0.5764706, 0, 1, 1,
0.7718219, -2.269536, -0.172903, 0.5843138, 0, 1, 1,
0.7723604, -0.4206511, 3.103831, 0.5882353, 0, 1, 1,
0.7780355, -0.6848084, 3.520168, 0.5960785, 0, 1, 1,
0.781396, 1.598196, 1.882153, 0.6039216, 0, 1, 1,
0.785403, 0.3006368, 3.080534, 0.6078432, 0, 1, 1,
0.7866025, 1.83269, 2.080087, 0.6156863, 0, 1, 1,
0.7901259, 0.1416286, 1.074463, 0.6196079, 0, 1, 1,
0.790849, -1.412833, 1.715971, 0.627451, 0, 1, 1,
0.7941887, 0.1488586, -1.426764, 0.6313726, 0, 1, 1,
0.7946637, 0.07650402, 3.857136, 0.6392157, 0, 1, 1,
0.7956408, 0.4266916, 0.5915828, 0.6431373, 0, 1, 1,
0.7975698, 0.3537615, -0.02958485, 0.6509804, 0, 1, 1,
0.7986498, 0.7752451, 0.2462008, 0.654902, 0, 1, 1,
0.7998751, 0.4256753, 0.7938887, 0.6627451, 0, 1, 1,
0.8011688, 0.3911197, 2.82005, 0.6666667, 0, 1, 1,
0.8043225, -0.2849564, 1.231149, 0.6745098, 0, 1, 1,
0.8062542, -0.7987082, 1.592254, 0.6784314, 0, 1, 1,
0.8089648, 1.461941, -2.267149, 0.6862745, 0, 1, 1,
0.8101226, 0.04620138, 4.106816, 0.6901961, 0, 1, 1,
0.8109518, 0.009984376, -0.1379907, 0.6980392, 0, 1, 1,
0.829604, 1.222519, -1.637665, 0.7058824, 0, 1, 1,
0.8390822, 0.2468069, 1.857267, 0.7098039, 0, 1, 1,
0.8402537, 0.6984512, 1.837648, 0.7176471, 0, 1, 1,
0.8405299, 1.356992, 1.727579, 0.7215686, 0, 1, 1,
0.8413619, 0.7354893, 2.981597, 0.7294118, 0, 1, 1,
0.845755, -0.3942072, 2.797937, 0.7333333, 0, 1, 1,
0.8461127, 0.4913814, 0.05544638, 0.7411765, 0, 1, 1,
0.8495163, 2.112826, 1.805714, 0.7450981, 0, 1, 1,
0.8572846, 0.5341055, 0.2773432, 0.7529412, 0, 1, 1,
0.8595557, 0.9239841, 0.5571809, 0.7568628, 0, 1, 1,
0.8642302, 0.05876897, 1.512441, 0.7647059, 0, 1, 1,
0.8672379, 0.8459342, 2.144304, 0.7686275, 0, 1, 1,
0.8690903, -1.622815, 3.043811, 0.7764706, 0, 1, 1,
0.8701553, -0.2899851, 2.152031, 0.7803922, 0, 1, 1,
0.8730831, -2.414274, 0.8534025, 0.7882353, 0, 1, 1,
0.8762771, -0.460229, 2.338384, 0.7921569, 0, 1, 1,
0.8791026, 0.03296981, 1.433747, 0.8, 0, 1, 1,
0.8869873, 0.8493201, -0.367339, 0.8078431, 0, 1, 1,
0.8885936, -1.465819, 4.244943, 0.8117647, 0, 1, 1,
0.8911303, -0.6059899, 1.969883, 0.8196079, 0, 1, 1,
0.900164, -0.4453126, 1.478848, 0.8235294, 0, 1, 1,
0.9006484, -0.1964419, 2.942711, 0.8313726, 0, 1, 1,
0.9059842, 1.684186, -1.115477, 0.8352941, 0, 1, 1,
0.9154052, -0.9385168, 2.052484, 0.8431373, 0, 1, 1,
0.9199408, 0.8353914, -0.5622437, 0.8470588, 0, 1, 1,
0.9203448, -0.3991994, 0.8688098, 0.854902, 0, 1, 1,
0.9247424, 0.5182151, 1.495782, 0.8588235, 0, 1, 1,
0.938381, -0.8158559, 2.268826, 0.8666667, 0, 1, 1,
0.9388516, -0.354954, 1.948264, 0.8705882, 0, 1, 1,
0.9504133, -1.445119, 4.419537, 0.8784314, 0, 1, 1,
0.9579984, 0.5223016, 0.5287037, 0.8823529, 0, 1, 1,
0.9633195, -0.4221413, 2.471481, 0.8901961, 0, 1, 1,
0.9674716, -0.8678238, 2.657712, 0.8941177, 0, 1, 1,
0.9683602, 1.317204, 1.13467, 0.9019608, 0, 1, 1,
0.969485, 1.007432, 0.03556737, 0.9098039, 0, 1, 1,
0.9707966, 0.32111, 1.831783, 0.9137255, 0, 1, 1,
0.9758227, -1.089658, 3.028764, 0.9215686, 0, 1, 1,
0.9777113, -0.9757316, 3.44573, 0.9254902, 0, 1, 1,
0.9788378, 0.6200531, 2.568758, 0.9333333, 0, 1, 1,
0.9868358, 0.1228241, 1.971219, 0.9372549, 0, 1, 1,
0.9912695, 0.7066542, 3.138008, 0.945098, 0, 1, 1,
0.9966622, -1.241703, 2.266732, 0.9490196, 0, 1, 1,
1.002433, 2.378024, 1.517752, 0.9568627, 0, 1, 1,
1.002973, -0.06276067, 0.4571196, 0.9607843, 0, 1, 1,
1.007379, 1.026006, 1.59523, 0.9686275, 0, 1, 1,
1.010687, -0.2499976, 1.982862, 0.972549, 0, 1, 1,
1.01298, 1.883739, -0.8721415, 0.9803922, 0, 1, 1,
1.013442, 0.03299279, 1.270392, 0.9843137, 0, 1, 1,
1.018029, -1.277842, 2.468133, 0.9921569, 0, 1, 1,
1.018364, 0.3028037, 0.281199, 0.9960784, 0, 1, 1,
1.046449, 1.092115, 1.583504, 1, 0, 0.9960784, 1,
1.050794, 0.3994872, 0.317371, 1, 0, 0.9882353, 1,
1.053072, 0.1465811, 3.380924, 1, 0, 0.9843137, 1,
1.054672, -1.038257, 3.887953, 1, 0, 0.9764706, 1,
1.054798, -0.7544721, 2.195926, 1, 0, 0.972549, 1,
1.056124, -0.5429432, 1.699419, 1, 0, 0.9647059, 1,
1.057092, -0.000855974, 0.4634839, 1, 0, 0.9607843, 1,
1.063267, 0.4846557, 1.521714, 1, 0, 0.9529412, 1,
1.064911, -0.4614641, 2.684779, 1, 0, 0.9490196, 1,
1.064966, -0.05391563, 3.328248, 1, 0, 0.9411765, 1,
1.069262, 0.05626522, 1.850713, 1, 0, 0.9372549, 1,
1.069325, -0.7443968, -0.3912254, 1, 0, 0.9294118, 1,
1.074403, 0.1343653, 1.447211, 1, 0, 0.9254902, 1,
1.075266, 1.554488, -0.048693, 1, 0, 0.9176471, 1,
1.080412, -0.428356, 2.597796, 1, 0, 0.9137255, 1,
1.086409, 0.6825303, 1.655113, 1, 0, 0.9058824, 1,
1.097804, 0.8483185, 1.807338, 1, 0, 0.9019608, 1,
1.098645, 0.6059477, -0.4467275, 1, 0, 0.8941177, 1,
1.100013, 0.02124634, 1.565181, 1, 0, 0.8862745, 1,
1.107354, 1.641043, 0.2847497, 1, 0, 0.8823529, 1,
1.109051, 0.2526482, -0.3044952, 1, 0, 0.8745098, 1,
1.121456, 0.3442126, 2.373587, 1, 0, 0.8705882, 1,
1.12574, -0.3615031, 2.100026, 1, 0, 0.8627451, 1,
1.140461, 0.4458107, -0.06195191, 1, 0, 0.8588235, 1,
1.142179, -0.9879652, 1.874276, 1, 0, 0.8509804, 1,
1.152325, 1.541637, 0.4228663, 1, 0, 0.8470588, 1,
1.155128, -0.7090797, 4.072073, 1, 0, 0.8392157, 1,
1.165219, 1.685729, 0.05446148, 1, 0, 0.8352941, 1,
1.168352, 0.4026472, -0.111984, 1, 0, 0.827451, 1,
1.169463, -0.1578594, 2.415066, 1, 0, 0.8235294, 1,
1.176519, 0.07093403, 1.551522, 1, 0, 0.8156863, 1,
1.181466, 1.619635, 0.4065489, 1, 0, 0.8117647, 1,
1.186412, 0.3488849, -0.05362144, 1, 0, 0.8039216, 1,
1.186737, -0.05904155, 1.06715, 1, 0, 0.7960784, 1,
1.191872, -1.705043, 1.901292, 1, 0, 0.7921569, 1,
1.192373, 0.9542322, -0.7384007, 1, 0, 0.7843137, 1,
1.193771, -0.3676936, 1.415801, 1, 0, 0.7803922, 1,
1.195203, 2.21253, 1.519873, 1, 0, 0.772549, 1,
1.199059, 1.312353, 1.930818, 1, 0, 0.7686275, 1,
1.206381, -0.1266265, 1.68685, 1, 0, 0.7607843, 1,
1.209526, -0.3017965, 2.903361, 1, 0, 0.7568628, 1,
1.213916, -1.325969, 2.104667, 1, 0, 0.7490196, 1,
1.218947, 0.3026541, 0.8913833, 1, 0, 0.7450981, 1,
1.227847, 0.8215272, 1.783279, 1, 0, 0.7372549, 1,
1.232313, -1.120431, 3.346173, 1, 0, 0.7333333, 1,
1.242655, -2.672178, 2.177649, 1, 0, 0.7254902, 1,
1.243562, 1.463186, 0.674589, 1, 0, 0.7215686, 1,
1.251512, 0.2109752, 1.067465, 1, 0, 0.7137255, 1,
1.268835, -0.4637657, 1.98262, 1, 0, 0.7098039, 1,
1.26938, 0.5139505, 3.051153, 1, 0, 0.7019608, 1,
1.270211, -0.5114971, 2.723515, 1, 0, 0.6941177, 1,
1.278032, -0.7851315, 1.399483, 1, 0, 0.6901961, 1,
1.283453, -0.6281352, 1.921362, 1, 0, 0.682353, 1,
1.298948, 0.3141963, 2.455847, 1, 0, 0.6784314, 1,
1.299427, -0.3104424, 2.97694, 1, 0, 0.6705883, 1,
1.300057, 3.502505, -0.2891503, 1, 0, 0.6666667, 1,
1.303616, -0.310679, 0.8848006, 1, 0, 0.6588235, 1,
1.306173, -0.7763296, 2.23509, 1, 0, 0.654902, 1,
1.31412, 0.5399367, 1.654134, 1, 0, 0.6470588, 1,
1.319277, 0.8473642, 2.481585, 1, 0, 0.6431373, 1,
1.321995, -0.7512646, 3.888137, 1, 0, 0.6352941, 1,
1.32465, -2.526229, 3.799978, 1, 0, 0.6313726, 1,
1.326167, -0.5927839, 1.861273, 1, 0, 0.6235294, 1,
1.328253, 0.5726178, 0.2211039, 1, 0, 0.6196079, 1,
1.333437, 1.469091, 1.186772, 1, 0, 0.6117647, 1,
1.338743, -0.3826858, 0.4319791, 1, 0, 0.6078432, 1,
1.361837, -0.1893654, 0.8169181, 1, 0, 0.6, 1,
1.364595, -1.993523, 1.704449, 1, 0, 0.5921569, 1,
1.367974, -0.3811904, 2.109063, 1, 0, 0.5882353, 1,
1.369587, -0.05699558, 0.815496, 1, 0, 0.5803922, 1,
1.378055, 0.3233219, 1.591067, 1, 0, 0.5764706, 1,
1.380785, 0.008183255, 2.703893, 1, 0, 0.5686275, 1,
1.386622, 0.7535009, 1.485063, 1, 0, 0.5647059, 1,
1.392325, 0.9642366, 1.696647, 1, 0, 0.5568628, 1,
1.393214, -0.9062672, 1.777423, 1, 0, 0.5529412, 1,
1.40401, 1.144114, 0.8760231, 1, 0, 0.5450981, 1,
1.404772, 0.6151332, 0.2692369, 1, 0, 0.5411765, 1,
1.41463, -0.02260967, 1.529011, 1, 0, 0.5333334, 1,
1.415482, -0.3253983, 0.02264702, 1, 0, 0.5294118, 1,
1.420507, -0.3055682, 0.8628067, 1, 0, 0.5215687, 1,
1.420912, -1.627685, 0.7622719, 1, 0, 0.5176471, 1,
1.431154, 0.9126859, 0.8832908, 1, 0, 0.509804, 1,
1.431658, 0.2365746, 2.025143, 1, 0, 0.5058824, 1,
1.443735, 0.1602035, 1.931145, 1, 0, 0.4980392, 1,
1.446166, 1.739646, -0.486461, 1, 0, 0.4901961, 1,
1.455723, -0.07479449, -0.1159926, 1, 0, 0.4862745, 1,
1.462085, -1.359097, 2.066887, 1, 0, 0.4784314, 1,
1.474273, -1.046225, 1.242799, 1, 0, 0.4745098, 1,
1.474338, -0.5109274, 2.306088, 1, 0, 0.4666667, 1,
1.493042, 0.9530427, 0.9624773, 1, 0, 0.4627451, 1,
1.497727, 0.8276963, 0.8366028, 1, 0, 0.454902, 1,
1.506836, -0.408377, 0.5027677, 1, 0, 0.4509804, 1,
1.51537, -0.2780423, 2.17028, 1, 0, 0.4431373, 1,
1.533254, 2.605544, -0.3501482, 1, 0, 0.4392157, 1,
1.535746, -1.106466, 0.6867686, 1, 0, 0.4313726, 1,
1.549604, 0.8517616, 0.950883, 1, 0, 0.427451, 1,
1.55059, -0.2235018, 1.814652, 1, 0, 0.4196078, 1,
1.554417, 1.24736, 1.359459, 1, 0, 0.4156863, 1,
1.561845, -0.8193501, 1.691418, 1, 0, 0.4078431, 1,
1.579985, -0.4552018, 1.823974, 1, 0, 0.4039216, 1,
1.581378, 0.7151938, 0.3225957, 1, 0, 0.3960784, 1,
1.587961, -1.411882, 0.5670683, 1, 0, 0.3882353, 1,
1.58921, -0.1402722, 1.858227, 1, 0, 0.3843137, 1,
1.595031, -2.253289, 3.374652, 1, 0, 0.3764706, 1,
1.59775, -0.9521559, 2.83026, 1, 0, 0.372549, 1,
1.600305, 0.4989478, 1.640038, 1, 0, 0.3647059, 1,
1.608584, 1.624737, 0.8491415, 1, 0, 0.3607843, 1,
1.622679, 0.4452987, 0.495101, 1, 0, 0.3529412, 1,
1.633524, -0.890818, 3.396141, 1, 0, 0.3490196, 1,
1.635444, -1.057978, 2.696728, 1, 0, 0.3411765, 1,
1.645929, -1.629074, 2.786026, 1, 0, 0.3372549, 1,
1.650737, -1.115885, 2.606379, 1, 0, 0.3294118, 1,
1.652507, 0.331706, 0.9695541, 1, 0, 0.3254902, 1,
1.652546, -2.119831, 2.1878, 1, 0, 0.3176471, 1,
1.655888, -0.6934593, 0.5992005, 1, 0, 0.3137255, 1,
1.660755, 0.997425, 1.518836, 1, 0, 0.3058824, 1,
1.660958, -1.47574, 2.115605, 1, 0, 0.2980392, 1,
1.675111, 0.4954195, 0.1026937, 1, 0, 0.2941177, 1,
1.6788, -0.5038951, 1.062496, 1, 0, 0.2862745, 1,
1.694932, 0.6578218, 1.562806, 1, 0, 0.282353, 1,
1.701565, 0.5890331, -0.3650914, 1, 0, 0.2745098, 1,
1.719278, 0.1166562, 2.761442, 1, 0, 0.2705882, 1,
1.722918, -0.5669491, 1.197202, 1, 0, 0.2627451, 1,
1.743077, 1.896809, 1.338975, 1, 0, 0.2588235, 1,
1.745698, 0.2000201, 2.392039, 1, 0, 0.2509804, 1,
1.75044, -0.7722371, 3.383971, 1, 0, 0.2470588, 1,
1.758819, 1.649663, -0.2168401, 1, 0, 0.2392157, 1,
1.763075, -1.577928, 2.799341, 1, 0, 0.2352941, 1,
1.776752, 1.287889, 1.751939, 1, 0, 0.227451, 1,
1.782545, -0.5177083, 2.3839, 1, 0, 0.2235294, 1,
1.7876, 0.09045985, 0.7006651, 1, 0, 0.2156863, 1,
1.789969, 2.029261, 1.703486, 1, 0, 0.2117647, 1,
1.800304, -0.4055381, 1.777897, 1, 0, 0.2039216, 1,
1.823206, 0.03853934, 1.875317, 1, 0, 0.1960784, 1,
1.867495, -0.7894421, 1.768588, 1, 0, 0.1921569, 1,
1.87723, -2.023478, 3.96619, 1, 0, 0.1843137, 1,
1.888914, 1.021067, 1.609478, 1, 0, 0.1803922, 1,
1.911633, -1.584665, 1.04381, 1, 0, 0.172549, 1,
1.925851, 0.8693503, 1.499939, 1, 0, 0.1686275, 1,
1.936479, -0.4483704, 1.292413, 1, 0, 0.1607843, 1,
1.9678, -0.575818, 3.383736, 1, 0, 0.1568628, 1,
1.971168, -0.7757062, 0.6991377, 1, 0, 0.1490196, 1,
2.017408, -0.1327826, 1.425909, 1, 0, 0.145098, 1,
2.036415, 0.9544773, 2.426646, 1, 0, 0.1372549, 1,
2.046916, -0.5359724, 3.159663, 1, 0, 0.1333333, 1,
2.080498, -0.1823104, -0.1372977, 1, 0, 0.1254902, 1,
2.099311, 0.5110329, 2.776574, 1, 0, 0.1215686, 1,
2.101072, 0.7617452, 0.9917284, 1, 0, 0.1137255, 1,
2.143482, 0.4590216, 2.348365, 1, 0, 0.1098039, 1,
2.167942, -1.868316, 3.340324, 1, 0, 0.1019608, 1,
2.174404, -0.7476819, 2.701643, 1, 0, 0.09411765, 1,
2.193038, 0.5985107, 1.092447, 1, 0, 0.09019608, 1,
2.203353, -2.280255, 2.548214, 1, 0, 0.08235294, 1,
2.24777, 0.6071971, 3.381833, 1, 0, 0.07843138, 1,
2.249258, 0.7218535, 1.469216, 1, 0, 0.07058824, 1,
2.28552, -1.477394, 1.974299, 1, 0, 0.06666667, 1,
2.314184, 0.8624135, 1.497329, 1, 0, 0.05882353, 1,
2.329702, -0.001848611, 1.029745, 1, 0, 0.05490196, 1,
2.363574, 0.04920024, 2.399642, 1, 0, 0.04705882, 1,
2.404323, -0.02615272, 0.4750323, 1, 0, 0.04313726, 1,
2.405365, 1.102668, 1.545543, 1, 0, 0.03529412, 1,
2.417463, 0.9215121, 1.924888, 1, 0, 0.03137255, 1,
2.516555, 0.5646793, 2.053815, 1, 0, 0.02352941, 1,
2.774187, 0.5234126, 2.03009, 1, 0, 0.01960784, 1,
2.845508, -0.4729465, 1.048314, 1, 0, 0.01176471, 1,
2.893479, -0.9734967, 2.781793, 1, 0, 0.007843138, 1
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
-0.0614289, -3.826972, -6.474925, 0, -0.5, 0.5, 0.5,
-0.0614289, -3.826972, -6.474925, 1, -0.5, 0.5, 0.5,
-0.0614289, -3.826972, -6.474925, 1, 1.5, 0.5, 0.5,
-0.0614289, -3.826972, -6.474925, 0, 1.5, 0.5, 0.5
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
-4.01805, 0.3689104, -6.474925, 0, -0.5, 0.5, 0.5,
-4.01805, 0.3689104, -6.474925, 1, -0.5, 0.5, 0.5,
-4.01805, 0.3689104, -6.474925, 1, 1.5, 0.5, 0.5,
-4.01805, 0.3689104, -6.474925, 0, 1.5, 0.5, 0.5
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
-4.01805, -3.826972, 0.533673, 0, -0.5, 0.5, 0.5,
-4.01805, -3.826972, 0.533673, 1, -0.5, 0.5, 0.5,
-4.01805, -3.826972, 0.533673, 1, 1.5, 0.5, 0.5,
-4.01805, -3.826972, 0.533673, 0, 1.5, 0.5, 0.5
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
-3, -2.858691, -4.857556,
2, -2.858691, -4.857556,
-3, -2.858691, -4.857556,
-3, -3.020072, -5.127118,
-2, -2.858691, -4.857556,
-2, -3.020072, -5.127118,
-1, -2.858691, -4.857556,
-1, -3.020072, -5.127118,
0, -2.858691, -4.857556,
0, -3.020072, -5.127118,
1, -2.858691, -4.857556,
1, -3.020072, -5.127118,
2, -2.858691, -4.857556,
2, -3.020072, -5.127118
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
-3, -3.342832, -5.666241, 0, -0.5, 0.5, 0.5,
-3, -3.342832, -5.666241, 1, -0.5, 0.5, 0.5,
-3, -3.342832, -5.666241, 1, 1.5, 0.5, 0.5,
-3, -3.342832, -5.666241, 0, 1.5, 0.5, 0.5,
-2, -3.342832, -5.666241, 0, -0.5, 0.5, 0.5,
-2, -3.342832, -5.666241, 1, -0.5, 0.5, 0.5,
-2, -3.342832, -5.666241, 1, 1.5, 0.5, 0.5,
-2, -3.342832, -5.666241, 0, 1.5, 0.5, 0.5,
-1, -3.342832, -5.666241, 0, -0.5, 0.5, 0.5,
-1, -3.342832, -5.666241, 1, -0.5, 0.5, 0.5,
-1, -3.342832, -5.666241, 1, 1.5, 0.5, 0.5,
-1, -3.342832, -5.666241, 0, 1.5, 0.5, 0.5,
0, -3.342832, -5.666241, 0, -0.5, 0.5, 0.5,
0, -3.342832, -5.666241, 1, -0.5, 0.5, 0.5,
0, -3.342832, -5.666241, 1, 1.5, 0.5, 0.5,
0, -3.342832, -5.666241, 0, 1.5, 0.5, 0.5,
1, -3.342832, -5.666241, 0, -0.5, 0.5, 0.5,
1, -3.342832, -5.666241, 1, -0.5, 0.5, 0.5,
1, -3.342832, -5.666241, 1, 1.5, 0.5, 0.5,
1, -3.342832, -5.666241, 0, 1.5, 0.5, 0.5,
2, -3.342832, -5.666241, 0, -0.5, 0.5, 0.5,
2, -3.342832, -5.666241, 1, -0.5, 0.5, 0.5,
2, -3.342832, -5.666241, 1, 1.5, 0.5, 0.5,
2, -3.342832, -5.666241, 0, 1.5, 0.5, 0.5
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
-3.104984, -2, -4.857556,
-3.104984, 3, -4.857556,
-3.104984, -2, -4.857556,
-3.257161, -2, -5.127118,
-3.104984, -1, -4.857556,
-3.257161, -1, -5.127118,
-3.104984, 0, -4.857556,
-3.257161, 0, -5.127118,
-3.104984, 1, -4.857556,
-3.257161, 1, -5.127118,
-3.104984, 2, -4.857556,
-3.257161, 2, -5.127118,
-3.104984, 3, -4.857556,
-3.257161, 3, -5.127118
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
-3.561517, -2, -5.666241, 0, -0.5, 0.5, 0.5,
-3.561517, -2, -5.666241, 1, -0.5, 0.5, 0.5,
-3.561517, -2, -5.666241, 1, 1.5, 0.5, 0.5,
-3.561517, -2, -5.666241, 0, 1.5, 0.5, 0.5,
-3.561517, -1, -5.666241, 0, -0.5, 0.5, 0.5,
-3.561517, -1, -5.666241, 1, -0.5, 0.5, 0.5,
-3.561517, -1, -5.666241, 1, 1.5, 0.5, 0.5,
-3.561517, -1, -5.666241, 0, 1.5, 0.5, 0.5,
-3.561517, 0, -5.666241, 0, -0.5, 0.5, 0.5,
-3.561517, 0, -5.666241, 1, -0.5, 0.5, 0.5,
-3.561517, 0, -5.666241, 1, 1.5, 0.5, 0.5,
-3.561517, 0, -5.666241, 0, 1.5, 0.5, 0.5,
-3.561517, 1, -5.666241, 0, -0.5, 0.5, 0.5,
-3.561517, 1, -5.666241, 1, -0.5, 0.5, 0.5,
-3.561517, 1, -5.666241, 1, 1.5, 0.5, 0.5,
-3.561517, 1, -5.666241, 0, 1.5, 0.5, 0.5,
-3.561517, 2, -5.666241, 0, -0.5, 0.5, 0.5,
-3.561517, 2, -5.666241, 1, -0.5, 0.5, 0.5,
-3.561517, 2, -5.666241, 1, 1.5, 0.5, 0.5,
-3.561517, 2, -5.666241, 0, 1.5, 0.5, 0.5,
-3.561517, 3, -5.666241, 0, -0.5, 0.5, 0.5,
-3.561517, 3, -5.666241, 1, -0.5, 0.5, 0.5,
-3.561517, 3, -5.666241, 1, 1.5, 0.5, 0.5,
-3.561517, 3, -5.666241, 0, 1.5, 0.5, 0.5
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
-3.104984, -2.858691, -4,
-3.104984, -2.858691, 4,
-3.104984, -2.858691, -4,
-3.257161, -3.020072, -4,
-3.104984, -2.858691, -2,
-3.257161, -3.020072, -2,
-3.104984, -2.858691, 0,
-3.257161, -3.020072, 0,
-3.104984, -2.858691, 2,
-3.257161, -3.020072, 2,
-3.104984, -2.858691, 4,
-3.257161, -3.020072, 4
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
-3.561517, -3.342832, -4, 0, -0.5, 0.5, 0.5,
-3.561517, -3.342832, -4, 1, -0.5, 0.5, 0.5,
-3.561517, -3.342832, -4, 1, 1.5, 0.5, 0.5,
-3.561517, -3.342832, -4, 0, 1.5, 0.5, 0.5,
-3.561517, -3.342832, -2, 0, -0.5, 0.5, 0.5,
-3.561517, -3.342832, -2, 1, -0.5, 0.5, 0.5,
-3.561517, -3.342832, -2, 1, 1.5, 0.5, 0.5,
-3.561517, -3.342832, -2, 0, 1.5, 0.5, 0.5,
-3.561517, -3.342832, 0, 0, -0.5, 0.5, 0.5,
-3.561517, -3.342832, 0, 1, -0.5, 0.5, 0.5,
-3.561517, -3.342832, 0, 1, 1.5, 0.5, 0.5,
-3.561517, -3.342832, 0, 0, 1.5, 0.5, 0.5,
-3.561517, -3.342832, 2, 0, -0.5, 0.5, 0.5,
-3.561517, -3.342832, 2, 1, -0.5, 0.5, 0.5,
-3.561517, -3.342832, 2, 1, 1.5, 0.5, 0.5,
-3.561517, -3.342832, 2, 0, 1.5, 0.5, 0.5,
-3.561517, -3.342832, 4, 0, -0.5, 0.5, 0.5,
-3.561517, -3.342832, 4, 1, -0.5, 0.5, 0.5,
-3.561517, -3.342832, 4, 1, 1.5, 0.5, 0.5,
-3.561517, -3.342832, 4, 0, 1.5, 0.5, 0.5
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
-3.104984, -2.858691, -4.857556,
-3.104984, 3.596512, -4.857556,
-3.104984, -2.858691, 5.924902,
-3.104984, 3.596512, 5.924902,
-3.104984, -2.858691, -4.857556,
-3.104984, -2.858691, 5.924902,
-3.104984, 3.596512, -4.857556,
-3.104984, 3.596512, 5.924902,
-3.104984, -2.858691, -4.857556,
2.982126, -2.858691, -4.857556,
-3.104984, -2.858691, 5.924902,
2.982126, -2.858691, 5.924902,
-3.104984, 3.596512, -4.857556,
2.982126, 3.596512, -4.857556,
-3.104984, 3.596512, 5.924902,
2.982126, 3.596512, 5.924902,
2.982126, -2.858691, -4.857556,
2.982126, 3.596512, -4.857556,
2.982126, -2.858691, 5.924902,
2.982126, 3.596512, 5.924902,
2.982126, -2.858691, -4.857556,
2.982126, -2.858691, 5.924902,
2.982126, 3.596512, -4.857556,
2.982126, 3.596512, 5.924902
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
var radius = 7.456326;
var distance = 33.17404;
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
mvMatrix.translate( 0.0614289, -0.3689104, -0.533673 );
mvMatrix.scale( 1.324426, 1.248903, 0.7476891 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.17404);
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
Fluometuron<-read.table("Fluometuron.xyz")
```

```
## Error in read.table("Fluometuron.xyz"): no lines available in input
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
-3.016336, -1.98418, -2.793504, 0, 0, 1, 1, 1,
-2.922119, 0.5034093, 0.4054742, 1, 0, 0, 1, 1,
-2.839272, 0.3939361, -0.9145278, 1, 0, 0, 1, 1,
-2.786933, -0.8435383, -0.6779544, 1, 0, 0, 1, 1,
-2.702287, 2.492258, -0.2880728, 1, 0, 0, 1, 1,
-2.56188, 1.161301, -1.407008, 1, 0, 0, 1, 1,
-2.559857, 0.4619707, -0.8836226, 0, 0, 0, 1, 1,
-2.523387, -0.8685496, -2.200109, 0, 0, 0, 1, 1,
-2.397664, -0.7080427, -2.15204, 0, 0, 0, 1, 1,
-2.397069, -0.5959701, -3.232803, 0, 0, 0, 1, 1,
-2.35965, 0.009031417, -0.620298, 0, 0, 0, 1, 1,
-2.291439, 1.147815, -0.6183445, 0, 0, 0, 1, 1,
-2.282614, 0.02816379, 0.04533878, 0, 0, 0, 1, 1,
-2.245806, -1.437995, -2.592721, 1, 1, 1, 1, 1,
-2.24292, -0.4721372, -1.410624, 1, 1, 1, 1, 1,
-2.22341, 0.4652987, -1.4699, 1, 1, 1, 1, 1,
-2.193505, 0.8223987, -2.606483, 1, 1, 1, 1, 1,
-2.177284, 2.172568, -2.167819, 1, 1, 1, 1, 1,
-2.163827, 1.221866, -2.767951, 1, 1, 1, 1, 1,
-2.141893, -0.247957, -1.32249, 1, 1, 1, 1, 1,
-2.140858, 0.9522084, -1.984191, 1, 1, 1, 1, 1,
-2.137802, -0.6101799, -2.458885, 1, 1, 1, 1, 1,
-2.119053, 1.74484, -2.253154, 1, 1, 1, 1, 1,
-2.092149, 1.050208, 0.4142258, 1, 1, 1, 1, 1,
-2.088811, -0.4089635, -1.15658, 1, 1, 1, 1, 1,
-2.025933, -0.5280527, -0.8182896, 1, 1, 1, 1, 1,
-2.014937, -0.1523258, -2.309977, 1, 1, 1, 1, 1,
-2.008666, -1.616875, -1.683954, 1, 1, 1, 1, 1,
-2.006783, -0.1489895, -1.263908, 0, 0, 1, 1, 1,
-1.992986, -0.2807042, -2.590922, 1, 0, 0, 1, 1,
-1.991709, 0.6579056, -2.348366, 1, 0, 0, 1, 1,
-1.98395, -0.02031333, -2.05931, 1, 0, 0, 1, 1,
-1.956009, 0.9136977, -2.117059, 1, 0, 0, 1, 1,
-1.954362, -0.863442, -2.252028, 1, 0, 0, 1, 1,
-1.934593, -2.32856, -0.9614277, 0, 0, 0, 1, 1,
-1.918036, -0.5238562, -1.469236, 0, 0, 0, 1, 1,
-1.917033, -0.2490102, -0.1133938, 0, 0, 0, 1, 1,
-1.912308, -0.645678, -3.396591, 0, 0, 0, 1, 1,
-1.825036, -0.1775517, -1.030163, 0, 0, 0, 1, 1,
-1.816765, -1.083005, -1.485831, 0, 0, 0, 1, 1,
-1.789786, 1.106891, -0.4422086, 0, 0, 0, 1, 1,
-1.785366, 0.1742164, -3.118735, 1, 1, 1, 1, 1,
-1.767645, 0.08272199, 0.8598451, 1, 1, 1, 1, 1,
-1.742897, 1.380753, -0.2435637, 1, 1, 1, 1, 1,
-1.715714, -0.4337044, -2.140273, 1, 1, 1, 1, 1,
-1.707586, 1.527937, 0.3786044, 1, 1, 1, 1, 1,
-1.692493, 0.2716572, -2.583841, 1, 1, 1, 1, 1,
-1.679787, 1.139389, -1.115718, 1, 1, 1, 1, 1,
-1.671976, 0.498414, -2.00467, 1, 1, 1, 1, 1,
-1.67051, 0.6029587, -0.9457992, 1, 1, 1, 1, 1,
-1.668141, -0.3569947, -3.174229, 1, 1, 1, 1, 1,
-1.651629, -1.64613, -1.835313, 1, 1, 1, 1, 1,
-1.641447, -0.3056144, -2.261953, 1, 1, 1, 1, 1,
-1.626682, -1.011221, -3.165064, 1, 1, 1, 1, 1,
-1.624202, 0.7620909, -1.504855, 1, 1, 1, 1, 1,
-1.623223, 1.664907, -0.9123593, 1, 1, 1, 1, 1,
-1.606622, 0.4187041, -0.5818027, 0, 0, 1, 1, 1,
-1.601964, -0.3086408, -2.285753, 1, 0, 0, 1, 1,
-1.594968, 2.458927, -0.4298341, 1, 0, 0, 1, 1,
-1.58606, 0.8105878, -1.998672, 1, 0, 0, 1, 1,
-1.580575, -0.6435851, -0.9069244, 1, 0, 0, 1, 1,
-1.579289, -0.7497583, -0.3052469, 1, 0, 0, 1, 1,
-1.57793, 1.01289, -0.5741848, 0, 0, 0, 1, 1,
-1.571262, -1.625289, -2.758608, 0, 0, 0, 1, 1,
-1.559187, 0.1842548, -2.910228, 0, 0, 0, 1, 1,
-1.537395, 1.133741, -2.037337, 0, 0, 0, 1, 1,
-1.535525, 0.2246109, -3.384862, 0, 0, 0, 1, 1,
-1.535293, -1.307226, -2.303807, 0, 0, 0, 1, 1,
-1.525144, -0.6538116, -1.435022, 0, 0, 0, 1, 1,
-1.514422, 2.033768, -1.73307, 1, 1, 1, 1, 1,
-1.506822, -0.1519611, -0.4610575, 1, 1, 1, 1, 1,
-1.505769, 1.220464, -1.717469, 1, 1, 1, 1, 1,
-1.497911, 0.5969477, -0.75622, 1, 1, 1, 1, 1,
-1.488784, 0.3204874, -1.779186, 1, 1, 1, 1, 1,
-1.486025, -0.557548, -1.500592, 1, 1, 1, 1, 1,
-1.481169, -0.02723598, -1.817308, 1, 1, 1, 1, 1,
-1.470104, -1.429958, -1.303636, 1, 1, 1, 1, 1,
-1.447854, -0.1452322, -0.7060157, 1, 1, 1, 1, 1,
-1.447091, -0.5437613, -2.57218, 1, 1, 1, 1, 1,
-1.439912, -0.5754982, -1.185486, 1, 1, 1, 1, 1,
-1.437115, -0.2466545, -0.9632519, 1, 1, 1, 1, 1,
-1.433338, -0.1989134, -2.414141, 1, 1, 1, 1, 1,
-1.426733, -0.04666114, -1.030974, 1, 1, 1, 1, 1,
-1.419616, -2.390407, -1.659225, 1, 1, 1, 1, 1,
-1.406728, 1.310507, -0.3586607, 0, 0, 1, 1, 1,
-1.399799, -0.8901028, -2.1775, 1, 0, 0, 1, 1,
-1.399279, -0.2676576, -2.969404, 1, 0, 0, 1, 1,
-1.392124, -0.174871, -2.233361, 1, 0, 0, 1, 1,
-1.390708, -2.108635, -2.039503, 1, 0, 0, 1, 1,
-1.380707, -0.2362756, -2.583427, 1, 0, 0, 1, 1,
-1.376693, 0.1253523, -1.582842, 0, 0, 0, 1, 1,
-1.375207, 0.5152187, -1.211685, 0, 0, 0, 1, 1,
-1.367584, -0.1616326, -1.01016, 0, 0, 0, 1, 1,
-1.356151, -1.101658, -1.482413, 0, 0, 0, 1, 1,
-1.35072, 0.7450827, 0.3228318, 0, 0, 0, 1, 1,
-1.349568, 0.6183348, -2.542305, 0, 0, 0, 1, 1,
-1.343084, 0.1179818, -0.6847172, 0, 0, 0, 1, 1,
-1.327886, 1.023045, -2.298332, 1, 1, 1, 1, 1,
-1.327511, -1.014991, -2.257718, 1, 1, 1, 1, 1,
-1.314387, -0.1690386, -3.653845, 1, 1, 1, 1, 1,
-1.288635, 0.3366264, -0.9964636, 1, 1, 1, 1, 1,
-1.283815, -1.494654, -4.336908, 1, 1, 1, 1, 1,
-1.28183, -0.4488404, -0.5607509, 1, 1, 1, 1, 1,
-1.255906, 1.202659, -0.3631724, 1, 1, 1, 1, 1,
-1.25413, -0.4721393, -0.9558592, 1, 1, 1, 1, 1,
-1.243457, -0.1721603, -3.070269, 1, 1, 1, 1, 1,
-1.229923, 0.02581096, -0.7238845, 1, 1, 1, 1, 1,
-1.229883, -0.2372556, -3.053399, 1, 1, 1, 1, 1,
-1.222458, 0.6002238, -0.3506433, 1, 1, 1, 1, 1,
-1.218622, 0.7078992, -0.308176, 1, 1, 1, 1, 1,
-1.213143, -0.9039764, -3.373385, 1, 1, 1, 1, 1,
-1.210737, -0.2166217, -1.813847, 1, 1, 1, 1, 1,
-1.207734, -1.637826, -1.70672, 0, 0, 1, 1, 1,
-1.205319, 0.4843478, -0.3844895, 1, 0, 0, 1, 1,
-1.200039, 0.4280717, -0.9861196, 1, 0, 0, 1, 1,
-1.197282, 0.4875593, -0.9813401, 1, 0, 0, 1, 1,
-1.197016, -1.010654, -1.467798, 1, 0, 0, 1, 1,
-1.190994, 0.7885177, -1.955758, 1, 0, 0, 1, 1,
-1.185213, 0.8263182, 1.630009, 0, 0, 0, 1, 1,
-1.185047, 0.6523801, -3.43307, 0, 0, 0, 1, 1,
-1.180584, -1.042335, -1.077383, 0, 0, 0, 1, 1,
-1.174374, 0.03720737, -1.46424, 0, 0, 0, 1, 1,
-1.172971, 0.9253784, -2.763216, 0, 0, 0, 1, 1,
-1.17264, 1.034595, -0.2308806, 0, 0, 0, 1, 1,
-1.167406, 0.01312556, -0.7612417, 0, 0, 0, 1, 1,
-1.164423, -0.02550185, -3.323883, 1, 1, 1, 1, 1,
-1.159706, -0.9827501, -2.925424, 1, 1, 1, 1, 1,
-1.144213, 2.775867, -0.009298523, 1, 1, 1, 1, 1,
-1.144196, -0.5783252, -1.245006, 1, 1, 1, 1, 1,
-1.142259, -0.01473184, -2.088474, 1, 1, 1, 1, 1,
-1.139298, -0.9575676, -1.678792, 1, 1, 1, 1, 1,
-1.137457, -1.484212, -3.44535, 1, 1, 1, 1, 1,
-1.133759, -0.7029048, -4.100564, 1, 1, 1, 1, 1,
-1.133421, 0.1664749, -1.536837, 1, 1, 1, 1, 1,
-1.127967, 1.84775, -0.7509439, 1, 1, 1, 1, 1,
-1.127902, 0.6311675, -0.7010357, 1, 1, 1, 1, 1,
-1.118353, 1.210506, 0.2614584, 1, 1, 1, 1, 1,
-1.117383, 0.00921101, -2.441053, 1, 1, 1, 1, 1,
-1.116691, -0.6400353, -3.588871, 1, 1, 1, 1, 1,
-1.11665, -0.9082763, -0.2993677, 1, 1, 1, 1, 1,
-1.114976, 0.64363, -0.05826827, 0, 0, 1, 1, 1,
-1.110498, -1.011214, -2.716955, 1, 0, 0, 1, 1,
-1.109928, -0.08484041, 1.07727, 1, 0, 0, 1, 1,
-1.105647, -0.3699783, -1.081082, 1, 0, 0, 1, 1,
-1.103108, -0.7097758, -1.913445, 1, 0, 0, 1, 1,
-1.102829, 1.208961, -1.184621, 1, 0, 0, 1, 1,
-1.092455, 1.152464, -1.180743, 0, 0, 0, 1, 1,
-1.090303, 1.945417, 0.6161295, 0, 0, 0, 1, 1,
-1.084401, 0.5190467, -0.7388762, 0, 0, 0, 1, 1,
-1.080864, 0.1928339, -0.2243953, 0, 0, 0, 1, 1,
-1.079512, 1.375883, -1.355056, 0, 0, 0, 1, 1,
-1.067028, 0.1381674, -2.207823, 0, 0, 0, 1, 1,
-1.064839, -0.2405556, -4.498167, 0, 0, 0, 1, 1,
-1.062424, -0.8771313, -2.863668, 1, 1, 1, 1, 1,
-1.059528, 0.2502567, -1.407409, 1, 1, 1, 1, 1,
-1.057161, 0.7453324, -0.5815666, 1, 1, 1, 1, 1,
-1.057133, -0.4629716, -2.53617, 1, 1, 1, 1, 1,
-1.048881, 2.053089, -0.5295799, 1, 1, 1, 1, 1,
-1.036206, 0.8462921, -1.950341, 1, 1, 1, 1, 1,
-1.033606, -0.409388, -2.626534, 1, 1, 1, 1, 1,
-1.027417, -0.93183, -3.001372, 1, 1, 1, 1, 1,
-1.025238, -1.990994, -1.09481, 1, 1, 1, 1, 1,
-1.021527, 0.4759048, -1.469401, 1, 1, 1, 1, 1,
-1.019146, -0.8164674, -2.769722, 1, 1, 1, 1, 1,
-1.016294, 2.146854, -0.7623792, 1, 1, 1, 1, 1,
-1.011557, 0.3256558, -1.313237, 1, 1, 1, 1, 1,
-1.004571, -0.2919926, -1.935012, 1, 1, 1, 1, 1,
-1.00097, 1.099612, 0.2327558, 1, 1, 1, 1, 1,
-0.9984605, -0.9251413, -3.167471, 0, 0, 1, 1, 1,
-0.9943441, -0.4334265, -2.569607, 1, 0, 0, 1, 1,
-0.99093, -0.8961131, -1.831056, 1, 0, 0, 1, 1,
-0.9897323, -0.801339, -1.013212, 1, 0, 0, 1, 1,
-0.9811372, 0.02935971, -3.724591, 1, 0, 0, 1, 1,
-0.9667245, -0.6536273, -2.43802, 1, 0, 0, 1, 1,
-0.9661457, -2.217316, -0.8952463, 0, 0, 0, 1, 1,
-0.9558163, 1.930522, -0.7918707, 0, 0, 0, 1, 1,
-0.9521757, 0.7449266, -1.104037, 0, 0, 0, 1, 1,
-0.9519636, 0.4976281, -0.6526119, 0, 0, 0, 1, 1,
-0.9437491, -0.4516545, -3.261417, 0, 0, 0, 1, 1,
-0.9372119, 0.4783809, -2.269921, 0, 0, 0, 1, 1,
-0.9337473, -0.4227554, -2.048839, 0, 0, 0, 1, 1,
-0.9330978, 0.03238328, -2.288465, 1, 1, 1, 1, 1,
-0.9324699, -0.8668585, -2.958284, 1, 1, 1, 1, 1,
-0.9273909, -0.1353178, -1.031539, 1, 1, 1, 1, 1,
-0.9252013, 1.808128, 1.56167, 1, 1, 1, 1, 1,
-0.9240465, 0.7268312, -0.5600798, 1, 1, 1, 1, 1,
-0.9238375, 0.5907432, 0.5507029, 1, 1, 1, 1, 1,
-0.923062, -1.096928, -3.748982, 1, 1, 1, 1, 1,
-0.9228387, 2.06672, -0.3599346, 1, 1, 1, 1, 1,
-0.9208788, 1.158435, -1.668184, 1, 1, 1, 1, 1,
-0.9195957, 0.05597831, 0.488603, 1, 1, 1, 1, 1,
-0.9081752, 0.4625354, -2.398583, 1, 1, 1, 1, 1,
-0.9052398, -0.2174921, -2.845427, 1, 1, 1, 1, 1,
-0.9043385, -0.04753194, -1.331804, 1, 1, 1, 1, 1,
-0.9036691, -0.7729095, -3.398555, 1, 1, 1, 1, 1,
-0.8998197, 0.3161652, -2.93061, 1, 1, 1, 1, 1,
-0.8936478, -1.257434, -3.102953, 0, 0, 1, 1, 1,
-0.8886132, -1.146164, -2.114441, 1, 0, 0, 1, 1,
-0.8789415, 0.06924891, -0.7604561, 1, 0, 0, 1, 1,
-0.8651759, 0.7182849, -1.621258, 1, 0, 0, 1, 1,
-0.8549168, -0.08811701, -2.746579, 1, 0, 0, 1, 1,
-0.843178, -1.692285, -3.741156, 1, 0, 0, 1, 1,
-0.8344413, 0.4699301, 0.2339531, 0, 0, 0, 1, 1,
-0.8328478, 0.7541195, -1.573173, 0, 0, 0, 1, 1,
-0.8285484, 0.6542878, 0.1991231, 0, 0, 0, 1, 1,
-0.8282128, 0.791932, -3.323071, 0, 0, 0, 1, 1,
-0.8272375, 0.1257877, -0.04316346, 0, 0, 0, 1, 1,
-0.8252249, -0.107765, -1.350563, 0, 0, 0, 1, 1,
-0.8204186, -1.160311, -1.725102, 0, 0, 0, 1, 1,
-0.818475, 0.3502829, -2.101009, 1, 1, 1, 1, 1,
-0.8180553, 0.2100786, -2.950445, 1, 1, 1, 1, 1,
-0.8148292, -0.05551736, -2.183236, 1, 1, 1, 1, 1,
-0.8104747, 0.09002426, -2.201436, 1, 1, 1, 1, 1,
-0.8022773, -2.201021, -1.725986, 1, 1, 1, 1, 1,
-0.8021737, -0.9469553, -2.80082, 1, 1, 1, 1, 1,
-0.8007005, 0.8587328, -1.761974, 1, 1, 1, 1, 1,
-0.7983385, 0.3956917, -0.8796601, 1, 1, 1, 1, 1,
-0.7973075, 1.15242, 0.7906709, 1, 1, 1, 1, 1,
-0.7972909, 0.7282119, 0.1945565, 1, 1, 1, 1, 1,
-0.7881464, 0.03661731, -1.178181, 1, 1, 1, 1, 1,
-0.7850046, 0.1861497, -2.900794, 1, 1, 1, 1, 1,
-0.7798135, -0.4731448, -2.173506, 1, 1, 1, 1, 1,
-0.7758805, -0.5861899, -2.180261, 1, 1, 1, 1, 1,
-0.7757529, 1.763824, -1.314919, 1, 1, 1, 1, 1,
-0.7742897, 1.004065, -1.767966, 0, 0, 1, 1, 1,
-0.7726204, 0.7580568, 0.9011489, 1, 0, 0, 1, 1,
-0.7714422, -0.7966295, -0.9374074, 1, 0, 0, 1, 1,
-0.7624697, 0.1397182, -1.255459, 1, 0, 0, 1, 1,
-0.7608475, 0.8029238, -1.225856, 1, 0, 0, 1, 1,
-0.7601278, 0.1971318, -3.041324, 1, 0, 0, 1, 1,
-0.7553201, -1.762171, -2.117836, 0, 0, 0, 1, 1,
-0.7543293, -0.3523192, -1.733465, 0, 0, 0, 1, 1,
-0.7487239, 0.717517, -2.834478, 0, 0, 0, 1, 1,
-0.7425798, -0.8290892, -1.637831, 0, 0, 0, 1, 1,
-0.7402947, 0.6565204, -2.005274, 0, 0, 0, 1, 1,
-0.7392648, 0.03335218, -0.5630244, 0, 0, 0, 1, 1,
-0.7355889, 0.05246989, -1.712682, 0, 0, 0, 1, 1,
-0.7275321, -0.5760379, -0.8493983, 1, 1, 1, 1, 1,
-0.725915, 0.05370328, -2.312829, 1, 1, 1, 1, 1,
-0.7253522, 0.6495013, 0.1854119, 1, 1, 1, 1, 1,
-0.7238533, 0.426529, -3.298131, 1, 1, 1, 1, 1,
-0.7235053, 0.05849182, -2.135604, 1, 1, 1, 1, 1,
-0.7152098, 0.8294143, 0.3787816, 1, 1, 1, 1, 1,
-0.7088834, 0.06107955, -1.603344, 1, 1, 1, 1, 1,
-0.7081032, -0.8008845, -3.037737, 1, 1, 1, 1, 1,
-0.7054474, -0.04406455, -1.68534, 1, 1, 1, 1, 1,
-0.7019397, 0.9294484, -1.857727, 1, 1, 1, 1, 1,
-0.6852699, 1.11489, -1.038229, 1, 1, 1, 1, 1,
-0.6804736, -1.028722, -3.203695, 1, 1, 1, 1, 1,
-0.6802742, -0.1109827, -1.300458, 1, 1, 1, 1, 1,
-0.6741565, -0.6933607, -2.502321, 1, 1, 1, 1, 1,
-0.6702169, 0.7529448, -0.4835162, 1, 1, 1, 1, 1,
-0.6683471, -1.713894, -2.7372, 0, 0, 1, 1, 1,
-0.6680883, 1.174775, -0.1242208, 1, 0, 0, 1, 1,
-0.6661438, 0.8416587, -0.8446136, 1, 0, 0, 1, 1,
-0.6621283, 0.4752731, -1.051754, 1, 0, 0, 1, 1,
-0.6563194, -0.8959351, -2.823367, 1, 0, 0, 1, 1,
-0.651251, -0.8765433, -1.37602, 1, 0, 0, 1, 1,
-0.6489337, 0.1503527, -0.08282194, 0, 0, 0, 1, 1,
-0.6418616, 1.011051, -0.9152044, 0, 0, 0, 1, 1,
-0.6384268, -1.10912, -3.043229, 0, 0, 0, 1, 1,
-0.6374685, 1.116781, -1.551706, 0, 0, 0, 1, 1,
-0.6332527, -1.421193, -1.69809, 0, 0, 0, 1, 1,
-0.6197613, -1.535493, -4.70053, 0, 0, 0, 1, 1,
-0.6142165, 0.6508752, 0.8263012, 0, 0, 0, 1, 1,
-0.6128882, 0.1088126, 0.374995, 1, 1, 1, 1, 1,
-0.6128576, -0.9609793, -2.438967, 1, 1, 1, 1, 1,
-0.6089612, 0.7493574, -1.789403, 1, 1, 1, 1, 1,
-0.6064704, -0.8555155, -2.571291, 1, 1, 1, 1, 1,
-0.6058808, -0.5708116, -2.710562, 1, 1, 1, 1, 1,
-0.6041424, -0.5627428, -2.335336, 1, 1, 1, 1, 1,
-0.6030887, 1.295895, 0.6639643, 1, 1, 1, 1, 1,
-0.6013476, 1.318852, -2.678529, 1, 1, 1, 1, 1,
-0.59987, -0.8185825, -2.654386, 1, 1, 1, 1, 1,
-0.596673, 0.7945804, 0.8665954, 1, 1, 1, 1, 1,
-0.5956246, -0.4015126, -2.706537, 1, 1, 1, 1, 1,
-0.5945367, -0.03070983, -1.430678, 1, 1, 1, 1, 1,
-0.5931808, -0.02025977, -0.2149283, 1, 1, 1, 1, 1,
-0.5904126, 0.1043163, -2.45851, 1, 1, 1, 1, 1,
-0.5890026, 1.895611, -0.09394401, 1, 1, 1, 1, 1,
-0.5853998, -0.3801278, -1.996859, 0, 0, 1, 1, 1,
-0.583761, 0.1192242, -0.9989663, 1, 0, 0, 1, 1,
-0.5833105, 2.682244, 0.3782915, 1, 0, 0, 1, 1,
-0.5797092, -0.4510555, -3.250066, 1, 0, 0, 1, 1,
-0.5791248, -1.88657, -1.881787, 1, 0, 0, 1, 1,
-0.5778766, 0.9273243, 0.1532221, 1, 0, 0, 1, 1,
-0.5745355, 2.429028, -0.6727138, 0, 0, 0, 1, 1,
-0.5740789, -0.1296471, 0.2985483, 0, 0, 0, 1, 1,
-0.568884, -1.364645, -3.379242, 0, 0, 0, 1, 1,
-0.5676648, -0.7990232, -2.133343, 0, 0, 0, 1, 1,
-0.5643114, 0.1312116, -1.922058, 0, 0, 0, 1, 1,
-0.5630051, 1.781528, 1.008815, 0, 0, 0, 1, 1,
-0.5611058, 0.003449583, -1.417359, 0, 0, 0, 1, 1,
-0.5585592, 0.8805889, 0.1245274, 1, 1, 1, 1, 1,
-0.5560868, -0.6544012, -2.067155, 1, 1, 1, 1, 1,
-0.5485205, 0.3804253, -0.08768179, 1, 1, 1, 1, 1,
-0.5468552, 0.6278875, -0.8366953, 1, 1, 1, 1, 1,
-0.5460867, 0.9091259, -0.6688063, 1, 1, 1, 1, 1,
-0.5433792, -0.2231084, -2.094908, 1, 1, 1, 1, 1,
-0.5390224, -0.7701741, -0.8036491, 1, 1, 1, 1, 1,
-0.5343087, -0.5408368, -0.1369228, 1, 1, 1, 1, 1,
-0.5341411, -1.255324, -3.577213, 1, 1, 1, 1, 1,
-0.5314313, 0.184442, 0.399704, 1, 1, 1, 1, 1,
-0.5311084, 1.160056, 1.292102, 1, 1, 1, 1, 1,
-0.5308973, 0.9431375, -0.4938671, 1, 1, 1, 1, 1,
-0.5289627, 0.2252485, -1.839185, 1, 1, 1, 1, 1,
-0.5257639, 1.116564, -2.330576, 1, 1, 1, 1, 1,
-0.5255837, -0.5628625, -1.17158, 1, 1, 1, 1, 1,
-0.5245622, 0.5678463, 0.614425, 0, 0, 1, 1, 1,
-0.5232596, 0.8096184, -3.061688, 1, 0, 0, 1, 1,
-0.5174885, -0.262125, -2.086875, 1, 0, 0, 1, 1,
-0.5164475, 0.02548297, -1.592235, 1, 0, 0, 1, 1,
-0.5131937, -0.8647805, -4.38638, 1, 0, 0, 1, 1,
-0.5117713, 0.7255822, -0.6784998, 1, 0, 0, 1, 1,
-0.5025619, -2.504674, -3.451114, 0, 0, 0, 1, 1,
-0.5010254, 1.312429, -2.325607, 0, 0, 0, 1, 1,
-0.4937045, 1.200378, -1.380746, 0, 0, 0, 1, 1,
-0.4893907, 0.401285, -1.145828, 0, 0, 0, 1, 1,
-0.4851971, 0.5557352, -0.7639075, 0, 0, 0, 1, 1,
-0.4813071, 0.3156791, -1.372776, 0, 0, 0, 1, 1,
-0.4789147, 0.7369435, -0.3454577, 0, 0, 0, 1, 1,
-0.4770894, 0.1151949, 0.3382213, 1, 1, 1, 1, 1,
-0.4768033, -0.4317829, -1.441902, 1, 1, 1, 1, 1,
-0.4758894, 0.3439173, -0.7848097, 1, 1, 1, 1, 1,
-0.4637262, -1.493237, -2.134217, 1, 1, 1, 1, 1,
-0.4601586, -1.474276, -2.245093, 1, 1, 1, 1, 1,
-0.4495832, -1.683294, -4.476185, 1, 1, 1, 1, 1,
-0.4440163, 0.009273752, -1.747992, 1, 1, 1, 1, 1,
-0.4394967, -1.331833, -2.49287, 1, 1, 1, 1, 1,
-0.4312037, 0.1218086, -1.036621, 1, 1, 1, 1, 1,
-0.4264679, -0.7422988, 0.2909619, 1, 1, 1, 1, 1,
-0.4246064, -0.185242, -0.4574927, 1, 1, 1, 1, 1,
-0.4245981, 0.5345249, -1.844739, 1, 1, 1, 1, 1,
-0.4225782, -0.9326365, -3.667387, 1, 1, 1, 1, 1,
-0.4217363, -0.3767008, -0.6280355, 1, 1, 1, 1, 1,
-0.4158169, -0.5690078, -2.514326, 1, 1, 1, 1, 1,
-0.4088392, -1.403847, -2.942666, 0, 0, 1, 1, 1,
-0.4085789, 0.008154943, -2.229087, 1, 0, 0, 1, 1,
-0.401657, 0.32044, -1.637581, 1, 0, 0, 1, 1,
-0.4013615, -0.04269126, -0.4702011, 1, 0, 0, 1, 1,
-0.3984272, 1.049952, -0.9190524, 1, 0, 0, 1, 1,
-0.3950764, 0.3743111, -1.47196, 1, 0, 0, 1, 1,
-0.3941544, 0.5765356, -0.3815387, 0, 0, 0, 1, 1,
-0.3933987, 0.3885625, -1.267257, 0, 0, 0, 1, 1,
-0.3854203, 0.3839947, -2.565558, 0, 0, 0, 1, 1,
-0.3812158, 0.8544585, -0.1630298, 0, 0, 0, 1, 1,
-0.3770273, -0.8106103, -3.866684, 0, 0, 0, 1, 1,
-0.3708921, 1.650379, -0.05312856, 0, 0, 0, 1, 1,
-0.3675762, 0.4869232, 0.6187617, 0, 0, 0, 1, 1,
-0.3652682, -0.0222645, -1.398625, 1, 1, 1, 1, 1,
-0.3641332, -0.9283293, -3.574566, 1, 1, 1, 1, 1,
-0.3593305, 1.059849, -2.04816, 1, 1, 1, 1, 1,
-0.3571493, 0.7509275, -0.3429654, 1, 1, 1, 1, 1,
-0.3483557, -1.08981, -2.825254, 1, 1, 1, 1, 1,
-0.3402641, 0.2901682, -0.4306249, 1, 1, 1, 1, 1,
-0.3312746, -0.3407564, -4.300622, 1, 1, 1, 1, 1,
-0.3308861, 1.87713, -1.280635, 1, 1, 1, 1, 1,
-0.3248337, -0.7780188, -2.910112, 1, 1, 1, 1, 1,
-0.3199162, -0.06282963, -2.04992, 1, 1, 1, 1, 1,
-0.3198068, -0.5849481, -2.789601, 1, 1, 1, 1, 1,
-0.3121689, 1.326422, -0.9188243, 1, 1, 1, 1, 1,
-0.3043356, -1.733092, -4.278644, 1, 1, 1, 1, 1,
-0.3037595, 0.3693727, -0.2905674, 1, 1, 1, 1, 1,
-0.3034369, -0.3171412, -1.39805, 1, 1, 1, 1, 1,
-0.3019907, -2.464512, -3.218139, 0, 0, 1, 1, 1,
-0.2959131, -0.8150326, -3.144508, 1, 0, 0, 1, 1,
-0.295846, -2.228056, -4.112919, 1, 0, 0, 1, 1,
-0.2920416, 1.900899, -0.694862, 1, 0, 0, 1, 1,
-0.2855467, -1.66528, -1.961006, 1, 0, 0, 1, 1,
-0.2764446, 0.1201674, -1.136407, 1, 0, 0, 1, 1,
-0.2750974, -0.01964989, 0.1670402, 0, 0, 0, 1, 1,
-0.2730938, 0.6523449, -1.823235, 0, 0, 0, 1, 1,
-0.2727926, -0.04224949, -3.564048, 0, 0, 0, 1, 1,
-0.2708771, -0.4237619, -1.738038, 0, 0, 0, 1, 1,
-0.2708086, 1.137977, -0.5030072, 0, 0, 0, 1, 1,
-0.270799, -0.06299223, -0.8237614, 0, 0, 0, 1, 1,
-0.2608128, -1.336069, -2.793135, 0, 0, 0, 1, 1,
-0.2569714, 0.01071051, -1.424487, 1, 1, 1, 1, 1,
-0.2554466, 0.428745, 0.36568, 1, 1, 1, 1, 1,
-0.2552606, -0.5551819, -2.826955, 1, 1, 1, 1, 1,
-0.2548787, 1.019633, 0.4999926, 1, 1, 1, 1, 1,
-0.2536522, -0.5652902, -2.652485, 1, 1, 1, 1, 1,
-0.2513097, -1.679161, -3.62363, 1, 1, 1, 1, 1,
-0.2439442, 0.7688676, -0.4276834, 1, 1, 1, 1, 1,
-0.2415118, -0.1644781, -0.8962978, 1, 1, 1, 1, 1,
-0.2402851, 0.9778043, -0.1184652, 1, 1, 1, 1, 1,
-0.2304844, 0.7268603, -1.55246, 1, 1, 1, 1, 1,
-0.2249575, -0.8090723, -2.614203, 1, 1, 1, 1, 1,
-0.21908, -0.9976676, -1.689682, 1, 1, 1, 1, 1,
-0.2185956, -0.08783211, -2.916862, 1, 1, 1, 1, 1,
-0.2122184, 2.066025, 1.494516, 1, 1, 1, 1, 1,
-0.2116707, -1.711717, -4.145177, 1, 1, 1, 1, 1,
-0.2106078, -0.2036888, -2.565229, 0, 0, 1, 1, 1,
-0.2075162, -0.1537302, -1.776452, 1, 0, 0, 1, 1,
-0.2050353, 1.735625, -0.02800876, 1, 0, 0, 1, 1,
-0.2029236, 0.4437232, -0.4730536, 1, 0, 0, 1, 1,
-0.2027547, 0.6551988, 0.2564552, 1, 0, 0, 1, 1,
-0.1851796, 1.88315, 0.03022389, 1, 0, 0, 1, 1,
-0.1836042, 0.8620732, -2.094213, 0, 0, 0, 1, 1,
-0.1800401, 0.03344878, -2.698925, 0, 0, 0, 1, 1,
-0.1759123, -1.346329, -1.494032, 0, 0, 0, 1, 1,
-0.1748383, 0.4745404, -2.250571, 0, 0, 0, 1, 1,
-0.1735137, -0.9885628, -1.52251, 0, 0, 0, 1, 1,
-0.1701304, 0.54369, 0.3275612, 0, 0, 0, 1, 1,
-0.1668568, 0.07294711, -1.872977, 0, 0, 0, 1, 1,
-0.1654206, -0.2715167, -0.9411851, 1, 1, 1, 1, 1,
-0.1649714, 0.5098872, 0.8834381, 1, 1, 1, 1, 1,
-0.1640154, -0.8906784, -2.375828, 1, 1, 1, 1, 1,
-0.1625679, 1.023623, -0.7550458, 1, 1, 1, 1, 1,
-0.1615528, -0.0158374, 0.06491658, 1, 1, 1, 1, 1,
-0.1595095, 0.6784757, 0.7442954, 1, 1, 1, 1, 1,
-0.1591412, -0.2872177, -2.674713, 1, 1, 1, 1, 1,
-0.158958, -1.230554, -3.96181, 1, 1, 1, 1, 1,
-0.1555359, 1.053026, 0.6344348, 1, 1, 1, 1, 1,
-0.1552207, -1.020306, -3.26463, 1, 1, 1, 1, 1,
-0.1541046, 0.3438067, -1.563286, 1, 1, 1, 1, 1,
-0.1510358, 0.2792183, -2.024832, 1, 1, 1, 1, 1,
-0.1453396, 0.2214214, -0.1272817, 1, 1, 1, 1, 1,
-0.1425464, -0.1747966, -1.972872, 1, 1, 1, 1, 1,
-0.1412017, -0.02355816, -1.182664, 1, 1, 1, 1, 1,
-0.1409191, -1.000336, -2.915371, 0, 0, 1, 1, 1,
-0.1394422, -1.404107, -2.99252, 1, 0, 0, 1, 1,
-0.134359, -0.6631106, -1.144167, 1, 0, 0, 1, 1,
-0.1312885, 0.3930295, -0.8895065, 1, 0, 0, 1, 1,
-0.123346, -1.56653, -2.635221, 1, 0, 0, 1, 1,
-0.1173862, -0.2832077, -3.125609, 1, 0, 0, 1, 1,
-0.1094902, -1.188839, -1.637657, 0, 0, 0, 1, 1,
-0.1034739, 0.3006913, -1.207106, 0, 0, 0, 1, 1,
-0.0992617, -0.4391459, -2.846009, 0, 0, 0, 1, 1,
-0.09715588, 1.184358, -0.6300434, 0, 0, 0, 1, 1,
-0.0893255, 1.430612, -0.7223828, 0, 0, 0, 1, 1,
-0.08925597, 0.3495839, -1.348818, 0, 0, 0, 1, 1,
-0.08699535, 0.8757862, -0.7909444, 0, 0, 0, 1, 1,
-0.08579927, -2.145468, -3.239771, 1, 1, 1, 1, 1,
-0.08396742, -0.2091575, -2.215448, 1, 1, 1, 1, 1,
-0.0832705, 0.5737148, -0.0219763, 1, 1, 1, 1, 1,
-0.08114558, 1.751764, 1.43971, 1, 1, 1, 1, 1,
-0.07592551, -0.01967925, -2.118166, 1, 1, 1, 1, 1,
-0.07330425, 0.1657615, -1.590106, 1, 1, 1, 1, 1,
-0.07281256, -0.8552129, -3.036296, 1, 1, 1, 1, 1,
-0.07279143, -0.1910978, -3.994119, 1, 1, 1, 1, 1,
-0.06918035, -0.03781226, -0.9107136, 1, 1, 1, 1, 1,
-0.06274147, 1.105613, 0.0875833, 1, 1, 1, 1, 1,
-0.06254101, 0.411206, 1.961132, 1, 1, 1, 1, 1,
-0.06158902, -1.28322, -3.035825, 1, 1, 1, 1, 1,
-0.06129642, -0.04068756, -1.653937, 1, 1, 1, 1, 1,
-0.06010732, -0.5696249, -4.090059, 1, 1, 1, 1, 1,
-0.05996812, 0.01729472, -1.805571, 1, 1, 1, 1, 1,
-0.05467044, -1.26307, -3.072997, 0, 0, 1, 1, 1,
-0.05383595, 0.8143424, 0.6150987, 1, 0, 0, 1, 1,
-0.0438613, 0.5957648, -1.345231, 1, 0, 0, 1, 1,
-0.04257246, -0.2308756, -2.481367, 1, 0, 0, 1, 1,
-0.03059399, -0.7679199, -2.014041, 1, 0, 0, 1, 1,
-0.02555992, -0.5104815, -3.262693, 1, 0, 0, 1, 1,
-0.0220087, 0.4783802, -1.295787, 0, 0, 0, 1, 1,
-0.01980613, -0.811604, -1.327843, 0, 0, 0, 1, 1,
-0.004360055, 0.7005001, -1.119096, 0, 0, 0, 1, 1,
0.004978356, -0.7674239, 3.487366, 0, 0, 0, 1, 1,
0.005856609, -1.221421, 2.679579, 0, 0, 0, 1, 1,
0.006473819, 1.359997, 0.1780215, 0, 0, 0, 1, 1,
0.01061848, 1.182694, 1.289189, 0, 0, 0, 1, 1,
0.01102001, 0.7452728, 1.058095, 1, 1, 1, 1, 1,
0.01106452, 0.3574569, 1.387169, 1, 1, 1, 1, 1,
0.02045724, 2.604661, 0.9532279, 1, 1, 1, 1, 1,
0.02100156, 1.98051, -1.797018, 1, 1, 1, 1, 1,
0.028122, -0.4884472, 2.19973, 1, 1, 1, 1, 1,
0.02850921, -1.442159, 3.766219, 1, 1, 1, 1, 1,
0.02961278, -1.435391, 4.254471, 1, 1, 1, 1, 1,
0.02998628, 0.1474705, -0.294647, 1, 1, 1, 1, 1,
0.03063667, -0.5244926, 1.238857, 1, 1, 1, 1, 1,
0.03097552, -0.4711743, 2.507354, 1, 1, 1, 1, 1,
0.03461107, 2.599423, 1.13957, 1, 1, 1, 1, 1,
0.03950846, -0.001423121, 1.920718, 1, 1, 1, 1, 1,
0.03994571, -0.6719174, 5.292639, 1, 1, 1, 1, 1,
0.04258177, -0.003439716, 2.951014, 1, 1, 1, 1, 1,
0.0433035, 0.2981968, 1.518379, 1, 1, 1, 1, 1,
0.04398261, -0.107195, 0.561093, 0, 0, 1, 1, 1,
0.04479175, 0.3609806, -0.2394735, 1, 0, 0, 1, 1,
0.04553243, -0.5118803, 2.809552, 1, 0, 0, 1, 1,
0.04587132, 0.2687947, 1.44906, 1, 0, 0, 1, 1,
0.04947022, 0.5671816, 0.7866267, 1, 0, 0, 1, 1,
0.05058626, -0.04612617, 2.028589, 1, 0, 0, 1, 1,
0.05064325, 1.243071, -0.02467113, 0, 0, 0, 1, 1,
0.05623331, -1.359171, 3.767863, 0, 0, 0, 1, 1,
0.05635051, 0.7109998, 0.3480123, 0, 0, 0, 1, 1,
0.06397375, -1.831815, 2.596044, 0, 0, 0, 1, 1,
0.06688807, -2.056398, 2.839355, 0, 0, 0, 1, 1,
0.06703206, -0.8399588, 2.83119, 0, 0, 0, 1, 1,
0.07321431, -0.2588854, 3.352969, 0, 0, 0, 1, 1,
0.07398636, -0.1375649, 2.079284, 1, 1, 1, 1, 1,
0.07514974, -1.137753, 3.435239, 1, 1, 1, 1, 1,
0.07541753, 0.7823663, 0.3601139, 1, 1, 1, 1, 1,
0.07546704, -1.14347, 4.170356, 1, 1, 1, 1, 1,
0.08165023, -0.4079456, 1.628648, 1, 1, 1, 1, 1,
0.08388158, 0.4414898, 1.106891, 1, 1, 1, 1, 1,
0.09364732, 0.7635466, -0.6721272, 1, 1, 1, 1, 1,
0.09540299, 0.5299483, 0.3834911, 1, 1, 1, 1, 1,
0.09939697, -0.9424585, 3.517784, 1, 1, 1, 1, 1,
0.09967313, -0.1657985, 2.933653, 1, 1, 1, 1, 1,
0.1026583, -1.260943, 1.22779, 1, 1, 1, 1, 1,
0.1035327, 1.777715, 1.076357, 1, 1, 1, 1, 1,
0.1036578, -0.1621607, 4.328306, 1, 1, 1, 1, 1,
0.1036782, 2.05863, -0.06061157, 1, 1, 1, 1, 1,
0.1088032, -0.04356755, 2.224207, 1, 1, 1, 1, 1,
0.1090003, -0.2303789, 3.027448, 0, 0, 1, 1, 1,
0.1186938, 0.5307191, -0.9051536, 1, 0, 0, 1, 1,
0.120897, 1.417201, -0.3324506, 1, 0, 0, 1, 1,
0.1253943, -2.473152, 2.972522, 1, 0, 0, 1, 1,
0.1289272, 0.1619138, -0.8263165, 1, 0, 0, 1, 1,
0.1318542, 1.268031, 0.7662413, 1, 0, 0, 1, 1,
0.1319257, 0.4840823, 0.2339854, 0, 0, 0, 1, 1,
0.1324831, 2.062814, -1.437405, 0, 0, 0, 1, 1,
0.132736, -0.05113569, 1.533396, 0, 0, 0, 1, 1,
0.1351047, -0.3323003, 3.187554, 0, 0, 0, 1, 1,
0.1358517, -0.8790877, 3.253568, 0, 0, 0, 1, 1,
0.1363275, -0.5624124, 2.099448, 0, 0, 0, 1, 1,
0.1392896, -0.07289256, 1.869148, 0, 0, 0, 1, 1,
0.1403906, 0.5835164, 1.690226, 1, 1, 1, 1, 1,
0.1445133, -0.071139, 4.753322, 1, 1, 1, 1, 1,
0.1450982, -0.6242201, 3.417871, 1, 1, 1, 1, 1,
0.1491073, 0.4997729, 0.3817761, 1, 1, 1, 1, 1,
0.1531332, -0.2685181, 3.442902, 1, 1, 1, 1, 1,
0.1542823, -1.043858, 2.339872, 1, 1, 1, 1, 1,
0.1564168, -0.4669507, 2.352255, 1, 1, 1, 1, 1,
0.1599614, -1.084473, 3.405931, 1, 1, 1, 1, 1,
0.1635981, 1.598426, -0.9496338, 1, 1, 1, 1, 1,
0.1650863, -0.1288467, 2.877259, 1, 1, 1, 1, 1,
0.1650967, 0.6055545, 1.795682, 1, 1, 1, 1, 1,
0.1655655, 1.019589, 1.589739, 1, 1, 1, 1, 1,
0.1662274, -0.8711418, 4.270742, 1, 1, 1, 1, 1,
0.1678626, -1.828672, 2.946691, 1, 1, 1, 1, 1,
0.1688338, 0.3673523, -0.08647403, 1, 1, 1, 1, 1,
0.168976, 1.201776, 0.2086977, 0, 0, 1, 1, 1,
0.1698053, 1.111985, 2.036604, 1, 0, 0, 1, 1,
0.1706354, -0.005951829, 0.9891655, 1, 0, 0, 1, 1,
0.1709188, -0.2685913, 4.115529, 1, 0, 0, 1, 1,
0.1711223, 1.917053, -2.740913, 1, 0, 0, 1, 1,
0.1762916, 1.01806, 1.831952, 1, 0, 0, 1, 1,
0.176496, -0.3283732, 3.681481, 0, 0, 0, 1, 1,
0.1821828, -0.8397095, 1.165281, 0, 0, 0, 1, 1,
0.1830492, 0.1756539, 1.700933, 0, 0, 0, 1, 1,
0.1853441, 0.4330656, 0.08884428, 0, 0, 0, 1, 1,
0.1876352, -0.1090828, 2.012799, 0, 0, 0, 1, 1,
0.1926063, 1.756998, 1.09723, 0, 0, 0, 1, 1,
0.1958185, -0.9957213, 4.330046, 0, 0, 0, 1, 1,
0.195821, 1.265955, 1.179955, 1, 1, 1, 1, 1,
0.1971938, -1.418444, 3.061506, 1, 1, 1, 1, 1,
0.2029987, 0.3046589, 1.416745, 1, 1, 1, 1, 1,
0.2041954, -0.6459367, 3.854864, 1, 1, 1, 1, 1,
0.2063006, 0.2181705, 1.939002, 1, 1, 1, 1, 1,
0.219043, -0.8384981, 5.599557, 1, 1, 1, 1, 1,
0.2224125, -0.6415462, 1.71183, 1, 1, 1, 1, 1,
0.2226152, -1.550462, 2.456139, 1, 1, 1, 1, 1,
0.2277496, -1.09053, 3.804191, 1, 1, 1, 1, 1,
0.2299696, -0.3489649, 2.038084, 1, 1, 1, 1, 1,
0.2324638, 0.5247104, 2.088391, 1, 1, 1, 1, 1,
0.2347068, 0.1607026, 0.7608937, 1, 1, 1, 1, 1,
0.2465835, 0.3512376, 2.127723, 1, 1, 1, 1, 1,
0.2479216, -1.463073, 4.546213, 1, 1, 1, 1, 1,
0.2546377, -0.6014681, 2.013291, 1, 1, 1, 1, 1,
0.2573457, -0.7073917, 3.185887, 0, 0, 1, 1, 1,
0.2586634, 1.457518, 1.382143, 1, 0, 0, 1, 1,
0.2628692, 0.4569701, -1.228088, 1, 0, 0, 1, 1,
0.2628766, 1.578442, 0.4003905, 1, 0, 0, 1, 1,
0.2644308, -0.8954931, 2.247553, 1, 0, 0, 1, 1,
0.2664239, -1.081146, 1.69806, 1, 0, 0, 1, 1,
0.2707359, -1.182261, 2.536229, 0, 0, 0, 1, 1,
0.2720017, -0.4986295, 2.996178, 0, 0, 0, 1, 1,
0.2725104, -1.559224, 2.96834, 0, 0, 0, 1, 1,
0.2758936, -1.307951, 3.980679, 0, 0, 0, 1, 1,
0.2821276, 0.4705777, 0.3758056, 0, 0, 0, 1, 1,
0.2846743, -0.7165138, 3.18786, 0, 0, 0, 1, 1,
0.2859586, 0.8752966, 2.555977, 0, 0, 0, 1, 1,
0.2886968, 0.4762168, -0.4336049, 1, 1, 1, 1, 1,
0.2912672, 0.1922805, 1.512795, 1, 1, 1, 1, 1,
0.2929705, 1.412749, 1.780367, 1, 1, 1, 1, 1,
0.300914, -0.3348879, 2.228333, 1, 1, 1, 1, 1,
0.3019368, -0.0143529, 5.155325, 1, 1, 1, 1, 1,
0.3031116, -1.145835, 2.802751, 1, 1, 1, 1, 1,
0.3110514, -0.5434995, 1.873439, 1, 1, 1, 1, 1,
0.3129968, 0.7732927, -0.1349275, 1, 1, 1, 1, 1,
0.3149593, -1.33247, 2.771232, 1, 1, 1, 1, 1,
0.3163675, 2.178272, -1.206308, 1, 1, 1, 1, 1,
0.3165376, -0.2005595, 0.2808081, 1, 1, 1, 1, 1,
0.3168983, -0.6050802, 4.235768, 1, 1, 1, 1, 1,
0.3213738, -0.4439142, 1.368403, 1, 1, 1, 1, 1,
0.3222101, 0.884403, 0.05297855, 1, 1, 1, 1, 1,
0.3272394, 2.098997, -0.6218778, 1, 1, 1, 1, 1,
0.3275565, 0.4605088, 0.2877114, 0, 0, 1, 1, 1,
0.3336183, 1.525067, -0.1869359, 1, 0, 0, 1, 1,
0.3346025, -2.517301, 3.796739, 1, 0, 0, 1, 1,
0.3386133, 0.5332277, 0.2841776, 1, 0, 0, 1, 1,
0.3419994, -0.3297556, 3.064653, 1, 0, 0, 1, 1,
0.3445827, 0.5089951, 0.3509168, 1, 0, 0, 1, 1,
0.3462417, -1.869785, 1.677491, 0, 0, 0, 1, 1,
0.3503996, 0.080341, 1.453326, 0, 0, 0, 1, 1,
0.3531101, -0.6509982, 2.475386, 0, 0, 0, 1, 1,
0.3574249, 0.07997502, 1.748288, 0, 0, 0, 1, 1,
0.3592443, -2.140709, 4.566356, 0, 0, 0, 1, 1,
0.3598721, 0.1965674, -0.1642518, 0, 0, 0, 1, 1,
0.3611132, -0.8185981, 2.468467, 0, 0, 0, 1, 1,
0.3638376, 0.2287588, 1.585392, 1, 1, 1, 1, 1,
0.3656666, 1.009451, 1.352034, 1, 1, 1, 1, 1,
0.368277, -1.561287, 3.227403, 1, 1, 1, 1, 1,
0.368904, 2.04366, -2.269642, 1, 1, 1, 1, 1,
0.3698711, -0.71706, -0.8417973, 1, 1, 1, 1, 1,
0.3714232, -0.5198418, 0.7857718, 1, 1, 1, 1, 1,
0.3750634, 1.528096, 0.5242073, 1, 1, 1, 1, 1,
0.3762282, 0.426672, 0.6173543, 1, 1, 1, 1, 1,
0.3765659, -1.296468, 2.993017, 1, 1, 1, 1, 1,
0.3820843, 0.2717523, 1.18895, 1, 1, 1, 1, 1,
0.3847876, 0.908342, -0.3345641, 1, 1, 1, 1, 1,
0.3971939, -2.190428, 3.952729, 1, 1, 1, 1, 1,
0.4009779, 0.2086573, 1.069412, 1, 1, 1, 1, 1,
0.4059774, 0.5132808, 0.6196526, 1, 1, 1, 1, 1,
0.4098592, -0.5658009, 3.327342, 1, 1, 1, 1, 1,
0.4109763, -0.3173037, 3.107701, 0, 0, 1, 1, 1,
0.4115733, -1.014814, 3.184906, 1, 0, 0, 1, 1,
0.4136953, -1.054956, 3.993248, 1, 0, 0, 1, 1,
0.4141245, 0.04169388, 2.162653, 1, 0, 0, 1, 1,
0.414483, 0.8373168, -1.208428, 1, 0, 0, 1, 1,
0.4183039, -1.338566, 3.821647, 1, 0, 0, 1, 1,
0.4208402, -1.398183, 1.902927, 0, 0, 0, 1, 1,
0.4211659, -1.345336, 5.767876, 0, 0, 0, 1, 1,
0.4232424, -1.583067, 2.234004, 0, 0, 0, 1, 1,
0.4254881, -0.8651958, 2.453038, 0, 0, 0, 1, 1,
0.4295429, -0.001140222, 0.4835722, 0, 0, 0, 1, 1,
0.4305725, 1.289141, -0.6848903, 0, 0, 0, 1, 1,
0.4362893, -0.6276106, 2.438077, 0, 0, 0, 1, 1,
0.4370048, 0.6833001, -0.7263817, 1, 1, 1, 1, 1,
0.4379185, 1.442959, 0.2042488, 1, 1, 1, 1, 1,
0.4413102, -1.004186, 2.482864, 1, 1, 1, 1, 1,
0.4422639, 0.6971178, -2.183788, 1, 1, 1, 1, 1,
0.4444513, -1.397097, 3.15978, 1, 1, 1, 1, 1,
0.4485657, -0.5971304, 2.377555, 1, 1, 1, 1, 1,
0.4502444, 0.5919842, 1.110348, 1, 1, 1, 1, 1,
0.4506007, -0.3980672, 3.047617, 1, 1, 1, 1, 1,
0.4522116, -2.764684, 1.727661, 1, 1, 1, 1, 1,
0.4526486, -0.1989078, 0.9825901, 1, 1, 1, 1, 1,
0.4544041, -1.365845, 1.611805, 1, 1, 1, 1, 1,
0.4554394, -1.005202, 3.956674, 1, 1, 1, 1, 1,
0.4579765, 0.2455904, 0.9544073, 1, 1, 1, 1, 1,
0.4594967, -0.6231439, 1.747841, 1, 1, 1, 1, 1,
0.4608001, 0.8272594, 0.9493364, 1, 1, 1, 1, 1,
0.4610835, 0.3103497, 1.035819, 0, 0, 1, 1, 1,
0.4611024, 0.1204136, 1.361959, 1, 0, 0, 1, 1,
0.4642764, 0.5722204, 0.6536945, 1, 0, 0, 1, 1,
0.4680826, 0.4404092, 0.9727929, 1, 0, 0, 1, 1,
0.4733667, 2.058753, 0.7126174, 1, 0, 0, 1, 1,
0.4734384, -0.5231813, 1.521085, 1, 0, 0, 1, 1,
0.4784718, 1.49464, -0.1837136, 0, 0, 0, 1, 1,
0.4852915, 1.099442, -0.4995147, 0, 0, 0, 1, 1,
0.488601, -0.1075975, -0.2856199, 0, 0, 0, 1, 1,
0.4907976, -0.2567798, 1.797232, 0, 0, 0, 1, 1,
0.493144, -0.1369549, 1.272063, 0, 0, 0, 1, 1,
0.4956148, 0.05552053, 2.643568, 0, 0, 0, 1, 1,
0.4982282, 0.7337929, -0.9768358, 0, 0, 0, 1, 1,
0.5109563, -0.5818776, 1.53711, 1, 1, 1, 1, 1,
0.5182371, 0.08877794, 4.170317, 1, 1, 1, 1, 1,
0.5187474, -0.7147936, 3.032663, 1, 1, 1, 1, 1,
0.5210815, 1.151543, -0.5090059, 1, 1, 1, 1, 1,
0.5254714, 1.090497, 0.3754984, 1, 1, 1, 1, 1,
0.5289398, -0.4292889, 2.922722, 1, 1, 1, 1, 1,
0.5303202, -0.4692336, 2.678216, 1, 1, 1, 1, 1,
0.5329797, 1.406995, 1.220354, 1, 1, 1, 1, 1,
0.534055, -0.9989758, 2.686157, 1, 1, 1, 1, 1,
0.53441, -1.597249, 1.863811, 1, 1, 1, 1, 1,
0.5402215, 0.4176248, 0.1481683, 1, 1, 1, 1, 1,
0.5408534, -1.702451, 3.076358, 1, 1, 1, 1, 1,
0.5409001, 0.5504634, -2.221553, 1, 1, 1, 1, 1,
0.5414148, 1.444051, 0.27433, 1, 1, 1, 1, 1,
0.5433595, 0.2645167, 0.5419091, 1, 1, 1, 1, 1,
0.5475259, -0.02313052, 0.5720823, 0, 0, 1, 1, 1,
0.5509816, 0.6288826, 0.9640746, 1, 0, 0, 1, 1,
0.553762, -0.2799135, 2.075115, 1, 0, 0, 1, 1,
0.5540792, -0.2500966, 2.41846, 1, 0, 0, 1, 1,
0.5563834, 0.4041654, 3.468668, 1, 0, 0, 1, 1,
0.5641562, -1.054725, 2.501729, 1, 0, 0, 1, 1,
0.5647721, -0.3923155, 1.046517, 0, 0, 0, 1, 1,
0.5649577, -0.580084, 1.307317, 0, 0, 0, 1, 1,
0.5693263, -1.149223, 0.6289099, 0, 0, 0, 1, 1,
0.5704747, -1.509878, 1.172325, 0, 0, 0, 1, 1,
0.5722588, 0.887015, 0.5456707, 0, 0, 0, 1, 1,
0.5738253, 0.19934, 0.4615253, 0, 0, 0, 1, 1,
0.5740027, -0.8080159, 3.181501, 0, 0, 0, 1, 1,
0.5747425, 0.2790879, 0.8871176, 1, 1, 1, 1, 1,
0.5767721, 0.7857725, -0.508154, 1, 1, 1, 1, 1,
0.5780457, 0.943542, -0.7038301, 1, 1, 1, 1, 1,
0.5808778, -0.9874404, 1.483113, 1, 1, 1, 1, 1,
0.5809422, 3.159285, -1.43844, 1, 1, 1, 1, 1,
0.5813711, 0.2340253, 1.044241, 1, 1, 1, 1, 1,
0.5889987, 0.1820714, 1.149721, 1, 1, 1, 1, 1,
0.5943251, -1.039617, 1.290101, 1, 1, 1, 1, 1,
0.5945541, 2.094475, -0.7057397, 1, 1, 1, 1, 1,
0.5981241, -0.4651344, 1.26832, 1, 1, 1, 1, 1,
0.604589, 0.01638396, 1.757624, 1, 1, 1, 1, 1,
0.605177, 0.03933647, 1.556614, 1, 1, 1, 1, 1,
0.6054825, -0.9306484, 3.013915, 1, 1, 1, 1, 1,
0.6085555, -0.0889428, 3.543832, 1, 1, 1, 1, 1,
0.6113002, 0.1359142, 2.442776, 1, 1, 1, 1, 1,
0.6122369, 1.810757, 0.5861441, 0, 0, 1, 1, 1,
0.6178451, 0.09813145, 2.203085, 1, 0, 0, 1, 1,
0.6187799, 0.7885784, -0.1253564, 1, 0, 0, 1, 1,
0.6194639, -0.5565915, 0.8952228, 1, 0, 0, 1, 1,
0.6222675, -0.980558, 2.784437, 1, 0, 0, 1, 1,
0.6239001, -0.6761673, 1.30073, 1, 0, 0, 1, 1,
0.6266686, -0.1628782, 2.955121, 0, 0, 0, 1, 1,
0.629903, 0.15883, 1.763816, 0, 0, 0, 1, 1,
0.6304376, -1.01177, 1.277359, 0, 0, 0, 1, 1,
0.6313542, -0.07337435, 1.096185, 0, 0, 0, 1, 1,
0.6341101, 0.5313186, 0.8399184, 0, 0, 0, 1, 1,
0.643118, 0.5056338, -0.1853598, 0, 0, 0, 1, 1,
0.6440406, 0.01551388, 3.2201, 0, 0, 0, 1, 1,
0.6524038, 1.125738, 0.3259749, 1, 1, 1, 1, 1,
0.6530344, -0.1949672, 0.4976119, 1, 1, 1, 1, 1,
0.6589737, -0.5860155, 3.785362, 1, 1, 1, 1, 1,
0.6596245, 2.733298, -0.6774715, 1, 1, 1, 1, 1,
0.6622177, -0.4569843, 1.435218, 1, 1, 1, 1, 1,
0.6627476, 1.186094, -0.06914914, 1, 1, 1, 1, 1,
0.6631951, -1.500019, 2.466878, 1, 1, 1, 1, 1,
0.66537, 1.317314, -0.6558484, 1, 1, 1, 1, 1,
0.6669812, -0.4475843, 1.361645, 1, 1, 1, 1, 1,
0.6707705, 0.03988378, 4.083452, 1, 1, 1, 1, 1,
0.6713536, 0.7846081, 1.546437, 1, 1, 1, 1, 1,
0.6755413, -1.62723, 2.573117, 1, 1, 1, 1, 1,
0.6757562, 0.3151022, -0.2110769, 1, 1, 1, 1, 1,
0.6790624, 0.00736709, 2.689144, 1, 1, 1, 1, 1,
0.6796274, 0.5330166, 0.5682212, 1, 1, 1, 1, 1,
0.6857418, -0.4871938, 3.014204, 0, 0, 1, 1, 1,
0.6871718, -0.5917574, 2.37908, 1, 0, 0, 1, 1,
0.6903911, 0.1159521, 3.434977, 1, 0, 0, 1, 1,
0.6974508, -0.548015, 2.780499, 1, 0, 0, 1, 1,
0.7001186, 1.087931, 1.91396, 1, 0, 0, 1, 1,
0.7020066, -0.214035, 2.608727, 1, 0, 0, 1, 1,
0.7032763, 0.4571283, -0.5333716, 0, 0, 0, 1, 1,
0.7041848, 1.171924, 2.218421, 0, 0, 0, 1, 1,
0.7070259, -1.731865, 2.340968, 0, 0, 0, 1, 1,
0.7074914, -0.361364, 2.266631, 0, 0, 0, 1, 1,
0.7077886, 0.135096, 1.630136, 0, 0, 0, 1, 1,
0.7141365, -0.642562, 1.879902, 0, 0, 0, 1, 1,
0.715471, 1.201086, 0.9510968, 0, 0, 0, 1, 1,
0.7190773, -0.2058444, 0.8610955, 1, 1, 1, 1, 1,
0.7206574, -0.4713225, 2.43861, 1, 1, 1, 1, 1,
0.7241851, -0.7154517, 1.600336, 1, 1, 1, 1, 1,
0.7288045, 1.54169, -0.5839143, 1, 1, 1, 1, 1,
0.729924, 1.403666, 1.834872, 1, 1, 1, 1, 1,
0.7312018, -1.857823, 3.779325, 1, 1, 1, 1, 1,
0.7315021, -1.007709, 2.264128, 1, 1, 1, 1, 1,
0.7395692, -0.1633316, 1.47339, 1, 1, 1, 1, 1,
0.7414445, 1.083737, 2.658327, 1, 1, 1, 1, 1,
0.7422696, -0.2963668, 2.230445, 1, 1, 1, 1, 1,
0.7432447, -1.317632, 1.712336, 1, 1, 1, 1, 1,
0.7470372, -1.104924, 2.920605, 1, 1, 1, 1, 1,
0.7512123, 0.1424592, 2.134458, 1, 1, 1, 1, 1,
0.7524824, -1.314815, 2.951503, 1, 1, 1, 1, 1,
0.7540658, -0.5627145, 2.182841, 1, 1, 1, 1, 1,
0.7545207, -0.0897222, 1.724943, 0, 0, 1, 1, 1,
0.7560496, 0.3068763, 2.370083, 1, 0, 0, 1, 1,
0.756253, -2.731441, 2.988869, 1, 0, 0, 1, 1,
0.7573102, -0.8192453, 1.553597, 1, 0, 0, 1, 1,
0.7645798, -0.50494, 3.207913, 1, 0, 0, 1, 1,
0.7675774, -0.6731696, 1.763729, 1, 0, 0, 1, 1,
0.7698277, 0.7007356, 1.434421, 0, 0, 0, 1, 1,
0.7707726, 0.7167436, 1.70006, 0, 0, 0, 1, 1,
0.7718219, -2.269536, -0.172903, 0, 0, 0, 1, 1,
0.7723604, -0.4206511, 3.103831, 0, 0, 0, 1, 1,
0.7780355, -0.6848084, 3.520168, 0, 0, 0, 1, 1,
0.781396, 1.598196, 1.882153, 0, 0, 0, 1, 1,
0.785403, 0.3006368, 3.080534, 0, 0, 0, 1, 1,
0.7866025, 1.83269, 2.080087, 1, 1, 1, 1, 1,
0.7901259, 0.1416286, 1.074463, 1, 1, 1, 1, 1,
0.790849, -1.412833, 1.715971, 1, 1, 1, 1, 1,
0.7941887, 0.1488586, -1.426764, 1, 1, 1, 1, 1,
0.7946637, 0.07650402, 3.857136, 1, 1, 1, 1, 1,
0.7956408, 0.4266916, 0.5915828, 1, 1, 1, 1, 1,
0.7975698, 0.3537615, -0.02958485, 1, 1, 1, 1, 1,
0.7986498, 0.7752451, 0.2462008, 1, 1, 1, 1, 1,
0.7998751, 0.4256753, 0.7938887, 1, 1, 1, 1, 1,
0.8011688, 0.3911197, 2.82005, 1, 1, 1, 1, 1,
0.8043225, -0.2849564, 1.231149, 1, 1, 1, 1, 1,
0.8062542, -0.7987082, 1.592254, 1, 1, 1, 1, 1,
0.8089648, 1.461941, -2.267149, 1, 1, 1, 1, 1,
0.8101226, 0.04620138, 4.106816, 1, 1, 1, 1, 1,
0.8109518, 0.009984376, -0.1379907, 1, 1, 1, 1, 1,
0.829604, 1.222519, -1.637665, 0, 0, 1, 1, 1,
0.8390822, 0.2468069, 1.857267, 1, 0, 0, 1, 1,
0.8402537, 0.6984512, 1.837648, 1, 0, 0, 1, 1,
0.8405299, 1.356992, 1.727579, 1, 0, 0, 1, 1,
0.8413619, 0.7354893, 2.981597, 1, 0, 0, 1, 1,
0.845755, -0.3942072, 2.797937, 1, 0, 0, 1, 1,
0.8461127, 0.4913814, 0.05544638, 0, 0, 0, 1, 1,
0.8495163, 2.112826, 1.805714, 0, 0, 0, 1, 1,
0.8572846, 0.5341055, 0.2773432, 0, 0, 0, 1, 1,
0.8595557, 0.9239841, 0.5571809, 0, 0, 0, 1, 1,
0.8642302, 0.05876897, 1.512441, 0, 0, 0, 1, 1,
0.8672379, 0.8459342, 2.144304, 0, 0, 0, 1, 1,
0.8690903, -1.622815, 3.043811, 0, 0, 0, 1, 1,
0.8701553, -0.2899851, 2.152031, 1, 1, 1, 1, 1,
0.8730831, -2.414274, 0.8534025, 1, 1, 1, 1, 1,
0.8762771, -0.460229, 2.338384, 1, 1, 1, 1, 1,
0.8791026, 0.03296981, 1.433747, 1, 1, 1, 1, 1,
0.8869873, 0.8493201, -0.367339, 1, 1, 1, 1, 1,
0.8885936, -1.465819, 4.244943, 1, 1, 1, 1, 1,
0.8911303, -0.6059899, 1.969883, 1, 1, 1, 1, 1,
0.900164, -0.4453126, 1.478848, 1, 1, 1, 1, 1,
0.9006484, -0.1964419, 2.942711, 1, 1, 1, 1, 1,
0.9059842, 1.684186, -1.115477, 1, 1, 1, 1, 1,
0.9154052, -0.9385168, 2.052484, 1, 1, 1, 1, 1,
0.9199408, 0.8353914, -0.5622437, 1, 1, 1, 1, 1,
0.9203448, -0.3991994, 0.8688098, 1, 1, 1, 1, 1,
0.9247424, 0.5182151, 1.495782, 1, 1, 1, 1, 1,
0.938381, -0.8158559, 2.268826, 1, 1, 1, 1, 1,
0.9388516, -0.354954, 1.948264, 0, 0, 1, 1, 1,
0.9504133, -1.445119, 4.419537, 1, 0, 0, 1, 1,
0.9579984, 0.5223016, 0.5287037, 1, 0, 0, 1, 1,
0.9633195, -0.4221413, 2.471481, 1, 0, 0, 1, 1,
0.9674716, -0.8678238, 2.657712, 1, 0, 0, 1, 1,
0.9683602, 1.317204, 1.13467, 1, 0, 0, 1, 1,
0.969485, 1.007432, 0.03556737, 0, 0, 0, 1, 1,
0.9707966, 0.32111, 1.831783, 0, 0, 0, 1, 1,
0.9758227, -1.089658, 3.028764, 0, 0, 0, 1, 1,
0.9777113, -0.9757316, 3.44573, 0, 0, 0, 1, 1,
0.9788378, 0.6200531, 2.568758, 0, 0, 0, 1, 1,
0.9868358, 0.1228241, 1.971219, 0, 0, 0, 1, 1,
0.9912695, 0.7066542, 3.138008, 0, 0, 0, 1, 1,
0.9966622, -1.241703, 2.266732, 1, 1, 1, 1, 1,
1.002433, 2.378024, 1.517752, 1, 1, 1, 1, 1,
1.002973, -0.06276067, 0.4571196, 1, 1, 1, 1, 1,
1.007379, 1.026006, 1.59523, 1, 1, 1, 1, 1,
1.010687, -0.2499976, 1.982862, 1, 1, 1, 1, 1,
1.01298, 1.883739, -0.8721415, 1, 1, 1, 1, 1,
1.013442, 0.03299279, 1.270392, 1, 1, 1, 1, 1,
1.018029, -1.277842, 2.468133, 1, 1, 1, 1, 1,
1.018364, 0.3028037, 0.281199, 1, 1, 1, 1, 1,
1.046449, 1.092115, 1.583504, 1, 1, 1, 1, 1,
1.050794, 0.3994872, 0.317371, 1, 1, 1, 1, 1,
1.053072, 0.1465811, 3.380924, 1, 1, 1, 1, 1,
1.054672, -1.038257, 3.887953, 1, 1, 1, 1, 1,
1.054798, -0.7544721, 2.195926, 1, 1, 1, 1, 1,
1.056124, -0.5429432, 1.699419, 1, 1, 1, 1, 1,
1.057092, -0.000855974, 0.4634839, 0, 0, 1, 1, 1,
1.063267, 0.4846557, 1.521714, 1, 0, 0, 1, 1,
1.064911, -0.4614641, 2.684779, 1, 0, 0, 1, 1,
1.064966, -0.05391563, 3.328248, 1, 0, 0, 1, 1,
1.069262, 0.05626522, 1.850713, 1, 0, 0, 1, 1,
1.069325, -0.7443968, -0.3912254, 1, 0, 0, 1, 1,
1.074403, 0.1343653, 1.447211, 0, 0, 0, 1, 1,
1.075266, 1.554488, -0.048693, 0, 0, 0, 1, 1,
1.080412, -0.428356, 2.597796, 0, 0, 0, 1, 1,
1.086409, 0.6825303, 1.655113, 0, 0, 0, 1, 1,
1.097804, 0.8483185, 1.807338, 0, 0, 0, 1, 1,
1.098645, 0.6059477, -0.4467275, 0, 0, 0, 1, 1,
1.100013, 0.02124634, 1.565181, 0, 0, 0, 1, 1,
1.107354, 1.641043, 0.2847497, 1, 1, 1, 1, 1,
1.109051, 0.2526482, -0.3044952, 1, 1, 1, 1, 1,
1.121456, 0.3442126, 2.373587, 1, 1, 1, 1, 1,
1.12574, -0.3615031, 2.100026, 1, 1, 1, 1, 1,
1.140461, 0.4458107, -0.06195191, 1, 1, 1, 1, 1,
1.142179, -0.9879652, 1.874276, 1, 1, 1, 1, 1,
1.152325, 1.541637, 0.4228663, 1, 1, 1, 1, 1,
1.155128, -0.7090797, 4.072073, 1, 1, 1, 1, 1,
1.165219, 1.685729, 0.05446148, 1, 1, 1, 1, 1,
1.168352, 0.4026472, -0.111984, 1, 1, 1, 1, 1,
1.169463, -0.1578594, 2.415066, 1, 1, 1, 1, 1,
1.176519, 0.07093403, 1.551522, 1, 1, 1, 1, 1,
1.181466, 1.619635, 0.4065489, 1, 1, 1, 1, 1,
1.186412, 0.3488849, -0.05362144, 1, 1, 1, 1, 1,
1.186737, -0.05904155, 1.06715, 1, 1, 1, 1, 1,
1.191872, -1.705043, 1.901292, 0, 0, 1, 1, 1,
1.192373, 0.9542322, -0.7384007, 1, 0, 0, 1, 1,
1.193771, -0.3676936, 1.415801, 1, 0, 0, 1, 1,
1.195203, 2.21253, 1.519873, 1, 0, 0, 1, 1,
1.199059, 1.312353, 1.930818, 1, 0, 0, 1, 1,
1.206381, -0.1266265, 1.68685, 1, 0, 0, 1, 1,
1.209526, -0.3017965, 2.903361, 0, 0, 0, 1, 1,
1.213916, -1.325969, 2.104667, 0, 0, 0, 1, 1,
1.218947, 0.3026541, 0.8913833, 0, 0, 0, 1, 1,
1.227847, 0.8215272, 1.783279, 0, 0, 0, 1, 1,
1.232313, -1.120431, 3.346173, 0, 0, 0, 1, 1,
1.242655, -2.672178, 2.177649, 0, 0, 0, 1, 1,
1.243562, 1.463186, 0.674589, 0, 0, 0, 1, 1,
1.251512, 0.2109752, 1.067465, 1, 1, 1, 1, 1,
1.268835, -0.4637657, 1.98262, 1, 1, 1, 1, 1,
1.26938, 0.5139505, 3.051153, 1, 1, 1, 1, 1,
1.270211, -0.5114971, 2.723515, 1, 1, 1, 1, 1,
1.278032, -0.7851315, 1.399483, 1, 1, 1, 1, 1,
1.283453, -0.6281352, 1.921362, 1, 1, 1, 1, 1,
1.298948, 0.3141963, 2.455847, 1, 1, 1, 1, 1,
1.299427, -0.3104424, 2.97694, 1, 1, 1, 1, 1,
1.300057, 3.502505, -0.2891503, 1, 1, 1, 1, 1,
1.303616, -0.310679, 0.8848006, 1, 1, 1, 1, 1,
1.306173, -0.7763296, 2.23509, 1, 1, 1, 1, 1,
1.31412, 0.5399367, 1.654134, 1, 1, 1, 1, 1,
1.319277, 0.8473642, 2.481585, 1, 1, 1, 1, 1,
1.321995, -0.7512646, 3.888137, 1, 1, 1, 1, 1,
1.32465, -2.526229, 3.799978, 1, 1, 1, 1, 1,
1.326167, -0.5927839, 1.861273, 0, 0, 1, 1, 1,
1.328253, 0.5726178, 0.2211039, 1, 0, 0, 1, 1,
1.333437, 1.469091, 1.186772, 1, 0, 0, 1, 1,
1.338743, -0.3826858, 0.4319791, 1, 0, 0, 1, 1,
1.361837, -0.1893654, 0.8169181, 1, 0, 0, 1, 1,
1.364595, -1.993523, 1.704449, 1, 0, 0, 1, 1,
1.367974, -0.3811904, 2.109063, 0, 0, 0, 1, 1,
1.369587, -0.05699558, 0.815496, 0, 0, 0, 1, 1,
1.378055, 0.3233219, 1.591067, 0, 0, 0, 1, 1,
1.380785, 0.008183255, 2.703893, 0, 0, 0, 1, 1,
1.386622, 0.7535009, 1.485063, 0, 0, 0, 1, 1,
1.392325, 0.9642366, 1.696647, 0, 0, 0, 1, 1,
1.393214, -0.9062672, 1.777423, 0, 0, 0, 1, 1,
1.40401, 1.144114, 0.8760231, 1, 1, 1, 1, 1,
1.404772, 0.6151332, 0.2692369, 1, 1, 1, 1, 1,
1.41463, -0.02260967, 1.529011, 1, 1, 1, 1, 1,
1.415482, -0.3253983, 0.02264702, 1, 1, 1, 1, 1,
1.420507, -0.3055682, 0.8628067, 1, 1, 1, 1, 1,
1.420912, -1.627685, 0.7622719, 1, 1, 1, 1, 1,
1.431154, 0.9126859, 0.8832908, 1, 1, 1, 1, 1,
1.431658, 0.2365746, 2.025143, 1, 1, 1, 1, 1,
1.443735, 0.1602035, 1.931145, 1, 1, 1, 1, 1,
1.446166, 1.739646, -0.486461, 1, 1, 1, 1, 1,
1.455723, -0.07479449, -0.1159926, 1, 1, 1, 1, 1,
1.462085, -1.359097, 2.066887, 1, 1, 1, 1, 1,
1.474273, -1.046225, 1.242799, 1, 1, 1, 1, 1,
1.474338, -0.5109274, 2.306088, 1, 1, 1, 1, 1,
1.493042, 0.9530427, 0.9624773, 1, 1, 1, 1, 1,
1.497727, 0.8276963, 0.8366028, 0, 0, 1, 1, 1,
1.506836, -0.408377, 0.5027677, 1, 0, 0, 1, 1,
1.51537, -0.2780423, 2.17028, 1, 0, 0, 1, 1,
1.533254, 2.605544, -0.3501482, 1, 0, 0, 1, 1,
1.535746, -1.106466, 0.6867686, 1, 0, 0, 1, 1,
1.549604, 0.8517616, 0.950883, 1, 0, 0, 1, 1,
1.55059, -0.2235018, 1.814652, 0, 0, 0, 1, 1,
1.554417, 1.24736, 1.359459, 0, 0, 0, 1, 1,
1.561845, -0.8193501, 1.691418, 0, 0, 0, 1, 1,
1.579985, -0.4552018, 1.823974, 0, 0, 0, 1, 1,
1.581378, 0.7151938, 0.3225957, 0, 0, 0, 1, 1,
1.587961, -1.411882, 0.5670683, 0, 0, 0, 1, 1,
1.58921, -0.1402722, 1.858227, 0, 0, 0, 1, 1,
1.595031, -2.253289, 3.374652, 1, 1, 1, 1, 1,
1.59775, -0.9521559, 2.83026, 1, 1, 1, 1, 1,
1.600305, 0.4989478, 1.640038, 1, 1, 1, 1, 1,
1.608584, 1.624737, 0.8491415, 1, 1, 1, 1, 1,
1.622679, 0.4452987, 0.495101, 1, 1, 1, 1, 1,
1.633524, -0.890818, 3.396141, 1, 1, 1, 1, 1,
1.635444, -1.057978, 2.696728, 1, 1, 1, 1, 1,
1.645929, -1.629074, 2.786026, 1, 1, 1, 1, 1,
1.650737, -1.115885, 2.606379, 1, 1, 1, 1, 1,
1.652507, 0.331706, 0.9695541, 1, 1, 1, 1, 1,
1.652546, -2.119831, 2.1878, 1, 1, 1, 1, 1,
1.655888, -0.6934593, 0.5992005, 1, 1, 1, 1, 1,
1.660755, 0.997425, 1.518836, 1, 1, 1, 1, 1,
1.660958, -1.47574, 2.115605, 1, 1, 1, 1, 1,
1.675111, 0.4954195, 0.1026937, 1, 1, 1, 1, 1,
1.6788, -0.5038951, 1.062496, 0, 0, 1, 1, 1,
1.694932, 0.6578218, 1.562806, 1, 0, 0, 1, 1,
1.701565, 0.5890331, -0.3650914, 1, 0, 0, 1, 1,
1.719278, 0.1166562, 2.761442, 1, 0, 0, 1, 1,
1.722918, -0.5669491, 1.197202, 1, 0, 0, 1, 1,
1.743077, 1.896809, 1.338975, 1, 0, 0, 1, 1,
1.745698, 0.2000201, 2.392039, 0, 0, 0, 1, 1,
1.75044, -0.7722371, 3.383971, 0, 0, 0, 1, 1,
1.758819, 1.649663, -0.2168401, 0, 0, 0, 1, 1,
1.763075, -1.577928, 2.799341, 0, 0, 0, 1, 1,
1.776752, 1.287889, 1.751939, 0, 0, 0, 1, 1,
1.782545, -0.5177083, 2.3839, 0, 0, 0, 1, 1,
1.7876, 0.09045985, 0.7006651, 0, 0, 0, 1, 1,
1.789969, 2.029261, 1.703486, 1, 1, 1, 1, 1,
1.800304, -0.4055381, 1.777897, 1, 1, 1, 1, 1,
1.823206, 0.03853934, 1.875317, 1, 1, 1, 1, 1,
1.867495, -0.7894421, 1.768588, 1, 1, 1, 1, 1,
1.87723, -2.023478, 3.96619, 1, 1, 1, 1, 1,
1.888914, 1.021067, 1.609478, 1, 1, 1, 1, 1,
1.911633, -1.584665, 1.04381, 1, 1, 1, 1, 1,
1.925851, 0.8693503, 1.499939, 1, 1, 1, 1, 1,
1.936479, -0.4483704, 1.292413, 1, 1, 1, 1, 1,
1.9678, -0.575818, 3.383736, 1, 1, 1, 1, 1,
1.971168, -0.7757062, 0.6991377, 1, 1, 1, 1, 1,
2.017408, -0.1327826, 1.425909, 1, 1, 1, 1, 1,
2.036415, 0.9544773, 2.426646, 1, 1, 1, 1, 1,
2.046916, -0.5359724, 3.159663, 1, 1, 1, 1, 1,
2.080498, -0.1823104, -0.1372977, 1, 1, 1, 1, 1,
2.099311, 0.5110329, 2.776574, 0, 0, 1, 1, 1,
2.101072, 0.7617452, 0.9917284, 1, 0, 0, 1, 1,
2.143482, 0.4590216, 2.348365, 1, 0, 0, 1, 1,
2.167942, -1.868316, 3.340324, 1, 0, 0, 1, 1,
2.174404, -0.7476819, 2.701643, 1, 0, 0, 1, 1,
2.193038, 0.5985107, 1.092447, 1, 0, 0, 1, 1,
2.203353, -2.280255, 2.548214, 0, 0, 0, 1, 1,
2.24777, 0.6071971, 3.381833, 0, 0, 0, 1, 1,
2.249258, 0.7218535, 1.469216, 0, 0, 0, 1, 1,
2.28552, -1.477394, 1.974299, 0, 0, 0, 1, 1,
2.314184, 0.8624135, 1.497329, 0, 0, 0, 1, 1,
2.329702, -0.001848611, 1.029745, 0, 0, 0, 1, 1,
2.363574, 0.04920024, 2.399642, 0, 0, 0, 1, 1,
2.404323, -0.02615272, 0.4750323, 1, 1, 1, 1, 1,
2.405365, 1.102668, 1.545543, 1, 1, 1, 1, 1,
2.417463, 0.9215121, 1.924888, 1, 1, 1, 1, 1,
2.516555, 0.5646793, 2.053815, 1, 1, 1, 1, 1,
2.774187, 0.5234126, 2.03009, 1, 1, 1, 1, 1,
2.845508, -0.4729465, 1.048314, 1, 1, 1, 1, 1,
2.893479, -0.9734967, 2.781793, 1, 1, 1, 1, 1
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
var radius = 9.307403;
var distance = 32.69186;
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
mvMatrix.translate( 0.0614289, -0.3689103, -0.533673 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.69186);
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
