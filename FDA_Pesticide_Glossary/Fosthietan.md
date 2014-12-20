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
-2.608086, 1.823683, -0.3119405, 1, 0, 0, 1,
-2.60804, 0.5509135, -1.566879, 1, 0.007843138, 0, 1,
-2.605782, 1.801948, 0.4843239, 1, 0.01176471, 0, 1,
-2.594973, -0.252928, -0.6741301, 1, 0.01960784, 0, 1,
-2.547133, -0.8813524, -1.837058, 1, 0.02352941, 0, 1,
-2.537155, 0.7952521, -0.1629444, 1, 0.03137255, 0, 1,
-2.346822, 0.0865581, -0.3909333, 1, 0.03529412, 0, 1,
-2.288496, -0.7497793, -1.048494, 1, 0.04313726, 0, 1,
-2.253551, -0.4467407, -0.9304587, 1, 0.04705882, 0, 1,
-2.21761, 1.060044, 1.514337, 1, 0.05490196, 0, 1,
-2.216963, -0.2402266, -2.543839, 1, 0.05882353, 0, 1,
-2.211823, 0.5711033, -0.6021706, 1, 0.06666667, 0, 1,
-2.160235, 0.4143409, -3.4595, 1, 0.07058824, 0, 1,
-2.15988, -0.4249338, -2.77548, 1, 0.07843138, 0, 1,
-2.154554, -0.5378566, -0.6307932, 1, 0.08235294, 0, 1,
-2.150425, 0.2606718, -3.552753, 1, 0.09019608, 0, 1,
-2.139632, -0.4316854, -0.5899267, 1, 0.09411765, 0, 1,
-2.071021, -2.531508, -3.838117, 1, 0.1019608, 0, 1,
-2.046358, -0.5515975, -2.552525, 1, 0.1098039, 0, 1,
-2.046348, 0.07022231, -1.850413, 1, 0.1137255, 0, 1,
-2.029239, -0.6788263, -0.9500648, 1, 0.1215686, 0, 1,
-2.014227, 0.1323144, -2.842669, 1, 0.1254902, 0, 1,
-1.963001, 1.053329, -1.398486, 1, 0.1333333, 0, 1,
-1.940431, -0.8819581, -3.314355, 1, 0.1372549, 0, 1,
-1.912271, -0.6664609, -1.390223, 1, 0.145098, 0, 1,
-1.881933, -0.258433, -2.166103, 1, 0.1490196, 0, 1,
-1.875083, 1.348634, -0.223814, 1, 0.1568628, 0, 1,
-1.844616, -1.179729, -1.992843, 1, 0.1607843, 0, 1,
-1.809167, 2.337723, -0.5516099, 1, 0.1686275, 0, 1,
-1.733508, -1.019615, -2.452403, 1, 0.172549, 0, 1,
-1.732478, -0.2431687, -2.877997, 1, 0.1803922, 0, 1,
-1.724562, -0.8708023, -2.42839, 1, 0.1843137, 0, 1,
-1.723624, 0.1348627, -0.4667841, 1, 0.1921569, 0, 1,
-1.693793, 0.3528757, -1.038584, 1, 0.1960784, 0, 1,
-1.685669, -1.959301, -1.349251, 1, 0.2039216, 0, 1,
-1.680516, -0.0698536, -3.072404, 1, 0.2117647, 0, 1,
-1.677016, 1.122039, -0.3800753, 1, 0.2156863, 0, 1,
-1.675663, 0.4618375, -2.247131, 1, 0.2235294, 0, 1,
-1.671914, 1.681385, -0.005458298, 1, 0.227451, 0, 1,
-1.635729, 1.998333, -1.754081, 1, 0.2352941, 0, 1,
-1.609282, 0.4734187, -1.616566, 1, 0.2392157, 0, 1,
-1.603756, 1.235564, -0.6259335, 1, 0.2470588, 0, 1,
-1.592685, 0.5140667, -0.6239675, 1, 0.2509804, 0, 1,
-1.564384, -0.6915812, -2.798625, 1, 0.2588235, 0, 1,
-1.547692, -1.611863, -3.182032, 1, 0.2627451, 0, 1,
-1.539274, -0.04330715, -0.7706151, 1, 0.2705882, 0, 1,
-1.538418, 0.6793609, -1.538428, 1, 0.2745098, 0, 1,
-1.519391, 0.3671401, 1.140003, 1, 0.282353, 0, 1,
-1.506687, -0.9845986, -2.705389, 1, 0.2862745, 0, 1,
-1.501869, -1.781654, -1.835385, 1, 0.2941177, 0, 1,
-1.495614, 0.2049333, -2.856473, 1, 0.3019608, 0, 1,
-1.49479, -0.9532418, -1.643613, 1, 0.3058824, 0, 1,
-1.493111, -0.7159534, -0.9175777, 1, 0.3137255, 0, 1,
-1.491869, -0.2652465, -0.4964084, 1, 0.3176471, 0, 1,
-1.483373, -0.2565294, -1.787507, 1, 0.3254902, 0, 1,
-1.475959, 0.169698, -0.336223, 1, 0.3294118, 0, 1,
-1.469293, 0.2079151, -0.5758145, 1, 0.3372549, 0, 1,
-1.460858, 0.941087, 0.03421314, 1, 0.3411765, 0, 1,
-1.449476, 0.9611529, -0.9154249, 1, 0.3490196, 0, 1,
-1.440239, 0.2539996, -1.530452, 1, 0.3529412, 0, 1,
-1.410119, 0.3199825, -1.591383, 1, 0.3607843, 0, 1,
-1.409681, -0.4567085, -2.188559, 1, 0.3647059, 0, 1,
-1.401005, -0.1690953, -1.356773, 1, 0.372549, 0, 1,
-1.395066, -1.10955, -3.060146, 1, 0.3764706, 0, 1,
-1.394823, 0.6392674, -0.9831259, 1, 0.3843137, 0, 1,
-1.386979, -0.5660195, -2.095771, 1, 0.3882353, 0, 1,
-1.380385, -0.06388653, -1.810095, 1, 0.3960784, 0, 1,
-1.377247, -0.6710547, -1.76435, 1, 0.4039216, 0, 1,
-1.366529, -0.2268223, -1.174368, 1, 0.4078431, 0, 1,
-1.358862, -0.3631545, -2.027582, 1, 0.4156863, 0, 1,
-1.353302, 0.3043184, -2.339113, 1, 0.4196078, 0, 1,
-1.345713, 0.2612689, -0.5010923, 1, 0.427451, 0, 1,
-1.343904, 0.5309951, -0.2128334, 1, 0.4313726, 0, 1,
-1.339136, -1.478698, -2.18796, 1, 0.4392157, 0, 1,
-1.330326, 0.7785384, -0.6474066, 1, 0.4431373, 0, 1,
-1.328926, 0.6985161, -1.260265, 1, 0.4509804, 0, 1,
-1.327506, -0.5461505, -1.296137, 1, 0.454902, 0, 1,
-1.324596, -1.474866, -3.137151, 1, 0.4627451, 0, 1,
-1.323031, 1.277061, -1.535715, 1, 0.4666667, 0, 1,
-1.313879, 0.7603825, -0.879523, 1, 0.4745098, 0, 1,
-1.305077, -0.4504314, -0.4865746, 1, 0.4784314, 0, 1,
-1.304312, -0.4731709, -2.475875, 1, 0.4862745, 0, 1,
-1.304047, 0.6120078, -1.966599, 1, 0.4901961, 0, 1,
-1.303033, -1.828959, -2.793711, 1, 0.4980392, 0, 1,
-1.300867, -0.855281, -3.396322, 1, 0.5058824, 0, 1,
-1.300677, -0.3601505, -2.124804, 1, 0.509804, 0, 1,
-1.286961, 0.2053192, -1.245914, 1, 0.5176471, 0, 1,
-1.281805, 0.2828302, -2.147825, 1, 0.5215687, 0, 1,
-1.27757, 1.462003, -0.5310311, 1, 0.5294118, 0, 1,
-1.277064, 0.05740843, -2.32822, 1, 0.5333334, 0, 1,
-1.275064, 0.1102854, -0.1628984, 1, 0.5411765, 0, 1,
-1.260788, 0.1137618, -1.59406, 1, 0.5450981, 0, 1,
-1.258662, -1.791279, -1.185974, 1, 0.5529412, 0, 1,
-1.244382, 1.72316, -1.229155, 1, 0.5568628, 0, 1,
-1.243501, -1.061885, -1.318373, 1, 0.5647059, 0, 1,
-1.240865, -1.787729, -2.447588, 1, 0.5686275, 0, 1,
-1.237738, -0.8173415, -1.430354, 1, 0.5764706, 0, 1,
-1.219984, 0.7146072, -0.2904744, 1, 0.5803922, 0, 1,
-1.215446, 1.147611, 0.05134998, 1, 0.5882353, 0, 1,
-1.212623, -1.065832, -3.054887, 1, 0.5921569, 0, 1,
-1.211332, 2.351654, -0.4757926, 1, 0.6, 0, 1,
-1.209832, -0.9004676, -1.943794, 1, 0.6078432, 0, 1,
-1.205642, 3.165182, 0.5473536, 1, 0.6117647, 0, 1,
-1.201034, -0.8384558, -1.55766, 1, 0.6196079, 0, 1,
-1.196777, 0.3660532, -2.692987, 1, 0.6235294, 0, 1,
-1.195446, 0.02492049, -1.316365, 1, 0.6313726, 0, 1,
-1.192679, 1.703414, -0.3878461, 1, 0.6352941, 0, 1,
-1.171537, -1.971677, -2.870719, 1, 0.6431373, 0, 1,
-1.170007, 1.075384, -1.323274, 1, 0.6470588, 0, 1,
-1.164046, -0.3020406, -2.120242, 1, 0.654902, 0, 1,
-1.162685, 0.1576652, -1.821786, 1, 0.6588235, 0, 1,
-1.149571, -1.056517, -1.558944, 1, 0.6666667, 0, 1,
-1.14537, -1.093736, -3.69333, 1, 0.6705883, 0, 1,
-1.14439, -1.009921, -1.913544, 1, 0.6784314, 0, 1,
-1.137037, 0.7703974, -0.2240361, 1, 0.682353, 0, 1,
-1.128117, -0.1216501, -1.449792, 1, 0.6901961, 0, 1,
-1.12729, 0.09061848, -1.733416, 1, 0.6941177, 0, 1,
-1.126941, 2.257939, -0.40252, 1, 0.7019608, 0, 1,
-1.124431, -3.273834, -3.010453, 1, 0.7098039, 0, 1,
-1.121174, 2.230533, 0.6604034, 1, 0.7137255, 0, 1,
-1.119719, 0.3714312, -1.652176, 1, 0.7215686, 0, 1,
-1.098156, -0.7477487, -2.370863, 1, 0.7254902, 0, 1,
-1.095868, -0.6609432, -1.680914, 1, 0.7333333, 0, 1,
-1.095156, 0.5889143, -1.003262, 1, 0.7372549, 0, 1,
-1.090318, -0.03565585, -2.071481, 1, 0.7450981, 0, 1,
-1.082865, 0.922303, -0.6394888, 1, 0.7490196, 0, 1,
-1.081988, -0.5028277, -3.088021, 1, 0.7568628, 0, 1,
-1.081613, 0.5566371, -0.9696626, 1, 0.7607843, 0, 1,
-1.081515, -0.648743, -2.282127, 1, 0.7686275, 0, 1,
-1.077954, 1.673808, -1.191949, 1, 0.772549, 0, 1,
-1.076482, 1.540271, -1.636368, 1, 0.7803922, 0, 1,
-1.075196, 0.09437346, -2.618311, 1, 0.7843137, 0, 1,
-1.067127, -3.06144, -1.378527, 1, 0.7921569, 0, 1,
-1.063341, -0.9297013, -1.810862, 1, 0.7960784, 0, 1,
-1.05696, -0.4070158, -1.967672, 1, 0.8039216, 0, 1,
-1.046098, 0.1524086, -2.183846, 1, 0.8117647, 0, 1,
-1.04489, -1.456036, -2.626179, 1, 0.8156863, 0, 1,
-1.041052, 0.4342469, -0.734022, 1, 0.8235294, 0, 1,
-1.035182, 0.03542736, -0.8765349, 1, 0.827451, 0, 1,
-1.027873, -0.903478, -1.481193, 1, 0.8352941, 0, 1,
-1.026492, -1.038244, -2.228235, 1, 0.8392157, 0, 1,
-1.024018, 0.1871506, -0.9617943, 1, 0.8470588, 0, 1,
-1.017793, -1.145986, -2.217984, 1, 0.8509804, 0, 1,
-1.016207, -0.8806963, -3.247715, 1, 0.8588235, 0, 1,
-1.008561, 0.8715547, 0.9973279, 1, 0.8627451, 0, 1,
-1.003635, -0.4454358, -1.81361, 1, 0.8705882, 0, 1,
-1.001337, -1.876253, -3.772674, 1, 0.8745098, 0, 1,
-0.9933012, 0.08867899, -1.01203, 1, 0.8823529, 0, 1,
-0.9833626, -0.357517, -3.070666, 1, 0.8862745, 0, 1,
-0.9712088, -0.2536331, -0.9104877, 1, 0.8941177, 0, 1,
-0.9650205, 0.5151597, -2.372991, 1, 0.8980392, 0, 1,
-0.9511018, -0.2336678, -2.371359, 1, 0.9058824, 0, 1,
-0.9441612, 0.8490123, 0.3516219, 1, 0.9137255, 0, 1,
-0.9434912, 0.4903419, 0.2333003, 1, 0.9176471, 0, 1,
-0.9409613, 0.3106129, -1.906437, 1, 0.9254902, 0, 1,
-0.9396237, 0.1999841, -2.028454, 1, 0.9294118, 0, 1,
-0.931052, -0.2739151, -2.017143, 1, 0.9372549, 0, 1,
-0.9252254, 1.050368, 2.451282, 1, 0.9411765, 0, 1,
-0.9169927, 0.1300976, -3.007276, 1, 0.9490196, 0, 1,
-0.9166908, 0.1281581, -0.8268478, 1, 0.9529412, 0, 1,
-0.9120845, -1.23492, -2.765172, 1, 0.9607843, 0, 1,
-0.911823, 0.5095106, 0.0932892, 1, 0.9647059, 0, 1,
-0.907642, 0.09516548, 0.2834606, 1, 0.972549, 0, 1,
-0.9065003, 2.582202, -1.12649, 1, 0.9764706, 0, 1,
-0.9058599, -1.402712, -3.643048, 1, 0.9843137, 0, 1,
-0.9040055, 0.415461, -2.985943, 1, 0.9882353, 0, 1,
-0.9021975, -0.2405695, -2.384529, 1, 0.9960784, 0, 1,
-0.9001482, -0.3256277, 0.5834929, 0.9960784, 1, 0, 1,
-0.8867149, 0.2738611, -1.095649, 0.9921569, 1, 0, 1,
-0.8842732, 0.7096742, -2.259395, 0.9843137, 1, 0, 1,
-0.8796889, 0.2651368, -1.299023, 0.9803922, 1, 0, 1,
-0.8769531, 0.3017441, -0.8494467, 0.972549, 1, 0, 1,
-0.8712825, 0.2249149, -1.257195, 0.9686275, 1, 0, 1,
-0.8675762, -0.9497452, -3.511049, 0.9607843, 1, 0, 1,
-0.8563104, 0.5549047, 0.229768, 0.9568627, 1, 0, 1,
-0.8550804, 0.8638936, -0.77211, 0.9490196, 1, 0, 1,
-0.8499125, 1.82468, -1.342224, 0.945098, 1, 0, 1,
-0.8493826, -0.9908824, -3.632789, 0.9372549, 1, 0, 1,
-0.8467786, 0.001667881, -1.758769, 0.9333333, 1, 0, 1,
-0.8460853, 0.9713586, 0.105331, 0.9254902, 1, 0, 1,
-0.8447438, -1.846045, -2.270696, 0.9215686, 1, 0, 1,
-0.8413018, -1.25941, -0.12038, 0.9137255, 1, 0, 1,
-0.8392409, -1.1128, -2.236154, 0.9098039, 1, 0, 1,
-0.8317823, 0.8341978, -0.6491137, 0.9019608, 1, 0, 1,
-0.831102, 0.6888819, 0.5980356, 0.8941177, 1, 0, 1,
-0.8288001, 1.649289, -3.096134, 0.8901961, 1, 0, 1,
-0.8201963, 1.282219, 0.4152764, 0.8823529, 1, 0, 1,
-0.8191215, 0.4288169, -0.2903568, 0.8784314, 1, 0, 1,
-0.8147095, 0.2085751, -1.782026, 0.8705882, 1, 0, 1,
-0.8092921, -1.366295, -4.723198, 0.8666667, 1, 0, 1,
-0.8065016, 2.341203, -1.884669, 0.8588235, 1, 0, 1,
-0.8043117, 0.2589808, -1.742837, 0.854902, 1, 0, 1,
-0.8027641, 0.4705122, -0.8035904, 0.8470588, 1, 0, 1,
-0.7884181, -0.2494911, -2.894569, 0.8431373, 1, 0, 1,
-0.7864064, -0.2724571, -0.3197519, 0.8352941, 1, 0, 1,
-0.7838851, 2.225502, 0.3666893, 0.8313726, 1, 0, 1,
-0.7818983, -0.1427499, -1.67286, 0.8235294, 1, 0, 1,
-0.7798663, -0.9750371, -2.895207, 0.8196079, 1, 0, 1,
-0.7787918, -0.01259994, -0.6273987, 0.8117647, 1, 0, 1,
-0.7787396, -1.872945, -5.080289, 0.8078431, 1, 0, 1,
-0.7779531, 0.4054531, 1.233484, 0.8, 1, 0, 1,
-0.7776971, 1.110991, 0.6085297, 0.7921569, 1, 0, 1,
-0.7724296, -0.3234315, -2.095939, 0.7882353, 1, 0, 1,
-0.7686943, -0.5235566, -2.067782, 0.7803922, 1, 0, 1,
-0.7668501, 0.4512097, -3.438167, 0.7764706, 1, 0, 1,
-0.7637615, 0.4336186, 0.05857915, 0.7686275, 1, 0, 1,
-0.7635201, 0.6897783, -0.1916073, 0.7647059, 1, 0, 1,
-0.7628618, 1.403514, 0.3974001, 0.7568628, 1, 0, 1,
-0.7625237, 0.9609262, -1.264463, 0.7529412, 1, 0, 1,
-0.7526689, -0.1404006, -1.366316, 0.7450981, 1, 0, 1,
-0.7391836, -0.05206226, -2.568669, 0.7411765, 1, 0, 1,
-0.7387893, 0.1861689, -0.829161, 0.7333333, 1, 0, 1,
-0.735313, 0.1450493, -1.340387, 0.7294118, 1, 0, 1,
-0.7349603, -0.08183538, -1.446037, 0.7215686, 1, 0, 1,
-0.7330997, -0.1336198, -1.818099, 0.7176471, 1, 0, 1,
-0.7284058, 0.6572914, -2.128417, 0.7098039, 1, 0, 1,
-0.7260681, -0.9054173, -2.783456, 0.7058824, 1, 0, 1,
-0.723967, -0.4334275, -3.019606, 0.6980392, 1, 0, 1,
-0.7228634, 0.1549802, -1.586467, 0.6901961, 1, 0, 1,
-0.7228043, 0.1915294, 0.2220426, 0.6862745, 1, 0, 1,
-0.7210609, -0.2648727, -1.592972, 0.6784314, 1, 0, 1,
-0.7202964, 0.2423386, -1.443812, 0.6745098, 1, 0, 1,
-0.7112492, 1.149251, -2.040807, 0.6666667, 1, 0, 1,
-0.7100716, 1.534093, -0.2888384, 0.6627451, 1, 0, 1,
-0.7032976, 1.804013, -1.150992, 0.654902, 1, 0, 1,
-0.7013865, 0.4067312, -2.24495, 0.6509804, 1, 0, 1,
-0.6968139, -1.698258, -1.593681, 0.6431373, 1, 0, 1,
-0.6942181, -1.24284, -4.793622, 0.6392157, 1, 0, 1,
-0.6939095, 0.620892, 0.6112337, 0.6313726, 1, 0, 1,
-0.6898516, 0.4077884, -1.379721, 0.627451, 1, 0, 1,
-0.6857342, 0.4593812, 0.05859065, 0.6196079, 1, 0, 1,
-0.685507, -0.9524008, -2.865774, 0.6156863, 1, 0, 1,
-0.6836878, 0.6250556, -1.193521, 0.6078432, 1, 0, 1,
-0.6806363, -0.539113, -1.59677, 0.6039216, 1, 0, 1,
-0.6725467, 0.3282473, -1.469522, 0.5960785, 1, 0, 1,
-0.6722753, 0.06254599, -2.119, 0.5882353, 1, 0, 1,
-0.6687224, -0.03041493, -0.04245263, 0.5843138, 1, 0, 1,
-0.6669436, 2.245082, -0.06677471, 0.5764706, 1, 0, 1,
-0.6635738, 1.625231, -0.3845278, 0.572549, 1, 0, 1,
-0.6599751, -1.088231, -4.778722, 0.5647059, 1, 0, 1,
-0.6578394, -0.1034704, -0.736204, 0.5607843, 1, 0, 1,
-0.6487548, 0.7018831, -1.210825, 0.5529412, 1, 0, 1,
-0.6472899, -1.728404, -2.716681, 0.5490196, 1, 0, 1,
-0.6470722, 2.145735, -0.729087, 0.5411765, 1, 0, 1,
-0.6439621, -0.4032741, -1.794089, 0.5372549, 1, 0, 1,
-0.6372892, 0.6887498, -1.049896, 0.5294118, 1, 0, 1,
-0.6364074, -0.5415108, -2.873448, 0.5254902, 1, 0, 1,
-0.6357168, 0.3753072, -1.836127, 0.5176471, 1, 0, 1,
-0.6356987, -1.759791, -3.705531, 0.5137255, 1, 0, 1,
-0.6350795, -0.6428707, -2.148085, 0.5058824, 1, 0, 1,
-0.6202011, -0.6829255, -3.704344, 0.5019608, 1, 0, 1,
-0.6108634, -0.4423988, -3.262927, 0.4941176, 1, 0, 1,
-0.6092786, 1.243039, 0.6167135, 0.4862745, 1, 0, 1,
-0.6061282, -2.152386, -4.225585, 0.4823529, 1, 0, 1,
-0.6042628, -0.2691273, -0.9321833, 0.4745098, 1, 0, 1,
-0.6036338, -0.3728071, -1.997391, 0.4705882, 1, 0, 1,
-0.6002917, -0.3858098, -2.462037, 0.4627451, 1, 0, 1,
-0.593676, 0.5485534, 1.666041, 0.4588235, 1, 0, 1,
-0.5901737, -0.08678295, -2.140128, 0.4509804, 1, 0, 1,
-0.5896751, 1.143073, -0.5333563, 0.4470588, 1, 0, 1,
-0.5847481, 1.265588, 0.1559669, 0.4392157, 1, 0, 1,
-0.5842697, -0.1552247, -0.3735781, 0.4352941, 1, 0, 1,
-0.5819948, 0.6621377, 1.469967, 0.427451, 1, 0, 1,
-0.5803133, 0.5994147, -2.110594, 0.4235294, 1, 0, 1,
-0.5799606, 0.9980592, 0.2378131, 0.4156863, 1, 0, 1,
-0.5791411, 0.2849198, -1.365426, 0.4117647, 1, 0, 1,
-0.5752658, 1.188082, -2.037834, 0.4039216, 1, 0, 1,
-0.5724308, 1.76366, -0.8355445, 0.3960784, 1, 0, 1,
-0.5714151, 0.6985148, -0.4648723, 0.3921569, 1, 0, 1,
-0.5681254, -0.6592817, -2.942655, 0.3843137, 1, 0, 1,
-0.5648001, -0.8083343, -0.2796974, 0.3803922, 1, 0, 1,
-0.5603105, 0.5059124, -1.275546, 0.372549, 1, 0, 1,
-0.557009, 0.1650157, -0.6267434, 0.3686275, 1, 0, 1,
-0.5492443, 0.5383335, -0.7332827, 0.3607843, 1, 0, 1,
-0.5487648, 0.6810974, -0.7409667, 0.3568628, 1, 0, 1,
-0.5485677, -0.6091098, -2.597567, 0.3490196, 1, 0, 1,
-0.538659, -0.5816055, -2.562475, 0.345098, 1, 0, 1,
-0.5377828, 0.8276643, 1.111978, 0.3372549, 1, 0, 1,
-0.5367351, -0.006990013, -1.329019, 0.3333333, 1, 0, 1,
-0.5362253, -0.3911891, -3.155577, 0.3254902, 1, 0, 1,
-0.5354178, 2.016477, 0.3335995, 0.3215686, 1, 0, 1,
-0.5353557, 0.4117775, -1.141068, 0.3137255, 1, 0, 1,
-0.5348567, 1.712029, -0.03585866, 0.3098039, 1, 0, 1,
-0.5296601, -0.691277, -1.125202, 0.3019608, 1, 0, 1,
-0.5293775, -1.593123, -3.508646, 0.2941177, 1, 0, 1,
-0.5227564, 0.7662368, 0.1148188, 0.2901961, 1, 0, 1,
-0.5210316, 0.347059, 1.186679, 0.282353, 1, 0, 1,
-0.5204709, -0.3169031, -1.104995, 0.2784314, 1, 0, 1,
-0.518958, 0.200331, 0.333643, 0.2705882, 1, 0, 1,
-0.5161244, -0.1409393, -1.709175, 0.2666667, 1, 0, 1,
-0.5141627, 0.4456354, -0.1419541, 0.2588235, 1, 0, 1,
-0.5099048, -0.9520575, -2.921273, 0.254902, 1, 0, 1,
-0.502196, 0.5492696, -1.158185, 0.2470588, 1, 0, 1,
-0.4978313, 1.000356, -0.4374794, 0.2431373, 1, 0, 1,
-0.4929985, -0.1307737, -1.411963, 0.2352941, 1, 0, 1,
-0.4894496, -0.1731602, -1.769936, 0.2313726, 1, 0, 1,
-0.4867152, -0.2267123, -0.4169709, 0.2235294, 1, 0, 1,
-0.4857337, -0.7261222, -2.28351, 0.2196078, 1, 0, 1,
-0.4845094, -0.4549006, -2.695293, 0.2117647, 1, 0, 1,
-0.4842976, 0.5206707, 0.6409882, 0.2078431, 1, 0, 1,
-0.4836496, -0.7347667, -1.856418, 0.2, 1, 0, 1,
-0.4823931, 0.3760926, -0.4266541, 0.1921569, 1, 0, 1,
-0.4799421, -1.423627, -1.203175, 0.1882353, 1, 0, 1,
-0.4782674, 0.4347057, 0.251451, 0.1803922, 1, 0, 1,
-0.4687097, 1.293167, 0.6265326, 0.1764706, 1, 0, 1,
-0.4670289, -0.8697518, -1.538855, 0.1686275, 1, 0, 1,
-0.4668706, -0.09979867, -3.156824, 0.1647059, 1, 0, 1,
-0.4666474, 1.109302, -1.971729, 0.1568628, 1, 0, 1,
-0.4651512, -0.4664561, -2.454337, 0.1529412, 1, 0, 1,
-0.4624424, 0.2223273, 0.2402381, 0.145098, 1, 0, 1,
-0.4610226, 0.3001121, -3.14459, 0.1411765, 1, 0, 1,
-0.4597766, 1.31893, -1.34362, 0.1333333, 1, 0, 1,
-0.4577492, 2.345823, 0.3116312, 0.1294118, 1, 0, 1,
-0.4533027, -0.6921066, -3.070105, 0.1215686, 1, 0, 1,
-0.4525817, -0.1078237, -1.957036, 0.1176471, 1, 0, 1,
-0.4521826, 0.3370783, -1.735771, 0.1098039, 1, 0, 1,
-0.4476835, 0.2698022, -0.6842828, 0.1058824, 1, 0, 1,
-0.44537, -0.7400265, -4.15304, 0.09803922, 1, 0, 1,
-0.4400047, -2.342321, -3.507573, 0.09019608, 1, 0, 1,
-0.4388584, 0.3054633, -1.446843, 0.08627451, 1, 0, 1,
-0.4382271, -1.277829, -2.766359, 0.07843138, 1, 0, 1,
-0.4378185, 1.373547, 1.062861, 0.07450981, 1, 0, 1,
-0.4367163, 0.2809622, -0.2706764, 0.06666667, 1, 0, 1,
-0.4290582, 0.8786597, -0.960229, 0.0627451, 1, 0, 1,
-0.4256768, 1.557551, 1.011132, 0.05490196, 1, 0, 1,
-0.4230898, -0.7188705, -0.9858912, 0.05098039, 1, 0, 1,
-0.421501, 0.03586785, -0.8941392, 0.04313726, 1, 0, 1,
-0.4180095, 1.221402, -0.4518306, 0.03921569, 1, 0, 1,
-0.4110178, 0.9832906, -1.10935, 0.03137255, 1, 0, 1,
-0.4089868, -0.5373263, -0.8373237, 0.02745098, 1, 0, 1,
-0.4087707, 1.145301, -0.04750681, 0.01960784, 1, 0, 1,
-0.4075159, -1.184044, -0.7003084, 0.01568628, 1, 0, 1,
-0.404263, 1.129893, -0.1205974, 0.007843138, 1, 0, 1,
-0.4014412, -0.9780571, -3.249111, 0.003921569, 1, 0, 1,
-0.3983855, -2.160986, -3.453577, 0, 1, 0.003921569, 1,
-0.3963357, -0.3076499, -2.192045, 0, 1, 0.01176471, 1,
-0.389787, -0.1533747, -0.8289002, 0, 1, 0.01568628, 1,
-0.3882139, -1.326389, -2.82751, 0, 1, 0.02352941, 1,
-0.3873141, 0.5351798, -1.461241, 0, 1, 0.02745098, 1,
-0.386676, -0.6914775, -3.178287, 0, 1, 0.03529412, 1,
-0.3809368, 1.301476, -0.09314936, 0, 1, 0.03921569, 1,
-0.3771474, -1.544495, -2.862355, 0, 1, 0.04705882, 1,
-0.3752975, -1.547154, -1.676147, 0, 1, 0.05098039, 1,
-0.3734537, 0.3727778, -2.040615, 0, 1, 0.05882353, 1,
-0.3688344, -1.196029, -1.971906, 0, 1, 0.0627451, 1,
-0.3652591, 1.877058, 0.6686505, 0, 1, 0.07058824, 1,
-0.3620361, 0.9319789, -0.4886678, 0, 1, 0.07450981, 1,
-0.357962, -0.1509031, 0.3031661, 0, 1, 0.08235294, 1,
-0.3576185, 1.825253, -1.623932, 0, 1, 0.08627451, 1,
-0.354593, 0.9925786, -0.6672583, 0, 1, 0.09411765, 1,
-0.35436, 0.9100636, -0.1515909, 0, 1, 0.1019608, 1,
-0.3537213, -0.8838114, -4.487175, 0, 1, 0.1058824, 1,
-0.3505723, -1.302348, -3.049559, 0, 1, 0.1137255, 1,
-0.3501577, -0.5379366, -2.124691, 0, 1, 0.1176471, 1,
-0.347753, -0.3292441, -2.604516, 0, 1, 0.1254902, 1,
-0.340758, 0.1380954, -1.132729, 0, 1, 0.1294118, 1,
-0.3407169, -2.224165, -4.014931, 0, 1, 0.1372549, 1,
-0.3393919, -0.06625342, -2.94076, 0, 1, 0.1411765, 1,
-0.3358141, 0.3122372, -1.324887, 0, 1, 0.1490196, 1,
-0.3327313, 0.7972064, 0.6076878, 0, 1, 0.1529412, 1,
-0.3320636, 0.9608806, -1.12595, 0, 1, 0.1607843, 1,
-0.3318154, -0.9228187, -2.384042, 0, 1, 0.1647059, 1,
-0.325966, 1.268192, -0.1862056, 0, 1, 0.172549, 1,
-0.3250238, -0.6757627, -4.105726, 0, 1, 0.1764706, 1,
-0.3230343, 0.3627438, 0.3282157, 0, 1, 0.1843137, 1,
-0.3194255, 1.273391, -1.862404, 0, 1, 0.1882353, 1,
-0.3180734, -0.04850269, -1.173964, 0, 1, 0.1960784, 1,
-0.3176028, -0.32138, -2.133906, 0, 1, 0.2039216, 1,
-0.3125401, 0.7781886, -0.0792277, 0, 1, 0.2078431, 1,
-0.3098051, 0.7322825, -0.06914721, 0, 1, 0.2156863, 1,
-0.3093755, 0.9396964, -1.018902, 0, 1, 0.2196078, 1,
-0.3063968, -0.6049564, -3.986702, 0, 1, 0.227451, 1,
-0.3023767, 0.4708353, -0.6931038, 0, 1, 0.2313726, 1,
-0.2984577, 0.9587967, 0.112859, 0, 1, 0.2392157, 1,
-0.2922774, 0.2595271, -1.968395, 0, 1, 0.2431373, 1,
-0.2920741, -0.3387389, -3.163191, 0, 1, 0.2509804, 1,
-0.2885643, 0.177924, 0.3776678, 0, 1, 0.254902, 1,
-0.2879799, -0.9271134, -1.388707, 0, 1, 0.2627451, 1,
-0.2879602, -1.924862, -2.76882, 0, 1, 0.2666667, 1,
-0.2867598, -0.7037988, -2.141375, 0, 1, 0.2745098, 1,
-0.2857921, 2.033303, 0.4808422, 0, 1, 0.2784314, 1,
-0.2852285, 2.250587, -1.93277, 0, 1, 0.2862745, 1,
-0.2834023, 0.2240002, -0.452588, 0, 1, 0.2901961, 1,
-0.2823892, -0.466711, -0.9025024, 0, 1, 0.2980392, 1,
-0.2823668, 0.6590013, -0.3985063, 0, 1, 0.3058824, 1,
-0.2738481, 0.2513438, -0.982581, 0, 1, 0.3098039, 1,
-0.2714649, -0.510479, -2.980824, 0, 1, 0.3176471, 1,
-0.2684674, -1.839571, -0.2662064, 0, 1, 0.3215686, 1,
-0.2670906, 2.029744, 0.5130158, 0, 1, 0.3294118, 1,
-0.2639115, 0.001399577, -1.536579, 0, 1, 0.3333333, 1,
-0.2624111, 0.1974252, -1.305435, 0, 1, 0.3411765, 1,
-0.2620976, 0.5484251, -0.7673259, 0, 1, 0.345098, 1,
-0.261905, 0.3814791, 0.1032416, 0, 1, 0.3529412, 1,
-0.2612424, -0.155774, -2.798324, 0, 1, 0.3568628, 1,
-0.2501193, -0.2150665, -0.8009946, 0, 1, 0.3647059, 1,
-0.2477777, 0.95389, -0.1676655, 0, 1, 0.3686275, 1,
-0.2467246, 0.4596382, -0.09718239, 0, 1, 0.3764706, 1,
-0.2443102, 0.2684891, -0.9665725, 0, 1, 0.3803922, 1,
-0.2426335, -1.049103, -1.812463, 0, 1, 0.3882353, 1,
-0.2285374, 0.4914368, 0.04349427, 0, 1, 0.3921569, 1,
-0.2236235, 0.2743113, -0.7872232, 0, 1, 0.4, 1,
-0.2199424, 1.127861, 0.9807348, 0, 1, 0.4078431, 1,
-0.2192416, 0.2697346, -0.1299144, 0, 1, 0.4117647, 1,
-0.2146639, 0.7191414, -0.315246, 0, 1, 0.4196078, 1,
-0.2111295, -0.1689514, -0.4470818, 0, 1, 0.4235294, 1,
-0.2042798, -0.06112533, -2.677101, 0, 1, 0.4313726, 1,
-0.2039691, 1.730829, -1.14676, 0, 1, 0.4352941, 1,
-0.2027414, -0.9560834, -1.45396, 0, 1, 0.4431373, 1,
-0.2019014, -0.1220118, -0.09883641, 0, 1, 0.4470588, 1,
-0.2015015, -0.1525124, -2.943073, 0, 1, 0.454902, 1,
-0.199752, 0.3620783, 1.214748, 0, 1, 0.4588235, 1,
-0.1947671, -0.1891712, -2.043645, 0, 1, 0.4666667, 1,
-0.1942061, 0.5304398, -1.497681, 0, 1, 0.4705882, 1,
-0.1920496, -2.200619, -4.996689, 0, 1, 0.4784314, 1,
-0.1896446, 0.8069927, -2.358231, 0, 1, 0.4823529, 1,
-0.1896316, -0.8599433, -2.384959, 0, 1, 0.4901961, 1,
-0.1879184, 0.356492, 0.1106834, 0, 1, 0.4941176, 1,
-0.1844698, -1.358012, -2.394893, 0, 1, 0.5019608, 1,
-0.1810681, -0.09071189, -3.090347, 0, 1, 0.509804, 1,
-0.1762895, -0.9855922, -3.187779, 0, 1, 0.5137255, 1,
-0.1724, -1.303855, -4.951038, 0, 1, 0.5215687, 1,
-0.1690571, 1.118913, 1.77942, 0, 1, 0.5254902, 1,
-0.1687417, 0.7222801, -0.06398875, 0, 1, 0.5333334, 1,
-0.1672364, 0.5183875, -3.565141, 0, 1, 0.5372549, 1,
-0.1670119, -0.3856267, -2.962473, 0, 1, 0.5450981, 1,
-0.1661999, 0.07355922, 0.3227825, 0, 1, 0.5490196, 1,
-0.1645674, 0.4829595, 1.706918, 0, 1, 0.5568628, 1,
-0.1644349, 0.9044031, 0.3801421, 0, 1, 0.5607843, 1,
-0.1611113, -1.776954, -2.598038, 0, 1, 0.5686275, 1,
-0.15843, -0.8308551, -3.128477, 0, 1, 0.572549, 1,
-0.1533926, -1.892417, -2.191496, 0, 1, 0.5803922, 1,
-0.1533395, 1.031852, 0.2152604, 0, 1, 0.5843138, 1,
-0.1522291, 1.022588, -0.5279506, 0, 1, 0.5921569, 1,
-0.1507979, -0.03800113, -1.649076, 0, 1, 0.5960785, 1,
-0.1507226, 0.6522942, -2.157557, 0, 1, 0.6039216, 1,
-0.1428376, -0.1480774, -1.084478, 0, 1, 0.6117647, 1,
-0.1416392, -1.547668, -1.617454, 0, 1, 0.6156863, 1,
-0.1266259, 1.351541, -0.5475401, 0, 1, 0.6235294, 1,
-0.1246424, -0.7804344, -1.755784, 0, 1, 0.627451, 1,
-0.1236134, 0.1595044, -1.766889, 0, 1, 0.6352941, 1,
-0.1190778, 0.4199564, -0.6762823, 0, 1, 0.6392157, 1,
-0.113196, 1.897651, -1.036261, 0, 1, 0.6470588, 1,
-0.1080112, 1.721518, 0.5610967, 0, 1, 0.6509804, 1,
-0.107363, 1.419295, -0.1525324, 0, 1, 0.6588235, 1,
-0.1063146, -1.110332, -2.414177, 0, 1, 0.6627451, 1,
-0.1041543, -2.240431, -4.602016, 0, 1, 0.6705883, 1,
-0.1019535, 0.9138584, -0.2341177, 0, 1, 0.6745098, 1,
-0.09775679, -2.178987, -2.26599, 0, 1, 0.682353, 1,
-0.09061538, -0.3664507, -1.96007, 0, 1, 0.6862745, 1,
-0.0898504, -0.6309341, -4.91703, 0, 1, 0.6941177, 1,
-0.08801504, -0.6367939, -2.176627, 0, 1, 0.7019608, 1,
-0.08692412, -0.3689123, -3.078881, 0, 1, 0.7058824, 1,
-0.08620591, 0.16702, 0.2483821, 0, 1, 0.7137255, 1,
-0.08604912, 0.2871206, -0.8991501, 0, 1, 0.7176471, 1,
-0.08509903, -1.740042, -2.721249, 0, 1, 0.7254902, 1,
-0.0848714, -1.548714, -0.9761096, 0, 1, 0.7294118, 1,
-0.08381684, 0.5154189, 0.5566635, 0, 1, 0.7372549, 1,
-0.08343601, 0.3637668, 0.626605, 0, 1, 0.7411765, 1,
-0.08126345, -1.43159, -2.122472, 0, 1, 0.7490196, 1,
-0.07776523, -0.9915696, -2.660645, 0, 1, 0.7529412, 1,
-0.07703823, 1.123865, -0.1428193, 0, 1, 0.7607843, 1,
-0.07585763, -0.2699707, -2.495075, 0, 1, 0.7647059, 1,
-0.0741694, 0.8382051, -0.457533, 0, 1, 0.772549, 1,
-0.07266936, -0.7192298, -3.045447, 0, 1, 0.7764706, 1,
-0.07063902, 1.161517, 1.334254, 0, 1, 0.7843137, 1,
-0.05956388, -0.05826138, -3.575252, 0, 1, 0.7882353, 1,
-0.05620424, 0.6216327, -0.4023858, 0, 1, 0.7960784, 1,
-0.05394838, -0.282957, -2.035505, 0, 1, 0.8039216, 1,
-0.05226805, 1.289737, -0.06320468, 0, 1, 0.8078431, 1,
-0.04973726, -0.5041285, -3.561754, 0, 1, 0.8156863, 1,
-0.04970025, -0.5774534, -1.941317, 0, 1, 0.8196079, 1,
-0.04936223, -0.5269991, -3.717328, 0, 1, 0.827451, 1,
-0.04841342, -1.173386, -4.198115, 0, 1, 0.8313726, 1,
-0.04737541, 1.338025, 0.7461451, 0, 1, 0.8392157, 1,
-0.04623409, 0.8222944, -1.049555, 0, 1, 0.8431373, 1,
-0.04476091, 1.243351, -0.9520936, 0, 1, 0.8509804, 1,
-0.04369262, -1.88164, -2.634444, 0, 1, 0.854902, 1,
-0.04301677, 0.4662044, 0.8272017, 0, 1, 0.8627451, 1,
-0.04114061, 0.5204818, -0.02692686, 0, 1, 0.8666667, 1,
-0.03972575, -0.6734213, -5.068168, 0, 1, 0.8745098, 1,
-0.03625381, 1.026741, 0.5020006, 0, 1, 0.8784314, 1,
-0.03582371, -0.3351192, -5.446216, 0, 1, 0.8862745, 1,
-0.03431547, 1.501367, 1.147479, 0, 1, 0.8901961, 1,
-0.02995316, -0.6275733, -3.423845, 0, 1, 0.8980392, 1,
-0.02962108, 1.703667, -0.5181718, 0, 1, 0.9058824, 1,
-0.02688834, 1.073728, -0.4265717, 0, 1, 0.9098039, 1,
-0.02572667, 1.096565, 1.786836, 0, 1, 0.9176471, 1,
-0.02431845, 0.1384623, 0.8681325, 0, 1, 0.9215686, 1,
-0.0232969, 0.01192508, -1.55582, 0, 1, 0.9294118, 1,
-0.02258572, 0.3544149, 1.592982, 0, 1, 0.9333333, 1,
-0.00511064, 0.909989, 0.9320745, 0, 1, 0.9411765, 1,
-0.003112928, -0.5398744, -2.900089, 0, 1, 0.945098, 1,
-0.002265467, 0.8140225, -1.020663, 0, 1, 0.9529412, 1,
-0.002074967, 2.121821, -0.5963662, 0, 1, 0.9568627, 1,
0.001546679, -0.4908139, 4.692749, 0, 1, 0.9647059, 1,
0.005130121, -0.376775, 3.590919, 0, 1, 0.9686275, 1,
0.007301948, 0.04351003, 0.09044082, 0, 1, 0.9764706, 1,
0.01298906, 0.8724077, 0.05531124, 0, 1, 0.9803922, 1,
0.01413136, -1.868363, 2.612061, 0, 1, 0.9882353, 1,
0.01892788, -0.2833496, 3.44863, 0, 1, 0.9921569, 1,
0.02053687, -0.8964419, 2.396737, 0, 1, 1, 1,
0.02380265, 0.06056076, 0.6268793, 0, 0.9921569, 1, 1,
0.02727376, -0.5973033, 1.764892, 0, 0.9882353, 1, 1,
0.02926352, 0.960017, 1.749209, 0, 0.9803922, 1, 1,
0.03032531, 1.40841, 0.4430551, 0, 0.9764706, 1, 1,
0.0320872, -1.250024, 2.597411, 0, 0.9686275, 1, 1,
0.03518347, 1.079559, 0.07656612, 0, 0.9647059, 1, 1,
0.03675259, -0.738023, 3.482837, 0, 0.9568627, 1, 1,
0.03933292, -0.5155861, 3.184329, 0, 0.9529412, 1, 1,
0.04039525, 0.8119927, -1.177107, 0, 0.945098, 1, 1,
0.04191923, -0.8152204, 2.399797, 0, 0.9411765, 1, 1,
0.05065266, 0.7788004, -1.193197, 0, 0.9333333, 1, 1,
0.05862071, 1.219963, -0.5275982, 0, 0.9294118, 1, 1,
0.05967426, 1.412027, -0.7868169, 0, 0.9215686, 1, 1,
0.06293663, -0.162772, 3.66949, 0, 0.9176471, 1, 1,
0.06439324, 0.4467908, 0.09460167, 0, 0.9098039, 1, 1,
0.06598078, 0.2208755, -0.3787345, 0, 0.9058824, 1, 1,
0.06680092, -0.01839597, 2.121955, 0, 0.8980392, 1, 1,
0.0691976, 2.404484, 0.5042988, 0, 0.8901961, 1, 1,
0.07025231, -0.9702289, 3.151403, 0, 0.8862745, 1, 1,
0.07219646, -1.36819, 4.371335, 0, 0.8784314, 1, 1,
0.07252215, 1.98887, 1.113016, 0, 0.8745098, 1, 1,
0.07296577, 0.4420975, 2.913078, 0, 0.8666667, 1, 1,
0.08124177, 1.12975, 1.550074, 0, 0.8627451, 1, 1,
0.08260075, -2.091022, 2.639583, 0, 0.854902, 1, 1,
0.08451846, -0.3071295, 4.003723, 0, 0.8509804, 1, 1,
0.08556378, 1.593976, -1.600402, 0, 0.8431373, 1, 1,
0.09078252, -0.03552001, 1.812075, 0, 0.8392157, 1, 1,
0.09743637, 0.2316762, 1.793658, 0, 0.8313726, 1, 1,
0.09844217, -0.4160701, 2.442621, 0, 0.827451, 1, 1,
0.0996136, -0.2042304, 3.658907, 0, 0.8196079, 1, 1,
0.1004986, 0.4640096, -0.1296684, 0, 0.8156863, 1, 1,
0.1041578, 0.02857544, 0.131622, 0, 0.8078431, 1, 1,
0.1052097, -1.014521, 2.535572, 0, 0.8039216, 1, 1,
0.1058658, 1.418801, -0.4442853, 0, 0.7960784, 1, 1,
0.1080143, 0.4793811, 0.6583712, 0, 0.7882353, 1, 1,
0.109086, 0.7606302, -0.3482164, 0, 0.7843137, 1, 1,
0.1111033, -0.8843532, 3.567161, 0, 0.7764706, 1, 1,
0.1142199, 0.04651225, 3.043344, 0, 0.772549, 1, 1,
0.1219161, 1.172563, 0.3214285, 0, 0.7647059, 1, 1,
0.1219612, -0.4898863, 4.656106, 0, 0.7607843, 1, 1,
0.1309088, -1.013558, 2.972078, 0, 0.7529412, 1, 1,
0.1359258, 1.198439, 1.057202, 0, 0.7490196, 1, 1,
0.1387538, 0.2418552, -1.159823, 0, 0.7411765, 1, 1,
0.1402202, 0.06429782, 0.416339, 0, 0.7372549, 1, 1,
0.1515354, -0.2303708, 3.101706, 0, 0.7294118, 1, 1,
0.151962, -0.1620882, 1.276168, 0, 0.7254902, 1, 1,
0.1532825, 0.1616376, 1.969144, 0, 0.7176471, 1, 1,
0.1544332, -0.04435017, 2.831662, 0, 0.7137255, 1, 1,
0.1566049, 0.05768143, 2.146198, 0, 0.7058824, 1, 1,
0.1622841, -0.9380359, 3.603272, 0, 0.6980392, 1, 1,
0.166542, 0.8868101, -0.9328246, 0, 0.6941177, 1, 1,
0.1676535, 0.08478748, 0.3426552, 0, 0.6862745, 1, 1,
0.1693401, -0.5718774, 3.611354, 0, 0.682353, 1, 1,
0.1703899, 0.3198249, 0.1257017, 0, 0.6745098, 1, 1,
0.1713751, 1.631368, 1.992285, 0, 0.6705883, 1, 1,
0.1748324, -0.4609537, 2.584196, 0, 0.6627451, 1, 1,
0.1752035, -2.381757, 3.624365, 0, 0.6588235, 1, 1,
0.1763245, -1.122648, 3.920698, 0, 0.6509804, 1, 1,
0.1770308, -0.2770858, 4.041667, 0, 0.6470588, 1, 1,
0.1772475, 3.024634, 0.1951139, 0, 0.6392157, 1, 1,
0.1773217, 0.6125627, 1.500848, 0, 0.6352941, 1, 1,
0.1835642, 1.555074, 1.443305, 0, 0.627451, 1, 1,
0.1840162, 1.888173, -0.7808745, 0, 0.6235294, 1, 1,
0.1843131, -1.05089, 3.806922, 0, 0.6156863, 1, 1,
0.1861108, -0.873828, 3.031561, 0, 0.6117647, 1, 1,
0.1908183, -0.4666034, 2.111816, 0, 0.6039216, 1, 1,
0.2038288, 0.965655, -0.63967, 0, 0.5960785, 1, 1,
0.2071412, -0.3952878, 3.544098, 0, 0.5921569, 1, 1,
0.2155425, -0.771607, 3.368647, 0, 0.5843138, 1, 1,
0.2161471, 0.5768713, 1.560207, 0, 0.5803922, 1, 1,
0.2211099, -1.695953, 3.780508, 0, 0.572549, 1, 1,
0.2236957, 1.063321, 0.7851821, 0, 0.5686275, 1, 1,
0.2246442, 0.5636289, -1.01847, 0, 0.5607843, 1, 1,
0.2297737, 0.3891605, -0.4678577, 0, 0.5568628, 1, 1,
0.2316826, 0.3820433, 0.7365749, 0, 0.5490196, 1, 1,
0.2318828, 0.5331409, -0.7851124, 0, 0.5450981, 1, 1,
0.2323533, -0.4234142, 3.670969, 0, 0.5372549, 1, 1,
0.2368602, 1.818014, 0.4051541, 0, 0.5333334, 1, 1,
0.2381974, 0.3237143, 1.235695, 0, 0.5254902, 1, 1,
0.2390669, -0.7868834, 3.16097, 0, 0.5215687, 1, 1,
0.2437449, 0.4619201, -0.1171218, 0, 0.5137255, 1, 1,
0.2493501, -0.5958848, 2.074618, 0, 0.509804, 1, 1,
0.2513721, -0.06570165, 2.113593, 0, 0.5019608, 1, 1,
0.2549624, -1.555395, 4.522179, 0, 0.4941176, 1, 1,
0.2558739, -1.141237, 0.7789578, 0, 0.4901961, 1, 1,
0.2565943, -1.314053, 3.292908, 0, 0.4823529, 1, 1,
0.2573078, -0.7828314, 2.421583, 0, 0.4784314, 1, 1,
0.2629666, -0.3290585, 1.312183, 0, 0.4705882, 1, 1,
0.2660962, -0.2832749, 3.036775, 0, 0.4666667, 1, 1,
0.2666647, 0.8987836, -0.3730507, 0, 0.4588235, 1, 1,
0.2699713, -0.4822529, 2.192773, 0, 0.454902, 1, 1,
0.271489, 0.5190547, 0.5219014, 0, 0.4470588, 1, 1,
0.2743733, -1.671788, 1.495273, 0, 0.4431373, 1, 1,
0.2827868, -1.142504, 3.158273, 0, 0.4352941, 1, 1,
0.2899513, -0.6511406, 3.281523, 0, 0.4313726, 1, 1,
0.3023825, -1.304343, 3.358643, 0, 0.4235294, 1, 1,
0.3060095, 0.9720701, 1.391381, 0, 0.4196078, 1, 1,
0.3060183, 1.233649, 0.8314474, 0, 0.4117647, 1, 1,
0.3070728, -0.7205659, 2.036109, 0, 0.4078431, 1, 1,
0.3074206, 1.269776, 1.031073, 0, 0.4, 1, 1,
0.3126565, 0.9628683, 1.733805, 0, 0.3921569, 1, 1,
0.31492, 1.035309, -1.046697, 0, 0.3882353, 1, 1,
0.3160654, 0.1490281, 1.066063, 0, 0.3803922, 1, 1,
0.3164506, -0.1502343, 0.2269815, 0, 0.3764706, 1, 1,
0.3171531, 0.7282528, 1.79581, 0, 0.3686275, 1, 1,
0.3178852, -0.6073348, 0.2894054, 0, 0.3647059, 1, 1,
0.3215252, -0.1084755, 1.735608, 0, 0.3568628, 1, 1,
0.324589, 0.1822821, 1.197889, 0, 0.3529412, 1, 1,
0.3251558, 0.2181459, 0.2090582, 0, 0.345098, 1, 1,
0.3343833, 0.8810424, 2.518728, 0, 0.3411765, 1, 1,
0.3359563, 0.08524088, 0.9233446, 0, 0.3333333, 1, 1,
0.3379131, -0.8960629, 3.68497, 0, 0.3294118, 1, 1,
0.342719, 1.047787, -0.206667, 0, 0.3215686, 1, 1,
0.3433866, 1.320494, -0.336834, 0, 0.3176471, 1, 1,
0.3495035, -1.171489, 3.270875, 0, 0.3098039, 1, 1,
0.3539407, -0.4840553, 3.549798, 0, 0.3058824, 1, 1,
0.3539986, 0.4652007, -0.08248554, 0, 0.2980392, 1, 1,
0.3556293, 1.519759, -0.1502463, 0, 0.2901961, 1, 1,
0.3572744, -0.5390057, 4.746989, 0, 0.2862745, 1, 1,
0.3596208, -0.1371595, 1.589839, 0, 0.2784314, 1, 1,
0.3596227, 0.7925941, 2.241278, 0, 0.2745098, 1, 1,
0.3601283, -0.2187953, 2.671999, 0, 0.2666667, 1, 1,
0.369141, 1.446312, 1.52288, 0, 0.2627451, 1, 1,
0.3703885, 0.4280739, -0.2150876, 0, 0.254902, 1, 1,
0.3739187, 1.46796, -0.05571155, 0, 0.2509804, 1, 1,
0.3743419, -0.9686508, 5.158246, 0, 0.2431373, 1, 1,
0.3748731, -1.182206, 3.587282, 0, 0.2392157, 1, 1,
0.3772442, -1.215667, 2.245382, 0, 0.2313726, 1, 1,
0.3817693, -0.1699179, 2.251194, 0, 0.227451, 1, 1,
0.3862631, -0.3317689, 2.902139, 0, 0.2196078, 1, 1,
0.3954627, 0.6946318, 0.8279068, 0, 0.2156863, 1, 1,
0.3963007, -1.840662, 2.065847, 0, 0.2078431, 1, 1,
0.3991136, 0.1900317, 0.9400188, 0, 0.2039216, 1, 1,
0.4017071, 0.04294666, 0.5523306, 0, 0.1960784, 1, 1,
0.4079609, -0.1572612, 1.842574, 0, 0.1882353, 1, 1,
0.408729, -0.9851841, 4.245854, 0, 0.1843137, 1, 1,
0.4192407, 0.8612925, 2.102926, 0, 0.1764706, 1, 1,
0.421905, 2.531817, 0.7258705, 0, 0.172549, 1, 1,
0.426579, 0.345302, 2.017138, 0, 0.1647059, 1, 1,
0.4272005, 1.676147, -0.06361093, 0, 0.1607843, 1, 1,
0.4276741, 0.5076823, 0.8916392, 0, 0.1529412, 1, 1,
0.4306229, 1.480193, 0.5088937, 0, 0.1490196, 1, 1,
0.4350447, -0.1289752, -0.1847779, 0, 0.1411765, 1, 1,
0.4351193, -0.2245542, 0.4506784, 0, 0.1372549, 1, 1,
0.4369991, -1.499422, 4.302445, 0, 0.1294118, 1, 1,
0.4413512, -0.8948712, 2.799234, 0, 0.1254902, 1, 1,
0.4429883, 0.6138128, -0.5279613, 0, 0.1176471, 1, 1,
0.4439477, -0.05846045, 2.43261, 0, 0.1137255, 1, 1,
0.4449432, 0.1600515, 2.193094, 0, 0.1058824, 1, 1,
0.4457678, 0.870402, 1.83598, 0, 0.09803922, 1, 1,
0.4484281, -0.697675, 2.539776, 0, 0.09411765, 1, 1,
0.4485072, 0.7915084, 3.131871, 0, 0.08627451, 1, 1,
0.4529091, 0.07328492, 1.419829, 0, 0.08235294, 1, 1,
0.4534747, -0.8978569, 1.960787, 0, 0.07450981, 1, 1,
0.4535006, 0.08875734, 3.675095, 0, 0.07058824, 1, 1,
0.454677, 2.028937, 0.2464245, 0, 0.0627451, 1, 1,
0.4577595, -0.1893645, 2.46121, 0, 0.05882353, 1, 1,
0.4596069, 0.307338, 0.4997556, 0, 0.05098039, 1, 1,
0.4611666, -0.2947406, 0.9312713, 0, 0.04705882, 1, 1,
0.4618028, 0.2130233, 2.015628, 0, 0.03921569, 1, 1,
0.4734564, 0.966997, 0.8556624, 0, 0.03529412, 1, 1,
0.4778164, 0.1919793, 0.3124345, 0, 0.02745098, 1, 1,
0.478655, 0.7174227, -1.144081, 0, 0.02352941, 1, 1,
0.4789929, 0.07505762, 1.806251, 0, 0.01568628, 1, 1,
0.4817486, -0.6544513, 2.207057, 0, 0.01176471, 1, 1,
0.4833191, 1.529139, 0.3204191, 0, 0.003921569, 1, 1,
0.4893214, -0.3494708, 2.375082, 0.003921569, 0, 1, 1,
0.492061, -0.006004366, 1.070175, 0.007843138, 0, 1, 1,
0.4932316, 0.4738772, 1.637839, 0.01568628, 0, 1, 1,
0.4940139, -1.390495, 2.220184, 0.01960784, 0, 1, 1,
0.503086, -1.484517, 2.364782, 0.02745098, 0, 1, 1,
0.5118209, 0.8139648, 0.131967, 0.03137255, 0, 1, 1,
0.5140491, -0.1783154, 2.737249, 0.03921569, 0, 1, 1,
0.5167325, -0.06219793, 2.526029, 0.04313726, 0, 1, 1,
0.518501, -0.5041698, 2.438176, 0.05098039, 0, 1, 1,
0.5225894, -1.150304, 1.994903, 0.05490196, 0, 1, 1,
0.5237569, 0.154567, 1.858628, 0.0627451, 0, 1, 1,
0.5282353, -1.260665, 3.296679, 0.06666667, 0, 1, 1,
0.5285276, 0.005596381, 1.553602, 0.07450981, 0, 1, 1,
0.5301219, -0.8479622, 2.111162, 0.07843138, 0, 1, 1,
0.533186, 1.434531, 1.195618, 0.08627451, 0, 1, 1,
0.5351204, -0.4846568, 0.6692027, 0.09019608, 0, 1, 1,
0.5378803, 1.76654, 0.6545947, 0.09803922, 0, 1, 1,
0.5389351, 1.383142, 0.4035004, 0.1058824, 0, 1, 1,
0.5417826, -0.7473598, 2.401116, 0.1098039, 0, 1, 1,
0.5519483, -0.2378928, 0.6272291, 0.1176471, 0, 1, 1,
0.5576667, -1.336849, 2.886787, 0.1215686, 0, 1, 1,
0.5592954, 0.1532514, 3.327237, 0.1294118, 0, 1, 1,
0.5627496, 0.2865845, 0.8246965, 0.1333333, 0, 1, 1,
0.5646188, -0.2843408, 1.194551, 0.1411765, 0, 1, 1,
0.5693321, 0.5213522, -0.508656, 0.145098, 0, 1, 1,
0.5760892, -0.9275433, 3.387798, 0.1529412, 0, 1, 1,
0.5776569, -1.140377, 3.996091, 0.1568628, 0, 1, 1,
0.5779988, -1.376541, 2.27582, 0.1647059, 0, 1, 1,
0.5781687, 0.1429998, 2.509957, 0.1686275, 0, 1, 1,
0.5854371, 0.5577064, 2.319323, 0.1764706, 0, 1, 1,
0.5960932, 1.333362, 1.905632, 0.1803922, 0, 1, 1,
0.59668, -2.516193, 3.218597, 0.1882353, 0, 1, 1,
0.5994089, 0.4492559, -0.8653454, 0.1921569, 0, 1, 1,
0.6021955, 0.321734, 0.6804742, 0.2, 0, 1, 1,
0.6033408, -0.006555764, 1.931481, 0.2078431, 0, 1, 1,
0.6072032, -0.330676, 2.840917, 0.2117647, 0, 1, 1,
0.6089852, -0.09041822, 3.23941, 0.2196078, 0, 1, 1,
0.6094131, -1.812107, 4.061122, 0.2235294, 0, 1, 1,
0.6168165, 0.3319346, -0.5537736, 0.2313726, 0, 1, 1,
0.6176052, 0.2510757, 2.0384, 0.2352941, 0, 1, 1,
0.6214637, 0.7877204, 0.9345863, 0.2431373, 0, 1, 1,
0.6235086, -0.5334043, 0.9591009, 0.2470588, 0, 1, 1,
0.6239797, -0.1939271, 2.704085, 0.254902, 0, 1, 1,
0.6264929, -3.057008, 2.57254, 0.2588235, 0, 1, 1,
0.6302011, -1.361263, 1.19665, 0.2666667, 0, 1, 1,
0.6363575, 0.5233666, 1.005578, 0.2705882, 0, 1, 1,
0.6412113, -0.05444317, 0.3971941, 0.2784314, 0, 1, 1,
0.6468119, -1.384415, 1.97185, 0.282353, 0, 1, 1,
0.6494831, -0.2757038, 3.432492, 0.2901961, 0, 1, 1,
0.654057, 0.528205, -0.6294891, 0.2941177, 0, 1, 1,
0.6541291, -0.1301291, 1.190563, 0.3019608, 0, 1, 1,
0.6564623, 0.5794241, 2.065967, 0.3098039, 0, 1, 1,
0.6581394, -0.4459233, 0.690777, 0.3137255, 0, 1, 1,
0.6619828, -0.3161006, 1.833228, 0.3215686, 0, 1, 1,
0.6638893, -0.4325458, 2.859259, 0.3254902, 0, 1, 1,
0.664162, 2.103415, -0.2831061, 0.3333333, 0, 1, 1,
0.664293, -0.2063239, 1.455157, 0.3372549, 0, 1, 1,
0.6650983, -0.5011985, 2.188353, 0.345098, 0, 1, 1,
0.6684038, -1.408385, 2.385934, 0.3490196, 0, 1, 1,
0.6684344, -1.179642, 4.064781, 0.3568628, 0, 1, 1,
0.6773679, -0.1118661, 0.6597401, 0.3607843, 0, 1, 1,
0.6779501, 0.5351166, 0.6294494, 0.3686275, 0, 1, 1,
0.6781797, -0.4813996, 3.198107, 0.372549, 0, 1, 1,
0.6783175, -1.673682, 3.070295, 0.3803922, 0, 1, 1,
0.6791601, -0.6768881, 4.802621, 0.3843137, 0, 1, 1,
0.6793917, 0.03681677, 0.1137867, 0.3921569, 0, 1, 1,
0.6799861, 0.6713382, 2.244139, 0.3960784, 0, 1, 1,
0.6858078, -0.3402433, 1.714678, 0.4039216, 0, 1, 1,
0.6860822, 0.6252289, 0.8612553, 0.4117647, 0, 1, 1,
0.686774, 0.4163366, 0.3808329, 0.4156863, 0, 1, 1,
0.6884702, -0.5414861, -0.112571, 0.4235294, 0, 1, 1,
0.6897259, 0.6331378, 0.2455381, 0.427451, 0, 1, 1,
0.6928421, 1.20529, 1.850359, 0.4352941, 0, 1, 1,
0.6952977, -1.244316, 4.597414, 0.4392157, 0, 1, 1,
0.6966256, -0.2687716, 1.613277, 0.4470588, 0, 1, 1,
0.6989434, 0.1937297, 2.216136, 0.4509804, 0, 1, 1,
0.6998217, -0.1338362, 0.1236285, 0.4588235, 0, 1, 1,
0.7058159, 0.5121574, 1.27558, 0.4627451, 0, 1, 1,
0.7094545, -0.02515094, 0.7498673, 0.4705882, 0, 1, 1,
0.7112463, 1.244794, -0.616039, 0.4745098, 0, 1, 1,
0.7129748, -0.5315491, 5.026899, 0.4823529, 0, 1, 1,
0.7173985, -1.261153, 1.580006, 0.4862745, 0, 1, 1,
0.7181591, 0.0843292, 1.026257, 0.4941176, 0, 1, 1,
0.7186498, 0.4013701, 1.117686, 0.5019608, 0, 1, 1,
0.7205741, -0.9212038, 3.575765, 0.5058824, 0, 1, 1,
0.7238694, -0.5564789, 0.9272739, 0.5137255, 0, 1, 1,
0.7241901, 0.3010092, 1.78483, 0.5176471, 0, 1, 1,
0.7244775, 0.7155728, 2.038402, 0.5254902, 0, 1, 1,
0.7255476, -0.04895419, 0.1694306, 0.5294118, 0, 1, 1,
0.7269116, 0.6260026, 0.3855976, 0.5372549, 0, 1, 1,
0.7292848, -1.376314, 1.871639, 0.5411765, 0, 1, 1,
0.7376875, -1.681296, 1.421462, 0.5490196, 0, 1, 1,
0.7393185, -0.6039041, 3.962958, 0.5529412, 0, 1, 1,
0.7443464, 0.4624748, 2.401563, 0.5607843, 0, 1, 1,
0.7448328, 2.134742, -1.189989, 0.5647059, 0, 1, 1,
0.7452322, 0.6183729, 0.6384838, 0.572549, 0, 1, 1,
0.749614, 0.959571, 1.367726, 0.5764706, 0, 1, 1,
0.7533994, 1.039544, 0.7268574, 0.5843138, 0, 1, 1,
0.75418, 0.3593317, 1.61207, 0.5882353, 0, 1, 1,
0.7564052, 0.8610216, 0.03353345, 0.5960785, 0, 1, 1,
0.7643547, -1.645674, 3.285893, 0.6039216, 0, 1, 1,
0.7730476, -0.4043145, 0.5030988, 0.6078432, 0, 1, 1,
0.7747518, -0.5885272, 3.035305, 0.6156863, 0, 1, 1,
0.7769063, -2.392039, 1.740028, 0.6196079, 0, 1, 1,
0.7785113, 1.681876, -1.384572, 0.627451, 0, 1, 1,
0.7884017, -0.9767532, 0.7701617, 0.6313726, 0, 1, 1,
0.7925382, -0.2147595, 0.210804, 0.6392157, 0, 1, 1,
0.7964012, -0.008390539, 1.547878, 0.6431373, 0, 1, 1,
0.7983065, 0.4286572, 1.104247, 0.6509804, 0, 1, 1,
0.8034142, 0.319523, 2.031729, 0.654902, 0, 1, 1,
0.8063709, 0.7805923, 1.93473, 0.6627451, 0, 1, 1,
0.8074418, -0.1859826, 1.601642, 0.6666667, 0, 1, 1,
0.8108501, -1.169942, 2.539393, 0.6745098, 0, 1, 1,
0.8116643, -0.2277888, 0.9935808, 0.6784314, 0, 1, 1,
0.8132312, 0.2153494, 1.869327, 0.6862745, 0, 1, 1,
0.8166972, -0.9255102, 2.052107, 0.6901961, 0, 1, 1,
0.8221793, 0.8442363, 0.9305786, 0.6980392, 0, 1, 1,
0.8281329, 0.514414, 2.050102, 0.7058824, 0, 1, 1,
0.8289452, -0.08950682, 1.229209, 0.7098039, 0, 1, 1,
0.8322457, 0.6867614, 2.397074, 0.7176471, 0, 1, 1,
0.8333792, -1.200434, 2.494245, 0.7215686, 0, 1, 1,
0.8341472, -0.3270661, 2.633836, 0.7294118, 0, 1, 1,
0.8401405, -0.4303592, 1.974135, 0.7333333, 0, 1, 1,
0.8454565, 0.7087282, 0.4707803, 0.7411765, 0, 1, 1,
0.8465766, -0.9824384, 3.337809, 0.7450981, 0, 1, 1,
0.8486712, -1.098654, 3.201969, 0.7529412, 0, 1, 1,
0.8510311, 0.4650224, 0.07285449, 0.7568628, 0, 1, 1,
0.8524331, 0.6910994, -0.3609123, 0.7647059, 0, 1, 1,
0.8637436, -0.9127609, 1.958876, 0.7686275, 0, 1, 1,
0.8669804, 0.8747597, 2.217623, 0.7764706, 0, 1, 1,
0.8743291, 0.4413632, -0.1108771, 0.7803922, 0, 1, 1,
0.8768479, -0.9714692, 4.023685, 0.7882353, 0, 1, 1,
0.877139, 0.6874105, -0.008389367, 0.7921569, 0, 1, 1,
0.8785186, 0.5645203, 0.869652, 0.8, 0, 1, 1,
0.8793542, 0.7076302, 0.07128966, 0.8078431, 0, 1, 1,
0.886912, -0.8922735, 4.381404, 0.8117647, 0, 1, 1,
0.8941572, 0.5849978, 1.408754, 0.8196079, 0, 1, 1,
0.8974066, -2.112661, 3.510525, 0.8235294, 0, 1, 1,
0.8978322, -0.3098814, 2.80035, 0.8313726, 0, 1, 1,
0.9042821, 1.556477, 0.7306258, 0.8352941, 0, 1, 1,
0.904706, 0.1994433, 1.14347, 0.8431373, 0, 1, 1,
0.9069305, -0.1481709, 3.449711, 0.8470588, 0, 1, 1,
0.9073211, -0.3808944, 1.238751, 0.854902, 0, 1, 1,
0.9073827, 1.323457, 0.3740606, 0.8588235, 0, 1, 1,
0.9075155, 0.4718553, 2.605157, 0.8666667, 0, 1, 1,
0.9077648, 0.4936521, 2.161847, 0.8705882, 0, 1, 1,
0.9107606, 0.954594, 2.715467, 0.8784314, 0, 1, 1,
0.9116285, 2.010603, 1.096299, 0.8823529, 0, 1, 1,
0.9167179, 0.1931016, 2.145859, 0.8901961, 0, 1, 1,
0.9196772, 0.0006058631, 0.2660784, 0.8941177, 0, 1, 1,
0.9212293, -0.08495026, 2.07772, 0.9019608, 0, 1, 1,
0.9330475, -0.6870607, 1.505162, 0.9098039, 0, 1, 1,
0.9472985, 0.7186158, 0.8744276, 0.9137255, 0, 1, 1,
0.9486823, 0.2218186, 1.918831, 0.9215686, 0, 1, 1,
0.9497111, -1.711374, 2.246704, 0.9254902, 0, 1, 1,
0.955399, 1.189954, 1.601884, 0.9333333, 0, 1, 1,
0.9578868, 1.508734, -1.029736, 0.9372549, 0, 1, 1,
0.9588805, -0.343487, 1.139505, 0.945098, 0, 1, 1,
0.9598904, -0.9392747, 3.800288, 0.9490196, 0, 1, 1,
0.9603517, 0.3560984, 2.821459, 0.9568627, 0, 1, 1,
0.9611462, 0.4762771, -0.9465063, 0.9607843, 0, 1, 1,
0.9648844, 0.1491016, 1.195206, 0.9686275, 0, 1, 1,
0.9651715, -1.515471, 3.45779, 0.972549, 0, 1, 1,
0.9669988, 0.9553519, 1.124628, 0.9803922, 0, 1, 1,
0.9676227, -0.03385924, 2.199234, 0.9843137, 0, 1, 1,
0.9676473, 1.05695, 0.1373751, 0.9921569, 0, 1, 1,
0.969159, -0.4585499, 2.380363, 0.9960784, 0, 1, 1,
0.9701933, 1.016962, 0.7551882, 1, 0, 0.9960784, 1,
0.9704824, 0.4166005, -0.02097879, 1, 0, 0.9882353, 1,
0.9716052, -1.025784, 2.600375, 1, 0, 0.9843137, 1,
0.9728017, 0.361423, 0.4706876, 1, 0, 0.9764706, 1,
0.980573, 0.407586, -0.567619, 1, 0, 0.972549, 1,
0.985295, -0.7668989, 3.515455, 1, 0, 0.9647059, 1,
0.9887907, -1.569509, 2.4957, 1, 0, 0.9607843, 1,
0.9932062, 0.08796071, 2.236137, 1, 0, 0.9529412, 1,
0.9940502, 1.954472, 0.6297925, 1, 0, 0.9490196, 1,
1.005555, 1.026989, 0.03851346, 1, 0, 0.9411765, 1,
1.007153, 1.427417, -0.9269835, 1, 0, 0.9372549, 1,
1.011289, -1.405674, 2.819247, 1, 0, 0.9294118, 1,
1.011495, 0.2509071, 1.03603, 1, 0, 0.9254902, 1,
1.015501, -0.8906351, 2.485641, 1, 0, 0.9176471, 1,
1.022276, 1.665584, -0.3902789, 1, 0, 0.9137255, 1,
1.022277, -1.278915, 2.465075, 1, 0, 0.9058824, 1,
1.025269, 0.4062708, 0.4312932, 1, 0, 0.9019608, 1,
1.033335, 0.03363869, 2.477167, 1, 0, 0.8941177, 1,
1.035609, 0.06915937, 1.268209, 1, 0, 0.8862745, 1,
1.038193, 0.175788, 1.266906, 1, 0, 0.8823529, 1,
1.040474, -0.967474, 2.326927, 1, 0, 0.8745098, 1,
1.041867, 1.677608, -0.2050506, 1, 0, 0.8705882, 1,
1.042243, 0.01718774, 2.093979, 1, 0, 0.8627451, 1,
1.047779, 1.363292, -0.6808814, 1, 0, 0.8588235, 1,
1.055542, 0.1601789, 0.1791891, 1, 0, 0.8509804, 1,
1.072639, 1.607441, 0.8363294, 1, 0, 0.8470588, 1,
1.075858, -0.1584747, 1.106354, 1, 0, 0.8392157, 1,
1.078643, 0.6444446, 0.1520042, 1, 0, 0.8352941, 1,
1.078879, -2.007223, 2.695582, 1, 0, 0.827451, 1,
1.08165, -1.101196, 2.952751, 1, 0, 0.8235294, 1,
1.084466, -0.9585206, 4.078382, 1, 0, 0.8156863, 1,
1.086974, -0.05992558, 0.6921661, 1, 0, 0.8117647, 1,
1.091071, 0.2012566, 1.636587, 1, 0, 0.8039216, 1,
1.094708, -0.3607528, 2.915839, 1, 0, 0.7960784, 1,
1.094738, 0.02072913, 1.79749, 1, 0, 0.7921569, 1,
1.105909, -0.4177945, 1.806258, 1, 0, 0.7843137, 1,
1.124649, 0.1136036, 1.274251, 1, 0, 0.7803922, 1,
1.125507, 0.5050195, 1.318777, 1, 0, 0.772549, 1,
1.130471, 0.2513888, 1.194424, 1, 0, 0.7686275, 1,
1.135741, 1.089326, -0.1954664, 1, 0, 0.7607843, 1,
1.140867, 1.896832, 0.9092651, 1, 0, 0.7568628, 1,
1.1439, 1.904802, 0.9986963, 1, 0, 0.7490196, 1,
1.144351, 0.7078897, 1.820675, 1, 0, 0.7450981, 1,
1.150864, 1.722064, -0.9391385, 1, 0, 0.7372549, 1,
1.154645, 0.5006995, 0.5410834, 1, 0, 0.7333333, 1,
1.160311, 0.2257874, 0.5066133, 1, 0, 0.7254902, 1,
1.168882, -0.254579, -0.1741077, 1, 0, 0.7215686, 1,
1.192669, -1.040491, 2.375211, 1, 0, 0.7137255, 1,
1.195063, -0.5108491, 2.322551, 1, 0, 0.7098039, 1,
1.2151, -1.09127, 1.193165, 1, 0, 0.7019608, 1,
1.218864, 0.4734325, -0.1741942, 1, 0, 0.6941177, 1,
1.22177, 0.1530241, 0.6817018, 1, 0, 0.6901961, 1,
1.222893, -0.1322168, 0.9511856, 1, 0, 0.682353, 1,
1.227175, -0.5936728, 1.501057, 1, 0, 0.6784314, 1,
1.234212, 0.7157189, 0.7782397, 1, 0, 0.6705883, 1,
1.239102, -0.2877117, 0.7514449, 1, 0, 0.6666667, 1,
1.243196, 0.7042271, 3.46067, 1, 0, 0.6588235, 1,
1.255992, -0.243374, 0.3688594, 1, 0, 0.654902, 1,
1.259197, 0.4044963, 0.6021413, 1, 0, 0.6470588, 1,
1.275741, -0.5148213, 2.56698, 1, 0, 0.6431373, 1,
1.279181, -0.1173817, 0.07124627, 1, 0, 0.6352941, 1,
1.286193, 0.7209676, 0.5355654, 1, 0, 0.6313726, 1,
1.289434, 0.5625433, 0.4748505, 1, 0, 0.6235294, 1,
1.292833, -1.643402, 1.360759, 1, 0, 0.6196079, 1,
1.293404, 0.9121318, 0.2437386, 1, 0, 0.6117647, 1,
1.296268, -1.372471, 3.618406, 1, 0, 0.6078432, 1,
1.300732, 0.6592119, 0.3588389, 1, 0, 0.6, 1,
1.307228, 0.02954443, 1.44156, 1, 0, 0.5921569, 1,
1.30752, 0.001713014, 1.61269, 1, 0, 0.5882353, 1,
1.307743, -0.1548601, 2.419225, 1, 0, 0.5803922, 1,
1.311858, 0.4808284, 1.291187, 1, 0, 0.5764706, 1,
1.314785, -0.5235831, 0.7092353, 1, 0, 0.5686275, 1,
1.318047, -0.8351013, 1.990373, 1, 0, 0.5647059, 1,
1.318836, -0.562778, 1.884356, 1, 0, 0.5568628, 1,
1.342606, -0.2212585, 1.82753, 1, 0, 0.5529412, 1,
1.342629, -0.2405746, 1.575129, 1, 0, 0.5450981, 1,
1.348827, -0.6154469, 1.175328, 1, 0, 0.5411765, 1,
1.36094, 0.2331744, -1.200134, 1, 0, 0.5333334, 1,
1.362759, -0.3980377, 2.439045, 1, 0, 0.5294118, 1,
1.393661, -1.782901, 2.730397, 1, 0, 0.5215687, 1,
1.406751, 0.2634715, 2.068533, 1, 0, 0.5176471, 1,
1.408352, 1.091419, 0.189943, 1, 0, 0.509804, 1,
1.415587, 0.5044369, 1.24739, 1, 0, 0.5058824, 1,
1.415884, 0.9642811, -0.1103863, 1, 0, 0.4980392, 1,
1.417339, -1.760493, 1.688933, 1, 0, 0.4901961, 1,
1.430634, 1.098877, -0.2335298, 1, 0, 0.4862745, 1,
1.433888, 0.9543698, -0.2902039, 1, 0, 0.4784314, 1,
1.437826, -1.030932, 1.95533, 1, 0, 0.4745098, 1,
1.438088, 0.3563611, 3.387992, 1, 0, 0.4666667, 1,
1.439051, -1.699386, 0.7966707, 1, 0, 0.4627451, 1,
1.444127, 0.4527179, 1.613184, 1, 0, 0.454902, 1,
1.448891, 0.3658208, 0.3432973, 1, 0, 0.4509804, 1,
1.454076, 0.04946315, 1.435229, 1, 0, 0.4431373, 1,
1.459699, -2.590117, 2.755417, 1, 0, 0.4392157, 1,
1.476296, -0.6643755, 2.551593, 1, 0, 0.4313726, 1,
1.488979, -1.047756, 2.606425, 1, 0, 0.427451, 1,
1.489383, 0.3960907, 0.8674166, 1, 0, 0.4196078, 1,
1.492921, 0.5155176, 1.211977, 1, 0, 0.4156863, 1,
1.493006, -0.3217144, 2.953621, 1, 0, 0.4078431, 1,
1.497812, -0.5216011, 2.698999, 1, 0, 0.4039216, 1,
1.501029, 0.7416803, 0.576485, 1, 0, 0.3960784, 1,
1.506307, 0.9552464, 1.613317, 1, 0, 0.3882353, 1,
1.512467, 0.469852, 0.9677969, 1, 0, 0.3843137, 1,
1.51528, 1.025249, 2.210992, 1, 0, 0.3764706, 1,
1.51911, -0.6229258, 3.99244, 1, 0, 0.372549, 1,
1.521773, 0.5643813, 1.546334, 1, 0, 0.3647059, 1,
1.525669, -0.6371534, 1.821132, 1, 0, 0.3607843, 1,
1.530688, -0.1222787, 1.172954, 1, 0, 0.3529412, 1,
1.541168, -0.3405939, 2.717352, 1, 0, 0.3490196, 1,
1.553457, 0.5662611, 1.95753, 1, 0, 0.3411765, 1,
1.565589, -0.0441114, 1.702428, 1, 0, 0.3372549, 1,
1.576993, -0.5271126, 2.515243, 1, 0, 0.3294118, 1,
1.578072, 0.4971969, 2.190192, 1, 0, 0.3254902, 1,
1.583073, -2.113251, 3.28282, 1, 0, 0.3176471, 1,
1.58741, -0.6264954, 2.620371, 1, 0, 0.3137255, 1,
1.589857, 1.197191, -0.6202753, 1, 0, 0.3058824, 1,
1.603933, 0.6654633, 2.28047, 1, 0, 0.2980392, 1,
1.616153, -1.777924, 2.507296, 1, 0, 0.2941177, 1,
1.648116, -1.721043, 3.592398, 1, 0, 0.2862745, 1,
1.651061, 0.7896835, 1.825016, 1, 0, 0.282353, 1,
1.674103, 0.5788925, 1.508415, 1, 0, 0.2745098, 1,
1.674952, 0.2658779, 2.063748, 1, 0, 0.2705882, 1,
1.675864, 0.2516659, 1.741361, 1, 0, 0.2627451, 1,
1.715178, 0.4548526, 0.01376954, 1, 0, 0.2588235, 1,
1.725432, -1.476647, 3.61757, 1, 0, 0.2509804, 1,
1.725719, 0.2894819, 1.630267, 1, 0, 0.2470588, 1,
1.73538, 0.2419627, 0.3945392, 1, 0, 0.2392157, 1,
1.756408, -0.351366, 1.806347, 1, 0, 0.2352941, 1,
1.763073, -0.902104, 3.246562, 1, 0, 0.227451, 1,
1.770769, 0.9639758, 0.5452918, 1, 0, 0.2235294, 1,
1.778733, -1.44559, 2.257403, 1, 0, 0.2156863, 1,
1.786039, 0.9264845, 1.36314, 1, 0, 0.2117647, 1,
1.809372, -0.9013941, 2.148136, 1, 0, 0.2039216, 1,
1.825901, -1.593529, 3.215473, 1, 0, 0.1960784, 1,
1.892739, 1.336593, 0.7949364, 1, 0, 0.1921569, 1,
1.907723, -0.8759552, 3.62622, 1, 0, 0.1843137, 1,
1.908844, -0.3510858, 3.32921, 1, 0, 0.1803922, 1,
1.931951, 1.633274, 1.004484, 1, 0, 0.172549, 1,
1.935429, 0.3417953, 2.081764, 1, 0, 0.1686275, 1,
1.937179, -0.9352795, 2.518138, 1, 0, 0.1607843, 1,
1.962001, -1.147629, 2.654451, 1, 0, 0.1568628, 1,
1.982621, -0.407921, 2.146333, 1, 0, 0.1490196, 1,
1.988702, -0.4113881, 0.8673377, 1, 0, 0.145098, 1,
2.013062, 0.9456446, 1.4191, 1, 0, 0.1372549, 1,
2.032555, -1.469703, 3.550708, 1, 0, 0.1333333, 1,
2.034822, 0.4140833, 1.720394, 1, 0, 0.1254902, 1,
2.045221, 1.521821, 2.043669, 1, 0, 0.1215686, 1,
2.05531, -0.4842448, 1.116587, 1, 0, 0.1137255, 1,
2.073629, 0.4806081, 0.2706358, 1, 0, 0.1098039, 1,
2.082561, -0.2237503, 1.041583, 1, 0, 0.1019608, 1,
2.157527, 0.112239, 2.570853, 1, 0, 0.09411765, 1,
2.1684, 0.4143242, 2.100612, 1, 0, 0.09019608, 1,
2.17647, 1.14856, 0.9900632, 1, 0, 0.08235294, 1,
2.182852, -0.4779405, 1.164583, 1, 0, 0.07843138, 1,
2.187636, 0.6529091, 2.110858, 1, 0, 0.07058824, 1,
2.241791, 0.1732764, 2.198845, 1, 0, 0.06666667, 1,
2.256339, 0.262961, 2.680629, 1, 0, 0.05882353, 1,
2.270165, 0.5985613, 1.344464, 1, 0, 0.05490196, 1,
2.270352, -0.3333963, 3.416144, 1, 0, 0.04705882, 1,
2.337346, -1.156513, -0.3984148, 1, 0, 0.04313726, 1,
2.377908, 0.4711003, 1.026985, 1, 0, 0.03529412, 1,
2.641783, -0.4184321, 0.633753, 1, 0, 0.03137255, 1,
2.671208, 1.288375, 2.114396, 1, 0, 0.02352941, 1,
2.892476, -1.391339, 2.097322, 1, 0, 0.01960784, 1,
2.998959, 0.4302344, 1.333829, 1, 0, 0.01176471, 1,
3.157612, 0.1861777, 1.048732, 1, 0, 0.007843138, 1
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
0.2747633, -4.365248, -7.243672, 0, -0.5, 0.5, 0.5,
0.2747633, -4.365248, -7.243672, 1, -0.5, 0.5, 0.5,
0.2747633, -4.365248, -7.243672, 1, 1.5, 0.5, 0.5,
0.2747633, -4.365248, -7.243672, 0, 1.5, 0.5, 0.5
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
-3.585371, -0.05432606, -7.243672, 0, -0.5, 0.5, 0.5,
-3.585371, -0.05432606, -7.243672, 1, -0.5, 0.5, 0.5,
-3.585371, -0.05432606, -7.243672, 1, 1.5, 0.5, 0.5,
-3.585371, -0.05432606, -7.243672, 0, 1.5, 0.5, 0.5
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
-3.585371, -4.365248, -0.1439853, 0, -0.5, 0.5, 0.5,
-3.585371, -4.365248, -0.1439853, 1, -0.5, 0.5, 0.5,
-3.585371, -4.365248, -0.1439853, 1, 1.5, 0.5, 0.5,
-3.585371, -4.365248, -0.1439853, 0, 1.5, 0.5, 0.5
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
-2, -3.37042, -5.605283,
3, -3.37042, -5.605283,
-2, -3.37042, -5.605283,
-2, -3.536224, -5.878348,
-1, -3.37042, -5.605283,
-1, -3.536224, -5.878348,
0, -3.37042, -5.605283,
0, -3.536224, -5.878348,
1, -3.37042, -5.605283,
1, -3.536224, -5.878348,
2, -3.37042, -5.605283,
2, -3.536224, -5.878348,
3, -3.37042, -5.605283,
3, -3.536224, -5.878348
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
-2, -3.867833, -6.424478, 0, -0.5, 0.5, 0.5,
-2, -3.867833, -6.424478, 1, -0.5, 0.5, 0.5,
-2, -3.867833, -6.424478, 1, 1.5, 0.5, 0.5,
-2, -3.867833, -6.424478, 0, 1.5, 0.5, 0.5,
-1, -3.867833, -6.424478, 0, -0.5, 0.5, 0.5,
-1, -3.867833, -6.424478, 1, -0.5, 0.5, 0.5,
-1, -3.867833, -6.424478, 1, 1.5, 0.5, 0.5,
-1, -3.867833, -6.424478, 0, 1.5, 0.5, 0.5,
0, -3.867833, -6.424478, 0, -0.5, 0.5, 0.5,
0, -3.867833, -6.424478, 1, -0.5, 0.5, 0.5,
0, -3.867833, -6.424478, 1, 1.5, 0.5, 0.5,
0, -3.867833, -6.424478, 0, 1.5, 0.5, 0.5,
1, -3.867833, -6.424478, 0, -0.5, 0.5, 0.5,
1, -3.867833, -6.424478, 1, -0.5, 0.5, 0.5,
1, -3.867833, -6.424478, 1, 1.5, 0.5, 0.5,
1, -3.867833, -6.424478, 0, 1.5, 0.5, 0.5,
2, -3.867833, -6.424478, 0, -0.5, 0.5, 0.5,
2, -3.867833, -6.424478, 1, -0.5, 0.5, 0.5,
2, -3.867833, -6.424478, 1, 1.5, 0.5, 0.5,
2, -3.867833, -6.424478, 0, 1.5, 0.5, 0.5,
3, -3.867833, -6.424478, 0, -0.5, 0.5, 0.5,
3, -3.867833, -6.424478, 1, -0.5, 0.5, 0.5,
3, -3.867833, -6.424478, 1, 1.5, 0.5, 0.5,
3, -3.867833, -6.424478, 0, 1.5, 0.5, 0.5
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
-2.694571, -3, -5.605283,
-2.694571, 3, -5.605283,
-2.694571, -3, -5.605283,
-2.843038, -3, -5.878348,
-2.694571, -2, -5.605283,
-2.843038, -2, -5.878348,
-2.694571, -1, -5.605283,
-2.843038, -1, -5.878348,
-2.694571, 0, -5.605283,
-2.843038, 0, -5.878348,
-2.694571, 1, -5.605283,
-2.843038, 1, -5.878348,
-2.694571, 2, -5.605283,
-2.843038, 2, -5.878348,
-2.694571, 3, -5.605283,
-2.843038, 3, -5.878348
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
-3.139971, -3, -6.424478, 0, -0.5, 0.5, 0.5,
-3.139971, -3, -6.424478, 1, -0.5, 0.5, 0.5,
-3.139971, -3, -6.424478, 1, 1.5, 0.5, 0.5,
-3.139971, -3, -6.424478, 0, 1.5, 0.5, 0.5,
-3.139971, -2, -6.424478, 0, -0.5, 0.5, 0.5,
-3.139971, -2, -6.424478, 1, -0.5, 0.5, 0.5,
-3.139971, -2, -6.424478, 1, 1.5, 0.5, 0.5,
-3.139971, -2, -6.424478, 0, 1.5, 0.5, 0.5,
-3.139971, -1, -6.424478, 0, -0.5, 0.5, 0.5,
-3.139971, -1, -6.424478, 1, -0.5, 0.5, 0.5,
-3.139971, -1, -6.424478, 1, 1.5, 0.5, 0.5,
-3.139971, -1, -6.424478, 0, 1.5, 0.5, 0.5,
-3.139971, 0, -6.424478, 0, -0.5, 0.5, 0.5,
-3.139971, 0, -6.424478, 1, -0.5, 0.5, 0.5,
-3.139971, 0, -6.424478, 1, 1.5, 0.5, 0.5,
-3.139971, 0, -6.424478, 0, 1.5, 0.5, 0.5,
-3.139971, 1, -6.424478, 0, -0.5, 0.5, 0.5,
-3.139971, 1, -6.424478, 1, -0.5, 0.5, 0.5,
-3.139971, 1, -6.424478, 1, 1.5, 0.5, 0.5,
-3.139971, 1, -6.424478, 0, 1.5, 0.5, 0.5,
-3.139971, 2, -6.424478, 0, -0.5, 0.5, 0.5,
-3.139971, 2, -6.424478, 1, -0.5, 0.5, 0.5,
-3.139971, 2, -6.424478, 1, 1.5, 0.5, 0.5,
-3.139971, 2, -6.424478, 0, 1.5, 0.5, 0.5,
-3.139971, 3, -6.424478, 0, -0.5, 0.5, 0.5,
-3.139971, 3, -6.424478, 1, -0.5, 0.5, 0.5,
-3.139971, 3, -6.424478, 1, 1.5, 0.5, 0.5,
-3.139971, 3, -6.424478, 0, 1.5, 0.5, 0.5
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
-2.694571, -3.37042, -4,
-2.694571, -3.37042, 4,
-2.694571, -3.37042, -4,
-2.843038, -3.536224, -4,
-2.694571, -3.37042, -2,
-2.843038, -3.536224, -2,
-2.694571, -3.37042, 0,
-2.843038, -3.536224, 0,
-2.694571, -3.37042, 2,
-2.843038, -3.536224, 2,
-2.694571, -3.37042, 4,
-2.843038, -3.536224, 4
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
-3.139971, -3.867833, -4, 0, -0.5, 0.5, 0.5,
-3.139971, -3.867833, -4, 1, -0.5, 0.5, 0.5,
-3.139971, -3.867833, -4, 1, 1.5, 0.5, 0.5,
-3.139971, -3.867833, -4, 0, 1.5, 0.5, 0.5,
-3.139971, -3.867833, -2, 0, -0.5, 0.5, 0.5,
-3.139971, -3.867833, -2, 1, -0.5, 0.5, 0.5,
-3.139971, -3.867833, -2, 1, 1.5, 0.5, 0.5,
-3.139971, -3.867833, -2, 0, 1.5, 0.5, 0.5,
-3.139971, -3.867833, 0, 0, -0.5, 0.5, 0.5,
-3.139971, -3.867833, 0, 1, -0.5, 0.5, 0.5,
-3.139971, -3.867833, 0, 1, 1.5, 0.5, 0.5,
-3.139971, -3.867833, 0, 0, 1.5, 0.5, 0.5,
-3.139971, -3.867833, 2, 0, -0.5, 0.5, 0.5,
-3.139971, -3.867833, 2, 1, -0.5, 0.5, 0.5,
-3.139971, -3.867833, 2, 1, 1.5, 0.5, 0.5,
-3.139971, -3.867833, 2, 0, 1.5, 0.5, 0.5,
-3.139971, -3.867833, 4, 0, -0.5, 0.5, 0.5,
-3.139971, -3.867833, 4, 1, -0.5, 0.5, 0.5,
-3.139971, -3.867833, 4, 1, 1.5, 0.5, 0.5,
-3.139971, -3.867833, 4, 0, 1.5, 0.5, 0.5
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
-2.694571, -3.37042, -5.605283,
-2.694571, 3.261767, -5.605283,
-2.694571, -3.37042, 5.317313,
-2.694571, 3.261767, 5.317313,
-2.694571, -3.37042, -5.605283,
-2.694571, -3.37042, 5.317313,
-2.694571, 3.261767, -5.605283,
-2.694571, 3.261767, 5.317313,
-2.694571, -3.37042, -5.605283,
3.244098, -3.37042, -5.605283,
-2.694571, -3.37042, 5.317313,
3.244098, -3.37042, 5.317313,
-2.694571, 3.261767, -5.605283,
3.244098, 3.261767, -5.605283,
-2.694571, 3.261767, 5.317313,
3.244098, 3.261767, 5.317313,
3.244098, -3.37042, -5.605283,
3.244098, 3.261767, -5.605283,
3.244098, -3.37042, 5.317313,
3.244098, 3.261767, 5.317313,
3.244098, -3.37042, -5.605283,
3.244098, -3.37042, 5.317313,
3.244098, 3.261767, -5.605283,
3.244098, 3.261767, 5.317313
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
var radius = 7.52433;
var distance = 33.47659;
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
mvMatrix.translate( -0.2747633, 0.05432606, 0.1439853 );
mvMatrix.scale( 1.369912, 1.226662, 0.7448278 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.47659);
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
Fosthietan<-read.table("Fosthietan.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-2.608086, 1.823683, -0.3119405, 0, 0, 1, 1, 1,
-2.60804, 0.5509135, -1.566879, 1, 0, 0, 1, 1,
-2.605782, 1.801948, 0.4843239, 1, 0, 0, 1, 1,
-2.594973, -0.252928, -0.6741301, 1, 0, 0, 1, 1,
-2.547133, -0.8813524, -1.837058, 1, 0, 0, 1, 1,
-2.537155, 0.7952521, -0.1629444, 1, 0, 0, 1, 1,
-2.346822, 0.0865581, -0.3909333, 0, 0, 0, 1, 1,
-2.288496, -0.7497793, -1.048494, 0, 0, 0, 1, 1,
-2.253551, -0.4467407, -0.9304587, 0, 0, 0, 1, 1,
-2.21761, 1.060044, 1.514337, 0, 0, 0, 1, 1,
-2.216963, -0.2402266, -2.543839, 0, 0, 0, 1, 1,
-2.211823, 0.5711033, -0.6021706, 0, 0, 0, 1, 1,
-2.160235, 0.4143409, -3.4595, 0, 0, 0, 1, 1,
-2.15988, -0.4249338, -2.77548, 1, 1, 1, 1, 1,
-2.154554, -0.5378566, -0.6307932, 1, 1, 1, 1, 1,
-2.150425, 0.2606718, -3.552753, 1, 1, 1, 1, 1,
-2.139632, -0.4316854, -0.5899267, 1, 1, 1, 1, 1,
-2.071021, -2.531508, -3.838117, 1, 1, 1, 1, 1,
-2.046358, -0.5515975, -2.552525, 1, 1, 1, 1, 1,
-2.046348, 0.07022231, -1.850413, 1, 1, 1, 1, 1,
-2.029239, -0.6788263, -0.9500648, 1, 1, 1, 1, 1,
-2.014227, 0.1323144, -2.842669, 1, 1, 1, 1, 1,
-1.963001, 1.053329, -1.398486, 1, 1, 1, 1, 1,
-1.940431, -0.8819581, -3.314355, 1, 1, 1, 1, 1,
-1.912271, -0.6664609, -1.390223, 1, 1, 1, 1, 1,
-1.881933, -0.258433, -2.166103, 1, 1, 1, 1, 1,
-1.875083, 1.348634, -0.223814, 1, 1, 1, 1, 1,
-1.844616, -1.179729, -1.992843, 1, 1, 1, 1, 1,
-1.809167, 2.337723, -0.5516099, 0, 0, 1, 1, 1,
-1.733508, -1.019615, -2.452403, 1, 0, 0, 1, 1,
-1.732478, -0.2431687, -2.877997, 1, 0, 0, 1, 1,
-1.724562, -0.8708023, -2.42839, 1, 0, 0, 1, 1,
-1.723624, 0.1348627, -0.4667841, 1, 0, 0, 1, 1,
-1.693793, 0.3528757, -1.038584, 1, 0, 0, 1, 1,
-1.685669, -1.959301, -1.349251, 0, 0, 0, 1, 1,
-1.680516, -0.0698536, -3.072404, 0, 0, 0, 1, 1,
-1.677016, 1.122039, -0.3800753, 0, 0, 0, 1, 1,
-1.675663, 0.4618375, -2.247131, 0, 0, 0, 1, 1,
-1.671914, 1.681385, -0.005458298, 0, 0, 0, 1, 1,
-1.635729, 1.998333, -1.754081, 0, 0, 0, 1, 1,
-1.609282, 0.4734187, -1.616566, 0, 0, 0, 1, 1,
-1.603756, 1.235564, -0.6259335, 1, 1, 1, 1, 1,
-1.592685, 0.5140667, -0.6239675, 1, 1, 1, 1, 1,
-1.564384, -0.6915812, -2.798625, 1, 1, 1, 1, 1,
-1.547692, -1.611863, -3.182032, 1, 1, 1, 1, 1,
-1.539274, -0.04330715, -0.7706151, 1, 1, 1, 1, 1,
-1.538418, 0.6793609, -1.538428, 1, 1, 1, 1, 1,
-1.519391, 0.3671401, 1.140003, 1, 1, 1, 1, 1,
-1.506687, -0.9845986, -2.705389, 1, 1, 1, 1, 1,
-1.501869, -1.781654, -1.835385, 1, 1, 1, 1, 1,
-1.495614, 0.2049333, -2.856473, 1, 1, 1, 1, 1,
-1.49479, -0.9532418, -1.643613, 1, 1, 1, 1, 1,
-1.493111, -0.7159534, -0.9175777, 1, 1, 1, 1, 1,
-1.491869, -0.2652465, -0.4964084, 1, 1, 1, 1, 1,
-1.483373, -0.2565294, -1.787507, 1, 1, 1, 1, 1,
-1.475959, 0.169698, -0.336223, 1, 1, 1, 1, 1,
-1.469293, 0.2079151, -0.5758145, 0, 0, 1, 1, 1,
-1.460858, 0.941087, 0.03421314, 1, 0, 0, 1, 1,
-1.449476, 0.9611529, -0.9154249, 1, 0, 0, 1, 1,
-1.440239, 0.2539996, -1.530452, 1, 0, 0, 1, 1,
-1.410119, 0.3199825, -1.591383, 1, 0, 0, 1, 1,
-1.409681, -0.4567085, -2.188559, 1, 0, 0, 1, 1,
-1.401005, -0.1690953, -1.356773, 0, 0, 0, 1, 1,
-1.395066, -1.10955, -3.060146, 0, 0, 0, 1, 1,
-1.394823, 0.6392674, -0.9831259, 0, 0, 0, 1, 1,
-1.386979, -0.5660195, -2.095771, 0, 0, 0, 1, 1,
-1.380385, -0.06388653, -1.810095, 0, 0, 0, 1, 1,
-1.377247, -0.6710547, -1.76435, 0, 0, 0, 1, 1,
-1.366529, -0.2268223, -1.174368, 0, 0, 0, 1, 1,
-1.358862, -0.3631545, -2.027582, 1, 1, 1, 1, 1,
-1.353302, 0.3043184, -2.339113, 1, 1, 1, 1, 1,
-1.345713, 0.2612689, -0.5010923, 1, 1, 1, 1, 1,
-1.343904, 0.5309951, -0.2128334, 1, 1, 1, 1, 1,
-1.339136, -1.478698, -2.18796, 1, 1, 1, 1, 1,
-1.330326, 0.7785384, -0.6474066, 1, 1, 1, 1, 1,
-1.328926, 0.6985161, -1.260265, 1, 1, 1, 1, 1,
-1.327506, -0.5461505, -1.296137, 1, 1, 1, 1, 1,
-1.324596, -1.474866, -3.137151, 1, 1, 1, 1, 1,
-1.323031, 1.277061, -1.535715, 1, 1, 1, 1, 1,
-1.313879, 0.7603825, -0.879523, 1, 1, 1, 1, 1,
-1.305077, -0.4504314, -0.4865746, 1, 1, 1, 1, 1,
-1.304312, -0.4731709, -2.475875, 1, 1, 1, 1, 1,
-1.304047, 0.6120078, -1.966599, 1, 1, 1, 1, 1,
-1.303033, -1.828959, -2.793711, 1, 1, 1, 1, 1,
-1.300867, -0.855281, -3.396322, 0, 0, 1, 1, 1,
-1.300677, -0.3601505, -2.124804, 1, 0, 0, 1, 1,
-1.286961, 0.2053192, -1.245914, 1, 0, 0, 1, 1,
-1.281805, 0.2828302, -2.147825, 1, 0, 0, 1, 1,
-1.27757, 1.462003, -0.5310311, 1, 0, 0, 1, 1,
-1.277064, 0.05740843, -2.32822, 1, 0, 0, 1, 1,
-1.275064, 0.1102854, -0.1628984, 0, 0, 0, 1, 1,
-1.260788, 0.1137618, -1.59406, 0, 0, 0, 1, 1,
-1.258662, -1.791279, -1.185974, 0, 0, 0, 1, 1,
-1.244382, 1.72316, -1.229155, 0, 0, 0, 1, 1,
-1.243501, -1.061885, -1.318373, 0, 0, 0, 1, 1,
-1.240865, -1.787729, -2.447588, 0, 0, 0, 1, 1,
-1.237738, -0.8173415, -1.430354, 0, 0, 0, 1, 1,
-1.219984, 0.7146072, -0.2904744, 1, 1, 1, 1, 1,
-1.215446, 1.147611, 0.05134998, 1, 1, 1, 1, 1,
-1.212623, -1.065832, -3.054887, 1, 1, 1, 1, 1,
-1.211332, 2.351654, -0.4757926, 1, 1, 1, 1, 1,
-1.209832, -0.9004676, -1.943794, 1, 1, 1, 1, 1,
-1.205642, 3.165182, 0.5473536, 1, 1, 1, 1, 1,
-1.201034, -0.8384558, -1.55766, 1, 1, 1, 1, 1,
-1.196777, 0.3660532, -2.692987, 1, 1, 1, 1, 1,
-1.195446, 0.02492049, -1.316365, 1, 1, 1, 1, 1,
-1.192679, 1.703414, -0.3878461, 1, 1, 1, 1, 1,
-1.171537, -1.971677, -2.870719, 1, 1, 1, 1, 1,
-1.170007, 1.075384, -1.323274, 1, 1, 1, 1, 1,
-1.164046, -0.3020406, -2.120242, 1, 1, 1, 1, 1,
-1.162685, 0.1576652, -1.821786, 1, 1, 1, 1, 1,
-1.149571, -1.056517, -1.558944, 1, 1, 1, 1, 1,
-1.14537, -1.093736, -3.69333, 0, 0, 1, 1, 1,
-1.14439, -1.009921, -1.913544, 1, 0, 0, 1, 1,
-1.137037, 0.7703974, -0.2240361, 1, 0, 0, 1, 1,
-1.128117, -0.1216501, -1.449792, 1, 0, 0, 1, 1,
-1.12729, 0.09061848, -1.733416, 1, 0, 0, 1, 1,
-1.126941, 2.257939, -0.40252, 1, 0, 0, 1, 1,
-1.124431, -3.273834, -3.010453, 0, 0, 0, 1, 1,
-1.121174, 2.230533, 0.6604034, 0, 0, 0, 1, 1,
-1.119719, 0.3714312, -1.652176, 0, 0, 0, 1, 1,
-1.098156, -0.7477487, -2.370863, 0, 0, 0, 1, 1,
-1.095868, -0.6609432, -1.680914, 0, 0, 0, 1, 1,
-1.095156, 0.5889143, -1.003262, 0, 0, 0, 1, 1,
-1.090318, -0.03565585, -2.071481, 0, 0, 0, 1, 1,
-1.082865, 0.922303, -0.6394888, 1, 1, 1, 1, 1,
-1.081988, -0.5028277, -3.088021, 1, 1, 1, 1, 1,
-1.081613, 0.5566371, -0.9696626, 1, 1, 1, 1, 1,
-1.081515, -0.648743, -2.282127, 1, 1, 1, 1, 1,
-1.077954, 1.673808, -1.191949, 1, 1, 1, 1, 1,
-1.076482, 1.540271, -1.636368, 1, 1, 1, 1, 1,
-1.075196, 0.09437346, -2.618311, 1, 1, 1, 1, 1,
-1.067127, -3.06144, -1.378527, 1, 1, 1, 1, 1,
-1.063341, -0.9297013, -1.810862, 1, 1, 1, 1, 1,
-1.05696, -0.4070158, -1.967672, 1, 1, 1, 1, 1,
-1.046098, 0.1524086, -2.183846, 1, 1, 1, 1, 1,
-1.04489, -1.456036, -2.626179, 1, 1, 1, 1, 1,
-1.041052, 0.4342469, -0.734022, 1, 1, 1, 1, 1,
-1.035182, 0.03542736, -0.8765349, 1, 1, 1, 1, 1,
-1.027873, -0.903478, -1.481193, 1, 1, 1, 1, 1,
-1.026492, -1.038244, -2.228235, 0, 0, 1, 1, 1,
-1.024018, 0.1871506, -0.9617943, 1, 0, 0, 1, 1,
-1.017793, -1.145986, -2.217984, 1, 0, 0, 1, 1,
-1.016207, -0.8806963, -3.247715, 1, 0, 0, 1, 1,
-1.008561, 0.8715547, 0.9973279, 1, 0, 0, 1, 1,
-1.003635, -0.4454358, -1.81361, 1, 0, 0, 1, 1,
-1.001337, -1.876253, -3.772674, 0, 0, 0, 1, 1,
-0.9933012, 0.08867899, -1.01203, 0, 0, 0, 1, 1,
-0.9833626, -0.357517, -3.070666, 0, 0, 0, 1, 1,
-0.9712088, -0.2536331, -0.9104877, 0, 0, 0, 1, 1,
-0.9650205, 0.5151597, -2.372991, 0, 0, 0, 1, 1,
-0.9511018, -0.2336678, -2.371359, 0, 0, 0, 1, 1,
-0.9441612, 0.8490123, 0.3516219, 0, 0, 0, 1, 1,
-0.9434912, 0.4903419, 0.2333003, 1, 1, 1, 1, 1,
-0.9409613, 0.3106129, -1.906437, 1, 1, 1, 1, 1,
-0.9396237, 0.1999841, -2.028454, 1, 1, 1, 1, 1,
-0.931052, -0.2739151, -2.017143, 1, 1, 1, 1, 1,
-0.9252254, 1.050368, 2.451282, 1, 1, 1, 1, 1,
-0.9169927, 0.1300976, -3.007276, 1, 1, 1, 1, 1,
-0.9166908, 0.1281581, -0.8268478, 1, 1, 1, 1, 1,
-0.9120845, -1.23492, -2.765172, 1, 1, 1, 1, 1,
-0.911823, 0.5095106, 0.0932892, 1, 1, 1, 1, 1,
-0.907642, 0.09516548, 0.2834606, 1, 1, 1, 1, 1,
-0.9065003, 2.582202, -1.12649, 1, 1, 1, 1, 1,
-0.9058599, -1.402712, -3.643048, 1, 1, 1, 1, 1,
-0.9040055, 0.415461, -2.985943, 1, 1, 1, 1, 1,
-0.9021975, -0.2405695, -2.384529, 1, 1, 1, 1, 1,
-0.9001482, -0.3256277, 0.5834929, 1, 1, 1, 1, 1,
-0.8867149, 0.2738611, -1.095649, 0, 0, 1, 1, 1,
-0.8842732, 0.7096742, -2.259395, 1, 0, 0, 1, 1,
-0.8796889, 0.2651368, -1.299023, 1, 0, 0, 1, 1,
-0.8769531, 0.3017441, -0.8494467, 1, 0, 0, 1, 1,
-0.8712825, 0.2249149, -1.257195, 1, 0, 0, 1, 1,
-0.8675762, -0.9497452, -3.511049, 1, 0, 0, 1, 1,
-0.8563104, 0.5549047, 0.229768, 0, 0, 0, 1, 1,
-0.8550804, 0.8638936, -0.77211, 0, 0, 0, 1, 1,
-0.8499125, 1.82468, -1.342224, 0, 0, 0, 1, 1,
-0.8493826, -0.9908824, -3.632789, 0, 0, 0, 1, 1,
-0.8467786, 0.001667881, -1.758769, 0, 0, 0, 1, 1,
-0.8460853, 0.9713586, 0.105331, 0, 0, 0, 1, 1,
-0.8447438, -1.846045, -2.270696, 0, 0, 0, 1, 1,
-0.8413018, -1.25941, -0.12038, 1, 1, 1, 1, 1,
-0.8392409, -1.1128, -2.236154, 1, 1, 1, 1, 1,
-0.8317823, 0.8341978, -0.6491137, 1, 1, 1, 1, 1,
-0.831102, 0.6888819, 0.5980356, 1, 1, 1, 1, 1,
-0.8288001, 1.649289, -3.096134, 1, 1, 1, 1, 1,
-0.8201963, 1.282219, 0.4152764, 1, 1, 1, 1, 1,
-0.8191215, 0.4288169, -0.2903568, 1, 1, 1, 1, 1,
-0.8147095, 0.2085751, -1.782026, 1, 1, 1, 1, 1,
-0.8092921, -1.366295, -4.723198, 1, 1, 1, 1, 1,
-0.8065016, 2.341203, -1.884669, 1, 1, 1, 1, 1,
-0.8043117, 0.2589808, -1.742837, 1, 1, 1, 1, 1,
-0.8027641, 0.4705122, -0.8035904, 1, 1, 1, 1, 1,
-0.7884181, -0.2494911, -2.894569, 1, 1, 1, 1, 1,
-0.7864064, -0.2724571, -0.3197519, 1, 1, 1, 1, 1,
-0.7838851, 2.225502, 0.3666893, 1, 1, 1, 1, 1,
-0.7818983, -0.1427499, -1.67286, 0, 0, 1, 1, 1,
-0.7798663, -0.9750371, -2.895207, 1, 0, 0, 1, 1,
-0.7787918, -0.01259994, -0.6273987, 1, 0, 0, 1, 1,
-0.7787396, -1.872945, -5.080289, 1, 0, 0, 1, 1,
-0.7779531, 0.4054531, 1.233484, 1, 0, 0, 1, 1,
-0.7776971, 1.110991, 0.6085297, 1, 0, 0, 1, 1,
-0.7724296, -0.3234315, -2.095939, 0, 0, 0, 1, 1,
-0.7686943, -0.5235566, -2.067782, 0, 0, 0, 1, 1,
-0.7668501, 0.4512097, -3.438167, 0, 0, 0, 1, 1,
-0.7637615, 0.4336186, 0.05857915, 0, 0, 0, 1, 1,
-0.7635201, 0.6897783, -0.1916073, 0, 0, 0, 1, 1,
-0.7628618, 1.403514, 0.3974001, 0, 0, 0, 1, 1,
-0.7625237, 0.9609262, -1.264463, 0, 0, 0, 1, 1,
-0.7526689, -0.1404006, -1.366316, 1, 1, 1, 1, 1,
-0.7391836, -0.05206226, -2.568669, 1, 1, 1, 1, 1,
-0.7387893, 0.1861689, -0.829161, 1, 1, 1, 1, 1,
-0.735313, 0.1450493, -1.340387, 1, 1, 1, 1, 1,
-0.7349603, -0.08183538, -1.446037, 1, 1, 1, 1, 1,
-0.7330997, -0.1336198, -1.818099, 1, 1, 1, 1, 1,
-0.7284058, 0.6572914, -2.128417, 1, 1, 1, 1, 1,
-0.7260681, -0.9054173, -2.783456, 1, 1, 1, 1, 1,
-0.723967, -0.4334275, -3.019606, 1, 1, 1, 1, 1,
-0.7228634, 0.1549802, -1.586467, 1, 1, 1, 1, 1,
-0.7228043, 0.1915294, 0.2220426, 1, 1, 1, 1, 1,
-0.7210609, -0.2648727, -1.592972, 1, 1, 1, 1, 1,
-0.7202964, 0.2423386, -1.443812, 1, 1, 1, 1, 1,
-0.7112492, 1.149251, -2.040807, 1, 1, 1, 1, 1,
-0.7100716, 1.534093, -0.2888384, 1, 1, 1, 1, 1,
-0.7032976, 1.804013, -1.150992, 0, 0, 1, 1, 1,
-0.7013865, 0.4067312, -2.24495, 1, 0, 0, 1, 1,
-0.6968139, -1.698258, -1.593681, 1, 0, 0, 1, 1,
-0.6942181, -1.24284, -4.793622, 1, 0, 0, 1, 1,
-0.6939095, 0.620892, 0.6112337, 1, 0, 0, 1, 1,
-0.6898516, 0.4077884, -1.379721, 1, 0, 0, 1, 1,
-0.6857342, 0.4593812, 0.05859065, 0, 0, 0, 1, 1,
-0.685507, -0.9524008, -2.865774, 0, 0, 0, 1, 1,
-0.6836878, 0.6250556, -1.193521, 0, 0, 0, 1, 1,
-0.6806363, -0.539113, -1.59677, 0, 0, 0, 1, 1,
-0.6725467, 0.3282473, -1.469522, 0, 0, 0, 1, 1,
-0.6722753, 0.06254599, -2.119, 0, 0, 0, 1, 1,
-0.6687224, -0.03041493, -0.04245263, 0, 0, 0, 1, 1,
-0.6669436, 2.245082, -0.06677471, 1, 1, 1, 1, 1,
-0.6635738, 1.625231, -0.3845278, 1, 1, 1, 1, 1,
-0.6599751, -1.088231, -4.778722, 1, 1, 1, 1, 1,
-0.6578394, -0.1034704, -0.736204, 1, 1, 1, 1, 1,
-0.6487548, 0.7018831, -1.210825, 1, 1, 1, 1, 1,
-0.6472899, -1.728404, -2.716681, 1, 1, 1, 1, 1,
-0.6470722, 2.145735, -0.729087, 1, 1, 1, 1, 1,
-0.6439621, -0.4032741, -1.794089, 1, 1, 1, 1, 1,
-0.6372892, 0.6887498, -1.049896, 1, 1, 1, 1, 1,
-0.6364074, -0.5415108, -2.873448, 1, 1, 1, 1, 1,
-0.6357168, 0.3753072, -1.836127, 1, 1, 1, 1, 1,
-0.6356987, -1.759791, -3.705531, 1, 1, 1, 1, 1,
-0.6350795, -0.6428707, -2.148085, 1, 1, 1, 1, 1,
-0.6202011, -0.6829255, -3.704344, 1, 1, 1, 1, 1,
-0.6108634, -0.4423988, -3.262927, 1, 1, 1, 1, 1,
-0.6092786, 1.243039, 0.6167135, 0, 0, 1, 1, 1,
-0.6061282, -2.152386, -4.225585, 1, 0, 0, 1, 1,
-0.6042628, -0.2691273, -0.9321833, 1, 0, 0, 1, 1,
-0.6036338, -0.3728071, -1.997391, 1, 0, 0, 1, 1,
-0.6002917, -0.3858098, -2.462037, 1, 0, 0, 1, 1,
-0.593676, 0.5485534, 1.666041, 1, 0, 0, 1, 1,
-0.5901737, -0.08678295, -2.140128, 0, 0, 0, 1, 1,
-0.5896751, 1.143073, -0.5333563, 0, 0, 0, 1, 1,
-0.5847481, 1.265588, 0.1559669, 0, 0, 0, 1, 1,
-0.5842697, -0.1552247, -0.3735781, 0, 0, 0, 1, 1,
-0.5819948, 0.6621377, 1.469967, 0, 0, 0, 1, 1,
-0.5803133, 0.5994147, -2.110594, 0, 0, 0, 1, 1,
-0.5799606, 0.9980592, 0.2378131, 0, 0, 0, 1, 1,
-0.5791411, 0.2849198, -1.365426, 1, 1, 1, 1, 1,
-0.5752658, 1.188082, -2.037834, 1, 1, 1, 1, 1,
-0.5724308, 1.76366, -0.8355445, 1, 1, 1, 1, 1,
-0.5714151, 0.6985148, -0.4648723, 1, 1, 1, 1, 1,
-0.5681254, -0.6592817, -2.942655, 1, 1, 1, 1, 1,
-0.5648001, -0.8083343, -0.2796974, 1, 1, 1, 1, 1,
-0.5603105, 0.5059124, -1.275546, 1, 1, 1, 1, 1,
-0.557009, 0.1650157, -0.6267434, 1, 1, 1, 1, 1,
-0.5492443, 0.5383335, -0.7332827, 1, 1, 1, 1, 1,
-0.5487648, 0.6810974, -0.7409667, 1, 1, 1, 1, 1,
-0.5485677, -0.6091098, -2.597567, 1, 1, 1, 1, 1,
-0.538659, -0.5816055, -2.562475, 1, 1, 1, 1, 1,
-0.5377828, 0.8276643, 1.111978, 1, 1, 1, 1, 1,
-0.5367351, -0.006990013, -1.329019, 1, 1, 1, 1, 1,
-0.5362253, -0.3911891, -3.155577, 1, 1, 1, 1, 1,
-0.5354178, 2.016477, 0.3335995, 0, 0, 1, 1, 1,
-0.5353557, 0.4117775, -1.141068, 1, 0, 0, 1, 1,
-0.5348567, 1.712029, -0.03585866, 1, 0, 0, 1, 1,
-0.5296601, -0.691277, -1.125202, 1, 0, 0, 1, 1,
-0.5293775, -1.593123, -3.508646, 1, 0, 0, 1, 1,
-0.5227564, 0.7662368, 0.1148188, 1, 0, 0, 1, 1,
-0.5210316, 0.347059, 1.186679, 0, 0, 0, 1, 1,
-0.5204709, -0.3169031, -1.104995, 0, 0, 0, 1, 1,
-0.518958, 0.200331, 0.333643, 0, 0, 0, 1, 1,
-0.5161244, -0.1409393, -1.709175, 0, 0, 0, 1, 1,
-0.5141627, 0.4456354, -0.1419541, 0, 0, 0, 1, 1,
-0.5099048, -0.9520575, -2.921273, 0, 0, 0, 1, 1,
-0.502196, 0.5492696, -1.158185, 0, 0, 0, 1, 1,
-0.4978313, 1.000356, -0.4374794, 1, 1, 1, 1, 1,
-0.4929985, -0.1307737, -1.411963, 1, 1, 1, 1, 1,
-0.4894496, -0.1731602, -1.769936, 1, 1, 1, 1, 1,
-0.4867152, -0.2267123, -0.4169709, 1, 1, 1, 1, 1,
-0.4857337, -0.7261222, -2.28351, 1, 1, 1, 1, 1,
-0.4845094, -0.4549006, -2.695293, 1, 1, 1, 1, 1,
-0.4842976, 0.5206707, 0.6409882, 1, 1, 1, 1, 1,
-0.4836496, -0.7347667, -1.856418, 1, 1, 1, 1, 1,
-0.4823931, 0.3760926, -0.4266541, 1, 1, 1, 1, 1,
-0.4799421, -1.423627, -1.203175, 1, 1, 1, 1, 1,
-0.4782674, 0.4347057, 0.251451, 1, 1, 1, 1, 1,
-0.4687097, 1.293167, 0.6265326, 1, 1, 1, 1, 1,
-0.4670289, -0.8697518, -1.538855, 1, 1, 1, 1, 1,
-0.4668706, -0.09979867, -3.156824, 1, 1, 1, 1, 1,
-0.4666474, 1.109302, -1.971729, 1, 1, 1, 1, 1,
-0.4651512, -0.4664561, -2.454337, 0, 0, 1, 1, 1,
-0.4624424, 0.2223273, 0.2402381, 1, 0, 0, 1, 1,
-0.4610226, 0.3001121, -3.14459, 1, 0, 0, 1, 1,
-0.4597766, 1.31893, -1.34362, 1, 0, 0, 1, 1,
-0.4577492, 2.345823, 0.3116312, 1, 0, 0, 1, 1,
-0.4533027, -0.6921066, -3.070105, 1, 0, 0, 1, 1,
-0.4525817, -0.1078237, -1.957036, 0, 0, 0, 1, 1,
-0.4521826, 0.3370783, -1.735771, 0, 0, 0, 1, 1,
-0.4476835, 0.2698022, -0.6842828, 0, 0, 0, 1, 1,
-0.44537, -0.7400265, -4.15304, 0, 0, 0, 1, 1,
-0.4400047, -2.342321, -3.507573, 0, 0, 0, 1, 1,
-0.4388584, 0.3054633, -1.446843, 0, 0, 0, 1, 1,
-0.4382271, -1.277829, -2.766359, 0, 0, 0, 1, 1,
-0.4378185, 1.373547, 1.062861, 1, 1, 1, 1, 1,
-0.4367163, 0.2809622, -0.2706764, 1, 1, 1, 1, 1,
-0.4290582, 0.8786597, -0.960229, 1, 1, 1, 1, 1,
-0.4256768, 1.557551, 1.011132, 1, 1, 1, 1, 1,
-0.4230898, -0.7188705, -0.9858912, 1, 1, 1, 1, 1,
-0.421501, 0.03586785, -0.8941392, 1, 1, 1, 1, 1,
-0.4180095, 1.221402, -0.4518306, 1, 1, 1, 1, 1,
-0.4110178, 0.9832906, -1.10935, 1, 1, 1, 1, 1,
-0.4089868, -0.5373263, -0.8373237, 1, 1, 1, 1, 1,
-0.4087707, 1.145301, -0.04750681, 1, 1, 1, 1, 1,
-0.4075159, -1.184044, -0.7003084, 1, 1, 1, 1, 1,
-0.404263, 1.129893, -0.1205974, 1, 1, 1, 1, 1,
-0.4014412, -0.9780571, -3.249111, 1, 1, 1, 1, 1,
-0.3983855, -2.160986, -3.453577, 1, 1, 1, 1, 1,
-0.3963357, -0.3076499, -2.192045, 1, 1, 1, 1, 1,
-0.389787, -0.1533747, -0.8289002, 0, 0, 1, 1, 1,
-0.3882139, -1.326389, -2.82751, 1, 0, 0, 1, 1,
-0.3873141, 0.5351798, -1.461241, 1, 0, 0, 1, 1,
-0.386676, -0.6914775, -3.178287, 1, 0, 0, 1, 1,
-0.3809368, 1.301476, -0.09314936, 1, 0, 0, 1, 1,
-0.3771474, -1.544495, -2.862355, 1, 0, 0, 1, 1,
-0.3752975, -1.547154, -1.676147, 0, 0, 0, 1, 1,
-0.3734537, 0.3727778, -2.040615, 0, 0, 0, 1, 1,
-0.3688344, -1.196029, -1.971906, 0, 0, 0, 1, 1,
-0.3652591, 1.877058, 0.6686505, 0, 0, 0, 1, 1,
-0.3620361, 0.9319789, -0.4886678, 0, 0, 0, 1, 1,
-0.357962, -0.1509031, 0.3031661, 0, 0, 0, 1, 1,
-0.3576185, 1.825253, -1.623932, 0, 0, 0, 1, 1,
-0.354593, 0.9925786, -0.6672583, 1, 1, 1, 1, 1,
-0.35436, 0.9100636, -0.1515909, 1, 1, 1, 1, 1,
-0.3537213, -0.8838114, -4.487175, 1, 1, 1, 1, 1,
-0.3505723, -1.302348, -3.049559, 1, 1, 1, 1, 1,
-0.3501577, -0.5379366, -2.124691, 1, 1, 1, 1, 1,
-0.347753, -0.3292441, -2.604516, 1, 1, 1, 1, 1,
-0.340758, 0.1380954, -1.132729, 1, 1, 1, 1, 1,
-0.3407169, -2.224165, -4.014931, 1, 1, 1, 1, 1,
-0.3393919, -0.06625342, -2.94076, 1, 1, 1, 1, 1,
-0.3358141, 0.3122372, -1.324887, 1, 1, 1, 1, 1,
-0.3327313, 0.7972064, 0.6076878, 1, 1, 1, 1, 1,
-0.3320636, 0.9608806, -1.12595, 1, 1, 1, 1, 1,
-0.3318154, -0.9228187, -2.384042, 1, 1, 1, 1, 1,
-0.325966, 1.268192, -0.1862056, 1, 1, 1, 1, 1,
-0.3250238, -0.6757627, -4.105726, 1, 1, 1, 1, 1,
-0.3230343, 0.3627438, 0.3282157, 0, 0, 1, 1, 1,
-0.3194255, 1.273391, -1.862404, 1, 0, 0, 1, 1,
-0.3180734, -0.04850269, -1.173964, 1, 0, 0, 1, 1,
-0.3176028, -0.32138, -2.133906, 1, 0, 0, 1, 1,
-0.3125401, 0.7781886, -0.0792277, 1, 0, 0, 1, 1,
-0.3098051, 0.7322825, -0.06914721, 1, 0, 0, 1, 1,
-0.3093755, 0.9396964, -1.018902, 0, 0, 0, 1, 1,
-0.3063968, -0.6049564, -3.986702, 0, 0, 0, 1, 1,
-0.3023767, 0.4708353, -0.6931038, 0, 0, 0, 1, 1,
-0.2984577, 0.9587967, 0.112859, 0, 0, 0, 1, 1,
-0.2922774, 0.2595271, -1.968395, 0, 0, 0, 1, 1,
-0.2920741, -0.3387389, -3.163191, 0, 0, 0, 1, 1,
-0.2885643, 0.177924, 0.3776678, 0, 0, 0, 1, 1,
-0.2879799, -0.9271134, -1.388707, 1, 1, 1, 1, 1,
-0.2879602, -1.924862, -2.76882, 1, 1, 1, 1, 1,
-0.2867598, -0.7037988, -2.141375, 1, 1, 1, 1, 1,
-0.2857921, 2.033303, 0.4808422, 1, 1, 1, 1, 1,
-0.2852285, 2.250587, -1.93277, 1, 1, 1, 1, 1,
-0.2834023, 0.2240002, -0.452588, 1, 1, 1, 1, 1,
-0.2823892, -0.466711, -0.9025024, 1, 1, 1, 1, 1,
-0.2823668, 0.6590013, -0.3985063, 1, 1, 1, 1, 1,
-0.2738481, 0.2513438, -0.982581, 1, 1, 1, 1, 1,
-0.2714649, -0.510479, -2.980824, 1, 1, 1, 1, 1,
-0.2684674, -1.839571, -0.2662064, 1, 1, 1, 1, 1,
-0.2670906, 2.029744, 0.5130158, 1, 1, 1, 1, 1,
-0.2639115, 0.001399577, -1.536579, 1, 1, 1, 1, 1,
-0.2624111, 0.1974252, -1.305435, 1, 1, 1, 1, 1,
-0.2620976, 0.5484251, -0.7673259, 1, 1, 1, 1, 1,
-0.261905, 0.3814791, 0.1032416, 0, 0, 1, 1, 1,
-0.2612424, -0.155774, -2.798324, 1, 0, 0, 1, 1,
-0.2501193, -0.2150665, -0.8009946, 1, 0, 0, 1, 1,
-0.2477777, 0.95389, -0.1676655, 1, 0, 0, 1, 1,
-0.2467246, 0.4596382, -0.09718239, 1, 0, 0, 1, 1,
-0.2443102, 0.2684891, -0.9665725, 1, 0, 0, 1, 1,
-0.2426335, -1.049103, -1.812463, 0, 0, 0, 1, 1,
-0.2285374, 0.4914368, 0.04349427, 0, 0, 0, 1, 1,
-0.2236235, 0.2743113, -0.7872232, 0, 0, 0, 1, 1,
-0.2199424, 1.127861, 0.9807348, 0, 0, 0, 1, 1,
-0.2192416, 0.2697346, -0.1299144, 0, 0, 0, 1, 1,
-0.2146639, 0.7191414, -0.315246, 0, 0, 0, 1, 1,
-0.2111295, -0.1689514, -0.4470818, 0, 0, 0, 1, 1,
-0.2042798, -0.06112533, -2.677101, 1, 1, 1, 1, 1,
-0.2039691, 1.730829, -1.14676, 1, 1, 1, 1, 1,
-0.2027414, -0.9560834, -1.45396, 1, 1, 1, 1, 1,
-0.2019014, -0.1220118, -0.09883641, 1, 1, 1, 1, 1,
-0.2015015, -0.1525124, -2.943073, 1, 1, 1, 1, 1,
-0.199752, 0.3620783, 1.214748, 1, 1, 1, 1, 1,
-0.1947671, -0.1891712, -2.043645, 1, 1, 1, 1, 1,
-0.1942061, 0.5304398, -1.497681, 1, 1, 1, 1, 1,
-0.1920496, -2.200619, -4.996689, 1, 1, 1, 1, 1,
-0.1896446, 0.8069927, -2.358231, 1, 1, 1, 1, 1,
-0.1896316, -0.8599433, -2.384959, 1, 1, 1, 1, 1,
-0.1879184, 0.356492, 0.1106834, 1, 1, 1, 1, 1,
-0.1844698, -1.358012, -2.394893, 1, 1, 1, 1, 1,
-0.1810681, -0.09071189, -3.090347, 1, 1, 1, 1, 1,
-0.1762895, -0.9855922, -3.187779, 1, 1, 1, 1, 1,
-0.1724, -1.303855, -4.951038, 0, 0, 1, 1, 1,
-0.1690571, 1.118913, 1.77942, 1, 0, 0, 1, 1,
-0.1687417, 0.7222801, -0.06398875, 1, 0, 0, 1, 1,
-0.1672364, 0.5183875, -3.565141, 1, 0, 0, 1, 1,
-0.1670119, -0.3856267, -2.962473, 1, 0, 0, 1, 1,
-0.1661999, 0.07355922, 0.3227825, 1, 0, 0, 1, 1,
-0.1645674, 0.4829595, 1.706918, 0, 0, 0, 1, 1,
-0.1644349, 0.9044031, 0.3801421, 0, 0, 0, 1, 1,
-0.1611113, -1.776954, -2.598038, 0, 0, 0, 1, 1,
-0.15843, -0.8308551, -3.128477, 0, 0, 0, 1, 1,
-0.1533926, -1.892417, -2.191496, 0, 0, 0, 1, 1,
-0.1533395, 1.031852, 0.2152604, 0, 0, 0, 1, 1,
-0.1522291, 1.022588, -0.5279506, 0, 0, 0, 1, 1,
-0.1507979, -0.03800113, -1.649076, 1, 1, 1, 1, 1,
-0.1507226, 0.6522942, -2.157557, 1, 1, 1, 1, 1,
-0.1428376, -0.1480774, -1.084478, 1, 1, 1, 1, 1,
-0.1416392, -1.547668, -1.617454, 1, 1, 1, 1, 1,
-0.1266259, 1.351541, -0.5475401, 1, 1, 1, 1, 1,
-0.1246424, -0.7804344, -1.755784, 1, 1, 1, 1, 1,
-0.1236134, 0.1595044, -1.766889, 1, 1, 1, 1, 1,
-0.1190778, 0.4199564, -0.6762823, 1, 1, 1, 1, 1,
-0.113196, 1.897651, -1.036261, 1, 1, 1, 1, 1,
-0.1080112, 1.721518, 0.5610967, 1, 1, 1, 1, 1,
-0.107363, 1.419295, -0.1525324, 1, 1, 1, 1, 1,
-0.1063146, -1.110332, -2.414177, 1, 1, 1, 1, 1,
-0.1041543, -2.240431, -4.602016, 1, 1, 1, 1, 1,
-0.1019535, 0.9138584, -0.2341177, 1, 1, 1, 1, 1,
-0.09775679, -2.178987, -2.26599, 1, 1, 1, 1, 1,
-0.09061538, -0.3664507, -1.96007, 0, 0, 1, 1, 1,
-0.0898504, -0.6309341, -4.91703, 1, 0, 0, 1, 1,
-0.08801504, -0.6367939, -2.176627, 1, 0, 0, 1, 1,
-0.08692412, -0.3689123, -3.078881, 1, 0, 0, 1, 1,
-0.08620591, 0.16702, 0.2483821, 1, 0, 0, 1, 1,
-0.08604912, 0.2871206, -0.8991501, 1, 0, 0, 1, 1,
-0.08509903, -1.740042, -2.721249, 0, 0, 0, 1, 1,
-0.0848714, -1.548714, -0.9761096, 0, 0, 0, 1, 1,
-0.08381684, 0.5154189, 0.5566635, 0, 0, 0, 1, 1,
-0.08343601, 0.3637668, 0.626605, 0, 0, 0, 1, 1,
-0.08126345, -1.43159, -2.122472, 0, 0, 0, 1, 1,
-0.07776523, -0.9915696, -2.660645, 0, 0, 0, 1, 1,
-0.07703823, 1.123865, -0.1428193, 0, 0, 0, 1, 1,
-0.07585763, -0.2699707, -2.495075, 1, 1, 1, 1, 1,
-0.0741694, 0.8382051, -0.457533, 1, 1, 1, 1, 1,
-0.07266936, -0.7192298, -3.045447, 1, 1, 1, 1, 1,
-0.07063902, 1.161517, 1.334254, 1, 1, 1, 1, 1,
-0.05956388, -0.05826138, -3.575252, 1, 1, 1, 1, 1,
-0.05620424, 0.6216327, -0.4023858, 1, 1, 1, 1, 1,
-0.05394838, -0.282957, -2.035505, 1, 1, 1, 1, 1,
-0.05226805, 1.289737, -0.06320468, 1, 1, 1, 1, 1,
-0.04973726, -0.5041285, -3.561754, 1, 1, 1, 1, 1,
-0.04970025, -0.5774534, -1.941317, 1, 1, 1, 1, 1,
-0.04936223, -0.5269991, -3.717328, 1, 1, 1, 1, 1,
-0.04841342, -1.173386, -4.198115, 1, 1, 1, 1, 1,
-0.04737541, 1.338025, 0.7461451, 1, 1, 1, 1, 1,
-0.04623409, 0.8222944, -1.049555, 1, 1, 1, 1, 1,
-0.04476091, 1.243351, -0.9520936, 1, 1, 1, 1, 1,
-0.04369262, -1.88164, -2.634444, 0, 0, 1, 1, 1,
-0.04301677, 0.4662044, 0.8272017, 1, 0, 0, 1, 1,
-0.04114061, 0.5204818, -0.02692686, 1, 0, 0, 1, 1,
-0.03972575, -0.6734213, -5.068168, 1, 0, 0, 1, 1,
-0.03625381, 1.026741, 0.5020006, 1, 0, 0, 1, 1,
-0.03582371, -0.3351192, -5.446216, 1, 0, 0, 1, 1,
-0.03431547, 1.501367, 1.147479, 0, 0, 0, 1, 1,
-0.02995316, -0.6275733, -3.423845, 0, 0, 0, 1, 1,
-0.02962108, 1.703667, -0.5181718, 0, 0, 0, 1, 1,
-0.02688834, 1.073728, -0.4265717, 0, 0, 0, 1, 1,
-0.02572667, 1.096565, 1.786836, 0, 0, 0, 1, 1,
-0.02431845, 0.1384623, 0.8681325, 0, 0, 0, 1, 1,
-0.0232969, 0.01192508, -1.55582, 0, 0, 0, 1, 1,
-0.02258572, 0.3544149, 1.592982, 1, 1, 1, 1, 1,
-0.00511064, 0.909989, 0.9320745, 1, 1, 1, 1, 1,
-0.003112928, -0.5398744, -2.900089, 1, 1, 1, 1, 1,
-0.002265467, 0.8140225, -1.020663, 1, 1, 1, 1, 1,
-0.002074967, 2.121821, -0.5963662, 1, 1, 1, 1, 1,
0.001546679, -0.4908139, 4.692749, 1, 1, 1, 1, 1,
0.005130121, -0.376775, 3.590919, 1, 1, 1, 1, 1,
0.007301948, 0.04351003, 0.09044082, 1, 1, 1, 1, 1,
0.01298906, 0.8724077, 0.05531124, 1, 1, 1, 1, 1,
0.01413136, -1.868363, 2.612061, 1, 1, 1, 1, 1,
0.01892788, -0.2833496, 3.44863, 1, 1, 1, 1, 1,
0.02053687, -0.8964419, 2.396737, 1, 1, 1, 1, 1,
0.02380265, 0.06056076, 0.6268793, 1, 1, 1, 1, 1,
0.02727376, -0.5973033, 1.764892, 1, 1, 1, 1, 1,
0.02926352, 0.960017, 1.749209, 1, 1, 1, 1, 1,
0.03032531, 1.40841, 0.4430551, 0, 0, 1, 1, 1,
0.0320872, -1.250024, 2.597411, 1, 0, 0, 1, 1,
0.03518347, 1.079559, 0.07656612, 1, 0, 0, 1, 1,
0.03675259, -0.738023, 3.482837, 1, 0, 0, 1, 1,
0.03933292, -0.5155861, 3.184329, 1, 0, 0, 1, 1,
0.04039525, 0.8119927, -1.177107, 1, 0, 0, 1, 1,
0.04191923, -0.8152204, 2.399797, 0, 0, 0, 1, 1,
0.05065266, 0.7788004, -1.193197, 0, 0, 0, 1, 1,
0.05862071, 1.219963, -0.5275982, 0, 0, 0, 1, 1,
0.05967426, 1.412027, -0.7868169, 0, 0, 0, 1, 1,
0.06293663, -0.162772, 3.66949, 0, 0, 0, 1, 1,
0.06439324, 0.4467908, 0.09460167, 0, 0, 0, 1, 1,
0.06598078, 0.2208755, -0.3787345, 0, 0, 0, 1, 1,
0.06680092, -0.01839597, 2.121955, 1, 1, 1, 1, 1,
0.0691976, 2.404484, 0.5042988, 1, 1, 1, 1, 1,
0.07025231, -0.9702289, 3.151403, 1, 1, 1, 1, 1,
0.07219646, -1.36819, 4.371335, 1, 1, 1, 1, 1,
0.07252215, 1.98887, 1.113016, 1, 1, 1, 1, 1,
0.07296577, 0.4420975, 2.913078, 1, 1, 1, 1, 1,
0.08124177, 1.12975, 1.550074, 1, 1, 1, 1, 1,
0.08260075, -2.091022, 2.639583, 1, 1, 1, 1, 1,
0.08451846, -0.3071295, 4.003723, 1, 1, 1, 1, 1,
0.08556378, 1.593976, -1.600402, 1, 1, 1, 1, 1,
0.09078252, -0.03552001, 1.812075, 1, 1, 1, 1, 1,
0.09743637, 0.2316762, 1.793658, 1, 1, 1, 1, 1,
0.09844217, -0.4160701, 2.442621, 1, 1, 1, 1, 1,
0.0996136, -0.2042304, 3.658907, 1, 1, 1, 1, 1,
0.1004986, 0.4640096, -0.1296684, 1, 1, 1, 1, 1,
0.1041578, 0.02857544, 0.131622, 0, 0, 1, 1, 1,
0.1052097, -1.014521, 2.535572, 1, 0, 0, 1, 1,
0.1058658, 1.418801, -0.4442853, 1, 0, 0, 1, 1,
0.1080143, 0.4793811, 0.6583712, 1, 0, 0, 1, 1,
0.109086, 0.7606302, -0.3482164, 1, 0, 0, 1, 1,
0.1111033, -0.8843532, 3.567161, 1, 0, 0, 1, 1,
0.1142199, 0.04651225, 3.043344, 0, 0, 0, 1, 1,
0.1219161, 1.172563, 0.3214285, 0, 0, 0, 1, 1,
0.1219612, -0.4898863, 4.656106, 0, 0, 0, 1, 1,
0.1309088, -1.013558, 2.972078, 0, 0, 0, 1, 1,
0.1359258, 1.198439, 1.057202, 0, 0, 0, 1, 1,
0.1387538, 0.2418552, -1.159823, 0, 0, 0, 1, 1,
0.1402202, 0.06429782, 0.416339, 0, 0, 0, 1, 1,
0.1515354, -0.2303708, 3.101706, 1, 1, 1, 1, 1,
0.151962, -0.1620882, 1.276168, 1, 1, 1, 1, 1,
0.1532825, 0.1616376, 1.969144, 1, 1, 1, 1, 1,
0.1544332, -0.04435017, 2.831662, 1, 1, 1, 1, 1,
0.1566049, 0.05768143, 2.146198, 1, 1, 1, 1, 1,
0.1622841, -0.9380359, 3.603272, 1, 1, 1, 1, 1,
0.166542, 0.8868101, -0.9328246, 1, 1, 1, 1, 1,
0.1676535, 0.08478748, 0.3426552, 1, 1, 1, 1, 1,
0.1693401, -0.5718774, 3.611354, 1, 1, 1, 1, 1,
0.1703899, 0.3198249, 0.1257017, 1, 1, 1, 1, 1,
0.1713751, 1.631368, 1.992285, 1, 1, 1, 1, 1,
0.1748324, -0.4609537, 2.584196, 1, 1, 1, 1, 1,
0.1752035, -2.381757, 3.624365, 1, 1, 1, 1, 1,
0.1763245, -1.122648, 3.920698, 1, 1, 1, 1, 1,
0.1770308, -0.2770858, 4.041667, 1, 1, 1, 1, 1,
0.1772475, 3.024634, 0.1951139, 0, 0, 1, 1, 1,
0.1773217, 0.6125627, 1.500848, 1, 0, 0, 1, 1,
0.1835642, 1.555074, 1.443305, 1, 0, 0, 1, 1,
0.1840162, 1.888173, -0.7808745, 1, 0, 0, 1, 1,
0.1843131, -1.05089, 3.806922, 1, 0, 0, 1, 1,
0.1861108, -0.873828, 3.031561, 1, 0, 0, 1, 1,
0.1908183, -0.4666034, 2.111816, 0, 0, 0, 1, 1,
0.2038288, 0.965655, -0.63967, 0, 0, 0, 1, 1,
0.2071412, -0.3952878, 3.544098, 0, 0, 0, 1, 1,
0.2155425, -0.771607, 3.368647, 0, 0, 0, 1, 1,
0.2161471, 0.5768713, 1.560207, 0, 0, 0, 1, 1,
0.2211099, -1.695953, 3.780508, 0, 0, 0, 1, 1,
0.2236957, 1.063321, 0.7851821, 0, 0, 0, 1, 1,
0.2246442, 0.5636289, -1.01847, 1, 1, 1, 1, 1,
0.2297737, 0.3891605, -0.4678577, 1, 1, 1, 1, 1,
0.2316826, 0.3820433, 0.7365749, 1, 1, 1, 1, 1,
0.2318828, 0.5331409, -0.7851124, 1, 1, 1, 1, 1,
0.2323533, -0.4234142, 3.670969, 1, 1, 1, 1, 1,
0.2368602, 1.818014, 0.4051541, 1, 1, 1, 1, 1,
0.2381974, 0.3237143, 1.235695, 1, 1, 1, 1, 1,
0.2390669, -0.7868834, 3.16097, 1, 1, 1, 1, 1,
0.2437449, 0.4619201, -0.1171218, 1, 1, 1, 1, 1,
0.2493501, -0.5958848, 2.074618, 1, 1, 1, 1, 1,
0.2513721, -0.06570165, 2.113593, 1, 1, 1, 1, 1,
0.2549624, -1.555395, 4.522179, 1, 1, 1, 1, 1,
0.2558739, -1.141237, 0.7789578, 1, 1, 1, 1, 1,
0.2565943, -1.314053, 3.292908, 1, 1, 1, 1, 1,
0.2573078, -0.7828314, 2.421583, 1, 1, 1, 1, 1,
0.2629666, -0.3290585, 1.312183, 0, 0, 1, 1, 1,
0.2660962, -0.2832749, 3.036775, 1, 0, 0, 1, 1,
0.2666647, 0.8987836, -0.3730507, 1, 0, 0, 1, 1,
0.2699713, -0.4822529, 2.192773, 1, 0, 0, 1, 1,
0.271489, 0.5190547, 0.5219014, 1, 0, 0, 1, 1,
0.2743733, -1.671788, 1.495273, 1, 0, 0, 1, 1,
0.2827868, -1.142504, 3.158273, 0, 0, 0, 1, 1,
0.2899513, -0.6511406, 3.281523, 0, 0, 0, 1, 1,
0.3023825, -1.304343, 3.358643, 0, 0, 0, 1, 1,
0.3060095, 0.9720701, 1.391381, 0, 0, 0, 1, 1,
0.3060183, 1.233649, 0.8314474, 0, 0, 0, 1, 1,
0.3070728, -0.7205659, 2.036109, 0, 0, 0, 1, 1,
0.3074206, 1.269776, 1.031073, 0, 0, 0, 1, 1,
0.3126565, 0.9628683, 1.733805, 1, 1, 1, 1, 1,
0.31492, 1.035309, -1.046697, 1, 1, 1, 1, 1,
0.3160654, 0.1490281, 1.066063, 1, 1, 1, 1, 1,
0.3164506, -0.1502343, 0.2269815, 1, 1, 1, 1, 1,
0.3171531, 0.7282528, 1.79581, 1, 1, 1, 1, 1,
0.3178852, -0.6073348, 0.2894054, 1, 1, 1, 1, 1,
0.3215252, -0.1084755, 1.735608, 1, 1, 1, 1, 1,
0.324589, 0.1822821, 1.197889, 1, 1, 1, 1, 1,
0.3251558, 0.2181459, 0.2090582, 1, 1, 1, 1, 1,
0.3343833, 0.8810424, 2.518728, 1, 1, 1, 1, 1,
0.3359563, 0.08524088, 0.9233446, 1, 1, 1, 1, 1,
0.3379131, -0.8960629, 3.68497, 1, 1, 1, 1, 1,
0.342719, 1.047787, -0.206667, 1, 1, 1, 1, 1,
0.3433866, 1.320494, -0.336834, 1, 1, 1, 1, 1,
0.3495035, -1.171489, 3.270875, 1, 1, 1, 1, 1,
0.3539407, -0.4840553, 3.549798, 0, 0, 1, 1, 1,
0.3539986, 0.4652007, -0.08248554, 1, 0, 0, 1, 1,
0.3556293, 1.519759, -0.1502463, 1, 0, 0, 1, 1,
0.3572744, -0.5390057, 4.746989, 1, 0, 0, 1, 1,
0.3596208, -0.1371595, 1.589839, 1, 0, 0, 1, 1,
0.3596227, 0.7925941, 2.241278, 1, 0, 0, 1, 1,
0.3601283, -0.2187953, 2.671999, 0, 0, 0, 1, 1,
0.369141, 1.446312, 1.52288, 0, 0, 0, 1, 1,
0.3703885, 0.4280739, -0.2150876, 0, 0, 0, 1, 1,
0.3739187, 1.46796, -0.05571155, 0, 0, 0, 1, 1,
0.3743419, -0.9686508, 5.158246, 0, 0, 0, 1, 1,
0.3748731, -1.182206, 3.587282, 0, 0, 0, 1, 1,
0.3772442, -1.215667, 2.245382, 0, 0, 0, 1, 1,
0.3817693, -0.1699179, 2.251194, 1, 1, 1, 1, 1,
0.3862631, -0.3317689, 2.902139, 1, 1, 1, 1, 1,
0.3954627, 0.6946318, 0.8279068, 1, 1, 1, 1, 1,
0.3963007, -1.840662, 2.065847, 1, 1, 1, 1, 1,
0.3991136, 0.1900317, 0.9400188, 1, 1, 1, 1, 1,
0.4017071, 0.04294666, 0.5523306, 1, 1, 1, 1, 1,
0.4079609, -0.1572612, 1.842574, 1, 1, 1, 1, 1,
0.408729, -0.9851841, 4.245854, 1, 1, 1, 1, 1,
0.4192407, 0.8612925, 2.102926, 1, 1, 1, 1, 1,
0.421905, 2.531817, 0.7258705, 1, 1, 1, 1, 1,
0.426579, 0.345302, 2.017138, 1, 1, 1, 1, 1,
0.4272005, 1.676147, -0.06361093, 1, 1, 1, 1, 1,
0.4276741, 0.5076823, 0.8916392, 1, 1, 1, 1, 1,
0.4306229, 1.480193, 0.5088937, 1, 1, 1, 1, 1,
0.4350447, -0.1289752, -0.1847779, 1, 1, 1, 1, 1,
0.4351193, -0.2245542, 0.4506784, 0, 0, 1, 1, 1,
0.4369991, -1.499422, 4.302445, 1, 0, 0, 1, 1,
0.4413512, -0.8948712, 2.799234, 1, 0, 0, 1, 1,
0.4429883, 0.6138128, -0.5279613, 1, 0, 0, 1, 1,
0.4439477, -0.05846045, 2.43261, 1, 0, 0, 1, 1,
0.4449432, 0.1600515, 2.193094, 1, 0, 0, 1, 1,
0.4457678, 0.870402, 1.83598, 0, 0, 0, 1, 1,
0.4484281, -0.697675, 2.539776, 0, 0, 0, 1, 1,
0.4485072, 0.7915084, 3.131871, 0, 0, 0, 1, 1,
0.4529091, 0.07328492, 1.419829, 0, 0, 0, 1, 1,
0.4534747, -0.8978569, 1.960787, 0, 0, 0, 1, 1,
0.4535006, 0.08875734, 3.675095, 0, 0, 0, 1, 1,
0.454677, 2.028937, 0.2464245, 0, 0, 0, 1, 1,
0.4577595, -0.1893645, 2.46121, 1, 1, 1, 1, 1,
0.4596069, 0.307338, 0.4997556, 1, 1, 1, 1, 1,
0.4611666, -0.2947406, 0.9312713, 1, 1, 1, 1, 1,
0.4618028, 0.2130233, 2.015628, 1, 1, 1, 1, 1,
0.4734564, 0.966997, 0.8556624, 1, 1, 1, 1, 1,
0.4778164, 0.1919793, 0.3124345, 1, 1, 1, 1, 1,
0.478655, 0.7174227, -1.144081, 1, 1, 1, 1, 1,
0.4789929, 0.07505762, 1.806251, 1, 1, 1, 1, 1,
0.4817486, -0.6544513, 2.207057, 1, 1, 1, 1, 1,
0.4833191, 1.529139, 0.3204191, 1, 1, 1, 1, 1,
0.4893214, -0.3494708, 2.375082, 1, 1, 1, 1, 1,
0.492061, -0.006004366, 1.070175, 1, 1, 1, 1, 1,
0.4932316, 0.4738772, 1.637839, 1, 1, 1, 1, 1,
0.4940139, -1.390495, 2.220184, 1, 1, 1, 1, 1,
0.503086, -1.484517, 2.364782, 1, 1, 1, 1, 1,
0.5118209, 0.8139648, 0.131967, 0, 0, 1, 1, 1,
0.5140491, -0.1783154, 2.737249, 1, 0, 0, 1, 1,
0.5167325, -0.06219793, 2.526029, 1, 0, 0, 1, 1,
0.518501, -0.5041698, 2.438176, 1, 0, 0, 1, 1,
0.5225894, -1.150304, 1.994903, 1, 0, 0, 1, 1,
0.5237569, 0.154567, 1.858628, 1, 0, 0, 1, 1,
0.5282353, -1.260665, 3.296679, 0, 0, 0, 1, 1,
0.5285276, 0.005596381, 1.553602, 0, 0, 0, 1, 1,
0.5301219, -0.8479622, 2.111162, 0, 0, 0, 1, 1,
0.533186, 1.434531, 1.195618, 0, 0, 0, 1, 1,
0.5351204, -0.4846568, 0.6692027, 0, 0, 0, 1, 1,
0.5378803, 1.76654, 0.6545947, 0, 0, 0, 1, 1,
0.5389351, 1.383142, 0.4035004, 0, 0, 0, 1, 1,
0.5417826, -0.7473598, 2.401116, 1, 1, 1, 1, 1,
0.5519483, -0.2378928, 0.6272291, 1, 1, 1, 1, 1,
0.5576667, -1.336849, 2.886787, 1, 1, 1, 1, 1,
0.5592954, 0.1532514, 3.327237, 1, 1, 1, 1, 1,
0.5627496, 0.2865845, 0.8246965, 1, 1, 1, 1, 1,
0.5646188, -0.2843408, 1.194551, 1, 1, 1, 1, 1,
0.5693321, 0.5213522, -0.508656, 1, 1, 1, 1, 1,
0.5760892, -0.9275433, 3.387798, 1, 1, 1, 1, 1,
0.5776569, -1.140377, 3.996091, 1, 1, 1, 1, 1,
0.5779988, -1.376541, 2.27582, 1, 1, 1, 1, 1,
0.5781687, 0.1429998, 2.509957, 1, 1, 1, 1, 1,
0.5854371, 0.5577064, 2.319323, 1, 1, 1, 1, 1,
0.5960932, 1.333362, 1.905632, 1, 1, 1, 1, 1,
0.59668, -2.516193, 3.218597, 1, 1, 1, 1, 1,
0.5994089, 0.4492559, -0.8653454, 1, 1, 1, 1, 1,
0.6021955, 0.321734, 0.6804742, 0, 0, 1, 1, 1,
0.6033408, -0.006555764, 1.931481, 1, 0, 0, 1, 1,
0.6072032, -0.330676, 2.840917, 1, 0, 0, 1, 1,
0.6089852, -0.09041822, 3.23941, 1, 0, 0, 1, 1,
0.6094131, -1.812107, 4.061122, 1, 0, 0, 1, 1,
0.6168165, 0.3319346, -0.5537736, 1, 0, 0, 1, 1,
0.6176052, 0.2510757, 2.0384, 0, 0, 0, 1, 1,
0.6214637, 0.7877204, 0.9345863, 0, 0, 0, 1, 1,
0.6235086, -0.5334043, 0.9591009, 0, 0, 0, 1, 1,
0.6239797, -0.1939271, 2.704085, 0, 0, 0, 1, 1,
0.6264929, -3.057008, 2.57254, 0, 0, 0, 1, 1,
0.6302011, -1.361263, 1.19665, 0, 0, 0, 1, 1,
0.6363575, 0.5233666, 1.005578, 0, 0, 0, 1, 1,
0.6412113, -0.05444317, 0.3971941, 1, 1, 1, 1, 1,
0.6468119, -1.384415, 1.97185, 1, 1, 1, 1, 1,
0.6494831, -0.2757038, 3.432492, 1, 1, 1, 1, 1,
0.654057, 0.528205, -0.6294891, 1, 1, 1, 1, 1,
0.6541291, -0.1301291, 1.190563, 1, 1, 1, 1, 1,
0.6564623, 0.5794241, 2.065967, 1, 1, 1, 1, 1,
0.6581394, -0.4459233, 0.690777, 1, 1, 1, 1, 1,
0.6619828, -0.3161006, 1.833228, 1, 1, 1, 1, 1,
0.6638893, -0.4325458, 2.859259, 1, 1, 1, 1, 1,
0.664162, 2.103415, -0.2831061, 1, 1, 1, 1, 1,
0.664293, -0.2063239, 1.455157, 1, 1, 1, 1, 1,
0.6650983, -0.5011985, 2.188353, 1, 1, 1, 1, 1,
0.6684038, -1.408385, 2.385934, 1, 1, 1, 1, 1,
0.6684344, -1.179642, 4.064781, 1, 1, 1, 1, 1,
0.6773679, -0.1118661, 0.6597401, 1, 1, 1, 1, 1,
0.6779501, 0.5351166, 0.6294494, 0, 0, 1, 1, 1,
0.6781797, -0.4813996, 3.198107, 1, 0, 0, 1, 1,
0.6783175, -1.673682, 3.070295, 1, 0, 0, 1, 1,
0.6791601, -0.6768881, 4.802621, 1, 0, 0, 1, 1,
0.6793917, 0.03681677, 0.1137867, 1, 0, 0, 1, 1,
0.6799861, 0.6713382, 2.244139, 1, 0, 0, 1, 1,
0.6858078, -0.3402433, 1.714678, 0, 0, 0, 1, 1,
0.6860822, 0.6252289, 0.8612553, 0, 0, 0, 1, 1,
0.686774, 0.4163366, 0.3808329, 0, 0, 0, 1, 1,
0.6884702, -0.5414861, -0.112571, 0, 0, 0, 1, 1,
0.6897259, 0.6331378, 0.2455381, 0, 0, 0, 1, 1,
0.6928421, 1.20529, 1.850359, 0, 0, 0, 1, 1,
0.6952977, -1.244316, 4.597414, 0, 0, 0, 1, 1,
0.6966256, -0.2687716, 1.613277, 1, 1, 1, 1, 1,
0.6989434, 0.1937297, 2.216136, 1, 1, 1, 1, 1,
0.6998217, -0.1338362, 0.1236285, 1, 1, 1, 1, 1,
0.7058159, 0.5121574, 1.27558, 1, 1, 1, 1, 1,
0.7094545, -0.02515094, 0.7498673, 1, 1, 1, 1, 1,
0.7112463, 1.244794, -0.616039, 1, 1, 1, 1, 1,
0.7129748, -0.5315491, 5.026899, 1, 1, 1, 1, 1,
0.7173985, -1.261153, 1.580006, 1, 1, 1, 1, 1,
0.7181591, 0.0843292, 1.026257, 1, 1, 1, 1, 1,
0.7186498, 0.4013701, 1.117686, 1, 1, 1, 1, 1,
0.7205741, -0.9212038, 3.575765, 1, 1, 1, 1, 1,
0.7238694, -0.5564789, 0.9272739, 1, 1, 1, 1, 1,
0.7241901, 0.3010092, 1.78483, 1, 1, 1, 1, 1,
0.7244775, 0.7155728, 2.038402, 1, 1, 1, 1, 1,
0.7255476, -0.04895419, 0.1694306, 1, 1, 1, 1, 1,
0.7269116, 0.6260026, 0.3855976, 0, 0, 1, 1, 1,
0.7292848, -1.376314, 1.871639, 1, 0, 0, 1, 1,
0.7376875, -1.681296, 1.421462, 1, 0, 0, 1, 1,
0.7393185, -0.6039041, 3.962958, 1, 0, 0, 1, 1,
0.7443464, 0.4624748, 2.401563, 1, 0, 0, 1, 1,
0.7448328, 2.134742, -1.189989, 1, 0, 0, 1, 1,
0.7452322, 0.6183729, 0.6384838, 0, 0, 0, 1, 1,
0.749614, 0.959571, 1.367726, 0, 0, 0, 1, 1,
0.7533994, 1.039544, 0.7268574, 0, 0, 0, 1, 1,
0.75418, 0.3593317, 1.61207, 0, 0, 0, 1, 1,
0.7564052, 0.8610216, 0.03353345, 0, 0, 0, 1, 1,
0.7643547, -1.645674, 3.285893, 0, 0, 0, 1, 1,
0.7730476, -0.4043145, 0.5030988, 0, 0, 0, 1, 1,
0.7747518, -0.5885272, 3.035305, 1, 1, 1, 1, 1,
0.7769063, -2.392039, 1.740028, 1, 1, 1, 1, 1,
0.7785113, 1.681876, -1.384572, 1, 1, 1, 1, 1,
0.7884017, -0.9767532, 0.7701617, 1, 1, 1, 1, 1,
0.7925382, -0.2147595, 0.210804, 1, 1, 1, 1, 1,
0.7964012, -0.008390539, 1.547878, 1, 1, 1, 1, 1,
0.7983065, 0.4286572, 1.104247, 1, 1, 1, 1, 1,
0.8034142, 0.319523, 2.031729, 1, 1, 1, 1, 1,
0.8063709, 0.7805923, 1.93473, 1, 1, 1, 1, 1,
0.8074418, -0.1859826, 1.601642, 1, 1, 1, 1, 1,
0.8108501, -1.169942, 2.539393, 1, 1, 1, 1, 1,
0.8116643, -0.2277888, 0.9935808, 1, 1, 1, 1, 1,
0.8132312, 0.2153494, 1.869327, 1, 1, 1, 1, 1,
0.8166972, -0.9255102, 2.052107, 1, 1, 1, 1, 1,
0.8221793, 0.8442363, 0.9305786, 1, 1, 1, 1, 1,
0.8281329, 0.514414, 2.050102, 0, 0, 1, 1, 1,
0.8289452, -0.08950682, 1.229209, 1, 0, 0, 1, 1,
0.8322457, 0.6867614, 2.397074, 1, 0, 0, 1, 1,
0.8333792, -1.200434, 2.494245, 1, 0, 0, 1, 1,
0.8341472, -0.3270661, 2.633836, 1, 0, 0, 1, 1,
0.8401405, -0.4303592, 1.974135, 1, 0, 0, 1, 1,
0.8454565, 0.7087282, 0.4707803, 0, 0, 0, 1, 1,
0.8465766, -0.9824384, 3.337809, 0, 0, 0, 1, 1,
0.8486712, -1.098654, 3.201969, 0, 0, 0, 1, 1,
0.8510311, 0.4650224, 0.07285449, 0, 0, 0, 1, 1,
0.8524331, 0.6910994, -0.3609123, 0, 0, 0, 1, 1,
0.8637436, -0.9127609, 1.958876, 0, 0, 0, 1, 1,
0.8669804, 0.8747597, 2.217623, 0, 0, 0, 1, 1,
0.8743291, 0.4413632, -0.1108771, 1, 1, 1, 1, 1,
0.8768479, -0.9714692, 4.023685, 1, 1, 1, 1, 1,
0.877139, 0.6874105, -0.008389367, 1, 1, 1, 1, 1,
0.8785186, 0.5645203, 0.869652, 1, 1, 1, 1, 1,
0.8793542, 0.7076302, 0.07128966, 1, 1, 1, 1, 1,
0.886912, -0.8922735, 4.381404, 1, 1, 1, 1, 1,
0.8941572, 0.5849978, 1.408754, 1, 1, 1, 1, 1,
0.8974066, -2.112661, 3.510525, 1, 1, 1, 1, 1,
0.8978322, -0.3098814, 2.80035, 1, 1, 1, 1, 1,
0.9042821, 1.556477, 0.7306258, 1, 1, 1, 1, 1,
0.904706, 0.1994433, 1.14347, 1, 1, 1, 1, 1,
0.9069305, -0.1481709, 3.449711, 1, 1, 1, 1, 1,
0.9073211, -0.3808944, 1.238751, 1, 1, 1, 1, 1,
0.9073827, 1.323457, 0.3740606, 1, 1, 1, 1, 1,
0.9075155, 0.4718553, 2.605157, 1, 1, 1, 1, 1,
0.9077648, 0.4936521, 2.161847, 0, 0, 1, 1, 1,
0.9107606, 0.954594, 2.715467, 1, 0, 0, 1, 1,
0.9116285, 2.010603, 1.096299, 1, 0, 0, 1, 1,
0.9167179, 0.1931016, 2.145859, 1, 0, 0, 1, 1,
0.9196772, 0.0006058631, 0.2660784, 1, 0, 0, 1, 1,
0.9212293, -0.08495026, 2.07772, 1, 0, 0, 1, 1,
0.9330475, -0.6870607, 1.505162, 0, 0, 0, 1, 1,
0.9472985, 0.7186158, 0.8744276, 0, 0, 0, 1, 1,
0.9486823, 0.2218186, 1.918831, 0, 0, 0, 1, 1,
0.9497111, -1.711374, 2.246704, 0, 0, 0, 1, 1,
0.955399, 1.189954, 1.601884, 0, 0, 0, 1, 1,
0.9578868, 1.508734, -1.029736, 0, 0, 0, 1, 1,
0.9588805, -0.343487, 1.139505, 0, 0, 0, 1, 1,
0.9598904, -0.9392747, 3.800288, 1, 1, 1, 1, 1,
0.9603517, 0.3560984, 2.821459, 1, 1, 1, 1, 1,
0.9611462, 0.4762771, -0.9465063, 1, 1, 1, 1, 1,
0.9648844, 0.1491016, 1.195206, 1, 1, 1, 1, 1,
0.9651715, -1.515471, 3.45779, 1, 1, 1, 1, 1,
0.9669988, 0.9553519, 1.124628, 1, 1, 1, 1, 1,
0.9676227, -0.03385924, 2.199234, 1, 1, 1, 1, 1,
0.9676473, 1.05695, 0.1373751, 1, 1, 1, 1, 1,
0.969159, -0.4585499, 2.380363, 1, 1, 1, 1, 1,
0.9701933, 1.016962, 0.7551882, 1, 1, 1, 1, 1,
0.9704824, 0.4166005, -0.02097879, 1, 1, 1, 1, 1,
0.9716052, -1.025784, 2.600375, 1, 1, 1, 1, 1,
0.9728017, 0.361423, 0.4706876, 1, 1, 1, 1, 1,
0.980573, 0.407586, -0.567619, 1, 1, 1, 1, 1,
0.985295, -0.7668989, 3.515455, 1, 1, 1, 1, 1,
0.9887907, -1.569509, 2.4957, 0, 0, 1, 1, 1,
0.9932062, 0.08796071, 2.236137, 1, 0, 0, 1, 1,
0.9940502, 1.954472, 0.6297925, 1, 0, 0, 1, 1,
1.005555, 1.026989, 0.03851346, 1, 0, 0, 1, 1,
1.007153, 1.427417, -0.9269835, 1, 0, 0, 1, 1,
1.011289, -1.405674, 2.819247, 1, 0, 0, 1, 1,
1.011495, 0.2509071, 1.03603, 0, 0, 0, 1, 1,
1.015501, -0.8906351, 2.485641, 0, 0, 0, 1, 1,
1.022276, 1.665584, -0.3902789, 0, 0, 0, 1, 1,
1.022277, -1.278915, 2.465075, 0, 0, 0, 1, 1,
1.025269, 0.4062708, 0.4312932, 0, 0, 0, 1, 1,
1.033335, 0.03363869, 2.477167, 0, 0, 0, 1, 1,
1.035609, 0.06915937, 1.268209, 0, 0, 0, 1, 1,
1.038193, 0.175788, 1.266906, 1, 1, 1, 1, 1,
1.040474, -0.967474, 2.326927, 1, 1, 1, 1, 1,
1.041867, 1.677608, -0.2050506, 1, 1, 1, 1, 1,
1.042243, 0.01718774, 2.093979, 1, 1, 1, 1, 1,
1.047779, 1.363292, -0.6808814, 1, 1, 1, 1, 1,
1.055542, 0.1601789, 0.1791891, 1, 1, 1, 1, 1,
1.072639, 1.607441, 0.8363294, 1, 1, 1, 1, 1,
1.075858, -0.1584747, 1.106354, 1, 1, 1, 1, 1,
1.078643, 0.6444446, 0.1520042, 1, 1, 1, 1, 1,
1.078879, -2.007223, 2.695582, 1, 1, 1, 1, 1,
1.08165, -1.101196, 2.952751, 1, 1, 1, 1, 1,
1.084466, -0.9585206, 4.078382, 1, 1, 1, 1, 1,
1.086974, -0.05992558, 0.6921661, 1, 1, 1, 1, 1,
1.091071, 0.2012566, 1.636587, 1, 1, 1, 1, 1,
1.094708, -0.3607528, 2.915839, 1, 1, 1, 1, 1,
1.094738, 0.02072913, 1.79749, 0, 0, 1, 1, 1,
1.105909, -0.4177945, 1.806258, 1, 0, 0, 1, 1,
1.124649, 0.1136036, 1.274251, 1, 0, 0, 1, 1,
1.125507, 0.5050195, 1.318777, 1, 0, 0, 1, 1,
1.130471, 0.2513888, 1.194424, 1, 0, 0, 1, 1,
1.135741, 1.089326, -0.1954664, 1, 0, 0, 1, 1,
1.140867, 1.896832, 0.9092651, 0, 0, 0, 1, 1,
1.1439, 1.904802, 0.9986963, 0, 0, 0, 1, 1,
1.144351, 0.7078897, 1.820675, 0, 0, 0, 1, 1,
1.150864, 1.722064, -0.9391385, 0, 0, 0, 1, 1,
1.154645, 0.5006995, 0.5410834, 0, 0, 0, 1, 1,
1.160311, 0.2257874, 0.5066133, 0, 0, 0, 1, 1,
1.168882, -0.254579, -0.1741077, 0, 0, 0, 1, 1,
1.192669, -1.040491, 2.375211, 1, 1, 1, 1, 1,
1.195063, -0.5108491, 2.322551, 1, 1, 1, 1, 1,
1.2151, -1.09127, 1.193165, 1, 1, 1, 1, 1,
1.218864, 0.4734325, -0.1741942, 1, 1, 1, 1, 1,
1.22177, 0.1530241, 0.6817018, 1, 1, 1, 1, 1,
1.222893, -0.1322168, 0.9511856, 1, 1, 1, 1, 1,
1.227175, -0.5936728, 1.501057, 1, 1, 1, 1, 1,
1.234212, 0.7157189, 0.7782397, 1, 1, 1, 1, 1,
1.239102, -0.2877117, 0.7514449, 1, 1, 1, 1, 1,
1.243196, 0.7042271, 3.46067, 1, 1, 1, 1, 1,
1.255992, -0.243374, 0.3688594, 1, 1, 1, 1, 1,
1.259197, 0.4044963, 0.6021413, 1, 1, 1, 1, 1,
1.275741, -0.5148213, 2.56698, 1, 1, 1, 1, 1,
1.279181, -0.1173817, 0.07124627, 1, 1, 1, 1, 1,
1.286193, 0.7209676, 0.5355654, 1, 1, 1, 1, 1,
1.289434, 0.5625433, 0.4748505, 0, 0, 1, 1, 1,
1.292833, -1.643402, 1.360759, 1, 0, 0, 1, 1,
1.293404, 0.9121318, 0.2437386, 1, 0, 0, 1, 1,
1.296268, -1.372471, 3.618406, 1, 0, 0, 1, 1,
1.300732, 0.6592119, 0.3588389, 1, 0, 0, 1, 1,
1.307228, 0.02954443, 1.44156, 1, 0, 0, 1, 1,
1.30752, 0.001713014, 1.61269, 0, 0, 0, 1, 1,
1.307743, -0.1548601, 2.419225, 0, 0, 0, 1, 1,
1.311858, 0.4808284, 1.291187, 0, 0, 0, 1, 1,
1.314785, -0.5235831, 0.7092353, 0, 0, 0, 1, 1,
1.318047, -0.8351013, 1.990373, 0, 0, 0, 1, 1,
1.318836, -0.562778, 1.884356, 0, 0, 0, 1, 1,
1.342606, -0.2212585, 1.82753, 0, 0, 0, 1, 1,
1.342629, -0.2405746, 1.575129, 1, 1, 1, 1, 1,
1.348827, -0.6154469, 1.175328, 1, 1, 1, 1, 1,
1.36094, 0.2331744, -1.200134, 1, 1, 1, 1, 1,
1.362759, -0.3980377, 2.439045, 1, 1, 1, 1, 1,
1.393661, -1.782901, 2.730397, 1, 1, 1, 1, 1,
1.406751, 0.2634715, 2.068533, 1, 1, 1, 1, 1,
1.408352, 1.091419, 0.189943, 1, 1, 1, 1, 1,
1.415587, 0.5044369, 1.24739, 1, 1, 1, 1, 1,
1.415884, 0.9642811, -0.1103863, 1, 1, 1, 1, 1,
1.417339, -1.760493, 1.688933, 1, 1, 1, 1, 1,
1.430634, 1.098877, -0.2335298, 1, 1, 1, 1, 1,
1.433888, 0.9543698, -0.2902039, 1, 1, 1, 1, 1,
1.437826, -1.030932, 1.95533, 1, 1, 1, 1, 1,
1.438088, 0.3563611, 3.387992, 1, 1, 1, 1, 1,
1.439051, -1.699386, 0.7966707, 1, 1, 1, 1, 1,
1.444127, 0.4527179, 1.613184, 0, 0, 1, 1, 1,
1.448891, 0.3658208, 0.3432973, 1, 0, 0, 1, 1,
1.454076, 0.04946315, 1.435229, 1, 0, 0, 1, 1,
1.459699, -2.590117, 2.755417, 1, 0, 0, 1, 1,
1.476296, -0.6643755, 2.551593, 1, 0, 0, 1, 1,
1.488979, -1.047756, 2.606425, 1, 0, 0, 1, 1,
1.489383, 0.3960907, 0.8674166, 0, 0, 0, 1, 1,
1.492921, 0.5155176, 1.211977, 0, 0, 0, 1, 1,
1.493006, -0.3217144, 2.953621, 0, 0, 0, 1, 1,
1.497812, -0.5216011, 2.698999, 0, 0, 0, 1, 1,
1.501029, 0.7416803, 0.576485, 0, 0, 0, 1, 1,
1.506307, 0.9552464, 1.613317, 0, 0, 0, 1, 1,
1.512467, 0.469852, 0.9677969, 0, 0, 0, 1, 1,
1.51528, 1.025249, 2.210992, 1, 1, 1, 1, 1,
1.51911, -0.6229258, 3.99244, 1, 1, 1, 1, 1,
1.521773, 0.5643813, 1.546334, 1, 1, 1, 1, 1,
1.525669, -0.6371534, 1.821132, 1, 1, 1, 1, 1,
1.530688, -0.1222787, 1.172954, 1, 1, 1, 1, 1,
1.541168, -0.3405939, 2.717352, 1, 1, 1, 1, 1,
1.553457, 0.5662611, 1.95753, 1, 1, 1, 1, 1,
1.565589, -0.0441114, 1.702428, 1, 1, 1, 1, 1,
1.576993, -0.5271126, 2.515243, 1, 1, 1, 1, 1,
1.578072, 0.4971969, 2.190192, 1, 1, 1, 1, 1,
1.583073, -2.113251, 3.28282, 1, 1, 1, 1, 1,
1.58741, -0.6264954, 2.620371, 1, 1, 1, 1, 1,
1.589857, 1.197191, -0.6202753, 1, 1, 1, 1, 1,
1.603933, 0.6654633, 2.28047, 1, 1, 1, 1, 1,
1.616153, -1.777924, 2.507296, 1, 1, 1, 1, 1,
1.648116, -1.721043, 3.592398, 0, 0, 1, 1, 1,
1.651061, 0.7896835, 1.825016, 1, 0, 0, 1, 1,
1.674103, 0.5788925, 1.508415, 1, 0, 0, 1, 1,
1.674952, 0.2658779, 2.063748, 1, 0, 0, 1, 1,
1.675864, 0.2516659, 1.741361, 1, 0, 0, 1, 1,
1.715178, 0.4548526, 0.01376954, 1, 0, 0, 1, 1,
1.725432, -1.476647, 3.61757, 0, 0, 0, 1, 1,
1.725719, 0.2894819, 1.630267, 0, 0, 0, 1, 1,
1.73538, 0.2419627, 0.3945392, 0, 0, 0, 1, 1,
1.756408, -0.351366, 1.806347, 0, 0, 0, 1, 1,
1.763073, -0.902104, 3.246562, 0, 0, 0, 1, 1,
1.770769, 0.9639758, 0.5452918, 0, 0, 0, 1, 1,
1.778733, -1.44559, 2.257403, 0, 0, 0, 1, 1,
1.786039, 0.9264845, 1.36314, 1, 1, 1, 1, 1,
1.809372, -0.9013941, 2.148136, 1, 1, 1, 1, 1,
1.825901, -1.593529, 3.215473, 1, 1, 1, 1, 1,
1.892739, 1.336593, 0.7949364, 1, 1, 1, 1, 1,
1.907723, -0.8759552, 3.62622, 1, 1, 1, 1, 1,
1.908844, -0.3510858, 3.32921, 1, 1, 1, 1, 1,
1.931951, 1.633274, 1.004484, 1, 1, 1, 1, 1,
1.935429, 0.3417953, 2.081764, 1, 1, 1, 1, 1,
1.937179, -0.9352795, 2.518138, 1, 1, 1, 1, 1,
1.962001, -1.147629, 2.654451, 1, 1, 1, 1, 1,
1.982621, -0.407921, 2.146333, 1, 1, 1, 1, 1,
1.988702, -0.4113881, 0.8673377, 1, 1, 1, 1, 1,
2.013062, 0.9456446, 1.4191, 1, 1, 1, 1, 1,
2.032555, -1.469703, 3.550708, 1, 1, 1, 1, 1,
2.034822, 0.4140833, 1.720394, 1, 1, 1, 1, 1,
2.045221, 1.521821, 2.043669, 0, 0, 1, 1, 1,
2.05531, -0.4842448, 1.116587, 1, 0, 0, 1, 1,
2.073629, 0.4806081, 0.2706358, 1, 0, 0, 1, 1,
2.082561, -0.2237503, 1.041583, 1, 0, 0, 1, 1,
2.157527, 0.112239, 2.570853, 1, 0, 0, 1, 1,
2.1684, 0.4143242, 2.100612, 1, 0, 0, 1, 1,
2.17647, 1.14856, 0.9900632, 0, 0, 0, 1, 1,
2.182852, -0.4779405, 1.164583, 0, 0, 0, 1, 1,
2.187636, 0.6529091, 2.110858, 0, 0, 0, 1, 1,
2.241791, 0.1732764, 2.198845, 0, 0, 0, 1, 1,
2.256339, 0.262961, 2.680629, 0, 0, 0, 1, 1,
2.270165, 0.5985613, 1.344464, 0, 0, 0, 1, 1,
2.270352, -0.3333963, 3.416144, 0, 0, 0, 1, 1,
2.337346, -1.156513, -0.3984148, 1, 1, 1, 1, 1,
2.377908, 0.4711003, 1.026985, 1, 1, 1, 1, 1,
2.641783, -0.4184321, 0.633753, 1, 1, 1, 1, 1,
2.671208, 1.288375, 2.114396, 1, 1, 1, 1, 1,
2.892476, -1.391339, 2.097322, 1, 1, 1, 1, 1,
2.998959, 0.4302344, 1.333829, 1, 1, 1, 1, 1,
3.157612, 0.1861777, 1.048732, 1, 1, 1, 1, 1
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
var radius = 9.372547;
var distance = 32.92067;
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
mvMatrix.translate( -0.2747633, 0.05432606, 0.1439853 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.92067);
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
