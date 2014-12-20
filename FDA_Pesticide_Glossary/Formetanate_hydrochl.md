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
-3.357099, 0.4667026, -1.732335, 1, 0, 0, 1,
-3.102603, 1.946422, -0.9581221, 1, 0.007843138, 0, 1,
-2.991087, -0.5563239, -1.729282, 1, 0.01176471, 0, 1,
-2.867421, 1.099041, -1.549671, 1, 0.01960784, 0, 1,
-2.74171, -1.043073, -2.106358, 1, 0.02352941, 0, 1,
-2.727763, -0.2951868, -1.586474, 1, 0.03137255, 0, 1,
-2.66665, 0.6464156, -2.386819, 1, 0.03529412, 0, 1,
-2.612831, 0.1534463, -1.759468, 1, 0.04313726, 0, 1,
-2.485379, -1.697924, -1.790523, 1, 0.04705882, 0, 1,
-2.339154, -0.2891865, -0.1818219, 1, 0.05490196, 0, 1,
-2.306945, -0.2315249, -0.4496356, 1, 0.05882353, 0, 1,
-2.303689, 2.297163, -1.854828, 1, 0.06666667, 0, 1,
-2.237946, 0.7807038, -1.475978, 1, 0.07058824, 0, 1,
-2.162448, -0.4343103, -2.584233, 1, 0.07843138, 0, 1,
-2.135342, -0.7589905, -2.084066, 1, 0.08235294, 0, 1,
-2.106962, -0.6977228, -3.240463, 1, 0.09019608, 0, 1,
-2.102738, 0.6675155, -2.303897, 1, 0.09411765, 0, 1,
-2.07574, 0.75117, 0.2323001, 1, 0.1019608, 0, 1,
-2.008158, 0.1521816, -1.752514, 1, 0.1098039, 0, 1,
-1.980906, -0.6502759, -2.270488, 1, 0.1137255, 0, 1,
-1.978588, 0.09147218, -2.112585, 1, 0.1215686, 0, 1,
-1.974727, -0.3220868, -2.781061, 1, 0.1254902, 0, 1,
-1.96116, -0.003784684, -1.530198, 1, 0.1333333, 0, 1,
-1.94342, 0.112301, -2.072548, 1, 0.1372549, 0, 1,
-1.909151, -0.5825559, -2.763752, 1, 0.145098, 0, 1,
-1.905072, -1.333529, -2.043176, 1, 0.1490196, 0, 1,
-1.878856, -0.7134116, -2.138878, 1, 0.1568628, 0, 1,
-1.873674, -0.004141606, -0.284089, 1, 0.1607843, 0, 1,
-1.870615, 0.5768306, -1.169217, 1, 0.1686275, 0, 1,
-1.854867, 0.1363729, -1.787094, 1, 0.172549, 0, 1,
-1.833013, 0.7377673, 0.298465, 1, 0.1803922, 0, 1,
-1.819998, 1.846189, -0.9764881, 1, 0.1843137, 0, 1,
-1.814418, 0.5025924, -1.912612, 1, 0.1921569, 0, 1,
-1.781089, 0.2578962, -0.7387453, 1, 0.1960784, 0, 1,
-1.772465, 0.8878747, -1.910167, 1, 0.2039216, 0, 1,
-1.752068, -1.249588, -2.776918, 1, 0.2117647, 0, 1,
-1.739979, 0.1478291, -0.775294, 1, 0.2156863, 0, 1,
-1.733767, -1.24805, -1.787325, 1, 0.2235294, 0, 1,
-1.718134, 0.05782644, -2.310632, 1, 0.227451, 0, 1,
-1.715853, 1.477695, 1.042785, 1, 0.2352941, 0, 1,
-1.686191, 0.06603087, -2.91554, 1, 0.2392157, 0, 1,
-1.659766, -0.5689282, -2.878732, 1, 0.2470588, 0, 1,
-1.655212, -0.01032635, -0.9109102, 1, 0.2509804, 0, 1,
-1.648169, -1.053411, -2.680872, 1, 0.2588235, 0, 1,
-1.638315, 0.8091161, 0.08745635, 1, 0.2627451, 0, 1,
-1.619524, -0.04933948, -0.5383071, 1, 0.2705882, 0, 1,
-1.60493, 0.3593893, -0.4464694, 1, 0.2745098, 0, 1,
-1.599865, 0.9195598, -1.631819, 1, 0.282353, 0, 1,
-1.591473, 0.9089275, -0.6202882, 1, 0.2862745, 0, 1,
-1.590583, -0.7351789, -2.247694, 1, 0.2941177, 0, 1,
-1.57623, 0.6522536, -0.7353141, 1, 0.3019608, 0, 1,
-1.563749, 0.113355, -1.546067, 1, 0.3058824, 0, 1,
-1.561984, -1.805206, -1.620529, 1, 0.3137255, 0, 1,
-1.545572, 1.221686, 0.4086178, 1, 0.3176471, 0, 1,
-1.538289, -1.688339, -2.753802, 1, 0.3254902, 0, 1,
-1.534798, 1.059082, -0.454844, 1, 0.3294118, 0, 1,
-1.524346, 0.2429576, -1.610351, 1, 0.3372549, 0, 1,
-1.51287, 0.4283122, -0.4713624, 1, 0.3411765, 0, 1,
-1.512085, 0.5524188, -0.1988481, 1, 0.3490196, 0, 1,
-1.508042, 1.158181, 0.8284397, 1, 0.3529412, 0, 1,
-1.506686, -0.935253, -2.020817, 1, 0.3607843, 0, 1,
-1.475819, 0.2528782, -0.4796514, 1, 0.3647059, 0, 1,
-1.474277, -0.5471221, -1.132385, 1, 0.372549, 0, 1,
-1.472222, -1.108963, -1.560649, 1, 0.3764706, 0, 1,
-1.472194, 0.9521934, -1.273749, 1, 0.3843137, 0, 1,
-1.461194, 1.273742, -0.4708267, 1, 0.3882353, 0, 1,
-1.441529, 1.295733, -2.165612, 1, 0.3960784, 0, 1,
-1.435991, 1.050067, -0.3499216, 1, 0.4039216, 0, 1,
-1.408191, -1.054101, -1.255099, 1, 0.4078431, 0, 1,
-1.393388, -1.171263, -3.391324, 1, 0.4156863, 0, 1,
-1.392524, 0.9900271, -3.569731, 1, 0.4196078, 0, 1,
-1.391762, -1.015998, -2.76956, 1, 0.427451, 0, 1,
-1.39063, 1.577084, -1.848094, 1, 0.4313726, 0, 1,
-1.38794, -0.1309584, -2.387475, 1, 0.4392157, 0, 1,
-1.385338, 1.643483, 0.5594069, 1, 0.4431373, 0, 1,
-1.382773, 0.2305771, -2.237546, 1, 0.4509804, 0, 1,
-1.37936, -0.02425629, -1.998191, 1, 0.454902, 0, 1,
-1.379246, 0.9364923, -1.469395, 1, 0.4627451, 0, 1,
-1.375133, 0.2993492, -2.035233, 1, 0.4666667, 0, 1,
-1.374843, -1.502057, -2.356008, 1, 0.4745098, 0, 1,
-1.374566, -1.655943, -3.10171, 1, 0.4784314, 0, 1,
-1.367063, -0.5808201, -1.037989, 1, 0.4862745, 0, 1,
-1.356877, -2.045809, -2.265875, 1, 0.4901961, 0, 1,
-1.355377, 0.9827056, -0.5911518, 1, 0.4980392, 0, 1,
-1.35265, 1.805721, -0.765817, 1, 0.5058824, 0, 1,
-1.350904, 0.2411462, -1.50712, 1, 0.509804, 0, 1,
-1.349988, 0.2629799, 0.2078322, 1, 0.5176471, 0, 1,
-1.345842, 0.01035275, -1.896539, 1, 0.5215687, 0, 1,
-1.339688, -1.468334, -2.720616, 1, 0.5294118, 0, 1,
-1.339024, 0.4370849, -0.7577302, 1, 0.5333334, 0, 1,
-1.336394, -1.528485, -0.1179098, 1, 0.5411765, 0, 1,
-1.330215, 1.009308, -0.5898418, 1, 0.5450981, 0, 1,
-1.325608, -0.3114707, -3.10054, 1, 0.5529412, 0, 1,
-1.32302, -1.358556, -2.831852, 1, 0.5568628, 0, 1,
-1.317206, -0.266691, -1.535426, 1, 0.5647059, 0, 1,
-1.315478, -1.475847, -3.221733, 1, 0.5686275, 0, 1,
-1.313716, 0.8987658, 0.5942848, 1, 0.5764706, 0, 1,
-1.3069, -0.4892782, -2.516233, 1, 0.5803922, 0, 1,
-1.298008, 1.142053, 0.5741196, 1, 0.5882353, 0, 1,
-1.290551, 0.2990211, -1.281795, 1, 0.5921569, 0, 1,
-1.281234, 1.582756, -0.408291, 1, 0.6, 0, 1,
-1.279864, 0.2223584, -3.029398, 1, 0.6078432, 0, 1,
-1.279359, -0.4939427, -1.887228, 1, 0.6117647, 0, 1,
-1.271989, -0.8063845, -3.574751, 1, 0.6196079, 0, 1,
-1.267705, 0.9811532, -2.607209, 1, 0.6235294, 0, 1,
-1.264775, 0.4715309, 0.4959039, 1, 0.6313726, 0, 1,
-1.256225, -0.3300582, 1.012353, 1, 0.6352941, 0, 1,
-1.247004, -0.3369115, -2.547731, 1, 0.6431373, 0, 1,
-1.238659, 0.01009012, -0.7765792, 1, 0.6470588, 0, 1,
-1.233762, -1.630755, -2.869844, 1, 0.654902, 0, 1,
-1.232078, -0.708271, -3.172115, 1, 0.6588235, 0, 1,
-1.231159, -0.2764506, -3.300911, 1, 0.6666667, 0, 1,
-1.226216, -1.188444, -0.6840084, 1, 0.6705883, 0, 1,
-1.21419, 0.0394698, -1.943282, 1, 0.6784314, 0, 1,
-1.208337, 0.8237845, -1.479883, 1, 0.682353, 0, 1,
-1.20633, -1.107023, -1.322238, 1, 0.6901961, 0, 1,
-1.20454, -1.752124, -4.146596, 1, 0.6941177, 0, 1,
-1.198595, 1.479694, -1.352098, 1, 0.7019608, 0, 1,
-1.195728, -0.904961, -4.196602, 1, 0.7098039, 0, 1,
-1.194762, -0.3398177, -1.917748, 1, 0.7137255, 0, 1,
-1.194378, -1.355783, -2.152262, 1, 0.7215686, 0, 1,
-1.19331, 1.342509, -0.7726926, 1, 0.7254902, 0, 1,
-1.192346, 0.2441735, -1.544613, 1, 0.7333333, 0, 1,
-1.184444, -0.4371575, -3.449743, 1, 0.7372549, 0, 1,
-1.168225, 1.019329, -1.217084, 1, 0.7450981, 0, 1,
-1.167322, 0.2002845, -0.4562313, 1, 0.7490196, 0, 1,
-1.15969, -0.648157, -3.107727, 1, 0.7568628, 0, 1,
-1.156961, 0.3768536, -0.3164719, 1, 0.7607843, 0, 1,
-1.148476, -0.2049025, -1.02234, 1, 0.7686275, 0, 1,
-1.148139, 0.3739481, -1.425425, 1, 0.772549, 0, 1,
-1.146023, 0.3577612, -1.539506, 1, 0.7803922, 0, 1,
-1.141458, -1.222496, -4.588753, 1, 0.7843137, 0, 1,
-1.136742, 1.062706, 0.9189401, 1, 0.7921569, 0, 1,
-1.13421, -0.5451124, -1.756897, 1, 0.7960784, 0, 1,
-1.131984, 1.344513, -2.5596, 1, 0.8039216, 0, 1,
-1.124761, -0.4677444, -1.825585, 1, 0.8117647, 0, 1,
-1.114021, 0.7667823, 0.7651969, 1, 0.8156863, 0, 1,
-1.113076, -1.107516, -2.183834, 1, 0.8235294, 0, 1,
-1.113001, 1.433791, -1.46615, 1, 0.827451, 0, 1,
-1.08252, 0.9014302, -0.08997052, 1, 0.8352941, 0, 1,
-1.082083, 0.8528793, 0.9552064, 1, 0.8392157, 0, 1,
-1.080421, -1.085361, -4.370582, 1, 0.8470588, 0, 1,
-1.078437, 0.3369533, -1.313449, 1, 0.8509804, 0, 1,
-1.071142, 0.744111, -0.240638, 1, 0.8588235, 0, 1,
-1.07012, -1.645332, -4.571046, 1, 0.8627451, 0, 1,
-1.069508, -0.1742006, -0.2009192, 1, 0.8705882, 0, 1,
-1.060049, 0.2032115, -0.4939757, 1, 0.8745098, 0, 1,
-1.056933, 0.05095193, -1.606168, 1, 0.8823529, 0, 1,
-1.051751, 1.544965, -1.013586, 1, 0.8862745, 0, 1,
-1.041944, -1.61801, -4.44523, 1, 0.8941177, 0, 1,
-1.040492, -1.402085, -2.450668, 1, 0.8980392, 0, 1,
-1.03818, 0.6851397, 0.07200424, 1, 0.9058824, 0, 1,
-1.036792, -2.842827, -1.760308, 1, 0.9137255, 0, 1,
-1.028804, -0.7972302, -2.902589, 1, 0.9176471, 0, 1,
-1.027031, 0.2882786, -1.467418, 1, 0.9254902, 0, 1,
-1.022572, -0.3345178, -1.015897, 1, 0.9294118, 0, 1,
-1.022334, 0.6324447, -0.07594933, 1, 0.9372549, 0, 1,
-1.018945, -1.013995, -3.344206, 1, 0.9411765, 0, 1,
-1.01845, 0.8926665, -1.187021, 1, 0.9490196, 0, 1,
-1.017636, -0.8196672, -3.419757, 1, 0.9529412, 0, 1,
-1.017203, 0.5813614, -1.84119, 1, 0.9607843, 0, 1,
-1.016928, 1.250633, -0.520301, 1, 0.9647059, 0, 1,
-1.015977, 0.4920272, -0.74796, 1, 0.972549, 0, 1,
-0.9940649, 0.6753991, -0.05196672, 1, 0.9764706, 0, 1,
-0.9916981, -1.239213, -2.705294, 1, 0.9843137, 0, 1,
-0.9899616, 0.2732582, -0.4023414, 1, 0.9882353, 0, 1,
-0.9811108, 0.4669311, -2.472653, 1, 0.9960784, 0, 1,
-0.9783528, -0.6367158, -2.994574, 0.9960784, 1, 0, 1,
-0.9685781, -2.603801, -2.964001, 0.9921569, 1, 0, 1,
-0.9643796, 0.4366623, -3.681375, 0.9843137, 1, 0, 1,
-0.9608828, 0.1591003, -3.066737, 0.9803922, 1, 0, 1,
-0.9606313, 2.105785, 0.5237704, 0.972549, 1, 0, 1,
-0.9596699, -1.118563, -1.252653, 0.9686275, 1, 0, 1,
-0.957128, -0.2610393, -3.581472, 0.9607843, 1, 0, 1,
-0.9528729, 0.6659552, -0.5369747, 0.9568627, 1, 0, 1,
-0.9522727, -1.209746, -1.572003, 0.9490196, 1, 0, 1,
-0.9465009, -0.2844436, -0.3404984, 0.945098, 1, 0, 1,
-0.9414633, 1.341746, -1.710657, 0.9372549, 1, 0, 1,
-0.937245, 0.2121178, -0.2398479, 0.9333333, 1, 0, 1,
-0.9364794, 0.3655489, -3.56654, 0.9254902, 1, 0, 1,
-0.9339423, 1.545112, 1.404246, 0.9215686, 1, 0, 1,
-0.9332209, 0.2948651, -0.4997201, 0.9137255, 1, 0, 1,
-0.9323937, 0.9918407, -0.3819699, 0.9098039, 1, 0, 1,
-0.9298807, -0.5825106, -0.3536064, 0.9019608, 1, 0, 1,
-0.9271017, 1.529696, 0.7494144, 0.8941177, 1, 0, 1,
-0.9265823, 1.082618, 0.503141, 0.8901961, 1, 0, 1,
-0.9264841, -0.6344426, -1.48816, 0.8823529, 1, 0, 1,
-0.9259048, 0.06820782, -1.175224, 0.8784314, 1, 0, 1,
-0.9247078, -0.2282061, -3.106005, 0.8705882, 1, 0, 1,
-0.9177126, 0.9163557, -0.9869074, 0.8666667, 1, 0, 1,
-0.9163437, -1.7837, -3.01662, 0.8588235, 1, 0, 1,
-0.9140551, 0.6159012, -0.7625893, 0.854902, 1, 0, 1,
-0.9135367, -0.2735237, -3.274465, 0.8470588, 1, 0, 1,
-0.9112211, 1.808871, 0.9298559, 0.8431373, 1, 0, 1,
-0.9074711, -1.685623, -2.382662, 0.8352941, 1, 0, 1,
-0.900613, -1.038695, -3.516582, 0.8313726, 1, 0, 1,
-0.8989053, 0.1268089, -0.9708341, 0.8235294, 1, 0, 1,
-0.8981494, 1.031891, -0.6587019, 0.8196079, 1, 0, 1,
-0.8979411, 1.194543, -0.5308106, 0.8117647, 1, 0, 1,
-0.8939831, -0.03815178, -2.009679, 0.8078431, 1, 0, 1,
-0.8916307, -0.7342651, -3.04507, 0.8, 1, 0, 1,
-0.8736061, -0.5299219, -0.8354607, 0.7921569, 1, 0, 1,
-0.8723028, 0.9253085, -0.2365878, 0.7882353, 1, 0, 1,
-0.87184, -0.7864932, -3.222729, 0.7803922, 1, 0, 1,
-0.8705894, -0.08961105, -1.833935, 0.7764706, 1, 0, 1,
-0.8641817, -1.834011, -2.34726, 0.7686275, 1, 0, 1,
-0.854773, 1.158203, 0.2034789, 0.7647059, 1, 0, 1,
-0.8529574, 1.123324, 0.5160486, 0.7568628, 1, 0, 1,
-0.8494348, -0.1298002, -1.703923, 0.7529412, 1, 0, 1,
-0.8449646, 0.4417363, -0.5442308, 0.7450981, 1, 0, 1,
-0.8417584, 1.158499, 1.476606, 0.7411765, 1, 0, 1,
-0.8401208, 0.2512817, 0.2817584, 0.7333333, 1, 0, 1,
-0.8317459, -0.7048138, -2.319431, 0.7294118, 1, 0, 1,
-0.8169133, -0.151861, -1.287446, 0.7215686, 1, 0, 1,
-0.814505, 1.025789, -2.434273, 0.7176471, 1, 0, 1,
-0.8072256, -1.285648, -3.240407, 0.7098039, 1, 0, 1,
-0.8039507, 2.000525, -1.952226, 0.7058824, 1, 0, 1,
-0.802538, -1.278808, -2.582368, 0.6980392, 1, 0, 1,
-0.7911892, -2.079218, -2.914546, 0.6901961, 1, 0, 1,
-0.7894301, -0.2272625, -2.440962, 0.6862745, 1, 0, 1,
-0.789083, -1.823826, -2.964579, 0.6784314, 1, 0, 1,
-0.7850298, 0.8107991, -2.248016, 0.6745098, 1, 0, 1,
-0.7801731, -2.234976, -1.683274, 0.6666667, 1, 0, 1,
-0.7770318, 0.4463838, -2.470186, 0.6627451, 1, 0, 1,
-0.7766434, 1.714559, -0.08098446, 0.654902, 1, 0, 1,
-0.7735609, 1.394488, -1.713188, 0.6509804, 1, 0, 1,
-0.7642063, 0.2374662, -1.48559, 0.6431373, 1, 0, 1,
-0.7617192, -0.7496864, -2.163531, 0.6392157, 1, 0, 1,
-0.7610213, 0.7102757, -0.8196309, 0.6313726, 1, 0, 1,
-0.7535791, 1.665419, -2.2372, 0.627451, 1, 0, 1,
-0.7422783, 1.334755, 0.8849688, 0.6196079, 1, 0, 1,
-0.73801, 0.06321063, 0.4696798, 0.6156863, 1, 0, 1,
-0.7331204, 0.2425794, -0.9411384, 0.6078432, 1, 0, 1,
-0.7322632, 0.3199743, 1.083395, 0.6039216, 1, 0, 1,
-0.7306052, -1.268223, -3.245398, 0.5960785, 1, 0, 1,
-0.7305628, 0.3028579, -2.9494, 0.5882353, 1, 0, 1,
-0.7271541, -0.7578468, 0.2574648, 0.5843138, 1, 0, 1,
-0.7218076, -0.2219405, -2.582191, 0.5764706, 1, 0, 1,
-0.7218074, 0.9605751, -0.4356577, 0.572549, 1, 0, 1,
-0.7147474, -1.487567, -4.936234, 0.5647059, 1, 0, 1,
-0.7129941, 1.107765, 0.1682026, 0.5607843, 1, 0, 1,
-0.706992, 0.100883, -1.034998, 0.5529412, 1, 0, 1,
-0.6983115, 0.7779356, -1.479759, 0.5490196, 1, 0, 1,
-0.694019, 0.3562818, -1.315043, 0.5411765, 1, 0, 1,
-0.6924083, -1.409697, -3.060442, 0.5372549, 1, 0, 1,
-0.6916012, 0.03838748, -3.095116, 0.5294118, 1, 0, 1,
-0.6908185, -0.8345671, -1.99081, 0.5254902, 1, 0, 1,
-0.6768276, 0.4022951, -2.736636, 0.5176471, 1, 0, 1,
-0.6758248, -2.400804, -1.600369, 0.5137255, 1, 0, 1,
-0.6745151, -0.7719157, -0.8766809, 0.5058824, 1, 0, 1,
-0.6722769, 0.2468582, -0.7613003, 0.5019608, 1, 0, 1,
-0.6687113, 0.1335715, -1.091328, 0.4941176, 1, 0, 1,
-0.6684824, 1.543598, -2.188317, 0.4862745, 1, 0, 1,
-0.6632807, -0.3144223, -1.830069, 0.4823529, 1, 0, 1,
-0.6611588, 0.9192727, -1.061997, 0.4745098, 1, 0, 1,
-0.6567288, 0.3076849, -0.6492886, 0.4705882, 1, 0, 1,
-0.6538202, -1.002605, -4.198168, 0.4627451, 1, 0, 1,
-0.6500063, -1.377012, -3.143875, 0.4588235, 1, 0, 1,
-0.6493485, 0.02166465, -1.073697, 0.4509804, 1, 0, 1,
-0.6452286, 1.645443, -1.195673, 0.4470588, 1, 0, 1,
-0.6439373, -1.02192, -3.363685, 0.4392157, 1, 0, 1,
-0.6416423, 0.7099126, -2.545654, 0.4352941, 1, 0, 1,
-0.6397404, -0.07511479, -1.473637, 0.427451, 1, 0, 1,
-0.6345995, -0.3893151, -4.207922, 0.4235294, 1, 0, 1,
-0.6205655, 0.5244969, -1.420656, 0.4156863, 1, 0, 1,
-0.6161038, 1.181356, -0.002750231, 0.4117647, 1, 0, 1,
-0.6119519, -0.5849577, -2.552705, 0.4039216, 1, 0, 1,
-0.606595, -0.1855753, -1.405465, 0.3960784, 1, 0, 1,
-0.6040782, -0.7421457, -2.070646, 0.3921569, 1, 0, 1,
-0.6033959, 0.2193177, -0.05848109, 0.3843137, 1, 0, 1,
-0.6011856, 0.8884168, -1.816499, 0.3803922, 1, 0, 1,
-0.5981604, 0.14475, -1.537637, 0.372549, 1, 0, 1,
-0.5980693, 0.9566166, -1.763181, 0.3686275, 1, 0, 1,
-0.5962137, 0.7367202, -3.021044, 0.3607843, 1, 0, 1,
-0.5960879, -0.1297452, -0.8055634, 0.3568628, 1, 0, 1,
-0.5949107, 0.6957294, -1.670261, 0.3490196, 1, 0, 1,
-0.5935737, 0.6817405, -0.419502, 0.345098, 1, 0, 1,
-0.5921793, -0.6627061, -2.529119, 0.3372549, 1, 0, 1,
-0.5853566, -0.5029469, 0.275124, 0.3333333, 1, 0, 1,
-0.5818047, -0.4871551, -2.857754, 0.3254902, 1, 0, 1,
-0.5797229, -2.040485, -2.783253, 0.3215686, 1, 0, 1,
-0.5761428, -0.04692024, -2.012708, 0.3137255, 1, 0, 1,
-0.5738311, -0.9065712, -2.532956, 0.3098039, 1, 0, 1,
-0.5734124, 0.1947082, -0.6656985, 0.3019608, 1, 0, 1,
-0.5727092, -1.31345, -2.697778, 0.2941177, 1, 0, 1,
-0.5709432, 0.7079545, 0.3196473, 0.2901961, 1, 0, 1,
-0.5684314, 0.1281172, -1.11162, 0.282353, 1, 0, 1,
-0.5649773, -0.2043928, -1.319796, 0.2784314, 1, 0, 1,
-0.5635964, 0.4056872, -1.650832, 0.2705882, 1, 0, 1,
-0.5592908, -0.00242813, -1.042981, 0.2666667, 1, 0, 1,
-0.5591944, -1.931646, -4.526692, 0.2588235, 1, 0, 1,
-0.5589301, -0.3677024, -3.268027, 0.254902, 1, 0, 1,
-0.5532677, 0.2841068, -1.293382, 0.2470588, 1, 0, 1,
-0.5466772, -1.023324, -2.488137, 0.2431373, 1, 0, 1,
-0.5385453, 1.410197, -0.2266204, 0.2352941, 1, 0, 1,
-0.5380648, 0.6552513, 0.5417634, 0.2313726, 1, 0, 1,
-0.5374662, 0.7368495, -1.742311, 0.2235294, 1, 0, 1,
-0.5350897, 1.708643, 0.1472456, 0.2196078, 1, 0, 1,
-0.5310004, 0.182448, -0.6446084, 0.2117647, 1, 0, 1,
-0.5300161, 1.345668, 0.5202563, 0.2078431, 1, 0, 1,
-0.5242875, -0.2119102, -3.656975, 0.2, 1, 0, 1,
-0.5155625, -0.5098242, -2.811553, 0.1921569, 1, 0, 1,
-0.513806, -1.867462, -2.262773, 0.1882353, 1, 0, 1,
-0.5130879, -0.5047277, -1.590716, 0.1803922, 1, 0, 1,
-0.503684, -1.709576, -1.190551, 0.1764706, 1, 0, 1,
-0.5022492, -0.3848708, -2.112603, 0.1686275, 1, 0, 1,
-0.5017303, -2.328902, -2.816459, 0.1647059, 1, 0, 1,
-0.4989595, 0.8453003, 0.5124457, 0.1568628, 1, 0, 1,
-0.4983411, -0.7900028, -1.461157, 0.1529412, 1, 0, 1,
-0.4982989, 0.3293209, -2.119224, 0.145098, 1, 0, 1,
-0.4922002, 1.133422, 0.3790711, 0.1411765, 1, 0, 1,
-0.4841785, 1.478647, -0.10855, 0.1333333, 1, 0, 1,
-0.4812558, -0.8472959, -3.290636, 0.1294118, 1, 0, 1,
-0.4768001, 0.04075269, -2.113566, 0.1215686, 1, 0, 1,
-0.4766845, -0.08197004, -1.114143, 0.1176471, 1, 0, 1,
-0.4744532, 0.06454061, -1.636859, 0.1098039, 1, 0, 1,
-0.4722952, -0.2178876, -1.835392, 0.1058824, 1, 0, 1,
-0.471108, 1.451586, 0.3474034, 0.09803922, 1, 0, 1,
-0.4677294, 1.418289, -0.8560824, 0.09019608, 1, 0, 1,
-0.4667667, 0.646261, -0.7488381, 0.08627451, 1, 0, 1,
-0.4667082, -0.6584216, -1.327302, 0.07843138, 1, 0, 1,
-0.4648539, 0.5198169, -0.4572958, 0.07450981, 1, 0, 1,
-0.4630137, -0.04123269, -2.021825, 0.06666667, 1, 0, 1,
-0.4540714, -1.792824, -2.603348, 0.0627451, 1, 0, 1,
-0.4538251, -1.179018, -2.875195, 0.05490196, 1, 0, 1,
-0.4527529, -0.01837366, -2.502499, 0.05098039, 1, 0, 1,
-0.451206, -0.7332743, -1.90545, 0.04313726, 1, 0, 1,
-0.4491602, 1.599013, -0.4679638, 0.03921569, 1, 0, 1,
-0.4442894, -1.390666, -2.888278, 0.03137255, 1, 0, 1,
-0.4442776, 0.6225286, 0.498487, 0.02745098, 1, 0, 1,
-0.444198, -1.359161, -3.869218, 0.01960784, 1, 0, 1,
-0.4439206, -0.004608282, -1.875672, 0.01568628, 1, 0, 1,
-0.4391376, -1.183395, -3.679109, 0.007843138, 1, 0, 1,
-0.4306828, -0.1390314, -2.046191, 0.003921569, 1, 0, 1,
-0.4304872, 0.5352573, 0.5622953, 0, 1, 0.003921569, 1,
-0.4282181, 0.5511627, -0.2723619, 0, 1, 0.01176471, 1,
-0.4260424, 1.320121, 0.7106204, 0, 1, 0.01568628, 1,
-0.4255178, -0.6597713, -1.918949, 0, 1, 0.02352941, 1,
-0.4226478, 0.9019942, -0.1148414, 0, 1, 0.02745098, 1,
-0.421817, 1.328703, 0.691646, 0, 1, 0.03529412, 1,
-0.4182081, -0.5943326, -2.946907, 0, 1, 0.03921569, 1,
-0.4141811, 1.271034, 0.3587033, 0, 1, 0.04705882, 1,
-0.4117542, 0.3086393, 0.6729135, 0, 1, 0.05098039, 1,
-0.4109036, 0.3760236, 0.3261882, 0, 1, 0.05882353, 1,
-0.3968185, 1.918231, -0.566936, 0, 1, 0.0627451, 1,
-0.3961144, 0.04176245, -2.144677, 0, 1, 0.07058824, 1,
-0.3923779, -1.081919, -1.81073, 0, 1, 0.07450981, 1,
-0.3909329, 0.1945522, -0.5541342, 0, 1, 0.08235294, 1,
-0.3890298, -1.380013, -1.39871, 0, 1, 0.08627451, 1,
-0.3889084, 1.197127, -0.1393572, 0, 1, 0.09411765, 1,
-0.3848835, -0.01793053, -1.174282, 0, 1, 0.1019608, 1,
-0.381547, -1.090273, -4.171203, 0, 1, 0.1058824, 1,
-0.3802149, 0.8739961, 0.1748371, 0, 1, 0.1137255, 1,
-0.3799163, 0.9701065, 0.8422566, 0, 1, 0.1176471, 1,
-0.3776205, 0.4051956, 1.154017, 0, 1, 0.1254902, 1,
-0.3774006, -0.3621617, -3.435328, 0, 1, 0.1294118, 1,
-0.375182, 0.2546507, 0.03104273, 0, 1, 0.1372549, 1,
-0.3733581, 0.5181825, -1.711934, 0, 1, 0.1411765, 1,
-0.3636861, -0.4128909, -3.761116, 0, 1, 0.1490196, 1,
-0.3621747, 0.6126587, 0.7752414, 0, 1, 0.1529412, 1,
-0.3617853, -0.276306, -2.529229, 0, 1, 0.1607843, 1,
-0.3562905, 0.6120369, -0.4782381, 0, 1, 0.1647059, 1,
-0.3561024, 0.7696214, -0.249337, 0, 1, 0.172549, 1,
-0.3516906, 0.1269193, -0.2974094, 0, 1, 0.1764706, 1,
-0.3513222, 0.1973864, -0.6959075, 0, 1, 0.1843137, 1,
-0.3496445, 0.5382134, -0.6968876, 0, 1, 0.1882353, 1,
-0.3487336, 0.6932051, -0.8011783, 0, 1, 0.1960784, 1,
-0.3473868, 1.927604e-05, -1.521652, 0, 1, 0.2039216, 1,
-0.3435419, -1.124424, -2.261728, 0, 1, 0.2078431, 1,
-0.3428456, -1.869366, -2.928687, 0, 1, 0.2156863, 1,
-0.3412479, 0.75086, 0.3352889, 0, 1, 0.2196078, 1,
-0.3405496, 1.428118, -1.386211, 0, 1, 0.227451, 1,
-0.3389644, 1.32106, -0.2183156, 0, 1, 0.2313726, 1,
-0.3345686, -2.100021, -3.28676, 0, 1, 0.2392157, 1,
-0.3316012, -1.518702, -1.469778, 0, 1, 0.2431373, 1,
-0.3299706, 1.198466, 1.753995, 0, 1, 0.2509804, 1,
-0.3298488, 0.4011343, -1.904894, 0, 1, 0.254902, 1,
-0.329705, 0.2402946, -1.554326, 0, 1, 0.2627451, 1,
-0.3259197, -1.580775, -1.846612, 0, 1, 0.2666667, 1,
-0.3254905, 0.86973, -2.152526, 0, 1, 0.2745098, 1,
-0.3238755, -1.244635, -3.890941, 0, 1, 0.2784314, 1,
-0.3185707, 1.966254, -0.3203061, 0, 1, 0.2862745, 1,
-0.3165473, 0.4421864, -0.3503186, 0, 1, 0.2901961, 1,
-0.3160191, 0.6859251, -0.5988579, 0, 1, 0.2980392, 1,
-0.3139052, 0.5743074, 1.377999, 0, 1, 0.3058824, 1,
-0.313105, -1.053135, -3.25445, 0, 1, 0.3098039, 1,
-0.3120704, -1.698016, -2.916011, 0, 1, 0.3176471, 1,
-0.3120386, 0.5720585, -0.7355575, 0, 1, 0.3215686, 1,
-0.3097257, 0.07930165, -0.859574, 0, 1, 0.3294118, 1,
-0.307784, 0.343098, -1.273637, 0, 1, 0.3333333, 1,
-0.3066733, 0.3955474, 0.06157204, 0, 1, 0.3411765, 1,
-0.3035012, -0.3254886, -2.180202, 0, 1, 0.345098, 1,
-0.2970728, -0.98566, -4.501056, 0, 1, 0.3529412, 1,
-0.2961789, 2.66428, 0.7303393, 0, 1, 0.3568628, 1,
-0.2924698, -0.9692341, -2.05974, 0, 1, 0.3647059, 1,
-0.291267, 1.551351, -0.9412844, 0, 1, 0.3686275, 1,
-0.290912, 0.2037252, -1.845613, 0, 1, 0.3764706, 1,
-0.288262, 1.062124, -0.8901213, 0, 1, 0.3803922, 1,
-0.2868361, 1.494267, -0.4057987, 0, 1, 0.3882353, 1,
-0.2846446, 0.8974751, 0.8860906, 0, 1, 0.3921569, 1,
-0.27874, -0.6825665, -3.286638, 0, 1, 0.4, 1,
-0.2769979, -0.4726151, -1.408194, 0, 1, 0.4078431, 1,
-0.2761584, 1.070614, 1.354932, 0, 1, 0.4117647, 1,
-0.2761394, -0.04023504, -2.072078, 0, 1, 0.4196078, 1,
-0.275757, -0.03006336, -0.6477068, 0, 1, 0.4235294, 1,
-0.2725603, 2.877934, 0.8133929, 0, 1, 0.4313726, 1,
-0.2713433, -1.534772, -3.287978, 0, 1, 0.4352941, 1,
-0.2699339, -1.279584, -3.444749, 0, 1, 0.4431373, 1,
-0.2660368, 0.7897739, 0.5543548, 0, 1, 0.4470588, 1,
-0.2611846, -0.5979654, -2.098124, 0, 1, 0.454902, 1,
-0.260444, -1.16327, -2.641419, 0, 1, 0.4588235, 1,
-0.2578079, -0.5278828, -2.000994, 0, 1, 0.4666667, 1,
-0.2555084, -0.2848942, -1.117855, 0, 1, 0.4705882, 1,
-0.2546617, 0.1005433, 0.1419816, 0, 1, 0.4784314, 1,
-0.2528842, 0.8131465, -1.227678, 0, 1, 0.4823529, 1,
-0.2524591, -1.695704, -4.73142, 0, 1, 0.4901961, 1,
-0.2522325, -0.5770968, -2.85658, 0, 1, 0.4941176, 1,
-0.2517646, -1.94431, -3.354644, 0, 1, 0.5019608, 1,
-0.2513433, -1.813556, -2.20397, 0, 1, 0.509804, 1,
-0.2506193, -2.139447, -3.791905, 0, 1, 0.5137255, 1,
-0.249754, 0.2211362, -2.238286, 0, 1, 0.5215687, 1,
-0.2475038, -0.343516, -1.375387, 0, 1, 0.5254902, 1,
-0.2468849, -2.251579, -3.008844, 0, 1, 0.5333334, 1,
-0.2456483, 0.478574, -1.1481, 0, 1, 0.5372549, 1,
-0.2447045, -0.2151933, -2.398621, 0, 1, 0.5450981, 1,
-0.242503, 1.093076, 0.8240308, 0, 1, 0.5490196, 1,
-0.2403813, -0.3965232, -2.229081, 0, 1, 0.5568628, 1,
-0.2398039, -0.21562, -3.275854, 0, 1, 0.5607843, 1,
-0.2367887, -0.3220738, -3.342074, 0, 1, 0.5686275, 1,
-0.2358812, 1.197659, -0.07643467, 0, 1, 0.572549, 1,
-0.234145, -0.7290876, -3.384712, 0, 1, 0.5803922, 1,
-0.226084, 0.7994646, 0.1296125, 0, 1, 0.5843138, 1,
-0.224667, -0.8784941, -2.468027, 0, 1, 0.5921569, 1,
-0.2220375, -0.4431297, -2.375464, 0, 1, 0.5960785, 1,
-0.2174102, 2.294575, -0.8784623, 0, 1, 0.6039216, 1,
-0.2155466, -0.9384521, -2.252444, 0, 1, 0.6117647, 1,
-0.2141521, 0.7755848, 0.4177563, 0, 1, 0.6156863, 1,
-0.2118929, 0.835772, -0.1741765, 0, 1, 0.6235294, 1,
-0.2111483, -1.414353, -3.648542, 0, 1, 0.627451, 1,
-0.2096692, 0.6097278, 0.3684231, 0, 1, 0.6352941, 1,
-0.2091497, -0.3953597, -1.123409, 0, 1, 0.6392157, 1,
-0.2060834, 0.63773, -0.7692915, 0, 1, 0.6470588, 1,
-0.2039334, -1.208717, -3.033261, 0, 1, 0.6509804, 1,
-0.1988974, -0.2487155, -3.914582, 0, 1, 0.6588235, 1,
-0.1890776, -0.06631827, -0.581107, 0, 1, 0.6627451, 1,
-0.1870683, -0.2115781, -1.74033, 0, 1, 0.6705883, 1,
-0.1855641, 1.640391, -2.296388, 0, 1, 0.6745098, 1,
-0.1849531, -0.3789668, -4.090633, 0, 1, 0.682353, 1,
-0.1841779, 0.3493794, -2.02971, 0, 1, 0.6862745, 1,
-0.1791559, 0.6753803, -0.987111, 0, 1, 0.6941177, 1,
-0.1709309, 0.9748986, -1.822549, 0, 1, 0.7019608, 1,
-0.1689452, -0.4018517, -3.207052, 0, 1, 0.7058824, 1,
-0.1676692, -1.554602, -3.569615, 0, 1, 0.7137255, 1,
-0.1665938, -1.938783, -1.991245, 0, 1, 0.7176471, 1,
-0.1602701, -1.104042, -1.966391, 0, 1, 0.7254902, 1,
-0.1560372, 0.1972354, 0.9829684, 0, 1, 0.7294118, 1,
-0.150969, -0.1947805, -1.327912, 0, 1, 0.7372549, 1,
-0.145295, -0.3835119, -3.168237, 0, 1, 0.7411765, 1,
-0.1380237, 0.2179731, -1.614731, 0, 1, 0.7490196, 1,
-0.1167808, 0.7484612, -0.9733533, 0, 1, 0.7529412, 1,
-0.1120119, -1.290686, -3.140877, 0, 1, 0.7607843, 1,
-0.1112776, -0.5710589, -3.498638, 0, 1, 0.7647059, 1,
-0.1093369, 0.302835, -0.617407, 0, 1, 0.772549, 1,
-0.1080091, 0.5450726, 0.2683073, 0, 1, 0.7764706, 1,
-0.1079544, -0.5573649, -1.502397, 0, 1, 0.7843137, 1,
-0.1078132, 2.144195, -0.09005687, 0, 1, 0.7882353, 1,
-0.1076176, 1.208704, -1.649698, 0, 1, 0.7960784, 1,
-0.09821797, 0.6666902, 0.805429, 0, 1, 0.8039216, 1,
-0.09747367, 1.246794, 0.5234118, 0, 1, 0.8078431, 1,
-0.09595089, -1.029943, -1.968043, 0, 1, 0.8156863, 1,
-0.09407313, 0.257256, 0.8342322, 0, 1, 0.8196079, 1,
-0.08431676, 0.5090657, 0.3463995, 0, 1, 0.827451, 1,
-0.08224389, -0.5737554, -3.526487, 0, 1, 0.8313726, 1,
-0.08176943, 0.4983644, -0.1984475, 0, 1, 0.8392157, 1,
-0.07290451, -1.226734, -3.764973, 0, 1, 0.8431373, 1,
-0.06975019, 0.2311906, -0.8037934, 0, 1, 0.8509804, 1,
-0.06555435, 0.3283018, 0.3238159, 0, 1, 0.854902, 1,
-0.06555367, -0.4983705, -2.23555, 0, 1, 0.8627451, 1,
-0.05980976, -0.09385624, -1.810211, 0, 1, 0.8666667, 1,
-0.05946609, 1.65072, 0.2090097, 0, 1, 0.8745098, 1,
-0.05102025, -0.3904549, -2.556605, 0, 1, 0.8784314, 1,
-0.0493034, -0.4036667, -4.922369, 0, 1, 0.8862745, 1,
-0.04558767, 0.0317955, -0.3017783, 0, 1, 0.8901961, 1,
-0.04247613, -0.03559577, -1.334905, 0, 1, 0.8980392, 1,
-0.04035796, 0.03751677, -2.934589, 0, 1, 0.9058824, 1,
-0.03685361, 0.7622842, 0.09045137, 0, 1, 0.9098039, 1,
-0.03074481, 0.40012, -1.136852, 0, 1, 0.9176471, 1,
-0.02906021, -0.7232833, -4.100558, 0, 1, 0.9215686, 1,
-0.02889993, -1.104843, -2.200362, 0, 1, 0.9294118, 1,
-0.02411244, 0.5708465, 0.2632034, 0, 1, 0.9333333, 1,
-0.02341607, 0.0882786, -1.441827, 0, 1, 0.9411765, 1,
-0.02319472, 0.6675625, 0.672201, 0, 1, 0.945098, 1,
-0.01814172, -2.498196, -1.430175, 0, 1, 0.9529412, 1,
-0.01769283, 1.144411, -0.2115776, 0, 1, 0.9568627, 1,
-0.0175838, -0.0537188, -2.451763, 0, 1, 0.9647059, 1,
-0.01533554, -1.336925, -2.837873, 0, 1, 0.9686275, 1,
-0.00874004, -0.1300233, -5.100119, 0, 1, 0.9764706, 1,
-0.008182067, -0.09227668, -2.044472, 0, 1, 0.9803922, 1,
-0.007160703, 0.9158945, -0.3045978, 0, 1, 0.9882353, 1,
-0.0007152091, 0.9544745, -1.057883, 0, 1, 0.9921569, 1,
-0.0005972193, 0.6818102, -0.8010961, 0, 1, 1, 1,
0.001611981, -0.8905773, 3.075749, 0, 0.9921569, 1, 1,
0.002052724, -0.2361885, 2.911015, 0, 0.9882353, 1, 1,
0.004961924, 2.392974, -0.6808221, 0, 0.9803922, 1, 1,
0.00592254, -2.12618, 3.924114, 0, 0.9764706, 1, 1,
0.006052176, 1.041533, 0.7068729, 0, 0.9686275, 1, 1,
0.006151606, -1.987415, 3.170704, 0, 0.9647059, 1, 1,
0.00949725, 0.0009336961, 0.3125321, 0, 0.9568627, 1, 1,
0.01034429, 0.1553688, 1.051401, 0, 0.9529412, 1, 1,
0.01105836, 1.396293, 0.07422211, 0, 0.945098, 1, 1,
0.01412074, 0.162222, 0.07263058, 0, 0.9411765, 1, 1,
0.01638404, 1.323037, -2.266648, 0, 0.9333333, 1, 1,
0.01767288, 0.225651, -0.3577628, 0, 0.9294118, 1, 1,
0.02405348, -1.651371, 4.865568, 0, 0.9215686, 1, 1,
0.02807532, -1.880776, 3.896543, 0, 0.9176471, 1, 1,
0.03037735, -0.3210894, 2.823616, 0, 0.9098039, 1, 1,
0.03058123, 0.403647, 2.383495, 0, 0.9058824, 1, 1,
0.03144307, -0.617245, 1.431631, 0, 0.8980392, 1, 1,
0.03871477, 0.02209432, 2.160578, 0, 0.8901961, 1, 1,
0.03919213, -0.06875391, 2.270098, 0, 0.8862745, 1, 1,
0.03964632, 0.03644796, 0.9996555, 0, 0.8784314, 1, 1,
0.04499167, -0.4169639, 3.072971, 0, 0.8745098, 1, 1,
0.0466099, 0.04865538, -0.0554456, 0, 0.8666667, 1, 1,
0.04664615, -0.7276534, 3.393843, 0, 0.8627451, 1, 1,
0.0518866, 0.3931917, -0.5765116, 0, 0.854902, 1, 1,
0.05634938, -1.64407, 3.495984, 0, 0.8509804, 1, 1,
0.06004581, 1.134877, 1.309715, 0, 0.8431373, 1, 1,
0.06281729, -0.2006574, 2.834134, 0, 0.8392157, 1, 1,
0.06348982, -0.9300348, 1.116561, 0, 0.8313726, 1, 1,
0.06676488, 0.1323621, -0.8678175, 0, 0.827451, 1, 1,
0.06761704, -1.094263, 2.789465, 0, 0.8196079, 1, 1,
0.06956086, -1.074941, 2.234136, 0, 0.8156863, 1, 1,
0.07252481, -0.3934622, 3.798442, 0, 0.8078431, 1, 1,
0.07585794, 0.5384927, 0.7829341, 0, 0.8039216, 1, 1,
0.07667986, -2.780912, 3.520954, 0, 0.7960784, 1, 1,
0.08234084, 0.02292573, 1.612727, 0, 0.7882353, 1, 1,
0.08247229, 0.312741, -0.2813282, 0, 0.7843137, 1, 1,
0.08623388, -1.092421, 4.514537, 0, 0.7764706, 1, 1,
0.08689215, 1.096491, 2.665835, 0, 0.772549, 1, 1,
0.08860052, 0.3620689, 1.695101, 0, 0.7647059, 1, 1,
0.08932219, -2.613021, 2.308913, 0, 0.7607843, 1, 1,
0.09161276, 0.2702369, 0.9670476, 0, 0.7529412, 1, 1,
0.09281886, -1.307977, 2.472607, 0, 0.7490196, 1, 1,
0.09359878, -0.0400399, 2.482492, 0, 0.7411765, 1, 1,
0.09382415, 0.2162474, 0.6387674, 0, 0.7372549, 1, 1,
0.09584852, 0.3189259, 0.7050104, 0, 0.7294118, 1, 1,
0.09593192, 1.77769, -0.4957105, 0, 0.7254902, 1, 1,
0.09649055, -0.03517298, 1.623588, 0, 0.7176471, 1, 1,
0.1135041, -0.3888743, 3.882918, 0, 0.7137255, 1, 1,
0.117009, -1.181726, 4.086246, 0, 0.7058824, 1, 1,
0.1181325, -1.326015, 3.189015, 0, 0.6980392, 1, 1,
0.1199943, 0.06911384, 0.687088, 0, 0.6941177, 1, 1,
0.1199995, -0.01280897, 1.685268, 0, 0.6862745, 1, 1,
0.1231633, 0.2426497, -0.2422964, 0, 0.682353, 1, 1,
0.1258346, 0.1238054, 2.136627, 0, 0.6745098, 1, 1,
0.1263345, -0.2825404, 1.442644, 0, 0.6705883, 1, 1,
0.1265113, -0.5755582, 3.415468, 0, 0.6627451, 1, 1,
0.1295791, 0.04514849, 2.434242, 0, 0.6588235, 1, 1,
0.1296982, 0.2974717, -1.297578, 0, 0.6509804, 1, 1,
0.1307904, -1.172703, 4.157431, 0, 0.6470588, 1, 1,
0.1387035, -1.188025, 2.998854, 0, 0.6392157, 1, 1,
0.1411762, -0.3702665, 3.789052, 0, 0.6352941, 1, 1,
0.1423817, -0.5817637, 4.188559, 0, 0.627451, 1, 1,
0.1446602, 1.353388, 0.249227, 0, 0.6235294, 1, 1,
0.1458776, 1.001783, 0.9941458, 0, 0.6156863, 1, 1,
0.1473772, -1.363819, 2.852366, 0, 0.6117647, 1, 1,
0.1500877, -0.1030949, 2.381735, 0, 0.6039216, 1, 1,
0.1526362, 0.9166015, -0.5978552, 0, 0.5960785, 1, 1,
0.1535531, 0.6112421, 1.332672, 0, 0.5921569, 1, 1,
0.1584647, -2.125331, 3.683414, 0, 0.5843138, 1, 1,
0.1588411, 0.8376529, 0.553822, 0, 0.5803922, 1, 1,
0.1656821, -0.3962386, 3.311822, 0, 0.572549, 1, 1,
0.1662682, -1.538178, 3.962249, 0, 0.5686275, 1, 1,
0.1665657, -2.168991, 1.574473, 0, 0.5607843, 1, 1,
0.1684254, -1.186243, 2.911294, 0, 0.5568628, 1, 1,
0.1689405, 0.06512695, 0.7998108, 0, 0.5490196, 1, 1,
0.1738643, 0.6056864, 1.933433, 0, 0.5450981, 1, 1,
0.1807281, 0.1630054, 1.427986, 0, 0.5372549, 1, 1,
0.1830934, -0.08317709, 1.663793, 0, 0.5333334, 1, 1,
0.1831086, -2.833658, 4.084835, 0, 0.5254902, 1, 1,
0.1834345, -1.787513, 4.450253, 0, 0.5215687, 1, 1,
0.1846317, -0.6021999, 4.090539, 0, 0.5137255, 1, 1,
0.1917101, 1.440224, -1.910953, 0, 0.509804, 1, 1,
0.1934261, 0.01640167, 0.3502259, 0, 0.5019608, 1, 1,
0.1944171, -0.1352158, 3.574223, 0, 0.4941176, 1, 1,
0.194551, 0.4815356, -0.6034806, 0, 0.4901961, 1, 1,
0.1973094, 2.19115, 0.7861607, 0, 0.4823529, 1, 1,
0.1994717, -0.8548927, 1.663186, 0, 0.4784314, 1, 1,
0.2036055, -0.8480331, 1.889007, 0, 0.4705882, 1, 1,
0.2057325, -0.606752, 3.281355, 0, 0.4666667, 1, 1,
0.2090855, -0.9249711, 4.207437, 0, 0.4588235, 1, 1,
0.2094398, -0.6480098, 3.210444, 0, 0.454902, 1, 1,
0.2114116, 0.8101855, 1.279094, 0, 0.4470588, 1, 1,
0.2136074, 0.9438998, 1.248479, 0, 0.4431373, 1, 1,
0.2136103, -0.3810805, 2.852185, 0, 0.4352941, 1, 1,
0.2137968, 0.5846562, 0.3899503, 0, 0.4313726, 1, 1,
0.2156341, 0.2429946, 1.040612, 0, 0.4235294, 1, 1,
0.2158506, -1.544882, 3.804521, 0, 0.4196078, 1, 1,
0.2186228, -1.742833, 3.741869, 0, 0.4117647, 1, 1,
0.2193227, 0.8400634, -0.5538154, 0, 0.4078431, 1, 1,
0.2241037, 1.722007, 0.5378289, 0, 0.4, 1, 1,
0.2298017, -3.493385, 4.307273, 0, 0.3921569, 1, 1,
0.2305574, 0.7676441, 0.2887596, 0, 0.3882353, 1, 1,
0.2323801, 1.948241, -1.149732, 0, 0.3803922, 1, 1,
0.2343874, 1.514072, -0.2000145, 0, 0.3764706, 1, 1,
0.2415505, 0.5241561, -1.191968, 0, 0.3686275, 1, 1,
0.245199, -0.06775396, 2.781477, 0, 0.3647059, 1, 1,
0.2461157, 1.790812, 0.9668593, 0, 0.3568628, 1, 1,
0.2492996, -1.205536, 2.694791, 0, 0.3529412, 1, 1,
0.2511415, 0.1055762, -0.4978941, 0, 0.345098, 1, 1,
0.2528347, -0.5398656, 2.419102, 0, 0.3411765, 1, 1,
0.2565277, 0.749108, 0.242063, 0, 0.3333333, 1, 1,
0.2606872, 1.145696, 2.30745, 0, 0.3294118, 1, 1,
0.2625774, 0.3185045, 1.16984, 0, 0.3215686, 1, 1,
0.2640921, 0.9267275, 0.005226216, 0, 0.3176471, 1, 1,
0.2682017, -2.104668, 1.729854, 0, 0.3098039, 1, 1,
0.2784352, 0.5846642, 0.5459948, 0, 0.3058824, 1, 1,
0.2786047, -0.3794377, 2.922605, 0, 0.2980392, 1, 1,
0.2814793, -0.5821725, -0.507167, 0, 0.2901961, 1, 1,
0.2829068, -0.227399, 3.382215, 0, 0.2862745, 1, 1,
0.2835113, 0.2512347, 0.4813884, 0, 0.2784314, 1, 1,
0.2847374, -1.200697, 1.487081, 0, 0.2745098, 1, 1,
0.2866091, -0.3959619, 3.422493, 0, 0.2666667, 1, 1,
0.2877596, 0.8734428, 1.741569, 0, 0.2627451, 1, 1,
0.2878678, 0.5137435, 0.1663378, 0, 0.254902, 1, 1,
0.2933219, 1.301865, -0.1074208, 0, 0.2509804, 1, 1,
0.2953918, 0.3804887, 1.934897, 0, 0.2431373, 1, 1,
0.2960503, -0.9427269, 4.149565, 0, 0.2392157, 1, 1,
0.2972195, -1.739222, 4.31441, 0, 0.2313726, 1, 1,
0.2998973, 0.8393763, -0.1253412, 0, 0.227451, 1, 1,
0.3008408, 0.1658058, 1.635859, 0, 0.2196078, 1, 1,
0.3088812, 0.003198641, 2.456652, 0, 0.2156863, 1, 1,
0.312585, 0.6268103, 2.354256, 0, 0.2078431, 1, 1,
0.3210531, -0.1632823, 2.797283, 0, 0.2039216, 1, 1,
0.3233559, 0.0786727, 0.4875098, 0, 0.1960784, 1, 1,
0.3237905, -0.7871567, 0.5088292, 0, 0.1882353, 1, 1,
0.3261289, -0.8337331, 2.87098, 0, 0.1843137, 1, 1,
0.3320252, -1.039692, 2.238711, 0, 0.1764706, 1, 1,
0.3376673, 1.738465, 0.7362181, 0, 0.172549, 1, 1,
0.3377621, 0.7222165, -0.1419332, 0, 0.1647059, 1, 1,
0.3390112, 0.4901412, 0.4495192, 0, 0.1607843, 1, 1,
0.3392618, -0.2324067, 2.427922, 0, 0.1529412, 1, 1,
0.3430182, 0.4687153, 2.518644, 0, 0.1490196, 1, 1,
0.3470708, -0.8175521, 3.232303, 0, 0.1411765, 1, 1,
0.3475949, -0.3357139, 3.149796, 0, 0.1372549, 1, 1,
0.3486462, -0.2161386, 0.9589908, 0, 0.1294118, 1, 1,
0.3583044, 0.3290457, -0.04802384, 0, 0.1254902, 1, 1,
0.3623567, -0.3918449, 2.672759, 0, 0.1176471, 1, 1,
0.3625498, -0.2951655, 2.967449, 0, 0.1137255, 1, 1,
0.3663239, -0.9681757, 4.276721, 0, 0.1058824, 1, 1,
0.3671278, 0.4604396, 0.8586088, 0, 0.09803922, 1, 1,
0.3688282, 0.822002, -0.2521067, 0, 0.09411765, 1, 1,
0.3700441, -0.6446134, 1.698833, 0, 0.08627451, 1, 1,
0.3719019, -0.6340957, 3.474484, 0, 0.08235294, 1, 1,
0.379424, 1.177759, 0.4871506, 0, 0.07450981, 1, 1,
0.3801713, 0.9962994, 0.3452751, 0, 0.07058824, 1, 1,
0.3828872, 1.538113, 1.085182, 0, 0.0627451, 1, 1,
0.3839626, -1.467338, 4.183399, 0, 0.05882353, 1, 1,
0.387068, -2.294476, 3.027946, 0, 0.05098039, 1, 1,
0.3926917, 0.4442308, 0.5087275, 0, 0.04705882, 1, 1,
0.3946354, 0.7015556, 1.656079, 0, 0.03921569, 1, 1,
0.3983306, 1.952645, -0.0540203, 0, 0.03529412, 1, 1,
0.3993939, 0.7748862, -0.6807158, 0, 0.02745098, 1, 1,
0.4001136, -0.3514939, 1.153501, 0, 0.02352941, 1, 1,
0.4050179, -1.226841, 1.988919, 0, 0.01568628, 1, 1,
0.4089745, 0.114329, 1.475991, 0, 0.01176471, 1, 1,
0.4089876, 0.5106393, -2.999994, 0, 0.003921569, 1, 1,
0.4175608, -1.236981, 3.131872, 0.003921569, 0, 1, 1,
0.4308398, 0.2448203, -0.6595566, 0.007843138, 0, 1, 1,
0.431558, -0.8406987, 3.278197, 0.01568628, 0, 1, 1,
0.4337334, -0.13667, 0.6408736, 0.01960784, 0, 1, 1,
0.4356627, 0.4057231, 2.601266, 0.02745098, 0, 1, 1,
0.4385872, 0.003027898, 2.16484, 0.03137255, 0, 1, 1,
0.4387358, -1.153722, 3.126868, 0.03921569, 0, 1, 1,
0.4387876, -0.9551501, 2.186162, 0.04313726, 0, 1, 1,
0.4394427, -0.109673, 1.63079, 0.05098039, 0, 1, 1,
0.444602, 0.1996749, 1.010794, 0.05490196, 0, 1, 1,
0.4475983, 1.169693, 0.5465537, 0.0627451, 0, 1, 1,
0.4525145, 0.7416703, 0.3300402, 0.06666667, 0, 1, 1,
0.4532043, -0.3132446, 3.171071, 0.07450981, 0, 1, 1,
0.4538444, -1.292845, 3.34249, 0.07843138, 0, 1, 1,
0.4563891, 0.2359118, 1.312767, 0.08627451, 0, 1, 1,
0.4588715, -1.375985, 3.99337, 0.09019608, 0, 1, 1,
0.469054, 0.5372241, -0.6900835, 0.09803922, 0, 1, 1,
0.4820099, -0.7631396, 0.1757658, 0.1058824, 0, 1, 1,
0.4860344, 1.749002, 1.151216, 0.1098039, 0, 1, 1,
0.4885479, 0.5003275, 2.268408, 0.1176471, 0, 1, 1,
0.494164, 0.5510778, 0.64431, 0.1215686, 0, 1, 1,
0.5008425, 0.02936986, 3.589752, 0.1294118, 0, 1, 1,
0.5088097, 0.9478951, 0.07342307, 0.1333333, 0, 1, 1,
0.5088829, 0.7171989, 0.3237031, 0.1411765, 0, 1, 1,
0.5092403, 0.1734609, 1.331557, 0.145098, 0, 1, 1,
0.5122375, 0.01083646, 1.031669, 0.1529412, 0, 1, 1,
0.5161858, 0.05104508, 1.982991, 0.1568628, 0, 1, 1,
0.5162572, -1.660981, 3.368832, 0.1647059, 0, 1, 1,
0.5186073, 1.234822, 1.393559, 0.1686275, 0, 1, 1,
0.5279996, 0.2028637, -0.07537214, 0.1764706, 0, 1, 1,
0.5290407, -2.70577, 3.164125, 0.1803922, 0, 1, 1,
0.5348077, -0.3504232, 1.244578, 0.1882353, 0, 1, 1,
0.5437732, 0.4465273, 1.719741, 0.1921569, 0, 1, 1,
0.5462587, 0.6090187, -0.1448043, 0.2, 0, 1, 1,
0.5483851, -0.8627785, 2.377236, 0.2078431, 0, 1, 1,
0.550016, 0.8453789, 2.271429, 0.2117647, 0, 1, 1,
0.5521133, 1.182355, 0.9623988, 0.2196078, 0, 1, 1,
0.5532202, 0.3639954, 1.351858, 0.2235294, 0, 1, 1,
0.5553492, 0.9433005, -0.06000567, 0.2313726, 0, 1, 1,
0.5557688, 1.640705, 1.14633, 0.2352941, 0, 1, 1,
0.5561838, 0.1351432, 0.5247915, 0.2431373, 0, 1, 1,
0.5573869, -0.5957304, 2.57202, 0.2470588, 0, 1, 1,
0.5584607, -0.7270979, 1.259739, 0.254902, 0, 1, 1,
0.558472, -2.189287, 2.83836, 0.2588235, 0, 1, 1,
0.5587996, -0.602586, 1.749915, 0.2666667, 0, 1, 1,
0.5588491, 1.105075, 1.062621, 0.2705882, 0, 1, 1,
0.5625998, 0.5518758, 0.9266871, 0.2784314, 0, 1, 1,
0.5627843, 0.9209243, 0.3094301, 0.282353, 0, 1, 1,
0.5630079, 1.927921, 1.347734, 0.2901961, 0, 1, 1,
0.5638208, -0.1050877, 1.419606, 0.2941177, 0, 1, 1,
0.5656075, 0.7862331, 1.004765, 0.3019608, 0, 1, 1,
0.567569, 0.4188515, 0.3772972, 0.3098039, 0, 1, 1,
0.5726298, -0.4715473, 1.526906, 0.3137255, 0, 1, 1,
0.5737579, -1.519983, 2.516217, 0.3215686, 0, 1, 1,
0.5764687, -2.026289, 2.62421, 0.3254902, 0, 1, 1,
0.5900918, -0.9848338, 1.390934, 0.3333333, 0, 1, 1,
0.5957163, -0.7340715, -0.2477112, 0.3372549, 0, 1, 1,
0.6058764, -1.271515, 1.063245, 0.345098, 0, 1, 1,
0.6133363, -0.1267143, 1.783165, 0.3490196, 0, 1, 1,
0.6180665, -1.029181, 0.5615733, 0.3568628, 0, 1, 1,
0.6202665, 0.47105, -1.759075, 0.3607843, 0, 1, 1,
0.622439, 0.9781287, -0.3534282, 0.3686275, 0, 1, 1,
0.6228298, -0.3539167, 1.408256, 0.372549, 0, 1, 1,
0.6533989, 0.4205498, -0.6000146, 0.3803922, 0, 1, 1,
0.653765, 0.2632719, 0.965935, 0.3843137, 0, 1, 1,
0.6554312, -0.8172761, 2.372964, 0.3921569, 0, 1, 1,
0.6565719, -0.571607, 1.821437, 0.3960784, 0, 1, 1,
0.657257, 0.9166831, 0.5532258, 0.4039216, 0, 1, 1,
0.6584251, 1.250119, 0.1043651, 0.4117647, 0, 1, 1,
0.6613597, -0.5386973, 1.195112, 0.4156863, 0, 1, 1,
0.6613896, 2.59528, 0.2710483, 0.4235294, 0, 1, 1,
0.6672829, 0.2715108, 0.6000499, 0.427451, 0, 1, 1,
0.6682682, -1.358408, 2.660519, 0.4352941, 0, 1, 1,
0.6776214, -0.6725796, 2.696718, 0.4392157, 0, 1, 1,
0.679739, 0.02660596, 0.3441388, 0.4470588, 0, 1, 1,
0.6799408, -0.08878332, 1.896371, 0.4509804, 0, 1, 1,
0.679942, 0.2727681, 0.8165197, 0.4588235, 0, 1, 1,
0.6804907, -1.165053, 3.72757, 0.4627451, 0, 1, 1,
0.6852699, 0.9189525, 0.8150379, 0.4705882, 0, 1, 1,
0.6858317, -0.2913809, 3.361496, 0.4745098, 0, 1, 1,
0.6864978, -1.377055, 3.066973, 0.4823529, 0, 1, 1,
0.6867503, -1.168477, 3.597515, 0.4862745, 0, 1, 1,
0.6906759, 0.7206187, 1.202836, 0.4941176, 0, 1, 1,
0.6918625, 0.7056673, 1.412317, 0.5019608, 0, 1, 1,
0.6988388, 0.8135232, 1.537706, 0.5058824, 0, 1, 1,
0.7027414, -0.8020558, 2.971621, 0.5137255, 0, 1, 1,
0.7032855, -1.099483, 0.3150024, 0.5176471, 0, 1, 1,
0.709045, -0.6507232, 1.718516, 0.5254902, 0, 1, 1,
0.7113161, 1.187184, 0.9982091, 0.5294118, 0, 1, 1,
0.7136284, 0.939831, 0.5193563, 0.5372549, 0, 1, 1,
0.7142288, 0.8432671, 1.364573, 0.5411765, 0, 1, 1,
0.7299538, -0.06058809, 0.8194898, 0.5490196, 0, 1, 1,
0.732817, -1.021364, 3.147012, 0.5529412, 0, 1, 1,
0.7345869, 0.1024258, 0.975723, 0.5607843, 0, 1, 1,
0.7451996, -0.2980109, 3.285338, 0.5647059, 0, 1, 1,
0.7483788, -0.1563546, 2.301957, 0.572549, 0, 1, 1,
0.7527653, 0.2985567, 1.659179, 0.5764706, 0, 1, 1,
0.7541828, 0.7322773, 1.377879, 0.5843138, 0, 1, 1,
0.7585927, -0.9033054, 2.461779, 0.5882353, 0, 1, 1,
0.7613435, 0.4471516, 1.332276, 0.5960785, 0, 1, 1,
0.7616658, -0.4286159, 1.185648, 0.6039216, 0, 1, 1,
0.7650684, 0.6479452, 0.5763949, 0.6078432, 0, 1, 1,
0.7711356, -0.9353208, 2.890634, 0.6156863, 0, 1, 1,
0.7713172, 0.9016196, 2.408738, 0.6196079, 0, 1, 1,
0.7714835, 0.0340554, 4.18713, 0.627451, 0, 1, 1,
0.774576, -0.6155421, 2.066911, 0.6313726, 0, 1, 1,
0.7750388, -0.8859675, -0.06669775, 0.6392157, 0, 1, 1,
0.7752767, 0.1620495, 2.057854, 0.6431373, 0, 1, 1,
0.7762117, -0.2562161, 2.490644, 0.6509804, 0, 1, 1,
0.7767308, 1.514268, -0.138006, 0.654902, 0, 1, 1,
0.7774687, -1.417665, 4.357129, 0.6627451, 0, 1, 1,
0.7864514, -1.647718, 2.589267, 0.6666667, 0, 1, 1,
0.7886673, -0.3084525, 2.078885, 0.6745098, 0, 1, 1,
0.7897803, 0.8488563, -0.6106792, 0.6784314, 0, 1, 1,
0.7939819, 0.3079804, 0.585987, 0.6862745, 0, 1, 1,
0.7940766, -0.352177, 3.372571, 0.6901961, 0, 1, 1,
0.805721, 0.8478552, -0.1240495, 0.6980392, 0, 1, 1,
0.819477, -0.1147537, 1.851229, 0.7058824, 0, 1, 1,
0.8197851, 0.2002646, 1.597838, 0.7098039, 0, 1, 1,
0.8246995, 0.06658307, 1.560577, 0.7176471, 0, 1, 1,
0.837103, -0.02071184, 3.123985, 0.7215686, 0, 1, 1,
0.8379359, -1.363794, 1.59388, 0.7294118, 0, 1, 1,
0.8399742, 1.482524, 1.08916, 0.7333333, 0, 1, 1,
0.8412685, -1.559771, 3.316745, 0.7411765, 0, 1, 1,
0.8487727, 1.474214, 3.116003, 0.7450981, 0, 1, 1,
0.8501824, 1.63004, 2.245574, 0.7529412, 0, 1, 1,
0.853222, 0.6730345, 1.589123, 0.7568628, 0, 1, 1,
0.8540549, 0.2373101, 1.448473, 0.7647059, 0, 1, 1,
0.8564953, 0.09479127, 1.179179, 0.7686275, 0, 1, 1,
0.8585882, -1.122889, 3.924574, 0.7764706, 0, 1, 1,
0.8632687, -1.078711, 4.096661, 0.7803922, 0, 1, 1,
0.8639274, -1.791921, 3.238806, 0.7882353, 0, 1, 1,
0.8663534, 2.197006, -0.6236387, 0.7921569, 0, 1, 1,
0.8680533, -1.353757, 3.279693, 0.8, 0, 1, 1,
0.8711991, -1.029124, 3.441943, 0.8078431, 0, 1, 1,
0.8758443, 0.7084774, -0.3015324, 0.8117647, 0, 1, 1,
0.880406, 1.249629, 1.285741, 0.8196079, 0, 1, 1,
0.8817561, 0.5218807, 1.194452, 0.8235294, 0, 1, 1,
0.8977923, -2.577777, 3.787712, 0.8313726, 0, 1, 1,
0.8983766, -1.313659, 2.8129, 0.8352941, 0, 1, 1,
0.9061267, -0.8958932, 2.704037, 0.8431373, 0, 1, 1,
0.907107, -0.3843876, 0.6349591, 0.8470588, 0, 1, 1,
0.9104272, 0.8426677, 0.9429718, 0.854902, 0, 1, 1,
0.9105752, 0.6743656, -0.3203194, 0.8588235, 0, 1, 1,
0.9126015, -0.4393633, 3.694748, 0.8666667, 0, 1, 1,
0.9130124, -1.526083, 2.433789, 0.8705882, 0, 1, 1,
0.9157795, 0.2058948, 2.083887, 0.8784314, 0, 1, 1,
0.9183232, 0.6267596, 0.9734405, 0.8823529, 0, 1, 1,
0.9198373, 0.2171727, 3.004943, 0.8901961, 0, 1, 1,
0.9225945, -1.379904, 1.160283, 0.8941177, 0, 1, 1,
0.9231706, 1.07092, 1.238959, 0.9019608, 0, 1, 1,
0.9243026, -1.367627, 2.740569, 0.9098039, 0, 1, 1,
0.926155, 1.373767, 0.5246183, 0.9137255, 0, 1, 1,
0.928915, 0.6453536, -0.3832123, 0.9215686, 0, 1, 1,
0.9393285, -0.607639, 2.66201, 0.9254902, 0, 1, 1,
0.9454579, 0.1782002, 3.477242, 0.9333333, 0, 1, 1,
0.9541439, 0.9869002, 1.244673, 0.9372549, 0, 1, 1,
0.9552858, 1.016659, 1.108432, 0.945098, 0, 1, 1,
0.9609067, -0.4927246, 2.534148, 0.9490196, 0, 1, 1,
0.9614336, 0.4615856, 0.3721503, 0.9568627, 0, 1, 1,
0.9654331, 0.1739705, 0.846379, 0.9607843, 0, 1, 1,
0.9719102, -0.08817528, 0.7048185, 0.9686275, 0, 1, 1,
0.9841045, -0.3957259, 2.461943, 0.972549, 0, 1, 1,
0.9847978, 1.44231, 1.358692, 0.9803922, 0, 1, 1,
0.9876995, 0.4497903, 1.401106, 0.9843137, 0, 1, 1,
0.9884136, -1.482377, 3.867846, 0.9921569, 0, 1, 1,
0.9908592, -0.7643179, 2.289041, 0.9960784, 0, 1, 1,
1.006103, -0.5561063, -0.5089071, 1, 0, 0.9960784, 1,
1.021819, -0.502786, 3.32812, 1, 0, 0.9882353, 1,
1.025245, -1.484147, 2.594849, 1, 0, 0.9843137, 1,
1.025454, -1.258872, 4.205456, 1, 0, 0.9764706, 1,
1.0265, 0.4115287, 1.684086, 1, 0, 0.972549, 1,
1.033068, -0.1495582, 1.875682, 1, 0, 0.9647059, 1,
1.033195, 1.959154, -0.09835149, 1, 0, 0.9607843, 1,
1.044511, 1.262055, -0.6823108, 1, 0, 0.9529412, 1,
1.046207, -0.3097993, 2.006946, 1, 0, 0.9490196, 1,
1.051043, -1.576535, 0.7379081, 1, 0, 0.9411765, 1,
1.055835, 0.1770938, 1.179137, 1, 0, 0.9372549, 1,
1.061907, -1.30332, 5.388369, 1, 0, 0.9294118, 1,
1.066106, 1.056351, 0.7574428, 1, 0, 0.9254902, 1,
1.070548, 0.1275653, 2.370435, 1, 0, 0.9176471, 1,
1.075383, -0.3192414, 1.306669, 1, 0, 0.9137255, 1,
1.081497, 0.5012712, 1.234023, 1, 0, 0.9058824, 1,
1.084302, 0.9938163, 0.6229149, 1, 0, 0.9019608, 1,
1.087167, 0.03633388, 2.508587, 1, 0, 0.8941177, 1,
1.087291, 0.286686, 2.510222, 1, 0, 0.8862745, 1,
1.089597, -0.3721623, 2.304391, 1, 0, 0.8823529, 1,
1.091221, 0.5416564, 0.2949889, 1, 0, 0.8745098, 1,
1.098726, -0.488121, 0.7172931, 1, 0, 0.8705882, 1,
1.114988, -1.008802, 2.893618, 1, 0, 0.8627451, 1,
1.116015, 0.6700506, 1.24669, 1, 0, 0.8588235, 1,
1.117168, -1.185551, 0.4845955, 1, 0, 0.8509804, 1,
1.120239, -0.07134157, 2.56684, 1, 0, 0.8470588, 1,
1.120591, 0.4841305, -0.1876759, 1, 0, 0.8392157, 1,
1.129093, -0.427937, 2.589535, 1, 0, 0.8352941, 1,
1.133804, 3.405991, -1.837926, 1, 0, 0.827451, 1,
1.135574, -0.9226908, 2.206939, 1, 0, 0.8235294, 1,
1.149562, -0.2630421, 2.968405, 1, 0, 0.8156863, 1,
1.161877, -1.382934, 3.252239, 1, 0, 0.8117647, 1,
1.163004, 0.6394819, 1.299601, 1, 0, 0.8039216, 1,
1.164344, -1.102778, 0.7259192, 1, 0, 0.7960784, 1,
1.166695, 1.149425, -0.1212638, 1, 0, 0.7921569, 1,
1.173193, 0.2138387, 0.1521535, 1, 0, 0.7843137, 1,
1.176518, -0.7045667, 3.475915, 1, 0, 0.7803922, 1,
1.176636, 0.1480516, 2.23284, 1, 0, 0.772549, 1,
1.179143, -0.08586863, 1.766937, 1, 0, 0.7686275, 1,
1.18094, -0.6315166, 1.426056, 1, 0, 0.7607843, 1,
1.182088, 1.529822, -2.074298, 1, 0, 0.7568628, 1,
1.19399, 0.5865383, 1.751264, 1, 0, 0.7490196, 1,
1.19944, 0.1596928, 2.629943, 1, 0, 0.7450981, 1,
1.212156, -1.59096, 0.8413587, 1, 0, 0.7372549, 1,
1.213831, -0.2832411, 3.131103, 1, 0, 0.7333333, 1,
1.21436, -0.2798307, 1.11987, 1, 0, 0.7254902, 1,
1.218169, -0.01694834, 1.33032, 1, 0, 0.7215686, 1,
1.218698, -2.601861, 1.415753, 1, 0, 0.7137255, 1,
1.218851, -0.23297, 1.997708, 1, 0, 0.7098039, 1,
1.223686, 0.4414836, 0.928031, 1, 0, 0.7019608, 1,
1.224314, -1.436279, 3.494473, 1, 0, 0.6941177, 1,
1.225836, -1.017035, 3.039558, 1, 0, 0.6901961, 1,
1.23354, 0.06349117, 3.06632, 1, 0, 0.682353, 1,
1.237438, 0.4317372, 0.10997, 1, 0, 0.6784314, 1,
1.251666, -0.2279244, 1.990199, 1, 0, 0.6705883, 1,
1.252735, 0.3333438, 1.480787, 1, 0, 0.6666667, 1,
1.263282, 0.2205706, 0.9953356, 1, 0, 0.6588235, 1,
1.267419, -0.1568279, 2.158036, 1, 0, 0.654902, 1,
1.284503, -0.262763, 0.4760655, 1, 0, 0.6470588, 1,
1.286332, -0.8854058, 1.171759, 1, 0, 0.6431373, 1,
1.294459, -0.1695063, 1.577025, 1, 0, 0.6352941, 1,
1.2957, 0.01169211, 1.806326, 1, 0, 0.6313726, 1,
1.299187, 0.1999972, 0.9704526, 1, 0, 0.6235294, 1,
1.312715, 0.2152172, 1.27479, 1, 0, 0.6196079, 1,
1.314731, 1.340748, 0.01275271, 1, 0, 0.6117647, 1,
1.318874, -0.8300539, 2.169676, 1, 0, 0.6078432, 1,
1.325204, 1.571955, 0.8909926, 1, 0, 0.6, 1,
1.328248, 2.203262, 2.298627, 1, 0, 0.5921569, 1,
1.337219, 0.1280506, 1.879108, 1, 0, 0.5882353, 1,
1.342834, -0.8561253, -0.4155346, 1, 0, 0.5803922, 1,
1.350798, 0.205467, 2.460152, 1, 0, 0.5764706, 1,
1.352644, -1.031877, 3.690021, 1, 0, 0.5686275, 1,
1.353379, -0.9150851, 1.419802, 1, 0, 0.5647059, 1,
1.354212, 0.8829645, -0.4639947, 1, 0, 0.5568628, 1,
1.358416, 0.02165182, 1.96543, 1, 0, 0.5529412, 1,
1.367283, -1.091443, 2.417315, 1, 0, 0.5450981, 1,
1.37579, 0.8719265, 2.04188, 1, 0, 0.5411765, 1,
1.379886, 0.6697312, 1.425497, 1, 0, 0.5333334, 1,
1.384098, 0.2697772, 0.7358634, 1, 0, 0.5294118, 1,
1.404852, -0.215142, 1.967117, 1, 0, 0.5215687, 1,
1.405248, -0.9667118, 2.523051, 1, 0, 0.5176471, 1,
1.410865, 0.2399077, 0.1265045, 1, 0, 0.509804, 1,
1.42019, -0.2877157, 2.083828, 1, 0, 0.5058824, 1,
1.421883, 0.1134305, 1.13547, 1, 0, 0.4980392, 1,
1.425595, -1.029462, 2.264786, 1, 0, 0.4901961, 1,
1.43252, 0.3209334, 1.212634, 1, 0, 0.4862745, 1,
1.437551, 0.04209491, 2.721298, 1, 0, 0.4784314, 1,
1.439499, 0.8922725, 0.3302715, 1, 0, 0.4745098, 1,
1.442441, 0.7090747, 1.653534, 1, 0, 0.4666667, 1,
1.444694, 1.000042, 0.8527692, 1, 0, 0.4627451, 1,
1.446894, 0.8209311, 3.825913, 1, 0, 0.454902, 1,
1.44832, 0.4398611, 1.710355, 1, 0, 0.4509804, 1,
1.460963, 0.2551723, -0.2198389, 1, 0, 0.4431373, 1,
1.470098, -0.4657794, 2.630415, 1, 0, 0.4392157, 1,
1.47731, 0.7598652, 1.456752, 1, 0, 0.4313726, 1,
1.47902, 0.5844493, 3.125772, 1, 0, 0.427451, 1,
1.487804, 1.761813, 2.013603, 1, 0, 0.4196078, 1,
1.519347, 0.2647985, 1.208409, 1, 0, 0.4156863, 1,
1.520331, 0.3610441, 2.395715, 1, 0, 0.4078431, 1,
1.527291, -0.9144224, 0.7814979, 1, 0, 0.4039216, 1,
1.53195, 0.06384798, 2.40842, 1, 0, 0.3960784, 1,
1.537043, -0.8613331, 2.475893, 1, 0, 0.3882353, 1,
1.540926, 0.2231283, 1.430366, 1, 0, 0.3843137, 1,
1.544426, 1.12259, 1.262696, 1, 0, 0.3764706, 1,
1.547398, 0.446679, -0.3065757, 1, 0, 0.372549, 1,
1.574187, 0.117585, 2.237043, 1, 0, 0.3647059, 1,
1.57777, -0.5760617, 0.4366165, 1, 0, 0.3607843, 1,
1.583642, -1.832959, 2.852271, 1, 0, 0.3529412, 1,
1.58383, 1.06675, 0.5206719, 1, 0, 0.3490196, 1,
1.59406, 0.1250601, 0.9821708, 1, 0, 0.3411765, 1,
1.601599, -0.4995466, 0.7717395, 1, 0, 0.3372549, 1,
1.602438, -2.412566, 3.483227, 1, 0, 0.3294118, 1,
1.610367, -0.3778321, 2.595973, 1, 0, 0.3254902, 1,
1.626628, -0.890779, 0.2257706, 1, 0, 0.3176471, 1,
1.634563, -0.6697198, 0.9932455, 1, 0, 0.3137255, 1,
1.638877, -0.2296795, 4.016829, 1, 0, 0.3058824, 1,
1.669993, -1.025998, 3.301253, 1, 0, 0.2980392, 1,
1.670145, -2.680005, 3.75278, 1, 0, 0.2941177, 1,
1.675099, 0.7200134, -1.055026, 1, 0, 0.2862745, 1,
1.68759, -1.350985, 2.263714, 1, 0, 0.282353, 1,
1.687893, 0.2299515, 1.242939, 1, 0, 0.2745098, 1,
1.736189, -0.8863131, 2.561273, 1, 0, 0.2705882, 1,
1.739372, -0.5388913, 0.9738256, 1, 0, 0.2627451, 1,
1.744509, 0.1487744, 1.179257, 1, 0, 0.2588235, 1,
1.754706, 0.7870599, 1.707136, 1, 0, 0.2509804, 1,
1.762451, 1.407759, 0.6311132, 1, 0, 0.2470588, 1,
1.773706, -1.14636, 1.924406, 1, 0, 0.2392157, 1,
1.777695, 0.6257826, 0.7638577, 1, 0, 0.2352941, 1,
1.807948, -0.1098398, 2.091242, 1, 0, 0.227451, 1,
1.811363, -0.309926, 2.077232, 1, 0, 0.2235294, 1,
1.815188, -0.2051292, 2.496021, 1, 0, 0.2156863, 1,
1.824371, 0.8537498, 1.269723, 1, 0, 0.2117647, 1,
1.834057, 0.4046735, 1.509343, 1, 0, 0.2039216, 1,
1.83673, 0.1104029, 2.271622, 1, 0, 0.1960784, 1,
1.84408, 0.278254, 2.285718, 1, 0, 0.1921569, 1,
1.867503, -0.7252112, 2.134309, 1, 0, 0.1843137, 1,
1.908551, 0.3310132, 2.070366, 1, 0, 0.1803922, 1,
1.909398, 0.161116, 0.6898026, 1, 0, 0.172549, 1,
1.91275, -1.216364, 0.928993, 1, 0, 0.1686275, 1,
1.933625, 0.09591665, 1.256787, 1, 0, 0.1607843, 1,
1.94279, 1.804974, 1.355701, 1, 0, 0.1568628, 1,
1.946694, -0.04011024, 1.248884, 1, 0, 0.1490196, 1,
2.024369, 0.5892947, 1.977918, 1, 0, 0.145098, 1,
2.053358, -0.5242752, 3.474498, 1, 0, 0.1372549, 1,
2.056799, -1.886534, 2.481352, 1, 0, 0.1333333, 1,
2.07125, 0.8608436, 1.445301, 1, 0, 0.1254902, 1,
2.093143, 1.237213, -0.607051, 1, 0, 0.1215686, 1,
2.133182, 1.132094, 1.240119, 1, 0, 0.1137255, 1,
2.200657, 0.4264969, 0.8350657, 1, 0, 0.1098039, 1,
2.22611, -0.7817711, 1.487225, 1, 0, 0.1019608, 1,
2.24278, 0.1370013, 2.076247, 1, 0, 0.09411765, 1,
2.272023, -0.6905686, -0.09152702, 1, 0, 0.09019608, 1,
2.306231, 0.629838, 1.361448, 1, 0, 0.08235294, 1,
2.351368, 0.76701, 2.790192, 1, 0, 0.07843138, 1,
2.413025, -0.8287891, 1.450107, 1, 0, 0.07058824, 1,
2.433964, 1.690417, 0.9824298, 1, 0, 0.06666667, 1,
2.453327, 1.253664, 3.422935, 1, 0, 0.05882353, 1,
2.529894, 0.8337596, -0.08158115, 1, 0, 0.05490196, 1,
2.533286, 1.663954, 1.704984, 1, 0, 0.04705882, 1,
2.539405, -1.184506, 2.26707, 1, 0, 0.04313726, 1,
2.571288, 0.2948793, 0.8506369, 1, 0, 0.03529412, 1,
2.57973, -0.392575, 2.365748, 1, 0, 0.03137255, 1,
2.636505, 2.182726, 0.505819, 1, 0, 0.02352941, 1,
2.862424, 1.255068, 1.586293, 1, 0, 0.01960784, 1,
2.870395, 0.07759345, 2.431079, 1, 0, 0.01176471, 1,
3.001803, -0.6609297, 0.7180707, 1, 0, 0.007843138, 1
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
-0.1776479, -4.662829, -6.877917, 0, -0.5, 0.5, 0.5,
-0.1776479, -4.662829, -6.877917, 1, -0.5, 0.5, 0.5,
-0.1776479, -4.662829, -6.877917, 1, 1.5, 0.5, 0.5,
-0.1776479, -4.662829, -6.877917, 0, 1.5, 0.5, 0.5
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
-4.434933, -0.04369712, -6.877917, 0, -0.5, 0.5, 0.5,
-4.434933, -0.04369712, -6.877917, 1, -0.5, 0.5, 0.5,
-4.434933, -0.04369712, -6.877917, 1, 1.5, 0.5, 0.5,
-4.434933, -0.04369712, -6.877917, 0, 1.5, 0.5, 0.5
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
-4.434933, -4.662829, 0.1441252, 0, -0.5, 0.5, 0.5,
-4.434933, -4.662829, 0.1441252, 1, -0.5, 0.5, 0.5,
-4.434933, -4.662829, 0.1441252, 1, 1.5, 0.5, 0.5,
-4.434933, -4.662829, 0.1441252, 0, 1.5, 0.5, 0.5
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
-3, -3.596876, -5.257446,
3, -3.596876, -5.257446,
-3, -3.596876, -5.257446,
-3, -3.774535, -5.527524,
-2, -3.596876, -5.257446,
-2, -3.774535, -5.527524,
-1, -3.596876, -5.257446,
-1, -3.774535, -5.527524,
0, -3.596876, -5.257446,
0, -3.774535, -5.527524,
1, -3.596876, -5.257446,
1, -3.774535, -5.527524,
2, -3.596876, -5.257446,
2, -3.774535, -5.527524,
3, -3.596876, -5.257446,
3, -3.774535, -5.527524
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
-3, -4.129852, -6.067682, 0, -0.5, 0.5, 0.5,
-3, -4.129852, -6.067682, 1, -0.5, 0.5, 0.5,
-3, -4.129852, -6.067682, 1, 1.5, 0.5, 0.5,
-3, -4.129852, -6.067682, 0, 1.5, 0.5, 0.5,
-2, -4.129852, -6.067682, 0, -0.5, 0.5, 0.5,
-2, -4.129852, -6.067682, 1, -0.5, 0.5, 0.5,
-2, -4.129852, -6.067682, 1, 1.5, 0.5, 0.5,
-2, -4.129852, -6.067682, 0, 1.5, 0.5, 0.5,
-1, -4.129852, -6.067682, 0, -0.5, 0.5, 0.5,
-1, -4.129852, -6.067682, 1, -0.5, 0.5, 0.5,
-1, -4.129852, -6.067682, 1, 1.5, 0.5, 0.5,
-1, -4.129852, -6.067682, 0, 1.5, 0.5, 0.5,
0, -4.129852, -6.067682, 0, -0.5, 0.5, 0.5,
0, -4.129852, -6.067682, 1, -0.5, 0.5, 0.5,
0, -4.129852, -6.067682, 1, 1.5, 0.5, 0.5,
0, -4.129852, -6.067682, 0, 1.5, 0.5, 0.5,
1, -4.129852, -6.067682, 0, -0.5, 0.5, 0.5,
1, -4.129852, -6.067682, 1, -0.5, 0.5, 0.5,
1, -4.129852, -6.067682, 1, 1.5, 0.5, 0.5,
1, -4.129852, -6.067682, 0, 1.5, 0.5, 0.5,
2, -4.129852, -6.067682, 0, -0.5, 0.5, 0.5,
2, -4.129852, -6.067682, 1, -0.5, 0.5, 0.5,
2, -4.129852, -6.067682, 1, 1.5, 0.5, 0.5,
2, -4.129852, -6.067682, 0, 1.5, 0.5, 0.5,
3, -4.129852, -6.067682, 0, -0.5, 0.5, 0.5,
3, -4.129852, -6.067682, 1, -0.5, 0.5, 0.5,
3, -4.129852, -6.067682, 1, 1.5, 0.5, 0.5,
3, -4.129852, -6.067682, 0, 1.5, 0.5, 0.5
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
-3.452483, -3, -5.257446,
-3.452483, 3, -5.257446,
-3.452483, -3, -5.257446,
-3.616224, -3, -5.527524,
-3.452483, -2, -5.257446,
-3.616224, -2, -5.527524,
-3.452483, -1, -5.257446,
-3.616224, -1, -5.527524,
-3.452483, 0, -5.257446,
-3.616224, 0, -5.527524,
-3.452483, 1, -5.257446,
-3.616224, 1, -5.527524,
-3.452483, 2, -5.257446,
-3.616224, 2, -5.527524,
-3.452483, 3, -5.257446,
-3.616224, 3, -5.527524
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
-3.943708, -3, -6.067682, 0, -0.5, 0.5, 0.5,
-3.943708, -3, -6.067682, 1, -0.5, 0.5, 0.5,
-3.943708, -3, -6.067682, 1, 1.5, 0.5, 0.5,
-3.943708, -3, -6.067682, 0, 1.5, 0.5, 0.5,
-3.943708, -2, -6.067682, 0, -0.5, 0.5, 0.5,
-3.943708, -2, -6.067682, 1, -0.5, 0.5, 0.5,
-3.943708, -2, -6.067682, 1, 1.5, 0.5, 0.5,
-3.943708, -2, -6.067682, 0, 1.5, 0.5, 0.5,
-3.943708, -1, -6.067682, 0, -0.5, 0.5, 0.5,
-3.943708, -1, -6.067682, 1, -0.5, 0.5, 0.5,
-3.943708, -1, -6.067682, 1, 1.5, 0.5, 0.5,
-3.943708, -1, -6.067682, 0, 1.5, 0.5, 0.5,
-3.943708, 0, -6.067682, 0, -0.5, 0.5, 0.5,
-3.943708, 0, -6.067682, 1, -0.5, 0.5, 0.5,
-3.943708, 0, -6.067682, 1, 1.5, 0.5, 0.5,
-3.943708, 0, -6.067682, 0, 1.5, 0.5, 0.5,
-3.943708, 1, -6.067682, 0, -0.5, 0.5, 0.5,
-3.943708, 1, -6.067682, 1, -0.5, 0.5, 0.5,
-3.943708, 1, -6.067682, 1, 1.5, 0.5, 0.5,
-3.943708, 1, -6.067682, 0, 1.5, 0.5, 0.5,
-3.943708, 2, -6.067682, 0, -0.5, 0.5, 0.5,
-3.943708, 2, -6.067682, 1, -0.5, 0.5, 0.5,
-3.943708, 2, -6.067682, 1, 1.5, 0.5, 0.5,
-3.943708, 2, -6.067682, 0, 1.5, 0.5, 0.5,
-3.943708, 3, -6.067682, 0, -0.5, 0.5, 0.5,
-3.943708, 3, -6.067682, 1, -0.5, 0.5, 0.5,
-3.943708, 3, -6.067682, 1, 1.5, 0.5, 0.5,
-3.943708, 3, -6.067682, 0, 1.5, 0.5, 0.5
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
-3.452483, -3.596876, -4,
-3.452483, -3.596876, 4,
-3.452483, -3.596876, -4,
-3.616224, -3.774535, -4,
-3.452483, -3.596876, -2,
-3.616224, -3.774535, -2,
-3.452483, -3.596876, 0,
-3.616224, -3.774535, 0,
-3.452483, -3.596876, 2,
-3.616224, -3.774535, 2,
-3.452483, -3.596876, 4,
-3.616224, -3.774535, 4
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
-3.943708, -4.129852, -4, 0, -0.5, 0.5, 0.5,
-3.943708, -4.129852, -4, 1, -0.5, 0.5, 0.5,
-3.943708, -4.129852, -4, 1, 1.5, 0.5, 0.5,
-3.943708, -4.129852, -4, 0, 1.5, 0.5, 0.5,
-3.943708, -4.129852, -2, 0, -0.5, 0.5, 0.5,
-3.943708, -4.129852, -2, 1, -0.5, 0.5, 0.5,
-3.943708, -4.129852, -2, 1, 1.5, 0.5, 0.5,
-3.943708, -4.129852, -2, 0, 1.5, 0.5, 0.5,
-3.943708, -4.129852, 0, 0, -0.5, 0.5, 0.5,
-3.943708, -4.129852, 0, 1, -0.5, 0.5, 0.5,
-3.943708, -4.129852, 0, 1, 1.5, 0.5, 0.5,
-3.943708, -4.129852, 0, 0, 1.5, 0.5, 0.5,
-3.943708, -4.129852, 2, 0, -0.5, 0.5, 0.5,
-3.943708, -4.129852, 2, 1, -0.5, 0.5, 0.5,
-3.943708, -4.129852, 2, 1, 1.5, 0.5, 0.5,
-3.943708, -4.129852, 2, 0, 1.5, 0.5, 0.5,
-3.943708, -4.129852, 4, 0, -0.5, 0.5, 0.5,
-3.943708, -4.129852, 4, 1, -0.5, 0.5, 0.5,
-3.943708, -4.129852, 4, 1, 1.5, 0.5, 0.5,
-3.943708, -4.129852, 4, 0, 1.5, 0.5, 0.5
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
-3.452483, -3.596876, -5.257446,
-3.452483, 3.509481, -5.257446,
-3.452483, -3.596876, 5.545696,
-3.452483, 3.509481, 5.545696,
-3.452483, -3.596876, -5.257446,
-3.452483, -3.596876, 5.545696,
-3.452483, 3.509481, -5.257446,
-3.452483, 3.509481, 5.545696,
-3.452483, -3.596876, -5.257446,
3.097187, -3.596876, -5.257446,
-3.452483, -3.596876, 5.545696,
3.097187, -3.596876, 5.545696,
-3.452483, 3.509481, -5.257446,
3.097187, 3.509481, -5.257446,
-3.452483, 3.509481, 5.545696,
3.097187, 3.509481, 5.545696,
3.097187, -3.596876, -5.257446,
3.097187, 3.509481, -5.257446,
3.097187, -3.596876, 5.545696,
3.097187, 3.509481, 5.545696,
3.097187, -3.596876, -5.257446,
3.097187, -3.596876, 5.545696,
3.097187, 3.509481, -5.257446,
3.097187, 3.509481, 5.545696
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
var radius = 7.740073;
var distance = 34.43646;
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
mvMatrix.translate( 0.1776479, 0.04369712, -0.1441252 );
mvMatrix.scale( 1.277732, 1.177638, 0.774656 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.43646);
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
Formetanate_hydrochl<-read.table("Formetanate_hydrochl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Formetanate_hydrochl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Formetanate_hydrochl' not found
```

```r
y<-Formetanate_hydrochl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Formetanate_hydrochl' not found
```

```r
z<-Formetanate_hydrochl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Formetanate_hydrochl' not found
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
-3.357099, 0.4667026, -1.732335, 0, 0, 1, 1, 1,
-3.102603, 1.946422, -0.9581221, 1, 0, 0, 1, 1,
-2.991087, -0.5563239, -1.729282, 1, 0, 0, 1, 1,
-2.867421, 1.099041, -1.549671, 1, 0, 0, 1, 1,
-2.74171, -1.043073, -2.106358, 1, 0, 0, 1, 1,
-2.727763, -0.2951868, -1.586474, 1, 0, 0, 1, 1,
-2.66665, 0.6464156, -2.386819, 0, 0, 0, 1, 1,
-2.612831, 0.1534463, -1.759468, 0, 0, 0, 1, 1,
-2.485379, -1.697924, -1.790523, 0, 0, 0, 1, 1,
-2.339154, -0.2891865, -0.1818219, 0, 0, 0, 1, 1,
-2.306945, -0.2315249, -0.4496356, 0, 0, 0, 1, 1,
-2.303689, 2.297163, -1.854828, 0, 0, 0, 1, 1,
-2.237946, 0.7807038, -1.475978, 0, 0, 0, 1, 1,
-2.162448, -0.4343103, -2.584233, 1, 1, 1, 1, 1,
-2.135342, -0.7589905, -2.084066, 1, 1, 1, 1, 1,
-2.106962, -0.6977228, -3.240463, 1, 1, 1, 1, 1,
-2.102738, 0.6675155, -2.303897, 1, 1, 1, 1, 1,
-2.07574, 0.75117, 0.2323001, 1, 1, 1, 1, 1,
-2.008158, 0.1521816, -1.752514, 1, 1, 1, 1, 1,
-1.980906, -0.6502759, -2.270488, 1, 1, 1, 1, 1,
-1.978588, 0.09147218, -2.112585, 1, 1, 1, 1, 1,
-1.974727, -0.3220868, -2.781061, 1, 1, 1, 1, 1,
-1.96116, -0.003784684, -1.530198, 1, 1, 1, 1, 1,
-1.94342, 0.112301, -2.072548, 1, 1, 1, 1, 1,
-1.909151, -0.5825559, -2.763752, 1, 1, 1, 1, 1,
-1.905072, -1.333529, -2.043176, 1, 1, 1, 1, 1,
-1.878856, -0.7134116, -2.138878, 1, 1, 1, 1, 1,
-1.873674, -0.004141606, -0.284089, 1, 1, 1, 1, 1,
-1.870615, 0.5768306, -1.169217, 0, 0, 1, 1, 1,
-1.854867, 0.1363729, -1.787094, 1, 0, 0, 1, 1,
-1.833013, 0.7377673, 0.298465, 1, 0, 0, 1, 1,
-1.819998, 1.846189, -0.9764881, 1, 0, 0, 1, 1,
-1.814418, 0.5025924, -1.912612, 1, 0, 0, 1, 1,
-1.781089, 0.2578962, -0.7387453, 1, 0, 0, 1, 1,
-1.772465, 0.8878747, -1.910167, 0, 0, 0, 1, 1,
-1.752068, -1.249588, -2.776918, 0, 0, 0, 1, 1,
-1.739979, 0.1478291, -0.775294, 0, 0, 0, 1, 1,
-1.733767, -1.24805, -1.787325, 0, 0, 0, 1, 1,
-1.718134, 0.05782644, -2.310632, 0, 0, 0, 1, 1,
-1.715853, 1.477695, 1.042785, 0, 0, 0, 1, 1,
-1.686191, 0.06603087, -2.91554, 0, 0, 0, 1, 1,
-1.659766, -0.5689282, -2.878732, 1, 1, 1, 1, 1,
-1.655212, -0.01032635, -0.9109102, 1, 1, 1, 1, 1,
-1.648169, -1.053411, -2.680872, 1, 1, 1, 1, 1,
-1.638315, 0.8091161, 0.08745635, 1, 1, 1, 1, 1,
-1.619524, -0.04933948, -0.5383071, 1, 1, 1, 1, 1,
-1.60493, 0.3593893, -0.4464694, 1, 1, 1, 1, 1,
-1.599865, 0.9195598, -1.631819, 1, 1, 1, 1, 1,
-1.591473, 0.9089275, -0.6202882, 1, 1, 1, 1, 1,
-1.590583, -0.7351789, -2.247694, 1, 1, 1, 1, 1,
-1.57623, 0.6522536, -0.7353141, 1, 1, 1, 1, 1,
-1.563749, 0.113355, -1.546067, 1, 1, 1, 1, 1,
-1.561984, -1.805206, -1.620529, 1, 1, 1, 1, 1,
-1.545572, 1.221686, 0.4086178, 1, 1, 1, 1, 1,
-1.538289, -1.688339, -2.753802, 1, 1, 1, 1, 1,
-1.534798, 1.059082, -0.454844, 1, 1, 1, 1, 1,
-1.524346, 0.2429576, -1.610351, 0, 0, 1, 1, 1,
-1.51287, 0.4283122, -0.4713624, 1, 0, 0, 1, 1,
-1.512085, 0.5524188, -0.1988481, 1, 0, 0, 1, 1,
-1.508042, 1.158181, 0.8284397, 1, 0, 0, 1, 1,
-1.506686, -0.935253, -2.020817, 1, 0, 0, 1, 1,
-1.475819, 0.2528782, -0.4796514, 1, 0, 0, 1, 1,
-1.474277, -0.5471221, -1.132385, 0, 0, 0, 1, 1,
-1.472222, -1.108963, -1.560649, 0, 0, 0, 1, 1,
-1.472194, 0.9521934, -1.273749, 0, 0, 0, 1, 1,
-1.461194, 1.273742, -0.4708267, 0, 0, 0, 1, 1,
-1.441529, 1.295733, -2.165612, 0, 0, 0, 1, 1,
-1.435991, 1.050067, -0.3499216, 0, 0, 0, 1, 1,
-1.408191, -1.054101, -1.255099, 0, 0, 0, 1, 1,
-1.393388, -1.171263, -3.391324, 1, 1, 1, 1, 1,
-1.392524, 0.9900271, -3.569731, 1, 1, 1, 1, 1,
-1.391762, -1.015998, -2.76956, 1, 1, 1, 1, 1,
-1.39063, 1.577084, -1.848094, 1, 1, 1, 1, 1,
-1.38794, -0.1309584, -2.387475, 1, 1, 1, 1, 1,
-1.385338, 1.643483, 0.5594069, 1, 1, 1, 1, 1,
-1.382773, 0.2305771, -2.237546, 1, 1, 1, 1, 1,
-1.37936, -0.02425629, -1.998191, 1, 1, 1, 1, 1,
-1.379246, 0.9364923, -1.469395, 1, 1, 1, 1, 1,
-1.375133, 0.2993492, -2.035233, 1, 1, 1, 1, 1,
-1.374843, -1.502057, -2.356008, 1, 1, 1, 1, 1,
-1.374566, -1.655943, -3.10171, 1, 1, 1, 1, 1,
-1.367063, -0.5808201, -1.037989, 1, 1, 1, 1, 1,
-1.356877, -2.045809, -2.265875, 1, 1, 1, 1, 1,
-1.355377, 0.9827056, -0.5911518, 1, 1, 1, 1, 1,
-1.35265, 1.805721, -0.765817, 0, 0, 1, 1, 1,
-1.350904, 0.2411462, -1.50712, 1, 0, 0, 1, 1,
-1.349988, 0.2629799, 0.2078322, 1, 0, 0, 1, 1,
-1.345842, 0.01035275, -1.896539, 1, 0, 0, 1, 1,
-1.339688, -1.468334, -2.720616, 1, 0, 0, 1, 1,
-1.339024, 0.4370849, -0.7577302, 1, 0, 0, 1, 1,
-1.336394, -1.528485, -0.1179098, 0, 0, 0, 1, 1,
-1.330215, 1.009308, -0.5898418, 0, 0, 0, 1, 1,
-1.325608, -0.3114707, -3.10054, 0, 0, 0, 1, 1,
-1.32302, -1.358556, -2.831852, 0, 0, 0, 1, 1,
-1.317206, -0.266691, -1.535426, 0, 0, 0, 1, 1,
-1.315478, -1.475847, -3.221733, 0, 0, 0, 1, 1,
-1.313716, 0.8987658, 0.5942848, 0, 0, 0, 1, 1,
-1.3069, -0.4892782, -2.516233, 1, 1, 1, 1, 1,
-1.298008, 1.142053, 0.5741196, 1, 1, 1, 1, 1,
-1.290551, 0.2990211, -1.281795, 1, 1, 1, 1, 1,
-1.281234, 1.582756, -0.408291, 1, 1, 1, 1, 1,
-1.279864, 0.2223584, -3.029398, 1, 1, 1, 1, 1,
-1.279359, -0.4939427, -1.887228, 1, 1, 1, 1, 1,
-1.271989, -0.8063845, -3.574751, 1, 1, 1, 1, 1,
-1.267705, 0.9811532, -2.607209, 1, 1, 1, 1, 1,
-1.264775, 0.4715309, 0.4959039, 1, 1, 1, 1, 1,
-1.256225, -0.3300582, 1.012353, 1, 1, 1, 1, 1,
-1.247004, -0.3369115, -2.547731, 1, 1, 1, 1, 1,
-1.238659, 0.01009012, -0.7765792, 1, 1, 1, 1, 1,
-1.233762, -1.630755, -2.869844, 1, 1, 1, 1, 1,
-1.232078, -0.708271, -3.172115, 1, 1, 1, 1, 1,
-1.231159, -0.2764506, -3.300911, 1, 1, 1, 1, 1,
-1.226216, -1.188444, -0.6840084, 0, 0, 1, 1, 1,
-1.21419, 0.0394698, -1.943282, 1, 0, 0, 1, 1,
-1.208337, 0.8237845, -1.479883, 1, 0, 0, 1, 1,
-1.20633, -1.107023, -1.322238, 1, 0, 0, 1, 1,
-1.20454, -1.752124, -4.146596, 1, 0, 0, 1, 1,
-1.198595, 1.479694, -1.352098, 1, 0, 0, 1, 1,
-1.195728, -0.904961, -4.196602, 0, 0, 0, 1, 1,
-1.194762, -0.3398177, -1.917748, 0, 0, 0, 1, 1,
-1.194378, -1.355783, -2.152262, 0, 0, 0, 1, 1,
-1.19331, 1.342509, -0.7726926, 0, 0, 0, 1, 1,
-1.192346, 0.2441735, -1.544613, 0, 0, 0, 1, 1,
-1.184444, -0.4371575, -3.449743, 0, 0, 0, 1, 1,
-1.168225, 1.019329, -1.217084, 0, 0, 0, 1, 1,
-1.167322, 0.2002845, -0.4562313, 1, 1, 1, 1, 1,
-1.15969, -0.648157, -3.107727, 1, 1, 1, 1, 1,
-1.156961, 0.3768536, -0.3164719, 1, 1, 1, 1, 1,
-1.148476, -0.2049025, -1.02234, 1, 1, 1, 1, 1,
-1.148139, 0.3739481, -1.425425, 1, 1, 1, 1, 1,
-1.146023, 0.3577612, -1.539506, 1, 1, 1, 1, 1,
-1.141458, -1.222496, -4.588753, 1, 1, 1, 1, 1,
-1.136742, 1.062706, 0.9189401, 1, 1, 1, 1, 1,
-1.13421, -0.5451124, -1.756897, 1, 1, 1, 1, 1,
-1.131984, 1.344513, -2.5596, 1, 1, 1, 1, 1,
-1.124761, -0.4677444, -1.825585, 1, 1, 1, 1, 1,
-1.114021, 0.7667823, 0.7651969, 1, 1, 1, 1, 1,
-1.113076, -1.107516, -2.183834, 1, 1, 1, 1, 1,
-1.113001, 1.433791, -1.46615, 1, 1, 1, 1, 1,
-1.08252, 0.9014302, -0.08997052, 1, 1, 1, 1, 1,
-1.082083, 0.8528793, 0.9552064, 0, 0, 1, 1, 1,
-1.080421, -1.085361, -4.370582, 1, 0, 0, 1, 1,
-1.078437, 0.3369533, -1.313449, 1, 0, 0, 1, 1,
-1.071142, 0.744111, -0.240638, 1, 0, 0, 1, 1,
-1.07012, -1.645332, -4.571046, 1, 0, 0, 1, 1,
-1.069508, -0.1742006, -0.2009192, 1, 0, 0, 1, 1,
-1.060049, 0.2032115, -0.4939757, 0, 0, 0, 1, 1,
-1.056933, 0.05095193, -1.606168, 0, 0, 0, 1, 1,
-1.051751, 1.544965, -1.013586, 0, 0, 0, 1, 1,
-1.041944, -1.61801, -4.44523, 0, 0, 0, 1, 1,
-1.040492, -1.402085, -2.450668, 0, 0, 0, 1, 1,
-1.03818, 0.6851397, 0.07200424, 0, 0, 0, 1, 1,
-1.036792, -2.842827, -1.760308, 0, 0, 0, 1, 1,
-1.028804, -0.7972302, -2.902589, 1, 1, 1, 1, 1,
-1.027031, 0.2882786, -1.467418, 1, 1, 1, 1, 1,
-1.022572, -0.3345178, -1.015897, 1, 1, 1, 1, 1,
-1.022334, 0.6324447, -0.07594933, 1, 1, 1, 1, 1,
-1.018945, -1.013995, -3.344206, 1, 1, 1, 1, 1,
-1.01845, 0.8926665, -1.187021, 1, 1, 1, 1, 1,
-1.017636, -0.8196672, -3.419757, 1, 1, 1, 1, 1,
-1.017203, 0.5813614, -1.84119, 1, 1, 1, 1, 1,
-1.016928, 1.250633, -0.520301, 1, 1, 1, 1, 1,
-1.015977, 0.4920272, -0.74796, 1, 1, 1, 1, 1,
-0.9940649, 0.6753991, -0.05196672, 1, 1, 1, 1, 1,
-0.9916981, -1.239213, -2.705294, 1, 1, 1, 1, 1,
-0.9899616, 0.2732582, -0.4023414, 1, 1, 1, 1, 1,
-0.9811108, 0.4669311, -2.472653, 1, 1, 1, 1, 1,
-0.9783528, -0.6367158, -2.994574, 1, 1, 1, 1, 1,
-0.9685781, -2.603801, -2.964001, 0, 0, 1, 1, 1,
-0.9643796, 0.4366623, -3.681375, 1, 0, 0, 1, 1,
-0.9608828, 0.1591003, -3.066737, 1, 0, 0, 1, 1,
-0.9606313, 2.105785, 0.5237704, 1, 0, 0, 1, 1,
-0.9596699, -1.118563, -1.252653, 1, 0, 0, 1, 1,
-0.957128, -0.2610393, -3.581472, 1, 0, 0, 1, 1,
-0.9528729, 0.6659552, -0.5369747, 0, 0, 0, 1, 1,
-0.9522727, -1.209746, -1.572003, 0, 0, 0, 1, 1,
-0.9465009, -0.2844436, -0.3404984, 0, 0, 0, 1, 1,
-0.9414633, 1.341746, -1.710657, 0, 0, 0, 1, 1,
-0.937245, 0.2121178, -0.2398479, 0, 0, 0, 1, 1,
-0.9364794, 0.3655489, -3.56654, 0, 0, 0, 1, 1,
-0.9339423, 1.545112, 1.404246, 0, 0, 0, 1, 1,
-0.9332209, 0.2948651, -0.4997201, 1, 1, 1, 1, 1,
-0.9323937, 0.9918407, -0.3819699, 1, 1, 1, 1, 1,
-0.9298807, -0.5825106, -0.3536064, 1, 1, 1, 1, 1,
-0.9271017, 1.529696, 0.7494144, 1, 1, 1, 1, 1,
-0.9265823, 1.082618, 0.503141, 1, 1, 1, 1, 1,
-0.9264841, -0.6344426, -1.48816, 1, 1, 1, 1, 1,
-0.9259048, 0.06820782, -1.175224, 1, 1, 1, 1, 1,
-0.9247078, -0.2282061, -3.106005, 1, 1, 1, 1, 1,
-0.9177126, 0.9163557, -0.9869074, 1, 1, 1, 1, 1,
-0.9163437, -1.7837, -3.01662, 1, 1, 1, 1, 1,
-0.9140551, 0.6159012, -0.7625893, 1, 1, 1, 1, 1,
-0.9135367, -0.2735237, -3.274465, 1, 1, 1, 1, 1,
-0.9112211, 1.808871, 0.9298559, 1, 1, 1, 1, 1,
-0.9074711, -1.685623, -2.382662, 1, 1, 1, 1, 1,
-0.900613, -1.038695, -3.516582, 1, 1, 1, 1, 1,
-0.8989053, 0.1268089, -0.9708341, 0, 0, 1, 1, 1,
-0.8981494, 1.031891, -0.6587019, 1, 0, 0, 1, 1,
-0.8979411, 1.194543, -0.5308106, 1, 0, 0, 1, 1,
-0.8939831, -0.03815178, -2.009679, 1, 0, 0, 1, 1,
-0.8916307, -0.7342651, -3.04507, 1, 0, 0, 1, 1,
-0.8736061, -0.5299219, -0.8354607, 1, 0, 0, 1, 1,
-0.8723028, 0.9253085, -0.2365878, 0, 0, 0, 1, 1,
-0.87184, -0.7864932, -3.222729, 0, 0, 0, 1, 1,
-0.8705894, -0.08961105, -1.833935, 0, 0, 0, 1, 1,
-0.8641817, -1.834011, -2.34726, 0, 0, 0, 1, 1,
-0.854773, 1.158203, 0.2034789, 0, 0, 0, 1, 1,
-0.8529574, 1.123324, 0.5160486, 0, 0, 0, 1, 1,
-0.8494348, -0.1298002, -1.703923, 0, 0, 0, 1, 1,
-0.8449646, 0.4417363, -0.5442308, 1, 1, 1, 1, 1,
-0.8417584, 1.158499, 1.476606, 1, 1, 1, 1, 1,
-0.8401208, 0.2512817, 0.2817584, 1, 1, 1, 1, 1,
-0.8317459, -0.7048138, -2.319431, 1, 1, 1, 1, 1,
-0.8169133, -0.151861, -1.287446, 1, 1, 1, 1, 1,
-0.814505, 1.025789, -2.434273, 1, 1, 1, 1, 1,
-0.8072256, -1.285648, -3.240407, 1, 1, 1, 1, 1,
-0.8039507, 2.000525, -1.952226, 1, 1, 1, 1, 1,
-0.802538, -1.278808, -2.582368, 1, 1, 1, 1, 1,
-0.7911892, -2.079218, -2.914546, 1, 1, 1, 1, 1,
-0.7894301, -0.2272625, -2.440962, 1, 1, 1, 1, 1,
-0.789083, -1.823826, -2.964579, 1, 1, 1, 1, 1,
-0.7850298, 0.8107991, -2.248016, 1, 1, 1, 1, 1,
-0.7801731, -2.234976, -1.683274, 1, 1, 1, 1, 1,
-0.7770318, 0.4463838, -2.470186, 1, 1, 1, 1, 1,
-0.7766434, 1.714559, -0.08098446, 0, 0, 1, 1, 1,
-0.7735609, 1.394488, -1.713188, 1, 0, 0, 1, 1,
-0.7642063, 0.2374662, -1.48559, 1, 0, 0, 1, 1,
-0.7617192, -0.7496864, -2.163531, 1, 0, 0, 1, 1,
-0.7610213, 0.7102757, -0.8196309, 1, 0, 0, 1, 1,
-0.7535791, 1.665419, -2.2372, 1, 0, 0, 1, 1,
-0.7422783, 1.334755, 0.8849688, 0, 0, 0, 1, 1,
-0.73801, 0.06321063, 0.4696798, 0, 0, 0, 1, 1,
-0.7331204, 0.2425794, -0.9411384, 0, 0, 0, 1, 1,
-0.7322632, 0.3199743, 1.083395, 0, 0, 0, 1, 1,
-0.7306052, -1.268223, -3.245398, 0, 0, 0, 1, 1,
-0.7305628, 0.3028579, -2.9494, 0, 0, 0, 1, 1,
-0.7271541, -0.7578468, 0.2574648, 0, 0, 0, 1, 1,
-0.7218076, -0.2219405, -2.582191, 1, 1, 1, 1, 1,
-0.7218074, 0.9605751, -0.4356577, 1, 1, 1, 1, 1,
-0.7147474, -1.487567, -4.936234, 1, 1, 1, 1, 1,
-0.7129941, 1.107765, 0.1682026, 1, 1, 1, 1, 1,
-0.706992, 0.100883, -1.034998, 1, 1, 1, 1, 1,
-0.6983115, 0.7779356, -1.479759, 1, 1, 1, 1, 1,
-0.694019, 0.3562818, -1.315043, 1, 1, 1, 1, 1,
-0.6924083, -1.409697, -3.060442, 1, 1, 1, 1, 1,
-0.6916012, 0.03838748, -3.095116, 1, 1, 1, 1, 1,
-0.6908185, -0.8345671, -1.99081, 1, 1, 1, 1, 1,
-0.6768276, 0.4022951, -2.736636, 1, 1, 1, 1, 1,
-0.6758248, -2.400804, -1.600369, 1, 1, 1, 1, 1,
-0.6745151, -0.7719157, -0.8766809, 1, 1, 1, 1, 1,
-0.6722769, 0.2468582, -0.7613003, 1, 1, 1, 1, 1,
-0.6687113, 0.1335715, -1.091328, 1, 1, 1, 1, 1,
-0.6684824, 1.543598, -2.188317, 0, 0, 1, 1, 1,
-0.6632807, -0.3144223, -1.830069, 1, 0, 0, 1, 1,
-0.6611588, 0.9192727, -1.061997, 1, 0, 0, 1, 1,
-0.6567288, 0.3076849, -0.6492886, 1, 0, 0, 1, 1,
-0.6538202, -1.002605, -4.198168, 1, 0, 0, 1, 1,
-0.6500063, -1.377012, -3.143875, 1, 0, 0, 1, 1,
-0.6493485, 0.02166465, -1.073697, 0, 0, 0, 1, 1,
-0.6452286, 1.645443, -1.195673, 0, 0, 0, 1, 1,
-0.6439373, -1.02192, -3.363685, 0, 0, 0, 1, 1,
-0.6416423, 0.7099126, -2.545654, 0, 0, 0, 1, 1,
-0.6397404, -0.07511479, -1.473637, 0, 0, 0, 1, 1,
-0.6345995, -0.3893151, -4.207922, 0, 0, 0, 1, 1,
-0.6205655, 0.5244969, -1.420656, 0, 0, 0, 1, 1,
-0.6161038, 1.181356, -0.002750231, 1, 1, 1, 1, 1,
-0.6119519, -0.5849577, -2.552705, 1, 1, 1, 1, 1,
-0.606595, -0.1855753, -1.405465, 1, 1, 1, 1, 1,
-0.6040782, -0.7421457, -2.070646, 1, 1, 1, 1, 1,
-0.6033959, 0.2193177, -0.05848109, 1, 1, 1, 1, 1,
-0.6011856, 0.8884168, -1.816499, 1, 1, 1, 1, 1,
-0.5981604, 0.14475, -1.537637, 1, 1, 1, 1, 1,
-0.5980693, 0.9566166, -1.763181, 1, 1, 1, 1, 1,
-0.5962137, 0.7367202, -3.021044, 1, 1, 1, 1, 1,
-0.5960879, -0.1297452, -0.8055634, 1, 1, 1, 1, 1,
-0.5949107, 0.6957294, -1.670261, 1, 1, 1, 1, 1,
-0.5935737, 0.6817405, -0.419502, 1, 1, 1, 1, 1,
-0.5921793, -0.6627061, -2.529119, 1, 1, 1, 1, 1,
-0.5853566, -0.5029469, 0.275124, 1, 1, 1, 1, 1,
-0.5818047, -0.4871551, -2.857754, 1, 1, 1, 1, 1,
-0.5797229, -2.040485, -2.783253, 0, 0, 1, 1, 1,
-0.5761428, -0.04692024, -2.012708, 1, 0, 0, 1, 1,
-0.5738311, -0.9065712, -2.532956, 1, 0, 0, 1, 1,
-0.5734124, 0.1947082, -0.6656985, 1, 0, 0, 1, 1,
-0.5727092, -1.31345, -2.697778, 1, 0, 0, 1, 1,
-0.5709432, 0.7079545, 0.3196473, 1, 0, 0, 1, 1,
-0.5684314, 0.1281172, -1.11162, 0, 0, 0, 1, 1,
-0.5649773, -0.2043928, -1.319796, 0, 0, 0, 1, 1,
-0.5635964, 0.4056872, -1.650832, 0, 0, 0, 1, 1,
-0.5592908, -0.00242813, -1.042981, 0, 0, 0, 1, 1,
-0.5591944, -1.931646, -4.526692, 0, 0, 0, 1, 1,
-0.5589301, -0.3677024, -3.268027, 0, 0, 0, 1, 1,
-0.5532677, 0.2841068, -1.293382, 0, 0, 0, 1, 1,
-0.5466772, -1.023324, -2.488137, 1, 1, 1, 1, 1,
-0.5385453, 1.410197, -0.2266204, 1, 1, 1, 1, 1,
-0.5380648, 0.6552513, 0.5417634, 1, 1, 1, 1, 1,
-0.5374662, 0.7368495, -1.742311, 1, 1, 1, 1, 1,
-0.5350897, 1.708643, 0.1472456, 1, 1, 1, 1, 1,
-0.5310004, 0.182448, -0.6446084, 1, 1, 1, 1, 1,
-0.5300161, 1.345668, 0.5202563, 1, 1, 1, 1, 1,
-0.5242875, -0.2119102, -3.656975, 1, 1, 1, 1, 1,
-0.5155625, -0.5098242, -2.811553, 1, 1, 1, 1, 1,
-0.513806, -1.867462, -2.262773, 1, 1, 1, 1, 1,
-0.5130879, -0.5047277, -1.590716, 1, 1, 1, 1, 1,
-0.503684, -1.709576, -1.190551, 1, 1, 1, 1, 1,
-0.5022492, -0.3848708, -2.112603, 1, 1, 1, 1, 1,
-0.5017303, -2.328902, -2.816459, 1, 1, 1, 1, 1,
-0.4989595, 0.8453003, 0.5124457, 1, 1, 1, 1, 1,
-0.4983411, -0.7900028, -1.461157, 0, 0, 1, 1, 1,
-0.4982989, 0.3293209, -2.119224, 1, 0, 0, 1, 1,
-0.4922002, 1.133422, 0.3790711, 1, 0, 0, 1, 1,
-0.4841785, 1.478647, -0.10855, 1, 0, 0, 1, 1,
-0.4812558, -0.8472959, -3.290636, 1, 0, 0, 1, 1,
-0.4768001, 0.04075269, -2.113566, 1, 0, 0, 1, 1,
-0.4766845, -0.08197004, -1.114143, 0, 0, 0, 1, 1,
-0.4744532, 0.06454061, -1.636859, 0, 0, 0, 1, 1,
-0.4722952, -0.2178876, -1.835392, 0, 0, 0, 1, 1,
-0.471108, 1.451586, 0.3474034, 0, 0, 0, 1, 1,
-0.4677294, 1.418289, -0.8560824, 0, 0, 0, 1, 1,
-0.4667667, 0.646261, -0.7488381, 0, 0, 0, 1, 1,
-0.4667082, -0.6584216, -1.327302, 0, 0, 0, 1, 1,
-0.4648539, 0.5198169, -0.4572958, 1, 1, 1, 1, 1,
-0.4630137, -0.04123269, -2.021825, 1, 1, 1, 1, 1,
-0.4540714, -1.792824, -2.603348, 1, 1, 1, 1, 1,
-0.4538251, -1.179018, -2.875195, 1, 1, 1, 1, 1,
-0.4527529, -0.01837366, -2.502499, 1, 1, 1, 1, 1,
-0.451206, -0.7332743, -1.90545, 1, 1, 1, 1, 1,
-0.4491602, 1.599013, -0.4679638, 1, 1, 1, 1, 1,
-0.4442894, -1.390666, -2.888278, 1, 1, 1, 1, 1,
-0.4442776, 0.6225286, 0.498487, 1, 1, 1, 1, 1,
-0.444198, -1.359161, -3.869218, 1, 1, 1, 1, 1,
-0.4439206, -0.004608282, -1.875672, 1, 1, 1, 1, 1,
-0.4391376, -1.183395, -3.679109, 1, 1, 1, 1, 1,
-0.4306828, -0.1390314, -2.046191, 1, 1, 1, 1, 1,
-0.4304872, 0.5352573, 0.5622953, 1, 1, 1, 1, 1,
-0.4282181, 0.5511627, -0.2723619, 1, 1, 1, 1, 1,
-0.4260424, 1.320121, 0.7106204, 0, 0, 1, 1, 1,
-0.4255178, -0.6597713, -1.918949, 1, 0, 0, 1, 1,
-0.4226478, 0.9019942, -0.1148414, 1, 0, 0, 1, 1,
-0.421817, 1.328703, 0.691646, 1, 0, 0, 1, 1,
-0.4182081, -0.5943326, -2.946907, 1, 0, 0, 1, 1,
-0.4141811, 1.271034, 0.3587033, 1, 0, 0, 1, 1,
-0.4117542, 0.3086393, 0.6729135, 0, 0, 0, 1, 1,
-0.4109036, 0.3760236, 0.3261882, 0, 0, 0, 1, 1,
-0.3968185, 1.918231, -0.566936, 0, 0, 0, 1, 1,
-0.3961144, 0.04176245, -2.144677, 0, 0, 0, 1, 1,
-0.3923779, -1.081919, -1.81073, 0, 0, 0, 1, 1,
-0.3909329, 0.1945522, -0.5541342, 0, 0, 0, 1, 1,
-0.3890298, -1.380013, -1.39871, 0, 0, 0, 1, 1,
-0.3889084, 1.197127, -0.1393572, 1, 1, 1, 1, 1,
-0.3848835, -0.01793053, -1.174282, 1, 1, 1, 1, 1,
-0.381547, -1.090273, -4.171203, 1, 1, 1, 1, 1,
-0.3802149, 0.8739961, 0.1748371, 1, 1, 1, 1, 1,
-0.3799163, 0.9701065, 0.8422566, 1, 1, 1, 1, 1,
-0.3776205, 0.4051956, 1.154017, 1, 1, 1, 1, 1,
-0.3774006, -0.3621617, -3.435328, 1, 1, 1, 1, 1,
-0.375182, 0.2546507, 0.03104273, 1, 1, 1, 1, 1,
-0.3733581, 0.5181825, -1.711934, 1, 1, 1, 1, 1,
-0.3636861, -0.4128909, -3.761116, 1, 1, 1, 1, 1,
-0.3621747, 0.6126587, 0.7752414, 1, 1, 1, 1, 1,
-0.3617853, -0.276306, -2.529229, 1, 1, 1, 1, 1,
-0.3562905, 0.6120369, -0.4782381, 1, 1, 1, 1, 1,
-0.3561024, 0.7696214, -0.249337, 1, 1, 1, 1, 1,
-0.3516906, 0.1269193, -0.2974094, 1, 1, 1, 1, 1,
-0.3513222, 0.1973864, -0.6959075, 0, 0, 1, 1, 1,
-0.3496445, 0.5382134, -0.6968876, 1, 0, 0, 1, 1,
-0.3487336, 0.6932051, -0.8011783, 1, 0, 0, 1, 1,
-0.3473868, 1.927604e-05, -1.521652, 1, 0, 0, 1, 1,
-0.3435419, -1.124424, -2.261728, 1, 0, 0, 1, 1,
-0.3428456, -1.869366, -2.928687, 1, 0, 0, 1, 1,
-0.3412479, 0.75086, 0.3352889, 0, 0, 0, 1, 1,
-0.3405496, 1.428118, -1.386211, 0, 0, 0, 1, 1,
-0.3389644, 1.32106, -0.2183156, 0, 0, 0, 1, 1,
-0.3345686, -2.100021, -3.28676, 0, 0, 0, 1, 1,
-0.3316012, -1.518702, -1.469778, 0, 0, 0, 1, 1,
-0.3299706, 1.198466, 1.753995, 0, 0, 0, 1, 1,
-0.3298488, 0.4011343, -1.904894, 0, 0, 0, 1, 1,
-0.329705, 0.2402946, -1.554326, 1, 1, 1, 1, 1,
-0.3259197, -1.580775, -1.846612, 1, 1, 1, 1, 1,
-0.3254905, 0.86973, -2.152526, 1, 1, 1, 1, 1,
-0.3238755, -1.244635, -3.890941, 1, 1, 1, 1, 1,
-0.3185707, 1.966254, -0.3203061, 1, 1, 1, 1, 1,
-0.3165473, 0.4421864, -0.3503186, 1, 1, 1, 1, 1,
-0.3160191, 0.6859251, -0.5988579, 1, 1, 1, 1, 1,
-0.3139052, 0.5743074, 1.377999, 1, 1, 1, 1, 1,
-0.313105, -1.053135, -3.25445, 1, 1, 1, 1, 1,
-0.3120704, -1.698016, -2.916011, 1, 1, 1, 1, 1,
-0.3120386, 0.5720585, -0.7355575, 1, 1, 1, 1, 1,
-0.3097257, 0.07930165, -0.859574, 1, 1, 1, 1, 1,
-0.307784, 0.343098, -1.273637, 1, 1, 1, 1, 1,
-0.3066733, 0.3955474, 0.06157204, 1, 1, 1, 1, 1,
-0.3035012, -0.3254886, -2.180202, 1, 1, 1, 1, 1,
-0.2970728, -0.98566, -4.501056, 0, 0, 1, 1, 1,
-0.2961789, 2.66428, 0.7303393, 1, 0, 0, 1, 1,
-0.2924698, -0.9692341, -2.05974, 1, 0, 0, 1, 1,
-0.291267, 1.551351, -0.9412844, 1, 0, 0, 1, 1,
-0.290912, 0.2037252, -1.845613, 1, 0, 0, 1, 1,
-0.288262, 1.062124, -0.8901213, 1, 0, 0, 1, 1,
-0.2868361, 1.494267, -0.4057987, 0, 0, 0, 1, 1,
-0.2846446, 0.8974751, 0.8860906, 0, 0, 0, 1, 1,
-0.27874, -0.6825665, -3.286638, 0, 0, 0, 1, 1,
-0.2769979, -0.4726151, -1.408194, 0, 0, 0, 1, 1,
-0.2761584, 1.070614, 1.354932, 0, 0, 0, 1, 1,
-0.2761394, -0.04023504, -2.072078, 0, 0, 0, 1, 1,
-0.275757, -0.03006336, -0.6477068, 0, 0, 0, 1, 1,
-0.2725603, 2.877934, 0.8133929, 1, 1, 1, 1, 1,
-0.2713433, -1.534772, -3.287978, 1, 1, 1, 1, 1,
-0.2699339, -1.279584, -3.444749, 1, 1, 1, 1, 1,
-0.2660368, 0.7897739, 0.5543548, 1, 1, 1, 1, 1,
-0.2611846, -0.5979654, -2.098124, 1, 1, 1, 1, 1,
-0.260444, -1.16327, -2.641419, 1, 1, 1, 1, 1,
-0.2578079, -0.5278828, -2.000994, 1, 1, 1, 1, 1,
-0.2555084, -0.2848942, -1.117855, 1, 1, 1, 1, 1,
-0.2546617, 0.1005433, 0.1419816, 1, 1, 1, 1, 1,
-0.2528842, 0.8131465, -1.227678, 1, 1, 1, 1, 1,
-0.2524591, -1.695704, -4.73142, 1, 1, 1, 1, 1,
-0.2522325, -0.5770968, -2.85658, 1, 1, 1, 1, 1,
-0.2517646, -1.94431, -3.354644, 1, 1, 1, 1, 1,
-0.2513433, -1.813556, -2.20397, 1, 1, 1, 1, 1,
-0.2506193, -2.139447, -3.791905, 1, 1, 1, 1, 1,
-0.249754, 0.2211362, -2.238286, 0, 0, 1, 1, 1,
-0.2475038, -0.343516, -1.375387, 1, 0, 0, 1, 1,
-0.2468849, -2.251579, -3.008844, 1, 0, 0, 1, 1,
-0.2456483, 0.478574, -1.1481, 1, 0, 0, 1, 1,
-0.2447045, -0.2151933, -2.398621, 1, 0, 0, 1, 1,
-0.242503, 1.093076, 0.8240308, 1, 0, 0, 1, 1,
-0.2403813, -0.3965232, -2.229081, 0, 0, 0, 1, 1,
-0.2398039, -0.21562, -3.275854, 0, 0, 0, 1, 1,
-0.2367887, -0.3220738, -3.342074, 0, 0, 0, 1, 1,
-0.2358812, 1.197659, -0.07643467, 0, 0, 0, 1, 1,
-0.234145, -0.7290876, -3.384712, 0, 0, 0, 1, 1,
-0.226084, 0.7994646, 0.1296125, 0, 0, 0, 1, 1,
-0.224667, -0.8784941, -2.468027, 0, 0, 0, 1, 1,
-0.2220375, -0.4431297, -2.375464, 1, 1, 1, 1, 1,
-0.2174102, 2.294575, -0.8784623, 1, 1, 1, 1, 1,
-0.2155466, -0.9384521, -2.252444, 1, 1, 1, 1, 1,
-0.2141521, 0.7755848, 0.4177563, 1, 1, 1, 1, 1,
-0.2118929, 0.835772, -0.1741765, 1, 1, 1, 1, 1,
-0.2111483, -1.414353, -3.648542, 1, 1, 1, 1, 1,
-0.2096692, 0.6097278, 0.3684231, 1, 1, 1, 1, 1,
-0.2091497, -0.3953597, -1.123409, 1, 1, 1, 1, 1,
-0.2060834, 0.63773, -0.7692915, 1, 1, 1, 1, 1,
-0.2039334, -1.208717, -3.033261, 1, 1, 1, 1, 1,
-0.1988974, -0.2487155, -3.914582, 1, 1, 1, 1, 1,
-0.1890776, -0.06631827, -0.581107, 1, 1, 1, 1, 1,
-0.1870683, -0.2115781, -1.74033, 1, 1, 1, 1, 1,
-0.1855641, 1.640391, -2.296388, 1, 1, 1, 1, 1,
-0.1849531, -0.3789668, -4.090633, 1, 1, 1, 1, 1,
-0.1841779, 0.3493794, -2.02971, 0, 0, 1, 1, 1,
-0.1791559, 0.6753803, -0.987111, 1, 0, 0, 1, 1,
-0.1709309, 0.9748986, -1.822549, 1, 0, 0, 1, 1,
-0.1689452, -0.4018517, -3.207052, 1, 0, 0, 1, 1,
-0.1676692, -1.554602, -3.569615, 1, 0, 0, 1, 1,
-0.1665938, -1.938783, -1.991245, 1, 0, 0, 1, 1,
-0.1602701, -1.104042, -1.966391, 0, 0, 0, 1, 1,
-0.1560372, 0.1972354, 0.9829684, 0, 0, 0, 1, 1,
-0.150969, -0.1947805, -1.327912, 0, 0, 0, 1, 1,
-0.145295, -0.3835119, -3.168237, 0, 0, 0, 1, 1,
-0.1380237, 0.2179731, -1.614731, 0, 0, 0, 1, 1,
-0.1167808, 0.7484612, -0.9733533, 0, 0, 0, 1, 1,
-0.1120119, -1.290686, -3.140877, 0, 0, 0, 1, 1,
-0.1112776, -0.5710589, -3.498638, 1, 1, 1, 1, 1,
-0.1093369, 0.302835, -0.617407, 1, 1, 1, 1, 1,
-0.1080091, 0.5450726, 0.2683073, 1, 1, 1, 1, 1,
-0.1079544, -0.5573649, -1.502397, 1, 1, 1, 1, 1,
-0.1078132, 2.144195, -0.09005687, 1, 1, 1, 1, 1,
-0.1076176, 1.208704, -1.649698, 1, 1, 1, 1, 1,
-0.09821797, 0.6666902, 0.805429, 1, 1, 1, 1, 1,
-0.09747367, 1.246794, 0.5234118, 1, 1, 1, 1, 1,
-0.09595089, -1.029943, -1.968043, 1, 1, 1, 1, 1,
-0.09407313, 0.257256, 0.8342322, 1, 1, 1, 1, 1,
-0.08431676, 0.5090657, 0.3463995, 1, 1, 1, 1, 1,
-0.08224389, -0.5737554, -3.526487, 1, 1, 1, 1, 1,
-0.08176943, 0.4983644, -0.1984475, 1, 1, 1, 1, 1,
-0.07290451, -1.226734, -3.764973, 1, 1, 1, 1, 1,
-0.06975019, 0.2311906, -0.8037934, 1, 1, 1, 1, 1,
-0.06555435, 0.3283018, 0.3238159, 0, 0, 1, 1, 1,
-0.06555367, -0.4983705, -2.23555, 1, 0, 0, 1, 1,
-0.05980976, -0.09385624, -1.810211, 1, 0, 0, 1, 1,
-0.05946609, 1.65072, 0.2090097, 1, 0, 0, 1, 1,
-0.05102025, -0.3904549, -2.556605, 1, 0, 0, 1, 1,
-0.0493034, -0.4036667, -4.922369, 1, 0, 0, 1, 1,
-0.04558767, 0.0317955, -0.3017783, 0, 0, 0, 1, 1,
-0.04247613, -0.03559577, -1.334905, 0, 0, 0, 1, 1,
-0.04035796, 0.03751677, -2.934589, 0, 0, 0, 1, 1,
-0.03685361, 0.7622842, 0.09045137, 0, 0, 0, 1, 1,
-0.03074481, 0.40012, -1.136852, 0, 0, 0, 1, 1,
-0.02906021, -0.7232833, -4.100558, 0, 0, 0, 1, 1,
-0.02889993, -1.104843, -2.200362, 0, 0, 0, 1, 1,
-0.02411244, 0.5708465, 0.2632034, 1, 1, 1, 1, 1,
-0.02341607, 0.0882786, -1.441827, 1, 1, 1, 1, 1,
-0.02319472, 0.6675625, 0.672201, 1, 1, 1, 1, 1,
-0.01814172, -2.498196, -1.430175, 1, 1, 1, 1, 1,
-0.01769283, 1.144411, -0.2115776, 1, 1, 1, 1, 1,
-0.0175838, -0.0537188, -2.451763, 1, 1, 1, 1, 1,
-0.01533554, -1.336925, -2.837873, 1, 1, 1, 1, 1,
-0.00874004, -0.1300233, -5.100119, 1, 1, 1, 1, 1,
-0.008182067, -0.09227668, -2.044472, 1, 1, 1, 1, 1,
-0.007160703, 0.9158945, -0.3045978, 1, 1, 1, 1, 1,
-0.0007152091, 0.9544745, -1.057883, 1, 1, 1, 1, 1,
-0.0005972193, 0.6818102, -0.8010961, 1, 1, 1, 1, 1,
0.001611981, -0.8905773, 3.075749, 1, 1, 1, 1, 1,
0.002052724, -0.2361885, 2.911015, 1, 1, 1, 1, 1,
0.004961924, 2.392974, -0.6808221, 1, 1, 1, 1, 1,
0.00592254, -2.12618, 3.924114, 0, 0, 1, 1, 1,
0.006052176, 1.041533, 0.7068729, 1, 0, 0, 1, 1,
0.006151606, -1.987415, 3.170704, 1, 0, 0, 1, 1,
0.00949725, 0.0009336961, 0.3125321, 1, 0, 0, 1, 1,
0.01034429, 0.1553688, 1.051401, 1, 0, 0, 1, 1,
0.01105836, 1.396293, 0.07422211, 1, 0, 0, 1, 1,
0.01412074, 0.162222, 0.07263058, 0, 0, 0, 1, 1,
0.01638404, 1.323037, -2.266648, 0, 0, 0, 1, 1,
0.01767288, 0.225651, -0.3577628, 0, 0, 0, 1, 1,
0.02405348, -1.651371, 4.865568, 0, 0, 0, 1, 1,
0.02807532, -1.880776, 3.896543, 0, 0, 0, 1, 1,
0.03037735, -0.3210894, 2.823616, 0, 0, 0, 1, 1,
0.03058123, 0.403647, 2.383495, 0, 0, 0, 1, 1,
0.03144307, -0.617245, 1.431631, 1, 1, 1, 1, 1,
0.03871477, 0.02209432, 2.160578, 1, 1, 1, 1, 1,
0.03919213, -0.06875391, 2.270098, 1, 1, 1, 1, 1,
0.03964632, 0.03644796, 0.9996555, 1, 1, 1, 1, 1,
0.04499167, -0.4169639, 3.072971, 1, 1, 1, 1, 1,
0.0466099, 0.04865538, -0.0554456, 1, 1, 1, 1, 1,
0.04664615, -0.7276534, 3.393843, 1, 1, 1, 1, 1,
0.0518866, 0.3931917, -0.5765116, 1, 1, 1, 1, 1,
0.05634938, -1.64407, 3.495984, 1, 1, 1, 1, 1,
0.06004581, 1.134877, 1.309715, 1, 1, 1, 1, 1,
0.06281729, -0.2006574, 2.834134, 1, 1, 1, 1, 1,
0.06348982, -0.9300348, 1.116561, 1, 1, 1, 1, 1,
0.06676488, 0.1323621, -0.8678175, 1, 1, 1, 1, 1,
0.06761704, -1.094263, 2.789465, 1, 1, 1, 1, 1,
0.06956086, -1.074941, 2.234136, 1, 1, 1, 1, 1,
0.07252481, -0.3934622, 3.798442, 0, 0, 1, 1, 1,
0.07585794, 0.5384927, 0.7829341, 1, 0, 0, 1, 1,
0.07667986, -2.780912, 3.520954, 1, 0, 0, 1, 1,
0.08234084, 0.02292573, 1.612727, 1, 0, 0, 1, 1,
0.08247229, 0.312741, -0.2813282, 1, 0, 0, 1, 1,
0.08623388, -1.092421, 4.514537, 1, 0, 0, 1, 1,
0.08689215, 1.096491, 2.665835, 0, 0, 0, 1, 1,
0.08860052, 0.3620689, 1.695101, 0, 0, 0, 1, 1,
0.08932219, -2.613021, 2.308913, 0, 0, 0, 1, 1,
0.09161276, 0.2702369, 0.9670476, 0, 0, 0, 1, 1,
0.09281886, -1.307977, 2.472607, 0, 0, 0, 1, 1,
0.09359878, -0.0400399, 2.482492, 0, 0, 0, 1, 1,
0.09382415, 0.2162474, 0.6387674, 0, 0, 0, 1, 1,
0.09584852, 0.3189259, 0.7050104, 1, 1, 1, 1, 1,
0.09593192, 1.77769, -0.4957105, 1, 1, 1, 1, 1,
0.09649055, -0.03517298, 1.623588, 1, 1, 1, 1, 1,
0.1135041, -0.3888743, 3.882918, 1, 1, 1, 1, 1,
0.117009, -1.181726, 4.086246, 1, 1, 1, 1, 1,
0.1181325, -1.326015, 3.189015, 1, 1, 1, 1, 1,
0.1199943, 0.06911384, 0.687088, 1, 1, 1, 1, 1,
0.1199995, -0.01280897, 1.685268, 1, 1, 1, 1, 1,
0.1231633, 0.2426497, -0.2422964, 1, 1, 1, 1, 1,
0.1258346, 0.1238054, 2.136627, 1, 1, 1, 1, 1,
0.1263345, -0.2825404, 1.442644, 1, 1, 1, 1, 1,
0.1265113, -0.5755582, 3.415468, 1, 1, 1, 1, 1,
0.1295791, 0.04514849, 2.434242, 1, 1, 1, 1, 1,
0.1296982, 0.2974717, -1.297578, 1, 1, 1, 1, 1,
0.1307904, -1.172703, 4.157431, 1, 1, 1, 1, 1,
0.1387035, -1.188025, 2.998854, 0, 0, 1, 1, 1,
0.1411762, -0.3702665, 3.789052, 1, 0, 0, 1, 1,
0.1423817, -0.5817637, 4.188559, 1, 0, 0, 1, 1,
0.1446602, 1.353388, 0.249227, 1, 0, 0, 1, 1,
0.1458776, 1.001783, 0.9941458, 1, 0, 0, 1, 1,
0.1473772, -1.363819, 2.852366, 1, 0, 0, 1, 1,
0.1500877, -0.1030949, 2.381735, 0, 0, 0, 1, 1,
0.1526362, 0.9166015, -0.5978552, 0, 0, 0, 1, 1,
0.1535531, 0.6112421, 1.332672, 0, 0, 0, 1, 1,
0.1584647, -2.125331, 3.683414, 0, 0, 0, 1, 1,
0.1588411, 0.8376529, 0.553822, 0, 0, 0, 1, 1,
0.1656821, -0.3962386, 3.311822, 0, 0, 0, 1, 1,
0.1662682, -1.538178, 3.962249, 0, 0, 0, 1, 1,
0.1665657, -2.168991, 1.574473, 1, 1, 1, 1, 1,
0.1684254, -1.186243, 2.911294, 1, 1, 1, 1, 1,
0.1689405, 0.06512695, 0.7998108, 1, 1, 1, 1, 1,
0.1738643, 0.6056864, 1.933433, 1, 1, 1, 1, 1,
0.1807281, 0.1630054, 1.427986, 1, 1, 1, 1, 1,
0.1830934, -0.08317709, 1.663793, 1, 1, 1, 1, 1,
0.1831086, -2.833658, 4.084835, 1, 1, 1, 1, 1,
0.1834345, -1.787513, 4.450253, 1, 1, 1, 1, 1,
0.1846317, -0.6021999, 4.090539, 1, 1, 1, 1, 1,
0.1917101, 1.440224, -1.910953, 1, 1, 1, 1, 1,
0.1934261, 0.01640167, 0.3502259, 1, 1, 1, 1, 1,
0.1944171, -0.1352158, 3.574223, 1, 1, 1, 1, 1,
0.194551, 0.4815356, -0.6034806, 1, 1, 1, 1, 1,
0.1973094, 2.19115, 0.7861607, 1, 1, 1, 1, 1,
0.1994717, -0.8548927, 1.663186, 1, 1, 1, 1, 1,
0.2036055, -0.8480331, 1.889007, 0, 0, 1, 1, 1,
0.2057325, -0.606752, 3.281355, 1, 0, 0, 1, 1,
0.2090855, -0.9249711, 4.207437, 1, 0, 0, 1, 1,
0.2094398, -0.6480098, 3.210444, 1, 0, 0, 1, 1,
0.2114116, 0.8101855, 1.279094, 1, 0, 0, 1, 1,
0.2136074, 0.9438998, 1.248479, 1, 0, 0, 1, 1,
0.2136103, -0.3810805, 2.852185, 0, 0, 0, 1, 1,
0.2137968, 0.5846562, 0.3899503, 0, 0, 0, 1, 1,
0.2156341, 0.2429946, 1.040612, 0, 0, 0, 1, 1,
0.2158506, -1.544882, 3.804521, 0, 0, 0, 1, 1,
0.2186228, -1.742833, 3.741869, 0, 0, 0, 1, 1,
0.2193227, 0.8400634, -0.5538154, 0, 0, 0, 1, 1,
0.2241037, 1.722007, 0.5378289, 0, 0, 0, 1, 1,
0.2298017, -3.493385, 4.307273, 1, 1, 1, 1, 1,
0.2305574, 0.7676441, 0.2887596, 1, 1, 1, 1, 1,
0.2323801, 1.948241, -1.149732, 1, 1, 1, 1, 1,
0.2343874, 1.514072, -0.2000145, 1, 1, 1, 1, 1,
0.2415505, 0.5241561, -1.191968, 1, 1, 1, 1, 1,
0.245199, -0.06775396, 2.781477, 1, 1, 1, 1, 1,
0.2461157, 1.790812, 0.9668593, 1, 1, 1, 1, 1,
0.2492996, -1.205536, 2.694791, 1, 1, 1, 1, 1,
0.2511415, 0.1055762, -0.4978941, 1, 1, 1, 1, 1,
0.2528347, -0.5398656, 2.419102, 1, 1, 1, 1, 1,
0.2565277, 0.749108, 0.242063, 1, 1, 1, 1, 1,
0.2606872, 1.145696, 2.30745, 1, 1, 1, 1, 1,
0.2625774, 0.3185045, 1.16984, 1, 1, 1, 1, 1,
0.2640921, 0.9267275, 0.005226216, 1, 1, 1, 1, 1,
0.2682017, -2.104668, 1.729854, 1, 1, 1, 1, 1,
0.2784352, 0.5846642, 0.5459948, 0, 0, 1, 1, 1,
0.2786047, -0.3794377, 2.922605, 1, 0, 0, 1, 1,
0.2814793, -0.5821725, -0.507167, 1, 0, 0, 1, 1,
0.2829068, -0.227399, 3.382215, 1, 0, 0, 1, 1,
0.2835113, 0.2512347, 0.4813884, 1, 0, 0, 1, 1,
0.2847374, -1.200697, 1.487081, 1, 0, 0, 1, 1,
0.2866091, -0.3959619, 3.422493, 0, 0, 0, 1, 1,
0.2877596, 0.8734428, 1.741569, 0, 0, 0, 1, 1,
0.2878678, 0.5137435, 0.1663378, 0, 0, 0, 1, 1,
0.2933219, 1.301865, -0.1074208, 0, 0, 0, 1, 1,
0.2953918, 0.3804887, 1.934897, 0, 0, 0, 1, 1,
0.2960503, -0.9427269, 4.149565, 0, 0, 0, 1, 1,
0.2972195, -1.739222, 4.31441, 0, 0, 0, 1, 1,
0.2998973, 0.8393763, -0.1253412, 1, 1, 1, 1, 1,
0.3008408, 0.1658058, 1.635859, 1, 1, 1, 1, 1,
0.3088812, 0.003198641, 2.456652, 1, 1, 1, 1, 1,
0.312585, 0.6268103, 2.354256, 1, 1, 1, 1, 1,
0.3210531, -0.1632823, 2.797283, 1, 1, 1, 1, 1,
0.3233559, 0.0786727, 0.4875098, 1, 1, 1, 1, 1,
0.3237905, -0.7871567, 0.5088292, 1, 1, 1, 1, 1,
0.3261289, -0.8337331, 2.87098, 1, 1, 1, 1, 1,
0.3320252, -1.039692, 2.238711, 1, 1, 1, 1, 1,
0.3376673, 1.738465, 0.7362181, 1, 1, 1, 1, 1,
0.3377621, 0.7222165, -0.1419332, 1, 1, 1, 1, 1,
0.3390112, 0.4901412, 0.4495192, 1, 1, 1, 1, 1,
0.3392618, -0.2324067, 2.427922, 1, 1, 1, 1, 1,
0.3430182, 0.4687153, 2.518644, 1, 1, 1, 1, 1,
0.3470708, -0.8175521, 3.232303, 1, 1, 1, 1, 1,
0.3475949, -0.3357139, 3.149796, 0, 0, 1, 1, 1,
0.3486462, -0.2161386, 0.9589908, 1, 0, 0, 1, 1,
0.3583044, 0.3290457, -0.04802384, 1, 0, 0, 1, 1,
0.3623567, -0.3918449, 2.672759, 1, 0, 0, 1, 1,
0.3625498, -0.2951655, 2.967449, 1, 0, 0, 1, 1,
0.3663239, -0.9681757, 4.276721, 1, 0, 0, 1, 1,
0.3671278, 0.4604396, 0.8586088, 0, 0, 0, 1, 1,
0.3688282, 0.822002, -0.2521067, 0, 0, 0, 1, 1,
0.3700441, -0.6446134, 1.698833, 0, 0, 0, 1, 1,
0.3719019, -0.6340957, 3.474484, 0, 0, 0, 1, 1,
0.379424, 1.177759, 0.4871506, 0, 0, 0, 1, 1,
0.3801713, 0.9962994, 0.3452751, 0, 0, 0, 1, 1,
0.3828872, 1.538113, 1.085182, 0, 0, 0, 1, 1,
0.3839626, -1.467338, 4.183399, 1, 1, 1, 1, 1,
0.387068, -2.294476, 3.027946, 1, 1, 1, 1, 1,
0.3926917, 0.4442308, 0.5087275, 1, 1, 1, 1, 1,
0.3946354, 0.7015556, 1.656079, 1, 1, 1, 1, 1,
0.3983306, 1.952645, -0.0540203, 1, 1, 1, 1, 1,
0.3993939, 0.7748862, -0.6807158, 1, 1, 1, 1, 1,
0.4001136, -0.3514939, 1.153501, 1, 1, 1, 1, 1,
0.4050179, -1.226841, 1.988919, 1, 1, 1, 1, 1,
0.4089745, 0.114329, 1.475991, 1, 1, 1, 1, 1,
0.4089876, 0.5106393, -2.999994, 1, 1, 1, 1, 1,
0.4175608, -1.236981, 3.131872, 1, 1, 1, 1, 1,
0.4308398, 0.2448203, -0.6595566, 1, 1, 1, 1, 1,
0.431558, -0.8406987, 3.278197, 1, 1, 1, 1, 1,
0.4337334, -0.13667, 0.6408736, 1, 1, 1, 1, 1,
0.4356627, 0.4057231, 2.601266, 1, 1, 1, 1, 1,
0.4385872, 0.003027898, 2.16484, 0, 0, 1, 1, 1,
0.4387358, -1.153722, 3.126868, 1, 0, 0, 1, 1,
0.4387876, -0.9551501, 2.186162, 1, 0, 0, 1, 1,
0.4394427, -0.109673, 1.63079, 1, 0, 0, 1, 1,
0.444602, 0.1996749, 1.010794, 1, 0, 0, 1, 1,
0.4475983, 1.169693, 0.5465537, 1, 0, 0, 1, 1,
0.4525145, 0.7416703, 0.3300402, 0, 0, 0, 1, 1,
0.4532043, -0.3132446, 3.171071, 0, 0, 0, 1, 1,
0.4538444, -1.292845, 3.34249, 0, 0, 0, 1, 1,
0.4563891, 0.2359118, 1.312767, 0, 0, 0, 1, 1,
0.4588715, -1.375985, 3.99337, 0, 0, 0, 1, 1,
0.469054, 0.5372241, -0.6900835, 0, 0, 0, 1, 1,
0.4820099, -0.7631396, 0.1757658, 0, 0, 0, 1, 1,
0.4860344, 1.749002, 1.151216, 1, 1, 1, 1, 1,
0.4885479, 0.5003275, 2.268408, 1, 1, 1, 1, 1,
0.494164, 0.5510778, 0.64431, 1, 1, 1, 1, 1,
0.5008425, 0.02936986, 3.589752, 1, 1, 1, 1, 1,
0.5088097, 0.9478951, 0.07342307, 1, 1, 1, 1, 1,
0.5088829, 0.7171989, 0.3237031, 1, 1, 1, 1, 1,
0.5092403, 0.1734609, 1.331557, 1, 1, 1, 1, 1,
0.5122375, 0.01083646, 1.031669, 1, 1, 1, 1, 1,
0.5161858, 0.05104508, 1.982991, 1, 1, 1, 1, 1,
0.5162572, -1.660981, 3.368832, 1, 1, 1, 1, 1,
0.5186073, 1.234822, 1.393559, 1, 1, 1, 1, 1,
0.5279996, 0.2028637, -0.07537214, 1, 1, 1, 1, 1,
0.5290407, -2.70577, 3.164125, 1, 1, 1, 1, 1,
0.5348077, -0.3504232, 1.244578, 1, 1, 1, 1, 1,
0.5437732, 0.4465273, 1.719741, 1, 1, 1, 1, 1,
0.5462587, 0.6090187, -0.1448043, 0, 0, 1, 1, 1,
0.5483851, -0.8627785, 2.377236, 1, 0, 0, 1, 1,
0.550016, 0.8453789, 2.271429, 1, 0, 0, 1, 1,
0.5521133, 1.182355, 0.9623988, 1, 0, 0, 1, 1,
0.5532202, 0.3639954, 1.351858, 1, 0, 0, 1, 1,
0.5553492, 0.9433005, -0.06000567, 1, 0, 0, 1, 1,
0.5557688, 1.640705, 1.14633, 0, 0, 0, 1, 1,
0.5561838, 0.1351432, 0.5247915, 0, 0, 0, 1, 1,
0.5573869, -0.5957304, 2.57202, 0, 0, 0, 1, 1,
0.5584607, -0.7270979, 1.259739, 0, 0, 0, 1, 1,
0.558472, -2.189287, 2.83836, 0, 0, 0, 1, 1,
0.5587996, -0.602586, 1.749915, 0, 0, 0, 1, 1,
0.5588491, 1.105075, 1.062621, 0, 0, 0, 1, 1,
0.5625998, 0.5518758, 0.9266871, 1, 1, 1, 1, 1,
0.5627843, 0.9209243, 0.3094301, 1, 1, 1, 1, 1,
0.5630079, 1.927921, 1.347734, 1, 1, 1, 1, 1,
0.5638208, -0.1050877, 1.419606, 1, 1, 1, 1, 1,
0.5656075, 0.7862331, 1.004765, 1, 1, 1, 1, 1,
0.567569, 0.4188515, 0.3772972, 1, 1, 1, 1, 1,
0.5726298, -0.4715473, 1.526906, 1, 1, 1, 1, 1,
0.5737579, -1.519983, 2.516217, 1, 1, 1, 1, 1,
0.5764687, -2.026289, 2.62421, 1, 1, 1, 1, 1,
0.5900918, -0.9848338, 1.390934, 1, 1, 1, 1, 1,
0.5957163, -0.7340715, -0.2477112, 1, 1, 1, 1, 1,
0.6058764, -1.271515, 1.063245, 1, 1, 1, 1, 1,
0.6133363, -0.1267143, 1.783165, 1, 1, 1, 1, 1,
0.6180665, -1.029181, 0.5615733, 1, 1, 1, 1, 1,
0.6202665, 0.47105, -1.759075, 1, 1, 1, 1, 1,
0.622439, 0.9781287, -0.3534282, 0, 0, 1, 1, 1,
0.6228298, -0.3539167, 1.408256, 1, 0, 0, 1, 1,
0.6533989, 0.4205498, -0.6000146, 1, 0, 0, 1, 1,
0.653765, 0.2632719, 0.965935, 1, 0, 0, 1, 1,
0.6554312, -0.8172761, 2.372964, 1, 0, 0, 1, 1,
0.6565719, -0.571607, 1.821437, 1, 0, 0, 1, 1,
0.657257, 0.9166831, 0.5532258, 0, 0, 0, 1, 1,
0.6584251, 1.250119, 0.1043651, 0, 0, 0, 1, 1,
0.6613597, -0.5386973, 1.195112, 0, 0, 0, 1, 1,
0.6613896, 2.59528, 0.2710483, 0, 0, 0, 1, 1,
0.6672829, 0.2715108, 0.6000499, 0, 0, 0, 1, 1,
0.6682682, -1.358408, 2.660519, 0, 0, 0, 1, 1,
0.6776214, -0.6725796, 2.696718, 0, 0, 0, 1, 1,
0.679739, 0.02660596, 0.3441388, 1, 1, 1, 1, 1,
0.6799408, -0.08878332, 1.896371, 1, 1, 1, 1, 1,
0.679942, 0.2727681, 0.8165197, 1, 1, 1, 1, 1,
0.6804907, -1.165053, 3.72757, 1, 1, 1, 1, 1,
0.6852699, 0.9189525, 0.8150379, 1, 1, 1, 1, 1,
0.6858317, -0.2913809, 3.361496, 1, 1, 1, 1, 1,
0.6864978, -1.377055, 3.066973, 1, 1, 1, 1, 1,
0.6867503, -1.168477, 3.597515, 1, 1, 1, 1, 1,
0.6906759, 0.7206187, 1.202836, 1, 1, 1, 1, 1,
0.6918625, 0.7056673, 1.412317, 1, 1, 1, 1, 1,
0.6988388, 0.8135232, 1.537706, 1, 1, 1, 1, 1,
0.7027414, -0.8020558, 2.971621, 1, 1, 1, 1, 1,
0.7032855, -1.099483, 0.3150024, 1, 1, 1, 1, 1,
0.709045, -0.6507232, 1.718516, 1, 1, 1, 1, 1,
0.7113161, 1.187184, 0.9982091, 1, 1, 1, 1, 1,
0.7136284, 0.939831, 0.5193563, 0, 0, 1, 1, 1,
0.7142288, 0.8432671, 1.364573, 1, 0, 0, 1, 1,
0.7299538, -0.06058809, 0.8194898, 1, 0, 0, 1, 1,
0.732817, -1.021364, 3.147012, 1, 0, 0, 1, 1,
0.7345869, 0.1024258, 0.975723, 1, 0, 0, 1, 1,
0.7451996, -0.2980109, 3.285338, 1, 0, 0, 1, 1,
0.7483788, -0.1563546, 2.301957, 0, 0, 0, 1, 1,
0.7527653, 0.2985567, 1.659179, 0, 0, 0, 1, 1,
0.7541828, 0.7322773, 1.377879, 0, 0, 0, 1, 1,
0.7585927, -0.9033054, 2.461779, 0, 0, 0, 1, 1,
0.7613435, 0.4471516, 1.332276, 0, 0, 0, 1, 1,
0.7616658, -0.4286159, 1.185648, 0, 0, 0, 1, 1,
0.7650684, 0.6479452, 0.5763949, 0, 0, 0, 1, 1,
0.7711356, -0.9353208, 2.890634, 1, 1, 1, 1, 1,
0.7713172, 0.9016196, 2.408738, 1, 1, 1, 1, 1,
0.7714835, 0.0340554, 4.18713, 1, 1, 1, 1, 1,
0.774576, -0.6155421, 2.066911, 1, 1, 1, 1, 1,
0.7750388, -0.8859675, -0.06669775, 1, 1, 1, 1, 1,
0.7752767, 0.1620495, 2.057854, 1, 1, 1, 1, 1,
0.7762117, -0.2562161, 2.490644, 1, 1, 1, 1, 1,
0.7767308, 1.514268, -0.138006, 1, 1, 1, 1, 1,
0.7774687, -1.417665, 4.357129, 1, 1, 1, 1, 1,
0.7864514, -1.647718, 2.589267, 1, 1, 1, 1, 1,
0.7886673, -0.3084525, 2.078885, 1, 1, 1, 1, 1,
0.7897803, 0.8488563, -0.6106792, 1, 1, 1, 1, 1,
0.7939819, 0.3079804, 0.585987, 1, 1, 1, 1, 1,
0.7940766, -0.352177, 3.372571, 1, 1, 1, 1, 1,
0.805721, 0.8478552, -0.1240495, 1, 1, 1, 1, 1,
0.819477, -0.1147537, 1.851229, 0, 0, 1, 1, 1,
0.8197851, 0.2002646, 1.597838, 1, 0, 0, 1, 1,
0.8246995, 0.06658307, 1.560577, 1, 0, 0, 1, 1,
0.837103, -0.02071184, 3.123985, 1, 0, 0, 1, 1,
0.8379359, -1.363794, 1.59388, 1, 0, 0, 1, 1,
0.8399742, 1.482524, 1.08916, 1, 0, 0, 1, 1,
0.8412685, -1.559771, 3.316745, 0, 0, 0, 1, 1,
0.8487727, 1.474214, 3.116003, 0, 0, 0, 1, 1,
0.8501824, 1.63004, 2.245574, 0, 0, 0, 1, 1,
0.853222, 0.6730345, 1.589123, 0, 0, 0, 1, 1,
0.8540549, 0.2373101, 1.448473, 0, 0, 0, 1, 1,
0.8564953, 0.09479127, 1.179179, 0, 0, 0, 1, 1,
0.8585882, -1.122889, 3.924574, 0, 0, 0, 1, 1,
0.8632687, -1.078711, 4.096661, 1, 1, 1, 1, 1,
0.8639274, -1.791921, 3.238806, 1, 1, 1, 1, 1,
0.8663534, 2.197006, -0.6236387, 1, 1, 1, 1, 1,
0.8680533, -1.353757, 3.279693, 1, 1, 1, 1, 1,
0.8711991, -1.029124, 3.441943, 1, 1, 1, 1, 1,
0.8758443, 0.7084774, -0.3015324, 1, 1, 1, 1, 1,
0.880406, 1.249629, 1.285741, 1, 1, 1, 1, 1,
0.8817561, 0.5218807, 1.194452, 1, 1, 1, 1, 1,
0.8977923, -2.577777, 3.787712, 1, 1, 1, 1, 1,
0.8983766, -1.313659, 2.8129, 1, 1, 1, 1, 1,
0.9061267, -0.8958932, 2.704037, 1, 1, 1, 1, 1,
0.907107, -0.3843876, 0.6349591, 1, 1, 1, 1, 1,
0.9104272, 0.8426677, 0.9429718, 1, 1, 1, 1, 1,
0.9105752, 0.6743656, -0.3203194, 1, 1, 1, 1, 1,
0.9126015, -0.4393633, 3.694748, 1, 1, 1, 1, 1,
0.9130124, -1.526083, 2.433789, 0, 0, 1, 1, 1,
0.9157795, 0.2058948, 2.083887, 1, 0, 0, 1, 1,
0.9183232, 0.6267596, 0.9734405, 1, 0, 0, 1, 1,
0.9198373, 0.2171727, 3.004943, 1, 0, 0, 1, 1,
0.9225945, -1.379904, 1.160283, 1, 0, 0, 1, 1,
0.9231706, 1.07092, 1.238959, 1, 0, 0, 1, 1,
0.9243026, -1.367627, 2.740569, 0, 0, 0, 1, 1,
0.926155, 1.373767, 0.5246183, 0, 0, 0, 1, 1,
0.928915, 0.6453536, -0.3832123, 0, 0, 0, 1, 1,
0.9393285, -0.607639, 2.66201, 0, 0, 0, 1, 1,
0.9454579, 0.1782002, 3.477242, 0, 0, 0, 1, 1,
0.9541439, 0.9869002, 1.244673, 0, 0, 0, 1, 1,
0.9552858, 1.016659, 1.108432, 0, 0, 0, 1, 1,
0.9609067, -0.4927246, 2.534148, 1, 1, 1, 1, 1,
0.9614336, 0.4615856, 0.3721503, 1, 1, 1, 1, 1,
0.9654331, 0.1739705, 0.846379, 1, 1, 1, 1, 1,
0.9719102, -0.08817528, 0.7048185, 1, 1, 1, 1, 1,
0.9841045, -0.3957259, 2.461943, 1, 1, 1, 1, 1,
0.9847978, 1.44231, 1.358692, 1, 1, 1, 1, 1,
0.9876995, 0.4497903, 1.401106, 1, 1, 1, 1, 1,
0.9884136, -1.482377, 3.867846, 1, 1, 1, 1, 1,
0.9908592, -0.7643179, 2.289041, 1, 1, 1, 1, 1,
1.006103, -0.5561063, -0.5089071, 1, 1, 1, 1, 1,
1.021819, -0.502786, 3.32812, 1, 1, 1, 1, 1,
1.025245, -1.484147, 2.594849, 1, 1, 1, 1, 1,
1.025454, -1.258872, 4.205456, 1, 1, 1, 1, 1,
1.0265, 0.4115287, 1.684086, 1, 1, 1, 1, 1,
1.033068, -0.1495582, 1.875682, 1, 1, 1, 1, 1,
1.033195, 1.959154, -0.09835149, 0, 0, 1, 1, 1,
1.044511, 1.262055, -0.6823108, 1, 0, 0, 1, 1,
1.046207, -0.3097993, 2.006946, 1, 0, 0, 1, 1,
1.051043, -1.576535, 0.7379081, 1, 0, 0, 1, 1,
1.055835, 0.1770938, 1.179137, 1, 0, 0, 1, 1,
1.061907, -1.30332, 5.388369, 1, 0, 0, 1, 1,
1.066106, 1.056351, 0.7574428, 0, 0, 0, 1, 1,
1.070548, 0.1275653, 2.370435, 0, 0, 0, 1, 1,
1.075383, -0.3192414, 1.306669, 0, 0, 0, 1, 1,
1.081497, 0.5012712, 1.234023, 0, 0, 0, 1, 1,
1.084302, 0.9938163, 0.6229149, 0, 0, 0, 1, 1,
1.087167, 0.03633388, 2.508587, 0, 0, 0, 1, 1,
1.087291, 0.286686, 2.510222, 0, 0, 0, 1, 1,
1.089597, -0.3721623, 2.304391, 1, 1, 1, 1, 1,
1.091221, 0.5416564, 0.2949889, 1, 1, 1, 1, 1,
1.098726, -0.488121, 0.7172931, 1, 1, 1, 1, 1,
1.114988, -1.008802, 2.893618, 1, 1, 1, 1, 1,
1.116015, 0.6700506, 1.24669, 1, 1, 1, 1, 1,
1.117168, -1.185551, 0.4845955, 1, 1, 1, 1, 1,
1.120239, -0.07134157, 2.56684, 1, 1, 1, 1, 1,
1.120591, 0.4841305, -0.1876759, 1, 1, 1, 1, 1,
1.129093, -0.427937, 2.589535, 1, 1, 1, 1, 1,
1.133804, 3.405991, -1.837926, 1, 1, 1, 1, 1,
1.135574, -0.9226908, 2.206939, 1, 1, 1, 1, 1,
1.149562, -0.2630421, 2.968405, 1, 1, 1, 1, 1,
1.161877, -1.382934, 3.252239, 1, 1, 1, 1, 1,
1.163004, 0.6394819, 1.299601, 1, 1, 1, 1, 1,
1.164344, -1.102778, 0.7259192, 1, 1, 1, 1, 1,
1.166695, 1.149425, -0.1212638, 0, 0, 1, 1, 1,
1.173193, 0.2138387, 0.1521535, 1, 0, 0, 1, 1,
1.176518, -0.7045667, 3.475915, 1, 0, 0, 1, 1,
1.176636, 0.1480516, 2.23284, 1, 0, 0, 1, 1,
1.179143, -0.08586863, 1.766937, 1, 0, 0, 1, 1,
1.18094, -0.6315166, 1.426056, 1, 0, 0, 1, 1,
1.182088, 1.529822, -2.074298, 0, 0, 0, 1, 1,
1.19399, 0.5865383, 1.751264, 0, 0, 0, 1, 1,
1.19944, 0.1596928, 2.629943, 0, 0, 0, 1, 1,
1.212156, -1.59096, 0.8413587, 0, 0, 0, 1, 1,
1.213831, -0.2832411, 3.131103, 0, 0, 0, 1, 1,
1.21436, -0.2798307, 1.11987, 0, 0, 0, 1, 1,
1.218169, -0.01694834, 1.33032, 0, 0, 0, 1, 1,
1.218698, -2.601861, 1.415753, 1, 1, 1, 1, 1,
1.218851, -0.23297, 1.997708, 1, 1, 1, 1, 1,
1.223686, 0.4414836, 0.928031, 1, 1, 1, 1, 1,
1.224314, -1.436279, 3.494473, 1, 1, 1, 1, 1,
1.225836, -1.017035, 3.039558, 1, 1, 1, 1, 1,
1.23354, 0.06349117, 3.06632, 1, 1, 1, 1, 1,
1.237438, 0.4317372, 0.10997, 1, 1, 1, 1, 1,
1.251666, -0.2279244, 1.990199, 1, 1, 1, 1, 1,
1.252735, 0.3333438, 1.480787, 1, 1, 1, 1, 1,
1.263282, 0.2205706, 0.9953356, 1, 1, 1, 1, 1,
1.267419, -0.1568279, 2.158036, 1, 1, 1, 1, 1,
1.284503, -0.262763, 0.4760655, 1, 1, 1, 1, 1,
1.286332, -0.8854058, 1.171759, 1, 1, 1, 1, 1,
1.294459, -0.1695063, 1.577025, 1, 1, 1, 1, 1,
1.2957, 0.01169211, 1.806326, 1, 1, 1, 1, 1,
1.299187, 0.1999972, 0.9704526, 0, 0, 1, 1, 1,
1.312715, 0.2152172, 1.27479, 1, 0, 0, 1, 1,
1.314731, 1.340748, 0.01275271, 1, 0, 0, 1, 1,
1.318874, -0.8300539, 2.169676, 1, 0, 0, 1, 1,
1.325204, 1.571955, 0.8909926, 1, 0, 0, 1, 1,
1.328248, 2.203262, 2.298627, 1, 0, 0, 1, 1,
1.337219, 0.1280506, 1.879108, 0, 0, 0, 1, 1,
1.342834, -0.8561253, -0.4155346, 0, 0, 0, 1, 1,
1.350798, 0.205467, 2.460152, 0, 0, 0, 1, 1,
1.352644, -1.031877, 3.690021, 0, 0, 0, 1, 1,
1.353379, -0.9150851, 1.419802, 0, 0, 0, 1, 1,
1.354212, 0.8829645, -0.4639947, 0, 0, 0, 1, 1,
1.358416, 0.02165182, 1.96543, 0, 0, 0, 1, 1,
1.367283, -1.091443, 2.417315, 1, 1, 1, 1, 1,
1.37579, 0.8719265, 2.04188, 1, 1, 1, 1, 1,
1.379886, 0.6697312, 1.425497, 1, 1, 1, 1, 1,
1.384098, 0.2697772, 0.7358634, 1, 1, 1, 1, 1,
1.404852, -0.215142, 1.967117, 1, 1, 1, 1, 1,
1.405248, -0.9667118, 2.523051, 1, 1, 1, 1, 1,
1.410865, 0.2399077, 0.1265045, 1, 1, 1, 1, 1,
1.42019, -0.2877157, 2.083828, 1, 1, 1, 1, 1,
1.421883, 0.1134305, 1.13547, 1, 1, 1, 1, 1,
1.425595, -1.029462, 2.264786, 1, 1, 1, 1, 1,
1.43252, 0.3209334, 1.212634, 1, 1, 1, 1, 1,
1.437551, 0.04209491, 2.721298, 1, 1, 1, 1, 1,
1.439499, 0.8922725, 0.3302715, 1, 1, 1, 1, 1,
1.442441, 0.7090747, 1.653534, 1, 1, 1, 1, 1,
1.444694, 1.000042, 0.8527692, 1, 1, 1, 1, 1,
1.446894, 0.8209311, 3.825913, 0, 0, 1, 1, 1,
1.44832, 0.4398611, 1.710355, 1, 0, 0, 1, 1,
1.460963, 0.2551723, -0.2198389, 1, 0, 0, 1, 1,
1.470098, -0.4657794, 2.630415, 1, 0, 0, 1, 1,
1.47731, 0.7598652, 1.456752, 1, 0, 0, 1, 1,
1.47902, 0.5844493, 3.125772, 1, 0, 0, 1, 1,
1.487804, 1.761813, 2.013603, 0, 0, 0, 1, 1,
1.519347, 0.2647985, 1.208409, 0, 0, 0, 1, 1,
1.520331, 0.3610441, 2.395715, 0, 0, 0, 1, 1,
1.527291, -0.9144224, 0.7814979, 0, 0, 0, 1, 1,
1.53195, 0.06384798, 2.40842, 0, 0, 0, 1, 1,
1.537043, -0.8613331, 2.475893, 0, 0, 0, 1, 1,
1.540926, 0.2231283, 1.430366, 0, 0, 0, 1, 1,
1.544426, 1.12259, 1.262696, 1, 1, 1, 1, 1,
1.547398, 0.446679, -0.3065757, 1, 1, 1, 1, 1,
1.574187, 0.117585, 2.237043, 1, 1, 1, 1, 1,
1.57777, -0.5760617, 0.4366165, 1, 1, 1, 1, 1,
1.583642, -1.832959, 2.852271, 1, 1, 1, 1, 1,
1.58383, 1.06675, 0.5206719, 1, 1, 1, 1, 1,
1.59406, 0.1250601, 0.9821708, 1, 1, 1, 1, 1,
1.601599, -0.4995466, 0.7717395, 1, 1, 1, 1, 1,
1.602438, -2.412566, 3.483227, 1, 1, 1, 1, 1,
1.610367, -0.3778321, 2.595973, 1, 1, 1, 1, 1,
1.626628, -0.890779, 0.2257706, 1, 1, 1, 1, 1,
1.634563, -0.6697198, 0.9932455, 1, 1, 1, 1, 1,
1.638877, -0.2296795, 4.016829, 1, 1, 1, 1, 1,
1.669993, -1.025998, 3.301253, 1, 1, 1, 1, 1,
1.670145, -2.680005, 3.75278, 1, 1, 1, 1, 1,
1.675099, 0.7200134, -1.055026, 0, 0, 1, 1, 1,
1.68759, -1.350985, 2.263714, 1, 0, 0, 1, 1,
1.687893, 0.2299515, 1.242939, 1, 0, 0, 1, 1,
1.736189, -0.8863131, 2.561273, 1, 0, 0, 1, 1,
1.739372, -0.5388913, 0.9738256, 1, 0, 0, 1, 1,
1.744509, 0.1487744, 1.179257, 1, 0, 0, 1, 1,
1.754706, 0.7870599, 1.707136, 0, 0, 0, 1, 1,
1.762451, 1.407759, 0.6311132, 0, 0, 0, 1, 1,
1.773706, -1.14636, 1.924406, 0, 0, 0, 1, 1,
1.777695, 0.6257826, 0.7638577, 0, 0, 0, 1, 1,
1.807948, -0.1098398, 2.091242, 0, 0, 0, 1, 1,
1.811363, -0.309926, 2.077232, 0, 0, 0, 1, 1,
1.815188, -0.2051292, 2.496021, 0, 0, 0, 1, 1,
1.824371, 0.8537498, 1.269723, 1, 1, 1, 1, 1,
1.834057, 0.4046735, 1.509343, 1, 1, 1, 1, 1,
1.83673, 0.1104029, 2.271622, 1, 1, 1, 1, 1,
1.84408, 0.278254, 2.285718, 1, 1, 1, 1, 1,
1.867503, -0.7252112, 2.134309, 1, 1, 1, 1, 1,
1.908551, 0.3310132, 2.070366, 1, 1, 1, 1, 1,
1.909398, 0.161116, 0.6898026, 1, 1, 1, 1, 1,
1.91275, -1.216364, 0.928993, 1, 1, 1, 1, 1,
1.933625, 0.09591665, 1.256787, 1, 1, 1, 1, 1,
1.94279, 1.804974, 1.355701, 1, 1, 1, 1, 1,
1.946694, -0.04011024, 1.248884, 1, 1, 1, 1, 1,
2.024369, 0.5892947, 1.977918, 1, 1, 1, 1, 1,
2.053358, -0.5242752, 3.474498, 1, 1, 1, 1, 1,
2.056799, -1.886534, 2.481352, 1, 1, 1, 1, 1,
2.07125, 0.8608436, 1.445301, 1, 1, 1, 1, 1,
2.093143, 1.237213, -0.607051, 0, 0, 1, 1, 1,
2.133182, 1.132094, 1.240119, 1, 0, 0, 1, 1,
2.200657, 0.4264969, 0.8350657, 1, 0, 0, 1, 1,
2.22611, -0.7817711, 1.487225, 1, 0, 0, 1, 1,
2.24278, 0.1370013, 2.076247, 1, 0, 0, 1, 1,
2.272023, -0.6905686, -0.09152702, 1, 0, 0, 1, 1,
2.306231, 0.629838, 1.361448, 0, 0, 0, 1, 1,
2.351368, 0.76701, 2.790192, 0, 0, 0, 1, 1,
2.413025, -0.8287891, 1.450107, 0, 0, 0, 1, 1,
2.433964, 1.690417, 0.9824298, 0, 0, 0, 1, 1,
2.453327, 1.253664, 3.422935, 0, 0, 0, 1, 1,
2.529894, 0.8337596, -0.08158115, 0, 0, 0, 1, 1,
2.533286, 1.663954, 1.704984, 0, 0, 0, 1, 1,
2.539405, -1.184506, 2.26707, 1, 1, 1, 1, 1,
2.571288, 0.2948793, 0.8506369, 1, 1, 1, 1, 1,
2.57973, -0.392575, 2.365748, 1, 1, 1, 1, 1,
2.636505, 2.182726, 0.505819, 1, 1, 1, 1, 1,
2.862424, 1.255068, 1.586293, 1, 1, 1, 1, 1,
2.870395, 0.07759345, 2.431079, 1, 1, 1, 1, 1,
3.001803, -0.6609297, 0.7180707, 1, 1, 1, 1, 1
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
var radius = 9.605848;
var distance = 33.74013;
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
mvMatrix.translate( 0.1776478, 0.04369736, -0.1441252 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.74013);
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
