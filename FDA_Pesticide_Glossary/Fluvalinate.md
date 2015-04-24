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
-3.575299, 0.2861582, -1.923395, 1, 0, 0, 1,
-3.528357, -1.01488, -2.542564, 1, 0.007843138, 0, 1,
-3.044976, 0.072609, -1.302093, 1, 0.01176471, 0, 1,
-2.677364, -1.135096, 0.03821829, 1, 0.01960784, 0, 1,
-2.572074, -0.4694211, -1.934112, 1, 0.02352941, 0, 1,
-2.551747, -0.545755, -0.8682805, 1, 0.03137255, 0, 1,
-2.427349, 0.0604249, -1.537829, 1, 0.03529412, 0, 1,
-2.386533, 1.525978, -1.070989, 1, 0.04313726, 0, 1,
-2.376228, -0.528544, -0.6958951, 1, 0.04705882, 0, 1,
-2.371091, 0.2098713, -3.014203, 1, 0.05490196, 0, 1,
-2.321813, 0.3927361, -1.283637, 1, 0.05882353, 0, 1,
-2.234346, -0.3126519, -2.52585, 1, 0.06666667, 0, 1,
-2.151724, -0.4721597, -2.473922, 1, 0.07058824, 0, 1,
-2.140447, 0.8325675, 0.501014, 1, 0.07843138, 0, 1,
-2.085793, -0.05300535, -0.8505134, 1, 0.08235294, 0, 1,
-2.070407, -0.2640774, -1.863387, 1, 0.09019608, 0, 1,
-2.015143, 1.375454, -0.9088783, 1, 0.09411765, 0, 1,
-2.003557, 0.7160015, -0.04355957, 1, 0.1019608, 0, 1,
-1.992225, -1.739407, -2.928871, 1, 0.1098039, 0, 1,
-1.951758, 0.1016621, -2.923649, 1, 0.1137255, 0, 1,
-1.898508, 0.6542242, -1.94191, 1, 0.1215686, 0, 1,
-1.889082, -0.1848243, -1.304392, 1, 0.1254902, 0, 1,
-1.848594, -1.270153, -1.56387, 1, 0.1333333, 0, 1,
-1.844986, 1.536245, -2.689615, 1, 0.1372549, 0, 1,
-1.835781, 0.5747664, -0.7173313, 1, 0.145098, 0, 1,
-1.810314, 0.4298999, 0.2860089, 1, 0.1490196, 0, 1,
-1.80394, -0.9708998, -2.803368, 1, 0.1568628, 0, 1,
-1.757867, 0.3816446, -1.648381, 1, 0.1607843, 0, 1,
-1.732507, -1.478155, -1.822971, 1, 0.1686275, 0, 1,
-1.725462, 2.946291, 0.6330949, 1, 0.172549, 0, 1,
-1.713023, -0.4009127, 0.4313309, 1, 0.1803922, 0, 1,
-1.703268, 2.531916, -0.7488163, 1, 0.1843137, 0, 1,
-1.692771, -0.3472143, -2.997319, 1, 0.1921569, 0, 1,
-1.692676, -0.1367016, -1.632356, 1, 0.1960784, 0, 1,
-1.692096, -0.5360158, -2.320756, 1, 0.2039216, 0, 1,
-1.683292, -0.1427618, -3.323039, 1, 0.2117647, 0, 1,
-1.679965, -0.3920755, -2.731383, 1, 0.2156863, 0, 1,
-1.674164, 0.7482529, -0.9408972, 1, 0.2235294, 0, 1,
-1.669598, -0.9353119, -1.688925, 1, 0.227451, 0, 1,
-1.661597, 0.4324663, -1.592108, 1, 0.2352941, 0, 1,
-1.650829, -0.4090104, -1.366786, 1, 0.2392157, 0, 1,
-1.647162, -2.27345, -2.703168, 1, 0.2470588, 0, 1,
-1.644231, 0.6148037, -0.2791986, 1, 0.2509804, 0, 1,
-1.632836, 0.9089051, -1.118555, 1, 0.2588235, 0, 1,
-1.573726, -0.7484219, -2.193883, 1, 0.2627451, 0, 1,
-1.572193, -1.261694, -3.055339, 1, 0.2705882, 0, 1,
-1.569126, 0.2438988, -1.569089, 1, 0.2745098, 0, 1,
-1.566383, 0.2074939, -1.390008, 1, 0.282353, 0, 1,
-1.55811, -0.6912528, -0.7367941, 1, 0.2862745, 0, 1,
-1.555685, -1.534255, -1.762432, 1, 0.2941177, 0, 1,
-1.55211, -2.459252, -2.933888, 1, 0.3019608, 0, 1,
-1.53955, 0.316246, -2.208933, 1, 0.3058824, 0, 1,
-1.532845, 0.3787336, -0.2818363, 1, 0.3137255, 0, 1,
-1.531852, -0.02153667, -2.292621, 1, 0.3176471, 0, 1,
-1.528065, -0.1415175, -1.283905, 1, 0.3254902, 0, 1,
-1.525817, -0.5534664, -1.736617, 1, 0.3294118, 0, 1,
-1.4984, -0.5379916, -0.8036192, 1, 0.3372549, 0, 1,
-1.48587, 0.9365851, -2.196697, 1, 0.3411765, 0, 1,
-1.474261, 0.03785175, -2.118201, 1, 0.3490196, 0, 1,
-1.472239, -0.06286433, -2.100145, 1, 0.3529412, 0, 1,
-1.462073, 0.3357807, -1.28785, 1, 0.3607843, 0, 1,
-1.454923, -0.5804394, -3.527727, 1, 0.3647059, 0, 1,
-1.448765, -0.8959209, -2.367784, 1, 0.372549, 0, 1,
-1.444294, 0.6992484, -0.4054018, 1, 0.3764706, 0, 1,
-1.438984, -1.102217, -2.918775, 1, 0.3843137, 0, 1,
-1.437252, 0.154628, -0.3240688, 1, 0.3882353, 0, 1,
-1.436641, 0.1393985, -1.55834, 1, 0.3960784, 0, 1,
-1.43161, -0.600939, -2.824646, 1, 0.4039216, 0, 1,
-1.430743, 2.208732, -1.426777, 1, 0.4078431, 0, 1,
-1.42714, 1.141821, -1.027288, 1, 0.4156863, 0, 1,
-1.42649, 0.3999202, 0.2496751, 1, 0.4196078, 0, 1,
-1.417357, -1.772669, -1.792925, 1, 0.427451, 0, 1,
-1.414528, 0.07622556, -0.8576342, 1, 0.4313726, 0, 1,
-1.410943, 0.1145045, -0.1492747, 1, 0.4392157, 0, 1,
-1.400641, 0.4268699, 0.648499, 1, 0.4431373, 0, 1,
-1.395439, -1.044525, -0.08474661, 1, 0.4509804, 0, 1,
-1.392349, 0.2922372, -1.973218, 1, 0.454902, 0, 1,
-1.371196, -0.3257199, -0.8220565, 1, 0.4627451, 0, 1,
-1.370488, 0.9596749, 0.2839528, 1, 0.4666667, 0, 1,
-1.364845, 0.4195519, 0.005109257, 1, 0.4745098, 0, 1,
-1.35395, 1.829461, -0.1207883, 1, 0.4784314, 0, 1,
-1.348981, 1.904751, -2.164346, 1, 0.4862745, 0, 1,
-1.346655, -0.1345897, -3.301027, 1, 0.4901961, 0, 1,
-1.334657, -0.6521635, -2.895221, 1, 0.4980392, 0, 1,
-1.333813, 0.4810551, -0.4731689, 1, 0.5058824, 0, 1,
-1.327056, -0.3685995, -1.562056, 1, 0.509804, 0, 1,
-1.317696, 0.3359023, -1.693352, 1, 0.5176471, 0, 1,
-1.310391, -1.268436, -2.730487, 1, 0.5215687, 0, 1,
-1.307685, 0.3078461, 0.9706928, 1, 0.5294118, 0, 1,
-1.305854, 0.02029492, -1.393972, 1, 0.5333334, 0, 1,
-1.300304, 2.134869, -0.2906669, 1, 0.5411765, 0, 1,
-1.295247, -0.5899817, -2.058099, 1, 0.5450981, 0, 1,
-1.293817, -1.0952, -1.667041, 1, 0.5529412, 0, 1,
-1.27719, 0.5132328, -1.38512, 1, 0.5568628, 0, 1,
-1.272226, 0.9936235, -1.434194, 1, 0.5647059, 0, 1,
-1.271541, -0.5803298, -3.245239, 1, 0.5686275, 0, 1,
-1.260368, 1.469209, 0.7586575, 1, 0.5764706, 0, 1,
-1.253808, 0.3902802, -2.321045, 1, 0.5803922, 0, 1,
-1.248151, 0.2260017, -1.454792, 1, 0.5882353, 0, 1,
-1.233611, 0.2123763, -0.2226779, 1, 0.5921569, 0, 1,
-1.232662, -0.3639048, -1.566522, 1, 0.6, 0, 1,
-1.229217, -0.5444307, -4.558491, 1, 0.6078432, 0, 1,
-1.216923, -1.559273, -3.237463, 1, 0.6117647, 0, 1,
-1.215535, -0.5761894, -2.677024, 1, 0.6196079, 0, 1,
-1.198899, -0.02657643, -0.03355807, 1, 0.6235294, 0, 1,
-1.185917, -0.8486915, -1.557753, 1, 0.6313726, 0, 1,
-1.185711, 0.3501843, -1.752499, 1, 0.6352941, 0, 1,
-1.182589, -0.2041737, -2.113504, 1, 0.6431373, 0, 1,
-1.180306, 0.06782679, -1.164382, 1, 0.6470588, 0, 1,
-1.178512, -0.3682784, -2.574383, 1, 0.654902, 0, 1,
-1.167784, -1.538359, -3.527128, 1, 0.6588235, 0, 1,
-1.161687, 0.1937087, -1.831901, 1, 0.6666667, 0, 1,
-1.161319, 0.1017671, -3.776759, 1, 0.6705883, 0, 1,
-1.15325, 0.39107, -0.8721674, 1, 0.6784314, 0, 1,
-1.151763, 0.1270631, -1.052707, 1, 0.682353, 0, 1,
-1.147051, 0.7093733, -2.256183, 1, 0.6901961, 0, 1,
-1.139164, 0.3735631, -0.9868889, 1, 0.6941177, 0, 1,
-1.138007, -1.87227, -2.207047, 1, 0.7019608, 0, 1,
-1.13419, -0.2876448, -0.7494087, 1, 0.7098039, 0, 1,
-1.129827, -0.5953303, -1.110031, 1, 0.7137255, 0, 1,
-1.126378, 0.3964748, -1.675434, 1, 0.7215686, 0, 1,
-1.120855, 0.4232255, -0.5902941, 1, 0.7254902, 0, 1,
-1.115587, -1.235892, -4.450432, 1, 0.7333333, 0, 1,
-1.110655, 0.2884325, -0.4760414, 1, 0.7372549, 0, 1,
-1.10454, -0.9913599, -0.7686336, 1, 0.7450981, 0, 1,
-1.095192, 0.1396125, -3.376505, 1, 0.7490196, 0, 1,
-1.09051, -1.036495, -2.908194, 1, 0.7568628, 0, 1,
-1.087876, -0.5552173, -2.620949, 1, 0.7607843, 0, 1,
-1.08712, -2.58133, -2.667195, 1, 0.7686275, 0, 1,
-1.086064, 1.927116, -0.04398317, 1, 0.772549, 0, 1,
-1.085326, -0.2117146, -2.880115, 1, 0.7803922, 0, 1,
-1.075626, 0.2450705, -1.478129, 1, 0.7843137, 0, 1,
-1.069177, 0.1123975, -1.660817, 1, 0.7921569, 0, 1,
-1.0587, 1.12172, -0.6275136, 1, 0.7960784, 0, 1,
-1.046964, -0.2449185, -1.45487, 1, 0.8039216, 0, 1,
-1.04334, 0.06432055, -0.9212484, 1, 0.8117647, 0, 1,
-1.041329, 0.3941683, -1.552872, 1, 0.8156863, 0, 1,
-1.039263, 0.03060405, -1.063755, 1, 0.8235294, 0, 1,
-1.03868, -0.05425619, -1.230767, 1, 0.827451, 0, 1,
-1.035881, -1.501147, -3.068983, 1, 0.8352941, 0, 1,
-1.035162, 0.7164066, -0.4007939, 1, 0.8392157, 0, 1,
-1.033573, 1.551624, -2.58119, 1, 0.8470588, 0, 1,
-1.029388, 0.6647765, 0.5447187, 1, 0.8509804, 0, 1,
-1.026458, -1.112741, -0.9881309, 1, 0.8588235, 0, 1,
-1.024427, 0.1622283, -2.800498, 1, 0.8627451, 0, 1,
-1.019875, -0.3381219, -4.042308, 1, 0.8705882, 0, 1,
-1.018869, -3.736656, -1.400331, 1, 0.8745098, 0, 1,
-1.018672, -1.333948, -3.458096, 1, 0.8823529, 0, 1,
-1.018645, 1.360138, -1.837061, 1, 0.8862745, 0, 1,
-1.017847, -0.460512, -3.166009, 1, 0.8941177, 0, 1,
-1.003886, -1.202745, -3.146664, 1, 0.8980392, 0, 1,
-0.999413, 1.22002, -0.2462487, 1, 0.9058824, 0, 1,
-0.9979073, -0.05103243, -3.570179, 1, 0.9137255, 0, 1,
-0.9967811, -0.7088189, -2.116079, 1, 0.9176471, 0, 1,
-0.9937873, 0.6390419, -3.696878, 1, 0.9254902, 0, 1,
-0.9913414, 1.597156, -0.7269163, 1, 0.9294118, 0, 1,
-0.9884743, -0.1125316, -2.721292, 1, 0.9372549, 0, 1,
-0.9824067, -0.7151639, -3.118818, 1, 0.9411765, 0, 1,
-0.9821491, -0.2283596, -1.270719, 1, 0.9490196, 0, 1,
-0.9777122, -1.170279, -3.283526, 1, 0.9529412, 0, 1,
-0.9663442, 0.1394272, 0.2578015, 1, 0.9607843, 0, 1,
-0.9640546, -1.289077, -0.92011, 1, 0.9647059, 0, 1,
-0.9632487, 0.8588688, -2.187406, 1, 0.972549, 0, 1,
-0.9631996, 0.008875459, -0.646853, 1, 0.9764706, 0, 1,
-0.9621291, -1.618681, -2.230928, 1, 0.9843137, 0, 1,
-0.9603191, 2.304803, -2.414661, 1, 0.9882353, 0, 1,
-0.9483432, -1.911161, -2.645399, 1, 0.9960784, 0, 1,
-0.9477041, 0.1864781, 0.7370161, 0.9960784, 1, 0, 1,
-0.9451458, 1.72188, 0.4437507, 0.9921569, 1, 0, 1,
-0.9440026, 0.3415209, -0.5081874, 0.9843137, 1, 0, 1,
-0.937473, 0.3651939, -2.495737, 0.9803922, 1, 0, 1,
-0.9366468, -1.645296, -3.264066, 0.972549, 1, 0, 1,
-0.9363393, 0.2054021, 1.14915, 0.9686275, 1, 0, 1,
-0.9349329, 0.5077451, -3.085323, 0.9607843, 1, 0, 1,
-0.9339101, 0.3098135, -1.301562, 0.9568627, 1, 0, 1,
-0.9259871, -2.103117, -2.775539, 0.9490196, 1, 0, 1,
-0.9214417, -1.706919, -2.831708, 0.945098, 1, 0, 1,
-0.9197156, -3.532189, -3.937258, 0.9372549, 1, 0, 1,
-0.9183719, 0.969802, -1.760847, 0.9333333, 1, 0, 1,
-0.9143756, 2.638535, 1.190591, 0.9254902, 1, 0, 1,
-0.9122842, 0.1591173, -1.670019, 0.9215686, 1, 0, 1,
-0.9009428, 0.5300829, -0.5795255, 0.9137255, 1, 0, 1,
-0.8877336, 0.4385739, -1.570416, 0.9098039, 1, 0, 1,
-0.887338, 1.443101, -0.09728077, 0.9019608, 1, 0, 1,
-0.8752426, 0.4505821, -1.081845, 0.8941177, 1, 0, 1,
-0.8722691, -0.01808502, -0.7218927, 0.8901961, 1, 0, 1,
-0.8712282, 0.5327162, -2.995098, 0.8823529, 1, 0, 1,
-0.8695391, 0.9540678, 0.2914447, 0.8784314, 1, 0, 1,
-0.8693727, 0.1190045, -2.179013, 0.8705882, 1, 0, 1,
-0.8691546, -0.8925022, -1.986908, 0.8666667, 1, 0, 1,
-0.8617523, -0.1724901, -3.477145, 0.8588235, 1, 0, 1,
-0.8558042, 0.5623668, -1.186882, 0.854902, 1, 0, 1,
-0.8522491, 2.246069, -2.109664, 0.8470588, 1, 0, 1,
-0.8469467, 1.525384, -0.2203415, 0.8431373, 1, 0, 1,
-0.8414996, 0.8607431, -0.4422617, 0.8352941, 1, 0, 1,
-0.8407432, -0.2127623, -1.559278, 0.8313726, 1, 0, 1,
-0.8402745, -1.673567, -3.234088, 0.8235294, 1, 0, 1,
-0.8396243, -0.1550633, -2.07961, 0.8196079, 1, 0, 1,
-0.8338303, 0.07172441, -1.069302, 0.8117647, 1, 0, 1,
-0.8281922, 1.689853, -1.85874, 0.8078431, 1, 0, 1,
-0.8230892, 0.4192522, -2.259027, 0.8, 1, 0, 1,
-0.8185143, 0.8434498, -2.025728, 0.7921569, 1, 0, 1,
-0.8169246, -0.3232138, -1.215449, 0.7882353, 1, 0, 1,
-0.8150558, 0.5306817, -0.7052482, 0.7803922, 1, 0, 1,
-0.8119981, -0.8822266, -1.748055, 0.7764706, 1, 0, 1,
-0.810779, -1.265689, -3.999412, 0.7686275, 1, 0, 1,
-0.8094898, -1.462854, -5.354679, 0.7647059, 1, 0, 1,
-0.8065255, -0.0494694, -2.132457, 0.7568628, 1, 0, 1,
-0.8061289, 1.026651, -1.250212, 0.7529412, 1, 0, 1,
-0.8053843, -0.5112786, -1.72525, 0.7450981, 1, 0, 1,
-0.8008083, 0.2916004, -0.5178688, 0.7411765, 1, 0, 1,
-0.7967751, -0.5101075, -2.092128, 0.7333333, 1, 0, 1,
-0.7925378, 0.8884002, -0.1850015, 0.7294118, 1, 0, 1,
-0.7925035, -0.3810479, -2.417642, 0.7215686, 1, 0, 1,
-0.7918944, 1.291823, 0.4623795, 0.7176471, 1, 0, 1,
-0.7886304, 0.5056277, -1.335869, 0.7098039, 1, 0, 1,
-0.7852483, 0.884757, 0.5098464, 0.7058824, 1, 0, 1,
-0.7848014, -0.8500929, -2.986452, 0.6980392, 1, 0, 1,
-0.7803379, 0.7956156, -2.048376, 0.6901961, 1, 0, 1,
-0.7712873, -0.2753843, -1.112873, 0.6862745, 1, 0, 1,
-0.7699268, 0.2441454, -0.06308614, 0.6784314, 1, 0, 1,
-0.7668658, -0.2643653, -0.4033923, 0.6745098, 1, 0, 1,
-0.759205, 0.7332441, 0.05438412, 0.6666667, 1, 0, 1,
-0.7591266, 0.9649737, 0.6065778, 0.6627451, 1, 0, 1,
-0.7559957, -0.4055505, -3.132917, 0.654902, 1, 0, 1,
-0.7529211, -0.8258346, -2.956152, 0.6509804, 1, 0, 1,
-0.7527682, -1.067914, -3.109919, 0.6431373, 1, 0, 1,
-0.7513263, 0.1154613, -2.776981, 0.6392157, 1, 0, 1,
-0.7493452, -0.4646912, -2.939272, 0.6313726, 1, 0, 1,
-0.7461837, 0.2765374, -1.774279, 0.627451, 1, 0, 1,
-0.7434089, 1.506625, -0.2651085, 0.6196079, 1, 0, 1,
-0.7399282, -0.8490971, -1.335535, 0.6156863, 1, 0, 1,
-0.7372955, -0.1155912, -0.1675143, 0.6078432, 1, 0, 1,
-0.7359326, 0.7697828, -2.624941, 0.6039216, 1, 0, 1,
-0.732673, -1.046042, -2.09338, 0.5960785, 1, 0, 1,
-0.7320646, -1.848026, -2.439242, 0.5882353, 1, 0, 1,
-0.7266476, 0.5452761, 0.3750984, 0.5843138, 1, 0, 1,
-0.7138063, -2.048634, -2.992389, 0.5764706, 1, 0, 1,
-0.7126593, -0.5067338, -2.07895, 0.572549, 1, 0, 1,
-0.7047161, 0.4810501, 0.2305139, 0.5647059, 1, 0, 1,
-0.7032046, 1.236857, -0.2827436, 0.5607843, 1, 0, 1,
-0.7005072, -1.327945, -3.232529, 0.5529412, 1, 0, 1,
-0.6990622, -0.3474303, -1.811931, 0.5490196, 1, 0, 1,
-0.6945034, 0.1659008, -0.664961, 0.5411765, 1, 0, 1,
-0.6929094, 1.011467, -0.05022889, 0.5372549, 1, 0, 1,
-0.6921432, -0.4193339, -3.15465, 0.5294118, 1, 0, 1,
-0.6915946, 1.379176, -1.269682, 0.5254902, 1, 0, 1,
-0.6874752, 1.366481, -0.3396455, 0.5176471, 1, 0, 1,
-0.6840633, -1.102338, -1.710165, 0.5137255, 1, 0, 1,
-0.6695842, -1.169134, -2.682286, 0.5058824, 1, 0, 1,
-0.6641308, -0.4311683, -0.7278877, 0.5019608, 1, 0, 1,
-0.6571442, 0.2452838, -0.07136451, 0.4941176, 1, 0, 1,
-0.6569885, -0.9428043, -1.287382, 0.4862745, 1, 0, 1,
-0.6551567, 1.754477, -2.97616, 0.4823529, 1, 0, 1,
-0.6537799, 0.02047559, -1.278085, 0.4745098, 1, 0, 1,
-0.6508027, -1.308489, -1.780664, 0.4705882, 1, 0, 1,
-0.6504839, 1.672213, -0.9760132, 0.4627451, 1, 0, 1,
-0.6490348, -1.41261, -2.785664, 0.4588235, 1, 0, 1,
-0.6483496, -0.5435728, -3.38926, 0.4509804, 1, 0, 1,
-0.6471944, -1.002733, -4.689096, 0.4470588, 1, 0, 1,
-0.647018, -0.4838525, -1.838839, 0.4392157, 1, 0, 1,
-0.6459813, -0.8301978, -4.594403, 0.4352941, 1, 0, 1,
-0.6403582, -0.9275606, -1.649592, 0.427451, 1, 0, 1,
-0.6387665, 0.828824, -1.3539, 0.4235294, 1, 0, 1,
-0.6364409, 1.820167, -1.723406, 0.4156863, 1, 0, 1,
-0.6358051, -1.917592, -4.020576, 0.4117647, 1, 0, 1,
-0.6332515, 0.3389272, 0.1705491, 0.4039216, 1, 0, 1,
-0.629916, 1.965577, 0.1372529, 0.3960784, 1, 0, 1,
-0.6298574, -1.291026, -3.352411, 0.3921569, 1, 0, 1,
-0.6254649, -0.9736032, -1.799167, 0.3843137, 1, 0, 1,
-0.6251055, 0.01400881, -0.9350638, 0.3803922, 1, 0, 1,
-0.6215734, 2.638704, 0.115612, 0.372549, 1, 0, 1,
-0.6131107, 0.3840958, -1.444869, 0.3686275, 1, 0, 1,
-0.6114377, 0.8260849, -2.048947, 0.3607843, 1, 0, 1,
-0.607224, -1.135463, -3.766689, 0.3568628, 1, 0, 1,
-0.6048701, -0.1313071, -0.4573762, 0.3490196, 1, 0, 1,
-0.603313, 1.119199, -1.062671, 0.345098, 1, 0, 1,
-0.6010706, 0.393596, -1.036286, 0.3372549, 1, 0, 1,
-0.598455, -0.03743881, -1.690784, 0.3333333, 1, 0, 1,
-0.5980847, -0.2747068, -2.390976, 0.3254902, 1, 0, 1,
-0.5920516, 0.5391445, -0.3945805, 0.3215686, 1, 0, 1,
-0.591556, -0.6909744, -2.287029, 0.3137255, 1, 0, 1,
-0.5894011, 0.9199341, -2.192205, 0.3098039, 1, 0, 1,
-0.586049, -0.2340988, -1.26729, 0.3019608, 1, 0, 1,
-0.5853067, -0.2646623, -1.155691, 0.2941177, 1, 0, 1,
-0.5823714, 0.6962812, -2.903958, 0.2901961, 1, 0, 1,
-0.5819175, -1.481065, -2.018486, 0.282353, 1, 0, 1,
-0.5704721, -0.5831247, -1.127809, 0.2784314, 1, 0, 1,
-0.5656158, 1.407003, -0.7409405, 0.2705882, 1, 0, 1,
-0.5639619, 0.3889206, -2.790788, 0.2666667, 1, 0, 1,
-0.560477, -1.023191, -1.448556, 0.2588235, 1, 0, 1,
-0.5571148, 1.144705, -1.599125, 0.254902, 1, 0, 1,
-0.5543967, -1.153096, -2.456782, 0.2470588, 1, 0, 1,
-0.5512121, 0.7034624, -0.7018592, 0.2431373, 1, 0, 1,
-0.5466089, 0.07827616, -0.9520649, 0.2352941, 1, 0, 1,
-0.5446214, -0.5775282, -2.008514, 0.2313726, 1, 0, 1,
-0.5435943, 0.175734, -0.1284878, 0.2235294, 1, 0, 1,
-0.5431682, -3.125666, -3.798471, 0.2196078, 1, 0, 1,
-0.5337895, -0.6092722, -0.8777972, 0.2117647, 1, 0, 1,
-0.5312303, 0.1908952, -1.105437, 0.2078431, 1, 0, 1,
-0.52445, -0.1249635, -1.601391, 0.2, 1, 0, 1,
-0.5199625, -2.966327, -2.306073, 0.1921569, 1, 0, 1,
-0.5191919, -0.3105798, -3.448599, 0.1882353, 1, 0, 1,
-0.5158243, 0.5250911, 1.641043, 0.1803922, 1, 0, 1,
-0.5156084, 1.570774, 0.153794, 0.1764706, 1, 0, 1,
-0.5121528, 1.222315, 0.1513627, 0.1686275, 1, 0, 1,
-0.5098257, -2.017991, -2.432167, 0.1647059, 1, 0, 1,
-0.5089231, 1.266619, 0.02341183, 0.1568628, 1, 0, 1,
-0.504517, -1.251006, -2.278331, 0.1529412, 1, 0, 1,
-0.4991615, 0.3867211, -0.2163512, 0.145098, 1, 0, 1,
-0.4977281, 0.2729151, -1.480912, 0.1411765, 1, 0, 1,
-0.4931037, 0.9104933, -0.1635139, 0.1333333, 1, 0, 1,
-0.4888784, -0.8585504, -1.929318, 0.1294118, 1, 0, 1,
-0.4778672, 0.3052998, -0.7067026, 0.1215686, 1, 0, 1,
-0.4754664, 1.229062, 0.5785785, 0.1176471, 1, 0, 1,
-0.4746802, 1.631083, 1.899491, 0.1098039, 1, 0, 1,
-0.4727802, 0.7194846, -0.8415042, 0.1058824, 1, 0, 1,
-0.4726995, 0.1529819, -2.361376, 0.09803922, 1, 0, 1,
-0.4693674, 0.1550443, -2.787983, 0.09019608, 1, 0, 1,
-0.4687795, 0.9304351, -0.06785846, 0.08627451, 1, 0, 1,
-0.4645841, 0.3177598, -0.9981055, 0.07843138, 1, 0, 1,
-0.4637349, -1.734896, -3.830351, 0.07450981, 1, 0, 1,
-0.4616497, 0.7207774, -0.6186096, 0.06666667, 1, 0, 1,
-0.4517595, 0.1143051, -2.11543, 0.0627451, 1, 0, 1,
-0.4492208, -0.5115861, -2.270599, 0.05490196, 1, 0, 1,
-0.4490109, -0.04838595, -1.753115, 0.05098039, 1, 0, 1,
-0.4467908, 0.04079603, -3.19028, 0.04313726, 1, 0, 1,
-0.4457272, -0.7960434, -2.217392, 0.03921569, 1, 0, 1,
-0.4442539, 0.3168987, -2.163511, 0.03137255, 1, 0, 1,
-0.4439655, -0.8906485, -2.705736, 0.02745098, 1, 0, 1,
-0.4412652, -0.9261456, -3.931812, 0.01960784, 1, 0, 1,
-0.4366744, 1.349964, 0.02855611, 0.01568628, 1, 0, 1,
-0.4366485, -0.1338104, -1.227518, 0.007843138, 1, 0, 1,
-0.4335758, -0.1628947, -1.415932, 0.003921569, 1, 0, 1,
-0.4333753, -0.006348995, -1.533856, 0, 1, 0.003921569, 1,
-0.4323699, 2.716874, -0.06286357, 0, 1, 0.01176471, 1,
-0.4298254, 0.1639532, 0.1926866, 0, 1, 0.01568628, 1,
-0.4201697, 1.111299, -1.270311, 0, 1, 0.02352941, 1,
-0.4192899, 1.089816, 0.870352, 0, 1, 0.02745098, 1,
-0.4123413, -1.025863, -3.220625, 0, 1, 0.03529412, 1,
-0.4072276, 0.5820463, 2.298855, 0, 1, 0.03921569, 1,
-0.405815, -0.1136338, -1.877674, 0, 1, 0.04705882, 1,
-0.4044921, 1.278305, 0.06861141, 0, 1, 0.05098039, 1,
-0.4029577, -1.619565, -3.856017, 0, 1, 0.05882353, 1,
-0.3970759, 0.5681511, -1.017924, 0, 1, 0.0627451, 1,
-0.3927581, -0.3416974, -3.008277, 0, 1, 0.07058824, 1,
-0.389368, 0.1682845, -1.29619, 0, 1, 0.07450981, 1,
-0.3882491, -0.9555361, -1.218612, 0, 1, 0.08235294, 1,
-0.3849773, -0.3143986, -1.936661, 0, 1, 0.08627451, 1,
-0.3842187, -0.1147901, -1.100013, 0, 1, 0.09411765, 1,
-0.3837488, -0.8060108, -3.188305, 0, 1, 0.1019608, 1,
-0.3809995, 0.2992392, 0.2381671, 0, 1, 0.1058824, 1,
-0.3800683, 0.4158373, -0.2428033, 0, 1, 0.1137255, 1,
-0.3778881, -0.4902063, -2.896003, 0, 1, 0.1176471, 1,
-0.3659539, -0.7218149, -2.485966, 0, 1, 0.1254902, 1,
-0.3657355, 1.22935, -0.3776895, 0, 1, 0.1294118, 1,
-0.3638399, 1.295639, -0.6335865, 0, 1, 0.1372549, 1,
-0.3566581, -0.2386408, -0.7545822, 0, 1, 0.1411765, 1,
-0.3543751, -1.012695, -0.8142915, 0, 1, 0.1490196, 1,
-0.3528066, -1.815528, -2.260394, 0, 1, 0.1529412, 1,
-0.3501049, -1.986861, -3.190841, 0, 1, 0.1607843, 1,
-0.3443263, 0.2485223, 0.5231041, 0, 1, 0.1647059, 1,
-0.3332301, 0.1582339, -0.7436964, 0, 1, 0.172549, 1,
-0.3272786, 0.8534577, -1.245546, 0, 1, 0.1764706, 1,
-0.3266189, -1.012826, -1.804975, 0, 1, 0.1843137, 1,
-0.3234825, 0.4217407, 1.018227, 0, 1, 0.1882353, 1,
-0.3208934, 0.7987042, 0.5417995, 0, 1, 0.1960784, 1,
-0.3168869, -0.6747307, -3.376089, 0, 1, 0.2039216, 1,
-0.3156835, 1.029812, -0.7940406, 0, 1, 0.2078431, 1,
-0.3054233, 1.24956, -1.724472, 0, 1, 0.2156863, 1,
-0.3041525, 0.3994752, 0.8383938, 0, 1, 0.2196078, 1,
-0.3000651, 0.05978863, -2.311525, 0, 1, 0.227451, 1,
-0.2977587, -1.593711, -3.339308, 0, 1, 0.2313726, 1,
-0.2966428, 0.5042041, -1.64873, 0, 1, 0.2392157, 1,
-0.2945286, -0.4426548, -2.167096, 0, 1, 0.2431373, 1,
-0.2927528, -0.2243183, -1.359473, 0, 1, 0.2509804, 1,
-0.2876241, -0.5200222, -2.499566, 0, 1, 0.254902, 1,
-0.2781768, 0.4579617, -0.6375698, 0, 1, 0.2627451, 1,
-0.2776577, -1.828533, -2.591943, 0, 1, 0.2666667, 1,
-0.2760883, -0.9139764, -2.602659, 0, 1, 0.2745098, 1,
-0.2756627, -0.1698641, -2.951299, 0, 1, 0.2784314, 1,
-0.2717217, -0.2176618, -1.865335, 0, 1, 0.2862745, 1,
-0.2714044, 1.412944, -1.527893, 0, 1, 0.2901961, 1,
-0.2711341, 0.1993496, -0.3737637, 0, 1, 0.2980392, 1,
-0.2705145, -1.919998, -4.292109, 0, 1, 0.3058824, 1,
-0.2644052, 1.424668, -0.685136, 0, 1, 0.3098039, 1,
-0.2636223, 0.2243826, -0.05592468, 0, 1, 0.3176471, 1,
-0.2633329, -0.9875769, -2.447979, 0, 1, 0.3215686, 1,
-0.2610982, -0.5005608, -2.897362, 0, 1, 0.3294118, 1,
-0.2603003, -0.6414559, -2.010563, 0, 1, 0.3333333, 1,
-0.2601767, -0.3312318, -4.336881, 0, 1, 0.3411765, 1,
-0.25768, 1.769379, -0.5834084, 0, 1, 0.345098, 1,
-0.2571676, 0.7315128, 0.9641301, 0, 1, 0.3529412, 1,
-0.2552694, 1.044674, -2.715055, 0, 1, 0.3568628, 1,
-0.2546296, -0.7795167, -2.91512, 0, 1, 0.3647059, 1,
-0.2504414, -0.405477, -3.037123, 0, 1, 0.3686275, 1,
-0.2479258, -0.1972241, -2.497687, 0, 1, 0.3764706, 1,
-0.247426, 0.3451689, -1.025296, 0, 1, 0.3803922, 1,
-0.2458073, -0.8940942, -1.641792, 0, 1, 0.3882353, 1,
-0.2457748, 0.4717591, -1.271955, 0, 1, 0.3921569, 1,
-0.2411121, -1.044903, -0.9492078, 0, 1, 0.4, 1,
-0.2395881, -0.5124409, 0.5594118, 0, 1, 0.4078431, 1,
-0.23898, -0.004791389, -2.180384, 0, 1, 0.4117647, 1,
-0.2387993, 1.827765, -0.4039058, 0, 1, 0.4196078, 1,
-0.2323665, -0.3465254, -0.4674791, 0, 1, 0.4235294, 1,
-0.2317448, 1.684259, 0.9017077, 0, 1, 0.4313726, 1,
-0.2285486, -1.7625, -4.059844, 0, 1, 0.4352941, 1,
-0.2266598, 0.4030067, -1.639188, 0, 1, 0.4431373, 1,
-0.2207052, 1.522778, 1.052853, 0, 1, 0.4470588, 1,
-0.2174002, 2.158107, -0.5246276, 0, 1, 0.454902, 1,
-0.2113918, -1.431316, -1.373896, 0, 1, 0.4588235, 1,
-0.2091893, -0.3914153, -1.926682, 0, 1, 0.4666667, 1,
-0.2063353, -0.4484398, -1.968709, 0, 1, 0.4705882, 1,
-0.1960903, 0.006539403, -2.023645, 0, 1, 0.4784314, 1,
-0.1948663, 0.4115525, -1.496647, 0, 1, 0.4823529, 1,
-0.1898896, -1.8479, -3.413097, 0, 1, 0.4901961, 1,
-0.1859458, 1.914337, 1.282228, 0, 1, 0.4941176, 1,
-0.1849649, -1.305015, -1.830022, 0, 1, 0.5019608, 1,
-0.1821487, -0.8029517, -3.073652, 0, 1, 0.509804, 1,
-0.1798386, 1.143525, -1.203488, 0, 1, 0.5137255, 1,
-0.1774393, -0.0501052, -1.925183, 0, 1, 0.5215687, 1,
-0.1734834, -0.3041243, -2.91133, 0, 1, 0.5254902, 1,
-0.1682267, -1.149423, -3.624492, 0, 1, 0.5333334, 1,
-0.1676895, -1.423409, -2.696805, 0, 1, 0.5372549, 1,
-0.1598124, 0.1862216, -1.00305, 0, 1, 0.5450981, 1,
-0.1594142, 1.301206, 1.22165, 0, 1, 0.5490196, 1,
-0.1566872, -0.8571624, -2.962682, 0, 1, 0.5568628, 1,
-0.1555311, 0.9849902, 0.3134833, 0, 1, 0.5607843, 1,
-0.1552675, -0.2348459, -0.3818864, 0, 1, 0.5686275, 1,
-0.1542316, -0.7326162, -3.767164, 0, 1, 0.572549, 1,
-0.1530504, -0.5283632, -0.1036194, 0, 1, 0.5803922, 1,
-0.1520725, 1.204299, -0.3870221, 0, 1, 0.5843138, 1,
-0.1509582, -0.09119832, -1.252724, 0, 1, 0.5921569, 1,
-0.1505592, -1.361041, -3.915066, 0, 1, 0.5960785, 1,
-0.1503433, 0.08806063, 0.280615, 0, 1, 0.6039216, 1,
-0.1503346, -0.9420697, -4.449536, 0, 1, 0.6117647, 1,
-0.1476705, -0.09265148, -3.729393, 0, 1, 0.6156863, 1,
-0.1469833, -0.35551, -2.045177, 0, 1, 0.6235294, 1,
-0.1399349, 1.323456, -0.7266446, 0, 1, 0.627451, 1,
-0.1384909, -0.05324802, -3.285756, 0, 1, 0.6352941, 1,
-0.1375387, -0.5835518, -1.533244, 0, 1, 0.6392157, 1,
-0.1350814, 0.1686355, -0.2852494, 0, 1, 0.6470588, 1,
-0.1350766, -2.462417, -2.560011, 0, 1, 0.6509804, 1,
-0.1303966, -0.814109, -4.353168, 0, 1, 0.6588235, 1,
-0.1266281, 2.063508, 0.1160427, 0, 1, 0.6627451, 1,
-0.1246963, -1.380615, -1.825306, 0, 1, 0.6705883, 1,
-0.1232085, -1.231061, -3.701195, 0, 1, 0.6745098, 1,
-0.1205691, 0.7169937, 2.551339, 0, 1, 0.682353, 1,
-0.1199229, 0.807165, -0.4810358, 0, 1, 0.6862745, 1,
-0.1183386, -0.1524858, -2.644247, 0, 1, 0.6941177, 1,
-0.1160863, 0.2887716, -1.363496, 0, 1, 0.7019608, 1,
-0.1125004, -1.058926, -2.83295, 0, 1, 0.7058824, 1,
-0.1087049, -0.6701494, -2.437652, 0, 1, 0.7137255, 1,
-0.0986541, -0.2299573, -4.53452, 0, 1, 0.7176471, 1,
-0.09751558, 0.1862195, -0.2770313, 0, 1, 0.7254902, 1,
-0.09705087, -0.6438485, -2.401244, 0, 1, 0.7294118, 1,
-0.09602719, 0.116194, -0.7478899, 0, 1, 0.7372549, 1,
-0.0909968, 1.314223, -1.551725, 0, 1, 0.7411765, 1,
-0.09033924, -0.09545304, -1.856785, 0, 1, 0.7490196, 1,
-0.07873653, -1.269685, -2.773199, 0, 1, 0.7529412, 1,
-0.07522248, -0.4279328, -3.741445, 0, 1, 0.7607843, 1,
-0.06993698, 1.036934, -0.3078862, 0, 1, 0.7647059, 1,
-0.06839816, 1.882033, -0.761456, 0, 1, 0.772549, 1,
-0.06676524, 0.6937765, 3.841693, 0, 1, 0.7764706, 1,
-0.06173059, -0.0549534, -1.354485, 0, 1, 0.7843137, 1,
-0.06065692, 0.4355485, 0.1188449, 0, 1, 0.7882353, 1,
-0.05949843, 0.7956063, 0.3205371, 0, 1, 0.7960784, 1,
-0.05825766, 1.208093, -0.3659023, 0, 1, 0.8039216, 1,
-0.05636173, 0.3757491, 0.4494015, 0, 1, 0.8078431, 1,
-0.0447339, 0.2686573, -0.3711273, 0, 1, 0.8156863, 1,
-0.0446623, 1.012237, -0.5148985, 0, 1, 0.8196079, 1,
-0.04361949, -0.4071831, -2.406957, 0, 1, 0.827451, 1,
-0.04293799, -0.3297609, -1.893275, 0, 1, 0.8313726, 1,
-0.0417049, 1.769948, 0.04318064, 0, 1, 0.8392157, 1,
-0.0407331, -0.3402539, -4.533471, 0, 1, 0.8431373, 1,
-0.04006841, 0.06399892, -1.340563, 0, 1, 0.8509804, 1,
-0.04003169, -2.104904, -2.73324, 0, 1, 0.854902, 1,
-0.0364709, -1.367463, -3.388333, 0, 1, 0.8627451, 1,
-0.036364, 0.9900082, -0.2840285, 0, 1, 0.8666667, 1,
-0.03178478, -0.3190631, -5.465679, 0, 1, 0.8745098, 1,
-0.02768423, 0.05710102, 0.4799376, 0, 1, 0.8784314, 1,
-0.0272078, -0.8471202, -3.849374, 0, 1, 0.8862745, 1,
-0.02638618, -0.1519568, -1.09301, 0, 1, 0.8901961, 1,
-0.02245065, -0.3335396, -3.827728, 0, 1, 0.8980392, 1,
-0.01553084, -1.558241, -2.607009, 0, 1, 0.9058824, 1,
-0.01345702, 0.2746083, -1.135671, 0, 1, 0.9098039, 1,
-0.01342245, -1.34692, -2.800966, 0, 1, 0.9176471, 1,
-0.01268762, -1.438956, -3.047547, 0, 1, 0.9215686, 1,
-0.01114007, -0.4579764, -3.597932, 0, 1, 0.9294118, 1,
-0.01069255, -1.593797, -5.141294, 0, 1, 0.9333333, 1,
-0.009909709, -1.219473, -2.615722, 0, 1, 0.9411765, 1,
-0.004256467, 0.3906716, -0.6371126, 0, 1, 0.945098, 1,
-0.001418079, 0.03296747, -0.1520299, 0, 1, 0.9529412, 1,
-1.556482e-06, 0.4932112, 0.3307392, 0, 1, 0.9568627, 1,
0.000104791, -0.6284328, 2.989503, 0, 1, 0.9647059, 1,
0.01214084, 0.5221313, -1.302558, 0, 1, 0.9686275, 1,
0.01359163, 0.2849914, 0.09289584, 0, 1, 0.9764706, 1,
0.01551249, -1.675253, 4.465633, 0, 1, 0.9803922, 1,
0.01740371, -0.1638583, 2.348168, 0, 1, 0.9882353, 1,
0.01804514, -0.8601805, 1.302691, 0, 1, 0.9921569, 1,
0.0183979, -1.199086, 3.264897, 0, 1, 1, 1,
0.02083367, -1.390563, 1.119361, 0, 0.9921569, 1, 1,
0.03184014, 0.5818816, -1.370347, 0, 0.9882353, 1, 1,
0.03337102, 0.5480929, 0.9671713, 0, 0.9803922, 1, 1,
0.03636118, 0.4229554, -2.003927, 0, 0.9764706, 1, 1,
0.04679652, 1.038212, 0.04444625, 0, 0.9686275, 1, 1,
0.04758877, 1.192703, -2.021812, 0, 0.9647059, 1, 1,
0.05647589, -0.7583837, 2.702901, 0, 0.9568627, 1, 1,
0.05884935, -0.07593682, 1.819638, 0, 0.9529412, 1, 1,
0.05937076, -0.2166626, 4.432945, 0, 0.945098, 1, 1,
0.06102451, 0.3544358, -0.6718378, 0, 0.9411765, 1, 1,
0.06648206, 0.6792955, -0.6494857, 0, 0.9333333, 1, 1,
0.06857092, -1.063353, 2.158999, 0, 0.9294118, 1, 1,
0.06920855, -0.5828152, 4.601206, 0, 0.9215686, 1, 1,
0.07575679, 1.633405, 0.801756, 0, 0.9176471, 1, 1,
0.07763945, 0.7880385, 0.2545675, 0, 0.9098039, 1, 1,
0.0814997, -0.3114222, 2.421294, 0, 0.9058824, 1, 1,
0.08371599, -0.08324776, 4.121978, 0, 0.8980392, 1, 1,
0.084898, -1.993139, 3.524752, 0, 0.8901961, 1, 1,
0.08582757, -0.3954731, 3.141061, 0, 0.8862745, 1, 1,
0.08758916, -1.091844, 4.867013, 0, 0.8784314, 1, 1,
0.08997191, -0.6699684, 3.38713, 0, 0.8745098, 1, 1,
0.09032528, -0.6474276, 4.201495, 0, 0.8666667, 1, 1,
0.0904098, 1.261745, 1.315836, 0, 0.8627451, 1, 1,
0.09394696, -0.2502546, 2.939974, 0, 0.854902, 1, 1,
0.09683878, 1.991859, -0.9473075, 0, 0.8509804, 1, 1,
0.09848771, -0.8623874, 2.685076, 0, 0.8431373, 1, 1,
0.1027805, -2.003737, 3.660539, 0, 0.8392157, 1, 1,
0.1031299, -0.7797406, 3.391229, 0, 0.8313726, 1, 1,
0.1036719, 1.813183, -0.5225341, 0, 0.827451, 1, 1,
0.1037141, -0.3850675, 4.370647, 0, 0.8196079, 1, 1,
0.1055522, -0.2391631, 2.479624, 0, 0.8156863, 1, 1,
0.1061319, -1.651479, 3.207319, 0, 0.8078431, 1, 1,
0.1090196, 0.184363, 1.194893, 0, 0.8039216, 1, 1,
0.1112413, 1.061593, 0.3058357, 0, 0.7960784, 1, 1,
0.111521, -0.1297364, 2.330391, 0, 0.7882353, 1, 1,
0.1127269, -1.02291, 4.60946, 0, 0.7843137, 1, 1,
0.1135571, -1.005079, 2.594517, 0, 0.7764706, 1, 1,
0.1208695, 0.9843003, 1.720993, 0, 0.772549, 1, 1,
0.121382, 0.8498877, -0.4854302, 0, 0.7647059, 1, 1,
0.1299958, 0.5030732, -1.556972, 0, 0.7607843, 1, 1,
0.1308441, 1.257412, 1.06156, 0, 0.7529412, 1, 1,
0.1364753, -0.6286801, 3.739369, 0, 0.7490196, 1, 1,
0.1381818, 0.962826, 0.2982698, 0, 0.7411765, 1, 1,
0.1424701, -1.000511, 3.089313, 0, 0.7372549, 1, 1,
0.1435081, 0.3834132, 1.537177, 0, 0.7294118, 1, 1,
0.1439108, -0.3101694, 1.265484, 0, 0.7254902, 1, 1,
0.1468108, -1.047631, 2.173301, 0, 0.7176471, 1, 1,
0.1468311, -1.351, 3.257342, 0, 0.7137255, 1, 1,
0.1518276, 0.4083748, -1.042365, 0, 0.7058824, 1, 1,
0.1525023, 0.9934255, -1.141692, 0, 0.6980392, 1, 1,
0.1534114, 0.7348928, -0.7703514, 0, 0.6941177, 1, 1,
0.1537804, 0.7856064, -0.5384842, 0, 0.6862745, 1, 1,
0.1557019, 0.5747356, -1.413919, 0, 0.682353, 1, 1,
0.1564918, -1.655711, 4.348122, 0, 0.6745098, 1, 1,
0.1619592, -0.9500741, 4.944864, 0, 0.6705883, 1, 1,
0.1628028, -0.3799557, 2.233483, 0, 0.6627451, 1, 1,
0.1695039, 0.6998525, -1.159969, 0, 0.6588235, 1, 1,
0.1731334, 0.3397483, 1.459844, 0, 0.6509804, 1, 1,
0.184999, -0.4753588, 3.305174, 0, 0.6470588, 1, 1,
0.1852008, 0.1083548, -0.2127599, 0, 0.6392157, 1, 1,
0.1859364, 0.7486448, -0.4898169, 0, 0.6352941, 1, 1,
0.1885532, 0.06498342, -0.04789767, 0, 0.627451, 1, 1,
0.1913503, -0.3094375, 2.23732, 0, 0.6235294, 1, 1,
0.1935236, 1.018287, -1.008604, 0, 0.6156863, 1, 1,
0.193736, 1.022748, -0.9330593, 0, 0.6117647, 1, 1,
0.196592, -1.353156, 1.429892, 0, 0.6039216, 1, 1,
0.1988403, -0.2646485, 3.339278, 0, 0.5960785, 1, 1,
0.1999754, -1.805374, 3.457753, 0, 0.5921569, 1, 1,
0.2020037, -0.7270486, 2.891927, 0, 0.5843138, 1, 1,
0.2029751, -1.327785, 2.137252, 0, 0.5803922, 1, 1,
0.2067704, 2.098371, -0.4399252, 0, 0.572549, 1, 1,
0.2107087, 1.282148, 0.3256417, 0, 0.5686275, 1, 1,
0.2107471, 0.8404847, -0.5751055, 0, 0.5607843, 1, 1,
0.211552, 0.09125698, 2.018126, 0, 0.5568628, 1, 1,
0.2156382, -0.7024089, 2.57807, 0, 0.5490196, 1, 1,
0.2192096, -0.1092452, 1.598263, 0, 0.5450981, 1, 1,
0.2211369, 1.55302, 1.079167, 0, 0.5372549, 1, 1,
0.2258563, 0.7161652, -0.92651, 0, 0.5333334, 1, 1,
0.2274154, 1.747142, 1.887253, 0, 0.5254902, 1, 1,
0.2328885, 1.208445, -0.9002156, 0, 0.5215687, 1, 1,
0.233202, 0.2490004, -0.9315214, 0, 0.5137255, 1, 1,
0.2362006, -1.638389, 3.942347, 0, 0.509804, 1, 1,
0.2393441, -0.8403004, 2.828921, 0, 0.5019608, 1, 1,
0.2436604, -0.08616681, 0.7679377, 0, 0.4941176, 1, 1,
0.2438661, 1.501871, 1.139451, 0, 0.4901961, 1, 1,
0.2442998, 1.384855, 2.030851, 0, 0.4823529, 1, 1,
0.2447456, 0.04952198, 2.089167, 0, 0.4784314, 1, 1,
0.2456906, -0.9575638, 2.621158, 0, 0.4705882, 1, 1,
0.2528533, 1.04688, -1.357017, 0, 0.4666667, 1, 1,
0.2625106, 0.7601056, -1.049297, 0, 0.4588235, 1, 1,
0.2653421, 1.947856, 1.865804, 0, 0.454902, 1, 1,
0.2669426, 0.4756245, 1.808776, 0, 0.4470588, 1, 1,
0.2685319, -1.530392, 3.639525, 0, 0.4431373, 1, 1,
0.2722736, 0.1756486, 2.666595, 0, 0.4352941, 1, 1,
0.274992, 0.3400122, 1.481707, 0, 0.4313726, 1, 1,
0.2788295, -1.339581, 3.16828, 0, 0.4235294, 1, 1,
0.2820413, 0.6894676, 1.93912, 0, 0.4196078, 1, 1,
0.2826684, -0.7560357, 2.25094, 0, 0.4117647, 1, 1,
0.2831917, -0.7316973, 0.8387337, 0, 0.4078431, 1, 1,
0.2920843, 0.5413154, -0.6061679, 0, 0.4, 1, 1,
0.2939868, -0.7690955, 1.393473, 0, 0.3921569, 1, 1,
0.2955867, 0.7275196, -0.5202192, 0, 0.3882353, 1, 1,
0.296401, -0.4828793, 3.114567, 0, 0.3803922, 1, 1,
0.2980852, 0.02124834, 2.107872, 0, 0.3764706, 1, 1,
0.2996638, 0.5576353, -0.03649047, 0, 0.3686275, 1, 1,
0.3022741, -0.4811271, 1.806836, 0, 0.3647059, 1, 1,
0.3068696, -1.074744, 2.767062, 0, 0.3568628, 1, 1,
0.3070578, 0.1538706, 1.42062, 0, 0.3529412, 1, 1,
0.3142966, 1.120482, 2.368201, 0, 0.345098, 1, 1,
0.3158268, 0.03720423, 1.625489, 0, 0.3411765, 1, 1,
0.3164205, 0.489, 1.487057, 0, 0.3333333, 1, 1,
0.3256794, -0.2574981, 3.067925, 0, 0.3294118, 1, 1,
0.3273246, -0.3437542, 3.734207, 0, 0.3215686, 1, 1,
0.3308572, 0.375832, 1.470087, 0, 0.3176471, 1, 1,
0.3322368, -1.185775, 2.269016, 0, 0.3098039, 1, 1,
0.3345852, 0.09893047, 1.026089, 0, 0.3058824, 1, 1,
0.3412969, -0.6024817, 2.771477, 0, 0.2980392, 1, 1,
0.3434242, 0.02588823, 1.773328, 0, 0.2901961, 1, 1,
0.3437414, 0.4218123, 0.5539325, 0, 0.2862745, 1, 1,
0.3485546, -0.4477731, 1.820718, 0, 0.2784314, 1, 1,
0.3495792, -0.5684249, 2.370086, 0, 0.2745098, 1, 1,
0.3570224, -0.8506174, 4.351037, 0, 0.2666667, 1, 1,
0.3571395, 1.015486, 1.79119, 0, 0.2627451, 1, 1,
0.3623193, -0.1984321, 0.9198833, 0, 0.254902, 1, 1,
0.3665076, 0.5603076, 0.8215269, 0, 0.2509804, 1, 1,
0.3710913, 1.004935, 2.005836, 0, 0.2431373, 1, 1,
0.3760926, -0.4881791, 1.575943, 0, 0.2392157, 1, 1,
0.3779344, -0.8061547, 1.292575, 0, 0.2313726, 1, 1,
0.3818246, 1.626987, -0.7309017, 0, 0.227451, 1, 1,
0.3824324, 0.6439768, -1.171834, 0, 0.2196078, 1, 1,
0.3831949, 2.005458, 0.1799392, 0, 0.2156863, 1, 1,
0.3890137, 1.60322, -1.548867, 0, 0.2078431, 1, 1,
0.3896343, -1.470707, 3.793859, 0, 0.2039216, 1, 1,
0.3897843, -1.678603, 3.1226, 0, 0.1960784, 1, 1,
0.3905032, 0.2741647, 2.309702, 0, 0.1882353, 1, 1,
0.3924892, -0.351984, 2.487034, 0, 0.1843137, 1, 1,
0.3977804, 1.067783, 1.889154, 0, 0.1764706, 1, 1,
0.4038508, 0.7812588, 2.413267, 0, 0.172549, 1, 1,
0.4053353, -2.408691, 2.303019, 0, 0.1647059, 1, 1,
0.4131651, 0.1461156, 2.5381, 0, 0.1607843, 1, 1,
0.4139985, 0.5199209, 0.351461, 0, 0.1529412, 1, 1,
0.4141716, -1.157019, 3.76916, 0, 0.1490196, 1, 1,
0.4240127, -0.7343482, 4.112319, 0, 0.1411765, 1, 1,
0.4277586, -0.2353103, 2.881627, 0, 0.1372549, 1, 1,
0.4280252, 0.7138754, 0.1417669, 0, 0.1294118, 1, 1,
0.4304245, -0.1078131, 4.026288, 0, 0.1254902, 1, 1,
0.4342471, -1.115471, 3.111764, 0, 0.1176471, 1, 1,
0.437117, -0.6193566, 2.833943, 0, 0.1137255, 1, 1,
0.4380451, -0.08146602, 0.8507288, 0, 0.1058824, 1, 1,
0.4386537, -0.6518016, 3.494495, 0, 0.09803922, 1, 1,
0.4418719, -0.9947351, 2.679558, 0, 0.09411765, 1, 1,
0.4453114, 0.5785167, 0.2985047, 0, 0.08627451, 1, 1,
0.4469574, -0.07826101, 1.458833, 0, 0.08235294, 1, 1,
0.4483325, -0.1925096, 2.04748, 0, 0.07450981, 1, 1,
0.452844, -0.01385898, 2.048791, 0, 0.07058824, 1, 1,
0.4533932, 0.3174912, 0.2765741, 0, 0.0627451, 1, 1,
0.4536183, 0.3269321, 0.3949211, 0, 0.05882353, 1, 1,
0.4551656, -2.636497, 4.324823, 0, 0.05098039, 1, 1,
0.4570506, 2.111405, -0.6144032, 0, 0.04705882, 1, 1,
0.4577619, -1.963, 2.204365, 0, 0.03921569, 1, 1,
0.4644254, 0.8055279, 0.4006133, 0, 0.03529412, 1, 1,
0.4690798, 0.06402187, 0.7140152, 0, 0.02745098, 1, 1,
0.4696946, 1.658619, 0.8516861, 0, 0.02352941, 1, 1,
0.4736449, 0.6792313, 0.03747306, 0, 0.01568628, 1, 1,
0.4747356, -0.4294339, 3.925273, 0, 0.01176471, 1, 1,
0.4797565, -0.387895, 1.068211, 0, 0.003921569, 1, 1,
0.4798236, 2.162558, 1.486156, 0.003921569, 0, 1, 1,
0.4849538, 0.1591602, 0.4801951, 0.007843138, 0, 1, 1,
0.4851025, -1.386999, 1.465618, 0.01568628, 0, 1, 1,
0.4890576, 0.1352253, -0.6065407, 0.01960784, 0, 1, 1,
0.4906173, 2.047121, 2.291202, 0.02745098, 0, 1, 1,
0.4927805, -0.3973214, 2.256744, 0.03137255, 0, 1, 1,
0.4932964, 0.3226746, 0.6512935, 0.03921569, 0, 1, 1,
0.4993465, -0.1557574, -0.3285843, 0.04313726, 0, 1, 1,
0.5003678, -0.8648304, 2.442899, 0.05098039, 0, 1, 1,
0.5007504, 0.2888561, 0.6509725, 0.05490196, 0, 1, 1,
0.5043754, 1.737217, -1.004352, 0.0627451, 0, 1, 1,
0.5067225, -0.2054503, 1.818092, 0.06666667, 0, 1, 1,
0.5090545, 0.173081, 0.01124895, 0.07450981, 0, 1, 1,
0.5094896, -1.228438, 2.181957, 0.07843138, 0, 1, 1,
0.5127758, 1.794066, 0.6405191, 0.08627451, 0, 1, 1,
0.5165839, -2.038406, 5.832803, 0.09019608, 0, 1, 1,
0.5200263, -1.297049, 2.214434, 0.09803922, 0, 1, 1,
0.5269994, -1.357311, 3.677458, 0.1058824, 0, 1, 1,
0.5327725, 0.3162325, 1.385599, 0.1098039, 0, 1, 1,
0.5372136, 0.3810353, 1.038337, 0.1176471, 0, 1, 1,
0.5375406, -1.917736, 3.818769, 0.1215686, 0, 1, 1,
0.5381533, 0.3504917, 1.937165, 0.1294118, 0, 1, 1,
0.5383315, -0.3948832, 2.85443, 0.1333333, 0, 1, 1,
0.5407928, 0.6665148, 0.3532332, 0.1411765, 0, 1, 1,
0.5487501, -0.5423892, 2.530909, 0.145098, 0, 1, 1,
0.5499759, 1.579503, 2.430653, 0.1529412, 0, 1, 1,
0.5504777, -0.2448967, 1.760978, 0.1568628, 0, 1, 1,
0.5517052, -0.0389839, 2.136213, 0.1647059, 0, 1, 1,
0.5544116, 0.2831708, 2.461314, 0.1686275, 0, 1, 1,
0.5551659, -0.476334, 3.692329, 0.1764706, 0, 1, 1,
0.55627, 1.085551, -1.474603, 0.1803922, 0, 1, 1,
0.5564665, 1.738998, 1.200593, 0.1882353, 0, 1, 1,
0.5578262, 0.5162117, 0.4027303, 0.1921569, 0, 1, 1,
0.560266, 1.859024, -1.388618, 0.2, 0, 1, 1,
0.5647535, 0.8568876, 2.45164, 0.2078431, 0, 1, 1,
0.5669878, 1.61276, 0.9022099, 0.2117647, 0, 1, 1,
0.567436, 2.119744, 0.3346916, 0.2196078, 0, 1, 1,
0.5723772, -1.585662, 2.485679, 0.2235294, 0, 1, 1,
0.5772242, 0.7307869, -0.6835489, 0.2313726, 0, 1, 1,
0.5792654, 0.3369131, 2.932419, 0.2352941, 0, 1, 1,
0.5855413, 2.216225, 0.5133984, 0.2431373, 0, 1, 1,
0.5862197, -0.1308478, 0.7188923, 0.2470588, 0, 1, 1,
0.5965036, 1.516464, -1.575811, 0.254902, 0, 1, 1,
0.5968738, -1.164689, 2.805984, 0.2588235, 0, 1, 1,
0.5971043, -0.1107922, -0.0102076, 0.2666667, 0, 1, 1,
0.5972432, -0.09915291, 1.713304, 0.2705882, 0, 1, 1,
0.6010175, -0.5629163, 3.953256, 0.2784314, 0, 1, 1,
0.6025441, 0.906683, -1.840748, 0.282353, 0, 1, 1,
0.6046771, -0.5122825, 2.314174, 0.2901961, 0, 1, 1,
0.6080355, -1.191179, 3.702147, 0.2941177, 0, 1, 1,
0.613026, -1.239103, 2.554327, 0.3019608, 0, 1, 1,
0.6143406, -2.019685, 2.653124, 0.3098039, 0, 1, 1,
0.6181442, -0.1567623, 0.9967776, 0.3137255, 0, 1, 1,
0.6292613, -0.7817434, 2.109424, 0.3215686, 0, 1, 1,
0.6295609, -0.4032642, 2.437949, 0.3254902, 0, 1, 1,
0.6375216, 2.78004, -0.5019293, 0.3333333, 0, 1, 1,
0.638494, 0.1543247, 2.998054, 0.3372549, 0, 1, 1,
0.6442661, -0.09723257, 2.400582, 0.345098, 0, 1, 1,
0.6446433, -0.6544305, 3.607994, 0.3490196, 0, 1, 1,
0.6473858, 1.347334, 0.02893061, 0.3568628, 0, 1, 1,
0.6505743, 0.4421526, -0.3373098, 0.3607843, 0, 1, 1,
0.6551579, -1.316705, 1.145731, 0.3686275, 0, 1, 1,
0.6565427, -1.100162, 3.579034, 0.372549, 0, 1, 1,
0.658875, -0.04612589, 0.94972, 0.3803922, 0, 1, 1,
0.6597184, -0.5857977, 1.690221, 0.3843137, 0, 1, 1,
0.6603738, 0.03071103, 2.37255, 0.3921569, 0, 1, 1,
0.666774, 1.692231, 0.7792276, 0.3960784, 0, 1, 1,
0.6671959, 1.328819, 2.407954, 0.4039216, 0, 1, 1,
0.6687856, 0.1758955, 1.536836, 0.4117647, 0, 1, 1,
0.6689216, -0.8441616, 3.395337, 0.4156863, 0, 1, 1,
0.6702242, 0.5104806, -0.431051, 0.4235294, 0, 1, 1,
0.6717182, 0.5521584, 2.01407, 0.427451, 0, 1, 1,
0.6722356, 0.5874158, 1.465727, 0.4352941, 0, 1, 1,
0.6747851, -0.9191827, 1.746268, 0.4392157, 0, 1, 1,
0.6771981, -0.7615754, 2.317161, 0.4470588, 0, 1, 1,
0.6785277, -0.5044203, 1.576429, 0.4509804, 0, 1, 1,
0.6860411, 0.7994222, 0.5023659, 0.4588235, 0, 1, 1,
0.6872382, -0.4453288, 2.572073, 0.4627451, 0, 1, 1,
0.7021197, 1.332558, -0.376283, 0.4705882, 0, 1, 1,
0.7038848, -0.3783298, 0.7721206, 0.4745098, 0, 1, 1,
0.7077223, -1.646493, 3.285891, 0.4823529, 0, 1, 1,
0.7092561, -1.814565, 3.052834, 0.4862745, 0, 1, 1,
0.7111253, 1.580348, 2.302433, 0.4941176, 0, 1, 1,
0.7147502, -0.05342636, 0.6903883, 0.5019608, 0, 1, 1,
0.7166274, -0.9478255, 0.6439692, 0.5058824, 0, 1, 1,
0.7204549, 0.2501223, 1.527376, 0.5137255, 0, 1, 1,
0.7204564, -0.09796108, 0.1554975, 0.5176471, 0, 1, 1,
0.7214583, -0.2670651, 1.622142, 0.5254902, 0, 1, 1,
0.7248515, -0.4316798, 3.233112, 0.5294118, 0, 1, 1,
0.7285953, 2.380657, -0.3134475, 0.5372549, 0, 1, 1,
0.7305945, -2.110624, 2.18972, 0.5411765, 0, 1, 1,
0.7366184, 2.583149, 0.1345278, 0.5490196, 0, 1, 1,
0.741313, 0.02361142, 2.343508, 0.5529412, 0, 1, 1,
0.746101, -0.55277, 2.127661, 0.5607843, 0, 1, 1,
0.7462918, -1.252418, 3.867999, 0.5647059, 0, 1, 1,
0.7501151, 1.375187, -0.4401147, 0.572549, 0, 1, 1,
0.7516227, -0.8709527, 2.104404, 0.5764706, 0, 1, 1,
0.7579449, 1.049017, 0.8372791, 0.5843138, 0, 1, 1,
0.7580032, -1.457095, 3.446666, 0.5882353, 0, 1, 1,
0.7589321, -0.1406679, 1.71763, 0.5960785, 0, 1, 1,
0.7630647, 1.284144, -0.2383728, 0.6039216, 0, 1, 1,
0.7637851, -1.249568, 4.713267, 0.6078432, 0, 1, 1,
0.7641789, -0.6996604, 2.648499, 0.6156863, 0, 1, 1,
0.7643516, 1.741752, 0.2817263, 0.6196079, 0, 1, 1,
0.7674981, 0.02066348, 0.01794451, 0.627451, 0, 1, 1,
0.7724407, 0.8432478, -0.1082499, 0.6313726, 0, 1, 1,
0.7726087, -0.8345116, 2.383177, 0.6392157, 0, 1, 1,
0.7731349, 0.01878315, 1.58617, 0.6431373, 0, 1, 1,
0.7809002, 0.9469349, 1.286242, 0.6509804, 0, 1, 1,
0.7822896, -0.4536456, 3.750507, 0.654902, 0, 1, 1,
0.7825897, 1.350099, 1.246052, 0.6627451, 0, 1, 1,
0.7965555, 1.383164, -0.1357423, 0.6666667, 0, 1, 1,
0.7975596, 0.7319452, 2.184904, 0.6745098, 0, 1, 1,
0.802465, 1.440942, -0.9904432, 0.6784314, 0, 1, 1,
0.8041554, 1.638269, 2.101944, 0.6862745, 0, 1, 1,
0.8078084, 0.7548063, 2.373855, 0.6901961, 0, 1, 1,
0.8089429, 2.369529, -1.771573, 0.6980392, 0, 1, 1,
0.8111849, -0.8866349, 3.393753, 0.7058824, 0, 1, 1,
0.8263788, -1.427574, 2.886776, 0.7098039, 0, 1, 1,
0.8324996, -0.198191, 0.06663795, 0.7176471, 0, 1, 1,
0.8362646, 0.144201, 3.137697, 0.7215686, 0, 1, 1,
0.8370917, -0.993611, 2.681104, 0.7294118, 0, 1, 1,
0.8412879, 0.1598806, 2.161021, 0.7333333, 0, 1, 1,
0.8421554, -0.5677686, 1.824201, 0.7411765, 0, 1, 1,
0.8458953, 0.4069043, 2.321461, 0.7450981, 0, 1, 1,
0.846586, 0.5904435, 2.583217, 0.7529412, 0, 1, 1,
0.8524263, -0.01689754, 3.459561, 0.7568628, 0, 1, 1,
0.8563883, 0.6061665, -0.6001171, 0.7647059, 0, 1, 1,
0.860629, -0.7326111, 0.8242582, 0.7686275, 0, 1, 1,
0.8608282, 0.3201377, 2.085462, 0.7764706, 0, 1, 1,
0.8650402, 1.07401, 1.507663, 0.7803922, 0, 1, 1,
0.8675548, -0.2827912, 2.218609, 0.7882353, 0, 1, 1,
0.8710552, -0.286599, 0.1930172, 0.7921569, 0, 1, 1,
0.8871133, 1.329704, 0.2433158, 0.8, 0, 1, 1,
0.8948076, -1.148036, -0.2470235, 0.8078431, 0, 1, 1,
0.9039844, -0.2923953, 1.109606, 0.8117647, 0, 1, 1,
0.9081314, -0.1006547, 1.734121, 0.8196079, 0, 1, 1,
0.9085279, -1.525064, 2.769063, 0.8235294, 0, 1, 1,
0.915305, 1.284224, -0.4592121, 0.8313726, 0, 1, 1,
0.9186683, 0.6773618, 0.8634481, 0.8352941, 0, 1, 1,
0.9188537, 1.088331, 1.178387, 0.8431373, 0, 1, 1,
0.9284466, 1.423144, 0.3526148, 0.8470588, 0, 1, 1,
0.9321125, -1.255151, 1.837047, 0.854902, 0, 1, 1,
0.9344386, -0.4086604, 1.65067, 0.8588235, 0, 1, 1,
0.9351558, 0.5898079, 1.649712, 0.8666667, 0, 1, 1,
0.9394134, 0.1511544, 0.1258394, 0.8705882, 0, 1, 1,
0.9423137, -0.4162078, 1.25665, 0.8784314, 0, 1, 1,
0.9499512, -0.8734679, 2.63109, 0.8823529, 0, 1, 1,
0.9513149, 1.14525, -0.2150628, 0.8901961, 0, 1, 1,
0.9523873, 0.510476, -0.8238654, 0.8941177, 0, 1, 1,
0.9588328, -1.053282, 1.464079, 0.9019608, 0, 1, 1,
0.9607783, 0.9114216, 1.449636, 0.9098039, 0, 1, 1,
0.964223, -0.1952662, -1.215382, 0.9137255, 0, 1, 1,
0.9670075, -0.8331217, 0.8571987, 0.9215686, 0, 1, 1,
0.9704185, 0.7884564, 1.666004, 0.9254902, 0, 1, 1,
0.9714719, 0.07243118, 0.8684724, 0.9333333, 0, 1, 1,
0.9776405, 2.030346, 0.7839408, 0.9372549, 0, 1, 1,
0.9797596, -0.4725728, 3.525903, 0.945098, 0, 1, 1,
0.9834339, 0.2703948, -0.3821031, 0.9490196, 0, 1, 1,
0.9888353, 0.4889093, 1.580647, 0.9568627, 0, 1, 1,
0.9893636, 1.427116, 1.880512, 0.9607843, 0, 1, 1,
0.9963629, 0.8307283, 1.449114, 0.9686275, 0, 1, 1,
1.001695, -0.7626929, 2.541545, 0.972549, 0, 1, 1,
1.008013, -0.9441305, 3.769347, 0.9803922, 0, 1, 1,
1.010693, -0.02500703, 1.057451, 0.9843137, 0, 1, 1,
1.011687, 0.4554321, 1.426894, 0.9921569, 0, 1, 1,
1.015068, -0.5192386, 3.534667, 0.9960784, 0, 1, 1,
1.018756, 0.4194207, 1.49192, 1, 0, 0.9960784, 1,
1.024018, -1.05669, 1.687232, 1, 0, 0.9882353, 1,
1.033447, 0.7480014, 1.691573, 1, 0, 0.9843137, 1,
1.048643, -0.6881419, 1.897878, 1, 0, 0.9764706, 1,
1.051278, 1.317071, -0.4450726, 1, 0, 0.972549, 1,
1.057707, -0.6474735, 1.904846, 1, 0, 0.9647059, 1,
1.067213, 0.4225741, 1.517851, 1, 0, 0.9607843, 1,
1.067569, 1.146429, 0.8129558, 1, 0, 0.9529412, 1,
1.068543, -0.4407493, 2.089632, 1, 0, 0.9490196, 1,
1.075733, 1.286951, 0.3825689, 1, 0, 0.9411765, 1,
1.078091, -1.533568, 2.385478, 1, 0, 0.9372549, 1,
1.08071, 1.404052, -1.191423, 1, 0, 0.9294118, 1,
1.083153, 1.008257, 0.06665875, 1, 0, 0.9254902, 1,
1.083273, 0.7977237, 1.850757, 1, 0, 0.9176471, 1,
1.085325, -0.5424882, 1.476238, 1, 0, 0.9137255, 1,
1.091216, 0.1067808, 0.753227, 1, 0, 0.9058824, 1,
1.096624, 1.225538, 2.256344, 1, 0, 0.9019608, 1,
1.098514, -1.579894, 4.101895, 1, 0, 0.8941177, 1,
1.103734, -0.6070144, 2.426682, 1, 0, 0.8862745, 1,
1.104427, 0.5902392, 0.6921757, 1, 0, 0.8823529, 1,
1.107899, -0.07811359, 1.919866, 1, 0, 0.8745098, 1,
1.11032, -0.2955768, 2.296753, 1, 0, 0.8705882, 1,
1.117689, -2.046042, 4.414762, 1, 0, 0.8627451, 1,
1.123391, -0.1083726, 1.863701, 1, 0, 0.8588235, 1,
1.126675, -1.861476, 2.421467, 1, 0, 0.8509804, 1,
1.13427, 0.4243534, 1.446899, 1, 0, 0.8470588, 1,
1.134501, 0.5201885, 1.10818, 1, 0, 0.8392157, 1,
1.138317, 0.3569327, 1.241486, 1, 0, 0.8352941, 1,
1.14064, 0.08282724, 1.874758, 1, 0, 0.827451, 1,
1.141373, 0.5980368, 1.167387, 1, 0, 0.8235294, 1,
1.146619, -0.04781672, 3.516959, 1, 0, 0.8156863, 1,
1.151386, 1.644163, 2.020503, 1, 0, 0.8117647, 1,
1.169668, -1.059579, 2.242886, 1, 0, 0.8039216, 1,
1.176888, 0.7202522, -0.7314712, 1, 0, 0.7960784, 1,
1.198889, -0.6852986, 0.638957, 1, 0, 0.7921569, 1,
1.200437, -0.2361752, 2.961971, 1, 0, 0.7843137, 1,
1.201494, 1.991628, 0.1560824, 1, 0, 0.7803922, 1,
1.208375, -0.5214565, 0.8106828, 1, 0, 0.772549, 1,
1.21182, -0.6048335, 2.492435, 1, 0, 0.7686275, 1,
1.220558, -1.212167, 3.401724, 1, 0, 0.7607843, 1,
1.221489, -2.126123, 3.854859, 1, 0, 0.7568628, 1,
1.225426, 0.833686, 0.712937, 1, 0, 0.7490196, 1,
1.230108, 0.2210127, 3.13315, 1, 0, 0.7450981, 1,
1.232186, -0.1450822, 2.882179, 1, 0, 0.7372549, 1,
1.235224, -0.4676567, 3.960314, 1, 0, 0.7333333, 1,
1.238709, 0.8634663, 1.543179, 1, 0, 0.7254902, 1,
1.239301, -0.2130652, 2.494229, 1, 0, 0.7215686, 1,
1.241867, 0.9320522, 1.570256, 1, 0, 0.7137255, 1,
1.242416, 0.4955545, 1.15761, 1, 0, 0.7098039, 1,
1.254482, -1.331174, 2.92376, 1, 0, 0.7019608, 1,
1.259421, -1.007508, 3.341015, 1, 0, 0.6941177, 1,
1.261841, -0.3669012, 2.692959, 1, 0, 0.6901961, 1,
1.276016, 0.3965442, 0.006445068, 1, 0, 0.682353, 1,
1.290853, 1.287132, 2.163568, 1, 0, 0.6784314, 1,
1.291248, -0.1707626, 2.046866, 1, 0, 0.6705883, 1,
1.291635, 0.2083182, 3.848827, 1, 0, 0.6666667, 1,
1.293312, 0.3886885, 0.2636104, 1, 0, 0.6588235, 1,
1.299951, -0.6871616, 3.144349, 1, 0, 0.654902, 1,
1.30582, 0.8132815, 1.458404, 1, 0, 0.6470588, 1,
1.308836, 0.4461637, 1.692894, 1, 0, 0.6431373, 1,
1.312985, 0.2154365, 1.562333, 1, 0, 0.6352941, 1,
1.31894, -0.2550191, 3.14945, 1, 0, 0.6313726, 1,
1.325665, 0.2392267, 0.5838712, 1, 0, 0.6235294, 1,
1.335809, 0.04291259, 2.503586, 1, 0, 0.6196079, 1,
1.33869, 0.4111381, 1.966537, 1, 0, 0.6117647, 1,
1.339344, -0.4489163, 1.51265, 1, 0, 0.6078432, 1,
1.346835, 1.231578, 1.080879, 1, 0, 0.6, 1,
1.347232, 0.4852098, -0.1449298, 1, 0, 0.5921569, 1,
1.353213, 0.4865787, 2.540342, 1, 0, 0.5882353, 1,
1.36439, -0.4602689, 2.217848, 1, 0, 0.5803922, 1,
1.36598, 0.1003947, 3.73028, 1, 0, 0.5764706, 1,
1.374213, -1.586781, 1.452364, 1, 0, 0.5686275, 1,
1.408431, 1.773366, 1.656342, 1, 0, 0.5647059, 1,
1.409218, -0.8037442, 1.369217, 1, 0, 0.5568628, 1,
1.411892, 0.3107102, 2.377334, 1, 0, 0.5529412, 1,
1.413112, -2.317263, 3.546997, 1, 0, 0.5450981, 1,
1.414163, 0.6846811, 0.4883356, 1, 0, 0.5411765, 1,
1.419684, 1.533182, 0.1377914, 1, 0, 0.5333334, 1,
1.419782, 0.04335047, 2.708938, 1, 0, 0.5294118, 1,
1.424059, 1.598535, 0.3572408, 1, 0, 0.5215687, 1,
1.424567, 0.8826845, -0.1663928, 1, 0, 0.5176471, 1,
1.427835, 0.1440358, 1.7576, 1, 0, 0.509804, 1,
1.437452, 0.9764091, -0.4427202, 1, 0, 0.5058824, 1,
1.442894, 0.1025861, 0.7206471, 1, 0, 0.4980392, 1,
1.452888, -1.103154, 2.613697, 1, 0, 0.4901961, 1,
1.45527, 1.487511, 1.702143, 1, 0, 0.4862745, 1,
1.45699, 1.954867, 2.059541, 1, 0, 0.4784314, 1,
1.460814, 0.2449202, 2.12534, 1, 0, 0.4745098, 1,
1.463397, 1.132282, 1.69012, 1, 0, 0.4666667, 1,
1.46451, 1.693962, 0.730754, 1, 0, 0.4627451, 1,
1.466104, 1.301209, 0.4283305, 1, 0, 0.454902, 1,
1.475564, -0.4761724, 1.407951, 1, 0, 0.4509804, 1,
1.486456, 0.1985753, 2.054998, 1, 0, 0.4431373, 1,
1.488172, -0.07193176, 1.267141, 1, 0, 0.4392157, 1,
1.504337, -0.9320012, 2.993632, 1, 0, 0.4313726, 1,
1.507198, -0.2044328, 3.996872, 1, 0, 0.427451, 1,
1.512824, -1.185102, 2.231419, 1, 0, 0.4196078, 1,
1.514442, 0.1950645, 2.105413, 1, 0, 0.4156863, 1,
1.519227, -1.057019, 2.872688, 1, 0, 0.4078431, 1,
1.523609, 1.564299, 0.3342666, 1, 0, 0.4039216, 1,
1.534747, -0.913642, 2.125084, 1, 0, 0.3960784, 1,
1.537199, 2.299711, 0.1508358, 1, 0, 0.3882353, 1,
1.54275, 0.4723, 2.572171, 1, 0, 0.3843137, 1,
1.550767, -1.560106, 2.430035, 1, 0, 0.3764706, 1,
1.552768, 0.0262926, 1.644873, 1, 0, 0.372549, 1,
1.558834, -0.747338, 2.622853, 1, 0, 0.3647059, 1,
1.568286, 1.101952, 2.023748, 1, 0, 0.3607843, 1,
1.570942, -0.6089756, 2.331763, 1, 0, 0.3529412, 1,
1.578835, -1.954835, 1.190854, 1, 0, 0.3490196, 1,
1.583147, 0.1562243, 0.7858185, 1, 0, 0.3411765, 1,
1.622393, -0.09733727, 0.1319529, 1, 0, 0.3372549, 1,
1.627351, -0.3537792, 1.201531, 1, 0, 0.3294118, 1,
1.637878, -0.5653291, 0.6652433, 1, 0, 0.3254902, 1,
1.6543, -0.1118609, 1.073896, 1, 0, 0.3176471, 1,
1.674064, 1.16698, 1.837876, 1, 0, 0.3137255, 1,
1.688663, 0.09364181, 1.510933, 1, 0, 0.3058824, 1,
1.713336, -0.1044953, 1.228153, 1, 0, 0.2980392, 1,
1.722566, 1.747686, 0.5167115, 1, 0, 0.2941177, 1,
1.725565, 0.704861, 1.903835, 1, 0, 0.2862745, 1,
1.729704, -0.6192951, 3.255144, 1, 0, 0.282353, 1,
1.741092, -0.8445774, 2.613128, 1, 0, 0.2745098, 1,
1.74161, 0.5915061, 0.6347815, 1, 0, 0.2705882, 1,
1.752821, -0.4554335, 1.758373, 1, 0, 0.2627451, 1,
1.791354, -0.5510034, 2.037396, 1, 0, 0.2588235, 1,
1.792841, -0.06942225, 2.902827, 1, 0, 0.2509804, 1,
1.798955, 1.027991, 0.9587052, 1, 0, 0.2470588, 1,
1.808354, 0.2580742, 0.5935693, 1, 0, 0.2392157, 1,
1.8088, -0.9590861, 1.641386, 1, 0, 0.2352941, 1,
1.813264, -0.007507504, 2.089434, 1, 0, 0.227451, 1,
1.814801, 2.018882, -0.4627406, 1, 0, 0.2235294, 1,
1.857014, 2.259582, -0.1493381, 1, 0, 0.2156863, 1,
1.879859, -0.121897, 0.1893851, 1, 0, 0.2117647, 1,
1.934579, 1.122278, 2.994513, 1, 0, 0.2039216, 1,
1.961771, 0.7162138, 1.654908, 1, 0, 0.1960784, 1,
1.969857, 1.537312, -0.5844808, 1, 0, 0.1921569, 1,
1.973127, 1.413688, 2.650577, 1, 0, 0.1843137, 1,
1.987683, -1.398049, 3.558103, 1, 0, 0.1803922, 1,
1.996427, -1.451013, 2.698203, 1, 0, 0.172549, 1,
1.999389, -1.199137, 0.3170637, 1, 0, 0.1686275, 1,
2.030047, 0.04706048, -0.01000681, 1, 0, 0.1607843, 1,
2.037579, 1.163668, 2.750928, 1, 0, 0.1568628, 1,
2.041819, -0.194645, 1.447955, 1, 0, 0.1490196, 1,
2.069357, -0.8688512, 1.344658, 1, 0, 0.145098, 1,
2.069845, -0.6270626, 3.227797, 1, 0, 0.1372549, 1,
2.152119, -1.423783, 1.341537, 1, 0, 0.1333333, 1,
2.154958, 0.6977362, 1.692489, 1, 0, 0.1254902, 1,
2.157368, 0.03537124, 2.283696, 1, 0, 0.1215686, 1,
2.186942, 0.7919598, 1.763354, 1, 0, 0.1137255, 1,
2.187335, -1.139642, 2.608084, 1, 0, 0.1098039, 1,
2.200125, -0.5174881, 1.832548, 1, 0, 0.1019608, 1,
2.219455, -0.4307551, 0.20174, 1, 0, 0.09411765, 1,
2.258007, -1.147601, -0.1568847, 1, 0, 0.09019608, 1,
2.272743, -1.530158, 3.012105, 1, 0, 0.08235294, 1,
2.281413, 0.02720352, 1.949658, 1, 0, 0.07843138, 1,
2.297507, 1.151094, 0.02528519, 1, 0, 0.07058824, 1,
2.319052, 0.05894965, 0.8254436, 1, 0, 0.06666667, 1,
2.327169, 0.7076058, 1.310141, 1, 0, 0.05882353, 1,
2.329807, -2.279251, 2.487852, 1, 0, 0.05490196, 1,
2.334924, -1.910753, 0.07309124, 1, 0, 0.04705882, 1,
2.524593, 0.9045805, 0.3373735, 1, 0, 0.04313726, 1,
2.52684, 0.7827315, 1.008373, 1, 0, 0.03529412, 1,
2.680626, 0.9879524, 1.638908, 1, 0, 0.03137255, 1,
2.686479, -0.7527182, 1.90792, 1, 0, 0.02352941, 1,
2.709077, 0.002814817, 1.968125, 1, 0, 0.01960784, 1,
3.072623, 0.2247308, 2.264982, 1, 0, 0.01176471, 1,
3.211604, -1.74801, 3.232818, 1, 0, 0.007843138, 1
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
-0.1818477, -4.869415, -7.380772, 0, -0.5, 0.5, 0.5,
-0.1818477, -4.869415, -7.380772, 1, -0.5, 0.5, 0.5,
-0.1818477, -4.869415, -7.380772, 1, 1.5, 0.5, 0.5,
-0.1818477, -4.869415, -7.380772, 0, 1.5, 0.5, 0.5
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
-4.725679, -0.3951824, -7.380772, 0, -0.5, 0.5, 0.5,
-4.725679, -0.3951824, -7.380772, 1, -0.5, 0.5, 0.5,
-4.725679, -0.3951824, -7.380772, 1, 1.5, 0.5, 0.5,
-4.725679, -0.3951824, -7.380772, 0, 1.5, 0.5, 0.5
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
-4.725679, -4.869415, 0.183562, 0, -0.5, 0.5, 0.5,
-4.725679, -4.869415, 0.183562, 1, -0.5, 0.5, 0.5,
-4.725679, -4.869415, 0.183562, 1, 1.5, 0.5, 0.5,
-4.725679, -4.869415, 0.183562, 0, 1.5, 0.5, 0.5
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
-3, -3.8369, -5.635157,
3, -3.8369, -5.635157,
-3, -3.8369, -5.635157,
-3, -4.008986, -5.926092,
-2, -3.8369, -5.635157,
-2, -4.008986, -5.926092,
-1, -3.8369, -5.635157,
-1, -4.008986, -5.926092,
0, -3.8369, -5.635157,
0, -4.008986, -5.926092,
1, -3.8369, -5.635157,
1, -4.008986, -5.926092,
2, -3.8369, -5.635157,
2, -4.008986, -5.926092,
3, -3.8369, -5.635157,
3, -4.008986, -5.926092
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
-3, -4.353158, -6.507964, 0, -0.5, 0.5, 0.5,
-3, -4.353158, -6.507964, 1, -0.5, 0.5, 0.5,
-3, -4.353158, -6.507964, 1, 1.5, 0.5, 0.5,
-3, -4.353158, -6.507964, 0, 1.5, 0.5, 0.5,
-2, -4.353158, -6.507964, 0, -0.5, 0.5, 0.5,
-2, -4.353158, -6.507964, 1, -0.5, 0.5, 0.5,
-2, -4.353158, -6.507964, 1, 1.5, 0.5, 0.5,
-2, -4.353158, -6.507964, 0, 1.5, 0.5, 0.5,
-1, -4.353158, -6.507964, 0, -0.5, 0.5, 0.5,
-1, -4.353158, -6.507964, 1, -0.5, 0.5, 0.5,
-1, -4.353158, -6.507964, 1, 1.5, 0.5, 0.5,
-1, -4.353158, -6.507964, 0, 1.5, 0.5, 0.5,
0, -4.353158, -6.507964, 0, -0.5, 0.5, 0.5,
0, -4.353158, -6.507964, 1, -0.5, 0.5, 0.5,
0, -4.353158, -6.507964, 1, 1.5, 0.5, 0.5,
0, -4.353158, -6.507964, 0, 1.5, 0.5, 0.5,
1, -4.353158, -6.507964, 0, -0.5, 0.5, 0.5,
1, -4.353158, -6.507964, 1, -0.5, 0.5, 0.5,
1, -4.353158, -6.507964, 1, 1.5, 0.5, 0.5,
1, -4.353158, -6.507964, 0, 1.5, 0.5, 0.5,
2, -4.353158, -6.507964, 0, -0.5, 0.5, 0.5,
2, -4.353158, -6.507964, 1, -0.5, 0.5, 0.5,
2, -4.353158, -6.507964, 1, 1.5, 0.5, 0.5,
2, -4.353158, -6.507964, 0, 1.5, 0.5, 0.5,
3, -4.353158, -6.507964, 0, -0.5, 0.5, 0.5,
3, -4.353158, -6.507964, 1, -0.5, 0.5, 0.5,
3, -4.353158, -6.507964, 1, 1.5, 0.5, 0.5,
3, -4.353158, -6.507964, 0, 1.5, 0.5, 0.5
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
-3.677103, -3, -5.635157,
-3.677103, 2, -5.635157,
-3.677103, -3, -5.635157,
-3.851865, -3, -5.926092,
-3.677103, -2, -5.635157,
-3.851865, -2, -5.926092,
-3.677103, -1, -5.635157,
-3.851865, -1, -5.926092,
-3.677103, 0, -5.635157,
-3.851865, 0, -5.926092,
-3.677103, 1, -5.635157,
-3.851865, 1, -5.926092,
-3.677103, 2, -5.635157,
-3.851865, 2, -5.926092
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
-4.201391, -3, -6.507964, 0, -0.5, 0.5, 0.5,
-4.201391, -3, -6.507964, 1, -0.5, 0.5, 0.5,
-4.201391, -3, -6.507964, 1, 1.5, 0.5, 0.5,
-4.201391, -3, -6.507964, 0, 1.5, 0.5, 0.5,
-4.201391, -2, -6.507964, 0, -0.5, 0.5, 0.5,
-4.201391, -2, -6.507964, 1, -0.5, 0.5, 0.5,
-4.201391, -2, -6.507964, 1, 1.5, 0.5, 0.5,
-4.201391, -2, -6.507964, 0, 1.5, 0.5, 0.5,
-4.201391, -1, -6.507964, 0, -0.5, 0.5, 0.5,
-4.201391, -1, -6.507964, 1, -0.5, 0.5, 0.5,
-4.201391, -1, -6.507964, 1, 1.5, 0.5, 0.5,
-4.201391, -1, -6.507964, 0, 1.5, 0.5, 0.5,
-4.201391, 0, -6.507964, 0, -0.5, 0.5, 0.5,
-4.201391, 0, -6.507964, 1, -0.5, 0.5, 0.5,
-4.201391, 0, -6.507964, 1, 1.5, 0.5, 0.5,
-4.201391, 0, -6.507964, 0, 1.5, 0.5, 0.5,
-4.201391, 1, -6.507964, 0, -0.5, 0.5, 0.5,
-4.201391, 1, -6.507964, 1, -0.5, 0.5, 0.5,
-4.201391, 1, -6.507964, 1, 1.5, 0.5, 0.5,
-4.201391, 1, -6.507964, 0, 1.5, 0.5, 0.5,
-4.201391, 2, -6.507964, 0, -0.5, 0.5, 0.5,
-4.201391, 2, -6.507964, 1, -0.5, 0.5, 0.5,
-4.201391, 2, -6.507964, 1, 1.5, 0.5, 0.5,
-4.201391, 2, -6.507964, 0, 1.5, 0.5, 0.5
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
-3.677103, -3.8369, -4,
-3.677103, -3.8369, 4,
-3.677103, -3.8369, -4,
-3.851865, -4.008986, -4,
-3.677103, -3.8369, -2,
-3.851865, -4.008986, -2,
-3.677103, -3.8369, 0,
-3.851865, -4.008986, 0,
-3.677103, -3.8369, 2,
-3.851865, -4.008986, 2,
-3.677103, -3.8369, 4,
-3.851865, -4.008986, 4
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
-4.201391, -4.353158, -4, 0, -0.5, 0.5, 0.5,
-4.201391, -4.353158, -4, 1, -0.5, 0.5, 0.5,
-4.201391, -4.353158, -4, 1, 1.5, 0.5, 0.5,
-4.201391, -4.353158, -4, 0, 1.5, 0.5, 0.5,
-4.201391, -4.353158, -2, 0, -0.5, 0.5, 0.5,
-4.201391, -4.353158, -2, 1, -0.5, 0.5, 0.5,
-4.201391, -4.353158, -2, 1, 1.5, 0.5, 0.5,
-4.201391, -4.353158, -2, 0, 1.5, 0.5, 0.5,
-4.201391, -4.353158, 0, 0, -0.5, 0.5, 0.5,
-4.201391, -4.353158, 0, 1, -0.5, 0.5, 0.5,
-4.201391, -4.353158, 0, 1, 1.5, 0.5, 0.5,
-4.201391, -4.353158, 0, 0, 1.5, 0.5, 0.5,
-4.201391, -4.353158, 2, 0, -0.5, 0.5, 0.5,
-4.201391, -4.353158, 2, 1, -0.5, 0.5, 0.5,
-4.201391, -4.353158, 2, 1, 1.5, 0.5, 0.5,
-4.201391, -4.353158, 2, 0, 1.5, 0.5, 0.5,
-4.201391, -4.353158, 4, 0, -0.5, 0.5, 0.5,
-4.201391, -4.353158, 4, 1, -0.5, 0.5, 0.5,
-4.201391, -4.353158, 4, 1, 1.5, 0.5, 0.5,
-4.201391, -4.353158, 4, 0, 1.5, 0.5, 0.5
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
-3.677103, -3.8369, -5.635157,
-3.677103, 3.046535, -5.635157,
-3.677103, -3.8369, 6.002281,
-3.677103, 3.046535, 6.002281,
-3.677103, -3.8369, -5.635157,
-3.677103, -3.8369, 6.002281,
-3.677103, 3.046535, -5.635157,
-3.677103, 3.046535, 6.002281,
-3.677103, -3.8369, -5.635157,
3.313407, -3.8369, -5.635157,
-3.677103, -3.8369, 6.002281,
3.313407, -3.8369, 6.002281,
-3.677103, 3.046535, -5.635157,
3.313407, 3.046535, -5.635157,
-3.677103, 3.046535, 6.002281,
3.313407, 3.046535, 6.002281,
3.313407, -3.8369, -5.635157,
3.313407, 3.046535, -5.635157,
3.313407, -3.8369, 6.002281,
3.313407, 3.046535, 6.002281,
3.313407, -3.8369, -5.635157,
3.313407, -3.8369, 6.002281,
3.313407, 3.046535, -5.635157,
3.313407, 3.046535, 6.002281
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
var radius = 8.127719;
var distance = 36.16114;
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
mvMatrix.translate( 0.1818477, 0.3951824, -0.183562 );
mvMatrix.scale( 1.257111, 1.276666, 0.7551361 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.16114);
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
Fluvalinate<-read.table("Fluvalinate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Fluvalinate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Fluvalinate' not found
```

```r
y<-Fluvalinate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Fluvalinate' not found
```

```r
z<-Fluvalinate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Fluvalinate' not found
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
-3.575299, 0.2861582, -1.923395, 0, 0, 1, 1, 1,
-3.528357, -1.01488, -2.542564, 1, 0, 0, 1, 1,
-3.044976, 0.072609, -1.302093, 1, 0, 0, 1, 1,
-2.677364, -1.135096, 0.03821829, 1, 0, 0, 1, 1,
-2.572074, -0.4694211, -1.934112, 1, 0, 0, 1, 1,
-2.551747, -0.545755, -0.8682805, 1, 0, 0, 1, 1,
-2.427349, 0.0604249, -1.537829, 0, 0, 0, 1, 1,
-2.386533, 1.525978, -1.070989, 0, 0, 0, 1, 1,
-2.376228, -0.528544, -0.6958951, 0, 0, 0, 1, 1,
-2.371091, 0.2098713, -3.014203, 0, 0, 0, 1, 1,
-2.321813, 0.3927361, -1.283637, 0, 0, 0, 1, 1,
-2.234346, -0.3126519, -2.52585, 0, 0, 0, 1, 1,
-2.151724, -0.4721597, -2.473922, 0, 0, 0, 1, 1,
-2.140447, 0.8325675, 0.501014, 1, 1, 1, 1, 1,
-2.085793, -0.05300535, -0.8505134, 1, 1, 1, 1, 1,
-2.070407, -0.2640774, -1.863387, 1, 1, 1, 1, 1,
-2.015143, 1.375454, -0.9088783, 1, 1, 1, 1, 1,
-2.003557, 0.7160015, -0.04355957, 1, 1, 1, 1, 1,
-1.992225, -1.739407, -2.928871, 1, 1, 1, 1, 1,
-1.951758, 0.1016621, -2.923649, 1, 1, 1, 1, 1,
-1.898508, 0.6542242, -1.94191, 1, 1, 1, 1, 1,
-1.889082, -0.1848243, -1.304392, 1, 1, 1, 1, 1,
-1.848594, -1.270153, -1.56387, 1, 1, 1, 1, 1,
-1.844986, 1.536245, -2.689615, 1, 1, 1, 1, 1,
-1.835781, 0.5747664, -0.7173313, 1, 1, 1, 1, 1,
-1.810314, 0.4298999, 0.2860089, 1, 1, 1, 1, 1,
-1.80394, -0.9708998, -2.803368, 1, 1, 1, 1, 1,
-1.757867, 0.3816446, -1.648381, 1, 1, 1, 1, 1,
-1.732507, -1.478155, -1.822971, 0, 0, 1, 1, 1,
-1.725462, 2.946291, 0.6330949, 1, 0, 0, 1, 1,
-1.713023, -0.4009127, 0.4313309, 1, 0, 0, 1, 1,
-1.703268, 2.531916, -0.7488163, 1, 0, 0, 1, 1,
-1.692771, -0.3472143, -2.997319, 1, 0, 0, 1, 1,
-1.692676, -0.1367016, -1.632356, 1, 0, 0, 1, 1,
-1.692096, -0.5360158, -2.320756, 0, 0, 0, 1, 1,
-1.683292, -0.1427618, -3.323039, 0, 0, 0, 1, 1,
-1.679965, -0.3920755, -2.731383, 0, 0, 0, 1, 1,
-1.674164, 0.7482529, -0.9408972, 0, 0, 0, 1, 1,
-1.669598, -0.9353119, -1.688925, 0, 0, 0, 1, 1,
-1.661597, 0.4324663, -1.592108, 0, 0, 0, 1, 1,
-1.650829, -0.4090104, -1.366786, 0, 0, 0, 1, 1,
-1.647162, -2.27345, -2.703168, 1, 1, 1, 1, 1,
-1.644231, 0.6148037, -0.2791986, 1, 1, 1, 1, 1,
-1.632836, 0.9089051, -1.118555, 1, 1, 1, 1, 1,
-1.573726, -0.7484219, -2.193883, 1, 1, 1, 1, 1,
-1.572193, -1.261694, -3.055339, 1, 1, 1, 1, 1,
-1.569126, 0.2438988, -1.569089, 1, 1, 1, 1, 1,
-1.566383, 0.2074939, -1.390008, 1, 1, 1, 1, 1,
-1.55811, -0.6912528, -0.7367941, 1, 1, 1, 1, 1,
-1.555685, -1.534255, -1.762432, 1, 1, 1, 1, 1,
-1.55211, -2.459252, -2.933888, 1, 1, 1, 1, 1,
-1.53955, 0.316246, -2.208933, 1, 1, 1, 1, 1,
-1.532845, 0.3787336, -0.2818363, 1, 1, 1, 1, 1,
-1.531852, -0.02153667, -2.292621, 1, 1, 1, 1, 1,
-1.528065, -0.1415175, -1.283905, 1, 1, 1, 1, 1,
-1.525817, -0.5534664, -1.736617, 1, 1, 1, 1, 1,
-1.4984, -0.5379916, -0.8036192, 0, 0, 1, 1, 1,
-1.48587, 0.9365851, -2.196697, 1, 0, 0, 1, 1,
-1.474261, 0.03785175, -2.118201, 1, 0, 0, 1, 1,
-1.472239, -0.06286433, -2.100145, 1, 0, 0, 1, 1,
-1.462073, 0.3357807, -1.28785, 1, 0, 0, 1, 1,
-1.454923, -0.5804394, -3.527727, 1, 0, 0, 1, 1,
-1.448765, -0.8959209, -2.367784, 0, 0, 0, 1, 1,
-1.444294, 0.6992484, -0.4054018, 0, 0, 0, 1, 1,
-1.438984, -1.102217, -2.918775, 0, 0, 0, 1, 1,
-1.437252, 0.154628, -0.3240688, 0, 0, 0, 1, 1,
-1.436641, 0.1393985, -1.55834, 0, 0, 0, 1, 1,
-1.43161, -0.600939, -2.824646, 0, 0, 0, 1, 1,
-1.430743, 2.208732, -1.426777, 0, 0, 0, 1, 1,
-1.42714, 1.141821, -1.027288, 1, 1, 1, 1, 1,
-1.42649, 0.3999202, 0.2496751, 1, 1, 1, 1, 1,
-1.417357, -1.772669, -1.792925, 1, 1, 1, 1, 1,
-1.414528, 0.07622556, -0.8576342, 1, 1, 1, 1, 1,
-1.410943, 0.1145045, -0.1492747, 1, 1, 1, 1, 1,
-1.400641, 0.4268699, 0.648499, 1, 1, 1, 1, 1,
-1.395439, -1.044525, -0.08474661, 1, 1, 1, 1, 1,
-1.392349, 0.2922372, -1.973218, 1, 1, 1, 1, 1,
-1.371196, -0.3257199, -0.8220565, 1, 1, 1, 1, 1,
-1.370488, 0.9596749, 0.2839528, 1, 1, 1, 1, 1,
-1.364845, 0.4195519, 0.005109257, 1, 1, 1, 1, 1,
-1.35395, 1.829461, -0.1207883, 1, 1, 1, 1, 1,
-1.348981, 1.904751, -2.164346, 1, 1, 1, 1, 1,
-1.346655, -0.1345897, -3.301027, 1, 1, 1, 1, 1,
-1.334657, -0.6521635, -2.895221, 1, 1, 1, 1, 1,
-1.333813, 0.4810551, -0.4731689, 0, 0, 1, 1, 1,
-1.327056, -0.3685995, -1.562056, 1, 0, 0, 1, 1,
-1.317696, 0.3359023, -1.693352, 1, 0, 0, 1, 1,
-1.310391, -1.268436, -2.730487, 1, 0, 0, 1, 1,
-1.307685, 0.3078461, 0.9706928, 1, 0, 0, 1, 1,
-1.305854, 0.02029492, -1.393972, 1, 0, 0, 1, 1,
-1.300304, 2.134869, -0.2906669, 0, 0, 0, 1, 1,
-1.295247, -0.5899817, -2.058099, 0, 0, 0, 1, 1,
-1.293817, -1.0952, -1.667041, 0, 0, 0, 1, 1,
-1.27719, 0.5132328, -1.38512, 0, 0, 0, 1, 1,
-1.272226, 0.9936235, -1.434194, 0, 0, 0, 1, 1,
-1.271541, -0.5803298, -3.245239, 0, 0, 0, 1, 1,
-1.260368, 1.469209, 0.7586575, 0, 0, 0, 1, 1,
-1.253808, 0.3902802, -2.321045, 1, 1, 1, 1, 1,
-1.248151, 0.2260017, -1.454792, 1, 1, 1, 1, 1,
-1.233611, 0.2123763, -0.2226779, 1, 1, 1, 1, 1,
-1.232662, -0.3639048, -1.566522, 1, 1, 1, 1, 1,
-1.229217, -0.5444307, -4.558491, 1, 1, 1, 1, 1,
-1.216923, -1.559273, -3.237463, 1, 1, 1, 1, 1,
-1.215535, -0.5761894, -2.677024, 1, 1, 1, 1, 1,
-1.198899, -0.02657643, -0.03355807, 1, 1, 1, 1, 1,
-1.185917, -0.8486915, -1.557753, 1, 1, 1, 1, 1,
-1.185711, 0.3501843, -1.752499, 1, 1, 1, 1, 1,
-1.182589, -0.2041737, -2.113504, 1, 1, 1, 1, 1,
-1.180306, 0.06782679, -1.164382, 1, 1, 1, 1, 1,
-1.178512, -0.3682784, -2.574383, 1, 1, 1, 1, 1,
-1.167784, -1.538359, -3.527128, 1, 1, 1, 1, 1,
-1.161687, 0.1937087, -1.831901, 1, 1, 1, 1, 1,
-1.161319, 0.1017671, -3.776759, 0, 0, 1, 1, 1,
-1.15325, 0.39107, -0.8721674, 1, 0, 0, 1, 1,
-1.151763, 0.1270631, -1.052707, 1, 0, 0, 1, 1,
-1.147051, 0.7093733, -2.256183, 1, 0, 0, 1, 1,
-1.139164, 0.3735631, -0.9868889, 1, 0, 0, 1, 1,
-1.138007, -1.87227, -2.207047, 1, 0, 0, 1, 1,
-1.13419, -0.2876448, -0.7494087, 0, 0, 0, 1, 1,
-1.129827, -0.5953303, -1.110031, 0, 0, 0, 1, 1,
-1.126378, 0.3964748, -1.675434, 0, 0, 0, 1, 1,
-1.120855, 0.4232255, -0.5902941, 0, 0, 0, 1, 1,
-1.115587, -1.235892, -4.450432, 0, 0, 0, 1, 1,
-1.110655, 0.2884325, -0.4760414, 0, 0, 0, 1, 1,
-1.10454, -0.9913599, -0.7686336, 0, 0, 0, 1, 1,
-1.095192, 0.1396125, -3.376505, 1, 1, 1, 1, 1,
-1.09051, -1.036495, -2.908194, 1, 1, 1, 1, 1,
-1.087876, -0.5552173, -2.620949, 1, 1, 1, 1, 1,
-1.08712, -2.58133, -2.667195, 1, 1, 1, 1, 1,
-1.086064, 1.927116, -0.04398317, 1, 1, 1, 1, 1,
-1.085326, -0.2117146, -2.880115, 1, 1, 1, 1, 1,
-1.075626, 0.2450705, -1.478129, 1, 1, 1, 1, 1,
-1.069177, 0.1123975, -1.660817, 1, 1, 1, 1, 1,
-1.0587, 1.12172, -0.6275136, 1, 1, 1, 1, 1,
-1.046964, -0.2449185, -1.45487, 1, 1, 1, 1, 1,
-1.04334, 0.06432055, -0.9212484, 1, 1, 1, 1, 1,
-1.041329, 0.3941683, -1.552872, 1, 1, 1, 1, 1,
-1.039263, 0.03060405, -1.063755, 1, 1, 1, 1, 1,
-1.03868, -0.05425619, -1.230767, 1, 1, 1, 1, 1,
-1.035881, -1.501147, -3.068983, 1, 1, 1, 1, 1,
-1.035162, 0.7164066, -0.4007939, 0, 0, 1, 1, 1,
-1.033573, 1.551624, -2.58119, 1, 0, 0, 1, 1,
-1.029388, 0.6647765, 0.5447187, 1, 0, 0, 1, 1,
-1.026458, -1.112741, -0.9881309, 1, 0, 0, 1, 1,
-1.024427, 0.1622283, -2.800498, 1, 0, 0, 1, 1,
-1.019875, -0.3381219, -4.042308, 1, 0, 0, 1, 1,
-1.018869, -3.736656, -1.400331, 0, 0, 0, 1, 1,
-1.018672, -1.333948, -3.458096, 0, 0, 0, 1, 1,
-1.018645, 1.360138, -1.837061, 0, 0, 0, 1, 1,
-1.017847, -0.460512, -3.166009, 0, 0, 0, 1, 1,
-1.003886, -1.202745, -3.146664, 0, 0, 0, 1, 1,
-0.999413, 1.22002, -0.2462487, 0, 0, 0, 1, 1,
-0.9979073, -0.05103243, -3.570179, 0, 0, 0, 1, 1,
-0.9967811, -0.7088189, -2.116079, 1, 1, 1, 1, 1,
-0.9937873, 0.6390419, -3.696878, 1, 1, 1, 1, 1,
-0.9913414, 1.597156, -0.7269163, 1, 1, 1, 1, 1,
-0.9884743, -0.1125316, -2.721292, 1, 1, 1, 1, 1,
-0.9824067, -0.7151639, -3.118818, 1, 1, 1, 1, 1,
-0.9821491, -0.2283596, -1.270719, 1, 1, 1, 1, 1,
-0.9777122, -1.170279, -3.283526, 1, 1, 1, 1, 1,
-0.9663442, 0.1394272, 0.2578015, 1, 1, 1, 1, 1,
-0.9640546, -1.289077, -0.92011, 1, 1, 1, 1, 1,
-0.9632487, 0.8588688, -2.187406, 1, 1, 1, 1, 1,
-0.9631996, 0.008875459, -0.646853, 1, 1, 1, 1, 1,
-0.9621291, -1.618681, -2.230928, 1, 1, 1, 1, 1,
-0.9603191, 2.304803, -2.414661, 1, 1, 1, 1, 1,
-0.9483432, -1.911161, -2.645399, 1, 1, 1, 1, 1,
-0.9477041, 0.1864781, 0.7370161, 1, 1, 1, 1, 1,
-0.9451458, 1.72188, 0.4437507, 0, 0, 1, 1, 1,
-0.9440026, 0.3415209, -0.5081874, 1, 0, 0, 1, 1,
-0.937473, 0.3651939, -2.495737, 1, 0, 0, 1, 1,
-0.9366468, -1.645296, -3.264066, 1, 0, 0, 1, 1,
-0.9363393, 0.2054021, 1.14915, 1, 0, 0, 1, 1,
-0.9349329, 0.5077451, -3.085323, 1, 0, 0, 1, 1,
-0.9339101, 0.3098135, -1.301562, 0, 0, 0, 1, 1,
-0.9259871, -2.103117, -2.775539, 0, 0, 0, 1, 1,
-0.9214417, -1.706919, -2.831708, 0, 0, 0, 1, 1,
-0.9197156, -3.532189, -3.937258, 0, 0, 0, 1, 1,
-0.9183719, 0.969802, -1.760847, 0, 0, 0, 1, 1,
-0.9143756, 2.638535, 1.190591, 0, 0, 0, 1, 1,
-0.9122842, 0.1591173, -1.670019, 0, 0, 0, 1, 1,
-0.9009428, 0.5300829, -0.5795255, 1, 1, 1, 1, 1,
-0.8877336, 0.4385739, -1.570416, 1, 1, 1, 1, 1,
-0.887338, 1.443101, -0.09728077, 1, 1, 1, 1, 1,
-0.8752426, 0.4505821, -1.081845, 1, 1, 1, 1, 1,
-0.8722691, -0.01808502, -0.7218927, 1, 1, 1, 1, 1,
-0.8712282, 0.5327162, -2.995098, 1, 1, 1, 1, 1,
-0.8695391, 0.9540678, 0.2914447, 1, 1, 1, 1, 1,
-0.8693727, 0.1190045, -2.179013, 1, 1, 1, 1, 1,
-0.8691546, -0.8925022, -1.986908, 1, 1, 1, 1, 1,
-0.8617523, -0.1724901, -3.477145, 1, 1, 1, 1, 1,
-0.8558042, 0.5623668, -1.186882, 1, 1, 1, 1, 1,
-0.8522491, 2.246069, -2.109664, 1, 1, 1, 1, 1,
-0.8469467, 1.525384, -0.2203415, 1, 1, 1, 1, 1,
-0.8414996, 0.8607431, -0.4422617, 1, 1, 1, 1, 1,
-0.8407432, -0.2127623, -1.559278, 1, 1, 1, 1, 1,
-0.8402745, -1.673567, -3.234088, 0, 0, 1, 1, 1,
-0.8396243, -0.1550633, -2.07961, 1, 0, 0, 1, 1,
-0.8338303, 0.07172441, -1.069302, 1, 0, 0, 1, 1,
-0.8281922, 1.689853, -1.85874, 1, 0, 0, 1, 1,
-0.8230892, 0.4192522, -2.259027, 1, 0, 0, 1, 1,
-0.8185143, 0.8434498, -2.025728, 1, 0, 0, 1, 1,
-0.8169246, -0.3232138, -1.215449, 0, 0, 0, 1, 1,
-0.8150558, 0.5306817, -0.7052482, 0, 0, 0, 1, 1,
-0.8119981, -0.8822266, -1.748055, 0, 0, 0, 1, 1,
-0.810779, -1.265689, -3.999412, 0, 0, 0, 1, 1,
-0.8094898, -1.462854, -5.354679, 0, 0, 0, 1, 1,
-0.8065255, -0.0494694, -2.132457, 0, 0, 0, 1, 1,
-0.8061289, 1.026651, -1.250212, 0, 0, 0, 1, 1,
-0.8053843, -0.5112786, -1.72525, 1, 1, 1, 1, 1,
-0.8008083, 0.2916004, -0.5178688, 1, 1, 1, 1, 1,
-0.7967751, -0.5101075, -2.092128, 1, 1, 1, 1, 1,
-0.7925378, 0.8884002, -0.1850015, 1, 1, 1, 1, 1,
-0.7925035, -0.3810479, -2.417642, 1, 1, 1, 1, 1,
-0.7918944, 1.291823, 0.4623795, 1, 1, 1, 1, 1,
-0.7886304, 0.5056277, -1.335869, 1, 1, 1, 1, 1,
-0.7852483, 0.884757, 0.5098464, 1, 1, 1, 1, 1,
-0.7848014, -0.8500929, -2.986452, 1, 1, 1, 1, 1,
-0.7803379, 0.7956156, -2.048376, 1, 1, 1, 1, 1,
-0.7712873, -0.2753843, -1.112873, 1, 1, 1, 1, 1,
-0.7699268, 0.2441454, -0.06308614, 1, 1, 1, 1, 1,
-0.7668658, -0.2643653, -0.4033923, 1, 1, 1, 1, 1,
-0.759205, 0.7332441, 0.05438412, 1, 1, 1, 1, 1,
-0.7591266, 0.9649737, 0.6065778, 1, 1, 1, 1, 1,
-0.7559957, -0.4055505, -3.132917, 0, 0, 1, 1, 1,
-0.7529211, -0.8258346, -2.956152, 1, 0, 0, 1, 1,
-0.7527682, -1.067914, -3.109919, 1, 0, 0, 1, 1,
-0.7513263, 0.1154613, -2.776981, 1, 0, 0, 1, 1,
-0.7493452, -0.4646912, -2.939272, 1, 0, 0, 1, 1,
-0.7461837, 0.2765374, -1.774279, 1, 0, 0, 1, 1,
-0.7434089, 1.506625, -0.2651085, 0, 0, 0, 1, 1,
-0.7399282, -0.8490971, -1.335535, 0, 0, 0, 1, 1,
-0.7372955, -0.1155912, -0.1675143, 0, 0, 0, 1, 1,
-0.7359326, 0.7697828, -2.624941, 0, 0, 0, 1, 1,
-0.732673, -1.046042, -2.09338, 0, 0, 0, 1, 1,
-0.7320646, -1.848026, -2.439242, 0, 0, 0, 1, 1,
-0.7266476, 0.5452761, 0.3750984, 0, 0, 0, 1, 1,
-0.7138063, -2.048634, -2.992389, 1, 1, 1, 1, 1,
-0.7126593, -0.5067338, -2.07895, 1, 1, 1, 1, 1,
-0.7047161, 0.4810501, 0.2305139, 1, 1, 1, 1, 1,
-0.7032046, 1.236857, -0.2827436, 1, 1, 1, 1, 1,
-0.7005072, -1.327945, -3.232529, 1, 1, 1, 1, 1,
-0.6990622, -0.3474303, -1.811931, 1, 1, 1, 1, 1,
-0.6945034, 0.1659008, -0.664961, 1, 1, 1, 1, 1,
-0.6929094, 1.011467, -0.05022889, 1, 1, 1, 1, 1,
-0.6921432, -0.4193339, -3.15465, 1, 1, 1, 1, 1,
-0.6915946, 1.379176, -1.269682, 1, 1, 1, 1, 1,
-0.6874752, 1.366481, -0.3396455, 1, 1, 1, 1, 1,
-0.6840633, -1.102338, -1.710165, 1, 1, 1, 1, 1,
-0.6695842, -1.169134, -2.682286, 1, 1, 1, 1, 1,
-0.6641308, -0.4311683, -0.7278877, 1, 1, 1, 1, 1,
-0.6571442, 0.2452838, -0.07136451, 1, 1, 1, 1, 1,
-0.6569885, -0.9428043, -1.287382, 0, 0, 1, 1, 1,
-0.6551567, 1.754477, -2.97616, 1, 0, 0, 1, 1,
-0.6537799, 0.02047559, -1.278085, 1, 0, 0, 1, 1,
-0.6508027, -1.308489, -1.780664, 1, 0, 0, 1, 1,
-0.6504839, 1.672213, -0.9760132, 1, 0, 0, 1, 1,
-0.6490348, -1.41261, -2.785664, 1, 0, 0, 1, 1,
-0.6483496, -0.5435728, -3.38926, 0, 0, 0, 1, 1,
-0.6471944, -1.002733, -4.689096, 0, 0, 0, 1, 1,
-0.647018, -0.4838525, -1.838839, 0, 0, 0, 1, 1,
-0.6459813, -0.8301978, -4.594403, 0, 0, 0, 1, 1,
-0.6403582, -0.9275606, -1.649592, 0, 0, 0, 1, 1,
-0.6387665, 0.828824, -1.3539, 0, 0, 0, 1, 1,
-0.6364409, 1.820167, -1.723406, 0, 0, 0, 1, 1,
-0.6358051, -1.917592, -4.020576, 1, 1, 1, 1, 1,
-0.6332515, 0.3389272, 0.1705491, 1, 1, 1, 1, 1,
-0.629916, 1.965577, 0.1372529, 1, 1, 1, 1, 1,
-0.6298574, -1.291026, -3.352411, 1, 1, 1, 1, 1,
-0.6254649, -0.9736032, -1.799167, 1, 1, 1, 1, 1,
-0.6251055, 0.01400881, -0.9350638, 1, 1, 1, 1, 1,
-0.6215734, 2.638704, 0.115612, 1, 1, 1, 1, 1,
-0.6131107, 0.3840958, -1.444869, 1, 1, 1, 1, 1,
-0.6114377, 0.8260849, -2.048947, 1, 1, 1, 1, 1,
-0.607224, -1.135463, -3.766689, 1, 1, 1, 1, 1,
-0.6048701, -0.1313071, -0.4573762, 1, 1, 1, 1, 1,
-0.603313, 1.119199, -1.062671, 1, 1, 1, 1, 1,
-0.6010706, 0.393596, -1.036286, 1, 1, 1, 1, 1,
-0.598455, -0.03743881, -1.690784, 1, 1, 1, 1, 1,
-0.5980847, -0.2747068, -2.390976, 1, 1, 1, 1, 1,
-0.5920516, 0.5391445, -0.3945805, 0, 0, 1, 1, 1,
-0.591556, -0.6909744, -2.287029, 1, 0, 0, 1, 1,
-0.5894011, 0.9199341, -2.192205, 1, 0, 0, 1, 1,
-0.586049, -0.2340988, -1.26729, 1, 0, 0, 1, 1,
-0.5853067, -0.2646623, -1.155691, 1, 0, 0, 1, 1,
-0.5823714, 0.6962812, -2.903958, 1, 0, 0, 1, 1,
-0.5819175, -1.481065, -2.018486, 0, 0, 0, 1, 1,
-0.5704721, -0.5831247, -1.127809, 0, 0, 0, 1, 1,
-0.5656158, 1.407003, -0.7409405, 0, 0, 0, 1, 1,
-0.5639619, 0.3889206, -2.790788, 0, 0, 0, 1, 1,
-0.560477, -1.023191, -1.448556, 0, 0, 0, 1, 1,
-0.5571148, 1.144705, -1.599125, 0, 0, 0, 1, 1,
-0.5543967, -1.153096, -2.456782, 0, 0, 0, 1, 1,
-0.5512121, 0.7034624, -0.7018592, 1, 1, 1, 1, 1,
-0.5466089, 0.07827616, -0.9520649, 1, 1, 1, 1, 1,
-0.5446214, -0.5775282, -2.008514, 1, 1, 1, 1, 1,
-0.5435943, 0.175734, -0.1284878, 1, 1, 1, 1, 1,
-0.5431682, -3.125666, -3.798471, 1, 1, 1, 1, 1,
-0.5337895, -0.6092722, -0.8777972, 1, 1, 1, 1, 1,
-0.5312303, 0.1908952, -1.105437, 1, 1, 1, 1, 1,
-0.52445, -0.1249635, -1.601391, 1, 1, 1, 1, 1,
-0.5199625, -2.966327, -2.306073, 1, 1, 1, 1, 1,
-0.5191919, -0.3105798, -3.448599, 1, 1, 1, 1, 1,
-0.5158243, 0.5250911, 1.641043, 1, 1, 1, 1, 1,
-0.5156084, 1.570774, 0.153794, 1, 1, 1, 1, 1,
-0.5121528, 1.222315, 0.1513627, 1, 1, 1, 1, 1,
-0.5098257, -2.017991, -2.432167, 1, 1, 1, 1, 1,
-0.5089231, 1.266619, 0.02341183, 1, 1, 1, 1, 1,
-0.504517, -1.251006, -2.278331, 0, 0, 1, 1, 1,
-0.4991615, 0.3867211, -0.2163512, 1, 0, 0, 1, 1,
-0.4977281, 0.2729151, -1.480912, 1, 0, 0, 1, 1,
-0.4931037, 0.9104933, -0.1635139, 1, 0, 0, 1, 1,
-0.4888784, -0.8585504, -1.929318, 1, 0, 0, 1, 1,
-0.4778672, 0.3052998, -0.7067026, 1, 0, 0, 1, 1,
-0.4754664, 1.229062, 0.5785785, 0, 0, 0, 1, 1,
-0.4746802, 1.631083, 1.899491, 0, 0, 0, 1, 1,
-0.4727802, 0.7194846, -0.8415042, 0, 0, 0, 1, 1,
-0.4726995, 0.1529819, -2.361376, 0, 0, 0, 1, 1,
-0.4693674, 0.1550443, -2.787983, 0, 0, 0, 1, 1,
-0.4687795, 0.9304351, -0.06785846, 0, 0, 0, 1, 1,
-0.4645841, 0.3177598, -0.9981055, 0, 0, 0, 1, 1,
-0.4637349, -1.734896, -3.830351, 1, 1, 1, 1, 1,
-0.4616497, 0.7207774, -0.6186096, 1, 1, 1, 1, 1,
-0.4517595, 0.1143051, -2.11543, 1, 1, 1, 1, 1,
-0.4492208, -0.5115861, -2.270599, 1, 1, 1, 1, 1,
-0.4490109, -0.04838595, -1.753115, 1, 1, 1, 1, 1,
-0.4467908, 0.04079603, -3.19028, 1, 1, 1, 1, 1,
-0.4457272, -0.7960434, -2.217392, 1, 1, 1, 1, 1,
-0.4442539, 0.3168987, -2.163511, 1, 1, 1, 1, 1,
-0.4439655, -0.8906485, -2.705736, 1, 1, 1, 1, 1,
-0.4412652, -0.9261456, -3.931812, 1, 1, 1, 1, 1,
-0.4366744, 1.349964, 0.02855611, 1, 1, 1, 1, 1,
-0.4366485, -0.1338104, -1.227518, 1, 1, 1, 1, 1,
-0.4335758, -0.1628947, -1.415932, 1, 1, 1, 1, 1,
-0.4333753, -0.006348995, -1.533856, 1, 1, 1, 1, 1,
-0.4323699, 2.716874, -0.06286357, 1, 1, 1, 1, 1,
-0.4298254, 0.1639532, 0.1926866, 0, 0, 1, 1, 1,
-0.4201697, 1.111299, -1.270311, 1, 0, 0, 1, 1,
-0.4192899, 1.089816, 0.870352, 1, 0, 0, 1, 1,
-0.4123413, -1.025863, -3.220625, 1, 0, 0, 1, 1,
-0.4072276, 0.5820463, 2.298855, 1, 0, 0, 1, 1,
-0.405815, -0.1136338, -1.877674, 1, 0, 0, 1, 1,
-0.4044921, 1.278305, 0.06861141, 0, 0, 0, 1, 1,
-0.4029577, -1.619565, -3.856017, 0, 0, 0, 1, 1,
-0.3970759, 0.5681511, -1.017924, 0, 0, 0, 1, 1,
-0.3927581, -0.3416974, -3.008277, 0, 0, 0, 1, 1,
-0.389368, 0.1682845, -1.29619, 0, 0, 0, 1, 1,
-0.3882491, -0.9555361, -1.218612, 0, 0, 0, 1, 1,
-0.3849773, -0.3143986, -1.936661, 0, 0, 0, 1, 1,
-0.3842187, -0.1147901, -1.100013, 1, 1, 1, 1, 1,
-0.3837488, -0.8060108, -3.188305, 1, 1, 1, 1, 1,
-0.3809995, 0.2992392, 0.2381671, 1, 1, 1, 1, 1,
-0.3800683, 0.4158373, -0.2428033, 1, 1, 1, 1, 1,
-0.3778881, -0.4902063, -2.896003, 1, 1, 1, 1, 1,
-0.3659539, -0.7218149, -2.485966, 1, 1, 1, 1, 1,
-0.3657355, 1.22935, -0.3776895, 1, 1, 1, 1, 1,
-0.3638399, 1.295639, -0.6335865, 1, 1, 1, 1, 1,
-0.3566581, -0.2386408, -0.7545822, 1, 1, 1, 1, 1,
-0.3543751, -1.012695, -0.8142915, 1, 1, 1, 1, 1,
-0.3528066, -1.815528, -2.260394, 1, 1, 1, 1, 1,
-0.3501049, -1.986861, -3.190841, 1, 1, 1, 1, 1,
-0.3443263, 0.2485223, 0.5231041, 1, 1, 1, 1, 1,
-0.3332301, 0.1582339, -0.7436964, 1, 1, 1, 1, 1,
-0.3272786, 0.8534577, -1.245546, 1, 1, 1, 1, 1,
-0.3266189, -1.012826, -1.804975, 0, 0, 1, 1, 1,
-0.3234825, 0.4217407, 1.018227, 1, 0, 0, 1, 1,
-0.3208934, 0.7987042, 0.5417995, 1, 0, 0, 1, 1,
-0.3168869, -0.6747307, -3.376089, 1, 0, 0, 1, 1,
-0.3156835, 1.029812, -0.7940406, 1, 0, 0, 1, 1,
-0.3054233, 1.24956, -1.724472, 1, 0, 0, 1, 1,
-0.3041525, 0.3994752, 0.8383938, 0, 0, 0, 1, 1,
-0.3000651, 0.05978863, -2.311525, 0, 0, 0, 1, 1,
-0.2977587, -1.593711, -3.339308, 0, 0, 0, 1, 1,
-0.2966428, 0.5042041, -1.64873, 0, 0, 0, 1, 1,
-0.2945286, -0.4426548, -2.167096, 0, 0, 0, 1, 1,
-0.2927528, -0.2243183, -1.359473, 0, 0, 0, 1, 1,
-0.2876241, -0.5200222, -2.499566, 0, 0, 0, 1, 1,
-0.2781768, 0.4579617, -0.6375698, 1, 1, 1, 1, 1,
-0.2776577, -1.828533, -2.591943, 1, 1, 1, 1, 1,
-0.2760883, -0.9139764, -2.602659, 1, 1, 1, 1, 1,
-0.2756627, -0.1698641, -2.951299, 1, 1, 1, 1, 1,
-0.2717217, -0.2176618, -1.865335, 1, 1, 1, 1, 1,
-0.2714044, 1.412944, -1.527893, 1, 1, 1, 1, 1,
-0.2711341, 0.1993496, -0.3737637, 1, 1, 1, 1, 1,
-0.2705145, -1.919998, -4.292109, 1, 1, 1, 1, 1,
-0.2644052, 1.424668, -0.685136, 1, 1, 1, 1, 1,
-0.2636223, 0.2243826, -0.05592468, 1, 1, 1, 1, 1,
-0.2633329, -0.9875769, -2.447979, 1, 1, 1, 1, 1,
-0.2610982, -0.5005608, -2.897362, 1, 1, 1, 1, 1,
-0.2603003, -0.6414559, -2.010563, 1, 1, 1, 1, 1,
-0.2601767, -0.3312318, -4.336881, 1, 1, 1, 1, 1,
-0.25768, 1.769379, -0.5834084, 1, 1, 1, 1, 1,
-0.2571676, 0.7315128, 0.9641301, 0, 0, 1, 1, 1,
-0.2552694, 1.044674, -2.715055, 1, 0, 0, 1, 1,
-0.2546296, -0.7795167, -2.91512, 1, 0, 0, 1, 1,
-0.2504414, -0.405477, -3.037123, 1, 0, 0, 1, 1,
-0.2479258, -0.1972241, -2.497687, 1, 0, 0, 1, 1,
-0.247426, 0.3451689, -1.025296, 1, 0, 0, 1, 1,
-0.2458073, -0.8940942, -1.641792, 0, 0, 0, 1, 1,
-0.2457748, 0.4717591, -1.271955, 0, 0, 0, 1, 1,
-0.2411121, -1.044903, -0.9492078, 0, 0, 0, 1, 1,
-0.2395881, -0.5124409, 0.5594118, 0, 0, 0, 1, 1,
-0.23898, -0.004791389, -2.180384, 0, 0, 0, 1, 1,
-0.2387993, 1.827765, -0.4039058, 0, 0, 0, 1, 1,
-0.2323665, -0.3465254, -0.4674791, 0, 0, 0, 1, 1,
-0.2317448, 1.684259, 0.9017077, 1, 1, 1, 1, 1,
-0.2285486, -1.7625, -4.059844, 1, 1, 1, 1, 1,
-0.2266598, 0.4030067, -1.639188, 1, 1, 1, 1, 1,
-0.2207052, 1.522778, 1.052853, 1, 1, 1, 1, 1,
-0.2174002, 2.158107, -0.5246276, 1, 1, 1, 1, 1,
-0.2113918, -1.431316, -1.373896, 1, 1, 1, 1, 1,
-0.2091893, -0.3914153, -1.926682, 1, 1, 1, 1, 1,
-0.2063353, -0.4484398, -1.968709, 1, 1, 1, 1, 1,
-0.1960903, 0.006539403, -2.023645, 1, 1, 1, 1, 1,
-0.1948663, 0.4115525, -1.496647, 1, 1, 1, 1, 1,
-0.1898896, -1.8479, -3.413097, 1, 1, 1, 1, 1,
-0.1859458, 1.914337, 1.282228, 1, 1, 1, 1, 1,
-0.1849649, -1.305015, -1.830022, 1, 1, 1, 1, 1,
-0.1821487, -0.8029517, -3.073652, 1, 1, 1, 1, 1,
-0.1798386, 1.143525, -1.203488, 1, 1, 1, 1, 1,
-0.1774393, -0.0501052, -1.925183, 0, 0, 1, 1, 1,
-0.1734834, -0.3041243, -2.91133, 1, 0, 0, 1, 1,
-0.1682267, -1.149423, -3.624492, 1, 0, 0, 1, 1,
-0.1676895, -1.423409, -2.696805, 1, 0, 0, 1, 1,
-0.1598124, 0.1862216, -1.00305, 1, 0, 0, 1, 1,
-0.1594142, 1.301206, 1.22165, 1, 0, 0, 1, 1,
-0.1566872, -0.8571624, -2.962682, 0, 0, 0, 1, 1,
-0.1555311, 0.9849902, 0.3134833, 0, 0, 0, 1, 1,
-0.1552675, -0.2348459, -0.3818864, 0, 0, 0, 1, 1,
-0.1542316, -0.7326162, -3.767164, 0, 0, 0, 1, 1,
-0.1530504, -0.5283632, -0.1036194, 0, 0, 0, 1, 1,
-0.1520725, 1.204299, -0.3870221, 0, 0, 0, 1, 1,
-0.1509582, -0.09119832, -1.252724, 0, 0, 0, 1, 1,
-0.1505592, -1.361041, -3.915066, 1, 1, 1, 1, 1,
-0.1503433, 0.08806063, 0.280615, 1, 1, 1, 1, 1,
-0.1503346, -0.9420697, -4.449536, 1, 1, 1, 1, 1,
-0.1476705, -0.09265148, -3.729393, 1, 1, 1, 1, 1,
-0.1469833, -0.35551, -2.045177, 1, 1, 1, 1, 1,
-0.1399349, 1.323456, -0.7266446, 1, 1, 1, 1, 1,
-0.1384909, -0.05324802, -3.285756, 1, 1, 1, 1, 1,
-0.1375387, -0.5835518, -1.533244, 1, 1, 1, 1, 1,
-0.1350814, 0.1686355, -0.2852494, 1, 1, 1, 1, 1,
-0.1350766, -2.462417, -2.560011, 1, 1, 1, 1, 1,
-0.1303966, -0.814109, -4.353168, 1, 1, 1, 1, 1,
-0.1266281, 2.063508, 0.1160427, 1, 1, 1, 1, 1,
-0.1246963, -1.380615, -1.825306, 1, 1, 1, 1, 1,
-0.1232085, -1.231061, -3.701195, 1, 1, 1, 1, 1,
-0.1205691, 0.7169937, 2.551339, 1, 1, 1, 1, 1,
-0.1199229, 0.807165, -0.4810358, 0, 0, 1, 1, 1,
-0.1183386, -0.1524858, -2.644247, 1, 0, 0, 1, 1,
-0.1160863, 0.2887716, -1.363496, 1, 0, 0, 1, 1,
-0.1125004, -1.058926, -2.83295, 1, 0, 0, 1, 1,
-0.1087049, -0.6701494, -2.437652, 1, 0, 0, 1, 1,
-0.0986541, -0.2299573, -4.53452, 1, 0, 0, 1, 1,
-0.09751558, 0.1862195, -0.2770313, 0, 0, 0, 1, 1,
-0.09705087, -0.6438485, -2.401244, 0, 0, 0, 1, 1,
-0.09602719, 0.116194, -0.7478899, 0, 0, 0, 1, 1,
-0.0909968, 1.314223, -1.551725, 0, 0, 0, 1, 1,
-0.09033924, -0.09545304, -1.856785, 0, 0, 0, 1, 1,
-0.07873653, -1.269685, -2.773199, 0, 0, 0, 1, 1,
-0.07522248, -0.4279328, -3.741445, 0, 0, 0, 1, 1,
-0.06993698, 1.036934, -0.3078862, 1, 1, 1, 1, 1,
-0.06839816, 1.882033, -0.761456, 1, 1, 1, 1, 1,
-0.06676524, 0.6937765, 3.841693, 1, 1, 1, 1, 1,
-0.06173059, -0.0549534, -1.354485, 1, 1, 1, 1, 1,
-0.06065692, 0.4355485, 0.1188449, 1, 1, 1, 1, 1,
-0.05949843, 0.7956063, 0.3205371, 1, 1, 1, 1, 1,
-0.05825766, 1.208093, -0.3659023, 1, 1, 1, 1, 1,
-0.05636173, 0.3757491, 0.4494015, 1, 1, 1, 1, 1,
-0.0447339, 0.2686573, -0.3711273, 1, 1, 1, 1, 1,
-0.0446623, 1.012237, -0.5148985, 1, 1, 1, 1, 1,
-0.04361949, -0.4071831, -2.406957, 1, 1, 1, 1, 1,
-0.04293799, -0.3297609, -1.893275, 1, 1, 1, 1, 1,
-0.0417049, 1.769948, 0.04318064, 1, 1, 1, 1, 1,
-0.0407331, -0.3402539, -4.533471, 1, 1, 1, 1, 1,
-0.04006841, 0.06399892, -1.340563, 1, 1, 1, 1, 1,
-0.04003169, -2.104904, -2.73324, 0, 0, 1, 1, 1,
-0.0364709, -1.367463, -3.388333, 1, 0, 0, 1, 1,
-0.036364, 0.9900082, -0.2840285, 1, 0, 0, 1, 1,
-0.03178478, -0.3190631, -5.465679, 1, 0, 0, 1, 1,
-0.02768423, 0.05710102, 0.4799376, 1, 0, 0, 1, 1,
-0.0272078, -0.8471202, -3.849374, 1, 0, 0, 1, 1,
-0.02638618, -0.1519568, -1.09301, 0, 0, 0, 1, 1,
-0.02245065, -0.3335396, -3.827728, 0, 0, 0, 1, 1,
-0.01553084, -1.558241, -2.607009, 0, 0, 0, 1, 1,
-0.01345702, 0.2746083, -1.135671, 0, 0, 0, 1, 1,
-0.01342245, -1.34692, -2.800966, 0, 0, 0, 1, 1,
-0.01268762, -1.438956, -3.047547, 0, 0, 0, 1, 1,
-0.01114007, -0.4579764, -3.597932, 0, 0, 0, 1, 1,
-0.01069255, -1.593797, -5.141294, 1, 1, 1, 1, 1,
-0.009909709, -1.219473, -2.615722, 1, 1, 1, 1, 1,
-0.004256467, 0.3906716, -0.6371126, 1, 1, 1, 1, 1,
-0.001418079, 0.03296747, -0.1520299, 1, 1, 1, 1, 1,
-1.556482e-06, 0.4932112, 0.3307392, 1, 1, 1, 1, 1,
0.000104791, -0.6284328, 2.989503, 1, 1, 1, 1, 1,
0.01214084, 0.5221313, -1.302558, 1, 1, 1, 1, 1,
0.01359163, 0.2849914, 0.09289584, 1, 1, 1, 1, 1,
0.01551249, -1.675253, 4.465633, 1, 1, 1, 1, 1,
0.01740371, -0.1638583, 2.348168, 1, 1, 1, 1, 1,
0.01804514, -0.8601805, 1.302691, 1, 1, 1, 1, 1,
0.0183979, -1.199086, 3.264897, 1, 1, 1, 1, 1,
0.02083367, -1.390563, 1.119361, 1, 1, 1, 1, 1,
0.03184014, 0.5818816, -1.370347, 1, 1, 1, 1, 1,
0.03337102, 0.5480929, 0.9671713, 1, 1, 1, 1, 1,
0.03636118, 0.4229554, -2.003927, 0, 0, 1, 1, 1,
0.04679652, 1.038212, 0.04444625, 1, 0, 0, 1, 1,
0.04758877, 1.192703, -2.021812, 1, 0, 0, 1, 1,
0.05647589, -0.7583837, 2.702901, 1, 0, 0, 1, 1,
0.05884935, -0.07593682, 1.819638, 1, 0, 0, 1, 1,
0.05937076, -0.2166626, 4.432945, 1, 0, 0, 1, 1,
0.06102451, 0.3544358, -0.6718378, 0, 0, 0, 1, 1,
0.06648206, 0.6792955, -0.6494857, 0, 0, 0, 1, 1,
0.06857092, -1.063353, 2.158999, 0, 0, 0, 1, 1,
0.06920855, -0.5828152, 4.601206, 0, 0, 0, 1, 1,
0.07575679, 1.633405, 0.801756, 0, 0, 0, 1, 1,
0.07763945, 0.7880385, 0.2545675, 0, 0, 0, 1, 1,
0.0814997, -0.3114222, 2.421294, 0, 0, 0, 1, 1,
0.08371599, -0.08324776, 4.121978, 1, 1, 1, 1, 1,
0.084898, -1.993139, 3.524752, 1, 1, 1, 1, 1,
0.08582757, -0.3954731, 3.141061, 1, 1, 1, 1, 1,
0.08758916, -1.091844, 4.867013, 1, 1, 1, 1, 1,
0.08997191, -0.6699684, 3.38713, 1, 1, 1, 1, 1,
0.09032528, -0.6474276, 4.201495, 1, 1, 1, 1, 1,
0.0904098, 1.261745, 1.315836, 1, 1, 1, 1, 1,
0.09394696, -0.2502546, 2.939974, 1, 1, 1, 1, 1,
0.09683878, 1.991859, -0.9473075, 1, 1, 1, 1, 1,
0.09848771, -0.8623874, 2.685076, 1, 1, 1, 1, 1,
0.1027805, -2.003737, 3.660539, 1, 1, 1, 1, 1,
0.1031299, -0.7797406, 3.391229, 1, 1, 1, 1, 1,
0.1036719, 1.813183, -0.5225341, 1, 1, 1, 1, 1,
0.1037141, -0.3850675, 4.370647, 1, 1, 1, 1, 1,
0.1055522, -0.2391631, 2.479624, 1, 1, 1, 1, 1,
0.1061319, -1.651479, 3.207319, 0, 0, 1, 1, 1,
0.1090196, 0.184363, 1.194893, 1, 0, 0, 1, 1,
0.1112413, 1.061593, 0.3058357, 1, 0, 0, 1, 1,
0.111521, -0.1297364, 2.330391, 1, 0, 0, 1, 1,
0.1127269, -1.02291, 4.60946, 1, 0, 0, 1, 1,
0.1135571, -1.005079, 2.594517, 1, 0, 0, 1, 1,
0.1208695, 0.9843003, 1.720993, 0, 0, 0, 1, 1,
0.121382, 0.8498877, -0.4854302, 0, 0, 0, 1, 1,
0.1299958, 0.5030732, -1.556972, 0, 0, 0, 1, 1,
0.1308441, 1.257412, 1.06156, 0, 0, 0, 1, 1,
0.1364753, -0.6286801, 3.739369, 0, 0, 0, 1, 1,
0.1381818, 0.962826, 0.2982698, 0, 0, 0, 1, 1,
0.1424701, -1.000511, 3.089313, 0, 0, 0, 1, 1,
0.1435081, 0.3834132, 1.537177, 1, 1, 1, 1, 1,
0.1439108, -0.3101694, 1.265484, 1, 1, 1, 1, 1,
0.1468108, -1.047631, 2.173301, 1, 1, 1, 1, 1,
0.1468311, -1.351, 3.257342, 1, 1, 1, 1, 1,
0.1518276, 0.4083748, -1.042365, 1, 1, 1, 1, 1,
0.1525023, 0.9934255, -1.141692, 1, 1, 1, 1, 1,
0.1534114, 0.7348928, -0.7703514, 1, 1, 1, 1, 1,
0.1537804, 0.7856064, -0.5384842, 1, 1, 1, 1, 1,
0.1557019, 0.5747356, -1.413919, 1, 1, 1, 1, 1,
0.1564918, -1.655711, 4.348122, 1, 1, 1, 1, 1,
0.1619592, -0.9500741, 4.944864, 1, 1, 1, 1, 1,
0.1628028, -0.3799557, 2.233483, 1, 1, 1, 1, 1,
0.1695039, 0.6998525, -1.159969, 1, 1, 1, 1, 1,
0.1731334, 0.3397483, 1.459844, 1, 1, 1, 1, 1,
0.184999, -0.4753588, 3.305174, 1, 1, 1, 1, 1,
0.1852008, 0.1083548, -0.2127599, 0, 0, 1, 1, 1,
0.1859364, 0.7486448, -0.4898169, 1, 0, 0, 1, 1,
0.1885532, 0.06498342, -0.04789767, 1, 0, 0, 1, 1,
0.1913503, -0.3094375, 2.23732, 1, 0, 0, 1, 1,
0.1935236, 1.018287, -1.008604, 1, 0, 0, 1, 1,
0.193736, 1.022748, -0.9330593, 1, 0, 0, 1, 1,
0.196592, -1.353156, 1.429892, 0, 0, 0, 1, 1,
0.1988403, -0.2646485, 3.339278, 0, 0, 0, 1, 1,
0.1999754, -1.805374, 3.457753, 0, 0, 0, 1, 1,
0.2020037, -0.7270486, 2.891927, 0, 0, 0, 1, 1,
0.2029751, -1.327785, 2.137252, 0, 0, 0, 1, 1,
0.2067704, 2.098371, -0.4399252, 0, 0, 0, 1, 1,
0.2107087, 1.282148, 0.3256417, 0, 0, 0, 1, 1,
0.2107471, 0.8404847, -0.5751055, 1, 1, 1, 1, 1,
0.211552, 0.09125698, 2.018126, 1, 1, 1, 1, 1,
0.2156382, -0.7024089, 2.57807, 1, 1, 1, 1, 1,
0.2192096, -0.1092452, 1.598263, 1, 1, 1, 1, 1,
0.2211369, 1.55302, 1.079167, 1, 1, 1, 1, 1,
0.2258563, 0.7161652, -0.92651, 1, 1, 1, 1, 1,
0.2274154, 1.747142, 1.887253, 1, 1, 1, 1, 1,
0.2328885, 1.208445, -0.9002156, 1, 1, 1, 1, 1,
0.233202, 0.2490004, -0.9315214, 1, 1, 1, 1, 1,
0.2362006, -1.638389, 3.942347, 1, 1, 1, 1, 1,
0.2393441, -0.8403004, 2.828921, 1, 1, 1, 1, 1,
0.2436604, -0.08616681, 0.7679377, 1, 1, 1, 1, 1,
0.2438661, 1.501871, 1.139451, 1, 1, 1, 1, 1,
0.2442998, 1.384855, 2.030851, 1, 1, 1, 1, 1,
0.2447456, 0.04952198, 2.089167, 1, 1, 1, 1, 1,
0.2456906, -0.9575638, 2.621158, 0, 0, 1, 1, 1,
0.2528533, 1.04688, -1.357017, 1, 0, 0, 1, 1,
0.2625106, 0.7601056, -1.049297, 1, 0, 0, 1, 1,
0.2653421, 1.947856, 1.865804, 1, 0, 0, 1, 1,
0.2669426, 0.4756245, 1.808776, 1, 0, 0, 1, 1,
0.2685319, -1.530392, 3.639525, 1, 0, 0, 1, 1,
0.2722736, 0.1756486, 2.666595, 0, 0, 0, 1, 1,
0.274992, 0.3400122, 1.481707, 0, 0, 0, 1, 1,
0.2788295, -1.339581, 3.16828, 0, 0, 0, 1, 1,
0.2820413, 0.6894676, 1.93912, 0, 0, 0, 1, 1,
0.2826684, -0.7560357, 2.25094, 0, 0, 0, 1, 1,
0.2831917, -0.7316973, 0.8387337, 0, 0, 0, 1, 1,
0.2920843, 0.5413154, -0.6061679, 0, 0, 0, 1, 1,
0.2939868, -0.7690955, 1.393473, 1, 1, 1, 1, 1,
0.2955867, 0.7275196, -0.5202192, 1, 1, 1, 1, 1,
0.296401, -0.4828793, 3.114567, 1, 1, 1, 1, 1,
0.2980852, 0.02124834, 2.107872, 1, 1, 1, 1, 1,
0.2996638, 0.5576353, -0.03649047, 1, 1, 1, 1, 1,
0.3022741, -0.4811271, 1.806836, 1, 1, 1, 1, 1,
0.3068696, -1.074744, 2.767062, 1, 1, 1, 1, 1,
0.3070578, 0.1538706, 1.42062, 1, 1, 1, 1, 1,
0.3142966, 1.120482, 2.368201, 1, 1, 1, 1, 1,
0.3158268, 0.03720423, 1.625489, 1, 1, 1, 1, 1,
0.3164205, 0.489, 1.487057, 1, 1, 1, 1, 1,
0.3256794, -0.2574981, 3.067925, 1, 1, 1, 1, 1,
0.3273246, -0.3437542, 3.734207, 1, 1, 1, 1, 1,
0.3308572, 0.375832, 1.470087, 1, 1, 1, 1, 1,
0.3322368, -1.185775, 2.269016, 1, 1, 1, 1, 1,
0.3345852, 0.09893047, 1.026089, 0, 0, 1, 1, 1,
0.3412969, -0.6024817, 2.771477, 1, 0, 0, 1, 1,
0.3434242, 0.02588823, 1.773328, 1, 0, 0, 1, 1,
0.3437414, 0.4218123, 0.5539325, 1, 0, 0, 1, 1,
0.3485546, -0.4477731, 1.820718, 1, 0, 0, 1, 1,
0.3495792, -0.5684249, 2.370086, 1, 0, 0, 1, 1,
0.3570224, -0.8506174, 4.351037, 0, 0, 0, 1, 1,
0.3571395, 1.015486, 1.79119, 0, 0, 0, 1, 1,
0.3623193, -0.1984321, 0.9198833, 0, 0, 0, 1, 1,
0.3665076, 0.5603076, 0.8215269, 0, 0, 0, 1, 1,
0.3710913, 1.004935, 2.005836, 0, 0, 0, 1, 1,
0.3760926, -0.4881791, 1.575943, 0, 0, 0, 1, 1,
0.3779344, -0.8061547, 1.292575, 0, 0, 0, 1, 1,
0.3818246, 1.626987, -0.7309017, 1, 1, 1, 1, 1,
0.3824324, 0.6439768, -1.171834, 1, 1, 1, 1, 1,
0.3831949, 2.005458, 0.1799392, 1, 1, 1, 1, 1,
0.3890137, 1.60322, -1.548867, 1, 1, 1, 1, 1,
0.3896343, -1.470707, 3.793859, 1, 1, 1, 1, 1,
0.3897843, -1.678603, 3.1226, 1, 1, 1, 1, 1,
0.3905032, 0.2741647, 2.309702, 1, 1, 1, 1, 1,
0.3924892, -0.351984, 2.487034, 1, 1, 1, 1, 1,
0.3977804, 1.067783, 1.889154, 1, 1, 1, 1, 1,
0.4038508, 0.7812588, 2.413267, 1, 1, 1, 1, 1,
0.4053353, -2.408691, 2.303019, 1, 1, 1, 1, 1,
0.4131651, 0.1461156, 2.5381, 1, 1, 1, 1, 1,
0.4139985, 0.5199209, 0.351461, 1, 1, 1, 1, 1,
0.4141716, -1.157019, 3.76916, 1, 1, 1, 1, 1,
0.4240127, -0.7343482, 4.112319, 1, 1, 1, 1, 1,
0.4277586, -0.2353103, 2.881627, 0, 0, 1, 1, 1,
0.4280252, 0.7138754, 0.1417669, 1, 0, 0, 1, 1,
0.4304245, -0.1078131, 4.026288, 1, 0, 0, 1, 1,
0.4342471, -1.115471, 3.111764, 1, 0, 0, 1, 1,
0.437117, -0.6193566, 2.833943, 1, 0, 0, 1, 1,
0.4380451, -0.08146602, 0.8507288, 1, 0, 0, 1, 1,
0.4386537, -0.6518016, 3.494495, 0, 0, 0, 1, 1,
0.4418719, -0.9947351, 2.679558, 0, 0, 0, 1, 1,
0.4453114, 0.5785167, 0.2985047, 0, 0, 0, 1, 1,
0.4469574, -0.07826101, 1.458833, 0, 0, 0, 1, 1,
0.4483325, -0.1925096, 2.04748, 0, 0, 0, 1, 1,
0.452844, -0.01385898, 2.048791, 0, 0, 0, 1, 1,
0.4533932, 0.3174912, 0.2765741, 0, 0, 0, 1, 1,
0.4536183, 0.3269321, 0.3949211, 1, 1, 1, 1, 1,
0.4551656, -2.636497, 4.324823, 1, 1, 1, 1, 1,
0.4570506, 2.111405, -0.6144032, 1, 1, 1, 1, 1,
0.4577619, -1.963, 2.204365, 1, 1, 1, 1, 1,
0.4644254, 0.8055279, 0.4006133, 1, 1, 1, 1, 1,
0.4690798, 0.06402187, 0.7140152, 1, 1, 1, 1, 1,
0.4696946, 1.658619, 0.8516861, 1, 1, 1, 1, 1,
0.4736449, 0.6792313, 0.03747306, 1, 1, 1, 1, 1,
0.4747356, -0.4294339, 3.925273, 1, 1, 1, 1, 1,
0.4797565, -0.387895, 1.068211, 1, 1, 1, 1, 1,
0.4798236, 2.162558, 1.486156, 1, 1, 1, 1, 1,
0.4849538, 0.1591602, 0.4801951, 1, 1, 1, 1, 1,
0.4851025, -1.386999, 1.465618, 1, 1, 1, 1, 1,
0.4890576, 0.1352253, -0.6065407, 1, 1, 1, 1, 1,
0.4906173, 2.047121, 2.291202, 1, 1, 1, 1, 1,
0.4927805, -0.3973214, 2.256744, 0, 0, 1, 1, 1,
0.4932964, 0.3226746, 0.6512935, 1, 0, 0, 1, 1,
0.4993465, -0.1557574, -0.3285843, 1, 0, 0, 1, 1,
0.5003678, -0.8648304, 2.442899, 1, 0, 0, 1, 1,
0.5007504, 0.2888561, 0.6509725, 1, 0, 0, 1, 1,
0.5043754, 1.737217, -1.004352, 1, 0, 0, 1, 1,
0.5067225, -0.2054503, 1.818092, 0, 0, 0, 1, 1,
0.5090545, 0.173081, 0.01124895, 0, 0, 0, 1, 1,
0.5094896, -1.228438, 2.181957, 0, 0, 0, 1, 1,
0.5127758, 1.794066, 0.6405191, 0, 0, 0, 1, 1,
0.5165839, -2.038406, 5.832803, 0, 0, 0, 1, 1,
0.5200263, -1.297049, 2.214434, 0, 0, 0, 1, 1,
0.5269994, -1.357311, 3.677458, 0, 0, 0, 1, 1,
0.5327725, 0.3162325, 1.385599, 1, 1, 1, 1, 1,
0.5372136, 0.3810353, 1.038337, 1, 1, 1, 1, 1,
0.5375406, -1.917736, 3.818769, 1, 1, 1, 1, 1,
0.5381533, 0.3504917, 1.937165, 1, 1, 1, 1, 1,
0.5383315, -0.3948832, 2.85443, 1, 1, 1, 1, 1,
0.5407928, 0.6665148, 0.3532332, 1, 1, 1, 1, 1,
0.5487501, -0.5423892, 2.530909, 1, 1, 1, 1, 1,
0.5499759, 1.579503, 2.430653, 1, 1, 1, 1, 1,
0.5504777, -0.2448967, 1.760978, 1, 1, 1, 1, 1,
0.5517052, -0.0389839, 2.136213, 1, 1, 1, 1, 1,
0.5544116, 0.2831708, 2.461314, 1, 1, 1, 1, 1,
0.5551659, -0.476334, 3.692329, 1, 1, 1, 1, 1,
0.55627, 1.085551, -1.474603, 1, 1, 1, 1, 1,
0.5564665, 1.738998, 1.200593, 1, 1, 1, 1, 1,
0.5578262, 0.5162117, 0.4027303, 1, 1, 1, 1, 1,
0.560266, 1.859024, -1.388618, 0, 0, 1, 1, 1,
0.5647535, 0.8568876, 2.45164, 1, 0, 0, 1, 1,
0.5669878, 1.61276, 0.9022099, 1, 0, 0, 1, 1,
0.567436, 2.119744, 0.3346916, 1, 0, 0, 1, 1,
0.5723772, -1.585662, 2.485679, 1, 0, 0, 1, 1,
0.5772242, 0.7307869, -0.6835489, 1, 0, 0, 1, 1,
0.5792654, 0.3369131, 2.932419, 0, 0, 0, 1, 1,
0.5855413, 2.216225, 0.5133984, 0, 0, 0, 1, 1,
0.5862197, -0.1308478, 0.7188923, 0, 0, 0, 1, 1,
0.5965036, 1.516464, -1.575811, 0, 0, 0, 1, 1,
0.5968738, -1.164689, 2.805984, 0, 0, 0, 1, 1,
0.5971043, -0.1107922, -0.0102076, 0, 0, 0, 1, 1,
0.5972432, -0.09915291, 1.713304, 0, 0, 0, 1, 1,
0.6010175, -0.5629163, 3.953256, 1, 1, 1, 1, 1,
0.6025441, 0.906683, -1.840748, 1, 1, 1, 1, 1,
0.6046771, -0.5122825, 2.314174, 1, 1, 1, 1, 1,
0.6080355, -1.191179, 3.702147, 1, 1, 1, 1, 1,
0.613026, -1.239103, 2.554327, 1, 1, 1, 1, 1,
0.6143406, -2.019685, 2.653124, 1, 1, 1, 1, 1,
0.6181442, -0.1567623, 0.9967776, 1, 1, 1, 1, 1,
0.6292613, -0.7817434, 2.109424, 1, 1, 1, 1, 1,
0.6295609, -0.4032642, 2.437949, 1, 1, 1, 1, 1,
0.6375216, 2.78004, -0.5019293, 1, 1, 1, 1, 1,
0.638494, 0.1543247, 2.998054, 1, 1, 1, 1, 1,
0.6442661, -0.09723257, 2.400582, 1, 1, 1, 1, 1,
0.6446433, -0.6544305, 3.607994, 1, 1, 1, 1, 1,
0.6473858, 1.347334, 0.02893061, 1, 1, 1, 1, 1,
0.6505743, 0.4421526, -0.3373098, 1, 1, 1, 1, 1,
0.6551579, -1.316705, 1.145731, 0, 0, 1, 1, 1,
0.6565427, -1.100162, 3.579034, 1, 0, 0, 1, 1,
0.658875, -0.04612589, 0.94972, 1, 0, 0, 1, 1,
0.6597184, -0.5857977, 1.690221, 1, 0, 0, 1, 1,
0.6603738, 0.03071103, 2.37255, 1, 0, 0, 1, 1,
0.666774, 1.692231, 0.7792276, 1, 0, 0, 1, 1,
0.6671959, 1.328819, 2.407954, 0, 0, 0, 1, 1,
0.6687856, 0.1758955, 1.536836, 0, 0, 0, 1, 1,
0.6689216, -0.8441616, 3.395337, 0, 0, 0, 1, 1,
0.6702242, 0.5104806, -0.431051, 0, 0, 0, 1, 1,
0.6717182, 0.5521584, 2.01407, 0, 0, 0, 1, 1,
0.6722356, 0.5874158, 1.465727, 0, 0, 0, 1, 1,
0.6747851, -0.9191827, 1.746268, 0, 0, 0, 1, 1,
0.6771981, -0.7615754, 2.317161, 1, 1, 1, 1, 1,
0.6785277, -0.5044203, 1.576429, 1, 1, 1, 1, 1,
0.6860411, 0.7994222, 0.5023659, 1, 1, 1, 1, 1,
0.6872382, -0.4453288, 2.572073, 1, 1, 1, 1, 1,
0.7021197, 1.332558, -0.376283, 1, 1, 1, 1, 1,
0.7038848, -0.3783298, 0.7721206, 1, 1, 1, 1, 1,
0.7077223, -1.646493, 3.285891, 1, 1, 1, 1, 1,
0.7092561, -1.814565, 3.052834, 1, 1, 1, 1, 1,
0.7111253, 1.580348, 2.302433, 1, 1, 1, 1, 1,
0.7147502, -0.05342636, 0.6903883, 1, 1, 1, 1, 1,
0.7166274, -0.9478255, 0.6439692, 1, 1, 1, 1, 1,
0.7204549, 0.2501223, 1.527376, 1, 1, 1, 1, 1,
0.7204564, -0.09796108, 0.1554975, 1, 1, 1, 1, 1,
0.7214583, -0.2670651, 1.622142, 1, 1, 1, 1, 1,
0.7248515, -0.4316798, 3.233112, 1, 1, 1, 1, 1,
0.7285953, 2.380657, -0.3134475, 0, 0, 1, 1, 1,
0.7305945, -2.110624, 2.18972, 1, 0, 0, 1, 1,
0.7366184, 2.583149, 0.1345278, 1, 0, 0, 1, 1,
0.741313, 0.02361142, 2.343508, 1, 0, 0, 1, 1,
0.746101, -0.55277, 2.127661, 1, 0, 0, 1, 1,
0.7462918, -1.252418, 3.867999, 1, 0, 0, 1, 1,
0.7501151, 1.375187, -0.4401147, 0, 0, 0, 1, 1,
0.7516227, -0.8709527, 2.104404, 0, 0, 0, 1, 1,
0.7579449, 1.049017, 0.8372791, 0, 0, 0, 1, 1,
0.7580032, -1.457095, 3.446666, 0, 0, 0, 1, 1,
0.7589321, -0.1406679, 1.71763, 0, 0, 0, 1, 1,
0.7630647, 1.284144, -0.2383728, 0, 0, 0, 1, 1,
0.7637851, -1.249568, 4.713267, 0, 0, 0, 1, 1,
0.7641789, -0.6996604, 2.648499, 1, 1, 1, 1, 1,
0.7643516, 1.741752, 0.2817263, 1, 1, 1, 1, 1,
0.7674981, 0.02066348, 0.01794451, 1, 1, 1, 1, 1,
0.7724407, 0.8432478, -0.1082499, 1, 1, 1, 1, 1,
0.7726087, -0.8345116, 2.383177, 1, 1, 1, 1, 1,
0.7731349, 0.01878315, 1.58617, 1, 1, 1, 1, 1,
0.7809002, 0.9469349, 1.286242, 1, 1, 1, 1, 1,
0.7822896, -0.4536456, 3.750507, 1, 1, 1, 1, 1,
0.7825897, 1.350099, 1.246052, 1, 1, 1, 1, 1,
0.7965555, 1.383164, -0.1357423, 1, 1, 1, 1, 1,
0.7975596, 0.7319452, 2.184904, 1, 1, 1, 1, 1,
0.802465, 1.440942, -0.9904432, 1, 1, 1, 1, 1,
0.8041554, 1.638269, 2.101944, 1, 1, 1, 1, 1,
0.8078084, 0.7548063, 2.373855, 1, 1, 1, 1, 1,
0.8089429, 2.369529, -1.771573, 1, 1, 1, 1, 1,
0.8111849, -0.8866349, 3.393753, 0, 0, 1, 1, 1,
0.8263788, -1.427574, 2.886776, 1, 0, 0, 1, 1,
0.8324996, -0.198191, 0.06663795, 1, 0, 0, 1, 1,
0.8362646, 0.144201, 3.137697, 1, 0, 0, 1, 1,
0.8370917, -0.993611, 2.681104, 1, 0, 0, 1, 1,
0.8412879, 0.1598806, 2.161021, 1, 0, 0, 1, 1,
0.8421554, -0.5677686, 1.824201, 0, 0, 0, 1, 1,
0.8458953, 0.4069043, 2.321461, 0, 0, 0, 1, 1,
0.846586, 0.5904435, 2.583217, 0, 0, 0, 1, 1,
0.8524263, -0.01689754, 3.459561, 0, 0, 0, 1, 1,
0.8563883, 0.6061665, -0.6001171, 0, 0, 0, 1, 1,
0.860629, -0.7326111, 0.8242582, 0, 0, 0, 1, 1,
0.8608282, 0.3201377, 2.085462, 0, 0, 0, 1, 1,
0.8650402, 1.07401, 1.507663, 1, 1, 1, 1, 1,
0.8675548, -0.2827912, 2.218609, 1, 1, 1, 1, 1,
0.8710552, -0.286599, 0.1930172, 1, 1, 1, 1, 1,
0.8871133, 1.329704, 0.2433158, 1, 1, 1, 1, 1,
0.8948076, -1.148036, -0.2470235, 1, 1, 1, 1, 1,
0.9039844, -0.2923953, 1.109606, 1, 1, 1, 1, 1,
0.9081314, -0.1006547, 1.734121, 1, 1, 1, 1, 1,
0.9085279, -1.525064, 2.769063, 1, 1, 1, 1, 1,
0.915305, 1.284224, -0.4592121, 1, 1, 1, 1, 1,
0.9186683, 0.6773618, 0.8634481, 1, 1, 1, 1, 1,
0.9188537, 1.088331, 1.178387, 1, 1, 1, 1, 1,
0.9284466, 1.423144, 0.3526148, 1, 1, 1, 1, 1,
0.9321125, -1.255151, 1.837047, 1, 1, 1, 1, 1,
0.9344386, -0.4086604, 1.65067, 1, 1, 1, 1, 1,
0.9351558, 0.5898079, 1.649712, 1, 1, 1, 1, 1,
0.9394134, 0.1511544, 0.1258394, 0, 0, 1, 1, 1,
0.9423137, -0.4162078, 1.25665, 1, 0, 0, 1, 1,
0.9499512, -0.8734679, 2.63109, 1, 0, 0, 1, 1,
0.9513149, 1.14525, -0.2150628, 1, 0, 0, 1, 1,
0.9523873, 0.510476, -0.8238654, 1, 0, 0, 1, 1,
0.9588328, -1.053282, 1.464079, 1, 0, 0, 1, 1,
0.9607783, 0.9114216, 1.449636, 0, 0, 0, 1, 1,
0.964223, -0.1952662, -1.215382, 0, 0, 0, 1, 1,
0.9670075, -0.8331217, 0.8571987, 0, 0, 0, 1, 1,
0.9704185, 0.7884564, 1.666004, 0, 0, 0, 1, 1,
0.9714719, 0.07243118, 0.8684724, 0, 0, 0, 1, 1,
0.9776405, 2.030346, 0.7839408, 0, 0, 0, 1, 1,
0.9797596, -0.4725728, 3.525903, 0, 0, 0, 1, 1,
0.9834339, 0.2703948, -0.3821031, 1, 1, 1, 1, 1,
0.9888353, 0.4889093, 1.580647, 1, 1, 1, 1, 1,
0.9893636, 1.427116, 1.880512, 1, 1, 1, 1, 1,
0.9963629, 0.8307283, 1.449114, 1, 1, 1, 1, 1,
1.001695, -0.7626929, 2.541545, 1, 1, 1, 1, 1,
1.008013, -0.9441305, 3.769347, 1, 1, 1, 1, 1,
1.010693, -0.02500703, 1.057451, 1, 1, 1, 1, 1,
1.011687, 0.4554321, 1.426894, 1, 1, 1, 1, 1,
1.015068, -0.5192386, 3.534667, 1, 1, 1, 1, 1,
1.018756, 0.4194207, 1.49192, 1, 1, 1, 1, 1,
1.024018, -1.05669, 1.687232, 1, 1, 1, 1, 1,
1.033447, 0.7480014, 1.691573, 1, 1, 1, 1, 1,
1.048643, -0.6881419, 1.897878, 1, 1, 1, 1, 1,
1.051278, 1.317071, -0.4450726, 1, 1, 1, 1, 1,
1.057707, -0.6474735, 1.904846, 1, 1, 1, 1, 1,
1.067213, 0.4225741, 1.517851, 0, 0, 1, 1, 1,
1.067569, 1.146429, 0.8129558, 1, 0, 0, 1, 1,
1.068543, -0.4407493, 2.089632, 1, 0, 0, 1, 1,
1.075733, 1.286951, 0.3825689, 1, 0, 0, 1, 1,
1.078091, -1.533568, 2.385478, 1, 0, 0, 1, 1,
1.08071, 1.404052, -1.191423, 1, 0, 0, 1, 1,
1.083153, 1.008257, 0.06665875, 0, 0, 0, 1, 1,
1.083273, 0.7977237, 1.850757, 0, 0, 0, 1, 1,
1.085325, -0.5424882, 1.476238, 0, 0, 0, 1, 1,
1.091216, 0.1067808, 0.753227, 0, 0, 0, 1, 1,
1.096624, 1.225538, 2.256344, 0, 0, 0, 1, 1,
1.098514, -1.579894, 4.101895, 0, 0, 0, 1, 1,
1.103734, -0.6070144, 2.426682, 0, 0, 0, 1, 1,
1.104427, 0.5902392, 0.6921757, 1, 1, 1, 1, 1,
1.107899, -0.07811359, 1.919866, 1, 1, 1, 1, 1,
1.11032, -0.2955768, 2.296753, 1, 1, 1, 1, 1,
1.117689, -2.046042, 4.414762, 1, 1, 1, 1, 1,
1.123391, -0.1083726, 1.863701, 1, 1, 1, 1, 1,
1.126675, -1.861476, 2.421467, 1, 1, 1, 1, 1,
1.13427, 0.4243534, 1.446899, 1, 1, 1, 1, 1,
1.134501, 0.5201885, 1.10818, 1, 1, 1, 1, 1,
1.138317, 0.3569327, 1.241486, 1, 1, 1, 1, 1,
1.14064, 0.08282724, 1.874758, 1, 1, 1, 1, 1,
1.141373, 0.5980368, 1.167387, 1, 1, 1, 1, 1,
1.146619, -0.04781672, 3.516959, 1, 1, 1, 1, 1,
1.151386, 1.644163, 2.020503, 1, 1, 1, 1, 1,
1.169668, -1.059579, 2.242886, 1, 1, 1, 1, 1,
1.176888, 0.7202522, -0.7314712, 1, 1, 1, 1, 1,
1.198889, -0.6852986, 0.638957, 0, 0, 1, 1, 1,
1.200437, -0.2361752, 2.961971, 1, 0, 0, 1, 1,
1.201494, 1.991628, 0.1560824, 1, 0, 0, 1, 1,
1.208375, -0.5214565, 0.8106828, 1, 0, 0, 1, 1,
1.21182, -0.6048335, 2.492435, 1, 0, 0, 1, 1,
1.220558, -1.212167, 3.401724, 1, 0, 0, 1, 1,
1.221489, -2.126123, 3.854859, 0, 0, 0, 1, 1,
1.225426, 0.833686, 0.712937, 0, 0, 0, 1, 1,
1.230108, 0.2210127, 3.13315, 0, 0, 0, 1, 1,
1.232186, -0.1450822, 2.882179, 0, 0, 0, 1, 1,
1.235224, -0.4676567, 3.960314, 0, 0, 0, 1, 1,
1.238709, 0.8634663, 1.543179, 0, 0, 0, 1, 1,
1.239301, -0.2130652, 2.494229, 0, 0, 0, 1, 1,
1.241867, 0.9320522, 1.570256, 1, 1, 1, 1, 1,
1.242416, 0.4955545, 1.15761, 1, 1, 1, 1, 1,
1.254482, -1.331174, 2.92376, 1, 1, 1, 1, 1,
1.259421, -1.007508, 3.341015, 1, 1, 1, 1, 1,
1.261841, -0.3669012, 2.692959, 1, 1, 1, 1, 1,
1.276016, 0.3965442, 0.006445068, 1, 1, 1, 1, 1,
1.290853, 1.287132, 2.163568, 1, 1, 1, 1, 1,
1.291248, -0.1707626, 2.046866, 1, 1, 1, 1, 1,
1.291635, 0.2083182, 3.848827, 1, 1, 1, 1, 1,
1.293312, 0.3886885, 0.2636104, 1, 1, 1, 1, 1,
1.299951, -0.6871616, 3.144349, 1, 1, 1, 1, 1,
1.30582, 0.8132815, 1.458404, 1, 1, 1, 1, 1,
1.308836, 0.4461637, 1.692894, 1, 1, 1, 1, 1,
1.312985, 0.2154365, 1.562333, 1, 1, 1, 1, 1,
1.31894, -0.2550191, 3.14945, 1, 1, 1, 1, 1,
1.325665, 0.2392267, 0.5838712, 0, 0, 1, 1, 1,
1.335809, 0.04291259, 2.503586, 1, 0, 0, 1, 1,
1.33869, 0.4111381, 1.966537, 1, 0, 0, 1, 1,
1.339344, -0.4489163, 1.51265, 1, 0, 0, 1, 1,
1.346835, 1.231578, 1.080879, 1, 0, 0, 1, 1,
1.347232, 0.4852098, -0.1449298, 1, 0, 0, 1, 1,
1.353213, 0.4865787, 2.540342, 0, 0, 0, 1, 1,
1.36439, -0.4602689, 2.217848, 0, 0, 0, 1, 1,
1.36598, 0.1003947, 3.73028, 0, 0, 0, 1, 1,
1.374213, -1.586781, 1.452364, 0, 0, 0, 1, 1,
1.408431, 1.773366, 1.656342, 0, 0, 0, 1, 1,
1.409218, -0.8037442, 1.369217, 0, 0, 0, 1, 1,
1.411892, 0.3107102, 2.377334, 0, 0, 0, 1, 1,
1.413112, -2.317263, 3.546997, 1, 1, 1, 1, 1,
1.414163, 0.6846811, 0.4883356, 1, 1, 1, 1, 1,
1.419684, 1.533182, 0.1377914, 1, 1, 1, 1, 1,
1.419782, 0.04335047, 2.708938, 1, 1, 1, 1, 1,
1.424059, 1.598535, 0.3572408, 1, 1, 1, 1, 1,
1.424567, 0.8826845, -0.1663928, 1, 1, 1, 1, 1,
1.427835, 0.1440358, 1.7576, 1, 1, 1, 1, 1,
1.437452, 0.9764091, -0.4427202, 1, 1, 1, 1, 1,
1.442894, 0.1025861, 0.7206471, 1, 1, 1, 1, 1,
1.452888, -1.103154, 2.613697, 1, 1, 1, 1, 1,
1.45527, 1.487511, 1.702143, 1, 1, 1, 1, 1,
1.45699, 1.954867, 2.059541, 1, 1, 1, 1, 1,
1.460814, 0.2449202, 2.12534, 1, 1, 1, 1, 1,
1.463397, 1.132282, 1.69012, 1, 1, 1, 1, 1,
1.46451, 1.693962, 0.730754, 1, 1, 1, 1, 1,
1.466104, 1.301209, 0.4283305, 0, 0, 1, 1, 1,
1.475564, -0.4761724, 1.407951, 1, 0, 0, 1, 1,
1.486456, 0.1985753, 2.054998, 1, 0, 0, 1, 1,
1.488172, -0.07193176, 1.267141, 1, 0, 0, 1, 1,
1.504337, -0.9320012, 2.993632, 1, 0, 0, 1, 1,
1.507198, -0.2044328, 3.996872, 1, 0, 0, 1, 1,
1.512824, -1.185102, 2.231419, 0, 0, 0, 1, 1,
1.514442, 0.1950645, 2.105413, 0, 0, 0, 1, 1,
1.519227, -1.057019, 2.872688, 0, 0, 0, 1, 1,
1.523609, 1.564299, 0.3342666, 0, 0, 0, 1, 1,
1.534747, -0.913642, 2.125084, 0, 0, 0, 1, 1,
1.537199, 2.299711, 0.1508358, 0, 0, 0, 1, 1,
1.54275, 0.4723, 2.572171, 0, 0, 0, 1, 1,
1.550767, -1.560106, 2.430035, 1, 1, 1, 1, 1,
1.552768, 0.0262926, 1.644873, 1, 1, 1, 1, 1,
1.558834, -0.747338, 2.622853, 1, 1, 1, 1, 1,
1.568286, 1.101952, 2.023748, 1, 1, 1, 1, 1,
1.570942, -0.6089756, 2.331763, 1, 1, 1, 1, 1,
1.578835, -1.954835, 1.190854, 1, 1, 1, 1, 1,
1.583147, 0.1562243, 0.7858185, 1, 1, 1, 1, 1,
1.622393, -0.09733727, 0.1319529, 1, 1, 1, 1, 1,
1.627351, -0.3537792, 1.201531, 1, 1, 1, 1, 1,
1.637878, -0.5653291, 0.6652433, 1, 1, 1, 1, 1,
1.6543, -0.1118609, 1.073896, 1, 1, 1, 1, 1,
1.674064, 1.16698, 1.837876, 1, 1, 1, 1, 1,
1.688663, 0.09364181, 1.510933, 1, 1, 1, 1, 1,
1.713336, -0.1044953, 1.228153, 1, 1, 1, 1, 1,
1.722566, 1.747686, 0.5167115, 1, 1, 1, 1, 1,
1.725565, 0.704861, 1.903835, 0, 0, 1, 1, 1,
1.729704, -0.6192951, 3.255144, 1, 0, 0, 1, 1,
1.741092, -0.8445774, 2.613128, 1, 0, 0, 1, 1,
1.74161, 0.5915061, 0.6347815, 1, 0, 0, 1, 1,
1.752821, -0.4554335, 1.758373, 1, 0, 0, 1, 1,
1.791354, -0.5510034, 2.037396, 1, 0, 0, 1, 1,
1.792841, -0.06942225, 2.902827, 0, 0, 0, 1, 1,
1.798955, 1.027991, 0.9587052, 0, 0, 0, 1, 1,
1.808354, 0.2580742, 0.5935693, 0, 0, 0, 1, 1,
1.8088, -0.9590861, 1.641386, 0, 0, 0, 1, 1,
1.813264, -0.007507504, 2.089434, 0, 0, 0, 1, 1,
1.814801, 2.018882, -0.4627406, 0, 0, 0, 1, 1,
1.857014, 2.259582, -0.1493381, 0, 0, 0, 1, 1,
1.879859, -0.121897, 0.1893851, 1, 1, 1, 1, 1,
1.934579, 1.122278, 2.994513, 1, 1, 1, 1, 1,
1.961771, 0.7162138, 1.654908, 1, 1, 1, 1, 1,
1.969857, 1.537312, -0.5844808, 1, 1, 1, 1, 1,
1.973127, 1.413688, 2.650577, 1, 1, 1, 1, 1,
1.987683, -1.398049, 3.558103, 1, 1, 1, 1, 1,
1.996427, -1.451013, 2.698203, 1, 1, 1, 1, 1,
1.999389, -1.199137, 0.3170637, 1, 1, 1, 1, 1,
2.030047, 0.04706048, -0.01000681, 1, 1, 1, 1, 1,
2.037579, 1.163668, 2.750928, 1, 1, 1, 1, 1,
2.041819, -0.194645, 1.447955, 1, 1, 1, 1, 1,
2.069357, -0.8688512, 1.344658, 1, 1, 1, 1, 1,
2.069845, -0.6270626, 3.227797, 1, 1, 1, 1, 1,
2.152119, -1.423783, 1.341537, 1, 1, 1, 1, 1,
2.154958, 0.6977362, 1.692489, 1, 1, 1, 1, 1,
2.157368, 0.03537124, 2.283696, 0, 0, 1, 1, 1,
2.186942, 0.7919598, 1.763354, 1, 0, 0, 1, 1,
2.187335, -1.139642, 2.608084, 1, 0, 0, 1, 1,
2.200125, -0.5174881, 1.832548, 1, 0, 0, 1, 1,
2.219455, -0.4307551, 0.20174, 1, 0, 0, 1, 1,
2.258007, -1.147601, -0.1568847, 1, 0, 0, 1, 1,
2.272743, -1.530158, 3.012105, 0, 0, 0, 1, 1,
2.281413, 0.02720352, 1.949658, 0, 0, 0, 1, 1,
2.297507, 1.151094, 0.02528519, 0, 0, 0, 1, 1,
2.319052, 0.05894965, 0.8254436, 0, 0, 0, 1, 1,
2.327169, 0.7076058, 1.310141, 0, 0, 0, 1, 1,
2.329807, -2.279251, 2.487852, 0, 0, 0, 1, 1,
2.334924, -1.910753, 0.07309124, 0, 0, 0, 1, 1,
2.524593, 0.9045805, 0.3373735, 1, 1, 1, 1, 1,
2.52684, 0.7827315, 1.008373, 1, 1, 1, 1, 1,
2.680626, 0.9879524, 1.638908, 1, 1, 1, 1, 1,
2.686479, -0.7527182, 1.90792, 1, 1, 1, 1, 1,
2.709077, 0.002814817, 1.968125, 1, 1, 1, 1, 1,
3.072623, 0.2247308, 2.264982, 1, 1, 1, 1, 1,
3.211604, -1.74801, 3.232818, 1, 1, 1, 1, 1
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
var radius = 9.98296;
var distance = 35.06472;
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
mvMatrix.translate( 0.1818478, 0.3951825, -0.183562 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.06472);
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