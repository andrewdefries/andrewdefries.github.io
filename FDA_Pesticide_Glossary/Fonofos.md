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
-3.567634, -0.1547976, -1.947079, 1, 0, 0, 1,
-3.258783, 0.810662, -0.6583019, 1, 0.007843138, 0, 1,
-2.819757, 0.4377562, -2.141659, 1, 0.01176471, 0, 1,
-2.810034, -0.07976418, -4.075846, 1, 0.01960784, 0, 1,
-2.571538, 1.602325, 0.589008, 1, 0.02352941, 0, 1,
-2.569027, 1.461993, -1.086245, 1, 0.03137255, 0, 1,
-2.546612, -1.490587, -2.335763, 1, 0.03529412, 0, 1,
-2.501378, 0.1581602, -1.329187, 1, 0.04313726, 0, 1,
-2.430107, 1.759471, -1.09199, 1, 0.04705882, 0, 1,
-2.427657, 0.8567033, -1.936401, 1, 0.05490196, 0, 1,
-2.39557, -1.447737, -2.410298, 1, 0.05882353, 0, 1,
-2.351439, -0.04858053, -1.999943, 1, 0.06666667, 0, 1,
-2.294142, 1.450075, -1.738002, 1, 0.07058824, 0, 1,
-2.290796, 0.1027928, -3.300081, 1, 0.07843138, 0, 1,
-2.275974, -0.7897773, -2.293822, 1, 0.08235294, 0, 1,
-2.270883, 0.07338357, -1.977515, 1, 0.09019608, 0, 1,
-2.202308, -0.7624358, -3.809491, 1, 0.09411765, 0, 1,
-2.16921, -0.5799142, -3.377305, 1, 0.1019608, 0, 1,
-2.154788, 0.7719566, -0.599551, 1, 0.1098039, 0, 1,
-2.14504, 0.4062172, -0.4392341, 1, 0.1137255, 0, 1,
-2.141171, -1.889622, -3.552249, 1, 0.1215686, 0, 1,
-2.077202, -1.098876, -1.422182, 1, 0.1254902, 0, 1,
-2.027494, -0.6701245, -1.753594, 1, 0.1333333, 0, 1,
-2.021418, -1.283934, -2.963303, 1, 0.1372549, 0, 1,
-2.012132, 1.032167, -1.333982, 1, 0.145098, 0, 1,
-2.00032, -0.06027828, -1.402636, 1, 0.1490196, 0, 1,
-1.974486, -0.545764, -0.401995, 1, 0.1568628, 0, 1,
-1.9622, -1.046112, -2.353117, 1, 0.1607843, 0, 1,
-1.944429, -0.4239243, -1.503862, 1, 0.1686275, 0, 1,
-1.925043, 2.304105, -1.278476, 1, 0.172549, 0, 1,
-1.905169, -0.6097299, -2.611621, 1, 0.1803922, 0, 1,
-1.895184, 2.336128, -1.757894, 1, 0.1843137, 0, 1,
-1.895096, -0.09252798, -2.346278, 1, 0.1921569, 0, 1,
-1.8915, 0.7011495, -2.838052, 1, 0.1960784, 0, 1,
-1.882815, -0.01877952, -2.078738, 1, 0.2039216, 0, 1,
-1.880349, 0.41754, -0.5330741, 1, 0.2117647, 0, 1,
-1.877323, 0.3159526, -1.176996, 1, 0.2156863, 0, 1,
-1.860515, 0.2839407, -2.048899, 1, 0.2235294, 0, 1,
-1.842514, 0.7962119, -1.5214, 1, 0.227451, 0, 1,
-1.827062, -0.6605497, -2.523408, 1, 0.2352941, 0, 1,
-1.826693, 1.109213, 0.3194678, 1, 0.2392157, 0, 1,
-1.807225, 0.3429502, -0.7394631, 1, 0.2470588, 0, 1,
-1.779927, 0.2897842, -0.488272, 1, 0.2509804, 0, 1,
-1.768972, -1.25849, -3.535131, 1, 0.2588235, 0, 1,
-1.757025, -0.1000106, -1.716405, 1, 0.2627451, 0, 1,
-1.753626, 0.9148539, -0.4906383, 1, 0.2705882, 0, 1,
-1.749105, 0.07868899, -0.6318278, 1, 0.2745098, 0, 1,
-1.737365, -0.6975026, -3.485234, 1, 0.282353, 0, 1,
-1.710962, -0.8498729, -2.529144, 1, 0.2862745, 0, 1,
-1.710859, -0.4937898, -1.734525, 1, 0.2941177, 0, 1,
-1.699194, -0.2504707, -2.309298, 1, 0.3019608, 0, 1,
-1.690181, 0.4852036, -0.5145551, 1, 0.3058824, 0, 1,
-1.673965, -0.3383316, -1.171614, 1, 0.3137255, 0, 1,
-1.665843, 0.08137666, -0.0789083, 1, 0.3176471, 0, 1,
-1.662033, -0.3983454, -2.225338, 1, 0.3254902, 0, 1,
-1.659347, 1.121731, -0.135378, 1, 0.3294118, 0, 1,
-1.655371, -0.9404497, -3.585415, 1, 0.3372549, 0, 1,
-1.654426, 1.151823, -1.68117, 1, 0.3411765, 0, 1,
-1.653693, 0.2987459, -0.8396079, 1, 0.3490196, 0, 1,
-1.622581, -1.678313, -3.34147, 1, 0.3529412, 0, 1,
-1.619321, -1.893834, -2.645157, 1, 0.3607843, 0, 1,
-1.617744, 0.04734853, -1.405916, 1, 0.3647059, 0, 1,
-1.588481, -2.002778, -2.823699, 1, 0.372549, 0, 1,
-1.583528, 0.550603, -1.23382, 1, 0.3764706, 0, 1,
-1.573447, 0.01424617, -2.52441, 1, 0.3843137, 0, 1,
-1.572698, 0.853426, -0.8048971, 1, 0.3882353, 0, 1,
-1.567111, 0.449065, -1.154103, 1, 0.3960784, 0, 1,
-1.56338, 0.85664, -0.3810434, 1, 0.4039216, 0, 1,
-1.563373, -0.1322809, -1.855885, 1, 0.4078431, 0, 1,
-1.561749, -0.9121138, -0.8029816, 1, 0.4156863, 0, 1,
-1.553339, -0.7718052, -2.86223, 1, 0.4196078, 0, 1,
-1.55043, 1.535214, -1.9089, 1, 0.427451, 0, 1,
-1.545276, 0.707956, 0.008179894, 1, 0.4313726, 0, 1,
-1.532303, -0.7815301, -1.847754, 1, 0.4392157, 0, 1,
-1.527979, 0.1982138, -1.889666, 1, 0.4431373, 0, 1,
-1.506393, 0.3532529, -2.921479, 1, 0.4509804, 0, 1,
-1.484514, -0.611322, -3.765915, 1, 0.454902, 0, 1,
-1.457913, 0.8488452, -2.336269, 1, 0.4627451, 0, 1,
-1.45601, -0.635676, -2.644259, 1, 0.4666667, 0, 1,
-1.454972, 0.2027912, -3.321659, 1, 0.4745098, 0, 1,
-1.441633, -0.8270239, -3.28179, 1, 0.4784314, 0, 1,
-1.434895, -1.02152, -2.30478, 1, 0.4862745, 0, 1,
-1.417652, -0.6210099, -2.223625, 1, 0.4901961, 0, 1,
-1.416671, -0.3964035, -1.732018, 1, 0.4980392, 0, 1,
-1.401852, -0.8900276, -1.50702, 1, 0.5058824, 0, 1,
-1.39892, 0.04861215, -2.396614, 1, 0.509804, 0, 1,
-1.394501, 0.3850539, -2.697566, 1, 0.5176471, 0, 1,
-1.388906, -1.206867, -2.3892, 1, 0.5215687, 0, 1,
-1.377551, 0.2577179, -1.712048, 1, 0.5294118, 0, 1,
-1.374551, 0.7170557, -0.6795078, 1, 0.5333334, 0, 1,
-1.373234, -1.093722, -2.76399, 1, 0.5411765, 0, 1,
-1.371688, 2.660258, 0.4516042, 1, 0.5450981, 0, 1,
-1.371454, -0.367829, -2.502963, 1, 0.5529412, 0, 1,
-1.365493, 1.235379, -2.235807, 1, 0.5568628, 0, 1,
-1.359759, -0.7770152, -1.994668, 1, 0.5647059, 0, 1,
-1.357406, 1.491554, 0.7050356, 1, 0.5686275, 0, 1,
-1.355763, -1.426478, -3.960552, 1, 0.5764706, 0, 1,
-1.341834, -1.22141, -2.886569, 1, 0.5803922, 0, 1,
-1.333881, 0.8240327, -1.241965, 1, 0.5882353, 0, 1,
-1.331341, -1.282124, -3.564838, 1, 0.5921569, 0, 1,
-1.326559, 0.2034376, -0.5316919, 1, 0.6, 0, 1,
-1.325572, -0.2634275, -4.377244, 1, 0.6078432, 0, 1,
-1.325366, 0.4286662, -2.280181, 1, 0.6117647, 0, 1,
-1.324266, 0.5072005, -1.357197, 1, 0.6196079, 0, 1,
-1.319974, 0.977802, 0.9870493, 1, 0.6235294, 0, 1,
-1.309789, 0.3894776, -2.021341, 1, 0.6313726, 0, 1,
-1.309303, 2.988649, -0.1889474, 1, 0.6352941, 0, 1,
-1.30682, 0.748064, -0.179194, 1, 0.6431373, 0, 1,
-1.294404, 0.4613615, -0.4397236, 1, 0.6470588, 0, 1,
-1.291205, -0.8630478, -2.678536, 1, 0.654902, 0, 1,
-1.29088, 1.776339, -0.6048179, 1, 0.6588235, 0, 1,
-1.288978, 0.07474739, -2.24947, 1, 0.6666667, 0, 1,
-1.280857, -0.8103625, -1.281426, 1, 0.6705883, 0, 1,
-1.276264, 0.5651659, -0.9428481, 1, 0.6784314, 0, 1,
-1.269939, -0.5501739, -1.145344, 1, 0.682353, 0, 1,
-1.269703, 0.5324766, -2.226625, 1, 0.6901961, 0, 1,
-1.268911, -0.9959263, -3.154293, 1, 0.6941177, 0, 1,
-1.256348, -0.7221853, -1.650413, 1, 0.7019608, 0, 1,
-1.253923, -0.3560097, -3.415213, 1, 0.7098039, 0, 1,
-1.253857, 0.4581617, -1.018438, 1, 0.7137255, 0, 1,
-1.251621, -0.2960875, -1.372319, 1, 0.7215686, 0, 1,
-1.246935, 0.2567479, -1.489087, 1, 0.7254902, 0, 1,
-1.24461, 1.302286, 0.8776391, 1, 0.7333333, 0, 1,
-1.232448, 0.3281601, -0.4612942, 1, 0.7372549, 0, 1,
-1.231113, -0.7916479, -2.067685, 1, 0.7450981, 0, 1,
-1.222548, -1.11391, -0.2152343, 1, 0.7490196, 0, 1,
-1.202827, 0.7939151, 0.4100431, 1, 0.7568628, 0, 1,
-1.19459, -0.5441817, -1.953751, 1, 0.7607843, 0, 1,
-1.192483, 1.418478, -0.1023121, 1, 0.7686275, 0, 1,
-1.191886, -0.7465057, -3.354018, 1, 0.772549, 0, 1,
-1.189547, 0.5060306, -1.509819, 1, 0.7803922, 0, 1,
-1.183092, 2.08938, -0.1989401, 1, 0.7843137, 0, 1,
-1.171546, 1.074427, 0.02526855, 1, 0.7921569, 0, 1,
-1.169301, 0.0304793, -2.263484, 1, 0.7960784, 0, 1,
-1.168904, -0.3440579, -2.815558, 1, 0.8039216, 0, 1,
-1.14824, -0.03464134, -3.094116, 1, 0.8117647, 0, 1,
-1.134791, -1.893487, -1.658501, 1, 0.8156863, 0, 1,
-1.131866, 1.623612, -0.7593281, 1, 0.8235294, 0, 1,
-1.120029, -0.3105907, 0.8558146, 1, 0.827451, 0, 1,
-1.092242, 0.1643883, -2.850925, 1, 0.8352941, 0, 1,
-1.082305, 0.7450224, 0.2563845, 1, 0.8392157, 0, 1,
-1.070151, -0.8953515, -1.556804, 1, 0.8470588, 0, 1,
-1.067678, -0.1324404, -0.1979749, 1, 0.8509804, 0, 1,
-1.057184, 0.9818193, -1.589955, 1, 0.8588235, 0, 1,
-1.052119, 0.2094216, -3.255522, 1, 0.8627451, 0, 1,
-1.051534, 0.7968797, -1.061795, 1, 0.8705882, 0, 1,
-1.047666, 0.3052074, -1.148301, 1, 0.8745098, 0, 1,
-1.0372, 0.7008668, -1.681312, 1, 0.8823529, 0, 1,
-1.03673, -1.507945, -2.295134, 1, 0.8862745, 0, 1,
-1.036258, 1.001951, -1.801103, 1, 0.8941177, 0, 1,
-1.024228, -0.3579805, -1.365784, 1, 0.8980392, 0, 1,
-1.024158, -0.7059404, -2.996081, 1, 0.9058824, 0, 1,
-1.023908, -0.396334, -1.551644, 1, 0.9137255, 0, 1,
-0.9974231, -1.901718, -1.761475, 1, 0.9176471, 0, 1,
-0.9961231, 0.2877888, -0.06971699, 1, 0.9254902, 0, 1,
-0.9909192, -0.4049721, -1.471351, 1, 0.9294118, 0, 1,
-0.989278, -0.994797, -2.822261, 1, 0.9372549, 0, 1,
-0.981951, 1.410219, -0.97592, 1, 0.9411765, 0, 1,
-0.9686922, -0.8460707, -2.122673, 1, 0.9490196, 0, 1,
-0.9681005, 0.3842802, -2.373363, 1, 0.9529412, 0, 1,
-0.9650957, -1.518723, -3.778589, 1, 0.9607843, 0, 1,
-0.9640778, -0.6657609, -3.691654, 1, 0.9647059, 0, 1,
-0.9636763, -0.6475721, -1.255857, 1, 0.972549, 0, 1,
-0.9556019, -1.631088, -2.859648, 1, 0.9764706, 0, 1,
-0.954257, -0.6155155, -1.143269, 1, 0.9843137, 0, 1,
-0.9493448, -1.145896, -1.066697, 1, 0.9882353, 0, 1,
-0.9474303, -1.808433, -3.506504, 1, 0.9960784, 0, 1,
-0.9429545, -1.313326, -2.650874, 0.9960784, 1, 0, 1,
-0.9418662, 1.116547, 0.3282624, 0.9921569, 1, 0, 1,
-0.9380818, -1.712836, -4.320168, 0.9843137, 1, 0, 1,
-0.9379455, -1.317651, -3.582092, 0.9803922, 1, 0, 1,
-0.937368, 0.1490358, -1.118184, 0.972549, 1, 0, 1,
-0.9342334, -0.1960323, -1.501854, 0.9686275, 1, 0, 1,
-0.9300505, 1.096413, -1.094716, 0.9607843, 1, 0, 1,
-0.9254199, 0.0084446, -2.928414, 0.9568627, 1, 0, 1,
-0.9244372, -2.136127, -2.501477, 0.9490196, 1, 0, 1,
-0.9231523, -1.867071, -3.161678, 0.945098, 1, 0, 1,
-0.9227539, 0.2056181, -2.054439, 0.9372549, 1, 0, 1,
-0.9211761, 0.2214039, -1.882059, 0.9333333, 1, 0, 1,
-0.9197379, 0.3240126, -0.3852246, 0.9254902, 1, 0, 1,
-0.9190885, -1.539523, -3.561381, 0.9215686, 1, 0, 1,
-0.912465, -0.6231717, -1.174671, 0.9137255, 1, 0, 1,
-0.9000223, -0.7224316, -0.4962358, 0.9098039, 1, 0, 1,
-0.8946412, 1.389945, -0.3606619, 0.9019608, 1, 0, 1,
-0.892279, 0.7820482, -1.531916, 0.8941177, 1, 0, 1,
-0.8871325, -0.3833644, -1.225008, 0.8901961, 1, 0, 1,
-0.8853635, -0.2628553, -2.818083, 0.8823529, 1, 0, 1,
-0.8846415, -0.4001302, -2.171765, 0.8784314, 1, 0, 1,
-0.8843204, 0.02346576, -1.073756, 0.8705882, 1, 0, 1,
-0.8803418, -1.259825, -3.232043, 0.8666667, 1, 0, 1,
-0.8800831, -0.5247113, -1.193088, 0.8588235, 1, 0, 1,
-0.8798963, 1.142675, -0.4058082, 0.854902, 1, 0, 1,
-0.8796729, 0.1883313, -2.025207, 0.8470588, 1, 0, 1,
-0.8753924, -0.3140318, -1.822917, 0.8431373, 1, 0, 1,
-0.8715615, -0.6056769, -2.658375, 0.8352941, 1, 0, 1,
-0.8650991, 0.06513693, -2.701396, 0.8313726, 1, 0, 1,
-0.8635533, 0.7098389, 0.5144367, 0.8235294, 1, 0, 1,
-0.862433, -0.1958863, -1.180946, 0.8196079, 1, 0, 1,
-0.8616632, 0.1351359, -1.810542, 0.8117647, 1, 0, 1,
-0.8603091, 2.111158, -0.4943423, 0.8078431, 1, 0, 1,
-0.859205, -0.6118888, -3.356688, 0.8, 1, 0, 1,
-0.8512297, 0.2705653, 0.5238389, 0.7921569, 1, 0, 1,
-0.8504574, 1.090446, 0.5601794, 0.7882353, 1, 0, 1,
-0.8474318, -0.3335111, -0.0510762, 0.7803922, 1, 0, 1,
-0.846982, 1.326629, 0.1508582, 0.7764706, 1, 0, 1,
-0.8433678, -1.140993, -3.451669, 0.7686275, 1, 0, 1,
-0.8405456, -1.440967, -1.779819, 0.7647059, 1, 0, 1,
-0.8331062, -1.09648, -2.793232, 0.7568628, 1, 0, 1,
-0.8315142, 0.9088895, -0.581535, 0.7529412, 1, 0, 1,
-0.8275965, 1.383966, 1.363026, 0.7450981, 1, 0, 1,
-0.8268548, 0.0179238, -2.844672, 0.7411765, 1, 0, 1,
-0.8228604, -1.43382, -1.159113, 0.7333333, 1, 0, 1,
-0.8201197, 0.8811025, -1.185576, 0.7294118, 1, 0, 1,
-0.8159426, -2.468214, -2.570333, 0.7215686, 1, 0, 1,
-0.8100684, 0.7967948, -2.854182, 0.7176471, 1, 0, 1,
-0.8083135, -0.5903678, 1.084153, 0.7098039, 1, 0, 1,
-0.8080975, -0.1759463, -2.275742, 0.7058824, 1, 0, 1,
-0.8075668, 0.5730885, -0.5386027, 0.6980392, 1, 0, 1,
-0.800707, 0.5816786, 0.03533427, 0.6901961, 1, 0, 1,
-0.7983153, 1.115211, -1.137048, 0.6862745, 1, 0, 1,
-0.7969488, -0.7103977, -1.784288, 0.6784314, 1, 0, 1,
-0.7942027, 1.475585, -0.7580624, 0.6745098, 1, 0, 1,
-0.7939307, 1.038186, -1.078165, 0.6666667, 1, 0, 1,
-0.7864389, -1.683183, -3.474459, 0.6627451, 1, 0, 1,
-0.7829696, 0.5701482, -1.899807, 0.654902, 1, 0, 1,
-0.782949, 1.474006, -0.649117, 0.6509804, 1, 0, 1,
-0.7803097, 1.792443, -1.148286, 0.6431373, 1, 0, 1,
-0.7793612, 1.143131, 0.3803274, 0.6392157, 1, 0, 1,
-0.7782571, 0.457817, -1.777816, 0.6313726, 1, 0, 1,
-0.7779394, 0.1240872, -0.8186576, 0.627451, 1, 0, 1,
-0.769372, -1.638884, -3.556575, 0.6196079, 1, 0, 1,
-0.7689928, 0.6952332, 1.139773, 0.6156863, 1, 0, 1,
-0.7671975, -0.4148532, -2.045458, 0.6078432, 1, 0, 1,
-0.7648189, 0.1016414, -1.235766, 0.6039216, 1, 0, 1,
-0.7647701, -0.07484131, -1.862569, 0.5960785, 1, 0, 1,
-0.7631254, 1.717544, -1.659822, 0.5882353, 1, 0, 1,
-0.7630597, 0.4053141, -2.50255, 0.5843138, 1, 0, 1,
-0.7625999, -0.01910618, -0.5107901, 0.5764706, 1, 0, 1,
-0.7558836, 0.9835526, -1.678868, 0.572549, 1, 0, 1,
-0.7528334, -0.8406667, -3.4149, 0.5647059, 1, 0, 1,
-0.7523559, 1.670013, 0.05956406, 0.5607843, 1, 0, 1,
-0.7516228, -1.565189, -4.884992, 0.5529412, 1, 0, 1,
-0.7504873, -1.234856, -3.068062, 0.5490196, 1, 0, 1,
-0.7484557, -1.533838, -3.086504, 0.5411765, 1, 0, 1,
-0.7406092, -0.4485356, -2.017133, 0.5372549, 1, 0, 1,
-0.740229, 2.34103, -1.705871, 0.5294118, 1, 0, 1,
-0.737938, -1.221317, -2.093068, 0.5254902, 1, 0, 1,
-0.7370749, -0.8258103, -2.787175, 0.5176471, 1, 0, 1,
-0.7356752, 0.4441074, -0.5228718, 0.5137255, 1, 0, 1,
-0.7339009, -1.236291, -2.47184, 0.5058824, 1, 0, 1,
-0.7325512, 0.8544317, 0.9319889, 0.5019608, 1, 0, 1,
-0.7202326, -0.5675498, -1.870771, 0.4941176, 1, 0, 1,
-0.7201543, -0.4589636, -1.762125, 0.4862745, 1, 0, 1,
-0.720115, 0.3685677, -1.178227, 0.4823529, 1, 0, 1,
-0.7163163, -2.02556, -3.743895, 0.4745098, 1, 0, 1,
-0.7159372, 1.573011, -1.288945, 0.4705882, 1, 0, 1,
-0.7145991, -0.1075936, -1.993736, 0.4627451, 1, 0, 1,
-0.709292, -0.5746197, -3.306943, 0.4588235, 1, 0, 1,
-0.7043201, -1.10274, -3.946557, 0.4509804, 1, 0, 1,
-0.698995, -1.7123, -2.495682, 0.4470588, 1, 0, 1,
-0.6968575, -0.9870833, -4.734687, 0.4392157, 1, 0, 1,
-0.6925144, 0.279478, -2.355428, 0.4352941, 1, 0, 1,
-0.6922731, 1.265803, -1.367929, 0.427451, 1, 0, 1,
-0.690006, 0.02626404, -1.450723, 0.4235294, 1, 0, 1,
-0.689945, 0.3435509, -1.253363, 0.4156863, 1, 0, 1,
-0.686696, 0.9451951, -0.7056541, 0.4117647, 1, 0, 1,
-0.6865727, 1.460513, -0.2461083, 0.4039216, 1, 0, 1,
-0.6676235, 3.019367, 1.258484, 0.3960784, 1, 0, 1,
-0.6607392, -1.182239, -0.8015422, 0.3921569, 1, 0, 1,
-0.6598106, -0.2819492, -3.01862, 0.3843137, 1, 0, 1,
-0.6592216, -1.7284, -1.731105, 0.3803922, 1, 0, 1,
-0.6526949, 0.8074828, -0.5229014, 0.372549, 1, 0, 1,
-0.652247, -0.005437254, -2.043472, 0.3686275, 1, 0, 1,
-0.6511583, 0.2657131, 0.5074292, 0.3607843, 1, 0, 1,
-0.6457747, 1.467552, -1.007148, 0.3568628, 1, 0, 1,
-0.6379807, -0.003517624, -2.55731, 0.3490196, 1, 0, 1,
-0.6369684, -0.2183183, -1.142078, 0.345098, 1, 0, 1,
-0.6329113, 2.417205, 0.3374269, 0.3372549, 1, 0, 1,
-0.6327248, 0.8974852, -0.8637826, 0.3333333, 1, 0, 1,
-0.6278985, -1.250113, -5.2959, 0.3254902, 1, 0, 1,
-0.6251972, -0.7332223, -1.391973, 0.3215686, 1, 0, 1,
-0.6237043, 0.04574974, -2.404163, 0.3137255, 1, 0, 1,
-0.6215056, 0.9180316, 0.4774664, 0.3098039, 1, 0, 1,
-0.6161422, 1.221594, -0.09270566, 0.3019608, 1, 0, 1,
-0.614079, -0.9034172, -2.403679, 0.2941177, 1, 0, 1,
-0.6138067, 1.00145, -1.527461, 0.2901961, 1, 0, 1,
-0.6135379, -0.289922, -2.074952, 0.282353, 1, 0, 1,
-0.6117316, -0.8404625, -2.025797, 0.2784314, 1, 0, 1,
-0.6114928, -1.980633, -3.046555, 0.2705882, 1, 0, 1,
-0.6082429, 1.058825, 1.063353, 0.2666667, 1, 0, 1,
-0.6062447, -0.1244411, -2.068997, 0.2588235, 1, 0, 1,
-0.604916, 0.2335431, -0.6285841, 0.254902, 1, 0, 1,
-0.5993972, -0.760875, -2.057194, 0.2470588, 1, 0, 1,
-0.5991357, 0.5432398, -1.162612, 0.2431373, 1, 0, 1,
-0.5964868, 0.1290708, -0.9722199, 0.2352941, 1, 0, 1,
-0.5943735, -0.0117859, -2.283968, 0.2313726, 1, 0, 1,
-0.5939966, -0.4555891, -1.872517, 0.2235294, 1, 0, 1,
-0.5916757, -0.205231, -1.309867, 0.2196078, 1, 0, 1,
-0.5911182, 0.04225986, -1.451673, 0.2117647, 1, 0, 1,
-0.5841894, -1.37415, -2.870803, 0.2078431, 1, 0, 1,
-0.5826085, 1.916576, 1.184629, 0.2, 1, 0, 1,
-0.581905, -1.049317, -3.866862, 0.1921569, 1, 0, 1,
-0.5809305, -1.070273, -2.695475, 0.1882353, 1, 0, 1,
-0.5804731, 0.8634059, -1.586813, 0.1803922, 1, 0, 1,
-0.5803428, 0.5852497, -1.466874, 0.1764706, 1, 0, 1,
-0.5734589, -2.891173, -2.447075, 0.1686275, 1, 0, 1,
-0.5707488, 0.893853, -2.506357, 0.1647059, 1, 0, 1,
-0.5672995, 1.465173, 0.04233201, 0.1568628, 1, 0, 1,
-0.5633352, -1.28343, -1.099574, 0.1529412, 1, 0, 1,
-0.5631446, 1.288006, -0.4269532, 0.145098, 1, 0, 1,
-0.5615256, 0.1657128, -2.12508, 0.1411765, 1, 0, 1,
-0.5608872, 0.08210117, -2.841316, 0.1333333, 1, 0, 1,
-0.5569823, -1.23067, -2.1829, 0.1294118, 1, 0, 1,
-0.5565663, 0.1341342, -1.537618, 0.1215686, 1, 0, 1,
-0.5545268, 0.4609997, -2.092854, 0.1176471, 1, 0, 1,
-0.5518927, -0.1896224, -1.561078, 0.1098039, 1, 0, 1,
-0.550555, -0.4760377, 0.05830491, 0.1058824, 1, 0, 1,
-0.5502663, 0.1912302, -3.220373, 0.09803922, 1, 0, 1,
-0.5440275, -1.835344, -4.234172, 0.09019608, 1, 0, 1,
-0.5390506, -0.3055154, -3.240512, 0.08627451, 1, 0, 1,
-0.5354865, -0.3703163, -2.007001, 0.07843138, 1, 0, 1,
-0.5304793, -0.4402981, -2.661169, 0.07450981, 1, 0, 1,
-0.5287827, 0.4184344, -0.7505534, 0.06666667, 1, 0, 1,
-0.5284083, 0.8270904, -2.092731, 0.0627451, 1, 0, 1,
-0.52639, -1.267946, -2.194192, 0.05490196, 1, 0, 1,
-0.5207545, 1.299449, 0.5383521, 0.05098039, 1, 0, 1,
-0.5159145, 0.7105842, -0.3250686, 0.04313726, 1, 0, 1,
-0.5158548, 0.6071171, -0.3282996, 0.03921569, 1, 0, 1,
-0.5152756, 1.814723, 0.193247, 0.03137255, 1, 0, 1,
-0.5133706, -0.9613515, -2.665078, 0.02745098, 1, 0, 1,
-0.5118959, 1.122428, 0.06508223, 0.01960784, 1, 0, 1,
-0.5112771, -1.321315, -3.969411, 0.01568628, 1, 0, 1,
-0.5014961, 1.29454, 0.9138764, 0.007843138, 1, 0, 1,
-0.5009868, -1.924539, -3.98403, 0.003921569, 1, 0, 1,
-0.4999711, 0.5733017, -1.265292, 0, 1, 0.003921569, 1,
-0.4918065, 1.144549, -1.180545, 0, 1, 0.01176471, 1,
-0.4871562, 1.112123, -1.660223, 0, 1, 0.01568628, 1,
-0.4765366, 0.688137, -0.04018435, 0, 1, 0.02352941, 1,
-0.4760106, -0.6869176, -3.177129, 0, 1, 0.02745098, 1,
-0.4659092, -1.095145, -3.236419, 0, 1, 0.03529412, 1,
-0.4658914, -0.101402, -1.1343, 0, 1, 0.03921569, 1,
-0.4641277, -0.01521047, -1.182664, 0, 1, 0.04705882, 1,
-0.4610281, 0.07527953, -1.307455, 0, 1, 0.05098039, 1,
-0.4562493, 2.123435, 0.5960919, 0, 1, 0.05882353, 1,
-0.4560055, 0.2195545, -0.6821792, 0, 1, 0.0627451, 1,
-0.4475416, 0.1460952, -1.744994, 0, 1, 0.07058824, 1,
-0.4465362, -0.3335561, -2.38179, 0, 1, 0.07450981, 1,
-0.4459309, 0.7479354, -0.7638384, 0, 1, 0.08235294, 1,
-0.4364901, -0.3482755, -3.29263, 0, 1, 0.08627451, 1,
-0.4352829, -0.4664659, -2.316741, 0, 1, 0.09411765, 1,
-0.4346987, 1.171562, -1.49976, 0, 1, 0.1019608, 1,
-0.4318845, 1.353381, -0.4863301, 0, 1, 0.1058824, 1,
-0.4318728, 0.2069359, -2.708408, 0, 1, 0.1137255, 1,
-0.4292217, -0.03810579, -2.176578, 0, 1, 0.1176471, 1,
-0.423004, -1.179, -3.40332, 0, 1, 0.1254902, 1,
-0.4229821, -0.9617736, -3.368329, 0, 1, 0.1294118, 1,
-0.4218048, 1.335658, -0.8269625, 0, 1, 0.1372549, 1,
-0.417922, 0.2137696, 1.053648, 0, 1, 0.1411765, 1,
-0.4121032, -0.5979716, -3.912256, 0, 1, 0.1490196, 1,
-0.4103418, 0.1282253, 0.1038635, 0, 1, 0.1529412, 1,
-0.41012, 0.05379451, -2.07985, 0, 1, 0.1607843, 1,
-0.4069554, -0.5102404, -2.446571, 0, 1, 0.1647059, 1,
-0.4053738, 2.108253, -0.9112747, 0, 1, 0.172549, 1,
-0.4041132, -0.5408427, -2.684412, 0, 1, 0.1764706, 1,
-0.4033343, -0.1001226, -3.383753, 0, 1, 0.1843137, 1,
-0.3984982, -0.4371246, -2.3705, 0, 1, 0.1882353, 1,
-0.3975764, -0.925108, -2.383788, 0, 1, 0.1960784, 1,
-0.3968715, -1.007233, -3.354319, 0, 1, 0.2039216, 1,
-0.3954504, 0.5091051, -1.340615, 0, 1, 0.2078431, 1,
-0.3904434, -1.114792, -1.247684, 0, 1, 0.2156863, 1,
-0.3892014, 0.0913639, -1.882001, 0, 1, 0.2196078, 1,
-0.3868377, 0.9090456, -0.4270183, 0, 1, 0.227451, 1,
-0.3863431, -1.596026, -1.331115, 0, 1, 0.2313726, 1,
-0.3840742, -0.2637747, -2.579928, 0, 1, 0.2392157, 1,
-0.3818973, 0.3504104, -0.9161349, 0, 1, 0.2431373, 1,
-0.3766853, -0.3682032, -3.245421, 0, 1, 0.2509804, 1,
-0.3766564, 1.631855, -0.6342146, 0, 1, 0.254902, 1,
-0.3755743, 1.101217, -0.9123381, 0, 1, 0.2627451, 1,
-0.3714252, 0.8606231, -0.06723839, 0, 1, 0.2666667, 1,
-0.3710848, 0.8038479, -1.160405, 0, 1, 0.2745098, 1,
-0.3703327, 0.5308616, -2.514726, 0, 1, 0.2784314, 1,
-0.3699702, 0.9229617, -1.857482, 0, 1, 0.2862745, 1,
-0.3699559, 0.1965536, -0.4911414, 0, 1, 0.2901961, 1,
-0.3666132, -0.1892956, -3.615299, 0, 1, 0.2980392, 1,
-0.3617772, -0.8449287, -2.180032, 0, 1, 0.3058824, 1,
-0.361405, 1.485649, 1.282068, 0, 1, 0.3098039, 1,
-0.3601141, -0.05746172, -1.32429, 0, 1, 0.3176471, 1,
-0.3579206, 0.5939238, -0.9822166, 0, 1, 0.3215686, 1,
-0.3472998, 1.034881, 1.325049, 0, 1, 0.3294118, 1,
-0.3452686, -0.05098103, 0.387024, 0, 1, 0.3333333, 1,
-0.3442249, 1.508172, 1.070827, 0, 1, 0.3411765, 1,
-0.3413686, -1.980121, -2.829152, 0, 1, 0.345098, 1,
-0.3320975, 0.8621241, -0.4175078, 0, 1, 0.3529412, 1,
-0.3268961, 0.2490456, -0.6285438, 0, 1, 0.3568628, 1,
-0.326875, 0.3950813, -0.02055185, 0, 1, 0.3647059, 1,
-0.3179923, 0.1455447, -1.196892, 0, 1, 0.3686275, 1,
-0.3124339, 0.02365711, -2.968938, 0, 1, 0.3764706, 1,
-0.3110918, -0.1986914, -3.189977, 0, 1, 0.3803922, 1,
-0.3101608, 1.717124, -1.816149, 0, 1, 0.3882353, 1,
-0.3098404, 0.5201047, -2.327123, 0, 1, 0.3921569, 1,
-0.3096207, -0.7884348, -1.033184, 0, 1, 0.4, 1,
-0.304618, -0.1630414, -2.539921, 0, 1, 0.4078431, 1,
-0.3035139, 0.7192284, -0.4223478, 0, 1, 0.4117647, 1,
-0.3023243, -1.140088, -2.905006, 0, 1, 0.4196078, 1,
-0.3021556, -0.8096446, -2.645217, 0, 1, 0.4235294, 1,
-0.3017005, -0.4899539, -1.357099, 0, 1, 0.4313726, 1,
-0.301384, -1.339862, -1.333003, 0, 1, 0.4352941, 1,
-0.2995633, 2.634556, -1.143635, 0, 1, 0.4431373, 1,
-0.2994007, 0.7408649, -1.804802, 0, 1, 0.4470588, 1,
-0.2990074, 0.6711118, 0.410163, 0, 1, 0.454902, 1,
-0.2985699, 0.21119, -0.8787363, 0, 1, 0.4588235, 1,
-0.296394, -0.5132938, -3.321475, 0, 1, 0.4666667, 1,
-0.2924369, -0.0671254, -1.279709, 0, 1, 0.4705882, 1,
-0.2916903, -0.364258, -0.9563036, 0, 1, 0.4784314, 1,
-0.2909999, 0.4109326, -2.316583, 0, 1, 0.4823529, 1,
-0.2903495, -0.02850586, -2.002626, 0, 1, 0.4901961, 1,
-0.2808415, 0.7196754, 0.004677254, 0, 1, 0.4941176, 1,
-0.2773848, 0.757287, 0.5709636, 0, 1, 0.5019608, 1,
-0.2767959, 1.210053, -1.250105, 0, 1, 0.509804, 1,
-0.2753489, 0.2512028, -1.998987, 0, 1, 0.5137255, 1,
-0.2750491, 1.478303, 0.5348532, 0, 1, 0.5215687, 1,
-0.265162, 1.576415, -0.8671112, 0, 1, 0.5254902, 1,
-0.2651134, 0.7721604, -0.5425013, 0, 1, 0.5333334, 1,
-0.2635912, 0.2825898, -0.4759747, 0, 1, 0.5372549, 1,
-0.2622316, 0.322081, 0.870467, 0, 1, 0.5450981, 1,
-0.2613033, -0.8268325, -3.3225, 0, 1, 0.5490196, 1,
-0.2580284, 1.562854, 0.1905341, 0, 1, 0.5568628, 1,
-0.2579004, -0.4580632, -3.798072, 0, 1, 0.5607843, 1,
-0.2543056, -1.97402, -3.16645, 0, 1, 0.5686275, 1,
-0.2502572, 1.473309, -2.215938, 0, 1, 0.572549, 1,
-0.2500862, -1.27421, -4.253002, 0, 1, 0.5803922, 1,
-0.2493859, -0.1333756, -2.015338, 0, 1, 0.5843138, 1,
-0.2465308, -0.07545693, -3.110864, 0, 1, 0.5921569, 1,
-0.2456153, 0.6688263, -0.1952418, 0, 1, 0.5960785, 1,
-0.2415164, 0.3173067, -2.691486, 0, 1, 0.6039216, 1,
-0.2363286, -0.8781067, -2.490014, 0, 1, 0.6117647, 1,
-0.2357142, 0.7448886, -2.410154, 0, 1, 0.6156863, 1,
-0.2328036, 0.3599429, 0.3759381, 0, 1, 0.6235294, 1,
-0.2294097, -0.2498149, -1.940096, 0, 1, 0.627451, 1,
-0.2251587, -0.4584852, -1.34878, 0, 1, 0.6352941, 1,
-0.2237302, 0.4879714, 0.1657133, 0, 1, 0.6392157, 1,
-0.219767, -1.2571, -5.476592, 0, 1, 0.6470588, 1,
-0.2192934, -0.2846424, -2.951951, 0, 1, 0.6509804, 1,
-0.2158619, -1.133662, -2.314364, 0, 1, 0.6588235, 1,
-0.2126361, -0.5808091, -3.510324, 0, 1, 0.6627451, 1,
-0.2056286, -1.449841, -1.950508, 0, 1, 0.6705883, 1,
-0.2020069, -0.4233755, -2.559263, 0, 1, 0.6745098, 1,
-0.2002587, 0.8018714, -0.9043916, 0, 1, 0.682353, 1,
-0.1984642, -1.737745, -3.423189, 0, 1, 0.6862745, 1,
-0.1937522, -0.1472258, -2.00778, 0, 1, 0.6941177, 1,
-0.1874832, -1.051022, -3.306552, 0, 1, 0.7019608, 1,
-0.1847131, 0.07263993, -1.518788, 0, 1, 0.7058824, 1,
-0.1826931, 2.078381, 1.546996, 0, 1, 0.7137255, 1,
-0.1742045, -0.8804802, -3.584668, 0, 1, 0.7176471, 1,
-0.1720696, -0.7243217, -2.301949, 0, 1, 0.7254902, 1,
-0.1685634, -0.6761748, -2.587056, 0, 1, 0.7294118, 1,
-0.1671972, -1.859061, -4.561066, 0, 1, 0.7372549, 1,
-0.1667089, -1.70838, -1.54814, 0, 1, 0.7411765, 1,
-0.1654731, 2.543231, 0.1646186, 0, 1, 0.7490196, 1,
-0.1639823, -0.1144825, -1.73287, 0, 1, 0.7529412, 1,
-0.1639579, -1.816512, -2.9527, 0, 1, 0.7607843, 1,
-0.1636525, -0.4449537, -1.166074, 0, 1, 0.7647059, 1,
-0.1635613, 0.5803621, 0.9385576, 0, 1, 0.772549, 1,
-0.1619563, -0.2926357, -1.187834, 0, 1, 0.7764706, 1,
-0.1589075, 1.511037, 1.335151, 0, 1, 0.7843137, 1,
-0.1540327, 1.650856, 1.476919, 0, 1, 0.7882353, 1,
-0.1496436, -0.06045233, -2.823558, 0, 1, 0.7960784, 1,
-0.147566, 0.1796911, -0.3390421, 0, 1, 0.8039216, 1,
-0.1471984, -0.414502, -2.941275, 0, 1, 0.8078431, 1,
-0.1443226, -0.4080403, -3.114831, 0, 1, 0.8156863, 1,
-0.142776, 0.2882359, 0.593375, 0, 1, 0.8196079, 1,
-0.1418881, -1.307016, -2.801242, 0, 1, 0.827451, 1,
-0.1342221, 0.3963485, 1.545524, 0, 1, 0.8313726, 1,
-0.1298734, -1.338802, -3.772678, 0, 1, 0.8392157, 1,
-0.1256679, 1.396281, 0.05537511, 0, 1, 0.8431373, 1,
-0.1248478, 0.5231053, -0.8185561, 0, 1, 0.8509804, 1,
-0.1169585, -0.4238665, -3.678156, 0, 1, 0.854902, 1,
-0.1147209, -0.1970419, -1.632955, 0, 1, 0.8627451, 1,
-0.1141355, -0.1637569, -3.659213, 0, 1, 0.8666667, 1,
-0.1128682, 0.5414256, -0.05239662, 0, 1, 0.8745098, 1,
-0.1114489, 0.5418935, 0.5520754, 0, 1, 0.8784314, 1,
-0.1052361, 2.104509, 0.5705479, 0, 1, 0.8862745, 1,
-0.1046947, -0.3974225, -2.639184, 0, 1, 0.8901961, 1,
-0.09954104, 0.1062104, -1.815039, 0, 1, 0.8980392, 1,
-0.09695163, -0.9470476, -1.606279, 0, 1, 0.9058824, 1,
-0.09633476, -0.7648576, -2.996023, 0, 1, 0.9098039, 1,
-0.08983504, 0.2857336, -0.6703831, 0, 1, 0.9176471, 1,
-0.08966513, -0.7493491, -3.737894, 0, 1, 0.9215686, 1,
-0.08878478, -0.8878211, -3.675322, 0, 1, 0.9294118, 1,
-0.08686413, 1.321379, 0.546611, 0, 1, 0.9333333, 1,
-0.08411402, 0.549936, -0.4059107, 0, 1, 0.9411765, 1,
-0.08340106, -0.7545817, -3.582917, 0, 1, 0.945098, 1,
-0.08176444, -0.3277771, -0.9079129, 0, 1, 0.9529412, 1,
-0.07709967, -0.3555458, -2.79778, 0, 1, 0.9568627, 1,
-0.07654031, -2.029593, -3.030587, 0, 1, 0.9647059, 1,
-0.07560385, -0.6227719, -3.09969, 0, 1, 0.9686275, 1,
-0.07473276, 1.435247, -0.6902218, 0, 1, 0.9764706, 1,
-0.07461262, 1.744221, 2.601612, 0, 1, 0.9803922, 1,
-0.07166135, 0.9721673, 1.096314, 0, 1, 0.9882353, 1,
-0.06990316, 0.7830623, -1.463147, 0, 1, 0.9921569, 1,
-0.06920379, 1.810121, -0.1472095, 0, 1, 1, 1,
-0.06918216, -0.8176351, -3.711628, 0, 0.9921569, 1, 1,
-0.06214422, -0.9619707, -4.24298, 0, 0.9882353, 1, 1,
-0.05775536, -1.211053, -3.431221, 0, 0.9803922, 1, 1,
-0.05331004, 0.007522728, -2.872003, 0, 0.9764706, 1, 1,
-0.05170162, -0.1163689, -2.72156, 0, 0.9686275, 1, 1,
-0.05157015, 0.7073838, -1.061948, 0, 0.9647059, 1, 1,
-0.04582963, -0.856967, -2.65376, 0, 0.9568627, 1, 1,
-0.04429277, -1.069101, -4.0697, 0, 0.9529412, 1, 1,
-0.04419376, 2.213513, 0.572337, 0, 0.945098, 1, 1,
-0.04259667, -0.07933686, -4.904384, 0, 0.9411765, 1, 1,
-0.04088819, -0.696969, -1.106925, 0, 0.9333333, 1, 1,
-0.04047866, 0.3048129, 0.4391136, 0, 0.9294118, 1, 1,
-0.03904584, -0.07952718, -3.716315, 0, 0.9215686, 1, 1,
-0.03788082, -0.996231, -4.317573, 0, 0.9176471, 1, 1,
-0.03684969, -1.668962, -3.892707, 0, 0.9098039, 1, 1,
-0.03600039, 0.5058917, -0.8221768, 0, 0.9058824, 1, 1,
-0.02859124, -1.558091, -3.111906, 0, 0.8980392, 1, 1,
-0.02776429, -1.800883, -3.425003, 0, 0.8901961, 1, 1,
-0.02516182, -2.756502, -2.719094, 0, 0.8862745, 1, 1,
-0.02501556, 1.822074, -0.1273205, 0, 0.8784314, 1, 1,
-0.01577286, 0.82535, 2.004919, 0, 0.8745098, 1, 1,
-0.01357177, 1.322515, -1.315116, 0, 0.8666667, 1, 1,
-0.01170979, -0.2654975, -2.988012, 0, 0.8627451, 1, 1,
-0.009697419, 0.3327846, 0.1585462, 0, 0.854902, 1, 1,
-0.006432431, -0.7918844, -3.098244, 0, 0.8509804, 1, 1,
-0.005800095, -1.811641, -4.019824, 0, 0.8431373, 1, 1,
-0.0001759758, 0.8497841, -0.568769, 0, 0.8392157, 1, 1,
0.0004561364, 1.140144, 2.420647, 0, 0.8313726, 1, 1,
0.0005373393, -0.01330047, 5.044359, 0, 0.827451, 1, 1,
0.004689474, 2.158548, 0.5180796, 0, 0.8196079, 1, 1,
0.007139193, -1.172303, 2.515774, 0, 0.8156863, 1, 1,
0.007933373, -2.676118, 3.713778, 0, 0.8078431, 1, 1,
0.008183543, 0.7464746, -0.7643533, 0, 0.8039216, 1, 1,
0.008611894, -0.4855766, 1.306584, 0, 0.7960784, 1, 1,
0.0106791, 0.9874356, -0.152905, 0, 0.7882353, 1, 1,
0.01068688, -0.2351819, 1.333051, 0, 0.7843137, 1, 1,
0.01136294, 0.9614317, -1.301781, 0, 0.7764706, 1, 1,
0.01419265, -0.000835042, 2.337845, 0, 0.772549, 1, 1,
0.01585913, -0.8276283, 3.600094, 0, 0.7647059, 1, 1,
0.01648448, 1.472575, -0.5760678, 0, 0.7607843, 1, 1,
0.01751703, 0.6286423, -1.753195, 0, 0.7529412, 1, 1,
0.01797741, -0.6270602, 2.894834, 0, 0.7490196, 1, 1,
0.01815109, 0.6060378, -1.156673, 0, 0.7411765, 1, 1,
0.0191799, -1.423712, 2.765108, 0, 0.7372549, 1, 1,
0.02222345, 0.1287339, 0.1110684, 0, 0.7294118, 1, 1,
0.02560473, -0.3682893, 1.706193, 0, 0.7254902, 1, 1,
0.02762403, 0.9173121, -0.7913258, 0, 0.7176471, 1, 1,
0.02934211, -0.3445331, 4.45458, 0, 0.7137255, 1, 1,
0.03054203, -0.5074723, 1.281195, 0, 0.7058824, 1, 1,
0.03362317, 1.902521, 0.4144408, 0, 0.6980392, 1, 1,
0.03649906, -1.071694, 2.848869, 0, 0.6941177, 1, 1,
0.03726514, 0.1893706, 1.461128, 0, 0.6862745, 1, 1,
0.03913317, -0.2264913, 3.588953, 0, 0.682353, 1, 1,
0.03941358, -1.705108, 2.069292, 0, 0.6745098, 1, 1,
0.04084704, 0.7372065, -0.9861285, 0, 0.6705883, 1, 1,
0.04089206, -0.8304315, 2.232631, 0, 0.6627451, 1, 1,
0.04244429, 0.4611907, -0.1339443, 0, 0.6588235, 1, 1,
0.05653636, 2.804046, 0.7393723, 0, 0.6509804, 1, 1,
0.05728683, 0.9541932, -0.8325821, 0, 0.6470588, 1, 1,
0.05775294, 0.2339994, 0.01647031, 0, 0.6392157, 1, 1,
0.0605745, 0.850706, 0.8292048, 0, 0.6352941, 1, 1,
0.06515671, 1.419641, -2.051933, 0, 0.627451, 1, 1,
0.07224827, 0.3975219, -0.6995794, 0, 0.6235294, 1, 1,
0.07239597, 0.5965263, -1.04539, 0, 0.6156863, 1, 1,
0.072792, -1.378852, 1.879233, 0, 0.6117647, 1, 1,
0.07564091, -0.4233604, 2.760955, 0, 0.6039216, 1, 1,
0.07998753, -0.8780401, 2.231145, 0, 0.5960785, 1, 1,
0.08533263, -1.544211, 2.268612, 0, 0.5921569, 1, 1,
0.091924, 1.659689, -0.8333053, 0, 0.5843138, 1, 1,
0.09252004, -1.230363, 1.996063, 0, 0.5803922, 1, 1,
0.09311954, 0.3874861, 2.255018, 0, 0.572549, 1, 1,
0.09807086, 0.550481, 0.211631, 0, 0.5686275, 1, 1,
0.09955006, 1.127318, 0.1122685, 0, 0.5607843, 1, 1,
0.1000435, 0.8172565, 0.8540148, 0, 0.5568628, 1, 1,
0.1008317, -0.3434077, 2.432305, 0, 0.5490196, 1, 1,
0.10413, 0.7035893, -0.08975513, 0, 0.5450981, 1, 1,
0.1047039, 0.3125874, -0.6885621, 0, 0.5372549, 1, 1,
0.110154, -1.021819, 1.930695, 0, 0.5333334, 1, 1,
0.1125529, -1.838108, 1.927116, 0, 0.5254902, 1, 1,
0.1133898, 0.07688157, 2.239439, 0, 0.5215687, 1, 1,
0.1134228, 1.053196, -0.9778042, 0, 0.5137255, 1, 1,
0.1140016, 0.06869722, 0.1413042, 0, 0.509804, 1, 1,
0.1144933, -0.9077533, 3.59022, 0, 0.5019608, 1, 1,
0.119629, 1.696928, 1.46156, 0, 0.4941176, 1, 1,
0.1217229, -0.08610306, 1.333776, 0, 0.4901961, 1, 1,
0.1221334, 1.338473, -0.1690666, 0, 0.4823529, 1, 1,
0.123031, 0.5305041, 0.319596, 0, 0.4784314, 1, 1,
0.1246622, 0.4626204, -1.543721, 0, 0.4705882, 1, 1,
0.1252504, 1.203441, 0.5258763, 0, 0.4666667, 1, 1,
0.1259307, 1.758533, 0.900136, 0, 0.4588235, 1, 1,
0.1273321, 0.3749175, 0.3468758, 0, 0.454902, 1, 1,
0.1320961, 1.166848, -1.827308, 0, 0.4470588, 1, 1,
0.1412037, -0.5032839, 4.111309, 0, 0.4431373, 1, 1,
0.1514831, -0.6928936, 2.790329, 0, 0.4352941, 1, 1,
0.1529901, -1.472632, 2.45725, 0, 0.4313726, 1, 1,
0.1592139, 0.4747143, -1.038503, 0, 0.4235294, 1, 1,
0.1694817, 0.1696358, -0.2987601, 0, 0.4196078, 1, 1,
0.1701635, -0.9665874, 3.151055, 0, 0.4117647, 1, 1,
0.1703443, -0.2270771, 2.223444, 0, 0.4078431, 1, 1,
0.1720724, -0.8613207, 3.068951, 0, 0.4, 1, 1,
0.1733646, -0.5384018, 3.933949, 0, 0.3921569, 1, 1,
0.1751389, -1.062952, 2.058601, 0, 0.3882353, 1, 1,
0.1751462, -0.6799481, 4.072739, 0, 0.3803922, 1, 1,
0.1769489, -0.6203245, 2.223484, 0, 0.3764706, 1, 1,
0.181378, 0.278222, 1.8845, 0, 0.3686275, 1, 1,
0.1832217, 0.5770382, -2.299228, 0, 0.3647059, 1, 1,
0.1867731, -0.4489959, 2.166222, 0, 0.3568628, 1, 1,
0.1903128, -1.638365, 5.175607, 0, 0.3529412, 1, 1,
0.193888, 1.491687, -1.434102, 0, 0.345098, 1, 1,
0.1954775, -0.5067968, 3.746893, 0, 0.3411765, 1, 1,
0.1964074, -0.07701191, 3.5802, 0, 0.3333333, 1, 1,
0.1979451, 0.1094907, 1.228277, 0, 0.3294118, 1, 1,
0.2074033, -0.01046172, 2.402263, 0, 0.3215686, 1, 1,
0.2088167, -0.4528674, 1.864364, 0, 0.3176471, 1, 1,
0.2134146, -0.6032873, 3.536135, 0, 0.3098039, 1, 1,
0.2191173, -1.226703, 2.604998, 0, 0.3058824, 1, 1,
0.222074, -0.6289644, 2.456288, 0, 0.2980392, 1, 1,
0.2255775, -1.765654, 2.039848, 0, 0.2901961, 1, 1,
0.2295081, 1.115598, -0.006415229, 0, 0.2862745, 1, 1,
0.2298494, -0.6466432, 3.512851, 0, 0.2784314, 1, 1,
0.2344622, -1.516963, 1.493724, 0, 0.2745098, 1, 1,
0.2348172, 2.259182, 0.121449, 0, 0.2666667, 1, 1,
0.2348567, -0.5079986, 2.055052, 0, 0.2627451, 1, 1,
0.2402964, 1.144668, -0.5476138, 0, 0.254902, 1, 1,
0.2418564, 0.7030161, 0.97119, 0, 0.2509804, 1, 1,
0.2425179, 0.9664769, -0.6400456, 0, 0.2431373, 1, 1,
0.2436346, 0.4377378, 0.8300777, 0, 0.2392157, 1, 1,
0.2456389, -0.4815942, 2.040739, 0, 0.2313726, 1, 1,
0.2521259, 2.526609, -1.18155, 0, 0.227451, 1, 1,
0.254066, -0.9074518, 2.898452, 0, 0.2196078, 1, 1,
0.2557715, 0.3453687, 0.9927951, 0, 0.2156863, 1, 1,
0.2609541, -0.1134264, 0.9005793, 0, 0.2078431, 1, 1,
0.2631408, -0.2945393, 2.97313, 0, 0.2039216, 1, 1,
0.2632618, 0.2035335, 1.761557, 0, 0.1960784, 1, 1,
0.2747189, -0.5009559, 3.482733, 0, 0.1882353, 1, 1,
0.2794566, -1.210407, 3.443725, 0, 0.1843137, 1, 1,
0.2813547, 0.2091096, 1.785763, 0, 0.1764706, 1, 1,
0.2817357, -0.8646663, 3.480025, 0, 0.172549, 1, 1,
0.2848327, 0.1557644, 2.454312, 0, 0.1647059, 1, 1,
0.2894605, 0.5576175, 0.3011705, 0, 0.1607843, 1, 1,
0.2913131, 0.3551611, 0.2586493, 0, 0.1529412, 1, 1,
0.2922579, 1.93083, 1.30945, 0, 0.1490196, 1, 1,
0.2929641, 0.901013, -0.5409253, 0, 0.1411765, 1, 1,
0.2935133, -0.4620295, 2.948086, 0, 0.1372549, 1, 1,
0.2984034, 0.1284321, 0.1451624, 0, 0.1294118, 1, 1,
0.3002806, -0.7757385, 1.357061, 0, 0.1254902, 1, 1,
0.3010126, -2.286809, 2.352478, 0, 0.1176471, 1, 1,
0.3010589, 1.379385, 0.4442455, 0, 0.1137255, 1, 1,
0.3016659, 1.671611, 0.283917, 0, 0.1058824, 1, 1,
0.3029971, -0.379612, 1.621366, 0, 0.09803922, 1, 1,
0.3061804, 0.3260062, 1.018295, 0, 0.09411765, 1, 1,
0.3071136, -0.109451, 1.093263, 0, 0.08627451, 1, 1,
0.3086666, -1.306518, 4.14381, 0, 0.08235294, 1, 1,
0.3141348, 0.08755083, 1.135231, 0, 0.07450981, 1, 1,
0.3145289, -0.8418723, 1.705753, 0, 0.07058824, 1, 1,
0.3155741, -0.009898618, 0.9696782, 0, 0.0627451, 1, 1,
0.3157753, -1.623823, 2.031747, 0, 0.05882353, 1, 1,
0.3174643, 0.448094, 0.02742037, 0, 0.05098039, 1, 1,
0.3183878, -0.1023648, 0.7691255, 0, 0.04705882, 1, 1,
0.3206578, -0.7403498, 1.868077, 0, 0.03921569, 1, 1,
0.3227549, 1.096532, -0.02969146, 0, 0.03529412, 1, 1,
0.3237603, 1.724393, 1.485293, 0, 0.02745098, 1, 1,
0.3324198, -0.3415717, 1.65965, 0, 0.02352941, 1, 1,
0.33268, -0.2134682, 3.632561, 0, 0.01568628, 1, 1,
0.3333259, -0.4385094, 1.543896, 0, 0.01176471, 1, 1,
0.3334653, 1.130667, 1.797644, 0, 0.003921569, 1, 1,
0.342283, 0.1825105, 0.6035641, 0.003921569, 0, 1, 1,
0.3424341, -1.210459, 1.930999, 0.007843138, 0, 1, 1,
0.344644, 1.5449, -0.4814961, 0.01568628, 0, 1, 1,
0.3480374, -1.887179, 4.383713, 0.01960784, 0, 1, 1,
0.3500862, -1.857024, 4.272097, 0.02745098, 0, 1, 1,
0.3524525, -0.1230044, 2.552506, 0.03137255, 0, 1, 1,
0.3559343, 0.8534344, -0.8045721, 0.03921569, 0, 1, 1,
0.35644, -1.410887, 4.310032, 0.04313726, 0, 1, 1,
0.3635179, -0.1232568, 2.082436, 0.05098039, 0, 1, 1,
0.3653748, 0.8006855, 1.586076, 0.05490196, 0, 1, 1,
0.3663139, 0.1710665, -1.154997, 0.0627451, 0, 1, 1,
0.3746788, -1.64305, 3.738959, 0.06666667, 0, 1, 1,
0.3797625, -0.07779817, 3.025037, 0.07450981, 0, 1, 1,
0.3807093, 1.887852, 1.424135, 0.07843138, 0, 1, 1,
0.3841409, 0.1155331, 0.9346701, 0.08627451, 0, 1, 1,
0.3854672, -2.090549, 3.396942, 0.09019608, 0, 1, 1,
0.3870359, -0.08646917, 2.987192, 0.09803922, 0, 1, 1,
0.3885018, 1.265717, -1.098408, 0.1058824, 0, 1, 1,
0.3891033, 2.060986, 1.001905, 0.1098039, 0, 1, 1,
0.3910914, -0.7411321, 2.222371, 0.1176471, 0, 1, 1,
0.3944269, 0.7721865, 1.621339, 0.1215686, 0, 1, 1,
0.394546, -0.6255773, 2.055421, 0.1294118, 0, 1, 1,
0.4041665, -0.9932438, 0.7486674, 0.1333333, 0, 1, 1,
0.4057288, -0.3303038, 3.586598, 0.1411765, 0, 1, 1,
0.4069341, -0.2184991, 1.334559, 0.145098, 0, 1, 1,
0.4071122, 0.5960199, 0.5996825, 0.1529412, 0, 1, 1,
0.4090251, 0.1256712, 2.514715, 0.1568628, 0, 1, 1,
0.4092027, 0.4106115, 0.9991516, 0.1647059, 0, 1, 1,
0.4137703, -0.8959216, 1.672758, 0.1686275, 0, 1, 1,
0.4160886, 1.068124, 0.05329872, 0.1764706, 0, 1, 1,
0.4183692, 0.190526, 3.404191, 0.1803922, 0, 1, 1,
0.4245694, -0.4592395, 1.611298, 0.1882353, 0, 1, 1,
0.4251432, 0.1059489, 0.814629, 0.1921569, 0, 1, 1,
0.42725, -0.4376563, 2.732594, 0.2, 0, 1, 1,
0.429647, 0.3857308, 0.6875331, 0.2078431, 0, 1, 1,
0.4307294, -2.134839, 2.248952, 0.2117647, 0, 1, 1,
0.4331294, -2.750196, 2.555345, 0.2196078, 0, 1, 1,
0.4387791, -0.6302729, 3.169456, 0.2235294, 0, 1, 1,
0.4396695, -0.1521644, 1.570284, 0.2313726, 0, 1, 1,
0.4445919, 0.7369217, -0.06820296, 0.2352941, 0, 1, 1,
0.4452993, 0.1187954, 1.472905, 0.2431373, 0, 1, 1,
0.4493014, -0.4180586, 1.431183, 0.2470588, 0, 1, 1,
0.449943, -0.8175598, 4.232939, 0.254902, 0, 1, 1,
0.4507299, -1.966837, 3.932713, 0.2588235, 0, 1, 1,
0.4515282, 0.529752, 1.585067, 0.2666667, 0, 1, 1,
0.4535207, 0.8036697, 0.5690262, 0.2705882, 0, 1, 1,
0.4556652, 2.219707, -0.8550972, 0.2784314, 0, 1, 1,
0.4586303, 0.4147182, -0.6053824, 0.282353, 0, 1, 1,
0.4594498, 0.8082156, -0.1210923, 0.2901961, 0, 1, 1,
0.4619386, 0.9863334, 0.2206874, 0.2941177, 0, 1, 1,
0.4734133, 1.563496, -0.1309659, 0.3019608, 0, 1, 1,
0.474836, 0.4164401, -0.0835666, 0.3098039, 0, 1, 1,
0.4770911, 0.03225521, 2.889641, 0.3137255, 0, 1, 1,
0.4779338, -0.286299, 3.235759, 0.3215686, 0, 1, 1,
0.478017, -0.821759, 2.230647, 0.3254902, 0, 1, 1,
0.4814419, -0.716937, 3.889939, 0.3333333, 0, 1, 1,
0.4854993, -0.4361901, 2.493074, 0.3372549, 0, 1, 1,
0.497663, -1.126168, 2.236902, 0.345098, 0, 1, 1,
0.4993283, 1.854964, 0.36632, 0.3490196, 0, 1, 1,
0.5055272, -0.9039522, 0.5198036, 0.3568628, 0, 1, 1,
0.509275, 0.1422622, 1.114331, 0.3607843, 0, 1, 1,
0.510496, 1.61428, -0.2087757, 0.3686275, 0, 1, 1,
0.5108119, -0.613821, 3.130154, 0.372549, 0, 1, 1,
0.5191004, -0.472919, 3.247708, 0.3803922, 0, 1, 1,
0.5204521, -1.859507, 2.352067, 0.3843137, 0, 1, 1,
0.5211772, 0.8191273, -0.3290751, 0.3921569, 0, 1, 1,
0.5253294, 0.5717376, 0.2477687, 0.3960784, 0, 1, 1,
0.5263828, -1.492662, 1.710096, 0.4039216, 0, 1, 1,
0.5274747, -0.006676437, 2.911313, 0.4117647, 0, 1, 1,
0.5309085, 2.653087, -1.350779, 0.4156863, 0, 1, 1,
0.5344117, 0.6811534, 0.2634172, 0.4235294, 0, 1, 1,
0.534944, 2.369416, -0.2800873, 0.427451, 0, 1, 1,
0.5377225, -2.215808, 3.9033, 0.4352941, 0, 1, 1,
0.5384609, 0.4978038, 1.234539, 0.4392157, 0, 1, 1,
0.5484859, 0.5438088, 0.7992798, 0.4470588, 0, 1, 1,
0.5498902, 0.1358297, -0.06891608, 0.4509804, 0, 1, 1,
0.5549204, 0.009234531, -0.6242056, 0.4588235, 0, 1, 1,
0.5565162, -1.499778, 0.8996534, 0.4627451, 0, 1, 1,
0.5573425, -0.1522393, 0.54605, 0.4705882, 0, 1, 1,
0.5575935, -2.244819, 3.619061, 0.4745098, 0, 1, 1,
0.562987, 0.02693496, 0.7883611, 0.4823529, 0, 1, 1,
0.5679604, 0.7732117, 1.263622, 0.4862745, 0, 1, 1,
0.5699973, -0.4314456, 3.450814, 0.4941176, 0, 1, 1,
0.5706484, -0.2291183, 1.411225, 0.5019608, 0, 1, 1,
0.5746303, -1.038361, 5.527761, 0.5058824, 0, 1, 1,
0.5747126, 0.9094216, 0.6486301, 0.5137255, 0, 1, 1,
0.576337, -0.0648539, 2.613432, 0.5176471, 0, 1, 1,
0.5789922, -1.502193, 2.048226, 0.5254902, 0, 1, 1,
0.5800788, -0.1311534, 1.165068, 0.5294118, 0, 1, 1,
0.582059, 1.819625, 1.090993, 0.5372549, 0, 1, 1,
0.5842286, -1.970832, 1.919679, 0.5411765, 0, 1, 1,
0.5872928, 0.1254952, 0.4297354, 0.5490196, 0, 1, 1,
0.5880696, -0.5728673, 2.875316, 0.5529412, 0, 1, 1,
0.5881255, -0.1615858, 0.5694853, 0.5607843, 0, 1, 1,
0.5888283, 0.8448382, 0.5696588, 0.5647059, 0, 1, 1,
0.5899708, -0.5370709, 3.045306, 0.572549, 0, 1, 1,
0.5922861, 0.9322664, -0.6196367, 0.5764706, 0, 1, 1,
0.5949436, -0.5027589, 2.600364, 0.5843138, 0, 1, 1,
0.5950195, -0.7958016, 3.592201, 0.5882353, 0, 1, 1,
0.6002857, 1.503734, 0.648852, 0.5960785, 0, 1, 1,
0.6003236, 0.7956685, -2.085064, 0.6039216, 0, 1, 1,
0.6034778, -0.08902471, 0.3376113, 0.6078432, 0, 1, 1,
0.6144873, -0.5123821, 3.823269, 0.6156863, 0, 1, 1,
0.6151414, 0.7921041, 0.6799924, 0.6196079, 0, 1, 1,
0.615782, -0.8930615, 1.090106, 0.627451, 0, 1, 1,
0.6171235, 1.262852, -0.00105996, 0.6313726, 0, 1, 1,
0.6187618, -1.349723, 2.030249, 0.6392157, 0, 1, 1,
0.6204214, 0.9406014, 1.233693, 0.6431373, 0, 1, 1,
0.6213795, -1.182826, 1.982342, 0.6509804, 0, 1, 1,
0.6224714, 0.9646188, -0.02312251, 0.654902, 0, 1, 1,
0.6236036, 1.579771, 0.5374196, 0.6627451, 0, 1, 1,
0.6238772, -0.6847435, 1.596866, 0.6666667, 0, 1, 1,
0.6263818, -0.348833, 1.738802, 0.6745098, 0, 1, 1,
0.638192, -1.132676, 3.835549, 0.6784314, 0, 1, 1,
0.6385043, 0.4634304, -0.4258307, 0.6862745, 0, 1, 1,
0.6388304, 1.512735, -0.04976572, 0.6901961, 0, 1, 1,
0.6394723, 1.12402, 1.433841, 0.6980392, 0, 1, 1,
0.6448483, -0.7489825, 3.17769, 0.7058824, 0, 1, 1,
0.6462288, 1.653354, -0.543063, 0.7098039, 0, 1, 1,
0.6526831, 1.558222, -0.5958081, 0.7176471, 0, 1, 1,
0.6708317, 0.05160347, 1.661925, 0.7215686, 0, 1, 1,
0.6775154, 1.436308, -0.4579494, 0.7294118, 0, 1, 1,
0.6783115, 0.7027843, 0.2351083, 0.7333333, 0, 1, 1,
0.6826649, -2.265395, 3.012217, 0.7411765, 0, 1, 1,
0.6831943, -0.7521859, 2.32999, 0.7450981, 0, 1, 1,
0.6857035, 1.47877, 1.815715, 0.7529412, 0, 1, 1,
0.6859059, -1.315709, 2.030059, 0.7568628, 0, 1, 1,
0.6879473, -0.02583753, 0.948173, 0.7647059, 0, 1, 1,
0.6891615, -1.668383, 2.962114, 0.7686275, 0, 1, 1,
0.6993736, -0.0423236, 1.347045, 0.7764706, 0, 1, 1,
0.7054842, 0.4353537, 1.077027, 0.7803922, 0, 1, 1,
0.7059382, -0.8036734, 2.962728, 0.7882353, 0, 1, 1,
0.7067363, 0.6979782, -0.5531549, 0.7921569, 0, 1, 1,
0.707239, 1.021114, 2.55789, 0.8, 0, 1, 1,
0.7157047, 1.048365, 1.459887, 0.8078431, 0, 1, 1,
0.7183467, -0.05591052, 0.9918932, 0.8117647, 0, 1, 1,
0.7185945, 0.1515429, 0.5479053, 0.8196079, 0, 1, 1,
0.7210145, 0.848525, -0.4977545, 0.8235294, 0, 1, 1,
0.7218741, -1.428533, 3.165003, 0.8313726, 0, 1, 1,
0.7220837, 0.4837109, -0.3720744, 0.8352941, 0, 1, 1,
0.722647, 0.1536485, 1.553935, 0.8431373, 0, 1, 1,
0.7232838, -0.3117082, 0.8161995, 0.8470588, 0, 1, 1,
0.7241451, 1.395021, 0.2723241, 0.854902, 0, 1, 1,
0.7269064, 0.1436142, 1.285191, 0.8588235, 0, 1, 1,
0.7336357, -0.3385097, 3.787461, 0.8666667, 0, 1, 1,
0.7443012, -1.644687, 3.865575, 0.8705882, 0, 1, 1,
0.7475067, 2.259073, -0.09660402, 0.8784314, 0, 1, 1,
0.7627214, -0.2491221, 2.257412, 0.8823529, 0, 1, 1,
0.7633448, -0.8669423, 0.0175857, 0.8901961, 0, 1, 1,
0.7667879, -1.165098, 1.597043, 0.8941177, 0, 1, 1,
0.776307, 1.335202, 1.223077, 0.9019608, 0, 1, 1,
0.7780354, 0.8198765, 1.71938, 0.9098039, 0, 1, 1,
0.7796525, -1.650882, 2.920385, 0.9137255, 0, 1, 1,
0.7849174, 0.248803, 0.2286276, 0.9215686, 0, 1, 1,
0.7950826, 0.4756612, 1.261615, 0.9254902, 0, 1, 1,
0.7999874, -0.4756875, 2.31986, 0.9333333, 0, 1, 1,
0.8002358, -0.3985239, 2.516858, 0.9372549, 0, 1, 1,
0.8038878, 0.1293253, 2.977656, 0.945098, 0, 1, 1,
0.8067842, 1.059347, 1.240869, 0.9490196, 0, 1, 1,
0.8094642, 0.1550366, 0.2815285, 0.9568627, 0, 1, 1,
0.8169814, -0.1833517, 1.532683, 0.9607843, 0, 1, 1,
0.8246815, 0.8403612, -0.4797858, 0.9686275, 0, 1, 1,
0.8252627, 0.628328, 0.4220926, 0.972549, 0, 1, 1,
0.8264154, -0.2009015, 1.320808, 0.9803922, 0, 1, 1,
0.8313888, 0.06696904, -0.2872832, 0.9843137, 0, 1, 1,
0.8362382, -0.5170048, 2.212078, 0.9921569, 0, 1, 1,
0.836594, 0.5794422, -0.4391405, 0.9960784, 0, 1, 1,
0.8408762, -0.4568298, 2.299569, 1, 0, 0.9960784, 1,
0.8478423, 0.3244242, 1.867155, 1, 0, 0.9882353, 1,
0.8478852, -0.5679654, 4.191329, 1, 0, 0.9843137, 1,
0.8513733, -0.1026514, 3.282351, 1, 0, 0.9764706, 1,
0.8530909, -0.548647, 1.478606, 1, 0, 0.972549, 1,
0.8536188, -0.5539492, 2.650907, 1, 0, 0.9647059, 1,
0.8660936, 1.062163, 0.9775668, 1, 0, 0.9607843, 1,
0.87034, 0.5023217, 0.4132601, 1, 0, 0.9529412, 1,
0.871042, 0.3592037, 1.711671, 1, 0, 0.9490196, 1,
0.8777542, -0.9453279, 1.628204, 1, 0, 0.9411765, 1,
0.8821979, -0.4428137, 3.752177, 1, 0, 0.9372549, 1,
0.8837411, -0.5899413, 1.657833, 1, 0, 0.9294118, 1,
0.908078, 0.5641854, 1.059133, 1, 0, 0.9254902, 1,
0.9190342, -0.579033, 1.863248, 1, 0, 0.9176471, 1,
0.9214507, -0.9951243, 3.636307, 1, 0, 0.9137255, 1,
0.9249171, 0.007043697, 1.955341, 1, 0, 0.9058824, 1,
0.9279835, -0.1452024, 1.590605, 1, 0, 0.9019608, 1,
0.9300786, 0.2306671, 1.816834, 1, 0, 0.8941177, 1,
0.9356877, -0.9510242, 2.78777, 1, 0, 0.8862745, 1,
0.9422125, 1.319563, 1.235306, 1, 0, 0.8823529, 1,
0.942654, 0.296638, 0.08820253, 1, 0, 0.8745098, 1,
0.944573, -1.004369, 2.139386, 1, 0, 0.8705882, 1,
0.9471722, 0.7547042, 0.3226268, 1, 0, 0.8627451, 1,
0.9494717, 0.6415523, -0.2349424, 1, 0, 0.8588235, 1,
0.9601667, 0.9058969, 1.563811, 1, 0, 0.8509804, 1,
0.9691762, -0.1126628, 0.02539613, 1, 0, 0.8470588, 1,
0.9856473, 0.9080495, 2.010981, 1, 0, 0.8392157, 1,
0.9860054, 0.1726409, 2.653368, 1, 0, 0.8352941, 1,
0.9864584, 0.7822959, 0.2805869, 1, 0, 0.827451, 1,
0.9875634, 0.1157416, 0.914961, 1, 0, 0.8235294, 1,
0.9890681, 1.670932, 1.148523, 1, 0, 0.8156863, 1,
0.9912214, -0.4560904, 1.991188, 1, 0, 0.8117647, 1,
0.9934649, -0.2048412, 1.951895, 1, 0, 0.8039216, 1,
0.9939782, 0.435312, 2.98157, 1, 0, 0.7960784, 1,
1.000065, -0.2054751, 1.979768, 1, 0, 0.7921569, 1,
1.003438, 0.4620157, 0.571669, 1, 0, 0.7843137, 1,
1.004862, -1.210136, 1.887202, 1, 0, 0.7803922, 1,
1.005084, -0.8897735, 2.471054, 1, 0, 0.772549, 1,
1.008012, 0.4457905, 0.2901688, 1, 0, 0.7686275, 1,
1.012162, -0.4267638, 2.464791, 1, 0, 0.7607843, 1,
1.019468, -0.188125, 2.26033, 1, 0, 0.7568628, 1,
1.022168, 1.091073, 0.1492977, 1, 0, 0.7490196, 1,
1.02407, -0.6939463, 3.320855, 1, 0, 0.7450981, 1,
1.027359, -0.05139368, 0.9803601, 1, 0, 0.7372549, 1,
1.031697, -0.149291, 2.316431, 1, 0, 0.7333333, 1,
1.036801, 2.809666, -0.1821457, 1, 0, 0.7254902, 1,
1.052653, 1.051437, 0.2320518, 1, 0, 0.7215686, 1,
1.066208, -0.3213448, 1.987366, 1, 0, 0.7137255, 1,
1.067136, -0.2732711, 2.001121, 1, 0, 0.7098039, 1,
1.086506, -0.01787116, 1.714131, 1, 0, 0.7019608, 1,
1.100019, 0.2421189, 0.951525, 1, 0, 0.6941177, 1,
1.105809, -0.3306314, 1.175226, 1, 0, 0.6901961, 1,
1.109371, 1.731524, 1.040502, 1, 0, 0.682353, 1,
1.112856, -2.117291, 3.302011, 1, 0, 0.6784314, 1,
1.112975, 0.1923896, 2.92726, 1, 0, 0.6705883, 1,
1.113077, -0.9671347, 2.276418, 1, 0, 0.6666667, 1,
1.126591, -0.2151883, -0.3331644, 1, 0, 0.6588235, 1,
1.131065, -1.320704, 2.884457, 1, 0, 0.654902, 1,
1.138745, 1.241363, 0.2620248, 1, 0, 0.6470588, 1,
1.148807, -0.2247006, 0.8083815, 1, 0, 0.6431373, 1,
1.159744, 0.654125, 1.578037, 1, 0, 0.6352941, 1,
1.163885, 1.086629, 1.330303, 1, 0, 0.6313726, 1,
1.177832, 0.03744017, 2.389394, 1, 0, 0.6235294, 1,
1.178186, -0.1459289, -0.8559591, 1, 0, 0.6196079, 1,
1.185104, 0.3640017, 2.837261, 1, 0, 0.6117647, 1,
1.191899, 0.2037469, 1.829572, 1, 0, 0.6078432, 1,
1.19876, 1.829846, -1.157545, 1, 0, 0.6, 1,
1.201586, -0.6332658, 1.065318, 1, 0, 0.5921569, 1,
1.20259, -0.07045566, 3.0918, 1, 0, 0.5882353, 1,
1.209164, 0.9258113, 2.213254, 1, 0, 0.5803922, 1,
1.214439, -0.2347604, 0.7379628, 1, 0, 0.5764706, 1,
1.21518, -0.4986473, 2.147692, 1, 0, 0.5686275, 1,
1.221586, 1.827325, -1.16016, 1, 0, 0.5647059, 1,
1.224378, -0.6627821, 1.67219, 1, 0, 0.5568628, 1,
1.233207, -2.242787, 2.262565, 1, 0, 0.5529412, 1,
1.2347, -1.916376, 4.040149, 1, 0, 0.5450981, 1,
1.235048, -0.3072608, 1.725521, 1, 0, 0.5411765, 1,
1.241103, 2.462878, 1.999444, 1, 0, 0.5333334, 1,
1.251005, 0.2210105, 1.698599, 1, 0, 0.5294118, 1,
1.252259, -1.305312, 2.584688, 1, 0, 0.5215687, 1,
1.278447, 1.786831, -0.35126, 1, 0, 0.5176471, 1,
1.280061, -1.73233, 2.520412, 1, 0, 0.509804, 1,
1.283885, 0.02124075, 1.556441, 1, 0, 0.5058824, 1,
1.297808, 1.16788, 0.6363025, 1, 0, 0.4980392, 1,
1.303089, 0.8553911, 0.3847944, 1, 0, 0.4901961, 1,
1.308339, 1.312993, 0.2589747, 1, 0, 0.4862745, 1,
1.308345, -1.714003, 3.026519, 1, 0, 0.4784314, 1,
1.317662, -1.318708, 3.085413, 1, 0, 0.4745098, 1,
1.317673, -0.07675695, 0.7352803, 1, 0, 0.4666667, 1,
1.327203, 1.211648, 2.29054, 1, 0, 0.4627451, 1,
1.350012, 0.03581713, 1.401974, 1, 0, 0.454902, 1,
1.350546, 0.0259111, 2.277474, 1, 0, 0.4509804, 1,
1.352352, 0.9383689, 1.18929, 1, 0, 0.4431373, 1,
1.354636, -0.5519372, 2.489025, 1, 0, 0.4392157, 1,
1.367797, 1.219471, 0.3287587, 1, 0, 0.4313726, 1,
1.368481, -0.4996316, 3.233992, 1, 0, 0.427451, 1,
1.391343, -1.197958, 1.598224, 1, 0, 0.4196078, 1,
1.394452, -1.310009, 2.015231, 1, 0, 0.4156863, 1,
1.404528, -0.6700824, 3.859025, 1, 0, 0.4078431, 1,
1.432272, 0.2333712, 1.861779, 1, 0, 0.4039216, 1,
1.459391, 0.5959907, -0.3803435, 1, 0, 0.3960784, 1,
1.467861, 0.5481383, 0.640121, 1, 0, 0.3882353, 1,
1.468107, -0.5599694, 3.4303, 1, 0, 0.3843137, 1,
1.475207, 0.3496482, 2.943294, 1, 0, 0.3764706, 1,
1.478928, 0.5984696, 0.5757971, 1, 0, 0.372549, 1,
1.521233, -0.6119181, 1.390121, 1, 0, 0.3647059, 1,
1.527399, -0.02343853, 1.341746, 1, 0, 0.3607843, 1,
1.547621, 0.9064644, 2.085819, 1, 0, 0.3529412, 1,
1.5503, -0.05219144, 2.172402, 1, 0, 0.3490196, 1,
1.55362, 1.165684, 0.6713427, 1, 0, 0.3411765, 1,
1.560007, 0.4758061, 1.451774, 1, 0, 0.3372549, 1,
1.56497, -0.5402733, 1.820149, 1, 0, 0.3294118, 1,
1.567291, -0.3119213, 1.333942, 1, 0, 0.3254902, 1,
1.569248, 0.7684388, 3.209434, 1, 0, 0.3176471, 1,
1.574104, 0.04715412, 0.08994794, 1, 0, 0.3137255, 1,
1.591024, 1.044706, 0.09624428, 1, 0, 0.3058824, 1,
1.591873, -0.4803031, 3.280473, 1, 0, 0.2980392, 1,
1.610765, -0.7245085, 3.16731, 1, 0, 0.2941177, 1,
1.627833, 0.1672569, 1.165674, 1, 0, 0.2862745, 1,
1.645008, 1.273205, 0.3602398, 1, 0, 0.282353, 1,
1.676941, 0.1412141, 1.036131, 1, 0, 0.2745098, 1,
1.679873, -0.5871639, 1.814219, 1, 0, 0.2705882, 1,
1.702702, 0.7360481, 2.358293, 1, 0, 0.2627451, 1,
1.71903, 0.4242572, 3.152762, 1, 0, 0.2588235, 1,
1.738557, 0.4202017, 0.2689727, 1, 0, 0.2509804, 1,
1.746054, 1.370868, 0.5123205, 1, 0, 0.2470588, 1,
1.751104, -0.7582141, 2.256562, 1, 0, 0.2392157, 1,
1.751313, 0.9545956, 1.917319, 1, 0, 0.2352941, 1,
1.764694, -0.4467545, 2.228044, 1, 0, 0.227451, 1,
1.786071, -0.2252882, 0.8149872, 1, 0, 0.2235294, 1,
1.806667, -0.5627553, 1.559594, 1, 0, 0.2156863, 1,
1.814875, 0.6853927, 1.059635, 1, 0, 0.2117647, 1,
1.837509, -0.285934, 1.950701, 1, 0, 0.2039216, 1,
1.857923, -0.2044846, 0.1395002, 1, 0, 0.1960784, 1,
1.859796, 0.8810121, 1.894802, 1, 0, 0.1921569, 1,
1.872449, -0.2938239, 0.810537, 1, 0, 0.1843137, 1,
1.873827, -1.054753, 2.629607, 1, 0, 0.1803922, 1,
1.878268, -0.00838935, 3.856596, 1, 0, 0.172549, 1,
1.927927, 0.8355404, 0.9911377, 1, 0, 0.1686275, 1,
1.954901, 1.366393, 0.7148108, 1, 0, 0.1607843, 1,
1.963285, -0.7679213, 2.219286, 1, 0, 0.1568628, 1,
1.963714, -1.394279, 4.929955, 1, 0, 0.1490196, 1,
1.969524, -0.4077488, 1.730018, 1, 0, 0.145098, 1,
1.993463, 2.024131, 1.615723, 1, 0, 0.1372549, 1,
2.005245, -0.411828, 2.604478, 1, 0, 0.1333333, 1,
2.014255, 1.419264, 3.665792, 1, 0, 0.1254902, 1,
2.017678, -0.2891713, 1.035816, 1, 0, 0.1215686, 1,
2.032165, -1.82962, 3.353379, 1, 0, 0.1137255, 1,
2.057688, 0.3828194, 1.44487, 1, 0, 0.1098039, 1,
2.084646, -1.573675, 2.38905, 1, 0, 0.1019608, 1,
2.104177, 0.5852031, 0.05070816, 1, 0, 0.09411765, 1,
2.180171, -2.151194, 2.483772, 1, 0, 0.09019608, 1,
2.186114, 1.275241, 1.654034, 1, 0, 0.08235294, 1,
2.20124, 0.3611891, 0.4186131, 1, 0, 0.07843138, 1,
2.206501, 0.8487907, 0.0391881, 1, 0, 0.07058824, 1,
2.238038, 0.6874081, 2.998368, 1, 0, 0.06666667, 1,
2.314454, -0.6204202, 2.681429, 1, 0, 0.05882353, 1,
2.391268, -0.4900168, 1.527928, 1, 0, 0.05490196, 1,
2.420685, 1.078381, 1.519605, 1, 0, 0.04705882, 1,
2.481059, -0.05347195, 1.713896, 1, 0, 0.04313726, 1,
2.592393, -1.206752, 1.217995, 1, 0, 0.03529412, 1,
2.716439, 1.151497, -0.3469431, 1, 0, 0.03137255, 1,
2.744307, -0.6294084, 2.96703, 1, 0, 0.02352941, 1,
2.84454, 1.918849, 1.189222, 1, 0, 0.01960784, 1,
3.031826, 2.214857, 3.530921, 1, 0, 0.01176471, 1,
3.312961, -0.7237656, 3.781774, 1, 0, 0.007843138, 1
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
-0.1273369, -3.89301, -7.341829, 0, -0.5, 0.5, 0.5,
-0.1273369, -3.89301, -7.341829, 1, -0.5, 0.5, 0.5,
-0.1273369, -3.89301, -7.341829, 1, 1.5, 0.5, 0.5,
-0.1273369, -3.89301, -7.341829, 0, 1.5, 0.5, 0.5
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
-4.733895, 0.06409681, -7.341829, 0, -0.5, 0.5, 0.5,
-4.733895, 0.06409681, -7.341829, 1, -0.5, 0.5, 0.5,
-4.733895, 0.06409681, -7.341829, 1, 1.5, 0.5, 0.5,
-4.733895, 0.06409681, -7.341829, 0, 1.5, 0.5, 0.5
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
-4.733895, -3.89301, 0.02558446, 0, -0.5, 0.5, 0.5,
-4.733895, -3.89301, 0.02558446, 1, -0.5, 0.5, 0.5,
-4.733895, -3.89301, 0.02558446, 1, 1.5, 0.5, 0.5,
-4.733895, -3.89301, 0.02558446, 0, 1.5, 0.5, 0.5
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
-3, -2.979831, -5.641657,
3, -2.979831, -5.641657,
-3, -2.979831, -5.641657,
-3, -3.132028, -5.925019,
-2, -2.979831, -5.641657,
-2, -3.132028, -5.925019,
-1, -2.979831, -5.641657,
-1, -3.132028, -5.925019,
0, -2.979831, -5.641657,
0, -3.132028, -5.925019,
1, -2.979831, -5.641657,
1, -3.132028, -5.925019,
2, -2.979831, -5.641657,
2, -3.132028, -5.925019,
3, -2.979831, -5.641657,
3, -3.132028, -5.925019
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
-3, -3.43642, -6.491743, 0, -0.5, 0.5, 0.5,
-3, -3.43642, -6.491743, 1, -0.5, 0.5, 0.5,
-3, -3.43642, -6.491743, 1, 1.5, 0.5, 0.5,
-3, -3.43642, -6.491743, 0, 1.5, 0.5, 0.5,
-2, -3.43642, -6.491743, 0, -0.5, 0.5, 0.5,
-2, -3.43642, -6.491743, 1, -0.5, 0.5, 0.5,
-2, -3.43642, -6.491743, 1, 1.5, 0.5, 0.5,
-2, -3.43642, -6.491743, 0, 1.5, 0.5, 0.5,
-1, -3.43642, -6.491743, 0, -0.5, 0.5, 0.5,
-1, -3.43642, -6.491743, 1, -0.5, 0.5, 0.5,
-1, -3.43642, -6.491743, 1, 1.5, 0.5, 0.5,
-1, -3.43642, -6.491743, 0, 1.5, 0.5, 0.5,
0, -3.43642, -6.491743, 0, -0.5, 0.5, 0.5,
0, -3.43642, -6.491743, 1, -0.5, 0.5, 0.5,
0, -3.43642, -6.491743, 1, 1.5, 0.5, 0.5,
0, -3.43642, -6.491743, 0, 1.5, 0.5, 0.5,
1, -3.43642, -6.491743, 0, -0.5, 0.5, 0.5,
1, -3.43642, -6.491743, 1, -0.5, 0.5, 0.5,
1, -3.43642, -6.491743, 1, 1.5, 0.5, 0.5,
1, -3.43642, -6.491743, 0, 1.5, 0.5, 0.5,
2, -3.43642, -6.491743, 0, -0.5, 0.5, 0.5,
2, -3.43642, -6.491743, 1, -0.5, 0.5, 0.5,
2, -3.43642, -6.491743, 1, 1.5, 0.5, 0.5,
2, -3.43642, -6.491743, 0, 1.5, 0.5, 0.5,
3, -3.43642, -6.491743, 0, -0.5, 0.5, 0.5,
3, -3.43642, -6.491743, 1, -0.5, 0.5, 0.5,
3, -3.43642, -6.491743, 1, 1.5, 0.5, 0.5,
3, -3.43642, -6.491743, 0, 1.5, 0.5, 0.5
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
-3.670843, -2, -5.641657,
-3.670843, 3, -5.641657,
-3.670843, -2, -5.641657,
-3.848019, -2, -5.925019,
-3.670843, -1, -5.641657,
-3.848019, -1, -5.925019,
-3.670843, 0, -5.641657,
-3.848019, 0, -5.925019,
-3.670843, 1, -5.641657,
-3.848019, 1, -5.925019,
-3.670843, 2, -5.641657,
-3.848019, 2, -5.925019,
-3.670843, 3, -5.641657,
-3.848019, 3, -5.925019
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
-4.202369, -2, -6.491743, 0, -0.5, 0.5, 0.5,
-4.202369, -2, -6.491743, 1, -0.5, 0.5, 0.5,
-4.202369, -2, -6.491743, 1, 1.5, 0.5, 0.5,
-4.202369, -2, -6.491743, 0, 1.5, 0.5, 0.5,
-4.202369, -1, -6.491743, 0, -0.5, 0.5, 0.5,
-4.202369, -1, -6.491743, 1, -0.5, 0.5, 0.5,
-4.202369, -1, -6.491743, 1, 1.5, 0.5, 0.5,
-4.202369, -1, -6.491743, 0, 1.5, 0.5, 0.5,
-4.202369, 0, -6.491743, 0, -0.5, 0.5, 0.5,
-4.202369, 0, -6.491743, 1, -0.5, 0.5, 0.5,
-4.202369, 0, -6.491743, 1, 1.5, 0.5, 0.5,
-4.202369, 0, -6.491743, 0, 1.5, 0.5, 0.5,
-4.202369, 1, -6.491743, 0, -0.5, 0.5, 0.5,
-4.202369, 1, -6.491743, 1, -0.5, 0.5, 0.5,
-4.202369, 1, -6.491743, 1, 1.5, 0.5, 0.5,
-4.202369, 1, -6.491743, 0, 1.5, 0.5, 0.5,
-4.202369, 2, -6.491743, 0, -0.5, 0.5, 0.5,
-4.202369, 2, -6.491743, 1, -0.5, 0.5, 0.5,
-4.202369, 2, -6.491743, 1, 1.5, 0.5, 0.5,
-4.202369, 2, -6.491743, 0, 1.5, 0.5, 0.5,
-4.202369, 3, -6.491743, 0, -0.5, 0.5, 0.5,
-4.202369, 3, -6.491743, 1, -0.5, 0.5, 0.5,
-4.202369, 3, -6.491743, 1, 1.5, 0.5, 0.5,
-4.202369, 3, -6.491743, 0, 1.5, 0.5, 0.5
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
-3.670843, -2.979831, -4,
-3.670843, -2.979831, 4,
-3.670843, -2.979831, -4,
-3.848019, -3.132028, -4,
-3.670843, -2.979831, -2,
-3.848019, -3.132028, -2,
-3.670843, -2.979831, 0,
-3.848019, -3.132028, 0,
-3.670843, -2.979831, 2,
-3.848019, -3.132028, 2,
-3.670843, -2.979831, 4,
-3.848019, -3.132028, 4
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
-4.202369, -3.43642, -4, 0, -0.5, 0.5, 0.5,
-4.202369, -3.43642, -4, 1, -0.5, 0.5, 0.5,
-4.202369, -3.43642, -4, 1, 1.5, 0.5, 0.5,
-4.202369, -3.43642, -4, 0, 1.5, 0.5, 0.5,
-4.202369, -3.43642, -2, 0, -0.5, 0.5, 0.5,
-4.202369, -3.43642, -2, 1, -0.5, 0.5, 0.5,
-4.202369, -3.43642, -2, 1, 1.5, 0.5, 0.5,
-4.202369, -3.43642, -2, 0, 1.5, 0.5, 0.5,
-4.202369, -3.43642, 0, 0, -0.5, 0.5, 0.5,
-4.202369, -3.43642, 0, 1, -0.5, 0.5, 0.5,
-4.202369, -3.43642, 0, 1, 1.5, 0.5, 0.5,
-4.202369, -3.43642, 0, 0, 1.5, 0.5, 0.5,
-4.202369, -3.43642, 2, 0, -0.5, 0.5, 0.5,
-4.202369, -3.43642, 2, 1, -0.5, 0.5, 0.5,
-4.202369, -3.43642, 2, 1, 1.5, 0.5, 0.5,
-4.202369, -3.43642, 2, 0, 1.5, 0.5, 0.5,
-4.202369, -3.43642, 4, 0, -0.5, 0.5, 0.5,
-4.202369, -3.43642, 4, 1, -0.5, 0.5, 0.5,
-4.202369, -3.43642, 4, 1, 1.5, 0.5, 0.5,
-4.202369, -3.43642, 4, 0, 1.5, 0.5, 0.5
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
-3.670843, -2.979831, -5.641657,
-3.670843, 3.108025, -5.641657,
-3.670843, -2.979831, 5.692826,
-3.670843, 3.108025, 5.692826,
-3.670843, -2.979831, -5.641657,
-3.670843, -2.979831, 5.692826,
-3.670843, 3.108025, -5.641657,
-3.670843, 3.108025, 5.692826,
-3.670843, -2.979831, -5.641657,
3.41617, -2.979831, -5.641657,
-3.670843, -2.979831, 5.692826,
3.41617, -2.979831, 5.692826,
-3.670843, 3.108025, -5.641657,
3.41617, 3.108025, -5.641657,
-3.670843, 3.108025, 5.692826,
3.41617, 3.108025, 5.692826,
3.41617, -2.979831, -5.641657,
3.41617, 3.108025, -5.641657,
3.41617, -2.979831, 5.692826,
3.41617, 3.108025, 5.692826,
3.41617, -2.979831, -5.641657,
3.41617, -2.979831, 5.692826,
3.41617, 3.108025, -5.641657,
3.41617, 3.108025, 5.692826
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
var radius = 7.843487;
var distance = 34.89656;
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
mvMatrix.translate( 0.1273369, -0.06409681, -0.02558446 );
mvMatrix.scale( 1.19663, 1.393024, 0.7482063 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.89656);
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
Fonofos<-read.table("Fonofos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Fonofos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Fonofos' not found
```

```r
y<-Fonofos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Fonofos' not found
```

```r
z<-Fonofos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Fonofos' not found
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
-3.567634, -0.1547976, -1.947079, 0, 0, 1, 1, 1,
-3.258783, 0.810662, -0.6583019, 1, 0, 0, 1, 1,
-2.819757, 0.4377562, -2.141659, 1, 0, 0, 1, 1,
-2.810034, -0.07976418, -4.075846, 1, 0, 0, 1, 1,
-2.571538, 1.602325, 0.589008, 1, 0, 0, 1, 1,
-2.569027, 1.461993, -1.086245, 1, 0, 0, 1, 1,
-2.546612, -1.490587, -2.335763, 0, 0, 0, 1, 1,
-2.501378, 0.1581602, -1.329187, 0, 0, 0, 1, 1,
-2.430107, 1.759471, -1.09199, 0, 0, 0, 1, 1,
-2.427657, 0.8567033, -1.936401, 0, 0, 0, 1, 1,
-2.39557, -1.447737, -2.410298, 0, 0, 0, 1, 1,
-2.351439, -0.04858053, -1.999943, 0, 0, 0, 1, 1,
-2.294142, 1.450075, -1.738002, 0, 0, 0, 1, 1,
-2.290796, 0.1027928, -3.300081, 1, 1, 1, 1, 1,
-2.275974, -0.7897773, -2.293822, 1, 1, 1, 1, 1,
-2.270883, 0.07338357, -1.977515, 1, 1, 1, 1, 1,
-2.202308, -0.7624358, -3.809491, 1, 1, 1, 1, 1,
-2.16921, -0.5799142, -3.377305, 1, 1, 1, 1, 1,
-2.154788, 0.7719566, -0.599551, 1, 1, 1, 1, 1,
-2.14504, 0.4062172, -0.4392341, 1, 1, 1, 1, 1,
-2.141171, -1.889622, -3.552249, 1, 1, 1, 1, 1,
-2.077202, -1.098876, -1.422182, 1, 1, 1, 1, 1,
-2.027494, -0.6701245, -1.753594, 1, 1, 1, 1, 1,
-2.021418, -1.283934, -2.963303, 1, 1, 1, 1, 1,
-2.012132, 1.032167, -1.333982, 1, 1, 1, 1, 1,
-2.00032, -0.06027828, -1.402636, 1, 1, 1, 1, 1,
-1.974486, -0.545764, -0.401995, 1, 1, 1, 1, 1,
-1.9622, -1.046112, -2.353117, 1, 1, 1, 1, 1,
-1.944429, -0.4239243, -1.503862, 0, 0, 1, 1, 1,
-1.925043, 2.304105, -1.278476, 1, 0, 0, 1, 1,
-1.905169, -0.6097299, -2.611621, 1, 0, 0, 1, 1,
-1.895184, 2.336128, -1.757894, 1, 0, 0, 1, 1,
-1.895096, -0.09252798, -2.346278, 1, 0, 0, 1, 1,
-1.8915, 0.7011495, -2.838052, 1, 0, 0, 1, 1,
-1.882815, -0.01877952, -2.078738, 0, 0, 0, 1, 1,
-1.880349, 0.41754, -0.5330741, 0, 0, 0, 1, 1,
-1.877323, 0.3159526, -1.176996, 0, 0, 0, 1, 1,
-1.860515, 0.2839407, -2.048899, 0, 0, 0, 1, 1,
-1.842514, 0.7962119, -1.5214, 0, 0, 0, 1, 1,
-1.827062, -0.6605497, -2.523408, 0, 0, 0, 1, 1,
-1.826693, 1.109213, 0.3194678, 0, 0, 0, 1, 1,
-1.807225, 0.3429502, -0.7394631, 1, 1, 1, 1, 1,
-1.779927, 0.2897842, -0.488272, 1, 1, 1, 1, 1,
-1.768972, -1.25849, -3.535131, 1, 1, 1, 1, 1,
-1.757025, -0.1000106, -1.716405, 1, 1, 1, 1, 1,
-1.753626, 0.9148539, -0.4906383, 1, 1, 1, 1, 1,
-1.749105, 0.07868899, -0.6318278, 1, 1, 1, 1, 1,
-1.737365, -0.6975026, -3.485234, 1, 1, 1, 1, 1,
-1.710962, -0.8498729, -2.529144, 1, 1, 1, 1, 1,
-1.710859, -0.4937898, -1.734525, 1, 1, 1, 1, 1,
-1.699194, -0.2504707, -2.309298, 1, 1, 1, 1, 1,
-1.690181, 0.4852036, -0.5145551, 1, 1, 1, 1, 1,
-1.673965, -0.3383316, -1.171614, 1, 1, 1, 1, 1,
-1.665843, 0.08137666, -0.0789083, 1, 1, 1, 1, 1,
-1.662033, -0.3983454, -2.225338, 1, 1, 1, 1, 1,
-1.659347, 1.121731, -0.135378, 1, 1, 1, 1, 1,
-1.655371, -0.9404497, -3.585415, 0, 0, 1, 1, 1,
-1.654426, 1.151823, -1.68117, 1, 0, 0, 1, 1,
-1.653693, 0.2987459, -0.8396079, 1, 0, 0, 1, 1,
-1.622581, -1.678313, -3.34147, 1, 0, 0, 1, 1,
-1.619321, -1.893834, -2.645157, 1, 0, 0, 1, 1,
-1.617744, 0.04734853, -1.405916, 1, 0, 0, 1, 1,
-1.588481, -2.002778, -2.823699, 0, 0, 0, 1, 1,
-1.583528, 0.550603, -1.23382, 0, 0, 0, 1, 1,
-1.573447, 0.01424617, -2.52441, 0, 0, 0, 1, 1,
-1.572698, 0.853426, -0.8048971, 0, 0, 0, 1, 1,
-1.567111, 0.449065, -1.154103, 0, 0, 0, 1, 1,
-1.56338, 0.85664, -0.3810434, 0, 0, 0, 1, 1,
-1.563373, -0.1322809, -1.855885, 0, 0, 0, 1, 1,
-1.561749, -0.9121138, -0.8029816, 1, 1, 1, 1, 1,
-1.553339, -0.7718052, -2.86223, 1, 1, 1, 1, 1,
-1.55043, 1.535214, -1.9089, 1, 1, 1, 1, 1,
-1.545276, 0.707956, 0.008179894, 1, 1, 1, 1, 1,
-1.532303, -0.7815301, -1.847754, 1, 1, 1, 1, 1,
-1.527979, 0.1982138, -1.889666, 1, 1, 1, 1, 1,
-1.506393, 0.3532529, -2.921479, 1, 1, 1, 1, 1,
-1.484514, -0.611322, -3.765915, 1, 1, 1, 1, 1,
-1.457913, 0.8488452, -2.336269, 1, 1, 1, 1, 1,
-1.45601, -0.635676, -2.644259, 1, 1, 1, 1, 1,
-1.454972, 0.2027912, -3.321659, 1, 1, 1, 1, 1,
-1.441633, -0.8270239, -3.28179, 1, 1, 1, 1, 1,
-1.434895, -1.02152, -2.30478, 1, 1, 1, 1, 1,
-1.417652, -0.6210099, -2.223625, 1, 1, 1, 1, 1,
-1.416671, -0.3964035, -1.732018, 1, 1, 1, 1, 1,
-1.401852, -0.8900276, -1.50702, 0, 0, 1, 1, 1,
-1.39892, 0.04861215, -2.396614, 1, 0, 0, 1, 1,
-1.394501, 0.3850539, -2.697566, 1, 0, 0, 1, 1,
-1.388906, -1.206867, -2.3892, 1, 0, 0, 1, 1,
-1.377551, 0.2577179, -1.712048, 1, 0, 0, 1, 1,
-1.374551, 0.7170557, -0.6795078, 1, 0, 0, 1, 1,
-1.373234, -1.093722, -2.76399, 0, 0, 0, 1, 1,
-1.371688, 2.660258, 0.4516042, 0, 0, 0, 1, 1,
-1.371454, -0.367829, -2.502963, 0, 0, 0, 1, 1,
-1.365493, 1.235379, -2.235807, 0, 0, 0, 1, 1,
-1.359759, -0.7770152, -1.994668, 0, 0, 0, 1, 1,
-1.357406, 1.491554, 0.7050356, 0, 0, 0, 1, 1,
-1.355763, -1.426478, -3.960552, 0, 0, 0, 1, 1,
-1.341834, -1.22141, -2.886569, 1, 1, 1, 1, 1,
-1.333881, 0.8240327, -1.241965, 1, 1, 1, 1, 1,
-1.331341, -1.282124, -3.564838, 1, 1, 1, 1, 1,
-1.326559, 0.2034376, -0.5316919, 1, 1, 1, 1, 1,
-1.325572, -0.2634275, -4.377244, 1, 1, 1, 1, 1,
-1.325366, 0.4286662, -2.280181, 1, 1, 1, 1, 1,
-1.324266, 0.5072005, -1.357197, 1, 1, 1, 1, 1,
-1.319974, 0.977802, 0.9870493, 1, 1, 1, 1, 1,
-1.309789, 0.3894776, -2.021341, 1, 1, 1, 1, 1,
-1.309303, 2.988649, -0.1889474, 1, 1, 1, 1, 1,
-1.30682, 0.748064, -0.179194, 1, 1, 1, 1, 1,
-1.294404, 0.4613615, -0.4397236, 1, 1, 1, 1, 1,
-1.291205, -0.8630478, -2.678536, 1, 1, 1, 1, 1,
-1.29088, 1.776339, -0.6048179, 1, 1, 1, 1, 1,
-1.288978, 0.07474739, -2.24947, 1, 1, 1, 1, 1,
-1.280857, -0.8103625, -1.281426, 0, 0, 1, 1, 1,
-1.276264, 0.5651659, -0.9428481, 1, 0, 0, 1, 1,
-1.269939, -0.5501739, -1.145344, 1, 0, 0, 1, 1,
-1.269703, 0.5324766, -2.226625, 1, 0, 0, 1, 1,
-1.268911, -0.9959263, -3.154293, 1, 0, 0, 1, 1,
-1.256348, -0.7221853, -1.650413, 1, 0, 0, 1, 1,
-1.253923, -0.3560097, -3.415213, 0, 0, 0, 1, 1,
-1.253857, 0.4581617, -1.018438, 0, 0, 0, 1, 1,
-1.251621, -0.2960875, -1.372319, 0, 0, 0, 1, 1,
-1.246935, 0.2567479, -1.489087, 0, 0, 0, 1, 1,
-1.24461, 1.302286, 0.8776391, 0, 0, 0, 1, 1,
-1.232448, 0.3281601, -0.4612942, 0, 0, 0, 1, 1,
-1.231113, -0.7916479, -2.067685, 0, 0, 0, 1, 1,
-1.222548, -1.11391, -0.2152343, 1, 1, 1, 1, 1,
-1.202827, 0.7939151, 0.4100431, 1, 1, 1, 1, 1,
-1.19459, -0.5441817, -1.953751, 1, 1, 1, 1, 1,
-1.192483, 1.418478, -0.1023121, 1, 1, 1, 1, 1,
-1.191886, -0.7465057, -3.354018, 1, 1, 1, 1, 1,
-1.189547, 0.5060306, -1.509819, 1, 1, 1, 1, 1,
-1.183092, 2.08938, -0.1989401, 1, 1, 1, 1, 1,
-1.171546, 1.074427, 0.02526855, 1, 1, 1, 1, 1,
-1.169301, 0.0304793, -2.263484, 1, 1, 1, 1, 1,
-1.168904, -0.3440579, -2.815558, 1, 1, 1, 1, 1,
-1.14824, -0.03464134, -3.094116, 1, 1, 1, 1, 1,
-1.134791, -1.893487, -1.658501, 1, 1, 1, 1, 1,
-1.131866, 1.623612, -0.7593281, 1, 1, 1, 1, 1,
-1.120029, -0.3105907, 0.8558146, 1, 1, 1, 1, 1,
-1.092242, 0.1643883, -2.850925, 1, 1, 1, 1, 1,
-1.082305, 0.7450224, 0.2563845, 0, 0, 1, 1, 1,
-1.070151, -0.8953515, -1.556804, 1, 0, 0, 1, 1,
-1.067678, -0.1324404, -0.1979749, 1, 0, 0, 1, 1,
-1.057184, 0.9818193, -1.589955, 1, 0, 0, 1, 1,
-1.052119, 0.2094216, -3.255522, 1, 0, 0, 1, 1,
-1.051534, 0.7968797, -1.061795, 1, 0, 0, 1, 1,
-1.047666, 0.3052074, -1.148301, 0, 0, 0, 1, 1,
-1.0372, 0.7008668, -1.681312, 0, 0, 0, 1, 1,
-1.03673, -1.507945, -2.295134, 0, 0, 0, 1, 1,
-1.036258, 1.001951, -1.801103, 0, 0, 0, 1, 1,
-1.024228, -0.3579805, -1.365784, 0, 0, 0, 1, 1,
-1.024158, -0.7059404, -2.996081, 0, 0, 0, 1, 1,
-1.023908, -0.396334, -1.551644, 0, 0, 0, 1, 1,
-0.9974231, -1.901718, -1.761475, 1, 1, 1, 1, 1,
-0.9961231, 0.2877888, -0.06971699, 1, 1, 1, 1, 1,
-0.9909192, -0.4049721, -1.471351, 1, 1, 1, 1, 1,
-0.989278, -0.994797, -2.822261, 1, 1, 1, 1, 1,
-0.981951, 1.410219, -0.97592, 1, 1, 1, 1, 1,
-0.9686922, -0.8460707, -2.122673, 1, 1, 1, 1, 1,
-0.9681005, 0.3842802, -2.373363, 1, 1, 1, 1, 1,
-0.9650957, -1.518723, -3.778589, 1, 1, 1, 1, 1,
-0.9640778, -0.6657609, -3.691654, 1, 1, 1, 1, 1,
-0.9636763, -0.6475721, -1.255857, 1, 1, 1, 1, 1,
-0.9556019, -1.631088, -2.859648, 1, 1, 1, 1, 1,
-0.954257, -0.6155155, -1.143269, 1, 1, 1, 1, 1,
-0.9493448, -1.145896, -1.066697, 1, 1, 1, 1, 1,
-0.9474303, -1.808433, -3.506504, 1, 1, 1, 1, 1,
-0.9429545, -1.313326, -2.650874, 1, 1, 1, 1, 1,
-0.9418662, 1.116547, 0.3282624, 0, 0, 1, 1, 1,
-0.9380818, -1.712836, -4.320168, 1, 0, 0, 1, 1,
-0.9379455, -1.317651, -3.582092, 1, 0, 0, 1, 1,
-0.937368, 0.1490358, -1.118184, 1, 0, 0, 1, 1,
-0.9342334, -0.1960323, -1.501854, 1, 0, 0, 1, 1,
-0.9300505, 1.096413, -1.094716, 1, 0, 0, 1, 1,
-0.9254199, 0.0084446, -2.928414, 0, 0, 0, 1, 1,
-0.9244372, -2.136127, -2.501477, 0, 0, 0, 1, 1,
-0.9231523, -1.867071, -3.161678, 0, 0, 0, 1, 1,
-0.9227539, 0.2056181, -2.054439, 0, 0, 0, 1, 1,
-0.9211761, 0.2214039, -1.882059, 0, 0, 0, 1, 1,
-0.9197379, 0.3240126, -0.3852246, 0, 0, 0, 1, 1,
-0.9190885, -1.539523, -3.561381, 0, 0, 0, 1, 1,
-0.912465, -0.6231717, -1.174671, 1, 1, 1, 1, 1,
-0.9000223, -0.7224316, -0.4962358, 1, 1, 1, 1, 1,
-0.8946412, 1.389945, -0.3606619, 1, 1, 1, 1, 1,
-0.892279, 0.7820482, -1.531916, 1, 1, 1, 1, 1,
-0.8871325, -0.3833644, -1.225008, 1, 1, 1, 1, 1,
-0.8853635, -0.2628553, -2.818083, 1, 1, 1, 1, 1,
-0.8846415, -0.4001302, -2.171765, 1, 1, 1, 1, 1,
-0.8843204, 0.02346576, -1.073756, 1, 1, 1, 1, 1,
-0.8803418, -1.259825, -3.232043, 1, 1, 1, 1, 1,
-0.8800831, -0.5247113, -1.193088, 1, 1, 1, 1, 1,
-0.8798963, 1.142675, -0.4058082, 1, 1, 1, 1, 1,
-0.8796729, 0.1883313, -2.025207, 1, 1, 1, 1, 1,
-0.8753924, -0.3140318, -1.822917, 1, 1, 1, 1, 1,
-0.8715615, -0.6056769, -2.658375, 1, 1, 1, 1, 1,
-0.8650991, 0.06513693, -2.701396, 1, 1, 1, 1, 1,
-0.8635533, 0.7098389, 0.5144367, 0, 0, 1, 1, 1,
-0.862433, -0.1958863, -1.180946, 1, 0, 0, 1, 1,
-0.8616632, 0.1351359, -1.810542, 1, 0, 0, 1, 1,
-0.8603091, 2.111158, -0.4943423, 1, 0, 0, 1, 1,
-0.859205, -0.6118888, -3.356688, 1, 0, 0, 1, 1,
-0.8512297, 0.2705653, 0.5238389, 1, 0, 0, 1, 1,
-0.8504574, 1.090446, 0.5601794, 0, 0, 0, 1, 1,
-0.8474318, -0.3335111, -0.0510762, 0, 0, 0, 1, 1,
-0.846982, 1.326629, 0.1508582, 0, 0, 0, 1, 1,
-0.8433678, -1.140993, -3.451669, 0, 0, 0, 1, 1,
-0.8405456, -1.440967, -1.779819, 0, 0, 0, 1, 1,
-0.8331062, -1.09648, -2.793232, 0, 0, 0, 1, 1,
-0.8315142, 0.9088895, -0.581535, 0, 0, 0, 1, 1,
-0.8275965, 1.383966, 1.363026, 1, 1, 1, 1, 1,
-0.8268548, 0.0179238, -2.844672, 1, 1, 1, 1, 1,
-0.8228604, -1.43382, -1.159113, 1, 1, 1, 1, 1,
-0.8201197, 0.8811025, -1.185576, 1, 1, 1, 1, 1,
-0.8159426, -2.468214, -2.570333, 1, 1, 1, 1, 1,
-0.8100684, 0.7967948, -2.854182, 1, 1, 1, 1, 1,
-0.8083135, -0.5903678, 1.084153, 1, 1, 1, 1, 1,
-0.8080975, -0.1759463, -2.275742, 1, 1, 1, 1, 1,
-0.8075668, 0.5730885, -0.5386027, 1, 1, 1, 1, 1,
-0.800707, 0.5816786, 0.03533427, 1, 1, 1, 1, 1,
-0.7983153, 1.115211, -1.137048, 1, 1, 1, 1, 1,
-0.7969488, -0.7103977, -1.784288, 1, 1, 1, 1, 1,
-0.7942027, 1.475585, -0.7580624, 1, 1, 1, 1, 1,
-0.7939307, 1.038186, -1.078165, 1, 1, 1, 1, 1,
-0.7864389, -1.683183, -3.474459, 1, 1, 1, 1, 1,
-0.7829696, 0.5701482, -1.899807, 0, 0, 1, 1, 1,
-0.782949, 1.474006, -0.649117, 1, 0, 0, 1, 1,
-0.7803097, 1.792443, -1.148286, 1, 0, 0, 1, 1,
-0.7793612, 1.143131, 0.3803274, 1, 0, 0, 1, 1,
-0.7782571, 0.457817, -1.777816, 1, 0, 0, 1, 1,
-0.7779394, 0.1240872, -0.8186576, 1, 0, 0, 1, 1,
-0.769372, -1.638884, -3.556575, 0, 0, 0, 1, 1,
-0.7689928, 0.6952332, 1.139773, 0, 0, 0, 1, 1,
-0.7671975, -0.4148532, -2.045458, 0, 0, 0, 1, 1,
-0.7648189, 0.1016414, -1.235766, 0, 0, 0, 1, 1,
-0.7647701, -0.07484131, -1.862569, 0, 0, 0, 1, 1,
-0.7631254, 1.717544, -1.659822, 0, 0, 0, 1, 1,
-0.7630597, 0.4053141, -2.50255, 0, 0, 0, 1, 1,
-0.7625999, -0.01910618, -0.5107901, 1, 1, 1, 1, 1,
-0.7558836, 0.9835526, -1.678868, 1, 1, 1, 1, 1,
-0.7528334, -0.8406667, -3.4149, 1, 1, 1, 1, 1,
-0.7523559, 1.670013, 0.05956406, 1, 1, 1, 1, 1,
-0.7516228, -1.565189, -4.884992, 1, 1, 1, 1, 1,
-0.7504873, -1.234856, -3.068062, 1, 1, 1, 1, 1,
-0.7484557, -1.533838, -3.086504, 1, 1, 1, 1, 1,
-0.7406092, -0.4485356, -2.017133, 1, 1, 1, 1, 1,
-0.740229, 2.34103, -1.705871, 1, 1, 1, 1, 1,
-0.737938, -1.221317, -2.093068, 1, 1, 1, 1, 1,
-0.7370749, -0.8258103, -2.787175, 1, 1, 1, 1, 1,
-0.7356752, 0.4441074, -0.5228718, 1, 1, 1, 1, 1,
-0.7339009, -1.236291, -2.47184, 1, 1, 1, 1, 1,
-0.7325512, 0.8544317, 0.9319889, 1, 1, 1, 1, 1,
-0.7202326, -0.5675498, -1.870771, 1, 1, 1, 1, 1,
-0.7201543, -0.4589636, -1.762125, 0, 0, 1, 1, 1,
-0.720115, 0.3685677, -1.178227, 1, 0, 0, 1, 1,
-0.7163163, -2.02556, -3.743895, 1, 0, 0, 1, 1,
-0.7159372, 1.573011, -1.288945, 1, 0, 0, 1, 1,
-0.7145991, -0.1075936, -1.993736, 1, 0, 0, 1, 1,
-0.709292, -0.5746197, -3.306943, 1, 0, 0, 1, 1,
-0.7043201, -1.10274, -3.946557, 0, 0, 0, 1, 1,
-0.698995, -1.7123, -2.495682, 0, 0, 0, 1, 1,
-0.6968575, -0.9870833, -4.734687, 0, 0, 0, 1, 1,
-0.6925144, 0.279478, -2.355428, 0, 0, 0, 1, 1,
-0.6922731, 1.265803, -1.367929, 0, 0, 0, 1, 1,
-0.690006, 0.02626404, -1.450723, 0, 0, 0, 1, 1,
-0.689945, 0.3435509, -1.253363, 0, 0, 0, 1, 1,
-0.686696, 0.9451951, -0.7056541, 1, 1, 1, 1, 1,
-0.6865727, 1.460513, -0.2461083, 1, 1, 1, 1, 1,
-0.6676235, 3.019367, 1.258484, 1, 1, 1, 1, 1,
-0.6607392, -1.182239, -0.8015422, 1, 1, 1, 1, 1,
-0.6598106, -0.2819492, -3.01862, 1, 1, 1, 1, 1,
-0.6592216, -1.7284, -1.731105, 1, 1, 1, 1, 1,
-0.6526949, 0.8074828, -0.5229014, 1, 1, 1, 1, 1,
-0.652247, -0.005437254, -2.043472, 1, 1, 1, 1, 1,
-0.6511583, 0.2657131, 0.5074292, 1, 1, 1, 1, 1,
-0.6457747, 1.467552, -1.007148, 1, 1, 1, 1, 1,
-0.6379807, -0.003517624, -2.55731, 1, 1, 1, 1, 1,
-0.6369684, -0.2183183, -1.142078, 1, 1, 1, 1, 1,
-0.6329113, 2.417205, 0.3374269, 1, 1, 1, 1, 1,
-0.6327248, 0.8974852, -0.8637826, 1, 1, 1, 1, 1,
-0.6278985, -1.250113, -5.2959, 1, 1, 1, 1, 1,
-0.6251972, -0.7332223, -1.391973, 0, 0, 1, 1, 1,
-0.6237043, 0.04574974, -2.404163, 1, 0, 0, 1, 1,
-0.6215056, 0.9180316, 0.4774664, 1, 0, 0, 1, 1,
-0.6161422, 1.221594, -0.09270566, 1, 0, 0, 1, 1,
-0.614079, -0.9034172, -2.403679, 1, 0, 0, 1, 1,
-0.6138067, 1.00145, -1.527461, 1, 0, 0, 1, 1,
-0.6135379, -0.289922, -2.074952, 0, 0, 0, 1, 1,
-0.6117316, -0.8404625, -2.025797, 0, 0, 0, 1, 1,
-0.6114928, -1.980633, -3.046555, 0, 0, 0, 1, 1,
-0.6082429, 1.058825, 1.063353, 0, 0, 0, 1, 1,
-0.6062447, -0.1244411, -2.068997, 0, 0, 0, 1, 1,
-0.604916, 0.2335431, -0.6285841, 0, 0, 0, 1, 1,
-0.5993972, -0.760875, -2.057194, 0, 0, 0, 1, 1,
-0.5991357, 0.5432398, -1.162612, 1, 1, 1, 1, 1,
-0.5964868, 0.1290708, -0.9722199, 1, 1, 1, 1, 1,
-0.5943735, -0.0117859, -2.283968, 1, 1, 1, 1, 1,
-0.5939966, -0.4555891, -1.872517, 1, 1, 1, 1, 1,
-0.5916757, -0.205231, -1.309867, 1, 1, 1, 1, 1,
-0.5911182, 0.04225986, -1.451673, 1, 1, 1, 1, 1,
-0.5841894, -1.37415, -2.870803, 1, 1, 1, 1, 1,
-0.5826085, 1.916576, 1.184629, 1, 1, 1, 1, 1,
-0.581905, -1.049317, -3.866862, 1, 1, 1, 1, 1,
-0.5809305, -1.070273, -2.695475, 1, 1, 1, 1, 1,
-0.5804731, 0.8634059, -1.586813, 1, 1, 1, 1, 1,
-0.5803428, 0.5852497, -1.466874, 1, 1, 1, 1, 1,
-0.5734589, -2.891173, -2.447075, 1, 1, 1, 1, 1,
-0.5707488, 0.893853, -2.506357, 1, 1, 1, 1, 1,
-0.5672995, 1.465173, 0.04233201, 1, 1, 1, 1, 1,
-0.5633352, -1.28343, -1.099574, 0, 0, 1, 1, 1,
-0.5631446, 1.288006, -0.4269532, 1, 0, 0, 1, 1,
-0.5615256, 0.1657128, -2.12508, 1, 0, 0, 1, 1,
-0.5608872, 0.08210117, -2.841316, 1, 0, 0, 1, 1,
-0.5569823, -1.23067, -2.1829, 1, 0, 0, 1, 1,
-0.5565663, 0.1341342, -1.537618, 1, 0, 0, 1, 1,
-0.5545268, 0.4609997, -2.092854, 0, 0, 0, 1, 1,
-0.5518927, -0.1896224, -1.561078, 0, 0, 0, 1, 1,
-0.550555, -0.4760377, 0.05830491, 0, 0, 0, 1, 1,
-0.5502663, 0.1912302, -3.220373, 0, 0, 0, 1, 1,
-0.5440275, -1.835344, -4.234172, 0, 0, 0, 1, 1,
-0.5390506, -0.3055154, -3.240512, 0, 0, 0, 1, 1,
-0.5354865, -0.3703163, -2.007001, 0, 0, 0, 1, 1,
-0.5304793, -0.4402981, -2.661169, 1, 1, 1, 1, 1,
-0.5287827, 0.4184344, -0.7505534, 1, 1, 1, 1, 1,
-0.5284083, 0.8270904, -2.092731, 1, 1, 1, 1, 1,
-0.52639, -1.267946, -2.194192, 1, 1, 1, 1, 1,
-0.5207545, 1.299449, 0.5383521, 1, 1, 1, 1, 1,
-0.5159145, 0.7105842, -0.3250686, 1, 1, 1, 1, 1,
-0.5158548, 0.6071171, -0.3282996, 1, 1, 1, 1, 1,
-0.5152756, 1.814723, 0.193247, 1, 1, 1, 1, 1,
-0.5133706, -0.9613515, -2.665078, 1, 1, 1, 1, 1,
-0.5118959, 1.122428, 0.06508223, 1, 1, 1, 1, 1,
-0.5112771, -1.321315, -3.969411, 1, 1, 1, 1, 1,
-0.5014961, 1.29454, 0.9138764, 1, 1, 1, 1, 1,
-0.5009868, -1.924539, -3.98403, 1, 1, 1, 1, 1,
-0.4999711, 0.5733017, -1.265292, 1, 1, 1, 1, 1,
-0.4918065, 1.144549, -1.180545, 1, 1, 1, 1, 1,
-0.4871562, 1.112123, -1.660223, 0, 0, 1, 1, 1,
-0.4765366, 0.688137, -0.04018435, 1, 0, 0, 1, 1,
-0.4760106, -0.6869176, -3.177129, 1, 0, 0, 1, 1,
-0.4659092, -1.095145, -3.236419, 1, 0, 0, 1, 1,
-0.4658914, -0.101402, -1.1343, 1, 0, 0, 1, 1,
-0.4641277, -0.01521047, -1.182664, 1, 0, 0, 1, 1,
-0.4610281, 0.07527953, -1.307455, 0, 0, 0, 1, 1,
-0.4562493, 2.123435, 0.5960919, 0, 0, 0, 1, 1,
-0.4560055, 0.2195545, -0.6821792, 0, 0, 0, 1, 1,
-0.4475416, 0.1460952, -1.744994, 0, 0, 0, 1, 1,
-0.4465362, -0.3335561, -2.38179, 0, 0, 0, 1, 1,
-0.4459309, 0.7479354, -0.7638384, 0, 0, 0, 1, 1,
-0.4364901, -0.3482755, -3.29263, 0, 0, 0, 1, 1,
-0.4352829, -0.4664659, -2.316741, 1, 1, 1, 1, 1,
-0.4346987, 1.171562, -1.49976, 1, 1, 1, 1, 1,
-0.4318845, 1.353381, -0.4863301, 1, 1, 1, 1, 1,
-0.4318728, 0.2069359, -2.708408, 1, 1, 1, 1, 1,
-0.4292217, -0.03810579, -2.176578, 1, 1, 1, 1, 1,
-0.423004, -1.179, -3.40332, 1, 1, 1, 1, 1,
-0.4229821, -0.9617736, -3.368329, 1, 1, 1, 1, 1,
-0.4218048, 1.335658, -0.8269625, 1, 1, 1, 1, 1,
-0.417922, 0.2137696, 1.053648, 1, 1, 1, 1, 1,
-0.4121032, -0.5979716, -3.912256, 1, 1, 1, 1, 1,
-0.4103418, 0.1282253, 0.1038635, 1, 1, 1, 1, 1,
-0.41012, 0.05379451, -2.07985, 1, 1, 1, 1, 1,
-0.4069554, -0.5102404, -2.446571, 1, 1, 1, 1, 1,
-0.4053738, 2.108253, -0.9112747, 1, 1, 1, 1, 1,
-0.4041132, -0.5408427, -2.684412, 1, 1, 1, 1, 1,
-0.4033343, -0.1001226, -3.383753, 0, 0, 1, 1, 1,
-0.3984982, -0.4371246, -2.3705, 1, 0, 0, 1, 1,
-0.3975764, -0.925108, -2.383788, 1, 0, 0, 1, 1,
-0.3968715, -1.007233, -3.354319, 1, 0, 0, 1, 1,
-0.3954504, 0.5091051, -1.340615, 1, 0, 0, 1, 1,
-0.3904434, -1.114792, -1.247684, 1, 0, 0, 1, 1,
-0.3892014, 0.0913639, -1.882001, 0, 0, 0, 1, 1,
-0.3868377, 0.9090456, -0.4270183, 0, 0, 0, 1, 1,
-0.3863431, -1.596026, -1.331115, 0, 0, 0, 1, 1,
-0.3840742, -0.2637747, -2.579928, 0, 0, 0, 1, 1,
-0.3818973, 0.3504104, -0.9161349, 0, 0, 0, 1, 1,
-0.3766853, -0.3682032, -3.245421, 0, 0, 0, 1, 1,
-0.3766564, 1.631855, -0.6342146, 0, 0, 0, 1, 1,
-0.3755743, 1.101217, -0.9123381, 1, 1, 1, 1, 1,
-0.3714252, 0.8606231, -0.06723839, 1, 1, 1, 1, 1,
-0.3710848, 0.8038479, -1.160405, 1, 1, 1, 1, 1,
-0.3703327, 0.5308616, -2.514726, 1, 1, 1, 1, 1,
-0.3699702, 0.9229617, -1.857482, 1, 1, 1, 1, 1,
-0.3699559, 0.1965536, -0.4911414, 1, 1, 1, 1, 1,
-0.3666132, -0.1892956, -3.615299, 1, 1, 1, 1, 1,
-0.3617772, -0.8449287, -2.180032, 1, 1, 1, 1, 1,
-0.361405, 1.485649, 1.282068, 1, 1, 1, 1, 1,
-0.3601141, -0.05746172, -1.32429, 1, 1, 1, 1, 1,
-0.3579206, 0.5939238, -0.9822166, 1, 1, 1, 1, 1,
-0.3472998, 1.034881, 1.325049, 1, 1, 1, 1, 1,
-0.3452686, -0.05098103, 0.387024, 1, 1, 1, 1, 1,
-0.3442249, 1.508172, 1.070827, 1, 1, 1, 1, 1,
-0.3413686, -1.980121, -2.829152, 1, 1, 1, 1, 1,
-0.3320975, 0.8621241, -0.4175078, 0, 0, 1, 1, 1,
-0.3268961, 0.2490456, -0.6285438, 1, 0, 0, 1, 1,
-0.326875, 0.3950813, -0.02055185, 1, 0, 0, 1, 1,
-0.3179923, 0.1455447, -1.196892, 1, 0, 0, 1, 1,
-0.3124339, 0.02365711, -2.968938, 1, 0, 0, 1, 1,
-0.3110918, -0.1986914, -3.189977, 1, 0, 0, 1, 1,
-0.3101608, 1.717124, -1.816149, 0, 0, 0, 1, 1,
-0.3098404, 0.5201047, -2.327123, 0, 0, 0, 1, 1,
-0.3096207, -0.7884348, -1.033184, 0, 0, 0, 1, 1,
-0.304618, -0.1630414, -2.539921, 0, 0, 0, 1, 1,
-0.3035139, 0.7192284, -0.4223478, 0, 0, 0, 1, 1,
-0.3023243, -1.140088, -2.905006, 0, 0, 0, 1, 1,
-0.3021556, -0.8096446, -2.645217, 0, 0, 0, 1, 1,
-0.3017005, -0.4899539, -1.357099, 1, 1, 1, 1, 1,
-0.301384, -1.339862, -1.333003, 1, 1, 1, 1, 1,
-0.2995633, 2.634556, -1.143635, 1, 1, 1, 1, 1,
-0.2994007, 0.7408649, -1.804802, 1, 1, 1, 1, 1,
-0.2990074, 0.6711118, 0.410163, 1, 1, 1, 1, 1,
-0.2985699, 0.21119, -0.8787363, 1, 1, 1, 1, 1,
-0.296394, -0.5132938, -3.321475, 1, 1, 1, 1, 1,
-0.2924369, -0.0671254, -1.279709, 1, 1, 1, 1, 1,
-0.2916903, -0.364258, -0.9563036, 1, 1, 1, 1, 1,
-0.2909999, 0.4109326, -2.316583, 1, 1, 1, 1, 1,
-0.2903495, -0.02850586, -2.002626, 1, 1, 1, 1, 1,
-0.2808415, 0.7196754, 0.004677254, 1, 1, 1, 1, 1,
-0.2773848, 0.757287, 0.5709636, 1, 1, 1, 1, 1,
-0.2767959, 1.210053, -1.250105, 1, 1, 1, 1, 1,
-0.2753489, 0.2512028, -1.998987, 1, 1, 1, 1, 1,
-0.2750491, 1.478303, 0.5348532, 0, 0, 1, 1, 1,
-0.265162, 1.576415, -0.8671112, 1, 0, 0, 1, 1,
-0.2651134, 0.7721604, -0.5425013, 1, 0, 0, 1, 1,
-0.2635912, 0.2825898, -0.4759747, 1, 0, 0, 1, 1,
-0.2622316, 0.322081, 0.870467, 1, 0, 0, 1, 1,
-0.2613033, -0.8268325, -3.3225, 1, 0, 0, 1, 1,
-0.2580284, 1.562854, 0.1905341, 0, 0, 0, 1, 1,
-0.2579004, -0.4580632, -3.798072, 0, 0, 0, 1, 1,
-0.2543056, -1.97402, -3.16645, 0, 0, 0, 1, 1,
-0.2502572, 1.473309, -2.215938, 0, 0, 0, 1, 1,
-0.2500862, -1.27421, -4.253002, 0, 0, 0, 1, 1,
-0.2493859, -0.1333756, -2.015338, 0, 0, 0, 1, 1,
-0.2465308, -0.07545693, -3.110864, 0, 0, 0, 1, 1,
-0.2456153, 0.6688263, -0.1952418, 1, 1, 1, 1, 1,
-0.2415164, 0.3173067, -2.691486, 1, 1, 1, 1, 1,
-0.2363286, -0.8781067, -2.490014, 1, 1, 1, 1, 1,
-0.2357142, 0.7448886, -2.410154, 1, 1, 1, 1, 1,
-0.2328036, 0.3599429, 0.3759381, 1, 1, 1, 1, 1,
-0.2294097, -0.2498149, -1.940096, 1, 1, 1, 1, 1,
-0.2251587, -0.4584852, -1.34878, 1, 1, 1, 1, 1,
-0.2237302, 0.4879714, 0.1657133, 1, 1, 1, 1, 1,
-0.219767, -1.2571, -5.476592, 1, 1, 1, 1, 1,
-0.2192934, -0.2846424, -2.951951, 1, 1, 1, 1, 1,
-0.2158619, -1.133662, -2.314364, 1, 1, 1, 1, 1,
-0.2126361, -0.5808091, -3.510324, 1, 1, 1, 1, 1,
-0.2056286, -1.449841, -1.950508, 1, 1, 1, 1, 1,
-0.2020069, -0.4233755, -2.559263, 1, 1, 1, 1, 1,
-0.2002587, 0.8018714, -0.9043916, 1, 1, 1, 1, 1,
-0.1984642, -1.737745, -3.423189, 0, 0, 1, 1, 1,
-0.1937522, -0.1472258, -2.00778, 1, 0, 0, 1, 1,
-0.1874832, -1.051022, -3.306552, 1, 0, 0, 1, 1,
-0.1847131, 0.07263993, -1.518788, 1, 0, 0, 1, 1,
-0.1826931, 2.078381, 1.546996, 1, 0, 0, 1, 1,
-0.1742045, -0.8804802, -3.584668, 1, 0, 0, 1, 1,
-0.1720696, -0.7243217, -2.301949, 0, 0, 0, 1, 1,
-0.1685634, -0.6761748, -2.587056, 0, 0, 0, 1, 1,
-0.1671972, -1.859061, -4.561066, 0, 0, 0, 1, 1,
-0.1667089, -1.70838, -1.54814, 0, 0, 0, 1, 1,
-0.1654731, 2.543231, 0.1646186, 0, 0, 0, 1, 1,
-0.1639823, -0.1144825, -1.73287, 0, 0, 0, 1, 1,
-0.1639579, -1.816512, -2.9527, 0, 0, 0, 1, 1,
-0.1636525, -0.4449537, -1.166074, 1, 1, 1, 1, 1,
-0.1635613, 0.5803621, 0.9385576, 1, 1, 1, 1, 1,
-0.1619563, -0.2926357, -1.187834, 1, 1, 1, 1, 1,
-0.1589075, 1.511037, 1.335151, 1, 1, 1, 1, 1,
-0.1540327, 1.650856, 1.476919, 1, 1, 1, 1, 1,
-0.1496436, -0.06045233, -2.823558, 1, 1, 1, 1, 1,
-0.147566, 0.1796911, -0.3390421, 1, 1, 1, 1, 1,
-0.1471984, -0.414502, -2.941275, 1, 1, 1, 1, 1,
-0.1443226, -0.4080403, -3.114831, 1, 1, 1, 1, 1,
-0.142776, 0.2882359, 0.593375, 1, 1, 1, 1, 1,
-0.1418881, -1.307016, -2.801242, 1, 1, 1, 1, 1,
-0.1342221, 0.3963485, 1.545524, 1, 1, 1, 1, 1,
-0.1298734, -1.338802, -3.772678, 1, 1, 1, 1, 1,
-0.1256679, 1.396281, 0.05537511, 1, 1, 1, 1, 1,
-0.1248478, 0.5231053, -0.8185561, 1, 1, 1, 1, 1,
-0.1169585, -0.4238665, -3.678156, 0, 0, 1, 1, 1,
-0.1147209, -0.1970419, -1.632955, 1, 0, 0, 1, 1,
-0.1141355, -0.1637569, -3.659213, 1, 0, 0, 1, 1,
-0.1128682, 0.5414256, -0.05239662, 1, 0, 0, 1, 1,
-0.1114489, 0.5418935, 0.5520754, 1, 0, 0, 1, 1,
-0.1052361, 2.104509, 0.5705479, 1, 0, 0, 1, 1,
-0.1046947, -0.3974225, -2.639184, 0, 0, 0, 1, 1,
-0.09954104, 0.1062104, -1.815039, 0, 0, 0, 1, 1,
-0.09695163, -0.9470476, -1.606279, 0, 0, 0, 1, 1,
-0.09633476, -0.7648576, -2.996023, 0, 0, 0, 1, 1,
-0.08983504, 0.2857336, -0.6703831, 0, 0, 0, 1, 1,
-0.08966513, -0.7493491, -3.737894, 0, 0, 0, 1, 1,
-0.08878478, -0.8878211, -3.675322, 0, 0, 0, 1, 1,
-0.08686413, 1.321379, 0.546611, 1, 1, 1, 1, 1,
-0.08411402, 0.549936, -0.4059107, 1, 1, 1, 1, 1,
-0.08340106, -0.7545817, -3.582917, 1, 1, 1, 1, 1,
-0.08176444, -0.3277771, -0.9079129, 1, 1, 1, 1, 1,
-0.07709967, -0.3555458, -2.79778, 1, 1, 1, 1, 1,
-0.07654031, -2.029593, -3.030587, 1, 1, 1, 1, 1,
-0.07560385, -0.6227719, -3.09969, 1, 1, 1, 1, 1,
-0.07473276, 1.435247, -0.6902218, 1, 1, 1, 1, 1,
-0.07461262, 1.744221, 2.601612, 1, 1, 1, 1, 1,
-0.07166135, 0.9721673, 1.096314, 1, 1, 1, 1, 1,
-0.06990316, 0.7830623, -1.463147, 1, 1, 1, 1, 1,
-0.06920379, 1.810121, -0.1472095, 1, 1, 1, 1, 1,
-0.06918216, -0.8176351, -3.711628, 1, 1, 1, 1, 1,
-0.06214422, -0.9619707, -4.24298, 1, 1, 1, 1, 1,
-0.05775536, -1.211053, -3.431221, 1, 1, 1, 1, 1,
-0.05331004, 0.007522728, -2.872003, 0, 0, 1, 1, 1,
-0.05170162, -0.1163689, -2.72156, 1, 0, 0, 1, 1,
-0.05157015, 0.7073838, -1.061948, 1, 0, 0, 1, 1,
-0.04582963, -0.856967, -2.65376, 1, 0, 0, 1, 1,
-0.04429277, -1.069101, -4.0697, 1, 0, 0, 1, 1,
-0.04419376, 2.213513, 0.572337, 1, 0, 0, 1, 1,
-0.04259667, -0.07933686, -4.904384, 0, 0, 0, 1, 1,
-0.04088819, -0.696969, -1.106925, 0, 0, 0, 1, 1,
-0.04047866, 0.3048129, 0.4391136, 0, 0, 0, 1, 1,
-0.03904584, -0.07952718, -3.716315, 0, 0, 0, 1, 1,
-0.03788082, -0.996231, -4.317573, 0, 0, 0, 1, 1,
-0.03684969, -1.668962, -3.892707, 0, 0, 0, 1, 1,
-0.03600039, 0.5058917, -0.8221768, 0, 0, 0, 1, 1,
-0.02859124, -1.558091, -3.111906, 1, 1, 1, 1, 1,
-0.02776429, -1.800883, -3.425003, 1, 1, 1, 1, 1,
-0.02516182, -2.756502, -2.719094, 1, 1, 1, 1, 1,
-0.02501556, 1.822074, -0.1273205, 1, 1, 1, 1, 1,
-0.01577286, 0.82535, 2.004919, 1, 1, 1, 1, 1,
-0.01357177, 1.322515, -1.315116, 1, 1, 1, 1, 1,
-0.01170979, -0.2654975, -2.988012, 1, 1, 1, 1, 1,
-0.009697419, 0.3327846, 0.1585462, 1, 1, 1, 1, 1,
-0.006432431, -0.7918844, -3.098244, 1, 1, 1, 1, 1,
-0.005800095, -1.811641, -4.019824, 1, 1, 1, 1, 1,
-0.0001759758, 0.8497841, -0.568769, 1, 1, 1, 1, 1,
0.0004561364, 1.140144, 2.420647, 1, 1, 1, 1, 1,
0.0005373393, -0.01330047, 5.044359, 1, 1, 1, 1, 1,
0.004689474, 2.158548, 0.5180796, 1, 1, 1, 1, 1,
0.007139193, -1.172303, 2.515774, 1, 1, 1, 1, 1,
0.007933373, -2.676118, 3.713778, 0, 0, 1, 1, 1,
0.008183543, 0.7464746, -0.7643533, 1, 0, 0, 1, 1,
0.008611894, -0.4855766, 1.306584, 1, 0, 0, 1, 1,
0.0106791, 0.9874356, -0.152905, 1, 0, 0, 1, 1,
0.01068688, -0.2351819, 1.333051, 1, 0, 0, 1, 1,
0.01136294, 0.9614317, -1.301781, 1, 0, 0, 1, 1,
0.01419265, -0.000835042, 2.337845, 0, 0, 0, 1, 1,
0.01585913, -0.8276283, 3.600094, 0, 0, 0, 1, 1,
0.01648448, 1.472575, -0.5760678, 0, 0, 0, 1, 1,
0.01751703, 0.6286423, -1.753195, 0, 0, 0, 1, 1,
0.01797741, -0.6270602, 2.894834, 0, 0, 0, 1, 1,
0.01815109, 0.6060378, -1.156673, 0, 0, 0, 1, 1,
0.0191799, -1.423712, 2.765108, 0, 0, 0, 1, 1,
0.02222345, 0.1287339, 0.1110684, 1, 1, 1, 1, 1,
0.02560473, -0.3682893, 1.706193, 1, 1, 1, 1, 1,
0.02762403, 0.9173121, -0.7913258, 1, 1, 1, 1, 1,
0.02934211, -0.3445331, 4.45458, 1, 1, 1, 1, 1,
0.03054203, -0.5074723, 1.281195, 1, 1, 1, 1, 1,
0.03362317, 1.902521, 0.4144408, 1, 1, 1, 1, 1,
0.03649906, -1.071694, 2.848869, 1, 1, 1, 1, 1,
0.03726514, 0.1893706, 1.461128, 1, 1, 1, 1, 1,
0.03913317, -0.2264913, 3.588953, 1, 1, 1, 1, 1,
0.03941358, -1.705108, 2.069292, 1, 1, 1, 1, 1,
0.04084704, 0.7372065, -0.9861285, 1, 1, 1, 1, 1,
0.04089206, -0.8304315, 2.232631, 1, 1, 1, 1, 1,
0.04244429, 0.4611907, -0.1339443, 1, 1, 1, 1, 1,
0.05653636, 2.804046, 0.7393723, 1, 1, 1, 1, 1,
0.05728683, 0.9541932, -0.8325821, 1, 1, 1, 1, 1,
0.05775294, 0.2339994, 0.01647031, 0, 0, 1, 1, 1,
0.0605745, 0.850706, 0.8292048, 1, 0, 0, 1, 1,
0.06515671, 1.419641, -2.051933, 1, 0, 0, 1, 1,
0.07224827, 0.3975219, -0.6995794, 1, 0, 0, 1, 1,
0.07239597, 0.5965263, -1.04539, 1, 0, 0, 1, 1,
0.072792, -1.378852, 1.879233, 1, 0, 0, 1, 1,
0.07564091, -0.4233604, 2.760955, 0, 0, 0, 1, 1,
0.07998753, -0.8780401, 2.231145, 0, 0, 0, 1, 1,
0.08533263, -1.544211, 2.268612, 0, 0, 0, 1, 1,
0.091924, 1.659689, -0.8333053, 0, 0, 0, 1, 1,
0.09252004, -1.230363, 1.996063, 0, 0, 0, 1, 1,
0.09311954, 0.3874861, 2.255018, 0, 0, 0, 1, 1,
0.09807086, 0.550481, 0.211631, 0, 0, 0, 1, 1,
0.09955006, 1.127318, 0.1122685, 1, 1, 1, 1, 1,
0.1000435, 0.8172565, 0.8540148, 1, 1, 1, 1, 1,
0.1008317, -0.3434077, 2.432305, 1, 1, 1, 1, 1,
0.10413, 0.7035893, -0.08975513, 1, 1, 1, 1, 1,
0.1047039, 0.3125874, -0.6885621, 1, 1, 1, 1, 1,
0.110154, -1.021819, 1.930695, 1, 1, 1, 1, 1,
0.1125529, -1.838108, 1.927116, 1, 1, 1, 1, 1,
0.1133898, 0.07688157, 2.239439, 1, 1, 1, 1, 1,
0.1134228, 1.053196, -0.9778042, 1, 1, 1, 1, 1,
0.1140016, 0.06869722, 0.1413042, 1, 1, 1, 1, 1,
0.1144933, -0.9077533, 3.59022, 1, 1, 1, 1, 1,
0.119629, 1.696928, 1.46156, 1, 1, 1, 1, 1,
0.1217229, -0.08610306, 1.333776, 1, 1, 1, 1, 1,
0.1221334, 1.338473, -0.1690666, 1, 1, 1, 1, 1,
0.123031, 0.5305041, 0.319596, 1, 1, 1, 1, 1,
0.1246622, 0.4626204, -1.543721, 0, 0, 1, 1, 1,
0.1252504, 1.203441, 0.5258763, 1, 0, 0, 1, 1,
0.1259307, 1.758533, 0.900136, 1, 0, 0, 1, 1,
0.1273321, 0.3749175, 0.3468758, 1, 0, 0, 1, 1,
0.1320961, 1.166848, -1.827308, 1, 0, 0, 1, 1,
0.1412037, -0.5032839, 4.111309, 1, 0, 0, 1, 1,
0.1514831, -0.6928936, 2.790329, 0, 0, 0, 1, 1,
0.1529901, -1.472632, 2.45725, 0, 0, 0, 1, 1,
0.1592139, 0.4747143, -1.038503, 0, 0, 0, 1, 1,
0.1694817, 0.1696358, -0.2987601, 0, 0, 0, 1, 1,
0.1701635, -0.9665874, 3.151055, 0, 0, 0, 1, 1,
0.1703443, -0.2270771, 2.223444, 0, 0, 0, 1, 1,
0.1720724, -0.8613207, 3.068951, 0, 0, 0, 1, 1,
0.1733646, -0.5384018, 3.933949, 1, 1, 1, 1, 1,
0.1751389, -1.062952, 2.058601, 1, 1, 1, 1, 1,
0.1751462, -0.6799481, 4.072739, 1, 1, 1, 1, 1,
0.1769489, -0.6203245, 2.223484, 1, 1, 1, 1, 1,
0.181378, 0.278222, 1.8845, 1, 1, 1, 1, 1,
0.1832217, 0.5770382, -2.299228, 1, 1, 1, 1, 1,
0.1867731, -0.4489959, 2.166222, 1, 1, 1, 1, 1,
0.1903128, -1.638365, 5.175607, 1, 1, 1, 1, 1,
0.193888, 1.491687, -1.434102, 1, 1, 1, 1, 1,
0.1954775, -0.5067968, 3.746893, 1, 1, 1, 1, 1,
0.1964074, -0.07701191, 3.5802, 1, 1, 1, 1, 1,
0.1979451, 0.1094907, 1.228277, 1, 1, 1, 1, 1,
0.2074033, -0.01046172, 2.402263, 1, 1, 1, 1, 1,
0.2088167, -0.4528674, 1.864364, 1, 1, 1, 1, 1,
0.2134146, -0.6032873, 3.536135, 1, 1, 1, 1, 1,
0.2191173, -1.226703, 2.604998, 0, 0, 1, 1, 1,
0.222074, -0.6289644, 2.456288, 1, 0, 0, 1, 1,
0.2255775, -1.765654, 2.039848, 1, 0, 0, 1, 1,
0.2295081, 1.115598, -0.006415229, 1, 0, 0, 1, 1,
0.2298494, -0.6466432, 3.512851, 1, 0, 0, 1, 1,
0.2344622, -1.516963, 1.493724, 1, 0, 0, 1, 1,
0.2348172, 2.259182, 0.121449, 0, 0, 0, 1, 1,
0.2348567, -0.5079986, 2.055052, 0, 0, 0, 1, 1,
0.2402964, 1.144668, -0.5476138, 0, 0, 0, 1, 1,
0.2418564, 0.7030161, 0.97119, 0, 0, 0, 1, 1,
0.2425179, 0.9664769, -0.6400456, 0, 0, 0, 1, 1,
0.2436346, 0.4377378, 0.8300777, 0, 0, 0, 1, 1,
0.2456389, -0.4815942, 2.040739, 0, 0, 0, 1, 1,
0.2521259, 2.526609, -1.18155, 1, 1, 1, 1, 1,
0.254066, -0.9074518, 2.898452, 1, 1, 1, 1, 1,
0.2557715, 0.3453687, 0.9927951, 1, 1, 1, 1, 1,
0.2609541, -0.1134264, 0.9005793, 1, 1, 1, 1, 1,
0.2631408, -0.2945393, 2.97313, 1, 1, 1, 1, 1,
0.2632618, 0.2035335, 1.761557, 1, 1, 1, 1, 1,
0.2747189, -0.5009559, 3.482733, 1, 1, 1, 1, 1,
0.2794566, -1.210407, 3.443725, 1, 1, 1, 1, 1,
0.2813547, 0.2091096, 1.785763, 1, 1, 1, 1, 1,
0.2817357, -0.8646663, 3.480025, 1, 1, 1, 1, 1,
0.2848327, 0.1557644, 2.454312, 1, 1, 1, 1, 1,
0.2894605, 0.5576175, 0.3011705, 1, 1, 1, 1, 1,
0.2913131, 0.3551611, 0.2586493, 1, 1, 1, 1, 1,
0.2922579, 1.93083, 1.30945, 1, 1, 1, 1, 1,
0.2929641, 0.901013, -0.5409253, 1, 1, 1, 1, 1,
0.2935133, -0.4620295, 2.948086, 0, 0, 1, 1, 1,
0.2984034, 0.1284321, 0.1451624, 1, 0, 0, 1, 1,
0.3002806, -0.7757385, 1.357061, 1, 0, 0, 1, 1,
0.3010126, -2.286809, 2.352478, 1, 0, 0, 1, 1,
0.3010589, 1.379385, 0.4442455, 1, 0, 0, 1, 1,
0.3016659, 1.671611, 0.283917, 1, 0, 0, 1, 1,
0.3029971, -0.379612, 1.621366, 0, 0, 0, 1, 1,
0.3061804, 0.3260062, 1.018295, 0, 0, 0, 1, 1,
0.3071136, -0.109451, 1.093263, 0, 0, 0, 1, 1,
0.3086666, -1.306518, 4.14381, 0, 0, 0, 1, 1,
0.3141348, 0.08755083, 1.135231, 0, 0, 0, 1, 1,
0.3145289, -0.8418723, 1.705753, 0, 0, 0, 1, 1,
0.3155741, -0.009898618, 0.9696782, 0, 0, 0, 1, 1,
0.3157753, -1.623823, 2.031747, 1, 1, 1, 1, 1,
0.3174643, 0.448094, 0.02742037, 1, 1, 1, 1, 1,
0.3183878, -0.1023648, 0.7691255, 1, 1, 1, 1, 1,
0.3206578, -0.7403498, 1.868077, 1, 1, 1, 1, 1,
0.3227549, 1.096532, -0.02969146, 1, 1, 1, 1, 1,
0.3237603, 1.724393, 1.485293, 1, 1, 1, 1, 1,
0.3324198, -0.3415717, 1.65965, 1, 1, 1, 1, 1,
0.33268, -0.2134682, 3.632561, 1, 1, 1, 1, 1,
0.3333259, -0.4385094, 1.543896, 1, 1, 1, 1, 1,
0.3334653, 1.130667, 1.797644, 1, 1, 1, 1, 1,
0.342283, 0.1825105, 0.6035641, 1, 1, 1, 1, 1,
0.3424341, -1.210459, 1.930999, 1, 1, 1, 1, 1,
0.344644, 1.5449, -0.4814961, 1, 1, 1, 1, 1,
0.3480374, -1.887179, 4.383713, 1, 1, 1, 1, 1,
0.3500862, -1.857024, 4.272097, 1, 1, 1, 1, 1,
0.3524525, -0.1230044, 2.552506, 0, 0, 1, 1, 1,
0.3559343, 0.8534344, -0.8045721, 1, 0, 0, 1, 1,
0.35644, -1.410887, 4.310032, 1, 0, 0, 1, 1,
0.3635179, -0.1232568, 2.082436, 1, 0, 0, 1, 1,
0.3653748, 0.8006855, 1.586076, 1, 0, 0, 1, 1,
0.3663139, 0.1710665, -1.154997, 1, 0, 0, 1, 1,
0.3746788, -1.64305, 3.738959, 0, 0, 0, 1, 1,
0.3797625, -0.07779817, 3.025037, 0, 0, 0, 1, 1,
0.3807093, 1.887852, 1.424135, 0, 0, 0, 1, 1,
0.3841409, 0.1155331, 0.9346701, 0, 0, 0, 1, 1,
0.3854672, -2.090549, 3.396942, 0, 0, 0, 1, 1,
0.3870359, -0.08646917, 2.987192, 0, 0, 0, 1, 1,
0.3885018, 1.265717, -1.098408, 0, 0, 0, 1, 1,
0.3891033, 2.060986, 1.001905, 1, 1, 1, 1, 1,
0.3910914, -0.7411321, 2.222371, 1, 1, 1, 1, 1,
0.3944269, 0.7721865, 1.621339, 1, 1, 1, 1, 1,
0.394546, -0.6255773, 2.055421, 1, 1, 1, 1, 1,
0.4041665, -0.9932438, 0.7486674, 1, 1, 1, 1, 1,
0.4057288, -0.3303038, 3.586598, 1, 1, 1, 1, 1,
0.4069341, -0.2184991, 1.334559, 1, 1, 1, 1, 1,
0.4071122, 0.5960199, 0.5996825, 1, 1, 1, 1, 1,
0.4090251, 0.1256712, 2.514715, 1, 1, 1, 1, 1,
0.4092027, 0.4106115, 0.9991516, 1, 1, 1, 1, 1,
0.4137703, -0.8959216, 1.672758, 1, 1, 1, 1, 1,
0.4160886, 1.068124, 0.05329872, 1, 1, 1, 1, 1,
0.4183692, 0.190526, 3.404191, 1, 1, 1, 1, 1,
0.4245694, -0.4592395, 1.611298, 1, 1, 1, 1, 1,
0.4251432, 0.1059489, 0.814629, 1, 1, 1, 1, 1,
0.42725, -0.4376563, 2.732594, 0, 0, 1, 1, 1,
0.429647, 0.3857308, 0.6875331, 1, 0, 0, 1, 1,
0.4307294, -2.134839, 2.248952, 1, 0, 0, 1, 1,
0.4331294, -2.750196, 2.555345, 1, 0, 0, 1, 1,
0.4387791, -0.6302729, 3.169456, 1, 0, 0, 1, 1,
0.4396695, -0.1521644, 1.570284, 1, 0, 0, 1, 1,
0.4445919, 0.7369217, -0.06820296, 0, 0, 0, 1, 1,
0.4452993, 0.1187954, 1.472905, 0, 0, 0, 1, 1,
0.4493014, -0.4180586, 1.431183, 0, 0, 0, 1, 1,
0.449943, -0.8175598, 4.232939, 0, 0, 0, 1, 1,
0.4507299, -1.966837, 3.932713, 0, 0, 0, 1, 1,
0.4515282, 0.529752, 1.585067, 0, 0, 0, 1, 1,
0.4535207, 0.8036697, 0.5690262, 0, 0, 0, 1, 1,
0.4556652, 2.219707, -0.8550972, 1, 1, 1, 1, 1,
0.4586303, 0.4147182, -0.6053824, 1, 1, 1, 1, 1,
0.4594498, 0.8082156, -0.1210923, 1, 1, 1, 1, 1,
0.4619386, 0.9863334, 0.2206874, 1, 1, 1, 1, 1,
0.4734133, 1.563496, -0.1309659, 1, 1, 1, 1, 1,
0.474836, 0.4164401, -0.0835666, 1, 1, 1, 1, 1,
0.4770911, 0.03225521, 2.889641, 1, 1, 1, 1, 1,
0.4779338, -0.286299, 3.235759, 1, 1, 1, 1, 1,
0.478017, -0.821759, 2.230647, 1, 1, 1, 1, 1,
0.4814419, -0.716937, 3.889939, 1, 1, 1, 1, 1,
0.4854993, -0.4361901, 2.493074, 1, 1, 1, 1, 1,
0.497663, -1.126168, 2.236902, 1, 1, 1, 1, 1,
0.4993283, 1.854964, 0.36632, 1, 1, 1, 1, 1,
0.5055272, -0.9039522, 0.5198036, 1, 1, 1, 1, 1,
0.509275, 0.1422622, 1.114331, 1, 1, 1, 1, 1,
0.510496, 1.61428, -0.2087757, 0, 0, 1, 1, 1,
0.5108119, -0.613821, 3.130154, 1, 0, 0, 1, 1,
0.5191004, -0.472919, 3.247708, 1, 0, 0, 1, 1,
0.5204521, -1.859507, 2.352067, 1, 0, 0, 1, 1,
0.5211772, 0.8191273, -0.3290751, 1, 0, 0, 1, 1,
0.5253294, 0.5717376, 0.2477687, 1, 0, 0, 1, 1,
0.5263828, -1.492662, 1.710096, 0, 0, 0, 1, 1,
0.5274747, -0.006676437, 2.911313, 0, 0, 0, 1, 1,
0.5309085, 2.653087, -1.350779, 0, 0, 0, 1, 1,
0.5344117, 0.6811534, 0.2634172, 0, 0, 0, 1, 1,
0.534944, 2.369416, -0.2800873, 0, 0, 0, 1, 1,
0.5377225, -2.215808, 3.9033, 0, 0, 0, 1, 1,
0.5384609, 0.4978038, 1.234539, 0, 0, 0, 1, 1,
0.5484859, 0.5438088, 0.7992798, 1, 1, 1, 1, 1,
0.5498902, 0.1358297, -0.06891608, 1, 1, 1, 1, 1,
0.5549204, 0.009234531, -0.6242056, 1, 1, 1, 1, 1,
0.5565162, -1.499778, 0.8996534, 1, 1, 1, 1, 1,
0.5573425, -0.1522393, 0.54605, 1, 1, 1, 1, 1,
0.5575935, -2.244819, 3.619061, 1, 1, 1, 1, 1,
0.562987, 0.02693496, 0.7883611, 1, 1, 1, 1, 1,
0.5679604, 0.7732117, 1.263622, 1, 1, 1, 1, 1,
0.5699973, -0.4314456, 3.450814, 1, 1, 1, 1, 1,
0.5706484, -0.2291183, 1.411225, 1, 1, 1, 1, 1,
0.5746303, -1.038361, 5.527761, 1, 1, 1, 1, 1,
0.5747126, 0.9094216, 0.6486301, 1, 1, 1, 1, 1,
0.576337, -0.0648539, 2.613432, 1, 1, 1, 1, 1,
0.5789922, -1.502193, 2.048226, 1, 1, 1, 1, 1,
0.5800788, -0.1311534, 1.165068, 1, 1, 1, 1, 1,
0.582059, 1.819625, 1.090993, 0, 0, 1, 1, 1,
0.5842286, -1.970832, 1.919679, 1, 0, 0, 1, 1,
0.5872928, 0.1254952, 0.4297354, 1, 0, 0, 1, 1,
0.5880696, -0.5728673, 2.875316, 1, 0, 0, 1, 1,
0.5881255, -0.1615858, 0.5694853, 1, 0, 0, 1, 1,
0.5888283, 0.8448382, 0.5696588, 1, 0, 0, 1, 1,
0.5899708, -0.5370709, 3.045306, 0, 0, 0, 1, 1,
0.5922861, 0.9322664, -0.6196367, 0, 0, 0, 1, 1,
0.5949436, -0.5027589, 2.600364, 0, 0, 0, 1, 1,
0.5950195, -0.7958016, 3.592201, 0, 0, 0, 1, 1,
0.6002857, 1.503734, 0.648852, 0, 0, 0, 1, 1,
0.6003236, 0.7956685, -2.085064, 0, 0, 0, 1, 1,
0.6034778, -0.08902471, 0.3376113, 0, 0, 0, 1, 1,
0.6144873, -0.5123821, 3.823269, 1, 1, 1, 1, 1,
0.6151414, 0.7921041, 0.6799924, 1, 1, 1, 1, 1,
0.615782, -0.8930615, 1.090106, 1, 1, 1, 1, 1,
0.6171235, 1.262852, -0.00105996, 1, 1, 1, 1, 1,
0.6187618, -1.349723, 2.030249, 1, 1, 1, 1, 1,
0.6204214, 0.9406014, 1.233693, 1, 1, 1, 1, 1,
0.6213795, -1.182826, 1.982342, 1, 1, 1, 1, 1,
0.6224714, 0.9646188, -0.02312251, 1, 1, 1, 1, 1,
0.6236036, 1.579771, 0.5374196, 1, 1, 1, 1, 1,
0.6238772, -0.6847435, 1.596866, 1, 1, 1, 1, 1,
0.6263818, -0.348833, 1.738802, 1, 1, 1, 1, 1,
0.638192, -1.132676, 3.835549, 1, 1, 1, 1, 1,
0.6385043, 0.4634304, -0.4258307, 1, 1, 1, 1, 1,
0.6388304, 1.512735, -0.04976572, 1, 1, 1, 1, 1,
0.6394723, 1.12402, 1.433841, 1, 1, 1, 1, 1,
0.6448483, -0.7489825, 3.17769, 0, 0, 1, 1, 1,
0.6462288, 1.653354, -0.543063, 1, 0, 0, 1, 1,
0.6526831, 1.558222, -0.5958081, 1, 0, 0, 1, 1,
0.6708317, 0.05160347, 1.661925, 1, 0, 0, 1, 1,
0.6775154, 1.436308, -0.4579494, 1, 0, 0, 1, 1,
0.6783115, 0.7027843, 0.2351083, 1, 0, 0, 1, 1,
0.6826649, -2.265395, 3.012217, 0, 0, 0, 1, 1,
0.6831943, -0.7521859, 2.32999, 0, 0, 0, 1, 1,
0.6857035, 1.47877, 1.815715, 0, 0, 0, 1, 1,
0.6859059, -1.315709, 2.030059, 0, 0, 0, 1, 1,
0.6879473, -0.02583753, 0.948173, 0, 0, 0, 1, 1,
0.6891615, -1.668383, 2.962114, 0, 0, 0, 1, 1,
0.6993736, -0.0423236, 1.347045, 0, 0, 0, 1, 1,
0.7054842, 0.4353537, 1.077027, 1, 1, 1, 1, 1,
0.7059382, -0.8036734, 2.962728, 1, 1, 1, 1, 1,
0.7067363, 0.6979782, -0.5531549, 1, 1, 1, 1, 1,
0.707239, 1.021114, 2.55789, 1, 1, 1, 1, 1,
0.7157047, 1.048365, 1.459887, 1, 1, 1, 1, 1,
0.7183467, -0.05591052, 0.9918932, 1, 1, 1, 1, 1,
0.7185945, 0.1515429, 0.5479053, 1, 1, 1, 1, 1,
0.7210145, 0.848525, -0.4977545, 1, 1, 1, 1, 1,
0.7218741, -1.428533, 3.165003, 1, 1, 1, 1, 1,
0.7220837, 0.4837109, -0.3720744, 1, 1, 1, 1, 1,
0.722647, 0.1536485, 1.553935, 1, 1, 1, 1, 1,
0.7232838, -0.3117082, 0.8161995, 1, 1, 1, 1, 1,
0.7241451, 1.395021, 0.2723241, 1, 1, 1, 1, 1,
0.7269064, 0.1436142, 1.285191, 1, 1, 1, 1, 1,
0.7336357, -0.3385097, 3.787461, 1, 1, 1, 1, 1,
0.7443012, -1.644687, 3.865575, 0, 0, 1, 1, 1,
0.7475067, 2.259073, -0.09660402, 1, 0, 0, 1, 1,
0.7627214, -0.2491221, 2.257412, 1, 0, 0, 1, 1,
0.7633448, -0.8669423, 0.0175857, 1, 0, 0, 1, 1,
0.7667879, -1.165098, 1.597043, 1, 0, 0, 1, 1,
0.776307, 1.335202, 1.223077, 1, 0, 0, 1, 1,
0.7780354, 0.8198765, 1.71938, 0, 0, 0, 1, 1,
0.7796525, -1.650882, 2.920385, 0, 0, 0, 1, 1,
0.7849174, 0.248803, 0.2286276, 0, 0, 0, 1, 1,
0.7950826, 0.4756612, 1.261615, 0, 0, 0, 1, 1,
0.7999874, -0.4756875, 2.31986, 0, 0, 0, 1, 1,
0.8002358, -0.3985239, 2.516858, 0, 0, 0, 1, 1,
0.8038878, 0.1293253, 2.977656, 0, 0, 0, 1, 1,
0.8067842, 1.059347, 1.240869, 1, 1, 1, 1, 1,
0.8094642, 0.1550366, 0.2815285, 1, 1, 1, 1, 1,
0.8169814, -0.1833517, 1.532683, 1, 1, 1, 1, 1,
0.8246815, 0.8403612, -0.4797858, 1, 1, 1, 1, 1,
0.8252627, 0.628328, 0.4220926, 1, 1, 1, 1, 1,
0.8264154, -0.2009015, 1.320808, 1, 1, 1, 1, 1,
0.8313888, 0.06696904, -0.2872832, 1, 1, 1, 1, 1,
0.8362382, -0.5170048, 2.212078, 1, 1, 1, 1, 1,
0.836594, 0.5794422, -0.4391405, 1, 1, 1, 1, 1,
0.8408762, -0.4568298, 2.299569, 1, 1, 1, 1, 1,
0.8478423, 0.3244242, 1.867155, 1, 1, 1, 1, 1,
0.8478852, -0.5679654, 4.191329, 1, 1, 1, 1, 1,
0.8513733, -0.1026514, 3.282351, 1, 1, 1, 1, 1,
0.8530909, -0.548647, 1.478606, 1, 1, 1, 1, 1,
0.8536188, -0.5539492, 2.650907, 1, 1, 1, 1, 1,
0.8660936, 1.062163, 0.9775668, 0, 0, 1, 1, 1,
0.87034, 0.5023217, 0.4132601, 1, 0, 0, 1, 1,
0.871042, 0.3592037, 1.711671, 1, 0, 0, 1, 1,
0.8777542, -0.9453279, 1.628204, 1, 0, 0, 1, 1,
0.8821979, -0.4428137, 3.752177, 1, 0, 0, 1, 1,
0.8837411, -0.5899413, 1.657833, 1, 0, 0, 1, 1,
0.908078, 0.5641854, 1.059133, 0, 0, 0, 1, 1,
0.9190342, -0.579033, 1.863248, 0, 0, 0, 1, 1,
0.9214507, -0.9951243, 3.636307, 0, 0, 0, 1, 1,
0.9249171, 0.007043697, 1.955341, 0, 0, 0, 1, 1,
0.9279835, -0.1452024, 1.590605, 0, 0, 0, 1, 1,
0.9300786, 0.2306671, 1.816834, 0, 0, 0, 1, 1,
0.9356877, -0.9510242, 2.78777, 0, 0, 0, 1, 1,
0.9422125, 1.319563, 1.235306, 1, 1, 1, 1, 1,
0.942654, 0.296638, 0.08820253, 1, 1, 1, 1, 1,
0.944573, -1.004369, 2.139386, 1, 1, 1, 1, 1,
0.9471722, 0.7547042, 0.3226268, 1, 1, 1, 1, 1,
0.9494717, 0.6415523, -0.2349424, 1, 1, 1, 1, 1,
0.9601667, 0.9058969, 1.563811, 1, 1, 1, 1, 1,
0.9691762, -0.1126628, 0.02539613, 1, 1, 1, 1, 1,
0.9856473, 0.9080495, 2.010981, 1, 1, 1, 1, 1,
0.9860054, 0.1726409, 2.653368, 1, 1, 1, 1, 1,
0.9864584, 0.7822959, 0.2805869, 1, 1, 1, 1, 1,
0.9875634, 0.1157416, 0.914961, 1, 1, 1, 1, 1,
0.9890681, 1.670932, 1.148523, 1, 1, 1, 1, 1,
0.9912214, -0.4560904, 1.991188, 1, 1, 1, 1, 1,
0.9934649, -0.2048412, 1.951895, 1, 1, 1, 1, 1,
0.9939782, 0.435312, 2.98157, 1, 1, 1, 1, 1,
1.000065, -0.2054751, 1.979768, 0, 0, 1, 1, 1,
1.003438, 0.4620157, 0.571669, 1, 0, 0, 1, 1,
1.004862, -1.210136, 1.887202, 1, 0, 0, 1, 1,
1.005084, -0.8897735, 2.471054, 1, 0, 0, 1, 1,
1.008012, 0.4457905, 0.2901688, 1, 0, 0, 1, 1,
1.012162, -0.4267638, 2.464791, 1, 0, 0, 1, 1,
1.019468, -0.188125, 2.26033, 0, 0, 0, 1, 1,
1.022168, 1.091073, 0.1492977, 0, 0, 0, 1, 1,
1.02407, -0.6939463, 3.320855, 0, 0, 0, 1, 1,
1.027359, -0.05139368, 0.9803601, 0, 0, 0, 1, 1,
1.031697, -0.149291, 2.316431, 0, 0, 0, 1, 1,
1.036801, 2.809666, -0.1821457, 0, 0, 0, 1, 1,
1.052653, 1.051437, 0.2320518, 0, 0, 0, 1, 1,
1.066208, -0.3213448, 1.987366, 1, 1, 1, 1, 1,
1.067136, -0.2732711, 2.001121, 1, 1, 1, 1, 1,
1.086506, -0.01787116, 1.714131, 1, 1, 1, 1, 1,
1.100019, 0.2421189, 0.951525, 1, 1, 1, 1, 1,
1.105809, -0.3306314, 1.175226, 1, 1, 1, 1, 1,
1.109371, 1.731524, 1.040502, 1, 1, 1, 1, 1,
1.112856, -2.117291, 3.302011, 1, 1, 1, 1, 1,
1.112975, 0.1923896, 2.92726, 1, 1, 1, 1, 1,
1.113077, -0.9671347, 2.276418, 1, 1, 1, 1, 1,
1.126591, -0.2151883, -0.3331644, 1, 1, 1, 1, 1,
1.131065, -1.320704, 2.884457, 1, 1, 1, 1, 1,
1.138745, 1.241363, 0.2620248, 1, 1, 1, 1, 1,
1.148807, -0.2247006, 0.8083815, 1, 1, 1, 1, 1,
1.159744, 0.654125, 1.578037, 1, 1, 1, 1, 1,
1.163885, 1.086629, 1.330303, 1, 1, 1, 1, 1,
1.177832, 0.03744017, 2.389394, 0, 0, 1, 1, 1,
1.178186, -0.1459289, -0.8559591, 1, 0, 0, 1, 1,
1.185104, 0.3640017, 2.837261, 1, 0, 0, 1, 1,
1.191899, 0.2037469, 1.829572, 1, 0, 0, 1, 1,
1.19876, 1.829846, -1.157545, 1, 0, 0, 1, 1,
1.201586, -0.6332658, 1.065318, 1, 0, 0, 1, 1,
1.20259, -0.07045566, 3.0918, 0, 0, 0, 1, 1,
1.209164, 0.9258113, 2.213254, 0, 0, 0, 1, 1,
1.214439, -0.2347604, 0.7379628, 0, 0, 0, 1, 1,
1.21518, -0.4986473, 2.147692, 0, 0, 0, 1, 1,
1.221586, 1.827325, -1.16016, 0, 0, 0, 1, 1,
1.224378, -0.6627821, 1.67219, 0, 0, 0, 1, 1,
1.233207, -2.242787, 2.262565, 0, 0, 0, 1, 1,
1.2347, -1.916376, 4.040149, 1, 1, 1, 1, 1,
1.235048, -0.3072608, 1.725521, 1, 1, 1, 1, 1,
1.241103, 2.462878, 1.999444, 1, 1, 1, 1, 1,
1.251005, 0.2210105, 1.698599, 1, 1, 1, 1, 1,
1.252259, -1.305312, 2.584688, 1, 1, 1, 1, 1,
1.278447, 1.786831, -0.35126, 1, 1, 1, 1, 1,
1.280061, -1.73233, 2.520412, 1, 1, 1, 1, 1,
1.283885, 0.02124075, 1.556441, 1, 1, 1, 1, 1,
1.297808, 1.16788, 0.6363025, 1, 1, 1, 1, 1,
1.303089, 0.8553911, 0.3847944, 1, 1, 1, 1, 1,
1.308339, 1.312993, 0.2589747, 1, 1, 1, 1, 1,
1.308345, -1.714003, 3.026519, 1, 1, 1, 1, 1,
1.317662, -1.318708, 3.085413, 1, 1, 1, 1, 1,
1.317673, -0.07675695, 0.7352803, 1, 1, 1, 1, 1,
1.327203, 1.211648, 2.29054, 1, 1, 1, 1, 1,
1.350012, 0.03581713, 1.401974, 0, 0, 1, 1, 1,
1.350546, 0.0259111, 2.277474, 1, 0, 0, 1, 1,
1.352352, 0.9383689, 1.18929, 1, 0, 0, 1, 1,
1.354636, -0.5519372, 2.489025, 1, 0, 0, 1, 1,
1.367797, 1.219471, 0.3287587, 1, 0, 0, 1, 1,
1.368481, -0.4996316, 3.233992, 1, 0, 0, 1, 1,
1.391343, -1.197958, 1.598224, 0, 0, 0, 1, 1,
1.394452, -1.310009, 2.015231, 0, 0, 0, 1, 1,
1.404528, -0.6700824, 3.859025, 0, 0, 0, 1, 1,
1.432272, 0.2333712, 1.861779, 0, 0, 0, 1, 1,
1.459391, 0.5959907, -0.3803435, 0, 0, 0, 1, 1,
1.467861, 0.5481383, 0.640121, 0, 0, 0, 1, 1,
1.468107, -0.5599694, 3.4303, 0, 0, 0, 1, 1,
1.475207, 0.3496482, 2.943294, 1, 1, 1, 1, 1,
1.478928, 0.5984696, 0.5757971, 1, 1, 1, 1, 1,
1.521233, -0.6119181, 1.390121, 1, 1, 1, 1, 1,
1.527399, -0.02343853, 1.341746, 1, 1, 1, 1, 1,
1.547621, 0.9064644, 2.085819, 1, 1, 1, 1, 1,
1.5503, -0.05219144, 2.172402, 1, 1, 1, 1, 1,
1.55362, 1.165684, 0.6713427, 1, 1, 1, 1, 1,
1.560007, 0.4758061, 1.451774, 1, 1, 1, 1, 1,
1.56497, -0.5402733, 1.820149, 1, 1, 1, 1, 1,
1.567291, -0.3119213, 1.333942, 1, 1, 1, 1, 1,
1.569248, 0.7684388, 3.209434, 1, 1, 1, 1, 1,
1.574104, 0.04715412, 0.08994794, 1, 1, 1, 1, 1,
1.591024, 1.044706, 0.09624428, 1, 1, 1, 1, 1,
1.591873, -0.4803031, 3.280473, 1, 1, 1, 1, 1,
1.610765, -0.7245085, 3.16731, 1, 1, 1, 1, 1,
1.627833, 0.1672569, 1.165674, 0, 0, 1, 1, 1,
1.645008, 1.273205, 0.3602398, 1, 0, 0, 1, 1,
1.676941, 0.1412141, 1.036131, 1, 0, 0, 1, 1,
1.679873, -0.5871639, 1.814219, 1, 0, 0, 1, 1,
1.702702, 0.7360481, 2.358293, 1, 0, 0, 1, 1,
1.71903, 0.4242572, 3.152762, 1, 0, 0, 1, 1,
1.738557, 0.4202017, 0.2689727, 0, 0, 0, 1, 1,
1.746054, 1.370868, 0.5123205, 0, 0, 0, 1, 1,
1.751104, -0.7582141, 2.256562, 0, 0, 0, 1, 1,
1.751313, 0.9545956, 1.917319, 0, 0, 0, 1, 1,
1.764694, -0.4467545, 2.228044, 0, 0, 0, 1, 1,
1.786071, -0.2252882, 0.8149872, 0, 0, 0, 1, 1,
1.806667, -0.5627553, 1.559594, 0, 0, 0, 1, 1,
1.814875, 0.6853927, 1.059635, 1, 1, 1, 1, 1,
1.837509, -0.285934, 1.950701, 1, 1, 1, 1, 1,
1.857923, -0.2044846, 0.1395002, 1, 1, 1, 1, 1,
1.859796, 0.8810121, 1.894802, 1, 1, 1, 1, 1,
1.872449, -0.2938239, 0.810537, 1, 1, 1, 1, 1,
1.873827, -1.054753, 2.629607, 1, 1, 1, 1, 1,
1.878268, -0.00838935, 3.856596, 1, 1, 1, 1, 1,
1.927927, 0.8355404, 0.9911377, 1, 1, 1, 1, 1,
1.954901, 1.366393, 0.7148108, 1, 1, 1, 1, 1,
1.963285, -0.7679213, 2.219286, 1, 1, 1, 1, 1,
1.963714, -1.394279, 4.929955, 1, 1, 1, 1, 1,
1.969524, -0.4077488, 1.730018, 1, 1, 1, 1, 1,
1.993463, 2.024131, 1.615723, 1, 1, 1, 1, 1,
2.005245, -0.411828, 2.604478, 1, 1, 1, 1, 1,
2.014255, 1.419264, 3.665792, 1, 1, 1, 1, 1,
2.017678, -0.2891713, 1.035816, 0, 0, 1, 1, 1,
2.032165, -1.82962, 3.353379, 1, 0, 0, 1, 1,
2.057688, 0.3828194, 1.44487, 1, 0, 0, 1, 1,
2.084646, -1.573675, 2.38905, 1, 0, 0, 1, 1,
2.104177, 0.5852031, 0.05070816, 1, 0, 0, 1, 1,
2.180171, -2.151194, 2.483772, 1, 0, 0, 1, 1,
2.186114, 1.275241, 1.654034, 0, 0, 0, 1, 1,
2.20124, 0.3611891, 0.4186131, 0, 0, 0, 1, 1,
2.206501, 0.8487907, 0.0391881, 0, 0, 0, 1, 1,
2.238038, 0.6874081, 2.998368, 0, 0, 0, 1, 1,
2.314454, -0.6204202, 2.681429, 0, 0, 0, 1, 1,
2.391268, -0.4900168, 1.527928, 0, 0, 0, 1, 1,
2.420685, 1.078381, 1.519605, 0, 0, 0, 1, 1,
2.481059, -0.05347195, 1.713896, 1, 1, 1, 1, 1,
2.592393, -1.206752, 1.217995, 1, 1, 1, 1, 1,
2.716439, 1.151497, -0.3469431, 1, 1, 1, 1, 1,
2.744307, -0.6294084, 2.96703, 1, 1, 1, 1, 1,
2.84454, 1.918849, 1.189222, 1, 1, 1, 1, 1,
3.031826, 2.214857, 3.530921, 1, 1, 1, 1, 1,
3.312961, -0.7237656, 3.781774, 1, 1, 1, 1, 1
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
var radius = 9.692411;
var distance = 34.04419;
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
mvMatrix.translate( 0.127337, -0.06409681, -0.02558446 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.04419);
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
