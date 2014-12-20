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
-3.536184, 0.4871472, -2.055536, 1, 0, 0, 1,
-3.304269, -0.7386215, -0.9773236, 1, 0.007843138, 0, 1,
-3.269564, 0.3044764, -1.651464, 1, 0.01176471, 0, 1,
-2.869813, -1.283425, -1.944294, 1, 0.01960784, 0, 1,
-2.831723, 0.3781975, -1.948761, 1, 0.02352941, 0, 1,
-2.822202, -0.9766007, -2.113847, 1, 0.03137255, 0, 1,
-2.592839, 0.7021648, -0.6488134, 1, 0.03529412, 0, 1,
-2.462906, -1.095729, -2.051098, 1, 0.04313726, 0, 1,
-2.403757, -0.8031325, -0.9740462, 1, 0.04705882, 0, 1,
-2.299627, 1.429758, 0.66976, 1, 0.05490196, 0, 1,
-2.287542, -0.5109257, -0.4450959, 1, 0.05882353, 0, 1,
-2.265218, -1.876544, -2.30116, 1, 0.06666667, 0, 1,
-2.260348, 0.7370778, -1.652192, 1, 0.07058824, 0, 1,
-2.221277, 0.7322872, -0.7229977, 1, 0.07843138, 0, 1,
-2.145778, 1.14647, -0.7797818, 1, 0.08235294, 0, 1,
-2.145486, -0.1701604, -2.294887, 1, 0.09019608, 0, 1,
-2.141832, -0.04834617, -0.8324957, 1, 0.09411765, 0, 1,
-2.108447, -0.7394124, -1.7019, 1, 0.1019608, 0, 1,
-2.077532, -1.253114, -3.12074, 1, 0.1098039, 0, 1,
-2.074591, -0.8445556, -1.847541, 1, 0.1137255, 0, 1,
-2.066283, 0.7819574, -1.220087, 1, 0.1215686, 0, 1,
-2.047144, 1.286022, -2.084172, 1, 0.1254902, 0, 1,
-2.028641, -0.005855823, -3.663212, 1, 0.1333333, 0, 1,
-2.025327, -2.865365, -0.4148104, 1, 0.1372549, 0, 1,
-2.019445, 1.092754, -1.48341, 1, 0.145098, 0, 1,
-1.992213, -0.8213352, -3.117433, 1, 0.1490196, 0, 1,
-1.968948, -0.1543867, -1.04801, 1, 0.1568628, 0, 1,
-1.951424, -1.573766, -4.219708, 1, 0.1607843, 0, 1,
-1.930562, 0.5059254, -0.1137797, 1, 0.1686275, 0, 1,
-1.920297, 1.349416, -1.000605, 1, 0.172549, 0, 1,
-1.905237, 1.050383, -2.838143, 1, 0.1803922, 0, 1,
-1.899255, 0.3562482, 0.2173092, 1, 0.1843137, 0, 1,
-1.884836, 0.0759457, -2.067361, 1, 0.1921569, 0, 1,
-1.872572, 0.1783097, -1.053004, 1, 0.1960784, 0, 1,
-1.861442, 0.9018961, 0.2560881, 1, 0.2039216, 0, 1,
-1.861153, 0.7125752, -2.796176, 1, 0.2117647, 0, 1,
-1.836166, 0.7766057, -0.7729543, 1, 0.2156863, 0, 1,
-1.83258, -0.6378949, -1.510848, 1, 0.2235294, 0, 1,
-1.831221, -2.114983, -2.038494, 1, 0.227451, 0, 1,
-1.813151, 1.809218, -1.97449, 1, 0.2352941, 0, 1,
-1.810596, 0.01190836, -1.893348, 1, 0.2392157, 0, 1,
-1.810586, -0.7126856, -2.397188, 1, 0.2470588, 0, 1,
-1.809509, -0.06114535, -2.375973, 1, 0.2509804, 0, 1,
-1.79311, 1.252061, -0.7069538, 1, 0.2588235, 0, 1,
-1.766275, -0.8998967, -0.8265032, 1, 0.2627451, 0, 1,
-1.759747, 3.232366, -0.3196934, 1, 0.2705882, 0, 1,
-1.740299, 1.308748, -0.4720114, 1, 0.2745098, 0, 1,
-1.725019, 2.090639, -1.031499, 1, 0.282353, 0, 1,
-1.717476, 0.3363489, -1.783237, 1, 0.2862745, 0, 1,
-1.707787, -0.1295967, -3.137216, 1, 0.2941177, 0, 1,
-1.70389, 0.3073515, -1.918102, 1, 0.3019608, 0, 1,
-1.692729, -1.320713, -1.625718, 1, 0.3058824, 0, 1,
-1.68769, 2.694014, -0.7347555, 1, 0.3137255, 0, 1,
-1.663114, -0.5149665, -1.211925, 1, 0.3176471, 0, 1,
-1.646169, -0.1703984, -2.170129, 1, 0.3254902, 0, 1,
-1.632163, 0.3834636, -2.294213, 1, 0.3294118, 0, 1,
-1.629976, 0.1105508, -0.6983693, 1, 0.3372549, 0, 1,
-1.610449, -0.4684417, -2.70952, 1, 0.3411765, 0, 1,
-1.571113, 0.04282232, -0.604562, 1, 0.3490196, 0, 1,
-1.568279, -0.001249907, -2.67397, 1, 0.3529412, 0, 1,
-1.561063, -0.7151207, -0.6017946, 1, 0.3607843, 0, 1,
-1.556944, 0.09808511, -5.795758, 1, 0.3647059, 0, 1,
-1.554631, 0.07114144, -0.7208193, 1, 0.372549, 0, 1,
-1.553539, -2.753277, -3.180312, 1, 0.3764706, 0, 1,
-1.548897, -0.4998809, -2.075838, 1, 0.3843137, 0, 1,
-1.535436, -1.659394, -0.180399, 1, 0.3882353, 0, 1,
-1.532207, -0.1059305, -2.92391, 1, 0.3960784, 0, 1,
-1.515493, 0.02761851, -0.6614661, 1, 0.4039216, 0, 1,
-1.514572, 3.01722, 0.1715415, 1, 0.4078431, 0, 1,
-1.504662, -1.095249, 0.02126137, 1, 0.4156863, 0, 1,
-1.495298, 0.9371736, 0.4738958, 1, 0.4196078, 0, 1,
-1.494135, -0.3940516, -1.686893, 1, 0.427451, 0, 1,
-1.474747, -0.27095, -2.56604, 1, 0.4313726, 0, 1,
-1.468923, -0.05701266, -0.7855447, 1, 0.4392157, 0, 1,
-1.467137, 1.610255, -1.650218, 1, 0.4431373, 0, 1,
-1.464492, -0.9276505, -0.98577, 1, 0.4509804, 0, 1,
-1.460961, -1.915537, -1.984525, 1, 0.454902, 0, 1,
-1.436586, 0.2504449, -1.717799, 1, 0.4627451, 0, 1,
-1.436542, -0.3612581, -1.301752, 1, 0.4666667, 0, 1,
-1.423005, 0.40534, -0.4354323, 1, 0.4745098, 0, 1,
-1.419902, 2.10559, -2.031376, 1, 0.4784314, 0, 1,
-1.416585, 0.6666219, -1.065102, 1, 0.4862745, 0, 1,
-1.41626, -0.7937658, -1.522861, 1, 0.4901961, 0, 1,
-1.405889, -0.5821573, -2.751983, 1, 0.4980392, 0, 1,
-1.404217, -0.07165224, -1.321709, 1, 0.5058824, 0, 1,
-1.402826, -0.4827152, -2.8013, 1, 0.509804, 0, 1,
-1.385283, 0.6818008, -0.5869781, 1, 0.5176471, 0, 1,
-1.380863, -1.293021, -3.255945, 1, 0.5215687, 0, 1,
-1.375507, 0.1575856, -2.928536, 1, 0.5294118, 0, 1,
-1.364656, 0.1772063, -0.9415641, 1, 0.5333334, 0, 1,
-1.362537, 0.328445, -0.1575275, 1, 0.5411765, 0, 1,
-1.355881, -2.28519, -3.025755, 1, 0.5450981, 0, 1,
-1.351516, 0.3430288, -1.344504, 1, 0.5529412, 0, 1,
-1.346778, -0.1890215, -0.9990813, 1, 0.5568628, 0, 1,
-1.344973, 0.9497575, -1.565215, 1, 0.5647059, 0, 1,
-1.338867, 1.646774, 0.2403955, 1, 0.5686275, 0, 1,
-1.333034, 1.220985, -1.038454, 1, 0.5764706, 0, 1,
-1.329532, 0.1958208, -1.636085, 1, 0.5803922, 0, 1,
-1.324806, -1.081119, -1.798146, 1, 0.5882353, 0, 1,
-1.315249, 0.2958292, -1.351492, 1, 0.5921569, 0, 1,
-1.314177, -0.1811032, -0.998801, 1, 0.6, 0, 1,
-1.311145, 0.8622576, -0.3249795, 1, 0.6078432, 0, 1,
-1.310309, 0.0394358, -1.025919, 1, 0.6117647, 0, 1,
-1.308689, -0.6754081, -2.694209, 1, 0.6196079, 0, 1,
-1.301727, -0.631222, -2.154108, 1, 0.6235294, 0, 1,
-1.299492, -0.3277923, -2.84199, 1, 0.6313726, 0, 1,
-1.299471, -1.022217, -3.806376, 1, 0.6352941, 0, 1,
-1.292555, 0.02912497, -2.277889, 1, 0.6431373, 0, 1,
-1.28511, 1.455741, -0.7494524, 1, 0.6470588, 0, 1,
-1.285037, -0.1127506, -0.3109147, 1, 0.654902, 0, 1,
-1.283643, 1.353108, -0.2267592, 1, 0.6588235, 0, 1,
-1.276937, -0.02736163, -1.171042, 1, 0.6666667, 0, 1,
-1.276753, -1.558073, -1.751958, 1, 0.6705883, 0, 1,
-1.272771, -1.191869, -1.869861, 1, 0.6784314, 0, 1,
-1.267148, -1.117718, -1.377765, 1, 0.682353, 0, 1,
-1.265827, 0.0874043, -3.073063, 1, 0.6901961, 0, 1,
-1.263939, -0.9874632, -1.96581, 1, 0.6941177, 0, 1,
-1.252762, 0.5021918, -1.300924, 1, 0.7019608, 0, 1,
-1.252572, -1.374546, -1.2244, 1, 0.7098039, 0, 1,
-1.251916, -1.579386, -2.488408, 1, 0.7137255, 0, 1,
-1.243858, -0.8668604, -2.239464, 1, 0.7215686, 0, 1,
-1.240088, 0.06781958, -0.4238947, 1, 0.7254902, 0, 1,
-1.238655, 0.2420156, -2.855714, 1, 0.7333333, 0, 1,
-1.226224, -0.7507857, -0.7098757, 1, 0.7372549, 0, 1,
-1.22299, -0.8327872, 0.09352947, 1, 0.7450981, 0, 1,
-1.222157, 0.2205351, -1.461533, 1, 0.7490196, 0, 1,
-1.217323, 1.534618, 0.7293684, 1, 0.7568628, 0, 1,
-1.211878, 1.769337, -0.6844378, 1, 0.7607843, 0, 1,
-1.20782, -0.03718562, -1.445605, 1, 0.7686275, 0, 1,
-1.192487, -1.141251, -3.786627, 1, 0.772549, 0, 1,
-1.190406, 0.3245136, -2.156873, 1, 0.7803922, 0, 1,
-1.180096, 0.6773502, 0.8173589, 1, 0.7843137, 0, 1,
-1.167107, -0.508848, -1.56205, 1, 0.7921569, 0, 1,
-1.163934, 1.254841, -1.304108, 1, 0.7960784, 0, 1,
-1.161825, -0.3717091, -2.678386, 1, 0.8039216, 0, 1,
-1.156665, -0.967881, 0.1856852, 1, 0.8117647, 0, 1,
-1.155899, -0.1546359, 0.800252, 1, 0.8156863, 0, 1,
-1.151644, 0.2803102, -1.614634, 1, 0.8235294, 0, 1,
-1.145024, 1.433988, -1.544318, 1, 0.827451, 0, 1,
-1.134582, 1.035187, -0.3175589, 1, 0.8352941, 0, 1,
-1.133052, -1.148955, -3.006442, 1, 0.8392157, 0, 1,
-1.128938, -0.03574656, -1.327003, 1, 0.8470588, 0, 1,
-1.126514, -0.518158, -0.8826775, 1, 0.8509804, 0, 1,
-1.126176, 1.907803, 0.06444961, 1, 0.8588235, 0, 1,
-1.122407, 0.2317287, -0.7210882, 1, 0.8627451, 0, 1,
-1.11981, -0.3823651, -1.316728, 1, 0.8705882, 0, 1,
-1.118428, -0.1144059, -1.828994, 1, 0.8745098, 0, 1,
-1.104788, -1.664099, -2.186018, 1, 0.8823529, 0, 1,
-1.088174, 0.1993401, -3.140527, 1, 0.8862745, 0, 1,
-1.087134, 1.01508, -0.480796, 1, 0.8941177, 0, 1,
-1.079773, 0.6929661, -1.355672, 1, 0.8980392, 0, 1,
-1.077903, 0.2334945, -1.48901, 1, 0.9058824, 0, 1,
-1.077705, -0.1626803, -2.102724, 1, 0.9137255, 0, 1,
-1.072793, -0.4366988, -2.201004, 1, 0.9176471, 0, 1,
-1.070277, 0.03159989, -2.550499, 1, 0.9254902, 0, 1,
-1.066205, 1.475812, -1.093666, 1, 0.9294118, 0, 1,
-1.054335, 1.38179, 0.4521049, 1, 0.9372549, 0, 1,
-1.05104, -0.6444223, -2.214731, 1, 0.9411765, 0, 1,
-1.049567, 0.7377617, 1.155756, 1, 0.9490196, 0, 1,
-1.045455, 0.1216372, 0.05181867, 1, 0.9529412, 0, 1,
-1.03585, -0.1069, -2.189746, 1, 0.9607843, 0, 1,
-1.02884, -0.05733888, -0.9159881, 1, 0.9647059, 0, 1,
-1.027884, 0.7840105, 0.5858079, 1, 0.972549, 0, 1,
-1.015848, 1.062967, -0.2962526, 1, 0.9764706, 0, 1,
-1.0058, 1.619466, -2.202311, 1, 0.9843137, 0, 1,
-1.005203, -1.0889, -1.258488, 1, 0.9882353, 0, 1,
-1.000638, 0.03223891, -0.9107118, 1, 0.9960784, 0, 1,
-0.9868311, -0.1525059, 0.0126724, 0.9960784, 1, 0, 1,
-0.9855738, -2.056603, -3.713983, 0.9921569, 1, 0, 1,
-0.9811603, -2.089512, -3.798549, 0.9843137, 1, 0, 1,
-0.9717875, 0.1945914, -1.611815, 0.9803922, 1, 0, 1,
-0.9683872, -0.2061366, -3.610762, 0.972549, 1, 0, 1,
-0.9578259, 0.2191724, -1.649102, 0.9686275, 1, 0, 1,
-0.9559227, -0.7536919, -4.088671, 0.9607843, 1, 0, 1,
-0.950951, 2.301292, 0.3641436, 0.9568627, 1, 0, 1,
-0.9487782, 0.571223, -1.426797, 0.9490196, 1, 0, 1,
-0.9462254, 0.2909073, -1.579044, 0.945098, 1, 0, 1,
-0.9389135, 0.06376714, -0.6572803, 0.9372549, 1, 0, 1,
-0.9387759, 0.1819585, -0.1154002, 0.9333333, 1, 0, 1,
-0.9375677, 0.2721776, -2.560532, 0.9254902, 1, 0, 1,
-0.931419, -0.5765225, -2.548235, 0.9215686, 1, 0, 1,
-0.9301761, -0.9066584, -0.240961, 0.9137255, 1, 0, 1,
-0.9251311, 0.8315341, -0.9664089, 0.9098039, 1, 0, 1,
-0.9235764, 0.4649299, 1.665892, 0.9019608, 1, 0, 1,
-0.9065024, -0.5007676, -1.303798, 0.8941177, 1, 0, 1,
-0.9046058, -1.011209, -3.203646, 0.8901961, 1, 0, 1,
-0.9024929, -2.097181, -3.120486, 0.8823529, 1, 0, 1,
-0.90052, 0.4113329, -0.1312675, 0.8784314, 1, 0, 1,
-0.891659, 2.248569, -1.896646, 0.8705882, 1, 0, 1,
-0.8907862, -1.454052, -2.434096, 0.8666667, 1, 0, 1,
-0.885797, 0.3891995, -1.245423, 0.8588235, 1, 0, 1,
-0.8841976, 0.1542756, -1.638465, 0.854902, 1, 0, 1,
-0.8827925, 0.8332552, -1.580152, 0.8470588, 1, 0, 1,
-0.8807011, -0.3375519, -0.5500302, 0.8431373, 1, 0, 1,
-0.8761579, -0.4664988, -1.963079, 0.8352941, 1, 0, 1,
-0.8727875, 2.55033, -0.154728, 0.8313726, 1, 0, 1,
-0.8647948, -0.4210881, -3.919977, 0.8235294, 1, 0, 1,
-0.8611279, 0.5816662, -1.765679, 0.8196079, 1, 0, 1,
-0.8552248, -0.5096194, -2.889501, 0.8117647, 1, 0, 1,
-0.8376084, 0.7151323, -1.377044, 0.8078431, 1, 0, 1,
-0.824797, -0.8239113, -2.735428, 0.8, 1, 0, 1,
-0.8238615, 0.1983626, -2.461951, 0.7921569, 1, 0, 1,
-0.8234441, 0.9166031, 2.009361, 0.7882353, 1, 0, 1,
-0.8233601, 1.319928, 0.19323, 0.7803922, 1, 0, 1,
-0.8181305, 0.4160638, -0.5046026, 0.7764706, 1, 0, 1,
-0.8146637, -0.105869, -1.48244, 0.7686275, 1, 0, 1,
-0.8121729, 0.5730908, 0.203847, 0.7647059, 1, 0, 1,
-0.8059386, 0.1525353, -0.9141482, 0.7568628, 1, 0, 1,
-0.8040659, -0.5995225, -1.755238, 0.7529412, 1, 0, 1,
-0.801958, 0.06567981, -0.1607254, 0.7450981, 1, 0, 1,
-0.8005061, 1.038446, -0.1364393, 0.7411765, 1, 0, 1,
-0.7968829, -0.04235794, -2.667101, 0.7333333, 1, 0, 1,
-0.7966302, 0.52846, -2.027274, 0.7294118, 1, 0, 1,
-0.7950048, 1.659039, -0.3180289, 0.7215686, 1, 0, 1,
-0.7840456, -0.5199181, -0.8142402, 0.7176471, 1, 0, 1,
-0.7826957, -1.237015, -3.370526, 0.7098039, 1, 0, 1,
-0.7812183, -2.537741, -0.856113, 0.7058824, 1, 0, 1,
-0.7775293, -0.9088441, -3.082833, 0.6980392, 1, 0, 1,
-0.7746577, -0.9777753, -2.744501, 0.6901961, 1, 0, 1,
-0.7708324, 0.9921845, -0.9284668, 0.6862745, 1, 0, 1,
-0.7701963, 0.7636784, 0.3399226, 0.6784314, 1, 0, 1,
-0.7669629, -0.8596688, -2.855284, 0.6745098, 1, 0, 1,
-0.7620448, -0.3855712, -2.631989, 0.6666667, 1, 0, 1,
-0.7603219, 0.9194326, -2.046957, 0.6627451, 1, 0, 1,
-0.7591642, 1.865776, 0.5452197, 0.654902, 1, 0, 1,
-0.7588139, 0.2918489, -0.2213583, 0.6509804, 1, 0, 1,
-0.7569913, -1.166251, -3.645361, 0.6431373, 1, 0, 1,
-0.7565289, -0.7063625, -1.937505, 0.6392157, 1, 0, 1,
-0.7554315, -0.4361742, -3.350299, 0.6313726, 1, 0, 1,
-0.750726, -0.3651368, -3.257682, 0.627451, 1, 0, 1,
-0.7394285, -0.5566544, -1.836431, 0.6196079, 1, 0, 1,
-0.7377009, -1.451885, -1.715823, 0.6156863, 1, 0, 1,
-0.7339344, 0.2942035, -1.345782, 0.6078432, 1, 0, 1,
-0.7330506, 1.037588, 0.7204847, 0.6039216, 1, 0, 1,
-0.7294283, -0.209285, -1.487188, 0.5960785, 1, 0, 1,
-0.7268836, -0.7357619, -2.820847, 0.5882353, 1, 0, 1,
-0.72506, 0.04581035, -1.31716, 0.5843138, 1, 0, 1,
-0.7242118, -0.5505234, -2.390796, 0.5764706, 1, 0, 1,
-0.7202946, 0.3700622, -1.261762, 0.572549, 1, 0, 1,
-0.7155985, -0.3236616, -1.170649, 0.5647059, 1, 0, 1,
-0.7143536, 0.3339859, -2.406196, 0.5607843, 1, 0, 1,
-0.7091245, -0.03987314, -1.454902, 0.5529412, 1, 0, 1,
-0.7036058, 1.450091, -0.8967414, 0.5490196, 1, 0, 1,
-0.6969451, 0.4822617, -0.4978401, 0.5411765, 1, 0, 1,
-0.6953663, 2.073739, 1.178765, 0.5372549, 1, 0, 1,
-0.6906136, -0.9292668, -2.583271, 0.5294118, 1, 0, 1,
-0.6868259, 0.7053985, -1.857618, 0.5254902, 1, 0, 1,
-0.6808893, 1.011797, 0.1339099, 0.5176471, 1, 0, 1,
-0.6803788, -0.8081481, -3.024197, 0.5137255, 1, 0, 1,
-0.6736699, 0.3052821, -1.297091, 0.5058824, 1, 0, 1,
-0.6720801, 0.9761789, -1.510065, 0.5019608, 1, 0, 1,
-0.6716456, -1.292753, -1.678412, 0.4941176, 1, 0, 1,
-0.6642352, -0.9247807, -3.281112, 0.4862745, 1, 0, 1,
-0.6637905, -0.2646897, -0.5636904, 0.4823529, 1, 0, 1,
-0.6578124, -0.7291566, -1.678178, 0.4745098, 1, 0, 1,
-0.6561167, -0.03917627, -0.1778398, 0.4705882, 1, 0, 1,
-0.6522804, 1.044082, 0.6470442, 0.4627451, 1, 0, 1,
-0.6501586, -0.1895861, -0.7069508, 0.4588235, 1, 0, 1,
-0.6496224, 0.703871, 0.0989746, 0.4509804, 1, 0, 1,
-0.6493796, -0.7378058, -3.244846, 0.4470588, 1, 0, 1,
-0.6487145, -0.7733345, -3.428354, 0.4392157, 1, 0, 1,
-0.648424, 0.1216763, -2.502392, 0.4352941, 1, 0, 1,
-0.6475542, 1.629572, 1.216335, 0.427451, 1, 0, 1,
-0.6440794, -0.6031841, -2.864616, 0.4235294, 1, 0, 1,
-0.6410643, -1.015516, -2.967461, 0.4156863, 1, 0, 1,
-0.6381329, 0.3928511, -1.566617, 0.4117647, 1, 0, 1,
-0.6345791, 1.427094, -1.425472, 0.4039216, 1, 0, 1,
-0.6321024, -0.0453313, -2.95316, 0.3960784, 1, 0, 1,
-0.6301756, 1.110242, 0.4058379, 0.3921569, 1, 0, 1,
-0.627593, -0.4705798, -0.7776242, 0.3843137, 1, 0, 1,
-0.6258581, 0.05331233, -1.199593, 0.3803922, 1, 0, 1,
-0.6225507, -0.05012438, -1.121424, 0.372549, 1, 0, 1,
-0.6177106, -1.129229, -3.0791, 0.3686275, 1, 0, 1,
-0.6122429, 1.112771, -1.045006, 0.3607843, 1, 0, 1,
-0.6106205, 0.5729139, -1.332838, 0.3568628, 1, 0, 1,
-0.6019893, 0.5996448, 0.6880521, 0.3490196, 1, 0, 1,
-0.6015124, -0.2507004, -1.987284, 0.345098, 1, 0, 1,
-0.6011198, 1.603951, -0.3661745, 0.3372549, 1, 0, 1,
-0.6004522, 0.2973219, -1.613268, 0.3333333, 1, 0, 1,
-0.5975246, -0.5804498, -2.540364, 0.3254902, 1, 0, 1,
-0.5870601, -0.768609, -3.52485, 0.3215686, 1, 0, 1,
-0.5827973, 0.107375, 0.1840587, 0.3137255, 1, 0, 1,
-0.5743394, -0.3333125, -3.013715, 0.3098039, 1, 0, 1,
-0.5729062, -0.05380888, -1.041933, 0.3019608, 1, 0, 1,
-0.5697275, -0.5732678, -2.678676, 0.2941177, 1, 0, 1,
-0.5583989, 0.689095, -1.911063, 0.2901961, 1, 0, 1,
-0.5541157, -1.128196, -3.754416, 0.282353, 1, 0, 1,
-0.5520362, 0.1690014, -2.4116, 0.2784314, 1, 0, 1,
-0.547892, -0.2727951, -1.36048, 0.2705882, 1, 0, 1,
-0.5474136, -0.8331038, -1.63816, 0.2666667, 1, 0, 1,
-0.5440676, 0.05887571, -1.988088, 0.2588235, 1, 0, 1,
-0.540458, 0.6354445, -0.6893578, 0.254902, 1, 0, 1,
-0.5374127, 0.7258931, -2.092716, 0.2470588, 1, 0, 1,
-0.536835, 0.6427214, -1.24944, 0.2431373, 1, 0, 1,
-0.5354612, 0.004150257, -1.939056, 0.2352941, 1, 0, 1,
-0.5354152, -0.07703839, -2.652756, 0.2313726, 1, 0, 1,
-0.5351845, 1.545059, -0.6962314, 0.2235294, 1, 0, 1,
-0.531325, -0.6537585, -3.978628, 0.2196078, 1, 0, 1,
-0.5306394, -2.131493, -3.867427, 0.2117647, 1, 0, 1,
-0.5295517, 1.240421, 1.630021, 0.2078431, 1, 0, 1,
-0.5291985, 0.8018463, -0.2136498, 0.2, 1, 0, 1,
-0.5291114, -1.921949, -1.846263, 0.1921569, 1, 0, 1,
-0.5283746, -0.5496395, -1.641224, 0.1882353, 1, 0, 1,
-0.5195318, -0.06043091, -1.387743, 0.1803922, 1, 0, 1,
-0.5134069, -0.3256538, -1.657099, 0.1764706, 1, 0, 1,
-0.5130519, -0.4830624, -2.297598, 0.1686275, 1, 0, 1,
-0.5129652, -1.781935, -4.584955, 0.1647059, 1, 0, 1,
-0.5126186, 1.013951, 0.2507807, 0.1568628, 1, 0, 1,
-0.5116609, -2.451828, -2.13589, 0.1529412, 1, 0, 1,
-0.5086898, -0.2310034, -0.7960988, 0.145098, 1, 0, 1,
-0.5069436, -1.634014, -3.476077, 0.1411765, 1, 0, 1,
-0.503713, 0.4792652, 0.711576, 0.1333333, 1, 0, 1,
-0.5020971, -0.6630251, -2.850878, 0.1294118, 1, 0, 1,
-0.5018877, 0.8750257, -1.174597, 0.1215686, 1, 0, 1,
-0.4971154, 0.7724333, -0.03462581, 0.1176471, 1, 0, 1,
-0.4966501, -0.4680758, -2.273009, 0.1098039, 1, 0, 1,
-0.494536, -1.557887, -2.420048, 0.1058824, 1, 0, 1,
-0.4901185, -0.02666171, -1.158687, 0.09803922, 1, 0, 1,
-0.4892934, 2.195153, -1.6264, 0.09019608, 1, 0, 1,
-0.4880318, 0.3308718, -0.729158, 0.08627451, 1, 0, 1,
-0.4855857, 1.085157, -1.920992, 0.07843138, 1, 0, 1,
-0.4835984, -0.594172, -3.814879, 0.07450981, 1, 0, 1,
-0.4787793, 0.3821259, -0.360779, 0.06666667, 1, 0, 1,
-0.4777244, 0.7854086, -0.2728102, 0.0627451, 1, 0, 1,
-0.4731858, 1.007531, 0.06682926, 0.05490196, 1, 0, 1,
-0.4694706, -0.7575587, -1.505292, 0.05098039, 1, 0, 1,
-0.4652904, 0.7644043, -0.5593321, 0.04313726, 1, 0, 1,
-0.4637752, 0.0961172, -1.276384, 0.03921569, 1, 0, 1,
-0.4607019, 0.5454398, 0.2102866, 0.03137255, 1, 0, 1,
-0.4560891, -0.5642523, -3.904333, 0.02745098, 1, 0, 1,
-0.4556878, -0.7536929, -2.050933, 0.01960784, 1, 0, 1,
-0.4525461, -0.1598157, -1.817924, 0.01568628, 1, 0, 1,
-0.4451647, -0.3631614, -1.046259, 0.007843138, 1, 0, 1,
-0.4398839, -1.478226, -3.026247, 0.003921569, 1, 0, 1,
-0.4367944, 0.4715989, -0.7418489, 0, 1, 0.003921569, 1,
-0.4365454, 0.9005433, -1.373975, 0, 1, 0.01176471, 1,
-0.4317891, -0.8911805, -2.777158, 0, 1, 0.01568628, 1,
-0.4306488, 0.2775982, -0.8168597, 0, 1, 0.02352941, 1,
-0.4273388, -1.092289, -3.253828, 0, 1, 0.02745098, 1,
-0.4238617, 1.91926, -0.3666319, 0, 1, 0.03529412, 1,
-0.4222954, 0.2667282, -1.720177, 0, 1, 0.03921569, 1,
-0.420837, -0.6592512, -1.806764, 0, 1, 0.04705882, 1,
-0.4201502, -1.681326, -3.047453, 0, 1, 0.05098039, 1,
-0.4170696, -0.6050249, -2.847621, 0, 1, 0.05882353, 1,
-0.4114809, -0.8097088, -1.170828, 0, 1, 0.0627451, 1,
-0.4109791, 0.4504473, 0.5734814, 0, 1, 0.07058824, 1,
-0.4070388, 0.3072929, -0.8779803, 0, 1, 0.07450981, 1,
-0.4032227, -0.5172531, -3.841236, 0, 1, 0.08235294, 1,
-0.4008206, -0.5022727, -0.8012061, 0, 1, 0.08627451, 1,
-0.400797, -0.6917049, -3.808779, 0, 1, 0.09411765, 1,
-0.4005027, -1.3332, -2.570526, 0, 1, 0.1019608, 1,
-0.3989767, 0.5304055, -1.440622, 0, 1, 0.1058824, 1,
-0.395967, 0.2276836, -0.3640315, 0, 1, 0.1137255, 1,
-0.3952053, 0.2362146, -0.3941872, 0, 1, 0.1176471, 1,
-0.3873156, -0.3451122, -2.407916, 0, 1, 0.1254902, 1,
-0.3850289, -1.529302, -2.639338, 0, 1, 0.1294118, 1,
-0.3847038, -0.2600383, 0.628242, 0, 1, 0.1372549, 1,
-0.3833127, 0.7732854, -1.527346, 0, 1, 0.1411765, 1,
-0.3831761, -0.1876043, -1.830297, 0, 1, 0.1490196, 1,
-0.3807023, 0.6213642, -0.1809993, 0, 1, 0.1529412, 1,
-0.377141, 0.9479042, -0.6531518, 0, 1, 0.1607843, 1,
-0.3760507, -0.05880125, -3.077055, 0, 1, 0.1647059, 1,
-0.3745615, -0.941686, -2.127022, 0, 1, 0.172549, 1,
-0.3697568, -0.01322583, -2.775428, 0, 1, 0.1764706, 1,
-0.3633712, -0.499594, -1.497488, 0, 1, 0.1843137, 1,
-0.3570563, 0.3444703, -0.5937194, 0, 1, 0.1882353, 1,
-0.3494803, -2.13795, -2.497555, 0, 1, 0.1960784, 1,
-0.3423077, -0.1615985, -4.27255, 0, 1, 0.2039216, 1,
-0.3402124, 0.08001541, -1.383457, 0, 1, 0.2078431, 1,
-0.3384476, 0.8431514, -0.3344041, 0, 1, 0.2156863, 1,
-0.3366051, 2.030891, -0.5812028, 0, 1, 0.2196078, 1,
-0.333511, -1.511844, -3.564424, 0, 1, 0.227451, 1,
-0.3290215, -1.086814, -5.397897, 0, 1, 0.2313726, 1,
-0.3274722, -0.1829554, -2.392834, 0, 1, 0.2392157, 1,
-0.3252232, -0.5246748, -2.96025, 0, 1, 0.2431373, 1,
-0.3226498, 0.6681108, -1.461445, 0, 1, 0.2509804, 1,
-0.3185892, -0.6163479, -3.548151, 0, 1, 0.254902, 1,
-0.3184954, -0.3495978, -2.193017, 0, 1, 0.2627451, 1,
-0.315307, 0.8243681, 0.1754279, 0, 1, 0.2666667, 1,
-0.3140032, 2.035319, 0.6722319, 0, 1, 0.2745098, 1,
-0.3131987, 1.51861, 2.054912, 0, 1, 0.2784314, 1,
-0.3101464, 0.6816936, -2.005031, 0, 1, 0.2862745, 1,
-0.3100614, -1.17005, -3.608238, 0, 1, 0.2901961, 1,
-0.3096189, 1.282951, -0.9661454, 0, 1, 0.2980392, 1,
-0.3094706, 0.4142574, -0.4818606, 0, 1, 0.3058824, 1,
-0.3087375, -0.1652795, -2.230835, 0, 1, 0.3098039, 1,
-0.3085491, -0.0595389, 0.3483929, 0, 1, 0.3176471, 1,
-0.3057816, -1.008501, -2.9481, 0, 1, 0.3215686, 1,
-0.3018455, 1.534756, -0.1538081, 0, 1, 0.3294118, 1,
-0.2977821, 0.3768082, -0.4576561, 0, 1, 0.3333333, 1,
-0.2964223, -0.9452799, -4.541378, 0, 1, 0.3411765, 1,
-0.2931278, -0.1016228, -0.7501606, 0, 1, 0.345098, 1,
-0.2854217, -0.4945605, -2.242697, 0, 1, 0.3529412, 1,
-0.2829785, 1.569165, -2.451756, 0, 1, 0.3568628, 1,
-0.2812116, -0.5043882, -1.232286, 0, 1, 0.3647059, 1,
-0.2803087, -0.8668551, -2.673038, 0, 1, 0.3686275, 1,
-0.2770711, -0.3962646, -3.168631, 0, 1, 0.3764706, 1,
-0.2760735, -0.9929053, -2.056072, 0, 1, 0.3803922, 1,
-0.2732768, -1.00423, -5.139913, 0, 1, 0.3882353, 1,
-0.2711438, 0.01306223, -0.6232975, 0, 1, 0.3921569, 1,
-0.2650541, -0.3390175, -2.823102, 0, 1, 0.4, 1,
-0.2648587, -1.881909, -3.43035, 0, 1, 0.4078431, 1,
-0.2600815, 1.376749, 0.01399112, 0, 1, 0.4117647, 1,
-0.2596353, -0.3398015, -2.333774, 0, 1, 0.4196078, 1,
-0.2583607, -0.1683732, -3.864837, 0, 1, 0.4235294, 1,
-0.2511187, 0.1117147, -1.352725, 0, 1, 0.4313726, 1,
-0.2485137, -1.203499, -4.413818, 0, 1, 0.4352941, 1,
-0.2476798, 1.929535, -0.0493065, 0, 1, 0.4431373, 1,
-0.244927, -0.9360673, -3.142123, 0, 1, 0.4470588, 1,
-0.241038, 1.089039, -0.5204509, 0, 1, 0.454902, 1,
-0.2345262, 0.6895944, 0.9189949, 0, 1, 0.4588235, 1,
-0.2292209, -1.700934, -3.425617, 0, 1, 0.4666667, 1,
-0.2246255, 0.6509234, 0.2130138, 0, 1, 0.4705882, 1,
-0.2237493, 0.6357651, 0.9752634, 0, 1, 0.4784314, 1,
-0.2227124, -2.351688, -3.345281, 0, 1, 0.4823529, 1,
-0.2167879, -0.1356667, -2.420435, 0, 1, 0.4901961, 1,
-0.2161178, -1.74005, -2.926338, 0, 1, 0.4941176, 1,
-0.2134998, -0.1104317, -1.678415, 0, 1, 0.5019608, 1,
-0.2133483, 0.7921109, 1.487051, 0, 1, 0.509804, 1,
-0.2124487, 1.799658, 0.07529373, 0, 1, 0.5137255, 1,
-0.2108098, -1.202715, -3.272016, 0, 1, 0.5215687, 1,
-0.2045434, -2.312783, -1.894864, 0, 1, 0.5254902, 1,
-0.2036966, 0.1741695, 0.3553062, 0, 1, 0.5333334, 1,
-0.2026454, -0.1516103, -1.124629, 0, 1, 0.5372549, 1,
-0.2023348, 0.5117025, -2.041013, 0, 1, 0.5450981, 1,
-0.1976812, -1.003575, -3.026368, 0, 1, 0.5490196, 1,
-0.1969992, 2.265513, -2.368635, 0, 1, 0.5568628, 1,
-0.1953744, -1.017534, -1.377468, 0, 1, 0.5607843, 1,
-0.1916678, 0.7958782, -1.316621, 0, 1, 0.5686275, 1,
-0.1885152, -1.130843, -3.866232, 0, 1, 0.572549, 1,
-0.1884634, 0.8185022, -2.879046, 0, 1, 0.5803922, 1,
-0.1881961, -1.928957, -1.314482, 0, 1, 0.5843138, 1,
-0.1858115, -1.780214, -3.318617, 0, 1, 0.5921569, 1,
-0.1838224, 0.8911135, -1.945454, 0, 1, 0.5960785, 1,
-0.1800123, 1.528502, 0.2609165, 0, 1, 0.6039216, 1,
-0.1748816, -1.984712, -1.612087, 0, 1, 0.6117647, 1,
-0.1708405, 0.755727, -0.8592066, 0, 1, 0.6156863, 1,
-0.170481, 0.4538564, -1.602614, 0, 1, 0.6235294, 1,
-0.1694705, -0.5988696, -1.543862, 0, 1, 0.627451, 1,
-0.1679568, 1.773257, 1.09166, 0, 1, 0.6352941, 1,
-0.1642235, -0.3406539, -1.685795, 0, 1, 0.6392157, 1,
-0.164172, -0.04135545, -0.09385581, 0, 1, 0.6470588, 1,
-0.1582261, -1.080078, -3.771502, 0, 1, 0.6509804, 1,
-0.1580318, -1.058218, -2.008631, 0, 1, 0.6588235, 1,
-0.1516059, 1.943218, -0.4116378, 0, 1, 0.6627451, 1,
-0.1496686, 0.7075143, -0.5809609, 0, 1, 0.6705883, 1,
-0.1490518, -0.4882272, -2.470082, 0, 1, 0.6745098, 1,
-0.1479368, -0.4719013, -3.175898, 0, 1, 0.682353, 1,
-0.1461958, 0.3849612, -1.437138, 0, 1, 0.6862745, 1,
-0.1461304, -1.297823, -1.599446, 0, 1, 0.6941177, 1,
-0.1459812, -0.8265083, -1.990983, 0, 1, 0.7019608, 1,
-0.1441569, -1.237324, -1.858076, 0, 1, 0.7058824, 1,
-0.1376742, -0.6874858, -1.970377, 0, 1, 0.7137255, 1,
-0.1365376, 2.570089, 0.4582104, 0, 1, 0.7176471, 1,
-0.1327236, 2.840565, -0.8692589, 0, 1, 0.7254902, 1,
-0.1321848, -0.4828742, -2.650486, 0, 1, 0.7294118, 1,
-0.1313066, 0.9991148, 0.5308897, 0, 1, 0.7372549, 1,
-0.1307116, -1.147075, -3.668396, 0, 1, 0.7411765, 1,
-0.1255563, 0.6150824, -0.635738, 0, 1, 0.7490196, 1,
-0.1158069, -0.595271, -2.701587, 0, 1, 0.7529412, 1,
-0.1141821, 0.1278435, -1.233399, 0, 1, 0.7607843, 1,
-0.1138348, 0.1939211, 0.4948691, 0, 1, 0.7647059, 1,
-0.1137096, 0.1909665, -0.5498376, 0, 1, 0.772549, 1,
-0.1112571, 0.2331532, -0.1303855, 0, 1, 0.7764706, 1,
-0.106788, -2.048568, -4.758474, 0, 1, 0.7843137, 1,
-0.1059234, -2.549027, -3.185115, 0, 1, 0.7882353, 1,
-0.1049632, -1.491987, -3.786433, 0, 1, 0.7960784, 1,
-0.1035728, 2.034899, 1.124918, 0, 1, 0.8039216, 1,
-0.1031048, 2.647619, -2.058961, 0, 1, 0.8078431, 1,
-0.1030886, -0.2720303, -2.187003, 0, 1, 0.8156863, 1,
-0.1028604, -0.2110207, -4.949928, 0, 1, 0.8196079, 1,
-0.1014966, 1.527738, -2.763456, 0, 1, 0.827451, 1,
-0.1013285, 1.820674, -0.2934619, 0, 1, 0.8313726, 1,
-0.09795945, 1.101601, 0.3167167, 0, 1, 0.8392157, 1,
-0.09551562, -0.05460532, -1.880256, 0, 1, 0.8431373, 1,
-0.09414741, 0.3894535, 0.09110288, 0, 1, 0.8509804, 1,
-0.09283302, 1.15416, -0.6435104, 0, 1, 0.854902, 1,
-0.08703341, 0.1747468, -0.9834012, 0, 1, 0.8627451, 1,
-0.08510155, -0.07096293, -3.221699, 0, 1, 0.8666667, 1,
-0.08358998, -0.01800255, -0.6027308, 0, 1, 0.8745098, 1,
-0.08041985, -0.05534146, -1.931844, 0, 1, 0.8784314, 1,
-0.07893121, 2.316301, -1.721318, 0, 1, 0.8862745, 1,
-0.07801091, 0.648544, -1.27781, 0, 1, 0.8901961, 1,
-0.07712363, -0.1062614, -2.957999, 0, 1, 0.8980392, 1,
-0.07607728, -0.9243878, -4.320872, 0, 1, 0.9058824, 1,
-0.07532349, 1.167365, -1.105081, 0, 1, 0.9098039, 1,
-0.07308872, -0.2081512, -2.00996, 0, 1, 0.9176471, 1,
-0.06946911, -0.2072484, -1.873505, 0, 1, 0.9215686, 1,
-0.06884564, 0.175683, 0.7825025, 0, 1, 0.9294118, 1,
-0.0688036, 0.4719374, -0.3726116, 0, 1, 0.9333333, 1,
-0.06849539, -0.001218821, -2.889002, 0, 1, 0.9411765, 1,
-0.06553301, 0.6958107, -0.3587125, 0, 1, 0.945098, 1,
-0.06398943, 0.3990643, -0.8399227, 0, 1, 0.9529412, 1,
-0.06200202, -0.5786942, -3.169481, 0, 1, 0.9568627, 1,
-0.06095529, -1.125907, -3.311376, 0, 1, 0.9647059, 1,
-0.05721841, 1.766657, 0.4429489, 0, 1, 0.9686275, 1,
-0.05436867, 0.8371683, 0.6412929, 0, 1, 0.9764706, 1,
-0.04707661, -1.569677, -3.067821, 0, 1, 0.9803922, 1,
-0.03989435, 0.7480558, 0.7120706, 0, 1, 0.9882353, 1,
-0.03830884, -1.476866, -2.035146, 0, 1, 0.9921569, 1,
-0.03699647, -1.696328, -1.430378, 0, 1, 1, 1,
-0.03317002, 0.6423428, -0.6596066, 0, 0.9921569, 1, 1,
-0.03243035, 1.165926, -0.5117381, 0, 0.9882353, 1, 1,
-0.02922321, 1.127166, 0.2247635, 0, 0.9803922, 1, 1,
-0.02507997, -1.512153, -1.830291, 0, 0.9764706, 1, 1,
-0.02252734, 0.679983, -0.5197083, 0, 0.9686275, 1, 1,
-0.0221912, -0.05268373, -2.842379, 0, 0.9647059, 1, 1,
-0.01917771, -0.1069691, -2.840116, 0, 0.9568627, 1, 1,
-0.01843865, 2.439152, -1.059931, 0, 0.9529412, 1, 1,
-0.01615569, 0.5634506, 0.8330985, 0, 0.945098, 1, 1,
-0.007512632, 0.4833982, 1.397466, 0, 0.9411765, 1, 1,
-0.004061036, 0.8529549, -1.396637, 0, 0.9333333, 1, 1,
-0.00162275, 1.764836, -0.7073603, 0, 0.9294118, 1, 1,
0.006845404, -0.2344452, 2.792483, 0, 0.9215686, 1, 1,
0.00869833, 0.7816763, -0.2084318, 0, 0.9176471, 1, 1,
0.0153473, -0.7284482, 3.35412, 0, 0.9098039, 1, 1,
0.01584844, -0.6370933, 2.685582, 0, 0.9058824, 1, 1,
0.01893688, -0.5708637, 1.886481, 0, 0.8980392, 1, 1,
0.02382874, 1.852988, -0.1748289, 0, 0.8901961, 1, 1,
0.02628444, -0.3514752, 2.918454, 0, 0.8862745, 1, 1,
0.03292726, -1.803702, 1.541492, 0, 0.8784314, 1, 1,
0.03461685, -0.4377277, 2.502307, 0, 0.8745098, 1, 1,
0.04905046, 0.9597124, 0.4382145, 0, 0.8666667, 1, 1,
0.05072841, 0.5316384, -0.2759452, 0, 0.8627451, 1, 1,
0.05212155, -0.05498502, 2.084311, 0, 0.854902, 1, 1,
0.05224429, -0.8491986, 2.631205, 0, 0.8509804, 1, 1,
0.05395058, 0.5103775, 1.978474, 0, 0.8431373, 1, 1,
0.05493094, 1.251738, 2.247821, 0, 0.8392157, 1, 1,
0.06093973, 1.000764, 1.983978, 0, 0.8313726, 1, 1,
0.06098627, -0.6918011, 3.047853, 0, 0.827451, 1, 1,
0.0630664, -0.1695262, 2.021345, 0, 0.8196079, 1, 1,
0.0649517, 1.742686, -0.494451, 0, 0.8156863, 1, 1,
0.06655583, 1.655361, 0.1110113, 0, 0.8078431, 1, 1,
0.07512553, 2.27151, 1.240986, 0, 0.8039216, 1, 1,
0.07604022, -1.641295, 2.952617, 0, 0.7960784, 1, 1,
0.0820156, -1.011794, 2.113927, 0, 0.7882353, 1, 1,
0.08243334, -0.2562845, 3.131662, 0, 0.7843137, 1, 1,
0.08434684, -0.3612796, 3.149225, 0, 0.7764706, 1, 1,
0.08467656, 0.1378602, 0.5042261, 0, 0.772549, 1, 1,
0.08903835, 0.6379326, 0.9969256, 0, 0.7647059, 1, 1,
0.0975205, -1.889923, 3.486471, 0, 0.7607843, 1, 1,
0.09828999, 1.539578, -1.40924, 0, 0.7529412, 1, 1,
0.09865823, 0.172331, 0.6129661, 0, 0.7490196, 1, 1,
0.1054619, -0.07208393, 1.496632, 0, 0.7411765, 1, 1,
0.1068551, 0.9667839, -1.556224, 0, 0.7372549, 1, 1,
0.1118419, -0.9240472, 2.096524, 0, 0.7294118, 1, 1,
0.1149231, -1.271703, 2.121153, 0, 0.7254902, 1, 1,
0.1176065, 1.118192, -0.8418516, 0, 0.7176471, 1, 1,
0.1208716, -0.7846881, 1.748935, 0, 0.7137255, 1, 1,
0.1407288, -0.489772, 2.832419, 0, 0.7058824, 1, 1,
0.1408516, 0.7934865, -0.4280169, 0, 0.6980392, 1, 1,
0.1443815, 0.1768634, 0.04434576, 0, 0.6941177, 1, 1,
0.1447241, 1.81058, 1.469697, 0, 0.6862745, 1, 1,
0.1461221, -0.8567353, 1.611131, 0, 0.682353, 1, 1,
0.1483052, 0.3574544, -1.093154, 0, 0.6745098, 1, 1,
0.1485043, -1.131236, 3.442295, 0, 0.6705883, 1, 1,
0.1505462, -1.266449, 3.134889, 0, 0.6627451, 1, 1,
0.1528354, 0.9944798, 0.2188045, 0, 0.6588235, 1, 1,
0.1533387, -0.2379462, 3.723043, 0, 0.6509804, 1, 1,
0.1564167, -0.03873716, 3.828598, 0, 0.6470588, 1, 1,
0.1584651, -0.2962024, 2.637041, 0, 0.6392157, 1, 1,
0.1647169, 0.7863926, 0.5061932, 0, 0.6352941, 1, 1,
0.1739362, -1.149787, 3.222614, 0, 0.627451, 1, 1,
0.1777179, -0.09129529, 1.832661, 0, 0.6235294, 1, 1,
0.1778342, -0.7169615, 3.509406, 0, 0.6156863, 1, 1,
0.1825617, 0.2455187, 1.82945, 0, 0.6117647, 1, 1,
0.1843168, -0.2341601, 1.735917, 0, 0.6039216, 1, 1,
0.1851509, 1.494464, 1.032696, 0, 0.5960785, 1, 1,
0.1852314, -0.5747954, 2.554055, 0, 0.5921569, 1, 1,
0.1869599, 1.712522, 0.6410558, 0, 0.5843138, 1, 1,
0.1895247, -1.352047, 3.355927, 0, 0.5803922, 1, 1,
0.1930728, 0.2558328, -0.004584314, 0, 0.572549, 1, 1,
0.1933504, -1.448848, 2.853486, 0, 0.5686275, 1, 1,
0.1960709, 1.079443, 2.514333, 0, 0.5607843, 1, 1,
0.1993414, -0.4880151, 3.182789, 0, 0.5568628, 1, 1,
0.2018952, 0.2460939, 1.42823, 0, 0.5490196, 1, 1,
0.2038749, 0.2085007, 1.635838, 0, 0.5450981, 1, 1,
0.2039428, -0.5169083, 3.609526, 0, 0.5372549, 1, 1,
0.2043037, 1.267457, -0.8434618, 0, 0.5333334, 1, 1,
0.2044288, 0.6778113, 0.4551573, 0, 0.5254902, 1, 1,
0.2048649, 0.7321737, 0.1038013, 0, 0.5215687, 1, 1,
0.2066926, 0.4104623, 0.07575662, 0, 0.5137255, 1, 1,
0.2085203, -0.5578941, 3.312254, 0, 0.509804, 1, 1,
0.211574, 0.9890237, 1.117042, 0, 0.5019608, 1, 1,
0.2138163, 0.3829965, -0.09268119, 0, 0.4941176, 1, 1,
0.2149899, -1.561032, 3.499902, 0, 0.4901961, 1, 1,
0.2228693, -1.044281, 2.993379, 0, 0.4823529, 1, 1,
0.2234136, -0.6183683, 2.906138, 0, 0.4784314, 1, 1,
0.2235616, -0.03464465, 1.924878, 0, 0.4705882, 1, 1,
0.2235804, -0.06794011, 2.558276, 0, 0.4666667, 1, 1,
0.2307167, 0.3879722, 0.7389288, 0, 0.4588235, 1, 1,
0.2326733, 0.9334077, 0.2109414, 0, 0.454902, 1, 1,
0.2350654, -0.9465104, 2.386104, 0, 0.4470588, 1, 1,
0.2351238, -2.271361, 1.851658, 0, 0.4431373, 1, 1,
0.2372365, 0.06554329, 1.622873, 0, 0.4352941, 1, 1,
0.2383886, -0.1954226, 2.065545, 0, 0.4313726, 1, 1,
0.2390401, 0.2166848, 1.244946, 0, 0.4235294, 1, 1,
0.2395754, -0.7229941, 1.570397, 0, 0.4196078, 1, 1,
0.2395801, -1.814888, 3.919308, 0, 0.4117647, 1, 1,
0.2419159, 0.06433057, 1.686125, 0, 0.4078431, 1, 1,
0.2429321, -0.4107774, 2.74932, 0, 0.4, 1, 1,
0.2430272, -1.105427, 3.06539, 0, 0.3921569, 1, 1,
0.2476709, 1.322215, -1.348389, 0, 0.3882353, 1, 1,
0.2480668, -0.6168785, 2.676306, 0, 0.3803922, 1, 1,
0.2482745, 0.1894633, -0.7315008, 0, 0.3764706, 1, 1,
0.2514087, 0.1969571, 0.7353138, 0, 0.3686275, 1, 1,
0.2530828, 1.16764, -0.5357728, 0, 0.3647059, 1, 1,
0.2595795, 0.4641124, 0.1211443, 0, 0.3568628, 1, 1,
0.2600997, 0.9886303, -0.02374511, 0, 0.3529412, 1, 1,
0.2608705, -0.9220149, 3.400691, 0, 0.345098, 1, 1,
0.263963, 0.928134, 0.6988986, 0, 0.3411765, 1, 1,
0.2654446, -0.4645727, 3.883094, 0, 0.3333333, 1, 1,
0.2663337, 0.7744139, 0.1319697, 0, 0.3294118, 1, 1,
0.2671085, 0.8491077, -0.3715841, 0, 0.3215686, 1, 1,
0.2709373, -0.7748413, 2.910873, 0, 0.3176471, 1, 1,
0.2725306, 0.442702, 0.208515, 0, 0.3098039, 1, 1,
0.2738032, 1.698898, -0.5765619, 0, 0.3058824, 1, 1,
0.27381, -1.247487, 2.191336, 0, 0.2980392, 1, 1,
0.275961, 1.438335, 1.514159, 0, 0.2901961, 1, 1,
0.2790192, 0.7559, 1.26943, 0, 0.2862745, 1, 1,
0.2797143, 1.435388, -1.791879, 0, 0.2784314, 1, 1,
0.2854813, -0.4468817, 2.072335, 0, 0.2745098, 1, 1,
0.287946, 0.3582705, -0.172936, 0, 0.2666667, 1, 1,
0.2951356, -0.3276327, 2.405056, 0, 0.2627451, 1, 1,
0.2955664, -0.6666256, 0.9901457, 0, 0.254902, 1, 1,
0.2973917, 0.427182, 1.775072, 0, 0.2509804, 1, 1,
0.298231, 0.5893632, 0.569055, 0, 0.2431373, 1, 1,
0.3000024, 0.1410236, 0.8070015, 0, 0.2392157, 1, 1,
0.303441, -1.276918, 3.972879, 0, 0.2313726, 1, 1,
0.310201, -1.28322, 5.440045, 0, 0.227451, 1, 1,
0.3128634, 0.7797368, 0.1776105, 0, 0.2196078, 1, 1,
0.3233186, 1.543504, -1.515391, 0, 0.2156863, 1, 1,
0.323681, 0.8631729, 0.361222, 0, 0.2078431, 1, 1,
0.3319767, -2.085334, 3.712706, 0, 0.2039216, 1, 1,
0.3327744, 0.4966375, -0.6347339, 0, 0.1960784, 1, 1,
0.3345436, 0.7846373, -0.4173246, 0, 0.1882353, 1, 1,
0.3365844, -0.6534924, 2.886258, 0, 0.1843137, 1, 1,
0.339918, 0.6714973, -1.313643, 0, 0.1764706, 1, 1,
0.3501212, 0.3528732, -0.550006, 0, 0.172549, 1, 1,
0.3544576, 0.8293794, 1.386567, 0, 0.1647059, 1, 1,
0.3551702, 0.7861019, -0.3705156, 0, 0.1607843, 1, 1,
0.3553178, 1.15389, -1.000285, 0, 0.1529412, 1, 1,
0.3564361, -1.504994, 2.697322, 0, 0.1490196, 1, 1,
0.358625, -0.6184061, 3.14638, 0, 0.1411765, 1, 1,
0.3596592, 1.46481, 1.68643, 0, 0.1372549, 1, 1,
0.3732743, 0.5237504, 1.372181, 0, 0.1294118, 1, 1,
0.3754205, -0.2022, 2.2645, 0, 0.1254902, 1, 1,
0.3754707, 0.7639121, 1.220644, 0, 0.1176471, 1, 1,
0.3756652, -1.971872, 3.286182, 0, 0.1137255, 1, 1,
0.3792465, -1.942852, 0.7021587, 0, 0.1058824, 1, 1,
0.3841771, -1.914368, 1.526206, 0, 0.09803922, 1, 1,
0.3847166, -0.8970048, 2.128443, 0, 0.09411765, 1, 1,
0.3863047, -1.487506, 2.405034, 0, 0.08627451, 1, 1,
0.3932366, -1.094822, 3.34862, 0, 0.08235294, 1, 1,
0.3944922, -0.2630256, 2.613224, 0, 0.07450981, 1, 1,
0.3951264, -1.015857, 2.501387, 0, 0.07058824, 1, 1,
0.3997458, 0.08044168, 0.9604187, 0, 0.0627451, 1, 1,
0.4006726, -0.1264249, 1.511108, 0, 0.05882353, 1, 1,
0.4050005, 0.05647938, 3.320826, 0, 0.05098039, 1, 1,
0.4079044, -0.7569842, 2.535338, 0, 0.04705882, 1, 1,
0.4110321, 0.2977147, 0.7454013, 0, 0.03921569, 1, 1,
0.4119247, 0.2967032, 1.054282, 0, 0.03529412, 1, 1,
0.4129876, 0.492853, -0.1352038, 0, 0.02745098, 1, 1,
0.4143065, -0.6105765, 4.048547, 0, 0.02352941, 1, 1,
0.4169132, 0.3839923, 0.4355102, 0, 0.01568628, 1, 1,
0.4177344, 0.6944712, 0.04931788, 0, 0.01176471, 1, 1,
0.4237394, 2.219361, 0.8151905, 0, 0.003921569, 1, 1,
0.4240013, 0.3009134, 2.236217, 0.003921569, 0, 1, 1,
0.4253395, 1.109953, -0.02610451, 0.007843138, 0, 1, 1,
0.4260838, -1.610358, 2.38317, 0.01568628, 0, 1, 1,
0.4264604, 0.2620044, 1.576664, 0.01960784, 0, 1, 1,
0.4272791, -1.541621, 4.604568, 0.02745098, 0, 1, 1,
0.4311441, 0.7610986, 0.07354913, 0.03137255, 0, 1, 1,
0.4328856, -0.9508125, 2.981173, 0.03921569, 0, 1, 1,
0.4362555, -0.4579733, 1.52666, 0.04313726, 0, 1, 1,
0.4362706, 0.6977955, 0.2954727, 0.05098039, 0, 1, 1,
0.4384437, -0.1867467, 2.716889, 0.05490196, 0, 1, 1,
0.4443018, 0.4276424, 0.5045778, 0.0627451, 0, 1, 1,
0.4444098, -0.7229807, 1.563446, 0.06666667, 0, 1, 1,
0.447831, 0.9413569, 1.068777, 0.07450981, 0, 1, 1,
0.4508254, -2.310308, 3.317779, 0.07843138, 0, 1, 1,
0.4513939, 2.132201, 0.3082086, 0.08627451, 0, 1, 1,
0.4515101, 0.983318, -0.6970049, 0.09019608, 0, 1, 1,
0.4525285, -0.3282385, 3.379746, 0.09803922, 0, 1, 1,
0.455227, 0.1447169, 3.471719, 0.1058824, 0, 1, 1,
0.4564524, -1.678228, 1.857402, 0.1098039, 0, 1, 1,
0.4592276, -1.163711, 2.492807, 0.1176471, 0, 1, 1,
0.4609926, -0.430467, 2.867551, 0.1215686, 0, 1, 1,
0.4618323, 0.0867337, 0.1761959, 0.1294118, 0, 1, 1,
0.4625553, -0.5188189, 2.745425, 0.1333333, 0, 1, 1,
0.4699196, 1.151719, 1.275763, 0.1411765, 0, 1, 1,
0.4701056, -0.4198492, 2.55557, 0.145098, 0, 1, 1,
0.4726811, 0.6578411, -0.6726784, 0.1529412, 0, 1, 1,
0.4805408, -0.5272335, 2.73904, 0.1568628, 0, 1, 1,
0.4811778, 0.4345024, 0.2570387, 0.1647059, 0, 1, 1,
0.490857, -0.6821259, 3.094981, 0.1686275, 0, 1, 1,
0.4915005, 0.733886, 0.7342674, 0.1764706, 0, 1, 1,
0.4920234, 0.7483308, 1.205085, 0.1803922, 0, 1, 1,
0.4993347, 0.9025737, 1.391927, 0.1882353, 0, 1, 1,
0.5039821, -2.593105, 3.217248, 0.1921569, 0, 1, 1,
0.5075493, 0.6037012, -0.5871047, 0.2, 0, 1, 1,
0.5076768, -0.719707, 0.3546828, 0.2078431, 0, 1, 1,
0.5079401, 0.2254623, 1.405086, 0.2117647, 0, 1, 1,
0.5082154, 1.811882, 1.285922, 0.2196078, 0, 1, 1,
0.5129533, 0.6627474, 1.345791, 0.2235294, 0, 1, 1,
0.5174981, -0.7047125, 2.248795, 0.2313726, 0, 1, 1,
0.5178047, 0.8224883, 0.798711, 0.2352941, 0, 1, 1,
0.5188079, 0.2015241, 0.105787, 0.2431373, 0, 1, 1,
0.5199783, 0.1320156, 2.293397, 0.2470588, 0, 1, 1,
0.530674, 1.436622, -1.700516, 0.254902, 0, 1, 1,
0.5307857, -0.01976793, 1.780636, 0.2588235, 0, 1, 1,
0.5326625, -0.5407693, 1.885776, 0.2666667, 0, 1, 1,
0.5362626, 0.7011147, -0.4073686, 0.2705882, 0, 1, 1,
0.5368425, -0.6741309, 1.381743, 0.2784314, 0, 1, 1,
0.5377074, 0.9300779, 1.194261, 0.282353, 0, 1, 1,
0.5433697, -2.349056, 2.07097, 0.2901961, 0, 1, 1,
0.5461064, -0.3483995, 2.002231, 0.2941177, 0, 1, 1,
0.5478669, 1.135027, 1.782843, 0.3019608, 0, 1, 1,
0.5610963, 1.850101, 0.0547853, 0.3098039, 0, 1, 1,
0.5631258, 0.8933535, -0.5771691, 0.3137255, 0, 1, 1,
0.5681407, 0.7761528, 0.5115614, 0.3215686, 0, 1, 1,
0.5682073, -0.02537213, 2.823602, 0.3254902, 0, 1, 1,
0.5682784, -0.9331178, 2.217326, 0.3333333, 0, 1, 1,
0.5704201, -0.3728237, 2.887333, 0.3372549, 0, 1, 1,
0.5714749, 0.9085717, -0.3649375, 0.345098, 0, 1, 1,
0.5724898, -0.4173384, 1.713002, 0.3490196, 0, 1, 1,
0.5834004, 1.656141, 0.411638, 0.3568628, 0, 1, 1,
0.5835642, -1.101366, 4.04471, 0.3607843, 0, 1, 1,
0.5846727, 0.02454753, 0.9069948, 0.3686275, 0, 1, 1,
0.5848988, 0.2047316, 0.2071173, 0.372549, 0, 1, 1,
0.5861723, -1.395655, 3.477684, 0.3803922, 0, 1, 1,
0.5868838, 0.1064634, 1.28257, 0.3843137, 0, 1, 1,
0.591965, 0.1972134, -0.07326857, 0.3921569, 0, 1, 1,
0.5930638, 0.3453455, 0.738281, 0.3960784, 0, 1, 1,
0.5943854, -1.521228, 2.249491, 0.4039216, 0, 1, 1,
0.5970288, -0.1851252, 2.090603, 0.4117647, 0, 1, 1,
0.5990208, -1.371345, 1.779439, 0.4156863, 0, 1, 1,
0.6044492, 1.634428, 2.27324, 0.4235294, 0, 1, 1,
0.6063657, -0.06144674, 0.2671928, 0.427451, 0, 1, 1,
0.607311, 0.2265092, 2.860416, 0.4352941, 0, 1, 1,
0.6135099, -0.3476852, 0.4896122, 0.4392157, 0, 1, 1,
0.6136623, -0.4308674, 3.599771, 0.4470588, 0, 1, 1,
0.6137314, -0.6560224, 2.461241, 0.4509804, 0, 1, 1,
0.6149154, 1.15018, 0.1715882, 0.4588235, 0, 1, 1,
0.616042, 1.297937, 2.892968, 0.4627451, 0, 1, 1,
0.616459, -1.206677, 4.03422, 0.4705882, 0, 1, 1,
0.6213614, 0.6103556, 0.03281097, 0.4745098, 0, 1, 1,
0.6231236, 2.383094, 0.039624, 0.4823529, 0, 1, 1,
0.6318325, 0.2312806, 0.5312179, 0.4862745, 0, 1, 1,
0.6339878, -1.725291, 2.554706, 0.4941176, 0, 1, 1,
0.6351562, 0.03427775, 1.461099, 0.5019608, 0, 1, 1,
0.6433752, 1.138079, -0.8560066, 0.5058824, 0, 1, 1,
0.645308, 0.2702496, 0.07965599, 0.5137255, 0, 1, 1,
0.6467196, -1.968911, 2.713996, 0.5176471, 0, 1, 1,
0.6474756, -1.836714, 3.161329, 0.5254902, 0, 1, 1,
0.6485468, -0.3029346, 1.005826, 0.5294118, 0, 1, 1,
0.6488737, 0.4240372, -0.3593979, 0.5372549, 0, 1, 1,
0.6502736, 1.123314, -0.7376889, 0.5411765, 0, 1, 1,
0.6598535, -1.647686, 2.353383, 0.5490196, 0, 1, 1,
0.6636322, 1.192041, -0.3554175, 0.5529412, 0, 1, 1,
0.6672496, 0.07540762, 1.304567, 0.5607843, 0, 1, 1,
0.6874334, 1.718456, 1.139585, 0.5647059, 0, 1, 1,
0.6892537, 1.103316, 0.5412939, 0.572549, 0, 1, 1,
0.6979754, 1.337262, -0.7771646, 0.5764706, 0, 1, 1,
0.6984015, -0.4873701, 3.083016, 0.5843138, 0, 1, 1,
0.6991391, 0.5440862, 1.145887, 0.5882353, 0, 1, 1,
0.7020838, -0.2705682, 1.509125, 0.5960785, 0, 1, 1,
0.7026315, 0.1787628, 0.7315707, 0.6039216, 0, 1, 1,
0.7050214, -0.5522905, 1.814376, 0.6078432, 0, 1, 1,
0.7136685, -0.302561, 3.434586, 0.6156863, 0, 1, 1,
0.715789, 0.7787082, -0.07562706, 0.6196079, 0, 1, 1,
0.7178909, 1.18786, -0.6917595, 0.627451, 0, 1, 1,
0.7191374, 0.7924872, 0.5789723, 0.6313726, 0, 1, 1,
0.71938, -0.6719806, 1.16598, 0.6392157, 0, 1, 1,
0.7200581, -0.09821711, 2.398351, 0.6431373, 0, 1, 1,
0.7205214, -0.589948, 1.727884, 0.6509804, 0, 1, 1,
0.7210422, 0.7207407, 1.58703, 0.654902, 0, 1, 1,
0.722934, -0.4457643, 1.229328, 0.6627451, 0, 1, 1,
0.7272531, 1.806102, -0.230545, 0.6666667, 0, 1, 1,
0.7277057, 0.7495098, 0.6579401, 0.6745098, 0, 1, 1,
0.7303664, 0.6396303, 0.2608943, 0.6784314, 0, 1, 1,
0.7446046, 1.278107, 1.386365, 0.6862745, 0, 1, 1,
0.7540421, -0.3434302, 1.975248, 0.6901961, 0, 1, 1,
0.7572279, -0.2324293, 1.554719, 0.6980392, 0, 1, 1,
0.7583366, -0.6771535, 3.122556, 0.7058824, 0, 1, 1,
0.7629969, -0.3094138, 0.9485843, 0.7098039, 0, 1, 1,
0.768348, -0.9408855, 1.438955, 0.7176471, 0, 1, 1,
0.772756, -1.010166, 1.88015, 0.7215686, 0, 1, 1,
0.7795114, 0.1568772, 1.400208, 0.7294118, 0, 1, 1,
0.7906044, 0.5510581, 1.003192, 0.7333333, 0, 1, 1,
0.7966076, -0.9003258, 1.317397, 0.7411765, 0, 1, 1,
0.8038195, 1.857401, 0.1062791, 0.7450981, 0, 1, 1,
0.8044852, 0.6761423, 0.9576831, 0.7529412, 0, 1, 1,
0.8070454, 0.8658653, 1.106807, 0.7568628, 0, 1, 1,
0.8111413, -0.6816663, 3.382436, 0.7647059, 0, 1, 1,
0.8112664, 1.358114, 0.59197, 0.7686275, 0, 1, 1,
0.8162813, 0.9482755, -0.1756027, 0.7764706, 0, 1, 1,
0.8209507, 0.0005530121, 1.265614, 0.7803922, 0, 1, 1,
0.821326, 0.5355342, 3.739388, 0.7882353, 0, 1, 1,
0.8218554, 0.5928962, 1.511128, 0.7921569, 0, 1, 1,
0.8405547, 1.061786, 1.518678, 0.8, 0, 1, 1,
0.8415769, 1.435263, 2.089893, 0.8078431, 0, 1, 1,
0.8430264, 0.2399687, 3.781912, 0.8117647, 0, 1, 1,
0.8442848, 0.7311133, 0.02739317, 0.8196079, 0, 1, 1,
0.8647825, -2.171325, 4.62431, 0.8235294, 0, 1, 1,
0.8665014, 1.046436, -0.423137, 0.8313726, 0, 1, 1,
0.8758754, 0.3114527, -0.2505231, 0.8352941, 0, 1, 1,
0.8764021, -2.074085, 0.9894014, 0.8431373, 0, 1, 1,
0.8789163, 1.185396, 0.4186716, 0.8470588, 0, 1, 1,
0.8823664, -0.6485541, 1.956292, 0.854902, 0, 1, 1,
0.8855342, 0.61955, -0.4901904, 0.8588235, 0, 1, 1,
0.8900673, 0.7286778, 1.809501, 0.8666667, 0, 1, 1,
0.8922486, 0.9619083, 2.111023, 0.8705882, 0, 1, 1,
0.8986666, 1.386321, 1.786946, 0.8784314, 0, 1, 1,
0.9024795, -0.1114385, -0.01224432, 0.8823529, 0, 1, 1,
0.9043193, 0.7720416, 1.314424, 0.8901961, 0, 1, 1,
0.9051749, 1.268345, 0.7211239, 0.8941177, 0, 1, 1,
0.9058707, -1.214807, 3.995177, 0.9019608, 0, 1, 1,
0.9138633, 0.423166, 1.449222, 0.9098039, 0, 1, 1,
0.9146401, 1.007538, 2.159805, 0.9137255, 0, 1, 1,
0.9149172, -2.391913, 3.364108, 0.9215686, 0, 1, 1,
0.918101, 1.039495, 1.607619, 0.9254902, 0, 1, 1,
0.9269197, -1.049765, 1.811177, 0.9333333, 0, 1, 1,
0.9353576, 0.2558057, 0.3823422, 0.9372549, 0, 1, 1,
0.941937, 1.217646, -0.5784966, 0.945098, 0, 1, 1,
0.9479636, 1.250886, 0.7993876, 0.9490196, 0, 1, 1,
0.9480653, -0.1871307, 3.682254, 0.9568627, 0, 1, 1,
0.9587257, -0.7030906, 1.343931, 0.9607843, 0, 1, 1,
0.9598125, -0.3532498, 0.6936433, 0.9686275, 0, 1, 1,
0.9709009, 0.5901233, 0.5099151, 0.972549, 0, 1, 1,
0.9750327, -0.4935767, 1.506692, 0.9803922, 0, 1, 1,
0.9920853, -1.503157, 3.613483, 0.9843137, 0, 1, 1,
0.9934834, -0.9442784, 2.402278, 0.9921569, 0, 1, 1,
0.9938825, 1.53981, 2.419479, 0.9960784, 0, 1, 1,
0.9982733, -0.5482284, 1.736989, 1, 0, 0.9960784, 1,
1.000636, -1.77116, 2.97789, 1, 0, 0.9882353, 1,
1.003777, -1.306809, 1.651282, 1, 0, 0.9843137, 1,
1.010578, -1.326376, 2.608746, 1, 0, 0.9764706, 1,
1.028295, 1.091743, 0.8314729, 1, 0, 0.972549, 1,
1.03072, -0.3781059, 0.2982648, 1, 0, 0.9647059, 1,
1.037488, -0.3730615, 0.7183918, 1, 0, 0.9607843, 1,
1.040883, 0.3623042, 0.6510183, 1, 0, 0.9529412, 1,
1.041603, -0.589529, 1.579658, 1, 0, 0.9490196, 1,
1.049179, -1.51214, 3.389294, 1, 0, 0.9411765, 1,
1.05551, -0.1546664, 2.428434, 1, 0, 0.9372549, 1,
1.059021, -0.257494, 2.349476, 1, 0, 0.9294118, 1,
1.059362, 1.384093, -0.7138572, 1, 0, 0.9254902, 1,
1.060182, 0.7380928, 1.24662, 1, 0, 0.9176471, 1,
1.066024, 0.2202627, 2.482707, 1, 0, 0.9137255, 1,
1.070432, 0.7253832, 1.593495, 1, 0, 0.9058824, 1,
1.078894, -0.2810889, 1.371287, 1, 0, 0.9019608, 1,
1.081194, -2.732041, 2.68512, 1, 0, 0.8941177, 1,
1.082999, -0.7358016, 1.727722, 1, 0, 0.8862745, 1,
1.083916, 0.4738853, 2.197232, 1, 0, 0.8823529, 1,
1.084277, 0.3607324, 0.9825714, 1, 0, 0.8745098, 1,
1.088745, 0.4116274, 0.3182655, 1, 0, 0.8705882, 1,
1.090832, 0.9144529, 0.986016, 1, 0, 0.8627451, 1,
1.098488, 0.6079704, 0.9435899, 1, 0, 0.8588235, 1,
1.101042, 0.7130115, 2.739369, 1, 0, 0.8509804, 1,
1.104362, 0.4557292, 1.360709, 1, 0, 0.8470588, 1,
1.105067, -1.239361, 2.795094, 1, 0, 0.8392157, 1,
1.111937, 2.454291, 0.482692, 1, 0, 0.8352941, 1,
1.118195, -0.6500295, 2.648824, 1, 0, 0.827451, 1,
1.128119, 1.142797, 0.6635753, 1, 0, 0.8235294, 1,
1.132251, -0.6807199, 1.681096, 1, 0, 0.8156863, 1,
1.135656, -0.401596, 2.515389, 1, 0, 0.8117647, 1,
1.137632, -1.926704, 2.143646, 1, 0, 0.8039216, 1,
1.138684, 0.2561533, 2.672049, 1, 0, 0.7960784, 1,
1.142842, -0.2957367, 1.075916, 1, 0, 0.7921569, 1,
1.147219, 0.702062, 0.8367004, 1, 0, 0.7843137, 1,
1.151272, -0.8965989, 1.727494, 1, 0, 0.7803922, 1,
1.155245, -0.08866545, 0.3233967, 1, 0, 0.772549, 1,
1.160112, 0.1213967, 1.327818, 1, 0, 0.7686275, 1,
1.162004, 0.7488072, 0.8528345, 1, 0, 0.7607843, 1,
1.164033, -0.8336555, 1.822507, 1, 0, 0.7568628, 1,
1.176879, -1.191684, 1.301975, 1, 0, 0.7490196, 1,
1.187293, -0.2427767, 1.132293, 1, 0, 0.7450981, 1,
1.189624, 0.5902614, 1.682578, 1, 0, 0.7372549, 1,
1.190317, 0.05453468, 0.3766647, 1, 0, 0.7333333, 1,
1.19082, 0.6681987, 1.7752, 1, 0, 0.7254902, 1,
1.19518, 0.6146876, 0.5068952, 1, 0, 0.7215686, 1,
1.201775, -0.9833034, 2.066412, 1, 0, 0.7137255, 1,
1.201909, -1.778585, 2.469555, 1, 0, 0.7098039, 1,
1.207127, 2.307124, 0.1806742, 1, 0, 0.7019608, 1,
1.210548, -0.6412503, 2.896444, 1, 0, 0.6941177, 1,
1.218778, -0.1537659, 1.756044, 1, 0, 0.6901961, 1,
1.220398, -1.365016, 3.578593, 1, 0, 0.682353, 1,
1.224959, 0.8940045, 1.766674, 1, 0, 0.6784314, 1,
1.232879, 0.152722, 1.290065, 1, 0, 0.6705883, 1,
1.238721, -0.9570255, 1.469509, 1, 0, 0.6666667, 1,
1.245571, 0.2353581, 3.074631, 1, 0, 0.6588235, 1,
1.245579, 0.6666335, 1.105691, 1, 0, 0.654902, 1,
1.259665, 1.102409, 0.1322259, 1, 0, 0.6470588, 1,
1.259855, -0.2593689, 1.390669, 1, 0, 0.6431373, 1,
1.261662, -0.7155474, 2.817912, 1, 0, 0.6352941, 1,
1.263602, -0.2959072, 2.302696, 1, 0, 0.6313726, 1,
1.266366, 0.1087824, 3.287948, 1, 0, 0.6235294, 1,
1.275167, -0.1807863, 3.250102, 1, 0, 0.6196079, 1,
1.280876, 0.5637041, 1.443671, 1, 0, 0.6117647, 1,
1.281838, 0.1554837, 0.4958908, 1, 0, 0.6078432, 1,
1.289667, -0.3977202, 4.075329, 1, 0, 0.6, 1,
1.299105, 0.8619335, 0.7491924, 1, 0, 0.5921569, 1,
1.303594, 1.225706, -0.4923492, 1, 0, 0.5882353, 1,
1.303612, 0.5505397, 1.409375, 1, 0, 0.5803922, 1,
1.310256, 0.749898, 2.123078, 1, 0, 0.5764706, 1,
1.314214, -1.338051, 2.758579, 1, 0, 0.5686275, 1,
1.323299, 0.4879595, 2.180233, 1, 0, 0.5647059, 1,
1.328902, 1.158632, 0.5565574, 1, 0, 0.5568628, 1,
1.333803, 1.496274, -0.750088, 1, 0, 0.5529412, 1,
1.339786, 1.65778, -0.7815118, 1, 0, 0.5450981, 1,
1.340695, 0.2558126, -0.08237717, 1, 0, 0.5411765, 1,
1.351261, 1.296966, -0.3938276, 1, 0, 0.5333334, 1,
1.362467, 0.3543078, 0.1174893, 1, 0, 0.5294118, 1,
1.371068, -0.3782644, 3.085307, 1, 0, 0.5215687, 1,
1.37693, 0.857668, 0.3764581, 1, 0, 0.5176471, 1,
1.377061, 0.2988808, 1.767429, 1, 0, 0.509804, 1,
1.382253, 1.225432, 1.484672, 1, 0, 0.5058824, 1,
1.384538, -0.6016292, 0.8412687, 1, 0, 0.4980392, 1,
1.384685, -0.2135509, 1.593203, 1, 0, 0.4901961, 1,
1.389197, 1.490772, 0.03982206, 1, 0, 0.4862745, 1,
1.391027, 0.9459002, 0.09132691, 1, 0, 0.4784314, 1,
1.399352, -1.411787, 2.471973, 1, 0, 0.4745098, 1,
1.403858, 0.7539398, 0.9092082, 1, 0, 0.4666667, 1,
1.404435, 0.9145283, 2.614167, 1, 0, 0.4627451, 1,
1.413569, 0.09705132, 1.510576, 1, 0, 0.454902, 1,
1.418604, 0.3485304, -0.3882721, 1, 0, 0.4509804, 1,
1.44871, 2.857808, -0.3445089, 1, 0, 0.4431373, 1,
1.452864, 0.7924717, 1.333487, 1, 0, 0.4392157, 1,
1.455802, 1.526515, -0.5805954, 1, 0, 0.4313726, 1,
1.462387, 0.05338363, 1.355369, 1, 0, 0.427451, 1,
1.465362, 1.420821, 0.02836027, 1, 0, 0.4196078, 1,
1.477166, -0.8451309, 3.283314, 1, 0, 0.4156863, 1,
1.481306, -1.574813, 2.270022, 1, 0, 0.4078431, 1,
1.481926, 0.8134064, 0.8857719, 1, 0, 0.4039216, 1,
1.485803, -0.6388697, 2.843324, 1, 0, 0.3960784, 1,
1.498797, 1.483906, 0.2078548, 1, 0, 0.3882353, 1,
1.507827, 0.8529453, 0.4445122, 1, 0, 0.3843137, 1,
1.51722, -0.7735916, 2.035429, 1, 0, 0.3764706, 1,
1.520547, -0.9570946, 0.5285463, 1, 0, 0.372549, 1,
1.524338, -0.3251686, 1.980685, 1, 0, 0.3647059, 1,
1.530829, 0.1982444, -0.1004377, 1, 0, 0.3607843, 1,
1.534096, 0.8105765, 1.837649, 1, 0, 0.3529412, 1,
1.543134, 0.6217205, 1.319338, 1, 0, 0.3490196, 1,
1.54641, -0.743589, 3.425042, 1, 0, 0.3411765, 1,
1.550998, 1.191612, 0.1359487, 1, 0, 0.3372549, 1,
1.552613, -0.5824685, 1.992053, 1, 0, 0.3294118, 1,
1.566557, -1.483127, 2.120502, 1, 0, 0.3254902, 1,
1.582172, -0.2345915, 1.666232, 1, 0, 0.3176471, 1,
1.587695, -0.2560621, 0.2778197, 1, 0, 0.3137255, 1,
1.594487, 0.6058009, -1.245452, 1, 0, 0.3058824, 1,
1.595991, -0.1367625, -0.7519218, 1, 0, 0.2980392, 1,
1.615771, 0.3948869, 1.90941, 1, 0, 0.2941177, 1,
1.624458, 0.1499158, 1.371853, 1, 0, 0.2862745, 1,
1.649215, 0.2459348, 1.817319, 1, 0, 0.282353, 1,
1.653749, 2.305415, 0.6421849, 1, 0, 0.2745098, 1,
1.690964, 2.011946, 0.3883811, 1, 0, 0.2705882, 1,
1.704283, 1.027665, 0.465622, 1, 0, 0.2627451, 1,
1.708649, -0.4649159, 1.809794, 1, 0, 0.2588235, 1,
1.713246, -0.1297496, 1.246875, 1, 0, 0.2509804, 1,
1.749324, -0.5247582, 1.533599, 1, 0, 0.2470588, 1,
1.771563, -0.6072453, 2.718936, 1, 0, 0.2392157, 1,
1.774339, 1.503121, -0.5874194, 1, 0, 0.2352941, 1,
1.778521, 0.09864229, 0.3472094, 1, 0, 0.227451, 1,
1.78585, -0.352624, 1.457904, 1, 0, 0.2235294, 1,
1.797645, 0.4015079, 1.309226, 1, 0, 0.2156863, 1,
1.81354, -1.22052, 2.376887, 1, 0, 0.2117647, 1,
1.833074, 0.3251711, 1.608697, 1, 0, 0.2039216, 1,
1.833133, -0.05593938, 1.719366, 1, 0, 0.1960784, 1,
1.833178, 0.6844123, 2.190546, 1, 0, 0.1921569, 1,
1.860078, -0.05171108, 1.038752, 1, 0, 0.1843137, 1,
1.910048, 1.966603, 0.457278, 1, 0, 0.1803922, 1,
1.912624, -1.81814, 1.823776, 1, 0, 0.172549, 1,
1.923349, -0.5263836, 0.2169508, 1, 0, 0.1686275, 1,
1.928026, 0.2018859, -0.5425314, 1, 0, 0.1607843, 1,
1.951544, -0.2338009, 1.211926, 1, 0, 0.1568628, 1,
1.954502, 0.7055585, 1.757781, 1, 0, 0.1490196, 1,
1.999219, 0.5045857, -0.3257569, 1, 0, 0.145098, 1,
2.00024, -1.21708, 1.168656, 1, 0, 0.1372549, 1,
2.016397, 0.3330676, 1.357456, 1, 0, 0.1333333, 1,
2.032531, -0.5238536, 0.2737255, 1, 0, 0.1254902, 1,
2.044495, 0.4892843, 0.6698803, 1, 0, 0.1215686, 1,
2.119966, 1.178985, 0.3088073, 1, 0, 0.1137255, 1,
2.124296, 1.159143, 2.420241, 1, 0, 0.1098039, 1,
2.139207, 0.8972534, 0.7058344, 1, 0, 0.1019608, 1,
2.140842, -0.4216492, 0.06137942, 1, 0, 0.09411765, 1,
2.146065, 1.456606, 1.870446, 1, 0, 0.09019608, 1,
2.156592, 1.394954, 0.3794997, 1, 0, 0.08235294, 1,
2.196122, 0.1230876, 1.043393, 1, 0, 0.07843138, 1,
2.211097, -0.3872629, 2.472155, 1, 0, 0.07058824, 1,
2.248796, -0.7602528, 3.664976, 1, 0, 0.06666667, 1,
2.252298, -0.2677889, 3.124302, 1, 0, 0.05882353, 1,
2.256578, -1.35577, 2.990963, 1, 0, 0.05490196, 1,
2.281465, -0.140365, 2.46734, 1, 0, 0.04705882, 1,
2.320686, -0.3264736, 1.654242, 1, 0, 0.04313726, 1,
2.386703, 0.9456186, 2.445576, 1, 0, 0.03529412, 1,
2.685006, -1.408324, 3.485595, 1, 0, 0.03137255, 1,
2.739904, 0.1947197, 1.506227, 1, 0, 0.02352941, 1,
2.743891, 0.4373618, 0.8242136, 1, 0, 0.01960784, 1,
2.826072, -0.7819815, 2.753211, 1, 0, 0.01176471, 1,
2.957837, 1.462349, 1.10872, 1, 0, 0.007843138, 1
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
-0.2891736, -3.898931, -7.700226, 0, -0.5, 0.5, 0.5,
-0.2891736, -3.898931, -7.700226, 1, -0.5, 0.5, 0.5,
-0.2891736, -3.898931, -7.700226, 1, 1.5, 0.5, 0.5,
-0.2891736, -3.898931, -7.700226, 0, 1.5, 0.5, 0.5
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
-4.63692, 0.1835005, -7.700226, 0, -0.5, 0.5, 0.5,
-4.63692, 0.1835005, -7.700226, 1, -0.5, 0.5, 0.5,
-4.63692, 0.1835005, -7.700226, 1, 1.5, 0.5, 0.5,
-4.63692, 0.1835005, -7.700226, 0, 1.5, 0.5, 0.5
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
-4.63692, -3.898931, -0.1778562, 0, -0.5, 0.5, 0.5,
-4.63692, -3.898931, -0.1778562, 1, -0.5, 0.5, 0.5,
-4.63692, -3.898931, -0.1778562, 1, 1.5, 0.5, 0.5,
-4.63692, -3.898931, -0.1778562, 0, 1.5, 0.5, 0.5
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
-3, -2.956831, -5.964295,
2, -2.956831, -5.964295,
-3, -2.956831, -5.964295,
-3, -3.113848, -6.253617,
-2, -2.956831, -5.964295,
-2, -3.113848, -6.253617,
-1, -2.956831, -5.964295,
-1, -3.113848, -6.253617,
0, -2.956831, -5.964295,
0, -3.113848, -6.253617,
1, -2.956831, -5.964295,
1, -3.113848, -6.253617,
2, -2.956831, -5.964295,
2, -3.113848, -6.253617
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
-3, -3.427881, -6.832261, 0, -0.5, 0.5, 0.5,
-3, -3.427881, -6.832261, 1, -0.5, 0.5, 0.5,
-3, -3.427881, -6.832261, 1, 1.5, 0.5, 0.5,
-3, -3.427881, -6.832261, 0, 1.5, 0.5, 0.5,
-2, -3.427881, -6.832261, 0, -0.5, 0.5, 0.5,
-2, -3.427881, -6.832261, 1, -0.5, 0.5, 0.5,
-2, -3.427881, -6.832261, 1, 1.5, 0.5, 0.5,
-2, -3.427881, -6.832261, 0, 1.5, 0.5, 0.5,
-1, -3.427881, -6.832261, 0, -0.5, 0.5, 0.5,
-1, -3.427881, -6.832261, 1, -0.5, 0.5, 0.5,
-1, -3.427881, -6.832261, 1, 1.5, 0.5, 0.5,
-1, -3.427881, -6.832261, 0, 1.5, 0.5, 0.5,
0, -3.427881, -6.832261, 0, -0.5, 0.5, 0.5,
0, -3.427881, -6.832261, 1, -0.5, 0.5, 0.5,
0, -3.427881, -6.832261, 1, 1.5, 0.5, 0.5,
0, -3.427881, -6.832261, 0, 1.5, 0.5, 0.5,
1, -3.427881, -6.832261, 0, -0.5, 0.5, 0.5,
1, -3.427881, -6.832261, 1, -0.5, 0.5, 0.5,
1, -3.427881, -6.832261, 1, 1.5, 0.5, 0.5,
1, -3.427881, -6.832261, 0, 1.5, 0.5, 0.5,
2, -3.427881, -6.832261, 0, -0.5, 0.5, 0.5,
2, -3.427881, -6.832261, 1, -0.5, 0.5, 0.5,
2, -3.427881, -6.832261, 1, 1.5, 0.5, 0.5,
2, -3.427881, -6.832261, 0, 1.5, 0.5, 0.5
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
-3.633594, -2, -5.964295,
-3.633594, 3, -5.964295,
-3.633594, -2, -5.964295,
-3.800815, -2, -6.253617,
-3.633594, -1, -5.964295,
-3.800815, -1, -6.253617,
-3.633594, 0, -5.964295,
-3.800815, 0, -6.253617,
-3.633594, 1, -5.964295,
-3.800815, 1, -6.253617,
-3.633594, 2, -5.964295,
-3.800815, 2, -6.253617,
-3.633594, 3, -5.964295,
-3.800815, 3, -6.253617
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
-4.135257, -2, -6.832261, 0, -0.5, 0.5, 0.5,
-4.135257, -2, -6.832261, 1, -0.5, 0.5, 0.5,
-4.135257, -2, -6.832261, 1, 1.5, 0.5, 0.5,
-4.135257, -2, -6.832261, 0, 1.5, 0.5, 0.5,
-4.135257, -1, -6.832261, 0, -0.5, 0.5, 0.5,
-4.135257, -1, -6.832261, 1, -0.5, 0.5, 0.5,
-4.135257, -1, -6.832261, 1, 1.5, 0.5, 0.5,
-4.135257, -1, -6.832261, 0, 1.5, 0.5, 0.5,
-4.135257, 0, -6.832261, 0, -0.5, 0.5, 0.5,
-4.135257, 0, -6.832261, 1, -0.5, 0.5, 0.5,
-4.135257, 0, -6.832261, 1, 1.5, 0.5, 0.5,
-4.135257, 0, -6.832261, 0, 1.5, 0.5, 0.5,
-4.135257, 1, -6.832261, 0, -0.5, 0.5, 0.5,
-4.135257, 1, -6.832261, 1, -0.5, 0.5, 0.5,
-4.135257, 1, -6.832261, 1, 1.5, 0.5, 0.5,
-4.135257, 1, -6.832261, 0, 1.5, 0.5, 0.5,
-4.135257, 2, -6.832261, 0, -0.5, 0.5, 0.5,
-4.135257, 2, -6.832261, 1, -0.5, 0.5, 0.5,
-4.135257, 2, -6.832261, 1, 1.5, 0.5, 0.5,
-4.135257, 2, -6.832261, 0, 1.5, 0.5, 0.5,
-4.135257, 3, -6.832261, 0, -0.5, 0.5, 0.5,
-4.135257, 3, -6.832261, 1, -0.5, 0.5, 0.5,
-4.135257, 3, -6.832261, 1, 1.5, 0.5, 0.5,
-4.135257, 3, -6.832261, 0, 1.5, 0.5, 0.5
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
-3.633594, -2.956831, -4,
-3.633594, -2.956831, 4,
-3.633594, -2.956831, -4,
-3.800815, -3.113848, -4,
-3.633594, -2.956831, -2,
-3.800815, -3.113848, -2,
-3.633594, -2.956831, 0,
-3.800815, -3.113848, 0,
-3.633594, -2.956831, 2,
-3.800815, -3.113848, 2,
-3.633594, -2.956831, 4,
-3.800815, -3.113848, 4
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
-4.135257, -3.427881, -4, 0, -0.5, 0.5, 0.5,
-4.135257, -3.427881, -4, 1, -0.5, 0.5, 0.5,
-4.135257, -3.427881, -4, 1, 1.5, 0.5, 0.5,
-4.135257, -3.427881, -4, 0, 1.5, 0.5, 0.5,
-4.135257, -3.427881, -2, 0, -0.5, 0.5, 0.5,
-4.135257, -3.427881, -2, 1, -0.5, 0.5, 0.5,
-4.135257, -3.427881, -2, 1, 1.5, 0.5, 0.5,
-4.135257, -3.427881, -2, 0, 1.5, 0.5, 0.5,
-4.135257, -3.427881, 0, 0, -0.5, 0.5, 0.5,
-4.135257, -3.427881, 0, 1, -0.5, 0.5, 0.5,
-4.135257, -3.427881, 0, 1, 1.5, 0.5, 0.5,
-4.135257, -3.427881, 0, 0, 1.5, 0.5, 0.5,
-4.135257, -3.427881, 2, 0, -0.5, 0.5, 0.5,
-4.135257, -3.427881, 2, 1, -0.5, 0.5, 0.5,
-4.135257, -3.427881, 2, 1, 1.5, 0.5, 0.5,
-4.135257, -3.427881, 2, 0, 1.5, 0.5, 0.5,
-4.135257, -3.427881, 4, 0, -0.5, 0.5, 0.5,
-4.135257, -3.427881, 4, 1, -0.5, 0.5, 0.5,
-4.135257, -3.427881, 4, 1, 1.5, 0.5, 0.5,
-4.135257, -3.427881, 4, 0, 1.5, 0.5, 0.5
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
-3.633594, -2.956831, -5.964295,
-3.633594, 3.323832, -5.964295,
-3.633594, -2.956831, 5.608582,
-3.633594, 3.323832, 5.608582,
-3.633594, -2.956831, -5.964295,
-3.633594, -2.956831, 5.608582,
-3.633594, 3.323832, -5.964295,
-3.633594, 3.323832, 5.608582,
-3.633594, -2.956831, -5.964295,
3.055247, -2.956831, -5.964295,
-3.633594, -2.956831, 5.608582,
3.055247, -2.956831, 5.608582,
-3.633594, 3.323832, -5.964295,
3.055247, 3.323832, -5.964295,
-3.633594, 3.323832, 5.608582,
3.055247, 3.323832, 5.608582,
3.055247, -2.956831, -5.964295,
3.055247, 3.323832, -5.964295,
3.055247, -2.956831, 5.608582,
3.055247, 3.323832, 5.608582,
3.055247, -2.956831, -5.964295,
3.055247, -2.956831, 5.608582,
3.055247, 3.323832, -5.964295,
3.055247, 3.323832, 5.608582
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
var radius = 7.886277;
var distance = 35.08694;
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
mvMatrix.translate( 0.2891736, -0.1835005, 0.1778562 );
mvMatrix.scale( 1.274779, 1.357627, 0.7367915 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.08694);
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
Gentamicin<-read.table("Gentamicin.xyz", skip=1)
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
-3.536184, 0.4871472, -2.055536, 0, 0, 1, 1, 1,
-3.304269, -0.7386215, -0.9773236, 1, 0, 0, 1, 1,
-3.269564, 0.3044764, -1.651464, 1, 0, 0, 1, 1,
-2.869813, -1.283425, -1.944294, 1, 0, 0, 1, 1,
-2.831723, 0.3781975, -1.948761, 1, 0, 0, 1, 1,
-2.822202, -0.9766007, -2.113847, 1, 0, 0, 1, 1,
-2.592839, 0.7021648, -0.6488134, 0, 0, 0, 1, 1,
-2.462906, -1.095729, -2.051098, 0, 0, 0, 1, 1,
-2.403757, -0.8031325, -0.9740462, 0, 0, 0, 1, 1,
-2.299627, 1.429758, 0.66976, 0, 0, 0, 1, 1,
-2.287542, -0.5109257, -0.4450959, 0, 0, 0, 1, 1,
-2.265218, -1.876544, -2.30116, 0, 0, 0, 1, 1,
-2.260348, 0.7370778, -1.652192, 0, 0, 0, 1, 1,
-2.221277, 0.7322872, -0.7229977, 1, 1, 1, 1, 1,
-2.145778, 1.14647, -0.7797818, 1, 1, 1, 1, 1,
-2.145486, -0.1701604, -2.294887, 1, 1, 1, 1, 1,
-2.141832, -0.04834617, -0.8324957, 1, 1, 1, 1, 1,
-2.108447, -0.7394124, -1.7019, 1, 1, 1, 1, 1,
-2.077532, -1.253114, -3.12074, 1, 1, 1, 1, 1,
-2.074591, -0.8445556, -1.847541, 1, 1, 1, 1, 1,
-2.066283, 0.7819574, -1.220087, 1, 1, 1, 1, 1,
-2.047144, 1.286022, -2.084172, 1, 1, 1, 1, 1,
-2.028641, -0.005855823, -3.663212, 1, 1, 1, 1, 1,
-2.025327, -2.865365, -0.4148104, 1, 1, 1, 1, 1,
-2.019445, 1.092754, -1.48341, 1, 1, 1, 1, 1,
-1.992213, -0.8213352, -3.117433, 1, 1, 1, 1, 1,
-1.968948, -0.1543867, -1.04801, 1, 1, 1, 1, 1,
-1.951424, -1.573766, -4.219708, 1, 1, 1, 1, 1,
-1.930562, 0.5059254, -0.1137797, 0, 0, 1, 1, 1,
-1.920297, 1.349416, -1.000605, 1, 0, 0, 1, 1,
-1.905237, 1.050383, -2.838143, 1, 0, 0, 1, 1,
-1.899255, 0.3562482, 0.2173092, 1, 0, 0, 1, 1,
-1.884836, 0.0759457, -2.067361, 1, 0, 0, 1, 1,
-1.872572, 0.1783097, -1.053004, 1, 0, 0, 1, 1,
-1.861442, 0.9018961, 0.2560881, 0, 0, 0, 1, 1,
-1.861153, 0.7125752, -2.796176, 0, 0, 0, 1, 1,
-1.836166, 0.7766057, -0.7729543, 0, 0, 0, 1, 1,
-1.83258, -0.6378949, -1.510848, 0, 0, 0, 1, 1,
-1.831221, -2.114983, -2.038494, 0, 0, 0, 1, 1,
-1.813151, 1.809218, -1.97449, 0, 0, 0, 1, 1,
-1.810596, 0.01190836, -1.893348, 0, 0, 0, 1, 1,
-1.810586, -0.7126856, -2.397188, 1, 1, 1, 1, 1,
-1.809509, -0.06114535, -2.375973, 1, 1, 1, 1, 1,
-1.79311, 1.252061, -0.7069538, 1, 1, 1, 1, 1,
-1.766275, -0.8998967, -0.8265032, 1, 1, 1, 1, 1,
-1.759747, 3.232366, -0.3196934, 1, 1, 1, 1, 1,
-1.740299, 1.308748, -0.4720114, 1, 1, 1, 1, 1,
-1.725019, 2.090639, -1.031499, 1, 1, 1, 1, 1,
-1.717476, 0.3363489, -1.783237, 1, 1, 1, 1, 1,
-1.707787, -0.1295967, -3.137216, 1, 1, 1, 1, 1,
-1.70389, 0.3073515, -1.918102, 1, 1, 1, 1, 1,
-1.692729, -1.320713, -1.625718, 1, 1, 1, 1, 1,
-1.68769, 2.694014, -0.7347555, 1, 1, 1, 1, 1,
-1.663114, -0.5149665, -1.211925, 1, 1, 1, 1, 1,
-1.646169, -0.1703984, -2.170129, 1, 1, 1, 1, 1,
-1.632163, 0.3834636, -2.294213, 1, 1, 1, 1, 1,
-1.629976, 0.1105508, -0.6983693, 0, 0, 1, 1, 1,
-1.610449, -0.4684417, -2.70952, 1, 0, 0, 1, 1,
-1.571113, 0.04282232, -0.604562, 1, 0, 0, 1, 1,
-1.568279, -0.001249907, -2.67397, 1, 0, 0, 1, 1,
-1.561063, -0.7151207, -0.6017946, 1, 0, 0, 1, 1,
-1.556944, 0.09808511, -5.795758, 1, 0, 0, 1, 1,
-1.554631, 0.07114144, -0.7208193, 0, 0, 0, 1, 1,
-1.553539, -2.753277, -3.180312, 0, 0, 0, 1, 1,
-1.548897, -0.4998809, -2.075838, 0, 0, 0, 1, 1,
-1.535436, -1.659394, -0.180399, 0, 0, 0, 1, 1,
-1.532207, -0.1059305, -2.92391, 0, 0, 0, 1, 1,
-1.515493, 0.02761851, -0.6614661, 0, 0, 0, 1, 1,
-1.514572, 3.01722, 0.1715415, 0, 0, 0, 1, 1,
-1.504662, -1.095249, 0.02126137, 1, 1, 1, 1, 1,
-1.495298, 0.9371736, 0.4738958, 1, 1, 1, 1, 1,
-1.494135, -0.3940516, -1.686893, 1, 1, 1, 1, 1,
-1.474747, -0.27095, -2.56604, 1, 1, 1, 1, 1,
-1.468923, -0.05701266, -0.7855447, 1, 1, 1, 1, 1,
-1.467137, 1.610255, -1.650218, 1, 1, 1, 1, 1,
-1.464492, -0.9276505, -0.98577, 1, 1, 1, 1, 1,
-1.460961, -1.915537, -1.984525, 1, 1, 1, 1, 1,
-1.436586, 0.2504449, -1.717799, 1, 1, 1, 1, 1,
-1.436542, -0.3612581, -1.301752, 1, 1, 1, 1, 1,
-1.423005, 0.40534, -0.4354323, 1, 1, 1, 1, 1,
-1.419902, 2.10559, -2.031376, 1, 1, 1, 1, 1,
-1.416585, 0.6666219, -1.065102, 1, 1, 1, 1, 1,
-1.41626, -0.7937658, -1.522861, 1, 1, 1, 1, 1,
-1.405889, -0.5821573, -2.751983, 1, 1, 1, 1, 1,
-1.404217, -0.07165224, -1.321709, 0, 0, 1, 1, 1,
-1.402826, -0.4827152, -2.8013, 1, 0, 0, 1, 1,
-1.385283, 0.6818008, -0.5869781, 1, 0, 0, 1, 1,
-1.380863, -1.293021, -3.255945, 1, 0, 0, 1, 1,
-1.375507, 0.1575856, -2.928536, 1, 0, 0, 1, 1,
-1.364656, 0.1772063, -0.9415641, 1, 0, 0, 1, 1,
-1.362537, 0.328445, -0.1575275, 0, 0, 0, 1, 1,
-1.355881, -2.28519, -3.025755, 0, 0, 0, 1, 1,
-1.351516, 0.3430288, -1.344504, 0, 0, 0, 1, 1,
-1.346778, -0.1890215, -0.9990813, 0, 0, 0, 1, 1,
-1.344973, 0.9497575, -1.565215, 0, 0, 0, 1, 1,
-1.338867, 1.646774, 0.2403955, 0, 0, 0, 1, 1,
-1.333034, 1.220985, -1.038454, 0, 0, 0, 1, 1,
-1.329532, 0.1958208, -1.636085, 1, 1, 1, 1, 1,
-1.324806, -1.081119, -1.798146, 1, 1, 1, 1, 1,
-1.315249, 0.2958292, -1.351492, 1, 1, 1, 1, 1,
-1.314177, -0.1811032, -0.998801, 1, 1, 1, 1, 1,
-1.311145, 0.8622576, -0.3249795, 1, 1, 1, 1, 1,
-1.310309, 0.0394358, -1.025919, 1, 1, 1, 1, 1,
-1.308689, -0.6754081, -2.694209, 1, 1, 1, 1, 1,
-1.301727, -0.631222, -2.154108, 1, 1, 1, 1, 1,
-1.299492, -0.3277923, -2.84199, 1, 1, 1, 1, 1,
-1.299471, -1.022217, -3.806376, 1, 1, 1, 1, 1,
-1.292555, 0.02912497, -2.277889, 1, 1, 1, 1, 1,
-1.28511, 1.455741, -0.7494524, 1, 1, 1, 1, 1,
-1.285037, -0.1127506, -0.3109147, 1, 1, 1, 1, 1,
-1.283643, 1.353108, -0.2267592, 1, 1, 1, 1, 1,
-1.276937, -0.02736163, -1.171042, 1, 1, 1, 1, 1,
-1.276753, -1.558073, -1.751958, 0, 0, 1, 1, 1,
-1.272771, -1.191869, -1.869861, 1, 0, 0, 1, 1,
-1.267148, -1.117718, -1.377765, 1, 0, 0, 1, 1,
-1.265827, 0.0874043, -3.073063, 1, 0, 0, 1, 1,
-1.263939, -0.9874632, -1.96581, 1, 0, 0, 1, 1,
-1.252762, 0.5021918, -1.300924, 1, 0, 0, 1, 1,
-1.252572, -1.374546, -1.2244, 0, 0, 0, 1, 1,
-1.251916, -1.579386, -2.488408, 0, 0, 0, 1, 1,
-1.243858, -0.8668604, -2.239464, 0, 0, 0, 1, 1,
-1.240088, 0.06781958, -0.4238947, 0, 0, 0, 1, 1,
-1.238655, 0.2420156, -2.855714, 0, 0, 0, 1, 1,
-1.226224, -0.7507857, -0.7098757, 0, 0, 0, 1, 1,
-1.22299, -0.8327872, 0.09352947, 0, 0, 0, 1, 1,
-1.222157, 0.2205351, -1.461533, 1, 1, 1, 1, 1,
-1.217323, 1.534618, 0.7293684, 1, 1, 1, 1, 1,
-1.211878, 1.769337, -0.6844378, 1, 1, 1, 1, 1,
-1.20782, -0.03718562, -1.445605, 1, 1, 1, 1, 1,
-1.192487, -1.141251, -3.786627, 1, 1, 1, 1, 1,
-1.190406, 0.3245136, -2.156873, 1, 1, 1, 1, 1,
-1.180096, 0.6773502, 0.8173589, 1, 1, 1, 1, 1,
-1.167107, -0.508848, -1.56205, 1, 1, 1, 1, 1,
-1.163934, 1.254841, -1.304108, 1, 1, 1, 1, 1,
-1.161825, -0.3717091, -2.678386, 1, 1, 1, 1, 1,
-1.156665, -0.967881, 0.1856852, 1, 1, 1, 1, 1,
-1.155899, -0.1546359, 0.800252, 1, 1, 1, 1, 1,
-1.151644, 0.2803102, -1.614634, 1, 1, 1, 1, 1,
-1.145024, 1.433988, -1.544318, 1, 1, 1, 1, 1,
-1.134582, 1.035187, -0.3175589, 1, 1, 1, 1, 1,
-1.133052, -1.148955, -3.006442, 0, 0, 1, 1, 1,
-1.128938, -0.03574656, -1.327003, 1, 0, 0, 1, 1,
-1.126514, -0.518158, -0.8826775, 1, 0, 0, 1, 1,
-1.126176, 1.907803, 0.06444961, 1, 0, 0, 1, 1,
-1.122407, 0.2317287, -0.7210882, 1, 0, 0, 1, 1,
-1.11981, -0.3823651, -1.316728, 1, 0, 0, 1, 1,
-1.118428, -0.1144059, -1.828994, 0, 0, 0, 1, 1,
-1.104788, -1.664099, -2.186018, 0, 0, 0, 1, 1,
-1.088174, 0.1993401, -3.140527, 0, 0, 0, 1, 1,
-1.087134, 1.01508, -0.480796, 0, 0, 0, 1, 1,
-1.079773, 0.6929661, -1.355672, 0, 0, 0, 1, 1,
-1.077903, 0.2334945, -1.48901, 0, 0, 0, 1, 1,
-1.077705, -0.1626803, -2.102724, 0, 0, 0, 1, 1,
-1.072793, -0.4366988, -2.201004, 1, 1, 1, 1, 1,
-1.070277, 0.03159989, -2.550499, 1, 1, 1, 1, 1,
-1.066205, 1.475812, -1.093666, 1, 1, 1, 1, 1,
-1.054335, 1.38179, 0.4521049, 1, 1, 1, 1, 1,
-1.05104, -0.6444223, -2.214731, 1, 1, 1, 1, 1,
-1.049567, 0.7377617, 1.155756, 1, 1, 1, 1, 1,
-1.045455, 0.1216372, 0.05181867, 1, 1, 1, 1, 1,
-1.03585, -0.1069, -2.189746, 1, 1, 1, 1, 1,
-1.02884, -0.05733888, -0.9159881, 1, 1, 1, 1, 1,
-1.027884, 0.7840105, 0.5858079, 1, 1, 1, 1, 1,
-1.015848, 1.062967, -0.2962526, 1, 1, 1, 1, 1,
-1.0058, 1.619466, -2.202311, 1, 1, 1, 1, 1,
-1.005203, -1.0889, -1.258488, 1, 1, 1, 1, 1,
-1.000638, 0.03223891, -0.9107118, 1, 1, 1, 1, 1,
-0.9868311, -0.1525059, 0.0126724, 1, 1, 1, 1, 1,
-0.9855738, -2.056603, -3.713983, 0, 0, 1, 1, 1,
-0.9811603, -2.089512, -3.798549, 1, 0, 0, 1, 1,
-0.9717875, 0.1945914, -1.611815, 1, 0, 0, 1, 1,
-0.9683872, -0.2061366, -3.610762, 1, 0, 0, 1, 1,
-0.9578259, 0.2191724, -1.649102, 1, 0, 0, 1, 1,
-0.9559227, -0.7536919, -4.088671, 1, 0, 0, 1, 1,
-0.950951, 2.301292, 0.3641436, 0, 0, 0, 1, 1,
-0.9487782, 0.571223, -1.426797, 0, 0, 0, 1, 1,
-0.9462254, 0.2909073, -1.579044, 0, 0, 0, 1, 1,
-0.9389135, 0.06376714, -0.6572803, 0, 0, 0, 1, 1,
-0.9387759, 0.1819585, -0.1154002, 0, 0, 0, 1, 1,
-0.9375677, 0.2721776, -2.560532, 0, 0, 0, 1, 1,
-0.931419, -0.5765225, -2.548235, 0, 0, 0, 1, 1,
-0.9301761, -0.9066584, -0.240961, 1, 1, 1, 1, 1,
-0.9251311, 0.8315341, -0.9664089, 1, 1, 1, 1, 1,
-0.9235764, 0.4649299, 1.665892, 1, 1, 1, 1, 1,
-0.9065024, -0.5007676, -1.303798, 1, 1, 1, 1, 1,
-0.9046058, -1.011209, -3.203646, 1, 1, 1, 1, 1,
-0.9024929, -2.097181, -3.120486, 1, 1, 1, 1, 1,
-0.90052, 0.4113329, -0.1312675, 1, 1, 1, 1, 1,
-0.891659, 2.248569, -1.896646, 1, 1, 1, 1, 1,
-0.8907862, -1.454052, -2.434096, 1, 1, 1, 1, 1,
-0.885797, 0.3891995, -1.245423, 1, 1, 1, 1, 1,
-0.8841976, 0.1542756, -1.638465, 1, 1, 1, 1, 1,
-0.8827925, 0.8332552, -1.580152, 1, 1, 1, 1, 1,
-0.8807011, -0.3375519, -0.5500302, 1, 1, 1, 1, 1,
-0.8761579, -0.4664988, -1.963079, 1, 1, 1, 1, 1,
-0.8727875, 2.55033, -0.154728, 1, 1, 1, 1, 1,
-0.8647948, -0.4210881, -3.919977, 0, 0, 1, 1, 1,
-0.8611279, 0.5816662, -1.765679, 1, 0, 0, 1, 1,
-0.8552248, -0.5096194, -2.889501, 1, 0, 0, 1, 1,
-0.8376084, 0.7151323, -1.377044, 1, 0, 0, 1, 1,
-0.824797, -0.8239113, -2.735428, 1, 0, 0, 1, 1,
-0.8238615, 0.1983626, -2.461951, 1, 0, 0, 1, 1,
-0.8234441, 0.9166031, 2.009361, 0, 0, 0, 1, 1,
-0.8233601, 1.319928, 0.19323, 0, 0, 0, 1, 1,
-0.8181305, 0.4160638, -0.5046026, 0, 0, 0, 1, 1,
-0.8146637, -0.105869, -1.48244, 0, 0, 0, 1, 1,
-0.8121729, 0.5730908, 0.203847, 0, 0, 0, 1, 1,
-0.8059386, 0.1525353, -0.9141482, 0, 0, 0, 1, 1,
-0.8040659, -0.5995225, -1.755238, 0, 0, 0, 1, 1,
-0.801958, 0.06567981, -0.1607254, 1, 1, 1, 1, 1,
-0.8005061, 1.038446, -0.1364393, 1, 1, 1, 1, 1,
-0.7968829, -0.04235794, -2.667101, 1, 1, 1, 1, 1,
-0.7966302, 0.52846, -2.027274, 1, 1, 1, 1, 1,
-0.7950048, 1.659039, -0.3180289, 1, 1, 1, 1, 1,
-0.7840456, -0.5199181, -0.8142402, 1, 1, 1, 1, 1,
-0.7826957, -1.237015, -3.370526, 1, 1, 1, 1, 1,
-0.7812183, -2.537741, -0.856113, 1, 1, 1, 1, 1,
-0.7775293, -0.9088441, -3.082833, 1, 1, 1, 1, 1,
-0.7746577, -0.9777753, -2.744501, 1, 1, 1, 1, 1,
-0.7708324, 0.9921845, -0.9284668, 1, 1, 1, 1, 1,
-0.7701963, 0.7636784, 0.3399226, 1, 1, 1, 1, 1,
-0.7669629, -0.8596688, -2.855284, 1, 1, 1, 1, 1,
-0.7620448, -0.3855712, -2.631989, 1, 1, 1, 1, 1,
-0.7603219, 0.9194326, -2.046957, 1, 1, 1, 1, 1,
-0.7591642, 1.865776, 0.5452197, 0, 0, 1, 1, 1,
-0.7588139, 0.2918489, -0.2213583, 1, 0, 0, 1, 1,
-0.7569913, -1.166251, -3.645361, 1, 0, 0, 1, 1,
-0.7565289, -0.7063625, -1.937505, 1, 0, 0, 1, 1,
-0.7554315, -0.4361742, -3.350299, 1, 0, 0, 1, 1,
-0.750726, -0.3651368, -3.257682, 1, 0, 0, 1, 1,
-0.7394285, -0.5566544, -1.836431, 0, 0, 0, 1, 1,
-0.7377009, -1.451885, -1.715823, 0, 0, 0, 1, 1,
-0.7339344, 0.2942035, -1.345782, 0, 0, 0, 1, 1,
-0.7330506, 1.037588, 0.7204847, 0, 0, 0, 1, 1,
-0.7294283, -0.209285, -1.487188, 0, 0, 0, 1, 1,
-0.7268836, -0.7357619, -2.820847, 0, 0, 0, 1, 1,
-0.72506, 0.04581035, -1.31716, 0, 0, 0, 1, 1,
-0.7242118, -0.5505234, -2.390796, 1, 1, 1, 1, 1,
-0.7202946, 0.3700622, -1.261762, 1, 1, 1, 1, 1,
-0.7155985, -0.3236616, -1.170649, 1, 1, 1, 1, 1,
-0.7143536, 0.3339859, -2.406196, 1, 1, 1, 1, 1,
-0.7091245, -0.03987314, -1.454902, 1, 1, 1, 1, 1,
-0.7036058, 1.450091, -0.8967414, 1, 1, 1, 1, 1,
-0.6969451, 0.4822617, -0.4978401, 1, 1, 1, 1, 1,
-0.6953663, 2.073739, 1.178765, 1, 1, 1, 1, 1,
-0.6906136, -0.9292668, -2.583271, 1, 1, 1, 1, 1,
-0.6868259, 0.7053985, -1.857618, 1, 1, 1, 1, 1,
-0.6808893, 1.011797, 0.1339099, 1, 1, 1, 1, 1,
-0.6803788, -0.8081481, -3.024197, 1, 1, 1, 1, 1,
-0.6736699, 0.3052821, -1.297091, 1, 1, 1, 1, 1,
-0.6720801, 0.9761789, -1.510065, 1, 1, 1, 1, 1,
-0.6716456, -1.292753, -1.678412, 1, 1, 1, 1, 1,
-0.6642352, -0.9247807, -3.281112, 0, 0, 1, 1, 1,
-0.6637905, -0.2646897, -0.5636904, 1, 0, 0, 1, 1,
-0.6578124, -0.7291566, -1.678178, 1, 0, 0, 1, 1,
-0.6561167, -0.03917627, -0.1778398, 1, 0, 0, 1, 1,
-0.6522804, 1.044082, 0.6470442, 1, 0, 0, 1, 1,
-0.6501586, -0.1895861, -0.7069508, 1, 0, 0, 1, 1,
-0.6496224, 0.703871, 0.0989746, 0, 0, 0, 1, 1,
-0.6493796, -0.7378058, -3.244846, 0, 0, 0, 1, 1,
-0.6487145, -0.7733345, -3.428354, 0, 0, 0, 1, 1,
-0.648424, 0.1216763, -2.502392, 0, 0, 0, 1, 1,
-0.6475542, 1.629572, 1.216335, 0, 0, 0, 1, 1,
-0.6440794, -0.6031841, -2.864616, 0, 0, 0, 1, 1,
-0.6410643, -1.015516, -2.967461, 0, 0, 0, 1, 1,
-0.6381329, 0.3928511, -1.566617, 1, 1, 1, 1, 1,
-0.6345791, 1.427094, -1.425472, 1, 1, 1, 1, 1,
-0.6321024, -0.0453313, -2.95316, 1, 1, 1, 1, 1,
-0.6301756, 1.110242, 0.4058379, 1, 1, 1, 1, 1,
-0.627593, -0.4705798, -0.7776242, 1, 1, 1, 1, 1,
-0.6258581, 0.05331233, -1.199593, 1, 1, 1, 1, 1,
-0.6225507, -0.05012438, -1.121424, 1, 1, 1, 1, 1,
-0.6177106, -1.129229, -3.0791, 1, 1, 1, 1, 1,
-0.6122429, 1.112771, -1.045006, 1, 1, 1, 1, 1,
-0.6106205, 0.5729139, -1.332838, 1, 1, 1, 1, 1,
-0.6019893, 0.5996448, 0.6880521, 1, 1, 1, 1, 1,
-0.6015124, -0.2507004, -1.987284, 1, 1, 1, 1, 1,
-0.6011198, 1.603951, -0.3661745, 1, 1, 1, 1, 1,
-0.6004522, 0.2973219, -1.613268, 1, 1, 1, 1, 1,
-0.5975246, -0.5804498, -2.540364, 1, 1, 1, 1, 1,
-0.5870601, -0.768609, -3.52485, 0, 0, 1, 1, 1,
-0.5827973, 0.107375, 0.1840587, 1, 0, 0, 1, 1,
-0.5743394, -0.3333125, -3.013715, 1, 0, 0, 1, 1,
-0.5729062, -0.05380888, -1.041933, 1, 0, 0, 1, 1,
-0.5697275, -0.5732678, -2.678676, 1, 0, 0, 1, 1,
-0.5583989, 0.689095, -1.911063, 1, 0, 0, 1, 1,
-0.5541157, -1.128196, -3.754416, 0, 0, 0, 1, 1,
-0.5520362, 0.1690014, -2.4116, 0, 0, 0, 1, 1,
-0.547892, -0.2727951, -1.36048, 0, 0, 0, 1, 1,
-0.5474136, -0.8331038, -1.63816, 0, 0, 0, 1, 1,
-0.5440676, 0.05887571, -1.988088, 0, 0, 0, 1, 1,
-0.540458, 0.6354445, -0.6893578, 0, 0, 0, 1, 1,
-0.5374127, 0.7258931, -2.092716, 0, 0, 0, 1, 1,
-0.536835, 0.6427214, -1.24944, 1, 1, 1, 1, 1,
-0.5354612, 0.004150257, -1.939056, 1, 1, 1, 1, 1,
-0.5354152, -0.07703839, -2.652756, 1, 1, 1, 1, 1,
-0.5351845, 1.545059, -0.6962314, 1, 1, 1, 1, 1,
-0.531325, -0.6537585, -3.978628, 1, 1, 1, 1, 1,
-0.5306394, -2.131493, -3.867427, 1, 1, 1, 1, 1,
-0.5295517, 1.240421, 1.630021, 1, 1, 1, 1, 1,
-0.5291985, 0.8018463, -0.2136498, 1, 1, 1, 1, 1,
-0.5291114, -1.921949, -1.846263, 1, 1, 1, 1, 1,
-0.5283746, -0.5496395, -1.641224, 1, 1, 1, 1, 1,
-0.5195318, -0.06043091, -1.387743, 1, 1, 1, 1, 1,
-0.5134069, -0.3256538, -1.657099, 1, 1, 1, 1, 1,
-0.5130519, -0.4830624, -2.297598, 1, 1, 1, 1, 1,
-0.5129652, -1.781935, -4.584955, 1, 1, 1, 1, 1,
-0.5126186, 1.013951, 0.2507807, 1, 1, 1, 1, 1,
-0.5116609, -2.451828, -2.13589, 0, 0, 1, 1, 1,
-0.5086898, -0.2310034, -0.7960988, 1, 0, 0, 1, 1,
-0.5069436, -1.634014, -3.476077, 1, 0, 0, 1, 1,
-0.503713, 0.4792652, 0.711576, 1, 0, 0, 1, 1,
-0.5020971, -0.6630251, -2.850878, 1, 0, 0, 1, 1,
-0.5018877, 0.8750257, -1.174597, 1, 0, 0, 1, 1,
-0.4971154, 0.7724333, -0.03462581, 0, 0, 0, 1, 1,
-0.4966501, -0.4680758, -2.273009, 0, 0, 0, 1, 1,
-0.494536, -1.557887, -2.420048, 0, 0, 0, 1, 1,
-0.4901185, -0.02666171, -1.158687, 0, 0, 0, 1, 1,
-0.4892934, 2.195153, -1.6264, 0, 0, 0, 1, 1,
-0.4880318, 0.3308718, -0.729158, 0, 0, 0, 1, 1,
-0.4855857, 1.085157, -1.920992, 0, 0, 0, 1, 1,
-0.4835984, -0.594172, -3.814879, 1, 1, 1, 1, 1,
-0.4787793, 0.3821259, -0.360779, 1, 1, 1, 1, 1,
-0.4777244, 0.7854086, -0.2728102, 1, 1, 1, 1, 1,
-0.4731858, 1.007531, 0.06682926, 1, 1, 1, 1, 1,
-0.4694706, -0.7575587, -1.505292, 1, 1, 1, 1, 1,
-0.4652904, 0.7644043, -0.5593321, 1, 1, 1, 1, 1,
-0.4637752, 0.0961172, -1.276384, 1, 1, 1, 1, 1,
-0.4607019, 0.5454398, 0.2102866, 1, 1, 1, 1, 1,
-0.4560891, -0.5642523, -3.904333, 1, 1, 1, 1, 1,
-0.4556878, -0.7536929, -2.050933, 1, 1, 1, 1, 1,
-0.4525461, -0.1598157, -1.817924, 1, 1, 1, 1, 1,
-0.4451647, -0.3631614, -1.046259, 1, 1, 1, 1, 1,
-0.4398839, -1.478226, -3.026247, 1, 1, 1, 1, 1,
-0.4367944, 0.4715989, -0.7418489, 1, 1, 1, 1, 1,
-0.4365454, 0.9005433, -1.373975, 1, 1, 1, 1, 1,
-0.4317891, -0.8911805, -2.777158, 0, 0, 1, 1, 1,
-0.4306488, 0.2775982, -0.8168597, 1, 0, 0, 1, 1,
-0.4273388, -1.092289, -3.253828, 1, 0, 0, 1, 1,
-0.4238617, 1.91926, -0.3666319, 1, 0, 0, 1, 1,
-0.4222954, 0.2667282, -1.720177, 1, 0, 0, 1, 1,
-0.420837, -0.6592512, -1.806764, 1, 0, 0, 1, 1,
-0.4201502, -1.681326, -3.047453, 0, 0, 0, 1, 1,
-0.4170696, -0.6050249, -2.847621, 0, 0, 0, 1, 1,
-0.4114809, -0.8097088, -1.170828, 0, 0, 0, 1, 1,
-0.4109791, 0.4504473, 0.5734814, 0, 0, 0, 1, 1,
-0.4070388, 0.3072929, -0.8779803, 0, 0, 0, 1, 1,
-0.4032227, -0.5172531, -3.841236, 0, 0, 0, 1, 1,
-0.4008206, -0.5022727, -0.8012061, 0, 0, 0, 1, 1,
-0.400797, -0.6917049, -3.808779, 1, 1, 1, 1, 1,
-0.4005027, -1.3332, -2.570526, 1, 1, 1, 1, 1,
-0.3989767, 0.5304055, -1.440622, 1, 1, 1, 1, 1,
-0.395967, 0.2276836, -0.3640315, 1, 1, 1, 1, 1,
-0.3952053, 0.2362146, -0.3941872, 1, 1, 1, 1, 1,
-0.3873156, -0.3451122, -2.407916, 1, 1, 1, 1, 1,
-0.3850289, -1.529302, -2.639338, 1, 1, 1, 1, 1,
-0.3847038, -0.2600383, 0.628242, 1, 1, 1, 1, 1,
-0.3833127, 0.7732854, -1.527346, 1, 1, 1, 1, 1,
-0.3831761, -0.1876043, -1.830297, 1, 1, 1, 1, 1,
-0.3807023, 0.6213642, -0.1809993, 1, 1, 1, 1, 1,
-0.377141, 0.9479042, -0.6531518, 1, 1, 1, 1, 1,
-0.3760507, -0.05880125, -3.077055, 1, 1, 1, 1, 1,
-0.3745615, -0.941686, -2.127022, 1, 1, 1, 1, 1,
-0.3697568, -0.01322583, -2.775428, 1, 1, 1, 1, 1,
-0.3633712, -0.499594, -1.497488, 0, 0, 1, 1, 1,
-0.3570563, 0.3444703, -0.5937194, 1, 0, 0, 1, 1,
-0.3494803, -2.13795, -2.497555, 1, 0, 0, 1, 1,
-0.3423077, -0.1615985, -4.27255, 1, 0, 0, 1, 1,
-0.3402124, 0.08001541, -1.383457, 1, 0, 0, 1, 1,
-0.3384476, 0.8431514, -0.3344041, 1, 0, 0, 1, 1,
-0.3366051, 2.030891, -0.5812028, 0, 0, 0, 1, 1,
-0.333511, -1.511844, -3.564424, 0, 0, 0, 1, 1,
-0.3290215, -1.086814, -5.397897, 0, 0, 0, 1, 1,
-0.3274722, -0.1829554, -2.392834, 0, 0, 0, 1, 1,
-0.3252232, -0.5246748, -2.96025, 0, 0, 0, 1, 1,
-0.3226498, 0.6681108, -1.461445, 0, 0, 0, 1, 1,
-0.3185892, -0.6163479, -3.548151, 0, 0, 0, 1, 1,
-0.3184954, -0.3495978, -2.193017, 1, 1, 1, 1, 1,
-0.315307, 0.8243681, 0.1754279, 1, 1, 1, 1, 1,
-0.3140032, 2.035319, 0.6722319, 1, 1, 1, 1, 1,
-0.3131987, 1.51861, 2.054912, 1, 1, 1, 1, 1,
-0.3101464, 0.6816936, -2.005031, 1, 1, 1, 1, 1,
-0.3100614, -1.17005, -3.608238, 1, 1, 1, 1, 1,
-0.3096189, 1.282951, -0.9661454, 1, 1, 1, 1, 1,
-0.3094706, 0.4142574, -0.4818606, 1, 1, 1, 1, 1,
-0.3087375, -0.1652795, -2.230835, 1, 1, 1, 1, 1,
-0.3085491, -0.0595389, 0.3483929, 1, 1, 1, 1, 1,
-0.3057816, -1.008501, -2.9481, 1, 1, 1, 1, 1,
-0.3018455, 1.534756, -0.1538081, 1, 1, 1, 1, 1,
-0.2977821, 0.3768082, -0.4576561, 1, 1, 1, 1, 1,
-0.2964223, -0.9452799, -4.541378, 1, 1, 1, 1, 1,
-0.2931278, -0.1016228, -0.7501606, 1, 1, 1, 1, 1,
-0.2854217, -0.4945605, -2.242697, 0, 0, 1, 1, 1,
-0.2829785, 1.569165, -2.451756, 1, 0, 0, 1, 1,
-0.2812116, -0.5043882, -1.232286, 1, 0, 0, 1, 1,
-0.2803087, -0.8668551, -2.673038, 1, 0, 0, 1, 1,
-0.2770711, -0.3962646, -3.168631, 1, 0, 0, 1, 1,
-0.2760735, -0.9929053, -2.056072, 1, 0, 0, 1, 1,
-0.2732768, -1.00423, -5.139913, 0, 0, 0, 1, 1,
-0.2711438, 0.01306223, -0.6232975, 0, 0, 0, 1, 1,
-0.2650541, -0.3390175, -2.823102, 0, 0, 0, 1, 1,
-0.2648587, -1.881909, -3.43035, 0, 0, 0, 1, 1,
-0.2600815, 1.376749, 0.01399112, 0, 0, 0, 1, 1,
-0.2596353, -0.3398015, -2.333774, 0, 0, 0, 1, 1,
-0.2583607, -0.1683732, -3.864837, 0, 0, 0, 1, 1,
-0.2511187, 0.1117147, -1.352725, 1, 1, 1, 1, 1,
-0.2485137, -1.203499, -4.413818, 1, 1, 1, 1, 1,
-0.2476798, 1.929535, -0.0493065, 1, 1, 1, 1, 1,
-0.244927, -0.9360673, -3.142123, 1, 1, 1, 1, 1,
-0.241038, 1.089039, -0.5204509, 1, 1, 1, 1, 1,
-0.2345262, 0.6895944, 0.9189949, 1, 1, 1, 1, 1,
-0.2292209, -1.700934, -3.425617, 1, 1, 1, 1, 1,
-0.2246255, 0.6509234, 0.2130138, 1, 1, 1, 1, 1,
-0.2237493, 0.6357651, 0.9752634, 1, 1, 1, 1, 1,
-0.2227124, -2.351688, -3.345281, 1, 1, 1, 1, 1,
-0.2167879, -0.1356667, -2.420435, 1, 1, 1, 1, 1,
-0.2161178, -1.74005, -2.926338, 1, 1, 1, 1, 1,
-0.2134998, -0.1104317, -1.678415, 1, 1, 1, 1, 1,
-0.2133483, 0.7921109, 1.487051, 1, 1, 1, 1, 1,
-0.2124487, 1.799658, 0.07529373, 1, 1, 1, 1, 1,
-0.2108098, -1.202715, -3.272016, 0, 0, 1, 1, 1,
-0.2045434, -2.312783, -1.894864, 1, 0, 0, 1, 1,
-0.2036966, 0.1741695, 0.3553062, 1, 0, 0, 1, 1,
-0.2026454, -0.1516103, -1.124629, 1, 0, 0, 1, 1,
-0.2023348, 0.5117025, -2.041013, 1, 0, 0, 1, 1,
-0.1976812, -1.003575, -3.026368, 1, 0, 0, 1, 1,
-0.1969992, 2.265513, -2.368635, 0, 0, 0, 1, 1,
-0.1953744, -1.017534, -1.377468, 0, 0, 0, 1, 1,
-0.1916678, 0.7958782, -1.316621, 0, 0, 0, 1, 1,
-0.1885152, -1.130843, -3.866232, 0, 0, 0, 1, 1,
-0.1884634, 0.8185022, -2.879046, 0, 0, 0, 1, 1,
-0.1881961, -1.928957, -1.314482, 0, 0, 0, 1, 1,
-0.1858115, -1.780214, -3.318617, 0, 0, 0, 1, 1,
-0.1838224, 0.8911135, -1.945454, 1, 1, 1, 1, 1,
-0.1800123, 1.528502, 0.2609165, 1, 1, 1, 1, 1,
-0.1748816, -1.984712, -1.612087, 1, 1, 1, 1, 1,
-0.1708405, 0.755727, -0.8592066, 1, 1, 1, 1, 1,
-0.170481, 0.4538564, -1.602614, 1, 1, 1, 1, 1,
-0.1694705, -0.5988696, -1.543862, 1, 1, 1, 1, 1,
-0.1679568, 1.773257, 1.09166, 1, 1, 1, 1, 1,
-0.1642235, -0.3406539, -1.685795, 1, 1, 1, 1, 1,
-0.164172, -0.04135545, -0.09385581, 1, 1, 1, 1, 1,
-0.1582261, -1.080078, -3.771502, 1, 1, 1, 1, 1,
-0.1580318, -1.058218, -2.008631, 1, 1, 1, 1, 1,
-0.1516059, 1.943218, -0.4116378, 1, 1, 1, 1, 1,
-0.1496686, 0.7075143, -0.5809609, 1, 1, 1, 1, 1,
-0.1490518, -0.4882272, -2.470082, 1, 1, 1, 1, 1,
-0.1479368, -0.4719013, -3.175898, 1, 1, 1, 1, 1,
-0.1461958, 0.3849612, -1.437138, 0, 0, 1, 1, 1,
-0.1461304, -1.297823, -1.599446, 1, 0, 0, 1, 1,
-0.1459812, -0.8265083, -1.990983, 1, 0, 0, 1, 1,
-0.1441569, -1.237324, -1.858076, 1, 0, 0, 1, 1,
-0.1376742, -0.6874858, -1.970377, 1, 0, 0, 1, 1,
-0.1365376, 2.570089, 0.4582104, 1, 0, 0, 1, 1,
-0.1327236, 2.840565, -0.8692589, 0, 0, 0, 1, 1,
-0.1321848, -0.4828742, -2.650486, 0, 0, 0, 1, 1,
-0.1313066, 0.9991148, 0.5308897, 0, 0, 0, 1, 1,
-0.1307116, -1.147075, -3.668396, 0, 0, 0, 1, 1,
-0.1255563, 0.6150824, -0.635738, 0, 0, 0, 1, 1,
-0.1158069, -0.595271, -2.701587, 0, 0, 0, 1, 1,
-0.1141821, 0.1278435, -1.233399, 0, 0, 0, 1, 1,
-0.1138348, 0.1939211, 0.4948691, 1, 1, 1, 1, 1,
-0.1137096, 0.1909665, -0.5498376, 1, 1, 1, 1, 1,
-0.1112571, 0.2331532, -0.1303855, 1, 1, 1, 1, 1,
-0.106788, -2.048568, -4.758474, 1, 1, 1, 1, 1,
-0.1059234, -2.549027, -3.185115, 1, 1, 1, 1, 1,
-0.1049632, -1.491987, -3.786433, 1, 1, 1, 1, 1,
-0.1035728, 2.034899, 1.124918, 1, 1, 1, 1, 1,
-0.1031048, 2.647619, -2.058961, 1, 1, 1, 1, 1,
-0.1030886, -0.2720303, -2.187003, 1, 1, 1, 1, 1,
-0.1028604, -0.2110207, -4.949928, 1, 1, 1, 1, 1,
-0.1014966, 1.527738, -2.763456, 1, 1, 1, 1, 1,
-0.1013285, 1.820674, -0.2934619, 1, 1, 1, 1, 1,
-0.09795945, 1.101601, 0.3167167, 1, 1, 1, 1, 1,
-0.09551562, -0.05460532, -1.880256, 1, 1, 1, 1, 1,
-0.09414741, 0.3894535, 0.09110288, 1, 1, 1, 1, 1,
-0.09283302, 1.15416, -0.6435104, 0, 0, 1, 1, 1,
-0.08703341, 0.1747468, -0.9834012, 1, 0, 0, 1, 1,
-0.08510155, -0.07096293, -3.221699, 1, 0, 0, 1, 1,
-0.08358998, -0.01800255, -0.6027308, 1, 0, 0, 1, 1,
-0.08041985, -0.05534146, -1.931844, 1, 0, 0, 1, 1,
-0.07893121, 2.316301, -1.721318, 1, 0, 0, 1, 1,
-0.07801091, 0.648544, -1.27781, 0, 0, 0, 1, 1,
-0.07712363, -0.1062614, -2.957999, 0, 0, 0, 1, 1,
-0.07607728, -0.9243878, -4.320872, 0, 0, 0, 1, 1,
-0.07532349, 1.167365, -1.105081, 0, 0, 0, 1, 1,
-0.07308872, -0.2081512, -2.00996, 0, 0, 0, 1, 1,
-0.06946911, -0.2072484, -1.873505, 0, 0, 0, 1, 1,
-0.06884564, 0.175683, 0.7825025, 0, 0, 0, 1, 1,
-0.0688036, 0.4719374, -0.3726116, 1, 1, 1, 1, 1,
-0.06849539, -0.001218821, -2.889002, 1, 1, 1, 1, 1,
-0.06553301, 0.6958107, -0.3587125, 1, 1, 1, 1, 1,
-0.06398943, 0.3990643, -0.8399227, 1, 1, 1, 1, 1,
-0.06200202, -0.5786942, -3.169481, 1, 1, 1, 1, 1,
-0.06095529, -1.125907, -3.311376, 1, 1, 1, 1, 1,
-0.05721841, 1.766657, 0.4429489, 1, 1, 1, 1, 1,
-0.05436867, 0.8371683, 0.6412929, 1, 1, 1, 1, 1,
-0.04707661, -1.569677, -3.067821, 1, 1, 1, 1, 1,
-0.03989435, 0.7480558, 0.7120706, 1, 1, 1, 1, 1,
-0.03830884, -1.476866, -2.035146, 1, 1, 1, 1, 1,
-0.03699647, -1.696328, -1.430378, 1, 1, 1, 1, 1,
-0.03317002, 0.6423428, -0.6596066, 1, 1, 1, 1, 1,
-0.03243035, 1.165926, -0.5117381, 1, 1, 1, 1, 1,
-0.02922321, 1.127166, 0.2247635, 1, 1, 1, 1, 1,
-0.02507997, -1.512153, -1.830291, 0, 0, 1, 1, 1,
-0.02252734, 0.679983, -0.5197083, 1, 0, 0, 1, 1,
-0.0221912, -0.05268373, -2.842379, 1, 0, 0, 1, 1,
-0.01917771, -0.1069691, -2.840116, 1, 0, 0, 1, 1,
-0.01843865, 2.439152, -1.059931, 1, 0, 0, 1, 1,
-0.01615569, 0.5634506, 0.8330985, 1, 0, 0, 1, 1,
-0.007512632, 0.4833982, 1.397466, 0, 0, 0, 1, 1,
-0.004061036, 0.8529549, -1.396637, 0, 0, 0, 1, 1,
-0.00162275, 1.764836, -0.7073603, 0, 0, 0, 1, 1,
0.006845404, -0.2344452, 2.792483, 0, 0, 0, 1, 1,
0.00869833, 0.7816763, -0.2084318, 0, 0, 0, 1, 1,
0.0153473, -0.7284482, 3.35412, 0, 0, 0, 1, 1,
0.01584844, -0.6370933, 2.685582, 0, 0, 0, 1, 1,
0.01893688, -0.5708637, 1.886481, 1, 1, 1, 1, 1,
0.02382874, 1.852988, -0.1748289, 1, 1, 1, 1, 1,
0.02628444, -0.3514752, 2.918454, 1, 1, 1, 1, 1,
0.03292726, -1.803702, 1.541492, 1, 1, 1, 1, 1,
0.03461685, -0.4377277, 2.502307, 1, 1, 1, 1, 1,
0.04905046, 0.9597124, 0.4382145, 1, 1, 1, 1, 1,
0.05072841, 0.5316384, -0.2759452, 1, 1, 1, 1, 1,
0.05212155, -0.05498502, 2.084311, 1, 1, 1, 1, 1,
0.05224429, -0.8491986, 2.631205, 1, 1, 1, 1, 1,
0.05395058, 0.5103775, 1.978474, 1, 1, 1, 1, 1,
0.05493094, 1.251738, 2.247821, 1, 1, 1, 1, 1,
0.06093973, 1.000764, 1.983978, 1, 1, 1, 1, 1,
0.06098627, -0.6918011, 3.047853, 1, 1, 1, 1, 1,
0.0630664, -0.1695262, 2.021345, 1, 1, 1, 1, 1,
0.0649517, 1.742686, -0.494451, 1, 1, 1, 1, 1,
0.06655583, 1.655361, 0.1110113, 0, 0, 1, 1, 1,
0.07512553, 2.27151, 1.240986, 1, 0, 0, 1, 1,
0.07604022, -1.641295, 2.952617, 1, 0, 0, 1, 1,
0.0820156, -1.011794, 2.113927, 1, 0, 0, 1, 1,
0.08243334, -0.2562845, 3.131662, 1, 0, 0, 1, 1,
0.08434684, -0.3612796, 3.149225, 1, 0, 0, 1, 1,
0.08467656, 0.1378602, 0.5042261, 0, 0, 0, 1, 1,
0.08903835, 0.6379326, 0.9969256, 0, 0, 0, 1, 1,
0.0975205, -1.889923, 3.486471, 0, 0, 0, 1, 1,
0.09828999, 1.539578, -1.40924, 0, 0, 0, 1, 1,
0.09865823, 0.172331, 0.6129661, 0, 0, 0, 1, 1,
0.1054619, -0.07208393, 1.496632, 0, 0, 0, 1, 1,
0.1068551, 0.9667839, -1.556224, 0, 0, 0, 1, 1,
0.1118419, -0.9240472, 2.096524, 1, 1, 1, 1, 1,
0.1149231, -1.271703, 2.121153, 1, 1, 1, 1, 1,
0.1176065, 1.118192, -0.8418516, 1, 1, 1, 1, 1,
0.1208716, -0.7846881, 1.748935, 1, 1, 1, 1, 1,
0.1407288, -0.489772, 2.832419, 1, 1, 1, 1, 1,
0.1408516, 0.7934865, -0.4280169, 1, 1, 1, 1, 1,
0.1443815, 0.1768634, 0.04434576, 1, 1, 1, 1, 1,
0.1447241, 1.81058, 1.469697, 1, 1, 1, 1, 1,
0.1461221, -0.8567353, 1.611131, 1, 1, 1, 1, 1,
0.1483052, 0.3574544, -1.093154, 1, 1, 1, 1, 1,
0.1485043, -1.131236, 3.442295, 1, 1, 1, 1, 1,
0.1505462, -1.266449, 3.134889, 1, 1, 1, 1, 1,
0.1528354, 0.9944798, 0.2188045, 1, 1, 1, 1, 1,
0.1533387, -0.2379462, 3.723043, 1, 1, 1, 1, 1,
0.1564167, -0.03873716, 3.828598, 1, 1, 1, 1, 1,
0.1584651, -0.2962024, 2.637041, 0, 0, 1, 1, 1,
0.1647169, 0.7863926, 0.5061932, 1, 0, 0, 1, 1,
0.1739362, -1.149787, 3.222614, 1, 0, 0, 1, 1,
0.1777179, -0.09129529, 1.832661, 1, 0, 0, 1, 1,
0.1778342, -0.7169615, 3.509406, 1, 0, 0, 1, 1,
0.1825617, 0.2455187, 1.82945, 1, 0, 0, 1, 1,
0.1843168, -0.2341601, 1.735917, 0, 0, 0, 1, 1,
0.1851509, 1.494464, 1.032696, 0, 0, 0, 1, 1,
0.1852314, -0.5747954, 2.554055, 0, 0, 0, 1, 1,
0.1869599, 1.712522, 0.6410558, 0, 0, 0, 1, 1,
0.1895247, -1.352047, 3.355927, 0, 0, 0, 1, 1,
0.1930728, 0.2558328, -0.004584314, 0, 0, 0, 1, 1,
0.1933504, -1.448848, 2.853486, 0, 0, 0, 1, 1,
0.1960709, 1.079443, 2.514333, 1, 1, 1, 1, 1,
0.1993414, -0.4880151, 3.182789, 1, 1, 1, 1, 1,
0.2018952, 0.2460939, 1.42823, 1, 1, 1, 1, 1,
0.2038749, 0.2085007, 1.635838, 1, 1, 1, 1, 1,
0.2039428, -0.5169083, 3.609526, 1, 1, 1, 1, 1,
0.2043037, 1.267457, -0.8434618, 1, 1, 1, 1, 1,
0.2044288, 0.6778113, 0.4551573, 1, 1, 1, 1, 1,
0.2048649, 0.7321737, 0.1038013, 1, 1, 1, 1, 1,
0.2066926, 0.4104623, 0.07575662, 1, 1, 1, 1, 1,
0.2085203, -0.5578941, 3.312254, 1, 1, 1, 1, 1,
0.211574, 0.9890237, 1.117042, 1, 1, 1, 1, 1,
0.2138163, 0.3829965, -0.09268119, 1, 1, 1, 1, 1,
0.2149899, -1.561032, 3.499902, 1, 1, 1, 1, 1,
0.2228693, -1.044281, 2.993379, 1, 1, 1, 1, 1,
0.2234136, -0.6183683, 2.906138, 1, 1, 1, 1, 1,
0.2235616, -0.03464465, 1.924878, 0, 0, 1, 1, 1,
0.2235804, -0.06794011, 2.558276, 1, 0, 0, 1, 1,
0.2307167, 0.3879722, 0.7389288, 1, 0, 0, 1, 1,
0.2326733, 0.9334077, 0.2109414, 1, 0, 0, 1, 1,
0.2350654, -0.9465104, 2.386104, 1, 0, 0, 1, 1,
0.2351238, -2.271361, 1.851658, 1, 0, 0, 1, 1,
0.2372365, 0.06554329, 1.622873, 0, 0, 0, 1, 1,
0.2383886, -0.1954226, 2.065545, 0, 0, 0, 1, 1,
0.2390401, 0.2166848, 1.244946, 0, 0, 0, 1, 1,
0.2395754, -0.7229941, 1.570397, 0, 0, 0, 1, 1,
0.2395801, -1.814888, 3.919308, 0, 0, 0, 1, 1,
0.2419159, 0.06433057, 1.686125, 0, 0, 0, 1, 1,
0.2429321, -0.4107774, 2.74932, 0, 0, 0, 1, 1,
0.2430272, -1.105427, 3.06539, 1, 1, 1, 1, 1,
0.2476709, 1.322215, -1.348389, 1, 1, 1, 1, 1,
0.2480668, -0.6168785, 2.676306, 1, 1, 1, 1, 1,
0.2482745, 0.1894633, -0.7315008, 1, 1, 1, 1, 1,
0.2514087, 0.1969571, 0.7353138, 1, 1, 1, 1, 1,
0.2530828, 1.16764, -0.5357728, 1, 1, 1, 1, 1,
0.2595795, 0.4641124, 0.1211443, 1, 1, 1, 1, 1,
0.2600997, 0.9886303, -0.02374511, 1, 1, 1, 1, 1,
0.2608705, -0.9220149, 3.400691, 1, 1, 1, 1, 1,
0.263963, 0.928134, 0.6988986, 1, 1, 1, 1, 1,
0.2654446, -0.4645727, 3.883094, 1, 1, 1, 1, 1,
0.2663337, 0.7744139, 0.1319697, 1, 1, 1, 1, 1,
0.2671085, 0.8491077, -0.3715841, 1, 1, 1, 1, 1,
0.2709373, -0.7748413, 2.910873, 1, 1, 1, 1, 1,
0.2725306, 0.442702, 0.208515, 1, 1, 1, 1, 1,
0.2738032, 1.698898, -0.5765619, 0, 0, 1, 1, 1,
0.27381, -1.247487, 2.191336, 1, 0, 0, 1, 1,
0.275961, 1.438335, 1.514159, 1, 0, 0, 1, 1,
0.2790192, 0.7559, 1.26943, 1, 0, 0, 1, 1,
0.2797143, 1.435388, -1.791879, 1, 0, 0, 1, 1,
0.2854813, -0.4468817, 2.072335, 1, 0, 0, 1, 1,
0.287946, 0.3582705, -0.172936, 0, 0, 0, 1, 1,
0.2951356, -0.3276327, 2.405056, 0, 0, 0, 1, 1,
0.2955664, -0.6666256, 0.9901457, 0, 0, 0, 1, 1,
0.2973917, 0.427182, 1.775072, 0, 0, 0, 1, 1,
0.298231, 0.5893632, 0.569055, 0, 0, 0, 1, 1,
0.3000024, 0.1410236, 0.8070015, 0, 0, 0, 1, 1,
0.303441, -1.276918, 3.972879, 0, 0, 0, 1, 1,
0.310201, -1.28322, 5.440045, 1, 1, 1, 1, 1,
0.3128634, 0.7797368, 0.1776105, 1, 1, 1, 1, 1,
0.3233186, 1.543504, -1.515391, 1, 1, 1, 1, 1,
0.323681, 0.8631729, 0.361222, 1, 1, 1, 1, 1,
0.3319767, -2.085334, 3.712706, 1, 1, 1, 1, 1,
0.3327744, 0.4966375, -0.6347339, 1, 1, 1, 1, 1,
0.3345436, 0.7846373, -0.4173246, 1, 1, 1, 1, 1,
0.3365844, -0.6534924, 2.886258, 1, 1, 1, 1, 1,
0.339918, 0.6714973, -1.313643, 1, 1, 1, 1, 1,
0.3501212, 0.3528732, -0.550006, 1, 1, 1, 1, 1,
0.3544576, 0.8293794, 1.386567, 1, 1, 1, 1, 1,
0.3551702, 0.7861019, -0.3705156, 1, 1, 1, 1, 1,
0.3553178, 1.15389, -1.000285, 1, 1, 1, 1, 1,
0.3564361, -1.504994, 2.697322, 1, 1, 1, 1, 1,
0.358625, -0.6184061, 3.14638, 1, 1, 1, 1, 1,
0.3596592, 1.46481, 1.68643, 0, 0, 1, 1, 1,
0.3732743, 0.5237504, 1.372181, 1, 0, 0, 1, 1,
0.3754205, -0.2022, 2.2645, 1, 0, 0, 1, 1,
0.3754707, 0.7639121, 1.220644, 1, 0, 0, 1, 1,
0.3756652, -1.971872, 3.286182, 1, 0, 0, 1, 1,
0.3792465, -1.942852, 0.7021587, 1, 0, 0, 1, 1,
0.3841771, -1.914368, 1.526206, 0, 0, 0, 1, 1,
0.3847166, -0.8970048, 2.128443, 0, 0, 0, 1, 1,
0.3863047, -1.487506, 2.405034, 0, 0, 0, 1, 1,
0.3932366, -1.094822, 3.34862, 0, 0, 0, 1, 1,
0.3944922, -0.2630256, 2.613224, 0, 0, 0, 1, 1,
0.3951264, -1.015857, 2.501387, 0, 0, 0, 1, 1,
0.3997458, 0.08044168, 0.9604187, 0, 0, 0, 1, 1,
0.4006726, -0.1264249, 1.511108, 1, 1, 1, 1, 1,
0.4050005, 0.05647938, 3.320826, 1, 1, 1, 1, 1,
0.4079044, -0.7569842, 2.535338, 1, 1, 1, 1, 1,
0.4110321, 0.2977147, 0.7454013, 1, 1, 1, 1, 1,
0.4119247, 0.2967032, 1.054282, 1, 1, 1, 1, 1,
0.4129876, 0.492853, -0.1352038, 1, 1, 1, 1, 1,
0.4143065, -0.6105765, 4.048547, 1, 1, 1, 1, 1,
0.4169132, 0.3839923, 0.4355102, 1, 1, 1, 1, 1,
0.4177344, 0.6944712, 0.04931788, 1, 1, 1, 1, 1,
0.4237394, 2.219361, 0.8151905, 1, 1, 1, 1, 1,
0.4240013, 0.3009134, 2.236217, 1, 1, 1, 1, 1,
0.4253395, 1.109953, -0.02610451, 1, 1, 1, 1, 1,
0.4260838, -1.610358, 2.38317, 1, 1, 1, 1, 1,
0.4264604, 0.2620044, 1.576664, 1, 1, 1, 1, 1,
0.4272791, -1.541621, 4.604568, 1, 1, 1, 1, 1,
0.4311441, 0.7610986, 0.07354913, 0, 0, 1, 1, 1,
0.4328856, -0.9508125, 2.981173, 1, 0, 0, 1, 1,
0.4362555, -0.4579733, 1.52666, 1, 0, 0, 1, 1,
0.4362706, 0.6977955, 0.2954727, 1, 0, 0, 1, 1,
0.4384437, -0.1867467, 2.716889, 1, 0, 0, 1, 1,
0.4443018, 0.4276424, 0.5045778, 1, 0, 0, 1, 1,
0.4444098, -0.7229807, 1.563446, 0, 0, 0, 1, 1,
0.447831, 0.9413569, 1.068777, 0, 0, 0, 1, 1,
0.4508254, -2.310308, 3.317779, 0, 0, 0, 1, 1,
0.4513939, 2.132201, 0.3082086, 0, 0, 0, 1, 1,
0.4515101, 0.983318, -0.6970049, 0, 0, 0, 1, 1,
0.4525285, -0.3282385, 3.379746, 0, 0, 0, 1, 1,
0.455227, 0.1447169, 3.471719, 0, 0, 0, 1, 1,
0.4564524, -1.678228, 1.857402, 1, 1, 1, 1, 1,
0.4592276, -1.163711, 2.492807, 1, 1, 1, 1, 1,
0.4609926, -0.430467, 2.867551, 1, 1, 1, 1, 1,
0.4618323, 0.0867337, 0.1761959, 1, 1, 1, 1, 1,
0.4625553, -0.5188189, 2.745425, 1, 1, 1, 1, 1,
0.4699196, 1.151719, 1.275763, 1, 1, 1, 1, 1,
0.4701056, -0.4198492, 2.55557, 1, 1, 1, 1, 1,
0.4726811, 0.6578411, -0.6726784, 1, 1, 1, 1, 1,
0.4805408, -0.5272335, 2.73904, 1, 1, 1, 1, 1,
0.4811778, 0.4345024, 0.2570387, 1, 1, 1, 1, 1,
0.490857, -0.6821259, 3.094981, 1, 1, 1, 1, 1,
0.4915005, 0.733886, 0.7342674, 1, 1, 1, 1, 1,
0.4920234, 0.7483308, 1.205085, 1, 1, 1, 1, 1,
0.4993347, 0.9025737, 1.391927, 1, 1, 1, 1, 1,
0.5039821, -2.593105, 3.217248, 1, 1, 1, 1, 1,
0.5075493, 0.6037012, -0.5871047, 0, 0, 1, 1, 1,
0.5076768, -0.719707, 0.3546828, 1, 0, 0, 1, 1,
0.5079401, 0.2254623, 1.405086, 1, 0, 0, 1, 1,
0.5082154, 1.811882, 1.285922, 1, 0, 0, 1, 1,
0.5129533, 0.6627474, 1.345791, 1, 0, 0, 1, 1,
0.5174981, -0.7047125, 2.248795, 1, 0, 0, 1, 1,
0.5178047, 0.8224883, 0.798711, 0, 0, 0, 1, 1,
0.5188079, 0.2015241, 0.105787, 0, 0, 0, 1, 1,
0.5199783, 0.1320156, 2.293397, 0, 0, 0, 1, 1,
0.530674, 1.436622, -1.700516, 0, 0, 0, 1, 1,
0.5307857, -0.01976793, 1.780636, 0, 0, 0, 1, 1,
0.5326625, -0.5407693, 1.885776, 0, 0, 0, 1, 1,
0.5362626, 0.7011147, -0.4073686, 0, 0, 0, 1, 1,
0.5368425, -0.6741309, 1.381743, 1, 1, 1, 1, 1,
0.5377074, 0.9300779, 1.194261, 1, 1, 1, 1, 1,
0.5433697, -2.349056, 2.07097, 1, 1, 1, 1, 1,
0.5461064, -0.3483995, 2.002231, 1, 1, 1, 1, 1,
0.5478669, 1.135027, 1.782843, 1, 1, 1, 1, 1,
0.5610963, 1.850101, 0.0547853, 1, 1, 1, 1, 1,
0.5631258, 0.8933535, -0.5771691, 1, 1, 1, 1, 1,
0.5681407, 0.7761528, 0.5115614, 1, 1, 1, 1, 1,
0.5682073, -0.02537213, 2.823602, 1, 1, 1, 1, 1,
0.5682784, -0.9331178, 2.217326, 1, 1, 1, 1, 1,
0.5704201, -0.3728237, 2.887333, 1, 1, 1, 1, 1,
0.5714749, 0.9085717, -0.3649375, 1, 1, 1, 1, 1,
0.5724898, -0.4173384, 1.713002, 1, 1, 1, 1, 1,
0.5834004, 1.656141, 0.411638, 1, 1, 1, 1, 1,
0.5835642, -1.101366, 4.04471, 1, 1, 1, 1, 1,
0.5846727, 0.02454753, 0.9069948, 0, 0, 1, 1, 1,
0.5848988, 0.2047316, 0.2071173, 1, 0, 0, 1, 1,
0.5861723, -1.395655, 3.477684, 1, 0, 0, 1, 1,
0.5868838, 0.1064634, 1.28257, 1, 0, 0, 1, 1,
0.591965, 0.1972134, -0.07326857, 1, 0, 0, 1, 1,
0.5930638, 0.3453455, 0.738281, 1, 0, 0, 1, 1,
0.5943854, -1.521228, 2.249491, 0, 0, 0, 1, 1,
0.5970288, -0.1851252, 2.090603, 0, 0, 0, 1, 1,
0.5990208, -1.371345, 1.779439, 0, 0, 0, 1, 1,
0.6044492, 1.634428, 2.27324, 0, 0, 0, 1, 1,
0.6063657, -0.06144674, 0.2671928, 0, 0, 0, 1, 1,
0.607311, 0.2265092, 2.860416, 0, 0, 0, 1, 1,
0.6135099, -0.3476852, 0.4896122, 0, 0, 0, 1, 1,
0.6136623, -0.4308674, 3.599771, 1, 1, 1, 1, 1,
0.6137314, -0.6560224, 2.461241, 1, 1, 1, 1, 1,
0.6149154, 1.15018, 0.1715882, 1, 1, 1, 1, 1,
0.616042, 1.297937, 2.892968, 1, 1, 1, 1, 1,
0.616459, -1.206677, 4.03422, 1, 1, 1, 1, 1,
0.6213614, 0.6103556, 0.03281097, 1, 1, 1, 1, 1,
0.6231236, 2.383094, 0.039624, 1, 1, 1, 1, 1,
0.6318325, 0.2312806, 0.5312179, 1, 1, 1, 1, 1,
0.6339878, -1.725291, 2.554706, 1, 1, 1, 1, 1,
0.6351562, 0.03427775, 1.461099, 1, 1, 1, 1, 1,
0.6433752, 1.138079, -0.8560066, 1, 1, 1, 1, 1,
0.645308, 0.2702496, 0.07965599, 1, 1, 1, 1, 1,
0.6467196, -1.968911, 2.713996, 1, 1, 1, 1, 1,
0.6474756, -1.836714, 3.161329, 1, 1, 1, 1, 1,
0.6485468, -0.3029346, 1.005826, 1, 1, 1, 1, 1,
0.6488737, 0.4240372, -0.3593979, 0, 0, 1, 1, 1,
0.6502736, 1.123314, -0.7376889, 1, 0, 0, 1, 1,
0.6598535, -1.647686, 2.353383, 1, 0, 0, 1, 1,
0.6636322, 1.192041, -0.3554175, 1, 0, 0, 1, 1,
0.6672496, 0.07540762, 1.304567, 1, 0, 0, 1, 1,
0.6874334, 1.718456, 1.139585, 1, 0, 0, 1, 1,
0.6892537, 1.103316, 0.5412939, 0, 0, 0, 1, 1,
0.6979754, 1.337262, -0.7771646, 0, 0, 0, 1, 1,
0.6984015, -0.4873701, 3.083016, 0, 0, 0, 1, 1,
0.6991391, 0.5440862, 1.145887, 0, 0, 0, 1, 1,
0.7020838, -0.2705682, 1.509125, 0, 0, 0, 1, 1,
0.7026315, 0.1787628, 0.7315707, 0, 0, 0, 1, 1,
0.7050214, -0.5522905, 1.814376, 0, 0, 0, 1, 1,
0.7136685, -0.302561, 3.434586, 1, 1, 1, 1, 1,
0.715789, 0.7787082, -0.07562706, 1, 1, 1, 1, 1,
0.7178909, 1.18786, -0.6917595, 1, 1, 1, 1, 1,
0.7191374, 0.7924872, 0.5789723, 1, 1, 1, 1, 1,
0.71938, -0.6719806, 1.16598, 1, 1, 1, 1, 1,
0.7200581, -0.09821711, 2.398351, 1, 1, 1, 1, 1,
0.7205214, -0.589948, 1.727884, 1, 1, 1, 1, 1,
0.7210422, 0.7207407, 1.58703, 1, 1, 1, 1, 1,
0.722934, -0.4457643, 1.229328, 1, 1, 1, 1, 1,
0.7272531, 1.806102, -0.230545, 1, 1, 1, 1, 1,
0.7277057, 0.7495098, 0.6579401, 1, 1, 1, 1, 1,
0.7303664, 0.6396303, 0.2608943, 1, 1, 1, 1, 1,
0.7446046, 1.278107, 1.386365, 1, 1, 1, 1, 1,
0.7540421, -0.3434302, 1.975248, 1, 1, 1, 1, 1,
0.7572279, -0.2324293, 1.554719, 1, 1, 1, 1, 1,
0.7583366, -0.6771535, 3.122556, 0, 0, 1, 1, 1,
0.7629969, -0.3094138, 0.9485843, 1, 0, 0, 1, 1,
0.768348, -0.9408855, 1.438955, 1, 0, 0, 1, 1,
0.772756, -1.010166, 1.88015, 1, 0, 0, 1, 1,
0.7795114, 0.1568772, 1.400208, 1, 0, 0, 1, 1,
0.7906044, 0.5510581, 1.003192, 1, 0, 0, 1, 1,
0.7966076, -0.9003258, 1.317397, 0, 0, 0, 1, 1,
0.8038195, 1.857401, 0.1062791, 0, 0, 0, 1, 1,
0.8044852, 0.6761423, 0.9576831, 0, 0, 0, 1, 1,
0.8070454, 0.8658653, 1.106807, 0, 0, 0, 1, 1,
0.8111413, -0.6816663, 3.382436, 0, 0, 0, 1, 1,
0.8112664, 1.358114, 0.59197, 0, 0, 0, 1, 1,
0.8162813, 0.9482755, -0.1756027, 0, 0, 0, 1, 1,
0.8209507, 0.0005530121, 1.265614, 1, 1, 1, 1, 1,
0.821326, 0.5355342, 3.739388, 1, 1, 1, 1, 1,
0.8218554, 0.5928962, 1.511128, 1, 1, 1, 1, 1,
0.8405547, 1.061786, 1.518678, 1, 1, 1, 1, 1,
0.8415769, 1.435263, 2.089893, 1, 1, 1, 1, 1,
0.8430264, 0.2399687, 3.781912, 1, 1, 1, 1, 1,
0.8442848, 0.7311133, 0.02739317, 1, 1, 1, 1, 1,
0.8647825, -2.171325, 4.62431, 1, 1, 1, 1, 1,
0.8665014, 1.046436, -0.423137, 1, 1, 1, 1, 1,
0.8758754, 0.3114527, -0.2505231, 1, 1, 1, 1, 1,
0.8764021, -2.074085, 0.9894014, 1, 1, 1, 1, 1,
0.8789163, 1.185396, 0.4186716, 1, 1, 1, 1, 1,
0.8823664, -0.6485541, 1.956292, 1, 1, 1, 1, 1,
0.8855342, 0.61955, -0.4901904, 1, 1, 1, 1, 1,
0.8900673, 0.7286778, 1.809501, 1, 1, 1, 1, 1,
0.8922486, 0.9619083, 2.111023, 0, 0, 1, 1, 1,
0.8986666, 1.386321, 1.786946, 1, 0, 0, 1, 1,
0.9024795, -0.1114385, -0.01224432, 1, 0, 0, 1, 1,
0.9043193, 0.7720416, 1.314424, 1, 0, 0, 1, 1,
0.9051749, 1.268345, 0.7211239, 1, 0, 0, 1, 1,
0.9058707, -1.214807, 3.995177, 1, 0, 0, 1, 1,
0.9138633, 0.423166, 1.449222, 0, 0, 0, 1, 1,
0.9146401, 1.007538, 2.159805, 0, 0, 0, 1, 1,
0.9149172, -2.391913, 3.364108, 0, 0, 0, 1, 1,
0.918101, 1.039495, 1.607619, 0, 0, 0, 1, 1,
0.9269197, -1.049765, 1.811177, 0, 0, 0, 1, 1,
0.9353576, 0.2558057, 0.3823422, 0, 0, 0, 1, 1,
0.941937, 1.217646, -0.5784966, 0, 0, 0, 1, 1,
0.9479636, 1.250886, 0.7993876, 1, 1, 1, 1, 1,
0.9480653, -0.1871307, 3.682254, 1, 1, 1, 1, 1,
0.9587257, -0.7030906, 1.343931, 1, 1, 1, 1, 1,
0.9598125, -0.3532498, 0.6936433, 1, 1, 1, 1, 1,
0.9709009, 0.5901233, 0.5099151, 1, 1, 1, 1, 1,
0.9750327, -0.4935767, 1.506692, 1, 1, 1, 1, 1,
0.9920853, -1.503157, 3.613483, 1, 1, 1, 1, 1,
0.9934834, -0.9442784, 2.402278, 1, 1, 1, 1, 1,
0.9938825, 1.53981, 2.419479, 1, 1, 1, 1, 1,
0.9982733, -0.5482284, 1.736989, 1, 1, 1, 1, 1,
1.000636, -1.77116, 2.97789, 1, 1, 1, 1, 1,
1.003777, -1.306809, 1.651282, 1, 1, 1, 1, 1,
1.010578, -1.326376, 2.608746, 1, 1, 1, 1, 1,
1.028295, 1.091743, 0.8314729, 1, 1, 1, 1, 1,
1.03072, -0.3781059, 0.2982648, 1, 1, 1, 1, 1,
1.037488, -0.3730615, 0.7183918, 0, 0, 1, 1, 1,
1.040883, 0.3623042, 0.6510183, 1, 0, 0, 1, 1,
1.041603, -0.589529, 1.579658, 1, 0, 0, 1, 1,
1.049179, -1.51214, 3.389294, 1, 0, 0, 1, 1,
1.05551, -0.1546664, 2.428434, 1, 0, 0, 1, 1,
1.059021, -0.257494, 2.349476, 1, 0, 0, 1, 1,
1.059362, 1.384093, -0.7138572, 0, 0, 0, 1, 1,
1.060182, 0.7380928, 1.24662, 0, 0, 0, 1, 1,
1.066024, 0.2202627, 2.482707, 0, 0, 0, 1, 1,
1.070432, 0.7253832, 1.593495, 0, 0, 0, 1, 1,
1.078894, -0.2810889, 1.371287, 0, 0, 0, 1, 1,
1.081194, -2.732041, 2.68512, 0, 0, 0, 1, 1,
1.082999, -0.7358016, 1.727722, 0, 0, 0, 1, 1,
1.083916, 0.4738853, 2.197232, 1, 1, 1, 1, 1,
1.084277, 0.3607324, 0.9825714, 1, 1, 1, 1, 1,
1.088745, 0.4116274, 0.3182655, 1, 1, 1, 1, 1,
1.090832, 0.9144529, 0.986016, 1, 1, 1, 1, 1,
1.098488, 0.6079704, 0.9435899, 1, 1, 1, 1, 1,
1.101042, 0.7130115, 2.739369, 1, 1, 1, 1, 1,
1.104362, 0.4557292, 1.360709, 1, 1, 1, 1, 1,
1.105067, -1.239361, 2.795094, 1, 1, 1, 1, 1,
1.111937, 2.454291, 0.482692, 1, 1, 1, 1, 1,
1.118195, -0.6500295, 2.648824, 1, 1, 1, 1, 1,
1.128119, 1.142797, 0.6635753, 1, 1, 1, 1, 1,
1.132251, -0.6807199, 1.681096, 1, 1, 1, 1, 1,
1.135656, -0.401596, 2.515389, 1, 1, 1, 1, 1,
1.137632, -1.926704, 2.143646, 1, 1, 1, 1, 1,
1.138684, 0.2561533, 2.672049, 1, 1, 1, 1, 1,
1.142842, -0.2957367, 1.075916, 0, 0, 1, 1, 1,
1.147219, 0.702062, 0.8367004, 1, 0, 0, 1, 1,
1.151272, -0.8965989, 1.727494, 1, 0, 0, 1, 1,
1.155245, -0.08866545, 0.3233967, 1, 0, 0, 1, 1,
1.160112, 0.1213967, 1.327818, 1, 0, 0, 1, 1,
1.162004, 0.7488072, 0.8528345, 1, 0, 0, 1, 1,
1.164033, -0.8336555, 1.822507, 0, 0, 0, 1, 1,
1.176879, -1.191684, 1.301975, 0, 0, 0, 1, 1,
1.187293, -0.2427767, 1.132293, 0, 0, 0, 1, 1,
1.189624, 0.5902614, 1.682578, 0, 0, 0, 1, 1,
1.190317, 0.05453468, 0.3766647, 0, 0, 0, 1, 1,
1.19082, 0.6681987, 1.7752, 0, 0, 0, 1, 1,
1.19518, 0.6146876, 0.5068952, 0, 0, 0, 1, 1,
1.201775, -0.9833034, 2.066412, 1, 1, 1, 1, 1,
1.201909, -1.778585, 2.469555, 1, 1, 1, 1, 1,
1.207127, 2.307124, 0.1806742, 1, 1, 1, 1, 1,
1.210548, -0.6412503, 2.896444, 1, 1, 1, 1, 1,
1.218778, -0.1537659, 1.756044, 1, 1, 1, 1, 1,
1.220398, -1.365016, 3.578593, 1, 1, 1, 1, 1,
1.224959, 0.8940045, 1.766674, 1, 1, 1, 1, 1,
1.232879, 0.152722, 1.290065, 1, 1, 1, 1, 1,
1.238721, -0.9570255, 1.469509, 1, 1, 1, 1, 1,
1.245571, 0.2353581, 3.074631, 1, 1, 1, 1, 1,
1.245579, 0.6666335, 1.105691, 1, 1, 1, 1, 1,
1.259665, 1.102409, 0.1322259, 1, 1, 1, 1, 1,
1.259855, -0.2593689, 1.390669, 1, 1, 1, 1, 1,
1.261662, -0.7155474, 2.817912, 1, 1, 1, 1, 1,
1.263602, -0.2959072, 2.302696, 1, 1, 1, 1, 1,
1.266366, 0.1087824, 3.287948, 0, 0, 1, 1, 1,
1.275167, -0.1807863, 3.250102, 1, 0, 0, 1, 1,
1.280876, 0.5637041, 1.443671, 1, 0, 0, 1, 1,
1.281838, 0.1554837, 0.4958908, 1, 0, 0, 1, 1,
1.289667, -0.3977202, 4.075329, 1, 0, 0, 1, 1,
1.299105, 0.8619335, 0.7491924, 1, 0, 0, 1, 1,
1.303594, 1.225706, -0.4923492, 0, 0, 0, 1, 1,
1.303612, 0.5505397, 1.409375, 0, 0, 0, 1, 1,
1.310256, 0.749898, 2.123078, 0, 0, 0, 1, 1,
1.314214, -1.338051, 2.758579, 0, 0, 0, 1, 1,
1.323299, 0.4879595, 2.180233, 0, 0, 0, 1, 1,
1.328902, 1.158632, 0.5565574, 0, 0, 0, 1, 1,
1.333803, 1.496274, -0.750088, 0, 0, 0, 1, 1,
1.339786, 1.65778, -0.7815118, 1, 1, 1, 1, 1,
1.340695, 0.2558126, -0.08237717, 1, 1, 1, 1, 1,
1.351261, 1.296966, -0.3938276, 1, 1, 1, 1, 1,
1.362467, 0.3543078, 0.1174893, 1, 1, 1, 1, 1,
1.371068, -0.3782644, 3.085307, 1, 1, 1, 1, 1,
1.37693, 0.857668, 0.3764581, 1, 1, 1, 1, 1,
1.377061, 0.2988808, 1.767429, 1, 1, 1, 1, 1,
1.382253, 1.225432, 1.484672, 1, 1, 1, 1, 1,
1.384538, -0.6016292, 0.8412687, 1, 1, 1, 1, 1,
1.384685, -0.2135509, 1.593203, 1, 1, 1, 1, 1,
1.389197, 1.490772, 0.03982206, 1, 1, 1, 1, 1,
1.391027, 0.9459002, 0.09132691, 1, 1, 1, 1, 1,
1.399352, -1.411787, 2.471973, 1, 1, 1, 1, 1,
1.403858, 0.7539398, 0.9092082, 1, 1, 1, 1, 1,
1.404435, 0.9145283, 2.614167, 1, 1, 1, 1, 1,
1.413569, 0.09705132, 1.510576, 0, 0, 1, 1, 1,
1.418604, 0.3485304, -0.3882721, 1, 0, 0, 1, 1,
1.44871, 2.857808, -0.3445089, 1, 0, 0, 1, 1,
1.452864, 0.7924717, 1.333487, 1, 0, 0, 1, 1,
1.455802, 1.526515, -0.5805954, 1, 0, 0, 1, 1,
1.462387, 0.05338363, 1.355369, 1, 0, 0, 1, 1,
1.465362, 1.420821, 0.02836027, 0, 0, 0, 1, 1,
1.477166, -0.8451309, 3.283314, 0, 0, 0, 1, 1,
1.481306, -1.574813, 2.270022, 0, 0, 0, 1, 1,
1.481926, 0.8134064, 0.8857719, 0, 0, 0, 1, 1,
1.485803, -0.6388697, 2.843324, 0, 0, 0, 1, 1,
1.498797, 1.483906, 0.2078548, 0, 0, 0, 1, 1,
1.507827, 0.8529453, 0.4445122, 0, 0, 0, 1, 1,
1.51722, -0.7735916, 2.035429, 1, 1, 1, 1, 1,
1.520547, -0.9570946, 0.5285463, 1, 1, 1, 1, 1,
1.524338, -0.3251686, 1.980685, 1, 1, 1, 1, 1,
1.530829, 0.1982444, -0.1004377, 1, 1, 1, 1, 1,
1.534096, 0.8105765, 1.837649, 1, 1, 1, 1, 1,
1.543134, 0.6217205, 1.319338, 1, 1, 1, 1, 1,
1.54641, -0.743589, 3.425042, 1, 1, 1, 1, 1,
1.550998, 1.191612, 0.1359487, 1, 1, 1, 1, 1,
1.552613, -0.5824685, 1.992053, 1, 1, 1, 1, 1,
1.566557, -1.483127, 2.120502, 1, 1, 1, 1, 1,
1.582172, -0.2345915, 1.666232, 1, 1, 1, 1, 1,
1.587695, -0.2560621, 0.2778197, 1, 1, 1, 1, 1,
1.594487, 0.6058009, -1.245452, 1, 1, 1, 1, 1,
1.595991, -0.1367625, -0.7519218, 1, 1, 1, 1, 1,
1.615771, 0.3948869, 1.90941, 1, 1, 1, 1, 1,
1.624458, 0.1499158, 1.371853, 0, 0, 1, 1, 1,
1.649215, 0.2459348, 1.817319, 1, 0, 0, 1, 1,
1.653749, 2.305415, 0.6421849, 1, 0, 0, 1, 1,
1.690964, 2.011946, 0.3883811, 1, 0, 0, 1, 1,
1.704283, 1.027665, 0.465622, 1, 0, 0, 1, 1,
1.708649, -0.4649159, 1.809794, 1, 0, 0, 1, 1,
1.713246, -0.1297496, 1.246875, 0, 0, 0, 1, 1,
1.749324, -0.5247582, 1.533599, 0, 0, 0, 1, 1,
1.771563, -0.6072453, 2.718936, 0, 0, 0, 1, 1,
1.774339, 1.503121, -0.5874194, 0, 0, 0, 1, 1,
1.778521, 0.09864229, 0.3472094, 0, 0, 0, 1, 1,
1.78585, -0.352624, 1.457904, 0, 0, 0, 1, 1,
1.797645, 0.4015079, 1.309226, 0, 0, 0, 1, 1,
1.81354, -1.22052, 2.376887, 1, 1, 1, 1, 1,
1.833074, 0.3251711, 1.608697, 1, 1, 1, 1, 1,
1.833133, -0.05593938, 1.719366, 1, 1, 1, 1, 1,
1.833178, 0.6844123, 2.190546, 1, 1, 1, 1, 1,
1.860078, -0.05171108, 1.038752, 1, 1, 1, 1, 1,
1.910048, 1.966603, 0.457278, 1, 1, 1, 1, 1,
1.912624, -1.81814, 1.823776, 1, 1, 1, 1, 1,
1.923349, -0.5263836, 0.2169508, 1, 1, 1, 1, 1,
1.928026, 0.2018859, -0.5425314, 1, 1, 1, 1, 1,
1.951544, -0.2338009, 1.211926, 1, 1, 1, 1, 1,
1.954502, 0.7055585, 1.757781, 1, 1, 1, 1, 1,
1.999219, 0.5045857, -0.3257569, 1, 1, 1, 1, 1,
2.00024, -1.21708, 1.168656, 1, 1, 1, 1, 1,
2.016397, 0.3330676, 1.357456, 1, 1, 1, 1, 1,
2.032531, -0.5238536, 0.2737255, 1, 1, 1, 1, 1,
2.044495, 0.4892843, 0.6698803, 0, 0, 1, 1, 1,
2.119966, 1.178985, 0.3088073, 1, 0, 0, 1, 1,
2.124296, 1.159143, 2.420241, 1, 0, 0, 1, 1,
2.139207, 0.8972534, 0.7058344, 1, 0, 0, 1, 1,
2.140842, -0.4216492, 0.06137942, 1, 0, 0, 1, 1,
2.146065, 1.456606, 1.870446, 1, 0, 0, 1, 1,
2.156592, 1.394954, 0.3794997, 0, 0, 0, 1, 1,
2.196122, 0.1230876, 1.043393, 0, 0, 0, 1, 1,
2.211097, -0.3872629, 2.472155, 0, 0, 0, 1, 1,
2.248796, -0.7602528, 3.664976, 0, 0, 0, 1, 1,
2.252298, -0.2677889, 3.124302, 0, 0, 0, 1, 1,
2.256578, -1.35577, 2.990963, 0, 0, 0, 1, 1,
2.281465, -0.140365, 2.46734, 0, 0, 0, 1, 1,
2.320686, -0.3264736, 1.654242, 1, 1, 1, 1, 1,
2.386703, 0.9456186, 2.445576, 1, 1, 1, 1, 1,
2.685006, -1.408324, 3.485595, 1, 1, 1, 1, 1,
2.739904, 0.1947197, 1.506227, 1, 1, 1, 1, 1,
2.743891, 0.4373618, 0.8242136, 1, 1, 1, 1, 1,
2.826072, -0.7819815, 2.753211, 1, 1, 1, 1, 1,
2.957837, 1.462349, 1.10872, 1, 1, 1, 1, 1
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
var radius = 9.729065;
var distance = 34.17293;
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
mvMatrix.translate( 0.2891736, -0.1835006, 0.1778562 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.17293);
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
