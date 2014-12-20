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
-3.357762, 0.9447166, -0.8551277, 1, 0, 0, 1,
-3.06159, 0.5965909, -1.061737, 1, 0.007843138, 0, 1,
-2.76722, 0.3632189, 0.2250643, 1, 0.01176471, 0, 1,
-2.541096, -0.088198, -0.9001254, 1, 0.01960784, 0, 1,
-2.387596, 0.05788703, -3.374822, 1, 0.02352941, 0, 1,
-2.383501, -0.9991924, 0.2166779, 1, 0.03137255, 0, 1,
-2.343325, -0.8928798, -4.06361, 1, 0.03529412, 0, 1,
-2.338855, -0.09897202, -1.926909, 1, 0.04313726, 0, 1,
-2.336771, 0.3601644, -1.580966, 1, 0.04705882, 0, 1,
-2.266004, 1.313236, -1.89245, 1, 0.05490196, 0, 1,
-2.262429, -0.2786917, -2.617951, 1, 0.05882353, 0, 1,
-2.240843, 0.08820423, -1.61018, 1, 0.06666667, 0, 1,
-2.224374, -0.8809727, -1.293635, 1, 0.07058824, 0, 1,
-2.202615, 0.3709645, -1.055327, 1, 0.07843138, 0, 1,
-2.195478, 0.1260851, 0.03449937, 1, 0.08235294, 0, 1,
-2.180839, -0.3784304, -2.490637, 1, 0.09019608, 0, 1,
-2.16797, -0.05756402, -1.332168, 1, 0.09411765, 0, 1,
-2.072443, 2.300579, -0.0161057, 1, 0.1019608, 0, 1,
-2.037102, -0.5470046, -1.698658, 1, 0.1098039, 0, 1,
-2.026691, 2.336598, -1.021537, 1, 0.1137255, 0, 1,
-2.015343, -0.2199298, -2.113141, 1, 0.1215686, 0, 1,
-1.974574, -0.4872518, -3.04913, 1, 0.1254902, 0, 1,
-1.96387, 0.4535654, -0.8014696, 1, 0.1333333, 0, 1,
-1.945901, -0.7425129, -1.653617, 1, 0.1372549, 0, 1,
-1.917859, -1.464189, -1.70358, 1, 0.145098, 0, 1,
-1.899365, 1.79408, -2.402195, 1, 0.1490196, 0, 1,
-1.884795, -0.7481884, -1.409382, 1, 0.1568628, 0, 1,
-1.878852, 1.740026, -1.315783, 1, 0.1607843, 0, 1,
-1.876685, 1.133907, -1.388742, 1, 0.1686275, 0, 1,
-1.821355, 1.020743, -2.200118, 1, 0.172549, 0, 1,
-1.82072, -1.559718, -2.409184, 1, 0.1803922, 0, 1,
-1.80866, 0.6286216, -1.177544, 1, 0.1843137, 0, 1,
-1.799105, 1.260875, -0.3911918, 1, 0.1921569, 0, 1,
-1.760644, -0.3992357, -3.182348, 1, 0.1960784, 0, 1,
-1.756556, -0.7407936, -2.533326, 1, 0.2039216, 0, 1,
-1.745692, -0.7022247, -1.105603, 1, 0.2117647, 0, 1,
-1.735567, 0.5655487, 1.013373, 1, 0.2156863, 0, 1,
-1.722621, 0.3976308, -2.134644, 1, 0.2235294, 0, 1,
-1.703713, 0.426312, -2.55811, 1, 0.227451, 0, 1,
-1.693845, 0.3678225, -0.4512177, 1, 0.2352941, 0, 1,
-1.685938, 0.4409487, -0.4912547, 1, 0.2392157, 0, 1,
-1.680086, 0.01458571, -1.917893, 1, 0.2470588, 0, 1,
-1.668738, -0.1519772, -2.592751, 1, 0.2509804, 0, 1,
-1.661268, 1.382595, -0.8439763, 1, 0.2588235, 0, 1,
-1.643874, -0.5352532, 0.912496, 1, 0.2627451, 0, 1,
-1.643774, 1.16484, -0.984026, 1, 0.2705882, 0, 1,
-1.641255, -1.297147, -1.233035, 1, 0.2745098, 0, 1,
-1.615371, -0.2840274, -0.4238813, 1, 0.282353, 0, 1,
-1.602987, -0.4653307, -1.107462, 1, 0.2862745, 0, 1,
-1.602464, -1.392746, -4.78967, 1, 0.2941177, 0, 1,
-1.577887, 0.05698668, -1.022316, 1, 0.3019608, 0, 1,
-1.575274, 0.1919186, 1.061191, 1, 0.3058824, 0, 1,
-1.574457, -0.272494, -0.9227171, 1, 0.3137255, 0, 1,
-1.54354, -0.0256266, -1.517182, 1, 0.3176471, 0, 1,
-1.540862, 0.4012189, 0.8484495, 1, 0.3254902, 0, 1,
-1.531381, -0.6718933, -2.941003, 1, 0.3294118, 0, 1,
-1.519932, -0.4823974, -3.365765, 1, 0.3372549, 0, 1,
-1.514796, -0.8301859, -3.202008, 1, 0.3411765, 0, 1,
-1.511695, -0.6329473, -2.402994, 1, 0.3490196, 0, 1,
-1.508239, 0.2985082, -2.240829, 1, 0.3529412, 0, 1,
-1.505632, -0.4061968, -1.310092, 1, 0.3607843, 0, 1,
-1.504273, -0.9318035, -1.675336, 1, 0.3647059, 0, 1,
-1.503146, -0.1791914, -1.85755, 1, 0.372549, 0, 1,
-1.487714, 0.8958783, -0.9145193, 1, 0.3764706, 0, 1,
-1.487001, -0.4862521, -1.585623, 1, 0.3843137, 0, 1,
-1.476717, 1.203543, -1.276116, 1, 0.3882353, 0, 1,
-1.465093, 1.158613, -1.561081, 1, 0.3960784, 0, 1,
-1.455748, 1.232643, -1.51075, 1, 0.4039216, 0, 1,
-1.44606, -0.8332247, -1.630109, 1, 0.4078431, 0, 1,
-1.429882, 1.778918, 0.3391315, 1, 0.4156863, 0, 1,
-1.422964, -0.93843, -2.180779, 1, 0.4196078, 0, 1,
-1.421972, 1.136095, 0.607129, 1, 0.427451, 0, 1,
-1.412208, -0.06453881, -0.3238704, 1, 0.4313726, 0, 1,
-1.41157, -0.4549091, 0.2789241, 1, 0.4392157, 0, 1,
-1.406384, 0.3632779, -1.31639, 1, 0.4431373, 0, 1,
-1.404377, -0.3325083, -1.776523, 1, 0.4509804, 0, 1,
-1.395541, 1.062471, 0.1713932, 1, 0.454902, 0, 1,
-1.380461, 1.397645, 2.085891, 1, 0.4627451, 0, 1,
-1.369117, 1.830618, -0.5011895, 1, 0.4666667, 0, 1,
-1.368753, -1.413192, -0.8956174, 1, 0.4745098, 0, 1,
-1.365868, 0.3459067, -1.739699, 1, 0.4784314, 0, 1,
-1.364214, 0.09900804, -1.04768, 1, 0.4862745, 0, 1,
-1.356773, -0.03172819, -0.4019275, 1, 0.4901961, 0, 1,
-1.356056, 0.3268134, -1.642179, 1, 0.4980392, 0, 1,
-1.349953, 0.3500785, -1.649487, 1, 0.5058824, 0, 1,
-1.349131, 0.2786751, -1.188842, 1, 0.509804, 0, 1,
-1.347709, -0.447553, -1.710183, 1, 0.5176471, 0, 1,
-1.345003, 0.5495934, -1.827968, 1, 0.5215687, 0, 1,
-1.344047, -1.124036, -1.352775, 1, 0.5294118, 0, 1,
-1.341227, 0.02523371, -0.03778803, 1, 0.5333334, 0, 1,
-1.337082, -0.8685323, -3.042287, 1, 0.5411765, 0, 1,
-1.324799, 0.684768, -1.023798, 1, 0.5450981, 0, 1,
-1.320802, -0.9220896, -1.033786, 1, 0.5529412, 0, 1,
-1.305819, 0.9949167, -0.5899712, 1, 0.5568628, 0, 1,
-1.291591, 0.158069, -0.2663633, 1, 0.5647059, 0, 1,
-1.281621, -0.4845039, -4.408465, 1, 0.5686275, 0, 1,
-1.272426, 1.632336, -1.17476, 1, 0.5764706, 0, 1,
-1.269564, -1.318702, -1.995384, 1, 0.5803922, 0, 1,
-1.263106, -0.7678512, -0.9888144, 1, 0.5882353, 0, 1,
-1.261464, -1.021117, -3.126668, 1, 0.5921569, 0, 1,
-1.258502, -0.09305643, -2.938277, 1, 0.6, 0, 1,
-1.254844, -0.3238029, -2.577132, 1, 0.6078432, 0, 1,
-1.251339, -1.29867, -2.340195, 1, 0.6117647, 0, 1,
-1.247765, 0.649747, -2.093825, 1, 0.6196079, 0, 1,
-1.238057, 1.796545, -0.3391235, 1, 0.6235294, 0, 1,
-1.228475, 0.2722082, -0.7283779, 1, 0.6313726, 0, 1,
-1.216593, -0.03690451, -1.592222, 1, 0.6352941, 0, 1,
-1.20495, 1.068881, 0.3874052, 1, 0.6431373, 0, 1,
-1.199464, -1.024652, -2.096847, 1, 0.6470588, 0, 1,
-1.18993, 0.283771, -0.9421003, 1, 0.654902, 0, 1,
-1.187148, 0.6094823, -0.1551788, 1, 0.6588235, 0, 1,
-1.185495, 0.306837, -0.9867257, 1, 0.6666667, 0, 1,
-1.184057, 0.6587613, -1.247525, 1, 0.6705883, 0, 1,
-1.168192, 1.491674, 0.2939444, 1, 0.6784314, 0, 1,
-1.14368, -1.089308, -1.217397, 1, 0.682353, 0, 1,
-1.134127, 1.151688, -0.06731459, 1, 0.6901961, 0, 1,
-1.132443, -1.819364, -1.553263, 1, 0.6941177, 0, 1,
-1.131764, 1.466597, -0.7383991, 1, 0.7019608, 0, 1,
-1.130566, 0.8440753, -0.8042909, 1, 0.7098039, 0, 1,
-1.122214, -0.8863491, -1.925721, 1, 0.7137255, 0, 1,
-1.118423, -0.473277, -2.76619, 1, 0.7215686, 0, 1,
-1.113424, 0.02097168, -2.408391, 1, 0.7254902, 0, 1,
-1.111438, -1.97175, -3.363754, 1, 0.7333333, 0, 1,
-1.111279, 1.626665, -1.229818, 1, 0.7372549, 0, 1,
-1.101824, -1.192818, -3.050711, 1, 0.7450981, 0, 1,
-1.101524, -1.092406, -1.735763, 1, 0.7490196, 0, 1,
-1.093159, 0.6738878, -0.5092403, 1, 0.7568628, 0, 1,
-1.091897, 0.1757292, -0.614503, 1, 0.7607843, 0, 1,
-1.090329, 0.9328834, -1.072083, 1, 0.7686275, 0, 1,
-1.090288, -0.5714333, -1.692529, 1, 0.772549, 0, 1,
-1.090254, 0.4642797, -0.9449363, 1, 0.7803922, 0, 1,
-1.089892, 0.4432194, -2.574833, 1, 0.7843137, 0, 1,
-1.088128, 2.307172, 1.560095, 1, 0.7921569, 0, 1,
-1.087031, -0.4724623, -2.254175, 1, 0.7960784, 0, 1,
-1.080286, 0.02673558, -1.447969, 1, 0.8039216, 0, 1,
-1.077253, 0.04694356, -3.211627, 1, 0.8117647, 0, 1,
-1.07496, -0.5994909, -3.40537, 1, 0.8156863, 0, 1,
-1.069767, 0.8173889, 0.3162017, 1, 0.8235294, 0, 1,
-1.058747, 1.112516, -0.3981631, 1, 0.827451, 0, 1,
-1.058221, 1.686487, -1.003675, 1, 0.8352941, 0, 1,
-1.04731, -2.298293, -1.472932, 1, 0.8392157, 0, 1,
-1.041636, 0.4282123, -1.184672, 1, 0.8470588, 0, 1,
-1.04106, -0.2035577, -2.811294, 1, 0.8509804, 0, 1,
-1.035148, 0.5846401, -2.151632, 1, 0.8588235, 0, 1,
-1.02795, -0.3692687, -1.361306, 1, 0.8627451, 0, 1,
-1.022203, -1.118682, -0.9308113, 1, 0.8705882, 0, 1,
-1.022109, 1.14143, -2.186838, 1, 0.8745098, 0, 1,
-1.019683, -0.1089582, -1.748517, 1, 0.8823529, 0, 1,
-1.015726, -0.02373442, -0.902856, 1, 0.8862745, 0, 1,
-1.01378, -0.21851, -1.385668, 1, 0.8941177, 0, 1,
-1.012019, -0.824549, -3.73293, 1, 0.8980392, 0, 1,
-1.009012, -0.2313909, -1.903927, 1, 0.9058824, 0, 1,
-1.007789, 0.6014023, -2.034411, 1, 0.9137255, 0, 1,
-1.004167, -0.5286715, -3.422237, 1, 0.9176471, 0, 1,
-0.9955809, -0.9439937, -1.315545, 1, 0.9254902, 0, 1,
-0.991183, 1.004033, -0.6324392, 1, 0.9294118, 0, 1,
-0.986218, 0.2166126, -2.224574, 1, 0.9372549, 0, 1,
-0.9743806, -1.204447, -1.666821, 1, 0.9411765, 0, 1,
-0.9736127, 0.1056672, -3.101466, 1, 0.9490196, 0, 1,
-0.9572948, -0.1443472, -1.538449, 1, 0.9529412, 0, 1,
-0.9561334, 0.7562615, -1.635083, 1, 0.9607843, 0, 1,
-0.9561136, -0.4993852, -2.521044, 1, 0.9647059, 0, 1,
-0.9529633, 0.06288276, -0.3348295, 1, 0.972549, 0, 1,
-0.9435152, -1.450427, -3.68468, 1, 0.9764706, 0, 1,
-0.9423727, -0.8943222, -2.638805, 1, 0.9843137, 0, 1,
-0.9409024, -0.3655828, -2.535409, 1, 0.9882353, 0, 1,
-0.9392413, 0.6351294, -1.668023, 1, 0.9960784, 0, 1,
-0.9328724, 1.119828, 0.4301248, 0.9960784, 1, 0, 1,
-0.9318922, 0.5284649, 0.2633872, 0.9921569, 1, 0, 1,
-0.9219443, 0.8630543, -0.05024228, 0.9843137, 1, 0, 1,
-0.9218274, -0.467902, -0.4938974, 0.9803922, 1, 0, 1,
-0.9161406, -0.6087239, -2.365913, 0.972549, 1, 0, 1,
-0.910425, 1.962739, 1.173692, 0.9686275, 1, 0, 1,
-0.9039585, -1.344476, -1.975106, 0.9607843, 1, 0, 1,
-0.9038849, -0.05864393, -1.737327, 0.9568627, 1, 0, 1,
-0.8989535, -0.3783951, -1.537426, 0.9490196, 1, 0, 1,
-0.8972872, 1.070847, 1.280611, 0.945098, 1, 0, 1,
-0.8971264, -0.09014032, -2.913779, 0.9372549, 1, 0, 1,
-0.8786684, -2.029046, -1.357157, 0.9333333, 1, 0, 1,
-0.8686495, -0.09993272, -1.941857, 0.9254902, 1, 0, 1,
-0.8680564, -1.093754, -1.849499, 0.9215686, 1, 0, 1,
-0.8646004, 0.9883174, -0.507458, 0.9137255, 1, 0, 1,
-0.8617632, 0.7173399, -1.243553, 0.9098039, 1, 0, 1,
-0.860365, -0.2024972, -2.828188, 0.9019608, 1, 0, 1,
-0.8603589, -1.159497, -2.048217, 0.8941177, 1, 0, 1,
-0.8589576, -0.7924416, -3.079335, 0.8901961, 1, 0, 1,
-0.858566, -0.5998757, -3.30242, 0.8823529, 1, 0, 1,
-0.8574752, 0.6268254, -0.7505319, 0.8784314, 1, 0, 1,
-0.8559572, 1.595931, -1.058579, 0.8705882, 1, 0, 1,
-0.8553009, -1.101064, -2.986031, 0.8666667, 1, 0, 1,
-0.8535191, 0.9873138, -0.476692, 0.8588235, 1, 0, 1,
-0.8439405, -0.5635237, -2.149398, 0.854902, 1, 0, 1,
-0.8417072, 1.138386, -0.9514217, 0.8470588, 1, 0, 1,
-0.8388553, -0.4764926, -1.704434, 0.8431373, 1, 0, 1,
-0.8344966, 0.07814949, -2.153773, 0.8352941, 1, 0, 1,
-0.8314936, -1.049687, -3.278533, 0.8313726, 1, 0, 1,
-0.8297987, -1.071447, -2.033572, 0.8235294, 1, 0, 1,
-0.8280627, -1.365803, -2.069535, 0.8196079, 1, 0, 1,
-0.8271604, -0.2884026, -1.816651, 0.8117647, 1, 0, 1,
-0.8255407, 0.2152291, -1.143755, 0.8078431, 1, 0, 1,
-0.8156571, -1.49698, -1.051042, 0.8, 1, 0, 1,
-0.813106, -0.808568, -3.403533, 0.7921569, 1, 0, 1,
-0.8119097, -0.09414703, -0.834015, 0.7882353, 1, 0, 1,
-0.8091595, 0.4371018, -0.8866013, 0.7803922, 1, 0, 1,
-0.8087451, -0.1428744, -0.4632935, 0.7764706, 1, 0, 1,
-0.8054311, -0.1489347, -1.527367, 0.7686275, 1, 0, 1,
-0.7989937, 0.3519679, -2.920874, 0.7647059, 1, 0, 1,
-0.7973127, 0.09156504, -0.6408824, 0.7568628, 1, 0, 1,
-0.7917668, 0.8033452, -1.195994, 0.7529412, 1, 0, 1,
-0.7800716, 0.2942949, -0.3399135, 0.7450981, 1, 0, 1,
-0.7789369, 0.1622616, -1.164688, 0.7411765, 1, 0, 1,
-0.7763758, -0.8816736, -3.464266, 0.7333333, 1, 0, 1,
-0.7738066, 1.053268, -0.5575125, 0.7294118, 1, 0, 1,
-0.7698023, 1.504895, 0.3979018, 0.7215686, 1, 0, 1,
-0.764631, 1.932214, 0.2498711, 0.7176471, 1, 0, 1,
-0.7637972, 1.42726, -0.8234998, 0.7098039, 1, 0, 1,
-0.762948, -0.2132425, -1.700931, 0.7058824, 1, 0, 1,
-0.7622287, 0.2660133, -2.078823, 0.6980392, 1, 0, 1,
-0.7613578, -0.3384511, -0.3431252, 0.6901961, 1, 0, 1,
-0.7562274, 1.251774, 0.2325341, 0.6862745, 1, 0, 1,
-0.7532532, -1.079963, -3.424315, 0.6784314, 1, 0, 1,
-0.7481964, -0.321079, -2.050059, 0.6745098, 1, 0, 1,
-0.7442781, -0.15816, -0.6879939, 0.6666667, 1, 0, 1,
-0.7433757, 0.9226388, -0.5569314, 0.6627451, 1, 0, 1,
-0.7433093, -0.7465937, -2.119025, 0.654902, 1, 0, 1,
-0.7402567, 1.027439, -1.676545, 0.6509804, 1, 0, 1,
-0.7396231, 0.2717589, -1.67864, 0.6431373, 1, 0, 1,
-0.7360326, -0.03711892, -2.09087, 0.6392157, 1, 0, 1,
-0.7347881, 0.2817989, -0.3852939, 0.6313726, 1, 0, 1,
-0.7328644, 1.724159, 0.2767931, 0.627451, 1, 0, 1,
-0.7248011, 0.4403031, -0.4249775, 0.6196079, 1, 0, 1,
-0.7129596, 0.06122096, -1.964086, 0.6156863, 1, 0, 1,
-0.7003829, 1.126075, -0.01366629, 0.6078432, 1, 0, 1,
-0.6993927, 0.4105605, -1.831007, 0.6039216, 1, 0, 1,
-0.6970232, -0.8479712, -2.936312, 0.5960785, 1, 0, 1,
-0.6942484, 0.2372404, -0.6987891, 0.5882353, 1, 0, 1,
-0.6914251, -1.712202, 0.4784525, 0.5843138, 1, 0, 1,
-0.6871613, 0.2105172, -1.560821, 0.5764706, 1, 0, 1,
-0.6865923, 1.268853, -3.393378, 0.572549, 1, 0, 1,
-0.6805553, 1.522713, -0.3792481, 0.5647059, 1, 0, 1,
-0.6758428, 1.976159, 1.052172, 0.5607843, 1, 0, 1,
-0.6750084, -0.2353619, -2.142159, 0.5529412, 1, 0, 1,
-0.6715394, 2.395008, -0.6175236, 0.5490196, 1, 0, 1,
-0.6669456, 0.7593105, 0.7460139, 0.5411765, 1, 0, 1,
-0.6616237, 0.462619, -1.694612, 0.5372549, 1, 0, 1,
-0.6614934, -1.791709, -2.718128, 0.5294118, 1, 0, 1,
-0.6576465, -0.2326697, -0.3386034, 0.5254902, 1, 0, 1,
-0.6575629, 2.278703, 1.215, 0.5176471, 1, 0, 1,
-0.6561203, 0.1776088, -1.081078, 0.5137255, 1, 0, 1,
-0.6540984, -1.179347, -1.542457, 0.5058824, 1, 0, 1,
-0.6524283, 0.1116709, -0.5452828, 0.5019608, 1, 0, 1,
-0.6465348, -0.718385, -0.8054026, 0.4941176, 1, 0, 1,
-0.6449731, -0.6584743, -0.8289294, 0.4862745, 1, 0, 1,
-0.6446559, -0.07717848, -2.50069, 0.4823529, 1, 0, 1,
-0.6377782, 0.7350265, -1.014603, 0.4745098, 1, 0, 1,
-0.6376728, -2.600039, -2.449971, 0.4705882, 1, 0, 1,
-0.6362997, -0.6515145, -2.65941, 0.4627451, 1, 0, 1,
-0.6329439, -0.7179552, -2.556514, 0.4588235, 1, 0, 1,
-0.6257619, -0.0135261, -1.144885, 0.4509804, 1, 0, 1,
-0.6208673, 1.848249, 0.4984525, 0.4470588, 1, 0, 1,
-0.6190561, 0.007027838, -3.374364, 0.4392157, 1, 0, 1,
-0.6110075, 1.102672, -2.550013, 0.4352941, 1, 0, 1,
-0.6070976, -0.5700126, -4.011268, 0.427451, 1, 0, 1,
-0.6056982, 2.321948, -1.124336, 0.4235294, 1, 0, 1,
-0.6054817, 0.4255463, -1.782506, 0.4156863, 1, 0, 1,
-0.6045243, -0.8639754, -1.842118, 0.4117647, 1, 0, 1,
-0.6013423, 0.3633434, -3.230278, 0.4039216, 1, 0, 1,
-0.5992568, -1.870443, -0.8880131, 0.3960784, 1, 0, 1,
-0.5992138, 0.722138, -0.6475261, 0.3921569, 1, 0, 1,
-0.5985839, -0.1219298, -2.460419, 0.3843137, 1, 0, 1,
-0.5977842, 0.1627488, -2.330241, 0.3803922, 1, 0, 1,
-0.5967224, 1.74131, 1.102038, 0.372549, 1, 0, 1,
-0.5863395, -1.095917, -0.6045937, 0.3686275, 1, 0, 1,
-0.5829151, -1.495338, 0.3792165, 0.3607843, 1, 0, 1,
-0.5734914, -0.1042235, -2.845399, 0.3568628, 1, 0, 1,
-0.565067, 0.7021196, -0.8444801, 0.3490196, 1, 0, 1,
-0.5607947, -1.614726, -4.312863, 0.345098, 1, 0, 1,
-0.5602253, 0.9196008, 0.8341827, 0.3372549, 1, 0, 1,
-0.5596657, 0.4723539, -2.684006, 0.3333333, 1, 0, 1,
-0.5595209, -1.709145, -3.038135, 0.3254902, 1, 0, 1,
-0.5588679, 0.006553719, -1.842015, 0.3215686, 1, 0, 1,
-0.5578312, -0.3026806, -0.5799864, 0.3137255, 1, 0, 1,
-0.5518843, -0.9208977, -3.354258, 0.3098039, 1, 0, 1,
-0.5500062, 1.052198, -1.280828, 0.3019608, 1, 0, 1,
-0.5457137, -0.1034771, -2.184378, 0.2941177, 1, 0, 1,
-0.5438803, -0.4136102, -5.356929, 0.2901961, 1, 0, 1,
-0.5416644, 0.14463, -1.611557, 0.282353, 1, 0, 1,
-0.5399944, -0.1487161, -3.081581, 0.2784314, 1, 0, 1,
-0.5378228, 0.2634957, -0.926226, 0.2705882, 1, 0, 1,
-0.5377575, -0.9366606, -3.9138, 0.2666667, 1, 0, 1,
-0.5366722, 0.7650679, 0.5089228, 0.2588235, 1, 0, 1,
-0.5355768, 0.3375657, 0.2058212, 0.254902, 1, 0, 1,
-0.5322765, -0.6695074, -2.188167, 0.2470588, 1, 0, 1,
-0.5309419, -2.072747, -2.584966, 0.2431373, 1, 0, 1,
-0.5291942, -0.3729731, -1.368756, 0.2352941, 1, 0, 1,
-0.5233361, 2.035443, -1.03992, 0.2313726, 1, 0, 1,
-0.5219589, 0.3846257, -2.786469, 0.2235294, 1, 0, 1,
-0.5203487, -1.367393, -2.144457, 0.2196078, 1, 0, 1,
-0.5191182, -0.09473274, -1.979211, 0.2117647, 1, 0, 1,
-0.5160704, -0.4819183, -1.270744, 0.2078431, 1, 0, 1,
-0.5144623, 0.5410501, -2.186019, 0.2, 1, 0, 1,
-0.5075239, -0.8967733, -3.965107, 0.1921569, 1, 0, 1,
-0.5073866, -1.450065, -1.775519, 0.1882353, 1, 0, 1,
-0.5056041, 1.971471, -0.3184079, 0.1803922, 1, 0, 1,
-0.5046289, -0.008222478, -1.826431, 0.1764706, 1, 0, 1,
-0.4992215, -0.2513365, -3.72794, 0.1686275, 1, 0, 1,
-0.4973444, 0.003762522, -0.3621643, 0.1647059, 1, 0, 1,
-0.4893199, 1.248457, -0.131027, 0.1568628, 1, 0, 1,
-0.4865422, -0.3462915, -0.9050032, 0.1529412, 1, 0, 1,
-0.4808514, -0.3953584, -1.917107, 0.145098, 1, 0, 1,
-0.480629, -0.3014747, 0.6449491, 0.1411765, 1, 0, 1,
-0.4800909, -3.269578, -3.785678, 0.1333333, 1, 0, 1,
-0.4741758, 0.8877846, -0.1055458, 0.1294118, 1, 0, 1,
-0.4643382, -0.4400365, -1.901331, 0.1215686, 1, 0, 1,
-0.4569307, -2.033512, -2.520938, 0.1176471, 1, 0, 1,
-0.4538597, -0.3137745, -0.3630327, 0.1098039, 1, 0, 1,
-0.4533801, 0.1285692, -3.66738, 0.1058824, 1, 0, 1,
-0.4470922, 0.315373, 0.2649647, 0.09803922, 1, 0, 1,
-0.4435638, 0.6830107, 0.1715417, 0.09019608, 1, 0, 1,
-0.442724, 0.01669664, -2.165532, 0.08627451, 1, 0, 1,
-0.44197, -0.1440113, -2.121602, 0.07843138, 1, 0, 1,
-0.436651, -0.7826872, -3.545204, 0.07450981, 1, 0, 1,
-0.4354476, -1.635165, -2.538751, 0.06666667, 1, 0, 1,
-0.4352309, -0.3839852, -3.371647, 0.0627451, 1, 0, 1,
-0.4346353, -1.190982, -3.836415, 0.05490196, 1, 0, 1,
-0.4331643, 0.1562153, -0.8529348, 0.05098039, 1, 0, 1,
-0.4313555, 1.518492, -1.225265, 0.04313726, 1, 0, 1,
-0.4311565, 0.2242772, -1.726072, 0.03921569, 1, 0, 1,
-0.4310979, -0.03516781, -0.4726059, 0.03137255, 1, 0, 1,
-0.431028, 0.1357488, -0.1553386, 0.02745098, 1, 0, 1,
-0.4302304, 1.996176, 0.6816703, 0.01960784, 1, 0, 1,
-0.4299476, -0.355922, -3.380485, 0.01568628, 1, 0, 1,
-0.4240302, 0.2554568, -0.569269, 0.007843138, 1, 0, 1,
-0.4191069, 2.069457, -1.294113, 0.003921569, 1, 0, 1,
-0.4188591, -0.878992, -3.792701, 0, 1, 0.003921569, 1,
-0.416864, -0.3048328, -5.373725, 0, 1, 0.01176471, 1,
-0.4154752, -1.791566, -3.359689, 0, 1, 0.01568628, 1,
-0.4153413, -2.405866, -3.636888, 0, 1, 0.02352941, 1,
-0.4122504, -0.6689503, -2.924664, 0, 1, 0.02745098, 1,
-0.4112469, 0.7578161, -1.677962, 0, 1, 0.03529412, 1,
-0.4104441, 0.9003773, -0.2071898, 0, 1, 0.03921569, 1,
-0.4085464, -0.8328293, -4.042343, 0, 1, 0.04705882, 1,
-0.4032262, 0.995901, 0.2141412, 0, 1, 0.05098039, 1,
-0.4029978, 1.713395, -0.352571, 0, 1, 0.05882353, 1,
-0.4020604, 0.08879162, -1.09451, 0, 1, 0.0627451, 1,
-0.4011486, 0.6621314, -1.669949, 0, 1, 0.07058824, 1,
-0.3990577, -0.9146507, -3.979081, 0, 1, 0.07450981, 1,
-0.3968188, -1.103435, -0.8749543, 0, 1, 0.08235294, 1,
-0.3948841, 0.5837187, -1.217835, 0, 1, 0.08627451, 1,
-0.3942356, -0.5937534, -4.17273, 0, 1, 0.09411765, 1,
-0.3922582, -0.01060644, -1.788211, 0, 1, 0.1019608, 1,
-0.3916247, -0.5194918, -4.47834, 0, 1, 0.1058824, 1,
-0.3848664, -1.32482, -3.61779, 0, 1, 0.1137255, 1,
-0.3811516, 0.7399599, -0.5898356, 0, 1, 0.1176471, 1,
-0.380934, 0.5956099, -1.632358, 0, 1, 0.1254902, 1,
-0.3771195, 0.7401469, -1.309984, 0, 1, 0.1294118, 1,
-0.3728788, 0.6851253, 0.7253796, 0, 1, 0.1372549, 1,
-0.3721075, -0.4770696, -2.408256, 0, 1, 0.1411765, 1,
-0.3708213, -1.706465, -2.980108, 0, 1, 0.1490196, 1,
-0.3699147, -0.8148037, -1.788493, 0, 1, 0.1529412, 1,
-0.3621812, -0.6282855, -0.7696052, 0, 1, 0.1607843, 1,
-0.3618113, -0.4011932, -2.692749, 0, 1, 0.1647059, 1,
-0.3597374, 0.760681, -1.841194, 0, 1, 0.172549, 1,
-0.3591467, -0.3409099, -2.910159, 0, 1, 0.1764706, 1,
-0.3576238, -0.4877874, -3.967753, 0, 1, 0.1843137, 1,
-0.35359, 0.9102571, -1.253044, 0, 1, 0.1882353, 1,
-0.3523815, -0.4348654, -2.613313, 0, 1, 0.1960784, 1,
-0.3484763, -0.9858158, -1.98924, 0, 1, 0.2039216, 1,
-0.3476591, -1.744384, -1.967526, 0, 1, 0.2078431, 1,
-0.3462041, -1.065548, -5.234192, 0, 1, 0.2156863, 1,
-0.3456104, 0.7713538, -0.3466855, 0, 1, 0.2196078, 1,
-0.3418401, -1.71138, -3.09495, 0, 1, 0.227451, 1,
-0.3412887, -1.082697, -2.126586, 0, 1, 0.2313726, 1,
-0.3406248, 1.820828, 2.405208, 0, 1, 0.2392157, 1,
-0.3383849, -0.06533483, -0.545247, 0, 1, 0.2431373, 1,
-0.3329141, -1.808593, -3.610459, 0, 1, 0.2509804, 1,
-0.3300964, -0.6185256, -3.069116, 0, 1, 0.254902, 1,
-0.328675, 2.198881, -0.7890266, 0, 1, 0.2627451, 1,
-0.3186994, -0.2277359, -1.600479, 0, 1, 0.2666667, 1,
-0.3152365, 0.4589634, -0.7368808, 0, 1, 0.2745098, 1,
-0.31396, -0.6915991, -2.420191, 0, 1, 0.2784314, 1,
-0.307043, -0.5552849, -2.176163, 0, 1, 0.2862745, 1,
-0.2984576, -0.2096062, -2.181976, 0, 1, 0.2901961, 1,
-0.2978179, -1.079912, -3.38341, 0, 1, 0.2980392, 1,
-0.2950052, -0.2040597, -3.292347, 0, 1, 0.3058824, 1,
-0.2932017, 1.117596, 1.495651, 0, 1, 0.3098039, 1,
-0.2890129, -0.6839597, -5.190583, 0, 1, 0.3176471, 1,
-0.2876183, -1.286598, -2.515888, 0, 1, 0.3215686, 1,
-0.284595, -0.7532659, -3.451654, 0, 1, 0.3294118, 1,
-0.2825786, 1.098043, -0.0292907, 0, 1, 0.3333333, 1,
-0.281171, -0.1418836, -2.694392, 0, 1, 0.3411765, 1,
-0.2799024, -1.052627, -3.140736, 0, 1, 0.345098, 1,
-0.2761441, 0.5500138, -1.409694, 0, 1, 0.3529412, 1,
-0.2732201, 0.5013291, -1.718239, 0, 1, 0.3568628, 1,
-0.2724743, -0.5681288, -2.819608, 0, 1, 0.3647059, 1,
-0.2707375, -2.671864, -2.938349, 0, 1, 0.3686275, 1,
-0.2700854, -0.2835407, -0.9124337, 0, 1, 0.3764706, 1,
-0.2695588, -1.534855, -3.306277, 0, 1, 0.3803922, 1,
-0.2685454, 1.192744, 0.3670359, 0, 1, 0.3882353, 1,
-0.2653421, -0.6420554, -4.366121, 0, 1, 0.3921569, 1,
-0.2619969, -0.1695995, -3.212073, 0, 1, 0.4, 1,
-0.2560153, -0.6192042, -2.810434, 0, 1, 0.4078431, 1,
-0.2532658, 0.2123584, -1.053396, 0, 1, 0.4117647, 1,
-0.2515715, -0.9020203, -1.61678, 0, 1, 0.4196078, 1,
-0.249493, 1.307711, -0.2302718, 0, 1, 0.4235294, 1,
-0.2447955, -0.06078492, -1.447368, 0, 1, 0.4313726, 1,
-0.2446065, 0.4278054, 0.4739293, 0, 1, 0.4352941, 1,
-0.2367303, -1.100957, -4.643844, 0, 1, 0.4431373, 1,
-0.2352471, -0.4316247, -3.681821, 0, 1, 0.4470588, 1,
-0.2315333, 0.4040887, -1.209179, 0, 1, 0.454902, 1,
-0.2302948, -1.687307, -1.568887, 0, 1, 0.4588235, 1,
-0.2160069, -0.6954978, -2.832133, 0, 1, 0.4666667, 1,
-0.2157662, -1.884341, -2.761371, 0, 1, 0.4705882, 1,
-0.2124795, -0.02521719, -0.9283547, 0, 1, 0.4784314, 1,
-0.210239, -0.8079515, -3.458202, 0, 1, 0.4823529, 1,
-0.2084819, -0.0541726, -1.445024, 0, 1, 0.4901961, 1,
-0.2074836, -0.8722357, -1.734444, 0, 1, 0.4941176, 1,
-0.2052526, 0.03169074, -1.735672, 0, 1, 0.5019608, 1,
-0.2036688, 0.3699684, -1.295662, 0, 1, 0.509804, 1,
-0.2017988, -0.230973, -2.42236, 0, 1, 0.5137255, 1,
-0.2009075, 0.427888, -0.3354531, 0, 1, 0.5215687, 1,
-0.197118, 1.189745, -1.165171, 0, 1, 0.5254902, 1,
-0.1939513, 0.5272709, 1.337116, 0, 1, 0.5333334, 1,
-0.190692, -1.274209, -3.157711, 0, 1, 0.5372549, 1,
-0.1906263, -1.235844, -2.827591, 0, 1, 0.5450981, 1,
-0.18946, 1.100715, -0.8320494, 0, 1, 0.5490196, 1,
-0.1892495, 0.5929745, -1.76442, 0, 1, 0.5568628, 1,
-0.1869823, 0.6746024, 1.341912, 0, 1, 0.5607843, 1,
-0.18626, 0.017409, -1.585992, 0, 1, 0.5686275, 1,
-0.1862321, -0.7199425, -2.394879, 0, 1, 0.572549, 1,
-0.1854686, -0.1007451, -4.191687, 0, 1, 0.5803922, 1,
-0.1828586, 1.151394, -0.3209567, 0, 1, 0.5843138, 1,
-0.1825515, -1.253163, -1.677903, 0, 1, 0.5921569, 1,
-0.1823541, -2.377302, -2.883926, 0, 1, 0.5960785, 1,
-0.1746148, -0.5559071, -3.279335, 0, 1, 0.6039216, 1,
-0.174567, 0.09426631, -3.278842, 0, 1, 0.6117647, 1,
-0.1712892, 0.493379, -0.6931584, 0, 1, 0.6156863, 1,
-0.1667608, -0.1894634, -0.929428, 0, 1, 0.6235294, 1,
-0.1664672, -0.9682183, -2.662143, 0, 1, 0.627451, 1,
-0.1647759, -1.48673, -2.511141, 0, 1, 0.6352941, 1,
-0.1640682, -0.6028608, -3.921957, 0, 1, 0.6392157, 1,
-0.160829, 0.001967065, -2.115447, 0, 1, 0.6470588, 1,
-0.1605415, -1.181649, -3.639164, 0, 1, 0.6509804, 1,
-0.156412, -0.2781786, -3.14119, 0, 1, 0.6588235, 1,
-0.1551143, -0.6737224, -2.601448, 0, 1, 0.6627451, 1,
-0.1512924, 0.3494183, 0.5650665, 0, 1, 0.6705883, 1,
-0.147551, -0.4508158, -2.569483, 0, 1, 0.6745098, 1,
-0.1416638, -0.6648483, -2.016579, 0, 1, 0.682353, 1,
-0.1390607, -0.379695, -2.391331, 0, 1, 0.6862745, 1,
-0.1377937, -0.4432091, -1.595092, 0, 1, 0.6941177, 1,
-0.1285928, 1.319788, 1.51175, 0, 1, 0.7019608, 1,
-0.1220895, -1.592661, -4.18573, 0, 1, 0.7058824, 1,
-0.1200347, -2.074437, -4.521164, 0, 1, 0.7137255, 1,
-0.1176966, 0.8796893, -1.408022, 0, 1, 0.7176471, 1,
-0.114173, 0.5361196, -0.6103328, 0, 1, 0.7254902, 1,
-0.1125177, 0.3592423, 0.9356764, 0, 1, 0.7294118, 1,
-0.109096, 0.9269782, -2.526379, 0, 1, 0.7372549, 1,
-0.1063598, 1.236823, 0.6779663, 0, 1, 0.7411765, 1,
-0.1035012, 0.2561443, 0.3676927, 0, 1, 0.7490196, 1,
-0.1019337, 0.8398534, -0.3075515, 0, 1, 0.7529412, 1,
-0.09664192, 0.7603682, -0.782962, 0, 1, 0.7607843, 1,
-0.09617609, -0.1930074, -2.879268, 0, 1, 0.7647059, 1,
-0.09375231, -1.235233, -3.167649, 0, 1, 0.772549, 1,
-0.09233439, -0.6473515, -3.323395, 0, 1, 0.7764706, 1,
-0.0920188, -0.5270168, -1.906333, 0, 1, 0.7843137, 1,
-0.09125023, 0.8119015, -0.7965101, 0, 1, 0.7882353, 1,
-0.08895529, -0.0243024, -2.34628, 0, 1, 0.7960784, 1,
-0.08470772, 0.6889763, -1.069724, 0, 1, 0.8039216, 1,
-0.08452854, -0.7446072, -3.802286, 0, 1, 0.8078431, 1,
-0.07858948, 0.6619182, 1.055524, 0, 1, 0.8156863, 1,
-0.07734321, -1.103353, -2.845613, 0, 1, 0.8196079, 1,
-0.07643654, 1.709078, 0.2065376, 0, 1, 0.827451, 1,
-0.07620145, 0.4363716, 0.171255, 0, 1, 0.8313726, 1,
-0.07564393, -2.015505, -1.865431, 0, 1, 0.8392157, 1,
-0.07484086, -0.5975608, -2.87178, 0, 1, 0.8431373, 1,
-0.07326505, -0.2990722, -2.767305, 0, 1, 0.8509804, 1,
-0.07189772, 1.154969, 0.3805368, 0, 1, 0.854902, 1,
-0.06808799, 1.053257, -0.5087853, 0, 1, 0.8627451, 1,
-0.06157987, -0.4649926, -2.619976, 0, 1, 0.8666667, 1,
-0.05614166, 1.262333, -1.804533, 0, 1, 0.8745098, 1,
-0.05439211, 0.02502905, -0.7180319, 0, 1, 0.8784314, 1,
-0.05291578, 0.5934414, 0.3956528, 0, 1, 0.8862745, 1,
-0.05266294, 0.7389914, -0.2232233, 0, 1, 0.8901961, 1,
-0.04766884, -0.2187294, -4.056427, 0, 1, 0.8980392, 1,
-0.047538, 0.4234763, -0.1576785, 0, 1, 0.9058824, 1,
-0.04551823, 1.136791, 1.326772, 0, 1, 0.9098039, 1,
-0.04264697, 0.04471047, -1.901324, 0, 1, 0.9176471, 1,
-0.03710881, 0.211533, 0.6398178, 0, 1, 0.9215686, 1,
-0.03203158, -0.3310428, -2.493312, 0, 1, 0.9294118, 1,
-0.02841055, 0.7976905, 1.69692, 0, 1, 0.9333333, 1,
-0.0268914, -1.704116, -3.904526, 0, 1, 0.9411765, 1,
-0.0193873, 2.431591, -0.4747328, 0, 1, 0.945098, 1,
-0.01589862, -0.8717102, -2.578623, 0, 1, 0.9529412, 1,
-0.01525429, -0.7251307, -3.260931, 0, 1, 0.9568627, 1,
-0.01110708, -2.22773, -2.773404, 0, 1, 0.9647059, 1,
-0.008934662, -1.308865, -1.883704, 0, 1, 0.9686275, 1,
-0.007259183, 1.679428, -0.5113229, 0, 1, 0.9764706, 1,
-0.003817796, 0.2911731, -0.6248575, 0, 1, 0.9803922, 1,
-0.002920576, 0.1538615, 0.7059299, 0, 1, 0.9882353, 1,
-0.0009651359, -1.700327, -1.921757, 0, 1, 0.9921569, 1,
-0.000622361, 1.266825, -0.1605652, 0, 1, 1, 1,
0.0008333783, 0.7011721, -2.382852, 0, 0.9921569, 1, 1,
0.003619618, 0.4568555, 1.008933, 0, 0.9882353, 1, 1,
0.004953271, -0.5427612, 3.589682, 0, 0.9803922, 1, 1,
0.01376354, -2.143463, 2.641016, 0, 0.9764706, 1, 1,
0.01617314, 0.111589, 1.537782, 0, 0.9686275, 1, 1,
0.02012224, 0.4369118, 0.2757053, 0, 0.9647059, 1, 1,
0.02335214, 1.146466, -0.1578631, 0, 0.9568627, 1, 1,
0.02513299, -0.3990618, 3.902573, 0, 0.9529412, 1, 1,
0.02710016, -0.5824429, 4.535782, 0, 0.945098, 1, 1,
0.0277372, -0.2687994, 2.59978, 0, 0.9411765, 1, 1,
0.02773945, -0.09330661, 4.143141, 0, 0.9333333, 1, 1,
0.0287744, -1.759101, 3.687452, 0, 0.9294118, 1, 1,
0.03133292, -0.4814794, 2.374882, 0, 0.9215686, 1, 1,
0.03389886, -0.2796347, 1.699461, 0, 0.9176471, 1, 1,
0.03484946, 1.428266, -0.8093451, 0, 0.9098039, 1, 1,
0.03853564, -0.7824242, 3.246868, 0, 0.9058824, 1, 1,
0.03971488, -0.00871776, -0.06961732, 0, 0.8980392, 1, 1,
0.04166553, 0.6235117, -0.8296729, 0, 0.8901961, 1, 1,
0.04497027, 0.3995572, -0.4262711, 0, 0.8862745, 1, 1,
0.04558433, 0.4776273, 0.01535877, 0, 0.8784314, 1, 1,
0.04755862, 0.5793794, 0.3844896, 0, 0.8745098, 1, 1,
0.04908435, -0.1600781, 3.778364, 0, 0.8666667, 1, 1,
0.04977611, 0.2074241, 0.5874068, 0, 0.8627451, 1, 1,
0.0508626, -1.201515, 2.449178, 0, 0.854902, 1, 1,
0.05197334, 0.1546609, -0.01397686, 0, 0.8509804, 1, 1,
0.05801049, 0.6851624, 1.19266, 0, 0.8431373, 1, 1,
0.06029255, -1.546477, 3.063128, 0, 0.8392157, 1, 1,
0.07271908, 0.8547528, -0.3094381, 0, 0.8313726, 1, 1,
0.07580156, 2.035501, 0.1165868, 0, 0.827451, 1, 1,
0.081423, 0.6922618, -1.288671, 0, 0.8196079, 1, 1,
0.08210845, 0.6608631, -0.3583734, 0, 0.8156863, 1, 1,
0.08296433, 0.6466849, -0.1377605, 0, 0.8078431, 1, 1,
0.08448694, 1.189788, -1.474775, 0, 0.8039216, 1, 1,
0.08534795, -0.1359611, 3.12759, 0, 0.7960784, 1, 1,
0.09628107, 1.109845, 1.016447, 0, 0.7882353, 1, 1,
0.09827976, 1.107109, -3.020457, 0, 0.7843137, 1, 1,
0.09851494, -1.00027, 3.103646, 0, 0.7764706, 1, 1,
0.1000657, 1.38609, -0.6945348, 0, 0.772549, 1, 1,
0.100549, 0.9754081, -0.2346967, 0, 0.7647059, 1, 1,
0.1123565, 0.2522029, -0.4191595, 0, 0.7607843, 1, 1,
0.1252964, -0.471095, 1.88417, 0, 0.7529412, 1, 1,
0.1283159, -0.1199577, 1.603194, 0, 0.7490196, 1, 1,
0.1290084, -0.1059086, 2.350394, 0, 0.7411765, 1, 1,
0.1317966, -0.7626113, 2.981447, 0, 0.7372549, 1, 1,
0.1325091, -1.810317, 2.452123, 0, 0.7294118, 1, 1,
0.133139, -0.7820155, 2.706672, 0, 0.7254902, 1, 1,
0.1346707, 0.632338, -1.222062, 0, 0.7176471, 1, 1,
0.1370942, -2.046276, 2.602422, 0, 0.7137255, 1, 1,
0.1413272, -1.094173, 3.718634, 0, 0.7058824, 1, 1,
0.142863, 1.806716, -0.6996521, 0, 0.6980392, 1, 1,
0.1432389, 0.8684744, 2.359134, 0, 0.6941177, 1, 1,
0.1435238, 0.6029245, -0.7350713, 0, 0.6862745, 1, 1,
0.1450199, 0.3632808, -0.3549991, 0, 0.682353, 1, 1,
0.1456182, 1.674901, -1.372689, 0, 0.6745098, 1, 1,
0.1457238, -1.313677, 5.730484, 0, 0.6705883, 1, 1,
0.146235, -1.364751, 1.817817, 0, 0.6627451, 1, 1,
0.1477532, -0.02098581, 1.694331, 0, 0.6588235, 1, 1,
0.1503084, -1.672284, 2.713312, 0, 0.6509804, 1, 1,
0.1556653, 0.1993823, 0.360441, 0, 0.6470588, 1, 1,
0.1560033, 0.2965611, 0.779276, 0, 0.6392157, 1, 1,
0.1564538, 0.5095979, -2.522541, 0, 0.6352941, 1, 1,
0.1630586, 1.205685, 0.4016493, 0, 0.627451, 1, 1,
0.1745283, 0.842414, 1.802423, 0, 0.6235294, 1, 1,
0.1761798, -2.068468, 1.350495, 0, 0.6156863, 1, 1,
0.1762578, 2.036825, 2.47011, 0, 0.6117647, 1, 1,
0.180205, 0.5392768, 0.006746694, 0, 0.6039216, 1, 1,
0.1822089, -0.6663259, 4.225899, 0, 0.5960785, 1, 1,
0.1825292, 1.744379, -1.337488, 0, 0.5921569, 1, 1,
0.1839357, 0.06006583, 2.318612, 0, 0.5843138, 1, 1,
0.1852186, -1.792183, 1.223312, 0, 0.5803922, 1, 1,
0.185578, -0.218481, 2.16883, 0, 0.572549, 1, 1,
0.1877259, 0.09441682, -0.4430588, 0, 0.5686275, 1, 1,
0.1917062, -0.08161274, 1.659079, 0, 0.5607843, 1, 1,
0.1944263, -0.7575395, 2.734315, 0, 0.5568628, 1, 1,
0.1951638, -0.4634364, 3.004517, 0, 0.5490196, 1, 1,
0.2034492, 0.7634867, -0.06302809, 0, 0.5450981, 1, 1,
0.2113957, -1.198526, 4.225583, 0, 0.5372549, 1, 1,
0.2126437, -0.1850388, 3.035105, 0, 0.5333334, 1, 1,
0.2134277, -0.1786439, 2.505441, 0, 0.5254902, 1, 1,
0.214693, 0.3206516, 1.175099, 0, 0.5215687, 1, 1,
0.2180564, 1.209186, 0.2508391, 0, 0.5137255, 1, 1,
0.2220265, 1.313302, -0.08954462, 0, 0.509804, 1, 1,
0.2257216, 1.429668, -0.4512964, 0, 0.5019608, 1, 1,
0.2263243, -1.061632, 3.962523, 0, 0.4941176, 1, 1,
0.2298647, 1.205231, -0.09053248, 0, 0.4901961, 1, 1,
0.2321149, 0.7919964, 0.9914554, 0, 0.4823529, 1, 1,
0.2324003, 0.1664787, 1.237852, 0, 0.4784314, 1, 1,
0.2328518, -0.6631483, 3.447564, 0, 0.4705882, 1, 1,
0.2359502, -0.05816283, 2.997431, 0, 0.4666667, 1, 1,
0.2416451, -0.4927833, 3.376651, 0, 0.4588235, 1, 1,
0.242449, 1.638768, 0.005093454, 0, 0.454902, 1, 1,
0.2470896, 1.022306, -0.380729, 0, 0.4470588, 1, 1,
0.2482622, -0.7071031, 1.851488, 0, 0.4431373, 1, 1,
0.250267, -1.577363, 1.594013, 0, 0.4352941, 1, 1,
0.2612407, -0.4859666, 2.591702, 0, 0.4313726, 1, 1,
0.2616256, -0.5625027, 2.846315, 0, 0.4235294, 1, 1,
0.2627618, -0.02289294, -0.5426462, 0, 0.4196078, 1, 1,
0.2639391, 0.2860583, 0.3920675, 0, 0.4117647, 1, 1,
0.265913, 0.5018696, 1.489769, 0, 0.4078431, 1, 1,
0.2699931, -1.128577, 4.259416, 0, 0.4, 1, 1,
0.2721497, 1.206436, 1.615838, 0, 0.3921569, 1, 1,
0.2725278, -0.8855864, 4.380582, 0, 0.3882353, 1, 1,
0.2752722, -0.2843429, 0.8039128, 0, 0.3803922, 1, 1,
0.2795971, -2.268643, 3.181183, 0, 0.3764706, 1, 1,
0.2801953, -1.548798, 2.306062, 0, 0.3686275, 1, 1,
0.2806471, -0.4412237, 3.050745, 0, 0.3647059, 1, 1,
0.288968, -1.517852, 2.528168, 0, 0.3568628, 1, 1,
0.2904294, -0.184053, 2.244669, 0, 0.3529412, 1, 1,
0.2970041, -0.4203958, 1.793995, 0, 0.345098, 1, 1,
0.3017571, 1.025627, 0.6728812, 0, 0.3411765, 1, 1,
0.3027738, 2.017663, -0.2133012, 0, 0.3333333, 1, 1,
0.3052225, -2.07691, 3.556055, 0, 0.3294118, 1, 1,
0.3097833, -0.9509087, 0.7366123, 0, 0.3215686, 1, 1,
0.3134142, 0.226749, 0.1679405, 0, 0.3176471, 1, 1,
0.3134753, 1.046465, -0.846911, 0, 0.3098039, 1, 1,
0.3188707, -0.01556686, 3.743727, 0, 0.3058824, 1, 1,
0.3211345, 0.881749, 0.9115726, 0, 0.2980392, 1, 1,
0.3239265, -0.7743114, 4.105952, 0, 0.2901961, 1, 1,
0.327286, 0.3087452, 0.5286586, 0, 0.2862745, 1, 1,
0.3276494, -0.3234595, 0.4854649, 0, 0.2784314, 1, 1,
0.3318835, 0.4644147, -0.8100982, 0, 0.2745098, 1, 1,
0.3331499, 2.193249, -0.7551749, 0, 0.2666667, 1, 1,
0.3350731, 0.6961764, 1.254207, 0, 0.2627451, 1, 1,
0.3385971, 0.5149026, 2.268505, 0, 0.254902, 1, 1,
0.3391077, 0.06075456, 2.297267, 0, 0.2509804, 1, 1,
0.3472687, -0.5431338, 2.859154, 0, 0.2431373, 1, 1,
0.3579951, 0.4443852, 1.854775, 0, 0.2392157, 1, 1,
0.3599624, -0.5491128, 1.743398, 0, 0.2313726, 1, 1,
0.3692275, -0.8925525, 1.427226, 0, 0.227451, 1, 1,
0.3758209, 1.475206, -1.209129, 0, 0.2196078, 1, 1,
0.3760572, 1.586432, 1.802896, 0, 0.2156863, 1, 1,
0.3765315, -0.2259345, 2.271837, 0, 0.2078431, 1, 1,
0.3827414, 0.2686189, 2.933867, 0, 0.2039216, 1, 1,
0.3881457, -1.614405, 2.184925, 0, 0.1960784, 1, 1,
0.3881603, 1.837815, 2.822083, 0, 0.1882353, 1, 1,
0.3891703, -1.362201, 3.873318, 0, 0.1843137, 1, 1,
0.3924538, 1.1494, -0.2340074, 0, 0.1764706, 1, 1,
0.3994813, 2.631258, 1.510165, 0, 0.172549, 1, 1,
0.4012176, 0.8829063, -0.9741954, 0, 0.1647059, 1, 1,
0.4027095, 0.7309145, 1.022147, 0, 0.1607843, 1, 1,
0.4029133, 0.365991, 0.9906889, 0, 0.1529412, 1, 1,
0.4040708, -0.402318, 1.490216, 0, 0.1490196, 1, 1,
0.4126172, -1.627653, 2.778895, 0, 0.1411765, 1, 1,
0.4147139, -0.6891669, 1.376974, 0, 0.1372549, 1, 1,
0.41908, -0.5044279, 2.764745, 0, 0.1294118, 1, 1,
0.4195348, 0.5526066, 0.3906575, 0, 0.1254902, 1, 1,
0.4204895, -2.143828, 2.539595, 0, 0.1176471, 1, 1,
0.4236903, -0.8190987, 0.9431649, 0, 0.1137255, 1, 1,
0.4254371, 0.6483021, -0.2067089, 0, 0.1058824, 1, 1,
0.4303481, 1.326344, -0.2816432, 0, 0.09803922, 1, 1,
0.4317599, -0.1775739, 1.980096, 0, 0.09411765, 1, 1,
0.4325657, -0.07538596, 2.091324, 0, 0.08627451, 1, 1,
0.433877, 0.4421297, 0.3989883, 0, 0.08235294, 1, 1,
0.4378768, -1.192976, 1.741708, 0, 0.07450981, 1, 1,
0.4397584, 0.4025794, 2.859059, 0, 0.07058824, 1, 1,
0.4408485, -0.007354552, 2.245068, 0, 0.0627451, 1, 1,
0.4427947, -0.7456086, 1.988325, 0, 0.05882353, 1, 1,
0.447021, -1.264055, 3.34202, 0, 0.05098039, 1, 1,
0.4481286, -0.4830557, 1.181535, 0, 0.04705882, 1, 1,
0.4490765, -1.202041, 3.990002, 0, 0.03921569, 1, 1,
0.4524164, -0.08162114, 2.681676, 0, 0.03529412, 1, 1,
0.4543599, -0.5641435, 4.24963, 0, 0.02745098, 1, 1,
0.4545161, -0.6402611, 2.086484, 0, 0.02352941, 1, 1,
0.4634672, 1.481337, 0.7345232, 0, 0.01568628, 1, 1,
0.4638904, -0.7052853, 1.71843, 0, 0.01176471, 1, 1,
0.4639035, 0.5286215, 0.300472, 0, 0.003921569, 1, 1,
0.4681356, -0.6024569, 1.693486, 0.003921569, 0, 1, 1,
0.469041, 0.1063138, 2.728975, 0.007843138, 0, 1, 1,
0.4768103, -0.2424827, 2.79261, 0.01568628, 0, 1, 1,
0.4839494, 0.2048517, 1.259791, 0.01960784, 0, 1, 1,
0.4885685, -0.4287427, 1.523235, 0.02745098, 0, 1, 1,
0.4908927, -0.8555324, 0.9833594, 0.03137255, 0, 1, 1,
0.4928293, 0.6548299, -0.4066764, 0.03921569, 0, 1, 1,
0.495803, -0.6722017, 2.269087, 0.04313726, 0, 1, 1,
0.4969972, 1.085707, 0.9087644, 0.05098039, 0, 1, 1,
0.4984959, 0.830809, 0.8261868, 0.05490196, 0, 1, 1,
0.5066644, -0.1437571, 2.028478, 0.0627451, 0, 1, 1,
0.5083314, 0.9684423, 0.8646636, 0.06666667, 0, 1, 1,
0.5091139, -0.4523219, 1.432141, 0.07450981, 0, 1, 1,
0.5091297, -2.03401, 1.592314, 0.07843138, 0, 1, 1,
0.5106669, 0.8344852, -0.3275035, 0.08627451, 0, 1, 1,
0.5238304, -0.681092, 1.684697, 0.09019608, 0, 1, 1,
0.5249271, -0.08748359, 1.611761, 0.09803922, 0, 1, 1,
0.5257379, -0.3879794, 1.057399, 0.1058824, 0, 1, 1,
0.5262584, -0.04678554, 1.630945, 0.1098039, 0, 1, 1,
0.5283003, -0.6803957, 1.694201, 0.1176471, 0, 1, 1,
0.5287039, -1.064448, 1.837812, 0.1215686, 0, 1, 1,
0.5290471, -1.441352, 2.263299, 0.1294118, 0, 1, 1,
0.5300068, 0.2576815, -0.01129454, 0.1333333, 0, 1, 1,
0.533427, -0.1910379, 2.446615, 0.1411765, 0, 1, 1,
0.5390745, 0.1269849, 1.241601, 0.145098, 0, 1, 1,
0.5435224, 0.5960954, -0.7979265, 0.1529412, 0, 1, 1,
0.5450351, 0.7395294, 0.8234659, 0.1568628, 0, 1, 1,
0.5512356, 0.2050685, -0.9312944, 0.1647059, 0, 1, 1,
0.5514544, 0.7606956, 0.7762089, 0.1686275, 0, 1, 1,
0.5553361, -1.28466, 2.811169, 0.1764706, 0, 1, 1,
0.556107, -1.473788, 4.452652, 0.1803922, 0, 1, 1,
0.5601419, -0.8584272, 1.620837, 0.1882353, 0, 1, 1,
0.5616177, -1.678237, 3.677666, 0.1921569, 0, 1, 1,
0.562129, -0.2609781, 1.821396, 0.2, 0, 1, 1,
0.5622618, -2.274265, 2.848181, 0.2078431, 0, 1, 1,
0.5681327, 1.951764, -0.9320349, 0.2117647, 0, 1, 1,
0.5684932, 0.7214352, 0.2149152, 0.2196078, 0, 1, 1,
0.5748957, -0.1063843, 3.377347, 0.2235294, 0, 1, 1,
0.578034, 0.950424, -0.6164021, 0.2313726, 0, 1, 1,
0.5795202, 0.7611443, -0.6644465, 0.2352941, 0, 1, 1,
0.5819366, -0.6623921, 4.267468, 0.2431373, 0, 1, 1,
0.5875176, -0.3488363, 1.047214, 0.2470588, 0, 1, 1,
0.5942544, -0.7470462, 0.8969203, 0.254902, 0, 1, 1,
0.5959833, -0.5159487, 1.514867, 0.2588235, 0, 1, 1,
0.6003959, -0.08631199, 1.34007, 0.2666667, 0, 1, 1,
0.6013695, 1.193016, -0.9777768, 0.2705882, 0, 1, 1,
0.6064822, 1.128556, 0.3079273, 0.2784314, 0, 1, 1,
0.609485, -0.440321, 2.623142, 0.282353, 0, 1, 1,
0.6129693, -0.0245997, 1.782508, 0.2901961, 0, 1, 1,
0.61434, 0.9134798, 0.8172895, 0.2941177, 0, 1, 1,
0.6145982, 0.9539475, 0.578464, 0.3019608, 0, 1, 1,
0.6149362, -0.5268134, 1.233946, 0.3098039, 0, 1, 1,
0.6168979, 1.070597, 2.125022, 0.3137255, 0, 1, 1,
0.6347615, -1.346449, 2.573959, 0.3215686, 0, 1, 1,
0.6403269, 0.7956358, 0.7879236, 0.3254902, 0, 1, 1,
0.6416311, -0.3476234, 2.199897, 0.3333333, 0, 1, 1,
0.6446258, 1.624725, -0.5133074, 0.3372549, 0, 1, 1,
0.6451218, -1.958046, 0.315748, 0.345098, 0, 1, 1,
0.648895, 0.317838, 0.09511841, 0.3490196, 0, 1, 1,
0.6491264, -1.283964, 2.988209, 0.3568628, 0, 1, 1,
0.6492046, 2.053327, 0.8300566, 0.3607843, 0, 1, 1,
0.6506314, -2.17753, 3.141212, 0.3686275, 0, 1, 1,
0.6544769, 0.5173482, 0.8592951, 0.372549, 0, 1, 1,
0.6589285, 0.3076576, -1.499315, 0.3803922, 0, 1, 1,
0.6605269, -0.3866264, 3.543629, 0.3843137, 0, 1, 1,
0.6619868, 1.289934, 1.831811, 0.3921569, 0, 1, 1,
0.668551, 0.8520495, 1.687288, 0.3960784, 0, 1, 1,
0.6700558, 0.7593164, -0.6120534, 0.4039216, 0, 1, 1,
0.674724, 1.443877, 0.8253325, 0.4117647, 0, 1, 1,
0.6767218, 0.03210951, 1.830024, 0.4156863, 0, 1, 1,
0.6773255, 0.0003246347, -0.5156825, 0.4235294, 0, 1, 1,
0.679158, -0.3144547, 3.502164, 0.427451, 0, 1, 1,
0.6849709, -2.120706, 3.9582, 0.4352941, 0, 1, 1,
0.6854067, 0.2077843, 2.235664, 0.4392157, 0, 1, 1,
0.6889209, 1.780036, -0.3740275, 0.4470588, 0, 1, 1,
0.6905824, -0.6651028, 0.7741778, 0.4509804, 0, 1, 1,
0.6925778, 0.3450161, -0.0821942, 0.4588235, 0, 1, 1,
0.6926044, -0.4667394, 2.114104, 0.4627451, 0, 1, 1,
0.6932394, -0.9477547, 1.982698, 0.4705882, 0, 1, 1,
0.6979182, 1.197298, -0.170012, 0.4745098, 0, 1, 1,
0.6981441, 1.28222, 0.3020067, 0.4823529, 0, 1, 1,
0.7036694, -0.9683642, 0.9608558, 0.4862745, 0, 1, 1,
0.7152294, -0.479391, 2.243665, 0.4941176, 0, 1, 1,
0.7161181, 0.8423852, -2.416103, 0.5019608, 0, 1, 1,
0.7167607, -0.2688013, 1.314155, 0.5058824, 0, 1, 1,
0.7213689, 0.4678572, 1.529565, 0.5137255, 0, 1, 1,
0.7224196, -0.4842442, 2.365927, 0.5176471, 0, 1, 1,
0.7301761, -0.02510773, 1.17805, 0.5254902, 0, 1, 1,
0.7305606, -0.1917852, 2.682517, 0.5294118, 0, 1, 1,
0.7307078, -0.1143645, 1.935209, 0.5372549, 0, 1, 1,
0.7315136, -0.9322574, 1.389139, 0.5411765, 0, 1, 1,
0.7367138, -0.06478024, 2.031227, 0.5490196, 0, 1, 1,
0.737863, 0.1234286, 2.056996, 0.5529412, 0, 1, 1,
0.7384006, -1.235806, 2.921485, 0.5607843, 0, 1, 1,
0.7403837, -1.0429, 2.757313, 0.5647059, 0, 1, 1,
0.7409879, 0.2881635, 0.8302323, 0.572549, 0, 1, 1,
0.7413372, -1.159249, 1.234312, 0.5764706, 0, 1, 1,
0.7416611, -0.9852865, 3.187363, 0.5843138, 0, 1, 1,
0.7480065, -1.334502, 1.568267, 0.5882353, 0, 1, 1,
0.7578347, 0.003963633, 1.18262, 0.5960785, 0, 1, 1,
0.7652219, -0.2505689, 1.988499, 0.6039216, 0, 1, 1,
0.7677981, 0.9967734, 2.318094, 0.6078432, 0, 1, 1,
0.7703604, 0.0601548, -0.1727858, 0.6156863, 0, 1, 1,
0.7772036, 1.843563, -0.2389635, 0.6196079, 0, 1, 1,
0.7781861, -0.6182815, 2.531904, 0.627451, 0, 1, 1,
0.7797533, -0.5971578, 1.827302, 0.6313726, 0, 1, 1,
0.7842947, -0.2246755, 0.382952, 0.6392157, 0, 1, 1,
0.7848584, 0.3108987, 2.044435, 0.6431373, 0, 1, 1,
0.7922613, -0.2632369, 2.562004, 0.6509804, 0, 1, 1,
0.7924154, 1.580002, 2.001433, 0.654902, 0, 1, 1,
0.7955775, 0.2920562, 0.3027193, 0.6627451, 0, 1, 1,
0.7997098, 1.983149, -0.5010156, 0.6666667, 0, 1, 1,
0.8050839, 0.1734351, 2.001911, 0.6745098, 0, 1, 1,
0.8092154, 1.466178, 0.8815445, 0.6784314, 0, 1, 1,
0.8094366, 0.3271086, 2.501581, 0.6862745, 0, 1, 1,
0.8117158, 1.158003, -0.3590141, 0.6901961, 0, 1, 1,
0.8126594, 0.1736166, 1.992879, 0.6980392, 0, 1, 1,
0.8160267, 0.9546473, -0.1298126, 0.7058824, 0, 1, 1,
0.8183994, 1.735793, 1.813609, 0.7098039, 0, 1, 1,
0.8197699, -1.289089, 0.5707092, 0.7176471, 0, 1, 1,
0.828289, 0.9106266, 0.1554953, 0.7215686, 0, 1, 1,
0.8288587, 0.0699134, 1.90153, 0.7294118, 0, 1, 1,
0.8297796, -1.301646, 2.525469, 0.7333333, 0, 1, 1,
0.8318259, 0.9471394, 1.088879, 0.7411765, 0, 1, 1,
0.8341255, -0.7995571, 2.111429, 0.7450981, 0, 1, 1,
0.8353022, -2.208627, 0.4757839, 0.7529412, 0, 1, 1,
0.8371097, 0.2022259, 0.7863243, 0.7568628, 0, 1, 1,
0.8399197, 0.804486, 1.119846, 0.7647059, 0, 1, 1,
0.8448004, 0.06670211, 0.5675045, 0.7686275, 0, 1, 1,
0.852646, 1.209345, 1.75559, 0.7764706, 0, 1, 1,
0.8557849, 0.3586781, 0.7480937, 0.7803922, 0, 1, 1,
0.8565594, -0.2900827, 1.900549, 0.7882353, 0, 1, 1,
0.8571346, -2.533856, 2.517946, 0.7921569, 0, 1, 1,
0.8582945, -0.878274, 2.283535, 0.8, 0, 1, 1,
0.8616468, -0.1290632, 2.136618, 0.8078431, 0, 1, 1,
0.8629492, -0.2131356, 1.240455, 0.8117647, 0, 1, 1,
0.8633916, 0.3899779, 1.150569, 0.8196079, 0, 1, 1,
0.8669714, 0.7768097, 0.5952697, 0.8235294, 0, 1, 1,
0.8733348, -3.522112, 2.985921, 0.8313726, 0, 1, 1,
0.8803662, 1.282567, -0.6268855, 0.8352941, 0, 1, 1,
0.8864182, -1.134239, 1.255905, 0.8431373, 0, 1, 1,
0.889459, -0.1637737, 2.355622, 0.8470588, 0, 1, 1,
0.8981047, -0.223726, 0.7368274, 0.854902, 0, 1, 1,
0.8995029, 1.259009, 0.7685015, 0.8588235, 0, 1, 1,
0.9144245, -1.021021, 1.945415, 0.8666667, 0, 1, 1,
0.9158385, 0.1302876, 1.6074, 0.8705882, 0, 1, 1,
0.9186621, 0.2116386, 2.048294, 0.8784314, 0, 1, 1,
0.9204376, 1.662409, 0.5983409, 0.8823529, 0, 1, 1,
0.9208109, -0.493583, 1.159468, 0.8901961, 0, 1, 1,
0.9221529, -1.124058, 3.215766, 0.8941177, 0, 1, 1,
0.9257579, -0.859121, 1.602106, 0.9019608, 0, 1, 1,
0.9268889, -0.4334191, 0.8583695, 0.9098039, 0, 1, 1,
0.9271948, 1.717645, -2.01345, 0.9137255, 0, 1, 1,
0.9278036, 1.716248, -0.6032481, 0.9215686, 0, 1, 1,
0.9303262, -0.1796758, 0.3276079, 0.9254902, 0, 1, 1,
0.9312413, -0.5055279, 2.556829, 0.9333333, 0, 1, 1,
0.9334118, 0.4730811, 1.986417, 0.9372549, 0, 1, 1,
0.9353685, -0.1295019, 1.315532, 0.945098, 0, 1, 1,
0.9375118, -0.1770047, 3.161973, 0.9490196, 0, 1, 1,
0.9392126, 0.4493767, -0.5331627, 0.9568627, 0, 1, 1,
0.9401851, 1.291517, 0.975911, 0.9607843, 0, 1, 1,
0.9445745, 3.06813, 0.5087273, 0.9686275, 0, 1, 1,
0.9468608, 0.6451748, 0.5406412, 0.972549, 0, 1, 1,
0.9481484, -0.2625414, 1.633818, 0.9803922, 0, 1, 1,
0.9521124, 0.1642382, -0.5063713, 0.9843137, 0, 1, 1,
0.9577426, -0.6084477, 2.579302, 0.9921569, 0, 1, 1,
0.9589888, -0.2390655, 3.617608, 0.9960784, 0, 1, 1,
0.9708364, -0.1204997, 0.280102, 1, 0, 0.9960784, 1,
0.979613, 1.330094, 2.761632, 1, 0, 0.9882353, 1,
0.9876611, 0.8412313, 0.1175527, 1, 0, 0.9843137, 1,
0.9891704, 0.3754581, 1.989847, 1, 0, 0.9764706, 1,
0.9924433, 0.7234235, 1.072482, 1, 0, 0.972549, 1,
0.9947857, 0.3143519, 2.992425, 1, 0, 0.9647059, 1,
1.000352, 2.218498, 0.3373569, 1, 0, 0.9607843, 1,
1.00066, -0.06471173, 1.036433, 1, 0, 0.9529412, 1,
1.015482, -2.447046, 4.104722, 1, 0, 0.9490196, 1,
1.015657, 2.618365, 0.5003816, 1, 0, 0.9411765, 1,
1.017366, -1.267009, 3.229601, 1, 0, 0.9372549, 1,
1.02751, 0.65277, 1.717799, 1, 0, 0.9294118, 1,
1.032276, -0.5571591, 2.362873, 1, 0, 0.9254902, 1,
1.032952, -0.2494758, 2.870339, 1, 0, 0.9176471, 1,
1.038018, 0.8783234, -0.67269, 1, 0, 0.9137255, 1,
1.045194, 0.04138486, 1.31997, 1, 0, 0.9058824, 1,
1.047608, 0.09823522, 1.670619, 1, 0, 0.9019608, 1,
1.050453, 0.7146134, 1.817644, 1, 0, 0.8941177, 1,
1.051206, 0.07499679, 1.828776, 1, 0, 0.8862745, 1,
1.062725, -0.8407733, 1.868756, 1, 0, 0.8823529, 1,
1.074254, 0.4051701, 2.177593, 1, 0, 0.8745098, 1,
1.083883, 1.114791, 2.250256, 1, 0, 0.8705882, 1,
1.092121, 0.2636536, 0.7452134, 1, 0, 0.8627451, 1,
1.092206, 0.08296177, 3.91018, 1, 0, 0.8588235, 1,
1.092982, -0.9402974, 2.024251, 1, 0, 0.8509804, 1,
1.095762, -0.2926068, 1.734987, 1, 0, 0.8470588, 1,
1.100248, 1.393949, 0.8940117, 1, 0, 0.8392157, 1,
1.102932, -1.536164, 2.131453, 1, 0, 0.8352941, 1,
1.123797, 0.5598623, 2.781814, 1, 0, 0.827451, 1,
1.129474, -0.513202, 3.441869, 1, 0, 0.8235294, 1,
1.133186, 1.007115, 2.03934, 1, 0, 0.8156863, 1,
1.133928, 0.272395, 1.109022, 1, 0, 0.8117647, 1,
1.136973, -0.08896489, 1.291645, 1, 0, 0.8039216, 1,
1.155683, 0.2973504, 2.01137, 1, 0, 0.7960784, 1,
1.162198, -0.1876554, 2.371653, 1, 0, 0.7921569, 1,
1.171336, 0.1762362, 2.325419, 1, 0, 0.7843137, 1,
1.173297, 1.918797, 0.9159663, 1, 0, 0.7803922, 1,
1.176044, -0.5531543, 1.578089, 1, 0, 0.772549, 1,
1.189634, -1.124351, 2.623761, 1, 0, 0.7686275, 1,
1.190032, 0.03416708, -0.2866587, 1, 0, 0.7607843, 1,
1.191112, -1.661969, 3.321813, 1, 0, 0.7568628, 1,
1.192809, -0.2169985, 0.6196508, 1, 0, 0.7490196, 1,
1.194013, -0.3778595, 1.785279, 1, 0, 0.7450981, 1,
1.194556, -0.2099273, 2.041036, 1, 0, 0.7372549, 1,
1.194655, 1.289482, 2.148088, 1, 0, 0.7333333, 1,
1.198782, -0.3625507, 2.733245, 1, 0, 0.7254902, 1,
1.20187, 0.8137628, 0.03034704, 1, 0, 0.7215686, 1,
1.205518, 0.3229003, 1.849972, 1, 0, 0.7137255, 1,
1.208011, -0.08425467, 2.188092, 1, 0, 0.7098039, 1,
1.209669, -0.007530529, 1.497768, 1, 0, 0.7019608, 1,
1.213046, -2.614236, 1.13811, 1, 0, 0.6941177, 1,
1.213236, 0.4251333, 0.1688877, 1, 0, 0.6901961, 1,
1.213274, 0.7615465, 2.155922, 1, 0, 0.682353, 1,
1.215651, 0.5688946, 0.8507987, 1, 0, 0.6784314, 1,
1.21799, -1.93933, 2.266444, 1, 0, 0.6705883, 1,
1.225393, 0.5278441, 0.6722924, 1, 0, 0.6666667, 1,
1.229463, 0.5601881, 1.231932, 1, 0, 0.6588235, 1,
1.237629, 0.2356391, 1.51762, 1, 0, 0.654902, 1,
1.237764, 1.344275, -0.3824964, 1, 0, 0.6470588, 1,
1.238719, -0.4321705, 2.606054, 1, 0, 0.6431373, 1,
1.239285, 0.4844921, 2.794588, 1, 0, 0.6352941, 1,
1.2447, 0.4497061, 2.102217, 1, 0, 0.6313726, 1,
1.251184, 0.5081468, -1.74674, 1, 0, 0.6235294, 1,
1.257671, 0.7625024, 0.4827588, 1, 0, 0.6196079, 1,
1.262436, 0.9189196, 2.008146, 1, 0, 0.6117647, 1,
1.26348, 0.6703643, 1.953998, 1, 0, 0.6078432, 1,
1.276643, 1.987567, 0.161281, 1, 0, 0.6, 1,
1.293637, 3.106994, 1.073268, 1, 0, 0.5921569, 1,
1.295394, -1.099154, 2.365936, 1, 0, 0.5882353, 1,
1.296534, 0.1477283, 1.881864, 1, 0, 0.5803922, 1,
1.302538, 0.3537755, 1.287374, 1, 0, 0.5764706, 1,
1.31174, -0.4506667, 1.596668, 1, 0, 0.5686275, 1,
1.312113, 1.90735, -0.3964583, 1, 0, 0.5647059, 1,
1.312579, 0.9340324, 0.4187126, 1, 0, 0.5568628, 1,
1.31298, 1.220951, -0.2095424, 1, 0, 0.5529412, 1,
1.313039, -0.6260594, 1.299767, 1, 0, 0.5450981, 1,
1.320166, 0.6948367, 0.947305, 1, 0, 0.5411765, 1,
1.338862, 1.268447, 0.5505875, 1, 0, 0.5333334, 1,
1.342719, 1.036942, 0.7516609, 1, 0, 0.5294118, 1,
1.350199, 0.2427547, 1.755628, 1, 0, 0.5215687, 1,
1.359183, 1.553005, 0.5540341, 1, 0, 0.5176471, 1,
1.366924, -0.2429907, 0.721045, 1, 0, 0.509804, 1,
1.371896, 1.074223, 0.8019186, 1, 0, 0.5058824, 1,
1.377439, 0.8065397, -0.4057252, 1, 0, 0.4980392, 1,
1.377532, 0.3343803, 1.50181, 1, 0, 0.4901961, 1,
1.386862, 1.351523, 1.682243, 1, 0, 0.4862745, 1,
1.388552, -0.2321756, 2.061697, 1, 0, 0.4784314, 1,
1.395239, -1.853617, 2.134732, 1, 0, 0.4745098, 1,
1.399471, -0.04791954, 4.312463, 1, 0, 0.4666667, 1,
1.404472, 1.131787, 1.061271, 1, 0, 0.4627451, 1,
1.404847, -2.749577, 1.214061, 1, 0, 0.454902, 1,
1.40497, -0.8898095, 4.533466, 1, 0, 0.4509804, 1,
1.405278, -0.5613892, 2.539902, 1, 0, 0.4431373, 1,
1.408831, -0.3479847, 1.349271, 1, 0, 0.4392157, 1,
1.41161, -0.1508635, 2.163777, 1, 0, 0.4313726, 1,
1.412158, 0.3386484, 2.660441, 1, 0, 0.427451, 1,
1.41742, 1.788644, 2.563472, 1, 0, 0.4196078, 1,
1.438432, 3.934464, 0.4174668, 1, 0, 0.4156863, 1,
1.45256, -2.639244, 1.365834, 1, 0, 0.4078431, 1,
1.47481, -0.4553905, 3.756152, 1, 0, 0.4039216, 1,
1.483442, -0.884289, 1.844796, 1, 0, 0.3960784, 1,
1.487263, -0.837402, 2.404391, 1, 0, 0.3882353, 1,
1.487747, -0.3434884, 3.82325, 1, 0, 0.3843137, 1,
1.490061, -1.296542, 1.644845, 1, 0, 0.3764706, 1,
1.504512, 0.1810719, 0.2888233, 1, 0, 0.372549, 1,
1.507625, -0.3098598, 0.3794026, 1, 0, 0.3647059, 1,
1.550612, -0.4526146, 1.81443, 1, 0, 0.3607843, 1,
1.554442, -0.6802383, 1.138126, 1, 0, 0.3529412, 1,
1.56707, -2.298266, 3.427135, 1, 0, 0.3490196, 1,
1.567629, 1.286065, 0.595521, 1, 0, 0.3411765, 1,
1.577307, -0.351059, 1.589438, 1, 0, 0.3372549, 1,
1.578424, 1.602978, -0.4227766, 1, 0, 0.3294118, 1,
1.578693, -1.403698, 3.195299, 1, 0, 0.3254902, 1,
1.583592, -0.5832769, 1.115212, 1, 0, 0.3176471, 1,
1.612133, 0.6347049, 0.5584738, 1, 0, 0.3137255, 1,
1.618712, -0.1070189, 2.224429, 1, 0, 0.3058824, 1,
1.620652, 0.7375929, 2.645085, 1, 0, 0.2980392, 1,
1.620889, -0.6879745, 0.5050954, 1, 0, 0.2941177, 1,
1.621101, -1.130204, 1.380501, 1, 0, 0.2862745, 1,
1.647479, -1.23954, 0.8687584, 1, 0, 0.282353, 1,
1.662889, 0.00980971, 1.330337, 1, 0, 0.2745098, 1,
1.689441, 0.9551848, 1.504646, 1, 0, 0.2705882, 1,
1.71732, -0.09015691, 1.244702, 1, 0, 0.2627451, 1,
1.720403, 0.7862844, 0.04256181, 1, 0, 0.2588235, 1,
1.72359, -1.041801, 2.422156, 1, 0, 0.2509804, 1,
1.739343, 0.223902, 0.5571733, 1, 0, 0.2470588, 1,
1.754827, 1.313801, 1.865813, 1, 0, 0.2392157, 1,
1.787832, 0.1882582, 0.5760863, 1, 0, 0.2352941, 1,
1.825505, 0.9453225, 0.8719401, 1, 0, 0.227451, 1,
1.848933, 0.7990767, 1.185408, 1, 0, 0.2235294, 1,
1.85016, -1.738022, 4.506533, 1, 0, 0.2156863, 1,
1.850733, 0.7897081, -0.4280712, 1, 0, 0.2117647, 1,
1.853348, -0.869011, 3.645838, 1, 0, 0.2039216, 1,
1.884082, 0.3296838, 1.108417, 1, 0, 0.1960784, 1,
1.916702, 1.221244, -1.090762, 1, 0, 0.1921569, 1,
1.955702, 0.2304948, 1.955137, 1, 0, 0.1843137, 1,
1.955907, 0.678708, 0.7662581, 1, 0, 0.1803922, 1,
1.961043, -0.4751111, 2.185274, 1, 0, 0.172549, 1,
1.967578, -0.6866486, 2.042166, 1, 0, 0.1686275, 1,
1.992364, 0.3258059, 1.441289, 1, 0, 0.1607843, 1,
1.997092, 1.67823, 1.052758, 1, 0, 0.1568628, 1,
2.011271, 0.4916407, 1.453695, 1, 0, 0.1490196, 1,
2.020717, -0.03758177, 2.309176, 1, 0, 0.145098, 1,
2.077534, -0.2181794, 3.096464, 1, 0, 0.1372549, 1,
2.104854, -0.1846145, 3.422954, 1, 0, 0.1333333, 1,
2.108672, -0.8159555, 1.691469, 1, 0, 0.1254902, 1,
2.126132, -0.4047039, 2.074882, 1, 0, 0.1215686, 1,
2.126577, 0.4094498, 2.225744, 1, 0, 0.1137255, 1,
2.175667, -1.518098, 2.158069, 1, 0, 0.1098039, 1,
2.1816, -0.7418725, 2.780245, 1, 0, 0.1019608, 1,
2.204824, -0.2185395, 1.752342, 1, 0, 0.09411765, 1,
2.222028, 1.196149, -0.142326, 1, 0, 0.09019608, 1,
2.259148, -0.907765, 1.128788, 1, 0, 0.08235294, 1,
2.334071, -0.007729504, 2.040552, 1, 0, 0.07843138, 1,
2.383086, 0.8132383, 1.58707, 1, 0, 0.07058824, 1,
2.387392, -0.7415231, 3.021033, 1, 0, 0.06666667, 1,
2.456142, -0.04197868, 3.012176, 1, 0, 0.05882353, 1,
2.535062, -0.9713077, 2.455584, 1, 0, 0.05490196, 1,
2.535167, -0.3452598, 2.100212, 1, 0, 0.04705882, 1,
2.634946, 0.07501857, 1.49197, 1, 0, 0.04313726, 1,
2.687484, 1.413643, 2.686888, 1, 0, 0.03529412, 1,
2.776318, 0.8088136, 1.829541, 1, 0, 0.03137255, 1,
2.901002, -1.558234, 1.862494, 1, 0, 0.02352941, 1,
3.053948, -0.3335221, 1.642132, 1, 0, 0.01960784, 1,
3.07274, -0.6980242, 1.440876, 1, 0, 0.01176471, 1,
3.354725, 1.158951, 1.603938, 1, 0, 0.007843138, 1
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
-0.001518369, -4.786002, -7.255889, 0, -0.5, 0.5, 0.5,
-0.001518369, -4.786002, -7.255889, 1, -0.5, 0.5, 0.5,
-0.001518369, -4.786002, -7.255889, 1, 1.5, 0.5, 0.5,
-0.001518369, -4.786002, -7.255889, 0, 1.5, 0.5, 0.5
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
-4.495529, 0.2061758, -7.255889, 0, -0.5, 0.5, 0.5,
-4.495529, 0.2061758, -7.255889, 1, -0.5, 0.5, 0.5,
-4.495529, 0.2061758, -7.255889, 1, 1.5, 0.5, 0.5,
-4.495529, 0.2061758, -7.255889, 0, 1.5, 0.5, 0.5
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
-4.495529, -4.786002, 0.1783791, 0, -0.5, 0.5, 0.5,
-4.495529, -4.786002, 0.1783791, 1, -0.5, 0.5, 0.5,
-4.495529, -4.786002, 0.1783791, 1, 1.5, 0.5, 0.5,
-4.495529, -4.786002, 0.1783791, 0, 1.5, 0.5, 0.5
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
-3, -3.633961, -5.540288,
3, -3.633961, -5.540288,
-3, -3.633961, -5.540288,
-3, -3.825968, -5.826222,
-2, -3.633961, -5.540288,
-2, -3.825968, -5.826222,
-1, -3.633961, -5.540288,
-1, -3.825968, -5.826222,
0, -3.633961, -5.540288,
0, -3.825968, -5.826222,
1, -3.633961, -5.540288,
1, -3.825968, -5.826222,
2, -3.633961, -5.540288,
2, -3.825968, -5.826222,
3, -3.633961, -5.540288,
3, -3.825968, -5.826222
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
-3, -4.209981, -6.398088, 0, -0.5, 0.5, 0.5,
-3, -4.209981, -6.398088, 1, -0.5, 0.5, 0.5,
-3, -4.209981, -6.398088, 1, 1.5, 0.5, 0.5,
-3, -4.209981, -6.398088, 0, 1.5, 0.5, 0.5,
-2, -4.209981, -6.398088, 0, -0.5, 0.5, 0.5,
-2, -4.209981, -6.398088, 1, -0.5, 0.5, 0.5,
-2, -4.209981, -6.398088, 1, 1.5, 0.5, 0.5,
-2, -4.209981, -6.398088, 0, 1.5, 0.5, 0.5,
-1, -4.209981, -6.398088, 0, -0.5, 0.5, 0.5,
-1, -4.209981, -6.398088, 1, -0.5, 0.5, 0.5,
-1, -4.209981, -6.398088, 1, 1.5, 0.5, 0.5,
-1, -4.209981, -6.398088, 0, 1.5, 0.5, 0.5,
0, -4.209981, -6.398088, 0, -0.5, 0.5, 0.5,
0, -4.209981, -6.398088, 1, -0.5, 0.5, 0.5,
0, -4.209981, -6.398088, 1, 1.5, 0.5, 0.5,
0, -4.209981, -6.398088, 0, 1.5, 0.5, 0.5,
1, -4.209981, -6.398088, 0, -0.5, 0.5, 0.5,
1, -4.209981, -6.398088, 1, -0.5, 0.5, 0.5,
1, -4.209981, -6.398088, 1, 1.5, 0.5, 0.5,
1, -4.209981, -6.398088, 0, 1.5, 0.5, 0.5,
2, -4.209981, -6.398088, 0, -0.5, 0.5, 0.5,
2, -4.209981, -6.398088, 1, -0.5, 0.5, 0.5,
2, -4.209981, -6.398088, 1, 1.5, 0.5, 0.5,
2, -4.209981, -6.398088, 0, 1.5, 0.5, 0.5,
3, -4.209981, -6.398088, 0, -0.5, 0.5, 0.5,
3, -4.209981, -6.398088, 1, -0.5, 0.5, 0.5,
3, -4.209981, -6.398088, 1, 1.5, 0.5, 0.5,
3, -4.209981, -6.398088, 0, 1.5, 0.5, 0.5
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
-3.458449, -2, -5.540288,
-3.458449, 2, -5.540288,
-3.458449, -2, -5.540288,
-3.631296, -2, -5.826222,
-3.458449, 0, -5.540288,
-3.631296, 0, -5.826222,
-3.458449, 2, -5.540288,
-3.631296, 2, -5.826222
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
-3.976989, -2, -6.398088, 0, -0.5, 0.5, 0.5,
-3.976989, -2, -6.398088, 1, -0.5, 0.5, 0.5,
-3.976989, -2, -6.398088, 1, 1.5, 0.5, 0.5,
-3.976989, -2, -6.398088, 0, 1.5, 0.5, 0.5,
-3.976989, 0, -6.398088, 0, -0.5, 0.5, 0.5,
-3.976989, 0, -6.398088, 1, -0.5, 0.5, 0.5,
-3.976989, 0, -6.398088, 1, 1.5, 0.5, 0.5,
-3.976989, 0, -6.398088, 0, 1.5, 0.5, 0.5,
-3.976989, 2, -6.398088, 0, -0.5, 0.5, 0.5,
-3.976989, 2, -6.398088, 1, -0.5, 0.5, 0.5,
-3.976989, 2, -6.398088, 1, 1.5, 0.5, 0.5,
-3.976989, 2, -6.398088, 0, 1.5, 0.5, 0.5
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
-3.458449, -3.633961, -4,
-3.458449, -3.633961, 4,
-3.458449, -3.633961, -4,
-3.631296, -3.825968, -4,
-3.458449, -3.633961, -2,
-3.631296, -3.825968, -2,
-3.458449, -3.633961, 0,
-3.631296, -3.825968, 0,
-3.458449, -3.633961, 2,
-3.631296, -3.825968, 2,
-3.458449, -3.633961, 4,
-3.631296, -3.825968, 4
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
-3.976989, -4.209981, -4, 0, -0.5, 0.5, 0.5,
-3.976989, -4.209981, -4, 1, -0.5, 0.5, 0.5,
-3.976989, -4.209981, -4, 1, 1.5, 0.5, 0.5,
-3.976989, -4.209981, -4, 0, 1.5, 0.5, 0.5,
-3.976989, -4.209981, -2, 0, -0.5, 0.5, 0.5,
-3.976989, -4.209981, -2, 1, -0.5, 0.5, 0.5,
-3.976989, -4.209981, -2, 1, 1.5, 0.5, 0.5,
-3.976989, -4.209981, -2, 0, 1.5, 0.5, 0.5,
-3.976989, -4.209981, 0, 0, -0.5, 0.5, 0.5,
-3.976989, -4.209981, 0, 1, -0.5, 0.5, 0.5,
-3.976989, -4.209981, 0, 1, 1.5, 0.5, 0.5,
-3.976989, -4.209981, 0, 0, 1.5, 0.5, 0.5,
-3.976989, -4.209981, 2, 0, -0.5, 0.5, 0.5,
-3.976989, -4.209981, 2, 1, -0.5, 0.5, 0.5,
-3.976989, -4.209981, 2, 1, 1.5, 0.5, 0.5,
-3.976989, -4.209981, 2, 0, 1.5, 0.5, 0.5,
-3.976989, -4.209981, 4, 0, -0.5, 0.5, 0.5,
-3.976989, -4.209981, 4, 1, -0.5, 0.5, 0.5,
-3.976989, -4.209981, 4, 1, 1.5, 0.5, 0.5,
-3.976989, -4.209981, 4, 0, 1.5, 0.5, 0.5
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
-3.458449, -3.633961, -5.540288,
-3.458449, 4.046313, -5.540288,
-3.458449, -3.633961, 5.897047,
-3.458449, 4.046313, 5.897047,
-3.458449, -3.633961, -5.540288,
-3.458449, -3.633961, 5.897047,
-3.458449, 4.046313, -5.540288,
-3.458449, 4.046313, 5.897047,
-3.458449, -3.633961, -5.540288,
3.455413, -3.633961, -5.540288,
-3.458449, -3.633961, 5.897047,
3.455413, -3.633961, 5.897047,
-3.458449, 4.046313, -5.540288,
3.455413, 4.046313, -5.540288,
-3.458449, 4.046313, 5.897047,
3.455413, 4.046313, 5.897047,
3.455413, -3.633961, -5.540288,
3.455413, 4.046313, -5.540288,
3.455413, -3.633961, 5.897047,
3.455413, 4.046313, 5.897047,
3.455413, -3.633961, -5.540288,
3.455413, -3.633961, 5.897047,
3.455413, 4.046313, -5.540288,
3.455413, 4.046313, 5.897047
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
var radius = 8.230938;
var distance = 36.62037;
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
mvMatrix.translate( 0.001518369, -0.2061758, -0.1783791 );
mvMatrix.scale( 1.28719, 1.158741, 0.7781054 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.62037);
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
Fosthiazate<-read.table("Fosthiazate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Fosthiazate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Fosthiazate' not found
```

```r
y<-Fosthiazate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Fosthiazate' not found
```

```r
z<-Fosthiazate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Fosthiazate' not found
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
-3.357762, 0.9447166, -0.8551277, 0, 0, 1, 1, 1,
-3.06159, 0.5965909, -1.061737, 1, 0, 0, 1, 1,
-2.76722, 0.3632189, 0.2250643, 1, 0, 0, 1, 1,
-2.541096, -0.088198, -0.9001254, 1, 0, 0, 1, 1,
-2.387596, 0.05788703, -3.374822, 1, 0, 0, 1, 1,
-2.383501, -0.9991924, 0.2166779, 1, 0, 0, 1, 1,
-2.343325, -0.8928798, -4.06361, 0, 0, 0, 1, 1,
-2.338855, -0.09897202, -1.926909, 0, 0, 0, 1, 1,
-2.336771, 0.3601644, -1.580966, 0, 0, 0, 1, 1,
-2.266004, 1.313236, -1.89245, 0, 0, 0, 1, 1,
-2.262429, -0.2786917, -2.617951, 0, 0, 0, 1, 1,
-2.240843, 0.08820423, -1.61018, 0, 0, 0, 1, 1,
-2.224374, -0.8809727, -1.293635, 0, 0, 0, 1, 1,
-2.202615, 0.3709645, -1.055327, 1, 1, 1, 1, 1,
-2.195478, 0.1260851, 0.03449937, 1, 1, 1, 1, 1,
-2.180839, -0.3784304, -2.490637, 1, 1, 1, 1, 1,
-2.16797, -0.05756402, -1.332168, 1, 1, 1, 1, 1,
-2.072443, 2.300579, -0.0161057, 1, 1, 1, 1, 1,
-2.037102, -0.5470046, -1.698658, 1, 1, 1, 1, 1,
-2.026691, 2.336598, -1.021537, 1, 1, 1, 1, 1,
-2.015343, -0.2199298, -2.113141, 1, 1, 1, 1, 1,
-1.974574, -0.4872518, -3.04913, 1, 1, 1, 1, 1,
-1.96387, 0.4535654, -0.8014696, 1, 1, 1, 1, 1,
-1.945901, -0.7425129, -1.653617, 1, 1, 1, 1, 1,
-1.917859, -1.464189, -1.70358, 1, 1, 1, 1, 1,
-1.899365, 1.79408, -2.402195, 1, 1, 1, 1, 1,
-1.884795, -0.7481884, -1.409382, 1, 1, 1, 1, 1,
-1.878852, 1.740026, -1.315783, 1, 1, 1, 1, 1,
-1.876685, 1.133907, -1.388742, 0, 0, 1, 1, 1,
-1.821355, 1.020743, -2.200118, 1, 0, 0, 1, 1,
-1.82072, -1.559718, -2.409184, 1, 0, 0, 1, 1,
-1.80866, 0.6286216, -1.177544, 1, 0, 0, 1, 1,
-1.799105, 1.260875, -0.3911918, 1, 0, 0, 1, 1,
-1.760644, -0.3992357, -3.182348, 1, 0, 0, 1, 1,
-1.756556, -0.7407936, -2.533326, 0, 0, 0, 1, 1,
-1.745692, -0.7022247, -1.105603, 0, 0, 0, 1, 1,
-1.735567, 0.5655487, 1.013373, 0, 0, 0, 1, 1,
-1.722621, 0.3976308, -2.134644, 0, 0, 0, 1, 1,
-1.703713, 0.426312, -2.55811, 0, 0, 0, 1, 1,
-1.693845, 0.3678225, -0.4512177, 0, 0, 0, 1, 1,
-1.685938, 0.4409487, -0.4912547, 0, 0, 0, 1, 1,
-1.680086, 0.01458571, -1.917893, 1, 1, 1, 1, 1,
-1.668738, -0.1519772, -2.592751, 1, 1, 1, 1, 1,
-1.661268, 1.382595, -0.8439763, 1, 1, 1, 1, 1,
-1.643874, -0.5352532, 0.912496, 1, 1, 1, 1, 1,
-1.643774, 1.16484, -0.984026, 1, 1, 1, 1, 1,
-1.641255, -1.297147, -1.233035, 1, 1, 1, 1, 1,
-1.615371, -0.2840274, -0.4238813, 1, 1, 1, 1, 1,
-1.602987, -0.4653307, -1.107462, 1, 1, 1, 1, 1,
-1.602464, -1.392746, -4.78967, 1, 1, 1, 1, 1,
-1.577887, 0.05698668, -1.022316, 1, 1, 1, 1, 1,
-1.575274, 0.1919186, 1.061191, 1, 1, 1, 1, 1,
-1.574457, -0.272494, -0.9227171, 1, 1, 1, 1, 1,
-1.54354, -0.0256266, -1.517182, 1, 1, 1, 1, 1,
-1.540862, 0.4012189, 0.8484495, 1, 1, 1, 1, 1,
-1.531381, -0.6718933, -2.941003, 1, 1, 1, 1, 1,
-1.519932, -0.4823974, -3.365765, 0, 0, 1, 1, 1,
-1.514796, -0.8301859, -3.202008, 1, 0, 0, 1, 1,
-1.511695, -0.6329473, -2.402994, 1, 0, 0, 1, 1,
-1.508239, 0.2985082, -2.240829, 1, 0, 0, 1, 1,
-1.505632, -0.4061968, -1.310092, 1, 0, 0, 1, 1,
-1.504273, -0.9318035, -1.675336, 1, 0, 0, 1, 1,
-1.503146, -0.1791914, -1.85755, 0, 0, 0, 1, 1,
-1.487714, 0.8958783, -0.9145193, 0, 0, 0, 1, 1,
-1.487001, -0.4862521, -1.585623, 0, 0, 0, 1, 1,
-1.476717, 1.203543, -1.276116, 0, 0, 0, 1, 1,
-1.465093, 1.158613, -1.561081, 0, 0, 0, 1, 1,
-1.455748, 1.232643, -1.51075, 0, 0, 0, 1, 1,
-1.44606, -0.8332247, -1.630109, 0, 0, 0, 1, 1,
-1.429882, 1.778918, 0.3391315, 1, 1, 1, 1, 1,
-1.422964, -0.93843, -2.180779, 1, 1, 1, 1, 1,
-1.421972, 1.136095, 0.607129, 1, 1, 1, 1, 1,
-1.412208, -0.06453881, -0.3238704, 1, 1, 1, 1, 1,
-1.41157, -0.4549091, 0.2789241, 1, 1, 1, 1, 1,
-1.406384, 0.3632779, -1.31639, 1, 1, 1, 1, 1,
-1.404377, -0.3325083, -1.776523, 1, 1, 1, 1, 1,
-1.395541, 1.062471, 0.1713932, 1, 1, 1, 1, 1,
-1.380461, 1.397645, 2.085891, 1, 1, 1, 1, 1,
-1.369117, 1.830618, -0.5011895, 1, 1, 1, 1, 1,
-1.368753, -1.413192, -0.8956174, 1, 1, 1, 1, 1,
-1.365868, 0.3459067, -1.739699, 1, 1, 1, 1, 1,
-1.364214, 0.09900804, -1.04768, 1, 1, 1, 1, 1,
-1.356773, -0.03172819, -0.4019275, 1, 1, 1, 1, 1,
-1.356056, 0.3268134, -1.642179, 1, 1, 1, 1, 1,
-1.349953, 0.3500785, -1.649487, 0, 0, 1, 1, 1,
-1.349131, 0.2786751, -1.188842, 1, 0, 0, 1, 1,
-1.347709, -0.447553, -1.710183, 1, 0, 0, 1, 1,
-1.345003, 0.5495934, -1.827968, 1, 0, 0, 1, 1,
-1.344047, -1.124036, -1.352775, 1, 0, 0, 1, 1,
-1.341227, 0.02523371, -0.03778803, 1, 0, 0, 1, 1,
-1.337082, -0.8685323, -3.042287, 0, 0, 0, 1, 1,
-1.324799, 0.684768, -1.023798, 0, 0, 0, 1, 1,
-1.320802, -0.9220896, -1.033786, 0, 0, 0, 1, 1,
-1.305819, 0.9949167, -0.5899712, 0, 0, 0, 1, 1,
-1.291591, 0.158069, -0.2663633, 0, 0, 0, 1, 1,
-1.281621, -0.4845039, -4.408465, 0, 0, 0, 1, 1,
-1.272426, 1.632336, -1.17476, 0, 0, 0, 1, 1,
-1.269564, -1.318702, -1.995384, 1, 1, 1, 1, 1,
-1.263106, -0.7678512, -0.9888144, 1, 1, 1, 1, 1,
-1.261464, -1.021117, -3.126668, 1, 1, 1, 1, 1,
-1.258502, -0.09305643, -2.938277, 1, 1, 1, 1, 1,
-1.254844, -0.3238029, -2.577132, 1, 1, 1, 1, 1,
-1.251339, -1.29867, -2.340195, 1, 1, 1, 1, 1,
-1.247765, 0.649747, -2.093825, 1, 1, 1, 1, 1,
-1.238057, 1.796545, -0.3391235, 1, 1, 1, 1, 1,
-1.228475, 0.2722082, -0.7283779, 1, 1, 1, 1, 1,
-1.216593, -0.03690451, -1.592222, 1, 1, 1, 1, 1,
-1.20495, 1.068881, 0.3874052, 1, 1, 1, 1, 1,
-1.199464, -1.024652, -2.096847, 1, 1, 1, 1, 1,
-1.18993, 0.283771, -0.9421003, 1, 1, 1, 1, 1,
-1.187148, 0.6094823, -0.1551788, 1, 1, 1, 1, 1,
-1.185495, 0.306837, -0.9867257, 1, 1, 1, 1, 1,
-1.184057, 0.6587613, -1.247525, 0, 0, 1, 1, 1,
-1.168192, 1.491674, 0.2939444, 1, 0, 0, 1, 1,
-1.14368, -1.089308, -1.217397, 1, 0, 0, 1, 1,
-1.134127, 1.151688, -0.06731459, 1, 0, 0, 1, 1,
-1.132443, -1.819364, -1.553263, 1, 0, 0, 1, 1,
-1.131764, 1.466597, -0.7383991, 1, 0, 0, 1, 1,
-1.130566, 0.8440753, -0.8042909, 0, 0, 0, 1, 1,
-1.122214, -0.8863491, -1.925721, 0, 0, 0, 1, 1,
-1.118423, -0.473277, -2.76619, 0, 0, 0, 1, 1,
-1.113424, 0.02097168, -2.408391, 0, 0, 0, 1, 1,
-1.111438, -1.97175, -3.363754, 0, 0, 0, 1, 1,
-1.111279, 1.626665, -1.229818, 0, 0, 0, 1, 1,
-1.101824, -1.192818, -3.050711, 0, 0, 0, 1, 1,
-1.101524, -1.092406, -1.735763, 1, 1, 1, 1, 1,
-1.093159, 0.6738878, -0.5092403, 1, 1, 1, 1, 1,
-1.091897, 0.1757292, -0.614503, 1, 1, 1, 1, 1,
-1.090329, 0.9328834, -1.072083, 1, 1, 1, 1, 1,
-1.090288, -0.5714333, -1.692529, 1, 1, 1, 1, 1,
-1.090254, 0.4642797, -0.9449363, 1, 1, 1, 1, 1,
-1.089892, 0.4432194, -2.574833, 1, 1, 1, 1, 1,
-1.088128, 2.307172, 1.560095, 1, 1, 1, 1, 1,
-1.087031, -0.4724623, -2.254175, 1, 1, 1, 1, 1,
-1.080286, 0.02673558, -1.447969, 1, 1, 1, 1, 1,
-1.077253, 0.04694356, -3.211627, 1, 1, 1, 1, 1,
-1.07496, -0.5994909, -3.40537, 1, 1, 1, 1, 1,
-1.069767, 0.8173889, 0.3162017, 1, 1, 1, 1, 1,
-1.058747, 1.112516, -0.3981631, 1, 1, 1, 1, 1,
-1.058221, 1.686487, -1.003675, 1, 1, 1, 1, 1,
-1.04731, -2.298293, -1.472932, 0, 0, 1, 1, 1,
-1.041636, 0.4282123, -1.184672, 1, 0, 0, 1, 1,
-1.04106, -0.2035577, -2.811294, 1, 0, 0, 1, 1,
-1.035148, 0.5846401, -2.151632, 1, 0, 0, 1, 1,
-1.02795, -0.3692687, -1.361306, 1, 0, 0, 1, 1,
-1.022203, -1.118682, -0.9308113, 1, 0, 0, 1, 1,
-1.022109, 1.14143, -2.186838, 0, 0, 0, 1, 1,
-1.019683, -0.1089582, -1.748517, 0, 0, 0, 1, 1,
-1.015726, -0.02373442, -0.902856, 0, 0, 0, 1, 1,
-1.01378, -0.21851, -1.385668, 0, 0, 0, 1, 1,
-1.012019, -0.824549, -3.73293, 0, 0, 0, 1, 1,
-1.009012, -0.2313909, -1.903927, 0, 0, 0, 1, 1,
-1.007789, 0.6014023, -2.034411, 0, 0, 0, 1, 1,
-1.004167, -0.5286715, -3.422237, 1, 1, 1, 1, 1,
-0.9955809, -0.9439937, -1.315545, 1, 1, 1, 1, 1,
-0.991183, 1.004033, -0.6324392, 1, 1, 1, 1, 1,
-0.986218, 0.2166126, -2.224574, 1, 1, 1, 1, 1,
-0.9743806, -1.204447, -1.666821, 1, 1, 1, 1, 1,
-0.9736127, 0.1056672, -3.101466, 1, 1, 1, 1, 1,
-0.9572948, -0.1443472, -1.538449, 1, 1, 1, 1, 1,
-0.9561334, 0.7562615, -1.635083, 1, 1, 1, 1, 1,
-0.9561136, -0.4993852, -2.521044, 1, 1, 1, 1, 1,
-0.9529633, 0.06288276, -0.3348295, 1, 1, 1, 1, 1,
-0.9435152, -1.450427, -3.68468, 1, 1, 1, 1, 1,
-0.9423727, -0.8943222, -2.638805, 1, 1, 1, 1, 1,
-0.9409024, -0.3655828, -2.535409, 1, 1, 1, 1, 1,
-0.9392413, 0.6351294, -1.668023, 1, 1, 1, 1, 1,
-0.9328724, 1.119828, 0.4301248, 1, 1, 1, 1, 1,
-0.9318922, 0.5284649, 0.2633872, 0, 0, 1, 1, 1,
-0.9219443, 0.8630543, -0.05024228, 1, 0, 0, 1, 1,
-0.9218274, -0.467902, -0.4938974, 1, 0, 0, 1, 1,
-0.9161406, -0.6087239, -2.365913, 1, 0, 0, 1, 1,
-0.910425, 1.962739, 1.173692, 1, 0, 0, 1, 1,
-0.9039585, -1.344476, -1.975106, 1, 0, 0, 1, 1,
-0.9038849, -0.05864393, -1.737327, 0, 0, 0, 1, 1,
-0.8989535, -0.3783951, -1.537426, 0, 0, 0, 1, 1,
-0.8972872, 1.070847, 1.280611, 0, 0, 0, 1, 1,
-0.8971264, -0.09014032, -2.913779, 0, 0, 0, 1, 1,
-0.8786684, -2.029046, -1.357157, 0, 0, 0, 1, 1,
-0.8686495, -0.09993272, -1.941857, 0, 0, 0, 1, 1,
-0.8680564, -1.093754, -1.849499, 0, 0, 0, 1, 1,
-0.8646004, 0.9883174, -0.507458, 1, 1, 1, 1, 1,
-0.8617632, 0.7173399, -1.243553, 1, 1, 1, 1, 1,
-0.860365, -0.2024972, -2.828188, 1, 1, 1, 1, 1,
-0.8603589, -1.159497, -2.048217, 1, 1, 1, 1, 1,
-0.8589576, -0.7924416, -3.079335, 1, 1, 1, 1, 1,
-0.858566, -0.5998757, -3.30242, 1, 1, 1, 1, 1,
-0.8574752, 0.6268254, -0.7505319, 1, 1, 1, 1, 1,
-0.8559572, 1.595931, -1.058579, 1, 1, 1, 1, 1,
-0.8553009, -1.101064, -2.986031, 1, 1, 1, 1, 1,
-0.8535191, 0.9873138, -0.476692, 1, 1, 1, 1, 1,
-0.8439405, -0.5635237, -2.149398, 1, 1, 1, 1, 1,
-0.8417072, 1.138386, -0.9514217, 1, 1, 1, 1, 1,
-0.8388553, -0.4764926, -1.704434, 1, 1, 1, 1, 1,
-0.8344966, 0.07814949, -2.153773, 1, 1, 1, 1, 1,
-0.8314936, -1.049687, -3.278533, 1, 1, 1, 1, 1,
-0.8297987, -1.071447, -2.033572, 0, 0, 1, 1, 1,
-0.8280627, -1.365803, -2.069535, 1, 0, 0, 1, 1,
-0.8271604, -0.2884026, -1.816651, 1, 0, 0, 1, 1,
-0.8255407, 0.2152291, -1.143755, 1, 0, 0, 1, 1,
-0.8156571, -1.49698, -1.051042, 1, 0, 0, 1, 1,
-0.813106, -0.808568, -3.403533, 1, 0, 0, 1, 1,
-0.8119097, -0.09414703, -0.834015, 0, 0, 0, 1, 1,
-0.8091595, 0.4371018, -0.8866013, 0, 0, 0, 1, 1,
-0.8087451, -0.1428744, -0.4632935, 0, 0, 0, 1, 1,
-0.8054311, -0.1489347, -1.527367, 0, 0, 0, 1, 1,
-0.7989937, 0.3519679, -2.920874, 0, 0, 0, 1, 1,
-0.7973127, 0.09156504, -0.6408824, 0, 0, 0, 1, 1,
-0.7917668, 0.8033452, -1.195994, 0, 0, 0, 1, 1,
-0.7800716, 0.2942949, -0.3399135, 1, 1, 1, 1, 1,
-0.7789369, 0.1622616, -1.164688, 1, 1, 1, 1, 1,
-0.7763758, -0.8816736, -3.464266, 1, 1, 1, 1, 1,
-0.7738066, 1.053268, -0.5575125, 1, 1, 1, 1, 1,
-0.7698023, 1.504895, 0.3979018, 1, 1, 1, 1, 1,
-0.764631, 1.932214, 0.2498711, 1, 1, 1, 1, 1,
-0.7637972, 1.42726, -0.8234998, 1, 1, 1, 1, 1,
-0.762948, -0.2132425, -1.700931, 1, 1, 1, 1, 1,
-0.7622287, 0.2660133, -2.078823, 1, 1, 1, 1, 1,
-0.7613578, -0.3384511, -0.3431252, 1, 1, 1, 1, 1,
-0.7562274, 1.251774, 0.2325341, 1, 1, 1, 1, 1,
-0.7532532, -1.079963, -3.424315, 1, 1, 1, 1, 1,
-0.7481964, -0.321079, -2.050059, 1, 1, 1, 1, 1,
-0.7442781, -0.15816, -0.6879939, 1, 1, 1, 1, 1,
-0.7433757, 0.9226388, -0.5569314, 1, 1, 1, 1, 1,
-0.7433093, -0.7465937, -2.119025, 0, 0, 1, 1, 1,
-0.7402567, 1.027439, -1.676545, 1, 0, 0, 1, 1,
-0.7396231, 0.2717589, -1.67864, 1, 0, 0, 1, 1,
-0.7360326, -0.03711892, -2.09087, 1, 0, 0, 1, 1,
-0.7347881, 0.2817989, -0.3852939, 1, 0, 0, 1, 1,
-0.7328644, 1.724159, 0.2767931, 1, 0, 0, 1, 1,
-0.7248011, 0.4403031, -0.4249775, 0, 0, 0, 1, 1,
-0.7129596, 0.06122096, -1.964086, 0, 0, 0, 1, 1,
-0.7003829, 1.126075, -0.01366629, 0, 0, 0, 1, 1,
-0.6993927, 0.4105605, -1.831007, 0, 0, 0, 1, 1,
-0.6970232, -0.8479712, -2.936312, 0, 0, 0, 1, 1,
-0.6942484, 0.2372404, -0.6987891, 0, 0, 0, 1, 1,
-0.6914251, -1.712202, 0.4784525, 0, 0, 0, 1, 1,
-0.6871613, 0.2105172, -1.560821, 1, 1, 1, 1, 1,
-0.6865923, 1.268853, -3.393378, 1, 1, 1, 1, 1,
-0.6805553, 1.522713, -0.3792481, 1, 1, 1, 1, 1,
-0.6758428, 1.976159, 1.052172, 1, 1, 1, 1, 1,
-0.6750084, -0.2353619, -2.142159, 1, 1, 1, 1, 1,
-0.6715394, 2.395008, -0.6175236, 1, 1, 1, 1, 1,
-0.6669456, 0.7593105, 0.7460139, 1, 1, 1, 1, 1,
-0.6616237, 0.462619, -1.694612, 1, 1, 1, 1, 1,
-0.6614934, -1.791709, -2.718128, 1, 1, 1, 1, 1,
-0.6576465, -0.2326697, -0.3386034, 1, 1, 1, 1, 1,
-0.6575629, 2.278703, 1.215, 1, 1, 1, 1, 1,
-0.6561203, 0.1776088, -1.081078, 1, 1, 1, 1, 1,
-0.6540984, -1.179347, -1.542457, 1, 1, 1, 1, 1,
-0.6524283, 0.1116709, -0.5452828, 1, 1, 1, 1, 1,
-0.6465348, -0.718385, -0.8054026, 1, 1, 1, 1, 1,
-0.6449731, -0.6584743, -0.8289294, 0, 0, 1, 1, 1,
-0.6446559, -0.07717848, -2.50069, 1, 0, 0, 1, 1,
-0.6377782, 0.7350265, -1.014603, 1, 0, 0, 1, 1,
-0.6376728, -2.600039, -2.449971, 1, 0, 0, 1, 1,
-0.6362997, -0.6515145, -2.65941, 1, 0, 0, 1, 1,
-0.6329439, -0.7179552, -2.556514, 1, 0, 0, 1, 1,
-0.6257619, -0.0135261, -1.144885, 0, 0, 0, 1, 1,
-0.6208673, 1.848249, 0.4984525, 0, 0, 0, 1, 1,
-0.6190561, 0.007027838, -3.374364, 0, 0, 0, 1, 1,
-0.6110075, 1.102672, -2.550013, 0, 0, 0, 1, 1,
-0.6070976, -0.5700126, -4.011268, 0, 0, 0, 1, 1,
-0.6056982, 2.321948, -1.124336, 0, 0, 0, 1, 1,
-0.6054817, 0.4255463, -1.782506, 0, 0, 0, 1, 1,
-0.6045243, -0.8639754, -1.842118, 1, 1, 1, 1, 1,
-0.6013423, 0.3633434, -3.230278, 1, 1, 1, 1, 1,
-0.5992568, -1.870443, -0.8880131, 1, 1, 1, 1, 1,
-0.5992138, 0.722138, -0.6475261, 1, 1, 1, 1, 1,
-0.5985839, -0.1219298, -2.460419, 1, 1, 1, 1, 1,
-0.5977842, 0.1627488, -2.330241, 1, 1, 1, 1, 1,
-0.5967224, 1.74131, 1.102038, 1, 1, 1, 1, 1,
-0.5863395, -1.095917, -0.6045937, 1, 1, 1, 1, 1,
-0.5829151, -1.495338, 0.3792165, 1, 1, 1, 1, 1,
-0.5734914, -0.1042235, -2.845399, 1, 1, 1, 1, 1,
-0.565067, 0.7021196, -0.8444801, 1, 1, 1, 1, 1,
-0.5607947, -1.614726, -4.312863, 1, 1, 1, 1, 1,
-0.5602253, 0.9196008, 0.8341827, 1, 1, 1, 1, 1,
-0.5596657, 0.4723539, -2.684006, 1, 1, 1, 1, 1,
-0.5595209, -1.709145, -3.038135, 1, 1, 1, 1, 1,
-0.5588679, 0.006553719, -1.842015, 0, 0, 1, 1, 1,
-0.5578312, -0.3026806, -0.5799864, 1, 0, 0, 1, 1,
-0.5518843, -0.9208977, -3.354258, 1, 0, 0, 1, 1,
-0.5500062, 1.052198, -1.280828, 1, 0, 0, 1, 1,
-0.5457137, -0.1034771, -2.184378, 1, 0, 0, 1, 1,
-0.5438803, -0.4136102, -5.356929, 1, 0, 0, 1, 1,
-0.5416644, 0.14463, -1.611557, 0, 0, 0, 1, 1,
-0.5399944, -0.1487161, -3.081581, 0, 0, 0, 1, 1,
-0.5378228, 0.2634957, -0.926226, 0, 0, 0, 1, 1,
-0.5377575, -0.9366606, -3.9138, 0, 0, 0, 1, 1,
-0.5366722, 0.7650679, 0.5089228, 0, 0, 0, 1, 1,
-0.5355768, 0.3375657, 0.2058212, 0, 0, 0, 1, 1,
-0.5322765, -0.6695074, -2.188167, 0, 0, 0, 1, 1,
-0.5309419, -2.072747, -2.584966, 1, 1, 1, 1, 1,
-0.5291942, -0.3729731, -1.368756, 1, 1, 1, 1, 1,
-0.5233361, 2.035443, -1.03992, 1, 1, 1, 1, 1,
-0.5219589, 0.3846257, -2.786469, 1, 1, 1, 1, 1,
-0.5203487, -1.367393, -2.144457, 1, 1, 1, 1, 1,
-0.5191182, -0.09473274, -1.979211, 1, 1, 1, 1, 1,
-0.5160704, -0.4819183, -1.270744, 1, 1, 1, 1, 1,
-0.5144623, 0.5410501, -2.186019, 1, 1, 1, 1, 1,
-0.5075239, -0.8967733, -3.965107, 1, 1, 1, 1, 1,
-0.5073866, -1.450065, -1.775519, 1, 1, 1, 1, 1,
-0.5056041, 1.971471, -0.3184079, 1, 1, 1, 1, 1,
-0.5046289, -0.008222478, -1.826431, 1, 1, 1, 1, 1,
-0.4992215, -0.2513365, -3.72794, 1, 1, 1, 1, 1,
-0.4973444, 0.003762522, -0.3621643, 1, 1, 1, 1, 1,
-0.4893199, 1.248457, -0.131027, 1, 1, 1, 1, 1,
-0.4865422, -0.3462915, -0.9050032, 0, 0, 1, 1, 1,
-0.4808514, -0.3953584, -1.917107, 1, 0, 0, 1, 1,
-0.480629, -0.3014747, 0.6449491, 1, 0, 0, 1, 1,
-0.4800909, -3.269578, -3.785678, 1, 0, 0, 1, 1,
-0.4741758, 0.8877846, -0.1055458, 1, 0, 0, 1, 1,
-0.4643382, -0.4400365, -1.901331, 1, 0, 0, 1, 1,
-0.4569307, -2.033512, -2.520938, 0, 0, 0, 1, 1,
-0.4538597, -0.3137745, -0.3630327, 0, 0, 0, 1, 1,
-0.4533801, 0.1285692, -3.66738, 0, 0, 0, 1, 1,
-0.4470922, 0.315373, 0.2649647, 0, 0, 0, 1, 1,
-0.4435638, 0.6830107, 0.1715417, 0, 0, 0, 1, 1,
-0.442724, 0.01669664, -2.165532, 0, 0, 0, 1, 1,
-0.44197, -0.1440113, -2.121602, 0, 0, 0, 1, 1,
-0.436651, -0.7826872, -3.545204, 1, 1, 1, 1, 1,
-0.4354476, -1.635165, -2.538751, 1, 1, 1, 1, 1,
-0.4352309, -0.3839852, -3.371647, 1, 1, 1, 1, 1,
-0.4346353, -1.190982, -3.836415, 1, 1, 1, 1, 1,
-0.4331643, 0.1562153, -0.8529348, 1, 1, 1, 1, 1,
-0.4313555, 1.518492, -1.225265, 1, 1, 1, 1, 1,
-0.4311565, 0.2242772, -1.726072, 1, 1, 1, 1, 1,
-0.4310979, -0.03516781, -0.4726059, 1, 1, 1, 1, 1,
-0.431028, 0.1357488, -0.1553386, 1, 1, 1, 1, 1,
-0.4302304, 1.996176, 0.6816703, 1, 1, 1, 1, 1,
-0.4299476, -0.355922, -3.380485, 1, 1, 1, 1, 1,
-0.4240302, 0.2554568, -0.569269, 1, 1, 1, 1, 1,
-0.4191069, 2.069457, -1.294113, 1, 1, 1, 1, 1,
-0.4188591, -0.878992, -3.792701, 1, 1, 1, 1, 1,
-0.416864, -0.3048328, -5.373725, 1, 1, 1, 1, 1,
-0.4154752, -1.791566, -3.359689, 0, 0, 1, 1, 1,
-0.4153413, -2.405866, -3.636888, 1, 0, 0, 1, 1,
-0.4122504, -0.6689503, -2.924664, 1, 0, 0, 1, 1,
-0.4112469, 0.7578161, -1.677962, 1, 0, 0, 1, 1,
-0.4104441, 0.9003773, -0.2071898, 1, 0, 0, 1, 1,
-0.4085464, -0.8328293, -4.042343, 1, 0, 0, 1, 1,
-0.4032262, 0.995901, 0.2141412, 0, 0, 0, 1, 1,
-0.4029978, 1.713395, -0.352571, 0, 0, 0, 1, 1,
-0.4020604, 0.08879162, -1.09451, 0, 0, 0, 1, 1,
-0.4011486, 0.6621314, -1.669949, 0, 0, 0, 1, 1,
-0.3990577, -0.9146507, -3.979081, 0, 0, 0, 1, 1,
-0.3968188, -1.103435, -0.8749543, 0, 0, 0, 1, 1,
-0.3948841, 0.5837187, -1.217835, 0, 0, 0, 1, 1,
-0.3942356, -0.5937534, -4.17273, 1, 1, 1, 1, 1,
-0.3922582, -0.01060644, -1.788211, 1, 1, 1, 1, 1,
-0.3916247, -0.5194918, -4.47834, 1, 1, 1, 1, 1,
-0.3848664, -1.32482, -3.61779, 1, 1, 1, 1, 1,
-0.3811516, 0.7399599, -0.5898356, 1, 1, 1, 1, 1,
-0.380934, 0.5956099, -1.632358, 1, 1, 1, 1, 1,
-0.3771195, 0.7401469, -1.309984, 1, 1, 1, 1, 1,
-0.3728788, 0.6851253, 0.7253796, 1, 1, 1, 1, 1,
-0.3721075, -0.4770696, -2.408256, 1, 1, 1, 1, 1,
-0.3708213, -1.706465, -2.980108, 1, 1, 1, 1, 1,
-0.3699147, -0.8148037, -1.788493, 1, 1, 1, 1, 1,
-0.3621812, -0.6282855, -0.7696052, 1, 1, 1, 1, 1,
-0.3618113, -0.4011932, -2.692749, 1, 1, 1, 1, 1,
-0.3597374, 0.760681, -1.841194, 1, 1, 1, 1, 1,
-0.3591467, -0.3409099, -2.910159, 1, 1, 1, 1, 1,
-0.3576238, -0.4877874, -3.967753, 0, 0, 1, 1, 1,
-0.35359, 0.9102571, -1.253044, 1, 0, 0, 1, 1,
-0.3523815, -0.4348654, -2.613313, 1, 0, 0, 1, 1,
-0.3484763, -0.9858158, -1.98924, 1, 0, 0, 1, 1,
-0.3476591, -1.744384, -1.967526, 1, 0, 0, 1, 1,
-0.3462041, -1.065548, -5.234192, 1, 0, 0, 1, 1,
-0.3456104, 0.7713538, -0.3466855, 0, 0, 0, 1, 1,
-0.3418401, -1.71138, -3.09495, 0, 0, 0, 1, 1,
-0.3412887, -1.082697, -2.126586, 0, 0, 0, 1, 1,
-0.3406248, 1.820828, 2.405208, 0, 0, 0, 1, 1,
-0.3383849, -0.06533483, -0.545247, 0, 0, 0, 1, 1,
-0.3329141, -1.808593, -3.610459, 0, 0, 0, 1, 1,
-0.3300964, -0.6185256, -3.069116, 0, 0, 0, 1, 1,
-0.328675, 2.198881, -0.7890266, 1, 1, 1, 1, 1,
-0.3186994, -0.2277359, -1.600479, 1, 1, 1, 1, 1,
-0.3152365, 0.4589634, -0.7368808, 1, 1, 1, 1, 1,
-0.31396, -0.6915991, -2.420191, 1, 1, 1, 1, 1,
-0.307043, -0.5552849, -2.176163, 1, 1, 1, 1, 1,
-0.2984576, -0.2096062, -2.181976, 1, 1, 1, 1, 1,
-0.2978179, -1.079912, -3.38341, 1, 1, 1, 1, 1,
-0.2950052, -0.2040597, -3.292347, 1, 1, 1, 1, 1,
-0.2932017, 1.117596, 1.495651, 1, 1, 1, 1, 1,
-0.2890129, -0.6839597, -5.190583, 1, 1, 1, 1, 1,
-0.2876183, -1.286598, -2.515888, 1, 1, 1, 1, 1,
-0.284595, -0.7532659, -3.451654, 1, 1, 1, 1, 1,
-0.2825786, 1.098043, -0.0292907, 1, 1, 1, 1, 1,
-0.281171, -0.1418836, -2.694392, 1, 1, 1, 1, 1,
-0.2799024, -1.052627, -3.140736, 1, 1, 1, 1, 1,
-0.2761441, 0.5500138, -1.409694, 0, 0, 1, 1, 1,
-0.2732201, 0.5013291, -1.718239, 1, 0, 0, 1, 1,
-0.2724743, -0.5681288, -2.819608, 1, 0, 0, 1, 1,
-0.2707375, -2.671864, -2.938349, 1, 0, 0, 1, 1,
-0.2700854, -0.2835407, -0.9124337, 1, 0, 0, 1, 1,
-0.2695588, -1.534855, -3.306277, 1, 0, 0, 1, 1,
-0.2685454, 1.192744, 0.3670359, 0, 0, 0, 1, 1,
-0.2653421, -0.6420554, -4.366121, 0, 0, 0, 1, 1,
-0.2619969, -0.1695995, -3.212073, 0, 0, 0, 1, 1,
-0.2560153, -0.6192042, -2.810434, 0, 0, 0, 1, 1,
-0.2532658, 0.2123584, -1.053396, 0, 0, 0, 1, 1,
-0.2515715, -0.9020203, -1.61678, 0, 0, 0, 1, 1,
-0.249493, 1.307711, -0.2302718, 0, 0, 0, 1, 1,
-0.2447955, -0.06078492, -1.447368, 1, 1, 1, 1, 1,
-0.2446065, 0.4278054, 0.4739293, 1, 1, 1, 1, 1,
-0.2367303, -1.100957, -4.643844, 1, 1, 1, 1, 1,
-0.2352471, -0.4316247, -3.681821, 1, 1, 1, 1, 1,
-0.2315333, 0.4040887, -1.209179, 1, 1, 1, 1, 1,
-0.2302948, -1.687307, -1.568887, 1, 1, 1, 1, 1,
-0.2160069, -0.6954978, -2.832133, 1, 1, 1, 1, 1,
-0.2157662, -1.884341, -2.761371, 1, 1, 1, 1, 1,
-0.2124795, -0.02521719, -0.9283547, 1, 1, 1, 1, 1,
-0.210239, -0.8079515, -3.458202, 1, 1, 1, 1, 1,
-0.2084819, -0.0541726, -1.445024, 1, 1, 1, 1, 1,
-0.2074836, -0.8722357, -1.734444, 1, 1, 1, 1, 1,
-0.2052526, 0.03169074, -1.735672, 1, 1, 1, 1, 1,
-0.2036688, 0.3699684, -1.295662, 1, 1, 1, 1, 1,
-0.2017988, -0.230973, -2.42236, 1, 1, 1, 1, 1,
-0.2009075, 0.427888, -0.3354531, 0, 0, 1, 1, 1,
-0.197118, 1.189745, -1.165171, 1, 0, 0, 1, 1,
-0.1939513, 0.5272709, 1.337116, 1, 0, 0, 1, 1,
-0.190692, -1.274209, -3.157711, 1, 0, 0, 1, 1,
-0.1906263, -1.235844, -2.827591, 1, 0, 0, 1, 1,
-0.18946, 1.100715, -0.8320494, 1, 0, 0, 1, 1,
-0.1892495, 0.5929745, -1.76442, 0, 0, 0, 1, 1,
-0.1869823, 0.6746024, 1.341912, 0, 0, 0, 1, 1,
-0.18626, 0.017409, -1.585992, 0, 0, 0, 1, 1,
-0.1862321, -0.7199425, -2.394879, 0, 0, 0, 1, 1,
-0.1854686, -0.1007451, -4.191687, 0, 0, 0, 1, 1,
-0.1828586, 1.151394, -0.3209567, 0, 0, 0, 1, 1,
-0.1825515, -1.253163, -1.677903, 0, 0, 0, 1, 1,
-0.1823541, -2.377302, -2.883926, 1, 1, 1, 1, 1,
-0.1746148, -0.5559071, -3.279335, 1, 1, 1, 1, 1,
-0.174567, 0.09426631, -3.278842, 1, 1, 1, 1, 1,
-0.1712892, 0.493379, -0.6931584, 1, 1, 1, 1, 1,
-0.1667608, -0.1894634, -0.929428, 1, 1, 1, 1, 1,
-0.1664672, -0.9682183, -2.662143, 1, 1, 1, 1, 1,
-0.1647759, -1.48673, -2.511141, 1, 1, 1, 1, 1,
-0.1640682, -0.6028608, -3.921957, 1, 1, 1, 1, 1,
-0.160829, 0.001967065, -2.115447, 1, 1, 1, 1, 1,
-0.1605415, -1.181649, -3.639164, 1, 1, 1, 1, 1,
-0.156412, -0.2781786, -3.14119, 1, 1, 1, 1, 1,
-0.1551143, -0.6737224, -2.601448, 1, 1, 1, 1, 1,
-0.1512924, 0.3494183, 0.5650665, 1, 1, 1, 1, 1,
-0.147551, -0.4508158, -2.569483, 1, 1, 1, 1, 1,
-0.1416638, -0.6648483, -2.016579, 1, 1, 1, 1, 1,
-0.1390607, -0.379695, -2.391331, 0, 0, 1, 1, 1,
-0.1377937, -0.4432091, -1.595092, 1, 0, 0, 1, 1,
-0.1285928, 1.319788, 1.51175, 1, 0, 0, 1, 1,
-0.1220895, -1.592661, -4.18573, 1, 0, 0, 1, 1,
-0.1200347, -2.074437, -4.521164, 1, 0, 0, 1, 1,
-0.1176966, 0.8796893, -1.408022, 1, 0, 0, 1, 1,
-0.114173, 0.5361196, -0.6103328, 0, 0, 0, 1, 1,
-0.1125177, 0.3592423, 0.9356764, 0, 0, 0, 1, 1,
-0.109096, 0.9269782, -2.526379, 0, 0, 0, 1, 1,
-0.1063598, 1.236823, 0.6779663, 0, 0, 0, 1, 1,
-0.1035012, 0.2561443, 0.3676927, 0, 0, 0, 1, 1,
-0.1019337, 0.8398534, -0.3075515, 0, 0, 0, 1, 1,
-0.09664192, 0.7603682, -0.782962, 0, 0, 0, 1, 1,
-0.09617609, -0.1930074, -2.879268, 1, 1, 1, 1, 1,
-0.09375231, -1.235233, -3.167649, 1, 1, 1, 1, 1,
-0.09233439, -0.6473515, -3.323395, 1, 1, 1, 1, 1,
-0.0920188, -0.5270168, -1.906333, 1, 1, 1, 1, 1,
-0.09125023, 0.8119015, -0.7965101, 1, 1, 1, 1, 1,
-0.08895529, -0.0243024, -2.34628, 1, 1, 1, 1, 1,
-0.08470772, 0.6889763, -1.069724, 1, 1, 1, 1, 1,
-0.08452854, -0.7446072, -3.802286, 1, 1, 1, 1, 1,
-0.07858948, 0.6619182, 1.055524, 1, 1, 1, 1, 1,
-0.07734321, -1.103353, -2.845613, 1, 1, 1, 1, 1,
-0.07643654, 1.709078, 0.2065376, 1, 1, 1, 1, 1,
-0.07620145, 0.4363716, 0.171255, 1, 1, 1, 1, 1,
-0.07564393, -2.015505, -1.865431, 1, 1, 1, 1, 1,
-0.07484086, -0.5975608, -2.87178, 1, 1, 1, 1, 1,
-0.07326505, -0.2990722, -2.767305, 1, 1, 1, 1, 1,
-0.07189772, 1.154969, 0.3805368, 0, 0, 1, 1, 1,
-0.06808799, 1.053257, -0.5087853, 1, 0, 0, 1, 1,
-0.06157987, -0.4649926, -2.619976, 1, 0, 0, 1, 1,
-0.05614166, 1.262333, -1.804533, 1, 0, 0, 1, 1,
-0.05439211, 0.02502905, -0.7180319, 1, 0, 0, 1, 1,
-0.05291578, 0.5934414, 0.3956528, 1, 0, 0, 1, 1,
-0.05266294, 0.7389914, -0.2232233, 0, 0, 0, 1, 1,
-0.04766884, -0.2187294, -4.056427, 0, 0, 0, 1, 1,
-0.047538, 0.4234763, -0.1576785, 0, 0, 0, 1, 1,
-0.04551823, 1.136791, 1.326772, 0, 0, 0, 1, 1,
-0.04264697, 0.04471047, -1.901324, 0, 0, 0, 1, 1,
-0.03710881, 0.211533, 0.6398178, 0, 0, 0, 1, 1,
-0.03203158, -0.3310428, -2.493312, 0, 0, 0, 1, 1,
-0.02841055, 0.7976905, 1.69692, 1, 1, 1, 1, 1,
-0.0268914, -1.704116, -3.904526, 1, 1, 1, 1, 1,
-0.0193873, 2.431591, -0.4747328, 1, 1, 1, 1, 1,
-0.01589862, -0.8717102, -2.578623, 1, 1, 1, 1, 1,
-0.01525429, -0.7251307, -3.260931, 1, 1, 1, 1, 1,
-0.01110708, -2.22773, -2.773404, 1, 1, 1, 1, 1,
-0.008934662, -1.308865, -1.883704, 1, 1, 1, 1, 1,
-0.007259183, 1.679428, -0.5113229, 1, 1, 1, 1, 1,
-0.003817796, 0.2911731, -0.6248575, 1, 1, 1, 1, 1,
-0.002920576, 0.1538615, 0.7059299, 1, 1, 1, 1, 1,
-0.0009651359, -1.700327, -1.921757, 1, 1, 1, 1, 1,
-0.000622361, 1.266825, -0.1605652, 1, 1, 1, 1, 1,
0.0008333783, 0.7011721, -2.382852, 1, 1, 1, 1, 1,
0.003619618, 0.4568555, 1.008933, 1, 1, 1, 1, 1,
0.004953271, -0.5427612, 3.589682, 1, 1, 1, 1, 1,
0.01376354, -2.143463, 2.641016, 0, 0, 1, 1, 1,
0.01617314, 0.111589, 1.537782, 1, 0, 0, 1, 1,
0.02012224, 0.4369118, 0.2757053, 1, 0, 0, 1, 1,
0.02335214, 1.146466, -0.1578631, 1, 0, 0, 1, 1,
0.02513299, -0.3990618, 3.902573, 1, 0, 0, 1, 1,
0.02710016, -0.5824429, 4.535782, 1, 0, 0, 1, 1,
0.0277372, -0.2687994, 2.59978, 0, 0, 0, 1, 1,
0.02773945, -0.09330661, 4.143141, 0, 0, 0, 1, 1,
0.0287744, -1.759101, 3.687452, 0, 0, 0, 1, 1,
0.03133292, -0.4814794, 2.374882, 0, 0, 0, 1, 1,
0.03389886, -0.2796347, 1.699461, 0, 0, 0, 1, 1,
0.03484946, 1.428266, -0.8093451, 0, 0, 0, 1, 1,
0.03853564, -0.7824242, 3.246868, 0, 0, 0, 1, 1,
0.03971488, -0.00871776, -0.06961732, 1, 1, 1, 1, 1,
0.04166553, 0.6235117, -0.8296729, 1, 1, 1, 1, 1,
0.04497027, 0.3995572, -0.4262711, 1, 1, 1, 1, 1,
0.04558433, 0.4776273, 0.01535877, 1, 1, 1, 1, 1,
0.04755862, 0.5793794, 0.3844896, 1, 1, 1, 1, 1,
0.04908435, -0.1600781, 3.778364, 1, 1, 1, 1, 1,
0.04977611, 0.2074241, 0.5874068, 1, 1, 1, 1, 1,
0.0508626, -1.201515, 2.449178, 1, 1, 1, 1, 1,
0.05197334, 0.1546609, -0.01397686, 1, 1, 1, 1, 1,
0.05801049, 0.6851624, 1.19266, 1, 1, 1, 1, 1,
0.06029255, -1.546477, 3.063128, 1, 1, 1, 1, 1,
0.07271908, 0.8547528, -0.3094381, 1, 1, 1, 1, 1,
0.07580156, 2.035501, 0.1165868, 1, 1, 1, 1, 1,
0.081423, 0.6922618, -1.288671, 1, 1, 1, 1, 1,
0.08210845, 0.6608631, -0.3583734, 1, 1, 1, 1, 1,
0.08296433, 0.6466849, -0.1377605, 0, 0, 1, 1, 1,
0.08448694, 1.189788, -1.474775, 1, 0, 0, 1, 1,
0.08534795, -0.1359611, 3.12759, 1, 0, 0, 1, 1,
0.09628107, 1.109845, 1.016447, 1, 0, 0, 1, 1,
0.09827976, 1.107109, -3.020457, 1, 0, 0, 1, 1,
0.09851494, -1.00027, 3.103646, 1, 0, 0, 1, 1,
0.1000657, 1.38609, -0.6945348, 0, 0, 0, 1, 1,
0.100549, 0.9754081, -0.2346967, 0, 0, 0, 1, 1,
0.1123565, 0.2522029, -0.4191595, 0, 0, 0, 1, 1,
0.1252964, -0.471095, 1.88417, 0, 0, 0, 1, 1,
0.1283159, -0.1199577, 1.603194, 0, 0, 0, 1, 1,
0.1290084, -0.1059086, 2.350394, 0, 0, 0, 1, 1,
0.1317966, -0.7626113, 2.981447, 0, 0, 0, 1, 1,
0.1325091, -1.810317, 2.452123, 1, 1, 1, 1, 1,
0.133139, -0.7820155, 2.706672, 1, 1, 1, 1, 1,
0.1346707, 0.632338, -1.222062, 1, 1, 1, 1, 1,
0.1370942, -2.046276, 2.602422, 1, 1, 1, 1, 1,
0.1413272, -1.094173, 3.718634, 1, 1, 1, 1, 1,
0.142863, 1.806716, -0.6996521, 1, 1, 1, 1, 1,
0.1432389, 0.8684744, 2.359134, 1, 1, 1, 1, 1,
0.1435238, 0.6029245, -0.7350713, 1, 1, 1, 1, 1,
0.1450199, 0.3632808, -0.3549991, 1, 1, 1, 1, 1,
0.1456182, 1.674901, -1.372689, 1, 1, 1, 1, 1,
0.1457238, -1.313677, 5.730484, 1, 1, 1, 1, 1,
0.146235, -1.364751, 1.817817, 1, 1, 1, 1, 1,
0.1477532, -0.02098581, 1.694331, 1, 1, 1, 1, 1,
0.1503084, -1.672284, 2.713312, 1, 1, 1, 1, 1,
0.1556653, 0.1993823, 0.360441, 1, 1, 1, 1, 1,
0.1560033, 0.2965611, 0.779276, 0, 0, 1, 1, 1,
0.1564538, 0.5095979, -2.522541, 1, 0, 0, 1, 1,
0.1630586, 1.205685, 0.4016493, 1, 0, 0, 1, 1,
0.1745283, 0.842414, 1.802423, 1, 0, 0, 1, 1,
0.1761798, -2.068468, 1.350495, 1, 0, 0, 1, 1,
0.1762578, 2.036825, 2.47011, 1, 0, 0, 1, 1,
0.180205, 0.5392768, 0.006746694, 0, 0, 0, 1, 1,
0.1822089, -0.6663259, 4.225899, 0, 0, 0, 1, 1,
0.1825292, 1.744379, -1.337488, 0, 0, 0, 1, 1,
0.1839357, 0.06006583, 2.318612, 0, 0, 0, 1, 1,
0.1852186, -1.792183, 1.223312, 0, 0, 0, 1, 1,
0.185578, -0.218481, 2.16883, 0, 0, 0, 1, 1,
0.1877259, 0.09441682, -0.4430588, 0, 0, 0, 1, 1,
0.1917062, -0.08161274, 1.659079, 1, 1, 1, 1, 1,
0.1944263, -0.7575395, 2.734315, 1, 1, 1, 1, 1,
0.1951638, -0.4634364, 3.004517, 1, 1, 1, 1, 1,
0.2034492, 0.7634867, -0.06302809, 1, 1, 1, 1, 1,
0.2113957, -1.198526, 4.225583, 1, 1, 1, 1, 1,
0.2126437, -0.1850388, 3.035105, 1, 1, 1, 1, 1,
0.2134277, -0.1786439, 2.505441, 1, 1, 1, 1, 1,
0.214693, 0.3206516, 1.175099, 1, 1, 1, 1, 1,
0.2180564, 1.209186, 0.2508391, 1, 1, 1, 1, 1,
0.2220265, 1.313302, -0.08954462, 1, 1, 1, 1, 1,
0.2257216, 1.429668, -0.4512964, 1, 1, 1, 1, 1,
0.2263243, -1.061632, 3.962523, 1, 1, 1, 1, 1,
0.2298647, 1.205231, -0.09053248, 1, 1, 1, 1, 1,
0.2321149, 0.7919964, 0.9914554, 1, 1, 1, 1, 1,
0.2324003, 0.1664787, 1.237852, 1, 1, 1, 1, 1,
0.2328518, -0.6631483, 3.447564, 0, 0, 1, 1, 1,
0.2359502, -0.05816283, 2.997431, 1, 0, 0, 1, 1,
0.2416451, -0.4927833, 3.376651, 1, 0, 0, 1, 1,
0.242449, 1.638768, 0.005093454, 1, 0, 0, 1, 1,
0.2470896, 1.022306, -0.380729, 1, 0, 0, 1, 1,
0.2482622, -0.7071031, 1.851488, 1, 0, 0, 1, 1,
0.250267, -1.577363, 1.594013, 0, 0, 0, 1, 1,
0.2612407, -0.4859666, 2.591702, 0, 0, 0, 1, 1,
0.2616256, -0.5625027, 2.846315, 0, 0, 0, 1, 1,
0.2627618, -0.02289294, -0.5426462, 0, 0, 0, 1, 1,
0.2639391, 0.2860583, 0.3920675, 0, 0, 0, 1, 1,
0.265913, 0.5018696, 1.489769, 0, 0, 0, 1, 1,
0.2699931, -1.128577, 4.259416, 0, 0, 0, 1, 1,
0.2721497, 1.206436, 1.615838, 1, 1, 1, 1, 1,
0.2725278, -0.8855864, 4.380582, 1, 1, 1, 1, 1,
0.2752722, -0.2843429, 0.8039128, 1, 1, 1, 1, 1,
0.2795971, -2.268643, 3.181183, 1, 1, 1, 1, 1,
0.2801953, -1.548798, 2.306062, 1, 1, 1, 1, 1,
0.2806471, -0.4412237, 3.050745, 1, 1, 1, 1, 1,
0.288968, -1.517852, 2.528168, 1, 1, 1, 1, 1,
0.2904294, -0.184053, 2.244669, 1, 1, 1, 1, 1,
0.2970041, -0.4203958, 1.793995, 1, 1, 1, 1, 1,
0.3017571, 1.025627, 0.6728812, 1, 1, 1, 1, 1,
0.3027738, 2.017663, -0.2133012, 1, 1, 1, 1, 1,
0.3052225, -2.07691, 3.556055, 1, 1, 1, 1, 1,
0.3097833, -0.9509087, 0.7366123, 1, 1, 1, 1, 1,
0.3134142, 0.226749, 0.1679405, 1, 1, 1, 1, 1,
0.3134753, 1.046465, -0.846911, 1, 1, 1, 1, 1,
0.3188707, -0.01556686, 3.743727, 0, 0, 1, 1, 1,
0.3211345, 0.881749, 0.9115726, 1, 0, 0, 1, 1,
0.3239265, -0.7743114, 4.105952, 1, 0, 0, 1, 1,
0.327286, 0.3087452, 0.5286586, 1, 0, 0, 1, 1,
0.3276494, -0.3234595, 0.4854649, 1, 0, 0, 1, 1,
0.3318835, 0.4644147, -0.8100982, 1, 0, 0, 1, 1,
0.3331499, 2.193249, -0.7551749, 0, 0, 0, 1, 1,
0.3350731, 0.6961764, 1.254207, 0, 0, 0, 1, 1,
0.3385971, 0.5149026, 2.268505, 0, 0, 0, 1, 1,
0.3391077, 0.06075456, 2.297267, 0, 0, 0, 1, 1,
0.3472687, -0.5431338, 2.859154, 0, 0, 0, 1, 1,
0.3579951, 0.4443852, 1.854775, 0, 0, 0, 1, 1,
0.3599624, -0.5491128, 1.743398, 0, 0, 0, 1, 1,
0.3692275, -0.8925525, 1.427226, 1, 1, 1, 1, 1,
0.3758209, 1.475206, -1.209129, 1, 1, 1, 1, 1,
0.3760572, 1.586432, 1.802896, 1, 1, 1, 1, 1,
0.3765315, -0.2259345, 2.271837, 1, 1, 1, 1, 1,
0.3827414, 0.2686189, 2.933867, 1, 1, 1, 1, 1,
0.3881457, -1.614405, 2.184925, 1, 1, 1, 1, 1,
0.3881603, 1.837815, 2.822083, 1, 1, 1, 1, 1,
0.3891703, -1.362201, 3.873318, 1, 1, 1, 1, 1,
0.3924538, 1.1494, -0.2340074, 1, 1, 1, 1, 1,
0.3994813, 2.631258, 1.510165, 1, 1, 1, 1, 1,
0.4012176, 0.8829063, -0.9741954, 1, 1, 1, 1, 1,
0.4027095, 0.7309145, 1.022147, 1, 1, 1, 1, 1,
0.4029133, 0.365991, 0.9906889, 1, 1, 1, 1, 1,
0.4040708, -0.402318, 1.490216, 1, 1, 1, 1, 1,
0.4126172, -1.627653, 2.778895, 1, 1, 1, 1, 1,
0.4147139, -0.6891669, 1.376974, 0, 0, 1, 1, 1,
0.41908, -0.5044279, 2.764745, 1, 0, 0, 1, 1,
0.4195348, 0.5526066, 0.3906575, 1, 0, 0, 1, 1,
0.4204895, -2.143828, 2.539595, 1, 0, 0, 1, 1,
0.4236903, -0.8190987, 0.9431649, 1, 0, 0, 1, 1,
0.4254371, 0.6483021, -0.2067089, 1, 0, 0, 1, 1,
0.4303481, 1.326344, -0.2816432, 0, 0, 0, 1, 1,
0.4317599, -0.1775739, 1.980096, 0, 0, 0, 1, 1,
0.4325657, -0.07538596, 2.091324, 0, 0, 0, 1, 1,
0.433877, 0.4421297, 0.3989883, 0, 0, 0, 1, 1,
0.4378768, -1.192976, 1.741708, 0, 0, 0, 1, 1,
0.4397584, 0.4025794, 2.859059, 0, 0, 0, 1, 1,
0.4408485, -0.007354552, 2.245068, 0, 0, 0, 1, 1,
0.4427947, -0.7456086, 1.988325, 1, 1, 1, 1, 1,
0.447021, -1.264055, 3.34202, 1, 1, 1, 1, 1,
0.4481286, -0.4830557, 1.181535, 1, 1, 1, 1, 1,
0.4490765, -1.202041, 3.990002, 1, 1, 1, 1, 1,
0.4524164, -0.08162114, 2.681676, 1, 1, 1, 1, 1,
0.4543599, -0.5641435, 4.24963, 1, 1, 1, 1, 1,
0.4545161, -0.6402611, 2.086484, 1, 1, 1, 1, 1,
0.4634672, 1.481337, 0.7345232, 1, 1, 1, 1, 1,
0.4638904, -0.7052853, 1.71843, 1, 1, 1, 1, 1,
0.4639035, 0.5286215, 0.300472, 1, 1, 1, 1, 1,
0.4681356, -0.6024569, 1.693486, 1, 1, 1, 1, 1,
0.469041, 0.1063138, 2.728975, 1, 1, 1, 1, 1,
0.4768103, -0.2424827, 2.79261, 1, 1, 1, 1, 1,
0.4839494, 0.2048517, 1.259791, 1, 1, 1, 1, 1,
0.4885685, -0.4287427, 1.523235, 1, 1, 1, 1, 1,
0.4908927, -0.8555324, 0.9833594, 0, 0, 1, 1, 1,
0.4928293, 0.6548299, -0.4066764, 1, 0, 0, 1, 1,
0.495803, -0.6722017, 2.269087, 1, 0, 0, 1, 1,
0.4969972, 1.085707, 0.9087644, 1, 0, 0, 1, 1,
0.4984959, 0.830809, 0.8261868, 1, 0, 0, 1, 1,
0.5066644, -0.1437571, 2.028478, 1, 0, 0, 1, 1,
0.5083314, 0.9684423, 0.8646636, 0, 0, 0, 1, 1,
0.5091139, -0.4523219, 1.432141, 0, 0, 0, 1, 1,
0.5091297, -2.03401, 1.592314, 0, 0, 0, 1, 1,
0.5106669, 0.8344852, -0.3275035, 0, 0, 0, 1, 1,
0.5238304, -0.681092, 1.684697, 0, 0, 0, 1, 1,
0.5249271, -0.08748359, 1.611761, 0, 0, 0, 1, 1,
0.5257379, -0.3879794, 1.057399, 0, 0, 0, 1, 1,
0.5262584, -0.04678554, 1.630945, 1, 1, 1, 1, 1,
0.5283003, -0.6803957, 1.694201, 1, 1, 1, 1, 1,
0.5287039, -1.064448, 1.837812, 1, 1, 1, 1, 1,
0.5290471, -1.441352, 2.263299, 1, 1, 1, 1, 1,
0.5300068, 0.2576815, -0.01129454, 1, 1, 1, 1, 1,
0.533427, -0.1910379, 2.446615, 1, 1, 1, 1, 1,
0.5390745, 0.1269849, 1.241601, 1, 1, 1, 1, 1,
0.5435224, 0.5960954, -0.7979265, 1, 1, 1, 1, 1,
0.5450351, 0.7395294, 0.8234659, 1, 1, 1, 1, 1,
0.5512356, 0.2050685, -0.9312944, 1, 1, 1, 1, 1,
0.5514544, 0.7606956, 0.7762089, 1, 1, 1, 1, 1,
0.5553361, -1.28466, 2.811169, 1, 1, 1, 1, 1,
0.556107, -1.473788, 4.452652, 1, 1, 1, 1, 1,
0.5601419, -0.8584272, 1.620837, 1, 1, 1, 1, 1,
0.5616177, -1.678237, 3.677666, 1, 1, 1, 1, 1,
0.562129, -0.2609781, 1.821396, 0, 0, 1, 1, 1,
0.5622618, -2.274265, 2.848181, 1, 0, 0, 1, 1,
0.5681327, 1.951764, -0.9320349, 1, 0, 0, 1, 1,
0.5684932, 0.7214352, 0.2149152, 1, 0, 0, 1, 1,
0.5748957, -0.1063843, 3.377347, 1, 0, 0, 1, 1,
0.578034, 0.950424, -0.6164021, 1, 0, 0, 1, 1,
0.5795202, 0.7611443, -0.6644465, 0, 0, 0, 1, 1,
0.5819366, -0.6623921, 4.267468, 0, 0, 0, 1, 1,
0.5875176, -0.3488363, 1.047214, 0, 0, 0, 1, 1,
0.5942544, -0.7470462, 0.8969203, 0, 0, 0, 1, 1,
0.5959833, -0.5159487, 1.514867, 0, 0, 0, 1, 1,
0.6003959, -0.08631199, 1.34007, 0, 0, 0, 1, 1,
0.6013695, 1.193016, -0.9777768, 0, 0, 0, 1, 1,
0.6064822, 1.128556, 0.3079273, 1, 1, 1, 1, 1,
0.609485, -0.440321, 2.623142, 1, 1, 1, 1, 1,
0.6129693, -0.0245997, 1.782508, 1, 1, 1, 1, 1,
0.61434, 0.9134798, 0.8172895, 1, 1, 1, 1, 1,
0.6145982, 0.9539475, 0.578464, 1, 1, 1, 1, 1,
0.6149362, -0.5268134, 1.233946, 1, 1, 1, 1, 1,
0.6168979, 1.070597, 2.125022, 1, 1, 1, 1, 1,
0.6347615, -1.346449, 2.573959, 1, 1, 1, 1, 1,
0.6403269, 0.7956358, 0.7879236, 1, 1, 1, 1, 1,
0.6416311, -0.3476234, 2.199897, 1, 1, 1, 1, 1,
0.6446258, 1.624725, -0.5133074, 1, 1, 1, 1, 1,
0.6451218, -1.958046, 0.315748, 1, 1, 1, 1, 1,
0.648895, 0.317838, 0.09511841, 1, 1, 1, 1, 1,
0.6491264, -1.283964, 2.988209, 1, 1, 1, 1, 1,
0.6492046, 2.053327, 0.8300566, 1, 1, 1, 1, 1,
0.6506314, -2.17753, 3.141212, 0, 0, 1, 1, 1,
0.6544769, 0.5173482, 0.8592951, 1, 0, 0, 1, 1,
0.6589285, 0.3076576, -1.499315, 1, 0, 0, 1, 1,
0.6605269, -0.3866264, 3.543629, 1, 0, 0, 1, 1,
0.6619868, 1.289934, 1.831811, 1, 0, 0, 1, 1,
0.668551, 0.8520495, 1.687288, 1, 0, 0, 1, 1,
0.6700558, 0.7593164, -0.6120534, 0, 0, 0, 1, 1,
0.674724, 1.443877, 0.8253325, 0, 0, 0, 1, 1,
0.6767218, 0.03210951, 1.830024, 0, 0, 0, 1, 1,
0.6773255, 0.0003246347, -0.5156825, 0, 0, 0, 1, 1,
0.679158, -0.3144547, 3.502164, 0, 0, 0, 1, 1,
0.6849709, -2.120706, 3.9582, 0, 0, 0, 1, 1,
0.6854067, 0.2077843, 2.235664, 0, 0, 0, 1, 1,
0.6889209, 1.780036, -0.3740275, 1, 1, 1, 1, 1,
0.6905824, -0.6651028, 0.7741778, 1, 1, 1, 1, 1,
0.6925778, 0.3450161, -0.0821942, 1, 1, 1, 1, 1,
0.6926044, -0.4667394, 2.114104, 1, 1, 1, 1, 1,
0.6932394, -0.9477547, 1.982698, 1, 1, 1, 1, 1,
0.6979182, 1.197298, -0.170012, 1, 1, 1, 1, 1,
0.6981441, 1.28222, 0.3020067, 1, 1, 1, 1, 1,
0.7036694, -0.9683642, 0.9608558, 1, 1, 1, 1, 1,
0.7152294, -0.479391, 2.243665, 1, 1, 1, 1, 1,
0.7161181, 0.8423852, -2.416103, 1, 1, 1, 1, 1,
0.7167607, -0.2688013, 1.314155, 1, 1, 1, 1, 1,
0.7213689, 0.4678572, 1.529565, 1, 1, 1, 1, 1,
0.7224196, -0.4842442, 2.365927, 1, 1, 1, 1, 1,
0.7301761, -0.02510773, 1.17805, 1, 1, 1, 1, 1,
0.7305606, -0.1917852, 2.682517, 1, 1, 1, 1, 1,
0.7307078, -0.1143645, 1.935209, 0, 0, 1, 1, 1,
0.7315136, -0.9322574, 1.389139, 1, 0, 0, 1, 1,
0.7367138, -0.06478024, 2.031227, 1, 0, 0, 1, 1,
0.737863, 0.1234286, 2.056996, 1, 0, 0, 1, 1,
0.7384006, -1.235806, 2.921485, 1, 0, 0, 1, 1,
0.7403837, -1.0429, 2.757313, 1, 0, 0, 1, 1,
0.7409879, 0.2881635, 0.8302323, 0, 0, 0, 1, 1,
0.7413372, -1.159249, 1.234312, 0, 0, 0, 1, 1,
0.7416611, -0.9852865, 3.187363, 0, 0, 0, 1, 1,
0.7480065, -1.334502, 1.568267, 0, 0, 0, 1, 1,
0.7578347, 0.003963633, 1.18262, 0, 0, 0, 1, 1,
0.7652219, -0.2505689, 1.988499, 0, 0, 0, 1, 1,
0.7677981, 0.9967734, 2.318094, 0, 0, 0, 1, 1,
0.7703604, 0.0601548, -0.1727858, 1, 1, 1, 1, 1,
0.7772036, 1.843563, -0.2389635, 1, 1, 1, 1, 1,
0.7781861, -0.6182815, 2.531904, 1, 1, 1, 1, 1,
0.7797533, -0.5971578, 1.827302, 1, 1, 1, 1, 1,
0.7842947, -0.2246755, 0.382952, 1, 1, 1, 1, 1,
0.7848584, 0.3108987, 2.044435, 1, 1, 1, 1, 1,
0.7922613, -0.2632369, 2.562004, 1, 1, 1, 1, 1,
0.7924154, 1.580002, 2.001433, 1, 1, 1, 1, 1,
0.7955775, 0.2920562, 0.3027193, 1, 1, 1, 1, 1,
0.7997098, 1.983149, -0.5010156, 1, 1, 1, 1, 1,
0.8050839, 0.1734351, 2.001911, 1, 1, 1, 1, 1,
0.8092154, 1.466178, 0.8815445, 1, 1, 1, 1, 1,
0.8094366, 0.3271086, 2.501581, 1, 1, 1, 1, 1,
0.8117158, 1.158003, -0.3590141, 1, 1, 1, 1, 1,
0.8126594, 0.1736166, 1.992879, 1, 1, 1, 1, 1,
0.8160267, 0.9546473, -0.1298126, 0, 0, 1, 1, 1,
0.8183994, 1.735793, 1.813609, 1, 0, 0, 1, 1,
0.8197699, -1.289089, 0.5707092, 1, 0, 0, 1, 1,
0.828289, 0.9106266, 0.1554953, 1, 0, 0, 1, 1,
0.8288587, 0.0699134, 1.90153, 1, 0, 0, 1, 1,
0.8297796, -1.301646, 2.525469, 1, 0, 0, 1, 1,
0.8318259, 0.9471394, 1.088879, 0, 0, 0, 1, 1,
0.8341255, -0.7995571, 2.111429, 0, 0, 0, 1, 1,
0.8353022, -2.208627, 0.4757839, 0, 0, 0, 1, 1,
0.8371097, 0.2022259, 0.7863243, 0, 0, 0, 1, 1,
0.8399197, 0.804486, 1.119846, 0, 0, 0, 1, 1,
0.8448004, 0.06670211, 0.5675045, 0, 0, 0, 1, 1,
0.852646, 1.209345, 1.75559, 0, 0, 0, 1, 1,
0.8557849, 0.3586781, 0.7480937, 1, 1, 1, 1, 1,
0.8565594, -0.2900827, 1.900549, 1, 1, 1, 1, 1,
0.8571346, -2.533856, 2.517946, 1, 1, 1, 1, 1,
0.8582945, -0.878274, 2.283535, 1, 1, 1, 1, 1,
0.8616468, -0.1290632, 2.136618, 1, 1, 1, 1, 1,
0.8629492, -0.2131356, 1.240455, 1, 1, 1, 1, 1,
0.8633916, 0.3899779, 1.150569, 1, 1, 1, 1, 1,
0.8669714, 0.7768097, 0.5952697, 1, 1, 1, 1, 1,
0.8733348, -3.522112, 2.985921, 1, 1, 1, 1, 1,
0.8803662, 1.282567, -0.6268855, 1, 1, 1, 1, 1,
0.8864182, -1.134239, 1.255905, 1, 1, 1, 1, 1,
0.889459, -0.1637737, 2.355622, 1, 1, 1, 1, 1,
0.8981047, -0.223726, 0.7368274, 1, 1, 1, 1, 1,
0.8995029, 1.259009, 0.7685015, 1, 1, 1, 1, 1,
0.9144245, -1.021021, 1.945415, 1, 1, 1, 1, 1,
0.9158385, 0.1302876, 1.6074, 0, 0, 1, 1, 1,
0.9186621, 0.2116386, 2.048294, 1, 0, 0, 1, 1,
0.9204376, 1.662409, 0.5983409, 1, 0, 0, 1, 1,
0.9208109, -0.493583, 1.159468, 1, 0, 0, 1, 1,
0.9221529, -1.124058, 3.215766, 1, 0, 0, 1, 1,
0.9257579, -0.859121, 1.602106, 1, 0, 0, 1, 1,
0.9268889, -0.4334191, 0.8583695, 0, 0, 0, 1, 1,
0.9271948, 1.717645, -2.01345, 0, 0, 0, 1, 1,
0.9278036, 1.716248, -0.6032481, 0, 0, 0, 1, 1,
0.9303262, -0.1796758, 0.3276079, 0, 0, 0, 1, 1,
0.9312413, -0.5055279, 2.556829, 0, 0, 0, 1, 1,
0.9334118, 0.4730811, 1.986417, 0, 0, 0, 1, 1,
0.9353685, -0.1295019, 1.315532, 0, 0, 0, 1, 1,
0.9375118, -0.1770047, 3.161973, 1, 1, 1, 1, 1,
0.9392126, 0.4493767, -0.5331627, 1, 1, 1, 1, 1,
0.9401851, 1.291517, 0.975911, 1, 1, 1, 1, 1,
0.9445745, 3.06813, 0.5087273, 1, 1, 1, 1, 1,
0.9468608, 0.6451748, 0.5406412, 1, 1, 1, 1, 1,
0.9481484, -0.2625414, 1.633818, 1, 1, 1, 1, 1,
0.9521124, 0.1642382, -0.5063713, 1, 1, 1, 1, 1,
0.9577426, -0.6084477, 2.579302, 1, 1, 1, 1, 1,
0.9589888, -0.2390655, 3.617608, 1, 1, 1, 1, 1,
0.9708364, -0.1204997, 0.280102, 1, 1, 1, 1, 1,
0.979613, 1.330094, 2.761632, 1, 1, 1, 1, 1,
0.9876611, 0.8412313, 0.1175527, 1, 1, 1, 1, 1,
0.9891704, 0.3754581, 1.989847, 1, 1, 1, 1, 1,
0.9924433, 0.7234235, 1.072482, 1, 1, 1, 1, 1,
0.9947857, 0.3143519, 2.992425, 1, 1, 1, 1, 1,
1.000352, 2.218498, 0.3373569, 0, 0, 1, 1, 1,
1.00066, -0.06471173, 1.036433, 1, 0, 0, 1, 1,
1.015482, -2.447046, 4.104722, 1, 0, 0, 1, 1,
1.015657, 2.618365, 0.5003816, 1, 0, 0, 1, 1,
1.017366, -1.267009, 3.229601, 1, 0, 0, 1, 1,
1.02751, 0.65277, 1.717799, 1, 0, 0, 1, 1,
1.032276, -0.5571591, 2.362873, 0, 0, 0, 1, 1,
1.032952, -0.2494758, 2.870339, 0, 0, 0, 1, 1,
1.038018, 0.8783234, -0.67269, 0, 0, 0, 1, 1,
1.045194, 0.04138486, 1.31997, 0, 0, 0, 1, 1,
1.047608, 0.09823522, 1.670619, 0, 0, 0, 1, 1,
1.050453, 0.7146134, 1.817644, 0, 0, 0, 1, 1,
1.051206, 0.07499679, 1.828776, 0, 0, 0, 1, 1,
1.062725, -0.8407733, 1.868756, 1, 1, 1, 1, 1,
1.074254, 0.4051701, 2.177593, 1, 1, 1, 1, 1,
1.083883, 1.114791, 2.250256, 1, 1, 1, 1, 1,
1.092121, 0.2636536, 0.7452134, 1, 1, 1, 1, 1,
1.092206, 0.08296177, 3.91018, 1, 1, 1, 1, 1,
1.092982, -0.9402974, 2.024251, 1, 1, 1, 1, 1,
1.095762, -0.2926068, 1.734987, 1, 1, 1, 1, 1,
1.100248, 1.393949, 0.8940117, 1, 1, 1, 1, 1,
1.102932, -1.536164, 2.131453, 1, 1, 1, 1, 1,
1.123797, 0.5598623, 2.781814, 1, 1, 1, 1, 1,
1.129474, -0.513202, 3.441869, 1, 1, 1, 1, 1,
1.133186, 1.007115, 2.03934, 1, 1, 1, 1, 1,
1.133928, 0.272395, 1.109022, 1, 1, 1, 1, 1,
1.136973, -0.08896489, 1.291645, 1, 1, 1, 1, 1,
1.155683, 0.2973504, 2.01137, 1, 1, 1, 1, 1,
1.162198, -0.1876554, 2.371653, 0, 0, 1, 1, 1,
1.171336, 0.1762362, 2.325419, 1, 0, 0, 1, 1,
1.173297, 1.918797, 0.9159663, 1, 0, 0, 1, 1,
1.176044, -0.5531543, 1.578089, 1, 0, 0, 1, 1,
1.189634, -1.124351, 2.623761, 1, 0, 0, 1, 1,
1.190032, 0.03416708, -0.2866587, 1, 0, 0, 1, 1,
1.191112, -1.661969, 3.321813, 0, 0, 0, 1, 1,
1.192809, -0.2169985, 0.6196508, 0, 0, 0, 1, 1,
1.194013, -0.3778595, 1.785279, 0, 0, 0, 1, 1,
1.194556, -0.2099273, 2.041036, 0, 0, 0, 1, 1,
1.194655, 1.289482, 2.148088, 0, 0, 0, 1, 1,
1.198782, -0.3625507, 2.733245, 0, 0, 0, 1, 1,
1.20187, 0.8137628, 0.03034704, 0, 0, 0, 1, 1,
1.205518, 0.3229003, 1.849972, 1, 1, 1, 1, 1,
1.208011, -0.08425467, 2.188092, 1, 1, 1, 1, 1,
1.209669, -0.007530529, 1.497768, 1, 1, 1, 1, 1,
1.213046, -2.614236, 1.13811, 1, 1, 1, 1, 1,
1.213236, 0.4251333, 0.1688877, 1, 1, 1, 1, 1,
1.213274, 0.7615465, 2.155922, 1, 1, 1, 1, 1,
1.215651, 0.5688946, 0.8507987, 1, 1, 1, 1, 1,
1.21799, -1.93933, 2.266444, 1, 1, 1, 1, 1,
1.225393, 0.5278441, 0.6722924, 1, 1, 1, 1, 1,
1.229463, 0.5601881, 1.231932, 1, 1, 1, 1, 1,
1.237629, 0.2356391, 1.51762, 1, 1, 1, 1, 1,
1.237764, 1.344275, -0.3824964, 1, 1, 1, 1, 1,
1.238719, -0.4321705, 2.606054, 1, 1, 1, 1, 1,
1.239285, 0.4844921, 2.794588, 1, 1, 1, 1, 1,
1.2447, 0.4497061, 2.102217, 1, 1, 1, 1, 1,
1.251184, 0.5081468, -1.74674, 0, 0, 1, 1, 1,
1.257671, 0.7625024, 0.4827588, 1, 0, 0, 1, 1,
1.262436, 0.9189196, 2.008146, 1, 0, 0, 1, 1,
1.26348, 0.6703643, 1.953998, 1, 0, 0, 1, 1,
1.276643, 1.987567, 0.161281, 1, 0, 0, 1, 1,
1.293637, 3.106994, 1.073268, 1, 0, 0, 1, 1,
1.295394, -1.099154, 2.365936, 0, 0, 0, 1, 1,
1.296534, 0.1477283, 1.881864, 0, 0, 0, 1, 1,
1.302538, 0.3537755, 1.287374, 0, 0, 0, 1, 1,
1.31174, -0.4506667, 1.596668, 0, 0, 0, 1, 1,
1.312113, 1.90735, -0.3964583, 0, 0, 0, 1, 1,
1.312579, 0.9340324, 0.4187126, 0, 0, 0, 1, 1,
1.31298, 1.220951, -0.2095424, 0, 0, 0, 1, 1,
1.313039, -0.6260594, 1.299767, 1, 1, 1, 1, 1,
1.320166, 0.6948367, 0.947305, 1, 1, 1, 1, 1,
1.338862, 1.268447, 0.5505875, 1, 1, 1, 1, 1,
1.342719, 1.036942, 0.7516609, 1, 1, 1, 1, 1,
1.350199, 0.2427547, 1.755628, 1, 1, 1, 1, 1,
1.359183, 1.553005, 0.5540341, 1, 1, 1, 1, 1,
1.366924, -0.2429907, 0.721045, 1, 1, 1, 1, 1,
1.371896, 1.074223, 0.8019186, 1, 1, 1, 1, 1,
1.377439, 0.8065397, -0.4057252, 1, 1, 1, 1, 1,
1.377532, 0.3343803, 1.50181, 1, 1, 1, 1, 1,
1.386862, 1.351523, 1.682243, 1, 1, 1, 1, 1,
1.388552, -0.2321756, 2.061697, 1, 1, 1, 1, 1,
1.395239, -1.853617, 2.134732, 1, 1, 1, 1, 1,
1.399471, -0.04791954, 4.312463, 1, 1, 1, 1, 1,
1.404472, 1.131787, 1.061271, 1, 1, 1, 1, 1,
1.404847, -2.749577, 1.214061, 0, 0, 1, 1, 1,
1.40497, -0.8898095, 4.533466, 1, 0, 0, 1, 1,
1.405278, -0.5613892, 2.539902, 1, 0, 0, 1, 1,
1.408831, -0.3479847, 1.349271, 1, 0, 0, 1, 1,
1.41161, -0.1508635, 2.163777, 1, 0, 0, 1, 1,
1.412158, 0.3386484, 2.660441, 1, 0, 0, 1, 1,
1.41742, 1.788644, 2.563472, 0, 0, 0, 1, 1,
1.438432, 3.934464, 0.4174668, 0, 0, 0, 1, 1,
1.45256, -2.639244, 1.365834, 0, 0, 0, 1, 1,
1.47481, -0.4553905, 3.756152, 0, 0, 0, 1, 1,
1.483442, -0.884289, 1.844796, 0, 0, 0, 1, 1,
1.487263, -0.837402, 2.404391, 0, 0, 0, 1, 1,
1.487747, -0.3434884, 3.82325, 0, 0, 0, 1, 1,
1.490061, -1.296542, 1.644845, 1, 1, 1, 1, 1,
1.504512, 0.1810719, 0.2888233, 1, 1, 1, 1, 1,
1.507625, -0.3098598, 0.3794026, 1, 1, 1, 1, 1,
1.550612, -0.4526146, 1.81443, 1, 1, 1, 1, 1,
1.554442, -0.6802383, 1.138126, 1, 1, 1, 1, 1,
1.56707, -2.298266, 3.427135, 1, 1, 1, 1, 1,
1.567629, 1.286065, 0.595521, 1, 1, 1, 1, 1,
1.577307, -0.351059, 1.589438, 1, 1, 1, 1, 1,
1.578424, 1.602978, -0.4227766, 1, 1, 1, 1, 1,
1.578693, -1.403698, 3.195299, 1, 1, 1, 1, 1,
1.583592, -0.5832769, 1.115212, 1, 1, 1, 1, 1,
1.612133, 0.6347049, 0.5584738, 1, 1, 1, 1, 1,
1.618712, -0.1070189, 2.224429, 1, 1, 1, 1, 1,
1.620652, 0.7375929, 2.645085, 1, 1, 1, 1, 1,
1.620889, -0.6879745, 0.5050954, 1, 1, 1, 1, 1,
1.621101, -1.130204, 1.380501, 0, 0, 1, 1, 1,
1.647479, -1.23954, 0.8687584, 1, 0, 0, 1, 1,
1.662889, 0.00980971, 1.330337, 1, 0, 0, 1, 1,
1.689441, 0.9551848, 1.504646, 1, 0, 0, 1, 1,
1.71732, -0.09015691, 1.244702, 1, 0, 0, 1, 1,
1.720403, 0.7862844, 0.04256181, 1, 0, 0, 1, 1,
1.72359, -1.041801, 2.422156, 0, 0, 0, 1, 1,
1.739343, 0.223902, 0.5571733, 0, 0, 0, 1, 1,
1.754827, 1.313801, 1.865813, 0, 0, 0, 1, 1,
1.787832, 0.1882582, 0.5760863, 0, 0, 0, 1, 1,
1.825505, 0.9453225, 0.8719401, 0, 0, 0, 1, 1,
1.848933, 0.7990767, 1.185408, 0, 0, 0, 1, 1,
1.85016, -1.738022, 4.506533, 0, 0, 0, 1, 1,
1.850733, 0.7897081, -0.4280712, 1, 1, 1, 1, 1,
1.853348, -0.869011, 3.645838, 1, 1, 1, 1, 1,
1.884082, 0.3296838, 1.108417, 1, 1, 1, 1, 1,
1.916702, 1.221244, -1.090762, 1, 1, 1, 1, 1,
1.955702, 0.2304948, 1.955137, 1, 1, 1, 1, 1,
1.955907, 0.678708, 0.7662581, 1, 1, 1, 1, 1,
1.961043, -0.4751111, 2.185274, 1, 1, 1, 1, 1,
1.967578, -0.6866486, 2.042166, 1, 1, 1, 1, 1,
1.992364, 0.3258059, 1.441289, 1, 1, 1, 1, 1,
1.997092, 1.67823, 1.052758, 1, 1, 1, 1, 1,
2.011271, 0.4916407, 1.453695, 1, 1, 1, 1, 1,
2.020717, -0.03758177, 2.309176, 1, 1, 1, 1, 1,
2.077534, -0.2181794, 3.096464, 1, 1, 1, 1, 1,
2.104854, -0.1846145, 3.422954, 1, 1, 1, 1, 1,
2.108672, -0.8159555, 1.691469, 1, 1, 1, 1, 1,
2.126132, -0.4047039, 2.074882, 0, 0, 1, 1, 1,
2.126577, 0.4094498, 2.225744, 1, 0, 0, 1, 1,
2.175667, -1.518098, 2.158069, 1, 0, 0, 1, 1,
2.1816, -0.7418725, 2.780245, 1, 0, 0, 1, 1,
2.204824, -0.2185395, 1.752342, 1, 0, 0, 1, 1,
2.222028, 1.196149, -0.142326, 1, 0, 0, 1, 1,
2.259148, -0.907765, 1.128788, 0, 0, 0, 1, 1,
2.334071, -0.007729504, 2.040552, 0, 0, 0, 1, 1,
2.383086, 0.8132383, 1.58707, 0, 0, 0, 1, 1,
2.387392, -0.7415231, 3.021033, 0, 0, 0, 1, 1,
2.456142, -0.04197868, 3.012176, 0, 0, 0, 1, 1,
2.535062, -0.9713077, 2.455584, 0, 0, 0, 1, 1,
2.535167, -0.3452598, 2.100212, 0, 0, 0, 1, 1,
2.634946, 0.07501857, 1.49197, 1, 1, 1, 1, 1,
2.687484, 1.413643, 2.686888, 1, 1, 1, 1, 1,
2.776318, 0.8088136, 1.829541, 1, 1, 1, 1, 1,
2.901002, -1.558234, 1.862494, 1, 1, 1, 1, 1,
3.053948, -0.3335221, 1.642132, 1, 1, 1, 1, 1,
3.07274, -0.6980242, 1.440876, 1, 1, 1, 1, 1,
3.354725, 1.158951, 1.603938, 1, 1, 1, 1, 1
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
var radius = 10.09748;
var distance = 35.46695;
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
mvMatrix.translate( 0.001518488, -0.2061758, -0.1783791 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.46695);
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
