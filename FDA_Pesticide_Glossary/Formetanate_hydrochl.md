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
-2.774093, -0.6220925, -1.385358, 1, 0, 0, 1,
-2.759273, -0.5778797, -3.29001, 1, 0.007843138, 0, 1,
-2.705901, 1.514416, -2.317147, 1, 0.01176471, 0, 1,
-2.665594, 0.3397726, -1.306, 1, 0.01960784, 0, 1,
-2.655845, 0.6426498, -0.6011291, 1, 0.02352941, 0, 1,
-2.63279, -1.102438, -2.507504, 1, 0.03137255, 0, 1,
-2.624654, -0.9729568, -2.941814, 1, 0.03529412, 0, 1,
-2.61612, 0.118999, -0.08713949, 1, 0.04313726, 0, 1,
-2.52073, -0.7969908, -2.573317, 1, 0.04705882, 0, 1,
-2.404199, -0.5089055, -2.193532, 1, 0.05490196, 0, 1,
-2.397539, -0.6223683, -2.361072, 1, 0.05882353, 0, 1,
-2.389732, 0.8484425, -2.69153, 1, 0.06666667, 0, 1,
-2.385433, -1.04979, -2.723656, 1, 0.07058824, 0, 1,
-2.317617, -0.2398044, -1.425229, 1, 0.07843138, 0, 1,
-2.249291, 0.3147938, -1.239888, 1, 0.08235294, 0, 1,
-2.244694, -1.791231, -2.350228, 1, 0.09019608, 0, 1,
-2.239088, -0.4918538, -2.804503, 1, 0.09411765, 0, 1,
-2.205976, -0.06047363, -2.656568, 1, 0.1019608, 0, 1,
-2.191936, 1.463847, -1.043405, 1, 0.1098039, 0, 1,
-2.175988, -0.4558771, -2.357819, 1, 0.1137255, 0, 1,
-2.16551, 0.4032641, -1.489746, 1, 0.1215686, 0, 1,
-2.134726, 0.08761635, -0.451842, 1, 0.1254902, 0, 1,
-2.121702, -0.5178549, -1.05656, 1, 0.1333333, 0, 1,
-2.060346, 0.633458, -0.23529, 1, 0.1372549, 0, 1,
-2.059689, -0.2968272, -1.01136, 1, 0.145098, 0, 1,
-2.045582, -0.4430544, -1.771512, 1, 0.1490196, 0, 1,
-2.043516, -0.02049923, -2.854943, 1, 0.1568628, 0, 1,
-2.033788, 0.4622558, -1.945863, 1, 0.1607843, 0, 1,
-2.028731, 0.45919, -2.112134, 1, 0.1686275, 0, 1,
-2.023467, -2.106627, -1.937022, 1, 0.172549, 0, 1,
-1.995548, 1.118828, -1.706842, 1, 0.1803922, 0, 1,
-1.90685, -0.9688137, -2.884281, 1, 0.1843137, 0, 1,
-1.894094, 0.4663251, -1.211666, 1, 0.1921569, 0, 1,
-1.886788, 1.544277, 0.6676223, 1, 0.1960784, 0, 1,
-1.851165, 0.1794809, -1.260006, 1, 0.2039216, 0, 1,
-1.846741, -1.23263, -3.535276, 1, 0.2117647, 0, 1,
-1.826295, 1.483966, -0.5814711, 1, 0.2156863, 0, 1,
-1.823756, -0.7939605, -0.8623337, 1, 0.2235294, 0, 1,
-1.809828, 0.2228008, -0.3369321, 1, 0.227451, 0, 1,
-1.79404, 1.70725, -1.129962, 1, 0.2352941, 0, 1,
-1.792634, -0.8696877, -2.238344, 1, 0.2392157, 0, 1,
-1.779046, -0.535723, -1.72988, 1, 0.2470588, 0, 1,
-1.772614, -0.1818426, -1.484294, 1, 0.2509804, 0, 1,
-1.761885, -1.010041, -0.6177692, 1, 0.2588235, 0, 1,
-1.730397, -0.01093504, -1.819533, 1, 0.2627451, 0, 1,
-1.729166, -0.3382663, -1.151355, 1, 0.2705882, 0, 1,
-1.703531, 0.164654, -2.764698, 1, 0.2745098, 0, 1,
-1.69256, 1.289864, -0.3672971, 1, 0.282353, 0, 1,
-1.68654, -0.3030511, -1.989223, 1, 0.2862745, 0, 1,
-1.660729, 0.3829765, -0.8401047, 1, 0.2941177, 0, 1,
-1.642579, 1.720647, -0.2301995, 1, 0.3019608, 0, 1,
-1.630753, 1.495682, -0.4312378, 1, 0.3058824, 0, 1,
-1.626569, -0.9359567, -3.290396, 1, 0.3137255, 0, 1,
-1.624532, 0.2364404, -1.033775, 1, 0.3176471, 0, 1,
-1.613162, 0.4959774, -2.280598, 1, 0.3254902, 0, 1,
-1.61108, -0.7135412, -1.867759, 1, 0.3294118, 0, 1,
-1.593224, -0.8299732, -2.021524, 1, 0.3372549, 0, 1,
-1.59131, 1.104999, -1.786113, 1, 0.3411765, 0, 1,
-1.585208, 0.2708283, -1.195479, 1, 0.3490196, 0, 1,
-1.565163, 0.2058132, -1.90553, 1, 0.3529412, 0, 1,
-1.562067, -1.170389, -2.97202, 1, 0.3607843, 0, 1,
-1.561399, 0.3169044, -1.561882, 1, 0.3647059, 0, 1,
-1.559298, 1.63972, -0.9930817, 1, 0.372549, 0, 1,
-1.557871, -0.6294423, -3.216427, 1, 0.3764706, 0, 1,
-1.549255, 0.4528031, -2.05808, 1, 0.3843137, 0, 1,
-1.539251, -1.761629, -2.276159, 1, 0.3882353, 0, 1,
-1.528584, 0.6926289, -0.06352518, 1, 0.3960784, 0, 1,
-1.520057, 0.624047, -0.6675615, 1, 0.4039216, 0, 1,
-1.517968, 1.158263, -0.755595, 1, 0.4078431, 0, 1,
-1.514068, -0.004839355, -1.09934, 1, 0.4156863, 0, 1,
-1.503671, -0.5031781, -2.489953, 1, 0.4196078, 0, 1,
-1.498773, 0.6981473, -1.661305, 1, 0.427451, 0, 1,
-1.496254, 0.7613528, 0.1558038, 1, 0.4313726, 0, 1,
-1.494071, 1.79188, 0.4727282, 1, 0.4392157, 0, 1,
-1.486365, 1.270029, 1.684152, 1, 0.4431373, 0, 1,
-1.483908, -0.4871179, -1.886719, 1, 0.4509804, 0, 1,
-1.473428, 0.0811079, -0.7186371, 1, 0.454902, 0, 1,
-1.465117, 1.373673, 0.2868306, 1, 0.4627451, 0, 1,
-1.463591, -0.781555, -4.809216, 1, 0.4666667, 0, 1,
-1.459569, -1.138814, -3.563452, 1, 0.4745098, 0, 1,
-1.456376, -0.1597292, -1.391728, 1, 0.4784314, 0, 1,
-1.447043, 0.5538424, -0.6417101, 1, 0.4862745, 0, 1,
-1.428396, 0.5604483, -0.5883021, 1, 0.4901961, 0, 1,
-1.426168, -2.955489, -2.36236, 1, 0.4980392, 0, 1,
-1.422574, 0.291085, -0.1542563, 1, 0.5058824, 0, 1,
-1.418415, -0.5295594, -2.111237, 1, 0.509804, 0, 1,
-1.407535, 2.041969, -1.424867, 1, 0.5176471, 0, 1,
-1.406248, -0.3996633, -2.39082, 1, 0.5215687, 0, 1,
-1.399392, 1.136302, -1.156359, 1, 0.5294118, 0, 1,
-1.392489, 0.4850537, -1.107618, 1, 0.5333334, 0, 1,
-1.372637, -0.08297253, -3.007711, 1, 0.5411765, 0, 1,
-1.363822, -0.2688782, -1.159974, 1, 0.5450981, 0, 1,
-1.355394, 0.1923013, -2.00603, 1, 0.5529412, 0, 1,
-1.35248, 0.6240153, -1.019083, 1, 0.5568628, 0, 1,
-1.343312, -0.2981265, -1.197327, 1, 0.5647059, 0, 1,
-1.337629, 0.6196436, -0.6793219, 1, 0.5686275, 0, 1,
-1.329425, 0.68137, -0.5870869, 1, 0.5764706, 0, 1,
-1.318726, 0.7750037, -0.391142, 1, 0.5803922, 0, 1,
-1.317762, 0.5217723, -0.1934514, 1, 0.5882353, 0, 1,
-1.315906, -0.2329195, -0.7313183, 1, 0.5921569, 0, 1,
-1.315075, -0.6222311, -1.507553, 1, 0.6, 0, 1,
-1.311724, -0.1652527, -0.6052986, 1, 0.6078432, 0, 1,
-1.305068, 0.2774416, -2.535947, 1, 0.6117647, 0, 1,
-1.295588, 0.3431402, -0.8560169, 1, 0.6196079, 0, 1,
-1.287299, 1.92968, -3.675999, 1, 0.6235294, 0, 1,
-1.285275, 0.7764834, -0.2068779, 1, 0.6313726, 0, 1,
-1.282441, -0.6905508, -1.647614, 1, 0.6352941, 0, 1,
-1.282368, -0.2041881, -0.9383014, 1, 0.6431373, 0, 1,
-1.271412, 1.060787, 0.725402, 1, 0.6470588, 0, 1,
-1.267914, -1.59877, -2.787491, 1, 0.654902, 0, 1,
-1.261661, 1.070547, -0.3855534, 1, 0.6588235, 0, 1,
-1.257588, 0.6709161, -1.182692, 1, 0.6666667, 0, 1,
-1.25522, 0.5376659, -0.1605689, 1, 0.6705883, 0, 1,
-1.250324, -0.5877765, -2.233666, 1, 0.6784314, 0, 1,
-1.24816, -0.2700203, -1.108651, 1, 0.682353, 0, 1,
-1.240482, 0.5875558, -0.1093332, 1, 0.6901961, 0, 1,
-1.238433, -0.1058942, -1.116459, 1, 0.6941177, 0, 1,
-1.236726, 0.2547568, -3.517741, 1, 0.7019608, 0, 1,
-1.23309, 0.5547927, -1.422658, 1, 0.7098039, 0, 1,
-1.226629, 0.3429678, -0.6471456, 1, 0.7137255, 0, 1,
-1.217162, 0.2198765, -1.945423, 1, 0.7215686, 0, 1,
-1.216616, -0.2173259, -1.44245, 1, 0.7254902, 0, 1,
-1.215278, 0.7472098, -1.831606, 1, 0.7333333, 0, 1,
-1.192447, -0.4495703, -1.564459, 1, 0.7372549, 0, 1,
-1.190406, 0.8886614, 1.139753, 1, 0.7450981, 0, 1,
-1.186815, 0.01917978, -1.401768, 1, 0.7490196, 0, 1,
-1.177387, 0.5146322, -1.010836, 1, 0.7568628, 0, 1,
-1.176768, -0.5374144, -0.238068, 1, 0.7607843, 0, 1,
-1.16661, -0.002488319, -1.884677, 1, 0.7686275, 0, 1,
-1.163536, -3.024004, -2.841676, 1, 0.772549, 0, 1,
-1.157851, 0.0008323543, -1.114164, 1, 0.7803922, 0, 1,
-1.157099, -0.06101134, -2.166278, 1, 0.7843137, 0, 1,
-1.154122, 0.06434906, -1.59861, 1, 0.7921569, 0, 1,
-1.152116, 0.3040304, -1.554626, 1, 0.7960784, 0, 1,
-1.151836, 0.08272129, -2.701637, 1, 0.8039216, 0, 1,
-1.148287, -1.05021, -1.117873, 1, 0.8117647, 0, 1,
-1.146348, 0.6886896, -1.628816, 1, 0.8156863, 0, 1,
-1.139598, 2.324295, -1.284556, 1, 0.8235294, 0, 1,
-1.137433, -0.2914674, -0.3620695, 1, 0.827451, 0, 1,
-1.132128, 1.573833, -0.2636766, 1, 0.8352941, 0, 1,
-1.129243, -1.010824, -3.061805, 1, 0.8392157, 0, 1,
-1.125738, 0.1656694, -0.7412598, 1, 0.8470588, 0, 1,
-1.123935, -0.2667793, -2.292659, 1, 0.8509804, 0, 1,
-1.12264, -0.2762599, -0.9371045, 1, 0.8588235, 0, 1,
-1.110896, 0.5472654, 1.116998, 1, 0.8627451, 0, 1,
-1.101481, 1.296364, -2.730416, 1, 0.8705882, 0, 1,
-1.101359, -1.522273, -3.781597, 1, 0.8745098, 0, 1,
-1.100671, 1.904078, -0.4171114, 1, 0.8823529, 0, 1,
-1.096253, -1.26677, -2.469024, 1, 0.8862745, 0, 1,
-1.095519, 0.0938577, -1.050076, 1, 0.8941177, 0, 1,
-1.094489, 2.074066, -0.9042821, 1, 0.8980392, 0, 1,
-1.094462, 0.7986646, -1.354514, 1, 0.9058824, 0, 1,
-1.092365, 0.6046714, -1.181576, 1, 0.9137255, 0, 1,
-1.07977, -0.8621179, -1.842279, 1, 0.9176471, 0, 1,
-1.074389, -0.1722998, -1.939758, 1, 0.9254902, 0, 1,
-1.073629, 0.06565078, -1.982461, 1, 0.9294118, 0, 1,
-1.065393, -0.5111883, -1.694605, 1, 0.9372549, 0, 1,
-1.058071, -0.9176823, -3.157128, 1, 0.9411765, 0, 1,
-1.057288, 1.301959, -1.131771, 1, 0.9490196, 0, 1,
-1.056687, 0.8608829, -2.522396, 1, 0.9529412, 0, 1,
-1.05564, -0.4755639, -2.358443, 1, 0.9607843, 0, 1,
-1.04864, 0.7415184, 0.5060934, 1, 0.9647059, 0, 1,
-1.046288, 1.460878, -2.944353, 1, 0.972549, 0, 1,
-1.043217, -0.07913781, -1.524781, 1, 0.9764706, 0, 1,
-1.040746, -0.08538319, -0.9407432, 1, 0.9843137, 0, 1,
-1.037986, -1.244743, -1.744963, 1, 0.9882353, 0, 1,
-1.029871, 0.5718957, -0.8376822, 1, 0.9960784, 0, 1,
-1.028793, 0.9768331, -1.011037, 0.9960784, 1, 0, 1,
-1.023566, -1.756382, -1.902408, 0.9921569, 1, 0, 1,
-1.023472, -0.7839329, -0.7779869, 0.9843137, 1, 0, 1,
-1.021048, -2.187058, -2.903626, 0.9803922, 1, 0, 1,
-1.018661, 1.003919, -0.2013456, 0.972549, 1, 0, 1,
-1.013121, 1.425931, 1.489493, 0.9686275, 1, 0, 1,
-1.009276, 1.516824, -0.608297, 0.9607843, 1, 0, 1,
-0.999759, 0.6485532, -1.980237, 0.9568627, 1, 0, 1,
-0.9970294, 0.2229311, -0.4210315, 0.9490196, 1, 0, 1,
-0.9918049, 0.9653798, -2.217963, 0.945098, 1, 0, 1,
-0.9850733, 2.60413, -0.9307682, 0.9372549, 1, 0, 1,
-0.9784868, -0.6564783, -1.569448, 0.9333333, 1, 0, 1,
-0.9653765, 0.2420529, -2.186173, 0.9254902, 1, 0, 1,
-0.9621494, 1.239004, -0.6512771, 0.9215686, 1, 0, 1,
-0.9579357, -0.6192908, -1.311059, 0.9137255, 1, 0, 1,
-0.9571667, 0.3329004, -0.941595, 0.9098039, 1, 0, 1,
-0.9532135, 1.613317, 0.8880038, 0.9019608, 1, 0, 1,
-0.9504222, -0.9087225, -2.556466, 0.8941177, 1, 0, 1,
-0.948643, 0.8629902, -1.046805, 0.8901961, 1, 0, 1,
-0.9473079, 0.9905404, -1.048339, 0.8823529, 1, 0, 1,
-0.946802, -2.228908, -3.518116, 0.8784314, 1, 0, 1,
-0.9456965, -0.04316276, -1.977772, 0.8705882, 1, 0, 1,
-0.9423605, -0.4343312, -0.5338774, 0.8666667, 1, 0, 1,
-0.9416, 0.7586105, -0.7315292, 0.8588235, 1, 0, 1,
-0.9385248, 1.570906, -1.616076, 0.854902, 1, 0, 1,
-0.9275178, 1.140448, 0.7099689, 0.8470588, 1, 0, 1,
-0.9184513, -1.444565, -1.290887, 0.8431373, 1, 0, 1,
-0.9138799, -1.707662, -2.042825, 0.8352941, 1, 0, 1,
-0.9103912, 1.42012, -0.7368875, 0.8313726, 1, 0, 1,
-0.9056311, -1.332274, -2.811319, 0.8235294, 1, 0, 1,
-0.8933286, -0.1533572, -1.936111, 0.8196079, 1, 0, 1,
-0.8880678, -0.420939, -3.148717, 0.8117647, 1, 0, 1,
-0.8836448, -0.07127306, -2.528453, 0.8078431, 1, 0, 1,
-0.8774546, -1.879098, -1.593983, 0.8, 1, 0, 1,
-0.8628426, -1.146555, -4.020504, 0.7921569, 1, 0, 1,
-0.8616344, 0.9172153, 0.2304248, 0.7882353, 1, 0, 1,
-0.8604023, 0.958581, 0.542578, 0.7803922, 1, 0, 1,
-0.8596795, -0.4770271, -2.581291, 0.7764706, 1, 0, 1,
-0.8501231, -1.36389, -2.029975, 0.7686275, 1, 0, 1,
-0.8483334, -1.278609, -2.544188, 0.7647059, 1, 0, 1,
-0.8466595, 1.252956, -2.515673, 0.7568628, 1, 0, 1,
-0.8445053, -0.6956126, -2.061097, 0.7529412, 1, 0, 1,
-0.8434283, 0.2357232, -0.2103977, 0.7450981, 1, 0, 1,
-0.8423411, -0.3052208, -1.209038, 0.7411765, 1, 0, 1,
-0.8392717, -0.4839189, -1.967333, 0.7333333, 1, 0, 1,
-0.8218264, 0.3784333, -1.439186, 0.7294118, 1, 0, 1,
-0.8160674, -0.7874662, -2.582043, 0.7215686, 1, 0, 1,
-0.8066999, 0.1128024, -1.542755, 0.7176471, 1, 0, 1,
-0.8043365, -2.776958, -4.003161, 0.7098039, 1, 0, 1,
-0.8041177, -0.3296259, -2.383645, 0.7058824, 1, 0, 1,
-0.8041087, -0.5684685, -0.8683606, 0.6980392, 1, 0, 1,
-0.8022093, -1.74746, -4.915382, 0.6901961, 1, 0, 1,
-0.7964367, -0.1180942, 0.1422777, 0.6862745, 1, 0, 1,
-0.7946997, -0.8561739, -2.249388, 0.6784314, 1, 0, 1,
-0.7929173, -0.4279486, -1.076721, 0.6745098, 1, 0, 1,
-0.7918786, -0.9821062, -1.469413, 0.6666667, 1, 0, 1,
-0.7794358, -1.680863, -1.441209, 0.6627451, 1, 0, 1,
-0.7742285, -0.3098919, -0.5605519, 0.654902, 1, 0, 1,
-0.7582553, -0.2358532, -1.470825, 0.6509804, 1, 0, 1,
-0.7559923, -0.8703206, -2.459357, 0.6431373, 1, 0, 1,
-0.7556758, -0.6732647, -3.313208, 0.6392157, 1, 0, 1,
-0.7536946, 0.8218444, -1.608547, 0.6313726, 1, 0, 1,
-0.7518464, -1.215946, -2.615691, 0.627451, 1, 0, 1,
-0.7509943, 0.7587425, -0.4835823, 0.6196079, 1, 0, 1,
-0.74488, 0.216345, 0.2203511, 0.6156863, 1, 0, 1,
-0.7446351, -0.4339585, -2.987404, 0.6078432, 1, 0, 1,
-0.7426016, 0.7202052, -2.035455, 0.6039216, 1, 0, 1,
-0.7401736, 1.015184, -0.685056, 0.5960785, 1, 0, 1,
-0.7364125, -0.2121345, -0.7915286, 0.5882353, 1, 0, 1,
-0.7359643, 0.2325725, -0.5722283, 0.5843138, 1, 0, 1,
-0.7346318, 0.7464246, -0.7556387, 0.5764706, 1, 0, 1,
-0.7317544, -0.2952514, -1.94563, 0.572549, 1, 0, 1,
-0.7250257, -0.1860678, -3.385938, 0.5647059, 1, 0, 1,
-0.7244544, -0.893795, -0.775474, 0.5607843, 1, 0, 1,
-0.7188873, 1.088691, -0.7864639, 0.5529412, 1, 0, 1,
-0.7159715, 0.5986511, -1.089864, 0.5490196, 1, 0, 1,
-0.7138898, -1.627796, -0.400173, 0.5411765, 1, 0, 1,
-0.7108873, -0.6279838, -3.592594, 0.5372549, 1, 0, 1,
-0.6991221, -1.280518, -1.472278, 0.5294118, 1, 0, 1,
-0.6939346, -0.8390011, -0.922443, 0.5254902, 1, 0, 1,
-0.6904127, -0.4734409, -2.783316, 0.5176471, 1, 0, 1,
-0.6891056, 0.007725823, -2.583316, 0.5137255, 1, 0, 1,
-0.6890019, -0.02279802, -2.811666, 0.5058824, 1, 0, 1,
-0.6852562, 1.024998, 0.4731604, 0.5019608, 1, 0, 1,
-0.6759134, 0.5921162, -0.531386, 0.4941176, 1, 0, 1,
-0.6732088, -2.551952, -3.112051, 0.4862745, 1, 0, 1,
-0.6688088, 0.5442753, 0.2187638, 0.4823529, 1, 0, 1,
-0.6601322, 0.0330821, -1.631604, 0.4745098, 1, 0, 1,
-0.6582932, 0.002382405, -1.814987, 0.4705882, 1, 0, 1,
-0.6556724, -0.6503862, -4.227935, 0.4627451, 1, 0, 1,
-0.6551718, -1.127463, -3.501199, 0.4588235, 1, 0, 1,
-0.6509521, 0.221634, -0.4561018, 0.4509804, 1, 0, 1,
-0.6498528, 0.08412514, -1.841676, 0.4470588, 1, 0, 1,
-0.6482486, -0.8529361, -2.508364, 0.4392157, 1, 0, 1,
-0.6461247, -0.7568928, -0.9218053, 0.4352941, 1, 0, 1,
-0.6434662, 1.143606, -0.08948701, 0.427451, 1, 0, 1,
-0.6393479, 0.4875683, 0.3125675, 0.4235294, 1, 0, 1,
-0.6384403, 0.05922348, -1.083718, 0.4156863, 1, 0, 1,
-0.6350709, 1.922679, -0.1159034, 0.4117647, 1, 0, 1,
-0.6281196, 2.186549, 0.0002970645, 0.4039216, 1, 0, 1,
-0.6277223, 0.4890303, -1.130223, 0.3960784, 1, 0, 1,
-0.6245825, 0.2586687, -2.423588, 0.3921569, 1, 0, 1,
-0.6243663, 0.7216152, 0.7050048, 0.3843137, 1, 0, 1,
-0.6221343, -0.1148828, -2.285259, 0.3803922, 1, 0, 1,
-0.6213537, 0.6485207, -0.3313532, 0.372549, 1, 0, 1,
-0.6172529, 0.05940853, -0.8701013, 0.3686275, 1, 0, 1,
-0.6098726, 0.2632367, -0.6058012, 0.3607843, 1, 0, 1,
-0.6053218, -1.057974, -2.372132, 0.3568628, 1, 0, 1,
-0.6018953, -0.4604419, -3.179289, 0.3490196, 1, 0, 1,
-0.6011767, 0.9454088, -1.009855, 0.345098, 1, 0, 1,
-0.6001607, 0.4984416, -0.8904766, 0.3372549, 1, 0, 1,
-0.5982959, 0.3496977, -2.221264, 0.3333333, 1, 0, 1,
-0.597869, 1.719276, -0.6191811, 0.3254902, 1, 0, 1,
-0.592968, 0.9416774, -0.06081125, 0.3215686, 1, 0, 1,
-0.5910525, 0.617628, -0.6315253, 0.3137255, 1, 0, 1,
-0.5907338, 0.1597239, -2.231352, 0.3098039, 1, 0, 1,
-0.5808111, 1.270701, -0.185299, 0.3019608, 1, 0, 1,
-0.5772868, 0.3563402, -1.86795, 0.2941177, 1, 0, 1,
-0.5767831, -1.150946, -3.055557, 0.2901961, 1, 0, 1,
-0.5767472, -0.7451649, -2.605117, 0.282353, 1, 0, 1,
-0.5750642, 1.341301, 0.802217, 0.2784314, 1, 0, 1,
-0.5727645, 0.2312251, -0.8773482, 0.2705882, 1, 0, 1,
-0.5695255, 0.4427172, 0.7038271, 0.2666667, 1, 0, 1,
-0.5652931, 0.957123, -1.162386, 0.2588235, 1, 0, 1,
-0.5650467, 1.181715, 0.8934284, 0.254902, 1, 0, 1,
-0.5613081, -0.4487465, -2.918496, 0.2470588, 1, 0, 1,
-0.5608238, -1.021842, -2.242415, 0.2431373, 1, 0, 1,
-0.5606536, 0.4073346, 0.7166953, 0.2352941, 1, 0, 1,
-0.5579348, 0.1964068, -0.7005938, 0.2313726, 1, 0, 1,
-0.5574861, 2.581762, -0.7285513, 0.2235294, 1, 0, 1,
-0.5509516, -2.228433, -4.81477, 0.2196078, 1, 0, 1,
-0.5508359, 0.8533098, 0.3107837, 0.2117647, 1, 0, 1,
-0.5441232, -0.5493573, -3.904009, 0.2078431, 1, 0, 1,
-0.5395519, 0.8072608, 0.6569247, 0.2, 1, 0, 1,
-0.5354715, -2.777462, -2.623362, 0.1921569, 1, 0, 1,
-0.5297038, 0.5106991, -1.266188, 0.1882353, 1, 0, 1,
-0.5223718, 1.715128, 0.4827832, 0.1803922, 1, 0, 1,
-0.5193722, -0.5878286, -2.518577, 0.1764706, 1, 0, 1,
-0.5153125, -1.150027, -3.212754, 0.1686275, 1, 0, 1,
-0.5089657, -0.2752475, -3.773777, 0.1647059, 1, 0, 1,
-0.5087245, -1.59154, -3.429665, 0.1568628, 1, 0, 1,
-0.5046647, 0.1353844, -0.4607471, 0.1529412, 1, 0, 1,
-0.5043747, -1.093337, -3.309204, 0.145098, 1, 0, 1,
-0.4941371, -1.38849, -3.377012, 0.1411765, 1, 0, 1,
-0.4931837, -2.230239, -1.089122, 0.1333333, 1, 0, 1,
-0.4888461, -0.2217739, -1.777497, 0.1294118, 1, 0, 1,
-0.4881437, 0.1896595, -3.153775, 0.1215686, 1, 0, 1,
-0.4842206, 0.02245522, -0.1221568, 0.1176471, 1, 0, 1,
-0.4812191, 0.9307792, 0.1795278, 0.1098039, 1, 0, 1,
-0.4793739, 0.4793441, -1.57069, 0.1058824, 1, 0, 1,
-0.4786003, -0.5817264, -2.852615, 0.09803922, 1, 0, 1,
-0.4782825, -0.0347351, -1.811361, 0.09019608, 1, 0, 1,
-0.4731429, 0.5997349, 1.356909, 0.08627451, 1, 0, 1,
-0.4729353, 1.542858, -0.003802994, 0.07843138, 1, 0, 1,
-0.4704278, -0.5267202, -2.481989, 0.07450981, 1, 0, 1,
-0.4675297, 0.02004544, -0.9432952, 0.06666667, 1, 0, 1,
-0.4667847, 0.7284345, -1.105976, 0.0627451, 1, 0, 1,
-0.4654634, -0.5556974, -4.529851, 0.05490196, 1, 0, 1,
-0.4646614, 0.4124855, -1.10267, 0.05098039, 1, 0, 1,
-0.460798, 0.4117576, -2.070797, 0.04313726, 1, 0, 1,
-0.4560344, -0.9000283, -3.276999, 0.03921569, 1, 0, 1,
-0.455526, 0.1129747, -1.786759, 0.03137255, 1, 0, 1,
-0.4553951, -2.193559, -2.177458, 0.02745098, 1, 0, 1,
-0.4551656, -0.02724282, -3.118279, 0.01960784, 1, 0, 1,
-0.4544836, -0.6863591, -2.185546, 0.01568628, 1, 0, 1,
-0.4471149, 0.08480709, -0.4623092, 0.007843138, 1, 0, 1,
-0.442998, -0.205711, -2.128251, 0.003921569, 1, 0, 1,
-0.4377534, -0.4066108, -3.240006, 0, 1, 0.003921569, 1,
-0.433999, 0.1636577, -0.8329408, 0, 1, 0.01176471, 1,
-0.4246469, -0.1361309, -0.8769956, 0, 1, 0.01568628, 1,
-0.4236739, 0.6008025, -1.85192, 0, 1, 0.02352941, 1,
-0.4229265, -1.087246, -2.659029, 0, 1, 0.02745098, 1,
-0.4207457, -0.9841104, -0.300577, 0, 1, 0.03529412, 1,
-0.4176688, 0.08039442, -1.51089, 0, 1, 0.03921569, 1,
-0.4150742, 0.8481984, -1.359266, 0, 1, 0.04705882, 1,
-0.4135776, 0.7790395, 0.5248405, 0, 1, 0.05098039, 1,
-0.4067924, 0.8632549, -0.1171707, 0, 1, 0.05882353, 1,
-0.4052403, 0.4688056, -0.3174017, 0, 1, 0.0627451, 1,
-0.4007304, -0.4592336, -2.718135, 0, 1, 0.07058824, 1,
-0.3932947, -0.9608952, -3.30913, 0, 1, 0.07450981, 1,
-0.3926238, -1.462987, -1.57124, 0, 1, 0.08235294, 1,
-0.3919442, -1.186964, -1.581746, 0, 1, 0.08627451, 1,
-0.3899556, -0.825424, -3.316785, 0, 1, 0.09411765, 1,
-0.3871674, 1.594858, -0.3057044, 0, 1, 0.1019608, 1,
-0.3863499, 0.4439885, -1.770272, 0, 1, 0.1058824, 1,
-0.3836983, 0.5121113, 1.18725, 0, 1, 0.1137255, 1,
-0.3829184, -0.3812341, -1.384101, 0, 1, 0.1176471, 1,
-0.38025, -0.8036937, -1.216093, 0, 1, 0.1254902, 1,
-0.3802063, -2.102847, -3.229049, 0, 1, 0.1294118, 1,
-0.3782102, 0.4204728, -1.091743, 0, 1, 0.1372549, 1,
-0.3775633, -0.558228, -4.906905, 0, 1, 0.1411765, 1,
-0.3767478, -0.5614244, -3.303221, 0, 1, 0.1490196, 1,
-0.3755066, 0.1112415, -1.477671, 0, 1, 0.1529412, 1,
-0.3744631, 0.2445572, -1.37659, 0, 1, 0.1607843, 1,
-0.3707233, -0.7682797, -3.016584, 0, 1, 0.1647059, 1,
-0.3706999, -0.3391107, -0.4498124, 0, 1, 0.172549, 1,
-0.3704836, -0.6809456, -2.116737, 0, 1, 0.1764706, 1,
-0.3699241, -0.3581351, -2.444843, 0, 1, 0.1843137, 1,
-0.3697899, -0.3807343, -2.476632, 0, 1, 0.1882353, 1,
-0.3663493, -0.8677761, -3.776215, 0, 1, 0.1960784, 1,
-0.3662775, -0.2958397, -2.872088, 0, 1, 0.2039216, 1,
-0.36482, -0.07762573, -1.587985, 0, 1, 0.2078431, 1,
-0.3598814, 1.419325, -1.12676, 0, 1, 0.2156863, 1,
-0.353861, -2.792122, -3.766657, 0, 1, 0.2196078, 1,
-0.3531905, 1.532959, -0.170172, 0, 1, 0.227451, 1,
-0.3518244, 0.5440877, 0.6561674, 0, 1, 0.2313726, 1,
-0.3456303, -0.5712221, -1.536286, 0, 1, 0.2392157, 1,
-0.3448528, 1.779841, -1.436179, 0, 1, 0.2431373, 1,
-0.3342011, -0.6237435, -4.467597, 0, 1, 0.2509804, 1,
-0.3312199, 0.5342422, 1.197966, 0, 1, 0.254902, 1,
-0.3303415, 1.238946, -2.164918, 0, 1, 0.2627451, 1,
-0.3288618, 0.2790329, -0.501042, 0, 1, 0.2666667, 1,
-0.3287446, 0.3534614, -0.536114, 0, 1, 0.2745098, 1,
-0.3283959, -0.04039169, -1.441592, 0, 1, 0.2784314, 1,
-0.3263729, 0.3002523, -0.1487187, 0, 1, 0.2862745, 1,
-0.3250585, 0.2563598, -1.078703, 0, 1, 0.2901961, 1,
-0.3248655, 1.036914, 0.1607801, 0, 1, 0.2980392, 1,
-0.3186753, -0.4892502, -4.695461, 0, 1, 0.3058824, 1,
-0.318067, 1.273997, 0.1799774, 0, 1, 0.3098039, 1,
-0.3127264, 0.06933404, -0.08767612, 0, 1, 0.3176471, 1,
-0.3122601, 2.471069, 0.4254233, 0, 1, 0.3215686, 1,
-0.3111531, -0.3816078, -1.997072, 0, 1, 0.3294118, 1,
-0.3105705, 2.195636, 1.121686, 0, 1, 0.3333333, 1,
-0.3103356, -0.5794898, 0.1144433, 0, 1, 0.3411765, 1,
-0.3094124, 0.5528244, -1.325033, 0, 1, 0.345098, 1,
-0.3080599, -0.3321478, -1.753214, 0, 1, 0.3529412, 1,
-0.3071785, -1.350983, -1.813527, 0, 1, 0.3568628, 1,
-0.3060576, -1.270774, -3.002675, 0, 1, 0.3647059, 1,
-0.3038176, -2.065645, -4.001842, 0, 1, 0.3686275, 1,
-0.3011687, 0.2095595, -0.5995215, 0, 1, 0.3764706, 1,
-0.3004962, 0.9909545, 0.05838634, 0, 1, 0.3803922, 1,
-0.2985953, -1.320342, -3.096404, 0, 1, 0.3882353, 1,
-0.2952108, 0.7368168, -0.1505333, 0, 1, 0.3921569, 1,
-0.2941381, -0.2104749, -1.5821, 0, 1, 0.4, 1,
-0.2867413, 1.516849, -0.332314, 0, 1, 0.4078431, 1,
-0.284899, -0.6545292, -2.797206, 0, 1, 0.4117647, 1,
-0.2715677, 1.753194, -0.6011102, 0, 1, 0.4196078, 1,
-0.2640803, -0.3019743, -1.734755, 0, 1, 0.4235294, 1,
-0.2605117, 0.482579, -2.37067, 0, 1, 0.4313726, 1,
-0.2596734, 0.7773834, -0.419533, 0, 1, 0.4352941, 1,
-0.2588155, 0.4787301, 1.89529, 0, 1, 0.4431373, 1,
-0.2584504, 0.6111687, -0.5898221, 0, 1, 0.4470588, 1,
-0.256363, -0.4687037, -2.630037, 0, 1, 0.454902, 1,
-0.253317, -0.9787656, -4.366824, 0, 1, 0.4588235, 1,
-0.2491485, -1.164768, -1.961293, 0, 1, 0.4666667, 1,
-0.2483098, -1.654779, -5.082995, 0, 1, 0.4705882, 1,
-0.2475075, -0.79523, -3.631459, 0, 1, 0.4784314, 1,
-0.2452804, -0.03052719, -2.986804, 0, 1, 0.4823529, 1,
-0.2395237, -0.9771402, -4.667366, 0, 1, 0.4901961, 1,
-0.2369308, 0.05072471, -1.557654, 0, 1, 0.4941176, 1,
-0.2289455, -3.43415, -2.892687, 0, 1, 0.5019608, 1,
-0.2280126, 0.7934822, -0.6492653, 0, 1, 0.509804, 1,
-0.2245534, -1.456707, -2.934681, 0, 1, 0.5137255, 1,
-0.2221916, 0.5230691, -0.1844579, 0, 1, 0.5215687, 1,
-0.2204869, 0.07285883, -1.168928, 0, 1, 0.5254902, 1,
-0.2167293, 0.8487043, 0.1779174, 0, 1, 0.5333334, 1,
-0.2164847, -0.4836929, -3.26703, 0, 1, 0.5372549, 1,
-0.2115503, -1.864287, -4.359608, 0, 1, 0.5450981, 1,
-0.2024834, -1.741547, -1.605616, 0, 1, 0.5490196, 1,
-0.2010139, 0.4846154, -2.369952, 0, 1, 0.5568628, 1,
-0.1991655, 0.3368935, -0.3164626, 0, 1, 0.5607843, 1,
-0.1950409, -0.1366134, -1.6628, 0, 1, 0.5686275, 1,
-0.1939837, -1.671726, -2.557857, 0, 1, 0.572549, 1,
-0.1875734, -0.1853428, -0.8378137, 0, 1, 0.5803922, 1,
-0.1850692, 1.188736, 1.365873, 0, 1, 0.5843138, 1,
-0.1842381, 1.727169, 1.925921, 0, 1, 0.5921569, 1,
-0.1840284, 1.049378, -1.124482, 0, 1, 0.5960785, 1,
-0.1820434, -0.2861397, -1.700286, 0, 1, 0.6039216, 1,
-0.1786672, -1.663297, -2.941983, 0, 1, 0.6117647, 1,
-0.1760837, 1.217732, 1.932472, 0, 1, 0.6156863, 1,
-0.1755196, -0.9438993, -2.154201, 0, 1, 0.6235294, 1,
-0.1739078, -0.2915186, -5.291305, 0, 1, 0.627451, 1,
-0.1706708, 0.3083359, 0.4234311, 0, 1, 0.6352941, 1,
-0.1677019, 0.03632556, 0.5784134, 0, 1, 0.6392157, 1,
-0.1625261, -0.6817697, -2.89397, 0, 1, 0.6470588, 1,
-0.1582699, 0.3220515, -0.9703474, 0, 1, 0.6509804, 1,
-0.1510433, -0.9588201, -1.816131, 0, 1, 0.6588235, 1,
-0.1491822, 0.6836303, -0.8305505, 0, 1, 0.6627451, 1,
-0.1474448, 0.4063576, -2.280416, 0, 1, 0.6705883, 1,
-0.1449573, -0.9464411, -2.291559, 0, 1, 0.6745098, 1,
-0.1447155, -1.095421, -3.110432, 0, 1, 0.682353, 1,
-0.1405055, -0.049268, -1.665093, 0, 1, 0.6862745, 1,
-0.1365182, 0.06282551, -1.706869, 0, 1, 0.6941177, 1,
-0.136191, -0.1759911, -3.381311, 0, 1, 0.7019608, 1,
-0.1359821, -0.04284035, -0.8078254, 0, 1, 0.7058824, 1,
-0.1314677, -0.4300264, -3.489165, 0, 1, 0.7137255, 1,
-0.1313895, 1.568282, 0.2480791, 0, 1, 0.7176471, 1,
-0.1276625, -1.163678, -3.592528, 0, 1, 0.7254902, 1,
-0.127634, -0.1516344, -1.732888, 0, 1, 0.7294118, 1,
-0.1275662, -1.922922, -4.963686, 0, 1, 0.7372549, 1,
-0.1242808, -0.03341801, -2.903797, 0, 1, 0.7411765, 1,
-0.1242599, 0.08301613, -1.752146, 0, 1, 0.7490196, 1,
-0.1232087, 1.089241, 0.8961856, 0, 1, 0.7529412, 1,
-0.1202455, -0.4451164, -3.216996, 0, 1, 0.7607843, 1,
-0.1137234, -0.7666843, -1.840307, 0, 1, 0.7647059, 1,
-0.1099294, -0.5559842, -2.355791, 0, 1, 0.772549, 1,
-0.1078284, -0.2970723, -3.178329, 0, 1, 0.7764706, 1,
-0.1061712, 0.5055984, -0.4732626, 0, 1, 0.7843137, 1,
-0.103946, 0.784838, 0.1608469, 0, 1, 0.7882353, 1,
-0.1030343, -0.2104745, -2.59213, 0, 1, 0.7960784, 1,
-0.09882749, -1.560505, -4.588879, 0, 1, 0.8039216, 1,
-0.09022853, -0.7234133, -1.424205, 0, 1, 0.8078431, 1,
-0.08713017, 1.080003, -1.159311, 0, 1, 0.8156863, 1,
-0.08054567, 0.05024381, -0.2459055, 0, 1, 0.8196079, 1,
-0.0754772, -1.449154, -4.037556, 0, 1, 0.827451, 1,
-0.07516449, 1.169784, 0.3127963, 0, 1, 0.8313726, 1,
-0.07377407, -1.228918, -2.873673, 0, 1, 0.8392157, 1,
-0.07298943, -0.9353617, -4.988074, 0, 1, 0.8431373, 1,
-0.06845318, 1.158596, 0.4982964, 0, 1, 0.8509804, 1,
-0.06772308, 1.553028, 0.8916141, 0, 1, 0.854902, 1,
-0.06728853, -0.2578954, -3.654529, 0, 1, 0.8627451, 1,
-0.06545494, 0.2481912, 1.758362, 0, 1, 0.8666667, 1,
-0.05845957, -0.5602847, -1.779926, 0, 1, 0.8745098, 1,
-0.05793495, 1.263351, 0.3784857, 0, 1, 0.8784314, 1,
-0.05764915, 0.1498969, 0.04852911, 0, 1, 0.8862745, 1,
-0.05331992, 0.3718492, 0.4836631, 0, 1, 0.8901961, 1,
-0.05084409, -0.8672305, -3.055214, 0, 1, 0.8980392, 1,
-0.04537007, 0.742419, -0.8472368, 0, 1, 0.9058824, 1,
-0.0412879, 0.2224267, -2.093846, 0, 1, 0.9098039, 1,
-0.04040417, -0.7499571, -2.836345, 0, 1, 0.9176471, 1,
-0.03898712, -2.189334, -2.115703, 0, 1, 0.9215686, 1,
-0.0386904, -0.760408, -3.553974, 0, 1, 0.9294118, 1,
-0.03824976, 0.7880138, -0.5094976, 0, 1, 0.9333333, 1,
-0.02388481, 3.963818, 0.01096959, 0, 1, 0.9411765, 1,
-0.02337227, -1.112001, -3.077418, 0, 1, 0.945098, 1,
-0.02073772, 0.9550384, 0.8639191, 0, 1, 0.9529412, 1,
-0.01966808, -0.5675076, -3.03463, 0, 1, 0.9568627, 1,
-0.01840224, -1.570081, -2.737476, 0, 1, 0.9647059, 1,
-0.01528243, -0.5081646, -1.925562, 0, 1, 0.9686275, 1,
-0.01265869, -0.2614125, -2.361042, 0, 1, 0.9764706, 1,
-0.0109489, 0.01412023, 0.2156479, 0, 1, 0.9803922, 1,
-0.0100984, -1.65938, -2.49962, 0, 1, 0.9882353, 1,
-0.008762075, -0.3769972, -2.054983, 0, 1, 0.9921569, 1,
-0.004870092, 0.3692404, 0.2856446, 0, 1, 1, 1,
-0.004134113, -0.650003, -3.610835, 0, 0.9921569, 1, 1,
-0.0004627421, 1.697947, -0.1619091, 0, 0.9882353, 1, 1,
0.006013541, 1.74448, -0.05439695, 0, 0.9803922, 1, 1,
0.00655504, -1.601445, 3.957453, 0, 0.9764706, 1, 1,
0.01082494, 0.4448779, -0.7933916, 0, 0.9686275, 1, 1,
0.01132615, -0.3264615, 2.819717, 0, 0.9647059, 1, 1,
0.01322259, 0.109212, -0.7542575, 0, 0.9568627, 1, 1,
0.01450335, 0.6565903, 1.01339, 0, 0.9529412, 1, 1,
0.01538732, -0.6835024, 3.533119, 0, 0.945098, 1, 1,
0.01869519, -0.3569511, 4.116468, 0, 0.9411765, 1, 1,
0.0261467, -0.7000934, 2.641258, 0, 0.9333333, 1, 1,
0.02969099, 0.8523272, 1.393416, 0, 0.9294118, 1, 1,
0.03041421, -0.5831397, 4.542858, 0, 0.9215686, 1, 1,
0.03075736, -1.372701, 4.340195, 0, 0.9176471, 1, 1,
0.03170162, -0.1138772, 2.948345, 0, 0.9098039, 1, 1,
0.03364496, -1.119781, 2.266275, 0, 0.9058824, 1, 1,
0.03649139, -2.028122, 3.211348, 0, 0.8980392, 1, 1,
0.03724631, 0.729023, 1.482234, 0, 0.8901961, 1, 1,
0.03743378, -1.25937, 3.48846, 0, 0.8862745, 1, 1,
0.03857654, 0.5766383, -0.9466634, 0, 0.8784314, 1, 1,
0.03897777, -0.05464891, 2.666823, 0, 0.8745098, 1, 1,
0.03926166, 0.136496, 0.9998108, 0, 0.8666667, 1, 1,
0.04048466, -0.3219383, 2.025523, 0, 0.8627451, 1, 1,
0.04153308, 0.2365557, 0.9598113, 0, 0.854902, 1, 1,
0.04472843, -0.07510079, 2.769186, 0, 0.8509804, 1, 1,
0.04595111, 0.8316746, -0.7229544, 0, 0.8431373, 1, 1,
0.0471676, -0.1627122, 2.490893, 0, 0.8392157, 1, 1,
0.04900381, -1.096966, 2.94884, 0, 0.8313726, 1, 1,
0.04927399, 0.2220628, 1.31216, 0, 0.827451, 1, 1,
0.04973003, -0.3803376, 2.687927, 0, 0.8196079, 1, 1,
0.05175235, -0.525301, 3.849952, 0, 0.8156863, 1, 1,
0.05197525, -0.02120004, 1.854171, 0, 0.8078431, 1, 1,
0.05596285, -1.083029, 3.202207, 0, 0.8039216, 1, 1,
0.05835262, 0.3062263, -0.08728296, 0, 0.7960784, 1, 1,
0.0593091, -0.02569901, 1.296827, 0, 0.7882353, 1, 1,
0.05953398, 2.559534, 0.8581826, 0, 0.7843137, 1, 1,
0.06335918, -0.3109591, 3.678718, 0, 0.7764706, 1, 1,
0.06619637, -0.007700262, 1.461702, 0, 0.772549, 1, 1,
0.06814443, -0.8068377, 2.849059, 0, 0.7647059, 1, 1,
0.07205951, 1.504545, 0.65319, 0, 0.7607843, 1, 1,
0.07428522, -0.646581, 4.614237, 0, 0.7529412, 1, 1,
0.07607494, -0.4385252, 3.95461, 0, 0.7490196, 1, 1,
0.07795084, 0.2993137, 0.06057893, 0, 0.7411765, 1, 1,
0.07800771, -1.936637, 1.801612, 0, 0.7372549, 1, 1,
0.0797946, 0.3414856, -0.2926276, 0, 0.7294118, 1, 1,
0.08006508, 0.09659061, -0.1816964, 0, 0.7254902, 1, 1,
0.08428818, -2.178118, 3.751885, 0, 0.7176471, 1, 1,
0.08768527, -0.5042965, 1.743057, 0, 0.7137255, 1, 1,
0.09205312, -0.2119205, 5.554919, 0, 0.7058824, 1, 1,
0.09288657, -0.3217832, 2.912886, 0, 0.6980392, 1, 1,
0.105213, 0.23449, -0.6916574, 0, 0.6941177, 1, 1,
0.1060861, -0.7957316, 2.482714, 0, 0.6862745, 1, 1,
0.1104763, 0.7945816, -1.862579, 0, 0.682353, 1, 1,
0.1107132, -1.638959, 4.344154, 0, 0.6745098, 1, 1,
0.1138083, -0.1201507, 3.522933, 0, 0.6705883, 1, 1,
0.1224046, 0.008010267, 2.525057, 0, 0.6627451, 1, 1,
0.1243389, 1.869045, -1.442904, 0, 0.6588235, 1, 1,
0.1251629, 0.4026993, 1.030616, 0, 0.6509804, 1, 1,
0.128298, 0.5409988, 0.5107996, 0, 0.6470588, 1, 1,
0.1307794, 1.57317, -0.704692, 0, 0.6392157, 1, 1,
0.1309279, -0.4836323, 3.744377, 0, 0.6352941, 1, 1,
0.1319097, 0.4171073, -0.5015848, 0, 0.627451, 1, 1,
0.1422822, 1.990207, -0.3684024, 0, 0.6235294, 1, 1,
0.1437064, -0.5496429, 3.086226, 0, 0.6156863, 1, 1,
0.1551565, 0.8569797, -0.4318808, 0, 0.6117647, 1, 1,
0.1567546, 1.164148, -1.865049, 0, 0.6039216, 1, 1,
0.1646053, 0.6327822, -0.3644176, 0, 0.5960785, 1, 1,
0.1664099, 0.4910646, 1.876613, 0, 0.5921569, 1, 1,
0.1728364, 1.514877, -0.2208014, 0, 0.5843138, 1, 1,
0.1740988, -0.1150445, 2.697251, 0, 0.5803922, 1, 1,
0.1756388, -1.312247, 2.34442, 0, 0.572549, 1, 1,
0.1797987, -0.2088474, 2.201804, 0, 0.5686275, 1, 1,
0.18153, 0.4147462, 0.547151, 0, 0.5607843, 1, 1,
0.182108, -0.9290586, 1.473167, 0, 0.5568628, 1, 1,
0.183774, -2.695381, 2.431593, 0, 0.5490196, 1, 1,
0.1843164, 0.6633309, 0.06467725, 0, 0.5450981, 1, 1,
0.1845407, 1.287493, -1.322262, 0, 0.5372549, 1, 1,
0.186483, -1.807004, 2.689851, 0, 0.5333334, 1, 1,
0.1933685, 0.07664847, 0.4894316, 0, 0.5254902, 1, 1,
0.1936974, 0.107886, 1.014685, 0, 0.5215687, 1, 1,
0.1984955, -0.2778834, 1.391042, 0, 0.5137255, 1, 1,
0.1997698, -1.492197, 1.622431, 0, 0.509804, 1, 1,
0.1999796, 0.4401145, 1.12606, 0, 0.5019608, 1, 1,
0.2004543, 0.3980746, -0.29336, 0, 0.4941176, 1, 1,
0.2013804, 0.421109, 1.336768, 0, 0.4901961, 1, 1,
0.2024916, 0.235298, -0.5188277, 0, 0.4823529, 1, 1,
0.2072572, -0.2643231, 3.980776, 0, 0.4784314, 1, 1,
0.2114697, -1.491707, 2.798444, 0, 0.4705882, 1, 1,
0.2116467, -1.220201, 2.556853, 0, 0.4666667, 1, 1,
0.2156406, -0.499618, 1.584197, 0, 0.4588235, 1, 1,
0.21661, 0.1982854, 2.515589, 0, 0.454902, 1, 1,
0.2205691, 1.153556, 1.118005, 0, 0.4470588, 1, 1,
0.2265081, -1.772805, 3.991364, 0, 0.4431373, 1, 1,
0.2288923, 0.1039672, 2.826211, 0, 0.4352941, 1, 1,
0.2301526, -1.912439, 3.846786, 0, 0.4313726, 1, 1,
0.2312758, -0.2697164, 3.262094, 0, 0.4235294, 1, 1,
0.2383045, 1.522002, -0.7913727, 0, 0.4196078, 1, 1,
0.2406718, 1.123866, 1.90349, 0, 0.4117647, 1, 1,
0.2435799, -0.009848677, 2.626359, 0, 0.4078431, 1, 1,
0.2447537, 0.09965186, 1.090558, 0, 0.4, 1, 1,
0.2500192, 1.079832, 0.3165378, 0, 0.3921569, 1, 1,
0.2510362, 0.7088193, 1.911241, 0, 0.3882353, 1, 1,
0.253116, 1.887156, 0.5234768, 0, 0.3803922, 1, 1,
0.255652, 0.6015435, 2.119004, 0, 0.3764706, 1, 1,
0.2576388, 1.260342, -0.4110612, 0, 0.3686275, 1, 1,
0.2625122, 0.6083811, 0.4360619, 0, 0.3647059, 1, 1,
0.2629665, -0.9580538, 3.852191, 0, 0.3568628, 1, 1,
0.2662038, -0.4499778, 3.742174, 0, 0.3529412, 1, 1,
0.267646, -1.568215, 2.922776, 0, 0.345098, 1, 1,
0.2729411, 1.654469, 1.26342, 0, 0.3411765, 1, 1,
0.2795698, 0.2372868, 0.05845735, 0, 0.3333333, 1, 1,
0.2804317, 1.093259, 0.3835038, 0, 0.3294118, 1, 1,
0.2810941, 0.5121605, 1.412948, 0, 0.3215686, 1, 1,
0.2871305, 0.5847496, -0.1619706, 0, 0.3176471, 1, 1,
0.2875428, -0.5733613, 3.833522, 0, 0.3098039, 1, 1,
0.2915274, 1.397635, 0.01987304, 0, 0.3058824, 1, 1,
0.2924095, 0.7596748, 0.803645, 0, 0.2980392, 1, 1,
0.295013, 0.8455197, 0.07443315, 0, 0.2901961, 1, 1,
0.2951074, 0.855289, 0.8904673, 0, 0.2862745, 1, 1,
0.296381, -1.671318, 4.482507, 0, 0.2784314, 1, 1,
0.2991309, -0.04003526, 1.393923, 0, 0.2745098, 1, 1,
0.2999722, 0.8191484, -0.08004569, 0, 0.2666667, 1, 1,
0.3037238, 0.5374848, 0.7907916, 0, 0.2627451, 1, 1,
0.3043552, -1.863165, 3.654893, 0, 0.254902, 1, 1,
0.3075976, 0.3367092, -0.9880004, 0, 0.2509804, 1, 1,
0.3086658, 0.2187131, 1.403497, 0, 0.2431373, 1, 1,
0.3113015, 0.9055749, -1.571222, 0, 0.2392157, 1, 1,
0.3116261, -0.624748, 2.755509, 0, 0.2313726, 1, 1,
0.313291, 1.442524, 1.093926, 0, 0.227451, 1, 1,
0.3151349, -0.6730756, 4.028911, 0, 0.2196078, 1, 1,
0.3166736, 0.1213915, 1.785089, 0, 0.2156863, 1, 1,
0.3174995, 1.169213, -1.591458, 0, 0.2078431, 1, 1,
0.3189338, -2.104658, 2.620605, 0, 0.2039216, 1, 1,
0.3217312, -0.2147186, 2.724037, 0, 0.1960784, 1, 1,
0.3219492, -0.6263128, 0.8019515, 0, 0.1882353, 1, 1,
0.3223445, -0.3408572, 1.817314, 0, 0.1843137, 1, 1,
0.3244143, -2.176934, 2.907368, 0, 0.1764706, 1, 1,
0.3270194, 1.430784, 0.2085165, 0, 0.172549, 1, 1,
0.3334206, 1.557307, 0.2004531, 0, 0.1647059, 1, 1,
0.337968, -0.7010778, 3.130593, 0, 0.1607843, 1, 1,
0.339819, 1.105713, 1.328424, 0, 0.1529412, 1, 1,
0.3411188, -3.365166, 3.403278, 0, 0.1490196, 1, 1,
0.3423705, 0.6623532, 2.306962, 0, 0.1411765, 1, 1,
0.3470099, -2.132739, 5.33276, 0, 0.1372549, 1, 1,
0.3490094, -0.9273283, 2.520748, 0, 0.1294118, 1, 1,
0.3496722, -0.7125959, 3.574507, 0, 0.1254902, 1, 1,
0.3529361, 0.08330281, -0.6659831, 0, 0.1176471, 1, 1,
0.3531121, 1.423006, 2.005358, 0, 0.1137255, 1, 1,
0.353831, -1.580346, 2.71938, 0, 0.1058824, 1, 1,
0.3588553, 0.6435416, 0.8574309, 0, 0.09803922, 1, 1,
0.3611019, -0.4242817, 2.920697, 0, 0.09411765, 1, 1,
0.3617232, 0.4634552, 0.2711986, 0, 0.08627451, 1, 1,
0.3629922, -1.273559, 2.60814, 0, 0.08235294, 1, 1,
0.3642271, 1.699617, 0.9462291, 0, 0.07450981, 1, 1,
0.3654119, -1.447894, 3.335871, 0, 0.07058824, 1, 1,
0.3662724, 0.3691337, 2.182529, 0, 0.0627451, 1, 1,
0.3696187, -1.296746, 3.257579, 0, 0.05882353, 1, 1,
0.3704929, -0.8699259, 4.265491, 0, 0.05098039, 1, 1,
0.3752479, -1.734155, 2.68379, 0, 0.04705882, 1, 1,
0.3767258, -1.886533, 2.638744, 0, 0.03921569, 1, 1,
0.377118, -1.949667, 3.774789, 0, 0.03529412, 1, 1,
0.3836225, 0.2905584, 2.221011, 0, 0.02745098, 1, 1,
0.385049, 1.297819, -0.3297402, 0, 0.02352941, 1, 1,
0.3878898, 1.186913, 1.096123, 0, 0.01568628, 1, 1,
0.3966044, 0.6716728, 1.868984, 0, 0.01176471, 1, 1,
0.396714, 0.7659872, 0.9919678, 0, 0.003921569, 1, 1,
0.397498, 0.6572132, 1.040782, 0.003921569, 0, 1, 1,
0.3990897, -0.06353772, 2.460687, 0.007843138, 0, 1, 1,
0.4009325, 1.665746, 0.03542569, 0.01568628, 0, 1, 1,
0.4026748, 1.078249, 0.6498553, 0.01960784, 0, 1, 1,
0.4049419, 1.004883, 1.335045, 0.02745098, 0, 1, 1,
0.4054026, -2.540413, 4.525596, 0.03137255, 0, 1, 1,
0.4066071, -0.7825304, 1.51881, 0.03921569, 0, 1, 1,
0.4070436, -0.7567242, 4.246895, 0.04313726, 0, 1, 1,
0.4073277, 0.5361218, -0.4182899, 0.05098039, 0, 1, 1,
0.4110316, -0.002519594, 2.526038, 0.05490196, 0, 1, 1,
0.4116995, -1.481712, 2.799735, 0.0627451, 0, 1, 1,
0.4136266, 0.7313698, 0.07232882, 0.06666667, 0, 1, 1,
0.4259956, 0.6961014, 0.7889349, 0.07450981, 0, 1, 1,
0.4285295, 0.2507956, 0.923355, 0.07843138, 0, 1, 1,
0.4363258, 0.3176503, 2.61182, 0.08627451, 0, 1, 1,
0.4364384, 1.369787, -0.2846981, 0.09019608, 0, 1, 1,
0.4377235, -1.087348, 4.267051, 0.09803922, 0, 1, 1,
0.4382457, -0.06756578, 2.247053, 0.1058824, 0, 1, 1,
0.4436551, 0.6675163, 0.239859, 0.1098039, 0, 1, 1,
0.4494636, 0.7049338, 1.739606, 0.1176471, 0, 1, 1,
0.4495283, 0.3030526, 0.3037816, 0.1215686, 0, 1, 1,
0.4501516, -0.3078489, 2.318528, 0.1294118, 0, 1, 1,
0.4558102, -0.3599401, 1.576102, 0.1333333, 0, 1, 1,
0.4580508, -1.038497, 3.879426, 0.1411765, 0, 1, 1,
0.4593602, 0.2045913, 1.969389, 0.145098, 0, 1, 1,
0.4599185, -1.20288, 1.851333, 0.1529412, 0, 1, 1,
0.4620959, 0.1379032, 1.732334, 0.1568628, 0, 1, 1,
0.4675085, -1.754451, 3.597862, 0.1647059, 0, 1, 1,
0.467693, 1.067792, 1.49042, 0.1686275, 0, 1, 1,
0.4679184, 1.091977, 0.3173093, 0.1764706, 0, 1, 1,
0.4695541, 2.714007, -0.2836532, 0.1803922, 0, 1, 1,
0.4717461, 0.5514298, 1.562747, 0.1882353, 0, 1, 1,
0.4737248, -0.9879746, 2.489173, 0.1921569, 0, 1, 1,
0.4765869, 0.6343322, 0.1031282, 0.2, 0, 1, 1,
0.4769295, -0.700679, 2.293538, 0.2078431, 0, 1, 1,
0.4791553, 1.260756, -2.747877, 0.2117647, 0, 1, 1,
0.4802276, 0.1873134, 0.8234248, 0.2196078, 0, 1, 1,
0.481096, 0.1371877, 0.7761424, 0.2235294, 0, 1, 1,
0.4823599, 0.05494654, 0.9628287, 0.2313726, 0, 1, 1,
0.4900551, 1.753437, 0.4791855, 0.2352941, 0, 1, 1,
0.4921775, -0.3299114, 2.864944, 0.2431373, 0, 1, 1,
0.5072692, -1.199065, 4.331032, 0.2470588, 0, 1, 1,
0.5092782, 0.3344386, 1.400588, 0.254902, 0, 1, 1,
0.509851, -2.13905, 2.924449, 0.2588235, 0, 1, 1,
0.5163423, 1.256414, 1.80898, 0.2666667, 0, 1, 1,
0.5165675, -0.9219251, 2.796086, 0.2705882, 0, 1, 1,
0.5171759, 1.806604, -0.1320045, 0.2784314, 0, 1, 1,
0.5182609, 0.819203, -0.7166767, 0.282353, 0, 1, 1,
0.5222665, -0.01247603, 0.4040863, 0.2901961, 0, 1, 1,
0.5244213, 0.5545042, 0.7558699, 0.2941177, 0, 1, 1,
0.5318159, -0.2957748, 2.064518, 0.3019608, 0, 1, 1,
0.533918, -1.200083, 0.9216589, 0.3098039, 0, 1, 1,
0.5343149, 0.2978181, 1.551707, 0.3137255, 0, 1, 1,
0.5394338, 0.3768844, 2.09034, 0.3215686, 0, 1, 1,
0.5415589, -0.05515286, 2.584473, 0.3254902, 0, 1, 1,
0.5461608, 0.01985493, 0.5468957, 0.3333333, 0, 1, 1,
0.5545244, 1.409211, 1.569616, 0.3372549, 0, 1, 1,
0.5550365, 0.6619245, -0.5987619, 0.345098, 0, 1, 1,
0.556833, -0.05999354, 3.027849, 0.3490196, 0, 1, 1,
0.5604354, 0.4771413, 1.29039, 0.3568628, 0, 1, 1,
0.5625812, 1.119259, -1.425362, 0.3607843, 0, 1, 1,
0.5635987, -0.318552, 3.589801, 0.3686275, 0, 1, 1,
0.5670477, 0.5332617, -0.3528743, 0.372549, 0, 1, 1,
0.5685844, -0.5605897, 2.11885, 0.3803922, 0, 1, 1,
0.5737576, 0.4282854, 1.036522, 0.3843137, 0, 1, 1,
0.5752049, -0.2546007, 0.9731617, 0.3921569, 0, 1, 1,
0.5964146, 0.2531556, 1.129764, 0.3960784, 0, 1, 1,
0.5966834, -1.011467, 4.270335, 0.4039216, 0, 1, 1,
0.5979018, 0.1221494, 1.876908, 0.4117647, 0, 1, 1,
0.5995855, 0.3444344, -0.784705, 0.4156863, 0, 1, 1,
0.6004669, 0.1738797, 0.1638863, 0.4235294, 0, 1, 1,
0.6044529, 0.6619021, 1.654578, 0.427451, 0, 1, 1,
0.6050496, 0.9083778, 0.5831045, 0.4352941, 0, 1, 1,
0.6081197, -1.194787, 2.941382, 0.4392157, 0, 1, 1,
0.6093095, 0.1116036, 0.434288, 0.4470588, 0, 1, 1,
0.6249438, -0.6413618, 2.115606, 0.4509804, 0, 1, 1,
0.6330867, -1.106072, 3.859441, 0.4588235, 0, 1, 1,
0.6336917, 0.7813351, 0.4592584, 0.4627451, 0, 1, 1,
0.6445987, 0.5613098, -0.2103928, 0.4705882, 0, 1, 1,
0.6500745, 2.51948, 0.1080087, 0.4745098, 0, 1, 1,
0.6517724, -1.462118, 2.425112, 0.4823529, 0, 1, 1,
0.6518731, 0.4334187, 0.1379199, 0.4862745, 0, 1, 1,
0.6657265, -0.06529327, 2.175282, 0.4941176, 0, 1, 1,
0.6690598, -0.3259088, 2.687558, 0.5019608, 0, 1, 1,
0.6719614, 0.756064, 1.09525, 0.5058824, 0, 1, 1,
0.6730668, -0.3191852, 1.772232, 0.5137255, 0, 1, 1,
0.6731703, -1.524934, 2.324774, 0.5176471, 0, 1, 1,
0.6846762, -0.00108405, 1.598377, 0.5254902, 0, 1, 1,
0.6848485, -0.1336285, 2.804854, 0.5294118, 0, 1, 1,
0.6861167, 1.617683, 1.691338, 0.5372549, 0, 1, 1,
0.6890551, 0.9965652, -0.1452113, 0.5411765, 0, 1, 1,
0.6915855, -0.9269964, 3.45978, 0.5490196, 0, 1, 1,
0.7000887, 0.2572906, 2.64182, 0.5529412, 0, 1, 1,
0.7119387, 1.010445, 1.544473, 0.5607843, 0, 1, 1,
0.712384, -0.982562, 0.9261198, 0.5647059, 0, 1, 1,
0.7146575, -0.06169806, 1.276167, 0.572549, 0, 1, 1,
0.7163333, 0.6304159, -0.889241, 0.5764706, 0, 1, 1,
0.7204663, 0.2625387, 1.082525, 0.5843138, 0, 1, 1,
0.7217278, 1.655645, -0.6122845, 0.5882353, 0, 1, 1,
0.7236689, 0.4031503, -0.5517149, 0.5960785, 0, 1, 1,
0.7261186, -0.3751481, 1.934755, 0.6039216, 0, 1, 1,
0.7329631, -1.398167, 3.008383, 0.6078432, 0, 1, 1,
0.7347993, -2.14394, 0.2288901, 0.6156863, 0, 1, 1,
0.7358647, 1.704761, -1.242725, 0.6196079, 0, 1, 1,
0.7360668, 1.214777, 1.774798, 0.627451, 0, 1, 1,
0.7393163, -0.977218, 2.081934, 0.6313726, 0, 1, 1,
0.7403247, -0.7822107, 1.811719, 0.6392157, 0, 1, 1,
0.742376, -0.5619485, 3.110997, 0.6431373, 0, 1, 1,
0.746545, -0.01539203, 2.292461, 0.6509804, 0, 1, 1,
0.7494903, -1.181801, 2.692396, 0.654902, 0, 1, 1,
0.7614171, 0.8056856, -0.7113451, 0.6627451, 0, 1, 1,
0.7614633, 1.027429, 1.849194, 0.6666667, 0, 1, 1,
0.7627616, -0.553863, 2.588321, 0.6745098, 0, 1, 1,
0.7651629, 0.3348742, -0.9230081, 0.6784314, 0, 1, 1,
0.7657437, -0.7430379, 3.623456, 0.6862745, 0, 1, 1,
0.7671058, 0.338314, 0.6140962, 0.6901961, 0, 1, 1,
0.7692479, 1.071199, 0.7380589, 0.6980392, 0, 1, 1,
0.7693059, -1.361725, 3.091617, 0.7058824, 0, 1, 1,
0.7708724, -3.621919, 2.767584, 0.7098039, 0, 1, 1,
0.7738061, 1.569212, -0.3204025, 0.7176471, 0, 1, 1,
0.778299, 0.7422551, 0.4366173, 0.7215686, 0, 1, 1,
0.7864622, -0.2630411, 3.237802, 0.7294118, 0, 1, 1,
0.7877514, 2.794847, 0.1759144, 0.7333333, 0, 1, 1,
0.7901201, -0.06364954, 3.469114, 0.7411765, 0, 1, 1,
0.7907066, 0.9229543, 0.2358818, 0.7450981, 0, 1, 1,
0.8018755, -0.5043896, 2.214802, 0.7529412, 0, 1, 1,
0.8035234, -0.9949009, 2.635801, 0.7568628, 0, 1, 1,
0.8043604, 0.06066426, -0.7048412, 0.7647059, 0, 1, 1,
0.8090101, -0.1128127, 2.280365, 0.7686275, 0, 1, 1,
0.8093545, -0.04099912, 0.5714305, 0.7764706, 0, 1, 1,
0.8131596, -0.3968301, 2.191816, 0.7803922, 0, 1, 1,
0.8139968, 2.125286, -0.3075463, 0.7882353, 0, 1, 1,
0.8172334, -1.98422, 2.927053, 0.7921569, 0, 1, 1,
0.8213298, 0.4382452, 1.080619, 0.8, 0, 1, 1,
0.8214096, -1.269098, 1.851731, 0.8078431, 0, 1, 1,
0.8218758, -0.5307356, -0.0398654, 0.8117647, 0, 1, 1,
0.8221605, 1.598915, -0.09275485, 0.8196079, 0, 1, 1,
0.8480534, -1.703484, 3.203687, 0.8235294, 0, 1, 1,
0.8486915, 0.1359293, 1.065671, 0.8313726, 0, 1, 1,
0.8641394, -0.8011978, 1.899341, 0.8352941, 0, 1, 1,
0.8657569, 0.611365, 1.166259, 0.8431373, 0, 1, 1,
0.8779622, -1.17846, 1.903486, 0.8470588, 0, 1, 1,
0.8798875, 1.913831, 0.6047183, 0.854902, 0, 1, 1,
0.8813304, -0.5554959, 0.6514228, 0.8588235, 0, 1, 1,
0.8888541, 1.013309, 2.357108, 0.8666667, 0, 1, 1,
0.89404, 0.6865773, 1.122047, 0.8705882, 0, 1, 1,
0.9006414, 1.648056, -0.4927121, 0.8784314, 0, 1, 1,
0.905156, -0.2698883, 1.945903, 0.8823529, 0, 1, 1,
0.9052226, 0.6242551, 1.708499, 0.8901961, 0, 1, 1,
0.9052591, -0.3852517, 1.860734, 0.8941177, 0, 1, 1,
0.9054403, -0.06097317, 1.24697, 0.9019608, 0, 1, 1,
0.9134525, 0.4449043, 2.423781, 0.9098039, 0, 1, 1,
0.9164062, 0.2290073, 1.738185, 0.9137255, 0, 1, 1,
0.9175114, 1.077314, 0.7926953, 0.9215686, 0, 1, 1,
0.9188012, 0.5565078, 1.113238, 0.9254902, 0, 1, 1,
0.927168, -0.02547484, 1.20815, 0.9333333, 0, 1, 1,
0.9320711, -0.7521943, 2.328037, 0.9372549, 0, 1, 1,
0.9382768, 2.144406, -1.45197, 0.945098, 0, 1, 1,
0.9411405, 2.052035, -0.7673374, 0.9490196, 0, 1, 1,
0.9486269, -1.219858, 5.886826, 0.9568627, 0, 1, 1,
0.9501427, -0.09845145, 1.907001, 0.9607843, 0, 1, 1,
0.9516566, -1.846169, 2.967584, 0.9686275, 0, 1, 1,
0.9562824, 0.4256671, 1.037387, 0.972549, 0, 1, 1,
0.9602708, -0.0003088001, 2.014012, 0.9803922, 0, 1, 1,
0.9637633, 0.06181848, 1.484991, 0.9843137, 0, 1, 1,
0.972512, 1.303647, 2.191809, 0.9921569, 0, 1, 1,
0.9776802, 1.158079, 0.2964779, 0.9960784, 0, 1, 1,
0.9780384, -0.6336359, 1.594538, 1, 0, 0.9960784, 1,
0.9798284, 1.971638, 1.701963, 1, 0, 0.9882353, 1,
0.9826908, -0.7192531, 2.086647, 1, 0, 0.9843137, 1,
0.9849864, 1.100552, 0.3289781, 1, 0, 0.9764706, 1,
0.997627, 0.8399739, 1.69038, 1, 0, 0.972549, 1,
0.9977856, 0.7746774, -0.4640679, 1, 0, 0.9647059, 1,
1.000905, -0.6354399, 2.026836, 1, 0, 0.9607843, 1,
1.009547, -1.534536, 2.53973, 1, 0, 0.9529412, 1,
1.013478, 0.8396774, 1.11531, 1, 0, 0.9490196, 1,
1.027374, -0.5587614, 0.6472887, 1, 0, 0.9411765, 1,
1.032022, -0.294846, 0.08902008, 1, 0, 0.9372549, 1,
1.039302, 1.445564, -0.9210613, 1, 0, 0.9294118, 1,
1.043779, -0.07441428, 1.395658, 1, 0, 0.9254902, 1,
1.046293, -0.521579, 3.830759, 1, 0, 0.9176471, 1,
1.049747, -0.8655252, 1.38406, 1, 0, 0.9137255, 1,
1.054621, 0.588674, 2.751891, 1, 0, 0.9058824, 1,
1.057286, -1.370321, 1.326129, 1, 0, 0.9019608, 1,
1.065586, -2.227597, 2.774338, 1, 0, 0.8941177, 1,
1.072891, -0.004340468, 1.345576, 1, 0, 0.8862745, 1,
1.073184, 2.789412, 1.097558, 1, 0, 0.8823529, 1,
1.079512, 0.03925602, 1.798769, 1, 0, 0.8745098, 1,
1.086842, -0.6850382, 0.1562188, 1, 0, 0.8705882, 1,
1.095626, -0.2948664, 0.2013277, 1, 0, 0.8627451, 1,
1.096273, 0.6583883, 0.5691594, 1, 0, 0.8588235, 1,
1.107832, -0.3231839, 0.6873865, 1, 0, 0.8509804, 1,
1.111019, 1.828231, 0.9457186, 1, 0, 0.8470588, 1,
1.112176, -0.8143553, 1.757701, 1, 0, 0.8392157, 1,
1.11238, -0.733556, 2.560743, 1, 0, 0.8352941, 1,
1.114975, 1.951349, 0.2307874, 1, 0, 0.827451, 1,
1.124018, 0.3261002, 1.413814, 1, 0, 0.8235294, 1,
1.126631, -0.06760625, 4.180575, 1, 0, 0.8156863, 1,
1.131194, 0.4965911, -0.6565858, 1, 0, 0.8117647, 1,
1.140163, 0.2328078, 2.301249, 1, 0, 0.8039216, 1,
1.143661, 0.9603473, 0.5519545, 1, 0, 0.7960784, 1,
1.1517, 0.17971, 1.04422, 1, 0, 0.7921569, 1,
1.152054, -1.588788, 1.432944, 1, 0, 0.7843137, 1,
1.160105, 0.2854499, -0.2465829, 1, 0, 0.7803922, 1,
1.161058, 1.693693, -0.8212176, 1, 0, 0.772549, 1,
1.165115, -0.5369068, 3.175732, 1, 0, 0.7686275, 1,
1.176411, 0.1727679, -0.06920896, 1, 0, 0.7607843, 1,
1.179127, -1.26377, 1.645868, 1, 0, 0.7568628, 1,
1.179339, -0.6604946, 1.11526, 1, 0, 0.7490196, 1,
1.185961, 2.017349, 0.2992954, 1, 0, 0.7450981, 1,
1.193051, 0.3693869, 0.2828944, 1, 0, 0.7372549, 1,
1.194916, -0.9688286, 2.124081, 1, 0, 0.7333333, 1,
1.196653, -0.7474281, 1.029027, 1, 0, 0.7254902, 1,
1.201984, 0.2020049, 0.9480763, 1, 0, 0.7215686, 1,
1.207403, -0.4455022, 0.5023441, 1, 0, 0.7137255, 1,
1.207436, 0.2012977, 0.5233112, 1, 0, 0.7098039, 1,
1.215183, 0.1531771, 1.414173, 1, 0, 0.7019608, 1,
1.215811, 0.8437793, 0.9187759, 1, 0, 0.6941177, 1,
1.221863, -0.3819735, 2.074644, 1, 0, 0.6901961, 1,
1.230344, 0.9030039, 1.179975, 1, 0, 0.682353, 1,
1.233541, -1.097944, 2.482168, 1, 0, 0.6784314, 1,
1.237279, 0.2600383, 2.266963, 1, 0, 0.6705883, 1,
1.238429, 0.3017269, 0.7313145, 1, 0, 0.6666667, 1,
1.24526, 1.190386, 0.7096359, 1, 0, 0.6588235, 1,
1.253198, -0.2647143, 1.675755, 1, 0, 0.654902, 1,
1.260488, -2.053739, 3.239933, 1, 0, 0.6470588, 1,
1.260665, -0.3590054, 3.100324, 1, 0, 0.6431373, 1,
1.261126, -0.4495796, 2.272411, 1, 0, 0.6352941, 1,
1.263505, -0.7348974, 2.018551, 1, 0, 0.6313726, 1,
1.267232, 0.6864573, 1.118958, 1, 0, 0.6235294, 1,
1.270342, -1.235091, 1.599265, 1, 0, 0.6196079, 1,
1.275151, -0.7844841, 1.851159, 1, 0, 0.6117647, 1,
1.27928, 1.077241, 1.709326, 1, 0, 0.6078432, 1,
1.286335, -1.191275, 2.397266, 1, 0, 0.6, 1,
1.289396, 0.5686774, 1.794162, 1, 0, 0.5921569, 1,
1.291203, 0.4339744, 1.400269, 1, 0, 0.5882353, 1,
1.29231, 1.268296, 2.331336, 1, 0, 0.5803922, 1,
1.31684, 0.8476173, 3.165575, 1, 0, 0.5764706, 1,
1.31791, -0.640425, 0.4746518, 1, 0, 0.5686275, 1,
1.326866, -0.1346168, 3.542112, 1, 0, 0.5647059, 1,
1.3276, 0.1659593, 1.036465, 1, 0, 0.5568628, 1,
1.333685, 0.1489625, 2.884956, 1, 0, 0.5529412, 1,
1.340675, -0.0380443, 1.856816, 1, 0, 0.5450981, 1,
1.347379, -1.709078, 0.9052356, 1, 0, 0.5411765, 1,
1.353606, -0.1925424, 2.998056, 1, 0, 0.5333334, 1,
1.356462, -0.2497129, 1.972495, 1, 0, 0.5294118, 1,
1.362072, -0.2091486, 2.491993, 1, 0, 0.5215687, 1,
1.362484, 0.8322697, -0.8500251, 1, 0, 0.5176471, 1,
1.363296, -1.044434, 2.830299, 1, 0, 0.509804, 1,
1.386014, -0.6438009, 3.280245, 1, 0, 0.5058824, 1,
1.410606, -0.2780098, 1.630129, 1, 0, 0.4980392, 1,
1.419444, 0.06942666, 2.00499, 1, 0, 0.4901961, 1,
1.426548, -0.07675551, 2.32638, 1, 0, 0.4862745, 1,
1.445086, 0.1202946, 0.9298811, 1, 0, 0.4784314, 1,
1.448629, -0.4039202, 0.9844539, 1, 0, 0.4745098, 1,
1.451262, -0.2593222, 1.507711, 1, 0, 0.4666667, 1,
1.46537, -0.7060762, 1.391443, 1, 0, 0.4627451, 1,
1.4743, 1.327236, -0.02919748, 1, 0, 0.454902, 1,
1.481193, 0.2903843, 1.542617, 1, 0, 0.4509804, 1,
1.487294, -0.2985559, 2.344465, 1, 0, 0.4431373, 1,
1.488193, 0.2138535, 2.5475, 1, 0, 0.4392157, 1,
1.492073, -1.355786, 1.367577, 1, 0, 0.4313726, 1,
1.494062, -0.5250399, 1.877494, 1, 0, 0.427451, 1,
1.500617, -0.4044597, 0.8486087, 1, 0, 0.4196078, 1,
1.501309, -0.9341162, 2.170533, 1, 0, 0.4156863, 1,
1.539569, -0.356331, 2.284009, 1, 0, 0.4078431, 1,
1.542319, -0.1944415, 2.91799, 1, 0, 0.4039216, 1,
1.554661, -0.6203796, 1.477258, 1, 0, 0.3960784, 1,
1.563554, 0.3935479, 2.725303, 1, 0, 0.3882353, 1,
1.566745, 0.4516641, 1.841408, 1, 0, 0.3843137, 1,
1.626216, -0.1061106, 3.33919, 1, 0, 0.3764706, 1,
1.656853, 0.7958089, -0.1345088, 1, 0, 0.372549, 1,
1.66521, 0.2249983, 2.009342, 1, 0, 0.3647059, 1,
1.669174, 1.430692, 1.620332, 1, 0, 0.3607843, 1,
1.670398, -0.8558533, 2.194078, 1, 0, 0.3529412, 1,
1.673592, 1.010373, 2.79082, 1, 0, 0.3490196, 1,
1.674071, -0.07739791, 2.534014, 1, 0, 0.3411765, 1,
1.690747, 0.6929715, 0.1127806, 1, 0, 0.3372549, 1,
1.693799, -0.09416333, 2.734887, 1, 0, 0.3294118, 1,
1.696792, 0.5592252, 2.656032, 1, 0, 0.3254902, 1,
1.708931, -0.1781671, 0.2036892, 1, 0, 0.3176471, 1,
1.71847, 0.7781793, 0.9497355, 1, 0, 0.3137255, 1,
1.729701, -0.4027349, 1.641365, 1, 0, 0.3058824, 1,
1.744243, 1.187198, 0.3471976, 1, 0, 0.2980392, 1,
1.762296, -2.582309, 3.06862, 1, 0, 0.2941177, 1,
1.767205, 0.7366046, 1.847063, 1, 0, 0.2862745, 1,
1.767448, 0.005584101, 0.4500848, 1, 0, 0.282353, 1,
1.794001, -0.6157323, 2.623967, 1, 0, 0.2745098, 1,
1.796789, 0.645431, 1.151748, 1, 0, 0.2705882, 1,
1.797406, 0.6213198, 1.767737, 1, 0, 0.2627451, 1,
1.811326, -0.9118364, 1.029968, 1, 0, 0.2588235, 1,
1.815382, 1.441339, -0.2612873, 1, 0, 0.2509804, 1,
1.824414, 0.8207054, 2.291511, 1, 0, 0.2470588, 1,
1.848686, 0.05961138, 3.406675, 1, 0, 0.2392157, 1,
1.861891, 0.7867227, 2.331395, 1, 0, 0.2352941, 1,
1.86557, -0.440239, 1.796217, 1, 0, 0.227451, 1,
1.890268, 0.5160024, 2.915643, 1, 0, 0.2235294, 1,
1.89765, 1.200003, 0.2817873, 1, 0, 0.2156863, 1,
1.902382, -0.005062396, 2.025772, 1, 0, 0.2117647, 1,
1.907951, 0.967566, -0.05173485, 1, 0, 0.2039216, 1,
1.915584, 0.7970315, 2.346592, 1, 0, 0.1960784, 1,
1.917041, -1.903852, 2.232495, 1, 0, 0.1921569, 1,
1.918276, 0.2198021, 2.341808, 1, 0, 0.1843137, 1,
1.925404, 0.8160791, 0.7482895, 1, 0, 0.1803922, 1,
1.9351, 1.491781, 1.645858, 1, 0, 0.172549, 1,
1.952394, -0.4436156, 1.680015, 1, 0, 0.1686275, 1,
1.95597, -1.979951, 1.143364, 1, 0, 0.1607843, 1,
1.970421, -0.5674952, 0.1782371, 1, 0, 0.1568628, 1,
1.972419, -0.7459932, 2.651386, 1, 0, 0.1490196, 1,
1.975081, 0.1555695, 1.017964, 1, 0, 0.145098, 1,
1.988747, 1.03471, 1.936133, 1, 0, 0.1372549, 1,
1.989158, -0.001054684, 1.646113, 1, 0, 0.1333333, 1,
1.990465, -1.067149, 2.259406, 1, 0, 0.1254902, 1,
1.990654, 0.5466794, 0.578181, 1, 0, 0.1215686, 1,
2.000841, 1.201047, 1.27643, 1, 0, 0.1137255, 1,
2.021449, 0.4471703, 1.588181, 1, 0, 0.1098039, 1,
2.026522, -0.01817239, 2.045068, 1, 0, 0.1019608, 1,
2.05634, 0.3516833, 3.160792, 1, 0, 0.09411765, 1,
2.059037, 0.03612577, 0.7322373, 1, 0, 0.09019608, 1,
2.095721, 0.9537211, 2.285564, 1, 0, 0.08235294, 1,
2.133165, 0.1769689, 0.5732908, 1, 0, 0.07843138, 1,
2.135058, -1.15574, 2.967813, 1, 0, 0.07058824, 1,
2.1358, 0.1022513, 1.776375, 1, 0, 0.06666667, 1,
2.173266, -1.283203, 3.370936, 1, 0, 0.05882353, 1,
2.182176, 0.06987616, 2.144226, 1, 0, 0.05490196, 1,
2.199515, -1.913599, 0.9071302, 1, 0, 0.04705882, 1,
2.326865, 1.509925, 1.218811, 1, 0, 0.04313726, 1,
2.427915, 0.09843896, 0.2559925, 1, 0, 0.03529412, 1,
2.856431, -0.6747781, 1.626792, 1, 0, 0.03137255, 1,
2.954586, -0.5776802, 3.457278, 1, 0, 0.02352941, 1,
2.973954, 0.2101556, 2.957056, 1, 0, 0.01960784, 1,
3.067379, -1.251165, 3.565709, 1, 0, 0.01176471, 1,
3.405644, 0.02466378, 2.756321, 1, 0, 0.007843138, 1
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
0.3157755, -4.907702, -7.185998, 0, -0.5, 0.5, 0.5,
0.3157755, -4.907702, -7.185998, 1, -0.5, 0.5, 0.5,
0.3157755, -4.907702, -7.185998, 1, 1.5, 0.5, 0.5,
0.3157755, -4.907702, -7.185998, 0, 1.5, 0.5, 0.5
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
-3.821558, 0.1709492, -7.185998, 0, -0.5, 0.5, 0.5,
-3.821558, 0.1709492, -7.185998, 1, -0.5, 0.5, 0.5,
-3.821558, 0.1709492, -7.185998, 1, 1.5, 0.5, 0.5,
-3.821558, 0.1709492, -7.185998, 0, 1.5, 0.5, 0.5
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
-3.821558, -4.907702, 0.2977602, 0, -0.5, 0.5, 0.5,
-3.821558, -4.907702, 0.2977602, 1, -0.5, 0.5, 0.5,
-3.821558, -4.907702, 0.2977602, 1, 1.5, 0.5, 0.5,
-3.821558, -4.907702, 0.2977602, 0, 1.5, 0.5, 0.5
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
-2, -3.735705, -5.458977,
3, -3.735705, -5.458977,
-2, -3.735705, -5.458977,
-2, -3.931038, -5.746814,
-1, -3.735705, -5.458977,
-1, -3.931038, -5.746814,
0, -3.735705, -5.458977,
0, -3.931038, -5.746814,
1, -3.735705, -5.458977,
1, -3.931038, -5.746814,
2, -3.735705, -5.458977,
2, -3.931038, -5.746814,
3, -3.735705, -5.458977,
3, -3.931038, -5.746814
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
-2, -4.321703, -6.322488, 0, -0.5, 0.5, 0.5,
-2, -4.321703, -6.322488, 1, -0.5, 0.5, 0.5,
-2, -4.321703, -6.322488, 1, 1.5, 0.5, 0.5,
-2, -4.321703, -6.322488, 0, 1.5, 0.5, 0.5,
-1, -4.321703, -6.322488, 0, -0.5, 0.5, 0.5,
-1, -4.321703, -6.322488, 1, -0.5, 0.5, 0.5,
-1, -4.321703, -6.322488, 1, 1.5, 0.5, 0.5,
-1, -4.321703, -6.322488, 0, 1.5, 0.5, 0.5,
0, -4.321703, -6.322488, 0, -0.5, 0.5, 0.5,
0, -4.321703, -6.322488, 1, -0.5, 0.5, 0.5,
0, -4.321703, -6.322488, 1, 1.5, 0.5, 0.5,
0, -4.321703, -6.322488, 0, 1.5, 0.5, 0.5,
1, -4.321703, -6.322488, 0, -0.5, 0.5, 0.5,
1, -4.321703, -6.322488, 1, -0.5, 0.5, 0.5,
1, -4.321703, -6.322488, 1, 1.5, 0.5, 0.5,
1, -4.321703, -6.322488, 0, 1.5, 0.5, 0.5,
2, -4.321703, -6.322488, 0, -0.5, 0.5, 0.5,
2, -4.321703, -6.322488, 1, -0.5, 0.5, 0.5,
2, -4.321703, -6.322488, 1, 1.5, 0.5, 0.5,
2, -4.321703, -6.322488, 0, 1.5, 0.5, 0.5,
3, -4.321703, -6.322488, 0, -0.5, 0.5, 0.5,
3, -4.321703, -6.322488, 1, -0.5, 0.5, 0.5,
3, -4.321703, -6.322488, 1, 1.5, 0.5, 0.5,
3, -4.321703, -6.322488, 0, 1.5, 0.5, 0.5
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
-2.866789, -2, -5.458977,
-2.866789, 2, -5.458977,
-2.866789, -2, -5.458977,
-3.025917, -2, -5.746814,
-2.866789, 0, -5.458977,
-3.025917, 0, -5.746814,
-2.866789, 2, -5.458977,
-3.025917, 2, -5.746814
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
"0",
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
-3.344174, -2, -6.322488, 0, -0.5, 0.5, 0.5,
-3.344174, -2, -6.322488, 1, -0.5, 0.5, 0.5,
-3.344174, -2, -6.322488, 1, 1.5, 0.5, 0.5,
-3.344174, -2, -6.322488, 0, 1.5, 0.5, 0.5,
-3.344174, 0, -6.322488, 0, -0.5, 0.5, 0.5,
-3.344174, 0, -6.322488, 1, -0.5, 0.5, 0.5,
-3.344174, 0, -6.322488, 1, 1.5, 0.5, 0.5,
-3.344174, 0, -6.322488, 0, 1.5, 0.5, 0.5,
-3.344174, 2, -6.322488, 0, -0.5, 0.5, 0.5,
-3.344174, 2, -6.322488, 1, -0.5, 0.5, 0.5,
-3.344174, 2, -6.322488, 1, 1.5, 0.5, 0.5,
-3.344174, 2, -6.322488, 0, 1.5, 0.5, 0.5
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
-2.866789, -3.735705, -4,
-2.866789, -3.735705, 4,
-2.866789, -3.735705, -4,
-3.025917, -3.931038, -4,
-2.866789, -3.735705, -2,
-3.025917, -3.931038, -2,
-2.866789, -3.735705, 0,
-3.025917, -3.931038, 0,
-2.866789, -3.735705, 2,
-3.025917, -3.931038, 2,
-2.866789, -3.735705, 4,
-3.025917, -3.931038, 4
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
-3.344174, -4.321703, -4, 0, -0.5, 0.5, 0.5,
-3.344174, -4.321703, -4, 1, -0.5, 0.5, 0.5,
-3.344174, -4.321703, -4, 1, 1.5, 0.5, 0.5,
-3.344174, -4.321703, -4, 0, 1.5, 0.5, 0.5,
-3.344174, -4.321703, -2, 0, -0.5, 0.5, 0.5,
-3.344174, -4.321703, -2, 1, -0.5, 0.5, 0.5,
-3.344174, -4.321703, -2, 1, 1.5, 0.5, 0.5,
-3.344174, -4.321703, -2, 0, 1.5, 0.5, 0.5,
-3.344174, -4.321703, 0, 0, -0.5, 0.5, 0.5,
-3.344174, -4.321703, 0, 1, -0.5, 0.5, 0.5,
-3.344174, -4.321703, 0, 1, 1.5, 0.5, 0.5,
-3.344174, -4.321703, 0, 0, 1.5, 0.5, 0.5,
-3.344174, -4.321703, 2, 0, -0.5, 0.5, 0.5,
-3.344174, -4.321703, 2, 1, -0.5, 0.5, 0.5,
-3.344174, -4.321703, 2, 1, 1.5, 0.5, 0.5,
-3.344174, -4.321703, 2, 0, 1.5, 0.5, 0.5,
-3.344174, -4.321703, 4, 0, -0.5, 0.5, 0.5,
-3.344174, -4.321703, 4, 1, -0.5, 0.5, 0.5,
-3.344174, -4.321703, 4, 1, 1.5, 0.5, 0.5,
-3.344174, -4.321703, 4, 0, 1.5, 0.5, 0.5
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
-2.866789, -3.735705, -5.458977,
-2.866789, 4.077604, -5.458977,
-2.866789, -3.735705, 6.054498,
-2.866789, 4.077604, 6.054498,
-2.866789, -3.735705, -5.458977,
-2.866789, -3.735705, 6.054498,
-2.866789, 4.077604, -5.458977,
-2.866789, 4.077604, 6.054498,
-2.866789, -3.735705, -5.458977,
3.49834, -3.735705, -5.458977,
-2.866789, -3.735705, 6.054498,
3.49834, -3.735705, 6.054498,
-2.866789, 4.077604, -5.458977,
3.49834, 4.077604, -5.458977,
-2.866789, 4.077604, 6.054498,
3.49834, 4.077604, 6.054498,
3.49834, -3.735705, -5.458977,
3.49834, 4.077604, -5.458977,
3.49834, -3.735705, 6.054498,
3.49834, 4.077604, 6.054498,
3.49834, -3.735705, -5.458977,
3.49834, -3.735705, 6.054498,
3.49834, 4.077604, -5.458977,
3.49834, 4.077604, 6.054498
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
var radius = 8.170475;
var distance = 36.35137;
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
mvMatrix.translate( -0.3157755, -0.1709492, -0.2977602 );
mvMatrix.scale( 1.387887, 1.130645, 0.7672816 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.35137);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Formetanate_hydrochl<-read.table("Formetanate_hydrochl.xyz", skip=1)
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
-2.774093, -0.6220925, -1.385358, 0, 0, 1, 1, 1,
-2.759273, -0.5778797, -3.29001, 1, 0, 0, 1, 1,
-2.705901, 1.514416, -2.317147, 1, 0, 0, 1, 1,
-2.665594, 0.3397726, -1.306, 1, 0, 0, 1, 1,
-2.655845, 0.6426498, -0.6011291, 1, 0, 0, 1, 1,
-2.63279, -1.102438, -2.507504, 1, 0, 0, 1, 1,
-2.624654, -0.9729568, -2.941814, 0, 0, 0, 1, 1,
-2.61612, 0.118999, -0.08713949, 0, 0, 0, 1, 1,
-2.52073, -0.7969908, -2.573317, 0, 0, 0, 1, 1,
-2.404199, -0.5089055, -2.193532, 0, 0, 0, 1, 1,
-2.397539, -0.6223683, -2.361072, 0, 0, 0, 1, 1,
-2.389732, 0.8484425, -2.69153, 0, 0, 0, 1, 1,
-2.385433, -1.04979, -2.723656, 0, 0, 0, 1, 1,
-2.317617, -0.2398044, -1.425229, 1, 1, 1, 1, 1,
-2.249291, 0.3147938, -1.239888, 1, 1, 1, 1, 1,
-2.244694, -1.791231, -2.350228, 1, 1, 1, 1, 1,
-2.239088, -0.4918538, -2.804503, 1, 1, 1, 1, 1,
-2.205976, -0.06047363, -2.656568, 1, 1, 1, 1, 1,
-2.191936, 1.463847, -1.043405, 1, 1, 1, 1, 1,
-2.175988, -0.4558771, -2.357819, 1, 1, 1, 1, 1,
-2.16551, 0.4032641, -1.489746, 1, 1, 1, 1, 1,
-2.134726, 0.08761635, -0.451842, 1, 1, 1, 1, 1,
-2.121702, -0.5178549, -1.05656, 1, 1, 1, 1, 1,
-2.060346, 0.633458, -0.23529, 1, 1, 1, 1, 1,
-2.059689, -0.2968272, -1.01136, 1, 1, 1, 1, 1,
-2.045582, -0.4430544, -1.771512, 1, 1, 1, 1, 1,
-2.043516, -0.02049923, -2.854943, 1, 1, 1, 1, 1,
-2.033788, 0.4622558, -1.945863, 1, 1, 1, 1, 1,
-2.028731, 0.45919, -2.112134, 0, 0, 1, 1, 1,
-2.023467, -2.106627, -1.937022, 1, 0, 0, 1, 1,
-1.995548, 1.118828, -1.706842, 1, 0, 0, 1, 1,
-1.90685, -0.9688137, -2.884281, 1, 0, 0, 1, 1,
-1.894094, 0.4663251, -1.211666, 1, 0, 0, 1, 1,
-1.886788, 1.544277, 0.6676223, 1, 0, 0, 1, 1,
-1.851165, 0.1794809, -1.260006, 0, 0, 0, 1, 1,
-1.846741, -1.23263, -3.535276, 0, 0, 0, 1, 1,
-1.826295, 1.483966, -0.5814711, 0, 0, 0, 1, 1,
-1.823756, -0.7939605, -0.8623337, 0, 0, 0, 1, 1,
-1.809828, 0.2228008, -0.3369321, 0, 0, 0, 1, 1,
-1.79404, 1.70725, -1.129962, 0, 0, 0, 1, 1,
-1.792634, -0.8696877, -2.238344, 0, 0, 0, 1, 1,
-1.779046, -0.535723, -1.72988, 1, 1, 1, 1, 1,
-1.772614, -0.1818426, -1.484294, 1, 1, 1, 1, 1,
-1.761885, -1.010041, -0.6177692, 1, 1, 1, 1, 1,
-1.730397, -0.01093504, -1.819533, 1, 1, 1, 1, 1,
-1.729166, -0.3382663, -1.151355, 1, 1, 1, 1, 1,
-1.703531, 0.164654, -2.764698, 1, 1, 1, 1, 1,
-1.69256, 1.289864, -0.3672971, 1, 1, 1, 1, 1,
-1.68654, -0.3030511, -1.989223, 1, 1, 1, 1, 1,
-1.660729, 0.3829765, -0.8401047, 1, 1, 1, 1, 1,
-1.642579, 1.720647, -0.2301995, 1, 1, 1, 1, 1,
-1.630753, 1.495682, -0.4312378, 1, 1, 1, 1, 1,
-1.626569, -0.9359567, -3.290396, 1, 1, 1, 1, 1,
-1.624532, 0.2364404, -1.033775, 1, 1, 1, 1, 1,
-1.613162, 0.4959774, -2.280598, 1, 1, 1, 1, 1,
-1.61108, -0.7135412, -1.867759, 1, 1, 1, 1, 1,
-1.593224, -0.8299732, -2.021524, 0, 0, 1, 1, 1,
-1.59131, 1.104999, -1.786113, 1, 0, 0, 1, 1,
-1.585208, 0.2708283, -1.195479, 1, 0, 0, 1, 1,
-1.565163, 0.2058132, -1.90553, 1, 0, 0, 1, 1,
-1.562067, -1.170389, -2.97202, 1, 0, 0, 1, 1,
-1.561399, 0.3169044, -1.561882, 1, 0, 0, 1, 1,
-1.559298, 1.63972, -0.9930817, 0, 0, 0, 1, 1,
-1.557871, -0.6294423, -3.216427, 0, 0, 0, 1, 1,
-1.549255, 0.4528031, -2.05808, 0, 0, 0, 1, 1,
-1.539251, -1.761629, -2.276159, 0, 0, 0, 1, 1,
-1.528584, 0.6926289, -0.06352518, 0, 0, 0, 1, 1,
-1.520057, 0.624047, -0.6675615, 0, 0, 0, 1, 1,
-1.517968, 1.158263, -0.755595, 0, 0, 0, 1, 1,
-1.514068, -0.004839355, -1.09934, 1, 1, 1, 1, 1,
-1.503671, -0.5031781, -2.489953, 1, 1, 1, 1, 1,
-1.498773, 0.6981473, -1.661305, 1, 1, 1, 1, 1,
-1.496254, 0.7613528, 0.1558038, 1, 1, 1, 1, 1,
-1.494071, 1.79188, 0.4727282, 1, 1, 1, 1, 1,
-1.486365, 1.270029, 1.684152, 1, 1, 1, 1, 1,
-1.483908, -0.4871179, -1.886719, 1, 1, 1, 1, 1,
-1.473428, 0.0811079, -0.7186371, 1, 1, 1, 1, 1,
-1.465117, 1.373673, 0.2868306, 1, 1, 1, 1, 1,
-1.463591, -0.781555, -4.809216, 1, 1, 1, 1, 1,
-1.459569, -1.138814, -3.563452, 1, 1, 1, 1, 1,
-1.456376, -0.1597292, -1.391728, 1, 1, 1, 1, 1,
-1.447043, 0.5538424, -0.6417101, 1, 1, 1, 1, 1,
-1.428396, 0.5604483, -0.5883021, 1, 1, 1, 1, 1,
-1.426168, -2.955489, -2.36236, 1, 1, 1, 1, 1,
-1.422574, 0.291085, -0.1542563, 0, 0, 1, 1, 1,
-1.418415, -0.5295594, -2.111237, 1, 0, 0, 1, 1,
-1.407535, 2.041969, -1.424867, 1, 0, 0, 1, 1,
-1.406248, -0.3996633, -2.39082, 1, 0, 0, 1, 1,
-1.399392, 1.136302, -1.156359, 1, 0, 0, 1, 1,
-1.392489, 0.4850537, -1.107618, 1, 0, 0, 1, 1,
-1.372637, -0.08297253, -3.007711, 0, 0, 0, 1, 1,
-1.363822, -0.2688782, -1.159974, 0, 0, 0, 1, 1,
-1.355394, 0.1923013, -2.00603, 0, 0, 0, 1, 1,
-1.35248, 0.6240153, -1.019083, 0, 0, 0, 1, 1,
-1.343312, -0.2981265, -1.197327, 0, 0, 0, 1, 1,
-1.337629, 0.6196436, -0.6793219, 0, 0, 0, 1, 1,
-1.329425, 0.68137, -0.5870869, 0, 0, 0, 1, 1,
-1.318726, 0.7750037, -0.391142, 1, 1, 1, 1, 1,
-1.317762, 0.5217723, -0.1934514, 1, 1, 1, 1, 1,
-1.315906, -0.2329195, -0.7313183, 1, 1, 1, 1, 1,
-1.315075, -0.6222311, -1.507553, 1, 1, 1, 1, 1,
-1.311724, -0.1652527, -0.6052986, 1, 1, 1, 1, 1,
-1.305068, 0.2774416, -2.535947, 1, 1, 1, 1, 1,
-1.295588, 0.3431402, -0.8560169, 1, 1, 1, 1, 1,
-1.287299, 1.92968, -3.675999, 1, 1, 1, 1, 1,
-1.285275, 0.7764834, -0.2068779, 1, 1, 1, 1, 1,
-1.282441, -0.6905508, -1.647614, 1, 1, 1, 1, 1,
-1.282368, -0.2041881, -0.9383014, 1, 1, 1, 1, 1,
-1.271412, 1.060787, 0.725402, 1, 1, 1, 1, 1,
-1.267914, -1.59877, -2.787491, 1, 1, 1, 1, 1,
-1.261661, 1.070547, -0.3855534, 1, 1, 1, 1, 1,
-1.257588, 0.6709161, -1.182692, 1, 1, 1, 1, 1,
-1.25522, 0.5376659, -0.1605689, 0, 0, 1, 1, 1,
-1.250324, -0.5877765, -2.233666, 1, 0, 0, 1, 1,
-1.24816, -0.2700203, -1.108651, 1, 0, 0, 1, 1,
-1.240482, 0.5875558, -0.1093332, 1, 0, 0, 1, 1,
-1.238433, -0.1058942, -1.116459, 1, 0, 0, 1, 1,
-1.236726, 0.2547568, -3.517741, 1, 0, 0, 1, 1,
-1.23309, 0.5547927, -1.422658, 0, 0, 0, 1, 1,
-1.226629, 0.3429678, -0.6471456, 0, 0, 0, 1, 1,
-1.217162, 0.2198765, -1.945423, 0, 0, 0, 1, 1,
-1.216616, -0.2173259, -1.44245, 0, 0, 0, 1, 1,
-1.215278, 0.7472098, -1.831606, 0, 0, 0, 1, 1,
-1.192447, -0.4495703, -1.564459, 0, 0, 0, 1, 1,
-1.190406, 0.8886614, 1.139753, 0, 0, 0, 1, 1,
-1.186815, 0.01917978, -1.401768, 1, 1, 1, 1, 1,
-1.177387, 0.5146322, -1.010836, 1, 1, 1, 1, 1,
-1.176768, -0.5374144, -0.238068, 1, 1, 1, 1, 1,
-1.16661, -0.002488319, -1.884677, 1, 1, 1, 1, 1,
-1.163536, -3.024004, -2.841676, 1, 1, 1, 1, 1,
-1.157851, 0.0008323543, -1.114164, 1, 1, 1, 1, 1,
-1.157099, -0.06101134, -2.166278, 1, 1, 1, 1, 1,
-1.154122, 0.06434906, -1.59861, 1, 1, 1, 1, 1,
-1.152116, 0.3040304, -1.554626, 1, 1, 1, 1, 1,
-1.151836, 0.08272129, -2.701637, 1, 1, 1, 1, 1,
-1.148287, -1.05021, -1.117873, 1, 1, 1, 1, 1,
-1.146348, 0.6886896, -1.628816, 1, 1, 1, 1, 1,
-1.139598, 2.324295, -1.284556, 1, 1, 1, 1, 1,
-1.137433, -0.2914674, -0.3620695, 1, 1, 1, 1, 1,
-1.132128, 1.573833, -0.2636766, 1, 1, 1, 1, 1,
-1.129243, -1.010824, -3.061805, 0, 0, 1, 1, 1,
-1.125738, 0.1656694, -0.7412598, 1, 0, 0, 1, 1,
-1.123935, -0.2667793, -2.292659, 1, 0, 0, 1, 1,
-1.12264, -0.2762599, -0.9371045, 1, 0, 0, 1, 1,
-1.110896, 0.5472654, 1.116998, 1, 0, 0, 1, 1,
-1.101481, 1.296364, -2.730416, 1, 0, 0, 1, 1,
-1.101359, -1.522273, -3.781597, 0, 0, 0, 1, 1,
-1.100671, 1.904078, -0.4171114, 0, 0, 0, 1, 1,
-1.096253, -1.26677, -2.469024, 0, 0, 0, 1, 1,
-1.095519, 0.0938577, -1.050076, 0, 0, 0, 1, 1,
-1.094489, 2.074066, -0.9042821, 0, 0, 0, 1, 1,
-1.094462, 0.7986646, -1.354514, 0, 0, 0, 1, 1,
-1.092365, 0.6046714, -1.181576, 0, 0, 0, 1, 1,
-1.07977, -0.8621179, -1.842279, 1, 1, 1, 1, 1,
-1.074389, -0.1722998, -1.939758, 1, 1, 1, 1, 1,
-1.073629, 0.06565078, -1.982461, 1, 1, 1, 1, 1,
-1.065393, -0.5111883, -1.694605, 1, 1, 1, 1, 1,
-1.058071, -0.9176823, -3.157128, 1, 1, 1, 1, 1,
-1.057288, 1.301959, -1.131771, 1, 1, 1, 1, 1,
-1.056687, 0.8608829, -2.522396, 1, 1, 1, 1, 1,
-1.05564, -0.4755639, -2.358443, 1, 1, 1, 1, 1,
-1.04864, 0.7415184, 0.5060934, 1, 1, 1, 1, 1,
-1.046288, 1.460878, -2.944353, 1, 1, 1, 1, 1,
-1.043217, -0.07913781, -1.524781, 1, 1, 1, 1, 1,
-1.040746, -0.08538319, -0.9407432, 1, 1, 1, 1, 1,
-1.037986, -1.244743, -1.744963, 1, 1, 1, 1, 1,
-1.029871, 0.5718957, -0.8376822, 1, 1, 1, 1, 1,
-1.028793, 0.9768331, -1.011037, 1, 1, 1, 1, 1,
-1.023566, -1.756382, -1.902408, 0, 0, 1, 1, 1,
-1.023472, -0.7839329, -0.7779869, 1, 0, 0, 1, 1,
-1.021048, -2.187058, -2.903626, 1, 0, 0, 1, 1,
-1.018661, 1.003919, -0.2013456, 1, 0, 0, 1, 1,
-1.013121, 1.425931, 1.489493, 1, 0, 0, 1, 1,
-1.009276, 1.516824, -0.608297, 1, 0, 0, 1, 1,
-0.999759, 0.6485532, -1.980237, 0, 0, 0, 1, 1,
-0.9970294, 0.2229311, -0.4210315, 0, 0, 0, 1, 1,
-0.9918049, 0.9653798, -2.217963, 0, 0, 0, 1, 1,
-0.9850733, 2.60413, -0.9307682, 0, 0, 0, 1, 1,
-0.9784868, -0.6564783, -1.569448, 0, 0, 0, 1, 1,
-0.9653765, 0.2420529, -2.186173, 0, 0, 0, 1, 1,
-0.9621494, 1.239004, -0.6512771, 0, 0, 0, 1, 1,
-0.9579357, -0.6192908, -1.311059, 1, 1, 1, 1, 1,
-0.9571667, 0.3329004, -0.941595, 1, 1, 1, 1, 1,
-0.9532135, 1.613317, 0.8880038, 1, 1, 1, 1, 1,
-0.9504222, -0.9087225, -2.556466, 1, 1, 1, 1, 1,
-0.948643, 0.8629902, -1.046805, 1, 1, 1, 1, 1,
-0.9473079, 0.9905404, -1.048339, 1, 1, 1, 1, 1,
-0.946802, -2.228908, -3.518116, 1, 1, 1, 1, 1,
-0.9456965, -0.04316276, -1.977772, 1, 1, 1, 1, 1,
-0.9423605, -0.4343312, -0.5338774, 1, 1, 1, 1, 1,
-0.9416, 0.7586105, -0.7315292, 1, 1, 1, 1, 1,
-0.9385248, 1.570906, -1.616076, 1, 1, 1, 1, 1,
-0.9275178, 1.140448, 0.7099689, 1, 1, 1, 1, 1,
-0.9184513, -1.444565, -1.290887, 1, 1, 1, 1, 1,
-0.9138799, -1.707662, -2.042825, 1, 1, 1, 1, 1,
-0.9103912, 1.42012, -0.7368875, 1, 1, 1, 1, 1,
-0.9056311, -1.332274, -2.811319, 0, 0, 1, 1, 1,
-0.8933286, -0.1533572, -1.936111, 1, 0, 0, 1, 1,
-0.8880678, -0.420939, -3.148717, 1, 0, 0, 1, 1,
-0.8836448, -0.07127306, -2.528453, 1, 0, 0, 1, 1,
-0.8774546, -1.879098, -1.593983, 1, 0, 0, 1, 1,
-0.8628426, -1.146555, -4.020504, 1, 0, 0, 1, 1,
-0.8616344, 0.9172153, 0.2304248, 0, 0, 0, 1, 1,
-0.8604023, 0.958581, 0.542578, 0, 0, 0, 1, 1,
-0.8596795, -0.4770271, -2.581291, 0, 0, 0, 1, 1,
-0.8501231, -1.36389, -2.029975, 0, 0, 0, 1, 1,
-0.8483334, -1.278609, -2.544188, 0, 0, 0, 1, 1,
-0.8466595, 1.252956, -2.515673, 0, 0, 0, 1, 1,
-0.8445053, -0.6956126, -2.061097, 0, 0, 0, 1, 1,
-0.8434283, 0.2357232, -0.2103977, 1, 1, 1, 1, 1,
-0.8423411, -0.3052208, -1.209038, 1, 1, 1, 1, 1,
-0.8392717, -0.4839189, -1.967333, 1, 1, 1, 1, 1,
-0.8218264, 0.3784333, -1.439186, 1, 1, 1, 1, 1,
-0.8160674, -0.7874662, -2.582043, 1, 1, 1, 1, 1,
-0.8066999, 0.1128024, -1.542755, 1, 1, 1, 1, 1,
-0.8043365, -2.776958, -4.003161, 1, 1, 1, 1, 1,
-0.8041177, -0.3296259, -2.383645, 1, 1, 1, 1, 1,
-0.8041087, -0.5684685, -0.8683606, 1, 1, 1, 1, 1,
-0.8022093, -1.74746, -4.915382, 1, 1, 1, 1, 1,
-0.7964367, -0.1180942, 0.1422777, 1, 1, 1, 1, 1,
-0.7946997, -0.8561739, -2.249388, 1, 1, 1, 1, 1,
-0.7929173, -0.4279486, -1.076721, 1, 1, 1, 1, 1,
-0.7918786, -0.9821062, -1.469413, 1, 1, 1, 1, 1,
-0.7794358, -1.680863, -1.441209, 1, 1, 1, 1, 1,
-0.7742285, -0.3098919, -0.5605519, 0, 0, 1, 1, 1,
-0.7582553, -0.2358532, -1.470825, 1, 0, 0, 1, 1,
-0.7559923, -0.8703206, -2.459357, 1, 0, 0, 1, 1,
-0.7556758, -0.6732647, -3.313208, 1, 0, 0, 1, 1,
-0.7536946, 0.8218444, -1.608547, 1, 0, 0, 1, 1,
-0.7518464, -1.215946, -2.615691, 1, 0, 0, 1, 1,
-0.7509943, 0.7587425, -0.4835823, 0, 0, 0, 1, 1,
-0.74488, 0.216345, 0.2203511, 0, 0, 0, 1, 1,
-0.7446351, -0.4339585, -2.987404, 0, 0, 0, 1, 1,
-0.7426016, 0.7202052, -2.035455, 0, 0, 0, 1, 1,
-0.7401736, 1.015184, -0.685056, 0, 0, 0, 1, 1,
-0.7364125, -0.2121345, -0.7915286, 0, 0, 0, 1, 1,
-0.7359643, 0.2325725, -0.5722283, 0, 0, 0, 1, 1,
-0.7346318, 0.7464246, -0.7556387, 1, 1, 1, 1, 1,
-0.7317544, -0.2952514, -1.94563, 1, 1, 1, 1, 1,
-0.7250257, -0.1860678, -3.385938, 1, 1, 1, 1, 1,
-0.7244544, -0.893795, -0.775474, 1, 1, 1, 1, 1,
-0.7188873, 1.088691, -0.7864639, 1, 1, 1, 1, 1,
-0.7159715, 0.5986511, -1.089864, 1, 1, 1, 1, 1,
-0.7138898, -1.627796, -0.400173, 1, 1, 1, 1, 1,
-0.7108873, -0.6279838, -3.592594, 1, 1, 1, 1, 1,
-0.6991221, -1.280518, -1.472278, 1, 1, 1, 1, 1,
-0.6939346, -0.8390011, -0.922443, 1, 1, 1, 1, 1,
-0.6904127, -0.4734409, -2.783316, 1, 1, 1, 1, 1,
-0.6891056, 0.007725823, -2.583316, 1, 1, 1, 1, 1,
-0.6890019, -0.02279802, -2.811666, 1, 1, 1, 1, 1,
-0.6852562, 1.024998, 0.4731604, 1, 1, 1, 1, 1,
-0.6759134, 0.5921162, -0.531386, 1, 1, 1, 1, 1,
-0.6732088, -2.551952, -3.112051, 0, 0, 1, 1, 1,
-0.6688088, 0.5442753, 0.2187638, 1, 0, 0, 1, 1,
-0.6601322, 0.0330821, -1.631604, 1, 0, 0, 1, 1,
-0.6582932, 0.002382405, -1.814987, 1, 0, 0, 1, 1,
-0.6556724, -0.6503862, -4.227935, 1, 0, 0, 1, 1,
-0.6551718, -1.127463, -3.501199, 1, 0, 0, 1, 1,
-0.6509521, 0.221634, -0.4561018, 0, 0, 0, 1, 1,
-0.6498528, 0.08412514, -1.841676, 0, 0, 0, 1, 1,
-0.6482486, -0.8529361, -2.508364, 0, 0, 0, 1, 1,
-0.6461247, -0.7568928, -0.9218053, 0, 0, 0, 1, 1,
-0.6434662, 1.143606, -0.08948701, 0, 0, 0, 1, 1,
-0.6393479, 0.4875683, 0.3125675, 0, 0, 0, 1, 1,
-0.6384403, 0.05922348, -1.083718, 0, 0, 0, 1, 1,
-0.6350709, 1.922679, -0.1159034, 1, 1, 1, 1, 1,
-0.6281196, 2.186549, 0.0002970645, 1, 1, 1, 1, 1,
-0.6277223, 0.4890303, -1.130223, 1, 1, 1, 1, 1,
-0.6245825, 0.2586687, -2.423588, 1, 1, 1, 1, 1,
-0.6243663, 0.7216152, 0.7050048, 1, 1, 1, 1, 1,
-0.6221343, -0.1148828, -2.285259, 1, 1, 1, 1, 1,
-0.6213537, 0.6485207, -0.3313532, 1, 1, 1, 1, 1,
-0.6172529, 0.05940853, -0.8701013, 1, 1, 1, 1, 1,
-0.6098726, 0.2632367, -0.6058012, 1, 1, 1, 1, 1,
-0.6053218, -1.057974, -2.372132, 1, 1, 1, 1, 1,
-0.6018953, -0.4604419, -3.179289, 1, 1, 1, 1, 1,
-0.6011767, 0.9454088, -1.009855, 1, 1, 1, 1, 1,
-0.6001607, 0.4984416, -0.8904766, 1, 1, 1, 1, 1,
-0.5982959, 0.3496977, -2.221264, 1, 1, 1, 1, 1,
-0.597869, 1.719276, -0.6191811, 1, 1, 1, 1, 1,
-0.592968, 0.9416774, -0.06081125, 0, 0, 1, 1, 1,
-0.5910525, 0.617628, -0.6315253, 1, 0, 0, 1, 1,
-0.5907338, 0.1597239, -2.231352, 1, 0, 0, 1, 1,
-0.5808111, 1.270701, -0.185299, 1, 0, 0, 1, 1,
-0.5772868, 0.3563402, -1.86795, 1, 0, 0, 1, 1,
-0.5767831, -1.150946, -3.055557, 1, 0, 0, 1, 1,
-0.5767472, -0.7451649, -2.605117, 0, 0, 0, 1, 1,
-0.5750642, 1.341301, 0.802217, 0, 0, 0, 1, 1,
-0.5727645, 0.2312251, -0.8773482, 0, 0, 0, 1, 1,
-0.5695255, 0.4427172, 0.7038271, 0, 0, 0, 1, 1,
-0.5652931, 0.957123, -1.162386, 0, 0, 0, 1, 1,
-0.5650467, 1.181715, 0.8934284, 0, 0, 0, 1, 1,
-0.5613081, -0.4487465, -2.918496, 0, 0, 0, 1, 1,
-0.5608238, -1.021842, -2.242415, 1, 1, 1, 1, 1,
-0.5606536, 0.4073346, 0.7166953, 1, 1, 1, 1, 1,
-0.5579348, 0.1964068, -0.7005938, 1, 1, 1, 1, 1,
-0.5574861, 2.581762, -0.7285513, 1, 1, 1, 1, 1,
-0.5509516, -2.228433, -4.81477, 1, 1, 1, 1, 1,
-0.5508359, 0.8533098, 0.3107837, 1, 1, 1, 1, 1,
-0.5441232, -0.5493573, -3.904009, 1, 1, 1, 1, 1,
-0.5395519, 0.8072608, 0.6569247, 1, 1, 1, 1, 1,
-0.5354715, -2.777462, -2.623362, 1, 1, 1, 1, 1,
-0.5297038, 0.5106991, -1.266188, 1, 1, 1, 1, 1,
-0.5223718, 1.715128, 0.4827832, 1, 1, 1, 1, 1,
-0.5193722, -0.5878286, -2.518577, 1, 1, 1, 1, 1,
-0.5153125, -1.150027, -3.212754, 1, 1, 1, 1, 1,
-0.5089657, -0.2752475, -3.773777, 1, 1, 1, 1, 1,
-0.5087245, -1.59154, -3.429665, 1, 1, 1, 1, 1,
-0.5046647, 0.1353844, -0.4607471, 0, 0, 1, 1, 1,
-0.5043747, -1.093337, -3.309204, 1, 0, 0, 1, 1,
-0.4941371, -1.38849, -3.377012, 1, 0, 0, 1, 1,
-0.4931837, -2.230239, -1.089122, 1, 0, 0, 1, 1,
-0.4888461, -0.2217739, -1.777497, 1, 0, 0, 1, 1,
-0.4881437, 0.1896595, -3.153775, 1, 0, 0, 1, 1,
-0.4842206, 0.02245522, -0.1221568, 0, 0, 0, 1, 1,
-0.4812191, 0.9307792, 0.1795278, 0, 0, 0, 1, 1,
-0.4793739, 0.4793441, -1.57069, 0, 0, 0, 1, 1,
-0.4786003, -0.5817264, -2.852615, 0, 0, 0, 1, 1,
-0.4782825, -0.0347351, -1.811361, 0, 0, 0, 1, 1,
-0.4731429, 0.5997349, 1.356909, 0, 0, 0, 1, 1,
-0.4729353, 1.542858, -0.003802994, 0, 0, 0, 1, 1,
-0.4704278, -0.5267202, -2.481989, 1, 1, 1, 1, 1,
-0.4675297, 0.02004544, -0.9432952, 1, 1, 1, 1, 1,
-0.4667847, 0.7284345, -1.105976, 1, 1, 1, 1, 1,
-0.4654634, -0.5556974, -4.529851, 1, 1, 1, 1, 1,
-0.4646614, 0.4124855, -1.10267, 1, 1, 1, 1, 1,
-0.460798, 0.4117576, -2.070797, 1, 1, 1, 1, 1,
-0.4560344, -0.9000283, -3.276999, 1, 1, 1, 1, 1,
-0.455526, 0.1129747, -1.786759, 1, 1, 1, 1, 1,
-0.4553951, -2.193559, -2.177458, 1, 1, 1, 1, 1,
-0.4551656, -0.02724282, -3.118279, 1, 1, 1, 1, 1,
-0.4544836, -0.6863591, -2.185546, 1, 1, 1, 1, 1,
-0.4471149, 0.08480709, -0.4623092, 1, 1, 1, 1, 1,
-0.442998, -0.205711, -2.128251, 1, 1, 1, 1, 1,
-0.4377534, -0.4066108, -3.240006, 1, 1, 1, 1, 1,
-0.433999, 0.1636577, -0.8329408, 1, 1, 1, 1, 1,
-0.4246469, -0.1361309, -0.8769956, 0, 0, 1, 1, 1,
-0.4236739, 0.6008025, -1.85192, 1, 0, 0, 1, 1,
-0.4229265, -1.087246, -2.659029, 1, 0, 0, 1, 1,
-0.4207457, -0.9841104, -0.300577, 1, 0, 0, 1, 1,
-0.4176688, 0.08039442, -1.51089, 1, 0, 0, 1, 1,
-0.4150742, 0.8481984, -1.359266, 1, 0, 0, 1, 1,
-0.4135776, 0.7790395, 0.5248405, 0, 0, 0, 1, 1,
-0.4067924, 0.8632549, -0.1171707, 0, 0, 0, 1, 1,
-0.4052403, 0.4688056, -0.3174017, 0, 0, 0, 1, 1,
-0.4007304, -0.4592336, -2.718135, 0, 0, 0, 1, 1,
-0.3932947, -0.9608952, -3.30913, 0, 0, 0, 1, 1,
-0.3926238, -1.462987, -1.57124, 0, 0, 0, 1, 1,
-0.3919442, -1.186964, -1.581746, 0, 0, 0, 1, 1,
-0.3899556, -0.825424, -3.316785, 1, 1, 1, 1, 1,
-0.3871674, 1.594858, -0.3057044, 1, 1, 1, 1, 1,
-0.3863499, 0.4439885, -1.770272, 1, 1, 1, 1, 1,
-0.3836983, 0.5121113, 1.18725, 1, 1, 1, 1, 1,
-0.3829184, -0.3812341, -1.384101, 1, 1, 1, 1, 1,
-0.38025, -0.8036937, -1.216093, 1, 1, 1, 1, 1,
-0.3802063, -2.102847, -3.229049, 1, 1, 1, 1, 1,
-0.3782102, 0.4204728, -1.091743, 1, 1, 1, 1, 1,
-0.3775633, -0.558228, -4.906905, 1, 1, 1, 1, 1,
-0.3767478, -0.5614244, -3.303221, 1, 1, 1, 1, 1,
-0.3755066, 0.1112415, -1.477671, 1, 1, 1, 1, 1,
-0.3744631, 0.2445572, -1.37659, 1, 1, 1, 1, 1,
-0.3707233, -0.7682797, -3.016584, 1, 1, 1, 1, 1,
-0.3706999, -0.3391107, -0.4498124, 1, 1, 1, 1, 1,
-0.3704836, -0.6809456, -2.116737, 1, 1, 1, 1, 1,
-0.3699241, -0.3581351, -2.444843, 0, 0, 1, 1, 1,
-0.3697899, -0.3807343, -2.476632, 1, 0, 0, 1, 1,
-0.3663493, -0.8677761, -3.776215, 1, 0, 0, 1, 1,
-0.3662775, -0.2958397, -2.872088, 1, 0, 0, 1, 1,
-0.36482, -0.07762573, -1.587985, 1, 0, 0, 1, 1,
-0.3598814, 1.419325, -1.12676, 1, 0, 0, 1, 1,
-0.353861, -2.792122, -3.766657, 0, 0, 0, 1, 1,
-0.3531905, 1.532959, -0.170172, 0, 0, 0, 1, 1,
-0.3518244, 0.5440877, 0.6561674, 0, 0, 0, 1, 1,
-0.3456303, -0.5712221, -1.536286, 0, 0, 0, 1, 1,
-0.3448528, 1.779841, -1.436179, 0, 0, 0, 1, 1,
-0.3342011, -0.6237435, -4.467597, 0, 0, 0, 1, 1,
-0.3312199, 0.5342422, 1.197966, 0, 0, 0, 1, 1,
-0.3303415, 1.238946, -2.164918, 1, 1, 1, 1, 1,
-0.3288618, 0.2790329, -0.501042, 1, 1, 1, 1, 1,
-0.3287446, 0.3534614, -0.536114, 1, 1, 1, 1, 1,
-0.3283959, -0.04039169, -1.441592, 1, 1, 1, 1, 1,
-0.3263729, 0.3002523, -0.1487187, 1, 1, 1, 1, 1,
-0.3250585, 0.2563598, -1.078703, 1, 1, 1, 1, 1,
-0.3248655, 1.036914, 0.1607801, 1, 1, 1, 1, 1,
-0.3186753, -0.4892502, -4.695461, 1, 1, 1, 1, 1,
-0.318067, 1.273997, 0.1799774, 1, 1, 1, 1, 1,
-0.3127264, 0.06933404, -0.08767612, 1, 1, 1, 1, 1,
-0.3122601, 2.471069, 0.4254233, 1, 1, 1, 1, 1,
-0.3111531, -0.3816078, -1.997072, 1, 1, 1, 1, 1,
-0.3105705, 2.195636, 1.121686, 1, 1, 1, 1, 1,
-0.3103356, -0.5794898, 0.1144433, 1, 1, 1, 1, 1,
-0.3094124, 0.5528244, -1.325033, 1, 1, 1, 1, 1,
-0.3080599, -0.3321478, -1.753214, 0, 0, 1, 1, 1,
-0.3071785, -1.350983, -1.813527, 1, 0, 0, 1, 1,
-0.3060576, -1.270774, -3.002675, 1, 0, 0, 1, 1,
-0.3038176, -2.065645, -4.001842, 1, 0, 0, 1, 1,
-0.3011687, 0.2095595, -0.5995215, 1, 0, 0, 1, 1,
-0.3004962, 0.9909545, 0.05838634, 1, 0, 0, 1, 1,
-0.2985953, -1.320342, -3.096404, 0, 0, 0, 1, 1,
-0.2952108, 0.7368168, -0.1505333, 0, 0, 0, 1, 1,
-0.2941381, -0.2104749, -1.5821, 0, 0, 0, 1, 1,
-0.2867413, 1.516849, -0.332314, 0, 0, 0, 1, 1,
-0.284899, -0.6545292, -2.797206, 0, 0, 0, 1, 1,
-0.2715677, 1.753194, -0.6011102, 0, 0, 0, 1, 1,
-0.2640803, -0.3019743, -1.734755, 0, 0, 0, 1, 1,
-0.2605117, 0.482579, -2.37067, 1, 1, 1, 1, 1,
-0.2596734, 0.7773834, -0.419533, 1, 1, 1, 1, 1,
-0.2588155, 0.4787301, 1.89529, 1, 1, 1, 1, 1,
-0.2584504, 0.6111687, -0.5898221, 1, 1, 1, 1, 1,
-0.256363, -0.4687037, -2.630037, 1, 1, 1, 1, 1,
-0.253317, -0.9787656, -4.366824, 1, 1, 1, 1, 1,
-0.2491485, -1.164768, -1.961293, 1, 1, 1, 1, 1,
-0.2483098, -1.654779, -5.082995, 1, 1, 1, 1, 1,
-0.2475075, -0.79523, -3.631459, 1, 1, 1, 1, 1,
-0.2452804, -0.03052719, -2.986804, 1, 1, 1, 1, 1,
-0.2395237, -0.9771402, -4.667366, 1, 1, 1, 1, 1,
-0.2369308, 0.05072471, -1.557654, 1, 1, 1, 1, 1,
-0.2289455, -3.43415, -2.892687, 1, 1, 1, 1, 1,
-0.2280126, 0.7934822, -0.6492653, 1, 1, 1, 1, 1,
-0.2245534, -1.456707, -2.934681, 1, 1, 1, 1, 1,
-0.2221916, 0.5230691, -0.1844579, 0, 0, 1, 1, 1,
-0.2204869, 0.07285883, -1.168928, 1, 0, 0, 1, 1,
-0.2167293, 0.8487043, 0.1779174, 1, 0, 0, 1, 1,
-0.2164847, -0.4836929, -3.26703, 1, 0, 0, 1, 1,
-0.2115503, -1.864287, -4.359608, 1, 0, 0, 1, 1,
-0.2024834, -1.741547, -1.605616, 1, 0, 0, 1, 1,
-0.2010139, 0.4846154, -2.369952, 0, 0, 0, 1, 1,
-0.1991655, 0.3368935, -0.3164626, 0, 0, 0, 1, 1,
-0.1950409, -0.1366134, -1.6628, 0, 0, 0, 1, 1,
-0.1939837, -1.671726, -2.557857, 0, 0, 0, 1, 1,
-0.1875734, -0.1853428, -0.8378137, 0, 0, 0, 1, 1,
-0.1850692, 1.188736, 1.365873, 0, 0, 0, 1, 1,
-0.1842381, 1.727169, 1.925921, 0, 0, 0, 1, 1,
-0.1840284, 1.049378, -1.124482, 1, 1, 1, 1, 1,
-0.1820434, -0.2861397, -1.700286, 1, 1, 1, 1, 1,
-0.1786672, -1.663297, -2.941983, 1, 1, 1, 1, 1,
-0.1760837, 1.217732, 1.932472, 1, 1, 1, 1, 1,
-0.1755196, -0.9438993, -2.154201, 1, 1, 1, 1, 1,
-0.1739078, -0.2915186, -5.291305, 1, 1, 1, 1, 1,
-0.1706708, 0.3083359, 0.4234311, 1, 1, 1, 1, 1,
-0.1677019, 0.03632556, 0.5784134, 1, 1, 1, 1, 1,
-0.1625261, -0.6817697, -2.89397, 1, 1, 1, 1, 1,
-0.1582699, 0.3220515, -0.9703474, 1, 1, 1, 1, 1,
-0.1510433, -0.9588201, -1.816131, 1, 1, 1, 1, 1,
-0.1491822, 0.6836303, -0.8305505, 1, 1, 1, 1, 1,
-0.1474448, 0.4063576, -2.280416, 1, 1, 1, 1, 1,
-0.1449573, -0.9464411, -2.291559, 1, 1, 1, 1, 1,
-0.1447155, -1.095421, -3.110432, 1, 1, 1, 1, 1,
-0.1405055, -0.049268, -1.665093, 0, 0, 1, 1, 1,
-0.1365182, 0.06282551, -1.706869, 1, 0, 0, 1, 1,
-0.136191, -0.1759911, -3.381311, 1, 0, 0, 1, 1,
-0.1359821, -0.04284035, -0.8078254, 1, 0, 0, 1, 1,
-0.1314677, -0.4300264, -3.489165, 1, 0, 0, 1, 1,
-0.1313895, 1.568282, 0.2480791, 1, 0, 0, 1, 1,
-0.1276625, -1.163678, -3.592528, 0, 0, 0, 1, 1,
-0.127634, -0.1516344, -1.732888, 0, 0, 0, 1, 1,
-0.1275662, -1.922922, -4.963686, 0, 0, 0, 1, 1,
-0.1242808, -0.03341801, -2.903797, 0, 0, 0, 1, 1,
-0.1242599, 0.08301613, -1.752146, 0, 0, 0, 1, 1,
-0.1232087, 1.089241, 0.8961856, 0, 0, 0, 1, 1,
-0.1202455, -0.4451164, -3.216996, 0, 0, 0, 1, 1,
-0.1137234, -0.7666843, -1.840307, 1, 1, 1, 1, 1,
-0.1099294, -0.5559842, -2.355791, 1, 1, 1, 1, 1,
-0.1078284, -0.2970723, -3.178329, 1, 1, 1, 1, 1,
-0.1061712, 0.5055984, -0.4732626, 1, 1, 1, 1, 1,
-0.103946, 0.784838, 0.1608469, 1, 1, 1, 1, 1,
-0.1030343, -0.2104745, -2.59213, 1, 1, 1, 1, 1,
-0.09882749, -1.560505, -4.588879, 1, 1, 1, 1, 1,
-0.09022853, -0.7234133, -1.424205, 1, 1, 1, 1, 1,
-0.08713017, 1.080003, -1.159311, 1, 1, 1, 1, 1,
-0.08054567, 0.05024381, -0.2459055, 1, 1, 1, 1, 1,
-0.0754772, -1.449154, -4.037556, 1, 1, 1, 1, 1,
-0.07516449, 1.169784, 0.3127963, 1, 1, 1, 1, 1,
-0.07377407, -1.228918, -2.873673, 1, 1, 1, 1, 1,
-0.07298943, -0.9353617, -4.988074, 1, 1, 1, 1, 1,
-0.06845318, 1.158596, 0.4982964, 1, 1, 1, 1, 1,
-0.06772308, 1.553028, 0.8916141, 0, 0, 1, 1, 1,
-0.06728853, -0.2578954, -3.654529, 1, 0, 0, 1, 1,
-0.06545494, 0.2481912, 1.758362, 1, 0, 0, 1, 1,
-0.05845957, -0.5602847, -1.779926, 1, 0, 0, 1, 1,
-0.05793495, 1.263351, 0.3784857, 1, 0, 0, 1, 1,
-0.05764915, 0.1498969, 0.04852911, 1, 0, 0, 1, 1,
-0.05331992, 0.3718492, 0.4836631, 0, 0, 0, 1, 1,
-0.05084409, -0.8672305, -3.055214, 0, 0, 0, 1, 1,
-0.04537007, 0.742419, -0.8472368, 0, 0, 0, 1, 1,
-0.0412879, 0.2224267, -2.093846, 0, 0, 0, 1, 1,
-0.04040417, -0.7499571, -2.836345, 0, 0, 0, 1, 1,
-0.03898712, -2.189334, -2.115703, 0, 0, 0, 1, 1,
-0.0386904, -0.760408, -3.553974, 0, 0, 0, 1, 1,
-0.03824976, 0.7880138, -0.5094976, 1, 1, 1, 1, 1,
-0.02388481, 3.963818, 0.01096959, 1, 1, 1, 1, 1,
-0.02337227, -1.112001, -3.077418, 1, 1, 1, 1, 1,
-0.02073772, 0.9550384, 0.8639191, 1, 1, 1, 1, 1,
-0.01966808, -0.5675076, -3.03463, 1, 1, 1, 1, 1,
-0.01840224, -1.570081, -2.737476, 1, 1, 1, 1, 1,
-0.01528243, -0.5081646, -1.925562, 1, 1, 1, 1, 1,
-0.01265869, -0.2614125, -2.361042, 1, 1, 1, 1, 1,
-0.0109489, 0.01412023, 0.2156479, 1, 1, 1, 1, 1,
-0.0100984, -1.65938, -2.49962, 1, 1, 1, 1, 1,
-0.008762075, -0.3769972, -2.054983, 1, 1, 1, 1, 1,
-0.004870092, 0.3692404, 0.2856446, 1, 1, 1, 1, 1,
-0.004134113, -0.650003, -3.610835, 1, 1, 1, 1, 1,
-0.0004627421, 1.697947, -0.1619091, 1, 1, 1, 1, 1,
0.006013541, 1.74448, -0.05439695, 1, 1, 1, 1, 1,
0.00655504, -1.601445, 3.957453, 0, 0, 1, 1, 1,
0.01082494, 0.4448779, -0.7933916, 1, 0, 0, 1, 1,
0.01132615, -0.3264615, 2.819717, 1, 0, 0, 1, 1,
0.01322259, 0.109212, -0.7542575, 1, 0, 0, 1, 1,
0.01450335, 0.6565903, 1.01339, 1, 0, 0, 1, 1,
0.01538732, -0.6835024, 3.533119, 1, 0, 0, 1, 1,
0.01869519, -0.3569511, 4.116468, 0, 0, 0, 1, 1,
0.0261467, -0.7000934, 2.641258, 0, 0, 0, 1, 1,
0.02969099, 0.8523272, 1.393416, 0, 0, 0, 1, 1,
0.03041421, -0.5831397, 4.542858, 0, 0, 0, 1, 1,
0.03075736, -1.372701, 4.340195, 0, 0, 0, 1, 1,
0.03170162, -0.1138772, 2.948345, 0, 0, 0, 1, 1,
0.03364496, -1.119781, 2.266275, 0, 0, 0, 1, 1,
0.03649139, -2.028122, 3.211348, 1, 1, 1, 1, 1,
0.03724631, 0.729023, 1.482234, 1, 1, 1, 1, 1,
0.03743378, -1.25937, 3.48846, 1, 1, 1, 1, 1,
0.03857654, 0.5766383, -0.9466634, 1, 1, 1, 1, 1,
0.03897777, -0.05464891, 2.666823, 1, 1, 1, 1, 1,
0.03926166, 0.136496, 0.9998108, 1, 1, 1, 1, 1,
0.04048466, -0.3219383, 2.025523, 1, 1, 1, 1, 1,
0.04153308, 0.2365557, 0.9598113, 1, 1, 1, 1, 1,
0.04472843, -0.07510079, 2.769186, 1, 1, 1, 1, 1,
0.04595111, 0.8316746, -0.7229544, 1, 1, 1, 1, 1,
0.0471676, -0.1627122, 2.490893, 1, 1, 1, 1, 1,
0.04900381, -1.096966, 2.94884, 1, 1, 1, 1, 1,
0.04927399, 0.2220628, 1.31216, 1, 1, 1, 1, 1,
0.04973003, -0.3803376, 2.687927, 1, 1, 1, 1, 1,
0.05175235, -0.525301, 3.849952, 1, 1, 1, 1, 1,
0.05197525, -0.02120004, 1.854171, 0, 0, 1, 1, 1,
0.05596285, -1.083029, 3.202207, 1, 0, 0, 1, 1,
0.05835262, 0.3062263, -0.08728296, 1, 0, 0, 1, 1,
0.0593091, -0.02569901, 1.296827, 1, 0, 0, 1, 1,
0.05953398, 2.559534, 0.8581826, 1, 0, 0, 1, 1,
0.06335918, -0.3109591, 3.678718, 1, 0, 0, 1, 1,
0.06619637, -0.007700262, 1.461702, 0, 0, 0, 1, 1,
0.06814443, -0.8068377, 2.849059, 0, 0, 0, 1, 1,
0.07205951, 1.504545, 0.65319, 0, 0, 0, 1, 1,
0.07428522, -0.646581, 4.614237, 0, 0, 0, 1, 1,
0.07607494, -0.4385252, 3.95461, 0, 0, 0, 1, 1,
0.07795084, 0.2993137, 0.06057893, 0, 0, 0, 1, 1,
0.07800771, -1.936637, 1.801612, 0, 0, 0, 1, 1,
0.0797946, 0.3414856, -0.2926276, 1, 1, 1, 1, 1,
0.08006508, 0.09659061, -0.1816964, 1, 1, 1, 1, 1,
0.08428818, -2.178118, 3.751885, 1, 1, 1, 1, 1,
0.08768527, -0.5042965, 1.743057, 1, 1, 1, 1, 1,
0.09205312, -0.2119205, 5.554919, 1, 1, 1, 1, 1,
0.09288657, -0.3217832, 2.912886, 1, 1, 1, 1, 1,
0.105213, 0.23449, -0.6916574, 1, 1, 1, 1, 1,
0.1060861, -0.7957316, 2.482714, 1, 1, 1, 1, 1,
0.1104763, 0.7945816, -1.862579, 1, 1, 1, 1, 1,
0.1107132, -1.638959, 4.344154, 1, 1, 1, 1, 1,
0.1138083, -0.1201507, 3.522933, 1, 1, 1, 1, 1,
0.1224046, 0.008010267, 2.525057, 1, 1, 1, 1, 1,
0.1243389, 1.869045, -1.442904, 1, 1, 1, 1, 1,
0.1251629, 0.4026993, 1.030616, 1, 1, 1, 1, 1,
0.128298, 0.5409988, 0.5107996, 1, 1, 1, 1, 1,
0.1307794, 1.57317, -0.704692, 0, 0, 1, 1, 1,
0.1309279, -0.4836323, 3.744377, 1, 0, 0, 1, 1,
0.1319097, 0.4171073, -0.5015848, 1, 0, 0, 1, 1,
0.1422822, 1.990207, -0.3684024, 1, 0, 0, 1, 1,
0.1437064, -0.5496429, 3.086226, 1, 0, 0, 1, 1,
0.1551565, 0.8569797, -0.4318808, 1, 0, 0, 1, 1,
0.1567546, 1.164148, -1.865049, 0, 0, 0, 1, 1,
0.1646053, 0.6327822, -0.3644176, 0, 0, 0, 1, 1,
0.1664099, 0.4910646, 1.876613, 0, 0, 0, 1, 1,
0.1728364, 1.514877, -0.2208014, 0, 0, 0, 1, 1,
0.1740988, -0.1150445, 2.697251, 0, 0, 0, 1, 1,
0.1756388, -1.312247, 2.34442, 0, 0, 0, 1, 1,
0.1797987, -0.2088474, 2.201804, 0, 0, 0, 1, 1,
0.18153, 0.4147462, 0.547151, 1, 1, 1, 1, 1,
0.182108, -0.9290586, 1.473167, 1, 1, 1, 1, 1,
0.183774, -2.695381, 2.431593, 1, 1, 1, 1, 1,
0.1843164, 0.6633309, 0.06467725, 1, 1, 1, 1, 1,
0.1845407, 1.287493, -1.322262, 1, 1, 1, 1, 1,
0.186483, -1.807004, 2.689851, 1, 1, 1, 1, 1,
0.1933685, 0.07664847, 0.4894316, 1, 1, 1, 1, 1,
0.1936974, 0.107886, 1.014685, 1, 1, 1, 1, 1,
0.1984955, -0.2778834, 1.391042, 1, 1, 1, 1, 1,
0.1997698, -1.492197, 1.622431, 1, 1, 1, 1, 1,
0.1999796, 0.4401145, 1.12606, 1, 1, 1, 1, 1,
0.2004543, 0.3980746, -0.29336, 1, 1, 1, 1, 1,
0.2013804, 0.421109, 1.336768, 1, 1, 1, 1, 1,
0.2024916, 0.235298, -0.5188277, 1, 1, 1, 1, 1,
0.2072572, -0.2643231, 3.980776, 1, 1, 1, 1, 1,
0.2114697, -1.491707, 2.798444, 0, 0, 1, 1, 1,
0.2116467, -1.220201, 2.556853, 1, 0, 0, 1, 1,
0.2156406, -0.499618, 1.584197, 1, 0, 0, 1, 1,
0.21661, 0.1982854, 2.515589, 1, 0, 0, 1, 1,
0.2205691, 1.153556, 1.118005, 1, 0, 0, 1, 1,
0.2265081, -1.772805, 3.991364, 1, 0, 0, 1, 1,
0.2288923, 0.1039672, 2.826211, 0, 0, 0, 1, 1,
0.2301526, -1.912439, 3.846786, 0, 0, 0, 1, 1,
0.2312758, -0.2697164, 3.262094, 0, 0, 0, 1, 1,
0.2383045, 1.522002, -0.7913727, 0, 0, 0, 1, 1,
0.2406718, 1.123866, 1.90349, 0, 0, 0, 1, 1,
0.2435799, -0.009848677, 2.626359, 0, 0, 0, 1, 1,
0.2447537, 0.09965186, 1.090558, 0, 0, 0, 1, 1,
0.2500192, 1.079832, 0.3165378, 1, 1, 1, 1, 1,
0.2510362, 0.7088193, 1.911241, 1, 1, 1, 1, 1,
0.253116, 1.887156, 0.5234768, 1, 1, 1, 1, 1,
0.255652, 0.6015435, 2.119004, 1, 1, 1, 1, 1,
0.2576388, 1.260342, -0.4110612, 1, 1, 1, 1, 1,
0.2625122, 0.6083811, 0.4360619, 1, 1, 1, 1, 1,
0.2629665, -0.9580538, 3.852191, 1, 1, 1, 1, 1,
0.2662038, -0.4499778, 3.742174, 1, 1, 1, 1, 1,
0.267646, -1.568215, 2.922776, 1, 1, 1, 1, 1,
0.2729411, 1.654469, 1.26342, 1, 1, 1, 1, 1,
0.2795698, 0.2372868, 0.05845735, 1, 1, 1, 1, 1,
0.2804317, 1.093259, 0.3835038, 1, 1, 1, 1, 1,
0.2810941, 0.5121605, 1.412948, 1, 1, 1, 1, 1,
0.2871305, 0.5847496, -0.1619706, 1, 1, 1, 1, 1,
0.2875428, -0.5733613, 3.833522, 1, 1, 1, 1, 1,
0.2915274, 1.397635, 0.01987304, 0, 0, 1, 1, 1,
0.2924095, 0.7596748, 0.803645, 1, 0, 0, 1, 1,
0.295013, 0.8455197, 0.07443315, 1, 0, 0, 1, 1,
0.2951074, 0.855289, 0.8904673, 1, 0, 0, 1, 1,
0.296381, -1.671318, 4.482507, 1, 0, 0, 1, 1,
0.2991309, -0.04003526, 1.393923, 1, 0, 0, 1, 1,
0.2999722, 0.8191484, -0.08004569, 0, 0, 0, 1, 1,
0.3037238, 0.5374848, 0.7907916, 0, 0, 0, 1, 1,
0.3043552, -1.863165, 3.654893, 0, 0, 0, 1, 1,
0.3075976, 0.3367092, -0.9880004, 0, 0, 0, 1, 1,
0.3086658, 0.2187131, 1.403497, 0, 0, 0, 1, 1,
0.3113015, 0.9055749, -1.571222, 0, 0, 0, 1, 1,
0.3116261, -0.624748, 2.755509, 0, 0, 0, 1, 1,
0.313291, 1.442524, 1.093926, 1, 1, 1, 1, 1,
0.3151349, -0.6730756, 4.028911, 1, 1, 1, 1, 1,
0.3166736, 0.1213915, 1.785089, 1, 1, 1, 1, 1,
0.3174995, 1.169213, -1.591458, 1, 1, 1, 1, 1,
0.3189338, -2.104658, 2.620605, 1, 1, 1, 1, 1,
0.3217312, -0.2147186, 2.724037, 1, 1, 1, 1, 1,
0.3219492, -0.6263128, 0.8019515, 1, 1, 1, 1, 1,
0.3223445, -0.3408572, 1.817314, 1, 1, 1, 1, 1,
0.3244143, -2.176934, 2.907368, 1, 1, 1, 1, 1,
0.3270194, 1.430784, 0.2085165, 1, 1, 1, 1, 1,
0.3334206, 1.557307, 0.2004531, 1, 1, 1, 1, 1,
0.337968, -0.7010778, 3.130593, 1, 1, 1, 1, 1,
0.339819, 1.105713, 1.328424, 1, 1, 1, 1, 1,
0.3411188, -3.365166, 3.403278, 1, 1, 1, 1, 1,
0.3423705, 0.6623532, 2.306962, 1, 1, 1, 1, 1,
0.3470099, -2.132739, 5.33276, 0, 0, 1, 1, 1,
0.3490094, -0.9273283, 2.520748, 1, 0, 0, 1, 1,
0.3496722, -0.7125959, 3.574507, 1, 0, 0, 1, 1,
0.3529361, 0.08330281, -0.6659831, 1, 0, 0, 1, 1,
0.3531121, 1.423006, 2.005358, 1, 0, 0, 1, 1,
0.353831, -1.580346, 2.71938, 1, 0, 0, 1, 1,
0.3588553, 0.6435416, 0.8574309, 0, 0, 0, 1, 1,
0.3611019, -0.4242817, 2.920697, 0, 0, 0, 1, 1,
0.3617232, 0.4634552, 0.2711986, 0, 0, 0, 1, 1,
0.3629922, -1.273559, 2.60814, 0, 0, 0, 1, 1,
0.3642271, 1.699617, 0.9462291, 0, 0, 0, 1, 1,
0.3654119, -1.447894, 3.335871, 0, 0, 0, 1, 1,
0.3662724, 0.3691337, 2.182529, 0, 0, 0, 1, 1,
0.3696187, -1.296746, 3.257579, 1, 1, 1, 1, 1,
0.3704929, -0.8699259, 4.265491, 1, 1, 1, 1, 1,
0.3752479, -1.734155, 2.68379, 1, 1, 1, 1, 1,
0.3767258, -1.886533, 2.638744, 1, 1, 1, 1, 1,
0.377118, -1.949667, 3.774789, 1, 1, 1, 1, 1,
0.3836225, 0.2905584, 2.221011, 1, 1, 1, 1, 1,
0.385049, 1.297819, -0.3297402, 1, 1, 1, 1, 1,
0.3878898, 1.186913, 1.096123, 1, 1, 1, 1, 1,
0.3966044, 0.6716728, 1.868984, 1, 1, 1, 1, 1,
0.396714, 0.7659872, 0.9919678, 1, 1, 1, 1, 1,
0.397498, 0.6572132, 1.040782, 1, 1, 1, 1, 1,
0.3990897, -0.06353772, 2.460687, 1, 1, 1, 1, 1,
0.4009325, 1.665746, 0.03542569, 1, 1, 1, 1, 1,
0.4026748, 1.078249, 0.6498553, 1, 1, 1, 1, 1,
0.4049419, 1.004883, 1.335045, 1, 1, 1, 1, 1,
0.4054026, -2.540413, 4.525596, 0, 0, 1, 1, 1,
0.4066071, -0.7825304, 1.51881, 1, 0, 0, 1, 1,
0.4070436, -0.7567242, 4.246895, 1, 0, 0, 1, 1,
0.4073277, 0.5361218, -0.4182899, 1, 0, 0, 1, 1,
0.4110316, -0.002519594, 2.526038, 1, 0, 0, 1, 1,
0.4116995, -1.481712, 2.799735, 1, 0, 0, 1, 1,
0.4136266, 0.7313698, 0.07232882, 0, 0, 0, 1, 1,
0.4259956, 0.6961014, 0.7889349, 0, 0, 0, 1, 1,
0.4285295, 0.2507956, 0.923355, 0, 0, 0, 1, 1,
0.4363258, 0.3176503, 2.61182, 0, 0, 0, 1, 1,
0.4364384, 1.369787, -0.2846981, 0, 0, 0, 1, 1,
0.4377235, -1.087348, 4.267051, 0, 0, 0, 1, 1,
0.4382457, -0.06756578, 2.247053, 0, 0, 0, 1, 1,
0.4436551, 0.6675163, 0.239859, 1, 1, 1, 1, 1,
0.4494636, 0.7049338, 1.739606, 1, 1, 1, 1, 1,
0.4495283, 0.3030526, 0.3037816, 1, 1, 1, 1, 1,
0.4501516, -0.3078489, 2.318528, 1, 1, 1, 1, 1,
0.4558102, -0.3599401, 1.576102, 1, 1, 1, 1, 1,
0.4580508, -1.038497, 3.879426, 1, 1, 1, 1, 1,
0.4593602, 0.2045913, 1.969389, 1, 1, 1, 1, 1,
0.4599185, -1.20288, 1.851333, 1, 1, 1, 1, 1,
0.4620959, 0.1379032, 1.732334, 1, 1, 1, 1, 1,
0.4675085, -1.754451, 3.597862, 1, 1, 1, 1, 1,
0.467693, 1.067792, 1.49042, 1, 1, 1, 1, 1,
0.4679184, 1.091977, 0.3173093, 1, 1, 1, 1, 1,
0.4695541, 2.714007, -0.2836532, 1, 1, 1, 1, 1,
0.4717461, 0.5514298, 1.562747, 1, 1, 1, 1, 1,
0.4737248, -0.9879746, 2.489173, 1, 1, 1, 1, 1,
0.4765869, 0.6343322, 0.1031282, 0, 0, 1, 1, 1,
0.4769295, -0.700679, 2.293538, 1, 0, 0, 1, 1,
0.4791553, 1.260756, -2.747877, 1, 0, 0, 1, 1,
0.4802276, 0.1873134, 0.8234248, 1, 0, 0, 1, 1,
0.481096, 0.1371877, 0.7761424, 1, 0, 0, 1, 1,
0.4823599, 0.05494654, 0.9628287, 1, 0, 0, 1, 1,
0.4900551, 1.753437, 0.4791855, 0, 0, 0, 1, 1,
0.4921775, -0.3299114, 2.864944, 0, 0, 0, 1, 1,
0.5072692, -1.199065, 4.331032, 0, 0, 0, 1, 1,
0.5092782, 0.3344386, 1.400588, 0, 0, 0, 1, 1,
0.509851, -2.13905, 2.924449, 0, 0, 0, 1, 1,
0.5163423, 1.256414, 1.80898, 0, 0, 0, 1, 1,
0.5165675, -0.9219251, 2.796086, 0, 0, 0, 1, 1,
0.5171759, 1.806604, -0.1320045, 1, 1, 1, 1, 1,
0.5182609, 0.819203, -0.7166767, 1, 1, 1, 1, 1,
0.5222665, -0.01247603, 0.4040863, 1, 1, 1, 1, 1,
0.5244213, 0.5545042, 0.7558699, 1, 1, 1, 1, 1,
0.5318159, -0.2957748, 2.064518, 1, 1, 1, 1, 1,
0.533918, -1.200083, 0.9216589, 1, 1, 1, 1, 1,
0.5343149, 0.2978181, 1.551707, 1, 1, 1, 1, 1,
0.5394338, 0.3768844, 2.09034, 1, 1, 1, 1, 1,
0.5415589, -0.05515286, 2.584473, 1, 1, 1, 1, 1,
0.5461608, 0.01985493, 0.5468957, 1, 1, 1, 1, 1,
0.5545244, 1.409211, 1.569616, 1, 1, 1, 1, 1,
0.5550365, 0.6619245, -0.5987619, 1, 1, 1, 1, 1,
0.556833, -0.05999354, 3.027849, 1, 1, 1, 1, 1,
0.5604354, 0.4771413, 1.29039, 1, 1, 1, 1, 1,
0.5625812, 1.119259, -1.425362, 1, 1, 1, 1, 1,
0.5635987, -0.318552, 3.589801, 0, 0, 1, 1, 1,
0.5670477, 0.5332617, -0.3528743, 1, 0, 0, 1, 1,
0.5685844, -0.5605897, 2.11885, 1, 0, 0, 1, 1,
0.5737576, 0.4282854, 1.036522, 1, 0, 0, 1, 1,
0.5752049, -0.2546007, 0.9731617, 1, 0, 0, 1, 1,
0.5964146, 0.2531556, 1.129764, 1, 0, 0, 1, 1,
0.5966834, -1.011467, 4.270335, 0, 0, 0, 1, 1,
0.5979018, 0.1221494, 1.876908, 0, 0, 0, 1, 1,
0.5995855, 0.3444344, -0.784705, 0, 0, 0, 1, 1,
0.6004669, 0.1738797, 0.1638863, 0, 0, 0, 1, 1,
0.6044529, 0.6619021, 1.654578, 0, 0, 0, 1, 1,
0.6050496, 0.9083778, 0.5831045, 0, 0, 0, 1, 1,
0.6081197, -1.194787, 2.941382, 0, 0, 0, 1, 1,
0.6093095, 0.1116036, 0.434288, 1, 1, 1, 1, 1,
0.6249438, -0.6413618, 2.115606, 1, 1, 1, 1, 1,
0.6330867, -1.106072, 3.859441, 1, 1, 1, 1, 1,
0.6336917, 0.7813351, 0.4592584, 1, 1, 1, 1, 1,
0.6445987, 0.5613098, -0.2103928, 1, 1, 1, 1, 1,
0.6500745, 2.51948, 0.1080087, 1, 1, 1, 1, 1,
0.6517724, -1.462118, 2.425112, 1, 1, 1, 1, 1,
0.6518731, 0.4334187, 0.1379199, 1, 1, 1, 1, 1,
0.6657265, -0.06529327, 2.175282, 1, 1, 1, 1, 1,
0.6690598, -0.3259088, 2.687558, 1, 1, 1, 1, 1,
0.6719614, 0.756064, 1.09525, 1, 1, 1, 1, 1,
0.6730668, -0.3191852, 1.772232, 1, 1, 1, 1, 1,
0.6731703, -1.524934, 2.324774, 1, 1, 1, 1, 1,
0.6846762, -0.00108405, 1.598377, 1, 1, 1, 1, 1,
0.6848485, -0.1336285, 2.804854, 1, 1, 1, 1, 1,
0.6861167, 1.617683, 1.691338, 0, 0, 1, 1, 1,
0.6890551, 0.9965652, -0.1452113, 1, 0, 0, 1, 1,
0.6915855, -0.9269964, 3.45978, 1, 0, 0, 1, 1,
0.7000887, 0.2572906, 2.64182, 1, 0, 0, 1, 1,
0.7119387, 1.010445, 1.544473, 1, 0, 0, 1, 1,
0.712384, -0.982562, 0.9261198, 1, 0, 0, 1, 1,
0.7146575, -0.06169806, 1.276167, 0, 0, 0, 1, 1,
0.7163333, 0.6304159, -0.889241, 0, 0, 0, 1, 1,
0.7204663, 0.2625387, 1.082525, 0, 0, 0, 1, 1,
0.7217278, 1.655645, -0.6122845, 0, 0, 0, 1, 1,
0.7236689, 0.4031503, -0.5517149, 0, 0, 0, 1, 1,
0.7261186, -0.3751481, 1.934755, 0, 0, 0, 1, 1,
0.7329631, -1.398167, 3.008383, 0, 0, 0, 1, 1,
0.7347993, -2.14394, 0.2288901, 1, 1, 1, 1, 1,
0.7358647, 1.704761, -1.242725, 1, 1, 1, 1, 1,
0.7360668, 1.214777, 1.774798, 1, 1, 1, 1, 1,
0.7393163, -0.977218, 2.081934, 1, 1, 1, 1, 1,
0.7403247, -0.7822107, 1.811719, 1, 1, 1, 1, 1,
0.742376, -0.5619485, 3.110997, 1, 1, 1, 1, 1,
0.746545, -0.01539203, 2.292461, 1, 1, 1, 1, 1,
0.7494903, -1.181801, 2.692396, 1, 1, 1, 1, 1,
0.7614171, 0.8056856, -0.7113451, 1, 1, 1, 1, 1,
0.7614633, 1.027429, 1.849194, 1, 1, 1, 1, 1,
0.7627616, -0.553863, 2.588321, 1, 1, 1, 1, 1,
0.7651629, 0.3348742, -0.9230081, 1, 1, 1, 1, 1,
0.7657437, -0.7430379, 3.623456, 1, 1, 1, 1, 1,
0.7671058, 0.338314, 0.6140962, 1, 1, 1, 1, 1,
0.7692479, 1.071199, 0.7380589, 1, 1, 1, 1, 1,
0.7693059, -1.361725, 3.091617, 0, 0, 1, 1, 1,
0.7708724, -3.621919, 2.767584, 1, 0, 0, 1, 1,
0.7738061, 1.569212, -0.3204025, 1, 0, 0, 1, 1,
0.778299, 0.7422551, 0.4366173, 1, 0, 0, 1, 1,
0.7864622, -0.2630411, 3.237802, 1, 0, 0, 1, 1,
0.7877514, 2.794847, 0.1759144, 1, 0, 0, 1, 1,
0.7901201, -0.06364954, 3.469114, 0, 0, 0, 1, 1,
0.7907066, 0.9229543, 0.2358818, 0, 0, 0, 1, 1,
0.8018755, -0.5043896, 2.214802, 0, 0, 0, 1, 1,
0.8035234, -0.9949009, 2.635801, 0, 0, 0, 1, 1,
0.8043604, 0.06066426, -0.7048412, 0, 0, 0, 1, 1,
0.8090101, -0.1128127, 2.280365, 0, 0, 0, 1, 1,
0.8093545, -0.04099912, 0.5714305, 0, 0, 0, 1, 1,
0.8131596, -0.3968301, 2.191816, 1, 1, 1, 1, 1,
0.8139968, 2.125286, -0.3075463, 1, 1, 1, 1, 1,
0.8172334, -1.98422, 2.927053, 1, 1, 1, 1, 1,
0.8213298, 0.4382452, 1.080619, 1, 1, 1, 1, 1,
0.8214096, -1.269098, 1.851731, 1, 1, 1, 1, 1,
0.8218758, -0.5307356, -0.0398654, 1, 1, 1, 1, 1,
0.8221605, 1.598915, -0.09275485, 1, 1, 1, 1, 1,
0.8480534, -1.703484, 3.203687, 1, 1, 1, 1, 1,
0.8486915, 0.1359293, 1.065671, 1, 1, 1, 1, 1,
0.8641394, -0.8011978, 1.899341, 1, 1, 1, 1, 1,
0.8657569, 0.611365, 1.166259, 1, 1, 1, 1, 1,
0.8779622, -1.17846, 1.903486, 1, 1, 1, 1, 1,
0.8798875, 1.913831, 0.6047183, 1, 1, 1, 1, 1,
0.8813304, -0.5554959, 0.6514228, 1, 1, 1, 1, 1,
0.8888541, 1.013309, 2.357108, 1, 1, 1, 1, 1,
0.89404, 0.6865773, 1.122047, 0, 0, 1, 1, 1,
0.9006414, 1.648056, -0.4927121, 1, 0, 0, 1, 1,
0.905156, -0.2698883, 1.945903, 1, 0, 0, 1, 1,
0.9052226, 0.6242551, 1.708499, 1, 0, 0, 1, 1,
0.9052591, -0.3852517, 1.860734, 1, 0, 0, 1, 1,
0.9054403, -0.06097317, 1.24697, 1, 0, 0, 1, 1,
0.9134525, 0.4449043, 2.423781, 0, 0, 0, 1, 1,
0.9164062, 0.2290073, 1.738185, 0, 0, 0, 1, 1,
0.9175114, 1.077314, 0.7926953, 0, 0, 0, 1, 1,
0.9188012, 0.5565078, 1.113238, 0, 0, 0, 1, 1,
0.927168, -0.02547484, 1.20815, 0, 0, 0, 1, 1,
0.9320711, -0.7521943, 2.328037, 0, 0, 0, 1, 1,
0.9382768, 2.144406, -1.45197, 0, 0, 0, 1, 1,
0.9411405, 2.052035, -0.7673374, 1, 1, 1, 1, 1,
0.9486269, -1.219858, 5.886826, 1, 1, 1, 1, 1,
0.9501427, -0.09845145, 1.907001, 1, 1, 1, 1, 1,
0.9516566, -1.846169, 2.967584, 1, 1, 1, 1, 1,
0.9562824, 0.4256671, 1.037387, 1, 1, 1, 1, 1,
0.9602708, -0.0003088001, 2.014012, 1, 1, 1, 1, 1,
0.9637633, 0.06181848, 1.484991, 1, 1, 1, 1, 1,
0.972512, 1.303647, 2.191809, 1, 1, 1, 1, 1,
0.9776802, 1.158079, 0.2964779, 1, 1, 1, 1, 1,
0.9780384, -0.6336359, 1.594538, 1, 1, 1, 1, 1,
0.9798284, 1.971638, 1.701963, 1, 1, 1, 1, 1,
0.9826908, -0.7192531, 2.086647, 1, 1, 1, 1, 1,
0.9849864, 1.100552, 0.3289781, 1, 1, 1, 1, 1,
0.997627, 0.8399739, 1.69038, 1, 1, 1, 1, 1,
0.9977856, 0.7746774, -0.4640679, 1, 1, 1, 1, 1,
1.000905, -0.6354399, 2.026836, 0, 0, 1, 1, 1,
1.009547, -1.534536, 2.53973, 1, 0, 0, 1, 1,
1.013478, 0.8396774, 1.11531, 1, 0, 0, 1, 1,
1.027374, -0.5587614, 0.6472887, 1, 0, 0, 1, 1,
1.032022, -0.294846, 0.08902008, 1, 0, 0, 1, 1,
1.039302, 1.445564, -0.9210613, 1, 0, 0, 1, 1,
1.043779, -0.07441428, 1.395658, 0, 0, 0, 1, 1,
1.046293, -0.521579, 3.830759, 0, 0, 0, 1, 1,
1.049747, -0.8655252, 1.38406, 0, 0, 0, 1, 1,
1.054621, 0.588674, 2.751891, 0, 0, 0, 1, 1,
1.057286, -1.370321, 1.326129, 0, 0, 0, 1, 1,
1.065586, -2.227597, 2.774338, 0, 0, 0, 1, 1,
1.072891, -0.004340468, 1.345576, 0, 0, 0, 1, 1,
1.073184, 2.789412, 1.097558, 1, 1, 1, 1, 1,
1.079512, 0.03925602, 1.798769, 1, 1, 1, 1, 1,
1.086842, -0.6850382, 0.1562188, 1, 1, 1, 1, 1,
1.095626, -0.2948664, 0.2013277, 1, 1, 1, 1, 1,
1.096273, 0.6583883, 0.5691594, 1, 1, 1, 1, 1,
1.107832, -0.3231839, 0.6873865, 1, 1, 1, 1, 1,
1.111019, 1.828231, 0.9457186, 1, 1, 1, 1, 1,
1.112176, -0.8143553, 1.757701, 1, 1, 1, 1, 1,
1.11238, -0.733556, 2.560743, 1, 1, 1, 1, 1,
1.114975, 1.951349, 0.2307874, 1, 1, 1, 1, 1,
1.124018, 0.3261002, 1.413814, 1, 1, 1, 1, 1,
1.126631, -0.06760625, 4.180575, 1, 1, 1, 1, 1,
1.131194, 0.4965911, -0.6565858, 1, 1, 1, 1, 1,
1.140163, 0.2328078, 2.301249, 1, 1, 1, 1, 1,
1.143661, 0.9603473, 0.5519545, 1, 1, 1, 1, 1,
1.1517, 0.17971, 1.04422, 0, 0, 1, 1, 1,
1.152054, -1.588788, 1.432944, 1, 0, 0, 1, 1,
1.160105, 0.2854499, -0.2465829, 1, 0, 0, 1, 1,
1.161058, 1.693693, -0.8212176, 1, 0, 0, 1, 1,
1.165115, -0.5369068, 3.175732, 1, 0, 0, 1, 1,
1.176411, 0.1727679, -0.06920896, 1, 0, 0, 1, 1,
1.179127, -1.26377, 1.645868, 0, 0, 0, 1, 1,
1.179339, -0.6604946, 1.11526, 0, 0, 0, 1, 1,
1.185961, 2.017349, 0.2992954, 0, 0, 0, 1, 1,
1.193051, 0.3693869, 0.2828944, 0, 0, 0, 1, 1,
1.194916, -0.9688286, 2.124081, 0, 0, 0, 1, 1,
1.196653, -0.7474281, 1.029027, 0, 0, 0, 1, 1,
1.201984, 0.2020049, 0.9480763, 0, 0, 0, 1, 1,
1.207403, -0.4455022, 0.5023441, 1, 1, 1, 1, 1,
1.207436, 0.2012977, 0.5233112, 1, 1, 1, 1, 1,
1.215183, 0.1531771, 1.414173, 1, 1, 1, 1, 1,
1.215811, 0.8437793, 0.9187759, 1, 1, 1, 1, 1,
1.221863, -0.3819735, 2.074644, 1, 1, 1, 1, 1,
1.230344, 0.9030039, 1.179975, 1, 1, 1, 1, 1,
1.233541, -1.097944, 2.482168, 1, 1, 1, 1, 1,
1.237279, 0.2600383, 2.266963, 1, 1, 1, 1, 1,
1.238429, 0.3017269, 0.7313145, 1, 1, 1, 1, 1,
1.24526, 1.190386, 0.7096359, 1, 1, 1, 1, 1,
1.253198, -0.2647143, 1.675755, 1, 1, 1, 1, 1,
1.260488, -2.053739, 3.239933, 1, 1, 1, 1, 1,
1.260665, -0.3590054, 3.100324, 1, 1, 1, 1, 1,
1.261126, -0.4495796, 2.272411, 1, 1, 1, 1, 1,
1.263505, -0.7348974, 2.018551, 1, 1, 1, 1, 1,
1.267232, 0.6864573, 1.118958, 0, 0, 1, 1, 1,
1.270342, -1.235091, 1.599265, 1, 0, 0, 1, 1,
1.275151, -0.7844841, 1.851159, 1, 0, 0, 1, 1,
1.27928, 1.077241, 1.709326, 1, 0, 0, 1, 1,
1.286335, -1.191275, 2.397266, 1, 0, 0, 1, 1,
1.289396, 0.5686774, 1.794162, 1, 0, 0, 1, 1,
1.291203, 0.4339744, 1.400269, 0, 0, 0, 1, 1,
1.29231, 1.268296, 2.331336, 0, 0, 0, 1, 1,
1.31684, 0.8476173, 3.165575, 0, 0, 0, 1, 1,
1.31791, -0.640425, 0.4746518, 0, 0, 0, 1, 1,
1.326866, -0.1346168, 3.542112, 0, 0, 0, 1, 1,
1.3276, 0.1659593, 1.036465, 0, 0, 0, 1, 1,
1.333685, 0.1489625, 2.884956, 0, 0, 0, 1, 1,
1.340675, -0.0380443, 1.856816, 1, 1, 1, 1, 1,
1.347379, -1.709078, 0.9052356, 1, 1, 1, 1, 1,
1.353606, -0.1925424, 2.998056, 1, 1, 1, 1, 1,
1.356462, -0.2497129, 1.972495, 1, 1, 1, 1, 1,
1.362072, -0.2091486, 2.491993, 1, 1, 1, 1, 1,
1.362484, 0.8322697, -0.8500251, 1, 1, 1, 1, 1,
1.363296, -1.044434, 2.830299, 1, 1, 1, 1, 1,
1.386014, -0.6438009, 3.280245, 1, 1, 1, 1, 1,
1.410606, -0.2780098, 1.630129, 1, 1, 1, 1, 1,
1.419444, 0.06942666, 2.00499, 1, 1, 1, 1, 1,
1.426548, -0.07675551, 2.32638, 1, 1, 1, 1, 1,
1.445086, 0.1202946, 0.9298811, 1, 1, 1, 1, 1,
1.448629, -0.4039202, 0.9844539, 1, 1, 1, 1, 1,
1.451262, -0.2593222, 1.507711, 1, 1, 1, 1, 1,
1.46537, -0.7060762, 1.391443, 1, 1, 1, 1, 1,
1.4743, 1.327236, -0.02919748, 0, 0, 1, 1, 1,
1.481193, 0.2903843, 1.542617, 1, 0, 0, 1, 1,
1.487294, -0.2985559, 2.344465, 1, 0, 0, 1, 1,
1.488193, 0.2138535, 2.5475, 1, 0, 0, 1, 1,
1.492073, -1.355786, 1.367577, 1, 0, 0, 1, 1,
1.494062, -0.5250399, 1.877494, 1, 0, 0, 1, 1,
1.500617, -0.4044597, 0.8486087, 0, 0, 0, 1, 1,
1.501309, -0.9341162, 2.170533, 0, 0, 0, 1, 1,
1.539569, -0.356331, 2.284009, 0, 0, 0, 1, 1,
1.542319, -0.1944415, 2.91799, 0, 0, 0, 1, 1,
1.554661, -0.6203796, 1.477258, 0, 0, 0, 1, 1,
1.563554, 0.3935479, 2.725303, 0, 0, 0, 1, 1,
1.566745, 0.4516641, 1.841408, 0, 0, 0, 1, 1,
1.626216, -0.1061106, 3.33919, 1, 1, 1, 1, 1,
1.656853, 0.7958089, -0.1345088, 1, 1, 1, 1, 1,
1.66521, 0.2249983, 2.009342, 1, 1, 1, 1, 1,
1.669174, 1.430692, 1.620332, 1, 1, 1, 1, 1,
1.670398, -0.8558533, 2.194078, 1, 1, 1, 1, 1,
1.673592, 1.010373, 2.79082, 1, 1, 1, 1, 1,
1.674071, -0.07739791, 2.534014, 1, 1, 1, 1, 1,
1.690747, 0.6929715, 0.1127806, 1, 1, 1, 1, 1,
1.693799, -0.09416333, 2.734887, 1, 1, 1, 1, 1,
1.696792, 0.5592252, 2.656032, 1, 1, 1, 1, 1,
1.708931, -0.1781671, 0.2036892, 1, 1, 1, 1, 1,
1.71847, 0.7781793, 0.9497355, 1, 1, 1, 1, 1,
1.729701, -0.4027349, 1.641365, 1, 1, 1, 1, 1,
1.744243, 1.187198, 0.3471976, 1, 1, 1, 1, 1,
1.762296, -2.582309, 3.06862, 1, 1, 1, 1, 1,
1.767205, 0.7366046, 1.847063, 0, 0, 1, 1, 1,
1.767448, 0.005584101, 0.4500848, 1, 0, 0, 1, 1,
1.794001, -0.6157323, 2.623967, 1, 0, 0, 1, 1,
1.796789, 0.645431, 1.151748, 1, 0, 0, 1, 1,
1.797406, 0.6213198, 1.767737, 1, 0, 0, 1, 1,
1.811326, -0.9118364, 1.029968, 1, 0, 0, 1, 1,
1.815382, 1.441339, -0.2612873, 0, 0, 0, 1, 1,
1.824414, 0.8207054, 2.291511, 0, 0, 0, 1, 1,
1.848686, 0.05961138, 3.406675, 0, 0, 0, 1, 1,
1.861891, 0.7867227, 2.331395, 0, 0, 0, 1, 1,
1.86557, -0.440239, 1.796217, 0, 0, 0, 1, 1,
1.890268, 0.5160024, 2.915643, 0, 0, 0, 1, 1,
1.89765, 1.200003, 0.2817873, 0, 0, 0, 1, 1,
1.902382, -0.005062396, 2.025772, 1, 1, 1, 1, 1,
1.907951, 0.967566, -0.05173485, 1, 1, 1, 1, 1,
1.915584, 0.7970315, 2.346592, 1, 1, 1, 1, 1,
1.917041, -1.903852, 2.232495, 1, 1, 1, 1, 1,
1.918276, 0.2198021, 2.341808, 1, 1, 1, 1, 1,
1.925404, 0.8160791, 0.7482895, 1, 1, 1, 1, 1,
1.9351, 1.491781, 1.645858, 1, 1, 1, 1, 1,
1.952394, -0.4436156, 1.680015, 1, 1, 1, 1, 1,
1.95597, -1.979951, 1.143364, 1, 1, 1, 1, 1,
1.970421, -0.5674952, 0.1782371, 1, 1, 1, 1, 1,
1.972419, -0.7459932, 2.651386, 1, 1, 1, 1, 1,
1.975081, 0.1555695, 1.017964, 1, 1, 1, 1, 1,
1.988747, 1.03471, 1.936133, 1, 1, 1, 1, 1,
1.989158, -0.001054684, 1.646113, 1, 1, 1, 1, 1,
1.990465, -1.067149, 2.259406, 1, 1, 1, 1, 1,
1.990654, 0.5466794, 0.578181, 0, 0, 1, 1, 1,
2.000841, 1.201047, 1.27643, 1, 0, 0, 1, 1,
2.021449, 0.4471703, 1.588181, 1, 0, 0, 1, 1,
2.026522, -0.01817239, 2.045068, 1, 0, 0, 1, 1,
2.05634, 0.3516833, 3.160792, 1, 0, 0, 1, 1,
2.059037, 0.03612577, 0.7322373, 1, 0, 0, 1, 1,
2.095721, 0.9537211, 2.285564, 0, 0, 0, 1, 1,
2.133165, 0.1769689, 0.5732908, 0, 0, 0, 1, 1,
2.135058, -1.15574, 2.967813, 0, 0, 0, 1, 1,
2.1358, 0.1022513, 1.776375, 0, 0, 0, 1, 1,
2.173266, -1.283203, 3.370936, 0, 0, 0, 1, 1,
2.182176, 0.06987616, 2.144226, 0, 0, 0, 1, 1,
2.199515, -1.913599, 0.9071302, 0, 0, 0, 1, 1,
2.326865, 1.509925, 1.218811, 1, 1, 1, 1, 1,
2.427915, 0.09843896, 0.2559925, 1, 1, 1, 1, 1,
2.856431, -0.6747781, 1.626792, 1, 1, 1, 1, 1,
2.954586, -0.5776802, 3.457278, 1, 1, 1, 1, 1,
2.973954, 0.2101556, 2.957056, 1, 1, 1, 1, 1,
3.067379, -1.251165, 3.565709, 1, 1, 1, 1, 1,
3.405644, 0.02466378, 2.756321, 1, 1, 1, 1, 1
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
var radius = 10.02838;
var distance = 35.22426;
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
mvMatrix.translate( -0.3157755, -0.170949, -0.2977602 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.22426);
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
