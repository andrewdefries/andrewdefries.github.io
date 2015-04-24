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
-3.607825, 0.15385, -1.663324, 1, 0, 0, 1,
-3.217735, -0.5817524, -3.05475, 1, 0.007843138, 0, 1,
-3.181891, -1.587338, -2.655923, 1, 0.01176471, 0, 1,
-3.170808, -0.7749694, -2.243013, 1, 0.01960784, 0, 1,
-2.552777, 1.288178, -1.578255, 1, 0.02352941, 0, 1,
-2.477316, 0.5722736, -1.581901, 1, 0.03137255, 0, 1,
-2.464359, 1.659812, -1.000891, 1, 0.03529412, 0, 1,
-2.424244, 0.3724337, -0.5776259, 1, 0.04313726, 0, 1,
-2.415125, 0.3541338, -1.032167, 1, 0.04705882, 0, 1,
-2.37524, -0.4763831, -0.8171324, 1, 0.05490196, 0, 1,
-2.360119, -0.8338983, -3.715774, 1, 0.05882353, 0, 1,
-2.305131, 1.020052, -0.8318537, 1, 0.06666667, 0, 1,
-2.295683, 0.2502384, -1.871248, 1, 0.07058824, 0, 1,
-2.252046, -0.4704491, -2.075539, 1, 0.07843138, 0, 1,
-2.25032, 0.9186769, -2.329941, 1, 0.08235294, 0, 1,
-2.139969, 0.3938291, -2.713255, 1, 0.09019608, 0, 1,
-2.130262, -0.9227421, -2.66712, 1, 0.09411765, 0, 1,
-2.089164, 0.5309688, -0.3692416, 1, 0.1019608, 0, 1,
-2.076318, 0.07029145, -3.10205, 1, 0.1098039, 0, 1,
-2.034495, 1.215147, -2.924075, 1, 0.1137255, 0, 1,
-2.01516, -0.3195653, -2.393477, 1, 0.1215686, 0, 1,
-2.014807, -0.6643689, -1.51521, 1, 0.1254902, 0, 1,
-2.008874, -0.421617, -0.738058, 1, 0.1333333, 0, 1,
-1.977617, 0.01826952, -1.967148, 1, 0.1372549, 0, 1,
-1.976331, -1.765847, -3.708504, 1, 0.145098, 0, 1,
-1.971029, 0.6216527, -0.8285021, 1, 0.1490196, 0, 1,
-1.958753, 0.03003364, -1.540337, 1, 0.1568628, 0, 1,
-1.936528, -0.6763985, -2.412466, 1, 0.1607843, 0, 1,
-1.936119, -0.5265575, -2.244963, 1, 0.1686275, 0, 1,
-1.891675, -1.397097, -3.233157, 1, 0.172549, 0, 1,
-1.890501, -0.4258095, -3.161703, 1, 0.1803922, 0, 1,
-1.871005, 0.3130051, -2.446873, 1, 0.1843137, 0, 1,
-1.849965, 1.984212, -0.7491453, 1, 0.1921569, 0, 1,
-1.849255, 1.302018, -0.1875381, 1, 0.1960784, 0, 1,
-1.839436, 0.5753034, -1.635254, 1, 0.2039216, 0, 1,
-1.830507, -0.7669808, -2.524753, 1, 0.2117647, 0, 1,
-1.827439, 0.3647693, -0.9322405, 1, 0.2156863, 0, 1,
-1.815702, 0.2056055, -0.6569273, 1, 0.2235294, 0, 1,
-1.807462, 0.6070346, -1.250806, 1, 0.227451, 0, 1,
-1.803035, 0.2531482, 0.4341031, 1, 0.2352941, 0, 1,
-1.796455, 0.6573499, -1.560462, 1, 0.2392157, 0, 1,
-1.790817, 0.09844173, -3.02262, 1, 0.2470588, 0, 1,
-1.748428, -1.126461, -3.857901, 1, 0.2509804, 0, 1,
-1.713516, -0.6294201, -1.279083, 1, 0.2588235, 0, 1,
-1.712709, 0.9191713, -1.304529, 1, 0.2627451, 0, 1,
-1.711519, -1.268714, -2.986675, 1, 0.2705882, 0, 1,
-1.700457, -0.7955039, -0.04403117, 1, 0.2745098, 0, 1,
-1.700403, -0.8559718, -3.001713, 1, 0.282353, 0, 1,
-1.689586, 0.953235, -0.8915083, 1, 0.2862745, 0, 1,
-1.676787, 0.230216, -1.305436, 1, 0.2941177, 0, 1,
-1.65525, -0.9090155, -1.037381, 1, 0.3019608, 0, 1,
-1.651761, 1.133202, 0.5048299, 1, 0.3058824, 0, 1,
-1.64286, -1.732801, -1.958566, 1, 0.3137255, 0, 1,
-1.642627, -2.16665, -2.122682, 1, 0.3176471, 0, 1,
-1.638694, 0.5654458, -2.875472, 1, 0.3254902, 0, 1,
-1.633787, -0.3250955, -1.818405, 1, 0.3294118, 0, 1,
-1.626381, 3.088281, 0.008869035, 1, 0.3372549, 0, 1,
-1.621501, 1.406325, -0.5324789, 1, 0.3411765, 0, 1,
-1.617473, 1.718118, -1.405376, 1, 0.3490196, 0, 1,
-1.611353, 2.814052, -0.07480103, 1, 0.3529412, 0, 1,
-1.602168, 1.62001, -0.5725505, 1, 0.3607843, 0, 1,
-1.588229, 0.7229786, -2.441142, 1, 0.3647059, 0, 1,
-1.583038, -1.607468, -2.755701, 1, 0.372549, 0, 1,
-1.581335, -0.9784741, -3.922218, 1, 0.3764706, 0, 1,
-1.574799, 1.229225, -0.3867611, 1, 0.3843137, 0, 1,
-1.563814, -0.9769734, -1.150165, 1, 0.3882353, 0, 1,
-1.562837, -1.082954, -3.547099, 1, 0.3960784, 0, 1,
-1.560228, -0.2648928, -2.951706, 1, 0.4039216, 0, 1,
-1.559621, 0.5306417, 0.6098437, 1, 0.4078431, 0, 1,
-1.546482, -0.4792106, 0.1894738, 1, 0.4156863, 0, 1,
-1.544379, -0.1355074, -3.613134, 1, 0.4196078, 0, 1,
-1.538941, -0.553016, -3.005331, 1, 0.427451, 0, 1,
-1.535931, 1.597747, -1.195428, 1, 0.4313726, 0, 1,
-1.528339, 0.8659712, -0.9884246, 1, 0.4392157, 0, 1,
-1.513031, -0.2424534, -1.185063, 1, 0.4431373, 0, 1,
-1.509903, -0.3532535, -1.35767, 1, 0.4509804, 0, 1,
-1.509832, 0.1107201, -1.653911, 1, 0.454902, 0, 1,
-1.488368, 0.5919363, -1.925369, 1, 0.4627451, 0, 1,
-1.485861, 1.209243, -2.70061, 1, 0.4666667, 0, 1,
-1.484273, -1.101787, -2.802216, 1, 0.4745098, 0, 1,
-1.475538, 0.5713232, -1.111765, 1, 0.4784314, 0, 1,
-1.474724, -0.3935637, -2.444099, 1, 0.4862745, 0, 1,
-1.471238, 0.2974786, 0.07426199, 1, 0.4901961, 0, 1,
-1.462417, -1.465739, -2.633634, 1, 0.4980392, 0, 1,
-1.445937, 0.8506888, -2.201538, 1, 0.5058824, 0, 1,
-1.444072, 1.115971, 0.2453432, 1, 0.509804, 0, 1,
-1.439554, 1.0685, -0.6032898, 1, 0.5176471, 0, 1,
-1.433047, 2.029998, -1.525801, 1, 0.5215687, 0, 1,
-1.419523, -0.5483463, -1.837123, 1, 0.5294118, 0, 1,
-1.403612, 0.7874793, -0.4009604, 1, 0.5333334, 0, 1,
-1.400602, 0.9393551, -0.2262202, 1, 0.5411765, 0, 1,
-1.391693, 1.756435, -0.4266435, 1, 0.5450981, 0, 1,
-1.378669, -0.8932618, -2.500453, 1, 0.5529412, 0, 1,
-1.374762, -0.63097, -1.775972, 1, 0.5568628, 0, 1,
-1.362563, -0.1466423, -2.314559, 1, 0.5647059, 0, 1,
-1.35834, 0.01707137, -2.929933, 1, 0.5686275, 0, 1,
-1.352391, 1.118399, 1.074843, 1, 0.5764706, 0, 1,
-1.35125, -0.08564226, -2.316369, 1, 0.5803922, 0, 1,
-1.347706, 1.437901, -1.355697, 1, 0.5882353, 0, 1,
-1.344633, 2.409574, -0.9571888, 1, 0.5921569, 0, 1,
-1.336339, -1.415447, -1.584999, 1, 0.6, 0, 1,
-1.334854, 0.3644786, -2.149169, 1, 0.6078432, 0, 1,
-1.32339, 1.13116, 0.684595, 1, 0.6117647, 0, 1,
-1.323097, -0.5755374, -1.246259, 1, 0.6196079, 0, 1,
-1.313405, 0.6742635, -1.025883, 1, 0.6235294, 0, 1,
-1.310182, 1.166791, -0.5829191, 1, 0.6313726, 0, 1,
-1.308623, 1.039059, -1.499074, 1, 0.6352941, 0, 1,
-1.306332, -0.9717774, -1.836536, 1, 0.6431373, 0, 1,
-1.283842, 0.4773724, -1.139997, 1, 0.6470588, 0, 1,
-1.280426, -0.7540061, -4.677522, 1, 0.654902, 0, 1,
-1.278307, 0.4440131, -0.1860509, 1, 0.6588235, 0, 1,
-1.273805, -0.6054857, -3.135884, 1, 0.6666667, 0, 1,
-1.272398, -0.4240688, -0.9651045, 1, 0.6705883, 0, 1,
-1.268122, 0.257528, -1.770966, 1, 0.6784314, 0, 1,
-1.267211, 0.4630544, -1.753288, 1, 0.682353, 0, 1,
-1.266122, -0.9892593, -3.642007, 1, 0.6901961, 0, 1,
-1.25596, 0.6301304, 0.9961679, 1, 0.6941177, 0, 1,
-1.254644, -1.053533, -3.139689, 1, 0.7019608, 0, 1,
-1.236924, 0.445549, -0.4119739, 1, 0.7098039, 0, 1,
-1.232115, -0.8544399, 0.2203429, 1, 0.7137255, 0, 1,
-1.231056, 0.5484437, -0.4221112, 1, 0.7215686, 0, 1,
-1.228786, -0.7593329, -1.456285, 1, 0.7254902, 0, 1,
-1.228035, -1.563806, -2.64792, 1, 0.7333333, 0, 1,
-1.224004, 1.666948, -1.893126, 1, 0.7372549, 0, 1,
-1.223589, -1.084207, -1.48294, 1, 0.7450981, 0, 1,
-1.218663, -0.8536212, -1.622513, 1, 0.7490196, 0, 1,
-1.213851, 0.1037642, -2.919411, 1, 0.7568628, 0, 1,
-1.212078, -2.457327, -1.765466, 1, 0.7607843, 0, 1,
-1.208686, -0.84993, -2.488903, 1, 0.7686275, 0, 1,
-1.203388, -1.079525, -2.151613, 1, 0.772549, 0, 1,
-1.192967, -0.2095049, -1.130525, 1, 0.7803922, 0, 1,
-1.191362, 1.203391, -2.114697, 1, 0.7843137, 0, 1,
-1.188675, -1.619104, -2.031703, 1, 0.7921569, 0, 1,
-1.183817, -1.647082, -2.65268, 1, 0.7960784, 0, 1,
-1.18299, 0.9421378, -1.806615, 1, 0.8039216, 0, 1,
-1.169537, 0.4947616, -2.814538, 1, 0.8117647, 0, 1,
-1.168917, -0.6736616, -1.571906, 1, 0.8156863, 0, 1,
-1.142362, -1.452777, -1.298734, 1, 0.8235294, 0, 1,
-1.136223, -1.812216, -2.039117, 1, 0.827451, 0, 1,
-1.136052, -0.9408668, -2.120556, 1, 0.8352941, 0, 1,
-1.133468, 1.305929, 0.7649024, 1, 0.8392157, 0, 1,
-1.13134, 0.4218207, -0.5804417, 1, 0.8470588, 0, 1,
-1.126108, -0.1974312, -0.9868827, 1, 0.8509804, 0, 1,
-1.110911, -0.0005135399, 0.2479065, 1, 0.8588235, 0, 1,
-1.110403, 0.2852137, -0.2065611, 1, 0.8627451, 0, 1,
-1.11002, 0.4419971, -0.7989042, 1, 0.8705882, 0, 1,
-1.107948, -0.2292309, -2.180568, 1, 0.8745098, 0, 1,
-1.107347, 0.9020826, -2.135398, 1, 0.8823529, 0, 1,
-1.091495, -1.749178, -0.9570295, 1, 0.8862745, 0, 1,
-1.083064, 0.03258913, -1.752096, 1, 0.8941177, 0, 1,
-1.079026, -1.828317, -2.5213, 1, 0.8980392, 0, 1,
-1.078385, 0.5905369, -0.951623, 1, 0.9058824, 0, 1,
-1.076461, 1.002645, -0.9678595, 1, 0.9137255, 0, 1,
-1.0754, -0.8452879, -3.067857, 1, 0.9176471, 0, 1,
-1.072648, -1.060102, -0.04600962, 1, 0.9254902, 0, 1,
-1.061278, 1.434596, -0.4662631, 1, 0.9294118, 0, 1,
-1.061277, 1.90057, 0.1107161, 1, 0.9372549, 0, 1,
-1.056685, -0.5262721, -3.031719, 1, 0.9411765, 0, 1,
-1.05632, 1.034431, 0.4164078, 1, 0.9490196, 0, 1,
-1.05607, 1.456376, 0.360059, 1, 0.9529412, 0, 1,
-1.033323, 0.8449771, -0.5703588, 1, 0.9607843, 0, 1,
-1.029386, 0.08368162, -0.6684261, 1, 0.9647059, 0, 1,
-1.029118, -0.04034876, -0.1365882, 1, 0.972549, 0, 1,
-1.027643, 1.530326, 0.2280195, 1, 0.9764706, 0, 1,
-1.022823, -1.396047, -2.661049, 1, 0.9843137, 0, 1,
-1.01562, 0.7795115, -2.481201, 1, 0.9882353, 0, 1,
-1.004222, 0.7318684, 0.227701, 1, 0.9960784, 0, 1,
-1.002932, 0.6179602, -2.345501, 0.9960784, 1, 0, 1,
-0.9953088, 0.288573, -1.124219, 0.9921569, 1, 0, 1,
-0.9904009, 0.4591729, -1.602772, 0.9843137, 1, 0, 1,
-0.9891415, -1.634707, -2.640067, 0.9803922, 1, 0, 1,
-0.9841408, 1.043735, -1.318292, 0.972549, 1, 0, 1,
-0.9708748, 0.5211791, -0.6947019, 0.9686275, 1, 0, 1,
-0.9691359, -2.545169, -3.212014, 0.9607843, 1, 0, 1,
-0.9675946, 0.8522951, -1.186844, 0.9568627, 1, 0, 1,
-0.9671093, 0.5800657, 0.1029133, 0.9490196, 1, 0, 1,
-0.9656328, 1.227565, -1.457583, 0.945098, 1, 0, 1,
-0.9553382, 0.6419834, -1.225328, 0.9372549, 1, 0, 1,
-0.9513321, -0.5649347, -2.188418, 0.9333333, 1, 0, 1,
-0.9504769, 1.14302, 1.098736, 0.9254902, 1, 0, 1,
-0.9442997, 1.496086, 0.9996317, 0.9215686, 1, 0, 1,
-0.9436895, 2.066535, -1.331247, 0.9137255, 1, 0, 1,
-0.9354633, 0.1157159, -0.01949368, 0.9098039, 1, 0, 1,
-0.9290705, 0.6919935, -1.082985, 0.9019608, 1, 0, 1,
-0.9283106, -0.9732924, -0.9325703, 0.8941177, 1, 0, 1,
-0.9229033, 0.7589412, -0.5775779, 0.8901961, 1, 0, 1,
-0.9228709, -0.8693134, -0.7691134, 0.8823529, 1, 0, 1,
-0.9197019, 1.873847, -1.142257, 0.8784314, 1, 0, 1,
-0.9170174, 0.1949425, -3.385532, 0.8705882, 1, 0, 1,
-0.9153193, -0.7575746, 1.214727, 0.8666667, 1, 0, 1,
-0.91445, 0.2922494, -2.209148, 0.8588235, 1, 0, 1,
-0.9080785, -0.7688453, -1.82831, 0.854902, 1, 0, 1,
-0.9078042, -0.1730602, -0.9964546, 0.8470588, 1, 0, 1,
-0.9047175, -0.03605845, -1.02157, 0.8431373, 1, 0, 1,
-0.899601, 1.433099, -0.4943588, 0.8352941, 1, 0, 1,
-0.8868952, 1.235915, 0.4910588, 0.8313726, 1, 0, 1,
-0.8862227, -0.4191664, -0.9699157, 0.8235294, 1, 0, 1,
-0.8842888, 0.3692014, -1.567314, 0.8196079, 1, 0, 1,
-0.883247, 0.570311, -2.794379, 0.8117647, 1, 0, 1,
-0.8745661, 1.663918, 0.2573409, 0.8078431, 1, 0, 1,
-0.8713431, -1.325942, -3.108756, 0.8, 1, 0, 1,
-0.8710448, -0.09669958, -1.052773, 0.7921569, 1, 0, 1,
-0.8612372, 0.0207034, -1.649104, 0.7882353, 1, 0, 1,
-0.8486707, -0.1593066, -1.092701, 0.7803922, 1, 0, 1,
-0.8450707, -0.386577, -3.133852, 0.7764706, 1, 0, 1,
-0.8420125, 1.442776, 0.9123144, 0.7686275, 1, 0, 1,
-0.839931, 0.3315877, -0.8451009, 0.7647059, 1, 0, 1,
-0.8387525, 1.194352, -0.8707651, 0.7568628, 1, 0, 1,
-0.8379177, 0.5997156, -1.784256, 0.7529412, 1, 0, 1,
-0.8337472, -0.1541973, -1.66364, 0.7450981, 1, 0, 1,
-0.8283421, 0.8451112, -1.017391, 0.7411765, 1, 0, 1,
-0.825579, -0.3535365, -0.720504, 0.7333333, 1, 0, 1,
-0.8255198, -0.2291513, -1.527393, 0.7294118, 1, 0, 1,
-0.8253729, 1.099983, 0.5124701, 0.7215686, 1, 0, 1,
-0.820443, -1.330018, -2.283772, 0.7176471, 1, 0, 1,
-0.8177606, -1.441712, -4.348782, 0.7098039, 1, 0, 1,
-0.8130525, -1.158456, -1.279151, 0.7058824, 1, 0, 1,
-0.8107262, -0.6655909, -1.15166, 0.6980392, 1, 0, 1,
-0.8048348, -1.331891, -2.549619, 0.6901961, 1, 0, 1,
-0.8013229, 0.1426829, -1.058183, 0.6862745, 1, 0, 1,
-0.7983723, -1.378965, -2.646066, 0.6784314, 1, 0, 1,
-0.7935488, 0.7554764, -1.227827, 0.6745098, 1, 0, 1,
-0.7931434, 0.4017085, -2.189628, 0.6666667, 1, 0, 1,
-0.7919664, 1.187212, 0.4024717, 0.6627451, 1, 0, 1,
-0.7905421, -0.1001353, -1.465972, 0.654902, 1, 0, 1,
-0.7892289, -1.642524, -2.693862, 0.6509804, 1, 0, 1,
-0.7876884, 0.2799436, -0.7487594, 0.6431373, 1, 0, 1,
-0.7865016, -1.395807, -2.469266, 0.6392157, 1, 0, 1,
-0.7852408, 0.03080646, -0.1207355, 0.6313726, 1, 0, 1,
-0.7785516, 1.703721, -0.2701913, 0.627451, 1, 0, 1,
-0.7707505, -0.07935842, -1.767372, 0.6196079, 1, 0, 1,
-0.7678636, 2.209131, -0.2553883, 0.6156863, 1, 0, 1,
-0.7628226, 1.744985, 0.01639993, 0.6078432, 1, 0, 1,
-0.7549469, -0.1231835, -2.697145, 0.6039216, 1, 0, 1,
-0.7533982, -1.843867, -1.597131, 0.5960785, 1, 0, 1,
-0.7491965, -0.3333212, -1.596628, 0.5882353, 1, 0, 1,
-0.7484261, 0.6465855, -0.05352298, 0.5843138, 1, 0, 1,
-0.743676, -0.7473028, -2.597864, 0.5764706, 1, 0, 1,
-0.7427185, 0.6321992, -0.8106142, 0.572549, 1, 0, 1,
-0.7397704, -1.138302, -4.138632, 0.5647059, 1, 0, 1,
-0.7382478, 1.277921, 0.6837121, 0.5607843, 1, 0, 1,
-0.7337881, -1.184432, -2.743718, 0.5529412, 1, 0, 1,
-0.7311895, 0.3579732, -0.6048779, 0.5490196, 1, 0, 1,
-0.7220367, -1.407585, -1.138455, 0.5411765, 1, 0, 1,
-0.7210094, -0.4991206, -1.670668, 0.5372549, 1, 0, 1,
-0.7172194, -0.004816393, -1.354786, 0.5294118, 1, 0, 1,
-0.7132621, 0.06323567, -2.491697, 0.5254902, 1, 0, 1,
-0.7073275, -0.2467767, -1.033775, 0.5176471, 1, 0, 1,
-0.7052393, -0.9157573, -4.085565, 0.5137255, 1, 0, 1,
-0.7021385, 0.992097, -0.3538429, 0.5058824, 1, 0, 1,
-0.7012207, 1.62314, -0.9232548, 0.5019608, 1, 0, 1,
-0.694574, -0.9797944, -2.830281, 0.4941176, 1, 0, 1,
-0.6929814, 0.1743509, -0.2932854, 0.4862745, 1, 0, 1,
-0.690932, 0.6889039, 0.4409835, 0.4823529, 1, 0, 1,
-0.6886188, 1.436539, 0.7730935, 0.4745098, 1, 0, 1,
-0.6867505, -0.1066702, -2.699123, 0.4705882, 1, 0, 1,
-0.6803666, -0.5545146, -2.996561, 0.4627451, 1, 0, 1,
-0.6663572, 1.310427, 0.1099873, 0.4588235, 1, 0, 1,
-0.662327, 1.795571, 0.5091883, 0.4509804, 1, 0, 1,
-0.6519257, -1.00279, -0.8647429, 0.4470588, 1, 0, 1,
-0.6480652, 0.3695683, -0.5771165, 0.4392157, 1, 0, 1,
-0.6467384, 0.6663324, -2.800652, 0.4352941, 1, 0, 1,
-0.6433269, 2.233071, -0.0216279, 0.427451, 1, 0, 1,
-0.6421856, 0.1335572, -1.12563, 0.4235294, 1, 0, 1,
-0.641793, 0.2115896, -2.036593, 0.4156863, 1, 0, 1,
-0.6404696, -1.645875, -2.786939, 0.4117647, 1, 0, 1,
-0.6368651, 0.4570401, -2.289046, 0.4039216, 1, 0, 1,
-0.6349587, 1.356074, 0.1469525, 0.3960784, 1, 0, 1,
-0.6330019, -0.5029019, -2.656153, 0.3921569, 1, 0, 1,
-0.6282459, -0.8095456, -1.426839, 0.3843137, 1, 0, 1,
-0.6185408, -0.1381278, -1.177561, 0.3803922, 1, 0, 1,
-0.6159597, -0.3772793, -1.07078, 0.372549, 1, 0, 1,
-0.6153221, 0.3598655, -0.6881743, 0.3686275, 1, 0, 1,
-0.6149311, -0.1933742, -3.811452, 0.3607843, 1, 0, 1,
-0.6128017, 0.390098, -0.3534254, 0.3568628, 1, 0, 1,
-0.6127494, 1.264214, 0.8716242, 0.3490196, 1, 0, 1,
-0.6076996, -1.224955, -2.204297, 0.345098, 1, 0, 1,
-0.6063303, -0.7805875, -1.800381, 0.3372549, 1, 0, 1,
-0.5992444, -0.2761649, -2.7966, 0.3333333, 1, 0, 1,
-0.5924848, -0.7367214, -2.000322, 0.3254902, 1, 0, 1,
-0.5906863, 1.345706, -2.583373, 0.3215686, 1, 0, 1,
-0.5896428, -1.105715, -4.437695, 0.3137255, 1, 0, 1,
-0.5859967, -1.2553, -2.77895, 0.3098039, 1, 0, 1,
-0.5859596, -1.087121, -1.594051, 0.3019608, 1, 0, 1,
-0.5812061, 0.3037722, -0.8269468, 0.2941177, 1, 0, 1,
-0.5782375, -0.7371719, -4.490087, 0.2901961, 1, 0, 1,
-0.57754, 1.613685, 1.154518, 0.282353, 1, 0, 1,
-0.5774515, -0.5290385, -1.530473, 0.2784314, 1, 0, 1,
-0.5715966, 0.8647559, -1.142323, 0.2705882, 1, 0, 1,
-0.5695601, -0.09849361, -2.099278, 0.2666667, 1, 0, 1,
-0.5671541, 0.07257368, -0.1180611, 0.2588235, 1, 0, 1,
-0.5662554, -0.6974808, -1.076913, 0.254902, 1, 0, 1,
-0.5600275, -0.9386345, -3.197945, 0.2470588, 1, 0, 1,
-0.5549865, -0.627845, -2.655116, 0.2431373, 1, 0, 1,
-0.5460449, -0.2813992, -3.073914, 0.2352941, 1, 0, 1,
-0.54439, -0.08223447, -2.331721, 0.2313726, 1, 0, 1,
-0.5438265, 1.169752, -1.14112, 0.2235294, 1, 0, 1,
-0.5415293, -0.5737179, -1.343726, 0.2196078, 1, 0, 1,
-0.5379865, -1.375035, -3.444875, 0.2117647, 1, 0, 1,
-0.5379438, 0.2203382, 0.624137, 0.2078431, 1, 0, 1,
-0.5353367, -0.5182522, -4.137463, 0.2, 1, 0, 1,
-0.5278111, -0.5054262, -2.612476, 0.1921569, 1, 0, 1,
-0.5271003, 1.191476, 0.4221581, 0.1882353, 1, 0, 1,
-0.5233543, -1.496253, -3.577909, 0.1803922, 1, 0, 1,
-0.5199857, 0.1233714, -1.731812, 0.1764706, 1, 0, 1,
-0.5191956, 0.1432092, -0.6888589, 0.1686275, 1, 0, 1,
-0.516416, 1.291422, -0.6433537, 0.1647059, 1, 0, 1,
-0.515644, -0.5002211, -0.3287769, 0.1568628, 1, 0, 1,
-0.5127408, 0.3262745, -2.518465, 0.1529412, 1, 0, 1,
-0.5126482, 0.4401609, -1.326503, 0.145098, 1, 0, 1,
-0.510374, 2.916318, -2.171555, 0.1411765, 1, 0, 1,
-0.5063209, 0.1961556, -0.515925, 0.1333333, 1, 0, 1,
-0.5037881, 1.346735, -1.124025, 0.1294118, 1, 0, 1,
-0.5021657, 0.7296338, -2.209035, 0.1215686, 1, 0, 1,
-0.5016617, 0.01022992, -1.518655, 0.1176471, 1, 0, 1,
-0.4911477, 0.5664558, 0.2903674, 0.1098039, 1, 0, 1,
-0.4886423, -0.6851003, -2.772509, 0.1058824, 1, 0, 1,
-0.4876936, 1.309551, 0.06663156, 0.09803922, 1, 0, 1,
-0.4876278, -0.491975, -3.409922, 0.09019608, 1, 0, 1,
-0.4872859, 0.3848706, -0.3404459, 0.08627451, 1, 0, 1,
-0.4870537, 1.234442, 0.3820238, 0.07843138, 1, 0, 1,
-0.4840624, 1.212962, -0.4551699, 0.07450981, 1, 0, 1,
-0.4838343, -0.1553227, -2.492167, 0.06666667, 1, 0, 1,
-0.4833659, -1.046156, -3.903837, 0.0627451, 1, 0, 1,
-0.4807583, 1.160169, -0.5412983, 0.05490196, 1, 0, 1,
-0.473673, 1.744616, -0.6045025, 0.05098039, 1, 0, 1,
-0.4717032, -0.3225734, -3.163435, 0.04313726, 1, 0, 1,
-0.4699194, -0.05354311, -1.352806, 0.03921569, 1, 0, 1,
-0.4684047, -0.6370791, -3.048337, 0.03137255, 1, 0, 1,
-0.459629, 0.4511131, -0.9661046, 0.02745098, 1, 0, 1,
-0.4589274, 0.1157898, 0.372023, 0.01960784, 1, 0, 1,
-0.4587499, 1.215984, -1.759137, 0.01568628, 1, 0, 1,
-0.457516, -0.8626877, -1.581649, 0.007843138, 1, 0, 1,
-0.4567679, 1.895658, -2.446524, 0.003921569, 1, 0, 1,
-0.4560502, 1.24551, -0.8321527, 0, 1, 0.003921569, 1,
-0.4553385, -0.02448977, -1.512317, 0, 1, 0.01176471, 1,
-0.455075, -0.3798368, -1.083175, 0, 1, 0.01568628, 1,
-0.4543364, -0.6345462, -1.548201, 0, 1, 0.02352941, 1,
-0.4512461, 1.31375, -0.5476055, 0, 1, 0.02745098, 1,
-0.4496891, 0.2177933, -0.2550074, 0, 1, 0.03529412, 1,
-0.448199, -0.2175516, -3.451306, 0, 1, 0.03921569, 1,
-0.4471678, -0.5697942, -2.436697, 0, 1, 0.04705882, 1,
-0.4444697, 0.008389402, -2.373939, 0, 1, 0.05098039, 1,
-0.4437689, -0.462712, -0.6138732, 0, 1, 0.05882353, 1,
-0.4383965, -0.2794845, -2.639282, 0, 1, 0.0627451, 1,
-0.4356624, -0.9399749, -1.786061, 0, 1, 0.07058824, 1,
-0.4332904, 1.304009, -2.150037, 0, 1, 0.07450981, 1,
-0.4327269, 0.1337879, 0.1492226, 0, 1, 0.08235294, 1,
-0.4325136, 0.2321528, -1.206576, 0, 1, 0.08627451, 1,
-0.4305381, 0.2807793, -0.8147448, 0, 1, 0.09411765, 1,
-0.4299366, -0.4035017, -2.050313, 0, 1, 0.1019608, 1,
-0.4273468, -1.682092, -4.13271, 0, 1, 0.1058824, 1,
-0.424242, -1.13247, -1.910663, 0, 1, 0.1137255, 1,
-0.4216976, -0.3883108, -4.409245, 0, 1, 0.1176471, 1,
-0.4171221, 0.4902781, 0.7970017, 0, 1, 0.1254902, 1,
-0.416523, 0.538438, -3.834025, 0, 1, 0.1294118, 1,
-0.4149442, -0.4812163, -1.97835, 0, 1, 0.1372549, 1,
-0.4099103, -1.699962, -2.746705, 0, 1, 0.1411765, 1,
-0.4084682, 0.5846608, -2.555003, 0, 1, 0.1490196, 1,
-0.4084091, 1.744148, 0.704273, 0, 1, 0.1529412, 1,
-0.4082775, -0.0165736, -0.5808423, 0, 1, 0.1607843, 1,
-0.4078965, -0.5026935, -1.546686, 0, 1, 0.1647059, 1,
-0.3972486, 0.01781696, -1.991698, 0, 1, 0.172549, 1,
-0.3915164, 1.421681, 1.110019, 0, 1, 0.1764706, 1,
-0.3824706, 0.101926, -0.6385101, 0, 1, 0.1843137, 1,
-0.3800634, -1.262185, -2.599593, 0, 1, 0.1882353, 1,
-0.3774517, -0.4889991, -2.2895, 0, 1, 0.1960784, 1,
-0.3682171, -0.9540616, -2.548478, 0, 1, 0.2039216, 1,
-0.3668956, -0.7785386, -1.401232, 0, 1, 0.2078431, 1,
-0.3606955, -0.4282945, -3.178716, 0, 1, 0.2156863, 1,
-0.3595715, -0.5674862, -2.332498, 0, 1, 0.2196078, 1,
-0.3588099, 1.575785, -0.8265558, 0, 1, 0.227451, 1,
-0.3575746, -3.319748, -3.757052, 0, 1, 0.2313726, 1,
-0.3575193, 0.2190908, -1.421648, 0, 1, 0.2392157, 1,
-0.356978, 1.883629, 1.442896, 0, 1, 0.2431373, 1,
-0.3549341, -0.05992432, 0.610413, 0, 1, 0.2509804, 1,
-0.3537006, 1.310131, -0.2445377, 0, 1, 0.254902, 1,
-0.3534438, -0.06270388, -1.618673, 0, 1, 0.2627451, 1,
-0.3480908, 1.408588, -2.063194, 0, 1, 0.2666667, 1,
-0.3473659, -0.345604, -1.330549, 0, 1, 0.2745098, 1,
-0.3418437, 0.04426507, -1.139247, 0, 1, 0.2784314, 1,
-0.3360975, -0.1632917, -1.427379, 0, 1, 0.2862745, 1,
-0.3344828, 0.6987132, 1.548863, 0, 1, 0.2901961, 1,
-0.3322841, -0.9840689, -2.565497, 0, 1, 0.2980392, 1,
-0.3277853, 1.257933, -1.406473, 0, 1, 0.3058824, 1,
-0.3275864, -1.986532, -3.309541, 0, 1, 0.3098039, 1,
-0.3244143, -0.6213704, -2.517726, 0, 1, 0.3176471, 1,
-0.3218594, -1.320576, -2.841256, 0, 1, 0.3215686, 1,
-0.3212777, 0.4927348, -0.6078612, 0, 1, 0.3294118, 1,
-0.3153124, -0.7586905, -2.849391, 0, 1, 0.3333333, 1,
-0.3133982, -0.1807961, -3.648662, 0, 1, 0.3411765, 1,
-0.3127764, 0.04887495, -0.6353664, 0, 1, 0.345098, 1,
-0.3125512, 2.321955, -0.4402835, 0, 1, 0.3529412, 1,
-0.3122331, -0.9299115, -2.166345, 0, 1, 0.3568628, 1,
-0.3081112, 1.902286, 0.3239302, 0, 1, 0.3647059, 1,
-0.3063873, 0.9590026, -1.147929, 0, 1, 0.3686275, 1,
-0.3051175, 0.9330706, -0.8879272, 0, 1, 0.3764706, 1,
-0.3046476, -1.149928, -2.459497, 0, 1, 0.3803922, 1,
-0.2994653, 0.5956453, -0.3509502, 0, 1, 0.3882353, 1,
-0.2947892, -0.7602403, -2.248483, 0, 1, 0.3921569, 1,
-0.2932627, 1.470198, 0.5417488, 0, 1, 0.4, 1,
-0.293152, -0.2770662, -0.8085968, 0, 1, 0.4078431, 1,
-0.29277, -0.8229941, -3.51368, 0, 1, 0.4117647, 1,
-0.2822021, -0.464348, -2.245754, 0, 1, 0.4196078, 1,
-0.2821428, 0.7680752, -0.1561085, 0, 1, 0.4235294, 1,
-0.2785165, -0.09086359, -1.424063, 0, 1, 0.4313726, 1,
-0.2782863, -2.25725, -2.915589, 0, 1, 0.4352941, 1,
-0.2748673, 1.191449, 0.07858154, 0, 1, 0.4431373, 1,
-0.2699502, -0.6551906, -1.392186, 0, 1, 0.4470588, 1,
-0.2676759, -0.2629101, -3.118786, 0, 1, 0.454902, 1,
-0.2639586, -0.6266826, -5.67264, 0, 1, 0.4588235, 1,
-0.2606477, -1.056522, -3.549493, 0, 1, 0.4666667, 1,
-0.25995, -1.554933, -3.203674, 0, 1, 0.4705882, 1,
-0.2566463, -0.1673923, -2.881976, 0, 1, 0.4784314, 1,
-0.2499916, -1.158283, -1.992593, 0, 1, 0.4823529, 1,
-0.2491212, -0.5647552, -2.270534, 0, 1, 0.4901961, 1,
-0.2441603, 0.2136285, -1.137768, 0, 1, 0.4941176, 1,
-0.2407232, -0.8919913, -1.041034, 0, 1, 0.5019608, 1,
-0.2365709, 0.770799, -1.403326, 0, 1, 0.509804, 1,
-0.2330601, -0.353073, -1.875518, 0, 1, 0.5137255, 1,
-0.2324579, -1.564602, -4.031781, 0, 1, 0.5215687, 1,
-0.2288063, 0.5011421, -2.188065, 0, 1, 0.5254902, 1,
-0.2285678, 0.3973227, -0.6672502, 0, 1, 0.5333334, 1,
-0.2265261, 0.5726296, 0.6559308, 0, 1, 0.5372549, 1,
-0.2219205, 1.096471, -0.05812917, 0, 1, 0.5450981, 1,
-0.2182731, 0.1008839, -0.9732739, 0, 1, 0.5490196, 1,
-0.2129971, 0.9800276, -1.165558, 0, 1, 0.5568628, 1,
-0.2092139, -0.1930852, -0.9913546, 0, 1, 0.5607843, 1,
-0.2090016, 1.099566, -0.9272132, 0, 1, 0.5686275, 1,
-0.2086974, 0.0398579, -4.089495, 0, 1, 0.572549, 1,
-0.2075558, 1.078743, 1.487839, 0, 1, 0.5803922, 1,
-0.2072159, 1.292277, 0.7182269, 0, 1, 0.5843138, 1,
-0.2026954, 0.05140525, -1.287386, 0, 1, 0.5921569, 1,
-0.200231, -0.3650887, -2.464067, 0, 1, 0.5960785, 1,
-0.1989415, -2.245812, -3.722715, 0, 1, 0.6039216, 1,
-0.1963003, -0.640582, -3.17233, 0, 1, 0.6117647, 1,
-0.1956191, 0.03144693, -2.20085, 0, 1, 0.6156863, 1,
-0.1900745, 0.7064179, -0.8843318, 0, 1, 0.6235294, 1,
-0.1864697, 0.5311148, -0.7747812, 0, 1, 0.627451, 1,
-0.1843765, 0.3582555, 1.342321, 0, 1, 0.6352941, 1,
-0.1826026, 0.2196556, 0.4463556, 0, 1, 0.6392157, 1,
-0.1784459, -0.3521474, -1.986242, 0, 1, 0.6470588, 1,
-0.1763593, -0.8043476, -2.917859, 0, 1, 0.6509804, 1,
-0.1741167, 1.109398, -0.6179264, 0, 1, 0.6588235, 1,
-0.1731008, 0.167371, -1.624188, 0, 1, 0.6627451, 1,
-0.1647879, -1.600425, -1.712935, 0, 1, 0.6705883, 1,
-0.1646908, 1.004112, -2.487018, 0, 1, 0.6745098, 1,
-0.1622254, 0.2500379, -0.4322355, 0, 1, 0.682353, 1,
-0.16219, -0.88381, -4.500424, 0, 1, 0.6862745, 1,
-0.1595108, 0.8846965, -0.9277908, 0, 1, 0.6941177, 1,
-0.1583125, -1.680177, -2.274681, 0, 1, 0.7019608, 1,
-0.1562894, -0.976796, -3.414262, 0, 1, 0.7058824, 1,
-0.1543665, -0.5476172, -2.671261, 0, 1, 0.7137255, 1,
-0.154357, 0.06242905, -1.743574, 0, 1, 0.7176471, 1,
-0.1520426, 1.54776, 0.1984581, 0, 1, 0.7254902, 1,
-0.1517634, 0.7493849, -1.212525, 0, 1, 0.7294118, 1,
-0.1476614, 0.4178275, -2.346188, 0, 1, 0.7372549, 1,
-0.1459934, 0.4668825, -1.119229, 0, 1, 0.7411765, 1,
-0.145221, 0.5098961, -2.122406, 0, 1, 0.7490196, 1,
-0.1406031, -0.06051763, -1.630223, 0, 1, 0.7529412, 1,
-0.1405698, -0.3554177, -3.523545, 0, 1, 0.7607843, 1,
-0.1339179, 0.07242604, -0.1286065, 0, 1, 0.7647059, 1,
-0.1298991, -0.4604108, -3.615042, 0, 1, 0.772549, 1,
-0.1236584, -0.3906378, -4.004112, 0, 1, 0.7764706, 1,
-0.1207591, -0.800069, -3.70372, 0, 1, 0.7843137, 1,
-0.1177483, 1.591177, 0.2861221, 0, 1, 0.7882353, 1,
-0.117153, -1.448293, -3.142534, 0, 1, 0.7960784, 1,
-0.1127071, -1.675788, -2.872552, 0, 1, 0.8039216, 1,
-0.1117633, 0.3416066, 0.4528042, 0, 1, 0.8078431, 1,
-0.1085567, -1.307474, -2.930768, 0, 1, 0.8156863, 1,
-0.1068033, -0.1845245, -1.028718, 0, 1, 0.8196079, 1,
-0.104299, -0.9234834, -2.776875, 0, 1, 0.827451, 1,
-0.1002414, -0.1373569, -3.99404, 0, 1, 0.8313726, 1,
-0.09780426, 1.083368, 0.05440954, 0, 1, 0.8392157, 1,
-0.09709026, -0.2263511, -3.680376, 0, 1, 0.8431373, 1,
-0.0961474, -0.9692748, -3.585472, 0, 1, 0.8509804, 1,
-0.08164898, 0.6920773, -0.3606823, 0, 1, 0.854902, 1,
-0.08108614, 0.4537954, -0.2512256, 0, 1, 0.8627451, 1,
-0.07767486, -0.4267827, -4.517112, 0, 1, 0.8666667, 1,
-0.07227442, 0.7133434, 1.077476, 0, 1, 0.8745098, 1,
-0.07167187, -0.4322045, -3.274237, 0, 1, 0.8784314, 1,
-0.06975657, 0.5417244, 0.3220528, 0, 1, 0.8862745, 1,
-0.06507666, 0.2639621, 0.6737689, 0, 1, 0.8901961, 1,
-0.05702557, 1.67784, -0.1511644, 0, 1, 0.8980392, 1,
-0.05657736, 1.430849, 0.4117036, 0, 1, 0.9058824, 1,
-0.05631727, 1.031875, 0.05714121, 0, 1, 0.9098039, 1,
-0.04993875, 0.7664374, -1.041939, 0, 1, 0.9176471, 1,
-0.04809559, -0.328792, -1.144644, 0, 1, 0.9215686, 1,
-0.04258111, -0.5003194, -2.347191, 0, 1, 0.9294118, 1,
-0.0424844, -0.8030559, -1.605677, 0, 1, 0.9333333, 1,
-0.03730993, -0.7807233, -3.489799, 0, 1, 0.9411765, 1,
-0.0368405, 0.2133532, 0.8495647, 0, 1, 0.945098, 1,
-0.03081392, -0.4532735, -3.0693, 0, 1, 0.9529412, 1,
-0.029206, -0.7110087, -2.366924, 0, 1, 0.9568627, 1,
-0.02779485, 2.314777, 0.6909091, 0, 1, 0.9647059, 1,
-0.02497418, -0.09216514, -2.085005, 0, 1, 0.9686275, 1,
-0.02189324, -0.8990037, -4.745217, 0, 1, 0.9764706, 1,
-0.01493744, -0.5359828, -3.781992, 0, 1, 0.9803922, 1,
-0.0145212, 1.060449, -0.7392344, 0, 1, 0.9882353, 1,
-0.01200192, 1.683336, 0.5271849, 0, 1, 0.9921569, 1,
-0.00631845, -2.012101, -4.398544, 0, 1, 1, 1,
-0.00601435, -1.104852, -1.777266, 0, 0.9921569, 1, 1,
-0.002433392, 2.137574, 1.300179, 0, 0.9882353, 1, 1,
-0.002411387, -0.9652609, -2.901395, 0, 0.9803922, 1, 1,
0.003713727, -0.2945434, 4.002231, 0, 0.9764706, 1, 1,
0.007537902, -0.593914, 2.481672, 0, 0.9686275, 1, 1,
0.01026623, 2.857216, -0.2352748, 0, 0.9647059, 1, 1,
0.01122184, 0.5763239, 0.887798, 0, 0.9568627, 1, 1,
0.01662389, -0.1924814, 3.529946, 0, 0.9529412, 1, 1,
0.01788104, 0.4812763, 0.5414786, 0, 0.945098, 1, 1,
0.019082, 0.3788854, 0.2712038, 0, 0.9411765, 1, 1,
0.0192476, 0.5003912, 0.02170436, 0, 0.9333333, 1, 1,
0.02096708, -2.021425, 2.56108, 0, 0.9294118, 1, 1,
0.02261136, -0.2139945, 3.6154, 0, 0.9215686, 1, 1,
0.02303109, 0.9328313, -0.8929408, 0, 0.9176471, 1, 1,
0.02346128, -0.04369237, 2.611708, 0, 0.9098039, 1, 1,
0.02551379, 0.3616967, -0.7039618, 0, 0.9058824, 1, 1,
0.03307693, 0.6569949, 0.1131817, 0, 0.8980392, 1, 1,
0.03969496, 0.02440548, 0.5059511, 0, 0.8901961, 1, 1,
0.04114811, 0.05671294, 1.189065, 0, 0.8862745, 1, 1,
0.04308075, 0.9476635, 0.3037576, 0, 0.8784314, 1, 1,
0.0444608, 0.2817294, -0.04227204, 0, 0.8745098, 1, 1,
0.05120083, -0.4352971, 2.044766, 0, 0.8666667, 1, 1,
0.06087343, 1.090141, 0.9935756, 0, 0.8627451, 1, 1,
0.06871217, 0.705766, -0.6020479, 0, 0.854902, 1, 1,
0.0689512, 0.3062297, -1.332596, 0, 0.8509804, 1, 1,
0.06904878, 0.01769715, 2.627947, 0, 0.8431373, 1, 1,
0.06932127, -0.1886633, 1.503865, 0, 0.8392157, 1, 1,
0.06956194, -0.2509084, 2.372363, 0, 0.8313726, 1, 1,
0.07217769, 0.7773058, 0.9084618, 0, 0.827451, 1, 1,
0.07325922, 1.586286, -0.211722, 0, 0.8196079, 1, 1,
0.07401607, 1.054272, -0.3945574, 0, 0.8156863, 1, 1,
0.07451692, -0.6150062, 3.10806, 0, 0.8078431, 1, 1,
0.07595848, 2.075997, 0.5055792, 0, 0.8039216, 1, 1,
0.07794024, 1.094181, -0.282617, 0, 0.7960784, 1, 1,
0.08636487, 0.864644, -1.74722, 0, 0.7882353, 1, 1,
0.08687395, -0.3025563, 4.262417, 0, 0.7843137, 1, 1,
0.0869987, 1.199683, 0.8314777, 0, 0.7764706, 1, 1,
0.09018205, -0.2251871, 4.796785, 0, 0.772549, 1, 1,
0.09244732, 0.1299465, 0.622443, 0, 0.7647059, 1, 1,
0.09516605, 1.208796, -0.3354516, 0, 0.7607843, 1, 1,
0.1038999, 0.4106906, 0.2720189, 0, 0.7529412, 1, 1,
0.1051873, 1.004552, -1.001968, 0, 0.7490196, 1, 1,
0.1095093, -0.6112688, 1.926162, 0, 0.7411765, 1, 1,
0.1160567, 0.6017523, 0.5374311, 0, 0.7372549, 1, 1,
0.1187358, 0.5065117, -1.09469, 0, 0.7294118, 1, 1,
0.1190522, -0.7520248, 3.33445, 0, 0.7254902, 1, 1,
0.1241047, 0.1744034, -0.9770816, 0, 0.7176471, 1, 1,
0.1252259, -2.191078, 3.774405, 0, 0.7137255, 1, 1,
0.1267922, 0.2600094, 0.6939481, 0, 0.7058824, 1, 1,
0.1269457, -1.18459, 3.988829, 0, 0.6980392, 1, 1,
0.1299991, 0.1792549, 1.476708, 0, 0.6941177, 1, 1,
0.1380174, -1.604366, 2.432993, 0, 0.6862745, 1, 1,
0.150238, 0.0488485, 1.101683, 0, 0.682353, 1, 1,
0.1536337, -0.06306983, 3.21728, 0, 0.6745098, 1, 1,
0.15591, -1.468723, 3.105387, 0, 0.6705883, 1, 1,
0.156271, -1.580238, 5.412342, 0, 0.6627451, 1, 1,
0.1618473, -0.4788572, 1.604863, 0, 0.6588235, 1, 1,
0.1626309, 1.250043, 1.126185, 0, 0.6509804, 1, 1,
0.163678, -0.3604762, 2.956228, 0, 0.6470588, 1, 1,
0.1644434, -1.484473, 3.877417, 0, 0.6392157, 1, 1,
0.1676059, 1.483555, -0.3225898, 0, 0.6352941, 1, 1,
0.1694002, -0.4981795, 0.9552106, 0, 0.627451, 1, 1,
0.1713451, 0.5888854, -0.9567605, 0, 0.6235294, 1, 1,
0.1758637, -0.3165364, 2.734456, 0, 0.6156863, 1, 1,
0.1771224, 0.08768076, 0.3128653, 0, 0.6117647, 1, 1,
0.185731, 1.374545, 1.430035, 0, 0.6039216, 1, 1,
0.1909237, 0.3825628, 0.2812609, 0, 0.5960785, 1, 1,
0.1944686, 1.474235, 0.1545562, 0, 0.5921569, 1, 1,
0.1986567, 0.8587652, -1.088608, 0, 0.5843138, 1, 1,
0.1989063, -0.8983963, 2.057517, 0, 0.5803922, 1, 1,
0.1989731, 0.3721977, -2.068216, 0, 0.572549, 1, 1,
0.1992844, -1.742986, 2.867753, 0, 0.5686275, 1, 1,
0.1997563, -0.8607743, 3.260664, 0, 0.5607843, 1, 1,
0.2000445, -1.143913, 3.340564, 0, 0.5568628, 1, 1,
0.2018182, -0.6664326, 2.019884, 0, 0.5490196, 1, 1,
0.205157, -0.2193068, 1.948891, 0, 0.5450981, 1, 1,
0.2078592, 0.7492174, 0.5984274, 0, 0.5372549, 1, 1,
0.2093137, 2.283951, -0.427204, 0, 0.5333334, 1, 1,
0.210053, -0.5243156, 2.17856, 0, 0.5254902, 1, 1,
0.2117694, -1.294473, 3.546724, 0, 0.5215687, 1, 1,
0.2144614, -0.3901929, 2.680197, 0, 0.5137255, 1, 1,
0.2144831, 0.205601, 0.8717449, 0, 0.509804, 1, 1,
0.2156772, -0.7767891, 3.806968, 0, 0.5019608, 1, 1,
0.2179831, -0.2171877, 1.208939, 0, 0.4941176, 1, 1,
0.2314648, 0.3550769, -0.3348591, 0, 0.4901961, 1, 1,
0.2323261, -0.5381431, 3.7711, 0, 0.4823529, 1, 1,
0.2326203, -0.973359, 1.131995, 0, 0.4784314, 1, 1,
0.2337444, 1.340924, -0.487692, 0, 0.4705882, 1, 1,
0.2347057, -0.3401665, 0.505724, 0, 0.4666667, 1, 1,
0.236481, -1.117313, 3.495795, 0, 0.4588235, 1, 1,
0.2389016, 0.7993469, 2.244009, 0, 0.454902, 1, 1,
0.2415633, -0.4099098, 1.856269, 0, 0.4470588, 1, 1,
0.2440299, -0.9184005, 2.522323, 0, 0.4431373, 1, 1,
0.2472849, -0.5124652, 1.913933, 0, 0.4352941, 1, 1,
0.2474924, -0.2543805, 2.636299, 0, 0.4313726, 1, 1,
0.2564653, 0.9743724, -0.3246091, 0, 0.4235294, 1, 1,
0.2564849, 0.6887517, 0.9219167, 0, 0.4196078, 1, 1,
0.2624667, -1.804431, 2.186516, 0, 0.4117647, 1, 1,
0.2667838, -0.5936102, 1.763529, 0, 0.4078431, 1, 1,
0.2705283, -0.08432096, 2.745559, 0, 0.4, 1, 1,
0.2734783, -0.5140791, 2.195243, 0, 0.3921569, 1, 1,
0.2746278, 1.962087, -1.4633, 0, 0.3882353, 1, 1,
0.2748276, 0.5076271, 2.163875, 0, 0.3803922, 1, 1,
0.2766827, 0.8618827, 0.08542252, 0, 0.3764706, 1, 1,
0.2805934, -1.108187, 2.089895, 0, 0.3686275, 1, 1,
0.2834857, 1.230047, 1.497589, 0, 0.3647059, 1, 1,
0.2894818, 1.049321, -0.1800042, 0, 0.3568628, 1, 1,
0.2907665, 0.8755711, 0.2025214, 0, 0.3529412, 1, 1,
0.2924143, -1.815724, 1.935233, 0, 0.345098, 1, 1,
0.2934103, 1.469844, -1.287138, 0, 0.3411765, 1, 1,
0.2980359, 0.5297176, 2.201428, 0, 0.3333333, 1, 1,
0.2993463, 0.3391104, 0.08399671, 0, 0.3294118, 1, 1,
0.3055826, -0.7360316, 2.712416, 0, 0.3215686, 1, 1,
0.3103326, -0.5136772, 1.421081, 0, 0.3176471, 1, 1,
0.3167412, 0.8437949, 0.04192114, 0, 0.3098039, 1, 1,
0.3187101, -1.964942, 2.609176, 0, 0.3058824, 1, 1,
0.3235118, -0.4218721, 2.653985, 0, 0.2980392, 1, 1,
0.3253205, -0.2390601, 3.266339, 0, 0.2901961, 1, 1,
0.3296411, -0.5041012, 2.792978, 0, 0.2862745, 1, 1,
0.3313855, 0.1566908, 0.1012336, 0, 0.2784314, 1, 1,
0.3496259, -1.376942, 5.222961, 0, 0.2745098, 1, 1,
0.3515128, 1.971658, -2.198979, 0, 0.2666667, 1, 1,
0.3516095, 0.8717877, 0.1046833, 0, 0.2627451, 1, 1,
0.3659059, 1.798084, 1.410068, 0, 0.254902, 1, 1,
0.3659733, -1.435958, 3.689545, 0, 0.2509804, 1, 1,
0.3675591, 0.6699961, 2.622755, 0, 0.2431373, 1, 1,
0.3698383, 1.051432, 0.8247746, 0, 0.2392157, 1, 1,
0.3738194, 0.4850135, 1.133855, 0, 0.2313726, 1, 1,
0.3749341, 0.3791466, -1.191145, 0, 0.227451, 1, 1,
0.3787643, -1.298838, 4.008013, 0, 0.2196078, 1, 1,
0.3810964, 0.7875045, 0.6069018, 0, 0.2156863, 1, 1,
0.3861362, -0.6487264, 0.8591111, 0, 0.2078431, 1, 1,
0.3874086, -0.8707607, 2.356379, 0, 0.2039216, 1, 1,
0.3963071, 2.357363, -1.063265, 0, 0.1960784, 1, 1,
0.3969595, -0.6265655, 1.716943, 0, 0.1882353, 1, 1,
0.3973135, -0.7815873, 3.762239, 0, 0.1843137, 1, 1,
0.4022733, 0.2345999, 1.191925, 0, 0.1764706, 1, 1,
0.4073391, 0.3476665, 0.2991607, 0, 0.172549, 1, 1,
0.4078133, 0.8769373, 0.4060189, 0, 0.1647059, 1, 1,
0.4080573, 0.02163347, 2.265546, 0, 0.1607843, 1, 1,
0.4114662, 0.799236, -0.1931281, 0, 0.1529412, 1, 1,
0.4118089, -1.188848, 2.964185, 0, 0.1490196, 1, 1,
0.4233942, 0.5654039, 0.09157499, 0, 0.1411765, 1, 1,
0.4388122, 0.3791875, -0.3427749, 0, 0.1372549, 1, 1,
0.4400106, 0.6768754, 0.2660851, 0, 0.1294118, 1, 1,
0.4435622, -1.40288, 3.233966, 0, 0.1254902, 1, 1,
0.4450378, 1.642031, -0.8928085, 0, 0.1176471, 1, 1,
0.4452275, 1.858057, -0.5626712, 0, 0.1137255, 1, 1,
0.446995, -0.7519665, 2.75566, 0, 0.1058824, 1, 1,
0.4491107, -1.130036, 4.103911, 0, 0.09803922, 1, 1,
0.4503119, -0.2351727, 1.469866, 0, 0.09411765, 1, 1,
0.4510602, -0.8640115, 2.865551, 0, 0.08627451, 1, 1,
0.4513704, 0.2271665, 0.7952445, 0, 0.08235294, 1, 1,
0.4525273, 0.5560988, 1.422475, 0, 0.07450981, 1, 1,
0.4528126, -0.2730032, 2.176231, 0, 0.07058824, 1, 1,
0.4548785, 0.1998275, 1.02674, 0, 0.0627451, 1, 1,
0.4557544, 0.2604459, 1.040567, 0, 0.05882353, 1, 1,
0.4589689, -0.8646603, 3.794086, 0, 0.05098039, 1, 1,
0.4615853, -0.246963, 1.91144, 0, 0.04705882, 1, 1,
0.4642389, 1.016898, -0.523892, 0, 0.03921569, 1, 1,
0.4656886, 0.8820078, 0.4774267, 0, 0.03529412, 1, 1,
0.4711294, -0.2394117, 1.943946, 0, 0.02745098, 1, 1,
0.4768283, -0.04777623, 2.600899, 0, 0.02352941, 1, 1,
0.4786968, 0.3635708, 1.043327, 0, 0.01568628, 1, 1,
0.4808463, -1.143489, 1.558038, 0, 0.01176471, 1, 1,
0.4911224, -0.1093859, 2.132674, 0, 0.003921569, 1, 1,
0.4930391, 0.3292887, 0.4363319, 0.003921569, 0, 1, 1,
0.4978543, 0.3765681, 1.045662, 0.007843138, 0, 1, 1,
0.4996337, -1.467701, 2.18983, 0.01568628, 0, 1, 1,
0.5011787, 0.1534488, 1.101623, 0.01960784, 0, 1, 1,
0.5014162, 1.2679, 0.1685787, 0.02745098, 0, 1, 1,
0.5073069, 1.631654, 1.531711, 0.03137255, 0, 1, 1,
0.5077835, -0.4412163, 1.83909, 0.03921569, 0, 1, 1,
0.5102096, -1.415928, 3.99442, 0.04313726, 0, 1, 1,
0.5118313, -0.08602537, 1.481686, 0.05098039, 0, 1, 1,
0.5134573, 0.9225591, 1.514398, 0.05490196, 0, 1, 1,
0.5135285, -0.7906028, 0.7825021, 0.0627451, 0, 1, 1,
0.5174153, 0.1495848, -0.1594027, 0.06666667, 0, 1, 1,
0.518095, -0.0178716, -0.9375175, 0.07450981, 0, 1, 1,
0.518744, -0.54505, 2.106119, 0.07843138, 0, 1, 1,
0.5228862, 2.40021, -0.1226775, 0.08627451, 0, 1, 1,
0.5239739, -0.7324171, 2.938387, 0.09019608, 0, 1, 1,
0.5292867, -1.218479, 1.550116, 0.09803922, 0, 1, 1,
0.5314316, -0.3062209, 1.745865, 0.1058824, 0, 1, 1,
0.5314578, -0.4338332, 0.7864755, 0.1098039, 0, 1, 1,
0.53346, 1.22934, 0.2901371, 0.1176471, 0, 1, 1,
0.5336191, 0.3402722, 0.4532128, 0.1215686, 0, 1, 1,
0.534152, -0.8273164, 2.666391, 0.1294118, 0, 1, 1,
0.540381, -0.1423355, 1.925468, 0.1333333, 0, 1, 1,
0.5419081, -1.204044, 1.404947, 0.1411765, 0, 1, 1,
0.542531, 0.4690121, 2.303983, 0.145098, 0, 1, 1,
0.5436273, 1.321004, 0.3655863, 0.1529412, 0, 1, 1,
0.5455083, 0.7903524, 1.381534, 0.1568628, 0, 1, 1,
0.5482298, 0.9713271, -1.038242, 0.1647059, 0, 1, 1,
0.5564041, -1.286622, 0.7584978, 0.1686275, 0, 1, 1,
0.5719181, -0.3187902, 3.064987, 0.1764706, 0, 1, 1,
0.5727839, -0.04941965, 1.286752, 0.1803922, 0, 1, 1,
0.5736797, -0.8535838, 2.241077, 0.1882353, 0, 1, 1,
0.5782166, -0.6650987, 1.968651, 0.1921569, 0, 1, 1,
0.5787967, -1.091383, 3.573539, 0.2, 0, 1, 1,
0.5829813, 0.9458628, 0.9974845, 0.2078431, 0, 1, 1,
0.5856346, -0.8581861, 2.918509, 0.2117647, 0, 1, 1,
0.5868116, 0.2574107, 1.435985, 0.2196078, 0, 1, 1,
0.5880439, 0.13786, 0.3769853, 0.2235294, 0, 1, 1,
0.5882872, -1.136397, 4.033615, 0.2313726, 0, 1, 1,
0.590875, -1.690743, 1.828654, 0.2352941, 0, 1, 1,
0.5911359, -0.8639272, 2.789091, 0.2431373, 0, 1, 1,
0.5943536, 0.0607465, 1.954007, 0.2470588, 0, 1, 1,
0.5967048, -0.2512282, 3.069383, 0.254902, 0, 1, 1,
0.6027181, 0.4037508, 1.252108, 0.2588235, 0, 1, 1,
0.6056733, 0.5280498, 0.4667597, 0.2666667, 0, 1, 1,
0.6062045, 0.4084553, 1.515653, 0.2705882, 0, 1, 1,
0.609585, -0.2578693, 2.547731, 0.2784314, 0, 1, 1,
0.6111917, -0.1360099, -0.3978835, 0.282353, 0, 1, 1,
0.6120124, -0.08466222, 0.02756648, 0.2901961, 0, 1, 1,
0.6129896, 0.3331209, 0.4662012, 0.2941177, 0, 1, 1,
0.6215922, -1.785204, 2.517672, 0.3019608, 0, 1, 1,
0.6239693, 1.238855, 0.1069156, 0.3098039, 0, 1, 1,
0.6292904, 0.1006686, 0.5962486, 0.3137255, 0, 1, 1,
0.6343529, 0.683179, -0.1632867, 0.3215686, 0, 1, 1,
0.6349162, 3.15602, 0.01494067, 0.3254902, 0, 1, 1,
0.6370822, -0.7990713, 2.14123, 0.3333333, 0, 1, 1,
0.642933, 2.424872, 0.5246408, 0.3372549, 0, 1, 1,
0.6437036, 0.2531961, 2.856145, 0.345098, 0, 1, 1,
0.6443235, -0.5370229, 3.357914, 0.3490196, 0, 1, 1,
0.6457095, -1.270707, 3.534028, 0.3568628, 0, 1, 1,
0.6512231, -0.8173022, 3.418358, 0.3607843, 0, 1, 1,
0.6520708, 0.6273192, -0.8441631, 0.3686275, 0, 1, 1,
0.6524931, -1.867885, 2.50778, 0.372549, 0, 1, 1,
0.6542991, -1.236315, 3.355723, 0.3803922, 0, 1, 1,
0.6545429, -0.06870986, 1.934227, 0.3843137, 0, 1, 1,
0.6546755, 0.5709499, 1.58397, 0.3921569, 0, 1, 1,
0.6581356, -0.852262, -0.0793765, 0.3960784, 0, 1, 1,
0.6624512, 1.410849, 1.046448, 0.4039216, 0, 1, 1,
0.6635569, 0.4258402, 0.4709046, 0.4117647, 0, 1, 1,
0.6644933, -0.8527322, 2.248201, 0.4156863, 0, 1, 1,
0.6689847, -0.1170846, 2.058215, 0.4235294, 0, 1, 1,
0.6761486, 0.4682805, 1.091518, 0.427451, 0, 1, 1,
0.6777583, -0.2388997, 1.371582, 0.4352941, 0, 1, 1,
0.6820558, -0.149771, -0.8626281, 0.4392157, 0, 1, 1,
0.6888118, 0.7139528, 0.7546192, 0.4470588, 0, 1, 1,
0.6888818, 0.2533226, 0.7063133, 0.4509804, 0, 1, 1,
0.691614, -1.485559, 3.797492, 0.4588235, 0, 1, 1,
0.6918132, -0.593679, 3.259424, 0.4627451, 0, 1, 1,
0.6934898, -0.7258212, 2.402565, 0.4705882, 0, 1, 1,
0.7077653, 0.5360944, 2.559085, 0.4745098, 0, 1, 1,
0.7185829, -0.6188295, 4.209968, 0.4823529, 0, 1, 1,
0.7198781, 0.3356118, -1.58787, 0.4862745, 0, 1, 1,
0.7200563, 0.9964319, 0.8323693, 0.4941176, 0, 1, 1,
0.7229419, -0.1234858, 1.007374, 0.5019608, 0, 1, 1,
0.7278656, 0.530049, -0.1288329, 0.5058824, 0, 1, 1,
0.7292255, -0.7125787, 1.596664, 0.5137255, 0, 1, 1,
0.7345909, 1.248106, 3.134561, 0.5176471, 0, 1, 1,
0.7367951, 1.033307, 1.443527, 0.5254902, 0, 1, 1,
0.7379445, -1.378065, 3.026837, 0.5294118, 0, 1, 1,
0.7409344, -0.8287784, 2.927639, 0.5372549, 0, 1, 1,
0.7468401, 0.4876108, 2.68013, 0.5411765, 0, 1, 1,
0.7474284, 1.025518, 0.2189726, 0.5490196, 0, 1, 1,
0.7486165, 1.806185, 1.851496, 0.5529412, 0, 1, 1,
0.7526081, 0.2841093, 2.750425, 0.5607843, 0, 1, 1,
0.7531028, -0.504059, 2.802144, 0.5647059, 0, 1, 1,
0.7537257, 1.256455, 0.4261399, 0.572549, 0, 1, 1,
0.7572712, 0.7030411, 2.528157, 0.5764706, 0, 1, 1,
0.76059, -0.06714228, 1.49341, 0.5843138, 0, 1, 1,
0.764073, 1.221667, 2.714689, 0.5882353, 0, 1, 1,
0.7645741, 0.0870308, 1.962507, 0.5960785, 0, 1, 1,
0.7660246, -0.5401635, 2.687832, 0.6039216, 0, 1, 1,
0.7703466, -0.0805134, 1.305477, 0.6078432, 0, 1, 1,
0.7710316, 1.770555, -2.162675, 0.6156863, 0, 1, 1,
0.7713713, -0.6919875, 3.002976, 0.6196079, 0, 1, 1,
0.7722611, -0.9414594, 2.596721, 0.627451, 0, 1, 1,
0.7861515, 0.4455002, 3.087055, 0.6313726, 0, 1, 1,
0.7905133, -0.5903893, 2.013325, 0.6392157, 0, 1, 1,
0.7908304, 0.3341521, 1.748294, 0.6431373, 0, 1, 1,
0.7996162, -1.836532, -0.1340242, 0.6509804, 0, 1, 1,
0.8014789, 1.017162, 1.136363, 0.654902, 0, 1, 1,
0.8022972, 0.3337176, 0.7116399, 0.6627451, 0, 1, 1,
0.8030682, -0.1589593, 2.291731, 0.6666667, 0, 1, 1,
0.8145192, 0.9900507, -0.5349647, 0.6745098, 0, 1, 1,
0.814984, 1.139208, 1.038357, 0.6784314, 0, 1, 1,
0.8185151, -0.1508163, 3.446735, 0.6862745, 0, 1, 1,
0.823015, 0.6894452, 0.4293805, 0.6901961, 0, 1, 1,
0.8276693, -1.108267, 1.994355, 0.6980392, 0, 1, 1,
0.8298488, -2.136052, 4.412798, 0.7058824, 0, 1, 1,
0.8525957, 1.182306, -0.09018067, 0.7098039, 0, 1, 1,
0.8558972, -0.1758489, 0.7931406, 0.7176471, 0, 1, 1,
0.8566021, -0.7242492, 2.20467, 0.7215686, 0, 1, 1,
0.858933, -0.5476684, 1.854369, 0.7294118, 0, 1, 1,
0.8617817, -1.020683, 2.696859, 0.7333333, 0, 1, 1,
0.8702376, 1.201018, 0.1792037, 0.7411765, 0, 1, 1,
0.8705311, -0.8237634, 1.765062, 0.7450981, 0, 1, 1,
0.8778801, -0.3165244, 2.482317, 0.7529412, 0, 1, 1,
0.8805475, -2.079859, 2.437785, 0.7568628, 0, 1, 1,
0.8814916, 0.7776799, 0.4226125, 0.7647059, 0, 1, 1,
0.8870371, -1.240594, 3.662263, 0.7686275, 0, 1, 1,
0.8960423, -1.071258, 3.861782, 0.7764706, 0, 1, 1,
0.9030924, 0.445997, -0.2842769, 0.7803922, 0, 1, 1,
0.9059855, -0.2551888, 2.847069, 0.7882353, 0, 1, 1,
0.906588, 0.222249, 2.363163, 0.7921569, 0, 1, 1,
0.9069137, -0.3892824, 0.8688056, 0.8, 0, 1, 1,
0.9095744, -0.05342304, 2.261686, 0.8078431, 0, 1, 1,
0.9191071, 1.104081, -0.008488005, 0.8117647, 0, 1, 1,
0.9219558, 0.2201131, -1.554291, 0.8196079, 0, 1, 1,
0.923231, -1.826538, 2.024978, 0.8235294, 0, 1, 1,
0.9270378, -0.5913043, 0.1733495, 0.8313726, 0, 1, 1,
0.928808, 0.1768219, 1.855034, 0.8352941, 0, 1, 1,
0.9304439, 0.978711, 0.6133342, 0.8431373, 0, 1, 1,
0.935213, 0.3193289, 1.926412, 0.8470588, 0, 1, 1,
0.9356495, -1.035861, 2.928904, 0.854902, 0, 1, 1,
0.936115, -0.341174, 2.218641, 0.8588235, 0, 1, 1,
0.9446689, -0.3373156, 3.165599, 0.8666667, 0, 1, 1,
0.9541731, -1.056448, 1.766192, 0.8705882, 0, 1, 1,
0.9543426, -0.05285046, 0.6887289, 0.8784314, 0, 1, 1,
0.9559073, -2.213812, 5.17795, 0.8823529, 0, 1, 1,
0.9659212, 0.5063068, 0.926627, 0.8901961, 0, 1, 1,
0.9684752, 1.035889, -0.4148171, 0.8941177, 0, 1, 1,
0.976994, -1.807219, 1.178799, 0.9019608, 0, 1, 1,
0.9805034, 0.150272, 1.28331, 0.9098039, 0, 1, 1,
0.9814551, -0.548272, 1.50168, 0.9137255, 0, 1, 1,
0.9849708, 0.45567, 1.633006, 0.9215686, 0, 1, 1,
0.985893, -0.4647452, 4.07332, 0.9254902, 0, 1, 1,
0.9890515, -0.134378, 0.6304761, 0.9333333, 0, 1, 1,
0.9980415, 0.2811934, -0.2296453, 0.9372549, 0, 1, 1,
0.9996179, 2.63802, 0.3455905, 0.945098, 0, 1, 1,
1.000099, -0.1520395, 2.90378, 0.9490196, 0, 1, 1,
1.000692, 0.5626072, 1.772329, 0.9568627, 0, 1, 1,
1.01064, 0.3710783, 0.8940095, 0.9607843, 0, 1, 1,
1.01111, 0.639665, 1.956226, 0.9686275, 0, 1, 1,
1.013409, 1.335299, 0.3355747, 0.972549, 0, 1, 1,
1.016927, -0.5306304, 2.308384, 0.9803922, 0, 1, 1,
1.018208, -0.7174346, 2.664293, 0.9843137, 0, 1, 1,
1.025987, 1.280138, 0.8914702, 0.9921569, 0, 1, 1,
1.026784, 1.118933, 1.201799, 0.9960784, 0, 1, 1,
1.032293, 0.03204226, 0.9186816, 1, 0, 0.9960784, 1,
1.041704, 0.7729225, 1.241294, 1, 0, 0.9882353, 1,
1.043485, -0.02153752, 1.677736, 1, 0, 0.9843137, 1,
1.050085, -1.592724, 3.538581, 1, 0, 0.9764706, 1,
1.056709, 0.254261, 0.8186973, 1, 0, 0.972549, 1,
1.057433, 0.2540858, 0.1636594, 1, 0, 0.9647059, 1,
1.06175, 1.707047, -0.5914453, 1, 0, 0.9607843, 1,
1.065626, -1.314753, 1.713339, 1, 0, 0.9529412, 1,
1.066831, -1.620406, 1.156995, 1, 0, 0.9490196, 1,
1.067383, 0.4117507, -0.5063112, 1, 0, 0.9411765, 1,
1.073554, 1.858929, 0.06389698, 1, 0, 0.9372549, 1,
1.075951, 0.1573693, 1.163822, 1, 0, 0.9294118, 1,
1.076804, -1.623247, 3.095816, 1, 0, 0.9254902, 1,
1.085735, -0.5267048, 1.846236, 1, 0, 0.9176471, 1,
1.088099, -1.175789, 0.986747, 1, 0, 0.9137255, 1,
1.090467, -1.821676, 1.888542, 1, 0, 0.9058824, 1,
1.094587, 1.321196, -0.3509301, 1, 0, 0.9019608, 1,
1.106295, -0.155844, 2.682615, 1, 0, 0.8941177, 1,
1.12042, -0.3540877, 0.4855099, 1, 0, 0.8862745, 1,
1.120888, 0.6871373, 0.4980056, 1, 0, 0.8823529, 1,
1.129009, 0.3847972, 1.329512, 1, 0, 0.8745098, 1,
1.130191, 1.022155, 0.9350467, 1, 0, 0.8705882, 1,
1.134766, -0.3957096, 3.262819, 1, 0, 0.8627451, 1,
1.136603, -1.048756, 2.583612, 1, 0, 0.8588235, 1,
1.141083, -1.563524, 4.36938, 1, 0, 0.8509804, 1,
1.143355, -1.350739, 4.208226, 1, 0, 0.8470588, 1,
1.150447, -0.1204808, 1.950932, 1, 0, 0.8392157, 1,
1.157794, -1.238139, 2.916879, 1, 0, 0.8352941, 1,
1.15844, 0.2771734, 0.4619427, 1, 0, 0.827451, 1,
1.159498, -0.9606466, 2.709112, 1, 0, 0.8235294, 1,
1.166447, -0.1202741, 1.940451, 1, 0, 0.8156863, 1,
1.166824, -1.149138, 2.649352, 1, 0, 0.8117647, 1,
1.173002, -1.073412, 1.75134, 1, 0, 0.8039216, 1,
1.17771, -0.7801352, 3.214741, 1, 0, 0.7960784, 1,
1.178751, -0.141562, 2.602248, 1, 0, 0.7921569, 1,
1.179363, 1.954203, 1.427076, 1, 0, 0.7843137, 1,
1.184034, 0.3311387, 0.8832396, 1, 0, 0.7803922, 1,
1.187859, 1.020073, -0.06207846, 1, 0, 0.772549, 1,
1.197997, 0.5147544, 0.2389712, 1, 0, 0.7686275, 1,
1.200121, 0.870185, 1.597718, 1, 0, 0.7607843, 1,
1.20512, -0.8574629, 2.067771, 1, 0, 0.7568628, 1,
1.205252, -0.5933714, 1.818311, 1, 0, 0.7490196, 1,
1.206759, 0.2151863, 2.005109, 1, 0, 0.7450981, 1,
1.215689, 0.1785615, 1.044326, 1, 0, 0.7372549, 1,
1.224698, 1.431663, -1.551287, 1, 0, 0.7333333, 1,
1.236588, 0.168269, 1.726314, 1, 0, 0.7254902, 1,
1.240554, 0.6914573, 1.901548, 1, 0, 0.7215686, 1,
1.251749, 1.352701, -0.2021606, 1, 0, 0.7137255, 1,
1.25553, 1.506759, 1.200935, 1, 0, 0.7098039, 1,
1.256764, 0.41849, -0.08789498, 1, 0, 0.7019608, 1,
1.25894, -0.2749724, 1.578553, 1, 0, 0.6941177, 1,
1.263631, -0.5665722, 2.841218, 1, 0, 0.6901961, 1,
1.270124, -0.6135839, -0.2566612, 1, 0, 0.682353, 1,
1.281199, -0.5968301, 2.380074, 1, 0, 0.6784314, 1,
1.288618, 0.6564868, 2.018167, 1, 0, 0.6705883, 1,
1.292734, -0.1500694, 0.8203576, 1, 0, 0.6666667, 1,
1.296434, -0.9858187, 0.3602721, 1, 0, 0.6588235, 1,
1.300344, -1.544704, 1.83963, 1, 0, 0.654902, 1,
1.305282, -1.158666, 2.173843, 1, 0, 0.6470588, 1,
1.313261, 0.1798577, 2.040941, 1, 0, 0.6431373, 1,
1.314611, 0.1395963, 1.35651, 1, 0, 0.6352941, 1,
1.323044, -1.243123, 1.403127, 1, 0, 0.6313726, 1,
1.333082, 0.1459348, 0.6548802, 1, 0, 0.6235294, 1,
1.343661, -0.01898932, 1.543946, 1, 0, 0.6196079, 1,
1.359055, 1.379601, -0.7052406, 1, 0, 0.6117647, 1,
1.371845, 0.3991627, 0.5726631, 1, 0, 0.6078432, 1,
1.372842, -0.4298999, 2.701442, 1, 0, 0.6, 1,
1.372859, -0.4340697, 1.842651, 1, 0, 0.5921569, 1,
1.377791, 0.3461119, 2.224164, 1, 0, 0.5882353, 1,
1.386788, 1.47725, 2.51065, 1, 0, 0.5803922, 1,
1.389179, 1.358315, -0.786736, 1, 0, 0.5764706, 1,
1.397797, 1.322969, 0.9474912, 1, 0, 0.5686275, 1,
1.406563, 0.5281988, 1.603779, 1, 0, 0.5647059, 1,
1.409728, 0.8183016, 0.2641383, 1, 0, 0.5568628, 1,
1.412641, -0.3372746, 2.692015, 1, 0, 0.5529412, 1,
1.425969, 0.00874794, 1.042843, 1, 0, 0.5450981, 1,
1.43032, 0.6351427, 2.519182, 1, 0, 0.5411765, 1,
1.431677, -0.4850864, 1.451419, 1, 0, 0.5333334, 1,
1.443565, -0.8172011, 2.166686, 1, 0, 0.5294118, 1,
1.450702, 0.7260079, 0.9292313, 1, 0, 0.5215687, 1,
1.459837, 1.400434, 1.453116, 1, 0, 0.5176471, 1,
1.465085, -0.6096976, 1.017107, 1, 0, 0.509804, 1,
1.471666, -0.2811255, 1.013513, 1, 0, 0.5058824, 1,
1.47227, 0.8374081, 0.7112437, 1, 0, 0.4980392, 1,
1.473195, -1.514614, 2.214736, 1, 0, 0.4901961, 1,
1.476, 0.01284196, 2.096348, 1, 0, 0.4862745, 1,
1.487546, 1.080157, -0.4449263, 1, 0, 0.4784314, 1,
1.487632, -0.04728336, 0.7069188, 1, 0, 0.4745098, 1,
1.511945, -0.9266332, 3.50033, 1, 0, 0.4666667, 1,
1.517908, 1.598452, 2.223137, 1, 0, 0.4627451, 1,
1.518443, -1.961012, 3.64366, 1, 0, 0.454902, 1,
1.520212, 0.06744752, 0.8149184, 1, 0, 0.4509804, 1,
1.520758, 0.4839984, 2.541194, 1, 0, 0.4431373, 1,
1.521092, -0.7758847, 2.856233, 1, 0, 0.4392157, 1,
1.52285, 0.1633419, 1.816417, 1, 0, 0.4313726, 1,
1.529737, -0.5145657, 1.718089, 1, 0, 0.427451, 1,
1.549977, -0.0006205207, 3.179098, 1, 0, 0.4196078, 1,
1.563076, -0.729538, 1.815722, 1, 0, 0.4156863, 1,
1.564797, -0.2336468, 1.778664, 1, 0, 0.4078431, 1,
1.566949, -0.5749185, 0.07306885, 1, 0, 0.4039216, 1,
1.57542, -1.385208, 2.435924, 1, 0, 0.3960784, 1,
1.580849, 0.603262, 1.55517, 1, 0, 0.3882353, 1,
1.594677, -2.056911, 0.7980258, 1, 0, 0.3843137, 1,
1.596481, -0.0314706, 0.9977694, 1, 0, 0.3764706, 1,
1.606199, -0.8675272, 1.17903, 1, 0, 0.372549, 1,
1.609891, -0.9429174, 3.184991, 1, 0, 0.3647059, 1,
1.629839, -0.6331135, 3.324342, 1, 0, 0.3607843, 1,
1.630808, 0.8390176, 1.207257, 1, 0, 0.3529412, 1,
1.634108, 0.3156237, 1.506124, 1, 0, 0.3490196, 1,
1.635147, 0.2739383, 1.537346, 1, 0, 0.3411765, 1,
1.645181, 0.1910161, 1.189968, 1, 0, 0.3372549, 1,
1.645441, -1.173723, 2.061171, 1, 0, 0.3294118, 1,
1.648726, -0.1111554, 1.718721, 1, 0, 0.3254902, 1,
1.649111, -0.04676852, 2.522339, 1, 0, 0.3176471, 1,
1.655696, -0.5833927, 1.694662, 1, 0, 0.3137255, 1,
1.667594, 1.490663, 1.958634, 1, 0, 0.3058824, 1,
1.671836, -1.719328, 1.720197, 1, 0, 0.2980392, 1,
1.704393, -1.400888, 1.248059, 1, 0, 0.2941177, 1,
1.706164, 1.843252, 0.8822103, 1, 0, 0.2862745, 1,
1.714213, 0.487354, 0.9686033, 1, 0, 0.282353, 1,
1.714218, 0.4486305, 1.092195, 1, 0, 0.2745098, 1,
1.725116, -1.122367, 1.88191, 1, 0, 0.2705882, 1,
1.742822, -1.201522, 2.199377, 1, 0, 0.2627451, 1,
1.744797, -1.127424, 2.600371, 1, 0, 0.2588235, 1,
1.745549, -0.2768323, 1.109236, 1, 0, 0.2509804, 1,
1.762937, -0.7827321, 0.8601455, 1, 0, 0.2470588, 1,
1.778739, -0.4026459, 0.2142252, 1, 0, 0.2392157, 1,
1.793118, 0.5442623, 1.31302, 1, 0, 0.2352941, 1,
1.820944, -0.6575986, 1.545226, 1, 0, 0.227451, 1,
1.822737, 0.6516182, -0.6390036, 1, 0, 0.2235294, 1,
1.835649, 0.9235795, 2.056178, 1, 0, 0.2156863, 1,
1.841492, 0.2960174, 0.5014877, 1, 0, 0.2117647, 1,
1.866293, 0.5288765, 1.739883, 1, 0, 0.2039216, 1,
1.874906, 1.196102, 2.587067, 1, 0, 0.1960784, 1,
1.898371, -0.5487437, 2.172908, 1, 0, 0.1921569, 1,
1.908236, -1.134703, 1.218547, 1, 0, 0.1843137, 1,
1.938847, 0.3496409, 3.508473, 1, 0, 0.1803922, 1,
1.951394, 0.2998843, 0.1115928, 1, 0, 0.172549, 1,
1.993033, 0.1352731, 0.6783842, 1, 0, 0.1686275, 1,
2.017313, -0.01564371, 0.9517961, 1, 0, 0.1607843, 1,
2.054131, 0.03617209, 1.647155, 1, 0, 0.1568628, 1,
2.079327, 0.6880561, 2.643377, 1, 0, 0.1490196, 1,
2.111723, 0.3117613, 2.782418, 1, 0, 0.145098, 1,
2.113662, -0.1716068, 1.200999, 1, 0, 0.1372549, 1,
2.123214, 0.332891, 1.437466, 1, 0, 0.1333333, 1,
2.1704, -0.5565951, 2.578625, 1, 0, 0.1254902, 1,
2.170864, 0.5702567, 1.482599, 1, 0, 0.1215686, 1,
2.182337, -0.8125106, 1.267898, 1, 0, 0.1137255, 1,
2.223895, -1.299916, 2.817409, 1, 0, 0.1098039, 1,
2.228598, 0.411651, 2.062599, 1, 0, 0.1019608, 1,
2.231573, 1.530248, 2.751813, 1, 0, 0.09411765, 1,
2.23273, 0.07125706, 2.532095, 1, 0, 0.09019608, 1,
2.238706, 0.04259409, 2.122068, 1, 0, 0.08235294, 1,
2.309856, 0.8073433, 1.227881, 1, 0, 0.07843138, 1,
2.334238, -0.6053494, 3.438024, 1, 0, 0.07058824, 1,
2.343938, 1.542202, 0.7349712, 1, 0, 0.06666667, 1,
2.347734, 0.4119931, 1.500423, 1, 0, 0.05882353, 1,
2.362174, -0.6494339, 1.463926, 1, 0, 0.05490196, 1,
2.379, -0.1681004, 0.4943749, 1, 0, 0.04705882, 1,
2.483059, 1.459598, 3.076663, 1, 0, 0.04313726, 1,
2.628011, 0.1554896, 1.449049, 1, 0, 0.03529412, 1,
2.658156, -0.01137633, 0.8933458, 1, 0, 0.03137255, 1,
2.694918, -1.016247, 3.573795, 1, 0, 0.02352941, 1,
2.887639, 0.2513321, 3.694967, 1, 0, 0.01960784, 1,
3.041841, 0.8432894, 1.715915, 1, 0, 0.01176471, 1,
3.112263, -0.1271382, 2.172248, 1, 0, 0.007843138, 1
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
-0.2477809, -4.417391, -7.551544, 0, -0.5, 0.5, 0.5,
-0.2477809, -4.417391, -7.551544, 1, -0.5, 0.5, 0.5,
-0.2477809, -4.417391, -7.551544, 1, 1.5, 0.5, 0.5,
-0.2477809, -4.417391, -7.551544, 0, 1.5, 0.5, 0.5
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
-4.746881, -0.08186424, -7.551544, 0, -0.5, 0.5, 0.5,
-4.746881, -0.08186424, -7.551544, 1, -0.5, 0.5, 0.5,
-4.746881, -0.08186424, -7.551544, 1, 1.5, 0.5, 0.5,
-4.746881, -0.08186424, -7.551544, 0, 1.5, 0.5, 0.5
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
-4.746881, -4.417391, -0.1301489, 0, -0.5, 0.5, 0.5,
-4.746881, -4.417391, -0.1301489, 1, -0.5, 0.5, 0.5,
-4.746881, -4.417391, -0.1301489, 1, 1.5, 0.5, 0.5,
-4.746881, -4.417391, -0.1301489, 0, 1.5, 0.5, 0.5
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
-3, -3.416885, -5.838914,
3, -3.416885, -5.838914,
-3, -3.416885, -5.838914,
-3, -3.583636, -6.124353,
-2, -3.416885, -5.838914,
-2, -3.583636, -6.124353,
-1, -3.416885, -5.838914,
-1, -3.583636, -6.124353,
0, -3.416885, -5.838914,
0, -3.583636, -6.124353,
1, -3.416885, -5.838914,
1, -3.583636, -6.124353,
2, -3.416885, -5.838914,
2, -3.583636, -6.124353,
3, -3.416885, -5.838914,
3, -3.583636, -6.124353
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
-3, -3.917138, -6.69523, 0, -0.5, 0.5, 0.5,
-3, -3.917138, -6.69523, 1, -0.5, 0.5, 0.5,
-3, -3.917138, -6.69523, 1, 1.5, 0.5, 0.5,
-3, -3.917138, -6.69523, 0, 1.5, 0.5, 0.5,
-2, -3.917138, -6.69523, 0, -0.5, 0.5, 0.5,
-2, -3.917138, -6.69523, 1, -0.5, 0.5, 0.5,
-2, -3.917138, -6.69523, 1, 1.5, 0.5, 0.5,
-2, -3.917138, -6.69523, 0, 1.5, 0.5, 0.5,
-1, -3.917138, -6.69523, 0, -0.5, 0.5, 0.5,
-1, -3.917138, -6.69523, 1, -0.5, 0.5, 0.5,
-1, -3.917138, -6.69523, 1, 1.5, 0.5, 0.5,
-1, -3.917138, -6.69523, 0, 1.5, 0.5, 0.5,
0, -3.917138, -6.69523, 0, -0.5, 0.5, 0.5,
0, -3.917138, -6.69523, 1, -0.5, 0.5, 0.5,
0, -3.917138, -6.69523, 1, 1.5, 0.5, 0.5,
0, -3.917138, -6.69523, 0, 1.5, 0.5, 0.5,
1, -3.917138, -6.69523, 0, -0.5, 0.5, 0.5,
1, -3.917138, -6.69523, 1, -0.5, 0.5, 0.5,
1, -3.917138, -6.69523, 1, 1.5, 0.5, 0.5,
1, -3.917138, -6.69523, 0, 1.5, 0.5, 0.5,
2, -3.917138, -6.69523, 0, -0.5, 0.5, 0.5,
2, -3.917138, -6.69523, 1, -0.5, 0.5, 0.5,
2, -3.917138, -6.69523, 1, 1.5, 0.5, 0.5,
2, -3.917138, -6.69523, 0, 1.5, 0.5, 0.5,
3, -3.917138, -6.69523, 0, -0.5, 0.5, 0.5,
3, -3.917138, -6.69523, 1, -0.5, 0.5, 0.5,
3, -3.917138, -6.69523, 1, 1.5, 0.5, 0.5,
3, -3.917138, -6.69523, 0, 1.5, 0.5, 0.5
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
-3.708627, -3, -5.838914,
-3.708627, 3, -5.838914,
-3.708627, -3, -5.838914,
-3.881669, -3, -6.124353,
-3.708627, -2, -5.838914,
-3.881669, -2, -6.124353,
-3.708627, -1, -5.838914,
-3.881669, -1, -6.124353,
-3.708627, 0, -5.838914,
-3.881669, 0, -6.124353,
-3.708627, 1, -5.838914,
-3.881669, 1, -6.124353,
-3.708627, 2, -5.838914,
-3.881669, 2, -6.124353,
-3.708627, 3, -5.838914,
-3.881669, 3, -6.124353
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
-4.227754, -3, -6.69523, 0, -0.5, 0.5, 0.5,
-4.227754, -3, -6.69523, 1, -0.5, 0.5, 0.5,
-4.227754, -3, -6.69523, 1, 1.5, 0.5, 0.5,
-4.227754, -3, -6.69523, 0, 1.5, 0.5, 0.5,
-4.227754, -2, -6.69523, 0, -0.5, 0.5, 0.5,
-4.227754, -2, -6.69523, 1, -0.5, 0.5, 0.5,
-4.227754, -2, -6.69523, 1, 1.5, 0.5, 0.5,
-4.227754, -2, -6.69523, 0, 1.5, 0.5, 0.5,
-4.227754, -1, -6.69523, 0, -0.5, 0.5, 0.5,
-4.227754, -1, -6.69523, 1, -0.5, 0.5, 0.5,
-4.227754, -1, -6.69523, 1, 1.5, 0.5, 0.5,
-4.227754, -1, -6.69523, 0, 1.5, 0.5, 0.5,
-4.227754, 0, -6.69523, 0, -0.5, 0.5, 0.5,
-4.227754, 0, -6.69523, 1, -0.5, 0.5, 0.5,
-4.227754, 0, -6.69523, 1, 1.5, 0.5, 0.5,
-4.227754, 0, -6.69523, 0, 1.5, 0.5, 0.5,
-4.227754, 1, -6.69523, 0, -0.5, 0.5, 0.5,
-4.227754, 1, -6.69523, 1, -0.5, 0.5, 0.5,
-4.227754, 1, -6.69523, 1, 1.5, 0.5, 0.5,
-4.227754, 1, -6.69523, 0, 1.5, 0.5, 0.5,
-4.227754, 2, -6.69523, 0, -0.5, 0.5, 0.5,
-4.227754, 2, -6.69523, 1, -0.5, 0.5, 0.5,
-4.227754, 2, -6.69523, 1, 1.5, 0.5, 0.5,
-4.227754, 2, -6.69523, 0, 1.5, 0.5, 0.5,
-4.227754, 3, -6.69523, 0, -0.5, 0.5, 0.5,
-4.227754, 3, -6.69523, 1, -0.5, 0.5, 0.5,
-4.227754, 3, -6.69523, 1, 1.5, 0.5, 0.5,
-4.227754, 3, -6.69523, 0, 1.5, 0.5, 0.5
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
-3.708627, -3.416885, -4,
-3.708627, -3.416885, 4,
-3.708627, -3.416885, -4,
-3.881669, -3.583636, -4,
-3.708627, -3.416885, -2,
-3.881669, -3.583636, -2,
-3.708627, -3.416885, 0,
-3.881669, -3.583636, 0,
-3.708627, -3.416885, 2,
-3.881669, -3.583636, 2,
-3.708627, -3.416885, 4,
-3.881669, -3.583636, 4
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
-4.227754, -3.917138, -4, 0, -0.5, 0.5, 0.5,
-4.227754, -3.917138, -4, 1, -0.5, 0.5, 0.5,
-4.227754, -3.917138, -4, 1, 1.5, 0.5, 0.5,
-4.227754, -3.917138, -4, 0, 1.5, 0.5, 0.5,
-4.227754, -3.917138, -2, 0, -0.5, 0.5, 0.5,
-4.227754, -3.917138, -2, 1, -0.5, 0.5, 0.5,
-4.227754, -3.917138, -2, 1, 1.5, 0.5, 0.5,
-4.227754, -3.917138, -2, 0, 1.5, 0.5, 0.5,
-4.227754, -3.917138, 0, 0, -0.5, 0.5, 0.5,
-4.227754, -3.917138, 0, 1, -0.5, 0.5, 0.5,
-4.227754, -3.917138, 0, 1, 1.5, 0.5, 0.5,
-4.227754, -3.917138, 0, 0, 1.5, 0.5, 0.5,
-4.227754, -3.917138, 2, 0, -0.5, 0.5, 0.5,
-4.227754, -3.917138, 2, 1, -0.5, 0.5, 0.5,
-4.227754, -3.917138, 2, 1, 1.5, 0.5, 0.5,
-4.227754, -3.917138, 2, 0, 1.5, 0.5, 0.5,
-4.227754, -3.917138, 4, 0, -0.5, 0.5, 0.5,
-4.227754, -3.917138, 4, 1, -0.5, 0.5, 0.5,
-4.227754, -3.917138, 4, 1, 1.5, 0.5, 0.5,
-4.227754, -3.917138, 4, 0, 1.5, 0.5, 0.5
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
-3.708627, -3.416885, -5.838914,
-3.708627, 3.253156, -5.838914,
-3.708627, -3.416885, 5.578617,
-3.708627, 3.253156, 5.578617,
-3.708627, -3.416885, -5.838914,
-3.708627, -3.416885, 5.578617,
-3.708627, 3.253156, -5.838914,
-3.708627, 3.253156, 5.578617,
-3.708627, -3.416885, -5.838914,
3.213065, -3.416885, -5.838914,
-3.708627, -3.416885, 5.578617,
3.213065, -3.416885, 5.578617,
-3.708627, 3.253156, -5.838914,
3.213065, 3.253156, -5.838914,
-3.708627, 3.253156, 5.578617,
3.213065, 3.253156, 5.578617,
3.213065, -3.416885, -5.838914,
3.213065, 3.253156, -5.838914,
3.213065, -3.416885, 5.578617,
3.213065, 3.253156, 5.578617,
3.213065, -3.416885, -5.838914,
3.213065, -3.416885, 5.578617,
3.213065, 3.253156, -5.838914,
3.213065, 3.253156, 5.578617
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
var radius = 7.969725;
var distance = 35.45821;
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
mvMatrix.translate( 0.2477809, 0.08186424, 0.1301489 );
mvMatrix.scale( 1.24493, 1.2919, 0.7547186 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.45821);
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
Formothion<-read.table("Formothion.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Formothion$V2
```

```
## Error in eval(expr, envir, enclos): object 'Formothion' not found
```

```r
y<-Formothion$V3
```

```
## Error in eval(expr, envir, enclos): object 'Formothion' not found
```

```r
z<-Formothion$V4
```

```
## Error in eval(expr, envir, enclos): object 'Formothion' not found
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
-3.607825, 0.15385, -1.663324, 0, 0, 1, 1, 1,
-3.217735, -0.5817524, -3.05475, 1, 0, 0, 1, 1,
-3.181891, -1.587338, -2.655923, 1, 0, 0, 1, 1,
-3.170808, -0.7749694, -2.243013, 1, 0, 0, 1, 1,
-2.552777, 1.288178, -1.578255, 1, 0, 0, 1, 1,
-2.477316, 0.5722736, -1.581901, 1, 0, 0, 1, 1,
-2.464359, 1.659812, -1.000891, 0, 0, 0, 1, 1,
-2.424244, 0.3724337, -0.5776259, 0, 0, 0, 1, 1,
-2.415125, 0.3541338, -1.032167, 0, 0, 0, 1, 1,
-2.37524, -0.4763831, -0.8171324, 0, 0, 0, 1, 1,
-2.360119, -0.8338983, -3.715774, 0, 0, 0, 1, 1,
-2.305131, 1.020052, -0.8318537, 0, 0, 0, 1, 1,
-2.295683, 0.2502384, -1.871248, 0, 0, 0, 1, 1,
-2.252046, -0.4704491, -2.075539, 1, 1, 1, 1, 1,
-2.25032, 0.9186769, -2.329941, 1, 1, 1, 1, 1,
-2.139969, 0.3938291, -2.713255, 1, 1, 1, 1, 1,
-2.130262, -0.9227421, -2.66712, 1, 1, 1, 1, 1,
-2.089164, 0.5309688, -0.3692416, 1, 1, 1, 1, 1,
-2.076318, 0.07029145, -3.10205, 1, 1, 1, 1, 1,
-2.034495, 1.215147, -2.924075, 1, 1, 1, 1, 1,
-2.01516, -0.3195653, -2.393477, 1, 1, 1, 1, 1,
-2.014807, -0.6643689, -1.51521, 1, 1, 1, 1, 1,
-2.008874, -0.421617, -0.738058, 1, 1, 1, 1, 1,
-1.977617, 0.01826952, -1.967148, 1, 1, 1, 1, 1,
-1.976331, -1.765847, -3.708504, 1, 1, 1, 1, 1,
-1.971029, 0.6216527, -0.8285021, 1, 1, 1, 1, 1,
-1.958753, 0.03003364, -1.540337, 1, 1, 1, 1, 1,
-1.936528, -0.6763985, -2.412466, 1, 1, 1, 1, 1,
-1.936119, -0.5265575, -2.244963, 0, 0, 1, 1, 1,
-1.891675, -1.397097, -3.233157, 1, 0, 0, 1, 1,
-1.890501, -0.4258095, -3.161703, 1, 0, 0, 1, 1,
-1.871005, 0.3130051, -2.446873, 1, 0, 0, 1, 1,
-1.849965, 1.984212, -0.7491453, 1, 0, 0, 1, 1,
-1.849255, 1.302018, -0.1875381, 1, 0, 0, 1, 1,
-1.839436, 0.5753034, -1.635254, 0, 0, 0, 1, 1,
-1.830507, -0.7669808, -2.524753, 0, 0, 0, 1, 1,
-1.827439, 0.3647693, -0.9322405, 0, 0, 0, 1, 1,
-1.815702, 0.2056055, -0.6569273, 0, 0, 0, 1, 1,
-1.807462, 0.6070346, -1.250806, 0, 0, 0, 1, 1,
-1.803035, 0.2531482, 0.4341031, 0, 0, 0, 1, 1,
-1.796455, 0.6573499, -1.560462, 0, 0, 0, 1, 1,
-1.790817, 0.09844173, -3.02262, 1, 1, 1, 1, 1,
-1.748428, -1.126461, -3.857901, 1, 1, 1, 1, 1,
-1.713516, -0.6294201, -1.279083, 1, 1, 1, 1, 1,
-1.712709, 0.9191713, -1.304529, 1, 1, 1, 1, 1,
-1.711519, -1.268714, -2.986675, 1, 1, 1, 1, 1,
-1.700457, -0.7955039, -0.04403117, 1, 1, 1, 1, 1,
-1.700403, -0.8559718, -3.001713, 1, 1, 1, 1, 1,
-1.689586, 0.953235, -0.8915083, 1, 1, 1, 1, 1,
-1.676787, 0.230216, -1.305436, 1, 1, 1, 1, 1,
-1.65525, -0.9090155, -1.037381, 1, 1, 1, 1, 1,
-1.651761, 1.133202, 0.5048299, 1, 1, 1, 1, 1,
-1.64286, -1.732801, -1.958566, 1, 1, 1, 1, 1,
-1.642627, -2.16665, -2.122682, 1, 1, 1, 1, 1,
-1.638694, 0.5654458, -2.875472, 1, 1, 1, 1, 1,
-1.633787, -0.3250955, -1.818405, 1, 1, 1, 1, 1,
-1.626381, 3.088281, 0.008869035, 0, 0, 1, 1, 1,
-1.621501, 1.406325, -0.5324789, 1, 0, 0, 1, 1,
-1.617473, 1.718118, -1.405376, 1, 0, 0, 1, 1,
-1.611353, 2.814052, -0.07480103, 1, 0, 0, 1, 1,
-1.602168, 1.62001, -0.5725505, 1, 0, 0, 1, 1,
-1.588229, 0.7229786, -2.441142, 1, 0, 0, 1, 1,
-1.583038, -1.607468, -2.755701, 0, 0, 0, 1, 1,
-1.581335, -0.9784741, -3.922218, 0, 0, 0, 1, 1,
-1.574799, 1.229225, -0.3867611, 0, 0, 0, 1, 1,
-1.563814, -0.9769734, -1.150165, 0, 0, 0, 1, 1,
-1.562837, -1.082954, -3.547099, 0, 0, 0, 1, 1,
-1.560228, -0.2648928, -2.951706, 0, 0, 0, 1, 1,
-1.559621, 0.5306417, 0.6098437, 0, 0, 0, 1, 1,
-1.546482, -0.4792106, 0.1894738, 1, 1, 1, 1, 1,
-1.544379, -0.1355074, -3.613134, 1, 1, 1, 1, 1,
-1.538941, -0.553016, -3.005331, 1, 1, 1, 1, 1,
-1.535931, 1.597747, -1.195428, 1, 1, 1, 1, 1,
-1.528339, 0.8659712, -0.9884246, 1, 1, 1, 1, 1,
-1.513031, -0.2424534, -1.185063, 1, 1, 1, 1, 1,
-1.509903, -0.3532535, -1.35767, 1, 1, 1, 1, 1,
-1.509832, 0.1107201, -1.653911, 1, 1, 1, 1, 1,
-1.488368, 0.5919363, -1.925369, 1, 1, 1, 1, 1,
-1.485861, 1.209243, -2.70061, 1, 1, 1, 1, 1,
-1.484273, -1.101787, -2.802216, 1, 1, 1, 1, 1,
-1.475538, 0.5713232, -1.111765, 1, 1, 1, 1, 1,
-1.474724, -0.3935637, -2.444099, 1, 1, 1, 1, 1,
-1.471238, 0.2974786, 0.07426199, 1, 1, 1, 1, 1,
-1.462417, -1.465739, -2.633634, 1, 1, 1, 1, 1,
-1.445937, 0.8506888, -2.201538, 0, 0, 1, 1, 1,
-1.444072, 1.115971, 0.2453432, 1, 0, 0, 1, 1,
-1.439554, 1.0685, -0.6032898, 1, 0, 0, 1, 1,
-1.433047, 2.029998, -1.525801, 1, 0, 0, 1, 1,
-1.419523, -0.5483463, -1.837123, 1, 0, 0, 1, 1,
-1.403612, 0.7874793, -0.4009604, 1, 0, 0, 1, 1,
-1.400602, 0.9393551, -0.2262202, 0, 0, 0, 1, 1,
-1.391693, 1.756435, -0.4266435, 0, 0, 0, 1, 1,
-1.378669, -0.8932618, -2.500453, 0, 0, 0, 1, 1,
-1.374762, -0.63097, -1.775972, 0, 0, 0, 1, 1,
-1.362563, -0.1466423, -2.314559, 0, 0, 0, 1, 1,
-1.35834, 0.01707137, -2.929933, 0, 0, 0, 1, 1,
-1.352391, 1.118399, 1.074843, 0, 0, 0, 1, 1,
-1.35125, -0.08564226, -2.316369, 1, 1, 1, 1, 1,
-1.347706, 1.437901, -1.355697, 1, 1, 1, 1, 1,
-1.344633, 2.409574, -0.9571888, 1, 1, 1, 1, 1,
-1.336339, -1.415447, -1.584999, 1, 1, 1, 1, 1,
-1.334854, 0.3644786, -2.149169, 1, 1, 1, 1, 1,
-1.32339, 1.13116, 0.684595, 1, 1, 1, 1, 1,
-1.323097, -0.5755374, -1.246259, 1, 1, 1, 1, 1,
-1.313405, 0.6742635, -1.025883, 1, 1, 1, 1, 1,
-1.310182, 1.166791, -0.5829191, 1, 1, 1, 1, 1,
-1.308623, 1.039059, -1.499074, 1, 1, 1, 1, 1,
-1.306332, -0.9717774, -1.836536, 1, 1, 1, 1, 1,
-1.283842, 0.4773724, -1.139997, 1, 1, 1, 1, 1,
-1.280426, -0.7540061, -4.677522, 1, 1, 1, 1, 1,
-1.278307, 0.4440131, -0.1860509, 1, 1, 1, 1, 1,
-1.273805, -0.6054857, -3.135884, 1, 1, 1, 1, 1,
-1.272398, -0.4240688, -0.9651045, 0, 0, 1, 1, 1,
-1.268122, 0.257528, -1.770966, 1, 0, 0, 1, 1,
-1.267211, 0.4630544, -1.753288, 1, 0, 0, 1, 1,
-1.266122, -0.9892593, -3.642007, 1, 0, 0, 1, 1,
-1.25596, 0.6301304, 0.9961679, 1, 0, 0, 1, 1,
-1.254644, -1.053533, -3.139689, 1, 0, 0, 1, 1,
-1.236924, 0.445549, -0.4119739, 0, 0, 0, 1, 1,
-1.232115, -0.8544399, 0.2203429, 0, 0, 0, 1, 1,
-1.231056, 0.5484437, -0.4221112, 0, 0, 0, 1, 1,
-1.228786, -0.7593329, -1.456285, 0, 0, 0, 1, 1,
-1.228035, -1.563806, -2.64792, 0, 0, 0, 1, 1,
-1.224004, 1.666948, -1.893126, 0, 0, 0, 1, 1,
-1.223589, -1.084207, -1.48294, 0, 0, 0, 1, 1,
-1.218663, -0.8536212, -1.622513, 1, 1, 1, 1, 1,
-1.213851, 0.1037642, -2.919411, 1, 1, 1, 1, 1,
-1.212078, -2.457327, -1.765466, 1, 1, 1, 1, 1,
-1.208686, -0.84993, -2.488903, 1, 1, 1, 1, 1,
-1.203388, -1.079525, -2.151613, 1, 1, 1, 1, 1,
-1.192967, -0.2095049, -1.130525, 1, 1, 1, 1, 1,
-1.191362, 1.203391, -2.114697, 1, 1, 1, 1, 1,
-1.188675, -1.619104, -2.031703, 1, 1, 1, 1, 1,
-1.183817, -1.647082, -2.65268, 1, 1, 1, 1, 1,
-1.18299, 0.9421378, -1.806615, 1, 1, 1, 1, 1,
-1.169537, 0.4947616, -2.814538, 1, 1, 1, 1, 1,
-1.168917, -0.6736616, -1.571906, 1, 1, 1, 1, 1,
-1.142362, -1.452777, -1.298734, 1, 1, 1, 1, 1,
-1.136223, -1.812216, -2.039117, 1, 1, 1, 1, 1,
-1.136052, -0.9408668, -2.120556, 1, 1, 1, 1, 1,
-1.133468, 1.305929, 0.7649024, 0, 0, 1, 1, 1,
-1.13134, 0.4218207, -0.5804417, 1, 0, 0, 1, 1,
-1.126108, -0.1974312, -0.9868827, 1, 0, 0, 1, 1,
-1.110911, -0.0005135399, 0.2479065, 1, 0, 0, 1, 1,
-1.110403, 0.2852137, -0.2065611, 1, 0, 0, 1, 1,
-1.11002, 0.4419971, -0.7989042, 1, 0, 0, 1, 1,
-1.107948, -0.2292309, -2.180568, 0, 0, 0, 1, 1,
-1.107347, 0.9020826, -2.135398, 0, 0, 0, 1, 1,
-1.091495, -1.749178, -0.9570295, 0, 0, 0, 1, 1,
-1.083064, 0.03258913, -1.752096, 0, 0, 0, 1, 1,
-1.079026, -1.828317, -2.5213, 0, 0, 0, 1, 1,
-1.078385, 0.5905369, -0.951623, 0, 0, 0, 1, 1,
-1.076461, 1.002645, -0.9678595, 0, 0, 0, 1, 1,
-1.0754, -0.8452879, -3.067857, 1, 1, 1, 1, 1,
-1.072648, -1.060102, -0.04600962, 1, 1, 1, 1, 1,
-1.061278, 1.434596, -0.4662631, 1, 1, 1, 1, 1,
-1.061277, 1.90057, 0.1107161, 1, 1, 1, 1, 1,
-1.056685, -0.5262721, -3.031719, 1, 1, 1, 1, 1,
-1.05632, 1.034431, 0.4164078, 1, 1, 1, 1, 1,
-1.05607, 1.456376, 0.360059, 1, 1, 1, 1, 1,
-1.033323, 0.8449771, -0.5703588, 1, 1, 1, 1, 1,
-1.029386, 0.08368162, -0.6684261, 1, 1, 1, 1, 1,
-1.029118, -0.04034876, -0.1365882, 1, 1, 1, 1, 1,
-1.027643, 1.530326, 0.2280195, 1, 1, 1, 1, 1,
-1.022823, -1.396047, -2.661049, 1, 1, 1, 1, 1,
-1.01562, 0.7795115, -2.481201, 1, 1, 1, 1, 1,
-1.004222, 0.7318684, 0.227701, 1, 1, 1, 1, 1,
-1.002932, 0.6179602, -2.345501, 1, 1, 1, 1, 1,
-0.9953088, 0.288573, -1.124219, 0, 0, 1, 1, 1,
-0.9904009, 0.4591729, -1.602772, 1, 0, 0, 1, 1,
-0.9891415, -1.634707, -2.640067, 1, 0, 0, 1, 1,
-0.9841408, 1.043735, -1.318292, 1, 0, 0, 1, 1,
-0.9708748, 0.5211791, -0.6947019, 1, 0, 0, 1, 1,
-0.9691359, -2.545169, -3.212014, 1, 0, 0, 1, 1,
-0.9675946, 0.8522951, -1.186844, 0, 0, 0, 1, 1,
-0.9671093, 0.5800657, 0.1029133, 0, 0, 0, 1, 1,
-0.9656328, 1.227565, -1.457583, 0, 0, 0, 1, 1,
-0.9553382, 0.6419834, -1.225328, 0, 0, 0, 1, 1,
-0.9513321, -0.5649347, -2.188418, 0, 0, 0, 1, 1,
-0.9504769, 1.14302, 1.098736, 0, 0, 0, 1, 1,
-0.9442997, 1.496086, 0.9996317, 0, 0, 0, 1, 1,
-0.9436895, 2.066535, -1.331247, 1, 1, 1, 1, 1,
-0.9354633, 0.1157159, -0.01949368, 1, 1, 1, 1, 1,
-0.9290705, 0.6919935, -1.082985, 1, 1, 1, 1, 1,
-0.9283106, -0.9732924, -0.9325703, 1, 1, 1, 1, 1,
-0.9229033, 0.7589412, -0.5775779, 1, 1, 1, 1, 1,
-0.9228709, -0.8693134, -0.7691134, 1, 1, 1, 1, 1,
-0.9197019, 1.873847, -1.142257, 1, 1, 1, 1, 1,
-0.9170174, 0.1949425, -3.385532, 1, 1, 1, 1, 1,
-0.9153193, -0.7575746, 1.214727, 1, 1, 1, 1, 1,
-0.91445, 0.2922494, -2.209148, 1, 1, 1, 1, 1,
-0.9080785, -0.7688453, -1.82831, 1, 1, 1, 1, 1,
-0.9078042, -0.1730602, -0.9964546, 1, 1, 1, 1, 1,
-0.9047175, -0.03605845, -1.02157, 1, 1, 1, 1, 1,
-0.899601, 1.433099, -0.4943588, 1, 1, 1, 1, 1,
-0.8868952, 1.235915, 0.4910588, 1, 1, 1, 1, 1,
-0.8862227, -0.4191664, -0.9699157, 0, 0, 1, 1, 1,
-0.8842888, 0.3692014, -1.567314, 1, 0, 0, 1, 1,
-0.883247, 0.570311, -2.794379, 1, 0, 0, 1, 1,
-0.8745661, 1.663918, 0.2573409, 1, 0, 0, 1, 1,
-0.8713431, -1.325942, -3.108756, 1, 0, 0, 1, 1,
-0.8710448, -0.09669958, -1.052773, 1, 0, 0, 1, 1,
-0.8612372, 0.0207034, -1.649104, 0, 0, 0, 1, 1,
-0.8486707, -0.1593066, -1.092701, 0, 0, 0, 1, 1,
-0.8450707, -0.386577, -3.133852, 0, 0, 0, 1, 1,
-0.8420125, 1.442776, 0.9123144, 0, 0, 0, 1, 1,
-0.839931, 0.3315877, -0.8451009, 0, 0, 0, 1, 1,
-0.8387525, 1.194352, -0.8707651, 0, 0, 0, 1, 1,
-0.8379177, 0.5997156, -1.784256, 0, 0, 0, 1, 1,
-0.8337472, -0.1541973, -1.66364, 1, 1, 1, 1, 1,
-0.8283421, 0.8451112, -1.017391, 1, 1, 1, 1, 1,
-0.825579, -0.3535365, -0.720504, 1, 1, 1, 1, 1,
-0.8255198, -0.2291513, -1.527393, 1, 1, 1, 1, 1,
-0.8253729, 1.099983, 0.5124701, 1, 1, 1, 1, 1,
-0.820443, -1.330018, -2.283772, 1, 1, 1, 1, 1,
-0.8177606, -1.441712, -4.348782, 1, 1, 1, 1, 1,
-0.8130525, -1.158456, -1.279151, 1, 1, 1, 1, 1,
-0.8107262, -0.6655909, -1.15166, 1, 1, 1, 1, 1,
-0.8048348, -1.331891, -2.549619, 1, 1, 1, 1, 1,
-0.8013229, 0.1426829, -1.058183, 1, 1, 1, 1, 1,
-0.7983723, -1.378965, -2.646066, 1, 1, 1, 1, 1,
-0.7935488, 0.7554764, -1.227827, 1, 1, 1, 1, 1,
-0.7931434, 0.4017085, -2.189628, 1, 1, 1, 1, 1,
-0.7919664, 1.187212, 0.4024717, 1, 1, 1, 1, 1,
-0.7905421, -0.1001353, -1.465972, 0, 0, 1, 1, 1,
-0.7892289, -1.642524, -2.693862, 1, 0, 0, 1, 1,
-0.7876884, 0.2799436, -0.7487594, 1, 0, 0, 1, 1,
-0.7865016, -1.395807, -2.469266, 1, 0, 0, 1, 1,
-0.7852408, 0.03080646, -0.1207355, 1, 0, 0, 1, 1,
-0.7785516, 1.703721, -0.2701913, 1, 0, 0, 1, 1,
-0.7707505, -0.07935842, -1.767372, 0, 0, 0, 1, 1,
-0.7678636, 2.209131, -0.2553883, 0, 0, 0, 1, 1,
-0.7628226, 1.744985, 0.01639993, 0, 0, 0, 1, 1,
-0.7549469, -0.1231835, -2.697145, 0, 0, 0, 1, 1,
-0.7533982, -1.843867, -1.597131, 0, 0, 0, 1, 1,
-0.7491965, -0.3333212, -1.596628, 0, 0, 0, 1, 1,
-0.7484261, 0.6465855, -0.05352298, 0, 0, 0, 1, 1,
-0.743676, -0.7473028, -2.597864, 1, 1, 1, 1, 1,
-0.7427185, 0.6321992, -0.8106142, 1, 1, 1, 1, 1,
-0.7397704, -1.138302, -4.138632, 1, 1, 1, 1, 1,
-0.7382478, 1.277921, 0.6837121, 1, 1, 1, 1, 1,
-0.7337881, -1.184432, -2.743718, 1, 1, 1, 1, 1,
-0.7311895, 0.3579732, -0.6048779, 1, 1, 1, 1, 1,
-0.7220367, -1.407585, -1.138455, 1, 1, 1, 1, 1,
-0.7210094, -0.4991206, -1.670668, 1, 1, 1, 1, 1,
-0.7172194, -0.004816393, -1.354786, 1, 1, 1, 1, 1,
-0.7132621, 0.06323567, -2.491697, 1, 1, 1, 1, 1,
-0.7073275, -0.2467767, -1.033775, 1, 1, 1, 1, 1,
-0.7052393, -0.9157573, -4.085565, 1, 1, 1, 1, 1,
-0.7021385, 0.992097, -0.3538429, 1, 1, 1, 1, 1,
-0.7012207, 1.62314, -0.9232548, 1, 1, 1, 1, 1,
-0.694574, -0.9797944, -2.830281, 1, 1, 1, 1, 1,
-0.6929814, 0.1743509, -0.2932854, 0, 0, 1, 1, 1,
-0.690932, 0.6889039, 0.4409835, 1, 0, 0, 1, 1,
-0.6886188, 1.436539, 0.7730935, 1, 0, 0, 1, 1,
-0.6867505, -0.1066702, -2.699123, 1, 0, 0, 1, 1,
-0.6803666, -0.5545146, -2.996561, 1, 0, 0, 1, 1,
-0.6663572, 1.310427, 0.1099873, 1, 0, 0, 1, 1,
-0.662327, 1.795571, 0.5091883, 0, 0, 0, 1, 1,
-0.6519257, -1.00279, -0.8647429, 0, 0, 0, 1, 1,
-0.6480652, 0.3695683, -0.5771165, 0, 0, 0, 1, 1,
-0.6467384, 0.6663324, -2.800652, 0, 0, 0, 1, 1,
-0.6433269, 2.233071, -0.0216279, 0, 0, 0, 1, 1,
-0.6421856, 0.1335572, -1.12563, 0, 0, 0, 1, 1,
-0.641793, 0.2115896, -2.036593, 0, 0, 0, 1, 1,
-0.6404696, -1.645875, -2.786939, 1, 1, 1, 1, 1,
-0.6368651, 0.4570401, -2.289046, 1, 1, 1, 1, 1,
-0.6349587, 1.356074, 0.1469525, 1, 1, 1, 1, 1,
-0.6330019, -0.5029019, -2.656153, 1, 1, 1, 1, 1,
-0.6282459, -0.8095456, -1.426839, 1, 1, 1, 1, 1,
-0.6185408, -0.1381278, -1.177561, 1, 1, 1, 1, 1,
-0.6159597, -0.3772793, -1.07078, 1, 1, 1, 1, 1,
-0.6153221, 0.3598655, -0.6881743, 1, 1, 1, 1, 1,
-0.6149311, -0.1933742, -3.811452, 1, 1, 1, 1, 1,
-0.6128017, 0.390098, -0.3534254, 1, 1, 1, 1, 1,
-0.6127494, 1.264214, 0.8716242, 1, 1, 1, 1, 1,
-0.6076996, -1.224955, -2.204297, 1, 1, 1, 1, 1,
-0.6063303, -0.7805875, -1.800381, 1, 1, 1, 1, 1,
-0.5992444, -0.2761649, -2.7966, 1, 1, 1, 1, 1,
-0.5924848, -0.7367214, -2.000322, 1, 1, 1, 1, 1,
-0.5906863, 1.345706, -2.583373, 0, 0, 1, 1, 1,
-0.5896428, -1.105715, -4.437695, 1, 0, 0, 1, 1,
-0.5859967, -1.2553, -2.77895, 1, 0, 0, 1, 1,
-0.5859596, -1.087121, -1.594051, 1, 0, 0, 1, 1,
-0.5812061, 0.3037722, -0.8269468, 1, 0, 0, 1, 1,
-0.5782375, -0.7371719, -4.490087, 1, 0, 0, 1, 1,
-0.57754, 1.613685, 1.154518, 0, 0, 0, 1, 1,
-0.5774515, -0.5290385, -1.530473, 0, 0, 0, 1, 1,
-0.5715966, 0.8647559, -1.142323, 0, 0, 0, 1, 1,
-0.5695601, -0.09849361, -2.099278, 0, 0, 0, 1, 1,
-0.5671541, 0.07257368, -0.1180611, 0, 0, 0, 1, 1,
-0.5662554, -0.6974808, -1.076913, 0, 0, 0, 1, 1,
-0.5600275, -0.9386345, -3.197945, 0, 0, 0, 1, 1,
-0.5549865, -0.627845, -2.655116, 1, 1, 1, 1, 1,
-0.5460449, -0.2813992, -3.073914, 1, 1, 1, 1, 1,
-0.54439, -0.08223447, -2.331721, 1, 1, 1, 1, 1,
-0.5438265, 1.169752, -1.14112, 1, 1, 1, 1, 1,
-0.5415293, -0.5737179, -1.343726, 1, 1, 1, 1, 1,
-0.5379865, -1.375035, -3.444875, 1, 1, 1, 1, 1,
-0.5379438, 0.2203382, 0.624137, 1, 1, 1, 1, 1,
-0.5353367, -0.5182522, -4.137463, 1, 1, 1, 1, 1,
-0.5278111, -0.5054262, -2.612476, 1, 1, 1, 1, 1,
-0.5271003, 1.191476, 0.4221581, 1, 1, 1, 1, 1,
-0.5233543, -1.496253, -3.577909, 1, 1, 1, 1, 1,
-0.5199857, 0.1233714, -1.731812, 1, 1, 1, 1, 1,
-0.5191956, 0.1432092, -0.6888589, 1, 1, 1, 1, 1,
-0.516416, 1.291422, -0.6433537, 1, 1, 1, 1, 1,
-0.515644, -0.5002211, -0.3287769, 1, 1, 1, 1, 1,
-0.5127408, 0.3262745, -2.518465, 0, 0, 1, 1, 1,
-0.5126482, 0.4401609, -1.326503, 1, 0, 0, 1, 1,
-0.510374, 2.916318, -2.171555, 1, 0, 0, 1, 1,
-0.5063209, 0.1961556, -0.515925, 1, 0, 0, 1, 1,
-0.5037881, 1.346735, -1.124025, 1, 0, 0, 1, 1,
-0.5021657, 0.7296338, -2.209035, 1, 0, 0, 1, 1,
-0.5016617, 0.01022992, -1.518655, 0, 0, 0, 1, 1,
-0.4911477, 0.5664558, 0.2903674, 0, 0, 0, 1, 1,
-0.4886423, -0.6851003, -2.772509, 0, 0, 0, 1, 1,
-0.4876936, 1.309551, 0.06663156, 0, 0, 0, 1, 1,
-0.4876278, -0.491975, -3.409922, 0, 0, 0, 1, 1,
-0.4872859, 0.3848706, -0.3404459, 0, 0, 0, 1, 1,
-0.4870537, 1.234442, 0.3820238, 0, 0, 0, 1, 1,
-0.4840624, 1.212962, -0.4551699, 1, 1, 1, 1, 1,
-0.4838343, -0.1553227, -2.492167, 1, 1, 1, 1, 1,
-0.4833659, -1.046156, -3.903837, 1, 1, 1, 1, 1,
-0.4807583, 1.160169, -0.5412983, 1, 1, 1, 1, 1,
-0.473673, 1.744616, -0.6045025, 1, 1, 1, 1, 1,
-0.4717032, -0.3225734, -3.163435, 1, 1, 1, 1, 1,
-0.4699194, -0.05354311, -1.352806, 1, 1, 1, 1, 1,
-0.4684047, -0.6370791, -3.048337, 1, 1, 1, 1, 1,
-0.459629, 0.4511131, -0.9661046, 1, 1, 1, 1, 1,
-0.4589274, 0.1157898, 0.372023, 1, 1, 1, 1, 1,
-0.4587499, 1.215984, -1.759137, 1, 1, 1, 1, 1,
-0.457516, -0.8626877, -1.581649, 1, 1, 1, 1, 1,
-0.4567679, 1.895658, -2.446524, 1, 1, 1, 1, 1,
-0.4560502, 1.24551, -0.8321527, 1, 1, 1, 1, 1,
-0.4553385, -0.02448977, -1.512317, 1, 1, 1, 1, 1,
-0.455075, -0.3798368, -1.083175, 0, 0, 1, 1, 1,
-0.4543364, -0.6345462, -1.548201, 1, 0, 0, 1, 1,
-0.4512461, 1.31375, -0.5476055, 1, 0, 0, 1, 1,
-0.4496891, 0.2177933, -0.2550074, 1, 0, 0, 1, 1,
-0.448199, -0.2175516, -3.451306, 1, 0, 0, 1, 1,
-0.4471678, -0.5697942, -2.436697, 1, 0, 0, 1, 1,
-0.4444697, 0.008389402, -2.373939, 0, 0, 0, 1, 1,
-0.4437689, -0.462712, -0.6138732, 0, 0, 0, 1, 1,
-0.4383965, -0.2794845, -2.639282, 0, 0, 0, 1, 1,
-0.4356624, -0.9399749, -1.786061, 0, 0, 0, 1, 1,
-0.4332904, 1.304009, -2.150037, 0, 0, 0, 1, 1,
-0.4327269, 0.1337879, 0.1492226, 0, 0, 0, 1, 1,
-0.4325136, 0.2321528, -1.206576, 0, 0, 0, 1, 1,
-0.4305381, 0.2807793, -0.8147448, 1, 1, 1, 1, 1,
-0.4299366, -0.4035017, -2.050313, 1, 1, 1, 1, 1,
-0.4273468, -1.682092, -4.13271, 1, 1, 1, 1, 1,
-0.424242, -1.13247, -1.910663, 1, 1, 1, 1, 1,
-0.4216976, -0.3883108, -4.409245, 1, 1, 1, 1, 1,
-0.4171221, 0.4902781, 0.7970017, 1, 1, 1, 1, 1,
-0.416523, 0.538438, -3.834025, 1, 1, 1, 1, 1,
-0.4149442, -0.4812163, -1.97835, 1, 1, 1, 1, 1,
-0.4099103, -1.699962, -2.746705, 1, 1, 1, 1, 1,
-0.4084682, 0.5846608, -2.555003, 1, 1, 1, 1, 1,
-0.4084091, 1.744148, 0.704273, 1, 1, 1, 1, 1,
-0.4082775, -0.0165736, -0.5808423, 1, 1, 1, 1, 1,
-0.4078965, -0.5026935, -1.546686, 1, 1, 1, 1, 1,
-0.3972486, 0.01781696, -1.991698, 1, 1, 1, 1, 1,
-0.3915164, 1.421681, 1.110019, 1, 1, 1, 1, 1,
-0.3824706, 0.101926, -0.6385101, 0, 0, 1, 1, 1,
-0.3800634, -1.262185, -2.599593, 1, 0, 0, 1, 1,
-0.3774517, -0.4889991, -2.2895, 1, 0, 0, 1, 1,
-0.3682171, -0.9540616, -2.548478, 1, 0, 0, 1, 1,
-0.3668956, -0.7785386, -1.401232, 1, 0, 0, 1, 1,
-0.3606955, -0.4282945, -3.178716, 1, 0, 0, 1, 1,
-0.3595715, -0.5674862, -2.332498, 0, 0, 0, 1, 1,
-0.3588099, 1.575785, -0.8265558, 0, 0, 0, 1, 1,
-0.3575746, -3.319748, -3.757052, 0, 0, 0, 1, 1,
-0.3575193, 0.2190908, -1.421648, 0, 0, 0, 1, 1,
-0.356978, 1.883629, 1.442896, 0, 0, 0, 1, 1,
-0.3549341, -0.05992432, 0.610413, 0, 0, 0, 1, 1,
-0.3537006, 1.310131, -0.2445377, 0, 0, 0, 1, 1,
-0.3534438, -0.06270388, -1.618673, 1, 1, 1, 1, 1,
-0.3480908, 1.408588, -2.063194, 1, 1, 1, 1, 1,
-0.3473659, -0.345604, -1.330549, 1, 1, 1, 1, 1,
-0.3418437, 0.04426507, -1.139247, 1, 1, 1, 1, 1,
-0.3360975, -0.1632917, -1.427379, 1, 1, 1, 1, 1,
-0.3344828, 0.6987132, 1.548863, 1, 1, 1, 1, 1,
-0.3322841, -0.9840689, -2.565497, 1, 1, 1, 1, 1,
-0.3277853, 1.257933, -1.406473, 1, 1, 1, 1, 1,
-0.3275864, -1.986532, -3.309541, 1, 1, 1, 1, 1,
-0.3244143, -0.6213704, -2.517726, 1, 1, 1, 1, 1,
-0.3218594, -1.320576, -2.841256, 1, 1, 1, 1, 1,
-0.3212777, 0.4927348, -0.6078612, 1, 1, 1, 1, 1,
-0.3153124, -0.7586905, -2.849391, 1, 1, 1, 1, 1,
-0.3133982, -0.1807961, -3.648662, 1, 1, 1, 1, 1,
-0.3127764, 0.04887495, -0.6353664, 1, 1, 1, 1, 1,
-0.3125512, 2.321955, -0.4402835, 0, 0, 1, 1, 1,
-0.3122331, -0.9299115, -2.166345, 1, 0, 0, 1, 1,
-0.3081112, 1.902286, 0.3239302, 1, 0, 0, 1, 1,
-0.3063873, 0.9590026, -1.147929, 1, 0, 0, 1, 1,
-0.3051175, 0.9330706, -0.8879272, 1, 0, 0, 1, 1,
-0.3046476, -1.149928, -2.459497, 1, 0, 0, 1, 1,
-0.2994653, 0.5956453, -0.3509502, 0, 0, 0, 1, 1,
-0.2947892, -0.7602403, -2.248483, 0, 0, 0, 1, 1,
-0.2932627, 1.470198, 0.5417488, 0, 0, 0, 1, 1,
-0.293152, -0.2770662, -0.8085968, 0, 0, 0, 1, 1,
-0.29277, -0.8229941, -3.51368, 0, 0, 0, 1, 1,
-0.2822021, -0.464348, -2.245754, 0, 0, 0, 1, 1,
-0.2821428, 0.7680752, -0.1561085, 0, 0, 0, 1, 1,
-0.2785165, -0.09086359, -1.424063, 1, 1, 1, 1, 1,
-0.2782863, -2.25725, -2.915589, 1, 1, 1, 1, 1,
-0.2748673, 1.191449, 0.07858154, 1, 1, 1, 1, 1,
-0.2699502, -0.6551906, -1.392186, 1, 1, 1, 1, 1,
-0.2676759, -0.2629101, -3.118786, 1, 1, 1, 1, 1,
-0.2639586, -0.6266826, -5.67264, 1, 1, 1, 1, 1,
-0.2606477, -1.056522, -3.549493, 1, 1, 1, 1, 1,
-0.25995, -1.554933, -3.203674, 1, 1, 1, 1, 1,
-0.2566463, -0.1673923, -2.881976, 1, 1, 1, 1, 1,
-0.2499916, -1.158283, -1.992593, 1, 1, 1, 1, 1,
-0.2491212, -0.5647552, -2.270534, 1, 1, 1, 1, 1,
-0.2441603, 0.2136285, -1.137768, 1, 1, 1, 1, 1,
-0.2407232, -0.8919913, -1.041034, 1, 1, 1, 1, 1,
-0.2365709, 0.770799, -1.403326, 1, 1, 1, 1, 1,
-0.2330601, -0.353073, -1.875518, 1, 1, 1, 1, 1,
-0.2324579, -1.564602, -4.031781, 0, 0, 1, 1, 1,
-0.2288063, 0.5011421, -2.188065, 1, 0, 0, 1, 1,
-0.2285678, 0.3973227, -0.6672502, 1, 0, 0, 1, 1,
-0.2265261, 0.5726296, 0.6559308, 1, 0, 0, 1, 1,
-0.2219205, 1.096471, -0.05812917, 1, 0, 0, 1, 1,
-0.2182731, 0.1008839, -0.9732739, 1, 0, 0, 1, 1,
-0.2129971, 0.9800276, -1.165558, 0, 0, 0, 1, 1,
-0.2092139, -0.1930852, -0.9913546, 0, 0, 0, 1, 1,
-0.2090016, 1.099566, -0.9272132, 0, 0, 0, 1, 1,
-0.2086974, 0.0398579, -4.089495, 0, 0, 0, 1, 1,
-0.2075558, 1.078743, 1.487839, 0, 0, 0, 1, 1,
-0.2072159, 1.292277, 0.7182269, 0, 0, 0, 1, 1,
-0.2026954, 0.05140525, -1.287386, 0, 0, 0, 1, 1,
-0.200231, -0.3650887, -2.464067, 1, 1, 1, 1, 1,
-0.1989415, -2.245812, -3.722715, 1, 1, 1, 1, 1,
-0.1963003, -0.640582, -3.17233, 1, 1, 1, 1, 1,
-0.1956191, 0.03144693, -2.20085, 1, 1, 1, 1, 1,
-0.1900745, 0.7064179, -0.8843318, 1, 1, 1, 1, 1,
-0.1864697, 0.5311148, -0.7747812, 1, 1, 1, 1, 1,
-0.1843765, 0.3582555, 1.342321, 1, 1, 1, 1, 1,
-0.1826026, 0.2196556, 0.4463556, 1, 1, 1, 1, 1,
-0.1784459, -0.3521474, -1.986242, 1, 1, 1, 1, 1,
-0.1763593, -0.8043476, -2.917859, 1, 1, 1, 1, 1,
-0.1741167, 1.109398, -0.6179264, 1, 1, 1, 1, 1,
-0.1731008, 0.167371, -1.624188, 1, 1, 1, 1, 1,
-0.1647879, -1.600425, -1.712935, 1, 1, 1, 1, 1,
-0.1646908, 1.004112, -2.487018, 1, 1, 1, 1, 1,
-0.1622254, 0.2500379, -0.4322355, 1, 1, 1, 1, 1,
-0.16219, -0.88381, -4.500424, 0, 0, 1, 1, 1,
-0.1595108, 0.8846965, -0.9277908, 1, 0, 0, 1, 1,
-0.1583125, -1.680177, -2.274681, 1, 0, 0, 1, 1,
-0.1562894, -0.976796, -3.414262, 1, 0, 0, 1, 1,
-0.1543665, -0.5476172, -2.671261, 1, 0, 0, 1, 1,
-0.154357, 0.06242905, -1.743574, 1, 0, 0, 1, 1,
-0.1520426, 1.54776, 0.1984581, 0, 0, 0, 1, 1,
-0.1517634, 0.7493849, -1.212525, 0, 0, 0, 1, 1,
-0.1476614, 0.4178275, -2.346188, 0, 0, 0, 1, 1,
-0.1459934, 0.4668825, -1.119229, 0, 0, 0, 1, 1,
-0.145221, 0.5098961, -2.122406, 0, 0, 0, 1, 1,
-0.1406031, -0.06051763, -1.630223, 0, 0, 0, 1, 1,
-0.1405698, -0.3554177, -3.523545, 0, 0, 0, 1, 1,
-0.1339179, 0.07242604, -0.1286065, 1, 1, 1, 1, 1,
-0.1298991, -0.4604108, -3.615042, 1, 1, 1, 1, 1,
-0.1236584, -0.3906378, -4.004112, 1, 1, 1, 1, 1,
-0.1207591, -0.800069, -3.70372, 1, 1, 1, 1, 1,
-0.1177483, 1.591177, 0.2861221, 1, 1, 1, 1, 1,
-0.117153, -1.448293, -3.142534, 1, 1, 1, 1, 1,
-0.1127071, -1.675788, -2.872552, 1, 1, 1, 1, 1,
-0.1117633, 0.3416066, 0.4528042, 1, 1, 1, 1, 1,
-0.1085567, -1.307474, -2.930768, 1, 1, 1, 1, 1,
-0.1068033, -0.1845245, -1.028718, 1, 1, 1, 1, 1,
-0.104299, -0.9234834, -2.776875, 1, 1, 1, 1, 1,
-0.1002414, -0.1373569, -3.99404, 1, 1, 1, 1, 1,
-0.09780426, 1.083368, 0.05440954, 1, 1, 1, 1, 1,
-0.09709026, -0.2263511, -3.680376, 1, 1, 1, 1, 1,
-0.0961474, -0.9692748, -3.585472, 1, 1, 1, 1, 1,
-0.08164898, 0.6920773, -0.3606823, 0, 0, 1, 1, 1,
-0.08108614, 0.4537954, -0.2512256, 1, 0, 0, 1, 1,
-0.07767486, -0.4267827, -4.517112, 1, 0, 0, 1, 1,
-0.07227442, 0.7133434, 1.077476, 1, 0, 0, 1, 1,
-0.07167187, -0.4322045, -3.274237, 1, 0, 0, 1, 1,
-0.06975657, 0.5417244, 0.3220528, 1, 0, 0, 1, 1,
-0.06507666, 0.2639621, 0.6737689, 0, 0, 0, 1, 1,
-0.05702557, 1.67784, -0.1511644, 0, 0, 0, 1, 1,
-0.05657736, 1.430849, 0.4117036, 0, 0, 0, 1, 1,
-0.05631727, 1.031875, 0.05714121, 0, 0, 0, 1, 1,
-0.04993875, 0.7664374, -1.041939, 0, 0, 0, 1, 1,
-0.04809559, -0.328792, -1.144644, 0, 0, 0, 1, 1,
-0.04258111, -0.5003194, -2.347191, 0, 0, 0, 1, 1,
-0.0424844, -0.8030559, -1.605677, 1, 1, 1, 1, 1,
-0.03730993, -0.7807233, -3.489799, 1, 1, 1, 1, 1,
-0.0368405, 0.2133532, 0.8495647, 1, 1, 1, 1, 1,
-0.03081392, -0.4532735, -3.0693, 1, 1, 1, 1, 1,
-0.029206, -0.7110087, -2.366924, 1, 1, 1, 1, 1,
-0.02779485, 2.314777, 0.6909091, 1, 1, 1, 1, 1,
-0.02497418, -0.09216514, -2.085005, 1, 1, 1, 1, 1,
-0.02189324, -0.8990037, -4.745217, 1, 1, 1, 1, 1,
-0.01493744, -0.5359828, -3.781992, 1, 1, 1, 1, 1,
-0.0145212, 1.060449, -0.7392344, 1, 1, 1, 1, 1,
-0.01200192, 1.683336, 0.5271849, 1, 1, 1, 1, 1,
-0.00631845, -2.012101, -4.398544, 1, 1, 1, 1, 1,
-0.00601435, -1.104852, -1.777266, 1, 1, 1, 1, 1,
-0.002433392, 2.137574, 1.300179, 1, 1, 1, 1, 1,
-0.002411387, -0.9652609, -2.901395, 1, 1, 1, 1, 1,
0.003713727, -0.2945434, 4.002231, 0, 0, 1, 1, 1,
0.007537902, -0.593914, 2.481672, 1, 0, 0, 1, 1,
0.01026623, 2.857216, -0.2352748, 1, 0, 0, 1, 1,
0.01122184, 0.5763239, 0.887798, 1, 0, 0, 1, 1,
0.01662389, -0.1924814, 3.529946, 1, 0, 0, 1, 1,
0.01788104, 0.4812763, 0.5414786, 1, 0, 0, 1, 1,
0.019082, 0.3788854, 0.2712038, 0, 0, 0, 1, 1,
0.0192476, 0.5003912, 0.02170436, 0, 0, 0, 1, 1,
0.02096708, -2.021425, 2.56108, 0, 0, 0, 1, 1,
0.02261136, -0.2139945, 3.6154, 0, 0, 0, 1, 1,
0.02303109, 0.9328313, -0.8929408, 0, 0, 0, 1, 1,
0.02346128, -0.04369237, 2.611708, 0, 0, 0, 1, 1,
0.02551379, 0.3616967, -0.7039618, 0, 0, 0, 1, 1,
0.03307693, 0.6569949, 0.1131817, 1, 1, 1, 1, 1,
0.03969496, 0.02440548, 0.5059511, 1, 1, 1, 1, 1,
0.04114811, 0.05671294, 1.189065, 1, 1, 1, 1, 1,
0.04308075, 0.9476635, 0.3037576, 1, 1, 1, 1, 1,
0.0444608, 0.2817294, -0.04227204, 1, 1, 1, 1, 1,
0.05120083, -0.4352971, 2.044766, 1, 1, 1, 1, 1,
0.06087343, 1.090141, 0.9935756, 1, 1, 1, 1, 1,
0.06871217, 0.705766, -0.6020479, 1, 1, 1, 1, 1,
0.0689512, 0.3062297, -1.332596, 1, 1, 1, 1, 1,
0.06904878, 0.01769715, 2.627947, 1, 1, 1, 1, 1,
0.06932127, -0.1886633, 1.503865, 1, 1, 1, 1, 1,
0.06956194, -0.2509084, 2.372363, 1, 1, 1, 1, 1,
0.07217769, 0.7773058, 0.9084618, 1, 1, 1, 1, 1,
0.07325922, 1.586286, -0.211722, 1, 1, 1, 1, 1,
0.07401607, 1.054272, -0.3945574, 1, 1, 1, 1, 1,
0.07451692, -0.6150062, 3.10806, 0, 0, 1, 1, 1,
0.07595848, 2.075997, 0.5055792, 1, 0, 0, 1, 1,
0.07794024, 1.094181, -0.282617, 1, 0, 0, 1, 1,
0.08636487, 0.864644, -1.74722, 1, 0, 0, 1, 1,
0.08687395, -0.3025563, 4.262417, 1, 0, 0, 1, 1,
0.0869987, 1.199683, 0.8314777, 1, 0, 0, 1, 1,
0.09018205, -0.2251871, 4.796785, 0, 0, 0, 1, 1,
0.09244732, 0.1299465, 0.622443, 0, 0, 0, 1, 1,
0.09516605, 1.208796, -0.3354516, 0, 0, 0, 1, 1,
0.1038999, 0.4106906, 0.2720189, 0, 0, 0, 1, 1,
0.1051873, 1.004552, -1.001968, 0, 0, 0, 1, 1,
0.1095093, -0.6112688, 1.926162, 0, 0, 0, 1, 1,
0.1160567, 0.6017523, 0.5374311, 0, 0, 0, 1, 1,
0.1187358, 0.5065117, -1.09469, 1, 1, 1, 1, 1,
0.1190522, -0.7520248, 3.33445, 1, 1, 1, 1, 1,
0.1241047, 0.1744034, -0.9770816, 1, 1, 1, 1, 1,
0.1252259, -2.191078, 3.774405, 1, 1, 1, 1, 1,
0.1267922, 0.2600094, 0.6939481, 1, 1, 1, 1, 1,
0.1269457, -1.18459, 3.988829, 1, 1, 1, 1, 1,
0.1299991, 0.1792549, 1.476708, 1, 1, 1, 1, 1,
0.1380174, -1.604366, 2.432993, 1, 1, 1, 1, 1,
0.150238, 0.0488485, 1.101683, 1, 1, 1, 1, 1,
0.1536337, -0.06306983, 3.21728, 1, 1, 1, 1, 1,
0.15591, -1.468723, 3.105387, 1, 1, 1, 1, 1,
0.156271, -1.580238, 5.412342, 1, 1, 1, 1, 1,
0.1618473, -0.4788572, 1.604863, 1, 1, 1, 1, 1,
0.1626309, 1.250043, 1.126185, 1, 1, 1, 1, 1,
0.163678, -0.3604762, 2.956228, 1, 1, 1, 1, 1,
0.1644434, -1.484473, 3.877417, 0, 0, 1, 1, 1,
0.1676059, 1.483555, -0.3225898, 1, 0, 0, 1, 1,
0.1694002, -0.4981795, 0.9552106, 1, 0, 0, 1, 1,
0.1713451, 0.5888854, -0.9567605, 1, 0, 0, 1, 1,
0.1758637, -0.3165364, 2.734456, 1, 0, 0, 1, 1,
0.1771224, 0.08768076, 0.3128653, 1, 0, 0, 1, 1,
0.185731, 1.374545, 1.430035, 0, 0, 0, 1, 1,
0.1909237, 0.3825628, 0.2812609, 0, 0, 0, 1, 1,
0.1944686, 1.474235, 0.1545562, 0, 0, 0, 1, 1,
0.1986567, 0.8587652, -1.088608, 0, 0, 0, 1, 1,
0.1989063, -0.8983963, 2.057517, 0, 0, 0, 1, 1,
0.1989731, 0.3721977, -2.068216, 0, 0, 0, 1, 1,
0.1992844, -1.742986, 2.867753, 0, 0, 0, 1, 1,
0.1997563, -0.8607743, 3.260664, 1, 1, 1, 1, 1,
0.2000445, -1.143913, 3.340564, 1, 1, 1, 1, 1,
0.2018182, -0.6664326, 2.019884, 1, 1, 1, 1, 1,
0.205157, -0.2193068, 1.948891, 1, 1, 1, 1, 1,
0.2078592, 0.7492174, 0.5984274, 1, 1, 1, 1, 1,
0.2093137, 2.283951, -0.427204, 1, 1, 1, 1, 1,
0.210053, -0.5243156, 2.17856, 1, 1, 1, 1, 1,
0.2117694, -1.294473, 3.546724, 1, 1, 1, 1, 1,
0.2144614, -0.3901929, 2.680197, 1, 1, 1, 1, 1,
0.2144831, 0.205601, 0.8717449, 1, 1, 1, 1, 1,
0.2156772, -0.7767891, 3.806968, 1, 1, 1, 1, 1,
0.2179831, -0.2171877, 1.208939, 1, 1, 1, 1, 1,
0.2314648, 0.3550769, -0.3348591, 1, 1, 1, 1, 1,
0.2323261, -0.5381431, 3.7711, 1, 1, 1, 1, 1,
0.2326203, -0.973359, 1.131995, 1, 1, 1, 1, 1,
0.2337444, 1.340924, -0.487692, 0, 0, 1, 1, 1,
0.2347057, -0.3401665, 0.505724, 1, 0, 0, 1, 1,
0.236481, -1.117313, 3.495795, 1, 0, 0, 1, 1,
0.2389016, 0.7993469, 2.244009, 1, 0, 0, 1, 1,
0.2415633, -0.4099098, 1.856269, 1, 0, 0, 1, 1,
0.2440299, -0.9184005, 2.522323, 1, 0, 0, 1, 1,
0.2472849, -0.5124652, 1.913933, 0, 0, 0, 1, 1,
0.2474924, -0.2543805, 2.636299, 0, 0, 0, 1, 1,
0.2564653, 0.9743724, -0.3246091, 0, 0, 0, 1, 1,
0.2564849, 0.6887517, 0.9219167, 0, 0, 0, 1, 1,
0.2624667, -1.804431, 2.186516, 0, 0, 0, 1, 1,
0.2667838, -0.5936102, 1.763529, 0, 0, 0, 1, 1,
0.2705283, -0.08432096, 2.745559, 0, 0, 0, 1, 1,
0.2734783, -0.5140791, 2.195243, 1, 1, 1, 1, 1,
0.2746278, 1.962087, -1.4633, 1, 1, 1, 1, 1,
0.2748276, 0.5076271, 2.163875, 1, 1, 1, 1, 1,
0.2766827, 0.8618827, 0.08542252, 1, 1, 1, 1, 1,
0.2805934, -1.108187, 2.089895, 1, 1, 1, 1, 1,
0.2834857, 1.230047, 1.497589, 1, 1, 1, 1, 1,
0.2894818, 1.049321, -0.1800042, 1, 1, 1, 1, 1,
0.2907665, 0.8755711, 0.2025214, 1, 1, 1, 1, 1,
0.2924143, -1.815724, 1.935233, 1, 1, 1, 1, 1,
0.2934103, 1.469844, -1.287138, 1, 1, 1, 1, 1,
0.2980359, 0.5297176, 2.201428, 1, 1, 1, 1, 1,
0.2993463, 0.3391104, 0.08399671, 1, 1, 1, 1, 1,
0.3055826, -0.7360316, 2.712416, 1, 1, 1, 1, 1,
0.3103326, -0.5136772, 1.421081, 1, 1, 1, 1, 1,
0.3167412, 0.8437949, 0.04192114, 1, 1, 1, 1, 1,
0.3187101, -1.964942, 2.609176, 0, 0, 1, 1, 1,
0.3235118, -0.4218721, 2.653985, 1, 0, 0, 1, 1,
0.3253205, -0.2390601, 3.266339, 1, 0, 0, 1, 1,
0.3296411, -0.5041012, 2.792978, 1, 0, 0, 1, 1,
0.3313855, 0.1566908, 0.1012336, 1, 0, 0, 1, 1,
0.3496259, -1.376942, 5.222961, 1, 0, 0, 1, 1,
0.3515128, 1.971658, -2.198979, 0, 0, 0, 1, 1,
0.3516095, 0.8717877, 0.1046833, 0, 0, 0, 1, 1,
0.3659059, 1.798084, 1.410068, 0, 0, 0, 1, 1,
0.3659733, -1.435958, 3.689545, 0, 0, 0, 1, 1,
0.3675591, 0.6699961, 2.622755, 0, 0, 0, 1, 1,
0.3698383, 1.051432, 0.8247746, 0, 0, 0, 1, 1,
0.3738194, 0.4850135, 1.133855, 0, 0, 0, 1, 1,
0.3749341, 0.3791466, -1.191145, 1, 1, 1, 1, 1,
0.3787643, -1.298838, 4.008013, 1, 1, 1, 1, 1,
0.3810964, 0.7875045, 0.6069018, 1, 1, 1, 1, 1,
0.3861362, -0.6487264, 0.8591111, 1, 1, 1, 1, 1,
0.3874086, -0.8707607, 2.356379, 1, 1, 1, 1, 1,
0.3963071, 2.357363, -1.063265, 1, 1, 1, 1, 1,
0.3969595, -0.6265655, 1.716943, 1, 1, 1, 1, 1,
0.3973135, -0.7815873, 3.762239, 1, 1, 1, 1, 1,
0.4022733, 0.2345999, 1.191925, 1, 1, 1, 1, 1,
0.4073391, 0.3476665, 0.2991607, 1, 1, 1, 1, 1,
0.4078133, 0.8769373, 0.4060189, 1, 1, 1, 1, 1,
0.4080573, 0.02163347, 2.265546, 1, 1, 1, 1, 1,
0.4114662, 0.799236, -0.1931281, 1, 1, 1, 1, 1,
0.4118089, -1.188848, 2.964185, 1, 1, 1, 1, 1,
0.4233942, 0.5654039, 0.09157499, 1, 1, 1, 1, 1,
0.4388122, 0.3791875, -0.3427749, 0, 0, 1, 1, 1,
0.4400106, 0.6768754, 0.2660851, 1, 0, 0, 1, 1,
0.4435622, -1.40288, 3.233966, 1, 0, 0, 1, 1,
0.4450378, 1.642031, -0.8928085, 1, 0, 0, 1, 1,
0.4452275, 1.858057, -0.5626712, 1, 0, 0, 1, 1,
0.446995, -0.7519665, 2.75566, 1, 0, 0, 1, 1,
0.4491107, -1.130036, 4.103911, 0, 0, 0, 1, 1,
0.4503119, -0.2351727, 1.469866, 0, 0, 0, 1, 1,
0.4510602, -0.8640115, 2.865551, 0, 0, 0, 1, 1,
0.4513704, 0.2271665, 0.7952445, 0, 0, 0, 1, 1,
0.4525273, 0.5560988, 1.422475, 0, 0, 0, 1, 1,
0.4528126, -0.2730032, 2.176231, 0, 0, 0, 1, 1,
0.4548785, 0.1998275, 1.02674, 0, 0, 0, 1, 1,
0.4557544, 0.2604459, 1.040567, 1, 1, 1, 1, 1,
0.4589689, -0.8646603, 3.794086, 1, 1, 1, 1, 1,
0.4615853, -0.246963, 1.91144, 1, 1, 1, 1, 1,
0.4642389, 1.016898, -0.523892, 1, 1, 1, 1, 1,
0.4656886, 0.8820078, 0.4774267, 1, 1, 1, 1, 1,
0.4711294, -0.2394117, 1.943946, 1, 1, 1, 1, 1,
0.4768283, -0.04777623, 2.600899, 1, 1, 1, 1, 1,
0.4786968, 0.3635708, 1.043327, 1, 1, 1, 1, 1,
0.4808463, -1.143489, 1.558038, 1, 1, 1, 1, 1,
0.4911224, -0.1093859, 2.132674, 1, 1, 1, 1, 1,
0.4930391, 0.3292887, 0.4363319, 1, 1, 1, 1, 1,
0.4978543, 0.3765681, 1.045662, 1, 1, 1, 1, 1,
0.4996337, -1.467701, 2.18983, 1, 1, 1, 1, 1,
0.5011787, 0.1534488, 1.101623, 1, 1, 1, 1, 1,
0.5014162, 1.2679, 0.1685787, 1, 1, 1, 1, 1,
0.5073069, 1.631654, 1.531711, 0, 0, 1, 1, 1,
0.5077835, -0.4412163, 1.83909, 1, 0, 0, 1, 1,
0.5102096, -1.415928, 3.99442, 1, 0, 0, 1, 1,
0.5118313, -0.08602537, 1.481686, 1, 0, 0, 1, 1,
0.5134573, 0.9225591, 1.514398, 1, 0, 0, 1, 1,
0.5135285, -0.7906028, 0.7825021, 1, 0, 0, 1, 1,
0.5174153, 0.1495848, -0.1594027, 0, 0, 0, 1, 1,
0.518095, -0.0178716, -0.9375175, 0, 0, 0, 1, 1,
0.518744, -0.54505, 2.106119, 0, 0, 0, 1, 1,
0.5228862, 2.40021, -0.1226775, 0, 0, 0, 1, 1,
0.5239739, -0.7324171, 2.938387, 0, 0, 0, 1, 1,
0.5292867, -1.218479, 1.550116, 0, 0, 0, 1, 1,
0.5314316, -0.3062209, 1.745865, 0, 0, 0, 1, 1,
0.5314578, -0.4338332, 0.7864755, 1, 1, 1, 1, 1,
0.53346, 1.22934, 0.2901371, 1, 1, 1, 1, 1,
0.5336191, 0.3402722, 0.4532128, 1, 1, 1, 1, 1,
0.534152, -0.8273164, 2.666391, 1, 1, 1, 1, 1,
0.540381, -0.1423355, 1.925468, 1, 1, 1, 1, 1,
0.5419081, -1.204044, 1.404947, 1, 1, 1, 1, 1,
0.542531, 0.4690121, 2.303983, 1, 1, 1, 1, 1,
0.5436273, 1.321004, 0.3655863, 1, 1, 1, 1, 1,
0.5455083, 0.7903524, 1.381534, 1, 1, 1, 1, 1,
0.5482298, 0.9713271, -1.038242, 1, 1, 1, 1, 1,
0.5564041, -1.286622, 0.7584978, 1, 1, 1, 1, 1,
0.5719181, -0.3187902, 3.064987, 1, 1, 1, 1, 1,
0.5727839, -0.04941965, 1.286752, 1, 1, 1, 1, 1,
0.5736797, -0.8535838, 2.241077, 1, 1, 1, 1, 1,
0.5782166, -0.6650987, 1.968651, 1, 1, 1, 1, 1,
0.5787967, -1.091383, 3.573539, 0, 0, 1, 1, 1,
0.5829813, 0.9458628, 0.9974845, 1, 0, 0, 1, 1,
0.5856346, -0.8581861, 2.918509, 1, 0, 0, 1, 1,
0.5868116, 0.2574107, 1.435985, 1, 0, 0, 1, 1,
0.5880439, 0.13786, 0.3769853, 1, 0, 0, 1, 1,
0.5882872, -1.136397, 4.033615, 1, 0, 0, 1, 1,
0.590875, -1.690743, 1.828654, 0, 0, 0, 1, 1,
0.5911359, -0.8639272, 2.789091, 0, 0, 0, 1, 1,
0.5943536, 0.0607465, 1.954007, 0, 0, 0, 1, 1,
0.5967048, -0.2512282, 3.069383, 0, 0, 0, 1, 1,
0.6027181, 0.4037508, 1.252108, 0, 0, 0, 1, 1,
0.6056733, 0.5280498, 0.4667597, 0, 0, 0, 1, 1,
0.6062045, 0.4084553, 1.515653, 0, 0, 0, 1, 1,
0.609585, -0.2578693, 2.547731, 1, 1, 1, 1, 1,
0.6111917, -0.1360099, -0.3978835, 1, 1, 1, 1, 1,
0.6120124, -0.08466222, 0.02756648, 1, 1, 1, 1, 1,
0.6129896, 0.3331209, 0.4662012, 1, 1, 1, 1, 1,
0.6215922, -1.785204, 2.517672, 1, 1, 1, 1, 1,
0.6239693, 1.238855, 0.1069156, 1, 1, 1, 1, 1,
0.6292904, 0.1006686, 0.5962486, 1, 1, 1, 1, 1,
0.6343529, 0.683179, -0.1632867, 1, 1, 1, 1, 1,
0.6349162, 3.15602, 0.01494067, 1, 1, 1, 1, 1,
0.6370822, -0.7990713, 2.14123, 1, 1, 1, 1, 1,
0.642933, 2.424872, 0.5246408, 1, 1, 1, 1, 1,
0.6437036, 0.2531961, 2.856145, 1, 1, 1, 1, 1,
0.6443235, -0.5370229, 3.357914, 1, 1, 1, 1, 1,
0.6457095, -1.270707, 3.534028, 1, 1, 1, 1, 1,
0.6512231, -0.8173022, 3.418358, 1, 1, 1, 1, 1,
0.6520708, 0.6273192, -0.8441631, 0, 0, 1, 1, 1,
0.6524931, -1.867885, 2.50778, 1, 0, 0, 1, 1,
0.6542991, -1.236315, 3.355723, 1, 0, 0, 1, 1,
0.6545429, -0.06870986, 1.934227, 1, 0, 0, 1, 1,
0.6546755, 0.5709499, 1.58397, 1, 0, 0, 1, 1,
0.6581356, -0.852262, -0.0793765, 1, 0, 0, 1, 1,
0.6624512, 1.410849, 1.046448, 0, 0, 0, 1, 1,
0.6635569, 0.4258402, 0.4709046, 0, 0, 0, 1, 1,
0.6644933, -0.8527322, 2.248201, 0, 0, 0, 1, 1,
0.6689847, -0.1170846, 2.058215, 0, 0, 0, 1, 1,
0.6761486, 0.4682805, 1.091518, 0, 0, 0, 1, 1,
0.6777583, -0.2388997, 1.371582, 0, 0, 0, 1, 1,
0.6820558, -0.149771, -0.8626281, 0, 0, 0, 1, 1,
0.6888118, 0.7139528, 0.7546192, 1, 1, 1, 1, 1,
0.6888818, 0.2533226, 0.7063133, 1, 1, 1, 1, 1,
0.691614, -1.485559, 3.797492, 1, 1, 1, 1, 1,
0.6918132, -0.593679, 3.259424, 1, 1, 1, 1, 1,
0.6934898, -0.7258212, 2.402565, 1, 1, 1, 1, 1,
0.7077653, 0.5360944, 2.559085, 1, 1, 1, 1, 1,
0.7185829, -0.6188295, 4.209968, 1, 1, 1, 1, 1,
0.7198781, 0.3356118, -1.58787, 1, 1, 1, 1, 1,
0.7200563, 0.9964319, 0.8323693, 1, 1, 1, 1, 1,
0.7229419, -0.1234858, 1.007374, 1, 1, 1, 1, 1,
0.7278656, 0.530049, -0.1288329, 1, 1, 1, 1, 1,
0.7292255, -0.7125787, 1.596664, 1, 1, 1, 1, 1,
0.7345909, 1.248106, 3.134561, 1, 1, 1, 1, 1,
0.7367951, 1.033307, 1.443527, 1, 1, 1, 1, 1,
0.7379445, -1.378065, 3.026837, 1, 1, 1, 1, 1,
0.7409344, -0.8287784, 2.927639, 0, 0, 1, 1, 1,
0.7468401, 0.4876108, 2.68013, 1, 0, 0, 1, 1,
0.7474284, 1.025518, 0.2189726, 1, 0, 0, 1, 1,
0.7486165, 1.806185, 1.851496, 1, 0, 0, 1, 1,
0.7526081, 0.2841093, 2.750425, 1, 0, 0, 1, 1,
0.7531028, -0.504059, 2.802144, 1, 0, 0, 1, 1,
0.7537257, 1.256455, 0.4261399, 0, 0, 0, 1, 1,
0.7572712, 0.7030411, 2.528157, 0, 0, 0, 1, 1,
0.76059, -0.06714228, 1.49341, 0, 0, 0, 1, 1,
0.764073, 1.221667, 2.714689, 0, 0, 0, 1, 1,
0.7645741, 0.0870308, 1.962507, 0, 0, 0, 1, 1,
0.7660246, -0.5401635, 2.687832, 0, 0, 0, 1, 1,
0.7703466, -0.0805134, 1.305477, 0, 0, 0, 1, 1,
0.7710316, 1.770555, -2.162675, 1, 1, 1, 1, 1,
0.7713713, -0.6919875, 3.002976, 1, 1, 1, 1, 1,
0.7722611, -0.9414594, 2.596721, 1, 1, 1, 1, 1,
0.7861515, 0.4455002, 3.087055, 1, 1, 1, 1, 1,
0.7905133, -0.5903893, 2.013325, 1, 1, 1, 1, 1,
0.7908304, 0.3341521, 1.748294, 1, 1, 1, 1, 1,
0.7996162, -1.836532, -0.1340242, 1, 1, 1, 1, 1,
0.8014789, 1.017162, 1.136363, 1, 1, 1, 1, 1,
0.8022972, 0.3337176, 0.7116399, 1, 1, 1, 1, 1,
0.8030682, -0.1589593, 2.291731, 1, 1, 1, 1, 1,
0.8145192, 0.9900507, -0.5349647, 1, 1, 1, 1, 1,
0.814984, 1.139208, 1.038357, 1, 1, 1, 1, 1,
0.8185151, -0.1508163, 3.446735, 1, 1, 1, 1, 1,
0.823015, 0.6894452, 0.4293805, 1, 1, 1, 1, 1,
0.8276693, -1.108267, 1.994355, 1, 1, 1, 1, 1,
0.8298488, -2.136052, 4.412798, 0, 0, 1, 1, 1,
0.8525957, 1.182306, -0.09018067, 1, 0, 0, 1, 1,
0.8558972, -0.1758489, 0.7931406, 1, 0, 0, 1, 1,
0.8566021, -0.7242492, 2.20467, 1, 0, 0, 1, 1,
0.858933, -0.5476684, 1.854369, 1, 0, 0, 1, 1,
0.8617817, -1.020683, 2.696859, 1, 0, 0, 1, 1,
0.8702376, 1.201018, 0.1792037, 0, 0, 0, 1, 1,
0.8705311, -0.8237634, 1.765062, 0, 0, 0, 1, 1,
0.8778801, -0.3165244, 2.482317, 0, 0, 0, 1, 1,
0.8805475, -2.079859, 2.437785, 0, 0, 0, 1, 1,
0.8814916, 0.7776799, 0.4226125, 0, 0, 0, 1, 1,
0.8870371, -1.240594, 3.662263, 0, 0, 0, 1, 1,
0.8960423, -1.071258, 3.861782, 0, 0, 0, 1, 1,
0.9030924, 0.445997, -0.2842769, 1, 1, 1, 1, 1,
0.9059855, -0.2551888, 2.847069, 1, 1, 1, 1, 1,
0.906588, 0.222249, 2.363163, 1, 1, 1, 1, 1,
0.9069137, -0.3892824, 0.8688056, 1, 1, 1, 1, 1,
0.9095744, -0.05342304, 2.261686, 1, 1, 1, 1, 1,
0.9191071, 1.104081, -0.008488005, 1, 1, 1, 1, 1,
0.9219558, 0.2201131, -1.554291, 1, 1, 1, 1, 1,
0.923231, -1.826538, 2.024978, 1, 1, 1, 1, 1,
0.9270378, -0.5913043, 0.1733495, 1, 1, 1, 1, 1,
0.928808, 0.1768219, 1.855034, 1, 1, 1, 1, 1,
0.9304439, 0.978711, 0.6133342, 1, 1, 1, 1, 1,
0.935213, 0.3193289, 1.926412, 1, 1, 1, 1, 1,
0.9356495, -1.035861, 2.928904, 1, 1, 1, 1, 1,
0.936115, -0.341174, 2.218641, 1, 1, 1, 1, 1,
0.9446689, -0.3373156, 3.165599, 1, 1, 1, 1, 1,
0.9541731, -1.056448, 1.766192, 0, 0, 1, 1, 1,
0.9543426, -0.05285046, 0.6887289, 1, 0, 0, 1, 1,
0.9559073, -2.213812, 5.17795, 1, 0, 0, 1, 1,
0.9659212, 0.5063068, 0.926627, 1, 0, 0, 1, 1,
0.9684752, 1.035889, -0.4148171, 1, 0, 0, 1, 1,
0.976994, -1.807219, 1.178799, 1, 0, 0, 1, 1,
0.9805034, 0.150272, 1.28331, 0, 0, 0, 1, 1,
0.9814551, -0.548272, 1.50168, 0, 0, 0, 1, 1,
0.9849708, 0.45567, 1.633006, 0, 0, 0, 1, 1,
0.985893, -0.4647452, 4.07332, 0, 0, 0, 1, 1,
0.9890515, -0.134378, 0.6304761, 0, 0, 0, 1, 1,
0.9980415, 0.2811934, -0.2296453, 0, 0, 0, 1, 1,
0.9996179, 2.63802, 0.3455905, 0, 0, 0, 1, 1,
1.000099, -0.1520395, 2.90378, 1, 1, 1, 1, 1,
1.000692, 0.5626072, 1.772329, 1, 1, 1, 1, 1,
1.01064, 0.3710783, 0.8940095, 1, 1, 1, 1, 1,
1.01111, 0.639665, 1.956226, 1, 1, 1, 1, 1,
1.013409, 1.335299, 0.3355747, 1, 1, 1, 1, 1,
1.016927, -0.5306304, 2.308384, 1, 1, 1, 1, 1,
1.018208, -0.7174346, 2.664293, 1, 1, 1, 1, 1,
1.025987, 1.280138, 0.8914702, 1, 1, 1, 1, 1,
1.026784, 1.118933, 1.201799, 1, 1, 1, 1, 1,
1.032293, 0.03204226, 0.9186816, 1, 1, 1, 1, 1,
1.041704, 0.7729225, 1.241294, 1, 1, 1, 1, 1,
1.043485, -0.02153752, 1.677736, 1, 1, 1, 1, 1,
1.050085, -1.592724, 3.538581, 1, 1, 1, 1, 1,
1.056709, 0.254261, 0.8186973, 1, 1, 1, 1, 1,
1.057433, 0.2540858, 0.1636594, 1, 1, 1, 1, 1,
1.06175, 1.707047, -0.5914453, 0, 0, 1, 1, 1,
1.065626, -1.314753, 1.713339, 1, 0, 0, 1, 1,
1.066831, -1.620406, 1.156995, 1, 0, 0, 1, 1,
1.067383, 0.4117507, -0.5063112, 1, 0, 0, 1, 1,
1.073554, 1.858929, 0.06389698, 1, 0, 0, 1, 1,
1.075951, 0.1573693, 1.163822, 1, 0, 0, 1, 1,
1.076804, -1.623247, 3.095816, 0, 0, 0, 1, 1,
1.085735, -0.5267048, 1.846236, 0, 0, 0, 1, 1,
1.088099, -1.175789, 0.986747, 0, 0, 0, 1, 1,
1.090467, -1.821676, 1.888542, 0, 0, 0, 1, 1,
1.094587, 1.321196, -0.3509301, 0, 0, 0, 1, 1,
1.106295, -0.155844, 2.682615, 0, 0, 0, 1, 1,
1.12042, -0.3540877, 0.4855099, 0, 0, 0, 1, 1,
1.120888, 0.6871373, 0.4980056, 1, 1, 1, 1, 1,
1.129009, 0.3847972, 1.329512, 1, 1, 1, 1, 1,
1.130191, 1.022155, 0.9350467, 1, 1, 1, 1, 1,
1.134766, -0.3957096, 3.262819, 1, 1, 1, 1, 1,
1.136603, -1.048756, 2.583612, 1, 1, 1, 1, 1,
1.141083, -1.563524, 4.36938, 1, 1, 1, 1, 1,
1.143355, -1.350739, 4.208226, 1, 1, 1, 1, 1,
1.150447, -0.1204808, 1.950932, 1, 1, 1, 1, 1,
1.157794, -1.238139, 2.916879, 1, 1, 1, 1, 1,
1.15844, 0.2771734, 0.4619427, 1, 1, 1, 1, 1,
1.159498, -0.9606466, 2.709112, 1, 1, 1, 1, 1,
1.166447, -0.1202741, 1.940451, 1, 1, 1, 1, 1,
1.166824, -1.149138, 2.649352, 1, 1, 1, 1, 1,
1.173002, -1.073412, 1.75134, 1, 1, 1, 1, 1,
1.17771, -0.7801352, 3.214741, 1, 1, 1, 1, 1,
1.178751, -0.141562, 2.602248, 0, 0, 1, 1, 1,
1.179363, 1.954203, 1.427076, 1, 0, 0, 1, 1,
1.184034, 0.3311387, 0.8832396, 1, 0, 0, 1, 1,
1.187859, 1.020073, -0.06207846, 1, 0, 0, 1, 1,
1.197997, 0.5147544, 0.2389712, 1, 0, 0, 1, 1,
1.200121, 0.870185, 1.597718, 1, 0, 0, 1, 1,
1.20512, -0.8574629, 2.067771, 0, 0, 0, 1, 1,
1.205252, -0.5933714, 1.818311, 0, 0, 0, 1, 1,
1.206759, 0.2151863, 2.005109, 0, 0, 0, 1, 1,
1.215689, 0.1785615, 1.044326, 0, 0, 0, 1, 1,
1.224698, 1.431663, -1.551287, 0, 0, 0, 1, 1,
1.236588, 0.168269, 1.726314, 0, 0, 0, 1, 1,
1.240554, 0.6914573, 1.901548, 0, 0, 0, 1, 1,
1.251749, 1.352701, -0.2021606, 1, 1, 1, 1, 1,
1.25553, 1.506759, 1.200935, 1, 1, 1, 1, 1,
1.256764, 0.41849, -0.08789498, 1, 1, 1, 1, 1,
1.25894, -0.2749724, 1.578553, 1, 1, 1, 1, 1,
1.263631, -0.5665722, 2.841218, 1, 1, 1, 1, 1,
1.270124, -0.6135839, -0.2566612, 1, 1, 1, 1, 1,
1.281199, -0.5968301, 2.380074, 1, 1, 1, 1, 1,
1.288618, 0.6564868, 2.018167, 1, 1, 1, 1, 1,
1.292734, -0.1500694, 0.8203576, 1, 1, 1, 1, 1,
1.296434, -0.9858187, 0.3602721, 1, 1, 1, 1, 1,
1.300344, -1.544704, 1.83963, 1, 1, 1, 1, 1,
1.305282, -1.158666, 2.173843, 1, 1, 1, 1, 1,
1.313261, 0.1798577, 2.040941, 1, 1, 1, 1, 1,
1.314611, 0.1395963, 1.35651, 1, 1, 1, 1, 1,
1.323044, -1.243123, 1.403127, 1, 1, 1, 1, 1,
1.333082, 0.1459348, 0.6548802, 0, 0, 1, 1, 1,
1.343661, -0.01898932, 1.543946, 1, 0, 0, 1, 1,
1.359055, 1.379601, -0.7052406, 1, 0, 0, 1, 1,
1.371845, 0.3991627, 0.5726631, 1, 0, 0, 1, 1,
1.372842, -0.4298999, 2.701442, 1, 0, 0, 1, 1,
1.372859, -0.4340697, 1.842651, 1, 0, 0, 1, 1,
1.377791, 0.3461119, 2.224164, 0, 0, 0, 1, 1,
1.386788, 1.47725, 2.51065, 0, 0, 0, 1, 1,
1.389179, 1.358315, -0.786736, 0, 0, 0, 1, 1,
1.397797, 1.322969, 0.9474912, 0, 0, 0, 1, 1,
1.406563, 0.5281988, 1.603779, 0, 0, 0, 1, 1,
1.409728, 0.8183016, 0.2641383, 0, 0, 0, 1, 1,
1.412641, -0.3372746, 2.692015, 0, 0, 0, 1, 1,
1.425969, 0.00874794, 1.042843, 1, 1, 1, 1, 1,
1.43032, 0.6351427, 2.519182, 1, 1, 1, 1, 1,
1.431677, -0.4850864, 1.451419, 1, 1, 1, 1, 1,
1.443565, -0.8172011, 2.166686, 1, 1, 1, 1, 1,
1.450702, 0.7260079, 0.9292313, 1, 1, 1, 1, 1,
1.459837, 1.400434, 1.453116, 1, 1, 1, 1, 1,
1.465085, -0.6096976, 1.017107, 1, 1, 1, 1, 1,
1.471666, -0.2811255, 1.013513, 1, 1, 1, 1, 1,
1.47227, 0.8374081, 0.7112437, 1, 1, 1, 1, 1,
1.473195, -1.514614, 2.214736, 1, 1, 1, 1, 1,
1.476, 0.01284196, 2.096348, 1, 1, 1, 1, 1,
1.487546, 1.080157, -0.4449263, 1, 1, 1, 1, 1,
1.487632, -0.04728336, 0.7069188, 1, 1, 1, 1, 1,
1.511945, -0.9266332, 3.50033, 1, 1, 1, 1, 1,
1.517908, 1.598452, 2.223137, 1, 1, 1, 1, 1,
1.518443, -1.961012, 3.64366, 0, 0, 1, 1, 1,
1.520212, 0.06744752, 0.8149184, 1, 0, 0, 1, 1,
1.520758, 0.4839984, 2.541194, 1, 0, 0, 1, 1,
1.521092, -0.7758847, 2.856233, 1, 0, 0, 1, 1,
1.52285, 0.1633419, 1.816417, 1, 0, 0, 1, 1,
1.529737, -0.5145657, 1.718089, 1, 0, 0, 1, 1,
1.549977, -0.0006205207, 3.179098, 0, 0, 0, 1, 1,
1.563076, -0.729538, 1.815722, 0, 0, 0, 1, 1,
1.564797, -0.2336468, 1.778664, 0, 0, 0, 1, 1,
1.566949, -0.5749185, 0.07306885, 0, 0, 0, 1, 1,
1.57542, -1.385208, 2.435924, 0, 0, 0, 1, 1,
1.580849, 0.603262, 1.55517, 0, 0, 0, 1, 1,
1.594677, -2.056911, 0.7980258, 0, 0, 0, 1, 1,
1.596481, -0.0314706, 0.9977694, 1, 1, 1, 1, 1,
1.606199, -0.8675272, 1.17903, 1, 1, 1, 1, 1,
1.609891, -0.9429174, 3.184991, 1, 1, 1, 1, 1,
1.629839, -0.6331135, 3.324342, 1, 1, 1, 1, 1,
1.630808, 0.8390176, 1.207257, 1, 1, 1, 1, 1,
1.634108, 0.3156237, 1.506124, 1, 1, 1, 1, 1,
1.635147, 0.2739383, 1.537346, 1, 1, 1, 1, 1,
1.645181, 0.1910161, 1.189968, 1, 1, 1, 1, 1,
1.645441, -1.173723, 2.061171, 1, 1, 1, 1, 1,
1.648726, -0.1111554, 1.718721, 1, 1, 1, 1, 1,
1.649111, -0.04676852, 2.522339, 1, 1, 1, 1, 1,
1.655696, -0.5833927, 1.694662, 1, 1, 1, 1, 1,
1.667594, 1.490663, 1.958634, 1, 1, 1, 1, 1,
1.671836, -1.719328, 1.720197, 1, 1, 1, 1, 1,
1.704393, -1.400888, 1.248059, 1, 1, 1, 1, 1,
1.706164, 1.843252, 0.8822103, 0, 0, 1, 1, 1,
1.714213, 0.487354, 0.9686033, 1, 0, 0, 1, 1,
1.714218, 0.4486305, 1.092195, 1, 0, 0, 1, 1,
1.725116, -1.122367, 1.88191, 1, 0, 0, 1, 1,
1.742822, -1.201522, 2.199377, 1, 0, 0, 1, 1,
1.744797, -1.127424, 2.600371, 1, 0, 0, 1, 1,
1.745549, -0.2768323, 1.109236, 0, 0, 0, 1, 1,
1.762937, -0.7827321, 0.8601455, 0, 0, 0, 1, 1,
1.778739, -0.4026459, 0.2142252, 0, 0, 0, 1, 1,
1.793118, 0.5442623, 1.31302, 0, 0, 0, 1, 1,
1.820944, -0.6575986, 1.545226, 0, 0, 0, 1, 1,
1.822737, 0.6516182, -0.6390036, 0, 0, 0, 1, 1,
1.835649, 0.9235795, 2.056178, 0, 0, 0, 1, 1,
1.841492, 0.2960174, 0.5014877, 1, 1, 1, 1, 1,
1.866293, 0.5288765, 1.739883, 1, 1, 1, 1, 1,
1.874906, 1.196102, 2.587067, 1, 1, 1, 1, 1,
1.898371, -0.5487437, 2.172908, 1, 1, 1, 1, 1,
1.908236, -1.134703, 1.218547, 1, 1, 1, 1, 1,
1.938847, 0.3496409, 3.508473, 1, 1, 1, 1, 1,
1.951394, 0.2998843, 0.1115928, 1, 1, 1, 1, 1,
1.993033, 0.1352731, 0.6783842, 1, 1, 1, 1, 1,
2.017313, -0.01564371, 0.9517961, 1, 1, 1, 1, 1,
2.054131, 0.03617209, 1.647155, 1, 1, 1, 1, 1,
2.079327, 0.6880561, 2.643377, 1, 1, 1, 1, 1,
2.111723, 0.3117613, 2.782418, 1, 1, 1, 1, 1,
2.113662, -0.1716068, 1.200999, 1, 1, 1, 1, 1,
2.123214, 0.332891, 1.437466, 1, 1, 1, 1, 1,
2.1704, -0.5565951, 2.578625, 1, 1, 1, 1, 1,
2.170864, 0.5702567, 1.482599, 0, 0, 1, 1, 1,
2.182337, -0.8125106, 1.267898, 1, 0, 0, 1, 1,
2.223895, -1.299916, 2.817409, 1, 0, 0, 1, 1,
2.228598, 0.411651, 2.062599, 1, 0, 0, 1, 1,
2.231573, 1.530248, 2.751813, 1, 0, 0, 1, 1,
2.23273, 0.07125706, 2.532095, 1, 0, 0, 1, 1,
2.238706, 0.04259409, 2.122068, 0, 0, 0, 1, 1,
2.309856, 0.8073433, 1.227881, 0, 0, 0, 1, 1,
2.334238, -0.6053494, 3.438024, 0, 0, 0, 1, 1,
2.343938, 1.542202, 0.7349712, 0, 0, 0, 1, 1,
2.347734, 0.4119931, 1.500423, 0, 0, 0, 1, 1,
2.362174, -0.6494339, 1.463926, 0, 0, 0, 1, 1,
2.379, -0.1681004, 0.4943749, 0, 0, 0, 1, 1,
2.483059, 1.459598, 3.076663, 1, 1, 1, 1, 1,
2.628011, 0.1554896, 1.449049, 1, 1, 1, 1, 1,
2.658156, -0.01137633, 0.8933458, 1, 1, 1, 1, 1,
2.694918, -1.016247, 3.573795, 1, 1, 1, 1, 1,
2.887639, 0.2513321, 3.694967, 1, 1, 1, 1, 1,
3.041841, 0.8432894, 1.715915, 1, 1, 1, 1, 1,
3.112263, -0.1271382, 2.172248, 1, 1, 1, 1, 1
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
var radius = 9.824782;
var distance = 34.50913;
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
mvMatrix.translate( 0.2477808, 0.08186412, 0.1301489 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.50913);
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