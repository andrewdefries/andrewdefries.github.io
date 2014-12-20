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
-3.27071, 1.568243, -1.80495, 1, 0, 0, 1,
-3.149719, 0.9824594, -0.09946723, 1, 0.007843138, 0, 1,
-3.147225, -0.03074041, -2.461456, 1, 0.01176471, 0, 1,
-2.930994, 0.2781844, -1.120239, 1, 0.01960784, 0, 1,
-2.813208, -0.5670041, -1.294498, 1, 0.02352941, 0, 1,
-2.809466, 0.2005654, -3.034873, 1, 0.03137255, 0, 1,
-2.783471, 1.517501, -1.056925, 1, 0.03529412, 0, 1,
-2.774574, 0.7220131, 1.349766, 1, 0.04313726, 0, 1,
-2.668701, 0.3354345, -1.516354, 1, 0.04705882, 0, 1,
-2.597511, -0.9733316, -0.7088124, 1, 0.05490196, 0, 1,
-2.537307, -1.552809, -3.714517, 1, 0.05882353, 0, 1,
-2.534443, 0.5799173, -2.660924, 1, 0.06666667, 0, 1,
-2.515394, -0.9052214, -1.973293, 1, 0.07058824, 0, 1,
-2.356153, -0.04030775, -1.917217, 1, 0.07843138, 0, 1,
-2.270576, 0.1207018, -1.365976, 1, 0.08235294, 0, 1,
-2.249354, -0.3790286, -1.472769, 1, 0.09019608, 0, 1,
-2.241706, -1.29301, -1.5433, 1, 0.09411765, 0, 1,
-2.22924, -0.7405794, -0.9108363, 1, 0.1019608, 0, 1,
-2.228864, 1.069179, -0.8743806, 1, 0.1098039, 0, 1,
-2.194499, 1.367076, -0.9279796, 1, 0.1137255, 0, 1,
-2.188128, 1.86126, -2.031963, 1, 0.1215686, 0, 1,
-2.173462, -0.6368877, -3.289096, 1, 0.1254902, 0, 1,
-2.105611, -0.4833294, -3.256578, 1, 0.1333333, 0, 1,
-2.103556, 0.2511825, -1.831328, 1, 0.1372549, 0, 1,
-2.049746, -0.9681824, -1.2815, 1, 0.145098, 0, 1,
-2.043165, -1.931468, -1.710346, 1, 0.1490196, 0, 1,
-2.04274, -1.336153, -1.495451, 1, 0.1568628, 0, 1,
-2.031687, 1.538054, -2.516673, 1, 0.1607843, 0, 1,
-2.004219, -0.1430655, -2.913528, 1, 0.1686275, 0, 1,
-1.971192, 0.7605577, 0.9781089, 1, 0.172549, 0, 1,
-1.954282, -0.1040633, -1.673737, 1, 0.1803922, 0, 1,
-1.889829, 0.4524272, -0.5896292, 1, 0.1843137, 0, 1,
-1.862548, 2.257914, -1.651299, 1, 0.1921569, 0, 1,
-1.855186, 1.10794, -1.351712, 1, 0.1960784, 0, 1,
-1.847403, -0.389901, -0.2379297, 1, 0.2039216, 0, 1,
-1.796494, -0.4446183, -2.264959, 1, 0.2117647, 0, 1,
-1.792822, -0.1965425, -2.230265, 1, 0.2156863, 0, 1,
-1.773946, 0.44743, -0.6875638, 1, 0.2235294, 0, 1,
-1.764797, -0.7665413, -2.407119, 1, 0.227451, 0, 1,
-1.745406, -1.223248, -3.037682, 1, 0.2352941, 0, 1,
-1.738377, -0.4862981, -2.421737, 1, 0.2392157, 0, 1,
-1.735283, -0.113661, -2.236543, 1, 0.2470588, 0, 1,
-1.735088, -0.7827898, -1.843237, 1, 0.2509804, 0, 1,
-1.73219, -1.39606, -2.212455, 1, 0.2588235, 0, 1,
-1.72741, -0.3771605, -2.358374, 1, 0.2627451, 0, 1,
-1.711735, -0.7295638, -1.827703, 1, 0.2705882, 0, 1,
-1.710901, -0.8461806, -2.23391, 1, 0.2745098, 0, 1,
-1.682854, 0.1593032, -2.192259, 1, 0.282353, 0, 1,
-1.674219, -0.005559524, -2.511998, 1, 0.2862745, 0, 1,
-1.668773, 0.6633435, -2.938157, 1, 0.2941177, 0, 1,
-1.623068, 0.7858802, -0.2742405, 1, 0.3019608, 0, 1,
-1.617507, 0.9317812, -0.5863452, 1, 0.3058824, 0, 1,
-1.615952, -2.326694, -2.356618, 1, 0.3137255, 0, 1,
-1.610572, -0.1430209, -2.774373, 1, 0.3176471, 0, 1,
-1.600165, 0.4978761, -1.833097, 1, 0.3254902, 0, 1,
-1.59532, -0.82254, -3.169102, 1, 0.3294118, 0, 1,
-1.58921, -0.8631765, -0.3752686, 1, 0.3372549, 0, 1,
-1.586849, -0.6765469, -1.359619, 1, 0.3411765, 0, 1,
-1.573621, -0.9015883, -2.397032, 1, 0.3490196, 0, 1,
-1.567148, 0.8162051, -0.8882347, 1, 0.3529412, 0, 1,
-1.566649, -1.639881, -2.455177, 1, 0.3607843, 0, 1,
-1.565489, -0.1153343, -2.261247, 1, 0.3647059, 0, 1,
-1.563358, -0.9499933, -0.9229587, 1, 0.372549, 0, 1,
-1.547684, -0.7822256, -0.8937817, 1, 0.3764706, 0, 1,
-1.546412, -1.748387, -1.002884, 1, 0.3843137, 0, 1,
-1.534261, -1.340546, -3.051608, 1, 0.3882353, 0, 1,
-1.532192, -0.4437014, -2.821748, 1, 0.3960784, 0, 1,
-1.524608, 0.3820391, -1.45929, 1, 0.4039216, 0, 1,
-1.518009, 1.407769, 0.01905962, 1, 0.4078431, 0, 1,
-1.517704, -1.111781, -2.406962, 1, 0.4156863, 0, 1,
-1.500407, 0.3530768, -1.701667, 1, 0.4196078, 0, 1,
-1.477512, 0.9379746, -1.951654, 1, 0.427451, 0, 1,
-1.4771, 2.082997, 0.3844756, 1, 0.4313726, 0, 1,
-1.468535, 0.5914278, 0.5851959, 1, 0.4392157, 0, 1,
-1.468415, -0.2206773, -1.775328, 1, 0.4431373, 0, 1,
-1.4672, 0.5150014, -0.9097795, 1, 0.4509804, 0, 1,
-1.461457, -0.6923378, -3.144719, 1, 0.454902, 0, 1,
-1.455109, -0.7339907, -2.071081, 1, 0.4627451, 0, 1,
-1.449156, -0.1266931, -2.17844, 1, 0.4666667, 0, 1,
-1.446131, -0.3104933, -1.067786, 1, 0.4745098, 0, 1,
-1.441007, -0.07980722, -1.044797, 1, 0.4784314, 0, 1,
-1.437647, 0.1179402, -1.341781, 1, 0.4862745, 0, 1,
-1.428513, 0.7938906, -1.420873, 1, 0.4901961, 0, 1,
-1.425856, 0.2689886, -0.6477531, 1, 0.4980392, 0, 1,
-1.420655, -0.08131345, -2.766981, 1, 0.5058824, 0, 1,
-1.420448, -0.2491025, -1.75014, 1, 0.509804, 0, 1,
-1.415349, -1.72414, 0.104465, 1, 0.5176471, 0, 1,
-1.409269, -0.5781579, 0.1932691, 1, 0.5215687, 0, 1,
-1.404919, 0.6167406, -0.6369755, 1, 0.5294118, 0, 1,
-1.392453, 0.5586708, -1.301141, 1, 0.5333334, 0, 1,
-1.385694, 1.337738, -0.9858413, 1, 0.5411765, 0, 1,
-1.384922, -0.2671975, -2.55854, 1, 0.5450981, 0, 1,
-1.382693, -0.07409973, -0.7288492, 1, 0.5529412, 0, 1,
-1.369804, 0.1918771, -1.023396, 1, 0.5568628, 0, 1,
-1.366633, -2.471668, -3.162134, 1, 0.5647059, 0, 1,
-1.35704, -0.4677389, -0.9321902, 1, 0.5686275, 0, 1,
-1.343841, 0.3887881, -2.964996, 1, 0.5764706, 0, 1,
-1.325507, 0.1879533, -1.844367, 1, 0.5803922, 0, 1,
-1.323195, 0.5564845, -2.05168, 1, 0.5882353, 0, 1,
-1.314647, -0.8811571, -1.601747, 1, 0.5921569, 0, 1,
-1.313408, -1.272324, -5.690516, 1, 0.6, 0, 1,
-1.307043, 1.165546, 0.4370301, 1, 0.6078432, 0, 1,
-1.307036, -0.1668456, -1.057914, 1, 0.6117647, 0, 1,
-1.304196, -0.6650161, -2.283749, 1, 0.6196079, 0, 1,
-1.302652, 0.2515648, -1.787995, 1, 0.6235294, 0, 1,
-1.300587, 0.1890386, 0.4997921, 1, 0.6313726, 0, 1,
-1.296968, -0.06879121, -3.431292, 1, 0.6352941, 0, 1,
-1.291894, 1.295294, -1.145318, 1, 0.6431373, 0, 1,
-1.287178, 0.8825039, 0.3236096, 1, 0.6470588, 0, 1,
-1.283172, -0.4485812, -2.14327, 1, 0.654902, 0, 1,
-1.282359, -1.265013, -1.175803, 1, 0.6588235, 0, 1,
-1.272916, -0.04990971, -1.012931, 1, 0.6666667, 0, 1,
-1.267731, -1.529854, -2.500212, 1, 0.6705883, 0, 1,
-1.264731, -0.004175284, -1.464159, 1, 0.6784314, 0, 1,
-1.26149, -0.8082487, -2.78614, 1, 0.682353, 0, 1,
-1.253376, -0.02668933, -1.28134, 1, 0.6901961, 0, 1,
-1.24846, 1.020916, -0.7579784, 1, 0.6941177, 0, 1,
-1.241802, 0.8767222, -0.4323243, 1, 0.7019608, 0, 1,
-1.241403, 0.9415035, -0.8768343, 1, 0.7098039, 0, 1,
-1.233599, -0.6045086, -0.4691049, 1, 0.7137255, 0, 1,
-1.232617, -0.1465994, 0.05848347, 1, 0.7215686, 0, 1,
-1.220441, -0.5684079, -2.081625, 1, 0.7254902, 0, 1,
-1.214826, -0.2335935, -1.975836, 1, 0.7333333, 0, 1,
-1.200189, 0.2362171, -2.65033, 1, 0.7372549, 0, 1,
-1.198594, -0.08771353, -2.10771, 1, 0.7450981, 0, 1,
-1.197812, -0.5262874, -2.186905, 1, 0.7490196, 0, 1,
-1.19096, -1.130028, -2.673941, 1, 0.7568628, 0, 1,
-1.177176, -0.3923374, -5.016809, 1, 0.7607843, 0, 1,
-1.160784, -1.189505, -2.281388, 1, 0.7686275, 0, 1,
-1.156654, -0.7855447, -1.879023, 1, 0.772549, 0, 1,
-1.1564, -1.292711, -1.912214, 1, 0.7803922, 0, 1,
-1.151407, 0.2972991, -2.10658, 1, 0.7843137, 0, 1,
-1.147019, 0.8005766, -1.841783, 1, 0.7921569, 0, 1,
-1.146441, 1.682314, -0.8450911, 1, 0.7960784, 0, 1,
-1.129238, 0.9833688, 0.3060682, 1, 0.8039216, 0, 1,
-1.126965, -1.846191, -3.119363, 1, 0.8117647, 0, 1,
-1.121073, -1.302443, -1.876528, 1, 0.8156863, 0, 1,
-1.120002, 0.229503, -2.67466, 1, 0.8235294, 0, 1,
-1.111727, -1.037483, -1.98684, 1, 0.827451, 0, 1,
-1.111219, -1.689635, -2.994507, 1, 0.8352941, 0, 1,
-1.098006, -0.912406, -1.8906, 1, 0.8392157, 0, 1,
-1.096151, -0.6735668, -2.131758, 1, 0.8470588, 0, 1,
-1.0895, -1.256885, -1.832311, 1, 0.8509804, 0, 1,
-1.084283, -0.3547103, -4.121862, 1, 0.8588235, 0, 1,
-1.07525, 0.2865844, -1.843428, 1, 0.8627451, 0, 1,
-1.070745, -0.3170011, -1.187384, 1, 0.8705882, 0, 1,
-1.053903, -0.6877029, -1.924036, 1, 0.8745098, 0, 1,
-1.047812, 1.292329, -0.06733213, 1, 0.8823529, 0, 1,
-1.040362, 0.1893236, -1.758186, 1, 0.8862745, 0, 1,
-1.039818, 1.952209, 0.06175885, 1, 0.8941177, 0, 1,
-1.038689, 0.6777636, 0.5588176, 1, 0.8980392, 0, 1,
-1.033787, 0.3369426, -2.078464, 1, 0.9058824, 0, 1,
-1.033634, -0.865054, -3.817693, 1, 0.9137255, 0, 1,
-1.027596, -0.3699011, -0.8511337, 1, 0.9176471, 0, 1,
-1.022731, -0.9044646, -0.9823803, 1, 0.9254902, 0, 1,
-1.021539, -1.955823, -1.612909, 1, 0.9294118, 0, 1,
-1.009894, -0.1959999, -1.722678, 1, 0.9372549, 0, 1,
-1.008083, 0.2192275, -0.4032896, 1, 0.9411765, 0, 1,
-0.9932545, 0.04032699, -2.123277, 1, 0.9490196, 0, 1,
-0.9888117, 1.72371, -0.6931158, 1, 0.9529412, 0, 1,
-0.9883727, -0.7431757, -0.5982195, 1, 0.9607843, 0, 1,
-0.9880398, -0.05017339, -0.7226427, 1, 0.9647059, 0, 1,
-0.9863669, -0.1920477, -0.8498259, 1, 0.972549, 0, 1,
-0.9849304, -0.896099, -2.729779, 1, 0.9764706, 0, 1,
-0.9847959, 0.5461926, -0.3947258, 1, 0.9843137, 0, 1,
-0.9828822, 0.1371877, -0.5479875, 1, 0.9882353, 0, 1,
-0.9736553, -0.4983279, -3.786569, 1, 0.9960784, 0, 1,
-0.968888, -1.862871, -1.799635, 0.9960784, 1, 0, 1,
-0.9646909, -1.429146, -5.150618, 0.9921569, 1, 0, 1,
-0.9625751, 0.313169, 1.194809, 0.9843137, 1, 0, 1,
-0.96129, -1.716878, -1.961544, 0.9803922, 1, 0, 1,
-0.9548485, 1.248613, -0.7101417, 0.972549, 1, 0, 1,
-0.9529685, -0.2947132, -2.831208, 0.9686275, 1, 0, 1,
-0.9486976, 1.043689, -2.51474, 0.9607843, 1, 0, 1,
-0.9478067, -0.8460283, -1.393053, 0.9568627, 1, 0, 1,
-0.9474254, 0.6919917, 0.08367757, 0.9490196, 1, 0, 1,
-0.9464656, 1.415942, -0.4025068, 0.945098, 1, 0, 1,
-0.9425293, 2.3445, -1.446611, 0.9372549, 1, 0, 1,
-0.9403365, -1.679197, -3.720214, 0.9333333, 1, 0, 1,
-0.9387709, 0.086311, -3.019713, 0.9254902, 1, 0, 1,
-0.9317839, 0.4748864, 0.2080021, 0.9215686, 1, 0, 1,
-0.9310822, 1.023496, -1.505863, 0.9137255, 1, 0, 1,
-0.930488, -1.168783, -2.544168, 0.9098039, 1, 0, 1,
-0.9276059, -0.2686159, -1.04519, 0.9019608, 1, 0, 1,
-0.9249445, 0.7086077, -0.9241337, 0.8941177, 1, 0, 1,
-0.91885, 0.4194537, -1.677717, 0.8901961, 1, 0, 1,
-0.9094402, 1.588105, -1.424125, 0.8823529, 1, 0, 1,
-0.9062579, 0.3970686, 0.48988, 0.8784314, 1, 0, 1,
-0.8967864, 0.05508946, -1.712658, 0.8705882, 1, 0, 1,
-0.8935248, -1.196736, -2.813475, 0.8666667, 1, 0, 1,
-0.8922049, -0.2161216, -1.965695, 0.8588235, 1, 0, 1,
-0.8901451, -1.735949, -2.972722, 0.854902, 1, 0, 1,
-0.8895247, -0.1865464, -2.224345, 0.8470588, 1, 0, 1,
-0.8887506, -1.817961, -4.037342, 0.8431373, 1, 0, 1,
-0.8867281, -0.2276932, -2.079134, 0.8352941, 1, 0, 1,
-0.8866394, 0.2926663, -2.15853, 0.8313726, 1, 0, 1,
-0.8862156, -1.061729, -1.938592, 0.8235294, 1, 0, 1,
-0.8834946, 0.2598367, -0.768881, 0.8196079, 1, 0, 1,
-0.8756635, 0.08691902, -0.9743155, 0.8117647, 1, 0, 1,
-0.8725202, 1.445191, 0.2476677, 0.8078431, 1, 0, 1,
-0.8663525, -0.01169727, 0.02952714, 0.8, 1, 0, 1,
-0.8615171, 0.5751067, 1.677296, 0.7921569, 1, 0, 1,
-0.8581917, -1.392228, -2.562564, 0.7882353, 1, 0, 1,
-0.8571566, -1.273276, -1.2662, 0.7803922, 1, 0, 1,
-0.8544037, -0.1398721, -0.7118534, 0.7764706, 1, 0, 1,
-0.8417678, -0.02132518, -0.7612643, 0.7686275, 1, 0, 1,
-0.8406902, 0.999491, -1.906662, 0.7647059, 1, 0, 1,
-0.8364669, 0.1219092, -1.586336, 0.7568628, 1, 0, 1,
-0.8346002, 0.8394762, -0.2582633, 0.7529412, 1, 0, 1,
-0.8344812, 2.251179, 0.4554155, 0.7450981, 1, 0, 1,
-0.8321346, 0.4129067, -2.727577, 0.7411765, 1, 0, 1,
-0.8234276, 0.3214819, -0.6684988, 0.7333333, 1, 0, 1,
-0.8224276, -1.150177, -2.526168, 0.7294118, 1, 0, 1,
-0.8088494, -0.4292228, -1.942568, 0.7215686, 1, 0, 1,
-0.8065128, 1.343191, -0.5508029, 0.7176471, 1, 0, 1,
-0.8041983, -0.2673605, -2.110489, 0.7098039, 1, 0, 1,
-0.803985, 1.458374, -1.857545, 0.7058824, 1, 0, 1,
-0.8021013, 0.9240322, -0.5624993, 0.6980392, 1, 0, 1,
-0.7990646, 0.5962984, -1.049917, 0.6901961, 1, 0, 1,
-0.7985812, -0.3473967, -0.1582243, 0.6862745, 1, 0, 1,
-0.7976535, -0.01443846, -1.825675, 0.6784314, 1, 0, 1,
-0.7876647, 0.3846281, -2.739282, 0.6745098, 1, 0, 1,
-0.7816386, -1.329367, -0.619805, 0.6666667, 1, 0, 1,
-0.7796742, -0.5257712, -1.869709, 0.6627451, 1, 0, 1,
-0.7757199, 0.1888605, -1.806888, 0.654902, 1, 0, 1,
-0.7706372, -0.6870379, -3.389139, 0.6509804, 1, 0, 1,
-0.7688986, -0.1115089, 0.2813828, 0.6431373, 1, 0, 1,
-0.768528, -0.463372, -3.044101, 0.6392157, 1, 0, 1,
-0.7632633, -1.405391, -2.079782, 0.6313726, 1, 0, 1,
-0.7602333, -0.725193, -2.416246, 0.627451, 1, 0, 1,
-0.7570381, 0.7520905, -0.3497014, 0.6196079, 1, 0, 1,
-0.7559034, 2.322988, 1.251074, 0.6156863, 1, 0, 1,
-0.7553224, 2.095914, 0.4900424, 0.6078432, 1, 0, 1,
-0.7552708, -0.9479966, -0.9667923, 0.6039216, 1, 0, 1,
-0.7544139, -1.978125, -3.130358, 0.5960785, 1, 0, 1,
-0.7524908, -2.067471, -0.955694, 0.5882353, 1, 0, 1,
-0.7508566, 1.171043, -0.9090311, 0.5843138, 1, 0, 1,
-0.7490846, -0.7470648, -2.30113, 0.5764706, 1, 0, 1,
-0.7488014, 0.4324836, -0.9353004, 0.572549, 1, 0, 1,
-0.7467278, 0.3341822, -1.68317, 0.5647059, 1, 0, 1,
-0.7466738, -0.3130442, -2.558229, 0.5607843, 1, 0, 1,
-0.7465771, -1.292218, -2.947897, 0.5529412, 1, 0, 1,
-0.7458175, -0.5550461, -1.742929, 0.5490196, 1, 0, 1,
-0.744295, -0.3632482, -3.988817, 0.5411765, 1, 0, 1,
-0.739899, 0.1091779, -1.361095, 0.5372549, 1, 0, 1,
-0.7354063, 1.345832, -1.192258, 0.5294118, 1, 0, 1,
-0.7248712, 0.2867058, -0.4209414, 0.5254902, 1, 0, 1,
-0.7182862, 0.6555043, 0.4450817, 0.5176471, 1, 0, 1,
-0.7174961, -0.6688111, -2.337284, 0.5137255, 1, 0, 1,
-0.7106845, -0.3074551, -2.25868, 0.5058824, 1, 0, 1,
-0.7050239, -1.222607, -2.915774, 0.5019608, 1, 0, 1,
-0.698736, 0.07316851, -1.264871, 0.4941176, 1, 0, 1,
-0.6956766, 0.2352069, -0.3209247, 0.4862745, 1, 0, 1,
-0.6945685, -0.3044175, -2.534388, 0.4823529, 1, 0, 1,
-0.6933749, -0.03301528, -0.9333872, 0.4745098, 1, 0, 1,
-0.6931819, -0.2084379, -0.4608818, 0.4705882, 1, 0, 1,
-0.6911225, -0.5417664, -2.683336, 0.4627451, 1, 0, 1,
-0.690073, 0.6647348, -0.9807008, 0.4588235, 1, 0, 1,
-0.6823006, 0.9447181, 0.3269997, 0.4509804, 1, 0, 1,
-0.6822712, 0.828977, -0.7869952, 0.4470588, 1, 0, 1,
-0.6816805, -0.05428845, -1.636757, 0.4392157, 1, 0, 1,
-0.6803827, -0.2075299, -1.884275, 0.4352941, 1, 0, 1,
-0.6798538, 0.566506, -2.447096, 0.427451, 1, 0, 1,
-0.6797214, 0.9607917, -0.3106201, 0.4235294, 1, 0, 1,
-0.676641, 1.189779, 0.2610474, 0.4156863, 1, 0, 1,
-0.6740641, 1.465994, 0.6434308, 0.4117647, 1, 0, 1,
-0.6676581, -0.676232, -4.170199, 0.4039216, 1, 0, 1,
-0.661841, 0.3150685, -2.066102, 0.3960784, 1, 0, 1,
-0.6578875, 2.734296, -1.119292, 0.3921569, 1, 0, 1,
-0.6509392, 1.577007, -2.403101, 0.3843137, 1, 0, 1,
-0.6461448, -0.6246938, -4.476344, 0.3803922, 1, 0, 1,
-0.6450717, 0.8632773, -1.096354, 0.372549, 1, 0, 1,
-0.644037, -1.212823, -4.197798, 0.3686275, 1, 0, 1,
-0.6425024, 0.1315714, -1.892244, 0.3607843, 1, 0, 1,
-0.6413523, 0.2929367, -0.2719458, 0.3568628, 1, 0, 1,
-0.6395835, -1.122646, -2.675456, 0.3490196, 1, 0, 1,
-0.6322891, 0.1577827, -0.3708953, 0.345098, 1, 0, 1,
-0.6255922, 0.3684402, -0.9860787, 0.3372549, 1, 0, 1,
-0.6234943, 1.147307, -1.085864, 0.3333333, 1, 0, 1,
-0.622809, -0.1788832, -1.282355, 0.3254902, 1, 0, 1,
-0.6193818, -0.064308, -3.339706, 0.3215686, 1, 0, 1,
-0.6192439, -0.8155883, -2.479398, 0.3137255, 1, 0, 1,
-0.6144868, 1.690703, -0.5222793, 0.3098039, 1, 0, 1,
-0.6123487, 1.124363, 0.6843789, 0.3019608, 1, 0, 1,
-0.6111273, 1.585006, -1.964319, 0.2941177, 1, 0, 1,
-0.6059709, -0.01256423, -2.096413, 0.2901961, 1, 0, 1,
-0.605161, 0.7129993, -1.411009, 0.282353, 1, 0, 1,
-0.5973664, 1.226017, 0.7613376, 0.2784314, 1, 0, 1,
-0.5879786, 0.7128449, -0.7504755, 0.2705882, 1, 0, 1,
-0.5862674, 1.743803, -0.3910578, 0.2666667, 1, 0, 1,
-0.5855992, 0.3174782, -2.262959, 0.2588235, 1, 0, 1,
-0.5827718, -0.2499138, -2.678026, 0.254902, 1, 0, 1,
-0.5809998, -0.8096966, -2.354591, 0.2470588, 1, 0, 1,
-0.5774159, 1.402811, -2.271718, 0.2431373, 1, 0, 1,
-0.5773, 1.482856, -1.380256, 0.2352941, 1, 0, 1,
-0.5754773, -0.4849647, -2.181026, 0.2313726, 1, 0, 1,
-0.5753579, -1.560257, -3.857755, 0.2235294, 1, 0, 1,
-0.5740975, 0.1897707, -1.741409, 0.2196078, 1, 0, 1,
-0.571368, -0.4526226, -1.302443, 0.2117647, 1, 0, 1,
-0.5681676, -1.5742, -4.952832, 0.2078431, 1, 0, 1,
-0.5679143, -0.6892352, -2.776026, 0.2, 1, 0, 1,
-0.5653108, 0.6958502, -1.518083, 0.1921569, 1, 0, 1,
-0.5631971, -1.039827, -3.184281, 0.1882353, 1, 0, 1,
-0.5625355, 0.3269553, -2.070776, 0.1803922, 1, 0, 1,
-0.5566484, -0.2189485, -1.106973, 0.1764706, 1, 0, 1,
-0.5532919, -1.619018, -4.17828, 0.1686275, 1, 0, 1,
-0.547602, -0.06456088, -2.035984, 0.1647059, 1, 0, 1,
-0.544598, 0.1120634, -2.964832, 0.1568628, 1, 0, 1,
-0.538859, -0.5827241, -1.449757, 0.1529412, 1, 0, 1,
-0.5328699, 1.214878, 0.3518768, 0.145098, 1, 0, 1,
-0.5318059, 0.7793023, -0.0712686, 0.1411765, 1, 0, 1,
-0.5313115, 0.1642377, -2.225893, 0.1333333, 1, 0, 1,
-0.5296383, -0.9005329, -3.574559, 0.1294118, 1, 0, 1,
-0.5296189, -0.3543018, -1.00994, 0.1215686, 1, 0, 1,
-0.529278, 0.9603194, -1.472788, 0.1176471, 1, 0, 1,
-0.5279197, 0.2628422, -1.303749, 0.1098039, 1, 0, 1,
-0.5258448, -1.429171, -4.029995, 0.1058824, 1, 0, 1,
-0.5241372, -0.6482667, -1.724408, 0.09803922, 1, 0, 1,
-0.5206887, 0.624344, 0.6196777, 0.09019608, 1, 0, 1,
-0.5163105, -0.640586, -4.650396, 0.08627451, 1, 0, 1,
-0.5114093, -0.3439639, -2.913178, 0.07843138, 1, 0, 1,
-0.5084414, 0.4237036, 1.108836, 0.07450981, 1, 0, 1,
-0.507038, 0.8178353, -0.8105499, 0.06666667, 1, 0, 1,
-0.5035811, 0.9620822, -0.7754274, 0.0627451, 1, 0, 1,
-0.4986582, 1.763054, 0.7926224, 0.05490196, 1, 0, 1,
-0.4982007, 0.3160521, -1.960501, 0.05098039, 1, 0, 1,
-0.4976583, -1.208865, -3.804086, 0.04313726, 1, 0, 1,
-0.4935465, 0.500471, 0.543713, 0.03921569, 1, 0, 1,
-0.4918101, -0.1568285, -2.521407, 0.03137255, 1, 0, 1,
-0.4894274, -0.3617925, -2.909432, 0.02745098, 1, 0, 1,
-0.488885, 0.8545488, -1.63331, 0.01960784, 1, 0, 1,
-0.487331, 1.853067, 1.895182, 0.01568628, 1, 0, 1,
-0.4870268, 1.182492, 0.2126082, 0.007843138, 1, 0, 1,
-0.4855718, 0.4709045, -0.8991439, 0.003921569, 1, 0, 1,
-0.4834928, 2.312456, 0.903399, 0, 1, 0.003921569, 1,
-0.4814155, 0.2955165, -1.117192, 0, 1, 0.01176471, 1,
-0.4800719, 0.9180602, -1.119967, 0, 1, 0.01568628, 1,
-0.4799067, -1.460029, -2.652797, 0, 1, 0.02352941, 1,
-0.4793326, -0.9586697, -3.253662, 0, 1, 0.02745098, 1,
-0.4736773, 0.2144281, 1.513881, 0, 1, 0.03529412, 1,
-0.4701039, -0.4217323, -1.158015, 0, 1, 0.03921569, 1,
-0.4658299, -1.072327, -3.172391, 0, 1, 0.04705882, 1,
-0.4603785, -0.8916316, -3.160374, 0, 1, 0.05098039, 1,
-0.4585741, -0.6075566, -1.848413, 0, 1, 0.05882353, 1,
-0.4507943, -1.569073, -3.126302, 0, 1, 0.0627451, 1,
-0.4449221, 0.2075617, 0.3561665, 0, 1, 0.07058824, 1,
-0.4406366, -0.3471232, -2.322919, 0, 1, 0.07450981, 1,
-0.4163281, 0.09077682, -1.042655, 0, 1, 0.08235294, 1,
-0.4094465, 1.34958, -0.568541, 0, 1, 0.08627451, 1,
-0.4089696, -0.8525055, -2.528472, 0, 1, 0.09411765, 1,
-0.3990683, 0.6399127, -0.3575431, 0, 1, 0.1019608, 1,
-0.3982736, 0.2582813, -0.6164504, 0, 1, 0.1058824, 1,
-0.3965487, 1.455069, 0.7096094, 0, 1, 0.1137255, 1,
-0.393701, -1.060166, -3.352623, 0, 1, 0.1176471, 1,
-0.3918401, -0.6770446, -2.176517, 0, 1, 0.1254902, 1,
-0.3695818, 0.3028623, -0.9329305, 0, 1, 0.1294118, 1,
-0.3681711, -0.9832202, -2.873596, 0, 1, 0.1372549, 1,
-0.3624541, -0.2920387, -1.031222, 0, 1, 0.1411765, 1,
-0.3591351, -0.2751504, -1.55018, 0, 1, 0.1490196, 1,
-0.3578417, -0.7858409, -3.024851, 0, 1, 0.1529412, 1,
-0.3471404, 0.4910024, -2.252254, 0, 1, 0.1607843, 1,
-0.3459604, -0.1571157, -2.500413, 0, 1, 0.1647059, 1,
-0.3417003, -1.119151, -2.145831, 0, 1, 0.172549, 1,
-0.3379104, -1.141498, -3.244811, 0, 1, 0.1764706, 1,
-0.3371865, 0.09825395, -1.541566, 0, 1, 0.1843137, 1,
-0.3355202, 0.3823276, -1.163, 0, 1, 0.1882353, 1,
-0.3340286, -0.3583463, -2.440122, 0, 1, 0.1960784, 1,
-0.3332744, 1.622334, 1.0787, 0, 1, 0.2039216, 1,
-0.3331655, -0.8665032, -3.673326, 0, 1, 0.2078431, 1,
-0.3288478, 0.7976307, -0.5193316, 0, 1, 0.2156863, 1,
-0.3252162, 0.310815, -0.5383564, 0, 1, 0.2196078, 1,
-0.3244328, -1.453306, -3.134025, 0, 1, 0.227451, 1,
-0.3220733, 1.408639, -0.196654, 0, 1, 0.2313726, 1,
-0.3121428, 0.8325457, -0.3266945, 0, 1, 0.2392157, 1,
-0.3083435, -0.5181865, -2.820933, 0, 1, 0.2431373, 1,
-0.3015568, -0.7571049, -2.750504, 0, 1, 0.2509804, 1,
-0.3004413, -0.1936624, -2.680319, 0, 1, 0.254902, 1,
-0.2994134, -0.1847048, -2.47449, 0, 1, 0.2627451, 1,
-0.2976426, -1.72689, -3.78942, 0, 1, 0.2666667, 1,
-0.2965783, -0.9040416, -2.262748, 0, 1, 0.2745098, 1,
-0.2951429, -0.1996809, -2.203453, 0, 1, 0.2784314, 1,
-0.2949441, 0.3807396, -1.323416, 0, 1, 0.2862745, 1,
-0.2879503, -0.8613164, -3.127958, 0, 1, 0.2901961, 1,
-0.2762677, 1.545495, -0.9458829, 0, 1, 0.2980392, 1,
-0.2750307, 1.066913, 0.7406509, 0, 1, 0.3058824, 1,
-0.2711193, 1.004149, -0.6747515, 0, 1, 0.3098039, 1,
-0.270558, -1.986444, -2.542633, 0, 1, 0.3176471, 1,
-0.2691336, 1.706295, 0.6231948, 0, 1, 0.3215686, 1,
-0.2670606, 1.323225, -1.354117, 0, 1, 0.3294118, 1,
-0.2642975, 1.299647, 1.089359, 0, 1, 0.3333333, 1,
-0.2593145, -0.8313353, -2.64897, 0, 1, 0.3411765, 1,
-0.2491305, -0.728431, -1.474809, 0, 1, 0.345098, 1,
-0.2443, -0.989594, -2.273906, 0, 1, 0.3529412, 1,
-0.2430224, -1.290951, -2.781997, 0, 1, 0.3568628, 1,
-0.2416533, -1.09931, -3.314408, 0, 1, 0.3647059, 1,
-0.2358693, 1.591053, 0.2775175, 0, 1, 0.3686275, 1,
-0.2357007, 0.6776082, 1.465078, 0, 1, 0.3764706, 1,
-0.2350443, 0.5965247, 0.04473185, 0, 1, 0.3803922, 1,
-0.2338284, 2.098382, -0.7321061, 0, 1, 0.3882353, 1,
-0.2324397, 2.434884, -0.9356482, 0, 1, 0.3921569, 1,
-0.2297157, -1.096001, -3.654388, 0, 1, 0.4, 1,
-0.2278595, 1.244606, 1.44925, 0, 1, 0.4078431, 1,
-0.2262744, -1.84831, -1.17284, 0, 1, 0.4117647, 1,
-0.2253603, -0.03467731, -1.717367, 0, 1, 0.4196078, 1,
-0.2221892, -0.5202496, -1.6396, 0, 1, 0.4235294, 1,
-0.2219644, -0.3518175, -2.688674, 0, 1, 0.4313726, 1,
-0.2177679, -0.08344123, -1.322826, 0, 1, 0.4352941, 1,
-0.2173945, 0.7180924, 1.372259, 0, 1, 0.4431373, 1,
-0.2171715, -1.035792, -2.540677, 0, 1, 0.4470588, 1,
-0.2156122, -1.203784, -5.331415, 0, 1, 0.454902, 1,
-0.2137969, -0.6477193, -3.863486, 0, 1, 0.4588235, 1,
-0.2114947, -0.6328201, -4.273787, 0, 1, 0.4666667, 1,
-0.209414, -1.088867, -4.068412, 0, 1, 0.4705882, 1,
-0.201413, 1.234359, -0.5227659, 0, 1, 0.4784314, 1,
-0.198694, -0.5217339, -4.420091, 0, 1, 0.4823529, 1,
-0.1984696, 1.069609, -0.6782119, 0, 1, 0.4901961, 1,
-0.194575, -0.0676399, -1.601884, 0, 1, 0.4941176, 1,
-0.1894661, -0.2855888, -1.832868, 0, 1, 0.5019608, 1,
-0.1853382, -1.199246, -1.593342, 0, 1, 0.509804, 1,
-0.1833684, -0.3517286, -2.365045, 0, 1, 0.5137255, 1,
-0.1823423, 0.7986469, -0.2100458, 0, 1, 0.5215687, 1,
-0.1802563, 0.2051741, -1.689834, 0, 1, 0.5254902, 1,
-0.1768045, -0.7155083, -2.443006, 0, 1, 0.5333334, 1,
-0.1699135, 1.326009, 0.01293269, 0, 1, 0.5372549, 1,
-0.1693269, 0.5647007, -1.739312, 0, 1, 0.5450981, 1,
-0.1668069, -1.118914, -3.161307, 0, 1, 0.5490196, 1,
-0.1642719, 0.05746469, -1.001349, 0, 1, 0.5568628, 1,
-0.1589784, 0.2104378, -0.8752049, 0, 1, 0.5607843, 1,
-0.1571929, 0.2840239, -0.1421594, 0, 1, 0.5686275, 1,
-0.1529529, 0.9086102, -0.3697585, 0, 1, 0.572549, 1,
-0.1522699, -1.159797, -2.101946, 0, 1, 0.5803922, 1,
-0.1513888, 0.2333605, 0.3934269, 0, 1, 0.5843138, 1,
-0.1508763, 2.863907, 0.7006818, 0, 1, 0.5921569, 1,
-0.1498391, 1.457184, 1.305502, 0, 1, 0.5960785, 1,
-0.1488519, 1.907112, 0.1541854, 0, 1, 0.6039216, 1,
-0.1466963, -1.276846, -3.272998, 0, 1, 0.6117647, 1,
-0.146067, 0.6330874, -0.8967444, 0, 1, 0.6156863, 1,
-0.1457267, 1.939025, -1.776839, 0, 1, 0.6235294, 1,
-0.1453754, -0.7835208, -2.509822, 0, 1, 0.627451, 1,
-0.1398016, -0.9669209, -1.591381, 0, 1, 0.6352941, 1,
-0.1395202, -0.5627224, -2.586153, 0, 1, 0.6392157, 1,
-0.1336107, 0.1127988, -1.793674, 0, 1, 0.6470588, 1,
-0.1314852, -0.1916489, -1.13568, 0, 1, 0.6509804, 1,
-0.1293175, -0.7351776, -4.462401, 0, 1, 0.6588235, 1,
-0.1257329, -1.17843, -3.583661, 0, 1, 0.6627451, 1,
-0.122087, -1.525244, -3.980236, 0, 1, 0.6705883, 1,
-0.1209509, -0.2383666, -1.232457, 0, 1, 0.6745098, 1,
-0.1186951, -1.197428, -2.703306, 0, 1, 0.682353, 1,
-0.1185495, 0.5578215, -0.1912436, 0, 1, 0.6862745, 1,
-0.1184184, 0.2568173, 1.035391, 0, 1, 0.6941177, 1,
-0.1122785, -0.608295, -3.151563, 0, 1, 0.7019608, 1,
-0.1093785, 0.4988866, -1.104415, 0, 1, 0.7058824, 1,
-0.1088311, -1.053477, -2.342167, 0, 1, 0.7137255, 1,
-0.1050535, -1.284178, -2.069029, 0, 1, 0.7176471, 1,
-0.1038523, -1.079133, -3.202552, 0, 1, 0.7254902, 1,
-0.1032483, -0.7242421, -4.607653, 0, 1, 0.7294118, 1,
-0.1027631, -0.5801587, -2.664478, 0, 1, 0.7372549, 1,
-0.1025434, -1.733455, -4.626645, 0, 1, 0.7411765, 1,
-0.1024372, -1.343019, -1.41814, 0, 1, 0.7490196, 1,
-0.1010295, -0.7657977, -4.009293, 0, 1, 0.7529412, 1,
-0.1001512, -1.782604, -3.410102, 0, 1, 0.7607843, 1,
-0.09756351, -0.7576213, -3.967155, 0, 1, 0.7647059, 1,
-0.09044262, -0.9166343, -3.152404, 0, 1, 0.772549, 1,
-0.08949866, -0.580484, -3.536278, 0, 1, 0.7764706, 1,
-0.08489425, 0.01565694, -0.3479199, 0, 1, 0.7843137, 1,
-0.07587305, 1.048744, 0.8769501, 0, 1, 0.7882353, 1,
-0.06834663, -0.6575389, -2.832303, 0, 1, 0.7960784, 1,
-0.06703497, -1.36684, -2.249249, 0, 1, 0.8039216, 1,
-0.0668083, -2.222263, -2.778757, 0, 1, 0.8078431, 1,
-0.06570128, 0.389551, 1.19915, 0, 1, 0.8156863, 1,
-0.06424657, -0.1525794, -3.219441, 0, 1, 0.8196079, 1,
-0.05950661, 0.01619511, -3.780323, 0, 1, 0.827451, 1,
-0.05592428, -1.329072, -3.790422, 0, 1, 0.8313726, 1,
-0.05490116, -0.1080326, -1.510932, 0, 1, 0.8392157, 1,
-0.05350361, 0.671083, 0.2685796, 0, 1, 0.8431373, 1,
-0.0517933, -1.556048, -2.505683, 0, 1, 0.8509804, 1,
-0.04777853, -0.8504758, -4.29778, 0, 1, 0.854902, 1,
-0.03948214, -0.5438042, -1.850061, 0, 1, 0.8627451, 1,
-0.03792605, -2.042499, -2.619747, 0, 1, 0.8666667, 1,
-0.03774793, 0.6440946, 0.3989461, 0, 1, 0.8745098, 1,
-0.03741765, 0.6755827, 1.343421, 0, 1, 0.8784314, 1,
-0.03684725, 1.518276, 0.181234, 0, 1, 0.8862745, 1,
-0.03656242, 0.4402914, -1.844216, 0, 1, 0.8901961, 1,
-0.03397294, -0.1528446, -1.840394, 0, 1, 0.8980392, 1,
-0.03258844, -1.945804, -4.882149, 0, 1, 0.9058824, 1,
-0.02986088, -0.3427075, -4.053207, 0, 1, 0.9098039, 1,
-0.02985695, -1.019411, -3.805528, 0, 1, 0.9176471, 1,
-0.02737623, -0.2173372, -3.548361, 0, 1, 0.9215686, 1,
-0.02299385, 0.4121214, -1.83376, 0, 1, 0.9294118, 1,
-0.01908181, -0.3418235, -3.261004, 0, 1, 0.9333333, 1,
-0.01904751, -0.06572781, -3.584307, 0, 1, 0.9411765, 1,
-0.01858339, -1.033263, -2.959633, 0, 1, 0.945098, 1,
-0.01575938, -0.1033428, -2.059597, 0, 1, 0.9529412, 1,
-0.01303502, -1.62525, -3.203485, 0, 1, 0.9568627, 1,
-0.007238552, -0.6167029, -3.058786, 0, 1, 0.9647059, 1,
-0.003179349, -0.4586405, -2.904032, 0, 1, 0.9686275, 1,
-0.002456158, 1.010602, 0.3319216, 0, 1, 0.9764706, 1,
0.005674483, -0.9416949, 1.736566, 0, 1, 0.9803922, 1,
0.006977086, 0.489335, -0.105468, 0, 1, 0.9882353, 1,
0.01276689, -0.02899304, 2.522344, 0, 1, 0.9921569, 1,
0.0143322, 0.03994618, 0.3746421, 0, 1, 1, 1,
0.0157344, 1.689793, -0.5848883, 0, 0.9921569, 1, 1,
0.01722545, -0.04982979, 2.486924, 0, 0.9882353, 1, 1,
0.01788737, -2.061201, 3.358115, 0, 0.9803922, 1, 1,
0.01803703, -1.909612, 2.384219, 0, 0.9764706, 1, 1,
0.018039, 1.409135, -1.242768, 0, 0.9686275, 1, 1,
0.02194847, 0.9485658, 2.051935, 0, 0.9647059, 1, 1,
0.02245763, -0.009969589, 0.7555833, 0, 0.9568627, 1, 1,
0.02416019, -0.7315171, 1.532169, 0, 0.9529412, 1, 1,
0.03078121, 0.5096833, 0.9362961, 0, 0.945098, 1, 1,
0.03232532, -0.02693193, 2.894951, 0, 0.9411765, 1, 1,
0.03346843, -1.34385, 5.041738, 0, 0.9333333, 1, 1,
0.03483137, 1.542299, 1.212988, 0, 0.9294118, 1, 1,
0.04704553, -2.390064, 2.920913, 0, 0.9215686, 1, 1,
0.04857012, -2.050152, 3.657726, 0, 0.9176471, 1, 1,
0.0495135, 1.692466, 2.771992, 0, 0.9098039, 1, 1,
0.04982004, 0.05722069, 0.4404233, 0, 0.9058824, 1, 1,
0.05110606, 0.7896711, 0.4506087, 0, 0.8980392, 1, 1,
0.05138813, 0.2139624, 0.4153498, 0, 0.8901961, 1, 1,
0.0534277, 0.9675743, 0.1997072, 0, 0.8862745, 1, 1,
0.06036077, -0.05549283, 0.3635867, 0, 0.8784314, 1, 1,
0.06148852, -0.2707875, 3.05575, 0, 0.8745098, 1, 1,
0.06581478, -1.24333, 2.820695, 0, 0.8666667, 1, 1,
0.06673964, 0.406688, -0.9246687, 0, 0.8627451, 1, 1,
0.06867764, 1.253233, 1.159618, 0, 0.854902, 1, 1,
0.07218696, 0.2758825, -1.030477, 0, 0.8509804, 1, 1,
0.07445975, -0.7493985, 4.732857, 0, 0.8431373, 1, 1,
0.07966224, 0.06139652, 0.904157, 0, 0.8392157, 1, 1,
0.08283181, -0.7896799, 2.356331, 0, 0.8313726, 1, 1,
0.08752087, -0.3044406, 2.728807, 0, 0.827451, 1, 1,
0.0928275, 0.6709874, 0.452458, 0, 0.8196079, 1, 1,
0.09300599, -0.2449599, 2.235588, 0, 0.8156863, 1, 1,
0.1013802, 0.4605849, -1.549032, 0, 0.8078431, 1, 1,
0.1017883, -0.6824734, 4.612068, 0, 0.8039216, 1, 1,
0.1041287, -0.3279787, 2.447333, 0, 0.7960784, 1, 1,
0.1063426, -0.353069, 3.178573, 0, 0.7882353, 1, 1,
0.1076898, 0.4730494, 2.396787, 0, 0.7843137, 1, 1,
0.1111466, 0.01906897, 1.372196, 0, 0.7764706, 1, 1,
0.1114178, 0.02324289, 3.188802, 0, 0.772549, 1, 1,
0.1125135, -0.5841661, 2.396344, 0, 0.7647059, 1, 1,
0.1129343, -0.1475794, 2.263352, 0, 0.7607843, 1, 1,
0.1148771, 1.367513, -0.3394407, 0, 0.7529412, 1, 1,
0.1161526, -0.2685459, 2.996249, 0, 0.7490196, 1, 1,
0.1163591, -0.8959696, 3.19377, 0, 0.7411765, 1, 1,
0.1215833, 1.041781, -1.895287, 0, 0.7372549, 1, 1,
0.1248358, -0.3631804, 3.764503, 0, 0.7294118, 1, 1,
0.1258687, 1.900979, 0.5697096, 0, 0.7254902, 1, 1,
0.1271533, 1.583934, 1.002819, 0, 0.7176471, 1, 1,
0.1346093, 0.3406588, -0.2406494, 0, 0.7137255, 1, 1,
0.1366323, 1.433736, -0.268762, 0, 0.7058824, 1, 1,
0.1376546, 0.3315021, 0.2081963, 0, 0.6980392, 1, 1,
0.1436589, 0.09829957, -0.2511886, 0, 0.6941177, 1, 1,
0.1454425, -0.7076406, 3.99358, 0, 0.6862745, 1, 1,
0.146838, -1.360874, 3.181768, 0, 0.682353, 1, 1,
0.1500965, 0.2057531, 1.413484, 0, 0.6745098, 1, 1,
0.1508625, 2.096299, -1.132999, 0, 0.6705883, 1, 1,
0.1531603, 0.8783134, 0.3190302, 0, 0.6627451, 1, 1,
0.1538603, -0.8590893, 2.348237, 0, 0.6588235, 1, 1,
0.1584394, 2.38345, 0.4753546, 0, 0.6509804, 1, 1,
0.1589087, -0.4447928, 1.254488, 0, 0.6470588, 1, 1,
0.1609263, 1.208004, -0.6715077, 0, 0.6392157, 1, 1,
0.1612122, -0.2254893, 1.625428, 0, 0.6352941, 1, 1,
0.1613169, 0.5368158, 0.8910193, 0, 0.627451, 1, 1,
0.1647499, -0.2202488, 1.58914, 0, 0.6235294, 1, 1,
0.1656382, -0.1985241, 2.683975, 0, 0.6156863, 1, 1,
0.1668102, -0.7668322, 3.174204, 0, 0.6117647, 1, 1,
0.1682783, 0.1614582, -1.128137, 0, 0.6039216, 1, 1,
0.168851, -0.9723206, 2.802482, 0, 0.5960785, 1, 1,
0.1701916, -0.722211, 2.663978, 0, 0.5921569, 1, 1,
0.1717991, 0.6036533, 0.366574, 0, 0.5843138, 1, 1,
0.1721804, -1.395055, 2.341685, 0, 0.5803922, 1, 1,
0.1792991, 0.2107532, -0.6760505, 0, 0.572549, 1, 1,
0.1814356, 0.3629509, -0.223745, 0, 0.5686275, 1, 1,
0.1857774, 0.7413327, 0.3255719, 0, 0.5607843, 1, 1,
0.185931, -0.75493, 3.177811, 0, 0.5568628, 1, 1,
0.1933107, -0.7393841, 2.193731, 0, 0.5490196, 1, 1,
0.1938858, -1.202175, 2.222975, 0, 0.5450981, 1, 1,
0.1955811, -1.026227, 3.31749, 0, 0.5372549, 1, 1,
0.1975667, -0.8479986, 0.9570985, 0, 0.5333334, 1, 1,
0.198079, 0.9690602, -1.412716, 0, 0.5254902, 1, 1,
0.2011935, -0.2625852, 2.23694, 0, 0.5215687, 1, 1,
0.2069464, 2.873434, 0.2195849, 0, 0.5137255, 1, 1,
0.2089188, -0.8858055, 1.386943, 0, 0.509804, 1, 1,
0.210954, 0.7882179, 0.2364654, 0, 0.5019608, 1, 1,
0.2128619, 0.6322959, -0.4476997, 0, 0.4941176, 1, 1,
0.2181571, -0.794681, 2.751691, 0, 0.4901961, 1, 1,
0.2197643, 0.1196317, 0.1305441, 0, 0.4823529, 1, 1,
0.2214027, -0.313197, 2.285714, 0, 0.4784314, 1, 1,
0.2219717, -1.362365, 2.284427, 0, 0.4705882, 1, 1,
0.2226431, -1.352001, 2.708416, 0, 0.4666667, 1, 1,
0.2333321, 0.8551445, 1.079794, 0, 0.4588235, 1, 1,
0.2334431, 0.02071096, 1.04726, 0, 0.454902, 1, 1,
0.2348357, -2.202368, 3.334858, 0, 0.4470588, 1, 1,
0.2384763, -1.088023, 3.584784, 0, 0.4431373, 1, 1,
0.2401695, 1.722427, -0.6812308, 0, 0.4352941, 1, 1,
0.2404005, 1.118161, 1.608173, 0, 0.4313726, 1, 1,
0.2426499, -0.159369, 1.115844, 0, 0.4235294, 1, 1,
0.2468533, -1.162418, 2.091516, 0, 0.4196078, 1, 1,
0.2546559, -1.871799, 2.535512, 0, 0.4117647, 1, 1,
0.2557541, 0.2808918, -0.3950879, 0, 0.4078431, 1, 1,
0.2569875, -1.354026, 1.043715, 0, 0.4, 1, 1,
0.2608064, 0.2025751, 3.201373, 0, 0.3921569, 1, 1,
0.2656333, 0.05450611, 1.750283, 0, 0.3882353, 1, 1,
0.2657779, -0.3426258, 1.217039, 0, 0.3803922, 1, 1,
0.2752063, -0.8788399, 3.782979, 0, 0.3764706, 1, 1,
0.2778648, -1.433927, 4.551754, 0, 0.3686275, 1, 1,
0.2889039, -0.1613433, 2.572291, 0, 0.3647059, 1, 1,
0.2894151, -2.11744, 5.298209, 0, 0.3568628, 1, 1,
0.2912539, 0.1770808, 0.5625837, 0, 0.3529412, 1, 1,
0.2971831, 2.104989, 0.4871281, 0, 0.345098, 1, 1,
0.2981372, -0.4217528, 2.326902, 0, 0.3411765, 1, 1,
0.2994246, 0.1217164, 0.8025917, 0, 0.3333333, 1, 1,
0.30109, -0.08600781, 2.585879, 0, 0.3294118, 1, 1,
0.3041887, -0.0606535, 2.408315, 0, 0.3215686, 1, 1,
0.3084824, 0.8050795, 3.360072, 0, 0.3176471, 1, 1,
0.3088318, 0.71952, 3.270848, 0, 0.3098039, 1, 1,
0.3102388, 1.024955, 1.366578, 0, 0.3058824, 1, 1,
0.3109408, -0.4537295, 0.7088138, 0, 0.2980392, 1, 1,
0.3134812, 0.09116446, 1.072597, 0, 0.2901961, 1, 1,
0.3149439, 1.102166, -0.1080202, 0, 0.2862745, 1, 1,
0.3210906, 0.3261638, -1.253676, 0, 0.2784314, 1, 1,
0.3279772, -1.076398, 2.741449, 0, 0.2745098, 1, 1,
0.3296465, -0.09589777, 2.26088, 0, 0.2666667, 1, 1,
0.3342179, 1.141674, 1.822834, 0, 0.2627451, 1, 1,
0.3380367, -0.9800704, 2.414612, 0, 0.254902, 1, 1,
0.3403445, 0.8930195, 0.3980312, 0, 0.2509804, 1, 1,
0.3433541, 0.00880925, 1.80666, 0, 0.2431373, 1, 1,
0.3442829, 0.8226554, 3.052917, 0, 0.2392157, 1, 1,
0.3467758, -0.3928841, 2.936908, 0, 0.2313726, 1, 1,
0.3479888, 0.190059, -0.8162365, 0, 0.227451, 1, 1,
0.3521806, -1.52894, 2.5663, 0, 0.2196078, 1, 1,
0.3548571, -0.04708647, 1.533702, 0, 0.2156863, 1, 1,
0.3562727, 0.1139236, 1.230971, 0, 0.2078431, 1, 1,
0.3568929, 0.4148062, 0.3371216, 0, 0.2039216, 1, 1,
0.3583231, 1.025485, 1.121917, 0, 0.1960784, 1, 1,
0.3635062, 0.7749065, 0.2371694, 0, 0.1882353, 1, 1,
0.3647631, -0.4716202, 2.871382, 0, 0.1843137, 1, 1,
0.3664464, 0.09947281, -0.4796277, 0, 0.1764706, 1, 1,
0.3680432, -0.09879668, 2.10687, 0, 0.172549, 1, 1,
0.3687547, -0.4496721, 2.879985, 0, 0.1647059, 1, 1,
0.369955, -1.325723, 2.886556, 0, 0.1607843, 1, 1,
0.3722397, -0.3048944, 2.479371, 0, 0.1529412, 1, 1,
0.3763677, 0.5738568, 1.228715, 0, 0.1490196, 1, 1,
0.3794031, 0.09077453, 2.877757, 0, 0.1411765, 1, 1,
0.3860102, -0.5500245, 2.711027, 0, 0.1372549, 1, 1,
0.3866686, -0.599014, 2.997941, 0, 0.1294118, 1, 1,
0.3877061, -0.1338944, 3.221138, 0, 0.1254902, 1, 1,
0.3908291, 1.306584, 0.4634815, 0, 0.1176471, 1, 1,
0.3947376, -0.1572377, 2.350552, 0, 0.1137255, 1, 1,
0.3951147, -0.789405, 1.700861, 0, 0.1058824, 1, 1,
0.3980034, 1.228672, 0.6846151, 0, 0.09803922, 1, 1,
0.399006, 1.47266, -0.2100368, 0, 0.09411765, 1, 1,
0.4062426, 0.7076787, 1.7639, 0, 0.08627451, 1, 1,
0.4088185, -0.548101, 3.175056, 0, 0.08235294, 1, 1,
0.4093847, -0.893092, 3.060145, 0, 0.07450981, 1, 1,
0.4135182, -0.4781019, 2.692642, 0, 0.07058824, 1, 1,
0.4139991, -0.9085995, 2.849458, 0, 0.0627451, 1, 1,
0.4236678, -1.089588, 2.585519, 0, 0.05882353, 1, 1,
0.4239304, 1.096261, 1.41001, 0, 0.05098039, 1, 1,
0.4247723, -0.4967095, 3.162728, 0, 0.04705882, 1, 1,
0.4275716, -1.004335, 3.384151, 0, 0.03921569, 1, 1,
0.4345149, -1.124555, 1.057888, 0, 0.03529412, 1, 1,
0.4378036, -0.5786608, 2.610698, 0, 0.02745098, 1, 1,
0.4382036, 0.1569302, 3.494236, 0, 0.02352941, 1, 1,
0.4390064, -0.4690442, 2.444597, 0, 0.01568628, 1, 1,
0.4400049, 0.5901671, 2.118819, 0, 0.01176471, 1, 1,
0.4445084, -0.6994256, 1.172299, 0, 0.003921569, 1, 1,
0.4504549, -1.102548, 2.757147, 0.003921569, 0, 1, 1,
0.4571813, 0.7450215, 0.1142594, 0.007843138, 0, 1, 1,
0.4603568, 0.9786105, 1.727592, 0.01568628, 0, 1, 1,
0.4610295, -1.105095, 4.113563, 0.01960784, 0, 1, 1,
0.461841, -0.3579316, 3.361036, 0.02745098, 0, 1, 1,
0.4672593, 1.255114, -0.1552234, 0.03137255, 0, 1, 1,
0.4684514, -0.2409061, 2.881804, 0.03921569, 0, 1, 1,
0.4688767, -0.07288412, -0.1023233, 0.04313726, 0, 1, 1,
0.4723677, -2.278158, 3.044239, 0.05098039, 0, 1, 1,
0.4761855, 0.710052, -0.8167541, 0.05490196, 0, 1, 1,
0.4771017, 0.1852992, 1.725839, 0.0627451, 0, 1, 1,
0.4795169, -0.863982, 1.910369, 0.06666667, 0, 1, 1,
0.4851987, -0.2230389, 3.287709, 0.07450981, 0, 1, 1,
0.4857007, -0.8189186, 0.9769416, 0.07843138, 0, 1, 1,
0.4865628, 0.8189987, 2.604222, 0.08627451, 0, 1, 1,
0.4879953, 2.014949, 0.3664991, 0.09019608, 0, 1, 1,
0.4893359, -0.5495687, 3.42159, 0.09803922, 0, 1, 1,
0.4916113, -0.4275439, 1.504875, 0.1058824, 0, 1, 1,
0.4940492, 0.7940975, 1.125065, 0.1098039, 0, 1, 1,
0.4952168, -0.1710764, 1.269347, 0.1176471, 0, 1, 1,
0.4966883, 0.05592911, 1.154539, 0.1215686, 0, 1, 1,
0.5016072, 0.4186964, 0.7114294, 0.1294118, 0, 1, 1,
0.5020255, 0.5578619, -1.444653, 0.1333333, 0, 1, 1,
0.5033922, -0.2578945, 3.589106, 0.1411765, 0, 1, 1,
0.5045621, 0.4423667, -0.4168407, 0.145098, 0, 1, 1,
0.5063059, -0.8801047, 2.56867, 0.1529412, 0, 1, 1,
0.5070318, -0.09867962, 0.9873621, 0.1568628, 0, 1, 1,
0.5078397, -0.5670904, 3.462384, 0.1647059, 0, 1, 1,
0.5099316, 0.1737943, 0.8341016, 0.1686275, 0, 1, 1,
0.5101879, 1.173729, -0.6054782, 0.1764706, 0, 1, 1,
0.5109729, -1.882145, 3.253593, 0.1803922, 0, 1, 1,
0.5146394, -0.4223575, 2.195442, 0.1882353, 0, 1, 1,
0.5148214, -1.47025, 3.103571, 0.1921569, 0, 1, 1,
0.5162469, -0.4708289, 2.725942, 0.2, 0, 1, 1,
0.5249577, -0.8862244, -0.2801552, 0.2078431, 0, 1, 1,
0.5297656, 1.625879, 2.064075, 0.2117647, 0, 1, 1,
0.5405374, -0.6621207, 1.933959, 0.2196078, 0, 1, 1,
0.5456016, -2.275434, 3.964356, 0.2235294, 0, 1, 1,
0.5465444, -0.5903085, 4.042225, 0.2313726, 0, 1, 1,
0.5503438, 0.8535684, 0.3983216, 0.2352941, 0, 1, 1,
0.5521618, 0.7316333, 1.452376, 0.2431373, 0, 1, 1,
0.5529953, -0.8039677, 2.528023, 0.2470588, 0, 1, 1,
0.5546106, 0.03759511, 1.032216, 0.254902, 0, 1, 1,
0.5547254, -1.644603, 4.073526, 0.2588235, 0, 1, 1,
0.5610517, 0.8319165, -0.7741274, 0.2666667, 0, 1, 1,
0.5617685, -0.2598817, 0.7879872, 0.2705882, 0, 1, 1,
0.5619294, -0.9712105, 1.767081, 0.2784314, 0, 1, 1,
0.5759078, -0.8677683, 0.6699336, 0.282353, 0, 1, 1,
0.5762859, 0.2987738, 2.567098, 0.2901961, 0, 1, 1,
0.5766549, 0.1141975, -0.1134897, 0.2941177, 0, 1, 1,
0.5790224, 1.296953, -0.847389, 0.3019608, 0, 1, 1,
0.5879788, 0.2240194, 2.08259, 0.3098039, 0, 1, 1,
0.5908207, 0.4772457, 0.9897925, 0.3137255, 0, 1, 1,
0.6020107, -0.5933532, 0.9578983, 0.3215686, 0, 1, 1,
0.6033531, 0.299661, 1.501286, 0.3254902, 0, 1, 1,
0.6078032, 0.5503125, 1.138206, 0.3333333, 0, 1, 1,
0.6091289, 0.3075231, 1.727589, 0.3372549, 0, 1, 1,
0.6095522, 0.3506481, 1.863793, 0.345098, 0, 1, 1,
0.6161934, -1.100548, 2.386212, 0.3490196, 0, 1, 1,
0.6174946, 1.405343, 0.06816836, 0.3568628, 0, 1, 1,
0.6236275, 0.1767233, 0.0362747, 0.3607843, 0, 1, 1,
0.626965, -3.013658, 2.872545, 0.3686275, 0, 1, 1,
0.6315176, -0.852604, 1.019982, 0.372549, 0, 1, 1,
0.6325986, 0.4631169, -0.129665, 0.3803922, 0, 1, 1,
0.6333278, 0.5445261, 1.846985, 0.3843137, 0, 1, 1,
0.6427014, 0.7850268, 0.8196291, 0.3921569, 0, 1, 1,
0.6475285, -0.0986385, -0.1937308, 0.3960784, 0, 1, 1,
0.6497267, 2.375721, 0.3827259, 0.4039216, 0, 1, 1,
0.651163, -0.2940269, 1.326343, 0.4117647, 0, 1, 1,
0.6517659, 1.537318, -0.1258702, 0.4156863, 0, 1, 1,
0.6527025, -0.2293437, 1.452302, 0.4235294, 0, 1, 1,
0.6540028, -0.1956405, 2.558507, 0.427451, 0, 1, 1,
0.6549715, -1.092042, 1.843353, 0.4352941, 0, 1, 1,
0.6564246, -0.5747995, 2.798133, 0.4392157, 0, 1, 1,
0.6622357, -0.1627042, 1.682337, 0.4470588, 0, 1, 1,
0.6689743, 0.1822473, 3.077419, 0.4509804, 0, 1, 1,
0.6704361, -1.866278, 1.86936, 0.4588235, 0, 1, 1,
0.6720535, -0.3264495, 2.614732, 0.4627451, 0, 1, 1,
0.6728811, -0.5797367, 1.38862, 0.4705882, 0, 1, 1,
0.6740736, 0.2042289, 1.356022, 0.4745098, 0, 1, 1,
0.6745386, 0.2453389, 0.9959136, 0.4823529, 0, 1, 1,
0.6749592, 0.2347253, 0.5656821, 0.4862745, 0, 1, 1,
0.6778391, 0.3901075, 1.521369, 0.4941176, 0, 1, 1,
0.6832002, 0.2613748, 2.544311, 0.5019608, 0, 1, 1,
0.6866711, -0.4742781, -1.252911, 0.5058824, 0, 1, 1,
0.6924307, -1.407999, 2.644236, 0.5137255, 0, 1, 1,
0.6953658, 1.028452, 1.27706, 0.5176471, 0, 1, 1,
0.6980705, 0.5804476, -0.6880194, 0.5254902, 0, 1, 1,
0.7017418, 0.09272023, 1.965675, 0.5294118, 0, 1, 1,
0.7057137, 0.09095044, 1.215323, 0.5372549, 0, 1, 1,
0.7059365, 0.2296823, 0.07678963, 0.5411765, 0, 1, 1,
0.7088977, 0.3478262, 0.853416, 0.5490196, 0, 1, 1,
0.7106079, -0.6475085, 2.295987, 0.5529412, 0, 1, 1,
0.7125655, -0.8388988, 1.977315, 0.5607843, 0, 1, 1,
0.7161316, 1.577611, -1.122181, 0.5647059, 0, 1, 1,
0.7188889, 0.729174, -1.865138, 0.572549, 0, 1, 1,
0.7221355, 0.727637, 0.9957335, 0.5764706, 0, 1, 1,
0.7228884, -1.001495, 4.504515, 0.5843138, 0, 1, 1,
0.7270933, -0.2600439, 0.8401355, 0.5882353, 0, 1, 1,
0.7331727, -1.29099, 1.990629, 0.5960785, 0, 1, 1,
0.7352569, 0.338668, 0.5986564, 0.6039216, 0, 1, 1,
0.7395366, 0.9379324, 0.07765681, 0.6078432, 0, 1, 1,
0.7395586, 1.376706, 0.4247893, 0.6156863, 0, 1, 1,
0.7424041, -0.06516542, 0.4390846, 0.6196079, 0, 1, 1,
0.7455792, 0.4361204, 1.195782, 0.627451, 0, 1, 1,
0.7641625, 0.03383101, 1.337585, 0.6313726, 0, 1, 1,
0.7653904, -0.8567286, 3.251144, 0.6392157, 0, 1, 1,
0.7658954, -1.047998, 3.217216, 0.6431373, 0, 1, 1,
0.7689928, -0.8788321, 2.216547, 0.6509804, 0, 1, 1,
0.7690026, 0.9187545, 0.6851732, 0.654902, 0, 1, 1,
0.7744635, -2.031416, 1.843137, 0.6627451, 0, 1, 1,
0.7792908, 0.3702053, 1.313841, 0.6666667, 0, 1, 1,
0.780843, 1.715912, 0.6348971, 0.6745098, 0, 1, 1,
0.7840224, 0.2541475, 1.636989, 0.6784314, 0, 1, 1,
0.7898273, -0.1942502, 2.747119, 0.6862745, 0, 1, 1,
0.7947541, 0.6005207, 1.643268, 0.6901961, 0, 1, 1,
0.7948187, -1.14075, 3.282029, 0.6980392, 0, 1, 1,
0.7960287, -2.603644, 2.207898, 0.7058824, 0, 1, 1,
0.7961306, -2.28198, 2.069004, 0.7098039, 0, 1, 1,
0.7970142, 0.03546034, 3.256484, 0.7176471, 0, 1, 1,
0.7997944, -0.4675409, 2.952559, 0.7215686, 0, 1, 1,
0.7998047, -1.024667, 2.632575, 0.7294118, 0, 1, 1,
0.8001457, -0.3607548, -0.0201443, 0.7333333, 0, 1, 1,
0.8020005, 0.5025136, 2.006104, 0.7411765, 0, 1, 1,
0.8022696, 0.1312945, 1.771107, 0.7450981, 0, 1, 1,
0.8157323, 0.3307614, 1.553259, 0.7529412, 0, 1, 1,
0.8164836, -0.07532502, 1.649363, 0.7568628, 0, 1, 1,
0.8258255, 0.8275269, 1.573369, 0.7647059, 0, 1, 1,
0.8285557, -1.72435, 0.3828647, 0.7686275, 0, 1, 1,
0.8372689, -0.3437183, 1.422171, 0.7764706, 0, 1, 1,
0.837961, 1.50635, 1.661765, 0.7803922, 0, 1, 1,
0.8391216, 0.6862751, 0.4050866, 0.7882353, 0, 1, 1,
0.8420498, -1.544848, 2.858955, 0.7921569, 0, 1, 1,
0.8444927, 1.182869, -0.5575995, 0.8, 0, 1, 1,
0.8508437, -0.1331465, 2.741636, 0.8078431, 0, 1, 1,
0.8512034, -2.511018, 1.963658, 0.8117647, 0, 1, 1,
0.8528468, -0.1666647, 3.008273, 0.8196079, 0, 1, 1,
0.8532023, 0.8425837, 0.830577, 0.8235294, 0, 1, 1,
0.856642, -1.389508, 1.960766, 0.8313726, 0, 1, 1,
0.8612636, -2.546636, 1.926757, 0.8352941, 0, 1, 1,
0.8638884, 1.116431, 1.599025, 0.8431373, 0, 1, 1,
0.8642769, 2.35525, -0.1433593, 0.8470588, 0, 1, 1,
0.8682803, 0.4503755, 1.693241, 0.854902, 0, 1, 1,
0.8731238, 2.115323, -0.654349, 0.8588235, 0, 1, 1,
0.8750382, 1.988621, -0.3780454, 0.8666667, 0, 1, 1,
0.8817537, -0.5856828, 1.837073, 0.8705882, 0, 1, 1,
0.8828112, 0.06327945, 0.9235586, 0.8784314, 0, 1, 1,
0.8877516, 0.4013827, 1.003485, 0.8823529, 0, 1, 1,
0.8949055, 0.6990651, 2.760749, 0.8901961, 0, 1, 1,
0.8992478, 0.05130644, 2.299464, 0.8941177, 0, 1, 1,
0.900076, 0.6032139, -0.2264191, 0.9019608, 0, 1, 1,
0.9029923, -0.2842855, 2.152624, 0.9098039, 0, 1, 1,
0.9073737, 1.540135, 0.8783076, 0.9137255, 0, 1, 1,
0.9088971, -0.5724353, 0.3133149, 0.9215686, 0, 1, 1,
0.9270289, -1.181138, 2.913761, 0.9254902, 0, 1, 1,
0.9376605, -0.5280373, 0.3477656, 0.9333333, 0, 1, 1,
0.9430672, -0.8598757, 3.498389, 0.9372549, 0, 1, 1,
0.9465697, 0.5554157, 0.5687576, 0.945098, 0, 1, 1,
0.9508417, 0.01654015, 2.347949, 0.9490196, 0, 1, 1,
0.9536142, -0.4110652, 1.979981, 0.9568627, 0, 1, 1,
0.9537719, -1.049132, 2.933641, 0.9607843, 0, 1, 1,
0.9575892, -0.6883519, 0.9938445, 0.9686275, 0, 1, 1,
0.9605916, 1.141396, 1.619139, 0.972549, 0, 1, 1,
0.9614018, 0.4349544, 0.7924787, 0.9803922, 0, 1, 1,
0.9665422, 0.3457798, 1.205126, 0.9843137, 0, 1, 1,
0.980745, 0.7286509, 0.4355066, 0.9921569, 0, 1, 1,
0.9856782, -0.1218669, 1.734218, 0.9960784, 0, 1, 1,
0.9905933, 0.1233046, 1.91574, 1, 0, 0.9960784, 1,
0.993512, 1.160657, 2.115541, 1, 0, 0.9882353, 1,
1.000848, -1.576894, 3.318074, 1, 0, 0.9843137, 1,
1.001067, -0.2208504, 3.197696, 1, 0, 0.9764706, 1,
1.003843, -0.5753464, 3.475902, 1, 0, 0.972549, 1,
1.00704, 0.5351927, 0.9816645, 1, 0, 0.9647059, 1,
1.009421, 1.716008, 0.6181519, 1, 0, 0.9607843, 1,
1.01451, -0.968449, 3.019002, 1, 0, 0.9529412, 1,
1.016372, 0.3452152, 1.762569, 1, 0, 0.9490196, 1,
1.017801, -1.462102, 2.059357, 1, 0, 0.9411765, 1,
1.023993, -0.9839745, 0.7151473, 1, 0, 0.9372549, 1,
1.032146, 1.102593, 1.960446, 1, 0, 0.9294118, 1,
1.033886, -0.7038053, 3.258026, 1, 0, 0.9254902, 1,
1.040882, -0.9215692, 2.689879, 1, 0, 0.9176471, 1,
1.041991, -0.3931159, 1.289065, 1, 0, 0.9137255, 1,
1.055056, -0.9572289, 1.843266, 1, 0, 0.9058824, 1,
1.059015, -2.44401, 3.400606, 1, 0, 0.9019608, 1,
1.063357, -0.9762869, 1.988573, 1, 0, 0.8941177, 1,
1.068578, -0.8700289, 5.899839, 1, 0, 0.8862745, 1,
1.072764, -0.8336599, 2.411165, 1, 0, 0.8823529, 1,
1.083696, -0.3330074, 2.155905, 1, 0, 0.8745098, 1,
1.089427, 0.5379196, 0.7891313, 1, 0, 0.8705882, 1,
1.091846, 0.09621453, 1.801191, 1, 0, 0.8627451, 1,
1.1016, 1.184626, -1.203751, 1, 0, 0.8588235, 1,
1.10833, -1.272738, 1.645055, 1, 0, 0.8509804, 1,
1.112116, 0.9715441, 0.1722988, 1, 0, 0.8470588, 1,
1.114462, -0.1973114, -0.07968565, 1, 0, 0.8392157, 1,
1.121589, -1.032925, 3.640793, 1, 0, 0.8352941, 1,
1.123102, -0.2255324, 1.93804, 1, 0, 0.827451, 1,
1.123104, -0.8051199, 1.8321, 1, 0, 0.8235294, 1,
1.127596, 0.8658496, 1.742235, 1, 0, 0.8156863, 1,
1.128568, 1.547195, -0.5320497, 1, 0, 0.8117647, 1,
1.139228, 0.8917533, 0.2123856, 1, 0, 0.8039216, 1,
1.144916, -0.2264201, 3.136566, 1, 0, 0.7960784, 1,
1.151622, -0.934081, 2.392611, 1, 0, 0.7921569, 1,
1.154651, 1.212354, 0.3744287, 1, 0, 0.7843137, 1,
1.161394, 0.4803081, 0.1404014, 1, 0, 0.7803922, 1,
1.166946, 0.6911512, 2.172616, 1, 0, 0.772549, 1,
1.175528, -0.6801576, 1.566922, 1, 0, 0.7686275, 1,
1.186041, 0.7951262, 0.6393983, 1, 0, 0.7607843, 1,
1.19023, 0.3856932, 1.69769, 1, 0, 0.7568628, 1,
1.193086, -1.109809, 0.753884, 1, 0, 0.7490196, 1,
1.194893, -1.431393, 1.530992, 1, 0, 0.7450981, 1,
1.197266, -1.431153, 1.504208, 1, 0, 0.7372549, 1,
1.199563, -0.8220456, 3.062125, 1, 0, 0.7333333, 1,
1.204359, 0.9095703, -1.20716, 1, 0, 0.7254902, 1,
1.213166, -0.3756455, 2.993763, 1, 0, 0.7215686, 1,
1.22149, 0.1038083, -0.9570628, 1, 0, 0.7137255, 1,
1.222425, 0.2680174, 1.831091, 1, 0, 0.7098039, 1,
1.223491, -1.472656, 2.45686, 1, 0, 0.7019608, 1,
1.230621, -1.034404, 3.0227, 1, 0, 0.6941177, 1,
1.238223, 0.6795027, -0.2750092, 1, 0, 0.6901961, 1,
1.23927, 0.07348018, 2.643468, 1, 0, 0.682353, 1,
1.239533, 0.9420072, -0.4759744, 1, 0, 0.6784314, 1,
1.239982, -0.5952834, 2.158791, 1, 0, 0.6705883, 1,
1.250499, -0.590328, 2.654794, 1, 0, 0.6666667, 1,
1.266585, 0.07162909, 1.573544, 1, 0, 0.6588235, 1,
1.283099, -0.2292067, 1.347075, 1, 0, 0.654902, 1,
1.287451, -0.04382648, 2.500165, 1, 0, 0.6470588, 1,
1.288817, -0.4192554, 0.5473622, 1, 0, 0.6431373, 1,
1.289337, 0.8261389, 1.576895, 1, 0, 0.6352941, 1,
1.305913, -1.351189, 4.580352, 1, 0, 0.6313726, 1,
1.306613, 1.490077, -0.6358227, 1, 0, 0.6235294, 1,
1.314094, -0.6416993, 3.07756, 1, 0, 0.6196079, 1,
1.316513, -0.8699951, 1.987603, 1, 0, 0.6117647, 1,
1.320368, 0.05607079, 2.598685, 1, 0, 0.6078432, 1,
1.331575, 0.9769645, 1.085825, 1, 0, 0.6, 1,
1.339369, 1.036362, -0.6917308, 1, 0, 0.5921569, 1,
1.339933, -0.5864849, -0.1296318, 1, 0, 0.5882353, 1,
1.340621, -0.584245, 4.105717, 1, 0, 0.5803922, 1,
1.34149, 2.878586, -0.7042428, 1, 0, 0.5764706, 1,
1.345011, 0.4137248, 3.225799, 1, 0, 0.5686275, 1,
1.346636, 1.641086, 1.106349, 1, 0, 0.5647059, 1,
1.347629, -0.3686124, 3.121751, 1, 0, 0.5568628, 1,
1.349422, 1.520814, 1.483478, 1, 0, 0.5529412, 1,
1.356874, -0.9089276, 2.104394, 1, 0, 0.5450981, 1,
1.357579, -1.955967, 2.96775, 1, 0, 0.5411765, 1,
1.378052, -0.3264155, 1.485316, 1, 0, 0.5333334, 1,
1.378061, 0.8746615, -0.6199198, 1, 0, 0.5294118, 1,
1.381862, -0.352326, 1.905015, 1, 0, 0.5215687, 1,
1.386635, -0.2162184, 2.412115, 1, 0, 0.5176471, 1,
1.388655, -2.485727, 3.196883, 1, 0, 0.509804, 1,
1.396772, 0.2665505, 2.559348, 1, 0, 0.5058824, 1,
1.411238, -1.859095, 3.150758, 1, 0, 0.4980392, 1,
1.417755, 1.320041, 1.238915, 1, 0, 0.4901961, 1,
1.42168, 0.4646669, 0.970033, 1, 0, 0.4862745, 1,
1.425053, 0.2499244, 2.789452, 1, 0, 0.4784314, 1,
1.426789, 1.313724, 1.13594, 1, 0, 0.4745098, 1,
1.432916, 0.2699943, 2.097476, 1, 0, 0.4666667, 1,
1.444919, 1.21991, 1.986315, 1, 0, 0.4627451, 1,
1.450411, -0.427397, 2.904464, 1, 0, 0.454902, 1,
1.455778, -0.420853, 1.537463, 1, 0, 0.4509804, 1,
1.457214, 0.6156182, 0.5723607, 1, 0, 0.4431373, 1,
1.472518, -2.898149, 2.340106, 1, 0, 0.4392157, 1,
1.473518, 0.6415385, 1.220026, 1, 0, 0.4313726, 1,
1.477405, -0.232264, 0.67905, 1, 0, 0.427451, 1,
1.47921, 0.3706238, 2.679634, 1, 0, 0.4196078, 1,
1.481549, 0.8059434, -0.08711609, 1, 0, 0.4156863, 1,
1.483809, 0.2180592, 2.875908, 1, 0, 0.4078431, 1,
1.485272, 0.3058591, 1.856877, 1, 0, 0.4039216, 1,
1.489463, -1.160687, 0.7407839, 1, 0, 0.3960784, 1,
1.495942, 1.182642, 0.8301537, 1, 0, 0.3882353, 1,
1.500111, 0.8710089, 0.2442653, 1, 0, 0.3843137, 1,
1.50191, 0.014119, 0.04200229, 1, 0, 0.3764706, 1,
1.507708, 0.9819762, 2.168425, 1, 0, 0.372549, 1,
1.510678, 1.961021, 0.7575317, 1, 0, 0.3647059, 1,
1.53875, 0.7797962, 1.054103, 1, 0, 0.3607843, 1,
1.543449, 0.6093987, 0.4475407, 1, 0, 0.3529412, 1,
1.580501, -1.10771, 0.07169217, 1, 0, 0.3490196, 1,
1.584825, 0.8825185, 1.924218, 1, 0, 0.3411765, 1,
1.591032, -1.262054, 2.804527, 1, 0, 0.3372549, 1,
1.599671, -0.8001207, 1.788257, 1, 0, 0.3294118, 1,
1.600621, 2.081472, 1.752448, 1, 0, 0.3254902, 1,
1.627411, -0.7693155, 1.464411, 1, 0, 0.3176471, 1,
1.682991, 0.08106448, 0.7898104, 1, 0, 0.3137255, 1,
1.683062, -1.650579, 0.3647692, 1, 0, 0.3058824, 1,
1.707109, 0.1973188, 2.10047, 1, 0, 0.2980392, 1,
1.709769, 1.196942, 0.8436574, 1, 0, 0.2941177, 1,
1.737494, 2.05747, 1.493647, 1, 0, 0.2862745, 1,
1.749515, 0.5489136, 1.673344, 1, 0, 0.282353, 1,
1.75033, 0.948764, 1.543547, 1, 0, 0.2745098, 1,
1.757422, 0.4154568, -0.5242068, 1, 0, 0.2705882, 1,
1.761189, -2.184684, 3.664491, 1, 0, 0.2627451, 1,
1.780061, -1.575894, 2.625928, 1, 0, 0.2588235, 1,
1.787986, 0.5313518, 2.122899, 1, 0, 0.2509804, 1,
1.795844, 0.9917659, 0.7293915, 1, 0, 0.2470588, 1,
1.807863, -1.342926, 2.755672, 1, 0, 0.2392157, 1,
1.81846, 1.763099, 0.7097852, 1, 0, 0.2352941, 1,
1.823997, -0.2876712, 3.020654, 1, 0, 0.227451, 1,
1.831959, 0.7051532, -0.07593875, 1, 0, 0.2235294, 1,
1.83895, 2.385774, -1.390594, 1, 0, 0.2156863, 1,
1.840724, -1.298797, 2.975177, 1, 0, 0.2117647, 1,
1.869252, 0.7753687, 0.3643356, 1, 0, 0.2039216, 1,
1.873256, -0.357934, 1.221473, 1, 0, 0.1960784, 1,
1.905793, 0.08046439, 2.143638, 1, 0, 0.1921569, 1,
1.927839, -0.6209778, 1.508938, 1, 0, 0.1843137, 1,
1.938455, 1.187325, 1.920962, 1, 0, 0.1803922, 1,
1.941485, 0.7882574, 1.441409, 1, 0, 0.172549, 1,
1.965026, 0.1614593, 0.4823137, 1, 0, 0.1686275, 1,
1.966788, 0.08946025, 1.874112, 1, 0, 0.1607843, 1,
1.999808, -0.563025, 0.9830847, 1, 0, 0.1568628, 1,
2.001337, 0.3754095, 3.070947, 1, 0, 0.1490196, 1,
2.003794, -0.8110603, 4.54012, 1, 0, 0.145098, 1,
2.020957, -0.4883936, 1.41088, 1, 0, 0.1372549, 1,
2.056643, -0.386283, 2.682609, 1, 0, 0.1333333, 1,
2.111133, 0.7231666, 2.021971, 1, 0, 0.1254902, 1,
2.128437, 0.4780741, 0.6887263, 1, 0, 0.1215686, 1,
2.151326, -0.6039582, 2.46753, 1, 0, 0.1137255, 1,
2.1634, -1.093296, 2.39375, 1, 0, 0.1098039, 1,
2.20795, 0.5310127, 0.1278511, 1, 0, 0.1019608, 1,
2.270707, 1.239653, 1.380226, 1, 0, 0.09411765, 1,
2.307121, 0.1284554, 1.864545, 1, 0, 0.09019608, 1,
2.320648, -0.9493621, 0.8758911, 1, 0, 0.08235294, 1,
2.332149, -1.142815, 1.86139, 1, 0, 0.07843138, 1,
2.347291, -0.5947417, 2.094404, 1, 0, 0.07058824, 1,
2.405725, 1.536592, 1.563908, 1, 0, 0.06666667, 1,
2.43717, 0.06003654, 2.233128, 1, 0, 0.05882353, 1,
2.450299, 0.4271078, 0.04516781, 1, 0, 0.05490196, 1,
2.474414, 0.4655445, -0.409107, 1, 0, 0.04705882, 1,
2.514297, 0.1868282, 2.010391, 1, 0, 0.04313726, 1,
2.517148, -0.1647494, 0.6882609, 1, 0, 0.03529412, 1,
2.606855, 1.116576, 0.5467489, 1, 0, 0.03137255, 1,
2.617578, 1.876803, 0.3930921, 1, 0, 0.02352941, 1,
2.826212, -0.6697164, 2.011927, 1, 0, 0.01960784, 1,
2.834886, 0.4165906, 1.249757, 1, 0, 0.01176471, 1,
3.002334, -1.430353, 2.752713, 1, 0, 0.007843138, 1
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
-0.1341882, -4.012393, -7.655082, 0, -0.5, 0.5, 0.5,
-0.1341882, -4.012393, -7.655082, 1, -0.5, 0.5, 0.5,
-0.1341882, -4.012393, -7.655082, 1, 1.5, 0.5, 0.5,
-0.1341882, -4.012393, -7.655082, 0, 1.5, 0.5, 0.5
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
-4.333991, -0.067536, -7.655082, 0, -0.5, 0.5, 0.5,
-4.333991, -0.067536, -7.655082, 1, -0.5, 0.5, 0.5,
-4.333991, -0.067536, -7.655082, 1, 1.5, 0.5, 0.5,
-4.333991, -0.067536, -7.655082, 0, 1.5, 0.5, 0.5
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
-4.333991, -4.012393, 0.1046612, 0, -0.5, 0.5, 0.5,
-4.333991, -4.012393, 0.1046612, 1, -0.5, 0.5, 0.5,
-4.333991, -4.012393, 0.1046612, 1, 1.5, 0.5, 0.5,
-4.333991, -4.012393, 0.1046612, 0, 1.5, 0.5, 0.5
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
-3, -3.102041, -5.864372,
3, -3.102041, -5.864372,
-3, -3.102041, -5.864372,
-3, -3.253767, -6.162824,
-2, -3.102041, -5.864372,
-2, -3.253767, -6.162824,
-1, -3.102041, -5.864372,
-1, -3.253767, -6.162824,
0, -3.102041, -5.864372,
0, -3.253767, -6.162824,
1, -3.102041, -5.864372,
1, -3.253767, -6.162824,
2, -3.102041, -5.864372,
2, -3.253767, -6.162824,
3, -3.102041, -5.864372,
3, -3.253767, -6.162824
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
-3, -3.557217, -6.759727, 0, -0.5, 0.5, 0.5,
-3, -3.557217, -6.759727, 1, -0.5, 0.5, 0.5,
-3, -3.557217, -6.759727, 1, 1.5, 0.5, 0.5,
-3, -3.557217, -6.759727, 0, 1.5, 0.5, 0.5,
-2, -3.557217, -6.759727, 0, -0.5, 0.5, 0.5,
-2, -3.557217, -6.759727, 1, -0.5, 0.5, 0.5,
-2, -3.557217, -6.759727, 1, 1.5, 0.5, 0.5,
-2, -3.557217, -6.759727, 0, 1.5, 0.5, 0.5,
-1, -3.557217, -6.759727, 0, -0.5, 0.5, 0.5,
-1, -3.557217, -6.759727, 1, -0.5, 0.5, 0.5,
-1, -3.557217, -6.759727, 1, 1.5, 0.5, 0.5,
-1, -3.557217, -6.759727, 0, 1.5, 0.5, 0.5,
0, -3.557217, -6.759727, 0, -0.5, 0.5, 0.5,
0, -3.557217, -6.759727, 1, -0.5, 0.5, 0.5,
0, -3.557217, -6.759727, 1, 1.5, 0.5, 0.5,
0, -3.557217, -6.759727, 0, 1.5, 0.5, 0.5,
1, -3.557217, -6.759727, 0, -0.5, 0.5, 0.5,
1, -3.557217, -6.759727, 1, -0.5, 0.5, 0.5,
1, -3.557217, -6.759727, 1, 1.5, 0.5, 0.5,
1, -3.557217, -6.759727, 0, 1.5, 0.5, 0.5,
2, -3.557217, -6.759727, 0, -0.5, 0.5, 0.5,
2, -3.557217, -6.759727, 1, -0.5, 0.5, 0.5,
2, -3.557217, -6.759727, 1, 1.5, 0.5, 0.5,
2, -3.557217, -6.759727, 0, 1.5, 0.5, 0.5,
3, -3.557217, -6.759727, 0, -0.5, 0.5, 0.5,
3, -3.557217, -6.759727, 1, -0.5, 0.5, 0.5,
3, -3.557217, -6.759727, 1, 1.5, 0.5, 0.5,
3, -3.557217, -6.759727, 0, 1.5, 0.5, 0.5
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
-3.364806, -3, -5.864372,
-3.364806, 2, -5.864372,
-3.364806, -3, -5.864372,
-3.526337, -3, -6.162824,
-3.364806, -2, -5.864372,
-3.526337, -2, -6.162824,
-3.364806, -1, -5.864372,
-3.526337, -1, -6.162824,
-3.364806, 0, -5.864372,
-3.526337, 0, -6.162824,
-3.364806, 1, -5.864372,
-3.526337, 1, -6.162824,
-3.364806, 2, -5.864372,
-3.526337, 2, -6.162824
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
-3.849399, -3, -6.759727, 0, -0.5, 0.5, 0.5,
-3.849399, -3, -6.759727, 1, -0.5, 0.5, 0.5,
-3.849399, -3, -6.759727, 1, 1.5, 0.5, 0.5,
-3.849399, -3, -6.759727, 0, 1.5, 0.5, 0.5,
-3.849399, -2, -6.759727, 0, -0.5, 0.5, 0.5,
-3.849399, -2, -6.759727, 1, -0.5, 0.5, 0.5,
-3.849399, -2, -6.759727, 1, 1.5, 0.5, 0.5,
-3.849399, -2, -6.759727, 0, 1.5, 0.5, 0.5,
-3.849399, -1, -6.759727, 0, -0.5, 0.5, 0.5,
-3.849399, -1, -6.759727, 1, -0.5, 0.5, 0.5,
-3.849399, -1, -6.759727, 1, 1.5, 0.5, 0.5,
-3.849399, -1, -6.759727, 0, 1.5, 0.5, 0.5,
-3.849399, 0, -6.759727, 0, -0.5, 0.5, 0.5,
-3.849399, 0, -6.759727, 1, -0.5, 0.5, 0.5,
-3.849399, 0, -6.759727, 1, 1.5, 0.5, 0.5,
-3.849399, 0, -6.759727, 0, 1.5, 0.5, 0.5,
-3.849399, 1, -6.759727, 0, -0.5, 0.5, 0.5,
-3.849399, 1, -6.759727, 1, -0.5, 0.5, 0.5,
-3.849399, 1, -6.759727, 1, 1.5, 0.5, 0.5,
-3.849399, 1, -6.759727, 0, 1.5, 0.5, 0.5,
-3.849399, 2, -6.759727, 0, -0.5, 0.5, 0.5,
-3.849399, 2, -6.759727, 1, -0.5, 0.5, 0.5,
-3.849399, 2, -6.759727, 1, 1.5, 0.5, 0.5,
-3.849399, 2, -6.759727, 0, 1.5, 0.5, 0.5
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
-3.364806, -3.102041, -4,
-3.364806, -3.102041, 4,
-3.364806, -3.102041, -4,
-3.526337, -3.253767, -4,
-3.364806, -3.102041, -2,
-3.526337, -3.253767, -2,
-3.364806, -3.102041, 0,
-3.526337, -3.253767, 0,
-3.364806, -3.102041, 2,
-3.526337, -3.253767, 2,
-3.364806, -3.102041, 4,
-3.526337, -3.253767, 4
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
-3.849399, -3.557217, -4, 0, -0.5, 0.5, 0.5,
-3.849399, -3.557217, -4, 1, -0.5, 0.5, 0.5,
-3.849399, -3.557217, -4, 1, 1.5, 0.5, 0.5,
-3.849399, -3.557217, -4, 0, 1.5, 0.5, 0.5,
-3.849399, -3.557217, -2, 0, -0.5, 0.5, 0.5,
-3.849399, -3.557217, -2, 1, -0.5, 0.5, 0.5,
-3.849399, -3.557217, -2, 1, 1.5, 0.5, 0.5,
-3.849399, -3.557217, -2, 0, 1.5, 0.5, 0.5,
-3.849399, -3.557217, 0, 0, -0.5, 0.5, 0.5,
-3.849399, -3.557217, 0, 1, -0.5, 0.5, 0.5,
-3.849399, -3.557217, 0, 1, 1.5, 0.5, 0.5,
-3.849399, -3.557217, 0, 0, 1.5, 0.5, 0.5,
-3.849399, -3.557217, 2, 0, -0.5, 0.5, 0.5,
-3.849399, -3.557217, 2, 1, -0.5, 0.5, 0.5,
-3.849399, -3.557217, 2, 1, 1.5, 0.5, 0.5,
-3.849399, -3.557217, 2, 0, 1.5, 0.5, 0.5,
-3.849399, -3.557217, 4, 0, -0.5, 0.5, 0.5,
-3.849399, -3.557217, 4, 1, -0.5, 0.5, 0.5,
-3.849399, -3.557217, 4, 1, 1.5, 0.5, 0.5,
-3.849399, -3.557217, 4, 0, 1.5, 0.5, 0.5
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
-3.364806, -3.102041, -5.864372,
-3.364806, 2.966969, -5.864372,
-3.364806, -3.102041, 6.073694,
-3.364806, 2.966969, 6.073694,
-3.364806, -3.102041, -5.864372,
-3.364806, -3.102041, 6.073694,
-3.364806, 2.966969, -5.864372,
-3.364806, 2.966969, 6.073694,
-3.364806, -3.102041, -5.864372,
3.09643, -3.102041, -5.864372,
-3.364806, -3.102041, 6.073694,
3.09643, -3.102041, 6.073694,
-3.364806, 2.966969, -5.864372,
3.09643, 2.966969, -5.864372,
-3.364806, 2.966969, 6.073694,
3.09643, 2.966969, 6.073694,
3.09643, -3.102041, -5.864372,
3.09643, 2.966969, -5.864372,
3.09643, -3.102041, 6.073694,
3.09643, 2.966969, 6.073694,
3.09643, -3.102041, -5.864372,
3.09643, -3.102041, 6.073694,
3.09643, 2.966969, -5.864372,
3.09643, 2.966969, 6.073694
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
var radius = 7.93995;
var distance = 35.32573;
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
mvMatrix.translate( 0.1341882, 0.067536, -0.1046612 );
mvMatrix.scale( 1.328667, 1.414535, 0.7191139 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.32573);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.27071, 1.568243, -1.80495, 0, 0, 1, 1, 1,
-3.149719, 0.9824594, -0.09946723, 1, 0, 0, 1, 1,
-3.147225, -0.03074041, -2.461456, 1, 0, 0, 1, 1,
-2.930994, 0.2781844, -1.120239, 1, 0, 0, 1, 1,
-2.813208, -0.5670041, -1.294498, 1, 0, 0, 1, 1,
-2.809466, 0.2005654, -3.034873, 1, 0, 0, 1, 1,
-2.783471, 1.517501, -1.056925, 0, 0, 0, 1, 1,
-2.774574, 0.7220131, 1.349766, 0, 0, 0, 1, 1,
-2.668701, 0.3354345, -1.516354, 0, 0, 0, 1, 1,
-2.597511, -0.9733316, -0.7088124, 0, 0, 0, 1, 1,
-2.537307, -1.552809, -3.714517, 0, 0, 0, 1, 1,
-2.534443, 0.5799173, -2.660924, 0, 0, 0, 1, 1,
-2.515394, -0.9052214, -1.973293, 0, 0, 0, 1, 1,
-2.356153, -0.04030775, -1.917217, 1, 1, 1, 1, 1,
-2.270576, 0.1207018, -1.365976, 1, 1, 1, 1, 1,
-2.249354, -0.3790286, -1.472769, 1, 1, 1, 1, 1,
-2.241706, -1.29301, -1.5433, 1, 1, 1, 1, 1,
-2.22924, -0.7405794, -0.9108363, 1, 1, 1, 1, 1,
-2.228864, 1.069179, -0.8743806, 1, 1, 1, 1, 1,
-2.194499, 1.367076, -0.9279796, 1, 1, 1, 1, 1,
-2.188128, 1.86126, -2.031963, 1, 1, 1, 1, 1,
-2.173462, -0.6368877, -3.289096, 1, 1, 1, 1, 1,
-2.105611, -0.4833294, -3.256578, 1, 1, 1, 1, 1,
-2.103556, 0.2511825, -1.831328, 1, 1, 1, 1, 1,
-2.049746, -0.9681824, -1.2815, 1, 1, 1, 1, 1,
-2.043165, -1.931468, -1.710346, 1, 1, 1, 1, 1,
-2.04274, -1.336153, -1.495451, 1, 1, 1, 1, 1,
-2.031687, 1.538054, -2.516673, 1, 1, 1, 1, 1,
-2.004219, -0.1430655, -2.913528, 0, 0, 1, 1, 1,
-1.971192, 0.7605577, 0.9781089, 1, 0, 0, 1, 1,
-1.954282, -0.1040633, -1.673737, 1, 0, 0, 1, 1,
-1.889829, 0.4524272, -0.5896292, 1, 0, 0, 1, 1,
-1.862548, 2.257914, -1.651299, 1, 0, 0, 1, 1,
-1.855186, 1.10794, -1.351712, 1, 0, 0, 1, 1,
-1.847403, -0.389901, -0.2379297, 0, 0, 0, 1, 1,
-1.796494, -0.4446183, -2.264959, 0, 0, 0, 1, 1,
-1.792822, -0.1965425, -2.230265, 0, 0, 0, 1, 1,
-1.773946, 0.44743, -0.6875638, 0, 0, 0, 1, 1,
-1.764797, -0.7665413, -2.407119, 0, 0, 0, 1, 1,
-1.745406, -1.223248, -3.037682, 0, 0, 0, 1, 1,
-1.738377, -0.4862981, -2.421737, 0, 0, 0, 1, 1,
-1.735283, -0.113661, -2.236543, 1, 1, 1, 1, 1,
-1.735088, -0.7827898, -1.843237, 1, 1, 1, 1, 1,
-1.73219, -1.39606, -2.212455, 1, 1, 1, 1, 1,
-1.72741, -0.3771605, -2.358374, 1, 1, 1, 1, 1,
-1.711735, -0.7295638, -1.827703, 1, 1, 1, 1, 1,
-1.710901, -0.8461806, -2.23391, 1, 1, 1, 1, 1,
-1.682854, 0.1593032, -2.192259, 1, 1, 1, 1, 1,
-1.674219, -0.005559524, -2.511998, 1, 1, 1, 1, 1,
-1.668773, 0.6633435, -2.938157, 1, 1, 1, 1, 1,
-1.623068, 0.7858802, -0.2742405, 1, 1, 1, 1, 1,
-1.617507, 0.9317812, -0.5863452, 1, 1, 1, 1, 1,
-1.615952, -2.326694, -2.356618, 1, 1, 1, 1, 1,
-1.610572, -0.1430209, -2.774373, 1, 1, 1, 1, 1,
-1.600165, 0.4978761, -1.833097, 1, 1, 1, 1, 1,
-1.59532, -0.82254, -3.169102, 1, 1, 1, 1, 1,
-1.58921, -0.8631765, -0.3752686, 0, 0, 1, 1, 1,
-1.586849, -0.6765469, -1.359619, 1, 0, 0, 1, 1,
-1.573621, -0.9015883, -2.397032, 1, 0, 0, 1, 1,
-1.567148, 0.8162051, -0.8882347, 1, 0, 0, 1, 1,
-1.566649, -1.639881, -2.455177, 1, 0, 0, 1, 1,
-1.565489, -0.1153343, -2.261247, 1, 0, 0, 1, 1,
-1.563358, -0.9499933, -0.9229587, 0, 0, 0, 1, 1,
-1.547684, -0.7822256, -0.8937817, 0, 0, 0, 1, 1,
-1.546412, -1.748387, -1.002884, 0, 0, 0, 1, 1,
-1.534261, -1.340546, -3.051608, 0, 0, 0, 1, 1,
-1.532192, -0.4437014, -2.821748, 0, 0, 0, 1, 1,
-1.524608, 0.3820391, -1.45929, 0, 0, 0, 1, 1,
-1.518009, 1.407769, 0.01905962, 0, 0, 0, 1, 1,
-1.517704, -1.111781, -2.406962, 1, 1, 1, 1, 1,
-1.500407, 0.3530768, -1.701667, 1, 1, 1, 1, 1,
-1.477512, 0.9379746, -1.951654, 1, 1, 1, 1, 1,
-1.4771, 2.082997, 0.3844756, 1, 1, 1, 1, 1,
-1.468535, 0.5914278, 0.5851959, 1, 1, 1, 1, 1,
-1.468415, -0.2206773, -1.775328, 1, 1, 1, 1, 1,
-1.4672, 0.5150014, -0.9097795, 1, 1, 1, 1, 1,
-1.461457, -0.6923378, -3.144719, 1, 1, 1, 1, 1,
-1.455109, -0.7339907, -2.071081, 1, 1, 1, 1, 1,
-1.449156, -0.1266931, -2.17844, 1, 1, 1, 1, 1,
-1.446131, -0.3104933, -1.067786, 1, 1, 1, 1, 1,
-1.441007, -0.07980722, -1.044797, 1, 1, 1, 1, 1,
-1.437647, 0.1179402, -1.341781, 1, 1, 1, 1, 1,
-1.428513, 0.7938906, -1.420873, 1, 1, 1, 1, 1,
-1.425856, 0.2689886, -0.6477531, 1, 1, 1, 1, 1,
-1.420655, -0.08131345, -2.766981, 0, 0, 1, 1, 1,
-1.420448, -0.2491025, -1.75014, 1, 0, 0, 1, 1,
-1.415349, -1.72414, 0.104465, 1, 0, 0, 1, 1,
-1.409269, -0.5781579, 0.1932691, 1, 0, 0, 1, 1,
-1.404919, 0.6167406, -0.6369755, 1, 0, 0, 1, 1,
-1.392453, 0.5586708, -1.301141, 1, 0, 0, 1, 1,
-1.385694, 1.337738, -0.9858413, 0, 0, 0, 1, 1,
-1.384922, -0.2671975, -2.55854, 0, 0, 0, 1, 1,
-1.382693, -0.07409973, -0.7288492, 0, 0, 0, 1, 1,
-1.369804, 0.1918771, -1.023396, 0, 0, 0, 1, 1,
-1.366633, -2.471668, -3.162134, 0, 0, 0, 1, 1,
-1.35704, -0.4677389, -0.9321902, 0, 0, 0, 1, 1,
-1.343841, 0.3887881, -2.964996, 0, 0, 0, 1, 1,
-1.325507, 0.1879533, -1.844367, 1, 1, 1, 1, 1,
-1.323195, 0.5564845, -2.05168, 1, 1, 1, 1, 1,
-1.314647, -0.8811571, -1.601747, 1, 1, 1, 1, 1,
-1.313408, -1.272324, -5.690516, 1, 1, 1, 1, 1,
-1.307043, 1.165546, 0.4370301, 1, 1, 1, 1, 1,
-1.307036, -0.1668456, -1.057914, 1, 1, 1, 1, 1,
-1.304196, -0.6650161, -2.283749, 1, 1, 1, 1, 1,
-1.302652, 0.2515648, -1.787995, 1, 1, 1, 1, 1,
-1.300587, 0.1890386, 0.4997921, 1, 1, 1, 1, 1,
-1.296968, -0.06879121, -3.431292, 1, 1, 1, 1, 1,
-1.291894, 1.295294, -1.145318, 1, 1, 1, 1, 1,
-1.287178, 0.8825039, 0.3236096, 1, 1, 1, 1, 1,
-1.283172, -0.4485812, -2.14327, 1, 1, 1, 1, 1,
-1.282359, -1.265013, -1.175803, 1, 1, 1, 1, 1,
-1.272916, -0.04990971, -1.012931, 1, 1, 1, 1, 1,
-1.267731, -1.529854, -2.500212, 0, 0, 1, 1, 1,
-1.264731, -0.004175284, -1.464159, 1, 0, 0, 1, 1,
-1.26149, -0.8082487, -2.78614, 1, 0, 0, 1, 1,
-1.253376, -0.02668933, -1.28134, 1, 0, 0, 1, 1,
-1.24846, 1.020916, -0.7579784, 1, 0, 0, 1, 1,
-1.241802, 0.8767222, -0.4323243, 1, 0, 0, 1, 1,
-1.241403, 0.9415035, -0.8768343, 0, 0, 0, 1, 1,
-1.233599, -0.6045086, -0.4691049, 0, 0, 0, 1, 1,
-1.232617, -0.1465994, 0.05848347, 0, 0, 0, 1, 1,
-1.220441, -0.5684079, -2.081625, 0, 0, 0, 1, 1,
-1.214826, -0.2335935, -1.975836, 0, 0, 0, 1, 1,
-1.200189, 0.2362171, -2.65033, 0, 0, 0, 1, 1,
-1.198594, -0.08771353, -2.10771, 0, 0, 0, 1, 1,
-1.197812, -0.5262874, -2.186905, 1, 1, 1, 1, 1,
-1.19096, -1.130028, -2.673941, 1, 1, 1, 1, 1,
-1.177176, -0.3923374, -5.016809, 1, 1, 1, 1, 1,
-1.160784, -1.189505, -2.281388, 1, 1, 1, 1, 1,
-1.156654, -0.7855447, -1.879023, 1, 1, 1, 1, 1,
-1.1564, -1.292711, -1.912214, 1, 1, 1, 1, 1,
-1.151407, 0.2972991, -2.10658, 1, 1, 1, 1, 1,
-1.147019, 0.8005766, -1.841783, 1, 1, 1, 1, 1,
-1.146441, 1.682314, -0.8450911, 1, 1, 1, 1, 1,
-1.129238, 0.9833688, 0.3060682, 1, 1, 1, 1, 1,
-1.126965, -1.846191, -3.119363, 1, 1, 1, 1, 1,
-1.121073, -1.302443, -1.876528, 1, 1, 1, 1, 1,
-1.120002, 0.229503, -2.67466, 1, 1, 1, 1, 1,
-1.111727, -1.037483, -1.98684, 1, 1, 1, 1, 1,
-1.111219, -1.689635, -2.994507, 1, 1, 1, 1, 1,
-1.098006, -0.912406, -1.8906, 0, 0, 1, 1, 1,
-1.096151, -0.6735668, -2.131758, 1, 0, 0, 1, 1,
-1.0895, -1.256885, -1.832311, 1, 0, 0, 1, 1,
-1.084283, -0.3547103, -4.121862, 1, 0, 0, 1, 1,
-1.07525, 0.2865844, -1.843428, 1, 0, 0, 1, 1,
-1.070745, -0.3170011, -1.187384, 1, 0, 0, 1, 1,
-1.053903, -0.6877029, -1.924036, 0, 0, 0, 1, 1,
-1.047812, 1.292329, -0.06733213, 0, 0, 0, 1, 1,
-1.040362, 0.1893236, -1.758186, 0, 0, 0, 1, 1,
-1.039818, 1.952209, 0.06175885, 0, 0, 0, 1, 1,
-1.038689, 0.6777636, 0.5588176, 0, 0, 0, 1, 1,
-1.033787, 0.3369426, -2.078464, 0, 0, 0, 1, 1,
-1.033634, -0.865054, -3.817693, 0, 0, 0, 1, 1,
-1.027596, -0.3699011, -0.8511337, 1, 1, 1, 1, 1,
-1.022731, -0.9044646, -0.9823803, 1, 1, 1, 1, 1,
-1.021539, -1.955823, -1.612909, 1, 1, 1, 1, 1,
-1.009894, -0.1959999, -1.722678, 1, 1, 1, 1, 1,
-1.008083, 0.2192275, -0.4032896, 1, 1, 1, 1, 1,
-0.9932545, 0.04032699, -2.123277, 1, 1, 1, 1, 1,
-0.9888117, 1.72371, -0.6931158, 1, 1, 1, 1, 1,
-0.9883727, -0.7431757, -0.5982195, 1, 1, 1, 1, 1,
-0.9880398, -0.05017339, -0.7226427, 1, 1, 1, 1, 1,
-0.9863669, -0.1920477, -0.8498259, 1, 1, 1, 1, 1,
-0.9849304, -0.896099, -2.729779, 1, 1, 1, 1, 1,
-0.9847959, 0.5461926, -0.3947258, 1, 1, 1, 1, 1,
-0.9828822, 0.1371877, -0.5479875, 1, 1, 1, 1, 1,
-0.9736553, -0.4983279, -3.786569, 1, 1, 1, 1, 1,
-0.968888, -1.862871, -1.799635, 1, 1, 1, 1, 1,
-0.9646909, -1.429146, -5.150618, 0, 0, 1, 1, 1,
-0.9625751, 0.313169, 1.194809, 1, 0, 0, 1, 1,
-0.96129, -1.716878, -1.961544, 1, 0, 0, 1, 1,
-0.9548485, 1.248613, -0.7101417, 1, 0, 0, 1, 1,
-0.9529685, -0.2947132, -2.831208, 1, 0, 0, 1, 1,
-0.9486976, 1.043689, -2.51474, 1, 0, 0, 1, 1,
-0.9478067, -0.8460283, -1.393053, 0, 0, 0, 1, 1,
-0.9474254, 0.6919917, 0.08367757, 0, 0, 0, 1, 1,
-0.9464656, 1.415942, -0.4025068, 0, 0, 0, 1, 1,
-0.9425293, 2.3445, -1.446611, 0, 0, 0, 1, 1,
-0.9403365, -1.679197, -3.720214, 0, 0, 0, 1, 1,
-0.9387709, 0.086311, -3.019713, 0, 0, 0, 1, 1,
-0.9317839, 0.4748864, 0.2080021, 0, 0, 0, 1, 1,
-0.9310822, 1.023496, -1.505863, 1, 1, 1, 1, 1,
-0.930488, -1.168783, -2.544168, 1, 1, 1, 1, 1,
-0.9276059, -0.2686159, -1.04519, 1, 1, 1, 1, 1,
-0.9249445, 0.7086077, -0.9241337, 1, 1, 1, 1, 1,
-0.91885, 0.4194537, -1.677717, 1, 1, 1, 1, 1,
-0.9094402, 1.588105, -1.424125, 1, 1, 1, 1, 1,
-0.9062579, 0.3970686, 0.48988, 1, 1, 1, 1, 1,
-0.8967864, 0.05508946, -1.712658, 1, 1, 1, 1, 1,
-0.8935248, -1.196736, -2.813475, 1, 1, 1, 1, 1,
-0.8922049, -0.2161216, -1.965695, 1, 1, 1, 1, 1,
-0.8901451, -1.735949, -2.972722, 1, 1, 1, 1, 1,
-0.8895247, -0.1865464, -2.224345, 1, 1, 1, 1, 1,
-0.8887506, -1.817961, -4.037342, 1, 1, 1, 1, 1,
-0.8867281, -0.2276932, -2.079134, 1, 1, 1, 1, 1,
-0.8866394, 0.2926663, -2.15853, 1, 1, 1, 1, 1,
-0.8862156, -1.061729, -1.938592, 0, 0, 1, 1, 1,
-0.8834946, 0.2598367, -0.768881, 1, 0, 0, 1, 1,
-0.8756635, 0.08691902, -0.9743155, 1, 0, 0, 1, 1,
-0.8725202, 1.445191, 0.2476677, 1, 0, 0, 1, 1,
-0.8663525, -0.01169727, 0.02952714, 1, 0, 0, 1, 1,
-0.8615171, 0.5751067, 1.677296, 1, 0, 0, 1, 1,
-0.8581917, -1.392228, -2.562564, 0, 0, 0, 1, 1,
-0.8571566, -1.273276, -1.2662, 0, 0, 0, 1, 1,
-0.8544037, -0.1398721, -0.7118534, 0, 0, 0, 1, 1,
-0.8417678, -0.02132518, -0.7612643, 0, 0, 0, 1, 1,
-0.8406902, 0.999491, -1.906662, 0, 0, 0, 1, 1,
-0.8364669, 0.1219092, -1.586336, 0, 0, 0, 1, 1,
-0.8346002, 0.8394762, -0.2582633, 0, 0, 0, 1, 1,
-0.8344812, 2.251179, 0.4554155, 1, 1, 1, 1, 1,
-0.8321346, 0.4129067, -2.727577, 1, 1, 1, 1, 1,
-0.8234276, 0.3214819, -0.6684988, 1, 1, 1, 1, 1,
-0.8224276, -1.150177, -2.526168, 1, 1, 1, 1, 1,
-0.8088494, -0.4292228, -1.942568, 1, 1, 1, 1, 1,
-0.8065128, 1.343191, -0.5508029, 1, 1, 1, 1, 1,
-0.8041983, -0.2673605, -2.110489, 1, 1, 1, 1, 1,
-0.803985, 1.458374, -1.857545, 1, 1, 1, 1, 1,
-0.8021013, 0.9240322, -0.5624993, 1, 1, 1, 1, 1,
-0.7990646, 0.5962984, -1.049917, 1, 1, 1, 1, 1,
-0.7985812, -0.3473967, -0.1582243, 1, 1, 1, 1, 1,
-0.7976535, -0.01443846, -1.825675, 1, 1, 1, 1, 1,
-0.7876647, 0.3846281, -2.739282, 1, 1, 1, 1, 1,
-0.7816386, -1.329367, -0.619805, 1, 1, 1, 1, 1,
-0.7796742, -0.5257712, -1.869709, 1, 1, 1, 1, 1,
-0.7757199, 0.1888605, -1.806888, 0, 0, 1, 1, 1,
-0.7706372, -0.6870379, -3.389139, 1, 0, 0, 1, 1,
-0.7688986, -0.1115089, 0.2813828, 1, 0, 0, 1, 1,
-0.768528, -0.463372, -3.044101, 1, 0, 0, 1, 1,
-0.7632633, -1.405391, -2.079782, 1, 0, 0, 1, 1,
-0.7602333, -0.725193, -2.416246, 1, 0, 0, 1, 1,
-0.7570381, 0.7520905, -0.3497014, 0, 0, 0, 1, 1,
-0.7559034, 2.322988, 1.251074, 0, 0, 0, 1, 1,
-0.7553224, 2.095914, 0.4900424, 0, 0, 0, 1, 1,
-0.7552708, -0.9479966, -0.9667923, 0, 0, 0, 1, 1,
-0.7544139, -1.978125, -3.130358, 0, 0, 0, 1, 1,
-0.7524908, -2.067471, -0.955694, 0, 0, 0, 1, 1,
-0.7508566, 1.171043, -0.9090311, 0, 0, 0, 1, 1,
-0.7490846, -0.7470648, -2.30113, 1, 1, 1, 1, 1,
-0.7488014, 0.4324836, -0.9353004, 1, 1, 1, 1, 1,
-0.7467278, 0.3341822, -1.68317, 1, 1, 1, 1, 1,
-0.7466738, -0.3130442, -2.558229, 1, 1, 1, 1, 1,
-0.7465771, -1.292218, -2.947897, 1, 1, 1, 1, 1,
-0.7458175, -0.5550461, -1.742929, 1, 1, 1, 1, 1,
-0.744295, -0.3632482, -3.988817, 1, 1, 1, 1, 1,
-0.739899, 0.1091779, -1.361095, 1, 1, 1, 1, 1,
-0.7354063, 1.345832, -1.192258, 1, 1, 1, 1, 1,
-0.7248712, 0.2867058, -0.4209414, 1, 1, 1, 1, 1,
-0.7182862, 0.6555043, 0.4450817, 1, 1, 1, 1, 1,
-0.7174961, -0.6688111, -2.337284, 1, 1, 1, 1, 1,
-0.7106845, -0.3074551, -2.25868, 1, 1, 1, 1, 1,
-0.7050239, -1.222607, -2.915774, 1, 1, 1, 1, 1,
-0.698736, 0.07316851, -1.264871, 1, 1, 1, 1, 1,
-0.6956766, 0.2352069, -0.3209247, 0, 0, 1, 1, 1,
-0.6945685, -0.3044175, -2.534388, 1, 0, 0, 1, 1,
-0.6933749, -0.03301528, -0.9333872, 1, 0, 0, 1, 1,
-0.6931819, -0.2084379, -0.4608818, 1, 0, 0, 1, 1,
-0.6911225, -0.5417664, -2.683336, 1, 0, 0, 1, 1,
-0.690073, 0.6647348, -0.9807008, 1, 0, 0, 1, 1,
-0.6823006, 0.9447181, 0.3269997, 0, 0, 0, 1, 1,
-0.6822712, 0.828977, -0.7869952, 0, 0, 0, 1, 1,
-0.6816805, -0.05428845, -1.636757, 0, 0, 0, 1, 1,
-0.6803827, -0.2075299, -1.884275, 0, 0, 0, 1, 1,
-0.6798538, 0.566506, -2.447096, 0, 0, 0, 1, 1,
-0.6797214, 0.9607917, -0.3106201, 0, 0, 0, 1, 1,
-0.676641, 1.189779, 0.2610474, 0, 0, 0, 1, 1,
-0.6740641, 1.465994, 0.6434308, 1, 1, 1, 1, 1,
-0.6676581, -0.676232, -4.170199, 1, 1, 1, 1, 1,
-0.661841, 0.3150685, -2.066102, 1, 1, 1, 1, 1,
-0.6578875, 2.734296, -1.119292, 1, 1, 1, 1, 1,
-0.6509392, 1.577007, -2.403101, 1, 1, 1, 1, 1,
-0.6461448, -0.6246938, -4.476344, 1, 1, 1, 1, 1,
-0.6450717, 0.8632773, -1.096354, 1, 1, 1, 1, 1,
-0.644037, -1.212823, -4.197798, 1, 1, 1, 1, 1,
-0.6425024, 0.1315714, -1.892244, 1, 1, 1, 1, 1,
-0.6413523, 0.2929367, -0.2719458, 1, 1, 1, 1, 1,
-0.6395835, -1.122646, -2.675456, 1, 1, 1, 1, 1,
-0.6322891, 0.1577827, -0.3708953, 1, 1, 1, 1, 1,
-0.6255922, 0.3684402, -0.9860787, 1, 1, 1, 1, 1,
-0.6234943, 1.147307, -1.085864, 1, 1, 1, 1, 1,
-0.622809, -0.1788832, -1.282355, 1, 1, 1, 1, 1,
-0.6193818, -0.064308, -3.339706, 0, 0, 1, 1, 1,
-0.6192439, -0.8155883, -2.479398, 1, 0, 0, 1, 1,
-0.6144868, 1.690703, -0.5222793, 1, 0, 0, 1, 1,
-0.6123487, 1.124363, 0.6843789, 1, 0, 0, 1, 1,
-0.6111273, 1.585006, -1.964319, 1, 0, 0, 1, 1,
-0.6059709, -0.01256423, -2.096413, 1, 0, 0, 1, 1,
-0.605161, 0.7129993, -1.411009, 0, 0, 0, 1, 1,
-0.5973664, 1.226017, 0.7613376, 0, 0, 0, 1, 1,
-0.5879786, 0.7128449, -0.7504755, 0, 0, 0, 1, 1,
-0.5862674, 1.743803, -0.3910578, 0, 0, 0, 1, 1,
-0.5855992, 0.3174782, -2.262959, 0, 0, 0, 1, 1,
-0.5827718, -0.2499138, -2.678026, 0, 0, 0, 1, 1,
-0.5809998, -0.8096966, -2.354591, 0, 0, 0, 1, 1,
-0.5774159, 1.402811, -2.271718, 1, 1, 1, 1, 1,
-0.5773, 1.482856, -1.380256, 1, 1, 1, 1, 1,
-0.5754773, -0.4849647, -2.181026, 1, 1, 1, 1, 1,
-0.5753579, -1.560257, -3.857755, 1, 1, 1, 1, 1,
-0.5740975, 0.1897707, -1.741409, 1, 1, 1, 1, 1,
-0.571368, -0.4526226, -1.302443, 1, 1, 1, 1, 1,
-0.5681676, -1.5742, -4.952832, 1, 1, 1, 1, 1,
-0.5679143, -0.6892352, -2.776026, 1, 1, 1, 1, 1,
-0.5653108, 0.6958502, -1.518083, 1, 1, 1, 1, 1,
-0.5631971, -1.039827, -3.184281, 1, 1, 1, 1, 1,
-0.5625355, 0.3269553, -2.070776, 1, 1, 1, 1, 1,
-0.5566484, -0.2189485, -1.106973, 1, 1, 1, 1, 1,
-0.5532919, -1.619018, -4.17828, 1, 1, 1, 1, 1,
-0.547602, -0.06456088, -2.035984, 1, 1, 1, 1, 1,
-0.544598, 0.1120634, -2.964832, 1, 1, 1, 1, 1,
-0.538859, -0.5827241, -1.449757, 0, 0, 1, 1, 1,
-0.5328699, 1.214878, 0.3518768, 1, 0, 0, 1, 1,
-0.5318059, 0.7793023, -0.0712686, 1, 0, 0, 1, 1,
-0.5313115, 0.1642377, -2.225893, 1, 0, 0, 1, 1,
-0.5296383, -0.9005329, -3.574559, 1, 0, 0, 1, 1,
-0.5296189, -0.3543018, -1.00994, 1, 0, 0, 1, 1,
-0.529278, 0.9603194, -1.472788, 0, 0, 0, 1, 1,
-0.5279197, 0.2628422, -1.303749, 0, 0, 0, 1, 1,
-0.5258448, -1.429171, -4.029995, 0, 0, 0, 1, 1,
-0.5241372, -0.6482667, -1.724408, 0, 0, 0, 1, 1,
-0.5206887, 0.624344, 0.6196777, 0, 0, 0, 1, 1,
-0.5163105, -0.640586, -4.650396, 0, 0, 0, 1, 1,
-0.5114093, -0.3439639, -2.913178, 0, 0, 0, 1, 1,
-0.5084414, 0.4237036, 1.108836, 1, 1, 1, 1, 1,
-0.507038, 0.8178353, -0.8105499, 1, 1, 1, 1, 1,
-0.5035811, 0.9620822, -0.7754274, 1, 1, 1, 1, 1,
-0.4986582, 1.763054, 0.7926224, 1, 1, 1, 1, 1,
-0.4982007, 0.3160521, -1.960501, 1, 1, 1, 1, 1,
-0.4976583, -1.208865, -3.804086, 1, 1, 1, 1, 1,
-0.4935465, 0.500471, 0.543713, 1, 1, 1, 1, 1,
-0.4918101, -0.1568285, -2.521407, 1, 1, 1, 1, 1,
-0.4894274, -0.3617925, -2.909432, 1, 1, 1, 1, 1,
-0.488885, 0.8545488, -1.63331, 1, 1, 1, 1, 1,
-0.487331, 1.853067, 1.895182, 1, 1, 1, 1, 1,
-0.4870268, 1.182492, 0.2126082, 1, 1, 1, 1, 1,
-0.4855718, 0.4709045, -0.8991439, 1, 1, 1, 1, 1,
-0.4834928, 2.312456, 0.903399, 1, 1, 1, 1, 1,
-0.4814155, 0.2955165, -1.117192, 1, 1, 1, 1, 1,
-0.4800719, 0.9180602, -1.119967, 0, 0, 1, 1, 1,
-0.4799067, -1.460029, -2.652797, 1, 0, 0, 1, 1,
-0.4793326, -0.9586697, -3.253662, 1, 0, 0, 1, 1,
-0.4736773, 0.2144281, 1.513881, 1, 0, 0, 1, 1,
-0.4701039, -0.4217323, -1.158015, 1, 0, 0, 1, 1,
-0.4658299, -1.072327, -3.172391, 1, 0, 0, 1, 1,
-0.4603785, -0.8916316, -3.160374, 0, 0, 0, 1, 1,
-0.4585741, -0.6075566, -1.848413, 0, 0, 0, 1, 1,
-0.4507943, -1.569073, -3.126302, 0, 0, 0, 1, 1,
-0.4449221, 0.2075617, 0.3561665, 0, 0, 0, 1, 1,
-0.4406366, -0.3471232, -2.322919, 0, 0, 0, 1, 1,
-0.4163281, 0.09077682, -1.042655, 0, 0, 0, 1, 1,
-0.4094465, 1.34958, -0.568541, 0, 0, 0, 1, 1,
-0.4089696, -0.8525055, -2.528472, 1, 1, 1, 1, 1,
-0.3990683, 0.6399127, -0.3575431, 1, 1, 1, 1, 1,
-0.3982736, 0.2582813, -0.6164504, 1, 1, 1, 1, 1,
-0.3965487, 1.455069, 0.7096094, 1, 1, 1, 1, 1,
-0.393701, -1.060166, -3.352623, 1, 1, 1, 1, 1,
-0.3918401, -0.6770446, -2.176517, 1, 1, 1, 1, 1,
-0.3695818, 0.3028623, -0.9329305, 1, 1, 1, 1, 1,
-0.3681711, -0.9832202, -2.873596, 1, 1, 1, 1, 1,
-0.3624541, -0.2920387, -1.031222, 1, 1, 1, 1, 1,
-0.3591351, -0.2751504, -1.55018, 1, 1, 1, 1, 1,
-0.3578417, -0.7858409, -3.024851, 1, 1, 1, 1, 1,
-0.3471404, 0.4910024, -2.252254, 1, 1, 1, 1, 1,
-0.3459604, -0.1571157, -2.500413, 1, 1, 1, 1, 1,
-0.3417003, -1.119151, -2.145831, 1, 1, 1, 1, 1,
-0.3379104, -1.141498, -3.244811, 1, 1, 1, 1, 1,
-0.3371865, 0.09825395, -1.541566, 0, 0, 1, 1, 1,
-0.3355202, 0.3823276, -1.163, 1, 0, 0, 1, 1,
-0.3340286, -0.3583463, -2.440122, 1, 0, 0, 1, 1,
-0.3332744, 1.622334, 1.0787, 1, 0, 0, 1, 1,
-0.3331655, -0.8665032, -3.673326, 1, 0, 0, 1, 1,
-0.3288478, 0.7976307, -0.5193316, 1, 0, 0, 1, 1,
-0.3252162, 0.310815, -0.5383564, 0, 0, 0, 1, 1,
-0.3244328, -1.453306, -3.134025, 0, 0, 0, 1, 1,
-0.3220733, 1.408639, -0.196654, 0, 0, 0, 1, 1,
-0.3121428, 0.8325457, -0.3266945, 0, 0, 0, 1, 1,
-0.3083435, -0.5181865, -2.820933, 0, 0, 0, 1, 1,
-0.3015568, -0.7571049, -2.750504, 0, 0, 0, 1, 1,
-0.3004413, -0.1936624, -2.680319, 0, 0, 0, 1, 1,
-0.2994134, -0.1847048, -2.47449, 1, 1, 1, 1, 1,
-0.2976426, -1.72689, -3.78942, 1, 1, 1, 1, 1,
-0.2965783, -0.9040416, -2.262748, 1, 1, 1, 1, 1,
-0.2951429, -0.1996809, -2.203453, 1, 1, 1, 1, 1,
-0.2949441, 0.3807396, -1.323416, 1, 1, 1, 1, 1,
-0.2879503, -0.8613164, -3.127958, 1, 1, 1, 1, 1,
-0.2762677, 1.545495, -0.9458829, 1, 1, 1, 1, 1,
-0.2750307, 1.066913, 0.7406509, 1, 1, 1, 1, 1,
-0.2711193, 1.004149, -0.6747515, 1, 1, 1, 1, 1,
-0.270558, -1.986444, -2.542633, 1, 1, 1, 1, 1,
-0.2691336, 1.706295, 0.6231948, 1, 1, 1, 1, 1,
-0.2670606, 1.323225, -1.354117, 1, 1, 1, 1, 1,
-0.2642975, 1.299647, 1.089359, 1, 1, 1, 1, 1,
-0.2593145, -0.8313353, -2.64897, 1, 1, 1, 1, 1,
-0.2491305, -0.728431, -1.474809, 1, 1, 1, 1, 1,
-0.2443, -0.989594, -2.273906, 0, 0, 1, 1, 1,
-0.2430224, -1.290951, -2.781997, 1, 0, 0, 1, 1,
-0.2416533, -1.09931, -3.314408, 1, 0, 0, 1, 1,
-0.2358693, 1.591053, 0.2775175, 1, 0, 0, 1, 1,
-0.2357007, 0.6776082, 1.465078, 1, 0, 0, 1, 1,
-0.2350443, 0.5965247, 0.04473185, 1, 0, 0, 1, 1,
-0.2338284, 2.098382, -0.7321061, 0, 0, 0, 1, 1,
-0.2324397, 2.434884, -0.9356482, 0, 0, 0, 1, 1,
-0.2297157, -1.096001, -3.654388, 0, 0, 0, 1, 1,
-0.2278595, 1.244606, 1.44925, 0, 0, 0, 1, 1,
-0.2262744, -1.84831, -1.17284, 0, 0, 0, 1, 1,
-0.2253603, -0.03467731, -1.717367, 0, 0, 0, 1, 1,
-0.2221892, -0.5202496, -1.6396, 0, 0, 0, 1, 1,
-0.2219644, -0.3518175, -2.688674, 1, 1, 1, 1, 1,
-0.2177679, -0.08344123, -1.322826, 1, 1, 1, 1, 1,
-0.2173945, 0.7180924, 1.372259, 1, 1, 1, 1, 1,
-0.2171715, -1.035792, -2.540677, 1, 1, 1, 1, 1,
-0.2156122, -1.203784, -5.331415, 1, 1, 1, 1, 1,
-0.2137969, -0.6477193, -3.863486, 1, 1, 1, 1, 1,
-0.2114947, -0.6328201, -4.273787, 1, 1, 1, 1, 1,
-0.209414, -1.088867, -4.068412, 1, 1, 1, 1, 1,
-0.201413, 1.234359, -0.5227659, 1, 1, 1, 1, 1,
-0.198694, -0.5217339, -4.420091, 1, 1, 1, 1, 1,
-0.1984696, 1.069609, -0.6782119, 1, 1, 1, 1, 1,
-0.194575, -0.0676399, -1.601884, 1, 1, 1, 1, 1,
-0.1894661, -0.2855888, -1.832868, 1, 1, 1, 1, 1,
-0.1853382, -1.199246, -1.593342, 1, 1, 1, 1, 1,
-0.1833684, -0.3517286, -2.365045, 1, 1, 1, 1, 1,
-0.1823423, 0.7986469, -0.2100458, 0, 0, 1, 1, 1,
-0.1802563, 0.2051741, -1.689834, 1, 0, 0, 1, 1,
-0.1768045, -0.7155083, -2.443006, 1, 0, 0, 1, 1,
-0.1699135, 1.326009, 0.01293269, 1, 0, 0, 1, 1,
-0.1693269, 0.5647007, -1.739312, 1, 0, 0, 1, 1,
-0.1668069, -1.118914, -3.161307, 1, 0, 0, 1, 1,
-0.1642719, 0.05746469, -1.001349, 0, 0, 0, 1, 1,
-0.1589784, 0.2104378, -0.8752049, 0, 0, 0, 1, 1,
-0.1571929, 0.2840239, -0.1421594, 0, 0, 0, 1, 1,
-0.1529529, 0.9086102, -0.3697585, 0, 0, 0, 1, 1,
-0.1522699, -1.159797, -2.101946, 0, 0, 0, 1, 1,
-0.1513888, 0.2333605, 0.3934269, 0, 0, 0, 1, 1,
-0.1508763, 2.863907, 0.7006818, 0, 0, 0, 1, 1,
-0.1498391, 1.457184, 1.305502, 1, 1, 1, 1, 1,
-0.1488519, 1.907112, 0.1541854, 1, 1, 1, 1, 1,
-0.1466963, -1.276846, -3.272998, 1, 1, 1, 1, 1,
-0.146067, 0.6330874, -0.8967444, 1, 1, 1, 1, 1,
-0.1457267, 1.939025, -1.776839, 1, 1, 1, 1, 1,
-0.1453754, -0.7835208, -2.509822, 1, 1, 1, 1, 1,
-0.1398016, -0.9669209, -1.591381, 1, 1, 1, 1, 1,
-0.1395202, -0.5627224, -2.586153, 1, 1, 1, 1, 1,
-0.1336107, 0.1127988, -1.793674, 1, 1, 1, 1, 1,
-0.1314852, -0.1916489, -1.13568, 1, 1, 1, 1, 1,
-0.1293175, -0.7351776, -4.462401, 1, 1, 1, 1, 1,
-0.1257329, -1.17843, -3.583661, 1, 1, 1, 1, 1,
-0.122087, -1.525244, -3.980236, 1, 1, 1, 1, 1,
-0.1209509, -0.2383666, -1.232457, 1, 1, 1, 1, 1,
-0.1186951, -1.197428, -2.703306, 1, 1, 1, 1, 1,
-0.1185495, 0.5578215, -0.1912436, 0, 0, 1, 1, 1,
-0.1184184, 0.2568173, 1.035391, 1, 0, 0, 1, 1,
-0.1122785, -0.608295, -3.151563, 1, 0, 0, 1, 1,
-0.1093785, 0.4988866, -1.104415, 1, 0, 0, 1, 1,
-0.1088311, -1.053477, -2.342167, 1, 0, 0, 1, 1,
-0.1050535, -1.284178, -2.069029, 1, 0, 0, 1, 1,
-0.1038523, -1.079133, -3.202552, 0, 0, 0, 1, 1,
-0.1032483, -0.7242421, -4.607653, 0, 0, 0, 1, 1,
-0.1027631, -0.5801587, -2.664478, 0, 0, 0, 1, 1,
-0.1025434, -1.733455, -4.626645, 0, 0, 0, 1, 1,
-0.1024372, -1.343019, -1.41814, 0, 0, 0, 1, 1,
-0.1010295, -0.7657977, -4.009293, 0, 0, 0, 1, 1,
-0.1001512, -1.782604, -3.410102, 0, 0, 0, 1, 1,
-0.09756351, -0.7576213, -3.967155, 1, 1, 1, 1, 1,
-0.09044262, -0.9166343, -3.152404, 1, 1, 1, 1, 1,
-0.08949866, -0.580484, -3.536278, 1, 1, 1, 1, 1,
-0.08489425, 0.01565694, -0.3479199, 1, 1, 1, 1, 1,
-0.07587305, 1.048744, 0.8769501, 1, 1, 1, 1, 1,
-0.06834663, -0.6575389, -2.832303, 1, 1, 1, 1, 1,
-0.06703497, -1.36684, -2.249249, 1, 1, 1, 1, 1,
-0.0668083, -2.222263, -2.778757, 1, 1, 1, 1, 1,
-0.06570128, 0.389551, 1.19915, 1, 1, 1, 1, 1,
-0.06424657, -0.1525794, -3.219441, 1, 1, 1, 1, 1,
-0.05950661, 0.01619511, -3.780323, 1, 1, 1, 1, 1,
-0.05592428, -1.329072, -3.790422, 1, 1, 1, 1, 1,
-0.05490116, -0.1080326, -1.510932, 1, 1, 1, 1, 1,
-0.05350361, 0.671083, 0.2685796, 1, 1, 1, 1, 1,
-0.0517933, -1.556048, -2.505683, 1, 1, 1, 1, 1,
-0.04777853, -0.8504758, -4.29778, 0, 0, 1, 1, 1,
-0.03948214, -0.5438042, -1.850061, 1, 0, 0, 1, 1,
-0.03792605, -2.042499, -2.619747, 1, 0, 0, 1, 1,
-0.03774793, 0.6440946, 0.3989461, 1, 0, 0, 1, 1,
-0.03741765, 0.6755827, 1.343421, 1, 0, 0, 1, 1,
-0.03684725, 1.518276, 0.181234, 1, 0, 0, 1, 1,
-0.03656242, 0.4402914, -1.844216, 0, 0, 0, 1, 1,
-0.03397294, -0.1528446, -1.840394, 0, 0, 0, 1, 1,
-0.03258844, -1.945804, -4.882149, 0, 0, 0, 1, 1,
-0.02986088, -0.3427075, -4.053207, 0, 0, 0, 1, 1,
-0.02985695, -1.019411, -3.805528, 0, 0, 0, 1, 1,
-0.02737623, -0.2173372, -3.548361, 0, 0, 0, 1, 1,
-0.02299385, 0.4121214, -1.83376, 0, 0, 0, 1, 1,
-0.01908181, -0.3418235, -3.261004, 1, 1, 1, 1, 1,
-0.01904751, -0.06572781, -3.584307, 1, 1, 1, 1, 1,
-0.01858339, -1.033263, -2.959633, 1, 1, 1, 1, 1,
-0.01575938, -0.1033428, -2.059597, 1, 1, 1, 1, 1,
-0.01303502, -1.62525, -3.203485, 1, 1, 1, 1, 1,
-0.007238552, -0.6167029, -3.058786, 1, 1, 1, 1, 1,
-0.003179349, -0.4586405, -2.904032, 1, 1, 1, 1, 1,
-0.002456158, 1.010602, 0.3319216, 1, 1, 1, 1, 1,
0.005674483, -0.9416949, 1.736566, 1, 1, 1, 1, 1,
0.006977086, 0.489335, -0.105468, 1, 1, 1, 1, 1,
0.01276689, -0.02899304, 2.522344, 1, 1, 1, 1, 1,
0.0143322, 0.03994618, 0.3746421, 1, 1, 1, 1, 1,
0.0157344, 1.689793, -0.5848883, 1, 1, 1, 1, 1,
0.01722545, -0.04982979, 2.486924, 1, 1, 1, 1, 1,
0.01788737, -2.061201, 3.358115, 1, 1, 1, 1, 1,
0.01803703, -1.909612, 2.384219, 0, 0, 1, 1, 1,
0.018039, 1.409135, -1.242768, 1, 0, 0, 1, 1,
0.02194847, 0.9485658, 2.051935, 1, 0, 0, 1, 1,
0.02245763, -0.009969589, 0.7555833, 1, 0, 0, 1, 1,
0.02416019, -0.7315171, 1.532169, 1, 0, 0, 1, 1,
0.03078121, 0.5096833, 0.9362961, 1, 0, 0, 1, 1,
0.03232532, -0.02693193, 2.894951, 0, 0, 0, 1, 1,
0.03346843, -1.34385, 5.041738, 0, 0, 0, 1, 1,
0.03483137, 1.542299, 1.212988, 0, 0, 0, 1, 1,
0.04704553, -2.390064, 2.920913, 0, 0, 0, 1, 1,
0.04857012, -2.050152, 3.657726, 0, 0, 0, 1, 1,
0.0495135, 1.692466, 2.771992, 0, 0, 0, 1, 1,
0.04982004, 0.05722069, 0.4404233, 0, 0, 0, 1, 1,
0.05110606, 0.7896711, 0.4506087, 1, 1, 1, 1, 1,
0.05138813, 0.2139624, 0.4153498, 1, 1, 1, 1, 1,
0.0534277, 0.9675743, 0.1997072, 1, 1, 1, 1, 1,
0.06036077, -0.05549283, 0.3635867, 1, 1, 1, 1, 1,
0.06148852, -0.2707875, 3.05575, 1, 1, 1, 1, 1,
0.06581478, -1.24333, 2.820695, 1, 1, 1, 1, 1,
0.06673964, 0.406688, -0.9246687, 1, 1, 1, 1, 1,
0.06867764, 1.253233, 1.159618, 1, 1, 1, 1, 1,
0.07218696, 0.2758825, -1.030477, 1, 1, 1, 1, 1,
0.07445975, -0.7493985, 4.732857, 1, 1, 1, 1, 1,
0.07966224, 0.06139652, 0.904157, 1, 1, 1, 1, 1,
0.08283181, -0.7896799, 2.356331, 1, 1, 1, 1, 1,
0.08752087, -0.3044406, 2.728807, 1, 1, 1, 1, 1,
0.0928275, 0.6709874, 0.452458, 1, 1, 1, 1, 1,
0.09300599, -0.2449599, 2.235588, 1, 1, 1, 1, 1,
0.1013802, 0.4605849, -1.549032, 0, 0, 1, 1, 1,
0.1017883, -0.6824734, 4.612068, 1, 0, 0, 1, 1,
0.1041287, -0.3279787, 2.447333, 1, 0, 0, 1, 1,
0.1063426, -0.353069, 3.178573, 1, 0, 0, 1, 1,
0.1076898, 0.4730494, 2.396787, 1, 0, 0, 1, 1,
0.1111466, 0.01906897, 1.372196, 1, 0, 0, 1, 1,
0.1114178, 0.02324289, 3.188802, 0, 0, 0, 1, 1,
0.1125135, -0.5841661, 2.396344, 0, 0, 0, 1, 1,
0.1129343, -0.1475794, 2.263352, 0, 0, 0, 1, 1,
0.1148771, 1.367513, -0.3394407, 0, 0, 0, 1, 1,
0.1161526, -0.2685459, 2.996249, 0, 0, 0, 1, 1,
0.1163591, -0.8959696, 3.19377, 0, 0, 0, 1, 1,
0.1215833, 1.041781, -1.895287, 0, 0, 0, 1, 1,
0.1248358, -0.3631804, 3.764503, 1, 1, 1, 1, 1,
0.1258687, 1.900979, 0.5697096, 1, 1, 1, 1, 1,
0.1271533, 1.583934, 1.002819, 1, 1, 1, 1, 1,
0.1346093, 0.3406588, -0.2406494, 1, 1, 1, 1, 1,
0.1366323, 1.433736, -0.268762, 1, 1, 1, 1, 1,
0.1376546, 0.3315021, 0.2081963, 1, 1, 1, 1, 1,
0.1436589, 0.09829957, -0.2511886, 1, 1, 1, 1, 1,
0.1454425, -0.7076406, 3.99358, 1, 1, 1, 1, 1,
0.146838, -1.360874, 3.181768, 1, 1, 1, 1, 1,
0.1500965, 0.2057531, 1.413484, 1, 1, 1, 1, 1,
0.1508625, 2.096299, -1.132999, 1, 1, 1, 1, 1,
0.1531603, 0.8783134, 0.3190302, 1, 1, 1, 1, 1,
0.1538603, -0.8590893, 2.348237, 1, 1, 1, 1, 1,
0.1584394, 2.38345, 0.4753546, 1, 1, 1, 1, 1,
0.1589087, -0.4447928, 1.254488, 1, 1, 1, 1, 1,
0.1609263, 1.208004, -0.6715077, 0, 0, 1, 1, 1,
0.1612122, -0.2254893, 1.625428, 1, 0, 0, 1, 1,
0.1613169, 0.5368158, 0.8910193, 1, 0, 0, 1, 1,
0.1647499, -0.2202488, 1.58914, 1, 0, 0, 1, 1,
0.1656382, -0.1985241, 2.683975, 1, 0, 0, 1, 1,
0.1668102, -0.7668322, 3.174204, 1, 0, 0, 1, 1,
0.1682783, 0.1614582, -1.128137, 0, 0, 0, 1, 1,
0.168851, -0.9723206, 2.802482, 0, 0, 0, 1, 1,
0.1701916, -0.722211, 2.663978, 0, 0, 0, 1, 1,
0.1717991, 0.6036533, 0.366574, 0, 0, 0, 1, 1,
0.1721804, -1.395055, 2.341685, 0, 0, 0, 1, 1,
0.1792991, 0.2107532, -0.6760505, 0, 0, 0, 1, 1,
0.1814356, 0.3629509, -0.223745, 0, 0, 0, 1, 1,
0.1857774, 0.7413327, 0.3255719, 1, 1, 1, 1, 1,
0.185931, -0.75493, 3.177811, 1, 1, 1, 1, 1,
0.1933107, -0.7393841, 2.193731, 1, 1, 1, 1, 1,
0.1938858, -1.202175, 2.222975, 1, 1, 1, 1, 1,
0.1955811, -1.026227, 3.31749, 1, 1, 1, 1, 1,
0.1975667, -0.8479986, 0.9570985, 1, 1, 1, 1, 1,
0.198079, 0.9690602, -1.412716, 1, 1, 1, 1, 1,
0.2011935, -0.2625852, 2.23694, 1, 1, 1, 1, 1,
0.2069464, 2.873434, 0.2195849, 1, 1, 1, 1, 1,
0.2089188, -0.8858055, 1.386943, 1, 1, 1, 1, 1,
0.210954, 0.7882179, 0.2364654, 1, 1, 1, 1, 1,
0.2128619, 0.6322959, -0.4476997, 1, 1, 1, 1, 1,
0.2181571, -0.794681, 2.751691, 1, 1, 1, 1, 1,
0.2197643, 0.1196317, 0.1305441, 1, 1, 1, 1, 1,
0.2214027, -0.313197, 2.285714, 1, 1, 1, 1, 1,
0.2219717, -1.362365, 2.284427, 0, 0, 1, 1, 1,
0.2226431, -1.352001, 2.708416, 1, 0, 0, 1, 1,
0.2333321, 0.8551445, 1.079794, 1, 0, 0, 1, 1,
0.2334431, 0.02071096, 1.04726, 1, 0, 0, 1, 1,
0.2348357, -2.202368, 3.334858, 1, 0, 0, 1, 1,
0.2384763, -1.088023, 3.584784, 1, 0, 0, 1, 1,
0.2401695, 1.722427, -0.6812308, 0, 0, 0, 1, 1,
0.2404005, 1.118161, 1.608173, 0, 0, 0, 1, 1,
0.2426499, -0.159369, 1.115844, 0, 0, 0, 1, 1,
0.2468533, -1.162418, 2.091516, 0, 0, 0, 1, 1,
0.2546559, -1.871799, 2.535512, 0, 0, 0, 1, 1,
0.2557541, 0.2808918, -0.3950879, 0, 0, 0, 1, 1,
0.2569875, -1.354026, 1.043715, 0, 0, 0, 1, 1,
0.2608064, 0.2025751, 3.201373, 1, 1, 1, 1, 1,
0.2656333, 0.05450611, 1.750283, 1, 1, 1, 1, 1,
0.2657779, -0.3426258, 1.217039, 1, 1, 1, 1, 1,
0.2752063, -0.8788399, 3.782979, 1, 1, 1, 1, 1,
0.2778648, -1.433927, 4.551754, 1, 1, 1, 1, 1,
0.2889039, -0.1613433, 2.572291, 1, 1, 1, 1, 1,
0.2894151, -2.11744, 5.298209, 1, 1, 1, 1, 1,
0.2912539, 0.1770808, 0.5625837, 1, 1, 1, 1, 1,
0.2971831, 2.104989, 0.4871281, 1, 1, 1, 1, 1,
0.2981372, -0.4217528, 2.326902, 1, 1, 1, 1, 1,
0.2994246, 0.1217164, 0.8025917, 1, 1, 1, 1, 1,
0.30109, -0.08600781, 2.585879, 1, 1, 1, 1, 1,
0.3041887, -0.0606535, 2.408315, 1, 1, 1, 1, 1,
0.3084824, 0.8050795, 3.360072, 1, 1, 1, 1, 1,
0.3088318, 0.71952, 3.270848, 1, 1, 1, 1, 1,
0.3102388, 1.024955, 1.366578, 0, 0, 1, 1, 1,
0.3109408, -0.4537295, 0.7088138, 1, 0, 0, 1, 1,
0.3134812, 0.09116446, 1.072597, 1, 0, 0, 1, 1,
0.3149439, 1.102166, -0.1080202, 1, 0, 0, 1, 1,
0.3210906, 0.3261638, -1.253676, 1, 0, 0, 1, 1,
0.3279772, -1.076398, 2.741449, 1, 0, 0, 1, 1,
0.3296465, -0.09589777, 2.26088, 0, 0, 0, 1, 1,
0.3342179, 1.141674, 1.822834, 0, 0, 0, 1, 1,
0.3380367, -0.9800704, 2.414612, 0, 0, 0, 1, 1,
0.3403445, 0.8930195, 0.3980312, 0, 0, 0, 1, 1,
0.3433541, 0.00880925, 1.80666, 0, 0, 0, 1, 1,
0.3442829, 0.8226554, 3.052917, 0, 0, 0, 1, 1,
0.3467758, -0.3928841, 2.936908, 0, 0, 0, 1, 1,
0.3479888, 0.190059, -0.8162365, 1, 1, 1, 1, 1,
0.3521806, -1.52894, 2.5663, 1, 1, 1, 1, 1,
0.3548571, -0.04708647, 1.533702, 1, 1, 1, 1, 1,
0.3562727, 0.1139236, 1.230971, 1, 1, 1, 1, 1,
0.3568929, 0.4148062, 0.3371216, 1, 1, 1, 1, 1,
0.3583231, 1.025485, 1.121917, 1, 1, 1, 1, 1,
0.3635062, 0.7749065, 0.2371694, 1, 1, 1, 1, 1,
0.3647631, -0.4716202, 2.871382, 1, 1, 1, 1, 1,
0.3664464, 0.09947281, -0.4796277, 1, 1, 1, 1, 1,
0.3680432, -0.09879668, 2.10687, 1, 1, 1, 1, 1,
0.3687547, -0.4496721, 2.879985, 1, 1, 1, 1, 1,
0.369955, -1.325723, 2.886556, 1, 1, 1, 1, 1,
0.3722397, -0.3048944, 2.479371, 1, 1, 1, 1, 1,
0.3763677, 0.5738568, 1.228715, 1, 1, 1, 1, 1,
0.3794031, 0.09077453, 2.877757, 1, 1, 1, 1, 1,
0.3860102, -0.5500245, 2.711027, 0, 0, 1, 1, 1,
0.3866686, -0.599014, 2.997941, 1, 0, 0, 1, 1,
0.3877061, -0.1338944, 3.221138, 1, 0, 0, 1, 1,
0.3908291, 1.306584, 0.4634815, 1, 0, 0, 1, 1,
0.3947376, -0.1572377, 2.350552, 1, 0, 0, 1, 1,
0.3951147, -0.789405, 1.700861, 1, 0, 0, 1, 1,
0.3980034, 1.228672, 0.6846151, 0, 0, 0, 1, 1,
0.399006, 1.47266, -0.2100368, 0, 0, 0, 1, 1,
0.4062426, 0.7076787, 1.7639, 0, 0, 0, 1, 1,
0.4088185, -0.548101, 3.175056, 0, 0, 0, 1, 1,
0.4093847, -0.893092, 3.060145, 0, 0, 0, 1, 1,
0.4135182, -0.4781019, 2.692642, 0, 0, 0, 1, 1,
0.4139991, -0.9085995, 2.849458, 0, 0, 0, 1, 1,
0.4236678, -1.089588, 2.585519, 1, 1, 1, 1, 1,
0.4239304, 1.096261, 1.41001, 1, 1, 1, 1, 1,
0.4247723, -0.4967095, 3.162728, 1, 1, 1, 1, 1,
0.4275716, -1.004335, 3.384151, 1, 1, 1, 1, 1,
0.4345149, -1.124555, 1.057888, 1, 1, 1, 1, 1,
0.4378036, -0.5786608, 2.610698, 1, 1, 1, 1, 1,
0.4382036, 0.1569302, 3.494236, 1, 1, 1, 1, 1,
0.4390064, -0.4690442, 2.444597, 1, 1, 1, 1, 1,
0.4400049, 0.5901671, 2.118819, 1, 1, 1, 1, 1,
0.4445084, -0.6994256, 1.172299, 1, 1, 1, 1, 1,
0.4504549, -1.102548, 2.757147, 1, 1, 1, 1, 1,
0.4571813, 0.7450215, 0.1142594, 1, 1, 1, 1, 1,
0.4603568, 0.9786105, 1.727592, 1, 1, 1, 1, 1,
0.4610295, -1.105095, 4.113563, 1, 1, 1, 1, 1,
0.461841, -0.3579316, 3.361036, 1, 1, 1, 1, 1,
0.4672593, 1.255114, -0.1552234, 0, 0, 1, 1, 1,
0.4684514, -0.2409061, 2.881804, 1, 0, 0, 1, 1,
0.4688767, -0.07288412, -0.1023233, 1, 0, 0, 1, 1,
0.4723677, -2.278158, 3.044239, 1, 0, 0, 1, 1,
0.4761855, 0.710052, -0.8167541, 1, 0, 0, 1, 1,
0.4771017, 0.1852992, 1.725839, 1, 0, 0, 1, 1,
0.4795169, -0.863982, 1.910369, 0, 0, 0, 1, 1,
0.4851987, -0.2230389, 3.287709, 0, 0, 0, 1, 1,
0.4857007, -0.8189186, 0.9769416, 0, 0, 0, 1, 1,
0.4865628, 0.8189987, 2.604222, 0, 0, 0, 1, 1,
0.4879953, 2.014949, 0.3664991, 0, 0, 0, 1, 1,
0.4893359, -0.5495687, 3.42159, 0, 0, 0, 1, 1,
0.4916113, -0.4275439, 1.504875, 0, 0, 0, 1, 1,
0.4940492, 0.7940975, 1.125065, 1, 1, 1, 1, 1,
0.4952168, -0.1710764, 1.269347, 1, 1, 1, 1, 1,
0.4966883, 0.05592911, 1.154539, 1, 1, 1, 1, 1,
0.5016072, 0.4186964, 0.7114294, 1, 1, 1, 1, 1,
0.5020255, 0.5578619, -1.444653, 1, 1, 1, 1, 1,
0.5033922, -0.2578945, 3.589106, 1, 1, 1, 1, 1,
0.5045621, 0.4423667, -0.4168407, 1, 1, 1, 1, 1,
0.5063059, -0.8801047, 2.56867, 1, 1, 1, 1, 1,
0.5070318, -0.09867962, 0.9873621, 1, 1, 1, 1, 1,
0.5078397, -0.5670904, 3.462384, 1, 1, 1, 1, 1,
0.5099316, 0.1737943, 0.8341016, 1, 1, 1, 1, 1,
0.5101879, 1.173729, -0.6054782, 1, 1, 1, 1, 1,
0.5109729, -1.882145, 3.253593, 1, 1, 1, 1, 1,
0.5146394, -0.4223575, 2.195442, 1, 1, 1, 1, 1,
0.5148214, -1.47025, 3.103571, 1, 1, 1, 1, 1,
0.5162469, -0.4708289, 2.725942, 0, 0, 1, 1, 1,
0.5249577, -0.8862244, -0.2801552, 1, 0, 0, 1, 1,
0.5297656, 1.625879, 2.064075, 1, 0, 0, 1, 1,
0.5405374, -0.6621207, 1.933959, 1, 0, 0, 1, 1,
0.5456016, -2.275434, 3.964356, 1, 0, 0, 1, 1,
0.5465444, -0.5903085, 4.042225, 1, 0, 0, 1, 1,
0.5503438, 0.8535684, 0.3983216, 0, 0, 0, 1, 1,
0.5521618, 0.7316333, 1.452376, 0, 0, 0, 1, 1,
0.5529953, -0.8039677, 2.528023, 0, 0, 0, 1, 1,
0.5546106, 0.03759511, 1.032216, 0, 0, 0, 1, 1,
0.5547254, -1.644603, 4.073526, 0, 0, 0, 1, 1,
0.5610517, 0.8319165, -0.7741274, 0, 0, 0, 1, 1,
0.5617685, -0.2598817, 0.7879872, 0, 0, 0, 1, 1,
0.5619294, -0.9712105, 1.767081, 1, 1, 1, 1, 1,
0.5759078, -0.8677683, 0.6699336, 1, 1, 1, 1, 1,
0.5762859, 0.2987738, 2.567098, 1, 1, 1, 1, 1,
0.5766549, 0.1141975, -0.1134897, 1, 1, 1, 1, 1,
0.5790224, 1.296953, -0.847389, 1, 1, 1, 1, 1,
0.5879788, 0.2240194, 2.08259, 1, 1, 1, 1, 1,
0.5908207, 0.4772457, 0.9897925, 1, 1, 1, 1, 1,
0.6020107, -0.5933532, 0.9578983, 1, 1, 1, 1, 1,
0.6033531, 0.299661, 1.501286, 1, 1, 1, 1, 1,
0.6078032, 0.5503125, 1.138206, 1, 1, 1, 1, 1,
0.6091289, 0.3075231, 1.727589, 1, 1, 1, 1, 1,
0.6095522, 0.3506481, 1.863793, 1, 1, 1, 1, 1,
0.6161934, -1.100548, 2.386212, 1, 1, 1, 1, 1,
0.6174946, 1.405343, 0.06816836, 1, 1, 1, 1, 1,
0.6236275, 0.1767233, 0.0362747, 1, 1, 1, 1, 1,
0.626965, -3.013658, 2.872545, 0, 0, 1, 1, 1,
0.6315176, -0.852604, 1.019982, 1, 0, 0, 1, 1,
0.6325986, 0.4631169, -0.129665, 1, 0, 0, 1, 1,
0.6333278, 0.5445261, 1.846985, 1, 0, 0, 1, 1,
0.6427014, 0.7850268, 0.8196291, 1, 0, 0, 1, 1,
0.6475285, -0.0986385, -0.1937308, 1, 0, 0, 1, 1,
0.6497267, 2.375721, 0.3827259, 0, 0, 0, 1, 1,
0.651163, -0.2940269, 1.326343, 0, 0, 0, 1, 1,
0.6517659, 1.537318, -0.1258702, 0, 0, 0, 1, 1,
0.6527025, -0.2293437, 1.452302, 0, 0, 0, 1, 1,
0.6540028, -0.1956405, 2.558507, 0, 0, 0, 1, 1,
0.6549715, -1.092042, 1.843353, 0, 0, 0, 1, 1,
0.6564246, -0.5747995, 2.798133, 0, 0, 0, 1, 1,
0.6622357, -0.1627042, 1.682337, 1, 1, 1, 1, 1,
0.6689743, 0.1822473, 3.077419, 1, 1, 1, 1, 1,
0.6704361, -1.866278, 1.86936, 1, 1, 1, 1, 1,
0.6720535, -0.3264495, 2.614732, 1, 1, 1, 1, 1,
0.6728811, -0.5797367, 1.38862, 1, 1, 1, 1, 1,
0.6740736, 0.2042289, 1.356022, 1, 1, 1, 1, 1,
0.6745386, 0.2453389, 0.9959136, 1, 1, 1, 1, 1,
0.6749592, 0.2347253, 0.5656821, 1, 1, 1, 1, 1,
0.6778391, 0.3901075, 1.521369, 1, 1, 1, 1, 1,
0.6832002, 0.2613748, 2.544311, 1, 1, 1, 1, 1,
0.6866711, -0.4742781, -1.252911, 1, 1, 1, 1, 1,
0.6924307, -1.407999, 2.644236, 1, 1, 1, 1, 1,
0.6953658, 1.028452, 1.27706, 1, 1, 1, 1, 1,
0.6980705, 0.5804476, -0.6880194, 1, 1, 1, 1, 1,
0.7017418, 0.09272023, 1.965675, 1, 1, 1, 1, 1,
0.7057137, 0.09095044, 1.215323, 0, 0, 1, 1, 1,
0.7059365, 0.2296823, 0.07678963, 1, 0, 0, 1, 1,
0.7088977, 0.3478262, 0.853416, 1, 0, 0, 1, 1,
0.7106079, -0.6475085, 2.295987, 1, 0, 0, 1, 1,
0.7125655, -0.8388988, 1.977315, 1, 0, 0, 1, 1,
0.7161316, 1.577611, -1.122181, 1, 0, 0, 1, 1,
0.7188889, 0.729174, -1.865138, 0, 0, 0, 1, 1,
0.7221355, 0.727637, 0.9957335, 0, 0, 0, 1, 1,
0.7228884, -1.001495, 4.504515, 0, 0, 0, 1, 1,
0.7270933, -0.2600439, 0.8401355, 0, 0, 0, 1, 1,
0.7331727, -1.29099, 1.990629, 0, 0, 0, 1, 1,
0.7352569, 0.338668, 0.5986564, 0, 0, 0, 1, 1,
0.7395366, 0.9379324, 0.07765681, 0, 0, 0, 1, 1,
0.7395586, 1.376706, 0.4247893, 1, 1, 1, 1, 1,
0.7424041, -0.06516542, 0.4390846, 1, 1, 1, 1, 1,
0.7455792, 0.4361204, 1.195782, 1, 1, 1, 1, 1,
0.7641625, 0.03383101, 1.337585, 1, 1, 1, 1, 1,
0.7653904, -0.8567286, 3.251144, 1, 1, 1, 1, 1,
0.7658954, -1.047998, 3.217216, 1, 1, 1, 1, 1,
0.7689928, -0.8788321, 2.216547, 1, 1, 1, 1, 1,
0.7690026, 0.9187545, 0.6851732, 1, 1, 1, 1, 1,
0.7744635, -2.031416, 1.843137, 1, 1, 1, 1, 1,
0.7792908, 0.3702053, 1.313841, 1, 1, 1, 1, 1,
0.780843, 1.715912, 0.6348971, 1, 1, 1, 1, 1,
0.7840224, 0.2541475, 1.636989, 1, 1, 1, 1, 1,
0.7898273, -0.1942502, 2.747119, 1, 1, 1, 1, 1,
0.7947541, 0.6005207, 1.643268, 1, 1, 1, 1, 1,
0.7948187, -1.14075, 3.282029, 1, 1, 1, 1, 1,
0.7960287, -2.603644, 2.207898, 0, 0, 1, 1, 1,
0.7961306, -2.28198, 2.069004, 1, 0, 0, 1, 1,
0.7970142, 0.03546034, 3.256484, 1, 0, 0, 1, 1,
0.7997944, -0.4675409, 2.952559, 1, 0, 0, 1, 1,
0.7998047, -1.024667, 2.632575, 1, 0, 0, 1, 1,
0.8001457, -0.3607548, -0.0201443, 1, 0, 0, 1, 1,
0.8020005, 0.5025136, 2.006104, 0, 0, 0, 1, 1,
0.8022696, 0.1312945, 1.771107, 0, 0, 0, 1, 1,
0.8157323, 0.3307614, 1.553259, 0, 0, 0, 1, 1,
0.8164836, -0.07532502, 1.649363, 0, 0, 0, 1, 1,
0.8258255, 0.8275269, 1.573369, 0, 0, 0, 1, 1,
0.8285557, -1.72435, 0.3828647, 0, 0, 0, 1, 1,
0.8372689, -0.3437183, 1.422171, 0, 0, 0, 1, 1,
0.837961, 1.50635, 1.661765, 1, 1, 1, 1, 1,
0.8391216, 0.6862751, 0.4050866, 1, 1, 1, 1, 1,
0.8420498, -1.544848, 2.858955, 1, 1, 1, 1, 1,
0.8444927, 1.182869, -0.5575995, 1, 1, 1, 1, 1,
0.8508437, -0.1331465, 2.741636, 1, 1, 1, 1, 1,
0.8512034, -2.511018, 1.963658, 1, 1, 1, 1, 1,
0.8528468, -0.1666647, 3.008273, 1, 1, 1, 1, 1,
0.8532023, 0.8425837, 0.830577, 1, 1, 1, 1, 1,
0.856642, -1.389508, 1.960766, 1, 1, 1, 1, 1,
0.8612636, -2.546636, 1.926757, 1, 1, 1, 1, 1,
0.8638884, 1.116431, 1.599025, 1, 1, 1, 1, 1,
0.8642769, 2.35525, -0.1433593, 1, 1, 1, 1, 1,
0.8682803, 0.4503755, 1.693241, 1, 1, 1, 1, 1,
0.8731238, 2.115323, -0.654349, 1, 1, 1, 1, 1,
0.8750382, 1.988621, -0.3780454, 1, 1, 1, 1, 1,
0.8817537, -0.5856828, 1.837073, 0, 0, 1, 1, 1,
0.8828112, 0.06327945, 0.9235586, 1, 0, 0, 1, 1,
0.8877516, 0.4013827, 1.003485, 1, 0, 0, 1, 1,
0.8949055, 0.6990651, 2.760749, 1, 0, 0, 1, 1,
0.8992478, 0.05130644, 2.299464, 1, 0, 0, 1, 1,
0.900076, 0.6032139, -0.2264191, 1, 0, 0, 1, 1,
0.9029923, -0.2842855, 2.152624, 0, 0, 0, 1, 1,
0.9073737, 1.540135, 0.8783076, 0, 0, 0, 1, 1,
0.9088971, -0.5724353, 0.3133149, 0, 0, 0, 1, 1,
0.9270289, -1.181138, 2.913761, 0, 0, 0, 1, 1,
0.9376605, -0.5280373, 0.3477656, 0, 0, 0, 1, 1,
0.9430672, -0.8598757, 3.498389, 0, 0, 0, 1, 1,
0.9465697, 0.5554157, 0.5687576, 0, 0, 0, 1, 1,
0.9508417, 0.01654015, 2.347949, 1, 1, 1, 1, 1,
0.9536142, -0.4110652, 1.979981, 1, 1, 1, 1, 1,
0.9537719, -1.049132, 2.933641, 1, 1, 1, 1, 1,
0.9575892, -0.6883519, 0.9938445, 1, 1, 1, 1, 1,
0.9605916, 1.141396, 1.619139, 1, 1, 1, 1, 1,
0.9614018, 0.4349544, 0.7924787, 1, 1, 1, 1, 1,
0.9665422, 0.3457798, 1.205126, 1, 1, 1, 1, 1,
0.980745, 0.7286509, 0.4355066, 1, 1, 1, 1, 1,
0.9856782, -0.1218669, 1.734218, 1, 1, 1, 1, 1,
0.9905933, 0.1233046, 1.91574, 1, 1, 1, 1, 1,
0.993512, 1.160657, 2.115541, 1, 1, 1, 1, 1,
1.000848, -1.576894, 3.318074, 1, 1, 1, 1, 1,
1.001067, -0.2208504, 3.197696, 1, 1, 1, 1, 1,
1.003843, -0.5753464, 3.475902, 1, 1, 1, 1, 1,
1.00704, 0.5351927, 0.9816645, 1, 1, 1, 1, 1,
1.009421, 1.716008, 0.6181519, 0, 0, 1, 1, 1,
1.01451, -0.968449, 3.019002, 1, 0, 0, 1, 1,
1.016372, 0.3452152, 1.762569, 1, 0, 0, 1, 1,
1.017801, -1.462102, 2.059357, 1, 0, 0, 1, 1,
1.023993, -0.9839745, 0.7151473, 1, 0, 0, 1, 1,
1.032146, 1.102593, 1.960446, 1, 0, 0, 1, 1,
1.033886, -0.7038053, 3.258026, 0, 0, 0, 1, 1,
1.040882, -0.9215692, 2.689879, 0, 0, 0, 1, 1,
1.041991, -0.3931159, 1.289065, 0, 0, 0, 1, 1,
1.055056, -0.9572289, 1.843266, 0, 0, 0, 1, 1,
1.059015, -2.44401, 3.400606, 0, 0, 0, 1, 1,
1.063357, -0.9762869, 1.988573, 0, 0, 0, 1, 1,
1.068578, -0.8700289, 5.899839, 0, 0, 0, 1, 1,
1.072764, -0.8336599, 2.411165, 1, 1, 1, 1, 1,
1.083696, -0.3330074, 2.155905, 1, 1, 1, 1, 1,
1.089427, 0.5379196, 0.7891313, 1, 1, 1, 1, 1,
1.091846, 0.09621453, 1.801191, 1, 1, 1, 1, 1,
1.1016, 1.184626, -1.203751, 1, 1, 1, 1, 1,
1.10833, -1.272738, 1.645055, 1, 1, 1, 1, 1,
1.112116, 0.9715441, 0.1722988, 1, 1, 1, 1, 1,
1.114462, -0.1973114, -0.07968565, 1, 1, 1, 1, 1,
1.121589, -1.032925, 3.640793, 1, 1, 1, 1, 1,
1.123102, -0.2255324, 1.93804, 1, 1, 1, 1, 1,
1.123104, -0.8051199, 1.8321, 1, 1, 1, 1, 1,
1.127596, 0.8658496, 1.742235, 1, 1, 1, 1, 1,
1.128568, 1.547195, -0.5320497, 1, 1, 1, 1, 1,
1.139228, 0.8917533, 0.2123856, 1, 1, 1, 1, 1,
1.144916, -0.2264201, 3.136566, 1, 1, 1, 1, 1,
1.151622, -0.934081, 2.392611, 0, 0, 1, 1, 1,
1.154651, 1.212354, 0.3744287, 1, 0, 0, 1, 1,
1.161394, 0.4803081, 0.1404014, 1, 0, 0, 1, 1,
1.166946, 0.6911512, 2.172616, 1, 0, 0, 1, 1,
1.175528, -0.6801576, 1.566922, 1, 0, 0, 1, 1,
1.186041, 0.7951262, 0.6393983, 1, 0, 0, 1, 1,
1.19023, 0.3856932, 1.69769, 0, 0, 0, 1, 1,
1.193086, -1.109809, 0.753884, 0, 0, 0, 1, 1,
1.194893, -1.431393, 1.530992, 0, 0, 0, 1, 1,
1.197266, -1.431153, 1.504208, 0, 0, 0, 1, 1,
1.199563, -0.8220456, 3.062125, 0, 0, 0, 1, 1,
1.204359, 0.9095703, -1.20716, 0, 0, 0, 1, 1,
1.213166, -0.3756455, 2.993763, 0, 0, 0, 1, 1,
1.22149, 0.1038083, -0.9570628, 1, 1, 1, 1, 1,
1.222425, 0.2680174, 1.831091, 1, 1, 1, 1, 1,
1.223491, -1.472656, 2.45686, 1, 1, 1, 1, 1,
1.230621, -1.034404, 3.0227, 1, 1, 1, 1, 1,
1.238223, 0.6795027, -0.2750092, 1, 1, 1, 1, 1,
1.23927, 0.07348018, 2.643468, 1, 1, 1, 1, 1,
1.239533, 0.9420072, -0.4759744, 1, 1, 1, 1, 1,
1.239982, -0.5952834, 2.158791, 1, 1, 1, 1, 1,
1.250499, -0.590328, 2.654794, 1, 1, 1, 1, 1,
1.266585, 0.07162909, 1.573544, 1, 1, 1, 1, 1,
1.283099, -0.2292067, 1.347075, 1, 1, 1, 1, 1,
1.287451, -0.04382648, 2.500165, 1, 1, 1, 1, 1,
1.288817, -0.4192554, 0.5473622, 1, 1, 1, 1, 1,
1.289337, 0.8261389, 1.576895, 1, 1, 1, 1, 1,
1.305913, -1.351189, 4.580352, 1, 1, 1, 1, 1,
1.306613, 1.490077, -0.6358227, 0, 0, 1, 1, 1,
1.314094, -0.6416993, 3.07756, 1, 0, 0, 1, 1,
1.316513, -0.8699951, 1.987603, 1, 0, 0, 1, 1,
1.320368, 0.05607079, 2.598685, 1, 0, 0, 1, 1,
1.331575, 0.9769645, 1.085825, 1, 0, 0, 1, 1,
1.339369, 1.036362, -0.6917308, 1, 0, 0, 1, 1,
1.339933, -0.5864849, -0.1296318, 0, 0, 0, 1, 1,
1.340621, -0.584245, 4.105717, 0, 0, 0, 1, 1,
1.34149, 2.878586, -0.7042428, 0, 0, 0, 1, 1,
1.345011, 0.4137248, 3.225799, 0, 0, 0, 1, 1,
1.346636, 1.641086, 1.106349, 0, 0, 0, 1, 1,
1.347629, -0.3686124, 3.121751, 0, 0, 0, 1, 1,
1.349422, 1.520814, 1.483478, 0, 0, 0, 1, 1,
1.356874, -0.9089276, 2.104394, 1, 1, 1, 1, 1,
1.357579, -1.955967, 2.96775, 1, 1, 1, 1, 1,
1.378052, -0.3264155, 1.485316, 1, 1, 1, 1, 1,
1.378061, 0.8746615, -0.6199198, 1, 1, 1, 1, 1,
1.381862, -0.352326, 1.905015, 1, 1, 1, 1, 1,
1.386635, -0.2162184, 2.412115, 1, 1, 1, 1, 1,
1.388655, -2.485727, 3.196883, 1, 1, 1, 1, 1,
1.396772, 0.2665505, 2.559348, 1, 1, 1, 1, 1,
1.411238, -1.859095, 3.150758, 1, 1, 1, 1, 1,
1.417755, 1.320041, 1.238915, 1, 1, 1, 1, 1,
1.42168, 0.4646669, 0.970033, 1, 1, 1, 1, 1,
1.425053, 0.2499244, 2.789452, 1, 1, 1, 1, 1,
1.426789, 1.313724, 1.13594, 1, 1, 1, 1, 1,
1.432916, 0.2699943, 2.097476, 1, 1, 1, 1, 1,
1.444919, 1.21991, 1.986315, 1, 1, 1, 1, 1,
1.450411, -0.427397, 2.904464, 0, 0, 1, 1, 1,
1.455778, -0.420853, 1.537463, 1, 0, 0, 1, 1,
1.457214, 0.6156182, 0.5723607, 1, 0, 0, 1, 1,
1.472518, -2.898149, 2.340106, 1, 0, 0, 1, 1,
1.473518, 0.6415385, 1.220026, 1, 0, 0, 1, 1,
1.477405, -0.232264, 0.67905, 1, 0, 0, 1, 1,
1.47921, 0.3706238, 2.679634, 0, 0, 0, 1, 1,
1.481549, 0.8059434, -0.08711609, 0, 0, 0, 1, 1,
1.483809, 0.2180592, 2.875908, 0, 0, 0, 1, 1,
1.485272, 0.3058591, 1.856877, 0, 0, 0, 1, 1,
1.489463, -1.160687, 0.7407839, 0, 0, 0, 1, 1,
1.495942, 1.182642, 0.8301537, 0, 0, 0, 1, 1,
1.500111, 0.8710089, 0.2442653, 0, 0, 0, 1, 1,
1.50191, 0.014119, 0.04200229, 1, 1, 1, 1, 1,
1.507708, 0.9819762, 2.168425, 1, 1, 1, 1, 1,
1.510678, 1.961021, 0.7575317, 1, 1, 1, 1, 1,
1.53875, 0.7797962, 1.054103, 1, 1, 1, 1, 1,
1.543449, 0.6093987, 0.4475407, 1, 1, 1, 1, 1,
1.580501, -1.10771, 0.07169217, 1, 1, 1, 1, 1,
1.584825, 0.8825185, 1.924218, 1, 1, 1, 1, 1,
1.591032, -1.262054, 2.804527, 1, 1, 1, 1, 1,
1.599671, -0.8001207, 1.788257, 1, 1, 1, 1, 1,
1.600621, 2.081472, 1.752448, 1, 1, 1, 1, 1,
1.627411, -0.7693155, 1.464411, 1, 1, 1, 1, 1,
1.682991, 0.08106448, 0.7898104, 1, 1, 1, 1, 1,
1.683062, -1.650579, 0.3647692, 1, 1, 1, 1, 1,
1.707109, 0.1973188, 2.10047, 1, 1, 1, 1, 1,
1.709769, 1.196942, 0.8436574, 1, 1, 1, 1, 1,
1.737494, 2.05747, 1.493647, 0, 0, 1, 1, 1,
1.749515, 0.5489136, 1.673344, 1, 0, 0, 1, 1,
1.75033, 0.948764, 1.543547, 1, 0, 0, 1, 1,
1.757422, 0.4154568, -0.5242068, 1, 0, 0, 1, 1,
1.761189, -2.184684, 3.664491, 1, 0, 0, 1, 1,
1.780061, -1.575894, 2.625928, 1, 0, 0, 1, 1,
1.787986, 0.5313518, 2.122899, 0, 0, 0, 1, 1,
1.795844, 0.9917659, 0.7293915, 0, 0, 0, 1, 1,
1.807863, -1.342926, 2.755672, 0, 0, 0, 1, 1,
1.81846, 1.763099, 0.7097852, 0, 0, 0, 1, 1,
1.823997, -0.2876712, 3.020654, 0, 0, 0, 1, 1,
1.831959, 0.7051532, -0.07593875, 0, 0, 0, 1, 1,
1.83895, 2.385774, -1.390594, 0, 0, 0, 1, 1,
1.840724, -1.298797, 2.975177, 1, 1, 1, 1, 1,
1.869252, 0.7753687, 0.3643356, 1, 1, 1, 1, 1,
1.873256, -0.357934, 1.221473, 1, 1, 1, 1, 1,
1.905793, 0.08046439, 2.143638, 1, 1, 1, 1, 1,
1.927839, -0.6209778, 1.508938, 1, 1, 1, 1, 1,
1.938455, 1.187325, 1.920962, 1, 1, 1, 1, 1,
1.941485, 0.7882574, 1.441409, 1, 1, 1, 1, 1,
1.965026, 0.1614593, 0.4823137, 1, 1, 1, 1, 1,
1.966788, 0.08946025, 1.874112, 1, 1, 1, 1, 1,
1.999808, -0.563025, 0.9830847, 1, 1, 1, 1, 1,
2.001337, 0.3754095, 3.070947, 1, 1, 1, 1, 1,
2.003794, -0.8110603, 4.54012, 1, 1, 1, 1, 1,
2.020957, -0.4883936, 1.41088, 1, 1, 1, 1, 1,
2.056643, -0.386283, 2.682609, 1, 1, 1, 1, 1,
2.111133, 0.7231666, 2.021971, 1, 1, 1, 1, 1,
2.128437, 0.4780741, 0.6887263, 0, 0, 1, 1, 1,
2.151326, -0.6039582, 2.46753, 1, 0, 0, 1, 1,
2.1634, -1.093296, 2.39375, 1, 0, 0, 1, 1,
2.20795, 0.5310127, 0.1278511, 1, 0, 0, 1, 1,
2.270707, 1.239653, 1.380226, 1, 0, 0, 1, 1,
2.307121, 0.1284554, 1.864545, 1, 0, 0, 1, 1,
2.320648, -0.9493621, 0.8758911, 0, 0, 0, 1, 1,
2.332149, -1.142815, 1.86139, 0, 0, 0, 1, 1,
2.347291, -0.5947417, 2.094404, 0, 0, 0, 1, 1,
2.405725, 1.536592, 1.563908, 0, 0, 0, 1, 1,
2.43717, 0.06003654, 2.233128, 0, 0, 0, 1, 1,
2.450299, 0.4271078, 0.04516781, 0, 0, 0, 1, 1,
2.474414, 0.4655445, -0.409107, 0, 0, 0, 1, 1,
2.514297, 0.1868282, 2.010391, 1, 1, 1, 1, 1,
2.517148, -0.1647494, 0.6882609, 1, 1, 1, 1, 1,
2.606855, 1.116576, 0.5467489, 1, 1, 1, 1, 1,
2.617578, 1.876803, 0.3930921, 1, 1, 1, 1, 1,
2.826212, -0.6697164, 2.011927, 1, 1, 1, 1, 1,
2.834886, 0.4165906, 1.249757, 1, 1, 1, 1, 1,
3.002334, -1.430353, 2.752713, 1, 1, 1, 1, 1
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
var radius = 9.768169;
var distance = 34.31028;
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
mvMatrix.translate( 0.1341882, 0.067536, -0.1046612 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.31028);
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
