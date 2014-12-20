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
-2.96375, 0.1901465, -2.184884, 1, 0, 0, 1,
-2.823612, -0.3416173, -3.253873, 1, 0.007843138, 0, 1,
-2.700888, -0.1310657, -3.289422, 1, 0.01176471, 0, 1,
-2.583982, -0.05509146, -1.888818, 1, 0.01960784, 0, 1,
-2.567207, 0.5144308, -0.1370971, 1, 0.02352941, 0, 1,
-2.531794, 0.9382349, -1.410423, 1, 0.03137255, 0, 1,
-2.513531, 0.543575, -0.7614728, 1, 0.03529412, 0, 1,
-2.460829, -1.141065, -3.819313, 1, 0.04313726, 0, 1,
-2.452602, 1.495661, 1.34074, 1, 0.04705882, 0, 1,
-2.38359, -1.406142, -2.214957, 1, 0.05490196, 0, 1,
-2.35135, 3.063093, -0.9257375, 1, 0.05882353, 0, 1,
-2.33119, 1.968371, -1.934351, 1, 0.06666667, 0, 1,
-2.327652, 0.9438521, -0.08353488, 1, 0.07058824, 0, 1,
-2.24038, -1.514082, -3.22481, 1, 0.07843138, 0, 1,
-2.22771, 0.5242555, 0.2946642, 1, 0.08235294, 0, 1,
-2.219647, 2.857617, -0.4186784, 1, 0.09019608, 0, 1,
-2.179159, -1.065586, -1.91516, 1, 0.09411765, 0, 1,
-2.144927, -0.5148682, -2.103839, 1, 0.1019608, 0, 1,
-2.121561, -0.3339991, -2.259851, 1, 0.1098039, 0, 1,
-2.116283, 0.1734241, -1.229934, 1, 0.1137255, 0, 1,
-2.078446, -2.632994, -1.372983, 1, 0.1215686, 0, 1,
-2.059625, 0.7477496, 0.7294682, 1, 0.1254902, 0, 1,
-2.048739, 0.2729873, -0.1097326, 1, 0.1333333, 0, 1,
-2.046461, 0.2648784, -1.759038, 1, 0.1372549, 0, 1,
-2.008272, 0.04684623, -0.5092533, 1, 0.145098, 0, 1,
-2.001468, 0.3737111, 0.5775377, 1, 0.1490196, 0, 1,
-2.001185, -0.877955, -2.747546, 1, 0.1568628, 0, 1,
-1.994423, -0.6357933, -3.413898, 1, 0.1607843, 0, 1,
-1.947007, -0.7818353, -0.3136689, 1, 0.1686275, 0, 1,
-1.945364, -0.4493308, -2.643566, 1, 0.172549, 0, 1,
-1.936165, 1.348859, -0.696682, 1, 0.1803922, 0, 1,
-1.901047, 1.547982, -1.166105, 1, 0.1843137, 0, 1,
-1.889936, 0.6381868, -1.209119, 1, 0.1921569, 0, 1,
-1.885698, 0.9577329, 1.308493, 1, 0.1960784, 0, 1,
-1.861278, -0.281346, -2.537138, 1, 0.2039216, 0, 1,
-1.860569, -0.5825724, -0.5792497, 1, 0.2117647, 0, 1,
-1.856298, -0.05088155, -0.3840184, 1, 0.2156863, 0, 1,
-1.85348, -0.1757365, -2.700471, 1, 0.2235294, 0, 1,
-1.840988, 0.5465163, -1.41455, 1, 0.227451, 0, 1,
-1.790736, 1.20904, -2.523078, 1, 0.2352941, 0, 1,
-1.784378, 0.2880909, -3.306337, 1, 0.2392157, 0, 1,
-1.783725, -0.3640999, -3.289475, 1, 0.2470588, 0, 1,
-1.782678, -0.2343181, -1.256884, 1, 0.2509804, 0, 1,
-1.779027, -0.001355963, -0.4419097, 1, 0.2588235, 0, 1,
-1.769913, 0.4561087, -3.656375, 1, 0.2627451, 0, 1,
-1.762959, 0.8046356, -0.7758802, 1, 0.2705882, 0, 1,
-1.755, -1.160946, -2.21172, 1, 0.2745098, 0, 1,
-1.750959, 0.4608793, 0.3847203, 1, 0.282353, 0, 1,
-1.738395, -1.769279, -1.661119, 1, 0.2862745, 0, 1,
-1.722682, 0.3551416, -1.850498, 1, 0.2941177, 0, 1,
-1.720225, -0.5717502, -1.444632, 1, 0.3019608, 0, 1,
-1.679421, -1.018387, -0.8923047, 1, 0.3058824, 0, 1,
-1.666301, 2.365303, 0.5655773, 1, 0.3137255, 0, 1,
-1.659465, 0.8119439, -2.606558, 1, 0.3176471, 0, 1,
-1.659373, -1.024802, -3.709156, 1, 0.3254902, 0, 1,
-1.656699, 1.032259, -0.4881534, 1, 0.3294118, 0, 1,
-1.649171, 1.501999, -2.454479, 1, 0.3372549, 0, 1,
-1.641109, -0.006760928, -1.087463, 1, 0.3411765, 0, 1,
-1.639508, 0.4735439, -2.11001, 1, 0.3490196, 0, 1,
-1.63722, -1.106347, -1.027047, 1, 0.3529412, 0, 1,
-1.62079, -0.4829071, -0.6150562, 1, 0.3607843, 0, 1,
-1.590456, 0.1466602, -0.8221059, 1, 0.3647059, 0, 1,
-1.58742, -0.8508099, -4.405307, 1, 0.372549, 0, 1,
-1.571503, 0.7056376, -1.310692, 1, 0.3764706, 0, 1,
-1.569424, -1.455045, -3.554734, 1, 0.3843137, 0, 1,
-1.517357, -1.659764, -3.336641, 1, 0.3882353, 0, 1,
-1.504184, -0.8346571, -2.170422, 1, 0.3960784, 0, 1,
-1.49493, 1.396044, -0.7904826, 1, 0.4039216, 0, 1,
-1.483773, 1.040505, 0.4203021, 1, 0.4078431, 0, 1,
-1.476695, 1.09863, -1.814685, 1, 0.4156863, 0, 1,
-1.463092, 0.6043175, -1.229016, 1, 0.4196078, 0, 1,
-1.458442, 0.4645862, 0.3472677, 1, 0.427451, 0, 1,
-1.441403, -0.4549125, -0.6646153, 1, 0.4313726, 0, 1,
-1.432992, -2.084761, -4.3323, 1, 0.4392157, 0, 1,
-1.417879, 0.3002052, -1.64235, 1, 0.4431373, 0, 1,
-1.417508, -1.469355, -2.835882, 1, 0.4509804, 0, 1,
-1.410376, -0.3666977, -0.9412171, 1, 0.454902, 0, 1,
-1.401005, -0.1556704, -2.900198, 1, 0.4627451, 0, 1,
-1.384541, -0.4965503, -2.754529, 1, 0.4666667, 0, 1,
-1.380938, 0.08613239, -1.103011, 1, 0.4745098, 0, 1,
-1.371866, -0.03742944, -0.5702679, 1, 0.4784314, 0, 1,
-1.363745, 0.01659559, -2.121221, 1, 0.4862745, 0, 1,
-1.355511, 0.9894579, -0.05494265, 1, 0.4901961, 0, 1,
-1.353715, -0.2486565, -1.692905, 1, 0.4980392, 0, 1,
-1.350643, -0.3368866, -3.027223, 1, 0.5058824, 0, 1,
-1.344813, -1.136946, -3.353056, 1, 0.509804, 0, 1,
-1.337277, -0.5418026, -0.8803232, 1, 0.5176471, 0, 1,
-1.331868, 0.9934568, -0.8095896, 1, 0.5215687, 0, 1,
-1.32707, -0.5127665, -3.126663, 1, 0.5294118, 0, 1,
-1.323052, 1.535088, 0.05147014, 1, 0.5333334, 0, 1,
-1.318677, 0.6707048, -1.986971, 1, 0.5411765, 0, 1,
-1.317873, -0.2331214, -2.467755, 1, 0.5450981, 0, 1,
-1.314312, -0.2181017, -1.156828, 1, 0.5529412, 0, 1,
-1.306587, -0.6317976, -1.552077, 1, 0.5568628, 0, 1,
-1.306438, 0.6260706, -0.3440181, 1, 0.5647059, 0, 1,
-1.300158, -1.915142, -1.42518, 1, 0.5686275, 0, 1,
-1.283306, -0.6855615, -1.00712, 1, 0.5764706, 0, 1,
-1.277599, -0.9044155, -2.034885, 1, 0.5803922, 0, 1,
-1.276302, -0.3294623, -0.6906787, 1, 0.5882353, 0, 1,
-1.27509, -1.189443, -1.662428, 1, 0.5921569, 0, 1,
-1.267768, 0.1855236, -2.833221, 1, 0.6, 0, 1,
-1.267083, 0.5701787, -1.448554, 1, 0.6078432, 0, 1,
-1.26282, 0.2030922, -2.062879, 1, 0.6117647, 0, 1,
-1.261929, 0.1725392, -1.278906, 1, 0.6196079, 0, 1,
-1.259931, 3.334114, -0.9392764, 1, 0.6235294, 0, 1,
-1.256146, -2.222163, -1.964457, 1, 0.6313726, 0, 1,
-1.252428, -0.6970291, -4.259805, 1, 0.6352941, 0, 1,
-1.243878, 1.034112, -1.489915, 1, 0.6431373, 0, 1,
-1.242481, -1.004708, -1.358356, 1, 0.6470588, 0, 1,
-1.241265, -0.4582958, -0.3332836, 1, 0.654902, 0, 1,
-1.240338, 0.404701, -1.265846, 1, 0.6588235, 0, 1,
-1.237951, 0.4538975, -1.755302, 1, 0.6666667, 0, 1,
-1.22478, 0.6643966, -0.4410961, 1, 0.6705883, 0, 1,
-1.22441, 0.7226162, -1.716857, 1, 0.6784314, 0, 1,
-1.222287, 0.8741593, -0.3449593, 1, 0.682353, 0, 1,
-1.221696, -0.2127157, -1.030957, 1, 0.6901961, 0, 1,
-1.220407, -0.9644396, -2.424811, 1, 0.6941177, 0, 1,
-1.21686, 0.383233, -1.791471, 1, 0.7019608, 0, 1,
-1.214723, -1.465105, -0.05056693, 1, 0.7098039, 0, 1,
-1.213566, -0.1714629, -2.013067, 1, 0.7137255, 0, 1,
-1.212765, -0.2462621, -1.670702, 1, 0.7215686, 0, 1,
-1.205042, -1.802158, -3.066789, 1, 0.7254902, 0, 1,
-1.204574, 0.1985804, -2.131945, 1, 0.7333333, 0, 1,
-1.204486, -0.02436615, -2.115806, 1, 0.7372549, 0, 1,
-1.201987, 0.1829286, -0.6613232, 1, 0.7450981, 0, 1,
-1.196994, -0.8695047, -0.6935447, 1, 0.7490196, 0, 1,
-1.192079, 2.193876, -0.3032883, 1, 0.7568628, 0, 1,
-1.190894, -1.090784, -3.165588, 1, 0.7607843, 0, 1,
-1.188755, -0.2205615, -0.535905, 1, 0.7686275, 0, 1,
-1.18784, 1.733817, -0.854866, 1, 0.772549, 0, 1,
-1.185513, -0.05483246, -2.851543, 1, 0.7803922, 0, 1,
-1.184627, 0.9542068, -0.8249485, 1, 0.7843137, 0, 1,
-1.178531, -2.297207, -2.326155, 1, 0.7921569, 0, 1,
-1.167902, -0.1288436, -1.457515, 1, 0.7960784, 0, 1,
-1.165192, -0.2418714, -1.94429, 1, 0.8039216, 0, 1,
-1.157295, -0.461176, -2.995112, 1, 0.8117647, 0, 1,
-1.138775, -1.359954, -3.565832, 1, 0.8156863, 0, 1,
-1.138519, -1.668013, -4.065155, 1, 0.8235294, 0, 1,
-1.130251, -1.226878, -1.588873, 1, 0.827451, 0, 1,
-1.125571, 0.3904875, -1.850259, 1, 0.8352941, 0, 1,
-1.115647, -1.601283, -2.836349, 1, 0.8392157, 0, 1,
-1.105229, -0.7615417, -2.386325, 1, 0.8470588, 0, 1,
-1.100999, 1.330188, -0.6465608, 1, 0.8509804, 0, 1,
-1.100207, -0.2402334, -1.621056, 1, 0.8588235, 0, 1,
-1.095837, 0.03426937, -3.464087, 1, 0.8627451, 0, 1,
-1.092392, -0.2281828, -2.361707, 1, 0.8705882, 0, 1,
-1.080835, -0.05142988, -1.68131, 1, 0.8745098, 0, 1,
-1.073102, -0.8120809, -1.254695, 1, 0.8823529, 0, 1,
-1.066122, -0.5389864, -3.032195, 1, 0.8862745, 0, 1,
-1.064826, 0.3743156, -0.1238107, 1, 0.8941177, 0, 1,
-1.055184, 0.1352482, -3.417807, 1, 0.8980392, 0, 1,
-1.038961, 0.8693541, -0.5113567, 1, 0.9058824, 0, 1,
-1.037692, -0.27462, -1.793232, 1, 0.9137255, 0, 1,
-1.034414, 0.6374609, 0.380201, 1, 0.9176471, 0, 1,
-1.024281, -0.7161597, -3.042235, 1, 0.9254902, 0, 1,
-1.003779, -0.4062304, -2.65709, 1, 0.9294118, 0, 1,
-1.00227, -1.591279, -4.107947, 1, 0.9372549, 0, 1,
-1.000566, 1.271647, -1.179724, 1, 0.9411765, 0, 1,
-0.9928558, 1.088701, 0.04155732, 1, 0.9490196, 0, 1,
-0.9866861, 2.300843, 1.565798, 1, 0.9529412, 0, 1,
-0.9857619, -1.044311, -2.624101, 1, 0.9607843, 0, 1,
-0.9721668, -0.4148124, -1.333856, 1, 0.9647059, 0, 1,
-0.9706395, 0.1647828, -2.112619, 1, 0.972549, 0, 1,
-0.9631352, 0.7402884, -0.123797, 1, 0.9764706, 0, 1,
-0.9621746, 0.7049804, -1.482457, 1, 0.9843137, 0, 1,
-0.9572637, -0.7656856, -3.940866, 1, 0.9882353, 0, 1,
-0.9547179, 0.004680563, -1.732674, 1, 0.9960784, 0, 1,
-0.9474432, -1.049523, 0.1277343, 0.9960784, 1, 0, 1,
-0.9473224, 0.7184342, -0.4467713, 0.9921569, 1, 0, 1,
-0.9471374, -0.2158549, -3.661278, 0.9843137, 1, 0, 1,
-0.9448936, -0.7866848, -1.349982, 0.9803922, 1, 0, 1,
-0.9440754, 1.35963, -0.7975572, 0.972549, 1, 0, 1,
-0.9374025, 1.858182, -1.130758, 0.9686275, 1, 0, 1,
-0.9312702, -1.062553, -0.8933681, 0.9607843, 1, 0, 1,
-0.9245159, -0.629132, -1.630626, 0.9568627, 1, 0, 1,
-0.9191559, -2.675789, -1.414547, 0.9490196, 1, 0, 1,
-0.9138319, 0.7402425, -1.06955, 0.945098, 1, 0, 1,
-0.9057153, -1.076977, -3.341815, 0.9372549, 1, 0, 1,
-0.9053646, -1.260408, -1.751057, 0.9333333, 1, 0, 1,
-0.9042631, -1.767334, -3.959352, 0.9254902, 1, 0, 1,
-0.9017282, -1.312607, -2.465049, 0.9215686, 1, 0, 1,
-0.8890724, -0.9605087, -2.45722, 0.9137255, 1, 0, 1,
-0.8750968, 0.911844, -2.146677, 0.9098039, 1, 0, 1,
-0.8739039, 0.02004701, -2.984556, 0.9019608, 1, 0, 1,
-0.8714769, -2.21932, -2.713002, 0.8941177, 1, 0, 1,
-0.8711468, 0.3938269, -0.7541634, 0.8901961, 1, 0, 1,
-0.8696809, 1.131946, -1.668176, 0.8823529, 1, 0, 1,
-0.8691016, 0.4402865, -0.7280161, 0.8784314, 1, 0, 1,
-0.8689535, -1.240954, -1.758883, 0.8705882, 1, 0, 1,
-0.8645489, 0.3337425, -1.452747, 0.8666667, 1, 0, 1,
-0.8605852, 1.671975, 0.1144236, 0.8588235, 1, 0, 1,
-0.8585417, -0.7234181, -0.831638, 0.854902, 1, 0, 1,
-0.853414, 0.9205739, 0.0798378, 0.8470588, 1, 0, 1,
-0.8446537, -0.6776671, -4.897057, 0.8431373, 1, 0, 1,
-0.8422856, -0.5887397, -1.737721, 0.8352941, 1, 0, 1,
-0.8383559, 1.040735, -2.223068, 0.8313726, 1, 0, 1,
-0.8377349, -0.2388332, -1.673965, 0.8235294, 1, 0, 1,
-0.8358241, 0.08518465, -0.5614167, 0.8196079, 1, 0, 1,
-0.8317689, -0.5685703, -2.029997, 0.8117647, 1, 0, 1,
-0.8260109, -0.6969413, -0.216571, 0.8078431, 1, 0, 1,
-0.8232222, -0.1132251, -2.863927, 0.8, 1, 0, 1,
-0.821871, -0.2624203, -0.8697943, 0.7921569, 1, 0, 1,
-0.8208173, 2.594378, -0.7910123, 0.7882353, 1, 0, 1,
-0.8086037, 0.2452887, -1.388904, 0.7803922, 1, 0, 1,
-0.8054385, 1.109657, -0.7034621, 0.7764706, 1, 0, 1,
-0.8013476, 0.7411139, -0.6418217, 0.7686275, 1, 0, 1,
-0.7960033, -1.553583, -2.981665, 0.7647059, 1, 0, 1,
-0.7926708, 0.8817902, -1.469837, 0.7568628, 1, 0, 1,
-0.7912449, -0.9505395, -2.43003, 0.7529412, 1, 0, 1,
-0.7850536, 1.296916, -0.3329703, 0.7450981, 1, 0, 1,
-0.7822666, 1.973024, -2.307755, 0.7411765, 1, 0, 1,
-0.7818868, -0.7948146, -1.503327, 0.7333333, 1, 0, 1,
-0.7752795, -0.9717861, -3.028702, 0.7294118, 1, 0, 1,
-0.7738156, 0.201833, -0.5517128, 0.7215686, 1, 0, 1,
-0.7734323, -0.1573474, -2.578104, 0.7176471, 1, 0, 1,
-0.7717489, 1.167056, -0.7219655, 0.7098039, 1, 0, 1,
-0.7672952, 0.6745549, -1.086777, 0.7058824, 1, 0, 1,
-0.76713, 0.9400308, -0.5213723, 0.6980392, 1, 0, 1,
-0.766589, -1.402007, -0.9569327, 0.6901961, 1, 0, 1,
-0.7662592, -0.4341685, -1.540665, 0.6862745, 1, 0, 1,
-0.7651953, 2.90401, 0.9018694, 0.6784314, 1, 0, 1,
-0.764615, -0.1005343, 0.4244177, 0.6745098, 1, 0, 1,
-0.7643529, -1.002826, -2.031125, 0.6666667, 1, 0, 1,
-0.7634527, 0.3836353, -1.472332, 0.6627451, 1, 0, 1,
-0.7539691, 2.281901, -0.9089032, 0.654902, 1, 0, 1,
-0.7536785, -1.159011, -1.658027, 0.6509804, 1, 0, 1,
-0.7496211, -0.1577723, -3.489064, 0.6431373, 1, 0, 1,
-0.7490317, 1.154862, 1.524671, 0.6392157, 1, 0, 1,
-0.7448398, -1.201719, -3.624776, 0.6313726, 1, 0, 1,
-0.7435834, -0.3564568, -1.611512, 0.627451, 1, 0, 1,
-0.7350128, -0.8251578, -2.381963, 0.6196079, 1, 0, 1,
-0.7301417, -1.668694, -3.53575, 0.6156863, 1, 0, 1,
-0.7298343, -0.01669517, -2.391419, 0.6078432, 1, 0, 1,
-0.7293634, -1.959429, -1.723117, 0.6039216, 1, 0, 1,
-0.7257031, -2.25493, -3.601279, 0.5960785, 1, 0, 1,
-0.7206883, -0.03143321, -0.8312231, 0.5882353, 1, 0, 1,
-0.7106581, 0.5039083, -2.053854, 0.5843138, 1, 0, 1,
-0.7048286, 1.292358, 0.8406171, 0.5764706, 1, 0, 1,
-0.7047513, 1.994579, 0.7828005, 0.572549, 1, 0, 1,
-0.7038169, 1.727698, -1.4049, 0.5647059, 1, 0, 1,
-0.6985383, -0.8319055, -3.082518, 0.5607843, 1, 0, 1,
-0.6931753, 1.470259, 0.5138933, 0.5529412, 1, 0, 1,
-0.6927466, -0.1477135, -1.894038, 0.5490196, 1, 0, 1,
-0.6923783, 1.2918, 0.08185148, 0.5411765, 1, 0, 1,
-0.6874626, 0.519585, -2.721131, 0.5372549, 1, 0, 1,
-0.6866543, -0.4655843, -2.715326, 0.5294118, 1, 0, 1,
-0.6864895, 1.119785, -0.4313926, 0.5254902, 1, 0, 1,
-0.6854866, 0.5754913, -1.9236, 0.5176471, 1, 0, 1,
-0.6805472, 0.1160625, -0.7830501, 0.5137255, 1, 0, 1,
-0.6688131, -1.419662, -2.329201, 0.5058824, 1, 0, 1,
-0.6657783, 0.6355917, -0.5595315, 0.5019608, 1, 0, 1,
-0.6635192, -0.5789931, -1.9096, 0.4941176, 1, 0, 1,
-0.6583831, -0.8382204, -3.209754, 0.4862745, 1, 0, 1,
-0.6546108, 1.112232, -1.478383, 0.4823529, 1, 0, 1,
-0.6543922, 1.403216, -1.15682, 0.4745098, 1, 0, 1,
-0.6519763, -0.1186355, -2.044766, 0.4705882, 1, 0, 1,
-0.6447818, -0.6656817, -3.840162, 0.4627451, 1, 0, 1,
-0.643947, -0.4525965, -0.8799984, 0.4588235, 1, 0, 1,
-0.6429031, -0.5489811, -2.922427, 0.4509804, 1, 0, 1,
-0.6406702, 0.3166162, -0.7705169, 0.4470588, 1, 0, 1,
-0.6358311, 0.6993961, -1.618558, 0.4392157, 1, 0, 1,
-0.6342037, 0.1734757, -0.3887922, 0.4352941, 1, 0, 1,
-0.6234747, 0.4069118, -2.139754, 0.427451, 1, 0, 1,
-0.6208564, 0.5397946, -1.06089, 0.4235294, 1, 0, 1,
-0.6197706, 0.558809, -1.389606, 0.4156863, 1, 0, 1,
-0.6110346, -0.05010996, -1.628957, 0.4117647, 1, 0, 1,
-0.6048707, 1.107729, -1.386019, 0.4039216, 1, 0, 1,
-0.5923469, -0.3504431, -1.760676, 0.3960784, 1, 0, 1,
-0.591184, 0.860423, -1.720669, 0.3921569, 1, 0, 1,
-0.5903541, -0.8334376, -2.390467, 0.3843137, 1, 0, 1,
-0.5895869, -0.9916785, -3.063406, 0.3803922, 1, 0, 1,
-0.5893133, 1.616737, -0.2264405, 0.372549, 1, 0, 1,
-0.5886816, -1.674153, -2.278724, 0.3686275, 1, 0, 1,
-0.5868602, -0.8462843, -3.844319, 0.3607843, 1, 0, 1,
-0.5865402, 0.6311169, -0.7584134, 0.3568628, 1, 0, 1,
-0.5854928, 0.8066146, -1.055356, 0.3490196, 1, 0, 1,
-0.5807428, -0.5378532, -1.657422, 0.345098, 1, 0, 1,
-0.5805959, -0.3284078, -1.85707, 0.3372549, 1, 0, 1,
-0.5778896, 1.119325, 0.08159789, 0.3333333, 1, 0, 1,
-0.5752419, -0.5977449, -3.509926, 0.3254902, 1, 0, 1,
-0.574264, -0.1723389, 0.5043833, 0.3215686, 1, 0, 1,
-0.5704159, 0.3268203, -1.25279, 0.3137255, 1, 0, 1,
-0.5691034, 1.621848, -0.4433999, 0.3098039, 1, 0, 1,
-0.5641462, -1.49952, -2.505355, 0.3019608, 1, 0, 1,
-0.5604105, 0.7590768, -0.4687876, 0.2941177, 1, 0, 1,
-0.5602668, 0.9159141, -2.15913, 0.2901961, 1, 0, 1,
-0.5598283, 0.4130711, 0.2642689, 0.282353, 1, 0, 1,
-0.5524679, -0.3714491, -2.569996, 0.2784314, 1, 0, 1,
-0.5458653, 0.3055927, -1.642506, 0.2705882, 1, 0, 1,
-0.5443113, -0.9919648, -2.056462, 0.2666667, 1, 0, 1,
-0.5296301, -1.094627, -2.99068, 0.2588235, 1, 0, 1,
-0.5292684, 0.5059463, 0.2322907, 0.254902, 1, 0, 1,
-0.528776, 0.9412926, -2.825285, 0.2470588, 1, 0, 1,
-0.5281013, 0.5920916, -0.4249018, 0.2431373, 1, 0, 1,
-0.52423, 0.08461137, -1.694377, 0.2352941, 1, 0, 1,
-0.5221081, 1.406708, -0.7412289, 0.2313726, 1, 0, 1,
-0.5205568, 0.8011969, 0.6234997, 0.2235294, 1, 0, 1,
-0.5200549, 0.28411, -0.6291184, 0.2196078, 1, 0, 1,
-0.5175077, -0.509248, -2.526666, 0.2117647, 1, 0, 1,
-0.5155354, 0.2140211, -1.332879, 0.2078431, 1, 0, 1,
-0.515327, -0.4568735, -2.801709, 0.2, 1, 0, 1,
-0.5116494, 1.469486, 1.25893, 0.1921569, 1, 0, 1,
-0.5110089, -0.006828404, -1.809944, 0.1882353, 1, 0, 1,
-0.510684, 1.611782, 0.1008488, 0.1803922, 1, 0, 1,
-0.5096828, -0.5785099, -1.932032, 0.1764706, 1, 0, 1,
-0.5075707, 1.704363, -0.7248186, 0.1686275, 1, 0, 1,
-0.5066875, -0.5212164, -2.89208, 0.1647059, 1, 0, 1,
-0.5048626, 0.3674791, -1.596768, 0.1568628, 1, 0, 1,
-0.5046408, 0.00512632, -1.452147, 0.1529412, 1, 0, 1,
-0.5012468, 1.117565, 0.7945763, 0.145098, 1, 0, 1,
-0.4962322, 1.693326, -0.9907444, 0.1411765, 1, 0, 1,
-0.495699, -1.0346, -2.107148, 0.1333333, 1, 0, 1,
-0.4923087, -1.459755, -2.918441, 0.1294118, 1, 0, 1,
-0.4870075, -1.587324, -2.318568, 0.1215686, 1, 0, 1,
-0.4861146, -0.3061261, -2.983087, 0.1176471, 1, 0, 1,
-0.4829024, -0.3180569, -3.739684, 0.1098039, 1, 0, 1,
-0.4823275, 0.5849512, -0.6528272, 0.1058824, 1, 0, 1,
-0.4783277, -2.476567, -1.945967, 0.09803922, 1, 0, 1,
-0.4766178, -0.09950235, -1.265022, 0.09019608, 1, 0, 1,
-0.4764877, 1.860858, 0.7944189, 0.08627451, 1, 0, 1,
-0.4696119, -0.2549604, -0.807653, 0.07843138, 1, 0, 1,
-0.4693475, 0.06440555, -1.362037, 0.07450981, 1, 0, 1,
-0.4658357, -1.157197, -1.913952, 0.06666667, 1, 0, 1,
-0.4628725, -0.885387, -2.415297, 0.0627451, 1, 0, 1,
-0.458539, 0.122427, -2.883551, 0.05490196, 1, 0, 1,
-0.457564, -0.790704, -3.534767, 0.05098039, 1, 0, 1,
-0.4553476, 0.9892386, -0.5313509, 0.04313726, 1, 0, 1,
-0.4519418, 0.7451614, -2.309958, 0.03921569, 1, 0, 1,
-0.4510732, 0.1785858, -1.755084, 0.03137255, 1, 0, 1,
-0.4489882, -1.440897, -1.670484, 0.02745098, 1, 0, 1,
-0.4487608, -1.581031, -1.18009, 0.01960784, 1, 0, 1,
-0.4378366, 1.237803, 0.3299623, 0.01568628, 1, 0, 1,
-0.4368455, -2.664912, -3.573898, 0.007843138, 1, 0, 1,
-0.4365248, 0.06614741, -1.423302, 0.003921569, 1, 0, 1,
-0.4313125, 1.659921, -0.8441204, 0, 1, 0.003921569, 1,
-0.4309777, -0.7223569, -1.812063, 0, 1, 0.01176471, 1,
-0.4297175, 1.970726, -1.510194, 0, 1, 0.01568628, 1,
-0.4258297, 0.1768239, -3.766245, 0, 1, 0.02352941, 1,
-0.4246725, 1.223823, 1.316126, 0, 1, 0.02745098, 1,
-0.4221563, -0.07296259, -1.923431, 0, 1, 0.03529412, 1,
-0.4120802, -0.1017241, -1.449062, 0, 1, 0.03921569, 1,
-0.409491, -1.167378, -3.292202, 0, 1, 0.04705882, 1,
-0.4071597, 0.2992838, -3.266838, 0, 1, 0.05098039, 1,
-0.4066746, -1.237471, -2.556606, 0, 1, 0.05882353, 1,
-0.4046554, 2.157009, -1.327693, 0, 1, 0.0627451, 1,
-0.4020315, 0.5474183, 0.1226542, 0, 1, 0.07058824, 1,
-0.3965755, 0.87057, 0.2389414, 0, 1, 0.07450981, 1,
-0.3927103, -1.532787, -2.46441, 0, 1, 0.08235294, 1,
-0.3915873, 0.5116789, -1.664171, 0, 1, 0.08627451, 1,
-0.389525, -0.7011434, -3.230147, 0, 1, 0.09411765, 1,
-0.3837035, -0.635504, -1.842475, 0, 1, 0.1019608, 1,
-0.3785818, 0.05166499, -2.674479, 0, 1, 0.1058824, 1,
-0.3739523, 1.313785, 1.902901, 0, 1, 0.1137255, 1,
-0.3693705, 0.1077056, -1.85794, 0, 1, 0.1176471, 1,
-0.3682694, 0.06255325, -1.851126, 0, 1, 0.1254902, 1,
-0.3674078, -0.8216138, -3.476927, 0, 1, 0.1294118, 1,
-0.3657364, 0.9971453, -0.0729689, 0, 1, 0.1372549, 1,
-0.3588389, 0.3682119, -0.7995921, 0, 1, 0.1411765, 1,
-0.3585363, 0.8885581, -0.1593023, 0, 1, 0.1490196, 1,
-0.3584394, -1.144274, -4.331928, 0, 1, 0.1529412, 1,
-0.3562934, 0.7512265, -0.8054652, 0, 1, 0.1607843, 1,
-0.3524634, -0.6777533, -4.196311, 0, 1, 0.1647059, 1,
-0.3431353, -0.1010968, -1.674767, 0, 1, 0.172549, 1,
-0.3417602, -1.383652, -2.974168, 0, 1, 0.1764706, 1,
-0.3406188, -0.8485709, -1.804217, 0, 1, 0.1843137, 1,
-0.3398248, 0.1014092, -0.7657672, 0, 1, 0.1882353, 1,
-0.3342371, -1.521848, -2.212773, 0, 1, 0.1960784, 1,
-0.3309528, 0.3405852, -1.68592, 0, 1, 0.2039216, 1,
-0.3246281, -0.2997424, -2.403242, 0, 1, 0.2078431, 1,
-0.3233346, 0.4180978, -0.5623798, 0, 1, 0.2156863, 1,
-0.3210056, -2.086345, -3.23144, 0, 1, 0.2196078, 1,
-0.3208728, 0.2861064, -1.491875, 0, 1, 0.227451, 1,
-0.3207688, 1.025043, -0.1555238, 0, 1, 0.2313726, 1,
-0.3166779, 0.9444623, 0.8132782, 0, 1, 0.2392157, 1,
-0.3105647, 1.545517, -1.353565, 0, 1, 0.2431373, 1,
-0.3068107, -0.6541329, -1.484002, 0, 1, 0.2509804, 1,
-0.3062778, 0.4911456, -0.7793181, 0, 1, 0.254902, 1,
-0.3060307, 1.697443, -0.5580997, 0, 1, 0.2627451, 1,
-0.3025587, -0.2875003, -1.686428, 0, 1, 0.2666667, 1,
-0.3023966, 0.7527078, -0.4197811, 0, 1, 0.2745098, 1,
-0.3002101, -0.8769804, -3.090683, 0, 1, 0.2784314, 1,
-0.2979364, 0.5904763, 0.3080163, 0, 1, 0.2862745, 1,
-0.2954816, 0.783496, 0.762946, 0, 1, 0.2901961, 1,
-0.2933702, -0.2216965, -2.034066, 0, 1, 0.2980392, 1,
-0.2929086, 2.332402, -1.023139, 0, 1, 0.3058824, 1,
-0.2828109, -1.710073, -3.791164, 0, 1, 0.3098039, 1,
-0.2813685, -0.8241804, -3.39081, 0, 1, 0.3176471, 1,
-0.2806246, 1.48881, 0.5833434, 0, 1, 0.3215686, 1,
-0.2776088, 0.6208317, -0.9541795, 0, 1, 0.3294118, 1,
-0.2751085, 0.6660384, 0.1472344, 0, 1, 0.3333333, 1,
-0.2709594, -0.2599762, -2.991367, 0, 1, 0.3411765, 1,
-0.2701277, -0.5755343, -1.564652, 0, 1, 0.345098, 1,
-0.2638474, 0.477636, -0.4885733, 0, 1, 0.3529412, 1,
-0.2631006, -0.7645671, -2.02351, 0, 1, 0.3568628, 1,
-0.2540165, -0.6152607, -1.928898, 0, 1, 0.3647059, 1,
-0.2479662, 0.6812178, -0.3623107, 0, 1, 0.3686275, 1,
-0.2460192, -0.05707567, -1.601276, 0, 1, 0.3764706, 1,
-0.2425867, 0.1045832, 0.7233523, 0, 1, 0.3803922, 1,
-0.2404561, -0.5158169, -4.716538, 0, 1, 0.3882353, 1,
-0.2397481, 0.510181, -1.647185, 0, 1, 0.3921569, 1,
-0.2381085, -0.3700104, -3.033156, 0, 1, 0.4, 1,
-0.233348, -1.337212, -3.241845, 0, 1, 0.4078431, 1,
-0.2329985, 0.5243794, 0.3484119, 0, 1, 0.4117647, 1,
-0.2320104, -0.609485, -3.403066, 0, 1, 0.4196078, 1,
-0.2315148, -0.426154, -2.895659, 0, 1, 0.4235294, 1,
-0.228647, -1.643131, -4.587219, 0, 1, 0.4313726, 1,
-0.2285983, -0.5234829, -1.615916, 0, 1, 0.4352941, 1,
-0.2264167, -1.041996, -1.589214, 0, 1, 0.4431373, 1,
-0.2260044, 1.242046, -1.467274, 0, 1, 0.4470588, 1,
-0.2246854, -0.8164831, -4.325696, 0, 1, 0.454902, 1,
-0.218798, -0.8856317, -2.985557, 0, 1, 0.4588235, 1,
-0.2186991, 0.4692748, 0.4061864, 0, 1, 0.4666667, 1,
-0.2151755, 1.885908, -0.9160895, 0, 1, 0.4705882, 1,
-0.209968, 0.5546938, 0.2166475, 0, 1, 0.4784314, 1,
-0.2094792, 3.379864, 0.01557649, 0, 1, 0.4823529, 1,
-0.2079549, -2.345673, -3.560365, 0, 1, 0.4901961, 1,
-0.2048659, -0.7856126, -4.769578, 0, 1, 0.4941176, 1,
-0.2032714, -0.6507847, -3.186898, 0, 1, 0.5019608, 1,
-0.2030735, 0.8100026, -2.046627, 0, 1, 0.509804, 1,
-0.2008947, -0.862046, -3.551541, 0, 1, 0.5137255, 1,
-0.191519, 1.764631, 0.09544932, 0, 1, 0.5215687, 1,
-0.189008, -0.9060271, -1.900161, 0, 1, 0.5254902, 1,
-0.1860785, -0.09115028, -2.490155, 0, 1, 0.5333334, 1,
-0.1821327, 0.1827591, 1.439354, 0, 1, 0.5372549, 1,
-0.1798354, -0.2643569, -1.823067, 0, 1, 0.5450981, 1,
-0.1790046, 1.273287, -0.6332292, 0, 1, 0.5490196, 1,
-0.1710437, -0.7300968, -1.457019, 0, 1, 0.5568628, 1,
-0.1703767, -1.126199, -3.38396, 0, 1, 0.5607843, 1,
-0.16773, 2.000094, -0.7713199, 0, 1, 0.5686275, 1,
-0.1669628, -1.805634, -0.7548931, 0, 1, 0.572549, 1,
-0.1599005, -0.5553373, -2.55388, 0, 1, 0.5803922, 1,
-0.1516843, 0.2854767, -1.602487, 0, 1, 0.5843138, 1,
-0.1515243, 1.872313, -0.07845221, 0, 1, 0.5921569, 1,
-0.1514582, -0.7345509, -2.797503, 0, 1, 0.5960785, 1,
-0.1499772, 0.3637877, -0.7934503, 0, 1, 0.6039216, 1,
-0.1497923, -0.01413197, -0.3251227, 0, 1, 0.6117647, 1,
-0.1491534, 0.6477235, -0.4221715, 0, 1, 0.6156863, 1,
-0.1450208, -1.369573, -4.335446, 0, 1, 0.6235294, 1,
-0.1424537, 0.1179706, 0.7458636, 0, 1, 0.627451, 1,
-0.1396775, -2.567535, -3.402001, 0, 1, 0.6352941, 1,
-0.1396647, -0.6692155, -3.742151, 0, 1, 0.6392157, 1,
-0.1388425, -1.396859, -2.685285, 0, 1, 0.6470588, 1,
-0.1376698, -3.097642, -2.891595, 0, 1, 0.6509804, 1,
-0.1355356, -0.4866172, -2.202419, 0, 1, 0.6588235, 1,
-0.1338962, -0.05423527, -2.022006, 0, 1, 0.6627451, 1,
-0.1260492, 1.449899, -0.4555271, 0, 1, 0.6705883, 1,
-0.1179069, 1.074347, 0.1446192, 0, 1, 0.6745098, 1,
-0.1101346, -0.5571696, -1.623365, 0, 1, 0.682353, 1,
-0.1098625, 0.9954322, -3.308408, 0, 1, 0.6862745, 1,
-0.1067856, 0.8452949, 1.340918, 0, 1, 0.6941177, 1,
-0.1062857, 0.5000226, 1.902162, 0, 1, 0.7019608, 1,
-0.1010239, -0.2699449, -3.46365, 0, 1, 0.7058824, 1,
-0.100924, -1.557858, -2.598953, 0, 1, 0.7137255, 1,
-0.09869045, -0.5555808, -2.477529, 0, 1, 0.7176471, 1,
-0.09790035, -1.014443, -3.919487, 0, 1, 0.7254902, 1,
-0.09323795, -2.857575, -0.9585858, 0, 1, 0.7294118, 1,
-0.09261985, 0.7384796, 0.1772207, 0, 1, 0.7372549, 1,
-0.09029887, -1.399321, -1.90948, 0, 1, 0.7411765, 1,
-0.09014215, -1.119524, -0.969929, 0, 1, 0.7490196, 1,
-0.08820145, 0.7942665, 0.5739834, 0, 1, 0.7529412, 1,
-0.0876221, 1.733842, -1.830625, 0, 1, 0.7607843, 1,
-0.08739102, -0.217287, -1.573, 0, 1, 0.7647059, 1,
-0.08672507, -0.02164897, -1.491407, 0, 1, 0.772549, 1,
-0.08598556, -0.3818706, -3.627146, 0, 1, 0.7764706, 1,
-0.08299631, 0.04966735, -1.880286, 0, 1, 0.7843137, 1,
-0.08289979, 0.6188363, -0.4081097, 0, 1, 0.7882353, 1,
-0.07811693, -0.002890747, -2.03399, 0, 1, 0.7960784, 1,
-0.07754046, 1.261176, 0.1073188, 0, 1, 0.8039216, 1,
-0.07749295, 1.199534, 0.4295168, 0, 1, 0.8078431, 1,
-0.07648611, 0.4582086, -0.6039514, 0, 1, 0.8156863, 1,
-0.06985786, 2.370175, 1.813334, 0, 1, 0.8196079, 1,
-0.06676846, -0.8470355, -2.322556, 0, 1, 0.827451, 1,
-0.06354333, -0.9042047, -3.266892, 0, 1, 0.8313726, 1,
-0.06341995, 1.671543, 1.337929, 0, 1, 0.8392157, 1,
-0.06116162, 1.729528, 0.7288268, 0, 1, 0.8431373, 1,
-0.06070916, -0.8843557, -4.572693, 0, 1, 0.8509804, 1,
-0.06059707, -0.7628896, -2.999196, 0, 1, 0.854902, 1,
-0.05898785, -1.596087, -0.5696105, 0, 1, 0.8627451, 1,
-0.05825792, -0.07590621, -4.406862, 0, 1, 0.8666667, 1,
-0.05746707, 0.6817026, -1.127252, 0, 1, 0.8745098, 1,
-0.05737537, -0.546731, -1.840534, 0, 1, 0.8784314, 1,
-0.05370399, -0.8107029, -2.320625, 0, 1, 0.8862745, 1,
-0.0517459, 0.6801736, 0.08360647, 0, 1, 0.8901961, 1,
-0.04943188, 0.4332295, 0.4365675, 0, 1, 0.8980392, 1,
-0.04865169, 0.002094698, -1.275515, 0, 1, 0.9058824, 1,
-0.0428964, 0.7744784, 1.064961, 0, 1, 0.9098039, 1,
-0.03955858, -0.7148248, -3.403487, 0, 1, 0.9176471, 1,
-0.03898164, 0.4807856, -0.2150411, 0, 1, 0.9215686, 1,
-0.03647066, 0.1897314, 1.220174, 0, 1, 0.9294118, 1,
-0.03075596, -0.9169741, -1.188231, 0, 1, 0.9333333, 1,
-0.02660996, -0.278562, -1.401983, 0, 1, 0.9411765, 1,
-0.02652118, 0.8027581, -1.645962, 0, 1, 0.945098, 1,
-0.02560213, 0.5887592, -0.3221101, 0, 1, 0.9529412, 1,
-0.02428203, 1.073516, 1.073786, 0, 1, 0.9568627, 1,
-0.02396722, -0.6685176, -0.8465337, 0, 1, 0.9647059, 1,
-0.02158729, -0.5666741, -1.994416, 0, 1, 0.9686275, 1,
-0.01505614, -0.9883999, -3.391988, 0, 1, 0.9764706, 1,
-0.01070386, -1.473233, -3.809088, 0, 1, 0.9803922, 1,
-0.008985386, -0.675707, -4.31307, 0, 1, 0.9882353, 1,
-0.005527757, -0.6093138, -2.074783, 0, 1, 0.9921569, 1,
-0.004688305, -1.012933, -3.218586, 0, 1, 1, 1,
-0.002149147, 1.664866, 0.07186759, 0, 0.9921569, 1, 1,
-0.000395358, -0.6393594, -2.145235, 0, 0.9882353, 1, 1,
0.004676334, -0.2108831, 1.181239, 0, 0.9803922, 1, 1,
0.004769085, -0.8942613, 2.944933, 0, 0.9764706, 1, 1,
0.007689219, 1.778043, 0.4319354, 0, 0.9686275, 1, 1,
0.0102183, 1.322667, 0.5843617, 0, 0.9647059, 1, 1,
0.0140756, 0.7604603, -0.1515343, 0, 0.9568627, 1, 1,
0.01514387, 0.06786785, 1.406916, 0, 0.9529412, 1, 1,
0.01573579, -1.739928, 3.286685, 0, 0.945098, 1, 1,
0.01614336, -0.03893516, 2.531245, 0, 0.9411765, 1, 1,
0.01700586, -3.01726, 4.380061, 0, 0.9333333, 1, 1,
0.01933202, -1.227954, 0.7816107, 0, 0.9294118, 1, 1,
0.02472101, 1.117212, -0.5480934, 0, 0.9215686, 1, 1,
0.03133048, -0.4526536, 3.081504, 0, 0.9176471, 1, 1,
0.03620743, 1.068847, -0.7884679, 0, 0.9098039, 1, 1,
0.04144418, 1.42808, -0.5151974, 0, 0.9058824, 1, 1,
0.04773965, -0.4543326, 3.027406, 0, 0.8980392, 1, 1,
0.04817019, -0.7748838, 2.42877, 0, 0.8901961, 1, 1,
0.048921, 0.3272416, 0.5834229, 0, 0.8862745, 1, 1,
0.05085337, 1.104292, 0.6425655, 0, 0.8784314, 1, 1,
0.05643481, -0.9471505, 2.204794, 0, 0.8745098, 1, 1,
0.05751196, -0.08417711, 2.620525, 0, 0.8666667, 1, 1,
0.0581474, 2.270479, 0.5893302, 0, 0.8627451, 1, 1,
0.06222603, 0.1064478, 1.478744, 0, 0.854902, 1, 1,
0.06275357, 0.555613, 0.636633, 0, 0.8509804, 1, 1,
0.06389179, -1.021724, 3.147016, 0, 0.8431373, 1, 1,
0.06445888, -1.603875, 3.481181, 0, 0.8392157, 1, 1,
0.06699152, 0.03403096, 1.238606, 0, 0.8313726, 1, 1,
0.07053103, -0.7386121, 3.365421, 0, 0.827451, 1, 1,
0.07352968, -0.425417, 3.298834, 0, 0.8196079, 1, 1,
0.07387769, 1.261333, 0.4656674, 0, 0.8156863, 1, 1,
0.07397567, 0.8341849, 0.6882787, 0, 0.8078431, 1, 1,
0.07420036, -0.1783172, 2.954188, 0, 0.8039216, 1, 1,
0.07559215, 0.7294063, -0.1521622, 0, 0.7960784, 1, 1,
0.08380236, 1.364951, 0.4281847, 0, 0.7882353, 1, 1,
0.08425069, 1.036518, 0.2118842, 0, 0.7843137, 1, 1,
0.0949097, -0.4739677, 1.568648, 0, 0.7764706, 1, 1,
0.09547193, 0.8896341, 1.18814, 0, 0.772549, 1, 1,
0.09588149, 1.975385, -0.5214589, 0, 0.7647059, 1, 1,
0.09791671, 0.1118114, 0.8218343, 0, 0.7607843, 1, 1,
0.09807545, 0.1656029, 0.5707362, 0, 0.7529412, 1, 1,
0.1021869, -1.095291, 3.982918, 0, 0.7490196, 1, 1,
0.103326, -1.221718, 4.039539, 0, 0.7411765, 1, 1,
0.1045434, 0.3550926, -0.8138759, 0, 0.7372549, 1, 1,
0.1170565, -1.354699, 2.204016, 0, 0.7294118, 1, 1,
0.1176745, -1.50874, 1.887393, 0, 0.7254902, 1, 1,
0.1180599, 0.592275, -0.6101336, 0, 0.7176471, 1, 1,
0.1227777, -1.254347, 3.169753, 0, 0.7137255, 1, 1,
0.1259718, -1.676114, 1.957725, 0, 0.7058824, 1, 1,
0.1312924, -0.3450741, 3.304912, 0, 0.6980392, 1, 1,
0.1352659, -0.4699135, 3.553966, 0, 0.6941177, 1, 1,
0.1355632, 0.4778344, 0.3803733, 0, 0.6862745, 1, 1,
0.1359163, -0.04227132, 1.778977, 0, 0.682353, 1, 1,
0.1385441, 1.297529, -0.9046534, 0, 0.6745098, 1, 1,
0.1470692, -1.490267, 3.654276, 0, 0.6705883, 1, 1,
0.147414, -0.923069, 2.846712, 0, 0.6627451, 1, 1,
0.1479272, -0.9208107, 1.362825, 0, 0.6588235, 1, 1,
0.1488682, 0.7409111, 1.09759, 0, 0.6509804, 1, 1,
0.149733, -0.004861365, 3.072725, 0, 0.6470588, 1, 1,
0.1503654, 1.44112, -0.6365631, 0, 0.6392157, 1, 1,
0.1534092, -1.11478, 3.048965, 0, 0.6352941, 1, 1,
0.156032, 0.5029669, -0.1849028, 0, 0.627451, 1, 1,
0.1567515, 0.0295506, 1.564363, 0, 0.6235294, 1, 1,
0.1591429, 2.007313, -1.503071, 0, 0.6156863, 1, 1,
0.1619776, 0.0104546, 2.317164, 0, 0.6117647, 1, 1,
0.1625381, -0.7912749, 3.247254, 0, 0.6039216, 1, 1,
0.1661751, -2.100099, 1.668268, 0, 0.5960785, 1, 1,
0.1669793, 1.099494, 0.06849658, 0, 0.5921569, 1, 1,
0.167359, 0.4358564, -0.6749779, 0, 0.5843138, 1, 1,
0.1692172, 0.5256457, 0.5250464, 0, 0.5803922, 1, 1,
0.1694946, 0.81977, 0.2733333, 0, 0.572549, 1, 1,
0.1695599, 0.9622626, -0.463195, 0, 0.5686275, 1, 1,
0.1746116, 1.274502, 1.3433, 0, 0.5607843, 1, 1,
0.1752985, 0.07362128, 1.440491, 0, 0.5568628, 1, 1,
0.1766798, -0.3854055, 3.217918, 0, 0.5490196, 1, 1,
0.1783693, -1.239605, 2.34417, 0, 0.5450981, 1, 1,
0.18061, 0.336024, 0.3598876, 0, 0.5372549, 1, 1,
0.1816021, 0.3086592, 1.461378, 0, 0.5333334, 1, 1,
0.1849627, -0.3233159, 1.711083, 0, 0.5254902, 1, 1,
0.1899991, -0.9892303, 3.115868, 0, 0.5215687, 1, 1,
0.1902119, 2.466158, 1.163227, 0, 0.5137255, 1, 1,
0.1904498, 0.2684737, 0.03236898, 0, 0.509804, 1, 1,
0.191007, 0.417387, -0.2177759, 0, 0.5019608, 1, 1,
0.1933181, 0.0701129, 0.01668174, 0, 0.4941176, 1, 1,
0.203102, 0.3684746, 0.05008313, 0, 0.4901961, 1, 1,
0.2040838, 0.6773935, 0.1130727, 0, 0.4823529, 1, 1,
0.2070226, -0.9791111, 0.8769016, 0, 0.4784314, 1, 1,
0.2076991, 0.2795338, 1.018602, 0, 0.4705882, 1, 1,
0.2116717, 0.2106336, 0.9600435, 0, 0.4666667, 1, 1,
0.2149057, -0.7996879, 3.886022, 0, 0.4588235, 1, 1,
0.2158793, -0.9498582, 3.971243, 0, 0.454902, 1, 1,
0.2174645, -1.001284, 4.298042, 0, 0.4470588, 1, 1,
0.2175096, -0.3571343, 4.845589, 0, 0.4431373, 1, 1,
0.2176001, 0.7220957, -0.6444201, 0, 0.4352941, 1, 1,
0.2179125, -0.508442, 3.235156, 0, 0.4313726, 1, 1,
0.2193412, -0.2317655, 1.273655, 0, 0.4235294, 1, 1,
0.2268407, 0.2640008, 1.206271, 0, 0.4196078, 1, 1,
0.2270128, 2.154834, -0.9008145, 0, 0.4117647, 1, 1,
0.2271819, -0.1813073, 0.8771517, 0, 0.4078431, 1, 1,
0.2288332, -0.6151676, 1.969408, 0, 0.4, 1, 1,
0.2303599, -0.5005791, 2.745353, 0, 0.3921569, 1, 1,
0.2331942, 0.5753261, 1.790588, 0, 0.3882353, 1, 1,
0.2357842, 0.2072478, 1.911583, 0, 0.3803922, 1, 1,
0.2439169, 0.6396312, 0.2257648, 0, 0.3764706, 1, 1,
0.2547124, 1.006706, 0.01478097, 0, 0.3686275, 1, 1,
0.2566142, 0.06032481, 0.1138476, 0, 0.3647059, 1, 1,
0.2614471, -2.327496, 2.785828, 0, 0.3568628, 1, 1,
0.2639682, 0.4243396, -0.3305328, 0, 0.3529412, 1, 1,
0.2653847, -0.2463768, 2.602847, 0, 0.345098, 1, 1,
0.2686064, -1.738452, 4.073506, 0, 0.3411765, 1, 1,
0.2686129, -1.342663, 3.229351, 0, 0.3333333, 1, 1,
0.2717209, -1.209275, 1.749759, 0, 0.3294118, 1, 1,
0.272071, -0.0617193, 3.757691, 0, 0.3215686, 1, 1,
0.2766909, 1.420483, 1.519693, 0, 0.3176471, 1, 1,
0.2770837, 0.8020743, 0.2999883, 0, 0.3098039, 1, 1,
0.2786022, 0.4503681, -0.6346962, 0, 0.3058824, 1, 1,
0.279936, -0.4654147, 1.682003, 0, 0.2980392, 1, 1,
0.281888, 1.415526, -0.1716941, 0, 0.2901961, 1, 1,
0.2845669, -0.6902801, 4.081955, 0, 0.2862745, 1, 1,
0.2853051, 1.273189, 0.8706845, 0, 0.2784314, 1, 1,
0.2853209, 0.4269051, -0.09298261, 0, 0.2745098, 1, 1,
0.2878472, 0.1798689, 0.5083629, 0, 0.2666667, 1, 1,
0.2954239, -0.009658542, 1.846046, 0, 0.2627451, 1, 1,
0.299487, -1.010898, 3.610016, 0, 0.254902, 1, 1,
0.3028608, 0.4172435, 1.320071, 0, 0.2509804, 1, 1,
0.3056196, -0.4161277, 3.019987, 0, 0.2431373, 1, 1,
0.3189696, -0.06885263, 2.491003, 0, 0.2392157, 1, 1,
0.3195061, 0.0238926, 0.7483938, 0, 0.2313726, 1, 1,
0.3197015, 0.8266187, 1.276222, 0, 0.227451, 1, 1,
0.3200792, -0.8716207, 2.67258, 0, 0.2196078, 1, 1,
0.3217817, 0.021722, 1.799429, 0, 0.2156863, 1, 1,
0.3272333, 1.033834, 0.6923797, 0, 0.2078431, 1, 1,
0.3275288, -0.04317932, 1.242106, 0, 0.2039216, 1, 1,
0.3282541, 1.953174, 1.013102, 0, 0.1960784, 1, 1,
0.3296893, -1.473892, 3.688533, 0, 0.1882353, 1, 1,
0.330134, 1.436594, -0.2503926, 0, 0.1843137, 1, 1,
0.331769, 1.389948, -1.061692, 0, 0.1764706, 1, 1,
0.3319844, 1.091126, 0.6171918, 0, 0.172549, 1, 1,
0.3323824, 2.202973, 0.8617908, 0, 0.1647059, 1, 1,
0.3327994, -1.449308, 2.458707, 0, 0.1607843, 1, 1,
0.3328356, 1.250357, 0.4263764, 0, 0.1529412, 1, 1,
0.3328781, 0.2444983, 0.699078, 0, 0.1490196, 1, 1,
0.334235, 1.620664, -1.045615, 0, 0.1411765, 1, 1,
0.334889, 1.549716, -2.66202, 0, 0.1372549, 1, 1,
0.3363227, -1.051784, 4.455715, 0, 0.1294118, 1, 1,
0.3363836, -0.4952091, 1.187563, 0, 0.1254902, 1, 1,
0.3385886, -1.04137, 3.353657, 0, 0.1176471, 1, 1,
0.3390312, 0.02685838, 2.383299, 0, 0.1137255, 1, 1,
0.342195, 0.5829083, 1.578765, 0, 0.1058824, 1, 1,
0.3456928, -0.1097723, 1.711386, 0, 0.09803922, 1, 1,
0.346996, 0.4444532, 2.613116, 0, 0.09411765, 1, 1,
0.3524245, 0.341083, 1.598475, 0, 0.08627451, 1, 1,
0.3527139, 0.1100949, 0.2663606, 0, 0.08235294, 1, 1,
0.3571224, 2.198361, 2.858328, 0, 0.07450981, 1, 1,
0.3595838, -0.8944333, 2.319402, 0, 0.07058824, 1, 1,
0.3603152, -0.7875023, 2.333291, 0, 0.0627451, 1, 1,
0.3624483, 0.1451436, 3.29354, 0, 0.05882353, 1, 1,
0.3632798, -2.343454, 3.206391, 0, 0.05098039, 1, 1,
0.3665029, -0.2901388, 1.206293, 0, 0.04705882, 1, 1,
0.3710513, 0.3536054, 1.12355, 0, 0.03921569, 1, 1,
0.3780866, 0.3180992, 0.9853762, 0, 0.03529412, 1, 1,
0.3796305, 0.3190787, -0.1636369, 0, 0.02745098, 1, 1,
0.3859364, 0.6881469, 0.3672396, 0, 0.02352941, 1, 1,
0.3866537, 1.434734, 1.687973, 0, 0.01568628, 1, 1,
0.388207, 0.2621657, 1.158845, 0, 0.01176471, 1, 1,
0.388818, 0.4620033, 1.96725, 0, 0.003921569, 1, 1,
0.3923762, 0.04737399, 0.05097, 0.003921569, 0, 1, 1,
0.3939733, 0.7218567, 1.350597, 0.007843138, 0, 1, 1,
0.3943058, -1.886047, 2.633829, 0.01568628, 0, 1, 1,
0.3965391, -0.09141405, 4.380535, 0.01960784, 0, 1, 1,
0.3979075, -0.8128224, 2.824718, 0.02745098, 0, 1, 1,
0.4009057, 0.002539087, 2.557429, 0.03137255, 0, 1, 1,
0.4024316, 1.506154, -0.07702483, 0.03921569, 0, 1, 1,
0.4049425, -0.4791027, 2.967238, 0.04313726, 0, 1, 1,
0.4056622, -1.072654, 1.625437, 0.05098039, 0, 1, 1,
0.4079281, -0.6680809, 2.761445, 0.05490196, 0, 1, 1,
0.4083214, -1.379269, 2.872023, 0.0627451, 0, 1, 1,
0.4095145, -0.5112872, 2.059241, 0.06666667, 0, 1, 1,
0.4154222, -0.3723473, 2.409999, 0.07450981, 0, 1, 1,
0.4190847, 0.2684149, -0.7535855, 0.07843138, 0, 1, 1,
0.426369, 0.6541084, 1.673192, 0.08627451, 0, 1, 1,
0.4284375, 1.591935, 0.3939827, 0.09019608, 0, 1, 1,
0.4305516, -1.361082, 2.677782, 0.09803922, 0, 1, 1,
0.4312201, 2.107432, -1.658252, 0.1058824, 0, 1, 1,
0.4327347, 1.051865, 0.9968317, 0.1098039, 0, 1, 1,
0.436512, 0.3827853, 1.859377, 0.1176471, 0, 1, 1,
0.4375155, -0.05663612, 1.533389, 0.1215686, 0, 1, 1,
0.4395626, -0.5213578, 2.850935, 0.1294118, 0, 1, 1,
0.4497528, -0.4652857, 3.185086, 0.1333333, 0, 1, 1,
0.4607292, 1.911619, -1.035753, 0.1411765, 0, 1, 1,
0.4608989, -2.130818, 2.2546, 0.145098, 0, 1, 1,
0.4633742, 1.932189, 0.4598354, 0.1529412, 0, 1, 1,
0.4634658, -1.765553, 2.471748, 0.1568628, 0, 1, 1,
0.4635988, -1.292899, 0.5095356, 0.1647059, 0, 1, 1,
0.4661973, -1.434455, 3.117186, 0.1686275, 0, 1, 1,
0.4673096, 0.5055303, 0.8182898, 0.1764706, 0, 1, 1,
0.4688489, 0.4873673, 0.7281317, 0.1803922, 0, 1, 1,
0.4695183, 2.110082, 0.02583422, 0.1882353, 0, 1, 1,
0.4696176, -0.2519747, 2.659024, 0.1921569, 0, 1, 1,
0.4706381, 2.194584, 1.059258, 0.2, 0, 1, 1,
0.4745755, -0.2146573, 2.154298, 0.2078431, 0, 1, 1,
0.4763795, -0.805338, 3.061808, 0.2117647, 0, 1, 1,
0.4769667, -2.519854, 3.156193, 0.2196078, 0, 1, 1,
0.4804984, -0.2485798, 2.20767, 0.2235294, 0, 1, 1,
0.4819165, -0.07455672, 2.269302, 0.2313726, 0, 1, 1,
0.4823227, 0.3944672, -0.2684966, 0.2352941, 0, 1, 1,
0.4854553, -0.2558794, 1.094188, 0.2431373, 0, 1, 1,
0.4882758, 1.501915, -0.6860982, 0.2470588, 0, 1, 1,
0.4924857, -0.03037257, 2.940856, 0.254902, 0, 1, 1,
0.4929489, -0.851939, 3.146987, 0.2588235, 0, 1, 1,
0.494208, 1.748142, 0.3336082, 0.2666667, 0, 1, 1,
0.4944958, -0.3398818, 2.242272, 0.2705882, 0, 1, 1,
0.4950157, -0.9373777, 3.160587, 0.2784314, 0, 1, 1,
0.4967961, 0.0805421, -0.5313658, 0.282353, 0, 1, 1,
0.4983349, 0.7221701, 0.2608153, 0.2901961, 0, 1, 1,
0.5007768, 0.4033644, 2.1378, 0.2941177, 0, 1, 1,
0.5020774, -0.246654, 2.099745, 0.3019608, 0, 1, 1,
0.5094834, -0.9078472, 2.415633, 0.3098039, 0, 1, 1,
0.5116071, 0.2663071, 0.1847672, 0.3137255, 0, 1, 1,
0.515647, -0.5862339, 1.731411, 0.3215686, 0, 1, 1,
0.5174133, -0.04868497, 3.098452, 0.3254902, 0, 1, 1,
0.5196162, -2.005063, 1.655112, 0.3333333, 0, 1, 1,
0.5232549, -1.262657, 3.240571, 0.3372549, 0, 1, 1,
0.5269325, -0.8676326, 2.942713, 0.345098, 0, 1, 1,
0.529636, 0.104415, 0.3644888, 0.3490196, 0, 1, 1,
0.5296693, -0.1111637, 1.472357, 0.3568628, 0, 1, 1,
0.5297062, -1.693418, 3.224099, 0.3607843, 0, 1, 1,
0.5328987, 2.307631, -0.546982, 0.3686275, 0, 1, 1,
0.5333846, -1.10976, 2.545639, 0.372549, 0, 1, 1,
0.5357946, -0.766635, 2.336214, 0.3803922, 0, 1, 1,
0.5534449, 0.5652246, -0.651604, 0.3843137, 0, 1, 1,
0.5574743, 0.4451022, 1.726773, 0.3921569, 0, 1, 1,
0.5579431, 0.3899623, 1.471139, 0.3960784, 0, 1, 1,
0.5591093, -0.2269173, 2.115126, 0.4039216, 0, 1, 1,
0.5601562, 1.753565, -1.406175, 0.4117647, 0, 1, 1,
0.5628206, -0.2352758, 2.040453, 0.4156863, 0, 1, 1,
0.5641088, 0.8070602, 0.7428358, 0.4235294, 0, 1, 1,
0.5656182, -1.869207, 2.553629, 0.427451, 0, 1, 1,
0.5708941, -0.3456583, 2.899903, 0.4352941, 0, 1, 1,
0.5761727, -0.1806981, -0.172151, 0.4392157, 0, 1, 1,
0.5807412, -2.177818, 2.007428, 0.4470588, 0, 1, 1,
0.5887108, 0.8304265, -0.1324491, 0.4509804, 0, 1, 1,
0.5893134, 1.235236, 1.290351, 0.4588235, 0, 1, 1,
0.5896631, 1.521552, -2.305341, 0.4627451, 0, 1, 1,
0.5916687, 0.1497766, 0.1133221, 0.4705882, 0, 1, 1,
0.5979021, 0.2712533, 0.3907278, 0.4745098, 0, 1, 1,
0.5998092, -1.206565, 3.406555, 0.4823529, 0, 1, 1,
0.6033617, -0.5094337, 1.217952, 0.4862745, 0, 1, 1,
0.6043323, 0.2354078, 2.645324, 0.4941176, 0, 1, 1,
0.6064436, -0.9449075, 1.637739, 0.5019608, 0, 1, 1,
0.6176742, -0.7481714, 1.246407, 0.5058824, 0, 1, 1,
0.6197492, 0.1885336, 1.431977, 0.5137255, 0, 1, 1,
0.6276643, 0.2794424, 0.1620593, 0.5176471, 0, 1, 1,
0.6361679, -0.8717155, 0.7781926, 0.5254902, 0, 1, 1,
0.6372917, -1.630642, 3.837387, 0.5294118, 0, 1, 1,
0.6374857, 0.7346051, 2.125037, 0.5372549, 0, 1, 1,
0.637728, -0.02737885, 3.436972, 0.5411765, 0, 1, 1,
0.6430206, 0.7886166, -0.9996967, 0.5490196, 0, 1, 1,
0.6436228, -0.1154796, 0.215145, 0.5529412, 0, 1, 1,
0.645283, -0.4847125, 1.572288, 0.5607843, 0, 1, 1,
0.6459429, 0.540657, 1.006687, 0.5647059, 0, 1, 1,
0.6574849, -1.118072, 2.398627, 0.572549, 0, 1, 1,
0.658809, 1.792459, 1.078287, 0.5764706, 0, 1, 1,
0.6607602, -1.378756, 2.923757, 0.5843138, 0, 1, 1,
0.6654179, 0.3754231, 0.7641509, 0.5882353, 0, 1, 1,
0.6700529, 0.8203562, 2.331589, 0.5960785, 0, 1, 1,
0.6728586, -0.2065879, 1.565987, 0.6039216, 0, 1, 1,
0.6728694, 0.11264, 2.250269, 0.6078432, 0, 1, 1,
0.6773669, -0.1224847, 3.157711, 0.6156863, 0, 1, 1,
0.682368, 0.2711731, 0.2584887, 0.6196079, 0, 1, 1,
0.6849054, 0.6358235, -0.2387727, 0.627451, 0, 1, 1,
0.6883539, 0.777893, -0.7770373, 0.6313726, 0, 1, 1,
0.6889015, 0.1870151, 0.8159755, 0.6392157, 0, 1, 1,
0.6925696, -0.3034081, 2.004721, 0.6431373, 0, 1, 1,
0.6939334, 0.3493568, 1.070357, 0.6509804, 0, 1, 1,
0.6946849, 0.9033986, 0.9114771, 0.654902, 0, 1, 1,
0.7001714, 1.39913, 0.4322006, 0.6627451, 0, 1, 1,
0.7015806, 2.40347, -1.327096, 0.6666667, 0, 1, 1,
0.7034538, 0.6416567, 0.6684517, 0.6745098, 0, 1, 1,
0.7054743, -0.4654172, 1.69119, 0.6784314, 0, 1, 1,
0.7057737, 0.4794838, 1.47264, 0.6862745, 0, 1, 1,
0.7088713, 1.626054, -2.111788, 0.6901961, 0, 1, 1,
0.7168604, -0.05977518, 1.218736, 0.6980392, 0, 1, 1,
0.7174261, 0.390896, 1.045574, 0.7058824, 0, 1, 1,
0.7254561, 0.3817517, 0.2532234, 0.7098039, 0, 1, 1,
0.7290432, -1.08676, 4.702721, 0.7176471, 0, 1, 1,
0.7300983, 1.56693, -0.07821506, 0.7215686, 0, 1, 1,
0.7339263, -0.3441739, 1.990396, 0.7294118, 0, 1, 1,
0.7444257, 0.7651907, 1.695673, 0.7333333, 0, 1, 1,
0.7506092, 1.545269, -1.886192, 0.7411765, 0, 1, 1,
0.7532368, 0.1018465, 2.313872, 0.7450981, 0, 1, 1,
0.7542414, 0.3004118, 2.734489, 0.7529412, 0, 1, 1,
0.767478, 0.319619, 2.332463, 0.7568628, 0, 1, 1,
0.7816666, 0.7277058, 2.636708, 0.7647059, 0, 1, 1,
0.7841223, 0.7452306, -0.1471974, 0.7686275, 0, 1, 1,
0.7856629, 0.6180108, 1.864978, 0.7764706, 0, 1, 1,
0.7893136, 1.052994, 1.108809, 0.7803922, 0, 1, 1,
0.7920694, 0.4678024, 0.6328008, 0.7882353, 0, 1, 1,
0.8041354, 0.4219095, 0.03285025, 0.7921569, 0, 1, 1,
0.8067102, 0.05529742, 0.08332808, 0.8, 0, 1, 1,
0.8093373, 0.3679911, 0.5657557, 0.8078431, 0, 1, 1,
0.8156959, 0.4355836, 0.5982559, 0.8117647, 0, 1, 1,
0.82638, -0.9598368, 2.221984, 0.8196079, 0, 1, 1,
0.8268878, -0.5273283, 2.100748, 0.8235294, 0, 1, 1,
0.8275051, 0.771166, 0.3804747, 0.8313726, 0, 1, 1,
0.8311212, 0.9427577, -0.01943946, 0.8352941, 0, 1, 1,
0.8328421, -0.7865675, 1.655196, 0.8431373, 0, 1, 1,
0.8382098, -0.6438825, 0.9933612, 0.8470588, 0, 1, 1,
0.8385688, 1.714489, -0.9334566, 0.854902, 0, 1, 1,
0.840542, -0.06910381, 3.075264, 0.8588235, 0, 1, 1,
0.8425838, 0.6183352, 0.3946073, 0.8666667, 0, 1, 1,
0.8503728, 0.51641, 0.2140125, 0.8705882, 0, 1, 1,
0.8544946, 1.638112, -0.01253305, 0.8784314, 0, 1, 1,
0.8632382, 0.1088453, 1.781325, 0.8823529, 0, 1, 1,
0.8639095, 0.4586792, 1.874862, 0.8901961, 0, 1, 1,
0.8701685, 0.2656507, 1.562927, 0.8941177, 0, 1, 1,
0.8779501, -1.36814, 1.825179, 0.9019608, 0, 1, 1,
0.8867949, 0.8340126, 1.159593, 0.9098039, 0, 1, 1,
0.8920026, -0.3295439, 3.542993, 0.9137255, 0, 1, 1,
0.8961011, -0.5289991, 2.204767, 0.9215686, 0, 1, 1,
0.9038798, 0.445935, 2.043271, 0.9254902, 0, 1, 1,
0.9067427, 0.7159738, 1.977912, 0.9333333, 0, 1, 1,
0.9118078, -0.4844672, 0.6716769, 0.9372549, 0, 1, 1,
0.9137055, -0.1910308, 2.60111, 0.945098, 0, 1, 1,
0.9215028, -2.022591, 2.830931, 0.9490196, 0, 1, 1,
0.9282537, 0.1373553, -0.06247862, 0.9568627, 0, 1, 1,
0.9282752, 1.933386, 2.042916, 0.9607843, 0, 1, 1,
0.9312477, 0.1107045, 1.324483, 0.9686275, 0, 1, 1,
0.9321365, -2.102643, 0.607078, 0.972549, 0, 1, 1,
0.9435804, -0.1727578, 2.44151, 0.9803922, 0, 1, 1,
0.9440713, 0.5000376, 0.03861951, 0.9843137, 0, 1, 1,
0.950561, -1.21072, 2.248977, 0.9921569, 0, 1, 1,
0.9632699, -0.384578, 0.9295278, 0.9960784, 0, 1, 1,
0.9742849, 0.7848824, -0.9872783, 1, 0, 0.9960784, 1,
0.984206, -0.2411159, 0.2559651, 1, 0, 0.9882353, 1,
0.9846039, 0.647773, -0.4175666, 1, 0, 0.9843137, 1,
0.9852748, 0.7751516, 1.82252, 1, 0, 0.9764706, 1,
0.9958539, 0.2148678, 0.8632806, 1, 0, 0.972549, 1,
1.004508, 1.30173, 2.050714, 1, 0, 0.9647059, 1,
1.008072, -0.5662933, 0.7377858, 1, 0, 0.9607843, 1,
1.016579, 0.2404599, 1.923309, 1, 0, 0.9529412, 1,
1.017781, 0.3929315, 1.646847, 1, 0, 0.9490196, 1,
1.030389, -1.748994, 3.15035, 1, 0, 0.9411765, 1,
1.034732, 0.0583273, 0.6009006, 1, 0, 0.9372549, 1,
1.035387, 0.9839804, 1.461012, 1, 0, 0.9294118, 1,
1.041873, 1.146691, 0.0723054, 1, 0, 0.9254902, 1,
1.046337, -0.4470848, 2.447182, 1, 0, 0.9176471, 1,
1.049706, 2.719032, 0.3518167, 1, 0, 0.9137255, 1,
1.055328, 0.07177501, 1.83665, 1, 0, 0.9058824, 1,
1.063753, 1.616414, 1.681581, 1, 0, 0.9019608, 1,
1.065015, 0.5231564, 0.2819871, 1, 0, 0.8941177, 1,
1.076066, -2.025795, 1.772784, 1, 0, 0.8862745, 1,
1.080431, -0.8231599, 3.280736, 1, 0, 0.8823529, 1,
1.086008, -0.5621766, 2.400479, 1, 0, 0.8745098, 1,
1.098009, 0.03085888, 3.382978, 1, 0, 0.8705882, 1,
1.098789, -0.1115172, 1.117463, 1, 0, 0.8627451, 1,
1.117444, 1.003015, 0.06026925, 1, 0, 0.8588235, 1,
1.119624, -0.9878566, 2.323059, 1, 0, 0.8509804, 1,
1.122269, -0.07971294, 0.3659856, 1, 0, 0.8470588, 1,
1.13114, 0.06226632, -0.2560599, 1, 0, 0.8392157, 1,
1.137688, 1.684657, 0.4158634, 1, 0, 0.8352941, 1,
1.14148, 1.399913, 3.153646, 1, 0, 0.827451, 1,
1.144326, -0.2067402, 1.940616, 1, 0, 0.8235294, 1,
1.160897, -2.772126, 2.434619, 1, 0, 0.8156863, 1,
1.164424, 0.09037639, 0.4580069, 1, 0, 0.8117647, 1,
1.166525, 0.7628281, 1.746192, 1, 0, 0.8039216, 1,
1.170788, 0.3764249, -0.7727987, 1, 0, 0.7960784, 1,
1.179076, -0.06959701, 1.039521, 1, 0, 0.7921569, 1,
1.192493, -1.723754, 1.450135, 1, 0, 0.7843137, 1,
1.19517, -0.9734012, 2.446029, 1, 0, 0.7803922, 1,
1.195299, 0.4384368, 2.050028, 1, 0, 0.772549, 1,
1.20355, -1.721254, 3.516969, 1, 0, 0.7686275, 1,
1.209872, -1.384758, 4.172992, 1, 0, 0.7607843, 1,
1.21158, 0.2605208, 2.016777, 1, 0, 0.7568628, 1,
1.21175, -0.0515378, 1.70692, 1, 0, 0.7490196, 1,
1.217584, -0.9452665, 2.537858, 1, 0, 0.7450981, 1,
1.217766, 1.484728, 3.297193, 1, 0, 0.7372549, 1,
1.224058, -0.4498096, 2.564135, 1, 0, 0.7333333, 1,
1.224392, 1.304438, -0.05153531, 1, 0, 0.7254902, 1,
1.227296, 1.322846, 0.2584015, 1, 0, 0.7215686, 1,
1.243344, -2.267013, 1.411477, 1, 0, 0.7137255, 1,
1.246065, -0.1238662, 0.6814262, 1, 0, 0.7098039, 1,
1.248303, 0.6097864, 0.4557014, 1, 0, 0.7019608, 1,
1.256753, -1.835461, 2.820023, 1, 0, 0.6941177, 1,
1.272346, 0.08064374, 2.739812, 1, 0, 0.6901961, 1,
1.294078, 0.1631105, 1.395256, 1, 0, 0.682353, 1,
1.298623, 0.2174056, -0.4605421, 1, 0, 0.6784314, 1,
1.302662, 0.3650626, -0.2905764, 1, 0, 0.6705883, 1,
1.312532, 0.3316062, -1.185013, 1, 0, 0.6666667, 1,
1.319414, 1.185541, 1.378526, 1, 0, 0.6588235, 1,
1.32344, 0.03783299, 2.826806, 1, 0, 0.654902, 1,
1.324086, 0.8716263, -0.2699587, 1, 0, 0.6470588, 1,
1.325145, -0.2596416, 2.277047, 1, 0, 0.6431373, 1,
1.326006, 0.7683957, 1.103488, 1, 0, 0.6352941, 1,
1.330568, 1.222849, 1.499253, 1, 0, 0.6313726, 1,
1.332337, -0.4233904, 3.466869, 1, 0, 0.6235294, 1,
1.350788, 0.4848057, 1.803828, 1, 0, 0.6196079, 1,
1.351705, -0.6046763, 1.878603, 1, 0, 0.6117647, 1,
1.364693, 0.2063096, 0.8866554, 1, 0, 0.6078432, 1,
1.372903, 0.1649255, 0.4428652, 1, 0, 0.6, 1,
1.381494, 0.7558722, 0.5715489, 1, 0, 0.5921569, 1,
1.382679, 0.1896368, 0.6371767, 1, 0, 0.5882353, 1,
1.383107, 0.9294962, 1.941871, 1, 0, 0.5803922, 1,
1.387447, -0.1574936, -0.9667794, 1, 0, 0.5764706, 1,
1.387578, 1.906578, 3.224483, 1, 0, 0.5686275, 1,
1.39658, -0.1300609, 1.103524, 1, 0, 0.5647059, 1,
1.396937, -0.3410379, 0.6508366, 1, 0, 0.5568628, 1,
1.399637, 1.043033, 2.393214, 1, 0, 0.5529412, 1,
1.399977, 1.371589, 0.7296926, 1, 0, 0.5450981, 1,
1.410762, 0.1022194, 2.379952, 1, 0, 0.5411765, 1,
1.420667, -0.6538513, 2.944304, 1, 0, 0.5333334, 1,
1.423558, -1.119286, 3.526468, 1, 0, 0.5294118, 1,
1.428965, 1.282537, -0.6977614, 1, 0, 0.5215687, 1,
1.431385, -0.4764253, 1.718596, 1, 0, 0.5176471, 1,
1.437775, 0.01863922, -1.020132, 1, 0, 0.509804, 1,
1.443053, 0.999309, 2.30504, 1, 0, 0.5058824, 1,
1.443804, -0.5128565, 2.302899, 1, 0, 0.4980392, 1,
1.444616, -0.8164312, 1.726329, 1, 0, 0.4901961, 1,
1.44606, -0.989369, 1.594246, 1, 0, 0.4862745, 1,
1.447588, -0.6987897, 2.836837, 1, 0, 0.4784314, 1,
1.450892, 0.6631622, 1.128567, 1, 0, 0.4745098, 1,
1.451308, -0.4963243, 1.507727, 1, 0, 0.4666667, 1,
1.472709, 1.381332, 1.242799, 1, 0, 0.4627451, 1,
1.473965, 0.2343765, 2.104696, 1, 0, 0.454902, 1,
1.477841, 1.953001, 0.9989169, 1, 0, 0.4509804, 1,
1.490559, -0.5459523, 2.489499, 1, 0, 0.4431373, 1,
1.491898, -1.669251, 1.491756, 1, 0, 0.4392157, 1,
1.497169, -0.5330625, 3.51141, 1, 0, 0.4313726, 1,
1.497847, -0.8049901, 0.06119539, 1, 0, 0.427451, 1,
1.4997, 0.4674597, 1.455673, 1, 0, 0.4196078, 1,
1.513356, 0.3846072, 0.4634123, 1, 0, 0.4156863, 1,
1.514964, -0.09582074, 2.103539, 1, 0, 0.4078431, 1,
1.518223, -1.263209, 1.80569, 1, 0, 0.4039216, 1,
1.518338, 1.753333, 1.521108, 1, 0, 0.3960784, 1,
1.523701, 1.089845, 1.096213, 1, 0, 0.3882353, 1,
1.538209, -2.596796, 2.004843, 1, 0, 0.3843137, 1,
1.538424, 0.313449, 2.061615, 1, 0, 0.3764706, 1,
1.562121, 1.708884, 0.7024143, 1, 0, 0.372549, 1,
1.562888, -0.7767369, 2.36596, 1, 0, 0.3647059, 1,
1.567416, -0.3751704, -0.4509835, 1, 0, 0.3607843, 1,
1.567852, -1.689119, 2.610238, 1, 0, 0.3529412, 1,
1.572645, 1.248912, -0.2369355, 1, 0, 0.3490196, 1,
1.590959, 0.9143274, 0.01460611, 1, 0, 0.3411765, 1,
1.596238, -0.6956619, 1.845782, 1, 0, 0.3372549, 1,
1.611073, -0.6063618, 1.821616, 1, 0, 0.3294118, 1,
1.621164, 0.4594656, 0.3974702, 1, 0, 0.3254902, 1,
1.622579, 0.712114, 2.48322, 1, 0, 0.3176471, 1,
1.627202, -0.166002, 1.984781, 1, 0, 0.3137255, 1,
1.628561, -0.9768133, 2.038076, 1, 0, 0.3058824, 1,
1.639677, -1.340751, 2.828309, 1, 0, 0.2980392, 1,
1.680039, -0.07560395, 2.569471, 1, 0, 0.2941177, 1,
1.706993, 0.7448422, 1.973262, 1, 0, 0.2862745, 1,
1.712589, -0.6937369, 1.971348, 1, 0, 0.282353, 1,
1.715339, -0.6785195, 3.448423, 1, 0, 0.2745098, 1,
1.739084, -0.409299, 3.431055, 1, 0, 0.2705882, 1,
1.739549, 0.1217108, 1.754169, 1, 0, 0.2627451, 1,
1.752293, 1.03504, -1.953169, 1, 0, 0.2588235, 1,
1.76845, -0.4780547, 1.692566, 1, 0, 0.2509804, 1,
1.771874, -1.673253, 2.979142, 1, 0, 0.2470588, 1,
1.779205, 0.8956201, 0.6736093, 1, 0, 0.2392157, 1,
1.797384, 1.420579, 0.1184409, 1, 0, 0.2352941, 1,
1.811331, 0.6905804, 2.777842, 1, 0, 0.227451, 1,
1.815511, 0.3209922, 1.183997, 1, 0, 0.2235294, 1,
1.823385, -1.408883, 3.102249, 1, 0, 0.2156863, 1,
1.828439, 0.4869366, 1.496742, 1, 0, 0.2117647, 1,
1.828615, -0.07717103, 1.492043, 1, 0, 0.2039216, 1,
1.913712, -0.3229709, 1.803146, 1, 0, 0.1960784, 1,
1.924281, -0.7729737, 3.437966, 1, 0, 0.1921569, 1,
1.93254, 0.1937347, 2.218968, 1, 0, 0.1843137, 1,
1.937225, 1.575617, 1.041071, 1, 0, 0.1803922, 1,
1.938713, 1.327113, -0.6265095, 1, 0, 0.172549, 1,
1.956577, -1.623345, 1.341071, 1, 0, 0.1686275, 1,
1.972168, -1.090347, 2.232781, 1, 0, 0.1607843, 1,
2.009092, -0.433326, 2.410515, 1, 0, 0.1568628, 1,
2.012273, -0.4695413, 0.9954889, 1, 0, 0.1490196, 1,
2.01992, -0.5927334, 3.156643, 1, 0, 0.145098, 1,
2.031704, -0.1039609, 2.344258, 1, 0, 0.1372549, 1,
2.047743, 1.268448, 1.635461, 1, 0, 0.1333333, 1,
2.078229, 0.8559697, 2.62582, 1, 0, 0.1254902, 1,
2.079062, -0.02109382, 1.326972, 1, 0, 0.1215686, 1,
2.084943, 0.3284359, 1.931961, 1, 0, 0.1137255, 1,
2.085308, 0.0062865, 2.435057, 1, 0, 0.1098039, 1,
2.099702, -2.15136, 3.059979, 1, 0, 0.1019608, 1,
2.111393, 1.91632, 2.001517, 1, 0, 0.09411765, 1,
2.118591, -0.5334851, 0.5004224, 1, 0, 0.09019608, 1,
2.138198, -0.4601684, 1.418883, 1, 0, 0.08235294, 1,
2.233821, 0.06394819, -0.2607702, 1, 0, 0.07843138, 1,
2.263528, 1.075084, 1.322302, 1, 0, 0.07058824, 1,
2.300769, -0.571341, 1.369359, 1, 0, 0.06666667, 1,
2.316782, -0.1919706, 2.687551, 1, 0, 0.05882353, 1,
2.365326, -1.339375, 2.18768, 1, 0, 0.05490196, 1,
2.36826, 0.5397536, 0.8436276, 1, 0, 0.04705882, 1,
2.45174, -0.4238178, 1.601097, 1, 0, 0.04313726, 1,
2.471309, -0.8123603, 2.907967, 1, 0, 0.03529412, 1,
2.508856, 0.1200875, 1.310343, 1, 0, 0.03137255, 1,
2.811673, 0.9528278, 1.462262, 1, 0, 0.02352941, 1,
2.844423, -0.4658937, 1.040972, 1, 0, 0.01960784, 1,
3.207917, 1.566882, 1.84978, 1, 0, 0.01176471, 1,
3.262098, 0.1501039, 2.321272, 1, 0, 0.007843138, 1
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
0.149174, -4.195579, -6.548435, 0, -0.5, 0.5, 0.5,
0.149174, -4.195579, -6.548435, 1, -0.5, 0.5, 0.5,
0.149174, -4.195579, -6.548435, 1, 1.5, 0.5, 0.5,
0.149174, -4.195579, -6.548435, 0, 1.5, 0.5, 0.5
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
-4.019032, 0.1411111, -6.548435, 0, -0.5, 0.5, 0.5,
-4.019032, 0.1411111, -6.548435, 1, -0.5, 0.5, 0.5,
-4.019032, 0.1411111, -6.548435, 1, 1.5, 0.5, 0.5,
-4.019032, 0.1411111, -6.548435, 0, 1.5, 0.5, 0.5
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
-4.019032, -4.195579, -0.02573371, 0, -0.5, 0.5, 0.5,
-4.019032, -4.195579, -0.02573371, 1, -0.5, 0.5, 0.5,
-4.019032, -4.195579, -0.02573371, 1, 1.5, 0.5, 0.5,
-4.019032, -4.195579, -0.02573371, 0, 1.5, 0.5, 0.5
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
-2, -3.194804, -5.043196,
3, -3.194804, -5.043196,
-2, -3.194804, -5.043196,
-2, -3.3616, -5.294069,
-1, -3.194804, -5.043196,
-1, -3.3616, -5.294069,
0, -3.194804, -5.043196,
0, -3.3616, -5.294069,
1, -3.194804, -5.043196,
1, -3.3616, -5.294069,
2, -3.194804, -5.043196,
2, -3.3616, -5.294069,
3, -3.194804, -5.043196,
3, -3.3616, -5.294069
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
-2, -3.695192, -5.795815, 0, -0.5, 0.5, 0.5,
-2, -3.695192, -5.795815, 1, -0.5, 0.5, 0.5,
-2, -3.695192, -5.795815, 1, 1.5, 0.5, 0.5,
-2, -3.695192, -5.795815, 0, 1.5, 0.5, 0.5,
-1, -3.695192, -5.795815, 0, -0.5, 0.5, 0.5,
-1, -3.695192, -5.795815, 1, -0.5, 0.5, 0.5,
-1, -3.695192, -5.795815, 1, 1.5, 0.5, 0.5,
-1, -3.695192, -5.795815, 0, 1.5, 0.5, 0.5,
0, -3.695192, -5.795815, 0, -0.5, 0.5, 0.5,
0, -3.695192, -5.795815, 1, -0.5, 0.5, 0.5,
0, -3.695192, -5.795815, 1, 1.5, 0.5, 0.5,
0, -3.695192, -5.795815, 0, 1.5, 0.5, 0.5,
1, -3.695192, -5.795815, 0, -0.5, 0.5, 0.5,
1, -3.695192, -5.795815, 1, -0.5, 0.5, 0.5,
1, -3.695192, -5.795815, 1, 1.5, 0.5, 0.5,
1, -3.695192, -5.795815, 0, 1.5, 0.5, 0.5,
2, -3.695192, -5.795815, 0, -0.5, 0.5, 0.5,
2, -3.695192, -5.795815, 1, -0.5, 0.5, 0.5,
2, -3.695192, -5.795815, 1, 1.5, 0.5, 0.5,
2, -3.695192, -5.795815, 0, 1.5, 0.5, 0.5,
3, -3.695192, -5.795815, 0, -0.5, 0.5, 0.5,
3, -3.695192, -5.795815, 1, -0.5, 0.5, 0.5,
3, -3.695192, -5.795815, 1, 1.5, 0.5, 0.5,
3, -3.695192, -5.795815, 0, 1.5, 0.5, 0.5
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
-3.057138, -3, -5.043196,
-3.057138, 3, -5.043196,
-3.057138, -3, -5.043196,
-3.217453, -3, -5.294069,
-3.057138, -2, -5.043196,
-3.217453, -2, -5.294069,
-3.057138, -1, -5.043196,
-3.217453, -1, -5.294069,
-3.057138, 0, -5.043196,
-3.217453, 0, -5.294069,
-3.057138, 1, -5.043196,
-3.217453, 1, -5.294069,
-3.057138, 2, -5.043196,
-3.217453, 2, -5.294069,
-3.057138, 3, -5.043196,
-3.217453, 3, -5.294069
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
-3.538085, -3, -5.795815, 0, -0.5, 0.5, 0.5,
-3.538085, -3, -5.795815, 1, -0.5, 0.5, 0.5,
-3.538085, -3, -5.795815, 1, 1.5, 0.5, 0.5,
-3.538085, -3, -5.795815, 0, 1.5, 0.5, 0.5,
-3.538085, -2, -5.795815, 0, -0.5, 0.5, 0.5,
-3.538085, -2, -5.795815, 1, -0.5, 0.5, 0.5,
-3.538085, -2, -5.795815, 1, 1.5, 0.5, 0.5,
-3.538085, -2, -5.795815, 0, 1.5, 0.5, 0.5,
-3.538085, -1, -5.795815, 0, -0.5, 0.5, 0.5,
-3.538085, -1, -5.795815, 1, -0.5, 0.5, 0.5,
-3.538085, -1, -5.795815, 1, 1.5, 0.5, 0.5,
-3.538085, -1, -5.795815, 0, 1.5, 0.5, 0.5,
-3.538085, 0, -5.795815, 0, -0.5, 0.5, 0.5,
-3.538085, 0, -5.795815, 1, -0.5, 0.5, 0.5,
-3.538085, 0, -5.795815, 1, 1.5, 0.5, 0.5,
-3.538085, 0, -5.795815, 0, 1.5, 0.5, 0.5,
-3.538085, 1, -5.795815, 0, -0.5, 0.5, 0.5,
-3.538085, 1, -5.795815, 1, -0.5, 0.5, 0.5,
-3.538085, 1, -5.795815, 1, 1.5, 0.5, 0.5,
-3.538085, 1, -5.795815, 0, 1.5, 0.5, 0.5,
-3.538085, 2, -5.795815, 0, -0.5, 0.5, 0.5,
-3.538085, 2, -5.795815, 1, -0.5, 0.5, 0.5,
-3.538085, 2, -5.795815, 1, 1.5, 0.5, 0.5,
-3.538085, 2, -5.795815, 0, 1.5, 0.5, 0.5,
-3.538085, 3, -5.795815, 0, -0.5, 0.5, 0.5,
-3.538085, 3, -5.795815, 1, -0.5, 0.5, 0.5,
-3.538085, 3, -5.795815, 1, 1.5, 0.5, 0.5,
-3.538085, 3, -5.795815, 0, 1.5, 0.5, 0.5
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
-3.057138, -3.194804, -4,
-3.057138, -3.194804, 4,
-3.057138, -3.194804, -4,
-3.217453, -3.3616, -4,
-3.057138, -3.194804, -2,
-3.217453, -3.3616, -2,
-3.057138, -3.194804, 0,
-3.217453, -3.3616, 0,
-3.057138, -3.194804, 2,
-3.217453, -3.3616, 2,
-3.057138, -3.194804, 4,
-3.217453, -3.3616, 4
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
-3.538085, -3.695192, -4, 0, -0.5, 0.5, 0.5,
-3.538085, -3.695192, -4, 1, -0.5, 0.5, 0.5,
-3.538085, -3.695192, -4, 1, 1.5, 0.5, 0.5,
-3.538085, -3.695192, -4, 0, 1.5, 0.5, 0.5,
-3.538085, -3.695192, -2, 0, -0.5, 0.5, 0.5,
-3.538085, -3.695192, -2, 1, -0.5, 0.5, 0.5,
-3.538085, -3.695192, -2, 1, 1.5, 0.5, 0.5,
-3.538085, -3.695192, -2, 0, 1.5, 0.5, 0.5,
-3.538085, -3.695192, 0, 0, -0.5, 0.5, 0.5,
-3.538085, -3.695192, 0, 1, -0.5, 0.5, 0.5,
-3.538085, -3.695192, 0, 1, 1.5, 0.5, 0.5,
-3.538085, -3.695192, 0, 0, 1.5, 0.5, 0.5,
-3.538085, -3.695192, 2, 0, -0.5, 0.5, 0.5,
-3.538085, -3.695192, 2, 1, -0.5, 0.5, 0.5,
-3.538085, -3.695192, 2, 1, 1.5, 0.5, 0.5,
-3.538085, -3.695192, 2, 0, 1.5, 0.5, 0.5,
-3.538085, -3.695192, 4, 0, -0.5, 0.5, 0.5,
-3.538085, -3.695192, 4, 1, -0.5, 0.5, 0.5,
-3.538085, -3.695192, 4, 1, 1.5, 0.5, 0.5,
-3.538085, -3.695192, 4, 0, 1.5, 0.5, 0.5
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
-3.057138, -3.194804, -5.043196,
-3.057138, 3.477027, -5.043196,
-3.057138, -3.194804, 4.991729,
-3.057138, 3.477027, 4.991729,
-3.057138, -3.194804, -5.043196,
-3.057138, -3.194804, 4.991729,
-3.057138, 3.477027, -5.043196,
-3.057138, 3.477027, 4.991729,
-3.057138, -3.194804, -5.043196,
3.355486, -3.194804, -5.043196,
-3.057138, -3.194804, 4.991729,
3.355486, -3.194804, 4.991729,
-3.057138, 3.477027, -5.043196,
3.355486, 3.477027, -5.043196,
-3.057138, 3.477027, 4.991729,
3.355486, 3.477027, 4.991729,
3.355486, -3.194804, -5.043196,
3.355486, 3.477027, -5.043196,
3.355486, -3.194804, 4.991729,
3.355486, 3.477027, 4.991729,
3.355486, -3.194804, -5.043196,
3.355486, -3.194804, 4.991729,
3.355486, 3.477027, -5.043196,
3.355486, 3.477027, 4.991729
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
var radius = 7.289076;
var distance = 32.42992;
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
mvMatrix.translate( -0.149174, -0.1411111, 0.02573371 );
mvMatrix.scale( 1.228996, 1.181249, 0.7853662 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.42992);
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
Fonofos<-read.table("Fonofos.xyz")
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
-2.96375, 0.1901465, -2.184884, 0, 0, 1, 1, 1,
-2.823612, -0.3416173, -3.253873, 1, 0, 0, 1, 1,
-2.700888, -0.1310657, -3.289422, 1, 0, 0, 1, 1,
-2.583982, -0.05509146, -1.888818, 1, 0, 0, 1, 1,
-2.567207, 0.5144308, -0.1370971, 1, 0, 0, 1, 1,
-2.531794, 0.9382349, -1.410423, 1, 0, 0, 1, 1,
-2.513531, 0.543575, -0.7614728, 0, 0, 0, 1, 1,
-2.460829, -1.141065, -3.819313, 0, 0, 0, 1, 1,
-2.452602, 1.495661, 1.34074, 0, 0, 0, 1, 1,
-2.38359, -1.406142, -2.214957, 0, 0, 0, 1, 1,
-2.35135, 3.063093, -0.9257375, 0, 0, 0, 1, 1,
-2.33119, 1.968371, -1.934351, 0, 0, 0, 1, 1,
-2.327652, 0.9438521, -0.08353488, 0, 0, 0, 1, 1,
-2.24038, -1.514082, -3.22481, 1, 1, 1, 1, 1,
-2.22771, 0.5242555, 0.2946642, 1, 1, 1, 1, 1,
-2.219647, 2.857617, -0.4186784, 1, 1, 1, 1, 1,
-2.179159, -1.065586, -1.91516, 1, 1, 1, 1, 1,
-2.144927, -0.5148682, -2.103839, 1, 1, 1, 1, 1,
-2.121561, -0.3339991, -2.259851, 1, 1, 1, 1, 1,
-2.116283, 0.1734241, -1.229934, 1, 1, 1, 1, 1,
-2.078446, -2.632994, -1.372983, 1, 1, 1, 1, 1,
-2.059625, 0.7477496, 0.7294682, 1, 1, 1, 1, 1,
-2.048739, 0.2729873, -0.1097326, 1, 1, 1, 1, 1,
-2.046461, 0.2648784, -1.759038, 1, 1, 1, 1, 1,
-2.008272, 0.04684623, -0.5092533, 1, 1, 1, 1, 1,
-2.001468, 0.3737111, 0.5775377, 1, 1, 1, 1, 1,
-2.001185, -0.877955, -2.747546, 1, 1, 1, 1, 1,
-1.994423, -0.6357933, -3.413898, 1, 1, 1, 1, 1,
-1.947007, -0.7818353, -0.3136689, 0, 0, 1, 1, 1,
-1.945364, -0.4493308, -2.643566, 1, 0, 0, 1, 1,
-1.936165, 1.348859, -0.696682, 1, 0, 0, 1, 1,
-1.901047, 1.547982, -1.166105, 1, 0, 0, 1, 1,
-1.889936, 0.6381868, -1.209119, 1, 0, 0, 1, 1,
-1.885698, 0.9577329, 1.308493, 1, 0, 0, 1, 1,
-1.861278, -0.281346, -2.537138, 0, 0, 0, 1, 1,
-1.860569, -0.5825724, -0.5792497, 0, 0, 0, 1, 1,
-1.856298, -0.05088155, -0.3840184, 0, 0, 0, 1, 1,
-1.85348, -0.1757365, -2.700471, 0, 0, 0, 1, 1,
-1.840988, 0.5465163, -1.41455, 0, 0, 0, 1, 1,
-1.790736, 1.20904, -2.523078, 0, 0, 0, 1, 1,
-1.784378, 0.2880909, -3.306337, 0, 0, 0, 1, 1,
-1.783725, -0.3640999, -3.289475, 1, 1, 1, 1, 1,
-1.782678, -0.2343181, -1.256884, 1, 1, 1, 1, 1,
-1.779027, -0.001355963, -0.4419097, 1, 1, 1, 1, 1,
-1.769913, 0.4561087, -3.656375, 1, 1, 1, 1, 1,
-1.762959, 0.8046356, -0.7758802, 1, 1, 1, 1, 1,
-1.755, -1.160946, -2.21172, 1, 1, 1, 1, 1,
-1.750959, 0.4608793, 0.3847203, 1, 1, 1, 1, 1,
-1.738395, -1.769279, -1.661119, 1, 1, 1, 1, 1,
-1.722682, 0.3551416, -1.850498, 1, 1, 1, 1, 1,
-1.720225, -0.5717502, -1.444632, 1, 1, 1, 1, 1,
-1.679421, -1.018387, -0.8923047, 1, 1, 1, 1, 1,
-1.666301, 2.365303, 0.5655773, 1, 1, 1, 1, 1,
-1.659465, 0.8119439, -2.606558, 1, 1, 1, 1, 1,
-1.659373, -1.024802, -3.709156, 1, 1, 1, 1, 1,
-1.656699, 1.032259, -0.4881534, 1, 1, 1, 1, 1,
-1.649171, 1.501999, -2.454479, 0, 0, 1, 1, 1,
-1.641109, -0.006760928, -1.087463, 1, 0, 0, 1, 1,
-1.639508, 0.4735439, -2.11001, 1, 0, 0, 1, 1,
-1.63722, -1.106347, -1.027047, 1, 0, 0, 1, 1,
-1.62079, -0.4829071, -0.6150562, 1, 0, 0, 1, 1,
-1.590456, 0.1466602, -0.8221059, 1, 0, 0, 1, 1,
-1.58742, -0.8508099, -4.405307, 0, 0, 0, 1, 1,
-1.571503, 0.7056376, -1.310692, 0, 0, 0, 1, 1,
-1.569424, -1.455045, -3.554734, 0, 0, 0, 1, 1,
-1.517357, -1.659764, -3.336641, 0, 0, 0, 1, 1,
-1.504184, -0.8346571, -2.170422, 0, 0, 0, 1, 1,
-1.49493, 1.396044, -0.7904826, 0, 0, 0, 1, 1,
-1.483773, 1.040505, 0.4203021, 0, 0, 0, 1, 1,
-1.476695, 1.09863, -1.814685, 1, 1, 1, 1, 1,
-1.463092, 0.6043175, -1.229016, 1, 1, 1, 1, 1,
-1.458442, 0.4645862, 0.3472677, 1, 1, 1, 1, 1,
-1.441403, -0.4549125, -0.6646153, 1, 1, 1, 1, 1,
-1.432992, -2.084761, -4.3323, 1, 1, 1, 1, 1,
-1.417879, 0.3002052, -1.64235, 1, 1, 1, 1, 1,
-1.417508, -1.469355, -2.835882, 1, 1, 1, 1, 1,
-1.410376, -0.3666977, -0.9412171, 1, 1, 1, 1, 1,
-1.401005, -0.1556704, -2.900198, 1, 1, 1, 1, 1,
-1.384541, -0.4965503, -2.754529, 1, 1, 1, 1, 1,
-1.380938, 0.08613239, -1.103011, 1, 1, 1, 1, 1,
-1.371866, -0.03742944, -0.5702679, 1, 1, 1, 1, 1,
-1.363745, 0.01659559, -2.121221, 1, 1, 1, 1, 1,
-1.355511, 0.9894579, -0.05494265, 1, 1, 1, 1, 1,
-1.353715, -0.2486565, -1.692905, 1, 1, 1, 1, 1,
-1.350643, -0.3368866, -3.027223, 0, 0, 1, 1, 1,
-1.344813, -1.136946, -3.353056, 1, 0, 0, 1, 1,
-1.337277, -0.5418026, -0.8803232, 1, 0, 0, 1, 1,
-1.331868, 0.9934568, -0.8095896, 1, 0, 0, 1, 1,
-1.32707, -0.5127665, -3.126663, 1, 0, 0, 1, 1,
-1.323052, 1.535088, 0.05147014, 1, 0, 0, 1, 1,
-1.318677, 0.6707048, -1.986971, 0, 0, 0, 1, 1,
-1.317873, -0.2331214, -2.467755, 0, 0, 0, 1, 1,
-1.314312, -0.2181017, -1.156828, 0, 0, 0, 1, 1,
-1.306587, -0.6317976, -1.552077, 0, 0, 0, 1, 1,
-1.306438, 0.6260706, -0.3440181, 0, 0, 0, 1, 1,
-1.300158, -1.915142, -1.42518, 0, 0, 0, 1, 1,
-1.283306, -0.6855615, -1.00712, 0, 0, 0, 1, 1,
-1.277599, -0.9044155, -2.034885, 1, 1, 1, 1, 1,
-1.276302, -0.3294623, -0.6906787, 1, 1, 1, 1, 1,
-1.27509, -1.189443, -1.662428, 1, 1, 1, 1, 1,
-1.267768, 0.1855236, -2.833221, 1, 1, 1, 1, 1,
-1.267083, 0.5701787, -1.448554, 1, 1, 1, 1, 1,
-1.26282, 0.2030922, -2.062879, 1, 1, 1, 1, 1,
-1.261929, 0.1725392, -1.278906, 1, 1, 1, 1, 1,
-1.259931, 3.334114, -0.9392764, 1, 1, 1, 1, 1,
-1.256146, -2.222163, -1.964457, 1, 1, 1, 1, 1,
-1.252428, -0.6970291, -4.259805, 1, 1, 1, 1, 1,
-1.243878, 1.034112, -1.489915, 1, 1, 1, 1, 1,
-1.242481, -1.004708, -1.358356, 1, 1, 1, 1, 1,
-1.241265, -0.4582958, -0.3332836, 1, 1, 1, 1, 1,
-1.240338, 0.404701, -1.265846, 1, 1, 1, 1, 1,
-1.237951, 0.4538975, -1.755302, 1, 1, 1, 1, 1,
-1.22478, 0.6643966, -0.4410961, 0, 0, 1, 1, 1,
-1.22441, 0.7226162, -1.716857, 1, 0, 0, 1, 1,
-1.222287, 0.8741593, -0.3449593, 1, 0, 0, 1, 1,
-1.221696, -0.2127157, -1.030957, 1, 0, 0, 1, 1,
-1.220407, -0.9644396, -2.424811, 1, 0, 0, 1, 1,
-1.21686, 0.383233, -1.791471, 1, 0, 0, 1, 1,
-1.214723, -1.465105, -0.05056693, 0, 0, 0, 1, 1,
-1.213566, -0.1714629, -2.013067, 0, 0, 0, 1, 1,
-1.212765, -0.2462621, -1.670702, 0, 0, 0, 1, 1,
-1.205042, -1.802158, -3.066789, 0, 0, 0, 1, 1,
-1.204574, 0.1985804, -2.131945, 0, 0, 0, 1, 1,
-1.204486, -0.02436615, -2.115806, 0, 0, 0, 1, 1,
-1.201987, 0.1829286, -0.6613232, 0, 0, 0, 1, 1,
-1.196994, -0.8695047, -0.6935447, 1, 1, 1, 1, 1,
-1.192079, 2.193876, -0.3032883, 1, 1, 1, 1, 1,
-1.190894, -1.090784, -3.165588, 1, 1, 1, 1, 1,
-1.188755, -0.2205615, -0.535905, 1, 1, 1, 1, 1,
-1.18784, 1.733817, -0.854866, 1, 1, 1, 1, 1,
-1.185513, -0.05483246, -2.851543, 1, 1, 1, 1, 1,
-1.184627, 0.9542068, -0.8249485, 1, 1, 1, 1, 1,
-1.178531, -2.297207, -2.326155, 1, 1, 1, 1, 1,
-1.167902, -0.1288436, -1.457515, 1, 1, 1, 1, 1,
-1.165192, -0.2418714, -1.94429, 1, 1, 1, 1, 1,
-1.157295, -0.461176, -2.995112, 1, 1, 1, 1, 1,
-1.138775, -1.359954, -3.565832, 1, 1, 1, 1, 1,
-1.138519, -1.668013, -4.065155, 1, 1, 1, 1, 1,
-1.130251, -1.226878, -1.588873, 1, 1, 1, 1, 1,
-1.125571, 0.3904875, -1.850259, 1, 1, 1, 1, 1,
-1.115647, -1.601283, -2.836349, 0, 0, 1, 1, 1,
-1.105229, -0.7615417, -2.386325, 1, 0, 0, 1, 1,
-1.100999, 1.330188, -0.6465608, 1, 0, 0, 1, 1,
-1.100207, -0.2402334, -1.621056, 1, 0, 0, 1, 1,
-1.095837, 0.03426937, -3.464087, 1, 0, 0, 1, 1,
-1.092392, -0.2281828, -2.361707, 1, 0, 0, 1, 1,
-1.080835, -0.05142988, -1.68131, 0, 0, 0, 1, 1,
-1.073102, -0.8120809, -1.254695, 0, 0, 0, 1, 1,
-1.066122, -0.5389864, -3.032195, 0, 0, 0, 1, 1,
-1.064826, 0.3743156, -0.1238107, 0, 0, 0, 1, 1,
-1.055184, 0.1352482, -3.417807, 0, 0, 0, 1, 1,
-1.038961, 0.8693541, -0.5113567, 0, 0, 0, 1, 1,
-1.037692, -0.27462, -1.793232, 0, 0, 0, 1, 1,
-1.034414, 0.6374609, 0.380201, 1, 1, 1, 1, 1,
-1.024281, -0.7161597, -3.042235, 1, 1, 1, 1, 1,
-1.003779, -0.4062304, -2.65709, 1, 1, 1, 1, 1,
-1.00227, -1.591279, -4.107947, 1, 1, 1, 1, 1,
-1.000566, 1.271647, -1.179724, 1, 1, 1, 1, 1,
-0.9928558, 1.088701, 0.04155732, 1, 1, 1, 1, 1,
-0.9866861, 2.300843, 1.565798, 1, 1, 1, 1, 1,
-0.9857619, -1.044311, -2.624101, 1, 1, 1, 1, 1,
-0.9721668, -0.4148124, -1.333856, 1, 1, 1, 1, 1,
-0.9706395, 0.1647828, -2.112619, 1, 1, 1, 1, 1,
-0.9631352, 0.7402884, -0.123797, 1, 1, 1, 1, 1,
-0.9621746, 0.7049804, -1.482457, 1, 1, 1, 1, 1,
-0.9572637, -0.7656856, -3.940866, 1, 1, 1, 1, 1,
-0.9547179, 0.004680563, -1.732674, 1, 1, 1, 1, 1,
-0.9474432, -1.049523, 0.1277343, 1, 1, 1, 1, 1,
-0.9473224, 0.7184342, -0.4467713, 0, 0, 1, 1, 1,
-0.9471374, -0.2158549, -3.661278, 1, 0, 0, 1, 1,
-0.9448936, -0.7866848, -1.349982, 1, 0, 0, 1, 1,
-0.9440754, 1.35963, -0.7975572, 1, 0, 0, 1, 1,
-0.9374025, 1.858182, -1.130758, 1, 0, 0, 1, 1,
-0.9312702, -1.062553, -0.8933681, 1, 0, 0, 1, 1,
-0.9245159, -0.629132, -1.630626, 0, 0, 0, 1, 1,
-0.9191559, -2.675789, -1.414547, 0, 0, 0, 1, 1,
-0.9138319, 0.7402425, -1.06955, 0, 0, 0, 1, 1,
-0.9057153, -1.076977, -3.341815, 0, 0, 0, 1, 1,
-0.9053646, -1.260408, -1.751057, 0, 0, 0, 1, 1,
-0.9042631, -1.767334, -3.959352, 0, 0, 0, 1, 1,
-0.9017282, -1.312607, -2.465049, 0, 0, 0, 1, 1,
-0.8890724, -0.9605087, -2.45722, 1, 1, 1, 1, 1,
-0.8750968, 0.911844, -2.146677, 1, 1, 1, 1, 1,
-0.8739039, 0.02004701, -2.984556, 1, 1, 1, 1, 1,
-0.8714769, -2.21932, -2.713002, 1, 1, 1, 1, 1,
-0.8711468, 0.3938269, -0.7541634, 1, 1, 1, 1, 1,
-0.8696809, 1.131946, -1.668176, 1, 1, 1, 1, 1,
-0.8691016, 0.4402865, -0.7280161, 1, 1, 1, 1, 1,
-0.8689535, -1.240954, -1.758883, 1, 1, 1, 1, 1,
-0.8645489, 0.3337425, -1.452747, 1, 1, 1, 1, 1,
-0.8605852, 1.671975, 0.1144236, 1, 1, 1, 1, 1,
-0.8585417, -0.7234181, -0.831638, 1, 1, 1, 1, 1,
-0.853414, 0.9205739, 0.0798378, 1, 1, 1, 1, 1,
-0.8446537, -0.6776671, -4.897057, 1, 1, 1, 1, 1,
-0.8422856, -0.5887397, -1.737721, 1, 1, 1, 1, 1,
-0.8383559, 1.040735, -2.223068, 1, 1, 1, 1, 1,
-0.8377349, -0.2388332, -1.673965, 0, 0, 1, 1, 1,
-0.8358241, 0.08518465, -0.5614167, 1, 0, 0, 1, 1,
-0.8317689, -0.5685703, -2.029997, 1, 0, 0, 1, 1,
-0.8260109, -0.6969413, -0.216571, 1, 0, 0, 1, 1,
-0.8232222, -0.1132251, -2.863927, 1, 0, 0, 1, 1,
-0.821871, -0.2624203, -0.8697943, 1, 0, 0, 1, 1,
-0.8208173, 2.594378, -0.7910123, 0, 0, 0, 1, 1,
-0.8086037, 0.2452887, -1.388904, 0, 0, 0, 1, 1,
-0.8054385, 1.109657, -0.7034621, 0, 0, 0, 1, 1,
-0.8013476, 0.7411139, -0.6418217, 0, 0, 0, 1, 1,
-0.7960033, -1.553583, -2.981665, 0, 0, 0, 1, 1,
-0.7926708, 0.8817902, -1.469837, 0, 0, 0, 1, 1,
-0.7912449, -0.9505395, -2.43003, 0, 0, 0, 1, 1,
-0.7850536, 1.296916, -0.3329703, 1, 1, 1, 1, 1,
-0.7822666, 1.973024, -2.307755, 1, 1, 1, 1, 1,
-0.7818868, -0.7948146, -1.503327, 1, 1, 1, 1, 1,
-0.7752795, -0.9717861, -3.028702, 1, 1, 1, 1, 1,
-0.7738156, 0.201833, -0.5517128, 1, 1, 1, 1, 1,
-0.7734323, -0.1573474, -2.578104, 1, 1, 1, 1, 1,
-0.7717489, 1.167056, -0.7219655, 1, 1, 1, 1, 1,
-0.7672952, 0.6745549, -1.086777, 1, 1, 1, 1, 1,
-0.76713, 0.9400308, -0.5213723, 1, 1, 1, 1, 1,
-0.766589, -1.402007, -0.9569327, 1, 1, 1, 1, 1,
-0.7662592, -0.4341685, -1.540665, 1, 1, 1, 1, 1,
-0.7651953, 2.90401, 0.9018694, 1, 1, 1, 1, 1,
-0.764615, -0.1005343, 0.4244177, 1, 1, 1, 1, 1,
-0.7643529, -1.002826, -2.031125, 1, 1, 1, 1, 1,
-0.7634527, 0.3836353, -1.472332, 1, 1, 1, 1, 1,
-0.7539691, 2.281901, -0.9089032, 0, 0, 1, 1, 1,
-0.7536785, -1.159011, -1.658027, 1, 0, 0, 1, 1,
-0.7496211, -0.1577723, -3.489064, 1, 0, 0, 1, 1,
-0.7490317, 1.154862, 1.524671, 1, 0, 0, 1, 1,
-0.7448398, -1.201719, -3.624776, 1, 0, 0, 1, 1,
-0.7435834, -0.3564568, -1.611512, 1, 0, 0, 1, 1,
-0.7350128, -0.8251578, -2.381963, 0, 0, 0, 1, 1,
-0.7301417, -1.668694, -3.53575, 0, 0, 0, 1, 1,
-0.7298343, -0.01669517, -2.391419, 0, 0, 0, 1, 1,
-0.7293634, -1.959429, -1.723117, 0, 0, 0, 1, 1,
-0.7257031, -2.25493, -3.601279, 0, 0, 0, 1, 1,
-0.7206883, -0.03143321, -0.8312231, 0, 0, 0, 1, 1,
-0.7106581, 0.5039083, -2.053854, 0, 0, 0, 1, 1,
-0.7048286, 1.292358, 0.8406171, 1, 1, 1, 1, 1,
-0.7047513, 1.994579, 0.7828005, 1, 1, 1, 1, 1,
-0.7038169, 1.727698, -1.4049, 1, 1, 1, 1, 1,
-0.6985383, -0.8319055, -3.082518, 1, 1, 1, 1, 1,
-0.6931753, 1.470259, 0.5138933, 1, 1, 1, 1, 1,
-0.6927466, -0.1477135, -1.894038, 1, 1, 1, 1, 1,
-0.6923783, 1.2918, 0.08185148, 1, 1, 1, 1, 1,
-0.6874626, 0.519585, -2.721131, 1, 1, 1, 1, 1,
-0.6866543, -0.4655843, -2.715326, 1, 1, 1, 1, 1,
-0.6864895, 1.119785, -0.4313926, 1, 1, 1, 1, 1,
-0.6854866, 0.5754913, -1.9236, 1, 1, 1, 1, 1,
-0.6805472, 0.1160625, -0.7830501, 1, 1, 1, 1, 1,
-0.6688131, -1.419662, -2.329201, 1, 1, 1, 1, 1,
-0.6657783, 0.6355917, -0.5595315, 1, 1, 1, 1, 1,
-0.6635192, -0.5789931, -1.9096, 1, 1, 1, 1, 1,
-0.6583831, -0.8382204, -3.209754, 0, 0, 1, 1, 1,
-0.6546108, 1.112232, -1.478383, 1, 0, 0, 1, 1,
-0.6543922, 1.403216, -1.15682, 1, 0, 0, 1, 1,
-0.6519763, -0.1186355, -2.044766, 1, 0, 0, 1, 1,
-0.6447818, -0.6656817, -3.840162, 1, 0, 0, 1, 1,
-0.643947, -0.4525965, -0.8799984, 1, 0, 0, 1, 1,
-0.6429031, -0.5489811, -2.922427, 0, 0, 0, 1, 1,
-0.6406702, 0.3166162, -0.7705169, 0, 0, 0, 1, 1,
-0.6358311, 0.6993961, -1.618558, 0, 0, 0, 1, 1,
-0.6342037, 0.1734757, -0.3887922, 0, 0, 0, 1, 1,
-0.6234747, 0.4069118, -2.139754, 0, 0, 0, 1, 1,
-0.6208564, 0.5397946, -1.06089, 0, 0, 0, 1, 1,
-0.6197706, 0.558809, -1.389606, 0, 0, 0, 1, 1,
-0.6110346, -0.05010996, -1.628957, 1, 1, 1, 1, 1,
-0.6048707, 1.107729, -1.386019, 1, 1, 1, 1, 1,
-0.5923469, -0.3504431, -1.760676, 1, 1, 1, 1, 1,
-0.591184, 0.860423, -1.720669, 1, 1, 1, 1, 1,
-0.5903541, -0.8334376, -2.390467, 1, 1, 1, 1, 1,
-0.5895869, -0.9916785, -3.063406, 1, 1, 1, 1, 1,
-0.5893133, 1.616737, -0.2264405, 1, 1, 1, 1, 1,
-0.5886816, -1.674153, -2.278724, 1, 1, 1, 1, 1,
-0.5868602, -0.8462843, -3.844319, 1, 1, 1, 1, 1,
-0.5865402, 0.6311169, -0.7584134, 1, 1, 1, 1, 1,
-0.5854928, 0.8066146, -1.055356, 1, 1, 1, 1, 1,
-0.5807428, -0.5378532, -1.657422, 1, 1, 1, 1, 1,
-0.5805959, -0.3284078, -1.85707, 1, 1, 1, 1, 1,
-0.5778896, 1.119325, 0.08159789, 1, 1, 1, 1, 1,
-0.5752419, -0.5977449, -3.509926, 1, 1, 1, 1, 1,
-0.574264, -0.1723389, 0.5043833, 0, 0, 1, 1, 1,
-0.5704159, 0.3268203, -1.25279, 1, 0, 0, 1, 1,
-0.5691034, 1.621848, -0.4433999, 1, 0, 0, 1, 1,
-0.5641462, -1.49952, -2.505355, 1, 0, 0, 1, 1,
-0.5604105, 0.7590768, -0.4687876, 1, 0, 0, 1, 1,
-0.5602668, 0.9159141, -2.15913, 1, 0, 0, 1, 1,
-0.5598283, 0.4130711, 0.2642689, 0, 0, 0, 1, 1,
-0.5524679, -0.3714491, -2.569996, 0, 0, 0, 1, 1,
-0.5458653, 0.3055927, -1.642506, 0, 0, 0, 1, 1,
-0.5443113, -0.9919648, -2.056462, 0, 0, 0, 1, 1,
-0.5296301, -1.094627, -2.99068, 0, 0, 0, 1, 1,
-0.5292684, 0.5059463, 0.2322907, 0, 0, 0, 1, 1,
-0.528776, 0.9412926, -2.825285, 0, 0, 0, 1, 1,
-0.5281013, 0.5920916, -0.4249018, 1, 1, 1, 1, 1,
-0.52423, 0.08461137, -1.694377, 1, 1, 1, 1, 1,
-0.5221081, 1.406708, -0.7412289, 1, 1, 1, 1, 1,
-0.5205568, 0.8011969, 0.6234997, 1, 1, 1, 1, 1,
-0.5200549, 0.28411, -0.6291184, 1, 1, 1, 1, 1,
-0.5175077, -0.509248, -2.526666, 1, 1, 1, 1, 1,
-0.5155354, 0.2140211, -1.332879, 1, 1, 1, 1, 1,
-0.515327, -0.4568735, -2.801709, 1, 1, 1, 1, 1,
-0.5116494, 1.469486, 1.25893, 1, 1, 1, 1, 1,
-0.5110089, -0.006828404, -1.809944, 1, 1, 1, 1, 1,
-0.510684, 1.611782, 0.1008488, 1, 1, 1, 1, 1,
-0.5096828, -0.5785099, -1.932032, 1, 1, 1, 1, 1,
-0.5075707, 1.704363, -0.7248186, 1, 1, 1, 1, 1,
-0.5066875, -0.5212164, -2.89208, 1, 1, 1, 1, 1,
-0.5048626, 0.3674791, -1.596768, 1, 1, 1, 1, 1,
-0.5046408, 0.00512632, -1.452147, 0, 0, 1, 1, 1,
-0.5012468, 1.117565, 0.7945763, 1, 0, 0, 1, 1,
-0.4962322, 1.693326, -0.9907444, 1, 0, 0, 1, 1,
-0.495699, -1.0346, -2.107148, 1, 0, 0, 1, 1,
-0.4923087, -1.459755, -2.918441, 1, 0, 0, 1, 1,
-0.4870075, -1.587324, -2.318568, 1, 0, 0, 1, 1,
-0.4861146, -0.3061261, -2.983087, 0, 0, 0, 1, 1,
-0.4829024, -0.3180569, -3.739684, 0, 0, 0, 1, 1,
-0.4823275, 0.5849512, -0.6528272, 0, 0, 0, 1, 1,
-0.4783277, -2.476567, -1.945967, 0, 0, 0, 1, 1,
-0.4766178, -0.09950235, -1.265022, 0, 0, 0, 1, 1,
-0.4764877, 1.860858, 0.7944189, 0, 0, 0, 1, 1,
-0.4696119, -0.2549604, -0.807653, 0, 0, 0, 1, 1,
-0.4693475, 0.06440555, -1.362037, 1, 1, 1, 1, 1,
-0.4658357, -1.157197, -1.913952, 1, 1, 1, 1, 1,
-0.4628725, -0.885387, -2.415297, 1, 1, 1, 1, 1,
-0.458539, 0.122427, -2.883551, 1, 1, 1, 1, 1,
-0.457564, -0.790704, -3.534767, 1, 1, 1, 1, 1,
-0.4553476, 0.9892386, -0.5313509, 1, 1, 1, 1, 1,
-0.4519418, 0.7451614, -2.309958, 1, 1, 1, 1, 1,
-0.4510732, 0.1785858, -1.755084, 1, 1, 1, 1, 1,
-0.4489882, -1.440897, -1.670484, 1, 1, 1, 1, 1,
-0.4487608, -1.581031, -1.18009, 1, 1, 1, 1, 1,
-0.4378366, 1.237803, 0.3299623, 1, 1, 1, 1, 1,
-0.4368455, -2.664912, -3.573898, 1, 1, 1, 1, 1,
-0.4365248, 0.06614741, -1.423302, 1, 1, 1, 1, 1,
-0.4313125, 1.659921, -0.8441204, 1, 1, 1, 1, 1,
-0.4309777, -0.7223569, -1.812063, 1, 1, 1, 1, 1,
-0.4297175, 1.970726, -1.510194, 0, 0, 1, 1, 1,
-0.4258297, 0.1768239, -3.766245, 1, 0, 0, 1, 1,
-0.4246725, 1.223823, 1.316126, 1, 0, 0, 1, 1,
-0.4221563, -0.07296259, -1.923431, 1, 0, 0, 1, 1,
-0.4120802, -0.1017241, -1.449062, 1, 0, 0, 1, 1,
-0.409491, -1.167378, -3.292202, 1, 0, 0, 1, 1,
-0.4071597, 0.2992838, -3.266838, 0, 0, 0, 1, 1,
-0.4066746, -1.237471, -2.556606, 0, 0, 0, 1, 1,
-0.4046554, 2.157009, -1.327693, 0, 0, 0, 1, 1,
-0.4020315, 0.5474183, 0.1226542, 0, 0, 0, 1, 1,
-0.3965755, 0.87057, 0.2389414, 0, 0, 0, 1, 1,
-0.3927103, -1.532787, -2.46441, 0, 0, 0, 1, 1,
-0.3915873, 0.5116789, -1.664171, 0, 0, 0, 1, 1,
-0.389525, -0.7011434, -3.230147, 1, 1, 1, 1, 1,
-0.3837035, -0.635504, -1.842475, 1, 1, 1, 1, 1,
-0.3785818, 0.05166499, -2.674479, 1, 1, 1, 1, 1,
-0.3739523, 1.313785, 1.902901, 1, 1, 1, 1, 1,
-0.3693705, 0.1077056, -1.85794, 1, 1, 1, 1, 1,
-0.3682694, 0.06255325, -1.851126, 1, 1, 1, 1, 1,
-0.3674078, -0.8216138, -3.476927, 1, 1, 1, 1, 1,
-0.3657364, 0.9971453, -0.0729689, 1, 1, 1, 1, 1,
-0.3588389, 0.3682119, -0.7995921, 1, 1, 1, 1, 1,
-0.3585363, 0.8885581, -0.1593023, 1, 1, 1, 1, 1,
-0.3584394, -1.144274, -4.331928, 1, 1, 1, 1, 1,
-0.3562934, 0.7512265, -0.8054652, 1, 1, 1, 1, 1,
-0.3524634, -0.6777533, -4.196311, 1, 1, 1, 1, 1,
-0.3431353, -0.1010968, -1.674767, 1, 1, 1, 1, 1,
-0.3417602, -1.383652, -2.974168, 1, 1, 1, 1, 1,
-0.3406188, -0.8485709, -1.804217, 0, 0, 1, 1, 1,
-0.3398248, 0.1014092, -0.7657672, 1, 0, 0, 1, 1,
-0.3342371, -1.521848, -2.212773, 1, 0, 0, 1, 1,
-0.3309528, 0.3405852, -1.68592, 1, 0, 0, 1, 1,
-0.3246281, -0.2997424, -2.403242, 1, 0, 0, 1, 1,
-0.3233346, 0.4180978, -0.5623798, 1, 0, 0, 1, 1,
-0.3210056, -2.086345, -3.23144, 0, 0, 0, 1, 1,
-0.3208728, 0.2861064, -1.491875, 0, 0, 0, 1, 1,
-0.3207688, 1.025043, -0.1555238, 0, 0, 0, 1, 1,
-0.3166779, 0.9444623, 0.8132782, 0, 0, 0, 1, 1,
-0.3105647, 1.545517, -1.353565, 0, 0, 0, 1, 1,
-0.3068107, -0.6541329, -1.484002, 0, 0, 0, 1, 1,
-0.3062778, 0.4911456, -0.7793181, 0, 0, 0, 1, 1,
-0.3060307, 1.697443, -0.5580997, 1, 1, 1, 1, 1,
-0.3025587, -0.2875003, -1.686428, 1, 1, 1, 1, 1,
-0.3023966, 0.7527078, -0.4197811, 1, 1, 1, 1, 1,
-0.3002101, -0.8769804, -3.090683, 1, 1, 1, 1, 1,
-0.2979364, 0.5904763, 0.3080163, 1, 1, 1, 1, 1,
-0.2954816, 0.783496, 0.762946, 1, 1, 1, 1, 1,
-0.2933702, -0.2216965, -2.034066, 1, 1, 1, 1, 1,
-0.2929086, 2.332402, -1.023139, 1, 1, 1, 1, 1,
-0.2828109, -1.710073, -3.791164, 1, 1, 1, 1, 1,
-0.2813685, -0.8241804, -3.39081, 1, 1, 1, 1, 1,
-0.2806246, 1.48881, 0.5833434, 1, 1, 1, 1, 1,
-0.2776088, 0.6208317, -0.9541795, 1, 1, 1, 1, 1,
-0.2751085, 0.6660384, 0.1472344, 1, 1, 1, 1, 1,
-0.2709594, -0.2599762, -2.991367, 1, 1, 1, 1, 1,
-0.2701277, -0.5755343, -1.564652, 1, 1, 1, 1, 1,
-0.2638474, 0.477636, -0.4885733, 0, 0, 1, 1, 1,
-0.2631006, -0.7645671, -2.02351, 1, 0, 0, 1, 1,
-0.2540165, -0.6152607, -1.928898, 1, 0, 0, 1, 1,
-0.2479662, 0.6812178, -0.3623107, 1, 0, 0, 1, 1,
-0.2460192, -0.05707567, -1.601276, 1, 0, 0, 1, 1,
-0.2425867, 0.1045832, 0.7233523, 1, 0, 0, 1, 1,
-0.2404561, -0.5158169, -4.716538, 0, 0, 0, 1, 1,
-0.2397481, 0.510181, -1.647185, 0, 0, 0, 1, 1,
-0.2381085, -0.3700104, -3.033156, 0, 0, 0, 1, 1,
-0.233348, -1.337212, -3.241845, 0, 0, 0, 1, 1,
-0.2329985, 0.5243794, 0.3484119, 0, 0, 0, 1, 1,
-0.2320104, -0.609485, -3.403066, 0, 0, 0, 1, 1,
-0.2315148, -0.426154, -2.895659, 0, 0, 0, 1, 1,
-0.228647, -1.643131, -4.587219, 1, 1, 1, 1, 1,
-0.2285983, -0.5234829, -1.615916, 1, 1, 1, 1, 1,
-0.2264167, -1.041996, -1.589214, 1, 1, 1, 1, 1,
-0.2260044, 1.242046, -1.467274, 1, 1, 1, 1, 1,
-0.2246854, -0.8164831, -4.325696, 1, 1, 1, 1, 1,
-0.218798, -0.8856317, -2.985557, 1, 1, 1, 1, 1,
-0.2186991, 0.4692748, 0.4061864, 1, 1, 1, 1, 1,
-0.2151755, 1.885908, -0.9160895, 1, 1, 1, 1, 1,
-0.209968, 0.5546938, 0.2166475, 1, 1, 1, 1, 1,
-0.2094792, 3.379864, 0.01557649, 1, 1, 1, 1, 1,
-0.2079549, -2.345673, -3.560365, 1, 1, 1, 1, 1,
-0.2048659, -0.7856126, -4.769578, 1, 1, 1, 1, 1,
-0.2032714, -0.6507847, -3.186898, 1, 1, 1, 1, 1,
-0.2030735, 0.8100026, -2.046627, 1, 1, 1, 1, 1,
-0.2008947, -0.862046, -3.551541, 1, 1, 1, 1, 1,
-0.191519, 1.764631, 0.09544932, 0, 0, 1, 1, 1,
-0.189008, -0.9060271, -1.900161, 1, 0, 0, 1, 1,
-0.1860785, -0.09115028, -2.490155, 1, 0, 0, 1, 1,
-0.1821327, 0.1827591, 1.439354, 1, 0, 0, 1, 1,
-0.1798354, -0.2643569, -1.823067, 1, 0, 0, 1, 1,
-0.1790046, 1.273287, -0.6332292, 1, 0, 0, 1, 1,
-0.1710437, -0.7300968, -1.457019, 0, 0, 0, 1, 1,
-0.1703767, -1.126199, -3.38396, 0, 0, 0, 1, 1,
-0.16773, 2.000094, -0.7713199, 0, 0, 0, 1, 1,
-0.1669628, -1.805634, -0.7548931, 0, 0, 0, 1, 1,
-0.1599005, -0.5553373, -2.55388, 0, 0, 0, 1, 1,
-0.1516843, 0.2854767, -1.602487, 0, 0, 0, 1, 1,
-0.1515243, 1.872313, -0.07845221, 0, 0, 0, 1, 1,
-0.1514582, -0.7345509, -2.797503, 1, 1, 1, 1, 1,
-0.1499772, 0.3637877, -0.7934503, 1, 1, 1, 1, 1,
-0.1497923, -0.01413197, -0.3251227, 1, 1, 1, 1, 1,
-0.1491534, 0.6477235, -0.4221715, 1, 1, 1, 1, 1,
-0.1450208, -1.369573, -4.335446, 1, 1, 1, 1, 1,
-0.1424537, 0.1179706, 0.7458636, 1, 1, 1, 1, 1,
-0.1396775, -2.567535, -3.402001, 1, 1, 1, 1, 1,
-0.1396647, -0.6692155, -3.742151, 1, 1, 1, 1, 1,
-0.1388425, -1.396859, -2.685285, 1, 1, 1, 1, 1,
-0.1376698, -3.097642, -2.891595, 1, 1, 1, 1, 1,
-0.1355356, -0.4866172, -2.202419, 1, 1, 1, 1, 1,
-0.1338962, -0.05423527, -2.022006, 1, 1, 1, 1, 1,
-0.1260492, 1.449899, -0.4555271, 1, 1, 1, 1, 1,
-0.1179069, 1.074347, 0.1446192, 1, 1, 1, 1, 1,
-0.1101346, -0.5571696, -1.623365, 1, 1, 1, 1, 1,
-0.1098625, 0.9954322, -3.308408, 0, 0, 1, 1, 1,
-0.1067856, 0.8452949, 1.340918, 1, 0, 0, 1, 1,
-0.1062857, 0.5000226, 1.902162, 1, 0, 0, 1, 1,
-0.1010239, -0.2699449, -3.46365, 1, 0, 0, 1, 1,
-0.100924, -1.557858, -2.598953, 1, 0, 0, 1, 1,
-0.09869045, -0.5555808, -2.477529, 1, 0, 0, 1, 1,
-0.09790035, -1.014443, -3.919487, 0, 0, 0, 1, 1,
-0.09323795, -2.857575, -0.9585858, 0, 0, 0, 1, 1,
-0.09261985, 0.7384796, 0.1772207, 0, 0, 0, 1, 1,
-0.09029887, -1.399321, -1.90948, 0, 0, 0, 1, 1,
-0.09014215, -1.119524, -0.969929, 0, 0, 0, 1, 1,
-0.08820145, 0.7942665, 0.5739834, 0, 0, 0, 1, 1,
-0.0876221, 1.733842, -1.830625, 0, 0, 0, 1, 1,
-0.08739102, -0.217287, -1.573, 1, 1, 1, 1, 1,
-0.08672507, -0.02164897, -1.491407, 1, 1, 1, 1, 1,
-0.08598556, -0.3818706, -3.627146, 1, 1, 1, 1, 1,
-0.08299631, 0.04966735, -1.880286, 1, 1, 1, 1, 1,
-0.08289979, 0.6188363, -0.4081097, 1, 1, 1, 1, 1,
-0.07811693, -0.002890747, -2.03399, 1, 1, 1, 1, 1,
-0.07754046, 1.261176, 0.1073188, 1, 1, 1, 1, 1,
-0.07749295, 1.199534, 0.4295168, 1, 1, 1, 1, 1,
-0.07648611, 0.4582086, -0.6039514, 1, 1, 1, 1, 1,
-0.06985786, 2.370175, 1.813334, 1, 1, 1, 1, 1,
-0.06676846, -0.8470355, -2.322556, 1, 1, 1, 1, 1,
-0.06354333, -0.9042047, -3.266892, 1, 1, 1, 1, 1,
-0.06341995, 1.671543, 1.337929, 1, 1, 1, 1, 1,
-0.06116162, 1.729528, 0.7288268, 1, 1, 1, 1, 1,
-0.06070916, -0.8843557, -4.572693, 1, 1, 1, 1, 1,
-0.06059707, -0.7628896, -2.999196, 0, 0, 1, 1, 1,
-0.05898785, -1.596087, -0.5696105, 1, 0, 0, 1, 1,
-0.05825792, -0.07590621, -4.406862, 1, 0, 0, 1, 1,
-0.05746707, 0.6817026, -1.127252, 1, 0, 0, 1, 1,
-0.05737537, -0.546731, -1.840534, 1, 0, 0, 1, 1,
-0.05370399, -0.8107029, -2.320625, 1, 0, 0, 1, 1,
-0.0517459, 0.6801736, 0.08360647, 0, 0, 0, 1, 1,
-0.04943188, 0.4332295, 0.4365675, 0, 0, 0, 1, 1,
-0.04865169, 0.002094698, -1.275515, 0, 0, 0, 1, 1,
-0.0428964, 0.7744784, 1.064961, 0, 0, 0, 1, 1,
-0.03955858, -0.7148248, -3.403487, 0, 0, 0, 1, 1,
-0.03898164, 0.4807856, -0.2150411, 0, 0, 0, 1, 1,
-0.03647066, 0.1897314, 1.220174, 0, 0, 0, 1, 1,
-0.03075596, -0.9169741, -1.188231, 1, 1, 1, 1, 1,
-0.02660996, -0.278562, -1.401983, 1, 1, 1, 1, 1,
-0.02652118, 0.8027581, -1.645962, 1, 1, 1, 1, 1,
-0.02560213, 0.5887592, -0.3221101, 1, 1, 1, 1, 1,
-0.02428203, 1.073516, 1.073786, 1, 1, 1, 1, 1,
-0.02396722, -0.6685176, -0.8465337, 1, 1, 1, 1, 1,
-0.02158729, -0.5666741, -1.994416, 1, 1, 1, 1, 1,
-0.01505614, -0.9883999, -3.391988, 1, 1, 1, 1, 1,
-0.01070386, -1.473233, -3.809088, 1, 1, 1, 1, 1,
-0.008985386, -0.675707, -4.31307, 1, 1, 1, 1, 1,
-0.005527757, -0.6093138, -2.074783, 1, 1, 1, 1, 1,
-0.004688305, -1.012933, -3.218586, 1, 1, 1, 1, 1,
-0.002149147, 1.664866, 0.07186759, 1, 1, 1, 1, 1,
-0.000395358, -0.6393594, -2.145235, 1, 1, 1, 1, 1,
0.004676334, -0.2108831, 1.181239, 1, 1, 1, 1, 1,
0.004769085, -0.8942613, 2.944933, 0, 0, 1, 1, 1,
0.007689219, 1.778043, 0.4319354, 1, 0, 0, 1, 1,
0.0102183, 1.322667, 0.5843617, 1, 0, 0, 1, 1,
0.0140756, 0.7604603, -0.1515343, 1, 0, 0, 1, 1,
0.01514387, 0.06786785, 1.406916, 1, 0, 0, 1, 1,
0.01573579, -1.739928, 3.286685, 1, 0, 0, 1, 1,
0.01614336, -0.03893516, 2.531245, 0, 0, 0, 1, 1,
0.01700586, -3.01726, 4.380061, 0, 0, 0, 1, 1,
0.01933202, -1.227954, 0.7816107, 0, 0, 0, 1, 1,
0.02472101, 1.117212, -0.5480934, 0, 0, 0, 1, 1,
0.03133048, -0.4526536, 3.081504, 0, 0, 0, 1, 1,
0.03620743, 1.068847, -0.7884679, 0, 0, 0, 1, 1,
0.04144418, 1.42808, -0.5151974, 0, 0, 0, 1, 1,
0.04773965, -0.4543326, 3.027406, 1, 1, 1, 1, 1,
0.04817019, -0.7748838, 2.42877, 1, 1, 1, 1, 1,
0.048921, 0.3272416, 0.5834229, 1, 1, 1, 1, 1,
0.05085337, 1.104292, 0.6425655, 1, 1, 1, 1, 1,
0.05643481, -0.9471505, 2.204794, 1, 1, 1, 1, 1,
0.05751196, -0.08417711, 2.620525, 1, 1, 1, 1, 1,
0.0581474, 2.270479, 0.5893302, 1, 1, 1, 1, 1,
0.06222603, 0.1064478, 1.478744, 1, 1, 1, 1, 1,
0.06275357, 0.555613, 0.636633, 1, 1, 1, 1, 1,
0.06389179, -1.021724, 3.147016, 1, 1, 1, 1, 1,
0.06445888, -1.603875, 3.481181, 1, 1, 1, 1, 1,
0.06699152, 0.03403096, 1.238606, 1, 1, 1, 1, 1,
0.07053103, -0.7386121, 3.365421, 1, 1, 1, 1, 1,
0.07352968, -0.425417, 3.298834, 1, 1, 1, 1, 1,
0.07387769, 1.261333, 0.4656674, 1, 1, 1, 1, 1,
0.07397567, 0.8341849, 0.6882787, 0, 0, 1, 1, 1,
0.07420036, -0.1783172, 2.954188, 1, 0, 0, 1, 1,
0.07559215, 0.7294063, -0.1521622, 1, 0, 0, 1, 1,
0.08380236, 1.364951, 0.4281847, 1, 0, 0, 1, 1,
0.08425069, 1.036518, 0.2118842, 1, 0, 0, 1, 1,
0.0949097, -0.4739677, 1.568648, 1, 0, 0, 1, 1,
0.09547193, 0.8896341, 1.18814, 0, 0, 0, 1, 1,
0.09588149, 1.975385, -0.5214589, 0, 0, 0, 1, 1,
0.09791671, 0.1118114, 0.8218343, 0, 0, 0, 1, 1,
0.09807545, 0.1656029, 0.5707362, 0, 0, 0, 1, 1,
0.1021869, -1.095291, 3.982918, 0, 0, 0, 1, 1,
0.103326, -1.221718, 4.039539, 0, 0, 0, 1, 1,
0.1045434, 0.3550926, -0.8138759, 0, 0, 0, 1, 1,
0.1170565, -1.354699, 2.204016, 1, 1, 1, 1, 1,
0.1176745, -1.50874, 1.887393, 1, 1, 1, 1, 1,
0.1180599, 0.592275, -0.6101336, 1, 1, 1, 1, 1,
0.1227777, -1.254347, 3.169753, 1, 1, 1, 1, 1,
0.1259718, -1.676114, 1.957725, 1, 1, 1, 1, 1,
0.1312924, -0.3450741, 3.304912, 1, 1, 1, 1, 1,
0.1352659, -0.4699135, 3.553966, 1, 1, 1, 1, 1,
0.1355632, 0.4778344, 0.3803733, 1, 1, 1, 1, 1,
0.1359163, -0.04227132, 1.778977, 1, 1, 1, 1, 1,
0.1385441, 1.297529, -0.9046534, 1, 1, 1, 1, 1,
0.1470692, -1.490267, 3.654276, 1, 1, 1, 1, 1,
0.147414, -0.923069, 2.846712, 1, 1, 1, 1, 1,
0.1479272, -0.9208107, 1.362825, 1, 1, 1, 1, 1,
0.1488682, 0.7409111, 1.09759, 1, 1, 1, 1, 1,
0.149733, -0.004861365, 3.072725, 1, 1, 1, 1, 1,
0.1503654, 1.44112, -0.6365631, 0, 0, 1, 1, 1,
0.1534092, -1.11478, 3.048965, 1, 0, 0, 1, 1,
0.156032, 0.5029669, -0.1849028, 1, 0, 0, 1, 1,
0.1567515, 0.0295506, 1.564363, 1, 0, 0, 1, 1,
0.1591429, 2.007313, -1.503071, 1, 0, 0, 1, 1,
0.1619776, 0.0104546, 2.317164, 1, 0, 0, 1, 1,
0.1625381, -0.7912749, 3.247254, 0, 0, 0, 1, 1,
0.1661751, -2.100099, 1.668268, 0, 0, 0, 1, 1,
0.1669793, 1.099494, 0.06849658, 0, 0, 0, 1, 1,
0.167359, 0.4358564, -0.6749779, 0, 0, 0, 1, 1,
0.1692172, 0.5256457, 0.5250464, 0, 0, 0, 1, 1,
0.1694946, 0.81977, 0.2733333, 0, 0, 0, 1, 1,
0.1695599, 0.9622626, -0.463195, 0, 0, 0, 1, 1,
0.1746116, 1.274502, 1.3433, 1, 1, 1, 1, 1,
0.1752985, 0.07362128, 1.440491, 1, 1, 1, 1, 1,
0.1766798, -0.3854055, 3.217918, 1, 1, 1, 1, 1,
0.1783693, -1.239605, 2.34417, 1, 1, 1, 1, 1,
0.18061, 0.336024, 0.3598876, 1, 1, 1, 1, 1,
0.1816021, 0.3086592, 1.461378, 1, 1, 1, 1, 1,
0.1849627, -0.3233159, 1.711083, 1, 1, 1, 1, 1,
0.1899991, -0.9892303, 3.115868, 1, 1, 1, 1, 1,
0.1902119, 2.466158, 1.163227, 1, 1, 1, 1, 1,
0.1904498, 0.2684737, 0.03236898, 1, 1, 1, 1, 1,
0.191007, 0.417387, -0.2177759, 1, 1, 1, 1, 1,
0.1933181, 0.0701129, 0.01668174, 1, 1, 1, 1, 1,
0.203102, 0.3684746, 0.05008313, 1, 1, 1, 1, 1,
0.2040838, 0.6773935, 0.1130727, 1, 1, 1, 1, 1,
0.2070226, -0.9791111, 0.8769016, 1, 1, 1, 1, 1,
0.2076991, 0.2795338, 1.018602, 0, 0, 1, 1, 1,
0.2116717, 0.2106336, 0.9600435, 1, 0, 0, 1, 1,
0.2149057, -0.7996879, 3.886022, 1, 0, 0, 1, 1,
0.2158793, -0.9498582, 3.971243, 1, 0, 0, 1, 1,
0.2174645, -1.001284, 4.298042, 1, 0, 0, 1, 1,
0.2175096, -0.3571343, 4.845589, 1, 0, 0, 1, 1,
0.2176001, 0.7220957, -0.6444201, 0, 0, 0, 1, 1,
0.2179125, -0.508442, 3.235156, 0, 0, 0, 1, 1,
0.2193412, -0.2317655, 1.273655, 0, 0, 0, 1, 1,
0.2268407, 0.2640008, 1.206271, 0, 0, 0, 1, 1,
0.2270128, 2.154834, -0.9008145, 0, 0, 0, 1, 1,
0.2271819, -0.1813073, 0.8771517, 0, 0, 0, 1, 1,
0.2288332, -0.6151676, 1.969408, 0, 0, 0, 1, 1,
0.2303599, -0.5005791, 2.745353, 1, 1, 1, 1, 1,
0.2331942, 0.5753261, 1.790588, 1, 1, 1, 1, 1,
0.2357842, 0.2072478, 1.911583, 1, 1, 1, 1, 1,
0.2439169, 0.6396312, 0.2257648, 1, 1, 1, 1, 1,
0.2547124, 1.006706, 0.01478097, 1, 1, 1, 1, 1,
0.2566142, 0.06032481, 0.1138476, 1, 1, 1, 1, 1,
0.2614471, -2.327496, 2.785828, 1, 1, 1, 1, 1,
0.2639682, 0.4243396, -0.3305328, 1, 1, 1, 1, 1,
0.2653847, -0.2463768, 2.602847, 1, 1, 1, 1, 1,
0.2686064, -1.738452, 4.073506, 1, 1, 1, 1, 1,
0.2686129, -1.342663, 3.229351, 1, 1, 1, 1, 1,
0.2717209, -1.209275, 1.749759, 1, 1, 1, 1, 1,
0.272071, -0.0617193, 3.757691, 1, 1, 1, 1, 1,
0.2766909, 1.420483, 1.519693, 1, 1, 1, 1, 1,
0.2770837, 0.8020743, 0.2999883, 1, 1, 1, 1, 1,
0.2786022, 0.4503681, -0.6346962, 0, 0, 1, 1, 1,
0.279936, -0.4654147, 1.682003, 1, 0, 0, 1, 1,
0.281888, 1.415526, -0.1716941, 1, 0, 0, 1, 1,
0.2845669, -0.6902801, 4.081955, 1, 0, 0, 1, 1,
0.2853051, 1.273189, 0.8706845, 1, 0, 0, 1, 1,
0.2853209, 0.4269051, -0.09298261, 1, 0, 0, 1, 1,
0.2878472, 0.1798689, 0.5083629, 0, 0, 0, 1, 1,
0.2954239, -0.009658542, 1.846046, 0, 0, 0, 1, 1,
0.299487, -1.010898, 3.610016, 0, 0, 0, 1, 1,
0.3028608, 0.4172435, 1.320071, 0, 0, 0, 1, 1,
0.3056196, -0.4161277, 3.019987, 0, 0, 0, 1, 1,
0.3189696, -0.06885263, 2.491003, 0, 0, 0, 1, 1,
0.3195061, 0.0238926, 0.7483938, 0, 0, 0, 1, 1,
0.3197015, 0.8266187, 1.276222, 1, 1, 1, 1, 1,
0.3200792, -0.8716207, 2.67258, 1, 1, 1, 1, 1,
0.3217817, 0.021722, 1.799429, 1, 1, 1, 1, 1,
0.3272333, 1.033834, 0.6923797, 1, 1, 1, 1, 1,
0.3275288, -0.04317932, 1.242106, 1, 1, 1, 1, 1,
0.3282541, 1.953174, 1.013102, 1, 1, 1, 1, 1,
0.3296893, -1.473892, 3.688533, 1, 1, 1, 1, 1,
0.330134, 1.436594, -0.2503926, 1, 1, 1, 1, 1,
0.331769, 1.389948, -1.061692, 1, 1, 1, 1, 1,
0.3319844, 1.091126, 0.6171918, 1, 1, 1, 1, 1,
0.3323824, 2.202973, 0.8617908, 1, 1, 1, 1, 1,
0.3327994, -1.449308, 2.458707, 1, 1, 1, 1, 1,
0.3328356, 1.250357, 0.4263764, 1, 1, 1, 1, 1,
0.3328781, 0.2444983, 0.699078, 1, 1, 1, 1, 1,
0.334235, 1.620664, -1.045615, 1, 1, 1, 1, 1,
0.334889, 1.549716, -2.66202, 0, 0, 1, 1, 1,
0.3363227, -1.051784, 4.455715, 1, 0, 0, 1, 1,
0.3363836, -0.4952091, 1.187563, 1, 0, 0, 1, 1,
0.3385886, -1.04137, 3.353657, 1, 0, 0, 1, 1,
0.3390312, 0.02685838, 2.383299, 1, 0, 0, 1, 1,
0.342195, 0.5829083, 1.578765, 1, 0, 0, 1, 1,
0.3456928, -0.1097723, 1.711386, 0, 0, 0, 1, 1,
0.346996, 0.4444532, 2.613116, 0, 0, 0, 1, 1,
0.3524245, 0.341083, 1.598475, 0, 0, 0, 1, 1,
0.3527139, 0.1100949, 0.2663606, 0, 0, 0, 1, 1,
0.3571224, 2.198361, 2.858328, 0, 0, 0, 1, 1,
0.3595838, -0.8944333, 2.319402, 0, 0, 0, 1, 1,
0.3603152, -0.7875023, 2.333291, 0, 0, 0, 1, 1,
0.3624483, 0.1451436, 3.29354, 1, 1, 1, 1, 1,
0.3632798, -2.343454, 3.206391, 1, 1, 1, 1, 1,
0.3665029, -0.2901388, 1.206293, 1, 1, 1, 1, 1,
0.3710513, 0.3536054, 1.12355, 1, 1, 1, 1, 1,
0.3780866, 0.3180992, 0.9853762, 1, 1, 1, 1, 1,
0.3796305, 0.3190787, -0.1636369, 1, 1, 1, 1, 1,
0.3859364, 0.6881469, 0.3672396, 1, 1, 1, 1, 1,
0.3866537, 1.434734, 1.687973, 1, 1, 1, 1, 1,
0.388207, 0.2621657, 1.158845, 1, 1, 1, 1, 1,
0.388818, 0.4620033, 1.96725, 1, 1, 1, 1, 1,
0.3923762, 0.04737399, 0.05097, 1, 1, 1, 1, 1,
0.3939733, 0.7218567, 1.350597, 1, 1, 1, 1, 1,
0.3943058, -1.886047, 2.633829, 1, 1, 1, 1, 1,
0.3965391, -0.09141405, 4.380535, 1, 1, 1, 1, 1,
0.3979075, -0.8128224, 2.824718, 1, 1, 1, 1, 1,
0.4009057, 0.002539087, 2.557429, 0, 0, 1, 1, 1,
0.4024316, 1.506154, -0.07702483, 1, 0, 0, 1, 1,
0.4049425, -0.4791027, 2.967238, 1, 0, 0, 1, 1,
0.4056622, -1.072654, 1.625437, 1, 0, 0, 1, 1,
0.4079281, -0.6680809, 2.761445, 1, 0, 0, 1, 1,
0.4083214, -1.379269, 2.872023, 1, 0, 0, 1, 1,
0.4095145, -0.5112872, 2.059241, 0, 0, 0, 1, 1,
0.4154222, -0.3723473, 2.409999, 0, 0, 0, 1, 1,
0.4190847, 0.2684149, -0.7535855, 0, 0, 0, 1, 1,
0.426369, 0.6541084, 1.673192, 0, 0, 0, 1, 1,
0.4284375, 1.591935, 0.3939827, 0, 0, 0, 1, 1,
0.4305516, -1.361082, 2.677782, 0, 0, 0, 1, 1,
0.4312201, 2.107432, -1.658252, 0, 0, 0, 1, 1,
0.4327347, 1.051865, 0.9968317, 1, 1, 1, 1, 1,
0.436512, 0.3827853, 1.859377, 1, 1, 1, 1, 1,
0.4375155, -0.05663612, 1.533389, 1, 1, 1, 1, 1,
0.4395626, -0.5213578, 2.850935, 1, 1, 1, 1, 1,
0.4497528, -0.4652857, 3.185086, 1, 1, 1, 1, 1,
0.4607292, 1.911619, -1.035753, 1, 1, 1, 1, 1,
0.4608989, -2.130818, 2.2546, 1, 1, 1, 1, 1,
0.4633742, 1.932189, 0.4598354, 1, 1, 1, 1, 1,
0.4634658, -1.765553, 2.471748, 1, 1, 1, 1, 1,
0.4635988, -1.292899, 0.5095356, 1, 1, 1, 1, 1,
0.4661973, -1.434455, 3.117186, 1, 1, 1, 1, 1,
0.4673096, 0.5055303, 0.8182898, 1, 1, 1, 1, 1,
0.4688489, 0.4873673, 0.7281317, 1, 1, 1, 1, 1,
0.4695183, 2.110082, 0.02583422, 1, 1, 1, 1, 1,
0.4696176, -0.2519747, 2.659024, 1, 1, 1, 1, 1,
0.4706381, 2.194584, 1.059258, 0, 0, 1, 1, 1,
0.4745755, -0.2146573, 2.154298, 1, 0, 0, 1, 1,
0.4763795, -0.805338, 3.061808, 1, 0, 0, 1, 1,
0.4769667, -2.519854, 3.156193, 1, 0, 0, 1, 1,
0.4804984, -0.2485798, 2.20767, 1, 0, 0, 1, 1,
0.4819165, -0.07455672, 2.269302, 1, 0, 0, 1, 1,
0.4823227, 0.3944672, -0.2684966, 0, 0, 0, 1, 1,
0.4854553, -0.2558794, 1.094188, 0, 0, 0, 1, 1,
0.4882758, 1.501915, -0.6860982, 0, 0, 0, 1, 1,
0.4924857, -0.03037257, 2.940856, 0, 0, 0, 1, 1,
0.4929489, -0.851939, 3.146987, 0, 0, 0, 1, 1,
0.494208, 1.748142, 0.3336082, 0, 0, 0, 1, 1,
0.4944958, -0.3398818, 2.242272, 0, 0, 0, 1, 1,
0.4950157, -0.9373777, 3.160587, 1, 1, 1, 1, 1,
0.4967961, 0.0805421, -0.5313658, 1, 1, 1, 1, 1,
0.4983349, 0.7221701, 0.2608153, 1, 1, 1, 1, 1,
0.5007768, 0.4033644, 2.1378, 1, 1, 1, 1, 1,
0.5020774, -0.246654, 2.099745, 1, 1, 1, 1, 1,
0.5094834, -0.9078472, 2.415633, 1, 1, 1, 1, 1,
0.5116071, 0.2663071, 0.1847672, 1, 1, 1, 1, 1,
0.515647, -0.5862339, 1.731411, 1, 1, 1, 1, 1,
0.5174133, -0.04868497, 3.098452, 1, 1, 1, 1, 1,
0.5196162, -2.005063, 1.655112, 1, 1, 1, 1, 1,
0.5232549, -1.262657, 3.240571, 1, 1, 1, 1, 1,
0.5269325, -0.8676326, 2.942713, 1, 1, 1, 1, 1,
0.529636, 0.104415, 0.3644888, 1, 1, 1, 1, 1,
0.5296693, -0.1111637, 1.472357, 1, 1, 1, 1, 1,
0.5297062, -1.693418, 3.224099, 1, 1, 1, 1, 1,
0.5328987, 2.307631, -0.546982, 0, 0, 1, 1, 1,
0.5333846, -1.10976, 2.545639, 1, 0, 0, 1, 1,
0.5357946, -0.766635, 2.336214, 1, 0, 0, 1, 1,
0.5534449, 0.5652246, -0.651604, 1, 0, 0, 1, 1,
0.5574743, 0.4451022, 1.726773, 1, 0, 0, 1, 1,
0.5579431, 0.3899623, 1.471139, 1, 0, 0, 1, 1,
0.5591093, -0.2269173, 2.115126, 0, 0, 0, 1, 1,
0.5601562, 1.753565, -1.406175, 0, 0, 0, 1, 1,
0.5628206, -0.2352758, 2.040453, 0, 0, 0, 1, 1,
0.5641088, 0.8070602, 0.7428358, 0, 0, 0, 1, 1,
0.5656182, -1.869207, 2.553629, 0, 0, 0, 1, 1,
0.5708941, -0.3456583, 2.899903, 0, 0, 0, 1, 1,
0.5761727, -0.1806981, -0.172151, 0, 0, 0, 1, 1,
0.5807412, -2.177818, 2.007428, 1, 1, 1, 1, 1,
0.5887108, 0.8304265, -0.1324491, 1, 1, 1, 1, 1,
0.5893134, 1.235236, 1.290351, 1, 1, 1, 1, 1,
0.5896631, 1.521552, -2.305341, 1, 1, 1, 1, 1,
0.5916687, 0.1497766, 0.1133221, 1, 1, 1, 1, 1,
0.5979021, 0.2712533, 0.3907278, 1, 1, 1, 1, 1,
0.5998092, -1.206565, 3.406555, 1, 1, 1, 1, 1,
0.6033617, -0.5094337, 1.217952, 1, 1, 1, 1, 1,
0.6043323, 0.2354078, 2.645324, 1, 1, 1, 1, 1,
0.6064436, -0.9449075, 1.637739, 1, 1, 1, 1, 1,
0.6176742, -0.7481714, 1.246407, 1, 1, 1, 1, 1,
0.6197492, 0.1885336, 1.431977, 1, 1, 1, 1, 1,
0.6276643, 0.2794424, 0.1620593, 1, 1, 1, 1, 1,
0.6361679, -0.8717155, 0.7781926, 1, 1, 1, 1, 1,
0.6372917, -1.630642, 3.837387, 1, 1, 1, 1, 1,
0.6374857, 0.7346051, 2.125037, 0, 0, 1, 1, 1,
0.637728, -0.02737885, 3.436972, 1, 0, 0, 1, 1,
0.6430206, 0.7886166, -0.9996967, 1, 0, 0, 1, 1,
0.6436228, -0.1154796, 0.215145, 1, 0, 0, 1, 1,
0.645283, -0.4847125, 1.572288, 1, 0, 0, 1, 1,
0.6459429, 0.540657, 1.006687, 1, 0, 0, 1, 1,
0.6574849, -1.118072, 2.398627, 0, 0, 0, 1, 1,
0.658809, 1.792459, 1.078287, 0, 0, 0, 1, 1,
0.6607602, -1.378756, 2.923757, 0, 0, 0, 1, 1,
0.6654179, 0.3754231, 0.7641509, 0, 0, 0, 1, 1,
0.6700529, 0.8203562, 2.331589, 0, 0, 0, 1, 1,
0.6728586, -0.2065879, 1.565987, 0, 0, 0, 1, 1,
0.6728694, 0.11264, 2.250269, 0, 0, 0, 1, 1,
0.6773669, -0.1224847, 3.157711, 1, 1, 1, 1, 1,
0.682368, 0.2711731, 0.2584887, 1, 1, 1, 1, 1,
0.6849054, 0.6358235, -0.2387727, 1, 1, 1, 1, 1,
0.6883539, 0.777893, -0.7770373, 1, 1, 1, 1, 1,
0.6889015, 0.1870151, 0.8159755, 1, 1, 1, 1, 1,
0.6925696, -0.3034081, 2.004721, 1, 1, 1, 1, 1,
0.6939334, 0.3493568, 1.070357, 1, 1, 1, 1, 1,
0.6946849, 0.9033986, 0.9114771, 1, 1, 1, 1, 1,
0.7001714, 1.39913, 0.4322006, 1, 1, 1, 1, 1,
0.7015806, 2.40347, -1.327096, 1, 1, 1, 1, 1,
0.7034538, 0.6416567, 0.6684517, 1, 1, 1, 1, 1,
0.7054743, -0.4654172, 1.69119, 1, 1, 1, 1, 1,
0.7057737, 0.4794838, 1.47264, 1, 1, 1, 1, 1,
0.7088713, 1.626054, -2.111788, 1, 1, 1, 1, 1,
0.7168604, -0.05977518, 1.218736, 1, 1, 1, 1, 1,
0.7174261, 0.390896, 1.045574, 0, 0, 1, 1, 1,
0.7254561, 0.3817517, 0.2532234, 1, 0, 0, 1, 1,
0.7290432, -1.08676, 4.702721, 1, 0, 0, 1, 1,
0.7300983, 1.56693, -0.07821506, 1, 0, 0, 1, 1,
0.7339263, -0.3441739, 1.990396, 1, 0, 0, 1, 1,
0.7444257, 0.7651907, 1.695673, 1, 0, 0, 1, 1,
0.7506092, 1.545269, -1.886192, 0, 0, 0, 1, 1,
0.7532368, 0.1018465, 2.313872, 0, 0, 0, 1, 1,
0.7542414, 0.3004118, 2.734489, 0, 0, 0, 1, 1,
0.767478, 0.319619, 2.332463, 0, 0, 0, 1, 1,
0.7816666, 0.7277058, 2.636708, 0, 0, 0, 1, 1,
0.7841223, 0.7452306, -0.1471974, 0, 0, 0, 1, 1,
0.7856629, 0.6180108, 1.864978, 0, 0, 0, 1, 1,
0.7893136, 1.052994, 1.108809, 1, 1, 1, 1, 1,
0.7920694, 0.4678024, 0.6328008, 1, 1, 1, 1, 1,
0.8041354, 0.4219095, 0.03285025, 1, 1, 1, 1, 1,
0.8067102, 0.05529742, 0.08332808, 1, 1, 1, 1, 1,
0.8093373, 0.3679911, 0.5657557, 1, 1, 1, 1, 1,
0.8156959, 0.4355836, 0.5982559, 1, 1, 1, 1, 1,
0.82638, -0.9598368, 2.221984, 1, 1, 1, 1, 1,
0.8268878, -0.5273283, 2.100748, 1, 1, 1, 1, 1,
0.8275051, 0.771166, 0.3804747, 1, 1, 1, 1, 1,
0.8311212, 0.9427577, -0.01943946, 1, 1, 1, 1, 1,
0.8328421, -0.7865675, 1.655196, 1, 1, 1, 1, 1,
0.8382098, -0.6438825, 0.9933612, 1, 1, 1, 1, 1,
0.8385688, 1.714489, -0.9334566, 1, 1, 1, 1, 1,
0.840542, -0.06910381, 3.075264, 1, 1, 1, 1, 1,
0.8425838, 0.6183352, 0.3946073, 1, 1, 1, 1, 1,
0.8503728, 0.51641, 0.2140125, 0, 0, 1, 1, 1,
0.8544946, 1.638112, -0.01253305, 1, 0, 0, 1, 1,
0.8632382, 0.1088453, 1.781325, 1, 0, 0, 1, 1,
0.8639095, 0.4586792, 1.874862, 1, 0, 0, 1, 1,
0.8701685, 0.2656507, 1.562927, 1, 0, 0, 1, 1,
0.8779501, -1.36814, 1.825179, 1, 0, 0, 1, 1,
0.8867949, 0.8340126, 1.159593, 0, 0, 0, 1, 1,
0.8920026, -0.3295439, 3.542993, 0, 0, 0, 1, 1,
0.8961011, -0.5289991, 2.204767, 0, 0, 0, 1, 1,
0.9038798, 0.445935, 2.043271, 0, 0, 0, 1, 1,
0.9067427, 0.7159738, 1.977912, 0, 0, 0, 1, 1,
0.9118078, -0.4844672, 0.6716769, 0, 0, 0, 1, 1,
0.9137055, -0.1910308, 2.60111, 0, 0, 0, 1, 1,
0.9215028, -2.022591, 2.830931, 1, 1, 1, 1, 1,
0.9282537, 0.1373553, -0.06247862, 1, 1, 1, 1, 1,
0.9282752, 1.933386, 2.042916, 1, 1, 1, 1, 1,
0.9312477, 0.1107045, 1.324483, 1, 1, 1, 1, 1,
0.9321365, -2.102643, 0.607078, 1, 1, 1, 1, 1,
0.9435804, -0.1727578, 2.44151, 1, 1, 1, 1, 1,
0.9440713, 0.5000376, 0.03861951, 1, 1, 1, 1, 1,
0.950561, -1.21072, 2.248977, 1, 1, 1, 1, 1,
0.9632699, -0.384578, 0.9295278, 1, 1, 1, 1, 1,
0.9742849, 0.7848824, -0.9872783, 1, 1, 1, 1, 1,
0.984206, -0.2411159, 0.2559651, 1, 1, 1, 1, 1,
0.9846039, 0.647773, -0.4175666, 1, 1, 1, 1, 1,
0.9852748, 0.7751516, 1.82252, 1, 1, 1, 1, 1,
0.9958539, 0.2148678, 0.8632806, 1, 1, 1, 1, 1,
1.004508, 1.30173, 2.050714, 1, 1, 1, 1, 1,
1.008072, -0.5662933, 0.7377858, 0, 0, 1, 1, 1,
1.016579, 0.2404599, 1.923309, 1, 0, 0, 1, 1,
1.017781, 0.3929315, 1.646847, 1, 0, 0, 1, 1,
1.030389, -1.748994, 3.15035, 1, 0, 0, 1, 1,
1.034732, 0.0583273, 0.6009006, 1, 0, 0, 1, 1,
1.035387, 0.9839804, 1.461012, 1, 0, 0, 1, 1,
1.041873, 1.146691, 0.0723054, 0, 0, 0, 1, 1,
1.046337, -0.4470848, 2.447182, 0, 0, 0, 1, 1,
1.049706, 2.719032, 0.3518167, 0, 0, 0, 1, 1,
1.055328, 0.07177501, 1.83665, 0, 0, 0, 1, 1,
1.063753, 1.616414, 1.681581, 0, 0, 0, 1, 1,
1.065015, 0.5231564, 0.2819871, 0, 0, 0, 1, 1,
1.076066, -2.025795, 1.772784, 0, 0, 0, 1, 1,
1.080431, -0.8231599, 3.280736, 1, 1, 1, 1, 1,
1.086008, -0.5621766, 2.400479, 1, 1, 1, 1, 1,
1.098009, 0.03085888, 3.382978, 1, 1, 1, 1, 1,
1.098789, -0.1115172, 1.117463, 1, 1, 1, 1, 1,
1.117444, 1.003015, 0.06026925, 1, 1, 1, 1, 1,
1.119624, -0.9878566, 2.323059, 1, 1, 1, 1, 1,
1.122269, -0.07971294, 0.3659856, 1, 1, 1, 1, 1,
1.13114, 0.06226632, -0.2560599, 1, 1, 1, 1, 1,
1.137688, 1.684657, 0.4158634, 1, 1, 1, 1, 1,
1.14148, 1.399913, 3.153646, 1, 1, 1, 1, 1,
1.144326, -0.2067402, 1.940616, 1, 1, 1, 1, 1,
1.160897, -2.772126, 2.434619, 1, 1, 1, 1, 1,
1.164424, 0.09037639, 0.4580069, 1, 1, 1, 1, 1,
1.166525, 0.7628281, 1.746192, 1, 1, 1, 1, 1,
1.170788, 0.3764249, -0.7727987, 1, 1, 1, 1, 1,
1.179076, -0.06959701, 1.039521, 0, 0, 1, 1, 1,
1.192493, -1.723754, 1.450135, 1, 0, 0, 1, 1,
1.19517, -0.9734012, 2.446029, 1, 0, 0, 1, 1,
1.195299, 0.4384368, 2.050028, 1, 0, 0, 1, 1,
1.20355, -1.721254, 3.516969, 1, 0, 0, 1, 1,
1.209872, -1.384758, 4.172992, 1, 0, 0, 1, 1,
1.21158, 0.2605208, 2.016777, 0, 0, 0, 1, 1,
1.21175, -0.0515378, 1.70692, 0, 0, 0, 1, 1,
1.217584, -0.9452665, 2.537858, 0, 0, 0, 1, 1,
1.217766, 1.484728, 3.297193, 0, 0, 0, 1, 1,
1.224058, -0.4498096, 2.564135, 0, 0, 0, 1, 1,
1.224392, 1.304438, -0.05153531, 0, 0, 0, 1, 1,
1.227296, 1.322846, 0.2584015, 0, 0, 0, 1, 1,
1.243344, -2.267013, 1.411477, 1, 1, 1, 1, 1,
1.246065, -0.1238662, 0.6814262, 1, 1, 1, 1, 1,
1.248303, 0.6097864, 0.4557014, 1, 1, 1, 1, 1,
1.256753, -1.835461, 2.820023, 1, 1, 1, 1, 1,
1.272346, 0.08064374, 2.739812, 1, 1, 1, 1, 1,
1.294078, 0.1631105, 1.395256, 1, 1, 1, 1, 1,
1.298623, 0.2174056, -0.4605421, 1, 1, 1, 1, 1,
1.302662, 0.3650626, -0.2905764, 1, 1, 1, 1, 1,
1.312532, 0.3316062, -1.185013, 1, 1, 1, 1, 1,
1.319414, 1.185541, 1.378526, 1, 1, 1, 1, 1,
1.32344, 0.03783299, 2.826806, 1, 1, 1, 1, 1,
1.324086, 0.8716263, -0.2699587, 1, 1, 1, 1, 1,
1.325145, -0.2596416, 2.277047, 1, 1, 1, 1, 1,
1.326006, 0.7683957, 1.103488, 1, 1, 1, 1, 1,
1.330568, 1.222849, 1.499253, 1, 1, 1, 1, 1,
1.332337, -0.4233904, 3.466869, 0, 0, 1, 1, 1,
1.350788, 0.4848057, 1.803828, 1, 0, 0, 1, 1,
1.351705, -0.6046763, 1.878603, 1, 0, 0, 1, 1,
1.364693, 0.2063096, 0.8866554, 1, 0, 0, 1, 1,
1.372903, 0.1649255, 0.4428652, 1, 0, 0, 1, 1,
1.381494, 0.7558722, 0.5715489, 1, 0, 0, 1, 1,
1.382679, 0.1896368, 0.6371767, 0, 0, 0, 1, 1,
1.383107, 0.9294962, 1.941871, 0, 0, 0, 1, 1,
1.387447, -0.1574936, -0.9667794, 0, 0, 0, 1, 1,
1.387578, 1.906578, 3.224483, 0, 0, 0, 1, 1,
1.39658, -0.1300609, 1.103524, 0, 0, 0, 1, 1,
1.396937, -0.3410379, 0.6508366, 0, 0, 0, 1, 1,
1.399637, 1.043033, 2.393214, 0, 0, 0, 1, 1,
1.399977, 1.371589, 0.7296926, 1, 1, 1, 1, 1,
1.410762, 0.1022194, 2.379952, 1, 1, 1, 1, 1,
1.420667, -0.6538513, 2.944304, 1, 1, 1, 1, 1,
1.423558, -1.119286, 3.526468, 1, 1, 1, 1, 1,
1.428965, 1.282537, -0.6977614, 1, 1, 1, 1, 1,
1.431385, -0.4764253, 1.718596, 1, 1, 1, 1, 1,
1.437775, 0.01863922, -1.020132, 1, 1, 1, 1, 1,
1.443053, 0.999309, 2.30504, 1, 1, 1, 1, 1,
1.443804, -0.5128565, 2.302899, 1, 1, 1, 1, 1,
1.444616, -0.8164312, 1.726329, 1, 1, 1, 1, 1,
1.44606, -0.989369, 1.594246, 1, 1, 1, 1, 1,
1.447588, -0.6987897, 2.836837, 1, 1, 1, 1, 1,
1.450892, 0.6631622, 1.128567, 1, 1, 1, 1, 1,
1.451308, -0.4963243, 1.507727, 1, 1, 1, 1, 1,
1.472709, 1.381332, 1.242799, 1, 1, 1, 1, 1,
1.473965, 0.2343765, 2.104696, 0, 0, 1, 1, 1,
1.477841, 1.953001, 0.9989169, 1, 0, 0, 1, 1,
1.490559, -0.5459523, 2.489499, 1, 0, 0, 1, 1,
1.491898, -1.669251, 1.491756, 1, 0, 0, 1, 1,
1.497169, -0.5330625, 3.51141, 1, 0, 0, 1, 1,
1.497847, -0.8049901, 0.06119539, 1, 0, 0, 1, 1,
1.4997, 0.4674597, 1.455673, 0, 0, 0, 1, 1,
1.513356, 0.3846072, 0.4634123, 0, 0, 0, 1, 1,
1.514964, -0.09582074, 2.103539, 0, 0, 0, 1, 1,
1.518223, -1.263209, 1.80569, 0, 0, 0, 1, 1,
1.518338, 1.753333, 1.521108, 0, 0, 0, 1, 1,
1.523701, 1.089845, 1.096213, 0, 0, 0, 1, 1,
1.538209, -2.596796, 2.004843, 0, 0, 0, 1, 1,
1.538424, 0.313449, 2.061615, 1, 1, 1, 1, 1,
1.562121, 1.708884, 0.7024143, 1, 1, 1, 1, 1,
1.562888, -0.7767369, 2.36596, 1, 1, 1, 1, 1,
1.567416, -0.3751704, -0.4509835, 1, 1, 1, 1, 1,
1.567852, -1.689119, 2.610238, 1, 1, 1, 1, 1,
1.572645, 1.248912, -0.2369355, 1, 1, 1, 1, 1,
1.590959, 0.9143274, 0.01460611, 1, 1, 1, 1, 1,
1.596238, -0.6956619, 1.845782, 1, 1, 1, 1, 1,
1.611073, -0.6063618, 1.821616, 1, 1, 1, 1, 1,
1.621164, 0.4594656, 0.3974702, 1, 1, 1, 1, 1,
1.622579, 0.712114, 2.48322, 1, 1, 1, 1, 1,
1.627202, -0.166002, 1.984781, 1, 1, 1, 1, 1,
1.628561, -0.9768133, 2.038076, 1, 1, 1, 1, 1,
1.639677, -1.340751, 2.828309, 1, 1, 1, 1, 1,
1.680039, -0.07560395, 2.569471, 1, 1, 1, 1, 1,
1.706993, 0.7448422, 1.973262, 0, 0, 1, 1, 1,
1.712589, -0.6937369, 1.971348, 1, 0, 0, 1, 1,
1.715339, -0.6785195, 3.448423, 1, 0, 0, 1, 1,
1.739084, -0.409299, 3.431055, 1, 0, 0, 1, 1,
1.739549, 0.1217108, 1.754169, 1, 0, 0, 1, 1,
1.752293, 1.03504, -1.953169, 1, 0, 0, 1, 1,
1.76845, -0.4780547, 1.692566, 0, 0, 0, 1, 1,
1.771874, -1.673253, 2.979142, 0, 0, 0, 1, 1,
1.779205, 0.8956201, 0.6736093, 0, 0, 0, 1, 1,
1.797384, 1.420579, 0.1184409, 0, 0, 0, 1, 1,
1.811331, 0.6905804, 2.777842, 0, 0, 0, 1, 1,
1.815511, 0.3209922, 1.183997, 0, 0, 0, 1, 1,
1.823385, -1.408883, 3.102249, 0, 0, 0, 1, 1,
1.828439, 0.4869366, 1.496742, 1, 1, 1, 1, 1,
1.828615, -0.07717103, 1.492043, 1, 1, 1, 1, 1,
1.913712, -0.3229709, 1.803146, 1, 1, 1, 1, 1,
1.924281, -0.7729737, 3.437966, 1, 1, 1, 1, 1,
1.93254, 0.1937347, 2.218968, 1, 1, 1, 1, 1,
1.937225, 1.575617, 1.041071, 1, 1, 1, 1, 1,
1.938713, 1.327113, -0.6265095, 1, 1, 1, 1, 1,
1.956577, -1.623345, 1.341071, 1, 1, 1, 1, 1,
1.972168, -1.090347, 2.232781, 1, 1, 1, 1, 1,
2.009092, -0.433326, 2.410515, 1, 1, 1, 1, 1,
2.012273, -0.4695413, 0.9954889, 1, 1, 1, 1, 1,
2.01992, -0.5927334, 3.156643, 1, 1, 1, 1, 1,
2.031704, -0.1039609, 2.344258, 1, 1, 1, 1, 1,
2.047743, 1.268448, 1.635461, 1, 1, 1, 1, 1,
2.078229, 0.8559697, 2.62582, 1, 1, 1, 1, 1,
2.079062, -0.02109382, 1.326972, 0, 0, 1, 1, 1,
2.084943, 0.3284359, 1.931961, 1, 0, 0, 1, 1,
2.085308, 0.0062865, 2.435057, 1, 0, 0, 1, 1,
2.099702, -2.15136, 3.059979, 1, 0, 0, 1, 1,
2.111393, 1.91632, 2.001517, 1, 0, 0, 1, 1,
2.118591, -0.5334851, 0.5004224, 1, 0, 0, 1, 1,
2.138198, -0.4601684, 1.418883, 0, 0, 0, 1, 1,
2.233821, 0.06394819, -0.2607702, 0, 0, 0, 1, 1,
2.263528, 1.075084, 1.322302, 0, 0, 0, 1, 1,
2.300769, -0.571341, 1.369359, 0, 0, 0, 1, 1,
2.316782, -0.1919706, 2.687551, 0, 0, 0, 1, 1,
2.365326, -1.339375, 2.18768, 0, 0, 0, 1, 1,
2.36826, 0.5397536, 0.8436276, 0, 0, 0, 1, 1,
2.45174, -0.4238178, 1.601097, 1, 1, 1, 1, 1,
2.471309, -0.8123603, 2.907967, 1, 1, 1, 1, 1,
2.508856, 0.1200875, 1.310343, 1, 1, 1, 1, 1,
2.811673, 0.9528278, 1.462262, 1, 1, 1, 1, 1,
2.844423, -0.4658937, 1.040972, 1, 1, 1, 1, 1,
3.207917, 1.566882, 1.84978, 1, 1, 1, 1, 1,
3.262098, 0.1501039, 2.321272, 1, 1, 1, 1, 1
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
var radius = 9.160801;
var distance = 32.17693;
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
mvMatrix.translate( -0.1491741, -0.1411111, 0.02573371 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.17693);
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
