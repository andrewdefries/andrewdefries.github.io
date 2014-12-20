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
-3.77301, -1.078272, -0.7462239, 1, 0, 0, 1,
-3.634305, 1.277065, -1.591801, 1, 0.007843138, 0, 1,
-3.074536, -0.448369, -2.503778, 1, 0.01176471, 0, 1,
-2.736547, -0.9245644, -1.598067, 1, 0.01960784, 0, 1,
-2.703493, 1.241745, 0.8335571, 1, 0.02352941, 0, 1,
-2.612071, -0.3069482, -2.116541, 1, 0.03137255, 0, 1,
-2.513457, 0.1540204, 0.6343077, 1, 0.03529412, 0, 1,
-2.503473, -1.074046, -1.620172, 1, 0.04313726, 0, 1,
-2.488318, 0.8308502, -2.532146, 1, 0.04705882, 0, 1,
-2.404862, -0.06393886, -3.180701, 1, 0.05490196, 0, 1,
-2.401443, -0.3667918, -3.013293, 1, 0.05882353, 0, 1,
-2.361929, 0.2664824, -3.057745, 1, 0.06666667, 0, 1,
-2.341449, 0.6698529, -0.4779645, 1, 0.07058824, 0, 1,
-2.218622, -1.154667, -0.9198264, 1, 0.07843138, 0, 1,
-2.211897, 0.3157849, -3.153111, 1, 0.08235294, 0, 1,
-2.162049, -1.589201, -2.790732, 1, 0.09019608, 0, 1,
-2.125276, -1.666272, -2.2382, 1, 0.09411765, 0, 1,
-2.123831, 0.4468245, -1.258193, 1, 0.1019608, 0, 1,
-2.10653, -1.842606, -1.929622, 1, 0.1098039, 0, 1,
-2.097247, -0.819024, -0.7490338, 1, 0.1137255, 0, 1,
-2.090425, 0.4821104, -0.6369432, 1, 0.1215686, 0, 1,
-2.087512, -0.06877392, -1.51931, 1, 0.1254902, 0, 1,
-2.086022, -1.551727, -0.4020022, 1, 0.1333333, 0, 1,
-2.003458, 1.116415, -1.039828, 1, 0.1372549, 0, 1,
-2.003299, 1.182607, -1.791099, 1, 0.145098, 0, 1,
-1.997343, -0.661386, -2.217351, 1, 0.1490196, 0, 1,
-1.979591, -1.832483, -1.188851, 1, 0.1568628, 0, 1,
-1.97344, 0.2493188, -1.394567, 1, 0.1607843, 0, 1,
-1.971643, -0.02379702, -1.268629, 1, 0.1686275, 0, 1,
-1.948643, 1.002931, -0.1738416, 1, 0.172549, 0, 1,
-1.928153, 0.7207183, -1.148203, 1, 0.1803922, 0, 1,
-1.916474, -1.834791, -1.613909, 1, 0.1843137, 0, 1,
-1.911498, 3.025337, -0.173665, 1, 0.1921569, 0, 1,
-1.91106, 2.317406, -0.2174602, 1, 0.1960784, 0, 1,
-1.891922, -0.7638137, -2.139189, 1, 0.2039216, 0, 1,
-1.882249, -0.5290127, -1.757447, 1, 0.2117647, 0, 1,
-1.875611, 0.09612094, -1.60541, 1, 0.2156863, 0, 1,
-1.862182, -0.4193726, -1.455123, 1, 0.2235294, 0, 1,
-1.838957, 1.674152, 0.1205063, 1, 0.227451, 0, 1,
-1.832392, 0.4009488, 0.2684606, 1, 0.2352941, 0, 1,
-1.826431, 0.06548788, -2.434276, 1, 0.2392157, 0, 1,
-1.807232, 1.01952, -1.002922, 1, 0.2470588, 0, 1,
-1.8023, 0.6386791, -3.36814, 1, 0.2509804, 0, 1,
-1.791924, 1.755531, -0.9986547, 1, 0.2588235, 0, 1,
-1.78921, 0.03377452, -2.020643, 1, 0.2627451, 0, 1,
-1.787599, -1.31134, -2.627784, 1, 0.2705882, 0, 1,
-1.760866, -1.582601, -0.680125, 1, 0.2745098, 0, 1,
-1.749394, -2.244858, -2.956035, 1, 0.282353, 0, 1,
-1.730412, -0.5750679, -2.682404, 1, 0.2862745, 0, 1,
-1.694916, 0.4411241, -0.1502309, 1, 0.2941177, 0, 1,
-1.688383, -0.1493304, -1.289252, 1, 0.3019608, 0, 1,
-1.657897, -1.56847, -2.23304, 1, 0.3058824, 0, 1,
-1.654345, -0.1775873, -1.861267, 1, 0.3137255, 0, 1,
-1.652805, 0.2084222, -1.116474, 1, 0.3176471, 0, 1,
-1.634269, -0.3576025, -0.850035, 1, 0.3254902, 0, 1,
-1.633813, 1.094395, -2.272645, 1, 0.3294118, 0, 1,
-1.633711, 1.405139, -0.4150763, 1, 0.3372549, 0, 1,
-1.633521, 0.9518169, -0.7996759, 1, 0.3411765, 0, 1,
-1.626626, 1.51501, 0.351812, 1, 0.3490196, 0, 1,
-1.611201, 0.5163956, -0.9184098, 1, 0.3529412, 0, 1,
-1.598838, 0.9644466, -1.475608, 1, 0.3607843, 0, 1,
-1.598398, -0.733233, -2.43225, 1, 0.3647059, 0, 1,
-1.59608, -0.831302, -2.638976, 1, 0.372549, 0, 1,
-1.594292, -0.1567966, -2.252492, 1, 0.3764706, 0, 1,
-1.576753, 1.197287, -1.412704, 1, 0.3843137, 0, 1,
-1.574536, 0.5296348, 0.2657999, 1, 0.3882353, 0, 1,
-1.569398, -1.800909, -0.8003724, 1, 0.3960784, 0, 1,
-1.528622, 0.5425015, -2.310332, 1, 0.4039216, 0, 1,
-1.514607, 1.371968, -0.7949628, 1, 0.4078431, 0, 1,
-1.512798, -0.4271694, -3.486031, 1, 0.4156863, 0, 1,
-1.50792, 0.994577, -2.935381, 1, 0.4196078, 0, 1,
-1.498499, 0.3322207, -0.3021975, 1, 0.427451, 0, 1,
-1.493449, -1.189803, -1.931974, 1, 0.4313726, 0, 1,
-1.484416, -0.3804359, -3.248974, 1, 0.4392157, 0, 1,
-1.483339, -0.6972058, -3.003318, 1, 0.4431373, 0, 1,
-1.476695, 0.08362072, -3.510972, 1, 0.4509804, 0, 1,
-1.470852, -0.6100959, -0.7585813, 1, 0.454902, 0, 1,
-1.458188, -1.227795, -1.5591, 1, 0.4627451, 0, 1,
-1.435467, 0.03118178, -1.820129, 1, 0.4666667, 0, 1,
-1.431225, -0.1929864, -0.9101641, 1, 0.4745098, 0, 1,
-1.430868, 1.154343, -0.6283208, 1, 0.4784314, 0, 1,
-1.427372, 0.3502764, -2.743543, 1, 0.4862745, 0, 1,
-1.422408, -0.08085938, -0.3393229, 1, 0.4901961, 0, 1,
-1.42118, -1.339683, -2.748643, 1, 0.4980392, 0, 1,
-1.419614, 1.286732, -1.933668, 1, 0.5058824, 0, 1,
-1.414722, 1.434062, 0.0867791, 1, 0.509804, 0, 1,
-1.406506, -0.6401685, -0.9929823, 1, 0.5176471, 0, 1,
-1.40473, 0.3187884, 1.461073, 1, 0.5215687, 0, 1,
-1.396064, -0.9134398, -1.138913, 1, 0.5294118, 0, 1,
-1.393544, 0.2281964, -1.318782, 1, 0.5333334, 0, 1,
-1.391632, -0.2449479, -1.025159, 1, 0.5411765, 0, 1,
-1.380347, -0.6979243, -2.638625, 1, 0.5450981, 0, 1,
-1.376783, 0.6284675, -0.9157249, 1, 0.5529412, 0, 1,
-1.37314, 0.0184819, 0.480232, 1, 0.5568628, 0, 1,
-1.364272, -0.5193841, -0.375645, 1, 0.5647059, 0, 1,
-1.362963, 1.223527, 0.8983945, 1, 0.5686275, 0, 1,
-1.35529, -0.7946889, -0.6891612, 1, 0.5764706, 0, 1,
-1.354977, 0.673085, -0.1174287, 1, 0.5803922, 0, 1,
-1.353175, -1.286487, -2.013521, 1, 0.5882353, 0, 1,
-1.32841, -0.300083, -1.78617, 1, 0.5921569, 0, 1,
-1.327074, -1.185948, -3.413107, 1, 0.6, 0, 1,
-1.324903, -0.2768394, -2.282478, 1, 0.6078432, 0, 1,
-1.324642, 0.9943942, -1.278937, 1, 0.6117647, 0, 1,
-1.299023, -0.9299127, -3.584865, 1, 0.6196079, 0, 1,
-1.283806, 0.9170051, -2.709315, 1, 0.6235294, 0, 1,
-1.28303, -0.2408831, -3.940455, 1, 0.6313726, 0, 1,
-1.278824, 1.228734, -1.730675, 1, 0.6352941, 0, 1,
-1.277139, -0.1009758, -1.002575, 1, 0.6431373, 0, 1,
-1.276791, 1.176877, -1.287159, 1, 0.6470588, 0, 1,
-1.274373, -2.445677, -2.53748, 1, 0.654902, 0, 1,
-1.272849, -0.5671983, -1.440129, 1, 0.6588235, 0, 1,
-1.266945, -1.568084, -2.449809, 1, 0.6666667, 0, 1,
-1.256373, 1.179185, -2.636978, 1, 0.6705883, 0, 1,
-1.251828, 0.1879113, -1.068493, 1, 0.6784314, 0, 1,
-1.251001, -1.846878, -4.380517, 1, 0.682353, 0, 1,
-1.248783, -0.0008814125, -3.023472, 1, 0.6901961, 0, 1,
-1.247722, -0.8048467, -2.58555, 1, 0.6941177, 0, 1,
-1.240345, 0.316548, -1.424114, 1, 0.7019608, 0, 1,
-1.235705, 0.3089294, -1.166898, 1, 0.7098039, 0, 1,
-1.235588, 2.306732, -1.856451, 1, 0.7137255, 0, 1,
-1.235197, 0.9599623, -1.021084, 1, 0.7215686, 0, 1,
-1.230309, 0.0514526, -1.74015, 1, 0.7254902, 0, 1,
-1.226165, 0.3888683, -1.10244, 1, 0.7333333, 0, 1,
-1.221388, -0.5605904, -2.365611, 1, 0.7372549, 0, 1,
-1.214734, -0.4605335, -2.621466, 1, 0.7450981, 0, 1,
-1.193337, -1.052191, -2.823083, 1, 0.7490196, 0, 1,
-1.190992, 0.04837558, -1.802432, 1, 0.7568628, 0, 1,
-1.1869, -0.9063778, -2.869765, 1, 0.7607843, 0, 1,
-1.185143, 1.074179, -2.523912, 1, 0.7686275, 0, 1,
-1.160465, -1.103225, -2.679682, 1, 0.772549, 0, 1,
-1.153578, -0.8545284, -2.703018, 1, 0.7803922, 0, 1,
-1.151134, -1.239893, -3.012534, 1, 0.7843137, 0, 1,
-1.150631, 0.7438568, -0.5074643, 1, 0.7921569, 0, 1,
-1.148931, 0.6578898, 1.179134, 1, 0.7960784, 0, 1,
-1.144254, 0.4256863, -3.177127, 1, 0.8039216, 0, 1,
-1.138167, 1.00709, -0.04211319, 1, 0.8117647, 0, 1,
-1.134346, 1.221547, 1.124696, 1, 0.8156863, 0, 1,
-1.122422, 0.4200048, -1.182883, 1, 0.8235294, 0, 1,
-1.122046, -1.357306, -2.396896, 1, 0.827451, 0, 1,
-1.112841, 2.486239, 0.8864009, 1, 0.8352941, 0, 1,
-1.102088, 0.9353436, -2.345588, 1, 0.8392157, 0, 1,
-1.100169, 0.05031649, -1.173625, 1, 0.8470588, 0, 1,
-1.099508, 1.033525, -0.5863769, 1, 0.8509804, 0, 1,
-1.098301, 0.1728569, -2.531028, 1, 0.8588235, 0, 1,
-1.090413, 1.146563, -0.09073041, 1, 0.8627451, 0, 1,
-1.086573, -0.09587094, -2.895522, 1, 0.8705882, 0, 1,
-1.084279, -1.266708, -3.100498, 1, 0.8745098, 0, 1,
-1.08346, 0.1944645, -0.8689591, 1, 0.8823529, 0, 1,
-1.076857, 0.1027545, -1.812007, 1, 0.8862745, 0, 1,
-1.076649, -2.994272, -3.096776, 1, 0.8941177, 0, 1,
-1.064444, -0.1560255, -1.811743, 1, 0.8980392, 0, 1,
-1.054122, 0.1389935, -2.32274, 1, 0.9058824, 0, 1,
-1.05141, 0.7439274, 0.7981353, 1, 0.9137255, 0, 1,
-1.050435, -0.2825166, -2.449044, 1, 0.9176471, 0, 1,
-1.047255, 0.1819801, -0.9848472, 1, 0.9254902, 0, 1,
-1.036202, 0.1654763, -1.999977, 1, 0.9294118, 0, 1,
-1.028015, 0.1878372, -0.8567482, 1, 0.9372549, 0, 1,
-1.00562, 0.2746535, -1.767108, 1, 0.9411765, 0, 1,
-1.003833, -0.9797851, -0.9052326, 1, 0.9490196, 0, 1,
-0.9997432, 0.07964547, -2.697585, 1, 0.9529412, 0, 1,
-0.999148, 0.06936877, -2.738668, 1, 0.9607843, 0, 1,
-0.9892119, 0.5312971, -0.2331716, 1, 0.9647059, 0, 1,
-0.9886013, -0.499288, -3.630641, 1, 0.972549, 0, 1,
-0.9883643, 0.5364174, -2.724251, 1, 0.9764706, 0, 1,
-0.97906, -0.5575894, -2.135215, 1, 0.9843137, 0, 1,
-0.9722301, -1.509815, -2.344677, 1, 0.9882353, 0, 1,
-0.9709492, 0.4601363, -1.034441, 1, 0.9960784, 0, 1,
-0.9685968, 1.259737, -1.14306, 0.9960784, 1, 0, 1,
-0.9670025, -1.726617, -1.993396, 0.9921569, 1, 0, 1,
-0.965203, -0.1018328, -3.297269, 0.9843137, 1, 0, 1,
-0.951863, 0.3060652, -1.158993, 0.9803922, 1, 0, 1,
-0.9438927, 0.277631, -1.641913, 0.972549, 1, 0, 1,
-0.9386311, -2.599411, -2.230278, 0.9686275, 1, 0, 1,
-0.9340857, -0.04030083, -1.747789, 0.9607843, 1, 0, 1,
-0.934082, -0.04072221, -0.9253582, 0.9568627, 1, 0, 1,
-0.928098, -0.4661551, -3.421581, 0.9490196, 1, 0, 1,
-0.9257668, -0.1021199, -2.051938, 0.945098, 1, 0, 1,
-0.9167039, 0.008153412, -2.08403, 0.9372549, 1, 0, 1,
-0.9151708, 0.9139825, -1.63033, 0.9333333, 1, 0, 1,
-0.908636, 0.1280855, -0.2284171, 0.9254902, 1, 0, 1,
-0.9010013, -0.3629031, -1.091078, 0.9215686, 1, 0, 1,
-0.8953759, -1.282826, -3.870255, 0.9137255, 1, 0, 1,
-0.8946365, -0.5687308, -0.3871547, 0.9098039, 1, 0, 1,
-0.8866382, 0.329766, -1.56513, 0.9019608, 1, 0, 1,
-0.8851328, 0.3436414, -1.090425, 0.8941177, 1, 0, 1,
-0.8834075, 0.5548921, -2.31094, 0.8901961, 1, 0, 1,
-0.8831871, 0.7693016, 0.05724433, 0.8823529, 1, 0, 1,
-0.8807732, -1.474043, -5.141563, 0.8784314, 1, 0, 1,
-0.8803361, -0.505155, -2.576815, 0.8705882, 1, 0, 1,
-0.8798894, 1.024647, -0.2421237, 0.8666667, 1, 0, 1,
-0.8769814, -1.144451, -4.462261, 0.8588235, 1, 0, 1,
-0.8742681, -0.6227389, -2.567976, 0.854902, 1, 0, 1,
-0.8708599, 0.5505742, -1.590222, 0.8470588, 1, 0, 1,
-0.8699359, -0.3052132, -2.66071, 0.8431373, 1, 0, 1,
-0.8632147, 0.138998, -1.415436, 0.8352941, 1, 0, 1,
-0.8616704, 1.367466, 0.006746612, 0.8313726, 1, 0, 1,
-0.860018, 0.924709, 1.395479, 0.8235294, 1, 0, 1,
-0.8593778, -0.5806555, -2.492493, 0.8196079, 1, 0, 1,
-0.8571246, -0.161157, -1.997844, 0.8117647, 1, 0, 1,
-0.8513306, -0.1694288, 0.02795715, 0.8078431, 1, 0, 1,
-0.8408819, -0.1712393, -1.677256, 0.8, 1, 0, 1,
-0.8408013, 0.0356291, -1.421168, 0.7921569, 1, 0, 1,
-0.835675, 0.000804339, -0.9992417, 0.7882353, 1, 0, 1,
-0.8353242, -0.7147565, -1.584631, 0.7803922, 1, 0, 1,
-0.8287341, -0.7398964, -2.090889, 0.7764706, 1, 0, 1,
-0.8276536, 1.113994, -0.3785354, 0.7686275, 1, 0, 1,
-0.8167435, -0.03139197, 0.6980643, 0.7647059, 1, 0, 1,
-0.8013031, -1.875653, -2.8895, 0.7568628, 1, 0, 1,
-0.8009032, -0.8815465, -2.050568, 0.7529412, 1, 0, 1,
-0.7940839, -1.30791, -4.516123, 0.7450981, 1, 0, 1,
-0.7929132, 1.026058, -1.034724, 0.7411765, 1, 0, 1,
-0.7927938, -0.5665084, -1.223759, 0.7333333, 1, 0, 1,
-0.7924336, -1.128062, -1.248094, 0.7294118, 1, 0, 1,
-0.7883309, -1.640251, -3.303298, 0.7215686, 1, 0, 1,
-0.784932, 0.2458712, -3.201439, 0.7176471, 1, 0, 1,
-0.7837521, 0.332769, -2.745256, 0.7098039, 1, 0, 1,
-0.7827221, -0.7961489, -1.797721, 0.7058824, 1, 0, 1,
-0.7742122, -1.368471, -2.6846, 0.6980392, 1, 0, 1,
-0.7692117, -2.095835, -2.325865, 0.6901961, 1, 0, 1,
-0.7642042, -0.8420359, -3.622994, 0.6862745, 1, 0, 1,
-0.7598532, -0.9323667, -2.560887, 0.6784314, 1, 0, 1,
-0.7569716, -1.128976, -1.99804, 0.6745098, 1, 0, 1,
-0.7565792, -0.8304567, -2.743196, 0.6666667, 1, 0, 1,
-0.7540249, 0.4775394, 1.419608, 0.6627451, 1, 0, 1,
-0.7516899, 1.160491, -0.9061877, 0.654902, 1, 0, 1,
-0.7508579, 0.8873165, -1.078715, 0.6509804, 1, 0, 1,
-0.7502965, -1.374593, -1.230226, 0.6431373, 1, 0, 1,
-0.7500907, -1.356273, -3.703557, 0.6392157, 1, 0, 1,
-0.7483259, 1.076441, -0.7200758, 0.6313726, 1, 0, 1,
-0.7479441, 0.6450539, -1.35322, 0.627451, 1, 0, 1,
-0.7422038, -0.08575087, -2.037671, 0.6196079, 1, 0, 1,
-0.741698, 1.394295, -1.810806, 0.6156863, 1, 0, 1,
-0.7372229, -1.57927, -2.25706, 0.6078432, 1, 0, 1,
-0.7334852, 0.536016, -0.2409029, 0.6039216, 1, 0, 1,
-0.7316526, 0.6103911, -1.446676, 0.5960785, 1, 0, 1,
-0.7240306, -0.9207708, -3.27276, 0.5882353, 1, 0, 1,
-0.7178097, 0.06296787, 0.286524, 0.5843138, 1, 0, 1,
-0.7107362, -2.310266, -2.116887, 0.5764706, 1, 0, 1,
-0.7094829, 0.632086, -0.8724273, 0.572549, 1, 0, 1,
-0.7030414, 0.7042383, -0.3745282, 0.5647059, 1, 0, 1,
-0.7009544, -1.393405, -3.984473, 0.5607843, 1, 0, 1,
-0.6818747, 1.312381, -1.381085, 0.5529412, 1, 0, 1,
-0.6816596, 0.3015342, -0.1200334, 0.5490196, 1, 0, 1,
-0.6774495, -1.51732, -4.315567, 0.5411765, 1, 0, 1,
-0.6750964, -0.9102743, -3.301441, 0.5372549, 1, 0, 1,
-0.6735245, 1.165785, -0.03233152, 0.5294118, 1, 0, 1,
-0.672232, -0.6719989, -0.8438104, 0.5254902, 1, 0, 1,
-0.6601667, -0.8496876, -1.220203, 0.5176471, 1, 0, 1,
-0.6578748, 0.0615267, -0.6064096, 0.5137255, 1, 0, 1,
-0.65505, 0.09151896, -1.075104, 0.5058824, 1, 0, 1,
-0.6549617, -1.199694, -3.083147, 0.5019608, 1, 0, 1,
-0.6542993, -0.2982896, -5.042259, 0.4941176, 1, 0, 1,
-0.6526073, 1.082208, -2.579668, 0.4862745, 1, 0, 1,
-0.6509147, -0.2151638, -1.166896, 0.4823529, 1, 0, 1,
-0.6464679, -0.6001689, -2.439501, 0.4745098, 1, 0, 1,
-0.6456525, -0.28161, -2.086831, 0.4705882, 1, 0, 1,
-0.6449516, -0.5753892, -3.14828, 0.4627451, 1, 0, 1,
-0.6442934, -0.7733587, -1.905561, 0.4588235, 1, 0, 1,
-0.6346423, -1.093406, -4.449999, 0.4509804, 1, 0, 1,
-0.6329893, 0.3678973, -0.4333481, 0.4470588, 1, 0, 1,
-0.6322956, -0.796306, -1.848749, 0.4392157, 1, 0, 1,
-0.6303132, -1.627587, -1.974626, 0.4352941, 1, 0, 1,
-0.6251618, 0.6763695, -0.8101455, 0.427451, 1, 0, 1,
-0.624446, -0.3972071, -2.538043, 0.4235294, 1, 0, 1,
-0.6214203, -1.070953, -1.390418, 0.4156863, 1, 0, 1,
-0.6205936, -1.383452, -0.8443403, 0.4117647, 1, 0, 1,
-0.6198994, -0.0217953, -1.921448, 0.4039216, 1, 0, 1,
-0.609207, 0.4468778, -0.5104944, 0.3960784, 1, 0, 1,
-0.6080863, 0.6563302, -0.9376709, 0.3921569, 1, 0, 1,
-0.6072801, 0.3833964, -0.5170911, 0.3843137, 1, 0, 1,
-0.6066071, 0.2163893, -1.629638, 0.3803922, 1, 0, 1,
-0.6045746, 0.1022963, -0.362146, 0.372549, 1, 0, 1,
-0.6007626, 0.2315082, -0.9698992, 0.3686275, 1, 0, 1,
-0.5952569, 2.837655, -1.167038, 0.3607843, 1, 0, 1,
-0.5921067, -0.7635996, -2.266654, 0.3568628, 1, 0, 1,
-0.5888674, 0.8023578, -0.1952404, 0.3490196, 1, 0, 1,
-0.5803811, -0.84544, -2.759498, 0.345098, 1, 0, 1,
-0.5782356, -0.8266873, -3.053673, 0.3372549, 1, 0, 1,
-0.5766081, 1.299412, 1.227948, 0.3333333, 1, 0, 1,
-0.5702179, 1.352053, 0.5679278, 0.3254902, 1, 0, 1,
-0.5691293, -0.7951955, -0.6191856, 0.3215686, 1, 0, 1,
-0.5667068, -1.30088, -0.6091046, 0.3137255, 1, 0, 1,
-0.5619043, 1.300163, -0.5202577, 0.3098039, 1, 0, 1,
-0.5568174, 0.4856004, -0.08854373, 0.3019608, 1, 0, 1,
-0.5543936, -0.5254233, -1.053704, 0.2941177, 1, 0, 1,
-0.5514541, 1.475731, -0.7381658, 0.2901961, 1, 0, 1,
-0.5510479, -0.2337878, -2.325954, 0.282353, 1, 0, 1,
-0.5509629, 0.4239649, -0.6630302, 0.2784314, 1, 0, 1,
-0.5497268, 2.810411, -1.026647, 0.2705882, 1, 0, 1,
-0.5444444, 0.7211078, -1.970457, 0.2666667, 1, 0, 1,
-0.5425384, -2.480209, -2.710751, 0.2588235, 1, 0, 1,
-0.5422215, 0.1730684, -0.7786483, 0.254902, 1, 0, 1,
-0.5404306, -0.612716, -3.088653, 0.2470588, 1, 0, 1,
-0.5400021, 0.8604159, -0.405627, 0.2431373, 1, 0, 1,
-0.5368827, -0.2024385, -1.86289, 0.2352941, 1, 0, 1,
-0.5261969, 0.06506099, -1.232309, 0.2313726, 1, 0, 1,
-0.5259978, 2.151759, -1.563972, 0.2235294, 1, 0, 1,
-0.5146063, -0.2357105, -0.799113, 0.2196078, 1, 0, 1,
-0.5142061, 0.7662583, -1.753778, 0.2117647, 1, 0, 1,
-0.5141815, -0.624588, -3.279364, 0.2078431, 1, 0, 1,
-0.5129436, 0.0740287, -0.2491748, 0.2, 1, 0, 1,
-0.5119812, 0.01140555, -2.062681, 0.1921569, 1, 0, 1,
-0.5087473, -0.08089928, -2.995752, 0.1882353, 1, 0, 1,
-0.5069435, -0.6117859, -2.723447, 0.1803922, 1, 0, 1,
-0.5020294, 2.007401, 1.055341, 0.1764706, 1, 0, 1,
-0.4916985, 0.2381429, -0.5215312, 0.1686275, 1, 0, 1,
-0.4896689, -0.3241831, -2.95775, 0.1647059, 1, 0, 1,
-0.4888176, 0.351976, -1.751119, 0.1568628, 1, 0, 1,
-0.487904, 0.1247057, -1.228621, 0.1529412, 1, 0, 1,
-0.4855709, -0.4909249, -3.147883, 0.145098, 1, 0, 1,
-0.4854122, 0.6430634, 0.3903912, 0.1411765, 1, 0, 1,
-0.4835942, 0.07761737, -3.115135, 0.1333333, 1, 0, 1,
-0.4829867, 0.3988332, -1.138743, 0.1294118, 1, 0, 1,
-0.4813329, -0.6708892, -1.217193, 0.1215686, 1, 0, 1,
-0.4793133, -0.7033087, -3.618899, 0.1176471, 1, 0, 1,
-0.4773625, -1.062272, -2.086246, 0.1098039, 1, 0, 1,
-0.4761903, 0.1926693, 0.529734, 0.1058824, 1, 0, 1,
-0.4752559, -0.03210083, -2.317424, 0.09803922, 1, 0, 1,
-0.4708068, -1.720403, -3.538625, 0.09019608, 1, 0, 1,
-0.4668836, -0.5958534, -1.665987, 0.08627451, 1, 0, 1,
-0.4648054, 0.8197349, -0.6444077, 0.07843138, 1, 0, 1,
-0.4623329, -0.2999733, -2.428848, 0.07450981, 1, 0, 1,
-0.4576872, 0.9514683, -0.4966222, 0.06666667, 1, 0, 1,
-0.4575834, -0.09903648, -3.030589, 0.0627451, 1, 0, 1,
-0.4573995, -0.3107764, 0.4696375, 0.05490196, 1, 0, 1,
-0.4548632, 1.932691, 1.21984, 0.05098039, 1, 0, 1,
-0.4541019, -0.4415045, -1.113705, 0.04313726, 1, 0, 1,
-0.4521324, -2.05389, -2.173622, 0.03921569, 1, 0, 1,
-0.4508799, -1.498141, -2.332237, 0.03137255, 1, 0, 1,
-0.4406967, 0.7228239, -0.5161837, 0.02745098, 1, 0, 1,
-0.4395693, -0.8683326, -2.117751, 0.01960784, 1, 0, 1,
-0.439093, -0.4807788, -1.980628, 0.01568628, 1, 0, 1,
-0.4370324, 0.1906829, -1.50625, 0.007843138, 1, 0, 1,
-0.4355488, -1.468539, -4.546358, 0.003921569, 1, 0, 1,
-0.4333498, 2.525804, -0.4510392, 0, 1, 0.003921569, 1,
-0.4318375, 0.2420605, -0.8816577, 0, 1, 0.01176471, 1,
-0.4286479, -0.6154574, -4.814013, 0, 1, 0.01568628, 1,
-0.4207857, -1.87258, -2.821257, 0, 1, 0.02352941, 1,
-0.4183267, 1.495474, 0.08808674, 0, 1, 0.02745098, 1,
-0.4182145, -0.1230577, -1.995, 0, 1, 0.03529412, 1,
-0.4166635, 0.2201482, 0.5076992, 0, 1, 0.03921569, 1,
-0.4124631, 0.2308893, -1.324099, 0, 1, 0.04705882, 1,
-0.4124115, -1.190857, -2.909163, 0, 1, 0.05098039, 1,
-0.4098168, 1.322539, 1.362873, 0, 1, 0.05882353, 1,
-0.4082954, 0.08639568, -1.240611, 0, 1, 0.0627451, 1,
-0.4037147, -0.0349521, -1.600578, 0, 1, 0.07058824, 1,
-0.3993998, -1.108696, -4.786656, 0, 1, 0.07450981, 1,
-0.3990498, 0.9434208, 0.4831384, 0, 1, 0.08235294, 1,
-0.3969217, -1.653292, -3.142796, 0, 1, 0.08627451, 1,
-0.3949327, -0.7421467, -3.76891, 0, 1, 0.09411765, 1,
-0.3893573, -0.09505399, -2.125487, 0, 1, 0.1019608, 1,
-0.3884809, -0.07191816, -3.014015, 0, 1, 0.1058824, 1,
-0.3883873, -0.08394556, -3.211538, 0, 1, 0.1137255, 1,
-0.3876596, -0.2532735, -2.078759, 0, 1, 0.1176471, 1,
-0.3831799, -0.2393017, -1.920734, 0, 1, 0.1254902, 1,
-0.376117, -0.08519239, -1.192745, 0, 1, 0.1294118, 1,
-0.374289, -0.8037989, -3.916797, 0, 1, 0.1372549, 1,
-0.373269, -0.1962308, -1.489088, 0, 1, 0.1411765, 1,
-0.3732278, 0.385176, -0.9112152, 0, 1, 0.1490196, 1,
-0.3683687, -0.07426204, -0.4484888, 0, 1, 0.1529412, 1,
-0.3634228, -0.175652, -1.540634, 0, 1, 0.1607843, 1,
-0.3628193, -0.3623066, -2.642502, 0, 1, 0.1647059, 1,
-0.3616333, -0.4526748, -3.75567, 0, 1, 0.172549, 1,
-0.3605949, -1.058169, -2.50699, 0, 1, 0.1764706, 1,
-0.3599574, -1.507295, -2.978631, 0, 1, 0.1843137, 1,
-0.3591645, -0.1015158, -2.358877, 0, 1, 0.1882353, 1,
-0.3561108, -0.01837596, -0.5255809, 0, 1, 0.1960784, 1,
-0.3539499, 0.1031964, -3.200488, 0, 1, 0.2039216, 1,
-0.3519104, -1.050817, -3.286603, 0, 1, 0.2078431, 1,
-0.350741, -0.1268975, -1.514824, 0, 1, 0.2156863, 1,
-0.3487014, -0.8594793, -2.166152, 0, 1, 0.2196078, 1,
-0.3440365, 1.146303, -0.3253382, 0, 1, 0.227451, 1,
-0.3421967, -0.4620915, -2.301864, 0, 1, 0.2313726, 1,
-0.3391535, -0.3082967, -1.581602, 0, 1, 0.2392157, 1,
-0.3384003, 2.474574, -1.717235, 0, 1, 0.2431373, 1,
-0.3317648, 0.654238, -0.4051856, 0, 1, 0.2509804, 1,
-0.328397, 1.29898, 0.3407064, 0, 1, 0.254902, 1,
-0.327177, -1.132838, -3.36692, 0, 1, 0.2627451, 1,
-0.3265565, -0.6411434, -0.7748883, 0, 1, 0.2666667, 1,
-0.3239091, 0.05170262, -0.9848994, 0, 1, 0.2745098, 1,
-0.3200307, 0.7269447, -0.2840504, 0, 1, 0.2784314, 1,
-0.3185133, -0.03408876, -1.184379, 0, 1, 0.2862745, 1,
-0.3176146, -0.3721263, -2.448368, 0, 1, 0.2901961, 1,
-0.3074312, -0.1285695, -2.859134, 0, 1, 0.2980392, 1,
-0.3067429, -0.17167, -2.308932, 0, 1, 0.3058824, 1,
-0.3066667, 0.113928, 0.496935, 0, 1, 0.3098039, 1,
-0.3046803, -1.199809, -3.133592, 0, 1, 0.3176471, 1,
-0.2951228, -0.5328222, -5.786559, 0, 1, 0.3215686, 1,
-0.2906822, 1.503982, 0.9941218, 0, 1, 0.3294118, 1,
-0.2898535, 0.7046854, -1.819551, 0, 1, 0.3333333, 1,
-0.2881383, 2.06475, 1.820315, 0, 1, 0.3411765, 1,
-0.2806906, 0.9284557, -0.9392518, 0, 1, 0.345098, 1,
-0.2715968, -0.1782559, -2.238415, 0, 1, 0.3529412, 1,
-0.2665807, 0.5100955, -0.08826858, 0, 1, 0.3568628, 1,
-0.2656862, 0.3569795, -1.609629, 0, 1, 0.3647059, 1,
-0.2571658, 1.013927, -1.36734, 0, 1, 0.3686275, 1,
-0.2567221, -0.07365698, -2.511808, 0, 1, 0.3764706, 1,
-0.2449369, 0.2213852, -1.757038, 0, 1, 0.3803922, 1,
-0.2414286, -0.2128501, -1.381506, 0, 1, 0.3882353, 1,
-0.2404873, -1.795885, -3.545319, 0, 1, 0.3921569, 1,
-0.2402453, 1.616927, 0.01133353, 0, 1, 0.4, 1,
-0.2323316, 0.7437288, -1.955597, 0, 1, 0.4078431, 1,
-0.2290867, 0.8428974, -1.888399, 0, 1, 0.4117647, 1,
-0.2278227, 0.7456717, -1.580839, 0, 1, 0.4196078, 1,
-0.2210263, -0.5447888, -3.734399, 0, 1, 0.4235294, 1,
-0.2189409, -1.550569, -3.956869, 0, 1, 0.4313726, 1,
-0.2183806, 1.015357, -1.758655, 0, 1, 0.4352941, 1,
-0.216739, 0.3463036, 0.8024227, 0, 1, 0.4431373, 1,
-0.216205, 0.2397346, 1.212871, 0, 1, 0.4470588, 1,
-0.2136073, 0.4927577, -0.08388489, 0, 1, 0.454902, 1,
-0.2080056, -0.368148, -3.596316, 0, 1, 0.4588235, 1,
-0.20755, -0.226097, -1.969437, 0, 1, 0.4666667, 1,
-0.2022527, 0.2330029, -1.432487, 0, 1, 0.4705882, 1,
-0.1994419, 1.370187, -0.3419478, 0, 1, 0.4784314, 1,
-0.198585, 1.215897, 0.8460552, 0, 1, 0.4823529, 1,
-0.19555, -1.370843, -2.564926, 0, 1, 0.4901961, 1,
-0.194688, -0.8626547, -4.109673, 0, 1, 0.4941176, 1,
-0.1881918, 1.805233, 0.6647662, 0, 1, 0.5019608, 1,
-0.1839187, -0.4482972, -4.042212, 0, 1, 0.509804, 1,
-0.1824347, 0.6912051, -1.197285, 0, 1, 0.5137255, 1,
-0.1814142, -1.826666, -2.254791, 0, 1, 0.5215687, 1,
-0.1794556, -0.5061321, -2.090689, 0, 1, 0.5254902, 1,
-0.1788263, 0.3285677, -2.859286, 0, 1, 0.5333334, 1,
-0.1781962, -0.4461929, -1.001846, 0, 1, 0.5372549, 1,
-0.1771868, -0.06989679, -2.243624, 0, 1, 0.5450981, 1,
-0.1646701, -0.3614423, -1.65085, 0, 1, 0.5490196, 1,
-0.1638733, 0.1434221, -0.9737852, 0, 1, 0.5568628, 1,
-0.1636192, 1.256498, -0.862106, 0, 1, 0.5607843, 1,
-0.1621414, 0.3967052, -1.019046, 0, 1, 0.5686275, 1,
-0.1602293, 1.310474, -0.2908225, 0, 1, 0.572549, 1,
-0.1597668, 0.008495443, -1.736388, 0, 1, 0.5803922, 1,
-0.1578159, -0.6346592, -3.452875, 0, 1, 0.5843138, 1,
-0.1566741, -0.2019736, -1.299053, 0, 1, 0.5921569, 1,
-0.1566081, 0.336419, -0.1206766, 0, 1, 0.5960785, 1,
-0.1538467, 0.4589416, -0.6451274, 0, 1, 0.6039216, 1,
-0.1493683, -0.3020961, -3.645706, 0, 1, 0.6117647, 1,
-0.1480485, 1.211378, 0.689098, 0, 1, 0.6156863, 1,
-0.1454223, 0.949172, 0.3824739, 0, 1, 0.6235294, 1,
-0.145111, -1.067208, -4.070685, 0, 1, 0.627451, 1,
-0.1443321, -0.47126, -3.425572, 0, 1, 0.6352941, 1,
-0.142658, 0.4017829, 1.193743, 0, 1, 0.6392157, 1,
-0.1414804, 0.02282442, -1.458259, 0, 1, 0.6470588, 1,
-0.1395869, 0.4641323, -1.014774, 0, 1, 0.6509804, 1,
-0.1364831, -0.2496694, -3.15784, 0, 1, 0.6588235, 1,
-0.1350014, -1.192892, -2.276858, 0, 1, 0.6627451, 1,
-0.1347501, 0.283737, -0.3943441, 0, 1, 0.6705883, 1,
-0.1298576, -0.06935523, -1.818377, 0, 1, 0.6745098, 1,
-0.1294763, -0.6934685, -3.123481, 0, 1, 0.682353, 1,
-0.1278917, 1.241991, 0.3533804, 0, 1, 0.6862745, 1,
-0.1275552, 0.6203423, 0.8036139, 0, 1, 0.6941177, 1,
-0.1263913, -0.3475399, -2.539591, 0, 1, 0.7019608, 1,
-0.1251037, -2.06766, -3.456578, 0, 1, 0.7058824, 1,
-0.1230457, -1.786395, -4.056091, 0, 1, 0.7137255, 1,
-0.1224913, 0.3190145, 0.2557471, 0, 1, 0.7176471, 1,
-0.1162221, -0.4904147, -2.839965, 0, 1, 0.7254902, 1,
-0.115189, -0.9150942, -5.232914, 0, 1, 0.7294118, 1,
-0.1143586, 0.1533461, 0.5092349, 0, 1, 0.7372549, 1,
-0.1106623, -0.006237836, 0.742336, 0, 1, 0.7411765, 1,
-0.1092488, -1.089538, -3.4824, 0, 1, 0.7490196, 1,
-0.1047011, -0.8652593, -4.252777, 0, 1, 0.7529412, 1,
-0.1005034, -1.528337, -3.967105, 0, 1, 0.7607843, 1,
-0.09920543, -1.475151, -4.789857, 0, 1, 0.7647059, 1,
-0.09827364, -1.055823, -2.917001, 0, 1, 0.772549, 1,
-0.09751255, 1.068595, -1.650313, 0, 1, 0.7764706, 1,
-0.09305398, 0.8109197, -1.619541, 0, 1, 0.7843137, 1,
-0.08859169, 1.830727, -0.8490025, 0, 1, 0.7882353, 1,
-0.07471035, -0.3010696, -3.958379, 0, 1, 0.7960784, 1,
-0.07401066, 1.51582, -2.490359, 0, 1, 0.8039216, 1,
-0.07141899, -1.414734, -3.161354, 0, 1, 0.8078431, 1,
-0.07119516, 1.318813, -1.341773, 0, 1, 0.8156863, 1,
-0.06892835, -1.894577, -1.647309, 0, 1, 0.8196079, 1,
-0.06575709, -0.8132173, -5.04448, 0, 1, 0.827451, 1,
-0.06485473, 0.657784, -1.434684, 0, 1, 0.8313726, 1,
-0.06302005, 2.983501, -1.490979, 0, 1, 0.8392157, 1,
-0.05166857, 0.6274213, 0.2353107, 0, 1, 0.8431373, 1,
-0.05088838, 0.1162351, 0.6402907, 0, 1, 0.8509804, 1,
-0.05088137, -0.3663245, -2.805074, 0, 1, 0.854902, 1,
-0.04903148, -0.7222746, -5.102835, 0, 1, 0.8627451, 1,
-0.04857054, -0.2634864, -4.214011, 0, 1, 0.8666667, 1,
-0.04843532, 0.2058727, -0.6989921, 0, 1, 0.8745098, 1,
-0.04803589, -0.009790538, -0.541752, 0, 1, 0.8784314, 1,
-0.04534929, 0.890506, -0.003783765, 0, 1, 0.8862745, 1,
-0.04003774, -0.6935021, -3.738237, 0, 1, 0.8901961, 1,
-0.03628599, -0.9500036, -1.981669, 0, 1, 0.8980392, 1,
-0.03237728, 0.9655225, -0.5617062, 0, 1, 0.9058824, 1,
-0.03169035, 0.3616775, 0.2583269, 0, 1, 0.9098039, 1,
-0.03166622, -0.7622446, -3.862252, 0, 1, 0.9176471, 1,
-0.0315276, -0.09425797, -3.231704, 0, 1, 0.9215686, 1,
-0.0297339, -1.132316, -3.019667, 0, 1, 0.9294118, 1,
-0.02770117, 1.494855, 0.9100259, 0, 1, 0.9333333, 1,
-0.0243024, -0.3915941, -3.376864, 0, 1, 0.9411765, 1,
-0.02408218, 0.3880576, 0.4655666, 0, 1, 0.945098, 1,
-0.02293032, -1.320663, -4.109314, 0, 1, 0.9529412, 1,
-0.02204075, -0.8537778, -2.463593, 0, 1, 0.9568627, 1,
-0.02112659, -1.066979, -3.796568, 0, 1, 0.9647059, 1,
-0.01496596, 0.4657578, -0.2439186, 0, 1, 0.9686275, 1,
-0.007847427, -0.08492997, -4.353625, 0, 1, 0.9764706, 1,
-0.007847271, -0.7143142, -1.602272, 0, 1, 0.9803922, 1,
-0.007595635, 2.870173, -1.780901, 0, 1, 0.9882353, 1,
-0.006103164, 1.369444, -0.7605811, 0, 1, 0.9921569, 1,
-0.001362191, 0.003106439, 1.382238, 0, 1, 1, 1,
0.001028705, -1.331308, 3.678741, 0, 0.9921569, 1, 1,
0.003025463, 0.04240973, 0.8401001, 0, 0.9882353, 1, 1,
0.004688928, 0.01141685, 1.146125, 0, 0.9803922, 1, 1,
0.005193682, -0.106097, 0.8290362, 0, 0.9764706, 1, 1,
0.005526051, -0.4835099, 3.65621, 0, 0.9686275, 1, 1,
0.005755977, 1.69969, 0.8674254, 0, 0.9647059, 1, 1,
0.006937769, -0.5347056, 1.23722, 0, 0.9568627, 1, 1,
0.008088127, 1.969643, -0.2443884, 0, 0.9529412, 1, 1,
0.008796767, -0.4156213, 3.445472, 0, 0.945098, 1, 1,
0.01274431, 0.2302742, 0.2035774, 0, 0.9411765, 1, 1,
0.01569646, -0.1543735, 3.229002, 0, 0.9333333, 1, 1,
0.01609007, 0.07337378, -0.9982108, 0, 0.9294118, 1, 1,
0.01617632, 1.602374, -0.6578047, 0, 0.9215686, 1, 1,
0.02211761, 1.988443, -0.1463983, 0, 0.9176471, 1, 1,
0.02366378, 0.1461253, -2.888004, 0, 0.9098039, 1, 1,
0.02801908, -0.3490282, 4.792239, 0, 0.9058824, 1, 1,
0.02860337, -1.299854, 5.332257, 0, 0.8980392, 1, 1,
0.02941845, 0.4274355, 1.432357, 0, 0.8901961, 1, 1,
0.03597874, -0.5956094, 3.019279, 0, 0.8862745, 1, 1,
0.04308476, -0.2508555, 2.599922, 0, 0.8784314, 1, 1,
0.04698943, -0.6232474, 3.471444, 0, 0.8745098, 1, 1,
0.04743533, 0.8355857, -1.232937, 0, 0.8666667, 1, 1,
0.04956108, 0.7097579, 0.4932493, 0, 0.8627451, 1, 1,
0.051023, -0.514392, 1.792644, 0, 0.854902, 1, 1,
0.05210897, 0.3251685, 0.3674096, 0, 0.8509804, 1, 1,
0.05336874, -1.091967, 3.382735, 0, 0.8431373, 1, 1,
0.05487398, -1.084676, 2.494938, 0, 0.8392157, 1, 1,
0.06149184, 0.8359503, 0.9974362, 0, 0.8313726, 1, 1,
0.06222931, -0.4668856, 4.300097, 0, 0.827451, 1, 1,
0.06282754, -0.2016583, 3.726853, 0, 0.8196079, 1, 1,
0.06671197, -1.245826, 3.843446, 0, 0.8156863, 1, 1,
0.06769627, -0.6409236, 4.057714, 0, 0.8078431, 1, 1,
0.07070425, -1.627291, 3.095432, 0, 0.8039216, 1, 1,
0.07336701, -2.039567, 3.450973, 0, 0.7960784, 1, 1,
0.07427214, -0.9518604, 4.079123, 0, 0.7882353, 1, 1,
0.07904871, -1.4712, 1.795595, 0, 0.7843137, 1, 1,
0.08058935, -0.5846444, 2.660843, 0, 0.7764706, 1, 1,
0.08148694, -0.09802309, 3.499116, 0, 0.772549, 1, 1,
0.08245722, -1.986868, 1.973123, 0, 0.7647059, 1, 1,
0.08571805, -0.6849301, 3.102284, 0, 0.7607843, 1, 1,
0.09144326, 1.87933, -0.3599872, 0, 0.7529412, 1, 1,
0.09611873, -0.1340394, 2.067633, 0, 0.7490196, 1, 1,
0.09773669, -2.004719, 2.068728, 0, 0.7411765, 1, 1,
0.09957967, -0.2388446, 3.475678, 0, 0.7372549, 1, 1,
0.09996469, 1.564708, -0.3143837, 0, 0.7294118, 1, 1,
0.1064651, -0.7915938, 2.063642, 0, 0.7254902, 1, 1,
0.1068413, 2.233818, -1.208971, 0, 0.7176471, 1, 1,
0.110461, 1.924092, -0.164484, 0, 0.7137255, 1, 1,
0.1160369, -0.2469144, 4.301512, 0, 0.7058824, 1, 1,
0.1164406, 1.207783, 2.136978, 0, 0.6980392, 1, 1,
0.1197153, 1.356917, 0.4313424, 0, 0.6941177, 1, 1,
0.1206456, -0.9168154, 2.224632, 0, 0.6862745, 1, 1,
0.1213, -0.1725577, 2.257416, 0, 0.682353, 1, 1,
0.122689, 0.6996679, 0.1979428, 0, 0.6745098, 1, 1,
0.1268963, 1.016906, 1.770026, 0, 0.6705883, 1, 1,
0.1283528, -1.938492, 2.390566, 0, 0.6627451, 1, 1,
0.1337175, -0.4710214, 3.218001, 0, 0.6588235, 1, 1,
0.1341854, 1.169083, -2.992542, 0, 0.6509804, 1, 1,
0.1347861, -0.49055, 2.19352, 0, 0.6470588, 1, 1,
0.1349869, -0.1773783, 1.195448, 0, 0.6392157, 1, 1,
0.1354327, -1.706476, 3.572626, 0, 0.6352941, 1, 1,
0.1396124, -0.9044399, 1.072541, 0, 0.627451, 1, 1,
0.1408124, 0.3541056, -0.9388706, 0, 0.6235294, 1, 1,
0.1455241, 1.60067, 1.611625, 0, 0.6156863, 1, 1,
0.1502415, -0.06491151, 1.633443, 0, 0.6117647, 1, 1,
0.1514434, 1.151407, -0.8685741, 0, 0.6039216, 1, 1,
0.1526305, -1.047406, 4.257254, 0, 0.5960785, 1, 1,
0.1537659, 1.357036, 0.584976, 0, 0.5921569, 1, 1,
0.1541121, -0.7587512, 3.613353, 0, 0.5843138, 1, 1,
0.1542164, -0.74641, 4.042064, 0, 0.5803922, 1, 1,
0.1557037, -0.9762843, 1.895, 0, 0.572549, 1, 1,
0.1622226, 0.3491698, 2.64036, 0, 0.5686275, 1, 1,
0.1650349, 1.341453, -0.4844386, 0, 0.5607843, 1, 1,
0.16736, -0.9667315, 2.439295, 0, 0.5568628, 1, 1,
0.1715605, 1.100649, -0.6428972, 0, 0.5490196, 1, 1,
0.1749392, -1.035907, 2.455374, 0, 0.5450981, 1, 1,
0.1756044, 0.495776, 2.422936, 0, 0.5372549, 1, 1,
0.1756652, 0.7601297, 0.4819884, 0, 0.5333334, 1, 1,
0.1786111, -0.1655523, 1.786018, 0, 0.5254902, 1, 1,
0.1806338, 0.03188382, 0.2907126, 0, 0.5215687, 1, 1,
0.1813548, 0.390479, 0.9555069, 0, 0.5137255, 1, 1,
0.1845779, -0.38804, 1.930115, 0, 0.509804, 1, 1,
0.1910728, 1.392373, 0.4780465, 0, 0.5019608, 1, 1,
0.1912053, -0.04569498, 1.157645, 0, 0.4941176, 1, 1,
0.1937358, 1.481277, -0.5270448, 0, 0.4901961, 1, 1,
0.20011, 0.7382921, 0.948712, 0, 0.4823529, 1, 1,
0.2017847, -0.661678, 2.499131, 0, 0.4784314, 1, 1,
0.2031321, 1.446623, -0.4094194, 0, 0.4705882, 1, 1,
0.2056275, -0.6544763, 3.018434, 0, 0.4666667, 1, 1,
0.2095999, 0.9218773, 1.050525, 0, 0.4588235, 1, 1,
0.2096788, 0.8681825, -1.548699, 0, 0.454902, 1, 1,
0.2174384, -0.7868599, 3.276023, 0, 0.4470588, 1, 1,
0.2245511, 0.6953019, -0.2783832, 0, 0.4431373, 1, 1,
0.2288414, 1.772155, 1.572779, 0, 0.4352941, 1, 1,
0.2297105, 1.598174, -0.6575167, 0, 0.4313726, 1, 1,
0.2307797, -0.549123, 1.535781, 0, 0.4235294, 1, 1,
0.2325604, 0.1620287, -0.2030571, 0, 0.4196078, 1, 1,
0.2328124, -1.545078, 3.726092, 0, 0.4117647, 1, 1,
0.2350826, -0.1435243, 1.358439, 0, 0.4078431, 1, 1,
0.2404446, 0.38769, -1.173032, 0, 0.4, 1, 1,
0.2434415, 0.30393, 0.9310676, 0, 0.3921569, 1, 1,
0.2445611, 0.2403162, 0.07328656, 0, 0.3882353, 1, 1,
0.2453505, -0.06651183, 1.365335, 0, 0.3803922, 1, 1,
0.2503916, -1.331475, 2.530337, 0, 0.3764706, 1, 1,
0.2509555, -0.4055025, 1.920709, 0, 0.3686275, 1, 1,
0.2535859, -1.310297, 3.094121, 0, 0.3647059, 1, 1,
0.254055, -0.424243, 3.212666, 0, 0.3568628, 1, 1,
0.2584061, 0.1273808, 0.6448355, 0, 0.3529412, 1, 1,
0.2610366, -0.6038225, 2.226669, 0, 0.345098, 1, 1,
0.2627386, -1.759506, 2.749905, 0, 0.3411765, 1, 1,
0.2644105, 1.271452, -0.09143362, 0, 0.3333333, 1, 1,
0.2670262, 0.4167142, 0.381416, 0, 0.3294118, 1, 1,
0.272951, -0.1329454, 1.512696, 0, 0.3215686, 1, 1,
0.2743997, -0.1474572, 2.748212, 0, 0.3176471, 1, 1,
0.2747516, 0.3361985, 0.5557952, 0, 0.3098039, 1, 1,
0.2777024, 1.330116, 1.228192, 0, 0.3058824, 1, 1,
0.2821198, -0.7159016, 3.499644, 0, 0.2980392, 1, 1,
0.2841485, 0.8068929, -0.9250671, 0, 0.2901961, 1, 1,
0.2866659, -0.551235, 3.006885, 0, 0.2862745, 1, 1,
0.2881175, 0.8540788, -0.199895, 0, 0.2784314, 1, 1,
0.2941614, -1.492176, 2.152277, 0, 0.2745098, 1, 1,
0.2967208, -1.035379, 4.327825, 0, 0.2666667, 1, 1,
0.2975863, -1.737371, 1.769142, 0, 0.2627451, 1, 1,
0.2985984, 1.226324, -0.9919412, 0, 0.254902, 1, 1,
0.305178, 2.672153, 0.468019, 0, 0.2509804, 1, 1,
0.3107632, 1.061447, 0.04645044, 0, 0.2431373, 1, 1,
0.3139782, -0.1734561, 2.023053, 0, 0.2392157, 1, 1,
0.3153213, -1.873719, 1.757692, 0, 0.2313726, 1, 1,
0.3199845, 0.5333169, 0.4265732, 0, 0.227451, 1, 1,
0.3217852, -0.5700906, 1.851682, 0, 0.2196078, 1, 1,
0.3238595, -0.01631377, 2.176299, 0, 0.2156863, 1, 1,
0.3251066, -0.06727113, 4.062806, 0, 0.2078431, 1, 1,
0.3262778, 1.658738, -0.3455426, 0, 0.2039216, 1, 1,
0.3268512, -1.48431, 3.737961, 0, 0.1960784, 1, 1,
0.3335712, -1.028298, 4.137025, 0, 0.1882353, 1, 1,
0.3407144, -0.1240672, 0.4068622, 0, 0.1843137, 1, 1,
0.3423695, 1.671078, -0.6381656, 0, 0.1764706, 1, 1,
0.3468933, 0.03678929, 2.494625, 0, 0.172549, 1, 1,
0.3485407, -0.3162271, 1.177076, 0, 0.1647059, 1, 1,
0.348654, -1.628397, 2.431897, 0, 0.1607843, 1, 1,
0.3535458, -3.105544, 2.701678, 0, 0.1529412, 1, 1,
0.3543431, 0.9149264, 2.569746, 0, 0.1490196, 1, 1,
0.3549036, -1.925251, 0.4697824, 0, 0.1411765, 1, 1,
0.356411, 0.5986576, 0.1255116, 0, 0.1372549, 1, 1,
0.3613264, 0.41957, -0.9626271, 0, 0.1294118, 1, 1,
0.3632745, 0.182046, -0.7755474, 0, 0.1254902, 1, 1,
0.3637694, 1.257554, 0.6479268, 0, 0.1176471, 1, 1,
0.3685281, 1.675813, 2.264389, 0, 0.1137255, 1, 1,
0.381036, -2.14538, 2.887919, 0, 0.1058824, 1, 1,
0.3851585, -2.364904, 3.708696, 0, 0.09803922, 1, 1,
0.3867483, -1.373496, 4.942341, 0, 0.09411765, 1, 1,
0.3872706, -1.575956, 2.972438, 0, 0.08627451, 1, 1,
0.392479, -1.310054, 4.12545, 0, 0.08235294, 1, 1,
0.4003094, -0.4258699, 3.38987, 0, 0.07450981, 1, 1,
0.4009278, 0.327014, 0.7370369, 0, 0.07058824, 1, 1,
0.407316, -1.770642, 3.468832, 0, 0.0627451, 1, 1,
0.4086507, -1.774498, 4.248792, 0, 0.05882353, 1, 1,
0.4115918, -0.1447382, 1.672428, 0, 0.05098039, 1, 1,
0.4124382, 1.670009, 0.668928, 0, 0.04705882, 1, 1,
0.4128991, 0.6128412, 0.4225597, 0, 0.03921569, 1, 1,
0.413055, -1.034181, 1.04435, 0, 0.03529412, 1, 1,
0.4143781, 0.4473333, 1.419562, 0, 0.02745098, 1, 1,
0.4173627, -1.348353, 4.69252, 0, 0.02352941, 1, 1,
0.4191645, -0.4664682, 2.563725, 0, 0.01568628, 1, 1,
0.4208711, -1.876194, 2.969056, 0, 0.01176471, 1, 1,
0.4208758, 0.5000333, -0.1579794, 0, 0.003921569, 1, 1,
0.4225942, 0.7646393, 2.537822, 0.003921569, 0, 1, 1,
0.4228418, -0.9498807, 1.789902, 0.007843138, 0, 1, 1,
0.4255092, 1.56518, -0.3426497, 0.01568628, 0, 1, 1,
0.4259534, 0.3263971, 0.5074328, 0.01960784, 0, 1, 1,
0.4288088, 0.8374076, 2.32173, 0.02745098, 0, 1, 1,
0.4297292, -0.3197291, 1.200068, 0.03137255, 0, 1, 1,
0.430684, 0.1688536, 0.9014715, 0.03921569, 0, 1, 1,
0.4353571, 0.04678462, 1.893909, 0.04313726, 0, 1, 1,
0.4387877, 0.4218947, 0.4170179, 0.05098039, 0, 1, 1,
0.4404748, 0.6503652, 0.541873, 0.05490196, 0, 1, 1,
0.4407797, 0.3906434, 2.332166, 0.0627451, 0, 1, 1,
0.4410927, -0.1218908, 2.099589, 0.06666667, 0, 1, 1,
0.4410971, -0.1882325, 1.33614, 0.07450981, 0, 1, 1,
0.4458929, 0.2658902, 0.6350566, 0.07843138, 0, 1, 1,
0.4473625, -1.357361, 4.042233, 0.08627451, 0, 1, 1,
0.448565, 2.418681, -0.201513, 0.09019608, 0, 1, 1,
0.4487963, -0.09303402, 1.402755, 0.09803922, 0, 1, 1,
0.4539032, 0.2015298, 1.908137, 0.1058824, 0, 1, 1,
0.4539315, 0.3983349, -0.3820213, 0.1098039, 0, 1, 1,
0.4544691, -1.065444, 2.549195, 0.1176471, 0, 1, 1,
0.4553308, -0.3036126, 1.318216, 0.1215686, 0, 1, 1,
0.4571731, 1.12441, -0.3273461, 0.1294118, 0, 1, 1,
0.4588574, 0.00915706, 1.658521, 0.1333333, 0, 1, 1,
0.4597432, 0.3927776, 1.625172, 0.1411765, 0, 1, 1,
0.4613242, 1.401744, 0.9211738, 0.145098, 0, 1, 1,
0.4654863, 0.04798033, -0.3233348, 0.1529412, 0, 1, 1,
0.4682071, -1.523191, 1.119902, 0.1568628, 0, 1, 1,
0.4725113, -1.466092, 2.776115, 0.1647059, 0, 1, 1,
0.4775733, -1.277608, 1.225259, 0.1686275, 0, 1, 1,
0.4854257, -0.1967234, 2.76897, 0.1764706, 0, 1, 1,
0.4929569, -0.1826486, 1.707401, 0.1803922, 0, 1, 1,
0.4944373, -1.589169, 3.191573, 0.1882353, 0, 1, 1,
0.4977411, -0.8824266, 2.714754, 0.1921569, 0, 1, 1,
0.4999131, -0.22682, 1.537589, 0.2, 0, 1, 1,
0.5020744, 0.4326568, 2.503687, 0.2078431, 0, 1, 1,
0.5055024, 0.6326175, -0.3764952, 0.2117647, 0, 1, 1,
0.5065255, -0.09909835, 1.499196, 0.2196078, 0, 1, 1,
0.5082099, 1.836798, 0.6014757, 0.2235294, 0, 1, 1,
0.5122712, 0.01561324, 1.189555, 0.2313726, 0, 1, 1,
0.5141562, -1.564273, 3.6697, 0.2352941, 0, 1, 1,
0.5163949, -0.8524369, 2.430083, 0.2431373, 0, 1, 1,
0.5196392, 0.2002103, 1.781226, 0.2470588, 0, 1, 1,
0.5207779, 0.7361384, 1.159487, 0.254902, 0, 1, 1,
0.528663, -0.930019, 2.615022, 0.2588235, 0, 1, 1,
0.529068, 1.375411, -1.772806, 0.2666667, 0, 1, 1,
0.5293831, 0.6740854, 0.3644997, 0.2705882, 0, 1, 1,
0.5349215, 0.1536448, 0.6470769, 0.2784314, 0, 1, 1,
0.535165, 1.179257, 0.8201129, 0.282353, 0, 1, 1,
0.5366524, -0.5974979, 2.503467, 0.2901961, 0, 1, 1,
0.538826, 0.05543778, 0.3659437, 0.2941177, 0, 1, 1,
0.5401874, -0.6817632, 2.852992, 0.3019608, 0, 1, 1,
0.5408452, 0.5385641, 0.6173114, 0.3098039, 0, 1, 1,
0.5413547, -0.1008798, 1.225719, 0.3137255, 0, 1, 1,
0.5468218, 0.7749234, 1.213178, 0.3215686, 0, 1, 1,
0.5469077, 0.1277302, 1.411746, 0.3254902, 0, 1, 1,
0.5479689, 1.042449, 0.7823883, 0.3333333, 0, 1, 1,
0.5521601, 0.3968213, 1.088116, 0.3372549, 0, 1, 1,
0.5555667, -1.079107, 3.250937, 0.345098, 0, 1, 1,
0.5570986, -0.1560138, 2.392359, 0.3490196, 0, 1, 1,
0.559907, -0.05278202, 2.112756, 0.3568628, 0, 1, 1,
0.5634037, 0.4715996, -0.8579162, 0.3607843, 0, 1, 1,
0.5654839, 0.6291884, 1.844207, 0.3686275, 0, 1, 1,
0.5735804, 0.2036519, -0.1126768, 0.372549, 0, 1, 1,
0.573639, -0.7707073, 1.338582, 0.3803922, 0, 1, 1,
0.5802475, -0.8936098, 1.420154, 0.3843137, 0, 1, 1,
0.5875154, -0.9145687, 2.472329, 0.3921569, 0, 1, 1,
0.5906618, 0.4020141, 0.2673526, 0.3960784, 0, 1, 1,
0.5908031, 0.6595324, 0.6407995, 0.4039216, 0, 1, 1,
0.5945165, -2.452756, 3.776508, 0.4117647, 0, 1, 1,
0.5959947, 0.647382, 2.018107, 0.4156863, 0, 1, 1,
0.6024642, -0.5056905, 2.24556, 0.4235294, 0, 1, 1,
0.6029657, -1.846569, 3.566498, 0.427451, 0, 1, 1,
0.6036263, -0.1188453, 1.902986, 0.4352941, 0, 1, 1,
0.6079878, -0.5355237, 4.223447, 0.4392157, 0, 1, 1,
0.6120995, -0.3993547, 1.356515, 0.4470588, 0, 1, 1,
0.613035, -0.6595832, 2.990113, 0.4509804, 0, 1, 1,
0.624379, -1.25957, 2.845852, 0.4588235, 0, 1, 1,
0.6256754, 1.348719, 1.830771, 0.4627451, 0, 1, 1,
0.6300913, -1.649606, 3.7312, 0.4705882, 0, 1, 1,
0.6311759, -1.445129, 3.012915, 0.4745098, 0, 1, 1,
0.6323608, -1.394442, 2.443833, 0.4823529, 0, 1, 1,
0.6424223, 0.5748217, 2.113471, 0.4862745, 0, 1, 1,
0.6430369, 0.3393235, 1.548386, 0.4941176, 0, 1, 1,
0.643413, -1.944725, 3.306597, 0.5019608, 0, 1, 1,
0.6451733, -1.158266, 3.450668, 0.5058824, 0, 1, 1,
0.6462162, -0.7681525, 1.031387, 0.5137255, 0, 1, 1,
0.6489582, 0.3350165, 1.557753, 0.5176471, 0, 1, 1,
0.6589462, -1.100293, 3.090278, 0.5254902, 0, 1, 1,
0.6672068, -1.26123, 1.715695, 0.5294118, 0, 1, 1,
0.6693685, 0.9645137, 1.37393, 0.5372549, 0, 1, 1,
0.6747539, 0.3472843, 1.721187, 0.5411765, 0, 1, 1,
0.6762391, 0.7030132, 0.5254707, 0.5490196, 0, 1, 1,
0.6767904, 0.5333437, 2.664014, 0.5529412, 0, 1, 1,
0.6771763, 0.9959641, 0.7761384, 0.5607843, 0, 1, 1,
0.6778082, -2.02034, 2.896347, 0.5647059, 0, 1, 1,
0.6947136, 1.73456, -0.5480922, 0.572549, 0, 1, 1,
0.6951466, -1.108788, 2.635847, 0.5764706, 0, 1, 1,
0.6963642, 0.8488399, -0.2686062, 0.5843138, 0, 1, 1,
0.7076691, 0.4273729, 1.497908, 0.5882353, 0, 1, 1,
0.7148555, -1.920772, 2.530644, 0.5960785, 0, 1, 1,
0.7207069, 1.562139, -0.2508008, 0.6039216, 0, 1, 1,
0.7237393, -0.244721, 1.178524, 0.6078432, 0, 1, 1,
0.7248473, 1.073451, 0.9121003, 0.6156863, 0, 1, 1,
0.728277, 0.1362456, 0.6981729, 0.6196079, 0, 1, 1,
0.7304015, 0.1449409, 1.923783, 0.627451, 0, 1, 1,
0.7313013, -0.5386906, 3.297748, 0.6313726, 0, 1, 1,
0.734414, 1.187284, 0.2093738, 0.6392157, 0, 1, 1,
0.7399926, -0.2379816, 1.75416, 0.6431373, 0, 1, 1,
0.7458309, -1.037272, 2.381106, 0.6509804, 0, 1, 1,
0.747176, -1.608687, 0.5842398, 0.654902, 0, 1, 1,
0.7494628, 1.284168, -0.6522432, 0.6627451, 0, 1, 1,
0.7496883, 0.7655977, 1.920375, 0.6666667, 0, 1, 1,
0.7514786, 0.2225033, 1.206031, 0.6745098, 0, 1, 1,
0.7526323, -0.2517551, 1.774019, 0.6784314, 0, 1, 1,
0.7531385, -0.2491598, 1.870306, 0.6862745, 0, 1, 1,
0.758911, 1.684484, -0.1869149, 0.6901961, 0, 1, 1,
0.7618335, -1.408542, 3.724331, 0.6980392, 0, 1, 1,
0.7633091, 1.724038, -0.4992175, 0.7058824, 0, 1, 1,
0.7754855, 1.523435, -0.3858912, 0.7098039, 0, 1, 1,
0.7837359, -1.03516, 2.041577, 0.7176471, 0, 1, 1,
0.7848693, -1.042158, 2.730654, 0.7215686, 0, 1, 1,
0.7939568, -0.706661, 1.733131, 0.7294118, 0, 1, 1,
0.8099868, 0.5034238, -1.650563, 0.7333333, 0, 1, 1,
0.8152439, -1.250867, 1.23884, 0.7411765, 0, 1, 1,
0.8171112, -0.115307, 0.7552034, 0.7450981, 0, 1, 1,
0.8178762, -1.490316, 2.078438, 0.7529412, 0, 1, 1,
0.8209374, 0.6107938, 1.896666, 0.7568628, 0, 1, 1,
0.8213943, -0.5516519, 1.138673, 0.7647059, 0, 1, 1,
0.8230912, -0.2079807, 2.09391, 0.7686275, 0, 1, 1,
0.82683, 1.120589, 0.6627253, 0.7764706, 0, 1, 1,
0.8297135, 0.2992776, 1.165072, 0.7803922, 0, 1, 1,
0.8358986, 0.06264019, 0.4254028, 0.7882353, 0, 1, 1,
0.8402302, 0.286449, 2.444741, 0.7921569, 0, 1, 1,
0.8410029, 1.088323, -0.3483308, 0.8, 0, 1, 1,
0.842266, 0.2875111, 0.1374888, 0.8078431, 0, 1, 1,
0.8453327, -1.302622, 3.424817, 0.8117647, 0, 1, 1,
0.8454273, 1.04311, 2.154919, 0.8196079, 0, 1, 1,
0.8538975, 0.4378231, 0.3531458, 0.8235294, 0, 1, 1,
0.856858, 0.2396561, 1.283297, 0.8313726, 0, 1, 1,
0.8573158, 0.4363916, 1.340782, 0.8352941, 0, 1, 1,
0.8577585, -0.045142, 0.7041134, 0.8431373, 0, 1, 1,
0.8860143, -0.3859296, 0.7096241, 0.8470588, 0, 1, 1,
0.8874938, -0.8280025, 2.675037, 0.854902, 0, 1, 1,
0.8927804, -1.249884, 2.137672, 0.8588235, 0, 1, 1,
0.8941827, -1.131212, 1.694377, 0.8666667, 0, 1, 1,
0.8962248, 0.281812, 1.303674, 0.8705882, 0, 1, 1,
0.8962994, 1.403575, 0.1475037, 0.8784314, 0, 1, 1,
0.9039752, 0.119718, 0.9270903, 0.8823529, 0, 1, 1,
0.9080225, 1.26219, 1.292581, 0.8901961, 0, 1, 1,
0.9106069, -0.3087224, 3.804697, 0.8941177, 0, 1, 1,
0.9122244, 0.2367592, 0.5298558, 0.9019608, 0, 1, 1,
0.915306, 0.6738935, -0.163988, 0.9098039, 0, 1, 1,
0.9169567, 1.755699, 2.892899, 0.9137255, 0, 1, 1,
0.9172366, -0.5639158, 3.19522, 0.9215686, 0, 1, 1,
0.9262902, 0.3026229, 0.8057958, 0.9254902, 0, 1, 1,
0.9276504, 0.194591, 2.450127, 0.9333333, 0, 1, 1,
0.9280377, -0.1344021, 0.810648, 0.9372549, 0, 1, 1,
0.9316558, 0.4054976, 2.150327, 0.945098, 0, 1, 1,
0.9320184, 0.9578159, 0.3377696, 0.9490196, 0, 1, 1,
0.9336846, 1.673782, 0.1379984, 0.9568627, 0, 1, 1,
0.9346517, 1.729973, -0.5682184, 0.9607843, 0, 1, 1,
0.9379218, 0.7755226, -0.4794522, 0.9686275, 0, 1, 1,
0.9498874, -0.08446184, 1.583432, 0.972549, 0, 1, 1,
0.9536429, -0.5738438, 2.459832, 0.9803922, 0, 1, 1,
0.9537725, 0.3425815, 0.878606, 0.9843137, 0, 1, 1,
0.9691998, -1.744426, 2.235591, 0.9921569, 0, 1, 1,
0.971588, 0.6037887, 0.8402335, 0.9960784, 0, 1, 1,
0.9719755, 1.879221, -1.650342, 1, 0, 0.9960784, 1,
0.9750558, 1.443232, 0.4859501, 1, 0, 0.9882353, 1,
0.981338, -0.313129, 1.378242, 1, 0, 0.9843137, 1,
0.9821805, 0.376612, 1.384893, 1, 0, 0.9764706, 1,
0.9843282, -0.1840091, 1.177601, 1, 0, 0.972549, 1,
0.9906446, -0.1513721, 0.7348795, 1, 0, 0.9647059, 1,
0.9929551, -1.418323, 2.584544, 1, 0, 0.9607843, 1,
0.9934088, -0.3941729, 2.438674, 1, 0, 0.9529412, 1,
1.004756, -0.4472182, 2.504151, 1, 0, 0.9490196, 1,
1.007092, -0.3575273, 1.82904, 1, 0, 0.9411765, 1,
1.019391, 0.227368, 2.01493, 1, 0, 0.9372549, 1,
1.019492, -2.463391, 5.066389, 1, 0, 0.9294118, 1,
1.022639, 0.2609413, 1.14922, 1, 0, 0.9254902, 1,
1.026025, 0.02790463, 0.5391065, 1, 0, 0.9176471, 1,
1.036286, -0.3237349, 3.175066, 1, 0, 0.9137255, 1,
1.04172, -0.1402824, -0.1753784, 1, 0, 0.9058824, 1,
1.043355, 1.100319, 1.122841, 1, 0, 0.9019608, 1,
1.046854, 0.1243605, 1.84234, 1, 0, 0.8941177, 1,
1.047044, 0.6422681, 1.064445, 1, 0, 0.8862745, 1,
1.048554, -0.05329479, 1.9014, 1, 0, 0.8823529, 1,
1.048784, -0.772935, 3.270944, 1, 0, 0.8745098, 1,
1.052303, 0.7720754, 2.317195, 1, 0, 0.8705882, 1,
1.052951, 1.823731, 0.6474903, 1, 0, 0.8627451, 1,
1.055421, -1.28988, 2.842013, 1, 0, 0.8588235, 1,
1.057319, 1.218846, 1.135648, 1, 0, 0.8509804, 1,
1.057483, -0.946734, 2.702526, 1, 0, 0.8470588, 1,
1.058757, -0.4526929, 2.546901, 1, 0, 0.8392157, 1,
1.062011, -0.7599667, 2.467364, 1, 0, 0.8352941, 1,
1.068187, 0.1598196, 1.343221, 1, 0, 0.827451, 1,
1.069047, -1.732963, 0.5783348, 1, 0, 0.8235294, 1,
1.079461, -2.473777, 2.533562, 1, 0, 0.8156863, 1,
1.080799, 2.187487, -0.1099435, 1, 0, 0.8117647, 1,
1.091263, 0.2843672, -0.2426669, 1, 0, 0.8039216, 1,
1.100253, 0.6788961, -0.00444448, 1, 0, 0.7960784, 1,
1.106219, -0.06025121, 2.096768, 1, 0, 0.7921569, 1,
1.110761, 0.3282344, -0.5451304, 1, 0, 0.7843137, 1,
1.114278, -0.7987788, 1.498747, 1, 0, 0.7803922, 1,
1.122705, 0.08216373, 2.567639, 1, 0, 0.772549, 1,
1.128489, -1.504722, 2.819725, 1, 0, 0.7686275, 1,
1.130677, -0.3210737, 1.580267, 1, 0, 0.7607843, 1,
1.151433, -0.3287451, 1.904972, 1, 0, 0.7568628, 1,
1.156276, -0.8065652, 0.3241975, 1, 0, 0.7490196, 1,
1.157718, 0.1461316, 1.862514, 1, 0, 0.7450981, 1,
1.157783, -0.3204769, 0.4718114, 1, 0, 0.7372549, 1,
1.162945, 0.4859685, 0.1384021, 1, 0, 0.7333333, 1,
1.168376, 0.1960735, -0.7125757, 1, 0, 0.7254902, 1,
1.173291, 0.2960865, 1.744337, 1, 0, 0.7215686, 1,
1.174629, 0.967667, 0.9431188, 1, 0, 0.7137255, 1,
1.177977, -1.626108, 2.167705, 1, 0, 0.7098039, 1,
1.180034, 0.4235173, 1.022054, 1, 0, 0.7019608, 1,
1.182243, 0.7104933, 2.351004, 1, 0, 0.6941177, 1,
1.190616, 1.516748, -0.4193386, 1, 0, 0.6901961, 1,
1.198927, 1.300264, -0.2109975, 1, 0, 0.682353, 1,
1.202522, -1.563809, 5.071521, 1, 0, 0.6784314, 1,
1.204031, 0.947279, 1.905855, 1, 0, 0.6705883, 1,
1.217073, -1.62684, 3.235925, 1, 0, 0.6666667, 1,
1.232003, -1.6977, 2.683032, 1, 0, 0.6588235, 1,
1.241393, -0.6297447, 1.488169, 1, 0, 0.654902, 1,
1.243673, -1.932611, 3.510656, 1, 0, 0.6470588, 1,
1.261567, -0.5308128, 2.795554, 1, 0, 0.6431373, 1,
1.267596, 0.08387839, -0.2816699, 1, 0, 0.6352941, 1,
1.292246, -0.6849799, 1.561706, 1, 0, 0.6313726, 1,
1.294849, -0.9280405, 2.904217, 1, 0, 0.6235294, 1,
1.296332, 0.06966192, 1.595469, 1, 0, 0.6196079, 1,
1.296437, 0.2837439, 2.542313, 1, 0, 0.6117647, 1,
1.300989, 0.5193886, 1.069927, 1, 0, 0.6078432, 1,
1.318321, 0.5230516, 2.807215, 1, 0, 0.6, 1,
1.322455, -1.229666, 0.3904409, 1, 0, 0.5921569, 1,
1.327783, -0.4698467, 2.419714, 1, 0, 0.5882353, 1,
1.331802, -1.517847, 4.114944, 1, 0, 0.5803922, 1,
1.33461, -0.3121565, 1.127564, 1, 0, 0.5764706, 1,
1.356866, 1.633338, 1.100489, 1, 0, 0.5686275, 1,
1.369506, -0.7635552, 0.6254789, 1, 0, 0.5647059, 1,
1.378106, 0.2674312, 2.224536, 1, 0, 0.5568628, 1,
1.378769, -0.7493107, 1.256456, 1, 0, 0.5529412, 1,
1.383387, -0.1984888, -0.1014127, 1, 0, 0.5450981, 1,
1.388009, -1.088578, 1.169986, 1, 0, 0.5411765, 1,
1.389727, -0.7331163, 2.57218, 1, 0, 0.5333334, 1,
1.399501, 1.976391, 2.250133, 1, 0, 0.5294118, 1,
1.402508, -2.318718, 2.495246, 1, 0, 0.5215687, 1,
1.41933, -0.1866763, -1.297304, 1, 0, 0.5176471, 1,
1.434626, -1.400404, 3.604508, 1, 0, 0.509804, 1,
1.440108, -0.964996, 2.903803, 1, 0, 0.5058824, 1,
1.455919, 0.8506399, 1.734658, 1, 0, 0.4980392, 1,
1.46397, 0.3440938, 1.544587, 1, 0, 0.4901961, 1,
1.46918, -1.385356, 3.891182, 1, 0, 0.4862745, 1,
1.485345, -0.6951993, 1.196504, 1, 0, 0.4784314, 1,
1.491309, -0.6822839, 4.240027, 1, 0, 0.4745098, 1,
1.493635, 0.6861755, 1.208197, 1, 0, 0.4666667, 1,
1.502562, -0.9730752, 1.2349, 1, 0, 0.4627451, 1,
1.505339, -0.3485929, 2.002364, 1, 0, 0.454902, 1,
1.515204, -0.0169457, -0.8339947, 1, 0, 0.4509804, 1,
1.53115, 0.5216588, 1.516505, 1, 0, 0.4431373, 1,
1.539761, 1.006271, 1.214081, 1, 0, 0.4392157, 1,
1.545498, -0.8790755, 2.41167, 1, 0, 0.4313726, 1,
1.568294, -0.5118824, 2.365988, 1, 0, 0.427451, 1,
1.570366, 0.5385323, 1.773483, 1, 0, 0.4196078, 1,
1.57779, -1.362603, 2.157028, 1, 0, 0.4156863, 1,
1.579322, 0.4955758, 0.7315018, 1, 0, 0.4078431, 1,
1.579641, -1.277469, 2.221113, 1, 0, 0.4039216, 1,
1.596466, -0.04680484, 0.7814381, 1, 0, 0.3960784, 1,
1.605582, -0.1392002, 2.67795, 1, 0, 0.3882353, 1,
1.605648, 0.09275364, 0.3929697, 1, 0, 0.3843137, 1,
1.619865, 0.3060778, 2.491979, 1, 0, 0.3764706, 1,
1.622088, -1.76081, 2.628889, 1, 0, 0.372549, 1,
1.63996, 0.102968, 2.075763, 1, 0, 0.3647059, 1,
1.64018, 2.013706, 1.897778, 1, 0, 0.3607843, 1,
1.65627, -2.62618, 2.739341, 1, 0, 0.3529412, 1,
1.677448, -0.5435714, 1.82581, 1, 0, 0.3490196, 1,
1.682079, -0.3360669, 1.205956, 1, 0, 0.3411765, 1,
1.686285, 0.1271383, 0.03839581, 1, 0, 0.3372549, 1,
1.697667, -1.408985, 1.530044, 1, 0, 0.3294118, 1,
1.69907, -0.3445628, 1.227277, 1, 0, 0.3254902, 1,
1.7181, 1.887056, 0.5310523, 1, 0, 0.3176471, 1,
1.725496, 2.462332, 1.337034, 1, 0, 0.3137255, 1,
1.736288, -0.4640527, 2.746824, 1, 0, 0.3058824, 1,
1.762662, -0.8681995, 0.8376228, 1, 0, 0.2980392, 1,
1.765328, -0.5668078, 2.342066, 1, 0, 0.2941177, 1,
1.785744, -0.2675135, 1.835021, 1, 0, 0.2862745, 1,
1.786949, 0.2475863, 0.5009949, 1, 0, 0.282353, 1,
1.787109, 0.5426791, -0.7536772, 1, 0, 0.2745098, 1,
1.797477, 1.370132, 0.2559337, 1, 0, 0.2705882, 1,
1.802479, 0.1164425, 0.6595851, 1, 0, 0.2627451, 1,
1.811532, 0.543549, 3.044236, 1, 0, 0.2588235, 1,
1.825364, -1.641538, 1.138033, 1, 0, 0.2509804, 1,
1.854968, -0.04469894, 1.63964, 1, 0, 0.2470588, 1,
1.862495, 0.9956964, 0.02668009, 1, 0, 0.2392157, 1,
1.87807, -1.798252, 0.5406921, 1, 0, 0.2352941, 1,
1.878381, -0.3159059, 2.612404, 1, 0, 0.227451, 1,
1.88038, 1.530277, 1.208465, 1, 0, 0.2235294, 1,
1.897128, -0.1556005, 2.373259, 1, 0, 0.2156863, 1,
1.932818, 0.771098, 2.407477, 1, 0, 0.2117647, 1,
1.945513, 0.5201083, 2.395389, 1, 0, 0.2039216, 1,
1.957239, -0.8762673, 1.337855, 1, 0, 0.1960784, 1,
1.975737, -2.688707, 2.360787, 1, 0, 0.1921569, 1,
1.982131, 0.6496234, 1.396417, 1, 0, 0.1843137, 1,
1.982806, 0.6587943, 2.481793, 1, 0, 0.1803922, 1,
2.004764, -0.5615942, 2.179127, 1, 0, 0.172549, 1,
2.009836, 0.4691303, 1.439001, 1, 0, 0.1686275, 1,
2.018684, -2.190387, 2.952335, 1, 0, 0.1607843, 1,
2.042332, -1.05608, 2.19365, 1, 0, 0.1568628, 1,
2.062245, -1.435384, 1.669679, 1, 0, 0.1490196, 1,
2.062643, -1.640038, 3.122819, 1, 0, 0.145098, 1,
2.105089, -0.1692671, 2.435434, 1, 0, 0.1372549, 1,
2.106584, 0.9197684, 1.080017, 1, 0, 0.1333333, 1,
2.118828, -1.145328, 2.918844, 1, 0, 0.1254902, 1,
2.14156, 0.1275276, 1.79821, 1, 0, 0.1215686, 1,
2.153468, -1.30194, 1.459589, 1, 0, 0.1137255, 1,
2.16358, -1.797978, 1.158908, 1, 0, 0.1098039, 1,
2.264583, 0.8376155, 0.7103043, 1, 0, 0.1019608, 1,
2.271079, 1.197578, 2.431498, 1, 0, 0.09411765, 1,
2.289026, 0.8214709, 1.969055, 1, 0, 0.09019608, 1,
2.342484, -0.2773838, 2.543769, 1, 0, 0.08235294, 1,
2.357308, -0.9174339, 1.518232, 1, 0, 0.07843138, 1,
2.373492, 0.4095533, 3.02252, 1, 0, 0.07058824, 1,
2.456119, -0.6507545, 1.116804, 1, 0, 0.06666667, 1,
2.484797, 0.06091945, 0.8419154, 1, 0, 0.05882353, 1,
2.487269, -1.014813, 0.1746388, 1, 0, 0.05490196, 1,
2.514534, 1.669723, 1.281847, 1, 0, 0.04705882, 1,
2.686241, -0.4356716, 2.645894, 1, 0, 0.04313726, 1,
2.797596, -0.7336479, 1.661981, 1, 0, 0.03529412, 1,
2.918739, -0.6285551, 0.478409, 1, 0, 0.03137255, 1,
3.093365, 0.00512489, 2.066678, 1, 0, 0.02352941, 1,
3.115183, 0.1969863, 1.947366, 1, 0, 0.01960784, 1,
3.220511, -0.677872, 1.26886, 1, 0, 0.01176471, 1,
3.960566, -1.160313, 0.4236385, 1, 0, 0.007843138, 1
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
0.09377789, -4.144728, -7.671198, 0, -0.5, 0.5, 0.5,
0.09377789, -4.144728, -7.671198, 1, -0.5, 0.5, 0.5,
0.09377789, -4.144728, -7.671198, 1, 1.5, 0.5, 0.5,
0.09377789, -4.144728, -7.671198, 0, 1.5, 0.5, 0.5
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
-5.083852, -0.04010355, -7.671198, 0, -0.5, 0.5, 0.5,
-5.083852, -0.04010355, -7.671198, 1, -0.5, 0.5, 0.5,
-5.083852, -0.04010355, -7.671198, 1, 1.5, 0.5, 0.5,
-5.083852, -0.04010355, -7.671198, 0, 1.5, 0.5, 0.5
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
-5.083852, -4.144728, -0.2271509, 0, -0.5, 0.5, 0.5,
-5.083852, -4.144728, -0.2271509, 1, -0.5, 0.5, 0.5,
-5.083852, -4.144728, -0.2271509, 1, 1.5, 0.5, 0.5,
-5.083852, -4.144728, -0.2271509, 0, 1.5, 0.5, 0.5
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
-2, -3.197507, -5.953341,
2, -3.197507, -5.953341,
-2, -3.197507, -5.953341,
-2, -3.355377, -6.23965,
0, -3.197507, -5.953341,
0, -3.355377, -6.23965,
2, -3.197507, -5.953341,
2, -3.355377, -6.23965
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
"0",
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
-2, -3.671117, -6.812269, 0, -0.5, 0.5, 0.5,
-2, -3.671117, -6.812269, 1, -0.5, 0.5, 0.5,
-2, -3.671117, -6.812269, 1, 1.5, 0.5, 0.5,
-2, -3.671117, -6.812269, 0, 1.5, 0.5, 0.5,
0, -3.671117, -6.812269, 0, -0.5, 0.5, 0.5,
0, -3.671117, -6.812269, 1, -0.5, 0.5, 0.5,
0, -3.671117, -6.812269, 1, 1.5, 0.5, 0.5,
0, -3.671117, -6.812269, 0, 1.5, 0.5, 0.5,
2, -3.671117, -6.812269, 0, -0.5, 0.5, 0.5,
2, -3.671117, -6.812269, 1, -0.5, 0.5, 0.5,
2, -3.671117, -6.812269, 1, 1.5, 0.5, 0.5,
2, -3.671117, -6.812269, 0, 1.5, 0.5, 0.5
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
-3.889014, -3, -5.953341,
-3.889014, 3, -5.953341,
-3.889014, -3, -5.953341,
-4.088154, -3, -6.23965,
-3.889014, -2, -5.953341,
-4.088154, -2, -6.23965,
-3.889014, -1, -5.953341,
-4.088154, -1, -6.23965,
-3.889014, 0, -5.953341,
-4.088154, 0, -6.23965,
-3.889014, 1, -5.953341,
-4.088154, 1, -6.23965,
-3.889014, 2, -5.953341,
-4.088154, 2, -6.23965,
-3.889014, 3, -5.953341,
-4.088154, 3, -6.23965
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
-4.486433, -3, -6.812269, 0, -0.5, 0.5, 0.5,
-4.486433, -3, -6.812269, 1, -0.5, 0.5, 0.5,
-4.486433, -3, -6.812269, 1, 1.5, 0.5, 0.5,
-4.486433, -3, -6.812269, 0, 1.5, 0.5, 0.5,
-4.486433, -2, -6.812269, 0, -0.5, 0.5, 0.5,
-4.486433, -2, -6.812269, 1, -0.5, 0.5, 0.5,
-4.486433, -2, -6.812269, 1, 1.5, 0.5, 0.5,
-4.486433, -2, -6.812269, 0, 1.5, 0.5, 0.5,
-4.486433, -1, -6.812269, 0, -0.5, 0.5, 0.5,
-4.486433, -1, -6.812269, 1, -0.5, 0.5, 0.5,
-4.486433, -1, -6.812269, 1, 1.5, 0.5, 0.5,
-4.486433, -1, -6.812269, 0, 1.5, 0.5, 0.5,
-4.486433, 0, -6.812269, 0, -0.5, 0.5, 0.5,
-4.486433, 0, -6.812269, 1, -0.5, 0.5, 0.5,
-4.486433, 0, -6.812269, 1, 1.5, 0.5, 0.5,
-4.486433, 0, -6.812269, 0, 1.5, 0.5, 0.5,
-4.486433, 1, -6.812269, 0, -0.5, 0.5, 0.5,
-4.486433, 1, -6.812269, 1, -0.5, 0.5, 0.5,
-4.486433, 1, -6.812269, 1, 1.5, 0.5, 0.5,
-4.486433, 1, -6.812269, 0, 1.5, 0.5, 0.5,
-4.486433, 2, -6.812269, 0, -0.5, 0.5, 0.5,
-4.486433, 2, -6.812269, 1, -0.5, 0.5, 0.5,
-4.486433, 2, -6.812269, 1, 1.5, 0.5, 0.5,
-4.486433, 2, -6.812269, 0, 1.5, 0.5, 0.5,
-4.486433, 3, -6.812269, 0, -0.5, 0.5, 0.5,
-4.486433, 3, -6.812269, 1, -0.5, 0.5, 0.5,
-4.486433, 3, -6.812269, 1, 1.5, 0.5, 0.5,
-4.486433, 3, -6.812269, 0, 1.5, 0.5, 0.5
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
-3.889014, -3.197507, -4,
-3.889014, -3.197507, 4,
-3.889014, -3.197507, -4,
-4.088154, -3.355377, -4,
-3.889014, -3.197507, -2,
-4.088154, -3.355377, -2,
-3.889014, -3.197507, 0,
-4.088154, -3.355377, 0,
-3.889014, -3.197507, 2,
-4.088154, -3.355377, 2,
-3.889014, -3.197507, 4,
-4.088154, -3.355377, 4
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
-4.486433, -3.671117, -4, 0, -0.5, 0.5, 0.5,
-4.486433, -3.671117, -4, 1, -0.5, 0.5, 0.5,
-4.486433, -3.671117, -4, 1, 1.5, 0.5, 0.5,
-4.486433, -3.671117, -4, 0, 1.5, 0.5, 0.5,
-4.486433, -3.671117, -2, 0, -0.5, 0.5, 0.5,
-4.486433, -3.671117, -2, 1, -0.5, 0.5, 0.5,
-4.486433, -3.671117, -2, 1, 1.5, 0.5, 0.5,
-4.486433, -3.671117, -2, 0, 1.5, 0.5, 0.5,
-4.486433, -3.671117, 0, 0, -0.5, 0.5, 0.5,
-4.486433, -3.671117, 0, 1, -0.5, 0.5, 0.5,
-4.486433, -3.671117, 0, 1, 1.5, 0.5, 0.5,
-4.486433, -3.671117, 0, 0, 1.5, 0.5, 0.5,
-4.486433, -3.671117, 2, 0, -0.5, 0.5, 0.5,
-4.486433, -3.671117, 2, 1, -0.5, 0.5, 0.5,
-4.486433, -3.671117, 2, 1, 1.5, 0.5, 0.5,
-4.486433, -3.671117, 2, 0, 1.5, 0.5, 0.5,
-4.486433, -3.671117, 4, 0, -0.5, 0.5, 0.5,
-4.486433, -3.671117, 4, 1, -0.5, 0.5, 0.5,
-4.486433, -3.671117, 4, 1, 1.5, 0.5, 0.5,
-4.486433, -3.671117, 4, 0, 1.5, 0.5, 0.5
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
-3.889014, -3.197507, -5.953341,
-3.889014, 3.1173, -5.953341,
-3.889014, -3.197507, 5.499039,
-3.889014, 3.1173, 5.499039,
-3.889014, -3.197507, -5.953341,
-3.889014, -3.197507, 5.499039,
-3.889014, 3.1173, -5.953341,
-3.889014, 3.1173, 5.499039,
-3.889014, -3.197507, -5.953341,
4.07657, -3.197507, -5.953341,
-3.889014, -3.197507, 5.499039,
4.07657, -3.197507, 5.499039,
-3.889014, 3.1173, -5.953341,
4.07657, 3.1173, -5.953341,
-3.889014, 3.1173, 5.499039,
4.07657, 3.1173, 5.499039,
4.07657, -3.197507, -5.953341,
4.07657, 3.1173, -5.953341,
4.07657, -3.197507, 5.499039,
4.07657, 3.1173, 5.499039,
4.07657, -3.197507, -5.953341,
4.07657, -3.197507, 5.499039,
4.07657, 3.1173, -5.953341,
4.07657, 3.1173, 5.499039
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
var radius = 8.176781;
var distance = 36.37943;
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
mvMatrix.translate( -0.09377789, 0.04010355, 0.2271509 );
mvMatrix.scale( 1.109887, 1.400026, 0.7719702 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.37943);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Gibberellic_acid<-read.table("Gibberellic_acid.xyz")
```

```
## Error in read.table("Gibberellic_acid.xyz"): no lines available in input
```

```r
x<-Gibberellic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'Gibberellic_acid' not found
```

```r
y<-Gibberellic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'Gibberellic_acid' not found
```

```r
z<-Gibberellic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'Gibberellic_acid' not found
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
-3.77301, -1.078272, -0.7462239, 0, 0, 1, 1, 1,
-3.634305, 1.277065, -1.591801, 1, 0, 0, 1, 1,
-3.074536, -0.448369, -2.503778, 1, 0, 0, 1, 1,
-2.736547, -0.9245644, -1.598067, 1, 0, 0, 1, 1,
-2.703493, 1.241745, 0.8335571, 1, 0, 0, 1, 1,
-2.612071, -0.3069482, -2.116541, 1, 0, 0, 1, 1,
-2.513457, 0.1540204, 0.6343077, 0, 0, 0, 1, 1,
-2.503473, -1.074046, -1.620172, 0, 0, 0, 1, 1,
-2.488318, 0.8308502, -2.532146, 0, 0, 0, 1, 1,
-2.404862, -0.06393886, -3.180701, 0, 0, 0, 1, 1,
-2.401443, -0.3667918, -3.013293, 0, 0, 0, 1, 1,
-2.361929, 0.2664824, -3.057745, 0, 0, 0, 1, 1,
-2.341449, 0.6698529, -0.4779645, 0, 0, 0, 1, 1,
-2.218622, -1.154667, -0.9198264, 1, 1, 1, 1, 1,
-2.211897, 0.3157849, -3.153111, 1, 1, 1, 1, 1,
-2.162049, -1.589201, -2.790732, 1, 1, 1, 1, 1,
-2.125276, -1.666272, -2.2382, 1, 1, 1, 1, 1,
-2.123831, 0.4468245, -1.258193, 1, 1, 1, 1, 1,
-2.10653, -1.842606, -1.929622, 1, 1, 1, 1, 1,
-2.097247, -0.819024, -0.7490338, 1, 1, 1, 1, 1,
-2.090425, 0.4821104, -0.6369432, 1, 1, 1, 1, 1,
-2.087512, -0.06877392, -1.51931, 1, 1, 1, 1, 1,
-2.086022, -1.551727, -0.4020022, 1, 1, 1, 1, 1,
-2.003458, 1.116415, -1.039828, 1, 1, 1, 1, 1,
-2.003299, 1.182607, -1.791099, 1, 1, 1, 1, 1,
-1.997343, -0.661386, -2.217351, 1, 1, 1, 1, 1,
-1.979591, -1.832483, -1.188851, 1, 1, 1, 1, 1,
-1.97344, 0.2493188, -1.394567, 1, 1, 1, 1, 1,
-1.971643, -0.02379702, -1.268629, 0, 0, 1, 1, 1,
-1.948643, 1.002931, -0.1738416, 1, 0, 0, 1, 1,
-1.928153, 0.7207183, -1.148203, 1, 0, 0, 1, 1,
-1.916474, -1.834791, -1.613909, 1, 0, 0, 1, 1,
-1.911498, 3.025337, -0.173665, 1, 0, 0, 1, 1,
-1.91106, 2.317406, -0.2174602, 1, 0, 0, 1, 1,
-1.891922, -0.7638137, -2.139189, 0, 0, 0, 1, 1,
-1.882249, -0.5290127, -1.757447, 0, 0, 0, 1, 1,
-1.875611, 0.09612094, -1.60541, 0, 0, 0, 1, 1,
-1.862182, -0.4193726, -1.455123, 0, 0, 0, 1, 1,
-1.838957, 1.674152, 0.1205063, 0, 0, 0, 1, 1,
-1.832392, 0.4009488, 0.2684606, 0, 0, 0, 1, 1,
-1.826431, 0.06548788, -2.434276, 0, 0, 0, 1, 1,
-1.807232, 1.01952, -1.002922, 1, 1, 1, 1, 1,
-1.8023, 0.6386791, -3.36814, 1, 1, 1, 1, 1,
-1.791924, 1.755531, -0.9986547, 1, 1, 1, 1, 1,
-1.78921, 0.03377452, -2.020643, 1, 1, 1, 1, 1,
-1.787599, -1.31134, -2.627784, 1, 1, 1, 1, 1,
-1.760866, -1.582601, -0.680125, 1, 1, 1, 1, 1,
-1.749394, -2.244858, -2.956035, 1, 1, 1, 1, 1,
-1.730412, -0.5750679, -2.682404, 1, 1, 1, 1, 1,
-1.694916, 0.4411241, -0.1502309, 1, 1, 1, 1, 1,
-1.688383, -0.1493304, -1.289252, 1, 1, 1, 1, 1,
-1.657897, -1.56847, -2.23304, 1, 1, 1, 1, 1,
-1.654345, -0.1775873, -1.861267, 1, 1, 1, 1, 1,
-1.652805, 0.2084222, -1.116474, 1, 1, 1, 1, 1,
-1.634269, -0.3576025, -0.850035, 1, 1, 1, 1, 1,
-1.633813, 1.094395, -2.272645, 1, 1, 1, 1, 1,
-1.633711, 1.405139, -0.4150763, 0, 0, 1, 1, 1,
-1.633521, 0.9518169, -0.7996759, 1, 0, 0, 1, 1,
-1.626626, 1.51501, 0.351812, 1, 0, 0, 1, 1,
-1.611201, 0.5163956, -0.9184098, 1, 0, 0, 1, 1,
-1.598838, 0.9644466, -1.475608, 1, 0, 0, 1, 1,
-1.598398, -0.733233, -2.43225, 1, 0, 0, 1, 1,
-1.59608, -0.831302, -2.638976, 0, 0, 0, 1, 1,
-1.594292, -0.1567966, -2.252492, 0, 0, 0, 1, 1,
-1.576753, 1.197287, -1.412704, 0, 0, 0, 1, 1,
-1.574536, 0.5296348, 0.2657999, 0, 0, 0, 1, 1,
-1.569398, -1.800909, -0.8003724, 0, 0, 0, 1, 1,
-1.528622, 0.5425015, -2.310332, 0, 0, 0, 1, 1,
-1.514607, 1.371968, -0.7949628, 0, 0, 0, 1, 1,
-1.512798, -0.4271694, -3.486031, 1, 1, 1, 1, 1,
-1.50792, 0.994577, -2.935381, 1, 1, 1, 1, 1,
-1.498499, 0.3322207, -0.3021975, 1, 1, 1, 1, 1,
-1.493449, -1.189803, -1.931974, 1, 1, 1, 1, 1,
-1.484416, -0.3804359, -3.248974, 1, 1, 1, 1, 1,
-1.483339, -0.6972058, -3.003318, 1, 1, 1, 1, 1,
-1.476695, 0.08362072, -3.510972, 1, 1, 1, 1, 1,
-1.470852, -0.6100959, -0.7585813, 1, 1, 1, 1, 1,
-1.458188, -1.227795, -1.5591, 1, 1, 1, 1, 1,
-1.435467, 0.03118178, -1.820129, 1, 1, 1, 1, 1,
-1.431225, -0.1929864, -0.9101641, 1, 1, 1, 1, 1,
-1.430868, 1.154343, -0.6283208, 1, 1, 1, 1, 1,
-1.427372, 0.3502764, -2.743543, 1, 1, 1, 1, 1,
-1.422408, -0.08085938, -0.3393229, 1, 1, 1, 1, 1,
-1.42118, -1.339683, -2.748643, 1, 1, 1, 1, 1,
-1.419614, 1.286732, -1.933668, 0, 0, 1, 1, 1,
-1.414722, 1.434062, 0.0867791, 1, 0, 0, 1, 1,
-1.406506, -0.6401685, -0.9929823, 1, 0, 0, 1, 1,
-1.40473, 0.3187884, 1.461073, 1, 0, 0, 1, 1,
-1.396064, -0.9134398, -1.138913, 1, 0, 0, 1, 1,
-1.393544, 0.2281964, -1.318782, 1, 0, 0, 1, 1,
-1.391632, -0.2449479, -1.025159, 0, 0, 0, 1, 1,
-1.380347, -0.6979243, -2.638625, 0, 0, 0, 1, 1,
-1.376783, 0.6284675, -0.9157249, 0, 0, 0, 1, 1,
-1.37314, 0.0184819, 0.480232, 0, 0, 0, 1, 1,
-1.364272, -0.5193841, -0.375645, 0, 0, 0, 1, 1,
-1.362963, 1.223527, 0.8983945, 0, 0, 0, 1, 1,
-1.35529, -0.7946889, -0.6891612, 0, 0, 0, 1, 1,
-1.354977, 0.673085, -0.1174287, 1, 1, 1, 1, 1,
-1.353175, -1.286487, -2.013521, 1, 1, 1, 1, 1,
-1.32841, -0.300083, -1.78617, 1, 1, 1, 1, 1,
-1.327074, -1.185948, -3.413107, 1, 1, 1, 1, 1,
-1.324903, -0.2768394, -2.282478, 1, 1, 1, 1, 1,
-1.324642, 0.9943942, -1.278937, 1, 1, 1, 1, 1,
-1.299023, -0.9299127, -3.584865, 1, 1, 1, 1, 1,
-1.283806, 0.9170051, -2.709315, 1, 1, 1, 1, 1,
-1.28303, -0.2408831, -3.940455, 1, 1, 1, 1, 1,
-1.278824, 1.228734, -1.730675, 1, 1, 1, 1, 1,
-1.277139, -0.1009758, -1.002575, 1, 1, 1, 1, 1,
-1.276791, 1.176877, -1.287159, 1, 1, 1, 1, 1,
-1.274373, -2.445677, -2.53748, 1, 1, 1, 1, 1,
-1.272849, -0.5671983, -1.440129, 1, 1, 1, 1, 1,
-1.266945, -1.568084, -2.449809, 1, 1, 1, 1, 1,
-1.256373, 1.179185, -2.636978, 0, 0, 1, 1, 1,
-1.251828, 0.1879113, -1.068493, 1, 0, 0, 1, 1,
-1.251001, -1.846878, -4.380517, 1, 0, 0, 1, 1,
-1.248783, -0.0008814125, -3.023472, 1, 0, 0, 1, 1,
-1.247722, -0.8048467, -2.58555, 1, 0, 0, 1, 1,
-1.240345, 0.316548, -1.424114, 1, 0, 0, 1, 1,
-1.235705, 0.3089294, -1.166898, 0, 0, 0, 1, 1,
-1.235588, 2.306732, -1.856451, 0, 0, 0, 1, 1,
-1.235197, 0.9599623, -1.021084, 0, 0, 0, 1, 1,
-1.230309, 0.0514526, -1.74015, 0, 0, 0, 1, 1,
-1.226165, 0.3888683, -1.10244, 0, 0, 0, 1, 1,
-1.221388, -0.5605904, -2.365611, 0, 0, 0, 1, 1,
-1.214734, -0.4605335, -2.621466, 0, 0, 0, 1, 1,
-1.193337, -1.052191, -2.823083, 1, 1, 1, 1, 1,
-1.190992, 0.04837558, -1.802432, 1, 1, 1, 1, 1,
-1.1869, -0.9063778, -2.869765, 1, 1, 1, 1, 1,
-1.185143, 1.074179, -2.523912, 1, 1, 1, 1, 1,
-1.160465, -1.103225, -2.679682, 1, 1, 1, 1, 1,
-1.153578, -0.8545284, -2.703018, 1, 1, 1, 1, 1,
-1.151134, -1.239893, -3.012534, 1, 1, 1, 1, 1,
-1.150631, 0.7438568, -0.5074643, 1, 1, 1, 1, 1,
-1.148931, 0.6578898, 1.179134, 1, 1, 1, 1, 1,
-1.144254, 0.4256863, -3.177127, 1, 1, 1, 1, 1,
-1.138167, 1.00709, -0.04211319, 1, 1, 1, 1, 1,
-1.134346, 1.221547, 1.124696, 1, 1, 1, 1, 1,
-1.122422, 0.4200048, -1.182883, 1, 1, 1, 1, 1,
-1.122046, -1.357306, -2.396896, 1, 1, 1, 1, 1,
-1.112841, 2.486239, 0.8864009, 1, 1, 1, 1, 1,
-1.102088, 0.9353436, -2.345588, 0, 0, 1, 1, 1,
-1.100169, 0.05031649, -1.173625, 1, 0, 0, 1, 1,
-1.099508, 1.033525, -0.5863769, 1, 0, 0, 1, 1,
-1.098301, 0.1728569, -2.531028, 1, 0, 0, 1, 1,
-1.090413, 1.146563, -0.09073041, 1, 0, 0, 1, 1,
-1.086573, -0.09587094, -2.895522, 1, 0, 0, 1, 1,
-1.084279, -1.266708, -3.100498, 0, 0, 0, 1, 1,
-1.08346, 0.1944645, -0.8689591, 0, 0, 0, 1, 1,
-1.076857, 0.1027545, -1.812007, 0, 0, 0, 1, 1,
-1.076649, -2.994272, -3.096776, 0, 0, 0, 1, 1,
-1.064444, -0.1560255, -1.811743, 0, 0, 0, 1, 1,
-1.054122, 0.1389935, -2.32274, 0, 0, 0, 1, 1,
-1.05141, 0.7439274, 0.7981353, 0, 0, 0, 1, 1,
-1.050435, -0.2825166, -2.449044, 1, 1, 1, 1, 1,
-1.047255, 0.1819801, -0.9848472, 1, 1, 1, 1, 1,
-1.036202, 0.1654763, -1.999977, 1, 1, 1, 1, 1,
-1.028015, 0.1878372, -0.8567482, 1, 1, 1, 1, 1,
-1.00562, 0.2746535, -1.767108, 1, 1, 1, 1, 1,
-1.003833, -0.9797851, -0.9052326, 1, 1, 1, 1, 1,
-0.9997432, 0.07964547, -2.697585, 1, 1, 1, 1, 1,
-0.999148, 0.06936877, -2.738668, 1, 1, 1, 1, 1,
-0.9892119, 0.5312971, -0.2331716, 1, 1, 1, 1, 1,
-0.9886013, -0.499288, -3.630641, 1, 1, 1, 1, 1,
-0.9883643, 0.5364174, -2.724251, 1, 1, 1, 1, 1,
-0.97906, -0.5575894, -2.135215, 1, 1, 1, 1, 1,
-0.9722301, -1.509815, -2.344677, 1, 1, 1, 1, 1,
-0.9709492, 0.4601363, -1.034441, 1, 1, 1, 1, 1,
-0.9685968, 1.259737, -1.14306, 1, 1, 1, 1, 1,
-0.9670025, -1.726617, -1.993396, 0, 0, 1, 1, 1,
-0.965203, -0.1018328, -3.297269, 1, 0, 0, 1, 1,
-0.951863, 0.3060652, -1.158993, 1, 0, 0, 1, 1,
-0.9438927, 0.277631, -1.641913, 1, 0, 0, 1, 1,
-0.9386311, -2.599411, -2.230278, 1, 0, 0, 1, 1,
-0.9340857, -0.04030083, -1.747789, 1, 0, 0, 1, 1,
-0.934082, -0.04072221, -0.9253582, 0, 0, 0, 1, 1,
-0.928098, -0.4661551, -3.421581, 0, 0, 0, 1, 1,
-0.9257668, -0.1021199, -2.051938, 0, 0, 0, 1, 1,
-0.9167039, 0.008153412, -2.08403, 0, 0, 0, 1, 1,
-0.9151708, 0.9139825, -1.63033, 0, 0, 0, 1, 1,
-0.908636, 0.1280855, -0.2284171, 0, 0, 0, 1, 1,
-0.9010013, -0.3629031, -1.091078, 0, 0, 0, 1, 1,
-0.8953759, -1.282826, -3.870255, 1, 1, 1, 1, 1,
-0.8946365, -0.5687308, -0.3871547, 1, 1, 1, 1, 1,
-0.8866382, 0.329766, -1.56513, 1, 1, 1, 1, 1,
-0.8851328, 0.3436414, -1.090425, 1, 1, 1, 1, 1,
-0.8834075, 0.5548921, -2.31094, 1, 1, 1, 1, 1,
-0.8831871, 0.7693016, 0.05724433, 1, 1, 1, 1, 1,
-0.8807732, -1.474043, -5.141563, 1, 1, 1, 1, 1,
-0.8803361, -0.505155, -2.576815, 1, 1, 1, 1, 1,
-0.8798894, 1.024647, -0.2421237, 1, 1, 1, 1, 1,
-0.8769814, -1.144451, -4.462261, 1, 1, 1, 1, 1,
-0.8742681, -0.6227389, -2.567976, 1, 1, 1, 1, 1,
-0.8708599, 0.5505742, -1.590222, 1, 1, 1, 1, 1,
-0.8699359, -0.3052132, -2.66071, 1, 1, 1, 1, 1,
-0.8632147, 0.138998, -1.415436, 1, 1, 1, 1, 1,
-0.8616704, 1.367466, 0.006746612, 1, 1, 1, 1, 1,
-0.860018, 0.924709, 1.395479, 0, 0, 1, 1, 1,
-0.8593778, -0.5806555, -2.492493, 1, 0, 0, 1, 1,
-0.8571246, -0.161157, -1.997844, 1, 0, 0, 1, 1,
-0.8513306, -0.1694288, 0.02795715, 1, 0, 0, 1, 1,
-0.8408819, -0.1712393, -1.677256, 1, 0, 0, 1, 1,
-0.8408013, 0.0356291, -1.421168, 1, 0, 0, 1, 1,
-0.835675, 0.000804339, -0.9992417, 0, 0, 0, 1, 1,
-0.8353242, -0.7147565, -1.584631, 0, 0, 0, 1, 1,
-0.8287341, -0.7398964, -2.090889, 0, 0, 0, 1, 1,
-0.8276536, 1.113994, -0.3785354, 0, 0, 0, 1, 1,
-0.8167435, -0.03139197, 0.6980643, 0, 0, 0, 1, 1,
-0.8013031, -1.875653, -2.8895, 0, 0, 0, 1, 1,
-0.8009032, -0.8815465, -2.050568, 0, 0, 0, 1, 1,
-0.7940839, -1.30791, -4.516123, 1, 1, 1, 1, 1,
-0.7929132, 1.026058, -1.034724, 1, 1, 1, 1, 1,
-0.7927938, -0.5665084, -1.223759, 1, 1, 1, 1, 1,
-0.7924336, -1.128062, -1.248094, 1, 1, 1, 1, 1,
-0.7883309, -1.640251, -3.303298, 1, 1, 1, 1, 1,
-0.784932, 0.2458712, -3.201439, 1, 1, 1, 1, 1,
-0.7837521, 0.332769, -2.745256, 1, 1, 1, 1, 1,
-0.7827221, -0.7961489, -1.797721, 1, 1, 1, 1, 1,
-0.7742122, -1.368471, -2.6846, 1, 1, 1, 1, 1,
-0.7692117, -2.095835, -2.325865, 1, 1, 1, 1, 1,
-0.7642042, -0.8420359, -3.622994, 1, 1, 1, 1, 1,
-0.7598532, -0.9323667, -2.560887, 1, 1, 1, 1, 1,
-0.7569716, -1.128976, -1.99804, 1, 1, 1, 1, 1,
-0.7565792, -0.8304567, -2.743196, 1, 1, 1, 1, 1,
-0.7540249, 0.4775394, 1.419608, 1, 1, 1, 1, 1,
-0.7516899, 1.160491, -0.9061877, 0, 0, 1, 1, 1,
-0.7508579, 0.8873165, -1.078715, 1, 0, 0, 1, 1,
-0.7502965, -1.374593, -1.230226, 1, 0, 0, 1, 1,
-0.7500907, -1.356273, -3.703557, 1, 0, 0, 1, 1,
-0.7483259, 1.076441, -0.7200758, 1, 0, 0, 1, 1,
-0.7479441, 0.6450539, -1.35322, 1, 0, 0, 1, 1,
-0.7422038, -0.08575087, -2.037671, 0, 0, 0, 1, 1,
-0.741698, 1.394295, -1.810806, 0, 0, 0, 1, 1,
-0.7372229, -1.57927, -2.25706, 0, 0, 0, 1, 1,
-0.7334852, 0.536016, -0.2409029, 0, 0, 0, 1, 1,
-0.7316526, 0.6103911, -1.446676, 0, 0, 0, 1, 1,
-0.7240306, -0.9207708, -3.27276, 0, 0, 0, 1, 1,
-0.7178097, 0.06296787, 0.286524, 0, 0, 0, 1, 1,
-0.7107362, -2.310266, -2.116887, 1, 1, 1, 1, 1,
-0.7094829, 0.632086, -0.8724273, 1, 1, 1, 1, 1,
-0.7030414, 0.7042383, -0.3745282, 1, 1, 1, 1, 1,
-0.7009544, -1.393405, -3.984473, 1, 1, 1, 1, 1,
-0.6818747, 1.312381, -1.381085, 1, 1, 1, 1, 1,
-0.6816596, 0.3015342, -0.1200334, 1, 1, 1, 1, 1,
-0.6774495, -1.51732, -4.315567, 1, 1, 1, 1, 1,
-0.6750964, -0.9102743, -3.301441, 1, 1, 1, 1, 1,
-0.6735245, 1.165785, -0.03233152, 1, 1, 1, 1, 1,
-0.672232, -0.6719989, -0.8438104, 1, 1, 1, 1, 1,
-0.6601667, -0.8496876, -1.220203, 1, 1, 1, 1, 1,
-0.6578748, 0.0615267, -0.6064096, 1, 1, 1, 1, 1,
-0.65505, 0.09151896, -1.075104, 1, 1, 1, 1, 1,
-0.6549617, -1.199694, -3.083147, 1, 1, 1, 1, 1,
-0.6542993, -0.2982896, -5.042259, 1, 1, 1, 1, 1,
-0.6526073, 1.082208, -2.579668, 0, 0, 1, 1, 1,
-0.6509147, -0.2151638, -1.166896, 1, 0, 0, 1, 1,
-0.6464679, -0.6001689, -2.439501, 1, 0, 0, 1, 1,
-0.6456525, -0.28161, -2.086831, 1, 0, 0, 1, 1,
-0.6449516, -0.5753892, -3.14828, 1, 0, 0, 1, 1,
-0.6442934, -0.7733587, -1.905561, 1, 0, 0, 1, 1,
-0.6346423, -1.093406, -4.449999, 0, 0, 0, 1, 1,
-0.6329893, 0.3678973, -0.4333481, 0, 0, 0, 1, 1,
-0.6322956, -0.796306, -1.848749, 0, 0, 0, 1, 1,
-0.6303132, -1.627587, -1.974626, 0, 0, 0, 1, 1,
-0.6251618, 0.6763695, -0.8101455, 0, 0, 0, 1, 1,
-0.624446, -0.3972071, -2.538043, 0, 0, 0, 1, 1,
-0.6214203, -1.070953, -1.390418, 0, 0, 0, 1, 1,
-0.6205936, -1.383452, -0.8443403, 1, 1, 1, 1, 1,
-0.6198994, -0.0217953, -1.921448, 1, 1, 1, 1, 1,
-0.609207, 0.4468778, -0.5104944, 1, 1, 1, 1, 1,
-0.6080863, 0.6563302, -0.9376709, 1, 1, 1, 1, 1,
-0.6072801, 0.3833964, -0.5170911, 1, 1, 1, 1, 1,
-0.6066071, 0.2163893, -1.629638, 1, 1, 1, 1, 1,
-0.6045746, 0.1022963, -0.362146, 1, 1, 1, 1, 1,
-0.6007626, 0.2315082, -0.9698992, 1, 1, 1, 1, 1,
-0.5952569, 2.837655, -1.167038, 1, 1, 1, 1, 1,
-0.5921067, -0.7635996, -2.266654, 1, 1, 1, 1, 1,
-0.5888674, 0.8023578, -0.1952404, 1, 1, 1, 1, 1,
-0.5803811, -0.84544, -2.759498, 1, 1, 1, 1, 1,
-0.5782356, -0.8266873, -3.053673, 1, 1, 1, 1, 1,
-0.5766081, 1.299412, 1.227948, 1, 1, 1, 1, 1,
-0.5702179, 1.352053, 0.5679278, 1, 1, 1, 1, 1,
-0.5691293, -0.7951955, -0.6191856, 0, 0, 1, 1, 1,
-0.5667068, -1.30088, -0.6091046, 1, 0, 0, 1, 1,
-0.5619043, 1.300163, -0.5202577, 1, 0, 0, 1, 1,
-0.5568174, 0.4856004, -0.08854373, 1, 0, 0, 1, 1,
-0.5543936, -0.5254233, -1.053704, 1, 0, 0, 1, 1,
-0.5514541, 1.475731, -0.7381658, 1, 0, 0, 1, 1,
-0.5510479, -0.2337878, -2.325954, 0, 0, 0, 1, 1,
-0.5509629, 0.4239649, -0.6630302, 0, 0, 0, 1, 1,
-0.5497268, 2.810411, -1.026647, 0, 0, 0, 1, 1,
-0.5444444, 0.7211078, -1.970457, 0, 0, 0, 1, 1,
-0.5425384, -2.480209, -2.710751, 0, 0, 0, 1, 1,
-0.5422215, 0.1730684, -0.7786483, 0, 0, 0, 1, 1,
-0.5404306, -0.612716, -3.088653, 0, 0, 0, 1, 1,
-0.5400021, 0.8604159, -0.405627, 1, 1, 1, 1, 1,
-0.5368827, -0.2024385, -1.86289, 1, 1, 1, 1, 1,
-0.5261969, 0.06506099, -1.232309, 1, 1, 1, 1, 1,
-0.5259978, 2.151759, -1.563972, 1, 1, 1, 1, 1,
-0.5146063, -0.2357105, -0.799113, 1, 1, 1, 1, 1,
-0.5142061, 0.7662583, -1.753778, 1, 1, 1, 1, 1,
-0.5141815, -0.624588, -3.279364, 1, 1, 1, 1, 1,
-0.5129436, 0.0740287, -0.2491748, 1, 1, 1, 1, 1,
-0.5119812, 0.01140555, -2.062681, 1, 1, 1, 1, 1,
-0.5087473, -0.08089928, -2.995752, 1, 1, 1, 1, 1,
-0.5069435, -0.6117859, -2.723447, 1, 1, 1, 1, 1,
-0.5020294, 2.007401, 1.055341, 1, 1, 1, 1, 1,
-0.4916985, 0.2381429, -0.5215312, 1, 1, 1, 1, 1,
-0.4896689, -0.3241831, -2.95775, 1, 1, 1, 1, 1,
-0.4888176, 0.351976, -1.751119, 1, 1, 1, 1, 1,
-0.487904, 0.1247057, -1.228621, 0, 0, 1, 1, 1,
-0.4855709, -0.4909249, -3.147883, 1, 0, 0, 1, 1,
-0.4854122, 0.6430634, 0.3903912, 1, 0, 0, 1, 1,
-0.4835942, 0.07761737, -3.115135, 1, 0, 0, 1, 1,
-0.4829867, 0.3988332, -1.138743, 1, 0, 0, 1, 1,
-0.4813329, -0.6708892, -1.217193, 1, 0, 0, 1, 1,
-0.4793133, -0.7033087, -3.618899, 0, 0, 0, 1, 1,
-0.4773625, -1.062272, -2.086246, 0, 0, 0, 1, 1,
-0.4761903, 0.1926693, 0.529734, 0, 0, 0, 1, 1,
-0.4752559, -0.03210083, -2.317424, 0, 0, 0, 1, 1,
-0.4708068, -1.720403, -3.538625, 0, 0, 0, 1, 1,
-0.4668836, -0.5958534, -1.665987, 0, 0, 0, 1, 1,
-0.4648054, 0.8197349, -0.6444077, 0, 0, 0, 1, 1,
-0.4623329, -0.2999733, -2.428848, 1, 1, 1, 1, 1,
-0.4576872, 0.9514683, -0.4966222, 1, 1, 1, 1, 1,
-0.4575834, -0.09903648, -3.030589, 1, 1, 1, 1, 1,
-0.4573995, -0.3107764, 0.4696375, 1, 1, 1, 1, 1,
-0.4548632, 1.932691, 1.21984, 1, 1, 1, 1, 1,
-0.4541019, -0.4415045, -1.113705, 1, 1, 1, 1, 1,
-0.4521324, -2.05389, -2.173622, 1, 1, 1, 1, 1,
-0.4508799, -1.498141, -2.332237, 1, 1, 1, 1, 1,
-0.4406967, 0.7228239, -0.5161837, 1, 1, 1, 1, 1,
-0.4395693, -0.8683326, -2.117751, 1, 1, 1, 1, 1,
-0.439093, -0.4807788, -1.980628, 1, 1, 1, 1, 1,
-0.4370324, 0.1906829, -1.50625, 1, 1, 1, 1, 1,
-0.4355488, -1.468539, -4.546358, 1, 1, 1, 1, 1,
-0.4333498, 2.525804, -0.4510392, 1, 1, 1, 1, 1,
-0.4318375, 0.2420605, -0.8816577, 1, 1, 1, 1, 1,
-0.4286479, -0.6154574, -4.814013, 0, 0, 1, 1, 1,
-0.4207857, -1.87258, -2.821257, 1, 0, 0, 1, 1,
-0.4183267, 1.495474, 0.08808674, 1, 0, 0, 1, 1,
-0.4182145, -0.1230577, -1.995, 1, 0, 0, 1, 1,
-0.4166635, 0.2201482, 0.5076992, 1, 0, 0, 1, 1,
-0.4124631, 0.2308893, -1.324099, 1, 0, 0, 1, 1,
-0.4124115, -1.190857, -2.909163, 0, 0, 0, 1, 1,
-0.4098168, 1.322539, 1.362873, 0, 0, 0, 1, 1,
-0.4082954, 0.08639568, -1.240611, 0, 0, 0, 1, 1,
-0.4037147, -0.0349521, -1.600578, 0, 0, 0, 1, 1,
-0.3993998, -1.108696, -4.786656, 0, 0, 0, 1, 1,
-0.3990498, 0.9434208, 0.4831384, 0, 0, 0, 1, 1,
-0.3969217, -1.653292, -3.142796, 0, 0, 0, 1, 1,
-0.3949327, -0.7421467, -3.76891, 1, 1, 1, 1, 1,
-0.3893573, -0.09505399, -2.125487, 1, 1, 1, 1, 1,
-0.3884809, -0.07191816, -3.014015, 1, 1, 1, 1, 1,
-0.3883873, -0.08394556, -3.211538, 1, 1, 1, 1, 1,
-0.3876596, -0.2532735, -2.078759, 1, 1, 1, 1, 1,
-0.3831799, -0.2393017, -1.920734, 1, 1, 1, 1, 1,
-0.376117, -0.08519239, -1.192745, 1, 1, 1, 1, 1,
-0.374289, -0.8037989, -3.916797, 1, 1, 1, 1, 1,
-0.373269, -0.1962308, -1.489088, 1, 1, 1, 1, 1,
-0.3732278, 0.385176, -0.9112152, 1, 1, 1, 1, 1,
-0.3683687, -0.07426204, -0.4484888, 1, 1, 1, 1, 1,
-0.3634228, -0.175652, -1.540634, 1, 1, 1, 1, 1,
-0.3628193, -0.3623066, -2.642502, 1, 1, 1, 1, 1,
-0.3616333, -0.4526748, -3.75567, 1, 1, 1, 1, 1,
-0.3605949, -1.058169, -2.50699, 1, 1, 1, 1, 1,
-0.3599574, -1.507295, -2.978631, 0, 0, 1, 1, 1,
-0.3591645, -0.1015158, -2.358877, 1, 0, 0, 1, 1,
-0.3561108, -0.01837596, -0.5255809, 1, 0, 0, 1, 1,
-0.3539499, 0.1031964, -3.200488, 1, 0, 0, 1, 1,
-0.3519104, -1.050817, -3.286603, 1, 0, 0, 1, 1,
-0.350741, -0.1268975, -1.514824, 1, 0, 0, 1, 1,
-0.3487014, -0.8594793, -2.166152, 0, 0, 0, 1, 1,
-0.3440365, 1.146303, -0.3253382, 0, 0, 0, 1, 1,
-0.3421967, -0.4620915, -2.301864, 0, 0, 0, 1, 1,
-0.3391535, -0.3082967, -1.581602, 0, 0, 0, 1, 1,
-0.3384003, 2.474574, -1.717235, 0, 0, 0, 1, 1,
-0.3317648, 0.654238, -0.4051856, 0, 0, 0, 1, 1,
-0.328397, 1.29898, 0.3407064, 0, 0, 0, 1, 1,
-0.327177, -1.132838, -3.36692, 1, 1, 1, 1, 1,
-0.3265565, -0.6411434, -0.7748883, 1, 1, 1, 1, 1,
-0.3239091, 0.05170262, -0.9848994, 1, 1, 1, 1, 1,
-0.3200307, 0.7269447, -0.2840504, 1, 1, 1, 1, 1,
-0.3185133, -0.03408876, -1.184379, 1, 1, 1, 1, 1,
-0.3176146, -0.3721263, -2.448368, 1, 1, 1, 1, 1,
-0.3074312, -0.1285695, -2.859134, 1, 1, 1, 1, 1,
-0.3067429, -0.17167, -2.308932, 1, 1, 1, 1, 1,
-0.3066667, 0.113928, 0.496935, 1, 1, 1, 1, 1,
-0.3046803, -1.199809, -3.133592, 1, 1, 1, 1, 1,
-0.2951228, -0.5328222, -5.786559, 1, 1, 1, 1, 1,
-0.2906822, 1.503982, 0.9941218, 1, 1, 1, 1, 1,
-0.2898535, 0.7046854, -1.819551, 1, 1, 1, 1, 1,
-0.2881383, 2.06475, 1.820315, 1, 1, 1, 1, 1,
-0.2806906, 0.9284557, -0.9392518, 1, 1, 1, 1, 1,
-0.2715968, -0.1782559, -2.238415, 0, 0, 1, 1, 1,
-0.2665807, 0.5100955, -0.08826858, 1, 0, 0, 1, 1,
-0.2656862, 0.3569795, -1.609629, 1, 0, 0, 1, 1,
-0.2571658, 1.013927, -1.36734, 1, 0, 0, 1, 1,
-0.2567221, -0.07365698, -2.511808, 1, 0, 0, 1, 1,
-0.2449369, 0.2213852, -1.757038, 1, 0, 0, 1, 1,
-0.2414286, -0.2128501, -1.381506, 0, 0, 0, 1, 1,
-0.2404873, -1.795885, -3.545319, 0, 0, 0, 1, 1,
-0.2402453, 1.616927, 0.01133353, 0, 0, 0, 1, 1,
-0.2323316, 0.7437288, -1.955597, 0, 0, 0, 1, 1,
-0.2290867, 0.8428974, -1.888399, 0, 0, 0, 1, 1,
-0.2278227, 0.7456717, -1.580839, 0, 0, 0, 1, 1,
-0.2210263, -0.5447888, -3.734399, 0, 0, 0, 1, 1,
-0.2189409, -1.550569, -3.956869, 1, 1, 1, 1, 1,
-0.2183806, 1.015357, -1.758655, 1, 1, 1, 1, 1,
-0.216739, 0.3463036, 0.8024227, 1, 1, 1, 1, 1,
-0.216205, 0.2397346, 1.212871, 1, 1, 1, 1, 1,
-0.2136073, 0.4927577, -0.08388489, 1, 1, 1, 1, 1,
-0.2080056, -0.368148, -3.596316, 1, 1, 1, 1, 1,
-0.20755, -0.226097, -1.969437, 1, 1, 1, 1, 1,
-0.2022527, 0.2330029, -1.432487, 1, 1, 1, 1, 1,
-0.1994419, 1.370187, -0.3419478, 1, 1, 1, 1, 1,
-0.198585, 1.215897, 0.8460552, 1, 1, 1, 1, 1,
-0.19555, -1.370843, -2.564926, 1, 1, 1, 1, 1,
-0.194688, -0.8626547, -4.109673, 1, 1, 1, 1, 1,
-0.1881918, 1.805233, 0.6647662, 1, 1, 1, 1, 1,
-0.1839187, -0.4482972, -4.042212, 1, 1, 1, 1, 1,
-0.1824347, 0.6912051, -1.197285, 1, 1, 1, 1, 1,
-0.1814142, -1.826666, -2.254791, 0, 0, 1, 1, 1,
-0.1794556, -0.5061321, -2.090689, 1, 0, 0, 1, 1,
-0.1788263, 0.3285677, -2.859286, 1, 0, 0, 1, 1,
-0.1781962, -0.4461929, -1.001846, 1, 0, 0, 1, 1,
-0.1771868, -0.06989679, -2.243624, 1, 0, 0, 1, 1,
-0.1646701, -0.3614423, -1.65085, 1, 0, 0, 1, 1,
-0.1638733, 0.1434221, -0.9737852, 0, 0, 0, 1, 1,
-0.1636192, 1.256498, -0.862106, 0, 0, 0, 1, 1,
-0.1621414, 0.3967052, -1.019046, 0, 0, 0, 1, 1,
-0.1602293, 1.310474, -0.2908225, 0, 0, 0, 1, 1,
-0.1597668, 0.008495443, -1.736388, 0, 0, 0, 1, 1,
-0.1578159, -0.6346592, -3.452875, 0, 0, 0, 1, 1,
-0.1566741, -0.2019736, -1.299053, 0, 0, 0, 1, 1,
-0.1566081, 0.336419, -0.1206766, 1, 1, 1, 1, 1,
-0.1538467, 0.4589416, -0.6451274, 1, 1, 1, 1, 1,
-0.1493683, -0.3020961, -3.645706, 1, 1, 1, 1, 1,
-0.1480485, 1.211378, 0.689098, 1, 1, 1, 1, 1,
-0.1454223, 0.949172, 0.3824739, 1, 1, 1, 1, 1,
-0.145111, -1.067208, -4.070685, 1, 1, 1, 1, 1,
-0.1443321, -0.47126, -3.425572, 1, 1, 1, 1, 1,
-0.142658, 0.4017829, 1.193743, 1, 1, 1, 1, 1,
-0.1414804, 0.02282442, -1.458259, 1, 1, 1, 1, 1,
-0.1395869, 0.4641323, -1.014774, 1, 1, 1, 1, 1,
-0.1364831, -0.2496694, -3.15784, 1, 1, 1, 1, 1,
-0.1350014, -1.192892, -2.276858, 1, 1, 1, 1, 1,
-0.1347501, 0.283737, -0.3943441, 1, 1, 1, 1, 1,
-0.1298576, -0.06935523, -1.818377, 1, 1, 1, 1, 1,
-0.1294763, -0.6934685, -3.123481, 1, 1, 1, 1, 1,
-0.1278917, 1.241991, 0.3533804, 0, 0, 1, 1, 1,
-0.1275552, 0.6203423, 0.8036139, 1, 0, 0, 1, 1,
-0.1263913, -0.3475399, -2.539591, 1, 0, 0, 1, 1,
-0.1251037, -2.06766, -3.456578, 1, 0, 0, 1, 1,
-0.1230457, -1.786395, -4.056091, 1, 0, 0, 1, 1,
-0.1224913, 0.3190145, 0.2557471, 1, 0, 0, 1, 1,
-0.1162221, -0.4904147, -2.839965, 0, 0, 0, 1, 1,
-0.115189, -0.9150942, -5.232914, 0, 0, 0, 1, 1,
-0.1143586, 0.1533461, 0.5092349, 0, 0, 0, 1, 1,
-0.1106623, -0.006237836, 0.742336, 0, 0, 0, 1, 1,
-0.1092488, -1.089538, -3.4824, 0, 0, 0, 1, 1,
-0.1047011, -0.8652593, -4.252777, 0, 0, 0, 1, 1,
-0.1005034, -1.528337, -3.967105, 0, 0, 0, 1, 1,
-0.09920543, -1.475151, -4.789857, 1, 1, 1, 1, 1,
-0.09827364, -1.055823, -2.917001, 1, 1, 1, 1, 1,
-0.09751255, 1.068595, -1.650313, 1, 1, 1, 1, 1,
-0.09305398, 0.8109197, -1.619541, 1, 1, 1, 1, 1,
-0.08859169, 1.830727, -0.8490025, 1, 1, 1, 1, 1,
-0.07471035, -0.3010696, -3.958379, 1, 1, 1, 1, 1,
-0.07401066, 1.51582, -2.490359, 1, 1, 1, 1, 1,
-0.07141899, -1.414734, -3.161354, 1, 1, 1, 1, 1,
-0.07119516, 1.318813, -1.341773, 1, 1, 1, 1, 1,
-0.06892835, -1.894577, -1.647309, 1, 1, 1, 1, 1,
-0.06575709, -0.8132173, -5.04448, 1, 1, 1, 1, 1,
-0.06485473, 0.657784, -1.434684, 1, 1, 1, 1, 1,
-0.06302005, 2.983501, -1.490979, 1, 1, 1, 1, 1,
-0.05166857, 0.6274213, 0.2353107, 1, 1, 1, 1, 1,
-0.05088838, 0.1162351, 0.6402907, 1, 1, 1, 1, 1,
-0.05088137, -0.3663245, -2.805074, 0, 0, 1, 1, 1,
-0.04903148, -0.7222746, -5.102835, 1, 0, 0, 1, 1,
-0.04857054, -0.2634864, -4.214011, 1, 0, 0, 1, 1,
-0.04843532, 0.2058727, -0.6989921, 1, 0, 0, 1, 1,
-0.04803589, -0.009790538, -0.541752, 1, 0, 0, 1, 1,
-0.04534929, 0.890506, -0.003783765, 1, 0, 0, 1, 1,
-0.04003774, -0.6935021, -3.738237, 0, 0, 0, 1, 1,
-0.03628599, -0.9500036, -1.981669, 0, 0, 0, 1, 1,
-0.03237728, 0.9655225, -0.5617062, 0, 0, 0, 1, 1,
-0.03169035, 0.3616775, 0.2583269, 0, 0, 0, 1, 1,
-0.03166622, -0.7622446, -3.862252, 0, 0, 0, 1, 1,
-0.0315276, -0.09425797, -3.231704, 0, 0, 0, 1, 1,
-0.0297339, -1.132316, -3.019667, 0, 0, 0, 1, 1,
-0.02770117, 1.494855, 0.9100259, 1, 1, 1, 1, 1,
-0.0243024, -0.3915941, -3.376864, 1, 1, 1, 1, 1,
-0.02408218, 0.3880576, 0.4655666, 1, 1, 1, 1, 1,
-0.02293032, -1.320663, -4.109314, 1, 1, 1, 1, 1,
-0.02204075, -0.8537778, -2.463593, 1, 1, 1, 1, 1,
-0.02112659, -1.066979, -3.796568, 1, 1, 1, 1, 1,
-0.01496596, 0.4657578, -0.2439186, 1, 1, 1, 1, 1,
-0.007847427, -0.08492997, -4.353625, 1, 1, 1, 1, 1,
-0.007847271, -0.7143142, -1.602272, 1, 1, 1, 1, 1,
-0.007595635, 2.870173, -1.780901, 1, 1, 1, 1, 1,
-0.006103164, 1.369444, -0.7605811, 1, 1, 1, 1, 1,
-0.001362191, 0.003106439, 1.382238, 1, 1, 1, 1, 1,
0.001028705, -1.331308, 3.678741, 1, 1, 1, 1, 1,
0.003025463, 0.04240973, 0.8401001, 1, 1, 1, 1, 1,
0.004688928, 0.01141685, 1.146125, 1, 1, 1, 1, 1,
0.005193682, -0.106097, 0.8290362, 0, 0, 1, 1, 1,
0.005526051, -0.4835099, 3.65621, 1, 0, 0, 1, 1,
0.005755977, 1.69969, 0.8674254, 1, 0, 0, 1, 1,
0.006937769, -0.5347056, 1.23722, 1, 0, 0, 1, 1,
0.008088127, 1.969643, -0.2443884, 1, 0, 0, 1, 1,
0.008796767, -0.4156213, 3.445472, 1, 0, 0, 1, 1,
0.01274431, 0.2302742, 0.2035774, 0, 0, 0, 1, 1,
0.01569646, -0.1543735, 3.229002, 0, 0, 0, 1, 1,
0.01609007, 0.07337378, -0.9982108, 0, 0, 0, 1, 1,
0.01617632, 1.602374, -0.6578047, 0, 0, 0, 1, 1,
0.02211761, 1.988443, -0.1463983, 0, 0, 0, 1, 1,
0.02366378, 0.1461253, -2.888004, 0, 0, 0, 1, 1,
0.02801908, -0.3490282, 4.792239, 0, 0, 0, 1, 1,
0.02860337, -1.299854, 5.332257, 1, 1, 1, 1, 1,
0.02941845, 0.4274355, 1.432357, 1, 1, 1, 1, 1,
0.03597874, -0.5956094, 3.019279, 1, 1, 1, 1, 1,
0.04308476, -0.2508555, 2.599922, 1, 1, 1, 1, 1,
0.04698943, -0.6232474, 3.471444, 1, 1, 1, 1, 1,
0.04743533, 0.8355857, -1.232937, 1, 1, 1, 1, 1,
0.04956108, 0.7097579, 0.4932493, 1, 1, 1, 1, 1,
0.051023, -0.514392, 1.792644, 1, 1, 1, 1, 1,
0.05210897, 0.3251685, 0.3674096, 1, 1, 1, 1, 1,
0.05336874, -1.091967, 3.382735, 1, 1, 1, 1, 1,
0.05487398, -1.084676, 2.494938, 1, 1, 1, 1, 1,
0.06149184, 0.8359503, 0.9974362, 1, 1, 1, 1, 1,
0.06222931, -0.4668856, 4.300097, 1, 1, 1, 1, 1,
0.06282754, -0.2016583, 3.726853, 1, 1, 1, 1, 1,
0.06671197, -1.245826, 3.843446, 1, 1, 1, 1, 1,
0.06769627, -0.6409236, 4.057714, 0, 0, 1, 1, 1,
0.07070425, -1.627291, 3.095432, 1, 0, 0, 1, 1,
0.07336701, -2.039567, 3.450973, 1, 0, 0, 1, 1,
0.07427214, -0.9518604, 4.079123, 1, 0, 0, 1, 1,
0.07904871, -1.4712, 1.795595, 1, 0, 0, 1, 1,
0.08058935, -0.5846444, 2.660843, 1, 0, 0, 1, 1,
0.08148694, -0.09802309, 3.499116, 0, 0, 0, 1, 1,
0.08245722, -1.986868, 1.973123, 0, 0, 0, 1, 1,
0.08571805, -0.6849301, 3.102284, 0, 0, 0, 1, 1,
0.09144326, 1.87933, -0.3599872, 0, 0, 0, 1, 1,
0.09611873, -0.1340394, 2.067633, 0, 0, 0, 1, 1,
0.09773669, -2.004719, 2.068728, 0, 0, 0, 1, 1,
0.09957967, -0.2388446, 3.475678, 0, 0, 0, 1, 1,
0.09996469, 1.564708, -0.3143837, 1, 1, 1, 1, 1,
0.1064651, -0.7915938, 2.063642, 1, 1, 1, 1, 1,
0.1068413, 2.233818, -1.208971, 1, 1, 1, 1, 1,
0.110461, 1.924092, -0.164484, 1, 1, 1, 1, 1,
0.1160369, -0.2469144, 4.301512, 1, 1, 1, 1, 1,
0.1164406, 1.207783, 2.136978, 1, 1, 1, 1, 1,
0.1197153, 1.356917, 0.4313424, 1, 1, 1, 1, 1,
0.1206456, -0.9168154, 2.224632, 1, 1, 1, 1, 1,
0.1213, -0.1725577, 2.257416, 1, 1, 1, 1, 1,
0.122689, 0.6996679, 0.1979428, 1, 1, 1, 1, 1,
0.1268963, 1.016906, 1.770026, 1, 1, 1, 1, 1,
0.1283528, -1.938492, 2.390566, 1, 1, 1, 1, 1,
0.1337175, -0.4710214, 3.218001, 1, 1, 1, 1, 1,
0.1341854, 1.169083, -2.992542, 1, 1, 1, 1, 1,
0.1347861, -0.49055, 2.19352, 1, 1, 1, 1, 1,
0.1349869, -0.1773783, 1.195448, 0, 0, 1, 1, 1,
0.1354327, -1.706476, 3.572626, 1, 0, 0, 1, 1,
0.1396124, -0.9044399, 1.072541, 1, 0, 0, 1, 1,
0.1408124, 0.3541056, -0.9388706, 1, 0, 0, 1, 1,
0.1455241, 1.60067, 1.611625, 1, 0, 0, 1, 1,
0.1502415, -0.06491151, 1.633443, 1, 0, 0, 1, 1,
0.1514434, 1.151407, -0.8685741, 0, 0, 0, 1, 1,
0.1526305, -1.047406, 4.257254, 0, 0, 0, 1, 1,
0.1537659, 1.357036, 0.584976, 0, 0, 0, 1, 1,
0.1541121, -0.7587512, 3.613353, 0, 0, 0, 1, 1,
0.1542164, -0.74641, 4.042064, 0, 0, 0, 1, 1,
0.1557037, -0.9762843, 1.895, 0, 0, 0, 1, 1,
0.1622226, 0.3491698, 2.64036, 0, 0, 0, 1, 1,
0.1650349, 1.341453, -0.4844386, 1, 1, 1, 1, 1,
0.16736, -0.9667315, 2.439295, 1, 1, 1, 1, 1,
0.1715605, 1.100649, -0.6428972, 1, 1, 1, 1, 1,
0.1749392, -1.035907, 2.455374, 1, 1, 1, 1, 1,
0.1756044, 0.495776, 2.422936, 1, 1, 1, 1, 1,
0.1756652, 0.7601297, 0.4819884, 1, 1, 1, 1, 1,
0.1786111, -0.1655523, 1.786018, 1, 1, 1, 1, 1,
0.1806338, 0.03188382, 0.2907126, 1, 1, 1, 1, 1,
0.1813548, 0.390479, 0.9555069, 1, 1, 1, 1, 1,
0.1845779, -0.38804, 1.930115, 1, 1, 1, 1, 1,
0.1910728, 1.392373, 0.4780465, 1, 1, 1, 1, 1,
0.1912053, -0.04569498, 1.157645, 1, 1, 1, 1, 1,
0.1937358, 1.481277, -0.5270448, 1, 1, 1, 1, 1,
0.20011, 0.7382921, 0.948712, 1, 1, 1, 1, 1,
0.2017847, -0.661678, 2.499131, 1, 1, 1, 1, 1,
0.2031321, 1.446623, -0.4094194, 0, 0, 1, 1, 1,
0.2056275, -0.6544763, 3.018434, 1, 0, 0, 1, 1,
0.2095999, 0.9218773, 1.050525, 1, 0, 0, 1, 1,
0.2096788, 0.8681825, -1.548699, 1, 0, 0, 1, 1,
0.2174384, -0.7868599, 3.276023, 1, 0, 0, 1, 1,
0.2245511, 0.6953019, -0.2783832, 1, 0, 0, 1, 1,
0.2288414, 1.772155, 1.572779, 0, 0, 0, 1, 1,
0.2297105, 1.598174, -0.6575167, 0, 0, 0, 1, 1,
0.2307797, -0.549123, 1.535781, 0, 0, 0, 1, 1,
0.2325604, 0.1620287, -0.2030571, 0, 0, 0, 1, 1,
0.2328124, -1.545078, 3.726092, 0, 0, 0, 1, 1,
0.2350826, -0.1435243, 1.358439, 0, 0, 0, 1, 1,
0.2404446, 0.38769, -1.173032, 0, 0, 0, 1, 1,
0.2434415, 0.30393, 0.9310676, 1, 1, 1, 1, 1,
0.2445611, 0.2403162, 0.07328656, 1, 1, 1, 1, 1,
0.2453505, -0.06651183, 1.365335, 1, 1, 1, 1, 1,
0.2503916, -1.331475, 2.530337, 1, 1, 1, 1, 1,
0.2509555, -0.4055025, 1.920709, 1, 1, 1, 1, 1,
0.2535859, -1.310297, 3.094121, 1, 1, 1, 1, 1,
0.254055, -0.424243, 3.212666, 1, 1, 1, 1, 1,
0.2584061, 0.1273808, 0.6448355, 1, 1, 1, 1, 1,
0.2610366, -0.6038225, 2.226669, 1, 1, 1, 1, 1,
0.2627386, -1.759506, 2.749905, 1, 1, 1, 1, 1,
0.2644105, 1.271452, -0.09143362, 1, 1, 1, 1, 1,
0.2670262, 0.4167142, 0.381416, 1, 1, 1, 1, 1,
0.272951, -0.1329454, 1.512696, 1, 1, 1, 1, 1,
0.2743997, -0.1474572, 2.748212, 1, 1, 1, 1, 1,
0.2747516, 0.3361985, 0.5557952, 1, 1, 1, 1, 1,
0.2777024, 1.330116, 1.228192, 0, 0, 1, 1, 1,
0.2821198, -0.7159016, 3.499644, 1, 0, 0, 1, 1,
0.2841485, 0.8068929, -0.9250671, 1, 0, 0, 1, 1,
0.2866659, -0.551235, 3.006885, 1, 0, 0, 1, 1,
0.2881175, 0.8540788, -0.199895, 1, 0, 0, 1, 1,
0.2941614, -1.492176, 2.152277, 1, 0, 0, 1, 1,
0.2967208, -1.035379, 4.327825, 0, 0, 0, 1, 1,
0.2975863, -1.737371, 1.769142, 0, 0, 0, 1, 1,
0.2985984, 1.226324, -0.9919412, 0, 0, 0, 1, 1,
0.305178, 2.672153, 0.468019, 0, 0, 0, 1, 1,
0.3107632, 1.061447, 0.04645044, 0, 0, 0, 1, 1,
0.3139782, -0.1734561, 2.023053, 0, 0, 0, 1, 1,
0.3153213, -1.873719, 1.757692, 0, 0, 0, 1, 1,
0.3199845, 0.5333169, 0.4265732, 1, 1, 1, 1, 1,
0.3217852, -0.5700906, 1.851682, 1, 1, 1, 1, 1,
0.3238595, -0.01631377, 2.176299, 1, 1, 1, 1, 1,
0.3251066, -0.06727113, 4.062806, 1, 1, 1, 1, 1,
0.3262778, 1.658738, -0.3455426, 1, 1, 1, 1, 1,
0.3268512, -1.48431, 3.737961, 1, 1, 1, 1, 1,
0.3335712, -1.028298, 4.137025, 1, 1, 1, 1, 1,
0.3407144, -0.1240672, 0.4068622, 1, 1, 1, 1, 1,
0.3423695, 1.671078, -0.6381656, 1, 1, 1, 1, 1,
0.3468933, 0.03678929, 2.494625, 1, 1, 1, 1, 1,
0.3485407, -0.3162271, 1.177076, 1, 1, 1, 1, 1,
0.348654, -1.628397, 2.431897, 1, 1, 1, 1, 1,
0.3535458, -3.105544, 2.701678, 1, 1, 1, 1, 1,
0.3543431, 0.9149264, 2.569746, 1, 1, 1, 1, 1,
0.3549036, -1.925251, 0.4697824, 1, 1, 1, 1, 1,
0.356411, 0.5986576, 0.1255116, 0, 0, 1, 1, 1,
0.3613264, 0.41957, -0.9626271, 1, 0, 0, 1, 1,
0.3632745, 0.182046, -0.7755474, 1, 0, 0, 1, 1,
0.3637694, 1.257554, 0.6479268, 1, 0, 0, 1, 1,
0.3685281, 1.675813, 2.264389, 1, 0, 0, 1, 1,
0.381036, -2.14538, 2.887919, 1, 0, 0, 1, 1,
0.3851585, -2.364904, 3.708696, 0, 0, 0, 1, 1,
0.3867483, -1.373496, 4.942341, 0, 0, 0, 1, 1,
0.3872706, -1.575956, 2.972438, 0, 0, 0, 1, 1,
0.392479, -1.310054, 4.12545, 0, 0, 0, 1, 1,
0.4003094, -0.4258699, 3.38987, 0, 0, 0, 1, 1,
0.4009278, 0.327014, 0.7370369, 0, 0, 0, 1, 1,
0.407316, -1.770642, 3.468832, 0, 0, 0, 1, 1,
0.4086507, -1.774498, 4.248792, 1, 1, 1, 1, 1,
0.4115918, -0.1447382, 1.672428, 1, 1, 1, 1, 1,
0.4124382, 1.670009, 0.668928, 1, 1, 1, 1, 1,
0.4128991, 0.6128412, 0.4225597, 1, 1, 1, 1, 1,
0.413055, -1.034181, 1.04435, 1, 1, 1, 1, 1,
0.4143781, 0.4473333, 1.419562, 1, 1, 1, 1, 1,
0.4173627, -1.348353, 4.69252, 1, 1, 1, 1, 1,
0.4191645, -0.4664682, 2.563725, 1, 1, 1, 1, 1,
0.4208711, -1.876194, 2.969056, 1, 1, 1, 1, 1,
0.4208758, 0.5000333, -0.1579794, 1, 1, 1, 1, 1,
0.4225942, 0.7646393, 2.537822, 1, 1, 1, 1, 1,
0.4228418, -0.9498807, 1.789902, 1, 1, 1, 1, 1,
0.4255092, 1.56518, -0.3426497, 1, 1, 1, 1, 1,
0.4259534, 0.3263971, 0.5074328, 1, 1, 1, 1, 1,
0.4288088, 0.8374076, 2.32173, 1, 1, 1, 1, 1,
0.4297292, -0.3197291, 1.200068, 0, 0, 1, 1, 1,
0.430684, 0.1688536, 0.9014715, 1, 0, 0, 1, 1,
0.4353571, 0.04678462, 1.893909, 1, 0, 0, 1, 1,
0.4387877, 0.4218947, 0.4170179, 1, 0, 0, 1, 1,
0.4404748, 0.6503652, 0.541873, 1, 0, 0, 1, 1,
0.4407797, 0.3906434, 2.332166, 1, 0, 0, 1, 1,
0.4410927, -0.1218908, 2.099589, 0, 0, 0, 1, 1,
0.4410971, -0.1882325, 1.33614, 0, 0, 0, 1, 1,
0.4458929, 0.2658902, 0.6350566, 0, 0, 0, 1, 1,
0.4473625, -1.357361, 4.042233, 0, 0, 0, 1, 1,
0.448565, 2.418681, -0.201513, 0, 0, 0, 1, 1,
0.4487963, -0.09303402, 1.402755, 0, 0, 0, 1, 1,
0.4539032, 0.2015298, 1.908137, 0, 0, 0, 1, 1,
0.4539315, 0.3983349, -0.3820213, 1, 1, 1, 1, 1,
0.4544691, -1.065444, 2.549195, 1, 1, 1, 1, 1,
0.4553308, -0.3036126, 1.318216, 1, 1, 1, 1, 1,
0.4571731, 1.12441, -0.3273461, 1, 1, 1, 1, 1,
0.4588574, 0.00915706, 1.658521, 1, 1, 1, 1, 1,
0.4597432, 0.3927776, 1.625172, 1, 1, 1, 1, 1,
0.4613242, 1.401744, 0.9211738, 1, 1, 1, 1, 1,
0.4654863, 0.04798033, -0.3233348, 1, 1, 1, 1, 1,
0.4682071, -1.523191, 1.119902, 1, 1, 1, 1, 1,
0.4725113, -1.466092, 2.776115, 1, 1, 1, 1, 1,
0.4775733, -1.277608, 1.225259, 1, 1, 1, 1, 1,
0.4854257, -0.1967234, 2.76897, 1, 1, 1, 1, 1,
0.4929569, -0.1826486, 1.707401, 1, 1, 1, 1, 1,
0.4944373, -1.589169, 3.191573, 1, 1, 1, 1, 1,
0.4977411, -0.8824266, 2.714754, 1, 1, 1, 1, 1,
0.4999131, -0.22682, 1.537589, 0, 0, 1, 1, 1,
0.5020744, 0.4326568, 2.503687, 1, 0, 0, 1, 1,
0.5055024, 0.6326175, -0.3764952, 1, 0, 0, 1, 1,
0.5065255, -0.09909835, 1.499196, 1, 0, 0, 1, 1,
0.5082099, 1.836798, 0.6014757, 1, 0, 0, 1, 1,
0.5122712, 0.01561324, 1.189555, 1, 0, 0, 1, 1,
0.5141562, -1.564273, 3.6697, 0, 0, 0, 1, 1,
0.5163949, -0.8524369, 2.430083, 0, 0, 0, 1, 1,
0.5196392, 0.2002103, 1.781226, 0, 0, 0, 1, 1,
0.5207779, 0.7361384, 1.159487, 0, 0, 0, 1, 1,
0.528663, -0.930019, 2.615022, 0, 0, 0, 1, 1,
0.529068, 1.375411, -1.772806, 0, 0, 0, 1, 1,
0.5293831, 0.6740854, 0.3644997, 0, 0, 0, 1, 1,
0.5349215, 0.1536448, 0.6470769, 1, 1, 1, 1, 1,
0.535165, 1.179257, 0.8201129, 1, 1, 1, 1, 1,
0.5366524, -0.5974979, 2.503467, 1, 1, 1, 1, 1,
0.538826, 0.05543778, 0.3659437, 1, 1, 1, 1, 1,
0.5401874, -0.6817632, 2.852992, 1, 1, 1, 1, 1,
0.5408452, 0.5385641, 0.6173114, 1, 1, 1, 1, 1,
0.5413547, -0.1008798, 1.225719, 1, 1, 1, 1, 1,
0.5468218, 0.7749234, 1.213178, 1, 1, 1, 1, 1,
0.5469077, 0.1277302, 1.411746, 1, 1, 1, 1, 1,
0.5479689, 1.042449, 0.7823883, 1, 1, 1, 1, 1,
0.5521601, 0.3968213, 1.088116, 1, 1, 1, 1, 1,
0.5555667, -1.079107, 3.250937, 1, 1, 1, 1, 1,
0.5570986, -0.1560138, 2.392359, 1, 1, 1, 1, 1,
0.559907, -0.05278202, 2.112756, 1, 1, 1, 1, 1,
0.5634037, 0.4715996, -0.8579162, 1, 1, 1, 1, 1,
0.5654839, 0.6291884, 1.844207, 0, 0, 1, 1, 1,
0.5735804, 0.2036519, -0.1126768, 1, 0, 0, 1, 1,
0.573639, -0.7707073, 1.338582, 1, 0, 0, 1, 1,
0.5802475, -0.8936098, 1.420154, 1, 0, 0, 1, 1,
0.5875154, -0.9145687, 2.472329, 1, 0, 0, 1, 1,
0.5906618, 0.4020141, 0.2673526, 1, 0, 0, 1, 1,
0.5908031, 0.6595324, 0.6407995, 0, 0, 0, 1, 1,
0.5945165, -2.452756, 3.776508, 0, 0, 0, 1, 1,
0.5959947, 0.647382, 2.018107, 0, 0, 0, 1, 1,
0.6024642, -0.5056905, 2.24556, 0, 0, 0, 1, 1,
0.6029657, -1.846569, 3.566498, 0, 0, 0, 1, 1,
0.6036263, -0.1188453, 1.902986, 0, 0, 0, 1, 1,
0.6079878, -0.5355237, 4.223447, 0, 0, 0, 1, 1,
0.6120995, -0.3993547, 1.356515, 1, 1, 1, 1, 1,
0.613035, -0.6595832, 2.990113, 1, 1, 1, 1, 1,
0.624379, -1.25957, 2.845852, 1, 1, 1, 1, 1,
0.6256754, 1.348719, 1.830771, 1, 1, 1, 1, 1,
0.6300913, -1.649606, 3.7312, 1, 1, 1, 1, 1,
0.6311759, -1.445129, 3.012915, 1, 1, 1, 1, 1,
0.6323608, -1.394442, 2.443833, 1, 1, 1, 1, 1,
0.6424223, 0.5748217, 2.113471, 1, 1, 1, 1, 1,
0.6430369, 0.3393235, 1.548386, 1, 1, 1, 1, 1,
0.643413, -1.944725, 3.306597, 1, 1, 1, 1, 1,
0.6451733, -1.158266, 3.450668, 1, 1, 1, 1, 1,
0.6462162, -0.7681525, 1.031387, 1, 1, 1, 1, 1,
0.6489582, 0.3350165, 1.557753, 1, 1, 1, 1, 1,
0.6589462, -1.100293, 3.090278, 1, 1, 1, 1, 1,
0.6672068, -1.26123, 1.715695, 1, 1, 1, 1, 1,
0.6693685, 0.9645137, 1.37393, 0, 0, 1, 1, 1,
0.6747539, 0.3472843, 1.721187, 1, 0, 0, 1, 1,
0.6762391, 0.7030132, 0.5254707, 1, 0, 0, 1, 1,
0.6767904, 0.5333437, 2.664014, 1, 0, 0, 1, 1,
0.6771763, 0.9959641, 0.7761384, 1, 0, 0, 1, 1,
0.6778082, -2.02034, 2.896347, 1, 0, 0, 1, 1,
0.6947136, 1.73456, -0.5480922, 0, 0, 0, 1, 1,
0.6951466, -1.108788, 2.635847, 0, 0, 0, 1, 1,
0.6963642, 0.8488399, -0.2686062, 0, 0, 0, 1, 1,
0.7076691, 0.4273729, 1.497908, 0, 0, 0, 1, 1,
0.7148555, -1.920772, 2.530644, 0, 0, 0, 1, 1,
0.7207069, 1.562139, -0.2508008, 0, 0, 0, 1, 1,
0.7237393, -0.244721, 1.178524, 0, 0, 0, 1, 1,
0.7248473, 1.073451, 0.9121003, 1, 1, 1, 1, 1,
0.728277, 0.1362456, 0.6981729, 1, 1, 1, 1, 1,
0.7304015, 0.1449409, 1.923783, 1, 1, 1, 1, 1,
0.7313013, -0.5386906, 3.297748, 1, 1, 1, 1, 1,
0.734414, 1.187284, 0.2093738, 1, 1, 1, 1, 1,
0.7399926, -0.2379816, 1.75416, 1, 1, 1, 1, 1,
0.7458309, -1.037272, 2.381106, 1, 1, 1, 1, 1,
0.747176, -1.608687, 0.5842398, 1, 1, 1, 1, 1,
0.7494628, 1.284168, -0.6522432, 1, 1, 1, 1, 1,
0.7496883, 0.7655977, 1.920375, 1, 1, 1, 1, 1,
0.7514786, 0.2225033, 1.206031, 1, 1, 1, 1, 1,
0.7526323, -0.2517551, 1.774019, 1, 1, 1, 1, 1,
0.7531385, -0.2491598, 1.870306, 1, 1, 1, 1, 1,
0.758911, 1.684484, -0.1869149, 1, 1, 1, 1, 1,
0.7618335, -1.408542, 3.724331, 1, 1, 1, 1, 1,
0.7633091, 1.724038, -0.4992175, 0, 0, 1, 1, 1,
0.7754855, 1.523435, -0.3858912, 1, 0, 0, 1, 1,
0.7837359, -1.03516, 2.041577, 1, 0, 0, 1, 1,
0.7848693, -1.042158, 2.730654, 1, 0, 0, 1, 1,
0.7939568, -0.706661, 1.733131, 1, 0, 0, 1, 1,
0.8099868, 0.5034238, -1.650563, 1, 0, 0, 1, 1,
0.8152439, -1.250867, 1.23884, 0, 0, 0, 1, 1,
0.8171112, -0.115307, 0.7552034, 0, 0, 0, 1, 1,
0.8178762, -1.490316, 2.078438, 0, 0, 0, 1, 1,
0.8209374, 0.6107938, 1.896666, 0, 0, 0, 1, 1,
0.8213943, -0.5516519, 1.138673, 0, 0, 0, 1, 1,
0.8230912, -0.2079807, 2.09391, 0, 0, 0, 1, 1,
0.82683, 1.120589, 0.6627253, 0, 0, 0, 1, 1,
0.8297135, 0.2992776, 1.165072, 1, 1, 1, 1, 1,
0.8358986, 0.06264019, 0.4254028, 1, 1, 1, 1, 1,
0.8402302, 0.286449, 2.444741, 1, 1, 1, 1, 1,
0.8410029, 1.088323, -0.3483308, 1, 1, 1, 1, 1,
0.842266, 0.2875111, 0.1374888, 1, 1, 1, 1, 1,
0.8453327, -1.302622, 3.424817, 1, 1, 1, 1, 1,
0.8454273, 1.04311, 2.154919, 1, 1, 1, 1, 1,
0.8538975, 0.4378231, 0.3531458, 1, 1, 1, 1, 1,
0.856858, 0.2396561, 1.283297, 1, 1, 1, 1, 1,
0.8573158, 0.4363916, 1.340782, 1, 1, 1, 1, 1,
0.8577585, -0.045142, 0.7041134, 1, 1, 1, 1, 1,
0.8860143, -0.3859296, 0.7096241, 1, 1, 1, 1, 1,
0.8874938, -0.8280025, 2.675037, 1, 1, 1, 1, 1,
0.8927804, -1.249884, 2.137672, 1, 1, 1, 1, 1,
0.8941827, -1.131212, 1.694377, 1, 1, 1, 1, 1,
0.8962248, 0.281812, 1.303674, 0, 0, 1, 1, 1,
0.8962994, 1.403575, 0.1475037, 1, 0, 0, 1, 1,
0.9039752, 0.119718, 0.9270903, 1, 0, 0, 1, 1,
0.9080225, 1.26219, 1.292581, 1, 0, 0, 1, 1,
0.9106069, -0.3087224, 3.804697, 1, 0, 0, 1, 1,
0.9122244, 0.2367592, 0.5298558, 1, 0, 0, 1, 1,
0.915306, 0.6738935, -0.163988, 0, 0, 0, 1, 1,
0.9169567, 1.755699, 2.892899, 0, 0, 0, 1, 1,
0.9172366, -0.5639158, 3.19522, 0, 0, 0, 1, 1,
0.9262902, 0.3026229, 0.8057958, 0, 0, 0, 1, 1,
0.9276504, 0.194591, 2.450127, 0, 0, 0, 1, 1,
0.9280377, -0.1344021, 0.810648, 0, 0, 0, 1, 1,
0.9316558, 0.4054976, 2.150327, 0, 0, 0, 1, 1,
0.9320184, 0.9578159, 0.3377696, 1, 1, 1, 1, 1,
0.9336846, 1.673782, 0.1379984, 1, 1, 1, 1, 1,
0.9346517, 1.729973, -0.5682184, 1, 1, 1, 1, 1,
0.9379218, 0.7755226, -0.4794522, 1, 1, 1, 1, 1,
0.9498874, -0.08446184, 1.583432, 1, 1, 1, 1, 1,
0.9536429, -0.5738438, 2.459832, 1, 1, 1, 1, 1,
0.9537725, 0.3425815, 0.878606, 1, 1, 1, 1, 1,
0.9691998, -1.744426, 2.235591, 1, 1, 1, 1, 1,
0.971588, 0.6037887, 0.8402335, 1, 1, 1, 1, 1,
0.9719755, 1.879221, -1.650342, 1, 1, 1, 1, 1,
0.9750558, 1.443232, 0.4859501, 1, 1, 1, 1, 1,
0.981338, -0.313129, 1.378242, 1, 1, 1, 1, 1,
0.9821805, 0.376612, 1.384893, 1, 1, 1, 1, 1,
0.9843282, -0.1840091, 1.177601, 1, 1, 1, 1, 1,
0.9906446, -0.1513721, 0.7348795, 1, 1, 1, 1, 1,
0.9929551, -1.418323, 2.584544, 0, 0, 1, 1, 1,
0.9934088, -0.3941729, 2.438674, 1, 0, 0, 1, 1,
1.004756, -0.4472182, 2.504151, 1, 0, 0, 1, 1,
1.007092, -0.3575273, 1.82904, 1, 0, 0, 1, 1,
1.019391, 0.227368, 2.01493, 1, 0, 0, 1, 1,
1.019492, -2.463391, 5.066389, 1, 0, 0, 1, 1,
1.022639, 0.2609413, 1.14922, 0, 0, 0, 1, 1,
1.026025, 0.02790463, 0.5391065, 0, 0, 0, 1, 1,
1.036286, -0.3237349, 3.175066, 0, 0, 0, 1, 1,
1.04172, -0.1402824, -0.1753784, 0, 0, 0, 1, 1,
1.043355, 1.100319, 1.122841, 0, 0, 0, 1, 1,
1.046854, 0.1243605, 1.84234, 0, 0, 0, 1, 1,
1.047044, 0.6422681, 1.064445, 0, 0, 0, 1, 1,
1.048554, -0.05329479, 1.9014, 1, 1, 1, 1, 1,
1.048784, -0.772935, 3.270944, 1, 1, 1, 1, 1,
1.052303, 0.7720754, 2.317195, 1, 1, 1, 1, 1,
1.052951, 1.823731, 0.6474903, 1, 1, 1, 1, 1,
1.055421, -1.28988, 2.842013, 1, 1, 1, 1, 1,
1.057319, 1.218846, 1.135648, 1, 1, 1, 1, 1,
1.057483, -0.946734, 2.702526, 1, 1, 1, 1, 1,
1.058757, -0.4526929, 2.546901, 1, 1, 1, 1, 1,
1.062011, -0.7599667, 2.467364, 1, 1, 1, 1, 1,
1.068187, 0.1598196, 1.343221, 1, 1, 1, 1, 1,
1.069047, -1.732963, 0.5783348, 1, 1, 1, 1, 1,
1.079461, -2.473777, 2.533562, 1, 1, 1, 1, 1,
1.080799, 2.187487, -0.1099435, 1, 1, 1, 1, 1,
1.091263, 0.2843672, -0.2426669, 1, 1, 1, 1, 1,
1.100253, 0.6788961, -0.00444448, 1, 1, 1, 1, 1,
1.106219, -0.06025121, 2.096768, 0, 0, 1, 1, 1,
1.110761, 0.3282344, -0.5451304, 1, 0, 0, 1, 1,
1.114278, -0.7987788, 1.498747, 1, 0, 0, 1, 1,
1.122705, 0.08216373, 2.567639, 1, 0, 0, 1, 1,
1.128489, -1.504722, 2.819725, 1, 0, 0, 1, 1,
1.130677, -0.3210737, 1.580267, 1, 0, 0, 1, 1,
1.151433, -0.3287451, 1.904972, 0, 0, 0, 1, 1,
1.156276, -0.8065652, 0.3241975, 0, 0, 0, 1, 1,
1.157718, 0.1461316, 1.862514, 0, 0, 0, 1, 1,
1.157783, -0.3204769, 0.4718114, 0, 0, 0, 1, 1,
1.162945, 0.4859685, 0.1384021, 0, 0, 0, 1, 1,
1.168376, 0.1960735, -0.7125757, 0, 0, 0, 1, 1,
1.173291, 0.2960865, 1.744337, 0, 0, 0, 1, 1,
1.174629, 0.967667, 0.9431188, 1, 1, 1, 1, 1,
1.177977, -1.626108, 2.167705, 1, 1, 1, 1, 1,
1.180034, 0.4235173, 1.022054, 1, 1, 1, 1, 1,
1.182243, 0.7104933, 2.351004, 1, 1, 1, 1, 1,
1.190616, 1.516748, -0.4193386, 1, 1, 1, 1, 1,
1.198927, 1.300264, -0.2109975, 1, 1, 1, 1, 1,
1.202522, -1.563809, 5.071521, 1, 1, 1, 1, 1,
1.204031, 0.947279, 1.905855, 1, 1, 1, 1, 1,
1.217073, -1.62684, 3.235925, 1, 1, 1, 1, 1,
1.232003, -1.6977, 2.683032, 1, 1, 1, 1, 1,
1.241393, -0.6297447, 1.488169, 1, 1, 1, 1, 1,
1.243673, -1.932611, 3.510656, 1, 1, 1, 1, 1,
1.261567, -0.5308128, 2.795554, 1, 1, 1, 1, 1,
1.267596, 0.08387839, -0.2816699, 1, 1, 1, 1, 1,
1.292246, -0.6849799, 1.561706, 1, 1, 1, 1, 1,
1.294849, -0.9280405, 2.904217, 0, 0, 1, 1, 1,
1.296332, 0.06966192, 1.595469, 1, 0, 0, 1, 1,
1.296437, 0.2837439, 2.542313, 1, 0, 0, 1, 1,
1.300989, 0.5193886, 1.069927, 1, 0, 0, 1, 1,
1.318321, 0.5230516, 2.807215, 1, 0, 0, 1, 1,
1.322455, -1.229666, 0.3904409, 1, 0, 0, 1, 1,
1.327783, -0.4698467, 2.419714, 0, 0, 0, 1, 1,
1.331802, -1.517847, 4.114944, 0, 0, 0, 1, 1,
1.33461, -0.3121565, 1.127564, 0, 0, 0, 1, 1,
1.356866, 1.633338, 1.100489, 0, 0, 0, 1, 1,
1.369506, -0.7635552, 0.6254789, 0, 0, 0, 1, 1,
1.378106, 0.2674312, 2.224536, 0, 0, 0, 1, 1,
1.378769, -0.7493107, 1.256456, 0, 0, 0, 1, 1,
1.383387, -0.1984888, -0.1014127, 1, 1, 1, 1, 1,
1.388009, -1.088578, 1.169986, 1, 1, 1, 1, 1,
1.389727, -0.7331163, 2.57218, 1, 1, 1, 1, 1,
1.399501, 1.976391, 2.250133, 1, 1, 1, 1, 1,
1.402508, -2.318718, 2.495246, 1, 1, 1, 1, 1,
1.41933, -0.1866763, -1.297304, 1, 1, 1, 1, 1,
1.434626, -1.400404, 3.604508, 1, 1, 1, 1, 1,
1.440108, -0.964996, 2.903803, 1, 1, 1, 1, 1,
1.455919, 0.8506399, 1.734658, 1, 1, 1, 1, 1,
1.46397, 0.3440938, 1.544587, 1, 1, 1, 1, 1,
1.46918, -1.385356, 3.891182, 1, 1, 1, 1, 1,
1.485345, -0.6951993, 1.196504, 1, 1, 1, 1, 1,
1.491309, -0.6822839, 4.240027, 1, 1, 1, 1, 1,
1.493635, 0.6861755, 1.208197, 1, 1, 1, 1, 1,
1.502562, -0.9730752, 1.2349, 1, 1, 1, 1, 1,
1.505339, -0.3485929, 2.002364, 0, 0, 1, 1, 1,
1.515204, -0.0169457, -0.8339947, 1, 0, 0, 1, 1,
1.53115, 0.5216588, 1.516505, 1, 0, 0, 1, 1,
1.539761, 1.006271, 1.214081, 1, 0, 0, 1, 1,
1.545498, -0.8790755, 2.41167, 1, 0, 0, 1, 1,
1.568294, -0.5118824, 2.365988, 1, 0, 0, 1, 1,
1.570366, 0.5385323, 1.773483, 0, 0, 0, 1, 1,
1.57779, -1.362603, 2.157028, 0, 0, 0, 1, 1,
1.579322, 0.4955758, 0.7315018, 0, 0, 0, 1, 1,
1.579641, -1.277469, 2.221113, 0, 0, 0, 1, 1,
1.596466, -0.04680484, 0.7814381, 0, 0, 0, 1, 1,
1.605582, -0.1392002, 2.67795, 0, 0, 0, 1, 1,
1.605648, 0.09275364, 0.3929697, 0, 0, 0, 1, 1,
1.619865, 0.3060778, 2.491979, 1, 1, 1, 1, 1,
1.622088, -1.76081, 2.628889, 1, 1, 1, 1, 1,
1.63996, 0.102968, 2.075763, 1, 1, 1, 1, 1,
1.64018, 2.013706, 1.897778, 1, 1, 1, 1, 1,
1.65627, -2.62618, 2.739341, 1, 1, 1, 1, 1,
1.677448, -0.5435714, 1.82581, 1, 1, 1, 1, 1,
1.682079, -0.3360669, 1.205956, 1, 1, 1, 1, 1,
1.686285, 0.1271383, 0.03839581, 1, 1, 1, 1, 1,
1.697667, -1.408985, 1.530044, 1, 1, 1, 1, 1,
1.69907, -0.3445628, 1.227277, 1, 1, 1, 1, 1,
1.7181, 1.887056, 0.5310523, 1, 1, 1, 1, 1,
1.725496, 2.462332, 1.337034, 1, 1, 1, 1, 1,
1.736288, -0.4640527, 2.746824, 1, 1, 1, 1, 1,
1.762662, -0.8681995, 0.8376228, 1, 1, 1, 1, 1,
1.765328, -0.5668078, 2.342066, 1, 1, 1, 1, 1,
1.785744, -0.2675135, 1.835021, 0, 0, 1, 1, 1,
1.786949, 0.2475863, 0.5009949, 1, 0, 0, 1, 1,
1.787109, 0.5426791, -0.7536772, 1, 0, 0, 1, 1,
1.797477, 1.370132, 0.2559337, 1, 0, 0, 1, 1,
1.802479, 0.1164425, 0.6595851, 1, 0, 0, 1, 1,
1.811532, 0.543549, 3.044236, 1, 0, 0, 1, 1,
1.825364, -1.641538, 1.138033, 0, 0, 0, 1, 1,
1.854968, -0.04469894, 1.63964, 0, 0, 0, 1, 1,
1.862495, 0.9956964, 0.02668009, 0, 0, 0, 1, 1,
1.87807, -1.798252, 0.5406921, 0, 0, 0, 1, 1,
1.878381, -0.3159059, 2.612404, 0, 0, 0, 1, 1,
1.88038, 1.530277, 1.208465, 0, 0, 0, 1, 1,
1.897128, -0.1556005, 2.373259, 0, 0, 0, 1, 1,
1.932818, 0.771098, 2.407477, 1, 1, 1, 1, 1,
1.945513, 0.5201083, 2.395389, 1, 1, 1, 1, 1,
1.957239, -0.8762673, 1.337855, 1, 1, 1, 1, 1,
1.975737, -2.688707, 2.360787, 1, 1, 1, 1, 1,
1.982131, 0.6496234, 1.396417, 1, 1, 1, 1, 1,
1.982806, 0.6587943, 2.481793, 1, 1, 1, 1, 1,
2.004764, -0.5615942, 2.179127, 1, 1, 1, 1, 1,
2.009836, 0.4691303, 1.439001, 1, 1, 1, 1, 1,
2.018684, -2.190387, 2.952335, 1, 1, 1, 1, 1,
2.042332, -1.05608, 2.19365, 1, 1, 1, 1, 1,
2.062245, -1.435384, 1.669679, 1, 1, 1, 1, 1,
2.062643, -1.640038, 3.122819, 1, 1, 1, 1, 1,
2.105089, -0.1692671, 2.435434, 1, 1, 1, 1, 1,
2.106584, 0.9197684, 1.080017, 1, 1, 1, 1, 1,
2.118828, -1.145328, 2.918844, 1, 1, 1, 1, 1,
2.14156, 0.1275276, 1.79821, 0, 0, 1, 1, 1,
2.153468, -1.30194, 1.459589, 1, 0, 0, 1, 1,
2.16358, -1.797978, 1.158908, 1, 0, 0, 1, 1,
2.264583, 0.8376155, 0.7103043, 1, 0, 0, 1, 1,
2.271079, 1.197578, 2.431498, 1, 0, 0, 1, 1,
2.289026, 0.8214709, 1.969055, 1, 0, 0, 1, 1,
2.342484, -0.2773838, 2.543769, 0, 0, 0, 1, 1,
2.357308, -0.9174339, 1.518232, 0, 0, 0, 1, 1,
2.373492, 0.4095533, 3.02252, 0, 0, 0, 1, 1,
2.456119, -0.6507545, 1.116804, 0, 0, 0, 1, 1,
2.484797, 0.06091945, 0.8419154, 0, 0, 0, 1, 1,
2.487269, -1.014813, 0.1746388, 0, 0, 0, 1, 1,
2.514534, 1.669723, 1.281847, 0, 0, 0, 1, 1,
2.686241, -0.4356716, 2.645894, 1, 1, 1, 1, 1,
2.797596, -0.7336479, 1.661981, 1, 1, 1, 1, 1,
2.918739, -0.6285551, 0.478409, 1, 1, 1, 1, 1,
3.093365, 0.00512489, 2.066678, 1, 1, 1, 1, 1,
3.115183, 0.1969863, 1.947366, 1, 1, 1, 1, 1,
3.220511, -0.677872, 1.26886, 1, 1, 1, 1, 1,
3.960566, -1.160313, 0.4236385, 1, 1, 1, 1, 1
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
var radius = 10.03591;
var distance = 35.25071;
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
mvMatrix.translate( -0.09377813, 0.04010367, 0.2271509 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.25071);
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
