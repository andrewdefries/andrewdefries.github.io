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
-2.678653, -0.5169684, -3.856865, 1, 0, 0, 1,
-2.656965, 0.5067835, -2.552485, 1, 0.007843138, 0, 1,
-2.650184, 0.6495565, -1.804424, 1, 0.01176471, 0, 1,
-2.584569, -0.3655609, -2.605822, 1, 0.01960784, 0, 1,
-2.535291, 0.8850623, -1.252515, 1, 0.02352941, 0, 1,
-2.406351, -0.1971621, -2.803881, 1, 0.03137255, 0, 1,
-2.364625, 0.6680529, -0.8312421, 1, 0.03529412, 0, 1,
-2.283924, 1.250775, -0.6466389, 1, 0.04313726, 0, 1,
-2.26626, -0.5809525, -3.736419, 1, 0.04705882, 0, 1,
-2.246836, 0.6153545, -0.4882864, 1, 0.05490196, 0, 1,
-2.237915, -0.9873402, -1.387274, 1, 0.05882353, 0, 1,
-2.193394, 0.3729963, -0.2268524, 1, 0.06666667, 0, 1,
-2.097392, 0.08292454, -2.7967, 1, 0.07058824, 0, 1,
-2.061725, 0.6906172, -1.473206, 1, 0.07843138, 0, 1,
-1.994433, -0.139504, -1.269509, 1, 0.08235294, 0, 1,
-1.950513, -0.3710676, -1.609139, 1, 0.09019608, 0, 1,
-1.90621, 3.096898, 0.3486532, 1, 0.09411765, 0, 1,
-1.896196, -0.2184678, -1.860071, 1, 0.1019608, 0, 1,
-1.893433, -1.50676, -0.9200757, 1, 0.1098039, 0, 1,
-1.89202, -1.067716, -2.263568, 1, 0.1137255, 0, 1,
-1.879308, -1.59641, -2.079503, 1, 0.1215686, 0, 1,
-1.878049, 0.9211455, -2.379385, 1, 0.1254902, 0, 1,
-1.86363, 1.363548, -0.663061, 1, 0.1333333, 0, 1,
-1.861706, -0.1182814, -1.82008, 1, 0.1372549, 0, 1,
-1.853445, -0.6590859, -1.75041, 1, 0.145098, 0, 1,
-1.848001, 1.778396, -1.022294, 1, 0.1490196, 0, 1,
-1.834308, -0.9939528, -1.659285, 1, 0.1568628, 0, 1,
-1.824357, 0.1727468, -0.7762805, 1, 0.1607843, 0, 1,
-1.811149, -1.24968, -0.7008492, 1, 0.1686275, 0, 1,
-1.810103, -0.01812352, -1.812705, 1, 0.172549, 0, 1,
-1.80764, -1.722921, -1.405342, 1, 0.1803922, 0, 1,
-1.802544, -0.2888829, 0.6594048, 1, 0.1843137, 0, 1,
-1.801655, -0.2636087, -2.155098, 1, 0.1921569, 0, 1,
-1.799409, 1.185212, -3.160659, 1, 0.1960784, 0, 1,
-1.797807, -0.3230352, -1.240047, 1, 0.2039216, 0, 1,
-1.7858, -0.8133099, -1.41533, 1, 0.2117647, 0, 1,
-1.765391, 0.9003432, -0.1936132, 1, 0.2156863, 0, 1,
-1.742798, 0.8331021, -0.0691141, 1, 0.2235294, 0, 1,
-1.737631, 0.4348185, -1.371085, 1, 0.227451, 0, 1,
-1.736896, -0.6137082, -1.590222, 1, 0.2352941, 0, 1,
-1.727175, -1.394695, -3.99551, 1, 0.2392157, 0, 1,
-1.721424, 0.5431163, -0.9305533, 1, 0.2470588, 0, 1,
-1.709513, -0.2676069, -2.169181, 1, 0.2509804, 0, 1,
-1.705855, 0.3746221, -0.1306763, 1, 0.2588235, 0, 1,
-1.698104, -0.5782573, -2.591802, 1, 0.2627451, 0, 1,
-1.689165, 1.632152, 0.02928527, 1, 0.2705882, 0, 1,
-1.680096, 0.3433655, -3.91553, 1, 0.2745098, 0, 1,
-1.65483, -0.5803345, -0.9118299, 1, 0.282353, 0, 1,
-1.640937, -0.676647, -0.8087355, 1, 0.2862745, 0, 1,
-1.628353, 1.403784, -0.4172982, 1, 0.2941177, 0, 1,
-1.612147, 0.7421914, -0.3473761, 1, 0.3019608, 0, 1,
-1.596943, -0.1201097, -0.5207464, 1, 0.3058824, 0, 1,
-1.573388, 0.6568722, -0.6482336, 1, 0.3137255, 0, 1,
-1.566557, -0.1911775, -2.467721, 1, 0.3176471, 0, 1,
-1.565282, 1.761941, -1.55615, 1, 0.3254902, 0, 1,
-1.556353, 0.1219305, -1.558332, 1, 0.3294118, 0, 1,
-1.542984, -0.2056669, -1.479111, 1, 0.3372549, 0, 1,
-1.537534, -0.008151049, -0.07568032, 1, 0.3411765, 0, 1,
-1.531221, 1.803818, -1.895665, 1, 0.3490196, 0, 1,
-1.524024, -0.399899, -1.840991, 1, 0.3529412, 0, 1,
-1.521735, 2.001817, -1.171813, 1, 0.3607843, 0, 1,
-1.518763, 0.2479486, -3.276174, 1, 0.3647059, 0, 1,
-1.517241, -0.303515, -2.223407, 1, 0.372549, 0, 1,
-1.5153, 0.8852558, -0.6309614, 1, 0.3764706, 0, 1,
-1.510409, 1.250657, -0.8630741, 1, 0.3843137, 0, 1,
-1.498307, 0.2180764, -2.074372, 1, 0.3882353, 0, 1,
-1.494985, -0.3589239, -2.648722, 1, 0.3960784, 0, 1,
-1.487601, -0.3396308, -1.751538, 1, 0.4039216, 0, 1,
-1.481002, -0.113988, -3.932352, 1, 0.4078431, 0, 1,
-1.480961, -1.205071, -2.282411, 1, 0.4156863, 0, 1,
-1.477888, -0.7386176, -1.380361, 1, 0.4196078, 0, 1,
-1.476056, 1.741313, -1.010007, 1, 0.427451, 0, 1,
-1.47278, 1.124314, -1.562293, 1, 0.4313726, 0, 1,
-1.472633, -0.4179992, -0.2273569, 1, 0.4392157, 0, 1,
-1.467612, -0.6815677, -2.653362, 1, 0.4431373, 0, 1,
-1.463896, -0.902778, -3.872096, 1, 0.4509804, 0, 1,
-1.450735, 0.02125535, 0.9137523, 1, 0.454902, 0, 1,
-1.432678, 0.2872068, -0.8405108, 1, 0.4627451, 0, 1,
-1.416007, -1.122978, -1.083877, 1, 0.4666667, 0, 1,
-1.414909, 2.879602, 0.6027346, 1, 0.4745098, 0, 1,
-1.414268, -0.8402064, -0.2663395, 1, 0.4784314, 0, 1,
-1.414102, 0.6230032, -0.5057074, 1, 0.4862745, 0, 1,
-1.41358, -1.495508, -2.178317, 1, 0.4901961, 0, 1,
-1.410219, 0.261887, -1.552372, 1, 0.4980392, 0, 1,
-1.408735, 1.577481, -0.1967059, 1, 0.5058824, 0, 1,
-1.396612, 0.7175844, -2.357133, 1, 0.509804, 0, 1,
-1.393081, 0.1940665, -1.421903, 1, 0.5176471, 0, 1,
-1.389983, 0.5099621, -1.524189, 1, 0.5215687, 0, 1,
-1.382524, -0.8982026, -3.492029, 1, 0.5294118, 0, 1,
-1.366527, 0.5275639, -1.323632, 1, 0.5333334, 0, 1,
-1.364378, 1.672087, -0.6509983, 1, 0.5411765, 0, 1,
-1.351998, 1.615944, -1.141822, 1, 0.5450981, 0, 1,
-1.33922, 0.4140252, -0.4642482, 1, 0.5529412, 0, 1,
-1.336389, 1.72064, -0.5564473, 1, 0.5568628, 0, 1,
-1.32816, 0.6239091, -1.245357, 1, 0.5647059, 0, 1,
-1.325006, 1.391541, -1.754423, 1, 0.5686275, 0, 1,
-1.31463, -0.8026202, -2.563694, 1, 0.5764706, 0, 1,
-1.310084, -0.5427234, -2.363676, 1, 0.5803922, 0, 1,
-1.294004, 0.03825678, -1.673183, 1, 0.5882353, 0, 1,
-1.292821, 1.577525, 0.5583928, 1, 0.5921569, 0, 1,
-1.284979, -0.7253496, -1.006211, 1, 0.6, 0, 1,
-1.27884, -1.705857, -2.070873, 1, 0.6078432, 0, 1,
-1.277884, 0.05550068, 0.9143815, 1, 0.6117647, 0, 1,
-1.274595, -0.4941725, -1.643505, 1, 0.6196079, 0, 1,
-1.271381, -2.522052, -2.698292, 1, 0.6235294, 0, 1,
-1.264298, 0.2384941, -1.887524, 1, 0.6313726, 0, 1,
-1.260854, -0.8851658, -4.316031, 1, 0.6352941, 0, 1,
-1.26006, 0.4676949, -2.477366, 1, 0.6431373, 0, 1,
-1.250725, 0.549265, -1.869874, 1, 0.6470588, 0, 1,
-1.238646, 0.8284433, 0.2088607, 1, 0.654902, 0, 1,
-1.235754, -1.142721, -1.372867, 1, 0.6588235, 0, 1,
-1.231047, 0.1510577, 0.04533801, 1, 0.6666667, 0, 1,
-1.226929, -1.477765, -2.890043, 1, 0.6705883, 0, 1,
-1.22548, -0.370161, -2.339724, 1, 0.6784314, 0, 1,
-1.217592, -0.4027002, -2.793048, 1, 0.682353, 0, 1,
-1.214603, 0.01548852, -3.017205, 1, 0.6901961, 0, 1,
-1.209763, 0.006265395, -3.805858, 1, 0.6941177, 0, 1,
-1.206876, 0.9433606, -0.8219692, 1, 0.7019608, 0, 1,
-1.204759, -0.5426029, -1.335143, 1, 0.7098039, 0, 1,
-1.200992, 0.3770891, -0.8893941, 1, 0.7137255, 0, 1,
-1.192901, 0.4436899, -0.1555927, 1, 0.7215686, 0, 1,
-1.192805, -0.7286604, -1.555272, 1, 0.7254902, 0, 1,
-1.188062, 0.6153843, -1.330363, 1, 0.7333333, 0, 1,
-1.184886, 0.9373531, -2.178944, 1, 0.7372549, 0, 1,
-1.183392, 0.3486188, -0.6080734, 1, 0.7450981, 0, 1,
-1.181019, 0.5920362, -1.998847, 1, 0.7490196, 0, 1,
-1.180291, -0.482318, -2.806727, 1, 0.7568628, 0, 1,
-1.177157, -0.3540159, -2.54226, 1, 0.7607843, 0, 1,
-1.176031, 1.560757, -0.8887604, 1, 0.7686275, 0, 1,
-1.160038, 0.07951813, -0.3301109, 1, 0.772549, 0, 1,
-1.157865, 0.3009461, -1.032742, 1, 0.7803922, 0, 1,
-1.15756, 1.035822, -0.006415339, 1, 0.7843137, 0, 1,
-1.15327, -0.3350419, -1.823918, 1, 0.7921569, 0, 1,
-1.153014, 0.1239951, -2.034211, 1, 0.7960784, 0, 1,
-1.152415, -0.8296332, -1.352027, 1, 0.8039216, 0, 1,
-1.147296, 1.088097, 0.3837754, 1, 0.8117647, 0, 1,
-1.146891, 0.5437968, -1.683558, 1, 0.8156863, 0, 1,
-1.14408, 0.7822076, -0.541627, 1, 0.8235294, 0, 1,
-1.136757, -1.401683, -3.17624, 1, 0.827451, 0, 1,
-1.133511, 0.2466263, -1.821286, 1, 0.8352941, 0, 1,
-1.120188, -0.2890772, -1.007882, 1, 0.8392157, 0, 1,
-1.113615, -0.2287655, -1.541656, 1, 0.8470588, 0, 1,
-1.109075, 1.095749, -1.554724, 1, 0.8509804, 0, 1,
-1.108292, 0.4694299, 0.245848, 1, 0.8588235, 0, 1,
-1.095302, 0.7523995, -1.322628, 1, 0.8627451, 0, 1,
-1.085539, 0.7177963, -0.7999427, 1, 0.8705882, 0, 1,
-1.083715, -0.6066868, -2.740898, 1, 0.8745098, 0, 1,
-1.081724, 0.6933759, -2.655274, 1, 0.8823529, 0, 1,
-1.057591, -0.1179545, 0.3431876, 1, 0.8862745, 0, 1,
-1.045957, 0.4966263, -1.804423, 1, 0.8941177, 0, 1,
-1.02873, -1.089402, -0.869534, 1, 0.8980392, 0, 1,
-1.026527, -0.5636308, -1.315287, 1, 0.9058824, 0, 1,
-1.023936, 1.166528, -1.528126, 1, 0.9137255, 0, 1,
-1.016096, -1.429434, -4.097303, 1, 0.9176471, 0, 1,
-1.013403, 0.600593, -1.443316, 1, 0.9254902, 0, 1,
-1.009751, 0.3751323, 0.728423, 1, 0.9294118, 0, 1,
-1.004157, 0.3676878, 0.03092028, 1, 0.9372549, 0, 1,
-0.9884068, -0.9273913, -1.006585, 1, 0.9411765, 0, 1,
-0.9864801, -0.8142702, -2.33267, 1, 0.9490196, 0, 1,
-0.9755077, 0.7130511, -0.6122551, 1, 0.9529412, 0, 1,
-0.9655181, 1.889194, -0.1704493, 1, 0.9607843, 0, 1,
-0.9594472, -0.244425, -1.955985, 1, 0.9647059, 0, 1,
-0.9549138, 0.04752393, -1.68617, 1, 0.972549, 0, 1,
-0.9470782, -2.166131, -2.663465, 1, 0.9764706, 0, 1,
-0.9411489, -1.457432, -3.308239, 1, 0.9843137, 0, 1,
-0.9389505, 1.024176, -0.07640651, 1, 0.9882353, 0, 1,
-0.9380929, -0.3995704, -3.534857, 1, 0.9960784, 0, 1,
-0.9361315, 0.4653424, 0.05735448, 0.9960784, 1, 0, 1,
-0.9326267, -0.2092625, -2.398569, 0.9921569, 1, 0, 1,
-0.9272223, -0.01263126, -1.128879, 0.9843137, 1, 0, 1,
-0.922524, -0.4385045, -3.880082, 0.9803922, 1, 0, 1,
-0.9224257, -0.325099, -0.8796184, 0.972549, 1, 0, 1,
-0.9222963, -1.112861, -4.108508, 0.9686275, 1, 0, 1,
-0.9214619, 1.135712, -0.8379743, 0.9607843, 1, 0, 1,
-0.9164305, -1.048755, -4.244162, 0.9568627, 1, 0, 1,
-0.9119797, -0.8750659, -2.733417, 0.9490196, 1, 0, 1,
-0.8956349, -0.2816399, -1.29374, 0.945098, 1, 0, 1,
-0.8938008, -1.431925, -3.724255, 0.9372549, 1, 0, 1,
-0.8911585, -0.02034718, -3.664574, 0.9333333, 1, 0, 1,
-0.8902159, 0.5145791, -0.04053034, 0.9254902, 1, 0, 1,
-0.8850032, 0.9522086, -0.7831389, 0.9215686, 1, 0, 1,
-0.873514, -1.016677, -3.167554, 0.9137255, 1, 0, 1,
-0.8687122, -0.5876703, -1.962978, 0.9098039, 1, 0, 1,
-0.8635314, 0.2474989, -2.390073, 0.9019608, 1, 0, 1,
-0.8624027, -0.7939572, -4.271268, 0.8941177, 1, 0, 1,
-0.8585241, -1.732422, -1.752609, 0.8901961, 1, 0, 1,
-0.8576755, 0.02299828, -0.9119934, 0.8823529, 1, 0, 1,
-0.8571928, 0.7036577, -1.607078, 0.8784314, 1, 0, 1,
-0.8569272, 0.9642071, 0.8299587, 0.8705882, 1, 0, 1,
-0.8538731, -0.1592802, -1.496027, 0.8666667, 1, 0, 1,
-0.8448691, -1.297721, -2.194818, 0.8588235, 1, 0, 1,
-0.8419992, -0.4904705, -1.828573, 0.854902, 1, 0, 1,
-0.8413642, 0.5881853, -0.6410644, 0.8470588, 1, 0, 1,
-0.8410815, -0.1084722, -2.396529, 0.8431373, 1, 0, 1,
-0.82819, 0.01876372, -1.697346, 0.8352941, 1, 0, 1,
-0.8228781, 0.5833784, -0.8698038, 0.8313726, 1, 0, 1,
-0.8188351, -0.8716258, -2.377197, 0.8235294, 1, 0, 1,
-0.8145109, -0.2101042, -3.34574, 0.8196079, 1, 0, 1,
-0.812259, -0.01879824, -0.9438181, 0.8117647, 1, 0, 1,
-0.8122427, -0.055732, 0.8486025, 0.8078431, 1, 0, 1,
-0.8043864, -1.135053, -1.663046, 0.8, 1, 0, 1,
-0.8005363, -0.2469138, -2.73042, 0.7921569, 1, 0, 1,
-0.7993776, 0.4133456, -0.7944538, 0.7882353, 1, 0, 1,
-0.7953418, 1.565693, -0.4544066, 0.7803922, 1, 0, 1,
-0.7895045, 0.4031755, 1.386814, 0.7764706, 1, 0, 1,
-0.7660034, -1.366858, -3.213497, 0.7686275, 1, 0, 1,
-0.7634354, -1.144237, -2.549731, 0.7647059, 1, 0, 1,
-0.7627555, -0.8985217, -2.373146, 0.7568628, 1, 0, 1,
-0.7620065, -0.02814017, -0.9480174, 0.7529412, 1, 0, 1,
-0.7569845, 0.4251366, -0.4461385, 0.7450981, 1, 0, 1,
-0.7548942, 0.6854838, -2.428125, 0.7411765, 1, 0, 1,
-0.7514043, 0.6440651, -1.526634, 0.7333333, 1, 0, 1,
-0.7504914, -0.1306586, 0.3208132, 0.7294118, 1, 0, 1,
-0.7503265, -1.123088, -2.828285, 0.7215686, 1, 0, 1,
-0.742083, 0.8653078, -1.248368, 0.7176471, 1, 0, 1,
-0.7266713, 1.473354, -1.329163, 0.7098039, 1, 0, 1,
-0.7133749, 0.6716954, -1.790036, 0.7058824, 1, 0, 1,
-0.7129034, 1.511782, 0.01207336, 0.6980392, 1, 0, 1,
-0.7111813, -0.978826, -1.558994, 0.6901961, 1, 0, 1,
-0.7020148, 0.3002982, -1.576756, 0.6862745, 1, 0, 1,
-0.7008763, -1.082042, -3.331908, 0.6784314, 1, 0, 1,
-0.7004643, -0.2302558, -2.515009, 0.6745098, 1, 0, 1,
-0.6970745, 1.098684, -1.958125, 0.6666667, 1, 0, 1,
-0.6957274, 0.2690579, -1.298978, 0.6627451, 1, 0, 1,
-0.6919786, -0.2802598, -1.167954, 0.654902, 1, 0, 1,
-0.687988, 0.6683162, -2.821601, 0.6509804, 1, 0, 1,
-0.6879307, -0.2264002, -2.938862, 0.6431373, 1, 0, 1,
-0.6868356, -0.6111521, -2.543277, 0.6392157, 1, 0, 1,
-0.6849844, 0.8229501, -1.721816, 0.6313726, 1, 0, 1,
-0.6829548, -0.9411536, -1.772291, 0.627451, 1, 0, 1,
-0.6815981, -0.01943872, -2.922508, 0.6196079, 1, 0, 1,
-0.681524, -1.773948, -1.977328, 0.6156863, 1, 0, 1,
-0.6754232, -0.7717999, -2.140232, 0.6078432, 1, 0, 1,
-0.6722344, -1.020615, -2.162537, 0.6039216, 1, 0, 1,
-0.6721085, -0.2553154, -3.870651, 0.5960785, 1, 0, 1,
-0.6673341, 0.788025, -2.08092, 0.5882353, 1, 0, 1,
-0.6632944, 0.7959706, -0.2145399, 0.5843138, 1, 0, 1,
-0.6599592, -0.06117165, 0.4611698, 0.5764706, 1, 0, 1,
-0.6577162, -0.896875, -3.992978, 0.572549, 1, 0, 1,
-0.6495434, 0.008392677, -2.374488, 0.5647059, 1, 0, 1,
-0.6481408, 0.9660863, 2.189515, 0.5607843, 1, 0, 1,
-0.6459927, -1.085044, -3.645589, 0.5529412, 1, 0, 1,
-0.6394705, 0.289994, -1.957316, 0.5490196, 1, 0, 1,
-0.6350276, -0.6724386, -2.159441, 0.5411765, 1, 0, 1,
-0.6314466, -0.4265006, -1.492042, 0.5372549, 1, 0, 1,
-0.6279832, -1.094126, -3.199863, 0.5294118, 1, 0, 1,
-0.6236209, -0.6764097, -2.58391, 0.5254902, 1, 0, 1,
-0.6216107, 1.274293, 0.2321182, 0.5176471, 1, 0, 1,
-0.6170225, 0.1485424, -0.870254, 0.5137255, 1, 0, 1,
-0.6165155, -0.968254, -2.886942, 0.5058824, 1, 0, 1,
-0.615465, -0.241314, -3.389535, 0.5019608, 1, 0, 1,
-0.6133965, 0.7892157, 1.123881, 0.4941176, 1, 0, 1,
-0.6130432, 1.411835, -0.9550055, 0.4862745, 1, 0, 1,
-0.6127264, -1.670448, -5.040821, 0.4823529, 1, 0, 1,
-0.6104454, 0.4248643, -1.64392, 0.4745098, 1, 0, 1,
-0.6101947, -1.166523, -3.321153, 0.4705882, 1, 0, 1,
-0.6069536, 1.202205, 0.04595104, 0.4627451, 1, 0, 1,
-0.6048421, -0.8843206, -1.713162, 0.4588235, 1, 0, 1,
-0.6028874, 0.8445739, -1.382317, 0.4509804, 1, 0, 1,
-0.6028464, -0.407955, -0.02907552, 0.4470588, 1, 0, 1,
-0.5973421, -0.5604191, -2.416731, 0.4392157, 1, 0, 1,
-0.5943124, 0.567355, -0.5799862, 0.4352941, 1, 0, 1,
-0.5937794, 1.254489, -0.9903754, 0.427451, 1, 0, 1,
-0.5853481, 2.419433, 0.0538643, 0.4235294, 1, 0, 1,
-0.5814935, 1.744711, 1.315342, 0.4156863, 1, 0, 1,
-0.5723095, -0.03494837, -3.58267, 0.4117647, 1, 0, 1,
-0.571312, 0.5658153, -0.8490151, 0.4039216, 1, 0, 1,
-0.567881, -0.1332588, -2.832704, 0.3960784, 1, 0, 1,
-0.5674649, -0.1983449, -1.582534, 0.3921569, 1, 0, 1,
-0.5639693, 0.145878, -1.623407, 0.3843137, 1, 0, 1,
-0.5598533, -0.2789117, -3.048964, 0.3803922, 1, 0, 1,
-0.5596482, -1.613628, -3.573752, 0.372549, 1, 0, 1,
-0.5504057, 1.872879, -0.5265443, 0.3686275, 1, 0, 1,
-0.5499948, 0.443816, -0.7901633, 0.3607843, 1, 0, 1,
-0.5494869, 1.511335, -1.1258, 0.3568628, 1, 0, 1,
-0.5489258, -0.8790185, -3.326774, 0.3490196, 1, 0, 1,
-0.5473995, -0.1257639, -1.034564, 0.345098, 1, 0, 1,
-0.5459524, 1.250004, -0.4028458, 0.3372549, 1, 0, 1,
-0.5450329, 0.3370139, -1.651221, 0.3333333, 1, 0, 1,
-0.543053, 0.7454843, -1.294455, 0.3254902, 1, 0, 1,
-0.5418506, -0.6591551, -0.3291451, 0.3215686, 1, 0, 1,
-0.5417552, 0.7385799, 0.2685762, 0.3137255, 1, 0, 1,
-0.5394836, -0.8458982, -3.61032, 0.3098039, 1, 0, 1,
-0.5382349, -2.547056, -2.282552, 0.3019608, 1, 0, 1,
-0.5378106, 1.141691, 0.125369, 0.2941177, 1, 0, 1,
-0.5339887, 0.3889662, -0.4676532, 0.2901961, 1, 0, 1,
-0.5310737, -1.100467, -2.52191, 0.282353, 1, 0, 1,
-0.5295275, 1.851302, -1.365029, 0.2784314, 1, 0, 1,
-0.5277746, 0.1556108, -3.398203, 0.2705882, 1, 0, 1,
-0.525516, 0.5687503, -0.2471101, 0.2666667, 1, 0, 1,
-0.5177643, -0.03650749, -2.736592, 0.2588235, 1, 0, 1,
-0.5172848, -0.6627162, -2.853086, 0.254902, 1, 0, 1,
-0.5127195, 0.2178409, -1.324898, 0.2470588, 1, 0, 1,
-0.5117547, -0.4191653, -2.375992, 0.2431373, 1, 0, 1,
-0.5112945, 0.6229802, -1.324648, 0.2352941, 1, 0, 1,
-0.5067741, 2.244618, -0.791766, 0.2313726, 1, 0, 1,
-0.5060239, -0.5260535, -3.19381, 0.2235294, 1, 0, 1,
-0.5047983, -0.02633022, -1.608504, 0.2196078, 1, 0, 1,
-0.5037998, -1.1172, -3.214618, 0.2117647, 1, 0, 1,
-0.502121, 1.428062, -0.2666121, 0.2078431, 1, 0, 1,
-0.4989173, 2.196277, -0.3901403, 0.2, 1, 0, 1,
-0.4950001, -0.9901624, -3.512106, 0.1921569, 1, 0, 1,
-0.4890713, -0.09086913, -3.67223, 0.1882353, 1, 0, 1,
-0.488856, 1.853693, 0.3243412, 0.1803922, 1, 0, 1,
-0.4839694, 0.08303754, -0.3875283, 0.1764706, 1, 0, 1,
-0.4832615, -1.126181, -4.990654, 0.1686275, 1, 0, 1,
-0.4831693, 0.3503787, -0.6263787, 0.1647059, 1, 0, 1,
-0.4804205, 0.6049984, -1.748526, 0.1568628, 1, 0, 1,
-0.4789685, -0.002772979, -0.8215848, 0.1529412, 1, 0, 1,
-0.4758806, 0.5874844, -1.607333, 0.145098, 1, 0, 1,
-0.4748035, -0.5427771, -2.137585, 0.1411765, 1, 0, 1,
-0.4720719, 0.7955225, -1.116407, 0.1333333, 1, 0, 1,
-0.4711173, 0.2244725, -2.873695, 0.1294118, 1, 0, 1,
-0.4683822, -1.433059, -2.868932, 0.1215686, 1, 0, 1,
-0.4683692, 1.162357, -3.291147, 0.1176471, 1, 0, 1,
-0.4647738, -1.792492, -2.65117, 0.1098039, 1, 0, 1,
-0.4643421, -1.539759, -0.7587947, 0.1058824, 1, 0, 1,
-0.4636079, -0.1996468, 0.3740745, 0.09803922, 1, 0, 1,
-0.4561956, 0.07688057, -0.6122315, 0.09019608, 1, 0, 1,
-0.4548608, -0.006639571, -0.5789135, 0.08627451, 1, 0, 1,
-0.4539473, 0.6289131, -1.250261, 0.07843138, 1, 0, 1,
-0.4489306, -0.1973765, -2.115292, 0.07450981, 1, 0, 1,
-0.4428206, 0.7577133, 0.1243088, 0.06666667, 1, 0, 1,
-0.4422999, 0.6360862, -1.456055, 0.0627451, 1, 0, 1,
-0.4404562, -0.5198795, -4.274351, 0.05490196, 1, 0, 1,
-0.4400081, 1.312766, -1.961797, 0.05098039, 1, 0, 1,
-0.43814, 0.2105021, -0.3734669, 0.04313726, 1, 0, 1,
-0.430779, -0.1443723, -1.881853, 0.03921569, 1, 0, 1,
-0.4302893, 0.3702348, -3.10377, 0.03137255, 1, 0, 1,
-0.430279, 1.146581, -1.805842, 0.02745098, 1, 0, 1,
-0.4293123, 0.06572212, -2.699739, 0.01960784, 1, 0, 1,
-0.4285353, -0.2294664, -1.458114, 0.01568628, 1, 0, 1,
-0.4279501, -0.882411, -2.412229, 0.007843138, 1, 0, 1,
-0.4275602, -2.130274, -3.155816, 0.003921569, 1, 0, 1,
-0.4275039, -0.2576987, -3.629301, 0, 1, 0.003921569, 1,
-0.425833, 1.309698, -1.82689, 0, 1, 0.01176471, 1,
-0.4238976, 2.131167, -0.7436646, 0, 1, 0.01568628, 1,
-0.4236948, 0.5767984, -2.229711, 0, 1, 0.02352941, 1,
-0.4210368, -2.060414, -2.871753, 0, 1, 0.02745098, 1,
-0.4116904, 1.577135, -0.7731978, 0, 1, 0.03529412, 1,
-0.4101287, 0.03528777, -1.519305, 0, 1, 0.03921569, 1,
-0.4049927, -1.605474, -3.23459, 0, 1, 0.04705882, 1,
-0.4041701, 0.8841266, -0.1801717, 0, 1, 0.05098039, 1,
-0.3964199, -0.8688733, -3.072211, 0, 1, 0.05882353, 1,
-0.3959323, -0.5157491, -3.147546, 0, 1, 0.0627451, 1,
-0.3948182, -0.4410869, -1.566439, 0, 1, 0.07058824, 1,
-0.3942188, 0.7307265, 0.4531703, 0, 1, 0.07450981, 1,
-0.3934716, 0.2684377, -1.387362, 0, 1, 0.08235294, 1,
-0.389759, -1.390904, -2.031465, 0, 1, 0.08627451, 1,
-0.3892924, 0.6518002, -0.7294874, 0, 1, 0.09411765, 1,
-0.3849243, 0.9085243, -1.063684, 0, 1, 0.1019608, 1,
-0.3843194, 0.2888667, -1.1446, 0, 1, 0.1058824, 1,
-0.3835034, -0.7864344, -2.409215, 0, 1, 0.1137255, 1,
-0.3823839, 0.995853, 0.4677398, 0, 1, 0.1176471, 1,
-0.3791252, -0.7068448, -1.306725, 0, 1, 0.1254902, 1,
-0.3782158, 1.830105, -0.2322681, 0, 1, 0.1294118, 1,
-0.3748312, -1.267809, -2.753337, 0, 1, 0.1372549, 1,
-0.3745392, -0.5543159, -2.529293, 0, 1, 0.1411765, 1,
-0.3674107, -0.1862196, -1.57089, 0, 1, 0.1490196, 1,
-0.362167, -0.3757622, -0.7022948, 0, 1, 0.1529412, 1,
-0.3577236, 0.6979349, -1.388788, 0, 1, 0.1607843, 1,
-0.3554286, 0.8866966, -1.496458, 0, 1, 0.1647059, 1,
-0.3528483, -0.01848453, -1.437616, 0, 1, 0.172549, 1,
-0.3521245, 0.4195204, 0.4936284, 0, 1, 0.1764706, 1,
-0.3517793, 0.3328595, -1.170447, 0, 1, 0.1843137, 1,
-0.3483906, -0.3518045, -2.168711, 0, 1, 0.1882353, 1,
-0.3463893, 0.8035995, -0.03680656, 0, 1, 0.1960784, 1,
-0.3449376, -0.3952943, -1.537376, 0, 1, 0.2039216, 1,
-0.3435662, 0.6489812, -1.010328, 0, 1, 0.2078431, 1,
-0.3424083, 0.2293595, -2.74186, 0, 1, 0.2156863, 1,
-0.3420398, -0.746472, -2.355679, 0, 1, 0.2196078, 1,
-0.3400859, 0.4914683, -1.288614, 0, 1, 0.227451, 1,
-0.3387815, -0.4768121, -1.544853, 0, 1, 0.2313726, 1,
-0.3319648, 0.4685448, 0.4906591, 0, 1, 0.2392157, 1,
-0.3315333, -0.9627184, -4.016994, 0, 1, 0.2431373, 1,
-0.3245569, 0.6696074, -0.9419702, 0, 1, 0.2509804, 1,
-0.3242306, -1.368315, -3.700704, 0, 1, 0.254902, 1,
-0.3235569, 0.8921485, 0.1532769, 0, 1, 0.2627451, 1,
-0.3218474, 2.342281, -1.204077, 0, 1, 0.2666667, 1,
-0.3163571, 0.7001088, 0.1804876, 0, 1, 0.2745098, 1,
-0.3136245, 1.073672, -0.5609964, 0, 1, 0.2784314, 1,
-0.3120462, -0.558293, -3.521669, 0, 1, 0.2862745, 1,
-0.3117135, 0.6784744, 1.052395, 0, 1, 0.2901961, 1,
-0.3104699, -1.131749, -3.093308, 0, 1, 0.2980392, 1,
-0.3097457, -0.5231862, -1.772729, 0, 1, 0.3058824, 1,
-0.306411, 0.5464008, -0.4542939, 0, 1, 0.3098039, 1,
-0.3058456, 1.811349, -1.61374, 0, 1, 0.3176471, 1,
-0.3049159, 1.682756, -0.4654533, 0, 1, 0.3215686, 1,
-0.3041002, -1.385609, -1.974798, 0, 1, 0.3294118, 1,
-0.304085, -0.8887467, -1.274823, 0, 1, 0.3333333, 1,
-0.3038226, 0.164095, 0.1784085, 0, 1, 0.3411765, 1,
-0.3037716, 0.3156154, 0.6446099, 0, 1, 0.345098, 1,
-0.3032451, -0.1211069, -1.552234, 0, 1, 0.3529412, 1,
-0.3012297, 1.162416, 0.7513577, 0, 1, 0.3568628, 1,
-0.2999435, 0.1997579, -1.35026, 0, 1, 0.3647059, 1,
-0.2990479, 0.6099335, -1.242722, 0, 1, 0.3686275, 1,
-0.2961097, 1.330301, -1.060697, 0, 1, 0.3764706, 1,
-0.2952141, -0.4026217, -3.834154, 0, 1, 0.3803922, 1,
-0.2920018, 0.4330677, -0.1688625, 0, 1, 0.3882353, 1,
-0.2915204, -0.8424325, -1.892603, 0, 1, 0.3921569, 1,
-0.2908832, -0.3352877, -1.103797, 0, 1, 0.4, 1,
-0.2908232, -0.9978529, -3.359238, 0, 1, 0.4078431, 1,
-0.288864, 0.8758423, -0.4388799, 0, 1, 0.4117647, 1,
-0.2874087, 0.5368029, -2.267393, 0, 1, 0.4196078, 1,
-0.2871966, 0.2456335, -0.7405212, 0, 1, 0.4235294, 1,
-0.2842517, -0.6602767, -2.354386, 0, 1, 0.4313726, 1,
-0.2837532, 0.9539757, -0.1691301, 0, 1, 0.4352941, 1,
-0.2811186, -0.5287758, -2.689297, 0, 1, 0.4431373, 1,
-0.2799457, -0.9236025, -3.878196, 0, 1, 0.4470588, 1,
-0.277082, -2.155311, -5.440422, 0, 1, 0.454902, 1,
-0.2768938, 0.9720666, 0.7949066, 0, 1, 0.4588235, 1,
-0.2767754, 0.3155556, -1.798954, 0, 1, 0.4666667, 1,
-0.2756159, -1.339916, -0.8445662, 0, 1, 0.4705882, 1,
-0.2737248, 3.11915, 0.7282876, 0, 1, 0.4784314, 1,
-0.2671017, 0.02208328, -1.055331, 0, 1, 0.4823529, 1,
-0.2652146, -1.631668, -4.81372, 0, 1, 0.4901961, 1,
-0.2638656, -0.9377145, -3.708024, 0, 1, 0.4941176, 1,
-0.2605127, -0.2379863, -2.541471, 0, 1, 0.5019608, 1,
-0.2568627, 1.431097, -1.002339, 0, 1, 0.509804, 1,
-0.2559138, -1.684392, -4.130793, 0, 1, 0.5137255, 1,
-0.2555335, -2.218564, -2.629109, 0, 1, 0.5215687, 1,
-0.2533306, -0.6272337, -4.800544, 0, 1, 0.5254902, 1,
-0.2437054, -2.045177, -2.205686, 0, 1, 0.5333334, 1,
-0.2428908, 0.5736197, -1.094821, 0, 1, 0.5372549, 1,
-0.2427746, 0.4383782, -2.271921, 0, 1, 0.5450981, 1,
-0.2411068, -0.6712327, -2.254915, 0, 1, 0.5490196, 1,
-0.2398351, -0.6355155, -1.453484, 0, 1, 0.5568628, 1,
-0.2395831, -0.468432, -2.821517, 0, 1, 0.5607843, 1,
-0.2347617, -0.005437222, -1.672618, 0, 1, 0.5686275, 1,
-0.234489, -2.949004, -3.11853, 0, 1, 0.572549, 1,
-0.2286057, -0.3439062, -2.745127, 0, 1, 0.5803922, 1,
-0.2269638, 0.8533378, 0.4283311, 0, 1, 0.5843138, 1,
-0.225622, -0.7235173, -2.247071, 0, 1, 0.5921569, 1,
-0.222017, 0.6473491, 0.571854, 0, 1, 0.5960785, 1,
-0.2164467, 0.2236181, 0.6832358, 0, 1, 0.6039216, 1,
-0.2143856, 0.1035661, -2.512207, 0, 1, 0.6117647, 1,
-0.2140906, 0.6114762, -1.12579, 0, 1, 0.6156863, 1,
-0.2114331, 2.149974, 1.590414, 0, 1, 0.6235294, 1,
-0.2075163, 0.1230228, -0.3209459, 0, 1, 0.627451, 1,
-0.2037436, -0.324502, -1.412896, 0, 1, 0.6352941, 1,
-0.2018454, 0.6168985, -1.712011, 0, 1, 0.6392157, 1,
-0.201746, -0.1103396, -3.229215, 0, 1, 0.6470588, 1,
-0.1981542, 0.7399943, -1.924073, 0, 1, 0.6509804, 1,
-0.1970945, -1.372079, -3.053778, 0, 1, 0.6588235, 1,
-0.1963291, 0.1034023, -0.9239725, 0, 1, 0.6627451, 1,
-0.1960982, 2.244037, 0.668575, 0, 1, 0.6705883, 1,
-0.1950883, -0.4715668, -2.49703, 0, 1, 0.6745098, 1,
-0.1934882, 0.3406771, 0.3361427, 0, 1, 0.682353, 1,
-0.1896749, 0.9700142, -1.878399, 0, 1, 0.6862745, 1,
-0.1870792, 0.5301945, -1.957909, 0, 1, 0.6941177, 1,
-0.1839467, 0.6620967, -0.4522381, 0, 1, 0.7019608, 1,
-0.1835365, -0.3699003, -2.390303, 0, 1, 0.7058824, 1,
-0.183233, 0.5541537, 0.3412247, 0, 1, 0.7137255, 1,
-0.1810584, 0.2456213, -1.731484, 0, 1, 0.7176471, 1,
-0.1782782, 1.233528, -1.014252, 0, 1, 0.7254902, 1,
-0.1781672, 0.425222, 0.05867174, 0, 1, 0.7294118, 1,
-0.1750765, -0.9925218, -2.18276, 0, 1, 0.7372549, 1,
-0.1727541, 0.731471, 0.2890907, 0, 1, 0.7411765, 1,
-0.1717641, 0.2274382, -1.016523, 0, 1, 0.7490196, 1,
-0.1706439, -1.182052, -2.554799, 0, 1, 0.7529412, 1,
-0.169432, -1.911152, -2.730201, 0, 1, 0.7607843, 1,
-0.1683499, 0.2663462, -0.110772, 0, 1, 0.7647059, 1,
-0.1632293, -0.08620939, -3.180814, 0, 1, 0.772549, 1,
-0.1586338, -1.556105, -2.793018, 0, 1, 0.7764706, 1,
-0.1562424, 0.249017, -0.819323, 0, 1, 0.7843137, 1,
-0.1558092, 0.9284616, 0.2934853, 0, 1, 0.7882353, 1,
-0.1474918, 0.5423482, -0.05319595, 0, 1, 0.7960784, 1,
-0.147243, -0.2840168, -2.671339, 0, 1, 0.8039216, 1,
-0.1440381, 0.5269154, -0.8579894, 0, 1, 0.8078431, 1,
-0.1438386, 1.752527, -0.4642493, 0, 1, 0.8156863, 1,
-0.1436049, -1.577144, -1.633623, 0, 1, 0.8196079, 1,
-0.143559, -1.722035, -3.800047, 0, 1, 0.827451, 1,
-0.1410422, 0.9370403, 0.3892274, 0, 1, 0.8313726, 1,
-0.1398332, 0.6350276, -0.4065199, 0, 1, 0.8392157, 1,
-0.1358046, 0.440568, -0.2815694, 0, 1, 0.8431373, 1,
-0.1335797, -0.1231402, -3.980431, 0, 1, 0.8509804, 1,
-0.1329078, 0.5738234, -2.179329, 0, 1, 0.854902, 1,
-0.1327484, 0.06644873, -1.505398, 0, 1, 0.8627451, 1,
-0.1324746, -1.444361, -2.600274, 0, 1, 0.8666667, 1,
-0.1258983, 0.516528, -1.573698, 0, 1, 0.8745098, 1,
-0.1245168, -0.7019938, -2.634323, 0, 1, 0.8784314, 1,
-0.1226364, 0.5505761, 0.55342, 0, 1, 0.8862745, 1,
-0.1208298, -0.04772928, -2.087044, 0, 1, 0.8901961, 1,
-0.1191924, -0.001804009, -1.037475, 0, 1, 0.8980392, 1,
-0.1182034, 0.2630222, -1.581112, 0, 1, 0.9058824, 1,
-0.1140788, 1.250042, 1.932245, 0, 1, 0.9098039, 1,
-0.1129463, 0.436229, 0.421044, 0, 1, 0.9176471, 1,
-0.1112784, 0.2099315, -0.7636694, 0, 1, 0.9215686, 1,
-0.1002876, -0.5105337, -3.519732, 0, 1, 0.9294118, 1,
-0.1002783, 0.7894782, -0.3340231, 0, 1, 0.9333333, 1,
-0.09572709, -0.3738256, -3.61465, 0, 1, 0.9411765, 1,
-0.0923341, 1.433454, -0.5591152, 0, 1, 0.945098, 1,
-0.08364417, -0.2128106, -2.994984, 0, 1, 0.9529412, 1,
-0.08088949, -0.7378726, -1.814129, 0, 1, 0.9568627, 1,
-0.07816148, -1.565053, -4.177463, 0, 1, 0.9647059, 1,
-0.07679965, -0.540857, -0.6919687, 0, 1, 0.9686275, 1,
-0.07669204, 0.2936389, -0.5189349, 0, 1, 0.9764706, 1,
-0.07617756, 0.5183756, 1.369965, 0, 1, 0.9803922, 1,
-0.07576477, 0.7618841, -0.5758101, 0, 1, 0.9882353, 1,
-0.07291811, -0.7941326, -3.263532, 0, 1, 0.9921569, 1,
-0.07054041, -1.777415, -3.622681, 0, 1, 1, 1,
-0.06966857, -0.8730323, -3.971173, 0, 0.9921569, 1, 1,
-0.06648678, 0.4784742, -0.6705683, 0, 0.9882353, 1, 1,
-0.06462854, 1.875012, -0.3424136, 0, 0.9803922, 1, 1,
-0.06313494, -1.28544, -3.815467, 0, 0.9764706, 1, 1,
-0.0587001, -1.206099, -1.935709, 0, 0.9686275, 1, 1,
-0.05516844, 0.869414, -0.8573848, 0, 0.9647059, 1, 1,
-0.05160191, 0.07857011, -1.079054, 0, 0.9568627, 1, 1,
-0.05077567, 0.07699158, 0.3936355, 0, 0.9529412, 1, 1,
-0.05074824, 2.036366, -0.9298874, 0, 0.945098, 1, 1,
-0.0505746, 0.01129265, -1.559513, 0, 0.9411765, 1, 1,
-0.04982552, -0.5261133, -1.599888, 0, 0.9333333, 1, 1,
-0.04729486, -0.2725324, -3.522276, 0, 0.9294118, 1, 1,
-0.04099549, 0.4075481, -1.916531, 0, 0.9215686, 1, 1,
-0.03837965, -0.1216426, -2.590729, 0, 0.9176471, 1, 1,
-0.03633958, 1.431003, 2.894639, 0, 0.9098039, 1, 1,
-0.03608548, 0.3465843, -2.411387, 0, 0.9058824, 1, 1,
-0.03299925, 1.12042, -0.1261127, 0, 0.8980392, 1, 1,
-0.03285837, -0.4208839, -3.289669, 0, 0.8901961, 1, 1,
-0.0324641, -0.03959833, -2.871747, 0, 0.8862745, 1, 1,
-0.0293588, 0.2686073, -1.791746, 0, 0.8784314, 1, 1,
-0.02739448, 0.4893949, -0.01689976, 0, 0.8745098, 1, 1,
-0.02525242, 0.7715289, 0.7651159, 0, 0.8666667, 1, 1,
-0.02120748, 1.425149, 0.1360892, 0, 0.8627451, 1, 1,
-0.02024659, -0.1110774, -2.490385, 0, 0.854902, 1, 1,
-0.0171909, 0.465186, -1.325063, 0, 0.8509804, 1, 1,
-0.01590228, -2.187327, -3.622813, 0, 0.8431373, 1, 1,
-0.01518512, 0.04857692, -1.613689, 0, 0.8392157, 1, 1,
-0.01143198, -0.01888823, -3.413547, 0, 0.8313726, 1, 1,
-0.009733126, 0.4220339, 0.1810276, 0, 0.827451, 1, 1,
-0.007213108, 1.460511, -0.8785405, 0, 0.8196079, 1, 1,
-0.004377464, 0.2961017, 0.2754377, 0, 0.8156863, 1, 1,
-0.003971823, 0.01629502, 1.381066, 0, 0.8078431, 1, 1,
0.0003121647, 0.1754627, 1.495519, 0, 0.8039216, 1, 1,
0.007860257, -1.124943, 4.330084, 0, 0.7960784, 1, 1,
0.01008517, -0.3077983, 3.69343, 0, 0.7882353, 1, 1,
0.0180646, 1.099205, 1.05172, 0, 0.7843137, 1, 1,
0.02006641, -0.416967, 1.830484, 0, 0.7764706, 1, 1,
0.02035278, 0.1878747, 1.401506, 0, 0.772549, 1, 1,
0.0251293, 0.9732732, 0.5625433, 0, 0.7647059, 1, 1,
0.02546505, 0.2092475, -1.122949, 0, 0.7607843, 1, 1,
0.03989241, 0.5254889, 0.2992984, 0, 0.7529412, 1, 1,
0.04027027, -1.025607, 1.742133, 0, 0.7490196, 1, 1,
0.04165271, 0.5165144, -0.6736261, 0, 0.7411765, 1, 1,
0.04409739, 0.1404738, -0.5988674, 0, 0.7372549, 1, 1,
0.04489913, 0.09416529, 0.2322167, 0, 0.7294118, 1, 1,
0.04914209, -0.3025221, 3.339078, 0, 0.7254902, 1, 1,
0.04952535, -0.08729573, 2.065905, 0, 0.7176471, 1, 1,
0.05166559, -2.031447, 3.047369, 0, 0.7137255, 1, 1,
0.05244099, -0.3606508, 1.180612, 0, 0.7058824, 1, 1,
0.05553657, 0.03507303, 2.203565, 0, 0.6980392, 1, 1,
0.060527, 0.4320668, -0.2284825, 0, 0.6941177, 1, 1,
0.06115999, -0.1217164, 4.0789, 0, 0.6862745, 1, 1,
0.06258136, -0.7269416, 3.206441, 0, 0.682353, 1, 1,
0.06348348, 0.7116983, 1.225192, 0, 0.6745098, 1, 1,
0.07105973, -0.1297591, 3.270909, 0, 0.6705883, 1, 1,
0.07214256, 0.7874735, -1.081963, 0, 0.6627451, 1, 1,
0.07773995, 1.063196, 1.130219, 0, 0.6588235, 1, 1,
0.07963696, 0.1966632, 1.644623, 0, 0.6509804, 1, 1,
0.08032998, 0.8429629, -0.1148885, 0, 0.6470588, 1, 1,
0.08237556, 0.8584806, -0.8543901, 0, 0.6392157, 1, 1,
0.08272775, 0.584199, 1.016352, 0, 0.6352941, 1, 1,
0.08417746, 0.2256357, 0.4947977, 0, 0.627451, 1, 1,
0.08798049, 0.2326891, 1.817758, 0, 0.6235294, 1, 1,
0.1043892, -0.2671978, 3.77346, 0, 0.6156863, 1, 1,
0.1062625, -1.8515, 3.665801, 0, 0.6117647, 1, 1,
0.1103121, 1.795597, 1.454566, 0, 0.6039216, 1, 1,
0.1115702, -0.8340549, 2.557799, 0, 0.5960785, 1, 1,
0.118768, -1.267788, 2.66849, 0, 0.5921569, 1, 1,
0.1235905, -1.579095, 2.345406, 0, 0.5843138, 1, 1,
0.1251899, -1.252493, 4.037548, 0, 0.5803922, 1, 1,
0.1274478, 0.3955856, 1.763605, 0, 0.572549, 1, 1,
0.1286747, -0.8020064, 4.223227, 0, 0.5686275, 1, 1,
0.1317065, 1.44588, -0.2484044, 0, 0.5607843, 1, 1,
0.1319794, -0.161198, 0.874654, 0, 0.5568628, 1, 1,
0.1339557, 0.5650114, 0.7018472, 0, 0.5490196, 1, 1,
0.1389683, 0.2793488, 0.6543692, 0, 0.5450981, 1, 1,
0.1409389, 1.131072, 1.171191, 0, 0.5372549, 1, 1,
0.142699, 1.026865, 0.5022782, 0, 0.5333334, 1, 1,
0.1501305, -0.5177085, 3.372061, 0, 0.5254902, 1, 1,
0.1506333, -0.2655041, 3.836194, 0, 0.5215687, 1, 1,
0.1521283, 1.013213, 0.9807217, 0, 0.5137255, 1, 1,
0.1531964, -1.022969, 1.923386, 0, 0.509804, 1, 1,
0.1567993, 0.597562, -0.03023962, 0, 0.5019608, 1, 1,
0.1577527, 1.260033, 0.3802144, 0, 0.4941176, 1, 1,
0.1621694, -0.2900303, 2.347979, 0, 0.4901961, 1, 1,
0.1622308, -0.1778428, 2.712527, 0, 0.4823529, 1, 1,
0.1657644, 1.695598, -0.4583307, 0, 0.4784314, 1, 1,
0.1697093, 0.3337315, -0.2742038, 0, 0.4705882, 1, 1,
0.1714532, 1.298418, -0.4561686, 0, 0.4666667, 1, 1,
0.1765814, 0.4188867, 0.448903, 0, 0.4588235, 1, 1,
0.1791524, -1.333123, 1.926872, 0, 0.454902, 1, 1,
0.1795853, 0.737933, 0.005537782, 0, 0.4470588, 1, 1,
0.1809372, 0.06136925, 2.919183, 0, 0.4431373, 1, 1,
0.1824491, 2.827586, 0.8096173, 0, 0.4352941, 1, 1,
0.1856529, 0.02515987, 2.407203, 0, 0.4313726, 1, 1,
0.1911973, -0.1661921, 4.397635, 0, 0.4235294, 1, 1,
0.1922612, 1.790289, -0.4142828, 0, 0.4196078, 1, 1,
0.1952135, 1.773613, 0.6614617, 0, 0.4117647, 1, 1,
0.1981864, -0.1318977, 1.928283, 0, 0.4078431, 1, 1,
0.1981956, -1.327199, 3.147819, 0, 0.4, 1, 1,
0.1993176, -2.297109, 3.026743, 0, 0.3921569, 1, 1,
0.2015421, 0.5630596, -0.2058926, 0, 0.3882353, 1, 1,
0.2028905, -1.437087, 2.438858, 0, 0.3803922, 1, 1,
0.2059913, 0.5715299, -0.2280923, 0, 0.3764706, 1, 1,
0.2108533, -1.888783, 2.206115, 0, 0.3686275, 1, 1,
0.2109885, 0.8492037, 0.5211232, 0, 0.3647059, 1, 1,
0.2136744, -1.274634, 3.085508, 0, 0.3568628, 1, 1,
0.2171739, -1.412949, 2.965829, 0, 0.3529412, 1, 1,
0.2223258, -1.323379, 3.540593, 0, 0.345098, 1, 1,
0.223033, 0.08861686, -0.11037, 0, 0.3411765, 1, 1,
0.224994, 0.005596462, 1.787987, 0, 0.3333333, 1, 1,
0.2281032, -0.2217831, 2.369265, 0, 0.3294118, 1, 1,
0.2284598, 1.462645, 1.007919, 0, 0.3215686, 1, 1,
0.2287133, 0.1476225, 2.103942, 0, 0.3176471, 1, 1,
0.2309791, -0.352542, 4.102689, 0, 0.3098039, 1, 1,
0.238012, 0.07235202, 0.5776216, 0, 0.3058824, 1, 1,
0.2384473, 0.9732942, 0.7520203, 0, 0.2980392, 1, 1,
0.2393394, -0.3531717, 2.684388, 0, 0.2901961, 1, 1,
0.2396506, 1.978914, 0.6192462, 0, 0.2862745, 1, 1,
0.2445175, -0.178912, 0.9022194, 0, 0.2784314, 1, 1,
0.255548, -0.8486929, 3.848114, 0, 0.2745098, 1, 1,
0.2640133, -0.1468814, 2.286082, 0, 0.2666667, 1, 1,
0.2672639, 0.8692181, 1.051321, 0, 0.2627451, 1, 1,
0.2695093, 0.5026966, 1.043468, 0, 0.254902, 1, 1,
0.2699343, 0.4801839, 0.249883, 0, 0.2509804, 1, 1,
0.2737627, 1.67208, 1.228928, 0, 0.2431373, 1, 1,
0.2741765, 0.6864137, 1.441034, 0, 0.2392157, 1, 1,
0.2755153, -1.171327, 1.376958, 0, 0.2313726, 1, 1,
0.2762836, 0.06682897, 0.1635462, 0, 0.227451, 1, 1,
0.2821337, -1.161707, 4.153494, 0, 0.2196078, 1, 1,
0.2864199, 1.353229, -1.809293, 0, 0.2156863, 1, 1,
0.2881266, -0.107041, 1.957764, 0, 0.2078431, 1, 1,
0.2896925, 0.9093044, -1.391374, 0, 0.2039216, 1, 1,
0.290379, 1.707026, 0.8600647, 0, 0.1960784, 1, 1,
0.2932782, -0.4738446, 3.786091, 0, 0.1882353, 1, 1,
0.2936409, -1.065108, 3.676781, 0, 0.1843137, 1, 1,
0.2972565, -0.5612283, 0.6099894, 0, 0.1764706, 1, 1,
0.2973813, 0.1274479, 2.193555, 0, 0.172549, 1, 1,
0.3002042, 1.190397, 0.2827968, 0, 0.1647059, 1, 1,
0.3039148, -1.406224, 2.808775, 0, 0.1607843, 1, 1,
0.3043097, -0.8619186, 1.937126, 0, 0.1529412, 1, 1,
0.3066904, 1.00456, -0.2419168, 0, 0.1490196, 1, 1,
0.3095872, -1.214545, 2.523554, 0, 0.1411765, 1, 1,
0.3150846, 1.352985, -0.5409492, 0, 0.1372549, 1, 1,
0.3159226, -0.9424605, 2.672035, 0, 0.1294118, 1, 1,
0.3164617, -1.733876, 1.747593, 0, 0.1254902, 1, 1,
0.3179342, 1.554927, 0.3040099, 0, 0.1176471, 1, 1,
0.3212813, 0.1943164, 0.6762145, 0, 0.1137255, 1, 1,
0.3278909, -1.475337, 2.908145, 0, 0.1058824, 1, 1,
0.334446, -0.3603846, 2.540067, 0, 0.09803922, 1, 1,
0.3348039, -0.2843489, 3.2398, 0, 0.09411765, 1, 1,
0.3353829, 0.5771697, 1.499147, 0, 0.08627451, 1, 1,
0.3373004, -0.3195799, 3.043454, 0, 0.08235294, 1, 1,
0.3375573, 1.359767, -0.571141, 0, 0.07450981, 1, 1,
0.338458, -0.3517061, 2.345224, 0, 0.07058824, 1, 1,
0.3473792, -1.117877, 3.683558, 0, 0.0627451, 1, 1,
0.3476962, 0.7935397, -1.390327, 0, 0.05882353, 1, 1,
0.353675, 0.4702963, -0.1575736, 0, 0.05098039, 1, 1,
0.3559885, -0.2273962, -0.7859151, 0, 0.04705882, 1, 1,
0.3652298, -0.3784351, 3.230411, 0, 0.03921569, 1, 1,
0.3709685, -0.3299337, 2.501589, 0, 0.03529412, 1, 1,
0.374559, -0.5672422, 2.521754, 0, 0.02745098, 1, 1,
0.3819933, -1.546068, 2.660161, 0, 0.02352941, 1, 1,
0.3823344, 0.1882363, 0.550096, 0, 0.01568628, 1, 1,
0.3857218, 1.086262, 0.4288007, 0, 0.01176471, 1, 1,
0.3875604, 0.5662232, 0.178865, 0, 0.003921569, 1, 1,
0.3890302, -1.038686, 1.070884, 0.003921569, 0, 1, 1,
0.3903896, 0.5387059, -1.070952, 0.007843138, 0, 1, 1,
0.3942754, -0.3602297, 3.125661, 0.01568628, 0, 1, 1,
0.3960317, -0.4274807, 2.858598, 0.01960784, 0, 1, 1,
0.4008228, 1.365933, 1.303407, 0.02745098, 0, 1, 1,
0.4038667, -0.7468099, 1.297482, 0.03137255, 0, 1, 1,
0.4070152, 0.01090531, 0.5458342, 0.03921569, 0, 1, 1,
0.4073791, 1.185788, -0.250886, 0.04313726, 0, 1, 1,
0.408157, 0.6378691, 1.063973, 0.05098039, 0, 1, 1,
0.4084841, -2.216462, 3.768883, 0.05490196, 0, 1, 1,
0.409783, -0.9732875, 2.042525, 0.0627451, 0, 1, 1,
0.4101405, 0.3067182, 4.520295, 0.06666667, 0, 1, 1,
0.4143838, -0.01255906, 3.302699, 0.07450981, 0, 1, 1,
0.4158299, 0.2107179, 2.335155, 0.07843138, 0, 1, 1,
0.4173592, -1.683474, 1.675495, 0.08627451, 0, 1, 1,
0.4184967, 0.8656653, 0.03995587, 0.09019608, 0, 1, 1,
0.4216085, 0.7916536, 0.992249, 0.09803922, 0, 1, 1,
0.4245948, -0.8760028, 2.171942, 0.1058824, 0, 1, 1,
0.4253444, -0.6731812, 0.7015066, 0.1098039, 0, 1, 1,
0.4261409, 0.9282938, 0.3522243, 0.1176471, 0, 1, 1,
0.4263807, 1.029076, 1.241988, 0.1215686, 0, 1, 1,
0.4288929, -0.01094007, 2.933769, 0.1294118, 0, 1, 1,
0.4294719, -1.727474, 2.678643, 0.1333333, 0, 1, 1,
0.4303192, -1.083289, 2.669516, 0.1411765, 0, 1, 1,
0.4347998, 0.1312785, 1.455694, 0.145098, 0, 1, 1,
0.4377457, 0.8736259, -1.307646, 0.1529412, 0, 1, 1,
0.4397009, 0.6380561, 2.711199, 0.1568628, 0, 1, 1,
0.439914, -0.3608987, 1.337151, 0.1647059, 0, 1, 1,
0.4406817, 0.7441208, 0.3741115, 0.1686275, 0, 1, 1,
0.4417602, -0.1309287, 1.646801, 0.1764706, 0, 1, 1,
0.4468759, -0.2194694, 0.7539862, 0.1803922, 0, 1, 1,
0.4490368, -0.1235934, 1.242077, 0.1882353, 0, 1, 1,
0.4518133, 0.1417222, 1.032137, 0.1921569, 0, 1, 1,
0.4558804, -0.07764821, 1.721219, 0.2, 0, 1, 1,
0.4581434, 1.538007, -0.3654701, 0.2078431, 0, 1, 1,
0.4597817, -0.01970378, 0.2587304, 0.2117647, 0, 1, 1,
0.4621046, -1.604497, 1.446089, 0.2196078, 0, 1, 1,
0.4638736, -1.063312, 1.324064, 0.2235294, 0, 1, 1,
0.4683731, -1.384175, 3.82404, 0.2313726, 0, 1, 1,
0.4687243, 1.736338, -0.2765382, 0.2352941, 0, 1, 1,
0.4696919, 0.03934376, 0.7581227, 0.2431373, 0, 1, 1,
0.4719487, 0.4380905, 1.415384, 0.2470588, 0, 1, 1,
0.4787365, 0.4781115, 0.566502, 0.254902, 0, 1, 1,
0.4789542, -0.2153455, 0.7334047, 0.2588235, 0, 1, 1,
0.4796415, -0.791384, 1.979035, 0.2666667, 0, 1, 1,
0.4846188, 0.272387, 0.9233479, 0.2705882, 0, 1, 1,
0.4864304, -0.8042595, 3.086138, 0.2784314, 0, 1, 1,
0.4872925, -1.302462, 4.431691, 0.282353, 0, 1, 1,
0.4896644, 1.254583, -0.3382424, 0.2901961, 0, 1, 1,
0.5019888, 0.9699953, -0.2776525, 0.2941177, 0, 1, 1,
0.5021756, -0.7114305, 2.390882, 0.3019608, 0, 1, 1,
0.5045711, -1.540727, 2.908816, 0.3098039, 0, 1, 1,
0.5048065, -1.806008, 2.430124, 0.3137255, 0, 1, 1,
0.512219, 0.2047206, 1.526682, 0.3215686, 0, 1, 1,
0.5147429, -0.4505964, 2.456974, 0.3254902, 0, 1, 1,
0.516827, 0.5998642, -0.3029467, 0.3333333, 0, 1, 1,
0.5197446, -0.2343435, 2.556555, 0.3372549, 0, 1, 1,
0.5200343, -0.5322865, 3.406381, 0.345098, 0, 1, 1,
0.5225865, -0.4087857, 2.019588, 0.3490196, 0, 1, 1,
0.5241258, 0.5965368, 1.247743, 0.3568628, 0, 1, 1,
0.5270007, 0.04597175, 2.237236, 0.3607843, 0, 1, 1,
0.527608, 0.34287, 0.3405763, 0.3686275, 0, 1, 1,
0.528346, -0.659361, 1.204161, 0.372549, 0, 1, 1,
0.5285425, 0.2043563, 2.08506, 0.3803922, 0, 1, 1,
0.5416379, 2.433024, 1.627724, 0.3843137, 0, 1, 1,
0.5468273, -0.4441215, 2.705936, 0.3921569, 0, 1, 1,
0.5483936, -0.2965833, 1.897957, 0.3960784, 0, 1, 1,
0.5591031, 1.892102, 2.011468, 0.4039216, 0, 1, 1,
0.5606022, 0.6386613, -1.241102, 0.4117647, 0, 1, 1,
0.5641612, -0.5347896, 1.380849, 0.4156863, 0, 1, 1,
0.5725675, 1.038323, 2.230685, 0.4235294, 0, 1, 1,
0.5769998, -1.086377, 1.374669, 0.427451, 0, 1, 1,
0.5778515, -1.424447, 2.771168, 0.4352941, 0, 1, 1,
0.5785623, -0.08772554, 2.35875, 0.4392157, 0, 1, 1,
0.5854223, -0.5684613, 1.275456, 0.4470588, 0, 1, 1,
0.5889575, 1.269309, 1.409039, 0.4509804, 0, 1, 1,
0.5894587, 0.8245825, 0.5110886, 0.4588235, 0, 1, 1,
0.5905982, -0.02993355, 2.517135, 0.4627451, 0, 1, 1,
0.6000125, -2.169799, 3.058625, 0.4705882, 0, 1, 1,
0.6010826, 0.6526063, 2.28656, 0.4745098, 0, 1, 1,
0.6038823, -0.2968493, 0.2476503, 0.4823529, 0, 1, 1,
0.6076058, -0.07583507, 0.7800655, 0.4862745, 0, 1, 1,
0.6142635, 0.222384, 1.773622, 0.4941176, 0, 1, 1,
0.6153112, -1.324357, 2.869727, 0.5019608, 0, 1, 1,
0.6182154, 0.425155, 1.284881, 0.5058824, 0, 1, 1,
0.6199384, 0.6695387, 0.5856085, 0.5137255, 0, 1, 1,
0.6208315, 0.2161634, 1.51035, 0.5176471, 0, 1, 1,
0.6259352, -0.3469996, 2.819515, 0.5254902, 0, 1, 1,
0.6281502, -1.589082, 2.463726, 0.5294118, 0, 1, 1,
0.6365206, 0.1211902, 1.385972, 0.5372549, 0, 1, 1,
0.6387207, -0.5167741, 3.114864, 0.5411765, 0, 1, 1,
0.652995, -1.446142, 3.112634, 0.5490196, 0, 1, 1,
0.6584606, 0.8481852, 0.8224654, 0.5529412, 0, 1, 1,
0.6585304, 1.010257, -1.223177, 0.5607843, 0, 1, 1,
0.6585465, -1.308725, 1.224925, 0.5647059, 0, 1, 1,
0.6614177, 1.270009, 0.656567, 0.572549, 0, 1, 1,
0.6688662, 0.2491759, 0.1246885, 0.5764706, 0, 1, 1,
0.669804, -0.8013725, 0.3294564, 0.5843138, 0, 1, 1,
0.6768975, -0.4442551, 2.35094, 0.5882353, 0, 1, 1,
0.6774754, 1.356613, -0.5325758, 0.5960785, 0, 1, 1,
0.6791577, 1.228974, 3.162697, 0.6039216, 0, 1, 1,
0.6813778, 1.222482, 0.1442448, 0.6078432, 0, 1, 1,
0.687656, -0.001386573, 2.472707, 0.6156863, 0, 1, 1,
0.6926963, 0.785376, 1.202689, 0.6196079, 0, 1, 1,
0.6966906, -0.8406741, 1.49894, 0.627451, 0, 1, 1,
0.698478, -0.4792178, 0.1985072, 0.6313726, 0, 1, 1,
0.698792, -0.8077476, 1.768081, 0.6392157, 0, 1, 1,
0.7009178, 0.8467109, 0.5198989, 0.6431373, 0, 1, 1,
0.7203707, -0.5094994, 2.482188, 0.6509804, 0, 1, 1,
0.722226, 0.1211082, 1.384835, 0.654902, 0, 1, 1,
0.7239832, -0.748989, 2.740938, 0.6627451, 0, 1, 1,
0.7249351, -0.3185447, 2.060102, 0.6666667, 0, 1, 1,
0.728406, -1.274043, 2.884688, 0.6745098, 0, 1, 1,
0.729829, 1.00267, 0.5819138, 0.6784314, 0, 1, 1,
0.7302365, 1.524785, 0.7676007, 0.6862745, 0, 1, 1,
0.7338244, -0.7293278, 2.307846, 0.6901961, 0, 1, 1,
0.7384787, 1.058042, 0.8108749, 0.6980392, 0, 1, 1,
0.7392849, -1.10328, 2.803677, 0.7058824, 0, 1, 1,
0.7474553, -0.9104965, 4.040386, 0.7098039, 0, 1, 1,
0.7479581, -0.9238344, 2.564887, 0.7176471, 0, 1, 1,
0.7519709, -0.1710496, 3.042984, 0.7215686, 0, 1, 1,
0.7611112, 0.6705872, -0.6632189, 0.7294118, 0, 1, 1,
0.7648212, -1.111029, 2.588505, 0.7333333, 0, 1, 1,
0.7707902, 1.27785, 1.018884, 0.7411765, 0, 1, 1,
0.7714254, -0.914398, 1.5598, 0.7450981, 0, 1, 1,
0.7728315, -0.647276, 1.774171, 0.7529412, 0, 1, 1,
0.7731963, -0.3025319, 1.73899, 0.7568628, 0, 1, 1,
0.7781693, -0.7446015, 3.211211, 0.7647059, 0, 1, 1,
0.779533, -2.009203, 4.316569, 0.7686275, 0, 1, 1,
0.7795749, -0.7194401, 1.419409, 0.7764706, 0, 1, 1,
0.7805048, 0.9372847, 0.2907415, 0.7803922, 0, 1, 1,
0.7826401, 0.6112347, 1.296094, 0.7882353, 0, 1, 1,
0.7944624, -0.8601356, 3.04521, 0.7921569, 0, 1, 1,
0.7971581, 0.4265261, -1.199307, 0.8, 0, 1, 1,
0.8014113, 0.2057105, 3.563061, 0.8078431, 0, 1, 1,
0.8035601, -0.362494, 2.057115, 0.8117647, 0, 1, 1,
0.8036507, 0.6608291, 0.6987647, 0.8196079, 0, 1, 1,
0.8076252, -0.1116305, 0.7064999, 0.8235294, 0, 1, 1,
0.8088092, -1.564899, 3.392906, 0.8313726, 0, 1, 1,
0.8118506, 0.6567674, 0.9075149, 0.8352941, 0, 1, 1,
0.8157383, 0.591671, 2.450591, 0.8431373, 0, 1, 1,
0.8190262, -1.045078, 2.776202, 0.8470588, 0, 1, 1,
0.8213009, -1.477984, 3.280735, 0.854902, 0, 1, 1,
0.8286267, -0.05051367, 0.1590878, 0.8588235, 0, 1, 1,
0.8338403, -0.4627171, 3.02559, 0.8666667, 0, 1, 1,
0.8342732, 0.38093, 0.5715827, 0.8705882, 0, 1, 1,
0.8444679, -0.1755262, 0.2343461, 0.8784314, 0, 1, 1,
0.8520976, -0.216965, 1.983074, 0.8823529, 0, 1, 1,
0.8528751, 0.7107269, -0.2342673, 0.8901961, 0, 1, 1,
0.8566102, -0.1629626, 0.6980892, 0.8941177, 0, 1, 1,
0.8579708, 0.8394263, 1.450545, 0.9019608, 0, 1, 1,
0.864474, 0.1784576, -0.1657319, 0.9098039, 0, 1, 1,
0.86515, -0.2524599, 3.764485, 0.9137255, 0, 1, 1,
0.8755553, 0.5838327, 0.309049, 0.9215686, 0, 1, 1,
0.8763936, 1.491829, 0.6871713, 0.9254902, 0, 1, 1,
0.8800293, -1.054886, 1.643467, 0.9333333, 0, 1, 1,
0.8804057, -0.5075365, 1.614185, 0.9372549, 0, 1, 1,
0.8854215, 0.2967082, 0.7058867, 0.945098, 0, 1, 1,
0.8916855, 0.7872112, 0.5085659, 0.9490196, 0, 1, 1,
0.8974417, -0.5765021, 2.527062, 0.9568627, 0, 1, 1,
0.8975018, -1.02836, 2.782771, 0.9607843, 0, 1, 1,
0.9021262, -0.9864532, 0.8408275, 0.9686275, 0, 1, 1,
0.9032682, 0.9531291, 2.309609, 0.972549, 0, 1, 1,
0.9060156, -2.197126, 1.991682, 0.9803922, 0, 1, 1,
0.9075475, 1.510407, 2.000874, 0.9843137, 0, 1, 1,
0.9080151, -1.54202, 2.602767, 0.9921569, 0, 1, 1,
0.9088965, 2.277336, 1.194156, 0.9960784, 0, 1, 1,
0.9097592, 0.233825, 1.716609, 1, 0, 0.9960784, 1,
0.9116629, 0.08989964, 2.089125, 1, 0, 0.9882353, 1,
0.9130944, -0.4094591, 1.992478, 1, 0, 0.9843137, 1,
0.9134043, -0.7799321, 2.501966, 1, 0, 0.9764706, 1,
0.917304, -0.3788711, 2.681455, 1, 0, 0.972549, 1,
0.9211223, 0.229851, 1.196115, 1, 0, 0.9647059, 1,
0.9279769, 0.03056703, 2.762007, 1, 0, 0.9607843, 1,
0.928604, -0.3030666, 1.811136, 1, 0, 0.9529412, 1,
0.9321647, -0.4486982, 3.119326, 1, 0, 0.9490196, 1,
0.9324088, 0.09940598, 1.250537, 1, 0, 0.9411765, 1,
0.9336753, -0.4313847, 2.603638, 1, 0, 0.9372549, 1,
0.9357759, -0.186536, 0.4684657, 1, 0, 0.9294118, 1,
0.9395069, 0.1010492, -0.01879849, 1, 0, 0.9254902, 1,
0.9406622, -0.3073929, 1.391241, 1, 0, 0.9176471, 1,
0.9444032, 0.47199, 1.296831, 1, 0, 0.9137255, 1,
0.9465313, 0.309703, 2.694138, 1, 0, 0.9058824, 1,
0.9519653, 0.003568341, 1.615083, 1, 0, 0.9019608, 1,
0.956697, -2.049113, 3.82625, 1, 0, 0.8941177, 1,
0.9631851, 0.9369872, 2.301206, 1, 0, 0.8862745, 1,
0.96609, -1.122543, 2.256108, 1, 0, 0.8823529, 1,
0.9671959, 0.6533306, 1.13972, 1, 0, 0.8745098, 1,
0.9704189, -0.852569, 2.722833, 1, 0, 0.8705882, 1,
0.9732221, -1.672276, 2.54005, 1, 0, 0.8627451, 1,
0.98445, -0.2123153, 0.6960304, 1, 0, 0.8588235, 1,
0.9875401, -0.0864329, 0.04513671, 1, 0, 0.8509804, 1,
0.989449, -0.738146, 1.994513, 1, 0, 0.8470588, 1,
0.9960628, 0.9652893, 1.337406, 1, 0, 0.8392157, 1,
1.001364, -0.9897592, 2.034358, 1, 0, 0.8352941, 1,
1.004408, 0.03046316, -0.4537325, 1, 0, 0.827451, 1,
1.008421, 0.8711548, 0.5805606, 1, 0, 0.8235294, 1,
1.010628, -0.762037, 1.176779, 1, 0, 0.8156863, 1,
1.011837, 0.8929726, 0.8126521, 1, 0, 0.8117647, 1,
1.013212, 0.5239473, 1.328532, 1, 0, 0.8039216, 1,
1.018489, -0.7571269, 1.303319, 1, 0, 0.7960784, 1,
1.020345, 1.280435, 1.993312, 1, 0, 0.7921569, 1,
1.029894, 0.6671422, 1.468477, 1, 0, 0.7843137, 1,
1.030542, -0.1903443, 2.880198, 1, 0, 0.7803922, 1,
1.031893, 2.852265, 1.46904, 1, 0, 0.772549, 1,
1.032184, 0.3515927, 2.273231, 1, 0, 0.7686275, 1,
1.038451, -1.245061, 2.303569, 1, 0, 0.7607843, 1,
1.046944, -0.1090816, 1.897031, 1, 0, 0.7568628, 1,
1.053119, 0.7488886, 2.329125, 1, 0, 0.7490196, 1,
1.064906, 0.06130777, 3.473943, 1, 0, 0.7450981, 1,
1.071443, -0.4695597, -0.2216626, 1, 0, 0.7372549, 1,
1.072468, -0.1918929, 2.533801, 1, 0, 0.7333333, 1,
1.079554, 0.5467176, 0.4244865, 1, 0, 0.7254902, 1,
1.080978, 0.1063149, 0.6970329, 1, 0, 0.7215686, 1,
1.085326, 0.04821713, 2.091035, 1, 0, 0.7137255, 1,
1.088717, -1.721412, 2.32327, 1, 0, 0.7098039, 1,
1.089369, -0.6247541, 1.716615, 1, 0, 0.7019608, 1,
1.1066, 0.3824782, 2.981993, 1, 0, 0.6941177, 1,
1.10903, -0.9239888, 0.6853549, 1, 0, 0.6901961, 1,
1.10957, 1.408175, 0.839332, 1, 0, 0.682353, 1,
1.139156, 0.4891711, 1.305605, 1, 0, 0.6784314, 1,
1.14011, 0.5678038, 2.528254, 1, 0, 0.6705883, 1,
1.141906, -1.219693, 0.2723272, 1, 0, 0.6666667, 1,
1.142575, -3.0477, 3.093904, 1, 0, 0.6588235, 1,
1.156666, -0.5379589, 0.3475679, 1, 0, 0.654902, 1,
1.160138, -0.8373878, 1.405144, 1, 0, 0.6470588, 1,
1.171116, 3.160207, 0.3895101, 1, 0, 0.6431373, 1,
1.172294, -0.92985, 1.56799, 1, 0, 0.6352941, 1,
1.175466, 0.3896607, 1.147396, 1, 0, 0.6313726, 1,
1.178006, -2.141601, 0.9296369, 1, 0, 0.6235294, 1,
1.181729, -1.552522, 0.8750188, 1, 0, 0.6196079, 1,
1.189299, 1.263774, 0.6244964, 1, 0, 0.6117647, 1,
1.189875, 0.2570623, 1.926592, 1, 0, 0.6078432, 1,
1.210619, 1.057471, 1.024292, 1, 0, 0.6, 1,
1.215728, -0.1662409, 0.5615416, 1, 0, 0.5921569, 1,
1.221786, -0.6602409, 1.801748, 1, 0, 0.5882353, 1,
1.22341, 0.263525, 1.742147, 1, 0, 0.5803922, 1,
1.229299, 1.668907, 0.5377184, 1, 0, 0.5764706, 1,
1.23155, -0.8376369, 3.451539, 1, 0, 0.5686275, 1,
1.264706, -0.8708511, 3.301466, 1, 0, 0.5647059, 1,
1.282948, -0.4348176, 1.482871, 1, 0, 0.5568628, 1,
1.283204, 0.6780422, 0.2824111, 1, 0, 0.5529412, 1,
1.297105, -0.2420915, 0.09539193, 1, 0, 0.5450981, 1,
1.298965, -1.325538, 3.193852, 1, 0, 0.5411765, 1,
1.309473, -1.126271, 2.156007, 1, 0, 0.5333334, 1,
1.312938, 1.50935, 1.988118, 1, 0, 0.5294118, 1,
1.346324, 1.255538, 1.41488, 1, 0, 0.5215687, 1,
1.353894, 0.08963332, 1.252545, 1, 0, 0.5176471, 1,
1.355423, 1.168758, 1.129841, 1, 0, 0.509804, 1,
1.358042, 0.6294501, 0.3393389, 1, 0, 0.5058824, 1,
1.368751, 0.7226021, 2.109256, 1, 0, 0.4980392, 1,
1.369174, 1.618733, 1.303542, 1, 0, 0.4901961, 1,
1.375777, 0.2949064, 2.217371, 1, 0, 0.4862745, 1,
1.383519, 1.490294, 2.007125, 1, 0, 0.4784314, 1,
1.384606, 1.823973, 0.1449796, 1, 0, 0.4745098, 1,
1.403485, 1.240118, 0.335065, 1, 0, 0.4666667, 1,
1.405626, 1.600889, 1.755908, 1, 0, 0.4627451, 1,
1.426019, -0.3107539, 1.513401, 1, 0, 0.454902, 1,
1.426826, -0.3049961, 1.32545, 1, 0, 0.4509804, 1,
1.435926, -0.7345378, 3.026588, 1, 0, 0.4431373, 1,
1.442458, -1.201884, 2.257276, 1, 0, 0.4392157, 1,
1.450253, -0.5578923, 2.293975, 1, 0, 0.4313726, 1,
1.452109, -0.3613414, 0.7794421, 1, 0, 0.427451, 1,
1.452305, 0.5930914, 0.1717481, 1, 0, 0.4196078, 1,
1.456671, -0.6570255, 1.373935, 1, 0, 0.4156863, 1,
1.462137, -2.566754, 2.249852, 1, 0, 0.4078431, 1,
1.473989, -0.3135062, 2.085336, 1, 0, 0.4039216, 1,
1.482032, -0.09634362, 1.201396, 1, 0, 0.3960784, 1,
1.485584, 2.580743, 2.376918, 1, 0, 0.3882353, 1,
1.495332, 0.3389211, 2.861501, 1, 0, 0.3843137, 1,
1.505593, 0.3920537, 1.047656, 1, 0, 0.3764706, 1,
1.512212, -0.2810932, 2.357716, 1, 0, 0.372549, 1,
1.523947, -1.961202, 3.43835, 1, 0, 0.3647059, 1,
1.548171, 0.6924561, 2.259054, 1, 0, 0.3607843, 1,
1.551602, 0.6598412, -0.08551793, 1, 0, 0.3529412, 1,
1.565554, 2.000132, 0.0176802, 1, 0, 0.3490196, 1,
1.576099, 2.297727, -0.004090596, 1, 0, 0.3411765, 1,
1.578132, -0.9353688, 1.766578, 1, 0, 0.3372549, 1,
1.609801, 1.051852, 0.09509207, 1, 0, 0.3294118, 1,
1.611278, -0.5715079, 3.409593, 1, 0, 0.3254902, 1,
1.611584, -1.320077, 1.5781, 1, 0, 0.3176471, 1,
1.623495, -0.46913, 3.107247, 1, 0, 0.3137255, 1,
1.633838, 0.6059976, 0.9579977, 1, 0, 0.3058824, 1,
1.634088, 0.07393511, 0.4284553, 1, 0, 0.2980392, 1,
1.644726, -0.4372171, 2.290575, 1, 0, 0.2941177, 1,
1.65309, 0.8093999, 2.730279, 1, 0, 0.2862745, 1,
1.691392, -1.1222, 3.580265, 1, 0, 0.282353, 1,
1.72498, 1.538881, 1.876987, 1, 0, 0.2745098, 1,
1.74659, 2.07357, -0.06020168, 1, 0, 0.2705882, 1,
1.762594, 0.8380582, 1.186808, 1, 0, 0.2627451, 1,
1.767918, 0.3129295, 2.101494, 1, 0, 0.2588235, 1,
1.774633, 0.6163836, 1.60837, 1, 0, 0.2509804, 1,
1.78207, -0.1017497, 1.886175, 1, 0, 0.2470588, 1,
1.78662, -0.5473497, 3.419864, 1, 0, 0.2392157, 1,
1.789207, 1.481923, 0.3184167, 1, 0, 0.2352941, 1,
1.794051, 0.09295008, 1.325407, 1, 0, 0.227451, 1,
1.8044, -0.340184, 3.450724, 1, 0, 0.2235294, 1,
1.805639, 1.347625, -0.4663695, 1, 0, 0.2156863, 1,
1.815365, -1.069748, 2.706896, 1, 0, 0.2117647, 1,
1.8222, -0.9330654, 2.293251, 1, 0, 0.2039216, 1,
1.83533, 1.340657, 0.1502955, 1, 0, 0.1960784, 1,
1.842659, -0.6986854, 1.94477, 1, 0, 0.1921569, 1,
1.858432, 0.3337509, 0.7833045, 1, 0, 0.1843137, 1,
1.886315, -0.3785369, 2.515471, 1, 0, 0.1803922, 1,
1.886394, 1.516843, 1.597401, 1, 0, 0.172549, 1,
1.88985, 0.1924803, 2.008866, 1, 0, 0.1686275, 1,
1.905606, 0.0001268651, 1.534677, 1, 0, 0.1607843, 1,
1.920349, 0.7681268, 2.401069, 1, 0, 0.1568628, 1,
1.928102, -0.3814165, 0.3593467, 1, 0, 0.1490196, 1,
1.930034, 0.6511999, 2.716293, 1, 0, 0.145098, 1,
1.974731, 1.713512, 1.371548, 1, 0, 0.1372549, 1,
1.991353, -0.4309847, 1.454732, 1, 0, 0.1333333, 1,
2.002158, -1.192368, 2.074286, 1, 0, 0.1254902, 1,
2.020913, 1.262413, -1.378848, 1, 0, 0.1215686, 1,
2.025722, -1.013491, 2.355717, 1, 0, 0.1137255, 1,
2.027645, 0.02855775, 1.378553, 1, 0, 0.1098039, 1,
2.033749, 0.8708715, 2.786357, 1, 0, 0.1019608, 1,
2.06745, 1.271095, 0.3275442, 1, 0, 0.09411765, 1,
2.094254, -1.133258, 0.6520025, 1, 0, 0.09019608, 1,
2.132117, -0.932247, 3.365734, 1, 0, 0.08235294, 1,
2.14747, -1.450456, 3.121163, 1, 0, 0.07843138, 1,
2.171139, -0.2842886, 1.188051, 1, 0, 0.07058824, 1,
2.172117, -0.491825, 3.099322, 1, 0, 0.06666667, 1,
2.231025, -0.1244578, 1.941729, 1, 0, 0.05882353, 1,
2.244237, -1.789787, 1.005079, 1, 0, 0.05490196, 1,
2.253929, 1.178554, 1.423079, 1, 0, 0.04705882, 1,
2.274327, -0.8753662, 0.7175699, 1, 0, 0.04313726, 1,
2.366686, 0.4677409, 0.9830158, 1, 0, 0.03529412, 1,
2.369151, -0.3773381, 2.628994, 1, 0, 0.03137255, 1,
2.383929, 0.8729421, 3.338447, 1, 0, 0.02352941, 1,
2.586943, 0.2234706, 0.506372, 1, 0, 0.01960784, 1,
2.811102, 1.316838, -0.1215855, 1, 0, 0.01176471, 1,
3.600962, 1.198328, 1.710632, 1, 0, 0.007843138, 1
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
0.4611547, -4.099941, -7.128763, 0, -0.5, 0.5, 0.5,
0.4611547, -4.099941, -7.128763, 1, -0.5, 0.5, 0.5,
0.4611547, -4.099941, -7.128763, 1, 1.5, 0.5, 0.5,
0.4611547, -4.099941, -7.128763, 0, 1.5, 0.5, 0.5
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
-3.743048, 0.05625319, -7.128763, 0, -0.5, 0.5, 0.5,
-3.743048, 0.05625319, -7.128763, 1, -0.5, 0.5, 0.5,
-3.743048, 0.05625319, -7.128763, 1, 1.5, 0.5, 0.5,
-3.743048, 0.05625319, -7.128763, 0, 1.5, 0.5, 0.5
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
-3.743048, -4.099941, -0.4600632, 0, -0.5, 0.5, 0.5,
-3.743048, -4.099941, -0.4600632, 1, -0.5, 0.5, 0.5,
-3.743048, -4.099941, -0.4600632, 1, 1.5, 0.5, 0.5,
-3.743048, -4.099941, -0.4600632, 0, 1.5, 0.5, 0.5
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
-2, -3.140819, -5.589832,
3, -3.140819, -5.589832,
-2, -3.140819, -5.589832,
-2, -3.300673, -5.846321,
-1, -3.140819, -5.589832,
-1, -3.300673, -5.846321,
0, -3.140819, -5.589832,
0, -3.300673, -5.846321,
1, -3.140819, -5.589832,
1, -3.300673, -5.846321,
2, -3.140819, -5.589832,
2, -3.300673, -5.846321,
3, -3.140819, -5.589832,
3, -3.300673, -5.846321
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
-2, -3.62038, -6.359298, 0, -0.5, 0.5, 0.5,
-2, -3.62038, -6.359298, 1, -0.5, 0.5, 0.5,
-2, -3.62038, -6.359298, 1, 1.5, 0.5, 0.5,
-2, -3.62038, -6.359298, 0, 1.5, 0.5, 0.5,
-1, -3.62038, -6.359298, 0, -0.5, 0.5, 0.5,
-1, -3.62038, -6.359298, 1, -0.5, 0.5, 0.5,
-1, -3.62038, -6.359298, 1, 1.5, 0.5, 0.5,
-1, -3.62038, -6.359298, 0, 1.5, 0.5, 0.5,
0, -3.62038, -6.359298, 0, -0.5, 0.5, 0.5,
0, -3.62038, -6.359298, 1, -0.5, 0.5, 0.5,
0, -3.62038, -6.359298, 1, 1.5, 0.5, 0.5,
0, -3.62038, -6.359298, 0, 1.5, 0.5, 0.5,
1, -3.62038, -6.359298, 0, -0.5, 0.5, 0.5,
1, -3.62038, -6.359298, 1, -0.5, 0.5, 0.5,
1, -3.62038, -6.359298, 1, 1.5, 0.5, 0.5,
1, -3.62038, -6.359298, 0, 1.5, 0.5, 0.5,
2, -3.62038, -6.359298, 0, -0.5, 0.5, 0.5,
2, -3.62038, -6.359298, 1, -0.5, 0.5, 0.5,
2, -3.62038, -6.359298, 1, 1.5, 0.5, 0.5,
2, -3.62038, -6.359298, 0, 1.5, 0.5, 0.5,
3, -3.62038, -6.359298, 0, -0.5, 0.5, 0.5,
3, -3.62038, -6.359298, 1, -0.5, 0.5, 0.5,
3, -3.62038, -6.359298, 1, 1.5, 0.5, 0.5,
3, -3.62038, -6.359298, 0, 1.5, 0.5, 0.5
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
-2.772847, -3, -5.589832,
-2.772847, 3, -5.589832,
-2.772847, -3, -5.589832,
-2.934547, -3, -5.846321,
-2.772847, -2, -5.589832,
-2.934547, -2, -5.846321,
-2.772847, -1, -5.589832,
-2.934547, -1, -5.846321,
-2.772847, 0, -5.589832,
-2.934547, 0, -5.846321,
-2.772847, 1, -5.589832,
-2.934547, 1, -5.846321,
-2.772847, 2, -5.589832,
-2.934547, 2, -5.846321,
-2.772847, 3, -5.589832,
-2.934547, 3, -5.846321
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
-3.257947, -3, -6.359298, 0, -0.5, 0.5, 0.5,
-3.257947, -3, -6.359298, 1, -0.5, 0.5, 0.5,
-3.257947, -3, -6.359298, 1, 1.5, 0.5, 0.5,
-3.257947, -3, -6.359298, 0, 1.5, 0.5, 0.5,
-3.257947, -2, -6.359298, 0, -0.5, 0.5, 0.5,
-3.257947, -2, -6.359298, 1, -0.5, 0.5, 0.5,
-3.257947, -2, -6.359298, 1, 1.5, 0.5, 0.5,
-3.257947, -2, -6.359298, 0, 1.5, 0.5, 0.5,
-3.257947, -1, -6.359298, 0, -0.5, 0.5, 0.5,
-3.257947, -1, -6.359298, 1, -0.5, 0.5, 0.5,
-3.257947, -1, -6.359298, 1, 1.5, 0.5, 0.5,
-3.257947, -1, -6.359298, 0, 1.5, 0.5, 0.5,
-3.257947, 0, -6.359298, 0, -0.5, 0.5, 0.5,
-3.257947, 0, -6.359298, 1, -0.5, 0.5, 0.5,
-3.257947, 0, -6.359298, 1, 1.5, 0.5, 0.5,
-3.257947, 0, -6.359298, 0, 1.5, 0.5, 0.5,
-3.257947, 1, -6.359298, 0, -0.5, 0.5, 0.5,
-3.257947, 1, -6.359298, 1, -0.5, 0.5, 0.5,
-3.257947, 1, -6.359298, 1, 1.5, 0.5, 0.5,
-3.257947, 1, -6.359298, 0, 1.5, 0.5, 0.5,
-3.257947, 2, -6.359298, 0, -0.5, 0.5, 0.5,
-3.257947, 2, -6.359298, 1, -0.5, 0.5, 0.5,
-3.257947, 2, -6.359298, 1, 1.5, 0.5, 0.5,
-3.257947, 2, -6.359298, 0, 1.5, 0.5, 0.5,
-3.257947, 3, -6.359298, 0, -0.5, 0.5, 0.5,
-3.257947, 3, -6.359298, 1, -0.5, 0.5, 0.5,
-3.257947, 3, -6.359298, 1, 1.5, 0.5, 0.5,
-3.257947, 3, -6.359298, 0, 1.5, 0.5, 0.5
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
-2.772847, -3.140819, -4,
-2.772847, -3.140819, 4,
-2.772847, -3.140819, -4,
-2.934547, -3.300673, -4,
-2.772847, -3.140819, -2,
-2.934547, -3.300673, -2,
-2.772847, -3.140819, 0,
-2.934547, -3.300673, 0,
-2.772847, -3.140819, 2,
-2.934547, -3.300673, 2,
-2.772847, -3.140819, 4,
-2.934547, -3.300673, 4
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
-3.257947, -3.62038, -4, 0, -0.5, 0.5, 0.5,
-3.257947, -3.62038, -4, 1, -0.5, 0.5, 0.5,
-3.257947, -3.62038, -4, 1, 1.5, 0.5, 0.5,
-3.257947, -3.62038, -4, 0, 1.5, 0.5, 0.5,
-3.257947, -3.62038, -2, 0, -0.5, 0.5, 0.5,
-3.257947, -3.62038, -2, 1, -0.5, 0.5, 0.5,
-3.257947, -3.62038, -2, 1, 1.5, 0.5, 0.5,
-3.257947, -3.62038, -2, 0, 1.5, 0.5, 0.5,
-3.257947, -3.62038, 0, 0, -0.5, 0.5, 0.5,
-3.257947, -3.62038, 0, 1, -0.5, 0.5, 0.5,
-3.257947, -3.62038, 0, 1, 1.5, 0.5, 0.5,
-3.257947, -3.62038, 0, 0, 1.5, 0.5, 0.5,
-3.257947, -3.62038, 2, 0, -0.5, 0.5, 0.5,
-3.257947, -3.62038, 2, 1, -0.5, 0.5, 0.5,
-3.257947, -3.62038, 2, 1, 1.5, 0.5, 0.5,
-3.257947, -3.62038, 2, 0, 1.5, 0.5, 0.5,
-3.257947, -3.62038, 4, 0, -0.5, 0.5, 0.5,
-3.257947, -3.62038, 4, 1, -0.5, 0.5, 0.5,
-3.257947, -3.62038, 4, 1, 1.5, 0.5, 0.5,
-3.257947, -3.62038, 4, 0, 1.5, 0.5, 0.5
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
-2.772847, -3.140819, -5.589832,
-2.772847, 3.253325, -5.589832,
-2.772847, -3.140819, 4.669706,
-2.772847, 3.253325, 4.669706,
-2.772847, -3.140819, -5.589832,
-2.772847, -3.140819, 4.669706,
-2.772847, 3.253325, -5.589832,
-2.772847, 3.253325, 4.669706,
-2.772847, -3.140819, -5.589832,
3.695157, -3.140819, -5.589832,
-2.772847, -3.140819, 4.669706,
3.695157, -3.140819, 4.669706,
-2.772847, 3.253325, -5.589832,
3.695157, 3.253325, -5.589832,
-2.772847, 3.253325, 4.669706,
3.695157, 3.253325, 4.669706,
3.695157, -3.140819, -5.589832,
3.695157, 3.253325, -5.589832,
3.695157, -3.140819, 4.669706,
3.695157, 3.253325, 4.669706,
3.695157, -3.140819, -5.589832,
3.695157, -3.140819, 4.669706,
3.695157, 3.253325, -5.589832,
3.695157, 3.253325, 4.669706
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
var radius = 7.32115;
var distance = 32.57262;
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
mvMatrix.translate( -0.4611547, -0.05625319, 0.4600632 );
mvMatrix.scale( 1.223835, 1.237972, 0.7715523 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.57262);
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
Fosthietan<-read.table("Fosthietan.xyz")
```

```
## Error in read.table("Fosthietan.xyz"): no lines available in input
```

```r
x<-Fosthietan$V2
```

```
## Error in eval(expr, envir, enclos): object 'Fosthietan' not found
```

```r
y<-Fosthietan$V3
```

```
## Error in eval(expr, envir, enclos): object 'Fosthietan' not found
```

```r
z<-Fosthietan$V4
```

```
## Error in eval(expr, envir, enclos): object 'Fosthietan' not found
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
-2.678653, -0.5169684, -3.856865, 0, 0, 1, 1, 1,
-2.656965, 0.5067835, -2.552485, 1, 0, 0, 1, 1,
-2.650184, 0.6495565, -1.804424, 1, 0, 0, 1, 1,
-2.584569, -0.3655609, -2.605822, 1, 0, 0, 1, 1,
-2.535291, 0.8850623, -1.252515, 1, 0, 0, 1, 1,
-2.406351, -0.1971621, -2.803881, 1, 0, 0, 1, 1,
-2.364625, 0.6680529, -0.8312421, 0, 0, 0, 1, 1,
-2.283924, 1.250775, -0.6466389, 0, 0, 0, 1, 1,
-2.26626, -0.5809525, -3.736419, 0, 0, 0, 1, 1,
-2.246836, 0.6153545, -0.4882864, 0, 0, 0, 1, 1,
-2.237915, -0.9873402, -1.387274, 0, 0, 0, 1, 1,
-2.193394, 0.3729963, -0.2268524, 0, 0, 0, 1, 1,
-2.097392, 0.08292454, -2.7967, 0, 0, 0, 1, 1,
-2.061725, 0.6906172, -1.473206, 1, 1, 1, 1, 1,
-1.994433, -0.139504, -1.269509, 1, 1, 1, 1, 1,
-1.950513, -0.3710676, -1.609139, 1, 1, 1, 1, 1,
-1.90621, 3.096898, 0.3486532, 1, 1, 1, 1, 1,
-1.896196, -0.2184678, -1.860071, 1, 1, 1, 1, 1,
-1.893433, -1.50676, -0.9200757, 1, 1, 1, 1, 1,
-1.89202, -1.067716, -2.263568, 1, 1, 1, 1, 1,
-1.879308, -1.59641, -2.079503, 1, 1, 1, 1, 1,
-1.878049, 0.9211455, -2.379385, 1, 1, 1, 1, 1,
-1.86363, 1.363548, -0.663061, 1, 1, 1, 1, 1,
-1.861706, -0.1182814, -1.82008, 1, 1, 1, 1, 1,
-1.853445, -0.6590859, -1.75041, 1, 1, 1, 1, 1,
-1.848001, 1.778396, -1.022294, 1, 1, 1, 1, 1,
-1.834308, -0.9939528, -1.659285, 1, 1, 1, 1, 1,
-1.824357, 0.1727468, -0.7762805, 1, 1, 1, 1, 1,
-1.811149, -1.24968, -0.7008492, 0, 0, 1, 1, 1,
-1.810103, -0.01812352, -1.812705, 1, 0, 0, 1, 1,
-1.80764, -1.722921, -1.405342, 1, 0, 0, 1, 1,
-1.802544, -0.2888829, 0.6594048, 1, 0, 0, 1, 1,
-1.801655, -0.2636087, -2.155098, 1, 0, 0, 1, 1,
-1.799409, 1.185212, -3.160659, 1, 0, 0, 1, 1,
-1.797807, -0.3230352, -1.240047, 0, 0, 0, 1, 1,
-1.7858, -0.8133099, -1.41533, 0, 0, 0, 1, 1,
-1.765391, 0.9003432, -0.1936132, 0, 0, 0, 1, 1,
-1.742798, 0.8331021, -0.0691141, 0, 0, 0, 1, 1,
-1.737631, 0.4348185, -1.371085, 0, 0, 0, 1, 1,
-1.736896, -0.6137082, -1.590222, 0, 0, 0, 1, 1,
-1.727175, -1.394695, -3.99551, 0, 0, 0, 1, 1,
-1.721424, 0.5431163, -0.9305533, 1, 1, 1, 1, 1,
-1.709513, -0.2676069, -2.169181, 1, 1, 1, 1, 1,
-1.705855, 0.3746221, -0.1306763, 1, 1, 1, 1, 1,
-1.698104, -0.5782573, -2.591802, 1, 1, 1, 1, 1,
-1.689165, 1.632152, 0.02928527, 1, 1, 1, 1, 1,
-1.680096, 0.3433655, -3.91553, 1, 1, 1, 1, 1,
-1.65483, -0.5803345, -0.9118299, 1, 1, 1, 1, 1,
-1.640937, -0.676647, -0.8087355, 1, 1, 1, 1, 1,
-1.628353, 1.403784, -0.4172982, 1, 1, 1, 1, 1,
-1.612147, 0.7421914, -0.3473761, 1, 1, 1, 1, 1,
-1.596943, -0.1201097, -0.5207464, 1, 1, 1, 1, 1,
-1.573388, 0.6568722, -0.6482336, 1, 1, 1, 1, 1,
-1.566557, -0.1911775, -2.467721, 1, 1, 1, 1, 1,
-1.565282, 1.761941, -1.55615, 1, 1, 1, 1, 1,
-1.556353, 0.1219305, -1.558332, 1, 1, 1, 1, 1,
-1.542984, -0.2056669, -1.479111, 0, 0, 1, 1, 1,
-1.537534, -0.008151049, -0.07568032, 1, 0, 0, 1, 1,
-1.531221, 1.803818, -1.895665, 1, 0, 0, 1, 1,
-1.524024, -0.399899, -1.840991, 1, 0, 0, 1, 1,
-1.521735, 2.001817, -1.171813, 1, 0, 0, 1, 1,
-1.518763, 0.2479486, -3.276174, 1, 0, 0, 1, 1,
-1.517241, -0.303515, -2.223407, 0, 0, 0, 1, 1,
-1.5153, 0.8852558, -0.6309614, 0, 0, 0, 1, 1,
-1.510409, 1.250657, -0.8630741, 0, 0, 0, 1, 1,
-1.498307, 0.2180764, -2.074372, 0, 0, 0, 1, 1,
-1.494985, -0.3589239, -2.648722, 0, 0, 0, 1, 1,
-1.487601, -0.3396308, -1.751538, 0, 0, 0, 1, 1,
-1.481002, -0.113988, -3.932352, 0, 0, 0, 1, 1,
-1.480961, -1.205071, -2.282411, 1, 1, 1, 1, 1,
-1.477888, -0.7386176, -1.380361, 1, 1, 1, 1, 1,
-1.476056, 1.741313, -1.010007, 1, 1, 1, 1, 1,
-1.47278, 1.124314, -1.562293, 1, 1, 1, 1, 1,
-1.472633, -0.4179992, -0.2273569, 1, 1, 1, 1, 1,
-1.467612, -0.6815677, -2.653362, 1, 1, 1, 1, 1,
-1.463896, -0.902778, -3.872096, 1, 1, 1, 1, 1,
-1.450735, 0.02125535, 0.9137523, 1, 1, 1, 1, 1,
-1.432678, 0.2872068, -0.8405108, 1, 1, 1, 1, 1,
-1.416007, -1.122978, -1.083877, 1, 1, 1, 1, 1,
-1.414909, 2.879602, 0.6027346, 1, 1, 1, 1, 1,
-1.414268, -0.8402064, -0.2663395, 1, 1, 1, 1, 1,
-1.414102, 0.6230032, -0.5057074, 1, 1, 1, 1, 1,
-1.41358, -1.495508, -2.178317, 1, 1, 1, 1, 1,
-1.410219, 0.261887, -1.552372, 1, 1, 1, 1, 1,
-1.408735, 1.577481, -0.1967059, 0, 0, 1, 1, 1,
-1.396612, 0.7175844, -2.357133, 1, 0, 0, 1, 1,
-1.393081, 0.1940665, -1.421903, 1, 0, 0, 1, 1,
-1.389983, 0.5099621, -1.524189, 1, 0, 0, 1, 1,
-1.382524, -0.8982026, -3.492029, 1, 0, 0, 1, 1,
-1.366527, 0.5275639, -1.323632, 1, 0, 0, 1, 1,
-1.364378, 1.672087, -0.6509983, 0, 0, 0, 1, 1,
-1.351998, 1.615944, -1.141822, 0, 0, 0, 1, 1,
-1.33922, 0.4140252, -0.4642482, 0, 0, 0, 1, 1,
-1.336389, 1.72064, -0.5564473, 0, 0, 0, 1, 1,
-1.32816, 0.6239091, -1.245357, 0, 0, 0, 1, 1,
-1.325006, 1.391541, -1.754423, 0, 0, 0, 1, 1,
-1.31463, -0.8026202, -2.563694, 0, 0, 0, 1, 1,
-1.310084, -0.5427234, -2.363676, 1, 1, 1, 1, 1,
-1.294004, 0.03825678, -1.673183, 1, 1, 1, 1, 1,
-1.292821, 1.577525, 0.5583928, 1, 1, 1, 1, 1,
-1.284979, -0.7253496, -1.006211, 1, 1, 1, 1, 1,
-1.27884, -1.705857, -2.070873, 1, 1, 1, 1, 1,
-1.277884, 0.05550068, 0.9143815, 1, 1, 1, 1, 1,
-1.274595, -0.4941725, -1.643505, 1, 1, 1, 1, 1,
-1.271381, -2.522052, -2.698292, 1, 1, 1, 1, 1,
-1.264298, 0.2384941, -1.887524, 1, 1, 1, 1, 1,
-1.260854, -0.8851658, -4.316031, 1, 1, 1, 1, 1,
-1.26006, 0.4676949, -2.477366, 1, 1, 1, 1, 1,
-1.250725, 0.549265, -1.869874, 1, 1, 1, 1, 1,
-1.238646, 0.8284433, 0.2088607, 1, 1, 1, 1, 1,
-1.235754, -1.142721, -1.372867, 1, 1, 1, 1, 1,
-1.231047, 0.1510577, 0.04533801, 1, 1, 1, 1, 1,
-1.226929, -1.477765, -2.890043, 0, 0, 1, 1, 1,
-1.22548, -0.370161, -2.339724, 1, 0, 0, 1, 1,
-1.217592, -0.4027002, -2.793048, 1, 0, 0, 1, 1,
-1.214603, 0.01548852, -3.017205, 1, 0, 0, 1, 1,
-1.209763, 0.006265395, -3.805858, 1, 0, 0, 1, 1,
-1.206876, 0.9433606, -0.8219692, 1, 0, 0, 1, 1,
-1.204759, -0.5426029, -1.335143, 0, 0, 0, 1, 1,
-1.200992, 0.3770891, -0.8893941, 0, 0, 0, 1, 1,
-1.192901, 0.4436899, -0.1555927, 0, 0, 0, 1, 1,
-1.192805, -0.7286604, -1.555272, 0, 0, 0, 1, 1,
-1.188062, 0.6153843, -1.330363, 0, 0, 0, 1, 1,
-1.184886, 0.9373531, -2.178944, 0, 0, 0, 1, 1,
-1.183392, 0.3486188, -0.6080734, 0, 0, 0, 1, 1,
-1.181019, 0.5920362, -1.998847, 1, 1, 1, 1, 1,
-1.180291, -0.482318, -2.806727, 1, 1, 1, 1, 1,
-1.177157, -0.3540159, -2.54226, 1, 1, 1, 1, 1,
-1.176031, 1.560757, -0.8887604, 1, 1, 1, 1, 1,
-1.160038, 0.07951813, -0.3301109, 1, 1, 1, 1, 1,
-1.157865, 0.3009461, -1.032742, 1, 1, 1, 1, 1,
-1.15756, 1.035822, -0.006415339, 1, 1, 1, 1, 1,
-1.15327, -0.3350419, -1.823918, 1, 1, 1, 1, 1,
-1.153014, 0.1239951, -2.034211, 1, 1, 1, 1, 1,
-1.152415, -0.8296332, -1.352027, 1, 1, 1, 1, 1,
-1.147296, 1.088097, 0.3837754, 1, 1, 1, 1, 1,
-1.146891, 0.5437968, -1.683558, 1, 1, 1, 1, 1,
-1.14408, 0.7822076, -0.541627, 1, 1, 1, 1, 1,
-1.136757, -1.401683, -3.17624, 1, 1, 1, 1, 1,
-1.133511, 0.2466263, -1.821286, 1, 1, 1, 1, 1,
-1.120188, -0.2890772, -1.007882, 0, 0, 1, 1, 1,
-1.113615, -0.2287655, -1.541656, 1, 0, 0, 1, 1,
-1.109075, 1.095749, -1.554724, 1, 0, 0, 1, 1,
-1.108292, 0.4694299, 0.245848, 1, 0, 0, 1, 1,
-1.095302, 0.7523995, -1.322628, 1, 0, 0, 1, 1,
-1.085539, 0.7177963, -0.7999427, 1, 0, 0, 1, 1,
-1.083715, -0.6066868, -2.740898, 0, 0, 0, 1, 1,
-1.081724, 0.6933759, -2.655274, 0, 0, 0, 1, 1,
-1.057591, -0.1179545, 0.3431876, 0, 0, 0, 1, 1,
-1.045957, 0.4966263, -1.804423, 0, 0, 0, 1, 1,
-1.02873, -1.089402, -0.869534, 0, 0, 0, 1, 1,
-1.026527, -0.5636308, -1.315287, 0, 0, 0, 1, 1,
-1.023936, 1.166528, -1.528126, 0, 0, 0, 1, 1,
-1.016096, -1.429434, -4.097303, 1, 1, 1, 1, 1,
-1.013403, 0.600593, -1.443316, 1, 1, 1, 1, 1,
-1.009751, 0.3751323, 0.728423, 1, 1, 1, 1, 1,
-1.004157, 0.3676878, 0.03092028, 1, 1, 1, 1, 1,
-0.9884068, -0.9273913, -1.006585, 1, 1, 1, 1, 1,
-0.9864801, -0.8142702, -2.33267, 1, 1, 1, 1, 1,
-0.9755077, 0.7130511, -0.6122551, 1, 1, 1, 1, 1,
-0.9655181, 1.889194, -0.1704493, 1, 1, 1, 1, 1,
-0.9594472, -0.244425, -1.955985, 1, 1, 1, 1, 1,
-0.9549138, 0.04752393, -1.68617, 1, 1, 1, 1, 1,
-0.9470782, -2.166131, -2.663465, 1, 1, 1, 1, 1,
-0.9411489, -1.457432, -3.308239, 1, 1, 1, 1, 1,
-0.9389505, 1.024176, -0.07640651, 1, 1, 1, 1, 1,
-0.9380929, -0.3995704, -3.534857, 1, 1, 1, 1, 1,
-0.9361315, 0.4653424, 0.05735448, 1, 1, 1, 1, 1,
-0.9326267, -0.2092625, -2.398569, 0, 0, 1, 1, 1,
-0.9272223, -0.01263126, -1.128879, 1, 0, 0, 1, 1,
-0.922524, -0.4385045, -3.880082, 1, 0, 0, 1, 1,
-0.9224257, -0.325099, -0.8796184, 1, 0, 0, 1, 1,
-0.9222963, -1.112861, -4.108508, 1, 0, 0, 1, 1,
-0.9214619, 1.135712, -0.8379743, 1, 0, 0, 1, 1,
-0.9164305, -1.048755, -4.244162, 0, 0, 0, 1, 1,
-0.9119797, -0.8750659, -2.733417, 0, 0, 0, 1, 1,
-0.8956349, -0.2816399, -1.29374, 0, 0, 0, 1, 1,
-0.8938008, -1.431925, -3.724255, 0, 0, 0, 1, 1,
-0.8911585, -0.02034718, -3.664574, 0, 0, 0, 1, 1,
-0.8902159, 0.5145791, -0.04053034, 0, 0, 0, 1, 1,
-0.8850032, 0.9522086, -0.7831389, 0, 0, 0, 1, 1,
-0.873514, -1.016677, -3.167554, 1, 1, 1, 1, 1,
-0.8687122, -0.5876703, -1.962978, 1, 1, 1, 1, 1,
-0.8635314, 0.2474989, -2.390073, 1, 1, 1, 1, 1,
-0.8624027, -0.7939572, -4.271268, 1, 1, 1, 1, 1,
-0.8585241, -1.732422, -1.752609, 1, 1, 1, 1, 1,
-0.8576755, 0.02299828, -0.9119934, 1, 1, 1, 1, 1,
-0.8571928, 0.7036577, -1.607078, 1, 1, 1, 1, 1,
-0.8569272, 0.9642071, 0.8299587, 1, 1, 1, 1, 1,
-0.8538731, -0.1592802, -1.496027, 1, 1, 1, 1, 1,
-0.8448691, -1.297721, -2.194818, 1, 1, 1, 1, 1,
-0.8419992, -0.4904705, -1.828573, 1, 1, 1, 1, 1,
-0.8413642, 0.5881853, -0.6410644, 1, 1, 1, 1, 1,
-0.8410815, -0.1084722, -2.396529, 1, 1, 1, 1, 1,
-0.82819, 0.01876372, -1.697346, 1, 1, 1, 1, 1,
-0.8228781, 0.5833784, -0.8698038, 1, 1, 1, 1, 1,
-0.8188351, -0.8716258, -2.377197, 0, 0, 1, 1, 1,
-0.8145109, -0.2101042, -3.34574, 1, 0, 0, 1, 1,
-0.812259, -0.01879824, -0.9438181, 1, 0, 0, 1, 1,
-0.8122427, -0.055732, 0.8486025, 1, 0, 0, 1, 1,
-0.8043864, -1.135053, -1.663046, 1, 0, 0, 1, 1,
-0.8005363, -0.2469138, -2.73042, 1, 0, 0, 1, 1,
-0.7993776, 0.4133456, -0.7944538, 0, 0, 0, 1, 1,
-0.7953418, 1.565693, -0.4544066, 0, 0, 0, 1, 1,
-0.7895045, 0.4031755, 1.386814, 0, 0, 0, 1, 1,
-0.7660034, -1.366858, -3.213497, 0, 0, 0, 1, 1,
-0.7634354, -1.144237, -2.549731, 0, 0, 0, 1, 1,
-0.7627555, -0.8985217, -2.373146, 0, 0, 0, 1, 1,
-0.7620065, -0.02814017, -0.9480174, 0, 0, 0, 1, 1,
-0.7569845, 0.4251366, -0.4461385, 1, 1, 1, 1, 1,
-0.7548942, 0.6854838, -2.428125, 1, 1, 1, 1, 1,
-0.7514043, 0.6440651, -1.526634, 1, 1, 1, 1, 1,
-0.7504914, -0.1306586, 0.3208132, 1, 1, 1, 1, 1,
-0.7503265, -1.123088, -2.828285, 1, 1, 1, 1, 1,
-0.742083, 0.8653078, -1.248368, 1, 1, 1, 1, 1,
-0.7266713, 1.473354, -1.329163, 1, 1, 1, 1, 1,
-0.7133749, 0.6716954, -1.790036, 1, 1, 1, 1, 1,
-0.7129034, 1.511782, 0.01207336, 1, 1, 1, 1, 1,
-0.7111813, -0.978826, -1.558994, 1, 1, 1, 1, 1,
-0.7020148, 0.3002982, -1.576756, 1, 1, 1, 1, 1,
-0.7008763, -1.082042, -3.331908, 1, 1, 1, 1, 1,
-0.7004643, -0.2302558, -2.515009, 1, 1, 1, 1, 1,
-0.6970745, 1.098684, -1.958125, 1, 1, 1, 1, 1,
-0.6957274, 0.2690579, -1.298978, 1, 1, 1, 1, 1,
-0.6919786, -0.2802598, -1.167954, 0, 0, 1, 1, 1,
-0.687988, 0.6683162, -2.821601, 1, 0, 0, 1, 1,
-0.6879307, -0.2264002, -2.938862, 1, 0, 0, 1, 1,
-0.6868356, -0.6111521, -2.543277, 1, 0, 0, 1, 1,
-0.6849844, 0.8229501, -1.721816, 1, 0, 0, 1, 1,
-0.6829548, -0.9411536, -1.772291, 1, 0, 0, 1, 1,
-0.6815981, -0.01943872, -2.922508, 0, 0, 0, 1, 1,
-0.681524, -1.773948, -1.977328, 0, 0, 0, 1, 1,
-0.6754232, -0.7717999, -2.140232, 0, 0, 0, 1, 1,
-0.6722344, -1.020615, -2.162537, 0, 0, 0, 1, 1,
-0.6721085, -0.2553154, -3.870651, 0, 0, 0, 1, 1,
-0.6673341, 0.788025, -2.08092, 0, 0, 0, 1, 1,
-0.6632944, 0.7959706, -0.2145399, 0, 0, 0, 1, 1,
-0.6599592, -0.06117165, 0.4611698, 1, 1, 1, 1, 1,
-0.6577162, -0.896875, -3.992978, 1, 1, 1, 1, 1,
-0.6495434, 0.008392677, -2.374488, 1, 1, 1, 1, 1,
-0.6481408, 0.9660863, 2.189515, 1, 1, 1, 1, 1,
-0.6459927, -1.085044, -3.645589, 1, 1, 1, 1, 1,
-0.6394705, 0.289994, -1.957316, 1, 1, 1, 1, 1,
-0.6350276, -0.6724386, -2.159441, 1, 1, 1, 1, 1,
-0.6314466, -0.4265006, -1.492042, 1, 1, 1, 1, 1,
-0.6279832, -1.094126, -3.199863, 1, 1, 1, 1, 1,
-0.6236209, -0.6764097, -2.58391, 1, 1, 1, 1, 1,
-0.6216107, 1.274293, 0.2321182, 1, 1, 1, 1, 1,
-0.6170225, 0.1485424, -0.870254, 1, 1, 1, 1, 1,
-0.6165155, -0.968254, -2.886942, 1, 1, 1, 1, 1,
-0.615465, -0.241314, -3.389535, 1, 1, 1, 1, 1,
-0.6133965, 0.7892157, 1.123881, 1, 1, 1, 1, 1,
-0.6130432, 1.411835, -0.9550055, 0, 0, 1, 1, 1,
-0.6127264, -1.670448, -5.040821, 1, 0, 0, 1, 1,
-0.6104454, 0.4248643, -1.64392, 1, 0, 0, 1, 1,
-0.6101947, -1.166523, -3.321153, 1, 0, 0, 1, 1,
-0.6069536, 1.202205, 0.04595104, 1, 0, 0, 1, 1,
-0.6048421, -0.8843206, -1.713162, 1, 0, 0, 1, 1,
-0.6028874, 0.8445739, -1.382317, 0, 0, 0, 1, 1,
-0.6028464, -0.407955, -0.02907552, 0, 0, 0, 1, 1,
-0.5973421, -0.5604191, -2.416731, 0, 0, 0, 1, 1,
-0.5943124, 0.567355, -0.5799862, 0, 0, 0, 1, 1,
-0.5937794, 1.254489, -0.9903754, 0, 0, 0, 1, 1,
-0.5853481, 2.419433, 0.0538643, 0, 0, 0, 1, 1,
-0.5814935, 1.744711, 1.315342, 0, 0, 0, 1, 1,
-0.5723095, -0.03494837, -3.58267, 1, 1, 1, 1, 1,
-0.571312, 0.5658153, -0.8490151, 1, 1, 1, 1, 1,
-0.567881, -0.1332588, -2.832704, 1, 1, 1, 1, 1,
-0.5674649, -0.1983449, -1.582534, 1, 1, 1, 1, 1,
-0.5639693, 0.145878, -1.623407, 1, 1, 1, 1, 1,
-0.5598533, -0.2789117, -3.048964, 1, 1, 1, 1, 1,
-0.5596482, -1.613628, -3.573752, 1, 1, 1, 1, 1,
-0.5504057, 1.872879, -0.5265443, 1, 1, 1, 1, 1,
-0.5499948, 0.443816, -0.7901633, 1, 1, 1, 1, 1,
-0.5494869, 1.511335, -1.1258, 1, 1, 1, 1, 1,
-0.5489258, -0.8790185, -3.326774, 1, 1, 1, 1, 1,
-0.5473995, -0.1257639, -1.034564, 1, 1, 1, 1, 1,
-0.5459524, 1.250004, -0.4028458, 1, 1, 1, 1, 1,
-0.5450329, 0.3370139, -1.651221, 1, 1, 1, 1, 1,
-0.543053, 0.7454843, -1.294455, 1, 1, 1, 1, 1,
-0.5418506, -0.6591551, -0.3291451, 0, 0, 1, 1, 1,
-0.5417552, 0.7385799, 0.2685762, 1, 0, 0, 1, 1,
-0.5394836, -0.8458982, -3.61032, 1, 0, 0, 1, 1,
-0.5382349, -2.547056, -2.282552, 1, 0, 0, 1, 1,
-0.5378106, 1.141691, 0.125369, 1, 0, 0, 1, 1,
-0.5339887, 0.3889662, -0.4676532, 1, 0, 0, 1, 1,
-0.5310737, -1.100467, -2.52191, 0, 0, 0, 1, 1,
-0.5295275, 1.851302, -1.365029, 0, 0, 0, 1, 1,
-0.5277746, 0.1556108, -3.398203, 0, 0, 0, 1, 1,
-0.525516, 0.5687503, -0.2471101, 0, 0, 0, 1, 1,
-0.5177643, -0.03650749, -2.736592, 0, 0, 0, 1, 1,
-0.5172848, -0.6627162, -2.853086, 0, 0, 0, 1, 1,
-0.5127195, 0.2178409, -1.324898, 0, 0, 0, 1, 1,
-0.5117547, -0.4191653, -2.375992, 1, 1, 1, 1, 1,
-0.5112945, 0.6229802, -1.324648, 1, 1, 1, 1, 1,
-0.5067741, 2.244618, -0.791766, 1, 1, 1, 1, 1,
-0.5060239, -0.5260535, -3.19381, 1, 1, 1, 1, 1,
-0.5047983, -0.02633022, -1.608504, 1, 1, 1, 1, 1,
-0.5037998, -1.1172, -3.214618, 1, 1, 1, 1, 1,
-0.502121, 1.428062, -0.2666121, 1, 1, 1, 1, 1,
-0.4989173, 2.196277, -0.3901403, 1, 1, 1, 1, 1,
-0.4950001, -0.9901624, -3.512106, 1, 1, 1, 1, 1,
-0.4890713, -0.09086913, -3.67223, 1, 1, 1, 1, 1,
-0.488856, 1.853693, 0.3243412, 1, 1, 1, 1, 1,
-0.4839694, 0.08303754, -0.3875283, 1, 1, 1, 1, 1,
-0.4832615, -1.126181, -4.990654, 1, 1, 1, 1, 1,
-0.4831693, 0.3503787, -0.6263787, 1, 1, 1, 1, 1,
-0.4804205, 0.6049984, -1.748526, 1, 1, 1, 1, 1,
-0.4789685, -0.002772979, -0.8215848, 0, 0, 1, 1, 1,
-0.4758806, 0.5874844, -1.607333, 1, 0, 0, 1, 1,
-0.4748035, -0.5427771, -2.137585, 1, 0, 0, 1, 1,
-0.4720719, 0.7955225, -1.116407, 1, 0, 0, 1, 1,
-0.4711173, 0.2244725, -2.873695, 1, 0, 0, 1, 1,
-0.4683822, -1.433059, -2.868932, 1, 0, 0, 1, 1,
-0.4683692, 1.162357, -3.291147, 0, 0, 0, 1, 1,
-0.4647738, -1.792492, -2.65117, 0, 0, 0, 1, 1,
-0.4643421, -1.539759, -0.7587947, 0, 0, 0, 1, 1,
-0.4636079, -0.1996468, 0.3740745, 0, 0, 0, 1, 1,
-0.4561956, 0.07688057, -0.6122315, 0, 0, 0, 1, 1,
-0.4548608, -0.006639571, -0.5789135, 0, 0, 0, 1, 1,
-0.4539473, 0.6289131, -1.250261, 0, 0, 0, 1, 1,
-0.4489306, -0.1973765, -2.115292, 1, 1, 1, 1, 1,
-0.4428206, 0.7577133, 0.1243088, 1, 1, 1, 1, 1,
-0.4422999, 0.6360862, -1.456055, 1, 1, 1, 1, 1,
-0.4404562, -0.5198795, -4.274351, 1, 1, 1, 1, 1,
-0.4400081, 1.312766, -1.961797, 1, 1, 1, 1, 1,
-0.43814, 0.2105021, -0.3734669, 1, 1, 1, 1, 1,
-0.430779, -0.1443723, -1.881853, 1, 1, 1, 1, 1,
-0.4302893, 0.3702348, -3.10377, 1, 1, 1, 1, 1,
-0.430279, 1.146581, -1.805842, 1, 1, 1, 1, 1,
-0.4293123, 0.06572212, -2.699739, 1, 1, 1, 1, 1,
-0.4285353, -0.2294664, -1.458114, 1, 1, 1, 1, 1,
-0.4279501, -0.882411, -2.412229, 1, 1, 1, 1, 1,
-0.4275602, -2.130274, -3.155816, 1, 1, 1, 1, 1,
-0.4275039, -0.2576987, -3.629301, 1, 1, 1, 1, 1,
-0.425833, 1.309698, -1.82689, 1, 1, 1, 1, 1,
-0.4238976, 2.131167, -0.7436646, 0, 0, 1, 1, 1,
-0.4236948, 0.5767984, -2.229711, 1, 0, 0, 1, 1,
-0.4210368, -2.060414, -2.871753, 1, 0, 0, 1, 1,
-0.4116904, 1.577135, -0.7731978, 1, 0, 0, 1, 1,
-0.4101287, 0.03528777, -1.519305, 1, 0, 0, 1, 1,
-0.4049927, -1.605474, -3.23459, 1, 0, 0, 1, 1,
-0.4041701, 0.8841266, -0.1801717, 0, 0, 0, 1, 1,
-0.3964199, -0.8688733, -3.072211, 0, 0, 0, 1, 1,
-0.3959323, -0.5157491, -3.147546, 0, 0, 0, 1, 1,
-0.3948182, -0.4410869, -1.566439, 0, 0, 0, 1, 1,
-0.3942188, 0.7307265, 0.4531703, 0, 0, 0, 1, 1,
-0.3934716, 0.2684377, -1.387362, 0, 0, 0, 1, 1,
-0.389759, -1.390904, -2.031465, 0, 0, 0, 1, 1,
-0.3892924, 0.6518002, -0.7294874, 1, 1, 1, 1, 1,
-0.3849243, 0.9085243, -1.063684, 1, 1, 1, 1, 1,
-0.3843194, 0.2888667, -1.1446, 1, 1, 1, 1, 1,
-0.3835034, -0.7864344, -2.409215, 1, 1, 1, 1, 1,
-0.3823839, 0.995853, 0.4677398, 1, 1, 1, 1, 1,
-0.3791252, -0.7068448, -1.306725, 1, 1, 1, 1, 1,
-0.3782158, 1.830105, -0.2322681, 1, 1, 1, 1, 1,
-0.3748312, -1.267809, -2.753337, 1, 1, 1, 1, 1,
-0.3745392, -0.5543159, -2.529293, 1, 1, 1, 1, 1,
-0.3674107, -0.1862196, -1.57089, 1, 1, 1, 1, 1,
-0.362167, -0.3757622, -0.7022948, 1, 1, 1, 1, 1,
-0.3577236, 0.6979349, -1.388788, 1, 1, 1, 1, 1,
-0.3554286, 0.8866966, -1.496458, 1, 1, 1, 1, 1,
-0.3528483, -0.01848453, -1.437616, 1, 1, 1, 1, 1,
-0.3521245, 0.4195204, 0.4936284, 1, 1, 1, 1, 1,
-0.3517793, 0.3328595, -1.170447, 0, 0, 1, 1, 1,
-0.3483906, -0.3518045, -2.168711, 1, 0, 0, 1, 1,
-0.3463893, 0.8035995, -0.03680656, 1, 0, 0, 1, 1,
-0.3449376, -0.3952943, -1.537376, 1, 0, 0, 1, 1,
-0.3435662, 0.6489812, -1.010328, 1, 0, 0, 1, 1,
-0.3424083, 0.2293595, -2.74186, 1, 0, 0, 1, 1,
-0.3420398, -0.746472, -2.355679, 0, 0, 0, 1, 1,
-0.3400859, 0.4914683, -1.288614, 0, 0, 0, 1, 1,
-0.3387815, -0.4768121, -1.544853, 0, 0, 0, 1, 1,
-0.3319648, 0.4685448, 0.4906591, 0, 0, 0, 1, 1,
-0.3315333, -0.9627184, -4.016994, 0, 0, 0, 1, 1,
-0.3245569, 0.6696074, -0.9419702, 0, 0, 0, 1, 1,
-0.3242306, -1.368315, -3.700704, 0, 0, 0, 1, 1,
-0.3235569, 0.8921485, 0.1532769, 1, 1, 1, 1, 1,
-0.3218474, 2.342281, -1.204077, 1, 1, 1, 1, 1,
-0.3163571, 0.7001088, 0.1804876, 1, 1, 1, 1, 1,
-0.3136245, 1.073672, -0.5609964, 1, 1, 1, 1, 1,
-0.3120462, -0.558293, -3.521669, 1, 1, 1, 1, 1,
-0.3117135, 0.6784744, 1.052395, 1, 1, 1, 1, 1,
-0.3104699, -1.131749, -3.093308, 1, 1, 1, 1, 1,
-0.3097457, -0.5231862, -1.772729, 1, 1, 1, 1, 1,
-0.306411, 0.5464008, -0.4542939, 1, 1, 1, 1, 1,
-0.3058456, 1.811349, -1.61374, 1, 1, 1, 1, 1,
-0.3049159, 1.682756, -0.4654533, 1, 1, 1, 1, 1,
-0.3041002, -1.385609, -1.974798, 1, 1, 1, 1, 1,
-0.304085, -0.8887467, -1.274823, 1, 1, 1, 1, 1,
-0.3038226, 0.164095, 0.1784085, 1, 1, 1, 1, 1,
-0.3037716, 0.3156154, 0.6446099, 1, 1, 1, 1, 1,
-0.3032451, -0.1211069, -1.552234, 0, 0, 1, 1, 1,
-0.3012297, 1.162416, 0.7513577, 1, 0, 0, 1, 1,
-0.2999435, 0.1997579, -1.35026, 1, 0, 0, 1, 1,
-0.2990479, 0.6099335, -1.242722, 1, 0, 0, 1, 1,
-0.2961097, 1.330301, -1.060697, 1, 0, 0, 1, 1,
-0.2952141, -0.4026217, -3.834154, 1, 0, 0, 1, 1,
-0.2920018, 0.4330677, -0.1688625, 0, 0, 0, 1, 1,
-0.2915204, -0.8424325, -1.892603, 0, 0, 0, 1, 1,
-0.2908832, -0.3352877, -1.103797, 0, 0, 0, 1, 1,
-0.2908232, -0.9978529, -3.359238, 0, 0, 0, 1, 1,
-0.288864, 0.8758423, -0.4388799, 0, 0, 0, 1, 1,
-0.2874087, 0.5368029, -2.267393, 0, 0, 0, 1, 1,
-0.2871966, 0.2456335, -0.7405212, 0, 0, 0, 1, 1,
-0.2842517, -0.6602767, -2.354386, 1, 1, 1, 1, 1,
-0.2837532, 0.9539757, -0.1691301, 1, 1, 1, 1, 1,
-0.2811186, -0.5287758, -2.689297, 1, 1, 1, 1, 1,
-0.2799457, -0.9236025, -3.878196, 1, 1, 1, 1, 1,
-0.277082, -2.155311, -5.440422, 1, 1, 1, 1, 1,
-0.2768938, 0.9720666, 0.7949066, 1, 1, 1, 1, 1,
-0.2767754, 0.3155556, -1.798954, 1, 1, 1, 1, 1,
-0.2756159, -1.339916, -0.8445662, 1, 1, 1, 1, 1,
-0.2737248, 3.11915, 0.7282876, 1, 1, 1, 1, 1,
-0.2671017, 0.02208328, -1.055331, 1, 1, 1, 1, 1,
-0.2652146, -1.631668, -4.81372, 1, 1, 1, 1, 1,
-0.2638656, -0.9377145, -3.708024, 1, 1, 1, 1, 1,
-0.2605127, -0.2379863, -2.541471, 1, 1, 1, 1, 1,
-0.2568627, 1.431097, -1.002339, 1, 1, 1, 1, 1,
-0.2559138, -1.684392, -4.130793, 1, 1, 1, 1, 1,
-0.2555335, -2.218564, -2.629109, 0, 0, 1, 1, 1,
-0.2533306, -0.6272337, -4.800544, 1, 0, 0, 1, 1,
-0.2437054, -2.045177, -2.205686, 1, 0, 0, 1, 1,
-0.2428908, 0.5736197, -1.094821, 1, 0, 0, 1, 1,
-0.2427746, 0.4383782, -2.271921, 1, 0, 0, 1, 1,
-0.2411068, -0.6712327, -2.254915, 1, 0, 0, 1, 1,
-0.2398351, -0.6355155, -1.453484, 0, 0, 0, 1, 1,
-0.2395831, -0.468432, -2.821517, 0, 0, 0, 1, 1,
-0.2347617, -0.005437222, -1.672618, 0, 0, 0, 1, 1,
-0.234489, -2.949004, -3.11853, 0, 0, 0, 1, 1,
-0.2286057, -0.3439062, -2.745127, 0, 0, 0, 1, 1,
-0.2269638, 0.8533378, 0.4283311, 0, 0, 0, 1, 1,
-0.225622, -0.7235173, -2.247071, 0, 0, 0, 1, 1,
-0.222017, 0.6473491, 0.571854, 1, 1, 1, 1, 1,
-0.2164467, 0.2236181, 0.6832358, 1, 1, 1, 1, 1,
-0.2143856, 0.1035661, -2.512207, 1, 1, 1, 1, 1,
-0.2140906, 0.6114762, -1.12579, 1, 1, 1, 1, 1,
-0.2114331, 2.149974, 1.590414, 1, 1, 1, 1, 1,
-0.2075163, 0.1230228, -0.3209459, 1, 1, 1, 1, 1,
-0.2037436, -0.324502, -1.412896, 1, 1, 1, 1, 1,
-0.2018454, 0.6168985, -1.712011, 1, 1, 1, 1, 1,
-0.201746, -0.1103396, -3.229215, 1, 1, 1, 1, 1,
-0.1981542, 0.7399943, -1.924073, 1, 1, 1, 1, 1,
-0.1970945, -1.372079, -3.053778, 1, 1, 1, 1, 1,
-0.1963291, 0.1034023, -0.9239725, 1, 1, 1, 1, 1,
-0.1960982, 2.244037, 0.668575, 1, 1, 1, 1, 1,
-0.1950883, -0.4715668, -2.49703, 1, 1, 1, 1, 1,
-0.1934882, 0.3406771, 0.3361427, 1, 1, 1, 1, 1,
-0.1896749, 0.9700142, -1.878399, 0, 0, 1, 1, 1,
-0.1870792, 0.5301945, -1.957909, 1, 0, 0, 1, 1,
-0.1839467, 0.6620967, -0.4522381, 1, 0, 0, 1, 1,
-0.1835365, -0.3699003, -2.390303, 1, 0, 0, 1, 1,
-0.183233, 0.5541537, 0.3412247, 1, 0, 0, 1, 1,
-0.1810584, 0.2456213, -1.731484, 1, 0, 0, 1, 1,
-0.1782782, 1.233528, -1.014252, 0, 0, 0, 1, 1,
-0.1781672, 0.425222, 0.05867174, 0, 0, 0, 1, 1,
-0.1750765, -0.9925218, -2.18276, 0, 0, 0, 1, 1,
-0.1727541, 0.731471, 0.2890907, 0, 0, 0, 1, 1,
-0.1717641, 0.2274382, -1.016523, 0, 0, 0, 1, 1,
-0.1706439, -1.182052, -2.554799, 0, 0, 0, 1, 1,
-0.169432, -1.911152, -2.730201, 0, 0, 0, 1, 1,
-0.1683499, 0.2663462, -0.110772, 1, 1, 1, 1, 1,
-0.1632293, -0.08620939, -3.180814, 1, 1, 1, 1, 1,
-0.1586338, -1.556105, -2.793018, 1, 1, 1, 1, 1,
-0.1562424, 0.249017, -0.819323, 1, 1, 1, 1, 1,
-0.1558092, 0.9284616, 0.2934853, 1, 1, 1, 1, 1,
-0.1474918, 0.5423482, -0.05319595, 1, 1, 1, 1, 1,
-0.147243, -0.2840168, -2.671339, 1, 1, 1, 1, 1,
-0.1440381, 0.5269154, -0.8579894, 1, 1, 1, 1, 1,
-0.1438386, 1.752527, -0.4642493, 1, 1, 1, 1, 1,
-0.1436049, -1.577144, -1.633623, 1, 1, 1, 1, 1,
-0.143559, -1.722035, -3.800047, 1, 1, 1, 1, 1,
-0.1410422, 0.9370403, 0.3892274, 1, 1, 1, 1, 1,
-0.1398332, 0.6350276, -0.4065199, 1, 1, 1, 1, 1,
-0.1358046, 0.440568, -0.2815694, 1, 1, 1, 1, 1,
-0.1335797, -0.1231402, -3.980431, 1, 1, 1, 1, 1,
-0.1329078, 0.5738234, -2.179329, 0, 0, 1, 1, 1,
-0.1327484, 0.06644873, -1.505398, 1, 0, 0, 1, 1,
-0.1324746, -1.444361, -2.600274, 1, 0, 0, 1, 1,
-0.1258983, 0.516528, -1.573698, 1, 0, 0, 1, 1,
-0.1245168, -0.7019938, -2.634323, 1, 0, 0, 1, 1,
-0.1226364, 0.5505761, 0.55342, 1, 0, 0, 1, 1,
-0.1208298, -0.04772928, -2.087044, 0, 0, 0, 1, 1,
-0.1191924, -0.001804009, -1.037475, 0, 0, 0, 1, 1,
-0.1182034, 0.2630222, -1.581112, 0, 0, 0, 1, 1,
-0.1140788, 1.250042, 1.932245, 0, 0, 0, 1, 1,
-0.1129463, 0.436229, 0.421044, 0, 0, 0, 1, 1,
-0.1112784, 0.2099315, -0.7636694, 0, 0, 0, 1, 1,
-0.1002876, -0.5105337, -3.519732, 0, 0, 0, 1, 1,
-0.1002783, 0.7894782, -0.3340231, 1, 1, 1, 1, 1,
-0.09572709, -0.3738256, -3.61465, 1, 1, 1, 1, 1,
-0.0923341, 1.433454, -0.5591152, 1, 1, 1, 1, 1,
-0.08364417, -0.2128106, -2.994984, 1, 1, 1, 1, 1,
-0.08088949, -0.7378726, -1.814129, 1, 1, 1, 1, 1,
-0.07816148, -1.565053, -4.177463, 1, 1, 1, 1, 1,
-0.07679965, -0.540857, -0.6919687, 1, 1, 1, 1, 1,
-0.07669204, 0.2936389, -0.5189349, 1, 1, 1, 1, 1,
-0.07617756, 0.5183756, 1.369965, 1, 1, 1, 1, 1,
-0.07576477, 0.7618841, -0.5758101, 1, 1, 1, 1, 1,
-0.07291811, -0.7941326, -3.263532, 1, 1, 1, 1, 1,
-0.07054041, -1.777415, -3.622681, 1, 1, 1, 1, 1,
-0.06966857, -0.8730323, -3.971173, 1, 1, 1, 1, 1,
-0.06648678, 0.4784742, -0.6705683, 1, 1, 1, 1, 1,
-0.06462854, 1.875012, -0.3424136, 1, 1, 1, 1, 1,
-0.06313494, -1.28544, -3.815467, 0, 0, 1, 1, 1,
-0.0587001, -1.206099, -1.935709, 1, 0, 0, 1, 1,
-0.05516844, 0.869414, -0.8573848, 1, 0, 0, 1, 1,
-0.05160191, 0.07857011, -1.079054, 1, 0, 0, 1, 1,
-0.05077567, 0.07699158, 0.3936355, 1, 0, 0, 1, 1,
-0.05074824, 2.036366, -0.9298874, 1, 0, 0, 1, 1,
-0.0505746, 0.01129265, -1.559513, 0, 0, 0, 1, 1,
-0.04982552, -0.5261133, -1.599888, 0, 0, 0, 1, 1,
-0.04729486, -0.2725324, -3.522276, 0, 0, 0, 1, 1,
-0.04099549, 0.4075481, -1.916531, 0, 0, 0, 1, 1,
-0.03837965, -0.1216426, -2.590729, 0, 0, 0, 1, 1,
-0.03633958, 1.431003, 2.894639, 0, 0, 0, 1, 1,
-0.03608548, 0.3465843, -2.411387, 0, 0, 0, 1, 1,
-0.03299925, 1.12042, -0.1261127, 1, 1, 1, 1, 1,
-0.03285837, -0.4208839, -3.289669, 1, 1, 1, 1, 1,
-0.0324641, -0.03959833, -2.871747, 1, 1, 1, 1, 1,
-0.0293588, 0.2686073, -1.791746, 1, 1, 1, 1, 1,
-0.02739448, 0.4893949, -0.01689976, 1, 1, 1, 1, 1,
-0.02525242, 0.7715289, 0.7651159, 1, 1, 1, 1, 1,
-0.02120748, 1.425149, 0.1360892, 1, 1, 1, 1, 1,
-0.02024659, -0.1110774, -2.490385, 1, 1, 1, 1, 1,
-0.0171909, 0.465186, -1.325063, 1, 1, 1, 1, 1,
-0.01590228, -2.187327, -3.622813, 1, 1, 1, 1, 1,
-0.01518512, 0.04857692, -1.613689, 1, 1, 1, 1, 1,
-0.01143198, -0.01888823, -3.413547, 1, 1, 1, 1, 1,
-0.009733126, 0.4220339, 0.1810276, 1, 1, 1, 1, 1,
-0.007213108, 1.460511, -0.8785405, 1, 1, 1, 1, 1,
-0.004377464, 0.2961017, 0.2754377, 1, 1, 1, 1, 1,
-0.003971823, 0.01629502, 1.381066, 0, 0, 1, 1, 1,
0.0003121647, 0.1754627, 1.495519, 1, 0, 0, 1, 1,
0.007860257, -1.124943, 4.330084, 1, 0, 0, 1, 1,
0.01008517, -0.3077983, 3.69343, 1, 0, 0, 1, 1,
0.0180646, 1.099205, 1.05172, 1, 0, 0, 1, 1,
0.02006641, -0.416967, 1.830484, 1, 0, 0, 1, 1,
0.02035278, 0.1878747, 1.401506, 0, 0, 0, 1, 1,
0.0251293, 0.9732732, 0.5625433, 0, 0, 0, 1, 1,
0.02546505, 0.2092475, -1.122949, 0, 0, 0, 1, 1,
0.03989241, 0.5254889, 0.2992984, 0, 0, 0, 1, 1,
0.04027027, -1.025607, 1.742133, 0, 0, 0, 1, 1,
0.04165271, 0.5165144, -0.6736261, 0, 0, 0, 1, 1,
0.04409739, 0.1404738, -0.5988674, 0, 0, 0, 1, 1,
0.04489913, 0.09416529, 0.2322167, 1, 1, 1, 1, 1,
0.04914209, -0.3025221, 3.339078, 1, 1, 1, 1, 1,
0.04952535, -0.08729573, 2.065905, 1, 1, 1, 1, 1,
0.05166559, -2.031447, 3.047369, 1, 1, 1, 1, 1,
0.05244099, -0.3606508, 1.180612, 1, 1, 1, 1, 1,
0.05553657, 0.03507303, 2.203565, 1, 1, 1, 1, 1,
0.060527, 0.4320668, -0.2284825, 1, 1, 1, 1, 1,
0.06115999, -0.1217164, 4.0789, 1, 1, 1, 1, 1,
0.06258136, -0.7269416, 3.206441, 1, 1, 1, 1, 1,
0.06348348, 0.7116983, 1.225192, 1, 1, 1, 1, 1,
0.07105973, -0.1297591, 3.270909, 1, 1, 1, 1, 1,
0.07214256, 0.7874735, -1.081963, 1, 1, 1, 1, 1,
0.07773995, 1.063196, 1.130219, 1, 1, 1, 1, 1,
0.07963696, 0.1966632, 1.644623, 1, 1, 1, 1, 1,
0.08032998, 0.8429629, -0.1148885, 1, 1, 1, 1, 1,
0.08237556, 0.8584806, -0.8543901, 0, 0, 1, 1, 1,
0.08272775, 0.584199, 1.016352, 1, 0, 0, 1, 1,
0.08417746, 0.2256357, 0.4947977, 1, 0, 0, 1, 1,
0.08798049, 0.2326891, 1.817758, 1, 0, 0, 1, 1,
0.1043892, -0.2671978, 3.77346, 1, 0, 0, 1, 1,
0.1062625, -1.8515, 3.665801, 1, 0, 0, 1, 1,
0.1103121, 1.795597, 1.454566, 0, 0, 0, 1, 1,
0.1115702, -0.8340549, 2.557799, 0, 0, 0, 1, 1,
0.118768, -1.267788, 2.66849, 0, 0, 0, 1, 1,
0.1235905, -1.579095, 2.345406, 0, 0, 0, 1, 1,
0.1251899, -1.252493, 4.037548, 0, 0, 0, 1, 1,
0.1274478, 0.3955856, 1.763605, 0, 0, 0, 1, 1,
0.1286747, -0.8020064, 4.223227, 0, 0, 0, 1, 1,
0.1317065, 1.44588, -0.2484044, 1, 1, 1, 1, 1,
0.1319794, -0.161198, 0.874654, 1, 1, 1, 1, 1,
0.1339557, 0.5650114, 0.7018472, 1, 1, 1, 1, 1,
0.1389683, 0.2793488, 0.6543692, 1, 1, 1, 1, 1,
0.1409389, 1.131072, 1.171191, 1, 1, 1, 1, 1,
0.142699, 1.026865, 0.5022782, 1, 1, 1, 1, 1,
0.1501305, -0.5177085, 3.372061, 1, 1, 1, 1, 1,
0.1506333, -0.2655041, 3.836194, 1, 1, 1, 1, 1,
0.1521283, 1.013213, 0.9807217, 1, 1, 1, 1, 1,
0.1531964, -1.022969, 1.923386, 1, 1, 1, 1, 1,
0.1567993, 0.597562, -0.03023962, 1, 1, 1, 1, 1,
0.1577527, 1.260033, 0.3802144, 1, 1, 1, 1, 1,
0.1621694, -0.2900303, 2.347979, 1, 1, 1, 1, 1,
0.1622308, -0.1778428, 2.712527, 1, 1, 1, 1, 1,
0.1657644, 1.695598, -0.4583307, 1, 1, 1, 1, 1,
0.1697093, 0.3337315, -0.2742038, 0, 0, 1, 1, 1,
0.1714532, 1.298418, -0.4561686, 1, 0, 0, 1, 1,
0.1765814, 0.4188867, 0.448903, 1, 0, 0, 1, 1,
0.1791524, -1.333123, 1.926872, 1, 0, 0, 1, 1,
0.1795853, 0.737933, 0.005537782, 1, 0, 0, 1, 1,
0.1809372, 0.06136925, 2.919183, 1, 0, 0, 1, 1,
0.1824491, 2.827586, 0.8096173, 0, 0, 0, 1, 1,
0.1856529, 0.02515987, 2.407203, 0, 0, 0, 1, 1,
0.1911973, -0.1661921, 4.397635, 0, 0, 0, 1, 1,
0.1922612, 1.790289, -0.4142828, 0, 0, 0, 1, 1,
0.1952135, 1.773613, 0.6614617, 0, 0, 0, 1, 1,
0.1981864, -0.1318977, 1.928283, 0, 0, 0, 1, 1,
0.1981956, -1.327199, 3.147819, 0, 0, 0, 1, 1,
0.1993176, -2.297109, 3.026743, 1, 1, 1, 1, 1,
0.2015421, 0.5630596, -0.2058926, 1, 1, 1, 1, 1,
0.2028905, -1.437087, 2.438858, 1, 1, 1, 1, 1,
0.2059913, 0.5715299, -0.2280923, 1, 1, 1, 1, 1,
0.2108533, -1.888783, 2.206115, 1, 1, 1, 1, 1,
0.2109885, 0.8492037, 0.5211232, 1, 1, 1, 1, 1,
0.2136744, -1.274634, 3.085508, 1, 1, 1, 1, 1,
0.2171739, -1.412949, 2.965829, 1, 1, 1, 1, 1,
0.2223258, -1.323379, 3.540593, 1, 1, 1, 1, 1,
0.223033, 0.08861686, -0.11037, 1, 1, 1, 1, 1,
0.224994, 0.005596462, 1.787987, 1, 1, 1, 1, 1,
0.2281032, -0.2217831, 2.369265, 1, 1, 1, 1, 1,
0.2284598, 1.462645, 1.007919, 1, 1, 1, 1, 1,
0.2287133, 0.1476225, 2.103942, 1, 1, 1, 1, 1,
0.2309791, -0.352542, 4.102689, 1, 1, 1, 1, 1,
0.238012, 0.07235202, 0.5776216, 0, 0, 1, 1, 1,
0.2384473, 0.9732942, 0.7520203, 1, 0, 0, 1, 1,
0.2393394, -0.3531717, 2.684388, 1, 0, 0, 1, 1,
0.2396506, 1.978914, 0.6192462, 1, 0, 0, 1, 1,
0.2445175, -0.178912, 0.9022194, 1, 0, 0, 1, 1,
0.255548, -0.8486929, 3.848114, 1, 0, 0, 1, 1,
0.2640133, -0.1468814, 2.286082, 0, 0, 0, 1, 1,
0.2672639, 0.8692181, 1.051321, 0, 0, 0, 1, 1,
0.2695093, 0.5026966, 1.043468, 0, 0, 0, 1, 1,
0.2699343, 0.4801839, 0.249883, 0, 0, 0, 1, 1,
0.2737627, 1.67208, 1.228928, 0, 0, 0, 1, 1,
0.2741765, 0.6864137, 1.441034, 0, 0, 0, 1, 1,
0.2755153, -1.171327, 1.376958, 0, 0, 0, 1, 1,
0.2762836, 0.06682897, 0.1635462, 1, 1, 1, 1, 1,
0.2821337, -1.161707, 4.153494, 1, 1, 1, 1, 1,
0.2864199, 1.353229, -1.809293, 1, 1, 1, 1, 1,
0.2881266, -0.107041, 1.957764, 1, 1, 1, 1, 1,
0.2896925, 0.9093044, -1.391374, 1, 1, 1, 1, 1,
0.290379, 1.707026, 0.8600647, 1, 1, 1, 1, 1,
0.2932782, -0.4738446, 3.786091, 1, 1, 1, 1, 1,
0.2936409, -1.065108, 3.676781, 1, 1, 1, 1, 1,
0.2972565, -0.5612283, 0.6099894, 1, 1, 1, 1, 1,
0.2973813, 0.1274479, 2.193555, 1, 1, 1, 1, 1,
0.3002042, 1.190397, 0.2827968, 1, 1, 1, 1, 1,
0.3039148, -1.406224, 2.808775, 1, 1, 1, 1, 1,
0.3043097, -0.8619186, 1.937126, 1, 1, 1, 1, 1,
0.3066904, 1.00456, -0.2419168, 1, 1, 1, 1, 1,
0.3095872, -1.214545, 2.523554, 1, 1, 1, 1, 1,
0.3150846, 1.352985, -0.5409492, 0, 0, 1, 1, 1,
0.3159226, -0.9424605, 2.672035, 1, 0, 0, 1, 1,
0.3164617, -1.733876, 1.747593, 1, 0, 0, 1, 1,
0.3179342, 1.554927, 0.3040099, 1, 0, 0, 1, 1,
0.3212813, 0.1943164, 0.6762145, 1, 0, 0, 1, 1,
0.3278909, -1.475337, 2.908145, 1, 0, 0, 1, 1,
0.334446, -0.3603846, 2.540067, 0, 0, 0, 1, 1,
0.3348039, -0.2843489, 3.2398, 0, 0, 0, 1, 1,
0.3353829, 0.5771697, 1.499147, 0, 0, 0, 1, 1,
0.3373004, -0.3195799, 3.043454, 0, 0, 0, 1, 1,
0.3375573, 1.359767, -0.571141, 0, 0, 0, 1, 1,
0.338458, -0.3517061, 2.345224, 0, 0, 0, 1, 1,
0.3473792, -1.117877, 3.683558, 0, 0, 0, 1, 1,
0.3476962, 0.7935397, -1.390327, 1, 1, 1, 1, 1,
0.353675, 0.4702963, -0.1575736, 1, 1, 1, 1, 1,
0.3559885, -0.2273962, -0.7859151, 1, 1, 1, 1, 1,
0.3652298, -0.3784351, 3.230411, 1, 1, 1, 1, 1,
0.3709685, -0.3299337, 2.501589, 1, 1, 1, 1, 1,
0.374559, -0.5672422, 2.521754, 1, 1, 1, 1, 1,
0.3819933, -1.546068, 2.660161, 1, 1, 1, 1, 1,
0.3823344, 0.1882363, 0.550096, 1, 1, 1, 1, 1,
0.3857218, 1.086262, 0.4288007, 1, 1, 1, 1, 1,
0.3875604, 0.5662232, 0.178865, 1, 1, 1, 1, 1,
0.3890302, -1.038686, 1.070884, 1, 1, 1, 1, 1,
0.3903896, 0.5387059, -1.070952, 1, 1, 1, 1, 1,
0.3942754, -0.3602297, 3.125661, 1, 1, 1, 1, 1,
0.3960317, -0.4274807, 2.858598, 1, 1, 1, 1, 1,
0.4008228, 1.365933, 1.303407, 1, 1, 1, 1, 1,
0.4038667, -0.7468099, 1.297482, 0, 0, 1, 1, 1,
0.4070152, 0.01090531, 0.5458342, 1, 0, 0, 1, 1,
0.4073791, 1.185788, -0.250886, 1, 0, 0, 1, 1,
0.408157, 0.6378691, 1.063973, 1, 0, 0, 1, 1,
0.4084841, -2.216462, 3.768883, 1, 0, 0, 1, 1,
0.409783, -0.9732875, 2.042525, 1, 0, 0, 1, 1,
0.4101405, 0.3067182, 4.520295, 0, 0, 0, 1, 1,
0.4143838, -0.01255906, 3.302699, 0, 0, 0, 1, 1,
0.4158299, 0.2107179, 2.335155, 0, 0, 0, 1, 1,
0.4173592, -1.683474, 1.675495, 0, 0, 0, 1, 1,
0.4184967, 0.8656653, 0.03995587, 0, 0, 0, 1, 1,
0.4216085, 0.7916536, 0.992249, 0, 0, 0, 1, 1,
0.4245948, -0.8760028, 2.171942, 0, 0, 0, 1, 1,
0.4253444, -0.6731812, 0.7015066, 1, 1, 1, 1, 1,
0.4261409, 0.9282938, 0.3522243, 1, 1, 1, 1, 1,
0.4263807, 1.029076, 1.241988, 1, 1, 1, 1, 1,
0.4288929, -0.01094007, 2.933769, 1, 1, 1, 1, 1,
0.4294719, -1.727474, 2.678643, 1, 1, 1, 1, 1,
0.4303192, -1.083289, 2.669516, 1, 1, 1, 1, 1,
0.4347998, 0.1312785, 1.455694, 1, 1, 1, 1, 1,
0.4377457, 0.8736259, -1.307646, 1, 1, 1, 1, 1,
0.4397009, 0.6380561, 2.711199, 1, 1, 1, 1, 1,
0.439914, -0.3608987, 1.337151, 1, 1, 1, 1, 1,
0.4406817, 0.7441208, 0.3741115, 1, 1, 1, 1, 1,
0.4417602, -0.1309287, 1.646801, 1, 1, 1, 1, 1,
0.4468759, -0.2194694, 0.7539862, 1, 1, 1, 1, 1,
0.4490368, -0.1235934, 1.242077, 1, 1, 1, 1, 1,
0.4518133, 0.1417222, 1.032137, 1, 1, 1, 1, 1,
0.4558804, -0.07764821, 1.721219, 0, 0, 1, 1, 1,
0.4581434, 1.538007, -0.3654701, 1, 0, 0, 1, 1,
0.4597817, -0.01970378, 0.2587304, 1, 0, 0, 1, 1,
0.4621046, -1.604497, 1.446089, 1, 0, 0, 1, 1,
0.4638736, -1.063312, 1.324064, 1, 0, 0, 1, 1,
0.4683731, -1.384175, 3.82404, 1, 0, 0, 1, 1,
0.4687243, 1.736338, -0.2765382, 0, 0, 0, 1, 1,
0.4696919, 0.03934376, 0.7581227, 0, 0, 0, 1, 1,
0.4719487, 0.4380905, 1.415384, 0, 0, 0, 1, 1,
0.4787365, 0.4781115, 0.566502, 0, 0, 0, 1, 1,
0.4789542, -0.2153455, 0.7334047, 0, 0, 0, 1, 1,
0.4796415, -0.791384, 1.979035, 0, 0, 0, 1, 1,
0.4846188, 0.272387, 0.9233479, 0, 0, 0, 1, 1,
0.4864304, -0.8042595, 3.086138, 1, 1, 1, 1, 1,
0.4872925, -1.302462, 4.431691, 1, 1, 1, 1, 1,
0.4896644, 1.254583, -0.3382424, 1, 1, 1, 1, 1,
0.5019888, 0.9699953, -0.2776525, 1, 1, 1, 1, 1,
0.5021756, -0.7114305, 2.390882, 1, 1, 1, 1, 1,
0.5045711, -1.540727, 2.908816, 1, 1, 1, 1, 1,
0.5048065, -1.806008, 2.430124, 1, 1, 1, 1, 1,
0.512219, 0.2047206, 1.526682, 1, 1, 1, 1, 1,
0.5147429, -0.4505964, 2.456974, 1, 1, 1, 1, 1,
0.516827, 0.5998642, -0.3029467, 1, 1, 1, 1, 1,
0.5197446, -0.2343435, 2.556555, 1, 1, 1, 1, 1,
0.5200343, -0.5322865, 3.406381, 1, 1, 1, 1, 1,
0.5225865, -0.4087857, 2.019588, 1, 1, 1, 1, 1,
0.5241258, 0.5965368, 1.247743, 1, 1, 1, 1, 1,
0.5270007, 0.04597175, 2.237236, 1, 1, 1, 1, 1,
0.527608, 0.34287, 0.3405763, 0, 0, 1, 1, 1,
0.528346, -0.659361, 1.204161, 1, 0, 0, 1, 1,
0.5285425, 0.2043563, 2.08506, 1, 0, 0, 1, 1,
0.5416379, 2.433024, 1.627724, 1, 0, 0, 1, 1,
0.5468273, -0.4441215, 2.705936, 1, 0, 0, 1, 1,
0.5483936, -0.2965833, 1.897957, 1, 0, 0, 1, 1,
0.5591031, 1.892102, 2.011468, 0, 0, 0, 1, 1,
0.5606022, 0.6386613, -1.241102, 0, 0, 0, 1, 1,
0.5641612, -0.5347896, 1.380849, 0, 0, 0, 1, 1,
0.5725675, 1.038323, 2.230685, 0, 0, 0, 1, 1,
0.5769998, -1.086377, 1.374669, 0, 0, 0, 1, 1,
0.5778515, -1.424447, 2.771168, 0, 0, 0, 1, 1,
0.5785623, -0.08772554, 2.35875, 0, 0, 0, 1, 1,
0.5854223, -0.5684613, 1.275456, 1, 1, 1, 1, 1,
0.5889575, 1.269309, 1.409039, 1, 1, 1, 1, 1,
0.5894587, 0.8245825, 0.5110886, 1, 1, 1, 1, 1,
0.5905982, -0.02993355, 2.517135, 1, 1, 1, 1, 1,
0.6000125, -2.169799, 3.058625, 1, 1, 1, 1, 1,
0.6010826, 0.6526063, 2.28656, 1, 1, 1, 1, 1,
0.6038823, -0.2968493, 0.2476503, 1, 1, 1, 1, 1,
0.6076058, -0.07583507, 0.7800655, 1, 1, 1, 1, 1,
0.6142635, 0.222384, 1.773622, 1, 1, 1, 1, 1,
0.6153112, -1.324357, 2.869727, 1, 1, 1, 1, 1,
0.6182154, 0.425155, 1.284881, 1, 1, 1, 1, 1,
0.6199384, 0.6695387, 0.5856085, 1, 1, 1, 1, 1,
0.6208315, 0.2161634, 1.51035, 1, 1, 1, 1, 1,
0.6259352, -0.3469996, 2.819515, 1, 1, 1, 1, 1,
0.6281502, -1.589082, 2.463726, 1, 1, 1, 1, 1,
0.6365206, 0.1211902, 1.385972, 0, 0, 1, 1, 1,
0.6387207, -0.5167741, 3.114864, 1, 0, 0, 1, 1,
0.652995, -1.446142, 3.112634, 1, 0, 0, 1, 1,
0.6584606, 0.8481852, 0.8224654, 1, 0, 0, 1, 1,
0.6585304, 1.010257, -1.223177, 1, 0, 0, 1, 1,
0.6585465, -1.308725, 1.224925, 1, 0, 0, 1, 1,
0.6614177, 1.270009, 0.656567, 0, 0, 0, 1, 1,
0.6688662, 0.2491759, 0.1246885, 0, 0, 0, 1, 1,
0.669804, -0.8013725, 0.3294564, 0, 0, 0, 1, 1,
0.6768975, -0.4442551, 2.35094, 0, 0, 0, 1, 1,
0.6774754, 1.356613, -0.5325758, 0, 0, 0, 1, 1,
0.6791577, 1.228974, 3.162697, 0, 0, 0, 1, 1,
0.6813778, 1.222482, 0.1442448, 0, 0, 0, 1, 1,
0.687656, -0.001386573, 2.472707, 1, 1, 1, 1, 1,
0.6926963, 0.785376, 1.202689, 1, 1, 1, 1, 1,
0.6966906, -0.8406741, 1.49894, 1, 1, 1, 1, 1,
0.698478, -0.4792178, 0.1985072, 1, 1, 1, 1, 1,
0.698792, -0.8077476, 1.768081, 1, 1, 1, 1, 1,
0.7009178, 0.8467109, 0.5198989, 1, 1, 1, 1, 1,
0.7203707, -0.5094994, 2.482188, 1, 1, 1, 1, 1,
0.722226, 0.1211082, 1.384835, 1, 1, 1, 1, 1,
0.7239832, -0.748989, 2.740938, 1, 1, 1, 1, 1,
0.7249351, -0.3185447, 2.060102, 1, 1, 1, 1, 1,
0.728406, -1.274043, 2.884688, 1, 1, 1, 1, 1,
0.729829, 1.00267, 0.5819138, 1, 1, 1, 1, 1,
0.7302365, 1.524785, 0.7676007, 1, 1, 1, 1, 1,
0.7338244, -0.7293278, 2.307846, 1, 1, 1, 1, 1,
0.7384787, 1.058042, 0.8108749, 1, 1, 1, 1, 1,
0.7392849, -1.10328, 2.803677, 0, 0, 1, 1, 1,
0.7474553, -0.9104965, 4.040386, 1, 0, 0, 1, 1,
0.7479581, -0.9238344, 2.564887, 1, 0, 0, 1, 1,
0.7519709, -0.1710496, 3.042984, 1, 0, 0, 1, 1,
0.7611112, 0.6705872, -0.6632189, 1, 0, 0, 1, 1,
0.7648212, -1.111029, 2.588505, 1, 0, 0, 1, 1,
0.7707902, 1.27785, 1.018884, 0, 0, 0, 1, 1,
0.7714254, -0.914398, 1.5598, 0, 0, 0, 1, 1,
0.7728315, -0.647276, 1.774171, 0, 0, 0, 1, 1,
0.7731963, -0.3025319, 1.73899, 0, 0, 0, 1, 1,
0.7781693, -0.7446015, 3.211211, 0, 0, 0, 1, 1,
0.779533, -2.009203, 4.316569, 0, 0, 0, 1, 1,
0.7795749, -0.7194401, 1.419409, 0, 0, 0, 1, 1,
0.7805048, 0.9372847, 0.2907415, 1, 1, 1, 1, 1,
0.7826401, 0.6112347, 1.296094, 1, 1, 1, 1, 1,
0.7944624, -0.8601356, 3.04521, 1, 1, 1, 1, 1,
0.7971581, 0.4265261, -1.199307, 1, 1, 1, 1, 1,
0.8014113, 0.2057105, 3.563061, 1, 1, 1, 1, 1,
0.8035601, -0.362494, 2.057115, 1, 1, 1, 1, 1,
0.8036507, 0.6608291, 0.6987647, 1, 1, 1, 1, 1,
0.8076252, -0.1116305, 0.7064999, 1, 1, 1, 1, 1,
0.8088092, -1.564899, 3.392906, 1, 1, 1, 1, 1,
0.8118506, 0.6567674, 0.9075149, 1, 1, 1, 1, 1,
0.8157383, 0.591671, 2.450591, 1, 1, 1, 1, 1,
0.8190262, -1.045078, 2.776202, 1, 1, 1, 1, 1,
0.8213009, -1.477984, 3.280735, 1, 1, 1, 1, 1,
0.8286267, -0.05051367, 0.1590878, 1, 1, 1, 1, 1,
0.8338403, -0.4627171, 3.02559, 1, 1, 1, 1, 1,
0.8342732, 0.38093, 0.5715827, 0, 0, 1, 1, 1,
0.8444679, -0.1755262, 0.2343461, 1, 0, 0, 1, 1,
0.8520976, -0.216965, 1.983074, 1, 0, 0, 1, 1,
0.8528751, 0.7107269, -0.2342673, 1, 0, 0, 1, 1,
0.8566102, -0.1629626, 0.6980892, 1, 0, 0, 1, 1,
0.8579708, 0.8394263, 1.450545, 1, 0, 0, 1, 1,
0.864474, 0.1784576, -0.1657319, 0, 0, 0, 1, 1,
0.86515, -0.2524599, 3.764485, 0, 0, 0, 1, 1,
0.8755553, 0.5838327, 0.309049, 0, 0, 0, 1, 1,
0.8763936, 1.491829, 0.6871713, 0, 0, 0, 1, 1,
0.8800293, -1.054886, 1.643467, 0, 0, 0, 1, 1,
0.8804057, -0.5075365, 1.614185, 0, 0, 0, 1, 1,
0.8854215, 0.2967082, 0.7058867, 0, 0, 0, 1, 1,
0.8916855, 0.7872112, 0.5085659, 1, 1, 1, 1, 1,
0.8974417, -0.5765021, 2.527062, 1, 1, 1, 1, 1,
0.8975018, -1.02836, 2.782771, 1, 1, 1, 1, 1,
0.9021262, -0.9864532, 0.8408275, 1, 1, 1, 1, 1,
0.9032682, 0.9531291, 2.309609, 1, 1, 1, 1, 1,
0.9060156, -2.197126, 1.991682, 1, 1, 1, 1, 1,
0.9075475, 1.510407, 2.000874, 1, 1, 1, 1, 1,
0.9080151, -1.54202, 2.602767, 1, 1, 1, 1, 1,
0.9088965, 2.277336, 1.194156, 1, 1, 1, 1, 1,
0.9097592, 0.233825, 1.716609, 1, 1, 1, 1, 1,
0.9116629, 0.08989964, 2.089125, 1, 1, 1, 1, 1,
0.9130944, -0.4094591, 1.992478, 1, 1, 1, 1, 1,
0.9134043, -0.7799321, 2.501966, 1, 1, 1, 1, 1,
0.917304, -0.3788711, 2.681455, 1, 1, 1, 1, 1,
0.9211223, 0.229851, 1.196115, 1, 1, 1, 1, 1,
0.9279769, 0.03056703, 2.762007, 0, 0, 1, 1, 1,
0.928604, -0.3030666, 1.811136, 1, 0, 0, 1, 1,
0.9321647, -0.4486982, 3.119326, 1, 0, 0, 1, 1,
0.9324088, 0.09940598, 1.250537, 1, 0, 0, 1, 1,
0.9336753, -0.4313847, 2.603638, 1, 0, 0, 1, 1,
0.9357759, -0.186536, 0.4684657, 1, 0, 0, 1, 1,
0.9395069, 0.1010492, -0.01879849, 0, 0, 0, 1, 1,
0.9406622, -0.3073929, 1.391241, 0, 0, 0, 1, 1,
0.9444032, 0.47199, 1.296831, 0, 0, 0, 1, 1,
0.9465313, 0.309703, 2.694138, 0, 0, 0, 1, 1,
0.9519653, 0.003568341, 1.615083, 0, 0, 0, 1, 1,
0.956697, -2.049113, 3.82625, 0, 0, 0, 1, 1,
0.9631851, 0.9369872, 2.301206, 0, 0, 0, 1, 1,
0.96609, -1.122543, 2.256108, 1, 1, 1, 1, 1,
0.9671959, 0.6533306, 1.13972, 1, 1, 1, 1, 1,
0.9704189, -0.852569, 2.722833, 1, 1, 1, 1, 1,
0.9732221, -1.672276, 2.54005, 1, 1, 1, 1, 1,
0.98445, -0.2123153, 0.6960304, 1, 1, 1, 1, 1,
0.9875401, -0.0864329, 0.04513671, 1, 1, 1, 1, 1,
0.989449, -0.738146, 1.994513, 1, 1, 1, 1, 1,
0.9960628, 0.9652893, 1.337406, 1, 1, 1, 1, 1,
1.001364, -0.9897592, 2.034358, 1, 1, 1, 1, 1,
1.004408, 0.03046316, -0.4537325, 1, 1, 1, 1, 1,
1.008421, 0.8711548, 0.5805606, 1, 1, 1, 1, 1,
1.010628, -0.762037, 1.176779, 1, 1, 1, 1, 1,
1.011837, 0.8929726, 0.8126521, 1, 1, 1, 1, 1,
1.013212, 0.5239473, 1.328532, 1, 1, 1, 1, 1,
1.018489, -0.7571269, 1.303319, 1, 1, 1, 1, 1,
1.020345, 1.280435, 1.993312, 0, 0, 1, 1, 1,
1.029894, 0.6671422, 1.468477, 1, 0, 0, 1, 1,
1.030542, -0.1903443, 2.880198, 1, 0, 0, 1, 1,
1.031893, 2.852265, 1.46904, 1, 0, 0, 1, 1,
1.032184, 0.3515927, 2.273231, 1, 0, 0, 1, 1,
1.038451, -1.245061, 2.303569, 1, 0, 0, 1, 1,
1.046944, -0.1090816, 1.897031, 0, 0, 0, 1, 1,
1.053119, 0.7488886, 2.329125, 0, 0, 0, 1, 1,
1.064906, 0.06130777, 3.473943, 0, 0, 0, 1, 1,
1.071443, -0.4695597, -0.2216626, 0, 0, 0, 1, 1,
1.072468, -0.1918929, 2.533801, 0, 0, 0, 1, 1,
1.079554, 0.5467176, 0.4244865, 0, 0, 0, 1, 1,
1.080978, 0.1063149, 0.6970329, 0, 0, 0, 1, 1,
1.085326, 0.04821713, 2.091035, 1, 1, 1, 1, 1,
1.088717, -1.721412, 2.32327, 1, 1, 1, 1, 1,
1.089369, -0.6247541, 1.716615, 1, 1, 1, 1, 1,
1.1066, 0.3824782, 2.981993, 1, 1, 1, 1, 1,
1.10903, -0.9239888, 0.6853549, 1, 1, 1, 1, 1,
1.10957, 1.408175, 0.839332, 1, 1, 1, 1, 1,
1.139156, 0.4891711, 1.305605, 1, 1, 1, 1, 1,
1.14011, 0.5678038, 2.528254, 1, 1, 1, 1, 1,
1.141906, -1.219693, 0.2723272, 1, 1, 1, 1, 1,
1.142575, -3.0477, 3.093904, 1, 1, 1, 1, 1,
1.156666, -0.5379589, 0.3475679, 1, 1, 1, 1, 1,
1.160138, -0.8373878, 1.405144, 1, 1, 1, 1, 1,
1.171116, 3.160207, 0.3895101, 1, 1, 1, 1, 1,
1.172294, -0.92985, 1.56799, 1, 1, 1, 1, 1,
1.175466, 0.3896607, 1.147396, 1, 1, 1, 1, 1,
1.178006, -2.141601, 0.9296369, 0, 0, 1, 1, 1,
1.181729, -1.552522, 0.8750188, 1, 0, 0, 1, 1,
1.189299, 1.263774, 0.6244964, 1, 0, 0, 1, 1,
1.189875, 0.2570623, 1.926592, 1, 0, 0, 1, 1,
1.210619, 1.057471, 1.024292, 1, 0, 0, 1, 1,
1.215728, -0.1662409, 0.5615416, 1, 0, 0, 1, 1,
1.221786, -0.6602409, 1.801748, 0, 0, 0, 1, 1,
1.22341, 0.263525, 1.742147, 0, 0, 0, 1, 1,
1.229299, 1.668907, 0.5377184, 0, 0, 0, 1, 1,
1.23155, -0.8376369, 3.451539, 0, 0, 0, 1, 1,
1.264706, -0.8708511, 3.301466, 0, 0, 0, 1, 1,
1.282948, -0.4348176, 1.482871, 0, 0, 0, 1, 1,
1.283204, 0.6780422, 0.2824111, 0, 0, 0, 1, 1,
1.297105, -0.2420915, 0.09539193, 1, 1, 1, 1, 1,
1.298965, -1.325538, 3.193852, 1, 1, 1, 1, 1,
1.309473, -1.126271, 2.156007, 1, 1, 1, 1, 1,
1.312938, 1.50935, 1.988118, 1, 1, 1, 1, 1,
1.346324, 1.255538, 1.41488, 1, 1, 1, 1, 1,
1.353894, 0.08963332, 1.252545, 1, 1, 1, 1, 1,
1.355423, 1.168758, 1.129841, 1, 1, 1, 1, 1,
1.358042, 0.6294501, 0.3393389, 1, 1, 1, 1, 1,
1.368751, 0.7226021, 2.109256, 1, 1, 1, 1, 1,
1.369174, 1.618733, 1.303542, 1, 1, 1, 1, 1,
1.375777, 0.2949064, 2.217371, 1, 1, 1, 1, 1,
1.383519, 1.490294, 2.007125, 1, 1, 1, 1, 1,
1.384606, 1.823973, 0.1449796, 1, 1, 1, 1, 1,
1.403485, 1.240118, 0.335065, 1, 1, 1, 1, 1,
1.405626, 1.600889, 1.755908, 1, 1, 1, 1, 1,
1.426019, -0.3107539, 1.513401, 0, 0, 1, 1, 1,
1.426826, -0.3049961, 1.32545, 1, 0, 0, 1, 1,
1.435926, -0.7345378, 3.026588, 1, 0, 0, 1, 1,
1.442458, -1.201884, 2.257276, 1, 0, 0, 1, 1,
1.450253, -0.5578923, 2.293975, 1, 0, 0, 1, 1,
1.452109, -0.3613414, 0.7794421, 1, 0, 0, 1, 1,
1.452305, 0.5930914, 0.1717481, 0, 0, 0, 1, 1,
1.456671, -0.6570255, 1.373935, 0, 0, 0, 1, 1,
1.462137, -2.566754, 2.249852, 0, 0, 0, 1, 1,
1.473989, -0.3135062, 2.085336, 0, 0, 0, 1, 1,
1.482032, -0.09634362, 1.201396, 0, 0, 0, 1, 1,
1.485584, 2.580743, 2.376918, 0, 0, 0, 1, 1,
1.495332, 0.3389211, 2.861501, 0, 0, 0, 1, 1,
1.505593, 0.3920537, 1.047656, 1, 1, 1, 1, 1,
1.512212, -0.2810932, 2.357716, 1, 1, 1, 1, 1,
1.523947, -1.961202, 3.43835, 1, 1, 1, 1, 1,
1.548171, 0.6924561, 2.259054, 1, 1, 1, 1, 1,
1.551602, 0.6598412, -0.08551793, 1, 1, 1, 1, 1,
1.565554, 2.000132, 0.0176802, 1, 1, 1, 1, 1,
1.576099, 2.297727, -0.004090596, 1, 1, 1, 1, 1,
1.578132, -0.9353688, 1.766578, 1, 1, 1, 1, 1,
1.609801, 1.051852, 0.09509207, 1, 1, 1, 1, 1,
1.611278, -0.5715079, 3.409593, 1, 1, 1, 1, 1,
1.611584, -1.320077, 1.5781, 1, 1, 1, 1, 1,
1.623495, -0.46913, 3.107247, 1, 1, 1, 1, 1,
1.633838, 0.6059976, 0.9579977, 1, 1, 1, 1, 1,
1.634088, 0.07393511, 0.4284553, 1, 1, 1, 1, 1,
1.644726, -0.4372171, 2.290575, 1, 1, 1, 1, 1,
1.65309, 0.8093999, 2.730279, 0, 0, 1, 1, 1,
1.691392, -1.1222, 3.580265, 1, 0, 0, 1, 1,
1.72498, 1.538881, 1.876987, 1, 0, 0, 1, 1,
1.74659, 2.07357, -0.06020168, 1, 0, 0, 1, 1,
1.762594, 0.8380582, 1.186808, 1, 0, 0, 1, 1,
1.767918, 0.3129295, 2.101494, 1, 0, 0, 1, 1,
1.774633, 0.6163836, 1.60837, 0, 0, 0, 1, 1,
1.78207, -0.1017497, 1.886175, 0, 0, 0, 1, 1,
1.78662, -0.5473497, 3.419864, 0, 0, 0, 1, 1,
1.789207, 1.481923, 0.3184167, 0, 0, 0, 1, 1,
1.794051, 0.09295008, 1.325407, 0, 0, 0, 1, 1,
1.8044, -0.340184, 3.450724, 0, 0, 0, 1, 1,
1.805639, 1.347625, -0.4663695, 0, 0, 0, 1, 1,
1.815365, -1.069748, 2.706896, 1, 1, 1, 1, 1,
1.8222, -0.9330654, 2.293251, 1, 1, 1, 1, 1,
1.83533, 1.340657, 0.1502955, 1, 1, 1, 1, 1,
1.842659, -0.6986854, 1.94477, 1, 1, 1, 1, 1,
1.858432, 0.3337509, 0.7833045, 1, 1, 1, 1, 1,
1.886315, -0.3785369, 2.515471, 1, 1, 1, 1, 1,
1.886394, 1.516843, 1.597401, 1, 1, 1, 1, 1,
1.88985, 0.1924803, 2.008866, 1, 1, 1, 1, 1,
1.905606, 0.0001268651, 1.534677, 1, 1, 1, 1, 1,
1.920349, 0.7681268, 2.401069, 1, 1, 1, 1, 1,
1.928102, -0.3814165, 0.3593467, 1, 1, 1, 1, 1,
1.930034, 0.6511999, 2.716293, 1, 1, 1, 1, 1,
1.974731, 1.713512, 1.371548, 1, 1, 1, 1, 1,
1.991353, -0.4309847, 1.454732, 1, 1, 1, 1, 1,
2.002158, -1.192368, 2.074286, 1, 1, 1, 1, 1,
2.020913, 1.262413, -1.378848, 0, 0, 1, 1, 1,
2.025722, -1.013491, 2.355717, 1, 0, 0, 1, 1,
2.027645, 0.02855775, 1.378553, 1, 0, 0, 1, 1,
2.033749, 0.8708715, 2.786357, 1, 0, 0, 1, 1,
2.06745, 1.271095, 0.3275442, 1, 0, 0, 1, 1,
2.094254, -1.133258, 0.6520025, 1, 0, 0, 1, 1,
2.132117, -0.932247, 3.365734, 0, 0, 0, 1, 1,
2.14747, -1.450456, 3.121163, 0, 0, 0, 1, 1,
2.171139, -0.2842886, 1.188051, 0, 0, 0, 1, 1,
2.172117, -0.491825, 3.099322, 0, 0, 0, 1, 1,
2.231025, -0.1244578, 1.941729, 0, 0, 0, 1, 1,
2.244237, -1.789787, 1.005079, 0, 0, 0, 1, 1,
2.253929, 1.178554, 1.423079, 0, 0, 0, 1, 1,
2.274327, -0.8753662, 0.7175699, 1, 1, 1, 1, 1,
2.366686, 0.4677409, 0.9830158, 1, 1, 1, 1, 1,
2.369151, -0.3773381, 2.628994, 1, 1, 1, 1, 1,
2.383929, 0.8729421, 3.338447, 1, 1, 1, 1, 1,
2.586943, 0.2234706, 0.506372, 1, 1, 1, 1, 1,
2.811102, 1.316838, -0.1215855, 1, 1, 1, 1, 1,
3.600962, 1.198328, 1.710632, 1, 1, 1, 1, 1
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
var radius = 9.18649;
var distance = 32.26715;
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
mvMatrix.translate( -0.4611548, -0.05625319, 0.4600632 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.26715);
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
