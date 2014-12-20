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
-3.517565, 1.866146, -0.4959801, 1, 0, 0, 1,
-3.344345, -0.1984238, -3.375645, 1, 0.007843138, 0, 1,
-2.870228, 1.218031, -0.3536502, 1, 0.01176471, 0, 1,
-2.454703, 0.7766441, 0.02121797, 1, 0.01960784, 0, 1,
-2.279278, 0.4988109, -2.012427, 1, 0.02352941, 0, 1,
-2.214343, -0.481808, -1.843292, 1, 0.03137255, 0, 1,
-2.176134, -0.2446574, -1.261263, 1, 0.03529412, 0, 1,
-2.127775, -1.005501, -0.5017605, 1, 0.04313726, 0, 1,
-2.100884, -0.8369038, -0.4233374, 1, 0.04705882, 0, 1,
-2.073386, -1.094857, -2.268403, 1, 0.05490196, 0, 1,
-2.060925, 0.6455609, 0.1540552, 1, 0.05882353, 0, 1,
-2.053175, -0.4913676, -1.434205, 1, 0.06666667, 0, 1,
-2.03001, -0.06310999, -0.8480408, 1, 0.07058824, 0, 1,
-2.028516, -1.759633, -1.899192, 1, 0.07843138, 0, 1,
-2.005861, 1.522706, 0.2395785, 1, 0.08235294, 0, 1,
-2.005188, 1.05769, -1.553908, 1, 0.09019608, 0, 1,
-2.004755, -0.002380166, -0.149625, 1, 0.09411765, 0, 1,
-1.978267, -0.162357, -1.378499, 1, 0.1019608, 0, 1,
-1.951327, -0.5850954, -3.751422, 1, 0.1098039, 0, 1,
-1.947542, 0.6623921, -1.24152, 1, 0.1137255, 0, 1,
-1.936535, 0.05610142, -1.440404, 1, 0.1215686, 0, 1,
-1.935399, 0.9541412, -0.8697814, 1, 0.1254902, 0, 1,
-1.929269, -1.583047, -2.33811, 1, 0.1333333, 0, 1,
-1.91397, -0.4102016, -1.267506, 1, 0.1372549, 0, 1,
-1.911509, 1.301838, -1.954211, 1, 0.145098, 0, 1,
-1.910497, 0.9521987, -0.9352932, 1, 0.1490196, 0, 1,
-1.910433, -0.5034411, -1.391199, 1, 0.1568628, 0, 1,
-1.894091, 0.1556731, -3.750785, 1, 0.1607843, 0, 1,
-1.863652, -0.01682679, -1.858336, 1, 0.1686275, 0, 1,
-1.843247, -0.008011144, -0.9414331, 1, 0.172549, 0, 1,
-1.838106, -1.757737, -4.690824, 1, 0.1803922, 0, 1,
-1.837135, -0.9340887, -2.968558, 1, 0.1843137, 0, 1,
-1.829263, -0.6290058, -2.470362, 1, 0.1921569, 0, 1,
-1.827376, 0.4106149, -0.4460731, 1, 0.1960784, 0, 1,
-1.801612, -0.8857677, -1.233146, 1, 0.2039216, 0, 1,
-1.785188, -0.8683631, -2.073485, 1, 0.2117647, 0, 1,
-1.783125, -0.1901595, -1.940536, 1, 0.2156863, 0, 1,
-1.759515, 0.4681244, -1.492544, 1, 0.2235294, 0, 1,
-1.757541, 0.1516418, -1.271778, 1, 0.227451, 0, 1,
-1.749218, 0.5244268, -1.824799, 1, 0.2352941, 0, 1,
-1.72019, -1.960861, -1.997237, 1, 0.2392157, 0, 1,
-1.7099, -0.4216588, -2.080824, 1, 0.2470588, 0, 1,
-1.709128, 0.4612612, -0.6477437, 1, 0.2509804, 0, 1,
-1.706655, 0.3160856, -0.1584533, 1, 0.2588235, 0, 1,
-1.685728, -1.407739, -1.504934, 1, 0.2627451, 0, 1,
-1.68485, -0.1932407, -1.681845, 1, 0.2705882, 0, 1,
-1.665503, 1.391803, -0.5505421, 1, 0.2745098, 0, 1,
-1.664422, 1.439334, -1.632931, 1, 0.282353, 0, 1,
-1.652378, -0.2116947, -2.180974, 1, 0.2862745, 0, 1,
-1.646889, -0.4426981, -2.331051, 1, 0.2941177, 0, 1,
-1.627637, 0.1242021, -1.415152, 1, 0.3019608, 0, 1,
-1.608198, 4.802917, -0.8144352, 1, 0.3058824, 0, 1,
-1.588514, 1.110207, -1.079169, 1, 0.3137255, 0, 1,
-1.579306, 0.5689024, -2.332812, 1, 0.3176471, 0, 1,
-1.576783, 0.3439464, -1.019024, 1, 0.3254902, 0, 1,
-1.572298, 2.07183, -1.402362, 1, 0.3294118, 0, 1,
-1.565004, 0.7330629, -1.653663, 1, 0.3372549, 0, 1,
-1.557232, 1.009357, -2.2918, 1, 0.3411765, 0, 1,
-1.554111, 0.6597378, -0.0385737, 1, 0.3490196, 0, 1,
-1.548637, 0.4827763, -3.13236, 1, 0.3529412, 0, 1,
-1.531887, 0.4276888, 0.3318788, 1, 0.3607843, 0, 1,
-1.520683, 0.338615, 0.1452469, 1, 0.3647059, 0, 1,
-1.514392, 0.3921338, -1.245836, 1, 0.372549, 0, 1,
-1.514075, -1.677052, -2.805738, 1, 0.3764706, 0, 1,
-1.513331, -0.6058262, -1.403887, 1, 0.3843137, 0, 1,
-1.511522, -0.3769719, -0.6184129, 1, 0.3882353, 0, 1,
-1.510844, -0.8797424, -3.196692, 1, 0.3960784, 0, 1,
-1.507103, 1.517339, -1.488761, 1, 0.4039216, 0, 1,
-1.502872, 1.124472, -2.174825, 1, 0.4078431, 0, 1,
-1.499715, 0.8259858, -0.5961186, 1, 0.4156863, 0, 1,
-1.492805, -0.2479891, -2.045019, 1, 0.4196078, 0, 1,
-1.491587, 0.6930165, -0.6775879, 1, 0.427451, 0, 1,
-1.486372, 0.6207532, -1.224674, 1, 0.4313726, 0, 1,
-1.465626, 1.082016, -1.450842, 1, 0.4392157, 0, 1,
-1.463901, 1.830378, -0.9552449, 1, 0.4431373, 0, 1,
-1.459604, -1.97966, -1.779076, 1, 0.4509804, 0, 1,
-1.455497, -1.973172, -0.3335467, 1, 0.454902, 0, 1,
-1.454268, -1.402112, -2.230461, 1, 0.4627451, 0, 1,
-1.452555, -2.816714, -1.856613, 1, 0.4666667, 0, 1,
-1.441067, -0.3763551, 0.1139744, 1, 0.4745098, 0, 1,
-1.438645, -1.94061, -3.856416, 1, 0.4784314, 0, 1,
-1.437, 0.6458102, -1.797511, 1, 0.4862745, 0, 1,
-1.425107, -1.939667, -2.845264, 1, 0.4901961, 0, 1,
-1.424172, 0.3650852, -1.076124, 1, 0.4980392, 0, 1,
-1.419124, 0.6561187, -0.9617404, 1, 0.5058824, 0, 1,
-1.415886, -0.1776239, -1.123201, 1, 0.509804, 0, 1,
-1.414397, -0.2196337, -2.307066, 1, 0.5176471, 0, 1,
-1.400457, 1.038071, -0.5055726, 1, 0.5215687, 0, 1,
-1.392879, -0.5038087, -3.016491, 1, 0.5294118, 0, 1,
-1.390752, 1.168497, -0.8486239, 1, 0.5333334, 0, 1,
-1.384896, 0.5965478, -1.631827, 1, 0.5411765, 0, 1,
-1.378796, -0.8932832, -2.915833, 1, 0.5450981, 0, 1,
-1.377579, 0.04905966, -3.518399, 1, 0.5529412, 0, 1,
-1.371629, 0.9839491, 0.250196, 1, 0.5568628, 0, 1,
-1.367641, 2.921189, -1.630077, 1, 0.5647059, 0, 1,
-1.34784, -0.7458524, -3.500275, 1, 0.5686275, 0, 1,
-1.344751, 0.2356181, 0.5404946, 1, 0.5764706, 0, 1,
-1.329536, 1.067656, -0.6372092, 1, 0.5803922, 0, 1,
-1.329403, 0.3279377, -1.022828, 1, 0.5882353, 0, 1,
-1.310913, 0.2627062, -0.2897574, 1, 0.5921569, 0, 1,
-1.292537, -2.137188, -2.807393, 1, 0.6, 0, 1,
-1.291082, 0.6281088, -0.911391, 1, 0.6078432, 0, 1,
-1.287545, -0.5792556, -3.762521, 1, 0.6117647, 0, 1,
-1.282832, -1.020975, -1.149407, 1, 0.6196079, 0, 1,
-1.282272, -0.7320838, -2.354675, 1, 0.6235294, 0, 1,
-1.275211, 0.6923758, 0.3097855, 1, 0.6313726, 0, 1,
-1.273251, -0.4339625, -3.386376, 1, 0.6352941, 0, 1,
-1.266577, 0.192695, -1.657663, 1, 0.6431373, 0, 1,
-1.266554, -1.250328, -0.4892198, 1, 0.6470588, 0, 1,
-1.250559, 1.081311, 0.8421181, 1, 0.654902, 0, 1,
-1.249549, -1.012008, -3.636495, 1, 0.6588235, 0, 1,
-1.23206, 1.014675, -1.117132, 1, 0.6666667, 0, 1,
-1.228391, -0.1253936, -3.515338, 1, 0.6705883, 0, 1,
-1.225652, -1.120708, -2.525776, 1, 0.6784314, 0, 1,
-1.2211, -0.1942393, -1.636865, 1, 0.682353, 0, 1,
-1.220135, -0.3042642, -2.883798, 1, 0.6901961, 0, 1,
-1.212603, 0.3085073, -1.473649, 1, 0.6941177, 0, 1,
-1.211601, -0.7448974, -2.290424, 1, 0.7019608, 0, 1,
-1.209389, -1.117009, -0.9944321, 1, 0.7098039, 0, 1,
-1.204353, -0.8766682, -2.374496, 1, 0.7137255, 0, 1,
-1.194044, 2.023779, 0.1650444, 1, 0.7215686, 0, 1,
-1.193768, 1.712427, -0.7181525, 1, 0.7254902, 0, 1,
-1.191386, -0.9464353, -2.557066, 1, 0.7333333, 0, 1,
-1.191129, -0.6449587, -3.447958, 1, 0.7372549, 0, 1,
-1.184762, 0.9718597, -2.627321, 1, 0.7450981, 0, 1,
-1.172418, -2.255223, -1.652999, 1, 0.7490196, 0, 1,
-1.154914, 0.1115511, -0.3251436, 1, 0.7568628, 0, 1,
-1.153083, 0.5647493, -2.334942, 1, 0.7607843, 0, 1,
-1.149443, -0.2163486, -2.270341, 1, 0.7686275, 0, 1,
-1.146163, 0.02765022, 0.09045355, 1, 0.772549, 0, 1,
-1.141551, 0.1747762, -0.3075716, 1, 0.7803922, 0, 1,
-1.138976, -0.8598157, -1.924018, 1, 0.7843137, 0, 1,
-1.136361, 0.5816134, -1.938102, 1, 0.7921569, 0, 1,
-1.13579, 0.2275176, -2.042341, 1, 0.7960784, 0, 1,
-1.129121, -1.474946, -2.201862, 1, 0.8039216, 0, 1,
-1.123291, -0.4133952, -1.420382, 1, 0.8117647, 0, 1,
-1.120507, -0.3589081, -1.792496, 1, 0.8156863, 0, 1,
-1.118575, 0.4456093, -1.32791, 1, 0.8235294, 0, 1,
-1.118301, -0.06377973, 0.8758178, 1, 0.827451, 0, 1,
-1.116562, -2.066023, -2.252376, 1, 0.8352941, 0, 1,
-1.115802, -0.7009361, -2.988829, 1, 0.8392157, 0, 1,
-1.114401, -0.8837674, -3.760422, 1, 0.8470588, 0, 1,
-1.113301, -0.6058415, -2.619688, 1, 0.8509804, 0, 1,
-1.104738, 0.3615273, -1.306906, 1, 0.8588235, 0, 1,
-1.100386, -0.6580561, -1.754223, 1, 0.8627451, 0, 1,
-1.095839, 0.1636461, -0.3164033, 1, 0.8705882, 0, 1,
-1.093478, 0.1465734, -2.709198, 1, 0.8745098, 0, 1,
-1.093001, 1.655861, -0.4705633, 1, 0.8823529, 0, 1,
-1.070447, -0.2792662, -0.8509859, 1, 0.8862745, 0, 1,
-1.068531, -0.4137475, -2.167294, 1, 0.8941177, 0, 1,
-1.068422, 0.04447312, -0.287303, 1, 0.8980392, 0, 1,
-1.068378, -0.235302, -0.8860237, 1, 0.9058824, 0, 1,
-1.066048, 0.6624483, 0.7069368, 1, 0.9137255, 0, 1,
-1.062625, 0.1591475, -0.8014687, 1, 0.9176471, 0, 1,
-1.056409, -0.7178093, -1.565116, 1, 0.9254902, 0, 1,
-1.055745, -0.4390533, -0.5104663, 1, 0.9294118, 0, 1,
-1.047774, -0.5145021, -1.716444, 1, 0.9372549, 0, 1,
-1.037753, -1.834446, -3.814761, 1, 0.9411765, 0, 1,
-1.036489, 0.6116167, -0.5462471, 1, 0.9490196, 0, 1,
-1.027497, -1.379994, -2.569309, 1, 0.9529412, 0, 1,
-1.015914, -1.07626, -4.079108, 1, 0.9607843, 0, 1,
-1.012615, -0.8076333, -0.9788294, 1, 0.9647059, 0, 1,
-1.006831, -1.767955, -2.019927, 1, 0.972549, 0, 1,
-1.00227, 1.780943, 0.5397817, 1, 0.9764706, 0, 1,
-1.000904, -0.003743398, -0.9170364, 1, 0.9843137, 0, 1,
-1.000762, -0.8993838, -1.507557, 1, 0.9882353, 0, 1,
-1.000398, 0.2726225, -0.6917212, 1, 0.9960784, 0, 1,
-0.995759, 1.005737, 0.4787572, 0.9960784, 1, 0, 1,
-0.9933749, 0.1681419, -2.858834, 0.9921569, 1, 0, 1,
-0.9923053, -0.9621557, -1.781819, 0.9843137, 1, 0, 1,
-0.9872946, -1.475935, -2.962168, 0.9803922, 1, 0, 1,
-0.9863235, 1.406413, 0.2524732, 0.972549, 1, 0, 1,
-0.9760904, -0.4012361, -2.936785, 0.9686275, 1, 0, 1,
-0.9689056, 2.491291, -0.1947939, 0.9607843, 1, 0, 1,
-0.960264, -0.6682765, -1.621242, 0.9568627, 1, 0, 1,
-0.9575521, -2.236964, -3.864625, 0.9490196, 1, 0, 1,
-0.9532343, -1.925531, -4.003098, 0.945098, 1, 0, 1,
-0.9483544, 0.05273341, -1.808527, 0.9372549, 1, 0, 1,
-0.9478377, -0.07094114, -0.6094883, 0.9333333, 1, 0, 1,
-0.9468898, 1.396449, -0.1374936, 0.9254902, 1, 0, 1,
-0.9337559, 0.715678, -2.068322, 0.9215686, 1, 0, 1,
-0.9336938, 0.1179233, -2.295488, 0.9137255, 1, 0, 1,
-0.9319724, 0.9075054, -0.492617, 0.9098039, 1, 0, 1,
-0.9299359, -0.01159288, -1.54274, 0.9019608, 1, 0, 1,
-0.9230229, -2.639514, -2.896823, 0.8941177, 1, 0, 1,
-0.9211665, 0.3126166, -1.393801, 0.8901961, 1, 0, 1,
-0.9209841, -0.07859647, -0.6349921, 0.8823529, 1, 0, 1,
-0.9196944, 1.098728, -0.5523556, 0.8784314, 1, 0, 1,
-0.916986, 0.1962875, 0.6170642, 0.8705882, 1, 0, 1,
-0.9158394, 0.9011983, -1.338567, 0.8666667, 1, 0, 1,
-0.9135334, -0.8404894, -2.203754, 0.8588235, 1, 0, 1,
-0.9045695, -0.0118288, -0.7450666, 0.854902, 1, 0, 1,
-0.9042642, -0.08155961, -2.764319, 0.8470588, 1, 0, 1,
-0.9018524, -0.3109808, -0.5671058, 0.8431373, 1, 0, 1,
-0.8996584, 1.99227, -1.344159, 0.8352941, 1, 0, 1,
-0.8982912, -0.7634695, -2.623345, 0.8313726, 1, 0, 1,
-0.8979677, -1.336317, -1.297427, 0.8235294, 1, 0, 1,
-0.8936877, -0.529199, -1.147071, 0.8196079, 1, 0, 1,
-0.892451, 0.5270957, -2.110397, 0.8117647, 1, 0, 1,
-0.8871859, -0.8337164, -2.838167, 0.8078431, 1, 0, 1,
-0.8867878, 1.361296, -1.911842, 0.8, 1, 0, 1,
-0.8728174, 0.2469944, -1.818677, 0.7921569, 1, 0, 1,
-0.8703696, 0.3140893, -0.9461889, 0.7882353, 1, 0, 1,
-0.8687691, -0.335687, -1.409642, 0.7803922, 1, 0, 1,
-0.8617363, 0.4222942, -0.9783583, 0.7764706, 1, 0, 1,
-0.8575137, -2.028455, -3.210878, 0.7686275, 1, 0, 1,
-0.8565496, 0.9264642, 1.323289, 0.7647059, 1, 0, 1,
-0.8560675, 0.1161713, -1.898735, 0.7568628, 1, 0, 1,
-0.8504446, 1.162234, -0.4625697, 0.7529412, 1, 0, 1,
-0.8494384, -0.9405751, -2.53132, 0.7450981, 1, 0, 1,
-0.8458919, -1.315233, -2.263464, 0.7411765, 1, 0, 1,
-0.8419768, 0.3342529, -1.815518, 0.7333333, 1, 0, 1,
-0.8407382, -0.6950493, 0.04730564, 0.7294118, 1, 0, 1,
-0.8370571, 1.706939, -1.753123, 0.7215686, 1, 0, 1,
-0.8357633, 0.5758936, 0.4397767, 0.7176471, 1, 0, 1,
-0.8255389, 1.128113, -0.384592, 0.7098039, 1, 0, 1,
-0.8185151, 0.1126598, -0.5378127, 0.7058824, 1, 0, 1,
-0.8173984, -0.6316738, -2.357212, 0.6980392, 1, 0, 1,
-0.8146567, -0.4156684, -0.3419282, 0.6901961, 1, 0, 1,
-0.8125221, -1.699458, -2.882366, 0.6862745, 1, 0, 1,
-0.8097118, -0.1484346, -2.105263, 0.6784314, 1, 0, 1,
-0.8092072, 0.1934607, -1.003978, 0.6745098, 1, 0, 1,
-0.8071134, -0.5574631, -3.975809, 0.6666667, 1, 0, 1,
-0.8041541, 2.57904, -1.063962, 0.6627451, 1, 0, 1,
-0.8038558, -0.3750201, -3.158909, 0.654902, 1, 0, 1,
-0.8019804, 0.5656748, -0.2345091, 0.6509804, 1, 0, 1,
-0.7952649, -0.3491609, -1.84977, 0.6431373, 1, 0, 1,
-0.7935408, 1.113577, -0.3694123, 0.6392157, 1, 0, 1,
-0.7927217, 0.04940913, -1.605337, 0.6313726, 1, 0, 1,
-0.792638, 0.7492996, -0.7017449, 0.627451, 1, 0, 1,
-0.7911713, 1.005404, -2.035678, 0.6196079, 1, 0, 1,
-0.7790118, -1.714419, -3.219315, 0.6156863, 1, 0, 1,
-0.7761838, 1.076571, -2.036513, 0.6078432, 1, 0, 1,
-0.7653643, -0.5149977, -2.394765, 0.6039216, 1, 0, 1,
-0.7625743, 0.9891996, -1.821987, 0.5960785, 1, 0, 1,
-0.7444897, -0.3230166, -1.041357, 0.5882353, 1, 0, 1,
-0.7404617, 0.1674725, -2.150699, 0.5843138, 1, 0, 1,
-0.7337167, -0.2627923, -1.435133, 0.5764706, 1, 0, 1,
-0.7319157, 2.297967, -0.3016041, 0.572549, 1, 0, 1,
-0.7247581, -0.364223, -1.500326, 0.5647059, 1, 0, 1,
-0.7216488, -1.137945, -3.211469, 0.5607843, 1, 0, 1,
-0.7188539, 0.3710601, -2.661729, 0.5529412, 1, 0, 1,
-0.7170698, 0.1372235, -1.013592, 0.5490196, 1, 0, 1,
-0.716884, 1.003798, -0.3236091, 0.5411765, 1, 0, 1,
-0.7113996, 0.398367, -1.285308, 0.5372549, 1, 0, 1,
-0.7094321, 0.2797792, -0.5174698, 0.5294118, 1, 0, 1,
-0.7062921, -0.5262462, -0.4654965, 0.5254902, 1, 0, 1,
-0.7003545, -0.09131995, -2.116668, 0.5176471, 1, 0, 1,
-0.6994429, 0.06356659, -2.084316, 0.5137255, 1, 0, 1,
-0.6985912, 0.07874072, -2.380624, 0.5058824, 1, 0, 1,
-0.6946456, -0.3812794, -1.314169, 0.5019608, 1, 0, 1,
-0.6872292, -0.9393767, -2.29621, 0.4941176, 1, 0, 1,
-0.6810503, 0.903661, -0.9083961, 0.4862745, 1, 0, 1,
-0.6769639, -0.9875358, -1.131063, 0.4823529, 1, 0, 1,
-0.6753046, 0.02362948, -2.315562, 0.4745098, 1, 0, 1,
-0.6717077, 1.033331, 0.7571078, 0.4705882, 1, 0, 1,
-0.668845, -0.4501064, -2.320393, 0.4627451, 1, 0, 1,
-0.6660004, 1.429786, -0.3181704, 0.4588235, 1, 0, 1,
-0.6620939, -1.203838, -2.082567, 0.4509804, 1, 0, 1,
-0.661159, 0.1476902, -1.168276, 0.4470588, 1, 0, 1,
-0.6579241, -2.198672, -2.015545, 0.4392157, 1, 0, 1,
-0.6535749, -1.492601, -4.190384, 0.4352941, 1, 0, 1,
-0.6519637, 0.1120699, -1.540671, 0.427451, 1, 0, 1,
-0.6434728, 0.1567022, -2.368969, 0.4235294, 1, 0, 1,
-0.6378838, -0.6865595, -3.76044, 0.4156863, 1, 0, 1,
-0.6377032, 1.191564, -0.2815501, 0.4117647, 1, 0, 1,
-0.6374742, 0.1701217, -2.772597, 0.4039216, 1, 0, 1,
-0.6362675, 0.2525664, -3.345017, 0.3960784, 1, 0, 1,
-0.6350876, -0.1216118, -1.608237, 0.3921569, 1, 0, 1,
-0.6291724, 1.840832, -0.6524382, 0.3843137, 1, 0, 1,
-0.6286278, 1.691639, 0.760753, 0.3803922, 1, 0, 1,
-0.6267506, 1.926714, 0.3791029, 0.372549, 1, 0, 1,
-0.6245442, 0.1908629, -1.219043, 0.3686275, 1, 0, 1,
-0.6239763, 0.009451216, -2.724177, 0.3607843, 1, 0, 1,
-0.6219686, -0.5913346, -3.436584, 0.3568628, 1, 0, 1,
-0.6207301, 1.882337, 1.079511, 0.3490196, 1, 0, 1,
-0.6171903, 1.359202, -0.8870037, 0.345098, 1, 0, 1,
-0.6098588, 2.794689, 1.200444, 0.3372549, 1, 0, 1,
-0.6067671, -0.8999528, -1.969147, 0.3333333, 1, 0, 1,
-0.6027481, 2.331368, 1.328848, 0.3254902, 1, 0, 1,
-0.60159, 0.09740054, -4.032439, 0.3215686, 1, 0, 1,
-0.5950879, -0.5421247, -2.950623, 0.3137255, 1, 0, 1,
-0.5942739, 0.3976388, -0.1766986, 0.3098039, 1, 0, 1,
-0.5942451, -1.792426, -4.319973, 0.3019608, 1, 0, 1,
-0.5926759, -0.8832891, -2.725036, 0.2941177, 1, 0, 1,
-0.5841662, 0.1973879, -2.08147, 0.2901961, 1, 0, 1,
-0.5817682, 0.8632386, -0.4944579, 0.282353, 1, 0, 1,
-0.5813353, -0.5948153, -2.548096, 0.2784314, 1, 0, 1,
-0.572425, -0.2161624, -2.50475, 0.2705882, 1, 0, 1,
-0.5655767, 0.05959696, -1.336888, 0.2666667, 1, 0, 1,
-0.5628938, -0.5334993, -2.321644, 0.2588235, 1, 0, 1,
-0.5626417, 0.3449498, -2.425612, 0.254902, 1, 0, 1,
-0.555228, 0.04600878, -2.993861, 0.2470588, 1, 0, 1,
-0.5549062, -0.9773663, -2.513127, 0.2431373, 1, 0, 1,
-0.5467883, 0.263225, -0.424459, 0.2352941, 1, 0, 1,
-0.5466815, -1.005537, -0.5104185, 0.2313726, 1, 0, 1,
-0.5421086, -0.6126788, -3.370678, 0.2235294, 1, 0, 1,
-0.5419648, -0.3812096, -2.399748, 0.2196078, 1, 0, 1,
-0.5407744, 0.6375668, -1.095956, 0.2117647, 1, 0, 1,
-0.5341564, -0.4964161, -2.48578, 0.2078431, 1, 0, 1,
-0.527408, -0.0007760774, -0.6303453, 0.2, 1, 0, 1,
-0.5251393, 1.603636, 0.4956315, 0.1921569, 1, 0, 1,
-0.5230868, 1.701369, -0.2473343, 0.1882353, 1, 0, 1,
-0.5212315, 1.992846, -0.8646114, 0.1803922, 1, 0, 1,
-0.5188143, -0.5659136, -2.553646, 0.1764706, 1, 0, 1,
-0.5157722, 0.6910286, 1.275985, 0.1686275, 1, 0, 1,
-0.5151742, 0.1961915, -0.3617818, 0.1647059, 1, 0, 1,
-0.509968, -0.53377, -1.926355, 0.1568628, 1, 0, 1,
-0.508908, 0.9482297, -1.696877, 0.1529412, 1, 0, 1,
-0.5086982, 0.6198027, 0.7977706, 0.145098, 1, 0, 1,
-0.5056393, 0.3015191, -1.106511, 0.1411765, 1, 0, 1,
-0.5051706, -1.029256, -4.089585, 0.1333333, 1, 0, 1,
-0.5049833, -0.6998591, -2.806568, 0.1294118, 1, 0, 1,
-0.5045125, -1.786981, -3.566526, 0.1215686, 1, 0, 1,
-0.5024867, -0.356052, -2.169943, 0.1176471, 1, 0, 1,
-0.5000555, 0.2130038, -2.977362, 0.1098039, 1, 0, 1,
-0.495793, 0.7468531, -3.042011, 0.1058824, 1, 0, 1,
-0.4931118, 0.8080767, -0.6513252, 0.09803922, 1, 0, 1,
-0.4910657, -0.01870109, 0.03686243, 0.09019608, 1, 0, 1,
-0.4895454, 1.46279, -1.21968, 0.08627451, 1, 0, 1,
-0.4797465, -0.7758052, -2.456586, 0.07843138, 1, 0, 1,
-0.4792229, 1.638318, -0.6129755, 0.07450981, 1, 0, 1,
-0.4767987, -1.78314, -2.805309, 0.06666667, 1, 0, 1,
-0.4710663, -0.9536228, -1.348239, 0.0627451, 1, 0, 1,
-0.470506, 0.9225011, 0.1839696, 0.05490196, 1, 0, 1,
-0.4654834, 0.04396009, -1.969387, 0.05098039, 1, 0, 1,
-0.4649712, 2.070223, 0.1701727, 0.04313726, 1, 0, 1,
-0.4584723, 0.8083017, -2.010418, 0.03921569, 1, 0, 1,
-0.4571243, -0.5270964, -2.175552, 0.03137255, 1, 0, 1,
-0.4559118, -0.4235008, -2.694723, 0.02745098, 1, 0, 1,
-0.4533329, 0.8660543, -0.2810202, 0.01960784, 1, 0, 1,
-0.4531473, 0.1187436, -2.526846, 0.01568628, 1, 0, 1,
-0.4524897, 1.867496, -0.6371036, 0.007843138, 1, 0, 1,
-0.4512664, 0.3039382, -0.9907688, 0.003921569, 1, 0, 1,
-0.4511513, -0.9891496, -3.320465, 0, 1, 0.003921569, 1,
-0.4481679, 2.078421, 1.870657, 0, 1, 0.01176471, 1,
-0.4473269, -1.872557, -4.663755, 0, 1, 0.01568628, 1,
-0.4458676, -2.152973, -4.134602, 0, 1, 0.02352941, 1,
-0.4407669, -0.3082782, -1.256014, 0, 1, 0.02745098, 1,
-0.4380682, 0.8690944, -2.217528, 0, 1, 0.03529412, 1,
-0.4376531, 0.246142, -1.326441, 0, 1, 0.03921569, 1,
-0.4357796, -1.371642, -1.997754, 0, 1, 0.04705882, 1,
-0.4349925, -0.4049518, -2.433553, 0, 1, 0.05098039, 1,
-0.432438, -1.670106, -2.081801, 0, 1, 0.05882353, 1,
-0.4320815, 0.07844532, -2.123948, 0, 1, 0.0627451, 1,
-0.4298735, 1.08107, 0.08093364, 0, 1, 0.07058824, 1,
-0.428785, 0.1280587, -1.073702, 0, 1, 0.07450981, 1,
-0.4277349, 0.09194575, -0.4868042, 0, 1, 0.08235294, 1,
-0.4275818, 0.3078431, -1.296114, 0, 1, 0.08627451, 1,
-0.4236909, 0.2642305, -0.1177839, 0, 1, 0.09411765, 1,
-0.4220103, -0.439307, -2.253456, 0, 1, 0.1019608, 1,
-0.4182988, 0.6996883, -0.9250193, 0, 1, 0.1058824, 1,
-0.4165218, -1.078675, -3.494782, 0, 1, 0.1137255, 1,
-0.4159108, 0.7939703, 0.9017532, 0, 1, 0.1176471, 1,
-0.4154581, -0.1798639, -1.280112, 0, 1, 0.1254902, 1,
-0.4153023, -1.848842, -1.309193, 0, 1, 0.1294118, 1,
-0.4135023, 0.8037627, 0.1783859, 0, 1, 0.1372549, 1,
-0.4133281, -1.186935, -2.964006, 0, 1, 0.1411765, 1,
-0.4006683, -1.520815, -2.985952, 0, 1, 0.1490196, 1,
-0.3995629, -0.9692615, -2.541878, 0, 1, 0.1529412, 1,
-0.3942211, 0.6244959, -0.2759074, 0, 1, 0.1607843, 1,
-0.3939567, -0.5891165, -2.656523, 0, 1, 0.1647059, 1,
-0.3886575, 0.4639094, -1.755271, 0, 1, 0.172549, 1,
-0.3873423, -0.8911535, -1.939095, 0, 1, 0.1764706, 1,
-0.3861287, 2.253904, -0.02901443, 0, 1, 0.1843137, 1,
-0.3831322, 0.5947508, -1.616186, 0, 1, 0.1882353, 1,
-0.3788313, -1.020771, -1.988002, 0, 1, 0.1960784, 1,
-0.3762282, -0.09217755, -2.908827, 0, 1, 0.2039216, 1,
-0.3749003, -0.3473093, -1.608531, 0, 1, 0.2078431, 1,
-0.3747504, -1.363152, -2.094601, 0, 1, 0.2156863, 1,
-0.3725587, 0.8934466, -1.324939, 0, 1, 0.2196078, 1,
-0.3717199, 0.3460958, -0.02589562, 0, 1, 0.227451, 1,
-0.3705386, 0.8753435, -1.993261, 0, 1, 0.2313726, 1,
-0.3676446, -0.0365626, -1.901931, 0, 1, 0.2392157, 1,
-0.366105, 0.1757268, -0.5180692, 0, 1, 0.2431373, 1,
-0.3626623, 1.19068, 1.219333, 0, 1, 0.2509804, 1,
-0.3617454, -1.791014, -3.052481, 0, 1, 0.254902, 1,
-0.3589613, -0.7583107, -1.920225, 0, 1, 0.2627451, 1,
-0.3512681, -0.2799186, -1.138668, 0, 1, 0.2666667, 1,
-0.3435835, 0.9072775, -1.188474, 0, 1, 0.2745098, 1,
-0.3425002, -1.016913, -3.550088, 0, 1, 0.2784314, 1,
-0.3366659, 0.4568371, -1.50561, 0, 1, 0.2862745, 1,
-0.3361005, -1.052284, -1.192416, 0, 1, 0.2901961, 1,
-0.334317, -0.6282514, -2.902411, 0, 1, 0.2980392, 1,
-0.332944, 0.0621472, -3.602833, 0, 1, 0.3058824, 1,
-0.3327792, 0.1451043, -3.003112, 0, 1, 0.3098039, 1,
-0.3275223, 0.3639596, -1.450428, 0, 1, 0.3176471, 1,
-0.3229532, 1.208623, -1.550257, 0, 1, 0.3215686, 1,
-0.3216515, -0.7465512, -2.361447, 0, 1, 0.3294118, 1,
-0.3108754, 0.2364248, -0.5517671, 0, 1, 0.3333333, 1,
-0.3091165, -0.5980684, -3.782197, 0, 1, 0.3411765, 1,
-0.3052164, -0.5839139, -3.048819, 0, 1, 0.345098, 1,
-0.3012787, -0.8831491, -2.623034, 0, 1, 0.3529412, 1,
-0.3011832, 0.2300466, -2.160648, 0, 1, 0.3568628, 1,
-0.2941007, -3.075095, -3.793993, 0, 1, 0.3647059, 1,
-0.2936166, -2.091736, -3.327962, 0, 1, 0.3686275, 1,
-0.2930482, -0.08804277, -2.181865, 0, 1, 0.3764706, 1,
-0.2889049, -0.2531093, -2.898911, 0, 1, 0.3803922, 1,
-0.2853913, 0.1396899, -0.05101864, 0, 1, 0.3882353, 1,
-0.2830016, 1.320121, 0.07881141, 0, 1, 0.3921569, 1,
-0.2758666, 0.8776316, -0.8330483, 0, 1, 0.4, 1,
-0.2746396, -1.472992, -3.461871, 0, 1, 0.4078431, 1,
-0.2718987, 0.489225, -0.9856225, 0, 1, 0.4117647, 1,
-0.2655763, 0.815412, -2.329601, 0, 1, 0.4196078, 1,
-0.2613551, 0.1098862, -0.2280253, 0, 1, 0.4235294, 1,
-0.2603823, -0.8209844, -3.49601, 0, 1, 0.4313726, 1,
-0.2540726, -0.4384179, -0.1942669, 0, 1, 0.4352941, 1,
-0.2521436, -1.102816, -4.078411, 0, 1, 0.4431373, 1,
-0.2396487, 0.9130591, -0.4856855, 0, 1, 0.4470588, 1,
-0.2375399, 0.3676343, 0.7987335, 0, 1, 0.454902, 1,
-0.2337478, 0.7862511, -1.453892, 0, 1, 0.4588235, 1,
-0.2323078, 0.69888, -1.902144, 0, 1, 0.4666667, 1,
-0.2308202, -1.398621, -2.545891, 0, 1, 0.4705882, 1,
-0.2247585, 0.5788847, 0.4529417, 0, 1, 0.4784314, 1,
-0.211012, -1.315558, -1.579966, 0, 1, 0.4823529, 1,
-0.2105325, -1.862942, -3.781503, 0, 1, 0.4901961, 1,
-0.2068083, -0.3871079, -2.264454, 0, 1, 0.4941176, 1,
-0.2050623, 0.5440513, 0.68559, 0, 1, 0.5019608, 1,
-0.2040637, 0.355977, -1.421403, 0, 1, 0.509804, 1,
-0.2012382, 0.651646, -0.6610801, 0, 1, 0.5137255, 1,
-0.1968158, 1.404592, 0.9039612, 0, 1, 0.5215687, 1,
-0.1964256, 2.027403, 1.000484, 0, 1, 0.5254902, 1,
-0.1924516, 0.2553499, -1.432175, 0, 1, 0.5333334, 1,
-0.1910288, 0.5922618, 0.8304808, 0, 1, 0.5372549, 1,
-0.1901072, -0.2015275, -1.739417, 0, 1, 0.5450981, 1,
-0.1855131, 0.08784966, -1.200393, 0, 1, 0.5490196, 1,
-0.1842314, -0.5096401, -3.080562, 0, 1, 0.5568628, 1,
-0.1830891, -0.6017048, -4.028165, 0, 1, 0.5607843, 1,
-0.1805534, -0.3195148, -2.265031, 0, 1, 0.5686275, 1,
-0.1797464, -0.6445506, -2.427992, 0, 1, 0.572549, 1,
-0.1725671, 0.5546246, 0.5369794, 0, 1, 0.5803922, 1,
-0.1656768, -1.65427, -2.812544, 0, 1, 0.5843138, 1,
-0.1635505, -0.05863168, -2.278451, 0, 1, 0.5921569, 1,
-0.1609426, -0.8897385, -3.191651, 0, 1, 0.5960785, 1,
-0.1603892, 0.1334668, -1.198939, 0, 1, 0.6039216, 1,
-0.1577348, 0.6360435, 0.4318321, 0, 1, 0.6117647, 1,
-0.157376, -0.7845619, -5.592887, 0, 1, 0.6156863, 1,
-0.1561252, 1.689072, 0.2193983, 0, 1, 0.6235294, 1,
-0.1428627, 0.8711052, -1.241885, 0, 1, 0.627451, 1,
-0.1420908, 0.5228861, -0.8529697, 0, 1, 0.6352941, 1,
-0.1353029, 1.248468, -0.3352923, 0, 1, 0.6392157, 1,
-0.1338491, -1.846543, -4.4872, 0, 1, 0.6470588, 1,
-0.1336737, 0.3566376, -1.231589, 0, 1, 0.6509804, 1,
-0.1325506, 1.014331, -1.082865, 0, 1, 0.6588235, 1,
-0.1314067, -0.5954748, -4.184062, 0, 1, 0.6627451, 1,
-0.1268164, -1.148317, -3.240045, 0, 1, 0.6705883, 1,
-0.1264427, -0.4967172, -4.198353, 0, 1, 0.6745098, 1,
-0.1254673, 0.4824896, -0.1362774, 0, 1, 0.682353, 1,
-0.1195169, -0.0740267, -1.175688, 0, 1, 0.6862745, 1,
-0.1164258, 0.2537557, 0.1077984, 0, 1, 0.6941177, 1,
-0.1129009, -0.9369435, -1.633944, 0, 1, 0.7019608, 1,
-0.107619, -0.315672, -1.489905, 0, 1, 0.7058824, 1,
-0.1075532, 1.750169, 1.765962, 0, 1, 0.7137255, 1,
-0.1027228, -0.8967982, -3.91481, 0, 1, 0.7176471, 1,
-0.09807584, -0.8546013, -1.014762, 0, 1, 0.7254902, 1,
-0.0968285, -2.054013, -4.175277, 0, 1, 0.7294118, 1,
-0.09286174, -1.479001, -5.066297, 0, 1, 0.7372549, 1,
-0.08238532, 0.962359, 0.9696577, 0, 1, 0.7411765, 1,
-0.08129346, 0.9355955, 0.5221962, 0, 1, 0.7490196, 1,
-0.07890372, -2.429317, -2.318188, 0, 1, 0.7529412, 1,
-0.07735708, -1.407522, -2.839147, 0, 1, 0.7607843, 1,
-0.07453622, -0.4360648, -2.850782, 0, 1, 0.7647059, 1,
-0.0734713, -0.0308766, -2.89388, 0, 1, 0.772549, 1,
-0.07203276, 1.249179, 0.01823084, 0, 1, 0.7764706, 1,
-0.06799202, 0.4356064, -1.540774, 0, 1, 0.7843137, 1,
-0.06281079, 0.951578, -0.948867, 0, 1, 0.7882353, 1,
-0.0627517, 0.5104756, 0.3323112, 0, 1, 0.7960784, 1,
-0.05453666, -1.395596, -4.908809, 0, 1, 0.8039216, 1,
-0.0483725, 0.6843076, -1.070313, 0, 1, 0.8078431, 1,
-0.04772997, 2.679156, -0.6541846, 0, 1, 0.8156863, 1,
-0.04229189, 0.5954377, 0.5426866, 0, 1, 0.8196079, 1,
-0.04196434, 0.4219565, -0.3070514, 0, 1, 0.827451, 1,
-0.03897125, 0.7256353, 0.4328189, 0, 1, 0.8313726, 1,
-0.03855402, -0.08555206, -3.381741, 0, 1, 0.8392157, 1,
-0.03759952, -0.3912958, -3.956721, 0, 1, 0.8431373, 1,
-0.03408539, 0.9823964, 0.103553, 0, 1, 0.8509804, 1,
-0.03241521, 0.4066133, -1.43807, 0, 1, 0.854902, 1,
-0.02960343, 0.3461517, -0.1772052, 0, 1, 0.8627451, 1,
-0.02508359, 0.8287885, 1.381433, 0, 1, 0.8666667, 1,
-0.02308658, -0.7619501, -3.849878, 0, 1, 0.8745098, 1,
-0.01989327, 0.6437845, -0.4245071, 0, 1, 0.8784314, 1,
-0.01719969, -1.404489, -3.577254, 0, 1, 0.8862745, 1,
-0.01653499, 2.105369, 0.3897377, 0, 1, 0.8901961, 1,
-0.01532101, -0.9269676, -3.394169, 0, 1, 0.8980392, 1,
-0.01521787, 0.542362, -0.003940286, 0, 1, 0.9058824, 1,
-0.0151644, 1.965688, 0.6019371, 0, 1, 0.9098039, 1,
-0.01094802, -2.250372, -2.980418, 0, 1, 0.9176471, 1,
-0.008029683, -1.863116, -3.130365, 0, 1, 0.9215686, 1,
-0.007306953, 0.8756539, 1.38877, 0, 1, 0.9294118, 1,
-0.005788803, -0.6453322, -2.028153, 0, 1, 0.9333333, 1,
-0.004292102, -0.7520578, -2.564844, 0, 1, 0.9411765, 1,
-0.003374088, -2.638033, -3.490366, 0, 1, 0.945098, 1,
-0.002460355, 1.320421, 0.1390351, 0, 1, 0.9529412, 1,
0.004473573, -0.2295631, 3.890844, 0, 1, 0.9568627, 1,
0.007340255, -0.9202702, 1.490138, 0, 1, 0.9647059, 1,
0.00770813, -0.1864609, 3.438747, 0, 1, 0.9686275, 1,
0.01069144, 0.6950878, -1.299342, 0, 1, 0.9764706, 1,
0.01544958, 0.854334, -1.856495, 0, 1, 0.9803922, 1,
0.01551335, 0.2798359, 0.1786672, 0, 1, 0.9882353, 1,
0.01553615, 2.213444, -0.2208749, 0, 1, 0.9921569, 1,
0.03355618, 1.417227, -0.1644507, 0, 1, 1, 1,
0.0339314, -0.1181546, 2.233614, 0, 0.9921569, 1, 1,
0.03660291, 0.23177, -1.24562, 0, 0.9882353, 1, 1,
0.03852489, 0.6978642, -0.9823256, 0, 0.9803922, 1, 1,
0.04245878, -1.184774, 3.369377, 0, 0.9764706, 1, 1,
0.04356911, -0.6124645, 3.660894, 0, 0.9686275, 1, 1,
0.04380545, 0.7827328, 0.3921668, 0, 0.9647059, 1, 1,
0.0446831, -0.7220785, 3.036814, 0, 0.9568627, 1, 1,
0.04497846, 1.561406, 0.3615792, 0, 0.9529412, 1, 1,
0.04656671, -0.36191, 5.576838, 0, 0.945098, 1, 1,
0.05094315, 1.301236, -0.04507028, 0, 0.9411765, 1, 1,
0.05312604, -0.9911839, 3.258157, 0, 0.9333333, 1, 1,
0.05324541, 2.232028, 0.7384984, 0, 0.9294118, 1, 1,
0.05421437, 1.249547, -0.694348, 0, 0.9215686, 1, 1,
0.05831768, -1.002214, 0.931959, 0, 0.9176471, 1, 1,
0.06084631, 1.751095, 0.6025147, 0, 0.9098039, 1, 1,
0.06088557, -2.868338, 1.299459, 0, 0.9058824, 1, 1,
0.06174885, -0.1459059, 1.344703, 0, 0.8980392, 1, 1,
0.06216784, -1.389926, 2.741473, 0, 0.8901961, 1, 1,
0.06448758, 0.5892161, 2.212204, 0, 0.8862745, 1, 1,
0.06614986, -0.9617208, 4.247378, 0, 0.8784314, 1, 1,
0.06869363, 2.477305, 2.766194, 0, 0.8745098, 1, 1,
0.07083444, 0.4794851, 0.8548549, 0, 0.8666667, 1, 1,
0.07129551, -1.00085, 3.977401, 0, 0.8627451, 1, 1,
0.07552496, 0.3762974, -0.09585825, 0, 0.854902, 1, 1,
0.07643814, -0.7893454, 3.196441, 0, 0.8509804, 1, 1,
0.0798086, 1.015426, -2.112511, 0, 0.8431373, 1, 1,
0.08005506, -0.0839461, 3.362711, 0, 0.8392157, 1, 1,
0.08005831, 0.1766288, -0.2381094, 0, 0.8313726, 1, 1,
0.08032936, -1.177154, 0.416443, 0, 0.827451, 1, 1,
0.08268826, -0.08778038, 0.8914038, 0, 0.8196079, 1, 1,
0.08381023, 1.353395, -0.2486885, 0, 0.8156863, 1, 1,
0.08548192, -0.2254244, 2.744162, 0, 0.8078431, 1, 1,
0.08663061, -0.3698648, 2.124947, 0, 0.8039216, 1, 1,
0.08807642, -0.641043, 3.532753, 0, 0.7960784, 1, 1,
0.08854421, -0.5813789, 2.475056, 0, 0.7882353, 1, 1,
0.08944285, -1.677466, 3.162189, 0, 0.7843137, 1, 1,
0.09746931, 0.9046094, 0.1021137, 0, 0.7764706, 1, 1,
0.09875643, -2.081065, 2.097324, 0, 0.772549, 1, 1,
0.09967924, 0.4743568, 0.9769925, 0, 0.7647059, 1, 1,
0.1079418, 0.1003038, 0.5537865, 0, 0.7607843, 1, 1,
0.1091073, -0.8435216, 2.705721, 0, 0.7529412, 1, 1,
0.1093525, -0.0943198, 2.945279, 0, 0.7490196, 1, 1,
0.1110324, 1.5079, -1.700897, 0, 0.7411765, 1, 1,
0.1124864, 0.4571348, -0.9907048, 0, 0.7372549, 1, 1,
0.1216019, 0.1390481, 3.04101, 0, 0.7294118, 1, 1,
0.126007, 0.937888, -0.1810675, 0, 0.7254902, 1, 1,
0.1374612, 0.552316, 0.06963028, 0, 0.7176471, 1, 1,
0.1467903, 1.205227, -1.479223, 0, 0.7137255, 1, 1,
0.1469063, -1.338182, 2.566855, 0, 0.7058824, 1, 1,
0.1520592, -0.04585913, 1.487393, 0, 0.6980392, 1, 1,
0.1541381, -1.426314, 4.51537, 0, 0.6941177, 1, 1,
0.1554787, 2.285023, -0.9428349, 0, 0.6862745, 1, 1,
0.155504, -1.172296, 4.539226, 0, 0.682353, 1, 1,
0.1564304, -0.3030791, 2.968306, 0, 0.6745098, 1, 1,
0.1612559, 0.5281182, -1.422091, 0, 0.6705883, 1, 1,
0.1628743, 1.084206, 0.5240423, 0, 0.6627451, 1, 1,
0.1643046, -0.3781584, 1.29424, 0, 0.6588235, 1, 1,
0.1648453, 1.083539, -0.1324065, 0, 0.6509804, 1, 1,
0.1659498, -0.8581944, 1.678988, 0, 0.6470588, 1, 1,
0.1707061, 0.6733895, -1.067617, 0, 0.6392157, 1, 1,
0.1719198, -0.2742479, 2.123381, 0, 0.6352941, 1, 1,
0.1729731, -1.20129, 2.245017, 0, 0.627451, 1, 1,
0.1754083, -1.027314, 2.852217, 0, 0.6235294, 1, 1,
0.1790006, -0.78769, 3.656977, 0, 0.6156863, 1, 1,
0.1808503, 0.3671144, -6.460919e-05, 0, 0.6117647, 1, 1,
0.1830024, -1.40874, 1.760244, 0, 0.6039216, 1, 1,
0.1844953, 0.05746715, 0.7292702, 0, 0.5960785, 1, 1,
0.1899118, 0.6212497, 0.22043, 0, 0.5921569, 1, 1,
0.1912579, -0.470986, 2.928285, 0, 0.5843138, 1, 1,
0.1959371, -0.719105, 2.706405, 0, 0.5803922, 1, 1,
0.1974973, 0.1197141, 2.063066, 0, 0.572549, 1, 1,
0.1978366, 0.7546298, 0.5725912, 0, 0.5686275, 1, 1,
0.1993846, -1.233448, 1.218153, 0, 0.5607843, 1, 1,
0.1996596, -0.9820282, 1.660444, 0, 0.5568628, 1, 1,
0.2049906, 2.333252, 0.3845468, 0, 0.5490196, 1, 1,
0.2082313, -1.469021, 4.34751, 0, 0.5450981, 1, 1,
0.2093519, -1.939276, 2.847603, 0, 0.5372549, 1, 1,
0.2114983, 0.3919338, 1.854125, 0, 0.5333334, 1, 1,
0.2136268, 1.223388, 2.241325, 0, 0.5254902, 1, 1,
0.2195494, 0.4044352, 0.8578039, 0, 0.5215687, 1, 1,
0.2238951, 1.466534, 1.142754, 0, 0.5137255, 1, 1,
0.2257611, 0.6711624, 0.5710706, 0, 0.509804, 1, 1,
0.2297526, -0.469817, 2.937901, 0, 0.5019608, 1, 1,
0.2299311, 2.097174, -0.2161881, 0, 0.4941176, 1, 1,
0.2299411, -1.225365, 3.276183, 0, 0.4901961, 1, 1,
0.2303769, -0.4062156, 2.564913, 0, 0.4823529, 1, 1,
0.2309414, -1.044526, 2.573614, 0, 0.4784314, 1, 1,
0.2334773, -0.5784515, 1.061731, 0, 0.4705882, 1, 1,
0.2357545, 0.450588, -0.8023608, 0, 0.4666667, 1, 1,
0.2365067, 0.5739483, 1.137135, 0, 0.4588235, 1, 1,
0.2469664, 0.2136072, 0.8746712, 0, 0.454902, 1, 1,
0.2479489, 0.09365002, 0.1808974, 0, 0.4470588, 1, 1,
0.2485022, 1.116348, 1.30418, 0, 0.4431373, 1, 1,
0.2515924, 0.9240118, 0.1906809, 0, 0.4352941, 1, 1,
0.2520221, -0.1120213, 2.966731, 0, 0.4313726, 1, 1,
0.2565691, -0.6910157, 3.360357, 0, 0.4235294, 1, 1,
0.2571536, 0.1918592, 0.2830944, 0, 0.4196078, 1, 1,
0.2597302, 0.5120013, -1.220002, 0, 0.4117647, 1, 1,
0.2634201, -0.3647257, 2.736906, 0, 0.4078431, 1, 1,
0.2681073, -0.2143928, 1.760485, 0, 0.4, 1, 1,
0.2691272, -0.8374028, 2.373303, 0, 0.3921569, 1, 1,
0.2709039, 0.9583383, 0.2515871, 0, 0.3882353, 1, 1,
0.2714403, -1.107727, 1.238116, 0, 0.3803922, 1, 1,
0.2739404, -0.8754785, 3.169077, 0, 0.3764706, 1, 1,
0.275195, 0.7354248, 1.461484, 0, 0.3686275, 1, 1,
0.2805968, -0.4302632, 3.667541, 0, 0.3647059, 1, 1,
0.2809631, -0.901897, 2.822169, 0, 0.3568628, 1, 1,
0.2846695, -0.516784, 3.328595, 0, 0.3529412, 1, 1,
0.2855565, -0.5495609, 1.108276, 0, 0.345098, 1, 1,
0.2884721, -1.493349, 2.896041, 0, 0.3411765, 1, 1,
0.2913684, 0.2229034, 0.7386938, 0, 0.3333333, 1, 1,
0.2960875, -1.712845, 2.996575, 0, 0.3294118, 1, 1,
0.2971911, 1.495704, 0.2919817, 0, 0.3215686, 1, 1,
0.3003822, 0.1205451, 1.893449, 0, 0.3176471, 1, 1,
0.3010317, -2.268884, 2.8409, 0, 0.3098039, 1, 1,
0.30179, 1.204921, -0.1323155, 0, 0.3058824, 1, 1,
0.3051669, -1.084725, 1.765974, 0, 0.2980392, 1, 1,
0.3059856, -0.6048799, 2.021594, 0, 0.2901961, 1, 1,
0.3076943, 0.6411824, -0.2590573, 0, 0.2862745, 1, 1,
0.3104987, -0.1456532, 2.145438, 0, 0.2784314, 1, 1,
0.3207216, -1.012076, 2.664279, 0, 0.2745098, 1, 1,
0.3218935, -0.423123, 2.254881, 0, 0.2666667, 1, 1,
0.3260866, 0.1983213, 3.179948, 0, 0.2627451, 1, 1,
0.3355447, 0.3261952, 0.9003735, 0, 0.254902, 1, 1,
0.3379086, -0.1319258, 2.809425, 0, 0.2509804, 1, 1,
0.3380674, 0.08891199, 1.983688, 0, 0.2431373, 1, 1,
0.3382244, 0.8992672, 1.12258, 0, 0.2392157, 1, 1,
0.3395503, -0.08799654, 0.4412402, 0, 0.2313726, 1, 1,
0.3447742, -0.56884, 3.326366, 0, 0.227451, 1, 1,
0.3458188, -0.9783502, 2.904645, 0, 0.2196078, 1, 1,
0.3497288, 3.154545, 0.3929124, 0, 0.2156863, 1, 1,
0.3580754, -0.9721205, 2.230112, 0, 0.2078431, 1, 1,
0.3587525, -0.1444162, 2.749381, 0, 0.2039216, 1, 1,
0.3608192, -0.8555056, 0.8518484, 0, 0.1960784, 1, 1,
0.3619893, 0.3705056, 1.23725, 0, 0.1882353, 1, 1,
0.3628079, -0.09808002, 1.775383, 0, 0.1843137, 1, 1,
0.3634188, 0.2153738, 0.8452863, 0, 0.1764706, 1, 1,
0.3684577, 0.7339965, -0.3379021, 0, 0.172549, 1, 1,
0.3727475, 0.909494, 1.020381, 0, 0.1647059, 1, 1,
0.3745471, 1.889782, 1.35184, 0, 0.1607843, 1, 1,
0.3781896, 1.081819, 0.254006, 0, 0.1529412, 1, 1,
0.3792862, 2.204723, 1.704453, 0, 0.1490196, 1, 1,
0.3793685, 1.03307, 1.190337, 0, 0.1411765, 1, 1,
0.3842739, -1.699682, 2.008806, 0, 0.1372549, 1, 1,
0.3914375, -1.266353, 2.402472, 0, 0.1294118, 1, 1,
0.393016, -0.9141573, 3.137281, 0, 0.1254902, 1, 1,
0.3949774, 0.07143296, 1.43508, 0, 0.1176471, 1, 1,
0.3975155, 0.1740714, 1.490142, 0, 0.1137255, 1, 1,
0.3977385, -0.05993827, 0.8807217, 0, 0.1058824, 1, 1,
0.3980966, -0.006055177, 1.946513, 0, 0.09803922, 1, 1,
0.4002733, -1.572432, 3.333317, 0, 0.09411765, 1, 1,
0.4013508, -0.2318097, 2.071239, 0, 0.08627451, 1, 1,
0.4015867, -0.3367452, 3.013354, 0, 0.08235294, 1, 1,
0.4016563, -0.2795992, 2.028577, 0, 0.07450981, 1, 1,
0.4025289, 0.1829787, -0.03196051, 0, 0.07058824, 1, 1,
0.4049192, -1.703155, 3.76007, 0, 0.0627451, 1, 1,
0.4057823, -0.005416695, 2.497249, 0, 0.05882353, 1, 1,
0.4084454, -2.105366, 3.180066, 0, 0.05098039, 1, 1,
0.4104784, 1.554968, 0.1322921, 0, 0.04705882, 1, 1,
0.4111276, 0.0219062, 1.399637, 0, 0.03921569, 1, 1,
0.4114835, -0.9787156, 2.003665, 0, 0.03529412, 1, 1,
0.4162893, -0.880082, 1.592149, 0, 0.02745098, 1, 1,
0.4188779, 0.9841521, 0.9592785, 0, 0.02352941, 1, 1,
0.4192289, -0.6638195, 2.191943, 0, 0.01568628, 1, 1,
0.4230606, -0.5338651, 2.715353, 0, 0.01176471, 1, 1,
0.4274503, 0.5331471, -0.3213803, 0, 0.003921569, 1, 1,
0.4286157, 0.09637873, 2.119613, 0.003921569, 0, 1, 1,
0.4295624, 0.440714, -0.1664658, 0.007843138, 0, 1, 1,
0.43093, 1.043647, 0.1028177, 0.01568628, 0, 1, 1,
0.4310295, 2.440225, 0.7377858, 0.01960784, 0, 1, 1,
0.4347589, 0.01101801, 1.696083, 0.02745098, 0, 1, 1,
0.4371464, -0.7318059, 2.227148, 0.03137255, 0, 1, 1,
0.4399314, -1.022732, 2.442254, 0.03921569, 0, 1, 1,
0.4420157, -0.4690467, 1.759293, 0.04313726, 0, 1, 1,
0.4430341, 1.158674, -1.049984, 0.05098039, 0, 1, 1,
0.4496451, 1.077497, 1.723581, 0.05490196, 0, 1, 1,
0.4552617, -0.1616394, 3.071332, 0.0627451, 0, 1, 1,
0.4561017, 0.1659551, -0.2711544, 0.06666667, 0, 1, 1,
0.4585504, 0.2449386, 0.1128207, 0.07450981, 0, 1, 1,
0.4585586, -0.4296111, 2.046502, 0.07843138, 0, 1, 1,
0.4602601, -0.2220505, 2.344653, 0.08627451, 0, 1, 1,
0.4724028, 0.1078057, 2.588715, 0.09019608, 0, 1, 1,
0.4725524, -1.473494, 3.879332, 0.09803922, 0, 1, 1,
0.4737605, -0.5218199, 3.673941, 0.1058824, 0, 1, 1,
0.4750202, 2.048202, 0.3371623, 0.1098039, 0, 1, 1,
0.4775815, -0.2849892, 4.45435, 0.1176471, 0, 1, 1,
0.4844344, -0.5349159, 2.379719, 0.1215686, 0, 1, 1,
0.4863688, 0.25802, 0.05484668, 0.1294118, 0, 1, 1,
0.4888555, -1.760671, 4.310665, 0.1333333, 0, 1, 1,
0.4942455, -1.737837, 3.158535, 0.1411765, 0, 1, 1,
0.4953727, 0.7607692, 0.5688264, 0.145098, 0, 1, 1,
0.5080318, 1.344583, -0.1033669, 0.1529412, 0, 1, 1,
0.5118423, -0.372094, 1.661138, 0.1568628, 0, 1, 1,
0.5244188, -0.8017575, 2.716348, 0.1647059, 0, 1, 1,
0.5246453, 1.654883, 0.5650398, 0.1686275, 0, 1, 1,
0.5287448, 0.2127235, 1.367169, 0.1764706, 0, 1, 1,
0.533501, 0.5395281, 0.9090466, 0.1803922, 0, 1, 1,
0.5360273, 2.463214, 0.4375706, 0.1882353, 0, 1, 1,
0.5361992, -1.300197, 2.354204, 0.1921569, 0, 1, 1,
0.5425295, -0.148493, 2.74896, 0.2, 0, 1, 1,
0.5431978, -1.305241, 3.071946, 0.2078431, 0, 1, 1,
0.5448679, 0.04300905, 2.112308, 0.2117647, 0, 1, 1,
0.5504889, 1.548787, -1.360008, 0.2196078, 0, 1, 1,
0.5534104, -1.224427, 2.665608, 0.2235294, 0, 1, 1,
0.561689, 0.8571709, 0.9112188, 0.2313726, 0, 1, 1,
0.5648507, 0.4428069, 1.213016, 0.2352941, 0, 1, 1,
0.564984, -0.9183869, 1.917646, 0.2431373, 0, 1, 1,
0.5679214, -0.6836889, 0.8670636, 0.2470588, 0, 1, 1,
0.5714512, -2.478505, 4.172361, 0.254902, 0, 1, 1,
0.5716235, -0.4821424, 2.144324, 0.2588235, 0, 1, 1,
0.5730485, -0.479058, 1.606768, 0.2666667, 0, 1, 1,
0.573816, -0.2084008, 0.3384908, 0.2705882, 0, 1, 1,
0.5781858, 2.322925, 1.429411, 0.2784314, 0, 1, 1,
0.5795991, 1.112509, 0.2987899, 0.282353, 0, 1, 1,
0.5845273, -1.040738, 2.569393, 0.2901961, 0, 1, 1,
0.5865658, 0.8912311, 0.9178434, 0.2941177, 0, 1, 1,
0.5866634, -1.565578, 4.024666, 0.3019608, 0, 1, 1,
0.5891134, -0.1616148, 1.003037, 0.3098039, 0, 1, 1,
0.5903012, 0.6283855, -1.279677, 0.3137255, 0, 1, 1,
0.5939052, 0.9216258, 0.7084795, 0.3215686, 0, 1, 1,
0.5949202, -0.1798261, -0.2890217, 0.3254902, 0, 1, 1,
0.5966582, -0.8491709, 2.028995, 0.3333333, 0, 1, 1,
0.6005712, -1.202818, 3.494541, 0.3372549, 0, 1, 1,
0.6019441, 0.2291784, 1.278497, 0.345098, 0, 1, 1,
0.6026055, -2.041203, 3.010668, 0.3490196, 0, 1, 1,
0.6035613, 0.1737441, 1.769804, 0.3568628, 0, 1, 1,
0.6035755, 1.38313, -0.09036386, 0.3607843, 0, 1, 1,
0.6094384, 0.9126889, 0.9529289, 0.3686275, 0, 1, 1,
0.609727, 0.5383813, 2.8472, 0.372549, 0, 1, 1,
0.6113843, 1.062008, 1.929134, 0.3803922, 0, 1, 1,
0.6145009, -0.7556955, 3.342453, 0.3843137, 0, 1, 1,
0.6160604, 1.868945, 0.3350084, 0.3921569, 0, 1, 1,
0.6162071, -0.3570221, 2.295414, 0.3960784, 0, 1, 1,
0.6175283, 1.240906, -0.04917987, 0.4039216, 0, 1, 1,
0.620096, 0.1251627, 1.719472, 0.4117647, 0, 1, 1,
0.6210632, -1.429116, 3.136092, 0.4156863, 0, 1, 1,
0.6227766, 0.6645344, 1.890568, 0.4235294, 0, 1, 1,
0.6239487, -0.8526656, 2.479271, 0.427451, 0, 1, 1,
0.6249439, -1.18675, 2.910215, 0.4352941, 0, 1, 1,
0.6272029, 2.185027, 1.43204, 0.4392157, 0, 1, 1,
0.6349928, 0.1329061, 2.035098, 0.4470588, 0, 1, 1,
0.64279, -0.4953115, 1.410327, 0.4509804, 0, 1, 1,
0.6429387, 0.05010087, 2.164682, 0.4588235, 0, 1, 1,
0.6444415, -0.3391754, 2.490973, 0.4627451, 0, 1, 1,
0.6461661, -0.9080679, 2.998657, 0.4705882, 0, 1, 1,
0.6500077, 0.6017307, 1.333613, 0.4745098, 0, 1, 1,
0.6517336, 1.213264, 1.806481, 0.4823529, 0, 1, 1,
0.6536309, 1.656056, 1.688406, 0.4862745, 0, 1, 1,
0.6570042, -1.181246, 2.238821, 0.4941176, 0, 1, 1,
0.6575715, 0.2403358, 1.394506, 0.5019608, 0, 1, 1,
0.6635082, 0.4511724, 1.110867, 0.5058824, 0, 1, 1,
0.6720097, 0.3077559, 1.354899, 0.5137255, 0, 1, 1,
0.6729363, 0.4871505, 0.8023551, 0.5176471, 0, 1, 1,
0.6758261, 1.577282, 0.3606004, 0.5254902, 0, 1, 1,
0.6759947, -1.207847, 2.025348, 0.5294118, 0, 1, 1,
0.6761879, -0.2776579, 1.983, 0.5372549, 0, 1, 1,
0.6781611, 0.2189039, 2.085493, 0.5411765, 0, 1, 1,
0.6785842, -0.7153742, 2.893378, 0.5490196, 0, 1, 1,
0.6856906, -0.05251999, 2.372619, 0.5529412, 0, 1, 1,
0.6866063, -0.6789899, 3.567996, 0.5607843, 0, 1, 1,
0.6874068, 0.4900065, 2.351738, 0.5647059, 0, 1, 1,
0.6949356, 0.4569509, 2.020744, 0.572549, 0, 1, 1,
0.6961332, -0.1617564, 0.7869687, 0.5764706, 0, 1, 1,
0.7103309, -0.4255854, 2.019031, 0.5843138, 0, 1, 1,
0.71259, -0.5377263, 2.274451, 0.5882353, 0, 1, 1,
0.7137883, 1.093391, 0.6502434, 0.5960785, 0, 1, 1,
0.7159357, -0.09783549, 1.879594, 0.6039216, 0, 1, 1,
0.7194363, -0.1393223, 1.614562, 0.6078432, 0, 1, 1,
0.7257345, 1.192877, -0.585803, 0.6156863, 0, 1, 1,
0.726146, -0.3524727, 2.556465, 0.6196079, 0, 1, 1,
0.7378109, -0.6459764, 1.890599, 0.627451, 0, 1, 1,
0.7406449, 1.020822, 1.053533, 0.6313726, 0, 1, 1,
0.7506245, 0.6529926, 0.7232393, 0.6392157, 0, 1, 1,
0.7556416, 1.220806, -0.9947384, 0.6431373, 0, 1, 1,
0.7627585, -1.500801, 5.423601, 0.6509804, 0, 1, 1,
0.7641597, 0.72498, 3.255658, 0.654902, 0, 1, 1,
0.7666028, -0.7971287, 1.101259, 0.6627451, 0, 1, 1,
0.7689098, 0.5099551, 1.915578, 0.6666667, 0, 1, 1,
0.7690693, 1.048232, 2.302767, 0.6745098, 0, 1, 1,
0.7726937, -1.630195, 2.80167, 0.6784314, 0, 1, 1,
0.7746747, -0.4346517, 1.896418, 0.6862745, 0, 1, 1,
0.7760895, -1.153444, 3.102121, 0.6901961, 0, 1, 1,
0.782639, 0.5766743, 1.420199, 0.6980392, 0, 1, 1,
0.7839085, -0.001747186, 1.982243, 0.7058824, 0, 1, 1,
0.7865602, -0.9006948, 0.8466215, 0.7098039, 0, 1, 1,
0.7899643, -0.03174858, 1.853781, 0.7176471, 0, 1, 1,
0.7918169, -1.880763, 2.351993, 0.7215686, 0, 1, 1,
0.7928826, 0.1470976, 1.5933, 0.7294118, 0, 1, 1,
0.8017423, -1.24808, 3.350775, 0.7333333, 0, 1, 1,
0.8023607, -0.104225, 0.6488743, 0.7411765, 0, 1, 1,
0.8069886, -0.2645027, 1.400832, 0.7450981, 0, 1, 1,
0.8115231, -0.3978434, 0.7190286, 0.7529412, 0, 1, 1,
0.8143285, 0.6865733, -0.2449489, 0.7568628, 0, 1, 1,
0.8224868, -1.230297, 1.65376, 0.7647059, 0, 1, 1,
0.8227732, -0.7534925, 1.774769, 0.7686275, 0, 1, 1,
0.8227897, -0.4976223, 1.046339, 0.7764706, 0, 1, 1,
0.8251565, 0.7904301, 1.54801, 0.7803922, 0, 1, 1,
0.8424091, -0.07150298, 3.779873, 0.7882353, 0, 1, 1,
0.8439819, 0.4629828, 0.6017968, 0.7921569, 0, 1, 1,
0.8511763, -0.1468703, 1.92099, 0.8, 0, 1, 1,
0.8564621, 1.854915, 0.2658719, 0.8078431, 0, 1, 1,
0.8608786, -0.7237266, 3.407499, 0.8117647, 0, 1, 1,
0.8637064, 0.619527, -0.1278902, 0.8196079, 0, 1, 1,
0.8659005, -0.6310066, 2.617996, 0.8235294, 0, 1, 1,
0.8665031, -0.218511, 2.457221, 0.8313726, 0, 1, 1,
0.8688626, -1.215176, 1.547311, 0.8352941, 0, 1, 1,
0.8697239, 0.1752435, -0.1559513, 0.8431373, 0, 1, 1,
0.8709443, 0.7691852, -0.7781767, 0.8470588, 0, 1, 1,
0.8837711, -1.018235, 1.832446, 0.854902, 0, 1, 1,
0.8918498, -1.998143, 4.048952, 0.8588235, 0, 1, 1,
0.9003381, -0.4170383, 2.830408, 0.8666667, 0, 1, 1,
0.9006832, -0.9476293, 3.85082, 0.8705882, 0, 1, 1,
0.9089284, -0.2154776, 1.702502, 0.8784314, 0, 1, 1,
0.9100552, 0.9497202, -0.3632469, 0.8823529, 0, 1, 1,
0.9127858, 0.264837, 1.583148, 0.8901961, 0, 1, 1,
0.9167281, 0.1486252, 1.912541, 0.8941177, 0, 1, 1,
0.9213759, -0.2842349, 0.903318, 0.9019608, 0, 1, 1,
0.9224491, 0.321004, 2.743697, 0.9098039, 0, 1, 1,
0.9243504, 1.885116, 1.289225, 0.9137255, 0, 1, 1,
0.9303214, 0.458912, 0.8713319, 0.9215686, 0, 1, 1,
0.9372995, 0.9110356, 2.444514, 0.9254902, 0, 1, 1,
0.9376964, -0.7395696, 2.520637, 0.9333333, 0, 1, 1,
0.9404101, -2.105822, 2.359323, 0.9372549, 0, 1, 1,
0.9409477, 0.257994, 3.216661, 0.945098, 0, 1, 1,
0.9420543, -0.4133358, 2.259787, 0.9490196, 0, 1, 1,
0.9482859, 0.34646, 0.3818855, 0.9568627, 0, 1, 1,
0.9506342, 0.7046384, 0.9816906, 0.9607843, 0, 1, 1,
0.9511122, -0.1262226, 1.304962, 0.9686275, 0, 1, 1,
0.9525151, 0.4846934, 1.93357, 0.972549, 0, 1, 1,
0.9557288, 0.2112507, -0.06101542, 0.9803922, 0, 1, 1,
0.963128, -2.005991, 1.551862, 0.9843137, 0, 1, 1,
0.9652034, -1.053688, 3.964938, 0.9921569, 0, 1, 1,
0.9763777, 1.16743, 0.3165542, 0.9960784, 0, 1, 1,
0.9784465, -0.4797123, 2.846423, 1, 0, 0.9960784, 1,
0.9795222, 1.418155, 0.9133142, 1, 0, 0.9882353, 1,
0.9806351, 1.34271, 0.6376072, 1, 0, 0.9843137, 1,
0.9839211, -0.4919669, 3.986223, 1, 0, 0.9764706, 1,
0.9846506, -0.721207, 2.427541, 1, 0, 0.972549, 1,
0.9856876, -1.4843, 2.080785, 1, 0, 0.9647059, 1,
0.9891325, 1.957193, 0.7868274, 1, 0, 0.9607843, 1,
0.9948537, 0.0497557, 1.150394, 1, 0, 0.9529412, 1,
0.9951544, 0.6336853, 0.5113379, 1, 0, 0.9490196, 1,
0.9972749, -0.4343724, 1.111349, 1, 0, 0.9411765, 1,
0.9972755, -1.318685, 5.276558, 1, 0, 0.9372549, 1,
1.001227, 0.621462, 0.5442932, 1, 0, 0.9294118, 1,
1.006336, -0.4379138, 3.536267, 1, 0, 0.9254902, 1,
1.011718, -0.4612656, 1.496721, 1, 0, 0.9176471, 1,
1.020051, -1.131159, 1.928283, 1, 0, 0.9137255, 1,
1.024336, 1.329672, 1.447076, 1, 0, 0.9058824, 1,
1.030207, 0.1782193, 2.287717, 1, 0, 0.9019608, 1,
1.030426, -0.4615267, 3.000824, 1, 0, 0.8941177, 1,
1.035238, -0.2663399, 2.424309, 1, 0, 0.8862745, 1,
1.035744, -0.9489079, 3.407905, 1, 0, 0.8823529, 1,
1.040312, 0.3046688, 0.4251678, 1, 0, 0.8745098, 1,
1.041953, -1.092085, 4.649695, 1, 0, 0.8705882, 1,
1.044368, 1.063103, 0.4639177, 1, 0, 0.8627451, 1,
1.05186, 1.068322, 0.393437, 1, 0, 0.8588235, 1,
1.052605, -0.3967973, 2.314023, 1, 0, 0.8509804, 1,
1.067356, -0.01612473, 2.508136, 1, 0, 0.8470588, 1,
1.069229, 1.405271, 0.2252445, 1, 0, 0.8392157, 1,
1.070046, 0.4960645, 2.924479, 1, 0, 0.8352941, 1,
1.080538, 0.01685464, 2.717096, 1, 0, 0.827451, 1,
1.084734, 1.707911, 0.6899648, 1, 0, 0.8235294, 1,
1.090731, 0.4959401, 0.7347269, 1, 0, 0.8156863, 1,
1.092869, -1.415434, 3.88222, 1, 0, 0.8117647, 1,
1.100038, 0.1251427, 0.9857598, 1, 0, 0.8039216, 1,
1.105123, 1.169322, 2.18303, 1, 0, 0.7960784, 1,
1.105131, -0.262198, 2.406415, 1, 0, 0.7921569, 1,
1.107409, 1.085844, 1.02488, 1, 0, 0.7843137, 1,
1.119241, 0.1210142, 3.088821, 1, 0, 0.7803922, 1,
1.119551, -1.481056, 1.942608, 1, 0, 0.772549, 1,
1.126805, -1.164106, 2.4369, 1, 0, 0.7686275, 1,
1.128628, -0.1085055, 1.620384, 1, 0, 0.7607843, 1,
1.135544, 0.3349513, -0.8412866, 1, 0, 0.7568628, 1,
1.136694, -0.7286428, 2.467878, 1, 0, 0.7490196, 1,
1.136985, 0.5026494, 0.5782071, 1, 0, 0.7450981, 1,
1.137246, -1.288231, 2.945575, 1, 0, 0.7372549, 1,
1.145656, -0.859816, 1.658634, 1, 0, 0.7333333, 1,
1.147164, 0.07071156, 3.084065, 1, 0, 0.7254902, 1,
1.148933, -0.7322498, 1.894226, 1, 0, 0.7215686, 1,
1.150797, -0.9859244, 2.422526, 1, 0, 0.7137255, 1,
1.154696, -1.077531, 2.939118, 1, 0, 0.7098039, 1,
1.161707, -0.589082, 1.110435, 1, 0, 0.7019608, 1,
1.163396, -0.2569223, 1.034334, 1, 0, 0.6941177, 1,
1.163985, 0.4595736, 1.252261, 1, 0, 0.6901961, 1,
1.165265, 0.3225163, 0.0126484, 1, 0, 0.682353, 1,
1.166089, -1.241168, 2.486767, 1, 0, 0.6784314, 1,
1.169136, 0.6014968, 0.8150651, 1, 0, 0.6705883, 1,
1.172552, 0.7131679, 0.3713809, 1, 0, 0.6666667, 1,
1.173767, 1.310208, -1.185063, 1, 0, 0.6588235, 1,
1.180451, -0.1647846, 2.046913, 1, 0, 0.654902, 1,
1.184091, -0.9045239, 2.535391, 1, 0, 0.6470588, 1,
1.192889, 0.182516, 2.935123, 1, 0, 0.6431373, 1,
1.198648, 0.7229069, -1.522381, 1, 0, 0.6352941, 1,
1.199326, -0.7135635, 1.970806, 1, 0, 0.6313726, 1,
1.200464, -1.53757, 2.414593, 1, 0, 0.6235294, 1,
1.200687, -0.08565971, -0.3111264, 1, 0, 0.6196079, 1,
1.201279, 0.4023491, 1.002246, 1, 0, 0.6117647, 1,
1.203513, 1.098954, 1.147751, 1, 0, 0.6078432, 1,
1.205649, -0.8045704, 1.67368, 1, 0, 0.6, 1,
1.205778, -1.737211, 1.117426, 1, 0, 0.5921569, 1,
1.206945, 0.7691956, 0.8319069, 1, 0, 0.5882353, 1,
1.217494, 0.1572544, 2.352826, 1, 0, 0.5803922, 1,
1.218297, 1.013712, -1.033047, 1, 0, 0.5764706, 1,
1.230236, -0.06900635, 2.252039, 1, 0, 0.5686275, 1,
1.234396, -0.259229, 2.886927, 1, 0, 0.5647059, 1,
1.256286, -1.123434, 1.11986, 1, 0, 0.5568628, 1,
1.258452, -0.2719363, 2.51282, 1, 0, 0.5529412, 1,
1.268053, 0.7571536, 1.736145, 1, 0, 0.5450981, 1,
1.279559, 0.1437235, 1.266589, 1, 0, 0.5411765, 1,
1.280468, -0.01241191, 2.15983, 1, 0, 0.5333334, 1,
1.287295, 0.1252663, 0.8683937, 1, 0, 0.5294118, 1,
1.290312, -0.8894519, 2.446618, 1, 0, 0.5215687, 1,
1.291085, 1.283495, 0.4711314, 1, 0, 0.5176471, 1,
1.296385, 0.4911321, 1.903381, 1, 0, 0.509804, 1,
1.29925, -1.517714, 2.227562, 1, 0, 0.5058824, 1,
1.310462, -1.123018, 3.894306, 1, 0, 0.4980392, 1,
1.318499, 0.4726118, 1.682286, 1, 0, 0.4901961, 1,
1.320632, 0.8348572, 0.2577156, 1, 0, 0.4862745, 1,
1.337014, -1.378291, 3.400472, 1, 0, 0.4784314, 1,
1.349316, 0.1650518, 1.131566, 1, 0, 0.4745098, 1,
1.361133, -0.5971342, 1.958585, 1, 0, 0.4666667, 1,
1.361955, -1.289994, 2.401528, 1, 0, 0.4627451, 1,
1.363802, -1.065268, 2.188755, 1, 0, 0.454902, 1,
1.364892, 1.059035, -0.3048856, 1, 0, 0.4509804, 1,
1.365679, 1.137929, 1.186912, 1, 0, 0.4431373, 1,
1.366363, -2.548487, 1.680288, 1, 0, 0.4392157, 1,
1.370088, -0.2948484, 1.512928, 1, 0, 0.4313726, 1,
1.388267, 0.1149134, 0.3535574, 1, 0, 0.427451, 1,
1.399992, -0.1267781, 0.8425157, 1, 0, 0.4196078, 1,
1.401959, -2.984179, 2.973505, 1, 0, 0.4156863, 1,
1.408243, 0.5678934, 1.272858, 1, 0, 0.4078431, 1,
1.408846, 1.7254, 1.387381, 1, 0, 0.4039216, 1,
1.411908, 0.1344608, 1.827197, 1, 0, 0.3960784, 1,
1.419031, -1.066338, -0.5467305, 1, 0, 0.3882353, 1,
1.4293, -1.314833, 4.14284, 1, 0, 0.3843137, 1,
1.44114, -0.3416206, 1.061416, 1, 0, 0.3764706, 1,
1.451641, -0.3667589, 2.61412, 1, 0, 0.372549, 1,
1.458629, 0.8385222, 1.63364, 1, 0, 0.3647059, 1,
1.471457, -1.042057, 2.405442, 1, 0, 0.3607843, 1,
1.478688, 0.6429514, 1.206583, 1, 0, 0.3529412, 1,
1.482903, -0.5957687, 0.8235167, 1, 0, 0.3490196, 1,
1.492996, -1.641996, 1.649817, 1, 0, 0.3411765, 1,
1.525826, -0.682546, 1.036229, 1, 0, 0.3372549, 1,
1.528782, -0.07108033, -0.4728221, 1, 0, 0.3294118, 1,
1.536271, -0.1008346, 3.077222, 1, 0, 0.3254902, 1,
1.543782, 1.473741, 1.244469, 1, 0, 0.3176471, 1,
1.545483, 2.296266, 0.5526963, 1, 0, 0.3137255, 1,
1.549604, 0.3571022, 0.6951218, 1, 0, 0.3058824, 1,
1.554162, 0.3948543, 1.856948, 1, 0, 0.2980392, 1,
1.558902, -0.7002392, 4.180677, 1, 0, 0.2941177, 1,
1.559167, 0.7186766, 1.662044, 1, 0, 0.2862745, 1,
1.569853, -0.3040382, 1.914927, 1, 0, 0.282353, 1,
1.596679, -0.02299016, 0.6770705, 1, 0, 0.2745098, 1,
1.600614, -0.8176258, 2.16042, 1, 0, 0.2705882, 1,
1.61872, -0.8709857, 2.16493, 1, 0, 0.2627451, 1,
1.626832, 0.7434542, 0.4770005, 1, 0, 0.2588235, 1,
1.635543, 0.7560616, 1.438114, 1, 0, 0.2509804, 1,
1.646769, 1.26529, 1.521269, 1, 0, 0.2470588, 1,
1.658104, -1.478302, 3.45532, 1, 0, 0.2392157, 1,
1.66468, 0.9012811, 1.86445, 1, 0, 0.2352941, 1,
1.675613, 1.762032, -0.01806556, 1, 0, 0.227451, 1,
1.717788, 1.398797, -1.324562, 1, 0, 0.2235294, 1,
1.738662, 0.1488837, 2.178637, 1, 0, 0.2156863, 1,
1.77126, -0.1799311, 1.794526, 1, 0, 0.2117647, 1,
1.819365, -1.380878, 3.691787, 1, 0, 0.2039216, 1,
1.853901, 0.5771928, 0.2392774, 1, 0, 0.1960784, 1,
1.857486, 0.4897076, 1.095707, 1, 0, 0.1921569, 1,
1.861626, 0.0885397, 1.993168, 1, 0, 0.1843137, 1,
1.865678, -0.6416434, 2.485854, 1, 0, 0.1803922, 1,
1.984277, -0.8995094, 1.374401, 1, 0, 0.172549, 1,
1.997847, -0.6967681, 3.09033, 1, 0, 0.1686275, 1,
1.998883, 0.2643687, 1.528278, 1, 0, 0.1607843, 1,
2.009072, -1.249782, 1.208542, 1, 0, 0.1568628, 1,
2.091518, -0.5765626, 0.9608477, 1, 0, 0.1490196, 1,
2.098081, 1.908128, 1.121644, 1, 0, 0.145098, 1,
2.098166, -1.195318, 2.988538, 1, 0, 0.1372549, 1,
2.120992, -0.09108053, 1.395546, 1, 0, 0.1333333, 1,
2.12602, 1.065602, 2.521343, 1, 0, 0.1254902, 1,
2.126477, 0.0323306, 1.521704, 1, 0, 0.1215686, 1,
2.138249, 0.7372467, 1.80998, 1, 0, 0.1137255, 1,
2.142801, -0.9636069, 0.4693916, 1, 0, 0.1098039, 1,
2.149575, -1.979786, 2.185135, 1, 0, 0.1019608, 1,
2.23331, -0.2543511, 3.169138, 1, 0, 0.09411765, 1,
2.235788, -2.282597, 3.469764, 1, 0, 0.09019608, 1,
2.263094, -1.195281, 2.395676, 1, 0, 0.08235294, 1,
2.307754, -0.5312455, 0.9444579, 1, 0, 0.07843138, 1,
2.3294, 1.950732, 1.831722, 1, 0, 0.07058824, 1,
2.330403, -1.840409, 1.575085, 1, 0, 0.06666667, 1,
2.347124, 0.09020654, 2.470273, 1, 0, 0.05882353, 1,
2.378596, 1.867501, -0.5961218, 1, 0, 0.05490196, 1,
2.384484, -0.3631938, 1.736081, 1, 0, 0.04705882, 1,
2.396689, -0.7820637, 3.029006, 1, 0, 0.04313726, 1,
2.42944, 1.069638, 1.279103, 1, 0, 0.03529412, 1,
2.464862, -0.524564, 2.097896, 1, 0, 0.03137255, 1,
2.672584, -0.2880852, 2.262788, 1, 0, 0.02352941, 1,
2.732041, -0.6962892, 1.296994, 1, 0, 0.01960784, 1,
2.741218, 1.320925, -0.09871268, 1, 0, 0.01176471, 1,
3.13353, 0.5602049, 0.7898645, 1, 0, 0.007843138, 1
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
-0.1920178, -4.410419, -7.486156, 0, -0.5, 0.5, 0.5,
-0.1920178, -4.410419, -7.486156, 1, -0.5, 0.5, 0.5,
-0.1920178, -4.410419, -7.486156, 1, 1.5, 0.5, 0.5,
-0.1920178, -4.410419, -7.486156, 0, 1.5, 0.5, 0.5
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
-4.644926, 0.8639106, -7.486156, 0, -0.5, 0.5, 0.5,
-4.644926, 0.8639106, -7.486156, 1, -0.5, 0.5, 0.5,
-4.644926, 0.8639106, -7.486156, 1, 1.5, 0.5, 0.5,
-4.644926, 0.8639106, -7.486156, 0, 1.5, 0.5, 0.5
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
-4.644926, -4.410419, -0.008024216, 0, -0.5, 0.5, 0.5,
-4.644926, -4.410419, -0.008024216, 1, -0.5, 0.5, 0.5,
-4.644926, -4.410419, -0.008024216, 1, 1.5, 0.5, 0.5,
-4.644926, -4.410419, -0.008024216, 0, 1.5, 0.5, 0.5
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
-3, -3.193266, -5.760433,
3, -3.193266, -5.760433,
-3, -3.193266, -5.760433,
-3, -3.396124, -6.048053,
-2, -3.193266, -5.760433,
-2, -3.396124, -6.048053,
-1, -3.193266, -5.760433,
-1, -3.396124, -6.048053,
0, -3.193266, -5.760433,
0, -3.396124, -6.048053,
1, -3.193266, -5.760433,
1, -3.396124, -6.048053,
2, -3.193266, -5.760433,
2, -3.396124, -6.048053,
3, -3.193266, -5.760433,
3, -3.396124, -6.048053
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
-3, -3.801842, -6.623294, 0, -0.5, 0.5, 0.5,
-3, -3.801842, -6.623294, 1, -0.5, 0.5, 0.5,
-3, -3.801842, -6.623294, 1, 1.5, 0.5, 0.5,
-3, -3.801842, -6.623294, 0, 1.5, 0.5, 0.5,
-2, -3.801842, -6.623294, 0, -0.5, 0.5, 0.5,
-2, -3.801842, -6.623294, 1, -0.5, 0.5, 0.5,
-2, -3.801842, -6.623294, 1, 1.5, 0.5, 0.5,
-2, -3.801842, -6.623294, 0, 1.5, 0.5, 0.5,
-1, -3.801842, -6.623294, 0, -0.5, 0.5, 0.5,
-1, -3.801842, -6.623294, 1, -0.5, 0.5, 0.5,
-1, -3.801842, -6.623294, 1, 1.5, 0.5, 0.5,
-1, -3.801842, -6.623294, 0, 1.5, 0.5, 0.5,
0, -3.801842, -6.623294, 0, -0.5, 0.5, 0.5,
0, -3.801842, -6.623294, 1, -0.5, 0.5, 0.5,
0, -3.801842, -6.623294, 1, 1.5, 0.5, 0.5,
0, -3.801842, -6.623294, 0, 1.5, 0.5, 0.5,
1, -3.801842, -6.623294, 0, -0.5, 0.5, 0.5,
1, -3.801842, -6.623294, 1, -0.5, 0.5, 0.5,
1, -3.801842, -6.623294, 1, 1.5, 0.5, 0.5,
1, -3.801842, -6.623294, 0, 1.5, 0.5, 0.5,
2, -3.801842, -6.623294, 0, -0.5, 0.5, 0.5,
2, -3.801842, -6.623294, 1, -0.5, 0.5, 0.5,
2, -3.801842, -6.623294, 1, 1.5, 0.5, 0.5,
2, -3.801842, -6.623294, 0, 1.5, 0.5, 0.5,
3, -3.801842, -6.623294, 0, -0.5, 0.5, 0.5,
3, -3.801842, -6.623294, 1, -0.5, 0.5, 0.5,
3, -3.801842, -6.623294, 1, 1.5, 0.5, 0.5,
3, -3.801842, -6.623294, 0, 1.5, 0.5, 0.5
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
-3.617332, -2, -5.760433,
-3.617332, 4, -5.760433,
-3.617332, -2, -5.760433,
-3.788598, -2, -6.048053,
-3.617332, 0, -5.760433,
-3.788598, 0, -6.048053,
-3.617332, 2, -5.760433,
-3.788598, 2, -6.048053,
-3.617332, 4, -5.760433,
-3.788598, 4, -6.048053
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
"2",
"4"
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
-4.131129, -2, -6.623294, 0, -0.5, 0.5, 0.5,
-4.131129, -2, -6.623294, 1, -0.5, 0.5, 0.5,
-4.131129, -2, -6.623294, 1, 1.5, 0.5, 0.5,
-4.131129, -2, -6.623294, 0, 1.5, 0.5, 0.5,
-4.131129, 0, -6.623294, 0, -0.5, 0.5, 0.5,
-4.131129, 0, -6.623294, 1, -0.5, 0.5, 0.5,
-4.131129, 0, -6.623294, 1, 1.5, 0.5, 0.5,
-4.131129, 0, -6.623294, 0, 1.5, 0.5, 0.5,
-4.131129, 2, -6.623294, 0, -0.5, 0.5, 0.5,
-4.131129, 2, -6.623294, 1, -0.5, 0.5, 0.5,
-4.131129, 2, -6.623294, 1, 1.5, 0.5, 0.5,
-4.131129, 2, -6.623294, 0, 1.5, 0.5, 0.5,
-4.131129, 4, -6.623294, 0, -0.5, 0.5, 0.5,
-4.131129, 4, -6.623294, 1, -0.5, 0.5, 0.5,
-4.131129, 4, -6.623294, 1, 1.5, 0.5, 0.5,
-4.131129, 4, -6.623294, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.617332, -3.193266, -4,
-3.617332, -3.193266, 4,
-3.617332, -3.193266, -4,
-3.788598, -3.396124, -4,
-3.617332, -3.193266, -2,
-3.788598, -3.396124, -2,
-3.617332, -3.193266, 0,
-3.788598, -3.396124, 0,
-3.617332, -3.193266, 2,
-3.788598, -3.396124, 2,
-3.617332, -3.193266, 4,
-3.788598, -3.396124, 4
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
-4.131129, -3.801842, -4, 0, -0.5, 0.5, 0.5,
-4.131129, -3.801842, -4, 1, -0.5, 0.5, 0.5,
-4.131129, -3.801842, -4, 1, 1.5, 0.5, 0.5,
-4.131129, -3.801842, -4, 0, 1.5, 0.5, 0.5,
-4.131129, -3.801842, -2, 0, -0.5, 0.5, 0.5,
-4.131129, -3.801842, -2, 1, -0.5, 0.5, 0.5,
-4.131129, -3.801842, -2, 1, 1.5, 0.5, 0.5,
-4.131129, -3.801842, -2, 0, 1.5, 0.5, 0.5,
-4.131129, -3.801842, 0, 0, -0.5, 0.5, 0.5,
-4.131129, -3.801842, 0, 1, -0.5, 0.5, 0.5,
-4.131129, -3.801842, 0, 1, 1.5, 0.5, 0.5,
-4.131129, -3.801842, 0, 0, 1.5, 0.5, 0.5,
-4.131129, -3.801842, 2, 0, -0.5, 0.5, 0.5,
-4.131129, -3.801842, 2, 1, -0.5, 0.5, 0.5,
-4.131129, -3.801842, 2, 1, 1.5, 0.5, 0.5,
-4.131129, -3.801842, 2, 0, 1.5, 0.5, 0.5,
-4.131129, -3.801842, 4, 0, -0.5, 0.5, 0.5,
-4.131129, -3.801842, 4, 1, -0.5, 0.5, 0.5,
-4.131129, -3.801842, 4, 1, 1.5, 0.5, 0.5,
-4.131129, -3.801842, 4, 0, 1.5, 0.5, 0.5
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
-3.617332, -3.193266, -5.760433,
-3.617332, 4.921087, -5.760433,
-3.617332, -3.193266, 5.744384,
-3.617332, 4.921087, 5.744384,
-3.617332, -3.193266, -5.760433,
-3.617332, -3.193266, 5.744384,
-3.617332, 4.921087, -5.760433,
-3.617332, 4.921087, 5.744384,
-3.617332, -3.193266, -5.760433,
3.233296, -3.193266, -5.760433,
-3.617332, -3.193266, 5.744384,
3.233296, -3.193266, 5.744384,
-3.617332, 4.921087, -5.760433,
3.233296, 4.921087, -5.760433,
-3.617332, 4.921087, 5.744384,
3.233296, 4.921087, 5.744384,
3.233296, -3.193266, -5.760433,
3.233296, 4.921087, -5.760433,
3.233296, -3.193266, 5.744384,
3.233296, 4.921087, 5.744384,
3.233296, -3.193266, -5.760433,
3.233296, -3.193266, 5.744384,
3.233296, 4.921087, -5.760433,
3.233296, 4.921087, 5.744384
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
var radius = 8.360415;
var distance = 37.19643;
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
mvMatrix.translate( 0.1920178, -0.8639106, 0.008024216 );
mvMatrix.scale( 1.319506, 1.114007, 0.7857095 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.19643);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Gentamicin<-read.table("Gentamicin.xyz")
```

```
## Error in read.table("Gentamicin.xyz"): no lines available in input
```

```r
x<-Gentamicin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Gentamicin' not found
```

```r
y<-Gentamicin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Gentamicin' not found
```

```r
z<-Gentamicin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Gentamicin' not found
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
-3.517565, 1.866146, -0.4959801, 0, 0, 1, 1, 1,
-3.344345, -0.1984238, -3.375645, 1, 0, 0, 1, 1,
-2.870228, 1.218031, -0.3536502, 1, 0, 0, 1, 1,
-2.454703, 0.7766441, 0.02121797, 1, 0, 0, 1, 1,
-2.279278, 0.4988109, -2.012427, 1, 0, 0, 1, 1,
-2.214343, -0.481808, -1.843292, 1, 0, 0, 1, 1,
-2.176134, -0.2446574, -1.261263, 0, 0, 0, 1, 1,
-2.127775, -1.005501, -0.5017605, 0, 0, 0, 1, 1,
-2.100884, -0.8369038, -0.4233374, 0, 0, 0, 1, 1,
-2.073386, -1.094857, -2.268403, 0, 0, 0, 1, 1,
-2.060925, 0.6455609, 0.1540552, 0, 0, 0, 1, 1,
-2.053175, -0.4913676, -1.434205, 0, 0, 0, 1, 1,
-2.03001, -0.06310999, -0.8480408, 0, 0, 0, 1, 1,
-2.028516, -1.759633, -1.899192, 1, 1, 1, 1, 1,
-2.005861, 1.522706, 0.2395785, 1, 1, 1, 1, 1,
-2.005188, 1.05769, -1.553908, 1, 1, 1, 1, 1,
-2.004755, -0.002380166, -0.149625, 1, 1, 1, 1, 1,
-1.978267, -0.162357, -1.378499, 1, 1, 1, 1, 1,
-1.951327, -0.5850954, -3.751422, 1, 1, 1, 1, 1,
-1.947542, 0.6623921, -1.24152, 1, 1, 1, 1, 1,
-1.936535, 0.05610142, -1.440404, 1, 1, 1, 1, 1,
-1.935399, 0.9541412, -0.8697814, 1, 1, 1, 1, 1,
-1.929269, -1.583047, -2.33811, 1, 1, 1, 1, 1,
-1.91397, -0.4102016, -1.267506, 1, 1, 1, 1, 1,
-1.911509, 1.301838, -1.954211, 1, 1, 1, 1, 1,
-1.910497, 0.9521987, -0.9352932, 1, 1, 1, 1, 1,
-1.910433, -0.5034411, -1.391199, 1, 1, 1, 1, 1,
-1.894091, 0.1556731, -3.750785, 1, 1, 1, 1, 1,
-1.863652, -0.01682679, -1.858336, 0, 0, 1, 1, 1,
-1.843247, -0.008011144, -0.9414331, 1, 0, 0, 1, 1,
-1.838106, -1.757737, -4.690824, 1, 0, 0, 1, 1,
-1.837135, -0.9340887, -2.968558, 1, 0, 0, 1, 1,
-1.829263, -0.6290058, -2.470362, 1, 0, 0, 1, 1,
-1.827376, 0.4106149, -0.4460731, 1, 0, 0, 1, 1,
-1.801612, -0.8857677, -1.233146, 0, 0, 0, 1, 1,
-1.785188, -0.8683631, -2.073485, 0, 0, 0, 1, 1,
-1.783125, -0.1901595, -1.940536, 0, 0, 0, 1, 1,
-1.759515, 0.4681244, -1.492544, 0, 0, 0, 1, 1,
-1.757541, 0.1516418, -1.271778, 0, 0, 0, 1, 1,
-1.749218, 0.5244268, -1.824799, 0, 0, 0, 1, 1,
-1.72019, -1.960861, -1.997237, 0, 0, 0, 1, 1,
-1.7099, -0.4216588, -2.080824, 1, 1, 1, 1, 1,
-1.709128, 0.4612612, -0.6477437, 1, 1, 1, 1, 1,
-1.706655, 0.3160856, -0.1584533, 1, 1, 1, 1, 1,
-1.685728, -1.407739, -1.504934, 1, 1, 1, 1, 1,
-1.68485, -0.1932407, -1.681845, 1, 1, 1, 1, 1,
-1.665503, 1.391803, -0.5505421, 1, 1, 1, 1, 1,
-1.664422, 1.439334, -1.632931, 1, 1, 1, 1, 1,
-1.652378, -0.2116947, -2.180974, 1, 1, 1, 1, 1,
-1.646889, -0.4426981, -2.331051, 1, 1, 1, 1, 1,
-1.627637, 0.1242021, -1.415152, 1, 1, 1, 1, 1,
-1.608198, 4.802917, -0.8144352, 1, 1, 1, 1, 1,
-1.588514, 1.110207, -1.079169, 1, 1, 1, 1, 1,
-1.579306, 0.5689024, -2.332812, 1, 1, 1, 1, 1,
-1.576783, 0.3439464, -1.019024, 1, 1, 1, 1, 1,
-1.572298, 2.07183, -1.402362, 1, 1, 1, 1, 1,
-1.565004, 0.7330629, -1.653663, 0, 0, 1, 1, 1,
-1.557232, 1.009357, -2.2918, 1, 0, 0, 1, 1,
-1.554111, 0.6597378, -0.0385737, 1, 0, 0, 1, 1,
-1.548637, 0.4827763, -3.13236, 1, 0, 0, 1, 1,
-1.531887, 0.4276888, 0.3318788, 1, 0, 0, 1, 1,
-1.520683, 0.338615, 0.1452469, 1, 0, 0, 1, 1,
-1.514392, 0.3921338, -1.245836, 0, 0, 0, 1, 1,
-1.514075, -1.677052, -2.805738, 0, 0, 0, 1, 1,
-1.513331, -0.6058262, -1.403887, 0, 0, 0, 1, 1,
-1.511522, -0.3769719, -0.6184129, 0, 0, 0, 1, 1,
-1.510844, -0.8797424, -3.196692, 0, 0, 0, 1, 1,
-1.507103, 1.517339, -1.488761, 0, 0, 0, 1, 1,
-1.502872, 1.124472, -2.174825, 0, 0, 0, 1, 1,
-1.499715, 0.8259858, -0.5961186, 1, 1, 1, 1, 1,
-1.492805, -0.2479891, -2.045019, 1, 1, 1, 1, 1,
-1.491587, 0.6930165, -0.6775879, 1, 1, 1, 1, 1,
-1.486372, 0.6207532, -1.224674, 1, 1, 1, 1, 1,
-1.465626, 1.082016, -1.450842, 1, 1, 1, 1, 1,
-1.463901, 1.830378, -0.9552449, 1, 1, 1, 1, 1,
-1.459604, -1.97966, -1.779076, 1, 1, 1, 1, 1,
-1.455497, -1.973172, -0.3335467, 1, 1, 1, 1, 1,
-1.454268, -1.402112, -2.230461, 1, 1, 1, 1, 1,
-1.452555, -2.816714, -1.856613, 1, 1, 1, 1, 1,
-1.441067, -0.3763551, 0.1139744, 1, 1, 1, 1, 1,
-1.438645, -1.94061, -3.856416, 1, 1, 1, 1, 1,
-1.437, 0.6458102, -1.797511, 1, 1, 1, 1, 1,
-1.425107, -1.939667, -2.845264, 1, 1, 1, 1, 1,
-1.424172, 0.3650852, -1.076124, 1, 1, 1, 1, 1,
-1.419124, 0.6561187, -0.9617404, 0, 0, 1, 1, 1,
-1.415886, -0.1776239, -1.123201, 1, 0, 0, 1, 1,
-1.414397, -0.2196337, -2.307066, 1, 0, 0, 1, 1,
-1.400457, 1.038071, -0.5055726, 1, 0, 0, 1, 1,
-1.392879, -0.5038087, -3.016491, 1, 0, 0, 1, 1,
-1.390752, 1.168497, -0.8486239, 1, 0, 0, 1, 1,
-1.384896, 0.5965478, -1.631827, 0, 0, 0, 1, 1,
-1.378796, -0.8932832, -2.915833, 0, 0, 0, 1, 1,
-1.377579, 0.04905966, -3.518399, 0, 0, 0, 1, 1,
-1.371629, 0.9839491, 0.250196, 0, 0, 0, 1, 1,
-1.367641, 2.921189, -1.630077, 0, 0, 0, 1, 1,
-1.34784, -0.7458524, -3.500275, 0, 0, 0, 1, 1,
-1.344751, 0.2356181, 0.5404946, 0, 0, 0, 1, 1,
-1.329536, 1.067656, -0.6372092, 1, 1, 1, 1, 1,
-1.329403, 0.3279377, -1.022828, 1, 1, 1, 1, 1,
-1.310913, 0.2627062, -0.2897574, 1, 1, 1, 1, 1,
-1.292537, -2.137188, -2.807393, 1, 1, 1, 1, 1,
-1.291082, 0.6281088, -0.911391, 1, 1, 1, 1, 1,
-1.287545, -0.5792556, -3.762521, 1, 1, 1, 1, 1,
-1.282832, -1.020975, -1.149407, 1, 1, 1, 1, 1,
-1.282272, -0.7320838, -2.354675, 1, 1, 1, 1, 1,
-1.275211, 0.6923758, 0.3097855, 1, 1, 1, 1, 1,
-1.273251, -0.4339625, -3.386376, 1, 1, 1, 1, 1,
-1.266577, 0.192695, -1.657663, 1, 1, 1, 1, 1,
-1.266554, -1.250328, -0.4892198, 1, 1, 1, 1, 1,
-1.250559, 1.081311, 0.8421181, 1, 1, 1, 1, 1,
-1.249549, -1.012008, -3.636495, 1, 1, 1, 1, 1,
-1.23206, 1.014675, -1.117132, 1, 1, 1, 1, 1,
-1.228391, -0.1253936, -3.515338, 0, 0, 1, 1, 1,
-1.225652, -1.120708, -2.525776, 1, 0, 0, 1, 1,
-1.2211, -0.1942393, -1.636865, 1, 0, 0, 1, 1,
-1.220135, -0.3042642, -2.883798, 1, 0, 0, 1, 1,
-1.212603, 0.3085073, -1.473649, 1, 0, 0, 1, 1,
-1.211601, -0.7448974, -2.290424, 1, 0, 0, 1, 1,
-1.209389, -1.117009, -0.9944321, 0, 0, 0, 1, 1,
-1.204353, -0.8766682, -2.374496, 0, 0, 0, 1, 1,
-1.194044, 2.023779, 0.1650444, 0, 0, 0, 1, 1,
-1.193768, 1.712427, -0.7181525, 0, 0, 0, 1, 1,
-1.191386, -0.9464353, -2.557066, 0, 0, 0, 1, 1,
-1.191129, -0.6449587, -3.447958, 0, 0, 0, 1, 1,
-1.184762, 0.9718597, -2.627321, 0, 0, 0, 1, 1,
-1.172418, -2.255223, -1.652999, 1, 1, 1, 1, 1,
-1.154914, 0.1115511, -0.3251436, 1, 1, 1, 1, 1,
-1.153083, 0.5647493, -2.334942, 1, 1, 1, 1, 1,
-1.149443, -0.2163486, -2.270341, 1, 1, 1, 1, 1,
-1.146163, 0.02765022, 0.09045355, 1, 1, 1, 1, 1,
-1.141551, 0.1747762, -0.3075716, 1, 1, 1, 1, 1,
-1.138976, -0.8598157, -1.924018, 1, 1, 1, 1, 1,
-1.136361, 0.5816134, -1.938102, 1, 1, 1, 1, 1,
-1.13579, 0.2275176, -2.042341, 1, 1, 1, 1, 1,
-1.129121, -1.474946, -2.201862, 1, 1, 1, 1, 1,
-1.123291, -0.4133952, -1.420382, 1, 1, 1, 1, 1,
-1.120507, -0.3589081, -1.792496, 1, 1, 1, 1, 1,
-1.118575, 0.4456093, -1.32791, 1, 1, 1, 1, 1,
-1.118301, -0.06377973, 0.8758178, 1, 1, 1, 1, 1,
-1.116562, -2.066023, -2.252376, 1, 1, 1, 1, 1,
-1.115802, -0.7009361, -2.988829, 0, 0, 1, 1, 1,
-1.114401, -0.8837674, -3.760422, 1, 0, 0, 1, 1,
-1.113301, -0.6058415, -2.619688, 1, 0, 0, 1, 1,
-1.104738, 0.3615273, -1.306906, 1, 0, 0, 1, 1,
-1.100386, -0.6580561, -1.754223, 1, 0, 0, 1, 1,
-1.095839, 0.1636461, -0.3164033, 1, 0, 0, 1, 1,
-1.093478, 0.1465734, -2.709198, 0, 0, 0, 1, 1,
-1.093001, 1.655861, -0.4705633, 0, 0, 0, 1, 1,
-1.070447, -0.2792662, -0.8509859, 0, 0, 0, 1, 1,
-1.068531, -0.4137475, -2.167294, 0, 0, 0, 1, 1,
-1.068422, 0.04447312, -0.287303, 0, 0, 0, 1, 1,
-1.068378, -0.235302, -0.8860237, 0, 0, 0, 1, 1,
-1.066048, 0.6624483, 0.7069368, 0, 0, 0, 1, 1,
-1.062625, 0.1591475, -0.8014687, 1, 1, 1, 1, 1,
-1.056409, -0.7178093, -1.565116, 1, 1, 1, 1, 1,
-1.055745, -0.4390533, -0.5104663, 1, 1, 1, 1, 1,
-1.047774, -0.5145021, -1.716444, 1, 1, 1, 1, 1,
-1.037753, -1.834446, -3.814761, 1, 1, 1, 1, 1,
-1.036489, 0.6116167, -0.5462471, 1, 1, 1, 1, 1,
-1.027497, -1.379994, -2.569309, 1, 1, 1, 1, 1,
-1.015914, -1.07626, -4.079108, 1, 1, 1, 1, 1,
-1.012615, -0.8076333, -0.9788294, 1, 1, 1, 1, 1,
-1.006831, -1.767955, -2.019927, 1, 1, 1, 1, 1,
-1.00227, 1.780943, 0.5397817, 1, 1, 1, 1, 1,
-1.000904, -0.003743398, -0.9170364, 1, 1, 1, 1, 1,
-1.000762, -0.8993838, -1.507557, 1, 1, 1, 1, 1,
-1.000398, 0.2726225, -0.6917212, 1, 1, 1, 1, 1,
-0.995759, 1.005737, 0.4787572, 1, 1, 1, 1, 1,
-0.9933749, 0.1681419, -2.858834, 0, 0, 1, 1, 1,
-0.9923053, -0.9621557, -1.781819, 1, 0, 0, 1, 1,
-0.9872946, -1.475935, -2.962168, 1, 0, 0, 1, 1,
-0.9863235, 1.406413, 0.2524732, 1, 0, 0, 1, 1,
-0.9760904, -0.4012361, -2.936785, 1, 0, 0, 1, 1,
-0.9689056, 2.491291, -0.1947939, 1, 0, 0, 1, 1,
-0.960264, -0.6682765, -1.621242, 0, 0, 0, 1, 1,
-0.9575521, -2.236964, -3.864625, 0, 0, 0, 1, 1,
-0.9532343, -1.925531, -4.003098, 0, 0, 0, 1, 1,
-0.9483544, 0.05273341, -1.808527, 0, 0, 0, 1, 1,
-0.9478377, -0.07094114, -0.6094883, 0, 0, 0, 1, 1,
-0.9468898, 1.396449, -0.1374936, 0, 0, 0, 1, 1,
-0.9337559, 0.715678, -2.068322, 0, 0, 0, 1, 1,
-0.9336938, 0.1179233, -2.295488, 1, 1, 1, 1, 1,
-0.9319724, 0.9075054, -0.492617, 1, 1, 1, 1, 1,
-0.9299359, -0.01159288, -1.54274, 1, 1, 1, 1, 1,
-0.9230229, -2.639514, -2.896823, 1, 1, 1, 1, 1,
-0.9211665, 0.3126166, -1.393801, 1, 1, 1, 1, 1,
-0.9209841, -0.07859647, -0.6349921, 1, 1, 1, 1, 1,
-0.9196944, 1.098728, -0.5523556, 1, 1, 1, 1, 1,
-0.916986, 0.1962875, 0.6170642, 1, 1, 1, 1, 1,
-0.9158394, 0.9011983, -1.338567, 1, 1, 1, 1, 1,
-0.9135334, -0.8404894, -2.203754, 1, 1, 1, 1, 1,
-0.9045695, -0.0118288, -0.7450666, 1, 1, 1, 1, 1,
-0.9042642, -0.08155961, -2.764319, 1, 1, 1, 1, 1,
-0.9018524, -0.3109808, -0.5671058, 1, 1, 1, 1, 1,
-0.8996584, 1.99227, -1.344159, 1, 1, 1, 1, 1,
-0.8982912, -0.7634695, -2.623345, 1, 1, 1, 1, 1,
-0.8979677, -1.336317, -1.297427, 0, 0, 1, 1, 1,
-0.8936877, -0.529199, -1.147071, 1, 0, 0, 1, 1,
-0.892451, 0.5270957, -2.110397, 1, 0, 0, 1, 1,
-0.8871859, -0.8337164, -2.838167, 1, 0, 0, 1, 1,
-0.8867878, 1.361296, -1.911842, 1, 0, 0, 1, 1,
-0.8728174, 0.2469944, -1.818677, 1, 0, 0, 1, 1,
-0.8703696, 0.3140893, -0.9461889, 0, 0, 0, 1, 1,
-0.8687691, -0.335687, -1.409642, 0, 0, 0, 1, 1,
-0.8617363, 0.4222942, -0.9783583, 0, 0, 0, 1, 1,
-0.8575137, -2.028455, -3.210878, 0, 0, 0, 1, 1,
-0.8565496, 0.9264642, 1.323289, 0, 0, 0, 1, 1,
-0.8560675, 0.1161713, -1.898735, 0, 0, 0, 1, 1,
-0.8504446, 1.162234, -0.4625697, 0, 0, 0, 1, 1,
-0.8494384, -0.9405751, -2.53132, 1, 1, 1, 1, 1,
-0.8458919, -1.315233, -2.263464, 1, 1, 1, 1, 1,
-0.8419768, 0.3342529, -1.815518, 1, 1, 1, 1, 1,
-0.8407382, -0.6950493, 0.04730564, 1, 1, 1, 1, 1,
-0.8370571, 1.706939, -1.753123, 1, 1, 1, 1, 1,
-0.8357633, 0.5758936, 0.4397767, 1, 1, 1, 1, 1,
-0.8255389, 1.128113, -0.384592, 1, 1, 1, 1, 1,
-0.8185151, 0.1126598, -0.5378127, 1, 1, 1, 1, 1,
-0.8173984, -0.6316738, -2.357212, 1, 1, 1, 1, 1,
-0.8146567, -0.4156684, -0.3419282, 1, 1, 1, 1, 1,
-0.8125221, -1.699458, -2.882366, 1, 1, 1, 1, 1,
-0.8097118, -0.1484346, -2.105263, 1, 1, 1, 1, 1,
-0.8092072, 0.1934607, -1.003978, 1, 1, 1, 1, 1,
-0.8071134, -0.5574631, -3.975809, 1, 1, 1, 1, 1,
-0.8041541, 2.57904, -1.063962, 1, 1, 1, 1, 1,
-0.8038558, -0.3750201, -3.158909, 0, 0, 1, 1, 1,
-0.8019804, 0.5656748, -0.2345091, 1, 0, 0, 1, 1,
-0.7952649, -0.3491609, -1.84977, 1, 0, 0, 1, 1,
-0.7935408, 1.113577, -0.3694123, 1, 0, 0, 1, 1,
-0.7927217, 0.04940913, -1.605337, 1, 0, 0, 1, 1,
-0.792638, 0.7492996, -0.7017449, 1, 0, 0, 1, 1,
-0.7911713, 1.005404, -2.035678, 0, 0, 0, 1, 1,
-0.7790118, -1.714419, -3.219315, 0, 0, 0, 1, 1,
-0.7761838, 1.076571, -2.036513, 0, 0, 0, 1, 1,
-0.7653643, -0.5149977, -2.394765, 0, 0, 0, 1, 1,
-0.7625743, 0.9891996, -1.821987, 0, 0, 0, 1, 1,
-0.7444897, -0.3230166, -1.041357, 0, 0, 0, 1, 1,
-0.7404617, 0.1674725, -2.150699, 0, 0, 0, 1, 1,
-0.7337167, -0.2627923, -1.435133, 1, 1, 1, 1, 1,
-0.7319157, 2.297967, -0.3016041, 1, 1, 1, 1, 1,
-0.7247581, -0.364223, -1.500326, 1, 1, 1, 1, 1,
-0.7216488, -1.137945, -3.211469, 1, 1, 1, 1, 1,
-0.7188539, 0.3710601, -2.661729, 1, 1, 1, 1, 1,
-0.7170698, 0.1372235, -1.013592, 1, 1, 1, 1, 1,
-0.716884, 1.003798, -0.3236091, 1, 1, 1, 1, 1,
-0.7113996, 0.398367, -1.285308, 1, 1, 1, 1, 1,
-0.7094321, 0.2797792, -0.5174698, 1, 1, 1, 1, 1,
-0.7062921, -0.5262462, -0.4654965, 1, 1, 1, 1, 1,
-0.7003545, -0.09131995, -2.116668, 1, 1, 1, 1, 1,
-0.6994429, 0.06356659, -2.084316, 1, 1, 1, 1, 1,
-0.6985912, 0.07874072, -2.380624, 1, 1, 1, 1, 1,
-0.6946456, -0.3812794, -1.314169, 1, 1, 1, 1, 1,
-0.6872292, -0.9393767, -2.29621, 1, 1, 1, 1, 1,
-0.6810503, 0.903661, -0.9083961, 0, 0, 1, 1, 1,
-0.6769639, -0.9875358, -1.131063, 1, 0, 0, 1, 1,
-0.6753046, 0.02362948, -2.315562, 1, 0, 0, 1, 1,
-0.6717077, 1.033331, 0.7571078, 1, 0, 0, 1, 1,
-0.668845, -0.4501064, -2.320393, 1, 0, 0, 1, 1,
-0.6660004, 1.429786, -0.3181704, 1, 0, 0, 1, 1,
-0.6620939, -1.203838, -2.082567, 0, 0, 0, 1, 1,
-0.661159, 0.1476902, -1.168276, 0, 0, 0, 1, 1,
-0.6579241, -2.198672, -2.015545, 0, 0, 0, 1, 1,
-0.6535749, -1.492601, -4.190384, 0, 0, 0, 1, 1,
-0.6519637, 0.1120699, -1.540671, 0, 0, 0, 1, 1,
-0.6434728, 0.1567022, -2.368969, 0, 0, 0, 1, 1,
-0.6378838, -0.6865595, -3.76044, 0, 0, 0, 1, 1,
-0.6377032, 1.191564, -0.2815501, 1, 1, 1, 1, 1,
-0.6374742, 0.1701217, -2.772597, 1, 1, 1, 1, 1,
-0.6362675, 0.2525664, -3.345017, 1, 1, 1, 1, 1,
-0.6350876, -0.1216118, -1.608237, 1, 1, 1, 1, 1,
-0.6291724, 1.840832, -0.6524382, 1, 1, 1, 1, 1,
-0.6286278, 1.691639, 0.760753, 1, 1, 1, 1, 1,
-0.6267506, 1.926714, 0.3791029, 1, 1, 1, 1, 1,
-0.6245442, 0.1908629, -1.219043, 1, 1, 1, 1, 1,
-0.6239763, 0.009451216, -2.724177, 1, 1, 1, 1, 1,
-0.6219686, -0.5913346, -3.436584, 1, 1, 1, 1, 1,
-0.6207301, 1.882337, 1.079511, 1, 1, 1, 1, 1,
-0.6171903, 1.359202, -0.8870037, 1, 1, 1, 1, 1,
-0.6098588, 2.794689, 1.200444, 1, 1, 1, 1, 1,
-0.6067671, -0.8999528, -1.969147, 1, 1, 1, 1, 1,
-0.6027481, 2.331368, 1.328848, 1, 1, 1, 1, 1,
-0.60159, 0.09740054, -4.032439, 0, 0, 1, 1, 1,
-0.5950879, -0.5421247, -2.950623, 1, 0, 0, 1, 1,
-0.5942739, 0.3976388, -0.1766986, 1, 0, 0, 1, 1,
-0.5942451, -1.792426, -4.319973, 1, 0, 0, 1, 1,
-0.5926759, -0.8832891, -2.725036, 1, 0, 0, 1, 1,
-0.5841662, 0.1973879, -2.08147, 1, 0, 0, 1, 1,
-0.5817682, 0.8632386, -0.4944579, 0, 0, 0, 1, 1,
-0.5813353, -0.5948153, -2.548096, 0, 0, 0, 1, 1,
-0.572425, -0.2161624, -2.50475, 0, 0, 0, 1, 1,
-0.5655767, 0.05959696, -1.336888, 0, 0, 0, 1, 1,
-0.5628938, -0.5334993, -2.321644, 0, 0, 0, 1, 1,
-0.5626417, 0.3449498, -2.425612, 0, 0, 0, 1, 1,
-0.555228, 0.04600878, -2.993861, 0, 0, 0, 1, 1,
-0.5549062, -0.9773663, -2.513127, 1, 1, 1, 1, 1,
-0.5467883, 0.263225, -0.424459, 1, 1, 1, 1, 1,
-0.5466815, -1.005537, -0.5104185, 1, 1, 1, 1, 1,
-0.5421086, -0.6126788, -3.370678, 1, 1, 1, 1, 1,
-0.5419648, -0.3812096, -2.399748, 1, 1, 1, 1, 1,
-0.5407744, 0.6375668, -1.095956, 1, 1, 1, 1, 1,
-0.5341564, -0.4964161, -2.48578, 1, 1, 1, 1, 1,
-0.527408, -0.0007760774, -0.6303453, 1, 1, 1, 1, 1,
-0.5251393, 1.603636, 0.4956315, 1, 1, 1, 1, 1,
-0.5230868, 1.701369, -0.2473343, 1, 1, 1, 1, 1,
-0.5212315, 1.992846, -0.8646114, 1, 1, 1, 1, 1,
-0.5188143, -0.5659136, -2.553646, 1, 1, 1, 1, 1,
-0.5157722, 0.6910286, 1.275985, 1, 1, 1, 1, 1,
-0.5151742, 0.1961915, -0.3617818, 1, 1, 1, 1, 1,
-0.509968, -0.53377, -1.926355, 1, 1, 1, 1, 1,
-0.508908, 0.9482297, -1.696877, 0, 0, 1, 1, 1,
-0.5086982, 0.6198027, 0.7977706, 1, 0, 0, 1, 1,
-0.5056393, 0.3015191, -1.106511, 1, 0, 0, 1, 1,
-0.5051706, -1.029256, -4.089585, 1, 0, 0, 1, 1,
-0.5049833, -0.6998591, -2.806568, 1, 0, 0, 1, 1,
-0.5045125, -1.786981, -3.566526, 1, 0, 0, 1, 1,
-0.5024867, -0.356052, -2.169943, 0, 0, 0, 1, 1,
-0.5000555, 0.2130038, -2.977362, 0, 0, 0, 1, 1,
-0.495793, 0.7468531, -3.042011, 0, 0, 0, 1, 1,
-0.4931118, 0.8080767, -0.6513252, 0, 0, 0, 1, 1,
-0.4910657, -0.01870109, 0.03686243, 0, 0, 0, 1, 1,
-0.4895454, 1.46279, -1.21968, 0, 0, 0, 1, 1,
-0.4797465, -0.7758052, -2.456586, 0, 0, 0, 1, 1,
-0.4792229, 1.638318, -0.6129755, 1, 1, 1, 1, 1,
-0.4767987, -1.78314, -2.805309, 1, 1, 1, 1, 1,
-0.4710663, -0.9536228, -1.348239, 1, 1, 1, 1, 1,
-0.470506, 0.9225011, 0.1839696, 1, 1, 1, 1, 1,
-0.4654834, 0.04396009, -1.969387, 1, 1, 1, 1, 1,
-0.4649712, 2.070223, 0.1701727, 1, 1, 1, 1, 1,
-0.4584723, 0.8083017, -2.010418, 1, 1, 1, 1, 1,
-0.4571243, -0.5270964, -2.175552, 1, 1, 1, 1, 1,
-0.4559118, -0.4235008, -2.694723, 1, 1, 1, 1, 1,
-0.4533329, 0.8660543, -0.2810202, 1, 1, 1, 1, 1,
-0.4531473, 0.1187436, -2.526846, 1, 1, 1, 1, 1,
-0.4524897, 1.867496, -0.6371036, 1, 1, 1, 1, 1,
-0.4512664, 0.3039382, -0.9907688, 1, 1, 1, 1, 1,
-0.4511513, -0.9891496, -3.320465, 1, 1, 1, 1, 1,
-0.4481679, 2.078421, 1.870657, 1, 1, 1, 1, 1,
-0.4473269, -1.872557, -4.663755, 0, 0, 1, 1, 1,
-0.4458676, -2.152973, -4.134602, 1, 0, 0, 1, 1,
-0.4407669, -0.3082782, -1.256014, 1, 0, 0, 1, 1,
-0.4380682, 0.8690944, -2.217528, 1, 0, 0, 1, 1,
-0.4376531, 0.246142, -1.326441, 1, 0, 0, 1, 1,
-0.4357796, -1.371642, -1.997754, 1, 0, 0, 1, 1,
-0.4349925, -0.4049518, -2.433553, 0, 0, 0, 1, 1,
-0.432438, -1.670106, -2.081801, 0, 0, 0, 1, 1,
-0.4320815, 0.07844532, -2.123948, 0, 0, 0, 1, 1,
-0.4298735, 1.08107, 0.08093364, 0, 0, 0, 1, 1,
-0.428785, 0.1280587, -1.073702, 0, 0, 0, 1, 1,
-0.4277349, 0.09194575, -0.4868042, 0, 0, 0, 1, 1,
-0.4275818, 0.3078431, -1.296114, 0, 0, 0, 1, 1,
-0.4236909, 0.2642305, -0.1177839, 1, 1, 1, 1, 1,
-0.4220103, -0.439307, -2.253456, 1, 1, 1, 1, 1,
-0.4182988, 0.6996883, -0.9250193, 1, 1, 1, 1, 1,
-0.4165218, -1.078675, -3.494782, 1, 1, 1, 1, 1,
-0.4159108, 0.7939703, 0.9017532, 1, 1, 1, 1, 1,
-0.4154581, -0.1798639, -1.280112, 1, 1, 1, 1, 1,
-0.4153023, -1.848842, -1.309193, 1, 1, 1, 1, 1,
-0.4135023, 0.8037627, 0.1783859, 1, 1, 1, 1, 1,
-0.4133281, -1.186935, -2.964006, 1, 1, 1, 1, 1,
-0.4006683, -1.520815, -2.985952, 1, 1, 1, 1, 1,
-0.3995629, -0.9692615, -2.541878, 1, 1, 1, 1, 1,
-0.3942211, 0.6244959, -0.2759074, 1, 1, 1, 1, 1,
-0.3939567, -0.5891165, -2.656523, 1, 1, 1, 1, 1,
-0.3886575, 0.4639094, -1.755271, 1, 1, 1, 1, 1,
-0.3873423, -0.8911535, -1.939095, 1, 1, 1, 1, 1,
-0.3861287, 2.253904, -0.02901443, 0, 0, 1, 1, 1,
-0.3831322, 0.5947508, -1.616186, 1, 0, 0, 1, 1,
-0.3788313, -1.020771, -1.988002, 1, 0, 0, 1, 1,
-0.3762282, -0.09217755, -2.908827, 1, 0, 0, 1, 1,
-0.3749003, -0.3473093, -1.608531, 1, 0, 0, 1, 1,
-0.3747504, -1.363152, -2.094601, 1, 0, 0, 1, 1,
-0.3725587, 0.8934466, -1.324939, 0, 0, 0, 1, 1,
-0.3717199, 0.3460958, -0.02589562, 0, 0, 0, 1, 1,
-0.3705386, 0.8753435, -1.993261, 0, 0, 0, 1, 1,
-0.3676446, -0.0365626, -1.901931, 0, 0, 0, 1, 1,
-0.366105, 0.1757268, -0.5180692, 0, 0, 0, 1, 1,
-0.3626623, 1.19068, 1.219333, 0, 0, 0, 1, 1,
-0.3617454, -1.791014, -3.052481, 0, 0, 0, 1, 1,
-0.3589613, -0.7583107, -1.920225, 1, 1, 1, 1, 1,
-0.3512681, -0.2799186, -1.138668, 1, 1, 1, 1, 1,
-0.3435835, 0.9072775, -1.188474, 1, 1, 1, 1, 1,
-0.3425002, -1.016913, -3.550088, 1, 1, 1, 1, 1,
-0.3366659, 0.4568371, -1.50561, 1, 1, 1, 1, 1,
-0.3361005, -1.052284, -1.192416, 1, 1, 1, 1, 1,
-0.334317, -0.6282514, -2.902411, 1, 1, 1, 1, 1,
-0.332944, 0.0621472, -3.602833, 1, 1, 1, 1, 1,
-0.3327792, 0.1451043, -3.003112, 1, 1, 1, 1, 1,
-0.3275223, 0.3639596, -1.450428, 1, 1, 1, 1, 1,
-0.3229532, 1.208623, -1.550257, 1, 1, 1, 1, 1,
-0.3216515, -0.7465512, -2.361447, 1, 1, 1, 1, 1,
-0.3108754, 0.2364248, -0.5517671, 1, 1, 1, 1, 1,
-0.3091165, -0.5980684, -3.782197, 1, 1, 1, 1, 1,
-0.3052164, -0.5839139, -3.048819, 1, 1, 1, 1, 1,
-0.3012787, -0.8831491, -2.623034, 0, 0, 1, 1, 1,
-0.3011832, 0.2300466, -2.160648, 1, 0, 0, 1, 1,
-0.2941007, -3.075095, -3.793993, 1, 0, 0, 1, 1,
-0.2936166, -2.091736, -3.327962, 1, 0, 0, 1, 1,
-0.2930482, -0.08804277, -2.181865, 1, 0, 0, 1, 1,
-0.2889049, -0.2531093, -2.898911, 1, 0, 0, 1, 1,
-0.2853913, 0.1396899, -0.05101864, 0, 0, 0, 1, 1,
-0.2830016, 1.320121, 0.07881141, 0, 0, 0, 1, 1,
-0.2758666, 0.8776316, -0.8330483, 0, 0, 0, 1, 1,
-0.2746396, -1.472992, -3.461871, 0, 0, 0, 1, 1,
-0.2718987, 0.489225, -0.9856225, 0, 0, 0, 1, 1,
-0.2655763, 0.815412, -2.329601, 0, 0, 0, 1, 1,
-0.2613551, 0.1098862, -0.2280253, 0, 0, 0, 1, 1,
-0.2603823, -0.8209844, -3.49601, 1, 1, 1, 1, 1,
-0.2540726, -0.4384179, -0.1942669, 1, 1, 1, 1, 1,
-0.2521436, -1.102816, -4.078411, 1, 1, 1, 1, 1,
-0.2396487, 0.9130591, -0.4856855, 1, 1, 1, 1, 1,
-0.2375399, 0.3676343, 0.7987335, 1, 1, 1, 1, 1,
-0.2337478, 0.7862511, -1.453892, 1, 1, 1, 1, 1,
-0.2323078, 0.69888, -1.902144, 1, 1, 1, 1, 1,
-0.2308202, -1.398621, -2.545891, 1, 1, 1, 1, 1,
-0.2247585, 0.5788847, 0.4529417, 1, 1, 1, 1, 1,
-0.211012, -1.315558, -1.579966, 1, 1, 1, 1, 1,
-0.2105325, -1.862942, -3.781503, 1, 1, 1, 1, 1,
-0.2068083, -0.3871079, -2.264454, 1, 1, 1, 1, 1,
-0.2050623, 0.5440513, 0.68559, 1, 1, 1, 1, 1,
-0.2040637, 0.355977, -1.421403, 1, 1, 1, 1, 1,
-0.2012382, 0.651646, -0.6610801, 1, 1, 1, 1, 1,
-0.1968158, 1.404592, 0.9039612, 0, 0, 1, 1, 1,
-0.1964256, 2.027403, 1.000484, 1, 0, 0, 1, 1,
-0.1924516, 0.2553499, -1.432175, 1, 0, 0, 1, 1,
-0.1910288, 0.5922618, 0.8304808, 1, 0, 0, 1, 1,
-0.1901072, -0.2015275, -1.739417, 1, 0, 0, 1, 1,
-0.1855131, 0.08784966, -1.200393, 1, 0, 0, 1, 1,
-0.1842314, -0.5096401, -3.080562, 0, 0, 0, 1, 1,
-0.1830891, -0.6017048, -4.028165, 0, 0, 0, 1, 1,
-0.1805534, -0.3195148, -2.265031, 0, 0, 0, 1, 1,
-0.1797464, -0.6445506, -2.427992, 0, 0, 0, 1, 1,
-0.1725671, 0.5546246, 0.5369794, 0, 0, 0, 1, 1,
-0.1656768, -1.65427, -2.812544, 0, 0, 0, 1, 1,
-0.1635505, -0.05863168, -2.278451, 0, 0, 0, 1, 1,
-0.1609426, -0.8897385, -3.191651, 1, 1, 1, 1, 1,
-0.1603892, 0.1334668, -1.198939, 1, 1, 1, 1, 1,
-0.1577348, 0.6360435, 0.4318321, 1, 1, 1, 1, 1,
-0.157376, -0.7845619, -5.592887, 1, 1, 1, 1, 1,
-0.1561252, 1.689072, 0.2193983, 1, 1, 1, 1, 1,
-0.1428627, 0.8711052, -1.241885, 1, 1, 1, 1, 1,
-0.1420908, 0.5228861, -0.8529697, 1, 1, 1, 1, 1,
-0.1353029, 1.248468, -0.3352923, 1, 1, 1, 1, 1,
-0.1338491, -1.846543, -4.4872, 1, 1, 1, 1, 1,
-0.1336737, 0.3566376, -1.231589, 1, 1, 1, 1, 1,
-0.1325506, 1.014331, -1.082865, 1, 1, 1, 1, 1,
-0.1314067, -0.5954748, -4.184062, 1, 1, 1, 1, 1,
-0.1268164, -1.148317, -3.240045, 1, 1, 1, 1, 1,
-0.1264427, -0.4967172, -4.198353, 1, 1, 1, 1, 1,
-0.1254673, 0.4824896, -0.1362774, 1, 1, 1, 1, 1,
-0.1195169, -0.0740267, -1.175688, 0, 0, 1, 1, 1,
-0.1164258, 0.2537557, 0.1077984, 1, 0, 0, 1, 1,
-0.1129009, -0.9369435, -1.633944, 1, 0, 0, 1, 1,
-0.107619, -0.315672, -1.489905, 1, 0, 0, 1, 1,
-0.1075532, 1.750169, 1.765962, 1, 0, 0, 1, 1,
-0.1027228, -0.8967982, -3.91481, 1, 0, 0, 1, 1,
-0.09807584, -0.8546013, -1.014762, 0, 0, 0, 1, 1,
-0.0968285, -2.054013, -4.175277, 0, 0, 0, 1, 1,
-0.09286174, -1.479001, -5.066297, 0, 0, 0, 1, 1,
-0.08238532, 0.962359, 0.9696577, 0, 0, 0, 1, 1,
-0.08129346, 0.9355955, 0.5221962, 0, 0, 0, 1, 1,
-0.07890372, -2.429317, -2.318188, 0, 0, 0, 1, 1,
-0.07735708, -1.407522, -2.839147, 0, 0, 0, 1, 1,
-0.07453622, -0.4360648, -2.850782, 1, 1, 1, 1, 1,
-0.0734713, -0.0308766, -2.89388, 1, 1, 1, 1, 1,
-0.07203276, 1.249179, 0.01823084, 1, 1, 1, 1, 1,
-0.06799202, 0.4356064, -1.540774, 1, 1, 1, 1, 1,
-0.06281079, 0.951578, -0.948867, 1, 1, 1, 1, 1,
-0.0627517, 0.5104756, 0.3323112, 1, 1, 1, 1, 1,
-0.05453666, -1.395596, -4.908809, 1, 1, 1, 1, 1,
-0.0483725, 0.6843076, -1.070313, 1, 1, 1, 1, 1,
-0.04772997, 2.679156, -0.6541846, 1, 1, 1, 1, 1,
-0.04229189, 0.5954377, 0.5426866, 1, 1, 1, 1, 1,
-0.04196434, 0.4219565, -0.3070514, 1, 1, 1, 1, 1,
-0.03897125, 0.7256353, 0.4328189, 1, 1, 1, 1, 1,
-0.03855402, -0.08555206, -3.381741, 1, 1, 1, 1, 1,
-0.03759952, -0.3912958, -3.956721, 1, 1, 1, 1, 1,
-0.03408539, 0.9823964, 0.103553, 1, 1, 1, 1, 1,
-0.03241521, 0.4066133, -1.43807, 0, 0, 1, 1, 1,
-0.02960343, 0.3461517, -0.1772052, 1, 0, 0, 1, 1,
-0.02508359, 0.8287885, 1.381433, 1, 0, 0, 1, 1,
-0.02308658, -0.7619501, -3.849878, 1, 0, 0, 1, 1,
-0.01989327, 0.6437845, -0.4245071, 1, 0, 0, 1, 1,
-0.01719969, -1.404489, -3.577254, 1, 0, 0, 1, 1,
-0.01653499, 2.105369, 0.3897377, 0, 0, 0, 1, 1,
-0.01532101, -0.9269676, -3.394169, 0, 0, 0, 1, 1,
-0.01521787, 0.542362, -0.003940286, 0, 0, 0, 1, 1,
-0.0151644, 1.965688, 0.6019371, 0, 0, 0, 1, 1,
-0.01094802, -2.250372, -2.980418, 0, 0, 0, 1, 1,
-0.008029683, -1.863116, -3.130365, 0, 0, 0, 1, 1,
-0.007306953, 0.8756539, 1.38877, 0, 0, 0, 1, 1,
-0.005788803, -0.6453322, -2.028153, 1, 1, 1, 1, 1,
-0.004292102, -0.7520578, -2.564844, 1, 1, 1, 1, 1,
-0.003374088, -2.638033, -3.490366, 1, 1, 1, 1, 1,
-0.002460355, 1.320421, 0.1390351, 1, 1, 1, 1, 1,
0.004473573, -0.2295631, 3.890844, 1, 1, 1, 1, 1,
0.007340255, -0.9202702, 1.490138, 1, 1, 1, 1, 1,
0.00770813, -0.1864609, 3.438747, 1, 1, 1, 1, 1,
0.01069144, 0.6950878, -1.299342, 1, 1, 1, 1, 1,
0.01544958, 0.854334, -1.856495, 1, 1, 1, 1, 1,
0.01551335, 0.2798359, 0.1786672, 1, 1, 1, 1, 1,
0.01553615, 2.213444, -0.2208749, 1, 1, 1, 1, 1,
0.03355618, 1.417227, -0.1644507, 1, 1, 1, 1, 1,
0.0339314, -0.1181546, 2.233614, 1, 1, 1, 1, 1,
0.03660291, 0.23177, -1.24562, 1, 1, 1, 1, 1,
0.03852489, 0.6978642, -0.9823256, 1, 1, 1, 1, 1,
0.04245878, -1.184774, 3.369377, 0, 0, 1, 1, 1,
0.04356911, -0.6124645, 3.660894, 1, 0, 0, 1, 1,
0.04380545, 0.7827328, 0.3921668, 1, 0, 0, 1, 1,
0.0446831, -0.7220785, 3.036814, 1, 0, 0, 1, 1,
0.04497846, 1.561406, 0.3615792, 1, 0, 0, 1, 1,
0.04656671, -0.36191, 5.576838, 1, 0, 0, 1, 1,
0.05094315, 1.301236, -0.04507028, 0, 0, 0, 1, 1,
0.05312604, -0.9911839, 3.258157, 0, 0, 0, 1, 1,
0.05324541, 2.232028, 0.7384984, 0, 0, 0, 1, 1,
0.05421437, 1.249547, -0.694348, 0, 0, 0, 1, 1,
0.05831768, -1.002214, 0.931959, 0, 0, 0, 1, 1,
0.06084631, 1.751095, 0.6025147, 0, 0, 0, 1, 1,
0.06088557, -2.868338, 1.299459, 0, 0, 0, 1, 1,
0.06174885, -0.1459059, 1.344703, 1, 1, 1, 1, 1,
0.06216784, -1.389926, 2.741473, 1, 1, 1, 1, 1,
0.06448758, 0.5892161, 2.212204, 1, 1, 1, 1, 1,
0.06614986, -0.9617208, 4.247378, 1, 1, 1, 1, 1,
0.06869363, 2.477305, 2.766194, 1, 1, 1, 1, 1,
0.07083444, 0.4794851, 0.8548549, 1, 1, 1, 1, 1,
0.07129551, -1.00085, 3.977401, 1, 1, 1, 1, 1,
0.07552496, 0.3762974, -0.09585825, 1, 1, 1, 1, 1,
0.07643814, -0.7893454, 3.196441, 1, 1, 1, 1, 1,
0.0798086, 1.015426, -2.112511, 1, 1, 1, 1, 1,
0.08005506, -0.0839461, 3.362711, 1, 1, 1, 1, 1,
0.08005831, 0.1766288, -0.2381094, 1, 1, 1, 1, 1,
0.08032936, -1.177154, 0.416443, 1, 1, 1, 1, 1,
0.08268826, -0.08778038, 0.8914038, 1, 1, 1, 1, 1,
0.08381023, 1.353395, -0.2486885, 1, 1, 1, 1, 1,
0.08548192, -0.2254244, 2.744162, 0, 0, 1, 1, 1,
0.08663061, -0.3698648, 2.124947, 1, 0, 0, 1, 1,
0.08807642, -0.641043, 3.532753, 1, 0, 0, 1, 1,
0.08854421, -0.5813789, 2.475056, 1, 0, 0, 1, 1,
0.08944285, -1.677466, 3.162189, 1, 0, 0, 1, 1,
0.09746931, 0.9046094, 0.1021137, 1, 0, 0, 1, 1,
0.09875643, -2.081065, 2.097324, 0, 0, 0, 1, 1,
0.09967924, 0.4743568, 0.9769925, 0, 0, 0, 1, 1,
0.1079418, 0.1003038, 0.5537865, 0, 0, 0, 1, 1,
0.1091073, -0.8435216, 2.705721, 0, 0, 0, 1, 1,
0.1093525, -0.0943198, 2.945279, 0, 0, 0, 1, 1,
0.1110324, 1.5079, -1.700897, 0, 0, 0, 1, 1,
0.1124864, 0.4571348, -0.9907048, 0, 0, 0, 1, 1,
0.1216019, 0.1390481, 3.04101, 1, 1, 1, 1, 1,
0.126007, 0.937888, -0.1810675, 1, 1, 1, 1, 1,
0.1374612, 0.552316, 0.06963028, 1, 1, 1, 1, 1,
0.1467903, 1.205227, -1.479223, 1, 1, 1, 1, 1,
0.1469063, -1.338182, 2.566855, 1, 1, 1, 1, 1,
0.1520592, -0.04585913, 1.487393, 1, 1, 1, 1, 1,
0.1541381, -1.426314, 4.51537, 1, 1, 1, 1, 1,
0.1554787, 2.285023, -0.9428349, 1, 1, 1, 1, 1,
0.155504, -1.172296, 4.539226, 1, 1, 1, 1, 1,
0.1564304, -0.3030791, 2.968306, 1, 1, 1, 1, 1,
0.1612559, 0.5281182, -1.422091, 1, 1, 1, 1, 1,
0.1628743, 1.084206, 0.5240423, 1, 1, 1, 1, 1,
0.1643046, -0.3781584, 1.29424, 1, 1, 1, 1, 1,
0.1648453, 1.083539, -0.1324065, 1, 1, 1, 1, 1,
0.1659498, -0.8581944, 1.678988, 1, 1, 1, 1, 1,
0.1707061, 0.6733895, -1.067617, 0, 0, 1, 1, 1,
0.1719198, -0.2742479, 2.123381, 1, 0, 0, 1, 1,
0.1729731, -1.20129, 2.245017, 1, 0, 0, 1, 1,
0.1754083, -1.027314, 2.852217, 1, 0, 0, 1, 1,
0.1790006, -0.78769, 3.656977, 1, 0, 0, 1, 1,
0.1808503, 0.3671144, -6.460919e-05, 1, 0, 0, 1, 1,
0.1830024, -1.40874, 1.760244, 0, 0, 0, 1, 1,
0.1844953, 0.05746715, 0.7292702, 0, 0, 0, 1, 1,
0.1899118, 0.6212497, 0.22043, 0, 0, 0, 1, 1,
0.1912579, -0.470986, 2.928285, 0, 0, 0, 1, 1,
0.1959371, -0.719105, 2.706405, 0, 0, 0, 1, 1,
0.1974973, 0.1197141, 2.063066, 0, 0, 0, 1, 1,
0.1978366, 0.7546298, 0.5725912, 0, 0, 0, 1, 1,
0.1993846, -1.233448, 1.218153, 1, 1, 1, 1, 1,
0.1996596, -0.9820282, 1.660444, 1, 1, 1, 1, 1,
0.2049906, 2.333252, 0.3845468, 1, 1, 1, 1, 1,
0.2082313, -1.469021, 4.34751, 1, 1, 1, 1, 1,
0.2093519, -1.939276, 2.847603, 1, 1, 1, 1, 1,
0.2114983, 0.3919338, 1.854125, 1, 1, 1, 1, 1,
0.2136268, 1.223388, 2.241325, 1, 1, 1, 1, 1,
0.2195494, 0.4044352, 0.8578039, 1, 1, 1, 1, 1,
0.2238951, 1.466534, 1.142754, 1, 1, 1, 1, 1,
0.2257611, 0.6711624, 0.5710706, 1, 1, 1, 1, 1,
0.2297526, -0.469817, 2.937901, 1, 1, 1, 1, 1,
0.2299311, 2.097174, -0.2161881, 1, 1, 1, 1, 1,
0.2299411, -1.225365, 3.276183, 1, 1, 1, 1, 1,
0.2303769, -0.4062156, 2.564913, 1, 1, 1, 1, 1,
0.2309414, -1.044526, 2.573614, 1, 1, 1, 1, 1,
0.2334773, -0.5784515, 1.061731, 0, 0, 1, 1, 1,
0.2357545, 0.450588, -0.8023608, 1, 0, 0, 1, 1,
0.2365067, 0.5739483, 1.137135, 1, 0, 0, 1, 1,
0.2469664, 0.2136072, 0.8746712, 1, 0, 0, 1, 1,
0.2479489, 0.09365002, 0.1808974, 1, 0, 0, 1, 1,
0.2485022, 1.116348, 1.30418, 1, 0, 0, 1, 1,
0.2515924, 0.9240118, 0.1906809, 0, 0, 0, 1, 1,
0.2520221, -0.1120213, 2.966731, 0, 0, 0, 1, 1,
0.2565691, -0.6910157, 3.360357, 0, 0, 0, 1, 1,
0.2571536, 0.1918592, 0.2830944, 0, 0, 0, 1, 1,
0.2597302, 0.5120013, -1.220002, 0, 0, 0, 1, 1,
0.2634201, -0.3647257, 2.736906, 0, 0, 0, 1, 1,
0.2681073, -0.2143928, 1.760485, 0, 0, 0, 1, 1,
0.2691272, -0.8374028, 2.373303, 1, 1, 1, 1, 1,
0.2709039, 0.9583383, 0.2515871, 1, 1, 1, 1, 1,
0.2714403, -1.107727, 1.238116, 1, 1, 1, 1, 1,
0.2739404, -0.8754785, 3.169077, 1, 1, 1, 1, 1,
0.275195, 0.7354248, 1.461484, 1, 1, 1, 1, 1,
0.2805968, -0.4302632, 3.667541, 1, 1, 1, 1, 1,
0.2809631, -0.901897, 2.822169, 1, 1, 1, 1, 1,
0.2846695, -0.516784, 3.328595, 1, 1, 1, 1, 1,
0.2855565, -0.5495609, 1.108276, 1, 1, 1, 1, 1,
0.2884721, -1.493349, 2.896041, 1, 1, 1, 1, 1,
0.2913684, 0.2229034, 0.7386938, 1, 1, 1, 1, 1,
0.2960875, -1.712845, 2.996575, 1, 1, 1, 1, 1,
0.2971911, 1.495704, 0.2919817, 1, 1, 1, 1, 1,
0.3003822, 0.1205451, 1.893449, 1, 1, 1, 1, 1,
0.3010317, -2.268884, 2.8409, 1, 1, 1, 1, 1,
0.30179, 1.204921, -0.1323155, 0, 0, 1, 1, 1,
0.3051669, -1.084725, 1.765974, 1, 0, 0, 1, 1,
0.3059856, -0.6048799, 2.021594, 1, 0, 0, 1, 1,
0.3076943, 0.6411824, -0.2590573, 1, 0, 0, 1, 1,
0.3104987, -0.1456532, 2.145438, 1, 0, 0, 1, 1,
0.3207216, -1.012076, 2.664279, 1, 0, 0, 1, 1,
0.3218935, -0.423123, 2.254881, 0, 0, 0, 1, 1,
0.3260866, 0.1983213, 3.179948, 0, 0, 0, 1, 1,
0.3355447, 0.3261952, 0.9003735, 0, 0, 0, 1, 1,
0.3379086, -0.1319258, 2.809425, 0, 0, 0, 1, 1,
0.3380674, 0.08891199, 1.983688, 0, 0, 0, 1, 1,
0.3382244, 0.8992672, 1.12258, 0, 0, 0, 1, 1,
0.3395503, -0.08799654, 0.4412402, 0, 0, 0, 1, 1,
0.3447742, -0.56884, 3.326366, 1, 1, 1, 1, 1,
0.3458188, -0.9783502, 2.904645, 1, 1, 1, 1, 1,
0.3497288, 3.154545, 0.3929124, 1, 1, 1, 1, 1,
0.3580754, -0.9721205, 2.230112, 1, 1, 1, 1, 1,
0.3587525, -0.1444162, 2.749381, 1, 1, 1, 1, 1,
0.3608192, -0.8555056, 0.8518484, 1, 1, 1, 1, 1,
0.3619893, 0.3705056, 1.23725, 1, 1, 1, 1, 1,
0.3628079, -0.09808002, 1.775383, 1, 1, 1, 1, 1,
0.3634188, 0.2153738, 0.8452863, 1, 1, 1, 1, 1,
0.3684577, 0.7339965, -0.3379021, 1, 1, 1, 1, 1,
0.3727475, 0.909494, 1.020381, 1, 1, 1, 1, 1,
0.3745471, 1.889782, 1.35184, 1, 1, 1, 1, 1,
0.3781896, 1.081819, 0.254006, 1, 1, 1, 1, 1,
0.3792862, 2.204723, 1.704453, 1, 1, 1, 1, 1,
0.3793685, 1.03307, 1.190337, 1, 1, 1, 1, 1,
0.3842739, -1.699682, 2.008806, 0, 0, 1, 1, 1,
0.3914375, -1.266353, 2.402472, 1, 0, 0, 1, 1,
0.393016, -0.9141573, 3.137281, 1, 0, 0, 1, 1,
0.3949774, 0.07143296, 1.43508, 1, 0, 0, 1, 1,
0.3975155, 0.1740714, 1.490142, 1, 0, 0, 1, 1,
0.3977385, -0.05993827, 0.8807217, 1, 0, 0, 1, 1,
0.3980966, -0.006055177, 1.946513, 0, 0, 0, 1, 1,
0.4002733, -1.572432, 3.333317, 0, 0, 0, 1, 1,
0.4013508, -0.2318097, 2.071239, 0, 0, 0, 1, 1,
0.4015867, -0.3367452, 3.013354, 0, 0, 0, 1, 1,
0.4016563, -0.2795992, 2.028577, 0, 0, 0, 1, 1,
0.4025289, 0.1829787, -0.03196051, 0, 0, 0, 1, 1,
0.4049192, -1.703155, 3.76007, 0, 0, 0, 1, 1,
0.4057823, -0.005416695, 2.497249, 1, 1, 1, 1, 1,
0.4084454, -2.105366, 3.180066, 1, 1, 1, 1, 1,
0.4104784, 1.554968, 0.1322921, 1, 1, 1, 1, 1,
0.4111276, 0.0219062, 1.399637, 1, 1, 1, 1, 1,
0.4114835, -0.9787156, 2.003665, 1, 1, 1, 1, 1,
0.4162893, -0.880082, 1.592149, 1, 1, 1, 1, 1,
0.4188779, 0.9841521, 0.9592785, 1, 1, 1, 1, 1,
0.4192289, -0.6638195, 2.191943, 1, 1, 1, 1, 1,
0.4230606, -0.5338651, 2.715353, 1, 1, 1, 1, 1,
0.4274503, 0.5331471, -0.3213803, 1, 1, 1, 1, 1,
0.4286157, 0.09637873, 2.119613, 1, 1, 1, 1, 1,
0.4295624, 0.440714, -0.1664658, 1, 1, 1, 1, 1,
0.43093, 1.043647, 0.1028177, 1, 1, 1, 1, 1,
0.4310295, 2.440225, 0.7377858, 1, 1, 1, 1, 1,
0.4347589, 0.01101801, 1.696083, 1, 1, 1, 1, 1,
0.4371464, -0.7318059, 2.227148, 0, 0, 1, 1, 1,
0.4399314, -1.022732, 2.442254, 1, 0, 0, 1, 1,
0.4420157, -0.4690467, 1.759293, 1, 0, 0, 1, 1,
0.4430341, 1.158674, -1.049984, 1, 0, 0, 1, 1,
0.4496451, 1.077497, 1.723581, 1, 0, 0, 1, 1,
0.4552617, -0.1616394, 3.071332, 1, 0, 0, 1, 1,
0.4561017, 0.1659551, -0.2711544, 0, 0, 0, 1, 1,
0.4585504, 0.2449386, 0.1128207, 0, 0, 0, 1, 1,
0.4585586, -0.4296111, 2.046502, 0, 0, 0, 1, 1,
0.4602601, -0.2220505, 2.344653, 0, 0, 0, 1, 1,
0.4724028, 0.1078057, 2.588715, 0, 0, 0, 1, 1,
0.4725524, -1.473494, 3.879332, 0, 0, 0, 1, 1,
0.4737605, -0.5218199, 3.673941, 0, 0, 0, 1, 1,
0.4750202, 2.048202, 0.3371623, 1, 1, 1, 1, 1,
0.4775815, -0.2849892, 4.45435, 1, 1, 1, 1, 1,
0.4844344, -0.5349159, 2.379719, 1, 1, 1, 1, 1,
0.4863688, 0.25802, 0.05484668, 1, 1, 1, 1, 1,
0.4888555, -1.760671, 4.310665, 1, 1, 1, 1, 1,
0.4942455, -1.737837, 3.158535, 1, 1, 1, 1, 1,
0.4953727, 0.7607692, 0.5688264, 1, 1, 1, 1, 1,
0.5080318, 1.344583, -0.1033669, 1, 1, 1, 1, 1,
0.5118423, -0.372094, 1.661138, 1, 1, 1, 1, 1,
0.5244188, -0.8017575, 2.716348, 1, 1, 1, 1, 1,
0.5246453, 1.654883, 0.5650398, 1, 1, 1, 1, 1,
0.5287448, 0.2127235, 1.367169, 1, 1, 1, 1, 1,
0.533501, 0.5395281, 0.9090466, 1, 1, 1, 1, 1,
0.5360273, 2.463214, 0.4375706, 1, 1, 1, 1, 1,
0.5361992, -1.300197, 2.354204, 1, 1, 1, 1, 1,
0.5425295, -0.148493, 2.74896, 0, 0, 1, 1, 1,
0.5431978, -1.305241, 3.071946, 1, 0, 0, 1, 1,
0.5448679, 0.04300905, 2.112308, 1, 0, 0, 1, 1,
0.5504889, 1.548787, -1.360008, 1, 0, 0, 1, 1,
0.5534104, -1.224427, 2.665608, 1, 0, 0, 1, 1,
0.561689, 0.8571709, 0.9112188, 1, 0, 0, 1, 1,
0.5648507, 0.4428069, 1.213016, 0, 0, 0, 1, 1,
0.564984, -0.9183869, 1.917646, 0, 0, 0, 1, 1,
0.5679214, -0.6836889, 0.8670636, 0, 0, 0, 1, 1,
0.5714512, -2.478505, 4.172361, 0, 0, 0, 1, 1,
0.5716235, -0.4821424, 2.144324, 0, 0, 0, 1, 1,
0.5730485, -0.479058, 1.606768, 0, 0, 0, 1, 1,
0.573816, -0.2084008, 0.3384908, 0, 0, 0, 1, 1,
0.5781858, 2.322925, 1.429411, 1, 1, 1, 1, 1,
0.5795991, 1.112509, 0.2987899, 1, 1, 1, 1, 1,
0.5845273, -1.040738, 2.569393, 1, 1, 1, 1, 1,
0.5865658, 0.8912311, 0.9178434, 1, 1, 1, 1, 1,
0.5866634, -1.565578, 4.024666, 1, 1, 1, 1, 1,
0.5891134, -0.1616148, 1.003037, 1, 1, 1, 1, 1,
0.5903012, 0.6283855, -1.279677, 1, 1, 1, 1, 1,
0.5939052, 0.9216258, 0.7084795, 1, 1, 1, 1, 1,
0.5949202, -0.1798261, -0.2890217, 1, 1, 1, 1, 1,
0.5966582, -0.8491709, 2.028995, 1, 1, 1, 1, 1,
0.6005712, -1.202818, 3.494541, 1, 1, 1, 1, 1,
0.6019441, 0.2291784, 1.278497, 1, 1, 1, 1, 1,
0.6026055, -2.041203, 3.010668, 1, 1, 1, 1, 1,
0.6035613, 0.1737441, 1.769804, 1, 1, 1, 1, 1,
0.6035755, 1.38313, -0.09036386, 1, 1, 1, 1, 1,
0.6094384, 0.9126889, 0.9529289, 0, 0, 1, 1, 1,
0.609727, 0.5383813, 2.8472, 1, 0, 0, 1, 1,
0.6113843, 1.062008, 1.929134, 1, 0, 0, 1, 1,
0.6145009, -0.7556955, 3.342453, 1, 0, 0, 1, 1,
0.6160604, 1.868945, 0.3350084, 1, 0, 0, 1, 1,
0.6162071, -0.3570221, 2.295414, 1, 0, 0, 1, 1,
0.6175283, 1.240906, -0.04917987, 0, 0, 0, 1, 1,
0.620096, 0.1251627, 1.719472, 0, 0, 0, 1, 1,
0.6210632, -1.429116, 3.136092, 0, 0, 0, 1, 1,
0.6227766, 0.6645344, 1.890568, 0, 0, 0, 1, 1,
0.6239487, -0.8526656, 2.479271, 0, 0, 0, 1, 1,
0.6249439, -1.18675, 2.910215, 0, 0, 0, 1, 1,
0.6272029, 2.185027, 1.43204, 0, 0, 0, 1, 1,
0.6349928, 0.1329061, 2.035098, 1, 1, 1, 1, 1,
0.64279, -0.4953115, 1.410327, 1, 1, 1, 1, 1,
0.6429387, 0.05010087, 2.164682, 1, 1, 1, 1, 1,
0.6444415, -0.3391754, 2.490973, 1, 1, 1, 1, 1,
0.6461661, -0.9080679, 2.998657, 1, 1, 1, 1, 1,
0.6500077, 0.6017307, 1.333613, 1, 1, 1, 1, 1,
0.6517336, 1.213264, 1.806481, 1, 1, 1, 1, 1,
0.6536309, 1.656056, 1.688406, 1, 1, 1, 1, 1,
0.6570042, -1.181246, 2.238821, 1, 1, 1, 1, 1,
0.6575715, 0.2403358, 1.394506, 1, 1, 1, 1, 1,
0.6635082, 0.4511724, 1.110867, 1, 1, 1, 1, 1,
0.6720097, 0.3077559, 1.354899, 1, 1, 1, 1, 1,
0.6729363, 0.4871505, 0.8023551, 1, 1, 1, 1, 1,
0.6758261, 1.577282, 0.3606004, 1, 1, 1, 1, 1,
0.6759947, -1.207847, 2.025348, 1, 1, 1, 1, 1,
0.6761879, -0.2776579, 1.983, 0, 0, 1, 1, 1,
0.6781611, 0.2189039, 2.085493, 1, 0, 0, 1, 1,
0.6785842, -0.7153742, 2.893378, 1, 0, 0, 1, 1,
0.6856906, -0.05251999, 2.372619, 1, 0, 0, 1, 1,
0.6866063, -0.6789899, 3.567996, 1, 0, 0, 1, 1,
0.6874068, 0.4900065, 2.351738, 1, 0, 0, 1, 1,
0.6949356, 0.4569509, 2.020744, 0, 0, 0, 1, 1,
0.6961332, -0.1617564, 0.7869687, 0, 0, 0, 1, 1,
0.7103309, -0.4255854, 2.019031, 0, 0, 0, 1, 1,
0.71259, -0.5377263, 2.274451, 0, 0, 0, 1, 1,
0.7137883, 1.093391, 0.6502434, 0, 0, 0, 1, 1,
0.7159357, -0.09783549, 1.879594, 0, 0, 0, 1, 1,
0.7194363, -0.1393223, 1.614562, 0, 0, 0, 1, 1,
0.7257345, 1.192877, -0.585803, 1, 1, 1, 1, 1,
0.726146, -0.3524727, 2.556465, 1, 1, 1, 1, 1,
0.7378109, -0.6459764, 1.890599, 1, 1, 1, 1, 1,
0.7406449, 1.020822, 1.053533, 1, 1, 1, 1, 1,
0.7506245, 0.6529926, 0.7232393, 1, 1, 1, 1, 1,
0.7556416, 1.220806, -0.9947384, 1, 1, 1, 1, 1,
0.7627585, -1.500801, 5.423601, 1, 1, 1, 1, 1,
0.7641597, 0.72498, 3.255658, 1, 1, 1, 1, 1,
0.7666028, -0.7971287, 1.101259, 1, 1, 1, 1, 1,
0.7689098, 0.5099551, 1.915578, 1, 1, 1, 1, 1,
0.7690693, 1.048232, 2.302767, 1, 1, 1, 1, 1,
0.7726937, -1.630195, 2.80167, 1, 1, 1, 1, 1,
0.7746747, -0.4346517, 1.896418, 1, 1, 1, 1, 1,
0.7760895, -1.153444, 3.102121, 1, 1, 1, 1, 1,
0.782639, 0.5766743, 1.420199, 1, 1, 1, 1, 1,
0.7839085, -0.001747186, 1.982243, 0, 0, 1, 1, 1,
0.7865602, -0.9006948, 0.8466215, 1, 0, 0, 1, 1,
0.7899643, -0.03174858, 1.853781, 1, 0, 0, 1, 1,
0.7918169, -1.880763, 2.351993, 1, 0, 0, 1, 1,
0.7928826, 0.1470976, 1.5933, 1, 0, 0, 1, 1,
0.8017423, -1.24808, 3.350775, 1, 0, 0, 1, 1,
0.8023607, -0.104225, 0.6488743, 0, 0, 0, 1, 1,
0.8069886, -0.2645027, 1.400832, 0, 0, 0, 1, 1,
0.8115231, -0.3978434, 0.7190286, 0, 0, 0, 1, 1,
0.8143285, 0.6865733, -0.2449489, 0, 0, 0, 1, 1,
0.8224868, -1.230297, 1.65376, 0, 0, 0, 1, 1,
0.8227732, -0.7534925, 1.774769, 0, 0, 0, 1, 1,
0.8227897, -0.4976223, 1.046339, 0, 0, 0, 1, 1,
0.8251565, 0.7904301, 1.54801, 1, 1, 1, 1, 1,
0.8424091, -0.07150298, 3.779873, 1, 1, 1, 1, 1,
0.8439819, 0.4629828, 0.6017968, 1, 1, 1, 1, 1,
0.8511763, -0.1468703, 1.92099, 1, 1, 1, 1, 1,
0.8564621, 1.854915, 0.2658719, 1, 1, 1, 1, 1,
0.8608786, -0.7237266, 3.407499, 1, 1, 1, 1, 1,
0.8637064, 0.619527, -0.1278902, 1, 1, 1, 1, 1,
0.8659005, -0.6310066, 2.617996, 1, 1, 1, 1, 1,
0.8665031, -0.218511, 2.457221, 1, 1, 1, 1, 1,
0.8688626, -1.215176, 1.547311, 1, 1, 1, 1, 1,
0.8697239, 0.1752435, -0.1559513, 1, 1, 1, 1, 1,
0.8709443, 0.7691852, -0.7781767, 1, 1, 1, 1, 1,
0.8837711, -1.018235, 1.832446, 1, 1, 1, 1, 1,
0.8918498, -1.998143, 4.048952, 1, 1, 1, 1, 1,
0.9003381, -0.4170383, 2.830408, 1, 1, 1, 1, 1,
0.9006832, -0.9476293, 3.85082, 0, 0, 1, 1, 1,
0.9089284, -0.2154776, 1.702502, 1, 0, 0, 1, 1,
0.9100552, 0.9497202, -0.3632469, 1, 0, 0, 1, 1,
0.9127858, 0.264837, 1.583148, 1, 0, 0, 1, 1,
0.9167281, 0.1486252, 1.912541, 1, 0, 0, 1, 1,
0.9213759, -0.2842349, 0.903318, 1, 0, 0, 1, 1,
0.9224491, 0.321004, 2.743697, 0, 0, 0, 1, 1,
0.9243504, 1.885116, 1.289225, 0, 0, 0, 1, 1,
0.9303214, 0.458912, 0.8713319, 0, 0, 0, 1, 1,
0.9372995, 0.9110356, 2.444514, 0, 0, 0, 1, 1,
0.9376964, -0.7395696, 2.520637, 0, 0, 0, 1, 1,
0.9404101, -2.105822, 2.359323, 0, 0, 0, 1, 1,
0.9409477, 0.257994, 3.216661, 0, 0, 0, 1, 1,
0.9420543, -0.4133358, 2.259787, 1, 1, 1, 1, 1,
0.9482859, 0.34646, 0.3818855, 1, 1, 1, 1, 1,
0.9506342, 0.7046384, 0.9816906, 1, 1, 1, 1, 1,
0.9511122, -0.1262226, 1.304962, 1, 1, 1, 1, 1,
0.9525151, 0.4846934, 1.93357, 1, 1, 1, 1, 1,
0.9557288, 0.2112507, -0.06101542, 1, 1, 1, 1, 1,
0.963128, -2.005991, 1.551862, 1, 1, 1, 1, 1,
0.9652034, -1.053688, 3.964938, 1, 1, 1, 1, 1,
0.9763777, 1.16743, 0.3165542, 1, 1, 1, 1, 1,
0.9784465, -0.4797123, 2.846423, 1, 1, 1, 1, 1,
0.9795222, 1.418155, 0.9133142, 1, 1, 1, 1, 1,
0.9806351, 1.34271, 0.6376072, 1, 1, 1, 1, 1,
0.9839211, -0.4919669, 3.986223, 1, 1, 1, 1, 1,
0.9846506, -0.721207, 2.427541, 1, 1, 1, 1, 1,
0.9856876, -1.4843, 2.080785, 1, 1, 1, 1, 1,
0.9891325, 1.957193, 0.7868274, 0, 0, 1, 1, 1,
0.9948537, 0.0497557, 1.150394, 1, 0, 0, 1, 1,
0.9951544, 0.6336853, 0.5113379, 1, 0, 0, 1, 1,
0.9972749, -0.4343724, 1.111349, 1, 0, 0, 1, 1,
0.9972755, -1.318685, 5.276558, 1, 0, 0, 1, 1,
1.001227, 0.621462, 0.5442932, 1, 0, 0, 1, 1,
1.006336, -0.4379138, 3.536267, 0, 0, 0, 1, 1,
1.011718, -0.4612656, 1.496721, 0, 0, 0, 1, 1,
1.020051, -1.131159, 1.928283, 0, 0, 0, 1, 1,
1.024336, 1.329672, 1.447076, 0, 0, 0, 1, 1,
1.030207, 0.1782193, 2.287717, 0, 0, 0, 1, 1,
1.030426, -0.4615267, 3.000824, 0, 0, 0, 1, 1,
1.035238, -0.2663399, 2.424309, 0, 0, 0, 1, 1,
1.035744, -0.9489079, 3.407905, 1, 1, 1, 1, 1,
1.040312, 0.3046688, 0.4251678, 1, 1, 1, 1, 1,
1.041953, -1.092085, 4.649695, 1, 1, 1, 1, 1,
1.044368, 1.063103, 0.4639177, 1, 1, 1, 1, 1,
1.05186, 1.068322, 0.393437, 1, 1, 1, 1, 1,
1.052605, -0.3967973, 2.314023, 1, 1, 1, 1, 1,
1.067356, -0.01612473, 2.508136, 1, 1, 1, 1, 1,
1.069229, 1.405271, 0.2252445, 1, 1, 1, 1, 1,
1.070046, 0.4960645, 2.924479, 1, 1, 1, 1, 1,
1.080538, 0.01685464, 2.717096, 1, 1, 1, 1, 1,
1.084734, 1.707911, 0.6899648, 1, 1, 1, 1, 1,
1.090731, 0.4959401, 0.7347269, 1, 1, 1, 1, 1,
1.092869, -1.415434, 3.88222, 1, 1, 1, 1, 1,
1.100038, 0.1251427, 0.9857598, 1, 1, 1, 1, 1,
1.105123, 1.169322, 2.18303, 1, 1, 1, 1, 1,
1.105131, -0.262198, 2.406415, 0, 0, 1, 1, 1,
1.107409, 1.085844, 1.02488, 1, 0, 0, 1, 1,
1.119241, 0.1210142, 3.088821, 1, 0, 0, 1, 1,
1.119551, -1.481056, 1.942608, 1, 0, 0, 1, 1,
1.126805, -1.164106, 2.4369, 1, 0, 0, 1, 1,
1.128628, -0.1085055, 1.620384, 1, 0, 0, 1, 1,
1.135544, 0.3349513, -0.8412866, 0, 0, 0, 1, 1,
1.136694, -0.7286428, 2.467878, 0, 0, 0, 1, 1,
1.136985, 0.5026494, 0.5782071, 0, 0, 0, 1, 1,
1.137246, -1.288231, 2.945575, 0, 0, 0, 1, 1,
1.145656, -0.859816, 1.658634, 0, 0, 0, 1, 1,
1.147164, 0.07071156, 3.084065, 0, 0, 0, 1, 1,
1.148933, -0.7322498, 1.894226, 0, 0, 0, 1, 1,
1.150797, -0.9859244, 2.422526, 1, 1, 1, 1, 1,
1.154696, -1.077531, 2.939118, 1, 1, 1, 1, 1,
1.161707, -0.589082, 1.110435, 1, 1, 1, 1, 1,
1.163396, -0.2569223, 1.034334, 1, 1, 1, 1, 1,
1.163985, 0.4595736, 1.252261, 1, 1, 1, 1, 1,
1.165265, 0.3225163, 0.0126484, 1, 1, 1, 1, 1,
1.166089, -1.241168, 2.486767, 1, 1, 1, 1, 1,
1.169136, 0.6014968, 0.8150651, 1, 1, 1, 1, 1,
1.172552, 0.7131679, 0.3713809, 1, 1, 1, 1, 1,
1.173767, 1.310208, -1.185063, 1, 1, 1, 1, 1,
1.180451, -0.1647846, 2.046913, 1, 1, 1, 1, 1,
1.184091, -0.9045239, 2.535391, 1, 1, 1, 1, 1,
1.192889, 0.182516, 2.935123, 1, 1, 1, 1, 1,
1.198648, 0.7229069, -1.522381, 1, 1, 1, 1, 1,
1.199326, -0.7135635, 1.970806, 1, 1, 1, 1, 1,
1.200464, -1.53757, 2.414593, 0, 0, 1, 1, 1,
1.200687, -0.08565971, -0.3111264, 1, 0, 0, 1, 1,
1.201279, 0.4023491, 1.002246, 1, 0, 0, 1, 1,
1.203513, 1.098954, 1.147751, 1, 0, 0, 1, 1,
1.205649, -0.8045704, 1.67368, 1, 0, 0, 1, 1,
1.205778, -1.737211, 1.117426, 1, 0, 0, 1, 1,
1.206945, 0.7691956, 0.8319069, 0, 0, 0, 1, 1,
1.217494, 0.1572544, 2.352826, 0, 0, 0, 1, 1,
1.218297, 1.013712, -1.033047, 0, 0, 0, 1, 1,
1.230236, -0.06900635, 2.252039, 0, 0, 0, 1, 1,
1.234396, -0.259229, 2.886927, 0, 0, 0, 1, 1,
1.256286, -1.123434, 1.11986, 0, 0, 0, 1, 1,
1.258452, -0.2719363, 2.51282, 0, 0, 0, 1, 1,
1.268053, 0.7571536, 1.736145, 1, 1, 1, 1, 1,
1.279559, 0.1437235, 1.266589, 1, 1, 1, 1, 1,
1.280468, -0.01241191, 2.15983, 1, 1, 1, 1, 1,
1.287295, 0.1252663, 0.8683937, 1, 1, 1, 1, 1,
1.290312, -0.8894519, 2.446618, 1, 1, 1, 1, 1,
1.291085, 1.283495, 0.4711314, 1, 1, 1, 1, 1,
1.296385, 0.4911321, 1.903381, 1, 1, 1, 1, 1,
1.29925, -1.517714, 2.227562, 1, 1, 1, 1, 1,
1.310462, -1.123018, 3.894306, 1, 1, 1, 1, 1,
1.318499, 0.4726118, 1.682286, 1, 1, 1, 1, 1,
1.320632, 0.8348572, 0.2577156, 1, 1, 1, 1, 1,
1.337014, -1.378291, 3.400472, 1, 1, 1, 1, 1,
1.349316, 0.1650518, 1.131566, 1, 1, 1, 1, 1,
1.361133, -0.5971342, 1.958585, 1, 1, 1, 1, 1,
1.361955, -1.289994, 2.401528, 1, 1, 1, 1, 1,
1.363802, -1.065268, 2.188755, 0, 0, 1, 1, 1,
1.364892, 1.059035, -0.3048856, 1, 0, 0, 1, 1,
1.365679, 1.137929, 1.186912, 1, 0, 0, 1, 1,
1.366363, -2.548487, 1.680288, 1, 0, 0, 1, 1,
1.370088, -0.2948484, 1.512928, 1, 0, 0, 1, 1,
1.388267, 0.1149134, 0.3535574, 1, 0, 0, 1, 1,
1.399992, -0.1267781, 0.8425157, 0, 0, 0, 1, 1,
1.401959, -2.984179, 2.973505, 0, 0, 0, 1, 1,
1.408243, 0.5678934, 1.272858, 0, 0, 0, 1, 1,
1.408846, 1.7254, 1.387381, 0, 0, 0, 1, 1,
1.411908, 0.1344608, 1.827197, 0, 0, 0, 1, 1,
1.419031, -1.066338, -0.5467305, 0, 0, 0, 1, 1,
1.4293, -1.314833, 4.14284, 0, 0, 0, 1, 1,
1.44114, -0.3416206, 1.061416, 1, 1, 1, 1, 1,
1.451641, -0.3667589, 2.61412, 1, 1, 1, 1, 1,
1.458629, 0.8385222, 1.63364, 1, 1, 1, 1, 1,
1.471457, -1.042057, 2.405442, 1, 1, 1, 1, 1,
1.478688, 0.6429514, 1.206583, 1, 1, 1, 1, 1,
1.482903, -0.5957687, 0.8235167, 1, 1, 1, 1, 1,
1.492996, -1.641996, 1.649817, 1, 1, 1, 1, 1,
1.525826, -0.682546, 1.036229, 1, 1, 1, 1, 1,
1.528782, -0.07108033, -0.4728221, 1, 1, 1, 1, 1,
1.536271, -0.1008346, 3.077222, 1, 1, 1, 1, 1,
1.543782, 1.473741, 1.244469, 1, 1, 1, 1, 1,
1.545483, 2.296266, 0.5526963, 1, 1, 1, 1, 1,
1.549604, 0.3571022, 0.6951218, 1, 1, 1, 1, 1,
1.554162, 0.3948543, 1.856948, 1, 1, 1, 1, 1,
1.558902, -0.7002392, 4.180677, 1, 1, 1, 1, 1,
1.559167, 0.7186766, 1.662044, 0, 0, 1, 1, 1,
1.569853, -0.3040382, 1.914927, 1, 0, 0, 1, 1,
1.596679, -0.02299016, 0.6770705, 1, 0, 0, 1, 1,
1.600614, -0.8176258, 2.16042, 1, 0, 0, 1, 1,
1.61872, -0.8709857, 2.16493, 1, 0, 0, 1, 1,
1.626832, 0.7434542, 0.4770005, 1, 0, 0, 1, 1,
1.635543, 0.7560616, 1.438114, 0, 0, 0, 1, 1,
1.646769, 1.26529, 1.521269, 0, 0, 0, 1, 1,
1.658104, -1.478302, 3.45532, 0, 0, 0, 1, 1,
1.66468, 0.9012811, 1.86445, 0, 0, 0, 1, 1,
1.675613, 1.762032, -0.01806556, 0, 0, 0, 1, 1,
1.717788, 1.398797, -1.324562, 0, 0, 0, 1, 1,
1.738662, 0.1488837, 2.178637, 0, 0, 0, 1, 1,
1.77126, -0.1799311, 1.794526, 1, 1, 1, 1, 1,
1.819365, -1.380878, 3.691787, 1, 1, 1, 1, 1,
1.853901, 0.5771928, 0.2392774, 1, 1, 1, 1, 1,
1.857486, 0.4897076, 1.095707, 1, 1, 1, 1, 1,
1.861626, 0.0885397, 1.993168, 1, 1, 1, 1, 1,
1.865678, -0.6416434, 2.485854, 1, 1, 1, 1, 1,
1.984277, -0.8995094, 1.374401, 1, 1, 1, 1, 1,
1.997847, -0.6967681, 3.09033, 1, 1, 1, 1, 1,
1.998883, 0.2643687, 1.528278, 1, 1, 1, 1, 1,
2.009072, -1.249782, 1.208542, 1, 1, 1, 1, 1,
2.091518, -0.5765626, 0.9608477, 1, 1, 1, 1, 1,
2.098081, 1.908128, 1.121644, 1, 1, 1, 1, 1,
2.098166, -1.195318, 2.988538, 1, 1, 1, 1, 1,
2.120992, -0.09108053, 1.395546, 1, 1, 1, 1, 1,
2.12602, 1.065602, 2.521343, 1, 1, 1, 1, 1,
2.126477, 0.0323306, 1.521704, 0, 0, 1, 1, 1,
2.138249, 0.7372467, 1.80998, 1, 0, 0, 1, 1,
2.142801, -0.9636069, 0.4693916, 1, 0, 0, 1, 1,
2.149575, -1.979786, 2.185135, 1, 0, 0, 1, 1,
2.23331, -0.2543511, 3.169138, 1, 0, 0, 1, 1,
2.235788, -2.282597, 3.469764, 1, 0, 0, 1, 1,
2.263094, -1.195281, 2.395676, 0, 0, 0, 1, 1,
2.307754, -0.5312455, 0.9444579, 0, 0, 0, 1, 1,
2.3294, 1.950732, 1.831722, 0, 0, 0, 1, 1,
2.330403, -1.840409, 1.575085, 0, 0, 0, 1, 1,
2.347124, 0.09020654, 2.470273, 0, 0, 0, 1, 1,
2.378596, 1.867501, -0.5961218, 0, 0, 0, 1, 1,
2.384484, -0.3631938, 1.736081, 0, 0, 0, 1, 1,
2.396689, -0.7820637, 3.029006, 1, 1, 1, 1, 1,
2.42944, 1.069638, 1.279103, 1, 1, 1, 1, 1,
2.464862, -0.524564, 2.097896, 1, 1, 1, 1, 1,
2.672584, -0.2880852, 2.262788, 1, 1, 1, 1, 1,
2.732041, -0.6962892, 1.296994, 1, 1, 1, 1, 1,
2.741218, 1.320925, -0.09871268, 1, 1, 1, 1, 1,
3.13353, 0.5602049, 0.7898645, 1, 1, 1, 1, 1
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
var radius = 10.2285;
var distance = 35.92715;
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
mvMatrix.translate( 0.192018, -0.8639107, 0.008024216 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.92715);
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
