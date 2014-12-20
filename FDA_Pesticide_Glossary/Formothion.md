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
-2.947851, 0.7768394, 0.7977784, 1, 0, 0, 1,
-2.745991, -1.431732, -1.495075, 1, 0.007843138, 0, 1,
-2.744606, -0.2480915, -1.794872, 1, 0.01176471, 0, 1,
-2.655818, -1.181768, -3.106149, 1, 0.01960784, 0, 1,
-2.65057, 0.9745381, -0.8872173, 1, 0.02352941, 0, 1,
-2.647752, 0.4044594, -2.832426, 1, 0.03137255, 0, 1,
-2.616844, -0.1630112, -0.207974, 1, 0.03529412, 0, 1,
-2.331075, 1.429786, -0.9520771, 1, 0.04313726, 0, 1,
-2.329566, -0.0139292, -1.616484, 1, 0.04705882, 0, 1,
-2.317645, -0.03226067, -2.567564, 1, 0.05490196, 0, 1,
-2.30111, 0.1149712, -4.131618, 1, 0.05882353, 0, 1,
-2.267684, 1.259774, -0.5895548, 1, 0.06666667, 0, 1,
-2.245158, -0.2019031, -0.8117802, 1, 0.07058824, 0, 1,
-2.207423, 0.4165452, -0.4264476, 1, 0.07843138, 0, 1,
-2.190561, -0.08354539, -1.346534, 1, 0.08235294, 0, 1,
-2.17313, 1.959034, -2.969463, 1, 0.09019608, 0, 1,
-2.075671, -0.1286844, -0.6985748, 1, 0.09411765, 0, 1,
-2.049525, 3.2391, -0.5543782, 1, 0.1019608, 0, 1,
-2.03463, 0.1285214, -1.351349, 1, 0.1098039, 0, 1,
-1.97034, 0.4864728, -1.529842, 1, 0.1137255, 0, 1,
-1.937877, 0.7276431, -0.7127317, 1, 0.1215686, 0, 1,
-1.932634, 0.8119954, -1.029431, 1, 0.1254902, 0, 1,
-1.882547, 0.2255888, -2.767484, 1, 0.1333333, 0, 1,
-1.828524, 1.341038, -0.7759917, 1, 0.1372549, 0, 1,
-1.825643, -0.6933324, -1.178121, 1, 0.145098, 0, 1,
-1.822207, -0.7330321, -0.7632813, 1, 0.1490196, 0, 1,
-1.82105, -1.798447, -3.904794, 1, 0.1568628, 0, 1,
-1.818406, -0.817521, -1.019633, 1, 0.1607843, 0, 1,
-1.813322, 0.9133284, -0.4018376, 1, 0.1686275, 0, 1,
-1.812199, 0.1620013, -3.286262, 1, 0.172549, 0, 1,
-1.795614, 0.8331184, -0.09549787, 1, 0.1803922, 0, 1,
-1.789852, 1.431848, 1.514515, 1, 0.1843137, 0, 1,
-1.784874, 0.1530948, -1.850641, 1, 0.1921569, 0, 1,
-1.782443, -1.197882, -3.253936, 1, 0.1960784, 0, 1,
-1.776889, 0.3462443, -0.8248748, 1, 0.2039216, 0, 1,
-1.765535, -1.227422, -3.22076, 1, 0.2117647, 0, 1,
-1.756789, -1.841906, -2.944817, 1, 0.2156863, 0, 1,
-1.739038, -0.121743, -1.962217, 1, 0.2235294, 0, 1,
-1.737671, 0.5790576, -0.00297393, 1, 0.227451, 0, 1,
-1.716506, 1.119518, -2.186587, 1, 0.2352941, 0, 1,
-1.715861, -1.109355, -2.011433, 1, 0.2392157, 0, 1,
-1.711413, 1.201973, -1.267608, 1, 0.2470588, 0, 1,
-1.708023, -1.146214, -2.225898, 1, 0.2509804, 0, 1,
-1.673242, 1.501146, -1.78501, 1, 0.2588235, 0, 1,
-1.672262, -0.7690855, -2.357083, 1, 0.2627451, 0, 1,
-1.653369, -1.061271, -4.199831, 1, 0.2705882, 0, 1,
-1.645619, -0.3939209, -0.8999895, 1, 0.2745098, 0, 1,
-1.611146, 0.4163511, -2.040186, 1, 0.282353, 0, 1,
-1.595071, -1.140262, 0.9616588, 1, 0.2862745, 0, 1,
-1.593099, 0.7330271, -2.044821, 1, 0.2941177, 0, 1,
-1.589487, 0.7788455, -0.9551328, 1, 0.3019608, 0, 1,
-1.58686, -0.7711266, -1.427054, 1, 0.3058824, 0, 1,
-1.580217, 1.682876, 0.7458677, 1, 0.3137255, 0, 1,
-1.567079, -0.1422581, -0.3708975, 1, 0.3176471, 0, 1,
-1.551118, -0.6061397, -1.747878, 1, 0.3254902, 0, 1,
-1.542587, 0.309179, 1.436138, 1, 0.3294118, 0, 1,
-1.523238, 0.4425351, -1.517354, 1, 0.3372549, 0, 1,
-1.505594, -0.4434819, -3.730352, 1, 0.3411765, 0, 1,
-1.490297, 1.14116, -1.21906, 1, 0.3490196, 0, 1,
-1.479582, 0.6014328, -1.785636, 1, 0.3529412, 0, 1,
-1.472783, -1.272446, -4.183216, 1, 0.3607843, 0, 1,
-1.470984, -0.7856922, -1.30591, 1, 0.3647059, 0, 1,
-1.46797, -0.2060889, -3.598944, 1, 0.372549, 0, 1,
-1.464637, 0.3606287, -2.685728, 1, 0.3764706, 0, 1,
-1.460767, 0.3227381, -0.7637835, 1, 0.3843137, 0, 1,
-1.455109, 1.218736, -0.795482, 1, 0.3882353, 0, 1,
-1.452846, 1.300313, -0.6906077, 1, 0.3960784, 0, 1,
-1.446337, -0.7600795, -0.6259923, 1, 0.4039216, 0, 1,
-1.439452, 0.3208458, -0.4651367, 1, 0.4078431, 0, 1,
-1.43913, -0.6559022, -1.288545, 1, 0.4156863, 0, 1,
-1.428944, 0.5523682, -1.673954, 1, 0.4196078, 0, 1,
-1.422472, 1.146748, -2.057964, 1, 0.427451, 0, 1,
-1.413253, -2.093209, -3.72677, 1, 0.4313726, 0, 1,
-1.410321, 1.147539, 1.371501, 1, 0.4392157, 0, 1,
-1.406863, 0.05666897, -0.5927885, 1, 0.4431373, 0, 1,
-1.404551, 0.2116352, -2.950949, 1, 0.4509804, 0, 1,
-1.39345, 0.4097008, -0.4419154, 1, 0.454902, 0, 1,
-1.390455, 1.215476, -0.5591488, 1, 0.4627451, 0, 1,
-1.389305, -0.6444467, -1.99777, 1, 0.4666667, 0, 1,
-1.387452, -0.8180367, -1.596921, 1, 0.4745098, 0, 1,
-1.379054, -0.5731263, -2.601846, 1, 0.4784314, 0, 1,
-1.378052, 0.4260934, -1.705532, 1, 0.4862745, 0, 1,
-1.362683, -0.4518757, -3.981296, 1, 0.4901961, 0, 1,
-1.358464, 1.52085, -1.127065, 1, 0.4980392, 0, 1,
-1.358315, 1.393533, -2.807041, 1, 0.5058824, 0, 1,
-1.352708, 1.973231, -1.480166, 1, 0.509804, 0, 1,
-1.346607, 0.4973339, -2.446924, 1, 0.5176471, 0, 1,
-1.338211, 0.538456, -2.10908, 1, 0.5215687, 0, 1,
-1.326539, -0.9644368, -2.086103, 1, 0.5294118, 0, 1,
-1.303053, 0.2515, -2.631676, 1, 0.5333334, 0, 1,
-1.276424, -0.6905711, -3.886892, 1, 0.5411765, 0, 1,
-1.275315, -0.9141062, -1.875862, 1, 0.5450981, 0, 1,
-1.258264, -2.020614, -3.433589, 1, 0.5529412, 0, 1,
-1.257779, -0.8267543, -3.038175, 1, 0.5568628, 0, 1,
-1.248492, 1.366199, -0.6855133, 1, 0.5647059, 0, 1,
-1.244207, 3.915679, -0.1900026, 1, 0.5686275, 0, 1,
-1.241861, 0.8080327, -1.48425, 1, 0.5764706, 0, 1,
-1.235995, 0.3641448, -1.752879, 1, 0.5803922, 0, 1,
-1.227815, -0.2700482, -2.680976, 1, 0.5882353, 0, 1,
-1.225175, -1.703187, -0.827199, 1, 0.5921569, 0, 1,
-1.222783, 0.168175, -1.216547, 1, 0.6, 0, 1,
-1.218997, 0.6124011, -1.374483, 1, 0.6078432, 0, 1,
-1.217845, 1.925197, 1.212828, 1, 0.6117647, 0, 1,
-1.211629, -0.367924, -1.73663, 1, 0.6196079, 0, 1,
-1.203478, -0.1625199, -0.1867236, 1, 0.6235294, 0, 1,
-1.1908, -1.635292, -1.813872, 1, 0.6313726, 0, 1,
-1.187055, 1.339341, -1.39974, 1, 0.6352941, 0, 1,
-1.179619, -0.7147526, -3.778395, 1, 0.6431373, 0, 1,
-1.176782, -1.584163, -2.540154, 1, 0.6470588, 0, 1,
-1.160545, -1.564385, -1.74791, 1, 0.654902, 0, 1,
-1.15921, 1.013874, 0.7649276, 1, 0.6588235, 0, 1,
-1.152679, 1.846766, -0.5813034, 1, 0.6666667, 0, 1,
-1.143862, 0.1408942, -1.660188, 1, 0.6705883, 0, 1,
-1.133733, 0.1141208, -0.3888374, 1, 0.6784314, 0, 1,
-1.127993, 0.4631467, -2.710764, 1, 0.682353, 0, 1,
-1.119475, -0.7766088, -2.238444, 1, 0.6901961, 0, 1,
-1.117857, 2.462371, -1.078668, 1, 0.6941177, 0, 1,
-1.115936, -0.1173627, -1.662985, 1, 0.7019608, 0, 1,
-1.107186, -0.04300844, -1.686643, 1, 0.7098039, 0, 1,
-1.106542, -0.02547224, -1.589676, 1, 0.7137255, 0, 1,
-1.104506, -0.03943419, -3.429163, 1, 0.7215686, 0, 1,
-1.100453, 0.3748715, -0.192803, 1, 0.7254902, 0, 1,
-1.098952, -0.006514561, -1.591835, 1, 0.7333333, 0, 1,
-1.098862, -0.4552078, -1.698581, 1, 0.7372549, 0, 1,
-1.092547, -0.06848255, -2.749579, 1, 0.7450981, 0, 1,
-1.09107, 1.315253, -0.7774394, 1, 0.7490196, 0, 1,
-1.089491, 0.3868247, 0.2620523, 1, 0.7568628, 0, 1,
-1.08499, 0.111309, 0.3076225, 1, 0.7607843, 0, 1,
-1.077928, -0.7507611, -1.78389, 1, 0.7686275, 0, 1,
-1.06624, 0.6242641, -1.232921, 1, 0.772549, 0, 1,
-1.063739, -1.75414, -1.443661, 1, 0.7803922, 0, 1,
-1.052998, 0.2202512, -0.7421136, 1, 0.7843137, 0, 1,
-1.049629, 0.5738425, -2.877175, 1, 0.7921569, 0, 1,
-1.045867, -1.880885, -2.148031, 1, 0.7960784, 0, 1,
-1.043923, -0.002619071, -0.3327147, 1, 0.8039216, 0, 1,
-1.043558, -0.2115843, -1.829567, 1, 0.8117647, 0, 1,
-1.043086, 0.1087739, -0.8191686, 1, 0.8156863, 0, 1,
-1.04297, -0.7744375, -2.389043, 1, 0.8235294, 0, 1,
-1.03947, -0.006446475, -2.429541, 1, 0.827451, 0, 1,
-1.014485, -0.4002372, -1.976355, 1, 0.8352941, 0, 1,
-1.009413, -0.6285608, -2.226558, 1, 0.8392157, 0, 1,
-1.00419, -1.02187, -3.051702, 1, 0.8470588, 0, 1,
-1.002813, -0.4159756, -2.417887, 1, 0.8509804, 0, 1,
-1.00086, -0.7654628, -2.23912, 1, 0.8588235, 0, 1,
-0.9930755, -0.9376718, -1.162551, 1, 0.8627451, 0, 1,
-0.9919249, -0.2317674, -2.904964, 1, 0.8705882, 0, 1,
-0.9861253, -1.521218, -1.497267, 1, 0.8745098, 0, 1,
-0.9860852, -0.3253531, -1.188253, 1, 0.8823529, 0, 1,
-0.983274, -1.250794, -2.518452, 1, 0.8862745, 0, 1,
-0.9825874, 0.4243192, 0.6785055, 1, 0.8941177, 0, 1,
-0.9819188, -1.529972, -1.406952, 1, 0.8980392, 0, 1,
-0.9780182, -0.04395855, -1.33908, 1, 0.9058824, 0, 1,
-0.9765398, 0.8118662, -2.02635, 1, 0.9137255, 0, 1,
-0.9756883, 0.01306231, -2.90624, 1, 0.9176471, 0, 1,
-0.9731489, -0.5447059, -2.138427, 1, 0.9254902, 0, 1,
-0.9618117, -0.2279756, -1.452425, 1, 0.9294118, 0, 1,
-0.9614192, 0.3641524, -2.337023, 1, 0.9372549, 0, 1,
-0.9428903, 1.797303, -1.408689, 1, 0.9411765, 0, 1,
-0.9392384, 0.5305517, -2.193594, 1, 0.9490196, 0, 1,
-0.9225467, 0.3627949, -0.7118766, 1, 0.9529412, 0, 1,
-0.9224005, 0.7340281, -0.2142778, 1, 0.9607843, 0, 1,
-0.9215726, -1.414051, 0.1062271, 1, 0.9647059, 0, 1,
-0.9206437, 0.02408366, -0.6410308, 1, 0.972549, 0, 1,
-0.9183092, 0.3902341, -1.319804, 1, 0.9764706, 0, 1,
-0.9153137, -0.5198448, -1.603254, 1, 0.9843137, 0, 1,
-0.911113, 1.183392, -0.4701429, 1, 0.9882353, 0, 1,
-0.9105726, -0.06604152, -1.524706, 1, 0.9960784, 0, 1,
-0.9013848, 0.4821427, 0.04365142, 0.9960784, 1, 0, 1,
-0.9012101, -0.6824058, -2.795565, 0.9921569, 1, 0, 1,
-0.899961, -1.486194, -0.4464849, 0.9843137, 1, 0, 1,
-0.8984844, 0.5462068, -1.711981, 0.9803922, 1, 0, 1,
-0.8973852, -0.1469898, -1.538065, 0.972549, 1, 0, 1,
-0.8966421, -2.125813, -3.107561, 0.9686275, 1, 0, 1,
-0.8837241, -0.2793623, -2.233333, 0.9607843, 1, 0, 1,
-0.8832836, -1.65091, -3.598011, 0.9568627, 1, 0, 1,
-0.8788349, -1.140793, -2.298023, 0.9490196, 1, 0, 1,
-0.8757471, -1.319938, -3.486156, 0.945098, 1, 0, 1,
-0.872082, 1.971595, -0.5226845, 0.9372549, 1, 0, 1,
-0.8700468, 0.4724854, -0.3124411, 0.9333333, 1, 0, 1,
-0.864497, -1.663502, -2.468473, 0.9254902, 1, 0, 1,
-0.8626261, 0.7840817, -1.231452, 0.9215686, 1, 0, 1,
-0.8521689, -0.9074146, -3.281204, 0.9137255, 1, 0, 1,
-0.8485175, 0.3834431, -0.7055321, 0.9098039, 1, 0, 1,
-0.8467395, -0.4710928, -1.766851, 0.9019608, 1, 0, 1,
-0.835321, -0.03939191, -2.029147, 0.8941177, 1, 0, 1,
-0.8332447, 0.6888255, -1.87008, 0.8901961, 1, 0, 1,
-0.8279379, 1.298725, -1.915187, 0.8823529, 1, 0, 1,
-0.8241292, -0.6582379, -2.018691, 0.8784314, 1, 0, 1,
-0.8215598, 0.8661075, -1.277987, 0.8705882, 1, 0, 1,
-0.8202402, 0.7701381, -1.889021, 0.8666667, 1, 0, 1,
-0.8171398, -1.548074, -2.284969, 0.8588235, 1, 0, 1,
-0.8149868, -0.3726678, -1.904268, 0.854902, 1, 0, 1,
-0.8123466, 0.6031879, -1.476152, 0.8470588, 1, 0, 1,
-0.8114154, -0.4078812, -2.444794, 0.8431373, 1, 0, 1,
-0.7968694, 2.018163, 0.6072041, 0.8352941, 1, 0, 1,
-0.7885733, 0.3909234, 0.2379103, 0.8313726, 1, 0, 1,
-0.7877103, -0.4606399, -1.246608, 0.8235294, 1, 0, 1,
-0.7861705, 0.1819098, 0.8547553, 0.8196079, 1, 0, 1,
-0.7835445, -0.968119, -3.247641, 0.8117647, 1, 0, 1,
-0.7805808, -0.6701156, -1.625892, 0.8078431, 1, 0, 1,
-0.7730879, -0.3958788, -1.937752, 0.8, 1, 0, 1,
-0.7718697, 0.2242913, -1.842318, 0.7921569, 1, 0, 1,
-0.7699041, -1.19832, -0.4632523, 0.7882353, 1, 0, 1,
-0.7696759, -0.581223, -3.009827, 0.7803922, 1, 0, 1,
-0.7630243, -1.177586, -4.031822, 0.7764706, 1, 0, 1,
-0.7620931, 1.460062, -0.3330562, 0.7686275, 1, 0, 1,
-0.7578177, 0.7877848, -1.164348, 0.7647059, 1, 0, 1,
-0.7564598, -0.6199738, -3.123814, 0.7568628, 1, 0, 1,
-0.7495546, -0.3471684, -2.144848, 0.7529412, 1, 0, 1,
-0.7477725, -0.9084731, -1.595518, 0.7450981, 1, 0, 1,
-0.7462127, -0.08185551, -2.416114, 0.7411765, 1, 0, 1,
-0.7448592, 0.4085791, -2.621827, 0.7333333, 1, 0, 1,
-0.7339972, 0.7108174, -1.554586, 0.7294118, 1, 0, 1,
-0.7309319, 0.0211551, -1.297519, 0.7215686, 1, 0, 1,
-0.7256807, 0.1933117, -1.728867, 0.7176471, 1, 0, 1,
-0.7158824, -0.2299435, -1.676509, 0.7098039, 1, 0, 1,
-0.7140623, -1.174782, -3.788635, 0.7058824, 1, 0, 1,
-0.7103515, -0.9332865, -0.6281065, 0.6980392, 1, 0, 1,
-0.7017289, -0.8467695, -1.508174, 0.6901961, 1, 0, 1,
-0.699955, 1.509459, -2.58717, 0.6862745, 1, 0, 1,
-0.6930807, -0.09560345, -0.7066153, 0.6784314, 1, 0, 1,
-0.6911671, -0.4823552, -0.873818, 0.6745098, 1, 0, 1,
-0.6908839, -0.856822, -2.53077, 0.6666667, 1, 0, 1,
-0.6905137, -0.1737385, -1.645362, 0.6627451, 1, 0, 1,
-0.6899001, -0.5287934, -2.021579, 0.654902, 1, 0, 1,
-0.6892855, -2.480005, -2.039871, 0.6509804, 1, 0, 1,
-0.6888306, -0.7310572, -1.2444, 0.6431373, 1, 0, 1,
-0.6787654, 0.2130031, -1.591962, 0.6392157, 1, 0, 1,
-0.676946, 0.4518238, -1.460486, 0.6313726, 1, 0, 1,
-0.6741338, 0.5188531, -0.9164906, 0.627451, 1, 0, 1,
-0.6720583, -1.106404, -3.728212, 0.6196079, 1, 0, 1,
-0.6690437, 0.5003614, -1.337705, 0.6156863, 1, 0, 1,
-0.6665332, 0.5023372, -1.319081, 0.6078432, 1, 0, 1,
-0.6663594, -0.1882303, -2.440848, 0.6039216, 1, 0, 1,
-0.6633268, -0.06258856, -3.798784, 0.5960785, 1, 0, 1,
-0.6628901, -0.6679608, -3.645436, 0.5882353, 1, 0, 1,
-0.6599236, 0.6486542, 0.9587245, 0.5843138, 1, 0, 1,
-0.649955, 0.8666973, -0.8594785, 0.5764706, 1, 0, 1,
-0.6485153, 0.2149143, -1.397163, 0.572549, 1, 0, 1,
-0.6482875, -1.101901, -4.351857, 0.5647059, 1, 0, 1,
-0.6458583, 0.7670896, -0.8897346, 0.5607843, 1, 0, 1,
-0.644354, -0.1546778, -3.572528, 0.5529412, 1, 0, 1,
-0.6438297, -0.303097, -1.920932, 0.5490196, 1, 0, 1,
-0.6433383, -0.1750719, -2.571596, 0.5411765, 1, 0, 1,
-0.642742, 0.1077081, -1.64789, 0.5372549, 1, 0, 1,
-0.6381878, 0.4754781, -1.260906, 0.5294118, 1, 0, 1,
-0.6348405, -1.623331, -3.807048, 0.5254902, 1, 0, 1,
-0.6336942, 0.7875521, 0.4416818, 0.5176471, 1, 0, 1,
-0.6332273, 1.254366, 0.02239681, 0.5137255, 1, 0, 1,
-0.6331885, -0.05173494, -1.062277, 0.5058824, 1, 0, 1,
-0.6331185, -0.620863, -1.412812, 0.5019608, 1, 0, 1,
-0.6328344, -1.878939, -3.08817, 0.4941176, 1, 0, 1,
-0.6077273, 0.01528441, -1.403631, 0.4862745, 1, 0, 1,
-0.6050318, -2.762292, -2.187534, 0.4823529, 1, 0, 1,
-0.5985024, 0.7899225, -1.035246, 0.4745098, 1, 0, 1,
-0.5984623, -0.7993122, -2.307331, 0.4705882, 1, 0, 1,
-0.5974804, 1.318586, 0.6902991, 0.4627451, 1, 0, 1,
-0.5952137, -0.09131235, -0.7986665, 0.4588235, 1, 0, 1,
-0.5942807, -0.218906, -2.249148, 0.4509804, 1, 0, 1,
-0.5919035, -0.9718632, -1.712372, 0.4470588, 1, 0, 1,
-0.5913221, -0.8634517, -0.1808596, 0.4392157, 1, 0, 1,
-0.5855851, 0.1026951, -0.3145566, 0.4352941, 1, 0, 1,
-0.5846624, 0.2557706, -2.031475, 0.427451, 1, 0, 1,
-0.5829167, -0.2461977, -2.5365, 0.4235294, 1, 0, 1,
-0.582105, -0.7576647, -2.629421, 0.4156863, 1, 0, 1,
-0.5816906, 0.8185967, -0.3277475, 0.4117647, 1, 0, 1,
-0.5801485, 0.04454352, 0.6525147, 0.4039216, 1, 0, 1,
-0.5799183, 0.2695436, -0.3789121, 0.3960784, 1, 0, 1,
-0.5773638, -0.7098874, -2.148128, 0.3921569, 1, 0, 1,
-0.5729735, -0.2297726, -3.617878, 0.3843137, 1, 0, 1,
-0.569728, 0.3178739, -1.89505, 0.3803922, 1, 0, 1,
-0.5697158, 0.4500934, -1.807134, 0.372549, 1, 0, 1,
-0.569007, -1.425327, -2.223811, 0.3686275, 1, 0, 1,
-0.5684684, 1.748213, -0.8447462, 0.3607843, 1, 0, 1,
-0.5668113, -0.6872464, -2.583406, 0.3568628, 1, 0, 1,
-0.5667714, 0.2471642, -1.35826, 0.3490196, 1, 0, 1,
-0.5634084, 0.723523, -0.01321539, 0.345098, 1, 0, 1,
-0.5572457, 1.391928, -2.650269, 0.3372549, 1, 0, 1,
-0.5571893, -1.359556, -2.906767, 0.3333333, 1, 0, 1,
-0.5517719, -0.2553151, -4.736701, 0.3254902, 1, 0, 1,
-0.5502422, -0.8382139, -3.400841, 0.3215686, 1, 0, 1,
-0.5461802, 1.013207, 0.7966193, 0.3137255, 1, 0, 1,
-0.5455408, -0.7109225, -2.891547, 0.3098039, 1, 0, 1,
-0.5441998, 1.513245, 0.6902393, 0.3019608, 1, 0, 1,
-0.5428257, 0.1599104, -2.3367, 0.2941177, 1, 0, 1,
-0.5416834, 1.352976, -0.3286571, 0.2901961, 1, 0, 1,
-0.5344579, -1.399522, -0.6126236, 0.282353, 1, 0, 1,
-0.5341029, 1.059565, -0.1348809, 0.2784314, 1, 0, 1,
-0.528626, 1.290732, 0.637475, 0.2705882, 1, 0, 1,
-0.5257481, 1.297294, 0.6826417, 0.2666667, 1, 0, 1,
-0.5230688, 0.9690072, -0.3241448, 0.2588235, 1, 0, 1,
-0.5218797, -2.062204, -3.344144, 0.254902, 1, 0, 1,
-0.5168801, 0.08486785, -0.8594688, 0.2470588, 1, 0, 1,
-0.5132163, -1.109728, -5.87665, 0.2431373, 1, 0, 1,
-0.5128581, -1.788051, -0.8640078, 0.2352941, 1, 0, 1,
-0.5118496, 1.440934, 0.9129559, 0.2313726, 1, 0, 1,
-0.5117906, -0.4493297, -2.116224, 0.2235294, 1, 0, 1,
-0.5097104, 0.697836, -0.0489222, 0.2196078, 1, 0, 1,
-0.5033222, 0.001663564, -2.798652, 0.2117647, 1, 0, 1,
-0.5031704, 1.526418, -0.4980295, 0.2078431, 1, 0, 1,
-0.5018188, 1.45626, -0.454354, 0.2, 1, 0, 1,
-0.4990821, -0.7016644, -1.457152, 0.1921569, 1, 0, 1,
-0.4977992, -0.9058608, -0.6241248, 0.1882353, 1, 0, 1,
-0.4924159, -0.4528067, -1.704394, 0.1803922, 1, 0, 1,
-0.4910494, 0.5031892, -0.3701381, 0.1764706, 1, 0, 1,
-0.4889254, -0.4821147, -2.061781, 0.1686275, 1, 0, 1,
-0.4804296, 0.2310941, -0.2786402, 0.1647059, 1, 0, 1,
-0.4760337, 1.10012, -1.746095, 0.1568628, 1, 0, 1,
-0.4750925, 0.8800845, -0.4018015, 0.1529412, 1, 0, 1,
-0.4748506, 0.6908996, -0.1223054, 0.145098, 1, 0, 1,
-0.4748119, -0.4889367, -1.992835, 0.1411765, 1, 0, 1,
-0.4732139, 0.1884191, -0.2124555, 0.1333333, 1, 0, 1,
-0.4696189, 0.5521896, -2.275858, 0.1294118, 1, 0, 1,
-0.4685468, -0.4179706, -4.541389, 0.1215686, 1, 0, 1,
-0.4581413, -0.930296, -2.962969, 0.1176471, 1, 0, 1,
-0.4540209, 1.416672, -1.804578, 0.1098039, 1, 0, 1,
-0.4487039, 0.9180168, 0.04839458, 0.1058824, 1, 0, 1,
-0.4467576, -1.46935, -2.127547, 0.09803922, 1, 0, 1,
-0.4387597, -1.314454, -2.20972, 0.09019608, 1, 0, 1,
-0.4372162, -0.3412699, -3.406806, 0.08627451, 1, 0, 1,
-0.4370601, -0.7204268, -3.001489, 0.07843138, 1, 0, 1,
-0.4329018, 0.1905597, -1.737914, 0.07450981, 1, 0, 1,
-0.4327679, -1.513377, -3.639729, 0.06666667, 1, 0, 1,
-0.4327211, 0.4672961, -2.22589, 0.0627451, 1, 0, 1,
-0.4295071, -0.8243397, -1.922832, 0.05490196, 1, 0, 1,
-0.4286667, 0.8289099, -2.809931, 0.05098039, 1, 0, 1,
-0.4282165, -0.719683, -1.605147, 0.04313726, 1, 0, 1,
-0.4229403, -0.06444777, -1.768546, 0.03921569, 1, 0, 1,
-0.422765, -0.5434144, -1.375678, 0.03137255, 1, 0, 1,
-0.419358, -0.4533842, -2.719758, 0.02745098, 1, 0, 1,
-0.419329, -0.7502128, -3.812564, 0.01960784, 1, 0, 1,
-0.4186873, -0.3070915, -3.433957, 0.01568628, 1, 0, 1,
-0.4055288, 0.1144077, -2.099405, 0.007843138, 1, 0, 1,
-0.4041517, -2.297414, -3.27944, 0.003921569, 1, 0, 1,
-0.4029242, -0.01430316, -4.535602, 0, 1, 0.003921569, 1,
-0.3988495, 0.7543042, 1.201255, 0, 1, 0.01176471, 1,
-0.3953267, 0.6701422, -0.3757453, 0, 1, 0.01568628, 1,
-0.3936943, -0.3427824, -2.688403, 0, 1, 0.02352941, 1,
-0.381718, -0.6123746, -2.834303, 0, 1, 0.02745098, 1,
-0.3750575, -1.01518, -2.23201, 0, 1, 0.03529412, 1,
-0.3721015, 0.5629398, -1.137383, 0, 1, 0.03921569, 1,
-0.3681833, 0.8439997, 1.373918, 0, 1, 0.04705882, 1,
-0.3677351, -0.05373548, -1.459046, 0, 1, 0.05098039, 1,
-0.3611883, -0.8967066, -5.050863, 0, 1, 0.05882353, 1,
-0.3607758, -0.6948445, -3.971415, 0, 1, 0.0627451, 1,
-0.3605658, -0.5672924, -1.722481, 0, 1, 0.07058824, 1,
-0.3596676, 1.014317, -1.295394, 0, 1, 0.07450981, 1,
-0.3540298, 1.210764, -1.103012, 0, 1, 0.08235294, 1,
-0.3532719, -1.347695, -4.410099, 0, 1, 0.08627451, 1,
-0.3532307, 1.992963, -0.2007346, 0, 1, 0.09411765, 1,
-0.3522626, 0.3360179, -0.2645114, 0, 1, 0.1019608, 1,
-0.351192, 1.654495, -1.943046, 0, 1, 0.1058824, 1,
-0.347182, 0.3530028, -0.7412476, 0, 1, 0.1137255, 1,
-0.3463573, -0.1180347, -0.1358191, 0, 1, 0.1176471, 1,
-0.3429282, -1.746706, -3.256371, 0, 1, 0.1254902, 1,
-0.3382389, -0.7040167, -1.990214, 0, 1, 0.1294118, 1,
-0.3365201, -0.2855251, -2.133685, 0, 1, 0.1372549, 1,
-0.3361555, 0.6208197, -1.483594, 0, 1, 0.1411765, 1,
-0.3349876, 0.3117321, -0.5946637, 0, 1, 0.1490196, 1,
-0.3347496, 0.8559108, -0.2733922, 0, 1, 0.1529412, 1,
-0.333871, 0.2579972, -0.663083, 0, 1, 0.1607843, 1,
-0.3318017, -0.7013175, -3.330796, 0, 1, 0.1647059, 1,
-0.3294095, -1.281745, -0.4892693, 0, 1, 0.172549, 1,
-0.3285922, -0.1779277, -1.310469, 0, 1, 0.1764706, 1,
-0.3238183, -0.1436623, -2.100093, 0, 1, 0.1843137, 1,
-0.3205992, -1.122268, -3.369541, 0, 1, 0.1882353, 1,
-0.3196343, -0.4186086, -1.377958, 0, 1, 0.1960784, 1,
-0.3195678, 2.063213, -0.8194723, 0, 1, 0.2039216, 1,
-0.3191095, 0.7059274, -2.043105, 0, 1, 0.2078431, 1,
-0.3174162, 0.2029809, -3.40487, 0, 1, 0.2156863, 1,
-0.3167113, 2.36422, -0.5376841, 0, 1, 0.2196078, 1,
-0.3166231, 1.501761, -0.4953085, 0, 1, 0.227451, 1,
-0.3136059, -1.176552, -2.937181, 0, 1, 0.2313726, 1,
-0.3131732, -0.5470876, -3.122345, 0, 1, 0.2392157, 1,
-0.3069121, -0.5691026, -2.371064, 0, 1, 0.2431373, 1,
-0.3023601, -1.795358, -1.718403, 0, 1, 0.2509804, 1,
-0.2990218, -0.578509, -2.503613, 0, 1, 0.254902, 1,
-0.2924535, -1.185308, -3.301022, 0, 1, 0.2627451, 1,
-0.2893679, -0.05573886, -3.185639, 0, 1, 0.2666667, 1,
-0.2892188, -1.683823, -2.208226, 0, 1, 0.2745098, 1,
-0.2884273, 0.8164979, 0.5602705, 0, 1, 0.2784314, 1,
-0.2861043, 0.9133425, -0.4395827, 0, 1, 0.2862745, 1,
-0.2850877, -0.1508561, -2.027968, 0, 1, 0.2901961, 1,
-0.2841491, -0.2760062, -2.630919, 0, 1, 0.2980392, 1,
-0.2838943, 1.15263, -0.2228068, 0, 1, 0.3058824, 1,
-0.2822452, 1.007818, 1.323381, 0, 1, 0.3098039, 1,
-0.2801737, 0.7801031, 1.465858, 0, 1, 0.3176471, 1,
-0.2777553, -1.26342, -3.691521, 0, 1, 0.3215686, 1,
-0.2754948, -0.482627, -3.187157, 0, 1, 0.3294118, 1,
-0.2741556, -2.075544, -3.232279, 0, 1, 0.3333333, 1,
-0.2736706, -1.029659, -2.782012, 0, 1, 0.3411765, 1,
-0.27078, 1.572591, 1.483021, 0, 1, 0.345098, 1,
-0.2669957, -0.4451752, -3.814121, 0, 1, 0.3529412, 1,
-0.2613217, 0.02633078, -1.599129, 0, 1, 0.3568628, 1,
-0.2609332, 0.1627682, -0.9778224, 0, 1, 0.3647059, 1,
-0.2584823, 0.9548469, -0.6554734, 0, 1, 0.3686275, 1,
-0.2550412, 1.040784, 0.4949456, 0, 1, 0.3764706, 1,
-0.2537575, -0.4072294, -3.709907, 0, 1, 0.3803922, 1,
-0.2519507, 0.3032203, -0.9826727, 0, 1, 0.3882353, 1,
-0.2513505, 2.635364, 0.4708554, 0, 1, 0.3921569, 1,
-0.2499094, -0.7902066, -2.20664, 0, 1, 0.4, 1,
-0.2498162, 1.90686, 0.1517583, 0, 1, 0.4078431, 1,
-0.2445766, -1.732414, -3.422424, 0, 1, 0.4117647, 1,
-0.2404485, -0.6531396, -1.723918, 0, 1, 0.4196078, 1,
-0.2395149, 0.9839771, -0.632095, 0, 1, 0.4235294, 1,
-0.239133, 2.434098, 0.05586959, 0, 1, 0.4313726, 1,
-0.2358533, 0.3053962, -1.291985, 0, 1, 0.4352941, 1,
-0.2332989, -0.5219266, -3.186097, 0, 1, 0.4431373, 1,
-0.2327856, 0.6428425, -0.4458973, 0, 1, 0.4470588, 1,
-0.2228502, 1.528662, 0.1445794, 0, 1, 0.454902, 1,
-0.2222927, -0.3077561, -4.011378, 0, 1, 0.4588235, 1,
-0.2203878, 0.8783858, -2.297905, 0, 1, 0.4666667, 1,
-0.2200139, 0.8008193, -0.5802655, 0, 1, 0.4705882, 1,
-0.2199969, 0.0864705, -1.530305, 0, 1, 0.4784314, 1,
-0.2179811, -0.4112917, -2.456115, 0, 1, 0.4823529, 1,
-0.2174146, 0.8095623, -1.132883, 0, 1, 0.4901961, 1,
-0.2112381, -0.6070163, -2.764166, 0, 1, 0.4941176, 1,
-0.2079074, -0.9295009, -2.880889, 0, 1, 0.5019608, 1,
-0.2047155, 1.234033, -1.525657, 0, 1, 0.509804, 1,
-0.2026058, -0.2679714, -3.285522, 0, 1, 0.5137255, 1,
-0.2019966, 0.9253031, -0.6941518, 0, 1, 0.5215687, 1,
-0.1909696, 0.08827635, -1.483409, 0, 1, 0.5254902, 1,
-0.1849189, 1.447458, 0.5275987, 0, 1, 0.5333334, 1,
-0.1845826, 1.05164, -0.5596018, 0, 1, 0.5372549, 1,
-0.1773631, 0.2593518, -2.791745, 0, 1, 0.5450981, 1,
-0.1721635, -3.227796, -2.373708, 0, 1, 0.5490196, 1,
-0.1701082, 0.7915826, -0.23084, 0, 1, 0.5568628, 1,
-0.1688214, -0.05852467, -3.299788, 0, 1, 0.5607843, 1,
-0.1685772, -0.4682835, -4.458624, 0, 1, 0.5686275, 1,
-0.1672549, -0.6932487, -4.163154, 0, 1, 0.572549, 1,
-0.1651874, 0.2509572, 1.727875, 0, 1, 0.5803922, 1,
-0.1616447, 1.376119, -0.2848622, 0, 1, 0.5843138, 1,
-0.153344, 0.496033, -1.335897, 0, 1, 0.5921569, 1,
-0.1502897, 0.9431249, 0.5649418, 0, 1, 0.5960785, 1,
-0.1494766, 0.8202794, -0.6429986, 0, 1, 0.6039216, 1,
-0.1451803, 0.3132766, -1.372359, 0, 1, 0.6117647, 1,
-0.1448932, -0.6934263, -1.999806, 0, 1, 0.6156863, 1,
-0.1435098, -1.24824, -2.76713, 0, 1, 0.6235294, 1,
-0.1397217, 0.3975769, -0.2891555, 0, 1, 0.627451, 1,
-0.129374, -0.3103129, -1.37209, 0, 1, 0.6352941, 1,
-0.129146, -0.4369668, -3.076404, 0, 1, 0.6392157, 1,
-0.1273369, -1.757429, -2.953498, 0, 1, 0.6470588, 1,
-0.1265635, -1.034618, -2.005803, 0, 1, 0.6509804, 1,
-0.1251609, -0.6736885, -4.300883, 0, 1, 0.6588235, 1,
-0.1235856, 0.218742, -2.267668, 0, 1, 0.6627451, 1,
-0.1214337, 0.2452582, -0.8471586, 0, 1, 0.6705883, 1,
-0.1199524, 0.6091322, 1.153459, 0, 1, 0.6745098, 1,
-0.1193962, -0.8627663, -1.659808, 0, 1, 0.682353, 1,
-0.1187629, 2.446901, 1.338081, 0, 1, 0.6862745, 1,
-0.1135259, -0.8568497, -2.525645, 0, 1, 0.6941177, 1,
-0.1069072, 0.2599876, -0.2684016, 0, 1, 0.7019608, 1,
-0.1068332, 2.152885, -0.4424311, 0, 1, 0.7058824, 1,
-0.1048989, 0.9593732, 0.2525035, 0, 1, 0.7137255, 1,
-0.1039152, 2.249611, 0.5540652, 0, 1, 0.7176471, 1,
-0.1038279, 1.19925, 0.07525969, 0, 1, 0.7254902, 1,
-0.1022553, 0.3757318, -0.6415496, 0, 1, 0.7294118, 1,
-0.09840383, 0.4598455, 0.1070179, 0, 1, 0.7372549, 1,
-0.09442044, 1.424163, 1.486046, 0, 1, 0.7411765, 1,
-0.091585, 0.4817124, -0.7223625, 0, 1, 0.7490196, 1,
-0.09100351, 0.3461496, -0.4900304, 0, 1, 0.7529412, 1,
-0.08866246, 0.1619068, -1.061866, 0, 1, 0.7607843, 1,
-0.08803546, 0.7456942, 0.9956113, 0, 1, 0.7647059, 1,
-0.08795048, 0.4973121, 1.478172, 0, 1, 0.772549, 1,
-0.08523244, 0.2295135, -1.423504, 0, 1, 0.7764706, 1,
-0.08444702, -1.229734, -1.159031, 0, 1, 0.7843137, 1,
-0.08065142, 0.4561331, 0.2097404, 0, 1, 0.7882353, 1,
-0.08037539, 1.68077, 0.1978047, 0, 1, 0.7960784, 1,
-0.07456508, -2.185538, -1.50138, 0, 1, 0.8039216, 1,
-0.07306011, 0.7553226, 0.5586435, 0, 1, 0.8078431, 1,
-0.07129228, 1.443601, -2.204185, 0, 1, 0.8156863, 1,
-0.07092811, 0.6519309, -0.7672942, 0, 1, 0.8196079, 1,
-0.0703726, -0.609825, -1.790887, 0, 1, 0.827451, 1,
-0.06883613, 1.603287, 1.887971, 0, 1, 0.8313726, 1,
-0.06671907, -0.285642, -2.177338, 0, 1, 0.8392157, 1,
-0.06413861, -0.3989047, -4.177644, 0, 1, 0.8431373, 1,
-0.06402181, -0.7426902, -2.868097, 0, 1, 0.8509804, 1,
-0.06174158, 1.956784, -0.05305706, 0, 1, 0.854902, 1,
-0.0609777, -2.577208, -1.794084, 0, 1, 0.8627451, 1,
-0.0604705, 1.28506, -0.5406799, 0, 1, 0.8666667, 1,
-0.06023347, -1.081616, -3.914101, 0, 1, 0.8745098, 1,
-0.05988859, 0.5728753, 0.5959591, 0, 1, 0.8784314, 1,
-0.05588249, -0.4061018, -3.716037, 0, 1, 0.8862745, 1,
-0.05481566, 1.395939, 0.9296231, 0, 1, 0.8901961, 1,
-0.05235703, -0.2711387, -3.736136, 0, 1, 0.8980392, 1,
-0.05078555, -1.339053, -2.540415, 0, 1, 0.9058824, 1,
-0.04809504, -2.05329, -2.157998, 0, 1, 0.9098039, 1,
-0.04289135, -1.894435, -3.356417, 0, 1, 0.9176471, 1,
-0.04100559, 0.2985308, 2.400975, 0, 1, 0.9215686, 1,
-0.04094826, 1.252571, -1.419497, 0, 1, 0.9294118, 1,
-0.03765361, -0.503452, -2.451352, 0, 1, 0.9333333, 1,
-0.0372633, 0.4052349, 0.2819542, 0, 1, 0.9411765, 1,
-0.03673127, -1.383184, -3.467605, 0, 1, 0.945098, 1,
-0.03225641, -0.01518377, -1.850534, 0, 1, 0.9529412, 1,
-0.03090199, -1.382982, -4.42071, 0, 1, 0.9568627, 1,
-0.0304201, -0.2669522, -2.934442, 0, 1, 0.9647059, 1,
-0.0295772, 0.6940069, 1.024857, 0, 1, 0.9686275, 1,
-0.02869888, -0.3461685, -2.883746, 0, 1, 0.9764706, 1,
-0.02627155, -1.121747, -2.966257, 0, 1, 0.9803922, 1,
-0.02626394, 1.474286, 0.09149098, 0, 1, 0.9882353, 1,
-0.02575561, 0.5134141, 0.4616535, 0, 1, 0.9921569, 1,
-0.02516345, -1.127133, -3.918233, 0, 1, 1, 1,
-0.02252507, -1.279215, -2.258008, 0, 0.9921569, 1, 1,
-0.0212306, 0.7631777, -0.1377573, 0, 0.9882353, 1, 1,
-0.01365996, -0.1355703, -2.875576, 0, 0.9803922, 1, 1,
-0.00880296, 0.404246, 1.128031, 0, 0.9764706, 1, 1,
-0.003665618, -0.9890868, -2.676765, 0, 0.9686275, 1, 1,
-0.001784706, 0.9241874, -2.114547, 0, 0.9647059, 1, 1,
-0.00171061, 0.6150696, 0.8116693, 0, 0.9568627, 1, 1,
-0.0006534878, 0.3988398, 0.152059, 0, 0.9529412, 1, 1,
-0.0003391291, -0.9644554, -5.451545, 0, 0.945098, 1, 1,
0.001790337, 0.7157528, 0.1070418, 0, 0.9411765, 1, 1,
0.002559036, -0.3347344, 2.764699, 0, 0.9333333, 1, 1,
0.006683233, -0.337807, 2.911691, 0, 0.9294118, 1, 1,
0.009409217, 2.04198, 0.8627183, 0, 0.9215686, 1, 1,
0.009928529, -0.2720706, 3.808334, 0, 0.9176471, 1, 1,
0.01253921, -0.5859879, 2.556134, 0, 0.9098039, 1, 1,
0.01505935, -0.4344293, 4.491421, 0, 0.9058824, 1, 1,
0.01607447, 0.6595176, -0.3121063, 0, 0.8980392, 1, 1,
0.01634614, -0.2871282, 3.444411, 0, 0.8901961, 1, 1,
0.01662427, -0.6719043, 2.584546, 0, 0.8862745, 1, 1,
0.01850417, -0.1406594, 2.716111, 0, 0.8784314, 1, 1,
0.01931971, 0.2380753, 0.6507337, 0, 0.8745098, 1, 1,
0.02112707, -1.385791, 2.875983, 0, 0.8666667, 1, 1,
0.02506954, -1.335821, 3.266068, 0, 0.8627451, 1, 1,
0.02652678, -0.4508424, 2.054516, 0, 0.854902, 1, 1,
0.03148704, -0.2425496, 2.960505, 0, 0.8509804, 1, 1,
0.03196719, 0.150532, -0.6545727, 0, 0.8431373, 1, 1,
0.03275697, -0.3387051, 2.320403, 0, 0.8392157, 1, 1,
0.03518432, 0.5137036, 0.5912138, 0, 0.8313726, 1, 1,
0.0384726, 0.5844363, 0.5135827, 0, 0.827451, 1, 1,
0.038937, 1.505023, 0.6940219, 0, 0.8196079, 1, 1,
0.04033981, -0.4878275, 2.619927, 0, 0.8156863, 1, 1,
0.04636406, 0.1347672, 0.7368079, 0, 0.8078431, 1, 1,
0.04636486, -0.04793524, 0.961087, 0, 0.8039216, 1, 1,
0.04673149, -1.198258, 3.569605, 0, 0.7960784, 1, 1,
0.04889168, -0.354025, 3.019146, 0, 0.7882353, 1, 1,
0.0520156, -1.265137, 3.50399, 0, 0.7843137, 1, 1,
0.05916438, -0.8715667, 3.430933, 0, 0.7764706, 1, 1,
0.05983879, 1.563344, 1.218568, 0, 0.772549, 1, 1,
0.06078243, 0.3123474, 0.0641313, 0, 0.7647059, 1, 1,
0.06221892, 0.9818938, 1.652748, 0, 0.7607843, 1, 1,
0.06360245, -1.174627, 3.272129, 0, 0.7529412, 1, 1,
0.0702994, 0.3886134, 0.659301, 0, 0.7490196, 1, 1,
0.07343837, -0.6493867, 3.754817, 0, 0.7411765, 1, 1,
0.07570224, -0.1514214, 1.478463, 0, 0.7372549, 1, 1,
0.08125889, -1.495947, 2.347759, 0, 0.7294118, 1, 1,
0.08142227, -0.692925, 3.41434, 0, 0.7254902, 1, 1,
0.0829919, 0.6285972, -0.9229403, 0, 0.7176471, 1, 1,
0.0833732, 0.06605846, 1.791007, 0, 0.7137255, 1, 1,
0.08846104, 1.427777, 1.091185, 0, 0.7058824, 1, 1,
0.0925684, 0.6457242, 0.3708801, 0, 0.6980392, 1, 1,
0.09453239, -1.044405, 2.339047, 0, 0.6941177, 1, 1,
0.09457509, -0.06978799, 3.139758, 0, 0.6862745, 1, 1,
0.09591848, -1.314442, 4.87282, 0, 0.682353, 1, 1,
0.09649314, 1.280759, -0.07292456, 0, 0.6745098, 1, 1,
0.09783544, -0.348679, 1.317226, 0, 0.6705883, 1, 1,
0.09903973, -0.6561114, 4.330406, 0, 0.6627451, 1, 1,
0.1014382, 0.1868224, 1.463531, 0, 0.6588235, 1, 1,
0.1019176, -1.200616, 2.298315, 0, 0.6509804, 1, 1,
0.1032365, -2.288478, 2.778062, 0, 0.6470588, 1, 1,
0.108357, 0.9443416, 1.087272, 0, 0.6392157, 1, 1,
0.1094809, -0.8044744, 1.806845, 0, 0.6352941, 1, 1,
0.122934, -0.3818449, 2.811455, 0, 0.627451, 1, 1,
0.1253769, 0.9038167, 0.9191028, 0, 0.6235294, 1, 1,
0.1271503, 0.6998197, 1.414225, 0, 0.6156863, 1, 1,
0.1324356, 0.2391698, -0.9117174, 0, 0.6117647, 1, 1,
0.1365458, -0.9574194, 2.989065, 0, 0.6039216, 1, 1,
0.1378545, -0.7881486, 4.065483, 0, 0.5960785, 1, 1,
0.1396848, 0.5430022, 0.7023574, 0, 0.5921569, 1, 1,
0.1442629, -0.08732589, 3.572174, 0, 0.5843138, 1, 1,
0.1489268, -1.195885, 1.440925, 0, 0.5803922, 1, 1,
0.1509213, 0.506775, -0.1166514, 0, 0.572549, 1, 1,
0.1539982, -0.535084, 3.353448, 0, 0.5686275, 1, 1,
0.1540473, -1.920742, 4.115423, 0, 0.5607843, 1, 1,
0.160114, 0.05242183, 1.840019, 0, 0.5568628, 1, 1,
0.1618006, -0.2289481, 2.524646, 0, 0.5490196, 1, 1,
0.1621023, 1.204553, -0.2001992, 0, 0.5450981, 1, 1,
0.1676456, 0.06780916, 0.7135528, 0, 0.5372549, 1, 1,
0.1757965, -0.1210818, 2.5281, 0, 0.5333334, 1, 1,
0.1770047, -0.1961184, 2.833596, 0, 0.5254902, 1, 1,
0.1785679, -0.09229779, 1.121855, 0, 0.5215687, 1, 1,
0.1786869, -1.112643, 4.306539, 0, 0.5137255, 1, 1,
0.1820215, 1.082188, -0.5619278, 0, 0.509804, 1, 1,
0.1852476, -0.9745871, 1.72717, 0, 0.5019608, 1, 1,
0.185688, 0.133476, 0.7857755, 0, 0.4941176, 1, 1,
0.186666, 0.2819849, -1.874293, 0, 0.4901961, 1, 1,
0.192157, -0.01173082, 0.7803012, 0, 0.4823529, 1, 1,
0.1923951, 0.004795106, 1.881813, 0, 0.4784314, 1, 1,
0.1945287, 1.365131, 1.602208, 0, 0.4705882, 1, 1,
0.1953275, 1.228387, -2.743777, 0, 0.4666667, 1, 1,
0.1954597, -0.8375804, 3.052122, 0, 0.4588235, 1, 1,
0.1961904, -0.2805772, 2.509065, 0, 0.454902, 1, 1,
0.197671, -0.2101581, 2.189055, 0, 0.4470588, 1, 1,
0.1994743, -1.035704, 3.203379, 0, 0.4431373, 1, 1,
0.2025481, 0.8316724, 0.5823764, 0, 0.4352941, 1, 1,
0.2049095, 0.7838432, 0.2782741, 0, 0.4313726, 1, 1,
0.2101542, -1.931184, 3.233048, 0, 0.4235294, 1, 1,
0.2132475, 0.2840106, 1.099838, 0, 0.4196078, 1, 1,
0.2133225, -0.08671793, 1.127904, 0, 0.4117647, 1, 1,
0.2161576, -0.8833133, 3.064853, 0, 0.4078431, 1, 1,
0.2205698, 0.1075074, -0.4835778, 0, 0.4, 1, 1,
0.22133, 0.4816436, 1.024566, 0, 0.3921569, 1, 1,
0.2215942, 0.3122947, 2.527575, 0, 0.3882353, 1, 1,
0.223291, -1.009499, 1.897465, 0, 0.3803922, 1, 1,
0.2264237, 2.274727, 0.3266115, 0, 0.3764706, 1, 1,
0.2265478, -0.02818494, -0.1667791, 0, 0.3686275, 1, 1,
0.2293257, 1.42968, 0.8150848, 0, 0.3647059, 1, 1,
0.2371602, 0.490363, 0.2934271, 0, 0.3568628, 1, 1,
0.237774, 0.1253269, 1.285585, 0, 0.3529412, 1, 1,
0.2399533, 0.3497925, 2.848462, 0, 0.345098, 1, 1,
0.2411774, -0.3098314, 1.624695, 0, 0.3411765, 1, 1,
0.2421751, 0.7175527, 0.324118, 0, 0.3333333, 1, 1,
0.2448874, 1.43216, -0.6753761, 0, 0.3294118, 1, 1,
0.2451578, 0.6604972, -1.187067, 0, 0.3215686, 1, 1,
0.2522796, 0.8174182, 0.8227715, 0, 0.3176471, 1, 1,
0.2535815, 0.1643164, 1.944131, 0, 0.3098039, 1, 1,
0.2562833, -1.270469, 3.982041, 0, 0.3058824, 1, 1,
0.2618408, -0.7657386, 2.887135, 0, 0.2980392, 1, 1,
0.2626082, -0.738313, 2.736893, 0, 0.2901961, 1, 1,
0.2692201, 0.708508, 1.107085, 0, 0.2862745, 1, 1,
0.2719081, 1.507763, -1.55972, 0, 0.2784314, 1, 1,
0.2763743, 3.542203, -0.9259049, 0, 0.2745098, 1, 1,
0.277924, -0.8906768, 2.036246, 0, 0.2666667, 1, 1,
0.278319, 0.1797608, 0.7838114, 0, 0.2627451, 1, 1,
0.279322, -0.6318263, 2.425166, 0, 0.254902, 1, 1,
0.2810672, 0.448408, 1.069771, 0, 0.2509804, 1, 1,
0.2831456, -1.537504, 1.501583, 0, 0.2431373, 1, 1,
0.2859582, 0.4093287, -0.09712831, 0, 0.2392157, 1, 1,
0.2879462, -0.867226, 5.589022, 0, 0.2313726, 1, 1,
0.2947402, -0.4770894, 3.27355, 0, 0.227451, 1, 1,
0.2951824, -0.2405005, 3.225559, 0, 0.2196078, 1, 1,
0.3013543, -0.6877454, 3.193238, 0, 0.2156863, 1, 1,
0.3026805, 0.0788127, 2.696758, 0, 0.2078431, 1, 1,
0.3053513, -0.0629073, 2.707527, 0, 0.2039216, 1, 1,
0.3061057, -0.527988, 1.815963, 0, 0.1960784, 1, 1,
0.3066308, 0.2672125, 0.6645095, 0, 0.1882353, 1, 1,
0.3069016, 0.5729076, 0.6751415, 0, 0.1843137, 1, 1,
0.3078851, 0.7175483, 1.404143, 0, 0.1764706, 1, 1,
0.3124395, -0.9761764, 3.673683, 0, 0.172549, 1, 1,
0.3126546, 0.4938817, -2.081193, 0, 0.1647059, 1, 1,
0.3161711, 0.4925731, 1.082964, 0, 0.1607843, 1, 1,
0.3172946, 1.584581, -1.047759, 0, 0.1529412, 1, 1,
0.3292326, 0.9313164, -1.493383, 0, 0.1490196, 1, 1,
0.3295576, 0.2599779, 0.7904645, 0, 0.1411765, 1, 1,
0.3350462, 0.2880057, -0.4183754, 0, 0.1372549, 1, 1,
0.3352847, 1.111424, 2.215102, 0, 0.1294118, 1, 1,
0.3404942, -0.1530254, 2.012053, 0, 0.1254902, 1, 1,
0.3463635, -0.3226759, 1.023666, 0, 0.1176471, 1, 1,
0.35022, -0.238175, 1.504383, 0, 0.1137255, 1, 1,
0.3512737, -0.172695, 3.558352, 0, 0.1058824, 1, 1,
0.3558246, -0.8348941, 2.317696, 0, 0.09803922, 1, 1,
0.3565476, 0.2585436, 0.4110214, 0, 0.09411765, 1, 1,
0.3588767, -0.2711224, 3.209088, 0, 0.08627451, 1, 1,
0.3608371, 0.6130113, 1.423977, 0, 0.08235294, 1, 1,
0.3610265, -0.1774224, 2.312424, 0, 0.07450981, 1, 1,
0.366531, -0.878907, 1.660275, 0, 0.07058824, 1, 1,
0.3665452, -0.1876407, 1.807619, 0, 0.0627451, 1, 1,
0.3712518, 0.7354714, 1.374312, 0, 0.05882353, 1, 1,
0.3715528, 0.1745754, 0.5665625, 0, 0.05098039, 1, 1,
0.3739376, 0.8631342, 1.839664, 0, 0.04705882, 1, 1,
0.3883978, -1.536407, 4.426867, 0, 0.03921569, 1, 1,
0.3917673, -0.3853614, 2.911642, 0, 0.03529412, 1, 1,
0.3922041, -0.07266481, -0.028532, 0, 0.02745098, 1, 1,
0.3931497, 1.02029, 0.5812787, 0, 0.02352941, 1, 1,
0.3936093, -0.2847626, 3.302406, 0, 0.01568628, 1, 1,
0.3943121, -0.6381428, 1.650285, 0, 0.01176471, 1, 1,
0.4021778, -1.035206, 3.027328, 0, 0.003921569, 1, 1,
0.4037685, 0.5383617, -0.3608882, 0.003921569, 0, 1, 1,
0.4092604, 1.266558, 1.300073, 0.007843138, 0, 1, 1,
0.4144376, 0.8851822, 0.06969147, 0.01568628, 0, 1, 1,
0.4216806, 0.055375, 0.4694635, 0.01960784, 0, 1, 1,
0.4281397, -1.296883, 3.286263, 0.02745098, 0, 1, 1,
0.4288605, -1.411939, 2.285616, 0.03137255, 0, 1, 1,
0.4309433, -0.07962322, 1.803341, 0.03921569, 0, 1, 1,
0.4330797, 0.07743247, 0.728503, 0.04313726, 0, 1, 1,
0.4337369, -0.5409564, 2.961542, 0.05098039, 0, 1, 1,
0.4428526, -2.693979, 2.454379, 0.05490196, 0, 1, 1,
0.442938, -0.6689383, 4.323993, 0.0627451, 0, 1, 1,
0.4492754, -2.01209, 3.679214, 0.06666667, 0, 1, 1,
0.4529655, 0.416777, 1.745824, 0.07450981, 0, 1, 1,
0.4575763, -0.6215712, 2.940079, 0.07843138, 0, 1, 1,
0.4596619, -0.2248744, 1.798966, 0.08627451, 0, 1, 1,
0.4605289, 0.2089128, 1.140343, 0.09019608, 0, 1, 1,
0.4712383, -0.2851706, 2.365053, 0.09803922, 0, 1, 1,
0.4723088, 0.5285959, 2.19361, 0.1058824, 0, 1, 1,
0.473518, -1.866196, 2.760239, 0.1098039, 0, 1, 1,
0.4759323, 0.1354889, -0.9436643, 0.1176471, 0, 1, 1,
0.4790721, -1.832284, 3.509701, 0.1215686, 0, 1, 1,
0.4801352, -1.470166, 2.642081, 0.1294118, 0, 1, 1,
0.4822906, -1.198816, 2.883745, 0.1333333, 0, 1, 1,
0.4978192, -0.854616, 3.154601, 0.1411765, 0, 1, 1,
0.4993091, -1.063407, 3.99446, 0.145098, 0, 1, 1,
0.5012693, 0.6720963, -0.1316712, 0.1529412, 0, 1, 1,
0.5034701, -0.5607555, 2.403679, 0.1568628, 0, 1, 1,
0.5056911, -0.8378321, 1.023351, 0.1647059, 0, 1, 1,
0.5066331, 0.03608953, 0.7530749, 0.1686275, 0, 1, 1,
0.5138043, 0.5979705, -0.2164578, 0.1764706, 0, 1, 1,
0.515065, 0.8184763, 2.312496, 0.1803922, 0, 1, 1,
0.5205846, -0.1679663, 1.938206, 0.1882353, 0, 1, 1,
0.5308993, 0.4109239, 0.1703675, 0.1921569, 0, 1, 1,
0.5310653, 1.233632, 1.453469, 0.2, 0, 1, 1,
0.5355234, 0.1448216, 1.343067, 0.2078431, 0, 1, 1,
0.5381085, 0.6491391, 0.7769123, 0.2117647, 0, 1, 1,
0.5390229, 0.1765549, 1.101672, 0.2196078, 0, 1, 1,
0.5425241, -0.5121795, 2.569589, 0.2235294, 0, 1, 1,
0.5444219, -0.4708184, 2.540298, 0.2313726, 0, 1, 1,
0.5458487, -0.4671617, 1.237927, 0.2352941, 0, 1, 1,
0.5497708, -0.4125385, 1.989234, 0.2431373, 0, 1, 1,
0.5499743, -2.14482, 3.56475, 0.2470588, 0, 1, 1,
0.5500749, 0.5379051, 2.100781, 0.254902, 0, 1, 1,
0.5529554, 1.039659, 0.2701293, 0.2588235, 0, 1, 1,
0.5551154, 1.054856, -0.3624249, 0.2666667, 0, 1, 1,
0.5555696, 0.6108969, 0.3806619, 0.2705882, 0, 1, 1,
0.5560009, 1.135907, -0.6814965, 0.2784314, 0, 1, 1,
0.5584192, 1.362055, 0.0902955, 0.282353, 0, 1, 1,
0.559829, 0.5051747, 0.5108238, 0.2901961, 0, 1, 1,
0.565242, -2.644511, 3.581442, 0.2941177, 0, 1, 1,
0.5659643, 0.7041658, -0.8220348, 0.3019608, 0, 1, 1,
0.5671873, -0.4418075, 3.416842, 0.3098039, 0, 1, 1,
0.5676702, 0.4774302, 2.262146, 0.3137255, 0, 1, 1,
0.5690181, 0.9042715, 0.1434743, 0.3215686, 0, 1, 1,
0.5702274, 1.664235, -1.04742, 0.3254902, 0, 1, 1,
0.575184, 0.5560592, 1.679642, 0.3333333, 0, 1, 1,
0.5767713, -1.55593, 3.64618, 0.3372549, 0, 1, 1,
0.582487, -0.03893014, 2.100651, 0.345098, 0, 1, 1,
0.586833, -0.7586824, 2.227134, 0.3490196, 0, 1, 1,
0.587538, -0.1442215, 2.521694, 0.3568628, 0, 1, 1,
0.5888286, 0.509894, 1.450808, 0.3607843, 0, 1, 1,
0.5906861, -0.7795324, 3.575451, 0.3686275, 0, 1, 1,
0.5909764, -0.163622, 1.279228, 0.372549, 0, 1, 1,
0.5949051, -0.3961868, 1.855817, 0.3803922, 0, 1, 1,
0.6011121, -0.07153502, 3.190257, 0.3843137, 0, 1, 1,
0.6017132, -1.324945, 2.544118, 0.3921569, 0, 1, 1,
0.6049712, -0.3120461, 1.071832, 0.3960784, 0, 1, 1,
0.6068031, -0.02194537, 1.744794, 0.4039216, 0, 1, 1,
0.6132697, 1.184434, -0.677828, 0.4117647, 0, 1, 1,
0.6164069, -0.08798595, 2.734172, 0.4156863, 0, 1, 1,
0.6165702, -0.3847899, 2.071607, 0.4235294, 0, 1, 1,
0.6235619, -0.2030175, -0.002490468, 0.427451, 0, 1, 1,
0.6410968, 0.2955394, 0.685689, 0.4352941, 0, 1, 1,
0.6423778, 0.753313, -1.446504, 0.4392157, 0, 1, 1,
0.6431272, -1.263591, 2.869561, 0.4470588, 0, 1, 1,
0.646742, -0.1516232, 1.603046, 0.4509804, 0, 1, 1,
0.647633, 2.509879, 1.406379, 0.4588235, 0, 1, 1,
0.6486411, 0.5623354, -0.6580362, 0.4627451, 0, 1, 1,
0.6492687, 0.1678035, 1.477926, 0.4705882, 0, 1, 1,
0.6565877, -0.5301742, 3.852343, 0.4745098, 0, 1, 1,
0.6606916, -0.2194377, 2.251997, 0.4823529, 0, 1, 1,
0.662667, 0.2715291, 1.011936, 0.4862745, 0, 1, 1,
0.6689954, 0.2138972, -0.009076976, 0.4941176, 0, 1, 1,
0.676558, -0.5418513, 2.54295, 0.5019608, 0, 1, 1,
0.6767148, -0.341161, 1.93909, 0.5058824, 0, 1, 1,
0.6829249, 0.581926, 0.3559868, 0.5137255, 0, 1, 1,
0.6895543, -2.17904, 1.110455, 0.5176471, 0, 1, 1,
0.6909358, -0.8237728, 1.391104, 0.5254902, 0, 1, 1,
0.6909489, 0.2662182, -0.0245417, 0.5294118, 0, 1, 1,
0.691009, 0.5749732, 1.157714, 0.5372549, 0, 1, 1,
0.6930655, -0.4688004, 1.140383, 0.5411765, 0, 1, 1,
0.6935667, 1.440443, 1.953448, 0.5490196, 0, 1, 1,
0.6957587, -0.5857273, 2.23005, 0.5529412, 0, 1, 1,
0.6982602, -0.8995333, 1.511117, 0.5607843, 0, 1, 1,
0.7019662, -0.004267735, 1.725317, 0.5647059, 0, 1, 1,
0.7020454, -1.563156, 1.914142, 0.572549, 0, 1, 1,
0.7069718, 0.06530891, 0.8670033, 0.5764706, 0, 1, 1,
0.7113982, 1.534146, -0.526624, 0.5843138, 0, 1, 1,
0.7136655, 1.002185, -0.0306531, 0.5882353, 0, 1, 1,
0.7172071, 0.3773777, 0.1433557, 0.5960785, 0, 1, 1,
0.7186372, 2.405872, 0.8259344, 0.6039216, 0, 1, 1,
0.7230986, -0.3336603, 1.268876, 0.6078432, 0, 1, 1,
0.7255743, -0.5471874, 0.5305548, 0.6156863, 0, 1, 1,
0.7270752, -1.197311, 3.149025, 0.6196079, 0, 1, 1,
0.7282068, -1.789489, 2.947994, 0.627451, 0, 1, 1,
0.730103, -0.01017776, 1.417699, 0.6313726, 0, 1, 1,
0.7323776, -1.01091, 2.018881, 0.6392157, 0, 1, 1,
0.7351114, -0.7241253, 0.8372861, 0.6431373, 0, 1, 1,
0.7353079, -0.2295702, 0.8010706, 0.6509804, 0, 1, 1,
0.7362239, -0.394709, 2.796819, 0.654902, 0, 1, 1,
0.7386113, -0.4927487, 2.910896, 0.6627451, 0, 1, 1,
0.7388181, -0.2079039, 1.694612, 0.6666667, 0, 1, 1,
0.7465258, -1.00801, 2.138137, 0.6745098, 0, 1, 1,
0.7527122, -0.08320402, 0.08627476, 0.6784314, 0, 1, 1,
0.7551182, -2.050755, 3.180281, 0.6862745, 0, 1, 1,
0.7684538, -1.503857, 3.565213, 0.6901961, 0, 1, 1,
0.770819, 0.7201964, 0.4232034, 0.6980392, 0, 1, 1,
0.7747724, 0.9675695, 1.081391, 0.7058824, 0, 1, 1,
0.7773685, -0.4592621, 2.309344, 0.7098039, 0, 1, 1,
0.7788367, 0.3959929, 1.386198, 0.7176471, 0, 1, 1,
0.7804574, -0.5274259, 2.483131, 0.7215686, 0, 1, 1,
0.7808164, 0.8452183, 1.737887, 0.7294118, 0, 1, 1,
0.7836733, 0.06658439, 2.056826, 0.7333333, 0, 1, 1,
0.783992, -0.2069189, 2.087409, 0.7411765, 0, 1, 1,
0.7842211, -0.04758135, 3.491895, 0.7450981, 0, 1, 1,
0.7879335, -0.158858, 2.758857, 0.7529412, 0, 1, 1,
0.7913138, 0.4380342, 1.012208, 0.7568628, 0, 1, 1,
0.7916347, -0.3490402, 1.483439, 0.7647059, 0, 1, 1,
0.8078933, 1.795074, 0.08379564, 0.7686275, 0, 1, 1,
0.80899, 0.4772193, 1.224684, 0.7764706, 0, 1, 1,
0.8092256, -2.085102, 3.80279, 0.7803922, 0, 1, 1,
0.8127229, 0.04935104, -0.1044558, 0.7882353, 0, 1, 1,
0.8180441, -1.451636, 3.665727, 0.7921569, 0, 1, 1,
0.8208345, 1.028901, 0.4609836, 0.8, 0, 1, 1,
0.8226965, 0.6198673, 0.2929712, 0.8078431, 0, 1, 1,
0.8254995, -1.417306, 1.839021, 0.8117647, 0, 1, 1,
0.8360716, 1.338188, 0.7076824, 0.8196079, 0, 1, 1,
0.8407925, -0.3023927, 1.242262, 0.8235294, 0, 1, 1,
0.8412476, -0.08225194, 2.39434, 0.8313726, 0, 1, 1,
0.8448893, 0.1040215, 2.608198, 0.8352941, 0, 1, 1,
0.8454083, -1.806355, 1.328263, 0.8431373, 0, 1, 1,
0.8514644, -1.070698, 1.944772, 0.8470588, 0, 1, 1,
0.8566329, -0.2349909, -1.557085, 0.854902, 0, 1, 1,
0.8620658, 0.9898292, 1.310592, 0.8588235, 0, 1, 1,
0.8634181, 0.198921, 2.54561, 0.8666667, 0, 1, 1,
0.8783057, -0.4250402, 0.908203, 0.8705882, 0, 1, 1,
0.8953599, 1.826844, -0.1391834, 0.8784314, 0, 1, 1,
0.895922, 0.468225, 0.9253315, 0.8823529, 0, 1, 1,
0.8962256, 0.02569453, 4.37867, 0.8901961, 0, 1, 1,
0.8991472, -0.01857848, 1.499412, 0.8941177, 0, 1, 1,
0.9054198, -0.5578024, 1.213582, 0.9019608, 0, 1, 1,
0.9058381, 1.126513, -0.6257352, 0.9098039, 0, 1, 1,
0.9058886, -0.6034889, 1.389118, 0.9137255, 0, 1, 1,
0.9135051, 0.8170094, 1.155084, 0.9215686, 0, 1, 1,
0.9143192, 0.7240858, 1.405692, 0.9254902, 0, 1, 1,
0.9164315, -0.09083892, 2.717328, 0.9333333, 0, 1, 1,
0.919136, -0.2156824, 2.3591, 0.9372549, 0, 1, 1,
0.9240983, 2.64224, 0.2612658, 0.945098, 0, 1, 1,
0.9272949, -1.160753, 3.57303, 0.9490196, 0, 1, 1,
0.9298691, -0.5465938, 2.45353, 0.9568627, 0, 1, 1,
0.9306251, 1.090348, 1.833666, 0.9607843, 0, 1, 1,
0.9327096, 0.695391, 2.089596, 0.9686275, 0, 1, 1,
0.9354214, 0.2932379, 1.128343, 0.972549, 0, 1, 1,
0.9378864, -1.613463, 2.944083, 0.9803922, 0, 1, 1,
0.9468108, -1.200288, 3.393171, 0.9843137, 0, 1, 1,
0.9511737, -1.194053, 2.327341, 0.9921569, 0, 1, 1,
0.9520534, 0.551348, -0.2122321, 0.9960784, 0, 1, 1,
0.9559734, 0.01066514, 2.591279, 1, 0, 0.9960784, 1,
0.9610472, 0.8382878, 1.050477, 1, 0, 0.9882353, 1,
0.9634554, -0.5705812, 2.024992, 1, 0, 0.9843137, 1,
0.9656277, 0.2793462, 0.9712788, 1, 0, 0.9764706, 1,
0.9660212, -0.8927067, 2.434185, 1, 0, 0.972549, 1,
0.9670458, -1.132594, 2.040978, 1, 0, 0.9647059, 1,
0.9672318, -0.4563166, 2.861823, 1, 0, 0.9607843, 1,
0.9712234, 0.6182587, 2.295481, 1, 0, 0.9529412, 1,
0.97841, -0.4261734, 2.558844, 1, 0, 0.9490196, 1,
0.9848429, -0.7971423, 2.760568, 1, 0, 0.9411765, 1,
0.9966324, 0.2280696, 1.093417, 1, 0, 0.9372549, 1,
1.006437, -0.5264449, 3.123834, 1, 0, 0.9294118, 1,
1.008275, 1.072902, 2.642739, 1, 0, 0.9254902, 1,
1.025212, 1.176219, 2.261764, 1, 0, 0.9176471, 1,
1.025528, -1.312521, 1.940704, 1, 0, 0.9137255, 1,
1.031256, -0.07616878, 1.199548, 1, 0, 0.9058824, 1,
1.03145, 0.8507362, 0.1398837, 1, 0, 0.9019608, 1,
1.037464, -0.3050185, 1.290025, 1, 0, 0.8941177, 1,
1.047388, 0.5054492, 0.9344655, 1, 0, 0.8862745, 1,
1.051318, -0.2433385, 2.246667, 1, 0, 0.8823529, 1,
1.05226, 0.2134639, 0.8389102, 1, 0, 0.8745098, 1,
1.052433, -0.450528, 3.184136, 1, 0, 0.8705882, 1,
1.05336, -0.5122469, 0.0653363, 1, 0, 0.8627451, 1,
1.057731, -0.4820908, 1.717941, 1, 0, 0.8588235, 1,
1.058161, 1.418435, -1.680822, 1, 0, 0.8509804, 1,
1.064602, -0.1054244, 1.557279, 1, 0, 0.8470588, 1,
1.067283, -1.160394, 2.848494, 1, 0, 0.8392157, 1,
1.073268, 1.969593, 1.849716, 1, 0, 0.8352941, 1,
1.074832, 0.6478085, 0.3167824, 1, 0, 0.827451, 1,
1.074868, 0.005960955, 1.356449, 1, 0, 0.8235294, 1,
1.090953, -0.01644798, 0.8496255, 1, 0, 0.8156863, 1,
1.103736, -0.9200458, 1.90379, 1, 0, 0.8117647, 1,
1.104402, 0.4061967, -0.5957203, 1, 0, 0.8039216, 1,
1.109636, -0.7983838, 3.047418, 1, 0, 0.7960784, 1,
1.110592, -0.2156093, 1.936741, 1, 0, 0.7921569, 1,
1.112609, 0.1704603, 1.827544, 1, 0, 0.7843137, 1,
1.120589, -0.1527153, 1.791451, 1, 0, 0.7803922, 1,
1.123856, -0.1139781, 2.518176, 1, 0, 0.772549, 1,
1.144412, 0.6334539, 0.9771176, 1, 0, 0.7686275, 1,
1.148721, -0.3030014, 2.036016, 1, 0, 0.7607843, 1,
1.155064, -0.3344027, 2.107357, 1, 0, 0.7568628, 1,
1.156202, -1.698372, 2.085459, 1, 0, 0.7490196, 1,
1.159454, 1.867707, -0.1143478, 1, 0, 0.7450981, 1,
1.169818, -0.8180009, 1.741057, 1, 0, 0.7372549, 1,
1.179821, 0.005759079, 0.03604469, 1, 0, 0.7333333, 1,
1.184419, -0.5546449, 3.414711, 1, 0, 0.7254902, 1,
1.187253, -0.07164028, 0.9131663, 1, 0, 0.7215686, 1,
1.187579, 1.229231, 0.7544975, 1, 0, 0.7137255, 1,
1.201257, -1.150124, 2.940936, 1, 0, 0.7098039, 1,
1.213356, 0.8237889, 2.625806, 1, 0, 0.7019608, 1,
1.214379, -1.171902, 3.28055, 1, 0, 0.6941177, 1,
1.217962, -1.466345, 1.545159, 1, 0, 0.6901961, 1,
1.219481, -1.37067, 3.131724, 1, 0, 0.682353, 1,
1.22185, 0.1973229, 1.995814, 1, 0, 0.6784314, 1,
1.224903, 1.02163, 1.739225, 1, 0, 0.6705883, 1,
1.225359, -0.1787123, 0.497963, 1, 0, 0.6666667, 1,
1.230572, -0.3548589, 3.756545, 1, 0, 0.6588235, 1,
1.230881, 0.5333686, 2.122698, 1, 0, 0.654902, 1,
1.236748, -1.045223, 0.2949113, 1, 0, 0.6470588, 1,
1.2416, 1.255707, 0.4283207, 1, 0, 0.6431373, 1,
1.242198, 0.8405777, 1.800234, 1, 0, 0.6352941, 1,
1.242307, 0.544372, -1.139433, 1, 0, 0.6313726, 1,
1.245031, 0.3902693, -0.1043374, 1, 0, 0.6235294, 1,
1.266248, -1.18894, 2.555584, 1, 0, 0.6196079, 1,
1.266521, 0.7033514, 1.179479, 1, 0, 0.6117647, 1,
1.277749, -0.7096959, -0.07991289, 1, 0, 0.6078432, 1,
1.296293, -1.280104, 2.596523, 1, 0, 0.6, 1,
1.303376, 0.1557278, 1.425901, 1, 0, 0.5921569, 1,
1.30869, -0.6625671, 1.526467, 1, 0, 0.5882353, 1,
1.325953, 0.2345311, 2.188595, 1, 0, 0.5803922, 1,
1.331902, 1.001123, -0.7161689, 1, 0, 0.5764706, 1,
1.333184, -0.5456198, 0.7719916, 1, 0, 0.5686275, 1,
1.337797, -1.297625, 2.907403, 1, 0, 0.5647059, 1,
1.339664, 0.3331747, 0.9610626, 1, 0, 0.5568628, 1,
1.342595, 1.120998, 1.706164, 1, 0, 0.5529412, 1,
1.3523, -0.1221279, 2.043426, 1, 0, 0.5450981, 1,
1.353003, -0.1285041, 1.500411, 1, 0, 0.5411765, 1,
1.376583, 0.4069775, 1.813515, 1, 0, 0.5333334, 1,
1.380062, 0.3536604, -0.7757757, 1, 0, 0.5294118, 1,
1.3882, -1.436017, 0.2394089, 1, 0, 0.5215687, 1,
1.406832, 0.779092, 1.76237, 1, 0, 0.5176471, 1,
1.411753, -0.8628921, 2.590672, 1, 0, 0.509804, 1,
1.4269, 0.3333328, 0.164164, 1, 0, 0.5058824, 1,
1.432483, -0.8739388, 3.826804, 1, 0, 0.4980392, 1,
1.437683, -0.5771386, 2.249164, 1, 0, 0.4901961, 1,
1.447025, -1.332804, 1.869452, 1, 0, 0.4862745, 1,
1.466023, 0.4112691, -0.504258, 1, 0, 0.4784314, 1,
1.470726, 0.7919198, 0.5878317, 1, 0, 0.4745098, 1,
1.471778, 0.2437649, 2.022033, 1, 0, 0.4666667, 1,
1.478152, 0.1964845, 1.233378, 1, 0, 0.4627451, 1,
1.490671, -1.792624, 4.277848, 1, 0, 0.454902, 1,
1.502389, -1.083967, 2.039532, 1, 0, 0.4509804, 1,
1.518903, 0.1586257, 1.094282, 1, 0, 0.4431373, 1,
1.522187, -0.7084905, 1.442412, 1, 0, 0.4392157, 1,
1.533712, -0.2988668, 1.46125, 1, 0, 0.4313726, 1,
1.538014, 1.171486, 0.7593199, 1, 0, 0.427451, 1,
1.540729, 2.471029, 1.104869, 1, 0, 0.4196078, 1,
1.551088, -1.722479, 2.426088, 1, 0, 0.4156863, 1,
1.552199, -0.1424172, 1.274038, 1, 0, 0.4078431, 1,
1.555134, -0.6989484, 2.414622, 1, 0, 0.4039216, 1,
1.566977, -1.779374, 1.989256, 1, 0, 0.3960784, 1,
1.572296, 0.04898744, -0.3269565, 1, 0, 0.3882353, 1,
1.574222, -0.9018421, 0.9990398, 1, 0, 0.3843137, 1,
1.577091, -0.911641, 3.187986, 1, 0, 0.3764706, 1,
1.591322, 0.2018571, 0.6820265, 1, 0, 0.372549, 1,
1.594148, 0.8458317, 1.676284, 1, 0, 0.3647059, 1,
1.602313, 1.023636, 0.8472435, 1, 0, 0.3607843, 1,
1.636748, 0.5833277, 0.529375, 1, 0, 0.3529412, 1,
1.65256, -0.6757636, 3.949265, 1, 0, 0.3490196, 1,
1.665757, 0.8244229, 2.266034, 1, 0, 0.3411765, 1,
1.674704, -0.3878524, 1.603338, 1, 0, 0.3372549, 1,
1.692719, 0.3750549, 2.419396, 1, 0, 0.3294118, 1,
1.69474, 1.527648, 0.8729402, 1, 0, 0.3254902, 1,
1.703094, 0.02692843, 1.673633, 1, 0, 0.3176471, 1,
1.707686, 0.3783072, 3.049277, 1, 0, 0.3137255, 1,
1.724577, -2.104475, 2.148183, 1, 0, 0.3058824, 1,
1.730175, -0.07831781, 3.586196, 1, 0, 0.2980392, 1,
1.735113, -1.497256, 0.5215336, 1, 0, 0.2941177, 1,
1.751562, -0.3787036, -0.3895319, 1, 0, 0.2862745, 1,
1.774933, -2.231071, 1.510158, 1, 0, 0.282353, 1,
1.798279, -0.3209493, 2.077605, 1, 0, 0.2745098, 1,
1.798817, -1.769482, 0.818967, 1, 0, 0.2705882, 1,
1.804943, -1.619328, 1.265287, 1, 0, 0.2627451, 1,
1.815967, -0.438352, 1.993039, 1, 0, 0.2588235, 1,
1.828889, 0.7698752, -0.9522305, 1, 0, 0.2509804, 1,
1.843165, 0.7331888, 2.107456, 1, 0, 0.2470588, 1,
1.862341, -0.2187973, 3.834935, 1, 0, 0.2392157, 1,
1.862821, 0.876995, 1.133779, 1, 0, 0.2352941, 1,
1.866295, 0.5864178, 1.385836, 1, 0, 0.227451, 1,
1.881388, 1.058434, -0.7469712, 1, 0, 0.2235294, 1,
1.925714, -0.1464323, 0.7531884, 1, 0, 0.2156863, 1,
1.927368, -3.096152, 3.68571, 1, 0, 0.2117647, 1,
1.938496, -0.3237338, 1.31569, 1, 0, 0.2039216, 1,
1.938762, -0.2433437, 0.7807895, 1, 0, 0.1960784, 1,
1.950317, -0.9308589, 3.412765, 1, 0, 0.1921569, 1,
1.960359, 0.1105487, 0.09053793, 1, 0, 0.1843137, 1,
1.987312, -1.00948, 4.04661, 1, 0, 0.1803922, 1,
2.001153, 2.070572, -0.2463457, 1, 0, 0.172549, 1,
2.021091, 0.3389217, 0.3838678, 1, 0, 0.1686275, 1,
2.024923, 1.326503, 1.404346, 1, 0, 0.1607843, 1,
2.07632, 0.2026288, 0.00367501, 1, 0, 0.1568628, 1,
2.087101, -0.1798173, 3.547418, 1, 0, 0.1490196, 1,
2.109346, 1.021095, 1.418649, 1, 0, 0.145098, 1,
2.112239, -0.6675172, 1.883361, 1, 0, 0.1372549, 1,
2.13802, -0.2343463, 2.789509, 1, 0, 0.1333333, 1,
2.145729, 1.442385, 1.228888, 1, 0, 0.1254902, 1,
2.164096, 0.8746693, 2.21545, 1, 0, 0.1215686, 1,
2.164598, -0.5359164, 1.220786, 1, 0, 0.1137255, 1,
2.168299, -0.5520659, 1.616316, 1, 0, 0.1098039, 1,
2.203911, -0.4771475, 1.421036, 1, 0, 0.1019608, 1,
2.210847, 0.6199927, -0.3713343, 1, 0, 0.09411765, 1,
2.225666, 0.1589037, 2.368051, 1, 0, 0.09019608, 1,
2.297235, -1.973927, 2.774061, 1, 0, 0.08235294, 1,
2.298447, 0.6761209, 1.168041, 1, 0, 0.07843138, 1,
2.357953, 0.002189653, 0.1185388, 1, 0, 0.07058824, 1,
2.389451, 0.2051258, 1.790267, 1, 0, 0.06666667, 1,
2.396063, -0.6205032, 1.256913, 1, 0, 0.05882353, 1,
2.43089, 0.7616826, 2.223857, 1, 0, 0.05490196, 1,
2.472773, -0.6315783, 0.8579413, 1, 0, 0.04705882, 1,
2.559795, -1.771944, 2.610244, 1, 0, 0.04313726, 1,
2.659355, -0.7699612, 1.705276, 1, 0, 0.03529412, 1,
2.776873, -1.948664, 3.473572, 1, 0, 0.03137255, 1,
2.780138, 0.2330311, 1.053358, 1, 0, 0.02352941, 1,
2.797737, 0.3356711, 1.179953, 1, 0, 0.01960784, 1,
2.846826, 0.280818, 0.5330207, 1, 0, 0.01176471, 1,
3.151999, 2.113994, -0.1292865, 1, 0, 0.007843138, 1
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
0.1020743, -4.438614, -7.820082, 0, -0.5, 0.5, 0.5,
0.1020743, -4.438614, -7.820082, 1, -0.5, 0.5, 0.5,
0.1020743, -4.438614, -7.820082, 1, 1.5, 0.5, 0.5,
0.1020743, -4.438614, -7.820082, 0, 1.5, 0.5, 0.5
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
-3.981775, 0.3439417, -7.820082, 0, -0.5, 0.5, 0.5,
-3.981775, 0.3439417, -7.820082, 1, -0.5, 0.5, 0.5,
-3.981775, 0.3439417, -7.820082, 1, 1.5, 0.5, 0.5,
-3.981775, 0.3439417, -7.820082, 0, 1.5, 0.5, 0.5
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
-3.981775, -4.438614, -0.1438143, 0, -0.5, 0.5, 0.5,
-3.981775, -4.438614, -0.1438143, 1, -0.5, 0.5, 0.5,
-3.981775, -4.438614, -0.1438143, 1, 1.5, 0.5, 0.5,
-3.981775, -4.438614, -0.1438143, 0, 1.5, 0.5, 0.5
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
-2, -3.334948, -6.048635,
3, -3.334948, -6.048635,
-2, -3.334948, -6.048635,
-2, -3.518892, -6.343876,
-1, -3.334948, -6.048635,
-1, -3.518892, -6.343876,
0, -3.334948, -6.048635,
0, -3.518892, -6.343876,
1, -3.334948, -6.048635,
1, -3.518892, -6.343876,
2, -3.334948, -6.048635,
2, -3.518892, -6.343876,
3, -3.334948, -6.048635,
3, -3.518892, -6.343876
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
-2, -3.886781, -6.934359, 0, -0.5, 0.5, 0.5,
-2, -3.886781, -6.934359, 1, -0.5, 0.5, 0.5,
-2, -3.886781, -6.934359, 1, 1.5, 0.5, 0.5,
-2, -3.886781, -6.934359, 0, 1.5, 0.5, 0.5,
-1, -3.886781, -6.934359, 0, -0.5, 0.5, 0.5,
-1, -3.886781, -6.934359, 1, -0.5, 0.5, 0.5,
-1, -3.886781, -6.934359, 1, 1.5, 0.5, 0.5,
-1, -3.886781, -6.934359, 0, 1.5, 0.5, 0.5,
0, -3.886781, -6.934359, 0, -0.5, 0.5, 0.5,
0, -3.886781, -6.934359, 1, -0.5, 0.5, 0.5,
0, -3.886781, -6.934359, 1, 1.5, 0.5, 0.5,
0, -3.886781, -6.934359, 0, 1.5, 0.5, 0.5,
1, -3.886781, -6.934359, 0, -0.5, 0.5, 0.5,
1, -3.886781, -6.934359, 1, -0.5, 0.5, 0.5,
1, -3.886781, -6.934359, 1, 1.5, 0.5, 0.5,
1, -3.886781, -6.934359, 0, 1.5, 0.5, 0.5,
2, -3.886781, -6.934359, 0, -0.5, 0.5, 0.5,
2, -3.886781, -6.934359, 1, -0.5, 0.5, 0.5,
2, -3.886781, -6.934359, 1, 1.5, 0.5, 0.5,
2, -3.886781, -6.934359, 0, 1.5, 0.5, 0.5,
3, -3.886781, -6.934359, 0, -0.5, 0.5, 0.5,
3, -3.886781, -6.934359, 1, -0.5, 0.5, 0.5,
3, -3.886781, -6.934359, 1, 1.5, 0.5, 0.5,
3, -3.886781, -6.934359, 0, 1.5, 0.5, 0.5
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
-3.039348, -2, -6.048635,
-3.039348, 2, -6.048635,
-3.039348, -2, -6.048635,
-3.196419, -2, -6.343876,
-3.039348, 0, -6.048635,
-3.196419, 0, -6.343876,
-3.039348, 2, -6.048635,
-3.196419, 2, -6.343876
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
-3.510562, -2, -6.934359, 0, -0.5, 0.5, 0.5,
-3.510562, -2, -6.934359, 1, -0.5, 0.5, 0.5,
-3.510562, -2, -6.934359, 1, 1.5, 0.5, 0.5,
-3.510562, -2, -6.934359, 0, 1.5, 0.5, 0.5,
-3.510562, 0, -6.934359, 0, -0.5, 0.5, 0.5,
-3.510562, 0, -6.934359, 1, -0.5, 0.5, 0.5,
-3.510562, 0, -6.934359, 1, 1.5, 0.5, 0.5,
-3.510562, 0, -6.934359, 0, 1.5, 0.5, 0.5,
-3.510562, 2, -6.934359, 0, -0.5, 0.5, 0.5,
-3.510562, 2, -6.934359, 1, -0.5, 0.5, 0.5,
-3.510562, 2, -6.934359, 1, 1.5, 0.5, 0.5,
-3.510562, 2, -6.934359, 0, 1.5, 0.5, 0.5
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
-3.039348, -3.334948, -4,
-3.039348, -3.334948, 4,
-3.039348, -3.334948, -4,
-3.196419, -3.518892, -4,
-3.039348, -3.334948, -2,
-3.196419, -3.518892, -2,
-3.039348, -3.334948, 0,
-3.196419, -3.518892, 0,
-3.039348, -3.334948, 2,
-3.196419, -3.518892, 2,
-3.039348, -3.334948, 4,
-3.196419, -3.518892, 4
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
-3.510562, -3.886781, -4, 0, -0.5, 0.5, 0.5,
-3.510562, -3.886781, -4, 1, -0.5, 0.5, 0.5,
-3.510562, -3.886781, -4, 1, 1.5, 0.5, 0.5,
-3.510562, -3.886781, -4, 0, 1.5, 0.5, 0.5,
-3.510562, -3.886781, -2, 0, -0.5, 0.5, 0.5,
-3.510562, -3.886781, -2, 1, -0.5, 0.5, 0.5,
-3.510562, -3.886781, -2, 1, 1.5, 0.5, 0.5,
-3.510562, -3.886781, -2, 0, 1.5, 0.5, 0.5,
-3.510562, -3.886781, 0, 0, -0.5, 0.5, 0.5,
-3.510562, -3.886781, 0, 1, -0.5, 0.5, 0.5,
-3.510562, -3.886781, 0, 1, 1.5, 0.5, 0.5,
-3.510562, -3.886781, 0, 0, 1.5, 0.5, 0.5,
-3.510562, -3.886781, 2, 0, -0.5, 0.5, 0.5,
-3.510562, -3.886781, 2, 1, -0.5, 0.5, 0.5,
-3.510562, -3.886781, 2, 1, 1.5, 0.5, 0.5,
-3.510562, -3.886781, 2, 0, 1.5, 0.5, 0.5,
-3.510562, -3.886781, 4, 0, -0.5, 0.5, 0.5,
-3.510562, -3.886781, 4, 1, -0.5, 0.5, 0.5,
-3.510562, -3.886781, 4, 1, 1.5, 0.5, 0.5,
-3.510562, -3.886781, 4, 0, 1.5, 0.5, 0.5
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
-3.039348, -3.334948, -6.048635,
-3.039348, 4.022831, -6.048635,
-3.039348, -3.334948, 5.761007,
-3.039348, 4.022831, 5.761007,
-3.039348, -3.334948, -6.048635,
-3.039348, -3.334948, 5.761007,
-3.039348, 4.022831, -6.048635,
-3.039348, 4.022831, 5.761007,
-3.039348, -3.334948, -6.048635,
3.243497, -3.334948, -6.048635,
-3.039348, -3.334948, 5.761007,
3.243497, -3.334948, 5.761007,
-3.039348, 4.022831, -6.048635,
3.243497, 4.022831, -6.048635,
-3.039348, 4.022831, 5.761007,
3.243497, 4.022831, 5.761007,
3.243497, -3.334948, -6.048635,
3.243497, 4.022831, -6.048635,
3.243497, -3.334948, 5.761007,
3.243497, 4.022831, 5.761007,
3.243497, -3.334948, -6.048635,
3.243497, -3.334948, 5.761007,
3.243497, 4.022831, -6.048635,
3.243497, 4.022831, 5.761007
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
var radius = 8.152236;
var distance = 36.27022;
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
mvMatrix.translate( -0.1020743, -0.3439417, 0.1438143 );
mvMatrix.scale( 1.402925, 1.197964, 0.7463696 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.27022);
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
Formothion<-read.table("Formothion.xyz")
```

```
## Error in read.table("Formothion.xyz"): no lines available in input
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
-2.947851, 0.7768394, 0.7977784, 0, 0, 1, 1, 1,
-2.745991, -1.431732, -1.495075, 1, 0, 0, 1, 1,
-2.744606, -0.2480915, -1.794872, 1, 0, 0, 1, 1,
-2.655818, -1.181768, -3.106149, 1, 0, 0, 1, 1,
-2.65057, 0.9745381, -0.8872173, 1, 0, 0, 1, 1,
-2.647752, 0.4044594, -2.832426, 1, 0, 0, 1, 1,
-2.616844, -0.1630112, -0.207974, 0, 0, 0, 1, 1,
-2.331075, 1.429786, -0.9520771, 0, 0, 0, 1, 1,
-2.329566, -0.0139292, -1.616484, 0, 0, 0, 1, 1,
-2.317645, -0.03226067, -2.567564, 0, 0, 0, 1, 1,
-2.30111, 0.1149712, -4.131618, 0, 0, 0, 1, 1,
-2.267684, 1.259774, -0.5895548, 0, 0, 0, 1, 1,
-2.245158, -0.2019031, -0.8117802, 0, 0, 0, 1, 1,
-2.207423, 0.4165452, -0.4264476, 1, 1, 1, 1, 1,
-2.190561, -0.08354539, -1.346534, 1, 1, 1, 1, 1,
-2.17313, 1.959034, -2.969463, 1, 1, 1, 1, 1,
-2.075671, -0.1286844, -0.6985748, 1, 1, 1, 1, 1,
-2.049525, 3.2391, -0.5543782, 1, 1, 1, 1, 1,
-2.03463, 0.1285214, -1.351349, 1, 1, 1, 1, 1,
-1.97034, 0.4864728, -1.529842, 1, 1, 1, 1, 1,
-1.937877, 0.7276431, -0.7127317, 1, 1, 1, 1, 1,
-1.932634, 0.8119954, -1.029431, 1, 1, 1, 1, 1,
-1.882547, 0.2255888, -2.767484, 1, 1, 1, 1, 1,
-1.828524, 1.341038, -0.7759917, 1, 1, 1, 1, 1,
-1.825643, -0.6933324, -1.178121, 1, 1, 1, 1, 1,
-1.822207, -0.7330321, -0.7632813, 1, 1, 1, 1, 1,
-1.82105, -1.798447, -3.904794, 1, 1, 1, 1, 1,
-1.818406, -0.817521, -1.019633, 1, 1, 1, 1, 1,
-1.813322, 0.9133284, -0.4018376, 0, 0, 1, 1, 1,
-1.812199, 0.1620013, -3.286262, 1, 0, 0, 1, 1,
-1.795614, 0.8331184, -0.09549787, 1, 0, 0, 1, 1,
-1.789852, 1.431848, 1.514515, 1, 0, 0, 1, 1,
-1.784874, 0.1530948, -1.850641, 1, 0, 0, 1, 1,
-1.782443, -1.197882, -3.253936, 1, 0, 0, 1, 1,
-1.776889, 0.3462443, -0.8248748, 0, 0, 0, 1, 1,
-1.765535, -1.227422, -3.22076, 0, 0, 0, 1, 1,
-1.756789, -1.841906, -2.944817, 0, 0, 0, 1, 1,
-1.739038, -0.121743, -1.962217, 0, 0, 0, 1, 1,
-1.737671, 0.5790576, -0.00297393, 0, 0, 0, 1, 1,
-1.716506, 1.119518, -2.186587, 0, 0, 0, 1, 1,
-1.715861, -1.109355, -2.011433, 0, 0, 0, 1, 1,
-1.711413, 1.201973, -1.267608, 1, 1, 1, 1, 1,
-1.708023, -1.146214, -2.225898, 1, 1, 1, 1, 1,
-1.673242, 1.501146, -1.78501, 1, 1, 1, 1, 1,
-1.672262, -0.7690855, -2.357083, 1, 1, 1, 1, 1,
-1.653369, -1.061271, -4.199831, 1, 1, 1, 1, 1,
-1.645619, -0.3939209, -0.8999895, 1, 1, 1, 1, 1,
-1.611146, 0.4163511, -2.040186, 1, 1, 1, 1, 1,
-1.595071, -1.140262, 0.9616588, 1, 1, 1, 1, 1,
-1.593099, 0.7330271, -2.044821, 1, 1, 1, 1, 1,
-1.589487, 0.7788455, -0.9551328, 1, 1, 1, 1, 1,
-1.58686, -0.7711266, -1.427054, 1, 1, 1, 1, 1,
-1.580217, 1.682876, 0.7458677, 1, 1, 1, 1, 1,
-1.567079, -0.1422581, -0.3708975, 1, 1, 1, 1, 1,
-1.551118, -0.6061397, -1.747878, 1, 1, 1, 1, 1,
-1.542587, 0.309179, 1.436138, 1, 1, 1, 1, 1,
-1.523238, 0.4425351, -1.517354, 0, 0, 1, 1, 1,
-1.505594, -0.4434819, -3.730352, 1, 0, 0, 1, 1,
-1.490297, 1.14116, -1.21906, 1, 0, 0, 1, 1,
-1.479582, 0.6014328, -1.785636, 1, 0, 0, 1, 1,
-1.472783, -1.272446, -4.183216, 1, 0, 0, 1, 1,
-1.470984, -0.7856922, -1.30591, 1, 0, 0, 1, 1,
-1.46797, -0.2060889, -3.598944, 0, 0, 0, 1, 1,
-1.464637, 0.3606287, -2.685728, 0, 0, 0, 1, 1,
-1.460767, 0.3227381, -0.7637835, 0, 0, 0, 1, 1,
-1.455109, 1.218736, -0.795482, 0, 0, 0, 1, 1,
-1.452846, 1.300313, -0.6906077, 0, 0, 0, 1, 1,
-1.446337, -0.7600795, -0.6259923, 0, 0, 0, 1, 1,
-1.439452, 0.3208458, -0.4651367, 0, 0, 0, 1, 1,
-1.43913, -0.6559022, -1.288545, 1, 1, 1, 1, 1,
-1.428944, 0.5523682, -1.673954, 1, 1, 1, 1, 1,
-1.422472, 1.146748, -2.057964, 1, 1, 1, 1, 1,
-1.413253, -2.093209, -3.72677, 1, 1, 1, 1, 1,
-1.410321, 1.147539, 1.371501, 1, 1, 1, 1, 1,
-1.406863, 0.05666897, -0.5927885, 1, 1, 1, 1, 1,
-1.404551, 0.2116352, -2.950949, 1, 1, 1, 1, 1,
-1.39345, 0.4097008, -0.4419154, 1, 1, 1, 1, 1,
-1.390455, 1.215476, -0.5591488, 1, 1, 1, 1, 1,
-1.389305, -0.6444467, -1.99777, 1, 1, 1, 1, 1,
-1.387452, -0.8180367, -1.596921, 1, 1, 1, 1, 1,
-1.379054, -0.5731263, -2.601846, 1, 1, 1, 1, 1,
-1.378052, 0.4260934, -1.705532, 1, 1, 1, 1, 1,
-1.362683, -0.4518757, -3.981296, 1, 1, 1, 1, 1,
-1.358464, 1.52085, -1.127065, 1, 1, 1, 1, 1,
-1.358315, 1.393533, -2.807041, 0, 0, 1, 1, 1,
-1.352708, 1.973231, -1.480166, 1, 0, 0, 1, 1,
-1.346607, 0.4973339, -2.446924, 1, 0, 0, 1, 1,
-1.338211, 0.538456, -2.10908, 1, 0, 0, 1, 1,
-1.326539, -0.9644368, -2.086103, 1, 0, 0, 1, 1,
-1.303053, 0.2515, -2.631676, 1, 0, 0, 1, 1,
-1.276424, -0.6905711, -3.886892, 0, 0, 0, 1, 1,
-1.275315, -0.9141062, -1.875862, 0, 0, 0, 1, 1,
-1.258264, -2.020614, -3.433589, 0, 0, 0, 1, 1,
-1.257779, -0.8267543, -3.038175, 0, 0, 0, 1, 1,
-1.248492, 1.366199, -0.6855133, 0, 0, 0, 1, 1,
-1.244207, 3.915679, -0.1900026, 0, 0, 0, 1, 1,
-1.241861, 0.8080327, -1.48425, 0, 0, 0, 1, 1,
-1.235995, 0.3641448, -1.752879, 1, 1, 1, 1, 1,
-1.227815, -0.2700482, -2.680976, 1, 1, 1, 1, 1,
-1.225175, -1.703187, -0.827199, 1, 1, 1, 1, 1,
-1.222783, 0.168175, -1.216547, 1, 1, 1, 1, 1,
-1.218997, 0.6124011, -1.374483, 1, 1, 1, 1, 1,
-1.217845, 1.925197, 1.212828, 1, 1, 1, 1, 1,
-1.211629, -0.367924, -1.73663, 1, 1, 1, 1, 1,
-1.203478, -0.1625199, -0.1867236, 1, 1, 1, 1, 1,
-1.1908, -1.635292, -1.813872, 1, 1, 1, 1, 1,
-1.187055, 1.339341, -1.39974, 1, 1, 1, 1, 1,
-1.179619, -0.7147526, -3.778395, 1, 1, 1, 1, 1,
-1.176782, -1.584163, -2.540154, 1, 1, 1, 1, 1,
-1.160545, -1.564385, -1.74791, 1, 1, 1, 1, 1,
-1.15921, 1.013874, 0.7649276, 1, 1, 1, 1, 1,
-1.152679, 1.846766, -0.5813034, 1, 1, 1, 1, 1,
-1.143862, 0.1408942, -1.660188, 0, 0, 1, 1, 1,
-1.133733, 0.1141208, -0.3888374, 1, 0, 0, 1, 1,
-1.127993, 0.4631467, -2.710764, 1, 0, 0, 1, 1,
-1.119475, -0.7766088, -2.238444, 1, 0, 0, 1, 1,
-1.117857, 2.462371, -1.078668, 1, 0, 0, 1, 1,
-1.115936, -0.1173627, -1.662985, 1, 0, 0, 1, 1,
-1.107186, -0.04300844, -1.686643, 0, 0, 0, 1, 1,
-1.106542, -0.02547224, -1.589676, 0, 0, 0, 1, 1,
-1.104506, -0.03943419, -3.429163, 0, 0, 0, 1, 1,
-1.100453, 0.3748715, -0.192803, 0, 0, 0, 1, 1,
-1.098952, -0.006514561, -1.591835, 0, 0, 0, 1, 1,
-1.098862, -0.4552078, -1.698581, 0, 0, 0, 1, 1,
-1.092547, -0.06848255, -2.749579, 0, 0, 0, 1, 1,
-1.09107, 1.315253, -0.7774394, 1, 1, 1, 1, 1,
-1.089491, 0.3868247, 0.2620523, 1, 1, 1, 1, 1,
-1.08499, 0.111309, 0.3076225, 1, 1, 1, 1, 1,
-1.077928, -0.7507611, -1.78389, 1, 1, 1, 1, 1,
-1.06624, 0.6242641, -1.232921, 1, 1, 1, 1, 1,
-1.063739, -1.75414, -1.443661, 1, 1, 1, 1, 1,
-1.052998, 0.2202512, -0.7421136, 1, 1, 1, 1, 1,
-1.049629, 0.5738425, -2.877175, 1, 1, 1, 1, 1,
-1.045867, -1.880885, -2.148031, 1, 1, 1, 1, 1,
-1.043923, -0.002619071, -0.3327147, 1, 1, 1, 1, 1,
-1.043558, -0.2115843, -1.829567, 1, 1, 1, 1, 1,
-1.043086, 0.1087739, -0.8191686, 1, 1, 1, 1, 1,
-1.04297, -0.7744375, -2.389043, 1, 1, 1, 1, 1,
-1.03947, -0.006446475, -2.429541, 1, 1, 1, 1, 1,
-1.014485, -0.4002372, -1.976355, 1, 1, 1, 1, 1,
-1.009413, -0.6285608, -2.226558, 0, 0, 1, 1, 1,
-1.00419, -1.02187, -3.051702, 1, 0, 0, 1, 1,
-1.002813, -0.4159756, -2.417887, 1, 0, 0, 1, 1,
-1.00086, -0.7654628, -2.23912, 1, 0, 0, 1, 1,
-0.9930755, -0.9376718, -1.162551, 1, 0, 0, 1, 1,
-0.9919249, -0.2317674, -2.904964, 1, 0, 0, 1, 1,
-0.9861253, -1.521218, -1.497267, 0, 0, 0, 1, 1,
-0.9860852, -0.3253531, -1.188253, 0, 0, 0, 1, 1,
-0.983274, -1.250794, -2.518452, 0, 0, 0, 1, 1,
-0.9825874, 0.4243192, 0.6785055, 0, 0, 0, 1, 1,
-0.9819188, -1.529972, -1.406952, 0, 0, 0, 1, 1,
-0.9780182, -0.04395855, -1.33908, 0, 0, 0, 1, 1,
-0.9765398, 0.8118662, -2.02635, 0, 0, 0, 1, 1,
-0.9756883, 0.01306231, -2.90624, 1, 1, 1, 1, 1,
-0.9731489, -0.5447059, -2.138427, 1, 1, 1, 1, 1,
-0.9618117, -0.2279756, -1.452425, 1, 1, 1, 1, 1,
-0.9614192, 0.3641524, -2.337023, 1, 1, 1, 1, 1,
-0.9428903, 1.797303, -1.408689, 1, 1, 1, 1, 1,
-0.9392384, 0.5305517, -2.193594, 1, 1, 1, 1, 1,
-0.9225467, 0.3627949, -0.7118766, 1, 1, 1, 1, 1,
-0.9224005, 0.7340281, -0.2142778, 1, 1, 1, 1, 1,
-0.9215726, -1.414051, 0.1062271, 1, 1, 1, 1, 1,
-0.9206437, 0.02408366, -0.6410308, 1, 1, 1, 1, 1,
-0.9183092, 0.3902341, -1.319804, 1, 1, 1, 1, 1,
-0.9153137, -0.5198448, -1.603254, 1, 1, 1, 1, 1,
-0.911113, 1.183392, -0.4701429, 1, 1, 1, 1, 1,
-0.9105726, -0.06604152, -1.524706, 1, 1, 1, 1, 1,
-0.9013848, 0.4821427, 0.04365142, 1, 1, 1, 1, 1,
-0.9012101, -0.6824058, -2.795565, 0, 0, 1, 1, 1,
-0.899961, -1.486194, -0.4464849, 1, 0, 0, 1, 1,
-0.8984844, 0.5462068, -1.711981, 1, 0, 0, 1, 1,
-0.8973852, -0.1469898, -1.538065, 1, 0, 0, 1, 1,
-0.8966421, -2.125813, -3.107561, 1, 0, 0, 1, 1,
-0.8837241, -0.2793623, -2.233333, 1, 0, 0, 1, 1,
-0.8832836, -1.65091, -3.598011, 0, 0, 0, 1, 1,
-0.8788349, -1.140793, -2.298023, 0, 0, 0, 1, 1,
-0.8757471, -1.319938, -3.486156, 0, 0, 0, 1, 1,
-0.872082, 1.971595, -0.5226845, 0, 0, 0, 1, 1,
-0.8700468, 0.4724854, -0.3124411, 0, 0, 0, 1, 1,
-0.864497, -1.663502, -2.468473, 0, 0, 0, 1, 1,
-0.8626261, 0.7840817, -1.231452, 0, 0, 0, 1, 1,
-0.8521689, -0.9074146, -3.281204, 1, 1, 1, 1, 1,
-0.8485175, 0.3834431, -0.7055321, 1, 1, 1, 1, 1,
-0.8467395, -0.4710928, -1.766851, 1, 1, 1, 1, 1,
-0.835321, -0.03939191, -2.029147, 1, 1, 1, 1, 1,
-0.8332447, 0.6888255, -1.87008, 1, 1, 1, 1, 1,
-0.8279379, 1.298725, -1.915187, 1, 1, 1, 1, 1,
-0.8241292, -0.6582379, -2.018691, 1, 1, 1, 1, 1,
-0.8215598, 0.8661075, -1.277987, 1, 1, 1, 1, 1,
-0.8202402, 0.7701381, -1.889021, 1, 1, 1, 1, 1,
-0.8171398, -1.548074, -2.284969, 1, 1, 1, 1, 1,
-0.8149868, -0.3726678, -1.904268, 1, 1, 1, 1, 1,
-0.8123466, 0.6031879, -1.476152, 1, 1, 1, 1, 1,
-0.8114154, -0.4078812, -2.444794, 1, 1, 1, 1, 1,
-0.7968694, 2.018163, 0.6072041, 1, 1, 1, 1, 1,
-0.7885733, 0.3909234, 0.2379103, 1, 1, 1, 1, 1,
-0.7877103, -0.4606399, -1.246608, 0, 0, 1, 1, 1,
-0.7861705, 0.1819098, 0.8547553, 1, 0, 0, 1, 1,
-0.7835445, -0.968119, -3.247641, 1, 0, 0, 1, 1,
-0.7805808, -0.6701156, -1.625892, 1, 0, 0, 1, 1,
-0.7730879, -0.3958788, -1.937752, 1, 0, 0, 1, 1,
-0.7718697, 0.2242913, -1.842318, 1, 0, 0, 1, 1,
-0.7699041, -1.19832, -0.4632523, 0, 0, 0, 1, 1,
-0.7696759, -0.581223, -3.009827, 0, 0, 0, 1, 1,
-0.7630243, -1.177586, -4.031822, 0, 0, 0, 1, 1,
-0.7620931, 1.460062, -0.3330562, 0, 0, 0, 1, 1,
-0.7578177, 0.7877848, -1.164348, 0, 0, 0, 1, 1,
-0.7564598, -0.6199738, -3.123814, 0, 0, 0, 1, 1,
-0.7495546, -0.3471684, -2.144848, 0, 0, 0, 1, 1,
-0.7477725, -0.9084731, -1.595518, 1, 1, 1, 1, 1,
-0.7462127, -0.08185551, -2.416114, 1, 1, 1, 1, 1,
-0.7448592, 0.4085791, -2.621827, 1, 1, 1, 1, 1,
-0.7339972, 0.7108174, -1.554586, 1, 1, 1, 1, 1,
-0.7309319, 0.0211551, -1.297519, 1, 1, 1, 1, 1,
-0.7256807, 0.1933117, -1.728867, 1, 1, 1, 1, 1,
-0.7158824, -0.2299435, -1.676509, 1, 1, 1, 1, 1,
-0.7140623, -1.174782, -3.788635, 1, 1, 1, 1, 1,
-0.7103515, -0.9332865, -0.6281065, 1, 1, 1, 1, 1,
-0.7017289, -0.8467695, -1.508174, 1, 1, 1, 1, 1,
-0.699955, 1.509459, -2.58717, 1, 1, 1, 1, 1,
-0.6930807, -0.09560345, -0.7066153, 1, 1, 1, 1, 1,
-0.6911671, -0.4823552, -0.873818, 1, 1, 1, 1, 1,
-0.6908839, -0.856822, -2.53077, 1, 1, 1, 1, 1,
-0.6905137, -0.1737385, -1.645362, 1, 1, 1, 1, 1,
-0.6899001, -0.5287934, -2.021579, 0, 0, 1, 1, 1,
-0.6892855, -2.480005, -2.039871, 1, 0, 0, 1, 1,
-0.6888306, -0.7310572, -1.2444, 1, 0, 0, 1, 1,
-0.6787654, 0.2130031, -1.591962, 1, 0, 0, 1, 1,
-0.676946, 0.4518238, -1.460486, 1, 0, 0, 1, 1,
-0.6741338, 0.5188531, -0.9164906, 1, 0, 0, 1, 1,
-0.6720583, -1.106404, -3.728212, 0, 0, 0, 1, 1,
-0.6690437, 0.5003614, -1.337705, 0, 0, 0, 1, 1,
-0.6665332, 0.5023372, -1.319081, 0, 0, 0, 1, 1,
-0.6663594, -0.1882303, -2.440848, 0, 0, 0, 1, 1,
-0.6633268, -0.06258856, -3.798784, 0, 0, 0, 1, 1,
-0.6628901, -0.6679608, -3.645436, 0, 0, 0, 1, 1,
-0.6599236, 0.6486542, 0.9587245, 0, 0, 0, 1, 1,
-0.649955, 0.8666973, -0.8594785, 1, 1, 1, 1, 1,
-0.6485153, 0.2149143, -1.397163, 1, 1, 1, 1, 1,
-0.6482875, -1.101901, -4.351857, 1, 1, 1, 1, 1,
-0.6458583, 0.7670896, -0.8897346, 1, 1, 1, 1, 1,
-0.644354, -0.1546778, -3.572528, 1, 1, 1, 1, 1,
-0.6438297, -0.303097, -1.920932, 1, 1, 1, 1, 1,
-0.6433383, -0.1750719, -2.571596, 1, 1, 1, 1, 1,
-0.642742, 0.1077081, -1.64789, 1, 1, 1, 1, 1,
-0.6381878, 0.4754781, -1.260906, 1, 1, 1, 1, 1,
-0.6348405, -1.623331, -3.807048, 1, 1, 1, 1, 1,
-0.6336942, 0.7875521, 0.4416818, 1, 1, 1, 1, 1,
-0.6332273, 1.254366, 0.02239681, 1, 1, 1, 1, 1,
-0.6331885, -0.05173494, -1.062277, 1, 1, 1, 1, 1,
-0.6331185, -0.620863, -1.412812, 1, 1, 1, 1, 1,
-0.6328344, -1.878939, -3.08817, 1, 1, 1, 1, 1,
-0.6077273, 0.01528441, -1.403631, 0, 0, 1, 1, 1,
-0.6050318, -2.762292, -2.187534, 1, 0, 0, 1, 1,
-0.5985024, 0.7899225, -1.035246, 1, 0, 0, 1, 1,
-0.5984623, -0.7993122, -2.307331, 1, 0, 0, 1, 1,
-0.5974804, 1.318586, 0.6902991, 1, 0, 0, 1, 1,
-0.5952137, -0.09131235, -0.7986665, 1, 0, 0, 1, 1,
-0.5942807, -0.218906, -2.249148, 0, 0, 0, 1, 1,
-0.5919035, -0.9718632, -1.712372, 0, 0, 0, 1, 1,
-0.5913221, -0.8634517, -0.1808596, 0, 0, 0, 1, 1,
-0.5855851, 0.1026951, -0.3145566, 0, 0, 0, 1, 1,
-0.5846624, 0.2557706, -2.031475, 0, 0, 0, 1, 1,
-0.5829167, -0.2461977, -2.5365, 0, 0, 0, 1, 1,
-0.582105, -0.7576647, -2.629421, 0, 0, 0, 1, 1,
-0.5816906, 0.8185967, -0.3277475, 1, 1, 1, 1, 1,
-0.5801485, 0.04454352, 0.6525147, 1, 1, 1, 1, 1,
-0.5799183, 0.2695436, -0.3789121, 1, 1, 1, 1, 1,
-0.5773638, -0.7098874, -2.148128, 1, 1, 1, 1, 1,
-0.5729735, -0.2297726, -3.617878, 1, 1, 1, 1, 1,
-0.569728, 0.3178739, -1.89505, 1, 1, 1, 1, 1,
-0.5697158, 0.4500934, -1.807134, 1, 1, 1, 1, 1,
-0.569007, -1.425327, -2.223811, 1, 1, 1, 1, 1,
-0.5684684, 1.748213, -0.8447462, 1, 1, 1, 1, 1,
-0.5668113, -0.6872464, -2.583406, 1, 1, 1, 1, 1,
-0.5667714, 0.2471642, -1.35826, 1, 1, 1, 1, 1,
-0.5634084, 0.723523, -0.01321539, 1, 1, 1, 1, 1,
-0.5572457, 1.391928, -2.650269, 1, 1, 1, 1, 1,
-0.5571893, -1.359556, -2.906767, 1, 1, 1, 1, 1,
-0.5517719, -0.2553151, -4.736701, 1, 1, 1, 1, 1,
-0.5502422, -0.8382139, -3.400841, 0, 0, 1, 1, 1,
-0.5461802, 1.013207, 0.7966193, 1, 0, 0, 1, 1,
-0.5455408, -0.7109225, -2.891547, 1, 0, 0, 1, 1,
-0.5441998, 1.513245, 0.6902393, 1, 0, 0, 1, 1,
-0.5428257, 0.1599104, -2.3367, 1, 0, 0, 1, 1,
-0.5416834, 1.352976, -0.3286571, 1, 0, 0, 1, 1,
-0.5344579, -1.399522, -0.6126236, 0, 0, 0, 1, 1,
-0.5341029, 1.059565, -0.1348809, 0, 0, 0, 1, 1,
-0.528626, 1.290732, 0.637475, 0, 0, 0, 1, 1,
-0.5257481, 1.297294, 0.6826417, 0, 0, 0, 1, 1,
-0.5230688, 0.9690072, -0.3241448, 0, 0, 0, 1, 1,
-0.5218797, -2.062204, -3.344144, 0, 0, 0, 1, 1,
-0.5168801, 0.08486785, -0.8594688, 0, 0, 0, 1, 1,
-0.5132163, -1.109728, -5.87665, 1, 1, 1, 1, 1,
-0.5128581, -1.788051, -0.8640078, 1, 1, 1, 1, 1,
-0.5118496, 1.440934, 0.9129559, 1, 1, 1, 1, 1,
-0.5117906, -0.4493297, -2.116224, 1, 1, 1, 1, 1,
-0.5097104, 0.697836, -0.0489222, 1, 1, 1, 1, 1,
-0.5033222, 0.001663564, -2.798652, 1, 1, 1, 1, 1,
-0.5031704, 1.526418, -0.4980295, 1, 1, 1, 1, 1,
-0.5018188, 1.45626, -0.454354, 1, 1, 1, 1, 1,
-0.4990821, -0.7016644, -1.457152, 1, 1, 1, 1, 1,
-0.4977992, -0.9058608, -0.6241248, 1, 1, 1, 1, 1,
-0.4924159, -0.4528067, -1.704394, 1, 1, 1, 1, 1,
-0.4910494, 0.5031892, -0.3701381, 1, 1, 1, 1, 1,
-0.4889254, -0.4821147, -2.061781, 1, 1, 1, 1, 1,
-0.4804296, 0.2310941, -0.2786402, 1, 1, 1, 1, 1,
-0.4760337, 1.10012, -1.746095, 1, 1, 1, 1, 1,
-0.4750925, 0.8800845, -0.4018015, 0, 0, 1, 1, 1,
-0.4748506, 0.6908996, -0.1223054, 1, 0, 0, 1, 1,
-0.4748119, -0.4889367, -1.992835, 1, 0, 0, 1, 1,
-0.4732139, 0.1884191, -0.2124555, 1, 0, 0, 1, 1,
-0.4696189, 0.5521896, -2.275858, 1, 0, 0, 1, 1,
-0.4685468, -0.4179706, -4.541389, 1, 0, 0, 1, 1,
-0.4581413, -0.930296, -2.962969, 0, 0, 0, 1, 1,
-0.4540209, 1.416672, -1.804578, 0, 0, 0, 1, 1,
-0.4487039, 0.9180168, 0.04839458, 0, 0, 0, 1, 1,
-0.4467576, -1.46935, -2.127547, 0, 0, 0, 1, 1,
-0.4387597, -1.314454, -2.20972, 0, 0, 0, 1, 1,
-0.4372162, -0.3412699, -3.406806, 0, 0, 0, 1, 1,
-0.4370601, -0.7204268, -3.001489, 0, 0, 0, 1, 1,
-0.4329018, 0.1905597, -1.737914, 1, 1, 1, 1, 1,
-0.4327679, -1.513377, -3.639729, 1, 1, 1, 1, 1,
-0.4327211, 0.4672961, -2.22589, 1, 1, 1, 1, 1,
-0.4295071, -0.8243397, -1.922832, 1, 1, 1, 1, 1,
-0.4286667, 0.8289099, -2.809931, 1, 1, 1, 1, 1,
-0.4282165, -0.719683, -1.605147, 1, 1, 1, 1, 1,
-0.4229403, -0.06444777, -1.768546, 1, 1, 1, 1, 1,
-0.422765, -0.5434144, -1.375678, 1, 1, 1, 1, 1,
-0.419358, -0.4533842, -2.719758, 1, 1, 1, 1, 1,
-0.419329, -0.7502128, -3.812564, 1, 1, 1, 1, 1,
-0.4186873, -0.3070915, -3.433957, 1, 1, 1, 1, 1,
-0.4055288, 0.1144077, -2.099405, 1, 1, 1, 1, 1,
-0.4041517, -2.297414, -3.27944, 1, 1, 1, 1, 1,
-0.4029242, -0.01430316, -4.535602, 1, 1, 1, 1, 1,
-0.3988495, 0.7543042, 1.201255, 1, 1, 1, 1, 1,
-0.3953267, 0.6701422, -0.3757453, 0, 0, 1, 1, 1,
-0.3936943, -0.3427824, -2.688403, 1, 0, 0, 1, 1,
-0.381718, -0.6123746, -2.834303, 1, 0, 0, 1, 1,
-0.3750575, -1.01518, -2.23201, 1, 0, 0, 1, 1,
-0.3721015, 0.5629398, -1.137383, 1, 0, 0, 1, 1,
-0.3681833, 0.8439997, 1.373918, 1, 0, 0, 1, 1,
-0.3677351, -0.05373548, -1.459046, 0, 0, 0, 1, 1,
-0.3611883, -0.8967066, -5.050863, 0, 0, 0, 1, 1,
-0.3607758, -0.6948445, -3.971415, 0, 0, 0, 1, 1,
-0.3605658, -0.5672924, -1.722481, 0, 0, 0, 1, 1,
-0.3596676, 1.014317, -1.295394, 0, 0, 0, 1, 1,
-0.3540298, 1.210764, -1.103012, 0, 0, 0, 1, 1,
-0.3532719, -1.347695, -4.410099, 0, 0, 0, 1, 1,
-0.3532307, 1.992963, -0.2007346, 1, 1, 1, 1, 1,
-0.3522626, 0.3360179, -0.2645114, 1, 1, 1, 1, 1,
-0.351192, 1.654495, -1.943046, 1, 1, 1, 1, 1,
-0.347182, 0.3530028, -0.7412476, 1, 1, 1, 1, 1,
-0.3463573, -0.1180347, -0.1358191, 1, 1, 1, 1, 1,
-0.3429282, -1.746706, -3.256371, 1, 1, 1, 1, 1,
-0.3382389, -0.7040167, -1.990214, 1, 1, 1, 1, 1,
-0.3365201, -0.2855251, -2.133685, 1, 1, 1, 1, 1,
-0.3361555, 0.6208197, -1.483594, 1, 1, 1, 1, 1,
-0.3349876, 0.3117321, -0.5946637, 1, 1, 1, 1, 1,
-0.3347496, 0.8559108, -0.2733922, 1, 1, 1, 1, 1,
-0.333871, 0.2579972, -0.663083, 1, 1, 1, 1, 1,
-0.3318017, -0.7013175, -3.330796, 1, 1, 1, 1, 1,
-0.3294095, -1.281745, -0.4892693, 1, 1, 1, 1, 1,
-0.3285922, -0.1779277, -1.310469, 1, 1, 1, 1, 1,
-0.3238183, -0.1436623, -2.100093, 0, 0, 1, 1, 1,
-0.3205992, -1.122268, -3.369541, 1, 0, 0, 1, 1,
-0.3196343, -0.4186086, -1.377958, 1, 0, 0, 1, 1,
-0.3195678, 2.063213, -0.8194723, 1, 0, 0, 1, 1,
-0.3191095, 0.7059274, -2.043105, 1, 0, 0, 1, 1,
-0.3174162, 0.2029809, -3.40487, 1, 0, 0, 1, 1,
-0.3167113, 2.36422, -0.5376841, 0, 0, 0, 1, 1,
-0.3166231, 1.501761, -0.4953085, 0, 0, 0, 1, 1,
-0.3136059, -1.176552, -2.937181, 0, 0, 0, 1, 1,
-0.3131732, -0.5470876, -3.122345, 0, 0, 0, 1, 1,
-0.3069121, -0.5691026, -2.371064, 0, 0, 0, 1, 1,
-0.3023601, -1.795358, -1.718403, 0, 0, 0, 1, 1,
-0.2990218, -0.578509, -2.503613, 0, 0, 0, 1, 1,
-0.2924535, -1.185308, -3.301022, 1, 1, 1, 1, 1,
-0.2893679, -0.05573886, -3.185639, 1, 1, 1, 1, 1,
-0.2892188, -1.683823, -2.208226, 1, 1, 1, 1, 1,
-0.2884273, 0.8164979, 0.5602705, 1, 1, 1, 1, 1,
-0.2861043, 0.9133425, -0.4395827, 1, 1, 1, 1, 1,
-0.2850877, -0.1508561, -2.027968, 1, 1, 1, 1, 1,
-0.2841491, -0.2760062, -2.630919, 1, 1, 1, 1, 1,
-0.2838943, 1.15263, -0.2228068, 1, 1, 1, 1, 1,
-0.2822452, 1.007818, 1.323381, 1, 1, 1, 1, 1,
-0.2801737, 0.7801031, 1.465858, 1, 1, 1, 1, 1,
-0.2777553, -1.26342, -3.691521, 1, 1, 1, 1, 1,
-0.2754948, -0.482627, -3.187157, 1, 1, 1, 1, 1,
-0.2741556, -2.075544, -3.232279, 1, 1, 1, 1, 1,
-0.2736706, -1.029659, -2.782012, 1, 1, 1, 1, 1,
-0.27078, 1.572591, 1.483021, 1, 1, 1, 1, 1,
-0.2669957, -0.4451752, -3.814121, 0, 0, 1, 1, 1,
-0.2613217, 0.02633078, -1.599129, 1, 0, 0, 1, 1,
-0.2609332, 0.1627682, -0.9778224, 1, 0, 0, 1, 1,
-0.2584823, 0.9548469, -0.6554734, 1, 0, 0, 1, 1,
-0.2550412, 1.040784, 0.4949456, 1, 0, 0, 1, 1,
-0.2537575, -0.4072294, -3.709907, 1, 0, 0, 1, 1,
-0.2519507, 0.3032203, -0.9826727, 0, 0, 0, 1, 1,
-0.2513505, 2.635364, 0.4708554, 0, 0, 0, 1, 1,
-0.2499094, -0.7902066, -2.20664, 0, 0, 0, 1, 1,
-0.2498162, 1.90686, 0.1517583, 0, 0, 0, 1, 1,
-0.2445766, -1.732414, -3.422424, 0, 0, 0, 1, 1,
-0.2404485, -0.6531396, -1.723918, 0, 0, 0, 1, 1,
-0.2395149, 0.9839771, -0.632095, 0, 0, 0, 1, 1,
-0.239133, 2.434098, 0.05586959, 1, 1, 1, 1, 1,
-0.2358533, 0.3053962, -1.291985, 1, 1, 1, 1, 1,
-0.2332989, -0.5219266, -3.186097, 1, 1, 1, 1, 1,
-0.2327856, 0.6428425, -0.4458973, 1, 1, 1, 1, 1,
-0.2228502, 1.528662, 0.1445794, 1, 1, 1, 1, 1,
-0.2222927, -0.3077561, -4.011378, 1, 1, 1, 1, 1,
-0.2203878, 0.8783858, -2.297905, 1, 1, 1, 1, 1,
-0.2200139, 0.8008193, -0.5802655, 1, 1, 1, 1, 1,
-0.2199969, 0.0864705, -1.530305, 1, 1, 1, 1, 1,
-0.2179811, -0.4112917, -2.456115, 1, 1, 1, 1, 1,
-0.2174146, 0.8095623, -1.132883, 1, 1, 1, 1, 1,
-0.2112381, -0.6070163, -2.764166, 1, 1, 1, 1, 1,
-0.2079074, -0.9295009, -2.880889, 1, 1, 1, 1, 1,
-0.2047155, 1.234033, -1.525657, 1, 1, 1, 1, 1,
-0.2026058, -0.2679714, -3.285522, 1, 1, 1, 1, 1,
-0.2019966, 0.9253031, -0.6941518, 0, 0, 1, 1, 1,
-0.1909696, 0.08827635, -1.483409, 1, 0, 0, 1, 1,
-0.1849189, 1.447458, 0.5275987, 1, 0, 0, 1, 1,
-0.1845826, 1.05164, -0.5596018, 1, 0, 0, 1, 1,
-0.1773631, 0.2593518, -2.791745, 1, 0, 0, 1, 1,
-0.1721635, -3.227796, -2.373708, 1, 0, 0, 1, 1,
-0.1701082, 0.7915826, -0.23084, 0, 0, 0, 1, 1,
-0.1688214, -0.05852467, -3.299788, 0, 0, 0, 1, 1,
-0.1685772, -0.4682835, -4.458624, 0, 0, 0, 1, 1,
-0.1672549, -0.6932487, -4.163154, 0, 0, 0, 1, 1,
-0.1651874, 0.2509572, 1.727875, 0, 0, 0, 1, 1,
-0.1616447, 1.376119, -0.2848622, 0, 0, 0, 1, 1,
-0.153344, 0.496033, -1.335897, 0, 0, 0, 1, 1,
-0.1502897, 0.9431249, 0.5649418, 1, 1, 1, 1, 1,
-0.1494766, 0.8202794, -0.6429986, 1, 1, 1, 1, 1,
-0.1451803, 0.3132766, -1.372359, 1, 1, 1, 1, 1,
-0.1448932, -0.6934263, -1.999806, 1, 1, 1, 1, 1,
-0.1435098, -1.24824, -2.76713, 1, 1, 1, 1, 1,
-0.1397217, 0.3975769, -0.2891555, 1, 1, 1, 1, 1,
-0.129374, -0.3103129, -1.37209, 1, 1, 1, 1, 1,
-0.129146, -0.4369668, -3.076404, 1, 1, 1, 1, 1,
-0.1273369, -1.757429, -2.953498, 1, 1, 1, 1, 1,
-0.1265635, -1.034618, -2.005803, 1, 1, 1, 1, 1,
-0.1251609, -0.6736885, -4.300883, 1, 1, 1, 1, 1,
-0.1235856, 0.218742, -2.267668, 1, 1, 1, 1, 1,
-0.1214337, 0.2452582, -0.8471586, 1, 1, 1, 1, 1,
-0.1199524, 0.6091322, 1.153459, 1, 1, 1, 1, 1,
-0.1193962, -0.8627663, -1.659808, 1, 1, 1, 1, 1,
-0.1187629, 2.446901, 1.338081, 0, 0, 1, 1, 1,
-0.1135259, -0.8568497, -2.525645, 1, 0, 0, 1, 1,
-0.1069072, 0.2599876, -0.2684016, 1, 0, 0, 1, 1,
-0.1068332, 2.152885, -0.4424311, 1, 0, 0, 1, 1,
-0.1048989, 0.9593732, 0.2525035, 1, 0, 0, 1, 1,
-0.1039152, 2.249611, 0.5540652, 1, 0, 0, 1, 1,
-0.1038279, 1.19925, 0.07525969, 0, 0, 0, 1, 1,
-0.1022553, 0.3757318, -0.6415496, 0, 0, 0, 1, 1,
-0.09840383, 0.4598455, 0.1070179, 0, 0, 0, 1, 1,
-0.09442044, 1.424163, 1.486046, 0, 0, 0, 1, 1,
-0.091585, 0.4817124, -0.7223625, 0, 0, 0, 1, 1,
-0.09100351, 0.3461496, -0.4900304, 0, 0, 0, 1, 1,
-0.08866246, 0.1619068, -1.061866, 0, 0, 0, 1, 1,
-0.08803546, 0.7456942, 0.9956113, 1, 1, 1, 1, 1,
-0.08795048, 0.4973121, 1.478172, 1, 1, 1, 1, 1,
-0.08523244, 0.2295135, -1.423504, 1, 1, 1, 1, 1,
-0.08444702, -1.229734, -1.159031, 1, 1, 1, 1, 1,
-0.08065142, 0.4561331, 0.2097404, 1, 1, 1, 1, 1,
-0.08037539, 1.68077, 0.1978047, 1, 1, 1, 1, 1,
-0.07456508, -2.185538, -1.50138, 1, 1, 1, 1, 1,
-0.07306011, 0.7553226, 0.5586435, 1, 1, 1, 1, 1,
-0.07129228, 1.443601, -2.204185, 1, 1, 1, 1, 1,
-0.07092811, 0.6519309, -0.7672942, 1, 1, 1, 1, 1,
-0.0703726, -0.609825, -1.790887, 1, 1, 1, 1, 1,
-0.06883613, 1.603287, 1.887971, 1, 1, 1, 1, 1,
-0.06671907, -0.285642, -2.177338, 1, 1, 1, 1, 1,
-0.06413861, -0.3989047, -4.177644, 1, 1, 1, 1, 1,
-0.06402181, -0.7426902, -2.868097, 1, 1, 1, 1, 1,
-0.06174158, 1.956784, -0.05305706, 0, 0, 1, 1, 1,
-0.0609777, -2.577208, -1.794084, 1, 0, 0, 1, 1,
-0.0604705, 1.28506, -0.5406799, 1, 0, 0, 1, 1,
-0.06023347, -1.081616, -3.914101, 1, 0, 0, 1, 1,
-0.05988859, 0.5728753, 0.5959591, 1, 0, 0, 1, 1,
-0.05588249, -0.4061018, -3.716037, 1, 0, 0, 1, 1,
-0.05481566, 1.395939, 0.9296231, 0, 0, 0, 1, 1,
-0.05235703, -0.2711387, -3.736136, 0, 0, 0, 1, 1,
-0.05078555, -1.339053, -2.540415, 0, 0, 0, 1, 1,
-0.04809504, -2.05329, -2.157998, 0, 0, 0, 1, 1,
-0.04289135, -1.894435, -3.356417, 0, 0, 0, 1, 1,
-0.04100559, 0.2985308, 2.400975, 0, 0, 0, 1, 1,
-0.04094826, 1.252571, -1.419497, 0, 0, 0, 1, 1,
-0.03765361, -0.503452, -2.451352, 1, 1, 1, 1, 1,
-0.0372633, 0.4052349, 0.2819542, 1, 1, 1, 1, 1,
-0.03673127, -1.383184, -3.467605, 1, 1, 1, 1, 1,
-0.03225641, -0.01518377, -1.850534, 1, 1, 1, 1, 1,
-0.03090199, -1.382982, -4.42071, 1, 1, 1, 1, 1,
-0.0304201, -0.2669522, -2.934442, 1, 1, 1, 1, 1,
-0.0295772, 0.6940069, 1.024857, 1, 1, 1, 1, 1,
-0.02869888, -0.3461685, -2.883746, 1, 1, 1, 1, 1,
-0.02627155, -1.121747, -2.966257, 1, 1, 1, 1, 1,
-0.02626394, 1.474286, 0.09149098, 1, 1, 1, 1, 1,
-0.02575561, 0.5134141, 0.4616535, 1, 1, 1, 1, 1,
-0.02516345, -1.127133, -3.918233, 1, 1, 1, 1, 1,
-0.02252507, -1.279215, -2.258008, 1, 1, 1, 1, 1,
-0.0212306, 0.7631777, -0.1377573, 1, 1, 1, 1, 1,
-0.01365996, -0.1355703, -2.875576, 1, 1, 1, 1, 1,
-0.00880296, 0.404246, 1.128031, 0, 0, 1, 1, 1,
-0.003665618, -0.9890868, -2.676765, 1, 0, 0, 1, 1,
-0.001784706, 0.9241874, -2.114547, 1, 0, 0, 1, 1,
-0.00171061, 0.6150696, 0.8116693, 1, 0, 0, 1, 1,
-0.0006534878, 0.3988398, 0.152059, 1, 0, 0, 1, 1,
-0.0003391291, -0.9644554, -5.451545, 1, 0, 0, 1, 1,
0.001790337, 0.7157528, 0.1070418, 0, 0, 0, 1, 1,
0.002559036, -0.3347344, 2.764699, 0, 0, 0, 1, 1,
0.006683233, -0.337807, 2.911691, 0, 0, 0, 1, 1,
0.009409217, 2.04198, 0.8627183, 0, 0, 0, 1, 1,
0.009928529, -0.2720706, 3.808334, 0, 0, 0, 1, 1,
0.01253921, -0.5859879, 2.556134, 0, 0, 0, 1, 1,
0.01505935, -0.4344293, 4.491421, 0, 0, 0, 1, 1,
0.01607447, 0.6595176, -0.3121063, 1, 1, 1, 1, 1,
0.01634614, -0.2871282, 3.444411, 1, 1, 1, 1, 1,
0.01662427, -0.6719043, 2.584546, 1, 1, 1, 1, 1,
0.01850417, -0.1406594, 2.716111, 1, 1, 1, 1, 1,
0.01931971, 0.2380753, 0.6507337, 1, 1, 1, 1, 1,
0.02112707, -1.385791, 2.875983, 1, 1, 1, 1, 1,
0.02506954, -1.335821, 3.266068, 1, 1, 1, 1, 1,
0.02652678, -0.4508424, 2.054516, 1, 1, 1, 1, 1,
0.03148704, -0.2425496, 2.960505, 1, 1, 1, 1, 1,
0.03196719, 0.150532, -0.6545727, 1, 1, 1, 1, 1,
0.03275697, -0.3387051, 2.320403, 1, 1, 1, 1, 1,
0.03518432, 0.5137036, 0.5912138, 1, 1, 1, 1, 1,
0.0384726, 0.5844363, 0.5135827, 1, 1, 1, 1, 1,
0.038937, 1.505023, 0.6940219, 1, 1, 1, 1, 1,
0.04033981, -0.4878275, 2.619927, 1, 1, 1, 1, 1,
0.04636406, 0.1347672, 0.7368079, 0, 0, 1, 1, 1,
0.04636486, -0.04793524, 0.961087, 1, 0, 0, 1, 1,
0.04673149, -1.198258, 3.569605, 1, 0, 0, 1, 1,
0.04889168, -0.354025, 3.019146, 1, 0, 0, 1, 1,
0.0520156, -1.265137, 3.50399, 1, 0, 0, 1, 1,
0.05916438, -0.8715667, 3.430933, 1, 0, 0, 1, 1,
0.05983879, 1.563344, 1.218568, 0, 0, 0, 1, 1,
0.06078243, 0.3123474, 0.0641313, 0, 0, 0, 1, 1,
0.06221892, 0.9818938, 1.652748, 0, 0, 0, 1, 1,
0.06360245, -1.174627, 3.272129, 0, 0, 0, 1, 1,
0.0702994, 0.3886134, 0.659301, 0, 0, 0, 1, 1,
0.07343837, -0.6493867, 3.754817, 0, 0, 0, 1, 1,
0.07570224, -0.1514214, 1.478463, 0, 0, 0, 1, 1,
0.08125889, -1.495947, 2.347759, 1, 1, 1, 1, 1,
0.08142227, -0.692925, 3.41434, 1, 1, 1, 1, 1,
0.0829919, 0.6285972, -0.9229403, 1, 1, 1, 1, 1,
0.0833732, 0.06605846, 1.791007, 1, 1, 1, 1, 1,
0.08846104, 1.427777, 1.091185, 1, 1, 1, 1, 1,
0.0925684, 0.6457242, 0.3708801, 1, 1, 1, 1, 1,
0.09453239, -1.044405, 2.339047, 1, 1, 1, 1, 1,
0.09457509, -0.06978799, 3.139758, 1, 1, 1, 1, 1,
0.09591848, -1.314442, 4.87282, 1, 1, 1, 1, 1,
0.09649314, 1.280759, -0.07292456, 1, 1, 1, 1, 1,
0.09783544, -0.348679, 1.317226, 1, 1, 1, 1, 1,
0.09903973, -0.6561114, 4.330406, 1, 1, 1, 1, 1,
0.1014382, 0.1868224, 1.463531, 1, 1, 1, 1, 1,
0.1019176, -1.200616, 2.298315, 1, 1, 1, 1, 1,
0.1032365, -2.288478, 2.778062, 1, 1, 1, 1, 1,
0.108357, 0.9443416, 1.087272, 0, 0, 1, 1, 1,
0.1094809, -0.8044744, 1.806845, 1, 0, 0, 1, 1,
0.122934, -0.3818449, 2.811455, 1, 0, 0, 1, 1,
0.1253769, 0.9038167, 0.9191028, 1, 0, 0, 1, 1,
0.1271503, 0.6998197, 1.414225, 1, 0, 0, 1, 1,
0.1324356, 0.2391698, -0.9117174, 1, 0, 0, 1, 1,
0.1365458, -0.9574194, 2.989065, 0, 0, 0, 1, 1,
0.1378545, -0.7881486, 4.065483, 0, 0, 0, 1, 1,
0.1396848, 0.5430022, 0.7023574, 0, 0, 0, 1, 1,
0.1442629, -0.08732589, 3.572174, 0, 0, 0, 1, 1,
0.1489268, -1.195885, 1.440925, 0, 0, 0, 1, 1,
0.1509213, 0.506775, -0.1166514, 0, 0, 0, 1, 1,
0.1539982, -0.535084, 3.353448, 0, 0, 0, 1, 1,
0.1540473, -1.920742, 4.115423, 1, 1, 1, 1, 1,
0.160114, 0.05242183, 1.840019, 1, 1, 1, 1, 1,
0.1618006, -0.2289481, 2.524646, 1, 1, 1, 1, 1,
0.1621023, 1.204553, -0.2001992, 1, 1, 1, 1, 1,
0.1676456, 0.06780916, 0.7135528, 1, 1, 1, 1, 1,
0.1757965, -0.1210818, 2.5281, 1, 1, 1, 1, 1,
0.1770047, -0.1961184, 2.833596, 1, 1, 1, 1, 1,
0.1785679, -0.09229779, 1.121855, 1, 1, 1, 1, 1,
0.1786869, -1.112643, 4.306539, 1, 1, 1, 1, 1,
0.1820215, 1.082188, -0.5619278, 1, 1, 1, 1, 1,
0.1852476, -0.9745871, 1.72717, 1, 1, 1, 1, 1,
0.185688, 0.133476, 0.7857755, 1, 1, 1, 1, 1,
0.186666, 0.2819849, -1.874293, 1, 1, 1, 1, 1,
0.192157, -0.01173082, 0.7803012, 1, 1, 1, 1, 1,
0.1923951, 0.004795106, 1.881813, 1, 1, 1, 1, 1,
0.1945287, 1.365131, 1.602208, 0, 0, 1, 1, 1,
0.1953275, 1.228387, -2.743777, 1, 0, 0, 1, 1,
0.1954597, -0.8375804, 3.052122, 1, 0, 0, 1, 1,
0.1961904, -0.2805772, 2.509065, 1, 0, 0, 1, 1,
0.197671, -0.2101581, 2.189055, 1, 0, 0, 1, 1,
0.1994743, -1.035704, 3.203379, 1, 0, 0, 1, 1,
0.2025481, 0.8316724, 0.5823764, 0, 0, 0, 1, 1,
0.2049095, 0.7838432, 0.2782741, 0, 0, 0, 1, 1,
0.2101542, -1.931184, 3.233048, 0, 0, 0, 1, 1,
0.2132475, 0.2840106, 1.099838, 0, 0, 0, 1, 1,
0.2133225, -0.08671793, 1.127904, 0, 0, 0, 1, 1,
0.2161576, -0.8833133, 3.064853, 0, 0, 0, 1, 1,
0.2205698, 0.1075074, -0.4835778, 0, 0, 0, 1, 1,
0.22133, 0.4816436, 1.024566, 1, 1, 1, 1, 1,
0.2215942, 0.3122947, 2.527575, 1, 1, 1, 1, 1,
0.223291, -1.009499, 1.897465, 1, 1, 1, 1, 1,
0.2264237, 2.274727, 0.3266115, 1, 1, 1, 1, 1,
0.2265478, -0.02818494, -0.1667791, 1, 1, 1, 1, 1,
0.2293257, 1.42968, 0.8150848, 1, 1, 1, 1, 1,
0.2371602, 0.490363, 0.2934271, 1, 1, 1, 1, 1,
0.237774, 0.1253269, 1.285585, 1, 1, 1, 1, 1,
0.2399533, 0.3497925, 2.848462, 1, 1, 1, 1, 1,
0.2411774, -0.3098314, 1.624695, 1, 1, 1, 1, 1,
0.2421751, 0.7175527, 0.324118, 1, 1, 1, 1, 1,
0.2448874, 1.43216, -0.6753761, 1, 1, 1, 1, 1,
0.2451578, 0.6604972, -1.187067, 1, 1, 1, 1, 1,
0.2522796, 0.8174182, 0.8227715, 1, 1, 1, 1, 1,
0.2535815, 0.1643164, 1.944131, 1, 1, 1, 1, 1,
0.2562833, -1.270469, 3.982041, 0, 0, 1, 1, 1,
0.2618408, -0.7657386, 2.887135, 1, 0, 0, 1, 1,
0.2626082, -0.738313, 2.736893, 1, 0, 0, 1, 1,
0.2692201, 0.708508, 1.107085, 1, 0, 0, 1, 1,
0.2719081, 1.507763, -1.55972, 1, 0, 0, 1, 1,
0.2763743, 3.542203, -0.9259049, 1, 0, 0, 1, 1,
0.277924, -0.8906768, 2.036246, 0, 0, 0, 1, 1,
0.278319, 0.1797608, 0.7838114, 0, 0, 0, 1, 1,
0.279322, -0.6318263, 2.425166, 0, 0, 0, 1, 1,
0.2810672, 0.448408, 1.069771, 0, 0, 0, 1, 1,
0.2831456, -1.537504, 1.501583, 0, 0, 0, 1, 1,
0.2859582, 0.4093287, -0.09712831, 0, 0, 0, 1, 1,
0.2879462, -0.867226, 5.589022, 0, 0, 0, 1, 1,
0.2947402, -0.4770894, 3.27355, 1, 1, 1, 1, 1,
0.2951824, -0.2405005, 3.225559, 1, 1, 1, 1, 1,
0.3013543, -0.6877454, 3.193238, 1, 1, 1, 1, 1,
0.3026805, 0.0788127, 2.696758, 1, 1, 1, 1, 1,
0.3053513, -0.0629073, 2.707527, 1, 1, 1, 1, 1,
0.3061057, -0.527988, 1.815963, 1, 1, 1, 1, 1,
0.3066308, 0.2672125, 0.6645095, 1, 1, 1, 1, 1,
0.3069016, 0.5729076, 0.6751415, 1, 1, 1, 1, 1,
0.3078851, 0.7175483, 1.404143, 1, 1, 1, 1, 1,
0.3124395, -0.9761764, 3.673683, 1, 1, 1, 1, 1,
0.3126546, 0.4938817, -2.081193, 1, 1, 1, 1, 1,
0.3161711, 0.4925731, 1.082964, 1, 1, 1, 1, 1,
0.3172946, 1.584581, -1.047759, 1, 1, 1, 1, 1,
0.3292326, 0.9313164, -1.493383, 1, 1, 1, 1, 1,
0.3295576, 0.2599779, 0.7904645, 1, 1, 1, 1, 1,
0.3350462, 0.2880057, -0.4183754, 0, 0, 1, 1, 1,
0.3352847, 1.111424, 2.215102, 1, 0, 0, 1, 1,
0.3404942, -0.1530254, 2.012053, 1, 0, 0, 1, 1,
0.3463635, -0.3226759, 1.023666, 1, 0, 0, 1, 1,
0.35022, -0.238175, 1.504383, 1, 0, 0, 1, 1,
0.3512737, -0.172695, 3.558352, 1, 0, 0, 1, 1,
0.3558246, -0.8348941, 2.317696, 0, 0, 0, 1, 1,
0.3565476, 0.2585436, 0.4110214, 0, 0, 0, 1, 1,
0.3588767, -0.2711224, 3.209088, 0, 0, 0, 1, 1,
0.3608371, 0.6130113, 1.423977, 0, 0, 0, 1, 1,
0.3610265, -0.1774224, 2.312424, 0, 0, 0, 1, 1,
0.366531, -0.878907, 1.660275, 0, 0, 0, 1, 1,
0.3665452, -0.1876407, 1.807619, 0, 0, 0, 1, 1,
0.3712518, 0.7354714, 1.374312, 1, 1, 1, 1, 1,
0.3715528, 0.1745754, 0.5665625, 1, 1, 1, 1, 1,
0.3739376, 0.8631342, 1.839664, 1, 1, 1, 1, 1,
0.3883978, -1.536407, 4.426867, 1, 1, 1, 1, 1,
0.3917673, -0.3853614, 2.911642, 1, 1, 1, 1, 1,
0.3922041, -0.07266481, -0.028532, 1, 1, 1, 1, 1,
0.3931497, 1.02029, 0.5812787, 1, 1, 1, 1, 1,
0.3936093, -0.2847626, 3.302406, 1, 1, 1, 1, 1,
0.3943121, -0.6381428, 1.650285, 1, 1, 1, 1, 1,
0.4021778, -1.035206, 3.027328, 1, 1, 1, 1, 1,
0.4037685, 0.5383617, -0.3608882, 1, 1, 1, 1, 1,
0.4092604, 1.266558, 1.300073, 1, 1, 1, 1, 1,
0.4144376, 0.8851822, 0.06969147, 1, 1, 1, 1, 1,
0.4216806, 0.055375, 0.4694635, 1, 1, 1, 1, 1,
0.4281397, -1.296883, 3.286263, 1, 1, 1, 1, 1,
0.4288605, -1.411939, 2.285616, 0, 0, 1, 1, 1,
0.4309433, -0.07962322, 1.803341, 1, 0, 0, 1, 1,
0.4330797, 0.07743247, 0.728503, 1, 0, 0, 1, 1,
0.4337369, -0.5409564, 2.961542, 1, 0, 0, 1, 1,
0.4428526, -2.693979, 2.454379, 1, 0, 0, 1, 1,
0.442938, -0.6689383, 4.323993, 1, 0, 0, 1, 1,
0.4492754, -2.01209, 3.679214, 0, 0, 0, 1, 1,
0.4529655, 0.416777, 1.745824, 0, 0, 0, 1, 1,
0.4575763, -0.6215712, 2.940079, 0, 0, 0, 1, 1,
0.4596619, -0.2248744, 1.798966, 0, 0, 0, 1, 1,
0.4605289, 0.2089128, 1.140343, 0, 0, 0, 1, 1,
0.4712383, -0.2851706, 2.365053, 0, 0, 0, 1, 1,
0.4723088, 0.5285959, 2.19361, 0, 0, 0, 1, 1,
0.473518, -1.866196, 2.760239, 1, 1, 1, 1, 1,
0.4759323, 0.1354889, -0.9436643, 1, 1, 1, 1, 1,
0.4790721, -1.832284, 3.509701, 1, 1, 1, 1, 1,
0.4801352, -1.470166, 2.642081, 1, 1, 1, 1, 1,
0.4822906, -1.198816, 2.883745, 1, 1, 1, 1, 1,
0.4978192, -0.854616, 3.154601, 1, 1, 1, 1, 1,
0.4993091, -1.063407, 3.99446, 1, 1, 1, 1, 1,
0.5012693, 0.6720963, -0.1316712, 1, 1, 1, 1, 1,
0.5034701, -0.5607555, 2.403679, 1, 1, 1, 1, 1,
0.5056911, -0.8378321, 1.023351, 1, 1, 1, 1, 1,
0.5066331, 0.03608953, 0.7530749, 1, 1, 1, 1, 1,
0.5138043, 0.5979705, -0.2164578, 1, 1, 1, 1, 1,
0.515065, 0.8184763, 2.312496, 1, 1, 1, 1, 1,
0.5205846, -0.1679663, 1.938206, 1, 1, 1, 1, 1,
0.5308993, 0.4109239, 0.1703675, 1, 1, 1, 1, 1,
0.5310653, 1.233632, 1.453469, 0, 0, 1, 1, 1,
0.5355234, 0.1448216, 1.343067, 1, 0, 0, 1, 1,
0.5381085, 0.6491391, 0.7769123, 1, 0, 0, 1, 1,
0.5390229, 0.1765549, 1.101672, 1, 0, 0, 1, 1,
0.5425241, -0.5121795, 2.569589, 1, 0, 0, 1, 1,
0.5444219, -0.4708184, 2.540298, 1, 0, 0, 1, 1,
0.5458487, -0.4671617, 1.237927, 0, 0, 0, 1, 1,
0.5497708, -0.4125385, 1.989234, 0, 0, 0, 1, 1,
0.5499743, -2.14482, 3.56475, 0, 0, 0, 1, 1,
0.5500749, 0.5379051, 2.100781, 0, 0, 0, 1, 1,
0.5529554, 1.039659, 0.2701293, 0, 0, 0, 1, 1,
0.5551154, 1.054856, -0.3624249, 0, 0, 0, 1, 1,
0.5555696, 0.6108969, 0.3806619, 0, 0, 0, 1, 1,
0.5560009, 1.135907, -0.6814965, 1, 1, 1, 1, 1,
0.5584192, 1.362055, 0.0902955, 1, 1, 1, 1, 1,
0.559829, 0.5051747, 0.5108238, 1, 1, 1, 1, 1,
0.565242, -2.644511, 3.581442, 1, 1, 1, 1, 1,
0.5659643, 0.7041658, -0.8220348, 1, 1, 1, 1, 1,
0.5671873, -0.4418075, 3.416842, 1, 1, 1, 1, 1,
0.5676702, 0.4774302, 2.262146, 1, 1, 1, 1, 1,
0.5690181, 0.9042715, 0.1434743, 1, 1, 1, 1, 1,
0.5702274, 1.664235, -1.04742, 1, 1, 1, 1, 1,
0.575184, 0.5560592, 1.679642, 1, 1, 1, 1, 1,
0.5767713, -1.55593, 3.64618, 1, 1, 1, 1, 1,
0.582487, -0.03893014, 2.100651, 1, 1, 1, 1, 1,
0.586833, -0.7586824, 2.227134, 1, 1, 1, 1, 1,
0.587538, -0.1442215, 2.521694, 1, 1, 1, 1, 1,
0.5888286, 0.509894, 1.450808, 1, 1, 1, 1, 1,
0.5906861, -0.7795324, 3.575451, 0, 0, 1, 1, 1,
0.5909764, -0.163622, 1.279228, 1, 0, 0, 1, 1,
0.5949051, -0.3961868, 1.855817, 1, 0, 0, 1, 1,
0.6011121, -0.07153502, 3.190257, 1, 0, 0, 1, 1,
0.6017132, -1.324945, 2.544118, 1, 0, 0, 1, 1,
0.6049712, -0.3120461, 1.071832, 1, 0, 0, 1, 1,
0.6068031, -0.02194537, 1.744794, 0, 0, 0, 1, 1,
0.6132697, 1.184434, -0.677828, 0, 0, 0, 1, 1,
0.6164069, -0.08798595, 2.734172, 0, 0, 0, 1, 1,
0.6165702, -0.3847899, 2.071607, 0, 0, 0, 1, 1,
0.6235619, -0.2030175, -0.002490468, 0, 0, 0, 1, 1,
0.6410968, 0.2955394, 0.685689, 0, 0, 0, 1, 1,
0.6423778, 0.753313, -1.446504, 0, 0, 0, 1, 1,
0.6431272, -1.263591, 2.869561, 1, 1, 1, 1, 1,
0.646742, -0.1516232, 1.603046, 1, 1, 1, 1, 1,
0.647633, 2.509879, 1.406379, 1, 1, 1, 1, 1,
0.6486411, 0.5623354, -0.6580362, 1, 1, 1, 1, 1,
0.6492687, 0.1678035, 1.477926, 1, 1, 1, 1, 1,
0.6565877, -0.5301742, 3.852343, 1, 1, 1, 1, 1,
0.6606916, -0.2194377, 2.251997, 1, 1, 1, 1, 1,
0.662667, 0.2715291, 1.011936, 1, 1, 1, 1, 1,
0.6689954, 0.2138972, -0.009076976, 1, 1, 1, 1, 1,
0.676558, -0.5418513, 2.54295, 1, 1, 1, 1, 1,
0.6767148, -0.341161, 1.93909, 1, 1, 1, 1, 1,
0.6829249, 0.581926, 0.3559868, 1, 1, 1, 1, 1,
0.6895543, -2.17904, 1.110455, 1, 1, 1, 1, 1,
0.6909358, -0.8237728, 1.391104, 1, 1, 1, 1, 1,
0.6909489, 0.2662182, -0.0245417, 1, 1, 1, 1, 1,
0.691009, 0.5749732, 1.157714, 0, 0, 1, 1, 1,
0.6930655, -0.4688004, 1.140383, 1, 0, 0, 1, 1,
0.6935667, 1.440443, 1.953448, 1, 0, 0, 1, 1,
0.6957587, -0.5857273, 2.23005, 1, 0, 0, 1, 1,
0.6982602, -0.8995333, 1.511117, 1, 0, 0, 1, 1,
0.7019662, -0.004267735, 1.725317, 1, 0, 0, 1, 1,
0.7020454, -1.563156, 1.914142, 0, 0, 0, 1, 1,
0.7069718, 0.06530891, 0.8670033, 0, 0, 0, 1, 1,
0.7113982, 1.534146, -0.526624, 0, 0, 0, 1, 1,
0.7136655, 1.002185, -0.0306531, 0, 0, 0, 1, 1,
0.7172071, 0.3773777, 0.1433557, 0, 0, 0, 1, 1,
0.7186372, 2.405872, 0.8259344, 0, 0, 0, 1, 1,
0.7230986, -0.3336603, 1.268876, 0, 0, 0, 1, 1,
0.7255743, -0.5471874, 0.5305548, 1, 1, 1, 1, 1,
0.7270752, -1.197311, 3.149025, 1, 1, 1, 1, 1,
0.7282068, -1.789489, 2.947994, 1, 1, 1, 1, 1,
0.730103, -0.01017776, 1.417699, 1, 1, 1, 1, 1,
0.7323776, -1.01091, 2.018881, 1, 1, 1, 1, 1,
0.7351114, -0.7241253, 0.8372861, 1, 1, 1, 1, 1,
0.7353079, -0.2295702, 0.8010706, 1, 1, 1, 1, 1,
0.7362239, -0.394709, 2.796819, 1, 1, 1, 1, 1,
0.7386113, -0.4927487, 2.910896, 1, 1, 1, 1, 1,
0.7388181, -0.2079039, 1.694612, 1, 1, 1, 1, 1,
0.7465258, -1.00801, 2.138137, 1, 1, 1, 1, 1,
0.7527122, -0.08320402, 0.08627476, 1, 1, 1, 1, 1,
0.7551182, -2.050755, 3.180281, 1, 1, 1, 1, 1,
0.7684538, -1.503857, 3.565213, 1, 1, 1, 1, 1,
0.770819, 0.7201964, 0.4232034, 1, 1, 1, 1, 1,
0.7747724, 0.9675695, 1.081391, 0, 0, 1, 1, 1,
0.7773685, -0.4592621, 2.309344, 1, 0, 0, 1, 1,
0.7788367, 0.3959929, 1.386198, 1, 0, 0, 1, 1,
0.7804574, -0.5274259, 2.483131, 1, 0, 0, 1, 1,
0.7808164, 0.8452183, 1.737887, 1, 0, 0, 1, 1,
0.7836733, 0.06658439, 2.056826, 1, 0, 0, 1, 1,
0.783992, -0.2069189, 2.087409, 0, 0, 0, 1, 1,
0.7842211, -0.04758135, 3.491895, 0, 0, 0, 1, 1,
0.7879335, -0.158858, 2.758857, 0, 0, 0, 1, 1,
0.7913138, 0.4380342, 1.012208, 0, 0, 0, 1, 1,
0.7916347, -0.3490402, 1.483439, 0, 0, 0, 1, 1,
0.8078933, 1.795074, 0.08379564, 0, 0, 0, 1, 1,
0.80899, 0.4772193, 1.224684, 0, 0, 0, 1, 1,
0.8092256, -2.085102, 3.80279, 1, 1, 1, 1, 1,
0.8127229, 0.04935104, -0.1044558, 1, 1, 1, 1, 1,
0.8180441, -1.451636, 3.665727, 1, 1, 1, 1, 1,
0.8208345, 1.028901, 0.4609836, 1, 1, 1, 1, 1,
0.8226965, 0.6198673, 0.2929712, 1, 1, 1, 1, 1,
0.8254995, -1.417306, 1.839021, 1, 1, 1, 1, 1,
0.8360716, 1.338188, 0.7076824, 1, 1, 1, 1, 1,
0.8407925, -0.3023927, 1.242262, 1, 1, 1, 1, 1,
0.8412476, -0.08225194, 2.39434, 1, 1, 1, 1, 1,
0.8448893, 0.1040215, 2.608198, 1, 1, 1, 1, 1,
0.8454083, -1.806355, 1.328263, 1, 1, 1, 1, 1,
0.8514644, -1.070698, 1.944772, 1, 1, 1, 1, 1,
0.8566329, -0.2349909, -1.557085, 1, 1, 1, 1, 1,
0.8620658, 0.9898292, 1.310592, 1, 1, 1, 1, 1,
0.8634181, 0.198921, 2.54561, 1, 1, 1, 1, 1,
0.8783057, -0.4250402, 0.908203, 0, 0, 1, 1, 1,
0.8953599, 1.826844, -0.1391834, 1, 0, 0, 1, 1,
0.895922, 0.468225, 0.9253315, 1, 0, 0, 1, 1,
0.8962256, 0.02569453, 4.37867, 1, 0, 0, 1, 1,
0.8991472, -0.01857848, 1.499412, 1, 0, 0, 1, 1,
0.9054198, -0.5578024, 1.213582, 1, 0, 0, 1, 1,
0.9058381, 1.126513, -0.6257352, 0, 0, 0, 1, 1,
0.9058886, -0.6034889, 1.389118, 0, 0, 0, 1, 1,
0.9135051, 0.8170094, 1.155084, 0, 0, 0, 1, 1,
0.9143192, 0.7240858, 1.405692, 0, 0, 0, 1, 1,
0.9164315, -0.09083892, 2.717328, 0, 0, 0, 1, 1,
0.919136, -0.2156824, 2.3591, 0, 0, 0, 1, 1,
0.9240983, 2.64224, 0.2612658, 0, 0, 0, 1, 1,
0.9272949, -1.160753, 3.57303, 1, 1, 1, 1, 1,
0.9298691, -0.5465938, 2.45353, 1, 1, 1, 1, 1,
0.9306251, 1.090348, 1.833666, 1, 1, 1, 1, 1,
0.9327096, 0.695391, 2.089596, 1, 1, 1, 1, 1,
0.9354214, 0.2932379, 1.128343, 1, 1, 1, 1, 1,
0.9378864, -1.613463, 2.944083, 1, 1, 1, 1, 1,
0.9468108, -1.200288, 3.393171, 1, 1, 1, 1, 1,
0.9511737, -1.194053, 2.327341, 1, 1, 1, 1, 1,
0.9520534, 0.551348, -0.2122321, 1, 1, 1, 1, 1,
0.9559734, 0.01066514, 2.591279, 1, 1, 1, 1, 1,
0.9610472, 0.8382878, 1.050477, 1, 1, 1, 1, 1,
0.9634554, -0.5705812, 2.024992, 1, 1, 1, 1, 1,
0.9656277, 0.2793462, 0.9712788, 1, 1, 1, 1, 1,
0.9660212, -0.8927067, 2.434185, 1, 1, 1, 1, 1,
0.9670458, -1.132594, 2.040978, 1, 1, 1, 1, 1,
0.9672318, -0.4563166, 2.861823, 0, 0, 1, 1, 1,
0.9712234, 0.6182587, 2.295481, 1, 0, 0, 1, 1,
0.97841, -0.4261734, 2.558844, 1, 0, 0, 1, 1,
0.9848429, -0.7971423, 2.760568, 1, 0, 0, 1, 1,
0.9966324, 0.2280696, 1.093417, 1, 0, 0, 1, 1,
1.006437, -0.5264449, 3.123834, 1, 0, 0, 1, 1,
1.008275, 1.072902, 2.642739, 0, 0, 0, 1, 1,
1.025212, 1.176219, 2.261764, 0, 0, 0, 1, 1,
1.025528, -1.312521, 1.940704, 0, 0, 0, 1, 1,
1.031256, -0.07616878, 1.199548, 0, 0, 0, 1, 1,
1.03145, 0.8507362, 0.1398837, 0, 0, 0, 1, 1,
1.037464, -0.3050185, 1.290025, 0, 0, 0, 1, 1,
1.047388, 0.5054492, 0.9344655, 0, 0, 0, 1, 1,
1.051318, -0.2433385, 2.246667, 1, 1, 1, 1, 1,
1.05226, 0.2134639, 0.8389102, 1, 1, 1, 1, 1,
1.052433, -0.450528, 3.184136, 1, 1, 1, 1, 1,
1.05336, -0.5122469, 0.0653363, 1, 1, 1, 1, 1,
1.057731, -0.4820908, 1.717941, 1, 1, 1, 1, 1,
1.058161, 1.418435, -1.680822, 1, 1, 1, 1, 1,
1.064602, -0.1054244, 1.557279, 1, 1, 1, 1, 1,
1.067283, -1.160394, 2.848494, 1, 1, 1, 1, 1,
1.073268, 1.969593, 1.849716, 1, 1, 1, 1, 1,
1.074832, 0.6478085, 0.3167824, 1, 1, 1, 1, 1,
1.074868, 0.005960955, 1.356449, 1, 1, 1, 1, 1,
1.090953, -0.01644798, 0.8496255, 1, 1, 1, 1, 1,
1.103736, -0.9200458, 1.90379, 1, 1, 1, 1, 1,
1.104402, 0.4061967, -0.5957203, 1, 1, 1, 1, 1,
1.109636, -0.7983838, 3.047418, 1, 1, 1, 1, 1,
1.110592, -0.2156093, 1.936741, 0, 0, 1, 1, 1,
1.112609, 0.1704603, 1.827544, 1, 0, 0, 1, 1,
1.120589, -0.1527153, 1.791451, 1, 0, 0, 1, 1,
1.123856, -0.1139781, 2.518176, 1, 0, 0, 1, 1,
1.144412, 0.6334539, 0.9771176, 1, 0, 0, 1, 1,
1.148721, -0.3030014, 2.036016, 1, 0, 0, 1, 1,
1.155064, -0.3344027, 2.107357, 0, 0, 0, 1, 1,
1.156202, -1.698372, 2.085459, 0, 0, 0, 1, 1,
1.159454, 1.867707, -0.1143478, 0, 0, 0, 1, 1,
1.169818, -0.8180009, 1.741057, 0, 0, 0, 1, 1,
1.179821, 0.005759079, 0.03604469, 0, 0, 0, 1, 1,
1.184419, -0.5546449, 3.414711, 0, 0, 0, 1, 1,
1.187253, -0.07164028, 0.9131663, 0, 0, 0, 1, 1,
1.187579, 1.229231, 0.7544975, 1, 1, 1, 1, 1,
1.201257, -1.150124, 2.940936, 1, 1, 1, 1, 1,
1.213356, 0.8237889, 2.625806, 1, 1, 1, 1, 1,
1.214379, -1.171902, 3.28055, 1, 1, 1, 1, 1,
1.217962, -1.466345, 1.545159, 1, 1, 1, 1, 1,
1.219481, -1.37067, 3.131724, 1, 1, 1, 1, 1,
1.22185, 0.1973229, 1.995814, 1, 1, 1, 1, 1,
1.224903, 1.02163, 1.739225, 1, 1, 1, 1, 1,
1.225359, -0.1787123, 0.497963, 1, 1, 1, 1, 1,
1.230572, -0.3548589, 3.756545, 1, 1, 1, 1, 1,
1.230881, 0.5333686, 2.122698, 1, 1, 1, 1, 1,
1.236748, -1.045223, 0.2949113, 1, 1, 1, 1, 1,
1.2416, 1.255707, 0.4283207, 1, 1, 1, 1, 1,
1.242198, 0.8405777, 1.800234, 1, 1, 1, 1, 1,
1.242307, 0.544372, -1.139433, 1, 1, 1, 1, 1,
1.245031, 0.3902693, -0.1043374, 0, 0, 1, 1, 1,
1.266248, -1.18894, 2.555584, 1, 0, 0, 1, 1,
1.266521, 0.7033514, 1.179479, 1, 0, 0, 1, 1,
1.277749, -0.7096959, -0.07991289, 1, 0, 0, 1, 1,
1.296293, -1.280104, 2.596523, 1, 0, 0, 1, 1,
1.303376, 0.1557278, 1.425901, 1, 0, 0, 1, 1,
1.30869, -0.6625671, 1.526467, 0, 0, 0, 1, 1,
1.325953, 0.2345311, 2.188595, 0, 0, 0, 1, 1,
1.331902, 1.001123, -0.7161689, 0, 0, 0, 1, 1,
1.333184, -0.5456198, 0.7719916, 0, 0, 0, 1, 1,
1.337797, -1.297625, 2.907403, 0, 0, 0, 1, 1,
1.339664, 0.3331747, 0.9610626, 0, 0, 0, 1, 1,
1.342595, 1.120998, 1.706164, 0, 0, 0, 1, 1,
1.3523, -0.1221279, 2.043426, 1, 1, 1, 1, 1,
1.353003, -0.1285041, 1.500411, 1, 1, 1, 1, 1,
1.376583, 0.4069775, 1.813515, 1, 1, 1, 1, 1,
1.380062, 0.3536604, -0.7757757, 1, 1, 1, 1, 1,
1.3882, -1.436017, 0.2394089, 1, 1, 1, 1, 1,
1.406832, 0.779092, 1.76237, 1, 1, 1, 1, 1,
1.411753, -0.8628921, 2.590672, 1, 1, 1, 1, 1,
1.4269, 0.3333328, 0.164164, 1, 1, 1, 1, 1,
1.432483, -0.8739388, 3.826804, 1, 1, 1, 1, 1,
1.437683, -0.5771386, 2.249164, 1, 1, 1, 1, 1,
1.447025, -1.332804, 1.869452, 1, 1, 1, 1, 1,
1.466023, 0.4112691, -0.504258, 1, 1, 1, 1, 1,
1.470726, 0.7919198, 0.5878317, 1, 1, 1, 1, 1,
1.471778, 0.2437649, 2.022033, 1, 1, 1, 1, 1,
1.478152, 0.1964845, 1.233378, 1, 1, 1, 1, 1,
1.490671, -1.792624, 4.277848, 0, 0, 1, 1, 1,
1.502389, -1.083967, 2.039532, 1, 0, 0, 1, 1,
1.518903, 0.1586257, 1.094282, 1, 0, 0, 1, 1,
1.522187, -0.7084905, 1.442412, 1, 0, 0, 1, 1,
1.533712, -0.2988668, 1.46125, 1, 0, 0, 1, 1,
1.538014, 1.171486, 0.7593199, 1, 0, 0, 1, 1,
1.540729, 2.471029, 1.104869, 0, 0, 0, 1, 1,
1.551088, -1.722479, 2.426088, 0, 0, 0, 1, 1,
1.552199, -0.1424172, 1.274038, 0, 0, 0, 1, 1,
1.555134, -0.6989484, 2.414622, 0, 0, 0, 1, 1,
1.566977, -1.779374, 1.989256, 0, 0, 0, 1, 1,
1.572296, 0.04898744, -0.3269565, 0, 0, 0, 1, 1,
1.574222, -0.9018421, 0.9990398, 0, 0, 0, 1, 1,
1.577091, -0.911641, 3.187986, 1, 1, 1, 1, 1,
1.591322, 0.2018571, 0.6820265, 1, 1, 1, 1, 1,
1.594148, 0.8458317, 1.676284, 1, 1, 1, 1, 1,
1.602313, 1.023636, 0.8472435, 1, 1, 1, 1, 1,
1.636748, 0.5833277, 0.529375, 1, 1, 1, 1, 1,
1.65256, -0.6757636, 3.949265, 1, 1, 1, 1, 1,
1.665757, 0.8244229, 2.266034, 1, 1, 1, 1, 1,
1.674704, -0.3878524, 1.603338, 1, 1, 1, 1, 1,
1.692719, 0.3750549, 2.419396, 1, 1, 1, 1, 1,
1.69474, 1.527648, 0.8729402, 1, 1, 1, 1, 1,
1.703094, 0.02692843, 1.673633, 1, 1, 1, 1, 1,
1.707686, 0.3783072, 3.049277, 1, 1, 1, 1, 1,
1.724577, -2.104475, 2.148183, 1, 1, 1, 1, 1,
1.730175, -0.07831781, 3.586196, 1, 1, 1, 1, 1,
1.735113, -1.497256, 0.5215336, 1, 1, 1, 1, 1,
1.751562, -0.3787036, -0.3895319, 0, 0, 1, 1, 1,
1.774933, -2.231071, 1.510158, 1, 0, 0, 1, 1,
1.798279, -0.3209493, 2.077605, 1, 0, 0, 1, 1,
1.798817, -1.769482, 0.818967, 1, 0, 0, 1, 1,
1.804943, -1.619328, 1.265287, 1, 0, 0, 1, 1,
1.815967, -0.438352, 1.993039, 1, 0, 0, 1, 1,
1.828889, 0.7698752, -0.9522305, 0, 0, 0, 1, 1,
1.843165, 0.7331888, 2.107456, 0, 0, 0, 1, 1,
1.862341, -0.2187973, 3.834935, 0, 0, 0, 1, 1,
1.862821, 0.876995, 1.133779, 0, 0, 0, 1, 1,
1.866295, 0.5864178, 1.385836, 0, 0, 0, 1, 1,
1.881388, 1.058434, -0.7469712, 0, 0, 0, 1, 1,
1.925714, -0.1464323, 0.7531884, 0, 0, 0, 1, 1,
1.927368, -3.096152, 3.68571, 1, 1, 1, 1, 1,
1.938496, -0.3237338, 1.31569, 1, 1, 1, 1, 1,
1.938762, -0.2433437, 0.7807895, 1, 1, 1, 1, 1,
1.950317, -0.9308589, 3.412765, 1, 1, 1, 1, 1,
1.960359, 0.1105487, 0.09053793, 1, 1, 1, 1, 1,
1.987312, -1.00948, 4.04661, 1, 1, 1, 1, 1,
2.001153, 2.070572, -0.2463457, 1, 1, 1, 1, 1,
2.021091, 0.3389217, 0.3838678, 1, 1, 1, 1, 1,
2.024923, 1.326503, 1.404346, 1, 1, 1, 1, 1,
2.07632, 0.2026288, 0.00367501, 1, 1, 1, 1, 1,
2.087101, -0.1798173, 3.547418, 1, 1, 1, 1, 1,
2.109346, 1.021095, 1.418649, 1, 1, 1, 1, 1,
2.112239, -0.6675172, 1.883361, 1, 1, 1, 1, 1,
2.13802, -0.2343463, 2.789509, 1, 1, 1, 1, 1,
2.145729, 1.442385, 1.228888, 1, 1, 1, 1, 1,
2.164096, 0.8746693, 2.21545, 0, 0, 1, 1, 1,
2.164598, -0.5359164, 1.220786, 1, 0, 0, 1, 1,
2.168299, -0.5520659, 1.616316, 1, 0, 0, 1, 1,
2.203911, -0.4771475, 1.421036, 1, 0, 0, 1, 1,
2.210847, 0.6199927, -0.3713343, 1, 0, 0, 1, 1,
2.225666, 0.1589037, 2.368051, 1, 0, 0, 1, 1,
2.297235, -1.973927, 2.774061, 0, 0, 0, 1, 1,
2.298447, 0.6761209, 1.168041, 0, 0, 0, 1, 1,
2.357953, 0.002189653, 0.1185388, 0, 0, 0, 1, 1,
2.389451, 0.2051258, 1.790267, 0, 0, 0, 1, 1,
2.396063, -0.6205032, 1.256913, 0, 0, 0, 1, 1,
2.43089, 0.7616826, 2.223857, 0, 0, 0, 1, 1,
2.472773, -0.6315783, 0.8579413, 0, 0, 0, 1, 1,
2.559795, -1.771944, 2.610244, 1, 1, 1, 1, 1,
2.659355, -0.7699612, 1.705276, 1, 1, 1, 1, 1,
2.776873, -1.948664, 3.473572, 1, 1, 1, 1, 1,
2.780138, 0.2330311, 1.053358, 1, 1, 1, 1, 1,
2.797737, 0.3356711, 1.179953, 1, 1, 1, 1, 1,
2.846826, 0.280818, 0.5330207, 1, 1, 1, 1, 1,
3.151999, 2.113994, -0.1292865, 1, 1, 1, 1, 1
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
var radius = 9.999342;
var distance = 35.12226;
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
mvMatrix.translate( -0.1020744, -0.3439417, 0.1438143 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.12226);
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
