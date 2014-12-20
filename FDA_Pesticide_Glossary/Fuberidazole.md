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
-3.349955, 0.4889263, -2.008393, 1, 0, 0, 1,
-3.217199, 2.181194, -1.438155, 1, 0.007843138, 0, 1,
-3.019148, -1.095849, -3.650654, 1, 0.01176471, 0, 1,
-3.000631, 0.5069035, -2.607932, 1, 0.01960784, 0, 1,
-2.839427, -1.459251, -3.168285, 1, 0.02352941, 0, 1,
-2.774465, 0.227523, -1.413882, 1, 0.03137255, 0, 1,
-2.67593, -0.4405652, -0.874081, 1, 0.03529412, 0, 1,
-2.581365, 1.112502, -2.095489, 1, 0.04313726, 0, 1,
-2.571783, -0.2292786, -1.910046, 1, 0.04705882, 0, 1,
-2.556905, -0.05206442, -0.9470483, 1, 0.05490196, 0, 1,
-2.483871, -0.3824648, -1.803952, 1, 0.05882353, 0, 1,
-2.358866, 1.054738, -3.24534, 1, 0.06666667, 0, 1,
-2.352283, 0.5562677, -2.016096, 1, 0.07058824, 0, 1,
-2.314057, -0.3849882, -0.5030985, 1, 0.07843138, 0, 1,
-2.286788, -1.32276, -2.834832, 1, 0.08235294, 0, 1,
-2.251252, -0.09680901, -1.265936, 1, 0.09019608, 0, 1,
-2.239123, -0.134052, -0.9565491, 1, 0.09411765, 0, 1,
-2.197542, -3.153484, -5.697949, 1, 0.1019608, 0, 1,
-2.187997, 0.702197, -3.344003, 1, 0.1098039, 0, 1,
-2.184917, -0.1056864, -0.5212083, 1, 0.1137255, 0, 1,
-2.115287, 2.640601, -0.4420276, 1, 0.1215686, 0, 1,
-2.1059, 0.2301543, -1.768949, 1, 0.1254902, 0, 1,
-2.052711, -2.015093, -1.828107, 1, 0.1333333, 0, 1,
-2.051127, 1.459192, -2.183224, 1, 0.1372549, 0, 1,
-2.050264, 0.7762823, 0.6103066, 1, 0.145098, 0, 1,
-2.049077, 0.5681347, -0.9875332, 1, 0.1490196, 0, 1,
-2.024522, -0.07014372, -2.546859, 1, 0.1568628, 0, 1,
-1.998153, 1.781223, -0.9099328, 1, 0.1607843, 0, 1,
-1.997186, -0.6455535, -2.72462, 1, 0.1686275, 0, 1,
-1.952891, -0.645072, -0.5549359, 1, 0.172549, 0, 1,
-1.949778, 0.5235468, 0.1825243, 1, 0.1803922, 0, 1,
-1.92207, -0.9202482, -3.23332, 1, 0.1843137, 0, 1,
-1.876222, 1.115387, -1.107852, 1, 0.1921569, 0, 1,
-1.870343, 0.6068149, -0.3471862, 1, 0.1960784, 0, 1,
-1.861343, 1.750431, 0.05726682, 1, 0.2039216, 0, 1,
-1.830864, -1.28, -1.863192, 1, 0.2117647, 0, 1,
-1.821087, 0.9920993, -2.150288, 1, 0.2156863, 0, 1,
-1.792801, 1.298533, -1.232525, 1, 0.2235294, 0, 1,
-1.7915, 0.3123314, -2.634563, 1, 0.227451, 0, 1,
-1.784368, -0.2229552, -0.8001482, 1, 0.2352941, 0, 1,
-1.721487, -0.7138878, -1.407531, 1, 0.2392157, 0, 1,
-1.718601, -0.008735462, -1.717846, 1, 0.2470588, 0, 1,
-1.718084, 2.013434, 0.09635803, 1, 0.2509804, 0, 1,
-1.707602, -1.71913, -3.208969, 1, 0.2588235, 0, 1,
-1.696301, 0.8937148, -1.560817, 1, 0.2627451, 0, 1,
-1.694753, -1.931794, -1.742352, 1, 0.2705882, 0, 1,
-1.684224, -0.4825527, -0.7494734, 1, 0.2745098, 0, 1,
-1.681509, -0.8053382, -2.284318, 1, 0.282353, 0, 1,
-1.671033, -0.1236716, -1.090771, 1, 0.2862745, 0, 1,
-1.667461, -0.5087575, -1.284455, 1, 0.2941177, 0, 1,
-1.649627, -0.7018586, -1.741381, 1, 0.3019608, 0, 1,
-1.64913, 0.1220692, -1.086797, 1, 0.3058824, 0, 1,
-1.647199, 1.200203, -1.582169, 1, 0.3137255, 0, 1,
-1.644628, 0.565855, -0.2989947, 1, 0.3176471, 0, 1,
-1.638801, 0.5656176, -1.103906, 1, 0.3254902, 0, 1,
-1.624157, -0.8315631, -1.501434, 1, 0.3294118, 0, 1,
-1.610734, -0.1467394, -2.100323, 1, 0.3372549, 0, 1,
-1.605411, -0.06430984, -1.805957, 1, 0.3411765, 0, 1,
-1.591064, 1.577422, -1.685486, 1, 0.3490196, 0, 1,
-1.588642, -0.5343452, -1.018728, 1, 0.3529412, 0, 1,
-1.584415, 0.4916902, -1.313294, 1, 0.3607843, 0, 1,
-1.582852, -0.906882, -3.086843, 1, 0.3647059, 0, 1,
-1.57872, -1.176361, -2.776332, 1, 0.372549, 0, 1,
-1.578557, -2.593396, -3.386662, 1, 0.3764706, 0, 1,
-1.567497, -0.1035027, -1.610131, 1, 0.3843137, 0, 1,
-1.556698, 0.8749893, -0.8857217, 1, 0.3882353, 0, 1,
-1.555757, 0.1214578, -2.27661, 1, 0.3960784, 0, 1,
-1.553805, 0.08945148, -1.356147, 1, 0.4039216, 0, 1,
-1.549781, -0.2581057, -0.703959, 1, 0.4078431, 0, 1,
-1.549131, -0.04071283, -0.952938, 1, 0.4156863, 0, 1,
-1.548473, 1.19892, -2.766896, 1, 0.4196078, 0, 1,
-1.545043, 0.3892296, -1.184069, 1, 0.427451, 0, 1,
-1.540549, 0.3983953, -2.438825, 1, 0.4313726, 0, 1,
-1.51443, -0.4190977, -4.034511, 1, 0.4392157, 0, 1,
-1.50957, 0.2317849, -1.530494, 1, 0.4431373, 0, 1,
-1.485659, 0.220113, -1.986331, 1, 0.4509804, 0, 1,
-1.483634, 0.07434993, -1.494559, 1, 0.454902, 0, 1,
-1.47355, 0.8103546, -0.2944752, 1, 0.4627451, 0, 1,
-1.469508, -1.435616, -3.093322, 1, 0.4666667, 0, 1,
-1.469059, 0.3005815, -0.5917304, 1, 0.4745098, 0, 1,
-1.464435, -0.5722931, -1.279827, 1, 0.4784314, 0, 1,
-1.460496, -0.5461401, -2.443564, 1, 0.4862745, 0, 1,
-1.438874, 0.4331566, -2.502158, 1, 0.4901961, 0, 1,
-1.436165, 0.426859, -0.4609331, 1, 0.4980392, 0, 1,
-1.431336, 0.8064034, 0.4681271, 1, 0.5058824, 0, 1,
-1.429401, -1.165884, -3.273663, 1, 0.509804, 0, 1,
-1.421855, 1.727427, -2.775203, 1, 0.5176471, 0, 1,
-1.420326, 0.6830589, -2.730021, 1, 0.5215687, 0, 1,
-1.414667, 0.2992857, -1.288525, 1, 0.5294118, 0, 1,
-1.407314, 0.07717679, -0.7989601, 1, 0.5333334, 0, 1,
-1.405142, 1.356934, -0.6936619, 1, 0.5411765, 0, 1,
-1.39662, -0.05153432, -3.017787, 1, 0.5450981, 0, 1,
-1.395985, 0.09416554, -0.1903489, 1, 0.5529412, 0, 1,
-1.392953, -0.03058717, -2.225294, 1, 0.5568628, 0, 1,
-1.386469, -1.685755, -2.094954, 1, 0.5647059, 0, 1,
-1.376303, 0.5989338, -1.753015, 1, 0.5686275, 0, 1,
-1.370892, 0.1105399, -0.8397052, 1, 0.5764706, 0, 1,
-1.355367, 1.322869, -1.166515, 1, 0.5803922, 0, 1,
-1.350649, 0.05946117, -1.55834, 1, 0.5882353, 0, 1,
-1.345581, -0.6938583, -2.777878, 1, 0.5921569, 0, 1,
-1.345449, -1.566406, -2.296821, 1, 0.6, 0, 1,
-1.330709, -0.6285672, -2.786936, 1, 0.6078432, 0, 1,
-1.330268, 0.4515695, -1.132448, 1, 0.6117647, 0, 1,
-1.320218, 0.678515, -1.589698, 1, 0.6196079, 0, 1,
-1.316605, 0.7790279, -0.7271857, 1, 0.6235294, 0, 1,
-1.313316, 0.3592587, -2.201313, 1, 0.6313726, 0, 1,
-1.309334, 2.517037, 0.4784351, 1, 0.6352941, 0, 1,
-1.308072, 1.086227, -1.179708, 1, 0.6431373, 0, 1,
-1.300031, -0.721912, -2.322589, 1, 0.6470588, 0, 1,
-1.291681, -1.27441, -1.625783, 1, 0.654902, 0, 1,
-1.290314, -0.5598571, -2.206421, 1, 0.6588235, 0, 1,
-1.285138, 0.4934541, -2.154336, 1, 0.6666667, 0, 1,
-1.284802, 1.018962, -0.4094766, 1, 0.6705883, 0, 1,
-1.265618, -0.3043728, -1.37339, 1, 0.6784314, 0, 1,
-1.263395, -2.338171, -2.784104, 1, 0.682353, 0, 1,
-1.258608, -0.02625009, -1.979515, 1, 0.6901961, 0, 1,
-1.256301, -0.6778873, -1.272114, 1, 0.6941177, 0, 1,
-1.24784, 1.10469, -2.056604, 1, 0.7019608, 0, 1,
-1.245423, -0.7768714, 0.002784913, 1, 0.7098039, 0, 1,
-1.242958, 0.5817474, -1.241594, 1, 0.7137255, 0, 1,
-1.233598, -0.9464939, -1.142751, 1, 0.7215686, 0, 1,
-1.22633, 1.38305, -0.01886174, 1, 0.7254902, 0, 1,
-1.224941, -0.3584381, -0.8930617, 1, 0.7333333, 0, 1,
-1.219722, -0.028339, -0.4714683, 1, 0.7372549, 0, 1,
-1.21519, -0.3770702, -0.8063368, 1, 0.7450981, 0, 1,
-1.199893, 0.3103952, -1.040223, 1, 0.7490196, 0, 1,
-1.198097, 0.002073436, -1.596856, 1, 0.7568628, 0, 1,
-1.195818, -0.5434048, -2.879341, 1, 0.7607843, 0, 1,
-1.187575, -0.3688737, -2.446795, 1, 0.7686275, 0, 1,
-1.182635, -0.5534781, -0.736074, 1, 0.772549, 0, 1,
-1.180385, 0.2823039, -1.639648, 1, 0.7803922, 0, 1,
-1.178854, 0.4282117, 0.1121312, 1, 0.7843137, 0, 1,
-1.16411, -0.4432912, -3.887194, 1, 0.7921569, 0, 1,
-1.163522, -2.316565, -0.95021, 1, 0.7960784, 0, 1,
-1.158033, 0.1766753, -2.051506, 1, 0.8039216, 0, 1,
-1.153355, 0.9348235, -1.15461, 1, 0.8117647, 0, 1,
-1.144516, 1.150087, -0.8202891, 1, 0.8156863, 0, 1,
-1.144464, -0.9841974, -2.109479, 1, 0.8235294, 0, 1,
-1.143676, 0.2468588, -2.13608, 1, 0.827451, 0, 1,
-1.128011, 0.4645103, -0.6571497, 1, 0.8352941, 0, 1,
-1.124508, -0.7760816, -0.8211712, 1, 0.8392157, 0, 1,
-1.115023, 0.2324406, -2.259075, 1, 0.8470588, 0, 1,
-1.114408, 0.532894, -2.759728, 1, 0.8509804, 0, 1,
-1.095128, 0.07022385, -0.3606051, 1, 0.8588235, 0, 1,
-1.089284, -3.202043, -3.003958, 1, 0.8627451, 0, 1,
-1.088846, -0.3387529, -1.074292, 1, 0.8705882, 0, 1,
-1.088296, 1.734555, -0.04134944, 1, 0.8745098, 0, 1,
-1.086703, 0.860154, -0.6754789, 1, 0.8823529, 0, 1,
-1.082932, -0.7070321, -2.595123, 1, 0.8862745, 0, 1,
-1.07848, 0.9150918, 0.2664372, 1, 0.8941177, 0, 1,
-1.078058, -0.9875293, -2.95885, 1, 0.8980392, 0, 1,
-1.076571, 0.01773179, -2.857812, 1, 0.9058824, 0, 1,
-1.074134, -0.4843331, -0.7774889, 1, 0.9137255, 0, 1,
-1.071981, 1.982387, 0.3372241, 1, 0.9176471, 0, 1,
-1.059806, 0.02757533, -0.9223157, 1, 0.9254902, 0, 1,
-1.057458, -1.37563, -1.924039, 1, 0.9294118, 0, 1,
-1.056232, -1.616591, -4.713734, 1, 0.9372549, 0, 1,
-1.053628, 0.9164392, -1.088045, 1, 0.9411765, 0, 1,
-1.050235, 0.07490774, -1.014662, 1, 0.9490196, 0, 1,
-1.048413, 0.05838041, -2.196118, 1, 0.9529412, 0, 1,
-1.039786, -1.002694, -1.968127, 1, 0.9607843, 0, 1,
-1.035423, 0.7207432, -2.270744, 1, 0.9647059, 0, 1,
-1.034069, 0.03977815, -2.004373, 1, 0.972549, 0, 1,
-1.023998, 0.03492915, -2.132051, 1, 0.9764706, 0, 1,
-1.018133, -0.02831053, -2.297144, 1, 0.9843137, 0, 1,
-1.012914, 0.2635914, -2.203359, 1, 0.9882353, 0, 1,
-1.009926, 0.3214244, -0.5821674, 1, 0.9960784, 0, 1,
-1.008651, 1.788201, -0.5344272, 0.9960784, 1, 0, 1,
-1.000026, -0.138676, -0.6974007, 0.9921569, 1, 0, 1,
-0.9976642, -0.291288, -1.840821, 0.9843137, 1, 0, 1,
-0.9966959, 0.1192605, -1.751531, 0.9803922, 1, 0, 1,
-0.9909481, 1.093658, -0.7827328, 0.972549, 1, 0, 1,
-0.9888782, 2.079483, 0.8689483, 0.9686275, 1, 0, 1,
-0.9717034, 1.562525, 0.2409774, 0.9607843, 1, 0, 1,
-0.9663602, -1.695498, -3.733429, 0.9568627, 1, 0, 1,
-0.9614264, 0.3495228, -0.7511584, 0.9490196, 1, 0, 1,
-0.9547936, 1.4506, -0.2397443, 0.945098, 1, 0, 1,
-0.9520161, 0.8666121, -1.109001, 0.9372549, 1, 0, 1,
-0.9494709, 0.2835069, 0.2319731, 0.9333333, 1, 0, 1,
-0.9454175, -0.01243672, -1.598262, 0.9254902, 1, 0, 1,
-0.9448506, 1.557655, -0.06161168, 0.9215686, 1, 0, 1,
-0.9440821, 1.605575, -0.584187, 0.9137255, 1, 0, 1,
-0.9420187, 1.363475, 0.6643243, 0.9098039, 1, 0, 1,
-0.9395506, -0.3202833, -2.064953, 0.9019608, 1, 0, 1,
-0.9347453, -1.917857, -1.685014, 0.8941177, 1, 0, 1,
-0.9334682, 0.7071805, -1.022391, 0.8901961, 1, 0, 1,
-0.9293185, 0.7506841, -1.091339, 0.8823529, 1, 0, 1,
-0.9230502, -0.2402459, -1.973561, 0.8784314, 1, 0, 1,
-0.9124046, -1.41041, -2.976889, 0.8705882, 1, 0, 1,
-0.9034992, 0.2636744, -0.9683836, 0.8666667, 1, 0, 1,
-0.8861311, -1.453078, -1.90644, 0.8588235, 1, 0, 1,
-0.8788252, -0.4716031, -2.16768, 0.854902, 1, 0, 1,
-0.8767427, 0.07129149, -0.3854666, 0.8470588, 1, 0, 1,
-0.8742652, 0.04959211, -3.050449, 0.8431373, 1, 0, 1,
-0.8710886, -2.092683, -0.7435738, 0.8352941, 1, 0, 1,
-0.8673193, 0.181283, -3.342832, 0.8313726, 1, 0, 1,
-0.8638415, -0.1351441, -0.2296163, 0.8235294, 1, 0, 1,
-0.8528913, 0.8675422, -2.576494, 0.8196079, 1, 0, 1,
-0.8525258, -0.7156389, 0.8550434, 0.8117647, 1, 0, 1,
-0.8516681, 0.1354823, -0.8168784, 0.8078431, 1, 0, 1,
-0.8486797, -1.366598, -3.896136, 0.8, 1, 0, 1,
-0.8454955, 1.512631, -0.07621003, 0.7921569, 1, 0, 1,
-0.8435626, 0.372651, -1.594264, 0.7882353, 1, 0, 1,
-0.8409351, 1.283798, -0.2222251, 0.7803922, 1, 0, 1,
-0.8376395, 0.7477179, -0.5830226, 0.7764706, 1, 0, 1,
-0.8360764, -0.8352829, -2.377542, 0.7686275, 1, 0, 1,
-0.8245438, -1.181949, -3.328273, 0.7647059, 1, 0, 1,
-0.8238933, -0.2822722, -1.677113, 0.7568628, 1, 0, 1,
-0.818952, 0.8724047, 0.6221159, 0.7529412, 1, 0, 1,
-0.8105932, -0.05263552, -0.7701614, 0.7450981, 1, 0, 1,
-0.8079457, 1.143394, -0.2443717, 0.7411765, 1, 0, 1,
-0.8071343, 0.2658471, -1.112767, 0.7333333, 1, 0, 1,
-0.7902123, -0.9623156, -1.94665, 0.7294118, 1, 0, 1,
-0.7815974, 0.4948605, -1.317713, 0.7215686, 1, 0, 1,
-0.781509, -0.5007169, -3.929391, 0.7176471, 1, 0, 1,
-0.7773443, -0.4336531, -1.832611, 0.7098039, 1, 0, 1,
-0.7768531, 0.7999145, 0.5568165, 0.7058824, 1, 0, 1,
-0.7725646, 0.6087269, -1.476028, 0.6980392, 1, 0, 1,
-0.7699413, -0.3328431, -2.220834, 0.6901961, 1, 0, 1,
-0.7692829, -0.6285611, -3.12157, 0.6862745, 1, 0, 1,
-0.768726, -0.7892045, -2.869302, 0.6784314, 1, 0, 1,
-0.7674761, -1.175409, -3.85214, 0.6745098, 1, 0, 1,
-0.7661563, -0.2908361, -1.305003, 0.6666667, 1, 0, 1,
-0.7569273, 1.103584, 0.3883864, 0.6627451, 1, 0, 1,
-0.7565258, -1.734548, -1.56855, 0.654902, 1, 0, 1,
-0.7518202, -0.3293784, -1.699043, 0.6509804, 1, 0, 1,
-0.7481728, -0.5916201, -2.261704, 0.6431373, 1, 0, 1,
-0.7479802, -1.347806, -2.167222, 0.6392157, 1, 0, 1,
-0.7462129, -1.536107, -2.553645, 0.6313726, 1, 0, 1,
-0.7445147, -1.295746, -0.9196024, 0.627451, 1, 0, 1,
-0.7444202, -0.3334008, -2.309886, 0.6196079, 1, 0, 1,
-0.7371794, -0.4273725, -1.164465, 0.6156863, 1, 0, 1,
-0.731741, -1.475362, -3.319364, 0.6078432, 1, 0, 1,
-0.7298436, 0.6791535, 0.2942508, 0.6039216, 1, 0, 1,
-0.7227449, 0.8654438, -1.128958, 0.5960785, 1, 0, 1,
-0.7174435, -0.134739, -2.455971, 0.5882353, 1, 0, 1,
-0.7166951, 1.174517, 0.8893185, 0.5843138, 1, 0, 1,
-0.7120035, 0.5187611, -1.170165, 0.5764706, 1, 0, 1,
-0.7113309, -0.5585797, -2.05075, 0.572549, 1, 0, 1,
-0.71128, 0.4591348, -2.62401, 0.5647059, 1, 0, 1,
-0.7110536, 2.728557, -0.3512518, 0.5607843, 1, 0, 1,
-0.7041503, 0.01336979, -2.210278, 0.5529412, 1, 0, 1,
-0.7014564, -0.6085901, -3.018691, 0.5490196, 1, 0, 1,
-0.7011501, -0.9118547, -2.04603, 0.5411765, 1, 0, 1,
-0.7004205, -0.2675031, -2.346096, 0.5372549, 1, 0, 1,
-0.6955887, 0.8416542, -0.5249872, 0.5294118, 1, 0, 1,
-0.693561, -0.5585106, -2.287345, 0.5254902, 1, 0, 1,
-0.6934392, -0.5723466, -2.135805, 0.5176471, 1, 0, 1,
-0.6732533, 1.025313, -0.2601033, 0.5137255, 1, 0, 1,
-0.6722827, -0.2000024, -1.19929, 0.5058824, 1, 0, 1,
-0.6691644, -0.09285957, -0.7953862, 0.5019608, 1, 0, 1,
-0.6599943, 0.650817, -2.13805, 0.4941176, 1, 0, 1,
-0.6572013, -1.211986, -2.189803, 0.4862745, 1, 0, 1,
-0.6505828, 0.9657494, -1.967268, 0.4823529, 1, 0, 1,
-0.6475569, -0.6822708, -1.972561, 0.4745098, 1, 0, 1,
-0.6465487, 0.7316231, -0.2742187, 0.4705882, 1, 0, 1,
-0.6447501, 0.1394917, -0.5376633, 0.4627451, 1, 0, 1,
-0.6423045, 0.1399989, -1.609823, 0.4588235, 1, 0, 1,
-0.6419739, -0.64675, -3.278238, 0.4509804, 1, 0, 1,
-0.6419445, 1.424909, -0.7202201, 0.4470588, 1, 0, 1,
-0.6415296, -0.2805643, -3.410633, 0.4392157, 1, 0, 1,
-0.6396563, -0.1083018, -1.75087, 0.4352941, 1, 0, 1,
-0.6377677, 1.038126, 0.2269127, 0.427451, 1, 0, 1,
-0.6280078, 0.4379165, -0.8684446, 0.4235294, 1, 0, 1,
-0.627678, 0.2395663, -1.296803, 0.4156863, 1, 0, 1,
-0.6212507, -0.967081, -3.799172, 0.4117647, 1, 0, 1,
-0.6202968, 0.2061925, -1.22282, 0.4039216, 1, 0, 1,
-0.6191292, 0.71806, -0.1634872, 0.3960784, 1, 0, 1,
-0.6155465, 1.251696, -0.4507304, 0.3921569, 1, 0, 1,
-0.6111782, 1.297361, 0.6452227, 0.3843137, 1, 0, 1,
-0.6049541, -0.7175494, -3.235412, 0.3803922, 1, 0, 1,
-0.601705, 0.5085094, -0.09901419, 0.372549, 1, 0, 1,
-0.5952461, 1.313373, 2.095101, 0.3686275, 1, 0, 1,
-0.5886229, 0.5891146, -1.025196, 0.3607843, 1, 0, 1,
-0.5874972, 1.017112, -0.1303507, 0.3568628, 1, 0, 1,
-0.586101, 0.1425359, 0.1047567, 0.3490196, 1, 0, 1,
-0.5831484, 0.1617393, -1.536186, 0.345098, 1, 0, 1,
-0.5810168, -1.032821, -1.912198, 0.3372549, 1, 0, 1,
-0.578365, 0.9599547, -0.9141154, 0.3333333, 1, 0, 1,
-0.5775688, -0.4294741, -2.400674, 0.3254902, 1, 0, 1,
-0.5704212, -1.488645, -2.600275, 0.3215686, 1, 0, 1,
-0.5698839, -1.875795, -2.634915, 0.3137255, 1, 0, 1,
-0.5693848, 0.6685792, -1.169705, 0.3098039, 1, 0, 1,
-0.5679671, 0.7859451, -0.5656297, 0.3019608, 1, 0, 1,
-0.5669552, -0.8309808, -3.573893, 0.2941177, 1, 0, 1,
-0.5575887, 0.476042, 0.735827, 0.2901961, 1, 0, 1,
-0.5498156, 0.3067973, -0.4215603, 0.282353, 1, 0, 1,
-0.5444509, -0.2066983, -1.657377, 0.2784314, 1, 0, 1,
-0.5422035, 1.553574, -0.1553705, 0.2705882, 1, 0, 1,
-0.5393304, 0.05673504, -1.893822, 0.2666667, 1, 0, 1,
-0.5388154, 0.4347289, -1.707252, 0.2588235, 1, 0, 1,
-0.5377605, -1.276309, -1.849988, 0.254902, 1, 0, 1,
-0.5372236, -0.006746338, -2.007785, 0.2470588, 1, 0, 1,
-0.5329363, 0.5184894, -0.8905657, 0.2431373, 1, 0, 1,
-0.526581, -0.9968282, -2.328487, 0.2352941, 1, 0, 1,
-0.5248437, 1.82527, -0.1788936, 0.2313726, 1, 0, 1,
-0.5244703, -2.099521, -3.073096, 0.2235294, 1, 0, 1,
-0.5220156, 1.133608, 0.4861586, 0.2196078, 1, 0, 1,
-0.5210202, 0.3828249, 0.1420365, 0.2117647, 1, 0, 1,
-0.5208508, 0.9935824, -1.403371, 0.2078431, 1, 0, 1,
-0.5200395, -2.157236, -5.075425, 0.2, 1, 0, 1,
-0.5193572, -1.30276, -2.302169, 0.1921569, 1, 0, 1,
-0.51717, -0.4186731, -1.581554, 0.1882353, 1, 0, 1,
-0.5169658, -0.2776845, -1.572879, 0.1803922, 1, 0, 1,
-0.5161016, -0.8654413, -1.154715, 0.1764706, 1, 0, 1,
-0.5132548, -0.5932694, -1.115167, 0.1686275, 1, 0, 1,
-0.5068731, 0.5859556, 0.6127025, 0.1647059, 1, 0, 1,
-0.505107, 0.4470613, -0.3096991, 0.1568628, 1, 0, 1,
-0.5022837, -2.172194, -3.79042, 0.1529412, 1, 0, 1,
-0.5010629, 1.806293, -0.5674188, 0.145098, 1, 0, 1,
-0.5010056, -2.088973, -4.867281, 0.1411765, 1, 0, 1,
-0.4918724, -1.524129, -2.480499, 0.1333333, 1, 0, 1,
-0.4892102, 0.5675046, -1.063101, 0.1294118, 1, 0, 1,
-0.4885226, -0.5077469, -3.219929, 0.1215686, 1, 0, 1,
-0.4860362, 1.617804, -0.2755385, 0.1176471, 1, 0, 1,
-0.477608, -0.08585066, -4.171471, 0.1098039, 1, 0, 1,
-0.4774178, -1.354013, -1.257221, 0.1058824, 1, 0, 1,
-0.475568, 0.9877096, 0.1016349, 0.09803922, 1, 0, 1,
-0.4752748, -1.864372, -1.828141, 0.09019608, 1, 0, 1,
-0.4749463, -0.4484643, -2.16619, 0.08627451, 1, 0, 1,
-0.4744775, 0.9485431, -1.138404, 0.07843138, 1, 0, 1,
-0.4736784, -1.069401, -3.405725, 0.07450981, 1, 0, 1,
-0.4725833, 1.210349, -0.68401, 0.06666667, 1, 0, 1,
-0.471438, -1.763138, -4.426272, 0.0627451, 1, 0, 1,
-0.4636263, 0.7070876, -1.87277, 0.05490196, 1, 0, 1,
-0.4623049, 0.8572589, -0.01304446, 0.05098039, 1, 0, 1,
-0.462281, -1.346025, -3.735313, 0.04313726, 1, 0, 1,
-0.4614846, -1.21261, -2.499477, 0.03921569, 1, 0, 1,
-0.4611152, 0.02000358, -1.311707, 0.03137255, 1, 0, 1,
-0.4604707, 0.05686543, -0.4856845, 0.02745098, 1, 0, 1,
-0.4592046, 1.861992, -1.180961, 0.01960784, 1, 0, 1,
-0.4542079, -0.3839942, -0.5643356, 0.01568628, 1, 0, 1,
-0.4536299, -0.6585841, -3.352587, 0.007843138, 1, 0, 1,
-0.4511333, 0.5171313, -0.1979879, 0.003921569, 1, 0, 1,
-0.4497399, -0.7972739, -2.747084, 0, 1, 0.003921569, 1,
-0.4482971, 0.4013899, -1.601161, 0, 1, 0.01176471, 1,
-0.4449444, 0.9580057, 0.9661822, 0, 1, 0.01568628, 1,
-0.4421913, -1.55092, -2.651094, 0, 1, 0.02352941, 1,
-0.4328522, -0.8186845, -1.48435, 0, 1, 0.02745098, 1,
-0.431447, -0.02296067, -0.4411327, 0, 1, 0.03529412, 1,
-0.4275794, -0.817395, -3.637888, 0, 1, 0.03921569, 1,
-0.4259146, 0.3782089, -0.1753028, 0, 1, 0.04705882, 1,
-0.4256407, 2.053505, 1.108385, 0, 1, 0.05098039, 1,
-0.4251087, 1.697642, 0.7463567, 0, 1, 0.05882353, 1,
-0.4229801, 0.2823332, -1.44457, 0, 1, 0.0627451, 1,
-0.4226951, -1.513953, -3.448873, 0, 1, 0.07058824, 1,
-0.4222993, 0.1660817, -1.314695, 0, 1, 0.07450981, 1,
-0.4198492, 0.8879371, -1.224598, 0, 1, 0.08235294, 1,
-0.4130811, -0.2785356, -3.297336, 0, 1, 0.08627451, 1,
-0.4127435, -0.699698, -2.770075, 0, 1, 0.09411765, 1,
-0.4078233, 1.719577, 0.5487855, 0, 1, 0.1019608, 1,
-0.4043041, 0.2457357, -1.555933, 0, 1, 0.1058824, 1,
-0.4030418, -0.5057685, -2.748956, 0, 1, 0.1137255, 1,
-0.4006751, 0.3454273, 0.07905965, 0, 1, 0.1176471, 1,
-0.3999796, -2.380015, -3.024796, 0, 1, 0.1254902, 1,
-0.3952757, -0.239315, -2.349336, 0, 1, 0.1294118, 1,
-0.39017, -0.2985678, -2.711958, 0, 1, 0.1372549, 1,
-0.3899862, -0.2309602, -2.889895, 0, 1, 0.1411765, 1,
-0.389952, 0.4380901, 0.4375454, 0, 1, 0.1490196, 1,
-0.3893623, -1.263, -3.415338, 0, 1, 0.1529412, 1,
-0.388053, -0.1520408, -4.183825, 0, 1, 0.1607843, 1,
-0.3873097, -1.703585, -4.58033, 0, 1, 0.1647059, 1,
-0.3864153, -0.6915135, -2.736723, 0, 1, 0.172549, 1,
-0.3859638, -0.3834643, -1.904062, 0, 1, 0.1764706, 1,
-0.3857779, -1.982378, -2.021245, 0, 1, 0.1843137, 1,
-0.3799024, -1.004053, -1.042512, 0, 1, 0.1882353, 1,
-0.3797569, -1.739345, -3.194644, 0, 1, 0.1960784, 1,
-0.373826, 0.563023, 1.836241, 0, 1, 0.2039216, 1,
-0.3715599, -1.260874, -3.798012, 0, 1, 0.2078431, 1,
-0.3703775, 0.3859687, -2.802678, 0, 1, 0.2156863, 1,
-0.3698796, 1.241439, 0.3442273, 0, 1, 0.2196078, 1,
-0.36577, 0.2719845, 1.697703, 0, 1, 0.227451, 1,
-0.3634482, 0.05815579, -2.095473, 0, 1, 0.2313726, 1,
-0.3580086, -1.74824, -2.950898, 0, 1, 0.2392157, 1,
-0.3578191, -1.310427, -1.803429, 0, 1, 0.2431373, 1,
-0.3533285, 0.4516035, -1.502278, 0, 1, 0.2509804, 1,
-0.3502927, -0.7369066, -2.053593, 0, 1, 0.254902, 1,
-0.3477838, 0.3750905, -0.2878504, 0, 1, 0.2627451, 1,
-0.3398628, 0.06038105, -1.843371, 0, 1, 0.2666667, 1,
-0.338158, 0.6935655, -1.226374, 0, 1, 0.2745098, 1,
-0.3360265, -0.1598814, -0.2905595, 0, 1, 0.2784314, 1,
-0.3329101, -0.8790905, -3.068929, 0, 1, 0.2862745, 1,
-0.3266023, -0.3712226, -1.962831, 0, 1, 0.2901961, 1,
-0.3256578, -0.7290581, -2.306204, 0, 1, 0.2980392, 1,
-0.3215063, -0.8475821, -1.152547, 0, 1, 0.3058824, 1,
-0.3174899, -1.472303, -2.195001, 0, 1, 0.3098039, 1,
-0.3174625, -0.4410329, -2.730873, 0, 1, 0.3176471, 1,
-0.3154074, -1.544981, -2.783986, 0, 1, 0.3215686, 1,
-0.3153951, -0.9839429, -4.633377, 0, 1, 0.3294118, 1,
-0.3135991, 0.2369801, -1.401987, 0, 1, 0.3333333, 1,
-0.3072668, 0.09282355, -1.558944, 0, 1, 0.3411765, 1,
-0.3070914, 0.06866645, -1.392747, 0, 1, 0.345098, 1,
-0.3037156, -1.939122, -3.747731, 0, 1, 0.3529412, 1,
-0.3012702, -0.9859069, -0.9782833, 0, 1, 0.3568628, 1,
-0.30044, 0.3704805, 0.1144829, 0, 1, 0.3647059, 1,
-0.2994377, 0.1788273, -2.075703, 0, 1, 0.3686275, 1,
-0.2966168, -0.131052, -1.97824, 0, 1, 0.3764706, 1,
-0.2907729, -1.91126, -1.373799, 0, 1, 0.3803922, 1,
-0.2894653, -1.949562, -3.397516, 0, 1, 0.3882353, 1,
-0.2890083, -0.4540279, -2.617692, 0, 1, 0.3921569, 1,
-0.2889485, -1.495474, -2.704752, 0, 1, 0.4, 1,
-0.2881655, 0.26874, 0.4109319, 0, 1, 0.4078431, 1,
-0.2826323, 0.4235089, 0.285711, 0, 1, 0.4117647, 1,
-0.2824471, -0.2429854, -4.103308, 0, 1, 0.4196078, 1,
-0.2769926, 0.350682, 0.0421135, 0, 1, 0.4235294, 1,
-0.2722033, 1.311253, -0.4744281, 0, 1, 0.4313726, 1,
-0.2693329, -0.5425873, -2.101476, 0, 1, 0.4352941, 1,
-0.2647198, 2.009951, -0.01102087, 0, 1, 0.4431373, 1,
-0.2621509, 0.9400696, -0.9119864, 0, 1, 0.4470588, 1,
-0.2611882, 1.058944, -0.0359006, 0, 1, 0.454902, 1,
-0.2574535, 1.00068, -0.4512109, 0, 1, 0.4588235, 1,
-0.2550566, 0.201727, 0.286554, 0, 1, 0.4666667, 1,
-0.2533875, -0.02295017, -0.5152936, 0, 1, 0.4705882, 1,
-0.2520084, -0.3230464, -2.236923, 0, 1, 0.4784314, 1,
-0.2498119, 1.133004, 0.1468375, 0, 1, 0.4823529, 1,
-0.2462427, -1.479029, -2.72018, 0, 1, 0.4901961, 1,
-0.2419092, 0.4955686, -0.4127816, 0, 1, 0.4941176, 1,
-0.2417934, -1.14378, -3.83921, 0, 1, 0.5019608, 1,
-0.2409303, -1.217428, -1.516844, 0, 1, 0.509804, 1,
-0.2402057, 0.1028042, 0.777478, 0, 1, 0.5137255, 1,
-0.234516, -1.618249, -4.434938, 0, 1, 0.5215687, 1,
-0.2318209, -0.4419753, -3.546934, 0, 1, 0.5254902, 1,
-0.2311956, 0.512351, -0.9841864, 0, 1, 0.5333334, 1,
-0.2292482, 0.008880676, -1.963886, 0, 1, 0.5372549, 1,
-0.227245, -0.1276378, -1.957009, 0, 1, 0.5450981, 1,
-0.2228603, -0.1428432, 0.2157588, 0, 1, 0.5490196, 1,
-0.2201551, 0.08715387, -0.7600092, 0, 1, 0.5568628, 1,
-0.219586, -2.87173, -3.692777, 0, 1, 0.5607843, 1,
-0.2150611, -0.7049736, -3.87295, 0, 1, 0.5686275, 1,
-0.2113072, -1.180128, -2.574317, 0, 1, 0.572549, 1,
-0.2109642, -0.4878962, -2.45718, 0, 1, 0.5803922, 1,
-0.2080858, -1.427764, -2.591865, 0, 1, 0.5843138, 1,
-0.2079065, -1.224848, -2.904817, 0, 1, 0.5921569, 1,
-0.2059543, -0.7519547, -4.057207, 0, 1, 0.5960785, 1,
-0.2058166, 0.3092481, -0.7014283, 0, 1, 0.6039216, 1,
-0.1996059, -0.3754077, -0.614935, 0, 1, 0.6117647, 1,
-0.1994405, 1.140392, -0.3045686, 0, 1, 0.6156863, 1,
-0.1964016, -0.3923399, -2.877305, 0, 1, 0.6235294, 1,
-0.1932906, -0.8074628, -2.604919, 0, 1, 0.627451, 1,
-0.1916866, -1.152079, -2.527496, 0, 1, 0.6352941, 1,
-0.1913057, -0.4306698, -2.391087, 0, 1, 0.6392157, 1,
-0.1904961, 0.5572233, -0.05069695, 0, 1, 0.6470588, 1,
-0.1867664, -1.708492, -2.907515, 0, 1, 0.6509804, 1,
-0.1839005, -0.3229051, -2.629106, 0, 1, 0.6588235, 1,
-0.1785522, 0.04347694, -2.414966, 0, 1, 0.6627451, 1,
-0.174137, -1.037855, -1.43585, 0, 1, 0.6705883, 1,
-0.1715014, -0.3734658, -2.918329, 0, 1, 0.6745098, 1,
-0.170332, 0.5013514, -0.09130467, 0, 1, 0.682353, 1,
-0.1654619, 0.7109274, 0.9079046, 0, 1, 0.6862745, 1,
-0.1647441, -0.3228036, -1.901956, 0, 1, 0.6941177, 1,
-0.1637835, -1.792292, -2.367876, 0, 1, 0.7019608, 1,
-0.1635564, -0.01837957, 0.5848826, 0, 1, 0.7058824, 1,
-0.1631654, -1.096479, -3.296875, 0, 1, 0.7137255, 1,
-0.1611184, 0.8507559, 1.014791, 0, 1, 0.7176471, 1,
-0.1605564, 0.5032747, 0.9726919, 0, 1, 0.7254902, 1,
-0.1488818, -0.2604246, -2.083448, 0, 1, 0.7294118, 1,
-0.1478155, -2.183091, -3.872263, 0, 1, 0.7372549, 1,
-0.1468889, 1.363072, 0.9583377, 0, 1, 0.7411765, 1,
-0.1454863, 2.013163, -0.9561662, 0, 1, 0.7490196, 1,
-0.1443898, -0.8491433, -3.11656, 0, 1, 0.7529412, 1,
-0.1432756, -1.088128, -1.676245, 0, 1, 0.7607843, 1,
-0.1368957, -1.216667, -2.194688, 0, 1, 0.7647059, 1,
-0.1361392, -1.361376, -0.6075549, 0, 1, 0.772549, 1,
-0.135239, -0.5868911, -2.451608, 0, 1, 0.7764706, 1,
-0.1321598, 0.6300641, -0.939827, 0, 1, 0.7843137, 1,
-0.1292911, -1.111934, -3.693971, 0, 1, 0.7882353, 1,
-0.1273201, 0.2202819, -0.7046071, 0, 1, 0.7960784, 1,
-0.1213636, -0.6872615, -3.046046, 0, 1, 0.8039216, 1,
-0.1121566, -0.399542, -3.413122, 0, 1, 0.8078431, 1,
-0.1105801, -1.54626, -2.717942, 0, 1, 0.8156863, 1,
-0.1088744, 0.2051175, -0.6409118, 0, 1, 0.8196079, 1,
-0.1029046, -1.666744, -3.454549, 0, 1, 0.827451, 1,
-0.1026644, 1.746085, 0.2999851, 0, 1, 0.8313726, 1,
-0.1016319, -1.751819, -1.986593, 0, 1, 0.8392157, 1,
-0.1008885, 1.212026, 0.5873249, 0, 1, 0.8431373, 1,
-0.1006016, -0.3250587, -4.51688, 0, 1, 0.8509804, 1,
-0.09557749, -0.7201015, -2.524712, 0, 1, 0.854902, 1,
-0.09402354, 0.3505313, -0.6109064, 0, 1, 0.8627451, 1,
-0.09272942, 0.2393938, -0.8215813, 0, 1, 0.8666667, 1,
-0.08821665, 1.241381, -1.604095, 0, 1, 0.8745098, 1,
-0.08366743, -0.01042077, -0.9215575, 0, 1, 0.8784314, 1,
-0.08338905, -0.3869308, -2.675452, 0, 1, 0.8862745, 1,
-0.08041079, 0.1774811, 2.297662, 0, 1, 0.8901961, 1,
-0.07764593, -1.253419, -1.638953, 0, 1, 0.8980392, 1,
-0.07695731, 0.9381995, -0.1473612, 0, 1, 0.9058824, 1,
-0.07359495, 0.005694658, -0.9753504, 0, 1, 0.9098039, 1,
-0.07056852, 0.9637812, -0.4887125, 0, 1, 0.9176471, 1,
-0.07011257, -1.342978, -3.201572, 0, 1, 0.9215686, 1,
-0.06667703, 0.0384666, -0.9016916, 0, 1, 0.9294118, 1,
-0.05789242, -1.613418, -3.49246, 0, 1, 0.9333333, 1,
-0.05702481, -2.660531, -3.661973, 0, 1, 0.9411765, 1,
-0.0503194, -2.0976, -2.271033, 0, 1, 0.945098, 1,
-0.04703892, 1.217159, -0.1654903, 0, 1, 0.9529412, 1,
-0.0439316, -0.2583402, -2.672504, 0, 1, 0.9568627, 1,
-0.04151244, 1.868656, 0.8932324, 0, 1, 0.9647059, 1,
-0.04105385, -0.4092704, -1.839509, 0, 1, 0.9686275, 1,
-0.03911024, 0.8870965, -0.5488321, 0, 1, 0.9764706, 1,
-0.03734284, 1.230001, 0.8896993, 0, 1, 0.9803922, 1,
-0.03289305, -0.02849384, -1.495018, 0, 1, 0.9882353, 1,
-0.03253551, 0.9982421, -0.254002, 0, 1, 0.9921569, 1,
-0.0290851, -2.198523, -1.744028, 0, 1, 1, 1,
-0.02756119, 0.01611204, -2.507582, 0, 0.9921569, 1, 1,
-0.02716983, 0.8502533, -0.02931826, 0, 0.9882353, 1, 1,
-0.02694957, 1.040663, -0.07819457, 0, 0.9803922, 1, 1,
-0.01523693, -0.8116785, -3.311586, 0, 0.9764706, 1, 1,
-0.008368548, 0.9678124, 1.806729, 0, 0.9686275, 1, 1,
-0.006127326, -1.211728, -2.654951, 0, 0.9647059, 1, 1,
-0.003832953, -1.170389, -3.062276, 0, 0.9568627, 1, 1,
-0.0002974648, -1.139332, -3.24351, 0, 0.9529412, 1, 1,
0.0005259075, 0.7538236, -0.5735236, 0, 0.945098, 1, 1,
0.001632217, 0.2151012, 0.6361951, 0, 0.9411765, 1, 1,
0.005723991, -0.01609299, 4.662663, 0, 0.9333333, 1, 1,
0.009754785, -0.5868831, 3.501804, 0, 0.9294118, 1, 1,
0.01105158, 0.6449025, 0.6148491, 0, 0.9215686, 1, 1,
0.01106041, 0.4653806, -1.057575, 0, 0.9176471, 1, 1,
0.01157611, -1.533163, 3.268365, 0, 0.9098039, 1, 1,
0.01227413, -0.9337108, 2.59868, 0, 0.9058824, 1, 1,
0.01323962, 1.422311, 1.684945, 0, 0.8980392, 1, 1,
0.01408254, 0.7016577, -1.413486, 0, 0.8901961, 1, 1,
0.01506202, -0.6088242, 3.17274, 0, 0.8862745, 1, 1,
0.0152323, 2.23137, -0.6816058, 0, 0.8784314, 1, 1,
0.01674264, 2.681418, -0.07257991, 0, 0.8745098, 1, 1,
0.01936555, 1.78905, 0.2376502, 0, 0.8666667, 1, 1,
0.02056926, 0.4402656, 0.9950299, 0, 0.8627451, 1, 1,
0.02172595, -0.9472588, 4.40783, 0, 0.854902, 1, 1,
0.0220279, -1.520393, 4.479574, 0, 0.8509804, 1, 1,
0.02204151, 0.04030864, 0.7942583, 0, 0.8431373, 1, 1,
0.02275367, -0.6233348, 2.660543, 0, 0.8392157, 1, 1,
0.02313863, -1.131091, 1.789493, 0, 0.8313726, 1, 1,
0.02913925, -0.8625309, 3.125267, 0, 0.827451, 1, 1,
0.02978486, -0.5231016, 4.115625, 0, 0.8196079, 1, 1,
0.03325837, -1.083303, 2.810589, 0, 0.8156863, 1, 1,
0.03489937, 0.1565223, 1.928098, 0, 0.8078431, 1, 1,
0.03586366, -0.6018422, 2.815947, 0, 0.8039216, 1, 1,
0.0443145, -0.4540161, 2.151016, 0, 0.7960784, 1, 1,
0.04802143, 0.1928009, -0.348031, 0, 0.7882353, 1, 1,
0.05499543, -0.4031061, 3.858229, 0, 0.7843137, 1, 1,
0.05892767, -0.7397724, 2.037119, 0, 0.7764706, 1, 1,
0.05933502, 0.2288043, 1.556418, 0, 0.772549, 1, 1,
0.06040015, 0.5272732, 1.022268, 0, 0.7647059, 1, 1,
0.06586175, 0.7476231, -0.3075577, 0, 0.7607843, 1, 1,
0.06621144, 0.4524032, 2.095363, 0, 0.7529412, 1, 1,
0.06745822, -1.616564, 2.652019, 0, 0.7490196, 1, 1,
0.06819116, 0.2169099, 2.06684, 0, 0.7411765, 1, 1,
0.06827899, 0.991931, -0.9671689, 0, 0.7372549, 1, 1,
0.06912082, -0.3295318, 2.906984, 0, 0.7294118, 1, 1,
0.06972633, -0.4478602, 2.077152, 0, 0.7254902, 1, 1,
0.07141436, 0.5659682, 0.7020398, 0, 0.7176471, 1, 1,
0.07198454, -0.4877143, 2.538807, 0, 0.7137255, 1, 1,
0.07283601, -0.8967851, 2.864095, 0, 0.7058824, 1, 1,
0.07485455, -0.6681635, 3.605828, 0, 0.6980392, 1, 1,
0.07911319, -0.01231603, 3.597303, 0, 0.6941177, 1, 1,
0.07981726, -0.7885396, 4.528335, 0, 0.6862745, 1, 1,
0.08416922, 0.2144348, -0.05949299, 0, 0.682353, 1, 1,
0.08951672, 0.5445756, 0.5233712, 0, 0.6745098, 1, 1,
0.09269341, 1.193383, -1.304381, 0, 0.6705883, 1, 1,
0.09427742, 0.8916954, 0.7837355, 0, 0.6627451, 1, 1,
0.09483527, 0.7037277, 1.930298, 0, 0.6588235, 1, 1,
0.09664953, -0.567314, 3.718033, 0, 0.6509804, 1, 1,
0.09782878, 0.08295058, 0.9236548, 0, 0.6470588, 1, 1,
0.09941854, -1.614026, 2.882154, 0, 0.6392157, 1, 1,
0.1041133, 0.9913477, 0.7001952, 0, 0.6352941, 1, 1,
0.1062228, -0.2573668, 2.411773, 0, 0.627451, 1, 1,
0.1072991, 1.840388, -2.802913, 0, 0.6235294, 1, 1,
0.11088, -0.07102002, 0.475526, 0, 0.6156863, 1, 1,
0.1118933, 0.5796514, 0.8665267, 0, 0.6117647, 1, 1,
0.1131895, 0.02548143, 1.775933, 0, 0.6039216, 1, 1,
0.1133147, -0.4046408, 3.954591, 0, 0.5960785, 1, 1,
0.1161555, 1.079141, -0.1366283, 0, 0.5921569, 1, 1,
0.1172321, 1.771528, -0.2705364, 0, 0.5843138, 1, 1,
0.1179783, 0.1909236, -1.122508, 0, 0.5803922, 1, 1,
0.1223637, 0.02155325, 0.7938226, 0, 0.572549, 1, 1,
0.1231766, -0.03201223, 1.484612, 0, 0.5686275, 1, 1,
0.125943, -1.593897, 2.570005, 0, 0.5607843, 1, 1,
0.1298993, 0.3226402, -0.3810798, 0, 0.5568628, 1, 1,
0.1318496, 0.8073401, 0.4025741, 0, 0.5490196, 1, 1,
0.135795, -1.174808, 1.199297, 0, 0.5450981, 1, 1,
0.1378239, 0.5611013, -0.218974, 0, 0.5372549, 1, 1,
0.1400516, 0.3303223, 0.2015724, 0, 0.5333334, 1, 1,
0.1413974, 1.793724, -0.5507926, 0, 0.5254902, 1, 1,
0.1452018, -1.305745, 3.239473, 0, 0.5215687, 1, 1,
0.145964, -1.192558, 1.90877, 0, 0.5137255, 1, 1,
0.1497127, -0.3569077, 2.603977, 0, 0.509804, 1, 1,
0.1517888, -0.1190435, 3.834487, 0, 0.5019608, 1, 1,
0.1535298, 0.9334881, 0.5656167, 0, 0.4941176, 1, 1,
0.1542875, -1.627018, 3.038325, 0, 0.4901961, 1, 1,
0.156427, 0.7854152, -0.6121571, 0, 0.4823529, 1, 1,
0.1566319, -1.718801, 2.380415, 0, 0.4784314, 1, 1,
0.1594208, -0.1473274, 2.998417, 0, 0.4705882, 1, 1,
0.1607155, -0.7813061, 4.074545, 0, 0.4666667, 1, 1,
0.1684152, -1.757656, 2.582417, 0, 0.4588235, 1, 1,
0.1764279, -0.4727692, 3.567952, 0, 0.454902, 1, 1,
0.1780726, 1.983767, -1.56275, 0, 0.4470588, 1, 1,
0.1811909, -0.778927, 2.323494, 0, 0.4431373, 1, 1,
0.1814816, 0.1859785, 1.597865, 0, 0.4352941, 1, 1,
0.186335, -0.2055633, 1.354375, 0, 0.4313726, 1, 1,
0.1886182, -0.07871953, 4.208779, 0, 0.4235294, 1, 1,
0.1899705, 0.8671345, 0.9122097, 0, 0.4196078, 1, 1,
0.1948744, -0.04733768, -0.5288065, 0, 0.4117647, 1, 1,
0.1993032, -0.847266, 2.290697, 0, 0.4078431, 1, 1,
0.2009914, -1.303984, 3.29091, 0, 0.4, 1, 1,
0.2046672, -1.405683, 1.901685, 0, 0.3921569, 1, 1,
0.2074078, -0.9008301, 5.369172, 0, 0.3882353, 1, 1,
0.2106515, 0.7516069, 0.7377171, 0, 0.3803922, 1, 1,
0.2112366, 1.261381, -0.001428251, 0, 0.3764706, 1, 1,
0.2130899, -1.02388, 4.375256, 0, 0.3686275, 1, 1,
0.2132571, -0.3984597, 2.812811, 0, 0.3647059, 1, 1,
0.2165609, 0.1511101, 1.137432, 0, 0.3568628, 1, 1,
0.2207371, 1.556888, -1.354204, 0, 0.3529412, 1, 1,
0.2292294, 1.653773, -0.1190492, 0, 0.345098, 1, 1,
0.2298323, 1.361771, 1.85264, 0, 0.3411765, 1, 1,
0.230356, -1.039846, 2.665219, 0, 0.3333333, 1, 1,
0.2308732, -0.1840815, 1.485134, 0, 0.3294118, 1, 1,
0.2323713, -0.2894398, 3.587918, 0, 0.3215686, 1, 1,
0.2371143, -0.05610813, 2.805553, 0, 0.3176471, 1, 1,
0.2381452, 1.59956, -0.5045136, 0, 0.3098039, 1, 1,
0.2412578, 0.2438971, 0.4667391, 0, 0.3058824, 1, 1,
0.2416295, 1.099171, -0.2391177, 0, 0.2980392, 1, 1,
0.2428865, 0.2125024, 1.699515, 0, 0.2901961, 1, 1,
0.2435751, -0.05223253, 1.477312, 0, 0.2862745, 1, 1,
0.2454401, -0.278848, 1.011809, 0, 0.2784314, 1, 1,
0.2549089, 0.2272492, 1.840446, 0, 0.2745098, 1, 1,
0.2612425, 0.664561, -1.180252, 0, 0.2666667, 1, 1,
0.265325, 0.05381417, -0.0006265275, 0, 0.2627451, 1, 1,
0.2655143, 1.982193, -0.8016487, 0, 0.254902, 1, 1,
0.2656325, 1.577924, -0.2874504, 0, 0.2509804, 1, 1,
0.2659772, -0.8680829, 3.372316, 0, 0.2431373, 1, 1,
0.2671027, -1.441453, 3.137582, 0, 0.2392157, 1, 1,
0.2684986, -0.1749923, 2.131359, 0, 0.2313726, 1, 1,
0.2685311, -0.38936, 2.099558, 0, 0.227451, 1, 1,
0.2688908, -1.712846, 0.8617002, 0, 0.2196078, 1, 1,
0.273194, -0.8565629, 1.700303, 0, 0.2156863, 1, 1,
0.2739568, -0.5196252, 3.954099, 0, 0.2078431, 1, 1,
0.2765534, 0.6842538, 1.217297, 0, 0.2039216, 1, 1,
0.2767209, -0.6784004, 4.041357, 0, 0.1960784, 1, 1,
0.2828188, 0.2154939, 0.8800367, 0, 0.1882353, 1, 1,
0.2866208, -2.924416, 0.9961038, 0, 0.1843137, 1, 1,
0.2875224, -0.6047425, 2.380592, 0, 0.1764706, 1, 1,
0.2895659, 0.3601762, 0.6859019, 0, 0.172549, 1, 1,
0.293414, 0.3407751, 1.621909, 0, 0.1647059, 1, 1,
0.2957608, 0.1039929, -0.07390082, 0, 0.1607843, 1, 1,
0.297333, -0.5536522, 2.056218, 0, 0.1529412, 1, 1,
0.2976487, 2.268982, -0.6601129, 0, 0.1490196, 1, 1,
0.2984012, 0.8668008, 0.8505059, 0, 0.1411765, 1, 1,
0.2992781, 0.6955596, 0.5094944, 0, 0.1372549, 1, 1,
0.3012338, 1.0427, -1.138374, 0, 0.1294118, 1, 1,
0.3067099, -1.789833, 1.484952, 0, 0.1254902, 1, 1,
0.307002, 0.8781502, 0.1809312, 0, 0.1176471, 1, 1,
0.3153053, -1.693734, 3.085244, 0, 0.1137255, 1, 1,
0.3181867, -0.1734774, 1.923855, 0, 0.1058824, 1, 1,
0.3223655, 0.7399018, 3.05895, 0, 0.09803922, 1, 1,
0.3234815, 0.6010777, -0.7162129, 0, 0.09411765, 1, 1,
0.3237342, -1.255385, 2.573399, 0, 0.08627451, 1, 1,
0.3252995, 2.331116, 1.130459, 0, 0.08235294, 1, 1,
0.3306405, -0.1609346, 2.802806, 0, 0.07450981, 1, 1,
0.3366608, -0.815244, 2.600593, 0, 0.07058824, 1, 1,
0.3370918, -1.029091, 3.341238, 0, 0.0627451, 1, 1,
0.3375282, 0.6899407, -0.04914041, 0, 0.05882353, 1, 1,
0.3413614, 2.260881, -0.7511309, 0, 0.05098039, 1, 1,
0.3425691, -0.07124534, 2.727572, 0, 0.04705882, 1, 1,
0.3434929, 1.55386, -1.763852, 0, 0.03921569, 1, 1,
0.3469296, 0.4313736, 0.3330989, 0, 0.03529412, 1, 1,
0.3476821, -1.498613, 3.617059, 0, 0.02745098, 1, 1,
0.3513283, -0.3928454, 1.484025, 0, 0.02352941, 1, 1,
0.351938, -1.29352, 2.758013, 0, 0.01568628, 1, 1,
0.3565881, -2.404234, 1.806456, 0, 0.01176471, 1, 1,
0.3571957, -0.2006775, 1.229723, 0, 0.003921569, 1, 1,
0.3619852, -1.17812, 1.925686, 0.003921569, 0, 1, 1,
0.3621949, 1.183101, -0.09883971, 0.007843138, 0, 1, 1,
0.3637402, 0.3975346, 1.57861, 0.01568628, 0, 1, 1,
0.3651805, -0.06478609, 2.477188, 0.01960784, 0, 1, 1,
0.3662239, -0.03844555, 2.147685, 0.02745098, 0, 1, 1,
0.3669216, 0.4979415, 0.8889893, 0.03137255, 0, 1, 1,
0.3675303, -0.7446215, 4.716403, 0.03921569, 0, 1, 1,
0.376112, 0.2991683, 0.990824, 0.04313726, 0, 1, 1,
0.3767716, -0.3338526, 1.716312, 0.05098039, 0, 1, 1,
0.3769338, -0.7146022, 3.565018, 0.05490196, 0, 1, 1,
0.3828059, -0.4306083, 3.634726, 0.0627451, 0, 1, 1,
0.3941743, -0.4335439, 3.647212, 0.06666667, 0, 1, 1,
0.3947576, -1.052307, 1.72265, 0.07450981, 0, 1, 1,
0.3966415, 1.001204, 1.192363, 0.07843138, 0, 1, 1,
0.4018261, 0.3703241, 0.4257706, 0.08627451, 0, 1, 1,
0.4041825, -0.5770331, 2.487839, 0.09019608, 0, 1, 1,
0.4060334, -0.2172235, 3.136856, 0.09803922, 0, 1, 1,
0.415447, -0.4028322, 2.803957, 0.1058824, 0, 1, 1,
0.4188429, 2.328887, 0.9260877, 0.1098039, 0, 1, 1,
0.4314593, 0.08563079, -0.5800912, 0.1176471, 0, 1, 1,
0.4378268, 0.4007062, 1.527916, 0.1215686, 0, 1, 1,
0.4402279, 0.7599093, -1.123199, 0.1294118, 0, 1, 1,
0.4443733, 0.6831722, 1.4028, 0.1333333, 0, 1, 1,
0.4468001, 0.9535614, 0.01120751, 0.1411765, 0, 1, 1,
0.4489624, 0.7821679, 1.276183, 0.145098, 0, 1, 1,
0.4512247, 1.648195, 0.6491627, 0.1529412, 0, 1, 1,
0.4512543, 0.5580623, 0.6882924, 0.1568628, 0, 1, 1,
0.4519218, 0.2628344, 0.2259665, 0.1647059, 0, 1, 1,
0.4536267, 0.2289043, 2.322108, 0.1686275, 0, 1, 1,
0.4596313, 0.2939838, 1.154735, 0.1764706, 0, 1, 1,
0.4604639, -0.143381, 0.9177924, 0.1803922, 0, 1, 1,
0.4618223, 1.187767, 0.2444593, 0.1882353, 0, 1, 1,
0.4649496, -0.7358682, 2.061951, 0.1921569, 0, 1, 1,
0.4707371, -1.174408, 3.007299, 0.2, 0, 1, 1,
0.4717525, -0.2687583, 2.294928, 0.2078431, 0, 1, 1,
0.4769365, -0.09610759, 1.768649, 0.2117647, 0, 1, 1,
0.481917, -0.5623083, 0.650865, 0.2196078, 0, 1, 1,
0.48728, 1.699318, 1.33918, 0.2235294, 0, 1, 1,
0.4891053, -0.1831986, 2.448014, 0.2313726, 0, 1, 1,
0.492572, -1.345219, 2.471904, 0.2352941, 0, 1, 1,
0.4942317, 1.196009, 0.646028, 0.2431373, 0, 1, 1,
0.4949073, -2.114233, 1.981956, 0.2470588, 0, 1, 1,
0.4967577, 0.8501369, 1.128689, 0.254902, 0, 1, 1,
0.4978042, 2.376509, 1.529917, 0.2588235, 0, 1, 1,
0.5038575, -0.9258777, 2.797691, 0.2666667, 0, 1, 1,
0.5042344, 2.008499, 0.7347012, 0.2705882, 0, 1, 1,
0.5096156, -0.3328595, 1.60957, 0.2784314, 0, 1, 1,
0.5113906, -1.005935, 2.038455, 0.282353, 0, 1, 1,
0.5123164, 0.02343515, 0.1264334, 0.2901961, 0, 1, 1,
0.51673, -1.21546, 2.785353, 0.2941177, 0, 1, 1,
0.5319389, -0.1008373, 2.225905, 0.3019608, 0, 1, 1,
0.5328481, 0.3202899, -0.1489694, 0.3098039, 0, 1, 1,
0.5383267, -1.450788, 2.161919, 0.3137255, 0, 1, 1,
0.5414347, -2.238172, 2.498662, 0.3215686, 0, 1, 1,
0.5424904, 0.1164433, 0.738756, 0.3254902, 0, 1, 1,
0.5426679, -1.663498, 3.228738, 0.3333333, 0, 1, 1,
0.5434924, 0.1897848, 2.102781, 0.3372549, 0, 1, 1,
0.5446094, 2.166138, 0.5689692, 0.345098, 0, 1, 1,
0.5481122, 0.5641165, 0.7350804, 0.3490196, 0, 1, 1,
0.5487477, 0.8489069, -1.430918, 0.3568628, 0, 1, 1,
0.5520409, -1.970417, 4.615003, 0.3607843, 0, 1, 1,
0.5555842, -1.113663, 3.363477, 0.3686275, 0, 1, 1,
0.5575069, -2.328907, 1.910119, 0.372549, 0, 1, 1,
0.5600812, -0.595036, 5.342744, 0.3803922, 0, 1, 1,
0.5609357, -0.5524724, 3.263209, 0.3843137, 0, 1, 1,
0.5634855, 0.6384033, 0.4324371, 0.3921569, 0, 1, 1,
0.5640951, -2.889255, 3.140515, 0.3960784, 0, 1, 1,
0.5753556, -0.8607921, 1.17877, 0.4039216, 0, 1, 1,
0.5784487, -0.6353019, 2.185576, 0.4117647, 0, 1, 1,
0.5822768, 0.5856466, 0.9248818, 0.4156863, 0, 1, 1,
0.584132, 0.7277567, -0.6289555, 0.4235294, 0, 1, 1,
0.5867769, -0.2387879, 3.094506, 0.427451, 0, 1, 1,
0.5922268, 0.574895, 0.5982072, 0.4352941, 0, 1, 1,
0.5981963, 0.7380364, 1.270163, 0.4392157, 0, 1, 1,
0.6063698, 0.2539388, 4.193156, 0.4470588, 0, 1, 1,
0.6108037, 0.5187059, 1.178418, 0.4509804, 0, 1, 1,
0.6138992, -0.5149465, 1.786981, 0.4588235, 0, 1, 1,
0.6159729, -1.046762, 2.75367, 0.4627451, 0, 1, 1,
0.6170727, 1.864638, -0.3481898, 0.4705882, 0, 1, 1,
0.6215552, -0.1336112, 3.653463, 0.4745098, 0, 1, 1,
0.6241857, 0.9007421, -1.107741, 0.4823529, 0, 1, 1,
0.6250634, 0.8189662, 2.783601, 0.4862745, 0, 1, 1,
0.6302969, 1.003376, -0.6854835, 0.4941176, 0, 1, 1,
0.6331489, -0.2513126, 0.1908112, 0.5019608, 0, 1, 1,
0.6382514, 0.9241439, -0.5161139, 0.5058824, 0, 1, 1,
0.6441848, 0.1286178, -0.00909578, 0.5137255, 0, 1, 1,
0.6457946, -0.1978182, 2.709527, 0.5176471, 0, 1, 1,
0.6576218, -1.859102, 2.956767, 0.5254902, 0, 1, 1,
0.6641996, 0.149502, 0.5418321, 0.5294118, 0, 1, 1,
0.6660918, -0.4824176, 3.206631, 0.5372549, 0, 1, 1,
0.6670321, 0.5866912, 0.9103166, 0.5411765, 0, 1, 1,
0.6686664, -0.3090863, 1.311193, 0.5490196, 0, 1, 1,
0.6725637, 0.9633299, -0.6741838, 0.5529412, 0, 1, 1,
0.6744906, 1.07636, 1.684136, 0.5607843, 0, 1, 1,
0.6788451, -0.4459018, 2.276502, 0.5647059, 0, 1, 1,
0.6795154, 1.355427, -0.216869, 0.572549, 0, 1, 1,
0.6812074, 0.5189723, 0.6988291, 0.5764706, 0, 1, 1,
0.6827967, 1.343139, 0.3309246, 0.5843138, 0, 1, 1,
0.6917147, -0.4724423, 3.107027, 0.5882353, 0, 1, 1,
0.6981483, 0.6568726, 2.618253, 0.5960785, 0, 1, 1,
0.7007802, 0.07236118, 1.247908, 0.6039216, 0, 1, 1,
0.7013193, -0.748143, 2.867095, 0.6078432, 0, 1, 1,
0.7121128, -1.067381, 3.398889, 0.6156863, 0, 1, 1,
0.7174211, -0.2041197, 1.902258, 0.6196079, 0, 1, 1,
0.7247011, 0.8409415, 1.026775, 0.627451, 0, 1, 1,
0.7256782, 0.3695571, 0.8956091, 0.6313726, 0, 1, 1,
0.7272793, 0.8215966, 2.666675, 0.6392157, 0, 1, 1,
0.7296281, 0.9660889, 0.9788818, 0.6431373, 0, 1, 1,
0.7317697, -0.4967228, 0.9775526, 0.6509804, 0, 1, 1,
0.7353722, 0.8640082, -1.896784, 0.654902, 0, 1, 1,
0.7374978, -0.3922994, 1.208331, 0.6627451, 0, 1, 1,
0.7379591, 2.041299, 1.322948, 0.6666667, 0, 1, 1,
0.7381401, 0.3362956, 2.318008, 0.6745098, 0, 1, 1,
0.7403714, 0.6521899, -0.7110539, 0.6784314, 0, 1, 1,
0.7431284, -0.9563161, 3.198455, 0.6862745, 0, 1, 1,
0.7506282, 0.4655081, 2.005474, 0.6901961, 0, 1, 1,
0.7530356, 0.008850414, 0.4083191, 0.6980392, 0, 1, 1,
0.7534276, 1.311844, -0.05760547, 0.7058824, 0, 1, 1,
0.7557409, 0.7501118, 0.0793701, 0.7098039, 0, 1, 1,
0.7607924, -0.7897142, 3.827375, 0.7176471, 0, 1, 1,
0.7706738, -0.3931037, 0.8478745, 0.7215686, 0, 1, 1,
0.7720869, -1.955943, 2.792803, 0.7294118, 0, 1, 1,
0.7779783, -0.06956249, 2.064319, 0.7333333, 0, 1, 1,
0.7784266, 0.2544485, 1.111957, 0.7411765, 0, 1, 1,
0.7818638, 3.263657, 0.08146609, 0.7450981, 0, 1, 1,
0.7826988, 0.8830042, 2.918931, 0.7529412, 0, 1, 1,
0.7883566, 0.4307737, 1.29948, 0.7568628, 0, 1, 1,
0.7998295, -1.513516, 2.027162, 0.7647059, 0, 1, 1,
0.809599, 0.1437576, 0.5124045, 0.7686275, 0, 1, 1,
0.8143368, -0.1369828, 2.886051, 0.7764706, 0, 1, 1,
0.8195809, -0.2162402, 1.64064, 0.7803922, 0, 1, 1,
0.8265024, -0.7088797, 1.393291, 0.7882353, 0, 1, 1,
0.8271599, -0.09987598, 1.803271, 0.7921569, 0, 1, 1,
0.8343219, -0.522464, 2.09673, 0.8, 0, 1, 1,
0.8357456, 1.227298, 0.5896494, 0.8078431, 0, 1, 1,
0.8404307, 0.3041241, 0.1690475, 0.8117647, 0, 1, 1,
0.8420553, -1.522657, 1.565909, 0.8196079, 0, 1, 1,
0.8430007, -0.4688343, 2.439269, 0.8235294, 0, 1, 1,
0.8514711, 0.7982022, 1.306122, 0.8313726, 0, 1, 1,
0.8552756, 0.3933238, 2.446962, 0.8352941, 0, 1, 1,
0.8565192, 0.2005267, 1.148394, 0.8431373, 0, 1, 1,
0.8672065, 0.8527882, -0.8638161, 0.8470588, 0, 1, 1,
0.8692573, 0.3663666, -0.4754523, 0.854902, 0, 1, 1,
0.8715398, 0.9787241, 0.7430325, 0.8588235, 0, 1, 1,
0.8775413, 0.655421, -0.3876389, 0.8666667, 0, 1, 1,
0.8777169, -1.252513, 3.850068, 0.8705882, 0, 1, 1,
0.8803833, 0.5728554, -0.5101288, 0.8784314, 0, 1, 1,
0.8885502, 0.23253, 1.276878, 0.8823529, 0, 1, 1,
0.8984992, -2.061011, 3.288875, 0.8901961, 0, 1, 1,
0.8999537, -0.9204998, 4.303318, 0.8941177, 0, 1, 1,
0.9010472, -1.484215, 1.361599, 0.9019608, 0, 1, 1,
0.9024524, -0.8883868, 1.12429, 0.9098039, 0, 1, 1,
0.9027864, 1.456402, 2.116219, 0.9137255, 0, 1, 1,
0.9172349, -0.03353982, 2.318757, 0.9215686, 0, 1, 1,
0.919818, 0.3178679, 1.970549, 0.9254902, 0, 1, 1,
0.9226406, -0.5943902, 3.793315, 0.9333333, 0, 1, 1,
0.9236588, 2.556132, 0.1547937, 0.9372549, 0, 1, 1,
0.9267004, -0.458658, 1.157454, 0.945098, 0, 1, 1,
0.9314545, 0.8418879, 1.632581, 0.9490196, 0, 1, 1,
0.9333814, -0.8921754, 1.707335, 0.9568627, 0, 1, 1,
0.9334568, -0.7585451, 1.538677, 0.9607843, 0, 1, 1,
0.9487396, 0.1784305, 2.377187, 0.9686275, 0, 1, 1,
0.9491109, -0.9373135, 1.5018, 0.972549, 0, 1, 1,
0.9543883, -0.2249262, 0.9270487, 0.9803922, 0, 1, 1,
0.9585177, 1.030875, 0.508808, 0.9843137, 0, 1, 1,
0.9612194, -1.077978, 1.52495, 0.9921569, 0, 1, 1,
0.9633397, -0.3905879, 1.410312, 0.9960784, 0, 1, 1,
0.9763783, 0.2214123, 0.4553885, 1, 0, 0.9960784, 1,
0.9773439, 1.155687, 0.6756084, 1, 0, 0.9882353, 1,
0.9918065, -0.788288, 1.999663, 1, 0, 0.9843137, 1,
0.9932372, 1.615525, 0.265684, 1, 0, 0.9764706, 1,
0.9956273, 1.23446, 1.641111, 1, 0, 0.972549, 1,
0.9984698, -0.3585006, 3.089283, 1, 0, 0.9647059, 1,
1.000414, 0.9189863, -0.3562133, 1, 0, 0.9607843, 1,
1.007391, -0.965466, 4.200175, 1, 0, 0.9529412, 1,
1.01293, 0.4713277, 0.276919, 1, 0, 0.9490196, 1,
1.018912, 0.6994988, 0.2221524, 1, 0, 0.9411765, 1,
1.032774, -1.42363, 3.342069, 1, 0, 0.9372549, 1,
1.036942, -1.49961, 2.762351, 1, 0, 0.9294118, 1,
1.050412, -0.2133212, 1.228332, 1, 0, 0.9254902, 1,
1.06142, -0.4462474, 0.5871078, 1, 0, 0.9176471, 1,
1.064981, 1.434, -0.3842702, 1, 0, 0.9137255, 1,
1.065004, 0.1039436, 1.45566, 1, 0, 0.9058824, 1,
1.070698, -1.07388, 0.8038392, 1, 0, 0.9019608, 1,
1.07118, 0.6013253, 1.49925, 1, 0, 0.8941177, 1,
1.071194, -1.523495, 4.467561, 1, 0, 0.8862745, 1,
1.078075, 1.549331, 0.2857771, 1, 0, 0.8823529, 1,
1.08005, -0.4571588, 2.531207, 1, 0, 0.8745098, 1,
1.09006, -0.5961517, 2.997046, 1, 0, 0.8705882, 1,
1.091374, 1.256385, 0.7967308, 1, 0, 0.8627451, 1,
1.092671, 0.8669299, 0.4863794, 1, 0, 0.8588235, 1,
1.109965, -0.7384521, 1.93566, 1, 0, 0.8509804, 1,
1.132372, 0.7095522, 0.9839866, 1, 0, 0.8470588, 1,
1.148384, 1.016723, 1.307567, 1, 0, 0.8392157, 1,
1.148992, 1.168535, 0.9970834, 1, 0, 0.8352941, 1,
1.153618, 0.516749, 0.8478289, 1, 0, 0.827451, 1,
1.155466, 0.1212111, 2.007222, 1, 0, 0.8235294, 1,
1.155477, -0.8985779, 3.557574, 1, 0, 0.8156863, 1,
1.166342, 0.9622311, 0.1100989, 1, 0, 0.8117647, 1,
1.181283, 0.09093156, 0.706958, 1, 0, 0.8039216, 1,
1.185258, -1.832584, 1.385183, 1, 0, 0.7960784, 1,
1.191594, 1.856936, 2.657527, 1, 0, 0.7921569, 1,
1.198801, 0.9774959, 1.611629, 1, 0, 0.7843137, 1,
1.202365, 0.08414741, 1.390372, 1, 0, 0.7803922, 1,
1.206123, 0.6929367, 0.6151308, 1, 0, 0.772549, 1,
1.209415, 0.05480443, 0.9811499, 1, 0, 0.7686275, 1,
1.20984, 0.469119, 1.202225, 1, 0, 0.7607843, 1,
1.211974, -1.132847, 3.270938, 1, 0, 0.7568628, 1,
1.214555, -0.4537552, 1.306727, 1, 0, 0.7490196, 1,
1.218825, -0.2912449, 2.916035, 1, 0, 0.7450981, 1,
1.228062, 1.691883, 0.6603712, 1, 0, 0.7372549, 1,
1.23014, -0.5262854, 1.737413, 1, 0, 0.7333333, 1,
1.234114, 0.9671116, 0.9999292, 1, 0, 0.7254902, 1,
1.235293, 0.4314233, 0.7603405, 1, 0, 0.7215686, 1,
1.243622, -1.645195, 3.399665, 1, 0, 0.7137255, 1,
1.247608, -0.3958537, 1.657654, 1, 0, 0.7098039, 1,
1.251414, -0.09139911, 1.495831, 1, 0, 0.7019608, 1,
1.255889, 0.5122297, 0.8640397, 1, 0, 0.6941177, 1,
1.25992, 0.6751819, 0.9208639, 1, 0, 0.6901961, 1,
1.265548, 0.7532977, 0.4626404, 1, 0, 0.682353, 1,
1.267388, -1.195422, 2.713679, 1, 0, 0.6784314, 1,
1.282168, -1.364242, 4.384511, 1, 0, 0.6705883, 1,
1.285425, -1.83802, 2.509807, 1, 0, 0.6666667, 1,
1.285704, -0.0887148, 3.541282, 1, 0, 0.6588235, 1,
1.292338, -0.5913616, 3.356932, 1, 0, 0.654902, 1,
1.301335, -0.345992, 0.8344696, 1, 0, 0.6470588, 1,
1.303237, 1.603073, 0.280399, 1, 0, 0.6431373, 1,
1.316505, 1.096646, -0.6766686, 1, 0, 0.6352941, 1,
1.326121, -1.468437, 2.365614, 1, 0, 0.6313726, 1,
1.338147, -0.08360049, 1.675348, 1, 0, 0.6235294, 1,
1.340172, -0.3650371, 1.027368, 1, 0, 0.6196079, 1,
1.347473, 0.3108222, 0.4512279, 1, 0, 0.6117647, 1,
1.355749, -0.5603148, 1.952475, 1, 0, 0.6078432, 1,
1.370186, -0.1848877, -0.2398224, 1, 0, 0.6, 1,
1.370851, 0.7106404, -0.2242541, 1, 0, 0.5921569, 1,
1.374021, -1.205506, 3.34664, 1, 0, 0.5882353, 1,
1.375306, 0.3148387, 0.9043837, 1, 0, 0.5803922, 1,
1.381865, -0.2729245, 1.727453, 1, 0, 0.5764706, 1,
1.403012, 0.6604034, 0.7453941, 1, 0, 0.5686275, 1,
1.405988, -0.3743006, 2.65784, 1, 0, 0.5647059, 1,
1.416598, -0.1224402, 2.810005, 1, 0, 0.5568628, 1,
1.418648, 0.3683215, 0.9587111, 1, 0, 0.5529412, 1,
1.419793, 0.1513608, 0.8478656, 1, 0, 0.5450981, 1,
1.421922, -0.3402428, 2.848298, 1, 0, 0.5411765, 1,
1.424531, -0.4323162, 1.320771, 1, 0, 0.5333334, 1,
1.426513, 0.7347939, 1.31967, 1, 0, 0.5294118, 1,
1.431143, -0.402079, 1.594939, 1, 0, 0.5215687, 1,
1.445432, 1.232091, 1.218756, 1, 0, 0.5176471, 1,
1.47305, -0.05883631, 0.5508169, 1, 0, 0.509804, 1,
1.475314, 0.9097284, 0.8663782, 1, 0, 0.5058824, 1,
1.476287, 0.2608386, 0.6538602, 1, 0, 0.4980392, 1,
1.479432, 0.175237, 1.04984, 1, 0, 0.4901961, 1,
1.486074, -0.3203668, 1.569303, 1, 0, 0.4862745, 1,
1.489727, 1.202593, 3.113218, 1, 0, 0.4784314, 1,
1.502246, 0.5733846, 0.5279379, 1, 0, 0.4745098, 1,
1.502327, -1.10593, 4.023223, 1, 0, 0.4666667, 1,
1.503627, 0.889852, -0.2665963, 1, 0, 0.4627451, 1,
1.515355, 0.2011383, 2.572776, 1, 0, 0.454902, 1,
1.518091, 1.150941, 0.3666525, 1, 0, 0.4509804, 1,
1.52034, 0.8571022, 3.035595, 1, 0, 0.4431373, 1,
1.52099, -0.3412937, 2.456836, 1, 0, 0.4392157, 1,
1.5223, -0.03683903, 0.7271157, 1, 0, 0.4313726, 1,
1.540681, -2.080047, 3.167425, 1, 0, 0.427451, 1,
1.545168, -0.1794072, 4.06339, 1, 0, 0.4196078, 1,
1.552553, -0.5673479, 0.5422461, 1, 0, 0.4156863, 1,
1.557162, -0.1029131, 1.118301, 1, 0, 0.4078431, 1,
1.558268, 1.5524, 1.176861, 1, 0, 0.4039216, 1,
1.568092, 1.196428, 1.632836, 1, 0, 0.3960784, 1,
1.57982, 0.4144495, 0.1048851, 1, 0, 0.3882353, 1,
1.582343, -1.223941, 2.105331, 1, 0, 0.3843137, 1,
1.590459, 0.6254016, 1.935541, 1, 0, 0.3764706, 1,
1.60053, 1.083461, 1.583543, 1, 0, 0.372549, 1,
1.608733, -0.3980769, -1.020083, 1, 0, 0.3647059, 1,
1.632296, -1.17066, 3.503555, 1, 0, 0.3607843, 1,
1.633598, -0.4220565, 2.684626, 1, 0, 0.3529412, 1,
1.637909, -1.480154, 1.308518, 1, 0, 0.3490196, 1,
1.653496, 0.3192309, 1.140994, 1, 0, 0.3411765, 1,
1.656853, 0.7010639, 0.9050571, 1, 0, 0.3372549, 1,
1.677626, -0.06328399, 1.158482, 1, 0, 0.3294118, 1,
1.681226, 1.212753, 1.068573, 1, 0, 0.3254902, 1,
1.694938, -0.7516038, 2.232575, 1, 0, 0.3176471, 1,
1.710497, 0.3760779, 0.9664214, 1, 0, 0.3137255, 1,
1.738824, -0.4903414, 3.193046, 1, 0, 0.3058824, 1,
1.744143, -0.2979488, 1.294507, 1, 0, 0.2980392, 1,
1.74856, -0.6024128, 1.179333, 1, 0, 0.2941177, 1,
1.752262, 1.065083, -0.9099996, 1, 0, 0.2862745, 1,
1.771382, 0.5298921, 2.517145, 1, 0, 0.282353, 1,
1.774315, 0.468756, 1.029621, 1, 0, 0.2745098, 1,
1.799348, 1.683664, 1.588922, 1, 0, 0.2705882, 1,
1.806956, 1.291867, -0.1566664, 1, 0, 0.2627451, 1,
1.81093, -1.001257, 1.773365, 1, 0, 0.2588235, 1,
1.824479, 0.1790982, 2.63537, 1, 0, 0.2509804, 1,
1.828773, 0.2067991, 0.7095887, 1, 0, 0.2470588, 1,
1.871053, 1.226987, 1.141494, 1, 0, 0.2392157, 1,
1.878874, 1.197544, 1.114396, 1, 0, 0.2352941, 1,
1.891135, -0.6078633, 1.943857, 1, 0, 0.227451, 1,
1.897234, 1.124465, 0.5400912, 1, 0, 0.2235294, 1,
1.897481, -1.630397, 1.136097, 1, 0, 0.2156863, 1,
1.899596, -0.0892617, 0.3101309, 1, 0, 0.2117647, 1,
1.905707, -0.9089898, 0.492321, 1, 0, 0.2039216, 1,
1.911422, 1.000033, 1.683184, 1, 0, 0.1960784, 1,
1.914422, 0.6187894, 1.174817, 1, 0, 0.1921569, 1,
1.92247, -0.0398717, 3.267396, 1, 0, 0.1843137, 1,
1.932311, -0.6675104, 1.338957, 1, 0, 0.1803922, 1,
1.964355, 0.5864937, 1.378551, 1, 0, 0.172549, 1,
1.992562, -1.164942, 2.301328, 1, 0, 0.1686275, 1,
1.993086, -1.216377, 1.452932, 1, 0, 0.1607843, 1,
2.002797, -0.7389714, 2.343467, 1, 0, 0.1568628, 1,
2.042201, 0.2354576, 2.192102, 1, 0, 0.1490196, 1,
2.046138, -1.098705, 0.4391628, 1, 0, 0.145098, 1,
2.050283, -0.0243388, 1.409314, 1, 0, 0.1372549, 1,
2.166395, 1.003399, 0.546489, 1, 0, 0.1333333, 1,
2.183121, -1.223951, 2.999654, 1, 0, 0.1254902, 1,
2.195113, 0.6837516, 2.174903, 1, 0, 0.1215686, 1,
2.200175, 0.8322592, 1.962657, 1, 0, 0.1137255, 1,
2.217865, 0.9212124, -0.1296207, 1, 0, 0.1098039, 1,
2.224847, 1.550802, -0.6787732, 1, 0, 0.1019608, 1,
2.271881, 2.000238, 0.2026386, 1, 0, 0.09411765, 1,
2.286945, 1.201104, 1.1375, 1, 0, 0.09019608, 1,
2.297262, 0.02440629, 2.364224, 1, 0, 0.08235294, 1,
2.301364, -0.285392, 1.821429, 1, 0, 0.07843138, 1,
2.346329, -1.089557, 4.192355, 1, 0, 0.07058824, 1,
2.356551, -0.5637426, 2.81043, 1, 0, 0.06666667, 1,
2.360675, -0.6318845, 2.905539, 1, 0, 0.05882353, 1,
2.387368, 0.6486612, 3.178416, 1, 0, 0.05490196, 1,
2.477563, 0.2212224, 2.134035, 1, 0, 0.04705882, 1,
2.498875, 0.6557078, 2.832272, 1, 0, 0.04313726, 1,
2.577601, 0.5753015, 0.9449001, 1, 0, 0.03529412, 1,
2.605282, 0.0183002, 0.7722421, 1, 0, 0.03137255, 1,
2.615599, 0.9048992, 2.144576, 1, 0, 0.02352941, 1,
2.637069, -0.908398, 1.894774, 1, 0, 0.01960784, 1,
2.735886, -0.7860867, 1.862581, 1, 0, 0.01176471, 1,
2.805251, -0.0203299, 2.457519, 1, 0, 0.007843138, 1
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
-0.2723517, -4.297979, -7.573826, 0, -0.5, 0.5, 0.5,
-0.2723517, -4.297979, -7.573826, 1, -0.5, 0.5, 0.5,
-0.2723517, -4.297979, -7.573826, 1, 1.5, 0.5, 0.5,
-0.2723517, -4.297979, -7.573826, 0, 1.5, 0.5, 0.5
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
-4.393262, 0.0308069, -7.573826, 0, -0.5, 0.5, 0.5,
-4.393262, 0.0308069, -7.573826, 1, -0.5, 0.5, 0.5,
-4.393262, 0.0308069, -7.573826, 1, 1.5, 0.5, 0.5,
-4.393262, 0.0308069, -7.573826, 0, 1.5, 0.5, 0.5
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
-4.393262, -4.297979, -0.1643884, 0, -0.5, 0.5, 0.5,
-4.393262, -4.297979, -0.1643884, 1, -0.5, 0.5, 0.5,
-4.393262, -4.297979, -0.1643884, 1, 1.5, 0.5, 0.5,
-4.393262, -4.297979, -0.1643884, 0, 1.5, 0.5, 0.5
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
-3, -3.299029, -5.863956,
2, -3.299029, -5.863956,
-3, -3.299029, -5.863956,
-3, -3.46552, -6.148934,
-2, -3.299029, -5.863956,
-2, -3.46552, -6.148934,
-1, -3.299029, -5.863956,
-1, -3.46552, -6.148934,
0, -3.299029, -5.863956,
0, -3.46552, -6.148934,
1, -3.299029, -5.863956,
1, -3.46552, -6.148934,
2, -3.299029, -5.863956,
2, -3.46552, -6.148934
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
-3, -3.798504, -6.718891, 0, -0.5, 0.5, 0.5,
-3, -3.798504, -6.718891, 1, -0.5, 0.5, 0.5,
-3, -3.798504, -6.718891, 1, 1.5, 0.5, 0.5,
-3, -3.798504, -6.718891, 0, 1.5, 0.5, 0.5,
-2, -3.798504, -6.718891, 0, -0.5, 0.5, 0.5,
-2, -3.798504, -6.718891, 1, -0.5, 0.5, 0.5,
-2, -3.798504, -6.718891, 1, 1.5, 0.5, 0.5,
-2, -3.798504, -6.718891, 0, 1.5, 0.5, 0.5,
-1, -3.798504, -6.718891, 0, -0.5, 0.5, 0.5,
-1, -3.798504, -6.718891, 1, -0.5, 0.5, 0.5,
-1, -3.798504, -6.718891, 1, 1.5, 0.5, 0.5,
-1, -3.798504, -6.718891, 0, 1.5, 0.5, 0.5,
0, -3.798504, -6.718891, 0, -0.5, 0.5, 0.5,
0, -3.798504, -6.718891, 1, -0.5, 0.5, 0.5,
0, -3.798504, -6.718891, 1, 1.5, 0.5, 0.5,
0, -3.798504, -6.718891, 0, 1.5, 0.5, 0.5,
1, -3.798504, -6.718891, 0, -0.5, 0.5, 0.5,
1, -3.798504, -6.718891, 1, -0.5, 0.5, 0.5,
1, -3.798504, -6.718891, 1, 1.5, 0.5, 0.5,
1, -3.798504, -6.718891, 0, 1.5, 0.5, 0.5,
2, -3.798504, -6.718891, 0, -0.5, 0.5, 0.5,
2, -3.798504, -6.718891, 1, -0.5, 0.5, 0.5,
2, -3.798504, -6.718891, 1, 1.5, 0.5, 0.5,
2, -3.798504, -6.718891, 0, 1.5, 0.5, 0.5
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
-3.442283, -3, -5.863956,
-3.442283, 3, -5.863956,
-3.442283, -3, -5.863956,
-3.600779, -3, -6.148934,
-3.442283, -2, -5.863956,
-3.600779, -2, -6.148934,
-3.442283, -1, -5.863956,
-3.600779, -1, -6.148934,
-3.442283, 0, -5.863956,
-3.600779, 0, -6.148934,
-3.442283, 1, -5.863956,
-3.600779, 1, -6.148934,
-3.442283, 2, -5.863956,
-3.600779, 2, -6.148934,
-3.442283, 3, -5.863956,
-3.600779, 3, -6.148934
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
-3.917772, -3, -6.718891, 0, -0.5, 0.5, 0.5,
-3.917772, -3, -6.718891, 1, -0.5, 0.5, 0.5,
-3.917772, -3, -6.718891, 1, 1.5, 0.5, 0.5,
-3.917772, -3, -6.718891, 0, 1.5, 0.5, 0.5,
-3.917772, -2, -6.718891, 0, -0.5, 0.5, 0.5,
-3.917772, -2, -6.718891, 1, -0.5, 0.5, 0.5,
-3.917772, -2, -6.718891, 1, 1.5, 0.5, 0.5,
-3.917772, -2, -6.718891, 0, 1.5, 0.5, 0.5,
-3.917772, -1, -6.718891, 0, -0.5, 0.5, 0.5,
-3.917772, -1, -6.718891, 1, -0.5, 0.5, 0.5,
-3.917772, -1, -6.718891, 1, 1.5, 0.5, 0.5,
-3.917772, -1, -6.718891, 0, 1.5, 0.5, 0.5,
-3.917772, 0, -6.718891, 0, -0.5, 0.5, 0.5,
-3.917772, 0, -6.718891, 1, -0.5, 0.5, 0.5,
-3.917772, 0, -6.718891, 1, 1.5, 0.5, 0.5,
-3.917772, 0, -6.718891, 0, 1.5, 0.5, 0.5,
-3.917772, 1, -6.718891, 0, -0.5, 0.5, 0.5,
-3.917772, 1, -6.718891, 1, -0.5, 0.5, 0.5,
-3.917772, 1, -6.718891, 1, 1.5, 0.5, 0.5,
-3.917772, 1, -6.718891, 0, 1.5, 0.5, 0.5,
-3.917772, 2, -6.718891, 0, -0.5, 0.5, 0.5,
-3.917772, 2, -6.718891, 1, -0.5, 0.5, 0.5,
-3.917772, 2, -6.718891, 1, 1.5, 0.5, 0.5,
-3.917772, 2, -6.718891, 0, 1.5, 0.5, 0.5,
-3.917772, 3, -6.718891, 0, -0.5, 0.5, 0.5,
-3.917772, 3, -6.718891, 1, -0.5, 0.5, 0.5,
-3.917772, 3, -6.718891, 1, 1.5, 0.5, 0.5,
-3.917772, 3, -6.718891, 0, 1.5, 0.5, 0.5
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
-3.442283, -3.299029, -4,
-3.442283, -3.299029, 4,
-3.442283, -3.299029, -4,
-3.600779, -3.46552, -4,
-3.442283, -3.299029, -2,
-3.600779, -3.46552, -2,
-3.442283, -3.299029, 0,
-3.600779, -3.46552, 0,
-3.442283, -3.299029, 2,
-3.600779, -3.46552, 2,
-3.442283, -3.299029, 4,
-3.600779, -3.46552, 4
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
-3.917772, -3.798504, -4, 0, -0.5, 0.5, 0.5,
-3.917772, -3.798504, -4, 1, -0.5, 0.5, 0.5,
-3.917772, -3.798504, -4, 1, 1.5, 0.5, 0.5,
-3.917772, -3.798504, -4, 0, 1.5, 0.5, 0.5,
-3.917772, -3.798504, -2, 0, -0.5, 0.5, 0.5,
-3.917772, -3.798504, -2, 1, -0.5, 0.5, 0.5,
-3.917772, -3.798504, -2, 1, 1.5, 0.5, 0.5,
-3.917772, -3.798504, -2, 0, 1.5, 0.5, 0.5,
-3.917772, -3.798504, 0, 0, -0.5, 0.5, 0.5,
-3.917772, -3.798504, 0, 1, -0.5, 0.5, 0.5,
-3.917772, -3.798504, 0, 1, 1.5, 0.5, 0.5,
-3.917772, -3.798504, 0, 0, 1.5, 0.5, 0.5,
-3.917772, -3.798504, 2, 0, -0.5, 0.5, 0.5,
-3.917772, -3.798504, 2, 1, -0.5, 0.5, 0.5,
-3.917772, -3.798504, 2, 1, 1.5, 0.5, 0.5,
-3.917772, -3.798504, 2, 0, 1.5, 0.5, 0.5,
-3.917772, -3.798504, 4, 0, -0.5, 0.5, 0.5,
-3.917772, -3.798504, 4, 1, -0.5, 0.5, 0.5,
-3.917772, -3.798504, 4, 1, 1.5, 0.5, 0.5,
-3.917772, -3.798504, 4, 0, 1.5, 0.5, 0.5
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
-3.442283, -3.299029, -5.863956,
-3.442283, 3.360642, -5.863956,
-3.442283, -3.299029, 5.535179,
-3.442283, 3.360642, 5.535179,
-3.442283, -3.299029, -5.863956,
-3.442283, -3.299029, 5.535179,
-3.442283, 3.360642, -5.863956,
-3.442283, 3.360642, 5.535179,
-3.442283, -3.299029, -5.863956,
2.897579, -3.299029, -5.863956,
-3.442283, -3.299029, 5.535179,
2.897579, -3.299029, 5.535179,
-3.442283, 3.360642, -5.863956,
2.897579, 3.360642, -5.863956,
-3.442283, 3.360642, 5.535179,
2.897579, 3.360642, 5.535179,
2.897579, -3.299029, -5.863956,
2.897579, 3.360642, -5.863956,
2.897579, -3.299029, 5.535179,
2.897579, 3.360642, 5.535179,
2.897579, -3.299029, -5.863956,
2.897579, -3.299029, 5.535179,
2.897579, 3.360642, -5.863956,
2.897579, 3.360642, 5.535179
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
var radius = 7.820315;
var distance = 34.79346;
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
mvMatrix.translate( 0.2723517, -0.0308069, 0.1643884 );
mvMatrix.scale( 1.333701, 1.269654, 0.7417649 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.79346);
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
Fuberidazole<-read.table("Fuberidazole.xyz")
```

```
## Error in read.table("Fuberidazole.xyz"): no lines available in input
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
-3.349955, 0.4889263, -2.008393, 0, 0, 1, 1, 1,
-3.217199, 2.181194, -1.438155, 1, 0, 0, 1, 1,
-3.019148, -1.095849, -3.650654, 1, 0, 0, 1, 1,
-3.000631, 0.5069035, -2.607932, 1, 0, 0, 1, 1,
-2.839427, -1.459251, -3.168285, 1, 0, 0, 1, 1,
-2.774465, 0.227523, -1.413882, 1, 0, 0, 1, 1,
-2.67593, -0.4405652, -0.874081, 0, 0, 0, 1, 1,
-2.581365, 1.112502, -2.095489, 0, 0, 0, 1, 1,
-2.571783, -0.2292786, -1.910046, 0, 0, 0, 1, 1,
-2.556905, -0.05206442, -0.9470483, 0, 0, 0, 1, 1,
-2.483871, -0.3824648, -1.803952, 0, 0, 0, 1, 1,
-2.358866, 1.054738, -3.24534, 0, 0, 0, 1, 1,
-2.352283, 0.5562677, -2.016096, 0, 0, 0, 1, 1,
-2.314057, -0.3849882, -0.5030985, 1, 1, 1, 1, 1,
-2.286788, -1.32276, -2.834832, 1, 1, 1, 1, 1,
-2.251252, -0.09680901, -1.265936, 1, 1, 1, 1, 1,
-2.239123, -0.134052, -0.9565491, 1, 1, 1, 1, 1,
-2.197542, -3.153484, -5.697949, 1, 1, 1, 1, 1,
-2.187997, 0.702197, -3.344003, 1, 1, 1, 1, 1,
-2.184917, -0.1056864, -0.5212083, 1, 1, 1, 1, 1,
-2.115287, 2.640601, -0.4420276, 1, 1, 1, 1, 1,
-2.1059, 0.2301543, -1.768949, 1, 1, 1, 1, 1,
-2.052711, -2.015093, -1.828107, 1, 1, 1, 1, 1,
-2.051127, 1.459192, -2.183224, 1, 1, 1, 1, 1,
-2.050264, 0.7762823, 0.6103066, 1, 1, 1, 1, 1,
-2.049077, 0.5681347, -0.9875332, 1, 1, 1, 1, 1,
-2.024522, -0.07014372, -2.546859, 1, 1, 1, 1, 1,
-1.998153, 1.781223, -0.9099328, 1, 1, 1, 1, 1,
-1.997186, -0.6455535, -2.72462, 0, 0, 1, 1, 1,
-1.952891, -0.645072, -0.5549359, 1, 0, 0, 1, 1,
-1.949778, 0.5235468, 0.1825243, 1, 0, 0, 1, 1,
-1.92207, -0.9202482, -3.23332, 1, 0, 0, 1, 1,
-1.876222, 1.115387, -1.107852, 1, 0, 0, 1, 1,
-1.870343, 0.6068149, -0.3471862, 1, 0, 0, 1, 1,
-1.861343, 1.750431, 0.05726682, 0, 0, 0, 1, 1,
-1.830864, -1.28, -1.863192, 0, 0, 0, 1, 1,
-1.821087, 0.9920993, -2.150288, 0, 0, 0, 1, 1,
-1.792801, 1.298533, -1.232525, 0, 0, 0, 1, 1,
-1.7915, 0.3123314, -2.634563, 0, 0, 0, 1, 1,
-1.784368, -0.2229552, -0.8001482, 0, 0, 0, 1, 1,
-1.721487, -0.7138878, -1.407531, 0, 0, 0, 1, 1,
-1.718601, -0.008735462, -1.717846, 1, 1, 1, 1, 1,
-1.718084, 2.013434, 0.09635803, 1, 1, 1, 1, 1,
-1.707602, -1.71913, -3.208969, 1, 1, 1, 1, 1,
-1.696301, 0.8937148, -1.560817, 1, 1, 1, 1, 1,
-1.694753, -1.931794, -1.742352, 1, 1, 1, 1, 1,
-1.684224, -0.4825527, -0.7494734, 1, 1, 1, 1, 1,
-1.681509, -0.8053382, -2.284318, 1, 1, 1, 1, 1,
-1.671033, -0.1236716, -1.090771, 1, 1, 1, 1, 1,
-1.667461, -0.5087575, -1.284455, 1, 1, 1, 1, 1,
-1.649627, -0.7018586, -1.741381, 1, 1, 1, 1, 1,
-1.64913, 0.1220692, -1.086797, 1, 1, 1, 1, 1,
-1.647199, 1.200203, -1.582169, 1, 1, 1, 1, 1,
-1.644628, 0.565855, -0.2989947, 1, 1, 1, 1, 1,
-1.638801, 0.5656176, -1.103906, 1, 1, 1, 1, 1,
-1.624157, -0.8315631, -1.501434, 1, 1, 1, 1, 1,
-1.610734, -0.1467394, -2.100323, 0, 0, 1, 1, 1,
-1.605411, -0.06430984, -1.805957, 1, 0, 0, 1, 1,
-1.591064, 1.577422, -1.685486, 1, 0, 0, 1, 1,
-1.588642, -0.5343452, -1.018728, 1, 0, 0, 1, 1,
-1.584415, 0.4916902, -1.313294, 1, 0, 0, 1, 1,
-1.582852, -0.906882, -3.086843, 1, 0, 0, 1, 1,
-1.57872, -1.176361, -2.776332, 0, 0, 0, 1, 1,
-1.578557, -2.593396, -3.386662, 0, 0, 0, 1, 1,
-1.567497, -0.1035027, -1.610131, 0, 0, 0, 1, 1,
-1.556698, 0.8749893, -0.8857217, 0, 0, 0, 1, 1,
-1.555757, 0.1214578, -2.27661, 0, 0, 0, 1, 1,
-1.553805, 0.08945148, -1.356147, 0, 0, 0, 1, 1,
-1.549781, -0.2581057, -0.703959, 0, 0, 0, 1, 1,
-1.549131, -0.04071283, -0.952938, 1, 1, 1, 1, 1,
-1.548473, 1.19892, -2.766896, 1, 1, 1, 1, 1,
-1.545043, 0.3892296, -1.184069, 1, 1, 1, 1, 1,
-1.540549, 0.3983953, -2.438825, 1, 1, 1, 1, 1,
-1.51443, -0.4190977, -4.034511, 1, 1, 1, 1, 1,
-1.50957, 0.2317849, -1.530494, 1, 1, 1, 1, 1,
-1.485659, 0.220113, -1.986331, 1, 1, 1, 1, 1,
-1.483634, 0.07434993, -1.494559, 1, 1, 1, 1, 1,
-1.47355, 0.8103546, -0.2944752, 1, 1, 1, 1, 1,
-1.469508, -1.435616, -3.093322, 1, 1, 1, 1, 1,
-1.469059, 0.3005815, -0.5917304, 1, 1, 1, 1, 1,
-1.464435, -0.5722931, -1.279827, 1, 1, 1, 1, 1,
-1.460496, -0.5461401, -2.443564, 1, 1, 1, 1, 1,
-1.438874, 0.4331566, -2.502158, 1, 1, 1, 1, 1,
-1.436165, 0.426859, -0.4609331, 1, 1, 1, 1, 1,
-1.431336, 0.8064034, 0.4681271, 0, 0, 1, 1, 1,
-1.429401, -1.165884, -3.273663, 1, 0, 0, 1, 1,
-1.421855, 1.727427, -2.775203, 1, 0, 0, 1, 1,
-1.420326, 0.6830589, -2.730021, 1, 0, 0, 1, 1,
-1.414667, 0.2992857, -1.288525, 1, 0, 0, 1, 1,
-1.407314, 0.07717679, -0.7989601, 1, 0, 0, 1, 1,
-1.405142, 1.356934, -0.6936619, 0, 0, 0, 1, 1,
-1.39662, -0.05153432, -3.017787, 0, 0, 0, 1, 1,
-1.395985, 0.09416554, -0.1903489, 0, 0, 0, 1, 1,
-1.392953, -0.03058717, -2.225294, 0, 0, 0, 1, 1,
-1.386469, -1.685755, -2.094954, 0, 0, 0, 1, 1,
-1.376303, 0.5989338, -1.753015, 0, 0, 0, 1, 1,
-1.370892, 0.1105399, -0.8397052, 0, 0, 0, 1, 1,
-1.355367, 1.322869, -1.166515, 1, 1, 1, 1, 1,
-1.350649, 0.05946117, -1.55834, 1, 1, 1, 1, 1,
-1.345581, -0.6938583, -2.777878, 1, 1, 1, 1, 1,
-1.345449, -1.566406, -2.296821, 1, 1, 1, 1, 1,
-1.330709, -0.6285672, -2.786936, 1, 1, 1, 1, 1,
-1.330268, 0.4515695, -1.132448, 1, 1, 1, 1, 1,
-1.320218, 0.678515, -1.589698, 1, 1, 1, 1, 1,
-1.316605, 0.7790279, -0.7271857, 1, 1, 1, 1, 1,
-1.313316, 0.3592587, -2.201313, 1, 1, 1, 1, 1,
-1.309334, 2.517037, 0.4784351, 1, 1, 1, 1, 1,
-1.308072, 1.086227, -1.179708, 1, 1, 1, 1, 1,
-1.300031, -0.721912, -2.322589, 1, 1, 1, 1, 1,
-1.291681, -1.27441, -1.625783, 1, 1, 1, 1, 1,
-1.290314, -0.5598571, -2.206421, 1, 1, 1, 1, 1,
-1.285138, 0.4934541, -2.154336, 1, 1, 1, 1, 1,
-1.284802, 1.018962, -0.4094766, 0, 0, 1, 1, 1,
-1.265618, -0.3043728, -1.37339, 1, 0, 0, 1, 1,
-1.263395, -2.338171, -2.784104, 1, 0, 0, 1, 1,
-1.258608, -0.02625009, -1.979515, 1, 0, 0, 1, 1,
-1.256301, -0.6778873, -1.272114, 1, 0, 0, 1, 1,
-1.24784, 1.10469, -2.056604, 1, 0, 0, 1, 1,
-1.245423, -0.7768714, 0.002784913, 0, 0, 0, 1, 1,
-1.242958, 0.5817474, -1.241594, 0, 0, 0, 1, 1,
-1.233598, -0.9464939, -1.142751, 0, 0, 0, 1, 1,
-1.22633, 1.38305, -0.01886174, 0, 0, 0, 1, 1,
-1.224941, -0.3584381, -0.8930617, 0, 0, 0, 1, 1,
-1.219722, -0.028339, -0.4714683, 0, 0, 0, 1, 1,
-1.21519, -0.3770702, -0.8063368, 0, 0, 0, 1, 1,
-1.199893, 0.3103952, -1.040223, 1, 1, 1, 1, 1,
-1.198097, 0.002073436, -1.596856, 1, 1, 1, 1, 1,
-1.195818, -0.5434048, -2.879341, 1, 1, 1, 1, 1,
-1.187575, -0.3688737, -2.446795, 1, 1, 1, 1, 1,
-1.182635, -0.5534781, -0.736074, 1, 1, 1, 1, 1,
-1.180385, 0.2823039, -1.639648, 1, 1, 1, 1, 1,
-1.178854, 0.4282117, 0.1121312, 1, 1, 1, 1, 1,
-1.16411, -0.4432912, -3.887194, 1, 1, 1, 1, 1,
-1.163522, -2.316565, -0.95021, 1, 1, 1, 1, 1,
-1.158033, 0.1766753, -2.051506, 1, 1, 1, 1, 1,
-1.153355, 0.9348235, -1.15461, 1, 1, 1, 1, 1,
-1.144516, 1.150087, -0.8202891, 1, 1, 1, 1, 1,
-1.144464, -0.9841974, -2.109479, 1, 1, 1, 1, 1,
-1.143676, 0.2468588, -2.13608, 1, 1, 1, 1, 1,
-1.128011, 0.4645103, -0.6571497, 1, 1, 1, 1, 1,
-1.124508, -0.7760816, -0.8211712, 0, 0, 1, 1, 1,
-1.115023, 0.2324406, -2.259075, 1, 0, 0, 1, 1,
-1.114408, 0.532894, -2.759728, 1, 0, 0, 1, 1,
-1.095128, 0.07022385, -0.3606051, 1, 0, 0, 1, 1,
-1.089284, -3.202043, -3.003958, 1, 0, 0, 1, 1,
-1.088846, -0.3387529, -1.074292, 1, 0, 0, 1, 1,
-1.088296, 1.734555, -0.04134944, 0, 0, 0, 1, 1,
-1.086703, 0.860154, -0.6754789, 0, 0, 0, 1, 1,
-1.082932, -0.7070321, -2.595123, 0, 0, 0, 1, 1,
-1.07848, 0.9150918, 0.2664372, 0, 0, 0, 1, 1,
-1.078058, -0.9875293, -2.95885, 0, 0, 0, 1, 1,
-1.076571, 0.01773179, -2.857812, 0, 0, 0, 1, 1,
-1.074134, -0.4843331, -0.7774889, 0, 0, 0, 1, 1,
-1.071981, 1.982387, 0.3372241, 1, 1, 1, 1, 1,
-1.059806, 0.02757533, -0.9223157, 1, 1, 1, 1, 1,
-1.057458, -1.37563, -1.924039, 1, 1, 1, 1, 1,
-1.056232, -1.616591, -4.713734, 1, 1, 1, 1, 1,
-1.053628, 0.9164392, -1.088045, 1, 1, 1, 1, 1,
-1.050235, 0.07490774, -1.014662, 1, 1, 1, 1, 1,
-1.048413, 0.05838041, -2.196118, 1, 1, 1, 1, 1,
-1.039786, -1.002694, -1.968127, 1, 1, 1, 1, 1,
-1.035423, 0.7207432, -2.270744, 1, 1, 1, 1, 1,
-1.034069, 0.03977815, -2.004373, 1, 1, 1, 1, 1,
-1.023998, 0.03492915, -2.132051, 1, 1, 1, 1, 1,
-1.018133, -0.02831053, -2.297144, 1, 1, 1, 1, 1,
-1.012914, 0.2635914, -2.203359, 1, 1, 1, 1, 1,
-1.009926, 0.3214244, -0.5821674, 1, 1, 1, 1, 1,
-1.008651, 1.788201, -0.5344272, 1, 1, 1, 1, 1,
-1.000026, -0.138676, -0.6974007, 0, 0, 1, 1, 1,
-0.9976642, -0.291288, -1.840821, 1, 0, 0, 1, 1,
-0.9966959, 0.1192605, -1.751531, 1, 0, 0, 1, 1,
-0.9909481, 1.093658, -0.7827328, 1, 0, 0, 1, 1,
-0.9888782, 2.079483, 0.8689483, 1, 0, 0, 1, 1,
-0.9717034, 1.562525, 0.2409774, 1, 0, 0, 1, 1,
-0.9663602, -1.695498, -3.733429, 0, 0, 0, 1, 1,
-0.9614264, 0.3495228, -0.7511584, 0, 0, 0, 1, 1,
-0.9547936, 1.4506, -0.2397443, 0, 0, 0, 1, 1,
-0.9520161, 0.8666121, -1.109001, 0, 0, 0, 1, 1,
-0.9494709, 0.2835069, 0.2319731, 0, 0, 0, 1, 1,
-0.9454175, -0.01243672, -1.598262, 0, 0, 0, 1, 1,
-0.9448506, 1.557655, -0.06161168, 0, 0, 0, 1, 1,
-0.9440821, 1.605575, -0.584187, 1, 1, 1, 1, 1,
-0.9420187, 1.363475, 0.6643243, 1, 1, 1, 1, 1,
-0.9395506, -0.3202833, -2.064953, 1, 1, 1, 1, 1,
-0.9347453, -1.917857, -1.685014, 1, 1, 1, 1, 1,
-0.9334682, 0.7071805, -1.022391, 1, 1, 1, 1, 1,
-0.9293185, 0.7506841, -1.091339, 1, 1, 1, 1, 1,
-0.9230502, -0.2402459, -1.973561, 1, 1, 1, 1, 1,
-0.9124046, -1.41041, -2.976889, 1, 1, 1, 1, 1,
-0.9034992, 0.2636744, -0.9683836, 1, 1, 1, 1, 1,
-0.8861311, -1.453078, -1.90644, 1, 1, 1, 1, 1,
-0.8788252, -0.4716031, -2.16768, 1, 1, 1, 1, 1,
-0.8767427, 0.07129149, -0.3854666, 1, 1, 1, 1, 1,
-0.8742652, 0.04959211, -3.050449, 1, 1, 1, 1, 1,
-0.8710886, -2.092683, -0.7435738, 1, 1, 1, 1, 1,
-0.8673193, 0.181283, -3.342832, 1, 1, 1, 1, 1,
-0.8638415, -0.1351441, -0.2296163, 0, 0, 1, 1, 1,
-0.8528913, 0.8675422, -2.576494, 1, 0, 0, 1, 1,
-0.8525258, -0.7156389, 0.8550434, 1, 0, 0, 1, 1,
-0.8516681, 0.1354823, -0.8168784, 1, 0, 0, 1, 1,
-0.8486797, -1.366598, -3.896136, 1, 0, 0, 1, 1,
-0.8454955, 1.512631, -0.07621003, 1, 0, 0, 1, 1,
-0.8435626, 0.372651, -1.594264, 0, 0, 0, 1, 1,
-0.8409351, 1.283798, -0.2222251, 0, 0, 0, 1, 1,
-0.8376395, 0.7477179, -0.5830226, 0, 0, 0, 1, 1,
-0.8360764, -0.8352829, -2.377542, 0, 0, 0, 1, 1,
-0.8245438, -1.181949, -3.328273, 0, 0, 0, 1, 1,
-0.8238933, -0.2822722, -1.677113, 0, 0, 0, 1, 1,
-0.818952, 0.8724047, 0.6221159, 0, 0, 0, 1, 1,
-0.8105932, -0.05263552, -0.7701614, 1, 1, 1, 1, 1,
-0.8079457, 1.143394, -0.2443717, 1, 1, 1, 1, 1,
-0.8071343, 0.2658471, -1.112767, 1, 1, 1, 1, 1,
-0.7902123, -0.9623156, -1.94665, 1, 1, 1, 1, 1,
-0.7815974, 0.4948605, -1.317713, 1, 1, 1, 1, 1,
-0.781509, -0.5007169, -3.929391, 1, 1, 1, 1, 1,
-0.7773443, -0.4336531, -1.832611, 1, 1, 1, 1, 1,
-0.7768531, 0.7999145, 0.5568165, 1, 1, 1, 1, 1,
-0.7725646, 0.6087269, -1.476028, 1, 1, 1, 1, 1,
-0.7699413, -0.3328431, -2.220834, 1, 1, 1, 1, 1,
-0.7692829, -0.6285611, -3.12157, 1, 1, 1, 1, 1,
-0.768726, -0.7892045, -2.869302, 1, 1, 1, 1, 1,
-0.7674761, -1.175409, -3.85214, 1, 1, 1, 1, 1,
-0.7661563, -0.2908361, -1.305003, 1, 1, 1, 1, 1,
-0.7569273, 1.103584, 0.3883864, 1, 1, 1, 1, 1,
-0.7565258, -1.734548, -1.56855, 0, 0, 1, 1, 1,
-0.7518202, -0.3293784, -1.699043, 1, 0, 0, 1, 1,
-0.7481728, -0.5916201, -2.261704, 1, 0, 0, 1, 1,
-0.7479802, -1.347806, -2.167222, 1, 0, 0, 1, 1,
-0.7462129, -1.536107, -2.553645, 1, 0, 0, 1, 1,
-0.7445147, -1.295746, -0.9196024, 1, 0, 0, 1, 1,
-0.7444202, -0.3334008, -2.309886, 0, 0, 0, 1, 1,
-0.7371794, -0.4273725, -1.164465, 0, 0, 0, 1, 1,
-0.731741, -1.475362, -3.319364, 0, 0, 0, 1, 1,
-0.7298436, 0.6791535, 0.2942508, 0, 0, 0, 1, 1,
-0.7227449, 0.8654438, -1.128958, 0, 0, 0, 1, 1,
-0.7174435, -0.134739, -2.455971, 0, 0, 0, 1, 1,
-0.7166951, 1.174517, 0.8893185, 0, 0, 0, 1, 1,
-0.7120035, 0.5187611, -1.170165, 1, 1, 1, 1, 1,
-0.7113309, -0.5585797, -2.05075, 1, 1, 1, 1, 1,
-0.71128, 0.4591348, -2.62401, 1, 1, 1, 1, 1,
-0.7110536, 2.728557, -0.3512518, 1, 1, 1, 1, 1,
-0.7041503, 0.01336979, -2.210278, 1, 1, 1, 1, 1,
-0.7014564, -0.6085901, -3.018691, 1, 1, 1, 1, 1,
-0.7011501, -0.9118547, -2.04603, 1, 1, 1, 1, 1,
-0.7004205, -0.2675031, -2.346096, 1, 1, 1, 1, 1,
-0.6955887, 0.8416542, -0.5249872, 1, 1, 1, 1, 1,
-0.693561, -0.5585106, -2.287345, 1, 1, 1, 1, 1,
-0.6934392, -0.5723466, -2.135805, 1, 1, 1, 1, 1,
-0.6732533, 1.025313, -0.2601033, 1, 1, 1, 1, 1,
-0.6722827, -0.2000024, -1.19929, 1, 1, 1, 1, 1,
-0.6691644, -0.09285957, -0.7953862, 1, 1, 1, 1, 1,
-0.6599943, 0.650817, -2.13805, 1, 1, 1, 1, 1,
-0.6572013, -1.211986, -2.189803, 0, 0, 1, 1, 1,
-0.6505828, 0.9657494, -1.967268, 1, 0, 0, 1, 1,
-0.6475569, -0.6822708, -1.972561, 1, 0, 0, 1, 1,
-0.6465487, 0.7316231, -0.2742187, 1, 0, 0, 1, 1,
-0.6447501, 0.1394917, -0.5376633, 1, 0, 0, 1, 1,
-0.6423045, 0.1399989, -1.609823, 1, 0, 0, 1, 1,
-0.6419739, -0.64675, -3.278238, 0, 0, 0, 1, 1,
-0.6419445, 1.424909, -0.7202201, 0, 0, 0, 1, 1,
-0.6415296, -0.2805643, -3.410633, 0, 0, 0, 1, 1,
-0.6396563, -0.1083018, -1.75087, 0, 0, 0, 1, 1,
-0.6377677, 1.038126, 0.2269127, 0, 0, 0, 1, 1,
-0.6280078, 0.4379165, -0.8684446, 0, 0, 0, 1, 1,
-0.627678, 0.2395663, -1.296803, 0, 0, 0, 1, 1,
-0.6212507, -0.967081, -3.799172, 1, 1, 1, 1, 1,
-0.6202968, 0.2061925, -1.22282, 1, 1, 1, 1, 1,
-0.6191292, 0.71806, -0.1634872, 1, 1, 1, 1, 1,
-0.6155465, 1.251696, -0.4507304, 1, 1, 1, 1, 1,
-0.6111782, 1.297361, 0.6452227, 1, 1, 1, 1, 1,
-0.6049541, -0.7175494, -3.235412, 1, 1, 1, 1, 1,
-0.601705, 0.5085094, -0.09901419, 1, 1, 1, 1, 1,
-0.5952461, 1.313373, 2.095101, 1, 1, 1, 1, 1,
-0.5886229, 0.5891146, -1.025196, 1, 1, 1, 1, 1,
-0.5874972, 1.017112, -0.1303507, 1, 1, 1, 1, 1,
-0.586101, 0.1425359, 0.1047567, 1, 1, 1, 1, 1,
-0.5831484, 0.1617393, -1.536186, 1, 1, 1, 1, 1,
-0.5810168, -1.032821, -1.912198, 1, 1, 1, 1, 1,
-0.578365, 0.9599547, -0.9141154, 1, 1, 1, 1, 1,
-0.5775688, -0.4294741, -2.400674, 1, 1, 1, 1, 1,
-0.5704212, -1.488645, -2.600275, 0, 0, 1, 1, 1,
-0.5698839, -1.875795, -2.634915, 1, 0, 0, 1, 1,
-0.5693848, 0.6685792, -1.169705, 1, 0, 0, 1, 1,
-0.5679671, 0.7859451, -0.5656297, 1, 0, 0, 1, 1,
-0.5669552, -0.8309808, -3.573893, 1, 0, 0, 1, 1,
-0.5575887, 0.476042, 0.735827, 1, 0, 0, 1, 1,
-0.5498156, 0.3067973, -0.4215603, 0, 0, 0, 1, 1,
-0.5444509, -0.2066983, -1.657377, 0, 0, 0, 1, 1,
-0.5422035, 1.553574, -0.1553705, 0, 0, 0, 1, 1,
-0.5393304, 0.05673504, -1.893822, 0, 0, 0, 1, 1,
-0.5388154, 0.4347289, -1.707252, 0, 0, 0, 1, 1,
-0.5377605, -1.276309, -1.849988, 0, 0, 0, 1, 1,
-0.5372236, -0.006746338, -2.007785, 0, 0, 0, 1, 1,
-0.5329363, 0.5184894, -0.8905657, 1, 1, 1, 1, 1,
-0.526581, -0.9968282, -2.328487, 1, 1, 1, 1, 1,
-0.5248437, 1.82527, -0.1788936, 1, 1, 1, 1, 1,
-0.5244703, -2.099521, -3.073096, 1, 1, 1, 1, 1,
-0.5220156, 1.133608, 0.4861586, 1, 1, 1, 1, 1,
-0.5210202, 0.3828249, 0.1420365, 1, 1, 1, 1, 1,
-0.5208508, 0.9935824, -1.403371, 1, 1, 1, 1, 1,
-0.5200395, -2.157236, -5.075425, 1, 1, 1, 1, 1,
-0.5193572, -1.30276, -2.302169, 1, 1, 1, 1, 1,
-0.51717, -0.4186731, -1.581554, 1, 1, 1, 1, 1,
-0.5169658, -0.2776845, -1.572879, 1, 1, 1, 1, 1,
-0.5161016, -0.8654413, -1.154715, 1, 1, 1, 1, 1,
-0.5132548, -0.5932694, -1.115167, 1, 1, 1, 1, 1,
-0.5068731, 0.5859556, 0.6127025, 1, 1, 1, 1, 1,
-0.505107, 0.4470613, -0.3096991, 1, 1, 1, 1, 1,
-0.5022837, -2.172194, -3.79042, 0, 0, 1, 1, 1,
-0.5010629, 1.806293, -0.5674188, 1, 0, 0, 1, 1,
-0.5010056, -2.088973, -4.867281, 1, 0, 0, 1, 1,
-0.4918724, -1.524129, -2.480499, 1, 0, 0, 1, 1,
-0.4892102, 0.5675046, -1.063101, 1, 0, 0, 1, 1,
-0.4885226, -0.5077469, -3.219929, 1, 0, 0, 1, 1,
-0.4860362, 1.617804, -0.2755385, 0, 0, 0, 1, 1,
-0.477608, -0.08585066, -4.171471, 0, 0, 0, 1, 1,
-0.4774178, -1.354013, -1.257221, 0, 0, 0, 1, 1,
-0.475568, 0.9877096, 0.1016349, 0, 0, 0, 1, 1,
-0.4752748, -1.864372, -1.828141, 0, 0, 0, 1, 1,
-0.4749463, -0.4484643, -2.16619, 0, 0, 0, 1, 1,
-0.4744775, 0.9485431, -1.138404, 0, 0, 0, 1, 1,
-0.4736784, -1.069401, -3.405725, 1, 1, 1, 1, 1,
-0.4725833, 1.210349, -0.68401, 1, 1, 1, 1, 1,
-0.471438, -1.763138, -4.426272, 1, 1, 1, 1, 1,
-0.4636263, 0.7070876, -1.87277, 1, 1, 1, 1, 1,
-0.4623049, 0.8572589, -0.01304446, 1, 1, 1, 1, 1,
-0.462281, -1.346025, -3.735313, 1, 1, 1, 1, 1,
-0.4614846, -1.21261, -2.499477, 1, 1, 1, 1, 1,
-0.4611152, 0.02000358, -1.311707, 1, 1, 1, 1, 1,
-0.4604707, 0.05686543, -0.4856845, 1, 1, 1, 1, 1,
-0.4592046, 1.861992, -1.180961, 1, 1, 1, 1, 1,
-0.4542079, -0.3839942, -0.5643356, 1, 1, 1, 1, 1,
-0.4536299, -0.6585841, -3.352587, 1, 1, 1, 1, 1,
-0.4511333, 0.5171313, -0.1979879, 1, 1, 1, 1, 1,
-0.4497399, -0.7972739, -2.747084, 1, 1, 1, 1, 1,
-0.4482971, 0.4013899, -1.601161, 1, 1, 1, 1, 1,
-0.4449444, 0.9580057, 0.9661822, 0, 0, 1, 1, 1,
-0.4421913, -1.55092, -2.651094, 1, 0, 0, 1, 1,
-0.4328522, -0.8186845, -1.48435, 1, 0, 0, 1, 1,
-0.431447, -0.02296067, -0.4411327, 1, 0, 0, 1, 1,
-0.4275794, -0.817395, -3.637888, 1, 0, 0, 1, 1,
-0.4259146, 0.3782089, -0.1753028, 1, 0, 0, 1, 1,
-0.4256407, 2.053505, 1.108385, 0, 0, 0, 1, 1,
-0.4251087, 1.697642, 0.7463567, 0, 0, 0, 1, 1,
-0.4229801, 0.2823332, -1.44457, 0, 0, 0, 1, 1,
-0.4226951, -1.513953, -3.448873, 0, 0, 0, 1, 1,
-0.4222993, 0.1660817, -1.314695, 0, 0, 0, 1, 1,
-0.4198492, 0.8879371, -1.224598, 0, 0, 0, 1, 1,
-0.4130811, -0.2785356, -3.297336, 0, 0, 0, 1, 1,
-0.4127435, -0.699698, -2.770075, 1, 1, 1, 1, 1,
-0.4078233, 1.719577, 0.5487855, 1, 1, 1, 1, 1,
-0.4043041, 0.2457357, -1.555933, 1, 1, 1, 1, 1,
-0.4030418, -0.5057685, -2.748956, 1, 1, 1, 1, 1,
-0.4006751, 0.3454273, 0.07905965, 1, 1, 1, 1, 1,
-0.3999796, -2.380015, -3.024796, 1, 1, 1, 1, 1,
-0.3952757, -0.239315, -2.349336, 1, 1, 1, 1, 1,
-0.39017, -0.2985678, -2.711958, 1, 1, 1, 1, 1,
-0.3899862, -0.2309602, -2.889895, 1, 1, 1, 1, 1,
-0.389952, 0.4380901, 0.4375454, 1, 1, 1, 1, 1,
-0.3893623, -1.263, -3.415338, 1, 1, 1, 1, 1,
-0.388053, -0.1520408, -4.183825, 1, 1, 1, 1, 1,
-0.3873097, -1.703585, -4.58033, 1, 1, 1, 1, 1,
-0.3864153, -0.6915135, -2.736723, 1, 1, 1, 1, 1,
-0.3859638, -0.3834643, -1.904062, 1, 1, 1, 1, 1,
-0.3857779, -1.982378, -2.021245, 0, 0, 1, 1, 1,
-0.3799024, -1.004053, -1.042512, 1, 0, 0, 1, 1,
-0.3797569, -1.739345, -3.194644, 1, 0, 0, 1, 1,
-0.373826, 0.563023, 1.836241, 1, 0, 0, 1, 1,
-0.3715599, -1.260874, -3.798012, 1, 0, 0, 1, 1,
-0.3703775, 0.3859687, -2.802678, 1, 0, 0, 1, 1,
-0.3698796, 1.241439, 0.3442273, 0, 0, 0, 1, 1,
-0.36577, 0.2719845, 1.697703, 0, 0, 0, 1, 1,
-0.3634482, 0.05815579, -2.095473, 0, 0, 0, 1, 1,
-0.3580086, -1.74824, -2.950898, 0, 0, 0, 1, 1,
-0.3578191, -1.310427, -1.803429, 0, 0, 0, 1, 1,
-0.3533285, 0.4516035, -1.502278, 0, 0, 0, 1, 1,
-0.3502927, -0.7369066, -2.053593, 0, 0, 0, 1, 1,
-0.3477838, 0.3750905, -0.2878504, 1, 1, 1, 1, 1,
-0.3398628, 0.06038105, -1.843371, 1, 1, 1, 1, 1,
-0.338158, 0.6935655, -1.226374, 1, 1, 1, 1, 1,
-0.3360265, -0.1598814, -0.2905595, 1, 1, 1, 1, 1,
-0.3329101, -0.8790905, -3.068929, 1, 1, 1, 1, 1,
-0.3266023, -0.3712226, -1.962831, 1, 1, 1, 1, 1,
-0.3256578, -0.7290581, -2.306204, 1, 1, 1, 1, 1,
-0.3215063, -0.8475821, -1.152547, 1, 1, 1, 1, 1,
-0.3174899, -1.472303, -2.195001, 1, 1, 1, 1, 1,
-0.3174625, -0.4410329, -2.730873, 1, 1, 1, 1, 1,
-0.3154074, -1.544981, -2.783986, 1, 1, 1, 1, 1,
-0.3153951, -0.9839429, -4.633377, 1, 1, 1, 1, 1,
-0.3135991, 0.2369801, -1.401987, 1, 1, 1, 1, 1,
-0.3072668, 0.09282355, -1.558944, 1, 1, 1, 1, 1,
-0.3070914, 0.06866645, -1.392747, 1, 1, 1, 1, 1,
-0.3037156, -1.939122, -3.747731, 0, 0, 1, 1, 1,
-0.3012702, -0.9859069, -0.9782833, 1, 0, 0, 1, 1,
-0.30044, 0.3704805, 0.1144829, 1, 0, 0, 1, 1,
-0.2994377, 0.1788273, -2.075703, 1, 0, 0, 1, 1,
-0.2966168, -0.131052, -1.97824, 1, 0, 0, 1, 1,
-0.2907729, -1.91126, -1.373799, 1, 0, 0, 1, 1,
-0.2894653, -1.949562, -3.397516, 0, 0, 0, 1, 1,
-0.2890083, -0.4540279, -2.617692, 0, 0, 0, 1, 1,
-0.2889485, -1.495474, -2.704752, 0, 0, 0, 1, 1,
-0.2881655, 0.26874, 0.4109319, 0, 0, 0, 1, 1,
-0.2826323, 0.4235089, 0.285711, 0, 0, 0, 1, 1,
-0.2824471, -0.2429854, -4.103308, 0, 0, 0, 1, 1,
-0.2769926, 0.350682, 0.0421135, 0, 0, 0, 1, 1,
-0.2722033, 1.311253, -0.4744281, 1, 1, 1, 1, 1,
-0.2693329, -0.5425873, -2.101476, 1, 1, 1, 1, 1,
-0.2647198, 2.009951, -0.01102087, 1, 1, 1, 1, 1,
-0.2621509, 0.9400696, -0.9119864, 1, 1, 1, 1, 1,
-0.2611882, 1.058944, -0.0359006, 1, 1, 1, 1, 1,
-0.2574535, 1.00068, -0.4512109, 1, 1, 1, 1, 1,
-0.2550566, 0.201727, 0.286554, 1, 1, 1, 1, 1,
-0.2533875, -0.02295017, -0.5152936, 1, 1, 1, 1, 1,
-0.2520084, -0.3230464, -2.236923, 1, 1, 1, 1, 1,
-0.2498119, 1.133004, 0.1468375, 1, 1, 1, 1, 1,
-0.2462427, -1.479029, -2.72018, 1, 1, 1, 1, 1,
-0.2419092, 0.4955686, -0.4127816, 1, 1, 1, 1, 1,
-0.2417934, -1.14378, -3.83921, 1, 1, 1, 1, 1,
-0.2409303, -1.217428, -1.516844, 1, 1, 1, 1, 1,
-0.2402057, 0.1028042, 0.777478, 1, 1, 1, 1, 1,
-0.234516, -1.618249, -4.434938, 0, 0, 1, 1, 1,
-0.2318209, -0.4419753, -3.546934, 1, 0, 0, 1, 1,
-0.2311956, 0.512351, -0.9841864, 1, 0, 0, 1, 1,
-0.2292482, 0.008880676, -1.963886, 1, 0, 0, 1, 1,
-0.227245, -0.1276378, -1.957009, 1, 0, 0, 1, 1,
-0.2228603, -0.1428432, 0.2157588, 1, 0, 0, 1, 1,
-0.2201551, 0.08715387, -0.7600092, 0, 0, 0, 1, 1,
-0.219586, -2.87173, -3.692777, 0, 0, 0, 1, 1,
-0.2150611, -0.7049736, -3.87295, 0, 0, 0, 1, 1,
-0.2113072, -1.180128, -2.574317, 0, 0, 0, 1, 1,
-0.2109642, -0.4878962, -2.45718, 0, 0, 0, 1, 1,
-0.2080858, -1.427764, -2.591865, 0, 0, 0, 1, 1,
-0.2079065, -1.224848, -2.904817, 0, 0, 0, 1, 1,
-0.2059543, -0.7519547, -4.057207, 1, 1, 1, 1, 1,
-0.2058166, 0.3092481, -0.7014283, 1, 1, 1, 1, 1,
-0.1996059, -0.3754077, -0.614935, 1, 1, 1, 1, 1,
-0.1994405, 1.140392, -0.3045686, 1, 1, 1, 1, 1,
-0.1964016, -0.3923399, -2.877305, 1, 1, 1, 1, 1,
-0.1932906, -0.8074628, -2.604919, 1, 1, 1, 1, 1,
-0.1916866, -1.152079, -2.527496, 1, 1, 1, 1, 1,
-0.1913057, -0.4306698, -2.391087, 1, 1, 1, 1, 1,
-0.1904961, 0.5572233, -0.05069695, 1, 1, 1, 1, 1,
-0.1867664, -1.708492, -2.907515, 1, 1, 1, 1, 1,
-0.1839005, -0.3229051, -2.629106, 1, 1, 1, 1, 1,
-0.1785522, 0.04347694, -2.414966, 1, 1, 1, 1, 1,
-0.174137, -1.037855, -1.43585, 1, 1, 1, 1, 1,
-0.1715014, -0.3734658, -2.918329, 1, 1, 1, 1, 1,
-0.170332, 0.5013514, -0.09130467, 1, 1, 1, 1, 1,
-0.1654619, 0.7109274, 0.9079046, 0, 0, 1, 1, 1,
-0.1647441, -0.3228036, -1.901956, 1, 0, 0, 1, 1,
-0.1637835, -1.792292, -2.367876, 1, 0, 0, 1, 1,
-0.1635564, -0.01837957, 0.5848826, 1, 0, 0, 1, 1,
-0.1631654, -1.096479, -3.296875, 1, 0, 0, 1, 1,
-0.1611184, 0.8507559, 1.014791, 1, 0, 0, 1, 1,
-0.1605564, 0.5032747, 0.9726919, 0, 0, 0, 1, 1,
-0.1488818, -0.2604246, -2.083448, 0, 0, 0, 1, 1,
-0.1478155, -2.183091, -3.872263, 0, 0, 0, 1, 1,
-0.1468889, 1.363072, 0.9583377, 0, 0, 0, 1, 1,
-0.1454863, 2.013163, -0.9561662, 0, 0, 0, 1, 1,
-0.1443898, -0.8491433, -3.11656, 0, 0, 0, 1, 1,
-0.1432756, -1.088128, -1.676245, 0, 0, 0, 1, 1,
-0.1368957, -1.216667, -2.194688, 1, 1, 1, 1, 1,
-0.1361392, -1.361376, -0.6075549, 1, 1, 1, 1, 1,
-0.135239, -0.5868911, -2.451608, 1, 1, 1, 1, 1,
-0.1321598, 0.6300641, -0.939827, 1, 1, 1, 1, 1,
-0.1292911, -1.111934, -3.693971, 1, 1, 1, 1, 1,
-0.1273201, 0.2202819, -0.7046071, 1, 1, 1, 1, 1,
-0.1213636, -0.6872615, -3.046046, 1, 1, 1, 1, 1,
-0.1121566, -0.399542, -3.413122, 1, 1, 1, 1, 1,
-0.1105801, -1.54626, -2.717942, 1, 1, 1, 1, 1,
-0.1088744, 0.2051175, -0.6409118, 1, 1, 1, 1, 1,
-0.1029046, -1.666744, -3.454549, 1, 1, 1, 1, 1,
-0.1026644, 1.746085, 0.2999851, 1, 1, 1, 1, 1,
-0.1016319, -1.751819, -1.986593, 1, 1, 1, 1, 1,
-0.1008885, 1.212026, 0.5873249, 1, 1, 1, 1, 1,
-0.1006016, -0.3250587, -4.51688, 1, 1, 1, 1, 1,
-0.09557749, -0.7201015, -2.524712, 0, 0, 1, 1, 1,
-0.09402354, 0.3505313, -0.6109064, 1, 0, 0, 1, 1,
-0.09272942, 0.2393938, -0.8215813, 1, 0, 0, 1, 1,
-0.08821665, 1.241381, -1.604095, 1, 0, 0, 1, 1,
-0.08366743, -0.01042077, -0.9215575, 1, 0, 0, 1, 1,
-0.08338905, -0.3869308, -2.675452, 1, 0, 0, 1, 1,
-0.08041079, 0.1774811, 2.297662, 0, 0, 0, 1, 1,
-0.07764593, -1.253419, -1.638953, 0, 0, 0, 1, 1,
-0.07695731, 0.9381995, -0.1473612, 0, 0, 0, 1, 1,
-0.07359495, 0.005694658, -0.9753504, 0, 0, 0, 1, 1,
-0.07056852, 0.9637812, -0.4887125, 0, 0, 0, 1, 1,
-0.07011257, -1.342978, -3.201572, 0, 0, 0, 1, 1,
-0.06667703, 0.0384666, -0.9016916, 0, 0, 0, 1, 1,
-0.05789242, -1.613418, -3.49246, 1, 1, 1, 1, 1,
-0.05702481, -2.660531, -3.661973, 1, 1, 1, 1, 1,
-0.0503194, -2.0976, -2.271033, 1, 1, 1, 1, 1,
-0.04703892, 1.217159, -0.1654903, 1, 1, 1, 1, 1,
-0.0439316, -0.2583402, -2.672504, 1, 1, 1, 1, 1,
-0.04151244, 1.868656, 0.8932324, 1, 1, 1, 1, 1,
-0.04105385, -0.4092704, -1.839509, 1, 1, 1, 1, 1,
-0.03911024, 0.8870965, -0.5488321, 1, 1, 1, 1, 1,
-0.03734284, 1.230001, 0.8896993, 1, 1, 1, 1, 1,
-0.03289305, -0.02849384, -1.495018, 1, 1, 1, 1, 1,
-0.03253551, 0.9982421, -0.254002, 1, 1, 1, 1, 1,
-0.0290851, -2.198523, -1.744028, 1, 1, 1, 1, 1,
-0.02756119, 0.01611204, -2.507582, 1, 1, 1, 1, 1,
-0.02716983, 0.8502533, -0.02931826, 1, 1, 1, 1, 1,
-0.02694957, 1.040663, -0.07819457, 1, 1, 1, 1, 1,
-0.01523693, -0.8116785, -3.311586, 0, 0, 1, 1, 1,
-0.008368548, 0.9678124, 1.806729, 1, 0, 0, 1, 1,
-0.006127326, -1.211728, -2.654951, 1, 0, 0, 1, 1,
-0.003832953, -1.170389, -3.062276, 1, 0, 0, 1, 1,
-0.0002974648, -1.139332, -3.24351, 1, 0, 0, 1, 1,
0.0005259075, 0.7538236, -0.5735236, 1, 0, 0, 1, 1,
0.001632217, 0.2151012, 0.6361951, 0, 0, 0, 1, 1,
0.005723991, -0.01609299, 4.662663, 0, 0, 0, 1, 1,
0.009754785, -0.5868831, 3.501804, 0, 0, 0, 1, 1,
0.01105158, 0.6449025, 0.6148491, 0, 0, 0, 1, 1,
0.01106041, 0.4653806, -1.057575, 0, 0, 0, 1, 1,
0.01157611, -1.533163, 3.268365, 0, 0, 0, 1, 1,
0.01227413, -0.9337108, 2.59868, 0, 0, 0, 1, 1,
0.01323962, 1.422311, 1.684945, 1, 1, 1, 1, 1,
0.01408254, 0.7016577, -1.413486, 1, 1, 1, 1, 1,
0.01506202, -0.6088242, 3.17274, 1, 1, 1, 1, 1,
0.0152323, 2.23137, -0.6816058, 1, 1, 1, 1, 1,
0.01674264, 2.681418, -0.07257991, 1, 1, 1, 1, 1,
0.01936555, 1.78905, 0.2376502, 1, 1, 1, 1, 1,
0.02056926, 0.4402656, 0.9950299, 1, 1, 1, 1, 1,
0.02172595, -0.9472588, 4.40783, 1, 1, 1, 1, 1,
0.0220279, -1.520393, 4.479574, 1, 1, 1, 1, 1,
0.02204151, 0.04030864, 0.7942583, 1, 1, 1, 1, 1,
0.02275367, -0.6233348, 2.660543, 1, 1, 1, 1, 1,
0.02313863, -1.131091, 1.789493, 1, 1, 1, 1, 1,
0.02913925, -0.8625309, 3.125267, 1, 1, 1, 1, 1,
0.02978486, -0.5231016, 4.115625, 1, 1, 1, 1, 1,
0.03325837, -1.083303, 2.810589, 1, 1, 1, 1, 1,
0.03489937, 0.1565223, 1.928098, 0, 0, 1, 1, 1,
0.03586366, -0.6018422, 2.815947, 1, 0, 0, 1, 1,
0.0443145, -0.4540161, 2.151016, 1, 0, 0, 1, 1,
0.04802143, 0.1928009, -0.348031, 1, 0, 0, 1, 1,
0.05499543, -0.4031061, 3.858229, 1, 0, 0, 1, 1,
0.05892767, -0.7397724, 2.037119, 1, 0, 0, 1, 1,
0.05933502, 0.2288043, 1.556418, 0, 0, 0, 1, 1,
0.06040015, 0.5272732, 1.022268, 0, 0, 0, 1, 1,
0.06586175, 0.7476231, -0.3075577, 0, 0, 0, 1, 1,
0.06621144, 0.4524032, 2.095363, 0, 0, 0, 1, 1,
0.06745822, -1.616564, 2.652019, 0, 0, 0, 1, 1,
0.06819116, 0.2169099, 2.06684, 0, 0, 0, 1, 1,
0.06827899, 0.991931, -0.9671689, 0, 0, 0, 1, 1,
0.06912082, -0.3295318, 2.906984, 1, 1, 1, 1, 1,
0.06972633, -0.4478602, 2.077152, 1, 1, 1, 1, 1,
0.07141436, 0.5659682, 0.7020398, 1, 1, 1, 1, 1,
0.07198454, -0.4877143, 2.538807, 1, 1, 1, 1, 1,
0.07283601, -0.8967851, 2.864095, 1, 1, 1, 1, 1,
0.07485455, -0.6681635, 3.605828, 1, 1, 1, 1, 1,
0.07911319, -0.01231603, 3.597303, 1, 1, 1, 1, 1,
0.07981726, -0.7885396, 4.528335, 1, 1, 1, 1, 1,
0.08416922, 0.2144348, -0.05949299, 1, 1, 1, 1, 1,
0.08951672, 0.5445756, 0.5233712, 1, 1, 1, 1, 1,
0.09269341, 1.193383, -1.304381, 1, 1, 1, 1, 1,
0.09427742, 0.8916954, 0.7837355, 1, 1, 1, 1, 1,
0.09483527, 0.7037277, 1.930298, 1, 1, 1, 1, 1,
0.09664953, -0.567314, 3.718033, 1, 1, 1, 1, 1,
0.09782878, 0.08295058, 0.9236548, 1, 1, 1, 1, 1,
0.09941854, -1.614026, 2.882154, 0, 0, 1, 1, 1,
0.1041133, 0.9913477, 0.7001952, 1, 0, 0, 1, 1,
0.1062228, -0.2573668, 2.411773, 1, 0, 0, 1, 1,
0.1072991, 1.840388, -2.802913, 1, 0, 0, 1, 1,
0.11088, -0.07102002, 0.475526, 1, 0, 0, 1, 1,
0.1118933, 0.5796514, 0.8665267, 1, 0, 0, 1, 1,
0.1131895, 0.02548143, 1.775933, 0, 0, 0, 1, 1,
0.1133147, -0.4046408, 3.954591, 0, 0, 0, 1, 1,
0.1161555, 1.079141, -0.1366283, 0, 0, 0, 1, 1,
0.1172321, 1.771528, -0.2705364, 0, 0, 0, 1, 1,
0.1179783, 0.1909236, -1.122508, 0, 0, 0, 1, 1,
0.1223637, 0.02155325, 0.7938226, 0, 0, 0, 1, 1,
0.1231766, -0.03201223, 1.484612, 0, 0, 0, 1, 1,
0.125943, -1.593897, 2.570005, 1, 1, 1, 1, 1,
0.1298993, 0.3226402, -0.3810798, 1, 1, 1, 1, 1,
0.1318496, 0.8073401, 0.4025741, 1, 1, 1, 1, 1,
0.135795, -1.174808, 1.199297, 1, 1, 1, 1, 1,
0.1378239, 0.5611013, -0.218974, 1, 1, 1, 1, 1,
0.1400516, 0.3303223, 0.2015724, 1, 1, 1, 1, 1,
0.1413974, 1.793724, -0.5507926, 1, 1, 1, 1, 1,
0.1452018, -1.305745, 3.239473, 1, 1, 1, 1, 1,
0.145964, -1.192558, 1.90877, 1, 1, 1, 1, 1,
0.1497127, -0.3569077, 2.603977, 1, 1, 1, 1, 1,
0.1517888, -0.1190435, 3.834487, 1, 1, 1, 1, 1,
0.1535298, 0.9334881, 0.5656167, 1, 1, 1, 1, 1,
0.1542875, -1.627018, 3.038325, 1, 1, 1, 1, 1,
0.156427, 0.7854152, -0.6121571, 1, 1, 1, 1, 1,
0.1566319, -1.718801, 2.380415, 1, 1, 1, 1, 1,
0.1594208, -0.1473274, 2.998417, 0, 0, 1, 1, 1,
0.1607155, -0.7813061, 4.074545, 1, 0, 0, 1, 1,
0.1684152, -1.757656, 2.582417, 1, 0, 0, 1, 1,
0.1764279, -0.4727692, 3.567952, 1, 0, 0, 1, 1,
0.1780726, 1.983767, -1.56275, 1, 0, 0, 1, 1,
0.1811909, -0.778927, 2.323494, 1, 0, 0, 1, 1,
0.1814816, 0.1859785, 1.597865, 0, 0, 0, 1, 1,
0.186335, -0.2055633, 1.354375, 0, 0, 0, 1, 1,
0.1886182, -0.07871953, 4.208779, 0, 0, 0, 1, 1,
0.1899705, 0.8671345, 0.9122097, 0, 0, 0, 1, 1,
0.1948744, -0.04733768, -0.5288065, 0, 0, 0, 1, 1,
0.1993032, -0.847266, 2.290697, 0, 0, 0, 1, 1,
0.2009914, -1.303984, 3.29091, 0, 0, 0, 1, 1,
0.2046672, -1.405683, 1.901685, 1, 1, 1, 1, 1,
0.2074078, -0.9008301, 5.369172, 1, 1, 1, 1, 1,
0.2106515, 0.7516069, 0.7377171, 1, 1, 1, 1, 1,
0.2112366, 1.261381, -0.001428251, 1, 1, 1, 1, 1,
0.2130899, -1.02388, 4.375256, 1, 1, 1, 1, 1,
0.2132571, -0.3984597, 2.812811, 1, 1, 1, 1, 1,
0.2165609, 0.1511101, 1.137432, 1, 1, 1, 1, 1,
0.2207371, 1.556888, -1.354204, 1, 1, 1, 1, 1,
0.2292294, 1.653773, -0.1190492, 1, 1, 1, 1, 1,
0.2298323, 1.361771, 1.85264, 1, 1, 1, 1, 1,
0.230356, -1.039846, 2.665219, 1, 1, 1, 1, 1,
0.2308732, -0.1840815, 1.485134, 1, 1, 1, 1, 1,
0.2323713, -0.2894398, 3.587918, 1, 1, 1, 1, 1,
0.2371143, -0.05610813, 2.805553, 1, 1, 1, 1, 1,
0.2381452, 1.59956, -0.5045136, 1, 1, 1, 1, 1,
0.2412578, 0.2438971, 0.4667391, 0, 0, 1, 1, 1,
0.2416295, 1.099171, -0.2391177, 1, 0, 0, 1, 1,
0.2428865, 0.2125024, 1.699515, 1, 0, 0, 1, 1,
0.2435751, -0.05223253, 1.477312, 1, 0, 0, 1, 1,
0.2454401, -0.278848, 1.011809, 1, 0, 0, 1, 1,
0.2549089, 0.2272492, 1.840446, 1, 0, 0, 1, 1,
0.2612425, 0.664561, -1.180252, 0, 0, 0, 1, 1,
0.265325, 0.05381417, -0.0006265275, 0, 0, 0, 1, 1,
0.2655143, 1.982193, -0.8016487, 0, 0, 0, 1, 1,
0.2656325, 1.577924, -0.2874504, 0, 0, 0, 1, 1,
0.2659772, -0.8680829, 3.372316, 0, 0, 0, 1, 1,
0.2671027, -1.441453, 3.137582, 0, 0, 0, 1, 1,
0.2684986, -0.1749923, 2.131359, 0, 0, 0, 1, 1,
0.2685311, -0.38936, 2.099558, 1, 1, 1, 1, 1,
0.2688908, -1.712846, 0.8617002, 1, 1, 1, 1, 1,
0.273194, -0.8565629, 1.700303, 1, 1, 1, 1, 1,
0.2739568, -0.5196252, 3.954099, 1, 1, 1, 1, 1,
0.2765534, 0.6842538, 1.217297, 1, 1, 1, 1, 1,
0.2767209, -0.6784004, 4.041357, 1, 1, 1, 1, 1,
0.2828188, 0.2154939, 0.8800367, 1, 1, 1, 1, 1,
0.2866208, -2.924416, 0.9961038, 1, 1, 1, 1, 1,
0.2875224, -0.6047425, 2.380592, 1, 1, 1, 1, 1,
0.2895659, 0.3601762, 0.6859019, 1, 1, 1, 1, 1,
0.293414, 0.3407751, 1.621909, 1, 1, 1, 1, 1,
0.2957608, 0.1039929, -0.07390082, 1, 1, 1, 1, 1,
0.297333, -0.5536522, 2.056218, 1, 1, 1, 1, 1,
0.2976487, 2.268982, -0.6601129, 1, 1, 1, 1, 1,
0.2984012, 0.8668008, 0.8505059, 1, 1, 1, 1, 1,
0.2992781, 0.6955596, 0.5094944, 0, 0, 1, 1, 1,
0.3012338, 1.0427, -1.138374, 1, 0, 0, 1, 1,
0.3067099, -1.789833, 1.484952, 1, 0, 0, 1, 1,
0.307002, 0.8781502, 0.1809312, 1, 0, 0, 1, 1,
0.3153053, -1.693734, 3.085244, 1, 0, 0, 1, 1,
0.3181867, -0.1734774, 1.923855, 1, 0, 0, 1, 1,
0.3223655, 0.7399018, 3.05895, 0, 0, 0, 1, 1,
0.3234815, 0.6010777, -0.7162129, 0, 0, 0, 1, 1,
0.3237342, -1.255385, 2.573399, 0, 0, 0, 1, 1,
0.3252995, 2.331116, 1.130459, 0, 0, 0, 1, 1,
0.3306405, -0.1609346, 2.802806, 0, 0, 0, 1, 1,
0.3366608, -0.815244, 2.600593, 0, 0, 0, 1, 1,
0.3370918, -1.029091, 3.341238, 0, 0, 0, 1, 1,
0.3375282, 0.6899407, -0.04914041, 1, 1, 1, 1, 1,
0.3413614, 2.260881, -0.7511309, 1, 1, 1, 1, 1,
0.3425691, -0.07124534, 2.727572, 1, 1, 1, 1, 1,
0.3434929, 1.55386, -1.763852, 1, 1, 1, 1, 1,
0.3469296, 0.4313736, 0.3330989, 1, 1, 1, 1, 1,
0.3476821, -1.498613, 3.617059, 1, 1, 1, 1, 1,
0.3513283, -0.3928454, 1.484025, 1, 1, 1, 1, 1,
0.351938, -1.29352, 2.758013, 1, 1, 1, 1, 1,
0.3565881, -2.404234, 1.806456, 1, 1, 1, 1, 1,
0.3571957, -0.2006775, 1.229723, 1, 1, 1, 1, 1,
0.3619852, -1.17812, 1.925686, 1, 1, 1, 1, 1,
0.3621949, 1.183101, -0.09883971, 1, 1, 1, 1, 1,
0.3637402, 0.3975346, 1.57861, 1, 1, 1, 1, 1,
0.3651805, -0.06478609, 2.477188, 1, 1, 1, 1, 1,
0.3662239, -0.03844555, 2.147685, 1, 1, 1, 1, 1,
0.3669216, 0.4979415, 0.8889893, 0, 0, 1, 1, 1,
0.3675303, -0.7446215, 4.716403, 1, 0, 0, 1, 1,
0.376112, 0.2991683, 0.990824, 1, 0, 0, 1, 1,
0.3767716, -0.3338526, 1.716312, 1, 0, 0, 1, 1,
0.3769338, -0.7146022, 3.565018, 1, 0, 0, 1, 1,
0.3828059, -0.4306083, 3.634726, 1, 0, 0, 1, 1,
0.3941743, -0.4335439, 3.647212, 0, 0, 0, 1, 1,
0.3947576, -1.052307, 1.72265, 0, 0, 0, 1, 1,
0.3966415, 1.001204, 1.192363, 0, 0, 0, 1, 1,
0.4018261, 0.3703241, 0.4257706, 0, 0, 0, 1, 1,
0.4041825, -0.5770331, 2.487839, 0, 0, 0, 1, 1,
0.4060334, -0.2172235, 3.136856, 0, 0, 0, 1, 1,
0.415447, -0.4028322, 2.803957, 0, 0, 0, 1, 1,
0.4188429, 2.328887, 0.9260877, 1, 1, 1, 1, 1,
0.4314593, 0.08563079, -0.5800912, 1, 1, 1, 1, 1,
0.4378268, 0.4007062, 1.527916, 1, 1, 1, 1, 1,
0.4402279, 0.7599093, -1.123199, 1, 1, 1, 1, 1,
0.4443733, 0.6831722, 1.4028, 1, 1, 1, 1, 1,
0.4468001, 0.9535614, 0.01120751, 1, 1, 1, 1, 1,
0.4489624, 0.7821679, 1.276183, 1, 1, 1, 1, 1,
0.4512247, 1.648195, 0.6491627, 1, 1, 1, 1, 1,
0.4512543, 0.5580623, 0.6882924, 1, 1, 1, 1, 1,
0.4519218, 0.2628344, 0.2259665, 1, 1, 1, 1, 1,
0.4536267, 0.2289043, 2.322108, 1, 1, 1, 1, 1,
0.4596313, 0.2939838, 1.154735, 1, 1, 1, 1, 1,
0.4604639, -0.143381, 0.9177924, 1, 1, 1, 1, 1,
0.4618223, 1.187767, 0.2444593, 1, 1, 1, 1, 1,
0.4649496, -0.7358682, 2.061951, 1, 1, 1, 1, 1,
0.4707371, -1.174408, 3.007299, 0, 0, 1, 1, 1,
0.4717525, -0.2687583, 2.294928, 1, 0, 0, 1, 1,
0.4769365, -0.09610759, 1.768649, 1, 0, 0, 1, 1,
0.481917, -0.5623083, 0.650865, 1, 0, 0, 1, 1,
0.48728, 1.699318, 1.33918, 1, 0, 0, 1, 1,
0.4891053, -0.1831986, 2.448014, 1, 0, 0, 1, 1,
0.492572, -1.345219, 2.471904, 0, 0, 0, 1, 1,
0.4942317, 1.196009, 0.646028, 0, 0, 0, 1, 1,
0.4949073, -2.114233, 1.981956, 0, 0, 0, 1, 1,
0.4967577, 0.8501369, 1.128689, 0, 0, 0, 1, 1,
0.4978042, 2.376509, 1.529917, 0, 0, 0, 1, 1,
0.5038575, -0.9258777, 2.797691, 0, 0, 0, 1, 1,
0.5042344, 2.008499, 0.7347012, 0, 0, 0, 1, 1,
0.5096156, -0.3328595, 1.60957, 1, 1, 1, 1, 1,
0.5113906, -1.005935, 2.038455, 1, 1, 1, 1, 1,
0.5123164, 0.02343515, 0.1264334, 1, 1, 1, 1, 1,
0.51673, -1.21546, 2.785353, 1, 1, 1, 1, 1,
0.5319389, -0.1008373, 2.225905, 1, 1, 1, 1, 1,
0.5328481, 0.3202899, -0.1489694, 1, 1, 1, 1, 1,
0.5383267, -1.450788, 2.161919, 1, 1, 1, 1, 1,
0.5414347, -2.238172, 2.498662, 1, 1, 1, 1, 1,
0.5424904, 0.1164433, 0.738756, 1, 1, 1, 1, 1,
0.5426679, -1.663498, 3.228738, 1, 1, 1, 1, 1,
0.5434924, 0.1897848, 2.102781, 1, 1, 1, 1, 1,
0.5446094, 2.166138, 0.5689692, 1, 1, 1, 1, 1,
0.5481122, 0.5641165, 0.7350804, 1, 1, 1, 1, 1,
0.5487477, 0.8489069, -1.430918, 1, 1, 1, 1, 1,
0.5520409, -1.970417, 4.615003, 1, 1, 1, 1, 1,
0.5555842, -1.113663, 3.363477, 0, 0, 1, 1, 1,
0.5575069, -2.328907, 1.910119, 1, 0, 0, 1, 1,
0.5600812, -0.595036, 5.342744, 1, 0, 0, 1, 1,
0.5609357, -0.5524724, 3.263209, 1, 0, 0, 1, 1,
0.5634855, 0.6384033, 0.4324371, 1, 0, 0, 1, 1,
0.5640951, -2.889255, 3.140515, 1, 0, 0, 1, 1,
0.5753556, -0.8607921, 1.17877, 0, 0, 0, 1, 1,
0.5784487, -0.6353019, 2.185576, 0, 0, 0, 1, 1,
0.5822768, 0.5856466, 0.9248818, 0, 0, 0, 1, 1,
0.584132, 0.7277567, -0.6289555, 0, 0, 0, 1, 1,
0.5867769, -0.2387879, 3.094506, 0, 0, 0, 1, 1,
0.5922268, 0.574895, 0.5982072, 0, 0, 0, 1, 1,
0.5981963, 0.7380364, 1.270163, 0, 0, 0, 1, 1,
0.6063698, 0.2539388, 4.193156, 1, 1, 1, 1, 1,
0.6108037, 0.5187059, 1.178418, 1, 1, 1, 1, 1,
0.6138992, -0.5149465, 1.786981, 1, 1, 1, 1, 1,
0.6159729, -1.046762, 2.75367, 1, 1, 1, 1, 1,
0.6170727, 1.864638, -0.3481898, 1, 1, 1, 1, 1,
0.6215552, -0.1336112, 3.653463, 1, 1, 1, 1, 1,
0.6241857, 0.9007421, -1.107741, 1, 1, 1, 1, 1,
0.6250634, 0.8189662, 2.783601, 1, 1, 1, 1, 1,
0.6302969, 1.003376, -0.6854835, 1, 1, 1, 1, 1,
0.6331489, -0.2513126, 0.1908112, 1, 1, 1, 1, 1,
0.6382514, 0.9241439, -0.5161139, 1, 1, 1, 1, 1,
0.6441848, 0.1286178, -0.00909578, 1, 1, 1, 1, 1,
0.6457946, -0.1978182, 2.709527, 1, 1, 1, 1, 1,
0.6576218, -1.859102, 2.956767, 1, 1, 1, 1, 1,
0.6641996, 0.149502, 0.5418321, 1, 1, 1, 1, 1,
0.6660918, -0.4824176, 3.206631, 0, 0, 1, 1, 1,
0.6670321, 0.5866912, 0.9103166, 1, 0, 0, 1, 1,
0.6686664, -0.3090863, 1.311193, 1, 0, 0, 1, 1,
0.6725637, 0.9633299, -0.6741838, 1, 0, 0, 1, 1,
0.6744906, 1.07636, 1.684136, 1, 0, 0, 1, 1,
0.6788451, -0.4459018, 2.276502, 1, 0, 0, 1, 1,
0.6795154, 1.355427, -0.216869, 0, 0, 0, 1, 1,
0.6812074, 0.5189723, 0.6988291, 0, 0, 0, 1, 1,
0.6827967, 1.343139, 0.3309246, 0, 0, 0, 1, 1,
0.6917147, -0.4724423, 3.107027, 0, 0, 0, 1, 1,
0.6981483, 0.6568726, 2.618253, 0, 0, 0, 1, 1,
0.7007802, 0.07236118, 1.247908, 0, 0, 0, 1, 1,
0.7013193, -0.748143, 2.867095, 0, 0, 0, 1, 1,
0.7121128, -1.067381, 3.398889, 1, 1, 1, 1, 1,
0.7174211, -0.2041197, 1.902258, 1, 1, 1, 1, 1,
0.7247011, 0.8409415, 1.026775, 1, 1, 1, 1, 1,
0.7256782, 0.3695571, 0.8956091, 1, 1, 1, 1, 1,
0.7272793, 0.8215966, 2.666675, 1, 1, 1, 1, 1,
0.7296281, 0.9660889, 0.9788818, 1, 1, 1, 1, 1,
0.7317697, -0.4967228, 0.9775526, 1, 1, 1, 1, 1,
0.7353722, 0.8640082, -1.896784, 1, 1, 1, 1, 1,
0.7374978, -0.3922994, 1.208331, 1, 1, 1, 1, 1,
0.7379591, 2.041299, 1.322948, 1, 1, 1, 1, 1,
0.7381401, 0.3362956, 2.318008, 1, 1, 1, 1, 1,
0.7403714, 0.6521899, -0.7110539, 1, 1, 1, 1, 1,
0.7431284, -0.9563161, 3.198455, 1, 1, 1, 1, 1,
0.7506282, 0.4655081, 2.005474, 1, 1, 1, 1, 1,
0.7530356, 0.008850414, 0.4083191, 1, 1, 1, 1, 1,
0.7534276, 1.311844, -0.05760547, 0, 0, 1, 1, 1,
0.7557409, 0.7501118, 0.0793701, 1, 0, 0, 1, 1,
0.7607924, -0.7897142, 3.827375, 1, 0, 0, 1, 1,
0.7706738, -0.3931037, 0.8478745, 1, 0, 0, 1, 1,
0.7720869, -1.955943, 2.792803, 1, 0, 0, 1, 1,
0.7779783, -0.06956249, 2.064319, 1, 0, 0, 1, 1,
0.7784266, 0.2544485, 1.111957, 0, 0, 0, 1, 1,
0.7818638, 3.263657, 0.08146609, 0, 0, 0, 1, 1,
0.7826988, 0.8830042, 2.918931, 0, 0, 0, 1, 1,
0.7883566, 0.4307737, 1.29948, 0, 0, 0, 1, 1,
0.7998295, -1.513516, 2.027162, 0, 0, 0, 1, 1,
0.809599, 0.1437576, 0.5124045, 0, 0, 0, 1, 1,
0.8143368, -0.1369828, 2.886051, 0, 0, 0, 1, 1,
0.8195809, -0.2162402, 1.64064, 1, 1, 1, 1, 1,
0.8265024, -0.7088797, 1.393291, 1, 1, 1, 1, 1,
0.8271599, -0.09987598, 1.803271, 1, 1, 1, 1, 1,
0.8343219, -0.522464, 2.09673, 1, 1, 1, 1, 1,
0.8357456, 1.227298, 0.5896494, 1, 1, 1, 1, 1,
0.8404307, 0.3041241, 0.1690475, 1, 1, 1, 1, 1,
0.8420553, -1.522657, 1.565909, 1, 1, 1, 1, 1,
0.8430007, -0.4688343, 2.439269, 1, 1, 1, 1, 1,
0.8514711, 0.7982022, 1.306122, 1, 1, 1, 1, 1,
0.8552756, 0.3933238, 2.446962, 1, 1, 1, 1, 1,
0.8565192, 0.2005267, 1.148394, 1, 1, 1, 1, 1,
0.8672065, 0.8527882, -0.8638161, 1, 1, 1, 1, 1,
0.8692573, 0.3663666, -0.4754523, 1, 1, 1, 1, 1,
0.8715398, 0.9787241, 0.7430325, 1, 1, 1, 1, 1,
0.8775413, 0.655421, -0.3876389, 1, 1, 1, 1, 1,
0.8777169, -1.252513, 3.850068, 0, 0, 1, 1, 1,
0.8803833, 0.5728554, -0.5101288, 1, 0, 0, 1, 1,
0.8885502, 0.23253, 1.276878, 1, 0, 0, 1, 1,
0.8984992, -2.061011, 3.288875, 1, 0, 0, 1, 1,
0.8999537, -0.9204998, 4.303318, 1, 0, 0, 1, 1,
0.9010472, -1.484215, 1.361599, 1, 0, 0, 1, 1,
0.9024524, -0.8883868, 1.12429, 0, 0, 0, 1, 1,
0.9027864, 1.456402, 2.116219, 0, 0, 0, 1, 1,
0.9172349, -0.03353982, 2.318757, 0, 0, 0, 1, 1,
0.919818, 0.3178679, 1.970549, 0, 0, 0, 1, 1,
0.9226406, -0.5943902, 3.793315, 0, 0, 0, 1, 1,
0.9236588, 2.556132, 0.1547937, 0, 0, 0, 1, 1,
0.9267004, -0.458658, 1.157454, 0, 0, 0, 1, 1,
0.9314545, 0.8418879, 1.632581, 1, 1, 1, 1, 1,
0.9333814, -0.8921754, 1.707335, 1, 1, 1, 1, 1,
0.9334568, -0.7585451, 1.538677, 1, 1, 1, 1, 1,
0.9487396, 0.1784305, 2.377187, 1, 1, 1, 1, 1,
0.9491109, -0.9373135, 1.5018, 1, 1, 1, 1, 1,
0.9543883, -0.2249262, 0.9270487, 1, 1, 1, 1, 1,
0.9585177, 1.030875, 0.508808, 1, 1, 1, 1, 1,
0.9612194, -1.077978, 1.52495, 1, 1, 1, 1, 1,
0.9633397, -0.3905879, 1.410312, 1, 1, 1, 1, 1,
0.9763783, 0.2214123, 0.4553885, 1, 1, 1, 1, 1,
0.9773439, 1.155687, 0.6756084, 1, 1, 1, 1, 1,
0.9918065, -0.788288, 1.999663, 1, 1, 1, 1, 1,
0.9932372, 1.615525, 0.265684, 1, 1, 1, 1, 1,
0.9956273, 1.23446, 1.641111, 1, 1, 1, 1, 1,
0.9984698, -0.3585006, 3.089283, 1, 1, 1, 1, 1,
1.000414, 0.9189863, -0.3562133, 0, 0, 1, 1, 1,
1.007391, -0.965466, 4.200175, 1, 0, 0, 1, 1,
1.01293, 0.4713277, 0.276919, 1, 0, 0, 1, 1,
1.018912, 0.6994988, 0.2221524, 1, 0, 0, 1, 1,
1.032774, -1.42363, 3.342069, 1, 0, 0, 1, 1,
1.036942, -1.49961, 2.762351, 1, 0, 0, 1, 1,
1.050412, -0.2133212, 1.228332, 0, 0, 0, 1, 1,
1.06142, -0.4462474, 0.5871078, 0, 0, 0, 1, 1,
1.064981, 1.434, -0.3842702, 0, 0, 0, 1, 1,
1.065004, 0.1039436, 1.45566, 0, 0, 0, 1, 1,
1.070698, -1.07388, 0.8038392, 0, 0, 0, 1, 1,
1.07118, 0.6013253, 1.49925, 0, 0, 0, 1, 1,
1.071194, -1.523495, 4.467561, 0, 0, 0, 1, 1,
1.078075, 1.549331, 0.2857771, 1, 1, 1, 1, 1,
1.08005, -0.4571588, 2.531207, 1, 1, 1, 1, 1,
1.09006, -0.5961517, 2.997046, 1, 1, 1, 1, 1,
1.091374, 1.256385, 0.7967308, 1, 1, 1, 1, 1,
1.092671, 0.8669299, 0.4863794, 1, 1, 1, 1, 1,
1.109965, -0.7384521, 1.93566, 1, 1, 1, 1, 1,
1.132372, 0.7095522, 0.9839866, 1, 1, 1, 1, 1,
1.148384, 1.016723, 1.307567, 1, 1, 1, 1, 1,
1.148992, 1.168535, 0.9970834, 1, 1, 1, 1, 1,
1.153618, 0.516749, 0.8478289, 1, 1, 1, 1, 1,
1.155466, 0.1212111, 2.007222, 1, 1, 1, 1, 1,
1.155477, -0.8985779, 3.557574, 1, 1, 1, 1, 1,
1.166342, 0.9622311, 0.1100989, 1, 1, 1, 1, 1,
1.181283, 0.09093156, 0.706958, 1, 1, 1, 1, 1,
1.185258, -1.832584, 1.385183, 1, 1, 1, 1, 1,
1.191594, 1.856936, 2.657527, 0, 0, 1, 1, 1,
1.198801, 0.9774959, 1.611629, 1, 0, 0, 1, 1,
1.202365, 0.08414741, 1.390372, 1, 0, 0, 1, 1,
1.206123, 0.6929367, 0.6151308, 1, 0, 0, 1, 1,
1.209415, 0.05480443, 0.9811499, 1, 0, 0, 1, 1,
1.20984, 0.469119, 1.202225, 1, 0, 0, 1, 1,
1.211974, -1.132847, 3.270938, 0, 0, 0, 1, 1,
1.214555, -0.4537552, 1.306727, 0, 0, 0, 1, 1,
1.218825, -0.2912449, 2.916035, 0, 0, 0, 1, 1,
1.228062, 1.691883, 0.6603712, 0, 0, 0, 1, 1,
1.23014, -0.5262854, 1.737413, 0, 0, 0, 1, 1,
1.234114, 0.9671116, 0.9999292, 0, 0, 0, 1, 1,
1.235293, 0.4314233, 0.7603405, 0, 0, 0, 1, 1,
1.243622, -1.645195, 3.399665, 1, 1, 1, 1, 1,
1.247608, -0.3958537, 1.657654, 1, 1, 1, 1, 1,
1.251414, -0.09139911, 1.495831, 1, 1, 1, 1, 1,
1.255889, 0.5122297, 0.8640397, 1, 1, 1, 1, 1,
1.25992, 0.6751819, 0.9208639, 1, 1, 1, 1, 1,
1.265548, 0.7532977, 0.4626404, 1, 1, 1, 1, 1,
1.267388, -1.195422, 2.713679, 1, 1, 1, 1, 1,
1.282168, -1.364242, 4.384511, 1, 1, 1, 1, 1,
1.285425, -1.83802, 2.509807, 1, 1, 1, 1, 1,
1.285704, -0.0887148, 3.541282, 1, 1, 1, 1, 1,
1.292338, -0.5913616, 3.356932, 1, 1, 1, 1, 1,
1.301335, -0.345992, 0.8344696, 1, 1, 1, 1, 1,
1.303237, 1.603073, 0.280399, 1, 1, 1, 1, 1,
1.316505, 1.096646, -0.6766686, 1, 1, 1, 1, 1,
1.326121, -1.468437, 2.365614, 1, 1, 1, 1, 1,
1.338147, -0.08360049, 1.675348, 0, 0, 1, 1, 1,
1.340172, -0.3650371, 1.027368, 1, 0, 0, 1, 1,
1.347473, 0.3108222, 0.4512279, 1, 0, 0, 1, 1,
1.355749, -0.5603148, 1.952475, 1, 0, 0, 1, 1,
1.370186, -0.1848877, -0.2398224, 1, 0, 0, 1, 1,
1.370851, 0.7106404, -0.2242541, 1, 0, 0, 1, 1,
1.374021, -1.205506, 3.34664, 0, 0, 0, 1, 1,
1.375306, 0.3148387, 0.9043837, 0, 0, 0, 1, 1,
1.381865, -0.2729245, 1.727453, 0, 0, 0, 1, 1,
1.403012, 0.6604034, 0.7453941, 0, 0, 0, 1, 1,
1.405988, -0.3743006, 2.65784, 0, 0, 0, 1, 1,
1.416598, -0.1224402, 2.810005, 0, 0, 0, 1, 1,
1.418648, 0.3683215, 0.9587111, 0, 0, 0, 1, 1,
1.419793, 0.1513608, 0.8478656, 1, 1, 1, 1, 1,
1.421922, -0.3402428, 2.848298, 1, 1, 1, 1, 1,
1.424531, -0.4323162, 1.320771, 1, 1, 1, 1, 1,
1.426513, 0.7347939, 1.31967, 1, 1, 1, 1, 1,
1.431143, -0.402079, 1.594939, 1, 1, 1, 1, 1,
1.445432, 1.232091, 1.218756, 1, 1, 1, 1, 1,
1.47305, -0.05883631, 0.5508169, 1, 1, 1, 1, 1,
1.475314, 0.9097284, 0.8663782, 1, 1, 1, 1, 1,
1.476287, 0.2608386, 0.6538602, 1, 1, 1, 1, 1,
1.479432, 0.175237, 1.04984, 1, 1, 1, 1, 1,
1.486074, -0.3203668, 1.569303, 1, 1, 1, 1, 1,
1.489727, 1.202593, 3.113218, 1, 1, 1, 1, 1,
1.502246, 0.5733846, 0.5279379, 1, 1, 1, 1, 1,
1.502327, -1.10593, 4.023223, 1, 1, 1, 1, 1,
1.503627, 0.889852, -0.2665963, 1, 1, 1, 1, 1,
1.515355, 0.2011383, 2.572776, 0, 0, 1, 1, 1,
1.518091, 1.150941, 0.3666525, 1, 0, 0, 1, 1,
1.52034, 0.8571022, 3.035595, 1, 0, 0, 1, 1,
1.52099, -0.3412937, 2.456836, 1, 0, 0, 1, 1,
1.5223, -0.03683903, 0.7271157, 1, 0, 0, 1, 1,
1.540681, -2.080047, 3.167425, 1, 0, 0, 1, 1,
1.545168, -0.1794072, 4.06339, 0, 0, 0, 1, 1,
1.552553, -0.5673479, 0.5422461, 0, 0, 0, 1, 1,
1.557162, -0.1029131, 1.118301, 0, 0, 0, 1, 1,
1.558268, 1.5524, 1.176861, 0, 0, 0, 1, 1,
1.568092, 1.196428, 1.632836, 0, 0, 0, 1, 1,
1.57982, 0.4144495, 0.1048851, 0, 0, 0, 1, 1,
1.582343, -1.223941, 2.105331, 0, 0, 0, 1, 1,
1.590459, 0.6254016, 1.935541, 1, 1, 1, 1, 1,
1.60053, 1.083461, 1.583543, 1, 1, 1, 1, 1,
1.608733, -0.3980769, -1.020083, 1, 1, 1, 1, 1,
1.632296, -1.17066, 3.503555, 1, 1, 1, 1, 1,
1.633598, -0.4220565, 2.684626, 1, 1, 1, 1, 1,
1.637909, -1.480154, 1.308518, 1, 1, 1, 1, 1,
1.653496, 0.3192309, 1.140994, 1, 1, 1, 1, 1,
1.656853, 0.7010639, 0.9050571, 1, 1, 1, 1, 1,
1.677626, -0.06328399, 1.158482, 1, 1, 1, 1, 1,
1.681226, 1.212753, 1.068573, 1, 1, 1, 1, 1,
1.694938, -0.7516038, 2.232575, 1, 1, 1, 1, 1,
1.710497, 0.3760779, 0.9664214, 1, 1, 1, 1, 1,
1.738824, -0.4903414, 3.193046, 1, 1, 1, 1, 1,
1.744143, -0.2979488, 1.294507, 1, 1, 1, 1, 1,
1.74856, -0.6024128, 1.179333, 1, 1, 1, 1, 1,
1.752262, 1.065083, -0.9099996, 0, 0, 1, 1, 1,
1.771382, 0.5298921, 2.517145, 1, 0, 0, 1, 1,
1.774315, 0.468756, 1.029621, 1, 0, 0, 1, 1,
1.799348, 1.683664, 1.588922, 1, 0, 0, 1, 1,
1.806956, 1.291867, -0.1566664, 1, 0, 0, 1, 1,
1.81093, -1.001257, 1.773365, 1, 0, 0, 1, 1,
1.824479, 0.1790982, 2.63537, 0, 0, 0, 1, 1,
1.828773, 0.2067991, 0.7095887, 0, 0, 0, 1, 1,
1.871053, 1.226987, 1.141494, 0, 0, 0, 1, 1,
1.878874, 1.197544, 1.114396, 0, 0, 0, 1, 1,
1.891135, -0.6078633, 1.943857, 0, 0, 0, 1, 1,
1.897234, 1.124465, 0.5400912, 0, 0, 0, 1, 1,
1.897481, -1.630397, 1.136097, 0, 0, 0, 1, 1,
1.899596, -0.0892617, 0.3101309, 1, 1, 1, 1, 1,
1.905707, -0.9089898, 0.492321, 1, 1, 1, 1, 1,
1.911422, 1.000033, 1.683184, 1, 1, 1, 1, 1,
1.914422, 0.6187894, 1.174817, 1, 1, 1, 1, 1,
1.92247, -0.0398717, 3.267396, 1, 1, 1, 1, 1,
1.932311, -0.6675104, 1.338957, 1, 1, 1, 1, 1,
1.964355, 0.5864937, 1.378551, 1, 1, 1, 1, 1,
1.992562, -1.164942, 2.301328, 1, 1, 1, 1, 1,
1.993086, -1.216377, 1.452932, 1, 1, 1, 1, 1,
2.002797, -0.7389714, 2.343467, 1, 1, 1, 1, 1,
2.042201, 0.2354576, 2.192102, 1, 1, 1, 1, 1,
2.046138, -1.098705, 0.4391628, 1, 1, 1, 1, 1,
2.050283, -0.0243388, 1.409314, 1, 1, 1, 1, 1,
2.166395, 1.003399, 0.546489, 1, 1, 1, 1, 1,
2.183121, -1.223951, 2.999654, 1, 1, 1, 1, 1,
2.195113, 0.6837516, 2.174903, 0, 0, 1, 1, 1,
2.200175, 0.8322592, 1.962657, 1, 0, 0, 1, 1,
2.217865, 0.9212124, -0.1296207, 1, 0, 0, 1, 1,
2.224847, 1.550802, -0.6787732, 1, 0, 0, 1, 1,
2.271881, 2.000238, 0.2026386, 1, 0, 0, 1, 1,
2.286945, 1.201104, 1.1375, 1, 0, 0, 1, 1,
2.297262, 0.02440629, 2.364224, 0, 0, 0, 1, 1,
2.301364, -0.285392, 1.821429, 0, 0, 0, 1, 1,
2.346329, -1.089557, 4.192355, 0, 0, 0, 1, 1,
2.356551, -0.5637426, 2.81043, 0, 0, 0, 1, 1,
2.360675, -0.6318845, 2.905539, 0, 0, 0, 1, 1,
2.387368, 0.6486612, 3.178416, 0, 0, 0, 1, 1,
2.477563, 0.2212224, 2.134035, 0, 0, 0, 1, 1,
2.498875, 0.6557078, 2.832272, 1, 1, 1, 1, 1,
2.577601, 0.5753015, 0.9449001, 1, 1, 1, 1, 1,
2.605282, 0.0183002, 0.7722421, 1, 1, 1, 1, 1,
2.615599, 0.9048992, 2.144576, 1, 1, 1, 1, 1,
2.637069, -0.908398, 1.894774, 1, 1, 1, 1, 1,
2.735886, -0.7860867, 1.862581, 1, 1, 1, 1, 1,
2.805251, -0.0203299, 2.457519, 1, 1, 1, 1, 1
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
var radius = 9.666946;
var distance = 33.95474;
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
mvMatrix.translate( 0.2723517, -0.03080678, 0.1643884 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.95474);
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
