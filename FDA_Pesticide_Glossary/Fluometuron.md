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
-3.054949, -0.3329612, -2.108415, 1, 0, 0, 1,
-3.018938, 1.226972, -1.883301, 1, 0.007843138, 0, 1,
-2.488868, -0.9982411, -2.118108, 1, 0.01176471, 0, 1,
-2.456509, -0.433057, -2.158964, 1, 0.01960784, 0, 1,
-2.436452, -0.4979089, -1.614798, 1, 0.02352941, 0, 1,
-2.408046, 1.019794, -0.4422102, 1, 0.03137255, 0, 1,
-2.404061, -0.5495578, -3.796665, 1, 0.03529412, 0, 1,
-2.382055, 0.7575164, -1.864366, 1, 0.04313726, 0, 1,
-2.351509, 1.867825, 0.009263469, 1, 0.04705882, 0, 1,
-2.318591, -0.142451, -1.244059, 1, 0.05490196, 0, 1,
-2.309976, -0.4396432, -0.4722389, 1, 0.05882353, 0, 1,
-2.304646, -0.862364, -0.3009806, 1, 0.06666667, 0, 1,
-2.25684, -0.03753443, -1.139804, 1, 0.07058824, 0, 1,
-2.243864, -0.7925408, -1.134063, 1, 0.07843138, 0, 1,
-2.205542, -1.423726, -2.908164, 1, 0.08235294, 0, 1,
-2.190017, -0.5115247, -3.798769, 1, 0.09019608, 0, 1,
-2.186128, -1.166711, -1.30312, 1, 0.09411765, 0, 1,
-2.143387, 2.018914, -1.849198, 1, 0.1019608, 0, 1,
-2.141697, -1.377294, -0.8951909, 1, 0.1098039, 0, 1,
-2.101376, 1.772951, -0.219353, 1, 0.1137255, 0, 1,
-2.073751, -1.394821, -2.308705, 1, 0.1215686, 0, 1,
-2.067864, -1.286745, -2.33388, 1, 0.1254902, 0, 1,
-2.063962, 0.3137973, -2.742343, 1, 0.1333333, 0, 1,
-2.039102, -1.167029, -1.664603, 1, 0.1372549, 0, 1,
-2.024763, -0.1986393, -0.6945942, 1, 0.145098, 0, 1,
-2.019051, 1.158477, -2.314483, 1, 0.1490196, 0, 1,
-2.016825, 0.4658743, -0.06724681, 1, 0.1568628, 0, 1,
-2.012202, -2.685872, -3.437901, 1, 0.1607843, 0, 1,
-1.987634, 0.8005431, -0.9852251, 1, 0.1686275, 0, 1,
-1.977764, 1.606109, -0.8121654, 1, 0.172549, 0, 1,
-1.965424, 0.466766, -2.731209, 1, 0.1803922, 0, 1,
-1.954445, 0.07699416, -2.399336, 1, 0.1843137, 0, 1,
-1.940911, -0.8619335, -1.326573, 1, 0.1921569, 0, 1,
-1.895601, 1.774677, -1.391156, 1, 0.1960784, 0, 1,
-1.877071, -0.5849965, -2.505477, 1, 0.2039216, 0, 1,
-1.867486, 0.7642981, -1.802997, 1, 0.2117647, 0, 1,
-1.864897, 0.8866277, -0.8702897, 1, 0.2156863, 0, 1,
-1.856488, -0.517108, 0.2321065, 1, 0.2235294, 0, 1,
-1.83246, -1.812371, -2.891042, 1, 0.227451, 0, 1,
-1.830646, 1.241168, -1.281947, 1, 0.2352941, 0, 1,
-1.805564, -0.1488323, -1.295135, 1, 0.2392157, 0, 1,
-1.788307, 0.4565481, -1.436257, 1, 0.2470588, 0, 1,
-1.781259, -1.124288, -2.885712, 1, 0.2509804, 0, 1,
-1.777271, 0.4846292, -2.315834, 1, 0.2588235, 0, 1,
-1.775379, 0.0005054498, -2.174961, 1, 0.2627451, 0, 1,
-1.76457, -0.4957156, -1.516271, 1, 0.2705882, 0, 1,
-1.763145, 0.1787775, -0.9036508, 1, 0.2745098, 0, 1,
-1.760127, -1.163609, -3.125576, 1, 0.282353, 0, 1,
-1.748138, -0.6443168, -1.125127, 1, 0.2862745, 0, 1,
-1.743118, 1.049304, -0.8859389, 1, 0.2941177, 0, 1,
-1.740623, 0.2233805, 0.5037333, 1, 0.3019608, 0, 1,
-1.722801, -0.9706638, -3.522407, 1, 0.3058824, 0, 1,
-1.717552, -0.3049228, -1.454443, 1, 0.3137255, 0, 1,
-1.708876, 2.018502, -0.5647444, 1, 0.3176471, 0, 1,
-1.705558, 0.4981581, -0.758486, 1, 0.3254902, 0, 1,
-1.692456, -0.7481947, -1.843877, 1, 0.3294118, 0, 1,
-1.675814, 0.9497155, -0.7696679, 1, 0.3372549, 0, 1,
-1.672164, 1.584828, -1.21316, 1, 0.3411765, 0, 1,
-1.661467, 1.940621, 0.3229659, 1, 0.3490196, 0, 1,
-1.658335, 0.4058826, -1.927007, 1, 0.3529412, 0, 1,
-1.657614, 0.4052045, -0.3859352, 1, 0.3607843, 0, 1,
-1.657135, 1.484161, -0.5466434, 1, 0.3647059, 0, 1,
-1.646637, 0.7685805, -1.934824, 1, 0.372549, 0, 1,
-1.605668, -0.822197, -2.257611, 1, 0.3764706, 0, 1,
-1.59275, -0.3983831, -0.9957368, 1, 0.3843137, 0, 1,
-1.571418, -0.5023506, -3.59819, 1, 0.3882353, 0, 1,
-1.556133, 0.8424988, -1.054059, 1, 0.3960784, 0, 1,
-1.552097, -0.07260301, 0.531898, 1, 0.4039216, 0, 1,
-1.5418, -1.408575, -1.304663, 1, 0.4078431, 0, 1,
-1.518021, -0.4922512, -0.8231879, 1, 0.4156863, 0, 1,
-1.515155, 1.269879, -1.588741, 1, 0.4196078, 0, 1,
-1.514015, -0.4847804, -2.498218, 1, 0.427451, 0, 1,
-1.512174, -1.388194, -1.129825, 1, 0.4313726, 0, 1,
-1.511085, -0.2999776, -1.729035, 1, 0.4392157, 0, 1,
-1.508196, -2.250811, -1.915296, 1, 0.4431373, 0, 1,
-1.498394, -0.7012121, -1.127573, 1, 0.4509804, 0, 1,
-1.489831, 0.03177637, -1.701317, 1, 0.454902, 0, 1,
-1.487405, -0.8380865, -1.551971, 1, 0.4627451, 0, 1,
-1.477165, -0.1076625, -1.458356, 1, 0.4666667, 0, 1,
-1.469996, -1.000409, -3.227639, 1, 0.4745098, 0, 1,
-1.467689, 0.6698188, -1.819407, 1, 0.4784314, 0, 1,
-1.464224, 0.1120108, -0.9760517, 1, 0.4862745, 0, 1,
-1.455437, -1.331071, -0.7699378, 1, 0.4901961, 0, 1,
-1.442215, -0.608546, -3.691594, 1, 0.4980392, 0, 1,
-1.43919, 0.1811179, -1.488801, 1, 0.5058824, 0, 1,
-1.433119, 0.2696402, -0.5464769, 1, 0.509804, 0, 1,
-1.427444, -1.442248, -1.460122, 1, 0.5176471, 0, 1,
-1.404646, 0.3598849, -0.2989926, 1, 0.5215687, 0, 1,
-1.399983, 0.1229831, -1.979997, 1, 0.5294118, 0, 1,
-1.393678, 1.109403, -2.459549, 1, 0.5333334, 0, 1,
-1.393335, -1.044047, -2.601992, 1, 0.5411765, 0, 1,
-1.382313, 0.372696, -1.938351, 1, 0.5450981, 0, 1,
-1.378834, -0.5956894, -0.4533935, 1, 0.5529412, 0, 1,
-1.37148, -0.1611488, -0.575657, 1, 0.5568628, 0, 1,
-1.366664, 0.6777086, -2.005479, 1, 0.5647059, 0, 1,
-1.348354, 0.5208853, -1.518651, 1, 0.5686275, 0, 1,
-1.343847, -0.5298723, -0.9328305, 1, 0.5764706, 0, 1,
-1.343526, -0.2945507, -0.9491531, 1, 0.5803922, 0, 1,
-1.338691, 0.1172049, 0.9661329, 1, 0.5882353, 0, 1,
-1.336858, -1.341644, -1.356234, 1, 0.5921569, 0, 1,
-1.334891, 1.153306, -1.305545, 1, 0.6, 0, 1,
-1.319382, 0.267162, -1.487098, 1, 0.6078432, 0, 1,
-1.311496, 1.549621, 0.428984, 1, 0.6117647, 0, 1,
-1.300501, -0.1654033, -0.7721149, 1, 0.6196079, 0, 1,
-1.299981, 0.624661, -2.10162, 1, 0.6235294, 0, 1,
-1.297226, 1.243415, -0.4586929, 1, 0.6313726, 0, 1,
-1.295082, -0.6812336, -2.579863, 1, 0.6352941, 0, 1,
-1.292405, 0.3531773, -2.04744, 1, 0.6431373, 0, 1,
-1.290576, 1.446105, -0.9267082, 1, 0.6470588, 0, 1,
-1.277538, -0.1339637, -0.2357741, 1, 0.654902, 0, 1,
-1.272535, -0.18821, -3.673684, 1, 0.6588235, 0, 1,
-1.265286, 1.209802, -1.249999, 1, 0.6666667, 0, 1,
-1.264876, 0.1008094, -1.530959, 1, 0.6705883, 0, 1,
-1.245929, 0.9252477, 2.071637, 1, 0.6784314, 0, 1,
-1.231856, -1.186085, -2.363297, 1, 0.682353, 0, 1,
-1.227204, -1.866686, -3.075248, 1, 0.6901961, 0, 1,
-1.2229, -0.05124049, -0.8240874, 1, 0.6941177, 0, 1,
-1.217357, -0.5668598, -2.26074, 1, 0.7019608, 0, 1,
-1.212311, 0.073838, -1.857178, 1, 0.7098039, 0, 1,
-1.197935, 1.120607, -1.801943, 1, 0.7137255, 0, 1,
-1.174462, 0.873446, -2.15878, 1, 0.7215686, 0, 1,
-1.171389, 0.7729115, 1.397776, 1, 0.7254902, 0, 1,
-1.165387, -1.482952, -3.89555, 1, 0.7333333, 0, 1,
-1.164751, 0.2484433, -1.61488, 1, 0.7372549, 0, 1,
-1.159446, -0.3464767, -3.018126, 1, 0.7450981, 0, 1,
-1.15907, 2.959392, 1.018417, 1, 0.7490196, 0, 1,
-1.154962, 0.2540286, -1.371486, 1, 0.7568628, 0, 1,
-1.150303, 0.8138747, -1.336697, 1, 0.7607843, 0, 1,
-1.146268, -0.6026036, -1.713001, 1, 0.7686275, 0, 1,
-1.14605, 1.088379, -0.4502197, 1, 0.772549, 0, 1,
-1.133968, -0.9497949, -2.758057, 1, 0.7803922, 0, 1,
-1.131961, -0.1986641, -0.1716974, 1, 0.7843137, 0, 1,
-1.13064, 0.439632, -0.7987784, 1, 0.7921569, 0, 1,
-1.129488, 0.5789009, -0.8874364, 1, 0.7960784, 0, 1,
-1.128954, 0.2915289, -1.742025, 1, 0.8039216, 0, 1,
-1.128212, -0.5232541, -1.648775, 1, 0.8117647, 0, 1,
-1.126353, -1.968993, -2.364116, 1, 0.8156863, 0, 1,
-1.125677, 0.5489622, -1.818264, 1, 0.8235294, 0, 1,
-1.121006, 0.2101073, -2.168964, 1, 0.827451, 0, 1,
-1.115589, -2.197568, -3.601032, 1, 0.8352941, 0, 1,
-1.110369, 1.195746, -0.8701887, 1, 0.8392157, 0, 1,
-1.103692, 1.102102, 0.9252535, 1, 0.8470588, 0, 1,
-1.099865, 1.286058, -1.723186, 1, 0.8509804, 0, 1,
-1.094298, 0.5504909, 0.1328049, 1, 0.8588235, 0, 1,
-1.093111, 1.263843, -1.422713, 1, 0.8627451, 0, 1,
-1.090112, 0.4820562, -2.480588, 1, 0.8705882, 0, 1,
-1.089864, 1.589766, 0.1264331, 1, 0.8745098, 0, 1,
-1.087894, 0.2250257, -2.828758, 1, 0.8823529, 0, 1,
-1.087847, 0.1031118, -1.792486, 1, 0.8862745, 0, 1,
-1.08621, -0.5915046, -3.094633, 1, 0.8941177, 0, 1,
-1.077676, -1.065251, -1.451567, 1, 0.8980392, 0, 1,
-1.071928, -0.1507813, -0.3466476, 1, 0.9058824, 0, 1,
-1.071854, -2.235079, -2.081705, 1, 0.9137255, 0, 1,
-1.064454, 0.007285344, -0.4672507, 1, 0.9176471, 0, 1,
-1.051326, -0.7385439, -3.065463, 1, 0.9254902, 0, 1,
-1.050927, -0.2986208, -3.487438, 1, 0.9294118, 0, 1,
-1.048439, -1.745525, -2.557296, 1, 0.9372549, 0, 1,
-1.042468, -1.072285, -4.312891, 1, 0.9411765, 0, 1,
-1.026332, 0.4768446, 0.04381066, 1, 0.9490196, 0, 1,
-1.020787, 0.8689546, -3.027492, 1, 0.9529412, 0, 1,
-1.016978, -1.783628, -2.69641, 1, 0.9607843, 0, 1,
-1.016723, -1.389245, -1.937116, 1, 0.9647059, 0, 1,
-1.014588, 1.845283, -1.597505, 1, 0.972549, 0, 1,
-1.014571, -0.1006084, -1.891426, 1, 0.9764706, 0, 1,
-1.010867, 1.105716, 0.4065993, 1, 0.9843137, 0, 1,
-1.010079, -0.7121667, -2.882555, 1, 0.9882353, 0, 1,
-1.00986, -0.3484138, -2.586743, 1, 0.9960784, 0, 1,
-0.9971457, 0.5577733, -0.01487743, 0.9960784, 1, 0, 1,
-0.9945795, -2.100742, -1.072824, 0.9921569, 1, 0, 1,
-0.992936, 0.7725176, -2.924435, 0.9843137, 1, 0, 1,
-0.9927669, 0.532784, -2.006193, 0.9803922, 1, 0, 1,
-0.9873873, 0.6772354, -0.7636799, 0.972549, 1, 0, 1,
-0.9864126, -0.2703763, -3.197405, 0.9686275, 1, 0, 1,
-0.9830543, 1.152246, -1.234515, 0.9607843, 1, 0, 1,
-0.9698617, 1.166506, 1.253108, 0.9568627, 1, 0, 1,
-0.9694396, 0.534519, -1.768848, 0.9490196, 1, 0, 1,
-0.953667, 0.062915, -2.423772, 0.945098, 1, 0, 1,
-0.9531736, -0.06556402, -2.884643, 0.9372549, 1, 0, 1,
-0.9506335, 1.727872, -0.4097829, 0.9333333, 1, 0, 1,
-0.9452519, 1.052218, -0.3307363, 0.9254902, 1, 0, 1,
-0.9389905, -2.440082, -1.675726, 0.9215686, 1, 0, 1,
-0.9378423, -1.089726, -3.152211, 0.9137255, 1, 0, 1,
-0.9377522, -0.7146111, -2.684929, 0.9098039, 1, 0, 1,
-0.935515, -0.9451715, -2.509196, 0.9019608, 1, 0, 1,
-0.9290211, -0.6362972, -1.018341, 0.8941177, 1, 0, 1,
-0.9251149, 0.9458697, -0.1884484, 0.8901961, 1, 0, 1,
-0.9239846, -0.7738379, -2.499666, 0.8823529, 1, 0, 1,
-0.9234213, -0.9530533, -3.922358, 0.8784314, 1, 0, 1,
-0.9209741, 0.3135739, -0.01618283, 0.8705882, 1, 0, 1,
-0.9182059, 1.726745, -0.8096755, 0.8666667, 1, 0, 1,
-0.9159883, -0.5091236, -3.343278, 0.8588235, 1, 0, 1,
-0.9154208, 0.01717029, -1.979228, 0.854902, 1, 0, 1,
-0.9125038, 0.8846185, -2.20976, 0.8470588, 1, 0, 1,
-0.911286, 0.7358909, -0.1913678, 0.8431373, 1, 0, 1,
-0.9074901, -2.135893, -1.263821, 0.8352941, 1, 0, 1,
-0.9040345, 0.4730591, -0.7277058, 0.8313726, 1, 0, 1,
-0.8988805, -3.35603, -2.728934, 0.8235294, 1, 0, 1,
-0.8862969, -2.958186, -3.669051, 0.8196079, 1, 0, 1,
-0.8842484, 0.5468793, -2.364562, 0.8117647, 1, 0, 1,
-0.8794258, 0.07109395, -2.047405, 0.8078431, 1, 0, 1,
-0.8786062, -1.757143, -2.609373, 0.8, 1, 0, 1,
-0.8743724, 0.4249676, -2.384872, 0.7921569, 1, 0, 1,
-0.8729615, -0.152575, -0.6282838, 0.7882353, 1, 0, 1,
-0.8653252, -0.963174, -1.508099, 0.7803922, 1, 0, 1,
-0.8633175, -0.4629285, -1.781848, 0.7764706, 1, 0, 1,
-0.8632067, -1.207166, -3.746263, 0.7686275, 1, 0, 1,
-0.8563504, -0.5761179, -0.5651981, 0.7647059, 1, 0, 1,
-0.8560591, 0.8514062, -1.059825, 0.7568628, 1, 0, 1,
-0.8484468, 1.623055, 0.02844643, 0.7529412, 1, 0, 1,
-0.8479787, -0.5174135, -1.45417, 0.7450981, 1, 0, 1,
-0.8470002, -0.2994864, -2.990083, 0.7411765, 1, 0, 1,
-0.8450346, -2.394117, -2.728244, 0.7333333, 1, 0, 1,
-0.8448522, -0.6897808, -4.505486, 0.7294118, 1, 0, 1,
-0.8421592, 0.5311196, 1.399617, 0.7215686, 1, 0, 1,
-0.8408512, 0.309973, -0.7074796, 0.7176471, 1, 0, 1,
-0.8397211, -2.293422, -2.427413, 0.7098039, 1, 0, 1,
-0.8212432, 0.01851621, -1.798934, 0.7058824, 1, 0, 1,
-0.8187606, -0.3205289, -1.256262, 0.6980392, 1, 0, 1,
-0.8187361, -1.090408, -2.560002, 0.6901961, 1, 0, 1,
-0.8181747, -0.8795403, -3.525349, 0.6862745, 1, 0, 1,
-0.8093666, 1.207553, -0.2982987, 0.6784314, 1, 0, 1,
-0.8050698, 0.3623864, -1.751281, 0.6745098, 1, 0, 1,
-0.797473, 0.3260273, -1.376748, 0.6666667, 1, 0, 1,
-0.7891599, -0.2432246, -1.71454, 0.6627451, 1, 0, 1,
-0.7773587, 0.6418109, -0.01026634, 0.654902, 1, 0, 1,
-0.776045, -0.8168048, -0.7029749, 0.6509804, 1, 0, 1,
-0.7713977, -1.032816, -3.819757, 0.6431373, 1, 0, 1,
-0.7680099, 1.726604, -0.2741091, 0.6392157, 1, 0, 1,
-0.7658214, -1.398758, -2.57309, 0.6313726, 1, 0, 1,
-0.7619572, 1.746725, 0.1298487, 0.627451, 1, 0, 1,
-0.7585574, -0.3485326, -2.433584, 0.6196079, 1, 0, 1,
-0.7563585, 0.5139114, 0.3078521, 0.6156863, 1, 0, 1,
-0.7557527, 0.213818, -1.724995, 0.6078432, 1, 0, 1,
-0.7513069, -1.774703, -0.8640612, 0.6039216, 1, 0, 1,
-0.7484559, -0.2822053, -1.102776, 0.5960785, 1, 0, 1,
-0.7478514, -1.188676, -1.37086, 0.5882353, 1, 0, 1,
-0.7427526, 1.763561, 0.06135477, 0.5843138, 1, 0, 1,
-0.7421942, -0.3323884, -3.27048, 0.5764706, 1, 0, 1,
-0.7323043, 0.2853015, -1.636629, 0.572549, 1, 0, 1,
-0.7273635, -0.896788, -0.7650551, 0.5647059, 1, 0, 1,
-0.72721, -0.5583963, -2.506564, 0.5607843, 1, 0, 1,
-0.7269116, -1.846149, -1.2988, 0.5529412, 1, 0, 1,
-0.7218621, 2.005966, -1.469076, 0.5490196, 1, 0, 1,
-0.7197714, -0.05927536, -0.8375063, 0.5411765, 1, 0, 1,
-0.7193922, -1.169792, -2.057247, 0.5372549, 1, 0, 1,
-0.7136547, -1.381809, -4.050986, 0.5294118, 1, 0, 1,
-0.7116282, -0.9061836, -2.466599, 0.5254902, 1, 0, 1,
-0.7095574, 0.598635, -1.717129, 0.5176471, 1, 0, 1,
-0.7017845, -1.781391, -1.51987, 0.5137255, 1, 0, 1,
-0.6945645, -0.6898876, -0.4038318, 0.5058824, 1, 0, 1,
-0.6918717, 1.070946, 0.3959775, 0.5019608, 1, 0, 1,
-0.6837371, 1.282352, 0.3950635, 0.4941176, 1, 0, 1,
-0.6794481, 0.4196941, -1.055748, 0.4862745, 1, 0, 1,
-0.6782161, 0.007305329, -1.743448, 0.4823529, 1, 0, 1,
-0.6776668, -0.4081959, -0.8885203, 0.4745098, 1, 0, 1,
-0.6775407, 0.7179339, -0.04131102, 0.4705882, 1, 0, 1,
-0.6767877, -0.1200069, -1.605018, 0.4627451, 1, 0, 1,
-0.6728358, -0.4890259, -2.326487, 0.4588235, 1, 0, 1,
-0.669464, 0.6154984, -0.6206574, 0.4509804, 1, 0, 1,
-0.6657358, -0.4083445, -2.339415, 0.4470588, 1, 0, 1,
-0.6639202, 1.23984, -0.7702178, 0.4392157, 1, 0, 1,
-0.6622679, -0.6791497, -1.410307, 0.4352941, 1, 0, 1,
-0.6594002, -1.002566, -2.100213, 0.427451, 1, 0, 1,
-0.6507785, 0.3412682, -0.6149471, 0.4235294, 1, 0, 1,
-0.6497383, -0.9847643, -3.05316, 0.4156863, 1, 0, 1,
-0.6490553, -0.02844475, -0.7539174, 0.4117647, 1, 0, 1,
-0.6488724, -0.6416501, -2.471738, 0.4039216, 1, 0, 1,
-0.6483889, 0.5738885, -1.650428, 0.3960784, 1, 0, 1,
-0.6468642, -0.3191948, -0.4665336, 0.3921569, 1, 0, 1,
-0.6458855, 0.100222, -1.750964, 0.3843137, 1, 0, 1,
-0.6457878, 0.3387904, -1.611438, 0.3803922, 1, 0, 1,
-0.6392528, 0.2193825, -1.505342, 0.372549, 1, 0, 1,
-0.63903, -0.1295548, -2.099069, 0.3686275, 1, 0, 1,
-0.6292956, 0.9883144, -0.8305698, 0.3607843, 1, 0, 1,
-0.6286745, -0.725738, -4.268526, 0.3568628, 1, 0, 1,
-0.6284859, -0.31569, -2.277, 0.3490196, 1, 0, 1,
-0.6242772, -0.6388308, -3.052121, 0.345098, 1, 0, 1,
-0.6160725, 0.3775606, 0.665037, 0.3372549, 1, 0, 1,
-0.6148312, -0.05611423, -1.906202, 0.3333333, 1, 0, 1,
-0.6146688, -0.09201257, -2.524895, 0.3254902, 1, 0, 1,
-0.6110889, -1.082749, -4.118262, 0.3215686, 1, 0, 1,
-0.6079648, 0.2143831, -1.391229, 0.3137255, 1, 0, 1,
-0.606899, -1.110862, -3.44348, 0.3098039, 1, 0, 1,
-0.6054026, 1.998554, 0.3826627, 0.3019608, 1, 0, 1,
-0.6043856, -0.4252564, -2.267581, 0.2941177, 1, 0, 1,
-0.6034816, -0.50234, -1.770187, 0.2901961, 1, 0, 1,
-0.6025237, -0.5277978, -0.7684304, 0.282353, 1, 0, 1,
-0.5958924, 0.07214154, -2.150852, 0.2784314, 1, 0, 1,
-0.5956579, 0.5847299, 0.9173816, 0.2705882, 1, 0, 1,
-0.5848789, -0.06364819, -2.430081, 0.2666667, 1, 0, 1,
-0.5828098, 2.070229, 0.6576793, 0.2588235, 1, 0, 1,
-0.5819422, -0.6292082, -1.72113, 0.254902, 1, 0, 1,
-0.5783205, -0.5800067, -6.144077, 0.2470588, 1, 0, 1,
-0.5766126, 0.3361903, 1.418291, 0.2431373, 1, 0, 1,
-0.5745429, 1.222569, -0.8445, 0.2352941, 1, 0, 1,
-0.573711, 0.6749394, -1.28809, 0.2313726, 1, 0, 1,
-0.5731322, -0.9760256, -3.022243, 0.2235294, 1, 0, 1,
-0.5696443, 0.2812857, -1.263497, 0.2196078, 1, 0, 1,
-0.5688704, -0.313479, -0.3468944, 0.2117647, 1, 0, 1,
-0.5635724, 2.064742, -0.8534105, 0.2078431, 1, 0, 1,
-0.563095, -0.2722363, -3.168857, 0.2, 1, 0, 1,
-0.5628967, -0.06090694, -0.2531671, 0.1921569, 1, 0, 1,
-0.5624576, -0.1935144, -1.567277, 0.1882353, 1, 0, 1,
-0.5599408, -0.4272001, 0.3735492, 0.1803922, 1, 0, 1,
-0.5591097, -0.4712736, -2.981651, 0.1764706, 1, 0, 1,
-0.5557106, 0.541532, -2.262428, 0.1686275, 1, 0, 1,
-0.5540799, -0.4202652, -0.4824793, 0.1647059, 1, 0, 1,
-0.5522725, -0.5049582, -1.597979, 0.1568628, 1, 0, 1,
-0.5517858, 0.2788728, -1.92922, 0.1529412, 1, 0, 1,
-0.5413335, -0.987712, -2.213653, 0.145098, 1, 0, 1,
-0.5394285, -0.565759, -2.422523, 0.1411765, 1, 0, 1,
-0.5310872, -1.529299, -2.704689, 0.1333333, 1, 0, 1,
-0.5308487, 0.3538721, -0.9331996, 0.1294118, 1, 0, 1,
-0.5296433, 0.1232951, 0.2419132, 0.1215686, 1, 0, 1,
-0.5212845, -1.388493, -2.543318, 0.1176471, 1, 0, 1,
-0.5205714, 1.839584, -2.351511, 0.1098039, 1, 0, 1,
-0.5175117, 0.7231704, -0.7165278, 0.1058824, 1, 0, 1,
-0.5170912, -0.5070502, -3.480627, 0.09803922, 1, 0, 1,
-0.5094562, -0.6728968, -0.7082525, 0.09019608, 1, 0, 1,
-0.508864, -0.1041991, -2.672486, 0.08627451, 1, 0, 1,
-0.5064791, 0.1012631, -0.9550987, 0.07843138, 1, 0, 1,
-0.5052128, -0.8040585, -2.441988, 0.07450981, 1, 0, 1,
-0.4959382, -0.8965386, -1.856008, 0.06666667, 1, 0, 1,
-0.495682, 0.4980811, 1.487368, 0.0627451, 1, 0, 1,
-0.4937495, -0.01534893, -0.6333224, 0.05490196, 1, 0, 1,
-0.4931629, 0.5868033, -1.442504, 0.05098039, 1, 0, 1,
-0.4930274, -1.073839, -2.587429, 0.04313726, 1, 0, 1,
-0.488906, 0.2593364, -1.517976, 0.03921569, 1, 0, 1,
-0.4884738, -0.572518, -3.514351, 0.03137255, 1, 0, 1,
-0.4836661, -1.064073, -2.462006, 0.02745098, 1, 0, 1,
-0.480814, -0.3743242, -1.971933, 0.01960784, 1, 0, 1,
-0.4805437, 0.8218321, -0.06667304, 0.01568628, 1, 0, 1,
-0.4805061, 0.6450635, -0.6970756, 0.007843138, 1, 0, 1,
-0.4800874, -0.1824401, -2.439768, 0.003921569, 1, 0, 1,
-0.4792605, 1.395013, 0.9947233, 0, 1, 0.003921569, 1,
-0.4748091, -0.3526218, -1.691171, 0, 1, 0.01176471, 1,
-0.4712484, -0.2092988, -1.693238, 0, 1, 0.01568628, 1,
-0.4694535, -0.8638538, -1.890617, 0, 1, 0.02352941, 1,
-0.4692757, 0.6109723, -0.9378462, 0, 1, 0.02745098, 1,
-0.4687723, 2.058377, -0.2291828, 0, 1, 0.03529412, 1,
-0.4596899, 0.1278942, -0.5034651, 0, 1, 0.03921569, 1,
-0.454867, 0.186532, -1.360899, 0, 1, 0.04705882, 1,
-0.4547733, 0.01789152, -2.00699, 0, 1, 0.05098039, 1,
-0.4515708, -0.3739218, -4.250013, 0, 1, 0.05882353, 1,
-0.4510296, 0.1102788, -2.195676, 0, 1, 0.0627451, 1,
-0.4507217, 0.6409642, -1.987807, 0, 1, 0.07058824, 1,
-0.4503981, 0.6140295, -1.505007, 0, 1, 0.07450981, 1,
-0.4413879, 0.3657028, 0.2611312, 0, 1, 0.08235294, 1,
-0.4396481, 0.8729859, -2.277634, 0, 1, 0.08627451, 1,
-0.4318001, 1.308578, -0.8633326, 0, 1, 0.09411765, 1,
-0.430341, 0.2288911, -0.6424235, 0, 1, 0.1019608, 1,
-0.4262471, 0.9878781, -0.4692195, 0, 1, 0.1058824, 1,
-0.4246593, 0.006414799, -0.3866349, 0, 1, 0.1137255, 1,
-0.4237222, -1.014008, -1.272287, 0, 1, 0.1176471, 1,
-0.4127699, 1.325661, -0.08088819, 0, 1, 0.1254902, 1,
-0.4105201, 0.02256997, -1.494753, 0, 1, 0.1294118, 1,
-0.4076345, 2.137948, -0.9969462, 0, 1, 0.1372549, 1,
-0.4065077, -0.1643656, -0.4814983, 0, 1, 0.1411765, 1,
-0.402842, -1.842316, -4.194839, 0, 1, 0.1490196, 1,
-0.3980004, -0.3620089, -2.19952, 0, 1, 0.1529412, 1,
-0.3969606, -1.808963, -2.126222, 0, 1, 0.1607843, 1,
-0.3967414, -2.363409, -1.870996, 0, 1, 0.1647059, 1,
-0.3950952, 0.9728728, -1.417132, 0, 1, 0.172549, 1,
-0.3896225, -0.9024071, -3.978017, 0, 1, 0.1764706, 1,
-0.3879563, 0.6331704, 0.4813576, 0, 1, 0.1843137, 1,
-0.3877552, -0.3564798, -2.608169, 0, 1, 0.1882353, 1,
-0.3869357, -1.890912, -4.084254, 0, 1, 0.1960784, 1,
-0.3838355, -0.8279739, -2.859268, 0, 1, 0.2039216, 1,
-0.3799619, 0.7151689, 0.07688649, 0, 1, 0.2078431, 1,
-0.374464, 0.8963947, -1.508442, 0, 1, 0.2156863, 1,
-0.3738519, -0.3068307, -1.680138, 0, 1, 0.2196078, 1,
-0.3731624, -0.161161, -2.391881, 0, 1, 0.227451, 1,
-0.3697602, 1.280314, 0.334054, 0, 1, 0.2313726, 1,
-0.3676227, -1.316611, -1.492566, 0, 1, 0.2392157, 1,
-0.3606404, -1.736186, -3.819387, 0, 1, 0.2431373, 1,
-0.3594098, -1.94939, -3.442822, 0, 1, 0.2509804, 1,
-0.3579068, -0.5781059, -3.008959, 0, 1, 0.254902, 1,
-0.3564831, 0.1553735, -0.5671965, 0, 1, 0.2627451, 1,
-0.355832, -1.317758, -3.070474, 0, 1, 0.2666667, 1,
-0.3556087, -0.7840244, -0.9025855, 0, 1, 0.2745098, 1,
-0.3549005, 0.2888938, -1.704355, 0, 1, 0.2784314, 1,
-0.3531615, 1.442805, 1.016489, 0, 1, 0.2862745, 1,
-0.3527037, -0.6482418, -3.749082, 0, 1, 0.2901961, 1,
-0.3513963, 0.2156308, -1.132098, 0, 1, 0.2980392, 1,
-0.3485946, -0.4921384, -1.337032, 0, 1, 0.3058824, 1,
-0.348449, -0.6596396, -3.732521, 0, 1, 0.3098039, 1,
-0.3462428, 0.9310009, 0.1686944, 0, 1, 0.3176471, 1,
-0.3458211, 0.7271265, -0.2966365, 0, 1, 0.3215686, 1,
-0.3446614, 1.53971, 1.463415, 0, 1, 0.3294118, 1,
-0.3435409, -1.412659, -3.331192, 0, 1, 0.3333333, 1,
-0.3419982, 0.08868178, -2.954202, 0, 1, 0.3411765, 1,
-0.3368025, 0.03687863, -2.163451, 0, 1, 0.345098, 1,
-0.332635, 0.1990748, -1.842985, 0, 1, 0.3529412, 1,
-0.3242953, -0.01821806, 1.258418, 0, 1, 0.3568628, 1,
-0.3155609, 1.387693, -0.7651606, 0, 1, 0.3647059, 1,
-0.3053235, 2.22318, -0.2233419, 0, 1, 0.3686275, 1,
-0.3002703, -0.4197651, -1.10399, 0, 1, 0.3764706, 1,
-0.2971078, 0.5321314, 1.347084, 0, 1, 0.3803922, 1,
-0.2954462, -2.975445, -3.687909, 0, 1, 0.3882353, 1,
-0.2950358, -1.817846, -2.838103, 0, 1, 0.3921569, 1,
-0.2871568, -0.9846016, -3.367677, 0, 1, 0.4, 1,
-0.2862669, 1.019631, -0.7837859, 0, 1, 0.4078431, 1,
-0.283677, -0.8314775, -2.331746, 0, 1, 0.4117647, 1,
-0.2836162, 0.9397825, 0.5333813, 0, 1, 0.4196078, 1,
-0.277664, -0.7154439, -3.838587, 0, 1, 0.4235294, 1,
-0.2762111, -1.652405, -4.333227, 0, 1, 0.4313726, 1,
-0.2748488, -1.355585, -1.832355, 0, 1, 0.4352941, 1,
-0.2732492, -0.2119468, -3.062901, 0, 1, 0.4431373, 1,
-0.2698486, 0.5928239, 0.748215, 0, 1, 0.4470588, 1,
-0.2685132, 1.215945, 0.0837239, 0, 1, 0.454902, 1,
-0.2656484, 1.842906, -0.5984378, 0, 1, 0.4588235, 1,
-0.264598, -0.09976939, -0.3229675, 0, 1, 0.4666667, 1,
-0.262144, 0.04368732, -0.960459, 0, 1, 0.4705882, 1,
-0.2590553, -0.9613529, -3.815958, 0, 1, 0.4784314, 1,
-0.2585186, 0.6273797, -2.275751, 0, 1, 0.4823529, 1,
-0.2562777, -2.336194, -2.382586, 0, 1, 0.4901961, 1,
-0.2525044, -0.5544515, -3.621815, 0, 1, 0.4941176, 1,
-0.252429, 0.1810924, 0.09221677, 0, 1, 0.5019608, 1,
-0.2520705, 0.1463212, 0.3000764, 0, 1, 0.509804, 1,
-0.2510603, 0.5585238, -0.7951857, 0, 1, 0.5137255, 1,
-0.2506193, 0.4324768, -1.18341, 0, 1, 0.5215687, 1,
-0.2445991, -0.1119026, -1.318041, 0, 1, 0.5254902, 1,
-0.2436964, -0.3848921, -2.167164, 0, 1, 0.5333334, 1,
-0.2405326, -0.3702071, -3.216734, 0, 1, 0.5372549, 1,
-0.2263294, 1.111511, 0.004938853, 0, 1, 0.5450981, 1,
-0.2260182, 0.06135104, -1.038102, 0, 1, 0.5490196, 1,
-0.2255005, -0.1521212, -1.666046, 0, 1, 0.5568628, 1,
-0.2249978, 1.327472, 1.085675, 0, 1, 0.5607843, 1,
-0.2207701, -0.5747792, -2.412289, 0, 1, 0.5686275, 1,
-0.2185947, 0.198799, -1.237051, 0, 1, 0.572549, 1,
-0.218141, 0.6219065, 0.4162754, 0, 1, 0.5803922, 1,
-0.2179688, 0.1707756, -1.904475, 0, 1, 0.5843138, 1,
-0.2178252, 1.540608, 0.7537124, 0, 1, 0.5921569, 1,
-0.2158197, -1.21024, -2.444881, 0, 1, 0.5960785, 1,
-0.2130966, 0.6658238, 0.7307837, 0, 1, 0.6039216, 1,
-0.2073643, 0.5859625, 1.057079, 0, 1, 0.6117647, 1,
-0.2068264, -0.7153752, -2.563758, 0, 1, 0.6156863, 1,
-0.2045419, 0.09162485, -1.787395, 0, 1, 0.6235294, 1,
-0.2040273, 0.7193587, 0.4681352, 0, 1, 0.627451, 1,
-0.203879, 1.189163, -0.2990887, 0, 1, 0.6352941, 1,
-0.2011423, 1.395666, 1.9045, 0, 1, 0.6392157, 1,
-0.1994069, -1.087609, -2.24371, 0, 1, 0.6470588, 1,
-0.1973103, 1.572129, 1.465942, 0, 1, 0.6509804, 1,
-0.1926949, -0.3859651, -2.027442, 0, 1, 0.6588235, 1,
-0.1871371, -0.0975325, -2.720015, 0, 1, 0.6627451, 1,
-0.183393, -0.2024752, -2.223955, 0, 1, 0.6705883, 1,
-0.1828024, 0.7910545, -0.04296242, 0, 1, 0.6745098, 1,
-0.1772939, -0.3292211, -3.203014, 0, 1, 0.682353, 1,
-0.1761432, -0.610064, -2.335736, 0, 1, 0.6862745, 1,
-0.1732307, -0.4381927, -2.267823, 0, 1, 0.6941177, 1,
-0.1705807, -0.6762627, -1.751015, 0, 1, 0.7019608, 1,
-0.1695984, -0.3515296, -3.269259, 0, 1, 0.7058824, 1,
-0.1691846, 0.04426614, -2.096867, 0, 1, 0.7137255, 1,
-0.1688153, 1.039105, 1.217012, 0, 1, 0.7176471, 1,
-0.1671046, -0.2810455, -2.167886, 0, 1, 0.7254902, 1,
-0.166353, -0.04953652, -1.333024, 0, 1, 0.7294118, 1,
-0.1613003, 0.5217029, -1.323186, 0, 1, 0.7372549, 1,
-0.1595086, 1.14642, -1.34417, 0, 1, 0.7411765, 1,
-0.1581188, -0.04753224, -3.944539, 0, 1, 0.7490196, 1,
-0.1556439, 0.3754531, -0.9995652, 0, 1, 0.7529412, 1,
-0.1516897, 0.3455694, 1.42592, 0, 1, 0.7607843, 1,
-0.1507135, -0.1571284, -3.296548, 0, 1, 0.7647059, 1,
-0.1493902, -0.1597214, -3.266861, 0, 1, 0.772549, 1,
-0.1470025, -0.1236487, -2.290189, 0, 1, 0.7764706, 1,
-0.1440254, -0.3125321, -2.611419, 0, 1, 0.7843137, 1,
-0.1420928, 2.154738, -0.5636807, 0, 1, 0.7882353, 1,
-0.1416916, -2.107187, -2.698087, 0, 1, 0.7960784, 1,
-0.1371999, -0.5854774, -2.501946, 0, 1, 0.8039216, 1,
-0.1350543, -1.11037, -4.346468, 0, 1, 0.8078431, 1,
-0.1342744, 0.8018211, 0.1164055, 0, 1, 0.8156863, 1,
-0.1333214, 0.7019686, -0.6738338, 0, 1, 0.8196079, 1,
-0.1322021, 1.004957, 1.198971, 0, 1, 0.827451, 1,
-0.1258608, -0.7299431, -2.524242, 0, 1, 0.8313726, 1,
-0.1151728, 0.5582636, 0.2373592, 0, 1, 0.8392157, 1,
-0.1132328, -0.8338125, -2.948931, 0, 1, 0.8431373, 1,
-0.1092203, -0.2941296, -2.348287, 0, 1, 0.8509804, 1,
-0.1071262, -0.9435623, -2.821985, 0, 1, 0.854902, 1,
-0.1041039, 0.3853076, 0.7645589, 0, 1, 0.8627451, 1,
-0.09208003, 0.7284884, -1.288337, 0, 1, 0.8666667, 1,
-0.08957636, 2.036358, 0.7591087, 0, 1, 0.8745098, 1,
-0.08812783, 1.468052, 0.7646949, 0, 1, 0.8784314, 1,
-0.08647373, -1.00002, -3.238147, 0, 1, 0.8862745, 1,
-0.08606795, -0.6033385, -4.348858, 0, 1, 0.8901961, 1,
-0.08602798, 1.839891, -1.951164, 0, 1, 0.8980392, 1,
-0.0793722, 0.8422235, -0.4228347, 0, 1, 0.9058824, 1,
-0.07890292, 1.757074, 1.968105, 0, 1, 0.9098039, 1,
-0.07875563, 1.986059, -0.3012676, 0, 1, 0.9176471, 1,
-0.07539177, 1.243727, -0.233294, 0, 1, 0.9215686, 1,
-0.07431797, 1.022474, 0.7826993, 0, 1, 0.9294118, 1,
-0.07327411, 0.8025779, -0.7320033, 0, 1, 0.9333333, 1,
-0.07268197, 0.4918181, 0.8395926, 0, 1, 0.9411765, 1,
-0.07007797, -0.1914493, -3.287988, 0, 1, 0.945098, 1,
-0.06883381, 0.01933596, -1.974343, 0, 1, 0.9529412, 1,
-0.0672827, 0.7939553, 1.196428, 0, 1, 0.9568627, 1,
-0.05818281, -0.7903639, -2.516713, 0, 1, 0.9647059, 1,
-0.04916136, 1.308025, 0.3214014, 0, 1, 0.9686275, 1,
-0.04489318, 0.5924347, -0.0571856, 0, 1, 0.9764706, 1,
-0.04166444, -0.2976574, -4.672185, 0, 1, 0.9803922, 1,
-0.04081981, 0.4567971, 0.6599548, 0, 1, 0.9882353, 1,
-0.04066367, 1.701521, 0.6098406, 0, 1, 0.9921569, 1,
-0.03500707, -0.5722723, -2.890043, 0, 1, 1, 1,
-0.03129217, 0.6034524, 0.4197557, 0, 0.9921569, 1, 1,
-0.02980276, 0.7363859, 0.09972907, 0, 0.9882353, 1, 1,
-0.0292808, 0.7245063, -0.2401253, 0, 0.9803922, 1, 1,
-0.0232577, -0.7870972, -2.794993, 0, 0.9764706, 1, 1,
-0.02322386, 0.6233632, 0.7536059, 0, 0.9686275, 1, 1,
-0.01719187, 0.03566073, 0.68352, 0, 0.9647059, 1, 1,
-0.01133757, -0.05403856, -2.534868, 0, 0.9568627, 1, 1,
-0.0111186, 1.486501, -1.443857, 0, 0.9529412, 1, 1,
-0.009338886, 1.116746, -0.6749018, 0, 0.945098, 1, 1,
-0.00816348, -0.1944497, -1.675447, 0, 0.9411765, 1, 1,
-0.007800566, -0.1637356, -2.479926, 0, 0.9333333, 1, 1,
-0.00723818, -0.8897638, -4.162485, 0, 0.9294118, 1, 1,
-0.003884103, 0.06653269, 2.492301, 0, 0.9215686, 1, 1,
-0.002534805, -1.262781, -5.343481, 0, 0.9176471, 1, 1,
-0.001781181, 0.2702567, 1.040669, 0, 0.9098039, 1, 1,
0.001800466, -1.081058, 2.939515, 0, 0.9058824, 1, 1,
0.003698892, -0.5120438, 3.51194, 0, 0.8980392, 1, 1,
0.005924035, 0.2289146, 0.8803303, 0, 0.8901961, 1, 1,
0.009261175, -0.5001711, 2.994643, 0, 0.8862745, 1, 1,
0.01022707, 0.5765038, -0.6132848, 0, 0.8784314, 1, 1,
0.01117455, 0.3356922, 0.3947704, 0, 0.8745098, 1, 1,
0.01335371, -0.8404542, 4.007468, 0, 0.8666667, 1, 1,
0.01372576, -1.024043, 2.832911, 0, 0.8627451, 1, 1,
0.02408402, 1.026504, 1.063654, 0, 0.854902, 1, 1,
0.02630158, -0.07437419, 2.291518, 0, 0.8509804, 1, 1,
0.02875647, -0.5132896, 2.279482, 0, 0.8431373, 1, 1,
0.02923838, -1.010129, 3.994726, 0, 0.8392157, 1, 1,
0.03001537, 0.3610182, 1.034933, 0, 0.8313726, 1, 1,
0.03110858, 0.4685622, -1.033397, 0, 0.827451, 1, 1,
0.03144677, -1.384416, 0.6910732, 0, 0.8196079, 1, 1,
0.03335547, 0.6865718, 1.515823, 0, 0.8156863, 1, 1,
0.03485747, 0.393897, -0.6954147, 0, 0.8078431, 1, 1,
0.03659019, -0.2295421, 2.651819, 0, 0.8039216, 1, 1,
0.04001877, 0.4270344, 0.4583366, 0, 0.7960784, 1, 1,
0.04384068, 1.084186, 0.2926334, 0, 0.7882353, 1, 1,
0.0456263, -0.7881529, 4.431165, 0, 0.7843137, 1, 1,
0.04749238, -1.242772, 3.412286, 0, 0.7764706, 1, 1,
0.04792348, -1.926202, 4.395548, 0, 0.772549, 1, 1,
0.05229476, 1.840529, -0.1509793, 0, 0.7647059, 1, 1,
0.05245468, 1.772519, -0.6391935, 0, 0.7607843, 1, 1,
0.05345935, -1.222582, 5.278753, 0, 0.7529412, 1, 1,
0.05420106, 0.2868548, 0.3570762, 0, 0.7490196, 1, 1,
0.0615981, -0.8193708, 3.552126, 0, 0.7411765, 1, 1,
0.06237001, -1.470659, 3.25969, 0, 0.7372549, 1, 1,
0.06300563, 0.9379621, -0.06743325, 0, 0.7294118, 1, 1,
0.0681993, 0.4057289, 1.336419, 0, 0.7254902, 1, 1,
0.07068116, 2.298517, 1.25663, 0, 0.7176471, 1, 1,
0.07212189, -0.1321004, 3.076317, 0, 0.7137255, 1, 1,
0.07306097, -1.273929, 3.184297, 0, 0.7058824, 1, 1,
0.07971942, 0.09390932, 1.037518, 0, 0.6980392, 1, 1,
0.08972953, 0.4983133, 2.59082, 0, 0.6941177, 1, 1,
0.09225255, -0.2022838, 2.640923, 0, 0.6862745, 1, 1,
0.1020573, -0.3524247, 3.990265, 0, 0.682353, 1, 1,
0.1042474, 0.6363177, -1.141769, 0, 0.6745098, 1, 1,
0.1048395, -0.18218, 2.29352, 0, 0.6705883, 1, 1,
0.1084049, -0.4232645, 3.554514, 0, 0.6627451, 1, 1,
0.1157388, -0.3449499, 2.929548, 0, 0.6588235, 1, 1,
0.1172235, 1.031565, 1.487143, 0, 0.6509804, 1, 1,
0.1257605, 0.3277966, 0.702143, 0, 0.6470588, 1, 1,
0.126043, 0.3874705, -3.525675, 0, 0.6392157, 1, 1,
0.1277941, -1.015812, 3.138783, 0, 0.6352941, 1, 1,
0.1283278, 0.2902229, 0.6338468, 0, 0.627451, 1, 1,
0.1287412, 0.2109396, 1.949563, 0, 0.6235294, 1, 1,
0.1329723, -0.4273158, 1.622873, 0, 0.6156863, 1, 1,
0.1371003, 1.213332, 0.4154924, 0, 0.6117647, 1, 1,
0.1371474, 0.6796382, 0.9849166, 0, 0.6039216, 1, 1,
0.1374962, 1.086057, 1.473664, 0, 0.5960785, 1, 1,
0.1445514, -0.2154427, 3.133583, 0, 0.5921569, 1, 1,
0.1454027, -0.880977, 3.993091, 0, 0.5843138, 1, 1,
0.1455649, -0.5732317, 2.6717, 0, 0.5803922, 1, 1,
0.1477381, 0.151805, 0.3661331, 0, 0.572549, 1, 1,
0.1491661, -0.5223653, 1.707016, 0, 0.5686275, 1, 1,
0.154857, -0.6092192, 2.975121, 0, 0.5607843, 1, 1,
0.1562882, -0.3781019, 2.776488, 0, 0.5568628, 1, 1,
0.1574028, 1.447496, 0.7910836, 0, 0.5490196, 1, 1,
0.1624253, 0.06339028, 0.946381, 0, 0.5450981, 1, 1,
0.1635388, 2.567126, -0.6761823, 0, 0.5372549, 1, 1,
0.1680979, 1.484333, 0.5084754, 0, 0.5333334, 1, 1,
0.1729925, -0.4185114, 3.687977, 0, 0.5254902, 1, 1,
0.1737273, 1.053593, -0.5741825, 0, 0.5215687, 1, 1,
0.1784401, -0.9213992, 2.879062, 0, 0.5137255, 1, 1,
0.182928, 0.420929, 2.00801, 0, 0.509804, 1, 1,
0.1841552, 0.772831, -0.3083704, 0, 0.5019608, 1, 1,
0.1869251, 0.7308322, 0.5013868, 0, 0.4941176, 1, 1,
0.1890862, -0.3860014, 3.639426, 0, 0.4901961, 1, 1,
0.1913521, 0.5871494, -0.1581016, 0, 0.4823529, 1, 1,
0.1975358, -0.3402614, 1.081027, 0, 0.4784314, 1, 1,
0.1988266, -0.5755983, 3.803749, 0, 0.4705882, 1, 1,
0.2005495, -0.8553564, 3.084521, 0, 0.4666667, 1, 1,
0.2113585, 0.04412594, 1.858718, 0, 0.4588235, 1, 1,
0.2133263, 1.611956, 1.110275, 0, 0.454902, 1, 1,
0.2180961, -0.5021697, 2.078864, 0, 0.4470588, 1, 1,
0.2189612, 1.707624, -1.296197, 0, 0.4431373, 1, 1,
0.2286149, 0.04089834, 2.44093, 0, 0.4352941, 1, 1,
0.2414418, -0.5535657, 2.212689, 0, 0.4313726, 1, 1,
0.2446212, -0.8009433, 1.561015, 0, 0.4235294, 1, 1,
0.2451088, -0.4716879, 2.966834, 0, 0.4196078, 1, 1,
0.2468371, -1.03251, 1.427338, 0, 0.4117647, 1, 1,
0.24742, -0.2982818, 1.974553, 0, 0.4078431, 1, 1,
0.2492212, 1.220455, 0.2879676, 0, 0.4, 1, 1,
0.2511099, 0.2485774, 0.1851809, 0, 0.3921569, 1, 1,
0.2554708, 1.04624, 1.136683, 0, 0.3882353, 1, 1,
0.2574666, 0.8426954, 2.218479, 0, 0.3803922, 1, 1,
0.2589731, -0.7134088, 1.98274, 0, 0.3764706, 1, 1,
0.2620681, 0.4212719, 0.7918475, 0, 0.3686275, 1, 1,
0.2621934, 2.399501, 1.031474, 0, 0.3647059, 1, 1,
0.265004, -0.7264854, 4.121847, 0, 0.3568628, 1, 1,
0.2671012, 0.7807653, 1.537072, 0, 0.3529412, 1, 1,
0.2674614, 0.1398855, 3.436913, 0, 0.345098, 1, 1,
0.279412, 0.6371573, 1.411388, 0, 0.3411765, 1, 1,
0.2861714, 0.3467041, 1.290736, 0, 0.3333333, 1, 1,
0.2888714, 1.071293, 0.382506, 0, 0.3294118, 1, 1,
0.2914614, -1.722226, 3.134482, 0, 0.3215686, 1, 1,
0.2917436, -0.3789577, 0.8779908, 0, 0.3176471, 1, 1,
0.2937076, 0.6766422, -0.5077632, 0, 0.3098039, 1, 1,
0.2940862, -0.2305774, 2.567233, 0, 0.3058824, 1, 1,
0.2957276, -0.8179322, 2.375106, 0, 0.2980392, 1, 1,
0.3010646, 1.086084, 0.9136866, 0, 0.2901961, 1, 1,
0.3081933, 1.47777, -0.3768357, 0, 0.2862745, 1, 1,
0.3105614, -2.39991, 1.240753, 0, 0.2784314, 1, 1,
0.3115455, 0.6523384, -0.7149422, 0, 0.2745098, 1, 1,
0.3207459, -0.4468772, 2.936996, 0, 0.2666667, 1, 1,
0.3252644, 1.03786, 0.7717518, 0, 0.2627451, 1, 1,
0.32964, 0.03376175, 2.887667, 0, 0.254902, 1, 1,
0.3297693, 0.2235568, 1.193311, 0, 0.2509804, 1, 1,
0.3306366, -0.1520754, 1.600198, 0, 0.2431373, 1, 1,
0.3329807, -0.696827, 4.194187, 0, 0.2392157, 1, 1,
0.3337367, 1.087935, 0.009818945, 0, 0.2313726, 1, 1,
0.3363784, 0.03565292, 2.008364, 0, 0.227451, 1, 1,
0.3381499, -0.4707741, 1.544058, 0, 0.2196078, 1, 1,
0.3413703, -0.7761087, 1.525566, 0, 0.2156863, 1, 1,
0.3415502, -1.871742, 2.778613, 0, 0.2078431, 1, 1,
0.34324, -1.117241, 4.848594, 0, 0.2039216, 1, 1,
0.3470166, 0.1727524, 0.7897598, 0, 0.1960784, 1, 1,
0.3477894, -0.6646572, 4.374227, 0, 0.1882353, 1, 1,
0.34876, -1.259893, 3.227452, 0, 0.1843137, 1, 1,
0.3494009, -0.6949152, 2.332805, 0, 0.1764706, 1, 1,
0.3514896, -0.0318143, 0.1119294, 0, 0.172549, 1, 1,
0.3517213, -1.149078, 2.518446, 0, 0.1647059, 1, 1,
0.3532531, -0.4421549, 3.997689, 0, 0.1607843, 1, 1,
0.3535962, 0.6450773, 0.5940363, 0, 0.1529412, 1, 1,
0.3585179, -0.5377698, 2.097077, 0, 0.1490196, 1, 1,
0.3639078, 0.7562555, -0.2660735, 0, 0.1411765, 1, 1,
0.3688635, 0.7474282, -0.04529063, 0, 0.1372549, 1, 1,
0.3689321, 1.784296, 1.192778, 0, 0.1294118, 1, 1,
0.3699872, 1.618352, 0.1953561, 0, 0.1254902, 1, 1,
0.3700548, -2.000813, 3.291174, 0, 0.1176471, 1, 1,
0.3730645, -1.368846, 3.269811, 0, 0.1137255, 1, 1,
0.3794345, -0.889713, 2.511857, 0, 0.1058824, 1, 1,
0.3794897, 0.605532, 0.3951322, 0, 0.09803922, 1, 1,
0.3816925, -1.010376, 3.201925, 0, 0.09411765, 1, 1,
0.3832987, -0.1525281, 1.837702, 0, 0.08627451, 1, 1,
0.3882329, 1.711787, 1.177303, 0, 0.08235294, 1, 1,
0.3951166, 1.549103, 1.240163, 0, 0.07450981, 1, 1,
0.3955247, 1.440822, 0.107731, 0, 0.07058824, 1, 1,
0.4041515, -1.690104, 2.704279, 0, 0.0627451, 1, 1,
0.4054003, 1.759098, 0.6055871, 0, 0.05882353, 1, 1,
0.4152496, 1.721345, 0.006624178, 0, 0.05098039, 1, 1,
0.416508, 1.382742, 0.4655299, 0, 0.04705882, 1, 1,
0.4189274, 1.149209, -0.6129604, 0, 0.03921569, 1, 1,
0.4229705, -1.107261, 2.519478, 0, 0.03529412, 1, 1,
0.4232981, 0.5401171, 0.1691363, 0, 0.02745098, 1, 1,
0.4246353, -1.31758, 3.74758, 0, 0.02352941, 1, 1,
0.4258384, 1.158929, -1.682605, 0, 0.01568628, 1, 1,
0.4264066, 0.199627, 0.8485178, 0, 0.01176471, 1, 1,
0.4283641, 0.8849804, -0.8479235, 0, 0.003921569, 1, 1,
0.433327, -2.144083, 2.836596, 0.003921569, 0, 1, 1,
0.433883, -1.371233, 3.263521, 0.007843138, 0, 1, 1,
0.4425489, -1.666108, 5.338631, 0.01568628, 0, 1, 1,
0.4440012, -0.925355, 3.013661, 0.01960784, 0, 1, 1,
0.4492159, -0.1370623, 0.1978062, 0.02745098, 0, 1, 1,
0.4533566, 1.397698, 0.3209164, 0.03137255, 0, 1, 1,
0.4562346, 1.083875, 1.97408, 0.03921569, 0, 1, 1,
0.4603143, 0.5773782, 0.4848693, 0.04313726, 0, 1, 1,
0.4608407, 0.8987781, 1.439363, 0.05098039, 0, 1, 1,
0.462707, 0.8288979, -0.3088791, 0.05490196, 0, 1, 1,
0.4627442, -0.2577358, 2.986812, 0.0627451, 0, 1, 1,
0.4642604, -1.105187, 2.409971, 0.06666667, 0, 1, 1,
0.464537, -0.8877447, 4.24197, 0.07450981, 0, 1, 1,
0.4669797, 2.604299, 2.206563, 0.07843138, 0, 1, 1,
0.4679031, -0.1109006, 2.955865, 0.08627451, 0, 1, 1,
0.473825, 2.325341, 1.739057, 0.09019608, 0, 1, 1,
0.4788638, -1.074355, 1.339157, 0.09803922, 0, 1, 1,
0.4846016, 1.129014, -1.360568, 0.1058824, 0, 1, 1,
0.492842, 0.02178178, 2.255529, 0.1098039, 0, 1, 1,
0.4936262, 0.2111845, 1.829165, 0.1176471, 0, 1, 1,
0.4960911, -1.561209, 1.834441, 0.1215686, 0, 1, 1,
0.4964747, 0.1546321, 2.278325, 0.1294118, 0, 1, 1,
0.4998547, -0.2117663, 1.606962, 0.1333333, 0, 1, 1,
0.5016134, -0.3098499, 2.453992, 0.1411765, 0, 1, 1,
0.502243, 0.4004039, 1.73595, 0.145098, 0, 1, 1,
0.5055954, -0.4850498, 2.836407, 0.1529412, 0, 1, 1,
0.5079799, -0.7701201, 1.983716, 0.1568628, 0, 1, 1,
0.5080712, 1.308493, 0.2137588, 0.1647059, 0, 1, 1,
0.5092323, -1.094808, 2.346101, 0.1686275, 0, 1, 1,
0.5111965, -0.1310946, 0.9104525, 0.1764706, 0, 1, 1,
0.5157648, 1.221245, 0.5271096, 0.1803922, 0, 1, 1,
0.5167686, 0.9787252, -0.9056733, 0.1882353, 0, 1, 1,
0.5177113, -0.3839057, 2.007438, 0.1921569, 0, 1, 1,
0.5178023, -1.028946, 0.6403189, 0.2, 0, 1, 1,
0.5207762, -1.11413, 1.945336, 0.2078431, 0, 1, 1,
0.5213389, 0.2616312, 1.12262, 0.2117647, 0, 1, 1,
0.5219148, -1.118224, 2.384752, 0.2196078, 0, 1, 1,
0.52989, 1.289842, 0.9708634, 0.2235294, 0, 1, 1,
0.5313279, 0.2598018, 1.894165, 0.2313726, 0, 1, 1,
0.533823, -0.8340561, 1.454697, 0.2352941, 0, 1, 1,
0.5384476, 0.03876882, 1.208324, 0.2431373, 0, 1, 1,
0.551819, 0.138215, 1.494946, 0.2470588, 0, 1, 1,
0.557319, -0.1208984, 1.962513, 0.254902, 0, 1, 1,
0.563804, -0.9807877, 1.553455, 0.2588235, 0, 1, 1,
0.567387, 0.4000438, -0.1825062, 0.2666667, 0, 1, 1,
0.5702957, 0.3342054, 2.001893, 0.2705882, 0, 1, 1,
0.5794608, 0.3236833, -0.1964544, 0.2784314, 0, 1, 1,
0.5807455, 0.1009407, 0.6194816, 0.282353, 0, 1, 1,
0.5811026, -0.1080198, 2.230373, 0.2901961, 0, 1, 1,
0.5862818, -1.250387, 2.349088, 0.2941177, 0, 1, 1,
0.5889481, 1.926315, -0.7852961, 0.3019608, 0, 1, 1,
0.5896589, 1.267096, 2.351611, 0.3098039, 0, 1, 1,
0.5896765, 0.4453129, -0.2819529, 0.3137255, 0, 1, 1,
0.5962233, -1.36737, 3.304755, 0.3215686, 0, 1, 1,
0.6001741, 0.9559463, 1.087064, 0.3254902, 0, 1, 1,
0.6033475, 0.7820196, 0.7298552, 0.3333333, 0, 1, 1,
0.6073557, -0.03069909, 1.793503, 0.3372549, 0, 1, 1,
0.6091222, -0.5721568, 1.474226, 0.345098, 0, 1, 1,
0.6182717, 0.8521333, 0.3895286, 0.3490196, 0, 1, 1,
0.6194699, 0.4241779, -1.057892, 0.3568628, 0, 1, 1,
0.6224853, -1.183681, 3.608376, 0.3607843, 0, 1, 1,
0.6239084, 0.8380486, 0.3977376, 0.3686275, 0, 1, 1,
0.6240183, 0.9697308, 0.2851626, 0.372549, 0, 1, 1,
0.6288152, -0.3028368, 1.429663, 0.3803922, 0, 1, 1,
0.6323265, 0.2633704, 1.592127, 0.3843137, 0, 1, 1,
0.6344516, -0.7232891, 2.737617, 0.3921569, 0, 1, 1,
0.634777, -0.4028275, 2.181773, 0.3960784, 0, 1, 1,
0.6375302, 1.075335, -0.4714912, 0.4039216, 0, 1, 1,
0.6403208, -2.457241, 3.150278, 0.4117647, 0, 1, 1,
0.6450877, -0.1836452, 2.433305, 0.4156863, 0, 1, 1,
0.6474015, -0.4212632, 2.448657, 0.4235294, 0, 1, 1,
0.6475549, -1.267535, 2.968347, 0.427451, 0, 1, 1,
0.6498082, -0.8836882, 4.562434, 0.4352941, 0, 1, 1,
0.6547275, 0.4635827, 1.630692, 0.4392157, 0, 1, 1,
0.6556912, -0.8583484, 2.969165, 0.4470588, 0, 1, 1,
0.6583903, -0.9641507, 3.167101, 0.4509804, 0, 1, 1,
0.6644659, 1.220583, 1.54472, 0.4588235, 0, 1, 1,
0.6648696, -0.187774, 2.019022, 0.4627451, 0, 1, 1,
0.6679859, 0.5754167, 1.047049, 0.4705882, 0, 1, 1,
0.6746921, -0.3593315, 1.908901, 0.4745098, 0, 1, 1,
0.6758082, 0.4504368, 1.557253, 0.4823529, 0, 1, 1,
0.67751, 0.6868317, 0.5708241, 0.4862745, 0, 1, 1,
0.6788383, 0.06136978, 0.8351688, 0.4941176, 0, 1, 1,
0.6816809, -2.080785, 2.450182, 0.5019608, 0, 1, 1,
0.6819431, -0.8656616, 2.847242, 0.5058824, 0, 1, 1,
0.6824076, 0.7464654, -0.07854044, 0.5137255, 0, 1, 1,
0.6837652, 0.3775797, 2.089766, 0.5176471, 0, 1, 1,
0.6851397, 0.3303853, 2.25301, 0.5254902, 0, 1, 1,
0.6859597, 0.5227041, 2.325995, 0.5294118, 0, 1, 1,
0.6874582, 0.3488613, 0.2945493, 0.5372549, 0, 1, 1,
0.6879137, 0.5480169, -0.2981225, 0.5411765, 0, 1, 1,
0.688224, -0.8066227, 5.391395, 0.5490196, 0, 1, 1,
0.6987477, -0.2803034, 2.096231, 0.5529412, 0, 1, 1,
0.6990966, -0.7424479, 1.37004, 0.5607843, 0, 1, 1,
0.6991907, -0.2902245, 2.602277, 0.5647059, 0, 1, 1,
0.7104229, -1.626582, 1.834219, 0.572549, 0, 1, 1,
0.7148665, -1.121741, 1.057841, 0.5764706, 0, 1, 1,
0.7152906, -0.2740185, 1.893656, 0.5843138, 0, 1, 1,
0.7162589, -0.429302, 1.682606, 0.5882353, 0, 1, 1,
0.7176794, 1.260402, -0.4665026, 0.5960785, 0, 1, 1,
0.7218506, -0.3960173, 1.397938, 0.6039216, 0, 1, 1,
0.7227818, -0.1604642, 0.9724764, 0.6078432, 0, 1, 1,
0.7279562, -0.7774999, 1.538392, 0.6156863, 0, 1, 1,
0.7423981, 1.509309, 0.5261803, 0.6196079, 0, 1, 1,
0.7511716, -2.015901, 0.3484542, 0.627451, 0, 1, 1,
0.7547145, 0.473214, -0.1878509, 0.6313726, 0, 1, 1,
0.7563698, 1.176328, 1.66397, 0.6392157, 0, 1, 1,
0.7590849, -0.5640936, 2.523605, 0.6431373, 0, 1, 1,
0.7597966, -0.4300874, 1.928087, 0.6509804, 0, 1, 1,
0.7640695, 3.520091, 0.6528456, 0.654902, 0, 1, 1,
0.7680808, 0.2830687, 0.2891662, 0.6627451, 0, 1, 1,
0.7694309, 1.88252, 1.209266, 0.6666667, 0, 1, 1,
0.7745031, -1.54669, 1.541797, 0.6745098, 0, 1, 1,
0.783161, -2.274205, 3.255823, 0.6784314, 0, 1, 1,
0.7893878, 1.100097, 0.1162676, 0.6862745, 0, 1, 1,
0.7906991, 0.0147963, 1.315315, 0.6901961, 0, 1, 1,
0.7910115, -0.9244232, 3.058949, 0.6980392, 0, 1, 1,
0.7964813, -1.888143, 2.238319, 0.7058824, 0, 1, 1,
0.7971886, -0.07493241, 2.012118, 0.7098039, 0, 1, 1,
0.8029443, -0.5922187, 1.505526, 0.7176471, 0, 1, 1,
0.8084416, -0.6755965, 1.506882, 0.7215686, 0, 1, 1,
0.8105748, -0.2170449, 0.4007551, 0.7294118, 0, 1, 1,
0.821826, -1.030237, 2.851938, 0.7333333, 0, 1, 1,
0.8325924, 1.604229, 1.381458, 0.7411765, 0, 1, 1,
0.8344928, -1.090663, 2.264203, 0.7450981, 0, 1, 1,
0.8403698, -0.7465395, 2.720173, 0.7529412, 0, 1, 1,
0.8474466, -0.005640844, -0.7787406, 0.7568628, 0, 1, 1,
0.849385, -1.68109, 3.513944, 0.7647059, 0, 1, 1,
0.8595608, 1.399704, 1.775507, 0.7686275, 0, 1, 1,
0.8615001, 0.3125887, 0.412647, 0.7764706, 0, 1, 1,
0.8621516, 0.7997024, 0.1573486, 0.7803922, 0, 1, 1,
0.8694023, 1.332833, 0.9799855, 0.7882353, 0, 1, 1,
0.8700183, 0.5813798, 0.8323901, 0.7921569, 0, 1, 1,
0.8757217, 0.7498366, -0.9031487, 0.8, 0, 1, 1,
0.8780132, 0.1188567, 0.3342273, 0.8078431, 0, 1, 1,
0.8799678, -1.070206, 1.479802, 0.8117647, 0, 1, 1,
0.8805275, -0.3585876, 2.032301, 0.8196079, 0, 1, 1,
0.8937752, -1.413841, 2.332039, 0.8235294, 0, 1, 1,
0.8951772, 0.2219188, 0.02002243, 0.8313726, 0, 1, 1,
0.8973936, 0.636305, -0.1512963, 0.8352941, 0, 1, 1,
0.8993663, -1.0384, 1.716239, 0.8431373, 0, 1, 1,
0.9003974, -1.587038, 3.00001, 0.8470588, 0, 1, 1,
0.9013254, -0.6938061, 3.822285, 0.854902, 0, 1, 1,
0.9018254, -1.040218, 2.941385, 0.8588235, 0, 1, 1,
0.9078643, 1.519957, 0.5771103, 0.8666667, 0, 1, 1,
0.9183659, -0.449922, 3.426697, 0.8705882, 0, 1, 1,
0.9227412, 1.34067, 1.579699, 0.8784314, 0, 1, 1,
0.9274933, 0.8522404, 0.9954929, 0.8823529, 0, 1, 1,
0.9309908, 1.002999, 3.434735, 0.8901961, 0, 1, 1,
0.9321479, -0.9146603, 3.293291, 0.8941177, 0, 1, 1,
0.9357339, 0.4462942, -0.3188219, 0.9019608, 0, 1, 1,
0.9359939, 1.412582, 0.5342512, 0.9098039, 0, 1, 1,
0.93818, -0.1766078, 2.518876, 0.9137255, 0, 1, 1,
0.9465889, 0.9153406, 1.80941, 0.9215686, 0, 1, 1,
0.9519025, 1.048244, 0.9272, 0.9254902, 0, 1, 1,
0.9534268, -1.529609, -0.2399165, 0.9333333, 0, 1, 1,
0.9546952, -0.06900459, 1.372937, 0.9372549, 0, 1, 1,
0.9570348, -0.5574613, 1.88089, 0.945098, 0, 1, 1,
0.9611857, -0.2093896, 1.058456, 0.9490196, 0, 1, 1,
0.9671098, -1.112355, 0.3099169, 0.9568627, 0, 1, 1,
0.9706641, 1.138418, 0.01380481, 0.9607843, 0, 1, 1,
0.9717401, 1.536899, -0.7990717, 0.9686275, 0, 1, 1,
0.973471, -0.3620922, 1.667501, 0.972549, 0, 1, 1,
0.9753993, -2.158001, 2.664117, 0.9803922, 0, 1, 1,
0.9798786, 0.4621946, 1.369659, 0.9843137, 0, 1, 1,
0.9843968, 0.4399889, 0.2905719, 0.9921569, 0, 1, 1,
0.9910795, 1.707331, 0.8728105, 0.9960784, 0, 1, 1,
0.9938799, -0.6514015, 1.420503, 1, 0, 0.9960784, 1,
0.9942632, 0.1880215, 2.257922, 1, 0, 0.9882353, 1,
0.9990125, 0.05225874, 1.162915, 1, 0, 0.9843137, 1,
0.9991216, -0.4865153, 1.969131, 1, 0, 0.9764706, 1,
1.00077, -0.313518, 0.9615726, 1, 0, 0.972549, 1,
1.000856, -0.9658995, 2.226972, 1, 0, 0.9647059, 1,
1.014747, 0.1955623, 0.4172134, 1, 0, 0.9607843, 1,
1.015765, 0.4333513, 1.136958, 1, 0, 0.9529412, 1,
1.02488, 0.8585608, 0.1541315, 1, 0, 0.9490196, 1,
1.033887, 0.5040219, 0.467953, 1, 0, 0.9411765, 1,
1.036207, 2.378606, 2.323338, 1, 0, 0.9372549, 1,
1.037028, -0.9289299, 4.691911, 1, 0, 0.9294118, 1,
1.047389, -1.648581, 0.7351055, 1, 0, 0.9254902, 1,
1.048608, -0.3949078, 2.071521, 1, 0, 0.9176471, 1,
1.059873, -0.1946372, 1.5542, 1, 0, 0.9137255, 1,
1.084691, 0.2864702, 1.661235, 1, 0, 0.9058824, 1,
1.095129, 1.658219, 1.701037, 1, 0, 0.9019608, 1,
1.0978, -0.4645292, 2.438137, 1, 0, 0.8941177, 1,
1.098273, -0.5402722, 2.383162, 1, 0, 0.8862745, 1,
1.099015, -0.555185, 1.570062, 1, 0, 0.8823529, 1,
1.122954, 0.4630988, 1.064292, 1, 0, 0.8745098, 1,
1.13242, -1.875001, 1.425191, 1, 0, 0.8705882, 1,
1.133304, 0.09063996, 2.368308, 1, 0, 0.8627451, 1,
1.134871, 0.720892, 0.6167458, 1, 0, 0.8588235, 1,
1.134919, -2.084939, 2.863242, 1, 0, 0.8509804, 1,
1.135964, -0.1775565, 1.541558, 1, 0, 0.8470588, 1,
1.139034, 1.451107, 0.5097107, 1, 0, 0.8392157, 1,
1.142673, 0.3905517, 0.094539, 1, 0, 0.8352941, 1,
1.142941, 0.4483498, -0.1964687, 1, 0, 0.827451, 1,
1.147938, 2.543224, 0.3550194, 1, 0, 0.8235294, 1,
1.149123, -2.279272, 2.9392, 1, 0, 0.8156863, 1,
1.155829, -0.04174696, 2.473589, 1, 0, 0.8117647, 1,
1.158852, -1.880479, 1.879588, 1, 0, 0.8039216, 1,
1.161339, -0.01640807, 1.108869, 1, 0, 0.7960784, 1,
1.164645, -1.611074, 2.758808, 1, 0, 0.7921569, 1,
1.175126, 1.020785, 2.019514, 1, 0, 0.7843137, 1,
1.181282, 0.4790201, -0.6964853, 1, 0, 0.7803922, 1,
1.193554, -0.2494195, 0.1569517, 1, 0, 0.772549, 1,
1.194012, -1.403306, 1.960235, 1, 0, 0.7686275, 1,
1.202564, -0.9655933, 0.5352936, 1, 0, 0.7607843, 1,
1.204876, -0.7172384, 1.290943, 1, 0, 0.7568628, 1,
1.207132, 0.670441, 1.723802, 1, 0, 0.7490196, 1,
1.210183, -0.7604193, 0.2183909, 1, 0, 0.7450981, 1,
1.224286, -1.058476, 3.08803, 1, 0, 0.7372549, 1,
1.228609, -1.382291, 3.925746, 1, 0, 0.7333333, 1,
1.228834, 0.6575071, 1.196229, 1, 0, 0.7254902, 1,
1.234136, -0.661146, 3.496967, 1, 0, 0.7215686, 1,
1.240559, -0.4434816, 1.946106, 1, 0, 0.7137255, 1,
1.251065, -0.3528077, 2.150269, 1, 0, 0.7098039, 1,
1.253101, 0.6212204, 1.133572, 1, 0, 0.7019608, 1,
1.257951, 0.7682242, -0.593347, 1, 0, 0.6941177, 1,
1.258116, -2.368176, 3.058772, 1, 0, 0.6901961, 1,
1.27442, -1.103677, 3.923753, 1, 0, 0.682353, 1,
1.282662, -0.2293454, 1.598363, 1, 0, 0.6784314, 1,
1.285249, -0.7602212, 1.070762, 1, 0, 0.6705883, 1,
1.294088, -0.8479199, 1.98182, 1, 0, 0.6666667, 1,
1.303475, 1.135698, 0.01903603, 1, 0, 0.6588235, 1,
1.303527, -0.06326196, 1.670993, 1, 0, 0.654902, 1,
1.32771, -0.4527424, 2.272296, 1, 0, 0.6470588, 1,
1.328249, -0.7677187, 1.098452, 1, 0, 0.6431373, 1,
1.330089, -0.3740321, 3.217311, 1, 0, 0.6352941, 1,
1.338255, 0.7948078, 0.7215104, 1, 0, 0.6313726, 1,
1.338394, -0.5264664, 2.088592, 1, 0, 0.6235294, 1,
1.339369, -1.096716, 2.693063, 1, 0, 0.6196079, 1,
1.345807, 1.161488, 1.426459, 1, 0, 0.6117647, 1,
1.348463, -1.824844, 2.427648, 1, 0, 0.6078432, 1,
1.366223, 0.5585855, 0.7410232, 1, 0, 0.6, 1,
1.37057, 1.580149, 0.8432803, 1, 0, 0.5921569, 1,
1.37155, -1.137027, 2.212364, 1, 0, 0.5882353, 1,
1.372025, 1.217984, 0.6474138, 1, 0, 0.5803922, 1,
1.390293, 1.203729, 0.3577792, 1, 0, 0.5764706, 1,
1.394619, -1.423327, 2.371694, 1, 0, 0.5686275, 1,
1.403841, 1.137322, 1.768653, 1, 0, 0.5647059, 1,
1.404063, 0.8440295, -0.3501911, 1, 0, 0.5568628, 1,
1.407354, -0.797025, 1.254011, 1, 0, 0.5529412, 1,
1.411946, -2.033742, 2.795694, 1, 0, 0.5450981, 1,
1.413775, 0.5026501, 1.341554, 1, 0, 0.5411765, 1,
1.41823, 0.3818894, 2.125988, 1, 0, 0.5333334, 1,
1.421812, -0.6328231, 2.600357, 1, 0, 0.5294118, 1,
1.422005, 0.5811011, -1.321009, 1, 0, 0.5215687, 1,
1.450649, -1.1889, 2.783948, 1, 0, 0.5176471, 1,
1.458446, -1.811257, 2.644498, 1, 0, 0.509804, 1,
1.461168, 0.1687791, 1.16529, 1, 0, 0.5058824, 1,
1.469645, -0.906293, 3.702178, 1, 0, 0.4980392, 1,
1.475613, 0.3713912, 2.449443, 1, 0, 0.4901961, 1,
1.475785, -0.81945, 0.7524287, 1, 0, 0.4862745, 1,
1.486673, 0.7235122, 1.141569, 1, 0, 0.4784314, 1,
1.491766, 0.167521, 2.616812, 1, 0, 0.4745098, 1,
1.495333, -1.704996, 5.545112, 1, 0, 0.4666667, 1,
1.495829, -0.3112201, 1.722343, 1, 0, 0.4627451, 1,
1.503521, -0.05315581, 1.043275, 1, 0, 0.454902, 1,
1.505409, -0.6852653, -0.3210297, 1, 0, 0.4509804, 1,
1.512479, 0.4665501, 0.6102994, 1, 0, 0.4431373, 1,
1.52819, -1.173712, 1.711298, 1, 0, 0.4392157, 1,
1.531663, -0.6109008, 2.534992, 1, 0, 0.4313726, 1,
1.540215, -1.003645, 3.610796, 1, 0, 0.427451, 1,
1.559729, 0.901143, 1.344685, 1, 0, 0.4196078, 1,
1.562165, 0.3788025, 3.068172, 1, 0, 0.4156863, 1,
1.564285, 1.613116, -0.9584365, 1, 0, 0.4078431, 1,
1.572179, 0.3601284, 0.3248038, 1, 0, 0.4039216, 1,
1.577172, -1.316606, 2.248069, 1, 0, 0.3960784, 1,
1.596073, 0.6084179, 3.492761, 1, 0, 0.3882353, 1,
1.602391, 0.7912912, -0.7991138, 1, 0, 0.3843137, 1,
1.602913, -2.138207, 3.715404, 1, 0, 0.3764706, 1,
1.607279, 0.02511079, 3.168151, 1, 0, 0.372549, 1,
1.607992, 0.9167242, 0.5691619, 1, 0, 0.3647059, 1,
1.616704, 0.449793, 3.267396, 1, 0, 0.3607843, 1,
1.640083, -0.1669963, 0.825926, 1, 0, 0.3529412, 1,
1.644483, -0.1286312, 1.303389, 1, 0, 0.3490196, 1,
1.650806, 1.020334, -0.3401429, 1, 0, 0.3411765, 1,
1.654848, 0.8272035, 1.47477, 1, 0, 0.3372549, 1,
1.679093, -0.1822373, 2.833873, 1, 0, 0.3294118, 1,
1.696156, -0.4730872, 1.352243, 1, 0, 0.3254902, 1,
1.696273, -0.73615, 2.270777, 1, 0, 0.3176471, 1,
1.702223, -0.8612353, 2.685228, 1, 0, 0.3137255, 1,
1.721623, 1.482834, 0.6451079, 1, 0, 0.3058824, 1,
1.724959, 2.686342, 0.8200631, 1, 0, 0.2980392, 1,
1.731308, -0.2529685, 0.8387634, 1, 0, 0.2941177, 1,
1.742445, 0.03601136, 1.571381, 1, 0, 0.2862745, 1,
1.752975, -0.8279207, 1.575725, 1, 0, 0.282353, 1,
1.753809, -0.8151628, 0.9724082, 1, 0, 0.2745098, 1,
1.75479, -0.1349455, 3.059246, 1, 0, 0.2705882, 1,
1.772891, -2.438751, 2.766786, 1, 0, 0.2627451, 1,
1.775354, -0.1717179, 1.553217, 1, 0, 0.2588235, 1,
1.786144, -0.347102, 2.272445, 1, 0, 0.2509804, 1,
1.824148, -0.4751975, 2.168322, 1, 0, 0.2470588, 1,
1.830625, 2.073498, 0.681278, 1, 0, 0.2392157, 1,
1.834623, 0.3892241, 1.765716, 1, 0, 0.2352941, 1,
1.839162, -1.570656, 1.747286, 1, 0, 0.227451, 1,
1.878483, 1.844657, 1.190957, 1, 0, 0.2235294, 1,
1.892104, 0.7595538, -0.3393735, 1, 0, 0.2156863, 1,
1.923881, -0.1602762, 3.597133, 1, 0, 0.2117647, 1,
1.925097, -1.484574, 3.204874, 1, 0, 0.2039216, 1,
1.929877, -0.736023, 3.588142, 1, 0, 0.1960784, 1,
1.930877, 0.5498845, 0.3243736, 1, 0, 0.1921569, 1,
1.937212, 0.9805874, 0.3339441, 1, 0, 0.1843137, 1,
1.981743, 1.129773, -0.2473543, 1, 0, 0.1803922, 1,
1.989663, 0.7661276, 1.726404, 1, 0, 0.172549, 1,
2.006279, -0.05103358, 1.928058, 1, 0, 0.1686275, 1,
2.026413, 1.006306, 1.525055, 1, 0, 0.1607843, 1,
2.044926, 0.01840634, -0.03532243, 1, 0, 0.1568628, 1,
2.056871, 1.450018, 2.418942, 1, 0, 0.1490196, 1,
2.069618, -0.3300407, 2.372085, 1, 0, 0.145098, 1,
2.073936, -0.7432751, 1.336971, 1, 0, 0.1372549, 1,
2.106897, 0.6222393, 0.3745743, 1, 0, 0.1333333, 1,
2.110424, -0.5650759, -0.2515581, 1, 0, 0.1254902, 1,
2.111585, 0.3885121, 2.709852, 1, 0, 0.1215686, 1,
2.117496, -0.4488662, 1.635128, 1, 0, 0.1137255, 1,
2.120042, -0.1772719, -0.5739092, 1, 0, 0.1098039, 1,
2.131301, 1.289656, 0.2884088, 1, 0, 0.1019608, 1,
2.135334, 0.852677, -1.3324, 1, 0, 0.09411765, 1,
2.156226, -0.3533493, 1.240667, 1, 0, 0.09019608, 1,
2.1657, -0.5755104, 2.589796, 1, 0, 0.08235294, 1,
2.175853, -0.8018753, 1.147525, 1, 0, 0.07843138, 1,
2.184051, 1.652604, 0.634777, 1, 0, 0.07058824, 1,
2.231427, -0.1168772, 2.644703, 1, 0, 0.06666667, 1,
2.257739, 0.6898954, 0.8214145, 1, 0, 0.05882353, 1,
2.262497, -0.4783747, 0.5204933, 1, 0, 0.05490196, 1,
2.30492, 0.3465393, 1.373794, 1, 0, 0.04705882, 1,
2.307038, 0.07211303, 1.978301, 1, 0, 0.04313726, 1,
2.313484, -0.706378, 2.855575, 1, 0, 0.03529412, 1,
2.376078, -1.968089, 3.649947, 1, 0, 0.03137255, 1,
2.528723, -0.3028245, 2.140715, 1, 0, 0.02352941, 1,
2.782868, 0.4716482, 2.174333, 1, 0, 0.01960784, 1,
3.078278, 1.237423, 0.8257892, 1, 0, 0.01176471, 1,
3.241134, -0.4973453, 1.719886, 1, 0, 0.007843138, 1
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
0.09309268, -4.521533, -8.125395, 0, -0.5, 0.5, 0.5,
0.09309268, -4.521533, -8.125395, 1, -0.5, 0.5, 0.5,
0.09309268, -4.521533, -8.125395, 1, 1.5, 0.5, 0.5,
0.09309268, -4.521533, -8.125395, 0, 1.5, 0.5, 0.5
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
-4.122135, 0.08203042, -8.125395, 0, -0.5, 0.5, 0.5,
-4.122135, 0.08203042, -8.125395, 1, -0.5, 0.5, 0.5,
-4.122135, 0.08203042, -8.125395, 1, 1.5, 0.5, 0.5,
-4.122135, 0.08203042, -8.125395, 0, 1.5, 0.5, 0.5
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
-4.122135, -4.521533, -0.2994828, 0, -0.5, 0.5, 0.5,
-4.122135, -4.521533, -0.2994828, 1, -0.5, 0.5, 0.5,
-4.122135, -4.521533, -0.2994828, 1, 1.5, 0.5, 0.5,
-4.122135, -4.521533, -0.2994828, 0, 1.5, 0.5, 0.5
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
-3, -3.459172, -6.319415,
3, -3.459172, -6.319415,
-3, -3.459172, -6.319415,
-3, -3.636232, -6.620412,
-2, -3.459172, -6.319415,
-2, -3.636232, -6.620412,
-1, -3.459172, -6.319415,
-1, -3.636232, -6.620412,
0, -3.459172, -6.319415,
0, -3.636232, -6.620412,
1, -3.459172, -6.319415,
1, -3.636232, -6.620412,
2, -3.459172, -6.319415,
2, -3.636232, -6.620412,
3, -3.459172, -6.319415,
3, -3.636232, -6.620412
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
-3, -3.990352, -7.222405, 0, -0.5, 0.5, 0.5,
-3, -3.990352, -7.222405, 1, -0.5, 0.5, 0.5,
-3, -3.990352, -7.222405, 1, 1.5, 0.5, 0.5,
-3, -3.990352, -7.222405, 0, 1.5, 0.5, 0.5,
-2, -3.990352, -7.222405, 0, -0.5, 0.5, 0.5,
-2, -3.990352, -7.222405, 1, -0.5, 0.5, 0.5,
-2, -3.990352, -7.222405, 1, 1.5, 0.5, 0.5,
-2, -3.990352, -7.222405, 0, 1.5, 0.5, 0.5,
-1, -3.990352, -7.222405, 0, -0.5, 0.5, 0.5,
-1, -3.990352, -7.222405, 1, -0.5, 0.5, 0.5,
-1, -3.990352, -7.222405, 1, 1.5, 0.5, 0.5,
-1, -3.990352, -7.222405, 0, 1.5, 0.5, 0.5,
0, -3.990352, -7.222405, 0, -0.5, 0.5, 0.5,
0, -3.990352, -7.222405, 1, -0.5, 0.5, 0.5,
0, -3.990352, -7.222405, 1, 1.5, 0.5, 0.5,
0, -3.990352, -7.222405, 0, 1.5, 0.5, 0.5,
1, -3.990352, -7.222405, 0, -0.5, 0.5, 0.5,
1, -3.990352, -7.222405, 1, -0.5, 0.5, 0.5,
1, -3.990352, -7.222405, 1, 1.5, 0.5, 0.5,
1, -3.990352, -7.222405, 0, 1.5, 0.5, 0.5,
2, -3.990352, -7.222405, 0, -0.5, 0.5, 0.5,
2, -3.990352, -7.222405, 1, -0.5, 0.5, 0.5,
2, -3.990352, -7.222405, 1, 1.5, 0.5, 0.5,
2, -3.990352, -7.222405, 0, 1.5, 0.5, 0.5,
3, -3.990352, -7.222405, 0, -0.5, 0.5, 0.5,
3, -3.990352, -7.222405, 1, -0.5, 0.5, 0.5,
3, -3.990352, -7.222405, 1, 1.5, 0.5, 0.5,
3, -3.990352, -7.222405, 0, 1.5, 0.5, 0.5
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
-3.14939, -3, -6.319415,
-3.14939, 3, -6.319415,
-3.14939, -3, -6.319415,
-3.311514, -3, -6.620412,
-3.14939, -2, -6.319415,
-3.311514, -2, -6.620412,
-3.14939, -1, -6.319415,
-3.311514, -1, -6.620412,
-3.14939, 0, -6.319415,
-3.311514, 0, -6.620412,
-3.14939, 1, -6.319415,
-3.311514, 1, -6.620412,
-3.14939, 2, -6.319415,
-3.311514, 2, -6.620412,
-3.14939, 3, -6.319415,
-3.311514, 3, -6.620412
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
-3.635762, -3, -7.222405, 0, -0.5, 0.5, 0.5,
-3.635762, -3, -7.222405, 1, -0.5, 0.5, 0.5,
-3.635762, -3, -7.222405, 1, 1.5, 0.5, 0.5,
-3.635762, -3, -7.222405, 0, 1.5, 0.5, 0.5,
-3.635762, -2, -7.222405, 0, -0.5, 0.5, 0.5,
-3.635762, -2, -7.222405, 1, -0.5, 0.5, 0.5,
-3.635762, -2, -7.222405, 1, 1.5, 0.5, 0.5,
-3.635762, -2, -7.222405, 0, 1.5, 0.5, 0.5,
-3.635762, -1, -7.222405, 0, -0.5, 0.5, 0.5,
-3.635762, -1, -7.222405, 1, -0.5, 0.5, 0.5,
-3.635762, -1, -7.222405, 1, 1.5, 0.5, 0.5,
-3.635762, -1, -7.222405, 0, 1.5, 0.5, 0.5,
-3.635762, 0, -7.222405, 0, -0.5, 0.5, 0.5,
-3.635762, 0, -7.222405, 1, -0.5, 0.5, 0.5,
-3.635762, 0, -7.222405, 1, 1.5, 0.5, 0.5,
-3.635762, 0, -7.222405, 0, 1.5, 0.5, 0.5,
-3.635762, 1, -7.222405, 0, -0.5, 0.5, 0.5,
-3.635762, 1, -7.222405, 1, -0.5, 0.5, 0.5,
-3.635762, 1, -7.222405, 1, 1.5, 0.5, 0.5,
-3.635762, 1, -7.222405, 0, 1.5, 0.5, 0.5,
-3.635762, 2, -7.222405, 0, -0.5, 0.5, 0.5,
-3.635762, 2, -7.222405, 1, -0.5, 0.5, 0.5,
-3.635762, 2, -7.222405, 1, 1.5, 0.5, 0.5,
-3.635762, 2, -7.222405, 0, 1.5, 0.5, 0.5,
-3.635762, 3, -7.222405, 0, -0.5, 0.5, 0.5,
-3.635762, 3, -7.222405, 1, -0.5, 0.5, 0.5,
-3.635762, 3, -7.222405, 1, 1.5, 0.5, 0.5,
-3.635762, 3, -7.222405, 0, 1.5, 0.5, 0.5
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
-3.14939, -3.459172, -6,
-3.14939, -3.459172, 4,
-3.14939, -3.459172, -6,
-3.311514, -3.636232, -6,
-3.14939, -3.459172, -4,
-3.311514, -3.636232, -4,
-3.14939, -3.459172, -2,
-3.311514, -3.636232, -2,
-3.14939, -3.459172, 0,
-3.311514, -3.636232, 0,
-3.14939, -3.459172, 2,
-3.311514, -3.636232, 2,
-3.14939, -3.459172, 4,
-3.311514, -3.636232, 4
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
-3.635762, -3.990352, -6, 0, -0.5, 0.5, 0.5,
-3.635762, -3.990352, -6, 1, -0.5, 0.5, 0.5,
-3.635762, -3.990352, -6, 1, 1.5, 0.5, 0.5,
-3.635762, -3.990352, -6, 0, 1.5, 0.5, 0.5,
-3.635762, -3.990352, -4, 0, -0.5, 0.5, 0.5,
-3.635762, -3.990352, -4, 1, -0.5, 0.5, 0.5,
-3.635762, -3.990352, -4, 1, 1.5, 0.5, 0.5,
-3.635762, -3.990352, -4, 0, 1.5, 0.5, 0.5,
-3.635762, -3.990352, -2, 0, -0.5, 0.5, 0.5,
-3.635762, -3.990352, -2, 1, -0.5, 0.5, 0.5,
-3.635762, -3.990352, -2, 1, 1.5, 0.5, 0.5,
-3.635762, -3.990352, -2, 0, 1.5, 0.5, 0.5,
-3.635762, -3.990352, 0, 0, -0.5, 0.5, 0.5,
-3.635762, -3.990352, 0, 1, -0.5, 0.5, 0.5,
-3.635762, -3.990352, 0, 1, 1.5, 0.5, 0.5,
-3.635762, -3.990352, 0, 0, 1.5, 0.5, 0.5,
-3.635762, -3.990352, 2, 0, -0.5, 0.5, 0.5,
-3.635762, -3.990352, 2, 1, -0.5, 0.5, 0.5,
-3.635762, -3.990352, 2, 1, 1.5, 0.5, 0.5,
-3.635762, -3.990352, 2, 0, 1.5, 0.5, 0.5,
-3.635762, -3.990352, 4, 0, -0.5, 0.5, 0.5,
-3.635762, -3.990352, 4, 1, -0.5, 0.5, 0.5,
-3.635762, -3.990352, 4, 1, 1.5, 0.5, 0.5,
-3.635762, -3.990352, 4, 0, 1.5, 0.5, 0.5
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
-3.14939, -3.459172, -6.319415,
-3.14939, 3.623233, -6.319415,
-3.14939, -3.459172, 5.720449,
-3.14939, 3.623233, 5.720449,
-3.14939, -3.459172, -6.319415,
-3.14939, -3.459172, 5.720449,
-3.14939, 3.623233, -6.319415,
-3.14939, 3.623233, 5.720449,
-3.14939, -3.459172, -6.319415,
3.335575, -3.459172, -6.319415,
-3.14939, -3.459172, 5.720449,
3.335575, -3.459172, 5.720449,
-3.14939, 3.623233, -6.319415,
3.335575, 3.623233, -6.319415,
-3.14939, 3.623233, 5.720449,
3.335575, 3.623233, 5.720449,
3.335575, -3.459172, -6.319415,
3.335575, 3.623233, -6.319415,
3.335575, -3.459172, 5.720449,
3.335575, 3.623233, 5.720449,
3.335575, -3.459172, -6.319415,
3.335575, -3.459172, 5.720449,
3.335575, 3.623233, -6.319415,
3.335575, 3.623233, 5.720449
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
var radius = 8.223536;
var distance = 36.58744;
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
mvMatrix.translate( -0.09309268, -0.08203042, 0.2994828 );
mvMatrix.scale( 1.371086, 1.255428, 0.7385007 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.58744);
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
Fluometuron<-read.table("Fluometuron.xyz", skip=1)
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
-3.054949, -0.3329612, -2.108415, 0, 0, 1, 1, 1,
-3.018938, 1.226972, -1.883301, 1, 0, 0, 1, 1,
-2.488868, -0.9982411, -2.118108, 1, 0, 0, 1, 1,
-2.456509, -0.433057, -2.158964, 1, 0, 0, 1, 1,
-2.436452, -0.4979089, -1.614798, 1, 0, 0, 1, 1,
-2.408046, 1.019794, -0.4422102, 1, 0, 0, 1, 1,
-2.404061, -0.5495578, -3.796665, 0, 0, 0, 1, 1,
-2.382055, 0.7575164, -1.864366, 0, 0, 0, 1, 1,
-2.351509, 1.867825, 0.009263469, 0, 0, 0, 1, 1,
-2.318591, -0.142451, -1.244059, 0, 0, 0, 1, 1,
-2.309976, -0.4396432, -0.4722389, 0, 0, 0, 1, 1,
-2.304646, -0.862364, -0.3009806, 0, 0, 0, 1, 1,
-2.25684, -0.03753443, -1.139804, 0, 0, 0, 1, 1,
-2.243864, -0.7925408, -1.134063, 1, 1, 1, 1, 1,
-2.205542, -1.423726, -2.908164, 1, 1, 1, 1, 1,
-2.190017, -0.5115247, -3.798769, 1, 1, 1, 1, 1,
-2.186128, -1.166711, -1.30312, 1, 1, 1, 1, 1,
-2.143387, 2.018914, -1.849198, 1, 1, 1, 1, 1,
-2.141697, -1.377294, -0.8951909, 1, 1, 1, 1, 1,
-2.101376, 1.772951, -0.219353, 1, 1, 1, 1, 1,
-2.073751, -1.394821, -2.308705, 1, 1, 1, 1, 1,
-2.067864, -1.286745, -2.33388, 1, 1, 1, 1, 1,
-2.063962, 0.3137973, -2.742343, 1, 1, 1, 1, 1,
-2.039102, -1.167029, -1.664603, 1, 1, 1, 1, 1,
-2.024763, -0.1986393, -0.6945942, 1, 1, 1, 1, 1,
-2.019051, 1.158477, -2.314483, 1, 1, 1, 1, 1,
-2.016825, 0.4658743, -0.06724681, 1, 1, 1, 1, 1,
-2.012202, -2.685872, -3.437901, 1, 1, 1, 1, 1,
-1.987634, 0.8005431, -0.9852251, 0, 0, 1, 1, 1,
-1.977764, 1.606109, -0.8121654, 1, 0, 0, 1, 1,
-1.965424, 0.466766, -2.731209, 1, 0, 0, 1, 1,
-1.954445, 0.07699416, -2.399336, 1, 0, 0, 1, 1,
-1.940911, -0.8619335, -1.326573, 1, 0, 0, 1, 1,
-1.895601, 1.774677, -1.391156, 1, 0, 0, 1, 1,
-1.877071, -0.5849965, -2.505477, 0, 0, 0, 1, 1,
-1.867486, 0.7642981, -1.802997, 0, 0, 0, 1, 1,
-1.864897, 0.8866277, -0.8702897, 0, 0, 0, 1, 1,
-1.856488, -0.517108, 0.2321065, 0, 0, 0, 1, 1,
-1.83246, -1.812371, -2.891042, 0, 0, 0, 1, 1,
-1.830646, 1.241168, -1.281947, 0, 0, 0, 1, 1,
-1.805564, -0.1488323, -1.295135, 0, 0, 0, 1, 1,
-1.788307, 0.4565481, -1.436257, 1, 1, 1, 1, 1,
-1.781259, -1.124288, -2.885712, 1, 1, 1, 1, 1,
-1.777271, 0.4846292, -2.315834, 1, 1, 1, 1, 1,
-1.775379, 0.0005054498, -2.174961, 1, 1, 1, 1, 1,
-1.76457, -0.4957156, -1.516271, 1, 1, 1, 1, 1,
-1.763145, 0.1787775, -0.9036508, 1, 1, 1, 1, 1,
-1.760127, -1.163609, -3.125576, 1, 1, 1, 1, 1,
-1.748138, -0.6443168, -1.125127, 1, 1, 1, 1, 1,
-1.743118, 1.049304, -0.8859389, 1, 1, 1, 1, 1,
-1.740623, 0.2233805, 0.5037333, 1, 1, 1, 1, 1,
-1.722801, -0.9706638, -3.522407, 1, 1, 1, 1, 1,
-1.717552, -0.3049228, -1.454443, 1, 1, 1, 1, 1,
-1.708876, 2.018502, -0.5647444, 1, 1, 1, 1, 1,
-1.705558, 0.4981581, -0.758486, 1, 1, 1, 1, 1,
-1.692456, -0.7481947, -1.843877, 1, 1, 1, 1, 1,
-1.675814, 0.9497155, -0.7696679, 0, 0, 1, 1, 1,
-1.672164, 1.584828, -1.21316, 1, 0, 0, 1, 1,
-1.661467, 1.940621, 0.3229659, 1, 0, 0, 1, 1,
-1.658335, 0.4058826, -1.927007, 1, 0, 0, 1, 1,
-1.657614, 0.4052045, -0.3859352, 1, 0, 0, 1, 1,
-1.657135, 1.484161, -0.5466434, 1, 0, 0, 1, 1,
-1.646637, 0.7685805, -1.934824, 0, 0, 0, 1, 1,
-1.605668, -0.822197, -2.257611, 0, 0, 0, 1, 1,
-1.59275, -0.3983831, -0.9957368, 0, 0, 0, 1, 1,
-1.571418, -0.5023506, -3.59819, 0, 0, 0, 1, 1,
-1.556133, 0.8424988, -1.054059, 0, 0, 0, 1, 1,
-1.552097, -0.07260301, 0.531898, 0, 0, 0, 1, 1,
-1.5418, -1.408575, -1.304663, 0, 0, 0, 1, 1,
-1.518021, -0.4922512, -0.8231879, 1, 1, 1, 1, 1,
-1.515155, 1.269879, -1.588741, 1, 1, 1, 1, 1,
-1.514015, -0.4847804, -2.498218, 1, 1, 1, 1, 1,
-1.512174, -1.388194, -1.129825, 1, 1, 1, 1, 1,
-1.511085, -0.2999776, -1.729035, 1, 1, 1, 1, 1,
-1.508196, -2.250811, -1.915296, 1, 1, 1, 1, 1,
-1.498394, -0.7012121, -1.127573, 1, 1, 1, 1, 1,
-1.489831, 0.03177637, -1.701317, 1, 1, 1, 1, 1,
-1.487405, -0.8380865, -1.551971, 1, 1, 1, 1, 1,
-1.477165, -0.1076625, -1.458356, 1, 1, 1, 1, 1,
-1.469996, -1.000409, -3.227639, 1, 1, 1, 1, 1,
-1.467689, 0.6698188, -1.819407, 1, 1, 1, 1, 1,
-1.464224, 0.1120108, -0.9760517, 1, 1, 1, 1, 1,
-1.455437, -1.331071, -0.7699378, 1, 1, 1, 1, 1,
-1.442215, -0.608546, -3.691594, 1, 1, 1, 1, 1,
-1.43919, 0.1811179, -1.488801, 0, 0, 1, 1, 1,
-1.433119, 0.2696402, -0.5464769, 1, 0, 0, 1, 1,
-1.427444, -1.442248, -1.460122, 1, 0, 0, 1, 1,
-1.404646, 0.3598849, -0.2989926, 1, 0, 0, 1, 1,
-1.399983, 0.1229831, -1.979997, 1, 0, 0, 1, 1,
-1.393678, 1.109403, -2.459549, 1, 0, 0, 1, 1,
-1.393335, -1.044047, -2.601992, 0, 0, 0, 1, 1,
-1.382313, 0.372696, -1.938351, 0, 0, 0, 1, 1,
-1.378834, -0.5956894, -0.4533935, 0, 0, 0, 1, 1,
-1.37148, -0.1611488, -0.575657, 0, 0, 0, 1, 1,
-1.366664, 0.6777086, -2.005479, 0, 0, 0, 1, 1,
-1.348354, 0.5208853, -1.518651, 0, 0, 0, 1, 1,
-1.343847, -0.5298723, -0.9328305, 0, 0, 0, 1, 1,
-1.343526, -0.2945507, -0.9491531, 1, 1, 1, 1, 1,
-1.338691, 0.1172049, 0.9661329, 1, 1, 1, 1, 1,
-1.336858, -1.341644, -1.356234, 1, 1, 1, 1, 1,
-1.334891, 1.153306, -1.305545, 1, 1, 1, 1, 1,
-1.319382, 0.267162, -1.487098, 1, 1, 1, 1, 1,
-1.311496, 1.549621, 0.428984, 1, 1, 1, 1, 1,
-1.300501, -0.1654033, -0.7721149, 1, 1, 1, 1, 1,
-1.299981, 0.624661, -2.10162, 1, 1, 1, 1, 1,
-1.297226, 1.243415, -0.4586929, 1, 1, 1, 1, 1,
-1.295082, -0.6812336, -2.579863, 1, 1, 1, 1, 1,
-1.292405, 0.3531773, -2.04744, 1, 1, 1, 1, 1,
-1.290576, 1.446105, -0.9267082, 1, 1, 1, 1, 1,
-1.277538, -0.1339637, -0.2357741, 1, 1, 1, 1, 1,
-1.272535, -0.18821, -3.673684, 1, 1, 1, 1, 1,
-1.265286, 1.209802, -1.249999, 1, 1, 1, 1, 1,
-1.264876, 0.1008094, -1.530959, 0, 0, 1, 1, 1,
-1.245929, 0.9252477, 2.071637, 1, 0, 0, 1, 1,
-1.231856, -1.186085, -2.363297, 1, 0, 0, 1, 1,
-1.227204, -1.866686, -3.075248, 1, 0, 0, 1, 1,
-1.2229, -0.05124049, -0.8240874, 1, 0, 0, 1, 1,
-1.217357, -0.5668598, -2.26074, 1, 0, 0, 1, 1,
-1.212311, 0.073838, -1.857178, 0, 0, 0, 1, 1,
-1.197935, 1.120607, -1.801943, 0, 0, 0, 1, 1,
-1.174462, 0.873446, -2.15878, 0, 0, 0, 1, 1,
-1.171389, 0.7729115, 1.397776, 0, 0, 0, 1, 1,
-1.165387, -1.482952, -3.89555, 0, 0, 0, 1, 1,
-1.164751, 0.2484433, -1.61488, 0, 0, 0, 1, 1,
-1.159446, -0.3464767, -3.018126, 0, 0, 0, 1, 1,
-1.15907, 2.959392, 1.018417, 1, 1, 1, 1, 1,
-1.154962, 0.2540286, -1.371486, 1, 1, 1, 1, 1,
-1.150303, 0.8138747, -1.336697, 1, 1, 1, 1, 1,
-1.146268, -0.6026036, -1.713001, 1, 1, 1, 1, 1,
-1.14605, 1.088379, -0.4502197, 1, 1, 1, 1, 1,
-1.133968, -0.9497949, -2.758057, 1, 1, 1, 1, 1,
-1.131961, -0.1986641, -0.1716974, 1, 1, 1, 1, 1,
-1.13064, 0.439632, -0.7987784, 1, 1, 1, 1, 1,
-1.129488, 0.5789009, -0.8874364, 1, 1, 1, 1, 1,
-1.128954, 0.2915289, -1.742025, 1, 1, 1, 1, 1,
-1.128212, -0.5232541, -1.648775, 1, 1, 1, 1, 1,
-1.126353, -1.968993, -2.364116, 1, 1, 1, 1, 1,
-1.125677, 0.5489622, -1.818264, 1, 1, 1, 1, 1,
-1.121006, 0.2101073, -2.168964, 1, 1, 1, 1, 1,
-1.115589, -2.197568, -3.601032, 1, 1, 1, 1, 1,
-1.110369, 1.195746, -0.8701887, 0, 0, 1, 1, 1,
-1.103692, 1.102102, 0.9252535, 1, 0, 0, 1, 1,
-1.099865, 1.286058, -1.723186, 1, 0, 0, 1, 1,
-1.094298, 0.5504909, 0.1328049, 1, 0, 0, 1, 1,
-1.093111, 1.263843, -1.422713, 1, 0, 0, 1, 1,
-1.090112, 0.4820562, -2.480588, 1, 0, 0, 1, 1,
-1.089864, 1.589766, 0.1264331, 0, 0, 0, 1, 1,
-1.087894, 0.2250257, -2.828758, 0, 0, 0, 1, 1,
-1.087847, 0.1031118, -1.792486, 0, 0, 0, 1, 1,
-1.08621, -0.5915046, -3.094633, 0, 0, 0, 1, 1,
-1.077676, -1.065251, -1.451567, 0, 0, 0, 1, 1,
-1.071928, -0.1507813, -0.3466476, 0, 0, 0, 1, 1,
-1.071854, -2.235079, -2.081705, 0, 0, 0, 1, 1,
-1.064454, 0.007285344, -0.4672507, 1, 1, 1, 1, 1,
-1.051326, -0.7385439, -3.065463, 1, 1, 1, 1, 1,
-1.050927, -0.2986208, -3.487438, 1, 1, 1, 1, 1,
-1.048439, -1.745525, -2.557296, 1, 1, 1, 1, 1,
-1.042468, -1.072285, -4.312891, 1, 1, 1, 1, 1,
-1.026332, 0.4768446, 0.04381066, 1, 1, 1, 1, 1,
-1.020787, 0.8689546, -3.027492, 1, 1, 1, 1, 1,
-1.016978, -1.783628, -2.69641, 1, 1, 1, 1, 1,
-1.016723, -1.389245, -1.937116, 1, 1, 1, 1, 1,
-1.014588, 1.845283, -1.597505, 1, 1, 1, 1, 1,
-1.014571, -0.1006084, -1.891426, 1, 1, 1, 1, 1,
-1.010867, 1.105716, 0.4065993, 1, 1, 1, 1, 1,
-1.010079, -0.7121667, -2.882555, 1, 1, 1, 1, 1,
-1.00986, -0.3484138, -2.586743, 1, 1, 1, 1, 1,
-0.9971457, 0.5577733, -0.01487743, 1, 1, 1, 1, 1,
-0.9945795, -2.100742, -1.072824, 0, 0, 1, 1, 1,
-0.992936, 0.7725176, -2.924435, 1, 0, 0, 1, 1,
-0.9927669, 0.532784, -2.006193, 1, 0, 0, 1, 1,
-0.9873873, 0.6772354, -0.7636799, 1, 0, 0, 1, 1,
-0.9864126, -0.2703763, -3.197405, 1, 0, 0, 1, 1,
-0.9830543, 1.152246, -1.234515, 1, 0, 0, 1, 1,
-0.9698617, 1.166506, 1.253108, 0, 0, 0, 1, 1,
-0.9694396, 0.534519, -1.768848, 0, 0, 0, 1, 1,
-0.953667, 0.062915, -2.423772, 0, 0, 0, 1, 1,
-0.9531736, -0.06556402, -2.884643, 0, 0, 0, 1, 1,
-0.9506335, 1.727872, -0.4097829, 0, 0, 0, 1, 1,
-0.9452519, 1.052218, -0.3307363, 0, 0, 0, 1, 1,
-0.9389905, -2.440082, -1.675726, 0, 0, 0, 1, 1,
-0.9378423, -1.089726, -3.152211, 1, 1, 1, 1, 1,
-0.9377522, -0.7146111, -2.684929, 1, 1, 1, 1, 1,
-0.935515, -0.9451715, -2.509196, 1, 1, 1, 1, 1,
-0.9290211, -0.6362972, -1.018341, 1, 1, 1, 1, 1,
-0.9251149, 0.9458697, -0.1884484, 1, 1, 1, 1, 1,
-0.9239846, -0.7738379, -2.499666, 1, 1, 1, 1, 1,
-0.9234213, -0.9530533, -3.922358, 1, 1, 1, 1, 1,
-0.9209741, 0.3135739, -0.01618283, 1, 1, 1, 1, 1,
-0.9182059, 1.726745, -0.8096755, 1, 1, 1, 1, 1,
-0.9159883, -0.5091236, -3.343278, 1, 1, 1, 1, 1,
-0.9154208, 0.01717029, -1.979228, 1, 1, 1, 1, 1,
-0.9125038, 0.8846185, -2.20976, 1, 1, 1, 1, 1,
-0.911286, 0.7358909, -0.1913678, 1, 1, 1, 1, 1,
-0.9074901, -2.135893, -1.263821, 1, 1, 1, 1, 1,
-0.9040345, 0.4730591, -0.7277058, 1, 1, 1, 1, 1,
-0.8988805, -3.35603, -2.728934, 0, 0, 1, 1, 1,
-0.8862969, -2.958186, -3.669051, 1, 0, 0, 1, 1,
-0.8842484, 0.5468793, -2.364562, 1, 0, 0, 1, 1,
-0.8794258, 0.07109395, -2.047405, 1, 0, 0, 1, 1,
-0.8786062, -1.757143, -2.609373, 1, 0, 0, 1, 1,
-0.8743724, 0.4249676, -2.384872, 1, 0, 0, 1, 1,
-0.8729615, -0.152575, -0.6282838, 0, 0, 0, 1, 1,
-0.8653252, -0.963174, -1.508099, 0, 0, 0, 1, 1,
-0.8633175, -0.4629285, -1.781848, 0, 0, 0, 1, 1,
-0.8632067, -1.207166, -3.746263, 0, 0, 0, 1, 1,
-0.8563504, -0.5761179, -0.5651981, 0, 0, 0, 1, 1,
-0.8560591, 0.8514062, -1.059825, 0, 0, 0, 1, 1,
-0.8484468, 1.623055, 0.02844643, 0, 0, 0, 1, 1,
-0.8479787, -0.5174135, -1.45417, 1, 1, 1, 1, 1,
-0.8470002, -0.2994864, -2.990083, 1, 1, 1, 1, 1,
-0.8450346, -2.394117, -2.728244, 1, 1, 1, 1, 1,
-0.8448522, -0.6897808, -4.505486, 1, 1, 1, 1, 1,
-0.8421592, 0.5311196, 1.399617, 1, 1, 1, 1, 1,
-0.8408512, 0.309973, -0.7074796, 1, 1, 1, 1, 1,
-0.8397211, -2.293422, -2.427413, 1, 1, 1, 1, 1,
-0.8212432, 0.01851621, -1.798934, 1, 1, 1, 1, 1,
-0.8187606, -0.3205289, -1.256262, 1, 1, 1, 1, 1,
-0.8187361, -1.090408, -2.560002, 1, 1, 1, 1, 1,
-0.8181747, -0.8795403, -3.525349, 1, 1, 1, 1, 1,
-0.8093666, 1.207553, -0.2982987, 1, 1, 1, 1, 1,
-0.8050698, 0.3623864, -1.751281, 1, 1, 1, 1, 1,
-0.797473, 0.3260273, -1.376748, 1, 1, 1, 1, 1,
-0.7891599, -0.2432246, -1.71454, 1, 1, 1, 1, 1,
-0.7773587, 0.6418109, -0.01026634, 0, 0, 1, 1, 1,
-0.776045, -0.8168048, -0.7029749, 1, 0, 0, 1, 1,
-0.7713977, -1.032816, -3.819757, 1, 0, 0, 1, 1,
-0.7680099, 1.726604, -0.2741091, 1, 0, 0, 1, 1,
-0.7658214, -1.398758, -2.57309, 1, 0, 0, 1, 1,
-0.7619572, 1.746725, 0.1298487, 1, 0, 0, 1, 1,
-0.7585574, -0.3485326, -2.433584, 0, 0, 0, 1, 1,
-0.7563585, 0.5139114, 0.3078521, 0, 0, 0, 1, 1,
-0.7557527, 0.213818, -1.724995, 0, 0, 0, 1, 1,
-0.7513069, -1.774703, -0.8640612, 0, 0, 0, 1, 1,
-0.7484559, -0.2822053, -1.102776, 0, 0, 0, 1, 1,
-0.7478514, -1.188676, -1.37086, 0, 0, 0, 1, 1,
-0.7427526, 1.763561, 0.06135477, 0, 0, 0, 1, 1,
-0.7421942, -0.3323884, -3.27048, 1, 1, 1, 1, 1,
-0.7323043, 0.2853015, -1.636629, 1, 1, 1, 1, 1,
-0.7273635, -0.896788, -0.7650551, 1, 1, 1, 1, 1,
-0.72721, -0.5583963, -2.506564, 1, 1, 1, 1, 1,
-0.7269116, -1.846149, -1.2988, 1, 1, 1, 1, 1,
-0.7218621, 2.005966, -1.469076, 1, 1, 1, 1, 1,
-0.7197714, -0.05927536, -0.8375063, 1, 1, 1, 1, 1,
-0.7193922, -1.169792, -2.057247, 1, 1, 1, 1, 1,
-0.7136547, -1.381809, -4.050986, 1, 1, 1, 1, 1,
-0.7116282, -0.9061836, -2.466599, 1, 1, 1, 1, 1,
-0.7095574, 0.598635, -1.717129, 1, 1, 1, 1, 1,
-0.7017845, -1.781391, -1.51987, 1, 1, 1, 1, 1,
-0.6945645, -0.6898876, -0.4038318, 1, 1, 1, 1, 1,
-0.6918717, 1.070946, 0.3959775, 1, 1, 1, 1, 1,
-0.6837371, 1.282352, 0.3950635, 1, 1, 1, 1, 1,
-0.6794481, 0.4196941, -1.055748, 0, 0, 1, 1, 1,
-0.6782161, 0.007305329, -1.743448, 1, 0, 0, 1, 1,
-0.6776668, -0.4081959, -0.8885203, 1, 0, 0, 1, 1,
-0.6775407, 0.7179339, -0.04131102, 1, 0, 0, 1, 1,
-0.6767877, -0.1200069, -1.605018, 1, 0, 0, 1, 1,
-0.6728358, -0.4890259, -2.326487, 1, 0, 0, 1, 1,
-0.669464, 0.6154984, -0.6206574, 0, 0, 0, 1, 1,
-0.6657358, -0.4083445, -2.339415, 0, 0, 0, 1, 1,
-0.6639202, 1.23984, -0.7702178, 0, 0, 0, 1, 1,
-0.6622679, -0.6791497, -1.410307, 0, 0, 0, 1, 1,
-0.6594002, -1.002566, -2.100213, 0, 0, 0, 1, 1,
-0.6507785, 0.3412682, -0.6149471, 0, 0, 0, 1, 1,
-0.6497383, -0.9847643, -3.05316, 0, 0, 0, 1, 1,
-0.6490553, -0.02844475, -0.7539174, 1, 1, 1, 1, 1,
-0.6488724, -0.6416501, -2.471738, 1, 1, 1, 1, 1,
-0.6483889, 0.5738885, -1.650428, 1, 1, 1, 1, 1,
-0.6468642, -0.3191948, -0.4665336, 1, 1, 1, 1, 1,
-0.6458855, 0.100222, -1.750964, 1, 1, 1, 1, 1,
-0.6457878, 0.3387904, -1.611438, 1, 1, 1, 1, 1,
-0.6392528, 0.2193825, -1.505342, 1, 1, 1, 1, 1,
-0.63903, -0.1295548, -2.099069, 1, 1, 1, 1, 1,
-0.6292956, 0.9883144, -0.8305698, 1, 1, 1, 1, 1,
-0.6286745, -0.725738, -4.268526, 1, 1, 1, 1, 1,
-0.6284859, -0.31569, -2.277, 1, 1, 1, 1, 1,
-0.6242772, -0.6388308, -3.052121, 1, 1, 1, 1, 1,
-0.6160725, 0.3775606, 0.665037, 1, 1, 1, 1, 1,
-0.6148312, -0.05611423, -1.906202, 1, 1, 1, 1, 1,
-0.6146688, -0.09201257, -2.524895, 1, 1, 1, 1, 1,
-0.6110889, -1.082749, -4.118262, 0, 0, 1, 1, 1,
-0.6079648, 0.2143831, -1.391229, 1, 0, 0, 1, 1,
-0.606899, -1.110862, -3.44348, 1, 0, 0, 1, 1,
-0.6054026, 1.998554, 0.3826627, 1, 0, 0, 1, 1,
-0.6043856, -0.4252564, -2.267581, 1, 0, 0, 1, 1,
-0.6034816, -0.50234, -1.770187, 1, 0, 0, 1, 1,
-0.6025237, -0.5277978, -0.7684304, 0, 0, 0, 1, 1,
-0.5958924, 0.07214154, -2.150852, 0, 0, 0, 1, 1,
-0.5956579, 0.5847299, 0.9173816, 0, 0, 0, 1, 1,
-0.5848789, -0.06364819, -2.430081, 0, 0, 0, 1, 1,
-0.5828098, 2.070229, 0.6576793, 0, 0, 0, 1, 1,
-0.5819422, -0.6292082, -1.72113, 0, 0, 0, 1, 1,
-0.5783205, -0.5800067, -6.144077, 0, 0, 0, 1, 1,
-0.5766126, 0.3361903, 1.418291, 1, 1, 1, 1, 1,
-0.5745429, 1.222569, -0.8445, 1, 1, 1, 1, 1,
-0.573711, 0.6749394, -1.28809, 1, 1, 1, 1, 1,
-0.5731322, -0.9760256, -3.022243, 1, 1, 1, 1, 1,
-0.5696443, 0.2812857, -1.263497, 1, 1, 1, 1, 1,
-0.5688704, -0.313479, -0.3468944, 1, 1, 1, 1, 1,
-0.5635724, 2.064742, -0.8534105, 1, 1, 1, 1, 1,
-0.563095, -0.2722363, -3.168857, 1, 1, 1, 1, 1,
-0.5628967, -0.06090694, -0.2531671, 1, 1, 1, 1, 1,
-0.5624576, -0.1935144, -1.567277, 1, 1, 1, 1, 1,
-0.5599408, -0.4272001, 0.3735492, 1, 1, 1, 1, 1,
-0.5591097, -0.4712736, -2.981651, 1, 1, 1, 1, 1,
-0.5557106, 0.541532, -2.262428, 1, 1, 1, 1, 1,
-0.5540799, -0.4202652, -0.4824793, 1, 1, 1, 1, 1,
-0.5522725, -0.5049582, -1.597979, 1, 1, 1, 1, 1,
-0.5517858, 0.2788728, -1.92922, 0, 0, 1, 1, 1,
-0.5413335, -0.987712, -2.213653, 1, 0, 0, 1, 1,
-0.5394285, -0.565759, -2.422523, 1, 0, 0, 1, 1,
-0.5310872, -1.529299, -2.704689, 1, 0, 0, 1, 1,
-0.5308487, 0.3538721, -0.9331996, 1, 0, 0, 1, 1,
-0.5296433, 0.1232951, 0.2419132, 1, 0, 0, 1, 1,
-0.5212845, -1.388493, -2.543318, 0, 0, 0, 1, 1,
-0.5205714, 1.839584, -2.351511, 0, 0, 0, 1, 1,
-0.5175117, 0.7231704, -0.7165278, 0, 0, 0, 1, 1,
-0.5170912, -0.5070502, -3.480627, 0, 0, 0, 1, 1,
-0.5094562, -0.6728968, -0.7082525, 0, 0, 0, 1, 1,
-0.508864, -0.1041991, -2.672486, 0, 0, 0, 1, 1,
-0.5064791, 0.1012631, -0.9550987, 0, 0, 0, 1, 1,
-0.5052128, -0.8040585, -2.441988, 1, 1, 1, 1, 1,
-0.4959382, -0.8965386, -1.856008, 1, 1, 1, 1, 1,
-0.495682, 0.4980811, 1.487368, 1, 1, 1, 1, 1,
-0.4937495, -0.01534893, -0.6333224, 1, 1, 1, 1, 1,
-0.4931629, 0.5868033, -1.442504, 1, 1, 1, 1, 1,
-0.4930274, -1.073839, -2.587429, 1, 1, 1, 1, 1,
-0.488906, 0.2593364, -1.517976, 1, 1, 1, 1, 1,
-0.4884738, -0.572518, -3.514351, 1, 1, 1, 1, 1,
-0.4836661, -1.064073, -2.462006, 1, 1, 1, 1, 1,
-0.480814, -0.3743242, -1.971933, 1, 1, 1, 1, 1,
-0.4805437, 0.8218321, -0.06667304, 1, 1, 1, 1, 1,
-0.4805061, 0.6450635, -0.6970756, 1, 1, 1, 1, 1,
-0.4800874, -0.1824401, -2.439768, 1, 1, 1, 1, 1,
-0.4792605, 1.395013, 0.9947233, 1, 1, 1, 1, 1,
-0.4748091, -0.3526218, -1.691171, 1, 1, 1, 1, 1,
-0.4712484, -0.2092988, -1.693238, 0, 0, 1, 1, 1,
-0.4694535, -0.8638538, -1.890617, 1, 0, 0, 1, 1,
-0.4692757, 0.6109723, -0.9378462, 1, 0, 0, 1, 1,
-0.4687723, 2.058377, -0.2291828, 1, 0, 0, 1, 1,
-0.4596899, 0.1278942, -0.5034651, 1, 0, 0, 1, 1,
-0.454867, 0.186532, -1.360899, 1, 0, 0, 1, 1,
-0.4547733, 0.01789152, -2.00699, 0, 0, 0, 1, 1,
-0.4515708, -0.3739218, -4.250013, 0, 0, 0, 1, 1,
-0.4510296, 0.1102788, -2.195676, 0, 0, 0, 1, 1,
-0.4507217, 0.6409642, -1.987807, 0, 0, 0, 1, 1,
-0.4503981, 0.6140295, -1.505007, 0, 0, 0, 1, 1,
-0.4413879, 0.3657028, 0.2611312, 0, 0, 0, 1, 1,
-0.4396481, 0.8729859, -2.277634, 0, 0, 0, 1, 1,
-0.4318001, 1.308578, -0.8633326, 1, 1, 1, 1, 1,
-0.430341, 0.2288911, -0.6424235, 1, 1, 1, 1, 1,
-0.4262471, 0.9878781, -0.4692195, 1, 1, 1, 1, 1,
-0.4246593, 0.006414799, -0.3866349, 1, 1, 1, 1, 1,
-0.4237222, -1.014008, -1.272287, 1, 1, 1, 1, 1,
-0.4127699, 1.325661, -0.08088819, 1, 1, 1, 1, 1,
-0.4105201, 0.02256997, -1.494753, 1, 1, 1, 1, 1,
-0.4076345, 2.137948, -0.9969462, 1, 1, 1, 1, 1,
-0.4065077, -0.1643656, -0.4814983, 1, 1, 1, 1, 1,
-0.402842, -1.842316, -4.194839, 1, 1, 1, 1, 1,
-0.3980004, -0.3620089, -2.19952, 1, 1, 1, 1, 1,
-0.3969606, -1.808963, -2.126222, 1, 1, 1, 1, 1,
-0.3967414, -2.363409, -1.870996, 1, 1, 1, 1, 1,
-0.3950952, 0.9728728, -1.417132, 1, 1, 1, 1, 1,
-0.3896225, -0.9024071, -3.978017, 1, 1, 1, 1, 1,
-0.3879563, 0.6331704, 0.4813576, 0, 0, 1, 1, 1,
-0.3877552, -0.3564798, -2.608169, 1, 0, 0, 1, 1,
-0.3869357, -1.890912, -4.084254, 1, 0, 0, 1, 1,
-0.3838355, -0.8279739, -2.859268, 1, 0, 0, 1, 1,
-0.3799619, 0.7151689, 0.07688649, 1, 0, 0, 1, 1,
-0.374464, 0.8963947, -1.508442, 1, 0, 0, 1, 1,
-0.3738519, -0.3068307, -1.680138, 0, 0, 0, 1, 1,
-0.3731624, -0.161161, -2.391881, 0, 0, 0, 1, 1,
-0.3697602, 1.280314, 0.334054, 0, 0, 0, 1, 1,
-0.3676227, -1.316611, -1.492566, 0, 0, 0, 1, 1,
-0.3606404, -1.736186, -3.819387, 0, 0, 0, 1, 1,
-0.3594098, -1.94939, -3.442822, 0, 0, 0, 1, 1,
-0.3579068, -0.5781059, -3.008959, 0, 0, 0, 1, 1,
-0.3564831, 0.1553735, -0.5671965, 1, 1, 1, 1, 1,
-0.355832, -1.317758, -3.070474, 1, 1, 1, 1, 1,
-0.3556087, -0.7840244, -0.9025855, 1, 1, 1, 1, 1,
-0.3549005, 0.2888938, -1.704355, 1, 1, 1, 1, 1,
-0.3531615, 1.442805, 1.016489, 1, 1, 1, 1, 1,
-0.3527037, -0.6482418, -3.749082, 1, 1, 1, 1, 1,
-0.3513963, 0.2156308, -1.132098, 1, 1, 1, 1, 1,
-0.3485946, -0.4921384, -1.337032, 1, 1, 1, 1, 1,
-0.348449, -0.6596396, -3.732521, 1, 1, 1, 1, 1,
-0.3462428, 0.9310009, 0.1686944, 1, 1, 1, 1, 1,
-0.3458211, 0.7271265, -0.2966365, 1, 1, 1, 1, 1,
-0.3446614, 1.53971, 1.463415, 1, 1, 1, 1, 1,
-0.3435409, -1.412659, -3.331192, 1, 1, 1, 1, 1,
-0.3419982, 0.08868178, -2.954202, 1, 1, 1, 1, 1,
-0.3368025, 0.03687863, -2.163451, 1, 1, 1, 1, 1,
-0.332635, 0.1990748, -1.842985, 0, 0, 1, 1, 1,
-0.3242953, -0.01821806, 1.258418, 1, 0, 0, 1, 1,
-0.3155609, 1.387693, -0.7651606, 1, 0, 0, 1, 1,
-0.3053235, 2.22318, -0.2233419, 1, 0, 0, 1, 1,
-0.3002703, -0.4197651, -1.10399, 1, 0, 0, 1, 1,
-0.2971078, 0.5321314, 1.347084, 1, 0, 0, 1, 1,
-0.2954462, -2.975445, -3.687909, 0, 0, 0, 1, 1,
-0.2950358, -1.817846, -2.838103, 0, 0, 0, 1, 1,
-0.2871568, -0.9846016, -3.367677, 0, 0, 0, 1, 1,
-0.2862669, 1.019631, -0.7837859, 0, 0, 0, 1, 1,
-0.283677, -0.8314775, -2.331746, 0, 0, 0, 1, 1,
-0.2836162, 0.9397825, 0.5333813, 0, 0, 0, 1, 1,
-0.277664, -0.7154439, -3.838587, 0, 0, 0, 1, 1,
-0.2762111, -1.652405, -4.333227, 1, 1, 1, 1, 1,
-0.2748488, -1.355585, -1.832355, 1, 1, 1, 1, 1,
-0.2732492, -0.2119468, -3.062901, 1, 1, 1, 1, 1,
-0.2698486, 0.5928239, 0.748215, 1, 1, 1, 1, 1,
-0.2685132, 1.215945, 0.0837239, 1, 1, 1, 1, 1,
-0.2656484, 1.842906, -0.5984378, 1, 1, 1, 1, 1,
-0.264598, -0.09976939, -0.3229675, 1, 1, 1, 1, 1,
-0.262144, 0.04368732, -0.960459, 1, 1, 1, 1, 1,
-0.2590553, -0.9613529, -3.815958, 1, 1, 1, 1, 1,
-0.2585186, 0.6273797, -2.275751, 1, 1, 1, 1, 1,
-0.2562777, -2.336194, -2.382586, 1, 1, 1, 1, 1,
-0.2525044, -0.5544515, -3.621815, 1, 1, 1, 1, 1,
-0.252429, 0.1810924, 0.09221677, 1, 1, 1, 1, 1,
-0.2520705, 0.1463212, 0.3000764, 1, 1, 1, 1, 1,
-0.2510603, 0.5585238, -0.7951857, 1, 1, 1, 1, 1,
-0.2506193, 0.4324768, -1.18341, 0, 0, 1, 1, 1,
-0.2445991, -0.1119026, -1.318041, 1, 0, 0, 1, 1,
-0.2436964, -0.3848921, -2.167164, 1, 0, 0, 1, 1,
-0.2405326, -0.3702071, -3.216734, 1, 0, 0, 1, 1,
-0.2263294, 1.111511, 0.004938853, 1, 0, 0, 1, 1,
-0.2260182, 0.06135104, -1.038102, 1, 0, 0, 1, 1,
-0.2255005, -0.1521212, -1.666046, 0, 0, 0, 1, 1,
-0.2249978, 1.327472, 1.085675, 0, 0, 0, 1, 1,
-0.2207701, -0.5747792, -2.412289, 0, 0, 0, 1, 1,
-0.2185947, 0.198799, -1.237051, 0, 0, 0, 1, 1,
-0.218141, 0.6219065, 0.4162754, 0, 0, 0, 1, 1,
-0.2179688, 0.1707756, -1.904475, 0, 0, 0, 1, 1,
-0.2178252, 1.540608, 0.7537124, 0, 0, 0, 1, 1,
-0.2158197, -1.21024, -2.444881, 1, 1, 1, 1, 1,
-0.2130966, 0.6658238, 0.7307837, 1, 1, 1, 1, 1,
-0.2073643, 0.5859625, 1.057079, 1, 1, 1, 1, 1,
-0.2068264, -0.7153752, -2.563758, 1, 1, 1, 1, 1,
-0.2045419, 0.09162485, -1.787395, 1, 1, 1, 1, 1,
-0.2040273, 0.7193587, 0.4681352, 1, 1, 1, 1, 1,
-0.203879, 1.189163, -0.2990887, 1, 1, 1, 1, 1,
-0.2011423, 1.395666, 1.9045, 1, 1, 1, 1, 1,
-0.1994069, -1.087609, -2.24371, 1, 1, 1, 1, 1,
-0.1973103, 1.572129, 1.465942, 1, 1, 1, 1, 1,
-0.1926949, -0.3859651, -2.027442, 1, 1, 1, 1, 1,
-0.1871371, -0.0975325, -2.720015, 1, 1, 1, 1, 1,
-0.183393, -0.2024752, -2.223955, 1, 1, 1, 1, 1,
-0.1828024, 0.7910545, -0.04296242, 1, 1, 1, 1, 1,
-0.1772939, -0.3292211, -3.203014, 1, 1, 1, 1, 1,
-0.1761432, -0.610064, -2.335736, 0, 0, 1, 1, 1,
-0.1732307, -0.4381927, -2.267823, 1, 0, 0, 1, 1,
-0.1705807, -0.6762627, -1.751015, 1, 0, 0, 1, 1,
-0.1695984, -0.3515296, -3.269259, 1, 0, 0, 1, 1,
-0.1691846, 0.04426614, -2.096867, 1, 0, 0, 1, 1,
-0.1688153, 1.039105, 1.217012, 1, 0, 0, 1, 1,
-0.1671046, -0.2810455, -2.167886, 0, 0, 0, 1, 1,
-0.166353, -0.04953652, -1.333024, 0, 0, 0, 1, 1,
-0.1613003, 0.5217029, -1.323186, 0, 0, 0, 1, 1,
-0.1595086, 1.14642, -1.34417, 0, 0, 0, 1, 1,
-0.1581188, -0.04753224, -3.944539, 0, 0, 0, 1, 1,
-0.1556439, 0.3754531, -0.9995652, 0, 0, 0, 1, 1,
-0.1516897, 0.3455694, 1.42592, 0, 0, 0, 1, 1,
-0.1507135, -0.1571284, -3.296548, 1, 1, 1, 1, 1,
-0.1493902, -0.1597214, -3.266861, 1, 1, 1, 1, 1,
-0.1470025, -0.1236487, -2.290189, 1, 1, 1, 1, 1,
-0.1440254, -0.3125321, -2.611419, 1, 1, 1, 1, 1,
-0.1420928, 2.154738, -0.5636807, 1, 1, 1, 1, 1,
-0.1416916, -2.107187, -2.698087, 1, 1, 1, 1, 1,
-0.1371999, -0.5854774, -2.501946, 1, 1, 1, 1, 1,
-0.1350543, -1.11037, -4.346468, 1, 1, 1, 1, 1,
-0.1342744, 0.8018211, 0.1164055, 1, 1, 1, 1, 1,
-0.1333214, 0.7019686, -0.6738338, 1, 1, 1, 1, 1,
-0.1322021, 1.004957, 1.198971, 1, 1, 1, 1, 1,
-0.1258608, -0.7299431, -2.524242, 1, 1, 1, 1, 1,
-0.1151728, 0.5582636, 0.2373592, 1, 1, 1, 1, 1,
-0.1132328, -0.8338125, -2.948931, 1, 1, 1, 1, 1,
-0.1092203, -0.2941296, -2.348287, 1, 1, 1, 1, 1,
-0.1071262, -0.9435623, -2.821985, 0, 0, 1, 1, 1,
-0.1041039, 0.3853076, 0.7645589, 1, 0, 0, 1, 1,
-0.09208003, 0.7284884, -1.288337, 1, 0, 0, 1, 1,
-0.08957636, 2.036358, 0.7591087, 1, 0, 0, 1, 1,
-0.08812783, 1.468052, 0.7646949, 1, 0, 0, 1, 1,
-0.08647373, -1.00002, -3.238147, 1, 0, 0, 1, 1,
-0.08606795, -0.6033385, -4.348858, 0, 0, 0, 1, 1,
-0.08602798, 1.839891, -1.951164, 0, 0, 0, 1, 1,
-0.0793722, 0.8422235, -0.4228347, 0, 0, 0, 1, 1,
-0.07890292, 1.757074, 1.968105, 0, 0, 0, 1, 1,
-0.07875563, 1.986059, -0.3012676, 0, 0, 0, 1, 1,
-0.07539177, 1.243727, -0.233294, 0, 0, 0, 1, 1,
-0.07431797, 1.022474, 0.7826993, 0, 0, 0, 1, 1,
-0.07327411, 0.8025779, -0.7320033, 1, 1, 1, 1, 1,
-0.07268197, 0.4918181, 0.8395926, 1, 1, 1, 1, 1,
-0.07007797, -0.1914493, -3.287988, 1, 1, 1, 1, 1,
-0.06883381, 0.01933596, -1.974343, 1, 1, 1, 1, 1,
-0.0672827, 0.7939553, 1.196428, 1, 1, 1, 1, 1,
-0.05818281, -0.7903639, -2.516713, 1, 1, 1, 1, 1,
-0.04916136, 1.308025, 0.3214014, 1, 1, 1, 1, 1,
-0.04489318, 0.5924347, -0.0571856, 1, 1, 1, 1, 1,
-0.04166444, -0.2976574, -4.672185, 1, 1, 1, 1, 1,
-0.04081981, 0.4567971, 0.6599548, 1, 1, 1, 1, 1,
-0.04066367, 1.701521, 0.6098406, 1, 1, 1, 1, 1,
-0.03500707, -0.5722723, -2.890043, 1, 1, 1, 1, 1,
-0.03129217, 0.6034524, 0.4197557, 1, 1, 1, 1, 1,
-0.02980276, 0.7363859, 0.09972907, 1, 1, 1, 1, 1,
-0.0292808, 0.7245063, -0.2401253, 1, 1, 1, 1, 1,
-0.0232577, -0.7870972, -2.794993, 0, 0, 1, 1, 1,
-0.02322386, 0.6233632, 0.7536059, 1, 0, 0, 1, 1,
-0.01719187, 0.03566073, 0.68352, 1, 0, 0, 1, 1,
-0.01133757, -0.05403856, -2.534868, 1, 0, 0, 1, 1,
-0.0111186, 1.486501, -1.443857, 1, 0, 0, 1, 1,
-0.009338886, 1.116746, -0.6749018, 1, 0, 0, 1, 1,
-0.00816348, -0.1944497, -1.675447, 0, 0, 0, 1, 1,
-0.007800566, -0.1637356, -2.479926, 0, 0, 0, 1, 1,
-0.00723818, -0.8897638, -4.162485, 0, 0, 0, 1, 1,
-0.003884103, 0.06653269, 2.492301, 0, 0, 0, 1, 1,
-0.002534805, -1.262781, -5.343481, 0, 0, 0, 1, 1,
-0.001781181, 0.2702567, 1.040669, 0, 0, 0, 1, 1,
0.001800466, -1.081058, 2.939515, 0, 0, 0, 1, 1,
0.003698892, -0.5120438, 3.51194, 1, 1, 1, 1, 1,
0.005924035, 0.2289146, 0.8803303, 1, 1, 1, 1, 1,
0.009261175, -0.5001711, 2.994643, 1, 1, 1, 1, 1,
0.01022707, 0.5765038, -0.6132848, 1, 1, 1, 1, 1,
0.01117455, 0.3356922, 0.3947704, 1, 1, 1, 1, 1,
0.01335371, -0.8404542, 4.007468, 1, 1, 1, 1, 1,
0.01372576, -1.024043, 2.832911, 1, 1, 1, 1, 1,
0.02408402, 1.026504, 1.063654, 1, 1, 1, 1, 1,
0.02630158, -0.07437419, 2.291518, 1, 1, 1, 1, 1,
0.02875647, -0.5132896, 2.279482, 1, 1, 1, 1, 1,
0.02923838, -1.010129, 3.994726, 1, 1, 1, 1, 1,
0.03001537, 0.3610182, 1.034933, 1, 1, 1, 1, 1,
0.03110858, 0.4685622, -1.033397, 1, 1, 1, 1, 1,
0.03144677, -1.384416, 0.6910732, 1, 1, 1, 1, 1,
0.03335547, 0.6865718, 1.515823, 1, 1, 1, 1, 1,
0.03485747, 0.393897, -0.6954147, 0, 0, 1, 1, 1,
0.03659019, -0.2295421, 2.651819, 1, 0, 0, 1, 1,
0.04001877, 0.4270344, 0.4583366, 1, 0, 0, 1, 1,
0.04384068, 1.084186, 0.2926334, 1, 0, 0, 1, 1,
0.0456263, -0.7881529, 4.431165, 1, 0, 0, 1, 1,
0.04749238, -1.242772, 3.412286, 1, 0, 0, 1, 1,
0.04792348, -1.926202, 4.395548, 0, 0, 0, 1, 1,
0.05229476, 1.840529, -0.1509793, 0, 0, 0, 1, 1,
0.05245468, 1.772519, -0.6391935, 0, 0, 0, 1, 1,
0.05345935, -1.222582, 5.278753, 0, 0, 0, 1, 1,
0.05420106, 0.2868548, 0.3570762, 0, 0, 0, 1, 1,
0.0615981, -0.8193708, 3.552126, 0, 0, 0, 1, 1,
0.06237001, -1.470659, 3.25969, 0, 0, 0, 1, 1,
0.06300563, 0.9379621, -0.06743325, 1, 1, 1, 1, 1,
0.0681993, 0.4057289, 1.336419, 1, 1, 1, 1, 1,
0.07068116, 2.298517, 1.25663, 1, 1, 1, 1, 1,
0.07212189, -0.1321004, 3.076317, 1, 1, 1, 1, 1,
0.07306097, -1.273929, 3.184297, 1, 1, 1, 1, 1,
0.07971942, 0.09390932, 1.037518, 1, 1, 1, 1, 1,
0.08972953, 0.4983133, 2.59082, 1, 1, 1, 1, 1,
0.09225255, -0.2022838, 2.640923, 1, 1, 1, 1, 1,
0.1020573, -0.3524247, 3.990265, 1, 1, 1, 1, 1,
0.1042474, 0.6363177, -1.141769, 1, 1, 1, 1, 1,
0.1048395, -0.18218, 2.29352, 1, 1, 1, 1, 1,
0.1084049, -0.4232645, 3.554514, 1, 1, 1, 1, 1,
0.1157388, -0.3449499, 2.929548, 1, 1, 1, 1, 1,
0.1172235, 1.031565, 1.487143, 1, 1, 1, 1, 1,
0.1257605, 0.3277966, 0.702143, 1, 1, 1, 1, 1,
0.126043, 0.3874705, -3.525675, 0, 0, 1, 1, 1,
0.1277941, -1.015812, 3.138783, 1, 0, 0, 1, 1,
0.1283278, 0.2902229, 0.6338468, 1, 0, 0, 1, 1,
0.1287412, 0.2109396, 1.949563, 1, 0, 0, 1, 1,
0.1329723, -0.4273158, 1.622873, 1, 0, 0, 1, 1,
0.1371003, 1.213332, 0.4154924, 1, 0, 0, 1, 1,
0.1371474, 0.6796382, 0.9849166, 0, 0, 0, 1, 1,
0.1374962, 1.086057, 1.473664, 0, 0, 0, 1, 1,
0.1445514, -0.2154427, 3.133583, 0, 0, 0, 1, 1,
0.1454027, -0.880977, 3.993091, 0, 0, 0, 1, 1,
0.1455649, -0.5732317, 2.6717, 0, 0, 0, 1, 1,
0.1477381, 0.151805, 0.3661331, 0, 0, 0, 1, 1,
0.1491661, -0.5223653, 1.707016, 0, 0, 0, 1, 1,
0.154857, -0.6092192, 2.975121, 1, 1, 1, 1, 1,
0.1562882, -0.3781019, 2.776488, 1, 1, 1, 1, 1,
0.1574028, 1.447496, 0.7910836, 1, 1, 1, 1, 1,
0.1624253, 0.06339028, 0.946381, 1, 1, 1, 1, 1,
0.1635388, 2.567126, -0.6761823, 1, 1, 1, 1, 1,
0.1680979, 1.484333, 0.5084754, 1, 1, 1, 1, 1,
0.1729925, -0.4185114, 3.687977, 1, 1, 1, 1, 1,
0.1737273, 1.053593, -0.5741825, 1, 1, 1, 1, 1,
0.1784401, -0.9213992, 2.879062, 1, 1, 1, 1, 1,
0.182928, 0.420929, 2.00801, 1, 1, 1, 1, 1,
0.1841552, 0.772831, -0.3083704, 1, 1, 1, 1, 1,
0.1869251, 0.7308322, 0.5013868, 1, 1, 1, 1, 1,
0.1890862, -0.3860014, 3.639426, 1, 1, 1, 1, 1,
0.1913521, 0.5871494, -0.1581016, 1, 1, 1, 1, 1,
0.1975358, -0.3402614, 1.081027, 1, 1, 1, 1, 1,
0.1988266, -0.5755983, 3.803749, 0, 0, 1, 1, 1,
0.2005495, -0.8553564, 3.084521, 1, 0, 0, 1, 1,
0.2113585, 0.04412594, 1.858718, 1, 0, 0, 1, 1,
0.2133263, 1.611956, 1.110275, 1, 0, 0, 1, 1,
0.2180961, -0.5021697, 2.078864, 1, 0, 0, 1, 1,
0.2189612, 1.707624, -1.296197, 1, 0, 0, 1, 1,
0.2286149, 0.04089834, 2.44093, 0, 0, 0, 1, 1,
0.2414418, -0.5535657, 2.212689, 0, 0, 0, 1, 1,
0.2446212, -0.8009433, 1.561015, 0, 0, 0, 1, 1,
0.2451088, -0.4716879, 2.966834, 0, 0, 0, 1, 1,
0.2468371, -1.03251, 1.427338, 0, 0, 0, 1, 1,
0.24742, -0.2982818, 1.974553, 0, 0, 0, 1, 1,
0.2492212, 1.220455, 0.2879676, 0, 0, 0, 1, 1,
0.2511099, 0.2485774, 0.1851809, 1, 1, 1, 1, 1,
0.2554708, 1.04624, 1.136683, 1, 1, 1, 1, 1,
0.2574666, 0.8426954, 2.218479, 1, 1, 1, 1, 1,
0.2589731, -0.7134088, 1.98274, 1, 1, 1, 1, 1,
0.2620681, 0.4212719, 0.7918475, 1, 1, 1, 1, 1,
0.2621934, 2.399501, 1.031474, 1, 1, 1, 1, 1,
0.265004, -0.7264854, 4.121847, 1, 1, 1, 1, 1,
0.2671012, 0.7807653, 1.537072, 1, 1, 1, 1, 1,
0.2674614, 0.1398855, 3.436913, 1, 1, 1, 1, 1,
0.279412, 0.6371573, 1.411388, 1, 1, 1, 1, 1,
0.2861714, 0.3467041, 1.290736, 1, 1, 1, 1, 1,
0.2888714, 1.071293, 0.382506, 1, 1, 1, 1, 1,
0.2914614, -1.722226, 3.134482, 1, 1, 1, 1, 1,
0.2917436, -0.3789577, 0.8779908, 1, 1, 1, 1, 1,
0.2937076, 0.6766422, -0.5077632, 1, 1, 1, 1, 1,
0.2940862, -0.2305774, 2.567233, 0, 0, 1, 1, 1,
0.2957276, -0.8179322, 2.375106, 1, 0, 0, 1, 1,
0.3010646, 1.086084, 0.9136866, 1, 0, 0, 1, 1,
0.3081933, 1.47777, -0.3768357, 1, 0, 0, 1, 1,
0.3105614, -2.39991, 1.240753, 1, 0, 0, 1, 1,
0.3115455, 0.6523384, -0.7149422, 1, 0, 0, 1, 1,
0.3207459, -0.4468772, 2.936996, 0, 0, 0, 1, 1,
0.3252644, 1.03786, 0.7717518, 0, 0, 0, 1, 1,
0.32964, 0.03376175, 2.887667, 0, 0, 0, 1, 1,
0.3297693, 0.2235568, 1.193311, 0, 0, 0, 1, 1,
0.3306366, -0.1520754, 1.600198, 0, 0, 0, 1, 1,
0.3329807, -0.696827, 4.194187, 0, 0, 0, 1, 1,
0.3337367, 1.087935, 0.009818945, 0, 0, 0, 1, 1,
0.3363784, 0.03565292, 2.008364, 1, 1, 1, 1, 1,
0.3381499, -0.4707741, 1.544058, 1, 1, 1, 1, 1,
0.3413703, -0.7761087, 1.525566, 1, 1, 1, 1, 1,
0.3415502, -1.871742, 2.778613, 1, 1, 1, 1, 1,
0.34324, -1.117241, 4.848594, 1, 1, 1, 1, 1,
0.3470166, 0.1727524, 0.7897598, 1, 1, 1, 1, 1,
0.3477894, -0.6646572, 4.374227, 1, 1, 1, 1, 1,
0.34876, -1.259893, 3.227452, 1, 1, 1, 1, 1,
0.3494009, -0.6949152, 2.332805, 1, 1, 1, 1, 1,
0.3514896, -0.0318143, 0.1119294, 1, 1, 1, 1, 1,
0.3517213, -1.149078, 2.518446, 1, 1, 1, 1, 1,
0.3532531, -0.4421549, 3.997689, 1, 1, 1, 1, 1,
0.3535962, 0.6450773, 0.5940363, 1, 1, 1, 1, 1,
0.3585179, -0.5377698, 2.097077, 1, 1, 1, 1, 1,
0.3639078, 0.7562555, -0.2660735, 1, 1, 1, 1, 1,
0.3688635, 0.7474282, -0.04529063, 0, 0, 1, 1, 1,
0.3689321, 1.784296, 1.192778, 1, 0, 0, 1, 1,
0.3699872, 1.618352, 0.1953561, 1, 0, 0, 1, 1,
0.3700548, -2.000813, 3.291174, 1, 0, 0, 1, 1,
0.3730645, -1.368846, 3.269811, 1, 0, 0, 1, 1,
0.3794345, -0.889713, 2.511857, 1, 0, 0, 1, 1,
0.3794897, 0.605532, 0.3951322, 0, 0, 0, 1, 1,
0.3816925, -1.010376, 3.201925, 0, 0, 0, 1, 1,
0.3832987, -0.1525281, 1.837702, 0, 0, 0, 1, 1,
0.3882329, 1.711787, 1.177303, 0, 0, 0, 1, 1,
0.3951166, 1.549103, 1.240163, 0, 0, 0, 1, 1,
0.3955247, 1.440822, 0.107731, 0, 0, 0, 1, 1,
0.4041515, -1.690104, 2.704279, 0, 0, 0, 1, 1,
0.4054003, 1.759098, 0.6055871, 1, 1, 1, 1, 1,
0.4152496, 1.721345, 0.006624178, 1, 1, 1, 1, 1,
0.416508, 1.382742, 0.4655299, 1, 1, 1, 1, 1,
0.4189274, 1.149209, -0.6129604, 1, 1, 1, 1, 1,
0.4229705, -1.107261, 2.519478, 1, 1, 1, 1, 1,
0.4232981, 0.5401171, 0.1691363, 1, 1, 1, 1, 1,
0.4246353, -1.31758, 3.74758, 1, 1, 1, 1, 1,
0.4258384, 1.158929, -1.682605, 1, 1, 1, 1, 1,
0.4264066, 0.199627, 0.8485178, 1, 1, 1, 1, 1,
0.4283641, 0.8849804, -0.8479235, 1, 1, 1, 1, 1,
0.433327, -2.144083, 2.836596, 1, 1, 1, 1, 1,
0.433883, -1.371233, 3.263521, 1, 1, 1, 1, 1,
0.4425489, -1.666108, 5.338631, 1, 1, 1, 1, 1,
0.4440012, -0.925355, 3.013661, 1, 1, 1, 1, 1,
0.4492159, -0.1370623, 0.1978062, 1, 1, 1, 1, 1,
0.4533566, 1.397698, 0.3209164, 0, 0, 1, 1, 1,
0.4562346, 1.083875, 1.97408, 1, 0, 0, 1, 1,
0.4603143, 0.5773782, 0.4848693, 1, 0, 0, 1, 1,
0.4608407, 0.8987781, 1.439363, 1, 0, 0, 1, 1,
0.462707, 0.8288979, -0.3088791, 1, 0, 0, 1, 1,
0.4627442, -0.2577358, 2.986812, 1, 0, 0, 1, 1,
0.4642604, -1.105187, 2.409971, 0, 0, 0, 1, 1,
0.464537, -0.8877447, 4.24197, 0, 0, 0, 1, 1,
0.4669797, 2.604299, 2.206563, 0, 0, 0, 1, 1,
0.4679031, -0.1109006, 2.955865, 0, 0, 0, 1, 1,
0.473825, 2.325341, 1.739057, 0, 0, 0, 1, 1,
0.4788638, -1.074355, 1.339157, 0, 0, 0, 1, 1,
0.4846016, 1.129014, -1.360568, 0, 0, 0, 1, 1,
0.492842, 0.02178178, 2.255529, 1, 1, 1, 1, 1,
0.4936262, 0.2111845, 1.829165, 1, 1, 1, 1, 1,
0.4960911, -1.561209, 1.834441, 1, 1, 1, 1, 1,
0.4964747, 0.1546321, 2.278325, 1, 1, 1, 1, 1,
0.4998547, -0.2117663, 1.606962, 1, 1, 1, 1, 1,
0.5016134, -0.3098499, 2.453992, 1, 1, 1, 1, 1,
0.502243, 0.4004039, 1.73595, 1, 1, 1, 1, 1,
0.5055954, -0.4850498, 2.836407, 1, 1, 1, 1, 1,
0.5079799, -0.7701201, 1.983716, 1, 1, 1, 1, 1,
0.5080712, 1.308493, 0.2137588, 1, 1, 1, 1, 1,
0.5092323, -1.094808, 2.346101, 1, 1, 1, 1, 1,
0.5111965, -0.1310946, 0.9104525, 1, 1, 1, 1, 1,
0.5157648, 1.221245, 0.5271096, 1, 1, 1, 1, 1,
0.5167686, 0.9787252, -0.9056733, 1, 1, 1, 1, 1,
0.5177113, -0.3839057, 2.007438, 1, 1, 1, 1, 1,
0.5178023, -1.028946, 0.6403189, 0, 0, 1, 1, 1,
0.5207762, -1.11413, 1.945336, 1, 0, 0, 1, 1,
0.5213389, 0.2616312, 1.12262, 1, 0, 0, 1, 1,
0.5219148, -1.118224, 2.384752, 1, 0, 0, 1, 1,
0.52989, 1.289842, 0.9708634, 1, 0, 0, 1, 1,
0.5313279, 0.2598018, 1.894165, 1, 0, 0, 1, 1,
0.533823, -0.8340561, 1.454697, 0, 0, 0, 1, 1,
0.5384476, 0.03876882, 1.208324, 0, 0, 0, 1, 1,
0.551819, 0.138215, 1.494946, 0, 0, 0, 1, 1,
0.557319, -0.1208984, 1.962513, 0, 0, 0, 1, 1,
0.563804, -0.9807877, 1.553455, 0, 0, 0, 1, 1,
0.567387, 0.4000438, -0.1825062, 0, 0, 0, 1, 1,
0.5702957, 0.3342054, 2.001893, 0, 0, 0, 1, 1,
0.5794608, 0.3236833, -0.1964544, 1, 1, 1, 1, 1,
0.5807455, 0.1009407, 0.6194816, 1, 1, 1, 1, 1,
0.5811026, -0.1080198, 2.230373, 1, 1, 1, 1, 1,
0.5862818, -1.250387, 2.349088, 1, 1, 1, 1, 1,
0.5889481, 1.926315, -0.7852961, 1, 1, 1, 1, 1,
0.5896589, 1.267096, 2.351611, 1, 1, 1, 1, 1,
0.5896765, 0.4453129, -0.2819529, 1, 1, 1, 1, 1,
0.5962233, -1.36737, 3.304755, 1, 1, 1, 1, 1,
0.6001741, 0.9559463, 1.087064, 1, 1, 1, 1, 1,
0.6033475, 0.7820196, 0.7298552, 1, 1, 1, 1, 1,
0.6073557, -0.03069909, 1.793503, 1, 1, 1, 1, 1,
0.6091222, -0.5721568, 1.474226, 1, 1, 1, 1, 1,
0.6182717, 0.8521333, 0.3895286, 1, 1, 1, 1, 1,
0.6194699, 0.4241779, -1.057892, 1, 1, 1, 1, 1,
0.6224853, -1.183681, 3.608376, 1, 1, 1, 1, 1,
0.6239084, 0.8380486, 0.3977376, 0, 0, 1, 1, 1,
0.6240183, 0.9697308, 0.2851626, 1, 0, 0, 1, 1,
0.6288152, -0.3028368, 1.429663, 1, 0, 0, 1, 1,
0.6323265, 0.2633704, 1.592127, 1, 0, 0, 1, 1,
0.6344516, -0.7232891, 2.737617, 1, 0, 0, 1, 1,
0.634777, -0.4028275, 2.181773, 1, 0, 0, 1, 1,
0.6375302, 1.075335, -0.4714912, 0, 0, 0, 1, 1,
0.6403208, -2.457241, 3.150278, 0, 0, 0, 1, 1,
0.6450877, -0.1836452, 2.433305, 0, 0, 0, 1, 1,
0.6474015, -0.4212632, 2.448657, 0, 0, 0, 1, 1,
0.6475549, -1.267535, 2.968347, 0, 0, 0, 1, 1,
0.6498082, -0.8836882, 4.562434, 0, 0, 0, 1, 1,
0.6547275, 0.4635827, 1.630692, 0, 0, 0, 1, 1,
0.6556912, -0.8583484, 2.969165, 1, 1, 1, 1, 1,
0.6583903, -0.9641507, 3.167101, 1, 1, 1, 1, 1,
0.6644659, 1.220583, 1.54472, 1, 1, 1, 1, 1,
0.6648696, -0.187774, 2.019022, 1, 1, 1, 1, 1,
0.6679859, 0.5754167, 1.047049, 1, 1, 1, 1, 1,
0.6746921, -0.3593315, 1.908901, 1, 1, 1, 1, 1,
0.6758082, 0.4504368, 1.557253, 1, 1, 1, 1, 1,
0.67751, 0.6868317, 0.5708241, 1, 1, 1, 1, 1,
0.6788383, 0.06136978, 0.8351688, 1, 1, 1, 1, 1,
0.6816809, -2.080785, 2.450182, 1, 1, 1, 1, 1,
0.6819431, -0.8656616, 2.847242, 1, 1, 1, 1, 1,
0.6824076, 0.7464654, -0.07854044, 1, 1, 1, 1, 1,
0.6837652, 0.3775797, 2.089766, 1, 1, 1, 1, 1,
0.6851397, 0.3303853, 2.25301, 1, 1, 1, 1, 1,
0.6859597, 0.5227041, 2.325995, 1, 1, 1, 1, 1,
0.6874582, 0.3488613, 0.2945493, 0, 0, 1, 1, 1,
0.6879137, 0.5480169, -0.2981225, 1, 0, 0, 1, 1,
0.688224, -0.8066227, 5.391395, 1, 0, 0, 1, 1,
0.6987477, -0.2803034, 2.096231, 1, 0, 0, 1, 1,
0.6990966, -0.7424479, 1.37004, 1, 0, 0, 1, 1,
0.6991907, -0.2902245, 2.602277, 1, 0, 0, 1, 1,
0.7104229, -1.626582, 1.834219, 0, 0, 0, 1, 1,
0.7148665, -1.121741, 1.057841, 0, 0, 0, 1, 1,
0.7152906, -0.2740185, 1.893656, 0, 0, 0, 1, 1,
0.7162589, -0.429302, 1.682606, 0, 0, 0, 1, 1,
0.7176794, 1.260402, -0.4665026, 0, 0, 0, 1, 1,
0.7218506, -0.3960173, 1.397938, 0, 0, 0, 1, 1,
0.7227818, -0.1604642, 0.9724764, 0, 0, 0, 1, 1,
0.7279562, -0.7774999, 1.538392, 1, 1, 1, 1, 1,
0.7423981, 1.509309, 0.5261803, 1, 1, 1, 1, 1,
0.7511716, -2.015901, 0.3484542, 1, 1, 1, 1, 1,
0.7547145, 0.473214, -0.1878509, 1, 1, 1, 1, 1,
0.7563698, 1.176328, 1.66397, 1, 1, 1, 1, 1,
0.7590849, -0.5640936, 2.523605, 1, 1, 1, 1, 1,
0.7597966, -0.4300874, 1.928087, 1, 1, 1, 1, 1,
0.7640695, 3.520091, 0.6528456, 1, 1, 1, 1, 1,
0.7680808, 0.2830687, 0.2891662, 1, 1, 1, 1, 1,
0.7694309, 1.88252, 1.209266, 1, 1, 1, 1, 1,
0.7745031, -1.54669, 1.541797, 1, 1, 1, 1, 1,
0.783161, -2.274205, 3.255823, 1, 1, 1, 1, 1,
0.7893878, 1.100097, 0.1162676, 1, 1, 1, 1, 1,
0.7906991, 0.0147963, 1.315315, 1, 1, 1, 1, 1,
0.7910115, -0.9244232, 3.058949, 1, 1, 1, 1, 1,
0.7964813, -1.888143, 2.238319, 0, 0, 1, 1, 1,
0.7971886, -0.07493241, 2.012118, 1, 0, 0, 1, 1,
0.8029443, -0.5922187, 1.505526, 1, 0, 0, 1, 1,
0.8084416, -0.6755965, 1.506882, 1, 0, 0, 1, 1,
0.8105748, -0.2170449, 0.4007551, 1, 0, 0, 1, 1,
0.821826, -1.030237, 2.851938, 1, 0, 0, 1, 1,
0.8325924, 1.604229, 1.381458, 0, 0, 0, 1, 1,
0.8344928, -1.090663, 2.264203, 0, 0, 0, 1, 1,
0.8403698, -0.7465395, 2.720173, 0, 0, 0, 1, 1,
0.8474466, -0.005640844, -0.7787406, 0, 0, 0, 1, 1,
0.849385, -1.68109, 3.513944, 0, 0, 0, 1, 1,
0.8595608, 1.399704, 1.775507, 0, 0, 0, 1, 1,
0.8615001, 0.3125887, 0.412647, 0, 0, 0, 1, 1,
0.8621516, 0.7997024, 0.1573486, 1, 1, 1, 1, 1,
0.8694023, 1.332833, 0.9799855, 1, 1, 1, 1, 1,
0.8700183, 0.5813798, 0.8323901, 1, 1, 1, 1, 1,
0.8757217, 0.7498366, -0.9031487, 1, 1, 1, 1, 1,
0.8780132, 0.1188567, 0.3342273, 1, 1, 1, 1, 1,
0.8799678, -1.070206, 1.479802, 1, 1, 1, 1, 1,
0.8805275, -0.3585876, 2.032301, 1, 1, 1, 1, 1,
0.8937752, -1.413841, 2.332039, 1, 1, 1, 1, 1,
0.8951772, 0.2219188, 0.02002243, 1, 1, 1, 1, 1,
0.8973936, 0.636305, -0.1512963, 1, 1, 1, 1, 1,
0.8993663, -1.0384, 1.716239, 1, 1, 1, 1, 1,
0.9003974, -1.587038, 3.00001, 1, 1, 1, 1, 1,
0.9013254, -0.6938061, 3.822285, 1, 1, 1, 1, 1,
0.9018254, -1.040218, 2.941385, 1, 1, 1, 1, 1,
0.9078643, 1.519957, 0.5771103, 1, 1, 1, 1, 1,
0.9183659, -0.449922, 3.426697, 0, 0, 1, 1, 1,
0.9227412, 1.34067, 1.579699, 1, 0, 0, 1, 1,
0.9274933, 0.8522404, 0.9954929, 1, 0, 0, 1, 1,
0.9309908, 1.002999, 3.434735, 1, 0, 0, 1, 1,
0.9321479, -0.9146603, 3.293291, 1, 0, 0, 1, 1,
0.9357339, 0.4462942, -0.3188219, 1, 0, 0, 1, 1,
0.9359939, 1.412582, 0.5342512, 0, 0, 0, 1, 1,
0.93818, -0.1766078, 2.518876, 0, 0, 0, 1, 1,
0.9465889, 0.9153406, 1.80941, 0, 0, 0, 1, 1,
0.9519025, 1.048244, 0.9272, 0, 0, 0, 1, 1,
0.9534268, -1.529609, -0.2399165, 0, 0, 0, 1, 1,
0.9546952, -0.06900459, 1.372937, 0, 0, 0, 1, 1,
0.9570348, -0.5574613, 1.88089, 0, 0, 0, 1, 1,
0.9611857, -0.2093896, 1.058456, 1, 1, 1, 1, 1,
0.9671098, -1.112355, 0.3099169, 1, 1, 1, 1, 1,
0.9706641, 1.138418, 0.01380481, 1, 1, 1, 1, 1,
0.9717401, 1.536899, -0.7990717, 1, 1, 1, 1, 1,
0.973471, -0.3620922, 1.667501, 1, 1, 1, 1, 1,
0.9753993, -2.158001, 2.664117, 1, 1, 1, 1, 1,
0.9798786, 0.4621946, 1.369659, 1, 1, 1, 1, 1,
0.9843968, 0.4399889, 0.2905719, 1, 1, 1, 1, 1,
0.9910795, 1.707331, 0.8728105, 1, 1, 1, 1, 1,
0.9938799, -0.6514015, 1.420503, 1, 1, 1, 1, 1,
0.9942632, 0.1880215, 2.257922, 1, 1, 1, 1, 1,
0.9990125, 0.05225874, 1.162915, 1, 1, 1, 1, 1,
0.9991216, -0.4865153, 1.969131, 1, 1, 1, 1, 1,
1.00077, -0.313518, 0.9615726, 1, 1, 1, 1, 1,
1.000856, -0.9658995, 2.226972, 1, 1, 1, 1, 1,
1.014747, 0.1955623, 0.4172134, 0, 0, 1, 1, 1,
1.015765, 0.4333513, 1.136958, 1, 0, 0, 1, 1,
1.02488, 0.8585608, 0.1541315, 1, 0, 0, 1, 1,
1.033887, 0.5040219, 0.467953, 1, 0, 0, 1, 1,
1.036207, 2.378606, 2.323338, 1, 0, 0, 1, 1,
1.037028, -0.9289299, 4.691911, 1, 0, 0, 1, 1,
1.047389, -1.648581, 0.7351055, 0, 0, 0, 1, 1,
1.048608, -0.3949078, 2.071521, 0, 0, 0, 1, 1,
1.059873, -0.1946372, 1.5542, 0, 0, 0, 1, 1,
1.084691, 0.2864702, 1.661235, 0, 0, 0, 1, 1,
1.095129, 1.658219, 1.701037, 0, 0, 0, 1, 1,
1.0978, -0.4645292, 2.438137, 0, 0, 0, 1, 1,
1.098273, -0.5402722, 2.383162, 0, 0, 0, 1, 1,
1.099015, -0.555185, 1.570062, 1, 1, 1, 1, 1,
1.122954, 0.4630988, 1.064292, 1, 1, 1, 1, 1,
1.13242, -1.875001, 1.425191, 1, 1, 1, 1, 1,
1.133304, 0.09063996, 2.368308, 1, 1, 1, 1, 1,
1.134871, 0.720892, 0.6167458, 1, 1, 1, 1, 1,
1.134919, -2.084939, 2.863242, 1, 1, 1, 1, 1,
1.135964, -0.1775565, 1.541558, 1, 1, 1, 1, 1,
1.139034, 1.451107, 0.5097107, 1, 1, 1, 1, 1,
1.142673, 0.3905517, 0.094539, 1, 1, 1, 1, 1,
1.142941, 0.4483498, -0.1964687, 1, 1, 1, 1, 1,
1.147938, 2.543224, 0.3550194, 1, 1, 1, 1, 1,
1.149123, -2.279272, 2.9392, 1, 1, 1, 1, 1,
1.155829, -0.04174696, 2.473589, 1, 1, 1, 1, 1,
1.158852, -1.880479, 1.879588, 1, 1, 1, 1, 1,
1.161339, -0.01640807, 1.108869, 1, 1, 1, 1, 1,
1.164645, -1.611074, 2.758808, 0, 0, 1, 1, 1,
1.175126, 1.020785, 2.019514, 1, 0, 0, 1, 1,
1.181282, 0.4790201, -0.6964853, 1, 0, 0, 1, 1,
1.193554, -0.2494195, 0.1569517, 1, 0, 0, 1, 1,
1.194012, -1.403306, 1.960235, 1, 0, 0, 1, 1,
1.202564, -0.9655933, 0.5352936, 1, 0, 0, 1, 1,
1.204876, -0.7172384, 1.290943, 0, 0, 0, 1, 1,
1.207132, 0.670441, 1.723802, 0, 0, 0, 1, 1,
1.210183, -0.7604193, 0.2183909, 0, 0, 0, 1, 1,
1.224286, -1.058476, 3.08803, 0, 0, 0, 1, 1,
1.228609, -1.382291, 3.925746, 0, 0, 0, 1, 1,
1.228834, 0.6575071, 1.196229, 0, 0, 0, 1, 1,
1.234136, -0.661146, 3.496967, 0, 0, 0, 1, 1,
1.240559, -0.4434816, 1.946106, 1, 1, 1, 1, 1,
1.251065, -0.3528077, 2.150269, 1, 1, 1, 1, 1,
1.253101, 0.6212204, 1.133572, 1, 1, 1, 1, 1,
1.257951, 0.7682242, -0.593347, 1, 1, 1, 1, 1,
1.258116, -2.368176, 3.058772, 1, 1, 1, 1, 1,
1.27442, -1.103677, 3.923753, 1, 1, 1, 1, 1,
1.282662, -0.2293454, 1.598363, 1, 1, 1, 1, 1,
1.285249, -0.7602212, 1.070762, 1, 1, 1, 1, 1,
1.294088, -0.8479199, 1.98182, 1, 1, 1, 1, 1,
1.303475, 1.135698, 0.01903603, 1, 1, 1, 1, 1,
1.303527, -0.06326196, 1.670993, 1, 1, 1, 1, 1,
1.32771, -0.4527424, 2.272296, 1, 1, 1, 1, 1,
1.328249, -0.7677187, 1.098452, 1, 1, 1, 1, 1,
1.330089, -0.3740321, 3.217311, 1, 1, 1, 1, 1,
1.338255, 0.7948078, 0.7215104, 1, 1, 1, 1, 1,
1.338394, -0.5264664, 2.088592, 0, 0, 1, 1, 1,
1.339369, -1.096716, 2.693063, 1, 0, 0, 1, 1,
1.345807, 1.161488, 1.426459, 1, 0, 0, 1, 1,
1.348463, -1.824844, 2.427648, 1, 0, 0, 1, 1,
1.366223, 0.5585855, 0.7410232, 1, 0, 0, 1, 1,
1.37057, 1.580149, 0.8432803, 1, 0, 0, 1, 1,
1.37155, -1.137027, 2.212364, 0, 0, 0, 1, 1,
1.372025, 1.217984, 0.6474138, 0, 0, 0, 1, 1,
1.390293, 1.203729, 0.3577792, 0, 0, 0, 1, 1,
1.394619, -1.423327, 2.371694, 0, 0, 0, 1, 1,
1.403841, 1.137322, 1.768653, 0, 0, 0, 1, 1,
1.404063, 0.8440295, -0.3501911, 0, 0, 0, 1, 1,
1.407354, -0.797025, 1.254011, 0, 0, 0, 1, 1,
1.411946, -2.033742, 2.795694, 1, 1, 1, 1, 1,
1.413775, 0.5026501, 1.341554, 1, 1, 1, 1, 1,
1.41823, 0.3818894, 2.125988, 1, 1, 1, 1, 1,
1.421812, -0.6328231, 2.600357, 1, 1, 1, 1, 1,
1.422005, 0.5811011, -1.321009, 1, 1, 1, 1, 1,
1.450649, -1.1889, 2.783948, 1, 1, 1, 1, 1,
1.458446, -1.811257, 2.644498, 1, 1, 1, 1, 1,
1.461168, 0.1687791, 1.16529, 1, 1, 1, 1, 1,
1.469645, -0.906293, 3.702178, 1, 1, 1, 1, 1,
1.475613, 0.3713912, 2.449443, 1, 1, 1, 1, 1,
1.475785, -0.81945, 0.7524287, 1, 1, 1, 1, 1,
1.486673, 0.7235122, 1.141569, 1, 1, 1, 1, 1,
1.491766, 0.167521, 2.616812, 1, 1, 1, 1, 1,
1.495333, -1.704996, 5.545112, 1, 1, 1, 1, 1,
1.495829, -0.3112201, 1.722343, 1, 1, 1, 1, 1,
1.503521, -0.05315581, 1.043275, 0, 0, 1, 1, 1,
1.505409, -0.6852653, -0.3210297, 1, 0, 0, 1, 1,
1.512479, 0.4665501, 0.6102994, 1, 0, 0, 1, 1,
1.52819, -1.173712, 1.711298, 1, 0, 0, 1, 1,
1.531663, -0.6109008, 2.534992, 1, 0, 0, 1, 1,
1.540215, -1.003645, 3.610796, 1, 0, 0, 1, 1,
1.559729, 0.901143, 1.344685, 0, 0, 0, 1, 1,
1.562165, 0.3788025, 3.068172, 0, 0, 0, 1, 1,
1.564285, 1.613116, -0.9584365, 0, 0, 0, 1, 1,
1.572179, 0.3601284, 0.3248038, 0, 0, 0, 1, 1,
1.577172, -1.316606, 2.248069, 0, 0, 0, 1, 1,
1.596073, 0.6084179, 3.492761, 0, 0, 0, 1, 1,
1.602391, 0.7912912, -0.7991138, 0, 0, 0, 1, 1,
1.602913, -2.138207, 3.715404, 1, 1, 1, 1, 1,
1.607279, 0.02511079, 3.168151, 1, 1, 1, 1, 1,
1.607992, 0.9167242, 0.5691619, 1, 1, 1, 1, 1,
1.616704, 0.449793, 3.267396, 1, 1, 1, 1, 1,
1.640083, -0.1669963, 0.825926, 1, 1, 1, 1, 1,
1.644483, -0.1286312, 1.303389, 1, 1, 1, 1, 1,
1.650806, 1.020334, -0.3401429, 1, 1, 1, 1, 1,
1.654848, 0.8272035, 1.47477, 1, 1, 1, 1, 1,
1.679093, -0.1822373, 2.833873, 1, 1, 1, 1, 1,
1.696156, -0.4730872, 1.352243, 1, 1, 1, 1, 1,
1.696273, -0.73615, 2.270777, 1, 1, 1, 1, 1,
1.702223, -0.8612353, 2.685228, 1, 1, 1, 1, 1,
1.721623, 1.482834, 0.6451079, 1, 1, 1, 1, 1,
1.724959, 2.686342, 0.8200631, 1, 1, 1, 1, 1,
1.731308, -0.2529685, 0.8387634, 1, 1, 1, 1, 1,
1.742445, 0.03601136, 1.571381, 0, 0, 1, 1, 1,
1.752975, -0.8279207, 1.575725, 1, 0, 0, 1, 1,
1.753809, -0.8151628, 0.9724082, 1, 0, 0, 1, 1,
1.75479, -0.1349455, 3.059246, 1, 0, 0, 1, 1,
1.772891, -2.438751, 2.766786, 1, 0, 0, 1, 1,
1.775354, -0.1717179, 1.553217, 1, 0, 0, 1, 1,
1.786144, -0.347102, 2.272445, 0, 0, 0, 1, 1,
1.824148, -0.4751975, 2.168322, 0, 0, 0, 1, 1,
1.830625, 2.073498, 0.681278, 0, 0, 0, 1, 1,
1.834623, 0.3892241, 1.765716, 0, 0, 0, 1, 1,
1.839162, -1.570656, 1.747286, 0, 0, 0, 1, 1,
1.878483, 1.844657, 1.190957, 0, 0, 0, 1, 1,
1.892104, 0.7595538, -0.3393735, 0, 0, 0, 1, 1,
1.923881, -0.1602762, 3.597133, 1, 1, 1, 1, 1,
1.925097, -1.484574, 3.204874, 1, 1, 1, 1, 1,
1.929877, -0.736023, 3.588142, 1, 1, 1, 1, 1,
1.930877, 0.5498845, 0.3243736, 1, 1, 1, 1, 1,
1.937212, 0.9805874, 0.3339441, 1, 1, 1, 1, 1,
1.981743, 1.129773, -0.2473543, 1, 1, 1, 1, 1,
1.989663, 0.7661276, 1.726404, 1, 1, 1, 1, 1,
2.006279, -0.05103358, 1.928058, 1, 1, 1, 1, 1,
2.026413, 1.006306, 1.525055, 1, 1, 1, 1, 1,
2.044926, 0.01840634, -0.03532243, 1, 1, 1, 1, 1,
2.056871, 1.450018, 2.418942, 1, 1, 1, 1, 1,
2.069618, -0.3300407, 2.372085, 1, 1, 1, 1, 1,
2.073936, -0.7432751, 1.336971, 1, 1, 1, 1, 1,
2.106897, 0.6222393, 0.3745743, 1, 1, 1, 1, 1,
2.110424, -0.5650759, -0.2515581, 1, 1, 1, 1, 1,
2.111585, 0.3885121, 2.709852, 0, 0, 1, 1, 1,
2.117496, -0.4488662, 1.635128, 1, 0, 0, 1, 1,
2.120042, -0.1772719, -0.5739092, 1, 0, 0, 1, 1,
2.131301, 1.289656, 0.2884088, 1, 0, 0, 1, 1,
2.135334, 0.852677, -1.3324, 1, 0, 0, 1, 1,
2.156226, -0.3533493, 1.240667, 1, 0, 0, 1, 1,
2.1657, -0.5755104, 2.589796, 0, 0, 0, 1, 1,
2.175853, -0.8018753, 1.147525, 0, 0, 0, 1, 1,
2.184051, 1.652604, 0.634777, 0, 0, 0, 1, 1,
2.231427, -0.1168772, 2.644703, 0, 0, 0, 1, 1,
2.257739, 0.6898954, 0.8214145, 0, 0, 0, 1, 1,
2.262497, -0.4783747, 0.5204933, 0, 0, 0, 1, 1,
2.30492, 0.3465393, 1.373794, 0, 0, 0, 1, 1,
2.307038, 0.07211303, 1.978301, 1, 1, 1, 1, 1,
2.313484, -0.706378, 2.855575, 1, 1, 1, 1, 1,
2.376078, -1.968089, 3.649947, 1, 1, 1, 1, 1,
2.528723, -0.3028245, 2.140715, 1, 1, 1, 1, 1,
2.782868, 0.4716482, 2.174333, 1, 1, 1, 1, 1,
3.078278, 1.237423, 0.8257892, 1, 1, 1, 1, 1,
3.241134, -0.4973453, 1.719886, 1, 1, 1, 1, 1
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
var radius = 10.06672;
var distance = 35.35892;
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
mvMatrix.translate( -0.09309268, -0.08203053, 0.2994828 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.35892);
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