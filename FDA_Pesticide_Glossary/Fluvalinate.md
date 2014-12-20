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
-3.016928, 1.735383, -2.063251, 1, 0, 0, 1,
-3.003669, -1.605233, -1.139891, 1, 0.007843138, 0, 1,
-2.726724, -0.4327929, -2.415868, 1, 0.01176471, 0, 1,
-2.524186, -1.694763, -2.439251, 1, 0.01960784, 0, 1,
-2.437885, -1.818693, -2.38585, 1, 0.02352941, 0, 1,
-2.436063, 1.414248, -1.24286, 1, 0.03137255, 0, 1,
-2.41238, -1.84072, -2.259321, 1, 0.03529412, 0, 1,
-2.366201, -0.3879437, -1.281004, 1, 0.04313726, 0, 1,
-2.355793, 0.7693134, -1.662158, 1, 0.04705882, 0, 1,
-2.343817, 0.5306392, 0.3039871, 1, 0.05490196, 0, 1,
-2.287369, 0.1168507, -0.5758955, 1, 0.05882353, 0, 1,
-2.224153, -1.945591, -2.470869, 1, 0.06666667, 0, 1,
-2.204309, 1.567819, -1.554959, 1, 0.07058824, 0, 1,
-2.172545, -0.379921, -0.763358, 1, 0.07843138, 0, 1,
-2.161246, 0.6603881, -2.477538, 1, 0.08235294, 0, 1,
-2.125729, -0.6740711, -4.621914, 1, 0.09019608, 0, 1,
-2.051935, 0.5093024, -0.6221991, 1, 0.09411765, 0, 1,
-2.048864, 0.03952623, -2.827922, 1, 0.1019608, 0, 1,
-2.044257, -0.7210664, -1.606558, 1, 0.1098039, 0, 1,
-2.027558, 0.07785782, -1.882522, 1, 0.1137255, 0, 1,
-2.021422, 2.516177, -0.4918796, 1, 0.1215686, 0, 1,
-2.004316, 0.01733624, -1.358596, 1, 0.1254902, 0, 1,
-2.003221, -0.2872125, -2.573877, 1, 0.1333333, 0, 1,
-2.00158, 0.3833784, -0.7020935, 1, 0.1372549, 0, 1,
-1.993875, 0.1468536, -2.813092, 1, 0.145098, 0, 1,
-1.941821, -0.9494508, -1.2959, 1, 0.1490196, 0, 1,
-1.941047, 1.446503, -2.118257, 1, 0.1568628, 0, 1,
-1.92618, -0.7375621, -0.7200346, 1, 0.1607843, 0, 1,
-1.896115, 1.006146, -0.503444, 1, 0.1686275, 0, 1,
-1.894798, -0.576257, -1.50194, 1, 0.172549, 0, 1,
-1.891082, 0.6721633, -1.432889, 1, 0.1803922, 0, 1,
-1.851588, -1.18917, -2.054678, 1, 0.1843137, 0, 1,
-1.841377, 0.6901428, -2.635994, 1, 0.1921569, 0, 1,
-1.794823, -1.940653, -3.61888, 1, 0.1960784, 0, 1,
-1.778532, -0.9727364, -1.503415, 1, 0.2039216, 0, 1,
-1.777573, -0.6940307, -1.235347, 1, 0.2117647, 0, 1,
-1.773261, 1.090297, -2.584969, 1, 0.2156863, 0, 1,
-1.764486, -1.51431, -2.519489, 1, 0.2235294, 0, 1,
-1.739096, 0.5454305, -1.135768, 1, 0.227451, 0, 1,
-1.711379, 1.747393, -0.3996332, 1, 0.2352941, 0, 1,
-1.71132, 0.9306068, -0.03927228, 1, 0.2392157, 0, 1,
-1.657236, -0.0856003, -0.6176186, 1, 0.2470588, 0, 1,
-1.638424, 1.071467, -1.431259, 1, 0.2509804, 0, 1,
-1.633459, -0.7407759, -1.503305, 1, 0.2588235, 0, 1,
-1.605554, 0.623571, -2.27696, 1, 0.2627451, 0, 1,
-1.587698, -1.588869, -2.316672, 1, 0.2705882, 0, 1,
-1.582972, -0.1598929, -2.797421, 1, 0.2745098, 0, 1,
-1.569407, 1.033416, -1.943891, 1, 0.282353, 0, 1,
-1.566858, -0.9271131, -4.256657, 1, 0.2862745, 0, 1,
-1.553862, 0.3190058, -0.2486558, 1, 0.2941177, 0, 1,
-1.552454, -0.5796107, -2.069972, 1, 0.3019608, 0, 1,
-1.550504, 0.2517949, -3.181133, 1, 0.3058824, 0, 1,
-1.539728, -0.07227538, -1.350668, 1, 0.3137255, 0, 1,
-1.5263, -0.01399843, -1.445682, 1, 0.3176471, 0, 1,
-1.51978, 0.7197213, -0.7088237, 1, 0.3254902, 0, 1,
-1.482414, -0.1605829, 0.2819191, 1, 0.3294118, 0, 1,
-1.482355, -1.909911, -1.562752, 1, 0.3372549, 0, 1,
-1.480683, -0.598358, -1.55514, 1, 0.3411765, 0, 1,
-1.473211, -0.2338334, -3.39326, 1, 0.3490196, 0, 1,
-1.461094, 1.630461, -0.03213703, 1, 0.3529412, 0, 1,
-1.452754, 0.04884814, -2.379348, 1, 0.3607843, 0, 1,
-1.449896, 1.234705, -0.5878492, 1, 0.3647059, 0, 1,
-1.44933, -0.02993503, -1.806749, 1, 0.372549, 0, 1,
-1.440967, -0.2347058, -3.36947, 1, 0.3764706, 0, 1,
-1.440463, -1.68214, -1.339286, 1, 0.3843137, 0, 1,
-1.437596, -0.6808318, -3.656859, 1, 0.3882353, 0, 1,
-1.43426, 1.659699, -2.507552, 1, 0.3960784, 0, 1,
-1.431005, 0.470403, -0.6213539, 1, 0.4039216, 0, 1,
-1.420574, 0.2700128, -2.237483, 1, 0.4078431, 0, 1,
-1.405278, -0.1999191, -2.799239, 1, 0.4156863, 0, 1,
-1.397749, 0.3165509, -2.286509, 1, 0.4196078, 0, 1,
-1.38891, 0.3504581, -1.351276, 1, 0.427451, 0, 1,
-1.387769, -0.3081293, -0.9845649, 1, 0.4313726, 0, 1,
-1.381989, 1.562329, -1.4681, 1, 0.4392157, 0, 1,
-1.379265, 0.2196431, -1.811535, 1, 0.4431373, 0, 1,
-1.374989, -0.144617, -0.7029954, 1, 0.4509804, 0, 1,
-1.37171, 0.5997444, -0.6092144, 1, 0.454902, 0, 1,
-1.369555, 0.5295821, -1.949695, 1, 0.4627451, 0, 1,
-1.366702, 0.05142784, -2.326627, 1, 0.4666667, 0, 1,
-1.366451, 2.412422, -0.7229036, 1, 0.4745098, 0, 1,
-1.354838, -0.7850938, -3.662696, 1, 0.4784314, 0, 1,
-1.354653, 1.683137, -2.438457, 1, 0.4862745, 0, 1,
-1.353365, -0.1280712, -3.432033, 1, 0.4901961, 0, 1,
-1.349514, 0.5934139, -0.3320916, 1, 0.4980392, 0, 1,
-1.34718, -0.3064817, -0.7333641, 1, 0.5058824, 0, 1,
-1.346284, 1.507688, -1.321266, 1, 0.509804, 0, 1,
-1.34341, 0.6127911, -0.7676504, 1, 0.5176471, 0, 1,
-1.337521, 0.2283812, -0.8151813, 1, 0.5215687, 0, 1,
-1.323114, 0.2255897, -1.669334, 1, 0.5294118, 0, 1,
-1.30301, 0.4701736, -1.672144, 1, 0.5333334, 0, 1,
-1.302212, 0.7333586, -1.612959, 1, 0.5411765, 0, 1,
-1.299728, -2.446084, -3.098577, 1, 0.5450981, 0, 1,
-1.296966, -0.5282839, -1.928075, 1, 0.5529412, 0, 1,
-1.288898, 0.6143481, -2.571665, 1, 0.5568628, 0, 1,
-1.283671, 0.5631492, -1.904246, 1, 0.5647059, 0, 1,
-1.281818, 0.8166403, 0.1426494, 1, 0.5686275, 0, 1,
-1.277914, -3.155604, -2.811729, 1, 0.5764706, 0, 1,
-1.275031, 0.856303, -0.8034896, 1, 0.5803922, 0, 1,
-1.271809, -0.6759052, -1.214676, 1, 0.5882353, 0, 1,
-1.261092, 0.5756815, -1.625704, 1, 0.5921569, 0, 1,
-1.260439, -0.3843035, -0.003831325, 1, 0.6, 0, 1,
-1.249857, 0.0658416, -3.113784, 1, 0.6078432, 0, 1,
-1.246566, -0.2472396, -2.838824, 1, 0.6117647, 0, 1,
-1.238695, 0.3250425, -0.8140371, 1, 0.6196079, 0, 1,
-1.236313, -0.5722182, -4.348252, 1, 0.6235294, 0, 1,
-1.23586, -0.1424327, -2.238154, 1, 0.6313726, 0, 1,
-1.232299, 2.191569, -0.5599554, 1, 0.6352941, 0, 1,
-1.229353, 1.082621, -0.2275262, 1, 0.6431373, 0, 1,
-1.224561, -1.819878, -2.10785, 1, 0.6470588, 0, 1,
-1.21933, -0.1637587, -0.57703, 1, 0.654902, 0, 1,
-1.204611, 1.500063, 0.1653315, 1, 0.6588235, 0, 1,
-1.195738, 0.2313723, -1.280661, 1, 0.6666667, 0, 1,
-1.18434, -0.5564058, -2.280772, 1, 0.6705883, 0, 1,
-1.182711, 0.08810651, -2.129053, 1, 0.6784314, 0, 1,
-1.177807, -0.3011345, -1.570822, 1, 0.682353, 0, 1,
-1.16379, 0.005917641, -2.366296, 1, 0.6901961, 0, 1,
-1.159417, 0.05518037, -1.993681, 1, 0.6941177, 0, 1,
-1.158755, 1.841049, -0.07509258, 1, 0.7019608, 0, 1,
-1.158058, -0.4277003, -1.583218, 1, 0.7098039, 0, 1,
-1.152561, 1.534219, -0.5717691, 1, 0.7137255, 0, 1,
-1.147416, -0.009751637, -1.926154, 1, 0.7215686, 0, 1,
-1.14458, -1.335516, -4.008591, 1, 0.7254902, 0, 1,
-1.137437, -0.7622925, -2.428077, 1, 0.7333333, 0, 1,
-1.135176, 0.8957987, -0.7947999, 1, 0.7372549, 0, 1,
-1.13008, 0.7532328, -2.762677, 1, 0.7450981, 0, 1,
-1.12981, -0.6875458, -0.9974887, 1, 0.7490196, 0, 1,
-1.121806, 0.5891575, 0.1280454, 1, 0.7568628, 0, 1,
-1.118088, -1.114764, -2.657276, 1, 0.7607843, 0, 1,
-1.115838, -1.386539, -2.763142, 1, 0.7686275, 0, 1,
-1.114876, 0.07093389, 0.1462469, 1, 0.772549, 0, 1,
-1.113493, -1.195511, 0.1302541, 1, 0.7803922, 0, 1,
-1.110693, -2.004582, -3.307284, 1, 0.7843137, 0, 1,
-1.08754, -0.1976169, 0.1532897, 1, 0.7921569, 0, 1,
-1.086275, -0.4940429, -0.03983599, 1, 0.7960784, 0, 1,
-1.084448, -0.2335674, -2.774012, 1, 0.8039216, 0, 1,
-1.083103, 0.2669982, -2.466784, 1, 0.8117647, 0, 1,
-1.079009, -1.132173, -1.634735, 1, 0.8156863, 0, 1,
-1.069946, 1.356891, -0.3818981, 1, 0.8235294, 0, 1,
-1.067867, 0.572966, -2.130583, 1, 0.827451, 0, 1,
-1.066649, 0.6572724, -0.825341, 1, 0.8352941, 0, 1,
-1.058188, 0.08537853, -2.380268, 1, 0.8392157, 0, 1,
-1.052816, 1.14229, 1.263501, 1, 0.8470588, 0, 1,
-1.046711, 0.8892242, -0.8515031, 1, 0.8509804, 0, 1,
-1.041461, -1.586675, -2.611548, 1, 0.8588235, 0, 1,
-1.030244, -0.6807625, -1.039039, 1, 0.8627451, 0, 1,
-1.021974, -1.080316, -2.064603, 1, 0.8705882, 0, 1,
-1.021227, 0.1915739, -1.619006, 1, 0.8745098, 0, 1,
-1.01697, -1.929603, -2.650822, 1, 0.8823529, 0, 1,
-1.014293, 0.5491217, 0.4985096, 1, 0.8862745, 0, 1,
-1.01141, 0.09053767, 0.2027355, 1, 0.8941177, 0, 1,
-1.002894, 0.4549481, -2.501335, 1, 0.8980392, 0, 1,
-0.9956771, -1.218979, -2.156054, 1, 0.9058824, 0, 1,
-0.9938058, -0.8670561, -2.927139, 1, 0.9137255, 0, 1,
-0.9899873, -0.1228892, -1.671577, 1, 0.9176471, 0, 1,
-0.9893908, -2.205398, -2.167096, 1, 0.9254902, 0, 1,
-0.9842017, -0.7153646, -0.9292728, 1, 0.9294118, 0, 1,
-0.9840398, -0.4261921, -2.892602, 1, 0.9372549, 0, 1,
-0.9615735, 0.9079096, 0.09210155, 1, 0.9411765, 0, 1,
-0.9610984, 2.985439, -0.5134965, 1, 0.9490196, 0, 1,
-0.96089, 2.329502, -1.458727, 1, 0.9529412, 0, 1,
-0.955165, 0.9754028, -0.944939, 1, 0.9607843, 0, 1,
-0.9514506, 0.7260752, -0.4748133, 1, 0.9647059, 0, 1,
-0.9503412, -0.0536445, -1.132701, 1, 0.972549, 0, 1,
-0.9492778, -0.374988, -2.926576, 1, 0.9764706, 0, 1,
-0.9476351, 2.006226, 0.4729035, 1, 0.9843137, 0, 1,
-0.9471237, -0.3051596, -1.906727, 1, 0.9882353, 0, 1,
-0.9429674, 0.6485134, 1.009775, 1, 0.9960784, 0, 1,
-0.936231, -0.6508799, -2.055316, 0.9960784, 1, 0, 1,
-0.934532, 0.6902699, -1.389835, 0.9921569, 1, 0, 1,
-0.9344455, -0.3710335, -1.209083, 0.9843137, 1, 0, 1,
-0.9327624, -1.427336, -1.943973, 0.9803922, 1, 0, 1,
-0.9314607, 0.0483212, -1.229012, 0.972549, 1, 0, 1,
-0.9299668, 2.0134, -0.247441, 0.9686275, 1, 0, 1,
-0.9186196, 1.79207, -0.4217208, 0.9607843, 1, 0, 1,
-0.9152479, 0.9589198, -0.3341446, 0.9568627, 1, 0, 1,
-0.9100906, 0.1132484, -1.759328, 0.9490196, 1, 0, 1,
-0.9099228, -0.5877957, -3.093877, 0.945098, 1, 0, 1,
-0.9079773, -0.2128998, -0.4166037, 0.9372549, 1, 0, 1,
-0.906161, 0.6296879, -1.860745, 0.9333333, 1, 0, 1,
-0.9061285, 1.623186, -0.7857001, 0.9254902, 1, 0, 1,
-0.8877818, 0.03302167, -1.701919, 0.9215686, 1, 0, 1,
-0.8865612, 0.2097813, -0.7688104, 0.9137255, 1, 0, 1,
-0.8850724, -0.4830191, -2.362215, 0.9098039, 1, 0, 1,
-0.8827642, -1.375122, -3.385723, 0.9019608, 1, 0, 1,
-0.8797431, -2.200226, -2.16644, 0.8941177, 1, 0, 1,
-0.8726861, 0.676414, -0.2295763, 0.8901961, 1, 0, 1,
-0.8663622, -0.1930681, -1.994012, 0.8823529, 1, 0, 1,
-0.858588, 0.04829879, -2.429898, 0.8784314, 1, 0, 1,
-0.8536914, 0.5673018, -2.087176, 0.8705882, 1, 0, 1,
-0.8521619, -0.451558, -1.511255, 0.8666667, 1, 0, 1,
-0.849152, 1.093958, -0.6818851, 0.8588235, 1, 0, 1,
-0.8458963, -0.8627114, -2.633689, 0.854902, 1, 0, 1,
-0.8383692, -0.04721412, -1.956879, 0.8470588, 1, 0, 1,
-0.8324847, -1.026731, -5.34667, 0.8431373, 1, 0, 1,
-0.822417, -0.7732538, -2.398386, 0.8352941, 1, 0, 1,
-0.8197802, 0.1072939, -3.138296, 0.8313726, 1, 0, 1,
-0.8187678, -0.5564561, -2.290773, 0.8235294, 1, 0, 1,
-0.8167526, -0.4282258, -2.034291, 0.8196079, 1, 0, 1,
-0.814154, -0.4011842, -2.223934, 0.8117647, 1, 0, 1,
-0.809761, 0.5675111, -0.7701721, 0.8078431, 1, 0, 1,
-0.8073799, 0.6874031, 0.6050333, 0.8, 1, 0, 1,
-0.8043636, -1.446646, -3.61536, 0.7921569, 1, 0, 1,
-0.8042237, 1.953083, -0.8936146, 0.7882353, 1, 0, 1,
-0.8041896, -1.722131, -3.096701, 0.7803922, 1, 0, 1,
-0.8031255, 0.4698077, -1.997286, 0.7764706, 1, 0, 1,
-0.8007014, -0.4749958, -2.044248, 0.7686275, 1, 0, 1,
-0.7983653, -0.1845306, -3.635513, 0.7647059, 1, 0, 1,
-0.7980775, -0.4758215, -1.833621, 0.7568628, 1, 0, 1,
-0.7974607, 0.4489065, -1.75613, 0.7529412, 1, 0, 1,
-0.7948996, -1.522703, -2.972431, 0.7450981, 1, 0, 1,
-0.7930015, 0.0009103497, -1.910064, 0.7411765, 1, 0, 1,
-0.7869663, 0.007898951, -2.236191, 0.7333333, 1, 0, 1,
-0.7776828, 0.7049859, -0.8942417, 0.7294118, 1, 0, 1,
-0.7727001, -0.6506957, -2.751242, 0.7215686, 1, 0, 1,
-0.7686322, -0.4054485, -3.568997, 0.7176471, 1, 0, 1,
-0.7686264, 0.8588607, 0.3061073, 0.7098039, 1, 0, 1,
-0.7653962, 0.6577547, -1.08295, 0.7058824, 1, 0, 1,
-0.7641661, -0.1281703, -0.9049326, 0.6980392, 1, 0, 1,
-0.7614173, 2.842857, -0.01232567, 0.6901961, 1, 0, 1,
-0.7599601, -1.507368, -3.583026, 0.6862745, 1, 0, 1,
-0.7595534, 0.3314248, 0.1147552, 0.6784314, 1, 0, 1,
-0.7552825, 0.5382953, -0.4543308, 0.6745098, 1, 0, 1,
-0.7487213, 2.166644, -0.07329644, 0.6666667, 1, 0, 1,
-0.7482654, -0.3087287, -2.174227, 0.6627451, 1, 0, 1,
-0.7459214, -0.356744, -2.53463, 0.654902, 1, 0, 1,
-0.7446237, -0.6424224, -2.653917, 0.6509804, 1, 0, 1,
-0.7442455, -1.420403, -2.55557, 0.6431373, 1, 0, 1,
-0.7381902, -1.85472, -2.601323, 0.6392157, 1, 0, 1,
-0.7360098, -0.815456, -0.6795778, 0.6313726, 1, 0, 1,
-0.7312468, -0.7133905, -1.784942, 0.627451, 1, 0, 1,
-0.7260013, 1.173103, -1.778018, 0.6196079, 1, 0, 1,
-0.7250103, -0.1271618, -2.756848, 0.6156863, 1, 0, 1,
-0.7135826, 0.9263943, -0.3896435, 0.6078432, 1, 0, 1,
-0.7104312, -0.02728125, -1.621987, 0.6039216, 1, 0, 1,
-0.7093217, 1.234236, -2.619504, 0.5960785, 1, 0, 1,
-0.7082015, 0.5092977, -0.8265038, 0.5882353, 1, 0, 1,
-0.7065793, 0.01148094, -1.627002, 0.5843138, 1, 0, 1,
-0.7014677, 0.0352282, -1.235128, 0.5764706, 1, 0, 1,
-0.6957994, -1.740443, -1.260941, 0.572549, 1, 0, 1,
-0.6946362, -0.4996794, -0.6581703, 0.5647059, 1, 0, 1,
-0.6932872, 0.9837937, -0.9249274, 0.5607843, 1, 0, 1,
-0.6879744, 0.4712493, -0.9879559, 0.5529412, 1, 0, 1,
-0.6871108, 0.60381, -1.203055, 0.5490196, 1, 0, 1,
-0.6733485, 0.7180146, 0.2413305, 0.5411765, 1, 0, 1,
-0.6701154, 2.214324, -0.5091599, 0.5372549, 1, 0, 1,
-0.6632653, 0.5495712, -4.028347, 0.5294118, 1, 0, 1,
-0.6622095, 0.2148024, -1.240415, 0.5254902, 1, 0, 1,
-0.6509772, -0.2832438, -1.882721, 0.5176471, 1, 0, 1,
-0.6502084, 0.6988964, -1.185684, 0.5137255, 1, 0, 1,
-0.648421, -1.859992, -2.631647, 0.5058824, 1, 0, 1,
-0.6455598, 0.7412289, 0.8232271, 0.5019608, 1, 0, 1,
-0.6421371, -0.2739947, -1.889874, 0.4941176, 1, 0, 1,
-0.6400694, -1.534621, -2.0098, 0.4862745, 1, 0, 1,
-0.6396608, -0.5011359, -1.150435, 0.4823529, 1, 0, 1,
-0.6395023, 0.9634736, 0.7981185, 0.4745098, 1, 0, 1,
-0.6315994, 2.03959, -1.292564, 0.4705882, 1, 0, 1,
-0.6299213, -0.4067325, -3.624974, 0.4627451, 1, 0, 1,
-0.628615, 0.6745732, -0.4710756, 0.4588235, 1, 0, 1,
-0.6257117, -1.199168, -1.875836, 0.4509804, 1, 0, 1,
-0.6172506, -1.301392, -1.203777, 0.4470588, 1, 0, 1,
-0.6165149, -0.8336556, -2.718182, 0.4392157, 1, 0, 1,
-0.6140413, 1.463018, -0.2636323, 0.4352941, 1, 0, 1,
-0.613009, 1.815383, -0.2542533, 0.427451, 1, 0, 1,
-0.6077479, -0.5983709, 0.1491277, 0.4235294, 1, 0, 1,
-0.6071321, -0.8590509, -1.957622, 0.4156863, 1, 0, 1,
-0.6069118, -1.457508, -3.14485, 0.4117647, 1, 0, 1,
-0.6060532, 0.1203478, -0.3801949, 0.4039216, 1, 0, 1,
-0.5980347, -0.5033535, -2.438907, 0.3960784, 1, 0, 1,
-0.5945876, 1.811065, 1.123668, 0.3921569, 1, 0, 1,
-0.5917044, 0.1365671, -0.6997527, 0.3843137, 1, 0, 1,
-0.5883594, -0.2382821, -1.174681, 0.3803922, 1, 0, 1,
-0.5846921, -0.2473633, -3.331795, 0.372549, 1, 0, 1,
-0.5839672, -0.4083225, -1.269704, 0.3686275, 1, 0, 1,
-0.5826802, 1.15533, 0.1867899, 0.3607843, 1, 0, 1,
-0.5786756, -0.8679962, -1.736464, 0.3568628, 1, 0, 1,
-0.5775259, 0.5183407, -0.3892657, 0.3490196, 1, 0, 1,
-0.5752616, 1.185231, -2.278961, 0.345098, 1, 0, 1,
-0.5726401, 1.169542, 0.4160688, 0.3372549, 1, 0, 1,
-0.5709942, 0.5311336, 1.353058, 0.3333333, 1, 0, 1,
-0.5673395, 0.4839552, -0.6435543, 0.3254902, 1, 0, 1,
-0.5670422, -0.8270649, -0.8399217, 0.3215686, 1, 0, 1,
-0.5613372, -0.886077, -3.019736, 0.3137255, 1, 0, 1,
-0.5575222, 1.377154, 1.210388, 0.3098039, 1, 0, 1,
-0.555912, -1.20989, -2.342142, 0.3019608, 1, 0, 1,
-0.5551513, -1.196895, -3.898224, 0.2941177, 1, 0, 1,
-0.5534508, -1.083004, -2.008881, 0.2901961, 1, 0, 1,
-0.5516295, 1.249034, -1.543731, 0.282353, 1, 0, 1,
-0.5483071, -0.9620107, -1.986879, 0.2784314, 1, 0, 1,
-0.5460668, -0.7370895, -2.350879, 0.2705882, 1, 0, 1,
-0.545151, 0.2036264, -1.24467, 0.2666667, 1, 0, 1,
-0.5449018, -1.634687, -2.365521, 0.2588235, 1, 0, 1,
-0.5448986, -0.09114538, -2.908588, 0.254902, 1, 0, 1,
-0.5440434, -1.64539, -2.981224, 0.2470588, 1, 0, 1,
-0.5432282, -0.775906, -3.643141, 0.2431373, 1, 0, 1,
-0.5359462, 0.3684495, -2.15468, 0.2352941, 1, 0, 1,
-0.5348966, -0.07634778, -1.192737, 0.2313726, 1, 0, 1,
-0.5344482, 0.7676982, 0.6617204, 0.2235294, 1, 0, 1,
-0.5305006, -1.859231, -3.739647, 0.2196078, 1, 0, 1,
-0.5269868, -0.5858485, -1.839287, 0.2117647, 1, 0, 1,
-0.5209959, -0.1656906, -2.262769, 0.2078431, 1, 0, 1,
-0.5165056, -0.2892996, -2.632583, 0.2, 1, 0, 1,
-0.5091626, 0.686008, -0.8760177, 0.1921569, 1, 0, 1,
-0.5058712, 0.4051193, -1.00031, 0.1882353, 1, 0, 1,
-0.5045502, -1.056476, -1.771131, 0.1803922, 1, 0, 1,
-0.504149, -0.7066705, -2.096285, 0.1764706, 1, 0, 1,
-0.5036198, 1.11759, -1.228535, 0.1686275, 1, 0, 1,
-0.5028131, -1.17544, -1.806743, 0.1647059, 1, 0, 1,
-0.5000084, -0.2033559, -1.097404, 0.1568628, 1, 0, 1,
-0.4922218, -1.813082, -2.306351, 0.1529412, 1, 0, 1,
-0.4914561, 0.8391933, -1.438544, 0.145098, 1, 0, 1,
-0.4840946, 0.08990415, -1.14897, 0.1411765, 1, 0, 1,
-0.4806594, 0.03601117, -0.6085012, 0.1333333, 1, 0, 1,
-0.4765506, 1.406857, -1.580557, 0.1294118, 1, 0, 1,
-0.4764721, -0.5888701, -1.544836, 0.1215686, 1, 0, 1,
-0.4761475, 0.2422359, -1.29519, 0.1176471, 1, 0, 1,
-0.4739282, 0.07202099, -2.291022, 0.1098039, 1, 0, 1,
-0.4706458, 1.248168, -2.280236, 0.1058824, 1, 0, 1,
-0.4671277, 0.6223074, -0.5459781, 0.09803922, 1, 0, 1,
-0.466731, -1.454025, -1.841521, 0.09019608, 1, 0, 1,
-0.466413, -0.9718591, -3.15778, 0.08627451, 1, 0, 1,
-0.4597061, 1.367319, 0.9123247, 0.07843138, 1, 0, 1,
-0.4579198, 0.4386072, -1.214335, 0.07450981, 1, 0, 1,
-0.449798, -0.605965, -2.212297, 0.06666667, 1, 0, 1,
-0.447719, 2.673992, -0.2604623, 0.0627451, 1, 0, 1,
-0.4474743, 1.414566, -0.4562237, 0.05490196, 1, 0, 1,
-0.4471952, -0.5866525, -1.806437, 0.05098039, 1, 0, 1,
-0.4468551, 2.671524, -0.2567795, 0.04313726, 1, 0, 1,
-0.4454423, -2.71166, -3.564271, 0.03921569, 1, 0, 1,
-0.4435095, 0.8961679, -0.32128, 0.03137255, 1, 0, 1,
-0.4408618, -1.011988, -3.098513, 0.02745098, 1, 0, 1,
-0.4397301, 0.6052946, 0.6069007, 0.01960784, 1, 0, 1,
-0.4376135, -0.01015032, -0.4973441, 0.01568628, 1, 0, 1,
-0.4269885, 0.5769393, 0.83266, 0.007843138, 1, 0, 1,
-0.4266978, -0.7922748, -3.200685, 0.003921569, 1, 0, 1,
-0.4264556, 1.016723, -2.410637, 0, 1, 0.003921569, 1,
-0.4226795, 1.045503, -1.018944, 0, 1, 0.01176471, 1,
-0.4201109, 0.1181424, 1.017081, 0, 1, 0.01568628, 1,
-0.4159228, 0.0156073, -2.107673, 0, 1, 0.02352941, 1,
-0.4136236, -1.089526, -3.956, 0, 1, 0.02745098, 1,
-0.4091811, -0.4257575, -2.068138, 0, 1, 0.03529412, 1,
-0.4085626, -1.151303, -3.712464, 0, 1, 0.03921569, 1,
-0.4020602, 1.959437, 0.4113194, 0, 1, 0.04705882, 1,
-0.4012412, -2.0614, -2.049726, 0, 1, 0.05098039, 1,
-0.3975901, 0.6722981, -0.7383988, 0, 1, 0.05882353, 1,
-0.3873764, -0.05975962, -0.9900672, 0, 1, 0.0627451, 1,
-0.3862082, 1.363789, 0.250699, 0, 1, 0.07058824, 1,
-0.3829651, -0.5128712, -2.340093, 0, 1, 0.07450981, 1,
-0.3820332, -0.9086829, -2.871672, 0, 1, 0.08235294, 1,
-0.3782622, 0.1063121, -0.993412, 0, 1, 0.08627451, 1,
-0.3730557, -0.3178566, -1.917969, 0, 1, 0.09411765, 1,
-0.371245, 0.1137621, -0.8583083, 0, 1, 0.1019608, 1,
-0.3615246, -0.2310927, -0.5551568, 0, 1, 0.1058824, 1,
-0.3603292, 0.5294048, -0.6533322, 0, 1, 0.1137255, 1,
-0.3580746, 0.1108189, -1.110889, 0, 1, 0.1176471, 1,
-0.3538476, -1.433465, -4.356388, 0, 1, 0.1254902, 1,
-0.3492851, 0.2365467, -0.7542249, 0, 1, 0.1294118, 1,
-0.3469884, -0.01262443, -1.740243, 0, 1, 0.1372549, 1,
-0.3453492, -1.275313, -2.85435, 0, 1, 0.1411765, 1,
-0.3426054, -1.052704, -3.231984, 0, 1, 0.1490196, 1,
-0.342214, -1.683201, -0.7092612, 0, 1, 0.1529412, 1,
-0.3410341, 0.7221214, -0.6168028, 0, 1, 0.1607843, 1,
-0.3409428, -1.289955, -3.633885, 0, 1, 0.1647059, 1,
-0.3375655, 0.6355477, 0.1089625, 0, 1, 0.172549, 1,
-0.3323297, -0.8604331, -1.798939, 0, 1, 0.1764706, 1,
-0.3249835, 0.5838206, -0.6482173, 0, 1, 0.1843137, 1,
-0.3186438, -1.417671, -2.983507, 0, 1, 0.1882353, 1,
-0.3179438, 0.3468654, -0.617932, 0, 1, 0.1960784, 1,
-0.3134043, 0.6530727, -1.189364, 0, 1, 0.2039216, 1,
-0.2947654, 0.2409986, 0.4484198, 0, 1, 0.2078431, 1,
-0.2939982, 0.4270913, -1.741523, 0, 1, 0.2156863, 1,
-0.2887209, 1.337234, 1.195256, 0, 1, 0.2196078, 1,
-0.2886767, -0.1869081, -2.382512, 0, 1, 0.227451, 1,
-0.2886599, 1.336756, -1.776094, 0, 1, 0.2313726, 1,
-0.2869569, 1.104583, 0.1882604, 0, 1, 0.2392157, 1,
-0.2834735, 2.218073, 1.772855, 0, 1, 0.2431373, 1,
-0.2814465, -0.4189824, -1.930447, 0, 1, 0.2509804, 1,
-0.2807838, -0.1201602, -2.482194, 0, 1, 0.254902, 1,
-0.2789014, -0.4174424, -1.677622, 0, 1, 0.2627451, 1,
-0.2753648, -0.492128, -2.864521, 0, 1, 0.2666667, 1,
-0.2715502, -0.1763023, -2.794805, 0, 1, 0.2745098, 1,
-0.2712599, 2.18644, -0.2651109, 0, 1, 0.2784314, 1,
-0.2669632, -0.8464524, -3.821224, 0, 1, 0.2862745, 1,
-0.263466, -0.08985382, -0.5516019, 0, 1, 0.2901961, 1,
-0.2617948, 0.9081904, -0.1554262, 0, 1, 0.2980392, 1,
-0.260132, 1.12016, -0.4808419, 0, 1, 0.3058824, 1,
-0.2555824, 2.617582, 0.5991257, 0, 1, 0.3098039, 1,
-0.2552565, -2.21041, -1.095341, 0, 1, 0.3176471, 1,
-0.2537951, 1.172137, 0.4580032, 0, 1, 0.3215686, 1,
-0.2528185, 1.175373, -0.7802617, 0, 1, 0.3294118, 1,
-0.2485351, -1.138396, -4.132668, 0, 1, 0.3333333, 1,
-0.238923, 0.844806, -0.061499, 0, 1, 0.3411765, 1,
-0.2387318, -3.922455, -3.077978, 0, 1, 0.345098, 1,
-0.2385933, 0.03429501, -0.8697762, 0, 1, 0.3529412, 1,
-0.2336939, -0.123408, -0.7276574, 0, 1, 0.3568628, 1,
-0.2334643, -0.3482631, -3.809794, 0, 1, 0.3647059, 1,
-0.2300929, -0.8480225, -3.358106, 0, 1, 0.3686275, 1,
-0.2288983, 0.6329257, -0.1231104, 0, 1, 0.3764706, 1,
-0.2284641, 1.657447, 0.554604, 0, 1, 0.3803922, 1,
-0.2274091, 0.6218984, -1.493068, 0, 1, 0.3882353, 1,
-0.222958, -0.8741857, -5.191272, 0, 1, 0.3921569, 1,
-0.2226951, 0.05797931, -0.6261596, 0, 1, 0.4, 1,
-0.2220737, -0.09485656, -2.798996, 0, 1, 0.4078431, 1,
-0.2169015, 1.525122, -1.078345, 0, 1, 0.4117647, 1,
-0.2163175, -0.0009991368, -1.829541, 0, 1, 0.4196078, 1,
-0.2133909, 0.9854693, -1.312722, 0, 1, 0.4235294, 1,
-0.2114615, -0.6703129, -2.233284, 0, 1, 0.4313726, 1,
-0.2113241, -0.5965903, -1.254974, 0, 1, 0.4352941, 1,
-0.2066003, 1.673481, 0.5703118, 0, 1, 0.4431373, 1,
-0.2061005, -1.386613, -3.180244, 0, 1, 0.4470588, 1,
-0.2049676, 0.1968171, -0.6296253, 0, 1, 0.454902, 1,
-0.2036002, 1.243829, -2.173664, 0, 1, 0.4588235, 1,
-0.2031774, -1.235725, -2.499418, 0, 1, 0.4666667, 1,
-0.1972608, 1.562106, -0.107555, 0, 1, 0.4705882, 1,
-0.1960423, -0.1647206, -3.322401, 0, 1, 0.4784314, 1,
-0.1958589, 0.1268097, -1.208741, 0, 1, 0.4823529, 1,
-0.194788, 1.04689, -1.900766, 0, 1, 0.4901961, 1,
-0.193952, -1.493566, -4.653653, 0, 1, 0.4941176, 1,
-0.191842, -1.15676, -2.659904, 0, 1, 0.5019608, 1,
-0.1917423, -1.094361, -1.442258, 0, 1, 0.509804, 1,
-0.1916304, -1.894386, -3.001029, 0, 1, 0.5137255, 1,
-0.1885982, -0.1963985, -1.440665, 0, 1, 0.5215687, 1,
-0.1866592, -0.2403501, -3.54941, 0, 1, 0.5254902, 1,
-0.1820765, -0.2156065, -2.767749, 0, 1, 0.5333334, 1,
-0.1779546, 0.7814787, 0.1581171, 0, 1, 0.5372549, 1,
-0.1705806, -0.629579, -1.708675, 0, 1, 0.5450981, 1,
-0.1701817, 1.269839, -0.6139742, 0, 1, 0.5490196, 1,
-0.1691988, -0.06927206, -0.69176, 0, 1, 0.5568628, 1,
-0.1691108, 0.2403516, 0.7729952, 0, 1, 0.5607843, 1,
-0.1690264, 0.5682949, -0.1661843, 0, 1, 0.5686275, 1,
-0.1655074, 0.2694493, 1.36651, 0, 1, 0.572549, 1,
-0.1645706, 1.226259, -0.9122458, 0, 1, 0.5803922, 1,
-0.1615132, 0.3440298, -1.74677, 0, 1, 0.5843138, 1,
-0.1612896, 0.2423775, -1.304691, 0, 1, 0.5921569, 1,
-0.1602999, -0.1680292, -4.942679, 0, 1, 0.5960785, 1,
-0.1586308, 0.9208957, 0.2078014, 0, 1, 0.6039216, 1,
-0.1566454, -0.6808071, -4.150363, 0, 1, 0.6117647, 1,
-0.155713, 0.1358463, -0.2048499, 0, 1, 0.6156863, 1,
-0.1521885, -0.0406673, -3.274397, 0, 1, 0.6235294, 1,
-0.1511345, -1.327449, -1.577742, 0, 1, 0.627451, 1,
-0.1504294, -0.3166973, -3.408392, 0, 1, 0.6352941, 1,
-0.1479998, 1.558906, 0.5229725, 0, 1, 0.6392157, 1,
-0.1399058, -0.5558833, -2.644312, 0, 1, 0.6470588, 1,
-0.1366186, 0.7964575, 0.5179194, 0, 1, 0.6509804, 1,
-0.1341147, 1.00607, -0.1330873, 0, 1, 0.6588235, 1,
-0.1336019, 1.167461, 0.7537661, 0, 1, 0.6627451, 1,
-0.1289707, -1.645468, -3.326427, 0, 1, 0.6705883, 1,
-0.125516, 0.0711557, -2.865225, 0, 1, 0.6745098, 1,
-0.123046, -0.03610263, -3.039454, 0, 1, 0.682353, 1,
-0.1133306, -0.4987429, -2.4538, 0, 1, 0.6862745, 1,
-0.1124285, -0.197584, -0.9900016, 0, 1, 0.6941177, 1,
-0.109382, -1.647359, -3.050759, 0, 1, 0.7019608, 1,
-0.1093414, 0.06360231, -1.113429, 0, 1, 0.7058824, 1,
-0.106581, -0.6671209, -3.827717, 0, 1, 0.7137255, 1,
-0.1039235, -1.261998, -4.242831, 0, 1, 0.7176471, 1,
-0.1018405, -0.6095439, -3.750983, 0, 1, 0.7254902, 1,
-0.1000095, -0.4907867, -1.577486, 0, 1, 0.7294118, 1,
-0.09919759, -1.466904, -3.126087, 0, 1, 0.7372549, 1,
-0.09671014, -0.7687906, -4.099504, 0, 1, 0.7411765, 1,
-0.09644568, 0.2527703, 0.8567007, 0, 1, 0.7490196, 1,
-0.0935595, -0.770646, -2.558282, 0, 1, 0.7529412, 1,
-0.09314476, 0.7581776, -0.9223847, 0, 1, 0.7607843, 1,
-0.09162822, 1.281274, 0.3010929, 0, 1, 0.7647059, 1,
-0.08980242, 0.4535816, -0.5493566, 0, 1, 0.772549, 1,
-0.08637371, 1.150771, 2.173109, 0, 1, 0.7764706, 1,
-0.08524378, -0.5878206, -2.659247, 0, 1, 0.7843137, 1,
-0.08334575, -0.2069353, -1.4416, 0, 1, 0.7882353, 1,
-0.08325933, 1.099694, 1.824518, 0, 1, 0.7960784, 1,
-0.08280791, -0.2017887, -2.740936, 0, 1, 0.8039216, 1,
-0.08078383, -0.7601461, -1.442957, 0, 1, 0.8078431, 1,
-0.06936055, -0.8062643, -3.487617, 0, 1, 0.8156863, 1,
-0.06602903, -0.08298079, -4.359679, 0, 1, 0.8196079, 1,
-0.06265034, 1.262522, -1.809194, 0, 1, 0.827451, 1,
-0.06225978, 0.7136003, 1.376361, 0, 1, 0.8313726, 1,
-0.06027501, 2.087542, -1.938957, 0, 1, 0.8392157, 1,
-0.05558842, 1.032833, 1.116424, 0, 1, 0.8431373, 1,
-0.05148043, -1.425804, -5.359089, 0, 1, 0.8509804, 1,
-0.0490633, -1.000435, -4.318084, 0, 1, 0.854902, 1,
-0.04414173, 0.4449329, -1.531247, 0, 1, 0.8627451, 1,
-0.04207128, 0.6864502, 1.379107, 0, 1, 0.8666667, 1,
-0.04162624, 0.1653924, -0.4075789, 0, 1, 0.8745098, 1,
-0.04035239, -1.186148, -3.68388, 0, 1, 0.8784314, 1,
-0.03930629, 1.322889, -0.7686813, 0, 1, 0.8862745, 1,
-0.0385366, 1.288381, -0.982589, 0, 1, 0.8901961, 1,
-0.03325322, -0.5466802, -3.968666, 0, 1, 0.8980392, 1,
-0.03010175, 0.2615258, -0.6354766, 0, 1, 0.9058824, 1,
-0.02703574, 1.621938, -0.9318419, 0, 1, 0.9098039, 1,
-0.02387468, 1.307635, 0.4587961, 0, 1, 0.9176471, 1,
-0.02200346, 1.342181, 0.8232213, 0, 1, 0.9215686, 1,
-0.02154299, -1.076439, -5.167101, 0, 1, 0.9294118, 1,
-0.02111093, 1.422503, 0.1405275, 0, 1, 0.9333333, 1,
-0.01641298, 0.09645534, -0.08892784, 0, 1, 0.9411765, 1,
-0.01633663, 0.6042711, -1.592049, 0, 1, 0.945098, 1,
-0.01541086, 0.699743, -0.6112369, 0, 1, 0.9529412, 1,
-0.01446706, 0.6168925, 0.6494244, 0, 1, 0.9568627, 1,
-0.01259606, -0.8700418, -4.023306, 0, 1, 0.9647059, 1,
-0.01198232, -0.7406032, -2.197178, 0, 1, 0.9686275, 1,
-0.01181786, 0.3772134, -0.5821779, 0, 1, 0.9764706, 1,
-0.009980417, -0.411353, -3.258596, 0, 1, 0.9803922, 1,
-0.005312913, 0.1884685, -0.9664385, 0, 1, 0.9882353, 1,
-0.005303169, 0.2514374, 0.5468554, 0, 1, 0.9921569, 1,
-0.004801875, -0.6550368, -4.576076, 0, 1, 1, 1,
0.0001239029, -0.06435685, 3.757787, 0, 0.9921569, 1, 1,
0.002099955, -1.232107, 2.385154, 0, 0.9882353, 1, 1,
0.005699161, 1.262626, 1.763506, 0, 0.9803922, 1, 1,
0.008223604, -1.237247, 4.0165, 0, 0.9764706, 1, 1,
0.009575343, 0.3789361, 1.068923, 0, 0.9686275, 1, 1,
0.01099242, 1.128685, -1.759505, 0, 0.9647059, 1, 1,
0.01739027, 0.5275696, -0.8080261, 0, 0.9568627, 1, 1,
0.02217462, -1.984823, 3.718015, 0, 0.9529412, 1, 1,
0.02799334, -1.110596, 3.953305, 0, 0.945098, 1, 1,
0.02802919, 1.543171, 0.794477, 0, 0.9411765, 1, 1,
0.03691481, -0.2454114, 3.278332, 0, 0.9333333, 1, 1,
0.05078398, -1.27208, 2.504824, 0, 0.9294118, 1, 1,
0.05394937, 0.3064339, -0.8367321, 0, 0.9215686, 1, 1,
0.05516964, -0.7753772, 3.585157, 0, 0.9176471, 1, 1,
0.0584144, -0.9429424, 0.2686264, 0, 0.9098039, 1, 1,
0.05903351, 0.673601, 1.590989, 0, 0.9058824, 1, 1,
0.06700099, 1.379037, -0.6408495, 0, 0.8980392, 1, 1,
0.06732792, -0.1080973, 2.738264, 0, 0.8901961, 1, 1,
0.06946889, -1.009387, 0.9951157, 0, 0.8862745, 1, 1,
0.07141806, 0.4068702, 1.83441, 0, 0.8784314, 1, 1,
0.07296263, 0.5119993, 0.4388384, 0, 0.8745098, 1, 1,
0.07563559, 1.088954, -0.4343837, 0, 0.8666667, 1, 1,
0.07830987, -0.3517475, 3.061145, 0, 0.8627451, 1, 1,
0.07999213, -0.6543576, 4.79088, 0, 0.854902, 1, 1,
0.08813328, 0.5608852, 0.891413, 0, 0.8509804, 1, 1,
0.09308231, -0.7226236, 2.316113, 0, 0.8431373, 1, 1,
0.09380757, -0.3871539, 2.669526, 0, 0.8392157, 1, 1,
0.09523098, -2.30722, 4.785244, 0, 0.8313726, 1, 1,
0.09608978, -0.4522207, 1.201742, 0, 0.827451, 1, 1,
0.09851364, -0.829228, 3.709909, 0, 0.8196079, 1, 1,
0.104388, -0.6024553, 2.227579, 0, 0.8156863, 1, 1,
0.104627, -0.9505755, 2.369802, 0, 0.8078431, 1, 1,
0.1061417, 0.2928427, -1.222949, 0, 0.8039216, 1, 1,
0.1070621, -0.6231768, 3.419053, 0, 0.7960784, 1, 1,
0.1085113, 1.048892, 0.5941135, 0, 0.7882353, 1, 1,
0.1096461, -0.8406961, 3.332895, 0, 0.7843137, 1, 1,
0.1123569, -1.201524, 2.432253, 0, 0.7764706, 1, 1,
0.112961, -0.06606395, 2.538359, 0, 0.772549, 1, 1,
0.1163658, 0.1898176, -0.8713279, 0, 0.7647059, 1, 1,
0.1234082, 0.5377602, -0.1324971, 0, 0.7607843, 1, 1,
0.125151, -0.05746183, 1.877578, 0, 0.7529412, 1, 1,
0.1262163, -0.3518195, 2.19006, 0, 0.7490196, 1, 1,
0.1292954, 1.614342, 0.5608682, 0, 0.7411765, 1, 1,
0.1300667, 0.7605628, 0.04720813, 0, 0.7372549, 1, 1,
0.1318742, 1.088611, -0.1969681, 0, 0.7294118, 1, 1,
0.13265, -1.13584, 4.44773, 0, 0.7254902, 1, 1,
0.135744, -1.218736, 2.485999, 0, 0.7176471, 1, 1,
0.137782, 1.097777, 3.146785, 0, 0.7137255, 1, 1,
0.139492, -0.990154, 1.639645, 0, 0.7058824, 1, 1,
0.1400133, -0.316915, 2.747213, 0, 0.6980392, 1, 1,
0.1435919, 1.028694, 0.9180824, 0, 0.6941177, 1, 1,
0.1449377, 0.373264, 1.378237, 0, 0.6862745, 1, 1,
0.1481839, -1.344793, 1.678281, 0, 0.682353, 1, 1,
0.1501098, 0.1039225, 1.664006, 0, 0.6745098, 1, 1,
0.1518874, -0.7709515, 3.12921, 0, 0.6705883, 1, 1,
0.1522635, 0.515978, -1.72208, 0, 0.6627451, 1, 1,
0.154535, -0.6116671, 3.501514, 0, 0.6588235, 1, 1,
0.1613332, -1.642682, 3.418376, 0, 0.6509804, 1, 1,
0.1672771, -0.4298907, 4.491013, 0, 0.6470588, 1, 1,
0.1689948, 0.32149, 1.349977, 0, 0.6392157, 1, 1,
0.1696827, -0.333777, 3.460202, 0, 0.6352941, 1, 1,
0.1732396, -0.5743638, 2.36742, 0, 0.627451, 1, 1,
0.1737554, -0.08025839, 1.421147, 0, 0.6235294, 1, 1,
0.1768243, 1.584964, 0.8150213, 0, 0.6156863, 1, 1,
0.1837856, -0.722436, 2.026629, 0, 0.6117647, 1, 1,
0.1876387, -1.398214, 3.984671, 0, 0.6039216, 1, 1,
0.1922189, -0.2524053, 1.788135, 0, 0.5960785, 1, 1,
0.1925001, -0.302506, 1.505396, 0, 0.5921569, 1, 1,
0.1997952, 0.5149433, -0.4454456, 0, 0.5843138, 1, 1,
0.2001276, -1.136843, 2.913927, 0, 0.5803922, 1, 1,
0.2041249, 0.6162117, -1.287276, 0, 0.572549, 1, 1,
0.2143771, -0.9598715, 3.996286, 0, 0.5686275, 1, 1,
0.2163923, 1.851866, -0.6994326, 0, 0.5607843, 1, 1,
0.2172838, 0.3067617, 0.4586178, 0, 0.5568628, 1, 1,
0.2240025, 0.1608917, 0.8777975, 0, 0.5490196, 1, 1,
0.2263622, 0.1058161, 2.418126, 0, 0.5450981, 1, 1,
0.226851, 1.097725, 0.5999023, 0, 0.5372549, 1, 1,
0.2279863, 1.643348, 0.5735632, 0, 0.5333334, 1, 1,
0.2284896, 0.4088725, 0.5672097, 0, 0.5254902, 1, 1,
0.2372537, -1.295706, 2.775488, 0, 0.5215687, 1, 1,
0.2392639, 1.176326, -0.2760365, 0, 0.5137255, 1, 1,
0.240551, 1.900652, -0.2078552, 0, 0.509804, 1, 1,
0.2453448, -0.03095248, 0.7322282, 0, 0.5019608, 1, 1,
0.2475035, -0.05123247, 1.639117, 0, 0.4941176, 1, 1,
0.2485442, 1.104332, 1.057712, 0, 0.4901961, 1, 1,
0.2486497, -2.008505, 2.582707, 0, 0.4823529, 1, 1,
0.2506248, 0.8384801, -0.6127726, 0, 0.4784314, 1, 1,
0.2510701, -0.8623645, 2.98918, 0, 0.4705882, 1, 1,
0.254692, 0.5410951, 1.245701, 0, 0.4666667, 1, 1,
0.263016, 0.9171882, -1.274833, 0, 0.4588235, 1, 1,
0.2653719, -1.734833, 3.93277, 0, 0.454902, 1, 1,
0.2660044, 0.007832368, 2.073829, 0, 0.4470588, 1, 1,
0.2662122, -0.6781857, 4.406951, 0, 0.4431373, 1, 1,
0.2672949, 1.186015, 1.001953, 0, 0.4352941, 1, 1,
0.2723859, 1.396726, -2.287739, 0, 0.4313726, 1, 1,
0.2778873, 0.3581363, -1.027689, 0, 0.4235294, 1, 1,
0.2796325, 0.2249866, 0.817045, 0, 0.4196078, 1, 1,
0.2826948, 0.2475144, 0.0791632, 0, 0.4117647, 1, 1,
0.2834113, -0.1600898, 3.156223, 0, 0.4078431, 1, 1,
0.2839782, 1.203769, -0.8160713, 0, 0.4, 1, 1,
0.2865397, 0.5917172, 0.03068078, 0, 0.3921569, 1, 1,
0.2869929, -0.6634352, 3.19753, 0, 0.3882353, 1, 1,
0.2884737, 0.3773599, -1.129529, 0, 0.3803922, 1, 1,
0.2940454, 1.782729, -1.656783, 0, 0.3764706, 1, 1,
0.2953097, 0.1990916, 1.020754, 0, 0.3686275, 1, 1,
0.2996635, 0.1178017, 1.045393, 0, 0.3647059, 1, 1,
0.3009229, -0.9038761, 2.193417, 0, 0.3568628, 1, 1,
0.3014416, -0.6630828, 3.015065, 0, 0.3529412, 1, 1,
0.302066, 0.8945915, 1.037884, 0, 0.345098, 1, 1,
0.3027042, -0.4612606, 1.011316, 0, 0.3411765, 1, 1,
0.3055966, 0.275106, -0.1586036, 0, 0.3333333, 1, 1,
0.3066464, -0.166283, 2.147013, 0, 0.3294118, 1, 1,
0.312858, -0.481705, 2.396153, 0, 0.3215686, 1, 1,
0.3146875, 1.44998, 1.01063, 0, 0.3176471, 1, 1,
0.3152207, 0.5076699, 0.4262904, 0, 0.3098039, 1, 1,
0.3183433, 1.178656, 3.318135, 0, 0.3058824, 1, 1,
0.3185175, 0.4773348, 1.779014, 0, 0.2980392, 1, 1,
0.3194993, -0.2138343, 2.005787, 0, 0.2901961, 1, 1,
0.323241, 1.236404, 0.5412014, 0, 0.2862745, 1, 1,
0.3257703, 0.5283641, -0.4241368, 0, 0.2784314, 1, 1,
0.3272906, 1.359259, -0.6720139, 0, 0.2745098, 1, 1,
0.3285568, 0.03238124, 0.1954057, 0, 0.2666667, 1, 1,
0.3334591, -0.9371885, 3.204678, 0, 0.2627451, 1, 1,
0.3377323, -0.986447, 3.328597, 0, 0.254902, 1, 1,
0.3418323, 0.1807401, 0.2533799, 0, 0.2509804, 1, 1,
0.3458734, 1.032386, 0.8443469, 0, 0.2431373, 1, 1,
0.3490943, -1.535791, 3.547431, 0, 0.2392157, 1, 1,
0.3499943, 0.8611783, 2.294333, 0, 0.2313726, 1, 1,
0.3531346, 1.259597, 1.129679, 0, 0.227451, 1, 1,
0.3559337, -0.9404234, 3.36004, 0, 0.2196078, 1, 1,
0.3577482, 1.973172, -0.01701107, 0, 0.2156863, 1, 1,
0.3606629, -0.1259083, 3.416698, 0, 0.2078431, 1, 1,
0.3611362, -0.1106994, 1.285201, 0, 0.2039216, 1, 1,
0.3621374, -0.697313, 4.020939, 0, 0.1960784, 1, 1,
0.3625969, 0.1543434, 0.8630617, 0, 0.1882353, 1, 1,
0.3673244, -1.261661, 3.060511, 0, 0.1843137, 1, 1,
0.3690614, 1.26895, 1.609446, 0, 0.1764706, 1, 1,
0.3737808, 0.0503023, 1.483414, 0, 0.172549, 1, 1,
0.374108, -0.3800943, 2.178737, 0, 0.1647059, 1, 1,
0.3768408, 0.2562633, 1.629482, 0, 0.1607843, 1, 1,
0.3789062, 1.793095, -0.4579982, 0, 0.1529412, 1, 1,
0.3817258, 1.960395, -0.5417674, 0, 0.1490196, 1, 1,
0.3826492, 1.347149, 0.5216311, 0, 0.1411765, 1, 1,
0.3834071, -1.221729, 2.682875, 0, 0.1372549, 1, 1,
0.385362, 1.06934, -0.6042214, 0, 0.1294118, 1, 1,
0.3907307, 2.930391, 0.7765958, 0, 0.1254902, 1, 1,
0.3908497, 1.025559, 0.7740268, 0, 0.1176471, 1, 1,
0.3929893, 0.5536272, 0.7495705, 0, 0.1137255, 1, 1,
0.3956182, -0.7072054, 1.408067, 0, 0.1058824, 1, 1,
0.3963407, 0.2788989, 2.412645, 0, 0.09803922, 1, 1,
0.3966236, -0.7130394, 4.098579, 0, 0.09411765, 1, 1,
0.4076394, -1.242721, 3.502927, 0, 0.08627451, 1, 1,
0.4086198, -0.1923273, 2.84164, 0, 0.08235294, 1, 1,
0.410374, -0.1237676, 1.643477, 0, 0.07450981, 1, 1,
0.4114082, 0.4929381, -0.2800555, 0, 0.07058824, 1, 1,
0.4115295, -1.368675, 3.590981, 0, 0.0627451, 1, 1,
0.4143156, -2.390435, 2.944117, 0, 0.05882353, 1, 1,
0.4203472, -0.3853531, 3.344877, 0, 0.05098039, 1, 1,
0.4223664, 0.5260171, 0.1009945, 0, 0.04705882, 1, 1,
0.423613, 0.6672737, 0.3296404, 0, 0.03921569, 1, 1,
0.4241108, 1.79712, 0.03388323, 0, 0.03529412, 1, 1,
0.4283116, 1.166709, -1.310565, 0, 0.02745098, 1, 1,
0.4288788, 0.2749782, 1.113442, 0, 0.02352941, 1, 1,
0.436172, 1.891813, 0.05210066, 0, 0.01568628, 1, 1,
0.4422182, 0.04628621, 1.932743, 0, 0.01176471, 1, 1,
0.4426834, 0.8868073, -0.1461356, 0, 0.003921569, 1, 1,
0.4451556, 2.557436, -0.5416853, 0.003921569, 0, 1, 1,
0.4487703, 0.1316634, 0.2168335, 0.007843138, 0, 1, 1,
0.451733, 0.8230139, -1.38583, 0.01568628, 0, 1, 1,
0.4601815, 1.936171, 1.020221, 0.01960784, 0, 1, 1,
0.4659099, -0.7241632, 2.004305, 0.02745098, 0, 1, 1,
0.4660204, -0.5436825, 1.136398, 0.03137255, 0, 1, 1,
0.4708895, 0.8523504, 3.069278, 0.03921569, 0, 1, 1,
0.4829403, 1.205309, 1.732753, 0.04313726, 0, 1, 1,
0.484923, 0.8067071, 1.048803, 0.05098039, 0, 1, 1,
0.487288, 0.0594889, 0.5661293, 0.05490196, 0, 1, 1,
0.4889936, 1.276344, -1.20488, 0.0627451, 0, 1, 1,
0.4892061, -0.892943, 2.14579, 0.06666667, 0, 1, 1,
0.4939951, -0.9719008, 1.978758, 0.07450981, 0, 1, 1,
0.4940028, -0.6052341, 2.558473, 0.07843138, 0, 1, 1,
0.4989946, -0.04498313, 4.402305, 0.08627451, 0, 1, 1,
0.5018307, 0.2999582, 0.9246346, 0.09019608, 0, 1, 1,
0.5023115, -1.099887, 2.650063, 0.09803922, 0, 1, 1,
0.5038901, 0.2943821, 0.8041548, 0.1058824, 0, 1, 1,
0.508509, 0.2649697, 1.960987, 0.1098039, 0, 1, 1,
0.5132247, -0.4395633, 4.002669, 0.1176471, 0, 1, 1,
0.5255988, -0.1154261, 2.6548, 0.1215686, 0, 1, 1,
0.5305353, -0.2755114, 2.614996, 0.1294118, 0, 1, 1,
0.5334915, 0.5209851, 1.124207, 0.1333333, 0, 1, 1,
0.5346111, -1.211314, 3.777704, 0.1411765, 0, 1, 1,
0.5366768, 2.314915, 0.3079938, 0.145098, 0, 1, 1,
0.5369117, -1.088136, 2.867218, 0.1529412, 0, 1, 1,
0.5383623, -0.4687137, 2.267037, 0.1568628, 0, 1, 1,
0.5463325, -0.5591452, 2.373787, 0.1647059, 0, 1, 1,
0.5526555, -1.544293, 2.167715, 0.1686275, 0, 1, 1,
0.5528469, 0.08145179, 0.1779712, 0.1764706, 0, 1, 1,
0.5568663, -0.6665258, 3.059578, 0.1803922, 0, 1, 1,
0.5602443, 0.528588, 0.04364131, 0.1882353, 0, 1, 1,
0.561273, -1.578183, 4.309902, 0.1921569, 0, 1, 1,
0.5626369, 1.006447, 1.454475, 0.2, 0, 1, 1,
0.5632529, -1.073499, 2.113741, 0.2078431, 0, 1, 1,
0.5634915, -0.8563731, 1.775329, 0.2117647, 0, 1, 1,
0.5648324, 2.009327, 0.9926047, 0.2196078, 0, 1, 1,
0.5670769, 0.05747313, 1.696889, 0.2235294, 0, 1, 1,
0.5697381, -0.1065206, 1.255429, 0.2313726, 0, 1, 1,
0.5733331, -0.1308686, 2.633357, 0.2352941, 0, 1, 1,
0.5764466, 1.092639, 0.8656701, 0.2431373, 0, 1, 1,
0.5821293, -0.03171933, 2.934967, 0.2470588, 0, 1, 1,
0.5838718, -0.1282608, 0.1218828, 0.254902, 0, 1, 1,
0.5965495, -0.5224206, 3.463885, 0.2588235, 0, 1, 1,
0.5969769, -0.3542772, 2.476628, 0.2666667, 0, 1, 1,
0.6030029, 0.3317661, 0.8817984, 0.2705882, 0, 1, 1,
0.6056124, -0.8672671, 3.121372, 0.2784314, 0, 1, 1,
0.6059082, 0.4170374, 0.3576847, 0.282353, 0, 1, 1,
0.6092219, -2.029358, 2.557768, 0.2901961, 0, 1, 1,
0.6109389, 0.886911, 0.2384742, 0.2941177, 0, 1, 1,
0.6142983, 1.424851, 1.382437, 0.3019608, 0, 1, 1,
0.6203107, -0.1867668, 1.821974, 0.3098039, 0, 1, 1,
0.6207489, 0.07765259, 1.334488, 0.3137255, 0, 1, 1,
0.6237524, -0.1611826, 0.7976926, 0.3215686, 0, 1, 1,
0.6241741, 1.050784, 1.781522, 0.3254902, 0, 1, 1,
0.6250746, -1.071843, 0.6082566, 0.3333333, 0, 1, 1,
0.629373, -0.36338, 2.124868, 0.3372549, 0, 1, 1,
0.6298496, -1.502197, 1.162292, 0.345098, 0, 1, 1,
0.6341353, -0.9594178, 2.677697, 0.3490196, 0, 1, 1,
0.6386645, -1.671405, 2.797195, 0.3568628, 0, 1, 1,
0.6423455, 0.5024409, 0.5652049, 0.3607843, 0, 1, 1,
0.6434681, -0.4299783, 2.221632, 0.3686275, 0, 1, 1,
0.6460875, 0.6711247, 1.390954, 0.372549, 0, 1, 1,
0.6479358, -0.8932043, 0.6757907, 0.3803922, 0, 1, 1,
0.6479746, 0.03745328, 0.4918947, 0.3843137, 0, 1, 1,
0.6524564, 0.9183504, -0.1654979, 0.3921569, 0, 1, 1,
0.6539553, -0.05090299, 1.579771, 0.3960784, 0, 1, 1,
0.6571114, 0.2190834, 1.484373, 0.4039216, 0, 1, 1,
0.6572432, 0.247113, 0.8670102, 0.4117647, 0, 1, 1,
0.6590729, 0.004266443, 0.4171187, 0.4156863, 0, 1, 1,
0.667336, -0.9935175, 3.473798, 0.4235294, 0, 1, 1,
0.6708127, -0.8635425, 1.566656, 0.427451, 0, 1, 1,
0.6749737, 1.293806, 0.3600281, 0.4352941, 0, 1, 1,
0.6799766, -0.4573748, 2.738345, 0.4392157, 0, 1, 1,
0.6823024, 0.2247255, 2.178611, 0.4470588, 0, 1, 1,
0.6870458, -0.9174239, 1.408506, 0.4509804, 0, 1, 1,
0.6875361, -0.6125988, 2.832839, 0.4588235, 0, 1, 1,
0.6882164, 0.1554367, 1.967582, 0.4627451, 0, 1, 1,
0.6893819, -0.5296373, 0.5497365, 0.4705882, 0, 1, 1,
0.6902513, -0.2840985, 4.047676, 0.4745098, 0, 1, 1,
0.6916702, 1.861015, 0.2460955, 0.4823529, 0, 1, 1,
0.6957199, 0.6874251, -0.3923388, 0.4862745, 0, 1, 1,
0.6980694, 1.81852, 0.7126034, 0.4941176, 0, 1, 1,
0.7014384, 1.693047, 0.2735354, 0.5019608, 0, 1, 1,
0.7030468, 0.729435, 1.241982, 0.5058824, 0, 1, 1,
0.7032323, 0.3252946, 1.665519, 0.5137255, 0, 1, 1,
0.7051568, 1.613005, 0.5246443, 0.5176471, 0, 1, 1,
0.7054054, 1.181144, 0.8748503, 0.5254902, 0, 1, 1,
0.7062674, 0.4721001, -0.9008232, 0.5294118, 0, 1, 1,
0.7067888, -1.237187, 2.892884, 0.5372549, 0, 1, 1,
0.7091154, -1.335275, 1.950487, 0.5411765, 0, 1, 1,
0.7244403, -0.5108044, 3.386044, 0.5490196, 0, 1, 1,
0.7331853, 0.4322993, 0.8558064, 0.5529412, 0, 1, 1,
0.7343285, 1.622589, 0.9230323, 0.5607843, 0, 1, 1,
0.7345191, 1.788137, 1.479115, 0.5647059, 0, 1, 1,
0.7348445, 1.34875, -0.05229574, 0.572549, 0, 1, 1,
0.7351068, 0.2696578, 1.77143, 0.5764706, 0, 1, 1,
0.7358027, 0.1720448, 2.439671, 0.5843138, 0, 1, 1,
0.7399655, -0.6176579, 2.74879, 0.5882353, 0, 1, 1,
0.7421223, -0.2471529, 0.974977, 0.5960785, 0, 1, 1,
0.7460783, -0.5929005, 1.003699, 0.6039216, 0, 1, 1,
0.7461223, 3.043142, -1.182078, 0.6078432, 0, 1, 1,
0.747573, 0.5470419, 1.104271, 0.6156863, 0, 1, 1,
0.7584049, -0.3687316, 2.731364, 0.6196079, 0, 1, 1,
0.7590906, -1.190698, 1.158485, 0.627451, 0, 1, 1,
0.7604636, 0.452284, 1.82831, 0.6313726, 0, 1, 1,
0.765053, -0.442846, 2.078645, 0.6392157, 0, 1, 1,
0.7655087, -0.9369088, 1.481071, 0.6431373, 0, 1, 1,
0.7673995, 0.9787648, 2.183461, 0.6509804, 0, 1, 1,
0.7722547, 2.048021, -0.5327113, 0.654902, 0, 1, 1,
0.7740673, -2.160833, 4.432347, 0.6627451, 0, 1, 1,
0.7749317, 2.178102, 0.2286333, 0.6666667, 0, 1, 1,
0.7784728, -1.858124, 3.002927, 0.6745098, 0, 1, 1,
0.7828986, 0.4319976, -1.9724, 0.6784314, 0, 1, 1,
0.788914, 1.134572, -0.1836701, 0.6862745, 0, 1, 1,
0.8003292, 0.1714495, 1.730579, 0.6901961, 0, 1, 1,
0.8025002, -0.04592131, 1.715608, 0.6980392, 0, 1, 1,
0.8036972, 0.6443689, 0.8033364, 0.7058824, 0, 1, 1,
0.8061375, 0.8019161, -1.354581, 0.7098039, 0, 1, 1,
0.8085069, -0.6919166, 2.138936, 0.7176471, 0, 1, 1,
0.8108585, -1.190611, 2.065537, 0.7215686, 0, 1, 1,
0.8113635, -0.02824859, 2.312072, 0.7294118, 0, 1, 1,
0.8152331, -0.5931842, 1.570561, 0.7333333, 0, 1, 1,
0.8152356, -0.4125741, 3.036125, 0.7411765, 0, 1, 1,
0.8188908, -1.687733, 2.535765, 0.7450981, 0, 1, 1,
0.8203413, 1.10498, -0.6006014, 0.7529412, 0, 1, 1,
0.8239108, -0.238988, 1.902032, 0.7568628, 0, 1, 1,
0.8253866, -0.09193942, 2.450036, 0.7647059, 0, 1, 1,
0.8281718, 0.4231356, 1.344602, 0.7686275, 0, 1, 1,
0.8325733, 0.5604777, 0.7940339, 0.7764706, 0, 1, 1,
0.8385975, 0.4017931, 1.828236, 0.7803922, 0, 1, 1,
0.8387631, -0.1770303, 1.394394, 0.7882353, 0, 1, 1,
0.8466285, -0.2841437, 2.886382, 0.7921569, 0, 1, 1,
0.8468803, -0.427735, 1.919522, 0.8, 0, 1, 1,
0.8478394, 0.2960774, 2.154819, 0.8078431, 0, 1, 1,
0.8499056, 0.06992267, 0.7164012, 0.8117647, 0, 1, 1,
0.8564539, 0.3354044, 1.76163, 0.8196079, 0, 1, 1,
0.8567286, -0.3858937, 0.6400605, 0.8235294, 0, 1, 1,
0.8641121, 1.076535, 0.3524238, 0.8313726, 0, 1, 1,
0.8696023, 0.5668668, 1.720335, 0.8352941, 0, 1, 1,
0.8696555, 0.5830049, -0.735569, 0.8431373, 0, 1, 1,
0.8700779, -0.9715905, 3.728342, 0.8470588, 0, 1, 1,
0.8703794, -0.3485956, 1.406808, 0.854902, 0, 1, 1,
0.8704128, 0.5991589, 0.4538954, 0.8588235, 0, 1, 1,
0.8712531, -1.07305, 4.344706, 0.8666667, 0, 1, 1,
0.8781135, -0.2905696, 2.314749, 0.8705882, 0, 1, 1,
0.8796883, 0.7179485, -1.039617, 0.8784314, 0, 1, 1,
0.8818084, -0.5850562, 0.7295342, 0.8823529, 0, 1, 1,
0.8838627, 0.4366797, 0.7071263, 0.8901961, 0, 1, 1,
0.8864952, 0.286682, 2.002528, 0.8941177, 0, 1, 1,
0.8895727, -1.604196, 3.01788, 0.9019608, 0, 1, 1,
0.890772, -1.466135, 2.751572, 0.9098039, 0, 1, 1,
0.8911823, -0.1910337, 2.586895, 0.9137255, 0, 1, 1,
0.8948765, -0.7284817, 0.6058125, 0.9215686, 0, 1, 1,
0.907496, -0.2078022, 3.016442, 0.9254902, 0, 1, 1,
0.9112082, 0.4766172, 2.012952, 0.9333333, 0, 1, 1,
0.9135851, -0.01602991, 1.324277, 0.9372549, 0, 1, 1,
0.9150566, -1.377199, 2.596349, 0.945098, 0, 1, 1,
0.9156535, 0.3817478, 0.7609363, 0.9490196, 0, 1, 1,
0.9160948, -0.6349425, 1.578245, 0.9568627, 0, 1, 1,
0.9168645, 0.2036483, 2.712035, 0.9607843, 0, 1, 1,
0.9195251, -1.486978, 1.885167, 0.9686275, 0, 1, 1,
0.9231969, 1.005368, 0.6717895, 0.972549, 0, 1, 1,
0.9253736, 0.6826383, 1.153937, 0.9803922, 0, 1, 1,
0.9257422, 1.027705, -0.5764617, 0.9843137, 0, 1, 1,
0.9284076, -1.072057, 1.679787, 0.9921569, 0, 1, 1,
0.9301606, -0.1438193, 2.787767, 0.9960784, 0, 1, 1,
0.9371221, -0.7653551, 2.316025, 1, 0, 0.9960784, 1,
0.9378871, -1.262356, 1.899564, 1, 0, 0.9882353, 1,
0.9421651, 1.42646, 0.08748308, 1, 0, 0.9843137, 1,
0.9437469, 0.5111257, 1.440681, 1, 0, 0.9764706, 1,
0.952792, -1.087622, 1.875757, 1, 0, 0.972549, 1,
0.9566004, 0.4546605, 1.54967, 1, 0, 0.9647059, 1,
0.9610239, -1.336527, 1.780937, 1, 0, 0.9607843, 1,
0.9695128, -1.06415, 1.547436, 1, 0, 0.9529412, 1,
0.9795992, 0.3032689, 0.9984, 1, 0, 0.9490196, 1,
0.9814647, 0.2696591, 2.614751, 1, 0, 0.9411765, 1,
0.983508, -0.8940236, 2.183783, 1, 0, 0.9372549, 1,
1.001015, 0.06365764, 2.585947, 1, 0, 0.9294118, 1,
1.008843, -0.6253993, 2.933934, 1, 0, 0.9254902, 1,
1.011084, 0.2992276, 1.436595, 1, 0, 0.9176471, 1,
1.011747, 1.025959, 0.2022716, 1, 0, 0.9137255, 1,
1.012723, 1.147161, 0.9847589, 1, 0, 0.9058824, 1,
1.024437, -0.7853904, 3.033951, 1, 0, 0.9019608, 1,
1.024488, -0.04842436, 3.33348, 1, 0, 0.8941177, 1,
1.027684, 0.4648947, 2.507536, 1, 0, 0.8862745, 1,
1.039124, -0.7400872, 1.57882, 1, 0, 0.8823529, 1,
1.039729, 2.085651, -0.05419418, 1, 0, 0.8745098, 1,
1.041557, 0.7203285, 0.09769309, 1, 0, 0.8705882, 1,
1.042072, 0.9270699, 2.307629, 1, 0, 0.8627451, 1,
1.054304, -0.8929775, 2.4422, 1, 0, 0.8588235, 1,
1.060958, -1.38496, 0.876237, 1, 0, 0.8509804, 1,
1.06507, -0.4342762, 1.349541, 1, 0, 0.8470588, 1,
1.067703, -0.08104844, 0.9133522, 1, 0, 0.8392157, 1,
1.072624, 0.3833717, 0.8501436, 1, 0, 0.8352941, 1,
1.073419, 1.28946, 1.445286, 1, 0, 0.827451, 1,
1.074007, -0.7080104, 1.430868, 1, 0, 0.8235294, 1,
1.080987, -1.036652, 0.8712735, 1, 0, 0.8156863, 1,
1.106169, -0.8427037, 0.3575513, 1, 0, 0.8117647, 1,
1.106489, 0.3804002, 0.6030698, 1, 0, 0.8039216, 1,
1.107642, 1.189789, 1.241144, 1, 0, 0.7960784, 1,
1.109495, -1.732658, 2.241574, 1, 0, 0.7921569, 1,
1.11095, 0.3487663, 0.8913245, 1, 0, 0.7843137, 1,
1.11545, -1.361416, 2.641898, 1, 0, 0.7803922, 1,
1.124814, 0.8294303, 0.1016983, 1, 0, 0.772549, 1,
1.12749, -1.899866, 3.518776, 1, 0, 0.7686275, 1,
1.138784, 0.3203038, 1.610323, 1, 0, 0.7607843, 1,
1.142781, -0.04996999, 4.052372, 1, 0, 0.7568628, 1,
1.147134, -0.3527681, 1.944286, 1, 0, 0.7490196, 1,
1.153346, 0.04705778, 1.366855, 1, 0, 0.7450981, 1,
1.156804, 0.3511462, 0.7314886, 1, 0, 0.7372549, 1,
1.162792, 1.498527, 1.380805, 1, 0, 0.7333333, 1,
1.165469, -0.9560806, 1.991987, 1, 0, 0.7254902, 1,
1.167068, 0.28513, 1.137152, 1, 0, 0.7215686, 1,
1.167879, 0.614972, 0.7759466, 1, 0, 0.7137255, 1,
1.170268, 0.5380521, 1.730334, 1, 0, 0.7098039, 1,
1.171531, 0.2006952, 1.446718, 1, 0, 0.7019608, 1,
1.173164, -1.258117, 3.363751, 1, 0, 0.6941177, 1,
1.174136, 1.518928, 1.41835, 1, 0, 0.6901961, 1,
1.175127, 1.333841, 0.1174797, 1, 0, 0.682353, 1,
1.180308, -2.03914, 3.751196, 1, 0, 0.6784314, 1,
1.183258, 1.152121, -0.2156421, 1, 0, 0.6705883, 1,
1.185027, -0.06118849, 2.30359, 1, 0, 0.6666667, 1,
1.203175, 0.2493748, 1.697717, 1, 0, 0.6588235, 1,
1.203318, 0.1664429, -0.2901371, 1, 0, 0.654902, 1,
1.209561, 0.05373504, 2.502152, 1, 0, 0.6470588, 1,
1.219793, 0.1146202, 0.187151, 1, 0, 0.6431373, 1,
1.221817, -0.2123971, 2.065665, 1, 0, 0.6352941, 1,
1.223883, -0.1018588, 1.728989, 1, 0, 0.6313726, 1,
1.226197, -0.7221485, 1.397599, 1, 0, 0.6235294, 1,
1.231518, 1.351347, 1.734637, 1, 0, 0.6196079, 1,
1.234042, 0.06791503, 1.562501, 1, 0, 0.6117647, 1,
1.257658, -0.9119704, 2.467466, 1, 0, 0.6078432, 1,
1.259179, -1.043161, 1.259241, 1, 0, 0.6, 1,
1.26198, -1.086749, 3.38785, 1, 0, 0.5921569, 1,
1.271795, 0.2865211, 2.105413, 1, 0, 0.5882353, 1,
1.276905, 1.355421, 1.030016, 1, 0, 0.5803922, 1,
1.280053, 0.2974195, 1.254146, 1, 0, 0.5764706, 1,
1.280793, -0.5981826, 3.606872, 1, 0, 0.5686275, 1,
1.293828, 0.5245126, 3.076111, 1, 0, 0.5647059, 1,
1.295107, 1.588906, -0.5332017, 1, 0, 0.5568628, 1,
1.299648, 0.150791, 2.323087, 1, 0, 0.5529412, 1,
1.301457, 0.431123, 2.593037, 1, 0, 0.5450981, 1,
1.311783, -1.3711, 1.434468, 1, 0, 0.5411765, 1,
1.312196, -0.6052377, 1.911469, 1, 0, 0.5333334, 1,
1.312403, -0.3593306, 1.328829, 1, 0, 0.5294118, 1,
1.314605, 0.2085294, 2.165101, 1, 0, 0.5215687, 1,
1.339337, 0.5350168, 0.7880818, 1, 0, 0.5176471, 1,
1.347041, -0.7258063, 3.780422, 1, 0, 0.509804, 1,
1.349523, -0.126707, -0.1753004, 1, 0, 0.5058824, 1,
1.359999, 1.289615, 0.5852311, 1, 0, 0.4980392, 1,
1.360032, 0.2267409, 1.388226, 1, 0, 0.4901961, 1,
1.360584, -0.544986, 1.426037, 1, 0, 0.4862745, 1,
1.395582, 1.203388, 0.5763513, 1, 0, 0.4784314, 1,
1.40259, 0.9361575, 0.7757947, 1, 0, 0.4745098, 1,
1.408824, -1.400019, 1.456167, 1, 0, 0.4666667, 1,
1.417553, 0.4033063, 2.688143, 1, 0, 0.4627451, 1,
1.422618, -1.352365, 2.396872, 1, 0, 0.454902, 1,
1.429554, -0.1282911, 1.289627, 1, 0, 0.4509804, 1,
1.442489, -0.7013991, 3.313014, 1, 0, 0.4431373, 1,
1.444521, -0.4266143, 1.338116, 1, 0, 0.4392157, 1,
1.463469, -2.034792, 2.919143, 1, 0, 0.4313726, 1,
1.46504, -0.2339294, 2.664716, 1, 0, 0.427451, 1,
1.486376, -0.02864625, 1.440625, 1, 0, 0.4196078, 1,
1.487587, 0.6987157, 1.281338, 1, 0, 0.4156863, 1,
1.491468, -0.1237563, 2.258088, 1, 0, 0.4078431, 1,
1.499855, -0.5737488, 1.333215, 1, 0, 0.4039216, 1,
1.501527, 0.3489055, 1.285729, 1, 0, 0.3960784, 1,
1.506114, 1.004424, 1.199094, 1, 0, 0.3882353, 1,
1.525492, -0.8754931, 2.623335, 1, 0, 0.3843137, 1,
1.538324, -1.852147, 3.011836, 1, 0, 0.3764706, 1,
1.558288, -0.4839499, 2.640381, 1, 0, 0.372549, 1,
1.576038, 0.8627362, 0.4475171, 1, 0, 0.3647059, 1,
1.580224, 0.6279256, 0.8131509, 1, 0, 0.3607843, 1,
1.581139, -1.242376, 2.060927, 1, 0, 0.3529412, 1,
1.586951, -1.131968, 2.077025, 1, 0, 0.3490196, 1,
1.613439, -0.4699321, 2.04909, 1, 0, 0.3411765, 1,
1.624744, 0.7476023, 0.4932357, 1, 0, 0.3372549, 1,
1.62701, -0.04529463, 3.117892, 1, 0, 0.3294118, 1,
1.63224, -0.3600875, 2.139012, 1, 0, 0.3254902, 1,
1.633478, 0.8519055, 1.817048, 1, 0, 0.3176471, 1,
1.634017, -0.9222537, 3.051898, 1, 0, 0.3137255, 1,
1.639844, -0.4404022, 1.749477, 1, 0, 0.3058824, 1,
1.640951, 1.68835, 0.2632, 1, 0, 0.2980392, 1,
1.646233, 0.3605827, 1.63952, 1, 0, 0.2941177, 1,
1.646716, -0.7486044, 1.027124, 1, 0, 0.2862745, 1,
1.648768, -0.1866935, 0.9568869, 1, 0, 0.282353, 1,
1.650375, -1.184431, 1.686627, 1, 0, 0.2745098, 1,
1.657757, 1.852502, -1.792582, 1, 0, 0.2705882, 1,
1.660552, 1.415718, 0.8116483, 1, 0, 0.2627451, 1,
1.66237, -0.6981654, -0.1336766, 1, 0, 0.2588235, 1,
1.669938, 1.071423, -0.376016, 1, 0, 0.2509804, 1,
1.672037, -0.1218511, -0.2368906, 1, 0, 0.2470588, 1,
1.674201, 0.9661075, 1.337711, 1, 0, 0.2392157, 1,
1.711352, -0.1473432, 2.608522, 1, 0, 0.2352941, 1,
1.725832, 0.708784, 0.4265265, 1, 0, 0.227451, 1,
1.729835, -1.110056, 2.733977, 1, 0, 0.2235294, 1,
1.75195, 0.2467281, 2.52055, 1, 0, 0.2156863, 1,
1.763117, -0.4394753, 1.94579, 1, 0, 0.2117647, 1,
1.770265, -0.05411428, 2.745862, 1, 0, 0.2039216, 1,
1.792119, -0.2774028, 1.316093, 1, 0, 0.1960784, 1,
1.798224, 1.530219, 1.117238, 1, 0, 0.1921569, 1,
1.803893, -0.6738015, 1.794826, 1, 0, 0.1843137, 1,
1.804044, -0.8292356, 1.000826, 1, 0, 0.1803922, 1,
1.820375, -1.915779, 2.226295, 1, 0, 0.172549, 1,
1.821981, -1.148059, 1.085539, 1, 0, 0.1686275, 1,
1.82752, -0.1043068, 2.602487, 1, 0, 0.1607843, 1,
1.835237, 2.164637, 0.1934779, 1, 0, 0.1568628, 1,
1.850824, -0.3822567, 1.991709, 1, 0, 0.1490196, 1,
1.852607, 0.3540175, 2.360624, 1, 0, 0.145098, 1,
1.856848, -1.40733, 3.505535, 1, 0, 0.1372549, 1,
1.873062, -0.1332297, 1.505998, 1, 0, 0.1333333, 1,
1.881046, 0.4238063, 2.540534, 1, 0, 0.1254902, 1,
1.898753, -0.4496638, 1.47018, 1, 0, 0.1215686, 1,
1.973575, -1.364741, 2.053839, 1, 0, 0.1137255, 1,
1.987707, 1.724191, 0.5690942, 1, 0, 0.1098039, 1,
2.010598, 0.2105965, -0.5466557, 1, 0, 0.1019608, 1,
2.039863, 1.052959, 1.674911, 1, 0, 0.09411765, 1,
2.131365, -0.3185218, 1.162829, 1, 0, 0.09019608, 1,
2.207494, 1.213459, 0.897944, 1, 0, 0.08235294, 1,
2.296534, 0.1382106, 2.680913, 1, 0, 0.07843138, 1,
2.321784, 1.952415, 1.373256, 1, 0, 0.07058824, 1,
2.374147, 0.2351328, 0.7701614, 1, 0, 0.06666667, 1,
2.378933, -1.408363, 2.879604, 1, 0, 0.05882353, 1,
2.42208, 2.057464, 2.306452, 1, 0, 0.05490196, 1,
2.483992, -0.4463002, 1.334769, 1, 0, 0.04705882, 1,
2.513225, -0.8961086, 2.756154, 1, 0, 0.04313726, 1,
2.617893, -1.182065, 4.842001, 1, 0, 0.03529412, 1,
2.644414, 0.8712771, 1.043175, 1, 0, 0.03137255, 1,
2.712255, 0.6492918, 1.814016, 1, 0, 0.02352941, 1,
2.729413, -0.369583, 0.1655635, 1, 0, 0.01960784, 1,
2.950195, 0.2805194, 1.335147, 1, 0, 0.01176471, 1,
3.774328, -0.1545717, -0.7177538, 1, 0, 0.007843138, 1
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
0.3786995, -5.103123, -7.088174, 0, -0.5, 0.5, 0.5,
0.3786995, -5.103123, -7.088174, 1, -0.5, 0.5, 0.5,
0.3786995, -5.103123, -7.088174, 1, 1.5, 0.5, 0.5,
0.3786995, -5.103123, -7.088174, 0, 1.5, 0.5, 0.5
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
-4.168046, -0.4396565, -7.088174, 0, -0.5, 0.5, 0.5,
-4.168046, -0.4396565, -7.088174, 1, -0.5, 0.5, 0.5,
-4.168046, -0.4396565, -7.088174, 1, 1.5, 0.5, 0.5,
-4.168046, -0.4396565, -7.088174, 0, 1.5, 0.5, 0.5
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
-4.168046, -5.103123, -0.2585437, 0, -0.5, 0.5, 0.5,
-4.168046, -5.103123, -0.2585437, 1, -0.5, 0.5, 0.5,
-4.168046, -5.103123, -0.2585437, 1, 1.5, 0.5, 0.5,
-4.168046, -5.103123, -0.2585437, 0, 1.5, 0.5, 0.5
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
-3, -4.026938, -5.512105,
3, -4.026938, -5.512105,
-3, -4.026938, -5.512105,
-3, -4.206303, -5.774783,
-2, -4.026938, -5.512105,
-2, -4.206303, -5.774783,
-1, -4.026938, -5.512105,
-1, -4.206303, -5.774783,
0, -4.026938, -5.512105,
0, -4.206303, -5.774783,
1, -4.026938, -5.512105,
1, -4.206303, -5.774783,
2, -4.026938, -5.512105,
2, -4.206303, -5.774783,
3, -4.026938, -5.512105,
3, -4.206303, -5.774783
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
-3, -4.565031, -6.300139, 0, -0.5, 0.5, 0.5,
-3, -4.565031, -6.300139, 1, -0.5, 0.5, 0.5,
-3, -4.565031, -6.300139, 1, 1.5, 0.5, 0.5,
-3, -4.565031, -6.300139, 0, 1.5, 0.5, 0.5,
-2, -4.565031, -6.300139, 0, -0.5, 0.5, 0.5,
-2, -4.565031, -6.300139, 1, -0.5, 0.5, 0.5,
-2, -4.565031, -6.300139, 1, 1.5, 0.5, 0.5,
-2, -4.565031, -6.300139, 0, 1.5, 0.5, 0.5,
-1, -4.565031, -6.300139, 0, -0.5, 0.5, 0.5,
-1, -4.565031, -6.300139, 1, -0.5, 0.5, 0.5,
-1, -4.565031, -6.300139, 1, 1.5, 0.5, 0.5,
-1, -4.565031, -6.300139, 0, 1.5, 0.5, 0.5,
0, -4.565031, -6.300139, 0, -0.5, 0.5, 0.5,
0, -4.565031, -6.300139, 1, -0.5, 0.5, 0.5,
0, -4.565031, -6.300139, 1, 1.5, 0.5, 0.5,
0, -4.565031, -6.300139, 0, 1.5, 0.5, 0.5,
1, -4.565031, -6.300139, 0, -0.5, 0.5, 0.5,
1, -4.565031, -6.300139, 1, -0.5, 0.5, 0.5,
1, -4.565031, -6.300139, 1, 1.5, 0.5, 0.5,
1, -4.565031, -6.300139, 0, 1.5, 0.5, 0.5,
2, -4.565031, -6.300139, 0, -0.5, 0.5, 0.5,
2, -4.565031, -6.300139, 1, -0.5, 0.5, 0.5,
2, -4.565031, -6.300139, 1, 1.5, 0.5, 0.5,
2, -4.565031, -6.300139, 0, 1.5, 0.5, 0.5,
3, -4.565031, -6.300139, 0, -0.5, 0.5, 0.5,
3, -4.565031, -6.300139, 1, -0.5, 0.5, 0.5,
3, -4.565031, -6.300139, 1, 1.5, 0.5, 0.5,
3, -4.565031, -6.300139, 0, 1.5, 0.5, 0.5
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
-3.118797, -3, -5.512105,
-3.118797, 3, -5.512105,
-3.118797, -3, -5.512105,
-3.293672, -3, -5.774783,
-3.118797, -2, -5.512105,
-3.293672, -2, -5.774783,
-3.118797, -1, -5.512105,
-3.293672, -1, -5.774783,
-3.118797, 0, -5.512105,
-3.293672, 0, -5.774783,
-3.118797, 1, -5.512105,
-3.293672, 1, -5.774783,
-3.118797, 2, -5.512105,
-3.293672, 2, -5.774783,
-3.118797, 3, -5.512105,
-3.293672, 3, -5.774783
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
-3.643422, -3, -6.300139, 0, -0.5, 0.5, 0.5,
-3.643422, -3, -6.300139, 1, -0.5, 0.5, 0.5,
-3.643422, -3, -6.300139, 1, 1.5, 0.5, 0.5,
-3.643422, -3, -6.300139, 0, 1.5, 0.5, 0.5,
-3.643422, -2, -6.300139, 0, -0.5, 0.5, 0.5,
-3.643422, -2, -6.300139, 1, -0.5, 0.5, 0.5,
-3.643422, -2, -6.300139, 1, 1.5, 0.5, 0.5,
-3.643422, -2, -6.300139, 0, 1.5, 0.5, 0.5,
-3.643422, -1, -6.300139, 0, -0.5, 0.5, 0.5,
-3.643422, -1, -6.300139, 1, -0.5, 0.5, 0.5,
-3.643422, -1, -6.300139, 1, 1.5, 0.5, 0.5,
-3.643422, -1, -6.300139, 0, 1.5, 0.5, 0.5,
-3.643422, 0, -6.300139, 0, -0.5, 0.5, 0.5,
-3.643422, 0, -6.300139, 1, -0.5, 0.5, 0.5,
-3.643422, 0, -6.300139, 1, 1.5, 0.5, 0.5,
-3.643422, 0, -6.300139, 0, 1.5, 0.5, 0.5,
-3.643422, 1, -6.300139, 0, -0.5, 0.5, 0.5,
-3.643422, 1, -6.300139, 1, -0.5, 0.5, 0.5,
-3.643422, 1, -6.300139, 1, 1.5, 0.5, 0.5,
-3.643422, 1, -6.300139, 0, 1.5, 0.5, 0.5,
-3.643422, 2, -6.300139, 0, -0.5, 0.5, 0.5,
-3.643422, 2, -6.300139, 1, -0.5, 0.5, 0.5,
-3.643422, 2, -6.300139, 1, 1.5, 0.5, 0.5,
-3.643422, 2, -6.300139, 0, 1.5, 0.5, 0.5,
-3.643422, 3, -6.300139, 0, -0.5, 0.5, 0.5,
-3.643422, 3, -6.300139, 1, -0.5, 0.5, 0.5,
-3.643422, 3, -6.300139, 1, 1.5, 0.5, 0.5,
-3.643422, 3, -6.300139, 0, 1.5, 0.5, 0.5
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
-3.118797, -4.026938, -4,
-3.118797, -4.026938, 4,
-3.118797, -4.026938, -4,
-3.293672, -4.206303, -4,
-3.118797, -4.026938, -2,
-3.293672, -4.206303, -2,
-3.118797, -4.026938, 0,
-3.293672, -4.206303, 0,
-3.118797, -4.026938, 2,
-3.293672, -4.206303, 2,
-3.118797, -4.026938, 4,
-3.293672, -4.206303, 4
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
-3.643422, -4.565031, -4, 0, -0.5, 0.5, 0.5,
-3.643422, -4.565031, -4, 1, -0.5, 0.5, 0.5,
-3.643422, -4.565031, -4, 1, 1.5, 0.5, 0.5,
-3.643422, -4.565031, -4, 0, 1.5, 0.5, 0.5,
-3.643422, -4.565031, -2, 0, -0.5, 0.5, 0.5,
-3.643422, -4.565031, -2, 1, -0.5, 0.5, 0.5,
-3.643422, -4.565031, -2, 1, 1.5, 0.5, 0.5,
-3.643422, -4.565031, -2, 0, 1.5, 0.5, 0.5,
-3.643422, -4.565031, 0, 0, -0.5, 0.5, 0.5,
-3.643422, -4.565031, 0, 1, -0.5, 0.5, 0.5,
-3.643422, -4.565031, 0, 1, 1.5, 0.5, 0.5,
-3.643422, -4.565031, 0, 0, 1.5, 0.5, 0.5,
-3.643422, -4.565031, 2, 0, -0.5, 0.5, 0.5,
-3.643422, -4.565031, 2, 1, -0.5, 0.5, 0.5,
-3.643422, -4.565031, 2, 1, 1.5, 0.5, 0.5,
-3.643422, -4.565031, 2, 0, 1.5, 0.5, 0.5,
-3.643422, -4.565031, 4, 0, -0.5, 0.5, 0.5,
-3.643422, -4.565031, 4, 1, -0.5, 0.5, 0.5,
-3.643422, -4.565031, 4, 1, 1.5, 0.5, 0.5,
-3.643422, -4.565031, 4, 0, 1.5, 0.5, 0.5
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
-3.118797, -4.026938, -5.512105,
-3.118797, 3.147625, -5.512105,
-3.118797, -4.026938, 4.995018,
-3.118797, 3.147625, 4.995018,
-3.118797, -4.026938, -5.512105,
-3.118797, -4.026938, 4.995018,
-3.118797, 3.147625, -5.512105,
-3.118797, 3.147625, 4.995018,
-3.118797, -4.026938, -5.512105,
3.876196, -4.026938, -5.512105,
-3.118797, -4.026938, 4.995018,
3.876196, -4.026938, 4.995018,
-3.118797, 3.147625, -5.512105,
3.876196, 3.147625, -5.512105,
-3.118797, 3.147625, 4.995018,
3.876196, 3.147625, 4.995018,
3.876196, -4.026938, -5.512105,
3.876196, 3.147625, -5.512105,
3.876196, -4.026938, 4.995018,
3.876196, 3.147625, 4.995018,
3.876196, -4.026938, -5.512105,
3.876196, -4.026938, 4.995018,
3.876196, 3.147625, -5.512105,
3.876196, 3.147625, 4.995018
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
var radius = 7.752912;
var distance = 34.49358;
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
mvMatrix.translate( -0.3786995, 0.4396565, 0.2585437 );
mvMatrix.scale( 1.198371, 1.168378, 0.7978016 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.49358);
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
Fluvalinate<-read.table("Fluvalinate.xyz")
```

```
## Error in read.table("Fluvalinate.xyz"): no lines available in input
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
-3.016928, 1.735383, -2.063251, 0, 0, 1, 1, 1,
-3.003669, -1.605233, -1.139891, 1, 0, 0, 1, 1,
-2.726724, -0.4327929, -2.415868, 1, 0, 0, 1, 1,
-2.524186, -1.694763, -2.439251, 1, 0, 0, 1, 1,
-2.437885, -1.818693, -2.38585, 1, 0, 0, 1, 1,
-2.436063, 1.414248, -1.24286, 1, 0, 0, 1, 1,
-2.41238, -1.84072, -2.259321, 0, 0, 0, 1, 1,
-2.366201, -0.3879437, -1.281004, 0, 0, 0, 1, 1,
-2.355793, 0.7693134, -1.662158, 0, 0, 0, 1, 1,
-2.343817, 0.5306392, 0.3039871, 0, 0, 0, 1, 1,
-2.287369, 0.1168507, -0.5758955, 0, 0, 0, 1, 1,
-2.224153, -1.945591, -2.470869, 0, 0, 0, 1, 1,
-2.204309, 1.567819, -1.554959, 0, 0, 0, 1, 1,
-2.172545, -0.379921, -0.763358, 1, 1, 1, 1, 1,
-2.161246, 0.6603881, -2.477538, 1, 1, 1, 1, 1,
-2.125729, -0.6740711, -4.621914, 1, 1, 1, 1, 1,
-2.051935, 0.5093024, -0.6221991, 1, 1, 1, 1, 1,
-2.048864, 0.03952623, -2.827922, 1, 1, 1, 1, 1,
-2.044257, -0.7210664, -1.606558, 1, 1, 1, 1, 1,
-2.027558, 0.07785782, -1.882522, 1, 1, 1, 1, 1,
-2.021422, 2.516177, -0.4918796, 1, 1, 1, 1, 1,
-2.004316, 0.01733624, -1.358596, 1, 1, 1, 1, 1,
-2.003221, -0.2872125, -2.573877, 1, 1, 1, 1, 1,
-2.00158, 0.3833784, -0.7020935, 1, 1, 1, 1, 1,
-1.993875, 0.1468536, -2.813092, 1, 1, 1, 1, 1,
-1.941821, -0.9494508, -1.2959, 1, 1, 1, 1, 1,
-1.941047, 1.446503, -2.118257, 1, 1, 1, 1, 1,
-1.92618, -0.7375621, -0.7200346, 1, 1, 1, 1, 1,
-1.896115, 1.006146, -0.503444, 0, 0, 1, 1, 1,
-1.894798, -0.576257, -1.50194, 1, 0, 0, 1, 1,
-1.891082, 0.6721633, -1.432889, 1, 0, 0, 1, 1,
-1.851588, -1.18917, -2.054678, 1, 0, 0, 1, 1,
-1.841377, 0.6901428, -2.635994, 1, 0, 0, 1, 1,
-1.794823, -1.940653, -3.61888, 1, 0, 0, 1, 1,
-1.778532, -0.9727364, -1.503415, 0, 0, 0, 1, 1,
-1.777573, -0.6940307, -1.235347, 0, 0, 0, 1, 1,
-1.773261, 1.090297, -2.584969, 0, 0, 0, 1, 1,
-1.764486, -1.51431, -2.519489, 0, 0, 0, 1, 1,
-1.739096, 0.5454305, -1.135768, 0, 0, 0, 1, 1,
-1.711379, 1.747393, -0.3996332, 0, 0, 0, 1, 1,
-1.71132, 0.9306068, -0.03927228, 0, 0, 0, 1, 1,
-1.657236, -0.0856003, -0.6176186, 1, 1, 1, 1, 1,
-1.638424, 1.071467, -1.431259, 1, 1, 1, 1, 1,
-1.633459, -0.7407759, -1.503305, 1, 1, 1, 1, 1,
-1.605554, 0.623571, -2.27696, 1, 1, 1, 1, 1,
-1.587698, -1.588869, -2.316672, 1, 1, 1, 1, 1,
-1.582972, -0.1598929, -2.797421, 1, 1, 1, 1, 1,
-1.569407, 1.033416, -1.943891, 1, 1, 1, 1, 1,
-1.566858, -0.9271131, -4.256657, 1, 1, 1, 1, 1,
-1.553862, 0.3190058, -0.2486558, 1, 1, 1, 1, 1,
-1.552454, -0.5796107, -2.069972, 1, 1, 1, 1, 1,
-1.550504, 0.2517949, -3.181133, 1, 1, 1, 1, 1,
-1.539728, -0.07227538, -1.350668, 1, 1, 1, 1, 1,
-1.5263, -0.01399843, -1.445682, 1, 1, 1, 1, 1,
-1.51978, 0.7197213, -0.7088237, 1, 1, 1, 1, 1,
-1.482414, -0.1605829, 0.2819191, 1, 1, 1, 1, 1,
-1.482355, -1.909911, -1.562752, 0, 0, 1, 1, 1,
-1.480683, -0.598358, -1.55514, 1, 0, 0, 1, 1,
-1.473211, -0.2338334, -3.39326, 1, 0, 0, 1, 1,
-1.461094, 1.630461, -0.03213703, 1, 0, 0, 1, 1,
-1.452754, 0.04884814, -2.379348, 1, 0, 0, 1, 1,
-1.449896, 1.234705, -0.5878492, 1, 0, 0, 1, 1,
-1.44933, -0.02993503, -1.806749, 0, 0, 0, 1, 1,
-1.440967, -0.2347058, -3.36947, 0, 0, 0, 1, 1,
-1.440463, -1.68214, -1.339286, 0, 0, 0, 1, 1,
-1.437596, -0.6808318, -3.656859, 0, 0, 0, 1, 1,
-1.43426, 1.659699, -2.507552, 0, 0, 0, 1, 1,
-1.431005, 0.470403, -0.6213539, 0, 0, 0, 1, 1,
-1.420574, 0.2700128, -2.237483, 0, 0, 0, 1, 1,
-1.405278, -0.1999191, -2.799239, 1, 1, 1, 1, 1,
-1.397749, 0.3165509, -2.286509, 1, 1, 1, 1, 1,
-1.38891, 0.3504581, -1.351276, 1, 1, 1, 1, 1,
-1.387769, -0.3081293, -0.9845649, 1, 1, 1, 1, 1,
-1.381989, 1.562329, -1.4681, 1, 1, 1, 1, 1,
-1.379265, 0.2196431, -1.811535, 1, 1, 1, 1, 1,
-1.374989, -0.144617, -0.7029954, 1, 1, 1, 1, 1,
-1.37171, 0.5997444, -0.6092144, 1, 1, 1, 1, 1,
-1.369555, 0.5295821, -1.949695, 1, 1, 1, 1, 1,
-1.366702, 0.05142784, -2.326627, 1, 1, 1, 1, 1,
-1.366451, 2.412422, -0.7229036, 1, 1, 1, 1, 1,
-1.354838, -0.7850938, -3.662696, 1, 1, 1, 1, 1,
-1.354653, 1.683137, -2.438457, 1, 1, 1, 1, 1,
-1.353365, -0.1280712, -3.432033, 1, 1, 1, 1, 1,
-1.349514, 0.5934139, -0.3320916, 1, 1, 1, 1, 1,
-1.34718, -0.3064817, -0.7333641, 0, 0, 1, 1, 1,
-1.346284, 1.507688, -1.321266, 1, 0, 0, 1, 1,
-1.34341, 0.6127911, -0.7676504, 1, 0, 0, 1, 1,
-1.337521, 0.2283812, -0.8151813, 1, 0, 0, 1, 1,
-1.323114, 0.2255897, -1.669334, 1, 0, 0, 1, 1,
-1.30301, 0.4701736, -1.672144, 1, 0, 0, 1, 1,
-1.302212, 0.7333586, -1.612959, 0, 0, 0, 1, 1,
-1.299728, -2.446084, -3.098577, 0, 0, 0, 1, 1,
-1.296966, -0.5282839, -1.928075, 0, 0, 0, 1, 1,
-1.288898, 0.6143481, -2.571665, 0, 0, 0, 1, 1,
-1.283671, 0.5631492, -1.904246, 0, 0, 0, 1, 1,
-1.281818, 0.8166403, 0.1426494, 0, 0, 0, 1, 1,
-1.277914, -3.155604, -2.811729, 0, 0, 0, 1, 1,
-1.275031, 0.856303, -0.8034896, 1, 1, 1, 1, 1,
-1.271809, -0.6759052, -1.214676, 1, 1, 1, 1, 1,
-1.261092, 0.5756815, -1.625704, 1, 1, 1, 1, 1,
-1.260439, -0.3843035, -0.003831325, 1, 1, 1, 1, 1,
-1.249857, 0.0658416, -3.113784, 1, 1, 1, 1, 1,
-1.246566, -0.2472396, -2.838824, 1, 1, 1, 1, 1,
-1.238695, 0.3250425, -0.8140371, 1, 1, 1, 1, 1,
-1.236313, -0.5722182, -4.348252, 1, 1, 1, 1, 1,
-1.23586, -0.1424327, -2.238154, 1, 1, 1, 1, 1,
-1.232299, 2.191569, -0.5599554, 1, 1, 1, 1, 1,
-1.229353, 1.082621, -0.2275262, 1, 1, 1, 1, 1,
-1.224561, -1.819878, -2.10785, 1, 1, 1, 1, 1,
-1.21933, -0.1637587, -0.57703, 1, 1, 1, 1, 1,
-1.204611, 1.500063, 0.1653315, 1, 1, 1, 1, 1,
-1.195738, 0.2313723, -1.280661, 1, 1, 1, 1, 1,
-1.18434, -0.5564058, -2.280772, 0, 0, 1, 1, 1,
-1.182711, 0.08810651, -2.129053, 1, 0, 0, 1, 1,
-1.177807, -0.3011345, -1.570822, 1, 0, 0, 1, 1,
-1.16379, 0.005917641, -2.366296, 1, 0, 0, 1, 1,
-1.159417, 0.05518037, -1.993681, 1, 0, 0, 1, 1,
-1.158755, 1.841049, -0.07509258, 1, 0, 0, 1, 1,
-1.158058, -0.4277003, -1.583218, 0, 0, 0, 1, 1,
-1.152561, 1.534219, -0.5717691, 0, 0, 0, 1, 1,
-1.147416, -0.009751637, -1.926154, 0, 0, 0, 1, 1,
-1.14458, -1.335516, -4.008591, 0, 0, 0, 1, 1,
-1.137437, -0.7622925, -2.428077, 0, 0, 0, 1, 1,
-1.135176, 0.8957987, -0.7947999, 0, 0, 0, 1, 1,
-1.13008, 0.7532328, -2.762677, 0, 0, 0, 1, 1,
-1.12981, -0.6875458, -0.9974887, 1, 1, 1, 1, 1,
-1.121806, 0.5891575, 0.1280454, 1, 1, 1, 1, 1,
-1.118088, -1.114764, -2.657276, 1, 1, 1, 1, 1,
-1.115838, -1.386539, -2.763142, 1, 1, 1, 1, 1,
-1.114876, 0.07093389, 0.1462469, 1, 1, 1, 1, 1,
-1.113493, -1.195511, 0.1302541, 1, 1, 1, 1, 1,
-1.110693, -2.004582, -3.307284, 1, 1, 1, 1, 1,
-1.08754, -0.1976169, 0.1532897, 1, 1, 1, 1, 1,
-1.086275, -0.4940429, -0.03983599, 1, 1, 1, 1, 1,
-1.084448, -0.2335674, -2.774012, 1, 1, 1, 1, 1,
-1.083103, 0.2669982, -2.466784, 1, 1, 1, 1, 1,
-1.079009, -1.132173, -1.634735, 1, 1, 1, 1, 1,
-1.069946, 1.356891, -0.3818981, 1, 1, 1, 1, 1,
-1.067867, 0.572966, -2.130583, 1, 1, 1, 1, 1,
-1.066649, 0.6572724, -0.825341, 1, 1, 1, 1, 1,
-1.058188, 0.08537853, -2.380268, 0, 0, 1, 1, 1,
-1.052816, 1.14229, 1.263501, 1, 0, 0, 1, 1,
-1.046711, 0.8892242, -0.8515031, 1, 0, 0, 1, 1,
-1.041461, -1.586675, -2.611548, 1, 0, 0, 1, 1,
-1.030244, -0.6807625, -1.039039, 1, 0, 0, 1, 1,
-1.021974, -1.080316, -2.064603, 1, 0, 0, 1, 1,
-1.021227, 0.1915739, -1.619006, 0, 0, 0, 1, 1,
-1.01697, -1.929603, -2.650822, 0, 0, 0, 1, 1,
-1.014293, 0.5491217, 0.4985096, 0, 0, 0, 1, 1,
-1.01141, 0.09053767, 0.2027355, 0, 0, 0, 1, 1,
-1.002894, 0.4549481, -2.501335, 0, 0, 0, 1, 1,
-0.9956771, -1.218979, -2.156054, 0, 0, 0, 1, 1,
-0.9938058, -0.8670561, -2.927139, 0, 0, 0, 1, 1,
-0.9899873, -0.1228892, -1.671577, 1, 1, 1, 1, 1,
-0.9893908, -2.205398, -2.167096, 1, 1, 1, 1, 1,
-0.9842017, -0.7153646, -0.9292728, 1, 1, 1, 1, 1,
-0.9840398, -0.4261921, -2.892602, 1, 1, 1, 1, 1,
-0.9615735, 0.9079096, 0.09210155, 1, 1, 1, 1, 1,
-0.9610984, 2.985439, -0.5134965, 1, 1, 1, 1, 1,
-0.96089, 2.329502, -1.458727, 1, 1, 1, 1, 1,
-0.955165, 0.9754028, -0.944939, 1, 1, 1, 1, 1,
-0.9514506, 0.7260752, -0.4748133, 1, 1, 1, 1, 1,
-0.9503412, -0.0536445, -1.132701, 1, 1, 1, 1, 1,
-0.9492778, -0.374988, -2.926576, 1, 1, 1, 1, 1,
-0.9476351, 2.006226, 0.4729035, 1, 1, 1, 1, 1,
-0.9471237, -0.3051596, -1.906727, 1, 1, 1, 1, 1,
-0.9429674, 0.6485134, 1.009775, 1, 1, 1, 1, 1,
-0.936231, -0.6508799, -2.055316, 1, 1, 1, 1, 1,
-0.934532, 0.6902699, -1.389835, 0, 0, 1, 1, 1,
-0.9344455, -0.3710335, -1.209083, 1, 0, 0, 1, 1,
-0.9327624, -1.427336, -1.943973, 1, 0, 0, 1, 1,
-0.9314607, 0.0483212, -1.229012, 1, 0, 0, 1, 1,
-0.9299668, 2.0134, -0.247441, 1, 0, 0, 1, 1,
-0.9186196, 1.79207, -0.4217208, 1, 0, 0, 1, 1,
-0.9152479, 0.9589198, -0.3341446, 0, 0, 0, 1, 1,
-0.9100906, 0.1132484, -1.759328, 0, 0, 0, 1, 1,
-0.9099228, -0.5877957, -3.093877, 0, 0, 0, 1, 1,
-0.9079773, -0.2128998, -0.4166037, 0, 0, 0, 1, 1,
-0.906161, 0.6296879, -1.860745, 0, 0, 0, 1, 1,
-0.9061285, 1.623186, -0.7857001, 0, 0, 0, 1, 1,
-0.8877818, 0.03302167, -1.701919, 0, 0, 0, 1, 1,
-0.8865612, 0.2097813, -0.7688104, 1, 1, 1, 1, 1,
-0.8850724, -0.4830191, -2.362215, 1, 1, 1, 1, 1,
-0.8827642, -1.375122, -3.385723, 1, 1, 1, 1, 1,
-0.8797431, -2.200226, -2.16644, 1, 1, 1, 1, 1,
-0.8726861, 0.676414, -0.2295763, 1, 1, 1, 1, 1,
-0.8663622, -0.1930681, -1.994012, 1, 1, 1, 1, 1,
-0.858588, 0.04829879, -2.429898, 1, 1, 1, 1, 1,
-0.8536914, 0.5673018, -2.087176, 1, 1, 1, 1, 1,
-0.8521619, -0.451558, -1.511255, 1, 1, 1, 1, 1,
-0.849152, 1.093958, -0.6818851, 1, 1, 1, 1, 1,
-0.8458963, -0.8627114, -2.633689, 1, 1, 1, 1, 1,
-0.8383692, -0.04721412, -1.956879, 1, 1, 1, 1, 1,
-0.8324847, -1.026731, -5.34667, 1, 1, 1, 1, 1,
-0.822417, -0.7732538, -2.398386, 1, 1, 1, 1, 1,
-0.8197802, 0.1072939, -3.138296, 1, 1, 1, 1, 1,
-0.8187678, -0.5564561, -2.290773, 0, 0, 1, 1, 1,
-0.8167526, -0.4282258, -2.034291, 1, 0, 0, 1, 1,
-0.814154, -0.4011842, -2.223934, 1, 0, 0, 1, 1,
-0.809761, 0.5675111, -0.7701721, 1, 0, 0, 1, 1,
-0.8073799, 0.6874031, 0.6050333, 1, 0, 0, 1, 1,
-0.8043636, -1.446646, -3.61536, 1, 0, 0, 1, 1,
-0.8042237, 1.953083, -0.8936146, 0, 0, 0, 1, 1,
-0.8041896, -1.722131, -3.096701, 0, 0, 0, 1, 1,
-0.8031255, 0.4698077, -1.997286, 0, 0, 0, 1, 1,
-0.8007014, -0.4749958, -2.044248, 0, 0, 0, 1, 1,
-0.7983653, -0.1845306, -3.635513, 0, 0, 0, 1, 1,
-0.7980775, -0.4758215, -1.833621, 0, 0, 0, 1, 1,
-0.7974607, 0.4489065, -1.75613, 0, 0, 0, 1, 1,
-0.7948996, -1.522703, -2.972431, 1, 1, 1, 1, 1,
-0.7930015, 0.0009103497, -1.910064, 1, 1, 1, 1, 1,
-0.7869663, 0.007898951, -2.236191, 1, 1, 1, 1, 1,
-0.7776828, 0.7049859, -0.8942417, 1, 1, 1, 1, 1,
-0.7727001, -0.6506957, -2.751242, 1, 1, 1, 1, 1,
-0.7686322, -0.4054485, -3.568997, 1, 1, 1, 1, 1,
-0.7686264, 0.8588607, 0.3061073, 1, 1, 1, 1, 1,
-0.7653962, 0.6577547, -1.08295, 1, 1, 1, 1, 1,
-0.7641661, -0.1281703, -0.9049326, 1, 1, 1, 1, 1,
-0.7614173, 2.842857, -0.01232567, 1, 1, 1, 1, 1,
-0.7599601, -1.507368, -3.583026, 1, 1, 1, 1, 1,
-0.7595534, 0.3314248, 0.1147552, 1, 1, 1, 1, 1,
-0.7552825, 0.5382953, -0.4543308, 1, 1, 1, 1, 1,
-0.7487213, 2.166644, -0.07329644, 1, 1, 1, 1, 1,
-0.7482654, -0.3087287, -2.174227, 1, 1, 1, 1, 1,
-0.7459214, -0.356744, -2.53463, 0, 0, 1, 1, 1,
-0.7446237, -0.6424224, -2.653917, 1, 0, 0, 1, 1,
-0.7442455, -1.420403, -2.55557, 1, 0, 0, 1, 1,
-0.7381902, -1.85472, -2.601323, 1, 0, 0, 1, 1,
-0.7360098, -0.815456, -0.6795778, 1, 0, 0, 1, 1,
-0.7312468, -0.7133905, -1.784942, 1, 0, 0, 1, 1,
-0.7260013, 1.173103, -1.778018, 0, 0, 0, 1, 1,
-0.7250103, -0.1271618, -2.756848, 0, 0, 0, 1, 1,
-0.7135826, 0.9263943, -0.3896435, 0, 0, 0, 1, 1,
-0.7104312, -0.02728125, -1.621987, 0, 0, 0, 1, 1,
-0.7093217, 1.234236, -2.619504, 0, 0, 0, 1, 1,
-0.7082015, 0.5092977, -0.8265038, 0, 0, 0, 1, 1,
-0.7065793, 0.01148094, -1.627002, 0, 0, 0, 1, 1,
-0.7014677, 0.0352282, -1.235128, 1, 1, 1, 1, 1,
-0.6957994, -1.740443, -1.260941, 1, 1, 1, 1, 1,
-0.6946362, -0.4996794, -0.6581703, 1, 1, 1, 1, 1,
-0.6932872, 0.9837937, -0.9249274, 1, 1, 1, 1, 1,
-0.6879744, 0.4712493, -0.9879559, 1, 1, 1, 1, 1,
-0.6871108, 0.60381, -1.203055, 1, 1, 1, 1, 1,
-0.6733485, 0.7180146, 0.2413305, 1, 1, 1, 1, 1,
-0.6701154, 2.214324, -0.5091599, 1, 1, 1, 1, 1,
-0.6632653, 0.5495712, -4.028347, 1, 1, 1, 1, 1,
-0.6622095, 0.2148024, -1.240415, 1, 1, 1, 1, 1,
-0.6509772, -0.2832438, -1.882721, 1, 1, 1, 1, 1,
-0.6502084, 0.6988964, -1.185684, 1, 1, 1, 1, 1,
-0.648421, -1.859992, -2.631647, 1, 1, 1, 1, 1,
-0.6455598, 0.7412289, 0.8232271, 1, 1, 1, 1, 1,
-0.6421371, -0.2739947, -1.889874, 1, 1, 1, 1, 1,
-0.6400694, -1.534621, -2.0098, 0, 0, 1, 1, 1,
-0.6396608, -0.5011359, -1.150435, 1, 0, 0, 1, 1,
-0.6395023, 0.9634736, 0.7981185, 1, 0, 0, 1, 1,
-0.6315994, 2.03959, -1.292564, 1, 0, 0, 1, 1,
-0.6299213, -0.4067325, -3.624974, 1, 0, 0, 1, 1,
-0.628615, 0.6745732, -0.4710756, 1, 0, 0, 1, 1,
-0.6257117, -1.199168, -1.875836, 0, 0, 0, 1, 1,
-0.6172506, -1.301392, -1.203777, 0, 0, 0, 1, 1,
-0.6165149, -0.8336556, -2.718182, 0, 0, 0, 1, 1,
-0.6140413, 1.463018, -0.2636323, 0, 0, 0, 1, 1,
-0.613009, 1.815383, -0.2542533, 0, 0, 0, 1, 1,
-0.6077479, -0.5983709, 0.1491277, 0, 0, 0, 1, 1,
-0.6071321, -0.8590509, -1.957622, 0, 0, 0, 1, 1,
-0.6069118, -1.457508, -3.14485, 1, 1, 1, 1, 1,
-0.6060532, 0.1203478, -0.3801949, 1, 1, 1, 1, 1,
-0.5980347, -0.5033535, -2.438907, 1, 1, 1, 1, 1,
-0.5945876, 1.811065, 1.123668, 1, 1, 1, 1, 1,
-0.5917044, 0.1365671, -0.6997527, 1, 1, 1, 1, 1,
-0.5883594, -0.2382821, -1.174681, 1, 1, 1, 1, 1,
-0.5846921, -0.2473633, -3.331795, 1, 1, 1, 1, 1,
-0.5839672, -0.4083225, -1.269704, 1, 1, 1, 1, 1,
-0.5826802, 1.15533, 0.1867899, 1, 1, 1, 1, 1,
-0.5786756, -0.8679962, -1.736464, 1, 1, 1, 1, 1,
-0.5775259, 0.5183407, -0.3892657, 1, 1, 1, 1, 1,
-0.5752616, 1.185231, -2.278961, 1, 1, 1, 1, 1,
-0.5726401, 1.169542, 0.4160688, 1, 1, 1, 1, 1,
-0.5709942, 0.5311336, 1.353058, 1, 1, 1, 1, 1,
-0.5673395, 0.4839552, -0.6435543, 1, 1, 1, 1, 1,
-0.5670422, -0.8270649, -0.8399217, 0, 0, 1, 1, 1,
-0.5613372, -0.886077, -3.019736, 1, 0, 0, 1, 1,
-0.5575222, 1.377154, 1.210388, 1, 0, 0, 1, 1,
-0.555912, -1.20989, -2.342142, 1, 0, 0, 1, 1,
-0.5551513, -1.196895, -3.898224, 1, 0, 0, 1, 1,
-0.5534508, -1.083004, -2.008881, 1, 0, 0, 1, 1,
-0.5516295, 1.249034, -1.543731, 0, 0, 0, 1, 1,
-0.5483071, -0.9620107, -1.986879, 0, 0, 0, 1, 1,
-0.5460668, -0.7370895, -2.350879, 0, 0, 0, 1, 1,
-0.545151, 0.2036264, -1.24467, 0, 0, 0, 1, 1,
-0.5449018, -1.634687, -2.365521, 0, 0, 0, 1, 1,
-0.5448986, -0.09114538, -2.908588, 0, 0, 0, 1, 1,
-0.5440434, -1.64539, -2.981224, 0, 0, 0, 1, 1,
-0.5432282, -0.775906, -3.643141, 1, 1, 1, 1, 1,
-0.5359462, 0.3684495, -2.15468, 1, 1, 1, 1, 1,
-0.5348966, -0.07634778, -1.192737, 1, 1, 1, 1, 1,
-0.5344482, 0.7676982, 0.6617204, 1, 1, 1, 1, 1,
-0.5305006, -1.859231, -3.739647, 1, 1, 1, 1, 1,
-0.5269868, -0.5858485, -1.839287, 1, 1, 1, 1, 1,
-0.5209959, -0.1656906, -2.262769, 1, 1, 1, 1, 1,
-0.5165056, -0.2892996, -2.632583, 1, 1, 1, 1, 1,
-0.5091626, 0.686008, -0.8760177, 1, 1, 1, 1, 1,
-0.5058712, 0.4051193, -1.00031, 1, 1, 1, 1, 1,
-0.5045502, -1.056476, -1.771131, 1, 1, 1, 1, 1,
-0.504149, -0.7066705, -2.096285, 1, 1, 1, 1, 1,
-0.5036198, 1.11759, -1.228535, 1, 1, 1, 1, 1,
-0.5028131, -1.17544, -1.806743, 1, 1, 1, 1, 1,
-0.5000084, -0.2033559, -1.097404, 1, 1, 1, 1, 1,
-0.4922218, -1.813082, -2.306351, 0, 0, 1, 1, 1,
-0.4914561, 0.8391933, -1.438544, 1, 0, 0, 1, 1,
-0.4840946, 0.08990415, -1.14897, 1, 0, 0, 1, 1,
-0.4806594, 0.03601117, -0.6085012, 1, 0, 0, 1, 1,
-0.4765506, 1.406857, -1.580557, 1, 0, 0, 1, 1,
-0.4764721, -0.5888701, -1.544836, 1, 0, 0, 1, 1,
-0.4761475, 0.2422359, -1.29519, 0, 0, 0, 1, 1,
-0.4739282, 0.07202099, -2.291022, 0, 0, 0, 1, 1,
-0.4706458, 1.248168, -2.280236, 0, 0, 0, 1, 1,
-0.4671277, 0.6223074, -0.5459781, 0, 0, 0, 1, 1,
-0.466731, -1.454025, -1.841521, 0, 0, 0, 1, 1,
-0.466413, -0.9718591, -3.15778, 0, 0, 0, 1, 1,
-0.4597061, 1.367319, 0.9123247, 0, 0, 0, 1, 1,
-0.4579198, 0.4386072, -1.214335, 1, 1, 1, 1, 1,
-0.449798, -0.605965, -2.212297, 1, 1, 1, 1, 1,
-0.447719, 2.673992, -0.2604623, 1, 1, 1, 1, 1,
-0.4474743, 1.414566, -0.4562237, 1, 1, 1, 1, 1,
-0.4471952, -0.5866525, -1.806437, 1, 1, 1, 1, 1,
-0.4468551, 2.671524, -0.2567795, 1, 1, 1, 1, 1,
-0.4454423, -2.71166, -3.564271, 1, 1, 1, 1, 1,
-0.4435095, 0.8961679, -0.32128, 1, 1, 1, 1, 1,
-0.4408618, -1.011988, -3.098513, 1, 1, 1, 1, 1,
-0.4397301, 0.6052946, 0.6069007, 1, 1, 1, 1, 1,
-0.4376135, -0.01015032, -0.4973441, 1, 1, 1, 1, 1,
-0.4269885, 0.5769393, 0.83266, 1, 1, 1, 1, 1,
-0.4266978, -0.7922748, -3.200685, 1, 1, 1, 1, 1,
-0.4264556, 1.016723, -2.410637, 1, 1, 1, 1, 1,
-0.4226795, 1.045503, -1.018944, 1, 1, 1, 1, 1,
-0.4201109, 0.1181424, 1.017081, 0, 0, 1, 1, 1,
-0.4159228, 0.0156073, -2.107673, 1, 0, 0, 1, 1,
-0.4136236, -1.089526, -3.956, 1, 0, 0, 1, 1,
-0.4091811, -0.4257575, -2.068138, 1, 0, 0, 1, 1,
-0.4085626, -1.151303, -3.712464, 1, 0, 0, 1, 1,
-0.4020602, 1.959437, 0.4113194, 1, 0, 0, 1, 1,
-0.4012412, -2.0614, -2.049726, 0, 0, 0, 1, 1,
-0.3975901, 0.6722981, -0.7383988, 0, 0, 0, 1, 1,
-0.3873764, -0.05975962, -0.9900672, 0, 0, 0, 1, 1,
-0.3862082, 1.363789, 0.250699, 0, 0, 0, 1, 1,
-0.3829651, -0.5128712, -2.340093, 0, 0, 0, 1, 1,
-0.3820332, -0.9086829, -2.871672, 0, 0, 0, 1, 1,
-0.3782622, 0.1063121, -0.993412, 0, 0, 0, 1, 1,
-0.3730557, -0.3178566, -1.917969, 1, 1, 1, 1, 1,
-0.371245, 0.1137621, -0.8583083, 1, 1, 1, 1, 1,
-0.3615246, -0.2310927, -0.5551568, 1, 1, 1, 1, 1,
-0.3603292, 0.5294048, -0.6533322, 1, 1, 1, 1, 1,
-0.3580746, 0.1108189, -1.110889, 1, 1, 1, 1, 1,
-0.3538476, -1.433465, -4.356388, 1, 1, 1, 1, 1,
-0.3492851, 0.2365467, -0.7542249, 1, 1, 1, 1, 1,
-0.3469884, -0.01262443, -1.740243, 1, 1, 1, 1, 1,
-0.3453492, -1.275313, -2.85435, 1, 1, 1, 1, 1,
-0.3426054, -1.052704, -3.231984, 1, 1, 1, 1, 1,
-0.342214, -1.683201, -0.7092612, 1, 1, 1, 1, 1,
-0.3410341, 0.7221214, -0.6168028, 1, 1, 1, 1, 1,
-0.3409428, -1.289955, -3.633885, 1, 1, 1, 1, 1,
-0.3375655, 0.6355477, 0.1089625, 1, 1, 1, 1, 1,
-0.3323297, -0.8604331, -1.798939, 1, 1, 1, 1, 1,
-0.3249835, 0.5838206, -0.6482173, 0, 0, 1, 1, 1,
-0.3186438, -1.417671, -2.983507, 1, 0, 0, 1, 1,
-0.3179438, 0.3468654, -0.617932, 1, 0, 0, 1, 1,
-0.3134043, 0.6530727, -1.189364, 1, 0, 0, 1, 1,
-0.2947654, 0.2409986, 0.4484198, 1, 0, 0, 1, 1,
-0.2939982, 0.4270913, -1.741523, 1, 0, 0, 1, 1,
-0.2887209, 1.337234, 1.195256, 0, 0, 0, 1, 1,
-0.2886767, -0.1869081, -2.382512, 0, 0, 0, 1, 1,
-0.2886599, 1.336756, -1.776094, 0, 0, 0, 1, 1,
-0.2869569, 1.104583, 0.1882604, 0, 0, 0, 1, 1,
-0.2834735, 2.218073, 1.772855, 0, 0, 0, 1, 1,
-0.2814465, -0.4189824, -1.930447, 0, 0, 0, 1, 1,
-0.2807838, -0.1201602, -2.482194, 0, 0, 0, 1, 1,
-0.2789014, -0.4174424, -1.677622, 1, 1, 1, 1, 1,
-0.2753648, -0.492128, -2.864521, 1, 1, 1, 1, 1,
-0.2715502, -0.1763023, -2.794805, 1, 1, 1, 1, 1,
-0.2712599, 2.18644, -0.2651109, 1, 1, 1, 1, 1,
-0.2669632, -0.8464524, -3.821224, 1, 1, 1, 1, 1,
-0.263466, -0.08985382, -0.5516019, 1, 1, 1, 1, 1,
-0.2617948, 0.9081904, -0.1554262, 1, 1, 1, 1, 1,
-0.260132, 1.12016, -0.4808419, 1, 1, 1, 1, 1,
-0.2555824, 2.617582, 0.5991257, 1, 1, 1, 1, 1,
-0.2552565, -2.21041, -1.095341, 1, 1, 1, 1, 1,
-0.2537951, 1.172137, 0.4580032, 1, 1, 1, 1, 1,
-0.2528185, 1.175373, -0.7802617, 1, 1, 1, 1, 1,
-0.2485351, -1.138396, -4.132668, 1, 1, 1, 1, 1,
-0.238923, 0.844806, -0.061499, 1, 1, 1, 1, 1,
-0.2387318, -3.922455, -3.077978, 1, 1, 1, 1, 1,
-0.2385933, 0.03429501, -0.8697762, 0, 0, 1, 1, 1,
-0.2336939, -0.123408, -0.7276574, 1, 0, 0, 1, 1,
-0.2334643, -0.3482631, -3.809794, 1, 0, 0, 1, 1,
-0.2300929, -0.8480225, -3.358106, 1, 0, 0, 1, 1,
-0.2288983, 0.6329257, -0.1231104, 1, 0, 0, 1, 1,
-0.2284641, 1.657447, 0.554604, 1, 0, 0, 1, 1,
-0.2274091, 0.6218984, -1.493068, 0, 0, 0, 1, 1,
-0.222958, -0.8741857, -5.191272, 0, 0, 0, 1, 1,
-0.2226951, 0.05797931, -0.6261596, 0, 0, 0, 1, 1,
-0.2220737, -0.09485656, -2.798996, 0, 0, 0, 1, 1,
-0.2169015, 1.525122, -1.078345, 0, 0, 0, 1, 1,
-0.2163175, -0.0009991368, -1.829541, 0, 0, 0, 1, 1,
-0.2133909, 0.9854693, -1.312722, 0, 0, 0, 1, 1,
-0.2114615, -0.6703129, -2.233284, 1, 1, 1, 1, 1,
-0.2113241, -0.5965903, -1.254974, 1, 1, 1, 1, 1,
-0.2066003, 1.673481, 0.5703118, 1, 1, 1, 1, 1,
-0.2061005, -1.386613, -3.180244, 1, 1, 1, 1, 1,
-0.2049676, 0.1968171, -0.6296253, 1, 1, 1, 1, 1,
-0.2036002, 1.243829, -2.173664, 1, 1, 1, 1, 1,
-0.2031774, -1.235725, -2.499418, 1, 1, 1, 1, 1,
-0.1972608, 1.562106, -0.107555, 1, 1, 1, 1, 1,
-0.1960423, -0.1647206, -3.322401, 1, 1, 1, 1, 1,
-0.1958589, 0.1268097, -1.208741, 1, 1, 1, 1, 1,
-0.194788, 1.04689, -1.900766, 1, 1, 1, 1, 1,
-0.193952, -1.493566, -4.653653, 1, 1, 1, 1, 1,
-0.191842, -1.15676, -2.659904, 1, 1, 1, 1, 1,
-0.1917423, -1.094361, -1.442258, 1, 1, 1, 1, 1,
-0.1916304, -1.894386, -3.001029, 1, 1, 1, 1, 1,
-0.1885982, -0.1963985, -1.440665, 0, 0, 1, 1, 1,
-0.1866592, -0.2403501, -3.54941, 1, 0, 0, 1, 1,
-0.1820765, -0.2156065, -2.767749, 1, 0, 0, 1, 1,
-0.1779546, 0.7814787, 0.1581171, 1, 0, 0, 1, 1,
-0.1705806, -0.629579, -1.708675, 1, 0, 0, 1, 1,
-0.1701817, 1.269839, -0.6139742, 1, 0, 0, 1, 1,
-0.1691988, -0.06927206, -0.69176, 0, 0, 0, 1, 1,
-0.1691108, 0.2403516, 0.7729952, 0, 0, 0, 1, 1,
-0.1690264, 0.5682949, -0.1661843, 0, 0, 0, 1, 1,
-0.1655074, 0.2694493, 1.36651, 0, 0, 0, 1, 1,
-0.1645706, 1.226259, -0.9122458, 0, 0, 0, 1, 1,
-0.1615132, 0.3440298, -1.74677, 0, 0, 0, 1, 1,
-0.1612896, 0.2423775, -1.304691, 0, 0, 0, 1, 1,
-0.1602999, -0.1680292, -4.942679, 1, 1, 1, 1, 1,
-0.1586308, 0.9208957, 0.2078014, 1, 1, 1, 1, 1,
-0.1566454, -0.6808071, -4.150363, 1, 1, 1, 1, 1,
-0.155713, 0.1358463, -0.2048499, 1, 1, 1, 1, 1,
-0.1521885, -0.0406673, -3.274397, 1, 1, 1, 1, 1,
-0.1511345, -1.327449, -1.577742, 1, 1, 1, 1, 1,
-0.1504294, -0.3166973, -3.408392, 1, 1, 1, 1, 1,
-0.1479998, 1.558906, 0.5229725, 1, 1, 1, 1, 1,
-0.1399058, -0.5558833, -2.644312, 1, 1, 1, 1, 1,
-0.1366186, 0.7964575, 0.5179194, 1, 1, 1, 1, 1,
-0.1341147, 1.00607, -0.1330873, 1, 1, 1, 1, 1,
-0.1336019, 1.167461, 0.7537661, 1, 1, 1, 1, 1,
-0.1289707, -1.645468, -3.326427, 1, 1, 1, 1, 1,
-0.125516, 0.0711557, -2.865225, 1, 1, 1, 1, 1,
-0.123046, -0.03610263, -3.039454, 1, 1, 1, 1, 1,
-0.1133306, -0.4987429, -2.4538, 0, 0, 1, 1, 1,
-0.1124285, -0.197584, -0.9900016, 1, 0, 0, 1, 1,
-0.109382, -1.647359, -3.050759, 1, 0, 0, 1, 1,
-0.1093414, 0.06360231, -1.113429, 1, 0, 0, 1, 1,
-0.106581, -0.6671209, -3.827717, 1, 0, 0, 1, 1,
-0.1039235, -1.261998, -4.242831, 1, 0, 0, 1, 1,
-0.1018405, -0.6095439, -3.750983, 0, 0, 0, 1, 1,
-0.1000095, -0.4907867, -1.577486, 0, 0, 0, 1, 1,
-0.09919759, -1.466904, -3.126087, 0, 0, 0, 1, 1,
-0.09671014, -0.7687906, -4.099504, 0, 0, 0, 1, 1,
-0.09644568, 0.2527703, 0.8567007, 0, 0, 0, 1, 1,
-0.0935595, -0.770646, -2.558282, 0, 0, 0, 1, 1,
-0.09314476, 0.7581776, -0.9223847, 0, 0, 0, 1, 1,
-0.09162822, 1.281274, 0.3010929, 1, 1, 1, 1, 1,
-0.08980242, 0.4535816, -0.5493566, 1, 1, 1, 1, 1,
-0.08637371, 1.150771, 2.173109, 1, 1, 1, 1, 1,
-0.08524378, -0.5878206, -2.659247, 1, 1, 1, 1, 1,
-0.08334575, -0.2069353, -1.4416, 1, 1, 1, 1, 1,
-0.08325933, 1.099694, 1.824518, 1, 1, 1, 1, 1,
-0.08280791, -0.2017887, -2.740936, 1, 1, 1, 1, 1,
-0.08078383, -0.7601461, -1.442957, 1, 1, 1, 1, 1,
-0.06936055, -0.8062643, -3.487617, 1, 1, 1, 1, 1,
-0.06602903, -0.08298079, -4.359679, 1, 1, 1, 1, 1,
-0.06265034, 1.262522, -1.809194, 1, 1, 1, 1, 1,
-0.06225978, 0.7136003, 1.376361, 1, 1, 1, 1, 1,
-0.06027501, 2.087542, -1.938957, 1, 1, 1, 1, 1,
-0.05558842, 1.032833, 1.116424, 1, 1, 1, 1, 1,
-0.05148043, -1.425804, -5.359089, 1, 1, 1, 1, 1,
-0.0490633, -1.000435, -4.318084, 0, 0, 1, 1, 1,
-0.04414173, 0.4449329, -1.531247, 1, 0, 0, 1, 1,
-0.04207128, 0.6864502, 1.379107, 1, 0, 0, 1, 1,
-0.04162624, 0.1653924, -0.4075789, 1, 0, 0, 1, 1,
-0.04035239, -1.186148, -3.68388, 1, 0, 0, 1, 1,
-0.03930629, 1.322889, -0.7686813, 1, 0, 0, 1, 1,
-0.0385366, 1.288381, -0.982589, 0, 0, 0, 1, 1,
-0.03325322, -0.5466802, -3.968666, 0, 0, 0, 1, 1,
-0.03010175, 0.2615258, -0.6354766, 0, 0, 0, 1, 1,
-0.02703574, 1.621938, -0.9318419, 0, 0, 0, 1, 1,
-0.02387468, 1.307635, 0.4587961, 0, 0, 0, 1, 1,
-0.02200346, 1.342181, 0.8232213, 0, 0, 0, 1, 1,
-0.02154299, -1.076439, -5.167101, 0, 0, 0, 1, 1,
-0.02111093, 1.422503, 0.1405275, 1, 1, 1, 1, 1,
-0.01641298, 0.09645534, -0.08892784, 1, 1, 1, 1, 1,
-0.01633663, 0.6042711, -1.592049, 1, 1, 1, 1, 1,
-0.01541086, 0.699743, -0.6112369, 1, 1, 1, 1, 1,
-0.01446706, 0.6168925, 0.6494244, 1, 1, 1, 1, 1,
-0.01259606, -0.8700418, -4.023306, 1, 1, 1, 1, 1,
-0.01198232, -0.7406032, -2.197178, 1, 1, 1, 1, 1,
-0.01181786, 0.3772134, -0.5821779, 1, 1, 1, 1, 1,
-0.009980417, -0.411353, -3.258596, 1, 1, 1, 1, 1,
-0.005312913, 0.1884685, -0.9664385, 1, 1, 1, 1, 1,
-0.005303169, 0.2514374, 0.5468554, 1, 1, 1, 1, 1,
-0.004801875, -0.6550368, -4.576076, 1, 1, 1, 1, 1,
0.0001239029, -0.06435685, 3.757787, 1, 1, 1, 1, 1,
0.002099955, -1.232107, 2.385154, 1, 1, 1, 1, 1,
0.005699161, 1.262626, 1.763506, 1, 1, 1, 1, 1,
0.008223604, -1.237247, 4.0165, 0, 0, 1, 1, 1,
0.009575343, 0.3789361, 1.068923, 1, 0, 0, 1, 1,
0.01099242, 1.128685, -1.759505, 1, 0, 0, 1, 1,
0.01739027, 0.5275696, -0.8080261, 1, 0, 0, 1, 1,
0.02217462, -1.984823, 3.718015, 1, 0, 0, 1, 1,
0.02799334, -1.110596, 3.953305, 1, 0, 0, 1, 1,
0.02802919, 1.543171, 0.794477, 0, 0, 0, 1, 1,
0.03691481, -0.2454114, 3.278332, 0, 0, 0, 1, 1,
0.05078398, -1.27208, 2.504824, 0, 0, 0, 1, 1,
0.05394937, 0.3064339, -0.8367321, 0, 0, 0, 1, 1,
0.05516964, -0.7753772, 3.585157, 0, 0, 0, 1, 1,
0.0584144, -0.9429424, 0.2686264, 0, 0, 0, 1, 1,
0.05903351, 0.673601, 1.590989, 0, 0, 0, 1, 1,
0.06700099, 1.379037, -0.6408495, 1, 1, 1, 1, 1,
0.06732792, -0.1080973, 2.738264, 1, 1, 1, 1, 1,
0.06946889, -1.009387, 0.9951157, 1, 1, 1, 1, 1,
0.07141806, 0.4068702, 1.83441, 1, 1, 1, 1, 1,
0.07296263, 0.5119993, 0.4388384, 1, 1, 1, 1, 1,
0.07563559, 1.088954, -0.4343837, 1, 1, 1, 1, 1,
0.07830987, -0.3517475, 3.061145, 1, 1, 1, 1, 1,
0.07999213, -0.6543576, 4.79088, 1, 1, 1, 1, 1,
0.08813328, 0.5608852, 0.891413, 1, 1, 1, 1, 1,
0.09308231, -0.7226236, 2.316113, 1, 1, 1, 1, 1,
0.09380757, -0.3871539, 2.669526, 1, 1, 1, 1, 1,
0.09523098, -2.30722, 4.785244, 1, 1, 1, 1, 1,
0.09608978, -0.4522207, 1.201742, 1, 1, 1, 1, 1,
0.09851364, -0.829228, 3.709909, 1, 1, 1, 1, 1,
0.104388, -0.6024553, 2.227579, 1, 1, 1, 1, 1,
0.104627, -0.9505755, 2.369802, 0, 0, 1, 1, 1,
0.1061417, 0.2928427, -1.222949, 1, 0, 0, 1, 1,
0.1070621, -0.6231768, 3.419053, 1, 0, 0, 1, 1,
0.1085113, 1.048892, 0.5941135, 1, 0, 0, 1, 1,
0.1096461, -0.8406961, 3.332895, 1, 0, 0, 1, 1,
0.1123569, -1.201524, 2.432253, 1, 0, 0, 1, 1,
0.112961, -0.06606395, 2.538359, 0, 0, 0, 1, 1,
0.1163658, 0.1898176, -0.8713279, 0, 0, 0, 1, 1,
0.1234082, 0.5377602, -0.1324971, 0, 0, 0, 1, 1,
0.125151, -0.05746183, 1.877578, 0, 0, 0, 1, 1,
0.1262163, -0.3518195, 2.19006, 0, 0, 0, 1, 1,
0.1292954, 1.614342, 0.5608682, 0, 0, 0, 1, 1,
0.1300667, 0.7605628, 0.04720813, 0, 0, 0, 1, 1,
0.1318742, 1.088611, -0.1969681, 1, 1, 1, 1, 1,
0.13265, -1.13584, 4.44773, 1, 1, 1, 1, 1,
0.135744, -1.218736, 2.485999, 1, 1, 1, 1, 1,
0.137782, 1.097777, 3.146785, 1, 1, 1, 1, 1,
0.139492, -0.990154, 1.639645, 1, 1, 1, 1, 1,
0.1400133, -0.316915, 2.747213, 1, 1, 1, 1, 1,
0.1435919, 1.028694, 0.9180824, 1, 1, 1, 1, 1,
0.1449377, 0.373264, 1.378237, 1, 1, 1, 1, 1,
0.1481839, -1.344793, 1.678281, 1, 1, 1, 1, 1,
0.1501098, 0.1039225, 1.664006, 1, 1, 1, 1, 1,
0.1518874, -0.7709515, 3.12921, 1, 1, 1, 1, 1,
0.1522635, 0.515978, -1.72208, 1, 1, 1, 1, 1,
0.154535, -0.6116671, 3.501514, 1, 1, 1, 1, 1,
0.1613332, -1.642682, 3.418376, 1, 1, 1, 1, 1,
0.1672771, -0.4298907, 4.491013, 1, 1, 1, 1, 1,
0.1689948, 0.32149, 1.349977, 0, 0, 1, 1, 1,
0.1696827, -0.333777, 3.460202, 1, 0, 0, 1, 1,
0.1732396, -0.5743638, 2.36742, 1, 0, 0, 1, 1,
0.1737554, -0.08025839, 1.421147, 1, 0, 0, 1, 1,
0.1768243, 1.584964, 0.8150213, 1, 0, 0, 1, 1,
0.1837856, -0.722436, 2.026629, 1, 0, 0, 1, 1,
0.1876387, -1.398214, 3.984671, 0, 0, 0, 1, 1,
0.1922189, -0.2524053, 1.788135, 0, 0, 0, 1, 1,
0.1925001, -0.302506, 1.505396, 0, 0, 0, 1, 1,
0.1997952, 0.5149433, -0.4454456, 0, 0, 0, 1, 1,
0.2001276, -1.136843, 2.913927, 0, 0, 0, 1, 1,
0.2041249, 0.6162117, -1.287276, 0, 0, 0, 1, 1,
0.2143771, -0.9598715, 3.996286, 0, 0, 0, 1, 1,
0.2163923, 1.851866, -0.6994326, 1, 1, 1, 1, 1,
0.2172838, 0.3067617, 0.4586178, 1, 1, 1, 1, 1,
0.2240025, 0.1608917, 0.8777975, 1, 1, 1, 1, 1,
0.2263622, 0.1058161, 2.418126, 1, 1, 1, 1, 1,
0.226851, 1.097725, 0.5999023, 1, 1, 1, 1, 1,
0.2279863, 1.643348, 0.5735632, 1, 1, 1, 1, 1,
0.2284896, 0.4088725, 0.5672097, 1, 1, 1, 1, 1,
0.2372537, -1.295706, 2.775488, 1, 1, 1, 1, 1,
0.2392639, 1.176326, -0.2760365, 1, 1, 1, 1, 1,
0.240551, 1.900652, -0.2078552, 1, 1, 1, 1, 1,
0.2453448, -0.03095248, 0.7322282, 1, 1, 1, 1, 1,
0.2475035, -0.05123247, 1.639117, 1, 1, 1, 1, 1,
0.2485442, 1.104332, 1.057712, 1, 1, 1, 1, 1,
0.2486497, -2.008505, 2.582707, 1, 1, 1, 1, 1,
0.2506248, 0.8384801, -0.6127726, 1, 1, 1, 1, 1,
0.2510701, -0.8623645, 2.98918, 0, 0, 1, 1, 1,
0.254692, 0.5410951, 1.245701, 1, 0, 0, 1, 1,
0.263016, 0.9171882, -1.274833, 1, 0, 0, 1, 1,
0.2653719, -1.734833, 3.93277, 1, 0, 0, 1, 1,
0.2660044, 0.007832368, 2.073829, 1, 0, 0, 1, 1,
0.2662122, -0.6781857, 4.406951, 1, 0, 0, 1, 1,
0.2672949, 1.186015, 1.001953, 0, 0, 0, 1, 1,
0.2723859, 1.396726, -2.287739, 0, 0, 0, 1, 1,
0.2778873, 0.3581363, -1.027689, 0, 0, 0, 1, 1,
0.2796325, 0.2249866, 0.817045, 0, 0, 0, 1, 1,
0.2826948, 0.2475144, 0.0791632, 0, 0, 0, 1, 1,
0.2834113, -0.1600898, 3.156223, 0, 0, 0, 1, 1,
0.2839782, 1.203769, -0.8160713, 0, 0, 0, 1, 1,
0.2865397, 0.5917172, 0.03068078, 1, 1, 1, 1, 1,
0.2869929, -0.6634352, 3.19753, 1, 1, 1, 1, 1,
0.2884737, 0.3773599, -1.129529, 1, 1, 1, 1, 1,
0.2940454, 1.782729, -1.656783, 1, 1, 1, 1, 1,
0.2953097, 0.1990916, 1.020754, 1, 1, 1, 1, 1,
0.2996635, 0.1178017, 1.045393, 1, 1, 1, 1, 1,
0.3009229, -0.9038761, 2.193417, 1, 1, 1, 1, 1,
0.3014416, -0.6630828, 3.015065, 1, 1, 1, 1, 1,
0.302066, 0.8945915, 1.037884, 1, 1, 1, 1, 1,
0.3027042, -0.4612606, 1.011316, 1, 1, 1, 1, 1,
0.3055966, 0.275106, -0.1586036, 1, 1, 1, 1, 1,
0.3066464, -0.166283, 2.147013, 1, 1, 1, 1, 1,
0.312858, -0.481705, 2.396153, 1, 1, 1, 1, 1,
0.3146875, 1.44998, 1.01063, 1, 1, 1, 1, 1,
0.3152207, 0.5076699, 0.4262904, 1, 1, 1, 1, 1,
0.3183433, 1.178656, 3.318135, 0, 0, 1, 1, 1,
0.3185175, 0.4773348, 1.779014, 1, 0, 0, 1, 1,
0.3194993, -0.2138343, 2.005787, 1, 0, 0, 1, 1,
0.323241, 1.236404, 0.5412014, 1, 0, 0, 1, 1,
0.3257703, 0.5283641, -0.4241368, 1, 0, 0, 1, 1,
0.3272906, 1.359259, -0.6720139, 1, 0, 0, 1, 1,
0.3285568, 0.03238124, 0.1954057, 0, 0, 0, 1, 1,
0.3334591, -0.9371885, 3.204678, 0, 0, 0, 1, 1,
0.3377323, -0.986447, 3.328597, 0, 0, 0, 1, 1,
0.3418323, 0.1807401, 0.2533799, 0, 0, 0, 1, 1,
0.3458734, 1.032386, 0.8443469, 0, 0, 0, 1, 1,
0.3490943, -1.535791, 3.547431, 0, 0, 0, 1, 1,
0.3499943, 0.8611783, 2.294333, 0, 0, 0, 1, 1,
0.3531346, 1.259597, 1.129679, 1, 1, 1, 1, 1,
0.3559337, -0.9404234, 3.36004, 1, 1, 1, 1, 1,
0.3577482, 1.973172, -0.01701107, 1, 1, 1, 1, 1,
0.3606629, -0.1259083, 3.416698, 1, 1, 1, 1, 1,
0.3611362, -0.1106994, 1.285201, 1, 1, 1, 1, 1,
0.3621374, -0.697313, 4.020939, 1, 1, 1, 1, 1,
0.3625969, 0.1543434, 0.8630617, 1, 1, 1, 1, 1,
0.3673244, -1.261661, 3.060511, 1, 1, 1, 1, 1,
0.3690614, 1.26895, 1.609446, 1, 1, 1, 1, 1,
0.3737808, 0.0503023, 1.483414, 1, 1, 1, 1, 1,
0.374108, -0.3800943, 2.178737, 1, 1, 1, 1, 1,
0.3768408, 0.2562633, 1.629482, 1, 1, 1, 1, 1,
0.3789062, 1.793095, -0.4579982, 1, 1, 1, 1, 1,
0.3817258, 1.960395, -0.5417674, 1, 1, 1, 1, 1,
0.3826492, 1.347149, 0.5216311, 1, 1, 1, 1, 1,
0.3834071, -1.221729, 2.682875, 0, 0, 1, 1, 1,
0.385362, 1.06934, -0.6042214, 1, 0, 0, 1, 1,
0.3907307, 2.930391, 0.7765958, 1, 0, 0, 1, 1,
0.3908497, 1.025559, 0.7740268, 1, 0, 0, 1, 1,
0.3929893, 0.5536272, 0.7495705, 1, 0, 0, 1, 1,
0.3956182, -0.7072054, 1.408067, 1, 0, 0, 1, 1,
0.3963407, 0.2788989, 2.412645, 0, 0, 0, 1, 1,
0.3966236, -0.7130394, 4.098579, 0, 0, 0, 1, 1,
0.4076394, -1.242721, 3.502927, 0, 0, 0, 1, 1,
0.4086198, -0.1923273, 2.84164, 0, 0, 0, 1, 1,
0.410374, -0.1237676, 1.643477, 0, 0, 0, 1, 1,
0.4114082, 0.4929381, -0.2800555, 0, 0, 0, 1, 1,
0.4115295, -1.368675, 3.590981, 0, 0, 0, 1, 1,
0.4143156, -2.390435, 2.944117, 1, 1, 1, 1, 1,
0.4203472, -0.3853531, 3.344877, 1, 1, 1, 1, 1,
0.4223664, 0.5260171, 0.1009945, 1, 1, 1, 1, 1,
0.423613, 0.6672737, 0.3296404, 1, 1, 1, 1, 1,
0.4241108, 1.79712, 0.03388323, 1, 1, 1, 1, 1,
0.4283116, 1.166709, -1.310565, 1, 1, 1, 1, 1,
0.4288788, 0.2749782, 1.113442, 1, 1, 1, 1, 1,
0.436172, 1.891813, 0.05210066, 1, 1, 1, 1, 1,
0.4422182, 0.04628621, 1.932743, 1, 1, 1, 1, 1,
0.4426834, 0.8868073, -0.1461356, 1, 1, 1, 1, 1,
0.4451556, 2.557436, -0.5416853, 1, 1, 1, 1, 1,
0.4487703, 0.1316634, 0.2168335, 1, 1, 1, 1, 1,
0.451733, 0.8230139, -1.38583, 1, 1, 1, 1, 1,
0.4601815, 1.936171, 1.020221, 1, 1, 1, 1, 1,
0.4659099, -0.7241632, 2.004305, 1, 1, 1, 1, 1,
0.4660204, -0.5436825, 1.136398, 0, 0, 1, 1, 1,
0.4708895, 0.8523504, 3.069278, 1, 0, 0, 1, 1,
0.4829403, 1.205309, 1.732753, 1, 0, 0, 1, 1,
0.484923, 0.8067071, 1.048803, 1, 0, 0, 1, 1,
0.487288, 0.0594889, 0.5661293, 1, 0, 0, 1, 1,
0.4889936, 1.276344, -1.20488, 1, 0, 0, 1, 1,
0.4892061, -0.892943, 2.14579, 0, 0, 0, 1, 1,
0.4939951, -0.9719008, 1.978758, 0, 0, 0, 1, 1,
0.4940028, -0.6052341, 2.558473, 0, 0, 0, 1, 1,
0.4989946, -0.04498313, 4.402305, 0, 0, 0, 1, 1,
0.5018307, 0.2999582, 0.9246346, 0, 0, 0, 1, 1,
0.5023115, -1.099887, 2.650063, 0, 0, 0, 1, 1,
0.5038901, 0.2943821, 0.8041548, 0, 0, 0, 1, 1,
0.508509, 0.2649697, 1.960987, 1, 1, 1, 1, 1,
0.5132247, -0.4395633, 4.002669, 1, 1, 1, 1, 1,
0.5255988, -0.1154261, 2.6548, 1, 1, 1, 1, 1,
0.5305353, -0.2755114, 2.614996, 1, 1, 1, 1, 1,
0.5334915, 0.5209851, 1.124207, 1, 1, 1, 1, 1,
0.5346111, -1.211314, 3.777704, 1, 1, 1, 1, 1,
0.5366768, 2.314915, 0.3079938, 1, 1, 1, 1, 1,
0.5369117, -1.088136, 2.867218, 1, 1, 1, 1, 1,
0.5383623, -0.4687137, 2.267037, 1, 1, 1, 1, 1,
0.5463325, -0.5591452, 2.373787, 1, 1, 1, 1, 1,
0.5526555, -1.544293, 2.167715, 1, 1, 1, 1, 1,
0.5528469, 0.08145179, 0.1779712, 1, 1, 1, 1, 1,
0.5568663, -0.6665258, 3.059578, 1, 1, 1, 1, 1,
0.5602443, 0.528588, 0.04364131, 1, 1, 1, 1, 1,
0.561273, -1.578183, 4.309902, 1, 1, 1, 1, 1,
0.5626369, 1.006447, 1.454475, 0, 0, 1, 1, 1,
0.5632529, -1.073499, 2.113741, 1, 0, 0, 1, 1,
0.5634915, -0.8563731, 1.775329, 1, 0, 0, 1, 1,
0.5648324, 2.009327, 0.9926047, 1, 0, 0, 1, 1,
0.5670769, 0.05747313, 1.696889, 1, 0, 0, 1, 1,
0.5697381, -0.1065206, 1.255429, 1, 0, 0, 1, 1,
0.5733331, -0.1308686, 2.633357, 0, 0, 0, 1, 1,
0.5764466, 1.092639, 0.8656701, 0, 0, 0, 1, 1,
0.5821293, -0.03171933, 2.934967, 0, 0, 0, 1, 1,
0.5838718, -0.1282608, 0.1218828, 0, 0, 0, 1, 1,
0.5965495, -0.5224206, 3.463885, 0, 0, 0, 1, 1,
0.5969769, -0.3542772, 2.476628, 0, 0, 0, 1, 1,
0.6030029, 0.3317661, 0.8817984, 0, 0, 0, 1, 1,
0.6056124, -0.8672671, 3.121372, 1, 1, 1, 1, 1,
0.6059082, 0.4170374, 0.3576847, 1, 1, 1, 1, 1,
0.6092219, -2.029358, 2.557768, 1, 1, 1, 1, 1,
0.6109389, 0.886911, 0.2384742, 1, 1, 1, 1, 1,
0.6142983, 1.424851, 1.382437, 1, 1, 1, 1, 1,
0.6203107, -0.1867668, 1.821974, 1, 1, 1, 1, 1,
0.6207489, 0.07765259, 1.334488, 1, 1, 1, 1, 1,
0.6237524, -0.1611826, 0.7976926, 1, 1, 1, 1, 1,
0.6241741, 1.050784, 1.781522, 1, 1, 1, 1, 1,
0.6250746, -1.071843, 0.6082566, 1, 1, 1, 1, 1,
0.629373, -0.36338, 2.124868, 1, 1, 1, 1, 1,
0.6298496, -1.502197, 1.162292, 1, 1, 1, 1, 1,
0.6341353, -0.9594178, 2.677697, 1, 1, 1, 1, 1,
0.6386645, -1.671405, 2.797195, 1, 1, 1, 1, 1,
0.6423455, 0.5024409, 0.5652049, 1, 1, 1, 1, 1,
0.6434681, -0.4299783, 2.221632, 0, 0, 1, 1, 1,
0.6460875, 0.6711247, 1.390954, 1, 0, 0, 1, 1,
0.6479358, -0.8932043, 0.6757907, 1, 0, 0, 1, 1,
0.6479746, 0.03745328, 0.4918947, 1, 0, 0, 1, 1,
0.6524564, 0.9183504, -0.1654979, 1, 0, 0, 1, 1,
0.6539553, -0.05090299, 1.579771, 1, 0, 0, 1, 1,
0.6571114, 0.2190834, 1.484373, 0, 0, 0, 1, 1,
0.6572432, 0.247113, 0.8670102, 0, 0, 0, 1, 1,
0.6590729, 0.004266443, 0.4171187, 0, 0, 0, 1, 1,
0.667336, -0.9935175, 3.473798, 0, 0, 0, 1, 1,
0.6708127, -0.8635425, 1.566656, 0, 0, 0, 1, 1,
0.6749737, 1.293806, 0.3600281, 0, 0, 0, 1, 1,
0.6799766, -0.4573748, 2.738345, 0, 0, 0, 1, 1,
0.6823024, 0.2247255, 2.178611, 1, 1, 1, 1, 1,
0.6870458, -0.9174239, 1.408506, 1, 1, 1, 1, 1,
0.6875361, -0.6125988, 2.832839, 1, 1, 1, 1, 1,
0.6882164, 0.1554367, 1.967582, 1, 1, 1, 1, 1,
0.6893819, -0.5296373, 0.5497365, 1, 1, 1, 1, 1,
0.6902513, -0.2840985, 4.047676, 1, 1, 1, 1, 1,
0.6916702, 1.861015, 0.2460955, 1, 1, 1, 1, 1,
0.6957199, 0.6874251, -0.3923388, 1, 1, 1, 1, 1,
0.6980694, 1.81852, 0.7126034, 1, 1, 1, 1, 1,
0.7014384, 1.693047, 0.2735354, 1, 1, 1, 1, 1,
0.7030468, 0.729435, 1.241982, 1, 1, 1, 1, 1,
0.7032323, 0.3252946, 1.665519, 1, 1, 1, 1, 1,
0.7051568, 1.613005, 0.5246443, 1, 1, 1, 1, 1,
0.7054054, 1.181144, 0.8748503, 1, 1, 1, 1, 1,
0.7062674, 0.4721001, -0.9008232, 1, 1, 1, 1, 1,
0.7067888, -1.237187, 2.892884, 0, 0, 1, 1, 1,
0.7091154, -1.335275, 1.950487, 1, 0, 0, 1, 1,
0.7244403, -0.5108044, 3.386044, 1, 0, 0, 1, 1,
0.7331853, 0.4322993, 0.8558064, 1, 0, 0, 1, 1,
0.7343285, 1.622589, 0.9230323, 1, 0, 0, 1, 1,
0.7345191, 1.788137, 1.479115, 1, 0, 0, 1, 1,
0.7348445, 1.34875, -0.05229574, 0, 0, 0, 1, 1,
0.7351068, 0.2696578, 1.77143, 0, 0, 0, 1, 1,
0.7358027, 0.1720448, 2.439671, 0, 0, 0, 1, 1,
0.7399655, -0.6176579, 2.74879, 0, 0, 0, 1, 1,
0.7421223, -0.2471529, 0.974977, 0, 0, 0, 1, 1,
0.7460783, -0.5929005, 1.003699, 0, 0, 0, 1, 1,
0.7461223, 3.043142, -1.182078, 0, 0, 0, 1, 1,
0.747573, 0.5470419, 1.104271, 1, 1, 1, 1, 1,
0.7584049, -0.3687316, 2.731364, 1, 1, 1, 1, 1,
0.7590906, -1.190698, 1.158485, 1, 1, 1, 1, 1,
0.7604636, 0.452284, 1.82831, 1, 1, 1, 1, 1,
0.765053, -0.442846, 2.078645, 1, 1, 1, 1, 1,
0.7655087, -0.9369088, 1.481071, 1, 1, 1, 1, 1,
0.7673995, 0.9787648, 2.183461, 1, 1, 1, 1, 1,
0.7722547, 2.048021, -0.5327113, 1, 1, 1, 1, 1,
0.7740673, -2.160833, 4.432347, 1, 1, 1, 1, 1,
0.7749317, 2.178102, 0.2286333, 1, 1, 1, 1, 1,
0.7784728, -1.858124, 3.002927, 1, 1, 1, 1, 1,
0.7828986, 0.4319976, -1.9724, 1, 1, 1, 1, 1,
0.788914, 1.134572, -0.1836701, 1, 1, 1, 1, 1,
0.8003292, 0.1714495, 1.730579, 1, 1, 1, 1, 1,
0.8025002, -0.04592131, 1.715608, 1, 1, 1, 1, 1,
0.8036972, 0.6443689, 0.8033364, 0, 0, 1, 1, 1,
0.8061375, 0.8019161, -1.354581, 1, 0, 0, 1, 1,
0.8085069, -0.6919166, 2.138936, 1, 0, 0, 1, 1,
0.8108585, -1.190611, 2.065537, 1, 0, 0, 1, 1,
0.8113635, -0.02824859, 2.312072, 1, 0, 0, 1, 1,
0.8152331, -0.5931842, 1.570561, 1, 0, 0, 1, 1,
0.8152356, -0.4125741, 3.036125, 0, 0, 0, 1, 1,
0.8188908, -1.687733, 2.535765, 0, 0, 0, 1, 1,
0.8203413, 1.10498, -0.6006014, 0, 0, 0, 1, 1,
0.8239108, -0.238988, 1.902032, 0, 0, 0, 1, 1,
0.8253866, -0.09193942, 2.450036, 0, 0, 0, 1, 1,
0.8281718, 0.4231356, 1.344602, 0, 0, 0, 1, 1,
0.8325733, 0.5604777, 0.7940339, 0, 0, 0, 1, 1,
0.8385975, 0.4017931, 1.828236, 1, 1, 1, 1, 1,
0.8387631, -0.1770303, 1.394394, 1, 1, 1, 1, 1,
0.8466285, -0.2841437, 2.886382, 1, 1, 1, 1, 1,
0.8468803, -0.427735, 1.919522, 1, 1, 1, 1, 1,
0.8478394, 0.2960774, 2.154819, 1, 1, 1, 1, 1,
0.8499056, 0.06992267, 0.7164012, 1, 1, 1, 1, 1,
0.8564539, 0.3354044, 1.76163, 1, 1, 1, 1, 1,
0.8567286, -0.3858937, 0.6400605, 1, 1, 1, 1, 1,
0.8641121, 1.076535, 0.3524238, 1, 1, 1, 1, 1,
0.8696023, 0.5668668, 1.720335, 1, 1, 1, 1, 1,
0.8696555, 0.5830049, -0.735569, 1, 1, 1, 1, 1,
0.8700779, -0.9715905, 3.728342, 1, 1, 1, 1, 1,
0.8703794, -0.3485956, 1.406808, 1, 1, 1, 1, 1,
0.8704128, 0.5991589, 0.4538954, 1, 1, 1, 1, 1,
0.8712531, -1.07305, 4.344706, 1, 1, 1, 1, 1,
0.8781135, -0.2905696, 2.314749, 0, 0, 1, 1, 1,
0.8796883, 0.7179485, -1.039617, 1, 0, 0, 1, 1,
0.8818084, -0.5850562, 0.7295342, 1, 0, 0, 1, 1,
0.8838627, 0.4366797, 0.7071263, 1, 0, 0, 1, 1,
0.8864952, 0.286682, 2.002528, 1, 0, 0, 1, 1,
0.8895727, -1.604196, 3.01788, 1, 0, 0, 1, 1,
0.890772, -1.466135, 2.751572, 0, 0, 0, 1, 1,
0.8911823, -0.1910337, 2.586895, 0, 0, 0, 1, 1,
0.8948765, -0.7284817, 0.6058125, 0, 0, 0, 1, 1,
0.907496, -0.2078022, 3.016442, 0, 0, 0, 1, 1,
0.9112082, 0.4766172, 2.012952, 0, 0, 0, 1, 1,
0.9135851, -0.01602991, 1.324277, 0, 0, 0, 1, 1,
0.9150566, -1.377199, 2.596349, 0, 0, 0, 1, 1,
0.9156535, 0.3817478, 0.7609363, 1, 1, 1, 1, 1,
0.9160948, -0.6349425, 1.578245, 1, 1, 1, 1, 1,
0.9168645, 0.2036483, 2.712035, 1, 1, 1, 1, 1,
0.9195251, -1.486978, 1.885167, 1, 1, 1, 1, 1,
0.9231969, 1.005368, 0.6717895, 1, 1, 1, 1, 1,
0.9253736, 0.6826383, 1.153937, 1, 1, 1, 1, 1,
0.9257422, 1.027705, -0.5764617, 1, 1, 1, 1, 1,
0.9284076, -1.072057, 1.679787, 1, 1, 1, 1, 1,
0.9301606, -0.1438193, 2.787767, 1, 1, 1, 1, 1,
0.9371221, -0.7653551, 2.316025, 1, 1, 1, 1, 1,
0.9378871, -1.262356, 1.899564, 1, 1, 1, 1, 1,
0.9421651, 1.42646, 0.08748308, 1, 1, 1, 1, 1,
0.9437469, 0.5111257, 1.440681, 1, 1, 1, 1, 1,
0.952792, -1.087622, 1.875757, 1, 1, 1, 1, 1,
0.9566004, 0.4546605, 1.54967, 1, 1, 1, 1, 1,
0.9610239, -1.336527, 1.780937, 0, 0, 1, 1, 1,
0.9695128, -1.06415, 1.547436, 1, 0, 0, 1, 1,
0.9795992, 0.3032689, 0.9984, 1, 0, 0, 1, 1,
0.9814647, 0.2696591, 2.614751, 1, 0, 0, 1, 1,
0.983508, -0.8940236, 2.183783, 1, 0, 0, 1, 1,
1.001015, 0.06365764, 2.585947, 1, 0, 0, 1, 1,
1.008843, -0.6253993, 2.933934, 0, 0, 0, 1, 1,
1.011084, 0.2992276, 1.436595, 0, 0, 0, 1, 1,
1.011747, 1.025959, 0.2022716, 0, 0, 0, 1, 1,
1.012723, 1.147161, 0.9847589, 0, 0, 0, 1, 1,
1.024437, -0.7853904, 3.033951, 0, 0, 0, 1, 1,
1.024488, -0.04842436, 3.33348, 0, 0, 0, 1, 1,
1.027684, 0.4648947, 2.507536, 0, 0, 0, 1, 1,
1.039124, -0.7400872, 1.57882, 1, 1, 1, 1, 1,
1.039729, 2.085651, -0.05419418, 1, 1, 1, 1, 1,
1.041557, 0.7203285, 0.09769309, 1, 1, 1, 1, 1,
1.042072, 0.9270699, 2.307629, 1, 1, 1, 1, 1,
1.054304, -0.8929775, 2.4422, 1, 1, 1, 1, 1,
1.060958, -1.38496, 0.876237, 1, 1, 1, 1, 1,
1.06507, -0.4342762, 1.349541, 1, 1, 1, 1, 1,
1.067703, -0.08104844, 0.9133522, 1, 1, 1, 1, 1,
1.072624, 0.3833717, 0.8501436, 1, 1, 1, 1, 1,
1.073419, 1.28946, 1.445286, 1, 1, 1, 1, 1,
1.074007, -0.7080104, 1.430868, 1, 1, 1, 1, 1,
1.080987, -1.036652, 0.8712735, 1, 1, 1, 1, 1,
1.106169, -0.8427037, 0.3575513, 1, 1, 1, 1, 1,
1.106489, 0.3804002, 0.6030698, 1, 1, 1, 1, 1,
1.107642, 1.189789, 1.241144, 1, 1, 1, 1, 1,
1.109495, -1.732658, 2.241574, 0, 0, 1, 1, 1,
1.11095, 0.3487663, 0.8913245, 1, 0, 0, 1, 1,
1.11545, -1.361416, 2.641898, 1, 0, 0, 1, 1,
1.124814, 0.8294303, 0.1016983, 1, 0, 0, 1, 1,
1.12749, -1.899866, 3.518776, 1, 0, 0, 1, 1,
1.138784, 0.3203038, 1.610323, 1, 0, 0, 1, 1,
1.142781, -0.04996999, 4.052372, 0, 0, 0, 1, 1,
1.147134, -0.3527681, 1.944286, 0, 0, 0, 1, 1,
1.153346, 0.04705778, 1.366855, 0, 0, 0, 1, 1,
1.156804, 0.3511462, 0.7314886, 0, 0, 0, 1, 1,
1.162792, 1.498527, 1.380805, 0, 0, 0, 1, 1,
1.165469, -0.9560806, 1.991987, 0, 0, 0, 1, 1,
1.167068, 0.28513, 1.137152, 0, 0, 0, 1, 1,
1.167879, 0.614972, 0.7759466, 1, 1, 1, 1, 1,
1.170268, 0.5380521, 1.730334, 1, 1, 1, 1, 1,
1.171531, 0.2006952, 1.446718, 1, 1, 1, 1, 1,
1.173164, -1.258117, 3.363751, 1, 1, 1, 1, 1,
1.174136, 1.518928, 1.41835, 1, 1, 1, 1, 1,
1.175127, 1.333841, 0.1174797, 1, 1, 1, 1, 1,
1.180308, -2.03914, 3.751196, 1, 1, 1, 1, 1,
1.183258, 1.152121, -0.2156421, 1, 1, 1, 1, 1,
1.185027, -0.06118849, 2.30359, 1, 1, 1, 1, 1,
1.203175, 0.2493748, 1.697717, 1, 1, 1, 1, 1,
1.203318, 0.1664429, -0.2901371, 1, 1, 1, 1, 1,
1.209561, 0.05373504, 2.502152, 1, 1, 1, 1, 1,
1.219793, 0.1146202, 0.187151, 1, 1, 1, 1, 1,
1.221817, -0.2123971, 2.065665, 1, 1, 1, 1, 1,
1.223883, -0.1018588, 1.728989, 1, 1, 1, 1, 1,
1.226197, -0.7221485, 1.397599, 0, 0, 1, 1, 1,
1.231518, 1.351347, 1.734637, 1, 0, 0, 1, 1,
1.234042, 0.06791503, 1.562501, 1, 0, 0, 1, 1,
1.257658, -0.9119704, 2.467466, 1, 0, 0, 1, 1,
1.259179, -1.043161, 1.259241, 1, 0, 0, 1, 1,
1.26198, -1.086749, 3.38785, 1, 0, 0, 1, 1,
1.271795, 0.2865211, 2.105413, 0, 0, 0, 1, 1,
1.276905, 1.355421, 1.030016, 0, 0, 0, 1, 1,
1.280053, 0.2974195, 1.254146, 0, 0, 0, 1, 1,
1.280793, -0.5981826, 3.606872, 0, 0, 0, 1, 1,
1.293828, 0.5245126, 3.076111, 0, 0, 0, 1, 1,
1.295107, 1.588906, -0.5332017, 0, 0, 0, 1, 1,
1.299648, 0.150791, 2.323087, 0, 0, 0, 1, 1,
1.301457, 0.431123, 2.593037, 1, 1, 1, 1, 1,
1.311783, -1.3711, 1.434468, 1, 1, 1, 1, 1,
1.312196, -0.6052377, 1.911469, 1, 1, 1, 1, 1,
1.312403, -0.3593306, 1.328829, 1, 1, 1, 1, 1,
1.314605, 0.2085294, 2.165101, 1, 1, 1, 1, 1,
1.339337, 0.5350168, 0.7880818, 1, 1, 1, 1, 1,
1.347041, -0.7258063, 3.780422, 1, 1, 1, 1, 1,
1.349523, -0.126707, -0.1753004, 1, 1, 1, 1, 1,
1.359999, 1.289615, 0.5852311, 1, 1, 1, 1, 1,
1.360032, 0.2267409, 1.388226, 1, 1, 1, 1, 1,
1.360584, -0.544986, 1.426037, 1, 1, 1, 1, 1,
1.395582, 1.203388, 0.5763513, 1, 1, 1, 1, 1,
1.40259, 0.9361575, 0.7757947, 1, 1, 1, 1, 1,
1.408824, -1.400019, 1.456167, 1, 1, 1, 1, 1,
1.417553, 0.4033063, 2.688143, 1, 1, 1, 1, 1,
1.422618, -1.352365, 2.396872, 0, 0, 1, 1, 1,
1.429554, -0.1282911, 1.289627, 1, 0, 0, 1, 1,
1.442489, -0.7013991, 3.313014, 1, 0, 0, 1, 1,
1.444521, -0.4266143, 1.338116, 1, 0, 0, 1, 1,
1.463469, -2.034792, 2.919143, 1, 0, 0, 1, 1,
1.46504, -0.2339294, 2.664716, 1, 0, 0, 1, 1,
1.486376, -0.02864625, 1.440625, 0, 0, 0, 1, 1,
1.487587, 0.6987157, 1.281338, 0, 0, 0, 1, 1,
1.491468, -0.1237563, 2.258088, 0, 0, 0, 1, 1,
1.499855, -0.5737488, 1.333215, 0, 0, 0, 1, 1,
1.501527, 0.3489055, 1.285729, 0, 0, 0, 1, 1,
1.506114, 1.004424, 1.199094, 0, 0, 0, 1, 1,
1.525492, -0.8754931, 2.623335, 0, 0, 0, 1, 1,
1.538324, -1.852147, 3.011836, 1, 1, 1, 1, 1,
1.558288, -0.4839499, 2.640381, 1, 1, 1, 1, 1,
1.576038, 0.8627362, 0.4475171, 1, 1, 1, 1, 1,
1.580224, 0.6279256, 0.8131509, 1, 1, 1, 1, 1,
1.581139, -1.242376, 2.060927, 1, 1, 1, 1, 1,
1.586951, -1.131968, 2.077025, 1, 1, 1, 1, 1,
1.613439, -0.4699321, 2.04909, 1, 1, 1, 1, 1,
1.624744, 0.7476023, 0.4932357, 1, 1, 1, 1, 1,
1.62701, -0.04529463, 3.117892, 1, 1, 1, 1, 1,
1.63224, -0.3600875, 2.139012, 1, 1, 1, 1, 1,
1.633478, 0.8519055, 1.817048, 1, 1, 1, 1, 1,
1.634017, -0.9222537, 3.051898, 1, 1, 1, 1, 1,
1.639844, -0.4404022, 1.749477, 1, 1, 1, 1, 1,
1.640951, 1.68835, 0.2632, 1, 1, 1, 1, 1,
1.646233, 0.3605827, 1.63952, 1, 1, 1, 1, 1,
1.646716, -0.7486044, 1.027124, 0, 0, 1, 1, 1,
1.648768, -0.1866935, 0.9568869, 1, 0, 0, 1, 1,
1.650375, -1.184431, 1.686627, 1, 0, 0, 1, 1,
1.657757, 1.852502, -1.792582, 1, 0, 0, 1, 1,
1.660552, 1.415718, 0.8116483, 1, 0, 0, 1, 1,
1.66237, -0.6981654, -0.1336766, 1, 0, 0, 1, 1,
1.669938, 1.071423, -0.376016, 0, 0, 0, 1, 1,
1.672037, -0.1218511, -0.2368906, 0, 0, 0, 1, 1,
1.674201, 0.9661075, 1.337711, 0, 0, 0, 1, 1,
1.711352, -0.1473432, 2.608522, 0, 0, 0, 1, 1,
1.725832, 0.708784, 0.4265265, 0, 0, 0, 1, 1,
1.729835, -1.110056, 2.733977, 0, 0, 0, 1, 1,
1.75195, 0.2467281, 2.52055, 0, 0, 0, 1, 1,
1.763117, -0.4394753, 1.94579, 1, 1, 1, 1, 1,
1.770265, -0.05411428, 2.745862, 1, 1, 1, 1, 1,
1.792119, -0.2774028, 1.316093, 1, 1, 1, 1, 1,
1.798224, 1.530219, 1.117238, 1, 1, 1, 1, 1,
1.803893, -0.6738015, 1.794826, 1, 1, 1, 1, 1,
1.804044, -0.8292356, 1.000826, 1, 1, 1, 1, 1,
1.820375, -1.915779, 2.226295, 1, 1, 1, 1, 1,
1.821981, -1.148059, 1.085539, 1, 1, 1, 1, 1,
1.82752, -0.1043068, 2.602487, 1, 1, 1, 1, 1,
1.835237, 2.164637, 0.1934779, 1, 1, 1, 1, 1,
1.850824, -0.3822567, 1.991709, 1, 1, 1, 1, 1,
1.852607, 0.3540175, 2.360624, 1, 1, 1, 1, 1,
1.856848, -1.40733, 3.505535, 1, 1, 1, 1, 1,
1.873062, -0.1332297, 1.505998, 1, 1, 1, 1, 1,
1.881046, 0.4238063, 2.540534, 1, 1, 1, 1, 1,
1.898753, -0.4496638, 1.47018, 0, 0, 1, 1, 1,
1.973575, -1.364741, 2.053839, 1, 0, 0, 1, 1,
1.987707, 1.724191, 0.5690942, 1, 0, 0, 1, 1,
2.010598, 0.2105965, -0.5466557, 1, 0, 0, 1, 1,
2.039863, 1.052959, 1.674911, 1, 0, 0, 1, 1,
2.131365, -0.3185218, 1.162829, 1, 0, 0, 1, 1,
2.207494, 1.213459, 0.897944, 0, 0, 0, 1, 1,
2.296534, 0.1382106, 2.680913, 0, 0, 0, 1, 1,
2.321784, 1.952415, 1.373256, 0, 0, 0, 1, 1,
2.374147, 0.2351328, 0.7701614, 0, 0, 0, 1, 1,
2.378933, -1.408363, 2.879604, 0, 0, 0, 1, 1,
2.42208, 2.057464, 2.306452, 0, 0, 0, 1, 1,
2.483992, -0.4463002, 1.334769, 0, 0, 0, 1, 1,
2.513225, -0.8961086, 2.756154, 1, 1, 1, 1, 1,
2.617893, -1.182065, 4.842001, 1, 1, 1, 1, 1,
2.644414, 0.8712771, 1.043175, 1, 1, 1, 1, 1,
2.712255, 0.6492918, 1.814016, 1, 1, 1, 1, 1,
2.729413, -0.369583, 0.1655635, 1, 1, 1, 1, 1,
2.950195, 0.2805194, 1.335147, 1, 1, 1, 1, 1,
3.774328, -0.1545717, -0.7177538, 1, 1, 1, 1, 1
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
var radius = 9.629473;
var distance = 33.82311;
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
mvMatrix.translate( -0.3786993, 0.4396567, 0.2585437 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.82311);
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
