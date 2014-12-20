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
-3.23961, 0.1854705, -2.187503, 1, 0, 0, 1,
-3.092695, -0.994742, -2.136685, 1, 0.007843138, 0, 1,
-3.031171, -1.021372, -1.387689, 1, 0.01176471, 0, 1,
-2.931784, 0.1551397, 0.03756348, 1, 0.01960784, 0, 1,
-2.914284, -0.784505, -0.9188645, 1, 0.02352941, 0, 1,
-2.756075, -0.04311782, -2.446522, 1, 0.03137255, 0, 1,
-2.716254, 0.9420914, -0.8067921, 1, 0.03529412, 0, 1,
-2.683735, -0.1286045, -1.450486, 1, 0.04313726, 0, 1,
-2.672805, 0.9191725, -1.302656, 1, 0.04705882, 0, 1,
-2.668093, 1.154452, -1.564207, 1, 0.05490196, 0, 1,
-2.42897, 0.852453, 1.081034, 1, 0.05882353, 0, 1,
-2.407638, 0.1033231, -1.109971, 1, 0.06666667, 0, 1,
-2.376398, -0.3629639, -1.363738, 1, 0.07058824, 0, 1,
-2.349992, -0.1397107, -3.540298, 1, 0.07843138, 0, 1,
-2.33937, 0.1108218, 0.07259035, 1, 0.08235294, 0, 1,
-2.281642, 0.5803944, -1.584367, 1, 0.09019608, 0, 1,
-2.240211, -0.471665, -2.832618, 1, 0.09411765, 0, 1,
-2.196764, 1.562073, -0.03457877, 1, 0.1019608, 0, 1,
-2.172113, 1.431925, 0.3658638, 1, 0.1098039, 0, 1,
-2.158457, -0.4680772, -2.466406, 1, 0.1137255, 0, 1,
-2.153042, 1.397753, -1.73658, 1, 0.1215686, 0, 1,
-2.118083, -0.0552717, -2.577642, 1, 0.1254902, 0, 1,
-2.066574, -1.264114, -1.608744, 1, 0.1333333, 0, 1,
-2.024654, -0.8943109, -0.3609746, 1, 0.1372549, 0, 1,
-2.008884, 0.09693236, -1.998195, 1, 0.145098, 0, 1,
-1.993371, 0.3003486, -1.237566, 1, 0.1490196, 0, 1,
-1.993086, -0.2162171, -1.834985, 1, 0.1568628, 0, 1,
-1.983386, 0.1337271, -3.286615, 1, 0.1607843, 0, 1,
-1.982412, 0.9807785, -1.643659, 1, 0.1686275, 0, 1,
-1.979521, 2.900321, -0.7956719, 1, 0.172549, 0, 1,
-1.96264, 0.2566397, -1.251694, 1, 0.1803922, 0, 1,
-1.910761, 0.474324, -3.299727, 1, 0.1843137, 0, 1,
-1.90308, 1.622588, 1.125851, 1, 0.1921569, 0, 1,
-1.893711, 0.6063145, -2.148667, 1, 0.1960784, 0, 1,
-1.870187, 1.551361, -0.7147803, 1, 0.2039216, 0, 1,
-1.854964, -0.5518899, -1.507365, 1, 0.2117647, 0, 1,
-1.840275, 0.3888216, -1.056658, 1, 0.2156863, 0, 1,
-1.813652, 1.281664, -2.227149, 1, 0.2235294, 0, 1,
-1.794671, 0.4680179, -1.272759, 1, 0.227451, 0, 1,
-1.789553, -0.4815059, -3.144316, 1, 0.2352941, 0, 1,
-1.746684, 1.591337, -1.671809, 1, 0.2392157, 0, 1,
-1.744964, -2.431506, -3.249274, 1, 0.2470588, 0, 1,
-1.7382, -1.696938, -0.3630087, 1, 0.2509804, 0, 1,
-1.731724, -0.6782631, -1.684819, 1, 0.2588235, 0, 1,
-1.727812, -0.5232683, -3.473433, 1, 0.2627451, 0, 1,
-1.722027, -0.2771777, -1.546851, 1, 0.2705882, 0, 1,
-1.721764, 0.5498213, -2.058831, 1, 0.2745098, 0, 1,
-1.714654, -1.016454, -0.8503704, 1, 0.282353, 0, 1,
-1.711795, -1.780026, -2.484187, 1, 0.2862745, 0, 1,
-1.709516, -0.5512067, -3.467321, 1, 0.2941177, 0, 1,
-1.704151, 1.121049, -1.020034, 1, 0.3019608, 0, 1,
-1.700501, 1.315508, -0.8901945, 1, 0.3058824, 0, 1,
-1.692892, 0.5568694, -0.6229858, 1, 0.3137255, 0, 1,
-1.685879, -0.5918112, -1.721241, 1, 0.3176471, 0, 1,
-1.678834, -1.150151, -0.9142159, 1, 0.3254902, 0, 1,
-1.66704, -1.282465, -2.343899, 1, 0.3294118, 0, 1,
-1.637628, 0.7848642, -0.929064, 1, 0.3372549, 0, 1,
-1.635488, -0.108308, -3.596578, 1, 0.3411765, 0, 1,
-1.633297, -1.263375, -2.191204, 1, 0.3490196, 0, 1,
-1.631358, 0.8450849, -2.110592, 1, 0.3529412, 0, 1,
-1.628102, 0.01277604, -2.318518, 1, 0.3607843, 0, 1,
-1.624045, 2.023233, -2.391181, 1, 0.3647059, 0, 1,
-1.621182, 1.510233, -0.3155789, 1, 0.372549, 0, 1,
-1.619903, -0.3945339, -3.445788, 1, 0.3764706, 0, 1,
-1.61696, -0.3902723, -1.426058, 1, 0.3843137, 0, 1,
-1.609241, -1.261912, -3.034721, 1, 0.3882353, 0, 1,
-1.600675, -0.2256771, -2.599069, 1, 0.3960784, 0, 1,
-1.59263, 1.55882, -2.091484, 1, 0.4039216, 0, 1,
-1.589681, -0.5502728, 0.1541119, 1, 0.4078431, 0, 1,
-1.589244, -0.4063127, -1.847407, 1, 0.4156863, 0, 1,
-1.588152, -1.59777, -3.08269, 1, 0.4196078, 0, 1,
-1.577924, 1.168959, -1.04227, 1, 0.427451, 0, 1,
-1.574093, 1.118223, 1.963217, 1, 0.4313726, 0, 1,
-1.570507, -0.1550517, -1.983596, 1, 0.4392157, 0, 1,
-1.567097, 0.1661673, 0.2639776, 1, 0.4431373, 0, 1,
-1.564905, -0.919228, -2.234907, 1, 0.4509804, 0, 1,
-1.560427, -0.194314, -0.1909857, 1, 0.454902, 0, 1,
-1.557873, 0.8947302, -0.7183128, 1, 0.4627451, 0, 1,
-1.550819, -0.5484662, -2.303272, 1, 0.4666667, 0, 1,
-1.55004, -0.8805773, -2.677719, 1, 0.4745098, 0, 1,
-1.549372, 0.05081915, -2.35612, 1, 0.4784314, 0, 1,
-1.533536, 1.50029, -1.380383, 1, 0.4862745, 0, 1,
-1.528704, -0.1647737, -1.937019, 1, 0.4901961, 0, 1,
-1.528394, 0.2058123, -1.786206, 1, 0.4980392, 0, 1,
-1.520554, 1.768931, -0.600858, 1, 0.5058824, 0, 1,
-1.514523, -0.391751, -1.725372, 1, 0.509804, 0, 1,
-1.513311, 0.3012744, -0.9101702, 1, 0.5176471, 0, 1,
-1.512296, 0.1981436, -1.638016, 1, 0.5215687, 0, 1,
-1.509801, 0.1295324, -2.031543, 1, 0.5294118, 0, 1,
-1.501785, 0.5907688, -0.3761733, 1, 0.5333334, 0, 1,
-1.485175, 2.538724, -1.194823, 1, 0.5411765, 0, 1,
-1.470278, -1.993757, -3.397103, 1, 0.5450981, 0, 1,
-1.456036, -1.442291, -3.149732, 1, 0.5529412, 0, 1,
-1.45368, -0.2278785, -2.782561, 1, 0.5568628, 0, 1,
-1.452134, -2.453185, -2.705015, 1, 0.5647059, 0, 1,
-1.429099, 1.448566, -0.5825399, 1, 0.5686275, 0, 1,
-1.428513, -1.90019, -1.475466, 1, 0.5764706, 0, 1,
-1.4284, -0.2617847, -0.7894598, 1, 0.5803922, 0, 1,
-1.428126, -1.404872, -2.217303, 1, 0.5882353, 0, 1,
-1.405513, 2.068413, 0.2725909, 1, 0.5921569, 0, 1,
-1.403067, 0.2553193, -2.730006, 1, 0.6, 0, 1,
-1.401686, 0.1635757, -1.255086, 1, 0.6078432, 0, 1,
-1.400264, 0.8574786, -0.2654141, 1, 0.6117647, 0, 1,
-1.394009, -0.5383021, -1.122054, 1, 0.6196079, 0, 1,
-1.390634, -0.1997395, -1.540503, 1, 0.6235294, 0, 1,
-1.364511, 1.39475, -1.919551, 1, 0.6313726, 0, 1,
-1.360892, 0.06418155, -3.22683, 1, 0.6352941, 0, 1,
-1.357461, 0.5167845, 0.3993789, 1, 0.6431373, 0, 1,
-1.356926, -0.767849, -0.8044963, 1, 0.6470588, 0, 1,
-1.343501, -0.8721621, -4.442601, 1, 0.654902, 0, 1,
-1.33952, 0.3749363, -1.607014, 1, 0.6588235, 0, 1,
-1.333772, -0.4837609, -0.8567364, 1, 0.6666667, 0, 1,
-1.333629, -0.7948027, -2.52652, 1, 0.6705883, 0, 1,
-1.322164, -1.249028, -3.060992, 1, 0.6784314, 0, 1,
-1.31868, -0.5393246, -1.51737, 1, 0.682353, 0, 1,
-1.318336, 1.546441, -1.379979, 1, 0.6901961, 0, 1,
-1.315362, -1.897478, -3.908716, 1, 0.6941177, 0, 1,
-1.300905, -0.9475178, -1.261789, 1, 0.7019608, 0, 1,
-1.294323, -1.080079, -1.292387, 1, 0.7098039, 0, 1,
-1.294132, -1.016034, -1.851067, 1, 0.7137255, 0, 1,
-1.284967, 0.2217555, 0.9172063, 1, 0.7215686, 0, 1,
-1.277638, 1.504547, -0.09803441, 1, 0.7254902, 0, 1,
-1.268978, -0.358968, -1.411929, 1, 0.7333333, 0, 1,
-1.267142, -0.4673831, -0.8427205, 1, 0.7372549, 0, 1,
-1.263801, -0.702934, -1.782853, 1, 0.7450981, 0, 1,
-1.261762, 0.8253254, -1.453876, 1, 0.7490196, 0, 1,
-1.246878, -0.3078028, -1.830145, 1, 0.7568628, 0, 1,
-1.238416, -0.7471669, -0.9538502, 1, 0.7607843, 0, 1,
-1.234376, 0.4611525, -1.557925, 1, 0.7686275, 0, 1,
-1.233963, -1.1541, -1.61839, 1, 0.772549, 0, 1,
-1.233336, 0.5447448, -1.015886, 1, 0.7803922, 0, 1,
-1.223996, 0.2921543, -1.663307, 1, 0.7843137, 0, 1,
-1.215175, 1.038278, -0.3709491, 1, 0.7921569, 0, 1,
-1.21511, 0.3256178, -1.542447, 1, 0.7960784, 0, 1,
-1.214716, 1.195116, -1.366087, 1, 0.8039216, 0, 1,
-1.212628, 0.8100469, -0.121923, 1, 0.8117647, 0, 1,
-1.208537, -0.06645973, -2.677559, 1, 0.8156863, 0, 1,
-1.207279, -0.03271384, 0.4402144, 1, 0.8235294, 0, 1,
-1.198994, 0.1735928, -1.433647, 1, 0.827451, 0, 1,
-1.194757, 0.7552469, -0.7818506, 1, 0.8352941, 0, 1,
-1.189936, -2.501171, -3.526991, 1, 0.8392157, 0, 1,
-1.185976, -0.3340509, -1.335818, 1, 0.8470588, 0, 1,
-1.18522, 1.947411, -0.9531985, 1, 0.8509804, 0, 1,
-1.18162, -1.823576, -3.125902, 1, 0.8588235, 0, 1,
-1.177119, -0.7695234, -2.471428, 1, 0.8627451, 0, 1,
-1.175703, 1.242492, -2.130797, 1, 0.8705882, 0, 1,
-1.167494, -1.302744, -3.431634, 1, 0.8745098, 0, 1,
-1.163066, 0.0134508, -0.3268808, 1, 0.8823529, 0, 1,
-1.149179, 0.7971334, -2.001141, 1, 0.8862745, 0, 1,
-1.145718, 0.8592563, 0.2721987, 1, 0.8941177, 0, 1,
-1.139789, -1.005859, -1.573183, 1, 0.8980392, 0, 1,
-1.139383, -0.4223107, -3.059115, 1, 0.9058824, 0, 1,
-1.138359, -0.4425676, -1.888948, 1, 0.9137255, 0, 1,
-1.133833, 0.632341, -0.1910689, 1, 0.9176471, 0, 1,
-1.132187, 0.3259593, -3.165468, 1, 0.9254902, 0, 1,
-1.123054, -0.5424982, 0.8585846, 1, 0.9294118, 0, 1,
-1.119922, -0.2323192, -0.308765, 1, 0.9372549, 0, 1,
-1.114066, -0.4724229, -2.341556, 1, 0.9411765, 0, 1,
-1.10498, -0.5604858, -1.919698, 1, 0.9490196, 0, 1,
-1.097717, -1.711946, -2.608374, 1, 0.9529412, 0, 1,
-1.097341, -0.02668479, -2.25801, 1, 0.9607843, 0, 1,
-1.097089, 0.5837804, -1.593978, 1, 0.9647059, 0, 1,
-1.094465, 0.4839921, 0.1785597, 1, 0.972549, 0, 1,
-1.089301, -0.3885162, -2.527715, 1, 0.9764706, 0, 1,
-1.087062, -2.113117, -1.190611, 1, 0.9843137, 0, 1,
-1.08366, 0.6151828, 0.7842314, 1, 0.9882353, 0, 1,
-1.077244, 1.737559, -1.1963, 1, 0.9960784, 0, 1,
-1.069304, 1.364706, 0.2915923, 0.9960784, 1, 0, 1,
-1.067943, 0.1720948, -2.869465, 0.9921569, 1, 0, 1,
-1.059494, 0.840494, -1.386931, 0.9843137, 1, 0, 1,
-1.056857, -0.8468971, -0.9282629, 0.9803922, 1, 0, 1,
-1.054495, -0.6643398, -3.562742, 0.972549, 1, 0, 1,
-1.043693, 1.948318, -2.630132, 0.9686275, 1, 0, 1,
-1.040525, 0.2291026, -2.335874, 0.9607843, 1, 0, 1,
-1.040339, 1.613797, -0.05150018, 0.9568627, 1, 0, 1,
-1.038013, -0.8472607, -2.125599, 0.9490196, 1, 0, 1,
-1.034269, -1.192108, -2.440888, 0.945098, 1, 0, 1,
-1.019874, -0.1455469, -1.490126, 0.9372549, 1, 0, 1,
-1.019246, 0.3401532, -1.733684, 0.9333333, 1, 0, 1,
-1.016961, -1.548966, -3.743788, 0.9254902, 1, 0, 1,
-1.015717, -2.320156, -3.041391, 0.9215686, 1, 0, 1,
-1.014956, 0.8663912, -1.264478, 0.9137255, 1, 0, 1,
-1.013794, 0.7884693, -1.085523, 0.9098039, 1, 0, 1,
-1.012358, 0.2340247, -2.859315, 0.9019608, 1, 0, 1,
-1.007337, -1.149638, -2.602588, 0.8941177, 1, 0, 1,
-1.00512, -0.9603079, -2.618905, 0.8901961, 1, 0, 1,
-0.9960885, 0.5940495, -0.948941, 0.8823529, 1, 0, 1,
-0.9958895, -1.918966, -1.666724, 0.8784314, 1, 0, 1,
-0.9899154, 0.453479, -2.090916, 0.8705882, 1, 0, 1,
-0.9867238, -0.05322371, -2.592091, 0.8666667, 1, 0, 1,
-0.9863382, 0.7940988, -0.5964999, 0.8588235, 1, 0, 1,
-0.9861396, 1.069314, -1.334348, 0.854902, 1, 0, 1,
-0.9759948, -0.4285123, -2.733746, 0.8470588, 1, 0, 1,
-0.9736355, -0.8390462, -1.29074, 0.8431373, 1, 0, 1,
-0.965647, -0.2739985, 0.2465705, 0.8352941, 1, 0, 1,
-0.9651458, 0.4021021, -2.456338, 0.8313726, 1, 0, 1,
-0.9646479, 0.6815017, -0.8198519, 0.8235294, 1, 0, 1,
-0.9550373, -0.1767784, -1.405515, 0.8196079, 1, 0, 1,
-0.9535884, 0.8883499, -1.052538, 0.8117647, 1, 0, 1,
-0.9516834, -0.5436692, -2.828334, 0.8078431, 1, 0, 1,
-0.950869, 0.9063705, -1.097044, 0.8, 1, 0, 1,
-0.9451683, -1.427938, -2.725722, 0.7921569, 1, 0, 1,
-0.9418851, -0.8804929, -2.934039, 0.7882353, 1, 0, 1,
-0.936372, -1.45761, -2.341541, 0.7803922, 1, 0, 1,
-0.9350508, 0.3689578, 0.4480224, 0.7764706, 1, 0, 1,
-0.9325159, 0.538587, -0.5530067, 0.7686275, 1, 0, 1,
-0.9310517, -0.292398, -1.877021, 0.7647059, 1, 0, 1,
-0.9304588, -0.2227073, -3.263169, 0.7568628, 1, 0, 1,
-0.9281304, 0.09883867, -1.410304, 0.7529412, 1, 0, 1,
-0.9267935, 1.156043, -0.6284054, 0.7450981, 1, 0, 1,
-0.923559, -1.301223, -1.904311, 0.7411765, 1, 0, 1,
-0.9228939, 1.329701, -0.2443534, 0.7333333, 1, 0, 1,
-0.9205766, -0.3701413, -1.386831, 0.7294118, 1, 0, 1,
-0.9204766, -0.4421498, -0.05317163, 0.7215686, 1, 0, 1,
-0.9204627, 0.2471787, 0.7220529, 0.7176471, 1, 0, 1,
-0.9187383, 0.789368, -1.809997, 0.7098039, 1, 0, 1,
-0.9172437, 1.316272, -0.8136714, 0.7058824, 1, 0, 1,
-0.9113201, -0.1708186, 0.0593561, 0.6980392, 1, 0, 1,
-0.9103919, 0.2499643, -2.149452, 0.6901961, 1, 0, 1,
-0.9080599, -0.4457413, -2.836591, 0.6862745, 1, 0, 1,
-0.9075264, -1.354066, -0.9079921, 0.6784314, 1, 0, 1,
-0.8986326, -0.6254638, -2.220183, 0.6745098, 1, 0, 1,
-0.8896688, -0.1267278, -1.769731, 0.6666667, 1, 0, 1,
-0.8870297, -0.07448262, -1.690516, 0.6627451, 1, 0, 1,
-0.8868726, 0.09383869, -1.321573, 0.654902, 1, 0, 1,
-0.8852744, -0.1004386, -0.9164602, 0.6509804, 1, 0, 1,
-0.8762956, 2.589852, 0.9570408, 0.6431373, 1, 0, 1,
-0.8749583, -0.1453135, 0.3370251, 0.6392157, 1, 0, 1,
-0.874745, -2.079277, -0.02645897, 0.6313726, 1, 0, 1,
-0.8737988, 0.9978809, -1.52511, 0.627451, 1, 0, 1,
-0.87316, 0.5959396, -0.9039884, 0.6196079, 1, 0, 1,
-0.8671708, 0.8412755, -0.6050915, 0.6156863, 1, 0, 1,
-0.8646739, -0.6861229, -0.7626528, 0.6078432, 1, 0, 1,
-0.8598465, 0.5178175, -2.120857, 0.6039216, 1, 0, 1,
-0.8524377, -0.9924398, -2.283281, 0.5960785, 1, 0, 1,
-0.8380211, -1.335455, -0.8651559, 0.5882353, 1, 0, 1,
-0.8370223, 0.5426553, -1.585803, 0.5843138, 1, 0, 1,
-0.834481, 0.9481342, -0.3273962, 0.5764706, 1, 0, 1,
-0.8303711, 0.02103126, -3.550067, 0.572549, 1, 0, 1,
-0.8295687, 0.9130654, -0.9906327, 0.5647059, 1, 0, 1,
-0.8253725, -0.08188061, -1.150724, 0.5607843, 1, 0, 1,
-0.8211578, 1.023953, 0.1788305, 0.5529412, 1, 0, 1,
-0.8147172, 1.681829, -0.1530529, 0.5490196, 1, 0, 1,
-0.8146022, -0.1478913, -0.558862, 0.5411765, 1, 0, 1,
-0.813335, 0.1942975, -2.292116, 0.5372549, 1, 0, 1,
-0.8098716, 0.07650792, -2.024284, 0.5294118, 1, 0, 1,
-0.8080018, -0.2956345, -2.362174, 0.5254902, 1, 0, 1,
-0.8051258, -1.027506, -2.859105, 0.5176471, 1, 0, 1,
-0.8037547, 1.846854, -1.907856, 0.5137255, 1, 0, 1,
-0.8007333, -0.9244744, -3.223704, 0.5058824, 1, 0, 1,
-0.7992664, -1.302836, -1.746318, 0.5019608, 1, 0, 1,
-0.7970319, -1.044734, -3.920797, 0.4941176, 1, 0, 1,
-0.7932901, 0.02607149, -0.5948877, 0.4862745, 1, 0, 1,
-0.7932871, -0.3503031, -1.364375, 0.4823529, 1, 0, 1,
-0.7911049, 1.118497, -1.848459, 0.4745098, 1, 0, 1,
-0.7895914, 0.3490984, 0.8199666, 0.4705882, 1, 0, 1,
-0.7882496, -0.5017806, -2.472395, 0.4627451, 1, 0, 1,
-0.7860152, 0.04452622, -1.372497, 0.4588235, 1, 0, 1,
-0.7821806, -0.2362243, -2.59598, 0.4509804, 1, 0, 1,
-0.7799035, -0.6012078, -1.770745, 0.4470588, 1, 0, 1,
-0.77259, 0.006363376, 0.07029724, 0.4392157, 1, 0, 1,
-0.771796, -1.689297, -2.443919, 0.4352941, 1, 0, 1,
-0.7717263, 1.266608, -1.435662, 0.427451, 1, 0, 1,
-0.7673107, 0.5803182, -1.984631, 0.4235294, 1, 0, 1,
-0.7614953, 0.2137248, -0.7496281, 0.4156863, 1, 0, 1,
-0.7587729, -1.0188, -3.190776, 0.4117647, 1, 0, 1,
-0.7576485, -0.3298399, -0.7526473, 0.4039216, 1, 0, 1,
-0.7569276, -1.221325, -2.941379, 0.3960784, 1, 0, 1,
-0.7551417, 0.6533009, -0.2430914, 0.3921569, 1, 0, 1,
-0.7545671, 0.03294208, -1.311674, 0.3843137, 1, 0, 1,
-0.7500183, 1.991522, -0.09519608, 0.3803922, 1, 0, 1,
-0.7483801, 1.234921, 0.4565729, 0.372549, 1, 0, 1,
-0.74777, 0.2436672, -2.576007, 0.3686275, 1, 0, 1,
-0.7438797, 0.7615257, -0.1640371, 0.3607843, 1, 0, 1,
-0.7435648, 0.8083841, -1.065086, 0.3568628, 1, 0, 1,
-0.7399702, 1.034795, -1.108599, 0.3490196, 1, 0, 1,
-0.7398518, 0.4430467, -1.377916, 0.345098, 1, 0, 1,
-0.7347819, -1.035259, -2.621404, 0.3372549, 1, 0, 1,
-0.7343292, -0.7676617, -2.513244, 0.3333333, 1, 0, 1,
-0.7216223, -0.8291537, -2.51378, 0.3254902, 1, 0, 1,
-0.7199331, -0.3254801, -0.9332883, 0.3215686, 1, 0, 1,
-0.7193954, -0.6965246, -3.111557, 0.3137255, 1, 0, 1,
-0.7145488, 0.6207737, 0.1340226, 0.3098039, 1, 0, 1,
-0.7126625, -0.4407198, -1.859561, 0.3019608, 1, 0, 1,
-0.7105055, -0.2027251, -3.087335, 0.2941177, 1, 0, 1,
-0.7084005, 0.6741366, 0.5300792, 0.2901961, 1, 0, 1,
-0.7069996, -1.495161, -2.934998, 0.282353, 1, 0, 1,
-0.706927, 1.691282, 0.9661073, 0.2784314, 1, 0, 1,
-0.7039418, -1.465636, -4.225626, 0.2705882, 1, 0, 1,
-0.7036591, 1.545675, -0.04257439, 0.2666667, 1, 0, 1,
-0.7033669, -0.7664629, -3.451072, 0.2588235, 1, 0, 1,
-0.6999822, -1.683069, -3.068035, 0.254902, 1, 0, 1,
-0.6991293, -0.0643615, -1.352451, 0.2470588, 1, 0, 1,
-0.6967701, 0.3976046, 0.1361595, 0.2431373, 1, 0, 1,
-0.6923236, -0.3310331, -2.728489, 0.2352941, 1, 0, 1,
-0.6890208, -0.3699974, -3.325115, 0.2313726, 1, 0, 1,
-0.6853314, -0.7115222, -3.346733, 0.2235294, 1, 0, 1,
-0.6836054, 1.54967, 0.2193123, 0.2196078, 1, 0, 1,
-0.6828696, 1.243813, 0.1385937, 0.2117647, 1, 0, 1,
-0.681232, -0.3952984, -1.53512, 0.2078431, 1, 0, 1,
-0.6783611, -0.9174464, -2.991704, 0.2, 1, 0, 1,
-0.673609, 1.776188, -0.6740143, 0.1921569, 1, 0, 1,
-0.6728154, -1.492585, -2.079733, 0.1882353, 1, 0, 1,
-0.6720383, 0.2213533, -1.688926, 0.1803922, 1, 0, 1,
-0.6625034, -0.3900666, -1.661446, 0.1764706, 1, 0, 1,
-0.6528873, -0.8842592, -2.166061, 0.1686275, 1, 0, 1,
-0.6513211, 0.1678591, -0.4050402, 0.1647059, 1, 0, 1,
-0.6488854, 0.390706, -2.09958, 0.1568628, 1, 0, 1,
-0.6483749, 0.468471, -1.845128, 0.1529412, 1, 0, 1,
-0.6412107, 0.9356384, -0.8853967, 0.145098, 1, 0, 1,
-0.6388714, -0.2666427, -2.618021, 0.1411765, 1, 0, 1,
-0.6355761, 0.8187622, -0.265001, 0.1333333, 1, 0, 1,
-0.6344879, -0.198606, -1.264106, 0.1294118, 1, 0, 1,
-0.6341228, 0.4830842, 0.4459316, 0.1215686, 1, 0, 1,
-0.6307693, 0.2732624, -2.65616, 0.1176471, 1, 0, 1,
-0.6281053, -0.3142482, -1.290477, 0.1098039, 1, 0, 1,
-0.6238587, 1.746616, 0.5246984, 0.1058824, 1, 0, 1,
-0.6232145, -1.485418, -3.46969, 0.09803922, 1, 0, 1,
-0.6228037, -1.214664, -3.784633, 0.09019608, 1, 0, 1,
-0.6223665, 0.7839842, 0.2133786, 0.08627451, 1, 0, 1,
-0.6192805, 0.6895957, -1.014881, 0.07843138, 1, 0, 1,
-0.617911, 0.384712, -1.648027, 0.07450981, 1, 0, 1,
-0.6174437, 0.6576007, -1.970325, 0.06666667, 1, 0, 1,
-0.6107233, 1.843639, 0.7862473, 0.0627451, 1, 0, 1,
-0.6106974, -0.6773052, -3.334794, 0.05490196, 1, 0, 1,
-0.6094877, -0.7875147, -0.7031311, 0.05098039, 1, 0, 1,
-0.6036966, -0.8437592, -1.304145, 0.04313726, 1, 0, 1,
-0.6015182, -1.338111, -4.915036, 0.03921569, 1, 0, 1,
-0.5988703, 1.28179, 2.451123, 0.03137255, 1, 0, 1,
-0.5899934, -0.6866707, -2.245691, 0.02745098, 1, 0, 1,
-0.5832502, 2.019588, 0.472341, 0.01960784, 1, 0, 1,
-0.5786196, 1.479323, -1.782605, 0.01568628, 1, 0, 1,
-0.5781966, 0.1834191, -3.049683, 0.007843138, 1, 0, 1,
-0.576414, -1.105053, -2.678581, 0.003921569, 1, 0, 1,
-0.5750946, 0.5948777, 0.8227931, 0, 1, 0.003921569, 1,
-0.5723055, 1.109352, -1.222461, 0, 1, 0.01176471, 1,
-0.5662194, -0.8608665, -3.512642, 0, 1, 0.01568628, 1,
-0.5632869, 0.8175244, 0.5867831, 0, 1, 0.02352941, 1,
-0.5624315, 1.096309, -2.853853, 0, 1, 0.02745098, 1,
-0.5535992, 0.4101847, -0.3604338, 0, 1, 0.03529412, 1,
-0.5535918, 0.09541365, -0.3593249, 0, 1, 0.03921569, 1,
-0.5506678, 0.6373834, -1.392422, 0, 1, 0.04705882, 1,
-0.546236, -0.5925089, -0.8106064, 0, 1, 0.05098039, 1,
-0.5430565, -0.008067019, -0.3341971, 0, 1, 0.05882353, 1,
-0.5425824, -0.5020919, -2.575576, 0, 1, 0.0627451, 1,
-0.5411328, -0.4455155, -2.822622, 0, 1, 0.07058824, 1,
-0.5399145, 0.8471295, -0.5597169, 0, 1, 0.07450981, 1,
-0.5391356, 0.4720189, -2.963059, 0, 1, 0.08235294, 1,
-0.5319954, 1.129149, 0.04504196, 0, 1, 0.08627451, 1,
-0.5319511, 0.1915875, -0.4396274, 0, 1, 0.09411765, 1,
-0.5304055, -0.3139341, -1.042705, 0, 1, 0.1019608, 1,
-0.5291808, 1.059313, -1.50336, 0, 1, 0.1058824, 1,
-0.5291736, 0.8062278, -1.348814, 0, 1, 0.1137255, 1,
-0.5260561, 1.144833, -0.9088486, 0, 1, 0.1176471, 1,
-0.52034, 0.007969165, -2.445659, 0, 1, 0.1254902, 1,
-0.5196629, 2.162161, 1.403727, 0, 1, 0.1294118, 1,
-0.5192392, 0.9314351, -1.223208, 0, 1, 0.1372549, 1,
-0.5171672, -0.3861034, -3.228944, 0, 1, 0.1411765, 1,
-0.5149011, -0.09739284, -1.566384, 0, 1, 0.1490196, 1,
-0.5118839, 1.735801, 0.4950958, 0, 1, 0.1529412, 1,
-0.5111544, 1.770435, -0.8615466, 0, 1, 0.1607843, 1,
-0.5087497, -1.811482, -5.620721, 0, 1, 0.1647059, 1,
-0.507171, -0.3698437, -2.260257, 0, 1, 0.172549, 1,
-0.5057225, 0.5633205, -0.4200166, 0, 1, 0.1764706, 1,
-0.4994787, 1.375063, -0.2098065, 0, 1, 0.1843137, 1,
-0.4989157, 0.8503584, -0.7782117, 0, 1, 0.1882353, 1,
-0.4853641, 0.5802273, 0.489996, 0, 1, 0.1960784, 1,
-0.4840814, 1.423497, -1.280744, 0, 1, 0.2039216, 1,
-0.4808093, -0.3686757, -2.30073, 0, 1, 0.2078431, 1,
-0.4803275, 1.156893, 0.009822136, 0, 1, 0.2156863, 1,
-0.4615242, 0.4577945, -2.104196, 0, 1, 0.2196078, 1,
-0.4607278, 0.8801697, -1.659721, 0, 1, 0.227451, 1,
-0.4602104, 2.443292, -1.594634, 0, 1, 0.2313726, 1,
-0.4593021, -2.550697, -2.609936, 0, 1, 0.2392157, 1,
-0.4560699, 0.294727, -0.9960533, 0, 1, 0.2431373, 1,
-0.4546618, -3.82461, -1.889335, 0, 1, 0.2509804, 1,
-0.4508486, 0.9089219, 0.4007706, 0, 1, 0.254902, 1,
-0.447127, -1.138191, -2.535817, 0, 1, 0.2627451, 1,
-0.4456495, -0.1827346, -1.755997, 0, 1, 0.2666667, 1,
-0.4429174, 1.106627, -0.07825286, 0, 1, 0.2745098, 1,
-0.4375228, -0.246757, -2.396768, 0, 1, 0.2784314, 1,
-0.4374929, -0.3442773, -3.352744, 0, 1, 0.2862745, 1,
-0.4370059, -0.3581165, -1.29951, 0, 1, 0.2901961, 1,
-0.4363886, -0.004256027, -2.847377, 0, 1, 0.2980392, 1,
-0.4289573, -0.9945166, -1.871766, 0, 1, 0.3058824, 1,
-0.4231674, -0.3768229, -2.082939, 0, 1, 0.3098039, 1,
-0.4222192, -0.3781837, -2.912297, 0, 1, 0.3176471, 1,
-0.419729, 0.3313117, -0.6291724, 0, 1, 0.3215686, 1,
-0.4193892, -1.178228, -2.653088, 0, 1, 0.3294118, 1,
-0.4158007, 0.1952597, -1.394367, 0, 1, 0.3333333, 1,
-0.4095722, -0.1882861, -2.342731, 0, 1, 0.3411765, 1,
-0.40899, 1.134029, 0.2239482, 0, 1, 0.345098, 1,
-0.4079678, -0.4031482, -1.815572, 0, 1, 0.3529412, 1,
-0.4074734, -0.04008867, -2.039984, 0, 1, 0.3568628, 1,
-0.3950272, 1.3523, 0.7612992, 0, 1, 0.3647059, 1,
-0.3933946, -1.450004, -3.479185, 0, 1, 0.3686275, 1,
-0.3812944, -1.406353, -3.922027, 0, 1, 0.3764706, 1,
-0.3779058, 0.3460356, 0.5956956, 0, 1, 0.3803922, 1,
-0.3691612, 1.654852, -1.268909, 0, 1, 0.3882353, 1,
-0.3680696, 0.7339063, 0.1634727, 0, 1, 0.3921569, 1,
-0.3627092, 0.5296878, -1.45992, 0, 1, 0.4, 1,
-0.3614151, 1.290198, -0.2777841, 0, 1, 0.4078431, 1,
-0.3606434, 0.2919954, -1.167154, 0, 1, 0.4117647, 1,
-0.3591866, 1.37727, 1.118395, 0, 1, 0.4196078, 1,
-0.3553161, 1.011265, -1.200504, 0, 1, 0.4235294, 1,
-0.3544099, 0.05387798, 0.5236263, 0, 1, 0.4313726, 1,
-0.3437475, -1.501176, -1.259657, 0, 1, 0.4352941, 1,
-0.3436386, 0.8136064, -0.8143661, 0, 1, 0.4431373, 1,
-0.3433738, -0.3055648, -1.676892, 0, 1, 0.4470588, 1,
-0.3373298, 1.228307, 0.02577145, 0, 1, 0.454902, 1,
-0.3320445, -1.507774, -2.267761, 0, 1, 0.4588235, 1,
-0.3264093, 0.557847, 0.3299769, 0, 1, 0.4666667, 1,
-0.3255038, -0.3406597, -0.8945124, 0, 1, 0.4705882, 1,
-0.323772, -0.9739452, -1.447831, 0, 1, 0.4784314, 1,
-0.3165343, 0.1279007, -1.064504, 0, 1, 0.4823529, 1,
-0.3137548, 1.707085, -0.3562143, 0, 1, 0.4901961, 1,
-0.3128369, 1.534505, -0.2419077, 0, 1, 0.4941176, 1,
-0.3123114, -0.006805869, -2.002566, 0, 1, 0.5019608, 1,
-0.3067652, -0.671841, -1.620656, 0, 1, 0.509804, 1,
-0.3033032, -0.3987445, -4.572343, 0, 1, 0.5137255, 1,
-0.2964112, -0.9250449, -4.428837, 0, 1, 0.5215687, 1,
-0.2932882, -1.392056, -2.716475, 0, 1, 0.5254902, 1,
-0.2902335, -1.276412, -3.913947, 0, 1, 0.5333334, 1,
-0.2880262, -1.112564, -2.856697, 0, 1, 0.5372549, 1,
-0.2865241, 0.3092588, -1.798093, 0, 1, 0.5450981, 1,
-0.2853715, 3.136534, -0.6112622, 0, 1, 0.5490196, 1,
-0.2822765, 0.3670033, 0.7925881, 0, 1, 0.5568628, 1,
-0.2808908, 0.5425976, 0.2313287, 0, 1, 0.5607843, 1,
-0.2783916, 1.200416, -3.07455, 0, 1, 0.5686275, 1,
-0.2753563, 0.1783965, -2.323925, 0, 1, 0.572549, 1,
-0.2737273, -1.829004, -3.509097, 0, 1, 0.5803922, 1,
-0.2695601, 0.1293298, -1.630916, 0, 1, 0.5843138, 1,
-0.266688, 3.012579, -0.4742684, 0, 1, 0.5921569, 1,
-0.2654155, 0.7133123, -2.412018, 0, 1, 0.5960785, 1,
-0.2631036, 1.864231, -1.156323, 0, 1, 0.6039216, 1,
-0.2621385, -1.163083, -4.1567, 0, 1, 0.6117647, 1,
-0.2609658, 0.9832863, 1.267659, 0, 1, 0.6156863, 1,
-0.2567715, -1.03469, -2.804016, 0, 1, 0.6235294, 1,
-0.2561922, 0.5707949, -0.6799744, 0, 1, 0.627451, 1,
-0.2522783, 0.03314091, -2.270338, 0, 1, 0.6352941, 1,
-0.2518881, -0.5674974, -3.060113, 0, 1, 0.6392157, 1,
-0.2439464, -1.585233, -3.146724, 0, 1, 0.6470588, 1,
-0.2386488, 1.154013, -1.101568, 0, 1, 0.6509804, 1,
-0.2381348, -0.2760079, -2.190777, 0, 1, 0.6588235, 1,
-0.2357223, 1.232504, 0.7048836, 0, 1, 0.6627451, 1,
-0.2330914, 1.433873, -0.4403341, 0, 1, 0.6705883, 1,
-0.2321812, 1.538356, 1.126051, 0, 1, 0.6745098, 1,
-0.2292421, 1.130646, -0.2213725, 0, 1, 0.682353, 1,
-0.2265731, -0.5610763, -3.354944, 0, 1, 0.6862745, 1,
-0.2261861, -1.692338, -1.259368, 0, 1, 0.6941177, 1,
-0.2259293, -0.5777837, -1.276186, 0, 1, 0.7019608, 1,
-0.2172901, -0.2373853, -4.640754, 0, 1, 0.7058824, 1,
-0.213368, 0.06118936, -1.249314, 0, 1, 0.7137255, 1,
-0.2075161, 1.341844, 0.05362898, 0, 1, 0.7176471, 1,
-0.202295, -0.346943, -3.12523, 0, 1, 0.7254902, 1,
-0.1997735, 0.2467421, -0.3121022, 0, 1, 0.7294118, 1,
-0.1974471, 0.7173345, -0.5199896, 0, 1, 0.7372549, 1,
-0.1843147, -0.4169978, -1.072764, 0, 1, 0.7411765, 1,
-0.1814861, 0.8498029, 0.1181072, 0, 1, 0.7490196, 1,
-0.1761016, 0.3744491, -1.738327, 0, 1, 0.7529412, 1,
-0.1720544, 1.247617, 0.7485936, 0, 1, 0.7607843, 1,
-0.1709895, 1.658986, 0.1487087, 0, 1, 0.7647059, 1,
-0.1697858, -0.1428116, -2.109162, 0, 1, 0.772549, 1,
-0.1683837, 0.8055267, -2.541088, 0, 1, 0.7764706, 1,
-0.1625454, -0.0729732, -2.160458, 0, 1, 0.7843137, 1,
-0.1619411, 1.366411, 0.4003224, 0, 1, 0.7882353, 1,
-0.1618944, 0.1044949, -1.357832, 0, 1, 0.7960784, 1,
-0.1591953, 0.4503722, -1.119174, 0, 1, 0.8039216, 1,
-0.1588451, 0.4392827, -1.410934, 0, 1, 0.8078431, 1,
-0.1583073, 0.5917393, 0.4811449, 0, 1, 0.8156863, 1,
-0.1566141, -0.6420496, -3.018026, 0, 1, 0.8196079, 1,
-0.1546917, 0.7527815, -1.309059, 0, 1, 0.827451, 1,
-0.1533086, 0.8938969, -1.555412, 0, 1, 0.8313726, 1,
-0.1503493, 0.3294978, -0.1202121, 0, 1, 0.8392157, 1,
-0.1489851, 0.3171438, 0.4460619, 0, 1, 0.8431373, 1,
-0.1457981, 0.9789241, 0.2527252, 0, 1, 0.8509804, 1,
-0.1433003, -0.7306445, -2.151445, 0, 1, 0.854902, 1,
-0.1398941, -1.466828, -1.819538, 0, 1, 0.8627451, 1,
-0.1388468, 0.4089116, 0.5321547, 0, 1, 0.8666667, 1,
-0.1349263, -0.5711797, -3.938278, 0, 1, 0.8745098, 1,
-0.1332926, -1.238091, -1.599389, 0, 1, 0.8784314, 1,
-0.1320183, 1.742718, 0.2510352, 0, 1, 0.8862745, 1,
-0.1309423, 0.6661005, -1.13691, 0, 1, 0.8901961, 1,
-0.1307289, -0.3202399, -2.763605, 0, 1, 0.8980392, 1,
-0.1294815, 0.126422, -0.4971697, 0, 1, 0.9058824, 1,
-0.1283685, -1.174709, -3.691789, 0, 1, 0.9098039, 1,
-0.1273201, -0.3870162, -3.092069, 0, 1, 0.9176471, 1,
-0.1238099, 0.7022365, 0.7188286, 0, 1, 0.9215686, 1,
-0.1107972, -0.5468095, -3.795089, 0, 1, 0.9294118, 1,
-0.1099025, -0.7564737, -2.747375, 0, 1, 0.9333333, 1,
-0.1054778, -0.09867121, -1.456889, 0, 1, 0.9411765, 1,
-0.1054299, -0.04159712, -4.527545, 0, 1, 0.945098, 1,
-0.09656373, -0.05926537, -2.539473, 0, 1, 0.9529412, 1,
-0.09554388, 1.275743, -0.1536232, 0, 1, 0.9568627, 1,
-0.08988108, -0.2563582, -1.982802, 0, 1, 0.9647059, 1,
-0.08681361, 0.9029468, 1.904604, 0, 1, 0.9686275, 1,
-0.08466569, -1.23101, -3.228495, 0, 1, 0.9764706, 1,
-0.07997482, -0.02838162, -1.076557, 0, 1, 0.9803922, 1,
-0.07803711, 0.559603, 0.2902612, 0, 1, 0.9882353, 1,
-0.07578158, -1.750488, -2.586129, 0, 1, 0.9921569, 1,
-0.07572242, -0.3826029, -3.865963, 0, 1, 1, 1,
-0.07489027, 1.312043, -0.0479071, 0, 0.9921569, 1, 1,
-0.07480232, 0.09526651, 0.6085625, 0, 0.9882353, 1, 1,
-0.0733511, 0.3580158, -0.6086591, 0, 0.9803922, 1, 1,
-0.062768, -0.5384935, -3.683408, 0, 0.9764706, 1, 1,
-0.06161498, 0.8156204, -0.9971703, 0, 0.9686275, 1, 1,
-0.06072257, -1.161914, -2.687724, 0, 0.9647059, 1, 1,
-0.05473716, -0.2647724, -3.18383, 0, 0.9568627, 1, 1,
-0.05449345, 0.7919483, -0.5905818, 0, 0.9529412, 1, 1,
-0.05401286, -0.04119737, -2.192342, 0, 0.945098, 1, 1,
-0.05233765, -0.8349581, -4.90503, 0, 0.9411765, 1, 1,
-0.05049716, 1.887585, 2.94933, 0, 0.9333333, 1, 1,
-0.04931444, 0.3170697, 0.05258051, 0, 0.9294118, 1, 1,
-0.04471859, 0.4997833, -0.9859852, 0, 0.9215686, 1, 1,
-0.03631648, -0.4416814, -2.287354, 0, 0.9176471, 1, 1,
-0.03222371, 0.1142769, 0.6262946, 0, 0.9098039, 1, 1,
-0.02798873, 1.397002, -0.7138066, 0, 0.9058824, 1, 1,
-0.02446732, -0.1237431, -3.304919, 0, 0.8980392, 1, 1,
-0.02125933, 0.6974859, -0.1769088, 0, 0.8901961, 1, 1,
-0.02025946, -0.1785862, -2.805592, 0, 0.8862745, 1, 1,
-0.0195886, -1.124758, -2.562554, 0, 0.8784314, 1, 1,
-0.01798477, -0.4160784, -1.19672, 0, 0.8745098, 1, 1,
-0.01578225, 0.82781, -0.890009, 0, 0.8666667, 1, 1,
-0.01560254, 0.5255542, -0.7480515, 0, 0.8627451, 1, 1,
-0.01502336, 0.4506095, -0.8323954, 0, 0.854902, 1, 1,
-0.01469718, 0.9573255, -0.4315792, 0, 0.8509804, 1, 1,
-0.01355513, 0.0535694, 0.673251, 0, 0.8431373, 1, 1,
-0.0129374, -0.2704031, -2.349534, 0, 0.8392157, 1, 1,
-0.0126458, 1.43862, 0.4496976, 0, 0.8313726, 1, 1,
-0.002288849, 0.5306005, -0.7388942, 0, 0.827451, 1, 1,
-0.002153636, 0.618998, 1.212733, 0, 0.8196079, 1, 1,
-0.0008027405, -1.162239, -2.323258, 0, 0.8156863, 1, 1,
0.003444221, 1.474031, 0.1539106, 0, 0.8078431, 1, 1,
0.004099417, -0.2677796, 3.220757, 0, 0.8039216, 1, 1,
0.005772904, -1.291582, 2.798522, 0, 0.7960784, 1, 1,
0.01711037, 0.187274, 1.665353, 0, 0.7882353, 1, 1,
0.01733438, 0.2292108, 0.1843139, 0, 0.7843137, 1, 1,
0.02396168, 0.118908, -0.5372983, 0, 0.7764706, 1, 1,
0.02457511, -1.938641, 3.379233, 0, 0.772549, 1, 1,
0.025327, -0.2016253, 2.846912, 0, 0.7647059, 1, 1,
0.02697491, 0.00273849, 3.504843, 0, 0.7607843, 1, 1,
0.03136244, 0.04871705, 0.7038319, 0, 0.7529412, 1, 1,
0.03587845, -0.4411337, 3.690461, 0, 0.7490196, 1, 1,
0.03690339, 1.178166, 1.251848, 0, 0.7411765, 1, 1,
0.0369143, 0.30836, -0.8201401, 0, 0.7372549, 1, 1,
0.0378013, 1.943775, 0.8641278, 0, 0.7294118, 1, 1,
0.04356279, 0.2187281, 0.4862127, 0, 0.7254902, 1, 1,
0.04358044, 0.4276119, -0.7801424, 0, 0.7176471, 1, 1,
0.04597962, 0.3049856, -0.1726199, 0, 0.7137255, 1, 1,
0.04929099, -0.9024328, 1.596708, 0, 0.7058824, 1, 1,
0.04968425, -0.5824052, 3.687606, 0, 0.6980392, 1, 1,
0.05078067, 1.13324, -1.32702, 0, 0.6941177, 1, 1,
0.05151619, 0.7378485, 3.071133, 0, 0.6862745, 1, 1,
0.0537831, 1.212468, -0.4295878, 0, 0.682353, 1, 1,
0.0559016, 0.8258401, 0.7242947, 0, 0.6745098, 1, 1,
0.05620659, -0.6101906, 3.076168, 0, 0.6705883, 1, 1,
0.05851762, 0.2393886, -0.5966538, 0, 0.6627451, 1, 1,
0.05913032, 0.7110836, -0.2987308, 0, 0.6588235, 1, 1,
0.05987012, 2.429337, -1.964202, 0, 0.6509804, 1, 1,
0.06462197, -0.841072, 4.177247, 0, 0.6470588, 1, 1,
0.06983811, -0.6474223, 3.001381, 0, 0.6392157, 1, 1,
0.07532457, 0.5592667, -0.3293707, 0, 0.6352941, 1, 1,
0.0791553, 2.566958, 0.5236263, 0, 0.627451, 1, 1,
0.08367844, -1.118394, 1.9523, 0, 0.6235294, 1, 1,
0.08407782, 0.2809288, -0.6804999, 0, 0.6156863, 1, 1,
0.0877082, -0.01053283, 2.948081, 0, 0.6117647, 1, 1,
0.08862621, -1.828104, 2.872887, 0, 0.6039216, 1, 1,
0.08975426, -0.2638667, 1.903033, 0, 0.5960785, 1, 1,
0.09000472, 0.04889952, 2.883674, 0, 0.5921569, 1, 1,
0.09268057, 1.594275, -0.2172265, 0, 0.5843138, 1, 1,
0.09522348, 0.0767179, 0.3426559, 0, 0.5803922, 1, 1,
0.09584886, 0.317667, -0.5369784, 0, 0.572549, 1, 1,
0.09925243, -0.01127571, 1.33399, 0, 0.5686275, 1, 1,
0.1023051, 0.03607476, 0.9652581, 0, 0.5607843, 1, 1,
0.1117608, 0.04381483, 1.135634, 0, 0.5568628, 1, 1,
0.1117653, 0.9482363, -0.2250452, 0, 0.5490196, 1, 1,
0.1155015, -1.566273, 2.453334, 0, 0.5450981, 1, 1,
0.1155967, -0.02464505, 2.060286, 0, 0.5372549, 1, 1,
0.1165651, -0.5340652, 2.3891, 0, 0.5333334, 1, 1,
0.1221765, 0.09541845, 0.2490406, 0, 0.5254902, 1, 1,
0.1227138, -0.2724876, 3.5278, 0, 0.5215687, 1, 1,
0.1255064, -1.098346, 2.429219, 0, 0.5137255, 1, 1,
0.130097, 0.6803181, -0.3701759, 0, 0.509804, 1, 1,
0.1302503, 2.130091, -0.8954929, 0, 0.5019608, 1, 1,
0.1312769, -1.72438, 2.114183, 0, 0.4941176, 1, 1,
0.1358686, 0.2365114, 0.7124043, 0, 0.4901961, 1, 1,
0.1443692, -0.7043661, 3.121915, 0, 0.4823529, 1, 1,
0.1444178, -1.360767, 1.418082, 0, 0.4784314, 1, 1,
0.1498498, 1.820986, 1.285627, 0, 0.4705882, 1, 1,
0.154889, 1.234, 1.056988, 0, 0.4666667, 1, 1,
0.1616837, -0.5843323, 2.138078, 0, 0.4588235, 1, 1,
0.1619054, 1.418494, 0.3159694, 0, 0.454902, 1, 1,
0.1638848, -0.2786829, 2.40905, 0, 0.4470588, 1, 1,
0.1648988, 0.3425169, -1.389425, 0, 0.4431373, 1, 1,
0.1649658, -0.8647418, 2.926306, 0, 0.4352941, 1, 1,
0.1722188, -0.192065, 1.770241, 0, 0.4313726, 1, 1,
0.173429, 1.317693, 0.300659, 0, 0.4235294, 1, 1,
0.1748208, 0.7693867, 1.831263, 0, 0.4196078, 1, 1,
0.1779366, -0.6056643, 3.129134, 0, 0.4117647, 1, 1,
0.1798381, -2.041484, 2.747445, 0, 0.4078431, 1, 1,
0.1801772, -0.9697401, 3.956773, 0, 0.4, 1, 1,
0.1839286, -1.427693, 3.258453, 0, 0.3921569, 1, 1,
0.1856064, -1.041538, 4.124625, 0, 0.3882353, 1, 1,
0.1864073, -0.1899682, 1.516855, 0, 0.3803922, 1, 1,
0.1880631, 0.2301848, -0.4333992, 0, 0.3764706, 1, 1,
0.1883738, -1.10898, 3.108192, 0, 0.3686275, 1, 1,
0.1908363, -0.008222284, 1.858449, 0, 0.3647059, 1, 1,
0.1946219, -1.865593, 4.47497, 0, 0.3568628, 1, 1,
0.197106, -1.007799, 3.754328, 0, 0.3529412, 1, 1,
0.2006819, -0.1551675, 2.188767, 0, 0.345098, 1, 1,
0.2040705, 0.9728439, 0.9666446, 0, 0.3411765, 1, 1,
0.205616, -1.217058, 4.063656, 0, 0.3333333, 1, 1,
0.2112586, -1.188217, 4.468894, 0, 0.3294118, 1, 1,
0.2157705, -0.956766, 4.582305, 0, 0.3215686, 1, 1,
0.2186152, 0.02349015, 1.736439, 0, 0.3176471, 1, 1,
0.2210245, -2.84678, 0.9225495, 0, 0.3098039, 1, 1,
0.2240972, 1.238597, 0.8484793, 0, 0.3058824, 1, 1,
0.22678, 0.6524432, 1.54784, 0, 0.2980392, 1, 1,
0.2301628, 0.3790106, 0.8807503, 0, 0.2901961, 1, 1,
0.2332021, 0.4020838, 0.08221514, 0, 0.2862745, 1, 1,
0.2430534, 1.116004, 1.365859, 0, 0.2784314, 1, 1,
0.247211, 1.023592, 0.7424916, 0, 0.2745098, 1, 1,
0.2521538, -1.163613, 1.55851, 0, 0.2666667, 1, 1,
0.2540157, -0.3121198, 2.989699, 0, 0.2627451, 1, 1,
0.2553763, -1.226755, 4.311948, 0, 0.254902, 1, 1,
0.2590226, -0.2258963, 1.911127, 0, 0.2509804, 1, 1,
0.2595367, -1.94619, 2.637373, 0, 0.2431373, 1, 1,
0.2599128, -1.198606, 3.105577, 0, 0.2392157, 1, 1,
0.263215, -0.00230583, 0.9330001, 0, 0.2313726, 1, 1,
0.2634026, -0.4120839, 4.41746, 0, 0.227451, 1, 1,
0.2634955, -1.24525, 2.834553, 0, 0.2196078, 1, 1,
0.2642008, 2.051284, -0.4692674, 0, 0.2156863, 1, 1,
0.2649523, 0.1937525, -0.4701943, 0, 0.2078431, 1, 1,
0.2651899, -0.7317582, 1.831868, 0, 0.2039216, 1, 1,
0.2676947, 0.2079612, 1.581357, 0, 0.1960784, 1, 1,
0.2716912, -0.3384133, 1.917748, 0, 0.1882353, 1, 1,
0.2736155, -1.063014, 2.105307, 0, 0.1843137, 1, 1,
0.27538, -0.5924349, 4.185195, 0, 0.1764706, 1, 1,
0.2926405, 0.5717925, 1.210299, 0, 0.172549, 1, 1,
0.292937, -0.2421104, 2.574785, 0, 0.1647059, 1, 1,
0.2951563, -0.1461355, 3.458524, 0, 0.1607843, 1, 1,
0.2967546, 0.2532966, 2.961843, 0, 0.1529412, 1, 1,
0.2970211, -0.7607217, 2.010946, 0, 0.1490196, 1, 1,
0.3062125, -0.009326743, 2.421445, 0, 0.1411765, 1, 1,
0.3098375, -1.197492, 2.4387, 0, 0.1372549, 1, 1,
0.310227, -1.630972, 2.419132, 0, 0.1294118, 1, 1,
0.31374, -1.813928, 2.687248, 0, 0.1254902, 1, 1,
0.3159945, -0.06580434, 2.210084, 0, 0.1176471, 1, 1,
0.319441, 0.1108574, 0.34755, 0, 0.1137255, 1, 1,
0.3201433, -2.121702, 2.409797, 0, 0.1058824, 1, 1,
0.3230799, 1.688226, -0.5384289, 0, 0.09803922, 1, 1,
0.3252769, 0.4301001, 0.7389082, 0, 0.09411765, 1, 1,
0.3291713, -0.5411589, 2.081208, 0, 0.08627451, 1, 1,
0.3363153, 0.3471828, 1.265743, 0, 0.08235294, 1, 1,
0.3383218, 1.317364, 2.76404, 0, 0.07450981, 1, 1,
0.3390056, -2.204158, 2.447894, 0, 0.07058824, 1, 1,
0.3397289, 1.487579, 0.6587557, 0, 0.0627451, 1, 1,
0.3467184, 0.242975, 1.191564, 0, 0.05882353, 1, 1,
0.3478041, -0.6117896, 2.5468, 0, 0.05098039, 1, 1,
0.3524653, -0.2446757, 1.907191, 0, 0.04705882, 1, 1,
0.3546126, -0.9073067, 1.494625, 0, 0.03921569, 1, 1,
0.3580486, 0.9264551, 1.856295, 0, 0.03529412, 1, 1,
0.3589366, -1.472702, 1.761425, 0, 0.02745098, 1, 1,
0.3592049, -0.3591453, 1.983834, 0, 0.02352941, 1, 1,
0.3648485, -0.6358113, 1.299141, 0, 0.01568628, 1, 1,
0.3674419, -0.5423214, 1.432644, 0, 0.01176471, 1, 1,
0.3702545, 0.7971519, 1.11003, 0, 0.003921569, 1, 1,
0.3752353, 0.1970018, 0.06259541, 0.003921569, 0, 1, 1,
0.3795061, -0.832862, 3.806107, 0.007843138, 0, 1, 1,
0.3802423, 0.09509255, 1.882522, 0.01568628, 0, 1, 1,
0.3805614, -0.4017846, 0.7007028, 0.01960784, 0, 1, 1,
0.3819583, 0.420462, 0.7694713, 0.02745098, 0, 1, 1,
0.385107, -0.3708144, 1.616328, 0.03137255, 0, 1, 1,
0.3857927, 0.3929932, 1.226664, 0.03921569, 0, 1, 1,
0.3864649, 0.03410642, 0.8611956, 0.04313726, 0, 1, 1,
0.3887686, 0.243679, 0.9332173, 0.05098039, 0, 1, 1,
0.3891764, -1.739085, 3.108484, 0.05490196, 0, 1, 1,
0.3916831, 0.9465899, 1.535344, 0.0627451, 0, 1, 1,
0.3929827, -0.2315757, 3.160444, 0.06666667, 0, 1, 1,
0.3945876, -1.894758, 4.210049, 0.07450981, 0, 1, 1,
0.4006111, -1.533027, 2.350003, 0.07843138, 0, 1, 1,
0.4040644, -0.3380094, 3.177417, 0.08627451, 0, 1, 1,
0.4067939, 0.6017835, -0.2881768, 0.09019608, 0, 1, 1,
0.407132, 1.145262, 0.2727833, 0.09803922, 0, 1, 1,
0.4089267, -1.55211, 2.387945, 0.1058824, 0, 1, 1,
0.4095332, -0.6813655, 0.8241698, 0.1098039, 0, 1, 1,
0.4129601, 0.824151, -0.4902804, 0.1176471, 0, 1, 1,
0.4143322, -0.4026125, 1.965569, 0.1215686, 0, 1, 1,
0.4162995, -2.471222, 3.213155, 0.1294118, 0, 1, 1,
0.4226065, 0.08300466, 1.401538, 0.1333333, 0, 1, 1,
0.4246498, -0.9785985, 3.689288, 0.1411765, 0, 1, 1,
0.4254254, 0.2031642, 2.269359, 0.145098, 0, 1, 1,
0.4260955, -1.839532, 0.3165525, 0.1529412, 0, 1, 1,
0.4265735, -0.1857727, 2.332275, 0.1568628, 0, 1, 1,
0.428231, -0.3993811, 0.4672606, 0.1647059, 0, 1, 1,
0.4284401, -0.3359925, 1.310092, 0.1686275, 0, 1, 1,
0.4354305, 0.154009, 0.6734721, 0.1764706, 0, 1, 1,
0.4361914, -1.698599, 3.883012, 0.1803922, 0, 1, 1,
0.4400885, -0.1530466, 2.443101, 0.1882353, 0, 1, 1,
0.4404297, 0.3475359, 1.516643, 0.1921569, 0, 1, 1,
0.4450229, -1.43069, 2.601238, 0.2, 0, 1, 1,
0.4454225, 1.202349, -0.3043216, 0.2078431, 0, 1, 1,
0.4455227, 1.616204, -0.6567123, 0.2117647, 0, 1, 1,
0.4470488, -1.223607, 3.21607, 0.2196078, 0, 1, 1,
0.4539374, -0.5099559, 1.84965, 0.2235294, 0, 1, 1,
0.4551592, -1.806261, 5.559289, 0.2313726, 0, 1, 1,
0.4595024, -0.09183079, 0.2315158, 0.2352941, 0, 1, 1,
0.4597317, 0.3232785, 1.258686, 0.2431373, 0, 1, 1,
0.4619268, -0.7416819, 3.338727, 0.2470588, 0, 1, 1,
0.4633036, -0.3712367, 1.808275, 0.254902, 0, 1, 1,
0.4635706, -0.2645548, 2.295735, 0.2588235, 0, 1, 1,
0.4673827, 0.3976103, 0.4073521, 0.2666667, 0, 1, 1,
0.4715071, 0.4784377, 0.3480618, 0.2705882, 0, 1, 1,
0.4764726, -1.8404, 2.144229, 0.2784314, 0, 1, 1,
0.4770507, -0.4912645, 3.3878, 0.282353, 0, 1, 1,
0.4821729, 1.346383, -0.7024432, 0.2901961, 0, 1, 1,
0.4914218, -0.497695, 1.992769, 0.2941177, 0, 1, 1,
0.4925878, 0.8954622, 1.156838, 0.3019608, 0, 1, 1,
0.4931198, -2.246708, 3.404087, 0.3098039, 0, 1, 1,
0.494195, -0.8180259, 2.047183, 0.3137255, 0, 1, 1,
0.4945144, 1.229585, 0.8262093, 0.3215686, 0, 1, 1,
0.498603, -1.025041, 2.618441, 0.3254902, 0, 1, 1,
0.5054343, -0.4230566, 1.077013, 0.3333333, 0, 1, 1,
0.5107318, -1.18278, 2.165796, 0.3372549, 0, 1, 1,
0.5123551, -0.6420967, 3.584803, 0.345098, 0, 1, 1,
0.5178713, 0.5013115, 0.447531, 0.3490196, 0, 1, 1,
0.521452, 1.080932, 1.19905, 0.3568628, 0, 1, 1,
0.5277779, 1.269385, 0.1258806, 0.3607843, 0, 1, 1,
0.5300403, 0.1722554, 2.345683, 0.3686275, 0, 1, 1,
0.5310788, 0.3356925, -1.02064, 0.372549, 0, 1, 1,
0.5362365, 1.590922, 1.776011, 0.3803922, 0, 1, 1,
0.5383497, 0.9078697, -0.5567821, 0.3843137, 0, 1, 1,
0.5410011, -1.602395, 1.44262, 0.3921569, 0, 1, 1,
0.5419194, 1.768252, 1.038679, 0.3960784, 0, 1, 1,
0.5445279, -0.5391183, 3.096534, 0.4039216, 0, 1, 1,
0.5470255, 0.9567663, -0.2790599, 0.4117647, 0, 1, 1,
0.5505737, -0.3599429, 1.399195, 0.4156863, 0, 1, 1,
0.5520739, 0.2225292, 2.756192, 0.4235294, 0, 1, 1,
0.5563945, -0.4427789, 1.433959, 0.427451, 0, 1, 1,
0.5589631, 0.2038114, 0.9367256, 0.4352941, 0, 1, 1,
0.5606119, 1.01405, 0.1591718, 0.4392157, 0, 1, 1,
0.5636917, 1.437343, 0.2219174, 0.4470588, 0, 1, 1,
0.5647699, 0.4947348, -1.789875, 0.4509804, 0, 1, 1,
0.5726344, -1.10303, 4.848283, 0.4588235, 0, 1, 1,
0.5739046, 1.29375, 0.5266426, 0.4627451, 0, 1, 1,
0.5759068, -1.221582, 0.7592038, 0.4705882, 0, 1, 1,
0.5837611, -0.7200615, 2.059788, 0.4745098, 0, 1, 1,
0.5951556, -0.8548799, 2.164665, 0.4823529, 0, 1, 1,
0.5958725, 0.09001313, 2.226565, 0.4862745, 0, 1, 1,
0.5971931, 0.7013779, -0.1437157, 0.4941176, 0, 1, 1,
0.5999144, -0.6045202, 4.206165, 0.5019608, 0, 1, 1,
0.600642, -1.262713, 2.770412, 0.5058824, 0, 1, 1,
0.6063383, -0.03322786, 1.545265, 0.5137255, 0, 1, 1,
0.617807, 0.9904321, 2.586709, 0.5176471, 0, 1, 1,
0.6191463, 1.778469, 0.08903629, 0.5254902, 0, 1, 1,
0.6191543, -0.574671, 2.231528, 0.5294118, 0, 1, 1,
0.6251694, 0.7764304, 0.3745992, 0.5372549, 0, 1, 1,
0.6286684, -1.461964, -0.2927622, 0.5411765, 0, 1, 1,
0.6293678, 1.09385, 0.5270432, 0.5490196, 0, 1, 1,
0.632122, 1.750298, 0.7977929, 0.5529412, 0, 1, 1,
0.6325969, 0.2496896, -0.2740516, 0.5607843, 0, 1, 1,
0.633389, 2.663576, -0.1448938, 0.5647059, 0, 1, 1,
0.6362486, -1.46612, 4.124298, 0.572549, 0, 1, 1,
0.6363896, 0.2727588, 2.067063, 0.5764706, 0, 1, 1,
0.6393791, -0.2913994, 2.25894, 0.5843138, 0, 1, 1,
0.6410326, -0.4553022, 3.716122, 0.5882353, 0, 1, 1,
0.6465608, 0.05472231, 2.280813, 0.5960785, 0, 1, 1,
0.651385, -0.1915404, 0.3491479, 0.6039216, 0, 1, 1,
0.6525633, -0.2482641, 2.329689, 0.6078432, 0, 1, 1,
0.6532175, -0.311375, 0.3420894, 0.6156863, 0, 1, 1,
0.6539876, 1.715305, -2.013887, 0.6196079, 0, 1, 1,
0.6694661, 1.09375, -0.4051202, 0.627451, 0, 1, 1,
0.6778978, -0.8266128, 2.607708, 0.6313726, 0, 1, 1,
0.6809546, 0.0787578, 1.713444, 0.6392157, 0, 1, 1,
0.682083, 0.2318835, 1.735668, 0.6431373, 0, 1, 1,
0.6824267, -1.245333, 3.124139, 0.6509804, 0, 1, 1,
0.6838615, -0.6736373, 0.5055069, 0.654902, 0, 1, 1,
0.6908688, -0.2121522, 2.379056, 0.6627451, 0, 1, 1,
0.6909237, -0.1616457, 2.220718, 0.6666667, 0, 1, 1,
0.6984938, 0.5755787, 0.1407502, 0.6745098, 0, 1, 1,
0.6993453, 1.194978, -0.6346799, 0.6784314, 0, 1, 1,
0.7005453, 0.5271178, 1.035035, 0.6862745, 0, 1, 1,
0.7008567, -0.952175, 3.947462, 0.6901961, 0, 1, 1,
0.7043332, 2.074602, 0.0291761, 0.6980392, 0, 1, 1,
0.7052515, -0.4310447, 2.187123, 0.7058824, 0, 1, 1,
0.7076247, -0.1537641, 2.615152, 0.7098039, 0, 1, 1,
0.717898, 1.253414, 2.040538, 0.7176471, 0, 1, 1,
0.7181944, -0.9176269, 3.677771, 0.7215686, 0, 1, 1,
0.7182822, -0.02647013, 2.792385, 0.7294118, 0, 1, 1,
0.7186068, 0.6993265, 0.266221, 0.7333333, 0, 1, 1,
0.722008, 0.3553316, 2.807032, 0.7411765, 0, 1, 1,
0.7226295, 0.1246911, 1.646136, 0.7450981, 0, 1, 1,
0.722793, 0.8679905, 0.2244042, 0.7529412, 0, 1, 1,
0.724089, 3.228265, -1.186768, 0.7568628, 0, 1, 1,
0.7281464, -0.523298, 3.123021, 0.7647059, 0, 1, 1,
0.7304078, -0.0334345, 1.870122, 0.7686275, 0, 1, 1,
0.7379999, -1.163112, 4.005844, 0.7764706, 0, 1, 1,
0.738309, 0.4541941, 0.1134001, 0.7803922, 0, 1, 1,
0.739755, -0.4919567, 1.501667, 0.7882353, 0, 1, 1,
0.7474123, 0.6392651, -0.7029194, 0.7921569, 0, 1, 1,
0.7642084, 1.195484, 0.06660721, 0.8, 0, 1, 1,
0.7682384, 1.866673, -0.5915771, 0.8078431, 0, 1, 1,
0.7701133, -1.893207, 2.696011, 0.8117647, 0, 1, 1,
0.7730662, -0.7528574, 2.784804, 0.8196079, 0, 1, 1,
0.7758936, 0.690093, -1.233053, 0.8235294, 0, 1, 1,
0.7806834, -0.8252153, 3.57877, 0.8313726, 0, 1, 1,
0.7813413, 0.1638373, 1.631118, 0.8352941, 0, 1, 1,
0.7822974, 0.9481999, 0.5519304, 0.8431373, 0, 1, 1,
0.7916901, 0.8333859, -0.7433397, 0.8470588, 0, 1, 1,
0.7953985, -1.165825, 2.876116, 0.854902, 0, 1, 1,
0.7954659, -1.655481, 1.086562, 0.8588235, 0, 1, 1,
0.7985551, 0.9458549, 2.055046, 0.8666667, 0, 1, 1,
0.8029017, -0.9876432, 4.903556, 0.8705882, 0, 1, 1,
0.8076426, -1.165268, 2.160667, 0.8784314, 0, 1, 1,
0.8264761, -0.4182858, 1.964754, 0.8823529, 0, 1, 1,
0.8271611, -0.73987, 3.917089, 0.8901961, 0, 1, 1,
0.8280175, 0.2839944, 2.205482, 0.8941177, 0, 1, 1,
0.8319435, 0.871397, 0.139122, 0.9019608, 0, 1, 1,
0.8341942, 0.1702657, 1.937285, 0.9098039, 0, 1, 1,
0.8421478, 0.3698709, 1.919371, 0.9137255, 0, 1, 1,
0.8594781, 1.737481, 2.981428, 0.9215686, 0, 1, 1,
0.8623823, 0.9528503, 0.4008945, 0.9254902, 0, 1, 1,
0.8746775, -1.405048, 2.151803, 0.9333333, 0, 1, 1,
0.897132, 0.1379415, 0.4075418, 0.9372549, 0, 1, 1,
0.8976207, 0.08002262, 1.722803, 0.945098, 0, 1, 1,
0.8985384, -0.3772376, 2.070922, 0.9490196, 0, 1, 1,
0.9021649, 0.1997207, 0.9618908, 0.9568627, 0, 1, 1,
0.9027426, 2.014006, 1.579908, 0.9607843, 0, 1, 1,
0.9057109, -0.6473936, 1.770724, 0.9686275, 0, 1, 1,
0.9068295, -1.843427, 2.620557, 0.972549, 0, 1, 1,
0.9114613, 0.1906309, 1.662635, 0.9803922, 0, 1, 1,
0.9162374, -0.4164889, 1.774637, 0.9843137, 0, 1, 1,
0.9169278, -0.04341444, 1.181249, 0.9921569, 0, 1, 1,
0.9187787, -0.1756515, 2.16234, 0.9960784, 0, 1, 1,
0.9223068, 0.2975086, 0.6217114, 1, 0, 0.9960784, 1,
0.922535, 0.1541686, 0.4574447, 1, 0, 0.9882353, 1,
0.9246578, 0.4040079, 2.190652, 1, 0, 0.9843137, 1,
0.9278971, 1.350085, 0.8682846, 1, 0, 0.9764706, 1,
0.9309071, 1.101188, 3.277355, 1, 0, 0.972549, 1,
0.9382252, -0.3615844, 1.864599, 1, 0, 0.9647059, 1,
0.9424469, -2.169321, 1.821237, 1, 0, 0.9607843, 1,
0.9464063, -2.06126, 2.847331, 1, 0, 0.9529412, 1,
0.9479561, -0.4251615, 2.095639, 1, 0, 0.9490196, 1,
0.9494783, 0.831619, 1.401272, 1, 0, 0.9411765, 1,
0.9597057, -0.0122685, 2.278771, 1, 0, 0.9372549, 1,
0.9617693, 0.06203955, -0.07870659, 1, 0, 0.9294118, 1,
0.9697834, 0.8523765, 1.260404, 1, 0, 0.9254902, 1,
0.9702205, -0.5460429, 2.316097, 1, 0, 0.9176471, 1,
0.9709837, 0.656484, 1.843629, 1, 0, 0.9137255, 1,
0.9713669, 1.417539, 0.2101847, 1, 0, 0.9058824, 1,
0.9722749, -1.156322, 0.9109524, 1, 0, 0.9019608, 1,
0.9768121, 0.6278886, 2.329543, 1, 0, 0.8941177, 1,
0.9769239, -0.4418917, 1.518354, 1, 0, 0.8862745, 1,
0.9805666, 2.934416, 1.059186, 1, 0, 0.8823529, 1,
0.9829263, 0.2845057, 0.7606761, 1, 0, 0.8745098, 1,
0.9830981, -1.501611, 2.016297, 1, 0, 0.8705882, 1,
0.9841701, 1.687718, -0.2620323, 1, 0, 0.8627451, 1,
0.9854025, 0.9670733, 0.4142747, 1, 0, 0.8588235, 1,
1.000077, 0.2632205, 1.425221, 1, 0, 0.8509804, 1,
1.002433, -1.066686, 2.875946, 1, 0, 0.8470588, 1,
1.013099, -0.7467082, 2.798927, 1, 0, 0.8392157, 1,
1.013553, -0.009382299, 1.738633, 1, 0, 0.8352941, 1,
1.021283, -1.013162, 2.650097, 1, 0, 0.827451, 1,
1.035083, 0.9487488, 0.4649419, 1, 0, 0.8235294, 1,
1.038926, 1.050257, 0.5829322, 1, 0, 0.8156863, 1,
1.041357, -1.851534, 1.661226, 1, 0, 0.8117647, 1,
1.042077, -0.4215448, 0.4541982, 1, 0, 0.8039216, 1,
1.049036, 0.4734946, 1.11453, 1, 0, 0.7960784, 1,
1.049774, -0.1346959, 1.598676, 1, 0, 0.7921569, 1,
1.062526, 0.5884083, 1.127987, 1, 0, 0.7843137, 1,
1.064, 0.1436175, 1.676731, 1, 0, 0.7803922, 1,
1.067842, -0.2917172, 1.678964, 1, 0, 0.772549, 1,
1.069554, 0.05900692, 3.956293, 1, 0, 0.7686275, 1,
1.076735, -0.6988906, 2.608136, 1, 0, 0.7607843, 1,
1.08773, -0.436612, 1.93038, 1, 0, 0.7568628, 1,
1.090608, 1.90627, 1.571182, 1, 0, 0.7490196, 1,
1.097144, -0.0658505, 1.054295, 1, 0, 0.7450981, 1,
1.100764, 0.5801781, 0.7793055, 1, 0, 0.7372549, 1,
1.104263, 0.2422784, 1.107459, 1, 0, 0.7333333, 1,
1.107029, -0.6691628, 2.352836, 1, 0, 0.7254902, 1,
1.109927, 0.8218562, 0.5662481, 1, 0, 0.7215686, 1,
1.110066, -1.35308, 2.564245, 1, 0, 0.7137255, 1,
1.119678, -0.8247331, 1.686536, 1, 0, 0.7098039, 1,
1.126203, 0.7811641, 0.9932945, 1, 0, 0.7019608, 1,
1.12923, 1.310678, 0.5597841, 1, 0, 0.6941177, 1,
1.134179, -0.1788777, 1.352488, 1, 0, 0.6901961, 1,
1.136069, 0.8734882, 2.417495, 1, 0, 0.682353, 1,
1.143896, -0.600731, 2.811663, 1, 0, 0.6784314, 1,
1.149969, 0.4196706, -0.5455443, 1, 0, 0.6705883, 1,
1.159209, -0.3103175, 1.124808, 1, 0, 0.6666667, 1,
1.165069, 0.02817823, 1.577711, 1, 0, 0.6588235, 1,
1.168685, -0.5924428, 1.539468, 1, 0, 0.654902, 1,
1.169453, 0.1797176, 2.184338, 1, 0, 0.6470588, 1,
1.173321, -1.05709, 0.765365, 1, 0, 0.6431373, 1,
1.178021, 0.6763228, 1.149171, 1, 0, 0.6352941, 1,
1.188044, -0.4066576, 3.297553, 1, 0, 0.6313726, 1,
1.19407, -1.238951, 1.774655, 1, 0, 0.6235294, 1,
1.196689, -0.5122531, 3.043995, 1, 0, 0.6196079, 1,
1.198667, -0.643878, 3.580446, 1, 0, 0.6117647, 1,
1.199091, 0.1817084, 1.392478, 1, 0, 0.6078432, 1,
1.199865, -0.7113898, 2.730249, 1, 0, 0.6, 1,
1.201428, -0.6258135, 2.625454, 1, 0, 0.5921569, 1,
1.218845, 0.2735502, 1.956009, 1, 0, 0.5882353, 1,
1.227886, 1.597559, 0.8174369, 1, 0, 0.5803922, 1,
1.235197, 1.019713, -0.2237201, 1, 0, 0.5764706, 1,
1.235917, 0.6168513, 1.367343, 1, 0, 0.5686275, 1,
1.237473, 1.748427, 1.293852, 1, 0, 0.5647059, 1,
1.238428, 0.1056278, 1.147759, 1, 0, 0.5568628, 1,
1.238906, -0.1124178, 2.235386, 1, 0, 0.5529412, 1,
1.242408, -0.7956083, 1.395855, 1, 0, 0.5450981, 1,
1.242542, -0.0255507, 0.8059848, 1, 0, 0.5411765, 1,
1.245867, -0.3905094, 1.428524, 1, 0, 0.5333334, 1,
1.249652, -0.9276661, 1.810241, 1, 0, 0.5294118, 1,
1.250644, 0.5015196, 0.7443112, 1, 0, 0.5215687, 1,
1.251029, -0.2244271, 1.310079, 1, 0, 0.5176471, 1,
1.252823, 0.03930187, 1.260864, 1, 0, 0.509804, 1,
1.254794, -0.7971329, 1.545994, 1, 0, 0.5058824, 1,
1.256993, -1.022111, 3.441692, 1, 0, 0.4980392, 1,
1.262139, -0.1905826, 1.314008, 1, 0, 0.4901961, 1,
1.269463, -1.163137, 0.9160014, 1, 0, 0.4862745, 1,
1.27323, 1.838726, 1.805466, 1, 0, 0.4784314, 1,
1.284241, -0.8523184, 1.415518, 1, 0, 0.4745098, 1,
1.289319, -0.7974239, 3.514804, 1, 0, 0.4666667, 1,
1.296658, 0.1613902, 2.079777, 1, 0, 0.4627451, 1,
1.307556, 0.3952278, -0.1934237, 1, 0, 0.454902, 1,
1.309081, -1.384891, 1.398451, 1, 0, 0.4509804, 1,
1.310349, 1.653307, 2.836078, 1, 0, 0.4431373, 1,
1.341226, -0.8301617, 2.038047, 1, 0, 0.4392157, 1,
1.345318, -0.9876186, 1.991324, 1, 0, 0.4313726, 1,
1.348168, -0.9603391, 1.443155, 1, 0, 0.427451, 1,
1.350421, -0.6588036, 1.427703, 1, 0, 0.4196078, 1,
1.362095, -0.3560981, 1.347856, 1, 0, 0.4156863, 1,
1.375047, 0.8815374, 0.3953849, 1, 0, 0.4078431, 1,
1.376653, -0.1944775, 0.917502, 1, 0, 0.4039216, 1,
1.378372, 0.1340363, 1.376015, 1, 0, 0.3960784, 1,
1.388273, -0.2383936, 1.631118, 1, 0, 0.3882353, 1,
1.395941, -1.321613, 1.475661, 1, 0, 0.3843137, 1,
1.397167, -0.4446139, 1.182052, 1, 0, 0.3764706, 1,
1.398419, -1.751384, 2.338122, 1, 0, 0.372549, 1,
1.408873, -1.184583, 3.717816, 1, 0, 0.3647059, 1,
1.417311, 1.03943, 1.607086, 1, 0, 0.3607843, 1,
1.432976, 0.4121785, 1.86448, 1, 0, 0.3529412, 1,
1.435368, 0.1473314, 0.5444034, 1, 0, 0.3490196, 1,
1.440258, 0.8424395, 2.36006, 1, 0, 0.3411765, 1,
1.452716, 1.344061, 1.647723, 1, 0, 0.3372549, 1,
1.455797, -0.8483524, 1.998235, 1, 0, 0.3294118, 1,
1.476329, -0.4293569, 1.570337, 1, 0, 0.3254902, 1,
1.480612, 0.492118, 0.3213492, 1, 0, 0.3176471, 1,
1.499832, 0.05903148, 2.436017, 1, 0, 0.3137255, 1,
1.540585, -0.1179056, 1.900419, 1, 0, 0.3058824, 1,
1.553298, 2.486479, -2.318284, 1, 0, 0.2980392, 1,
1.554897, 1.236471, 0.7843067, 1, 0, 0.2941177, 1,
1.555612, -0.584053, 1.396324, 1, 0, 0.2862745, 1,
1.572034, -1.500769, 2.158659, 1, 0, 0.282353, 1,
1.581644, -1.233239, 4.445764, 1, 0, 0.2745098, 1,
1.585584, -0.1649961, 2.575372, 1, 0, 0.2705882, 1,
1.604752, 0.4820209, 0.3179865, 1, 0, 0.2627451, 1,
1.605916, 1.414207, 1.148793, 1, 0, 0.2588235, 1,
1.609597, 0.9688068, 1.844058, 1, 0, 0.2509804, 1,
1.616363, 0.8620561, 1.919154, 1, 0, 0.2470588, 1,
1.62356, 1.332333, 2.588721, 1, 0, 0.2392157, 1,
1.633941, 1.204277, 1.085591, 1, 0, 0.2352941, 1,
1.660875, -1.373649, 3.359138, 1, 0, 0.227451, 1,
1.671627, -0.12943, 1.667919, 1, 0, 0.2235294, 1,
1.76406, -0.885679, 1.730243, 1, 0, 0.2156863, 1,
1.789005, -0.2630639, 2.408625, 1, 0, 0.2117647, 1,
1.830022, 0.31014, 0.4443693, 1, 0, 0.2039216, 1,
1.873137, -1.240753, 1.053259, 1, 0, 0.1960784, 1,
1.877145, -1.289973, 1.753357, 1, 0, 0.1921569, 1,
1.882621, -0.09891295, 2.69618, 1, 0, 0.1843137, 1,
1.882816, 1.442968, 0.5362909, 1, 0, 0.1803922, 1,
1.918494, -0.7648233, 3.019223, 1, 0, 0.172549, 1,
1.923541, 1.405272, 3.010818, 1, 0, 0.1686275, 1,
1.94214, -0.4742, -0.2271343, 1, 0, 0.1607843, 1,
1.951743, -1.264996, 2.485685, 1, 0, 0.1568628, 1,
1.952051, -0.5006584, 1.962796, 1, 0, 0.1490196, 1,
1.972339, -1.43072, 1.303153, 1, 0, 0.145098, 1,
1.984657, 0.007253899, 1.627552, 1, 0, 0.1372549, 1,
2.04038, 0.1193055, 2.138669, 1, 0, 0.1333333, 1,
2.11833, -1.851818, 4.252573, 1, 0, 0.1254902, 1,
2.135361, -1.451655, 1.80026, 1, 0, 0.1215686, 1,
2.145257, 0.4986189, 0.98575, 1, 0, 0.1137255, 1,
2.159432, -0.6194218, 0.4602539, 1, 0, 0.1098039, 1,
2.160452, -0.941585, 2.227967, 1, 0, 0.1019608, 1,
2.262604, 1.177972, 2.024229, 1, 0, 0.09411765, 1,
2.264669, -0.3478921, 0.6358989, 1, 0, 0.09019608, 1,
2.267886, 1.069366, 3.113332, 1, 0, 0.08235294, 1,
2.304616, 0.008198894, 4.827466, 1, 0, 0.07843138, 1,
2.333697, 0.680445, 2.33813, 1, 0, 0.07058824, 1,
2.420877, -0.6323388, 0.6244928, 1, 0, 0.06666667, 1,
2.467137, 0.9261357, 1.758251, 1, 0, 0.05882353, 1,
2.549453, 0.4607669, 0.3257186, 1, 0, 0.05490196, 1,
2.598237, -0.05359981, 1.796402, 1, 0, 0.04705882, 1,
2.715501, -0.7026393, 2.253923, 1, 0, 0.04313726, 1,
2.885089, -0.1622229, 0.9077607, 1, 0, 0.03529412, 1,
2.956614, 0.9351915, 1.770645, 1, 0, 0.03137255, 1,
3.000897, 0.4025824, 1.401784, 1, 0, 0.02352941, 1,
3.048723, -0.4322541, 2.761308, 1, 0, 0.01960784, 1,
3.116135, -0.1131478, 2.00761, 1, 0, 0.01176471, 1,
3.117632, 0.9567037, 0.3274525, 1, 0, 0.007843138, 1
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
-0.0609889, -5.020072, -7.515733, 0, -0.5, 0.5, 0.5,
-0.0609889, -5.020072, -7.515733, 1, -0.5, 0.5, 0.5,
-0.0609889, -5.020072, -7.515733, 1, 1.5, 0.5, 0.5,
-0.0609889, -5.020072, -7.515733, 0, 1.5, 0.5, 0.5
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
-4.317163, -0.2981725, -7.515733, 0, -0.5, 0.5, 0.5,
-4.317163, -0.2981725, -7.515733, 1, -0.5, 0.5, 0.5,
-4.317163, -0.2981725, -7.515733, 1, 1.5, 0.5, 0.5,
-4.317163, -0.2981725, -7.515733, 0, 1.5, 0.5, 0.5
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
-4.317163, -5.020072, -0.03071594, 0, -0.5, 0.5, 0.5,
-4.317163, -5.020072, -0.03071594, 1, -0.5, 0.5, 0.5,
-4.317163, -5.020072, -0.03071594, 1, 1.5, 0.5, 0.5,
-4.317163, -5.020072, -0.03071594, 0, 1.5, 0.5, 0.5
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
-3, -3.930403, -5.788421,
3, -3.930403, -5.788421,
-3, -3.930403, -5.788421,
-3, -4.112015, -6.076306,
-2, -3.930403, -5.788421,
-2, -4.112015, -6.076306,
-1, -3.930403, -5.788421,
-1, -4.112015, -6.076306,
0, -3.930403, -5.788421,
0, -4.112015, -6.076306,
1, -3.930403, -5.788421,
1, -4.112015, -6.076306,
2, -3.930403, -5.788421,
2, -4.112015, -6.076306,
3, -3.930403, -5.788421,
3, -4.112015, -6.076306
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
-3, -4.475238, -6.652077, 0, -0.5, 0.5, 0.5,
-3, -4.475238, -6.652077, 1, -0.5, 0.5, 0.5,
-3, -4.475238, -6.652077, 1, 1.5, 0.5, 0.5,
-3, -4.475238, -6.652077, 0, 1.5, 0.5, 0.5,
-2, -4.475238, -6.652077, 0, -0.5, 0.5, 0.5,
-2, -4.475238, -6.652077, 1, -0.5, 0.5, 0.5,
-2, -4.475238, -6.652077, 1, 1.5, 0.5, 0.5,
-2, -4.475238, -6.652077, 0, 1.5, 0.5, 0.5,
-1, -4.475238, -6.652077, 0, -0.5, 0.5, 0.5,
-1, -4.475238, -6.652077, 1, -0.5, 0.5, 0.5,
-1, -4.475238, -6.652077, 1, 1.5, 0.5, 0.5,
-1, -4.475238, -6.652077, 0, 1.5, 0.5, 0.5,
0, -4.475238, -6.652077, 0, -0.5, 0.5, 0.5,
0, -4.475238, -6.652077, 1, -0.5, 0.5, 0.5,
0, -4.475238, -6.652077, 1, 1.5, 0.5, 0.5,
0, -4.475238, -6.652077, 0, 1.5, 0.5, 0.5,
1, -4.475238, -6.652077, 0, -0.5, 0.5, 0.5,
1, -4.475238, -6.652077, 1, -0.5, 0.5, 0.5,
1, -4.475238, -6.652077, 1, 1.5, 0.5, 0.5,
1, -4.475238, -6.652077, 0, 1.5, 0.5, 0.5,
2, -4.475238, -6.652077, 0, -0.5, 0.5, 0.5,
2, -4.475238, -6.652077, 1, -0.5, 0.5, 0.5,
2, -4.475238, -6.652077, 1, 1.5, 0.5, 0.5,
2, -4.475238, -6.652077, 0, 1.5, 0.5, 0.5,
3, -4.475238, -6.652077, 0, -0.5, 0.5, 0.5,
3, -4.475238, -6.652077, 1, -0.5, 0.5, 0.5,
3, -4.475238, -6.652077, 1, 1.5, 0.5, 0.5,
3, -4.475238, -6.652077, 0, 1.5, 0.5, 0.5
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
-3.334969, -2, -5.788421,
-3.334969, 2, -5.788421,
-3.334969, -2, -5.788421,
-3.498668, -2, -6.076306,
-3.334969, 0, -5.788421,
-3.498668, 0, -6.076306,
-3.334969, 2, -5.788421,
-3.498668, 2, -6.076306
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
-3.826066, -2, -6.652077, 0, -0.5, 0.5, 0.5,
-3.826066, -2, -6.652077, 1, -0.5, 0.5, 0.5,
-3.826066, -2, -6.652077, 1, 1.5, 0.5, 0.5,
-3.826066, -2, -6.652077, 0, 1.5, 0.5, 0.5,
-3.826066, 0, -6.652077, 0, -0.5, 0.5, 0.5,
-3.826066, 0, -6.652077, 1, -0.5, 0.5, 0.5,
-3.826066, 0, -6.652077, 1, 1.5, 0.5, 0.5,
-3.826066, 0, -6.652077, 0, 1.5, 0.5, 0.5,
-3.826066, 2, -6.652077, 0, -0.5, 0.5, 0.5,
-3.826066, 2, -6.652077, 1, -0.5, 0.5, 0.5,
-3.826066, 2, -6.652077, 1, 1.5, 0.5, 0.5,
-3.826066, 2, -6.652077, 0, 1.5, 0.5, 0.5
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
-3.334969, -3.930403, -4,
-3.334969, -3.930403, 4,
-3.334969, -3.930403, -4,
-3.498668, -4.112015, -4,
-3.334969, -3.930403, -2,
-3.498668, -4.112015, -2,
-3.334969, -3.930403, 0,
-3.498668, -4.112015, 0,
-3.334969, -3.930403, 2,
-3.498668, -4.112015, 2,
-3.334969, -3.930403, 4,
-3.498668, -4.112015, 4
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
-3.826066, -4.475238, -4, 0, -0.5, 0.5, 0.5,
-3.826066, -4.475238, -4, 1, -0.5, 0.5, 0.5,
-3.826066, -4.475238, -4, 1, 1.5, 0.5, 0.5,
-3.826066, -4.475238, -4, 0, 1.5, 0.5, 0.5,
-3.826066, -4.475238, -2, 0, -0.5, 0.5, 0.5,
-3.826066, -4.475238, -2, 1, -0.5, 0.5, 0.5,
-3.826066, -4.475238, -2, 1, 1.5, 0.5, 0.5,
-3.826066, -4.475238, -2, 0, 1.5, 0.5, 0.5,
-3.826066, -4.475238, 0, 0, -0.5, 0.5, 0.5,
-3.826066, -4.475238, 0, 1, -0.5, 0.5, 0.5,
-3.826066, -4.475238, 0, 1, 1.5, 0.5, 0.5,
-3.826066, -4.475238, 0, 0, 1.5, 0.5, 0.5,
-3.826066, -4.475238, 2, 0, -0.5, 0.5, 0.5,
-3.826066, -4.475238, 2, 1, -0.5, 0.5, 0.5,
-3.826066, -4.475238, 2, 1, 1.5, 0.5, 0.5,
-3.826066, -4.475238, 2, 0, 1.5, 0.5, 0.5,
-3.826066, -4.475238, 4, 0, -0.5, 0.5, 0.5,
-3.826066, -4.475238, 4, 1, -0.5, 0.5, 0.5,
-3.826066, -4.475238, 4, 1, 1.5, 0.5, 0.5,
-3.826066, -4.475238, 4, 0, 1.5, 0.5, 0.5
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
-3.334969, -3.930403, -5.788421,
-3.334969, 3.334059, -5.788421,
-3.334969, -3.930403, 5.726989,
-3.334969, 3.334059, 5.726989,
-3.334969, -3.930403, -5.788421,
-3.334969, -3.930403, 5.726989,
-3.334969, 3.334059, -5.788421,
-3.334969, 3.334059, 5.726989,
-3.334969, -3.930403, -5.788421,
3.212991, -3.930403, -5.788421,
-3.334969, -3.930403, 5.726989,
3.212991, -3.930403, 5.726989,
-3.334969, 3.334059, -5.788421,
3.212991, 3.334059, -5.788421,
-3.334969, 3.334059, 5.726989,
3.212991, 3.334059, 5.726989,
3.212991, -3.930403, -5.788421,
3.212991, 3.334059, -5.788421,
3.212991, -3.930403, 5.726989,
3.212991, 3.334059, 5.726989,
3.212991, -3.930403, -5.788421,
3.212991, -3.930403, 5.726989,
3.212991, 3.334059, -5.788421,
3.212991, 3.334059, 5.726989
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
var radius = 8.0674;
var distance = 35.89278;
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
mvMatrix.translate( 0.0609889, 0.2981725, 0.03071594 );
mvMatrix.scale( 1.332114, 1.200726, 0.7574746 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.89278);
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
Gencor<-read.table("Gencor.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Gencor$V2
```

```
## Error in eval(expr, envir, enclos): object 'Gencor' not found
```

```r
y<-Gencor$V3
```

```
## Error in eval(expr, envir, enclos): object 'Gencor' not found
```

```r
z<-Gencor$V4
```

```
## Error in eval(expr, envir, enclos): object 'Gencor' not found
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
-3.23961, 0.1854705, -2.187503, 0, 0, 1, 1, 1,
-3.092695, -0.994742, -2.136685, 1, 0, 0, 1, 1,
-3.031171, -1.021372, -1.387689, 1, 0, 0, 1, 1,
-2.931784, 0.1551397, 0.03756348, 1, 0, 0, 1, 1,
-2.914284, -0.784505, -0.9188645, 1, 0, 0, 1, 1,
-2.756075, -0.04311782, -2.446522, 1, 0, 0, 1, 1,
-2.716254, 0.9420914, -0.8067921, 0, 0, 0, 1, 1,
-2.683735, -0.1286045, -1.450486, 0, 0, 0, 1, 1,
-2.672805, 0.9191725, -1.302656, 0, 0, 0, 1, 1,
-2.668093, 1.154452, -1.564207, 0, 0, 0, 1, 1,
-2.42897, 0.852453, 1.081034, 0, 0, 0, 1, 1,
-2.407638, 0.1033231, -1.109971, 0, 0, 0, 1, 1,
-2.376398, -0.3629639, -1.363738, 0, 0, 0, 1, 1,
-2.349992, -0.1397107, -3.540298, 1, 1, 1, 1, 1,
-2.33937, 0.1108218, 0.07259035, 1, 1, 1, 1, 1,
-2.281642, 0.5803944, -1.584367, 1, 1, 1, 1, 1,
-2.240211, -0.471665, -2.832618, 1, 1, 1, 1, 1,
-2.196764, 1.562073, -0.03457877, 1, 1, 1, 1, 1,
-2.172113, 1.431925, 0.3658638, 1, 1, 1, 1, 1,
-2.158457, -0.4680772, -2.466406, 1, 1, 1, 1, 1,
-2.153042, 1.397753, -1.73658, 1, 1, 1, 1, 1,
-2.118083, -0.0552717, -2.577642, 1, 1, 1, 1, 1,
-2.066574, -1.264114, -1.608744, 1, 1, 1, 1, 1,
-2.024654, -0.8943109, -0.3609746, 1, 1, 1, 1, 1,
-2.008884, 0.09693236, -1.998195, 1, 1, 1, 1, 1,
-1.993371, 0.3003486, -1.237566, 1, 1, 1, 1, 1,
-1.993086, -0.2162171, -1.834985, 1, 1, 1, 1, 1,
-1.983386, 0.1337271, -3.286615, 1, 1, 1, 1, 1,
-1.982412, 0.9807785, -1.643659, 0, 0, 1, 1, 1,
-1.979521, 2.900321, -0.7956719, 1, 0, 0, 1, 1,
-1.96264, 0.2566397, -1.251694, 1, 0, 0, 1, 1,
-1.910761, 0.474324, -3.299727, 1, 0, 0, 1, 1,
-1.90308, 1.622588, 1.125851, 1, 0, 0, 1, 1,
-1.893711, 0.6063145, -2.148667, 1, 0, 0, 1, 1,
-1.870187, 1.551361, -0.7147803, 0, 0, 0, 1, 1,
-1.854964, -0.5518899, -1.507365, 0, 0, 0, 1, 1,
-1.840275, 0.3888216, -1.056658, 0, 0, 0, 1, 1,
-1.813652, 1.281664, -2.227149, 0, 0, 0, 1, 1,
-1.794671, 0.4680179, -1.272759, 0, 0, 0, 1, 1,
-1.789553, -0.4815059, -3.144316, 0, 0, 0, 1, 1,
-1.746684, 1.591337, -1.671809, 0, 0, 0, 1, 1,
-1.744964, -2.431506, -3.249274, 1, 1, 1, 1, 1,
-1.7382, -1.696938, -0.3630087, 1, 1, 1, 1, 1,
-1.731724, -0.6782631, -1.684819, 1, 1, 1, 1, 1,
-1.727812, -0.5232683, -3.473433, 1, 1, 1, 1, 1,
-1.722027, -0.2771777, -1.546851, 1, 1, 1, 1, 1,
-1.721764, 0.5498213, -2.058831, 1, 1, 1, 1, 1,
-1.714654, -1.016454, -0.8503704, 1, 1, 1, 1, 1,
-1.711795, -1.780026, -2.484187, 1, 1, 1, 1, 1,
-1.709516, -0.5512067, -3.467321, 1, 1, 1, 1, 1,
-1.704151, 1.121049, -1.020034, 1, 1, 1, 1, 1,
-1.700501, 1.315508, -0.8901945, 1, 1, 1, 1, 1,
-1.692892, 0.5568694, -0.6229858, 1, 1, 1, 1, 1,
-1.685879, -0.5918112, -1.721241, 1, 1, 1, 1, 1,
-1.678834, -1.150151, -0.9142159, 1, 1, 1, 1, 1,
-1.66704, -1.282465, -2.343899, 1, 1, 1, 1, 1,
-1.637628, 0.7848642, -0.929064, 0, 0, 1, 1, 1,
-1.635488, -0.108308, -3.596578, 1, 0, 0, 1, 1,
-1.633297, -1.263375, -2.191204, 1, 0, 0, 1, 1,
-1.631358, 0.8450849, -2.110592, 1, 0, 0, 1, 1,
-1.628102, 0.01277604, -2.318518, 1, 0, 0, 1, 1,
-1.624045, 2.023233, -2.391181, 1, 0, 0, 1, 1,
-1.621182, 1.510233, -0.3155789, 0, 0, 0, 1, 1,
-1.619903, -0.3945339, -3.445788, 0, 0, 0, 1, 1,
-1.61696, -0.3902723, -1.426058, 0, 0, 0, 1, 1,
-1.609241, -1.261912, -3.034721, 0, 0, 0, 1, 1,
-1.600675, -0.2256771, -2.599069, 0, 0, 0, 1, 1,
-1.59263, 1.55882, -2.091484, 0, 0, 0, 1, 1,
-1.589681, -0.5502728, 0.1541119, 0, 0, 0, 1, 1,
-1.589244, -0.4063127, -1.847407, 1, 1, 1, 1, 1,
-1.588152, -1.59777, -3.08269, 1, 1, 1, 1, 1,
-1.577924, 1.168959, -1.04227, 1, 1, 1, 1, 1,
-1.574093, 1.118223, 1.963217, 1, 1, 1, 1, 1,
-1.570507, -0.1550517, -1.983596, 1, 1, 1, 1, 1,
-1.567097, 0.1661673, 0.2639776, 1, 1, 1, 1, 1,
-1.564905, -0.919228, -2.234907, 1, 1, 1, 1, 1,
-1.560427, -0.194314, -0.1909857, 1, 1, 1, 1, 1,
-1.557873, 0.8947302, -0.7183128, 1, 1, 1, 1, 1,
-1.550819, -0.5484662, -2.303272, 1, 1, 1, 1, 1,
-1.55004, -0.8805773, -2.677719, 1, 1, 1, 1, 1,
-1.549372, 0.05081915, -2.35612, 1, 1, 1, 1, 1,
-1.533536, 1.50029, -1.380383, 1, 1, 1, 1, 1,
-1.528704, -0.1647737, -1.937019, 1, 1, 1, 1, 1,
-1.528394, 0.2058123, -1.786206, 1, 1, 1, 1, 1,
-1.520554, 1.768931, -0.600858, 0, 0, 1, 1, 1,
-1.514523, -0.391751, -1.725372, 1, 0, 0, 1, 1,
-1.513311, 0.3012744, -0.9101702, 1, 0, 0, 1, 1,
-1.512296, 0.1981436, -1.638016, 1, 0, 0, 1, 1,
-1.509801, 0.1295324, -2.031543, 1, 0, 0, 1, 1,
-1.501785, 0.5907688, -0.3761733, 1, 0, 0, 1, 1,
-1.485175, 2.538724, -1.194823, 0, 0, 0, 1, 1,
-1.470278, -1.993757, -3.397103, 0, 0, 0, 1, 1,
-1.456036, -1.442291, -3.149732, 0, 0, 0, 1, 1,
-1.45368, -0.2278785, -2.782561, 0, 0, 0, 1, 1,
-1.452134, -2.453185, -2.705015, 0, 0, 0, 1, 1,
-1.429099, 1.448566, -0.5825399, 0, 0, 0, 1, 1,
-1.428513, -1.90019, -1.475466, 0, 0, 0, 1, 1,
-1.4284, -0.2617847, -0.7894598, 1, 1, 1, 1, 1,
-1.428126, -1.404872, -2.217303, 1, 1, 1, 1, 1,
-1.405513, 2.068413, 0.2725909, 1, 1, 1, 1, 1,
-1.403067, 0.2553193, -2.730006, 1, 1, 1, 1, 1,
-1.401686, 0.1635757, -1.255086, 1, 1, 1, 1, 1,
-1.400264, 0.8574786, -0.2654141, 1, 1, 1, 1, 1,
-1.394009, -0.5383021, -1.122054, 1, 1, 1, 1, 1,
-1.390634, -0.1997395, -1.540503, 1, 1, 1, 1, 1,
-1.364511, 1.39475, -1.919551, 1, 1, 1, 1, 1,
-1.360892, 0.06418155, -3.22683, 1, 1, 1, 1, 1,
-1.357461, 0.5167845, 0.3993789, 1, 1, 1, 1, 1,
-1.356926, -0.767849, -0.8044963, 1, 1, 1, 1, 1,
-1.343501, -0.8721621, -4.442601, 1, 1, 1, 1, 1,
-1.33952, 0.3749363, -1.607014, 1, 1, 1, 1, 1,
-1.333772, -0.4837609, -0.8567364, 1, 1, 1, 1, 1,
-1.333629, -0.7948027, -2.52652, 0, 0, 1, 1, 1,
-1.322164, -1.249028, -3.060992, 1, 0, 0, 1, 1,
-1.31868, -0.5393246, -1.51737, 1, 0, 0, 1, 1,
-1.318336, 1.546441, -1.379979, 1, 0, 0, 1, 1,
-1.315362, -1.897478, -3.908716, 1, 0, 0, 1, 1,
-1.300905, -0.9475178, -1.261789, 1, 0, 0, 1, 1,
-1.294323, -1.080079, -1.292387, 0, 0, 0, 1, 1,
-1.294132, -1.016034, -1.851067, 0, 0, 0, 1, 1,
-1.284967, 0.2217555, 0.9172063, 0, 0, 0, 1, 1,
-1.277638, 1.504547, -0.09803441, 0, 0, 0, 1, 1,
-1.268978, -0.358968, -1.411929, 0, 0, 0, 1, 1,
-1.267142, -0.4673831, -0.8427205, 0, 0, 0, 1, 1,
-1.263801, -0.702934, -1.782853, 0, 0, 0, 1, 1,
-1.261762, 0.8253254, -1.453876, 1, 1, 1, 1, 1,
-1.246878, -0.3078028, -1.830145, 1, 1, 1, 1, 1,
-1.238416, -0.7471669, -0.9538502, 1, 1, 1, 1, 1,
-1.234376, 0.4611525, -1.557925, 1, 1, 1, 1, 1,
-1.233963, -1.1541, -1.61839, 1, 1, 1, 1, 1,
-1.233336, 0.5447448, -1.015886, 1, 1, 1, 1, 1,
-1.223996, 0.2921543, -1.663307, 1, 1, 1, 1, 1,
-1.215175, 1.038278, -0.3709491, 1, 1, 1, 1, 1,
-1.21511, 0.3256178, -1.542447, 1, 1, 1, 1, 1,
-1.214716, 1.195116, -1.366087, 1, 1, 1, 1, 1,
-1.212628, 0.8100469, -0.121923, 1, 1, 1, 1, 1,
-1.208537, -0.06645973, -2.677559, 1, 1, 1, 1, 1,
-1.207279, -0.03271384, 0.4402144, 1, 1, 1, 1, 1,
-1.198994, 0.1735928, -1.433647, 1, 1, 1, 1, 1,
-1.194757, 0.7552469, -0.7818506, 1, 1, 1, 1, 1,
-1.189936, -2.501171, -3.526991, 0, 0, 1, 1, 1,
-1.185976, -0.3340509, -1.335818, 1, 0, 0, 1, 1,
-1.18522, 1.947411, -0.9531985, 1, 0, 0, 1, 1,
-1.18162, -1.823576, -3.125902, 1, 0, 0, 1, 1,
-1.177119, -0.7695234, -2.471428, 1, 0, 0, 1, 1,
-1.175703, 1.242492, -2.130797, 1, 0, 0, 1, 1,
-1.167494, -1.302744, -3.431634, 0, 0, 0, 1, 1,
-1.163066, 0.0134508, -0.3268808, 0, 0, 0, 1, 1,
-1.149179, 0.7971334, -2.001141, 0, 0, 0, 1, 1,
-1.145718, 0.8592563, 0.2721987, 0, 0, 0, 1, 1,
-1.139789, -1.005859, -1.573183, 0, 0, 0, 1, 1,
-1.139383, -0.4223107, -3.059115, 0, 0, 0, 1, 1,
-1.138359, -0.4425676, -1.888948, 0, 0, 0, 1, 1,
-1.133833, 0.632341, -0.1910689, 1, 1, 1, 1, 1,
-1.132187, 0.3259593, -3.165468, 1, 1, 1, 1, 1,
-1.123054, -0.5424982, 0.8585846, 1, 1, 1, 1, 1,
-1.119922, -0.2323192, -0.308765, 1, 1, 1, 1, 1,
-1.114066, -0.4724229, -2.341556, 1, 1, 1, 1, 1,
-1.10498, -0.5604858, -1.919698, 1, 1, 1, 1, 1,
-1.097717, -1.711946, -2.608374, 1, 1, 1, 1, 1,
-1.097341, -0.02668479, -2.25801, 1, 1, 1, 1, 1,
-1.097089, 0.5837804, -1.593978, 1, 1, 1, 1, 1,
-1.094465, 0.4839921, 0.1785597, 1, 1, 1, 1, 1,
-1.089301, -0.3885162, -2.527715, 1, 1, 1, 1, 1,
-1.087062, -2.113117, -1.190611, 1, 1, 1, 1, 1,
-1.08366, 0.6151828, 0.7842314, 1, 1, 1, 1, 1,
-1.077244, 1.737559, -1.1963, 1, 1, 1, 1, 1,
-1.069304, 1.364706, 0.2915923, 1, 1, 1, 1, 1,
-1.067943, 0.1720948, -2.869465, 0, 0, 1, 1, 1,
-1.059494, 0.840494, -1.386931, 1, 0, 0, 1, 1,
-1.056857, -0.8468971, -0.9282629, 1, 0, 0, 1, 1,
-1.054495, -0.6643398, -3.562742, 1, 0, 0, 1, 1,
-1.043693, 1.948318, -2.630132, 1, 0, 0, 1, 1,
-1.040525, 0.2291026, -2.335874, 1, 0, 0, 1, 1,
-1.040339, 1.613797, -0.05150018, 0, 0, 0, 1, 1,
-1.038013, -0.8472607, -2.125599, 0, 0, 0, 1, 1,
-1.034269, -1.192108, -2.440888, 0, 0, 0, 1, 1,
-1.019874, -0.1455469, -1.490126, 0, 0, 0, 1, 1,
-1.019246, 0.3401532, -1.733684, 0, 0, 0, 1, 1,
-1.016961, -1.548966, -3.743788, 0, 0, 0, 1, 1,
-1.015717, -2.320156, -3.041391, 0, 0, 0, 1, 1,
-1.014956, 0.8663912, -1.264478, 1, 1, 1, 1, 1,
-1.013794, 0.7884693, -1.085523, 1, 1, 1, 1, 1,
-1.012358, 0.2340247, -2.859315, 1, 1, 1, 1, 1,
-1.007337, -1.149638, -2.602588, 1, 1, 1, 1, 1,
-1.00512, -0.9603079, -2.618905, 1, 1, 1, 1, 1,
-0.9960885, 0.5940495, -0.948941, 1, 1, 1, 1, 1,
-0.9958895, -1.918966, -1.666724, 1, 1, 1, 1, 1,
-0.9899154, 0.453479, -2.090916, 1, 1, 1, 1, 1,
-0.9867238, -0.05322371, -2.592091, 1, 1, 1, 1, 1,
-0.9863382, 0.7940988, -0.5964999, 1, 1, 1, 1, 1,
-0.9861396, 1.069314, -1.334348, 1, 1, 1, 1, 1,
-0.9759948, -0.4285123, -2.733746, 1, 1, 1, 1, 1,
-0.9736355, -0.8390462, -1.29074, 1, 1, 1, 1, 1,
-0.965647, -0.2739985, 0.2465705, 1, 1, 1, 1, 1,
-0.9651458, 0.4021021, -2.456338, 1, 1, 1, 1, 1,
-0.9646479, 0.6815017, -0.8198519, 0, 0, 1, 1, 1,
-0.9550373, -0.1767784, -1.405515, 1, 0, 0, 1, 1,
-0.9535884, 0.8883499, -1.052538, 1, 0, 0, 1, 1,
-0.9516834, -0.5436692, -2.828334, 1, 0, 0, 1, 1,
-0.950869, 0.9063705, -1.097044, 1, 0, 0, 1, 1,
-0.9451683, -1.427938, -2.725722, 1, 0, 0, 1, 1,
-0.9418851, -0.8804929, -2.934039, 0, 0, 0, 1, 1,
-0.936372, -1.45761, -2.341541, 0, 0, 0, 1, 1,
-0.9350508, 0.3689578, 0.4480224, 0, 0, 0, 1, 1,
-0.9325159, 0.538587, -0.5530067, 0, 0, 0, 1, 1,
-0.9310517, -0.292398, -1.877021, 0, 0, 0, 1, 1,
-0.9304588, -0.2227073, -3.263169, 0, 0, 0, 1, 1,
-0.9281304, 0.09883867, -1.410304, 0, 0, 0, 1, 1,
-0.9267935, 1.156043, -0.6284054, 1, 1, 1, 1, 1,
-0.923559, -1.301223, -1.904311, 1, 1, 1, 1, 1,
-0.9228939, 1.329701, -0.2443534, 1, 1, 1, 1, 1,
-0.9205766, -0.3701413, -1.386831, 1, 1, 1, 1, 1,
-0.9204766, -0.4421498, -0.05317163, 1, 1, 1, 1, 1,
-0.9204627, 0.2471787, 0.7220529, 1, 1, 1, 1, 1,
-0.9187383, 0.789368, -1.809997, 1, 1, 1, 1, 1,
-0.9172437, 1.316272, -0.8136714, 1, 1, 1, 1, 1,
-0.9113201, -0.1708186, 0.0593561, 1, 1, 1, 1, 1,
-0.9103919, 0.2499643, -2.149452, 1, 1, 1, 1, 1,
-0.9080599, -0.4457413, -2.836591, 1, 1, 1, 1, 1,
-0.9075264, -1.354066, -0.9079921, 1, 1, 1, 1, 1,
-0.8986326, -0.6254638, -2.220183, 1, 1, 1, 1, 1,
-0.8896688, -0.1267278, -1.769731, 1, 1, 1, 1, 1,
-0.8870297, -0.07448262, -1.690516, 1, 1, 1, 1, 1,
-0.8868726, 0.09383869, -1.321573, 0, 0, 1, 1, 1,
-0.8852744, -0.1004386, -0.9164602, 1, 0, 0, 1, 1,
-0.8762956, 2.589852, 0.9570408, 1, 0, 0, 1, 1,
-0.8749583, -0.1453135, 0.3370251, 1, 0, 0, 1, 1,
-0.874745, -2.079277, -0.02645897, 1, 0, 0, 1, 1,
-0.8737988, 0.9978809, -1.52511, 1, 0, 0, 1, 1,
-0.87316, 0.5959396, -0.9039884, 0, 0, 0, 1, 1,
-0.8671708, 0.8412755, -0.6050915, 0, 0, 0, 1, 1,
-0.8646739, -0.6861229, -0.7626528, 0, 0, 0, 1, 1,
-0.8598465, 0.5178175, -2.120857, 0, 0, 0, 1, 1,
-0.8524377, -0.9924398, -2.283281, 0, 0, 0, 1, 1,
-0.8380211, -1.335455, -0.8651559, 0, 0, 0, 1, 1,
-0.8370223, 0.5426553, -1.585803, 0, 0, 0, 1, 1,
-0.834481, 0.9481342, -0.3273962, 1, 1, 1, 1, 1,
-0.8303711, 0.02103126, -3.550067, 1, 1, 1, 1, 1,
-0.8295687, 0.9130654, -0.9906327, 1, 1, 1, 1, 1,
-0.8253725, -0.08188061, -1.150724, 1, 1, 1, 1, 1,
-0.8211578, 1.023953, 0.1788305, 1, 1, 1, 1, 1,
-0.8147172, 1.681829, -0.1530529, 1, 1, 1, 1, 1,
-0.8146022, -0.1478913, -0.558862, 1, 1, 1, 1, 1,
-0.813335, 0.1942975, -2.292116, 1, 1, 1, 1, 1,
-0.8098716, 0.07650792, -2.024284, 1, 1, 1, 1, 1,
-0.8080018, -0.2956345, -2.362174, 1, 1, 1, 1, 1,
-0.8051258, -1.027506, -2.859105, 1, 1, 1, 1, 1,
-0.8037547, 1.846854, -1.907856, 1, 1, 1, 1, 1,
-0.8007333, -0.9244744, -3.223704, 1, 1, 1, 1, 1,
-0.7992664, -1.302836, -1.746318, 1, 1, 1, 1, 1,
-0.7970319, -1.044734, -3.920797, 1, 1, 1, 1, 1,
-0.7932901, 0.02607149, -0.5948877, 0, 0, 1, 1, 1,
-0.7932871, -0.3503031, -1.364375, 1, 0, 0, 1, 1,
-0.7911049, 1.118497, -1.848459, 1, 0, 0, 1, 1,
-0.7895914, 0.3490984, 0.8199666, 1, 0, 0, 1, 1,
-0.7882496, -0.5017806, -2.472395, 1, 0, 0, 1, 1,
-0.7860152, 0.04452622, -1.372497, 1, 0, 0, 1, 1,
-0.7821806, -0.2362243, -2.59598, 0, 0, 0, 1, 1,
-0.7799035, -0.6012078, -1.770745, 0, 0, 0, 1, 1,
-0.77259, 0.006363376, 0.07029724, 0, 0, 0, 1, 1,
-0.771796, -1.689297, -2.443919, 0, 0, 0, 1, 1,
-0.7717263, 1.266608, -1.435662, 0, 0, 0, 1, 1,
-0.7673107, 0.5803182, -1.984631, 0, 0, 0, 1, 1,
-0.7614953, 0.2137248, -0.7496281, 0, 0, 0, 1, 1,
-0.7587729, -1.0188, -3.190776, 1, 1, 1, 1, 1,
-0.7576485, -0.3298399, -0.7526473, 1, 1, 1, 1, 1,
-0.7569276, -1.221325, -2.941379, 1, 1, 1, 1, 1,
-0.7551417, 0.6533009, -0.2430914, 1, 1, 1, 1, 1,
-0.7545671, 0.03294208, -1.311674, 1, 1, 1, 1, 1,
-0.7500183, 1.991522, -0.09519608, 1, 1, 1, 1, 1,
-0.7483801, 1.234921, 0.4565729, 1, 1, 1, 1, 1,
-0.74777, 0.2436672, -2.576007, 1, 1, 1, 1, 1,
-0.7438797, 0.7615257, -0.1640371, 1, 1, 1, 1, 1,
-0.7435648, 0.8083841, -1.065086, 1, 1, 1, 1, 1,
-0.7399702, 1.034795, -1.108599, 1, 1, 1, 1, 1,
-0.7398518, 0.4430467, -1.377916, 1, 1, 1, 1, 1,
-0.7347819, -1.035259, -2.621404, 1, 1, 1, 1, 1,
-0.7343292, -0.7676617, -2.513244, 1, 1, 1, 1, 1,
-0.7216223, -0.8291537, -2.51378, 1, 1, 1, 1, 1,
-0.7199331, -0.3254801, -0.9332883, 0, 0, 1, 1, 1,
-0.7193954, -0.6965246, -3.111557, 1, 0, 0, 1, 1,
-0.7145488, 0.6207737, 0.1340226, 1, 0, 0, 1, 1,
-0.7126625, -0.4407198, -1.859561, 1, 0, 0, 1, 1,
-0.7105055, -0.2027251, -3.087335, 1, 0, 0, 1, 1,
-0.7084005, 0.6741366, 0.5300792, 1, 0, 0, 1, 1,
-0.7069996, -1.495161, -2.934998, 0, 0, 0, 1, 1,
-0.706927, 1.691282, 0.9661073, 0, 0, 0, 1, 1,
-0.7039418, -1.465636, -4.225626, 0, 0, 0, 1, 1,
-0.7036591, 1.545675, -0.04257439, 0, 0, 0, 1, 1,
-0.7033669, -0.7664629, -3.451072, 0, 0, 0, 1, 1,
-0.6999822, -1.683069, -3.068035, 0, 0, 0, 1, 1,
-0.6991293, -0.0643615, -1.352451, 0, 0, 0, 1, 1,
-0.6967701, 0.3976046, 0.1361595, 1, 1, 1, 1, 1,
-0.6923236, -0.3310331, -2.728489, 1, 1, 1, 1, 1,
-0.6890208, -0.3699974, -3.325115, 1, 1, 1, 1, 1,
-0.6853314, -0.7115222, -3.346733, 1, 1, 1, 1, 1,
-0.6836054, 1.54967, 0.2193123, 1, 1, 1, 1, 1,
-0.6828696, 1.243813, 0.1385937, 1, 1, 1, 1, 1,
-0.681232, -0.3952984, -1.53512, 1, 1, 1, 1, 1,
-0.6783611, -0.9174464, -2.991704, 1, 1, 1, 1, 1,
-0.673609, 1.776188, -0.6740143, 1, 1, 1, 1, 1,
-0.6728154, -1.492585, -2.079733, 1, 1, 1, 1, 1,
-0.6720383, 0.2213533, -1.688926, 1, 1, 1, 1, 1,
-0.6625034, -0.3900666, -1.661446, 1, 1, 1, 1, 1,
-0.6528873, -0.8842592, -2.166061, 1, 1, 1, 1, 1,
-0.6513211, 0.1678591, -0.4050402, 1, 1, 1, 1, 1,
-0.6488854, 0.390706, -2.09958, 1, 1, 1, 1, 1,
-0.6483749, 0.468471, -1.845128, 0, 0, 1, 1, 1,
-0.6412107, 0.9356384, -0.8853967, 1, 0, 0, 1, 1,
-0.6388714, -0.2666427, -2.618021, 1, 0, 0, 1, 1,
-0.6355761, 0.8187622, -0.265001, 1, 0, 0, 1, 1,
-0.6344879, -0.198606, -1.264106, 1, 0, 0, 1, 1,
-0.6341228, 0.4830842, 0.4459316, 1, 0, 0, 1, 1,
-0.6307693, 0.2732624, -2.65616, 0, 0, 0, 1, 1,
-0.6281053, -0.3142482, -1.290477, 0, 0, 0, 1, 1,
-0.6238587, 1.746616, 0.5246984, 0, 0, 0, 1, 1,
-0.6232145, -1.485418, -3.46969, 0, 0, 0, 1, 1,
-0.6228037, -1.214664, -3.784633, 0, 0, 0, 1, 1,
-0.6223665, 0.7839842, 0.2133786, 0, 0, 0, 1, 1,
-0.6192805, 0.6895957, -1.014881, 0, 0, 0, 1, 1,
-0.617911, 0.384712, -1.648027, 1, 1, 1, 1, 1,
-0.6174437, 0.6576007, -1.970325, 1, 1, 1, 1, 1,
-0.6107233, 1.843639, 0.7862473, 1, 1, 1, 1, 1,
-0.6106974, -0.6773052, -3.334794, 1, 1, 1, 1, 1,
-0.6094877, -0.7875147, -0.7031311, 1, 1, 1, 1, 1,
-0.6036966, -0.8437592, -1.304145, 1, 1, 1, 1, 1,
-0.6015182, -1.338111, -4.915036, 1, 1, 1, 1, 1,
-0.5988703, 1.28179, 2.451123, 1, 1, 1, 1, 1,
-0.5899934, -0.6866707, -2.245691, 1, 1, 1, 1, 1,
-0.5832502, 2.019588, 0.472341, 1, 1, 1, 1, 1,
-0.5786196, 1.479323, -1.782605, 1, 1, 1, 1, 1,
-0.5781966, 0.1834191, -3.049683, 1, 1, 1, 1, 1,
-0.576414, -1.105053, -2.678581, 1, 1, 1, 1, 1,
-0.5750946, 0.5948777, 0.8227931, 1, 1, 1, 1, 1,
-0.5723055, 1.109352, -1.222461, 1, 1, 1, 1, 1,
-0.5662194, -0.8608665, -3.512642, 0, 0, 1, 1, 1,
-0.5632869, 0.8175244, 0.5867831, 1, 0, 0, 1, 1,
-0.5624315, 1.096309, -2.853853, 1, 0, 0, 1, 1,
-0.5535992, 0.4101847, -0.3604338, 1, 0, 0, 1, 1,
-0.5535918, 0.09541365, -0.3593249, 1, 0, 0, 1, 1,
-0.5506678, 0.6373834, -1.392422, 1, 0, 0, 1, 1,
-0.546236, -0.5925089, -0.8106064, 0, 0, 0, 1, 1,
-0.5430565, -0.008067019, -0.3341971, 0, 0, 0, 1, 1,
-0.5425824, -0.5020919, -2.575576, 0, 0, 0, 1, 1,
-0.5411328, -0.4455155, -2.822622, 0, 0, 0, 1, 1,
-0.5399145, 0.8471295, -0.5597169, 0, 0, 0, 1, 1,
-0.5391356, 0.4720189, -2.963059, 0, 0, 0, 1, 1,
-0.5319954, 1.129149, 0.04504196, 0, 0, 0, 1, 1,
-0.5319511, 0.1915875, -0.4396274, 1, 1, 1, 1, 1,
-0.5304055, -0.3139341, -1.042705, 1, 1, 1, 1, 1,
-0.5291808, 1.059313, -1.50336, 1, 1, 1, 1, 1,
-0.5291736, 0.8062278, -1.348814, 1, 1, 1, 1, 1,
-0.5260561, 1.144833, -0.9088486, 1, 1, 1, 1, 1,
-0.52034, 0.007969165, -2.445659, 1, 1, 1, 1, 1,
-0.5196629, 2.162161, 1.403727, 1, 1, 1, 1, 1,
-0.5192392, 0.9314351, -1.223208, 1, 1, 1, 1, 1,
-0.5171672, -0.3861034, -3.228944, 1, 1, 1, 1, 1,
-0.5149011, -0.09739284, -1.566384, 1, 1, 1, 1, 1,
-0.5118839, 1.735801, 0.4950958, 1, 1, 1, 1, 1,
-0.5111544, 1.770435, -0.8615466, 1, 1, 1, 1, 1,
-0.5087497, -1.811482, -5.620721, 1, 1, 1, 1, 1,
-0.507171, -0.3698437, -2.260257, 1, 1, 1, 1, 1,
-0.5057225, 0.5633205, -0.4200166, 1, 1, 1, 1, 1,
-0.4994787, 1.375063, -0.2098065, 0, 0, 1, 1, 1,
-0.4989157, 0.8503584, -0.7782117, 1, 0, 0, 1, 1,
-0.4853641, 0.5802273, 0.489996, 1, 0, 0, 1, 1,
-0.4840814, 1.423497, -1.280744, 1, 0, 0, 1, 1,
-0.4808093, -0.3686757, -2.30073, 1, 0, 0, 1, 1,
-0.4803275, 1.156893, 0.009822136, 1, 0, 0, 1, 1,
-0.4615242, 0.4577945, -2.104196, 0, 0, 0, 1, 1,
-0.4607278, 0.8801697, -1.659721, 0, 0, 0, 1, 1,
-0.4602104, 2.443292, -1.594634, 0, 0, 0, 1, 1,
-0.4593021, -2.550697, -2.609936, 0, 0, 0, 1, 1,
-0.4560699, 0.294727, -0.9960533, 0, 0, 0, 1, 1,
-0.4546618, -3.82461, -1.889335, 0, 0, 0, 1, 1,
-0.4508486, 0.9089219, 0.4007706, 0, 0, 0, 1, 1,
-0.447127, -1.138191, -2.535817, 1, 1, 1, 1, 1,
-0.4456495, -0.1827346, -1.755997, 1, 1, 1, 1, 1,
-0.4429174, 1.106627, -0.07825286, 1, 1, 1, 1, 1,
-0.4375228, -0.246757, -2.396768, 1, 1, 1, 1, 1,
-0.4374929, -0.3442773, -3.352744, 1, 1, 1, 1, 1,
-0.4370059, -0.3581165, -1.29951, 1, 1, 1, 1, 1,
-0.4363886, -0.004256027, -2.847377, 1, 1, 1, 1, 1,
-0.4289573, -0.9945166, -1.871766, 1, 1, 1, 1, 1,
-0.4231674, -0.3768229, -2.082939, 1, 1, 1, 1, 1,
-0.4222192, -0.3781837, -2.912297, 1, 1, 1, 1, 1,
-0.419729, 0.3313117, -0.6291724, 1, 1, 1, 1, 1,
-0.4193892, -1.178228, -2.653088, 1, 1, 1, 1, 1,
-0.4158007, 0.1952597, -1.394367, 1, 1, 1, 1, 1,
-0.4095722, -0.1882861, -2.342731, 1, 1, 1, 1, 1,
-0.40899, 1.134029, 0.2239482, 1, 1, 1, 1, 1,
-0.4079678, -0.4031482, -1.815572, 0, 0, 1, 1, 1,
-0.4074734, -0.04008867, -2.039984, 1, 0, 0, 1, 1,
-0.3950272, 1.3523, 0.7612992, 1, 0, 0, 1, 1,
-0.3933946, -1.450004, -3.479185, 1, 0, 0, 1, 1,
-0.3812944, -1.406353, -3.922027, 1, 0, 0, 1, 1,
-0.3779058, 0.3460356, 0.5956956, 1, 0, 0, 1, 1,
-0.3691612, 1.654852, -1.268909, 0, 0, 0, 1, 1,
-0.3680696, 0.7339063, 0.1634727, 0, 0, 0, 1, 1,
-0.3627092, 0.5296878, -1.45992, 0, 0, 0, 1, 1,
-0.3614151, 1.290198, -0.2777841, 0, 0, 0, 1, 1,
-0.3606434, 0.2919954, -1.167154, 0, 0, 0, 1, 1,
-0.3591866, 1.37727, 1.118395, 0, 0, 0, 1, 1,
-0.3553161, 1.011265, -1.200504, 0, 0, 0, 1, 1,
-0.3544099, 0.05387798, 0.5236263, 1, 1, 1, 1, 1,
-0.3437475, -1.501176, -1.259657, 1, 1, 1, 1, 1,
-0.3436386, 0.8136064, -0.8143661, 1, 1, 1, 1, 1,
-0.3433738, -0.3055648, -1.676892, 1, 1, 1, 1, 1,
-0.3373298, 1.228307, 0.02577145, 1, 1, 1, 1, 1,
-0.3320445, -1.507774, -2.267761, 1, 1, 1, 1, 1,
-0.3264093, 0.557847, 0.3299769, 1, 1, 1, 1, 1,
-0.3255038, -0.3406597, -0.8945124, 1, 1, 1, 1, 1,
-0.323772, -0.9739452, -1.447831, 1, 1, 1, 1, 1,
-0.3165343, 0.1279007, -1.064504, 1, 1, 1, 1, 1,
-0.3137548, 1.707085, -0.3562143, 1, 1, 1, 1, 1,
-0.3128369, 1.534505, -0.2419077, 1, 1, 1, 1, 1,
-0.3123114, -0.006805869, -2.002566, 1, 1, 1, 1, 1,
-0.3067652, -0.671841, -1.620656, 1, 1, 1, 1, 1,
-0.3033032, -0.3987445, -4.572343, 1, 1, 1, 1, 1,
-0.2964112, -0.9250449, -4.428837, 0, 0, 1, 1, 1,
-0.2932882, -1.392056, -2.716475, 1, 0, 0, 1, 1,
-0.2902335, -1.276412, -3.913947, 1, 0, 0, 1, 1,
-0.2880262, -1.112564, -2.856697, 1, 0, 0, 1, 1,
-0.2865241, 0.3092588, -1.798093, 1, 0, 0, 1, 1,
-0.2853715, 3.136534, -0.6112622, 1, 0, 0, 1, 1,
-0.2822765, 0.3670033, 0.7925881, 0, 0, 0, 1, 1,
-0.2808908, 0.5425976, 0.2313287, 0, 0, 0, 1, 1,
-0.2783916, 1.200416, -3.07455, 0, 0, 0, 1, 1,
-0.2753563, 0.1783965, -2.323925, 0, 0, 0, 1, 1,
-0.2737273, -1.829004, -3.509097, 0, 0, 0, 1, 1,
-0.2695601, 0.1293298, -1.630916, 0, 0, 0, 1, 1,
-0.266688, 3.012579, -0.4742684, 0, 0, 0, 1, 1,
-0.2654155, 0.7133123, -2.412018, 1, 1, 1, 1, 1,
-0.2631036, 1.864231, -1.156323, 1, 1, 1, 1, 1,
-0.2621385, -1.163083, -4.1567, 1, 1, 1, 1, 1,
-0.2609658, 0.9832863, 1.267659, 1, 1, 1, 1, 1,
-0.2567715, -1.03469, -2.804016, 1, 1, 1, 1, 1,
-0.2561922, 0.5707949, -0.6799744, 1, 1, 1, 1, 1,
-0.2522783, 0.03314091, -2.270338, 1, 1, 1, 1, 1,
-0.2518881, -0.5674974, -3.060113, 1, 1, 1, 1, 1,
-0.2439464, -1.585233, -3.146724, 1, 1, 1, 1, 1,
-0.2386488, 1.154013, -1.101568, 1, 1, 1, 1, 1,
-0.2381348, -0.2760079, -2.190777, 1, 1, 1, 1, 1,
-0.2357223, 1.232504, 0.7048836, 1, 1, 1, 1, 1,
-0.2330914, 1.433873, -0.4403341, 1, 1, 1, 1, 1,
-0.2321812, 1.538356, 1.126051, 1, 1, 1, 1, 1,
-0.2292421, 1.130646, -0.2213725, 1, 1, 1, 1, 1,
-0.2265731, -0.5610763, -3.354944, 0, 0, 1, 1, 1,
-0.2261861, -1.692338, -1.259368, 1, 0, 0, 1, 1,
-0.2259293, -0.5777837, -1.276186, 1, 0, 0, 1, 1,
-0.2172901, -0.2373853, -4.640754, 1, 0, 0, 1, 1,
-0.213368, 0.06118936, -1.249314, 1, 0, 0, 1, 1,
-0.2075161, 1.341844, 0.05362898, 1, 0, 0, 1, 1,
-0.202295, -0.346943, -3.12523, 0, 0, 0, 1, 1,
-0.1997735, 0.2467421, -0.3121022, 0, 0, 0, 1, 1,
-0.1974471, 0.7173345, -0.5199896, 0, 0, 0, 1, 1,
-0.1843147, -0.4169978, -1.072764, 0, 0, 0, 1, 1,
-0.1814861, 0.8498029, 0.1181072, 0, 0, 0, 1, 1,
-0.1761016, 0.3744491, -1.738327, 0, 0, 0, 1, 1,
-0.1720544, 1.247617, 0.7485936, 0, 0, 0, 1, 1,
-0.1709895, 1.658986, 0.1487087, 1, 1, 1, 1, 1,
-0.1697858, -0.1428116, -2.109162, 1, 1, 1, 1, 1,
-0.1683837, 0.8055267, -2.541088, 1, 1, 1, 1, 1,
-0.1625454, -0.0729732, -2.160458, 1, 1, 1, 1, 1,
-0.1619411, 1.366411, 0.4003224, 1, 1, 1, 1, 1,
-0.1618944, 0.1044949, -1.357832, 1, 1, 1, 1, 1,
-0.1591953, 0.4503722, -1.119174, 1, 1, 1, 1, 1,
-0.1588451, 0.4392827, -1.410934, 1, 1, 1, 1, 1,
-0.1583073, 0.5917393, 0.4811449, 1, 1, 1, 1, 1,
-0.1566141, -0.6420496, -3.018026, 1, 1, 1, 1, 1,
-0.1546917, 0.7527815, -1.309059, 1, 1, 1, 1, 1,
-0.1533086, 0.8938969, -1.555412, 1, 1, 1, 1, 1,
-0.1503493, 0.3294978, -0.1202121, 1, 1, 1, 1, 1,
-0.1489851, 0.3171438, 0.4460619, 1, 1, 1, 1, 1,
-0.1457981, 0.9789241, 0.2527252, 1, 1, 1, 1, 1,
-0.1433003, -0.7306445, -2.151445, 0, 0, 1, 1, 1,
-0.1398941, -1.466828, -1.819538, 1, 0, 0, 1, 1,
-0.1388468, 0.4089116, 0.5321547, 1, 0, 0, 1, 1,
-0.1349263, -0.5711797, -3.938278, 1, 0, 0, 1, 1,
-0.1332926, -1.238091, -1.599389, 1, 0, 0, 1, 1,
-0.1320183, 1.742718, 0.2510352, 1, 0, 0, 1, 1,
-0.1309423, 0.6661005, -1.13691, 0, 0, 0, 1, 1,
-0.1307289, -0.3202399, -2.763605, 0, 0, 0, 1, 1,
-0.1294815, 0.126422, -0.4971697, 0, 0, 0, 1, 1,
-0.1283685, -1.174709, -3.691789, 0, 0, 0, 1, 1,
-0.1273201, -0.3870162, -3.092069, 0, 0, 0, 1, 1,
-0.1238099, 0.7022365, 0.7188286, 0, 0, 0, 1, 1,
-0.1107972, -0.5468095, -3.795089, 0, 0, 0, 1, 1,
-0.1099025, -0.7564737, -2.747375, 1, 1, 1, 1, 1,
-0.1054778, -0.09867121, -1.456889, 1, 1, 1, 1, 1,
-0.1054299, -0.04159712, -4.527545, 1, 1, 1, 1, 1,
-0.09656373, -0.05926537, -2.539473, 1, 1, 1, 1, 1,
-0.09554388, 1.275743, -0.1536232, 1, 1, 1, 1, 1,
-0.08988108, -0.2563582, -1.982802, 1, 1, 1, 1, 1,
-0.08681361, 0.9029468, 1.904604, 1, 1, 1, 1, 1,
-0.08466569, -1.23101, -3.228495, 1, 1, 1, 1, 1,
-0.07997482, -0.02838162, -1.076557, 1, 1, 1, 1, 1,
-0.07803711, 0.559603, 0.2902612, 1, 1, 1, 1, 1,
-0.07578158, -1.750488, -2.586129, 1, 1, 1, 1, 1,
-0.07572242, -0.3826029, -3.865963, 1, 1, 1, 1, 1,
-0.07489027, 1.312043, -0.0479071, 1, 1, 1, 1, 1,
-0.07480232, 0.09526651, 0.6085625, 1, 1, 1, 1, 1,
-0.0733511, 0.3580158, -0.6086591, 1, 1, 1, 1, 1,
-0.062768, -0.5384935, -3.683408, 0, 0, 1, 1, 1,
-0.06161498, 0.8156204, -0.9971703, 1, 0, 0, 1, 1,
-0.06072257, -1.161914, -2.687724, 1, 0, 0, 1, 1,
-0.05473716, -0.2647724, -3.18383, 1, 0, 0, 1, 1,
-0.05449345, 0.7919483, -0.5905818, 1, 0, 0, 1, 1,
-0.05401286, -0.04119737, -2.192342, 1, 0, 0, 1, 1,
-0.05233765, -0.8349581, -4.90503, 0, 0, 0, 1, 1,
-0.05049716, 1.887585, 2.94933, 0, 0, 0, 1, 1,
-0.04931444, 0.3170697, 0.05258051, 0, 0, 0, 1, 1,
-0.04471859, 0.4997833, -0.9859852, 0, 0, 0, 1, 1,
-0.03631648, -0.4416814, -2.287354, 0, 0, 0, 1, 1,
-0.03222371, 0.1142769, 0.6262946, 0, 0, 0, 1, 1,
-0.02798873, 1.397002, -0.7138066, 0, 0, 0, 1, 1,
-0.02446732, -0.1237431, -3.304919, 1, 1, 1, 1, 1,
-0.02125933, 0.6974859, -0.1769088, 1, 1, 1, 1, 1,
-0.02025946, -0.1785862, -2.805592, 1, 1, 1, 1, 1,
-0.0195886, -1.124758, -2.562554, 1, 1, 1, 1, 1,
-0.01798477, -0.4160784, -1.19672, 1, 1, 1, 1, 1,
-0.01578225, 0.82781, -0.890009, 1, 1, 1, 1, 1,
-0.01560254, 0.5255542, -0.7480515, 1, 1, 1, 1, 1,
-0.01502336, 0.4506095, -0.8323954, 1, 1, 1, 1, 1,
-0.01469718, 0.9573255, -0.4315792, 1, 1, 1, 1, 1,
-0.01355513, 0.0535694, 0.673251, 1, 1, 1, 1, 1,
-0.0129374, -0.2704031, -2.349534, 1, 1, 1, 1, 1,
-0.0126458, 1.43862, 0.4496976, 1, 1, 1, 1, 1,
-0.002288849, 0.5306005, -0.7388942, 1, 1, 1, 1, 1,
-0.002153636, 0.618998, 1.212733, 1, 1, 1, 1, 1,
-0.0008027405, -1.162239, -2.323258, 1, 1, 1, 1, 1,
0.003444221, 1.474031, 0.1539106, 0, 0, 1, 1, 1,
0.004099417, -0.2677796, 3.220757, 1, 0, 0, 1, 1,
0.005772904, -1.291582, 2.798522, 1, 0, 0, 1, 1,
0.01711037, 0.187274, 1.665353, 1, 0, 0, 1, 1,
0.01733438, 0.2292108, 0.1843139, 1, 0, 0, 1, 1,
0.02396168, 0.118908, -0.5372983, 1, 0, 0, 1, 1,
0.02457511, -1.938641, 3.379233, 0, 0, 0, 1, 1,
0.025327, -0.2016253, 2.846912, 0, 0, 0, 1, 1,
0.02697491, 0.00273849, 3.504843, 0, 0, 0, 1, 1,
0.03136244, 0.04871705, 0.7038319, 0, 0, 0, 1, 1,
0.03587845, -0.4411337, 3.690461, 0, 0, 0, 1, 1,
0.03690339, 1.178166, 1.251848, 0, 0, 0, 1, 1,
0.0369143, 0.30836, -0.8201401, 0, 0, 0, 1, 1,
0.0378013, 1.943775, 0.8641278, 1, 1, 1, 1, 1,
0.04356279, 0.2187281, 0.4862127, 1, 1, 1, 1, 1,
0.04358044, 0.4276119, -0.7801424, 1, 1, 1, 1, 1,
0.04597962, 0.3049856, -0.1726199, 1, 1, 1, 1, 1,
0.04929099, -0.9024328, 1.596708, 1, 1, 1, 1, 1,
0.04968425, -0.5824052, 3.687606, 1, 1, 1, 1, 1,
0.05078067, 1.13324, -1.32702, 1, 1, 1, 1, 1,
0.05151619, 0.7378485, 3.071133, 1, 1, 1, 1, 1,
0.0537831, 1.212468, -0.4295878, 1, 1, 1, 1, 1,
0.0559016, 0.8258401, 0.7242947, 1, 1, 1, 1, 1,
0.05620659, -0.6101906, 3.076168, 1, 1, 1, 1, 1,
0.05851762, 0.2393886, -0.5966538, 1, 1, 1, 1, 1,
0.05913032, 0.7110836, -0.2987308, 1, 1, 1, 1, 1,
0.05987012, 2.429337, -1.964202, 1, 1, 1, 1, 1,
0.06462197, -0.841072, 4.177247, 1, 1, 1, 1, 1,
0.06983811, -0.6474223, 3.001381, 0, 0, 1, 1, 1,
0.07532457, 0.5592667, -0.3293707, 1, 0, 0, 1, 1,
0.0791553, 2.566958, 0.5236263, 1, 0, 0, 1, 1,
0.08367844, -1.118394, 1.9523, 1, 0, 0, 1, 1,
0.08407782, 0.2809288, -0.6804999, 1, 0, 0, 1, 1,
0.0877082, -0.01053283, 2.948081, 1, 0, 0, 1, 1,
0.08862621, -1.828104, 2.872887, 0, 0, 0, 1, 1,
0.08975426, -0.2638667, 1.903033, 0, 0, 0, 1, 1,
0.09000472, 0.04889952, 2.883674, 0, 0, 0, 1, 1,
0.09268057, 1.594275, -0.2172265, 0, 0, 0, 1, 1,
0.09522348, 0.0767179, 0.3426559, 0, 0, 0, 1, 1,
0.09584886, 0.317667, -0.5369784, 0, 0, 0, 1, 1,
0.09925243, -0.01127571, 1.33399, 0, 0, 0, 1, 1,
0.1023051, 0.03607476, 0.9652581, 1, 1, 1, 1, 1,
0.1117608, 0.04381483, 1.135634, 1, 1, 1, 1, 1,
0.1117653, 0.9482363, -0.2250452, 1, 1, 1, 1, 1,
0.1155015, -1.566273, 2.453334, 1, 1, 1, 1, 1,
0.1155967, -0.02464505, 2.060286, 1, 1, 1, 1, 1,
0.1165651, -0.5340652, 2.3891, 1, 1, 1, 1, 1,
0.1221765, 0.09541845, 0.2490406, 1, 1, 1, 1, 1,
0.1227138, -0.2724876, 3.5278, 1, 1, 1, 1, 1,
0.1255064, -1.098346, 2.429219, 1, 1, 1, 1, 1,
0.130097, 0.6803181, -0.3701759, 1, 1, 1, 1, 1,
0.1302503, 2.130091, -0.8954929, 1, 1, 1, 1, 1,
0.1312769, -1.72438, 2.114183, 1, 1, 1, 1, 1,
0.1358686, 0.2365114, 0.7124043, 1, 1, 1, 1, 1,
0.1443692, -0.7043661, 3.121915, 1, 1, 1, 1, 1,
0.1444178, -1.360767, 1.418082, 1, 1, 1, 1, 1,
0.1498498, 1.820986, 1.285627, 0, 0, 1, 1, 1,
0.154889, 1.234, 1.056988, 1, 0, 0, 1, 1,
0.1616837, -0.5843323, 2.138078, 1, 0, 0, 1, 1,
0.1619054, 1.418494, 0.3159694, 1, 0, 0, 1, 1,
0.1638848, -0.2786829, 2.40905, 1, 0, 0, 1, 1,
0.1648988, 0.3425169, -1.389425, 1, 0, 0, 1, 1,
0.1649658, -0.8647418, 2.926306, 0, 0, 0, 1, 1,
0.1722188, -0.192065, 1.770241, 0, 0, 0, 1, 1,
0.173429, 1.317693, 0.300659, 0, 0, 0, 1, 1,
0.1748208, 0.7693867, 1.831263, 0, 0, 0, 1, 1,
0.1779366, -0.6056643, 3.129134, 0, 0, 0, 1, 1,
0.1798381, -2.041484, 2.747445, 0, 0, 0, 1, 1,
0.1801772, -0.9697401, 3.956773, 0, 0, 0, 1, 1,
0.1839286, -1.427693, 3.258453, 1, 1, 1, 1, 1,
0.1856064, -1.041538, 4.124625, 1, 1, 1, 1, 1,
0.1864073, -0.1899682, 1.516855, 1, 1, 1, 1, 1,
0.1880631, 0.2301848, -0.4333992, 1, 1, 1, 1, 1,
0.1883738, -1.10898, 3.108192, 1, 1, 1, 1, 1,
0.1908363, -0.008222284, 1.858449, 1, 1, 1, 1, 1,
0.1946219, -1.865593, 4.47497, 1, 1, 1, 1, 1,
0.197106, -1.007799, 3.754328, 1, 1, 1, 1, 1,
0.2006819, -0.1551675, 2.188767, 1, 1, 1, 1, 1,
0.2040705, 0.9728439, 0.9666446, 1, 1, 1, 1, 1,
0.205616, -1.217058, 4.063656, 1, 1, 1, 1, 1,
0.2112586, -1.188217, 4.468894, 1, 1, 1, 1, 1,
0.2157705, -0.956766, 4.582305, 1, 1, 1, 1, 1,
0.2186152, 0.02349015, 1.736439, 1, 1, 1, 1, 1,
0.2210245, -2.84678, 0.9225495, 1, 1, 1, 1, 1,
0.2240972, 1.238597, 0.8484793, 0, 0, 1, 1, 1,
0.22678, 0.6524432, 1.54784, 1, 0, 0, 1, 1,
0.2301628, 0.3790106, 0.8807503, 1, 0, 0, 1, 1,
0.2332021, 0.4020838, 0.08221514, 1, 0, 0, 1, 1,
0.2430534, 1.116004, 1.365859, 1, 0, 0, 1, 1,
0.247211, 1.023592, 0.7424916, 1, 0, 0, 1, 1,
0.2521538, -1.163613, 1.55851, 0, 0, 0, 1, 1,
0.2540157, -0.3121198, 2.989699, 0, 0, 0, 1, 1,
0.2553763, -1.226755, 4.311948, 0, 0, 0, 1, 1,
0.2590226, -0.2258963, 1.911127, 0, 0, 0, 1, 1,
0.2595367, -1.94619, 2.637373, 0, 0, 0, 1, 1,
0.2599128, -1.198606, 3.105577, 0, 0, 0, 1, 1,
0.263215, -0.00230583, 0.9330001, 0, 0, 0, 1, 1,
0.2634026, -0.4120839, 4.41746, 1, 1, 1, 1, 1,
0.2634955, -1.24525, 2.834553, 1, 1, 1, 1, 1,
0.2642008, 2.051284, -0.4692674, 1, 1, 1, 1, 1,
0.2649523, 0.1937525, -0.4701943, 1, 1, 1, 1, 1,
0.2651899, -0.7317582, 1.831868, 1, 1, 1, 1, 1,
0.2676947, 0.2079612, 1.581357, 1, 1, 1, 1, 1,
0.2716912, -0.3384133, 1.917748, 1, 1, 1, 1, 1,
0.2736155, -1.063014, 2.105307, 1, 1, 1, 1, 1,
0.27538, -0.5924349, 4.185195, 1, 1, 1, 1, 1,
0.2926405, 0.5717925, 1.210299, 1, 1, 1, 1, 1,
0.292937, -0.2421104, 2.574785, 1, 1, 1, 1, 1,
0.2951563, -0.1461355, 3.458524, 1, 1, 1, 1, 1,
0.2967546, 0.2532966, 2.961843, 1, 1, 1, 1, 1,
0.2970211, -0.7607217, 2.010946, 1, 1, 1, 1, 1,
0.3062125, -0.009326743, 2.421445, 1, 1, 1, 1, 1,
0.3098375, -1.197492, 2.4387, 0, 0, 1, 1, 1,
0.310227, -1.630972, 2.419132, 1, 0, 0, 1, 1,
0.31374, -1.813928, 2.687248, 1, 0, 0, 1, 1,
0.3159945, -0.06580434, 2.210084, 1, 0, 0, 1, 1,
0.319441, 0.1108574, 0.34755, 1, 0, 0, 1, 1,
0.3201433, -2.121702, 2.409797, 1, 0, 0, 1, 1,
0.3230799, 1.688226, -0.5384289, 0, 0, 0, 1, 1,
0.3252769, 0.4301001, 0.7389082, 0, 0, 0, 1, 1,
0.3291713, -0.5411589, 2.081208, 0, 0, 0, 1, 1,
0.3363153, 0.3471828, 1.265743, 0, 0, 0, 1, 1,
0.3383218, 1.317364, 2.76404, 0, 0, 0, 1, 1,
0.3390056, -2.204158, 2.447894, 0, 0, 0, 1, 1,
0.3397289, 1.487579, 0.6587557, 0, 0, 0, 1, 1,
0.3467184, 0.242975, 1.191564, 1, 1, 1, 1, 1,
0.3478041, -0.6117896, 2.5468, 1, 1, 1, 1, 1,
0.3524653, -0.2446757, 1.907191, 1, 1, 1, 1, 1,
0.3546126, -0.9073067, 1.494625, 1, 1, 1, 1, 1,
0.3580486, 0.9264551, 1.856295, 1, 1, 1, 1, 1,
0.3589366, -1.472702, 1.761425, 1, 1, 1, 1, 1,
0.3592049, -0.3591453, 1.983834, 1, 1, 1, 1, 1,
0.3648485, -0.6358113, 1.299141, 1, 1, 1, 1, 1,
0.3674419, -0.5423214, 1.432644, 1, 1, 1, 1, 1,
0.3702545, 0.7971519, 1.11003, 1, 1, 1, 1, 1,
0.3752353, 0.1970018, 0.06259541, 1, 1, 1, 1, 1,
0.3795061, -0.832862, 3.806107, 1, 1, 1, 1, 1,
0.3802423, 0.09509255, 1.882522, 1, 1, 1, 1, 1,
0.3805614, -0.4017846, 0.7007028, 1, 1, 1, 1, 1,
0.3819583, 0.420462, 0.7694713, 1, 1, 1, 1, 1,
0.385107, -0.3708144, 1.616328, 0, 0, 1, 1, 1,
0.3857927, 0.3929932, 1.226664, 1, 0, 0, 1, 1,
0.3864649, 0.03410642, 0.8611956, 1, 0, 0, 1, 1,
0.3887686, 0.243679, 0.9332173, 1, 0, 0, 1, 1,
0.3891764, -1.739085, 3.108484, 1, 0, 0, 1, 1,
0.3916831, 0.9465899, 1.535344, 1, 0, 0, 1, 1,
0.3929827, -0.2315757, 3.160444, 0, 0, 0, 1, 1,
0.3945876, -1.894758, 4.210049, 0, 0, 0, 1, 1,
0.4006111, -1.533027, 2.350003, 0, 0, 0, 1, 1,
0.4040644, -0.3380094, 3.177417, 0, 0, 0, 1, 1,
0.4067939, 0.6017835, -0.2881768, 0, 0, 0, 1, 1,
0.407132, 1.145262, 0.2727833, 0, 0, 0, 1, 1,
0.4089267, -1.55211, 2.387945, 0, 0, 0, 1, 1,
0.4095332, -0.6813655, 0.8241698, 1, 1, 1, 1, 1,
0.4129601, 0.824151, -0.4902804, 1, 1, 1, 1, 1,
0.4143322, -0.4026125, 1.965569, 1, 1, 1, 1, 1,
0.4162995, -2.471222, 3.213155, 1, 1, 1, 1, 1,
0.4226065, 0.08300466, 1.401538, 1, 1, 1, 1, 1,
0.4246498, -0.9785985, 3.689288, 1, 1, 1, 1, 1,
0.4254254, 0.2031642, 2.269359, 1, 1, 1, 1, 1,
0.4260955, -1.839532, 0.3165525, 1, 1, 1, 1, 1,
0.4265735, -0.1857727, 2.332275, 1, 1, 1, 1, 1,
0.428231, -0.3993811, 0.4672606, 1, 1, 1, 1, 1,
0.4284401, -0.3359925, 1.310092, 1, 1, 1, 1, 1,
0.4354305, 0.154009, 0.6734721, 1, 1, 1, 1, 1,
0.4361914, -1.698599, 3.883012, 1, 1, 1, 1, 1,
0.4400885, -0.1530466, 2.443101, 1, 1, 1, 1, 1,
0.4404297, 0.3475359, 1.516643, 1, 1, 1, 1, 1,
0.4450229, -1.43069, 2.601238, 0, 0, 1, 1, 1,
0.4454225, 1.202349, -0.3043216, 1, 0, 0, 1, 1,
0.4455227, 1.616204, -0.6567123, 1, 0, 0, 1, 1,
0.4470488, -1.223607, 3.21607, 1, 0, 0, 1, 1,
0.4539374, -0.5099559, 1.84965, 1, 0, 0, 1, 1,
0.4551592, -1.806261, 5.559289, 1, 0, 0, 1, 1,
0.4595024, -0.09183079, 0.2315158, 0, 0, 0, 1, 1,
0.4597317, 0.3232785, 1.258686, 0, 0, 0, 1, 1,
0.4619268, -0.7416819, 3.338727, 0, 0, 0, 1, 1,
0.4633036, -0.3712367, 1.808275, 0, 0, 0, 1, 1,
0.4635706, -0.2645548, 2.295735, 0, 0, 0, 1, 1,
0.4673827, 0.3976103, 0.4073521, 0, 0, 0, 1, 1,
0.4715071, 0.4784377, 0.3480618, 0, 0, 0, 1, 1,
0.4764726, -1.8404, 2.144229, 1, 1, 1, 1, 1,
0.4770507, -0.4912645, 3.3878, 1, 1, 1, 1, 1,
0.4821729, 1.346383, -0.7024432, 1, 1, 1, 1, 1,
0.4914218, -0.497695, 1.992769, 1, 1, 1, 1, 1,
0.4925878, 0.8954622, 1.156838, 1, 1, 1, 1, 1,
0.4931198, -2.246708, 3.404087, 1, 1, 1, 1, 1,
0.494195, -0.8180259, 2.047183, 1, 1, 1, 1, 1,
0.4945144, 1.229585, 0.8262093, 1, 1, 1, 1, 1,
0.498603, -1.025041, 2.618441, 1, 1, 1, 1, 1,
0.5054343, -0.4230566, 1.077013, 1, 1, 1, 1, 1,
0.5107318, -1.18278, 2.165796, 1, 1, 1, 1, 1,
0.5123551, -0.6420967, 3.584803, 1, 1, 1, 1, 1,
0.5178713, 0.5013115, 0.447531, 1, 1, 1, 1, 1,
0.521452, 1.080932, 1.19905, 1, 1, 1, 1, 1,
0.5277779, 1.269385, 0.1258806, 1, 1, 1, 1, 1,
0.5300403, 0.1722554, 2.345683, 0, 0, 1, 1, 1,
0.5310788, 0.3356925, -1.02064, 1, 0, 0, 1, 1,
0.5362365, 1.590922, 1.776011, 1, 0, 0, 1, 1,
0.5383497, 0.9078697, -0.5567821, 1, 0, 0, 1, 1,
0.5410011, -1.602395, 1.44262, 1, 0, 0, 1, 1,
0.5419194, 1.768252, 1.038679, 1, 0, 0, 1, 1,
0.5445279, -0.5391183, 3.096534, 0, 0, 0, 1, 1,
0.5470255, 0.9567663, -0.2790599, 0, 0, 0, 1, 1,
0.5505737, -0.3599429, 1.399195, 0, 0, 0, 1, 1,
0.5520739, 0.2225292, 2.756192, 0, 0, 0, 1, 1,
0.5563945, -0.4427789, 1.433959, 0, 0, 0, 1, 1,
0.5589631, 0.2038114, 0.9367256, 0, 0, 0, 1, 1,
0.5606119, 1.01405, 0.1591718, 0, 0, 0, 1, 1,
0.5636917, 1.437343, 0.2219174, 1, 1, 1, 1, 1,
0.5647699, 0.4947348, -1.789875, 1, 1, 1, 1, 1,
0.5726344, -1.10303, 4.848283, 1, 1, 1, 1, 1,
0.5739046, 1.29375, 0.5266426, 1, 1, 1, 1, 1,
0.5759068, -1.221582, 0.7592038, 1, 1, 1, 1, 1,
0.5837611, -0.7200615, 2.059788, 1, 1, 1, 1, 1,
0.5951556, -0.8548799, 2.164665, 1, 1, 1, 1, 1,
0.5958725, 0.09001313, 2.226565, 1, 1, 1, 1, 1,
0.5971931, 0.7013779, -0.1437157, 1, 1, 1, 1, 1,
0.5999144, -0.6045202, 4.206165, 1, 1, 1, 1, 1,
0.600642, -1.262713, 2.770412, 1, 1, 1, 1, 1,
0.6063383, -0.03322786, 1.545265, 1, 1, 1, 1, 1,
0.617807, 0.9904321, 2.586709, 1, 1, 1, 1, 1,
0.6191463, 1.778469, 0.08903629, 1, 1, 1, 1, 1,
0.6191543, -0.574671, 2.231528, 1, 1, 1, 1, 1,
0.6251694, 0.7764304, 0.3745992, 0, 0, 1, 1, 1,
0.6286684, -1.461964, -0.2927622, 1, 0, 0, 1, 1,
0.6293678, 1.09385, 0.5270432, 1, 0, 0, 1, 1,
0.632122, 1.750298, 0.7977929, 1, 0, 0, 1, 1,
0.6325969, 0.2496896, -0.2740516, 1, 0, 0, 1, 1,
0.633389, 2.663576, -0.1448938, 1, 0, 0, 1, 1,
0.6362486, -1.46612, 4.124298, 0, 0, 0, 1, 1,
0.6363896, 0.2727588, 2.067063, 0, 0, 0, 1, 1,
0.6393791, -0.2913994, 2.25894, 0, 0, 0, 1, 1,
0.6410326, -0.4553022, 3.716122, 0, 0, 0, 1, 1,
0.6465608, 0.05472231, 2.280813, 0, 0, 0, 1, 1,
0.651385, -0.1915404, 0.3491479, 0, 0, 0, 1, 1,
0.6525633, -0.2482641, 2.329689, 0, 0, 0, 1, 1,
0.6532175, -0.311375, 0.3420894, 1, 1, 1, 1, 1,
0.6539876, 1.715305, -2.013887, 1, 1, 1, 1, 1,
0.6694661, 1.09375, -0.4051202, 1, 1, 1, 1, 1,
0.6778978, -0.8266128, 2.607708, 1, 1, 1, 1, 1,
0.6809546, 0.0787578, 1.713444, 1, 1, 1, 1, 1,
0.682083, 0.2318835, 1.735668, 1, 1, 1, 1, 1,
0.6824267, -1.245333, 3.124139, 1, 1, 1, 1, 1,
0.6838615, -0.6736373, 0.5055069, 1, 1, 1, 1, 1,
0.6908688, -0.2121522, 2.379056, 1, 1, 1, 1, 1,
0.6909237, -0.1616457, 2.220718, 1, 1, 1, 1, 1,
0.6984938, 0.5755787, 0.1407502, 1, 1, 1, 1, 1,
0.6993453, 1.194978, -0.6346799, 1, 1, 1, 1, 1,
0.7005453, 0.5271178, 1.035035, 1, 1, 1, 1, 1,
0.7008567, -0.952175, 3.947462, 1, 1, 1, 1, 1,
0.7043332, 2.074602, 0.0291761, 1, 1, 1, 1, 1,
0.7052515, -0.4310447, 2.187123, 0, 0, 1, 1, 1,
0.7076247, -0.1537641, 2.615152, 1, 0, 0, 1, 1,
0.717898, 1.253414, 2.040538, 1, 0, 0, 1, 1,
0.7181944, -0.9176269, 3.677771, 1, 0, 0, 1, 1,
0.7182822, -0.02647013, 2.792385, 1, 0, 0, 1, 1,
0.7186068, 0.6993265, 0.266221, 1, 0, 0, 1, 1,
0.722008, 0.3553316, 2.807032, 0, 0, 0, 1, 1,
0.7226295, 0.1246911, 1.646136, 0, 0, 0, 1, 1,
0.722793, 0.8679905, 0.2244042, 0, 0, 0, 1, 1,
0.724089, 3.228265, -1.186768, 0, 0, 0, 1, 1,
0.7281464, -0.523298, 3.123021, 0, 0, 0, 1, 1,
0.7304078, -0.0334345, 1.870122, 0, 0, 0, 1, 1,
0.7379999, -1.163112, 4.005844, 0, 0, 0, 1, 1,
0.738309, 0.4541941, 0.1134001, 1, 1, 1, 1, 1,
0.739755, -0.4919567, 1.501667, 1, 1, 1, 1, 1,
0.7474123, 0.6392651, -0.7029194, 1, 1, 1, 1, 1,
0.7642084, 1.195484, 0.06660721, 1, 1, 1, 1, 1,
0.7682384, 1.866673, -0.5915771, 1, 1, 1, 1, 1,
0.7701133, -1.893207, 2.696011, 1, 1, 1, 1, 1,
0.7730662, -0.7528574, 2.784804, 1, 1, 1, 1, 1,
0.7758936, 0.690093, -1.233053, 1, 1, 1, 1, 1,
0.7806834, -0.8252153, 3.57877, 1, 1, 1, 1, 1,
0.7813413, 0.1638373, 1.631118, 1, 1, 1, 1, 1,
0.7822974, 0.9481999, 0.5519304, 1, 1, 1, 1, 1,
0.7916901, 0.8333859, -0.7433397, 1, 1, 1, 1, 1,
0.7953985, -1.165825, 2.876116, 1, 1, 1, 1, 1,
0.7954659, -1.655481, 1.086562, 1, 1, 1, 1, 1,
0.7985551, 0.9458549, 2.055046, 1, 1, 1, 1, 1,
0.8029017, -0.9876432, 4.903556, 0, 0, 1, 1, 1,
0.8076426, -1.165268, 2.160667, 1, 0, 0, 1, 1,
0.8264761, -0.4182858, 1.964754, 1, 0, 0, 1, 1,
0.8271611, -0.73987, 3.917089, 1, 0, 0, 1, 1,
0.8280175, 0.2839944, 2.205482, 1, 0, 0, 1, 1,
0.8319435, 0.871397, 0.139122, 1, 0, 0, 1, 1,
0.8341942, 0.1702657, 1.937285, 0, 0, 0, 1, 1,
0.8421478, 0.3698709, 1.919371, 0, 0, 0, 1, 1,
0.8594781, 1.737481, 2.981428, 0, 0, 0, 1, 1,
0.8623823, 0.9528503, 0.4008945, 0, 0, 0, 1, 1,
0.8746775, -1.405048, 2.151803, 0, 0, 0, 1, 1,
0.897132, 0.1379415, 0.4075418, 0, 0, 0, 1, 1,
0.8976207, 0.08002262, 1.722803, 0, 0, 0, 1, 1,
0.8985384, -0.3772376, 2.070922, 1, 1, 1, 1, 1,
0.9021649, 0.1997207, 0.9618908, 1, 1, 1, 1, 1,
0.9027426, 2.014006, 1.579908, 1, 1, 1, 1, 1,
0.9057109, -0.6473936, 1.770724, 1, 1, 1, 1, 1,
0.9068295, -1.843427, 2.620557, 1, 1, 1, 1, 1,
0.9114613, 0.1906309, 1.662635, 1, 1, 1, 1, 1,
0.9162374, -0.4164889, 1.774637, 1, 1, 1, 1, 1,
0.9169278, -0.04341444, 1.181249, 1, 1, 1, 1, 1,
0.9187787, -0.1756515, 2.16234, 1, 1, 1, 1, 1,
0.9223068, 0.2975086, 0.6217114, 1, 1, 1, 1, 1,
0.922535, 0.1541686, 0.4574447, 1, 1, 1, 1, 1,
0.9246578, 0.4040079, 2.190652, 1, 1, 1, 1, 1,
0.9278971, 1.350085, 0.8682846, 1, 1, 1, 1, 1,
0.9309071, 1.101188, 3.277355, 1, 1, 1, 1, 1,
0.9382252, -0.3615844, 1.864599, 1, 1, 1, 1, 1,
0.9424469, -2.169321, 1.821237, 0, 0, 1, 1, 1,
0.9464063, -2.06126, 2.847331, 1, 0, 0, 1, 1,
0.9479561, -0.4251615, 2.095639, 1, 0, 0, 1, 1,
0.9494783, 0.831619, 1.401272, 1, 0, 0, 1, 1,
0.9597057, -0.0122685, 2.278771, 1, 0, 0, 1, 1,
0.9617693, 0.06203955, -0.07870659, 1, 0, 0, 1, 1,
0.9697834, 0.8523765, 1.260404, 0, 0, 0, 1, 1,
0.9702205, -0.5460429, 2.316097, 0, 0, 0, 1, 1,
0.9709837, 0.656484, 1.843629, 0, 0, 0, 1, 1,
0.9713669, 1.417539, 0.2101847, 0, 0, 0, 1, 1,
0.9722749, -1.156322, 0.9109524, 0, 0, 0, 1, 1,
0.9768121, 0.6278886, 2.329543, 0, 0, 0, 1, 1,
0.9769239, -0.4418917, 1.518354, 0, 0, 0, 1, 1,
0.9805666, 2.934416, 1.059186, 1, 1, 1, 1, 1,
0.9829263, 0.2845057, 0.7606761, 1, 1, 1, 1, 1,
0.9830981, -1.501611, 2.016297, 1, 1, 1, 1, 1,
0.9841701, 1.687718, -0.2620323, 1, 1, 1, 1, 1,
0.9854025, 0.9670733, 0.4142747, 1, 1, 1, 1, 1,
1.000077, 0.2632205, 1.425221, 1, 1, 1, 1, 1,
1.002433, -1.066686, 2.875946, 1, 1, 1, 1, 1,
1.013099, -0.7467082, 2.798927, 1, 1, 1, 1, 1,
1.013553, -0.009382299, 1.738633, 1, 1, 1, 1, 1,
1.021283, -1.013162, 2.650097, 1, 1, 1, 1, 1,
1.035083, 0.9487488, 0.4649419, 1, 1, 1, 1, 1,
1.038926, 1.050257, 0.5829322, 1, 1, 1, 1, 1,
1.041357, -1.851534, 1.661226, 1, 1, 1, 1, 1,
1.042077, -0.4215448, 0.4541982, 1, 1, 1, 1, 1,
1.049036, 0.4734946, 1.11453, 1, 1, 1, 1, 1,
1.049774, -0.1346959, 1.598676, 0, 0, 1, 1, 1,
1.062526, 0.5884083, 1.127987, 1, 0, 0, 1, 1,
1.064, 0.1436175, 1.676731, 1, 0, 0, 1, 1,
1.067842, -0.2917172, 1.678964, 1, 0, 0, 1, 1,
1.069554, 0.05900692, 3.956293, 1, 0, 0, 1, 1,
1.076735, -0.6988906, 2.608136, 1, 0, 0, 1, 1,
1.08773, -0.436612, 1.93038, 0, 0, 0, 1, 1,
1.090608, 1.90627, 1.571182, 0, 0, 0, 1, 1,
1.097144, -0.0658505, 1.054295, 0, 0, 0, 1, 1,
1.100764, 0.5801781, 0.7793055, 0, 0, 0, 1, 1,
1.104263, 0.2422784, 1.107459, 0, 0, 0, 1, 1,
1.107029, -0.6691628, 2.352836, 0, 0, 0, 1, 1,
1.109927, 0.8218562, 0.5662481, 0, 0, 0, 1, 1,
1.110066, -1.35308, 2.564245, 1, 1, 1, 1, 1,
1.119678, -0.8247331, 1.686536, 1, 1, 1, 1, 1,
1.126203, 0.7811641, 0.9932945, 1, 1, 1, 1, 1,
1.12923, 1.310678, 0.5597841, 1, 1, 1, 1, 1,
1.134179, -0.1788777, 1.352488, 1, 1, 1, 1, 1,
1.136069, 0.8734882, 2.417495, 1, 1, 1, 1, 1,
1.143896, -0.600731, 2.811663, 1, 1, 1, 1, 1,
1.149969, 0.4196706, -0.5455443, 1, 1, 1, 1, 1,
1.159209, -0.3103175, 1.124808, 1, 1, 1, 1, 1,
1.165069, 0.02817823, 1.577711, 1, 1, 1, 1, 1,
1.168685, -0.5924428, 1.539468, 1, 1, 1, 1, 1,
1.169453, 0.1797176, 2.184338, 1, 1, 1, 1, 1,
1.173321, -1.05709, 0.765365, 1, 1, 1, 1, 1,
1.178021, 0.6763228, 1.149171, 1, 1, 1, 1, 1,
1.188044, -0.4066576, 3.297553, 1, 1, 1, 1, 1,
1.19407, -1.238951, 1.774655, 0, 0, 1, 1, 1,
1.196689, -0.5122531, 3.043995, 1, 0, 0, 1, 1,
1.198667, -0.643878, 3.580446, 1, 0, 0, 1, 1,
1.199091, 0.1817084, 1.392478, 1, 0, 0, 1, 1,
1.199865, -0.7113898, 2.730249, 1, 0, 0, 1, 1,
1.201428, -0.6258135, 2.625454, 1, 0, 0, 1, 1,
1.218845, 0.2735502, 1.956009, 0, 0, 0, 1, 1,
1.227886, 1.597559, 0.8174369, 0, 0, 0, 1, 1,
1.235197, 1.019713, -0.2237201, 0, 0, 0, 1, 1,
1.235917, 0.6168513, 1.367343, 0, 0, 0, 1, 1,
1.237473, 1.748427, 1.293852, 0, 0, 0, 1, 1,
1.238428, 0.1056278, 1.147759, 0, 0, 0, 1, 1,
1.238906, -0.1124178, 2.235386, 0, 0, 0, 1, 1,
1.242408, -0.7956083, 1.395855, 1, 1, 1, 1, 1,
1.242542, -0.0255507, 0.8059848, 1, 1, 1, 1, 1,
1.245867, -0.3905094, 1.428524, 1, 1, 1, 1, 1,
1.249652, -0.9276661, 1.810241, 1, 1, 1, 1, 1,
1.250644, 0.5015196, 0.7443112, 1, 1, 1, 1, 1,
1.251029, -0.2244271, 1.310079, 1, 1, 1, 1, 1,
1.252823, 0.03930187, 1.260864, 1, 1, 1, 1, 1,
1.254794, -0.7971329, 1.545994, 1, 1, 1, 1, 1,
1.256993, -1.022111, 3.441692, 1, 1, 1, 1, 1,
1.262139, -0.1905826, 1.314008, 1, 1, 1, 1, 1,
1.269463, -1.163137, 0.9160014, 1, 1, 1, 1, 1,
1.27323, 1.838726, 1.805466, 1, 1, 1, 1, 1,
1.284241, -0.8523184, 1.415518, 1, 1, 1, 1, 1,
1.289319, -0.7974239, 3.514804, 1, 1, 1, 1, 1,
1.296658, 0.1613902, 2.079777, 1, 1, 1, 1, 1,
1.307556, 0.3952278, -0.1934237, 0, 0, 1, 1, 1,
1.309081, -1.384891, 1.398451, 1, 0, 0, 1, 1,
1.310349, 1.653307, 2.836078, 1, 0, 0, 1, 1,
1.341226, -0.8301617, 2.038047, 1, 0, 0, 1, 1,
1.345318, -0.9876186, 1.991324, 1, 0, 0, 1, 1,
1.348168, -0.9603391, 1.443155, 1, 0, 0, 1, 1,
1.350421, -0.6588036, 1.427703, 0, 0, 0, 1, 1,
1.362095, -0.3560981, 1.347856, 0, 0, 0, 1, 1,
1.375047, 0.8815374, 0.3953849, 0, 0, 0, 1, 1,
1.376653, -0.1944775, 0.917502, 0, 0, 0, 1, 1,
1.378372, 0.1340363, 1.376015, 0, 0, 0, 1, 1,
1.388273, -0.2383936, 1.631118, 0, 0, 0, 1, 1,
1.395941, -1.321613, 1.475661, 0, 0, 0, 1, 1,
1.397167, -0.4446139, 1.182052, 1, 1, 1, 1, 1,
1.398419, -1.751384, 2.338122, 1, 1, 1, 1, 1,
1.408873, -1.184583, 3.717816, 1, 1, 1, 1, 1,
1.417311, 1.03943, 1.607086, 1, 1, 1, 1, 1,
1.432976, 0.4121785, 1.86448, 1, 1, 1, 1, 1,
1.435368, 0.1473314, 0.5444034, 1, 1, 1, 1, 1,
1.440258, 0.8424395, 2.36006, 1, 1, 1, 1, 1,
1.452716, 1.344061, 1.647723, 1, 1, 1, 1, 1,
1.455797, -0.8483524, 1.998235, 1, 1, 1, 1, 1,
1.476329, -0.4293569, 1.570337, 1, 1, 1, 1, 1,
1.480612, 0.492118, 0.3213492, 1, 1, 1, 1, 1,
1.499832, 0.05903148, 2.436017, 1, 1, 1, 1, 1,
1.540585, -0.1179056, 1.900419, 1, 1, 1, 1, 1,
1.553298, 2.486479, -2.318284, 1, 1, 1, 1, 1,
1.554897, 1.236471, 0.7843067, 1, 1, 1, 1, 1,
1.555612, -0.584053, 1.396324, 0, 0, 1, 1, 1,
1.572034, -1.500769, 2.158659, 1, 0, 0, 1, 1,
1.581644, -1.233239, 4.445764, 1, 0, 0, 1, 1,
1.585584, -0.1649961, 2.575372, 1, 0, 0, 1, 1,
1.604752, 0.4820209, 0.3179865, 1, 0, 0, 1, 1,
1.605916, 1.414207, 1.148793, 1, 0, 0, 1, 1,
1.609597, 0.9688068, 1.844058, 0, 0, 0, 1, 1,
1.616363, 0.8620561, 1.919154, 0, 0, 0, 1, 1,
1.62356, 1.332333, 2.588721, 0, 0, 0, 1, 1,
1.633941, 1.204277, 1.085591, 0, 0, 0, 1, 1,
1.660875, -1.373649, 3.359138, 0, 0, 0, 1, 1,
1.671627, -0.12943, 1.667919, 0, 0, 0, 1, 1,
1.76406, -0.885679, 1.730243, 0, 0, 0, 1, 1,
1.789005, -0.2630639, 2.408625, 1, 1, 1, 1, 1,
1.830022, 0.31014, 0.4443693, 1, 1, 1, 1, 1,
1.873137, -1.240753, 1.053259, 1, 1, 1, 1, 1,
1.877145, -1.289973, 1.753357, 1, 1, 1, 1, 1,
1.882621, -0.09891295, 2.69618, 1, 1, 1, 1, 1,
1.882816, 1.442968, 0.5362909, 1, 1, 1, 1, 1,
1.918494, -0.7648233, 3.019223, 1, 1, 1, 1, 1,
1.923541, 1.405272, 3.010818, 1, 1, 1, 1, 1,
1.94214, -0.4742, -0.2271343, 1, 1, 1, 1, 1,
1.951743, -1.264996, 2.485685, 1, 1, 1, 1, 1,
1.952051, -0.5006584, 1.962796, 1, 1, 1, 1, 1,
1.972339, -1.43072, 1.303153, 1, 1, 1, 1, 1,
1.984657, 0.007253899, 1.627552, 1, 1, 1, 1, 1,
2.04038, 0.1193055, 2.138669, 1, 1, 1, 1, 1,
2.11833, -1.851818, 4.252573, 1, 1, 1, 1, 1,
2.135361, -1.451655, 1.80026, 0, 0, 1, 1, 1,
2.145257, 0.4986189, 0.98575, 1, 0, 0, 1, 1,
2.159432, -0.6194218, 0.4602539, 1, 0, 0, 1, 1,
2.160452, -0.941585, 2.227967, 1, 0, 0, 1, 1,
2.262604, 1.177972, 2.024229, 1, 0, 0, 1, 1,
2.264669, -0.3478921, 0.6358989, 1, 0, 0, 1, 1,
2.267886, 1.069366, 3.113332, 0, 0, 0, 1, 1,
2.304616, 0.008198894, 4.827466, 0, 0, 0, 1, 1,
2.333697, 0.680445, 2.33813, 0, 0, 0, 1, 1,
2.420877, -0.6323388, 0.6244928, 0, 0, 0, 1, 1,
2.467137, 0.9261357, 1.758251, 0, 0, 0, 1, 1,
2.549453, 0.4607669, 0.3257186, 0, 0, 0, 1, 1,
2.598237, -0.05359981, 1.796402, 0, 0, 0, 1, 1,
2.715501, -0.7026393, 2.253923, 1, 1, 1, 1, 1,
2.885089, -0.1622229, 0.9077607, 1, 1, 1, 1, 1,
2.956614, 0.9351915, 1.770645, 1, 1, 1, 1, 1,
3.000897, 0.4025824, 1.401784, 1, 1, 1, 1, 1,
3.048723, -0.4322541, 2.761308, 1, 1, 1, 1, 1,
3.116135, -0.1131478, 2.00761, 1, 1, 1, 1, 1,
3.117632, 0.9567037, 0.3274525, 1, 1, 1, 1, 1
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
var radius = 9.923054;
var distance = 34.85431;
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
mvMatrix.translate( 0.0609889, 0.2981725, 0.03071594 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.85431);
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
