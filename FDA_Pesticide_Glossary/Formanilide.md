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
-3.805139, 0.04449251, -1.927807, 1, 0, 0, 1,
-2.687028, -0.3097486, -2.548237, 1, 0.007843138, 0, 1,
-2.55411, -1.003536, -2.229955, 1, 0.01176471, 0, 1,
-2.518071, -0.02219867, -1.114772, 1, 0.01960784, 0, 1,
-2.501126, -1.998518, -1.459984, 1, 0.02352941, 0, 1,
-2.427227, 1.775455, -1.593274, 1, 0.03137255, 0, 1,
-2.426762, 0.3841506, -1.388703, 1, 0.03529412, 0, 1,
-2.368741, 1.307884, -0.8214793, 1, 0.04313726, 0, 1,
-2.363394, 0.06810386, -2.555671, 1, 0.04705882, 0, 1,
-2.346113, -0.816229, -1.428394, 1, 0.05490196, 0, 1,
-2.294239, 0.3788158, -2.094878, 1, 0.05882353, 0, 1,
-2.286048, 0.6086381, -3.20503, 1, 0.06666667, 0, 1,
-2.28346, -0.9438488, -1.061556, 1, 0.07058824, 0, 1,
-2.274652, 0.2287813, -0.5742772, 1, 0.07843138, 0, 1,
-2.274156, 0.751962, -1.812289, 1, 0.08235294, 0, 1,
-2.255051, 1.225247, -0.2048043, 1, 0.09019608, 0, 1,
-2.208558, 2.030723, -1.604526, 1, 0.09411765, 0, 1,
-2.198947, -0.6220824, -2.406033, 1, 0.1019608, 0, 1,
-2.189904, 0.2847513, -1.028883, 1, 0.1098039, 0, 1,
-2.16733, -0.1143559, -1.809309, 1, 0.1137255, 0, 1,
-2.104068, -0.8725551, -0.9489363, 1, 0.1215686, 0, 1,
-2.09253, 0.3242519, -1.562089, 1, 0.1254902, 0, 1,
-2.086191, 1.022534, 0.06073068, 1, 0.1333333, 0, 1,
-2.050546, 0.8258173, -1.663166, 1, 0.1372549, 0, 1,
-2.036201, -1.019618, -1.046238, 1, 0.145098, 0, 1,
-2.005007, 0.8714544, 0.3296155, 1, 0.1490196, 0, 1,
-1.981987, 0.8637162, -2.749237, 1, 0.1568628, 0, 1,
-1.958457, -0.2768922, -0.7409224, 1, 0.1607843, 0, 1,
-1.904123, -1.203606, -2.737622, 1, 0.1686275, 0, 1,
-1.90372, 0.7259141, -1.066179, 1, 0.172549, 0, 1,
-1.862858, -0.6005716, -3.561388, 1, 0.1803922, 0, 1,
-1.851373, 0.1938435, -2.713197, 1, 0.1843137, 0, 1,
-1.846077, -0.1180693, -1.069262, 1, 0.1921569, 0, 1,
-1.832536, -1.52321, -2.942756, 1, 0.1960784, 0, 1,
-1.829059, 0.3468893, -1.627507, 1, 0.2039216, 0, 1,
-1.816418, 0.04317373, -1.47434, 1, 0.2117647, 0, 1,
-1.791488, 0.3157891, -1.51614, 1, 0.2156863, 0, 1,
-1.786722, 0.2551247, -1.377163, 1, 0.2235294, 0, 1,
-1.739884, -1.13546, -0.4655327, 1, 0.227451, 0, 1,
-1.732383, 0.6228119, -0.1943812, 1, 0.2352941, 0, 1,
-1.728151, 0.05308548, -2.241509, 1, 0.2392157, 0, 1,
-1.721443, -0.4213656, -2.037336, 1, 0.2470588, 0, 1,
-1.719049, -0.2874779, -0.2447301, 1, 0.2509804, 0, 1,
-1.698331, -1.246767, -1.973733, 1, 0.2588235, 0, 1,
-1.696659, 0.5402712, -2.52181, 1, 0.2627451, 0, 1,
-1.691881, -0.107046, -1.461188, 1, 0.2705882, 0, 1,
-1.677501, 0.7243881, -2.161571, 1, 0.2745098, 0, 1,
-1.676045, -0.3513914, -2.471853, 1, 0.282353, 0, 1,
-1.666231, 1.445265, -1.423181, 1, 0.2862745, 0, 1,
-1.663653, 0.1415853, -2.674395, 1, 0.2941177, 0, 1,
-1.662629, -0.8921682, -0.4711607, 1, 0.3019608, 0, 1,
-1.662128, 0.1416362, -2.622865, 1, 0.3058824, 0, 1,
-1.650474, 0.6070309, -0.7938176, 1, 0.3137255, 0, 1,
-1.648885, -0.8092806, -1.514903, 1, 0.3176471, 0, 1,
-1.551675, 0.919236, -1.061856, 1, 0.3254902, 0, 1,
-1.53695, 0.6741257, -1.585081, 1, 0.3294118, 0, 1,
-1.534839, 1.229736, -0.7900956, 1, 0.3372549, 0, 1,
-1.522375, -1.095029, -2.749474, 1, 0.3411765, 0, 1,
-1.518726, -0.741757, -2.929383, 1, 0.3490196, 0, 1,
-1.518503, -2.181787, -2.239967, 1, 0.3529412, 0, 1,
-1.515124, 0.09887091, -1.999516, 1, 0.3607843, 0, 1,
-1.505277, -0.4405253, 0.1002586, 1, 0.3647059, 0, 1,
-1.503081, -0.3210248, -0.1746396, 1, 0.372549, 0, 1,
-1.501322, -1.093266, -2.527575, 1, 0.3764706, 0, 1,
-1.499479, 0.7713761, -2.320231, 1, 0.3843137, 0, 1,
-1.490481, 0.0226875, -1.588356, 1, 0.3882353, 0, 1,
-1.489312, 1.23298, 0.3133793, 1, 0.3960784, 0, 1,
-1.487822, 0.5509585, -0.3804204, 1, 0.4039216, 0, 1,
-1.473959, -1.119846, -0.3084507, 1, 0.4078431, 0, 1,
-1.464141, 1.350145, -0.3675765, 1, 0.4156863, 0, 1,
-1.460736, -0.4482348, -2.11938, 1, 0.4196078, 0, 1,
-1.455874, -0.1458912, -2.187806, 1, 0.427451, 0, 1,
-1.455321, -1.144613, -2.291655, 1, 0.4313726, 0, 1,
-1.451624, -1.296827, -2.097766, 1, 0.4392157, 0, 1,
-1.443107, 1.053643, -0.6776751, 1, 0.4431373, 0, 1,
-1.4304, 0.8356116, -0.003407002, 1, 0.4509804, 0, 1,
-1.430207, -0.8232915, -2.214761, 1, 0.454902, 0, 1,
-1.428012, 0.2366667, -1.905246, 1, 0.4627451, 0, 1,
-1.414506, -0.5316703, -1.402531, 1, 0.4666667, 0, 1,
-1.40147, -0.0964625, -1.775125, 1, 0.4745098, 0, 1,
-1.398009, -0.01305251, -1.38249, 1, 0.4784314, 0, 1,
-1.384031, 0.2621764, -3.78107, 1, 0.4862745, 0, 1,
-1.37078, 1.378622, -0.5625946, 1, 0.4901961, 0, 1,
-1.369271, -0.7310078, -2.081871, 1, 0.4980392, 0, 1,
-1.367648, -0.802135, -2.78957, 1, 0.5058824, 0, 1,
-1.365009, 0.08780693, -0.4938334, 1, 0.509804, 0, 1,
-1.363621, 0.3528114, -0.6733184, 1, 0.5176471, 0, 1,
-1.363527, 0.4496447, -1.785893, 1, 0.5215687, 0, 1,
-1.347679, -1.586335, -1.709203, 1, 0.5294118, 0, 1,
-1.346149, 0.5578629, -1.773511, 1, 0.5333334, 0, 1,
-1.337997, -0.2113398, -1.856197, 1, 0.5411765, 0, 1,
-1.324687, 1.056721, -0.5303891, 1, 0.5450981, 0, 1,
-1.319078, -0.9769047, -3.818334, 1, 0.5529412, 0, 1,
-1.307549, 0.2281792, -3.057509, 1, 0.5568628, 0, 1,
-1.303094, 1.420839, -0.6629828, 1, 0.5647059, 0, 1,
-1.301488, -0.16301, -1.767494, 1, 0.5686275, 0, 1,
-1.28502, 0.7513825, -1.537241, 1, 0.5764706, 0, 1,
-1.283757, 1.127005, 0.1563848, 1, 0.5803922, 0, 1,
-1.281823, 0.005773064, -0.5246714, 1, 0.5882353, 0, 1,
-1.272718, 0.9845811, -0.9498054, 1, 0.5921569, 0, 1,
-1.249852, -0.6425354, -1.417879, 1, 0.6, 0, 1,
-1.241507, -1.210141, -2.23729, 1, 0.6078432, 0, 1,
-1.239955, -2.020136, -1.257255, 1, 0.6117647, 0, 1,
-1.227071, -0.2970727, -1.104805, 1, 0.6196079, 0, 1,
-1.222411, 2.467301, -0.6536063, 1, 0.6235294, 0, 1,
-1.21341, 2.402401, -0.03946862, 1, 0.6313726, 0, 1,
-1.211093, -0.8708984, -1.412649, 1, 0.6352941, 0, 1,
-1.205649, -0.6255013, -4.664487, 1, 0.6431373, 0, 1,
-1.17732, 0.101483, -0.674633, 1, 0.6470588, 0, 1,
-1.163951, 0.4680313, -3.246643, 1, 0.654902, 0, 1,
-1.161402, 0.04725638, -1.303836, 1, 0.6588235, 0, 1,
-1.159078, 0.7376243, 0.8154858, 1, 0.6666667, 0, 1,
-1.154221, 0.6495126, -2.191686, 1, 0.6705883, 0, 1,
-1.153057, 1.996768, -0.3882545, 1, 0.6784314, 0, 1,
-1.152451, 1.29304, 0.1492722, 1, 0.682353, 0, 1,
-1.151021, 0.7034308, -0.4239162, 1, 0.6901961, 0, 1,
-1.144706, 0.1139902, -1.352949, 1, 0.6941177, 0, 1,
-1.135692, 0.3857172, -3.064694, 1, 0.7019608, 0, 1,
-1.133233, -0.7163042, 0.5736374, 1, 0.7098039, 0, 1,
-1.132124, 0.1196552, -2.323175, 1, 0.7137255, 0, 1,
-1.129557, -0.7911468, -2.96355, 1, 0.7215686, 0, 1,
-1.124001, -1.4869, -2.223798, 1, 0.7254902, 0, 1,
-1.119146, -1.111392, -1.959712, 1, 0.7333333, 0, 1,
-1.110136, -0.8737495, -1.78443, 1, 0.7372549, 0, 1,
-1.101414, 0.06599347, -2.809409, 1, 0.7450981, 0, 1,
-1.100901, -1.121401, -1.952771, 1, 0.7490196, 0, 1,
-1.091062, -1.703338, -2.351781, 1, 0.7568628, 0, 1,
-1.086952, -0.1038579, -0.2432943, 1, 0.7607843, 0, 1,
-1.082999, -0.07213832, -2.267681, 1, 0.7686275, 0, 1,
-1.081504, -0.2024189, -0.4364058, 1, 0.772549, 0, 1,
-1.070439, 0.02180734, -3.778245, 1, 0.7803922, 0, 1,
-1.070286, -0.336721, -2.809144, 1, 0.7843137, 0, 1,
-1.058542, -0.3435571, -1.334981, 1, 0.7921569, 0, 1,
-1.041592, -0.7547844, -2.219027, 1, 0.7960784, 0, 1,
-1.040318, 2.312942, -0.7906901, 1, 0.8039216, 0, 1,
-1.038656, 0.4903394, -3.33015, 1, 0.8117647, 0, 1,
-1.03423, -0.7337847, -0.6445647, 1, 0.8156863, 0, 1,
-1.026998, 1.463737, 0.5343474, 1, 0.8235294, 0, 1,
-1.026228, -0.03728006, -0.03384979, 1, 0.827451, 0, 1,
-1.025258, 1.84516, -1.189464, 1, 0.8352941, 0, 1,
-1.024933, 0.04626748, -1.671556, 1, 0.8392157, 0, 1,
-1.023574, -0.1827931, -1.866716, 1, 0.8470588, 0, 1,
-1.02049, -0.4150304, -0.753704, 1, 0.8509804, 0, 1,
-1.018465, -0.2923716, -3.23712, 1, 0.8588235, 0, 1,
-1.018062, -0.6881248, -1.596767, 1, 0.8627451, 0, 1,
-1.013434, -1.803891, -2.169269, 1, 0.8705882, 0, 1,
-1.010017, 1.048999, 0.0548805, 1, 0.8745098, 0, 1,
-1.008541, 0.1896522, -1.055208, 1, 0.8823529, 0, 1,
-1.000914, 1.491026, -1.504095, 1, 0.8862745, 0, 1,
-0.9921655, 0.7267143, -2.813767, 1, 0.8941177, 0, 1,
-0.9907178, -0.1850899, -1.092912, 1, 0.8980392, 0, 1,
-0.9901803, 0.1073635, -2.55607, 1, 0.9058824, 0, 1,
-0.9901019, 0.5448571, -3.135286, 1, 0.9137255, 0, 1,
-0.989019, 0.3924457, -0.7852109, 1, 0.9176471, 0, 1,
-0.9877619, -0.001735398, -1.89538, 1, 0.9254902, 0, 1,
-0.9824646, -0.1734381, 0.01565153, 1, 0.9294118, 0, 1,
-0.9717596, -0.02428582, -0.5480483, 1, 0.9372549, 0, 1,
-0.970472, -0.9210542, -1.80436, 1, 0.9411765, 0, 1,
-0.9695804, -1.129631, -1.091157, 1, 0.9490196, 0, 1,
-0.9686868, -1.212787, -1.531986, 1, 0.9529412, 0, 1,
-0.967376, -1.685995, -1.939204, 1, 0.9607843, 0, 1,
-0.9667333, 1.651968, 0.3399094, 1, 0.9647059, 0, 1,
-0.9525965, -1.216663, -1.542899, 1, 0.972549, 0, 1,
-0.9446302, 0.3085628, -2.334697, 1, 0.9764706, 0, 1,
-0.9445842, -0.160031, -1.733576, 1, 0.9843137, 0, 1,
-0.9385554, 0.1905645, -0.3961813, 1, 0.9882353, 0, 1,
-0.9305663, 1.562693, 0.2032899, 1, 0.9960784, 0, 1,
-0.9285161, 0.311235, -0.5397529, 0.9960784, 1, 0, 1,
-0.9237381, -2.082833, -3.699753, 0.9921569, 1, 0, 1,
-0.9167049, -0.8399535, -3.731902, 0.9843137, 1, 0, 1,
-0.9144558, 0.000745631, -2.513162, 0.9803922, 1, 0, 1,
-0.9125445, -1.642496, -1.996644, 0.972549, 1, 0, 1,
-0.9104375, 0.6089147, -0.9916782, 0.9686275, 1, 0, 1,
-0.9097586, -0.8552034, -1.908259, 0.9607843, 1, 0, 1,
-0.9080522, 1.85086, -2.509717, 0.9568627, 1, 0, 1,
-0.9047799, -1.244763, -3.024649, 0.9490196, 1, 0, 1,
-0.9045044, 0.3990034, -0.7837515, 0.945098, 1, 0, 1,
-0.9020643, 1.10096, -1.890076, 0.9372549, 1, 0, 1,
-0.895918, -0.7686213, -2.763932, 0.9333333, 1, 0, 1,
-0.8907415, 0.9665256, 0.2173576, 0.9254902, 1, 0, 1,
-0.887565, 0.125208, -2.408242, 0.9215686, 1, 0, 1,
-0.8823403, 0.8816341, -2.152762, 0.9137255, 1, 0, 1,
-0.8737116, 1.486238, -2.28217, 0.9098039, 1, 0, 1,
-0.8709865, 0.8946534, 0.4057149, 0.9019608, 1, 0, 1,
-0.8702066, 1.144068, -2.900723, 0.8941177, 1, 0, 1,
-0.8656555, -0.2402017, -1.293753, 0.8901961, 1, 0, 1,
-0.8634665, 0.3711915, -0.01586222, 0.8823529, 1, 0, 1,
-0.8620088, 0.498904, 0.8172482, 0.8784314, 1, 0, 1,
-0.8612399, -0.7461968, -1.993019, 0.8705882, 1, 0, 1,
-0.8610129, -0.0324224, -1.063756, 0.8666667, 1, 0, 1,
-0.8587026, -1.39249, -0.5387057, 0.8588235, 1, 0, 1,
-0.8574362, -0.08938636, -0.5777175, 0.854902, 1, 0, 1,
-0.8571549, -0.5575156, -2.588018, 0.8470588, 1, 0, 1,
-0.856536, 1.236274, -1.173227, 0.8431373, 1, 0, 1,
-0.8552093, 0.5607483, -1.667838, 0.8352941, 1, 0, 1,
-0.8516951, -0.7871801, -1.158191, 0.8313726, 1, 0, 1,
-0.8512944, 0.09788813, -0.04497943, 0.8235294, 1, 0, 1,
-0.8508461, -0.5416808, -0.8213546, 0.8196079, 1, 0, 1,
-0.8491023, -0.5630578, -1.867155, 0.8117647, 1, 0, 1,
-0.8470407, 0.5266889, -1.19315, 0.8078431, 1, 0, 1,
-0.8462127, 1.359945, 0.6117935, 0.8, 1, 0, 1,
-0.8382654, 0.4409205, -2.915796, 0.7921569, 1, 0, 1,
-0.8365567, 1.195593, -1.069995, 0.7882353, 1, 0, 1,
-0.8273003, -0.3232706, -0.6383657, 0.7803922, 1, 0, 1,
-0.8205568, 0.650481, -0.4778136, 0.7764706, 1, 0, 1,
-0.8169326, -0.02780698, -0.9490148, 0.7686275, 1, 0, 1,
-0.8153852, 2.026723, -1.883338, 0.7647059, 1, 0, 1,
-0.8102024, 0.4860396, -0.3267188, 0.7568628, 1, 0, 1,
-0.8021151, 0.9136899, 0.3861725, 0.7529412, 1, 0, 1,
-0.8017688, 0.1474694, -1.729901, 0.7450981, 1, 0, 1,
-0.7943072, -0.5061341, -2.535278, 0.7411765, 1, 0, 1,
-0.790467, 0.07127828, 0.3286324, 0.7333333, 1, 0, 1,
-0.7877938, 0.8017441, 1.176628, 0.7294118, 1, 0, 1,
-0.7831981, -0.2841055, -0.9620771, 0.7215686, 1, 0, 1,
-0.7763546, 0.2008275, -1.934457, 0.7176471, 1, 0, 1,
-0.7705328, 0.4615453, -2.136981, 0.7098039, 1, 0, 1,
-0.7676564, 0.1597546, -3.498723, 0.7058824, 1, 0, 1,
-0.7570556, 0.2610458, -2.018958, 0.6980392, 1, 0, 1,
-0.7558401, -0.4052646, -3.044988, 0.6901961, 1, 0, 1,
-0.7515401, 1.478409, -0.2883253, 0.6862745, 1, 0, 1,
-0.7496133, -0.5443332, -4.092507, 0.6784314, 1, 0, 1,
-0.7457751, -0.6204668, -3.583803, 0.6745098, 1, 0, 1,
-0.7440113, -1.491629, -2.768109, 0.6666667, 1, 0, 1,
-0.7380008, -0.3107716, -0.464232, 0.6627451, 1, 0, 1,
-0.7363686, 0.008430765, -0.1411705, 0.654902, 1, 0, 1,
-0.7341833, 1.452517, 0.1998559, 0.6509804, 1, 0, 1,
-0.7229121, -1.725632, -3.342896, 0.6431373, 1, 0, 1,
-0.7220671, -0.7733296, -3.62633, 0.6392157, 1, 0, 1,
-0.7166061, -1.400024, -3.161715, 0.6313726, 1, 0, 1,
-0.7158032, -0.04414542, -2.301801, 0.627451, 1, 0, 1,
-0.7133397, -0.6841654, -1.544542, 0.6196079, 1, 0, 1,
-0.7103726, 1.7815, -0.4885466, 0.6156863, 1, 0, 1,
-0.7091356, 0.1457822, -1.37194, 0.6078432, 1, 0, 1,
-0.7052525, -1.146423, -1.016141, 0.6039216, 1, 0, 1,
-0.6926643, -0.5358499, -2.79511, 0.5960785, 1, 0, 1,
-0.6873805, 0.7366203, -0.1342851, 0.5882353, 1, 0, 1,
-0.6832484, -1.366391, -0.9691187, 0.5843138, 1, 0, 1,
-0.6773988, -0.4717839, -1.752432, 0.5764706, 1, 0, 1,
-0.6702703, 0.8094902, -0.7483557, 0.572549, 1, 0, 1,
-0.6636657, -0.4301214, -1.651794, 0.5647059, 1, 0, 1,
-0.6635149, -0.008083086, -1.565221, 0.5607843, 1, 0, 1,
-0.6610444, 0.847874, -1.558388, 0.5529412, 1, 0, 1,
-0.6589045, 0.7487238, 0.4437257, 0.5490196, 1, 0, 1,
-0.6564035, 1.637577, 0.3251984, 0.5411765, 1, 0, 1,
-0.6553248, -2.895178, -2.540279, 0.5372549, 1, 0, 1,
-0.654458, 1.390497, -1.074293, 0.5294118, 1, 0, 1,
-0.6525689, 0.5823036, 0.1820378, 0.5254902, 1, 0, 1,
-0.6482382, -0.9289355, -3.334817, 0.5176471, 1, 0, 1,
-0.6482223, -1.59155, -4.225395, 0.5137255, 1, 0, 1,
-0.6425511, 0.7654591, -0.7525063, 0.5058824, 1, 0, 1,
-0.6402563, 0.7954634, -2.391192, 0.5019608, 1, 0, 1,
-0.6330872, -0.2849116, -2.988068, 0.4941176, 1, 0, 1,
-0.6314226, 2.36616, -1.467515, 0.4862745, 1, 0, 1,
-0.6240134, 1.769151, -2.663773, 0.4823529, 1, 0, 1,
-0.6226891, -2.620843, -3.880254, 0.4745098, 1, 0, 1,
-0.620527, 0.01043973, 0.1191275, 0.4705882, 1, 0, 1,
-0.6154476, 0.06261837, -1.49087, 0.4627451, 1, 0, 1,
-0.6147716, 1.187842, 0.1949588, 0.4588235, 1, 0, 1,
-0.6121777, 0.8277701, -1.85644, 0.4509804, 1, 0, 1,
-0.6090474, -1.104591, -3.115988, 0.4470588, 1, 0, 1,
-0.605613, 1.097861, 0.6403004, 0.4392157, 1, 0, 1,
-0.5993174, -0.07858347, -1.244278, 0.4352941, 1, 0, 1,
-0.5982565, -1.356596, -3.076086, 0.427451, 1, 0, 1,
-0.5938104, -0.1669602, -2.093406, 0.4235294, 1, 0, 1,
-0.5902416, -0.4755291, -2.128753, 0.4156863, 1, 0, 1,
-0.5864031, -1.767599, -1.793249, 0.4117647, 1, 0, 1,
-0.5859378, -0.2848699, -1.329208, 0.4039216, 1, 0, 1,
-0.5812449, 1.932089, -0.4860237, 0.3960784, 1, 0, 1,
-0.5789352, 0.06463479, -0.4930703, 0.3921569, 1, 0, 1,
-0.5777863, -0.7459723, -3.100672, 0.3843137, 1, 0, 1,
-0.5691956, -0.6260544, -3.430427, 0.3803922, 1, 0, 1,
-0.5689757, -1.218161, -3.10192, 0.372549, 1, 0, 1,
-0.5624297, -0.8736755, -1.602019, 0.3686275, 1, 0, 1,
-0.5593753, -1.450798, -2.822026, 0.3607843, 1, 0, 1,
-0.559343, 2.277461, 0.4081179, 0.3568628, 1, 0, 1,
-0.5557646, 0.4217049, -0.1215914, 0.3490196, 1, 0, 1,
-0.555169, 0.1888584, -1.806934, 0.345098, 1, 0, 1,
-0.5539548, -0.4832495, -3.368265, 0.3372549, 1, 0, 1,
-0.5487757, 1.275442, -0.9236344, 0.3333333, 1, 0, 1,
-0.5460221, -0.368132, -1.779807, 0.3254902, 1, 0, 1,
-0.5415068, -1.563456, -2.203567, 0.3215686, 1, 0, 1,
-0.5414128, 0.02770736, -0.09051376, 0.3137255, 1, 0, 1,
-0.5361586, 0.8171381, -1.30036, 0.3098039, 1, 0, 1,
-0.5357612, -0.7950679, -2.843516, 0.3019608, 1, 0, 1,
-0.5268604, 0.4261624, -0.3357137, 0.2941177, 1, 0, 1,
-0.5249446, 0.7983465, -0.7394894, 0.2901961, 1, 0, 1,
-0.520223, 0.4509556, -2.588589, 0.282353, 1, 0, 1,
-0.5198705, -1.007553, -2.609665, 0.2784314, 1, 0, 1,
-0.519356, -0.8799698, -2.627367, 0.2705882, 1, 0, 1,
-0.5182177, 1.562696, -0.4304668, 0.2666667, 1, 0, 1,
-0.5177809, 0.162942, -1.200713, 0.2588235, 1, 0, 1,
-0.5170822, -0.02162955, -2.168061, 0.254902, 1, 0, 1,
-0.5170664, -0.6572585, -2.669856, 0.2470588, 1, 0, 1,
-0.5123258, -0.6661553, -1.869314, 0.2431373, 1, 0, 1,
-0.5092926, 0.9139, -1.201648, 0.2352941, 1, 0, 1,
-0.5074783, -0.2912452, -1.118832, 0.2313726, 1, 0, 1,
-0.5064245, 0.5290641, 0.4950618, 0.2235294, 1, 0, 1,
-0.5057051, -1.214091, -2.146677, 0.2196078, 1, 0, 1,
-0.5025874, -1.608771, -2.786553, 0.2117647, 1, 0, 1,
-0.498259, 1.263304, -1.177566, 0.2078431, 1, 0, 1,
-0.4964214, -0.2842892, -0.6225377, 0.2, 1, 0, 1,
-0.4954914, 0.7766654, -0.05295866, 0.1921569, 1, 0, 1,
-0.4925573, -0.09727139, -2.693677, 0.1882353, 1, 0, 1,
-0.4917399, 0.3629698, 0.01100247, 0.1803922, 1, 0, 1,
-0.4915112, -1.198054, -3.506784, 0.1764706, 1, 0, 1,
-0.486981, -0.6943914, -2.752448, 0.1686275, 1, 0, 1,
-0.4844087, -0.3828455, -2.829519, 0.1647059, 1, 0, 1,
-0.481251, 1.386689, 0.7064452, 0.1568628, 1, 0, 1,
-0.4755064, -0.2508487, -2.604574, 0.1529412, 1, 0, 1,
-0.4753721, -0.5345939, -3.004493, 0.145098, 1, 0, 1,
-0.4721983, 0.6704164, -0.8928422, 0.1411765, 1, 0, 1,
-0.4718521, -0.710432, -1.439075, 0.1333333, 1, 0, 1,
-0.4632645, 1.267675, -0.5482873, 0.1294118, 1, 0, 1,
-0.4490916, -0.2005672, -2.076308, 0.1215686, 1, 0, 1,
-0.4489211, 0.3967469, -0.2284515, 0.1176471, 1, 0, 1,
-0.4462549, -0.3463079, -3.36805, 0.1098039, 1, 0, 1,
-0.4396499, 0.008875801, -0.5584888, 0.1058824, 1, 0, 1,
-0.4335965, 0.9592006, -0.4128432, 0.09803922, 1, 0, 1,
-0.4325847, -1.877213, -3.141484, 0.09019608, 1, 0, 1,
-0.4314335, -1.275153, -0.7920513, 0.08627451, 1, 0, 1,
-0.4253981, -0.4165775, -2.690355, 0.07843138, 1, 0, 1,
-0.4200954, -0.2986983, -4.376604, 0.07450981, 1, 0, 1,
-0.4198712, 0.30891, -0.13584, 0.06666667, 1, 0, 1,
-0.4169453, 1.026952, -1.080343, 0.0627451, 1, 0, 1,
-0.4137478, 0.53289, 0.8565896, 0.05490196, 1, 0, 1,
-0.4129503, -1.058396, -4.76461, 0.05098039, 1, 0, 1,
-0.409117, -0.3067535, -1.140095, 0.04313726, 1, 0, 1,
-0.4062113, -1.507262, -1.42948, 0.03921569, 1, 0, 1,
-0.4060182, 1.216745, 0.1408011, 0.03137255, 1, 0, 1,
-0.4046113, -0.7916455, -2.059582, 0.02745098, 1, 0, 1,
-0.4036475, 1.664015, 0.8552177, 0.01960784, 1, 0, 1,
-0.4008948, 0.1737873, -1.729053, 0.01568628, 1, 0, 1,
-0.3998684, 0.09667656, 0.6283954, 0.007843138, 1, 0, 1,
-0.3969167, -1.191106, -2.256949, 0.003921569, 1, 0, 1,
-0.3966657, 0.6631715, 0.1607952, 0, 1, 0.003921569, 1,
-0.3963774, -0.9942435, -2.90847, 0, 1, 0.01176471, 1,
-0.3947063, 0.04361329, -1.194106, 0, 1, 0.01568628, 1,
-0.3941806, 2.239977, -1.25226, 0, 1, 0.02352941, 1,
-0.3922213, -0.6773578, -1.441486, 0, 1, 0.02745098, 1,
-0.3896225, 0.05057817, -1.254112, 0, 1, 0.03529412, 1,
-0.3891122, 0.2367894, -0.9119323, 0, 1, 0.03921569, 1,
-0.3888536, -0.9860809, -4.017943, 0, 1, 0.04705882, 1,
-0.3846365, 1.212973, 0.2226808, 0, 1, 0.05098039, 1,
-0.3839393, -0.6876507, -3.528714, 0, 1, 0.05882353, 1,
-0.3830792, -2.158331, -2.539752, 0, 1, 0.0627451, 1,
-0.3810337, -1.785847, -1.837523, 0, 1, 0.07058824, 1,
-0.3766235, -1.862646, -0.7021585, 0, 1, 0.07450981, 1,
-0.3762676, -0.09897061, -1.94372, 0, 1, 0.08235294, 1,
-0.3686207, -0.444975, -0.157432, 0, 1, 0.08627451, 1,
-0.3615542, 0.844829, -2.71646, 0, 1, 0.09411765, 1,
-0.3602691, 0.1442744, -0.429882, 0, 1, 0.1019608, 1,
-0.3516983, 0.3776679, 0.3336771, 0, 1, 0.1058824, 1,
-0.3515707, 1.037283, 1.080849, 0, 1, 0.1137255, 1,
-0.350524, 0.8754774, 0.484391, 0, 1, 0.1176471, 1,
-0.3474545, 2.421134, 0.1116862, 0, 1, 0.1254902, 1,
-0.3467587, 0.574455, -0.1110599, 0, 1, 0.1294118, 1,
-0.3464213, 1.448514, 1.405925, 0, 1, 0.1372549, 1,
-0.3449283, -1.154814, -2.54325, 0, 1, 0.1411765, 1,
-0.3434911, 0.3232168, -2.332416, 0, 1, 0.1490196, 1,
-0.3434885, 0.03314756, -1.014586, 0, 1, 0.1529412, 1,
-0.3413501, 0.5638033, -1.203307, 0, 1, 0.1607843, 1,
-0.3407595, 1.035846, 0.2334431, 0, 1, 0.1647059, 1,
-0.3398612, 0.8223591, 0.04722331, 0, 1, 0.172549, 1,
-0.339433, 1.512638, 1.643811, 0, 1, 0.1764706, 1,
-0.338753, -0.07901714, -1.913809, 0, 1, 0.1843137, 1,
-0.3372946, 0.4219556, -1.407108, 0, 1, 0.1882353, 1,
-0.3343543, -0.784334, -2.442273, 0, 1, 0.1960784, 1,
-0.3340059, -1.382099, -2.891717, 0, 1, 0.2039216, 1,
-0.3337461, -0.1931799, -0.5985278, 0, 1, 0.2078431, 1,
-0.330305, 0.1856737, -0.5917823, 0, 1, 0.2156863, 1,
-0.329859, -0.2652684, -1.949823, 0, 1, 0.2196078, 1,
-0.3280346, -0.8342263, -3.255765, 0, 1, 0.227451, 1,
-0.3270066, -0.6275691, -1.936496, 0, 1, 0.2313726, 1,
-0.3268827, -0.5880121, -2.33986, 0, 1, 0.2392157, 1,
-0.3265289, -0.873669, -3.221969, 0, 1, 0.2431373, 1,
-0.3244743, 0.2369579, -0.9615118, 0, 1, 0.2509804, 1,
-0.3234945, 1.828726, 1.658697, 0, 1, 0.254902, 1,
-0.3212159, 0.7275673, -0.1267907, 0, 1, 0.2627451, 1,
-0.3209201, -0.4409217, -3.1946, 0, 1, 0.2666667, 1,
-0.3199392, 0.5035293, -0.5428505, 0, 1, 0.2745098, 1,
-0.319423, -0.2751269, -1.275784, 0, 1, 0.2784314, 1,
-0.3185666, -1.64692, -3.79011, 0, 1, 0.2862745, 1,
-0.3112437, -0.4473192, 0.0082307, 0, 1, 0.2901961, 1,
-0.3082325, -1.447642, -3.920655, 0, 1, 0.2980392, 1,
-0.3080829, 0.2246825, -3.162592, 0, 1, 0.3058824, 1,
-0.3063529, -1.755897, -4.511128, 0, 1, 0.3098039, 1,
-0.305695, -1.910058, -5.033413, 0, 1, 0.3176471, 1,
-0.3042114, -1.951602, -3.497529, 0, 1, 0.3215686, 1,
-0.3015094, -0.5898621, -1.714392, 0, 1, 0.3294118, 1,
-0.2978234, -0.1453881, -0.6581579, 0, 1, 0.3333333, 1,
-0.2970264, 0.8673343, 0.5892053, 0, 1, 0.3411765, 1,
-0.2952671, -0.3729729, -2.591327, 0, 1, 0.345098, 1,
-0.2925867, -1.037881, -1.218459, 0, 1, 0.3529412, 1,
-0.2909128, 1.392902, 1.900802, 0, 1, 0.3568628, 1,
-0.2871505, -1.883606, -5.765536, 0, 1, 0.3647059, 1,
-0.286796, -0.502949, -2.365331, 0, 1, 0.3686275, 1,
-0.2864994, 1.261472, -1.883079, 0, 1, 0.3764706, 1,
-0.2814731, 0.6783289, 0.4840259, 0, 1, 0.3803922, 1,
-0.2799923, -0.3517812, -3.681179, 0, 1, 0.3882353, 1,
-0.2756608, 1.236005, 0.4318891, 0, 1, 0.3921569, 1,
-0.2705754, -1.011412, -4.457112, 0, 1, 0.4, 1,
-0.27052, 1.339365, -1.846816, 0, 1, 0.4078431, 1,
-0.2699849, -0.2546451, -2.385928, 0, 1, 0.4117647, 1,
-0.2694322, 0.03698115, -1.411705, 0, 1, 0.4196078, 1,
-0.2690359, -0.1860129, -1.76177, 0, 1, 0.4235294, 1,
-0.2681538, -0.2965252, -1.951143, 0, 1, 0.4313726, 1,
-0.2660379, -0.6853872, -1.426479, 0, 1, 0.4352941, 1,
-0.2659927, -0.3534091, -3.371575, 0, 1, 0.4431373, 1,
-0.2586384, -2.329633, -4.15051, 0, 1, 0.4470588, 1,
-0.2547007, 0.2824635, -1.224747, 0, 1, 0.454902, 1,
-0.2506688, 0.3985223, 0.03052738, 0, 1, 0.4588235, 1,
-0.2481651, -1.441375, -4.428225, 0, 1, 0.4666667, 1,
-0.2480472, -1.184581, -4.002991, 0, 1, 0.4705882, 1,
-0.2471063, -0.1743253, -1.552112, 0, 1, 0.4784314, 1,
-0.2364821, 0.01236505, -0.4625939, 0, 1, 0.4823529, 1,
-0.23478, -1.100762, -3.851378, 0, 1, 0.4901961, 1,
-0.2334612, 0.1234368, 0.2235585, 0, 1, 0.4941176, 1,
-0.2306108, -1.009527, -4.06315, 0, 1, 0.5019608, 1,
-0.2300185, -1.329387, -3.211474, 0, 1, 0.509804, 1,
-0.2257676, 0.2991783, 0.1205877, 0, 1, 0.5137255, 1,
-0.2233972, 0.3257287, -0.7973871, 0, 1, 0.5215687, 1,
-0.2223065, 0.5224122, -1.164945, 0, 1, 0.5254902, 1,
-0.2212206, -0.7396603, -1.834215, 0, 1, 0.5333334, 1,
-0.2179004, -0.6900068, -3.030738, 0, 1, 0.5372549, 1,
-0.2142203, 0.7513751, -1.342224, 0, 1, 0.5450981, 1,
-0.2116357, -0.3069374, -0.5417329, 0, 1, 0.5490196, 1,
-0.2091435, 0.7381791, -0.7789152, 0, 1, 0.5568628, 1,
-0.2081799, -0.1552081, -1.157033, 0, 1, 0.5607843, 1,
-0.2048544, -0.5303503, -2.074509, 0, 1, 0.5686275, 1,
-0.2042008, -0.02174495, -2.070478, 0, 1, 0.572549, 1,
-0.2012367, -1.961381, -0.9882838, 0, 1, 0.5803922, 1,
-0.1978436, -2.757547, -2.735502, 0, 1, 0.5843138, 1,
-0.1971676, -0.002444635, -2.57011, 0, 1, 0.5921569, 1,
-0.1970086, -0.5218913, -4.448962, 0, 1, 0.5960785, 1,
-0.1956663, 0.9060359, -0.1288123, 0, 1, 0.6039216, 1,
-0.1949384, -0.9324498, -2.896189, 0, 1, 0.6117647, 1,
-0.1945387, 0.7752544, -0.5494294, 0, 1, 0.6156863, 1,
-0.19006, 1.697458, 1.584203, 0, 1, 0.6235294, 1,
-0.1893177, 1.805957, 0.08284266, 0, 1, 0.627451, 1,
-0.1856973, 0.5650623, -0.1401264, 0, 1, 0.6352941, 1,
-0.1834138, -1.708523, -3.983973, 0, 1, 0.6392157, 1,
-0.1818613, -0.3376672, -2.297084, 0, 1, 0.6470588, 1,
-0.1815301, -1.432926, -2.567946, 0, 1, 0.6509804, 1,
-0.1807897, 1.666822, -1.177025, 0, 1, 0.6588235, 1,
-0.1747855, 0.9378306, 0.7516939, 0, 1, 0.6627451, 1,
-0.1708863, 0.2072885, -0.9936057, 0, 1, 0.6705883, 1,
-0.1708618, 0.01267235, -1.644443, 0, 1, 0.6745098, 1,
-0.1666069, -0.407079, -3.392937, 0, 1, 0.682353, 1,
-0.1656519, -0.01449343, -2.263045, 0, 1, 0.6862745, 1,
-0.1622884, 1.047632, 0.8493268, 0, 1, 0.6941177, 1,
-0.1617965, 1.805518, 1.369223, 0, 1, 0.7019608, 1,
-0.1614617, -2.688889, -3.502671, 0, 1, 0.7058824, 1,
-0.1605807, 1.405146, 0.210062, 0, 1, 0.7137255, 1,
-0.1605614, -0.4418663, -1.624116, 0, 1, 0.7176471, 1,
-0.1598178, 0.1558447, -1.401972, 0, 1, 0.7254902, 1,
-0.15622, -0.05700437, -1.050933, 0, 1, 0.7294118, 1,
-0.1560081, -0.3314032, -2.466755, 0, 1, 0.7372549, 1,
-0.154589, -1.510047, -3.526738, 0, 1, 0.7411765, 1,
-0.1466014, -1.630121, -1.573827, 0, 1, 0.7490196, 1,
-0.1450903, 0.296571, -0.8080708, 0, 1, 0.7529412, 1,
-0.1440411, -0.1633302, -2.857, 0, 1, 0.7607843, 1,
-0.1433097, -0.4462966, -3.504191, 0, 1, 0.7647059, 1,
-0.1428034, -0.1245133, -1.808449, 0, 1, 0.772549, 1,
-0.142242, 1.007994, 0.1328603, 0, 1, 0.7764706, 1,
-0.1376282, 2.057116, -0.6635056, 0, 1, 0.7843137, 1,
-0.1338706, -0.4490854, -2.372062, 0, 1, 0.7882353, 1,
-0.131792, -0.4656422, -0.3316281, 0, 1, 0.7960784, 1,
-0.1307679, 2.524551, 1.289401, 0, 1, 0.8039216, 1,
-0.1284566, -0.6490676, -3.683677, 0, 1, 0.8078431, 1,
-0.1277321, 1.502118, 1.851227, 0, 1, 0.8156863, 1,
-0.1265125, 1.262474, 0.8788223, 0, 1, 0.8196079, 1,
-0.1257871, 1.776609, -1.012743, 0, 1, 0.827451, 1,
-0.1224678, 0.6807734, -2.377888, 0, 1, 0.8313726, 1,
-0.1179399, -0.4681943, -2.754326, 0, 1, 0.8392157, 1,
-0.1174728, -0.4132623, -3.977803, 0, 1, 0.8431373, 1,
-0.1119725, -0.8837817, -2.166758, 0, 1, 0.8509804, 1,
-0.1111131, 0.5553508, -0.7766855, 0, 1, 0.854902, 1,
-0.1107842, -0.9404867, -3.569477, 0, 1, 0.8627451, 1,
-0.09999228, 0.7994272, -0.6228195, 0, 1, 0.8666667, 1,
-0.09070367, -0.6187558, -2.087961, 0, 1, 0.8745098, 1,
-0.0905893, 1.04963, -2.062669, 0, 1, 0.8784314, 1,
-0.08988827, -0.9824652, -3.351001, 0, 1, 0.8862745, 1,
-0.08974846, 1.026284, 0.5335515, 0, 1, 0.8901961, 1,
-0.08690798, 0.3821641, -0.07446205, 0, 1, 0.8980392, 1,
-0.08506338, -1.309291, -1.930505, 0, 1, 0.9058824, 1,
-0.08500773, 0.9490418, -0.3265577, 0, 1, 0.9098039, 1,
-0.08488756, -0.5208729, -2.236745, 0, 1, 0.9176471, 1,
-0.08231123, 0.6356264, 0.8975374, 0, 1, 0.9215686, 1,
-0.08109023, -0.2808683, -2.585733, 0, 1, 0.9294118, 1,
-0.07998602, 2.110982, 0.7014158, 0, 1, 0.9333333, 1,
-0.07551554, -0.1589317, -4.583827, 0, 1, 0.9411765, 1,
-0.07541996, 1.231849, -0.835591, 0, 1, 0.945098, 1,
-0.07015073, -1.245997, -2.992016, 0, 1, 0.9529412, 1,
-0.06735562, 0.2957965, -0.2839089, 0, 1, 0.9568627, 1,
-0.06454363, -1.368879, -3.375719, 0, 1, 0.9647059, 1,
-0.06318303, 1.602077, -2.115602, 0, 1, 0.9686275, 1,
-0.06280244, -1.247429, -2.399586, 0, 1, 0.9764706, 1,
-0.06237444, -0.03923485, -3.782314, 0, 1, 0.9803922, 1,
-0.06150223, 0.2670456, 0.2242574, 0, 1, 0.9882353, 1,
-0.05935212, 0.3782527, -1.040166, 0, 1, 0.9921569, 1,
-0.05596283, 2.031583, 0.8168485, 0, 1, 1, 1,
-0.05585067, -0.07511978, -0.2683626, 0, 0.9921569, 1, 1,
-0.05561291, 1.010701, 1.506312, 0, 0.9882353, 1, 1,
-0.05436578, 0.9947669, -0.862781, 0, 0.9803922, 1, 1,
-0.05377296, 0.1951747, 0.6960465, 0, 0.9764706, 1, 1,
-0.05310908, -1.078841, -3.284799, 0, 0.9686275, 1, 1,
-0.04799262, 0.4175914, 0.3211172, 0, 0.9647059, 1, 1,
-0.04509867, 1.291218, 0.7357571, 0, 0.9568627, 1, 1,
-0.04274847, -0.4891498, -5.071488, 0, 0.9529412, 1, 1,
-0.03636884, -0.8041829, -3.462162, 0, 0.945098, 1, 1,
-0.02077017, -1.011038, -2.859858, 0, 0.9411765, 1, 1,
-0.01907711, 0.126645, -2.453028, 0, 0.9333333, 1, 1,
-0.0184894, 1.467816, -1.617645, 0, 0.9294118, 1, 1,
-0.01676318, -0.6037737, -3.303053, 0, 0.9215686, 1, 1,
-0.0100441, -1.088235, -1.357082, 0, 0.9176471, 1, 1,
-0.006472857, -1.59992, -4.167135, 0, 0.9098039, 1, 1,
-0.003522926, 0.6092523, -0.07005557, 0, 0.9058824, 1, 1,
-0.00307447, -0.7394904, -1.82806, 0, 0.8980392, 1, 1,
0.004586502, 0.5025045, 1.042562, 0, 0.8901961, 1, 1,
0.01166451, -0.9496667, 3.278995, 0, 0.8862745, 1, 1,
0.01294255, 0.05064115, -0.2453547, 0, 0.8784314, 1, 1,
0.01586027, -1.673748, 3.299571, 0, 0.8745098, 1, 1,
0.01632978, -1.568159, 4.178658, 0, 0.8666667, 1, 1,
0.02403674, -0.4418603, 2.562654, 0, 0.8627451, 1, 1,
0.02712924, -2.093249, 4.429851, 0, 0.854902, 1, 1,
0.02812209, -1.32176, 3.51451, 0, 0.8509804, 1, 1,
0.02843995, 2.486763, 1.974208, 0, 0.8431373, 1, 1,
0.02923257, 0.8425032, -0.7696202, 0, 0.8392157, 1, 1,
0.03048171, -0.9356893, 1.734187, 0, 0.8313726, 1, 1,
0.03349771, -0.2948959, 3.728613, 0, 0.827451, 1, 1,
0.03788041, -0.2936401, 3.441407, 0, 0.8196079, 1, 1,
0.03892931, 1.701266, 0.7422481, 0, 0.8156863, 1, 1,
0.03983793, 1.40296, 0.2178603, 0, 0.8078431, 1, 1,
0.04328803, -0.1628006, 2.19296, 0, 0.8039216, 1, 1,
0.04342746, -1.122932, 1.682305, 0, 0.7960784, 1, 1,
0.04480863, 0.0566031, -0.1752889, 0, 0.7882353, 1, 1,
0.04989054, 0.428308, -0.8391111, 0, 0.7843137, 1, 1,
0.0508921, 0.2086585, 1.035425, 0, 0.7764706, 1, 1,
0.05374396, -0.5860467, 3.744177, 0, 0.772549, 1, 1,
0.05621286, 0.7684687, 0.9825541, 0, 0.7647059, 1, 1,
0.05632591, 1.122606, -1.639412, 0, 0.7607843, 1, 1,
0.05774382, -0.3009925, 5.017744, 0, 0.7529412, 1, 1,
0.0585828, 0.3804107, -0.5931085, 0, 0.7490196, 1, 1,
0.05927891, -0.6348954, 3.101988, 0, 0.7411765, 1, 1,
0.05987279, 0.3972914, -1.258256, 0, 0.7372549, 1, 1,
0.06343054, 1.018271, 0.5863099, 0, 0.7294118, 1, 1,
0.06472059, 1.322639, 1.097556, 0, 0.7254902, 1, 1,
0.06728275, 1.84645, 0.641189, 0, 0.7176471, 1, 1,
0.07168001, 1.004498, 1.174808, 0, 0.7137255, 1, 1,
0.07532056, -0.5620198, 1.310189, 0, 0.7058824, 1, 1,
0.07609031, -0.2567738, 1.560937, 0, 0.6980392, 1, 1,
0.07705329, 0.3558453, -0.3277618, 0, 0.6941177, 1, 1,
0.07722042, -0.8878964, 4.434484, 0, 0.6862745, 1, 1,
0.08455974, -1.386926, 3.199409, 0, 0.682353, 1, 1,
0.09365998, 0.1449668, 0.9740717, 0, 0.6745098, 1, 1,
0.09474342, 0.3958748, 1.958138, 0, 0.6705883, 1, 1,
0.09737957, -0.3754809, 3.081332, 0, 0.6627451, 1, 1,
0.1020314, -2.079744, 2.196045, 0, 0.6588235, 1, 1,
0.1020414, 1.079039, -1.883658, 0, 0.6509804, 1, 1,
0.1090334, -1.034312, 2.324971, 0, 0.6470588, 1, 1,
0.1144285, 0.6943042, -1.824803, 0, 0.6392157, 1, 1,
0.1147867, -1.075395, -0.800188, 0, 0.6352941, 1, 1,
0.1162059, -0.8623871, 4.008834, 0, 0.627451, 1, 1,
0.1170235, 0.7667996, -0.8045046, 0, 0.6235294, 1, 1,
0.1186306, -1.381696, 3.313374, 0, 0.6156863, 1, 1,
0.1191826, 1.893122, -0.772604, 0, 0.6117647, 1, 1,
0.1196972, 0.8860351, -0.8631458, 0, 0.6039216, 1, 1,
0.1203011, 2.254769, 1.470614, 0, 0.5960785, 1, 1,
0.1237702, -0.6613861, 2.097152, 0, 0.5921569, 1, 1,
0.1314942, 0.2232926, 0.7707582, 0, 0.5843138, 1, 1,
0.1316485, 0.4191144, -0.5721444, 0, 0.5803922, 1, 1,
0.1336408, 0.05874102, 0.6466303, 0, 0.572549, 1, 1,
0.1344041, 1.507592, 0.3924761, 0, 0.5686275, 1, 1,
0.1370401, 0.04996751, 2.350421, 0, 0.5607843, 1, 1,
0.1380949, 0.1071828, 2.150722, 0, 0.5568628, 1, 1,
0.1397354, -0.7439097, 2.731673, 0, 0.5490196, 1, 1,
0.1454713, -0.6246411, 3.50537, 0, 0.5450981, 1, 1,
0.146453, 1.472084, 0.2479687, 0, 0.5372549, 1, 1,
0.1504155, -0.006808842, 0.5361608, 0, 0.5333334, 1, 1,
0.1517324, -0.6123313, 3.058945, 0, 0.5254902, 1, 1,
0.1521891, -1.341631, 2.934197, 0, 0.5215687, 1, 1,
0.1535498, 1.222027, -0.7912086, 0, 0.5137255, 1, 1,
0.1551762, 0.2123288, -0.03594837, 0, 0.509804, 1, 1,
0.1602952, -1.178287, 3.455772, 0, 0.5019608, 1, 1,
0.1627835, -0.2304725, 2.288055, 0, 0.4941176, 1, 1,
0.1632942, 0.9392963, 0.4710513, 0, 0.4901961, 1, 1,
0.164166, -0.506096, 1.832996, 0, 0.4823529, 1, 1,
0.1642095, 0.4376409, 0.3491753, 0, 0.4784314, 1, 1,
0.1677811, -0.6363198, 4.343445, 0, 0.4705882, 1, 1,
0.1684432, -0.5207133, 1.292706, 0, 0.4666667, 1, 1,
0.1696266, -0.3589706, 0.662844, 0, 0.4588235, 1, 1,
0.1709655, 0.02698514, 1.708294, 0, 0.454902, 1, 1,
0.1714627, 1.72617, -0.0266648, 0, 0.4470588, 1, 1,
0.1717288, -0.2982998, 3.273308, 0, 0.4431373, 1, 1,
0.1756396, -0.01038757, 1.942241, 0, 0.4352941, 1, 1,
0.1897607, -1.328378, 3.242151, 0, 0.4313726, 1, 1,
0.1900909, -0.3007307, 3.272826, 0, 0.4235294, 1, 1,
0.1964514, 2.081149, 0.9999533, 0, 0.4196078, 1, 1,
0.1977522, -0.4502701, 3.834064, 0, 0.4117647, 1, 1,
0.1979418, 0.6536408, -0.1307282, 0, 0.4078431, 1, 1,
0.198547, 0.2168386, -0.5191728, 0, 0.4, 1, 1,
0.2036825, -0.6133431, 1.675699, 0, 0.3921569, 1, 1,
0.2053572, -0.2427708, 1.950784, 0, 0.3882353, 1, 1,
0.2059663, -0.5529949, 2.39336, 0, 0.3803922, 1, 1,
0.2131326, 1.294829, -1.302513, 0, 0.3764706, 1, 1,
0.2191208, 0.5402799, 0.9669048, 0, 0.3686275, 1, 1,
0.2208367, -1.390674, 3.033179, 0, 0.3647059, 1, 1,
0.2215949, -1.785584, 3.277029, 0, 0.3568628, 1, 1,
0.2265212, -0.2118902, 3.462247, 0, 0.3529412, 1, 1,
0.2276465, -0.5184829, 2.910303, 0, 0.345098, 1, 1,
0.2282719, 0.2612296, -0.459305, 0, 0.3411765, 1, 1,
0.2291142, 0.9862924, 1.175786, 0, 0.3333333, 1, 1,
0.2318075, -2.074335, 0.9147425, 0, 0.3294118, 1, 1,
0.2323368, -1.802413, 2.329501, 0, 0.3215686, 1, 1,
0.2334349, -0.5549214, 1.497925, 0, 0.3176471, 1, 1,
0.2378177, -0.06342147, 1.425342, 0, 0.3098039, 1, 1,
0.2380704, 0.1522643, 1.751025, 0, 0.3058824, 1, 1,
0.2420388, 2.016103, -0.2993144, 0, 0.2980392, 1, 1,
0.2432767, -0.2064053, 3.052331, 0, 0.2901961, 1, 1,
0.2450719, -0.4434544, 3.908876, 0, 0.2862745, 1, 1,
0.2483002, 0.1388486, -0.05518956, 0, 0.2784314, 1, 1,
0.2542004, 0.1734707, 1.82129, 0, 0.2745098, 1, 1,
0.2543927, 0.2819315, 0.5305871, 0, 0.2666667, 1, 1,
0.2546162, 0.4780436, 0.9985011, 0, 0.2627451, 1, 1,
0.2583977, 0.4482703, 0.5131236, 0, 0.254902, 1, 1,
0.2607762, 0.6981183, -0.613583, 0, 0.2509804, 1, 1,
0.2656151, 2.169335, -0.4366064, 0, 0.2431373, 1, 1,
0.2669738, -0.2323098, 4.009881, 0, 0.2392157, 1, 1,
0.2694897, 1.091959, 1.133306, 0, 0.2313726, 1, 1,
0.2713534, -1.94886, 3.148968, 0, 0.227451, 1, 1,
0.2730046, -0.7837534, 3.011862, 0, 0.2196078, 1, 1,
0.2763194, -0.2469782, 3.396234, 0, 0.2156863, 1, 1,
0.2769231, 0.5261493, 2.948355, 0, 0.2078431, 1, 1,
0.292786, -0.6145011, 3.487723, 0, 0.2039216, 1, 1,
0.2987042, -0.9227858, 1.903335, 0, 0.1960784, 1, 1,
0.2988008, -1.357081, 0.7220404, 0, 0.1882353, 1, 1,
0.2999124, 1.633328, 1.221154, 0, 0.1843137, 1, 1,
0.3002697, -2.949189, 4.227004, 0, 0.1764706, 1, 1,
0.303846, -1.422696, 4.198145, 0, 0.172549, 1, 1,
0.3103994, 0.02690272, 2.713955, 0, 0.1647059, 1, 1,
0.3125765, 0.2688385, -0.4068618, 0, 0.1607843, 1, 1,
0.3183284, 0.1673808, 1.132125, 0, 0.1529412, 1, 1,
0.3237353, -0.06903472, 2.480438, 0, 0.1490196, 1, 1,
0.3280277, 0.9332353, 1.413709, 0, 0.1411765, 1, 1,
0.3280379, 0.849012, 0.03143178, 0, 0.1372549, 1, 1,
0.3290236, -0.4527102, 2.229325, 0, 0.1294118, 1, 1,
0.3315022, 0.8281009, 0.0552332, 0, 0.1254902, 1, 1,
0.3328706, -1.879528, 2.821605, 0, 0.1176471, 1, 1,
0.3335021, 0.7682047, -0.8584433, 0, 0.1137255, 1, 1,
0.3347054, -0.9212168, 1.243107, 0, 0.1058824, 1, 1,
0.3363622, 1.317186, 0.3003231, 0, 0.09803922, 1, 1,
0.3387171, 0.09233162, 2.158328, 0, 0.09411765, 1, 1,
0.3410996, -1.881414, 4.170074, 0, 0.08627451, 1, 1,
0.3418573, -1.599095, 3.528649, 0, 0.08235294, 1, 1,
0.3446856, 0.1231209, 1.999047, 0, 0.07450981, 1, 1,
0.3545925, -0.6183026, 1.974681, 0, 0.07058824, 1, 1,
0.3554999, -0.4343882, 2.951279, 0, 0.0627451, 1, 1,
0.3609621, 0.811698, 0.208216, 0, 0.05882353, 1, 1,
0.3677903, 0.3911554, 0.7138693, 0, 0.05098039, 1, 1,
0.3684157, 0.05956522, 2.088741, 0, 0.04705882, 1, 1,
0.3684761, -0.2054948, 2.600756, 0, 0.03921569, 1, 1,
0.3705699, -2.122942, 1.281369, 0, 0.03529412, 1, 1,
0.3710766, 0.6756238, 1.926134, 0, 0.02745098, 1, 1,
0.3719084, -0.3555587, 3.312587, 0, 0.02352941, 1, 1,
0.3720098, -0.1885696, 3.502288, 0, 0.01568628, 1, 1,
0.3738065, 0.6098327, 0.01806138, 0, 0.01176471, 1, 1,
0.3818793, -1.401258, 3.428964, 0, 0.003921569, 1, 1,
0.3834133, -0.7349153, 3.034532, 0.003921569, 0, 1, 1,
0.3946258, -1.1902, 3.040875, 0.007843138, 0, 1, 1,
0.3972569, -0.9425777, 3.561361, 0.01568628, 0, 1, 1,
0.4049473, -0.6257501, 2.586111, 0.01960784, 0, 1, 1,
0.4056683, 1.613344, -0.5513844, 0.02745098, 0, 1, 1,
0.4079804, -1.123548, 5.443467, 0.03137255, 0, 1, 1,
0.4160001, -0.2291014, 1.543571, 0.03921569, 0, 1, 1,
0.4167147, 1.9121, -0.2208567, 0.04313726, 0, 1, 1,
0.4213605, -0.003982512, 2.061196, 0.05098039, 0, 1, 1,
0.423415, 0.6661617, 1.297395, 0.05490196, 0, 1, 1,
0.4267234, 0.05278032, 2.215573, 0.0627451, 0, 1, 1,
0.4270385, -1.234952, 2.879273, 0.06666667, 0, 1, 1,
0.4326336, -2.510196, 2.859478, 0.07450981, 0, 1, 1,
0.4326461, -0.6103047, 1.845967, 0.07843138, 0, 1, 1,
0.4327455, 0.597274, 1.968564, 0.08627451, 0, 1, 1,
0.4376896, 0.303629, 0.462115, 0.09019608, 0, 1, 1,
0.4434198, -1.211443, 3.251936, 0.09803922, 0, 1, 1,
0.4438984, 0.1418394, 3.021903, 0.1058824, 0, 1, 1,
0.4473349, -1.750501, 3.455114, 0.1098039, 0, 1, 1,
0.4542138, 0.4385231, -0.06310345, 0.1176471, 0, 1, 1,
0.455365, 0.8325005, 1.894307, 0.1215686, 0, 1, 1,
0.458762, 0.8369536, 0.2739117, 0.1294118, 0, 1, 1,
0.4596103, 0.7806216, 0.9555154, 0.1333333, 0, 1, 1,
0.4630678, 2.145929, -0.9309096, 0.1411765, 0, 1, 1,
0.4632098, 0.8611857, 1.284867, 0.145098, 0, 1, 1,
0.4667719, -1.143908, 2.754074, 0.1529412, 0, 1, 1,
0.4677612, 0.6356061, -1.598907, 0.1568628, 0, 1, 1,
0.4687348, -1.031833, 1.650942, 0.1647059, 0, 1, 1,
0.4715215, 0.06144294, 1.841763, 0.1686275, 0, 1, 1,
0.4715747, 0.7364914, 0.4021313, 0.1764706, 0, 1, 1,
0.4717645, -0.1224747, 1.414941, 0.1803922, 0, 1, 1,
0.4754724, 1.003603, 1.878773, 0.1882353, 0, 1, 1,
0.4787321, -0.8346553, 2.185993, 0.1921569, 0, 1, 1,
0.4796571, -0.1392608, 0.8288903, 0.2, 0, 1, 1,
0.4825324, 0.2919963, -0.6485085, 0.2078431, 0, 1, 1,
0.4827574, 0.4544469, 1.531935, 0.2117647, 0, 1, 1,
0.4935437, 0.1328361, 2.442192, 0.2196078, 0, 1, 1,
0.4939999, 0.7759919, 1.014279, 0.2235294, 0, 1, 1,
0.4975571, 0.4641022, -0.2426337, 0.2313726, 0, 1, 1,
0.4988057, -1.079256, 4.936332, 0.2352941, 0, 1, 1,
0.5003057, 1.025524, 1.885288, 0.2431373, 0, 1, 1,
0.5076393, -0.2924383, 4.328584, 0.2470588, 0, 1, 1,
0.5079541, 0.9401687, 1.127138, 0.254902, 0, 1, 1,
0.5171342, -0.4114682, 2.566685, 0.2588235, 0, 1, 1,
0.5197655, -0.4823096, 2.80507, 0.2666667, 0, 1, 1,
0.5216593, 0.2413076, 1.634547, 0.2705882, 0, 1, 1,
0.5218478, 1.143389, 0.3414723, 0.2784314, 0, 1, 1,
0.5257586, 2.15562, 1.783388, 0.282353, 0, 1, 1,
0.5295848, 1.163042, 1.206519, 0.2901961, 0, 1, 1,
0.5339913, -1.195902, 1.708298, 0.2941177, 0, 1, 1,
0.534869, -1.20161, 1.504301, 0.3019608, 0, 1, 1,
0.5396678, 0.02951284, -0.3882787, 0.3098039, 0, 1, 1,
0.5411024, 0.3382733, 0.8644285, 0.3137255, 0, 1, 1,
0.5429766, 0.8746801, 1.502869, 0.3215686, 0, 1, 1,
0.5435355, -0.8125421, 0.8555222, 0.3254902, 0, 1, 1,
0.5450156, 0.7325108, -0.720215, 0.3333333, 0, 1, 1,
0.5466638, 0.4147839, -0.3314376, 0.3372549, 0, 1, 1,
0.5495561, 0.743969, 1.742812, 0.345098, 0, 1, 1,
0.5499646, 0.5935782, 2.723775, 0.3490196, 0, 1, 1,
0.5512813, -1.349971, 3.245921, 0.3568628, 0, 1, 1,
0.552157, -1.322374, 3.374254, 0.3607843, 0, 1, 1,
0.5548164, 0.2331091, 2.35695, 0.3686275, 0, 1, 1,
0.5578751, 0.226145, 2.807924, 0.372549, 0, 1, 1,
0.5589048, 0.8161713, 0.591507, 0.3803922, 0, 1, 1,
0.5628152, 0.05429271, 0.2447059, 0.3843137, 0, 1, 1,
0.5660052, 1.401353, 0.5612941, 0.3921569, 0, 1, 1,
0.5743972, -0.377246, 1.874459, 0.3960784, 0, 1, 1,
0.5818111, 1.350898, 3.015674, 0.4039216, 0, 1, 1,
0.5869529, -1.275015, 2.847298, 0.4117647, 0, 1, 1,
0.5957418, 0.03519582, 2.020261, 0.4156863, 0, 1, 1,
0.5980781, -2.670068, 1.841296, 0.4235294, 0, 1, 1,
0.6035061, 1.161775, 1.083769, 0.427451, 0, 1, 1,
0.6044335, -0.6478193, 3.394576, 0.4352941, 0, 1, 1,
0.6054188, -0.9052534, 4.586893, 0.4392157, 0, 1, 1,
0.6054912, -1.051999, 2.892232, 0.4470588, 0, 1, 1,
0.6076704, -0.1730131, 2.658579, 0.4509804, 0, 1, 1,
0.6178517, 0.2552249, 1.978938, 0.4588235, 0, 1, 1,
0.6189259, 0.6762177, -0.05952577, 0.4627451, 0, 1, 1,
0.6271763, -0.3801475, 2.089982, 0.4705882, 0, 1, 1,
0.6283974, 0.2559889, 0.5779431, 0.4745098, 0, 1, 1,
0.6305234, 0.6648884, 0.4489572, 0.4823529, 0, 1, 1,
0.6337656, -0.9096177, 1.76404, 0.4862745, 0, 1, 1,
0.6345516, -0.1532074, 0.4827097, 0.4941176, 0, 1, 1,
0.6348031, -0.2343614, 0.5807805, 0.5019608, 0, 1, 1,
0.6353495, 2.009644, 0.4432767, 0.5058824, 0, 1, 1,
0.6461077, -0.2275113, 2.714215, 0.5137255, 0, 1, 1,
0.6474479, -0.1074836, -0.08054101, 0.5176471, 0, 1, 1,
0.6486362, 0.6330641, 0.3682142, 0.5254902, 0, 1, 1,
0.6524351, -0.5590429, 1.806447, 0.5294118, 0, 1, 1,
0.6531253, -1.543048, 3.737639, 0.5372549, 0, 1, 1,
0.6545162, 0.3991266, 0.3668191, 0.5411765, 0, 1, 1,
0.6605108, -0.7682241, 2.085763, 0.5490196, 0, 1, 1,
0.6660284, 0.3219815, -1.613239, 0.5529412, 0, 1, 1,
0.6668314, 0.2202963, -0.674644, 0.5607843, 0, 1, 1,
0.666954, 0.8407188, 1.292353, 0.5647059, 0, 1, 1,
0.6675449, 0.6893723, 2.031469, 0.572549, 0, 1, 1,
0.6700345, -1.611844, 2.433552, 0.5764706, 0, 1, 1,
0.670305, 0.8089049, 1.921141, 0.5843138, 0, 1, 1,
0.6838279, -0.0776832, 2.756877, 0.5882353, 0, 1, 1,
0.6896101, -0.4522644, 3.6574, 0.5960785, 0, 1, 1,
0.6943159, 1.006666, 1.768682, 0.6039216, 0, 1, 1,
0.6972731, -1.056823, 2.985727, 0.6078432, 0, 1, 1,
0.6982836, -1.3807, 2.364082, 0.6156863, 0, 1, 1,
0.7006889, -0.5140727, 2.700996, 0.6196079, 0, 1, 1,
0.71123, 1.945677, -0.02386539, 0.627451, 0, 1, 1,
0.7240665, -0.6492604, 4.879244, 0.6313726, 0, 1, 1,
0.7241837, 1.00382, -0.003040303, 0.6392157, 0, 1, 1,
0.7249404, 0.002415928, 0.480848, 0.6431373, 0, 1, 1,
0.7268983, -0.5544152, 2.119916, 0.6509804, 0, 1, 1,
0.7291388, -0.4440966, -0.1366777, 0.654902, 0, 1, 1,
0.7300447, 0.6384132, -0.7038163, 0.6627451, 0, 1, 1,
0.733148, 0.578352, -1.371368, 0.6666667, 0, 1, 1,
0.7353176, -1.357813, 0.08933803, 0.6745098, 0, 1, 1,
0.7426908, 0.3149247, 3.26695, 0.6784314, 0, 1, 1,
0.7495138, -0.2636402, 1.488453, 0.6862745, 0, 1, 1,
0.7606891, -0.08322652, 1.176797, 0.6901961, 0, 1, 1,
0.7670836, 0.1957697, 0.5100185, 0.6980392, 0, 1, 1,
0.7714369, 0.06586577, 2.470305, 0.7058824, 0, 1, 1,
0.7716295, -0.1570527, 1.659142, 0.7098039, 0, 1, 1,
0.7738765, -0.8834197, 2.392294, 0.7176471, 0, 1, 1,
0.7739815, 0.7459188, -0.9064993, 0.7215686, 0, 1, 1,
0.7810895, 0.4040814, 1.481119, 0.7294118, 0, 1, 1,
0.8037391, 0.2196499, 1.575377, 0.7333333, 0, 1, 1,
0.8079636, 0.4832249, 2.058273, 0.7411765, 0, 1, 1,
0.808079, -3.064514, 4.00787, 0.7450981, 0, 1, 1,
0.8080793, -0.6440323, 0.4964443, 0.7529412, 0, 1, 1,
0.808826, 0.04134801, 0.5211981, 0.7568628, 0, 1, 1,
0.809437, 1.80697, -0.2461812, 0.7647059, 0, 1, 1,
0.8152248, -0.198467, 2.305173, 0.7686275, 0, 1, 1,
0.8153874, -2.574282, 4.245421, 0.7764706, 0, 1, 1,
0.8163633, -0.05014066, 0.3840981, 0.7803922, 0, 1, 1,
0.8254176, -0.5147527, 1.410026, 0.7882353, 0, 1, 1,
0.8262949, 1.4416, -0.5289975, 0.7921569, 0, 1, 1,
0.8320123, 0.4120851, 1.56746, 0.8, 0, 1, 1,
0.8322781, -0.1951678, 0.2404239, 0.8078431, 0, 1, 1,
0.8336723, -0.6793575, 3.693613, 0.8117647, 0, 1, 1,
0.8389587, 0.9618059, -0.0785649, 0.8196079, 0, 1, 1,
0.84052, -0.6619217, 2.739835, 0.8235294, 0, 1, 1,
0.8562518, -1.284412, 2.188299, 0.8313726, 0, 1, 1,
0.8603796, 0.1534353, 2.448304, 0.8352941, 0, 1, 1,
0.8650539, -0.6540759, 2.252072, 0.8431373, 0, 1, 1,
0.8655214, 1.479191, 1.651551, 0.8470588, 0, 1, 1,
0.8670831, 1.367063, 0.3214001, 0.854902, 0, 1, 1,
0.8700485, -1.073072, 2.153693, 0.8588235, 0, 1, 1,
0.8765733, -2.463184, 2.812715, 0.8666667, 0, 1, 1,
0.8777559, -0.1746645, 0.3044844, 0.8705882, 0, 1, 1,
0.8780577, 0.4183306, 1.77133, 0.8784314, 0, 1, 1,
0.8796727, -0.799571, 2.268406, 0.8823529, 0, 1, 1,
0.8799911, 1.752423, 0.9581688, 0.8901961, 0, 1, 1,
0.8833714, 0.2384462, -0.5971357, 0.8941177, 0, 1, 1,
0.8852024, 1.037072, 1.087905, 0.9019608, 0, 1, 1,
0.8958464, 1.239849, 2.563433, 0.9098039, 0, 1, 1,
0.9005048, 0.9912244, 1.602807, 0.9137255, 0, 1, 1,
0.9006158, 0.2882726, 0.2739833, 0.9215686, 0, 1, 1,
0.9021984, 1.243774, -0.01867972, 0.9254902, 0, 1, 1,
0.9027292, -0.6628757, 0.5653979, 0.9333333, 0, 1, 1,
0.9060248, -0.5624276, 2.823765, 0.9372549, 0, 1, 1,
0.9060954, 0.8174096, 2.906712, 0.945098, 0, 1, 1,
0.9098044, 1.312034, 1.268345, 0.9490196, 0, 1, 1,
0.9113465, 0.6326726, 2.260929, 0.9568627, 0, 1, 1,
0.9163896, -0.5280841, 2.044176, 0.9607843, 0, 1, 1,
0.9194345, -0.4581786, 3.066277, 0.9686275, 0, 1, 1,
0.9268213, -1.205039, 2.584887, 0.972549, 0, 1, 1,
0.9358403, -1.034634, 3.671638, 0.9803922, 0, 1, 1,
0.9449361, 1.609601, 0.0966327, 0.9843137, 0, 1, 1,
0.9457209, 0.3518226, 1.535074, 0.9921569, 0, 1, 1,
0.9549815, -0.3202884, 1.93292, 0.9960784, 0, 1, 1,
0.9556085, 0.1997363, 2.715321, 1, 0, 0.9960784, 1,
0.9567265, 0.6159888, 1.12714, 1, 0, 0.9882353, 1,
0.9571765, -0.2778003, 1.024835, 1, 0, 0.9843137, 1,
0.9632225, -0.839554, 2.521244, 1, 0, 0.9764706, 1,
0.9662923, -0.4384164, 2.557086, 1, 0, 0.972549, 1,
0.971129, 0.5390275, 1.410105, 1, 0, 0.9647059, 1,
0.9737342, 1.415859, -2.118047, 1, 0, 0.9607843, 1,
0.9781733, -0.3997864, 2.669574, 1, 0, 0.9529412, 1,
0.9789089, -0.07756136, -0.1501155, 1, 0, 0.9490196, 1,
0.9803514, -1.506294, 3.858085, 1, 0, 0.9411765, 1,
0.9824046, -0.2329866, 1.405505, 1, 0, 0.9372549, 1,
0.9903594, 0.62409, -0.8557872, 1, 0, 0.9294118, 1,
0.9924366, -2.239595, 0.3742646, 1, 0, 0.9254902, 1,
1.00089, -0.1206519, 3.329237, 1, 0, 0.9176471, 1,
1.002248, 0.5200762, 1.094429, 1, 0, 0.9137255, 1,
1.014219, 0.007179923, 2.638093, 1, 0, 0.9058824, 1,
1.014594, -0.3129074, 2.913801, 1, 0, 0.9019608, 1,
1.014957, 0.6852031, 0.4227224, 1, 0, 0.8941177, 1,
1.019022, 0.5894742, 2.726624, 1, 0, 0.8862745, 1,
1.020561, -0.908134, 3.680081, 1, 0, 0.8823529, 1,
1.024947, -1.577869, 1.375086, 1, 0, 0.8745098, 1,
1.02533, 2.022893, 1.032146, 1, 0, 0.8705882, 1,
1.038087, -0.4484932, 1.739683, 1, 0, 0.8627451, 1,
1.04266, 1.168486, -0.7240081, 1, 0, 0.8588235, 1,
1.04659, -0.283665, 2.245187, 1, 0, 0.8509804, 1,
1.054535, 0.3582253, 2.770459, 1, 0, 0.8470588, 1,
1.056922, 0.6759539, 0.7542869, 1, 0, 0.8392157, 1,
1.060488, -0.9820209, 2.280761, 1, 0, 0.8352941, 1,
1.063468, 1.51954, -1.614702, 1, 0, 0.827451, 1,
1.065223, 0.1991165, 1.271821, 1, 0, 0.8235294, 1,
1.075415, 0.5592657, 2.961539, 1, 0, 0.8156863, 1,
1.077664, -0.4751184, 2.324613, 1, 0, 0.8117647, 1,
1.082821, -0.6273904, 1.817736, 1, 0, 0.8039216, 1,
1.085214, 1.695879, 0.6674245, 1, 0, 0.7960784, 1,
1.094357, -0.1489391, 1.405993, 1, 0, 0.7921569, 1,
1.095856, 1.916325, 2.223428, 1, 0, 0.7843137, 1,
1.096217, 0.4889771, 1.034897, 1, 0, 0.7803922, 1,
1.096866, -1.757695, 3.029937, 1, 0, 0.772549, 1,
1.10488, 0.4150455, 0.6369057, 1, 0, 0.7686275, 1,
1.117283, -1.483586, 3.896799, 1, 0, 0.7607843, 1,
1.121975, -0.398851, 2.960012, 1, 0, 0.7568628, 1,
1.130138, -1.026748, 2.042589, 1, 0, 0.7490196, 1,
1.131666, -0.7417386, 2.851356, 1, 0, 0.7450981, 1,
1.137561, 1.44314, 1.038918, 1, 0, 0.7372549, 1,
1.153976, 0.475176, 0.5952756, 1, 0, 0.7333333, 1,
1.154994, 0.1688198, 1.362419, 1, 0, 0.7254902, 1,
1.155344, 1.215554, 0.6195726, 1, 0, 0.7215686, 1,
1.155631, -0.2228163, 1.916353, 1, 0, 0.7137255, 1,
1.175428, -0.06554384, 1.501175, 1, 0, 0.7098039, 1,
1.177016, 0.223144, 1.415165, 1, 0, 0.7019608, 1,
1.177816, 0.917172, -1.421236, 1, 0, 0.6941177, 1,
1.179769, 0.0837358, 1.304035, 1, 0, 0.6901961, 1,
1.180923, 2.101654, 1.322248, 1, 0, 0.682353, 1,
1.183346, 0.2716142, 0.9935688, 1, 0, 0.6784314, 1,
1.206772, 0.6568521, -0.3208345, 1, 0, 0.6705883, 1,
1.209366, 1.265527, 1.479719, 1, 0, 0.6666667, 1,
1.211379, -1.847466, 3.250434, 1, 0, 0.6588235, 1,
1.218888, 0.2709782, 0.694925, 1, 0, 0.654902, 1,
1.219079, 0.0122708, 2.030311, 1, 0, 0.6470588, 1,
1.22599, 0.8755271, -1.135623, 1, 0, 0.6431373, 1,
1.228834, -1.415476, 2.840582, 1, 0, 0.6352941, 1,
1.238037, -1.288424, 2.248239, 1, 0, 0.6313726, 1,
1.238176, -0.6414247, 2.134178, 1, 0, 0.6235294, 1,
1.2475, -0.9325578, 1.868505, 1, 0, 0.6196079, 1,
1.253621, -1.292256, 2.889961, 1, 0, 0.6117647, 1,
1.255279, -0.5694411, 1.067954, 1, 0, 0.6078432, 1,
1.256368, -2.308006, 4.801853, 1, 0, 0.6, 1,
1.258353, 0.539915, 2.360253, 1, 0, 0.5921569, 1,
1.263927, -1.719583, 1.960128, 1, 0, 0.5882353, 1,
1.264553, -1.20723, 3.152042, 1, 0, 0.5803922, 1,
1.276877, -0.5496647, 1.051043, 1, 0, 0.5764706, 1,
1.281245, -0.7063671, 3.24429, 1, 0, 0.5686275, 1,
1.281292, 1.419255, 0.8783773, 1, 0, 0.5647059, 1,
1.283255, 1.098794, -0.03918171, 1, 0, 0.5568628, 1,
1.284499, -1.175924, 1.820873, 1, 0, 0.5529412, 1,
1.284977, -1.000079, 0.6713941, 1, 0, 0.5450981, 1,
1.288566, -0.9322497, 2.99507, 1, 0, 0.5411765, 1,
1.299586, -0.6071889, 1.446751, 1, 0, 0.5333334, 1,
1.300905, 0.151573, 1.363646, 1, 0, 0.5294118, 1,
1.301689, -0.1732896, 3.006221, 1, 0, 0.5215687, 1,
1.307694, 1.436617, 1.835182, 1, 0, 0.5176471, 1,
1.313352, -3.057405, 3.038335, 1, 0, 0.509804, 1,
1.324363, -1.027686, 2.837622, 1, 0, 0.5058824, 1,
1.324707, -0.7657869, 3.436002, 1, 0, 0.4980392, 1,
1.326716, -1.067178, 1.455627, 1, 0, 0.4901961, 1,
1.329687, 0.448565, 1.038404, 1, 0, 0.4862745, 1,
1.335199, -0.7482753, 1.759215, 1, 0, 0.4784314, 1,
1.338972, -0.7296663, 0.7933663, 1, 0, 0.4745098, 1,
1.341722, -0.4926755, 1.163642, 1, 0, 0.4666667, 1,
1.344675, 0.8955151, 1.187685, 1, 0, 0.4627451, 1,
1.350728, -0.4946677, 2.367369, 1, 0, 0.454902, 1,
1.354266, 1.063929, 2.444469, 1, 0, 0.4509804, 1,
1.364515, 0.2454799, 1.641857, 1, 0, 0.4431373, 1,
1.385716, -0.4709973, 2.244494, 1, 0, 0.4392157, 1,
1.390129, -0.4015728, 2.619261, 1, 0, 0.4313726, 1,
1.429228, -0.31837, 1.462343, 1, 0, 0.427451, 1,
1.439196, -0.01027592, 0.2208779, 1, 0, 0.4196078, 1,
1.443929, 1.125865, 1.879122, 1, 0, 0.4156863, 1,
1.450429, -0.2942805, 4.294028, 1, 0, 0.4078431, 1,
1.452145, -1.279798, 2.996156, 1, 0, 0.4039216, 1,
1.454659, 0.4511796, 1.606684, 1, 0, 0.3960784, 1,
1.456506, -0.7080864, 2.43799, 1, 0, 0.3882353, 1,
1.480851, 0.8094584, 1.984952, 1, 0, 0.3843137, 1,
1.490649, -1.478532, 3.021239, 1, 0, 0.3764706, 1,
1.491632, -1.978826, 0.7769248, 1, 0, 0.372549, 1,
1.496564, 0.01685268, 1.268551, 1, 0, 0.3647059, 1,
1.499357, -0.3691734, 0.1256574, 1, 0, 0.3607843, 1,
1.514302, -1.310974, 3.656384, 1, 0, 0.3529412, 1,
1.518142, 1.076896, -0.5199994, 1, 0, 0.3490196, 1,
1.524671, -0.818698, 0.775715, 1, 0, 0.3411765, 1,
1.534141, 0.343216, 1.121562, 1, 0, 0.3372549, 1,
1.534147, 0.08669233, 0.01602111, 1, 0, 0.3294118, 1,
1.535385, -0.8864734, 2.15465, 1, 0, 0.3254902, 1,
1.544144, 1.59784, 0.2195161, 1, 0, 0.3176471, 1,
1.565212, -1.16449, 2.042803, 1, 0, 0.3137255, 1,
1.573544, -0.4670256, 2.177523, 1, 0, 0.3058824, 1,
1.581105, 0.01543559, 1.549407, 1, 0, 0.2980392, 1,
1.584912, -0.6387398, 0.9237627, 1, 0, 0.2941177, 1,
1.585732, -0.1131688, 0.795175, 1, 0, 0.2862745, 1,
1.586147, 1.316649, 0.7898482, 1, 0, 0.282353, 1,
1.591116, -0.2244591, 2.31073, 1, 0, 0.2745098, 1,
1.603992, 1.416005, -0.09223662, 1, 0, 0.2705882, 1,
1.613727, 1.036263, 2.223008, 1, 0, 0.2627451, 1,
1.622864, 0.5809138, 1.78626, 1, 0, 0.2588235, 1,
1.627408, 0.9950299, 0.6594183, 1, 0, 0.2509804, 1,
1.635314, 0.1744698, -0.07435552, 1, 0, 0.2470588, 1,
1.636664, -1.80162, 1.76602, 1, 0, 0.2392157, 1,
1.640905, 0.3502671, 1.39103, 1, 0, 0.2352941, 1,
1.651461, -0.5012216, 0.02933721, 1, 0, 0.227451, 1,
1.688807, 1.783753, 3.246262, 1, 0, 0.2235294, 1,
1.702339, -0.1735948, 1.772267, 1, 0, 0.2156863, 1,
1.717148, -1.810007, -0.1121766, 1, 0, 0.2117647, 1,
1.75545, 1.008464, 2.747787, 1, 0, 0.2039216, 1,
1.769722, 0.775826, -1.073877, 1, 0, 0.1960784, 1,
1.819455, -0.3662026, 2.21058, 1, 0, 0.1921569, 1,
1.834924, -0.9425189, 2.471277, 1, 0, 0.1843137, 1,
1.868859, -0.334276, 4.364128, 1, 0, 0.1803922, 1,
1.885187, -0.702563, 1.538657, 1, 0, 0.172549, 1,
1.910638, 1.030101, 0.4568055, 1, 0, 0.1686275, 1,
1.930887, -0.05937555, 1.199339, 1, 0, 0.1607843, 1,
1.959589, 1.689928, -0.3349082, 1, 0, 0.1568628, 1,
1.991539, -0.649433, 2.702488, 1, 0, 0.1490196, 1,
1.99184, 1.032363, 1.593465, 1, 0, 0.145098, 1,
2.00407, -1.426955, 3.19192, 1, 0, 0.1372549, 1,
2.018889, -0.5461548, 0.9210711, 1, 0, 0.1333333, 1,
2.019174, -0.7897823, 4.299973, 1, 0, 0.1254902, 1,
2.053757, -0.1102801, 0.6649293, 1, 0, 0.1215686, 1,
2.117001, -0.4077774, -1.137131, 1, 0, 0.1137255, 1,
2.201123, -0.3043495, 1.123679, 1, 0, 0.1098039, 1,
2.209855, 1.357629, 1.741908, 1, 0, 0.1019608, 1,
2.274999, 0.6716861, 1.731418, 1, 0, 0.09411765, 1,
2.30532, 0.8928184, 2.43672, 1, 0, 0.09019608, 1,
2.327374, -0.4122626, 1.8347, 1, 0, 0.08235294, 1,
2.331329, -0.7263374, 2.531262, 1, 0, 0.07843138, 1,
2.347343, -0.8191568, 2.272165, 1, 0, 0.07058824, 1,
2.363435, -1.268389, 1.922638, 1, 0, 0.06666667, 1,
2.4342, -1.81037, 3.69137, 1, 0, 0.05882353, 1,
2.456168, 0.8286216, 1.065739, 1, 0, 0.05490196, 1,
2.476505, 1.116776, 0.7521227, 1, 0, 0.04705882, 1,
2.509341, 1.16326, 0.8709121, 1, 0, 0.04313726, 1,
2.549127, -0.9714085, 3.034252, 1, 0, 0.03529412, 1,
2.685834, -0.8141667, 1.765119, 1, 0, 0.03137255, 1,
2.833177, 1.718162, 0.8270923, 1, 0, 0.02352941, 1,
3.059808, 0.2115584, 0.3439516, 1, 0, 0.01960784, 1,
3.343915, 0.6060606, 0.8968759, 1, 0, 0.01176471, 1,
3.419213, 1.653792, 2.359966, 1, 0, 0.007843138, 1
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
-0.1929632, -4.01186, -7.665462, 0, -0.5, 0.5, 0.5,
-0.1929632, -4.01186, -7.665462, 1, -0.5, 0.5, 0.5,
-0.1929632, -4.01186, -7.665462, 1, 1.5, 0.5, 0.5,
-0.1929632, -4.01186, -7.665462, 0, 1.5, 0.5, 0.5
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
-5.029667, -0.2699814, -7.665462, 0, -0.5, 0.5, 0.5,
-5.029667, -0.2699814, -7.665462, 1, -0.5, 0.5, 0.5,
-5.029667, -0.2699814, -7.665462, 1, 1.5, 0.5, 0.5,
-5.029667, -0.2699814, -7.665462, 0, 1.5, 0.5, 0.5
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
-5.029667, -4.01186, -0.1610346, 0, -0.5, 0.5, 0.5,
-5.029667, -4.01186, -0.1610346, 1, -0.5, 0.5, 0.5,
-5.029667, -4.01186, -0.1610346, 1, 1.5, 0.5, 0.5,
-5.029667, -4.01186, -0.1610346, 0, 1.5, 0.5, 0.5
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
-2, -3.14835, -5.933671,
2, -3.14835, -5.933671,
-2, -3.14835, -5.933671,
-2, -3.292268, -6.222303,
0, -3.14835, -5.933671,
0, -3.292268, -6.222303,
2, -3.14835, -5.933671,
2, -3.292268, -6.222303
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
-2, -3.580105, -6.799567, 0, -0.5, 0.5, 0.5,
-2, -3.580105, -6.799567, 1, -0.5, 0.5, 0.5,
-2, -3.580105, -6.799567, 1, 1.5, 0.5, 0.5,
-2, -3.580105, -6.799567, 0, 1.5, 0.5, 0.5,
0, -3.580105, -6.799567, 0, -0.5, 0.5, 0.5,
0, -3.580105, -6.799567, 1, -0.5, 0.5, 0.5,
0, -3.580105, -6.799567, 1, 1.5, 0.5, 0.5,
0, -3.580105, -6.799567, 0, 1.5, 0.5, 0.5,
2, -3.580105, -6.799567, 0, -0.5, 0.5, 0.5,
2, -3.580105, -6.799567, 1, -0.5, 0.5, 0.5,
2, -3.580105, -6.799567, 1, 1.5, 0.5, 0.5,
2, -3.580105, -6.799567, 0, 1.5, 0.5, 0.5
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
-3.913505, -3, -5.933671,
-3.913505, 2, -5.933671,
-3.913505, -3, -5.933671,
-4.099532, -3, -6.222303,
-3.913505, -2, -5.933671,
-4.099532, -2, -6.222303,
-3.913505, -1, -5.933671,
-4.099532, -1, -6.222303,
-3.913505, 0, -5.933671,
-4.099532, 0, -6.222303,
-3.913505, 1, -5.933671,
-4.099532, 1, -6.222303,
-3.913505, 2, -5.933671,
-4.099532, 2, -6.222303
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
-4.471586, -3, -6.799567, 0, -0.5, 0.5, 0.5,
-4.471586, -3, -6.799567, 1, -0.5, 0.5, 0.5,
-4.471586, -3, -6.799567, 1, 1.5, 0.5, 0.5,
-4.471586, -3, -6.799567, 0, 1.5, 0.5, 0.5,
-4.471586, -2, -6.799567, 0, -0.5, 0.5, 0.5,
-4.471586, -2, -6.799567, 1, -0.5, 0.5, 0.5,
-4.471586, -2, -6.799567, 1, 1.5, 0.5, 0.5,
-4.471586, -2, -6.799567, 0, 1.5, 0.5, 0.5,
-4.471586, -1, -6.799567, 0, -0.5, 0.5, 0.5,
-4.471586, -1, -6.799567, 1, -0.5, 0.5, 0.5,
-4.471586, -1, -6.799567, 1, 1.5, 0.5, 0.5,
-4.471586, -1, -6.799567, 0, 1.5, 0.5, 0.5,
-4.471586, 0, -6.799567, 0, -0.5, 0.5, 0.5,
-4.471586, 0, -6.799567, 1, -0.5, 0.5, 0.5,
-4.471586, 0, -6.799567, 1, 1.5, 0.5, 0.5,
-4.471586, 0, -6.799567, 0, 1.5, 0.5, 0.5,
-4.471586, 1, -6.799567, 0, -0.5, 0.5, 0.5,
-4.471586, 1, -6.799567, 1, -0.5, 0.5, 0.5,
-4.471586, 1, -6.799567, 1, 1.5, 0.5, 0.5,
-4.471586, 1, -6.799567, 0, 1.5, 0.5, 0.5,
-4.471586, 2, -6.799567, 0, -0.5, 0.5, 0.5,
-4.471586, 2, -6.799567, 1, -0.5, 0.5, 0.5,
-4.471586, 2, -6.799567, 1, 1.5, 0.5, 0.5,
-4.471586, 2, -6.799567, 0, 1.5, 0.5, 0.5
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
-3.913505, -3.14835, -4,
-3.913505, -3.14835, 4,
-3.913505, -3.14835, -4,
-4.099532, -3.292268, -4,
-3.913505, -3.14835, -2,
-4.099532, -3.292268, -2,
-3.913505, -3.14835, 0,
-4.099532, -3.292268, 0,
-3.913505, -3.14835, 2,
-4.099532, -3.292268, 2,
-3.913505, -3.14835, 4,
-4.099532, -3.292268, 4
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
-4.471586, -3.580105, -4, 0, -0.5, 0.5, 0.5,
-4.471586, -3.580105, -4, 1, -0.5, 0.5, 0.5,
-4.471586, -3.580105, -4, 1, 1.5, 0.5, 0.5,
-4.471586, -3.580105, -4, 0, 1.5, 0.5, 0.5,
-4.471586, -3.580105, -2, 0, -0.5, 0.5, 0.5,
-4.471586, -3.580105, -2, 1, -0.5, 0.5, 0.5,
-4.471586, -3.580105, -2, 1, 1.5, 0.5, 0.5,
-4.471586, -3.580105, -2, 0, 1.5, 0.5, 0.5,
-4.471586, -3.580105, 0, 0, -0.5, 0.5, 0.5,
-4.471586, -3.580105, 0, 1, -0.5, 0.5, 0.5,
-4.471586, -3.580105, 0, 1, 1.5, 0.5, 0.5,
-4.471586, -3.580105, 0, 0, 1.5, 0.5, 0.5,
-4.471586, -3.580105, 2, 0, -0.5, 0.5, 0.5,
-4.471586, -3.580105, 2, 1, -0.5, 0.5, 0.5,
-4.471586, -3.580105, 2, 1, 1.5, 0.5, 0.5,
-4.471586, -3.580105, 2, 0, 1.5, 0.5, 0.5,
-4.471586, -3.580105, 4, 0, -0.5, 0.5, 0.5,
-4.471586, -3.580105, 4, 1, -0.5, 0.5, 0.5,
-4.471586, -3.580105, 4, 1, 1.5, 0.5, 0.5,
-4.471586, -3.580105, 4, 0, 1.5, 0.5, 0.5
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
-3.913505, -3.14835, -5.933671,
-3.913505, 2.608387, -5.933671,
-3.913505, -3.14835, 5.611602,
-3.913505, 2.608387, 5.611602,
-3.913505, -3.14835, -5.933671,
-3.913505, -3.14835, 5.611602,
-3.913505, 2.608387, -5.933671,
-3.913505, 2.608387, 5.611602,
-3.913505, -3.14835, -5.933671,
3.527578, -3.14835, -5.933671,
-3.913505, -3.14835, 5.611602,
3.527578, -3.14835, 5.611602,
-3.913505, 2.608387, -5.933671,
3.527578, 2.608387, -5.933671,
-3.913505, 2.608387, 5.611602,
3.527578, 2.608387, 5.611602,
3.527578, -3.14835, -5.933671,
3.527578, 2.608387, -5.933671,
3.527578, -3.14835, 5.611602,
3.527578, 2.608387, 5.611602,
3.527578, -3.14835, -5.933671,
3.527578, -3.14835, 5.611602,
3.527578, 2.608387, -5.933671,
3.527578, 2.608387, 5.611602
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
var radius = 7.952602;
var distance = 35.38202;
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
mvMatrix.translate( 0.1929632, 0.2699814, 0.1610346 );
mvMatrix.scale( 1.155545, 1.493643, 0.7447644 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.38202);
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
Formanilide<-read.table("Formanilide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Formanilide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Formanilide' not found
```

```r
y<-Formanilide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Formanilide' not found
```

```r
z<-Formanilide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Formanilide' not found
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
-3.805139, 0.04449251, -1.927807, 0, 0, 1, 1, 1,
-2.687028, -0.3097486, -2.548237, 1, 0, 0, 1, 1,
-2.55411, -1.003536, -2.229955, 1, 0, 0, 1, 1,
-2.518071, -0.02219867, -1.114772, 1, 0, 0, 1, 1,
-2.501126, -1.998518, -1.459984, 1, 0, 0, 1, 1,
-2.427227, 1.775455, -1.593274, 1, 0, 0, 1, 1,
-2.426762, 0.3841506, -1.388703, 0, 0, 0, 1, 1,
-2.368741, 1.307884, -0.8214793, 0, 0, 0, 1, 1,
-2.363394, 0.06810386, -2.555671, 0, 0, 0, 1, 1,
-2.346113, -0.816229, -1.428394, 0, 0, 0, 1, 1,
-2.294239, 0.3788158, -2.094878, 0, 0, 0, 1, 1,
-2.286048, 0.6086381, -3.20503, 0, 0, 0, 1, 1,
-2.28346, -0.9438488, -1.061556, 0, 0, 0, 1, 1,
-2.274652, 0.2287813, -0.5742772, 1, 1, 1, 1, 1,
-2.274156, 0.751962, -1.812289, 1, 1, 1, 1, 1,
-2.255051, 1.225247, -0.2048043, 1, 1, 1, 1, 1,
-2.208558, 2.030723, -1.604526, 1, 1, 1, 1, 1,
-2.198947, -0.6220824, -2.406033, 1, 1, 1, 1, 1,
-2.189904, 0.2847513, -1.028883, 1, 1, 1, 1, 1,
-2.16733, -0.1143559, -1.809309, 1, 1, 1, 1, 1,
-2.104068, -0.8725551, -0.9489363, 1, 1, 1, 1, 1,
-2.09253, 0.3242519, -1.562089, 1, 1, 1, 1, 1,
-2.086191, 1.022534, 0.06073068, 1, 1, 1, 1, 1,
-2.050546, 0.8258173, -1.663166, 1, 1, 1, 1, 1,
-2.036201, -1.019618, -1.046238, 1, 1, 1, 1, 1,
-2.005007, 0.8714544, 0.3296155, 1, 1, 1, 1, 1,
-1.981987, 0.8637162, -2.749237, 1, 1, 1, 1, 1,
-1.958457, -0.2768922, -0.7409224, 1, 1, 1, 1, 1,
-1.904123, -1.203606, -2.737622, 0, 0, 1, 1, 1,
-1.90372, 0.7259141, -1.066179, 1, 0, 0, 1, 1,
-1.862858, -0.6005716, -3.561388, 1, 0, 0, 1, 1,
-1.851373, 0.1938435, -2.713197, 1, 0, 0, 1, 1,
-1.846077, -0.1180693, -1.069262, 1, 0, 0, 1, 1,
-1.832536, -1.52321, -2.942756, 1, 0, 0, 1, 1,
-1.829059, 0.3468893, -1.627507, 0, 0, 0, 1, 1,
-1.816418, 0.04317373, -1.47434, 0, 0, 0, 1, 1,
-1.791488, 0.3157891, -1.51614, 0, 0, 0, 1, 1,
-1.786722, 0.2551247, -1.377163, 0, 0, 0, 1, 1,
-1.739884, -1.13546, -0.4655327, 0, 0, 0, 1, 1,
-1.732383, 0.6228119, -0.1943812, 0, 0, 0, 1, 1,
-1.728151, 0.05308548, -2.241509, 0, 0, 0, 1, 1,
-1.721443, -0.4213656, -2.037336, 1, 1, 1, 1, 1,
-1.719049, -0.2874779, -0.2447301, 1, 1, 1, 1, 1,
-1.698331, -1.246767, -1.973733, 1, 1, 1, 1, 1,
-1.696659, 0.5402712, -2.52181, 1, 1, 1, 1, 1,
-1.691881, -0.107046, -1.461188, 1, 1, 1, 1, 1,
-1.677501, 0.7243881, -2.161571, 1, 1, 1, 1, 1,
-1.676045, -0.3513914, -2.471853, 1, 1, 1, 1, 1,
-1.666231, 1.445265, -1.423181, 1, 1, 1, 1, 1,
-1.663653, 0.1415853, -2.674395, 1, 1, 1, 1, 1,
-1.662629, -0.8921682, -0.4711607, 1, 1, 1, 1, 1,
-1.662128, 0.1416362, -2.622865, 1, 1, 1, 1, 1,
-1.650474, 0.6070309, -0.7938176, 1, 1, 1, 1, 1,
-1.648885, -0.8092806, -1.514903, 1, 1, 1, 1, 1,
-1.551675, 0.919236, -1.061856, 1, 1, 1, 1, 1,
-1.53695, 0.6741257, -1.585081, 1, 1, 1, 1, 1,
-1.534839, 1.229736, -0.7900956, 0, 0, 1, 1, 1,
-1.522375, -1.095029, -2.749474, 1, 0, 0, 1, 1,
-1.518726, -0.741757, -2.929383, 1, 0, 0, 1, 1,
-1.518503, -2.181787, -2.239967, 1, 0, 0, 1, 1,
-1.515124, 0.09887091, -1.999516, 1, 0, 0, 1, 1,
-1.505277, -0.4405253, 0.1002586, 1, 0, 0, 1, 1,
-1.503081, -0.3210248, -0.1746396, 0, 0, 0, 1, 1,
-1.501322, -1.093266, -2.527575, 0, 0, 0, 1, 1,
-1.499479, 0.7713761, -2.320231, 0, 0, 0, 1, 1,
-1.490481, 0.0226875, -1.588356, 0, 0, 0, 1, 1,
-1.489312, 1.23298, 0.3133793, 0, 0, 0, 1, 1,
-1.487822, 0.5509585, -0.3804204, 0, 0, 0, 1, 1,
-1.473959, -1.119846, -0.3084507, 0, 0, 0, 1, 1,
-1.464141, 1.350145, -0.3675765, 1, 1, 1, 1, 1,
-1.460736, -0.4482348, -2.11938, 1, 1, 1, 1, 1,
-1.455874, -0.1458912, -2.187806, 1, 1, 1, 1, 1,
-1.455321, -1.144613, -2.291655, 1, 1, 1, 1, 1,
-1.451624, -1.296827, -2.097766, 1, 1, 1, 1, 1,
-1.443107, 1.053643, -0.6776751, 1, 1, 1, 1, 1,
-1.4304, 0.8356116, -0.003407002, 1, 1, 1, 1, 1,
-1.430207, -0.8232915, -2.214761, 1, 1, 1, 1, 1,
-1.428012, 0.2366667, -1.905246, 1, 1, 1, 1, 1,
-1.414506, -0.5316703, -1.402531, 1, 1, 1, 1, 1,
-1.40147, -0.0964625, -1.775125, 1, 1, 1, 1, 1,
-1.398009, -0.01305251, -1.38249, 1, 1, 1, 1, 1,
-1.384031, 0.2621764, -3.78107, 1, 1, 1, 1, 1,
-1.37078, 1.378622, -0.5625946, 1, 1, 1, 1, 1,
-1.369271, -0.7310078, -2.081871, 1, 1, 1, 1, 1,
-1.367648, -0.802135, -2.78957, 0, 0, 1, 1, 1,
-1.365009, 0.08780693, -0.4938334, 1, 0, 0, 1, 1,
-1.363621, 0.3528114, -0.6733184, 1, 0, 0, 1, 1,
-1.363527, 0.4496447, -1.785893, 1, 0, 0, 1, 1,
-1.347679, -1.586335, -1.709203, 1, 0, 0, 1, 1,
-1.346149, 0.5578629, -1.773511, 1, 0, 0, 1, 1,
-1.337997, -0.2113398, -1.856197, 0, 0, 0, 1, 1,
-1.324687, 1.056721, -0.5303891, 0, 0, 0, 1, 1,
-1.319078, -0.9769047, -3.818334, 0, 0, 0, 1, 1,
-1.307549, 0.2281792, -3.057509, 0, 0, 0, 1, 1,
-1.303094, 1.420839, -0.6629828, 0, 0, 0, 1, 1,
-1.301488, -0.16301, -1.767494, 0, 0, 0, 1, 1,
-1.28502, 0.7513825, -1.537241, 0, 0, 0, 1, 1,
-1.283757, 1.127005, 0.1563848, 1, 1, 1, 1, 1,
-1.281823, 0.005773064, -0.5246714, 1, 1, 1, 1, 1,
-1.272718, 0.9845811, -0.9498054, 1, 1, 1, 1, 1,
-1.249852, -0.6425354, -1.417879, 1, 1, 1, 1, 1,
-1.241507, -1.210141, -2.23729, 1, 1, 1, 1, 1,
-1.239955, -2.020136, -1.257255, 1, 1, 1, 1, 1,
-1.227071, -0.2970727, -1.104805, 1, 1, 1, 1, 1,
-1.222411, 2.467301, -0.6536063, 1, 1, 1, 1, 1,
-1.21341, 2.402401, -0.03946862, 1, 1, 1, 1, 1,
-1.211093, -0.8708984, -1.412649, 1, 1, 1, 1, 1,
-1.205649, -0.6255013, -4.664487, 1, 1, 1, 1, 1,
-1.17732, 0.101483, -0.674633, 1, 1, 1, 1, 1,
-1.163951, 0.4680313, -3.246643, 1, 1, 1, 1, 1,
-1.161402, 0.04725638, -1.303836, 1, 1, 1, 1, 1,
-1.159078, 0.7376243, 0.8154858, 1, 1, 1, 1, 1,
-1.154221, 0.6495126, -2.191686, 0, 0, 1, 1, 1,
-1.153057, 1.996768, -0.3882545, 1, 0, 0, 1, 1,
-1.152451, 1.29304, 0.1492722, 1, 0, 0, 1, 1,
-1.151021, 0.7034308, -0.4239162, 1, 0, 0, 1, 1,
-1.144706, 0.1139902, -1.352949, 1, 0, 0, 1, 1,
-1.135692, 0.3857172, -3.064694, 1, 0, 0, 1, 1,
-1.133233, -0.7163042, 0.5736374, 0, 0, 0, 1, 1,
-1.132124, 0.1196552, -2.323175, 0, 0, 0, 1, 1,
-1.129557, -0.7911468, -2.96355, 0, 0, 0, 1, 1,
-1.124001, -1.4869, -2.223798, 0, 0, 0, 1, 1,
-1.119146, -1.111392, -1.959712, 0, 0, 0, 1, 1,
-1.110136, -0.8737495, -1.78443, 0, 0, 0, 1, 1,
-1.101414, 0.06599347, -2.809409, 0, 0, 0, 1, 1,
-1.100901, -1.121401, -1.952771, 1, 1, 1, 1, 1,
-1.091062, -1.703338, -2.351781, 1, 1, 1, 1, 1,
-1.086952, -0.1038579, -0.2432943, 1, 1, 1, 1, 1,
-1.082999, -0.07213832, -2.267681, 1, 1, 1, 1, 1,
-1.081504, -0.2024189, -0.4364058, 1, 1, 1, 1, 1,
-1.070439, 0.02180734, -3.778245, 1, 1, 1, 1, 1,
-1.070286, -0.336721, -2.809144, 1, 1, 1, 1, 1,
-1.058542, -0.3435571, -1.334981, 1, 1, 1, 1, 1,
-1.041592, -0.7547844, -2.219027, 1, 1, 1, 1, 1,
-1.040318, 2.312942, -0.7906901, 1, 1, 1, 1, 1,
-1.038656, 0.4903394, -3.33015, 1, 1, 1, 1, 1,
-1.03423, -0.7337847, -0.6445647, 1, 1, 1, 1, 1,
-1.026998, 1.463737, 0.5343474, 1, 1, 1, 1, 1,
-1.026228, -0.03728006, -0.03384979, 1, 1, 1, 1, 1,
-1.025258, 1.84516, -1.189464, 1, 1, 1, 1, 1,
-1.024933, 0.04626748, -1.671556, 0, 0, 1, 1, 1,
-1.023574, -0.1827931, -1.866716, 1, 0, 0, 1, 1,
-1.02049, -0.4150304, -0.753704, 1, 0, 0, 1, 1,
-1.018465, -0.2923716, -3.23712, 1, 0, 0, 1, 1,
-1.018062, -0.6881248, -1.596767, 1, 0, 0, 1, 1,
-1.013434, -1.803891, -2.169269, 1, 0, 0, 1, 1,
-1.010017, 1.048999, 0.0548805, 0, 0, 0, 1, 1,
-1.008541, 0.1896522, -1.055208, 0, 0, 0, 1, 1,
-1.000914, 1.491026, -1.504095, 0, 0, 0, 1, 1,
-0.9921655, 0.7267143, -2.813767, 0, 0, 0, 1, 1,
-0.9907178, -0.1850899, -1.092912, 0, 0, 0, 1, 1,
-0.9901803, 0.1073635, -2.55607, 0, 0, 0, 1, 1,
-0.9901019, 0.5448571, -3.135286, 0, 0, 0, 1, 1,
-0.989019, 0.3924457, -0.7852109, 1, 1, 1, 1, 1,
-0.9877619, -0.001735398, -1.89538, 1, 1, 1, 1, 1,
-0.9824646, -0.1734381, 0.01565153, 1, 1, 1, 1, 1,
-0.9717596, -0.02428582, -0.5480483, 1, 1, 1, 1, 1,
-0.970472, -0.9210542, -1.80436, 1, 1, 1, 1, 1,
-0.9695804, -1.129631, -1.091157, 1, 1, 1, 1, 1,
-0.9686868, -1.212787, -1.531986, 1, 1, 1, 1, 1,
-0.967376, -1.685995, -1.939204, 1, 1, 1, 1, 1,
-0.9667333, 1.651968, 0.3399094, 1, 1, 1, 1, 1,
-0.9525965, -1.216663, -1.542899, 1, 1, 1, 1, 1,
-0.9446302, 0.3085628, -2.334697, 1, 1, 1, 1, 1,
-0.9445842, -0.160031, -1.733576, 1, 1, 1, 1, 1,
-0.9385554, 0.1905645, -0.3961813, 1, 1, 1, 1, 1,
-0.9305663, 1.562693, 0.2032899, 1, 1, 1, 1, 1,
-0.9285161, 0.311235, -0.5397529, 1, 1, 1, 1, 1,
-0.9237381, -2.082833, -3.699753, 0, 0, 1, 1, 1,
-0.9167049, -0.8399535, -3.731902, 1, 0, 0, 1, 1,
-0.9144558, 0.000745631, -2.513162, 1, 0, 0, 1, 1,
-0.9125445, -1.642496, -1.996644, 1, 0, 0, 1, 1,
-0.9104375, 0.6089147, -0.9916782, 1, 0, 0, 1, 1,
-0.9097586, -0.8552034, -1.908259, 1, 0, 0, 1, 1,
-0.9080522, 1.85086, -2.509717, 0, 0, 0, 1, 1,
-0.9047799, -1.244763, -3.024649, 0, 0, 0, 1, 1,
-0.9045044, 0.3990034, -0.7837515, 0, 0, 0, 1, 1,
-0.9020643, 1.10096, -1.890076, 0, 0, 0, 1, 1,
-0.895918, -0.7686213, -2.763932, 0, 0, 0, 1, 1,
-0.8907415, 0.9665256, 0.2173576, 0, 0, 0, 1, 1,
-0.887565, 0.125208, -2.408242, 0, 0, 0, 1, 1,
-0.8823403, 0.8816341, -2.152762, 1, 1, 1, 1, 1,
-0.8737116, 1.486238, -2.28217, 1, 1, 1, 1, 1,
-0.8709865, 0.8946534, 0.4057149, 1, 1, 1, 1, 1,
-0.8702066, 1.144068, -2.900723, 1, 1, 1, 1, 1,
-0.8656555, -0.2402017, -1.293753, 1, 1, 1, 1, 1,
-0.8634665, 0.3711915, -0.01586222, 1, 1, 1, 1, 1,
-0.8620088, 0.498904, 0.8172482, 1, 1, 1, 1, 1,
-0.8612399, -0.7461968, -1.993019, 1, 1, 1, 1, 1,
-0.8610129, -0.0324224, -1.063756, 1, 1, 1, 1, 1,
-0.8587026, -1.39249, -0.5387057, 1, 1, 1, 1, 1,
-0.8574362, -0.08938636, -0.5777175, 1, 1, 1, 1, 1,
-0.8571549, -0.5575156, -2.588018, 1, 1, 1, 1, 1,
-0.856536, 1.236274, -1.173227, 1, 1, 1, 1, 1,
-0.8552093, 0.5607483, -1.667838, 1, 1, 1, 1, 1,
-0.8516951, -0.7871801, -1.158191, 1, 1, 1, 1, 1,
-0.8512944, 0.09788813, -0.04497943, 0, 0, 1, 1, 1,
-0.8508461, -0.5416808, -0.8213546, 1, 0, 0, 1, 1,
-0.8491023, -0.5630578, -1.867155, 1, 0, 0, 1, 1,
-0.8470407, 0.5266889, -1.19315, 1, 0, 0, 1, 1,
-0.8462127, 1.359945, 0.6117935, 1, 0, 0, 1, 1,
-0.8382654, 0.4409205, -2.915796, 1, 0, 0, 1, 1,
-0.8365567, 1.195593, -1.069995, 0, 0, 0, 1, 1,
-0.8273003, -0.3232706, -0.6383657, 0, 0, 0, 1, 1,
-0.8205568, 0.650481, -0.4778136, 0, 0, 0, 1, 1,
-0.8169326, -0.02780698, -0.9490148, 0, 0, 0, 1, 1,
-0.8153852, 2.026723, -1.883338, 0, 0, 0, 1, 1,
-0.8102024, 0.4860396, -0.3267188, 0, 0, 0, 1, 1,
-0.8021151, 0.9136899, 0.3861725, 0, 0, 0, 1, 1,
-0.8017688, 0.1474694, -1.729901, 1, 1, 1, 1, 1,
-0.7943072, -0.5061341, -2.535278, 1, 1, 1, 1, 1,
-0.790467, 0.07127828, 0.3286324, 1, 1, 1, 1, 1,
-0.7877938, 0.8017441, 1.176628, 1, 1, 1, 1, 1,
-0.7831981, -0.2841055, -0.9620771, 1, 1, 1, 1, 1,
-0.7763546, 0.2008275, -1.934457, 1, 1, 1, 1, 1,
-0.7705328, 0.4615453, -2.136981, 1, 1, 1, 1, 1,
-0.7676564, 0.1597546, -3.498723, 1, 1, 1, 1, 1,
-0.7570556, 0.2610458, -2.018958, 1, 1, 1, 1, 1,
-0.7558401, -0.4052646, -3.044988, 1, 1, 1, 1, 1,
-0.7515401, 1.478409, -0.2883253, 1, 1, 1, 1, 1,
-0.7496133, -0.5443332, -4.092507, 1, 1, 1, 1, 1,
-0.7457751, -0.6204668, -3.583803, 1, 1, 1, 1, 1,
-0.7440113, -1.491629, -2.768109, 1, 1, 1, 1, 1,
-0.7380008, -0.3107716, -0.464232, 1, 1, 1, 1, 1,
-0.7363686, 0.008430765, -0.1411705, 0, 0, 1, 1, 1,
-0.7341833, 1.452517, 0.1998559, 1, 0, 0, 1, 1,
-0.7229121, -1.725632, -3.342896, 1, 0, 0, 1, 1,
-0.7220671, -0.7733296, -3.62633, 1, 0, 0, 1, 1,
-0.7166061, -1.400024, -3.161715, 1, 0, 0, 1, 1,
-0.7158032, -0.04414542, -2.301801, 1, 0, 0, 1, 1,
-0.7133397, -0.6841654, -1.544542, 0, 0, 0, 1, 1,
-0.7103726, 1.7815, -0.4885466, 0, 0, 0, 1, 1,
-0.7091356, 0.1457822, -1.37194, 0, 0, 0, 1, 1,
-0.7052525, -1.146423, -1.016141, 0, 0, 0, 1, 1,
-0.6926643, -0.5358499, -2.79511, 0, 0, 0, 1, 1,
-0.6873805, 0.7366203, -0.1342851, 0, 0, 0, 1, 1,
-0.6832484, -1.366391, -0.9691187, 0, 0, 0, 1, 1,
-0.6773988, -0.4717839, -1.752432, 1, 1, 1, 1, 1,
-0.6702703, 0.8094902, -0.7483557, 1, 1, 1, 1, 1,
-0.6636657, -0.4301214, -1.651794, 1, 1, 1, 1, 1,
-0.6635149, -0.008083086, -1.565221, 1, 1, 1, 1, 1,
-0.6610444, 0.847874, -1.558388, 1, 1, 1, 1, 1,
-0.6589045, 0.7487238, 0.4437257, 1, 1, 1, 1, 1,
-0.6564035, 1.637577, 0.3251984, 1, 1, 1, 1, 1,
-0.6553248, -2.895178, -2.540279, 1, 1, 1, 1, 1,
-0.654458, 1.390497, -1.074293, 1, 1, 1, 1, 1,
-0.6525689, 0.5823036, 0.1820378, 1, 1, 1, 1, 1,
-0.6482382, -0.9289355, -3.334817, 1, 1, 1, 1, 1,
-0.6482223, -1.59155, -4.225395, 1, 1, 1, 1, 1,
-0.6425511, 0.7654591, -0.7525063, 1, 1, 1, 1, 1,
-0.6402563, 0.7954634, -2.391192, 1, 1, 1, 1, 1,
-0.6330872, -0.2849116, -2.988068, 1, 1, 1, 1, 1,
-0.6314226, 2.36616, -1.467515, 0, 0, 1, 1, 1,
-0.6240134, 1.769151, -2.663773, 1, 0, 0, 1, 1,
-0.6226891, -2.620843, -3.880254, 1, 0, 0, 1, 1,
-0.620527, 0.01043973, 0.1191275, 1, 0, 0, 1, 1,
-0.6154476, 0.06261837, -1.49087, 1, 0, 0, 1, 1,
-0.6147716, 1.187842, 0.1949588, 1, 0, 0, 1, 1,
-0.6121777, 0.8277701, -1.85644, 0, 0, 0, 1, 1,
-0.6090474, -1.104591, -3.115988, 0, 0, 0, 1, 1,
-0.605613, 1.097861, 0.6403004, 0, 0, 0, 1, 1,
-0.5993174, -0.07858347, -1.244278, 0, 0, 0, 1, 1,
-0.5982565, -1.356596, -3.076086, 0, 0, 0, 1, 1,
-0.5938104, -0.1669602, -2.093406, 0, 0, 0, 1, 1,
-0.5902416, -0.4755291, -2.128753, 0, 0, 0, 1, 1,
-0.5864031, -1.767599, -1.793249, 1, 1, 1, 1, 1,
-0.5859378, -0.2848699, -1.329208, 1, 1, 1, 1, 1,
-0.5812449, 1.932089, -0.4860237, 1, 1, 1, 1, 1,
-0.5789352, 0.06463479, -0.4930703, 1, 1, 1, 1, 1,
-0.5777863, -0.7459723, -3.100672, 1, 1, 1, 1, 1,
-0.5691956, -0.6260544, -3.430427, 1, 1, 1, 1, 1,
-0.5689757, -1.218161, -3.10192, 1, 1, 1, 1, 1,
-0.5624297, -0.8736755, -1.602019, 1, 1, 1, 1, 1,
-0.5593753, -1.450798, -2.822026, 1, 1, 1, 1, 1,
-0.559343, 2.277461, 0.4081179, 1, 1, 1, 1, 1,
-0.5557646, 0.4217049, -0.1215914, 1, 1, 1, 1, 1,
-0.555169, 0.1888584, -1.806934, 1, 1, 1, 1, 1,
-0.5539548, -0.4832495, -3.368265, 1, 1, 1, 1, 1,
-0.5487757, 1.275442, -0.9236344, 1, 1, 1, 1, 1,
-0.5460221, -0.368132, -1.779807, 1, 1, 1, 1, 1,
-0.5415068, -1.563456, -2.203567, 0, 0, 1, 1, 1,
-0.5414128, 0.02770736, -0.09051376, 1, 0, 0, 1, 1,
-0.5361586, 0.8171381, -1.30036, 1, 0, 0, 1, 1,
-0.5357612, -0.7950679, -2.843516, 1, 0, 0, 1, 1,
-0.5268604, 0.4261624, -0.3357137, 1, 0, 0, 1, 1,
-0.5249446, 0.7983465, -0.7394894, 1, 0, 0, 1, 1,
-0.520223, 0.4509556, -2.588589, 0, 0, 0, 1, 1,
-0.5198705, -1.007553, -2.609665, 0, 0, 0, 1, 1,
-0.519356, -0.8799698, -2.627367, 0, 0, 0, 1, 1,
-0.5182177, 1.562696, -0.4304668, 0, 0, 0, 1, 1,
-0.5177809, 0.162942, -1.200713, 0, 0, 0, 1, 1,
-0.5170822, -0.02162955, -2.168061, 0, 0, 0, 1, 1,
-0.5170664, -0.6572585, -2.669856, 0, 0, 0, 1, 1,
-0.5123258, -0.6661553, -1.869314, 1, 1, 1, 1, 1,
-0.5092926, 0.9139, -1.201648, 1, 1, 1, 1, 1,
-0.5074783, -0.2912452, -1.118832, 1, 1, 1, 1, 1,
-0.5064245, 0.5290641, 0.4950618, 1, 1, 1, 1, 1,
-0.5057051, -1.214091, -2.146677, 1, 1, 1, 1, 1,
-0.5025874, -1.608771, -2.786553, 1, 1, 1, 1, 1,
-0.498259, 1.263304, -1.177566, 1, 1, 1, 1, 1,
-0.4964214, -0.2842892, -0.6225377, 1, 1, 1, 1, 1,
-0.4954914, 0.7766654, -0.05295866, 1, 1, 1, 1, 1,
-0.4925573, -0.09727139, -2.693677, 1, 1, 1, 1, 1,
-0.4917399, 0.3629698, 0.01100247, 1, 1, 1, 1, 1,
-0.4915112, -1.198054, -3.506784, 1, 1, 1, 1, 1,
-0.486981, -0.6943914, -2.752448, 1, 1, 1, 1, 1,
-0.4844087, -0.3828455, -2.829519, 1, 1, 1, 1, 1,
-0.481251, 1.386689, 0.7064452, 1, 1, 1, 1, 1,
-0.4755064, -0.2508487, -2.604574, 0, 0, 1, 1, 1,
-0.4753721, -0.5345939, -3.004493, 1, 0, 0, 1, 1,
-0.4721983, 0.6704164, -0.8928422, 1, 0, 0, 1, 1,
-0.4718521, -0.710432, -1.439075, 1, 0, 0, 1, 1,
-0.4632645, 1.267675, -0.5482873, 1, 0, 0, 1, 1,
-0.4490916, -0.2005672, -2.076308, 1, 0, 0, 1, 1,
-0.4489211, 0.3967469, -0.2284515, 0, 0, 0, 1, 1,
-0.4462549, -0.3463079, -3.36805, 0, 0, 0, 1, 1,
-0.4396499, 0.008875801, -0.5584888, 0, 0, 0, 1, 1,
-0.4335965, 0.9592006, -0.4128432, 0, 0, 0, 1, 1,
-0.4325847, -1.877213, -3.141484, 0, 0, 0, 1, 1,
-0.4314335, -1.275153, -0.7920513, 0, 0, 0, 1, 1,
-0.4253981, -0.4165775, -2.690355, 0, 0, 0, 1, 1,
-0.4200954, -0.2986983, -4.376604, 1, 1, 1, 1, 1,
-0.4198712, 0.30891, -0.13584, 1, 1, 1, 1, 1,
-0.4169453, 1.026952, -1.080343, 1, 1, 1, 1, 1,
-0.4137478, 0.53289, 0.8565896, 1, 1, 1, 1, 1,
-0.4129503, -1.058396, -4.76461, 1, 1, 1, 1, 1,
-0.409117, -0.3067535, -1.140095, 1, 1, 1, 1, 1,
-0.4062113, -1.507262, -1.42948, 1, 1, 1, 1, 1,
-0.4060182, 1.216745, 0.1408011, 1, 1, 1, 1, 1,
-0.4046113, -0.7916455, -2.059582, 1, 1, 1, 1, 1,
-0.4036475, 1.664015, 0.8552177, 1, 1, 1, 1, 1,
-0.4008948, 0.1737873, -1.729053, 1, 1, 1, 1, 1,
-0.3998684, 0.09667656, 0.6283954, 1, 1, 1, 1, 1,
-0.3969167, -1.191106, -2.256949, 1, 1, 1, 1, 1,
-0.3966657, 0.6631715, 0.1607952, 1, 1, 1, 1, 1,
-0.3963774, -0.9942435, -2.90847, 1, 1, 1, 1, 1,
-0.3947063, 0.04361329, -1.194106, 0, 0, 1, 1, 1,
-0.3941806, 2.239977, -1.25226, 1, 0, 0, 1, 1,
-0.3922213, -0.6773578, -1.441486, 1, 0, 0, 1, 1,
-0.3896225, 0.05057817, -1.254112, 1, 0, 0, 1, 1,
-0.3891122, 0.2367894, -0.9119323, 1, 0, 0, 1, 1,
-0.3888536, -0.9860809, -4.017943, 1, 0, 0, 1, 1,
-0.3846365, 1.212973, 0.2226808, 0, 0, 0, 1, 1,
-0.3839393, -0.6876507, -3.528714, 0, 0, 0, 1, 1,
-0.3830792, -2.158331, -2.539752, 0, 0, 0, 1, 1,
-0.3810337, -1.785847, -1.837523, 0, 0, 0, 1, 1,
-0.3766235, -1.862646, -0.7021585, 0, 0, 0, 1, 1,
-0.3762676, -0.09897061, -1.94372, 0, 0, 0, 1, 1,
-0.3686207, -0.444975, -0.157432, 0, 0, 0, 1, 1,
-0.3615542, 0.844829, -2.71646, 1, 1, 1, 1, 1,
-0.3602691, 0.1442744, -0.429882, 1, 1, 1, 1, 1,
-0.3516983, 0.3776679, 0.3336771, 1, 1, 1, 1, 1,
-0.3515707, 1.037283, 1.080849, 1, 1, 1, 1, 1,
-0.350524, 0.8754774, 0.484391, 1, 1, 1, 1, 1,
-0.3474545, 2.421134, 0.1116862, 1, 1, 1, 1, 1,
-0.3467587, 0.574455, -0.1110599, 1, 1, 1, 1, 1,
-0.3464213, 1.448514, 1.405925, 1, 1, 1, 1, 1,
-0.3449283, -1.154814, -2.54325, 1, 1, 1, 1, 1,
-0.3434911, 0.3232168, -2.332416, 1, 1, 1, 1, 1,
-0.3434885, 0.03314756, -1.014586, 1, 1, 1, 1, 1,
-0.3413501, 0.5638033, -1.203307, 1, 1, 1, 1, 1,
-0.3407595, 1.035846, 0.2334431, 1, 1, 1, 1, 1,
-0.3398612, 0.8223591, 0.04722331, 1, 1, 1, 1, 1,
-0.339433, 1.512638, 1.643811, 1, 1, 1, 1, 1,
-0.338753, -0.07901714, -1.913809, 0, 0, 1, 1, 1,
-0.3372946, 0.4219556, -1.407108, 1, 0, 0, 1, 1,
-0.3343543, -0.784334, -2.442273, 1, 0, 0, 1, 1,
-0.3340059, -1.382099, -2.891717, 1, 0, 0, 1, 1,
-0.3337461, -0.1931799, -0.5985278, 1, 0, 0, 1, 1,
-0.330305, 0.1856737, -0.5917823, 1, 0, 0, 1, 1,
-0.329859, -0.2652684, -1.949823, 0, 0, 0, 1, 1,
-0.3280346, -0.8342263, -3.255765, 0, 0, 0, 1, 1,
-0.3270066, -0.6275691, -1.936496, 0, 0, 0, 1, 1,
-0.3268827, -0.5880121, -2.33986, 0, 0, 0, 1, 1,
-0.3265289, -0.873669, -3.221969, 0, 0, 0, 1, 1,
-0.3244743, 0.2369579, -0.9615118, 0, 0, 0, 1, 1,
-0.3234945, 1.828726, 1.658697, 0, 0, 0, 1, 1,
-0.3212159, 0.7275673, -0.1267907, 1, 1, 1, 1, 1,
-0.3209201, -0.4409217, -3.1946, 1, 1, 1, 1, 1,
-0.3199392, 0.5035293, -0.5428505, 1, 1, 1, 1, 1,
-0.319423, -0.2751269, -1.275784, 1, 1, 1, 1, 1,
-0.3185666, -1.64692, -3.79011, 1, 1, 1, 1, 1,
-0.3112437, -0.4473192, 0.0082307, 1, 1, 1, 1, 1,
-0.3082325, -1.447642, -3.920655, 1, 1, 1, 1, 1,
-0.3080829, 0.2246825, -3.162592, 1, 1, 1, 1, 1,
-0.3063529, -1.755897, -4.511128, 1, 1, 1, 1, 1,
-0.305695, -1.910058, -5.033413, 1, 1, 1, 1, 1,
-0.3042114, -1.951602, -3.497529, 1, 1, 1, 1, 1,
-0.3015094, -0.5898621, -1.714392, 1, 1, 1, 1, 1,
-0.2978234, -0.1453881, -0.6581579, 1, 1, 1, 1, 1,
-0.2970264, 0.8673343, 0.5892053, 1, 1, 1, 1, 1,
-0.2952671, -0.3729729, -2.591327, 1, 1, 1, 1, 1,
-0.2925867, -1.037881, -1.218459, 0, 0, 1, 1, 1,
-0.2909128, 1.392902, 1.900802, 1, 0, 0, 1, 1,
-0.2871505, -1.883606, -5.765536, 1, 0, 0, 1, 1,
-0.286796, -0.502949, -2.365331, 1, 0, 0, 1, 1,
-0.2864994, 1.261472, -1.883079, 1, 0, 0, 1, 1,
-0.2814731, 0.6783289, 0.4840259, 1, 0, 0, 1, 1,
-0.2799923, -0.3517812, -3.681179, 0, 0, 0, 1, 1,
-0.2756608, 1.236005, 0.4318891, 0, 0, 0, 1, 1,
-0.2705754, -1.011412, -4.457112, 0, 0, 0, 1, 1,
-0.27052, 1.339365, -1.846816, 0, 0, 0, 1, 1,
-0.2699849, -0.2546451, -2.385928, 0, 0, 0, 1, 1,
-0.2694322, 0.03698115, -1.411705, 0, 0, 0, 1, 1,
-0.2690359, -0.1860129, -1.76177, 0, 0, 0, 1, 1,
-0.2681538, -0.2965252, -1.951143, 1, 1, 1, 1, 1,
-0.2660379, -0.6853872, -1.426479, 1, 1, 1, 1, 1,
-0.2659927, -0.3534091, -3.371575, 1, 1, 1, 1, 1,
-0.2586384, -2.329633, -4.15051, 1, 1, 1, 1, 1,
-0.2547007, 0.2824635, -1.224747, 1, 1, 1, 1, 1,
-0.2506688, 0.3985223, 0.03052738, 1, 1, 1, 1, 1,
-0.2481651, -1.441375, -4.428225, 1, 1, 1, 1, 1,
-0.2480472, -1.184581, -4.002991, 1, 1, 1, 1, 1,
-0.2471063, -0.1743253, -1.552112, 1, 1, 1, 1, 1,
-0.2364821, 0.01236505, -0.4625939, 1, 1, 1, 1, 1,
-0.23478, -1.100762, -3.851378, 1, 1, 1, 1, 1,
-0.2334612, 0.1234368, 0.2235585, 1, 1, 1, 1, 1,
-0.2306108, -1.009527, -4.06315, 1, 1, 1, 1, 1,
-0.2300185, -1.329387, -3.211474, 1, 1, 1, 1, 1,
-0.2257676, 0.2991783, 0.1205877, 1, 1, 1, 1, 1,
-0.2233972, 0.3257287, -0.7973871, 0, 0, 1, 1, 1,
-0.2223065, 0.5224122, -1.164945, 1, 0, 0, 1, 1,
-0.2212206, -0.7396603, -1.834215, 1, 0, 0, 1, 1,
-0.2179004, -0.6900068, -3.030738, 1, 0, 0, 1, 1,
-0.2142203, 0.7513751, -1.342224, 1, 0, 0, 1, 1,
-0.2116357, -0.3069374, -0.5417329, 1, 0, 0, 1, 1,
-0.2091435, 0.7381791, -0.7789152, 0, 0, 0, 1, 1,
-0.2081799, -0.1552081, -1.157033, 0, 0, 0, 1, 1,
-0.2048544, -0.5303503, -2.074509, 0, 0, 0, 1, 1,
-0.2042008, -0.02174495, -2.070478, 0, 0, 0, 1, 1,
-0.2012367, -1.961381, -0.9882838, 0, 0, 0, 1, 1,
-0.1978436, -2.757547, -2.735502, 0, 0, 0, 1, 1,
-0.1971676, -0.002444635, -2.57011, 0, 0, 0, 1, 1,
-0.1970086, -0.5218913, -4.448962, 1, 1, 1, 1, 1,
-0.1956663, 0.9060359, -0.1288123, 1, 1, 1, 1, 1,
-0.1949384, -0.9324498, -2.896189, 1, 1, 1, 1, 1,
-0.1945387, 0.7752544, -0.5494294, 1, 1, 1, 1, 1,
-0.19006, 1.697458, 1.584203, 1, 1, 1, 1, 1,
-0.1893177, 1.805957, 0.08284266, 1, 1, 1, 1, 1,
-0.1856973, 0.5650623, -0.1401264, 1, 1, 1, 1, 1,
-0.1834138, -1.708523, -3.983973, 1, 1, 1, 1, 1,
-0.1818613, -0.3376672, -2.297084, 1, 1, 1, 1, 1,
-0.1815301, -1.432926, -2.567946, 1, 1, 1, 1, 1,
-0.1807897, 1.666822, -1.177025, 1, 1, 1, 1, 1,
-0.1747855, 0.9378306, 0.7516939, 1, 1, 1, 1, 1,
-0.1708863, 0.2072885, -0.9936057, 1, 1, 1, 1, 1,
-0.1708618, 0.01267235, -1.644443, 1, 1, 1, 1, 1,
-0.1666069, -0.407079, -3.392937, 1, 1, 1, 1, 1,
-0.1656519, -0.01449343, -2.263045, 0, 0, 1, 1, 1,
-0.1622884, 1.047632, 0.8493268, 1, 0, 0, 1, 1,
-0.1617965, 1.805518, 1.369223, 1, 0, 0, 1, 1,
-0.1614617, -2.688889, -3.502671, 1, 0, 0, 1, 1,
-0.1605807, 1.405146, 0.210062, 1, 0, 0, 1, 1,
-0.1605614, -0.4418663, -1.624116, 1, 0, 0, 1, 1,
-0.1598178, 0.1558447, -1.401972, 0, 0, 0, 1, 1,
-0.15622, -0.05700437, -1.050933, 0, 0, 0, 1, 1,
-0.1560081, -0.3314032, -2.466755, 0, 0, 0, 1, 1,
-0.154589, -1.510047, -3.526738, 0, 0, 0, 1, 1,
-0.1466014, -1.630121, -1.573827, 0, 0, 0, 1, 1,
-0.1450903, 0.296571, -0.8080708, 0, 0, 0, 1, 1,
-0.1440411, -0.1633302, -2.857, 0, 0, 0, 1, 1,
-0.1433097, -0.4462966, -3.504191, 1, 1, 1, 1, 1,
-0.1428034, -0.1245133, -1.808449, 1, 1, 1, 1, 1,
-0.142242, 1.007994, 0.1328603, 1, 1, 1, 1, 1,
-0.1376282, 2.057116, -0.6635056, 1, 1, 1, 1, 1,
-0.1338706, -0.4490854, -2.372062, 1, 1, 1, 1, 1,
-0.131792, -0.4656422, -0.3316281, 1, 1, 1, 1, 1,
-0.1307679, 2.524551, 1.289401, 1, 1, 1, 1, 1,
-0.1284566, -0.6490676, -3.683677, 1, 1, 1, 1, 1,
-0.1277321, 1.502118, 1.851227, 1, 1, 1, 1, 1,
-0.1265125, 1.262474, 0.8788223, 1, 1, 1, 1, 1,
-0.1257871, 1.776609, -1.012743, 1, 1, 1, 1, 1,
-0.1224678, 0.6807734, -2.377888, 1, 1, 1, 1, 1,
-0.1179399, -0.4681943, -2.754326, 1, 1, 1, 1, 1,
-0.1174728, -0.4132623, -3.977803, 1, 1, 1, 1, 1,
-0.1119725, -0.8837817, -2.166758, 1, 1, 1, 1, 1,
-0.1111131, 0.5553508, -0.7766855, 0, 0, 1, 1, 1,
-0.1107842, -0.9404867, -3.569477, 1, 0, 0, 1, 1,
-0.09999228, 0.7994272, -0.6228195, 1, 0, 0, 1, 1,
-0.09070367, -0.6187558, -2.087961, 1, 0, 0, 1, 1,
-0.0905893, 1.04963, -2.062669, 1, 0, 0, 1, 1,
-0.08988827, -0.9824652, -3.351001, 1, 0, 0, 1, 1,
-0.08974846, 1.026284, 0.5335515, 0, 0, 0, 1, 1,
-0.08690798, 0.3821641, -0.07446205, 0, 0, 0, 1, 1,
-0.08506338, -1.309291, -1.930505, 0, 0, 0, 1, 1,
-0.08500773, 0.9490418, -0.3265577, 0, 0, 0, 1, 1,
-0.08488756, -0.5208729, -2.236745, 0, 0, 0, 1, 1,
-0.08231123, 0.6356264, 0.8975374, 0, 0, 0, 1, 1,
-0.08109023, -0.2808683, -2.585733, 0, 0, 0, 1, 1,
-0.07998602, 2.110982, 0.7014158, 1, 1, 1, 1, 1,
-0.07551554, -0.1589317, -4.583827, 1, 1, 1, 1, 1,
-0.07541996, 1.231849, -0.835591, 1, 1, 1, 1, 1,
-0.07015073, -1.245997, -2.992016, 1, 1, 1, 1, 1,
-0.06735562, 0.2957965, -0.2839089, 1, 1, 1, 1, 1,
-0.06454363, -1.368879, -3.375719, 1, 1, 1, 1, 1,
-0.06318303, 1.602077, -2.115602, 1, 1, 1, 1, 1,
-0.06280244, -1.247429, -2.399586, 1, 1, 1, 1, 1,
-0.06237444, -0.03923485, -3.782314, 1, 1, 1, 1, 1,
-0.06150223, 0.2670456, 0.2242574, 1, 1, 1, 1, 1,
-0.05935212, 0.3782527, -1.040166, 1, 1, 1, 1, 1,
-0.05596283, 2.031583, 0.8168485, 1, 1, 1, 1, 1,
-0.05585067, -0.07511978, -0.2683626, 1, 1, 1, 1, 1,
-0.05561291, 1.010701, 1.506312, 1, 1, 1, 1, 1,
-0.05436578, 0.9947669, -0.862781, 1, 1, 1, 1, 1,
-0.05377296, 0.1951747, 0.6960465, 0, 0, 1, 1, 1,
-0.05310908, -1.078841, -3.284799, 1, 0, 0, 1, 1,
-0.04799262, 0.4175914, 0.3211172, 1, 0, 0, 1, 1,
-0.04509867, 1.291218, 0.7357571, 1, 0, 0, 1, 1,
-0.04274847, -0.4891498, -5.071488, 1, 0, 0, 1, 1,
-0.03636884, -0.8041829, -3.462162, 1, 0, 0, 1, 1,
-0.02077017, -1.011038, -2.859858, 0, 0, 0, 1, 1,
-0.01907711, 0.126645, -2.453028, 0, 0, 0, 1, 1,
-0.0184894, 1.467816, -1.617645, 0, 0, 0, 1, 1,
-0.01676318, -0.6037737, -3.303053, 0, 0, 0, 1, 1,
-0.0100441, -1.088235, -1.357082, 0, 0, 0, 1, 1,
-0.006472857, -1.59992, -4.167135, 0, 0, 0, 1, 1,
-0.003522926, 0.6092523, -0.07005557, 0, 0, 0, 1, 1,
-0.00307447, -0.7394904, -1.82806, 1, 1, 1, 1, 1,
0.004586502, 0.5025045, 1.042562, 1, 1, 1, 1, 1,
0.01166451, -0.9496667, 3.278995, 1, 1, 1, 1, 1,
0.01294255, 0.05064115, -0.2453547, 1, 1, 1, 1, 1,
0.01586027, -1.673748, 3.299571, 1, 1, 1, 1, 1,
0.01632978, -1.568159, 4.178658, 1, 1, 1, 1, 1,
0.02403674, -0.4418603, 2.562654, 1, 1, 1, 1, 1,
0.02712924, -2.093249, 4.429851, 1, 1, 1, 1, 1,
0.02812209, -1.32176, 3.51451, 1, 1, 1, 1, 1,
0.02843995, 2.486763, 1.974208, 1, 1, 1, 1, 1,
0.02923257, 0.8425032, -0.7696202, 1, 1, 1, 1, 1,
0.03048171, -0.9356893, 1.734187, 1, 1, 1, 1, 1,
0.03349771, -0.2948959, 3.728613, 1, 1, 1, 1, 1,
0.03788041, -0.2936401, 3.441407, 1, 1, 1, 1, 1,
0.03892931, 1.701266, 0.7422481, 1, 1, 1, 1, 1,
0.03983793, 1.40296, 0.2178603, 0, 0, 1, 1, 1,
0.04328803, -0.1628006, 2.19296, 1, 0, 0, 1, 1,
0.04342746, -1.122932, 1.682305, 1, 0, 0, 1, 1,
0.04480863, 0.0566031, -0.1752889, 1, 0, 0, 1, 1,
0.04989054, 0.428308, -0.8391111, 1, 0, 0, 1, 1,
0.0508921, 0.2086585, 1.035425, 1, 0, 0, 1, 1,
0.05374396, -0.5860467, 3.744177, 0, 0, 0, 1, 1,
0.05621286, 0.7684687, 0.9825541, 0, 0, 0, 1, 1,
0.05632591, 1.122606, -1.639412, 0, 0, 0, 1, 1,
0.05774382, -0.3009925, 5.017744, 0, 0, 0, 1, 1,
0.0585828, 0.3804107, -0.5931085, 0, 0, 0, 1, 1,
0.05927891, -0.6348954, 3.101988, 0, 0, 0, 1, 1,
0.05987279, 0.3972914, -1.258256, 0, 0, 0, 1, 1,
0.06343054, 1.018271, 0.5863099, 1, 1, 1, 1, 1,
0.06472059, 1.322639, 1.097556, 1, 1, 1, 1, 1,
0.06728275, 1.84645, 0.641189, 1, 1, 1, 1, 1,
0.07168001, 1.004498, 1.174808, 1, 1, 1, 1, 1,
0.07532056, -0.5620198, 1.310189, 1, 1, 1, 1, 1,
0.07609031, -0.2567738, 1.560937, 1, 1, 1, 1, 1,
0.07705329, 0.3558453, -0.3277618, 1, 1, 1, 1, 1,
0.07722042, -0.8878964, 4.434484, 1, 1, 1, 1, 1,
0.08455974, -1.386926, 3.199409, 1, 1, 1, 1, 1,
0.09365998, 0.1449668, 0.9740717, 1, 1, 1, 1, 1,
0.09474342, 0.3958748, 1.958138, 1, 1, 1, 1, 1,
0.09737957, -0.3754809, 3.081332, 1, 1, 1, 1, 1,
0.1020314, -2.079744, 2.196045, 1, 1, 1, 1, 1,
0.1020414, 1.079039, -1.883658, 1, 1, 1, 1, 1,
0.1090334, -1.034312, 2.324971, 1, 1, 1, 1, 1,
0.1144285, 0.6943042, -1.824803, 0, 0, 1, 1, 1,
0.1147867, -1.075395, -0.800188, 1, 0, 0, 1, 1,
0.1162059, -0.8623871, 4.008834, 1, 0, 0, 1, 1,
0.1170235, 0.7667996, -0.8045046, 1, 0, 0, 1, 1,
0.1186306, -1.381696, 3.313374, 1, 0, 0, 1, 1,
0.1191826, 1.893122, -0.772604, 1, 0, 0, 1, 1,
0.1196972, 0.8860351, -0.8631458, 0, 0, 0, 1, 1,
0.1203011, 2.254769, 1.470614, 0, 0, 0, 1, 1,
0.1237702, -0.6613861, 2.097152, 0, 0, 0, 1, 1,
0.1314942, 0.2232926, 0.7707582, 0, 0, 0, 1, 1,
0.1316485, 0.4191144, -0.5721444, 0, 0, 0, 1, 1,
0.1336408, 0.05874102, 0.6466303, 0, 0, 0, 1, 1,
0.1344041, 1.507592, 0.3924761, 0, 0, 0, 1, 1,
0.1370401, 0.04996751, 2.350421, 1, 1, 1, 1, 1,
0.1380949, 0.1071828, 2.150722, 1, 1, 1, 1, 1,
0.1397354, -0.7439097, 2.731673, 1, 1, 1, 1, 1,
0.1454713, -0.6246411, 3.50537, 1, 1, 1, 1, 1,
0.146453, 1.472084, 0.2479687, 1, 1, 1, 1, 1,
0.1504155, -0.006808842, 0.5361608, 1, 1, 1, 1, 1,
0.1517324, -0.6123313, 3.058945, 1, 1, 1, 1, 1,
0.1521891, -1.341631, 2.934197, 1, 1, 1, 1, 1,
0.1535498, 1.222027, -0.7912086, 1, 1, 1, 1, 1,
0.1551762, 0.2123288, -0.03594837, 1, 1, 1, 1, 1,
0.1602952, -1.178287, 3.455772, 1, 1, 1, 1, 1,
0.1627835, -0.2304725, 2.288055, 1, 1, 1, 1, 1,
0.1632942, 0.9392963, 0.4710513, 1, 1, 1, 1, 1,
0.164166, -0.506096, 1.832996, 1, 1, 1, 1, 1,
0.1642095, 0.4376409, 0.3491753, 1, 1, 1, 1, 1,
0.1677811, -0.6363198, 4.343445, 0, 0, 1, 1, 1,
0.1684432, -0.5207133, 1.292706, 1, 0, 0, 1, 1,
0.1696266, -0.3589706, 0.662844, 1, 0, 0, 1, 1,
0.1709655, 0.02698514, 1.708294, 1, 0, 0, 1, 1,
0.1714627, 1.72617, -0.0266648, 1, 0, 0, 1, 1,
0.1717288, -0.2982998, 3.273308, 1, 0, 0, 1, 1,
0.1756396, -0.01038757, 1.942241, 0, 0, 0, 1, 1,
0.1897607, -1.328378, 3.242151, 0, 0, 0, 1, 1,
0.1900909, -0.3007307, 3.272826, 0, 0, 0, 1, 1,
0.1964514, 2.081149, 0.9999533, 0, 0, 0, 1, 1,
0.1977522, -0.4502701, 3.834064, 0, 0, 0, 1, 1,
0.1979418, 0.6536408, -0.1307282, 0, 0, 0, 1, 1,
0.198547, 0.2168386, -0.5191728, 0, 0, 0, 1, 1,
0.2036825, -0.6133431, 1.675699, 1, 1, 1, 1, 1,
0.2053572, -0.2427708, 1.950784, 1, 1, 1, 1, 1,
0.2059663, -0.5529949, 2.39336, 1, 1, 1, 1, 1,
0.2131326, 1.294829, -1.302513, 1, 1, 1, 1, 1,
0.2191208, 0.5402799, 0.9669048, 1, 1, 1, 1, 1,
0.2208367, -1.390674, 3.033179, 1, 1, 1, 1, 1,
0.2215949, -1.785584, 3.277029, 1, 1, 1, 1, 1,
0.2265212, -0.2118902, 3.462247, 1, 1, 1, 1, 1,
0.2276465, -0.5184829, 2.910303, 1, 1, 1, 1, 1,
0.2282719, 0.2612296, -0.459305, 1, 1, 1, 1, 1,
0.2291142, 0.9862924, 1.175786, 1, 1, 1, 1, 1,
0.2318075, -2.074335, 0.9147425, 1, 1, 1, 1, 1,
0.2323368, -1.802413, 2.329501, 1, 1, 1, 1, 1,
0.2334349, -0.5549214, 1.497925, 1, 1, 1, 1, 1,
0.2378177, -0.06342147, 1.425342, 1, 1, 1, 1, 1,
0.2380704, 0.1522643, 1.751025, 0, 0, 1, 1, 1,
0.2420388, 2.016103, -0.2993144, 1, 0, 0, 1, 1,
0.2432767, -0.2064053, 3.052331, 1, 0, 0, 1, 1,
0.2450719, -0.4434544, 3.908876, 1, 0, 0, 1, 1,
0.2483002, 0.1388486, -0.05518956, 1, 0, 0, 1, 1,
0.2542004, 0.1734707, 1.82129, 1, 0, 0, 1, 1,
0.2543927, 0.2819315, 0.5305871, 0, 0, 0, 1, 1,
0.2546162, 0.4780436, 0.9985011, 0, 0, 0, 1, 1,
0.2583977, 0.4482703, 0.5131236, 0, 0, 0, 1, 1,
0.2607762, 0.6981183, -0.613583, 0, 0, 0, 1, 1,
0.2656151, 2.169335, -0.4366064, 0, 0, 0, 1, 1,
0.2669738, -0.2323098, 4.009881, 0, 0, 0, 1, 1,
0.2694897, 1.091959, 1.133306, 0, 0, 0, 1, 1,
0.2713534, -1.94886, 3.148968, 1, 1, 1, 1, 1,
0.2730046, -0.7837534, 3.011862, 1, 1, 1, 1, 1,
0.2763194, -0.2469782, 3.396234, 1, 1, 1, 1, 1,
0.2769231, 0.5261493, 2.948355, 1, 1, 1, 1, 1,
0.292786, -0.6145011, 3.487723, 1, 1, 1, 1, 1,
0.2987042, -0.9227858, 1.903335, 1, 1, 1, 1, 1,
0.2988008, -1.357081, 0.7220404, 1, 1, 1, 1, 1,
0.2999124, 1.633328, 1.221154, 1, 1, 1, 1, 1,
0.3002697, -2.949189, 4.227004, 1, 1, 1, 1, 1,
0.303846, -1.422696, 4.198145, 1, 1, 1, 1, 1,
0.3103994, 0.02690272, 2.713955, 1, 1, 1, 1, 1,
0.3125765, 0.2688385, -0.4068618, 1, 1, 1, 1, 1,
0.3183284, 0.1673808, 1.132125, 1, 1, 1, 1, 1,
0.3237353, -0.06903472, 2.480438, 1, 1, 1, 1, 1,
0.3280277, 0.9332353, 1.413709, 1, 1, 1, 1, 1,
0.3280379, 0.849012, 0.03143178, 0, 0, 1, 1, 1,
0.3290236, -0.4527102, 2.229325, 1, 0, 0, 1, 1,
0.3315022, 0.8281009, 0.0552332, 1, 0, 0, 1, 1,
0.3328706, -1.879528, 2.821605, 1, 0, 0, 1, 1,
0.3335021, 0.7682047, -0.8584433, 1, 0, 0, 1, 1,
0.3347054, -0.9212168, 1.243107, 1, 0, 0, 1, 1,
0.3363622, 1.317186, 0.3003231, 0, 0, 0, 1, 1,
0.3387171, 0.09233162, 2.158328, 0, 0, 0, 1, 1,
0.3410996, -1.881414, 4.170074, 0, 0, 0, 1, 1,
0.3418573, -1.599095, 3.528649, 0, 0, 0, 1, 1,
0.3446856, 0.1231209, 1.999047, 0, 0, 0, 1, 1,
0.3545925, -0.6183026, 1.974681, 0, 0, 0, 1, 1,
0.3554999, -0.4343882, 2.951279, 0, 0, 0, 1, 1,
0.3609621, 0.811698, 0.208216, 1, 1, 1, 1, 1,
0.3677903, 0.3911554, 0.7138693, 1, 1, 1, 1, 1,
0.3684157, 0.05956522, 2.088741, 1, 1, 1, 1, 1,
0.3684761, -0.2054948, 2.600756, 1, 1, 1, 1, 1,
0.3705699, -2.122942, 1.281369, 1, 1, 1, 1, 1,
0.3710766, 0.6756238, 1.926134, 1, 1, 1, 1, 1,
0.3719084, -0.3555587, 3.312587, 1, 1, 1, 1, 1,
0.3720098, -0.1885696, 3.502288, 1, 1, 1, 1, 1,
0.3738065, 0.6098327, 0.01806138, 1, 1, 1, 1, 1,
0.3818793, -1.401258, 3.428964, 1, 1, 1, 1, 1,
0.3834133, -0.7349153, 3.034532, 1, 1, 1, 1, 1,
0.3946258, -1.1902, 3.040875, 1, 1, 1, 1, 1,
0.3972569, -0.9425777, 3.561361, 1, 1, 1, 1, 1,
0.4049473, -0.6257501, 2.586111, 1, 1, 1, 1, 1,
0.4056683, 1.613344, -0.5513844, 1, 1, 1, 1, 1,
0.4079804, -1.123548, 5.443467, 0, 0, 1, 1, 1,
0.4160001, -0.2291014, 1.543571, 1, 0, 0, 1, 1,
0.4167147, 1.9121, -0.2208567, 1, 0, 0, 1, 1,
0.4213605, -0.003982512, 2.061196, 1, 0, 0, 1, 1,
0.423415, 0.6661617, 1.297395, 1, 0, 0, 1, 1,
0.4267234, 0.05278032, 2.215573, 1, 0, 0, 1, 1,
0.4270385, -1.234952, 2.879273, 0, 0, 0, 1, 1,
0.4326336, -2.510196, 2.859478, 0, 0, 0, 1, 1,
0.4326461, -0.6103047, 1.845967, 0, 0, 0, 1, 1,
0.4327455, 0.597274, 1.968564, 0, 0, 0, 1, 1,
0.4376896, 0.303629, 0.462115, 0, 0, 0, 1, 1,
0.4434198, -1.211443, 3.251936, 0, 0, 0, 1, 1,
0.4438984, 0.1418394, 3.021903, 0, 0, 0, 1, 1,
0.4473349, -1.750501, 3.455114, 1, 1, 1, 1, 1,
0.4542138, 0.4385231, -0.06310345, 1, 1, 1, 1, 1,
0.455365, 0.8325005, 1.894307, 1, 1, 1, 1, 1,
0.458762, 0.8369536, 0.2739117, 1, 1, 1, 1, 1,
0.4596103, 0.7806216, 0.9555154, 1, 1, 1, 1, 1,
0.4630678, 2.145929, -0.9309096, 1, 1, 1, 1, 1,
0.4632098, 0.8611857, 1.284867, 1, 1, 1, 1, 1,
0.4667719, -1.143908, 2.754074, 1, 1, 1, 1, 1,
0.4677612, 0.6356061, -1.598907, 1, 1, 1, 1, 1,
0.4687348, -1.031833, 1.650942, 1, 1, 1, 1, 1,
0.4715215, 0.06144294, 1.841763, 1, 1, 1, 1, 1,
0.4715747, 0.7364914, 0.4021313, 1, 1, 1, 1, 1,
0.4717645, -0.1224747, 1.414941, 1, 1, 1, 1, 1,
0.4754724, 1.003603, 1.878773, 1, 1, 1, 1, 1,
0.4787321, -0.8346553, 2.185993, 1, 1, 1, 1, 1,
0.4796571, -0.1392608, 0.8288903, 0, 0, 1, 1, 1,
0.4825324, 0.2919963, -0.6485085, 1, 0, 0, 1, 1,
0.4827574, 0.4544469, 1.531935, 1, 0, 0, 1, 1,
0.4935437, 0.1328361, 2.442192, 1, 0, 0, 1, 1,
0.4939999, 0.7759919, 1.014279, 1, 0, 0, 1, 1,
0.4975571, 0.4641022, -0.2426337, 1, 0, 0, 1, 1,
0.4988057, -1.079256, 4.936332, 0, 0, 0, 1, 1,
0.5003057, 1.025524, 1.885288, 0, 0, 0, 1, 1,
0.5076393, -0.2924383, 4.328584, 0, 0, 0, 1, 1,
0.5079541, 0.9401687, 1.127138, 0, 0, 0, 1, 1,
0.5171342, -0.4114682, 2.566685, 0, 0, 0, 1, 1,
0.5197655, -0.4823096, 2.80507, 0, 0, 0, 1, 1,
0.5216593, 0.2413076, 1.634547, 0, 0, 0, 1, 1,
0.5218478, 1.143389, 0.3414723, 1, 1, 1, 1, 1,
0.5257586, 2.15562, 1.783388, 1, 1, 1, 1, 1,
0.5295848, 1.163042, 1.206519, 1, 1, 1, 1, 1,
0.5339913, -1.195902, 1.708298, 1, 1, 1, 1, 1,
0.534869, -1.20161, 1.504301, 1, 1, 1, 1, 1,
0.5396678, 0.02951284, -0.3882787, 1, 1, 1, 1, 1,
0.5411024, 0.3382733, 0.8644285, 1, 1, 1, 1, 1,
0.5429766, 0.8746801, 1.502869, 1, 1, 1, 1, 1,
0.5435355, -0.8125421, 0.8555222, 1, 1, 1, 1, 1,
0.5450156, 0.7325108, -0.720215, 1, 1, 1, 1, 1,
0.5466638, 0.4147839, -0.3314376, 1, 1, 1, 1, 1,
0.5495561, 0.743969, 1.742812, 1, 1, 1, 1, 1,
0.5499646, 0.5935782, 2.723775, 1, 1, 1, 1, 1,
0.5512813, -1.349971, 3.245921, 1, 1, 1, 1, 1,
0.552157, -1.322374, 3.374254, 1, 1, 1, 1, 1,
0.5548164, 0.2331091, 2.35695, 0, 0, 1, 1, 1,
0.5578751, 0.226145, 2.807924, 1, 0, 0, 1, 1,
0.5589048, 0.8161713, 0.591507, 1, 0, 0, 1, 1,
0.5628152, 0.05429271, 0.2447059, 1, 0, 0, 1, 1,
0.5660052, 1.401353, 0.5612941, 1, 0, 0, 1, 1,
0.5743972, -0.377246, 1.874459, 1, 0, 0, 1, 1,
0.5818111, 1.350898, 3.015674, 0, 0, 0, 1, 1,
0.5869529, -1.275015, 2.847298, 0, 0, 0, 1, 1,
0.5957418, 0.03519582, 2.020261, 0, 0, 0, 1, 1,
0.5980781, -2.670068, 1.841296, 0, 0, 0, 1, 1,
0.6035061, 1.161775, 1.083769, 0, 0, 0, 1, 1,
0.6044335, -0.6478193, 3.394576, 0, 0, 0, 1, 1,
0.6054188, -0.9052534, 4.586893, 0, 0, 0, 1, 1,
0.6054912, -1.051999, 2.892232, 1, 1, 1, 1, 1,
0.6076704, -0.1730131, 2.658579, 1, 1, 1, 1, 1,
0.6178517, 0.2552249, 1.978938, 1, 1, 1, 1, 1,
0.6189259, 0.6762177, -0.05952577, 1, 1, 1, 1, 1,
0.6271763, -0.3801475, 2.089982, 1, 1, 1, 1, 1,
0.6283974, 0.2559889, 0.5779431, 1, 1, 1, 1, 1,
0.6305234, 0.6648884, 0.4489572, 1, 1, 1, 1, 1,
0.6337656, -0.9096177, 1.76404, 1, 1, 1, 1, 1,
0.6345516, -0.1532074, 0.4827097, 1, 1, 1, 1, 1,
0.6348031, -0.2343614, 0.5807805, 1, 1, 1, 1, 1,
0.6353495, 2.009644, 0.4432767, 1, 1, 1, 1, 1,
0.6461077, -0.2275113, 2.714215, 1, 1, 1, 1, 1,
0.6474479, -0.1074836, -0.08054101, 1, 1, 1, 1, 1,
0.6486362, 0.6330641, 0.3682142, 1, 1, 1, 1, 1,
0.6524351, -0.5590429, 1.806447, 1, 1, 1, 1, 1,
0.6531253, -1.543048, 3.737639, 0, 0, 1, 1, 1,
0.6545162, 0.3991266, 0.3668191, 1, 0, 0, 1, 1,
0.6605108, -0.7682241, 2.085763, 1, 0, 0, 1, 1,
0.6660284, 0.3219815, -1.613239, 1, 0, 0, 1, 1,
0.6668314, 0.2202963, -0.674644, 1, 0, 0, 1, 1,
0.666954, 0.8407188, 1.292353, 1, 0, 0, 1, 1,
0.6675449, 0.6893723, 2.031469, 0, 0, 0, 1, 1,
0.6700345, -1.611844, 2.433552, 0, 0, 0, 1, 1,
0.670305, 0.8089049, 1.921141, 0, 0, 0, 1, 1,
0.6838279, -0.0776832, 2.756877, 0, 0, 0, 1, 1,
0.6896101, -0.4522644, 3.6574, 0, 0, 0, 1, 1,
0.6943159, 1.006666, 1.768682, 0, 0, 0, 1, 1,
0.6972731, -1.056823, 2.985727, 0, 0, 0, 1, 1,
0.6982836, -1.3807, 2.364082, 1, 1, 1, 1, 1,
0.7006889, -0.5140727, 2.700996, 1, 1, 1, 1, 1,
0.71123, 1.945677, -0.02386539, 1, 1, 1, 1, 1,
0.7240665, -0.6492604, 4.879244, 1, 1, 1, 1, 1,
0.7241837, 1.00382, -0.003040303, 1, 1, 1, 1, 1,
0.7249404, 0.002415928, 0.480848, 1, 1, 1, 1, 1,
0.7268983, -0.5544152, 2.119916, 1, 1, 1, 1, 1,
0.7291388, -0.4440966, -0.1366777, 1, 1, 1, 1, 1,
0.7300447, 0.6384132, -0.7038163, 1, 1, 1, 1, 1,
0.733148, 0.578352, -1.371368, 1, 1, 1, 1, 1,
0.7353176, -1.357813, 0.08933803, 1, 1, 1, 1, 1,
0.7426908, 0.3149247, 3.26695, 1, 1, 1, 1, 1,
0.7495138, -0.2636402, 1.488453, 1, 1, 1, 1, 1,
0.7606891, -0.08322652, 1.176797, 1, 1, 1, 1, 1,
0.7670836, 0.1957697, 0.5100185, 1, 1, 1, 1, 1,
0.7714369, 0.06586577, 2.470305, 0, 0, 1, 1, 1,
0.7716295, -0.1570527, 1.659142, 1, 0, 0, 1, 1,
0.7738765, -0.8834197, 2.392294, 1, 0, 0, 1, 1,
0.7739815, 0.7459188, -0.9064993, 1, 0, 0, 1, 1,
0.7810895, 0.4040814, 1.481119, 1, 0, 0, 1, 1,
0.8037391, 0.2196499, 1.575377, 1, 0, 0, 1, 1,
0.8079636, 0.4832249, 2.058273, 0, 0, 0, 1, 1,
0.808079, -3.064514, 4.00787, 0, 0, 0, 1, 1,
0.8080793, -0.6440323, 0.4964443, 0, 0, 0, 1, 1,
0.808826, 0.04134801, 0.5211981, 0, 0, 0, 1, 1,
0.809437, 1.80697, -0.2461812, 0, 0, 0, 1, 1,
0.8152248, -0.198467, 2.305173, 0, 0, 0, 1, 1,
0.8153874, -2.574282, 4.245421, 0, 0, 0, 1, 1,
0.8163633, -0.05014066, 0.3840981, 1, 1, 1, 1, 1,
0.8254176, -0.5147527, 1.410026, 1, 1, 1, 1, 1,
0.8262949, 1.4416, -0.5289975, 1, 1, 1, 1, 1,
0.8320123, 0.4120851, 1.56746, 1, 1, 1, 1, 1,
0.8322781, -0.1951678, 0.2404239, 1, 1, 1, 1, 1,
0.8336723, -0.6793575, 3.693613, 1, 1, 1, 1, 1,
0.8389587, 0.9618059, -0.0785649, 1, 1, 1, 1, 1,
0.84052, -0.6619217, 2.739835, 1, 1, 1, 1, 1,
0.8562518, -1.284412, 2.188299, 1, 1, 1, 1, 1,
0.8603796, 0.1534353, 2.448304, 1, 1, 1, 1, 1,
0.8650539, -0.6540759, 2.252072, 1, 1, 1, 1, 1,
0.8655214, 1.479191, 1.651551, 1, 1, 1, 1, 1,
0.8670831, 1.367063, 0.3214001, 1, 1, 1, 1, 1,
0.8700485, -1.073072, 2.153693, 1, 1, 1, 1, 1,
0.8765733, -2.463184, 2.812715, 1, 1, 1, 1, 1,
0.8777559, -0.1746645, 0.3044844, 0, 0, 1, 1, 1,
0.8780577, 0.4183306, 1.77133, 1, 0, 0, 1, 1,
0.8796727, -0.799571, 2.268406, 1, 0, 0, 1, 1,
0.8799911, 1.752423, 0.9581688, 1, 0, 0, 1, 1,
0.8833714, 0.2384462, -0.5971357, 1, 0, 0, 1, 1,
0.8852024, 1.037072, 1.087905, 1, 0, 0, 1, 1,
0.8958464, 1.239849, 2.563433, 0, 0, 0, 1, 1,
0.9005048, 0.9912244, 1.602807, 0, 0, 0, 1, 1,
0.9006158, 0.2882726, 0.2739833, 0, 0, 0, 1, 1,
0.9021984, 1.243774, -0.01867972, 0, 0, 0, 1, 1,
0.9027292, -0.6628757, 0.5653979, 0, 0, 0, 1, 1,
0.9060248, -0.5624276, 2.823765, 0, 0, 0, 1, 1,
0.9060954, 0.8174096, 2.906712, 0, 0, 0, 1, 1,
0.9098044, 1.312034, 1.268345, 1, 1, 1, 1, 1,
0.9113465, 0.6326726, 2.260929, 1, 1, 1, 1, 1,
0.9163896, -0.5280841, 2.044176, 1, 1, 1, 1, 1,
0.9194345, -0.4581786, 3.066277, 1, 1, 1, 1, 1,
0.9268213, -1.205039, 2.584887, 1, 1, 1, 1, 1,
0.9358403, -1.034634, 3.671638, 1, 1, 1, 1, 1,
0.9449361, 1.609601, 0.0966327, 1, 1, 1, 1, 1,
0.9457209, 0.3518226, 1.535074, 1, 1, 1, 1, 1,
0.9549815, -0.3202884, 1.93292, 1, 1, 1, 1, 1,
0.9556085, 0.1997363, 2.715321, 1, 1, 1, 1, 1,
0.9567265, 0.6159888, 1.12714, 1, 1, 1, 1, 1,
0.9571765, -0.2778003, 1.024835, 1, 1, 1, 1, 1,
0.9632225, -0.839554, 2.521244, 1, 1, 1, 1, 1,
0.9662923, -0.4384164, 2.557086, 1, 1, 1, 1, 1,
0.971129, 0.5390275, 1.410105, 1, 1, 1, 1, 1,
0.9737342, 1.415859, -2.118047, 0, 0, 1, 1, 1,
0.9781733, -0.3997864, 2.669574, 1, 0, 0, 1, 1,
0.9789089, -0.07756136, -0.1501155, 1, 0, 0, 1, 1,
0.9803514, -1.506294, 3.858085, 1, 0, 0, 1, 1,
0.9824046, -0.2329866, 1.405505, 1, 0, 0, 1, 1,
0.9903594, 0.62409, -0.8557872, 1, 0, 0, 1, 1,
0.9924366, -2.239595, 0.3742646, 0, 0, 0, 1, 1,
1.00089, -0.1206519, 3.329237, 0, 0, 0, 1, 1,
1.002248, 0.5200762, 1.094429, 0, 0, 0, 1, 1,
1.014219, 0.007179923, 2.638093, 0, 0, 0, 1, 1,
1.014594, -0.3129074, 2.913801, 0, 0, 0, 1, 1,
1.014957, 0.6852031, 0.4227224, 0, 0, 0, 1, 1,
1.019022, 0.5894742, 2.726624, 0, 0, 0, 1, 1,
1.020561, -0.908134, 3.680081, 1, 1, 1, 1, 1,
1.024947, -1.577869, 1.375086, 1, 1, 1, 1, 1,
1.02533, 2.022893, 1.032146, 1, 1, 1, 1, 1,
1.038087, -0.4484932, 1.739683, 1, 1, 1, 1, 1,
1.04266, 1.168486, -0.7240081, 1, 1, 1, 1, 1,
1.04659, -0.283665, 2.245187, 1, 1, 1, 1, 1,
1.054535, 0.3582253, 2.770459, 1, 1, 1, 1, 1,
1.056922, 0.6759539, 0.7542869, 1, 1, 1, 1, 1,
1.060488, -0.9820209, 2.280761, 1, 1, 1, 1, 1,
1.063468, 1.51954, -1.614702, 1, 1, 1, 1, 1,
1.065223, 0.1991165, 1.271821, 1, 1, 1, 1, 1,
1.075415, 0.5592657, 2.961539, 1, 1, 1, 1, 1,
1.077664, -0.4751184, 2.324613, 1, 1, 1, 1, 1,
1.082821, -0.6273904, 1.817736, 1, 1, 1, 1, 1,
1.085214, 1.695879, 0.6674245, 1, 1, 1, 1, 1,
1.094357, -0.1489391, 1.405993, 0, 0, 1, 1, 1,
1.095856, 1.916325, 2.223428, 1, 0, 0, 1, 1,
1.096217, 0.4889771, 1.034897, 1, 0, 0, 1, 1,
1.096866, -1.757695, 3.029937, 1, 0, 0, 1, 1,
1.10488, 0.4150455, 0.6369057, 1, 0, 0, 1, 1,
1.117283, -1.483586, 3.896799, 1, 0, 0, 1, 1,
1.121975, -0.398851, 2.960012, 0, 0, 0, 1, 1,
1.130138, -1.026748, 2.042589, 0, 0, 0, 1, 1,
1.131666, -0.7417386, 2.851356, 0, 0, 0, 1, 1,
1.137561, 1.44314, 1.038918, 0, 0, 0, 1, 1,
1.153976, 0.475176, 0.5952756, 0, 0, 0, 1, 1,
1.154994, 0.1688198, 1.362419, 0, 0, 0, 1, 1,
1.155344, 1.215554, 0.6195726, 0, 0, 0, 1, 1,
1.155631, -0.2228163, 1.916353, 1, 1, 1, 1, 1,
1.175428, -0.06554384, 1.501175, 1, 1, 1, 1, 1,
1.177016, 0.223144, 1.415165, 1, 1, 1, 1, 1,
1.177816, 0.917172, -1.421236, 1, 1, 1, 1, 1,
1.179769, 0.0837358, 1.304035, 1, 1, 1, 1, 1,
1.180923, 2.101654, 1.322248, 1, 1, 1, 1, 1,
1.183346, 0.2716142, 0.9935688, 1, 1, 1, 1, 1,
1.206772, 0.6568521, -0.3208345, 1, 1, 1, 1, 1,
1.209366, 1.265527, 1.479719, 1, 1, 1, 1, 1,
1.211379, -1.847466, 3.250434, 1, 1, 1, 1, 1,
1.218888, 0.2709782, 0.694925, 1, 1, 1, 1, 1,
1.219079, 0.0122708, 2.030311, 1, 1, 1, 1, 1,
1.22599, 0.8755271, -1.135623, 1, 1, 1, 1, 1,
1.228834, -1.415476, 2.840582, 1, 1, 1, 1, 1,
1.238037, -1.288424, 2.248239, 1, 1, 1, 1, 1,
1.238176, -0.6414247, 2.134178, 0, 0, 1, 1, 1,
1.2475, -0.9325578, 1.868505, 1, 0, 0, 1, 1,
1.253621, -1.292256, 2.889961, 1, 0, 0, 1, 1,
1.255279, -0.5694411, 1.067954, 1, 0, 0, 1, 1,
1.256368, -2.308006, 4.801853, 1, 0, 0, 1, 1,
1.258353, 0.539915, 2.360253, 1, 0, 0, 1, 1,
1.263927, -1.719583, 1.960128, 0, 0, 0, 1, 1,
1.264553, -1.20723, 3.152042, 0, 0, 0, 1, 1,
1.276877, -0.5496647, 1.051043, 0, 0, 0, 1, 1,
1.281245, -0.7063671, 3.24429, 0, 0, 0, 1, 1,
1.281292, 1.419255, 0.8783773, 0, 0, 0, 1, 1,
1.283255, 1.098794, -0.03918171, 0, 0, 0, 1, 1,
1.284499, -1.175924, 1.820873, 0, 0, 0, 1, 1,
1.284977, -1.000079, 0.6713941, 1, 1, 1, 1, 1,
1.288566, -0.9322497, 2.99507, 1, 1, 1, 1, 1,
1.299586, -0.6071889, 1.446751, 1, 1, 1, 1, 1,
1.300905, 0.151573, 1.363646, 1, 1, 1, 1, 1,
1.301689, -0.1732896, 3.006221, 1, 1, 1, 1, 1,
1.307694, 1.436617, 1.835182, 1, 1, 1, 1, 1,
1.313352, -3.057405, 3.038335, 1, 1, 1, 1, 1,
1.324363, -1.027686, 2.837622, 1, 1, 1, 1, 1,
1.324707, -0.7657869, 3.436002, 1, 1, 1, 1, 1,
1.326716, -1.067178, 1.455627, 1, 1, 1, 1, 1,
1.329687, 0.448565, 1.038404, 1, 1, 1, 1, 1,
1.335199, -0.7482753, 1.759215, 1, 1, 1, 1, 1,
1.338972, -0.7296663, 0.7933663, 1, 1, 1, 1, 1,
1.341722, -0.4926755, 1.163642, 1, 1, 1, 1, 1,
1.344675, 0.8955151, 1.187685, 1, 1, 1, 1, 1,
1.350728, -0.4946677, 2.367369, 0, 0, 1, 1, 1,
1.354266, 1.063929, 2.444469, 1, 0, 0, 1, 1,
1.364515, 0.2454799, 1.641857, 1, 0, 0, 1, 1,
1.385716, -0.4709973, 2.244494, 1, 0, 0, 1, 1,
1.390129, -0.4015728, 2.619261, 1, 0, 0, 1, 1,
1.429228, -0.31837, 1.462343, 1, 0, 0, 1, 1,
1.439196, -0.01027592, 0.2208779, 0, 0, 0, 1, 1,
1.443929, 1.125865, 1.879122, 0, 0, 0, 1, 1,
1.450429, -0.2942805, 4.294028, 0, 0, 0, 1, 1,
1.452145, -1.279798, 2.996156, 0, 0, 0, 1, 1,
1.454659, 0.4511796, 1.606684, 0, 0, 0, 1, 1,
1.456506, -0.7080864, 2.43799, 0, 0, 0, 1, 1,
1.480851, 0.8094584, 1.984952, 0, 0, 0, 1, 1,
1.490649, -1.478532, 3.021239, 1, 1, 1, 1, 1,
1.491632, -1.978826, 0.7769248, 1, 1, 1, 1, 1,
1.496564, 0.01685268, 1.268551, 1, 1, 1, 1, 1,
1.499357, -0.3691734, 0.1256574, 1, 1, 1, 1, 1,
1.514302, -1.310974, 3.656384, 1, 1, 1, 1, 1,
1.518142, 1.076896, -0.5199994, 1, 1, 1, 1, 1,
1.524671, -0.818698, 0.775715, 1, 1, 1, 1, 1,
1.534141, 0.343216, 1.121562, 1, 1, 1, 1, 1,
1.534147, 0.08669233, 0.01602111, 1, 1, 1, 1, 1,
1.535385, -0.8864734, 2.15465, 1, 1, 1, 1, 1,
1.544144, 1.59784, 0.2195161, 1, 1, 1, 1, 1,
1.565212, -1.16449, 2.042803, 1, 1, 1, 1, 1,
1.573544, -0.4670256, 2.177523, 1, 1, 1, 1, 1,
1.581105, 0.01543559, 1.549407, 1, 1, 1, 1, 1,
1.584912, -0.6387398, 0.9237627, 1, 1, 1, 1, 1,
1.585732, -0.1131688, 0.795175, 0, 0, 1, 1, 1,
1.586147, 1.316649, 0.7898482, 1, 0, 0, 1, 1,
1.591116, -0.2244591, 2.31073, 1, 0, 0, 1, 1,
1.603992, 1.416005, -0.09223662, 1, 0, 0, 1, 1,
1.613727, 1.036263, 2.223008, 1, 0, 0, 1, 1,
1.622864, 0.5809138, 1.78626, 1, 0, 0, 1, 1,
1.627408, 0.9950299, 0.6594183, 0, 0, 0, 1, 1,
1.635314, 0.1744698, -0.07435552, 0, 0, 0, 1, 1,
1.636664, -1.80162, 1.76602, 0, 0, 0, 1, 1,
1.640905, 0.3502671, 1.39103, 0, 0, 0, 1, 1,
1.651461, -0.5012216, 0.02933721, 0, 0, 0, 1, 1,
1.688807, 1.783753, 3.246262, 0, 0, 0, 1, 1,
1.702339, -0.1735948, 1.772267, 0, 0, 0, 1, 1,
1.717148, -1.810007, -0.1121766, 1, 1, 1, 1, 1,
1.75545, 1.008464, 2.747787, 1, 1, 1, 1, 1,
1.769722, 0.775826, -1.073877, 1, 1, 1, 1, 1,
1.819455, -0.3662026, 2.21058, 1, 1, 1, 1, 1,
1.834924, -0.9425189, 2.471277, 1, 1, 1, 1, 1,
1.868859, -0.334276, 4.364128, 1, 1, 1, 1, 1,
1.885187, -0.702563, 1.538657, 1, 1, 1, 1, 1,
1.910638, 1.030101, 0.4568055, 1, 1, 1, 1, 1,
1.930887, -0.05937555, 1.199339, 1, 1, 1, 1, 1,
1.959589, 1.689928, -0.3349082, 1, 1, 1, 1, 1,
1.991539, -0.649433, 2.702488, 1, 1, 1, 1, 1,
1.99184, 1.032363, 1.593465, 1, 1, 1, 1, 1,
2.00407, -1.426955, 3.19192, 1, 1, 1, 1, 1,
2.018889, -0.5461548, 0.9210711, 1, 1, 1, 1, 1,
2.019174, -0.7897823, 4.299973, 1, 1, 1, 1, 1,
2.053757, -0.1102801, 0.6649293, 0, 0, 1, 1, 1,
2.117001, -0.4077774, -1.137131, 1, 0, 0, 1, 1,
2.201123, -0.3043495, 1.123679, 1, 0, 0, 1, 1,
2.209855, 1.357629, 1.741908, 1, 0, 0, 1, 1,
2.274999, 0.6716861, 1.731418, 1, 0, 0, 1, 1,
2.30532, 0.8928184, 2.43672, 1, 0, 0, 1, 1,
2.327374, -0.4122626, 1.8347, 0, 0, 0, 1, 1,
2.331329, -0.7263374, 2.531262, 0, 0, 0, 1, 1,
2.347343, -0.8191568, 2.272165, 0, 0, 0, 1, 1,
2.363435, -1.268389, 1.922638, 0, 0, 0, 1, 1,
2.4342, -1.81037, 3.69137, 0, 0, 0, 1, 1,
2.456168, 0.8286216, 1.065739, 0, 0, 0, 1, 1,
2.476505, 1.116776, 0.7521227, 0, 0, 0, 1, 1,
2.509341, 1.16326, 0.8709121, 1, 1, 1, 1, 1,
2.549127, -0.9714085, 3.034252, 1, 1, 1, 1, 1,
2.685834, -0.8141667, 1.765119, 1, 1, 1, 1, 1,
2.833177, 1.718162, 0.8270923, 1, 1, 1, 1, 1,
3.059808, 0.2115584, 0.3439516, 1, 1, 1, 1, 1,
3.343915, 0.6060606, 0.8968759, 1, 1, 1, 1, 1,
3.419213, 1.653792, 2.359966, 1, 1, 1, 1, 1
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
var radius = 9.794948;
var distance = 34.40434;
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
mvMatrix.translate( 0.1929634, 0.2699815, 0.1610346 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.40434);
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