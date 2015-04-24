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
-4.050193, 1.150212, -1.317233, 1, 0, 0, 1,
-3.162369, -1.378505, -1.943381, 1, 0.007843138, 0, 1,
-3.044291, -1.462918, -1.312939, 1, 0.01176471, 0, 1,
-2.732674, 0.7350109, -1.307386, 1, 0.01960784, 0, 1,
-2.699309, -0.6161628, -2.050451, 1, 0.02352941, 0, 1,
-2.473164, -1.298537, -1.180722, 1, 0.03137255, 0, 1,
-2.429252, -0.8528559, -2.777231, 1, 0.03529412, 0, 1,
-2.41215, -0.7770316, -0.4871111, 1, 0.04313726, 0, 1,
-2.328051, -0.6765514, -1.702529, 1, 0.04705882, 0, 1,
-2.253772, 1.00567, 0.9284947, 1, 0.05490196, 0, 1,
-2.231494, 0.02975699, 0.1082408, 1, 0.05882353, 0, 1,
-2.227558, -1.051621, 0.4109256, 1, 0.06666667, 0, 1,
-2.221997, -0.7160943, -2.609919, 1, 0.07058824, 0, 1,
-2.198488, -2.263675, -2.718509, 1, 0.07843138, 0, 1,
-2.197257, -0.7397263, -1.372638, 1, 0.08235294, 0, 1,
-2.140533, -0.7133835, -2.070819, 1, 0.09019608, 0, 1,
-2.138057, 0.9694118, -1.574637, 1, 0.09411765, 0, 1,
-2.089756, -0.1659888, -1.874585, 1, 0.1019608, 0, 1,
-2.068441, -0.2763949, -0.6056713, 1, 0.1098039, 0, 1,
-2.063887, 0.4391264, 0.3746555, 1, 0.1137255, 0, 1,
-2.036267, 0.5795247, -0.9337217, 1, 0.1215686, 0, 1,
-2.013789, 0.004369682, -2.424591, 1, 0.1254902, 0, 1,
-1.998061, -0.3230387, -1.88191, 1, 0.1333333, 0, 1,
-1.993808, 0.1420331, -1.753455, 1, 0.1372549, 0, 1,
-1.993308, 0.1522281, -1.789249, 1, 0.145098, 0, 1,
-1.988974, 1.10031, -2.200037, 1, 0.1490196, 0, 1,
-1.962345, -0.3468273, -1.487919, 1, 0.1568628, 0, 1,
-1.942729, 0.7686707, -0.3185148, 1, 0.1607843, 0, 1,
-1.886359, 1.379712, 0.8991747, 1, 0.1686275, 0, 1,
-1.876094, -2.794174, -1.932329, 1, 0.172549, 0, 1,
-1.864143, -1.552882, -3.273374, 1, 0.1803922, 0, 1,
-1.852266, -1.549692, -1.869689, 1, 0.1843137, 0, 1,
-1.815332, 0.3749316, -0.7386156, 1, 0.1921569, 0, 1,
-1.796475, -0.1508258, -1.347151, 1, 0.1960784, 0, 1,
-1.79454, 0.2643915, -1.517931, 1, 0.2039216, 0, 1,
-1.782686, -0.3524088, -2.002562, 1, 0.2117647, 0, 1,
-1.77798, -0.7634318, -1.721384, 1, 0.2156863, 0, 1,
-1.7666, -1.255339, -1.244009, 1, 0.2235294, 0, 1,
-1.736938, 0.5663615, -0.471159, 1, 0.227451, 0, 1,
-1.725586, 1.022056, -0.629415, 1, 0.2352941, 0, 1,
-1.705058, -0.2126222, -0.1610277, 1, 0.2392157, 0, 1,
-1.693856, 0.8775411, -0.9274291, 1, 0.2470588, 0, 1,
-1.678335, 0.2698697, -0.1038845, 1, 0.2509804, 0, 1,
-1.654766, 1.385406, -1.721001, 1, 0.2588235, 0, 1,
-1.649275, -0.3115727, -2.763849, 1, 0.2627451, 0, 1,
-1.630879, 0.289939, -3.038705, 1, 0.2705882, 0, 1,
-1.626704, 0.2969703, -2.472596, 1, 0.2745098, 0, 1,
-1.626594, 0.5080924, -2.664945, 1, 0.282353, 0, 1,
-1.617363, -1.110093, -0.6609211, 1, 0.2862745, 0, 1,
-1.595905, 0.2309927, -2.670034, 1, 0.2941177, 0, 1,
-1.595867, 1.756209, -1.601933, 1, 0.3019608, 0, 1,
-1.591346, 0.4053984, -0.1339645, 1, 0.3058824, 0, 1,
-1.574911, -1.064404, -1.457756, 1, 0.3137255, 0, 1,
-1.570644, 0.4252451, -2.463995, 1, 0.3176471, 0, 1,
-1.557673, 0.2925709, 0.3999803, 1, 0.3254902, 0, 1,
-1.549403, -0.756807, -0.9301851, 1, 0.3294118, 0, 1,
-1.546365, -2.274558, -2.330591, 1, 0.3372549, 0, 1,
-1.543378, 0.6109295, -2.809698, 1, 0.3411765, 0, 1,
-1.533471, 0.5896744, -1.154402, 1, 0.3490196, 0, 1,
-1.530656, 0.2936703, -1.562176, 1, 0.3529412, 0, 1,
-1.525871, -0.1919123, -2.12496, 1, 0.3607843, 0, 1,
-1.525786, -1.689926, -2.198274, 1, 0.3647059, 0, 1,
-1.52381, 0.6808102, -2.204143, 1, 0.372549, 0, 1,
-1.521649, -1.287247, -2.355234, 1, 0.3764706, 0, 1,
-1.519801, -0.2278021, -2.389453, 1, 0.3843137, 0, 1,
-1.516132, 1.067895, -0.3759376, 1, 0.3882353, 0, 1,
-1.473466, -0.03623239, -3.079502, 1, 0.3960784, 0, 1,
-1.466762, -0.4272092, -2.401445, 1, 0.4039216, 0, 1,
-1.464646, 2.650167, -0.007752025, 1, 0.4078431, 0, 1,
-1.442096, -0.96757, -1.769319, 1, 0.4156863, 0, 1,
-1.440977, 0.3408228, -0.1950742, 1, 0.4196078, 0, 1,
-1.421777, 0.1552023, -0.421977, 1, 0.427451, 0, 1,
-1.421006, -0.08273683, -0.7062829, 1, 0.4313726, 0, 1,
-1.405967, -0.09141593, -0.9976465, 1, 0.4392157, 0, 1,
-1.400457, 0.8021469, -1.376488, 1, 0.4431373, 0, 1,
-1.393867, 0.7487133, -1.302919, 1, 0.4509804, 0, 1,
-1.38958, -0.8930548, -3.679232, 1, 0.454902, 0, 1,
-1.3805, 1.363494, -0.02035029, 1, 0.4627451, 0, 1,
-1.363008, -1.919731, -1.453077, 1, 0.4666667, 0, 1,
-1.356425, -0.4104699, -2.557713, 1, 0.4745098, 0, 1,
-1.354334, 1.988455, 0.7576923, 1, 0.4784314, 0, 1,
-1.353941, -0.6588549, -4.436612, 1, 0.4862745, 0, 1,
-1.352709, 0.3978841, -1.08615, 1, 0.4901961, 0, 1,
-1.347597, 0.3049937, -0.9658577, 1, 0.4980392, 0, 1,
-1.34338, -0.9065554, -0.9717575, 1, 0.5058824, 0, 1,
-1.343136, -0.652558, -2.936245, 1, 0.509804, 0, 1,
-1.339944, 0.2411969, -2.231782, 1, 0.5176471, 0, 1,
-1.331454, -1.205022, -2.264389, 1, 0.5215687, 0, 1,
-1.329227, -0.3537078, -2.103153, 1, 0.5294118, 0, 1,
-1.325192, -2.015568, -3.008228, 1, 0.5333334, 0, 1,
-1.321459, -0.335244, -2.833374, 1, 0.5411765, 0, 1,
-1.320295, 1.089733, -1.141304, 1, 0.5450981, 0, 1,
-1.30922, 0.8202087, 0.5448027, 1, 0.5529412, 0, 1,
-1.299093, -0.2357918, -1.658875, 1, 0.5568628, 0, 1,
-1.296085, 1.42683, -0.5079269, 1, 0.5647059, 0, 1,
-1.28234, -0.7514935, -2.144012, 1, 0.5686275, 0, 1,
-1.277621, 0.1699914, -1.322258, 1, 0.5764706, 0, 1,
-1.263869, -0.5937123, -3.636968, 1, 0.5803922, 0, 1,
-1.261873, -1.58621, -3.969252, 1, 0.5882353, 0, 1,
-1.25379, -0.08516882, -0.692444, 1, 0.5921569, 0, 1,
-1.239828, 0.2066542, -2.202885, 1, 0.6, 0, 1,
-1.230441, 1.044002, -1.574155, 1, 0.6078432, 0, 1,
-1.229775, -1.028385, -2.535396, 1, 0.6117647, 0, 1,
-1.222482, -0.2697512, -1.483714, 1, 0.6196079, 0, 1,
-1.222184, -2.031061, -4.52582, 1, 0.6235294, 0, 1,
-1.220346, -0.5445723, -0.8006726, 1, 0.6313726, 0, 1,
-1.22011, -0.6889101, -1.436448, 1, 0.6352941, 0, 1,
-1.21912, 0.3015283, -0.7887423, 1, 0.6431373, 0, 1,
-1.218812, -0.8567796, -2.42938, 1, 0.6470588, 0, 1,
-1.19849, -0.3482368, -4.15286, 1, 0.654902, 0, 1,
-1.196595, -2.05168, -1.510519, 1, 0.6588235, 0, 1,
-1.194842, -1.109676, -1.619545, 1, 0.6666667, 0, 1,
-1.192888, -1.349828, -2.843256, 1, 0.6705883, 0, 1,
-1.191543, -2.827626, -1.070883, 1, 0.6784314, 0, 1,
-1.18395, -1.784913, -0.8527159, 1, 0.682353, 0, 1,
-1.178685, 0.1204405, -2.158089, 1, 0.6901961, 0, 1,
-1.176841, -1.143674, -3.511877, 1, 0.6941177, 0, 1,
-1.176726, -0.451759, -1.421113, 1, 0.7019608, 0, 1,
-1.168986, 1.976126, -0.4048426, 1, 0.7098039, 0, 1,
-1.167696, -1.545017, -4.372326, 1, 0.7137255, 0, 1,
-1.166337, 1.983614, 0.1155416, 1, 0.7215686, 0, 1,
-1.161007, 1.067333, -1.109251, 1, 0.7254902, 0, 1,
-1.157646, 1.499188, -3.20875, 1, 0.7333333, 0, 1,
-1.156372, -0.4005983, -2.234899, 1, 0.7372549, 0, 1,
-1.155864, -0.03537256, -0.4425146, 1, 0.7450981, 0, 1,
-1.151632, -0.6212035, -2.173564, 1, 0.7490196, 0, 1,
-1.138968, -0.8378572, -1.199406, 1, 0.7568628, 0, 1,
-1.138115, 0.4237769, -0.6268907, 1, 0.7607843, 0, 1,
-1.136819, 1.669367, -1.688528, 1, 0.7686275, 0, 1,
-1.132875, -0.2921109, -2.165052, 1, 0.772549, 0, 1,
-1.13211, -0.1821396, -1.290219, 1, 0.7803922, 0, 1,
-1.123289, 0.1210966, -2.616264, 1, 0.7843137, 0, 1,
-1.119882, -0.1041109, -2.910866, 1, 0.7921569, 0, 1,
-1.116603, -0.2572219, -1.874957, 1, 0.7960784, 0, 1,
-1.114992, 0.6494669, 0.2812351, 1, 0.8039216, 0, 1,
-1.112268, 0.09854323, -1.992614, 1, 0.8117647, 0, 1,
-1.10789, -1.451925, -1.371163, 1, 0.8156863, 0, 1,
-1.099866, 0.08966155, -2.79179, 1, 0.8235294, 0, 1,
-1.099212, 2.244724, -0.09380328, 1, 0.827451, 0, 1,
-1.096805, 0.7124806, -0.5823023, 1, 0.8352941, 0, 1,
-1.086347, -0.3260803, -3.314715, 1, 0.8392157, 0, 1,
-1.063682, 1.33841, 0.7289988, 1, 0.8470588, 0, 1,
-1.057496, -1.311497, 0.02424738, 1, 0.8509804, 0, 1,
-1.049098, 0.486171, -0.5577238, 1, 0.8588235, 0, 1,
-1.038976, -0.4500888, -2.715154, 1, 0.8627451, 0, 1,
-1.035008, -1.578704, -2.554581, 1, 0.8705882, 0, 1,
-1.029907, 2.180976, 0.1228908, 1, 0.8745098, 0, 1,
-1.02749, 0.5682586, -0.08402935, 1, 0.8823529, 0, 1,
-1.026981, -0.9988955, -4.510612, 1, 0.8862745, 0, 1,
-1.023186, 1.31307, -0.5950525, 1, 0.8941177, 0, 1,
-1.02189, -0.2718495, -0.6816512, 1, 0.8980392, 0, 1,
-1.021434, 0.2619089, -2.819347, 1, 0.9058824, 0, 1,
-1.018183, 1.588023, -1.029411, 1, 0.9137255, 0, 1,
-1.011195, -0.4035027, -1.941027, 1, 0.9176471, 0, 1,
-1.005175, -0.2453617, -3.712092, 1, 0.9254902, 0, 1,
-1.004628, 0.2263021, -2.499168, 1, 0.9294118, 0, 1,
-1.001328, 1.430417, -0.7235617, 1, 0.9372549, 0, 1,
-0.9957014, -0.4768346, -2.173398, 1, 0.9411765, 0, 1,
-0.9941356, 0.4441464, -1.230439, 1, 0.9490196, 0, 1,
-0.9924377, 0.5746632, -0.9988285, 1, 0.9529412, 0, 1,
-0.9854833, 0.20678, -1.769093, 1, 0.9607843, 0, 1,
-0.9744905, 0.3905724, -1.288716, 1, 0.9647059, 0, 1,
-0.966796, 0.1745625, -0.9786308, 1, 0.972549, 0, 1,
-0.9662977, -0.6995454, -1.642312, 1, 0.9764706, 0, 1,
-0.9660249, 0.01526021, -2.276021, 1, 0.9843137, 0, 1,
-0.9616644, 0.4038964, -0.44413, 1, 0.9882353, 0, 1,
-0.9512293, -0.4590791, -1.996297, 1, 0.9960784, 0, 1,
-0.9498163, -0.9460193, 0.6448553, 0.9960784, 1, 0, 1,
-0.9485616, 1.350848, -0.6689929, 0.9921569, 1, 0, 1,
-0.9376649, 0.005082247, -3.027841, 0.9843137, 1, 0, 1,
-0.9303675, -1.380666, -3.833318, 0.9803922, 1, 0, 1,
-0.9253597, -1.276726, 0.4514227, 0.972549, 1, 0, 1,
-0.9234931, 0.407927, -0.5600567, 0.9686275, 1, 0, 1,
-0.9232479, 1.383306, 1.850633, 0.9607843, 1, 0, 1,
-0.9220325, 1.241573, -0.5012735, 0.9568627, 1, 0, 1,
-0.9196631, 1.071046, -0.9317473, 0.9490196, 1, 0, 1,
-0.9186928, -0.3023703, -2.028731, 0.945098, 1, 0, 1,
-0.9145005, -2.119225, -1.96517, 0.9372549, 1, 0, 1,
-0.9133189, -0.7750399, -3.288877, 0.9333333, 1, 0, 1,
-0.9082662, 1.589307, -1.415811, 0.9254902, 1, 0, 1,
-0.8783799, -0.4299882, -3.451629, 0.9215686, 1, 0, 1,
-0.8748565, 0.4845442, -1.115708, 0.9137255, 1, 0, 1,
-0.8742875, 0.09205318, 0.6791817, 0.9098039, 1, 0, 1,
-0.8718899, 2.685024, -1.178515, 0.9019608, 1, 0, 1,
-0.867068, 0.7707359, -0.688652, 0.8941177, 1, 0, 1,
-0.8625231, -0.9498448, -2.597661, 0.8901961, 1, 0, 1,
-0.8611279, 0.251237, -0.147512, 0.8823529, 1, 0, 1,
-0.8541471, -0.8402703, -1.215863, 0.8784314, 1, 0, 1,
-0.8466664, -1.393575, -2.939306, 0.8705882, 1, 0, 1,
-0.8460369, -0.6491497, -2.105417, 0.8666667, 1, 0, 1,
-0.8458881, 0.1530888, -4.248461, 0.8588235, 1, 0, 1,
-0.8457849, 1.77621, -1.61336, 0.854902, 1, 0, 1,
-0.845031, 1.291664, 0.3624845, 0.8470588, 1, 0, 1,
-0.8448451, 0.2362849, -1.364915, 0.8431373, 1, 0, 1,
-0.8441077, 0.3618672, -2.436909, 0.8352941, 1, 0, 1,
-0.8348179, -0.3019921, -2.649978, 0.8313726, 1, 0, 1,
-0.8344296, -0.2617449, -1.597768, 0.8235294, 1, 0, 1,
-0.8209512, -1.089973, -3.935531, 0.8196079, 1, 0, 1,
-0.8167606, 0.1446189, -2.926214, 0.8117647, 1, 0, 1,
-0.8067486, 1.114532, -3.42695, 0.8078431, 1, 0, 1,
-0.7956435, -0.3491924, 0.1215383, 0.8, 1, 0, 1,
-0.7934525, -1.408859, -3.190703, 0.7921569, 1, 0, 1,
-0.7929267, -1.319213, -1.296905, 0.7882353, 1, 0, 1,
-0.791943, 0.2101765, -2.419618, 0.7803922, 1, 0, 1,
-0.7918667, -0.3470452, -2.206824, 0.7764706, 1, 0, 1,
-0.7913378, -0.7583713, -3.029608, 0.7686275, 1, 0, 1,
-0.7906699, 0.01377897, -2.917676, 0.7647059, 1, 0, 1,
-0.7852656, -1.03107, -0.9103083, 0.7568628, 1, 0, 1,
-0.7808933, 0.740162, -0.9201975, 0.7529412, 1, 0, 1,
-0.7789162, -0.6545741, -0.4543099, 0.7450981, 1, 0, 1,
-0.778906, 2.341882, 0.6158128, 0.7411765, 1, 0, 1,
-0.7691205, 1.319369, 0.9586298, 0.7333333, 1, 0, 1,
-0.7672136, -1.055232, -4.342241, 0.7294118, 1, 0, 1,
-0.7666696, 0.4090886, -1.950981, 0.7215686, 1, 0, 1,
-0.7655176, -0.9311736, -3.007597, 0.7176471, 1, 0, 1,
-0.7638773, -0.9845711, -3.156332, 0.7098039, 1, 0, 1,
-0.7637872, -0.8672464, -3.19561, 0.7058824, 1, 0, 1,
-0.7616922, 0.7029716, -2.307847, 0.6980392, 1, 0, 1,
-0.7610815, 0.9044688, 0.01231213, 0.6901961, 1, 0, 1,
-0.7580567, -1.158976, -2.000573, 0.6862745, 1, 0, 1,
-0.757706, -0.6964434, -1.436419, 0.6784314, 1, 0, 1,
-0.7574995, -1.253414, -1.608453, 0.6745098, 1, 0, 1,
-0.755429, 1.03525, -1.318633, 0.6666667, 1, 0, 1,
-0.7537766, 0.8606497, -0.8348908, 0.6627451, 1, 0, 1,
-0.7519715, -1.631469, -3.555194, 0.654902, 1, 0, 1,
-0.7486162, -1.829091, -4.141884, 0.6509804, 1, 0, 1,
-0.7465094, -0.5917858, -2.496179, 0.6431373, 1, 0, 1,
-0.7416624, 0.8338653, 0.6740246, 0.6392157, 1, 0, 1,
-0.7316831, -0.9073409, -3.324674, 0.6313726, 1, 0, 1,
-0.7308016, -0.6690062, -3.116885, 0.627451, 1, 0, 1,
-0.728711, 0.5850424, -1.603678, 0.6196079, 1, 0, 1,
-0.7243494, -0.09302371, -3.205971, 0.6156863, 1, 0, 1,
-0.7222136, -0.447178, 0.003171071, 0.6078432, 1, 0, 1,
-0.7135708, -0.5957536, -1.551453, 0.6039216, 1, 0, 1,
-0.7114708, 1.790378, -0.7513693, 0.5960785, 1, 0, 1,
-0.7098707, 1.381561, -0.668523, 0.5882353, 1, 0, 1,
-0.7093998, 1.605834, 0.4742462, 0.5843138, 1, 0, 1,
-0.7085246, -0.1750545, -2.301001, 0.5764706, 1, 0, 1,
-0.7042566, -0.5552719, -2.011294, 0.572549, 1, 0, 1,
-0.7034541, -0.1745578, -0.006575936, 0.5647059, 1, 0, 1,
-0.6973405, 0.5289679, -1.254603, 0.5607843, 1, 0, 1,
-0.6865001, 0.8445515, -0.7961845, 0.5529412, 1, 0, 1,
-0.6801766, 0.395804, -2.059578, 0.5490196, 1, 0, 1,
-0.679131, -1.068812, -0.8519245, 0.5411765, 1, 0, 1,
-0.670692, -0.0866464, -0.5247673, 0.5372549, 1, 0, 1,
-0.6627964, -1.25738, -0.4190885, 0.5294118, 1, 0, 1,
-0.6609855, 1.030121, -1.640483, 0.5254902, 1, 0, 1,
-0.6593177, -0.8490095, -3.140777, 0.5176471, 1, 0, 1,
-0.6483629, 0.8414862, -2.205973, 0.5137255, 1, 0, 1,
-0.6483435, -0.001991889, -1.692468, 0.5058824, 1, 0, 1,
-0.6440053, 0.6752194, -0.9509031, 0.5019608, 1, 0, 1,
-0.6429198, 0.5104504, -1.321402, 0.4941176, 1, 0, 1,
-0.6402302, 0.7043259, 0.916875, 0.4862745, 1, 0, 1,
-0.6393649, -0.1648397, -2.946476, 0.4823529, 1, 0, 1,
-0.6380537, 0.6658089, -0.8380372, 0.4745098, 1, 0, 1,
-0.6370701, -0.7587649, -3.690497, 0.4705882, 1, 0, 1,
-0.6310838, -0.04686299, -1.677832, 0.4627451, 1, 0, 1,
-0.6299745, -0.2293292, -3.102288, 0.4588235, 1, 0, 1,
-0.6295096, 0.4431182, -0.6400717, 0.4509804, 1, 0, 1,
-0.6279484, 0.624666, -0.3176646, 0.4470588, 1, 0, 1,
-0.6266049, 1.061628, 0.4131346, 0.4392157, 1, 0, 1,
-0.6264729, 0.381965, -0.7777641, 0.4352941, 1, 0, 1,
-0.6192352, -0.7446582, -3.307893, 0.427451, 1, 0, 1,
-0.619134, 0.8248726, -1.604441, 0.4235294, 1, 0, 1,
-0.6187794, -1.883169, -2.319256, 0.4156863, 1, 0, 1,
-0.6184351, 0.801236, -0.2858644, 0.4117647, 1, 0, 1,
-0.6094791, 0.06174484, -2.563268, 0.4039216, 1, 0, 1,
-0.6065007, 1.674574, 1.667274, 0.3960784, 1, 0, 1,
-0.60454, -0.6203566, -2.311353, 0.3921569, 1, 0, 1,
-0.6043312, 1.394482, -1.418177, 0.3843137, 1, 0, 1,
-0.6028389, 1.495571, 0.4646905, 0.3803922, 1, 0, 1,
-0.5993209, -0.2949463, -3.597131, 0.372549, 1, 0, 1,
-0.5973476, 0.6867492, -0.063558, 0.3686275, 1, 0, 1,
-0.5883134, 0.4310219, -1.518596, 0.3607843, 1, 0, 1,
-0.587444, 0.09845495, -0.5010607, 0.3568628, 1, 0, 1,
-0.5836684, 0.2881328, -1.750526, 0.3490196, 1, 0, 1,
-0.5823138, -0.6282105, -1.66988, 0.345098, 1, 0, 1,
-0.5807927, -0.6594257, -1.179003, 0.3372549, 1, 0, 1,
-0.5783657, -0.7866509, -1.393633, 0.3333333, 1, 0, 1,
-0.5776479, 0.02338578, -1.71395, 0.3254902, 1, 0, 1,
-0.5754128, -0.5752443, -2.165172, 0.3215686, 1, 0, 1,
-0.5733183, 0.1140334, -1.828116, 0.3137255, 1, 0, 1,
-0.5700895, 1.257245, -0.2779868, 0.3098039, 1, 0, 1,
-0.5684006, 0.4188861, 0.6628531, 0.3019608, 1, 0, 1,
-0.5682142, -0.0659743, -0.8979714, 0.2941177, 1, 0, 1,
-0.56616, 1.210067, 0.2714398, 0.2901961, 1, 0, 1,
-0.5648167, -0.317602, -2.365202, 0.282353, 1, 0, 1,
-0.5642591, -1.331177, -3.685637, 0.2784314, 1, 0, 1,
-0.5605468, -1.256561, -4.699066, 0.2705882, 1, 0, 1,
-0.5605052, 0.9864831, -0.3701051, 0.2666667, 1, 0, 1,
-0.554913, 0.3251575, -0.5163027, 0.2588235, 1, 0, 1,
-0.5537679, 0.07900497, -0.3632275, 0.254902, 1, 0, 1,
-0.5509765, -0.9188508, -1.733429, 0.2470588, 1, 0, 1,
-0.550944, -0.4957323, -3.849633, 0.2431373, 1, 0, 1,
-0.5465515, -0.5480681, -4.70294, 0.2352941, 1, 0, 1,
-0.5440072, -0.2231759, -1.110705, 0.2313726, 1, 0, 1,
-0.5422539, -0.5729146, -2.844841, 0.2235294, 1, 0, 1,
-0.5270441, -0.4416314, -0.6785791, 0.2196078, 1, 0, 1,
-0.5263897, -0.2540434, -1.708559, 0.2117647, 1, 0, 1,
-0.5259746, -1.338279, -3.130864, 0.2078431, 1, 0, 1,
-0.5211104, -0.8299834, -3.343135, 0.2, 1, 0, 1,
-0.5204704, 0.1267578, 0.6689752, 0.1921569, 1, 0, 1,
-0.5157879, 0.3429118, 0.4248596, 0.1882353, 1, 0, 1,
-0.5091832, 1.079175, -1.963738, 0.1803922, 1, 0, 1,
-0.5078312, -3.397001, -1.362881, 0.1764706, 1, 0, 1,
-0.503982, -0.1208477, -0.1491258, 0.1686275, 1, 0, 1,
-0.5037971, -0.759491, -2.090895, 0.1647059, 1, 0, 1,
-0.5032306, -0.3035536, -2.562658, 0.1568628, 1, 0, 1,
-0.4995492, -0.3668292, -2.839205, 0.1529412, 1, 0, 1,
-0.4986698, 0.05909725, -1.901095, 0.145098, 1, 0, 1,
-0.4971425, 1.921164, 0.6386101, 0.1411765, 1, 0, 1,
-0.4960696, 0.121627, -1.261827, 0.1333333, 1, 0, 1,
-0.4937512, -1.281031, -2.620609, 0.1294118, 1, 0, 1,
-0.4921219, -0.3986434, -3.166519, 0.1215686, 1, 0, 1,
-0.4850442, 0.04803657, -0.8980898, 0.1176471, 1, 0, 1,
-0.4808084, 0.9075993, 1.220391, 0.1098039, 1, 0, 1,
-0.4790897, 0.2053141, -0.5950896, 0.1058824, 1, 0, 1,
-0.4778239, -1.738166, -3.134384, 0.09803922, 1, 0, 1,
-0.4749837, -0.328151, -1.937356, 0.09019608, 1, 0, 1,
-0.4749275, 0.06125838, -1.905917, 0.08627451, 1, 0, 1,
-0.4732589, 0.1464049, -1.070435, 0.07843138, 1, 0, 1,
-0.4713635, -2.252214, -1.892482, 0.07450981, 1, 0, 1,
-0.4711261, 0.5409674, -0.7848663, 0.06666667, 1, 0, 1,
-0.4705491, 0.8331805, -0.5868356, 0.0627451, 1, 0, 1,
-0.4620093, -0.945277, -1.64463, 0.05490196, 1, 0, 1,
-0.4606552, 0.5708022, -1.717778, 0.05098039, 1, 0, 1,
-0.4587655, -0.3578703, -2.172936, 0.04313726, 1, 0, 1,
-0.4542911, -0.6343754, -3.380047, 0.03921569, 1, 0, 1,
-0.4508871, 0.07256553, -1.895994, 0.03137255, 1, 0, 1,
-0.4503079, 0.5992045, -0.2971917, 0.02745098, 1, 0, 1,
-0.4459077, -0.1527359, -1.468102, 0.01960784, 1, 0, 1,
-0.4362926, -0.04041426, -1.428462, 0.01568628, 1, 0, 1,
-0.4336104, -0.3598993, -2.239638, 0.007843138, 1, 0, 1,
-0.4309359, -1.552447, -5.030964, 0.003921569, 1, 0, 1,
-0.4307773, 0.1604937, -1.680039, 0, 1, 0.003921569, 1,
-0.4254875, -1.087521, -1.041581, 0, 1, 0.01176471, 1,
-0.4214575, 0.04652223, -3.273015, 0, 1, 0.01568628, 1,
-0.4205326, -2.516803, -3.685709, 0, 1, 0.02352941, 1,
-0.4187203, -0.3305812, -4.784131, 0, 1, 0.02745098, 1,
-0.4038949, 0.2733279, -1.069924, 0, 1, 0.03529412, 1,
-0.4015591, -0.5943124, -3.199479, 0, 1, 0.03921569, 1,
-0.3964381, 0.09616561, -3.27903, 0, 1, 0.04705882, 1,
-0.3940511, -2.229659, -3.462011, 0, 1, 0.05098039, 1,
-0.3894063, 0.7247178, -0.4880486, 0, 1, 0.05882353, 1,
-0.3876001, -0.4465101, -1.781301, 0, 1, 0.0627451, 1,
-0.3826819, -0.5034897, -2.67023, 0, 1, 0.07058824, 1,
-0.3801871, 0.9061464, -0.3622186, 0, 1, 0.07450981, 1,
-0.3786753, -0.1351061, -1.503128, 0, 1, 0.08235294, 1,
-0.377303, -0.8265764, -1.416314, 0, 1, 0.08627451, 1,
-0.3736286, 0.08814255, -1.059083, 0, 1, 0.09411765, 1,
-0.3664856, -0.685747, -2.889039, 0, 1, 0.1019608, 1,
-0.3641795, 0.4848959, -2.394952, 0, 1, 0.1058824, 1,
-0.3630822, -1.747591, -4.741536, 0, 1, 0.1137255, 1,
-0.3602965, -0.02359333, -1.029407, 0, 1, 0.1176471, 1,
-0.3597929, -0.6887155, -3.191909, 0, 1, 0.1254902, 1,
-0.3588936, 0.2425214, -1.454028, 0, 1, 0.1294118, 1,
-0.3585797, -2.009248, -2.254688, 0, 1, 0.1372549, 1,
-0.3579078, -0.9596751, -3.20975, 0, 1, 0.1411765, 1,
-0.3549815, -0.2596866, -1.964108, 0, 1, 0.1490196, 1,
-0.3530234, -0.5379114, -1.659717, 0, 1, 0.1529412, 1,
-0.351116, -0.9612271, -4.09429, 0, 1, 0.1607843, 1,
-0.3508394, -0.5152994, -2.754223, 0, 1, 0.1647059, 1,
-0.3496515, 0.5389153, -0.007560492, 0, 1, 0.172549, 1,
-0.3427652, 1.039536, 0.326154, 0, 1, 0.1764706, 1,
-0.3415144, -1.642899, -2.476102, 0, 1, 0.1843137, 1,
-0.3386455, -1.457735, -4.80571, 0, 1, 0.1882353, 1,
-0.3333306, 1.39006, 1.694175, 0, 1, 0.1960784, 1,
-0.3231596, -1.916154, -2.523644, 0, 1, 0.2039216, 1,
-0.3207823, -1.078835, -4.160484, 0, 1, 0.2078431, 1,
-0.320616, 1.624438, -1.767486, 0, 1, 0.2156863, 1,
-0.3191963, -0.8020073, -3.420879, 0, 1, 0.2196078, 1,
-0.3167812, 1.285494, -0.8272929, 0, 1, 0.227451, 1,
-0.315744, 0.2541087, 0.3567532, 0, 1, 0.2313726, 1,
-0.3155002, 1.907318, 0.3615431, 0, 1, 0.2392157, 1,
-0.3106743, 0.8666326, -1.909592, 0, 1, 0.2431373, 1,
-0.3087462, -1.373804, -2.524372, 0, 1, 0.2509804, 1,
-0.3062837, -2.188554, -4.49014, 0, 1, 0.254902, 1,
-0.2910815, 0.3981612, -0.09372745, 0, 1, 0.2627451, 1,
-0.2886509, 0.9919186, 0.1431424, 0, 1, 0.2666667, 1,
-0.2875768, 1.782957, -0.5200016, 0, 1, 0.2745098, 1,
-0.287184, 0.6481878, -0.6165463, 0, 1, 0.2784314, 1,
-0.2852712, -2.228801, -2.804276, 0, 1, 0.2862745, 1,
-0.2849554, -0.7090908, -3.493446, 0, 1, 0.2901961, 1,
-0.2824199, 0.7715963, 1.033432, 0, 1, 0.2980392, 1,
-0.2811708, 0.3525002, -1.984589, 0, 1, 0.3058824, 1,
-0.2803513, -0.3432457, -2.320981, 0, 1, 0.3098039, 1,
-0.2787841, -0.4267897, -0.8097315, 0, 1, 0.3176471, 1,
-0.2773893, 0.3197417, -0.03639381, 0, 1, 0.3215686, 1,
-0.274285, -0.1396033, -2.221935, 0, 1, 0.3294118, 1,
-0.2721331, 0.4142826, -1.295035, 0, 1, 0.3333333, 1,
-0.2715625, -0.5946266, -2.723169, 0, 1, 0.3411765, 1,
-0.269356, -2.044636, -1.263314, 0, 1, 0.345098, 1,
-0.266959, 1.039443, 0.3343554, 0, 1, 0.3529412, 1,
-0.2635975, 0.7838521, 0.4050392, 0, 1, 0.3568628, 1,
-0.2552388, 1.238806, 1.410963, 0, 1, 0.3647059, 1,
-0.2506261, -0.6117863, -0.7409599, 0, 1, 0.3686275, 1,
-0.2436358, -0.8338463, -3.984284, 0, 1, 0.3764706, 1,
-0.2423332, -1.158993, -1.090682, 0, 1, 0.3803922, 1,
-0.2358594, -1.048244, -1.862985, 0, 1, 0.3882353, 1,
-0.2355821, 0.2795721, -0.8409854, 0, 1, 0.3921569, 1,
-0.2351299, -0.4601615, -1.678129, 0, 1, 0.4, 1,
-0.233134, -0.4066115, -1.349647, 0, 1, 0.4078431, 1,
-0.2312551, -0.3795229, -2.363711, 0, 1, 0.4117647, 1,
-0.2291651, 1.363961, -0.6568909, 0, 1, 0.4196078, 1,
-0.2291271, -0.4358962, -3.518158, 0, 1, 0.4235294, 1,
-0.2285639, -0.09086734, -3.417969, 0, 1, 0.4313726, 1,
-0.2263319, 1.878057, 1.744376, 0, 1, 0.4352941, 1,
-0.2181501, 0.2255115, -2.074798, 0, 1, 0.4431373, 1,
-0.2105622, -1.623413, -2.497026, 0, 1, 0.4470588, 1,
-0.2104515, 0.7401918, -1.686498, 0, 1, 0.454902, 1,
-0.2043758, -0.5658256, -3.203727, 0, 1, 0.4588235, 1,
-0.2014451, 0.7667135, -0.01710495, 0, 1, 0.4666667, 1,
-0.2006516, -0.2211735, -1.576734, 0, 1, 0.4705882, 1,
-0.200352, -1.068092, -1.554071, 0, 1, 0.4784314, 1,
-0.1957587, 0.8514353, -1.411971, 0, 1, 0.4823529, 1,
-0.193173, -0.3098988, -4.05103, 0, 1, 0.4901961, 1,
-0.1927484, -0.3652922, -0.3161595, 0, 1, 0.4941176, 1,
-0.1924943, -0.1757445, -2.20773, 0, 1, 0.5019608, 1,
-0.191519, 0.006217568, -1.872763, 0, 1, 0.509804, 1,
-0.1909448, 1.173708, -0.8174994, 0, 1, 0.5137255, 1,
-0.1885134, 0.4277281, 0.4734147, 0, 1, 0.5215687, 1,
-0.1868002, 0.7358607, 0.6408557, 0, 1, 0.5254902, 1,
-0.1835149, 2.02587, -2.283263, 0, 1, 0.5333334, 1,
-0.1665867, -0.6375954, -3.105093, 0, 1, 0.5372549, 1,
-0.1663857, 0.9199772, -0.3730221, 0, 1, 0.5450981, 1,
-0.1646712, -0.9308359, -2.407243, 0, 1, 0.5490196, 1,
-0.1628644, 1.739056, 0.3495819, 0, 1, 0.5568628, 1,
-0.1592146, -0.7901455, -2.989393, 0, 1, 0.5607843, 1,
-0.1576999, -0.2086964, -2.649371, 0, 1, 0.5686275, 1,
-0.1575769, 0.8113448, -2.855751, 0, 1, 0.572549, 1,
-0.1555113, -1.59272, -3.355652, 0, 1, 0.5803922, 1,
-0.1548023, 0.009994572, -1.357044, 0, 1, 0.5843138, 1,
-0.1493393, 1.03785, -0.6719318, 0, 1, 0.5921569, 1,
-0.1488224, 0.5397367, -0.487325, 0, 1, 0.5960785, 1,
-0.1483798, -0.5444754, -2.948911, 0, 1, 0.6039216, 1,
-0.1479707, 0.3963722, 0.382682, 0, 1, 0.6117647, 1,
-0.145037, -0.5037169, -2.781088, 0, 1, 0.6156863, 1,
-0.1363797, 0.714325, -0.1250209, 0, 1, 0.6235294, 1,
-0.1360156, 1.720321, 0.6138465, 0, 1, 0.627451, 1,
-0.131102, -1.979717, -2.697011, 0, 1, 0.6352941, 1,
-0.1291984, -1.435483, -2.044809, 0, 1, 0.6392157, 1,
-0.1251708, 1.213576, -0.7754471, 0, 1, 0.6470588, 1,
-0.1232868, -0.01861082, -3.563164, 0, 1, 0.6509804, 1,
-0.1230661, 1.076812, 0.2054684, 0, 1, 0.6588235, 1,
-0.1208647, -0.7737785, -4.23034, 0, 1, 0.6627451, 1,
-0.1200976, 0.696076, -1.338702, 0, 1, 0.6705883, 1,
-0.1198398, 1.815908, -0.6647776, 0, 1, 0.6745098, 1,
-0.1167322, -0.1881303, -2.483741, 0, 1, 0.682353, 1,
-0.1160857, -1.862252, -3.411638, 0, 1, 0.6862745, 1,
-0.112368, 0.2904018, 0.2800117, 0, 1, 0.6941177, 1,
-0.1067401, -0.2697801, -1.195033, 0, 1, 0.7019608, 1,
-0.1009943, -0.3057768, -4.25993, 0, 1, 0.7058824, 1,
-0.09970263, -0.4186382, -1.084994, 0, 1, 0.7137255, 1,
-0.09718429, 1.686277, -0.4953772, 0, 1, 0.7176471, 1,
-0.09683573, -0.8448251, -3.675688, 0, 1, 0.7254902, 1,
-0.09626278, -1.130862, -2.663058, 0, 1, 0.7294118, 1,
-0.09467817, 1.208529, -0.131871, 0, 1, 0.7372549, 1,
-0.09256451, -1.450308, -2.525856, 0, 1, 0.7411765, 1,
-0.08781634, -1.274608, -4.629734, 0, 1, 0.7490196, 1,
-0.08419709, 0.482135, -0.6489089, 0, 1, 0.7529412, 1,
-0.08080023, -0.00963199, -0.3528762, 0, 1, 0.7607843, 1,
-0.08031496, -0.9111386, -3.232239, 0, 1, 0.7647059, 1,
-0.07530275, -0.7269059, -3.136158, 0, 1, 0.772549, 1,
-0.07473604, 0.3170651, -1.307501, 0, 1, 0.7764706, 1,
-0.07289378, 0.1349311, -0.9530044, 0, 1, 0.7843137, 1,
-0.07098329, -1.845726, -3.626827, 0, 1, 0.7882353, 1,
-0.0701104, -0.5613973, -3.408107, 0, 1, 0.7960784, 1,
-0.06480839, -0.7636357, -2.349525, 0, 1, 0.8039216, 1,
-0.06202077, 0.601305, -1.402546, 0, 1, 0.8078431, 1,
-0.0517223, -0.4753377, -2.52429, 0, 1, 0.8156863, 1,
-0.04759479, 0.4646784, -0.4484425, 0, 1, 0.8196079, 1,
-0.04409677, -0.8606111, -3.623412, 0, 1, 0.827451, 1,
-0.04198039, 0.1599539, -0.0004519949, 0, 1, 0.8313726, 1,
-0.04188413, 0.9928389, 0.3070372, 0, 1, 0.8392157, 1,
-0.04035666, 0.1364483, -0.3916121, 0, 1, 0.8431373, 1,
-0.03903962, 0.1212306, -0.5214753, 0, 1, 0.8509804, 1,
-0.03866816, -0.6511111, -3.119143, 0, 1, 0.854902, 1,
-0.03771517, 0.1690434, -0.007978908, 0, 1, 0.8627451, 1,
-0.03657804, -0.7170419, -3.192287, 0, 1, 0.8666667, 1,
-0.03386441, 1.62491, 1.56199, 0, 1, 0.8745098, 1,
-0.03375228, -1.338818, -4.208062, 0, 1, 0.8784314, 1,
-0.03304048, -1.057101, -3.119493, 0, 1, 0.8862745, 1,
-0.03235907, -1.063684, -3.148968, 0, 1, 0.8901961, 1,
-0.02692606, 0.788614, -0.5431404, 0, 1, 0.8980392, 1,
-0.01349165, -0.1993588, -2.742091, 0, 1, 0.9058824, 1,
-0.01036518, -0.4268244, -2.277622, 0, 1, 0.9098039, 1,
-0.008132521, 0.193354, -1.038953, 0, 1, 0.9176471, 1,
-0.005348788, 2.039641, 2.433068, 0, 1, 0.9215686, 1,
-0.001419162, 1.219603, -0.009418071, 0, 1, 0.9294118, 1,
-0.0004743876, 0.05587788, -1.503448, 0, 1, 0.9333333, 1,
0.0006345672, 0.08075219, 0.2627956, 0, 1, 0.9411765, 1,
0.001534934, 0.2428808, 0.1061424, 0, 1, 0.945098, 1,
0.005830522, -1.472013, 1.3637, 0, 1, 0.9529412, 1,
0.006438682, 1.289741, 0.1114583, 0, 1, 0.9568627, 1,
0.009482297, -0.4256918, 3.044012, 0, 1, 0.9647059, 1,
0.01094664, 0.889954, 0.09273331, 0, 1, 0.9686275, 1,
0.01392016, -0.03363599, 3.117835, 0, 1, 0.9764706, 1,
0.01425692, -0.05444766, 1.647888, 0, 1, 0.9803922, 1,
0.01484442, -0.647144, 3.219953, 0, 1, 0.9882353, 1,
0.01547083, -1.337439, 2.034557, 0, 1, 0.9921569, 1,
0.0179096, 0.5007649, 1.312454, 0, 1, 1, 1,
0.02150586, 0.9256704, -0.6474777, 0, 0.9921569, 1, 1,
0.02268767, 1.000658, -0.5004863, 0, 0.9882353, 1, 1,
0.02323348, -0.3318914, 5.078917, 0, 0.9803922, 1, 1,
0.03050951, -1.433352, 4.13114, 0, 0.9764706, 1, 1,
0.03772707, 1.661278, 0.1639125, 0, 0.9686275, 1, 1,
0.04356851, 1.538096, 0.4829589, 0, 0.9647059, 1, 1,
0.04780907, 1.090507, 2.124774, 0, 0.9568627, 1, 1,
0.04782671, 0.05531416, 0.4380776, 0, 0.9529412, 1, 1,
0.04992643, 2.286963, 1.549325, 0, 0.945098, 1, 1,
0.05022602, -1.648627, 2.068518, 0, 0.9411765, 1, 1,
0.05042804, 0.5021128, -0.5099626, 0, 0.9333333, 1, 1,
0.05119135, -0.00928274, 1.7306, 0, 0.9294118, 1, 1,
0.0521153, 0.2125174, -1.675038, 0, 0.9215686, 1, 1,
0.05235884, 1.458985, 0.01803997, 0, 0.9176471, 1, 1,
0.05421509, 0.9662135, -0.09206571, 0, 0.9098039, 1, 1,
0.05994551, 0.4752467, 1.478243, 0, 0.9058824, 1, 1,
0.06183872, 0.358803, -1.198081, 0, 0.8980392, 1, 1,
0.07605092, 0.2143609, 0.6843956, 0, 0.8901961, 1, 1,
0.08069488, 1.595551, -0.6569421, 0, 0.8862745, 1, 1,
0.08899037, 1.787287, -1.33862, 0, 0.8784314, 1, 1,
0.08955491, 0.6616298, 0.2964818, 0, 0.8745098, 1, 1,
0.09218381, 0.02490838, 0.3343824, 0, 0.8666667, 1, 1,
0.09222244, 1.227224, 0.9201712, 0, 0.8627451, 1, 1,
0.09495643, -0.2368522, 1.980244, 0, 0.854902, 1, 1,
0.09520637, -0.4094748, 3.458918, 0, 0.8509804, 1, 1,
0.09654478, -0.1686262, 0.7566612, 0, 0.8431373, 1, 1,
0.09721264, 0.912157, -0.5268986, 0, 0.8392157, 1, 1,
0.1015801, -0.4809505, 2.242518, 0, 0.8313726, 1, 1,
0.1018819, -0.03871355, 2.702682, 0, 0.827451, 1, 1,
0.1061522, -0.5119218, 1.619312, 0, 0.8196079, 1, 1,
0.1072195, -0.7868066, 2.118205, 0, 0.8156863, 1, 1,
0.1078199, 0.07606596, 1.269577, 0, 0.8078431, 1, 1,
0.109181, 0.580721, -1.123683, 0, 0.8039216, 1, 1,
0.1092686, -1.595016, 3.126002, 0, 0.7960784, 1, 1,
0.1102372, -0.7406368, 2.73943, 0, 0.7882353, 1, 1,
0.112068, 0.392516, 0.1432684, 0, 0.7843137, 1, 1,
0.1146792, 1.025551, 0.005090233, 0, 0.7764706, 1, 1,
0.1153307, -1.532661, 2.869649, 0, 0.772549, 1, 1,
0.1268043, -0.7158648, 3.248762, 0, 0.7647059, 1, 1,
0.1284403, -1.458302, 1.986419, 0, 0.7607843, 1, 1,
0.1288473, 0.6764734, -0.1651657, 0, 0.7529412, 1, 1,
0.1318267, -0.4836196, 0.6945751, 0, 0.7490196, 1, 1,
0.133339, -3.134979, 2.34912, 0, 0.7411765, 1, 1,
0.1341114, -2.002732, 3.783376, 0, 0.7372549, 1, 1,
0.1358375, 1.059001, 2.007338, 0, 0.7294118, 1, 1,
0.1364449, 0.9717904, 1.7805, 0, 0.7254902, 1, 1,
0.1379679, -0.5476398, 4.506856, 0, 0.7176471, 1, 1,
0.1453724, -0.2928319, 3.361402, 0, 0.7137255, 1, 1,
0.1457472, 0.7574228, -0.08494809, 0, 0.7058824, 1, 1,
0.1495474, 0.172352, 1.226919, 0, 0.6980392, 1, 1,
0.1499127, 1.750673, -2.092671, 0, 0.6941177, 1, 1,
0.1499823, -0.7762051, 4.034475, 0, 0.6862745, 1, 1,
0.1519904, -1.593677, 4.163979, 0, 0.682353, 1, 1,
0.1535553, 0.3365916, -1.879436, 0, 0.6745098, 1, 1,
0.1549751, -0.1217679, 1.692708, 0, 0.6705883, 1, 1,
0.1577376, -0.7735565, 2.780303, 0, 0.6627451, 1, 1,
0.1579417, 1.701081, -1.286987, 0, 0.6588235, 1, 1,
0.1586154, 0.7235077, 0.9456662, 0, 0.6509804, 1, 1,
0.1598823, -0.5746139, 0.636596, 0, 0.6470588, 1, 1,
0.1636025, 0.9774766, -0.2581808, 0, 0.6392157, 1, 1,
0.1643255, 0.9492619, -1.424966, 0, 0.6352941, 1, 1,
0.1706018, -0.01775649, 0.4113062, 0, 0.627451, 1, 1,
0.1788641, 0.3662989, -0.4606464, 0, 0.6235294, 1, 1,
0.1811703, 0.03726102, 0.9054944, 0, 0.6156863, 1, 1,
0.1826977, 0.3478753, -0.2310178, 0, 0.6117647, 1, 1,
0.1833655, 0.7334219, 1.569225, 0, 0.6039216, 1, 1,
0.1881051, -0.9640698, 2.227416, 0, 0.5960785, 1, 1,
0.1965816, 0.4438527, -0.8306471, 0, 0.5921569, 1, 1,
0.2019772, 0.6314275, 1.528061, 0, 0.5843138, 1, 1,
0.2036095, -0.6919582, 3.363451, 0, 0.5803922, 1, 1,
0.2052447, 1.058641, -0.3414893, 0, 0.572549, 1, 1,
0.2053557, -0.6502666, 1.745976, 0, 0.5686275, 1, 1,
0.2066066, 1.836667, 0.179577, 0, 0.5607843, 1, 1,
0.2087797, -1.521693, 3.379906, 0, 0.5568628, 1, 1,
0.2109084, -0.1836987, 2.097777, 0, 0.5490196, 1, 1,
0.2119758, -1.601661, 2.199781, 0, 0.5450981, 1, 1,
0.2121269, 1.030045, 1.070703, 0, 0.5372549, 1, 1,
0.2178614, -2.068985, 3.149276, 0, 0.5333334, 1, 1,
0.221284, 0.3511403, 1.411711, 0, 0.5254902, 1, 1,
0.223289, 0.2615412, 1.809402, 0, 0.5215687, 1, 1,
0.2240355, -0.3351467, 2.917513, 0, 0.5137255, 1, 1,
0.2241987, 0.007814287, 0.7790765, 0, 0.509804, 1, 1,
0.2244077, -1.053348, 3.114933, 0, 0.5019608, 1, 1,
0.2268782, 0.2742158, 1.539649, 0, 0.4941176, 1, 1,
0.2285346, 0.3967737, -0.5300742, 0, 0.4901961, 1, 1,
0.2296454, 0.6563169, -0.2665861, 0, 0.4823529, 1, 1,
0.2329106, -3.351274, 3.701043, 0, 0.4784314, 1, 1,
0.2390515, 0.1481944, 0.9513627, 0, 0.4705882, 1, 1,
0.2439106, 0.7690707, -0.2139899, 0, 0.4666667, 1, 1,
0.2469217, -0.3249093, 2.116571, 0, 0.4588235, 1, 1,
0.2471176, -2.124303, 4.831357, 0, 0.454902, 1, 1,
0.2473265, -0.6245161, 0.8207068, 0, 0.4470588, 1, 1,
0.2512647, -0.4042304, 1.779755, 0, 0.4431373, 1, 1,
0.2519238, 0.2916481, 1.142216, 0, 0.4352941, 1, 1,
0.2561521, 0.5326403, 0.1802507, 0, 0.4313726, 1, 1,
0.2567291, 0.9073239, -1.54348, 0, 0.4235294, 1, 1,
0.2580153, 1.685423, -1.46136, 0, 0.4196078, 1, 1,
0.2606368, -0.5783235, 2.097623, 0, 0.4117647, 1, 1,
0.2643192, 0.5207803, -0.2310643, 0, 0.4078431, 1, 1,
0.2647299, 0.06922574, 1.577303, 0, 0.4, 1, 1,
0.2673555, -0.3805386, 2.181877, 0, 0.3921569, 1, 1,
0.271283, 0.9678078, 2.68835, 0, 0.3882353, 1, 1,
0.272559, -0.8769838, 2.983801, 0, 0.3803922, 1, 1,
0.2776259, -1.091588, 1.772529, 0, 0.3764706, 1, 1,
0.2814746, 0.06124264, 2.011979, 0, 0.3686275, 1, 1,
0.2830319, 0.0760333, 1.024376, 0, 0.3647059, 1, 1,
0.2834113, -0.7091134, 2.646387, 0, 0.3568628, 1, 1,
0.2839114, 0.04649046, 1.891548, 0, 0.3529412, 1, 1,
0.2851597, 0.6544874, 2.037885, 0, 0.345098, 1, 1,
0.2870121, -0.4273137, 5.239612, 0, 0.3411765, 1, 1,
0.2873456, -0.6457676, 3.976302, 0, 0.3333333, 1, 1,
0.2893597, 0.1317794, 3.289438, 0, 0.3294118, 1, 1,
0.2931427, 0.5539581, -0.07540751, 0, 0.3215686, 1, 1,
0.2938732, -1.747357, 2.749154, 0, 0.3176471, 1, 1,
0.2992066, 1.890073, 1.101944, 0, 0.3098039, 1, 1,
0.3046392, -0.6354256, 3.463623, 0, 0.3058824, 1, 1,
0.3054247, -0.116317, 1.85661, 0, 0.2980392, 1, 1,
0.3085907, -0.03600511, 2.747011, 0, 0.2901961, 1, 1,
0.3088886, -1.036421, 3.737507, 0, 0.2862745, 1, 1,
0.3114565, -0.31183, 1.295271, 0, 0.2784314, 1, 1,
0.3118211, -0.1773391, 0.3007329, 0, 0.2745098, 1, 1,
0.3119022, 0.06767848, 0.4705406, 0, 0.2666667, 1, 1,
0.3154513, -1.413882, 2.309777, 0, 0.2627451, 1, 1,
0.3171937, 0.2291138, 1.318606, 0, 0.254902, 1, 1,
0.3180243, 3.002904, -0.7279264, 0, 0.2509804, 1, 1,
0.3227915, 0.1449622, 1.0177, 0, 0.2431373, 1, 1,
0.3241207, 1.11325, 0.8695432, 0, 0.2392157, 1, 1,
0.331392, 1.181367, -1.963646, 0, 0.2313726, 1, 1,
0.3328781, -0.5098125, 2.881883, 0, 0.227451, 1, 1,
0.3350422, -1.349515, 3.393665, 0, 0.2196078, 1, 1,
0.3388113, 0.2573432, 0.659683, 0, 0.2156863, 1, 1,
0.3389369, 0.5704531, 1.224138, 0, 0.2078431, 1, 1,
0.3417879, 2.828046, 0.8031534, 0, 0.2039216, 1, 1,
0.3421158, -1.752493, 3.16889, 0, 0.1960784, 1, 1,
0.349615, -0.3409061, 3.485633, 0, 0.1882353, 1, 1,
0.357434, 0.1130121, 0.8518067, 0, 0.1843137, 1, 1,
0.359043, 0.8736972, 1.492565, 0, 0.1764706, 1, 1,
0.3610471, -0.7257081, 2.584647, 0, 0.172549, 1, 1,
0.3643002, 1.486288, -0.4815217, 0, 0.1647059, 1, 1,
0.3657042, -0.9595323, 0.8092541, 0, 0.1607843, 1, 1,
0.3694856, 1.081436, -0.7643356, 0, 0.1529412, 1, 1,
0.376839, -0.1459136, 1.842155, 0, 0.1490196, 1, 1,
0.3772641, 1.043101, -1.434179, 0, 0.1411765, 1, 1,
0.3805288, 1.655649, 2.210397, 0, 0.1372549, 1, 1,
0.3811461, 0.8776139, 2.944319, 0, 0.1294118, 1, 1,
0.3876305, 1.288085, 0.4710867, 0, 0.1254902, 1, 1,
0.3897226, 0.7513869, -0.664686, 0, 0.1176471, 1, 1,
0.3996705, -1.068367, 2.351334, 0, 0.1137255, 1, 1,
0.4060671, 0.4697954, 0.6712542, 0, 0.1058824, 1, 1,
0.4107435, 0.454199, -0.7045054, 0, 0.09803922, 1, 1,
0.4108179, 0.2480671, 2.428284, 0, 0.09411765, 1, 1,
0.4116258, 1.009678, -0.4402814, 0, 0.08627451, 1, 1,
0.4120585, 1.068554, -0.8445759, 0, 0.08235294, 1, 1,
0.4132859, -0.8700131, 3.297636, 0, 0.07450981, 1, 1,
0.4201061, -0.002398209, 2.254471, 0, 0.07058824, 1, 1,
0.4231164, 0.08956368, 0.5671604, 0, 0.0627451, 1, 1,
0.4238527, -0.4363847, 2.525098, 0, 0.05882353, 1, 1,
0.4243226, -0.4853755, 2.225225, 0, 0.05098039, 1, 1,
0.4297436, 0.6558943, 1.013076, 0, 0.04705882, 1, 1,
0.4306356, -0.4011927, 2.799149, 0, 0.03921569, 1, 1,
0.4402753, 0.6409323, 0.2631925, 0, 0.03529412, 1, 1,
0.4413552, -1.282539, 1.365452, 0, 0.02745098, 1, 1,
0.4429062, -0.3712379, 2.572302, 0, 0.02352941, 1, 1,
0.4452429, 0.427949, -0.6302233, 0, 0.01568628, 1, 1,
0.4520362, 0.7559489, 1.250977, 0, 0.01176471, 1, 1,
0.4563792, 2.102778, 1.797841, 0, 0.003921569, 1, 1,
0.4578868, 1.128734, 0.2936813, 0.003921569, 0, 1, 1,
0.4613871, -1.223855, 3.616518, 0.007843138, 0, 1, 1,
0.4632306, -1.642743, 3.283742, 0.01568628, 0, 1, 1,
0.4641315, -0.9484692, 2.400293, 0.01960784, 0, 1, 1,
0.4683942, -1.025039, 2.321792, 0.02745098, 0, 1, 1,
0.4684106, 0.07682265, 2.646399, 0.03137255, 0, 1, 1,
0.4695962, 1.355682, -0.8101504, 0.03921569, 0, 1, 1,
0.474366, 1.177742, -0.06674769, 0.04313726, 0, 1, 1,
0.4772399, 1.119704, 0.358126, 0.05098039, 0, 1, 1,
0.4774804, 0.662346, 0.7017744, 0.05490196, 0, 1, 1,
0.47836, -1.044241, 3.457542, 0.0627451, 0, 1, 1,
0.4806891, -0.8117124, 0.5950882, 0.06666667, 0, 1, 1,
0.4877079, 1.446405, 1.548088, 0.07450981, 0, 1, 1,
0.4918985, 0.7113556, -0.8752308, 0.07843138, 0, 1, 1,
0.4950946, 1.179664, -1.634284, 0.08627451, 0, 1, 1,
0.4987205, 0.3817585, 1.134166, 0.09019608, 0, 1, 1,
0.5025577, 0.182557, 1.206736, 0.09803922, 0, 1, 1,
0.5039023, -1.356649, 0.6924937, 0.1058824, 0, 1, 1,
0.5048494, 0.1462537, 2.19983, 0.1098039, 0, 1, 1,
0.505172, 0.5774246, 0.1393425, 0.1176471, 0, 1, 1,
0.5061627, 0.9411443, 0.2092633, 0.1215686, 0, 1, 1,
0.5105862, 1.588439, 1.851381, 0.1294118, 0, 1, 1,
0.5187057, -1.157585, 5.60133, 0.1333333, 0, 1, 1,
0.5191322, 0.1175031, 0.5107085, 0.1411765, 0, 1, 1,
0.5201752, 0.8602846, 1.04659, 0.145098, 0, 1, 1,
0.5206707, 0.8391551, 0.3212422, 0.1529412, 0, 1, 1,
0.5211469, 0.4192472, 1.162014, 0.1568628, 0, 1, 1,
0.5318751, 0.5250212, 0.2032727, 0.1647059, 0, 1, 1,
0.534634, 0.5350913, 0.1876572, 0.1686275, 0, 1, 1,
0.5397568, 1.40737, -0.7084941, 0.1764706, 0, 1, 1,
0.5421675, -0.8639017, 2.824018, 0.1803922, 0, 1, 1,
0.5428519, 0.4174529, 1.725093, 0.1882353, 0, 1, 1,
0.5444778, 0.4038866, 0.5934399, 0.1921569, 0, 1, 1,
0.5465745, -1.434393, 1.446702, 0.2, 0, 1, 1,
0.5474999, 1.765213, 1.145097, 0.2078431, 0, 1, 1,
0.5479555, -0.1812807, 2.456302, 0.2117647, 0, 1, 1,
0.5533021, 1.394807, 0.7312543, 0.2196078, 0, 1, 1,
0.5548874, -1.01723, 3.673641, 0.2235294, 0, 1, 1,
0.5638328, -0.4121273, 2.470587, 0.2313726, 0, 1, 1,
0.5649483, 1.952019, 0.1093012, 0.2352941, 0, 1, 1,
0.5681191, -0.4502544, 2.13481, 0.2431373, 0, 1, 1,
0.5702602, -0.421907, 2.701594, 0.2470588, 0, 1, 1,
0.5709113, -0.183917, 1.842876, 0.254902, 0, 1, 1,
0.5713111, 1.405795, -0.8002269, 0.2588235, 0, 1, 1,
0.5715399, -1.047772, 2.385736, 0.2666667, 0, 1, 1,
0.5773283, -0.04158561, 2.85647, 0.2705882, 0, 1, 1,
0.5797455, -1.482522, 1.292575, 0.2784314, 0, 1, 1,
0.5806316, -0.001555628, 0.3015434, 0.282353, 0, 1, 1,
0.5815845, -2.244233, 1.919852, 0.2901961, 0, 1, 1,
0.5891451, 1.212075, -0.009863234, 0.2941177, 0, 1, 1,
0.5912855, -0.0191863, 2.651376, 0.3019608, 0, 1, 1,
0.5928114, -0.2190846, 1.802601, 0.3098039, 0, 1, 1,
0.5939398, 2.059326, 0.5723274, 0.3137255, 0, 1, 1,
0.6001568, -0.5875674, 2.324553, 0.3215686, 0, 1, 1,
0.602771, 0.6436883, -0.2139233, 0.3254902, 0, 1, 1,
0.6092721, 0.4888016, 1.899155, 0.3333333, 0, 1, 1,
0.6096912, 0.7897012, 0.9010743, 0.3372549, 0, 1, 1,
0.6192741, 0.5014399, 1.653572, 0.345098, 0, 1, 1,
0.6215527, -1.535442, 3.487239, 0.3490196, 0, 1, 1,
0.6218276, 0.3758363, 0.9227078, 0.3568628, 0, 1, 1,
0.6293609, 0.2589878, 1.12723, 0.3607843, 0, 1, 1,
0.6320638, 0.5440944, 0.6123343, 0.3686275, 0, 1, 1,
0.6340247, -0.9369501, 2.263931, 0.372549, 0, 1, 1,
0.6344416, 1.182518, 0.6295527, 0.3803922, 0, 1, 1,
0.6398364, -0.7695528, 4.397528, 0.3843137, 0, 1, 1,
0.6418249, 0.1697787, 0.5729749, 0.3921569, 0, 1, 1,
0.6442993, 1.449787, 0.3819779, 0.3960784, 0, 1, 1,
0.6456864, -1.736609, 3.349547, 0.4039216, 0, 1, 1,
0.6458777, -0.5522341, 2.611601, 0.4117647, 0, 1, 1,
0.647764, -0.5970806, 1.191446, 0.4156863, 0, 1, 1,
0.650839, -0.7405953, 2.775381, 0.4235294, 0, 1, 1,
0.6574717, 0.112215, 0.9339897, 0.427451, 0, 1, 1,
0.6625794, -1.417478, 3.871236, 0.4352941, 0, 1, 1,
0.6633104, -0.4123999, 2.483648, 0.4392157, 0, 1, 1,
0.673947, -0.3222091, 3.505465, 0.4470588, 0, 1, 1,
0.6788607, -0.2396372, 0.5895923, 0.4509804, 0, 1, 1,
0.6823809, -0.9473817, 1.199995, 0.4588235, 0, 1, 1,
0.6864225, -0.4874291, 2.934705, 0.4627451, 0, 1, 1,
0.6882781, 1.177697, 0.7500572, 0.4705882, 0, 1, 1,
0.6882818, 0.8639335, -0.1519958, 0.4745098, 0, 1, 1,
0.6922427, 0.7765238, 0.6704007, 0.4823529, 0, 1, 1,
0.6936921, 0.5977784, -0.8065672, 0.4862745, 0, 1, 1,
0.6995471, -1.043946, 2.312897, 0.4941176, 0, 1, 1,
0.7044652, 0.6020676, 0.2527248, 0.5019608, 0, 1, 1,
0.7057725, -1.904298, 3.200754, 0.5058824, 0, 1, 1,
0.7069715, -0.2085796, 2.692022, 0.5137255, 0, 1, 1,
0.7078938, -0.006959756, 2.709722, 0.5176471, 0, 1, 1,
0.7095567, 0.7822134, -0.7245061, 0.5254902, 0, 1, 1,
0.7122329, 0.7217073, 0.4111149, 0.5294118, 0, 1, 1,
0.7145491, -1.606461, 4.186915, 0.5372549, 0, 1, 1,
0.7208068, 0.2160715, 0.7889131, 0.5411765, 0, 1, 1,
0.72109, 0.6045145, 1.88513, 0.5490196, 0, 1, 1,
0.7246779, -0.9116969, 1.926029, 0.5529412, 0, 1, 1,
0.7275718, -2.077998, 2.704438, 0.5607843, 0, 1, 1,
0.7300524, 2.811496, 2.318645, 0.5647059, 0, 1, 1,
0.7348226, 1.469757, 0.1587928, 0.572549, 0, 1, 1,
0.7356907, 0.3234564, 1.431089, 0.5764706, 0, 1, 1,
0.7365337, -0.8518735, 2.227119, 0.5843138, 0, 1, 1,
0.7380065, -0.9649384, 3.096904, 0.5882353, 0, 1, 1,
0.7393681, 1.735893, 0.429232, 0.5960785, 0, 1, 1,
0.741762, 1.129203, 1.116451, 0.6039216, 0, 1, 1,
0.7425289, -0.7107185, 2.991017, 0.6078432, 0, 1, 1,
0.7434906, 0.4071952, 0.09365457, 0.6156863, 0, 1, 1,
0.7445573, -0.1100929, 0.7844596, 0.6196079, 0, 1, 1,
0.7553537, -0.6417386, 0.4672873, 0.627451, 0, 1, 1,
0.7592876, 0.1422482, 2.286889, 0.6313726, 0, 1, 1,
0.7633576, -0.8181106, 1.378251, 0.6392157, 0, 1, 1,
0.7650193, 0.2049828, 0.6701187, 0.6431373, 0, 1, 1,
0.7665164, -0.4743001, 1.462656, 0.6509804, 0, 1, 1,
0.7706532, 0.231342, 1.101667, 0.654902, 0, 1, 1,
0.775636, -0.7269564, 3.189576, 0.6627451, 0, 1, 1,
0.7793449, 2.081918, 0.286393, 0.6666667, 0, 1, 1,
0.7884554, -0.7282057, 2.932366, 0.6745098, 0, 1, 1,
0.7893627, -2.102193, 3.496763, 0.6784314, 0, 1, 1,
0.7898739, 0.1613397, 1.904641, 0.6862745, 0, 1, 1,
0.7925929, 1.420159, 0.4677161, 0.6901961, 0, 1, 1,
0.7953777, -0.3015106, 0.8204502, 0.6980392, 0, 1, 1,
0.7979674, 0.195205, -0.2635166, 0.7058824, 0, 1, 1,
0.802599, 0.684429, 2.388641, 0.7098039, 0, 1, 1,
0.8035823, -0.1101096, 3.109486, 0.7176471, 0, 1, 1,
0.8060156, 1.196098, 1.447172, 0.7215686, 0, 1, 1,
0.8173947, 0.3810009, -0.8625135, 0.7294118, 0, 1, 1,
0.8175554, -1.001305, 0.6094197, 0.7333333, 0, 1, 1,
0.8186458, -2.33297, 2.857593, 0.7411765, 0, 1, 1,
0.8187451, -1.181302, 1.806667, 0.7450981, 0, 1, 1,
0.8247948, 0.3477701, -0.1473048, 0.7529412, 0, 1, 1,
0.8255044, 1.766139, 2.002666, 0.7568628, 0, 1, 1,
0.8280708, -0.7384481, 3.541857, 0.7647059, 0, 1, 1,
0.8304217, 1.729706, -0.1900718, 0.7686275, 0, 1, 1,
0.8404912, 0.4211398, 0.7919153, 0.7764706, 0, 1, 1,
0.8478944, 0.01787249, 0.921677, 0.7803922, 0, 1, 1,
0.84967, 1.102721, 1.412119, 0.7882353, 0, 1, 1,
0.8548225, 1.130879, 0.1350539, 0.7921569, 0, 1, 1,
0.8557664, -0.4485119, 4.795721, 0.8, 0, 1, 1,
0.8604524, -0.5384411, 0.2294636, 0.8078431, 0, 1, 1,
0.8730778, 0.3198255, 1.100782, 0.8117647, 0, 1, 1,
0.8744863, -0.214917, 2.359325, 0.8196079, 0, 1, 1,
0.8764386, 0.0007781101, 1.463631, 0.8235294, 0, 1, 1,
0.8803546, -0.7905729, 2.287098, 0.8313726, 0, 1, 1,
0.8965371, -1.264114, 2.856128, 0.8352941, 0, 1, 1,
0.8969954, -1.075548, 3.107205, 0.8431373, 0, 1, 1,
0.9010606, 0.3659925, 1.790352, 0.8470588, 0, 1, 1,
0.9015404, -0.2485205, 2.172733, 0.854902, 0, 1, 1,
0.9027411, 0.8378957, 1.111821, 0.8588235, 0, 1, 1,
0.9043125, 1.357234, 0.5560812, 0.8666667, 0, 1, 1,
0.914498, -0.5486892, 2.389032, 0.8705882, 0, 1, 1,
0.9201878, 0.1500738, 2.279052, 0.8784314, 0, 1, 1,
0.9292349, 0.2396039, 0.9371351, 0.8823529, 0, 1, 1,
0.9313254, -0.8602714, 1.698922, 0.8901961, 0, 1, 1,
0.9326898, -0.9440367, 1.906218, 0.8941177, 0, 1, 1,
0.9389015, -0.7342462, 3.991141, 0.9019608, 0, 1, 1,
0.9407387, 0.3836669, 2.124333, 0.9098039, 0, 1, 1,
0.9417788, -0.6538717, 0.8423184, 0.9137255, 0, 1, 1,
0.944726, -0.178871, 1.777274, 0.9215686, 0, 1, 1,
0.9447357, 0.4088439, 3.043946, 0.9254902, 0, 1, 1,
0.9449654, -0.8525382, 2.039361, 0.9333333, 0, 1, 1,
0.9474152, 1.233393, 1.648189, 0.9372549, 0, 1, 1,
0.9474394, 1.007124, 0.6817689, 0.945098, 0, 1, 1,
0.9532431, 0.7844026, 1.852952, 0.9490196, 0, 1, 1,
0.9545923, 0.3041796, 2.745332, 0.9568627, 0, 1, 1,
0.9637915, 0.1605343, 1.549851, 0.9607843, 0, 1, 1,
0.9832237, -0.6555011, 2.350397, 0.9686275, 0, 1, 1,
0.9866477, -1.069735, 3.028352, 0.972549, 0, 1, 1,
0.9894357, -0.687467, 1.930581, 0.9803922, 0, 1, 1,
0.9896161, -0.5865052, 1.794706, 0.9843137, 0, 1, 1,
0.9919784, 0.8851988, 0.3384558, 0.9921569, 0, 1, 1,
0.9920949, 2.594588, -0.8165536, 0.9960784, 0, 1, 1,
0.993032, -0.5486353, 1.710202, 1, 0, 0.9960784, 1,
0.9954596, 0.116033, 1.611851, 1, 0, 0.9882353, 1,
0.9979202, 0.3063645, 0.4112448, 1, 0, 0.9843137, 1,
0.9997086, -0.2728402, 2.321564, 1, 0, 0.9764706, 1,
1.002752, -0.06381709, 2.229361, 1, 0, 0.972549, 1,
1.006127, -0.5392796, 3.929123, 1, 0, 0.9647059, 1,
1.008551, -1.443515, 3.346724, 1, 0, 0.9607843, 1,
1.010273, -1.763051, 3.427815, 1, 0, 0.9529412, 1,
1.011933, 0.8115284, 0.5954041, 1, 0, 0.9490196, 1,
1.013656, -0.1518174, 1.326797, 1, 0, 0.9411765, 1,
1.017253, -0.2160641, 1.687749, 1, 0, 0.9372549, 1,
1.020658, -0.8177844, 2.22066, 1, 0, 0.9294118, 1,
1.04413, 1.673328, 1.186848, 1, 0, 0.9254902, 1,
1.045418, 0.06794453, 3.026163, 1, 0, 0.9176471, 1,
1.046745, 1.774363, -1.092376, 1, 0, 0.9137255, 1,
1.049551, -0.3707041, 2.65394, 1, 0, 0.9058824, 1,
1.057377, -0.1494052, 1.266833, 1, 0, 0.9019608, 1,
1.058714, -0.7492961, 1.904857, 1, 0, 0.8941177, 1,
1.060315, 1.690568, 0.8634673, 1, 0, 0.8862745, 1,
1.065636, -0.3511793, 1.763834, 1, 0, 0.8823529, 1,
1.068557, 0.126232, 0.6113959, 1, 0, 0.8745098, 1,
1.072558, -0.4685271, 2.558053, 1, 0, 0.8705882, 1,
1.072981, 0.9286909, 1.74867, 1, 0, 0.8627451, 1,
1.076877, 0.890308, 1.261057, 1, 0, 0.8588235, 1,
1.079617, 0.7817555, -0.4662838, 1, 0, 0.8509804, 1,
1.079893, -1.312271, 4.449821, 1, 0, 0.8470588, 1,
1.082125, -1.86907, 2.731633, 1, 0, 0.8392157, 1,
1.08757, 0.01355472, 2.624495, 1, 0, 0.8352941, 1,
1.088002, -1.343046, 1.29082, 1, 0, 0.827451, 1,
1.092295, 0.3562318, 2.440118, 1, 0, 0.8235294, 1,
1.093926, 1.302029, 1.23956, 1, 0, 0.8156863, 1,
1.103609, 1.45904, 1.51323, 1, 0, 0.8117647, 1,
1.112324, 1.12572, -0.4602337, 1, 0, 0.8039216, 1,
1.115407, -0.8927392, 1.222713, 1, 0, 0.7960784, 1,
1.11949, -1.849577, 3.001769, 1, 0, 0.7921569, 1,
1.12004, -0.7789484, 3.874613, 1, 0, 0.7843137, 1,
1.122697, -1.067259, 1.65623, 1, 0, 0.7803922, 1,
1.124292, -0.0170809, 1.075983, 1, 0, 0.772549, 1,
1.127608, 0.0171094, 2.871006, 1, 0, 0.7686275, 1,
1.130706, 0.3640192, 2.789898, 1, 0, 0.7607843, 1,
1.145706, -0.1336156, 1.92181, 1, 0, 0.7568628, 1,
1.1507, -0.2674142, 2.027957, 1, 0, 0.7490196, 1,
1.150939, 0.1274032, 0.1510677, 1, 0, 0.7450981, 1,
1.156021, -2.590692, 2.89711, 1, 0, 0.7372549, 1,
1.158056, -1.314249, 0.3769665, 1, 0, 0.7333333, 1,
1.160688, -0.5948344, 1.8039, 1, 0, 0.7254902, 1,
1.163552, -1.214192, 0.7928047, 1, 0, 0.7215686, 1,
1.166955, 1.455215, -0.4469086, 1, 0, 0.7137255, 1,
1.170327, 0.3215679, 2.319761, 1, 0, 0.7098039, 1,
1.171615, 1.557164, 0.7133269, 1, 0, 0.7019608, 1,
1.184423, -2.133138, 1.942773, 1, 0, 0.6941177, 1,
1.187215, -0.1704795, 2.864944, 1, 0, 0.6901961, 1,
1.187934, -0.4974936, 2.088443, 1, 0, 0.682353, 1,
1.191159, 0.8337566, 0.8218699, 1, 0, 0.6784314, 1,
1.193018, 0.902476, 1.403166, 1, 0, 0.6705883, 1,
1.193389, -0.8533825, 1.488326, 1, 0, 0.6666667, 1,
1.194746, -0.9346069, 3.045107, 1, 0, 0.6588235, 1,
1.198182, 0.6473361, 3.049029, 1, 0, 0.654902, 1,
1.201046, 0.2049819, 3.324096, 1, 0, 0.6470588, 1,
1.222145, -0.3173707, -0.4498943, 1, 0, 0.6431373, 1,
1.234053, 0.5061635, 1.52144, 1, 0, 0.6352941, 1,
1.234342, -1.946811, 0.9592196, 1, 0, 0.6313726, 1,
1.23947, -0.8953591, 1.965775, 1, 0, 0.6235294, 1,
1.241075, -1.635655, 1.097947, 1, 0, 0.6196079, 1,
1.246458, 0.4094003, 0.6406664, 1, 0, 0.6117647, 1,
1.249989, 0.2486517, 1.834079, 1, 0, 0.6078432, 1,
1.258907, -1.000852, 3.165559, 1, 0, 0.6, 1,
1.259897, -0.8275186, 2.589288, 1, 0, 0.5921569, 1,
1.260681, -0.7283536, 2.490948, 1, 0, 0.5882353, 1,
1.262241, -1.421397, 3.3337, 1, 0, 0.5803922, 1,
1.262495, 0.09262858, 2.458064, 1, 0, 0.5764706, 1,
1.265432, 2.333606, -1.663712, 1, 0, 0.5686275, 1,
1.284835, -0.2559801, 1.998126, 1, 0, 0.5647059, 1,
1.29271, 1.098551, 1.209973, 1, 0, 0.5568628, 1,
1.293311, -1.626363, 1.332352, 1, 0, 0.5529412, 1,
1.294076, -1.324747, 3.255781, 1, 0, 0.5450981, 1,
1.297804, 0.05662411, 2.739706, 1, 0, 0.5411765, 1,
1.299779, -2.205137, 4.256464, 1, 0, 0.5333334, 1,
1.31586, 0.2487843, 1.875543, 1, 0, 0.5294118, 1,
1.324614, -0.732974, 2.431285, 1, 0, 0.5215687, 1,
1.326298, 1.602843, 0.02993214, 1, 0, 0.5176471, 1,
1.327222, 0.04592083, 1.07848, 1, 0, 0.509804, 1,
1.333325, 1.006209, 0.162661, 1, 0, 0.5058824, 1,
1.342895, 1.817551, -1.117164, 1, 0, 0.4980392, 1,
1.351634, -0.2889527, 1.177788, 1, 0, 0.4901961, 1,
1.361944, 1.534886, -1.115023, 1, 0, 0.4862745, 1,
1.368142, -0.9961312, 2.442377, 1, 0, 0.4784314, 1,
1.37746, 0.4992001, 0.9099968, 1, 0, 0.4745098, 1,
1.37825, -0.227653, 3.367028, 1, 0, 0.4666667, 1,
1.380697, -0.5741092, 3.401271, 1, 0, 0.4627451, 1,
1.400203, 1.561634, 0.5958135, 1, 0, 0.454902, 1,
1.409179, 1.450312, 1.211047, 1, 0, 0.4509804, 1,
1.412736, 2.289513, 1.551895, 1, 0, 0.4431373, 1,
1.417871, 0.3764188, 3.121808, 1, 0, 0.4392157, 1,
1.439989, 0.07934529, 1.934222, 1, 0, 0.4313726, 1,
1.44771, 1.056057, 2.916984, 1, 0, 0.427451, 1,
1.452406, -2.797092, 1.22008, 1, 0, 0.4196078, 1,
1.452953, 2.192184, 1.578672, 1, 0, 0.4156863, 1,
1.47087, -1.715057, 3.101956, 1, 0, 0.4078431, 1,
1.472866, -0.4644576, 1.423329, 1, 0, 0.4039216, 1,
1.475237, 1.524353, 0.427837, 1, 0, 0.3960784, 1,
1.487787, 0.7374373, 2.692695, 1, 0, 0.3882353, 1,
1.496744, 0.5647446, 0.9215891, 1, 0, 0.3843137, 1,
1.505418, -2.134145, 1.795704, 1, 0, 0.3764706, 1,
1.507089, 0.7802793, 0.602733, 1, 0, 0.372549, 1,
1.512029, -0.4950962, 3.64963, 1, 0, 0.3647059, 1,
1.513584, -0.5116757, 0.5880271, 1, 0, 0.3607843, 1,
1.519953, 0.5551139, 2.067472, 1, 0, 0.3529412, 1,
1.523705, 1.533993, 1.729068, 1, 0, 0.3490196, 1,
1.526328, 1.498391, 0.8071448, 1, 0, 0.3411765, 1,
1.535006, -0.1828802, 1.61153, 1, 0, 0.3372549, 1,
1.549589, -1.270394, 2.75989, 1, 0, 0.3294118, 1,
1.55027, 0.698035, 1.215982, 1, 0, 0.3254902, 1,
1.561193, -0.245069, 2.546647, 1, 0, 0.3176471, 1,
1.561357, 0.4951647, 1.448082, 1, 0, 0.3137255, 1,
1.592785, -0.5562833, 1.095814, 1, 0, 0.3058824, 1,
1.593121, 2.114759, 1.631936, 1, 0, 0.2980392, 1,
1.594, -0.002765088, 0.7444106, 1, 0, 0.2941177, 1,
1.610384, -0.4940825, 1.398971, 1, 0, 0.2862745, 1,
1.613118, -0.2122184, 1.989134, 1, 0, 0.282353, 1,
1.633529, 1.355626, 0.9323726, 1, 0, 0.2745098, 1,
1.640949, -0.3993791, 1.34629, 1, 0, 0.2705882, 1,
1.655453, 0.2956646, 1.624035, 1, 0, 0.2627451, 1,
1.662624, -0.6747735, 2.307961, 1, 0, 0.2588235, 1,
1.67254, -2.203004, 4.071437, 1, 0, 0.2509804, 1,
1.710176, 1.121235, 1.170427, 1, 0, 0.2470588, 1,
1.729353, 1.963445, 2.774671, 1, 0, 0.2392157, 1,
1.731373, 0.2128185, 3.681263, 1, 0, 0.2352941, 1,
1.735568, 0.4247154, 2.749288, 1, 0, 0.227451, 1,
1.737924, -2.675879, 1.991609, 1, 0, 0.2235294, 1,
1.741594, -0.9569894, 1.867661, 1, 0, 0.2156863, 1,
1.743894, 1.130375, -0.8041096, 1, 0, 0.2117647, 1,
1.751897, 0.009959331, 1.780624, 1, 0, 0.2039216, 1,
1.753431, -0.03216439, 1.081171, 1, 0, 0.1960784, 1,
1.76045, 1.93723, 0.1557761, 1, 0, 0.1921569, 1,
1.760694, -0.6953533, 1.773216, 1, 0, 0.1843137, 1,
1.771966, 0.002079003, 2.297853, 1, 0, 0.1803922, 1,
1.77653, -0.7094231, 3.341286, 1, 0, 0.172549, 1,
1.779333, 0.8951973, 1.943354, 1, 0, 0.1686275, 1,
1.801067, -1.487808, 2.089325, 1, 0, 0.1607843, 1,
1.814787, -0.3815421, 3.412, 1, 0, 0.1568628, 1,
1.840468, 0.4272176, 0.6897695, 1, 0, 0.1490196, 1,
1.907992, -0.5606838, 2.826179, 1, 0, 0.145098, 1,
1.908377, -0.5065545, 2.276586, 1, 0, 0.1372549, 1,
1.913501, -0.05282129, 2.005816, 1, 0, 0.1333333, 1,
1.9198, 1.019382, 1.029402, 1, 0, 0.1254902, 1,
1.933079, -1.419866, 1.628848, 1, 0, 0.1215686, 1,
1.952719, -0.8233556, 0.7552185, 1, 0, 0.1137255, 1,
1.994247, 0.439303, 2.739675, 1, 0, 0.1098039, 1,
2.002263, -0.1906777, 1.604711, 1, 0, 0.1019608, 1,
2.013174, 1.677598, 2.429127, 1, 0, 0.09411765, 1,
2.026774, 0.707301, 1.236111, 1, 0, 0.09019608, 1,
2.042502, -0.4284407, 1.582237, 1, 0, 0.08235294, 1,
2.057719, 0.7599078, 2.522354, 1, 0, 0.07843138, 1,
2.114521, 0.1686427, 0.7981803, 1, 0, 0.07058824, 1,
2.145274, 1.488147, -0.7482442, 1, 0, 0.06666667, 1,
2.219591, 0.4201142, 0.2150972, 1, 0, 0.05882353, 1,
2.252302, 0.4919973, 2.313509, 1, 0, 0.05490196, 1,
2.265038, -0.7766247, 1.388532, 1, 0, 0.04705882, 1,
2.276663, 0.3348463, 0.9564849, 1, 0, 0.04313726, 1,
2.361659, -0.08863176, 2.551644, 1, 0, 0.03529412, 1,
2.374897, -0.3564823, 0.884622, 1, 0, 0.03137255, 1,
2.54074, 1.835476, 2.140919, 1, 0, 0.02352941, 1,
2.708344, -1.687062, 2.702305, 1, 0, 0.01960784, 1,
2.950927, -0.2054176, 1.056087, 1, 0, 0.01176471, 1,
2.989287, -0.5422214, 2.488633, 1, 0, 0.007843138, 1
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
-0.530453, -4.481785, -6.833138, 0, -0.5, 0.5, 0.5,
-0.530453, -4.481785, -6.833138, 1, -0.5, 0.5, 0.5,
-0.530453, -4.481785, -6.833138, 1, 1.5, 0.5, 0.5,
-0.530453, -4.481785, -6.833138, 0, 1.5, 0.5, 0.5
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
-5.243385, -0.1970482, -6.833138, 0, -0.5, 0.5, 0.5,
-5.243385, -0.1970482, -6.833138, 1, -0.5, 0.5, 0.5,
-5.243385, -0.1970482, -6.833138, 1, 1.5, 0.5, 0.5,
-5.243385, -0.1970482, -6.833138, 0, 1.5, 0.5, 0.5
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
-5.243385, -4.481785, 0.285183, 0, -0.5, 0.5, 0.5,
-5.243385, -4.481785, 0.285183, 1, -0.5, 0.5, 0.5,
-5.243385, -4.481785, 0.285183, 1, 1.5, 0.5, 0.5,
-5.243385, -4.481785, 0.285183, 0, 1.5, 0.5, 0.5
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
-4, -3.492999, -5.190448,
2, -3.492999, -5.190448,
-4, -3.492999, -5.190448,
-4, -3.657797, -5.46423,
-2, -3.492999, -5.190448,
-2, -3.657797, -5.46423,
0, -3.492999, -5.190448,
0, -3.657797, -5.46423,
2, -3.492999, -5.190448,
2, -3.657797, -5.46423
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
"-4",
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
-4, -3.987392, -6.011793, 0, -0.5, 0.5, 0.5,
-4, -3.987392, -6.011793, 1, -0.5, 0.5, 0.5,
-4, -3.987392, -6.011793, 1, 1.5, 0.5, 0.5,
-4, -3.987392, -6.011793, 0, 1.5, 0.5, 0.5,
-2, -3.987392, -6.011793, 0, -0.5, 0.5, 0.5,
-2, -3.987392, -6.011793, 1, -0.5, 0.5, 0.5,
-2, -3.987392, -6.011793, 1, 1.5, 0.5, 0.5,
-2, -3.987392, -6.011793, 0, 1.5, 0.5, 0.5,
0, -3.987392, -6.011793, 0, -0.5, 0.5, 0.5,
0, -3.987392, -6.011793, 1, -0.5, 0.5, 0.5,
0, -3.987392, -6.011793, 1, 1.5, 0.5, 0.5,
0, -3.987392, -6.011793, 0, 1.5, 0.5, 0.5,
2, -3.987392, -6.011793, 0, -0.5, 0.5, 0.5,
2, -3.987392, -6.011793, 1, -0.5, 0.5, 0.5,
2, -3.987392, -6.011793, 1, 1.5, 0.5, 0.5,
2, -3.987392, -6.011793, 0, 1.5, 0.5, 0.5
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
-4.155786, -3, -5.190448,
-4.155786, 3, -5.190448,
-4.155786, -3, -5.190448,
-4.337052, -3, -5.46423,
-4.155786, -2, -5.190448,
-4.337052, -2, -5.46423,
-4.155786, -1, -5.190448,
-4.337052, -1, -5.46423,
-4.155786, 0, -5.190448,
-4.337052, 0, -5.46423,
-4.155786, 1, -5.190448,
-4.337052, 1, -5.46423,
-4.155786, 2, -5.190448,
-4.337052, 2, -5.46423,
-4.155786, 3, -5.190448,
-4.337052, 3, -5.46423
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
-4.699585, -3, -6.011793, 0, -0.5, 0.5, 0.5,
-4.699585, -3, -6.011793, 1, -0.5, 0.5, 0.5,
-4.699585, -3, -6.011793, 1, 1.5, 0.5, 0.5,
-4.699585, -3, -6.011793, 0, 1.5, 0.5, 0.5,
-4.699585, -2, -6.011793, 0, -0.5, 0.5, 0.5,
-4.699585, -2, -6.011793, 1, -0.5, 0.5, 0.5,
-4.699585, -2, -6.011793, 1, 1.5, 0.5, 0.5,
-4.699585, -2, -6.011793, 0, 1.5, 0.5, 0.5,
-4.699585, -1, -6.011793, 0, -0.5, 0.5, 0.5,
-4.699585, -1, -6.011793, 1, -0.5, 0.5, 0.5,
-4.699585, -1, -6.011793, 1, 1.5, 0.5, 0.5,
-4.699585, -1, -6.011793, 0, 1.5, 0.5, 0.5,
-4.699585, 0, -6.011793, 0, -0.5, 0.5, 0.5,
-4.699585, 0, -6.011793, 1, -0.5, 0.5, 0.5,
-4.699585, 0, -6.011793, 1, 1.5, 0.5, 0.5,
-4.699585, 0, -6.011793, 0, 1.5, 0.5, 0.5,
-4.699585, 1, -6.011793, 0, -0.5, 0.5, 0.5,
-4.699585, 1, -6.011793, 1, -0.5, 0.5, 0.5,
-4.699585, 1, -6.011793, 1, 1.5, 0.5, 0.5,
-4.699585, 1, -6.011793, 0, 1.5, 0.5, 0.5,
-4.699585, 2, -6.011793, 0, -0.5, 0.5, 0.5,
-4.699585, 2, -6.011793, 1, -0.5, 0.5, 0.5,
-4.699585, 2, -6.011793, 1, 1.5, 0.5, 0.5,
-4.699585, 2, -6.011793, 0, 1.5, 0.5, 0.5,
-4.699585, 3, -6.011793, 0, -0.5, 0.5, 0.5,
-4.699585, 3, -6.011793, 1, -0.5, 0.5, 0.5,
-4.699585, 3, -6.011793, 1, 1.5, 0.5, 0.5,
-4.699585, 3, -6.011793, 0, 1.5, 0.5, 0.5
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
-4.155786, -3.492999, -4,
-4.155786, -3.492999, 4,
-4.155786, -3.492999, -4,
-4.337052, -3.657797, -4,
-4.155786, -3.492999, -2,
-4.337052, -3.657797, -2,
-4.155786, -3.492999, 0,
-4.337052, -3.657797, 0,
-4.155786, -3.492999, 2,
-4.337052, -3.657797, 2,
-4.155786, -3.492999, 4,
-4.337052, -3.657797, 4
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
-4.699585, -3.987392, -4, 0, -0.5, 0.5, 0.5,
-4.699585, -3.987392, -4, 1, -0.5, 0.5, 0.5,
-4.699585, -3.987392, -4, 1, 1.5, 0.5, 0.5,
-4.699585, -3.987392, -4, 0, 1.5, 0.5, 0.5,
-4.699585, -3.987392, -2, 0, -0.5, 0.5, 0.5,
-4.699585, -3.987392, -2, 1, -0.5, 0.5, 0.5,
-4.699585, -3.987392, -2, 1, 1.5, 0.5, 0.5,
-4.699585, -3.987392, -2, 0, 1.5, 0.5, 0.5,
-4.699585, -3.987392, 0, 0, -0.5, 0.5, 0.5,
-4.699585, -3.987392, 0, 1, -0.5, 0.5, 0.5,
-4.699585, -3.987392, 0, 1, 1.5, 0.5, 0.5,
-4.699585, -3.987392, 0, 0, 1.5, 0.5, 0.5,
-4.699585, -3.987392, 2, 0, -0.5, 0.5, 0.5,
-4.699585, -3.987392, 2, 1, -0.5, 0.5, 0.5,
-4.699585, -3.987392, 2, 1, 1.5, 0.5, 0.5,
-4.699585, -3.987392, 2, 0, 1.5, 0.5, 0.5,
-4.699585, -3.987392, 4, 0, -0.5, 0.5, 0.5,
-4.699585, -3.987392, 4, 1, -0.5, 0.5, 0.5,
-4.699585, -3.987392, 4, 1, 1.5, 0.5, 0.5,
-4.699585, -3.987392, 4, 0, 1.5, 0.5, 0.5
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
-4.155786, -3.492999, -5.190448,
-4.155786, 3.098903, -5.190448,
-4.155786, -3.492999, 5.760814,
-4.155786, 3.098903, 5.760814,
-4.155786, -3.492999, -5.190448,
-4.155786, -3.492999, 5.760814,
-4.155786, 3.098903, -5.190448,
-4.155786, 3.098903, 5.760814,
-4.155786, -3.492999, -5.190448,
3.09488, -3.492999, -5.190448,
-4.155786, -3.492999, 5.760814,
3.09488, -3.492999, 5.760814,
-4.155786, 3.098903, -5.190448,
3.09488, 3.098903, -5.190448,
-4.155786, 3.098903, 5.760814,
3.09488, 3.098903, 5.760814,
3.09488, -3.492999, -5.190448,
3.09488, 3.098903, -5.190448,
3.09488, -3.492999, 5.760814,
3.09488, 3.098903, 5.760814,
3.09488, -3.492999, -5.190448,
3.09488, -3.492999, 5.760814,
3.09488, 3.098903, -5.190448,
3.09488, 3.098903, 5.760814
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
var radius = 7.847071;
var distance = 34.91251;
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
mvMatrix.translate( 0.530453, 0.1970482, -0.285183 );
mvMatrix.scale( 1.170156, 1.287095, 0.7747424 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.91251);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Gibberellic_acid<-read.table("Gibberellic_acid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-4.050193, 1.150212, -1.317233, 0, 0, 1, 1, 1,
-3.162369, -1.378505, -1.943381, 1, 0, 0, 1, 1,
-3.044291, -1.462918, -1.312939, 1, 0, 0, 1, 1,
-2.732674, 0.7350109, -1.307386, 1, 0, 0, 1, 1,
-2.699309, -0.6161628, -2.050451, 1, 0, 0, 1, 1,
-2.473164, -1.298537, -1.180722, 1, 0, 0, 1, 1,
-2.429252, -0.8528559, -2.777231, 0, 0, 0, 1, 1,
-2.41215, -0.7770316, -0.4871111, 0, 0, 0, 1, 1,
-2.328051, -0.6765514, -1.702529, 0, 0, 0, 1, 1,
-2.253772, 1.00567, 0.9284947, 0, 0, 0, 1, 1,
-2.231494, 0.02975699, 0.1082408, 0, 0, 0, 1, 1,
-2.227558, -1.051621, 0.4109256, 0, 0, 0, 1, 1,
-2.221997, -0.7160943, -2.609919, 0, 0, 0, 1, 1,
-2.198488, -2.263675, -2.718509, 1, 1, 1, 1, 1,
-2.197257, -0.7397263, -1.372638, 1, 1, 1, 1, 1,
-2.140533, -0.7133835, -2.070819, 1, 1, 1, 1, 1,
-2.138057, 0.9694118, -1.574637, 1, 1, 1, 1, 1,
-2.089756, -0.1659888, -1.874585, 1, 1, 1, 1, 1,
-2.068441, -0.2763949, -0.6056713, 1, 1, 1, 1, 1,
-2.063887, 0.4391264, 0.3746555, 1, 1, 1, 1, 1,
-2.036267, 0.5795247, -0.9337217, 1, 1, 1, 1, 1,
-2.013789, 0.004369682, -2.424591, 1, 1, 1, 1, 1,
-1.998061, -0.3230387, -1.88191, 1, 1, 1, 1, 1,
-1.993808, 0.1420331, -1.753455, 1, 1, 1, 1, 1,
-1.993308, 0.1522281, -1.789249, 1, 1, 1, 1, 1,
-1.988974, 1.10031, -2.200037, 1, 1, 1, 1, 1,
-1.962345, -0.3468273, -1.487919, 1, 1, 1, 1, 1,
-1.942729, 0.7686707, -0.3185148, 1, 1, 1, 1, 1,
-1.886359, 1.379712, 0.8991747, 0, 0, 1, 1, 1,
-1.876094, -2.794174, -1.932329, 1, 0, 0, 1, 1,
-1.864143, -1.552882, -3.273374, 1, 0, 0, 1, 1,
-1.852266, -1.549692, -1.869689, 1, 0, 0, 1, 1,
-1.815332, 0.3749316, -0.7386156, 1, 0, 0, 1, 1,
-1.796475, -0.1508258, -1.347151, 1, 0, 0, 1, 1,
-1.79454, 0.2643915, -1.517931, 0, 0, 0, 1, 1,
-1.782686, -0.3524088, -2.002562, 0, 0, 0, 1, 1,
-1.77798, -0.7634318, -1.721384, 0, 0, 0, 1, 1,
-1.7666, -1.255339, -1.244009, 0, 0, 0, 1, 1,
-1.736938, 0.5663615, -0.471159, 0, 0, 0, 1, 1,
-1.725586, 1.022056, -0.629415, 0, 0, 0, 1, 1,
-1.705058, -0.2126222, -0.1610277, 0, 0, 0, 1, 1,
-1.693856, 0.8775411, -0.9274291, 1, 1, 1, 1, 1,
-1.678335, 0.2698697, -0.1038845, 1, 1, 1, 1, 1,
-1.654766, 1.385406, -1.721001, 1, 1, 1, 1, 1,
-1.649275, -0.3115727, -2.763849, 1, 1, 1, 1, 1,
-1.630879, 0.289939, -3.038705, 1, 1, 1, 1, 1,
-1.626704, 0.2969703, -2.472596, 1, 1, 1, 1, 1,
-1.626594, 0.5080924, -2.664945, 1, 1, 1, 1, 1,
-1.617363, -1.110093, -0.6609211, 1, 1, 1, 1, 1,
-1.595905, 0.2309927, -2.670034, 1, 1, 1, 1, 1,
-1.595867, 1.756209, -1.601933, 1, 1, 1, 1, 1,
-1.591346, 0.4053984, -0.1339645, 1, 1, 1, 1, 1,
-1.574911, -1.064404, -1.457756, 1, 1, 1, 1, 1,
-1.570644, 0.4252451, -2.463995, 1, 1, 1, 1, 1,
-1.557673, 0.2925709, 0.3999803, 1, 1, 1, 1, 1,
-1.549403, -0.756807, -0.9301851, 1, 1, 1, 1, 1,
-1.546365, -2.274558, -2.330591, 0, 0, 1, 1, 1,
-1.543378, 0.6109295, -2.809698, 1, 0, 0, 1, 1,
-1.533471, 0.5896744, -1.154402, 1, 0, 0, 1, 1,
-1.530656, 0.2936703, -1.562176, 1, 0, 0, 1, 1,
-1.525871, -0.1919123, -2.12496, 1, 0, 0, 1, 1,
-1.525786, -1.689926, -2.198274, 1, 0, 0, 1, 1,
-1.52381, 0.6808102, -2.204143, 0, 0, 0, 1, 1,
-1.521649, -1.287247, -2.355234, 0, 0, 0, 1, 1,
-1.519801, -0.2278021, -2.389453, 0, 0, 0, 1, 1,
-1.516132, 1.067895, -0.3759376, 0, 0, 0, 1, 1,
-1.473466, -0.03623239, -3.079502, 0, 0, 0, 1, 1,
-1.466762, -0.4272092, -2.401445, 0, 0, 0, 1, 1,
-1.464646, 2.650167, -0.007752025, 0, 0, 0, 1, 1,
-1.442096, -0.96757, -1.769319, 1, 1, 1, 1, 1,
-1.440977, 0.3408228, -0.1950742, 1, 1, 1, 1, 1,
-1.421777, 0.1552023, -0.421977, 1, 1, 1, 1, 1,
-1.421006, -0.08273683, -0.7062829, 1, 1, 1, 1, 1,
-1.405967, -0.09141593, -0.9976465, 1, 1, 1, 1, 1,
-1.400457, 0.8021469, -1.376488, 1, 1, 1, 1, 1,
-1.393867, 0.7487133, -1.302919, 1, 1, 1, 1, 1,
-1.38958, -0.8930548, -3.679232, 1, 1, 1, 1, 1,
-1.3805, 1.363494, -0.02035029, 1, 1, 1, 1, 1,
-1.363008, -1.919731, -1.453077, 1, 1, 1, 1, 1,
-1.356425, -0.4104699, -2.557713, 1, 1, 1, 1, 1,
-1.354334, 1.988455, 0.7576923, 1, 1, 1, 1, 1,
-1.353941, -0.6588549, -4.436612, 1, 1, 1, 1, 1,
-1.352709, 0.3978841, -1.08615, 1, 1, 1, 1, 1,
-1.347597, 0.3049937, -0.9658577, 1, 1, 1, 1, 1,
-1.34338, -0.9065554, -0.9717575, 0, 0, 1, 1, 1,
-1.343136, -0.652558, -2.936245, 1, 0, 0, 1, 1,
-1.339944, 0.2411969, -2.231782, 1, 0, 0, 1, 1,
-1.331454, -1.205022, -2.264389, 1, 0, 0, 1, 1,
-1.329227, -0.3537078, -2.103153, 1, 0, 0, 1, 1,
-1.325192, -2.015568, -3.008228, 1, 0, 0, 1, 1,
-1.321459, -0.335244, -2.833374, 0, 0, 0, 1, 1,
-1.320295, 1.089733, -1.141304, 0, 0, 0, 1, 1,
-1.30922, 0.8202087, 0.5448027, 0, 0, 0, 1, 1,
-1.299093, -0.2357918, -1.658875, 0, 0, 0, 1, 1,
-1.296085, 1.42683, -0.5079269, 0, 0, 0, 1, 1,
-1.28234, -0.7514935, -2.144012, 0, 0, 0, 1, 1,
-1.277621, 0.1699914, -1.322258, 0, 0, 0, 1, 1,
-1.263869, -0.5937123, -3.636968, 1, 1, 1, 1, 1,
-1.261873, -1.58621, -3.969252, 1, 1, 1, 1, 1,
-1.25379, -0.08516882, -0.692444, 1, 1, 1, 1, 1,
-1.239828, 0.2066542, -2.202885, 1, 1, 1, 1, 1,
-1.230441, 1.044002, -1.574155, 1, 1, 1, 1, 1,
-1.229775, -1.028385, -2.535396, 1, 1, 1, 1, 1,
-1.222482, -0.2697512, -1.483714, 1, 1, 1, 1, 1,
-1.222184, -2.031061, -4.52582, 1, 1, 1, 1, 1,
-1.220346, -0.5445723, -0.8006726, 1, 1, 1, 1, 1,
-1.22011, -0.6889101, -1.436448, 1, 1, 1, 1, 1,
-1.21912, 0.3015283, -0.7887423, 1, 1, 1, 1, 1,
-1.218812, -0.8567796, -2.42938, 1, 1, 1, 1, 1,
-1.19849, -0.3482368, -4.15286, 1, 1, 1, 1, 1,
-1.196595, -2.05168, -1.510519, 1, 1, 1, 1, 1,
-1.194842, -1.109676, -1.619545, 1, 1, 1, 1, 1,
-1.192888, -1.349828, -2.843256, 0, 0, 1, 1, 1,
-1.191543, -2.827626, -1.070883, 1, 0, 0, 1, 1,
-1.18395, -1.784913, -0.8527159, 1, 0, 0, 1, 1,
-1.178685, 0.1204405, -2.158089, 1, 0, 0, 1, 1,
-1.176841, -1.143674, -3.511877, 1, 0, 0, 1, 1,
-1.176726, -0.451759, -1.421113, 1, 0, 0, 1, 1,
-1.168986, 1.976126, -0.4048426, 0, 0, 0, 1, 1,
-1.167696, -1.545017, -4.372326, 0, 0, 0, 1, 1,
-1.166337, 1.983614, 0.1155416, 0, 0, 0, 1, 1,
-1.161007, 1.067333, -1.109251, 0, 0, 0, 1, 1,
-1.157646, 1.499188, -3.20875, 0, 0, 0, 1, 1,
-1.156372, -0.4005983, -2.234899, 0, 0, 0, 1, 1,
-1.155864, -0.03537256, -0.4425146, 0, 0, 0, 1, 1,
-1.151632, -0.6212035, -2.173564, 1, 1, 1, 1, 1,
-1.138968, -0.8378572, -1.199406, 1, 1, 1, 1, 1,
-1.138115, 0.4237769, -0.6268907, 1, 1, 1, 1, 1,
-1.136819, 1.669367, -1.688528, 1, 1, 1, 1, 1,
-1.132875, -0.2921109, -2.165052, 1, 1, 1, 1, 1,
-1.13211, -0.1821396, -1.290219, 1, 1, 1, 1, 1,
-1.123289, 0.1210966, -2.616264, 1, 1, 1, 1, 1,
-1.119882, -0.1041109, -2.910866, 1, 1, 1, 1, 1,
-1.116603, -0.2572219, -1.874957, 1, 1, 1, 1, 1,
-1.114992, 0.6494669, 0.2812351, 1, 1, 1, 1, 1,
-1.112268, 0.09854323, -1.992614, 1, 1, 1, 1, 1,
-1.10789, -1.451925, -1.371163, 1, 1, 1, 1, 1,
-1.099866, 0.08966155, -2.79179, 1, 1, 1, 1, 1,
-1.099212, 2.244724, -0.09380328, 1, 1, 1, 1, 1,
-1.096805, 0.7124806, -0.5823023, 1, 1, 1, 1, 1,
-1.086347, -0.3260803, -3.314715, 0, 0, 1, 1, 1,
-1.063682, 1.33841, 0.7289988, 1, 0, 0, 1, 1,
-1.057496, -1.311497, 0.02424738, 1, 0, 0, 1, 1,
-1.049098, 0.486171, -0.5577238, 1, 0, 0, 1, 1,
-1.038976, -0.4500888, -2.715154, 1, 0, 0, 1, 1,
-1.035008, -1.578704, -2.554581, 1, 0, 0, 1, 1,
-1.029907, 2.180976, 0.1228908, 0, 0, 0, 1, 1,
-1.02749, 0.5682586, -0.08402935, 0, 0, 0, 1, 1,
-1.026981, -0.9988955, -4.510612, 0, 0, 0, 1, 1,
-1.023186, 1.31307, -0.5950525, 0, 0, 0, 1, 1,
-1.02189, -0.2718495, -0.6816512, 0, 0, 0, 1, 1,
-1.021434, 0.2619089, -2.819347, 0, 0, 0, 1, 1,
-1.018183, 1.588023, -1.029411, 0, 0, 0, 1, 1,
-1.011195, -0.4035027, -1.941027, 1, 1, 1, 1, 1,
-1.005175, -0.2453617, -3.712092, 1, 1, 1, 1, 1,
-1.004628, 0.2263021, -2.499168, 1, 1, 1, 1, 1,
-1.001328, 1.430417, -0.7235617, 1, 1, 1, 1, 1,
-0.9957014, -0.4768346, -2.173398, 1, 1, 1, 1, 1,
-0.9941356, 0.4441464, -1.230439, 1, 1, 1, 1, 1,
-0.9924377, 0.5746632, -0.9988285, 1, 1, 1, 1, 1,
-0.9854833, 0.20678, -1.769093, 1, 1, 1, 1, 1,
-0.9744905, 0.3905724, -1.288716, 1, 1, 1, 1, 1,
-0.966796, 0.1745625, -0.9786308, 1, 1, 1, 1, 1,
-0.9662977, -0.6995454, -1.642312, 1, 1, 1, 1, 1,
-0.9660249, 0.01526021, -2.276021, 1, 1, 1, 1, 1,
-0.9616644, 0.4038964, -0.44413, 1, 1, 1, 1, 1,
-0.9512293, -0.4590791, -1.996297, 1, 1, 1, 1, 1,
-0.9498163, -0.9460193, 0.6448553, 1, 1, 1, 1, 1,
-0.9485616, 1.350848, -0.6689929, 0, 0, 1, 1, 1,
-0.9376649, 0.005082247, -3.027841, 1, 0, 0, 1, 1,
-0.9303675, -1.380666, -3.833318, 1, 0, 0, 1, 1,
-0.9253597, -1.276726, 0.4514227, 1, 0, 0, 1, 1,
-0.9234931, 0.407927, -0.5600567, 1, 0, 0, 1, 1,
-0.9232479, 1.383306, 1.850633, 1, 0, 0, 1, 1,
-0.9220325, 1.241573, -0.5012735, 0, 0, 0, 1, 1,
-0.9196631, 1.071046, -0.9317473, 0, 0, 0, 1, 1,
-0.9186928, -0.3023703, -2.028731, 0, 0, 0, 1, 1,
-0.9145005, -2.119225, -1.96517, 0, 0, 0, 1, 1,
-0.9133189, -0.7750399, -3.288877, 0, 0, 0, 1, 1,
-0.9082662, 1.589307, -1.415811, 0, 0, 0, 1, 1,
-0.8783799, -0.4299882, -3.451629, 0, 0, 0, 1, 1,
-0.8748565, 0.4845442, -1.115708, 1, 1, 1, 1, 1,
-0.8742875, 0.09205318, 0.6791817, 1, 1, 1, 1, 1,
-0.8718899, 2.685024, -1.178515, 1, 1, 1, 1, 1,
-0.867068, 0.7707359, -0.688652, 1, 1, 1, 1, 1,
-0.8625231, -0.9498448, -2.597661, 1, 1, 1, 1, 1,
-0.8611279, 0.251237, -0.147512, 1, 1, 1, 1, 1,
-0.8541471, -0.8402703, -1.215863, 1, 1, 1, 1, 1,
-0.8466664, -1.393575, -2.939306, 1, 1, 1, 1, 1,
-0.8460369, -0.6491497, -2.105417, 1, 1, 1, 1, 1,
-0.8458881, 0.1530888, -4.248461, 1, 1, 1, 1, 1,
-0.8457849, 1.77621, -1.61336, 1, 1, 1, 1, 1,
-0.845031, 1.291664, 0.3624845, 1, 1, 1, 1, 1,
-0.8448451, 0.2362849, -1.364915, 1, 1, 1, 1, 1,
-0.8441077, 0.3618672, -2.436909, 1, 1, 1, 1, 1,
-0.8348179, -0.3019921, -2.649978, 1, 1, 1, 1, 1,
-0.8344296, -0.2617449, -1.597768, 0, 0, 1, 1, 1,
-0.8209512, -1.089973, -3.935531, 1, 0, 0, 1, 1,
-0.8167606, 0.1446189, -2.926214, 1, 0, 0, 1, 1,
-0.8067486, 1.114532, -3.42695, 1, 0, 0, 1, 1,
-0.7956435, -0.3491924, 0.1215383, 1, 0, 0, 1, 1,
-0.7934525, -1.408859, -3.190703, 1, 0, 0, 1, 1,
-0.7929267, -1.319213, -1.296905, 0, 0, 0, 1, 1,
-0.791943, 0.2101765, -2.419618, 0, 0, 0, 1, 1,
-0.7918667, -0.3470452, -2.206824, 0, 0, 0, 1, 1,
-0.7913378, -0.7583713, -3.029608, 0, 0, 0, 1, 1,
-0.7906699, 0.01377897, -2.917676, 0, 0, 0, 1, 1,
-0.7852656, -1.03107, -0.9103083, 0, 0, 0, 1, 1,
-0.7808933, 0.740162, -0.9201975, 0, 0, 0, 1, 1,
-0.7789162, -0.6545741, -0.4543099, 1, 1, 1, 1, 1,
-0.778906, 2.341882, 0.6158128, 1, 1, 1, 1, 1,
-0.7691205, 1.319369, 0.9586298, 1, 1, 1, 1, 1,
-0.7672136, -1.055232, -4.342241, 1, 1, 1, 1, 1,
-0.7666696, 0.4090886, -1.950981, 1, 1, 1, 1, 1,
-0.7655176, -0.9311736, -3.007597, 1, 1, 1, 1, 1,
-0.7638773, -0.9845711, -3.156332, 1, 1, 1, 1, 1,
-0.7637872, -0.8672464, -3.19561, 1, 1, 1, 1, 1,
-0.7616922, 0.7029716, -2.307847, 1, 1, 1, 1, 1,
-0.7610815, 0.9044688, 0.01231213, 1, 1, 1, 1, 1,
-0.7580567, -1.158976, -2.000573, 1, 1, 1, 1, 1,
-0.757706, -0.6964434, -1.436419, 1, 1, 1, 1, 1,
-0.7574995, -1.253414, -1.608453, 1, 1, 1, 1, 1,
-0.755429, 1.03525, -1.318633, 1, 1, 1, 1, 1,
-0.7537766, 0.8606497, -0.8348908, 1, 1, 1, 1, 1,
-0.7519715, -1.631469, -3.555194, 0, 0, 1, 1, 1,
-0.7486162, -1.829091, -4.141884, 1, 0, 0, 1, 1,
-0.7465094, -0.5917858, -2.496179, 1, 0, 0, 1, 1,
-0.7416624, 0.8338653, 0.6740246, 1, 0, 0, 1, 1,
-0.7316831, -0.9073409, -3.324674, 1, 0, 0, 1, 1,
-0.7308016, -0.6690062, -3.116885, 1, 0, 0, 1, 1,
-0.728711, 0.5850424, -1.603678, 0, 0, 0, 1, 1,
-0.7243494, -0.09302371, -3.205971, 0, 0, 0, 1, 1,
-0.7222136, -0.447178, 0.003171071, 0, 0, 0, 1, 1,
-0.7135708, -0.5957536, -1.551453, 0, 0, 0, 1, 1,
-0.7114708, 1.790378, -0.7513693, 0, 0, 0, 1, 1,
-0.7098707, 1.381561, -0.668523, 0, 0, 0, 1, 1,
-0.7093998, 1.605834, 0.4742462, 0, 0, 0, 1, 1,
-0.7085246, -0.1750545, -2.301001, 1, 1, 1, 1, 1,
-0.7042566, -0.5552719, -2.011294, 1, 1, 1, 1, 1,
-0.7034541, -0.1745578, -0.006575936, 1, 1, 1, 1, 1,
-0.6973405, 0.5289679, -1.254603, 1, 1, 1, 1, 1,
-0.6865001, 0.8445515, -0.7961845, 1, 1, 1, 1, 1,
-0.6801766, 0.395804, -2.059578, 1, 1, 1, 1, 1,
-0.679131, -1.068812, -0.8519245, 1, 1, 1, 1, 1,
-0.670692, -0.0866464, -0.5247673, 1, 1, 1, 1, 1,
-0.6627964, -1.25738, -0.4190885, 1, 1, 1, 1, 1,
-0.6609855, 1.030121, -1.640483, 1, 1, 1, 1, 1,
-0.6593177, -0.8490095, -3.140777, 1, 1, 1, 1, 1,
-0.6483629, 0.8414862, -2.205973, 1, 1, 1, 1, 1,
-0.6483435, -0.001991889, -1.692468, 1, 1, 1, 1, 1,
-0.6440053, 0.6752194, -0.9509031, 1, 1, 1, 1, 1,
-0.6429198, 0.5104504, -1.321402, 1, 1, 1, 1, 1,
-0.6402302, 0.7043259, 0.916875, 0, 0, 1, 1, 1,
-0.6393649, -0.1648397, -2.946476, 1, 0, 0, 1, 1,
-0.6380537, 0.6658089, -0.8380372, 1, 0, 0, 1, 1,
-0.6370701, -0.7587649, -3.690497, 1, 0, 0, 1, 1,
-0.6310838, -0.04686299, -1.677832, 1, 0, 0, 1, 1,
-0.6299745, -0.2293292, -3.102288, 1, 0, 0, 1, 1,
-0.6295096, 0.4431182, -0.6400717, 0, 0, 0, 1, 1,
-0.6279484, 0.624666, -0.3176646, 0, 0, 0, 1, 1,
-0.6266049, 1.061628, 0.4131346, 0, 0, 0, 1, 1,
-0.6264729, 0.381965, -0.7777641, 0, 0, 0, 1, 1,
-0.6192352, -0.7446582, -3.307893, 0, 0, 0, 1, 1,
-0.619134, 0.8248726, -1.604441, 0, 0, 0, 1, 1,
-0.6187794, -1.883169, -2.319256, 0, 0, 0, 1, 1,
-0.6184351, 0.801236, -0.2858644, 1, 1, 1, 1, 1,
-0.6094791, 0.06174484, -2.563268, 1, 1, 1, 1, 1,
-0.6065007, 1.674574, 1.667274, 1, 1, 1, 1, 1,
-0.60454, -0.6203566, -2.311353, 1, 1, 1, 1, 1,
-0.6043312, 1.394482, -1.418177, 1, 1, 1, 1, 1,
-0.6028389, 1.495571, 0.4646905, 1, 1, 1, 1, 1,
-0.5993209, -0.2949463, -3.597131, 1, 1, 1, 1, 1,
-0.5973476, 0.6867492, -0.063558, 1, 1, 1, 1, 1,
-0.5883134, 0.4310219, -1.518596, 1, 1, 1, 1, 1,
-0.587444, 0.09845495, -0.5010607, 1, 1, 1, 1, 1,
-0.5836684, 0.2881328, -1.750526, 1, 1, 1, 1, 1,
-0.5823138, -0.6282105, -1.66988, 1, 1, 1, 1, 1,
-0.5807927, -0.6594257, -1.179003, 1, 1, 1, 1, 1,
-0.5783657, -0.7866509, -1.393633, 1, 1, 1, 1, 1,
-0.5776479, 0.02338578, -1.71395, 1, 1, 1, 1, 1,
-0.5754128, -0.5752443, -2.165172, 0, 0, 1, 1, 1,
-0.5733183, 0.1140334, -1.828116, 1, 0, 0, 1, 1,
-0.5700895, 1.257245, -0.2779868, 1, 0, 0, 1, 1,
-0.5684006, 0.4188861, 0.6628531, 1, 0, 0, 1, 1,
-0.5682142, -0.0659743, -0.8979714, 1, 0, 0, 1, 1,
-0.56616, 1.210067, 0.2714398, 1, 0, 0, 1, 1,
-0.5648167, -0.317602, -2.365202, 0, 0, 0, 1, 1,
-0.5642591, -1.331177, -3.685637, 0, 0, 0, 1, 1,
-0.5605468, -1.256561, -4.699066, 0, 0, 0, 1, 1,
-0.5605052, 0.9864831, -0.3701051, 0, 0, 0, 1, 1,
-0.554913, 0.3251575, -0.5163027, 0, 0, 0, 1, 1,
-0.5537679, 0.07900497, -0.3632275, 0, 0, 0, 1, 1,
-0.5509765, -0.9188508, -1.733429, 0, 0, 0, 1, 1,
-0.550944, -0.4957323, -3.849633, 1, 1, 1, 1, 1,
-0.5465515, -0.5480681, -4.70294, 1, 1, 1, 1, 1,
-0.5440072, -0.2231759, -1.110705, 1, 1, 1, 1, 1,
-0.5422539, -0.5729146, -2.844841, 1, 1, 1, 1, 1,
-0.5270441, -0.4416314, -0.6785791, 1, 1, 1, 1, 1,
-0.5263897, -0.2540434, -1.708559, 1, 1, 1, 1, 1,
-0.5259746, -1.338279, -3.130864, 1, 1, 1, 1, 1,
-0.5211104, -0.8299834, -3.343135, 1, 1, 1, 1, 1,
-0.5204704, 0.1267578, 0.6689752, 1, 1, 1, 1, 1,
-0.5157879, 0.3429118, 0.4248596, 1, 1, 1, 1, 1,
-0.5091832, 1.079175, -1.963738, 1, 1, 1, 1, 1,
-0.5078312, -3.397001, -1.362881, 1, 1, 1, 1, 1,
-0.503982, -0.1208477, -0.1491258, 1, 1, 1, 1, 1,
-0.5037971, -0.759491, -2.090895, 1, 1, 1, 1, 1,
-0.5032306, -0.3035536, -2.562658, 1, 1, 1, 1, 1,
-0.4995492, -0.3668292, -2.839205, 0, 0, 1, 1, 1,
-0.4986698, 0.05909725, -1.901095, 1, 0, 0, 1, 1,
-0.4971425, 1.921164, 0.6386101, 1, 0, 0, 1, 1,
-0.4960696, 0.121627, -1.261827, 1, 0, 0, 1, 1,
-0.4937512, -1.281031, -2.620609, 1, 0, 0, 1, 1,
-0.4921219, -0.3986434, -3.166519, 1, 0, 0, 1, 1,
-0.4850442, 0.04803657, -0.8980898, 0, 0, 0, 1, 1,
-0.4808084, 0.9075993, 1.220391, 0, 0, 0, 1, 1,
-0.4790897, 0.2053141, -0.5950896, 0, 0, 0, 1, 1,
-0.4778239, -1.738166, -3.134384, 0, 0, 0, 1, 1,
-0.4749837, -0.328151, -1.937356, 0, 0, 0, 1, 1,
-0.4749275, 0.06125838, -1.905917, 0, 0, 0, 1, 1,
-0.4732589, 0.1464049, -1.070435, 0, 0, 0, 1, 1,
-0.4713635, -2.252214, -1.892482, 1, 1, 1, 1, 1,
-0.4711261, 0.5409674, -0.7848663, 1, 1, 1, 1, 1,
-0.4705491, 0.8331805, -0.5868356, 1, 1, 1, 1, 1,
-0.4620093, -0.945277, -1.64463, 1, 1, 1, 1, 1,
-0.4606552, 0.5708022, -1.717778, 1, 1, 1, 1, 1,
-0.4587655, -0.3578703, -2.172936, 1, 1, 1, 1, 1,
-0.4542911, -0.6343754, -3.380047, 1, 1, 1, 1, 1,
-0.4508871, 0.07256553, -1.895994, 1, 1, 1, 1, 1,
-0.4503079, 0.5992045, -0.2971917, 1, 1, 1, 1, 1,
-0.4459077, -0.1527359, -1.468102, 1, 1, 1, 1, 1,
-0.4362926, -0.04041426, -1.428462, 1, 1, 1, 1, 1,
-0.4336104, -0.3598993, -2.239638, 1, 1, 1, 1, 1,
-0.4309359, -1.552447, -5.030964, 1, 1, 1, 1, 1,
-0.4307773, 0.1604937, -1.680039, 1, 1, 1, 1, 1,
-0.4254875, -1.087521, -1.041581, 1, 1, 1, 1, 1,
-0.4214575, 0.04652223, -3.273015, 0, 0, 1, 1, 1,
-0.4205326, -2.516803, -3.685709, 1, 0, 0, 1, 1,
-0.4187203, -0.3305812, -4.784131, 1, 0, 0, 1, 1,
-0.4038949, 0.2733279, -1.069924, 1, 0, 0, 1, 1,
-0.4015591, -0.5943124, -3.199479, 1, 0, 0, 1, 1,
-0.3964381, 0.09616561, -3.27903, 1, 0, 0, 1, 1,
-0.3940511, -2.229659, -3.462011, 0, 0, 0, 1, 1,
-0.3894063, 0.7247178, -0.4880486, 0, 0, 0, 1, 1,
-0.3876001, -0.4465101, -1.781301, 0, 0, 0, 1, 1,
-0.3826819, -0.5034897, -2.67023, 0, 0, 0, 1, 1,
-0.3801871, 0.9061464, -0.3622186, 0, 0, 0, 1, 1,
-0.3786753, -0.1351061, -1.503128, 0, 0, 0, 1, 1,
-0.377303, -0.8265764, -1.416314, 0, 0, 0, 1, 1,
-0.3736286, 0.08814255, -1.059083, 1, 1, 1, 1, 1,
-0.3664856, -0.685747, -2.889039, 1, 1, 1, 1, 1,
-0.3641795, 0.4848959, -2.394952, 1, 1, 1, 1, 1,
-0.3630822, -1.747591, -4.741536, 1, 1, 1, 1, 1,
-0.3602965, -0.02359333, -1.029407, 1, 1, 1, 1, 1,
-0.3597929, -0.6887155, -3.191909, 1, 1, 1, 1, 1,
-0.3588936, 0.2425214, -1.454028, 1, 1, 1, 1, 1,
-0.3585797, -2.009248, -2.254688, 1, 1, 1, 1, 1,
-0.3579078, -0.9596751, -3.20975, 1, 1, 1, 1, 1,
-0.3549815, -0.2596866, -1.964108, 1, 1, 1, 1, 1,
-0.3530234, -0.5379114, -1.659717, 1, 1, 1, 1, 1,
-0.351116, -0.9612271, -4.09429, 1, 1, 1, 1, 1,
-0.3508394, -0.5152994, -2.754223, 1, 1, 1, 1, 1,
-0.3496515, 0.5389153, -0.007560492, 1, 1, 1, 1, 1,
-0.3427652, 1.039536, 0.326154, 1, 1, 1, 1, 1,
-0.3415144, -1.642899, -2.476102, 0, 0, 1, 1, 1,
-0.3386455, -1.457735, -4.80571, 1, 0, 0, 1, 1,
-0.3333306, 1.39006, 1.694175, 1, 0, 0, 1, 1,
-0.3231596, -1.916154, -2.523644, 1, 0, 0, 1, 1,
-0.3207823, -1.078835, -4.160484, 1, 0, 0, 1, 1,
-0.320616, 1.624438, -1.767486, 1, 0, 0, 1, 1,
-0.3191963, -0.8020073, -3.420879, 0, 0, 0, 1, 1,
-0.3167812, 1.285494, -0.8272929, 0, 0, 0, 1, 1,
-0.315744, 0.2541087, 0.3567532, 0, 0, 0, 1, 1,
-0.3155002, 1.907318, 0.3615431, 0, 0, 0, 1, 1,
-0.3106743, 0.8666326, -1.909592, 0, 0, 0, 1, 1,
-0.3087462, -1.373804, -2.524372, 0, 0, 0, 1, 1,
-0.3062837, -2.188554, -4.49014, 0, 0, 0, 1, 1,
-0.2910815, 0.3981612, -0.09372745, 1, 1, 1, 1, 1,
-0.2886509, 0.9919186, 0.1431424, 1, 1, 1, 1, 1,
-0.2875768, 1.782957, -0.5200016, 1, 1, 1, 1, 1,
-0.287184, 0.6481878, -0.6165463, 1, 1, 1, 1, 1,
-0.2852712, -2.228801, -2.804276, 1, 1, 1, 1, 1,
-0.2849554, -0.7090908, -3.493446, 1, 1, 1, 1, 1,
-0.2824199, 0.7715963, 1.033432, 1, 1, 1, 1, 1,
-0.2811708, 0.3525002, -1.984589, 1, 1, 1, 1, 1,
-0.2803513, -0.3432457, -2.320981, 1, 1, 1, 1, 1,
-0.2787841, -0.4267897, -0.8097315, 1, 1, 1, 1, 1,
-0.2773893, 0.3197417, -0.03639381, 1, 1, 1, 1, 1,
-0.274285, -0.1396033, -2.221935, 1, 1, 1, 1, 1,
-0.2721331, 0.4142826, -1.295035, 1, 1, 1, 1, 1,
-0.2715625, -0.5946266, -2.723169, 1, 1, 1, 1, 1,
-0.269356, -2.044636, -1.263314, 1, 1, 1, 1, 1,
-0.266959, 1.039443, 0.3343554, 0, 0, 1, 1, 1,
-0.2635975, 0.7838521, 0.4050392, 1, 0, 0, 1, 1,
-0.2552388, 1.238806, 1.410963, 1, 0, 0, 1, 1,
-0.2506261, -0.6117863, -0.7409599, 1, 0, 0, 1, 1,
-0.2436358, -0.8338463, -3.984284, 1, 0, 0, 1, 1,
-0.2423332, -1.158993, -1.090682, 1, 0, 0, 1, 1,
-0.2358594, -1.048244, -1.862985, 0, 0, 0, 1, 1,
-0.2355821, 0.2795721, -0.8409854, 0, 0, 0, 1, 1,
-0.2351299, -0.4601615, -1.678129, 0, 0, 0, 1, 1,
-0.233134, -0.4066115, -1.349647, 0, 0, 0, 1, 1,
-0.2312551, -0.3795229, -2.363711, 0, 0, 0, 1, 1,
-0.2291651, 1.363961, -0.6568909, 0, 0, 0, 1, 1,
-0.2291271, -0.4358962, -3.518158, 0, 0, 0, 1, 1,
-0.2285639, -0.09086734, -3.417969, 1, 1, 1, 1, 1,
-0.2263319, 1.878057, 1.744376, 1, 1, 1, 1, 1,
-0.2181501, 0.2255115, -2.074798, 1, 1, 1, 1, 1,
-0.2105622, -1.623413, -2.497026, 1, 1, 1, 1, 1,
-0.2104515, 0.7401918, -1.686498, 1, 1, 1, 1, 1,
-0.2043758, -0.5658256, -3.203727, 1, 1, 1, 1, 1,
-0.2014451, 0.7667135, -0.01710495, 1, 1, 1, 1, 1,
-0.2006516, -0.2211735, -1.576734, 1, 1, 1, 1, 1,
-0.200352, -1.068092, -1.554071, 1, 1, 1, 1, 1,
-0.1957587, 0.8514353, -1.411971, 1, 1, 1, 1, 1,
-0.193173, -0.3098988, -4.05103, 1, 1, 1, 1, 1,
-0.1927484, -0.3652922, -0.3161595, 1, 1, 1, 1, 1,
-0.1924943, -0.1757445, -2.20773, 1, 1, 1, 1, 1,
-0.191519, 0.006217568, -1.872763, 1, 1, 1, 1, 1,
-0.1909448, 1.173708, -0.8174994, 1, 1, 1, 1, 1,
-0.1885134, 0.4277281, 0.4734147, 0, 0, 1, 1, 1,
-0.1868002, 0.7358607, 0.6408557, 1, 0, 0, 1, 1,
-0.1835149, 2.02587, -2.283263, 1, 0, 0, 1, 1,
-0.1665867, -0.6375954, -3.105093, 1, 0, 0, 1, 1,
-0.1663857, 0.9199772, -0.3730221, 1, 0, 0, 1, 1,
-0.1646712, -0.9308359, -2.407243, 1, 0, 0, 1, 1,
-0.1628644, 1.739056, 0.3495819, 0, 0, 0, 1, 1,
-0.1592146, -0.7901455, -2.989393, 0, 0, 0, 1, 1,
-0.1576999, -0.2086964, -2.649371, 0, 0, 0, 1, 1,
-0.1575769, 0.8113448, -2.855751, 0, 0, 0, 1, 1,
-0.1555113, -1.59272, -3.355652, 0, 0, 0, 1, 1,
-0.1548023, 0.009994572, -1.357044, 0, 0, 0, 1, 1,
-0.1493393, 1.03785, -0.6719318, 0, 0, 0, 1, 1,
-0.1488224, 0.5397367, -0.487325, 1, 1, 1, 1, 1,
-0.1483798, -0.5444754, -2.948911, 1, 1, 1, 1, 1,
-0.1479707, 0.3963722, 0.382682, 1, 1, 1, 1, 1,
-0.145037, -0.5037169, -2.781088, 1, 1, 1, 1, 1,
-0.1363797, 0.714325, -0.1250209, 1, 1, 1, 1, 1,
-0.1360156, 1.720321, 0.6138465, 1, 1, 1, 1, 1,
-0.131102, -1.979717, -2.697011, 1, 1, 1, 1, 1,
-0.1291984, -1.435483, -2.044809, 1, 1, 1, 1, 1,
-0.1251708, 1.213576, -0.7754471, 1, 1, 1, 1, 1,
-0.1232868, -0.01861082, -3.563164, 1, 1, 1, 1, 1,
-0.1230661, 1.076812, 0.2054684, 1, 1, 1, 1, 1,
-0.1208647, -0.7737785, -4.23034, 1, 1, 1, 1, 1,
-0.1200976, 0.696076, -1.338702, 1, 1, 1, 1, 1,
-0.1198398, 1.815908, -0.6647776, 1, 1, 1, 1, 1,
-0.1167322, -0.1881303, -2.483741, 1, 1, 1, 1, 1,
-0.1160857, -1.862252, -3.411638, 0, 0, 1, 1, 1,
-0.112368, 0.2904018, 0.2800117, 1, 0, 0, 1, 1,
-0.1067401, -0.2697801, -1.195033, 1, 0, 0, 1, 1,
-0.1009943, -0.3057768, -4.25993, 1, 0, 0, 1, 1,
-0.09970263, -0.4186382, -1.084994, 1, 0, 0, 1, 1,
-0.09718429, 1.686277, -0.4953772, 1, 0, 0, 1, 1,
-0.09683573, -0.8448251, -3.675688, 0, 0, 0, 1, 1,
-0.09626278, -1.130862, -2.663058, 0, 0, 0, 1, 1,
-0.09467817, 1.208529, -0.131871, 0, 0, 0, 1, 1,
-0.09256451, -1.450308, -2.525856, 0, 0, 0, 1, 1,
-0.08781634, -1.274608, -4.629734, 0, 0, 0, 1, 1,
-0.08419709, 0.482135, -0.6489089, 0, 0, 0, 1, 1,
-0.08080023, -0.00963199, -0.3528762, 0, 0, 0, 1, 1,
-0.08031496, -0.9111386, -3.232239, 1, 1, 1, 1, 1,
-0.07530275, -0.7269059, -3.136158, 1, 1, 1, 1, 1,
-0.07473604, 0.3170651, -1.307501, 1, 1, 1, 1, 1,
-0.07289378, 0.1349311, -0.9530044, 1, 1, 1, 1, 1,
-0.07098329, -1.845726, -3.626827, 1, 1, 1, 1, 1,
-0.0701104, -0.5613973, -3.408107, 1, 1, 1, 1, 1,
-0.06480839, -0.7636357, -2.349525, 1, 1, 1, 1, 1,
-0.06202077, 0.601305, -1.402546, 1, 1, 1, 1, 1,
-0.0517223, -0.4753377, -2.52429, 1, 1, 1, 1, 1,
-0.04759479, 0.4646784, -0.4484425, 1, 1, 1, 1, 1,
-0.04409677, -0.8606111, -3.623412, 1, 1, 1, 1, 1,
-0.04198039, 0.1599539, -0.0004519949, 1, 1, 1, 1, 1,
-0.04188413, 0.9928389, 0.3070372, 1, 1, 1, 1, 1,
-0.04035666, 0.1364483, -0.3916121, 1, 1, 1, 1, 1,
-0.03903962, 0.1212306, -0.5214753, 1, 1, 1, 1, 1,
-0.03866816, -0.6511111, -3.119143, 0, 0, 1, 1, 1,
-0.03771517, 0.1690434, -0.007978908, 1, 0, 0, 1, 1,
-0.03657804, -0.7170419, -3.192287, 1, 0, 0, 1, 1,
-0.03386441, 1.62491, 1.56199, 1, 0, 0, 1, 1,
-0.03375228, -1.338818, -4.208062, 1, 0, 0, 1, 1,
-0.03304048, -1.057101, -3.119493, 1, 0, 0, 1, 1,
-0.03235907, -1.063684, -3.148968, 0, 0, 0, 1, 1,
-0.02692606, 0.788614, -0.5431404, 0, 0, 0, 1, 1,
-0.01349165, -0.1993588, -2.742091, 0, 0, 0, 1, 1,
-0.01036518, -0.4268244, -2.277622, 0, 0, 0, 1, 1,
-0.008132521, 0.193354, -1.038953, 0, 0, 0, 1, 1,
-0.005348788, 2.039641, 2.433068, 0, 0, 0, 1, 1,
-0.001419162, 1.219603, -0.009418071, 0, 0, 0, 1, 1,
-0.0004743876, 0.05587788, -1.503448, 1, 1, 1, 1, 1,
0.0006345672, 0.08075219, 0.2627956, 1, 1, 1, 1, 1,
0.001534934, 0.2428808, 0.1061424, 1, 1, 1, 1, 1,
0.005830522, -1.472013, 1.3637, 1, 1, 1, 1, 1,
0.006438682, 1.289741, 0.1114583, 1, 1, 1, 1, 1,
0.009482297, -0.4256918, 3.044012, 1, 1, 1, 1, 1,
0.01094664, 0.889954, 0.09273331, 1, 1, 1, 1, 1,
0.01392016, -0.03363599, 3.117835, 1, 1, 1, 1, 1,
0.01425692, -0.05444766, 1.647888, 1, 1, 1, 1, 1,
0.01484442, -0.647144, 3.219953, 1, 1, 1, 1, 1,
0.01547083, -1.337439, 2.034557, 1, 1, 1, 1, 1,
0.0179096, 0.5007649, 1.312454, 1, 1, 1, 1, 1,
0.02150586, 0.9256704, -0.6474777, 1, 1, 1, 1, 1,
0.02268767, 1.000658, -0.5004863, 1, 1, 1, 1, 1,
0.02323348, -0.3318914, 5.078917, 1, 1, 1, 1, 1,
0.03050951, -1.433352, 4.13114, 0, 0, 1, 1, 1,
0.03772707, 1.661278, 0.1639125, 1, 0, 0, 1, 1,
0.04356851, 1.538096, 0.4829589, 1, 0, 0, 1, 1,
0.04780907, 1.090507, 2.124774, 1, 0, 0, 1, 1,
0.04782671, 0.05531416, 0.4380776, 1, 0, 0, 1, 1,
0.04992643, 2.286963, 1.549325, 1, 0, 0, 1, 1,
0.05022602, -1.648627, 2.068518, 0, 0, 0, 1, 1,
0.05042804, 0.5021128, -0.5099626, 0, 0, 0, 1, 1,
0.05119135, -0.00928274, 1.7306, 0, 0, 0, 1, 1,
0.0521153, 0.2125174, -1.675038, 0, 0, 0, 1, 1,
0.05235884, 1.458985, 0.01803997, 0, 0, 0, 1, 1,
0.05421509, 0.9662135, -0.09206571, 0, 0, 0, 1, 1,
0.05994551, 0.4752467, 1.478243, 0, 0, 0, 1, 1,
0.06183872, 0.358803, -1.198081, 1, 1, 1, 1, 1,
0.07605092, 0.2143609, 0.6843956, 1, 1, 1, 1, 1,
0.08069488, 1.595551, -0.6569421, 1, 1, 1, 1, 1,
0.08899037, 1.787287, -1.33862, 1, 1, 1, 1, 1,
0.08955491, 0.6616298, 0.2964818, 1, 1, 1, 1, 1,
0.09218381, 0.02490838, 0.3343824, 1, 1, 1, 1, 1,
0.09222244, 1.227224, 0.9201712, 1, 1, 1, 1, 1,
0.09495643, -0.2368522, 1.980244, 1, 1, 1, 1, 1,
0.09520637, -0.4094748, 3.458918, 1, 1, 1, 1, 1,
0.09654478, -0.1686262, 0.7566612, 1, 1, 1, 1, 1,
0.09721264, 0.912157, -0.5268986, 1, 1, 1, 1, 1,
0.1015801, -0.4809505, 2.242518, 1, 1, 1, 1, 1,
0.1018819, -0.03871355, 2.702682, 1, 1, 1, 1, 1,
0.1061522, -0.5119218, 1.619312, 1, 1, 1, 1, 1,
0.1072195, -0.7868066, 2.118205, 1, 1, 1, 1, 1,
0.1078199, 0.07606596, 1.269577, 0, 0, 1, 1, 1,
0.109181, 0.580721, -1.123683, 1, 0, 0, 1, 1,
0.1092686, -1.595016, 3.126002, 1, 0, 0, 1, 1,
0.1102372, -0.7406368, 2.73943, 1, 0, 0, 1, 1,
0.112068, 0.392516, 0.1432684, 1, 0, 0, 1, 1,
0.1146792, 1.025551, 0.005090233, 1, 0, 0, 1, 1,
0.1153307, -1.532661, 2.869649, 0, 0, 0, 1, 1,
0.1268043, -0.7158648, 3.248762, 0, 0, 0, 1, 1,
0.1284403, -1.458302, 1.986419, 0, 0, 0, 1, 1,
0.1288473, 0.6764734, -0.1651657, 0, 0, 0, 1, 1,
0.1318267, -0.4836196, 0.6945751, 0, 0, 0, 1, 1,
0.133339, -3.134979, 2.34912, 0, 0, 0, 1, 1,
0.1341114, -2.002732, 3.783376, 0, 0, 0, 1, 1,
0.1358375, 1.059001, 2.007338, 1, 1, 1, 1, 1,
0.1364449, 0.9717904, 1.7805, 1, 1, 1, 1, 1,
0.1379679, -0.5476398, 4.506856, 1, 1, 1, 1, 1,
0.1453724, -0.2928319, 3.361402, 1, 1, 1, 1, 1,
0.1457472, 0.7574228, -0.08494809, 1, 1, 1, 1, 1,
0.1495474, 0.172352, 1.226919, 1, 1, 1, 1, 1,
0.1499127, 1.750673, -2.092671, 1, 1, 1, 1, 1,
0.1499823, -0.7762051, 4.034475, 1, 1, 1, 1, 1,
0.1519904, -1.593677, 4.163979, 1, 1, 1, 1, 1,
0.1535553, 0.3365916, -1.879436, 1, 1, 1, 1, 1,
0.1549751, -0.1217679, 1.692708, 1, 1, 1, 1, 1,
0.1577376, -0.7735565, 2.780303, 1, 1, 1, 1, 1,
0.1579417, 1.701081, -1.286987, 1, 1, 1, 1, 1,
0.1586154, 0.7235077, 0.9456662, 1, 1, 1, 1, 1,
0.1598823, -0.5746139, 0.636596, 1, 1, 1, 1, 1,
0.1636025, 0.9774766, -0.2581808, 0, 0, 1, 1, 1,
0.1643255, 0.9492619, -1.424966, 1, 0, 0, 1, 1,
0.1706018, -0.01775649, 0.4113062, 1, 0, 0, 1, 1,
0.1788641, 0.3662989, -0.4606464, 1, 0, 0, 1, 1,
0.1811703, 0.03726102, 0.9054944, 1, 0, 0, 1, 1,
0.1826977, 0.3478753, -0.2310178, 1, 0, 0, 1, 1,
0.1833655, 0.7334219, 1.569225, 0, 0, 0, 1, 1,
0.1881051, -0.9640698, 2.227416, 0, 0, 0, 1, 1,
0.1965816, 0.4438527, -0.8306471, 0, 0, 0, 1, 1,
0.2019772, 0.6314275, 1.528061, 0, 0, 0, 1, 1,
0.2036095, -0.6919582, 3.363451, 0, 0, 0, 1, 1,
0.2052447, 1.058641, -0.3414893, 0, 0, 0, 1, 1,
0.2053557, -0.6502666, 1.745976, 0, 0, 0, 1, 1,
0.2066066, 1.836667, 0.179577, 1, 1, 1, 1, 1,
0.2087797, -1.521693, 3.379906, 1, 1, 1, 1, 1,
0.2109084, -0.1836987, 2.097777, 1, 1, 1, 1, 1,
0.2119758, -1.601661, 2.199781, 1, 1, 1, 1, 1,
0.2121269, 1.030045, 1.070703, 1, 1, 1, 1, 1,
0.2178614, -2.068985, 3.149276, 1, 1, 1, 1, 1,
0.221284, 0.3511403, 1.411711, 1, 1, 1, 1, 1,
0.223289, 0.2615412, 1.809402, 1, 1, 1, 1, 1,
0.2240355, -0.3351467, 2.917513, 1, 1, 1, 1, 1,
0.2241987, 0.007814287, 0.7790765, 1, 1, 1, 1, 1,
0.2244077, -1.053348, 3.114933, 1, 1, 1, 1, 1,
0.2268782, 0.2742158, 1.539649, 1, 1, 1, 1, 1,
0.2285346, 0.3967737, -0.5300742, 1, 1, 1, 1, 1,
0.2296454, 0.6563169, -0.2665861, 1, 1, 1, 1, 1,
0.2329106, -3.351274, 3.701043, 1, 1, 1, 1, 1,
0.2390515, 0.1481944, 0.9513627, 0, 0, 1, 1, 1,
0.2439106, 0.7690707, -0.2139899, 1, 0, 0, 1, 1,
0.2469217, -0.3249093, 2.116571, 1, 0, 0, 1, 1,
0.2471176, -2.124303, 4.831357, 1, 0, 0, 1, 1,
0.2473265, -0.6245161, 0.8207068, 1, 0, 0, 1, 1,
0.2512647, -0.4042304, 1.779755, 1, 0, 0, 1, 1,
0.2519238, 0.2916481, 1.142216, 0, 0, 0, 1, 1,
0.2561521, 0.5326403, 0.1802507, 0, 0, 0, 1, 1,
0.2567291, 0.9073239, -1.54348, 0, 0, 0, 1, 1,
0.2580153, 1.685423, -1.46136, 0, 0, 0, 1, 1,
0.2606368, -0.5783235, 2.097623, 0, 0, 0, 1, 1,
0.2643192, 0.5207803, -0.2310643, 0, 0, 0, 1, 1,
0.2647299, 0.06922574, 1.577303, 0, 0, 0, 1, 1,
0.2673555, -0.3805386, 2.181877, 1, 1, 1, 1, 1,
0.271283, 0.9678078, 2.68835, 1, 1, 1, 1, 1,
0.272559, -0.8769838, 2.983801, 1, 1, 1, 1, 1,
0.2776259, -1.091588, 1.772529, 1, 1, 1, 1, 1,
0.2814746, 0.06124264, 2.011979, 1, 1, 1, 1, 1,
0.2830319, 0.0760333, 1.024376, 1, 1, 1, 1, 1,
0.2834113, -0.7091134, 2.646387, 1, 1, 1, 1, 1,
0.2839114, 0.04649046, 1.891548, 1, 1, 1, 1, 1,
0.2851597, 0.6544874, 2.037885, 1, 1, 1, 1, 1,
0.2870121, -0.4273137, 5.239612, 1, 1, 1, 1, 1,
0.2873456, -0.6457676, 3.976302, 1, 1, 1, 1, 1,
0.2893597, 0.1317794, 3.289438, 1, 1, 1, 1, 1,
0.2931427, 0.5539581, -0.07540751, 1, 1, 1, 1, 1,
0.2938732, -1.747357, 2.749154, 1, 1, 1, 1, 1,
0.2992066, 1.890073, 1.101944, 1, 1, 1, 1, 1,
0.3046392, -0.6354256, 3.463623, 0, 0, 1, 1, 1,
0.3054247, -0.116317, 1.85661, 1, 0, 0, 1, 1,
0.3085907, -0.03600511, 2.747011, 1, 0, 0, 1, 1,
0.3088886, -1.036421, 3.737507, 1, 0, 0, 1, 1,
0.3114565, -0.31183, 1.295271, 1, 0, 0, 1, 1,
0.3118211, -0.1773391, 0.3007329, 1, 0, 0, 1, 1,
0.3119022, 0.06767848, 0.4705406, 0, 0, 0, 1, 1,
0.3154513, -1.413882, 2.309777, 0, 0, 0, 1, 1,
0.3171937, 0.2291138, 1.318606, 0, 0, 0, 1, 1,
0.3180243, 3.002904, -0.7279264, 0, 0, 0, 1, 1,
0.3227915, 0.1449622, 1.0177, 0, 0, 0, 1, 1,
0.3241207, 1.11325, 0.8695432, 0, 0, 0, 1, 1,
0.331392, 1.181367, -1.963646, 0, 0, 0, 1, 1,
0.3328781, -0.5098125, 2.881883, 1, 1, 1, 1, 1,
0.3350422, -1.349515, 3.393665, 1, 1, 1, 1, 1,
0.3388113, 0.2573432, 0.659683, 1, 1, 1, 1, 1,
0.3389369, 0.5704531, 1.224138, 1, 1, 1, 1, 1,
0.3417879, 2.828046, 0.8031534, 1, 1, 1, 1, 1,
0.3421158, -1.752493, 3.16889, 1, 1, 1, 1, 1,
0.349615, -0.3409061, 3.485633, 1, 1, 1, 1, 1,
0.357434, 0.1130121, 0.8518067, 1, 1, 1, 1, 1,
0.359043, 0.8736972, 1.492565, 1, 1, 1, 1, 1,
0.3610471, -0.7257081, 2.584647, 1, 1, 1, 1, 1,
0.3643002, 1.486288, -0.4815217, 1, 1, 1, 1, 1,
0.3657042, -0.9595323, 0.8092541, 1, 1, 1, 1, 1,
0.3694856, 1.081436, -0.7643356, 1, 1, 1, 1, 1,
0.376839, -0.1459136, 1.842155, 1, 1, 1, 1, 1,
0.3772641, 1.043101, -1.434179, 1, 1, 1, 1, 1,
0.3805288, 1.655649, 2.210397, 0, 0, 1, 1, 1,
0.3811461, 0.8776139, 2.944319, 1, 0, 0, 1, 1,
0.3876305, 1.288085, 0.4710867, 1, 0, 0, 1, 1,
0.3897226, 0.7513869, -0.664686, 1, 0, 0, 1, 1,
0.3996705, -1.068367, 2.351334, 1, 0, 0, 1, 1,
0.4060671, 0.4697954, 0.6712542, 1, 0, 0, 1, 1,
0.4107435, 0.454199, -0.7045054, 0, 0, 0, 1, 1,
0.4108179, 0.2480671, 2.428284, 0, 0, 0, 1, 1,
0.4116258, 1.009678, -0.4402814, 0, 0, 0, 1, 1,
0.4120585, 1.068554, -0.8445759, 0, 0, 0, 1, 1,
0.4132859, -0.8700131, 3.297636, 0, 0, 0, 1, 1,
0.4201061, -0.002398209, 2.254471, 0, 0, 0, 1, 1,
0.4231164, 0.08956368, 0.5671604, 0, 0, 0, 1, 1,
0.4238527, -0.4363847, 2.525098, 1, 1, 1, 1, 1,
0.4243226, -0.4853755, 2.225225, 1, 1, 1, 1, 1,
0.4297436, 0.6558943, 1.013076, 1, 1, 1, 1, 1,
0.4306356, -0.4011927, 2.799149, 1, 1, 1, 1, 1,
0.4402753, 0.6409323, 0.2631925, 1, 1, 1, 1, 1,
0.4413552, -1.282539, 1.365452, 1, 1, 1, 1, 1,
0.4429062, -0.3712379, 2.572302, 1, 1, 1, 1, 1,
0.4452429, 0.427949, -0.6302233, 1, 1, 1, 1, 1,
0.4520362, 0.7559489, 1.250977, 1, 1, 1, 1, 1,
0.4563792, 2.102778, 1.797841, 1, 1, 1, 1, 1,
0.4578868, 1.128734, 0.2936813, 1, 1, 1, 1, 1,
0.4613871, -1.223855, 3.616518, 1, 1, 1, 1, 1,
0.4632306, -1.642743, 3.283742, 1, 1, 1, 1, 1,
0.4641315, -0.9484692, 2.400293, 1, 1, 1, 1, 1,
0.4683942, -1.025039, 2.321792, 1, 1, 1, 1, 1,
0.4684106, 0.07682265, 2.646399, 0, 0, 1, 1, 1,
0.4695962, 1.355682, -0.8101504, 1, 0, 0, 1, 1,
0.474366, 1.177742, -0.06674769, 1, 0, 0, 1, 1,
0.4772399, 1.119704, 0.358126, 1, 0, 0, 1, 1,
0.4774804, 0.662346, 0.7017744, 1, 0, 0, 1, 1,
0.47836, -1.044241, 3.457542, 1, 0, 0, 1, 1,
0.4806891, -0.8117124, 0.5950882, 0, 0, 0, 1, 1,
0.4877079, 1.446405, 1.548088, 0, 0, 0, 1, 1,
0.4918985, 0.7113556, -0.8752308, 0, 0, 0, 1, 1,
0.4950946, 1.179664, -1.634284, 0, 0, 0, 1, 1,
0.4987205, 0.3817585, 1.134166, 0, 0, 0, 1, 1,
0.5025577, 0.182557, 1.206736, 0, 0, 0, 1, 1,
0.5039023, -1.356649, 0.6924937, 0, 0, 0, 1, 1,
0.5048494, 0.1462537, 2.19983, 1, 1, 1, 1, 1,
0.505172, 0.5774246, 0.1393425, 1, 1, 1, 1, 1,
0.5061627, 0.9411443, 0.2092633, 1, 1, 1, 1, 1,
0.5105862, 1.588439, 1.851381, 1, 1, 1, 1, 1,
0.5187057, -1.157585, 5.60133, 1, 1, 1, 1, 1,
0.5191322, 0.1175031, 0.5107085, 1, 1, 1, 1, 1,
0.5201752, 0.8602846, 1.04659, 1, 1, 1, 1, 1,
0.5206707, 0.8391551, 0.3212422, 1, 1, 1, 1, 1,
0.5211469, 0.4192472, 1.162014, 1, 1, 1, 1, 1,
0.5318751, 0.5250212, 0.2032727, 1, 1, 1, 1, 1,
0.534634, 0.5350913, 0.1876572, 1, 1, 1, 1, 1,
0.5397568, 1.40737, -0.7084941, 1, 1, 1, 1, 1,
0.5421675, -0.8639017, 2.824018, 1, 1, 1, 1, 1,
0.5428519, 0.4174529, 1.725093, 1, 1, 1, 1, 1,
0.5444778, 0.4038866, 0.5934399, 1, 1, 1, 1, 1,
0.5465745, -1.434393, 1.446702, 0, 0, 1, 1, 1,
0.5474999, 1.765213, 1.145097, 1, 0, 0, 1, 1,
0.5479555, -0.1812807, 2.456302, 1, 0, 0, 1, 1,
0.5533021, 1.394807, 0.7312543, 1, 0, 0, 1, 1,
0.5548874, -1.01723, 3.673641, 1, 0, 0, 1, 1,
0.5638328, -0.4121273, 2.470587, 1, 0, 0, 1, 1,
0.5649483, 1.952019, 0.1093012, 0, 0, 0, 1, 1,
0.5681191, -0.4502544, 2.13481, 0, 0, 0, 1, 1,
0.5702602, -0.421907, 2.701594, 0, 0, 0, 1, 1,
0.5709113, -0.183917, 1.842876, 0, 0, 0, 1, 1,
0.5713111, 1.405795, -0.8002269, 0, 0, 0, 1, 1,
0.5715399, -1.047772, 2.385736, 0, 0, 0, 1, 1,
0.5773283, -0.04158561, 2.85647, 0, 0, 0, 1, 1,
0.5797455, -1.482522, 1.292575, 1, 1, 1, 1, 1,
0.5806316, -0.001555628, 0.3015434, 1, 1, 1, 1, 1,
0.5815845, -2.244233, 1.919852, 1, 1, 1, 1, 1,
0.5891451, 1.212075, -0.009863234, 1, 1, 1, 1, 1,
0.5912855, -0.0191863, 2.651376, 1, 1, 1, 1, 1,
0.5928114, -0.2190846, 1.802601, 1, 1, 1, 1, 1,
0.5939398, 2.059326, 0.5723274, 1, 1, 1, 1, 1,
0.6001568, -0.5875674, 2.324553, 1, 1, 1, 1, 1,
0.602771, 0.6436883, -0.2139233, 1, 1, 1, 1, 1,
0.6092721, 0.4888016, 1.899155, 1, 1, 1, 1, 1,
0.6096912, 0.7897012, 0.9010743, 1, 1, 1, 1, 1,
0.6192741, 0.5014399, 1.653572, 1, 1, 1, 1, 1,
0.6215527, -1.535442, 3.487239, 1, 1, 1, 1, 1,
0.6218276, 0.3758363, 0.9227078, 1, 1, 1, 1, 1,
0.6293609, 0.2589878, 1.12723, 1, 1, 1, 1, 1,
0.6320638, 0.5440944, 0.6123343, 0, 0, 1, 1, 1,
0.6340247, -0.9369501, 2.263931, 1, 0, 0, 1, 1,
0.6344416, 1.182518, 0.6295527, 1, 0, 0, 1, 1,
0.6398364, -0.7695528, 4.397528, 1, 0, 0, 1, 1,
0.6418249, 0.1697787, 0.5729749, 1, 0, 0, 1, 1,
0.6442993, 1.449787, 0.3819779, 1, 0, 0, 1, 1,
0.6456864, -1.736609, 3.349547, 0, 0, 0, 1, 1,
0.6458777, -0.5522341, 2.611601, 0, 0, 0, 1, 1,
0.647764, -0.5970806, 1.191446, 0, 0, 0, 1, 1,
0.650839, -0.7405953, 2.775381, 0, 0, 0, 1, 1,
0.6574717, 0.112215, 0.9339897, 0, 0, 0, 1, 1,
0.6625794, -1.417478, 3.871236, 0, 0, 0, 1, 1,
0.6633104, -0.4123999, 2.483648, 0, 0, 0, 1, 1,
0.673947, -0.3222091, 3.505465, 1, 1, 1, 1, 1,
0.6788607, -0.2396372, 0.5895923, 1, 1, 1, 1, 1,
0.6823809, -0.9473817, 1.199995, 1, 1, 1, 1, 1,
0.6864225, -0.4874291, 2.934705, 1, 1, 1, 1, 1,
0.6882781, 1.177697, 0.7500572, 1, 1, 1, 1, 1,
0.6882818, 0.8639335, -0.1519958, 1, 1, 1, 1, 1,
0.6922427, 0.7765238, 0.6704007, 1, 1, 1, 1, 1,
0.6936921, 0.5977784, -0.8065672, 1, 1, 1, 1, 1,
0.6995471, -1.043946, 2.312897, 1, 1, 1, 1, 1,
0.7044652, 0.6020676, 0.2527248, 1, 1, 1, 1, 1,
0.7057725, -1.904298, 3.200754, 1, 1, 1, 1, 1,
0.7069715, -0.2085796, 2.692022, 1, 1, 1, 1, 1,
0.7078938, -0.006959756, 2.709722, 1, 1, 1, 1, 1,
0.7095567, 0.7822134, -0.7245061, 1, 1, 1, 1, 1,
0.7122329, 0.7217073, 0.4111149, 1, 1, 1, 1, 1,
0.7145491, -1.606461, 4.186915, 0, 0, 1, 1, 1,
0.7208068, 0.2160715, 0.7889131, 1, 0, 0, 1, 1,
0.72109, 0.6045145, 1.88513, 1, 0, 0, 1, 1,
0.7246779, -0.9116969, 1.926029, 1, 0, 0, 1, 1,
0.7275718, -2.077998, 2.704438, 1, 0, 0, 1, 1,
0.7300524, 2.811496, 2.318645, 1, 0, 0, 1, 1,
0.7348226, 1.469757, 0.1587928, 0, 0, 0, 1, 1,
0.7356907, 0.3234564, 1.431089, 0, 0, 0, 1, 1,
0.7365337, -0.8518735, 2.227119, 0, 0, 0, 1, 1,
0.7380065, -0.9649384, 3.096904, 0, 0, 0, 1, 1,
0.7393681, 1.735893, 0.429232, 0, 0, 0, 1, 1,
0.741762, 1.129203, 1.116451, 0, 0, 0, 1, 1,
0.7425289, -0.7107185, 2.991017, 0, 0, 0, 1, 1,
0.7434906, 0.4071952, 0.09365457, 1, 1, 1, 1, 1,
0.7445573, -0.1100929, 0.7844596, 1, 1, 1, 1, 1,
0.7553537, -0.6417386, 0.4672873, 1, 1, 1, 1, 1,
0.7592876, 0.1422482, 2.286889, 1, 1, 1, 1, 1,
0.7633576, -0.8181106, 1.378251, 1, 1, 1, 1, 1,
0.7650193, 0.2049828, 0.6701187, 1, 1, 1, 1, 1,
0.7665164, -0.4743001, 1.462656, 1, 1, 1, 1, 1,
0.7706532, 0.231342, 1.101667, 1, 1, 1, 1, 1,
0.775636, -0.7269564, 3.189576, 1, 1, 1, 1, 1,
0.7793449, 2.081918, 0.286393, 1, 1, 1, 1, 1,
0.7884554, -0.7282057, 2.932366, 1, 1, 1, 1, 1,
0.7893627, -2.102193, 3.496763, 1, 1, 1, 1, 1,
0.7898739, 0.1613397, 1.904641, 1, 1, 1, 1, 1,
0.7925929, 1.420159, 0.4677161, 1, 1, 1, 1, 1,
0.7953777, -0.3015106, 0.8204502, 1, 1, 1, 1, 1,
0.7979674, 0.195205, -0.2635166, 0, 0, 1, 1, 1,
0.802599, 0.684429, 2.388641, 1, 0, 0, 1, 1,
0.8035823, -0.1101096, 3.109486, 1, 0, 0, 1, 1,
0.8060156, 1.196098, 1.447172, 1, 0, 0, 1, 1,
0.8173947, 0.3810009, -0.8625135, 1, 0, 0, 1, 1,
0.8175554, -1.001305, 0.6094197, 1, 0, 0, 1, 1,
0.8186458, -2.33297, 2.857593, 0, 0, 0, 1, 1,
0.8187451, -1.181302, 1.806667, 0, 0, 0, 1, 1,
0.8247948, 0.3477701, -0.1473048, 0, 0, 0, 1, 1,
0.8255044, 1.766139, 2.002666, 0, 0, 0, 1, 1,
0.8280708, -0.7384481, 3.541857, 0, 0, 0, 1, 1,
0.8304217, 1.729706, -0.1900718, 0, 0, 0, 1, 1,
0.8404912, 0.4211398, 0.7919153, 0, 0, 0, 1, 1,
0.8478944, 0.01787249, 0.921677, 1, 1, 1, 1, 1,
0.84967, 1.102721, 1.412119, 1, 1, 1, 1, 1,
0.8548225, 1.130879, 0.1350539, 1, 1, 1, 1, 1,
0.8557664, -0.4485119, 4.795721, 1, 1, 1, 1, 1,
0.8604524, -0.5384411, 0.2294636, 1, 1, 1, 1, 1,
0.8730778, 0.3198255, 1.100782, 1, 1, 1, 1, 1,
0.8744863, -0.214917, 2.359325, 1, 1, 1, 1, 1,
0.8764386, 0.0007781101, 1.463631, 1, 1, 1, 1, 1,
0.8803546, -0.7905729, 2.287098, 1, 1, 1, 1, 1,
0.8965371, -1.264114, 2.856128, 1, 1, 1, 1, 1,
0.8969954, -1.075548, 3.107205, 1, 1, 1, 1, 1,
0.9010606, 0.3659925, 1.790352, 1, 1, 1, 1, 1,
0.9015404, -0.2485205, 2.172733, 1, 1, 1, 1, 1,
0.9027411, 0.8378957, 1.111821, 1, 1, 1, 1, 1,
0.9043125, 1.357234, 0.5560812, 1, 1, 1, 1, 1,
0.914498, -0.5486892, 2.389032, 0, 0, 1, 1, 1,
0.9201878, 0.1500738, 2.279052, 1, 0, 0, 1, 1,
0.9292349, 0.2396039, 0.9371351, 1, 0, 0, 1, 1,
0.9313254, -0.8602714, 1.698922, 1, 0, 0, 1, 1,
0.9326898, -0.9440367, 1.906218, 1, 0, 0, 1, 1,
0.9389015, -0.7342462, 3.991141, 1, 0, 0, 1, 1,
0.9407387, 0.3836669, 2.124333, 0, 0, 0, 1, 1,
0.9417788, -0.6538717, 0.8423184, 0, 0, 0, 1, 1,
0.944726, -0.178871, 1.777274, 0, 0, 0, 1, 1,
0.9447357, 0.4088439, 3.043946, 0, 0, 0, 1, 1,
0.9449654, -0.8525382, 2.039361, 0, 0, 0, 1, 1,
0.9474152, 1.233393, 1.648189, 0, 0, 0, 1, 1,
0.9474394, 1.007124, 0.6817689, 0, 0, 0, 1, 1,
0.9532431, 0.7844026, 1.852952, 1, 1, 1, 1, 1,
0.9545923, 0.3041796, 2.745332, 1, 1, 1, 1, 1,
0.9637915, 0.1605343, 1.549851, 1, 1, 1, 1, 1,
0.9832237, -0.6555011, 2.350397, 1, 1, 1, 1, 1,
0.9866477, -1.069735, 3.028352, 1, 1, 1, 1, 1,
0.9894357, -0.687467, 1.930581, 1, 1, 1, 1, 1,
0.9896161, -0.5865052, 1.794706, 1, 1, 1, 1, 1,
0.9919784, 0.8851988, 0.3384558, 1, 1, 1, 1, 1,
0.9920949, 2.594588, -0.8165536, 1, 1, 1, 1, 1,
0.993032, -0.5486353, 1.710202, 1, 1, 1, 1, 1,
0.9954596, 0.116033, 1.611851, 1, 1, 1, 1, 1,
0.9979202, 0.3063645, 0.4112448, 1, 1, 1, 1, 1,
0.9997086, -0.2728402, 2.321564, 1, 1, 1, 1, 1,
1.002752, -0.06381709, 2.229361, 1, 1, 1, 1, 1,
1.006127, -0.5392796, 3.929123, 1, 1, 1, 1, 1,
1.008551, -1.443515, 3.346724, 0, 0, 1, 1, 1,
1.010273, -1.763051, 3.427815, 1, 0, 0, 1, 1,
1.011933, 0.8115284, 0.5954041, 1, 0, 0, 1, 1,
1.013656, -0.1518174, 1.326797, 1, 0, 0, 1, 1,
1.017253, -0.2160641, 1.687749, 1, 0, 0, 1, 1,
1.020658, -0.8177844, 2.22066, 1, 0, 0, 1, 1,
1.04413, 1.673328, 1.186848, 0, 0, 0, 1, 1,
1.045418, 0.06794453, 3.026163, 0, 0, 0, 1, 1,
1.046745, 1.774363, -1.092376, 0, 0, 0, 1, 1,
1.049551, -0.3707041, 2.65394, 0, 0, 0, 1, 1,
1.057377, -0.1494052, 1.266833, 0, 0, 0, 1, 1,
1.058714, -0.7492961, 1.904857, 0, 0, 0, 1, 1,
1.060315, 1.690568, 0.8634673, 0, 0, 0, 1, 1,
1.065636, -0.3511793, 1.763834, 1, 1, 1, 1, 1,
1.068557, 0.126232, 0.6113959, 1, 1, 1, 1, 1,
1.072558, -0.4685271, 2.558053, 1, 1, 1, 1, 1,
1.072981, 0.9286909, 1.74867, 1, 1, 1, 1, 1,
1.076877, 0.890308, 1.261057, 1, 1, 1, 1, 1,
1.079617, 0.7817555, -0.4662838, 1, 1, 1, 1, 1,
1.079893, -1.312271, 4.449821, 1, 1, 1, 1, 1,
1.082125, -1.86907, 2.731633, 1, 1, 1, 1, 1,
1.08757, 0.01355472, 2.624495, 1, 1, 1, 1, 1,
1.088002, -1.343046, 1.29082, 1, 1, 1, 1, 1,
1.092295, 0.3562318, 2.440118, 1, 1, 1, 1, 1,
1.093926, 1.302029, 1.23956, 1, 1, 1, 1, 1,
1.103609, 1.45904, 1.51323, 1, 1, 1, 1, 1,
1.112324, 1.12572, -0.4602337, 1, 1, 1, 1, 1,
1.115407, -0.8927392, 1.222713, 1, 1, 1, 1, 1,
1.11949, -1.849577, 3.001769, 0, 0, 1, 1, 1,
1.12004, -0.7789484, 3.874613, 1, 0, 0, 1, 1,
1.122697, -1.067259, 1.65623, 1, 0, 0, 1, 1,
1.124292, -0.0170809, 1.075983, 1, 0, 0, 1, 1,
1.127608, 0.0171094, 2.871006, 1, 0, 0, 1, 1,
1.130706, 0.3640192, 2.789898, 1, 0, 0, 1, 1,
1.145706, -0.1336156, 1.92181, 0, 0, 0, 1, 1,
1.1507, -0.2674142, 2.027957, 0, 0, 0, 1, 1,
1.150939, 0.1274032, 0.1510677, 0, 0, 0, 1, 1,
1.156021, -2.590692, 2.89711, 0, 0, 0, 1, 1,
1.158056, -1.314249, 0.3769665, 0, 0, 0, 1, 1,
1.160688, -0.5948344, 1.8039, 0, 0, 0, 1, 1,
1.163552, -1.214192, 0.7928047, 0, 0, 0, 1, 1,
1.166955, 1.455215, -0.4469086, 1, 1, 1, 1, 1,
1.170327, 0.3215679, 2.319761, 1, 1, 1, 1, 1,
1.171615, 1.557164, 0.7133269, 1, 1, 1, 1, 1,
1.184423, -2.133138, 1.942773, 1, 1, 1, 1, 1,
1.187215, -0.1704795, 2.864944, 1, 1, 1, 1, 1,
1.187934, -0.4974936, 2.088443, 1, 1, 1, 1, 1,
1.191159, 0.8337566, 0.8218699, 1, 1, 1, 1, 1,
1.193018, 0.902476, 1.403166, 1, 1, 1, 1, 1,
1.193389, -0.8533825, 1.488326, 1, 1, 1, 1, 1,
1.194746, -0.9346069, 3.045107, 1, 1, 1, 1, 1,
1.198182, 0.6473361, 3.049029, 1, 1, 1, 1, 1,
1.201046, 0.2049819, 3.324096, 1, 1, 1, 1, 1,
1.222145, -0.3173707, -0.4498943, 1, 1, 1, 1, 1,
1.234053, 0.5061635, 1.52144, 1, 1, 1, 1, 1,
1.234342, -1.946811, 0.9592196, 1, 1, 1, 1, 1,
1.23947, -0.8953591, 1.965775, 0, 0, 1, 1, 1,
1.241075, -1.635655, 1.097947, 1, 0, 0, 1, 1,
1.246458, 0.4094003, 0.6406664, 1, 0, 0, 1, 1,
1.249989, 0.2486517, 1.834079, 1, 0, 0, 1, 1,
1.258907, -1.000852, 3.165559, 1, 0, 0, 1, 1,
1.259897, -0.8275186, 2.589288, 1, 0, 0, 1, 1,
1.260681, -0.7283536, 2.490948, 0, 0, 0, 1, 1,
1.262241, -1.421397, 3.3337, 0, 0, 0, 1, 1,
1.262495, 0.09262858, 2.458064, 0, 0, 0, 1, 1,
1.265432, 2.333606, -1.663712, 0, 0, 0, 1, 1,
1.284835, -0.2559801, 1.998126, 0, 0, 0, 1, 1,
1.29271, 1.098551, 1.209973, 0, 0, 0, 1, 1,
1.293311, -1.626363, 1.332352, 0, 0, 0, 1, 1,
1.294076, -1.324747, 3.255781, 1, 1, 1, 1, 1,
1.297804, 0.05662411, 2.739706, 1, 1, 1, 1, 1,
1.299779, -2.205137, 4.256464, 1, 1, 1, 1, 1,
1.31586, 0.2487843, 1.875543, 1, 1, 1, 1, 1,
1.324614, -0.732974, 2.431285, 1, 1, 1, 1, 1,
1.326298, 1.602843, 0.02993214, 1, 1, 1, 1, 1,
1.327222, 0.04592083, 1.07848, 1, 1, 1, 1, 1,
1.333325, 1.006209, 0.162661, 1, 1, 1, 1, 1,
1.342895, 1.817551, -1.117164, 1, 1, 1, 1, 1,
1.351634, -0.2889527, 1.177788, 1, 1, 1, 1, 1,
1.361944, 1.534886, -1.115023, 1, 1, 1, 1, 1,
1.368142, -0.9961312, 2.442377, 1, 1, 1, 1, 1,
1.37746, 0.4992001, 0.9099968, 1, 1, 1, 1, 1,
1.37825, -0.227653, 3.367028, 1, 1, 1, 1, 1,
1.380697, -0.5741092, 3.401271, 1, 1, 1, 1, 1,
1.400203, 1.561634, 0.5958135, 0, 0, 1, 1, 1,
1.409179, 1.450312, 1.211047, 1, 0, 0, 1, 1,
1.412736, 2.289513, 1.551895, 1, 0, 0, 1, 1,
1.417871, 0.3764188, 3.121808, 1, 0, 0, 1, 1,
1.439989, 0.07934529, 1.934222, 1, 0, 0, 1, 1,
1.44771, 1.056057, 2.916984, 1, 0, 0, 1, 1,
1.452406, -2.797092, 1.22008, 0, 0, 0, 1, 1,
1.452953, 2.192184, 1.578672, 0, 0, 0, 1, 1,
1.47087, -1.715057, 3.101956, 0, 0, 0, 1, 1,
1.472866, -0.4644576, 1.423329, 0, 0, 0, 1, 1,
1.475237, 1.524353, 0.427837, 0, 0, 0, 1, 1,
1.487787, 0.7374373, 2.692695, 0, 0, 0, 1, 1,
1.496744, 0.5647446, 0.9215891, 0, 0, 0, 1, 1,
1.505418, -2.134145, 1.795704, 1, 1, 1, 1, 1,
1.507089, 0.7802793, 0.602733, 1, 1, 1, 1, 1,
1.512029, -0.4950962, 3.64963, 1, 1, 1, 1, 1,
1.513584, -0.5116757, 0.5880271, 1, 1, 1, 1, 1,
1.519953, 0.5551139, 2.067472, 1, 1, 1, 1, 1,
1.523705, 1.533993, 1.729068, 1, 1, 1, 1, 1,
1.526328, 1.498391, 0.8071448, 1, 1, 1, 1, 1,
1.535006, -0.1828802, 1.61153, 1, 1, 1, 1, 1,
1.549589, -1.270394, 2.75989, 1, 1, 1, 1, 1,
1.55027, 0.698035, 1.215982, 1, 1, 1, 1, 1,
1.561193, -0.245069, 2.546647, 1, 1, 1, 1, 1,
1.561357, 0.4951647, 1.448082, 1, 1, 1, 1, 1,
1.592785, -0.5562833, 1.095814, 1, 1, 1, 1, 1,
1.593121, 2.114759, 1.631936, 1, 1, 1, 1, 1,
1.594, -0.002765088, 0.7444106, 1, 1, 1, 1, 1,
1.610384, -0.4940825, 1.398971, 0, 0, 1, 1, 1,
1.613118, -0.2122184, 1.989134, 1, 0, 0, 1, 1,
1.633529, 1.355626, 0.9323726, 1, 0, 0, 1, 1,
1.640949, -0.3993791, 1.34629, 1, 0, 0, 1, 1,
1.655453, 0.2956646, 1.624035, 1, 0, 0, 1, 1,
1.662624, -0.6747735, 2.307961, 1, 0, 0, 1, 1,
1.67254, -2.203004, 4.071437, 0, 0, 0, 1, 1,
1.710176, 1.121235, 1.170427, 0, 0, 0, 1, 1,
1.729353, 1.963445, 2.774671, 0, 0, 0, 1, 1,
1.731373, 0.2128185, 3.681263, 0, 0, 0, 1, 1,
1.735568, 0.4247154, 2.749288, 0, 0, 0, 1, 1,
1.737924, -2.675879, 1.991609, 0, 0, 0, 1, 1,
1.741594, -0.9569894, 1.867661, 0, 0, 0, 1, 1,
1.743894, 1.130375, -0.8041096, 1, 1, 1, 1, 1,
1.751897, 0.009959331, 1.780624, 1, 1, 1, 1, 1,
1.753431, -0.03216439, 1.081171, 1, 1, 1, 1, 1,
1.76045, 1.93723, 0.1557761, 1, 1, 1, 1, 1,
1.760694, -0.6953533, 1.773216, 1, 1, 1, 1, 1,
1.771966, 0.002079003, 2.297853, 1, 1, 1, 1, 1,
1.77653, -0.7094231, 3.341286, 1, 1, 1, 1, 1,
1.779333, 0.8951973, 1.943354, 1, 1, 1, 1, 1,
1.801067, -1.487808, 2.089325, 1, 1, 1, 1, 1,
1.814787, -0.3815421, 3.412, 1, 1, 1, 1, 1,
1.840468, 0.4272176, 0.6897695, 1, 1, 1, 1, 1,
1.907992, -0.5606838, 2.826179, 1, 1, 1, 1, 1,
1.908377, -0.5065545, 2.276586, 1, 1, 1, 1, 1,
1.913501, -0.05282129, 2.005816, 1, 1, 1, 1, 1,
1.9198, 1.019382, 1.029402, 1, 1, 1, 1, 1,
1.933079, -1.419866, 1.628848, 0, 0, 1, 1, 1,
1.952719, -0.8233556, 0.7552185, 1, 0, 0, 1, 1,
1.994247, 0.439303, 2.739675, 1, 0, 0, 1, 1,
2.002263, -0.1906777, 1.604711, 1, 0, 0, 1, 1,
2.013174, 1.677598, 2.429127, 1, 0, 0, 1, 1,
2.026774, 0.707301, 1.236111, 1, 0, 0, 1, 1,
2.042502, -0.4284407, 1.582237, 0, 0, 0, 1, 1,
2.057719, 0.7599078, 2.522354, 0, 0, 0, 1, 1,
2.114521, 0.1686427, 0.7981803, 0, 0, 0, 1, 1,
2.145274, 1.488147, -0.7482442, 0, 0, 0, 1, 1,
2.219591, 0.4201142, 0.2150972, 0, 0, 0, 1, 1,
2.252302, 0.4919973, 2.313509, 0, 0, 0, 1, 1,
2.265038, -0.7766247, 1.388532, 0, 0, 0, 1, 1,
2.276663, 0.3348463, 0.9564849, 1, 1, 1, 1, 1,
2.361659, -0.08863176, 2.551644, 1, 1, 1, 1, 1,
2.374897, -0.3564823, 0.884622, 1, 1, 1, 1, 1,
2.54074, 1.835476, 2.140919, 1, 1, 1, 1, 1,
2.708344, -1.687062, 2.702305, 1, 1, 1, 1, 1,
2.950927, -0.2054176, 1.056087, 1, 1, 1, 1, 1,
2.989287, -0.5422214, 2.488633, 1, 1, 1, 1, 1
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
var radius = 9.712531;
var distance = 34.11485;
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
mvMatrix.translate( 0.530453, 0.1970482, -0.285183 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.11485);
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