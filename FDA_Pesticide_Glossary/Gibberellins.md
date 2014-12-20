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
-2.691645, -1.527817, -1.288338, 1, 0, 0, 1,
-2.532281, -1.412948, -3.566515, 1, 0.007843138, 0, 1,
-2.476769, 0.4169329, -1.733718, 1, 0.01176471, 0, 1,
-2.458875, -0.05017781, -0.9326949, 1, 0.01960784, 0, 1,
-2.442004, 0.3422288, -0.3134265, 1, 0.02352941, 0, 1,
-2.426096, 2.022683, -0.869859, 1, 0.03137255, 0, 1,
-2.370781, -0.4728767, -1.149547, 1, 0.03529412, 0, 1,
-2.334854, -1.317731, -1.328935, 1, 0.04313726, 0, 1,
-2.326802, -1.48376, -1.99816, 1, 0.04705882, 0, 1,
-2.313696, -2.617983, -2.145943, 1, 0.05490196, 0, 1,
-2.279338, 1.139161, -2.087258, 1, 0.05882353, 0, 1,
-2.266991, -0.3145175, -2.710413, 1, 0.06666667, 0, 1,
-2.197881, -0.2450505, -1.303958, 1, 0.07058824, 0, 1,
-2.152695, 0.2152452, -1.742598, 1, 0.07843138, 0, 1,
-2.126702, 0.6514318, 0.06385586, 1, 0.08235294, 0, 1,
-2.114049, 0.02169422, -1.387659, 1, 0.09019608, 0, 1,
-2.10723, 1.294904, -0.561924, 1, 0.09411765, 0, 1,
-2.106093, -0.6581762, -1.840716, 1, 0.1019608, 0, 1,
-2.079217, 0.05799462, -1.23997, 1, 0.1098039, 0, 1,
-2.077697, -0.5234021, -2.024798, 1, 0.1137255, 0, 1,
-2.076295, 0.2678177, -2.602111, 1, 0.1215686, 0, 1,
-2.053611, -0.247372, -1.334268, 1, 0.1254902, 0, 1,
-2.040461, 1.111177, 0.06011563, 1, 0.1333333, 0, 1,
-1.983391, 0.07456135, -1.443156, 1, 0.1372549, 0, 1,
-1.980707, -0.1175953, -2.463248, 1, 0.145098, 0, 1,
-1.954519, -0.5507736, -1.223755, 1, 0.1490196, 0, 1,
-1.950917, 0.3623675, -2.565095, 1, 0.1568628, 0, 1,
-1.932994, 0.08856698, -2.337101, 1, 0.1607843, 0, 1,
-1.918369, -0.4923013, -3.232261, 1, 0.1686275, 0, 1,
-1.890883, 0.7834991, -0.8217939, 1, 0.172549, 0, 1,
-1.866309, 0.9547109, -0.2879038, 1, 0.1803922, 0, 1,
-1.864048, -0.0069228, -1.669862, 1, 0.1843137, 0, 1,
-1.858505, -0.6858949, -2.246518, 1, 0.1921569, 0, 1,
-1.832078, 1.625239, -0.7538238, 1, 0.1960784, 0, 1,
-1.827477, 0.1364875, -1.444494, 1, 0.2039216, 0, 1,
-1.819039, 0.6814402, -0.9098917, 1, 0.2117647, 0, 1,
-1.809047, 0.6438763, -1.744405, 1, 0.2156863, 0, 1,
-1.806799, 1.357273, -1.48483, 1, 0.2235294, 0, 1,
-1.801343, -0.1217564, -2.845445, 1, 0.227451, 0, 1,
-1.783975, 1.259987, -0.1215829, 1, 0.2352941, 0, 1,
-1.782497, -0.1746337, -2.482879, 1, 0.2392157, 0, 1,
-1.781408, -1.726979, -1.803254, 1, 0.2470588, 0, 1,
-1.77731, 1.62842, -1.000335, 1, 0.2509804, 0, 1,
-1.773386, 0.6165124, -0.9371344, 1, 0.2588235, 0, 1,
-1.769953, 1.41325, 1.042883, 1, 0.2627451, 0, 1,
-1.761837, -0.8869306, -0.9992868, 1, 0.2705882, 0, 1,
-1.753864, 1.435349, 0.7646011, 1, 0.2745098, 0, 1,
-1.751954, 0.1255924, -1.085252, 1, 0.282353, 0, 1,
-1.718562, -1.501325, -2.497115, 1, 0.2862745, 0, 1,
-1.714103, 1.518598, 0.0717959, 1, 0.2941177, 0, 1,
-1.708276, -0.3546773, -0.7281831, 1, 0.3019608, 0, 1,
-1.689024, 0.9992263, -1.641139, 1, 0.3058824, 0, 1,
-1.666344, -1.553513, -3.041207, 1, 0.3137255, 0, 1,
-1.658909, 1.449016, -2.870923, 1, 0.3176471, 0, 1,
-1.65789, -0.2447288, -2.023535, 1, 0.3254902, 0, 1,
-1.638708, -0.6948735, -0.8509043, 1, 0.3294118, 0, 1,
-1.626046, -0.2968343, -3.166975, 1, 0.3372549, 0, 1,
-1.618269, 0.3566477, -1.454273, 1, 0.3411765, 0, 1,
-1.611635, 2.540461, -0.1362291, 1, 0.3490196, 0, 1,
-1.608667, 0.9140452, -2.626342, 1, 0.3529412, 0, 1,
-1.585699, 0.0782658, -1.176364, 1, 0.3607843, 0, 1,
-1.576489, 0.3536488, -0.8867387, 1, 0.3647059, 0, 1,
-1.55283, -1.841972, -0.5813915, 1, 0.372549, 0, 1,
-1.546647, 0.3714829, -2.136371, 1, 0.3764706, 0, 1,
-1.538966, -2.145769, -2.751135, 1, 0.3843137, 0, 1,
-1.53864, -0.5366021, -2.542315, 1, 0.3882353, 0, 1,
-1.538584, 2.380997, -0.4954187, 1, 0.3960784, 0, 1,
-1.538214, 0.771646, 0.3535502, 1, 0.4039216, 0, 1,
-1.529603, -0.02289391, -2.314658, 1, 0.4078431, 0, 1,
-1.52729, -2.279916, -4.945961, 1, 0.4156863, 0, 1,
-1.497974, -0.2938989, -1.215626, 1, 0.4196078, 0, 1,
-1.488829, 0.6917689, -2.118297, 1, 0.427451, 0, 1,
-1.487952, -0.6255028, -3.542743, 1, 0.4313726, 0, 1,
-1.483586, -1.174338, -2.091037, 1, 0.4392157, 0, 1,
-1.474518, -0.4967012, -1.99204, 1, 0.4431373, 0, 1,
-1.473493, -0.1189948, -1.779272, 1, 0.4509804, 0, 1,
-1.461848, 0.2842579, -3.046224, 1, 0.454902, 0, 1,
-1.460823, -0.3719691, -1.786043, 1, 0.4627451, 0, 1,
-1.440507, 0.1696348, -1.029783, 1, 0.4666667, 0, 1,
-1.417299, -1.289155, -2.762242, 1, 0.4745098, 0, 1,
-1.41624, -1.139788, -1.982368, 1, 0.4784314, 0, 1,
-1.411188, -1.173798, -1.632804, 1, 0.4862745, 0, 1,
-1.40931, -0.5850431, -1.640771, 1, 0.4901961, 0, 1,
-1.407463, -0.9956509, -2.370094, 1, 0.4980392, 0, 1,
-1.385481, 0.04717271, -0.001233867, 1, 0.5058824, 0, 1,
-1.379851, 1.398105, 0.07526316, 1, 0.509804, 0, 1,
-1.367218, 0.2786165, -1.81134, 1, 0.5176471, 0, 1,
-1.364311, -1.174755, -0.6270294, 1, 0.5215687, 0, 1,
-1.363737, 1.874683, -1.370033, 1, 0.5294118, 0, 1,
-1.361375, 0.3276909, -2.185123, 1, 0.5333334, 0, 1,
-1.360891, 1.032566, 0.786545, 1, 0.5411765, 0, 1,
-1.35055, -1.131833, -3.287585, 1, 0.5450981, 0, 1,
-1.350142, 1.196236, -1.851346, 1, 0.5529412, 0, 1,
-1.34342, 0.4347882, -3.891749, 1, 0.5568628, 0, 1,
-1.337657, 0.3029157, -1.523442, 1, 0.5647059, 0, 1,
-1.33545, 0.8181343, -0.3965977, 1, 0.5686275, 0, 1,
-1.33252, 1.020783, -0.6694735, 1, 0.5764706, 0, 1,
-1.330373, -0.03475652, -1.140512, 1, 0.5803922, 0, 1,
-1.328151, -1.334055, -3.251423, 1, 0.5882353, 0, 1,
-1.323101, -0.7393635, -0.526275, 1, 0.5921569, 0, 1,
-1.317623, 1.709846, -1.557494, 1, 0.6, 0, 1,
-1.300829, -2.510079, -3.798476, 1, 0.6078432, 0, 1,
-1.300287, -1.193385, -3.282812, 1, 0.6117647, 0, 1,
-1.298334, 1.597869, -1.95007, 1, 0.6196079, 0, 1,
-1.294099, 0.5480537, -1.637537, 1, 0.6235294, 0, 1,
-1.292063, -0.9170426, -0.6975766, 1, 0.6313726, 0, 1,
-1.288114, 1.130878, -1.411788, 1, 0.6352941, 0, 1,
-1.286413, 0.4590588, -2.548024, 1, 0.6431373, 0, 1,
-1.27325, 1.651417, -1.763658, 1, 0.6470588, 0, 1,
-1.269065, 0.5298106, -1.552522, 1, 0.654902, 0, 1,
-1.261891, -0.8932531, -3.116563, 1, 0.6588235, 0, 1,
-1.256932, 0.4553694, -2.332092, 1, 0.6666667, 0, 1,
-1.252831, -1.618175, -3.216405, 1, 0.6705883, 0, 1,
-1.251549, -0.25061, -0.886818, 1, 0.6784314, 0, 1,
-1.25095, 1.863333, -0.8301602, 1, 0.682353, 0, 1,
-1.239208, 1.142402, 0.6667021, 1, 0.6901961, 0, 1,
-1.236824, -0.7489854, -0.9283198, 1, 0.6941177, 0, 1,
-1.230733, -0.4813582, -2.849171, 1, 0.7019608, 0, 1,
-1.221272, 0.9171937, 0.2024223, 1, 0.7098039, 0, 1,
-1.218739, 1.094478, 0.1721161, 1, 0.7137255, 0, 1,
-1.21268, -0.2916109, -1.894115, 1, 0.7215686, 0, 1,
-1.204132, 0.4395294, 0.1410824, 1, 0.7254902, 0, 1,
-1.201801, 0.1276666, 0.8126044, 1, 0.7333333, 0, 1,
-1.199105, -1.240137, -1.180534, 1, 0.7372549, 0, 1,
-1.192395, -0.4259728, -1.369691, 1, 0.7450981, 0, 1,
-1.191092, -1.553891, -2.11782, 1, 0.7490196, 0, 1,
-1.189255, 0.3403449, -0.1628601, 1, 0.7568628, 0, 1,
-1.170596, -0.4144202, -2.724289, 1, 0.7607843, 0, 1,
-1.169177, -1.619846, -2.745956, 1, 0.7686275, 0, 1,
-1.16572, -0.3741575, -2.191029, 1, 0.772549, 0, 1,
-1.163952, -0.1946294, -1.363896, 1, 0.7803922, 0, 1,
-1.162372, -1.97764, -3.743847, 1, 0.7843137, 0, 1,
-1.161463, 0.01914937, -1.021244, 1, 0.7921569, 0, 1,
-1.159313, -0.1185464, -0.8169035, 1, 0.7960784, 0, 1,
-1.158741, -1.346603, -3.961714, 1, 0.8039216, 0, 1,
-1.158274, 0.7841936, -1.534538, 1, 0.8117647, 0, 1,
-1.156622, -1.570138, -3.053976, 1, 0.8156863, 0, 1,
-1.151217, -1.592643, -2.963606, 1, 0.8235294, 0, 1,
-1.14658, -0.6518464, -3.361705, 1, 0.827451, 0, 1,
-1.137696, 1.462944, -1.58733, 1, 0.8352941, 0, 1,
-1.134507, -0.1971448, -3.946093, 1, 0.8392157, 0, 1,
-1.122113, 0.1974414, -2.096767, 1, 0.8470588, 0, 1,
-1.121168, 1.721023, -1.450782, 1, 0.8509804, 0, 1,
-1.11932, -0.0385622, -0.1389207, 1, 0.8588235, 0, 1,
-1.113069, -0.3643786, -1.031426, 1, 0.8627451, 0, 1,
-1.107207, -1.813709, -2.200879, 1, 0.8705882, 0, 1,
-1.096541, 0.6228581, -0.8013829, 1, 0.8745098, 0, 1,
-1.090457, 0.317194, -1.969415, 1, 0.8823529, 0, 1,
-1.089851, 1.305136, -0.2845301, 1, 0.8862745, 0, 1,
-1.079892, 0.7877177, -0.5245497, 1, 0.8941177, 0, 1,
-1.071277, -1.137528, -2.145197, 1, 0.8980392, 0, 1,
-1.060179, 0.01829122, -2.576507, 1, 0.9058824, 0, 1,
-1.059427, -0.9811698, -2.758552, 1, 0.9137255, 0, 1,
-1.057068, -0.1236425, -2.009714, 1, 0.9176471, 0, 1,
-1.05352, -0.4401094, -1.152561, 1, 0.9254902, 0, 1,
-1.050578, -0.5209805, -2.123077, 1, 0.9294118, 0, 1,
-1.031467, -0.5479146, -2.397789, 1, 0.9372549, 0, 1,
-1.027498, 0.01209253, -0.9631479, 1, 0.9411765, 0, 1,
-1.025968, -0.1317212, -2.102008, 1, 0.9490196, 0, 1,
-1.02474, -0.2890511, -2.406356, 1, 0.9529412, 0, 1,
-1.022396, 0.05703146, -1.960628, 1, 0.9607843, 0, 1,
-1.017934, 0.4234376, -0.4745217, 1, 0.9647059, 0, 1,
-1.01293, 1.102786, -1.533342, 1, 0.972549, 0, 1,
-1.007657, -1.192009, -2.784223, 1, 0.9764706, 0, 1,
-1.002293, -0.3877636, -1.029573, 1, 0.9843137, 0, 1,
-1.001564, -0.743852, -4.051208, 1, 0.9882353, 0, 1,
-0.9994909, -0.6803945, -1.497192, 1, 0.9960784, 0, 1,
-0.9953561, -1.00347, -1.112695, 0.9960784, 1, 0, 1,
-0.9865069, -0.3671401, -2.069413, 0.9921569, 1, 0, 1,
-0.9849135, -2.017684, -2.390879, 0.9843137, 1, 0, 1,
-0.9842653, 0.1958694, -1.98473, 0.9803922, 1, 0, 1,
-0.9799669, -0.3337507, -1.183345, 0.972549, 1, 0, 1,
-0.9772549, 0.5744017, -1.595738, 0.9686275, 1, 0, 1,
-0.9731369, -0.7215106, -1.447389, 0.9607843, 1, 0, 1,
-0.9721547, 0.6333335, -0.4556068, 0.9568627, 1, 0, 1,
-0.9704611, 0.3203196, -3.199163, 0.9490196, 1, 0, 1,
-0.9703315, -1.192368, -2.852266, 0.945098, 1, 0, 1,
-0.9631888, -0.3279893, -1.19434, 0.9372549, 1, 0, 1,
-0.9561048, 0.02107953, -1.977216, 0.9333333, 1, 0, 1,
-0.9545709, -0.5588156, -1.680894, 0.9254902, 1, 0, 1,
-0.9535106, 0.3736867, -1.654681, 0.9215686, 1, 0, 1,
-0.953298, -0.03962913, -1.19655, 0.9137255, 1, 0, 1,
-0.9501055, 1.430029, -0.2079521, 0.9098039, 1, 0, 1,
-0.9485065, -0.7283261, -2.262803, 0.9019608, 1, 0, 1,
-0.9352733, -0.2938473, -1.879666, 0.8941177, 1, 0, 1,
-0.9329448, 0.1879967, -2.206605, 0.8901961, 1, 0, 1,
-0.9316168, 0.8819424, -0.08685565, 0.8823529, 1, 0, 1,
-0.9260874, -0.7384771, -4.551451, 0.8784314, 1, 0, 1,
-0.9257318, -1.030185, -2.673672, 0.8705882, 1, 0, 1,
-0.9233294, 2.046521, 1.731747, 0.8666667, 1, 0, 1,
-0.9205059, -0.3523704, -3.119582, 0.8588235, 1, 0, 1,
-0.9161966, -0.2567181, -2.728412, 0.854902, 1, 0, 1,
-0.9159506, 0.8901411, -0.1948623, 0.8470588, 1, 0, 1,
-0.9149985, -0.2537528, -2.316557, 0.8431373, 1, 0, 1,
-0.914533, 0.3272406, 0.5545706, 0.8352941, 1, 0, 1,
-0.9106979, -1.726277, -3.951108, 0.8313726, 1, 0, 1,
-0.9009576, 0.7985499, -0.4928169, 0.8235294, 1, 0, 1,
-0.8926011, 0.9455625, 0.1946788, 0.8196079, 1, 0, 1,
-0.8923431, 0.3708225, -0.1886712, 0.8117647, 1, 0, 1,
-0.8837937, -0.4383474, -4.431306, 0.8078431, 1, 0, 1,
-0.8785315, 0.3371793, 0.1482553, 0.8, 1, 0, 1,
-0.8713973, 0.004249823, -3.353152, 0.7921569, 1, 0, 1,
-0.8692759, -0.9191759, -2.366943, 0.7882353, 1, 0, 1,
-0.869111, -0.4130393, 0.2409273, 0.7803922, 1, 0, 1,
-0.86487, -0.724488, -2.052002, 0.7764706, 1, 0, 1,
-0.8609422, 2.66353, -0.9015353, 0.7686275, 1, 0, 1,
-0.8586007, 0.7154051, -0.6154082, 0.7647059, 1, 0, 1,
-0.8550208, -1.83496, -5.016063, 0.7568628, 1, 0, 1,
-0.852076, 1.228468, -1.258891, 0.7529412, 1, 0, 1,
-0.8454892, -0.5172514, -1.868847, 0.7450981, 1, 0, 1,
-0.8315501, -0.5031754, -3.165191, 0.7411765, 1, 0, 1,
-0.8308777, -0.4660356, -2.550419, 0.7333333, 1, 0, 1,
-0.8286508, -1.062938, -3.222623, 0.7294118, 1, 0, 1,
-0.8249329, -1.020063, -1.132226, 0.7215686, 1, 0, 1,
-0.8216538, -1.428462, -1.472671, 0.7176471, 1, 0, 1,
-0.8216349, -0.9094711, -2.041506, 0.7098039, 1, 0, 1,
-0.8206911, -0.4898176, -1.886387, 0.7058824, 1, 0, 1,
-0.8118467, 2.362226, 0.7401219, 0.6980392, 1, 0, 1,
-0.8112703, 1.657005, -1.165439, 0.6901961, 1, 0, 1,
-0.8107225, 3.244348, -0.1290944, 0.6862745, 1, 0, 1,
-0.8106253, -0.0410525, -1.175267, 0.6784314, 1, 0, 1,
-0.8087564, -1.428209, -2.481704, 0.6745098, 1, 0, 1,
-0.8074524, -0.1626998, -3.428379, 0.6666667, 1, 0, 1,
-0.8049232, -0.2201947, -3.251685, 0.6627451, 1, 0, 1,
-0.8047401, 1.193907, -1.096083, 0.654902, 1, 0, 1,
-0.8047323, 0.7556498, -1.434419, 0.6509804, 1, 0, 1,
-0.8039933, -0.877978, -3.021614, 0.6431373, 1, 0, 1,
-0.7975403, -0.3748723, -0.9062504, 0.6392157, 1, 0, 1,
-0.7975229, -0.0221083, -3.504617, 0.6313726, 1, 0, 1,
-0.7914045, 0.9639934, -0.4852839, 0.627451, 1, 0, 1,
-0.7898985, -2.828515, -1.382118, 0.6196079, 1, 0, 1,
-0.7889229, 0.5764687, -0.1165636, 0.6156863, 1, 0, 1,
-0.78773, 0.7703694, -0.7307615, 0.6078432, 1, 0, 1,
-0.7831763, 0.3155314, -1.178117, 0.6039216, 1, 0, 1,
-0.7824152, 0.153888, -1.838498, 0.5960785, 1, 0, 1,
-0.7774376, 0.2725946, -2.951777, 0.5882353, 1, 0, 1,
-0.7745261, 0.6540011, -1.167646, 0.5843138, 1, 0, 1,
-0.754679, 1.017206, -1.194336, 0.5764706, 1, 0, 1,
-0.753876, -0.7152988, -1.306566, 0.572549, 1, 0, 1,
-0.7531751, 0.2936887, -0.7451679, 0.5647059, 1, 0, 1,
-0.7509118, 0.08758421, 0.6241331, 0.5607843, 1, 0, 1,
-0.7481468, -0.1474175, -1.496418, 0.5529412, 1, 0, 1,
-0.7453262, -1.35387, -2.3246, 0.5490196, 1, 0, 1,
-0.741088, -0.5316159, -3.147752, 0.5411765, 1, 0, 1,
-0.7361221, 0.5294368, -1.793232, 0.5372549, 1, 0, 1,
-0.722633, 1.026312, 0.04657334, 0.5294118, 1, 0, 1,
-0.7191615, 1.417644, -1.186125, 0.5254902, 1, 0, 1,
-0.716723, -0.6037161, -1.737158, 0.5176471, 1, 0, 1,
-0.7148588, 0.3041422, 0.3322926, 0.5137255, 1, 0, 1,
-0.714103, 0.4741596, -1.863914, 0.5058824, 1, 0, 1,
-0.6985378, -0.9158801, -3.098773, 0.5019608, 1, 0, 1,
-0.6962612, 0.2332861, -0.2231381, 0.4941176, 1, 0, 1,
-0.6859832, -0.8255543, -3.605953, 0.4862745, 1, 0, 1,
-0.6813669, 0.7685378, 1.148651, 0.4823529, 1, 0, 1,
-0.6802479, -0.4125601, -1.908401, 0.4745098, 1, 0, 1,
-0.6784616, 0.4000081, -0.480958, 0.4705882, 1, 0, 1,
-0.6781572, 0.5585635, -0.6293843, 0.4627451, 1, 0, 1,
-0.6717109, -0.316112, -0.6316735, 0.4588235, 1, 0, 1,
-0.6633716, -0.6848508, -3.21112, 0.4509804, 1, 0, 1,
-0.662344, 0.629652, -0.6949685, 0.4470588, 1, 0, 1,
-0.6581723, 1.859573, -1.264367, 0.4392157, 1, 0, 1,
-0.6556756, 0.6608831, -0.7260578, 0.4352941, 1, 0, 1,
-0.6502026, 0.2215878, 0.3408212, 0.427451, 1, 0, 1,
-0.6453253, -1.610637, -3.692059, 0.4235294, 1, 0, 1,
-0.6417412, -2.757273, -3.470331, 0.4156863, 1, 0, 1,
-0.6408005, 0.09504954, -0.6955443, 0.4117647, 1, 0, 1,
-0.6358079, 0.08330333, -3.462342, 0.4039216, 1, 0, 1,
-0.6307865, 0.06328125, -1.067447, 0.3960784, 1, 0, 1,
-0.6283889, -0.895306, -2.831459, 0.3921569, 1, 0, 1,
-0.6247682, -1.270461, -4.332452, 0.3843137, 1, 0, 1,
-0.6246705, -0.4518276, -2.145253, 0.3803922, 1, 0, 1,
-0.6245523, 0.4578423, -1.742796, 0.372549, 1, 0, 1,
-0.6177275, 0.6633512, -0.2330393, 0.3686275, 1, 0, 1,
-0.6148754, -0.5023414, -1.925679, 0.3607843, 1, 0, 1,
-0.6113223, -0.9835582, -3.478983, 0.3568628, 1, 0, 1,
-0.6074371, -1.716681, -3.766143, 0.3490196, 1, 0, 1,
-0.6003099, -0.1480672, -2.170525, 0.345098, 1, 0, 1,
-0.5951018, -0.9779786, -2.544172, 0.3372549, 1, 0, 1,
-0.5922373, 0.1277745, -1.91172, 0.3333333, 1, 0, 1,
-0.5909626, -1.523631, -2.918095, 0.3254902, 1, 0, 1,
-0.5902474, -0.4412145, -1.667817, 0.3215686, 1, 0, 1,
-0.5877153, -0.7289219, -2.056885, 0.3137255, 1, 0, 1,
-0.5870792, 0.8597096, -0.9204666, 0.3098039, 1, 0, 1,
-0.5858466, -1.077934, -2.340099, 0.3019608, 1, 0, 1,
-0.5847774, -0.8363945, -2.118994, 0.2941177, 1, 0, 1,
-0.5825907, -0.2846543, -3.355492, 0.2901961, 1, 0, 1,
-0.5815515, 0.2451802, -1.450282, 0.282353, 1, 0, 1,
-0.5792904, 0.3121867, -2.552703, 0.2784314, 1, 0, 1,
-0.5755316, 1.442773, -1.925414, 0.2705882, 1, 0, 1,
-0.5736901, 1.204831, -0.3706212, 0.2666667, 1, 0, 1,
-0.5683113, 0.5470833, -1.381499, 0.2588235, 1, 0, 1,
-0.5681151, -0.08204208, -0.6812199, 0.254902, 1, 0, 1,
-0.5644243, 0.009700341, -2.252028, 0.2470588, 1, 0, 1,
-0.5611996, 0.01760828, 0.09510782, 0.2431373, 1, 0, 1,
-0.5543678, 0.3747503, -2.234053, 0.2352941, 1, 0, 1,
-0.5534159, 1.12435, -1.095729, 0.2313726, 1, 0, 1,
-0.553341, -0.08813334, 0.08590767, 0.2235294, 1, 0, 1,
-0.5488504, 0.6374652, -1.693218, 0.2196078, 1, 0, 1,
-0.5471427, -2.480844, -3.368988, 0.2117647, 1, 0, 1,
-0.5468715, -0.1611979, -2.126435, 0.2078431, 1, 0, 1,
-0.543255, 0.8098004, 0.04793998, 0.2, 1, 0, 1,
-0.5412331, 0.1644181, -1.192635, 0.1921569, 1, 0, 1,
-0.540172, -0.1025571, -0.8923381, 0.1882353, 1, 0, 1,
-0.5367425, -0.1927294, -2.1538, 0.1803922, 1, 0, 1,
-0.5350856, 2.051254, -0.04253558, 0.1764706, 1, 0, 1,
-0.5331043, 0.008746759, -0.4225751, 0.1686275, 1, 0, 1,
-0.5326946, 0.107968, 0.0968921, 0.1647059, 1, 0, 1,
-0.5318732, -0.4381054, -0.1786596, 0.1568628, 1, 0, 1,
-0.5314452, -0.1737326, -2.393342, 0.1529412, 1, 0, 1,
-0.5299635, -0.879923, -0.826687, 0.145098, 1, 0, 1,
-0.5298514, -1.114666, -3.377346, 0.1411765, 1, 0, 1,
-0.5289724, -0.5938938, -2.532309, 0.1333333, 1, 0, 1,
-0.5276628, -1.277186, -3.611689, 0.1294118, 1, 0, 1,
-0.5267248, -1.785952, -3.306281, 0.1215686, 1, 0, 1,
-0.5251237, -1.221447, -2.711495, 0.1176471, 1, 0, 1,
-0.5240309, 0.5240363, -1.11617, 0.1098039, 1, 0, 1,
-0.5221273, 0.2945404, -1.940424, 0.1058824, 1, 0, 1,
-0.5168286, 2.11945, -1.911306, 0.09803922, 1, 0, 1,
-0.5165434, -0.06022122, -3.173791, 0.09019608, 1, 0, 1,
-0.5145089, 0.5305368, -1.28594, 0.08627451, 1, 0, 1,
-0.5143337, 1.208128, 0.8263077, 0.07843138, 1, 0, 1,
-0.5132561, 0.6550022, -0.1324435, 0.07450981, 1, 0, 1,
-0.5125283, 0.03771137, -0.488724, 0.06666667, 1, 0, 1,
-0.5113659, -0.2087671, -1.988671, 0.0627451, 1, 0, 1,
-0.5053071, -3.416422, -3.030636, 0.05490196, 1, 0, 1,
-0.503045, 0.3977876, -2.357779, 0.05098039, 1, 0, 1,
-0.502818, -0.9380863, -2.146995, 0.04313726, 1, 0, 1,
-0.4968729, -0.1184909, -1.318183, 0.03921569, 1, 0, 1,
-0.495185, 0.7408706, 0.568108, 0.03137255, 1, 0, 1,
-0.4949709, 1.894349, -0.9741138, 0.02745098, 1, 0, 1,
-0.493423, -0.8546463, -2.125597, 0.01960784, 1, 0, 1,
-0.4861881, 0.6140066, -1.379569, 0.01568628, 1, 0, 1,
-0.4845166, -0.708858, -3.983334, 0.007843138, 1, 0, 1,
-0.483965, -1.102928, -1.85938, 0.003921569, 1, 0, 1,
-0.4811701, -0.356916, -2.947347, 0, 1, 0.003921569, 1,
-0.4782791, 1.52286, -0.8902378, 0, 1, 0.01176471, 1,
-0.4779711, 0.6806888, -1.868079, 0, 1, 0.01568628, 1,
-0.4750585, 0.8245176, -1.585883, 0, 1, 0.02352941, 1,
-0.4749551, 1.230751, -1.666543, 0, 1, 0.02745098, 1,
-0.4714564, 0.7986863, -0.7931454, 0, 1, 0.03529412, 1,
-0.4710003, 1.697344, -0.2127451, 0, 1, 0.03921569, 1,
-0.4664178, 0.8782563, -1.4156, 0, 1, 0.04705882, 1,
-0.462037, 0.2035621, -0.1437909, 0, 1, 0.05098039, 1,
-0.4616816, 0.58382, -0.8911129, 0, 1, 0.05882353, 1,
-0.4577264, -0.107639, -0.624168, 0, 1, 0.0627451, 1,
-0.455899, 0.1870857, -1.79139, 0, 1, 0.07058824, 1,
-0.4490465, -0.3172064, -2.158974, 0, 1, 0.07450981, 1,
-0.4488068, -0.7256151, -2.078935, 0, 1, 0.08235294, 1,
-0.4486059, 0.4803551, 0.5022784, 0, 1, 0.08627451, 1,
-0.4437341, 0.4102179, -3.030918, 0, 1, 0.09411765, 1,
-0.443454, -0.8020384, -2.323145, 0, 1, 0.1019608, 1,
-0.4399295, 0.3354127, -1.468285, 0, 1, 0.1058824, 1,
-0.4321936, -0.2509776, -2.784207, 0, 1, 0.1137255, 1,
-0.4320293, -0.7874768, -1.475862, 0, 1, 0.1176471, 1,
-0.4283461, 0.0225993, -1.271173, 0, 1, 0.1254902, 1,
-0.427628, 0.3119894, -1.340903, 0, 1, 0.1294118, 1,
-0.4241081, -0.08583283, -3.632488, 0, 1, 0.1372549, 1,
-0.4192958, -0.2424575, -2.930094, 0, 1, 0.1411765, 1,
-0.4136247, -0.1934712, -0.9152736, 0, 1, 0.1490196, 1,
-0.4122542, -0.8556336, -2.652488, 0, 1, 0.1529412, 1,
-0.4100975, -0.7790459, -1.791188, 0, 1, 0.1607843, 1,
-0.4047919, -0.2025199, -3.817665, 0, 1, 0.1647059, 1,
-0.4046597, -1.004205, -2.735314, 0, 1, 0.172549, 1,
-0.4040873, 0.7898845, -1.461589, 0, 1, 0.1764706, 1,
-0.4037795, -0.2672548, -3.386851, 0, 1, 0.1843137, 1,
-0.4026358, -0.02443522, -2.433596, 0, 1, 0.1882353, 1,
-0.3992662, 1.225166, -0.6742172, 0, 1, 0.1960784, 1,
-0.3991975, 0.4730814, -0.5631236, 0, 1, 0.2039216, 1,
-0.3937466, 0.07624063, -0.4165452, 0, 1, 0.2078431, 1,
-0.3936322, -0.2302001, -2.444797, 0, 1, 0.2156863, 1,
-0.3932586, 0.001329502, -0.4207231, 0, 1, 0.2196078, 1,
-0.3915606, 0.4294981, -0.5228287, 0, 1, 0.227451, 1,
-0.3855949, -0.7278354, -1.374342, 0, 1, 0.2313726, 1,
-0.3855106, -0.7827141, -1.128562, 0, 1, 0.2392157, 1,
-0.3787767, 2.231902, 0.4680127, 0, 1, 0.2431373, 1,
-0.3779907, 0.6974613, -0.6579982, 0, 1, 0.2509804, 1,
-0.3771673, 1.250907, 0.5961555, 0, 1, 0.254902, 1,
-0.3771213, 0.08740506, -2.811707, 0, 1, 0.2627451, 1,
-0.3735624, -0.2499319, -1.505415, 0, 1, 0.2666667, 1,
-0.3730274, -0.6063937, -3.206452, 0, 1, 0.2745098, 1,
-0.3703501, 0.03554555, -1.631127, 0, 1, 0.2784314, 1,
-0.3681405, -1.445244, -4.47069, 0, 1, 0.2862745, 1,
-0.3673272, 1.053755, -0.4037803, 0, 1, 0.2901961, 1,
-0.3623113, -1.233789, -3.143491, 0, 1, 0.2980392, 1,
-0.3614761, -1.357579, -2.793443, 0, 1, 0.3058824, 1,
-0.3614272, 0.7222653, 0.2266511, 0, 1, 0.3098039, 1,
-0.3612819, 0.1057168, -1.520446, 0, 1, 0.3176471, 1,
-0.3603034, -0.6229605, -2.318166, 0, 1, 0.3215686, 1,
-0.3599014, 0.3465485, -1.287225, 0, 1, 0.3294118, 1,
-0.3590634, 1.398428, 0.3562196, 0, 1, 0.3333333, 1,
-0.357987, -1.069648, -3.180968, 0, 1, 0.3411765, 1,
-0.3487073, 0.2063041, -1.907933, 0, 1, 0.345098, 1,
-0.3458499, -0.2063751, -1.559218, 0, 1, 0.3529412, 1,
-0.3449823, 0.8855187, -0.01949529, 0, 1, 0.3568628, 1,
-0.3376845, -1.07119, -3.960352, 0, 1, 0.3647059, 1,
-0.3360031, -0.8543743, -1.74361, 0, 1, 0.3686275, 1,
-0.3344665, -0.06105921, -3.057909, 0, 1, 0.3764706, 1,
-0.3314196, 0.4427083, 0.4817579, 0, 1, 0.3803922, 1,
-0.331292, 0.5217705, -0.5045276, 0, 1, 0.3882353, 1,
-0.3303707, 0.8114312, -0.8182371, 0, 1, 0.3921569, 1,
-0.3273161, 0.6894021, -0.6712664, 0, 1, 0.4, 1,
-0.3262194, -0.8567345, -2.205599, 0, 1, 0.4078431, 1,
-0.3215437, 0.3312283, -0.8635262, 0, 1, 0.4117647, 1,
-0.3137376, 1.375802, 0.009681139, 0, 1, 0.4196078, 1,
-0.3080949, -0.6555284, -3.3719, 0, 1, 0.4235294, 1,
-0.3005455, 0.5598992, -1.405045, 0, 1, 0.4313726, 1,
-0.296435, 1.233277, -0.7568318, 0, 1, 0.4352941, 1,
-0.2936288, -0.1736433, -0.9755062, 0, 1, 0.4431373, 1,
-0.2901606, -1.487129, -2.196732, 0, 1, 0.4470588, 1,
-0.2887739, -0.7017109, -2.673592, 0, 1, 0.454902, 1,
-0.2881956, -1.187932, -1.611783, 0, 1, 0.4588235, 1,
-0.2877236, -0.1333338, -2.797271, 0, 1, 0.4666667, 1,
-0.2874309, 0.7208405, -1.329525, 0, 1, 0.4705882, 1,
-0.2798797, -0.03375944, -2.882271, 0, 1, 0.4784314, 1,
-0.274355, -0.9520392, -3.258906, 0, 1, 0.4823529, 1,
-0.2649111, 0.8673374, -1.060189, 0, 1, 0.4901961, 1,
-0.2584539, -1.088455, -3.461455, 0, 1, 0.4941176, 1,
-0.2573342, -1.142509, -3.995092, 0, 1, 0.5019608, 1,
-0.2538054, 0.2315925, -0.4955318, 0, 1, 0.509804, 1,
-0.2533897, 1.178579, -2.698341, 0, 1, 0.5137255, 1,
-0.2445309, 0.01758912, -1.412405, 0, 1, 0.5215687, 1,
-0.2420482, -0.1784011, -1.429318, 0, 1, 0.5254902, 1,
-0.240605, -1.385703, -3.752971, 0, 1, 0.5333334, 1,
-0.2389571, -0.4735974, -1.637132, 0, 1, 0.5372549, 1,
-0.2342043, 1.004073, -0.9814546, 0, 1, 0.5450981, 1,
-0.2261182, 0.008102137, 1.135029, 0, 1, 0.5490196, 1,
-0.2252763, -0.6474454, -1.962369, 0, 1, 0.5568628, 1,
-0.2248635, 0.3141084, 0.5509465, 0, 1, 0.5607843, 1,
-0.2247971, 0.4957114, 0.5959575, 0, 1, 0.5686275, 1,
-0.2167835, -0.9686347, -3.785927, 0, 1, 0.572549, 1,
-0.2128069, 0.4149408, -1.357419, 0, 1, 0.5803922, 1,
-0.2095173, 1.455465, -0.9297791, 0, 1, 0.5843138, 1,
-0.2015612, -0.4648018, -3.647491, 0, 1, 0.5921569, 1,
-0.2011824, -0.6813155, -3.404019, 0, 1, 0.5960785, 1,
-0.1998869, 1.378111, 0.5486085, 0, 1, 0.6039216, 1,
-0.199797, -0.5125004, -2.098867, 0, 1, 0.6117647, 1,
-0.1975466, -0.2887765, -2.608616, 0, 1, 0.6156863, 1,
-0.1967984, -0.3347883, -1.917428, 0, 1, 0.6235294, 1,
-0.1956006, -0.02192154, -3.199795, 0, 1, 0.627451, 1,
-0.1897991, -0.1651825, -4.07087, 0, 1, 0.6352941, 1,
-0.1894651, -0.9873545, -1.216634, 0, 1, 0.6392157, 1,
-0.180683, 0.6361067, -1.854488, 0, 1, 0.6470588, 1,
-0.1773998, 0.1491754, -0.9511038, 0, 1, 0.6509804, 1,
-0.1719533, -0.4228571, -3.05899, 0, 1, 0.6588235, 1,
-0.1691719, 0.07762983, -1.275388, 0, 1, 0.6627451, 1,
-0.1648359, 1.492149, -0.06512542, 0, 1, 0.6705883, 1,
-0.1647117, 1.378188, -0.854426, 0, 1, 0.6745098, 1,
-0.160729, -0.3684106, -3.044704, 0, 1, 0.682353, 1,
-0.1525661, 1.866566, -0.03922011, 0, 1, 0.6862745, 1,
-0.150358, -0.9549659, -6.371078, 0, 1, 0.6941177, 1,
-0.1468577, 0.05570729, -0.9665213, 0, 1, 0.7019608, 1,
-0.1465584, 1.198985, -1.162824, 0, 1, 0.7058824, 1,
-0.1414969, 0.8852153, 1.043743, 0, 1, 0.7137255, 1,
-0.1414389, -2.126814, -2.001755, 0, 1, 0.7176471, 1,
-0.1407867, -1.43231, -5.406867, 0, 1, 0.7254902, 1,
-0.1398518, -0.9079989, -3.882894, 0, 1, 0.7294118, 1,
-0.1370671, -0.1023738, -1.833496, 0, 1, 0.7372549, 1,
-0.1358314, 1.699193, -0.8330439, 0, 1, 0.7411765, 1,
-0.1218357, 1.519439, 0.2190743, 0, 1, 0.7490196, 1,
-0.1176613, -1.069873, -3.833469, 0, 1, 0.7529412, 1,
-0.1167192, -0.6870251, -1.664623, 0, 1, 0.7607843, 1,
-0.1147118, 0.3405638, -0.900768, 0, 1, 0.7647059, 1,
-0.1132483, -1.400376, -3.226821, 0, 1, 0.772549, 1,
-0.1100272, -0.1103212, -1.11886, 0, 1, 0.7764706, 1,
-0.107898, 1.607504, -1.56127, 0, 1, 0.7843137, 1,
-0.1077229, 0.7208786, -1.721799, 0, 1, 0.7882353, 1,
-0.09733475, -1.181626, -3.314142, 0, 1, 0.7960784, 1,
-0.09429048, -0.2687693, -2.015785, 0, 1, 0.8039216, 1,
-0.09221222, 0.3390264, -1.597988, 0, 1, 0.8078431, 1,
-0.09158338, 2.31101, -0.4925967, 0, 1, 0.8156863, 1,
-0.09021696, -0.9040822, -3.924256, 0, 1, 0.8196079, 1,
-0.08996137, -0.08546177, -1.072386, 0, 1, 0.827451, 1,
-0.08654702, -0.1976809, -3.350746, 0, 1, 0.8313726, 1,
-0.08592039, -1.314311, -3.785943, 0, 1, 0.8392157, 1,
-0.08498234, 0.5845423, 1.013381, 0, 1, 0.8431373, 1,
-0.0832405, -0.9812005, -3.110392, 0, 1, 0.8509804, 1,
-0.08253897, -1.110684, -2.570923, 0, 1, 0.854902, 1,
-0.07618632, 0.3779851, 1.83983, 0, 1, 0.8627451, 1,
-0.07512533, 0.8616862, -0.4013897, 0, 1, 0.8666667, 1,
-0.07258753, -0.8388751, -1.692562, 0, 1, 0.8745098, 1,
-0.06981182, -1.455375, -4.112293, 0, 1, 0.8784314, 1,
-0.06241811, 1.634287, -0.3314422, 0, 1, 0.8862745, 1,
-0.05565256, 0.5338191, -1.048645, 0, 1, 0.8901961, 1,
-0.05180258, -0.1818198, -2.118328, 0, 1, 0.8980392, 1,
-0.05014176, 0.6970908, 1.653122, 0, 1, 0.9058824, 1,
-0.05009312, 0.3160794, -1.46497, 0, 1, 0.9098039, 1,
-0.04953294, 0.9446344, -0.4305967, 0, 1, 0.9176471, 1,
-0.04921586, 0.1574873, 0.53081, 0, 1, 0.9215686, 1,
-0.04484747, 0.05196299, -0.4360827, 0, 1, 0.9294118, 1,
-0.04335792, -0.06687788, -2.2589, 0, 1, 0.9333333, 1,
-0.04283499, 1.411778, -0.3466549, 0, 1, 0.9411765, 1,
-0.03902294, 1.050475, 0.2373546, 0, 1, 0.945098, 1,
-0.02859103, 0.7629398, 0.9540679, 0, 1, 0.9529412, 1,
-0.02737777, -0.7600696, -2.769749, 0, 1, 0.9568627, 1,
-0.02582558, -0.08888704, -3.442943, 0, 1, 0.9647059, 1,
-0.02491037, 0.1505862, -1.237907, 0, 1, 0.9686275, 1,
-0.02448473, 1.081984, -1.252814, 0, 1, 0.9764706, 1,
-0.02424769, -1.532412, -3.035178, 0, 1, 0.9803922, 1,
-0.02269458, -0.7206811, -4.898512, 0, 1, 0.9882353, 1,
-0.02253393, -0.472635, -4.02588, 0, 1, 0.9921569, 1,
-0.02192314, -0.5898291, -3.984884, 0, 1, 1, 1,
-0.01754255, -0.9426229, -1.75846, 0, 0.9921569, 1, 1,
-0.01574718, 0.7855211, 0.3963417, 0, 0.9882353, 1, 1,
-0.01406671, 0.5579525, 0.541441, 0, 0.9803922, 1, 1,
-0.009422709, -0.1757886, -3.253183, 0, 0.9764706, 1, 1,
-0.00866981, 1.993964, -0.3394575, 0, 0.9686275, 1, 1,
-0.007681132, -0.8828906, -2.322505, 0, 0.9647059, 1, 1,
-0.00752497, 0.7478914, 1.445532, 0, 0.9568627, 1, 1,
-0.007136411, 0.9473928, -0.1999041, 0, 0.9529412, 1, 1,
-0.006253796, -0.7106727, -3.156087, 0, 0.945098, 1, 1,
-0.004461554, 1.209417, 1.640208, 0, 0.9411765, 1, 1,
0.0009348118, 1.503648, 0.9124267, 0, 0.9333333, 1, 1,
0.007636095, 0.7162367, -1.88656, 0, 0.9294118, 1, 1,
0.01207355, 0.6164373, -1.173603, 0, 0.9215686, 1, 1,
0.01449131, 0.1413331, 1.055346, 0, 0.9176471, 1, 1,
0.01461785, 1.870117, 0.8152424, 0, 0.9098039, 1, 1,
0.01968101, -1.823229, 2.443681, 0, 0.9058824, 1, 1,
0.01985773, -0.938396, 4.308929, 0, 0.8980392, 1, 1,
0.0214858, -1.151173, 3.570944, 0, 0.8901961, 1, 1,
0.02384863, 0.1332194, 1.359461, 0, 0.8862745, 1, 1,
0.02563809, 1.103244, -0.5954476, 0, 0.8784314, 1, 1,
0.02792588, 0.01901711, 2.602602, 0, 0.8745098, 1, 1,
0.02931001, 0.1988865, -0.1861897, 0, 0.8666667, 1, 1,
0.03189469, -1.010098, 3.767425, 0, 0.8627451, 1, 1,
0.03374113, 0.207275, 0.7289, 0, 0.854902, 1, 1,
0.0361072, -0.6059233, 5.146274, 0, 0.8509804, 1, 1,
0.03813589, 1.653989, 0.2726181, 0, 0.8431373, 1, 1,
0.04707654, -1.134996, 2.385895, 0, 0.8392157, 1, 1,
0.05003967, -0.9398217, 4.333064, 0, 0.8313726, 1, 1,
0.05420873, 1.008119, 0.8907344, 0, 0.827451, 1, 1,
0.06170229, 0.009656253, 0.3504074, 0, 0.8196079, 1, 1,
0.06448078, 0.639479, 0.5659595, 0, 0.8156863, 1, 1,
0.06628988, -0.4898324, 2.742213, 0, 0.8078431, 1, 1,
0.06670275, 0.09173764, 0.9382321, 0, 0.8039216, 1, 1,
0.06953769, 1.423224, 0.5676821, 0, 0.7960784, 1, 1,
0.07118622, 0.8869339, -0.8960371, 0, 0.7882353, 1, 1,
0.07210982, -0.7277383, 4.173134, 0, 0.7843137, 1, 1,
0.07288578, 0.5311667, 0.01550002, 0, 0.7764706, 1, 1,
0.07339311, 0.5060415, 0.01566394, 0, 0.772549, 1, 1,
0.07726582, 0.8167832, -0.7919877, 0, 0.7647059, 1, 1,
0.07832937, 1.808918, -1.916636, 0, 0.7607843, 1, 1,
0.07980797, 0.2286063, -0.4638733, 0, 0.7529412, 1, 1,
0.08343145, 0.8432191, 0.6540595, 0, 0.7490196, 1, 1,
0.08507536, -2.066443, 2.581942, 0, 0.7411765, 1, 1,
0.08761997, -0.9203694, 3.235052, 0, 0.7372549, 1, 1,
0.08949343, -2.661773, 2.826122, 0, 0.7294118, 1, 1,
0.08976647, -1.25424, 3.787996, 0, 0.7254902, 1, 1,
0.0947928, 0.2357956, 0.3296703, 0, 0.7176471, 1, 1,
0.09802551, -0.630541, 3.784489, 0, 0.7137255, 1, 1,
0.1115084, -0.9202244, 5.154502, 0, 0.7058824, 1, 1,
0.1166304, -0.9714764, 4.211887, 0, 0.6980392, 1, 1,
0.1181893, 0.6546831, -0.9813055, 0, 0.6941177, 1, 1,
0.1197689, -1.35604, 3.63344, 0, 0.6862745, 1, 1,
0.1298525, 0.5605921, 0.159833, 0, 0.682353, 1, 1,
0.1318969, 2.06245, 0.899226, 0, 0.6745098, 1, 1,
0.1374749, -0.6622267, 1.183315, 0, 0.6705883, 1, 1,
0.1411132, -0.6168937, 0.6020075, 0, 0.6627451, 1, 1,
0.1470313, -1.277078, 1.81308, 0, 0.6588235, 1, 1,
0.1496705, -1.718363, 2.173784, 0, 0.6509804, 1, 1,
0.1521774, -0.8075701, 3.991124, 0, 0.6470588, 1, 1,
0.1559242, 0.2480872, -0.565957, 0, 0.6392157, 1, 1,
0.1570792, 0.2819581, 1.468067, 0, 0.6352941, 1, 1,
0.1645731, -0.6097256, 3.203972, 0, 0.627451, 1, 1,
0.1659206, -0.3980197, 3.102662, 0, 0.6235294, 1, 1,
0.166566, 0.7142457, -2.18679, 0, 0.6156863, 1, 1,
0.1739122, 0.02564665, 1.279186, 0, 0.6117647, 1, 1,
0.1824489, 1.543498, 0.2736019, 0, 0.6039216, 1, 1,
0.1906509, 2.504735, 1.424497, 0, 0.5960785, 1, 1,
0.1965752, -1.27857, 1.526471, 0, 0.5921569, 1, 1,
0.198746, -0.2262571, 2.937842, 0, 0.5843138, 1, 1,
0.1994562, -1.320498, 3.759197, 0, 0.5803922, 1, 1,
0.2010557, -0.6718345, 3.614625, 0, 0.572549, 1, 1,
0.2028197, -1.452613, 4.121603, 0, 0.5686275, 1, 1,
0.2028792, -1.215955, 2.536839, 0, 0.5607843, 1, 1,
0.2030699, 0.01070743, 1.718603, 0, 0.5568628, 1, 1,
0.2059539, -0.9321469, 2.242515, 0, 0.5490196, 1, 1,
0.2106704, -1.630421, 4.030143, 0, 0.5450981, 1, 1,
0.211224, -0.9253111, 3.628856, 0, 0.5372549, 1, 1,
0.2124386, 1.640583, 0.2300282, 0, 0.5333334, 1, 1,
0.2151991, 1.141349, 0.01710958, 0, 0.5254902, 1, 1,
0.218418, -0.02844453, 1.799795, 0, 0.5215687, 1, 1,
0.2202602, -0.7287601, 2.349417, 0, 0.5137255, 1, 1,
0.2207592, -2.380894, 1.449987, 0, 0.509804, 1, 1,
0.2218698, 0.994925, 0.8711866, 0, 0.5019608, 1, 1,
0.2236903, 1.929254, 2.000877, 0, 0.4941176, 1, 1,
0.224706, 0.9289337, 1.308379, 0, 0.4901961, 1, 1,
0.2255016, -0.07418513, 0.9390964, 0, 0.4823529, 1, 1,
0.2346975, -1.057825, 3.071067, 0, 0.4784314, 1, 1,
0.2406953, -0.6848468, 1.899967, 0, 0.4705882, 1, 1,
0.2422397, 0.1741164, 1.491385, 0, 0.4666667, 1, 1,
0.2443231, -0.01578131, 2.515949, 0, 0.4588235, 1, 1,
0.2464411, -0.2893461, 2.836657, 0, 0.454902, 1, 1,
0.2491845, 0.4575602, 1.804185, 0, 0.4470588, 1, 1,
0.249368, 0.01842588, 3.448595, 0, 0.4431373, 1, 1,
0.2498852, -0.9342511, 2.824046, 0, 0.4352941, 1, 1,
0.2534153, -0.03773963, 0.9710424, 0, 0.4313726, 1, 1,
0.2546071, 1.324574, 0.6991711, 0, 0.4235294, 1, 1,
0.2548082, 0.2721852, 1.49626, 0, 0.4196078, 1, 1,
0.2555389, 0.05541192, 2.341866, 0, 0.4117647, 1, 1,
0.2566974, -1.248335, 1.169866, 0, 0.4078431, 1, 1,
0.2599513, 3.103172, 0.6057882, 0, 0.4, 1, 1,
0.2620971, -3.197007, 3.652509, 0, 0.3921569, 1, 1,
0.2656765, -0.4192727, 3.660066, 0, 0.3882353, 1, 1,
0.2661798, -1.527716, 3.251261, 0, 0.3803922, 1, 1,
0.267967, 0.4773205, -0.8579558, 0, 0.3764706, 1, 1,
0.2696795, -0.2970731, 1.634484, 0, 0.3686275, 1, 1,
0.2718572, -0.7346079, 3.066854, 0, 0.3647059, 1, 1,
0.2744261, -0.4666371, 3.461327, 0, 0.3568628, 1, 1,
0.2775389, 1.66465, 1.118189, 0, 0.3529412, 1, 1,
0.27763, -0.6437646, 1.059171, 0, 0.345098, 1, 1,
0.2787356, 1.211932, 0.1712622, 0, 0.3411765, 1, 1,
0.2805578, 0.670168, 0.6154641, 0, 0.3333333, 1, 1,
0.2848697, -0.007039782, 2.579299, 0, 0.3294118, 1, 1,
0.2848764, -0.1789496, 0.6836118, 0, 0.3215686, 1, 1,
0.2858879, 0.5459302, 0.9733425, 0, 0.3176471, 1, 1,
0.2898741, -0.9900314, 2.697379, 0, 0.3098039, 1, 1,
0.299025, -0.3267192, 2.064591, 0, 0.3058824, 1, 1,
0.299691, 0.3008799, 0.7849736, 0, 0.2980392, 1, 1,
0.3039858, 0.5047422, 2.529768, 0, 0.2901961, 1, 1,
0.3057652, 0.9481862, 1.91035, 0, 0.2862745, 1, 1,
0.3065892, -0.928166, 3.972632, 0, 0.2784314, 1, 1,
0.3097855, 1.25635, 1.405402, 0, 0.2745098, 1, 1,
0.3100498, -1.241884, 2.784114, 0, 0.2666667, 1, 1,
0.3133546, -0.3572626, 3.277999, 0, 0.2627451, 1, 1,
0.3165706, 0.5426274, 0.177837, 0, 0.254902, 1, 1,
0.3169397, -0.08782736, 2.219044, 0, 0.2509804, 1, 1,
0.3192705, -0.2359139, 2.070835, 0, 0.2431373, 1, 1,
0.3236105, -0.3642902, 1.971477, 0, 0.2392157, 1, 1,
0.3283522, 0.2862468, 0.3577326, 0, 0.2313726, 1, 1,
0.3296244, 1.614119, -1.425707, 0, 0.227451, 1, 1,
0.3303282, 0.01332369, 2.187594, 0, 0.2196078, 1, 1,
0.3326854, 0.6268878, 1.365538, 0, 0.2156863, 1, 1,
0.3338946, -0.2921435, 2.895455, 0, 0.2078431, 1, 1,
0.3342529, 0.1176095, 2.030581, 0, 0.2039216, 1, 1,
0.3352781, 0.7051552, 1.236776, 0, 0.1960784, 1, 1,
0.3369641, 0.9219722, 1.954924, 0, 0.1882353, 1, 1,
0.3416517, 0.6909637, 1.867748, 0, 0.1843137, 1, 1,
0.3419771, 0.2561096, 1.02921, 0, 0.1764706, 1, 1,
0.3442978, 0.986285, 0.1135374, 0, 0.172549, 1, 1,
0.3457255, -0.5721757, 3.699333, 0, 0.1647059, 1, 1,
0.3490387, 1.162277, 0.4247089, 0, 0.1607843, 1, 1,
0.3511553, -1.680763, 2.164739, 0, 0.1529412, 1, 1,
0.3557704, 0.7263876, -0.9238907, 0, 0.1490196, 1, 1,
0.3591601, -0.8264607, 1.951257, 0, 0.1411765, 1, 1,
0.3608256, -0.4910483, 2.909539, 0, 0.1372549, 1, 1,
0.3611217, -0.8222071, 0.7254274, 0, 0.1294118, 1, 1,
0.3646164, -0.3493609, 3.845128, 0, 0.1254902, 1, 1,
0.3648199, 0.2872029, 1.299169, 0, 0.1176471, 1, 1,
0.3792127, -0.09952936, 2.177725, 0, 0.1137255, 1, 1,
0.3797762, 1.262363, -0.9710265, 0, 0.1058824, 1, 1,
0.381307, -0.5265974, 3.822592, 0, 0.09803922, 1, 1,
0.3835137, -1.374674, 3.738492, 0, 0.09411765, 1, 1,
0.3867798, -0.2243848, 1.358502, 0, 0.08627451, 1, 1,
0.3885842, 0.4478465, 1.660155, 0, 0.08235294, 1, 1,
0.3947796, 0.3044003, 1.225258, 0, 0.07450981, 1, 1,
0.3986291, 1.646453, 0.06890225, 0, 0.07058824, 1, 1,
0.3998724, 1.778984, -0.1839219, 0, 0.0627451, 1, 1,
0.4039754, -0.9450302, 3.396833, 0, 0.05882353, 1, 1,
0.4055082, -0.2481981, 0.7371565, 0, 0.05098039, 1, 1,
0.4077539, -0.1829281, 1.929612, 0, 0.04705882, 1, 1,
0.4112284, -0.5035779, 3.224011, 0, 0.03921569, 1, 1,
0.4120861, 1.0143, 1.17745, 0, 0.03529412, 1, 1,
0.4163626, 0.1351215, 1.145855, 0, 0.02745098, 1, 1,
0.4163766, -0.508881, 1.742052, 0, 0.02352941, 1, 1,
0.4165998, 0.000966523, 2.056727, 0, 0.01568628, 1, 1,
0.4215802, 1.112342, -2.041893, 0, 0.01176471, 1, 1,
0.4267376, -0.2107626, 1.715472, 0, 0.003921569, 1, 1,
0.429234, -0.9571174, 3.106244, 0.003921569, 0, 1, 1,
0.4336711, 0.9756826, 0.2818, 0.007843138, 0, 1, 1,
0.4344094, 0.1434022, 1.975945, 0.01568628, 0, 1, 1,
0.4347998, -0.8291357, 3.104998, 0.01960784, 0, 1, 1,
0.4355052, 0.4011423, -1.147029, 0.02745098, 0, 1, 1,
0.4395989, -1.388021, 1.946763, 0.03137255, 0, 1, 1,
0.441629, 1.912527, 0.7321698, 0.03921569, 0, 1, 1,
0.4436547, -1.092225, 1.271902, 0.04313726, 0, 1, 1,
0.45025, -1.993967, 2.0721, 0.05098039, 0, 1, 1,
0.453952, 1.025341, 1.111067, 0.05490196, 0, 1, 1,
0.457265, 0.2423314, 0.3494404, 0.0627451, 0, 1, 1,
0.4653101, -1.487693, 2.447255, 0.06666667, 0, 1, 1,
0.4658619, 0.1829848, 1.577708, 0.07450981, 0, 1, 1,
0.4665262, 0.8464112, -0.3228705, 0.07843138, 0, 1, 1,
0.4703137, -0.2085157, 2.457262, 0.08627451, 0, 1, 1,
0.4732533, -1.220549, 4.07711, 0.09019608, 0, 1, 1,
0.4748033, 0.9672629, 2.16658, 0.09803922, 0, 1, 1,
0.4765956, 0.3120429, 0.6358126, 0.1058824, 0, 1, 1,
0.4779895, 1.530953, -1.498044, 0.1098039, 0, 1, 1,
0.4814958, 1.14268, -1.677029, 0.1176471, 0, 1, 1,
0.4847777, 0.679417, 0.2811092, 0.1215686, 0, 1, 1,
0.4853333, 1.156378, 0.4783883, 0.1294118, 0, 1, 1,
0.4866707, -0.604088, 3.473706, 0.1333333, 0, 1, 1,
0.5016217, 0.4758134, 0.7074928, 0.1411765, 0, 1, 1,
0.502238, 1.014246, -0.9550371, 0.145098, 0, 1, 1,
0.5055423, -1.716097, 2.740525, 0.1529412, 0, 1, 1,
0.510788, -0.1996612, 2.556891, 0.1568628, 0, 1, 1,
0.5157608, -0.3268161, 1.21147, 0.1647059, 0, 1, 1,
0.5180845, -0.3506925, 3.709012, 0.1686275, 0, 1, 1,
0.5197412, 0.07631987, 2.029932, 0.1764706, 0, 1, 1,
0.5222082, -1.728129, 3.997312, 0.1803922, 0, 1, 1,
0.5235681, -0.18538, 2.75859, 0.1882353, 0, 1, 1,
0.5236565, 0.1001649, 1.962718, 0.1921569, 0, 1, 1,
0.5346955, -1.520336, 2.32359, 0.2, 0, 1, 1,
0.5354747, 0.4566906, 0.7903532, 0.2078431, 0, 1, 1,
0.5362357, 1.658835, -1.403102, 0.2117647, 0, 1, 1,
0.5364103, -2.027485, 1.976158, 0.2196078, 0, 1, 1,
0.5402386, -0.08864098, 2.092228, 0.2235294, 0, 1, 1,
0.5436989, -0.4889055, 1.654422, 0.2313726, 0, 1, 1,
0.5458705, -0.8429127, 3.775615, 0.2352941, 0, 1, 1,
0.5461796, 0.3736469, 2.201311, 0.2431373, 0, 1, 1,
0.5469923, 0.8411753, -0.3605936, 0.2470588, 0, 1, 1,
0.5556396, 0.09632803, 1.367805, 0.254902, 0, 1, 1,
0.5558001, -0.0315007, 2.426187, 0.2588235, 0, 1, 1,
0.5629199, 0.5422156, 0.8913337, 0.2666667, 0, 1, 1,
0.5664836, 2.797439, -1.15129, 0.2705882, 0, 1, 1,
0.5670149, 2.338505, -0.1775085, 0.2784314, 0, 1, 1,
0.5674108, -0.9369209, 0.9330405, 0.282353, 0, 1, 1,
0.5778363, 0.5686414, 0.3505924, 0.2901961, 0, 1, 1,
0.5782333, 1.371621, -0.7677687, 0.2941177, 0, 1, 1,
0.59404, -1.759595, 1.148577, 0.3019608, 0, 1, 1,
0.5940806, -1.540183, 2.31797, 0.3098039, 0, 1, 1,
0.5976638, 0.4685684, 0.238747, 0.3137255, 0, 1, 1,
0.5991986, 0.537411, 0.7789238, 0.3215686, 0, 1, 1,
0.5995548, -1.478933, 2.869028, 0.3254902, 0, 1, 1,
0.6105106, 1.357919, 0.4060009, 0.3333333, 0, 1, 1,
0.6118458, 0.3488204, 0.7491037, 0.3372549, 0, 1, 1,
0.6123309, 1.320504, 0.9339677, 0.345098, 0, 1, 1,
0.614428, 1.283664, -0.06621329, 0.3490196, 0, 1, 1,
0.6192884, 0.1574597, 1.197886, 0.3568628, 0, 1, 1,
0.6203975, -1.510289, 1.832353, 0.3607843, 0, 1, 1,
0.6234602, -0.6184406, 3.006477, 0.3686275, 0, 1, 1,
0.6275744, -0.4007934, 4.472577, 0.372549, 0, 1, 1,
0.6292723, -0.7241445, 2.552075, 0.3803922, 0, 1, 1,
0.6316722, 0.8794876, 0.2640957, 0.3843137, 0, 1, 1,
0.6372219, -2.775434, 2.340278, 0.3921569, 0, 1, 1,
0.6385272, -0.467005, 2.271428, 0.3960784, 0, 1, 1,
0.6404173, -0.1371132, 2.754512, 0.4039216, 0, 1, 1,
0.6412805, 0.6449735, 0.105671, 0.4117647, 0, 1, 1,
0.6468083, -0.3283785, 3.199003, 0.4156863, 0, 1, 1,
0.6476129, -0.6426839, 1.462449, 0.4235294, 0, 1, 1,
0.6528861, 0.9930994, 0.1777476, 0.427451, 0, 1, 1,
0.6576204, -0.6215487, 1.92126, 0.4352941, 0, 1, 1,
0.660503, 0.3302285, -1.096211, 0.4392157, 0, 1, 1,
0.6631609, 0.7127847, -0.2039668, 0.4470588, 0, 1, 1,
0.6637709, -1.136901, 3.2032, 0.4509804, 0, 1, 1,
0.6648746, -2.181164, 3.761973, 0.4588235, 0, 1, 1,
0.6662397, 1.773794, 0.1867161, 0.4627451, 0, 1, 1,
0.6704041, 1.337728, -0.1802934, 0.4705882, 0, 1, 1,
0.6793595, -0.2722181, 3.051804, 0.4745098, 0, 1, 1,
0.6816061, 0.2046155, 1.233755, 0.4823529, 0, 1, 1,
0.6821111, 1.876878, 0.100951, 0.4862745, 0, 1, 1,
0.6822091, -0.3491583, 1.054418, 0.4941176, 0, 1, 1,
0.6843808, -0.9871878, 2.19783, 0.5019608, 0, 1, 1,
0.6892066, -1.072551, 1.878901, 0.5058824, 0, 1, 1,
0.6942873, 0.05829996, 0.6219434, 0.5137255, 0, 1, 1,
0.7006657, -0.288636, 1.561293, 0.5176471, 0, 1, 1,
0.7028851, 1.68916, 1.374772, 0.5254902, 0, 1, 1,
0.7080901, 0.04407991, 0.8681987, 0.5294118, 0, 1, 1,
0.7092364, 1.590924, -0.9464397, 0.5372549, 0, 1, 1,
0.7107098, 1.516334, 0.09391662, 0.5411765, 0, 1, 1,
0.712576, 0.7638133, 2.75777, 0.5490196, 0, 1, 1,
0.7217488, -0.9425594, 1.644042, 0.5529412, 0, 1, 1,
0.7220134, -1.015803, 2.623644, 0.5607843, 0, 1, 1,
0.7361681, -0.4273211, 1.587523, 0.5647059, 0, 1, 1,
0.7408796, -0.3353819, 1.365123, 0.572549, 0, 1, 1,
0.7443185, 1.989058, -0.1375702, 0.5764706, 0, 1, 1,
0.7478577, 1.866735, -1.92235, 0.5843138, 0, 1, 1,
0.7576228, -0.009446077, 0.2917515, 0.5882353, 0, 1, 1,
0.7674902, 0.0062558, 1.251393, 0.5960785, 0, 1, 1,
0.7776138, 0.02024253, -0.5255167, 0.6039216, 0, 1, 1,
0.7783219, 0.3069161, 0.3131014, 0.6078432, 0, 1, 1,
0.7788042, -0.9746965, 2.775989, 0.6156863, 0, 1, 1,
0.779146, 1.640739, -1.273812, 0.6196079, 0, 1, 1,
0.7791703, 1.35775, 1.729262, 0.627451, 0, 1, 1,
0.7805673, 0.5390496, 0.6712149, 0.6313726, 0, 1, 1,
0.7807425, -1.659388, 1.641291, 0.6392157, 0, 1, 1,
0.7818855, -0.7462494, 1.225317, 0.6431373, 0, 1, 1,
0.7821927, 0.5005906, 2.931489, 0.6509804, 0, 1, 1,
0.7826914, 0.8400667, 1.184434, 0.654902, 0, 1, 1,
0.79831, 0.9049075, 0.4481544, 0.6627451, 0, 1, 1,
0.7996738, -1.947972, 1.381994, 0.6666667, 0, 1, 1,
0.8010622, 1.424343, 0.4788872, 0.6745098, 0, 1, 1,
0.8078598, 0.6082789, 1.477161, 0.6784314, 0, 1, 1,
0.8097322, -0.6473299, 1.778796, 0.6862745, 0, 1, 1,
0.8108889, -0.7366096, 1.732482, 0.6901961, 0, 1, 1,
0.8114113, -0.6318214, 2.837679, 0.6980392, 0, 1, 1,
0.8114975, -1.556062, 2.865267, 0.7058824, 0, 1, 1,
0.8175735, 1.51402, 0.356069, 0.7098039, 0, 1, 1,
0.8214552, 0.0420739, 1.709091, 0.7176471, 0, 1, 1,
0.8245136, 0.6152059, 0.7564212, 0.7215686, 0, 1, 1,
0.8309259, -0.1690628, 0.5215582, 0.7294118, 0, 1, 1,
0.8326144, 1.035481, 2.91177, 0.7333333, 0, 1, 1,
0.8335958, 0.2796134, 0.5108061, 0.7411765, 0, 1, 1,
0.8403693, -0.4682296, 2.220511, 0.7450981, 0, 1, 1,
0.8436244, 1.165918, -0.3531166, 0.7529412, 0, 1, 1,
0.8463639, -1.359218, 1.91999, 0.7568628, 0, 1, 1,
0.8545346, 1.345084, 1.171421, 0.7647059, 0, 1, 1,
0.8580216, -1.058325, 2.792314, 0.7686275, 0, 1, 1,
0.8594324, 0.06462588, 2.340028, 0.7764706, 0, 1, 1,
0.8713572, -0.08352488, 0.6219941, 0.7803922, 0, 1, 1,
0.8733891, -0.8283946, 2.490055, 0.7882353, 0, 1, 1,
0.8795761, 0.06716514, 2.472412, 0.7921569, 0, 1, 1,
0.8823001, -0.1276384, 2.804716, 0.8, 0, 1, 1,
0.882815, 0.9754423, 0.7660179, 0.8078431, 0, 1, 1,
0.888329, 0.5620877, -1.022197, 0.8117647, 0, 1, 1,
0.8909602, 2.201318, 0.2251204, 0.8196079, 0, 1, 1,
0.8971711, 1.147767, 0.4335172, 0.8235294, 0, 1, 1,
0.899294, 0.168934, -0.6215808, 0.8313726, 0, 1, 1,
0.900688, 1.514158, 1.805148, 0.8352941, 0, 1, 1,
0.9058725, 0.8712872, 0.722111, 0.8431373, 0, 1, 1,
0.9164198, 2.555637, -0.6864008, 0.8470588, 0, 1, 1,
0.9236867, 0.7696912, 1.712249, 0.854902, 0, 1, 1,
0.9248638, -2.030835, 2.242956, 0.8588235, 0, 1, 1,
0.9311463, 0.4244523, 0.9620941, 0.8666667, 0, 1, 1,
0.9362618, -0.4828002, 1.900997, 0.8705882, 0, 1, 1,
0.9421383, -0.1277616, 0.6181009, 0.8784314, 0, 1, 1,
0.9449579, 1.148037, -0.3625266, 0.8823529, 0, 1, 1,
0.9460317, -0.716423, 0.8878386, 0.8901961, 0, 1, 1,
0.9484313, 0.1188385, 1.610898, 0.8941177, 0, 1, 1,
0.9486538, 1.000592, 0.6436145, 0.9019608, 0, 1, 1,
0.9524463, 0.6734662, 0.03348001, 0.9098039, 0, 1, 1,
0.9567856, 0.1168552, 1.125202, 0.9137255, 0, 1, 1,
0.9581909, 0.5524938, 1.003102, 0.9215686, 0, 1, 1,
0.9632194, -1.056926, 2.546802, 0.9254902, 0, 1, 1,
0.9677016, 0.9034017, -0.8184025, 0.9333333, 0, 1, 1,
0.9703893, -0.5564671, 2.87379, 0.9372549, 0, 1, 1,
0.9708156, -2.645417, 2.67613, 0.945098, 0, 1, 1,
0.9773346, -0.2943573, -0.681376, 0.9490196, 0, 1, 1,
0.9866706, -1.572355, 2.78811, 0.9568627, 0, 1, 1,
0.9875067, -0.4073827, 1.748223, 0.9607843, 0, 1, 1,
0.9903668, -0.2675483, 1.205483, 0.9686275, 0, 1, 1,
0.9922518, 1.197848, 1.295538, 0.972549, 0, 1, 1,
0.9924684, 1.305667, 0.2065918, 0.9803922, 0, 1, 1,
0.9933988, 1.357874, -0.3066241, 0.9843137, 0, 1, 1,
1.00163, 0.2575133, 2.641559, 0.9921569, 0, 1, 1,
1.002293, 0.6918753, -2.210236, 0.9960784, 0, 1, 1,
1.004917, -0.7774429, 3.02685, 1, 0, 0.9960784, 1,
1.007835, -0.4231869, 1.727337, 1, 0, 0.9882353, 1,
1.009722, 1.44182, 0.004263532, 1, 0, 0.9843137, 1,
1.010161, -1.514442, 2.01019, 1, 0, 0.9764706, 1,
1.011084, -0.6303509, 1.460046, 1, 0, 0.972549, 1,
1.013536, -0.9253206, 1.95999, 1, 0, 0.9647059, 1,
1.017062, 0.2918404, 1.877406, 1, 0, 0.9607843, 1,
1.03912, 0.6302723, 0.03887896, 1, 0, 0.9529412, 1,
1.040342, 0.3571941, 1.204806, 1, 0, 0.9490196, 1,
1.050935, -0.8467777, 2.692091, 1, 0, 0.9411765, 1,
1.057665, -0.6262715, 1.234837, 1, 0, 0.9372549, 1,
1.060969, -1.117442, -0.1196684, 1, 0, 0.9294118, 1,
1.070448, -0.2659597, 3.894677, 1, 0, 0.9254902, 1,
1.074685, 0.3665202, -0.2489407, 1, 0, 0.9176471, 1,
1.08079, -1.02511, 3.654839, 1, 0, 0.9137255, 1,
1.085867, 1.393797, 0.6820095, 1, 0, 0.9058824, 1,
1.091247, -0.7999443, 2.485715, 1, 0, 0.9019608, 1,
1.092527, 0.1210464, 0.5185644, 1, 0, 0.8941177, 1,
1.094937, 0.6930962, 0.4707593, 1, 0, 0.8862745, 1,
1.095673, 0.4536837, 1.25059, 1, 0, 0.8823529, 1,
1.099316, -0.8978297, 2.421531, 1, 0, 0.8745098, 1,
1.099466, 0.1603748, 2.458373, 1, 0, 0.8705882, 1,
1.110893, -0.4108847, 1.080221, 1, 0, 0.8627451, 1,
1.116771, 1.55735, -0.8423811, 1, 0, 0.8588235, 1,
1.120438, -0.1052653, 1.357749, 1, 0, 0.8509804, 1,
1.12707, -1.215251, 1.133547, 1, 0, 0.8470588, 1,
1.127609, 0.5504504, 1.458342, 1, 0, 0.8392157, 1,
1.131908, -0.2772542, 1.186809, 1, 0, 0.8352941, 1,
1.134062, 0.3149764, 2.034214, 1, 0, 0.827451, 1,
1.135469, 0.02688421, 1.371191, 1, 0, 0.8235294, 1,
1.139365, 0.1069528, 2.187837, 1, 0, 0.8156863, 1,
1.140402, -1.410012, 3.043243, 1, 0, 0.8117647, 1,
1.142918, 0.7172502, 0.8235457, 1, 0, 0.8039216, 1,
1.153851, -0.3604017, 1.459916, 1, 0, 0.7960784, 1,
1.15515, 0.7159436, 1.295702, 1, 0, 0.7921569, 1,
1.155957, 1.21607, 1.155752, 1, 0, 0.7843137, 1,
1.159619, -0.508757, 3.01892, 1, 0, 0.7803922, 1,
1.167321, 0.3572177, 0.606061, 1, 0, 0.772549, 1,
1.176906, -0.1836068, 1.30285, 1, 0, 0.7686275, 1,
1.177696, -1.230388, 3.621973, 1, 0, 0.7607843, 1,
1.182152, -0.6641747, 2.175146, 1, 0, 0.7568628, 1,
1.185966, -0.3118005, 0.8790513, 1, 0, 0.7490196, 1,
1.190663, 0.7524812, -1.483994, 1, 0, 0.7450981, 1,
1.195851, 1.149241, 0.4076897, 1, 0, 0.7372549, 1,
1.199689, 1.795171, -1.963768, 1, 0, 0.7333333, 1,
1.205452, -1.472338, 2.870464, 1, 0, 0.7254902, 1,
1.206117, 0.8316566, 3.527337, 1, 0, 0.7215686, 1,
1.231996, 0.1583176, 1.028955, 1, 0, 0.7137255, 1,
1.237207, -0.6779342, 4.165072, 1, 0, 0.7098039, 1,
1.249261, -1.230405, 2.105304, 1, 0, 0.7019608, 1,
1.255093, 0.3625676, 1.68987, 1, 0, 0.6941177, 1,
1.257657, 0.9099494, -2.862873, 1, 0, 0.6901961, 1,
1.265268, -0.4603016, 2.624659, 1, 0, 0.682353, 1,
1.267052, 0.4794136, 1.848499, 1, 0, 0.6784314, 1,
1.271867, 1.078576, -1.401857, 1, 0, 0.6705883, 1,
1.272731, 1.632349, 2.544882, 1, 0, 0.6666667, 1,
1.282053, 1.233921, 1.093928, 1, 0, 0.6588235, 1,
1.286509, 0.2519112, 0.9349695, 1, 0, 0.654902, 1,
1.286983, -0.1972449, 1.165329, 1, 0, 0.6470588, 1,
1.290631, 0.8715101, 3.0453, 1, 0, 0.6431373, 1,
1.298126, -1.71709, 3.828856, 1, 0, 0.6352941, 1,
1.299347, 0.1533945, 3.188915, 1, 0, 0.6313726, 1,
1.305856, -1.745462, 2.274121, 1, 0, 0.6235294, 1,
1.309349, 0.4758112, 0.7128423, 1, 0, 0.6196079, 1,
1.312036, -1.562819, 2.120382, 1, 0, 0.6117647, 1,
1.331652, -1.471104, 2.064251, 1, 0, 0.6078432, 1,
1.331862, 1.266061, 1.407321, 1, 0, 0.6, 1,
1.333145, -0.9742571, 0.8579854, 1, 0, 0.5921569, 1,
1.338997, -0.9999514, 1.396939, 1, 0, 0.5882353, 1,
1.340709, 1.26901, -0.3646415, 1, 0, 0.5803922, 1,
1.342253, -0.06998999, 1.110126, 1, 0, 0.5764706, 1,
1.342386, 1.244314, 0.04329658, 1, 0, 0.5686275, 1,
1.343085, 0.6602211, 0.8147007, 1, 0, 0.5647059, 1,
1.34928, -0.2233983, 2.185841, 1, 0, 0.5568628, 1,
1.35451, -0.7304733, 1.182514, 1, 0, 0.5529412, 1,
1.358748, 0.6361895, 1.322874, 1, 0, 0.5450981, 1,
1.359481, -0.8661777, 2.860873, 1, 0, 0.5411765, 1,
1.36255, -0.005996976, 1.420779, 1, 0, 0.5333334, 1,
1.367521, 0.581768, 0.7525174, 1, 0, 0.5294118, 1,
1.371549, 0.1582269, 1.108123, 1, 0, 0.5215687, 1,
1.377963, 0.8102143, 0.4325557, 1, 0, 0.5176471, 1,
1.380931, 0.3875583, 2.421293, 1, 0, 0.509804, 1,
1.381763, 0.1991812, 3.579213, 1, 0, 0.5058824, 1,
1.385116, -0.6068583, 1.828804, 1, 0, 0.4980392, 1,
1.389729, -0.1678858, 1.195553, 1, 0, 0.4901961, 1,
1.391951, -0.7506121, 1.394064, 1, 0, 0.4862745, 1,
1.391976, -0.5760578, 2.085419, 1, 0, 0.4784314, 1,
1.399424, 0.2634469, 1.223114, 1, 0, 0.4745098, 1,
1.418397, -1.126636, 0.7756546, 1, 0, 0.4666667, 1,
1.45043, 1.042296, -0.2847457, 1, 0, 0.4627451, 1,
1.45517, -1.349328, 4.047664, 1, 0, 0.454902, 1,
1.464045, -0.8113565, 2.060467, 1, 0, 0.4509804, 1,
1.470452, -0.03739612, 3.472981, 1, 0, 0.4431373, 1,
1.474544, 1.192855, 2.691785, 1, 0, 0.4392157, 1,
1.483194, 0.9843171, 0.9546202, 1, 0, 0.4313726, 1,
1.495107, -0.05262774, 2.33386, 1, 0, 0.427451, 1,
1.509072, -0.1680878, 0.3584366, 1, 0, 0.4196078, 1,
1.512107, 0.3080727, 0.579696, 1, 0, 0.4156863, 1,
1.521711, 0.7177975, 1.547624, 1, 0, 0.4078431, 1,
1.536382, 0.1752056, 1.052464, 1, 0, 0.4039216, 1,
1.544142, 0.8234245, 0.2515547, 1, 0, 0.3960784, 1,
1.549828, -0.02764677, 1.23866, 1, 0, 0.3882353, 1,
1.552735, 2.136878, 0.1436134, 1, 0, 0.3843137, 1,
1.556702, 0.6553499, 0.4334271, 1, 0, 0.3764706, 1,
1.55699, -2.585646, 1.760376, 1, 0, 0.372549, 1,
1.571212, 2.152332, 0.3709491, 1, 0, 0.3647059, 1,
1.57309, 0.8078601, 1.716293, 1, 0, 0.3607843, 1,
1.577663, -0.1348143, 3.145892, 1, 0, 0.3529412, 1,
1.582843, 0.4757441, 0.3607154, 1, 0, 0.3490196, 1,
1.595083, -1.980607, 1.131292, 1, 0, 0.3411765, 1,
1.603739, -0.9925067, 4.571262, 1, 0, 0.3372549, 1,
1.604051, -0.9161498, 0.3370932, 1, 0, 0.3294118, 1,
1.604604, -0.6464017, 1.103038, 1, 0, 0.3254902, 1,
1.615707, 0.9013669, 0.7694807, 1, 0, 0.3176471, 1,
1.616649, 0.7481812, 0.2759531, 1, 0, 0.3137255, 1,
1.622167, 0.2277298, 1.349867, 1, 0, 0.3058824, 1,
1.638608, 0.5628914, 0.7408448, 1, 0, 0.2980392, 1,
1.643484, -0.8773513, 3.625182, 1, 0, 0.2941177, 1,
1.695674, -0.6048974, 2.898805, 1, 0, 0.2862745, 1,
1.714817, 1.333544, 0.3212786, 1, 0, 0.282353, 1,
1.729014, -0.2344296, 2.022889, 1, 0, 0.2745098, 1,
1.731287, -0.1437498, 1.394163, 1, 0, 0.2705882, 1,
1.733753, -0.6837647, 0.7716517, 1, 0, 0.2627451, 1,
1.749387, -0.6282988, 1.565132, 1, 0, 0.2588235, 1,
1.762803, -1.180897, 0.3201404, 1, 0, 0.2509804, 1,
1.765654, 1.108686, 0.9860515, 1, 0, 0.2470588, 1,
1.766621, -0.5785585, 1.847067, 1, 0, 0.2392157, 1,
1.780167, 1.302809, 0.8687992, 1, 0, 0.2352941, 1,
1.807394, -0.520041, 2.616188, 1, 0, 0.227451, 1,
1.816069, -0.7440006, 0.774606, 1, 0, 0.2235294, 1,
1.816712, 0.9272866, 1.485547, 1, 0, 0.2156863, 1,
1.818437, 1.382546, 1.756797, 1, 0, 0.2117647, 1,
1.82585, -0.2252692, 1.858915, 1, 0, 0.2039216, 1,
1.833591, 0.5565353, 1.89069, 1, 0, 0.1960784, 1,
1.843271, 0.7404401, 1.497872, 1, 0, 0.1921569, 1,
1.869004, 0.84736, 0.4668616, 1, 0, 0.1843137, 1,
1.87003, 0.972374, -0.0601203, 1, 0, 0.1803922, 1,
1.882415, 0.1645458, 2.379024, 1, 0, 0.172549, 1,
1.908348, -0.4019726, 1.56957, 1, 0, 0.1686275, 1,
1.909199, 0.6158469, 0.6205087, 1, 0, 0.1607843, 1,
1.949904, -1.08678, 0.8437081, 1, 0, 0.1568628, 1,
1.955291, 0.8946924, 1.475144, 1, 0, 0.1490196, 1,
1.962291, 0.5537709, 0.736101, 1, 0, 0.145098, 1,
1.966965, 0.1944582, 1.53096, 1, 0, 0.1372549, 1,
1.977039, -0.8763014, 2.327939, 1, 0, 0.1333333, 1,
1.982637, 0.2950991, 1.224412, 1, 0, 0.1254902, 1,
2.081889, -1.354305, 3.461137, 1, 0, 0.1215686, 1,
2.108349, -0.7315784, 2.495154, 1, 0, 0.1137255, 1,
2.110862, -0.08975137, 2.095078, 1, 0, 0.1098039, 1,
2.120452, 0.3653848, 1.611499, 1, 0, 0.1019608, 1,
2.172557, -3.786086, 3.486895, 1, 0, 0.09411765, 1,
2.233392, 0.507928, 2.255779, 1, 0, 0.09019608, 1,
2.256823, -2.585671, 2.914884, 1, 0, 0.08235294, 1,
2.276168, -1.105094, 2.31785, 1, 0, 0.07843138, 1,
2.294779, -0.9443411, 2.599245, 1, 0, 0.07058824, 1,
2.374915, 1.262531, -0.2546357, 1, 0, 0.06666667, 1,
2.387608, -0.009818869, 0.2293301, 1, 0, 0.05882353, 1,
2.410362, -0.1284994, 1.170813, 1, 0, 0.05490196, 1,
2.418952, 1.163022, 1.175168, 1, 0, 0.04705882, 1,
2.489068, 2.412908, 0.7728156, 1, 0, 0.04313726, 1,
2.503402, -0.9055047, 2.842007, 1, 0, 0.03529412, 1,
2.542856, 0.8532271, 2.208, 1, 0, 0.03137255, 1,
2.71882, -1.161869, 0.4282176, 1, 0, 0.02352941, 1,
2.721169, 1.652059, 0.5177029, 1, 0, 0.01960784, 1,
2.740535, 1.814278, 2.946435, 1, 0, 0.01176471, 1,
3.406167, -0.7755461, 1.146472, 1, 0, 0.007843138, 1
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
0.3572607, -4.977745, -8.324664, 0, -0.5, 0.5, 0.5,
0.3572607, -4.977745, -8.324664, 1, -0.5, 0.5, 0.5,
0.3572607, -4.977745, -8.324664, 1, 1.5, 0.5, 0.5,
0.3572607, -4.977745, -8.324664, 0, 1.5, 0.5, 0.5
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
-3.725224, -0.2708694, -8.324664, 0, -0.5, 0.5, 0.5,
-3.725224, -0.2708694, -8.324664, 1, -0.5, 0.5, 0.5,
-3.725224, -0.2708694, -8.324664, 1, 1.5, 0.5, 0.5,
-3.725224, -0.2708694, -8.324664, 0, 1.5, 0.5, 0.5
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
-3.725224, -4.977745, -0.6082878, 0, -0.5, 0.5, 0.5,
-3.725224, -4.977745, -0.6082878, 1, -0.5, 0.5, 0.5,
-3.725224, -4.977745, -0.6082878, 1, 1.5, 0.5, 0.5,
-3.725224, -4.977745, -0.6082878, 0, 1.5, 0.5, 0.5
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
-2, -3.891543, -6.543962,
3, -3.891543, -6.543962,
-2, -3.891543, -6.543962,
-2, -4.072577, -6.840745,
-1, -3.891543, -6.543962,
-1, -4.072577, -6.840745,
0, -3.891543, -6.543962,
0, -4.072577, -6.840745,
1, -3.891543, -6.543962,
1, -4.072577, -6.840745,
2, -3.891543, -6.543962,
2, -4.072577, -6.840745,
3, -3.891543, -6.543962,
3, -4.072577, -6.840745
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
-2, -4.434644, -7.434313, 0, -0.5, 0.5, 0.5,
-2, -4.434644, -7.434313, 1, -0.5, 0.5, 0.5,
-2, -4.434644, -7.434313, 1, 1.5, 0.5, 0.5,
-2, -4.434644, -7.434313, 0, 1.5, 0.5, 0.5,
-1, -4.434644, -7.434313, 0, -0.5, 0.5, 0.5,
-1, -4.434644, -7.434313, 1, -0.5, 0.5, 0.5,
-1, -4.434644, -7.434313, 1, 1.5, 0.5, 0.5,
-1, -4.434644, -7.434313, 0, 1.5, 0.5, 0.5,
0, -4.434644, -7.434313, 0, -0.5, 0.5, 0.5,
0, -4.434644, -7.434313, 1, -0.5, 0.5, 0.5,
0, -4.434644, -7.434313, 1, 1.5, 0.5, 0.5,
0, -4.434644, -7.434313, 0, 1.5, 0.5, 0.5,
1, -4.434644, -7.434313, 0, -0.5, 0.5, 0.5,
1, -4.434644, -7.434313, 1, -0.5, 0.5, 0.5,
1, -4.434644, -7.434313, 1, 1.5, 0.5, 0.5,
1, -4.434644, -7.434313, 0, 1.5, 0.5, 0.5,
2, -4.434644, -7.434313, 0, -0.5, 0.5, 0.5,
2, -4.434644, -7.434313, 1, -0.5, 0.5, 0.5,
2, -4.434644, -7.434313, 1, 1.5, 0.5, 0.5,
2, -4.434644, -7.434313, 0, 1.5, 0.5, 0.5,
3, -4.434644, -7.434313, 0, -0.5, 0.5, 0.5,
3, -4.434644, -7.434313, 1, -0.5, 0.5, 0.5,
3, -4.434644, -7.434313, 1, 1.5, 0.5, 0.5,
3, -4.434644, -7.434313, 0, 1.5, 0.5, 0.5
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
-2.783112, -2, -6.543962,
-2.783112, 2, -6.543962,
-2.783112, -2, -6.543962,
-2.940131, -2, -6.840745,
-2.783112, 0, -6.543962,
-2.940131, 0, -6.840745,
-2.783112, 2, -6.543962,
-2.940131, 2, -6.840745
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
-3.254168, -2, -7.434313, 0, -0.5, 0.5, 0.5,
-3.254168, -2, -7.434313, 1, -0.5, 0.5, 0.5,
-3.254168, -2, -7.434313, 1, 1.5, 0.5, 0.5,
-3.254168, -2, -7.434313, 0, 1.5, 0.5, 0.5,
-3.254168, 0, -7.434313, 0, -0.5, 0.5, 0.5,
-3.254168, 0, -7.434313, 1, -0.5, 0.5, 0.5,
-3.254168, 0, -7.434313, 1, 1.5, 0.5, 0.5,
-3.254168, 0, -7.434313, 0, 1.5, 0.5, 0.5,
-3.254168, 2, -7.434313, 0, -0.5, 0.5, 0.5,
-3.254168, 2, -7.434313, 1, -0.5, 0.5, 0.5,
-3.254168, 2, -7.434313, 1, 1.5, 0.5, 0.5,
-3.254168, 2, -7.434313, 0, 1.5, 0.5, 0.5
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
-2.783112, -3.891543, -6,
-2.783112, -3.891543, 4,
-2.783112, -3.891543, -6,
-2.940131, -4.072577, -6,
-2.783112, -3.891543, -4,
-2.940131, -4.072577, -4,
-2.783112, -3.891543, -2,
-2.940131, -4.072577, -2,
-2.783112, -3.891543, 0,
-2.940131, -4.072577, 0,
-2.783112, -3.891543, 2,
-2.940131, -4.072577, 2,
-2.783112, -3.891543, 4,
-2.940131, -4.072577, 4
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
"-6",
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
-3.254168, -4.434644, -6, 0, -0.5, 0.5, 0.5,
-3.254168, -4.434644, -6, 1, -0.5, 0.5, 0.5,
-3.254168, -4.434644, -6, 1, 1.5, 0.5, 0.5,
-3.254168, -4.434644, -6, 0, 1.5, 0.5, 0.5,
-3.254168, -4.434644, -4, 0, -0.5, 0.5, 0.5,
-3.254168, -4.434644, -4, 1, -0.5, 0.5, 0.5,
-3.254168, -4.434644, -4, 1, 1.5, 0.5, 0.5,
-3.254168, -4.434644, -4, 0, 1.5, 0.5, 0.5,
-3.254168, -4.434644, -2, 0, -0.5, 0.5, 0.5,
-3.254168, -4.434644, -2, 1, -0.5, 0.5, 0.5,
-3.254168, -4.434644, -2, 1, 1.5, 0.5, 0.5,
-3.254168, -4.434644, -2, 0, 1.5, 0.5, 0.5,
-3.254168, -4.434644, 0, 0, -0.5, 0.5, 0.5,
-3.254168, -4.434644, 0, 1, -0.5, 0.5, 0.5,
-3.254168, -4.434644, 0, 1, 1.5, 0.5, 0.5,
-3.254168, -4.434644, 0, 0, 1.5, 0.5, 0.5,
-3.254168, -4.434644, 2, 0, -0.5, 0.5, 0.5,
-3.254168, -4.434644, 2, 1, -0.5, 0.5, 0.5,
-3.254168, -4.434644, 2, 1, 1.5, 0.5, 0.5,
-3.254168, -4.434644, 2, 0, 1.5, 0.5, 0.5,
-3.254168, -4.434644, 4, 0, -0.5, 0.5, 0.5,
-3.254168, -4.434644, 4, 1, -0.5, 0.5, 0.5,
-3.254168, -4.434644, 4, 1, 1.5, 0.5, 0.5,
-3.254168, -4.434644, 4, 0, 1.5, 0.5, 0.5
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
-2.783112, -3.891543, -6.543962,
-2.783112, 3.349804, -6.543962,
-2.783112, -3.891543, 5.327386,
-2.783112, 3.349804, 5.327386,
-2.783112, -3.891543, -6.543962,
-2.783112, -3.891543, 5.327386,
-2.783112, 3.349804, -6.543962,
-2.783112, 3.349804, 5.327386,
-2.783112, -3.891543, -6.543962,
3.497634, -3.891543, -6.543962,
-2.783112, -3.891543, 5.327386,
3.497634, -3.891543, 5.327386,
-2.783112, 3.349804, -6.543962,
3.497634, 3.349804, -6.543962,
-2.783112, 3.349804, 5.327386,
3.497634, 3.349804, 5.327386,
3.497634, -3.891543, -6.543962,
3.497634, 3.349804, -6.543962,
3.497634, -3.891543, 5.327386,
3.497634, 3.349804, 5.327386,
3.497634, -3.891543, -6.543962,
3.497634, -3.891543, 5.327386,
3.497634, 3.349804, -6.543962,
3.497634, 3.349804, 5.327386
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
var radius = 8.147602;
var distance = 36.2496;
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
mvMatrix.translate( -0.3572607, 0.2708694, 0.6082878 );
mvMatrix.scale( 1.402596, 1.216534, 0.7420679 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.2496);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Gibberellins<-read.table("Gibberellins.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Gibberellins$V2
```

```
## Error in eval(expr, envir, enclos): object 'Gibberellins' not found
```

```r
y<-Gibberellins$V3
```

```
## Error in eval(expr, envir, enclos): object 'Gibberellins' not found
```

```r
z<-Gibberellins$V4
```

```
## Error in eval(expr, envir, enclos): object 'Gibberellins' not found
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
-2.691645, -1.527817, -1.288338, 0, 0, 1, 1, 1,
-2.532281, -1.412948, -3.566515, 1, 0, 0, 1, 1,
-2.476769, 0.4169329, -1.733718, 1, 0, 0, 1, 1,
-2.458875, -0.05017781, -0.9326949, 1, 0, 0, 1, 1,
-2.442004, 0.3422288, -0.3134265, 1, 0, 0, 1, 1,
-2.426096, 2.022683, -0.869859, 1, 0, 0, 1, 1,
-2.370781, -0.4728767, -1.149547, 0, 0, 0, 1, 1,
-2.334854, -1.317731, -1.328935, 0, 0, 0, 1, 1,
-2.326802, -1.48376, -1.99816, 0, 0, 0, 1, 1,
-2.313696, -2.617983, -2.145943, 0, 0, 0, 1, 1,
-2.279338, 1.139161, -2.087258, 0, 0, 0, 1, 1,
-2.266991, -0.3145175, -2.710413, 0, 0, 0, 1, 1,
-2.197881, -0.2450505, -1.303958, 0, 0, 0, 1, 1,
-2.152695, 0.2152452, -1.742598, 1, 1, 1, 1, 1,
-2.126702, 0.6514318, 0.06385586, 1, 1, 1, 1, 1,
-2.114049, 0.02169422, -1.387659, 1, 1, 1, 1, 1,
-2.10723, 1.294904, -0.561924, 1, 1, 1, 1, 1,
-2.106093, -0.6581762, -1.840716, 1, 1, 1, 1, 1,
-2.079217, 0.05799462, -1.23997, 1, 1, 1, 1, 1,
-2.077697, -0.5234021, -2.024798, 1, 1, 1, 1, 1,
-2.076295, 0.2678177, -2.602111, 1, 1, 1, 1, 1,
-2.053611, -0.247372, -1.334268, 1, 1, 1, 1, 1,
-2.040461, 1.111177, 0.06011563, 1, 1, 1, 1, 1,
-1.983391, 0.07456135, -1.443156, 1, 1, 1, 1, 1,
-1.980707, -0.1175953, -2.463248, 1, 1, 1, 1, 1,
-1.954519, -0.5507736, -1.223755, 1, 1, 1, 1, 1,
-1.950917, 0.3623675, -2.565095, 1, 1, 1, 1, 1,
-1.932994, 0.08856698, -2.337101, 1, 1, 1, 1, 1,
-1.918369, -0.4923013, -3.232261, 0, 0, 1, 1, 1,
-1.890883, 0.7834991, -0.8217939, 1, 0, 0, 1, 1,
-1.866309, 0.9547109, -0.2879038, 1, 0, 0, 1, 1,
-1.864048, -0.0069228, -1.669862, 1, 0, 0, 1, 1,
-1.858505, -0.6858949, -2.246518, 1, 0, 0, 1, 1,
-1.832078, 1.625239, -0.7538238, 1, 0, 0, 1, 1,
-1.827477, 0.1364875, -1.444494, 0, 0, 0, 1, 1,
-1.819039, 0.6814402, -0.9098917, 0, 0, 0, 1, 1,
-1.809047, 0.6438763, -1.744405, 0, 0, 0, 1, 1,
-1.806799, 1.357273, -1.48483, 0, 0, 0, 1, 1,
-1.801343, -0.1217564, -2.845445, 0, 0, 0, 1, 1,
-1.783975, 1.259987, -0.1215829, 0, 0, 0, 1, 1,
-1.782497, -0.1746337, -2.482879, 0, 0, 0, 1, 1,
-1.781408, -1.726979, -1.803254, 1, 1, 1, 1, 1,
-1.77731, 1.62842, -1.000335, 1, 1, 1, 1, 1,
-1.773386, 0.6165124, -0.9371344, 1, 1, 1, 1, 1,
-1.769953, 1.41325, 1.042883, 1, 1, 1, 1, 1,
-1.761837, -0.8869306, -0.9992868, 1, 1, 1, 1, 1,
-1.753864, 1.435349, 0.7646011, 1, 1, 1, 1, 1,
-1.751954, 0.1255924, -1.085252, 1, 1, 1, 1, 1,
-1.718562, -1.501325, -2.497115, 1, 1, 1, 1, 1,
-1.714103, 1.518598, 0.0717959, 1, 1, 1, 1, 1,
-1.708276, -0.3546773, -0.7281831, 1, 1, 1, 1, 1,
-1.689024, 0.9992263, -1.641139, 1, 1, 1, 1, 1,
-1.666344, -1.553513, -3.041207, 1, 1, 1, 1, 1,
-1.658909, 1.449016, -2.870923, 1, 1, 1, 1, 1,
-1.65789, -0.2447288, -2.023535, 1, 1, 1, 1, 1,
-1.638708, -0.6948735, -0.8509043, 1, 1, 1, 1, 1,
-1.626046, -0.2968343, -3.166975, 0, 0, 1, 1, 1,
-1.618269, 0.3566477, -1.454273, 1, 0, 0, 1, 1,
-1.611635, 2.540461, -0.1362291, 1, 0, 0, 1, 1,
-1.608667, 0.9140452, -2.626342, 1, 0, 0, 1, 1,
-1.585699, 0.0782658, -1.176364, 1, 0, 0, 1, 1,
-1.576489, 0.3536488, -0.8867387, 1, 0, 0, 1, 1,
-1.55283, -1.841972, -0.5813915, 0, 0, 0, 1, 1,
-1.546647, 0.3714829, -2.136371, 0, 0, 0, 1, 1,
-1.538966, -2.145769, -2.751135, 0, 0, 0, 1, 1,
-1.53864, -0.5366021, -2.542315, 0, 0, 0, 1, 1,
-1.538584, 2.380997, -0.4954187, 0, 0, 0, 1, 1,
-1.538214, 0.771646, 0.3535502, 0, 0, 0, 1, 1,
-1.529603, -0.02289391, -2.314658, 0, 0, 0, 1, 1,
-1.52729, -2.279916, -4.945961, 1, 1, 1, 1, 1,
-1.497974, -0.2938989, -1.215626, 1, 1, 1, 1, 1,
-1.488829, 0.6917689, -2.118297, 1, 1, 1, 1, 1,
-1.487952, -0.6255028, -3.542743, 1, 1, 1, 1, 1,
-1.483586, -1.174338, -2.091037, 1, 1, 1, 1, 1,
-1.474518, -0.4967012, -1.99204, 1, 1, 1, 1, 1,
-1.473493, -0.1189948, -1.779272, 1, 1, 1, 1, 1,
-1.461848, 0.2842579, -3.046224, 1, 1, 1, 1, 1,
-1.460823, -0.3719691, -1.786043, 1, 1, 1, 1, 1,
-1.440507, 0.1696348, -1.029783, 1, 1, 1, 1, 1,
-1.417299, -1.289155, -2.762242, 1, 1, 1, 1, 1,
-1.41624, -1.139788, -1.982368, 1, 1, 1, 1, 1,
-1.411188, -1.173798, -1.632804, 1, 1, 1, 1, 1,
-1.40931, -0.5850431, -1.640771, 1, 1, 1, 1, 1,
-1.407463, -0.9956509, -2.370094, 1, 1, 1, 1, 1,
-1.385481, 0.04717271, -0.001233867, 0, 0, 1, 1, 1,
-1.379851, 1.398105, 0.07526316, 1, 0, 0, 1, 1,
-1.367218, 0.2786165, -1.81134, 1, 0, 0, 1, 1,
-1.364311, -1.174755, -0.6270294, 1, 0, 0, 1, 1,
-1.363737, 1.874683, -1.370033, 1, 0, 0, 1, 1,
-1.361375, 0.3276909, -2.185123, 1, 0, 0, 1, 1,
-1.360891, 1.032566, 0.786545, 0, 0, 0, 1, 1,
-1.35055, -1.131833, -3.287585, 0, 0, 0, 1, 1,
-1.350142, 1.196236, -1.851346, 0, 0, 0, 1, 1,
-1.34342, 0.4347882, -3.891749, 0, 0, 0, 1, 1,
-1.337657, 0.3029157, -1.523442, 0, 0, 0, 1, 1,
-1.33545, 0.8181343, -0.3965977, 0, 0, 0, 1, 1,
-1.33252, 1.020783, -0.6694735, 0, 0, 0, 1, 1,
-1.330373, -0.03475652, -1.140512, 1, 1, 1, 1, 1,
-1.328151, -1.334055, -3.251423, 1, 1, 1, 1, 1,
-1.323101, -0.7393635, -0.526275, 1, 1, 1, 1, 1,
-1.317623, 1.709846, -1.557494, 1, 1, 1, 1, 1,
-1.300829, -2.510079, -3.798476, 1, 1, 1, 1, 1,
-1.300287, -1.193385, -3.282812, 1, 1, 1, 1, 1,
-1.298334, 1.597869, -1.95007, 1, 1, 1, 1, 1,
-1.294099, 0.5480537, -1.637537, 1, 1, 1, 1, 1,
-1.292063, -0.9170426, -0.6975766, 1, 1, 1, 1, 1,
-1.288114, 1.130878, -1.411788, 1, 1, 1, 1, 1,
-1.286413, 0.4590588, -2.548024, 1, 1, 1, 1, 1,
-1.27325, 1.651417, -1.763658, 1, 1, 1, 1, 1,
-1.269065, 0.5298106, -1.552522, 1, 1, 1, 1, 1,
-1.261891, -0.8932531, -3.116563, 1, 1, 1, 1, 1,
-1.256932, 0.4553694, -2.332092, 1, 1, 1, 1, 1,
-1.252831, -1.618175, -3.216405, 0, 0, 1, 1, 1,
-1.251549, -0.25061, -0.886818, 1, 0, 0, 1, 1,
-1.25095, 1.863333, -0.8301602, 1, 0, 0, 1, 1,
-1.239208, 1.142402, 0.6667021, 1, 0, 0, 1, 1,
-1.236824, -0.7489854, -0.9283198, 1, 0, 0, 1, 1,
-1.230733, -0.4813582, -2.849171, 1, 0, 0, 1, 1,
-1.221272, 0.9171937, 0.2024223, 0, 0, 0, 1, 1,
-1.218739, 1.094478, 0.1721161, 0, 0, 0, 1, 1,
-1.21268, -0.2916109, -1.894115, 0, 0, 0, 1, 1,
-1.204132, 0.4395294, 0.1410824, 0, 0, 0, 1, 1,
-1.201801, 0.1276666, 0.8126044, 0, 0, 0, 1, 1,
-1.199105, -1.240137, -1.180534, 0, 0, 0, 1, 1,
-1.192395, -0.4259728, -1.369691, 0, 0, 0, 1, 1,
-1.191092, -1.553891, -2.11782, 1, 1, 1, 1, 1,
-1.189255, 0.3403449, -0.1628601, 1, 1, 1, 1, 1,
-1.170596, -0.4144202, -2.724289, 1, 1, 1, 1, 1,
-1.169177, -1.619846, -2.745956, 1, 1, 1, 1, 1,
-1.16572, -0.3741575, -2.191029, 1, 1, 1, 1, 1,
-1.163952, -0.1946294, -1.363896, 1, 1, 1, 1, 1,
-1.162372, -1.97764, -3.743847, 1, 1, 1, 1, 1,
-1.161463, 0.01914937, -1.021244, 1, 1, 1, 1, 1,
-1.159313, -0.1185464, -0.8169035, 1, 1, 1, 1, 1,
-1.158741, -1.346603, -3.961714, 1, 1, 1, 1, 1,
-1.158274, 0.7841936, -1.534538, 1, 1, 1, 1, 1,
-1.156622, -1.570138, -3.053976, 1, 1, 1, 1, 1,
-1.151217, -1.592643, -2.963606, 1, 1, 1, 1, 1,
-1.14658, -0.6518464, -3.361705, 1, 1, 1, 1, 1,
-1.137696, 1.462944, -1.58733, 1, 1, 1, 1, 1,
-1.134507, -0.1971448, -3.946093, 0, 0, 1, 1, 1,
-1.122113, 0.1974414, -2.096767, 1, 0, 0, 1, 1,
-1.121168, 1.721023, -1.450782, 1, 0, 0, 1, 1,
-1.11932, -0.0385622, -0.1389207, 1, 0, 0, 1, 1,
-1.113069, -0.3643786, -1.031426, 1, 0, 0, 1, 1,
-1.107207, -1.813709, -2.200879, 1, 0, 0, 1, 1,
-1.096541, 0.6228581, -0.8013829, 0, 0, 0, 1, 1,
-1.090457, 0.317194, -1.969415, 0, 0, 0, 1, 1,
-1.089851, 1.305136, -0.2845301, 0, 0, 0, 1, 1,
-1.079892, 0.7877177, -0.5245497, 0, 0, 0, 1, 1,
-1.071277, -1.137528, -2.145197, 0, 0, 0, 1, 1,
-1.060179, 0.01829122, -2.576507, 0, 0, 0, 1, 1,
-1.059427, -0.9811698, -2.758552, 0, 0, 0, 1, 1,
-1.057068, -0.1236425, -2.009714, 1, 1, 1, 1, 1,
-1.05352, -0.4401094, -1.152561, 1, 1, 1, 1, 1,
-1.050578, -0.5209805, -2.123077, 1, 1, 1, 1, 1,
-1.031467, -0.5479146, -2.397789, 1, 1, 1, 1, 1,
-1.027498, 0.01209253, -0.9631479, 1, 1, 1, 1, 1,
-1.025968, -0.1317212, -2.102008, 1, 1, 1, 1, 1,
-1.02474, -0.2890511, -2.406356, 1, 1, 1, 1, 1,
-1.022396, 0.05703146, -1.960628, 1, 1, 1, 1, 1,
-1.017934, 0.4234376, -0.4745217, 1, 1, 1, 1, 1,
-1.01293, 1.102786, -1.533342, 1, 1, 1, 1, 1,
-1.007657, -1.192009, -2.784223, 1, 1, 1, 1, 1,
-1.002293, -0.3877636, -1.029573, 1, 1, 1, 1, 1,
-1.001564, -0.743852, -4.051208, 1, 1, 1, 1, 1,
-0.9994909, -0.6803945, -1.497192, 1, 1, 1, 1, 1,
-0.9953561, -1.00347, -1.112695, 1, 1, 1, 1, 1,
-0.9865069, -0.3671401, -2.069413, 0, 0, 1, 1, 1,
-0.9849135, -2.017684, -2.390879, 1, 0, 0, 1, 1,
-0.9842653, 0.1958694, -1.98473, 1, 0, 0, 1, 1,
-0.9799669, -0.3337507, -1.183345, 1, 0, 0, 1, 1,
-0.9772549, 0.5744017, -1.595738, 1, 0, 0, 1, 1,
-0.9731369, -0.7215106, -1.447389, 1, 0, 0, 1, 1,
-0.9721547, 0.6333335, -0.4556068, 0, 0, 0, 1, 1,
-0.9704611, 0.3203196, -3.199163, 0, 0, 0, 1, 1,
-0.9703315, -1.192368, -2.852266, 0, 0, 0, 1, 1,
-0.9631888, -0.3279893, -1.19434, 0, 0, 0, 1, 1,
-0.9561048, 0.02107953, -1.977216, 0, 0, 0, 1, 1,
-0.9545709, -0.5588156, -1.680894, 0, 0, 0, 1, 1,
-0.9535106, 0.3736867, -1.654681, 0, 0, 0, 1, 1,
-0.953298, -0.03962913, -1.19655, 1, 1, 1, 1, 1,
-0.9501055, 1.430029, -0.2079521, 1, 1, 1, 1, 1,
-0.9485065, -0.7283261, -2.262803, 1, 1, 1, 1, 1,
-0.9352733, -0.2938473, -1.879666, 1, 1, 1, 1, 1,
-0.9329448, 0.1879967, -2.206605, 1, 1, 1, 1, 1,
-0.9316168, 0.8819424, -0.08685565, 1, 1, 1, 1, 1,
-0.9260874, -0.7384771, -4.551451, 1, 1, 1, 1, 1,
-0.9257318, -1.030185, -2.673672, 1, 1, 1, 1, 1,
-0.9233294, 2.046521, 1.731747, 1, 1, 1, 1, 1,
-0.9205059, -0.3523704, -3.119582, 1, 1, 1, 1, 1,
-0.9161966, -0.2567181, -2.728412, 1, 1, 1, 1, 1,
-0.9159506, 0.8901411, -0.1948623, 1, 1, 1, 1, 1,
-0.9149985, -0.2537528, -2.316557, 1, 1, 1, 1, 1,
-0.914533, 0.3272406, 0.5545706, 1, 1, 1, 1, 1,
-0.9106979, -1.726277, -3.951108, 1, 1, 1, 1, 1,
-0.9009576, 0.7985499, -0.4928169, 0, 0, 1, 1, 1,
-0.8926011, 0.9455625, 0.1946788, 1, 0, 0, 1, 1,
-0.8923431, 0.3708225, -0.1886712, 1, 0, 0, 1, 1,
-0.8837937, -0.4383474, -4.431306, 1, 0, 0, 1, 1,
-0.8785315, 0.3371793, 0.1482553, 1, 0, 0, 1, 1,
-0.8713973, 0.004249823, -3.353152, 1, 0, 0, 1, 1,
-0.8692759, -0.9191759, -2.366943, 0, 0, 0, 1, 1,
-0.869111, -0.4130393, 0.2409273, 0, 0, 0, 1, 1,
-0.86487, -0.724488, -2.052002, 0, 0, 0, 1, 1,
-0.8609422, 2.66353, -0.9015353, 0, 0, 0, 1, 1,
-0.8586007, 0.7154051, -0.6154082, 0, 0, 0, 1, 1,
-0.8550208, -1.83496, -5.016063, 0, 0, 0, 1, 1,
-0.852076, 1.228468, -1.258891, 0, 0, 0, 1, 1,
-0.8454892, -0.5172514, -1.868847, 1, 1, 1, 1, 1,
-0.8315501, -0.5031754, -3.165191, 1, 1, 1, 1, 1,
-0.8308777, -0.4660356, -2.550419, 1, 1, 1, 1, 1,
-0.8286508, -1.062938, -3.222623, 1, 1, 1, 1, 1,
-0.8249329, -1.020063, -1.132226, 1, 1, 1, 1, 1,
-0.8216538, -1.428462, -1.472671, 1, 1, 1, 1, 1,
-0.8216349, -0.9094711, -2.041506, 1, 1, 1, 1, 1,
-0.8206911, -0.4898176, -1.886387, 1, 1, 1, 1, 1,
-0.8118467, 2.362226, 0.7401219, 1, 1, 1, 1, 1,
-0.8112703, 1.657005, -1.165439, 1, 1, 1, 1, 1,
-0.8107225, 3.244348, -0.1290944, 1, 1, 1, 1, 1,
-0.8106253, -0.0410525, -1.175267, 1, 1, 1, 1, 1,
-0.8087564, -1.428209, -2.481704, 1, 1, 1, 1, 1,
-0.8074524, -0.1626998, -3.428379, 1, 1, 1, 1, 1,
-0.8049232, -0.2201947, -3.251685, 1, 1, 1, 1, 1,
-0.8047401, 1.193907, -1.096083, 0, 0, 1, 1, 1,
-0.8047323, 0.7556498, -1.434419, 1, 0, 0, 1, 1,
-0.8039933, -0.877978, -3.021614, 1, 0, 0, 1, 1,
-0.7975403, -0.3748723, -0.9062504, 1, 0, 0, 1, 1,
-0.7975229, -0.0221083, -3.504617, 1, 0, 0, 1, 1,
-0.7914045, 0.9639934, -0.4852839, 1, 0, 0, 1, 1,
-0.7898985, -2.828515, -1.382118, 0, 0, 0, 1, 1,
-0.7889229, 0.5764687, -0.1165636, 0, 0, 0, 1, 1,
-0.78773, 0.7703694, -0.7307615, 0, 0, 0, 1, 1,
-0.7831763, 0.3155314, -1.178117, 0, 0, 0, 1, 1,
-0.7824152, 0.153888, -1.838498, 0, 0, 0, 1, 1,
-0.7774376, 0.2725946, -2.951777, 0, 0, 0, 1, 1,
-0.7745261, 0.6540011, -1.167646, 0, 0, 0, 1, 1,
-0.754679, 1.017206, -1.194336, 1, 1, 1, 1, 1,
-0.753876, -0.7152988, -1.306566, 1, 1, 1, 1, 1,
-0.7531751, 0.2936887, -0.7451679, 1, 1, 1, 1, 1,
-0.7509118, 0.08758421, 0.6241331, 1, 1, 1, 1, 1,
-0.7481468, -0.1474175, -1.496418, 1, 1, 1, 1, 1,
-0.7453262, -1.35387, -2.3246, 1, 1, 1, 1, 1,
-0.741088, -0.5316159, -3.147752, 1, 1, 1, 1, 1,
-0.7361221, 0.5294368, -1.793232, 1, 1, 1, 1, 1,
-0.722633, 1.026312, 0.04657334, 1, 1, 1, 1, 1,
-0.7191615, 1.417644, -1.186125, 1, 1, 1, 1, 1,
-0.716723, -0.6037161, -1.737158, 1, 1, 1, 1, 1,
-0.7148588, 0.3041422, 0.3322926, 1, 1, 1, 1, 1,
-0.714103, 0.4741596, -1.863914, 1, 1, 1, 1, 1,
-0.6985378, -0.9158801, -3.098773, 1, 1, 1, 1, 1,
-0.6962612, 0.2332861, -0.2231381, 1, 1, 1, 1, 1,
-0.6859832, -0.8255543, -3.605953, 0, 0, 1, 1, 1,
-0.6813669, 0.7685378, 1.148651, 1, 0, 0, 1, 1,
-0.6802479, -0.4125601, -1.908401, 1, 0, 0, 1, 1,
-0.6784616, 0.4000081, -0.480958, 1, 0, 0, 1, 1,
-0.6781572, 0.5585635, -0.6293843, 1, 0, 0, 1, 1,
-0.6717109, -0.316112, -0.6316735, 1, 0, 0, 1, 1,
-0.6633716, -0.6848508, -3.21112, 0, 0, 0, 1, 1,
-0.662344, 0.629652, -0.6949685, 0, 0, 0, 1, 1,
-0.6581723, 1.859573, -1.264367, 0, 0, 0, 1, 1,
-0.6556756, 0.6608831, -0.7260578, 0, 0, 0, 1, 1,
-0.6502026, 0.2215878, 0.3408212, 0, 0, 0, 1, 1,
-0.6453253, -1.610637, -3.692059, 0, 0, 0, 1, 1,
-0.6417412, -2.757273, -3.470331, 0, 0, 0, 1, 1,
-0.6408005, 0.09504954, -0.6955443, 1, 1, 1, 1, 1,
-0.6358079, 0.08330333, -3.462342, 1, 1, 1, 1, 1,
-0.6307865, 0.06328125, -1.067447, 1, 1, 1, 1, 1,
-0.6283889, -0.895306, -2.831459, 1, 1, 1, 1, 1,
-0.6247682, -1.270461, -4.332452, 1, 1, 1, 1, 1,
-0.6246705, -0.4518276, -2.145253, 1, 1, 1, 1, 1,
-0.6245523, 0.4578423, -1.742796, 1, 1, 1, 1, 1,
-0.6177275, 0.6633512, -0.2330393, 1, 1, 1, 1, 1,
-0.6148754, -0.5023414, -1.925679, 1, 1, 1, 1, 1,
-0.6113223, -0.9835582, -3.478983, 1, 1, 1, 1, 1,
-0.6074371, -1.716681, -3.766143, 1, 1, 1, 1, 1,
-0.6003099, -0.1480672, -2.170525, 1, 1, 1, 1, 1,
-0.5951018, -0.9779786, -2.544172, 1, 1, 1, 1, 1,
-0.5922373, 0.1277745, -1.91172, 1, 1, 1, 1, 1,
-0.5909626, -1.523631, -2.918095, 1, 1, 1, 1, 1,
-0.5902474, -0.4412145, -1.667817, 0, 0, 1, 1, 1,
-0.5877153, -0.7289219, -2.056885, 1, 0, 0, 1, 1,
-0.5870792, 0.8597096, -0.9204666, 1, 0, 0, 1, 1,
-0.5858466, -1.077934, -2.340099, 1, 0, 0, 1, 1,
-0.5847774, -0.8363945, -2.118994, 1, 0, 0, 1, 1,
-0.5825907, -0.2846543, -3.355492, 1, 0, 0, 1, 1,
-0.5815515, 0.2451802, -1.450282, 0, 0, 0, 1, 1,
-0.5792904, 0.3121867, -2.552703, 0, 0, 0, 1, 1,
-0.5755316, 1.442773, -1.925414, 0, 0, 0, 1, 1,
-0.5736901, 1.204831, -0.3706212, 0, 0, 0, 1, 1,
-0.5683113, 0.5470833, -1.381499, 0, 0, 0, 1, 1,
-0.5681151, -0.08204208, -0.6812199, 0, 0, 0, 1, 1,
-0.5644243, 0.009700341, -2.252028, 0, 0, 0, 1, 1,
-0.5611996, 0.01760828, 0.09510782, 1, 1, 1, 1, 1,
-0.5543678, 0.3747503, -2.234053, 1, 1, 1, 1, 1,
-0.5534159, 1.12435, -1.095729, 1, 1, 1, 1, 1,
-0.553341, -0.08813334, 0.08590767, 1, 1, 1, 1, 1,
-0.5488504, 0.6374652, -1.693218, 1, 1, 1, 1, 1,
-0.5471427, -2.480844, -3.368988, 1, 1, 1, 1, 1,
-0.5468715, -0.1611979, -2.126435, 1, 1, 1, 1, 1,
-0.543255, 0.8098004, 0.04793998, 1, 1, 1, 1, 1,
-0.5412331, 0.1644181, -1.192635, 1, 1, 1, 1, 1,
-0.540172, -0.1025571, -0.8923381, 1, 1, 1, 1, 1,
-0.5367425, -0.1927294, -2.1538, 1, 1, 1, 1, 1,
-0.5350856, 2.051254, -0.04253558, 1, 1, 1, 1, 1,
-0.5331043, 0.008746759, -0.4225751, 1, 1, 1, 1, 1,
-0.5326946, 0.107968, 0.0968921, 1, 1, 1, 1, 1,
-0.5318732, -0.4381054, -0.1786596, 1, 1, 1, 1, 1,
-0.5314452, -0.1737326, -2.393342, 0, 0, 1, 1, 1,
-0.5299635, -0.879923, -0.826687, 1, 0, 0, 1, 1,
-0.5298514, -1.114666, -3.377346, 1, 0, 0, 1, 1,
-0.5289724, -0.5938938, -2.532309, 1, 0, 0, 1, 1,
-0.5276628, -1.277186, -3.611689, 1, 0, 0, 1, 1,
-0.5267248, -1.785952, -3.306281, 1, 0, 0, 1, 1,
-0.5251237, -1.221447, -2.711495, 0, 0, 0, 1, 1,
-0.5240309, 0.5240363, -1.11617, 0, 0, 0, 1, 1,
-0.5221273, 0.2945404, -1.940424, 0, 0, 0, 1, 1,
-0.5168286, 2.11945, -1.911306, 0, 0, 0, 1, 1,
-0.5165434, -0.06022122, -3.173791, 0, 0, 0, 1, 1,
-0.5145089, 0.5305368, -1.28594, 0, 0, 0, 1, 1,
-0.5143337, 1.208128, 0.8263077, 0, 0, 0, 1, 1,
-0.5132561, 0.6550022, -0.1324435, 1, 1, 1, 1, 1,
-0.5125283, 0.03771137, -0.488724, 1, 1, 1, 1, 1,
-0.5113659, -0.2087671, -1.988671, 1, 1, 1, 1, 1,
-0.5053071, -3.416422, -3.030636, 1, 1, 1, 1, 1,
-0.503045, 0.3977876, -2.357779, 1, 1, 1, 1, 1,
-0.502818, -0.9380863, -2.146995, 1, 1, 1, 1, 1,
-0.4968729, -0.1184909, -1.318183, 1, 1, 1, 1, 1,
-0.495185, 0.7408706, 0.568108, 1, 1, 1, 1, 1,
-0.4949709, 1.894349, -0.9741138, 1, 1, 1, 1, 1,
-0.493423, -0.8546463, -2.125597, 1, 1, 1, 1, 1,
-0.4861881, 0.6140066, -1.379569, 1, 1, 1, 1, 1,
-0.4845166, -0.708858, -3.983334, 1, 1, 1, 1, 1,
-0.483965, -1.102928, -1.85938, 1, 1, 1, 1, 1,
-0.4811701, -0.356916, -2.947347, 1, 1, 1, 1, 1,
-0.4782791, 1.52286, -0.8902378, 1, 1, 1, 1, 1,
-0.4779711, 0.6806888, -1.868079, 0, 0, 1, 1, 1,
-0.4750585, 0.8245176, -1.585883, 1, 0, 0, 1, 1,
-0.4749551, 1.230751, -1.666543, 1, 0, 0, 1, 1,
-0.4714564, 0.7986863, -0.7931454, 1, 0, 0, 1, 1,
-0.4710003, 1.697344, -0.2127451, 1, 0, 0, 1, 1,
-0.4664178, 0.8782563, -1.4156, 1, 0, 0, 1, 1,
-0.462037, 0.2035621, -0.1437909, 0, 0, 0, 1, 1,
-0.4616816, 0.58382, -0.8911129, 0, 0, 0, 1, 1,
-0.4577264, -0.107639, -0.624168, 0, 0, 0, 1, 1,
-0.455899, 0.1870857, -1.79139, 0, 0, 0, 1, 1,
-0.4490465, -0.3172064, -2.158974, 0, 0, 0, 1, 1,
-0.4488068, -0.7256151, -2.078935, 0, 0, 0, 1, 1,
-0.4486059, 0.4803551, 0.5022784, 0, 0, 0, 1, 1,
-0.4437341, 0.4102179, -3.030918, 1, 1, 1, 1, 1,
-0.443454, -0.8020384, -2.323145, 1, 1, 1, 1, 1,
-0.4399295, 0.3354127, -1.468285, 1, 1, 1, 1, 1,
-0.4321936, -0.2509776, -2.784207, 1, 1, 1, 1, 1,
-0.4320293, -0.7874768, -1.475862, 1, 1, 1, 1, 1,
-0.4283461, 0.0225993, -1.271173, 1, 1, 1, 1, 1,
-0.427628, 0.3119894, -1.340903, 1, 1, 1, 1, 1,
-0.4241081, -0.08583283, -3.632488, 1, 1, 1, 1, 1,
-0.4192958, -0.2424575, -2.930094, 1, 1, 1, 1, 1,
-0.4136247, -0.1934712, -0.9152736, 1, 1, 1, 1, 1,
-0.4122542, -0.8556336, -2.652488, 1, 1, 1, 1, 1,
-0.4100975, -0.7790459, -1.791188, 1, 1, 1, 1, 1,
-0.4047919, -0.2025199, -3.817665, 1, 1, 1, 1, 1,
-0.4046597, -1.004205, -2.735314, 1, 1, 1, 1, 1,
-0.4040873, 0.7898845, -1.461589, 1, 1, 1, 1, 1,
-0.4037795, -0.2672548, -3.386851, 0, 0, 1, 1, 1,
-0.4026358, -0.02443522, -2.433596, 1, 0, 0, 1, 1,
-0.3992662, 1.225166, -0.6742172, 1, 0, 0, 1, 1,
-0.3991975, 0.4730814, -0.5631236, 1, 0, 0, 1, 1,
-0.3937466, 0.07624063, -0.4165452, 1, 0, 0, 1, 1,
-0.3936322, -0.2302001, -2.444797, 1, 0, 0, 1, 1,
-0.3932586, 0.001329502, -0.4207231, 0, 0, 0, 1, 1,
-0.3915606, 0.4294981, -0.5228287, 0, 0, 0, 1, 1,
-0.3855949, -0.7278354, -1.374342, 0, 0, 0, 1, 1,
-0.3855106, -0.7827141, -1.128562, 0, 0, 0, 1, 1,
-0.3787767, 2.231902, 0.4680127, 0, 0, 0, 1, 1,
-0.3779907, 0.6974613, -0.6579982, 0, 0, 0, 1, 1,
-0.3771673, 1.250907, 0.5961555, 0, 0, 0, 1, 1,
-0.3771213, 0.08740506, -2.811707, 1, 1, 1, 1, 1,
-0.3735624, -0.2499319, -1.505415, 1, 1, 1, 1, 1,
-0.3730274, -0.6063937, -3.206452, 1, 1, 1, 1, 1,
-0.3703501, 0.03554555, -1.631127, 1, 1, 1, 1, 1,
-0.3681405, -1.445244, -4.47069, 1, 1, 1, 1, 1,
-0.3673272, 1.053755, -0.4037803, 1, 1, 1, 1, 1,
-0.3623113, -1.233789, -3.143491, 1, 1, 1, 1, 1,
-0.3614761, -1.357579, -2.793443, 1, 1, 1, 1, 1,
-0.3614272, 0.7222653, 0.2266511, 1, 1, 1, 1, 1,
-0.3612819, 0.1057168, -1.520446, 1, 1, 1, 1, 1,
-0.3603034, -0.6229605, -2.318166, 1, 1, 1, 1, 1,
-0.3599014, 0.3465485, -1.287225, 1, 1, 1, 1, 1,
-0.3590634, 1.398428, 0.3562196, 1, 1, 1, 1, 1,
-0.357987, -1.069648, -3.180968, 1, 1, 1, 1, 1,
-0.3487073, 0.2063041, -1.907933, 1, 1, 1, 1, 1,
-0.3458499, -0.2063751, -1.559218, 0, 0, 1, 1, 1,
-0.3449823, 0.8855187, -0.01949529, 1, 0, 0, 1, 1,
-0.3376845, -1.07119, -3.960352, 1, 0, 0, 1, 1,
-0.3360031, -0.8543743, -1.74361, 1, 0, 0, 1, 1,
-0.3344665, -0.06105921, -3.057909, 1, 0, 0, 1, 1,
-0.3314196, 0.4427083, 0.4817579, 1, 0, 0, 1, 1,
-0.331292, 0.5217705, -0.5045276, 0, 0, 0, 1, 1,
-0.3303707, 0.8114312, -0.8182371, 0, 0, 0, 1, 1,
-0.3273161, 0.6894021, -0.6712664, 0, 0, 0, 1, 1,
-0.3262194, -0.8567345, -2.205599, 0, 0, 0, 1, 1,
-0.3215437, 0.3312283, -0.8635262, 0, 0, 0, 1, 1,
-0.3137376, 1.375802, 0.009681139, 0, 0, 0, 1, 1,
-0.3080949, -0.6555284, -3.3719, 0, 0, 0, 1, 1,
-0.3005455, 0.5598992, -1.405045, 1, 1, 1, 1, 1,
-0.296435, 1.233277, -0.7568318, 1, 1, 1, 1, 1,
-0.2936288, -0.1736433, -0.9755062, 1, 1, 1, 1, 1,
-0.2901606, -1.487129, -2.196732, 1, 1, 1, 1, 1,
-0.2887739, -0.7017109, -2.673592, 1, 1, 1, 1, 1,
-0.2881956, -1.187932, -1.611783, 1, 1, 1, 1, 1,
-0.2877236, -0.1333338, -2.797271, 1, 1, 1, 1, 1,
-0.2874309, 0.7208405, -1.329525, 1, 1, 1, 1, 1,
-0.2798797, -0.03375944, -2.882271, 1, 1, 1, 1, 1,
-0.274355, -0.9520392, -3.258906, 1, 1, 1, 1, 1,
-0.2649111, 0.8673374, -1.060189, 1, 1, 1, 1, 1,
-0.2584539, -1.088455, -3.461455, 1, 1, 1, 1, 1,
-0.2573342, -1.142509, -3.995092, 1, 1, 1, 1, 1,
-0.2538054, 0.2315925, -0.4955318, 1, 1, 1, 1, 1,
-0.2533897, 1.178579, -2.698341, 1, 1, 1, 1, 1,
-0.2445309, 0.01758912, -1.412405, 0, 0, 1, 1, 1,
-0.2420482, -0.1784011, -1.429318, 1, 0, 0, 1, 1,
-0.240605, -1.385703, -3.752971, 1, 0, 0, 1, 1,
-0.2389571, -0.4735974, -1.637132, 1, 0, 0, 1, 1,
-0.2342043, 1.004073, -0.9814546, 1, 0, 0, 1, 1,
-0.2261182, 0.008102137, 1.135029, 1, 0, 0, 1, 1,
-0.2252763, -0.6474454, -1.962369, 0, 0, 0, 1, 1,
-0.2248635, 0.3141084, 0.5509465, 0, 0, 0, 1, 1,
-0.2247971, 0.4957114, 0.5959575, 0, 0, 0, 1, 1,
-0.2167835, -0.9686347, -3.785927, 0, 0, 0, 1, 1,
-0.2128069, 0.4149408, -1.357419, 0, 0, 0, 1, 1,
-0.2095173, 1.455465, -0.9297791, 0, 0, 0, 1, 1,
-0.2015612, -0.4648018, -3.647491, 0, 0, 0, 1, 1,
-0.2011824, -0.6813155, -3.404019, 1, 1, 1, 1, 1,
-0.1998869, 1.378111, 0.5486085, 1, 1, 1, 1, 1,
-0.199797, -0.5125004, -2.098867, 1, 1, 1, 1, 1,
-0.1975466, -0.2887765, -2.608616, 1, 1, 1, 1, 1,
-0.1967984, -0.3347883, -1.917428, 1, 1, 1, 1, 1,
-0.1956006, -0.02192154, -3.199795, 1, 1, 1, 1, 1,
-0.1897991, -0.1651825, -4.07087, 1, 1, 1, 1, 1,
-0.1894651, -0.9873545, -1.216634, 1, 1, 1, 1, 1,
-0.180683, 0.6361067, -1.854488, 1, 1, 1, 1, 1,
-0.1773998, 0.1491754, -0.9511038, 1, 1, 1, 1, 1,
-0.1719533, -0.4228571, -3.05899, 1, 1, 1, 1, 1,
-0.1691719, 0.07762983, -1.275388, 1, 1, 1, 1, 1,
-0.1648359, 1.492149, -0.06512542, 1, 1, 1, 1, 1,
-0.1647117, 1.378188, -0.854426, 1, 1, 1, 1, 1,
-0.160729, -0.3684106, -3.044704, 1, 1, 1, 1, 1,
-0.1525661, 1.866566, -0.03922011, 0, 0, 1, 1, 1,
-0.150358, -0.9549659, -6.371078, 1, 0, 0, 1, 1,
-0.1468577, 0.05570729, -0.9665213, 1, 0, 0, 1, 1,
-0.1465584, 1.198985, -1.162824, 1, 0, 0, 1, 1,
-0.1414969, 0.8852153, 1.043743, 1, 0, 0, 1, 1,
-0.1414389, -2.126814, -2.001755, 1, 0, 0, 1, 1,
-0.1407867, -1.43231, -5.406867, 0, 0, 0, 1, 1,
-0.1398518, -0.9079989, -3.882894, 0, 0, 0, 1, 1,
-0.1370671, -0.1023738, -1.833496, 0, 0, 0, 1, 1,
-0.1358314, 1.699193, -0.8330439, 0, 0, 0, 1, 1,
-0.1218357, 1.519439, 0.2190743, 0, 0, 0, 1, 1,
-0.1176613, -1.069873, -3.833469, 0, 0, 0, 1, 1,
-0.1167192, -0.6870251, -1.664623, 0, 0, 0, 1, 1,
-0.1147118, 0.3405638, -0.900768, 1, 1, 1, 1, 1,
-0.1132483, -1.400376, -3.226821, 1, 1, 1, 1, 1,
-0.1100272, -0.1103212, -1.11886, 1, 1, 1, 1, 1,
-0.107898, 1.607504, -1.56127, 1, 1, 1, 1, 1,
-0.1077229, 0.7208786, -1.721799, 1, 1, 1, 1, 1,
-0.09733475, -1.181626, -3.314142, 1, 1, 1, 1, 1,
-0.09429048, -0.2687693, -2.015785, 1, 1, 1, 1, 1,
-0.09221222, 0.3390264, -1.597988, 1, 1, 1, 1, 1,
-0.09158338, 2.31101, -0.4925967, 1, 1, 1, 1, 1,
-0.09021696, -0.9040822, -3.924256, 1, 1, 1, 1, 1,
-0.08996137, -0.08546177, -1.072386, 1, 1, 1, 1, 1,
-0.08654702, -0.1976809, -3.350746, 1, 1, 1, 1, 1,
-0.08592039, -1.314311, -3.785943, 1, 1, 1, 1, 1,
-0.08498234, 0.5845423, 1.013381, 1, 1, 1, 1, 1,
-0.0832405, -0.9812005, -3.110392, 1, 1, 1, 1, 1,
-0.08253897, -1.110684, -2.570923, 0, 0, 1, 1, 1,
-0.07618632, 0.3779851, 1.83983, 1, 0, 0, 1, 1,
-0.07512533, 0.8616862, -0.4013897, 1, 0, 0, 1, 1,
-0.07258753, -0.8388751, -1.692562, 1, 0, 0, 1, 1,
-0.06981182, -1.455375, -4.112293, 1, 0, 0, 1, 1,
-0.06241811, 1.634287, -0.3314422, 1, 0, 0, 1, 1,
-0.05565256, 0.5338191, -1.048645, 0, 0, 0, 1, 1,
-0.05180258, -0.1818198, -2.118328, 0, 0, 0, 1, 1,
-0.05014176, 0.6970908, 1.653122, 0, 0, 0, 1, 1,
-0.05009312, 0.3160794, -1.46497, 0, 0, 0, 1, 1,
-0.04953294, 0.9446344, -0.4305967, 0, 0, 0, 1, 1,
-0.04921586, 0.1574873, 0.53081, 0, 0, 0, 1, 1,
-0.04484747, 0.05196299, -0.4360827, 0, 0, 0, 1, 1,
-0.04335792, -0.06687788, -2.2589, 1, 1, 1, 1, 1,
-0.04283499, 1.411778, -0.3466549, 1, 1, 1, 1, 1,
-0.03902294, 1.050475, 0.2373546, 1, 1, 1, 1, 1,
-0.02859103, 0.7629398, 0.9540679, 1, 1, 1, 1, 1,
-0.02737777, -0.7600696, -2.769749, 1, 1, 1, 1, 1,
-0.02582558, -0.08888704, -3.442943, 1, 1, 1, 1, 1,
-0.02491037, 0.1505862, -1.237907, 1, 1, 1, 1, 1,
-0.02448473, 1.081984, -1.252814, 1, 1, 1, 1, 1,
-0.02424769, -1.532412, -3.035178, 1, 1, 1, 1, 1,
-0.02269458, -0.7206811, -4.898512, 1, 1, 1, 1, 1,
-0.02253393, -0.472635, -4.02588, 1, 1, 1, 1, 1,
-0.02192314, -0.5898291, -3.984884, 1, 1, 1, 1, 1,
-0.01754255, -0.9426229, -1.75846, 1, 1, 1, 1, 1,
-0.01574718, 0.7855211, 0.3963417, 1, 1, 1, 1, 1,
-0.01406671, 0.5579525, 0.541441, 1, 1, 1, 1, 1,
-0.009422709, -0.1757886, -3.253183, 0, 0, 1, 1, 1,
-0.00866981, 1.993964, -0.3394575, 1, 0, 0, 1, 1,
-0.007681132, -0.8828906, -2.322505, 1, 0, 0, 1, 1,
-0.00752497, 0.7478914, 1.445532, 1, 0, 0, 1, 1,
-0.007136411, 0.9473928, -0.1999041, 1, 0, 0, 1, 1,
-0.006253796, -0.7106727, -3.156087, 1, 0, 0, 1, 1,
-0.004461554, 1.209417, 1.640208, 0, 0, 0, 1, 1,
0.0009348118, 1.503648, 0.9124267, 0, 0, 0, 1, 1,
0.007636095, 0.7162367, -1.88656, 0, 0, 0, 1, 1,
0.01207355, 0.6164373, -1.173603, 0, 0, 0, 1, 1,
0.01449131, 0.1413331, 1.055346, 0, 0, 0, 1, 1,
0.01461785, 1.870117, 0.8152424, 0, 0, 0, 1, 1,
0.01968101, -1.823229, 2.443681, 0, 0, 0, 1, 1,
0.01985773, -0.938396, 4.308929, 1, 1, 1, 1, 1,
0.0214858, -1.151173, 3.570944, 1, 1, 1, 1, 1,
0.02384863, 0.1332194, 1.359461, 1, 1, 1, 1, 1,
0.02563809, 1.103244, -0.5954476, 1, 1, 1, 1, 1,
0.02792588, 0.01901711, 2.602602, 1, 1, 1, 1, 1,
0.02931001, 0.1988865, -0.1861897, 1, 1, 1, 1, 1,
0.03189469, -1.010098, 3.767425, 1, 1, 1, 1, 1,
0.03374113, 0.207275, 0.7289, 1, 1, 1, 1, 1,
0.0361072, -0.6059233, 5.146274, 1, 1, 1, 1, 1,
0.03813589, 1.653989, 0.2726181, 1, 1, 1, 1, 1,
0.04707654, -1.134996, 2.385895, 1, 1, 1, 1, 1,
0.05003967, -0.9398217, 4.333064, 1, 1, 1, 1, 1,
0.05420873, 1.008119, 0.8907344, 1, 1, 1, 1, 1,
0.06170229, 0.009656253, 0.3504074, 1, 1, 1, 1, 1,
0.06448078, 0.639479, 0.5659595, 1, 1, 1, 1, 1,
0.06628988, -0.4898324, 2.742213, 0, 0, 1, 1, 1,
0.06670275, 0.09173764, 0.9382321, 1, 0, 0, 1, 1,
0.06953769, 1.423224, 0.5676821, 1, 0, 0, 1, 1,
0.07118622, 0.8869339, -0.8960371, 1, 0, 0, 1, 1,
0.07210982, -0.7277383, 4.173134, 1, 0, 0, 1, 1,
0.07288578, 0.5311667, 0.01550002, 1, 0, 0, 1, 1,
0.07339311, 0.5060415, 0.01566394, 0, 0, 0, 1, 1,
0.07726582, 0.8167832, -0.7919877, 0, 0, 0, 1, 1,
0.07832937, 1.808918, -1.916636, 0, 0, 0, 1, 1,
0.07980797, 0.2286063, -0.4638733, 0, 0, 0, 1, 1,
0.08343145, 0.8432191, 0.6540595, 0, 0, 0, 1, 1,
0.08507536, -2.066443, 2.581942, 0, 0, 0, 1, 1,
0.08761997, -0.9203694, 3.235052, 0, 0, 0, 1, 1,
0.08949343, -2.661773, 2.826122, 1, 1, 1, 1, 1,
0.08976647, -1.25424, 3.787996, 1, 1, 1, 1, 1,
0.0947928, 0.2357956, 0.3296703, 1, 1, 1, 1, 1,
0.09802551, -0.630541, 3.784489, 1, 1, 1, 1, 1,
0.1115084, -0.9202244, 5.154502, 1, 1, 1, 1, 1,
0.1166304, -0.9714764, 4.211887, 1, 1, 1, 1, 1,
0.1181893, 0.6546831, -0.9813055, 1, 1, 1, 1, 1,
0.1197689, -1.35604, 3.63344, 1, 1, 1, 1, 1,
0.1298525, 0.5605921, 0.159833, 1, 1, 1, 1, 1,
0.1318969, 2.06245, 0.899226, 1, 1, 1, 1, 1,
0.1374749, -0.6622267, 1.183315, 1, 1, 1, 1, 1,
0.1411132, -0.6168937, 0.6020075, 1, 1, 1, 1, 1,
0.1470313, -1.277078, 1.81308, 1, 1, 1, 1, 1,
0.1496705, -1.718363, 2.173784, 1, 1, 1, 1, 1,
0.1521774, -0.8075701, 3.991124, 1, 1, 1, 1, 1,
0.1559242, 0.2480872, -0.565957, 0, 0, 1, 1, 1,
0.1570792, 0.2819581, 1.468067, 1, 0, 0, 1, 1,
0.1645731, -0.6097256, 3.203972, 1, 0, 0, 1, 1,
0.1659206, -0.3980197, 3.102662, 1, 0, 0, 1, 1,
0.166566, 0.7142457, -2.18679, 1, 0, 0, 1, 1,
0.1739122, 0.02564665, 1.279186, 1, 0, 0, 1, 1,
0.1824489, 1.543498, 0.2736019, 0, 0, 0, 1, 1,
0.1906509, 2.504735, 1.424497, 0, 0, 0, 1, 1,
0.1965752, -1.27857, 1.526471, 0, 0, 0, 1, 1,
0.198746, -0.2262571, 2.937842, 0, 0, 0, 1, 1,
0.1994562, -1.320498, 3.759197, 0, 0, 0, 1, 1,
0.2010557, -0.6718345, 3.614625, 0, 0, 0, 1, 1,
0.2028197, -1.452613, 4.121603, 0, 0, 0, 1, 1,
0.2028792, -1.215955, 2.536839, 1, 1, 1, 1, 1,
0.2030699, 0.01070743, 1.718603, 1, 1, 1, 1, 1,
0.2059539, -0.9321469, 2.242515, 1, 1, 1, 1, 1,
0.2106704, -1.630421, 4.030143, 1, 1, 1, 1, 1,
0.211224, -0.9253111, 3.628856, 1, 1, 1, 1, 1,
0.2124386, 1.640583, 0.2300282, 1, 1, 1, 1, 1,
0.2151991, 1.141349, 0.01710958, 1, 1, 1, 1, 1,
0.218418, -0.02844453, 1.799795, 1, 1, 1, 1, 1,
0.2202602, -0.7287601, 2.349417, 1, 1, 1, 1, 1,
0.2207592, -2.380894, 1.449987, 1, 1, 1, 1, 1,
0.2218698, 0.994925, 0.8711866, 1, 1, 1, 1, 1,
0.2236903, 1.929254, 2.000877, 1, 1, 1, 1, 1,
0.224706, 0.9289337, 1.308379, 1, 1, 1, 1, 1,
0.2255016, -0.07418513, 0.9390964, 1, 1, 1, 1, 1,
0.2346975, -1.057825, 3.071067, 1, 1, 1, 1, 1,
0.2406953, -0.6848468, 1.899967, 0, 0, 1, 1, 1,
0.2422397, 0.1741164, 1.491385, 1, 0, 0, 1, 1,
0.2443231, -0.01578131, 2.515949, 1, 0, 0, 1, 1,
0.2464411, -0.2893461, 2.836657, 1, 0, 0, 1, 1,
0.2491845, 0.4575602, 1.804185, 1, 0, 0, 1, 1,
0.249368, 0.01842588, 3.448595, 1, 0, 0, 1, 1,
0.2498852, -0.9342511, 2.824046, 0, 0, 0, 1, 1,
0.2534153, -0.03773963, 0.9710424, 0, 0, 0, 1, 1,
0.2546071, 1.324574, 0.6991711, 0, 0, 0, 1, 1,
0.2548082, 0.2721852, 1.49626, 0, 0, 0, 1, 1,
0.2555389, 0.05541192, 2.341866, 0, 0, 0, 1, 1,
0.2566974, -1.248335, 1.169866, 0, 0, 0, 1, 1,
0.2599513, 3.103172, 0.6057882, 0, 0, 0, 1, 1,
0.2620971, -3.197007, 3.652509, 1, 1, 1, 1, 1,
0.2656765, -0.4192727, 3.660066, 1, 1, 1, 1, 1,
0.2661798, -1.527716, 3.251261, 1, 1, 1, 1, 1,
0.267967, 0.4773205, -0.8579558, 1, 1, 1, 1, 1,
0.2696795, -0.2970731, 1.634484, 1, 1, 1, 1, 1,
0.2718572, -0.7346079, 3.066854, 1, 1, 1, 1, 1,
0.2744261, -0.4666371, 3.461327, 1, 1, 1, 1, 1,
0.2775389, 1.66465, 1.118189, 1, 1, 1, 1, 1,
0.27763, -0.6437646, 1.059171, 1, 1, 1, 1, 1,
0.2787356, 1.211932, 0.1712622, 1, 1, 1, 1, 1,
0.2805578, 0.670168, 0.6154641, 1, 1, 1, 1, 1,
0.2848697, -0.007039782, 2.579299, 1, 1, 1, 1, 1,
0.2848764, -0.1789496, 0.6836118, 1, 1, 1, 1, 1,
0.2858879, 0.5459302, 0.9733425, 1, 1, 1, 1, 1,
0.2898741, -0.9900314, 2.697379, 1, 1, 1, 1, 1,
0.299025, -0.3267192, 2.064591, 0, 0, 1, 1, 1,
0.299691, 0.3008799, 0.7849736, 1, 0, 0, 1, 1,
0.3039858, 0.5047422, 2.529768, 1, 0, 0, 1, 1,
0.3057652, 0.9481862, 1.91035, 1, 0, 0, 1, 1,
0.3065892, -0.928166, 3.972632, 1, 0, 0, 1, 1,
0.3097855, 1.25635, 1.405402, 1, 0, 0, 1, 1,
0.3100498, -1.241884, 2.784114, 0, 0, 0, 1, 1,
0.3133546, -0.3572626, 3.277999, 0, 0, 0, 1, 1,
0.3165706, 0.5426274, 0.177837, 0, 0, 0, 1, 1,
0.3169397, -0.08782736, 2.219044, 0, 0, 0, 1, 1,
0.3192705, -0.2359139, 2.070835, 0, 0, 0, 1, 1,
0.3236105, -0.3642902, 1.971477, 0, 0, 0, 1, 1,
0.3283522, 0.2862468, 0.3577326, 0, 0, 0, 1, 1,
0.3296244, 1.614119, -1.425707, 1, 1, 1, 1, 1,
0.3303282, 0.01332369, 2.187594, 1, 1, 1, 1, 1,
0.3326854, 0.6268878, 1.365538, 1, 1, 1, 1, 1,
0.3338946, -0.2921435, 2.895455, 1, 1, 1, 1, 1,
0.3342529, 0.1176095, 2.030581, 1, 1, 1, 1, 1,
0.3352781, 0.7051552, 1.236776, 1, 1, 1, 1, 1,
0.3369641, 0.9219722, 1.954924, 1, 1, 1, 1, 1,
0.3416517, 0.6909637, 1.867748, 1, 1, 1, 1, 1,
0.3419771, 0.2561096, 1.02921, 1, 1, 1, 1, 1,
0.3442978, 0.986285, 0.1135374, 1, 1, 1, 1, 1,
0.3457255, -0.5721757, 3.699333, 1, 1, 1, 1, 1,
0.3490387, 1.162277, 0.4247089, 1, 1, 1, 1, 1,
0.3511553, -1.680763, 2.164739, 1, 1, 1, 1, 1,
0.3557704, 0.7263876, -0.9238907, 1, 1, 1, 1, 1,
0.3591601, -0.8264607, 1.951257, 1, 1, 1, 1, 1,
0.3608256, -0.4910483, 2.909539, 0, 0, 1, 1, 1,
0.3611217, -0.8222071, 0.7254274, 1, 0, 0, 1, 1,
0.3646164, -0.3493609, 3.845128, 1, 0, 0, 1, 1,
0.3648199, 0.2872029, 1.299169, 1, 0, 0, 1, 1,
0.3792127, -0.09952936, 2.177725, 1, 0, 0, 1, 1,
0.3797762, 1.262363, -0.9710265, 1, 0, 0, 1, 1,
0.381307, -0.5265974, 3.822592, 0, 0, 0, 1, 1,
0.3835137, -1.374674, 3.738492, 0, 0, 0, 1, 1,
0.3867798, -0.2243848, 1.358502, 0, 0, 0, 1, 1,
0.3885842, 0.4478465, 1.660155, 0, 0, 0, 1, 1,
0.3947796, 0.3044003, 1.225258, 0, 0, 0, 1, 1,
0.3986291, 1.646453, 0.06890225, 0, 0, 0, 1, 1,
0.3998724, 1.778984, -0.1839219, 0, 0, 0, 1, 1,
0.4039754, -0.9450302, 3.396833, 1, 1, 1, 1, 1,
0.4055082, -0.2481981, 0.7371565, 1, 1, 1, 1, 1,
0.4077539, -0.1829281, 1.929612, 1, 1, 1, 1, 1,
0.4112284, -0.5035779, 3.224011, 1, 1, 1, 1, 1,
0.4120861, 1.0143, 1.17745, 1, 1, 1, 1, 1,
0.4163626, 0.1351215, 1.145855, 1, 1, 1, 1, 1,
0.4163766, -0.508881, 1.742052, 1, 1, 1, 1, 1,
0.4165998, 0.000966523, 2.056727, 1, 1, 1, 1, 1,
0.4215802, 1.112342, -2.041893, 1, 1, 1, 1, 1,
0.4267376, -0.2107626, 1.715472, 1, 1, 1, 1, 1,
0.429234, -0.9571174, 3.106244, 1, 1, 1, 1, 1,
0.4336711, 0.9756826, 0.2818, 1, 1, 1, 1, 1,
0.4344094, 0.1434022, 1.975945, 1, 1, 1, 1, 1,
0.4347998, -0.8291357, 3.104998, 1, 1, 1, 1, 1,
0.4355052, 0.4011423, -1.147029, 1, 1, 1, 1, 1,
0.4395989, -1.388021, 1.946763, 0, 0, 1, 1, 1,
0.441629, 1.912527, 0.7321698, 1, 0, 0, 1, 1,
0.4436547, -1.092225, 1.271902, 1, 0, 0, 1, 1,
0.45025, -1.993967, 2.0721, 1, 0, 0, 1, 1,
0.453952, 1.025341, 1.111067, 1, 0, 0, 1, 1,
0.457265, 0.2423314, 0.3494404, 1, 0, 0, 1, 1,
0.4653101, -1.487693, 2.447255, 0, 0, 0, 1, 1,
0.4658619, 0.1829848, 1.577708, 0, 0, 0, 1, 1,
0.4665262, 0.8464112, -0.3228705, 0, 0, 0, 1, 1,
0.4703137, -0.2085157, 2.457262, 0, 0, 0, 1, 1,
0.4732533, -1.220549, 4.07711, 0, 0, 0, 1, 1,
0.4748033, 0.9672629, 2.16658, 0, 0, 0, 1, 1,
0.4765956, 0.3120429, 0.6358126, 0, 0, 0, 1, 1,
0.4779895, 1.530953, -1.498044, 1, 1, 1, 1, 1,
0.4814958, 1.14268, -1.677029, 1, 1, 1, 1, 1,
0.4847777, 0.679417, 0.2811092, 1, 1, 1, 1, 1,
0.4853333, 1.156378, 0.4783883, 1, 1, 1, 1, 1,
0.4866707, -0.604088, 3.473706, 1, 1, 1, 1, 1,
0.5016217, 0.4758134, 0.7074928, 1, 1, 1, 1, 1,
0.502238, 1.014246, -0.9550371, 1, 1, 1, 1, 1,
0.5055423, -1.716097, 2.740525, 1, 1, 1, 1, 1,
0.510788, -0.1996612, 2.556891, 1, 1, 1, 1, 1,
0.5157608, -0.3268161, 1.21147, 1, 1, 1, 1, 1,
0.5180845, -0.3506925, 3.709012, 1, 1, 1, 1, 1,
0.5197412, 0.07631987, 2.029932, 1, 1, 1, 1, 1,
0.5222082, -1.728129, 3.997312, 1, 1, 1, 1, 1,
0.5235681, -0.18538, 2.75859, 1, 1, 1, 1, 1,
0.5236565, 0.1001649, 1.962718, 1, 1, 1, 1, 1,
0.5346955, -1.520336, 2.32359, 0, 0, 1, 1, 1,
0.5354747, 0.4566906, 0.7903532, 1, 0, 0, 1, 1,
0.5362357, 1.658835, -1.403102, 1, 0, 0, 1, 1,
0.5364103, -2.027485, 1.976158, 1, 0, 0, 1, 1,
0.5402386, -0.08864098, 2.092228, 1, 0, 0, 1, 1,
0.5436989, -0.4889055, 1.654422, 1, 0, 0, 1, 1,
0.5458705, -0.8429127, 3.775615, 0, 0, 0, 1, 1,
0.5461796, 0.3736469, 2.201311, 0, 0, 0, 1, 1,
0.5469923, 0.8411753, -0.3605936, 0, 0, 0, 1, 1,
0.5556396, 0.09632803, 1.367805, 0, 0, 0, 1, 1,
0.5558001, -0.0315007, 2.426187, 0, 0, 0, 1, 1,
0.5629199, 0.5422156, 0.8913337, 0, 0, 0, 1, 1,
0.5664836, 2.797439, -1.15129, 0, 0, 0, 1, 1,
0.5670149, 2.338505, -0.1775085, 1, 1, 1, 1, 1,
0.5674108, -0.9369209, 0.9330405, 1, 1, 1, 1, 1,
0.5778363, 0.5686414, 0.3505924, 1, 1, 1, 1, 1,
0.5782333, 1.371621, -0.7677687, 1, 1, 1, 1, 1,
0.59404, -1.759595, 1.148577, 1, 1, 1, 1, 1,
0.5940806, -1.540183, 2.31797, 1, 1, 1, 1, 1,
0.5976638, 0.4685684, 0.238747, 1, 1, 1, 1, 1,
0.5991986, 0.537411, 0.7789238, 1, 1, 1, 1, 1,
0.5995548, -1.478933, 2.869028, 1, 1, 1, 1, 1,
0.6105106, 1.357919, 0.4060009, 1, 1, 1, 1, 1,
0.6118458, 0.3488204, 0.7491037, 1, 1, 1, 1, 1,
0.6123309, 1.320504, 0.9339677, 1, 1, 1, 1, 1,
0.614428, 1.283664, -0.06621329, 1, 1, 1, 1, 1,
0.6192884, 0.1574597, 1.197886, 1, 1, 1, 1, 1,
0.6203975, -1.510289, 1.832353, 1, 1, 1, 1, 1,
0.6234602, -0.6184406, 3.006477, 0, 0, 1, 1, 1,
0.6275744, -0.4007934, 4.472577, 1, 0, 0, 1, 1,
0.6292723, -0.7241445, 2.552075, 1, 0, 0, 1, 1,
0.6316722, 0.8794876, 0.2640957, 1, 0, 0, 1, 1,
0.6372219, -2.775434, 2.340278, 1, 0, 0, 1, 1,
0.6385272, -0.467005, 2.271428, 1, 0, 0, 1, 1,
0.6404173, -0.1371132, 2.754512, 0, 0, 0, 1, 1,
0.6412805, 0.6449735, 0.105671, 0, 0, 0, 1, 1,
0.6468083, -0.3283785, 3.199003, 0, 0, 0, 1, 1,
0.6476129, -0.6426839, 1.462449, 0, 0, 0, 1, 1,
0.6528861, 0.9930994, 0.1777476, 0, 0, 0, 1, 1,
0.6576204, -0.6215487, 1.92126, 0, 0, 0, 1, 1,
0.660503, 0.3302285, -1.096211, 0, 0, 0, 1, 1,
0.6631609, 0.7127847, -0.2039668, 1, 1, 1, 1, 1,
0.6637709, -1.136901, 3.2032, 1, 1, 1, 1, 1,
0.6648746, -2.181164, 3.761973, 1, 1, 1, 1, 1,
0.6662397, 1.773794, 0.1867161, 1, 1, 1, 1, 1,
0.6704041, 1.337728, -0.1802934, 1, 1, 1, 1, 1,
0.6793595, -0.2722181, 3.051804, 1, 1, 1, 1, 1,
0.6816061, 0.2046155, 1.233755, 1, 1, 1, 1, 1,
0.6821111, 1.876878, 0.100951, 1, 1, 1, 1, 1,
0.6822091, -0.3491583, 1.054418, 1, 1, 1, 1, 1,
0.6843808, -0.9871878, 2.19783, 1, 1, 1, 1, 1,
0.6892066, -1.072551, 1.878901, 1, 1, 1, 1, 1,
0.6942873, 0.05829996, 0.6219434, 1, 1, 1, 1, 1,
0.7006657, -0.288636, 1.561293, 1, 1, 1, 1, 1,
0.7028851, 1.68916, 1.374772, 1, 1, 1, 1, 1,
0.7080901, 0.04407991, 0.8681987, 1, 1, 1, 1, 1,
0.7092364, 1.590924, -0.9464397, 0, 0, 1, 1, 1,
0.7107098, 1.516334, 0.09391662, 1, 0, 0, 1, 1,
0.712576, 0.7638133, 2.75777, 1, 0, 0, 1, 1,
0.7217488, -0.9425594, 1.644042, 1, 0, 0, 1, 1,
0.7220134, -1.015803, 2.623644, 1, 0, 0, 1, 1,
0.7361681, -0.4273211, 1.587523, 1, 0, 0, 1, 1,
0.7408796, -0.3353819, 1.365123, 0, 0, 0, 1, 1,
0.7443185, 1.989058, -0.1375702, 0, 0, 0, 1, 1,
0.7478577, 1.866735, -1.92235, 0, 0, 0, 1, 1,
0.7576228, -0.009446077, 0.2917515, 0, 0, 0, 1, 1,
0.7674902, 0.0062558, 1.251393, 0, 0, 0, 1, 1,
0.7776138, 0.02024253, -0.5255167, 0, 0, 0, 1, 1,
0.7783219, 0.3069161, 0.3131014, 0, 0, 0, 1, 1,
0.7788042, -0.9746965, 2.775989, 1, 1, 1, 1, 1,
0.779146, 1.640739, -1.273812, 1, 1, 1, 1, 1,
0.7791703, 1.35775, 1.729262, 1, 1, 1, 1, 1,
0.7805673, 0.5390496, 0.6712149, 1, 1, 1, 1, 1,
0.7807425, -1.659388, 1.641291, 1, 1, 1, 1, 1,
0.7818855, -0.7462494, 1.225317, 1, 1, 1, 1, 1,
0.7821927, 0.5005906, 2.931489, 1, 1, 1, 1, 1,
0.7826914, 0.8400667, 1.184434, 1, 1, 1, 1, 1,
0.79831, 0.9049075, 0.4481544, 1, 1, 1, 1, 1,
0.7996738, -1.947972, 1.381994, 1, 1, 1, 1, 1,
0.8010622, 1.424343, 0.4788872, 1, 1, 1, 1, 1,
0.8078598, 0.6082789, 1.477161, 1, 1, 1, 1, 1,
0.8097322, -0.6473299, 1.778796, 1, 1, 1, 1, 1,
0.8108889, -0.7366096, 1.732482, 1, 1, 1, 1, 1,
0.8114113, -0.6318214, 2.837679, 1, 1, 1, 1, 1,
0.8114975, -1.556062, 2.865267, 0, 0, 1, 1, 1,
0.8175735, 1.51402, 0.356069, 1, 0, 0, 1, 1,
0.8214552, 0.0420739, 1.709091, 1, 0, 0, 1, 1,
0.8245136, 0.6152059, 0.7564212, 1, 0, 0, 1, 1,
0.8309259, -0.1690628, 0.5215582, 1, 0, 0, 1, 1,
0.8326144, 1.035481, 2.91177, 1, 0, 0, 1, 1,
0.8335958, 0.2796134, 0.5108061, 0, 0, 0, 1, 1,
0.8403693, -0.4682296, 2.220511, 0, 0, 0, 1, 1,
0.8436244, 1.165918, -0.3531166, 0, 0, 0, 1, 1,
0.8463639, -1.359218, 1.91999, 0, 0, 0, 1, 1,
0.8545346, 1.345084, 1.171421, 0, 0, 0, 1, 1,
0.8580216, -1.058325, 2.792314, 0, 0, 0, 1, 1,
0.8594324, 0.06462588, 2.340028, 0, 0, 0, 1, 1,
0.8713572, -0.08352488, 0.6219941, 1, 1, 1, 1, 1,
0.8733891, -0.8283946, 2.490055, 1, 1, 1, 1, 1,
0.8795761, 0.06716514, 2.472412, 1, 1, 1, 1, 1,
0.8823001, -0.1276384, 2.804716, 1, 1, 1, 1, 1,
0.882815, 0.9754423, 0.7660179, 1, 1, 1, 1, 1,
0.888329, 0.5620877, -1.022197, 1, 1, 1, 1, 1,
0.8909602, 2.201318, 0.2251204, 1, 1, 1, 1, 1,
0.8971711, 1.147767, 0.4335172, 1, 1, 1, 1, 1,
0.899294, 0.168934, -0.6215808, 1, 1, 1, 1, 1,
0.900688, 1.514158, 1.805148, 1, 1, 1, 1, 1,
0.9058725, 0.8712872, 0.722111, 1, 1, 1, 1, 1,
0.9164198, 2.555637, -0.6864008, 1, 1, 1, 1, 1,
0.9236867, 0.7696912, 1.712249, 1, 1, 1, 1, 1,
0.9248638, -2.030835, 2.242956, 1, 1, 1, 1, 1,
0.9311463, 0.4244523, 0.9620941, 1, 1, 1, 1, 1,
0.9362618, -0.4828002, 1.900997, 0, 0, 1, 1, 1,
0.9421383, -0.1277616, 0.6181009, 1, 0, 0, 1, 1,
0.9449579, 1.148037, -0.3625266, 1, 0, 0, 1, 1,
0.9460317, -0.716423, 0.8878386, 1, 0, 0, 1, 1,
0.9484313, 0.1188385, 1.610898, 1, 0, 0, 1, 1,
0.9486538, 1.000592, 0.6436145, 1, 0, 0, 1, 1,
0.9524463, 0.6734662, 0.03348001, 0, 0, 0, 1, 1,
0.9567856, 0.1168552, 1.125202, 0, 0, 0, 1, 1,
0.9581909, 0.5524938, 1.003102, 0, 0, 0, 1, 1,
0.9632194, -1.056926, 2.546802, 0, 0, 0, 1, 1,
0.9677016, 0.9034017, -0.8184025, 0, 0, 0, 1, 1,
0.9703893, -0.5564671, 2.87379, 0, 0, 0, 1, 1,
0.9708156, -2.645417, 2.67613, 0, 0, 0, 1, 1,
0.9773346, -0.2943573, -0.681376, 1, 1, 1, 1, 1,
0.9866706, -1.572355, 2.78811, 1, 1, 1, 1, 1,
0.9875067, -0.4073827, 1.748223, 1, 1, 1, 1, 1,
0.9903668, -0.2675483, 1.205483, 1, 1, 1, 1, 1,
0.9922518, 1.197848, 1.295538, 1, 1, 1, 1, 1,
0.9924684, 1.305667, 0.2065918, 1, 1, 1, 1, 1,
0.9933988, 1.357874, -0.3066241, 1, 1, 1, 1, 1,
1.00163, 0.2575133, 2.641559, 1, 1, 1, 1, 1,
1.002293, 0.6918753, -2.210236, 1, 1, 1, 1, 1,
1.004917, -0.7774429, 3.02685, 1, 1, 1, 1, 1,
1.007835, -0.4231869, 1.727337, 1, 1, 1, 1, 1,
1.009722, 1.44182, 0.004263532, 1, 1, 1, 1, 1,
1.010161, -1.514442, 2.01019, 1, 1, 1, 1, 1,
1.011084, -0.6303509, 1.460046, 1, 1, 1, 1, 1,
1.013536, -0.9253206, 1.95999, 1, 1, 1, 1, 1,
1.017062, 0.2918404, 1.877406, 0, 0, 1, 1, 1,
1.03912, 0.6302723, 0.03887896, 1, 0, 0, 1, 1,
1.040342, 0.3571941, 1.204806, 1, 0, 0, 1, 1,
1.050935, -0.8467777, 2.692091, 1, 0, 0, 1, 1,
1.057665, -0.6262715, 1.234837, 1, 0, 0, 1, 1,
1.060969, -1.117442, -0.1196684, 1, 0, 0, 1, 1,
1.070448, -0.2659597, 3.894677, 0, 0, 0, 1, 1,
1.074685, 0.3665202, -0.2489407, 0, 0, 0, 1, 1,
1.08079, -1.02511, 3.654839, 0, 0, 0, 1, 1,
1.085867, 1.393797, 0.6820095, 0, 0, 0, 1, 1,
1.091247, -0.7999443, 2.485715, 0, 0, 0, 1, 1,
1.092527, 0.1210464, 0.5185644, 0, 0, 0, 1, 1,
1.094937, 0.6930962, 0.4707593, 0, 0, 0, 1, 1,
1.095673, 0.4536837, 1.25059, 1, 1, 1, 1, 1,
1.099316, -0.8978297, 2.421531, 1, 1, 1, 1, 1,
1.099466, 0.1603748, 2.458373, 1, 1, 1, 1, 1,
1.110893, -0.4108847, 1.080221, 1, 1, 1, 1, 1,
1.116771, 1.55735, -0.8423811, 1, 1, 1, 1, 1,
1.120438, -0.1052653, 1.357749, 1, 1, 1, 1, 1,
1.12707, -1.215251, 1.133547, 1, 1, 1, 1, 1,
1.127609, 0.5504504, 1.458342, 1, 1, 1, 1, 1,
1.131908, -0.2772542, 1.186809, 1, 1, 1, 1, 1,
1.134062, 0.3149764, 2.034214, 1, 1, 1, 1, 1,
1.135469, 0.02688421, 1.371191, 1, 1, 1, 1, 1,
1.139365, 0.1069528, 2.187837, 1, 1, 1, 1, 1,
1.140402, -1.410012, 3.043243, 1, 1, 1, 1, 1,
1.142918, 0.7172502, 0.8235457, 1, 1, 1, 1, 1,
1.153851, -0.3604017, 1.459916, 1, 1, 1, 1, 1,
1.15515, 0.7159436, 1.295702, 0, 0, 1, 1, 1,
1.155957, 1.21607, 1.155752, 1, 0, 0, 1, 1,
1.159619, -0.508757, 3.01892, 1, 0, 0, 1, 1,
1.167321, 0.3572177, 0.606061, 1, 0, 0, 1, 1,
1.176906, -0.1836068, 1.30285, 1, 0, 0, 1, 1,
1.177696, -1.230388, 3.621973, 1, 0, 0, 1, 1,
1.182152, -0.6641747, 2.175146, 0, 0, 0, 1, 1,
1.185966, -0.3118005, 0.8790513, 0, 0, 0, 1, 1,
1.190663, 0.7524812, -1.483994, 0, 0, 0, 1, 1,
1.195851, 1.149241, 0.4076897, 0, 0, 0, 1, 1,
1.199689, 1.795171, -1.963768, 0, 0, 0, 1, 1,
1.205452, -1.472338, 2.870464, 0, 0, 0, 1, 1,
1.206117, 0.8316566, 3.527337, 0, 0, 0, 1, 1,
1.231996, 0.1583176, 1.028955, 1, 1, 1, 1, 1,
1.237207, -0.6779342, 4.165072, 1, 1, 1, 1, 1,
1.249261, -1.230405, 2.105304, 1, 1, 1, 1, 1,
1.255093, 0.3625676, 1.68987, 1, 1, 1, 1, 1,
1.257657, 0.9099494, -2.862873, 1, 1, 1, 1, 1,
1.265268, -0.4603016, 2.624659, 1, 1, 1, 1, 1,
1.267052, 0.4794136, 1.848499, 1, 1, 1, 1, 1,
1.271867, 1.078576, -1.401857, 1, 1, 1, 1, 1,
1.272731, 1.632349, 2.544882, 1, 1, 1, 1, 1,
1.282053, 1.233921, 1.093928, 1, 1, 1, 1, 1,
1.286509, 0.2519112, 0.9349695, 1, 1, 1, 1, 1,
1.286983, -0.1972449, 1.165329, 1, 1, 1, 1, 1,
1.290631, 0.8715101, 3.0453, 1, 1, 1, 1, 1,
1.298126, -1.71709, 3.828856, 1, 1, 1, 1, 1,
1.299347, 0.1533945, 3.188915, 1, 1, 1, 1, 1,
1.305856, -1.745462, 2.274121, 0, 0, 1, 1, 1,
1.309349, 0.4758112, 0.7128423, 1, 0, 0, 1, 1,
1.312036, -1.562819, 2.120382, 1, 0, 0, 1, 1,
1.331652, -1.471104, 2.064251, 1, 0, 0, 1, 1,
1.331862, 1.266061, 1.407321, 1, 0, 0, 1, 1,
1.333145, -0.9742571, 0.8579854, 1, 0, 0, 1, 1,
1.338997, -0.9999514, 1.396939, 0, 0, 0, 1, 1,
1.340709, 1.26901, -0.3646415, 0, 0, 0, 1, 1,
1.342253, -0.06998999, 1.110126, 0, 0, 0, 1, 1,
1.342386, 1.244314, 0.04329658, 0, 0, 0, 1, 1,
1.343085, 0.6602211, 0.8147007, 0, 0, 0, 1, 1,
1.34928, -0.2233983, 2.185841, 0, 0, 0, 1, 1,
1.35451, -0.7304733, 1.182514, 0, 0, 0, 1, 1,
1.358748, 0.6361895, 1.322874, 1, 1, 1, 1, 1,
1.359481, -0.8661777, 2.860873, 1, 1, 1, 1, 1,
1.36255, -0.005996976, 1.420779, 1, 1, 1, 1, 1,
1.367521, 0.581768, 0.7525174, 1, 1, 1, 1, 1,
1.371549, 0.1582269, 1.108123, 1, 1, 1, 1, 1,
1.377963, 0.8102143, 0.4325557, 1, 1, 1, 1, 1,
1.380931, 0.3875583, 2.421293, 1, 1, 1, 1, 1,
1.381763, 0.1991812, 3.579213, 1, 1, 1, 1, 1,
1.385116, -0.6068583, 1.828804, 1, 1, 1, 1, 1,
1.389729, -0.1678858, 1.195553, 1, 1, 1, 1, 1,
1.391951, -0.7506121, 1.394064, 1, 1, 1, 1, 1,
1.391976, -0.5760578, 2.085419, 1, 1, 1, 1, 1,
1.399424, 0.2634469, 1.223114, 1, 1, 1, 1, 1,
1.418397, -1.126636, 0.7756546, 1, 1, 1, 1, 1,
1.45043, 1.042296, -0.2847457, 1, 1, 1, 1, 1,
1.45517, -1.349328, 4.047664, 0, 0, 1, 1, 1,
1.464045, -0.8113565, 2.060467, 1, 0, 0, 1, 1,
1.470452, -0.03739612, 3.472981, 1, 0, 0, 1, 1,
1.474544, 1.192855, 2.691785, 1, 0, 0, 1, 1,
1.483194, 0.9843171, 0.9546202, 1, 0, 0, 1, 1,
1.495107, -0.05262774, 2.33386, 1, 0, 0, 1, 1,
1.509072, -0.1680878, 0.3584366, 0, 0, 0, 1, 1,
1.512107, 0.3080727, 0.579696, 0, 0, 0, 1, 1,
1.521711, 0.7177975, 1.547624, 0, 0, 0, 1, 1,
1.536382, 0.1752056, 1.052464, 0, 0, 0, 1, 1,
1.544142, 0.8234245, 0.2515547, 0, 0, 0, 1, 1,
1.549828, -0.02764677, 1.23866, 0, 0, 0, 1, 1,
1.552735, 2.136878, 0.1436134, 0, 0, 0, 1, 1,
1.556702, 0.6553499, 0.4334271, 1, 1, 1, 1, 1,
1.55699, -2.585646, 1.760376, 1, 1, 1, 1, 1,
1.571212, 2.152332, 0.3709491, 1, 1, 1, 1, 1,
1.57309, 0.8078601, 1.716293, 1, 1, 1, 1, 1,
1.577663, -0.1348143, 3.145892, 1, 1, 1, 1, 1,
1.582843, 0.4757441, 0.3607154, 1, 1, 1, 1, 1,
1.595083, -1.980607, 1.131292, 1, 1, 1, 1, 1,
1.603739, -0.9925067, 4.571262, 1, 1, 1, 1, 1,
1.604051, -0.9161498, 0.3370932, 1, 1, 1, 1, 1,
1.604604, -0.6464017, 1.103038, 1, 1, 1, 1, 1,
1.615707, 0.9013669, 0.7694807, 1, 1, 1, 1, 1,
1.616649, 0.7481812, 0.2759531, 1, 1, 1, 1, 1,
1.622167, 0.2277298, 1.349867, 1, 1, 1, 1, 1,
1.638608, 0.5628914, 0.7408448, 1, 1, 1, 1, 1,
1.643484, -0.8773513, 3.625182, 1, 1, 1, 1, 1,
1.695674, -0.6048974, 2.898805, 0, 0, 1, 1, 1,
1.714817, 1.333544, 0.3212786, 1, 0, 0, 1, 1,
1.729014, -0.2344296, 2.022889, 1, 0, 0, 1, 1,
1.731287, -0.1437498, 1.394163, 1, 0, 0, 1, 1,
1.733753, -0.6837647, 0.7716517, 1, 0, 0, 1, 1,
1.749387, -0.6282988, 1.565132, 1, 0, 0, 1, 1,
1.762803, -1.180897, 0.3201404, 0, 0, 0, 1, 1,
1.765654, 1.108686, 0.9860515, 0, 0, 0, 1, 1,
1.766621, -0.5785585, 1.847067, 0, 0, 0, 1, 1,
1.780167, 1.302809, 0.8687992, 0, 0, 0, 1, 1,
1.807394, -0.520041, 2.616188, 0, 0, 0, 1, 1,
1.816069, -0.7440006, 0.774606, 0, 0, 0, 1, 1,
1.816712, 0.9272866, 1.485547, 0, 0, 0, 1, 1,
1.818437, 1.382546, 1.756797, 1, 1, 1, 1, 1,
1.82585, -0.2252692, 1.858915, 1, 1, 1, 1, 1,
1.833591, 0.5565353, 1.89069, 1, 1, 1, 1, 1,
1.843271, 0.7404401, 1.497872, 1, 1, 1, 1, 1,
1.869004, 0.84736, 0.4668616, 1, 1, 1, 1, 1,
1.87003, 0.972374, -0.0601203, 1, 1, 1, 1, 1,
1.882415, 0.1645458, 2.379024, 1, 1, 1, 1, 1,
1.908348, -0.4019726, 1.56957, 1, 1, 1, 1, 1,
1.909199, 0.6158469, 0.6205087, 1, 1, 1, 1, 1,
1.949904, -1.08678, 0.8437081, 1, 1, 1, 1, 1,
1.955291, 0.8946924, 1.475144, 1, 1, 1, 1, 1,
1.962291, 0.5537709, 0.736101, 1, 1, 1, 1, 1,
1.966965, 0.1944582, 1.53096, 1, 1, 1, 1, 1,
1.977039, -0.8763014, 2.327939, 1, 1, 1, 1, 1,
1.982637, 0.2950991, 1.224412, 1, 1, 1, 1, 1,
2.081889, -1.354305, 3.461137, 0, 0, 1, 1, 1,
2.108349, -0.7315784, 2.495154, 1, 0, 0, 1, 1,
2.110862, -0.08975137, 2.095078, 1, 0, 0, 1, 1,
2.120452, 0.3653848, 1.611499, 1, 0, 0, 1, 1,
2.172557, -3.786086, 3.486895, 1, 0, 0, 1, 1,
2.233392, 0.507928, 2.255779, 1, 0, 0, 1, 1,
2.256823, -2.585671, 2.914884, 0, 0, 0, 1, 1,
2.276168, -1.105094, 2.31785, 0, 0, 0, 1, 1,
2.294779, -0.9443411, 2.599245, 0, 0, 0, 1, 1,
2.374915, 1.262531, -0.2546357, 0, 0, 0, 1, 1,
2.387608, -0.009818869, 0.2293301, 0, 0, 0, 1, 1,
2.410362, -0.1284994, 1.170813, 0, 0, 0, 1, 1,
2.418952, 1.163022, 1.175168, 0, 0, 0, 1, 1,
2.489068, 2.412908, 0.7728156, 1, 1, 1, 1, 1,
2.503402, -0.9055047, 2.842007, 1, 1, 1, 1, 1,
2.542856, 0.8532271, 2.208, 1, 1, 1, 1, 1,
2.71882, -1.161869, 0.4282176, 1, 1, 1, 1, 1,
2.721169, 1.652059, 0.5177029, 1, 1, 1, 1, 1,
2.740535, 1.814278, 2.946435, 1, 1, 1, 1, 1,
3.406167, -0.7755461, 1.146472, 1, 1, 1, 1, 1
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
var radius = 9.992224;
var distance = 35.09726;
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
mvMatrix.translate( -0.3572607, 0.2708693, 0.6082878 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.09726);
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
