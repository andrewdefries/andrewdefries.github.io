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
-3.222713, -0.236827, -2.041822, 1, 0, 0, 1,
-3.043723, 1.081375, -1.523889, 1, 0.007843138, 0, 1,
-2.839947, 0.3343613, -1.981862, 1, 0.01176471, 0, 1,
-2.799157, -0.9521904, -2.325311, 1, 0.01960784, 0, 1,
-2.695784, -0.8718258, -2.334608, 1, 0.02352941, 0, 1,
-2.622704, -0.9108759, -2.27971, 1, 0.03137255, 0, 1,
-2.610972, 3.206688, -1.096882, 1, 0.03529412, 0, 1,
-2.556941, -1.810077, -1.803891, 1, 0.04313726, 0, 1,
-2.300854, -1.067053, -1.129044, 1, 0.04705882, 0, 1,
-2.297653, -0.1051495, -1.865663, 1, 0.05490196, 0, 1,
-2.211644, -0.7906515, -1.106582, 1, 0.05882353, 0, 1,
-2.185488, 0.02324544, -2.334204, 1, 0.06666667, 0, 1,
-2.167048, 0.5521384, -0.5884443, 1, 0.07058824, 0, 1,
-2.157372, 1.850386, -1.605418, 1, 0.07843138, 0, 1,
-2.092106, 0.5238594, -1.39874, 1, 0.08235294, 0, 1,
-2.075447, 1.535281, -0.5805667, 1, 0.09019608, 0, 1,
-2.072668, -0.03814811, -2.134038, 1, 0.09411765, 0, 1,
-2.062957, -0.869807, -2.195679, 1, 0.1019608, 0, 1,
-2.051081, 0.7481522, -1.113798, 1, 0.1098039, 0, 1,
-2.044175, -0.6110399, -1.925755, 1, 0.1137255, 0, 1,
-2.039462, -1.531026, -3.217101, 1, 0.1215686, 0, 1,
-2.039049, -0.5084539, -1.59506, 1, 0.1254902, 0, 1,
-2.035025, 1.1357, -2.807593, 1, 0.1333333, 0, 1,
-2.026067, -1.153322, -3.270539, 1, 0.1372549, 0, 1,
-2.015569, -1.019976, -0.7504553, 1, 0.145098, 0, 1,
-1.997396, -1.330108, -2.402381, 1, 0.1490196, 0, 1,
-1.992737, 1.224797, -1.650356, 1, 0.1568628, 0, 1,
-1.983316, 0.2126805, -1.857173, 1, 0.1607843, 0, 1,
-1.959611, -0.4167998, -1.443407, 1, 0.1686275, 0, 1,
-1.923032, -0.4515902, -2.81211, 1, 0.172549, 0, 1,
-1.862548, -0.3017805, -1.611949, 1, 0.1803922, 0, 1,
-1.856265, -1.295965, -1.971396, 1, 0.1843137, 0, 1,
-1.785718, -0.2403216, -1.600629, 1, 0.1921569, 0, 1,
-1.77249, -1.951486, -2.918463, 1, 0.1960784, 0, 1,
-1.771743, 0.2870611, -1.956489, 1, 0.2039216, 0, 1,
-1.765848, 0.8813539, -2.044282, 1, 0.2117647, 0, 1,
-1.758519, 0.1470523, 2.194844, 1, 0.2156863, 0, 1,
-1.751957, -0.2259448, -4.540137, 1, 0.2235294, 0, 1,
-1.741064, -0.1516402, -2.280087, 1, 0.227451, 0, 1,
-1.732838, 0.03771354, -1.462594, 1, 0.2352941, 0, 1,
-1.712307, -0.4343336, -1.237016, 1, 0.2392157, 0, 1,
-1.701079, -0.6585327, -2.718352, 1, 0.2470588, 0, 1,
-1.687936, -0.7485877, -1.56629, 1, 0.2509804, 0, 1,
-1.687007, 0.6350253, -0.5184385, 1, 0.2588235, 0, 1,
-1.685831, 0.2502427, -3.886343, 1, 0.2627451, 0, 1,
-1.659304, 1.165643, -0.9286891, 1, 0.2705882, 0, 1,
-1.650708, 0.8826751, 0.9649632, 1, 0.2745098, 0, 1,
-1.643731, 1.174983, -0.7722549, 1, 0.282353, 0, 1,
-1.638708, -0.04445934, -1.251153, 1, 0.2862745, 0, 1,
-1.633571, -0.310499, -1.032434, 1, 0.2941177, 0, 1,
-1.622789, -1.815974, -3.848103, 1, 0.3019608, 0, 1,
-1.622146, 1.15357, 0.5171264, 1, 0.3058824, 0, 1,
-1.60658, 0.2338201, 0.2068221, 1, 0.3137255, 0, 1,
-1.602658, -1.289732, -3.778223, 1, 0.3176471, 0, 1,
-1.602304, -0.9314991, 0.3821439, 1, 0.3254902, 0, 1,
-1.601747, -1.558172, -0.8022892, 1, 0.3294118, 0, 1,
-1.601284, 1.222126, -0.07360104, 1, 0.3372549, 0, 1,
-1.599337, 1.329961, -1.700065, 1, 0.3411765, 0, 1,
-1.592269, 0.08377159, -3.141262, 1, 0.3490196, 0, 1,
-1.590969, 0.20377, -2.107079, 1, 0.3529412, 0, 1,
-1.572582, -0.7729172, -1.872662, 1, 0.3607843, 0, 1,
-1.567835, -0.07991324, -3.057698, 1, 0.3647059, 0, 1,
-1.536984, -1.811242, -1.025553, 1, 0.372549, 0, 1,
-1.531871, 0.2669219, -0.1965107, 1, 0.3764706, 0, 1,
-1.531014, 1.971432, 0.9808336, 1, 0.3843137, 0, 1,
-1.505933, -1.854636, -1.623479, 1, 0.3882353, 0, 1,
-1.488525, -0.110908, -1.185573, 1, 0.3960784, 0, 1,
-1.482576, -0.2943347, 0.04600507, 1, 0.4039216, 0, 1,
-1.478218, 0.5483798, -1.028597, 1, 0.4078431, 0, 1,
-1.476128, 0.3303786, -0.9017055, 1, 0.4156863, 0, 1,
-1.469427, -1.390872, -1.891149, 1, 0.4196078, 0, 1,
-1.460439, -0.493366, -2.099273, 1, 0.427451, 0, 1,
-1.448273, -1.808348, -1.631243, 1, 0.4313726, 0, 1,
-1.441076, -0.1588539, -2.918965, 1, 0.4392157, 0, 1,
-1.43242, 0.2147336, -0.397644, 1, 0.4431373, 0, 1,
-1.426434, 0.8429805, 0.3967873, 1, 0.4509804, 0, 1,
-1.422375, -0.1146588, -2.415783, 1, 0.454902, 0, 1,
-1.422047, 1.136017, -1.104929, 1, 0.4627451, 0, 1,
-1.417202, 0.3601194, -1.681563, 1, 0.4666667, 0, 1,
-1.41529, -0.6644128, -1.63821, 1, 0.4745098, 0, 1,
-1.401572, 0.4773428, -2.495408, 1, 0.4784314, 0, 1,
-1.400802, -0.813879, 0.1709604, 1, 0.4862745, 0, 1,
-1.400164, 0.8666518, -0.4559499, 1, 0.4901961, 0, 1,
-1.396377, 0.4992114, -1.841372, 1, 0.4980392, 0, 1,
-1.388538, -1.928046, -2.550148, 1, 0.5058824, 0, 1,
-1.386463, 1.34284, -1.020234, 1, 0.509804, 0, 1,
-1.365445, 0.8973826, -1.63835, 1, 0.5176471, 0, 1,
-1.360624, 0.8596869, 0.1564277, 1, 0.5215687, 0, 1,
-1.359818, 0.192884, -2.435692, 1, 0.5294118, 0, 1,
-1.351148, 1.192514, -0.8962392, 1, 0.5333334, 0, 1,
-1.350593, -0.8413181, -2.995079, 1, 0.5411765, 0, 1,
-1.334909, -0.599994, -1.749273, 1, 0.5450981, 0, 1,
-1.329276, -0.9263966, -3.636472, 1, 0.5529412, 0, 1,
-1.329122, -0.8172673, -1.842665, 1, 0.5568628, 0, 1,
-1.326243, 1.845605, 0.3698573, 1, 0.5647059, 0, 1,
-1.313555, -0.2487603, -2.152111, 1, 0.5686275, 0, 1,
-1.31162, 0.4722072, -1.897722, 1, 0.5764706, 0, 1,
-1.308709, 1.641467, -0.6663566, 1, 0.5803922, 0, 1,
-1.294482, -0.02161329, -2.816119, 1, 0.5882353, 0, 1,
-1.292553, -1.501402, -1.699406, 1, 0.5921569, 0, 1,
-1.284522, -1.099598, -3.303303, 1, 0.6, 0, 1,
-1.279286, 0.09333442, -1.238555, 1, 0.6078432, 0, 1,
-1.269014, -0.7629165, -2.411787, 1, 0.6117647, 0, 1,
-1.255324, 1.735906, 0.9931402, 1, 0.6196079, 0, 1,
-1.247292, -1.33569, -1.622924, 1, 0.6235294, 0, 1,
-1.247034, -0.8695965, -1.616537, 1, 0.6313726, 0, 1,
-1.241165, -0.4057189, -0.4427488, 1, 0.6352941, 0, 1,
-1.240242, -0.09024777, -1.964313, 1, 0.6431373, 0, 1,
-1.234259, 0.2519255, -2.455085, 1, 0.6470588, 0, 1,
-1.231382, 0.5724579, -0.0825955, 1, 0.654902, 0, 1,
-1.2268, -0.4004445, -2.137366, 1, 0.6588235, 0, 1,
-1.213499, -0.7209977, -1.960564, 1, 0.6666667, 0, 1,
-1.212097, 0.7614927, 0.1416562, 1, 0.6705883, 0, 1,
-1.202507, -0.6831916, -1.847787, 1, 0.6784314, 0, 1,
-1.193749, -0.4740734, -0.3991479, 1, 0.682353, 0, 1,
-1.190661, 1.941534, 0.5556615, 1, 0.6901961, 0, 1,
-1.186962, 0.252192, -1.910162, 1, 0.6941177, 0, 1,
-1.1774, 0.0775618, -1.877183, 1, 0.7019608, 0, 1,
-1.16067, 0.05309829, -2.505966, 1, 0.7098039, 0, 1,
-1.15031, 0.5243252, -1.527285, 1, 0.7137255, 0, 1,
-1.149456, -0.1659291, -3.668843, 1, 0.7215686, 0, 1,
-1.147049, 1.257845, -1.328607, 1, 0.7254902, 0, 1,
-1.136214, 0.0969712, -1.946466, 1, 0.7333333, 0, 1,
-1.134483, -1.342417, -2.177361, 1, 0.7372549, 0, 1,
-1.132567, 1.016915, -1.531305, 1, 0.7450981, 0, 1,
-1.126976, 0.335478, -1.483632, 1, 0.7490196, 0, 1,
-1.124681, 1.269719, 0.8492894, 1, 0.7568628, 0, 1,
-1.124601, 0.9237458, -0.7059122, 1, 0.7607843, 0, 1,
-1.11656, 1.087878, -0.9851003, 1, 0.7686275, 0, 1,
-1.114918, -1.196863, -3.799886, 1, 0.772549, 0, 1,
-1.112624, -0.316992, -1.545049, 1, 0.7803922, 0, 1,
-1.108298, 0.3084413, -4.487293, 1, 0.7843137, 0, 1,
-1.103979, -0.7992151, -0.8053085, 1, 0.7921569, 0, 1,
-1.103952, -0.6671022, -1.696475, 1, 0.7960784, 0, 1,
-1.100428, -0.05255907, -2.725758, 1, 0.8039216, 0, 1,
-1.095844, -2.011491, -1.949489, 1, 0.8117647, 0, 1,
-1.089034, -0.09841296, -1.393785, 1, 0.8156863, 0, 1,
-1.086245, -2.062219, -3.541036, 1, 0.8235294, 0, 1,
-1.082416, 1.011726, -0.6084259, 1, 0.827451, 0, 1,
-1.076101, 2.069242, -0.2715368, 1, 0.8352941, 0, 1,
-1.075767, -0.6306759, -0.0003705465, 1, 0.8392157, 0, 1,
-1.072106, -0.7795574, -3.443519, 1, 0.8470588, 0, 1,
-1.071321, 1.905419, -0.08841971, 1, 0.8509804, 0, 1,
-1.070687, 3.252206, 0.261097, 1, 0.8588235, 0, 1,
-1.069916, 0.7739642, -3.482943, 1, 0.8627451, 0, 1,
-1.063384, 1.36242, -0.607901, 1, 0.8705882, 0, 1,
-1.051409, 1.481043, 0.4803331, 1, 0.8745098, 0, 1,
-1.048714, 0.1423237, 1.147112, 1, 0.8823529, 0, 1,
-1.043447, -1.153963, -1.579592, 1, 0.8862745, 0, 1,
-1.042071, -0.8149375, -1.608734, 1, 0.8941177, 0, 1,
-1.04098, -0.6793195, -3.354387, 1, 0.8980392, 0, 1,
-1.030125, -2.488226, -1.586122, 1, 0.9058824, 0, 1,
-1.025216, -1.015513, -2.581812, 1, 0.9137255, 0, 1,
-1.024013, -0.1293535, -1.980859, 1, 0.9176471, 0, 1,
-1.020232, 0.1362009, -1.18439, 1, 0.9254902, 0, 1,
-1.018719, 0.1312681, -0.6549606, 1, 0.9294118, 0, 1,
-1.017586, -1.852034, -2.991179, 1, 0.9372549, 0, 1,
-1.016356, -0.5853461, -2.050929, 1, 0.9411765, 0, 1,
-1.014001, 1.13472, -1.178046, 1, 0.9490196, 0, 1,
-1.012727, 0.4230038, -0.2552277, 1, 0.9529412, 0, 1,
-1.010612, 0.879253, -1.204973, 1, 0.9607843, 0, 1,
-1.010557, -2.118232, -3.72856, 1, 0.9647059, 0, 1,
-1.007817, -1.000158, -1.844261, 1, 0.972549, 0, 1,
-1.007021, 1.521373, 0.1929117, 1, 0.9764706, 0, 1,
-1.003095, -0.5788673, -1.845931, 1, 0.9843137, 0, 1,
-0.9994074, -1.602877, -2.494399, 1, 0.9882353, 0, 1,
-0.9987285, -0.4409142, -0.2663177, 1, 0.9960784, 0, 1,
-0.9985111, 0.07916404, -0.7267749, 0.9960784, 1, 0, 1,
-0.9947424, -0.8085178, -1.985765, 0.9921569, 1, 0, 1,
-0.9791781, -2.084983, -1.341609, 0.9843137, 1, 0, 1,
-0.9757023, 1.201649, -0.5727222, 0.9803922, 1, 0, 1,
-0.9668097, -0.95933, -1.903591, 0.972549, 1, 0, 1,
-0.9666838, 0.4391607, -0.8684102, 0.9686275, 1, 0, 1,
-0.9642187, -0.06620004, -0.5925876, 0.9607843, 1, 0, 1,
-0.9623628, 0.8465616, 1.319869, 0.9568627, 1, 0, 1,
-0.957673, 0.7235527, -0.07970518, 0.9490196, 1, 0, 1,
-0.9552913, 0.7179426, -0.9587588, 0.945098, 1, 0, 1,
-0.9551299, 1.037393, -0.8898816, 0.9372549, 1, 0, 1,
-0.9526149, 1.995205, -0.4634862, 0.9333333, 1, 0, 1,
-0.9417413, -0.8420925, -2.254413, 0.9254902, 1, 0, 1,
-0.9371309, 1.178124, 0.5110008, 0.9215686, 1, 0, 1,
-0.9349724, -0.1508929, -2.197236, 0.9137255, 1, 0, 1,
-0.9299917, 0.6170611, -2.268771, 0.9098039, 1, 0, 1,
-0.9239251, 0.4647863, 0.5370299, 0.9019608, 1, 0, 1,
-0.9153672, 0.2104185, -0.2995329, 0.8941177, 1, 0, 1,
-0.9117807, -0.7514362, -1.262283, 0.8901961, 1, 0, 1,
-0.910573, 0.1393559, -1.387772, 0.8823529, 1, 0, 1,
-0.9083771, 1.277376, -0.3198409, 0.8784314, 1, 0, 1,
-0.9077219, -0.5110453, -3.783821, 0.8705882, 1, 0, 1,
-0.9016815, 0.9160462, -0.005792874, 0.8666667, 1, 0, 1,
-0.8953536, -0.4920444, -1.740024, 0.8588235, 1, 0, 1,
-0.8935143, 0.5779117, -0.8480341, 0.854902, 1, 0, 1,
-0.8879261, 1.036277, -1.061028, 0.8470588, 1, 0, 1,
-0.8842977, 0.07826579, -1.756988, 0.8431373, 1, 0, 1,
-0.8822968, -0.09831405, 0.6764197, 0.8352941, 1, 0, 1,
-0.8779114, 1.425691, -1.71376, 0.8313726, 1, 0, 1,
-0.8761141, -0.0492815, -1.737564, 0.8235294, 1, 0, 1,
-0.8675249, -0.5002854, -2.831495, 0.8196079, 1, 0, 1,
-0.861929, 0.7326707, 1.259279, 0.8117647, 1, 0, 1,
-0.8580044, -1.841867, -2.419985, 0.8078431, 1, 0, 1,
-0.8517742, 2.184091, 0.2378869, 0.8, 1, 0, 1,
-0.8474472, -0.8176464, -3.438633, 0.7921569, 1, 0, 1,
-0.8464328, 0.2739483, -0.4901678, 0.7882353, 1, 0, 1,
-0.8462083, -1.65511, -5.212725, 0.7803922, 1, 0, 1,
-0.8351455, 0.2177465, -1.790581, 0.7764706, 1, 0, 1,
-0.8313106, -0.9222421, -0.8285065, 0.7686275, 1, 0, 1,
-0.8305394, -0.2090476, -0.6416138, 0.7647059, 1, 0, 1,
-0.829787, -1.924398, -1.298853, 0.7568628, 1, 0, 1,
-0.824782, 1.38574, -1.647084, 0.7529412, 1, 0, 1,
-0.8231204, -0.7844454, -1.732322, 0.7450981, 1, 0, 1,
-0.8229303, -0.3110558, -0.4089667, 0.7411765, 1, 0, 1,
-0.8228918, 1.4998, -0.6863429, 0.7333333, 1, 0, 1,
-0.822745, 0.1480715, -2.121073, 0.7294118, 1, 0, 1,
-0.8209479, -1.140589, -2.978643, 0.7215686, 1, 0, 1,
-0.8207421, 1.384866, 1.199299, 0.7176471, 1, 0, 1,
-0.8106643, -0.6760798, -1.366312, 0.7098039, 1, 0, 1,
-0.8021901, 2.002778, 0.2608179, 0.7058824, 1, 0, 1,
-0.7930948, 0.5751804, -1.103359, 0.6980392, 1, 0, 1,
-0.7928146, 0.04264126, -2.766829, 0.6901961, 1, 0, 1,
-0.7922181, 0.726742, 1.427792, 0.6862745, 1, 0, 1,
-0.774824, 0.02701521, -2.231789, 0.6784314, 1, 0, 1,
-0.7685241, -1.302257, -3.197872, 0.6745098, 1, 0, 1,
-0.7646062, -0.3554836, -3.125995, 0.6666667, 1, 0, 1,
-0.7641624, 0.6842098, -1.294563, 0.6627451, 1, 0, 1,
-0.759497, 0.3129558, -2.291038, 0.654902, 1, 0, 1,
-0.7469842, -0.5329081, -2.462212, 0.6509804, 1, 0, 1,
-0.7455868, -1.173036, -3.010445, 0.6431373, 1, 0, 1,
-0.7386204, -0.7268226, -2.405722, 0.6392157, 1, 0, 1,
-0.7374942, -1.808815, -3.526777, 0.6313726, 1, 0, 1,
-0.7352554, 0.4003091, -0.1004618, 0.627451, 1, 0, 1,
-0.7337356, 0.9440784, 0.1912117, 0.6196079, 1, 0, 1,
-0.7267171, 0.9096844, 0.2245315, 0.6156863, 1, 0, 1,
-0.7254733, -0.5452784, -1.755741, 0.6078432, 1, 0, 1,
-0.7213084, 2.310065, 0.1793941, 0.6039216, 1, 0, 1,
-0.7159836, -1.370633, -3.846916, 0.5960785, 1, 0, 1,
-0.7059674, -0.1704841, -1.03532, 0.5882353, 1, 0, 1,
-0.7025093, 0.1498336, -2.829737, 0.5843138, 1, 0, 1,
-0.7019373, 2.463182, 0.1724268, 0.5764706, 1, 0, 1,
-0.6990523, -0.06575617, -0.9158059, 0.572549, 1, 0, 1,
-0.6982059, -0.9997161, -2.16812, 0.5647059, 1, 0, 1,
-0.6954175, 0.6507347, -0.1479952, 0.5607843, 1, 0, 1,
-0.6910748, 0.769569, -0.9635348, 0.5529412, 1, 0, 1,
-0.6899318, 0.1972824, -1.794217, 0.5490196, 1, 0, 1,
-0.6824259, -0.1389158, -3.039445, 0.5411765, 1, 0, 1,
-0.6776797, 0.8331384, -0.8436241, 0.5372549, 1, 0, 1,
-0.6726879, 0.4638053, -0.8278128, 0.5294118, 1, 0, 1,
-0.6700255, 0.2745855, -1.745468, 0.5254902, 1, 0, 1,
-0.6690477, 1.425403, -1.211583, 0.5176471, 1, 0, 1,
-0.6653093, -0.9733458, -3.035743, 0.5137255, 1, 0, 1,
-0.6644399, -1.064853, -4.084607, 0.5058824, 1, 0, 1,
-0.6641181, -1.140796, -1.576697, 0.5019608, 1, 0, 1,
-0.6614809, -0.08651093, -3.73702, 0.4941176, 1, 0, 1,
-0.660292, -1.200574, -2.430109, 0.4862745, 1, 0, 1,
-0.6579683, 0.441213, -1.250344, 0.4823529, 1, 0, 1,
-0.6546211, -0.7567579, -3.900457, 0.4745098, 1, 0, 1,
-0.6493117, 1.085314, -0.3652264, 0.4705882, 1, 0, 1,
-0.6484101, -0.5556613, -0.9857691, 0.4627451, 1, 0, 1,
-0.6462124, 0.8473082, -1.494017, 0.4588235, 1, 0, 1,
-0.644433, 0.3315633, -2.275053, 0.4509804, 1, 0, 1,
-0.6441074, 1.311205, -1.145099, 0.4470588, 1, 0, 1,
-0.6412882, 0.03065837, -1.787171, 0.4392157, 1, 0, 1,
-0.6398166, 0.1357727, -2.20946, 0.4352941, 1, 0, 1,
-0.6393328, 1.692001, 0.2024672, 0.427451, 1, 0, 1,
-0.6280598, 0.7749358, -0.1463571, 0.4235294, 1, 0, 1,
-0.6278709, 0.589156, 0.48821, 0.4156863, 1, 0, 1,
-0.6276778, -1.114738, -1.26805, 0.4117647, 1, 0, 1,
-0.6245205, -3.393695, -2.734191, 0.4039216, 1, 0, 1,
-0.6219246, 1.539578, -0.8155314, 0.3960784, 1, 0, 1,
-0.621278, -1.128222, -2.166677, 0.3921569, 1, 0, 1,
-0.6159536, -0.6061814, -1.68663, 0.3843137, 1, 0, 1,
-0.6157147, 1.1422, -2.383966, 0.3803922, 1, 0, 1,
-0.608662, -0.4280357, -1.778455, 0.372549, 1, 0, 1,
-0.6084938, -0.002693281, -0.6299464, 0.3686275, 1, 0, 1,
-0.6083925, 0.495173, -1.624763, 0.3607843, 1, 0, 1,
-0.600566, 1.061451, -1.281455, 0.3568628, 1, 0, 1,
-0.5999334, 0.002849752, -1.992251, 0.3490196, 1, 0, 1,
-0.5997217, 1.431054, -0.8668936, 0.345098, 1, 0, 1,
-0.5984932, -1.131256, -1.2823, 0.3372549, 1, 0, 1,
-0.5980149, 0.3559206, -0.6644138, 0.3333333, 1, 0, 1,
-0.5948515, -1.36538, -4.743481, 0.3254902, 1, 0, 1,
-0.591634, 2.044878, -0.4233437, 0.3215686, 1, 0, 1,
-0.5898123, 0.4533722, -2.702936, 0.3137255, 1, 0, 1,
-0.5890685, -0.2439205, -1.732378, 0.3098039, 1, 0, 1,
-0.5887036, -0.2453329, -1.901544, 0.3019608, 1, 0, 1,
-0.5886613, 0.9813735, -0.9893911, 0.2941177, 1, 0, 1,
-0.5868948, -0.5898218, -2.880663, 0.2901961, 1, 0, 1,
-0.5848822, -0.136057, -1.345232, 0.282353, 1, 0, 1,
-0.5833342, 0.009203642, -3.174322, 0.2784314, 1, 0, 1,
-0.5830953, 0.3119031, 0.7437045, 0.2705882, 1, 0, 1,
-0.5816889, -0.07752201, -0.1223082, 0.2666667, 1, 0, 1,
-0.5808073, 0.2810991, -0.9426369, 0.2588235, 1, 0, 1,
-0.5783011, -1.605264, -2.527689, 0.254902, 1, 0, 1,
-0.5757865, 2.173599, 0.0791631, 0.2470588, 1, 0, 1,
-0.5674185, -1.173303, -2.659542, 0.2431373, 1, 0, 1,
-0.5647236, -1.532383, -3.148507, 0.2352941, 1, 0, 1,
-0.56258, 0.6933171, -1.348156, 0.2313726, 1, 0, 1,
-0.5569386, -0.02152246, -0.8426873, 0.2235294, 1, 0, 1,
-0.5480134, -0.8231707, -0.4361207, 0.2196078, 1, 0, 1,
-0.5439063, -0.7340538, -2.302851, 0.2117647, 1, 0, 1,
-0.5432777, -0.302549, -1.907375, 0.2078431, 1, 0, 1,
-0.5411367, -2.180556, -2.960171, 0.2, 1, 0, 1,
-0.5401218, -2.01703, -2.477373, 0.1921569, 1, 0, 1,
-0.5394704, -0.6576418, -4.079484, 0.1882353, 1, 0, 1,
-0.5279489, -0.2577497, 0.1461133, 0.1803922, 1, 0, 1,
-0.5267704, -0.159739, -1.642841, 0.1764706, 1, 0, 1,
-0.5188797, -0.5859615, -2.299692, 0.1686275, 1, 0, 1,
-0.5165858, -0.1944408, -1.1322, 0.1647059, 1, 0, 1,
-0.5153569, 0.7558528, -0.06344111, 0.1568628, 1, 0, 1,
-0.5103424, -1.8684, -2.423837, 0.1529412, 1, 0, 1,
-0.5098381, -1.692981, -2.950398, 0.145098, 1, 0, 1,
-0.5074033, -0.3254988, -1.588855, 0.1411765, 1, 0, 1,
-0.5047514, 0.8501139, -3.719256, 0.1333333, 1, 0, 1,
-0.5018818, 0.06265477, -1.864262, 0.1294118, 1, 0, 1,
-0.5014502, -0.8943511, -2.507257, 0.1215686, 1, 0, 1,
-0.4986581, 0.7335788, -0.4747394, 0.1176471, 1, 0, 1,
-0.4954593, -0.7826627, -3.321719, 0.1098039, 1, 0, 1,
-0.4923835, 0.3655915, -1.364679, 0.1058824, 1, 0, 1,
-0.4921145, 0.8905749, -1.538489, 0.09803922, 1, 0, 1,
-0.4892776, 1.065155, 0.6914267, 0.09019608, 1, 0, 1,
-0.4842956, -0.5041813, -2.203264, 0.08627451, 1, 0, 1,
-0.4820324, 0.7499382, -0.9001767, 0.07843138, 1, 0, 1,
-0.4803509, 0.2088216, 0.9933673, 0.07450981, 1, 0, 1,
-0.4751368, -0.3469239, -3.11774, 0.06666667, 1, 0, 1,
-0.4674496, 0.649413, -0.7464995, 0.0627451, 1, 0, 1,
-0.4608886, 0.2975603, -2.441137, 0.05490196, 1, 0, 1,
-0.4553522, -0.2540438, -1.293719, 0.05098039, 1, 0, 1,
-0.453533, -0.7163668, -1.351123, 0.04313726, 1, 0, 1,
-0.4516361, -1.140655, -2.994684, 0.03921569, 1, 0, 1,
-0.4513619, -1.958773, -3.539263, 0.03137255, 1, 0, 1,
-0.4512622, -1.563161, -2.037924, 0.02745098, 1, 0, 1,
-0.4467687, -2.494884, -2.740878, 0.01960784, 1, 0, 1,
-0.4451377, 0.9335763, -0.7008482, 0.01568628, 1, 0, 1,
-0.4391411, -0.8694222, -1.821822, 0.007843138, 1, 0, 1,
-0.4374043, 2.162284, -0.5857171, 0.003921569, 1, 0, 1,
-0.4372549, 0.1393094, -1.018307, 0, 1, 0.003921569, 1,
-0.4327725, 2.499672, -0.6647625, 0, 1, 0.01176471, 1,
-0.4324447, 1.685814, -0.7986974, 0, 1, 0.01568628, 1,
-0.4283226, 0.205968, -0.9640067, 0, 1, 0.02352941, 1,
-0.4236706, -0.1686902, -2.130877, 0, 1, 0.02745098, 1,
-0.4213726, 0.779573, -0.0477347, 0, 1, 0.03529412, 1,
-0.4170769, -2.175464, -2.415835, 0, 1, 0.03921569, 1,
-0.416068, -0.06373562, -0.1638293, 0, 1, 0.04705882, 1,
-0.4098764, 0.8131754, 0.2806541, 0, 1, 0.05098039, 1,
-0.4073162, -1.642717, -2.87044, 0, 1, 0.05882353, 1,
-0.4036785, -0.6103317, -2.09572, 0, 1, 0.0627451, 1,
-0.4030026, -1.102365, -1.913779, 0, 1, 0.07058824, 1,
-0.4024363, -1.609146, -2.792398, 0, 1, 0.07450981, 1,
-0.4006627, 0.5336538, -0.4597803, 0, 1, 0.08235294, 1,
-0.3987147, -0.3571054, -2.943644, 0, 1, 0.08627451, 1,
-0.3949004, -0.1400246, -2.195394, 0, 1, 0.09411765, 1,
-0.3936018, -0.03275165, -1.642692, 0, 1, 0.1019608, 1,
-0.3931953, -0.1917491, -2.48272, 0, 1, 0.1058824, 1,
-0.3930422, 1.504481, -0.7360045, 0, 1, 0.1137255, 1,
-0.3886434, -0.5150762, -4.40306, 0, 1, 0.1176471, 1,
-0.3851672, 1.606564, 0.7831185, 0, 1, 0.1254902, 1,
-0.3813184, -1.78301, -2.669016, 0, 1, 0.1294118, 1,
-0.3789042, -1.764989, -3.232092, 0, 1, 0.1372549, 1,
-0.377746, 0.4913339, 1.092, 0, 1, 0.1411765, 1,
-0.3756074, -0.1040802, -1.130105, 0, 1, 0.1490196, 1,
-0.373288, 1.413509, -0.9901371, 0, 1, 0.1529412, 1,
-0.3701364, -1.121806, -3.979196, 0, 1, 0.1607843, 1,
-0.363978, -0.3133557, -1.52936, 0, 1, 0.1647059, 1,
-0.3538697, -0.02036889, -1.667958, 0, 1, 0.172549, 1,
-0.3521161, -0.788892, -1.845895, 0, 1, 0.1764706, 1,
-0.3508917, 0.6002845, -2.303579, 0, 1, 0.1843137, 1,
-0.3486525, -1.930663, -3.476131, 0, 1, 0.1882353, 1,
-0.3449418, 0.1064772, -1.796508, 0, 1, 0.1960784, 1,
-0.3409606, 0.7705415, -0.8760864, 0, 1, 0.2039216, 1,
-0.3389609, 0.4735356, -1.170646, 0, 1, 0.2078431, 1,
-0.3377739, -0.4137928, -1.436594, 0, 1, 0.2156863, 1,
-0.3359848, -0.06522362, -0.7826595, 0, 1, 0.2196078, 1,
-0.3323025, 0.1460204, -1.350691, 0, 1, 0.227451, 1,
-0.3322419, -0.414067, -1.824537, 0, 1, 0.2313726, 1,
-0.3315445, 0.5549391, -0.052055, 0, 1, 0.2392157, 1,
-0.3305286, 0.6315504, -2.186665, 0, 1, 0.2431373, 1,
-0.3270972, 0.8522042, 1.012086, 0, 1, 0.2509804, 1,
-0.3263616, 0.6663049, -0.4281965, 0, 1, 0.254902, 1,
-0.3252321, 0.206557, -0.7272221, 0, 1, 0.2627451, 1,
-0.323483, -0.1174912, -1.593687, 0, 1, 0.2666667, 1,
-0.3230178, 1.76513, -1.05628, 0, 1, 0.2745098, 1,
-0.3191589, -0.9688671, -1.2879, 0, 1, 0.2784314, 1,
-0.3175496, -0.7876409, -1.779458, 0, 1, 0.2862745, 1,
-0.3095819, -0.2008045, -1.957093, 0, 1, 0.2901961, 1,
-0.3063138, -0.8055924, -1.71897, 0, 1, 0.2980392, 1,
-0.3058181, -0.6851918, -2.766118, 0, 1, 0.3058824, 1,
-0.3038953, 0.9098828, 0.2518986, 0, 1, 0.3098039, 1,
-0.3029987, 0.546133, -1.658379, 0, 1, 0.3176471, 1,
-0.3027305, -0.9085202, -1.864463, 0, 1, 0.3215686, 1,
-0.2981252, -0.7926554, -3.105522, 0, 1, 0.3294118, 1,
-0.2951621, -1.027431, -2.440464, 0, 1, 0.3333333, 1,
-0.2945052, -0.7203642, -1.764569, 0, 1, 0.3411765, 1,
-0.2908613, 0.03672549, -2.457477, 0, 1, 0.345098, 1,
-0.286433, -0.7191281, -2.709137, 0, 1, 0.3529412, 1,
-0.2857672, -0.2882284, -2.350412, 0, 1, 0.3568628, 1,
-0.2835466, 1.945101, -0.09383526, 0, 1, 0.3647059, 1,
-0.2807096, -0.5751738, -3.727281, 0, 1, 0.3686275, 1,
-0.2786421, 0.2613653, -0.7242784, 0, 1, 0.3764706, 1,
-0.2783869, -0.1172749, -3.45467, 0, 1, 0.3803922, 1,
-0.2775792, -0.5725707, -2.006875, 0, 1, 0.3882353, 1,
-0.276444, -0.5123391, -2.993067, 0, 1, 0.3921569, 1,
-0.2717672, 1.137498, 0.99574, 0, 1, 0.4, 1,
-0.271227, -1.385074, -2.886377, 0, 1, 0.4078431, 1,
-0.2695749, -0.7064283, -3.388757, 0, 1, 0.4117647, 1,
-0.264502, -0.3464489, -1.074295, 0, 1, 0.4196078, 1,
-0.2606557, -0.6587254, -3.407011, 0, 1, 0.4235294, 1,
-0.2596899, -1.209653, -2.938646, 0, 1, 0.4313726, 1,
-0.2571122, -0.09779778, -1.788446, 0, 1, 0.4352941, 1,
-0.2560359, 0.08891266, -1.645253, 0, 1, 0.4431373, 1,
-0.2529547, 0.2046524, -1.52155, 0, 1, 0.4470588, 1,
-0.2446937, -2.719635, -5.244644, 0, 1, 0.454902, 1,
-0.2444129, -0.4396552, -1.503461, 0, 1, 0.4588235, 1,
-0.2388002, 0.155125, -2.447, 0, 1, 0.4666667, 1,
-0.2343473, 1.453623, 1.319086, 0, 1, 0.4705882, 1,
-0.2343445, 0.523658, 0.6966025, 0, 1, 0.4784314, 1,
-0.2335583, -0.01833883, -1.053342, 0, 1, 0.4823529, 1,
-0.2332692, 0.6595607, 0.3417592, 0, 1, 0.4901961, 1,
-0.2311738, -0.07393609, -0.2435185, 0, 1, 0.4941176, 1,
-0.2291176, 0.9599395, -0.5439041, 0, 1, 0.5019608, 1,
-0.226314, -3.238861, -2.702696, 0, 1, 0.509804, 1,
-0.226263, -1.550618, -2.398599, 0, 1, 0.5137255, 1,
-0.2247774, -1.230387, -3.076661, 0, 1, 0.5215687, 1,
-0.2239578, 1.640323, 0.8621206, 0, 1, 0.5254902, 1,
-0.2213635, -2.239249, -1.352965, 0, 1, 0.5333334, 1,
-0.2182118, -2.12047, -2.271473, 0, 1, 0.5372549, 1,
-0.2175796, -0.8192145, -1.859354, 0, 1, 0.5450981, 1,
-0.213014, -0.760641, -5.483273, 0, 1, 0.5490196, 1,
-0.2115314, 0.7494732, 0.5137667, 0, 1, 0.5568628, 1,
-0.2096704, -2.049023, -1.739915, 0, 1, 0.5607843, 1,
-0.2095284, -0.3533499, -1.136124, 0, 1, 0.5686275, 1,
-0.2082766, 0.7907237, -1.415217, 0, 1, 0.572549, 1,
-0.2044031, 0.443761, 0.3223368, 0, 1, 0.5803922, 1,
-0.1990518, -0.2806476, 0.2751803, 0, 1, 0.5843138, 1,
-0.1936362, -0.4217647, -2.13672, 0, 1, 0.5921569, 1,
-0.1894278, -0.8989372, -2.039056, 0, 1, 0.5960785, 1,
-0.1893276, 0.4580512, -0.7661096, 0, 1, 0.6039216, 1,
-0.1881399, -1.15652, -4.078874, 0, 1, 0.6117647, 1,
-0.1880576, -0.3384164, -3.163112, 0, 1, 0.6156863, 1,
-0.1852733, 1.352555, 2.453879, 0, 1, 0.6235294, 1,
-0.1788794, 0.1833621, 0.5111575, 0, 1, 0.627451, 1,
-0.1763651, 0.3683952, -0.1853998, 0, 1, 0.6352941, 1,
-0.1758188, 0.6978182, -0.4216507, 0, 1, 0.6392157, 1,
-0.1754867, -1.703292, -1.661766, 0, 1, 0.6470588, 1,
-0.1738981, -0.2470303, -3.415182, 0, 1, 0.6509804, 1,
-0.1583777, 0.2148125, 0.8005136, 0, 1, 0.6588235, 1,
-0.1562043, 0.9867019, -1.218648, 0, 1, 0.6627451, 1,
-0.1539105, -0.5683532, -2.855457, 0, 1, 0.6705883, 1,
-0.1491227, 0.6070461, 0.1736535, 0, 1, 0.6745098, 1,
-0.148139, -0.2072947, -2.845854, 0, 1, 0.682353, 1,
-0.147255, 1.290985, 0.3622368, 0, 1, 0.6862745, 1,
-0.1445508, 1.14984, 0.03485506, 0, 1, 0.6941177, 1,
-0.1420826, -0.04409301, -1.817928, 0, 1, 0.7019608, 1,
-0.1404508, -2.991796, -4.3128, 0, 1, 0.7058824, 1,
-0.1378915, -0.9073972, -5.441656, 0, 1, 0.7137255, 1,
-0.1340236, 0.6925553, -0.998349, 0, 1, 0.7176471, 1,
-0.1331256, -1.26811, -3.372316, 0, 1, 0.7254902, 1,
-0.1319898, 1.902878, -0.977972, 0, 1, 0.7294118, 1,
-0.1312423, 0.3356007, 0.9023639, 0, 1, 0.7372549, 1,
-0.1284108, 1.45164, -1.621576, 0, 1, 0.7411765, 1,
-0.1259994, -1.241815, -5.08075, 0, 1, 0.7490196, 1,
-0.1257199, 0.647761, -0.5268642, 0, 1, 0.7529412, 1,
-0.1200664, 0.3311066, -2.268388, 0, 1, 0.7607843, 1,
-0.1191205, 0.4379587, 0.6769724, 0, 1, 0.7647059, 1,
-0.1162417, -0.3492509, -3.299064, 0, 1, 0.772549, 1,
-0.1161623, -1.437935, -1.684103, 0, 1, 0.7764706, 1,
-0.1142897, 0.5676763, -0.1100872, 0, 1, 0.7843137, 1,
-0.114257, -1.44323, -2.18089, 0, 1, 0.7882353, 1,
-0.1070724, -0.7566218, -1.337147, 0, 1, 0.7960784, 1,
-0.1038987, 0.548318, -0.6693213, 0, 1, 0.8039216, 1,
-0.1021587, -2.468375, -2.629101, 0, 1, 0.8078431, 1,
-0.09891195, -0.7106733, -1.982979, 0, 1, 0.8156863, 1,
-0.09687319, -0.5551394, -3.909745, 0, 1, 0.8196079, 1,
-0.09594487, 0.8434489, 0.669827, 0, 1, 0.827451, 1,
-0.09546574, 0.3540201, 0.5235299, 0, 1, 0.8313726, 1,
-0.09364477, -0.2936963, -4.03933, 0, 1, 0.8392157, 1,
-0.08848409, 1.362177, -0.7565266, 0, 1, 0.8431373, 1,
-0.08516321, 2.903773, 1.22113, 0, 1, 0.8509804, 1,
-0.0756508, -0.9232491, -3.46458, 0, 1, 0.854902, 1,
-0.07467584, 0.9866076, 0.2912714, 0, 1, 0.8627451, 1,
-0.07135732, 0.2378471, -1.240627, 0, 1, 0.8666667, 1,
-0.06893212, -0.3972066, -3.199449, 0, 1, 0.8745098, 1,
-0.06822052, 0.6622354, 1.703593, 0, 1, 0.8784314, 1,
-0.05677544, 0.4832076, -1.409769, 0, 1, 0.8862745, 1,
-0.05508775, -1.503054, -2.403979, 0, 1, 0.8901961, 1,
-0.05187587, -1.268133, -3.431315, 0, 1, 0.8980392, 1,
-0.04747659, -0.04173691, -3.511786, 0, 1, 0.9058824, 1,
-0.02683736, 0.5984725, 1.564784, 0, 1, 0.9098039, 1,
-0.0265504, -0.8402053, -3.262027, 0, 1, 0.9176471, 1,
-0.02392607, 0.1839721, 0.5550096, 0, 1, 0.9215686, 1,
-0.01920272, 0.00368468, -3.686198, 0, 1, 0.9294118, 1,
-0.01650875, -1.870144, -3.51053, 0, 1, 0.9333333, 1,
-0.01539352, 0.08121558, -1.959275, 0, 1, 0.9411765, 1,
-0.01107337, -0.8560363, -2.802433, 0, 1, 0.945098, 1,
-0.007351946, 0.2996461, -0.001779582, 0, 1, 0.9529412, 1,
-0.004473231, -0.4603119, -4.423573, 0, 1, 0.9568627, 1,
-0.003616173, -0.06767148, -2.454339, 0, 1, 0.9647059, 1,
-0.002173123, 0.05430875, -0.2640851, 0, 1, 0.9686275, 1,
-0.001593532, 0.1097233, 0.688661, 0, 1, 0.9764706, 1,
-0.0003179381, -1.820727, -1.335816, 0, 1, 0.9803922, 1,
0.00090081, -0.4778399, 3.692097, 0, 1, 0.9882353, 1,
0.001171016, 0.3149131, -1.080756, 0, 1, 0.9921569, 1,
0.006474022, 0.9862059, -0.5115323, 0, 1, 1, 1,
0.006798772, -0.8429751, 4.980283, 0, 0.9921569, 1, 1,
0.008120776, 2.50796, 0.5128995, 0, 0.9882353, 1, 1,
0.009825049, 0.1912249, 0.4138012, 0, 0.9803922, 1, 1,
0.01313713, 0.123754, 0.1170797, 0, 0.9764706, 1, 1,
0.01934988, 1.637329, -0.3200209, 0, 0.9686275, 1, 1,
0.0194156, -0.4440299, 3.567991, 0, 0.9647059, 1, 1,
0.01990025, 0.8317475, 0.6965258, 0, 0.9568627, 1, 1,
0.02687863, -0.3327076, 3.365666, 0, 0.9529412, 1, 1,
0.02752721, 1.939291, 0.4828718, 0, 0.945098, 1, 1,
0.03083247, 0.052187, 0.8854918, 0, 0.9411765, 1, 1,
0.03086374, 0.5559824, 0.8301287, 0, 0.9333333, 1, 1,
0.03243022, 0.2797337, 1.187397, 0, 0.9294118, 1, 1,
0.03363494, 1.223971, -0.0006279396, 0, 0.9215686, 1, 1,
0.0346274, -0.5144937, 4.952204, 0, 0.9176471, 1, 1,
0.04021912, 0.265255, 0.192647, 0, 0.9098039, 1, 1,
0.04124334, 0.6281199, 0.6578369, 0, 0.9058824, 1, 1,
0.04498359, -1.644882, 3.50975, 0, 0.8980392, 1, 1,
0.04645021, 0.9525182, 0.3322174, 0, 0.8901961, 1, 1,
0.04855338, 0.2105269, 0.2753734, 0, 0.8862745, 1, 1,
0.04933995, 0.4359635, 1.368022, 0, 0.8784314, 1, 1,
0.0508545, 2.588321, 1.18931, 0, 0.8745098, 1, 1,
0.05155096, 0.712226, -0.5048597, 0, 0.8666667, 1, 1,
0.05335578, -0.3674677, 2.633189, 0, 0.8627451, 1, 1,
0.05386096, -1.762296, 3.245456, 0, 0.854902, 1, 1,
0.05468479, -1.166934, 2.081914, 0, 0.8509804, 1, 1,
0.05707347, 1.084095, -1.15647, 0, 0.8431373, 1, 1,
0.05827861, 0.5018492, -1.621869, 0, 0.8392157, 1, 1,
0.06070221, -1.470397, 3.289092, 0, 0.8313726, 1, 1,
0.06256618, -0.4696325, 3.034528, 0, 0.827451, 1, 1,
0.06444404, 0.3884247, 0.5287353, 0, 0.8196079, 1, 1,
0.06965081, -0.4215317, 1.5386, 0, 0.8156863, 1, 1,
0.07079954, -0.9962314, 2.329644, 0, 0.8078431, 1, 1,
0.07216262, 1.4596, -1.667303, 0, 0.8039216, 1, 1,
0.07267215, -0.6997218, 1.816002, 0, 0.7960784, 1, 1,
0.07296605, -0.8925949, 4.120053, 0, 0.7882353, 1, 1,
0.07576186, 0.408604, 1.71822, 0, 0.7843137, 1, 1,
0.07910261, 1.245389, 0.3693198, 0, 0.7764706, 1, 1,
0.07992598, -1.463876, 3.75712, 0, 0.772549, 1, 1,
0.08063004, 0.8965887, -0.6683032, 0, 0.7647059, 1, 1,
0.08230629, -0.8335831, 2.907382, 0, 0.7607843, 1, 1,
0.08647603, 0.1641518, 0.3284821, 0, 0.7529412, 1, 1,
0.08688021, 0.2883279, 0.1774225, 0, 0.7490196, 1, 1,
0.09064271, 0.3034309, -0.2199438, 0, 0.7411765, 1, 1,
0.09072025, 1.406169, -1.974236, 0, 0.7372549, 1, 1,
0.09388301, 0.03146958, 0.9580727, 0, 0.7294118, 1, 1,
0.09419523, 1.081443, 1.007414, 0, 0.7254902, 1, 1,
0.09604444, -0.2887718, 3.3545, 0, 0.7176471, 1, 1,
0.09729727, -0.5354789, 3.663331, 0, 0.7137255, 1, 1,
0.09876017, 1.473933, 0.6044516, 0, 0.7058824, 1, 1,
0.09880338, -0.1999687, 2.435152, 0, 0.6980392, 1, 1,
0.09956147, -0.2588361, 3.695435, 0, 0.6941177, 1, 1,
0.1002537, 0.2584777, -0.5616637, 0, 0.6862745, 1, 1,
0.1036226, 0.6772201, 0.7378837, 0, 0.682353, 1, 1,
0.1042897, 1.222922, 0.5594558, 0, 0.6745098, 1, 1,
0.1079259, 0.2677772, 0.7559454, 0, 0.6705883, 1, 1,
0.1084283, -0.1707137, 1.997127, 0, 0.6627451, 1, 1,
0.125364, -1.202041, 3.65371, 0, 0.6588235, 1, 1,
0.1253835, 0.02242165, 3.138768, 0, 0.6509804, 1, 1,
0.1276399, 1.198555, -1.579555, 0, 0.6470588, 1, 1,
0.1287524, 0.2906526, -0.9801793, 0, 0.6392157, 1, 1,
0.1300347, 1.133455, 0.8063468, 0, 0.6352941, 1, 1,
0.1301023, 0.901738, 0.2488886, 0, 0.627451, 1, 1,
0.1320812, -1.420735, 2.806722, 0, 0.6235294, 1, 1,
0.1321044, 0.005367515, 1.851988, 0, 0.6156863, 1, 1,
0.1431715, 0.3741943, 0.8696599, 0, 0.6117647, 1, 1,
0.1452563, 2.479146, 0.2419079, 0, 0.6039216, 1, 1,
0.1519165, 1.089615, 0.2067093, 0, 0.5960785, 1, 1,
0.1597644, 1.814045, -0.3544357, 0, 0.5921569, 1, 1,
0.1599953, 0.7275848, 0.857505, 0, 0.5843138, 1, 1,
0.1604276, -0.8610045, 2.865543, 0, 0.5803922, 1, 1,
0.1641332, 0.2261734, 0.1175024, 0, 0.572549, 1, 1,
0.1668031, -0.1453621, 2.155961, 0, 0.5686275, 1, 1,
0.1676071, 0.4311688, 0.09910533, 0, 0.5607843, 1, 1,
0.1701001, -0.8312588, 1.683025, 0, 0.5568628, 1, 1,
0.1729911, -1.516036, 1.722654, 0, 0.5490196, 1, 1,
0.1744651, -0.2672526, 3.041658, 0, 0.5450981, 1, 1,
0.1782431, -1.366779, 1.709087, 0, 0.5372549, 1, 1,
0.179766, 0.5475464, 0.4905026, 0, 0.5333334, 1, 1,
0.1800589, -1.382343, 1.918058, 0, 0.5254902, 1, 1,
0.1809892, 1.969121, 0.815286, 0, 0.5215687, 1, 1,
0.1835838, 0.9835708, 1.215027, 0, 0.5137255, 1, 1,
0.1853585, 0.06312629, 2.791466, 0, 0.509804, 1, 1,
0.1874143, 0.72068, 0.9762135, 0, 0.5019608, 1, 1,
0.1923711, 1.466268, -0.7407987, 0, 0.4941176, 1, 1,
0.1944521, 1.665906, 0.5403417, 0, 0.4901961, 1, 1,
0.1994565, -0.4066681, 1.208792, 0, 0.4823529, 1, 1,
0.2005124, -0.9211421, 1.853289, 0, 0.4784314, 1, 1,
0.2008763, -1.61479, 2.947115, 0, 0.4705882, 1, 1,
0.2019397, 0.3135129, 0.6379347, 0, 0.4666667, 1, 1,
0.2019825, -0.5581024, 0.7567816, 0, 0.4588235, 1, 1,
0.2043905, 0.269115, -1.042374, 0, 0.454902, 1, 1,
0.2118464, 1.713772, 0.3914187, 0, 0.4470588, 1, 1,
0.2119766, 0.562178, 0.6154639, 0, 0.4431373, 1, 1,
0.212594, -2.233287, 2.856786, 0, 0.4352941, 1, 1,
0.2130402, 0.9847254, 0.01605872, 0, 0.4313726, 1, 1,
0.2148273, 2.042716, 0.4288907, 0, 0.4235294, 1, 1,
0.2210109, 0.5826422, -1.190545, 0, 0.4196078, 1, 1,
0.2229399, -0.2264218, 1.223128, 0, 0.4117647, 1, 1,
0.22686, -0.6628246, 0.3762738, 0, 0.4078431, 1, 1,
0.226953, 1.279789, 0.256541, 0, 0.4, 1, 1,
0.2303413, -0.1835322, 3.463533, 0, 0.3921569, 1, 1,
0.2306403, 0.02652003, 0.9050453, 0, 0.3882353, 1, 1,
0.2314396, 1.848182, 1.435681, 0, 0.3803922, 1, 1,
0.2331942, 1.723375, -1.263953, 0, 0.3764706, 1, 1,
0.2386316, -1.721692, 3.703039, 0, 0.3686275, 1, 1,
0.2411205, -0.1414382, 2.187529, 0, 0.3647059, 1, 1,
0.2435045, 0.1270851, 1.277574, 0, 0.3568628, 1, 1,
0.2547344, -1.057091, 1.412968, 0, 0.3529412, 1, 1,
0.2575856, 0.7192503, 0.04242837, 0, 0.345098, 1, 1,
0.2617306, 0.6822412, -0.4012617, 0, 0.3411765, 1, 1,
0.263426, 0.2821164, -0.6940043, 0, 0.3333333, 1, 1,
0.2648193, -0.826111, 3.09719, 0, 0.3294118, 1, 1,
0.2684104, -0.002423343, 0.8015792, 0, 0.3215686, 1, 1,
0.270956, 0.8155866, 0.5934536, 0, 0.3176471, 1, 1,
0.2733706, 0.4631706, 1.247858, 0, 0.3098039, 1, 1,
0.2775195, 1.691929, -0.3819535, 0, 0.3058824, 1, 1,
0.2778207, 0.9520277, -0.2609917, 0, 0.2980392, 1, 1,
0.2823609, -0.4342118, 2.175733, 0, 0.2901961, 1, 1,
0.2892271, -1.449226, 1.960796, 0, 0.2862745, 1, 1,
0.2900369, 0.8795361, -0.7315359, 0, 0.2784314, 1, 1,
0.2901582, 0.116708, 1.765405, 0, 0.2745098, 1, 1,
0.2923774, -2.600097, 3.667053, 0, 0.2666667, 1, 1,
0.2991973, 2.250227, -0.8419439, 0, 0.2627451, 1, 1,
0.302556, 0.404851, 1.160384, 0, 0.254902, 1, 1,
0.3054895, -1.054134, 3.160361, 0, 0.2509804, 1, 1,
0.3076626, 1.926795, 0.6948141, 0, 0.2431373, 1, 1,
0.3096495, -0.07889652, 1.597588, 0, 0.2392157, 1, 1,
0.3122194, -0.6178682, 3.823056, 0, 0.2313726, 1, 1,
0.3123817, 0.3671778, -0.1453419, 0, 0.227451, 1, 1,
0.313079, 0.9534, -0.1439772, 0, 0.2196078, 1, 1,
0.3136012, -0.5792492, 1.682527, 0, 0.2156863, 1, 1,
0.3193232, -1.328209, 3.256779, 0, 0.2078431, 1, 1,
0.3206863, 1.754873, -0.8509604, 0, 0.2039216, 1, 1,
0.3221953, 0.5167544, 1.328624, 0, 0.1960784, 1, 1,
0.3255998, -0.4397679, 1.614055, 0, 0.1882353, 1, 1,
0.3344814, -0.4903519, 3.731348, 0, 0.1843137, 1, 1,
0.3352271, -0.7317609, 1.461909, 0, 0.1764706, 1, 1,
0.3368655, -0.3419488, 3.280524, 0, 0.172549, 1, 1,
0.3390936, -0.05445716, 0.6374461, 0, 0.1647059, 1, 1,
0.3415329, 1.317444, -0.02938979, 0, 0.1607843, 1, 1,
0.3445981, 1.014195, 3.226167, 0, 0.1529412, 1, 1,
0.3466482, 2.354977, -0.6398869, 0, 0.1490196, 1, 1,
0.3491496, -0.1873792, -0.01019558, 0, 0.1411765, 1, 1,
0.3532069, 2.526339, -0.4148518, 0, 0.1372549, 1, 1,
0.3571418, 0.1999889, 2.326938, 0, 0.1294118, 1, 1,
0.3578296, 0.7200325, 0.7898607, 0, 0.1254902, 1, 1,
0.3625711, -0.7147596, 3.026403, 0, 0.1176471, 1, 1,
0.364592, -0.2491462, 2.797578, 0, 0.1137255, 1, 1,
0.36544, 0.7978427, -0.1481231, 0, 0.1058824, 1, 1,
0.3666409, 0.6914824, 0.4374186, 0, 0.09803922, 1, 1,
0.3668429, 1.44625, 1.655724, 0, 0.09411765, 1, 1,
0.3754402, 1.219851, 0.76987, 0, 0.08627451, 1, 1,
0.3759322, -0.7604719, 0.7096753, 0, 0.08235294, 1, 1,
0.3775537, 0.1789269, 0.7840824, 0, 0.07450981, 1, 1,
0.3811319, -0.4271998, 1.822353, 0, 0.07058824, 1, 1,
0.3829441, -0.4689172, 1.73474, 0, 0.0627451, 1, 1,
0.388027, -1.037843, 2.572485, 0, 0.05882353, 1, 1,
0.3901792, 0.2080659, 2.347903, 0, 0.05098039, 1, 1,
0.3919687, -1.101323, 3.711213, 0, 0.04705882, 1, 1,
0.3920082, -0.1706492, 0.7942493, 0, 0.03921569, 1, 1,
0.3921086, -0.4147905, 3.953462, 0, 0.03529412, 1, 1,
0.3936771, -0.350794, 2.058956, 0, 0.02745098, 1, 1,
0.3993164, -0.6448666, 2.9956, 0, 0.02352941, 1, 1,
0.4020732, -0.258278, 3.138581, 0, 0.01568628, 1, 1,
0.4078202, -0.03702773, 1.543144, 0, 0.01176471, 1, 1,
0.4105306, 1.947222, 0.2349343, 0, 0.003921569, 1, 1,
0.4108181, -2.385502, 4.752973, 0.003921569, 0, 1, 1,
0.4171677, 0.01187412, 0.2331681, 0.007843138, 0, 1, 1,
0.4196864, -0.962873, 3.345111, 0.01568628, 0, 1, 1,
0.4218841, -1.087101, 2.672028, 0.01960784, 0, 1, 1,
0.424089, 0.5033921, 0.7147754, 0.02745098, 0, 1, 1,
0.4296634, 1.510519, 1.094192, 0.03137255, 0, 1, 1,
0.4316854, 1.139193, -1.353428, 0.03921569, 0, 1, 1,
0.4324676, -1.489829, 2.296948, 0.04313726, 0, 1, 1,
0.4329491, 0.09082522, 1.905822, 0.05098039, 0, 1, 1,
0.4372063, 1.092001, 0.3338944, 0.05490196, 0, 1, 1,
0.4372902, 0.2612164, -1.248346, 0.0627451, 0, 1, 1,
0.4403816, 1.366954, 0.4508793, 0.06666667, 0, 1, 1,
0.4438394, 1.024659, 0.8690983, 0.07450981, 0, 1, 1,
0.4457996, -0.4139405, 1.210499, 0.07843138, 0, 1, 1,
0.4526384, -0.2721802, 2.86869, 0.08627451, 0, 1, 1,
0.4550084, -0.3921267, 2.941539, 0.09019608, 0, 1, 1,
0.4552817, -1.478464, 3.171398, 0.09803922, 0, 1, 1,
0.4557957, -1.014353, 3.196498, 0.1058824, 0, 1, 1,
0.4604727, 0.9889373, 1.026603, 0.1098039, 0, 1, 1,
0.4614245, -0.6411025, 1.235982, 0.1176471, 0, 1, 1,
0.4630309, -1.41776, 2.766342, 0.1215686, 0, 1, 1,
0.4632336, -0.2419695, 2.746311, 0.1294118, 0, 1, 1,
0.4635607, 1.097389, 1.714203, 0.1333333, 0, 1, 1,
0.4651479, -0.02634364, 1.529759, 0.1411765, 0, 1, 1,
0.4694305, 0.4833405, 0.2388261, 0.145098, 0, 1, 1,
0.4701577, -0.6968212, 1.968419, 0.1529412, 0, 1, 1,
0.4713317, 1.545751, 0.005977297, 0.1568628, 0, 1, 1,
0.4734097, 0.5808891, 2.171695, 0.1647059, 0, 1, 1,
0.4741654, -0.04246098, 0.8060741, 0.1686275, 0, 1, 1,
0.4763329, -1.414549, 2.114958, 0.1764706, 0, 1, 1,
0.4766831, 0.9922788, -0.2041393, 0.1803922, 0, 1, 1,
0.4804634, 0.2996913, 3.653664, 0.1882353, 0, 1, 1,
0.4822047, -2.39784, 3.39856, 0.1921569, 0, 1, 1,
0.4839526, 0.1185355, 2.768516, 0.2, 0, 1, 1,
0.4945782, 0.03418554, -0.1416186, 0.2078431, 0, 1, 1,
0.4966403, 0.460048, -0.8523951, 0.2117647, 0, 1, 1,
0.4971101, -1.132752, 3.294891, 0.2196078, 0, 1, 1,
0.5029134, -0.8466881, 2.44244, 0.2235294, 0, 1, 1,
0.5059888, 0.816458, 0.3986597, 0.2313726, 0, 1, 1,
0.5068821, 0.9521409, 0.5400106, 0.2352941, 0, 1, 1,
0.510878, 0.8810607, -0.1501987, 0.2431373, 0, 1, 1,
0.5158794, -0.07343473, 2.126709, 0.2470588, 0, 1, 1,
0.5167385, 0.1652348, 1.824862, 0.254902, 0, 1, 1,
0.5187377, -0.7731817, 3.432841, 0.2588235, 0, 1, 1,
0.5200324, 0.732685, 0.6865863, 0.2666667, 0, 1, 1,
0.5205477, -0.4085067, 1.085785, 0.2705882, 0, 1, 1,
0.5277854, -0.5246722, 0.6039452, 0.2784314, 0, 1, 1,
0.5278816, -0.6271751, 2.016351, 0.282353, 0, 1, 1,
0.5298507, -0.02201293, 2.36335, 0.2901961, 0, 1, 1,
0.5317491, 0.8891052, -0.4874213, 0.2941177, 0, 1, 1,
0.5321143, -1.672935, 4.282957, 0.3019608, 0, 1, 1,
0.5326533, 0.3569695, 0.6454549, 0.3098039, 0, 1, 1,
0.5394876, 0.8388712, 0.487676, 0.3137255, 0, 1, 1,
0.5406496, 0.218509, 0.9375518, 0.3215686, 0, 1, 1,
0.5423166, -0.3138991, 2.497504, 0.3254902, 0, 1, 1,
0.5426855, 1.286588, 1.402984, 0.3333333, 0, 1, 1,
0.5432616, -0.4045642, 2.489968, 0.3372549, 0, 1, 1,
0.5433859, -2.376112, 2.890989, 0.345098, 0, 1, 1,
0.5477812, 1.057162, 0.1194649, 0.3490196, 0, 1, 1,
0.5490028, 0.1886262, 2.330265, 0.3568628, 0, 1, 1,
0.5512931, 1.890505, -0.4912741, 0.3607843, 0, 1, 1,
0.5539547, -1.73943, 3.568153, 0.3686275, 0, 1, 1,
0.5547234, -1.995638, 0.659779, 0.372549, 0, 1, 1,
0.5605723, 0.7020551, 2.664456, 0.3803922, 0, 1, 1,
0.5651855, 0.380085, 1.479827, 0.3843137, 0, 1, 1,
0.5688537, -0.9065928, 2.743818, 0.3921569, 0, 1, 1,
0.5690171, -1.492286, 2.405173, 0.3960784, 0, 1, 1,
0.5717084, 1.060421, 0.03726687, 0.4039216, 0, 1, 1,
0.5719006, 0.8622755, 0.8353443, 0.4117647, 0, 1, 1,
0.5724103, -1.780687, 2.750469, 0.4156863, 0, 1, 1,
0.5747139, -0.9912403, 3.495539, 0.4235294, 0, 1, 1,
0.5769442, -0.7426211, 2.676708, 0.427451, 0, 1, 1,
0.5796843, -0.6513181, 3.903637, 0.4352941, 0, 1, 1,
0.5808883, 0.08132032, 0.7119956, 0.4392157, 0, 1, 1,
0.5852646, 0.4362043, 1.879746, 0.4470588, 0, 1, 1,
0.5877271, 0.3001914, 2.596993, 0.4509804, 0, 1, 1,
0.5905696, -0.2084543, 1.622916, 0.4588235, 0, 1, 1,
0.5928017, 0.6156572, -0.03401618, 0.4627451, 0, 1, 1,
0.600215, 0.110388, 0.4085745, 0.4705882, 0, 1, 1,
0.6019031, -0.4187046, 3.250119, 0.4745098, 0, 1, 1,
0.6048915, -0.8484655, 5.165167, 0.4823529, 0, 1, 1,
0.6055565, -0.5019098, 2.617754, 0.4862745, 0, 1, 1,
0.6065297, -0.1132271, 1.769097, 0.4941176, 0, 1, 1,
0.6096316, -0.5214657, 0.5608001, 0.5019608, 0, 1, 1,
0.6222275, -0.9647079, 1.38122, 0.5058824, 0, 1, 1,
0.6277829, 0.1206916, 2.609742, 0.5137255, 0, 1, 1,
0.6290494, 0.7644055, 1.384271, 0.5176471, 0, 1, 1,
0.6310527, 0.3306649, 1.076027, 0.5254902, 0, 1, 1,
0.636715, 0.9742047, 1.49466, 0.5294118, 0, 1, 1,
0.638341, 0.09483593, 1.172707, 0.5372549, 0, 1, 1,
0.63853, 0.462593, 0.5196876, 0.5411765, 0, 1, 1,
0.6442071, 0.7079647, 0.7092276, 0.5490196, 0, 1, 1,
0.6447773, -0.293626, 2.464664, 0.5529412, 0, 1, 1,
0.6461833, -0.2366943, 2.11549, 0.5607843, 0, 1, 1,
0.6511046, 1.153145, 0.3755239, 0.5647059, 0, 1, 1,
0.6576718, 0.5100914, 1.147165, 0.572549, 0, 1, 1,
0.6606399, 0.3041053, 3.73259, 0.5764706, 0, 1, 1,
0.6731693, -1.105818, 1.405613, 0.5843138, 0, 1, 1,
0.6732762, -0.1598344, 1.460578, 0.5882353, 0, 1, 1,
0.6744314, 0.17218, 2.344616, 0.5960785, 0, 1, 1,
0.6800906, -1.110167, 0.3000135, 0.6039216, 0, 1, 1,
0.6801679, -0.02448704, 0.7896733, 0.6078432, 0, 1, 1,
0.6815482, -0.4843319, 2.151582, 0.6156863, 0, 1, 1,
0.6817277, -0.09724882, 2.826801, 0.6196079, 0, 1, 1,
0.6869861, 1.66004, 0.7526052, 0.627451, 0, 1, 1,
0.6870821, -0.9767251, 2.920604, 0.6313726, 0, 1, 1,
0.6911746, 1.266418, -0.1986, 0.6392157, 0, 1, 1,
0.6945489, 0.1041455, 0.9437507, 0.6431373, 0, 1, 1,
0.6955115, -0.8395227, 3.371052, 0.6509804, 0, 1, 1,
0.6966881, 0.8988767, 0.8642926, 0.654902, 0, 1, 1,
0.7050416, 0.2324653, 1.976166, 0.6627451, 0, 1, 1,
0.7092627, 1.651362, 0.5513328, 0.6666667, 0, 1, 1,
0.7094126, -0.1710155, 2.153311, 0.6745098, 0, 1, 1,
0.7146994, 0.1455087, 2.317416, 0.6784314, 0, 1, 1,
0.7179445, 0.09794161, -0.5428506, 0.6862745, 0, 1, 1,
0.7186396, 0.9884912, -0.3310297, 0.6901961, 0, 1, 1,
0.7193861, 0.5389697, 0.1208741, 0.6980392, 0, 1, 1,
0.720461, -2.345847, 3.215837, 0.7058824, 0, 1, 1,
0.7250639, 0.5245219, -1.026346, 0.7098039, 0, 1, 1,
0.7369269, -1.702116, 1.369229, 0.7176471, 0, 1, 1,
0.7393014, -0.9535759, 2.515666, 0.7215686, 0, 1, 1,
0.7448545, -1.644325, 2.409778, 0.7294118, 0, 1, 1,
0.746563, 1.946856, 0.7692803, 0.7333333, 0, 1, 1,
0.7472019, -0.5679902, 1.190219, 0.7411765, 0, 1, 1,
0.7492689, 0.8415054, 1.322137, 0.7450981, 0, 1, 1,
0.7611969, -0.3312628, 1.079877, 0.7529412, 0, 1, 1,
0.7613783, -0.8171674, 2.101905, 0.7568628, 0, 1, 1,
0.7614415, 0.3070712, 0.552843, 0.7647059, 0, 1, 1,
0.763474, -0.6696045, 3.271293, 0.7686275, 0, 1, 1,
0.7641201, 1.858458, -0.4180122, 0.7764706, 0, 1, 1,
0.7671003, -1.946301, 4.248058, 0.7803922, 0, 1, 1,
0.7730379, 0.08188105, 0.7830734, 0.7882353, 0, 1, 1,
0.7732902, -0.4696139, 2.608497, 0.7921569, 0, 1, 1,
0.7756173, 0.8778253, 1.451432, 0.8, 0, 1, 1,
0.7770884, -0.9606121, 0.651666, 0.8078431, 0, 1, 1,
0.7785473, -0.3604375, 2.768978, 0.8117647, 0, 1, 1,
0.7800779, 1.149145, 1.922209, 0.8196079, 0, 1, 1,
0.7876885, -0.875912, 2.811274, 0.8235294, 0, 1, 1,
0.7885276, 0.2417864, 0.1161293, 0.8313726, 0, 1, 1,
0.7995742, -0.07155146, 1.20477, 0.8352941, 0, 1, 1,
0.8047504, 0.7154078, -0.04864305, 0.8431373, 0, 1, 1,
0.8097095, -1.644211, 2.452556, 0.8470588, 0, 1, 1,
0.8243618, 0.5612962, 1.987167, 0.854902, 0, 1, 1,
0.8285437, -0.3167999, 1.866046, 0.8588235, 0, 1, 1,
0.8292973, 0.310113, 0.2320137, 0.8666667, 0, 1, 1,
0.8315786, -1.473982, 4.80087, 0.8705882, 0, 1, 1,
0.8338778, 0.7055352, 0.1836023, 0.8784314, 0, 1, 1,
0.8343875, -1.247555, 2.28021, 0.8823529, 0, 1, 1,
0.842745, -0.09523383, 2.095361, 0.8901961, 0, 1, 1,
0.844647, 0.01552485, 1.832157, 0.8941177, 0, 1, 1,
0.8473206, -1.297252, 2.821409, 0.9019608, 0, 1, 1,
0.8474693, 1.643582, -0.6255594, 0.9098039, 0, 1, 1,
0.8477325, 1.351282, 0.7471263, 0.9137255, 0, 1, 1,
0.8479103, 0.02502447, 4.234122, 0.9215686, 0, 1, 1,
0.8530806, -0.4987477, 1.642345, 0.9254902, 0, 1, 1,
0.8624857, -1.313585, 2.802862, 0.9333333, 0, 1, 1,
0.8657259, -1.664194, 1.947505, 0.9372549, 0, 1, 1,
0.8692256, 0.03568897, 3.002809, 0.945098, 0, 1, 1,
0.8702918, 0.6422684, 1.498833, 0.9490196, 0, 1, 1,
0.8721182, 0.1890444, 2.707458, 0.9568627, 0, 1, 1,
0.8804461, 1.75951, 0.6716918, 0.9607843, 0, 1, 1,
0.8885711, 2.889611, -1.220532, 0.9686275, 0, 1, 1,
0.8886297, 0.1295024, 0.1241749, 0.972549, 0, 1, 1,
0.8893211, 3.324186, -0.8202388, 0.9803922, 0, 1, 1,
0.9038979, 1.348479, -1.025696, 0.9843137, 0, 1, 1,
0.9100767, -1.521315, 4.04353, 0.9921569, 0, 1, 1,
0.9118972, 1.066164, 2.011674, 0.9960784, 0, 1, 1,
0.9129105, -0.1465593, 2.912244, 1, 0, 0.9960784, 1,
0.916088, 0.1360101, 1.044381, 1, 0, 0.9882353, 1,
0.9166044, -0.1797311, 1.634656, 1, 0, 0.9843137, 1,
0.918521, -0.0006820565, 3.916425, 1, 0, 0.9764706, 1,
0.9187472, -0.2962413, 2.637682, 1, 0, 0.972549, 1,
0.9195532, 1.340278, 1.453241, 1, 0, 0.9647059, 1,
0.9200659, 0.6418422, 0.7869457, 1, 0, 0.9607843, 1,
0.9244157, 0.3978513, 1.962678, 1, 0, 0.9529412, 1,
0.9252224, -0.4264582, 0.8271307, 1, 0, 0.9490196, 1,
0.9253442, -1.434081, 2.848505, 1, 0, 0.9411765, 1,
0.934842, -1.784419, 0.9296818, 1, 0, 0.9372549, 1,
0.9353608, 0.7875216, 1.895778, 1, 0, 0.9294118, 1,
0.9397402, -2.078105, 1.280643, 1, 0, 0.9254902, 1,
0.9408957, 0.5252658, 1.169484, 1, 0, 0.9176471, 1,
0.9451457, -1.357541, 1.924271, 1, 0, 0.9137255, 1,
0.9554644, 0.2374969, 0.2051929, 1, 0, 0.9058824, 1,
0.9614013, -0.3058253, 0.3047301, 1, 0, 0.9019608, 1,
0.9656604, 1.329605, 2.139815, 1, 0, 0.8941177, 1,
0.974495, 1.008498, -0.8311343, 1, 0, 0.8862745, 1,
0.9766448, -0.05433449, 2.739457, 1, 0, 0.8823529, 1,
0.9807876, 0.6147153, -0.02100074, 1, 0, 0.8745098, 1,
0.9846535, -0.2908855, 1.106711, 1, 0, 0.8705882, 1,
0.9903194, 0.2613834, 0.6493454, 1, 0, 0.8627451, 1,
0.9941639, 0.4463427, 2.268492, 1, 0, 0.8588235, 1,
0.9962293, 1.11692, 1.314633, 1, 0, 0.8509804, 1,
0.9966868, 0.03900972, 2.242498, 1, 0, 0.8470588, 1,
1.001021, 0.7359707, 0.4399436, 1, 0, 0.8392157, 1,
1.002196, -0.3819028, 1.188499, 1, 0, 0.8352941, 1,
1.016596, -0.117731, 2.44003, 1, 0, 0.827451, 1,
1.01991, -0.3635508, 2.427328, 1, 0, 0.8235294, 1,
1.02151, 1.664731, 0.04054789, 1, 0, 0.8156863, 1,
1.023507, 1.356925, 0.1662435, 1, 0, 0.8117647, 1,
1.025916, -1.188694, 3.745624, 1, 0, 0.8039216, 1,
1.033185, -1.283034, 2.071902, 1, 0, 0.7960784, 1,
1.039668, 0.1546543, -0.3724619, 1, 0, 0.7921569, 1,
1.040398, -0.5617789, 0.1402094, 1, 0, 0.7843137, 1,
1.041365, -1.795189, 2.591864, 1, 0, 0.7803922, 1,
1.042429, -0.1885727, 2.255469, 1, 0, 0.772549, 1,
1.042651, 0.7884195, 0.7943969, 1, 0, 0.7686275, 1,
1.04781, -2.22747, 1.963634, 1, 0, 0.7607843, 1,
1.048653, 0.8847988, 0.4611169, 1, 0, 0.7568628, 1,
1.049073, -0.6960312, 3.04122, 1, 0, 0.7490196, 1,
1.050005, 1.431399, 1.343452, 1, 0, 0.7450981, 1,
1.055242, -1.076903, 2.4735, 1, 0, 0.7372549, 1,
1.065626, -1.148012, 2.404782, 1, 0, 0.7333333, 1,
1.066015, 0.8332257, 0.8962143, 1, 0, 0.7254902, 1,
1.074865, 0.03940564, 1.052384, 1, 0, 0.7215686, 1,
1.076173, -0.8781419, 3.284037, 1, 0, 0.7137255, 1,
1.084477, 0.8004602, -0.5487051, 1, 0, 0.7098039, 1,
1.091827, 0.5511234, -0.2142303, 1, 0, 0.7019608, 1,
1.091985, 0.6280143, 1.891576, 1, 0, 0.6941177, 1,
1.094375, 0.5798828, 0.6295305, 1, 0, 0.6901961, 1,
1.10429, -0.7874299, 1.542999, 1, 0, 0.682353, 1,
1.119487, 1.18048, -0.5663208, 1, 0, 0.6784314, 1,
1.120074, -1.119264, 1.958813, 1, 0, 0.6705883, 1,
1.125797, 0.8973665, 1.669481, 1, 0, 0.6666667, 1,
1.13691, 0.4913217, 0.5740148, 1, 0, 0.6588235, 1,
1.137626, 0.5385362, 1.736042, 1, 0, 0.654902, 1,
1.140062, 0.8811765, 2.256844, 1, 0, 0.6470588, 1,
1.140679, -0.7469637, 1.846605, 1, 0, 0.6431373, 1,
1.141153, -1.140762, 2.099868, 1, 0, 0.6352941, 1,
1.15672, 0.3398015, -0.03598496, 1, 0, 0.6313726, 1,
1.159694, -0.7437429, 1.428521, 1, 0, 0.6235294, 1,
1.168486, -0.3635073, 0.1256194, 1, 0, 0.6196079, 1,
1.175568, 0.4305564, 2.508415, 1, 0, 0.6117647, 1,
1.179021, 0.4483596, 3.337866, 1, 0, 0.6078432, 1,
1.180424, -0.3960304, 2.120981, 1, 0, 0.6, 1,
1.20175, 1.021449, 0.5676554, 1, 0, 0.5921569, 1,
1.218125, -0.1093625, 2.780434, 1, 0, 0.5882353, 1,
1.227412, 1.321226, 0.9340416, 1, 0, 0.5803922, 1,
1.230025, -0.1395342, 1.440729, 1, 0, 0.5764706, 1,
1.239284, -0.1060978, 1.909805, 1, 0, 0.5686275, 1,
1.24492, 2.416796, -1.411305, 1, 0, 0.5647059, 1,
1.24578, 1.197204, 1.726079, 1, 0, 0.5568628, 1,
1.250667, 1.195363, 0.9149558, 1, 0, 0.5529412, 1,
1.251853, -0.8639067, 2.1938, 1, 0, 0.5450981, 1,
1.253147, 0.04029683, 3.43891, 1, 0, 0.5411765, 1,
1.255457, -1.939229, 3.978459, 1, 0, 0.5333334, 1,
1.264987, 0.4597092, 2.807467, 1, 0, 0.5294118, 1,
1.265938, -0.6192791, 1.640636, 1, 0, 0.5215687, 1,
1.266827, -0.2058599, 1.806161, 1, 0, 0.5176471, 1,
1.270481, 0.6132689, 0.3012465, 1, 0, 0.509804, 1,
1.281905, -1.11938, 1.347652, 1, 0, 0.5058824, 1,
1.282938, -1.439217, 3.546576, 1, 0, 0.4980392, 1,
1.294499, -0.02564842, 0.4313191, 1, 0, 0.4901961, 1,
1.29571, -0.4641628, 1.344641, 1, 0, 0.4862745, 1,
1.296939, 0.2952843, 2.599854, 1, 0, 0.4784314, 1,
1.299492, -1.021984, 2.753027, 1, 0, 0.4745098, 1,
1.315143, 2.43756, -0.5678498, 1, 0, 0.4666667, 1,
1.339182, 1.560664, 0.9572436, 1, 0, 0.4627451, 1,
1.343578, -0.04304624, 1.399379, 1, 0, 0.454902, 1,
1.359683, -1.02645, 3.368619, 1, 0, 0.4509804, 1,
1.360526, 0.05156002, 1.925334, 1, 0, 0.4431373, 1,
1.366315, 0.5007479, 0.04449475, 1, 0, 0.4392157, 1,
1.37324, -0.6342907, 1.761452, 1, 0, 0.4313726, 1,
1.37791, 0.2950082, 2.5591, 1, 0, 0.427451, 1,
1.396707, -0.7281083, -0.5804026, 1, 0, 0.4196078, 1,
1.408208, 0.1391543, 1.178293, 1, 0, 0.4156863, 1,
1.412233, -0.2026938, 0.5635886, 1, 0, 0.4078431, 1,
1.415647, -1.404688, 3.728599, 1, 0, 0.4039216, 1,
1.417284, -0.06398913, 2.120745, 1, 0, 0.3960784, 1,
1.420376, -0.3874872, 0.07244954, 1, 0, 0.3882353, 1,
1.432703, -0.5214723, 0.3428394, 1, 0, 0.3843137, 1,
1.434155, -0.186489, 0.4308635, 1, 0, 0.3764706, 1,
1.453414, 0.4036266, 1.167623, 1, 0, 0.372549, 1,
1.460785, -0.1046207, 1.145111, 1, 0, 0.3647059, 1,
1.519049, -2.181386, 0.2681577, 1, 0, 0.3607843, 1,
1.562931, -1.222226, 3.207397, 1, 0, 0.3529412, 1,
1.56664, 0.1207265, 2.852324, 1, 0, 0.3490196, 1,
1.572737, -1.081517, 3.037935, 1, 0, 0.3411765, 1,
1.591196, 0.550727, 1.295754, 1, 0, 0.3372549, 1,
1.593642, -1.154182, 2.015446, 1, 0, 0.3294118, 1,
1.595641, -0.3296484, 2.687823, 1, 0, 0.3254902, 1,
1.608285, -0.1872735, 0.6915693, 1, 0, 0.3176471, 1,
1.617308, 0.4885889, -0.402833, 1, 0, 0.3137255, 1,
1.618332, 0.5470177, 3.127439, 1, 0, 0.3058824, 1,
1.618752, -0.7116425, 2.953943, 1, 0, 0.2980392, 1,
1.625592, -0.1778931, 1.881019, 1, 0, 0.2941177, 1,
1.632361, -0.2649309, 0.9499096, 1, 0, 0.2862745, 1,
1.680151, 2.509835, -0.5729688, 1, 0, 0.282353, 1,
1.708529, 1.257122, 2.075902, 1, 0, 0.2745098, 1,
1.715418, 1.455723, 2.232877, 1, 0, 0.2705882, 1,
1.737728, 1.536466, -0.3372892, 1, 0, 0.2627451, 1,
1.741854, 0.4769824, 1.979046, 1, 0, 0.2588235, 1,
1.761362, 0.417122, 1.009322, 1, 0, 0.2509804, 1,
1.762338, -0.1624309, 2.104842, 1, 0, 0.2470588, 1,
1.780625, -0.7306204, 1.370054, 1, 0, 0.2392157, 1,
1.784262, 0.2246712, 1.047518, 1, 0, 0.2352941, 1,
1.811248, 0.4424841, 3.006345, 1, 0, 0.227451, 1,
1.838563, -0.1407758, 1.98964, 1, 0, 0.2235294, 1,
1.843495, -0.3864023, 1.044033, 1, 0, 0.2156863, 1,
1.849754, 0.605311, 0.3274496, 1, 0, 0.2117647, 1,
1.858489, 2.431462, 0.925809, 1, 0, 0.2039216, 1,
1.866019, 0.3471003, 1.474624, 1, 0, 0.1960784, 1,
1.881273, -0.4841732, 1.651469, 1, 0, 0.1921569, 1,
1.897175, 1.882937, 2.3522, 1, 0, 0.1843137, 1,
1.897279, -0.8186619, 3.281119, 1, 0, 0.1803922, 1,
1.905047, 0.8687794, 0.9145937, 1, 0, 0.172549, 1,
1.9067, 1.214797, 0.9435855, 1, 0, 0.1686275, 1,
1.927263, -1.062288, 2.675883, 1, 0, 0.1607843, 1,
1.953916, 1.306998, 0.09987081, 1, 0, 0.1568628, 1,
2.006773, -0.40629, 0.6450427, 1, 0, 0.1490196, 1,
2.017175, 0.3112526, 0.6672584, 1, 0, 0.145098, 1,
2.019957, 0.1432343, 2.883722, 1, 0, 0.1372549, 1,
2.06377, 1.567894, 0.6934603, 1, 0, 0.1333333, 1,
2.095569, -0.9103449, 2.660317, 1, 0, 0.1254902, 1,
2.096218, -0.7074927, 4.412145, 1, 0, 0.1215686, 1,
2.138801, -0.5497479, 2.615667, 1, 0, 0.1137255, 1,
2.139337, 1.755518, 1.51248, 1, 0, 0.1098039, 1,
2.147276, 0.6903129, 0.4881011, 1, 0, 0.1019608, 1,
2.1998, 0.3968502, 1.882373, 1, 0, 0.09411765, 1,
2.219582, -0.4178502, 2.046886, 1, 0, 0.09019608, 1,
2.249259, 0.3880772, 0.4445745, 1, 0, 0.08235294, 1,
2.278307, -0.7840409, 2.92843, 1, 0, 0.07843138, 1,
2.337582, -0.1074361, 0.659727, 1, 0, 0.07058824, 1,
2.39788, -0.166354, 3.341611, 1, 0, 0.06666667, 1,
2.4626, 0.8705953, 2.107321, 1, 0, 0.05882353, 1,
2.474634, 0.7713906, 2.170039, 1, 0, 0.05490196, 1,
2.480598, -0.4867939, 1.759456, 1, 0, 0.04705882, 1,
2.52533, 0.9153474, 0.6721976, 1, 0, 0.04313726, 1,
2.551123, 0.4423028, 2.699431, 1, 0, 0.03529412, 1,
2.655996, 1.383984, 1.172266, 1, 0, 0.03137255, 1,
2.744853, 0.882028, 0.2346217, 1, 0, 0.02352941, 1,
2.8083, -0.1576779, 1.170505, 1, 0, 0.01960784, 1,
3.04562, 0.8640825, 1.784468, 1, 0, 0.01176471, 1,
3.195382, 0.6278911, 0.7968239, 1, 0, 0.007843138, 1
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
-0.01366556, -4.532376, -7.288183, 0, -0.5, 0.5, 0.5,
-0.01366556, -4.532376, -7.288183, 1, -0.5, 0.5, 0.5,
-0.01366556, -4.532376, -7.288183, 1, 1.5, 0.5, 0.5,
-0.01366556, -4.532376, -7.288183, 0, 1.5, 0.5, 0.5
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
-4.31058, -0.03475463, -7.288183, 0, -0.5, 0.5, 0.5,
-4.31058, -0.03475463, -7.288183, 1, -0.5, 0.5, 0.5,
-4.31058, -0.03475463, -7.288183, 1, 1.5, 0.5, 0.5,
-4.31058, -0.03475463, -7.288183, 0, 1.5, 0.5, 0.5
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
-4.31058, -4.532376, -0.1590526, 0, -0.5, 0.5, 0.5,
-4.31058, -4.532376, -0.1590526, 1, -0.5, 0.5, 0.5,
-4.31058, -4.532376, -0.1590526, 1, 1.5, 0.5, 0.5,
-4.31058, -4.532376, -0.1590526, 0, 1.5, 0.5, 0.5
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
-3, -3.494464, -5.642999,
3, -3.494464, -5.642999,
-3, -3.494464, -5.642999,
-3, -3.667449, -5.917196,
-2, -3.494464, -5.642999,
-2, -3.667449, -5.917196,
-1, -3.494464, -5.642999,
-1, -3.667449, -5.917196,
0, -3.494464, -5.642999,
0, -3.667449, -5.917196,
1, -3.494464, -5.642999,
1, -3.667449, -5.917196,
2, -3.494464, -5.642999,
2, -3.667449, -5.917196,
3, -3.494464, -5.642999,
3, -3.667449, -5.917196
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
-3, -4.01342, -6.465591, 0, -0.5, 0.5, 0.5,
-3, -4.01342, -6.465591, 1, -0.5, 0.5, 0.5,
-3, -4.01342, -6.465591, 1, 1.5, 0.5, 0.5,
-3, -4.01342, -6.465591, 0, 1.5, 0.5, 0.5,
-2, -4.01342, -6.465591, 0, -0.5, 0.5, 0.5,
-2, -4.01342, -6.465591, 1, -0.5, 0.5, 0.5,
-2, -4.01342, -6.465591, 1, 1.5, 0.5, 0.5,
-2, -4.01342, -6.465591, 0, 1.5, 0.5, 0.5,
-1, -4.01342, -6.465591, 0, -0.5, 0.5, 0.5,
-1, -4.01342, -6.465591, 1, -0.5, 0.5, 0.5,
-1, -4.01342, -6.465591, 1, 1.5, 0.5, 0.5,
-1, -4.01342, -6.465591, 0, 1.5, 0.5, 0.5,
0, -4.01342, -6.465591, 0, -0.5, 0.5, 0.5,
0, -4.01342, -6.465591, 1, -0.5, 0.5, 0.5,
0, -4.01342, -6.465591, 1, 1.5, 0.5, 0.5,
0, -4.01342, -6.465591, 0, 1.5, 0.5, 0.5,
1, -4.01342, -6.465591, 0, -0.5, 0.5, 0.5,
1, -4.01342, -6.465591, 1, -0.5, 0.5, 0.5,
1, -4.01342, -6.465591, 1, 1.5, 0.5, 0.5,
1, -4.01342, -6.465591, 0, 1.5, 0.5, 0.5,
2, -4.01342, -6.465591, 0, -0.5, 0.5, 0.5,
2, -4.01342, -6.465591, 1, -0.5, 0.5, 0.5,
2, -4.01342, -6.465591, 1, 1.5, 0.5, 0.5,
2, -4.01342, -6.465591, 0, 1.5, 0.5, 0.5,
3, -4.01342, -6.465591, 0, -0.5, 0.5, 0.5,
3, -4.01342, -6.465591, 1, -0.5, 0.5, 0.5,
3, -4.01342, -6.465591, 1, 1.5, 0.5, 0.5,
3, -4.01342, -6.465591, 0, 1.5, 0.5, 0.5
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
-3.318985, -3, -5.642999,
-3.318985, 3, -5.642999,
-3.318985, -3, -5.642999,
-3.484251, -3, -5.917196,
-3.318985, -2, -5.642999,
-3.484251, -2, -5.917196,
-3.318985, -1, -5.642999,
-3.484251, -1, -5.917196,
-3.318985, 0, -5.642999,
-3.484251, 0, -5.917196,
-3.318985, 1, -5.642999,
-3.484251, 1, -5.917196,
-3.318985, 2, -5.642999,
-3.484251, 2, -5.917196,
-3.318985, 3, -5.642999,
-3.484251, 3, -5.917196
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
-3.814783, -3, -6.465591, 0, -0.5, 0.5, 0.5,
-3.814783, -3, -6.465591, 1, -0.5, 0.5, 0.5,
-3.814783, -3, -6.465591, 1, 1.5, 0.5, 0.5,
-3.814783, -3, -6.465591, 0, 1.5, 0.5, 0.5,
-3.814783, -2, -6.465591, 0, -0.5, 0.5, 0.5,
-3.814783, -2, -6.465591, 1, -0.5, 0.5, 0.5,
-3.814783, -2, -6.465591, 1, 1.5, 0.5, 0.5,
-3.814783, -2, -6.465591, 0, 1.5, 0.5, 0.5,
-3.814783, -1, -6.465591, 0, -0.5, 0.5, 0.5,
-3.814783, -1, -6.465591, 1, -0.5, 0.5, 0.5,
-3.814783, -1, -6.465591, 1, 1.5, 0.5, 0.5,
-3.814783, -1, -6.465591, 0, 1.5, 0.5, 0.5,
-3.814783, 0, -6.465591, 0, -0.5, 0.5, 0.5,
-3.814783, 0, -6.465591, 1, -0.5, 0.5, 0.5,
-3.814783, 0, -6.465591, 1, 1.5, 0.5, 0.5,
-3.814783, 0, -6.465591, 0, 1.5, 0.5, 0.5,
-3.814783, 1, -6.465591, 0, -0.5, 0.5, 0.5,
-3.814783, 1, -6.465591, 1, -0.5, 0.5, 0.5,
-3.814783, 1, -6.465591, 1, 1.5, 0.5, 0.5,
-3.814783, 1, -6.465591, 0, 1.5, 0.5, 0.5,
-3.814783, 2, -6.465591, 0, -0.5, 0.5, 0.5,
-3.814783, 2, -6.465591, 1, -0.5, 0.5, 0.5,
-3.814783, 2, -6.465591, 1, 1.5, 0.5, 0.5,
-3.814783, 2, -6.465591, 0, 1.5, 0.5, 0.5,
-3.814783, 3, -6.465591, 0, -0.5, 0.5, 0.5,
-3.814783, 3, -6.465591, 1, -0.5, 0.5, 0.5,
-3.814783, 3, -6.465591, 1, 1.5, 0.5, 0.5,
-3.814783, 3, -6.465591, 0, 1.5, 0.5, 0.5
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
-3.318985, -3.494464, -4,
-3.318985, -3.494464, 4,
-3.318985, -3.494464, -4,
-3.484251, -3.667449, -4,
-3.318985, -3.494464, -2,
-3.484251, -3.667449, -2,
-3.318985, -3.494464, 0,
-3.484251, -3.667449, 0,
-3.318985, -3.494464, 2,
-3.484251, -3.667449, 2,
-3.318985, -3.494464, 4,
-3.484251, -3.667449, 4
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
-3.814783, -4.01342, -4, 0, -0.5, 0.5, 0.5,
-3.814783, -4.01342, -4, 1, -0.5, 0.5, 0.5,
-3.814783, -4.01342, -4, 1, 1.5, 0.5, 0.5,
-3.814783, -4.01342, -4, 0, 1.5, 0.5, 0.5,
-3.814783, -4.01342, -2, 0, -0.5, 0.5, 0.5,
-3.814783, -4.01342, -2, 1, -0.5, 0.5, 0.5,
-3.814783, -4.01342, -2, 1, 1.5, 0.5, 0.5,
-3.814783, -4.01342, -2, 0, 1.5, 0.5, 0.5,
-3.814783, -4.01342, 0, 0, -0.5, 0.5, 0.5,
-3.814783, -4.01342, 0, 1, -0.5, 0.5, 0.5,
-3.814783, -4.01342, 0, 1, 1.5, 0.5, 0.5,
-3.814783, -4.01342, 0, 0, 1.5, 0.5, 0.5,
-3.814783, -4.01342, 2, 0, -0.5, 0.5, 0.5,
-3.814783, -4.01342, 2, 1, -0.5, 0.5, 0.5,
-3.814783, -4.01342, 2, 1, 1.5, 0.5, 0.5,
-3.814783, -4.01342, 2, 0, 1.5, 0.5, 0.5,
-3.814783, -4.01342, 4, 0, -0.5, 0.5, 0.5,
-3.814783, -4.01342, 4, 1, -0.5, 0.5, 0.5,
-3.814783, -4.01342, 4, 1, 1.5, 0.5, 0.5,
-3.814783, -4.01342, 4, 0, 1.5, 0.5, 0.5
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
-3.318985, -3.494464, -5.642999,
-3.318985, 3.424954, -5.642999,
-3.318985, -3.494464, 5.324894,
-3.318985, 3.424954, 5.324894,
-3.318985, -3.494464, -5.642999,
-3.318985, -3.494464, 5.324894,
-3.318985, 3.424954, -5.642999,
-3.318985, 3.424954, 5.324894,
-3.318985, -3.494464, -5.642999,
3.291654, -3.494464, -5.642999,
-3.318985, -3.494464, 5.324894,
3.291654, -3.494464, 5.324894,
-3.318985, 3.424954, -5.642999,
3.291654, 3.424954, -5.642999,
-3.318985, 3.424954, 5.324894,
3.291654, 3.424954, 5.324894,
3.291654, -3.494464, -5.642999,
3.291654, 3.424954, -5.642999,
3.291654, -3.494464, 5.324894,
3.291654, 3.424954, 5.324894,
3.291654, -3.494464, -5.642999,
3.291654, -3.494464, 5.324894,
3.291654, 3.424954, -5.642999,
3.291654, 3.424954, 5.324894
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
var radius = 7.772556;
var distance = 34.58098;
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
mvMatrix.translate( 0.01366556, 0.03475463, 0.1590526 );
mvMatrix.scale( 1.27126, 1.21453, 0.7662219 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.58098);
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
Fuberidazole<-read.table("Fuberidazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Fuberidazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'Fuberidazole' not found
```

```r
y<-Fuberidazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'Fuberidazole' not found
```

```r
z<-Fuberidazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'Fuberidazole' not found
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
-3.222713, -0.236827, -2.041822, 0, 0, 1, 1, 1,
-3.043723, 1.081375, -1.523889, 1, 0, 0, 1, 1,
-2.839947, 0.3343613, -1.981862, 1, 0, 0, 1, 1,
-2.799157, -0.9521904, -2.325311, 1, 0, 0, 1, 1,
-2.695784, -0.8718258, -2.334608, 1, 0, 0, 1, 1,
-2.622704, -0.9108759, -2.27971, 1, 0, 0, 1, 1,
-2.610972, 3.206688, -1.096882, 0, 0, 0, 1, 1,
-2.556941, -1.810077, -1.803891, 0, 0, 0, 1, 1,
-2.300854, -1.067053, -1.129044, 0, 0, 0, 1, 1,
-2.297653, -0.1051495, -1.865663, 0, 0, 0, 1, 1,
-2.211644, -0.7906515, -1.106582, 0, 0, 0, 1, 1,
-2.185488, 0.02324544, -2.334204, 0, 0, 0, 1, 1,
-2.167048, 0.5521384, -0.5884443, 0, 0, 0, 1, 1,
-2.157372, 1.850386, -1.605418, 1, 1, 1, 1, 1,
-2.092106, 0.5238594, -1.39874, 1, 1, 1, 1, 1,
-2.075447, 1.535281, -0.5805667, 1, 1, 1, 1, 1,
-2.072668, -0.03814811, -2.134038, 1, 1, 1, 1, 1,
-2.062957, -0.869807, -2.195679, 1, 1, 1, 1, 1,
-2.051081, 0.7481522, -1.113798, 1, 1, 1, 1, 1,
-2.044175, -0.6110399, -1.925755, 1, 1, 1, 1, 1,
-2.039462, -1.531026, -3.217101, 1, 1, 1, 1, 1,
-2.039049, -0.5084539, -1.59506, 1, 1, 1, 1, 1,
-2.035025, 1.1357, -2.807593, 1, 1, 1, 1, 1,
-2.026067, -1.153322, -3.270539, 1, 1, 1, 1, 1,
-2.015569, -1.019976, -0.7504553, 1, 1, 1, 1, 1,
-1.997396, -1.330108, -2.402381, 1, 1, 1, 1, 1,
-1.992737, 1.224797, -1.650356, 1, 1, 1, 1, 1,
-1.983316, 0.2126805, -1.857173, 1, 1, 1, 1, 1,
-1.959611, -0.4167998, -1.443407, 0, 0, 1, 1, 1,
-1.923032, -0.4515902, -2.81211, 1, 0, 0, 1, 1,
-1.862548, -0.3017805, -1.611949, 1, 0, 0, 1, 1,
-1.856265, -1.295965, -1.971396, 1, 0, 0, 1, 1,
-1.785718, -0.2403216, -1.600629, 1, 0, 0, 1, 1,
-1.77249, -1.951486, -2.918463, 1, 0, 0, 1, 1,
-1.771743, 0.2870611, -1.956489, 0, 0, 0, 1, 1,
-1.765848, 0.8813539, -2.044282, 0, 0, 0, 1, 1,
-1.758519, 0.1470523, 2.194844, 0, 0, 0, 1, 1,
-1.751957, -0.2259448, -4.540137, 0, 0, 0, 1, 1,
-1.741064, -0.1516402, -2.280087, 0, 0, 0, 1, 1,
-1.732838, 0.03771354, -1.462594, 0, 0, 0, 1, 1,
-1.712307, -0.4343336, -1.237016, 0, 0, 0, 1, 1,
-1.701079, -0.6585327, -2.718352, 1, 1, 1, 1, 1,
-1.687936, -0.7485877, -1.56629, 1, 1, 1, 1, 1,
-1.687007, 0.6350253, -0.5184385, 1, 1, 1, 1, 1,
-1.685831, 0.2502427, -3.886343, 1, 1, 1, 1, 1,
-1.659304, 1.165643, -0.9286891, 1, 1, 1, 1, 1,
-1.650708, 0.8826751, 0.9649632, 1, 1, 1, 1, 1,
-1.643731, 1.174983, -0.7722549, 1, 1, 1, 1, 1,
-1.638708, -0.04445934, -1.251153, 1, 1, 1, 1, 1,
-1.633571, -0.310499, -1.032434, 1, 1, 1, 1, 1,
-1.622789, -1.815974, -3.848103, 1, 1, 1, 1, 1,
-1.622146, 1.15357, 0.5171264, 1, 1, 1, 1, 1,
-1.60658, 0.2338201, 0.2068221, 1, 1, 1, 1, 1,
-1.602658, -1.289732, -3.778223, 1, 1, 1, 1, 1,
-1.602304, -0.9314991, 0.3821439, 1, 1, 1, 1, 1,
-1.601747, -1.558172, -0.8022892, 1, 1, 1, 1, 1,
-1.601284, 1.222126, -0.07360104, 0, 0, 1, 1, 1,
-1.599337, 1.329961, -1.700065, 1, 0, 0, 1, 1,
-1.592269, 0.08377159, -3.141262, 1, 0, 0, 1, 1,
-1.590969, 0.20377, -2.107079, 1, 0, 0, 1, 1,
-1.572582, -0.7729172, -1.872662, 1, 0, 0, 1, 1,
-1.567835, -0.07991324, -3.057698, 1, 0, 0, 1, 1,
-1.536984, -1.811242, -1.025553, 0, 0, 0, 1, 1,
-1.531871, 0.2669219, -0.1965107, 0, 0, 0, 1, 1,
-1.531014, 1.971432, 0.9808336, 0, 0, 0, 1, 1,
-1.505933, -1.854636, -1.623479, 0, 0, 0, 1, 1,
-1.488525, -0.110908, -1.185573, 0, 0, 0, 1, 1,
-1.482576, -0.2943347, 0.04600507, 0, 0, 0, 1, 1,
-1.478218, 0.5483798, -1.028597, 0, 0, 0, 1, 1,
-1.476128, 0.3303786, -0.9017055, 1, 1, 1, 1, 1,
-1.469427, -1.390872, -1.891149, 1, 1, 1, 1, 1,
-1.460439, -0.493366, -2.099273, 1, 1, 1, 1, 1,
-1.448273, -1.808348, -1.631243, 1, 1, 1, 1, 1,
-1.441076, -0.1588539, -2.918965, 1, 1, 1, 1, 1,
-1.43242, 0.2147336, -0.397644, 1, 1, 1, 1, 1,
-1.426434, 0.8429805, 0.3967873, 1, 1, 1, 1, 1,
-1.422375, -0.1146588, -2.415783, 1, 1, 1, 1, 1,
-1.422047, 1.136017, -1.104929, 1, 1, 1, 1, 1,
-1.417202, 0.3601194, -1.681563, 1, 1, 1, 1, 1,
-1.41529, -0.6644128, -1.63821, 1, 1, 1, 1, 1,
-1.401572, 0.4773428, -2.495408, 1, 1, 1, 1, 1,
-1.400802, -0.813879, 0.1709604, 1, 1, 1, 1, 1,
-1.400164, 0.8666518, -0.4559499, 1, 1, 1, 1, 1,
-1.396377, 0.4992114, -1.841372, 1, 1, 1, 1, 1,
-1.388538, -1.928046, -2.550148, 0, 0, 1, 1, 1,
-1.386463, 1.34284, -1.020234, 1, 0, 0, 1, 1,
-1.365445, 0.8973826, -1.63835, 1, 0, 0, 1, 1,
-1.360624, 0.8596869, 0.1564277, 1, 0, 0, 1, 1,
-1.359818, 0.192884, -2.435692, 1, 0, 0, 1, 1,
-1.351148, 1.192514, -0.8962392, 1, 0, 0, 1, 1,
-1.350593, -0.8413181, -2.995079, 0, 0, 0, 1, 1,
-1.334909, -0.599994, -1.749273, 0, 0, 0, 1, 1,
-1.329276, -0.9263966, -3.636472, 0, 0, 0, 1, 1,
-1.329122, -0.8172673, -1.842665, 0, 0, 0, 1, 1,
-1.326243, 1.845605, 0.3698573, 0, 0, 0, 1, 1,
-1.313555, -0.2487603, -2.152111, 0, 0, 0, 1, 1,
-1.31162, 0.4722072, -1.897722, 0, 0, 0, 1, 1,
-1.308709, 1.641467, -0.6663566, 1, 1, 1, 1, 1,
-1.294482, -0.02161329, -2.816119, 1, 1, 1, 1, 1,
-1.292553, -1.501402, -1.699406, 1, 1, 1, 1, 1,
-1.284522, -1.099598, -3.303303, 1, 1, 1, 1, 1,
-1.279286, 0.09333442, -1.238555, 1, 1, 1, 1, 1,
-1.269014, -0.7629165, -2.411787, 1, 1, 1, 1, 1,
-1.255324, 1.735906, 0.9931402, 1, 1, 1, 1, 1,
-1.247292, -1.33569, -1.622924, 1, 1, 1, 1, 1,
-1.247034, -0.8695965, -1.616537, 1, 1, 1, 1, 1,
-1.241165, -0.4057189, -0.4427488, 1, 1, 1, 1, 1,
-1.240242, -0.09024777, -1.964313, 1, 1, 1, 1, 1,
-1.234259, 0.2519255, -2.455085, 1, 1, 1, 1, 1,
-1.231382, 0.5724579, -0.0825955, 1, 1, 1, 1, 1,
-1.2268, -0.4004445, -2.137366, 1, 1, 1, 1, 1,
-1.213499, -0.7209977, -1.960564, 1, 1, 1, 1, 1,
-1.212097, 0.7614927, 0.1416562, 0, 0, 1, 1, 1,
-1.202507, -0.6831916, -1.847787, 1, 0, 0, 1, 1,
-1.193749, -0.4740734, -0.3991479, 1, 0, 0, 1, 1,
-1.190661, 1.941534, 0.5556615, 1, 0, 0, 1, 1,
-1.186962, 0.252192, -1.910162, 1, 0, 0, 1, 1,
-1.1774, 0.0775618, -1.877183, 1, 0, 0, 1, 1,
-1.16067, 0.05309829, -2.505966, 0, 0, 0, 1, 1,
-1.15031, 0.5243252, -1.527285, 0, 0, 0, 1, 1,
-1.149456, -0.1659291, -3.668843, 0, 0, 0, 1, 1,
-1.147049, 1.257845, -1.328607, 0, 0, 0, 1, 1,
-1.136214, 0.0969712, -1.946466, 0, 0, 0, 1, 1,
-1.134483, -1.342417, -2.177361, 0, 0, 0, 1, 1,
-1.132567, 1.016915, -1.531305, 0, 0, 0, 1, 1,
-1.126976, 0.335478, -1.483632, 1, 1, 1, 1, 1,
-1.124681, 1.269719, 0.8492894, 1, 1, 1, 1, 1,
-1.124601, 0.9237458, -0.7059122, 1, 1, 1, 1, 1,
-1.11656, 1.087878, -0.9851003, 1, 1, 1, 1, 1,
-1.114918, -1.196863, -3.799886, 1, 1, 1, 1, 1,
-1.112624, -0.316992, -1.545049, 1, 1, 1, 1, 1,
-1.108298, 0.3084413, -4.487293, 1, 1, 1, 1, 1,
-1.103979, -0.7992151, -0.8053085, 1, 1, 1, 1, 1,
-1.103952, -0.6671022, -1.696475, 1, 1, 1, 1, 1,
-1.100428, -0.05255907, -2.725758, 1, 1, 1, 1, 1,
-1.095844, -2.011491, -1.949489, 1, 1, 1, 1, 1,
-1.089034, -0.09841296, -1.393785, 1, 1, 1, 1, 1,
-1.086245, -2.062219, -3.541036, 1, 1, 1, 1, 1,
-1.082416, 1.011726, -0.6084259, 1, 1, 1, 1, 1,
-1.076101, 2.069242, -0.2715368, 1, 1, 1, 1, 1,
-1.075767, -0.6306759, -0.0003705465, 0, 0, 1, 1, 1,
-1.072106, -0.7795574, -3.443519, 1, 0, 0, 1, 1,
-1.071321, 1.905419, -0.08841971, 1, 0, 0, 1, 1,
-1.070687, 3.252206, 0.261097, 1, 0, 0, 1, 1,
-1.069916, 0.7739642, -3.482943, 1, 0, 0, 1, 1,
-1.063384, 1.36242, -0.607901, 1, 0, 0, 1, 1,
-1.051409, 1.481043, 0.4803331, 0, 0, 0, 1, 1,
-1.048714, 0.1423237, 1.147112, 0, 0, 0, 1, 1,
-1.043447, -1.153963, -1.579592, 0, 0, 0, 1, 1,
-1.042071, -0.8149375, -1.608734, 0, 0, 0, 1, 1,
-1.04098, -0.6793195, -3.354387, 0, 0, 0, 1, 1,
-1.030125, -2.488226, -1.586122, 0, 0, 0, 1, 1,
-1.025216, -1.015513, -2.581812, 0, 0, 0, 1, 1,
-1.024013, -0.1293535, -1.980859, 1, 1, 1, 1, 1,
-1.020232, 0.1362009, -1.18439, 1, 1, 1, 1, 1,
-1.018719, 0.1312681, -0.6549606, 1, 1, 1, 1, 1,
-1.017586, -1.852034, -2.991179, 1, 1, 1, 1, 1,
-1.016356, -0.5853461, -2.050929, 1, 1, 1, 1, 1,
-1.014001, 1.13472, -1.178046, 1, 1, 1, 1, 1,
-1.012727, 0.4230038, -0.2552277, 1, 1, 1, 1, 1,
-1.010612, 0.879253, -1.204973, 1, 1, 1, 1, 1,
-1.010557, -2.118232, -3.72856, 1, 1, 1, 1, 1,
-1.007817, -1.000158, -1.844261, 1, 1, 1, 1, 1,
-1.007021, 1.521373, 0.1929117, 1, 1, 1, 1, 1,
-1.003095, -0.5788673, -1.845931, 1, 1, 1, 1, 1,
-0.9994074, -1.602877, -2.494399, 1, 1, 1, 1, 1,
-0.9987285, -0.4409142, -0.2663177, 1, 1, 1, 1, 1,
-0.9985111, 0.07916404, -0.7267749, 1, 1, 1, 1, 1,
-0.9947424, -0.8085178, -1.985765, 0, 0, 1, 1, 1,
-0.9791781, -2.084983, -1.341609, 1, 0, 0, 1, 1,
-0.9757023, 1.201649, -0.5727222, 1, 0, 0, 1, 1,
-0.9668097, -0.95933, -1.903591, 1, 0, 0, 1, 1,
-0.9666838, 0.4391607, -0.8684102, 1, 0, 0, 1, 1,
-0.9642187, -0.06620004, -0.5925876, 1, 0, 0, 1, 1,
-0.9623628, 0.8465616, 1.319869, 0, 0, 0, 1, 1,
-0.957673, 0.7235527, -0.07970518, 0, 0, 0, 1, 1,
-0.9552913, 0.7179426, -0.9587588, 0, 0, 0, 1, 1,
-0.9551299, 1.037393, -0.8898816, 0, 0, 0, 1, 1,
-0.9526149, 1.995205, -0.4634862, 0, 0, 0, 1, 1,
-0.9417413, -0.8420925, -2.254413, 0, 0, 0, 1, 1,
-0.9371309, 1.178124, 0.5110008, 0, 0, 0, 1, 1,
-0.9349724, -0.1508929, -2.197236, 1, 1, 1, 1, 1,
-0.9299917, 0.6170611, -2.268771, 1, 1, 1, 1, 1,
-0.9239251, 0.4647863, 0.5370299, 1, 1, 1, 1, 1,
-0.9153672, 0.2104185, -0.2995329, 1, 1, 1, 1, 1,
-0.9117807, -0.7514362, -1.262283, 1, 1, 1, 1, 1,
-0.910573, 0.1393559, -1.387772, 1, 1, 1, 1, 1,
-0.9083771, 1.277376, -0.3198409, 1, 1, 1, 1, 1,
-0.9077219, -0.5110453, -3.783821, 1, 1, 1, 1, 1,
-0.9016815, 0.9160462, -0.005792874, 1, 1, 1, 1, 1,
-0.8953536, -0.4920444, -1.740024, 1, 1, 1, 1, 1,
-0.8935143, 0.5779117, -0.8480341, 1, 1, 1, 1, 1,
-0.8879261, 1.036277, -1.061028, 1, 1, 1, 1, 1,
-0.8842977, 0.07826579, -1.756988, 1, 1, 1, 1, 1,
-0.8822968, -0.09831405, 0.6764197, 1, 1, 1, 1, 1,
-0.8779114, 1.425691, -1.71376, 1, 1, 1, 1, 1,
-0.8761141, -0.0492815, -1.737564, 0, 0, 1, 1, 1,
-0.8675249, -0.5002854, -2.831495, 1, 0, 0, 1, 1,
-0.861929, 0.7326707, 1.259279, 1, 0, 0, 1, 1,
-0.8580044, -1.841867, -2.419985, 1, 0, 0, 1, 1,
-0.8517742, 2.184091, 0.2378869, 1, 0, 0, 1, 1,
-0.8474472, -0.8176464, -3.438633, 1, 0, 0, 1, 1,
-0.8464328, 0.2739483, -0.4901678, 0, 0, 0, 1, 1,
-0.8462083, -1.65511, -5.212725, 0, 0, 0, 1, 1,
-0.8351455, 0.2177465, -1.790581, 0, 0, 0, 1, 1,
-0.8313106, -0.9222421, -0.8285065, 0, 0, 0, 1, 1,
-0.8305394, -0.2090476, -0.6416138, 0, 0, 0, 1, 1,
-0.829787, -1.924398, -1.298853, 0, 0, 0, 1, 1,
-0.824782, 1.38574, -1.647084, 0, 0, 0, 1, 1,
-0.8231204, -0.7844454, -1.732322, 1, 1, 1, 1, 1,
-0.8229303, -0.3110558, -0.4089667, 1, 1, 1, 1, 1,
-0.8228918, 1.4998, -0.6863429, 1, 1, 1, 1, 1,
-0.822745, 0.1480715, -2.121073, 1, 1, 1, 1, 1,
-0.8209479, -1.140589, -2.978643, 1, 1, 1, 1, 1,
-0.8207421, 1.384866, 1.199299, 1, 1, 1, 1, 1,
-0.8106643, -0.6760798, -1.366312, 1, 1, 1, 1, 1,
-0.8021901, 2.002778, 0.2608179, 1, 1, 1, 1, 1,
-0.7930948, 0.5751804, -1.103359, 1, 1, 1, 1, 1,
-0.7928146, 0.04264126, -2.766829, 1, 1, 1, 1, 1,
-0.7922181, 0.726742, 1.427792, 1, 1, 1, 1, 1,
-0.774824, 0.02701521, -2.231789, 1, 1, 1, 1, 1,
-0.7685241, -1.302257, -3.197872, 1, 1, 1, 1, 1,
-0.7646062, -0.3554836, -3.125995, 1, 1, 1, 1, 1,
-0.7641624, 0.6842098, -1.294563, 1, 1, 1, 1, 1,
-0.759497, 0.3129558, -2.291038, 0, 0, 1, 1, 1,
-0.7469842, -0.5329081, -2.462212, 1, 0, 0, 1, 1,
-0.7455868, -1.173036, -3.010445, 1, 0, 0, 1, 1,
-0.7386204, -0.7268226, -2.405722, 1, 0, 0, 1, 1,
-0.7374942, -1.808815, -3.526777, 1, 0, 0, 1, 1,
-0.7352554, 0.4003091, -0.1004618, 1, 0, 0, 1, 1,
-0.7337356, 0.9440784, 0.1912117, 0, 0, 0, 1, 1,
-0.7267171, 0.9096844, 0.2245315, 0, 0, 0, 1, 1,
-0.7254733, -0.5452784, -1.755741, 0, 0, 0, 1, 1,
-0.7213084, 2.310065, 0.1793941, 0, 0, 0, 1, 1,
-0.7159836, -1.370633, -3.846916, 0, 0, 0, 1, 1,
-0.7059674, -0.1704841, -1.03532, 0, 0, 0, 1, 1,
-0.7025093, 0.1498336, -2.829737, 0, 0, 0, 1, 1,
-0.7019373, 2.463182, 0.1724268, 1, 1, 1, 1, 1,
-0.6990523, -0.06575617, -0.9158059, 1, 1, 1, 1, 1,
-0.6982059, -0.9997161, -2.16812, 1, 1, 1, 1, 1,
-0.6954175, 0.6507347, -0.1479952, 1, 1, 1, 1, 1,
-0.6910748, 0.769569, -0.9635348, 1, 1, 1, 1, 1,
-0.6899318, 0.1972824, -1.794217, 1, 1, 1, 1, 1,
-0.6824259, -0.1389158, -3.039445, 1, 1, 1, 1, 1,
-0.6776797, 0.8331384, -0.8436241, 1, 1, 1, 1, 1,
-0.6726879, 0.4638053, -0.8278128, 1, 1, 1, 1, 1,
-0.6700255, 0.2745855, -1.745468, 1, 1, 1, 1, 1,
-0.6690477, 1.425403, -1.211583, 1, 1, 1, 1, 1,
-0.6653093, -0.9733458, -3.035743, 1, 1, 1, 1, 1,
-0.6644399, -1.064853, -4.084607, 1, 1, 1, 1, 1,
-0.6641181, -1.140796, -1.576697, 1, 1, 1, 1, 1,
-0.6614809, -0.08651093, -3.73702, 1, 1, 1, 1, 1,
-0.660292, -1.200574, -2.430109, 0, 0, 1, 1, 1,
-0.6579683, 0.441213, -1.250344, 1, 0, 0, 1, 1,
-0.6546211, -0.7567579, -3.900457, 1, 0, 0, 1, 1,
-0.6493117, 1.085314, -0.3652264, 1, 0, 0, 1, 1,
-0.6484101, -0.5556613, -0.9857691, 1, 0, 0, 1, 1,
-0.6462124, 0.8473082, -1.494017, 1, 0, 0, 1, 1,
-0.644433, 0.3315633, -2.275053, 0, 0, 0, 1, 1,
-0.6441074, 1.311205, -1.145099, 0, 0, 0, 1, 1,
-0.6412882, 0.03065837, -1.787171, 0, 0, 0, 1, 1,
-0.6398166, 0.1357727, -2.20946, 0, 0, 0, 1, 1,
-0.6393328, 1.692001, 0.2024672, 0, 0, 0, 1, 1,
-0.6280598, 0.7749358, -0.1463571, 0, 0, 0, 1, 1,
-0.6278709, 0.589156, 0.48821, 0, 0, 0, 1, 1,
-0.6276778, -1.114738, -1.26805, 1, 1, 1, 1, 1,
-0.6245205, -3.393695, -2.734191, 1, 1, 1, 1, 1,
-0.6219246, 1.539578, -0.8155314, 1, 1, 1, 1, 1,
-0.621278, -1.128222, -2.166677, 1, 1, 1, 1, 1,
-0.6159536, -0.6061814, -1.68663, 1, 1, 1, 1, 1,
-0.6157147, 1.1422, -2.383966, 1, 1, 1, 1, 1,
-0.608662, -0.4280357, -1.778455, 1, 1, 1, 1, 1,
-0.6084938, -0.002693281, -0.6299464, 1, 1, 1, 1, 1,
-0.6083925, 0.495173, -1.624763, 1, 1, 1, 1, 1,
-0.600566, 1.061451, -1.281455, 1, 1, 1, 1, 1,
-0.5999334, 0.002849752, -1.992251, 1, 1, 1, 1, 1,
-0.5997217, 1.431054, -0.8668936, 1, 1, 1, 1, 1,
-0.5984932, -1.131256, -1.2823, 1, 1, 1, 1, 1,
-0.5980149, 0.3559206, -0.6644138, 1, 1, 1, 1, 1,
-0.5948515, -1.36538, -4.743481, 1, 1, 1, 1, 1,
-0.591634, 2.044878, -0.4233437, 0, 0, 1, 1, 1,
-0.5898123, 0.4533722, -2.702936, 1, 0, 0, 1, 1,
-0.5890685, -0.2439205, -1.732378, 1, 0, 0, 1, 1,
-0.5887036, -0.2453329, -1.901544, 1, 0, 0, 1, 1,
-0.5886613, 0.9813735, -0.9893911, 1, 0, 0, 1, 1,
-0.5868948, -0.5898218, -2.880663, 1, 0, 0, 1, 1,
-0.5848822, -0.136057, -1.345232, 0, 0, 0, 1, 1,
-0.5833342, 0.009203642, -3.174322, 0, 0, 0, 1, 1,
-0.5830953, 0.3119031, 0.7437045, 0, 0, 0, 1, 1,
-0.5816889, -0.07752201, -0.1223082, 0, 0, 0, 1, 1,
-0.5808073, 0.2810991, -0.9426369, 0, 0, 0, 1, 1,
-0.5783011, -1.605264, -2.527689, 0, 0, 0, 1, 1,
-0.5757865, 2.173599, 0.0791631, 0, 0, 0, 1, 1,
-0.5674185, -1.173303, -2.659542, 1, 1, 1, 1, 1,
-0.5647236, -1.532383, -3.148507, 1, 1, 1, 1, 1,
-0.56258, 0.6933171, -1.348156, 1, 1, 1, 1, 1,
-0.5569386, -0.02152246, -0.8426873, 1, 1, 1, 1, 1,
-0.5480134, -0.8231707, -0.4361207, 1, 1, 1, 1, 1,
-0.5439063, -0.7340538, -2.302851, 1, 1, 1, 1, 1,
-0.5432777, -0.302549, -1.907375, 1, 1, 1, 1, 1,
-0.5411367, -2.180556, -2.960171, 1, 1, 1, 1, 1,
-0.5401218, -2.01703, -2.477373, 1, 1, 1, 1, 1,
-0.5394704, -0.6576418, -4.079484, 1, 1, 1, 1, 1,
-0.5279489, -0.2577497, 0.1461133, 1, 1, 1, 1, 1,
-0.5267704, -0.159739, -1.642841, 1, 1, 1, 1, 1,
-0.5188797, -0.5859615, -2.299692, 1, 1, 1, 1, 1,
-0.5165858, -0.1944408, -1.1322, 1, 1, 1, 1, 1,
-0.5153569, 0.7558528, -0.06344111, 1, 1, 1, 1, 1,
-0.5103424, -1.8684, -2.423837, 0, 0, 1, 1, 1,
-0.5098381, -1.692981, -2.950398, 1, 0, 0, 1, 1,
-0.5074033, -0.3254988, -1.588855, 1, 0, 0, 1, 1,
-0.5047514, 0.8501139, -3.719256, 1, 0, 0, 1, 1,
-0.5018818, 0.06265477, -1.864262, 1, 0, 0, 1, 1,
-0.5014502, -0.8943511, -2.507257, 1, 0, 0, 1, 1,
-0.4986581, 0.7335788, -0.4747394, 0, 0, 0, 1, 1,
-0.4954593, -0.7826627, -3.321719, 0, 0, 0, 1, 1,
-0.4923835, 0.3655915, -1.364679, 0, 0, 0, 1, 1,
-0.4921145, 0.8905749, -1.538489, 0, 0, 0, 1, 1,
-0.4892776, 1.065155, 0.6914267, 0, 0, 0, 1, 1,
-0.4842956, -0.5041813, -2.203264, 0, 0, 0, 1, 1,
-0.4820324, 0.7499382, -0.9001767, 0, 0, 0, 1, 1,
-0.4803509, 0.2088216, 0.9933673, 1, 1, 1, 1, 1,
-0.4751368, -0.3469239, -3.11774, 1, 1, 1, 1, 1,
-0.4674496, 0.649413, -0.7464995, 1, 1, 1, 1, 1,
-0.4608886, 0.2975603, -2.441137, 1, 1, 1, 1, 1,
-0.4553522, -0.2540438, -1.293719, 1, 1, 1, 1, 1,
-0.453533, -0.7163668, -1.351123, 1, 1, 1, 1, 1,
-0.4516361, -1.140655, -2.994684, 1, 1, 1, 1, 1,
-0.4513619, -1.958773, -3.539263, 1, 1, 1, 1, 1,
-0.4512622, -1.563161, -2.037924, 1, 1, 1, 1, 1,
-0.4467687, -2.494884, -2.740878, 1, 1, 1, 1, 1,
-0.4451377, 0.9335763, -0.7008482, 1, 1, 1, 1, 1,
-0.4391411, -0.8694222, -1.821822, 1, 1, 1, 1, 1,
-0.4374043, 2.162284, -0.5857171, 1, 1, 1, 1, 1,
-0.4372549, 0.1393094, -1.018307, 1, 1, 1, 1, 1,
-0.4327725, 2.499672, -0.6647625, 1, 1, 1, 1, 1,
-0.4324447, 1.685814, -0.7986974, 0, 0, 1, 1, 1,
-0.4283226, 0.205968, -0.9640067, 1, 0, 0, 1, 1,
-0.4236706, -0.1686902, -2.130877, 1, 0, 0, 1, 1,
-0.4213726, 0.779573, -0.0477347, 1, 0, 0, 1, 1,
-0.4170769, -2.175464, -2.415835, 1, 0, 0, 1, 1,
-0.416068, -0.06373562, -0.1638293, 1, 0, 0, 1, 1,
-0.4098764, 0.8131754, 0.2806541, 0, 0, 0, 1, 1,
-0.4073162, -1.642717, -2.87044, 0, 0, 0, 1, 1,
-0.4036785, -0.6103317, -2.09572, 0, 0, 0, 1, 1,
-0.4030026, -1.102365, -1.913779, 0, 0, 0, 1, 1,
-0.4024363, -1.609146, -2.792398, 0, 0, 0, 1, 1,
-0.4006627, 0.5336538, -0.4597803, 0, 0, 0, 1, 1,
-0.3987147, -0.3571054, -2.943644, 0, 0, 0, 1, 1,
-0.3949004, -0.1400246, -2.195394, 1, 1, 1, 1, 1,
-0.3936018, -0.03275165, -1.642692, 1, 1, 1, 1, 1,
-0.3931953, -0.1917491, -2.48272, 1, 1, 1, 1, 1,
-0.3930422, 1.504481, -0.7360045, 1, 1, 1, 1, 1,
-0.3886434, -0.5150762, -4.40306, 1, 1, 1, 1, 1,
-0.3851672, 1.606564, 0.7831185, 1, 1, 1, 1, 1,
-0.3813184, -1.78301, -2.669016, 1, 1, 1, 1, 1,
-0.3789042, -1.764989, -3.232092, 1, 1, 1, 1, 1,
-0.377746, 0.4913339, 1.092, 1, 1, 1, 1, 1,
-0.3756074, -0.1040802, -1.130105, 1, 1, 1, 1, 1,
-0.373288, 1.413509, -0.9901371, 1, 1, 1, 1, 1,
-0.3701364, -1.121806, -3.979196, 1, 1, 1, 1, 1,
-0.363978, -0.3133557, -1.52936, 1, 1, 1, 1, 1,
-0.3538697, -0.02036889, -1.667958, 1, 1, 1, 1, 1,
-0.3521161, -0.788892, -1.845895, 1, 1, 1, 1, 1,
-0.3508917, 0.6002845, -2.303579, 0, 0, 1, 1, 1,
-0.3486525, -1.930663, -3.476131, 1, 0, 0, 1, 1,
-0.3449418, 0.1064772, -1.796508, 1, 0, 0, 1, 1,
-0.3409606, 0.7705415, -0.8760864, 1, 0, 0, 1, 1,
-0.3389609, 0.4735356, -1.170646, 1, 0, 0, 1, 1,
-0.3377739, -0.4137928, -1.436594, 1, 0, 0, 1, 1,
-0.3359848, -0.06522362, -0.7826595, 0, 0, 0, 1, 1,
-0.3323025, 0.1460204, -1.350691, 0, 0, 0, 1, 1,
-0.3322419, -0.414067, -1.824537, 0, 0, 0, 1, 1,
-0.3315445, 0.5549391, -0.052055, 0, 0, 0, 1, 1,
-0.3305286, 0.6315504, -2.186665, 0, 0, 0, 1, 1,
-0.3270972, 0.8522042, 1.012086, 0, 0, 0, 1, 1,
-0.3263616, 0.6663049, -0.4281965, 0, 0, 0, 1, 1,
-0.3252321, 0.206557, -0.7272221, 1, 1, 1, 1, 1,
-0.323483, -0.1174912, -1.593687, 1, 1, 1, 1, 1,
-0.3230178, 1.76513, -1.05628, 1, 1, 1, 1, 1,
-0.3191589, -0.9688671, -1.2879, 1, 1, 1, 1, 1,
-0.3175496, -0.7876409, -1.779458, 1, 1, 1, 1, 1,
-0.3095819, -0.2008045, -1.957093, 1, 1, 1, 1, 1,
-0.3063138, -0.8055924, -1.71897, 1, 1, 1, 1, 1,
-0.3058181, -0.6851918, -2.766118, 1, 1, 1, 1, 1,
-0.3038953, 0.9098828, 0.2518986, 1, 1, 1, 1, 1,
-0.3029987, 0.546133, -1.658379, 1, 1, 1, 1, 1,
-0.3027305, -0.9085202, -1.864463, 1, 1, 1, 1, 1,
-0.2981252, -0.7926554, -3.105522, 1, 1, 1, 1, 1,
-0.2951621, -1.027431, -2.440464, 1, 1, 1, 1, 1,
-0.2945052, -0.7203642, -1.764569, 1, 1, 1, 1, 1,
-0.2908613, 0.03672549, -2.457477, 1, 1, 1, 1, 1,
-0.286433, -0.7191281, -2.709137, 0, 0, 1, 1, 1,
-0.2857672, -0.2882284, -2.350412, 1, 0, 0, 1, 1,
-0.2835466, 1.945101, -0.09383526, 1, 0, 0, 1, 1,
-0.2807096, -0.5751738, -3.727281, 1, 0, 0, 1, 1,
-0.2786421, 0.2613653, -0.7242784, 1, 0, 0, 1, 1,
-0.2783869, -0.1172749, -3.45467, 1, 0, 0, 1, 1,
-0.2775792, -0.5725707, -2.006875, 0, 0, 0, 1, 1,
-0.276444, -0.5123391, -2.993067, 0, 0, 0, 1, 1,
-0.2717672, 1.137498, 0.99574, 0, 0, 0, 1, 1,
-0.271227, -1.385074, -2.886377, 0, 0, 0, 1, 1,
-0.2695749, -0.7064283, -3.388757, 0, 0, 0, 1, 1,
-0.264502, -0.3464489, -1.074295, 0, 0, 0, 1, 1,
-0.2606557, -0.6587254, -3.407011, 0, 0, 0, 1, 1,
-0.2596899, -1.209653, -2.938646, 1, 1, 1, 1, 1,
-0.2571122, -0.09779778, -1.788446, 1, 1, 1, 1, 1,
-0.2560359, 0.08891266, -1.645253, 1, 1, 1, 1, 1,
-0.2529547, 0.2046524, -1.52155, 1, 1, 1, 1, 1,
-0.2446937, -2.719635, -5.244644, 1, 1, 1, 1, 1,
-0.2444129, -0.4396552, -1.503461, 1, 1, 1, 1, 1,
-0.2388002, 0.155125, -2.447, 1, 1, 1, 1, 1,
-0.2343473, 1.453623, 1.319086, 1, 1, 1, 1, 1,
-0.2343445, 0.523658, 0.6966025, 1, 1, 1, 1, 1,
-0.2335583, -0.01833883, -1.053342, 1, 1, 1, 1, 1,
-0.2332692, 0.6595607, 0.3417592, 1, 1, 1, 1, 1,
-0.2311738, -0.07393609, -0.2435185, 1, 1, 1, 1, 1,
-0.2291176, 0.9599395, -0.5439041, 1, 1, 1, 1, 1,
-0.226314, -3.238861, -2.702696, 1, 1, 1, 1, 1,
-0.226263, -1.550618, -2.398599, 1, 1, 1, 1, 1,
-0.2247774, -1.230387, -3.076661, 0, 0, 1, 1, 1,
-0.2239578, 1.640323, 0.8621206, 1, 0, 0, 1, 1,
-0.2213635, -2.239249, -1.352965, 1, 0, 0, 1, 1,
-0.2182118, -2.12047, -2.271473, 1, 0, 0, 1, 1,
-0.2175796, -0.8192145, -1.859354, 1, 0, 0, 1, 1,
-0.213014, -0.760641, -5.483273, 1, 0, 0, 1, 1,
-0.2115314, 0.7494732, 0.5137667, 0, 0, 0, 1, 1,
-0.2096704, -2.049023, -1.739915, 0, 0, 0, 1, 1,
-0.2095284, -0.3533499, -1.136124, 0, 0, 0, 1, 1,
-0.2082766, 0.7907237, -1.415217, 0, 0, 0, 1, 1,
-0.2044031, 0.443761, 0.3223368, 0, 0, 0, 1, 1,
-0.1990518, -0.2806476, 0.2751803, 0, 0, 0, 1, 1,
-0.1936362, -0.4217647, -2.13672, 0, 0, 0, 1, 1,
-0.1894278, -0.8989372, -2.039056, 1, 1, 1, 1, 1,
-0.1893276, 0.4580512, -0.7661096, 1, 1, 1, 1, 1,
-0.1881399, -1.15652, -4.078874, 1, 1, 1, 1, 1,
-0.1880576, -0.3384164, -3.163112, 1, 1, 1, 1, 1,
-0.1852733, 1.352555, 2.453879, 1, 1, 1, 1, 1,
-0.1788794, 0.1833621, 0.5111575, 1, 1, 1, 1, 1,
-0.1763651, 0.3683952, -0.1853998, 1, 1, 1, 1, 1,
-0.1758188, 0.6978182, -0.4216507, 1, 1, 1, 1, 1,
-0.1754867, -1.703292, -1.661766, 1, 1, 1, 1, 1,
-0.1738981, -0.2470303, -3.415182, 1, 1, 1, 1, 1,
-0.1583777, 0.2148125, 0.8005136, 1, 1, 1, 1, 1,
-0.1562043, 0.9867019, -1.218648, 1, 1, 1, 1, 1,
-0.1539105, -0.5683532, -2.855457, 1, 1, 1, 1, 1,
-0.1491227, 0.6070461, 0.1736535, 1, 1, 1, 1, 1,
-0.148139, -0.2072947, -2.845854, 1, 1, 1, 1, 1,
-0.147255, 1.290985, 0.3622368, 0, 0, 1, 1, 1,
-0.1445508, 1.14984, 0.03485506, 1, 0, 0, 1, 1,
-0.1420826, -0.04409301, -1.817928, 1, 0, 0, 1, 1,
-0.1404508, -2.991796, -4.3128, 1, 0, 0, 1, 1,
-0.1378915, -0.9073972, -5.441656, 1, 0, 0, 1, 1,
-0.1340236, 0.6925553, -0.998349, 1, 0, 0, 1, 1,
-0.1331256, -1.26811, -3.372316, 0, 0, 0, 1, 1,
-0.1319898, 1.902878, -0.977972, 0, 0, 0, 1, 1,
-0.1312423, 0.3356007, 0.9023639, 0, 0, 0, 1, 1,
-0.1284108, 1.45164, -1.621576, 0, 0, 0, 1, 1,
-0.1259994, -1.241815, -5.08075, 0, 0, 0, 1, 1,
-0.1257199, 0.647761, -0.5268642, 0, 0, 0, 1, 1,
-0.1200664, 0.3311066, -2.268388, 0, 0, 0, 1, 1,
-0.1191205, 0.4379587, 0.6769724, 1, 1, 1, 1, 1,
-0.1162417, -0.3492509, -3.299064, 1, 1, 1, 1, 1,
-0.1161623, -1.437935, -1.684103, 1, 1, 1, 1, 1,
-0.1142897, 0.5676763, -0.1100872, 1, 1, 1, 1, 1,
-0.114257, -1.44323, -2.18089, 1, 1, 1, 1, 1,
-0.1070724, -0.7566218, -1.337147, 1, 1, 1, 1, 1,
-0.1038987, 0.548318, -0.6693213, 1, 1, 1, 1, 1,
-0.1021587, -2.468375, -2.629101, 1, 1, 1, 1, 1,
-0.09891195, -0.7106733, -1.982979, 1, 1, 1, 1, 1,
-0.09687319, -0.5551394, -3.909745, 1, 1, 1, 1, 1,
-0.09594487, 0.8434489, 0.669827, 1, 1, 1, 1, 1,
-0.09546574, 0.3540201, 0.5235299, 1, 1, 1, 1, 1,
-0.09364477, -0.2936963, -4.03933, 1, 1, 1, 1, 1,
-0.08848409, 1.362177, -0.7565266, 1, 1, 1, 1, 1,
-0.08516321, 2.903773, 1.22113, 1, 1, 1, 1, 1,
-0.0756508, -0.9232491, -3.46458, 0, 0, 1, 1, 1,
-0.07467584, 0.9866076, 0.2912714, 1, 0, 0, 1, 1,
-0.07135732, 0.2378471, -1.240627, 1, 0, 0, 1, 1,
-0.06893212, -0.3972066, -3.199449, 1, 0, 0, 1, 1,
-0.06822052, 0.6622354, 1.703593, 1, 0, 0, 1, 1,
-0.05677544, 0.4832076, -1.409769, 1, 0, 0, 1, 1,
-0.05508775, -1.503054, -2.403979, 0, 0, 0, 1, 1,
-0.05187587, -1.268133, -3.431315, 0, 0, 0, 1, 1,
-0.04747659, -0.04173691, -3.511786, 0, 0, 0, 1, 1,
-0.02683736, 0.5984725, 1.564784, 0, 0, 0, 1, 1,
-0.0265504, -0.8402053, -3.262027, 0, 0, 0, 1, 1,
-0.02392607, 0.1839721, 0.5550096, 0, 0, 0, 1, 1,
-0.01920272, 0.00368468, -3.686198, 0, 0, 0, 1, 1,
-0.01650875, -1.870144, -3.51053, 1, 1, 1, 1, 1,
-0.01539352, 0.08121558, -1.959275, 1, 1, 1, 1, 1,
-0.01107337, -0.8560363, -2.802433, 1, 1, 1, 1, 1,
-0.007351946, 0.2996461, -0.001779582, 1, 1, 1, 1, 1,
-0.004473231, -0.4603119, -4.423573, 1, 1, 1, 1, 1,
-0.003616173, -0.06767148, -2.454339, 1, 1, 1, 1, 1,
-0.002173123, 0.05430875, -0.2640851, 1, 1, 1, 1, 1,
-0.001593532, 0.1097233, 0.688661, 1, 1, 1, 1, 1,
-0.0003179381, -1.820727, -1.335816, 1, 1, 1, 1, 1,
0.00090081, -0.4778399, 3.692097, 1, 1, 1, 1, 1,
0.001171016, 0.3149131, -1.080756, 1, 1, 1, 1, 1,
0.006474022, 0.9862059, -0.5115323, 1, 1, 1, 1, 1,
0.006798772, -0.8429751, 4.980283, 1, 1, 1, 1, 1,
0.008120776, 2.50796, 0.5128995, 1, 1, 1, 1, 1,
0.009825049, 0.1912249, 0.4138012, 1, 1, 1, 1, 1,
0.01313713, 0.123754, 0.1170797, 0, 0, 1, 1, 1,
0.01934988, 1.637329, -0.3200209, 1, 0, 0, 1, 1,
0.0194156, -0.4440299, 3.567991, 1, 0, 0, 1, 1,
0.01990025, 0.8317475, 0.6965258, 1, 0, 0, 1, 1,
0.02687863, -0.3327076, 3.365666, 1, 0, 0, 1, 1,
0.02752721, 1.939291, 0.4828718, 1, 0, 0, 1, 1,
0.03083247, 0.052187, 0.8854918, 0, 0, 0, 1, 1,
0.03086374, 0.5559824, 0.8301287, 0, 0, 0, 1, 1,
0.03243022, 0.2797337, 1.187397, 0, 0, 0, 1, 1,
0.03363494, 1.223971, -0.0006279396, 0, 0, 0, 1, 1,
0.0346274, -0.5144937, 4.952204, 0, 0, 0, 1, 1,
0.04021912, 0.265255, 0.192647, 0, 0, 0, 1, 1,
0.04124334, 0.6281199, 0.6578369, 0, 0, 0, 1, 1,
0.04498359, -1.644882, 3.50975, 1, 1, 1, 1, 1,
0.04645021, 0.9525182, 0.3322174, 1, 1, 1, 1, 1,
0.04855338, 0.2105269, 0.2753734, 1, 1, 1, 1, 1,
0.04933995, 0.4359635, 1.368022, 1, 1, 1, 1, 1,
0.0508545, 2.588321, 1.18931, 1, 1, 1, 1, 1,
0.05155096, 0.712226, -0.5048597, 1, 1, 1, 1, 1,
0.05335578, -0.3674677, 2.633189, 1, 1, 1, 1, 1,
0.05386096, -1.762296, 3.245456, 1, 1, 1, 1, 1,
0.05468479, -1.166934, 2.081914, 1, 1, 1, 1, 1,
0.05707347, 1.084095, -1.15647, 1, 1, 1, 1, 1,
0.05827861, 0.5018492, -1.621869, 1, 1, 1, 1, 1,
0.06070221, -1.470397, 3.289092, 1, 1, 1, 1, 1,
0.06256618, -0.4696325, 3.034528, 1, 1, 1, 1, 1,
0.06444404, 0.3884247, 0.5287353, 1, 1, 1, 1, 1,
0.06965081, -0.4215317, 1.5386, 1, 1, 1, 1, 1,
0.07079954, -0.9962314, 2.329644, 0, 0, 1, 1, 1,
0.07216262, 1.4596, -1.667303, 1, 0, 0, 1, 1,
0.07267215, -0.6997218, 1.816002, 1, 0, 0, 1, 1,
0.07296605, -0.8925949, 4.120053, 1, 0, 0, 1, 1,
0.07576186, 0.408604, 1.71822, 1, 0, 0, 1, 1,
0.07910261, 1.245389, 0.3693198, 1, 0, 0, 1, 1,
0.07992598, -1.463876, 3.75712, 0, 0, 0, 1, 1,
0.08063004, 0.8965887, -0.6683032, 0, 0, 0, 1, 1,
0.08230629, -0.8335831, 2.907382, 0, 0, 0, 1, 1,
0.08647603, 0.1641518, 0.3284821, 0, 0, 0, 1, 1,
0.08688021, 0.2883279, 0.1774225, 0, 0, 0, 1, 1,
0.09064271, 0.3034309, -0.2199438, 0, 0, 0, 1, 1,
0.09072025, 1.406169, -1.974236, 0, 0, 0, 1, 1,
0.09388301, 0.03146958, 0.9580727, 1, 1, 1, 1, 1,
0.09419523, 1.081443, 1.007414, 1, 1, 1, 1, 1,
0.09604444, -0.2887718, 3.3545, 1, 1, 1, 1, 1,
0.09729727, -0.5354789, 3.663331, 1, 1, 1, 1, 1,
0.09876017, 1.473933, 0.6044516, 1, 1, 1, 1, 1,
0.09880338, -0.1999687, 2.435152, 1, 1, 1, 1, 1,
0.09956147, -0.2588361, 3.695435, 1, 1, 1, 1, 1,
0.1002537, 0.2584777, -0.5616637, 1, 1, 1, 1, 1,
0.1036226, 0.6772201, 0.7378837, 1, 1, 1, 1, 1,
0.1042897, 1.222922, 0.5594558, 1, 1, 1, 1, 1,
0.1079259, 0.2677772, 0.7559454, 1, 1, 1, 1, 1,
0.1084283, -0.1707137, 1.997127, 1, 1, 1, 1, 1,
0.125364, -1.202041, 3.65371, 1, 1, 1, 1, 1,
0.1253835, 0.02242165, 3.138768, 1, 1, 1, 1, 1,
0.1276399, 1.198555, -1.579555, 1, 1, 1, 1, 1,
0.1287524, 0.2906526, -0.9801793, 0, 0, 1, 1, 1,
0.1300347, 1.133455, 0.8063468, 1, 0, 0, 1, 1,
0.1301023, 0.901738, 0.2488886, 1, 0, 0, 1, 1,
0.1320812, -1.420735, 2.806722, 1, 0, 0, 1, 1,
0.1321044, 0.005367515, 1.851988, 1, 0, 0, 1, 1,
0.1431715, 0.3741943, 0.8696599, 1, 0, 0, 1, 1,
0.1452563, 2.479146, 0.2419079, 0, 0, 0, 1, 1,
0.1519165, 1.089615, 0.2067093, 0, 0, 0, 1, 1,
0.1597644, 1.814045, -0.3544357, 0, 0, 0, 1, 1,
0.1599953, 0.7275848, 0.857505, 0, 0, 0, 1, 1,
0.1604276, -0.8610045, 2.865543, 0, 0, 0, 1, 1,
0.1641332, 0.2261734, 0.1175024, 0, 0, 0, 1, 1,
0.1668031, -0.1453621, 2.155961, 0, 0, 0, 1, 1,
0.1676071, 0.4311688, 0.09910533, 1, 1, 1, 1, 1,
0.1701001, -0.8312588, 1.683025, 1, 1, 1, 1, 1,
0.1729911, -1.516036, 1.722654, 1, 1, 1, 1, 1,
0.1744651, -0.2672526, 3.041658, 1, 1, 1, 1, 1,
0.1782431, -1.366779, 1.709087, 1, 1, 1, 1, 1,
0.179766, 0.5475464, 0.4905026, 1, 1, 1, 1, 1,
0.1800589, -1.382343, 1.918058, 1, 1, 1, 1, 1,
0.1809892, 1.969121, 0.815286, 1, 1, 1, 1, 1,
0.1835838, 0.9835708, 1.215027, 1, 1, 1, 1, 1,
0.1853585, 0.06312629, 2.791466, 1, 1, 1, 1, 1,
0.1874143, 0.72068, 0.9762135, 1, 1, 1, 1, 1,
0.1923711, 1.466268, -0.7407987, 1, 1, 1, 1, 1,
0.1944521, 1.665906, 0.5403417, 1, 1, 1, 1, 1,
0.1994565, -0.4066681, 1.208792, 1, 1, 1, 1, 1,
0.2005124, -0.9211421, 1.853289, 1, 1, 1, 1, 1,
0.2008763, -1.61479, 2.947115, 0, 0, 1, 1, 1,
0.2019397, 0.3135129, 0.6379347, 1, 0, 0, 1, 1,
0.2019825, -0.5581024, 0.7567816, 1, 0, 0, 1, 1,
0.2043905, 0.269115, -1.042374, 1, 0, 0, 1, 1,
0.2118464, 1.713772, 0.3914187, 1, 0, 0, 1, 1,
0.2119766, 0.562178, 0.6154639, 1, 0, 0, 1, 1,
0.212594, -2.233287, 2.856786, 0, 0, 0, 1, 1,
0.2130402, 0.9847254, 0.01605872, 0, 0, 0, 1, 1,
0.2148273, 2.042716, 0.4288907, 0, 0, 0, 1, 1,
0.2210109, 0.5826422, -1.190545, 0, 0, 0, 1, 1,
0.2229399, -0.2264218, 1.223128, 0, 0, 0, 1, 1,
0.22686, -0.6628246, 0.3762738, 0, 0, 0, 1, 1,
0.226953, 1.279789, 0.256541, 0, 0, 0, 1, 1,
0.2303413, -0.1835322, 3.463533, 1, 1, 1, 1, 1,
0.2306403, 0.02652003, 0.9050453, 1, 1, 1, 1, 1,
0.2314396, 1.848182, 1.435681, 1, 1, 1, 1, 1,
0.2331942, 1.723375, -1.263953, 1, 1, 1, 1, 1,
0.2386316, -1.721692, 3.703039, 1, 1, 1, 1, 1,
0.2411205, -0.1414382, 2.187529, 1, 1, 1, 1, 1,
0.2435045, 0.1270851, 1.277574, 1, 1, 1, 1, 1,
0.2547344, -1.057091, 1.412968, 1, 1, 1, 1, 1,
0.2575856, 0.7192503, 0.04242837, 1, 1, 1, 1, 1,
0.2617306, 0.6822412, -0.4012617, 1, 1, 1, 1, 1,
0.263426, 0.2821164, -0.6940043, 1, 1, 1, 1, 1,
0.2648193, -0.826111, 3.09719, 1, 1, 1, 1, 1,
0.2684104, -0.002423343, 0.8015792, 1, 1, 1, 1, 1,
0.270956, 0.8155866, 0.5934536, 1, 1, 1, 1, 1,
0.2733706, 0.4631706, 1.247858, 1, 1, 1, 1, 1,
0.2775195, 1.691929, -0.3819535, 0, 0, 1, 1, 1,
0.2778207, 0.9520277, -0.2609917, 1, 0, 0, 1, 1,
0.2823609, -0.4342118, 2.175733, 1, 0, 0, 1, 1,
0.2892271, -1.449226, 1.960796, 1, 0, 0, 1, 1,
0.2900369, 0.8795361, -0.7315359, 1, 0, 0, 1, 1,
0.2901582, 0.116708, 1.765405, 1, 0, 0, 1, 1,
0.2923774, -2.600097, 3.667053, 0, 0, 0, 1, 1,
0.2991973, 2.250227, -0.8419439, 0, 0, 0, 1, 1,
0.302556, 0.404851, 1.160384, 0, 0, 0, 1, 1,
0.3054895, -1.054134, 3.160361, 0, 0, 0, 1, 1,
0.3076626, 1.926795, 0.6948141, 0, 0, 0, 1, 1,
0.3096495, -0.07889652, 1.597588, 0, 0, 0, 1, 1,
0.3122194, -0.6178682, 3.823056, 0, 0, 0, 1, 1,
0.3123817, 0.3671778, -0.1453419, 1, 1, 1, 1, 1,
0.313079, 0.9534, -0.1439772, 1, 1, 1, 1, 1,
0.3136012, -0.5792492, 1.682527, 1, 1, 1, 1, 1,
0.3193232, -1.328209, 3.256779, 1, 1, 1, 1, 1,
0.3206863, 1.754873, -0.8509604, 1, 1, 1, 1, 1,
0.3221953, 0.5167544, 1.328624, 1, 1, 1, 1, 1,
0.3255998, -0.4397679, 1.614055, 1, 1, 1, 1, 1,
0.3344814, -0.4903519, 3.731348, 1, 1, 1, 1, 1,
0.3352271, -0.7317609, 1.461909, 1, 1, 1, 1, 1,
0.3368655, -0.3419488, 3.280524, 1, 1, 1, 1, 1,
0.3390936, -0.05445716, 0.6374461, 1, 1, 1, 1, 1,
0.3415329, 1.317444, -0.02938979, 1, 1, 1, 1, 1,
0.3445981, 1.014195, 3.226167, 1, 1, 1, 1, 1,
0.3466482, 2.354977, -0.6398869, 1, 1, 1, 1, 1,
0.3491496, -0.1873792, -0.01019558, 1, 1, 1, 1, 1,
0.3532069, 2.526339, -0.4148518, 0, 0, 1, 1, 1,
0.3571418, 0.1999889, 2.326938, 1, 0, 0, 1, 1,
0.3578296, 0.7200325, 0.7898607, 1, 0, 0, 1, 1,
0.3625711, -0.7147596, 3.026403, 1, 0, 0, 1, 1,
0.364592, -0.2491462, 2.797578, 1, 0, 0, 1, 1,
0.36544, 0.7978427, -0.1481231, 1, 0, 0, 1, 1,
0.3666409, 0.6914824, 0.4374186, 0, 0, 0, 1, 1,
0.3668429, 1.44625, 1.655724, 0, 0, 0, 1, 1,
0.3754402, 1.219851, 0.76987, 0, 0, 0, 1, 1,
0.3759322, -0.7604719, 0.7096753, 0, 0, 0, 1, 1,
0.3775537, 0.1789269, 0.7840824, 0, 0, 0, 1, 1,
0.3811319, -0.4271998, 1.822353, 0, 0, 0, 1, 1,
0.3829441, -0.4689172, 1.73474, 0, 0, 0, 1, 1,
0.388027, -1.037843, 2.572485, 1, 1, 1, 1, 1,
0.3901792, 0.2080659, 2.347903, 1, 1, 1, 1, 1,
0.3919687, -1.101323, 3.711213, 1, 1, 1, 1, 1,
0.3920082, -0.1706492, 0.7942493, 1, 1, 1, 1, 1,
0.3921086, -0.4147905, 3.953462, 1, 1, 1, 1, 1,
0.3936771, -0.350794, 2.058956, 1, 1, 1, 1, 1,
0.3993164, -0.6448666, 2.9956, 1, 1, 1, 1, 1,
0.4020732, -0.258278, 3.138581, 1, 1, 1, 1, 1,
0.4078202, -0.03702773, 1.543144, 1, 1, 1, 1, 1,
0.4105306, 1.947222, 0.2349343, 1, 1, 1, 1, 1,
0.4108181, -2.385502, 4.752973, 1, 1, 1, 1, 1,
0.4171677, 0.01187412, 0.2331681, 1, 1, 1, 1, 1,
0.4196864, -0.962873, 3.345111, 1, 1, 1, 1, 1,
0.4218841, -1.087101, 2.672028, 1, 1, 1, 1, 1,
0.424089, 0.5033921, 0.7147754, 1, 1, 1, 1, 1,
0.4296634, 1.510519, 1.094192, 0, 0, 1, 1, 1,
0.4316854, 1.139193, -1.353428, 1, 0, 0, 1, 1,
0.4324676, -1.489829, 2.296948, 1, 0, 0, 1, 1,
0.4329491, 0.09082522, 1.905822, 1, 0, 0, 1, 1,
0.4372063, 1.092001, 0.3338944, 1, 0, 0, 1, 1,
0.4372902, 0.2612164, -1.248346, 1, 0, 0, 1, 1,
0.4403816, 1.366954, 0.4508793, 0, 0, 0, 1, 1,
0.4438394, 1.024659, 0.8690983, 0, 0, 0, 1, 1,
0.4457996, -0.4139405, 1.210499, 0, 0, 0, 1, 1,
0.4526384, -0.2721802, 2.86869, 0, 0, 0, 1, 1,
0.4550084, -0.3921267, 2.941539, 0, 0, 0, 1, 1,
0.4552817, -1.478464, 3.171398, 0, 0, 0, 1, 1,
0.4557957, -1.014353, 3.196498, 0, 0, 0, 1, 1,
0.4604727, 0.9889373, 1.026603, 1, 1, 1, 1, 1,
0.4614245, -0.6411025, 1.235982, 1, 1, 1, 1, 1,
0.4630309, -1.41776, 2.766342, 1, 1, 1, 1, 1,
0.4632336, -0.2419695, 2.746311, 1, 1, 1, 1, 1,
0.4635607, 1.097389, 1.714203, 1, 1, 1, 1, 1,
0.4651479, -0.02634364, 1.529759, 1, 1, 1, 1, 1,
0.4694305, 0.4833405, 0.2388261, 1, 1, 1, 1, 1,
0.4701577, -0.6968212, 1.968419, 1, 1, 1, 1, 1,
0.4713317, 1.545751, 0.005977297, 1, 1, 1, 1, 1,
0.4734097, 0.5808891, 2.171695, 1, 1, 1, 1, 1,
0.4741654, -0.04246098, 0.8060741, 1, 1, 1, 1, 1,
0.4763329, -1.414549, 2.114958, 1, 1, 1, 1, 1,
0.4766831, 0.9922788, -0.2041393, 1, 1, 1, 1, 1,
0.4804634, 0.2996913, 3.653664, 1, 1, 1, 1, 1,
0.4822047, -2.39784, 3.39856, 1, 1, 1, 1, 1,
0.4839526, 0.1185355, 2.768516, 0, 0, 1, 1, 1,
0.4945782, 0.03418554, -0.1416186, 1, 0, 0, 1, 1,
0.4966403, 0.460048, -0.8523951, 1, 0, 0, 1, 1,
0.4971101, -1.132752, 3.294891, 1, 0, 0, 1, 1,
0.5029134, -0.8466881, 2.44244, 1, 0, 0, 1, 1,
0.5059888, 0.816458, 0.3986597, 1, 0, 0, 1, 1,
0.5068821, 0.9521409, 0.5400106, 0, 0, 0, 1, 1,
0.510878, 0.8810607, -0.1501987, 0, 0, 0, 1, 1,
0.5158794, -0.07343473, 2.126709, 0, 0, 0, 1, 1,
0.5167385, 0.1652348, 1.824862, 0, 0, 0, 1, 1,
0.5187377, -0.7731817, 3.432841, 0, 0, 0, 1, 1,
0.5200324, 0.732685, 0.6865863, 0, 0, 0, 1, 1,
0.5205477, -0.4085067, 1.085785, 0, 0, 0, 1, 1,
0.5277854, -0.5246722, 0.6039452, 1, 1, 1, 1, 1,
0.5278816, -0.6271751, 2.016351, 1, 1, 1, 1, 1,
0.5298507, -0.02201293, 2.36335, 1, 1, 1, 1, 1,
0.5317491, 0.8891052, -0.4874213, 1, 1, 1, 1, 1,
0.5321143, -1.672935, 4.282957, 1, 1, 1, 1, 1,
0.5326533, 0.3569695, 0.6454549, 1, 1, 1, 1, 1,
0.5394876, 0.8388712, 0.487676, 1, 1, 1, 1, 1,
0.5406496, 0.218509, 0.9375518, 1, 1, 1, 1, 1,
0.5423166, -0.3138991, 2.497504, 1, 1, 1, 1, 1,
0.5426855, 1.286588, 1.402984, 1, 1, 1, 1, 1,
0.5432616, -0.4045642, 2.489968, 1, 1, 1, 1, 1,
0.5433859, -2.376112, 2.890989, 1, 1, 1, 1, 1,
0.5477812, 1.057162, 0.1194649, 1, 1, 1, 1, 1,
0.5490028, 0.1886262, 2.330265, 1, 1, 1, 1, 1,
0.5512931, 1.890505, -0.4912741, 1, 1, 1, 1, 1,
0.5539547, -1.73943, 3.568153, 0, 0, 1, 1, 1,
0.5547234, -1.995638, 0.659779, 1, 0, 0, 1, 1,
0.5605723, 0.7020551, 2.664456, 1, 0, 0, 1, 1,
0.5651855, 0.380085, 1.479827, 1, 0, 0, 1, 1,
0.5688537, -0.9065928, 2.743818, 1, 0, 0, 1, 1,
0.5690171, -1.492286, 2.405173, 1, 0, 0, 1, 1,
0.5717084, 1.060421, 0.03726687, 0, 0, 0, 1, 1,
0.5719006, 0.8622755, 0.8353443, 0, 0, 0, 1, 1,
0.5724103, -1.780687, 2.750469, 0, 0, 0, 1, 1,
0.5747139, -0.9912403, 3.495539, 0, 0, 0, 1, 1,
0.5769442, -0.7426211, 2.676708, 0, 0, 0, 1, 1,
0.5796843, -0.6513181, 3.903637, 0, 0, 0, 1, 1,
0.5808883, 0.08132032, 0.7119956, 0, 0, 0, 1, 1,
0.5852646, 0.4362043, 1.879746, 1, 1, 1, 1, 1,
0.5877271, 0.3001914, 2.596993, 1, 1, 1, 1, 1,
0.5905696, -0.2084543, 1.622916, 1, 1, 1, 1, 1,
0.5928017, 0.6156572, -0.03401618, 1, 1, 1, 1, 1,
0.600215, 0.110388, 0.4085745, 1, 1, 1, 1, 1,
0.6019031, -0.4187046, 3.250119, 1, 1, 1, 1, 1,
0.6048915, -0.8484655, 5.165167, 1, 1, 1, 1, 1,
0.6055565, -0.5019098, 2.617754, 1, 1, 1, 1, 1,
0.6065297, -0.1132271, 1.769097, 1, 1, 1, 1, 1,
0.6096316, -0.5214657, 0.5608001, 1, 1, 1, 1, 1,
0.6222275, -0.9647079, 1.38122, 1, 1, 1, 1, 1,
0.6277829, 0.1206916, 2.609742, 1, 1, 1, 1, 1,
0.6290494, 0.7644055, 1.384271, 1, 1, 1, 1, 1,
0.6310527, 0.3306649, 1.076027, 1, 1, 1, 1, 1,
0.636715, 0.9742047, 1.49466, 1, 1, 1, 1, 1,
0.638341, 0.09483593, 1.172707, 0, 0, 1, 1, 1,
0.63853, 0.462593, 0.5196876, 1, 0, 0, 1, 1,
0.6442071, 0.7079647, 0.7092276, 1, 0, 0, 1, 1,
0.6447773, -0.293626, 2.464664, 1, 0, 0, 1, 1,
0.6461833, -0.2366943, 2.11549, 1, 0, 0, 1, 1,
0.6511046, 1.153145, 0.3755239, 1, 0, 0, 1, 1,
0.6576718, 0.5100914, 1.147165, 0, 0, 0, 1, 1,
0.6606399, 0.3041053, 3.73259, 0, 0, 0, 1, 1,
0.6731693, -1.105818, 1.405613, 0, 0, 0, 1, 1,
0.6732762, -0.1598344, 1.460578, 0, 0, 0, 1, 1,
0.6744314, 0.17218, 2.344616, 0, 0, 0, 1, 1,
0.6800906, -1.110167, 0.3000135, 0, 0, 0, 1, 1,
0.6801679, -0.02448704, 0.7896733, 0, 0, 0, 1, 1,
0.6815482, -0.4843319, 2.151582, 1, 1, 1, 1, 1,
0.6817277, -0.09724882, 2.826801, 1, 1, 1, 1, 1,
0.6869861, 1.66004, 0.7526052, 1, 1, 1, 1, 1,
0.6870821, -0.9767251, 2.920604, 1, 1, 1, 1, 1,
0.6911746, 1.266418, -0.1986, 1, 1, 1, 1, 1,
0.6945489, 0.1041455, 0.9437507, 1, 1, 1, 1, 1,
0.6955115, -0.8395227, 3.371052, 1, 1, 1, 1, 1,
0.6966881, 0.8988767, 0.8642926, 1, 1, 1, 1, 1,
0.7050416, 0.2324653, 1.976166, 1, 1, 1, 1, 1,
0.7092627, 1.651362, 0.5513328, 1, 1, 1, 1, 1,
0.7094126, -0.1710155, 2.153311, 1, 1, 1, 1, 1,
0.7146994, 0.1455087, 2.317416, 1, 1, 1, 1, 1,
0.7179445, 0.09794161, -0.5428506, 1, 1, 1, 1, 1,
0.7186396, 0.9884912, -0.3310297, 1, 1, 1, 1, 1,
0.7193861, 0.5389697, 0.1208741, 1, 1, 1, 1, 1,
0.720461, -2.345847, 3.215837, 0, 0, 1, 1, 1,
0.7250639, 0.5245219, -1.026346, 1, 0, 0, 1, 1,
0.7369269, -1.702116, 1.369229, 1, 0, 0, 1, 1,
0.7393014, -0.9535759, 2.515666, 1, 0, 0, 1, 1,
0.7448545, -1.644325, 2.409778, 1, 0, 0, 1, 1,
0.746563, 1.946856, 0.7692803, 1, 0, 0, 1, 1,
0.7472019, -0.5679902, 1.190219, 0, 0, 0, 1, 1,
0.7492689, 0.8415054, 1.322137, 0, 0, 0, 1, 1,
0.7611969, -0.3312628, 1.079877, 0, 0, 0, 1, 1,
0.7613783, -0.8171674, 2.101905, 0, 0, 0, 1, 1,
0.7614415, 0.3070712, 0.552843, 0, 0, 0, 1, 1,
0.763474, -0.6696045, 3.271293, 0, 0, 0, 1, 1,
0.7641201, 1.858458, -0.4180122, 0, 0, 0, 1, 1,
0.7671003, -1.946301, 4.248058, 1, 1, 1, 1, 1,
0.7730379, 0.08188105, 0.7830734, 1, 1, 1, 1, 1,
0.7732902, -0.4696139, 2.608497, 1, 1, 1, 1, 1,
0.7756173, 0.8778253, 1.451432, 1, 1, 1, 1, 1,
0.7770884, -0.9606121, 0.651666, 1, 1, 1, 1, 1,
0.7785473, -0.3604375, 2.768978, 1, 1, 1, 1, 1,
0.7800779, 1.149145, 1.922209, 1, 1, 1, 1, 1,
0.7876885, -0.875912, 2.811274, 1, 1, 1, 1, 1,
0.7885276, 0.2417864, 0.1161293, 1, 1, 1, 1, 1,
0.7995742, -0.07155146, 1.20477, 1, 1, 1, 1, 1,
0.8047504, 0.7154078, -0.04864305, 1, 1, 1, 1, 1,
0.8097095, -1.644211, 2.452556, 1, 1, 1, 1, 1,
0.8243618, 0.5612962, 1.987167, 1, 1, 1, 1, 1,
0.8285437, -0.3167999, 1.866046, 1, 1, 1, 1, 1,
0.8292973, 0.310113, 0.2320137, 1, 1, 1, 1, 1,
0.8315786, -1.473982, 4.80087, 0, 0, 1, 1, 1,
0.8338778, 0.7055352, 0.1836023, 1, 0, 0, 1, 1,
0.8343875, -1.247555, 2.28021, 1, 0, 0, 1, 1,
0.842745, -0.09523383, 2.095361, 1, 0, 0, 1, 1,
0.844647, 0.01552485, 1.832157, 1, 0, 0, 1, 1,
0.8473206, -1.297252, 2.821409, 1, 0, 0, 1, 1,
0.8474693, 1.643582, -0.6255594, 0, 0, 0, 1, 1,
0.8477325, 1.351282, 0.7471263, 0, 0, 0, 1, 1,
0.8479103, 0.02502447, 4.234122, 0, 0, 0, 1, 1,
0.8530806, -0.4987477, 1.642345, 0, 0, 0, 1, 1,
0.8624857, -1.313585, 2.802862, 0, 0, 0, 1, 1,
0.8657259, -1.664194, 1.947505, 0, 0, 0, 1, 1,
0.8692256, 0.03568897, 3.002809, 0, 0, 0, 1, 1,
0.8702918, 0.6422684, 1.498833, 1, 1, 1, 1, 1,
0.8721182, 0.1890444, 2.707458, 1, 1, 1, 1, 1,
0.8804461, 1.75951, 0.6716918, 1, 1, 1, 1, 1,
0.8885711, 2.889611, -1.220532, 1, 1, 1, 1, 1,
0.8886297, 0.1295024, 0.1241749, 1, 1, 1, 1, 1,
0.8893211, 3.324186, -0.8202388, 1, 1, 1, 1, 1,
0.9038979, 1.348479, -1.025696, 1, 1, 1, 1, 1,
0.9100767, -1.521315, 4.04353, 1, 1, 1, 1, 1,
0.9118972, 1.066164, 2.011674, 1, 1, 1, 1, 1,
0.9129105, -0.1465593, 2.912244, 1, 1, 1, 1, 1,
0.916088, 0.1360101, 1.044381, 1, 1, 1, 1, 1,
0.9166044, -0.1797311, 1.634656, 1, 1, 1, 1, 1,
0.918521, -0.0006820565, 3.916425, 1, 1, 1, 1, 1,
0.9187472, -0.2962413, 2.637682, 1, 1, 1, 1, 1,
0.9195532, 1.340278, 1.453241, 1, 1, 1, 1, 1,
0.9200659, 0.6418422, 0.7869457, 0, 0, 1, 1, 1,
0.9244157, 0.3978513, 1.962678, 1, 0, 0, 1, 1,
0.9252224, -0.4264582, 0.8271307, 1, 0, 0, 1, 1,
0.9253442, -1.434081, 2.848505, 1, 0, 0, 1, 1,
0.934842, -1.784419, 0.9296818, 1, 0, 0, 1, 1,
0.9353608, 0.7875216, 1.895778, 1, 0, 0, 1, 1,
0.9397402, -2.078105, 1.280643, 0, 0, 0, 1, 1,
0.9408957, 0.5252658, 1.169484, 0, 0, 0, 1, 1,
0.9451457, -1.357541, 1.924271, 0, 0, 0, 1, 1,
0.9554644, 0.2374969, 0.2051929, 0, 0, 0, 1, 1,
0.9614013, -0.3058253, 0.3047301, 0, 0, 0, 1, 1,
0.9656604, 1.329605, 2.139815, 0, 0, 0, 1, 1,
0.974495, 1.008498, -0.8311343, 0, 0, 0, 1, 1,
0.9766448, -0.05433449, 2.739457, 1, 1, 1, 1, 1,
0.9807876, 0.6147153, -0.02100074, 1, 1, 1, 1, 1,
0.9846535, -0.2908855, 1.106711, 1, 1, 1, 1, 1,
0.9903194, 0.2613834, 0.6493454, 1, 1, 1, 1, 1,
0.9941639, 0.4463427, 2.268492, 1, 1, 1, 1, 1,
0.9962293, 1.11692, 1.314633, 1, 1, 1, 1, 1,
0.9966868, 0.03900972, 2.242498, 1, 1, 1, 1, 1,
1.001021, 0.7359707, 0.4399436, 1, 1, 1, 1, 1,
1.002196, -0.3819028, 1.188499, 1, 1, 1, 1, 1,
1.016596, -0.117731, 2.44003, 1, 1, 1, 1, 1,
1.01991, -0.3635508, 2.427328, 1, 1, 1, 1, 1,
1.02151, 1.664731, 0.04054789, 1, 1, 1, 1, 1,
1.023507, 1.356925, 0.1662435, 1, 1, 1, 1, 1,
1.025916, -1.188694, 3.745624, 1, 1, 1, 1, 1,
1.033185, -1.283034, 2.071902, 1, 1, 1, 1, 1,
1.039668, 0.1546543, -0.3724619, 0, 0, 1, 1, 1,
1.040398, -0.5617789, 0.1402094, 1, 0, 0, 1, 1,
1.041365, -1.795189, 2.591864, 1, 0, 0, 1, 1,
1.042429, -0.1885727, 2.255469, 1, 0, 0, 1, 1,
1.042651, 0.7884195, 0.7943969, 1, 0, 0, 1, 1,
1.04781, -2.22747, 1.963634, 1, 0, 0, 1, 1,
1.048653, 0.8847988, 0.4611169, 0, 0, 0, 1, 1,
1.049073, -0.6960312, 3.04122, 0, 0, 0, 1, 1,
1.050005, 1.431399, 1.343452, 0, 0, 0, 1, 1,
1.055242, -1.076903, 2.4735, 0, 0, 0, 1, 1,
1.065626, -1.148012, 2.404782, 0, 0, 0, 1, 1,
1.066015, 0.8332257, 0.8962143, 0, 0, 0, 1, 1,
1.074865, 0.03940564, 1.052384, 0, 0, 0, 1, 1,
1.076173, -0.8781419, 3.284037, 1, 1, 1, 1, 1,
1.084477, 0.8004602, -0.5487051, 1, 1, 1, 1, 1,
1.091827, 0.5511234, -0.2142303, 1, 1, 1, 1, 1,
1.091985, 0.6280143, 1.891576, 1, 1, 1, 1, 1,
1.094375, 0.5798828, 0.6295305, 1, 1, 1, 1, 1,
1.10429, -0.7874299, 1.542999, 1, 1, 1, 1, 1,
1.119487, 1.18048, -0.5663208, 1, 1, 1, 1, 1,
1.120074, -1.119264, 1.958813, 1, 1, 1, 1, 1,
1.125797, 0.8973665, 1.669481, 1, 1, 1, 1, 1,
1.13691, 0.4913217, 0.5740148, 1, 1, 1, 1, 1,
1.137626, 0.5385362, 1.736042, 1, 1, 1, 1, 1,
1.140062, 0.8811765, 2.256844, 1, 1, 1, 1, 1,
1.140679, -0.7469637, 1.846605, 1, 1, 1, 1, 1,
1.141153, -1.140762, 2.099868, 1, 1, 1, 1, 1,
1.15672, 0.3398015, -0.03598496, 1, 1, 1, 1, 1,
1.159694, -0.7437429, 1.428521, 0, 0, 1, 1, 1,
1.168486, -0.3635073, 0.1256194, 1, 0, 0, 1, 1,
1.175568, 0.4305564, 2.508415, 1, 0, 0, 1, 1,
1.179021, 0.4483596, 3.337866, 1, 0, 0, 1, 1,
1.180424, -0.3960304, 2.120981, 1, 0, 0, 1, 1,
1.20175, 1.021449, 0.5676554, 1, 0, 0, 1, 1,
1.218125, -0.1093625, 2.780434, 0, 0, 0, 1, 1,
1.227412, 1.321226, 0.9340416, 0, 0, 0, 1, 1,
1.230025, -0.1395342, 1.440729, 0, 0, 0, 1, 1,
1.239284, -0.1060978, 1.909805, 0, 0, 0, 1, 1,
1.24492, 2.416796, -1.411305, 0, 0, 0, 1, 1,
1.24578, 1.197204, 1.726079, 0, 0, 0, 1, 1,
1.250667, 1.195363, 0.9149558, 0, 0, 0, 1, 1,
1.251853, -0.8639067, 2.1938, 1, 1, 1, 1, 1,
1.253147, 0.04029683, 3.43891, 1, 1, 1, 1, 1,
1.255457, -1.939229, 3.978459, 1, 1, 1, 1, 1,
1.264987, 0.4597092, 2.807467, 1, 1, 1, 1, 1,
1.265938, -0.6192791, 1.640636, 1, 1, 1, 1, 1,
1.266827, -0.2058599, 1.806161, 1, 1, 1, 1, 1,
1.270481, 0.6132689, 0.3012465, 1, 1, 1, 1, 1,
1.281905, -1.11938, 1.347652, 1, 1, 1, 1, 1,
1.282938, -1.439217, 3.546576, 1, 1, 1, 1, 1,
1.294499, -0.02564842, 0.4313191, 1, 1, 1, 1, 1,
1.29571, -0.4641628, 1.344641, 1, 1, 1, 1, 1,
1.296939, 0.2952843, 2.599854, 1, 1, 1, 1, 1,
1.299492, -1.021984, 2.753027, 1, 1, 1, 1, 1,
1.315143, 2.43756, -0.5678498, 1, 1, 1, 1, 1,
1.339182, 1.560664, 0.9572436, 1, 1, 1, 1, 1,
1.343578, -0.04304624, 1.399379, 0, 0, 1, 1, 1,
1.359683, -1.02645, 3.368619, 1, 0, 0, 1, 1,
1.360526, 0.05156002, 1.925334, 1, 0, 0, 1, 1,
1.366315, 0.5007479, 0.04449475, 1, 0, 0, 1, 1,
1.37324, -0.6342907, 1.761452, 1, 0, 0, 1, 1,
1.37791, 0.2950082, 2.5591, 1, 0, 0, 1, 1,
1.396707, -0.7281083, -0.5804026, 0, 0, 0, 1, 1,
1.408208, 0.1391543, 1.178293, 0, 0, 0, 1, 1,
1.412233, -0.2026938, 0.5635886, 0, 0, 0, 1, 1,
1.415647, -1.404688, 3.728599, 0, 0, 0, 1, 1,
1.417284, -0.06398913, 2.120745, 0, 0, 0, 1, 1,
1.420376, -0.3874872, 0.07244954, 0, 0, 0, 1, 1,
1.432703, -0.5214723, 0.3428394, 0, 0, 0, 1, 1,
1.434155, -0.186489, 0.4308635, 1, 1, 1, 1, 1,
1.453414, 0.4036266, 1.167623, 1, 1, 1, 1, 1,
1.460785, -0.1046207, 1.145111, 1, 1, 1, 1, 1,
1.519049, -2.181386, 0.2681577, 1, 1, 1, 1, 1,
1.562931, -1.222226, 3.207397, 1, 1, 1, 1, 1,
1.56664, 0.1207265, 2.852324, 1, 1, 1, 1, 1,
1.572737, -1.081517, 3.037935, 1, 1, 1, 1, 1,
1.591196, 0.550727, 1.295754, 1, 1, 1, 1, 1,
1.593642, -1.154182, 2.015446, 1, 1, 1, 1, 1,
1.595641, -0.3296484, 2.687823, 1, 1, 1, 1, 1,
1.608285, -0.1872735, 0.6915693, 1, 1, 1, 1, 1,
1.617308, 0.4885889, -0.402833, 1, 1, 1, 1, 1,
1.618332, 0.5470177, 3.127439, 1, 1, 1, 1, 1,
1.618752, -0.7116425, 2.953943, 1, 1, 1, 1, 1,
1.625592, -0.1778931, 1.881019, 1, 1, 1, 1, 1,
1.632361, -0.2649309, 0.9499096, 0, 0, 1, 1, 1,
1.680151, 2.509835, -0.5729688, 1, 0, 0, 1, 1,
1.708529, 1.257122, 2.075902, 1, 0, 0, 1, 1,
1.715418, 1.455723, 2.232877, 1, 0, 0, 1, 1,
1.737728, 1.536466, -0.3372892, 1, 0, 0, 1, 1,
1.741854, 0.4769824, 1.979046, 1, 0, 0, 1, 1,
1.761362, 0.417122, 1.009322, 0, 0, 0, 1, 1,
1.762338, -0.1624309, 2.104842, 0, 0, 0, 1, 1,
1.780625, -0.7306204, 1.370054, 0, 0, 0, 1, 1,
1.784262, 0.2246712, 1.047518, 0, 0, 0, 1, 1,
1.811248, 0.4424841, 3.006345, 0, 0, 0, 1, 1,
1.838563, -0.1407758, 1.98964, 0, 0, 0, 1, 1,
1.843495, -0.3864023, 1.044033, 0, 0, 0, 1, 1,
1.849754, 0.605311, 0.3274496, 1, 1, 1, 1, 1,
1.858489, 2.431462, 0.925809, 1, 1, 1, 1, 1,
1.866019, 0.3471003, 1.474624, 1, 1, 1, 1, 1,
1.881273, -0.4841732, 1.651469, 1, 1, 1, 1, 1,
1.897175, 1.882937, 2.3522, 1, 1, 1, 1, 1,
1.897279, -0.8186619, 3.281119, 1, 1, 1, 1, 1,
1.905047, 0.8687794, 0.9145937, 1, 1, 1, 1, 1,
1.9067, 1.214797, 0.9435855, 1, 1, 1, 1, 1,
1.927263, -1.062288, 2.675883, 1, 1, 1, 1, 1,
1.953916, 1.306998, 0.09987081, 1, 1, 1, 1, 1,
2.006773, -0.40629, 0.6450427, 1, 1, 1, 1, 1,
2.017175, 0.3112526, 0.6672584, 1, 1, 1, 1, 1,
2.019957, 0.1432343, 2.883722, 1, 1, 1, 1, 1,
2.06377, 1.567894, 0.6934603, 1, 1, 1, 1, 1,
2.095569, -0.9103449, 2.660317, 1, 1, 1, 1, 1,
2.096218, -0.7074927, 4.412145, 0, 0, 1, 1, 1,
2.138801, -0.5497479, 2.615667, 1, 0, 0, 1, 1,
2.139337, 1.755518, 1.51248, 1, 0, 0, 1, 1,
2.147276, 0.6903129, 0.4881011, 1, 0, 0, 1, 1,
2.1998, 0.3968502, 1.882373, 1, 0, 0, 1, 1,
2.219582, -0.4178502, 2.046886, 1, 0, 0, 1, 1,
2.249259, 0.3880772, 0.4445745, 0, 0, 0, 1, 1,
2.278307, -0.7840409, 2.92843, 0, 0, 0, 1, 1,
2.337582, -0.1074361, 0.659727, 0, 0, 0, 1, 1,
2.39788, -0.166354, 3.341611, 0, 0, 0, 1, 1,
2.4626, 0.8705953, 2.107321, 0, 0, 0, 1, 1,
2.474634, 0.7713906, 2.170039, 0, 0, 0, 1, 1,
2.480598, -0.4867939, 1.759456, 0, 0, 0, 1, 1,
2.52533, 0.9153474, 0.6721976, 1, 1, 1, 1, 1,
2.551123, 0.4423028, 2.699431, 1, 1, 1, 1, 1,
2.655996, 1.383984, 1.172266, 1, 1, 1, 1, 1,
2.744853, 0.882028, 0.2346217, 1, 1, 1, 1, 1,
2.8083, -0.1576779, 1.170505, 1, 1, 1, 1, 1,
3.04562, 0.8640825, 1.784468, 1, 1, 1, 1, 1,
3.195382, 0.6278911, 0.7968239, 1, 1, 1, 1, 1
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
var radius = 9.634406;
var distance = 33.84044;
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
mvMatrix.translate( 0.01366568, 0.03475451, 0.1590526 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.84044);
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