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
-3.445615, -0.369625, -1.579921, 1, 0, 0, 1,
-3.006227, -0.4944153, -0.6499497, 1, 0.007843138, 0, 1,
-2.871212, -0.1361867, -0.7855509, 1, 0.01176471, 0, 1,
-2.742836, -0.4751418, -1.305911, 1, 0.01960784, 0, 1,
-2.648219, 0.2304271, -2.277663, 1, 0.02352941, 0, 1,
-2.528551, 0.3923724, -1.964926, 1, 0.03137255, 0, 1,
-2.457158, -0.3494881, -1.282267, 1, 0.03529412, 0, 1,
-2.398919, 1.16301, -1.12565, 1, 0.04313726, 0, 1,
-2.276079, -0.2483921, -0.8629926, 1, 0.04705882, 0, 1,
-2.255873, -0.7393478, -3.821513, 1, 0.05490196, 0, 1,
-2.238378, -1.550318, -1.411038, 1, 0.05882353, 0, 1,
-2.162269, 0.2443673, -1.65572, 1, 0.06666667, 0, 1,
-2.160586, 1.282404, -0.9773816, 1, 0.07058824, 0, 1,
-2.156899, -0.5169648, -1.672866, 1, 0.07843138, 0, 1,
-2.147527, 0.1626427, -1.494627, 1, 0.08235294, 0, 1,
-2.142207, -1.069862, -0.7929273, 1, 0.09019608, 0, 1,
-2.14013, -0.3760549, -1.741686, 1, 0.09411765, 0, 1,
-2.116671, 0.06708726, -1.186228, 1, 0.1019608, 0, 1,
-2.061441, 1.783487, -1.307616, 1, 0.1098039, 0, 1,
-2.007823, -0.1632477, -1.297664, 1, 0.1137255, 0, 1,
-1.995337, -1.330694, -1.402497, 1, 0.1215686, 0, 1,
-1.9912, 0.7562724, -1.211583, 1, 0.1254902, 0, 1,
-1.972159, -2.353482, -2.05199, 1, 0.1333333, 0, 1,
-1.964275, -0.6327195, -1.472073, 1, 0.1372549, 0, 1,
-1.942672, -0.6552271, -1.86067, 1, 0.145098, 0, 1,
-1.931073, 0.6863042, -1.953952, 1, 0.1490196, 0, 1,
-1.908826, 0.9775838, -1.359166, 1, 0.1568628, 0, 1,
-1.883528, -1.258718, -1.090782, 1, 0.1607843, 0, 1,
-1.868819, -0.5109788, -1.616166, 1, 0.1686275, 0, 1,
-1.862561, 0.1587317, -2.667177, 1, 0.172549, 0, 1,
-1.857263, -0.6117563, -1.795185, 1, 0.1803922, 0, 1,
-1.847124, 0.7613674, -2.430194, 1, 0.1843137, 0, 1,
-1.814418, 1.178511, -0.07061356, 1, 0.1921569, 0, 1,
-1.812706, 1.281046, 0.4409959, 1, 0.1960784, 0, 1,
-1.762436, 0.4055505, -3.011023, 1, 0.2039216, 0, 1,
-1.760748, 1.989758, -0.5041581, 1, 0.2117647, 0, 1,
-1.755122, 0.01202181, -1.505828, 1, 0.2156863, 0, 1,
-1.738814, -0.202915, 0.04996722, 1, 0.2235294, 0, 1,
-1.731747, 0.7376696, -1.332623, 1, 0.227451, 0, 1,
-1.721187, -0.2506022, -2.469256, 1, 0.2352941, 0, 1,
-1.712492, 0.915504, -1.076252, 1, 0.2392157, 0, 1,
-1.706245, 0.05080581, -0.7603729, 1, 0.2470588, 0, 1,
-1.701668, -0.688454, -3.788938, 1, 0.2509804, 0, 1,
-1.6881, 0.5311434, -1.86923, 1, 0.2588235, 0, 1,
-1.682203, 0.3484426, -0.268613, 1, 0.2627451, 0, 1,
-1.674376, 0.6739173, -1.703219, 1, 0.2705882, 0, 1,
-1.672878, 0.05593003, -2.075555, 1, 0.2745098, 0, 1,
-1.669394, 0.2926717, -1.744585, 1, 0.282353, 0, 1,
-1.667729, -0.8996661, -1.952254, 1, 0.2862745, 0, 1,
-1.665267, -0.1765413, 0.09870463, 1, 0.2941177, 0, 1,
-1.655442, -0.2030428, -0.5474789, 1, 0.3019608, 0, 1,
-1.650092, -0.04660753, -1.380559, 1, 0.3058824, 0, 1,
-1.640027, 0.6277872, -0.366976, 1, 0.3137255, 0, 1,
-1.635057, -0.7428454, -1.167442, 1, 0.3176471, 0, 1,
-1.629261, 1.135605, -2.395986, 1, 0.3254902, 0, 1,
-1.620144, -0.5809976, -4.023464, 1, 0.3294118, 0, 1,
-1.615489, 0.2980967, -1.015948, 1, 0.3372549, 0, 1,
-1.612529, -1.093235, -3.203242, 1, 0.3411765, 0, 1,
-1.610092, 1.877944, -0.2582902, 1, 0.3490196, 0, 1,
-1.604027, 0.02329457, -0.3176954, 1, 0.3529412, 0, 1,
-1.5914, -0.7623833, -1.147483, 1, 0.3607843, 0, 1,
-1.56434, 0.6565235, -1.200086, 1, 0.3647059, 0, 1,
-1.558378, -0.6588959, -1.562279, 1, 0.372549, 0, 1,
-1.54634, 0.1903206, -2.619437, 1, 0.3764706, 0, 1,
-1.52752, 1.154735, -1.473844, 1, 0.3843137, 0, 1,
-1.522912, -1.36905, -3.321241, 1, 0.3882353, 0, 1,
-1.51633, 0.8870728, -1.953374, 1, 0.3960784, 0, 1,
-1.502171, -1.120471, -2.854264, 1, 0.4039216, 0, 1,
-1.490792, 0.2635294, -0.4116006, 1, 0.4078431, 0, 1,
-1.480935, 0.8276978, -1.175153, 1, 0.4156863, 0, 1,
-1.475833, -0.7216582, -2.571976, 1, 0.4196078, 0, 1,
-1.465828, 1.105278, 0.5444707, 1, 0.427451, 0, 1,
-1.460117, 1.708576, -0.7856492, 1, 0.4313726, 0, 1,
-1.446429, 0.6151243, -1.95761, 1, 0.4392157, 0, 1,
-1.438612, 1.106555, -1.267262, 1, 0.4431373, 0, 1,
-1.436993, 0.4744657, -1.763704, 1, 0.4509804, 0, 1,
-1.428474, 0.4362009, 0.1750882, 1, 0.454902, 0, 1,
-1.418152, -0.3707782, -0.7866623, 1, 0.4627451, 0, 1,
-1.415265, 1.318517, -1.937222, 1, 0.4666667, 0, 1,
-1.401297, 0.3378852, -2.640322, 1, 0.4745098, 0, 1,
-1.399013, 0.9477752, 0.9148167, 1, 0.4784314, 0, 1,
-1.397416, 1.087396, -2.223117, 1, 0.4862745, 0, 1,
-1.393208, -1.58218, -3.242085, 1, 0.4901961, 0, 1,
-1.382663, 0.2221422, -0.1332327, 1, 0.4980392, 0, 1,
-1.380399, 0.5359645, -1.46478, 1, 0.5058824, 0, 1,
-1.380339, 1.220448, -0.1941577, 1, 0.509804, 0, 1,
-1.374677, 0.53004, -0.5045803, 1, 0.5176471, 0, 1,
-1.371468, 0.3466131, -2.694008, 1, 0.5215687, 0, 1,
-1.363049, -1.598612, -3.831153, 1, 0.5294118, 0, 1,
-1.358017, -1.012026, -1.951481, 1, 0.5333334, 0, 1,
-1.353361, 1.826464, -0.2406002, 1, 0.5411765, 0, 1,
-1.353016, 0.6199596, -3.562859, 1, 0.5450981, 0, 1,
-1.336066, -0.4530276, -1.459899, 1, 0.5529412, 0, 1,
-1.332104, 0.941142, -1.457163, 1, 0.5568628, 0, 1,
-1.314041, -0.3409589, -1.085655, 1, 0.5647059, 0, 1,
-1.311946, 0.18983, -0.9444269, 1, 0.5686275, 0, 1,
-1.311322, -0.1714439, -1.797434, 1, 0.5764706, 0, 1,
-1.31075, 0.08707434, -2.932465, 1, 0.5803922, 0, 1,
-1.293224, -0.1611486, -0.7734514, 1, 0.5882353, 0, 1,
-1.290076, 1.099713, -3.353982, 1, 0.5921569, 0, 1,
-1.281262, -0.2331214, -3.940125, 1, 0.6, 0, 1,
-1.279052, 0.4755099, -1.170439, 1, 0.6078432, 0, 1,
-1.274183, 0.2469388, -3.30949, 1, 0.6117647, 0, 1,
-1.272836, 0.5216563, -0.8305844, 1, 0.6196079, 0, 1,
-1.265565, 0.3901273, 0.07965242, 1, 0.6235294, 0, 1,
-1.263514, 1.394467, -1.466541, 1, 0.6313726, 0, 1,
-1.254792, 0.7339729, -0.5105734, 1, 0.6352941, 0, 1,
-1.250845, 0.9657907, -2.436355, 1, 0.6431373, 0, 1,
-1.249809, 0.1646588, -1.138103, 1, 0.6470588, 0, 1,
-1.249397, 0.8120223, -0.3926905, 1, 0.654902, 0, 1,
-1.245656, 0.08471023, -1.784185, 1, 0.6588235, 0, 1,
-1.243664, 0.4965016, -1.515077, 1, 0.6666667, 0, 1,
-1.235546, 0.3409753, -0.9385728, 1, 0.6705883, 0, 1,
-1.229076, -1.336511, -0.9216416, 1, 0.6784314, 0, 1,
-1.225257, -0.703186, -1.100723, 1, 0.682353, 0, 1,
-1.222262, 0.8069718, -0.3228027, 1, 0.6901961, 0, 1,
-1.20833, -1.392307, -1.313522, 1, 0.6941177, 0, 1,
-1.205001, 0.7271906, 0.4497613, 1, 0.7019608, 0, 1,
-1.20087, -0.2110091, -1.142169, 1, 0.7098039, 0, 1,
-1.192955, -2.007668, -4.038633, 1, 0.7137255, 0, 1,
-1.190077, -0.04790697, -2.727928, 1, 0.7215686, 0, 1,
-1.189585, 1.20854, -0.8982073, 1, 0.7254902, 0, 1,
-1.182142, 1.351678, -2.582499, 1, 0.7333333, 0, 1,
-1.172186, 0.5441008, -0.2005277, 1, 0.7372549, 0, 1,
-1.170978, -0.527669, -1.920065, 1, 0.7450981, 0, 1,
-1.160813, 0.9290759, -0.5486256, 1, 0.7490196, 0, 1,
-1.156853, -1.505241, -1.446564, 1, 0.7568628, 0, 1,
-1.155031, -0.8429495, -2.743486, 1, 0.7607843, 0, 1,
-1.152961, -1.729208, -2.962746, 1, 0.7686275, 0, 1,
-1.152493, 1.751149, -0.2809588, 1, 0.772549, 0, 1,
-1.144248, -0.09149544, -2.235989, 1, 0.7803922, 0, 1,
-1.142125, 0.3067015, -1.996674, 1, 0.7843137, 0, 1,
-1.140027, 0.366581, -1.021867, 1, 0.7921569, 0, 1,
-1.127649, 1.652163, -1.713656, 1, 0.7960784, 0, 1,
-1.127255, 1.846833, -0.3118322, 1, 0.8039216, 0, 1,
-1.124552, 0.03518907, -2.787544, 1, 0.8117647, 0, 1,
-1.120357, -0.3733581, -3.145194, 1, 0.8156863, 0, 1,
-1.114705, 0.2371526, -3.397151, 1, 0.8235294, 0, 1,
-1.110015, 0.3919131, -1.335787, 1, 0.827451, 0, 1,
-1.109387, -1.27638, -3.067091, 1, 0.8352941, 0, 1,
-1.103963, -0.4096072, -0.05274522, 1, 0.8392157, 0, 1,
-1.098927, 2.004677, -0.7215282, 1, 0.8470588, 0, 1,
-1.095739, -1.3896, -2.665496, 1, 0.8509804, 0, 1,
-1.092408, 0.1157495, -1.591456, 1, 0.8588235, 0, 1,
-1.091418, -0.05854723, -1.220222, 1, 0.8627451, 0, 1,
-1.089861, 0.0918039, -0.6228321, 1, 0.8705882, 0, 1,
-1.088739, 0.4653701, -0.06823123, 1, 0.8745098, 0, 1,
-1.086393, 1.408635, -1.473216, 1, 0.8823529, 0, 1,
-1.074009, 0.1202973, -2.272698, 1, 0.8862745, 0, 1,
-1.068362, 1.028085, 0.0729445, 1, 0.8941177, 0, 1,
-1.067256, 0.5028132, -1.688077, 1, 0.8980392, 0, 1,
-1.067011, -0.4190356, -2.732581, 1, 0.9058824, 0, 1,
-1.058296, 0.8040823, -2.660082, 1, 0.9137255, 0, 1,
-1.042485, -1.349838, -2.409262, 1, 0.9176471, 0, 1,
-1.041444, 0.9351057, -1.128008, 1, 0.9254902, 0, 1,
-1.041429, 1.048018, 0.1488466, 1, 0.9294118, 0, 1,
-1.039447, -1.58664, -0.9283984, 1, 0.9372549, 0, 1,
-1.029086, 1.252572, 0.363219, 1, 0.9411765, 0, 1,
-1.028355, 1.29195, -2.036934, 1, 0.9490196, 0, 1,
-1.028273, -2.272543, -0.2638118, 1, 0.9529412, 0, 1,
-1.018352, -0.9539072, -0.1985468, 1, 0.9607843, 0, 1,
-1.014249, -0.1543714, -0.4382585, 1, 0.9647059, 0, 1,
-1.01407, -1.285544, -0.9958909, 1, 0.972549, 0, 1,
-1.007377, 0.3912893, -0.4932261, 1, 0.9764706, 0, 1,
-1.00551, 1.166197, 0.5457671, 1, 0.9843137, 0, 1,
-1.000516, 0.9341217, -1.245216, 1, 0.9882353, 0, 1,
-0.9965009, 0.6245367, -1.106552, 1, 0.9960784, 0, 1,
-0.9872835, -0.7159379, -1.072493, 0.9960784, 1, 0, 1,
-0.9836618, -0.7423051, -2.901934, 0.9921569, 1, 0, 1,
-0.9829651, 0.6825284, -2.025004, 0.9843137, 1, 0, 1,
-0.9806575, 1.585185, 0.05282893, 0.9803922, 1, 0, 1,
-0.9792559, 0.3153063, -0.2174366, 0.972549, 1, 0, 1,
-0.9775408, 0.2565587, 0.4777462, 0.9686275, 1, 0, 1,
-0.9760427, -0.1619201, -2.167986, 0.9607843, 1, 0, 1,
-0.9696189, -0.06063139, -0.7511144, 0.9568627, 1, 0, 1,
-0.9692729, 0.4854902, -0.2071446, 0.9490196, 1, 0, 1,
-0.9687742, -0.5778811, -2.964247, 0.945098, 1, 0, 1,
-0.960477, -0.6011985, -2.39445, 0.9372549, 1, 0, 1,
-0.9583386, -0.1122394, -1.516418, 0.9333333, 1, 0, 1,
-0.9548217, -2.876637, -3.686924, 0.9254902, 1, 0, 1,
-0.9540823, 1.494132, -2.557669, 0.9215686, 1, 0, 1,
-0.9514274, 0.4894778, -0.1827173, 0.9137255, 1, 0, 1,
-0.9508587, -0.1970652, -2.165521, 0.9098039, 1, 0, 1,
-0.947172, -0.4051267, -3.472604, 0.9019608, 1, 0, 1,
-0.9464683, 0.0005527907, -2.273071, 0.8941177, 1, 0, 1,
-0.9454848, -0.8692882, -0.8175623, 0.8901961, 1, 0, 1,
-0.9450208, 1.118548, -1.29959, 0.8823529, 1, 0, 1,
-0.9364195, -0.09725915, -2.960354, 0.8784314, 1, 0, 1,
-0.9323629, 1.510625, -0.8605571, 0.8705882, 1, 0, 1,
-0.9289095, 0.333174, -1.618636, 0.8666667, 1, 0, 1,
-0.9272751, 1.702584, -1.084787, 0.8588235, 1, 0, 1,
-0.9271908, 1.347805, -0.48963, 0.854902, 1, 0, 1,
-0.9259585, -0.3859101, -1.0224, 0.8470588, 1, 0, 1,
-0.9259313, 0.03096831, -1.318739, 0.8431373, 1, 0, 1,
-0.9225758, 0.2773448, -1.028365, 0.8352941, 1, 0, 1,
-0.9173117, 0.9093392, -0.8291016, 0.8313726, 1, 0, 1,
-0.9119321, -1.068022, -0.490135, 0.8235294, 1, 0, 1,
-0.910419, 0.01913995, -1.772458, 0.8196079, 1, 0, 1,
-0.9049476, -0.22439, -0.7225771, 0.8117647, 1, 0, 1,
-0.9037653, 0.7161235, -2.099231, 0.8078431, 1, 0, 1,
-0.9028655, 0.8405393, -1.593103, 0.8, 1, 0, 1,
-0.8927293, 2.861397, -0.4220957, 0.7921569, 1, 0, 1,
-0.8883414, -0.2685288, -1.624175, 0.7882353, 1, 0, 1,
-0.8677869, -1.705085, -3.201938, 0.7803922, 1, 0, 1,
-0.8630015, 1.004231, -1.56893, 0.7764706, 1, 0, 1,
-0.8567586, 0.6355951, 0.7455845, 0.7686275, 1, 0, 1,
-0.855545, 0.5896271, -1.263396, 0.7647059, 1, 0, 1,
-0.8462593, 2.054963, -0.03391167, 0.7568628, 1, 0, 1,
-0.8362613, 0.7200161, 0.09575896, 0.7529412, 1, 0, 1,
-0.8330502, -0.3002675, -2.773896, 0.7450981, 1, 0, 1,
-0.8239029, 1.119527, -0.09935483, 0.7411765, 1, 0, 1,
-0.8189513, -1.225693, -0.07354121, 0.7333333, 1, 0, 1,
-0.8168722, 0.428501, -1.740549, 0.7294118, 1, 0, 1,
-0.8132718, -2.009524, -3.029478, 0.7215686, 1, 0, 1,
-0.8071597, -0.7333741, -2.288811, 0.7176471, 1, 0, 1,
-0.8065285, -0.3416231, -2.642766, 0.7098039, 1, 0, 1,
-0.8057794, -2.463368, -3.256263, 0.7058824, 1, 0, 1,
-0.7995856, -0.1920878, -0.6437334, 0.6980392, 1, 0, 1,
-0.7979371, 1.138453, -1.318705, 0.6901961, 1, 0, 1,
-0.7911443, -0.2461107, -2.078018, 0.6862745, 1, 0, 1,
-0.7908944, -0.4836251, -2.928244, 0.6784314, 1, 0, 1,
-0.7881197, 1.044604, -0.4457752, 0.6745098, 1, 0, 1,
-0.7849007, 1.083002, -0.1903054, 0.6666667, 1, 0, 1,
-0.7825961, 0.5819785, -0.8598975, 0.6627451, 1, 0, 1,
-0.7807373, -0.123989, 0.3762125, 0.654902, 1, 0, 1,
-0.780268, -0.164554, -1.780708, 0.6509804, 1, 0, 1,
-0.7786359, -2.483446, -1.449656, 0.6431373, 1, 0, 1,
-0.7740039, -0.7610635, -5.002074, 0.6392157, 1, 0, 1,
-0.7737518, -0.3440907, -2.725041, 0.6313726, 1, 0, 1,
-0.769412, -1.908201, -2.591125, 0.627451, 1, 0, 1,
-0.764226, 1.504952, -0.2465536, 0.6196079, 1, 0, 1,
-0.7610911, -0.924279, -1.904544, 0.6156863, 1, 0, 1,
-0.7497175, 2.405525, -0.2454101, 0.6078432, 1, 0, 1,
-0.7451435, -0.1320612, -1.112751, 0.6039216, 1, 0, 1,
-0.7421664, -0.8505722, -3.476526, 0.5960785, 1, 0, 1,
-0.7391391, -0.4557588, -4.609465, 0.5882353, 1, 0, 1,
-0.7372068, 0.7003903, -2.285066, 0.5843138, 1, 0, 1,
-0.7310305, -0.2632686, -1.891503, 0.5764706, 1, 0, 1,
-0.7265258, 0.4072652, -1.482865, 0.572549, 1, 0, 1,
-0.7197034, -3.180142, -0.1433074, 0.5647059, 1, 0, 1,
-0.7149571, 0.1430941, -0.03227717, 0.5607843, 1, 0, 1,
-0.7148882, -1.031613, -4.826228, 0.5529412, 1, 0, 1,
-0.7093971, 0.03247339, -2.120147, 0.5490196, 1, 0, 1,
-0.7038055, -0.9739925, -3.133601, 0.5411765, 1, 0, 1,
-0.7017045, -1.059362, -3.010889, 0.5372549, 1, 0, 1,
-0.7010954, -1.259783, -3.18554, 0.5294118, 1, 0, 1,
-0.7000077, -0.5730604, -3.475083, 0.5254902, 1, 0, 1,
-0.6951934, 0.1677578, -0.4650485, 0.5176471, 1, 0, 1,
-0.692839, -0.2565286, -1.467616, 0.5137255, 1, 0, 1,
-0.6897628, 0.5443677, 0.6375043, 0.5058824, 1, 0, 1,
-0.6881326, -0.3858524, -2.77562, 0.5019608, 1, 0, 1,
-0.6803058, 0.4837422, 0.1400756, 0.4941176, 1, 0, 1,
-0.6796941, 1.137265, -0.3594097, 0.4862745, 1, 0, 1,
-0.678857, -1.896108, -3.25725, 0.4823529, 1, 0, 1,
-0.6782526, -0.2626077, -2.78518, 0.4745098, 1, 0, 1,
-0.677897, -1.456707, -3.49249, 0.4705882, 1, 0, 1,
-0.6774786, -0.0123269, -2.716712, 0.4627451, 1, 0, 1,
-0.6770296, 0.8805645, -0.9534717, 0.4588235, 1, 0, 1,
-0.6766568, 0.595322, -1.069223, 0.4509804, 1, 0, 1,
-0.6764018, 0.2207194, -2.430385, 0.4470588, 1, 0, 1,
-0.6684341, 0.9131732, -1.904345, 0.4392157, 1, 0, 1,
-0.667972, -2.02903, -3.369815, 0.4352941, 1, 0, 1,
-0.6674036, 0.5456805, -1.414155, 0.427451, 1, 0, 1,
-0.6667534, -0.6926835, -1.732122, 0.4235294, 1, 0, 1,
-0.6631379, 0.4080689, -2.336535, 0.4156863, 1, 0, 1,
-0.6622158, 0.3767229, -2.326573, 0.4117647, 1, 0, 1,
-0.6603578, 0.5323782, -0.4085168, 0.4039216, 1, 0, 1,
-0.6602181, 0.9436919, -0.5057437, 0.3960784, 1, 0, 1,
-0.6577738, -1.548609, -2.77786, 0.3921569, 1, 0, 1,
-0.6569896, -0.4321832, -1.667528, 0.3843137, 1, 0, 1,
-0.6544827, 0.432413, -2.791634, 0.3803922, 1, 0, 1,
-0.654342, -0.3643728, -2.535283, 0.372549, 1, 0, 1,
-0.6505293, 0.1721347, -1.400409, 0.3686275, 1, 0, 1,
-0.6472485, 0.294387, -1.681192, 0.3607843, 1, 0, 1,
-0.6464691, -1.674952, -1.97067, 0.3568628, 1, 0, 1,
-0.6415074, -0.1301202, -2.352773, 0.3490196, 1, 0, 1,
-0.6405776, 0.4277112, -1.364627, 0.345098, 1, 0, 1,
-0.639407, -0.6225848, -2.851498, 0.3372549, 1, 0, 1,
-0.6371624, -0.06028367, -0.3196887, 0.3333333, 1, 0, 1,
-0.6325943, 0.1466723, -2.295612, 0.3254902, 1, 0, 1,
-0.630209, -0.9459078, -2.04275, 0.3215686, 1, 0, 1,
-0.6257547, 1.054027, -1.556564, 0.3137255, 1, 0, 1,
-0.6243746, 0.07195938, -1.249396, 0.3098039, 1, 0, 1,
-0.6209994, 1.106414, 0.6403888, 0.3019608, 1, 0, 1,
-0.6188431, 1.812604, -0.5301701, 0.2941177, 1, 0, 1,
-0.6165819, -0.338306, -3.675478, 0.2901961, 1, 0, 1,
-0.6133753, -1.31012, -3.372293, 0.282353, 1, 0, 1,
-0.6105046, 1.737716, 1.498515, 0.2784314, 1, 0, 1,
-0.6036994, -1.107568, -2.630148, 0.2705882, 1, 0, 1,
-0.5987542, 0.1948648, -1.985338, 0.2666667, 1, 0, 1,
-0.5977495, -0.0338724, -1.073635, 0.2588235, 1, 0, 1,
-0.5970298, -0.07837834, -2.20406, 0.254902, 1, 0, 1,
-0.5945594, -2.826034, -1.835213, 0.2470588, 1, 0, 1,
-0.5899914, -1.238097, -1.599186, 0.2431373, 1, 0, 1,
-0.5846516, 1.533078, -2.840509, 0.2352941, 1, 0, 1,
-0.5846374, 0.9368781, -0.04465941, 0.2313726, 1, 0, 1,
-0.5817158, -1.539612, -3.250333, 0.2235294, 1, 0, 1,
-0.5716243, 0.7043092, -2.797924, 0.2196078, 1, 0, 1,
-0.5707675, 0.005616349, -2.466247, 0.2117647, 1, 0, 1,
-0.569761, 0.2403522, -2.708522, 0.2078431, 1, 0, 1,
-0.5676242, -0.556369, -4.462074, 0.2, 1, 0, 1,
-0.5638301, 0.6067916, 1.476355, 0.1921569, 1, 0, 1,
-0.5619077, 0.2622122, -1.176323, 0.1882353, 1, 0, 1,
-0.559956, -0.9150402, -4.065649, 0.1803922, 1, 0, 1,
-0.55989, -1.9591, -3.137918, 0.1764706, 1, 0, 1,
-0.5588688, -0.004965721, -2.257626, 0.1686275, 1, 0, 1,
-0.5552742, 0.723781, 1.183435, 0.1647059, 1, 0, 1,
-0.5533153, -0.1941348, -2.222927, 0.1568628, 1, 0, 1,
-0.5461169, 2.043181, 0.9861791, 0.1529412, 1, 0, 1,
-0.5424652, 0.03529412, -0.6122685, 0.145098, 1, 0, 1,
-0.5383162, -0.5903721, -2.7568, 0.1411765, 1, 0, 1,
-0.5380732, 0.2167841, -0.06619379, 0.1333333, 1, 0, 1,
-0.5365359, -0.2814311, -1.65747, 0.1294118, 1, 0, 1,
-0.5358635, -1.285118, -4.220209, 0.1215686, 1, 0, 1,
-0.5330174, 1.18339, -0.6216868, 0.1176471, 1, 0, 1,
-0.5314406, -0.2084524, -2.212704, 0.1098039, 1, 0, 1,
-0.5295861, 2.229268, -2.1869, 0.1058824, 1, 0, 1,
-0.5277436, -0.6386661, -1.731242, 0.09803922, 1, 0, 1,
-0.525555, -0.07375386, -0.2072148, 0.09019608, 1, 0, 1,
-0.5253693, -1.217891, -1.717834, 0.08627451, 1, 0, 1,
-0.5229729, -1.182498, -0.8897789, 0.07843138, 1, 0, 1,
-0.5202159, 0.7548504, -0.3630476, 0.07450981, 1, 0, 1,
-0.5170377, -1.553493, -2.980392, 0.06666667, 1, 0, 1,
-0.5156258, -1.686764, -4.876529, 0.0627451, 1, 0, 1,
-0.5125158, -1.700814, -3.789955, 0.05490196, 1, 0, 1,
-0.5086336, -0.1158403, -0.9826944, 0.05098039, 1, 0, 1,
-0.5063186, -0.34835, -1.053479, 0.04313726, 1, 0, 1,
-0.5050535, 1.200574, -0.796665, 0.03921569, 1, 0, 1,
-0.5048815, -1.924286, -3.087373, 0.03137255, 1, 0, 1,
-0.4980981, 0.09575446, -1.352666, 0.02745098, 1, 0, 1,
-0.4971243, 1.491882, -0.9873765, 0.01960784, 1, 0, 1,
-0.4914712, -0.06822178, -2.587994, 0.01568628, 1, 0, 1,
-0.4795728, -0.2094694, -2.626615, 0.007843138, 1, 0, 1,
-0.4778514, -0.03812348, -1.927279, 0.003921569, 1, 0, 1,
-0.4773535, 0.988608, -0.311214, 0, 1, 0.003921569, 1,
-0.4726633, -1.086283, -3.95893, 0, 1, 0.01176471, 1,
-0.4675468, -0.6559468, -2.951875, 0, 1, 0.01568628, 1,
-0.4658032, -0.5738227, -0.6592204, 0, 1, 0.02352941, 1,
-0.4654274, -0.6152581, -4.232508, 0, 1, 0.02745098, 1,
-0.4630728, 0.9465909, -1.799327, 0, 1, 0.03529412, 1,
-0.4604486, -0.416825, -1.888626, 0, 1, 0.03921569, 1,
-0.4474998, 1.610986, -1.793003, 0, 1, 0.04705882, 1,
-0.4467314, 0.2446176, -0.5359524, 0, 1, 0.05098039, 1,
-0.4446437, 0.7872317, -0.5959895, 0, 1, 0.05882353, 1,
-0.4400374, 1.041348, 0.7519913, 0, 1, 0.0627451, 1,
-0.4395008, -1.126426, -2.949065, 0, 1, 0.07058824, 1,
-0.4370299, 1.045933, 1.125317, 0, 1, 0.07450981, 1,
-0.435188, 1.402426, -1.799703, 0, 1, 0.08235294, 1,
-0.4344806, -0.1985364, -3.412379, 0, 1, 0.08627451, 1,
-0.4307573, -2.591997, -3.077302, 0, 1, 0.09411765, 1,
-0.4254567, -0.3859691, -0.115658, 0, 1, 0.1019608, 1,
-0.4212487, -0.2937441, -3.150098, 0, 1, 0.1058824, 1,
-0.4198258, -0.7043163, -2.850983, 0, 1, 0.1137255, 1,
-0.4196497, -1.747959, -3.782467, 0, 1, 0.1176471, 1,
-0.415116, -0.5900502, -3.368983, 0, 1, 0.1254902, 1,
-0.4086742, 0.1927725, -0.3090457, 0, 1, 0.1294118, 1,
-0.4035196, -1.861132, -2.083357, 0, 1, 0.1372549, 1,
-0.403001, 0.4681147, 0.4136673, 0, 1, 0.1411765, 1,
-0.4024061, 0.03584922, -0.5443901, 0, 1, 0.1490196, 1,
-0.4017948, 3.014512, -1.626246, 0, 1, 0.1529412, 1,
-0.3981036, -0.7839735, -2.046259, 0, 1, 0.1607843, 1,
-0.3954532, -0.4053969, -2.263237, 0, 1, 0.1647059, 1,
-0.3953442, -0.9050519, -3.044204, 0, 1, 0.172549, 1,
-0.391988, -0.1349229, -2.926392, 0, 1, 0.1764706, 1,
-0.3916005, 0.2344091, 0.0452286, 0, 1, 0.1843137, 1,
-0.3816273, -0.1751955, -3.291424, 0, 1, 0.1882353, 1,
-0.3806388, 1.635053, -1.039803, 0, 1, 0.1960784, 1,
-0.3789288, 1.859916, -0.9746297, 0, 1, 0.2039216, 1,
-0.3733253, -0.1903684, -2.947771, 0, 1, 0.2078431, 1,
-0.3671077, -2.937622, -2.905721, 0, 1, 0.2156863, 1,
-0.3647161, 0.7878246, -0.2346584, 0, 1, 0.2196078, 1,
-0.3594525, 0.05347767, -1.034198, 0, 1, 0.227451, 1,
-0.3581885, 0.786413, -2.079602, 0, 1, 0.2313726, 1,
-0.35789, 0.4019927, -0.2686961, 0, 1, 0.2392157, 1,
-0.3562517, 0.3892776, -0.8240054, 0, 1, 0.2431373, 1,
-0.3512028, 0.7057803, 2.857618, 0, 1, 0.2509804, 1,
-0.3492434, 1.60666, 0.1473879, 0, 1, 0.254902, 1,
-0.3480182, -0.7031073, -3.123967, 0, 1, 0.2627451, 1,
-0.3469067, 0.7311084, -0.8609203, 0, 1, 0.2666667, 1,
-0.3441331, 1.660448, -0.4841181, 0, 1, 0.2745098, 1,
-0.3401293, -2.198525, -2.994867, 0, 1, 0.2784314, 1,
-0.3400697, -0.6416442, -0.5007031, 0, 1, 0.2862745, 1,
-0.339708, -1.59118, -1.641802, 0, 1, 0.2901961, 1,
-0.3349181, 1.359422, -0.02408297, 0, 1, 0.2980392, 1,
-0.3331226, 0.4570819, -0.5771766, 0, 1, 0.3058824, 1,
-0.3306556, -1.802553, -2.951088, 0, 1, 0.3098039, 1,
-0.3299729, -2.378512, -2.788223, 0, 1, 0.3176471, 1,
-0.3253613, -1.135354, -2.297035, 0, 1, 0.3215686, 1,
-0.3238781, 0.7288288, 1.371079, 0, 1, 0.3294118, 1,
-0.3214021, -0.03971422, -0.465924, 0, 1, 0.3333333, 1,
-0.3205298, -0.670096, -3.10141, 0, 1, 0.3411765, 1,
-0.3186953, -1.089613, -3.094227, 0, 1, 0.345098, 1,
-0.3134283, 0.2877109, -2.416897, 0, 1, 0.3529412, 1,
-0.310751, -0.431439, -3.022082, 0, 1, 0.3568628, 1,
-0.3101847, -0.184797, -1.332128, 0, 1, 0.3647059, 1,
-0.3100688, -0.1564443, -1.960477, 0, 1, 0.3686275, 1,
-0.3015122, 0.3699513, -0.9534324, 0, 1, 0.3764706, 1,
-0.2985536, 0.4081056, -1.493907, 0, 1, 0.3803922, 1,
-0.2981319, -0.4998464, -2.789433, 0, 1, 0.3882353, 1,
-0.2975626, 2.259868, -2.582561, 0, 1, 0.3921569, 1,
-0.2957728, -1.255945, -2.532089, 0, 1, 0.4, 1,
-0.2938992, -0.2894154, -2.435705, 0, 1, 0.4078431, 1,
-0.288585, 1.105445, -1.830307, 0, 1, 0.4117647, 1,
-0.2864706, -1.708874, -3.205855, 0, 1, 0.4196078, 1,
-0.2823044, -1.333846, -0.5042152, 0, 1, 0.4235294, 1,
-0.282227, 1.121607, -0.9404169, 0, 1, 0.4313726, 1,
-0.2819051, -0.1846213, -1.470961, 0, 1, 0.4352941, 1,
-0.2793638, -1.075951, -3.614192, 0, 1, 0.4431373, 1,
-0.2792716, 1.083203, -3.534024, 0, 1, 0.4470588, 1,
-0.274337, 1.115069, 0.2082974, 0, 1, 0.454902, 1,
-0.2690658, 1.505703, 0.2660598, 0, 1, 0.4588235, 1,
-0.267652, -0.5975537, -1.4624, 0, 1, 0.4666667, 1,
-0.2664635, -0.9553542, -4.643411, 0, 1, 0.4705882, 1,
-0.2644005, 0.0140311, -1.207826, 0, 1, 0.4784314, 1,
-0.2643031, 0.6360436, -1.898407, 0, 1, 0.4823529, 1,
-0.2641517, -1.095805, -3.26789, 0, 1, 0.4901961, 1,
-0.2617996, -1.010831, -2.781515, 0, 1, 0.4941176, 1,
-0.2617034, 0.2900107, -0.6270853, 0, 1, 0.5019608, 1,
-0.2595397, -0.2715251, -3.859408, 0, 1, 0.509804, 1,
-0.2594104, -1.120835, -1.471423, 0, 1, 0.5137255, 1,
-0.2574922, -0.5826377, -3.701833, 0, 1, 0.5215687, 1,
-0.2549237, -0.3532905, -3.90444, 0, 1, 0.5254902, 1,
-0.2510026, 0.6071547, -1.502728, 0, 1, 0.5333334, 1,
-0.2508429, -0.4556088, -3.297829, 0, 1, 0.5372549, 1,
-0.2498825, 0.2903225, 0.5828388, 0, 1, 0.5450981, 1,
-0.2497154, 0.5725017, 0.5778011, 0, 1, 0.5490196, 1,
-0.243549, 0.9720035, 2.035386, 0, 1, 0.5568628, 1,
-0.2396744, -1.333577, -3.547754, 0, 1, 0.5607843, 1,
-0.2373391, -0.9547033, -2.355994, 0, 1, 0.5686275, 1,
-0.2366109, 0.4399164, 0.5524076, 0, 1, 0.572549, 1,
-0.2365612, 0.01430433, -0.6639124, 0, 1, 0.5803922, 1,
-0.2365189, -0.13957, -2.032603, 0, 1, 0.5843138, 1,
-0.2356747, -0.9926518, -3.579186, 0, 1, 0.5921569, 1,
-0.2317525, -0.4860502, -1.917188, 0, 1, 0.5960785, 1,
-0.2294881, -0.7499492, 0.1956856, 0, 1, 0.6039216, 1,
-0.2285741, 0.6043117, 0.6961981, 0, 1, 0.6117647, 1,
-0.2276501, 0.7971638, -0.6886432, 0, 1, 0.6156863, 1,
-0.226068, 0.4983635, 0.2356835, 0, 1, 0.6235294, 1,
-0.2211653, -0.2269794, -0.7713801, 0, 1, 0.627451, 1,
-0.2186855, -2.385693, -0.9305106, 0, 1, 0.6352941, 1,
-0.2182408, -0.008533654, -0.9309506, 0, 1, 0.6392157, 1,
-0.2132761, 0.6990377, -1.571743, 0, 1, 0.6470588, 1,
-0.21305, -0.8997592, -3.911446, 0, 1, 0.6509804, 1,
-0.2061672, 0.294472, -0.6226572, 0, 1, 0.6588235, 1,
-0.2023972, -0.6617947, -2.939894, 0, 1, 0.6627451, 1,
-0.1987391, 0.8843964, 0.2317157, 0, 1, 0.6705883, 1,
-0.1969471, -2.109895, -4.499762, 0, 1, 0.6745098, 1,
-0.1964525, 0.3614686, -0.2618676, 0, 1, 0.682353, 1,
-0.1961398, -1.647496, -1.455893, 0, 1, 0.6862745, 1,
-0.1945148, -1.426591, -3.133307, 0, 1, 0.6941177, 1,
-0.1925762, -0.3838004, -3.68252, 0, 1, 0.7019608, 1,
-0.1904755, -0.700047, -2.865387, 0, 1, 0.7058824, 1,
-0.1834697, 0.8436508, 0.6522132, 0, 1, 0.7137255, 1,
-0.1806813, 0.8063383, 0.6095691, 0, 1, 0.7176471, 1,
-0.1805523, 1.786657, 1.028218, 0, 1, 0.7254902, 1,
-0.1797436, -0.6371247, -0.9626777, 0, 1, 0.7294118, 1,
-0.1760106, -0.6233783, -2.556851, 0, 1, 0.7372549, 1,
-0.1749489, 1.994032, 0.9039554, 0, 1, 0.7411765, 1,
-0.1748936, -1.569719, -3.12127, 0, 1, 0.7490196, 1,
-0.1686859, 0.01417274, -1.079223, 0, 1, 0.7529412, 1,
-0.1676987, -0.7788513, -1.650778, 0, 1, 0.7607843, 1,
-0.1660621, 2.8808, -1.61782, 0, 1, 0.7647059, 1,
-0.1640425, 0.2964973, -0.8920679, 0, 1, 0.772549, 1,
-0.1622881, 0.5818056, 2.820565, 0, 1, 0.7764706, 1,
-0.1581055, 0.4143847, -1.351616, 0, 1, 0.7843137, 1,
-0.1577016, 1.710123, 1.098196, 0, 1, 0.7882353, 1,
-0.1558318, -0.08231588, -2.363358, 0, 1, 0.7960784, 1,
-0.1554428, -1.901513, -2.50193, 0, 1, 0.8039216, 1,
-0.1537038, 0.8207867, 0.9882166, 0, 1, 0.8078431, 1,
-0.1510027, 0.5006537, -0.8800728, 0, 1, 0.8156863, 1,
-0.145034, 0.6468406, 0.06145337, 0, 1, 0.8196079, 1,
-0.145025, -0.2204811, -1.472695, 0, 1, 0.827451, 1,
-0.1432153, -0.9429944, -3.980329, 0, 1, 0.8313726, 1,
-0.1411255, -0.4547378, -2.530932, 0, 1, 0.8392157, 1,
-0.1394805, 0.2641892, -0.7289696, 0, 1, 0.8431373, 1,
-0.139456, -1.308189, -4.421619, 0, 1, 0.8509804, 1,
-0.126908, -0.3922411, -4.055758, 0, 1, 0.854902, 1,
-0.1267865, -0.2682216, -3.804042, 0, 1, 0.8627451, 1,
-0.1252073, -2.534312, -3.242228, 0, 1, 0.8666667, 1,
-0.1191666, -0.3563261, -1.785934, 0, 1, 0.8745098, 1,
-0.1190792, -0.3129574, -3.502246, 0, 1, 0.8784314, 1,
-0.1176798, 0.2938841, -1.01076, 0, 1, 0.8862745, 1,
-0.1166769, -1.064628, -1.776873, 0, 1, 0.8901961, 1,
-0.1128211, 0.6303192, -2.15311, 0, 1, 0.8980392, 1,
-0.1122063, 0.514138, -0.1060643, 0, 1, 0.9058824, 1,
-0.1102537, 0.7981313, 0.6574824, 0, 1, 0.9098039, 1,
-0.1085952, 2.187432, 0.6887806, 0, 1, 0.9176471, 1,
-0.105798, 0.9804597, -0.01014978, 0, 1, 0.9215686, 1,
-0.1050751, -0.4096659, -1.257975, 0, 1, 0.9294118, 1,
-0.1032204, -2.6991, -2.954091, 0, 1, 0.9333333, 1,
-0.1017838, 1.207984, 0.3483703, 0, 1, 0.9411765, 1,
-0.09828317, -0.643287, -3.519028, 0, 1, 0.945098, 1,
-0.09312161, 0.5298101, 0.2860846, 0, 1, 0.9529412, 1,
-0.09147915, -0.573584, -3.452006, 0, 1, 0.9568627, 1,
-0.09056579, -1.849978, -2.999742, 0, 1, 0.9647059, 1,
-0.08967982, -0.4631313, -1.858156, 0, 1, 0.9686275, 1,
-0.08672196, -1.324068, -3.61212, 0, 1, 0.9764706, 1,
-0.08601115, -0.5927607, -1.659937, 0, 1, 0.9803922, 1,
-0.08403644, 1.359583, -1.436715, 0, 1, 0.9882353, 1,
-0.08216897, 0.6402251, -1.282268, 0, 1, 0.9921569, 1,
-0.07724322, -0.8387415, -3.917862, 0, 1, 1, 1,
-0.07281809, 0.4850043, 0.5635797, 0, 0.9921569, 1, 1,
-0.06932671, 0.1059639, -0.01388837, 0, 0.9882353, 1, 1,
-0.06894296, 0.7212876, -2.045681, 0, 0.9803922, 1, 1,
-0.06600281, 0.1182449, 0.6230009, 0, 0.9764706, 1, 1,
-0.06599158, 2.236995, 1.0578, 0, 0.9686275, 1, 1,
-0.06530302, 0.2045274, -0.8102921, 0, 0.9647059, 1, 1,
-0.06342233, 0.4095067, 0.6760527, 0, 0.9568627, 1, 1,
-0.06311394, -0.8115038, -2.239563, 0, 0.9529412, 1, 1,
-0.05839591, -0.156863, -2.193555, 0, 0.945098, 1, 1,
-0.0570435, -1.219006, -3.960671, 0, 0.9411765, 1, 1,
-0.05368388, -1.661391, -4.208723, 0, 0.9333333, 1, 1,
-0.05173162, -0.3654768, -2.989869, 0, 0.9294118, 1, 1,
-0.05159033, -1.464599, -2.094538, 0, 0.9215686, 1, 1,
-0.04980586, 0.08253124, 0.1052847, 0, 0.9176471, 1, 1,
-0.04928536, 2.190656, 1.374576, 0, 0.9098039, 1, 1,
-0.04465292, -0.6921591, -2.226689, 0, 0.9058824, 1, 1,
-0.04373886, -0.5076554, -2.380257, 0, 0.8980392, 1, 1,
-0.04020891, 1.268906, -0.13456, 0, 0.8901961, 1, 1,
-0.03353389, 0.4955128, -0.4341016, 0, 0.8862745, 1, 1,
-0.0286385, -1.403998, -4.037376, 0, 0.8784314, 1, 1,
-0.02811272, 1.270573, 0.3334163, 0, 0.8745098, 1, 1,
-0.01882504, 0.1114011, 0.3449757, 0, 0.8666667, 1, 1,
-0.01685721, -0.09952732, -4.420895, 0, 0.8627451, 1, 1,
-0.01622774, -0.4130132, -3.684403, 0, 0.854902, 1, 1,
-0.01383988, -0.530838, -3.044946, 0, 0.8509804, 1, 1,
-0.01227131, 0.922481, -1.805926, 0, 0.8431373, 1, 1,
-0.01059699, -0.3583967, -1.371945, 0, 0.8392157, 1, 1,
-0.006371537, -0.8827068, -2.502881, 0, 0.8313726, 1, 1,
-0.003298362, 1.000972, -1.243521, 0, 0.827451, 1, 1,
-0.00246746, -0.7603009, -3.86184, 0, 0.8196079, 1, 1,
-0.0006399759, 1.222268, 0.5837423, 0, 0.8156863, 1, 1,
0.0005197033, 0.1117642, -0.8596679, 0, 0.8078431, 1, 1,
0.006266788, -1.208877, 1.616228, 0, 0.8039216, 1, 1,
0.008315154, -0.1480651, 1.806825, 0, 0.7960784, 1, 1,
0.009284587, 1.976861, -0.6163671, 0, 0.7882353, 1, 1,
0.009610959, 1.026067, 0.630859, 0, 0.7843137, 1, 1,
0.01058396, 0.7230564, 0.432333, 0, 0.7764706, 1, 1,
0.02065936, -1.958212, 2.136987, 0, 0.772549, 1, 1,
0.02175027, 1.274422, 0.8124079, 0, 0.7647059, 1, 1,
0.02340856, 0.5146965, -1.811395, 0, 0.7607843, 1, 1,
0.02378682, -0.5778141, 2.403056, 0, 0.7529412, 1, 1,
0.03294897, -0.3205083, 5.057201, 0, 0.7490196, 1, 1,
0.03312481, -0.2093771, 3.124165, 0, 0.7411765, 1, 1,
0.03499033, -1.667235, 4.044569, 0, 0.7372549, 1, 1,
0.0413134, 1.542814, -1.392931, 0, 0.7294118, 1, 1,
0.04327125, -0.7604968, 3.16312, 0, 0.7254902, 1, 1,
0.04415447, 1.058004, -0.6004333, 0, 0.7176471, 1, 1,
0.0443915, 0.5158298, 0.70701, 0, 0.7137255, 1, 1,
0.04451979, -0.06617431, 0.8003753, 0, 0.7058824, 1, 1,
0.04629106, 1.470544, 1.587577, 0, 0.6980392, 1, 1,
0.04870663, 0.5425535, -2.565212, 0, 0.6941177, 1, 1,
0.0497636, 1.579148, -2.066192, 0, 0.6862745, 1, 1,
0.05160603, 0.9223849, 0.4270205, 0, 0.682353, 1, 1,
0.05590972, -0.7999498, 1.379523, 0, 0.6745098, 1, 1,
0.06333546, -1.214518, 3.767135, 0, 0.6705883, 1, 1,
0.07191867, 2.699928, -1.590743, 0, 0.6627451, 1, 1,
0.07470347, -1.152487, 1.124415, 0, 0.6588235, 1, 1,
0.07491232, 0.004807594, 3.107699, 0, 0.6509804, 1, 1,
0.0756933, -0.3015519, 2.577607, 0, 0.6470588, 1, 1,
0.08010801, 1.150048, 0.3771217, 0, 0.6392157, 1, 1,
0.08602116, 2.461205, -0.8238055, 0, 0.6352941, 1, 1,
0.08802743, 0.486324, 0.9656869, 0, 0.627451, 1, 1,
0.09490883, -1.206767, 2.498071, 0, 0.6235294, 1, 1,
0.09834998, 0.2735698, 1.245231, 0, 0.6156863, 1, 1,
0.1010602, -0.2351659, 2.262285, 0, 0.6117647, 1, 1,
0.1056068, -0.3100453, 2.386982, 0, 0.6039216, 1, 1,
0.1105674, 0.1473387, 1.310319, 0, 0.5960785, 1, 1,
0.1141598, 0.6784183, 0.5595737, 0, 0.5921569, 1, 1,
0.1251553, -1.605812, 3.335377, 0, 0.5843138, 1, 1,
0.1265134, -0.4633524, 3.310838, 0, 0.5803922, 1, 1,
0.1265344, -0.7903036, 3.81508, 0, 0.572549, 1, 1,
0.1289607, 0.4534127, -0.1118891, 0, 0.5686275, 1, 1,
0.1319269, -1.790476, 5.870619, 0, 0.5607843, 1, 1,
0.1335063, 0.1422595, 3.061929, 0, 0.5568628, 1, 1,
0.1337028, 0.8999181, 2.236048, 0, 0.5490196, 1, 1,
0.140216, -0.1090077, 1.586863, 0, 0.5450981, 1, 1,
0.1428587, 0.9905087, 0.4288367, 0, 0.5372549, 1, 1,
0.1456298, 1.640902, 0.2041253, 0, 0.5333334, 1, 1,
0.146779, -1.618543, 2.021045, 0, 0.5254902, 1, 1,
0.1475787, -0.3815436, 2.830406, 0, 0.5215687, 1, 1,
0.1492322, -0.9778354, 3.544575, 0, 0.5137255, 1, 1,
0.1493138, -0.2037271, 1.958277, 0, 0.509804, 1, 1,
0.1495692, 0.2550281, 1.625292, 0, 0.5019608, 1, 1,
0.1509163, -1.203887, 2.988604, 0, 0.4941176, 1, 1,
0.1521066, -1.296382, 1.54292, 0, 0.4901961, 1, 1,
0.1542385, 1.986259, -2.022713, 0, 0.4823529, 1, 1,
0.1542784, 2.693549, 1.253172, 0, 0.4784314, 1, 1,
0.1559954, 0.59945, -0.116537, 0, 0.4705882, 1, 1,
0.1572444, -0.1160661, 1.291309, 0, 0.4666667, 1, 1,
0.1595445, -1.442684, 2.222399, 0, 0.4588235, 1, 1,
0.1638685, 1.023527, 0.786768, 0, 0.454902, 1, 1,
0.1659409, 0.2689188, 0.7894413, 0, 0.4470588, 1, 1,
0.1664339, 0.06388646, 0.9682307, 0, 0.4431373, 1, 1,
0.1665221, 0.3299169, 0.6625177, 0, 0.4352941, 1, 1,
0.1686631, -1.58005, 4.464176, 0, 0.4313726, 1, 1,
0.1731202, 1.417228, 1.188085, 0, 0.4235294, 1, 1,
0.1772068, -0.5843444, 2.306542, 0, 0.4196078, 1, 1,
0.1777949, -0.8804759, 1.936782, 0, 0.4117647, 1, 1,
0.185401, -0.5801906, 4.767612, 0, 0.4078431, 1, 1,
0.1869827, 0.1906131, 1.039458, 0, 0.4, 1, 1,
0.1901918, 1.168395, 0.5998695, 0, 0.3921569, 1, 1,
0.1994202, -0.7965861, 2.926312, 0, 0.3882353, 1, 1,
0.2003884, 0.536499, -0.3545052, 0, 0.3803922, 1, 1,
0.201821, -1.299814, 3.037121, 0, 0.3764706, 1, 1,
0.20274, -0.4658509, 2.041843, 0, 0.3686275, 1, 1,
0.2027768, 0.8660168, 1.54534, 0, 0.3647059, 1, 1,
0.2028178, 0.4775905, 2.593817, 0, 0.3568628, 1, 1,
0.2029172, 0.5053445, -0.1739302, 0, 0.3529412, 1, 1,
0.2040959, -0.4798515, 3.505368, 0, 0.345098, 1, 1,
0.2068195, -0.4088442, 0.6854274, 0, 0.3411765, 1, 1,
0.2078062, 1.493821, -0.0365284, 0, 0.3333333, 1, 1,
0.2149157, 0.08699002, 0.6158991, 0, 0.3294118, 1, 1,
0.2163967, 0.6375138, 0.1682497, 0, 0.3215686, 1, 1,
0.2185673, -0.4168732, 3.705127, 0, 0.3176471, 1, 1,
0.2186575, 0.01069134, 1.646745, 0, 0.3098039, 1, 1,
0.2231291, 0.3938853, 0.01576984, 0, 0.3058824, 1, 1,
0.2247405, -0.1519363, 1.877715, 0, 0.2980392, 1, 1,
0.2249717, 0.6398535, 2.002467, 0, 0.2901961, 1, 1,
0.2304024, 0.230624, 1.899101, 0, 0.2862745, 1, 1,
0.2320344, -0.7513312, 3.726404, 0, 0.2784314, 1, 1,
0.2329081, 0.9261524, -0.6160002, 0, 0.2745098, 1, 1,
0.2350974, -1.046138, 2.561336, 0, 0.2666667, 1, 1,
0.2367778, -0.6534528, 5.397868, 0, 0.2627451, 1, 1,
0.2389323, -0.1452441, 2.2413, 0, 0.254902, 1, 1,
0.2406, 1.566191, -1.809532, 0, 0.2509804, 1, 1,
0.2427801, 0.621012, -0.611504, 0, 0.2431373, 1, 1,
0.2440323, 1.777909, -0.002014127, 0, 0.2392157, 1, 1,
0.2441421, 0.6616278, 0.5817946, 0, 0.2313726, 1, 1,
0.2487723, 2.161002, -0.2683851, 0, 0.227451, 1, 1,
0.254011, 1.500927, 1.388218, 0, 0.2196078, 1, 1,
0.2569604, -1.88284, 2.980389, 0, 0.2156863, 1, 1,
0.2594611, 0.7114239, 1.254254, 0, 0.2078431, 1, 1,
0.2609265, 0.02182768, 0.4550934, 0, 0.2039216, 1, 1,
0.265913, 0.7647979, 0.9186493, 0, 0.1960784, 1, 1,
0.268479, 1.452525, 0.6152529, 0, 0.1882353, 1, 1,
0.2695366, 0.310389, 1.442436, 0, 0.1843137, 1, 1,
0.2719203, -0.9940248, 2.927838, 0, 0.1764706, 1, 1,
0.2792675, 0.9386848, -0.1245219, 0, 0.172549, 1, 1,
0.2842027, -0.3499917, 1.964885, 0, 0.1647059, 1, 1,
0.2846677, -0.8145873, 1.766642, 0, 0.1607843, 1, 1,
0.2850427, -1.46796, 4.946995, 0, 0.1529412, 1, 1,
0.2862518, 1.307203, -0.1809862, 0, 0.1490196, 1, 1,
0.2958107, -0.07418321, 0.5961326, 0, 0.1411765, 1, 1,
0.2987764, 0.7930167, 0.03517547, 0, 0.1372549, 1, 1,
0.3008681, 1.689932, -0.4668423, 0, 0.1294118, 1, 1,
0.3085085, 0.2512324, 2.54055, 0, 0.1254902, 1, 1,
0.3113258, -1.277276, 2.456534, 0, 0.1176471, 1, 1,
0.3118539, -1.595722, 1.883408, 0, 0.1137255, 1, 1,
0.313383, -1.489552, 3.508471, 0, 0.1058824, 1, 1,
0.3158541, 2.23395, 0.02246968, 0, 0.09803922, 1, 1,
0.3195624, -1.353529, 1.441207, 0, 0.09411765, 1, 1,
0.3202446, -0.8164232, 2.470458, 0, 0.08627451, 1, 1,
0.323606, 0.2965734, 1.810829, 0, 0.08235294, 1, 1,
0.3237749, 0.7517438, -0.0886057, 0, 0.07450981, 1, 1,
0.326874, -0.002063279, 2.077397, 0, 0.07058824, 1, 1,
0.3353848, 0.5138781, -0.4430811, 0, 0.0627451, 1, 1,
0.335593, 0.8828464, -0.8433117, 0, 0.05882353, 1, 1,
0.3359702, -0.9639322, 2.565707, 0, 0.05098039, 1, 1,
0.3369255, -0.5733972, 5.406105, 0, 0.04705882, 1, 1,
0.3417871, 0.6125729, 0.05968243, 0, 0.03921569, 1, 1,
0.3427373, 0.2215413, -0.2776352, 0, 0.03529412, 1, 1,
0.3472562, -0.3854539, 2.979622, 0, 0.02745098, 1, 1,
0.3474985, 2.299675, -0.1474149, 0, 0.02352941, 1, 1,
0.349856, -0.4751289, 2.963774, 0, 0.01568628, 1, 1,
0.3498804, 0.39088, 0.8925657, 0, 0.01176471, 1, 1,
0.3503675, 2.591165, -1.373401, 0, 0.003921569, 1, 1,
0.3507232, -1.081255, 3.284204, 0.003921569, 0, 1, 1,
0.3507845, -0.2874017, 0.1393534, 0.007843138, 0, 1, 1,
0.3560562, -1.024702, 4.542645, 0.01568628, 0, 1, 1,
0.3586202, -0.1006911, 0.6761221, 0.01960784, 0, 1, 1,
0.3591429, 1.018541, 1.43634, 0.02745098, 0, 1, 1,
0.3598084, 1.1872, -0.3639455, 0.03137255, 0, 1, 1,
0.3628506, 0.4652691, -0.7996771, 0.03921569, 0, 1, 1,
0.3656941, -0.3660528, 1.713321, 0.04313726, 0, 1, 1,
0.3669713, 1.962171, 0.6904685, 0.05098039, 0, 1, 1,
0.369736, -0.5504096, 2.23803, 0.05490196, 0, 1, 1,
0.3709488, 0.3054948, 0.1994211, 0.0627451, 0, 1, 1,
0.3730052, 0.7536448, 0.4691387, 0.06666667, 0, 1, 1,
0.3760471, -0.04046349, 0.8500074, 0.07450981, 0, 1, 1,
0.3775148, 0.5530988, -0.230635, 0.07843138, 0, 1, 1,
0.3807987, -0.03003492, 1.379016, 0.08627451, 0, 1, 1,
0.3820943, 1.408712, -0.8940306, 0.09019608, 0, 1, 1,
0.3883543, 2.003918, -1.42809, 0.09803922, 0, 1, 1,
0.3904946, -0.3196206, 0.5655934, 0.1058824, 0, 1, 1,
0.3918978, -1.120685, 2.418005, 0.1098039, 0, 1, 1,
0.3932982, -0.6624035, 2.044305, 0.1176471, 0, 1, 1,
0.4012581, 1.301766, 1.382521, 0.1215686, 0, 1, 1,
0.4032842, 1.585593, 1.248674, 0.1294118, 0, 1, 1,
0.40518, 1.394611, 0.1436519, 0.1333333, 0, 1, 1,
0.406514, -0.2116287, 2.390629, 0.1411765, 0, 1, 1,
0.4098045, 1.373701, 1.493739, 0.145098, 0, 1, 1,
0.4114805, 0.7549118, 0.558929, 0.1529412, 0, 1, 1,
0.4217626, -0.0233793, 0.976392, 0.1568628, 0, 1, 1,
0.4265972, 1.056216, 0.5423834, 0.1647059, 0, 1, 1,
0.4293035, -1.052779, 3.250316, 0.1686275, 0, 1, 1,
0.430304, -0.1739793, 1.86519, 0.1764706, 0, 1, 1,
0.4309949, 1.619084, -2.191404, 0.1803922, 0, 1, 1,
0.43146, 1.076935, -0.4296619, 0.1882353, 0, 1, 1,
0.4321966, -1.455833, 2.038271, 0.1921569, 0, 1, 1,
0.4350858, -0.6190023, 2.700732, 0.2, 0, 1, 1,
0.4352702, 0.919198, 0.6351718, 0.2078431, 0, 1, 1,
0.4459325, 0.9927504, 0.08335006, 0.2117647, 0, 1, 1,
0.4524196, -0.6199825, 0.2644269, 0.2196078, 0, 1, 1,
0.4588047, 1.046662, -1.52855, 0.2235294, 0, 1, 1,
0.4636489, 0.158131, -0.09255861, 0.2313726, 0, 1, 1,
0.4641123, -0.3119776, 2.887851, 0.2352941, 0, 1, 1,
0.4646794, -0.2281559, 1.464844, 0.2431373, 0, 1, 1,
0.4648139, 1.272037, -0.3927032, 0.2470588, 0, 1, 1,
0.4657271, -0.2339599, 2.458783, 0.254902, 0, 1, 1,
0.4671504, -0.8552068, 2.21164, 0.2588235, 0, 1, 1,
0.4705783, 1.387316, 0.1774391, 0.2666667, 0, 1, 1,
0.4752765, -0.546657, 2.400734, 0.2705882, 0, 1, 1,
0.481307, -0.1145282, -0.3467244, 0.2784314, 0, 1, 1,
0.488792, 0.2617476, 3.571533, 0.282353, 0, 1, 1,
0.4915265, -0.1996697, 0.7176448, 0.2901961, 0, 1, 1,
0.4917788, -0.5575918, 3.339206, 0.2941177, 0, 1, 1,
0.4925868, 0.243468, 0.8240706, 0.3019608, 0, 1, 1,
0.501413, 0.4524451, -0.7829896, 0.3098039, 0, 1, 1,
0.5016032, -0.822403, 2.836975, 0.3137255, 0, 1, 1,
0.5043575, -0.9822453, 3.437869, 0.3215686, 0, 1, 1,
0.5143389, -1.366311, 3.36603, 0.3254902, 0, 1, 1,
0.5145267, -1.777078, 3.182717, 0.3333333, 0, 1, 1,
0.5148746, -0.409613, 2.739649, 0.3372549, 0, 1, 1,
0.5195905, -0.6498819, 2.391117, 0.345098, 0, 1, 1,
0.5206065, 2.020416, 1.141589, 0.3490196, 0, 1, 1,
0.5234863, 0.5453031, 2.024498, 0.3568628, 0, 1, 1,
0.5317187, 0.7080092, -0.3032148, 0.3607843, 0, 1, 1,
0.5499375, -0.5767648, 3.224669, 0.3686275, 0, 1, 1,
0.5552977, -1.776382, 3.836905, 0.372549, 0, 1, 1,
0.5579842, 0.2353425, 0.4405847, 0.3803922, 0, 1, 1,
0.5593337, 0.06831393, 0.9632371, 0.3843137, 0, 1, 1,
0.5603699, -1.234895, 3.274701, 0.3921569, 0, 1, 1,
0.5605385, -1.302783, 2.711192, 0.3960784, 0, 1, 1,
0.5662929, 0.473138, 0.9563583, 0.4039216, 0, 1, 1,
0.5684093, -0.7323255, 1.407069, 0.4117647, 0, 1, 1,
0.569042, 2.073292, -0.585832, 0.4156863, 0, 1, 1,
0.5691817, -1.484227, 2.187504, 0.4235294, 0, 1, 1,
0.5694522, 0.8512259, 1.894872, 0.427451, 0, 1, 1,
0.5704547, -0.2164787, 2.978733, 0.4352941, 0, 1, 1,
0.5705588, 0.3562492, 2.315831, 0.4392157, 0, 1, 1,
0.5757738, -0.8337085, 2.327909, 0.4470588, 0, 1, 1,
0.5768887, 1.349539, 0.3413767, 0.4509804, 0, 1, 1,
0.5791565, -1.644601, 3.839688, 0.4588235, 0, 1, 1,
0.5822045, -1.233456, 3.97072, 0.4627451, 0, 1, 1,
0.5859773, 0.3856452, 0.9467028, 0.4705882, 0, 1, 1,
0.5877002, 1.295775, -0.05485531, 0.4745098, 0, 1, 1,
0.5889248, -1.567003, 0.9535411, 0.4823529, 0, 1, 1,
0.5898523, -0.4775794, 2.695167, 0.4862745, 0, 1, 1,
0.592264, -0.1736905, 2.462769, 0.4941176, 0, 1, 1,
0.5924987, 1.150479, 1.119253, 0.5019608, 0, 1, 1,
0.5954847, -0.6552582, 0.06539507, 0.5058824, 0, 1, 1,
0.5987101, -0.4685268, 4.037377, 0.5137255, 0, 1, 1,
0.6026503, 0.3260314, 1.514585, 0.5176471, 0, 1, 1,
0.6039847, -1.78464, 1.141303, 0.5254902, 0, 1, 1,
0.6072322, -0.5173897, 1.492065, 0.5294118, 0, 1, 1,
0.624783, 0.8161446, 1.282291, 0.5372549, 0, 1, 1,
0.6258176, 0.8360392, 1.815227, 0.5411765, 0, 1, 1,
0.6264051, 1.055246, -2.116608, 0.5490196, 0, 1, 1,
0.6273059, -0.01211283, 0.8259085, 0.5529412, 0, 1, 1,
0.632772, -0.4081611, 3.921299, 0.5607843, 0, 1, 1,
0.6406194, 0.5145343, -0.2726912, 0.5647059, 0, 1, 1,
0.6539283, 0.7652913, 0.329308, 0.572549, 0, 1, 1,
0.6542663, 0.193813, -0.4224939, 0.5764706, 0, 1, 1,
0.6555722, 1.578059, 1.449852, 0.5843138, 0, 1, 1,
0.6569536, 0.2861656, 0.5381423, 0.5882353, 0, 1, 1,
0.6573543, 0.5502634, 0.8452732, 0.5960785, 0, 1, 1,
0.6590405, -0.1873725, 1.247927, 0.6039216, 0, 1, 1,
0.6608385, -0.8143326, 2.769763, 0.6078432, 0, 1, 1,
0.6651346, 1.33052, -0.6297357, 0.6156863, 0, 1, 1,
0.6659549, 0.2347838, 1.534094, 0.6196079, 0, 1, 1,
0.6750358, -1.642544, 3.666909, 0.627451, 0, 1, 1,
0.6755102, 0.5921563, -0.01575839, 0.6313726, 0, 1, 1,
0.679267, -0.923485, 2.444183, 0.6392157, 0, 1, 1,
0.6808704, -0.03853303, 2.167613, 0.6431373, 0, 1, 1,
0.6897647, 0.2903216, -0.5681248, 0.6509804, 0, 1, 1,
0.6910937, 1.444512, 0.4900588, 0.654902, 0, 1, 1,
0.693172, 0.3234446, 1.052035, 0.6627451, 0, 1, 1,
0.699712, -1.82408, 4.008914, 0.6666667, 0, 1, 1,
0.7059485, 1.054369, -0.4059073, 0.6745098, 0, 1, 1,
0.7094247, -1.36404, 2.131114, 0.6784314, 0, 1, 1,
0.7128364, 1.359159, 2.855324, 0.6862745, 0, 1, 1,
0.7181569, 1.310406, 0.8810661, 0.6901961, 0, 1, 1,
0.7194219, -0.7985336, 1.912118, 0.6980392, 0, 1, 1,
0.7225905, -0.1122602, 2.203026, 0.7058824, 0, 1, 1,
0.7279806, 0.9277658, -0.1480291, 0.7098039, 0, 1, 1,
0.7327147, 1.175843, 0.1977958, 0.7176471, 0, 1, 1,
0.7383949, -0.2705728, 2.283522, 0.7215686, 0, 1, 1,
0.7395571, -0.8227882, 2.705375, 0.7294118, 0, 1, 1,
0.759062, -0.19001, 2.448024, 0.7333333, 0, 1, 1,
0.7672773, 0.07813658, 1.07041, 0.7411765, 0, 1, 1,
0.7682477, -0.4495646, 1.908255, 0.7450981, 0, 1, 1,
0.770171, 0.5137924, 1.014118, 0.7529412, 0, 1, 1,
0.7704446, 1.002778, -0.869785, 0.7568628, 0, 1, 1,
0.771537, -0.265897, 1.660597, 0.7647059, 0, 1, 1,
0.7726347, -0.0821471, 1.931534, 0.7686275, 0, 1, 1,
0.7736057, -0.827894, 2.706351, 0.7764706, 0, 1, 1,
0.7793407, 0.2645546, 0.2763906, 0.7803922, 0, 1, 1,
0.7846975, 4.058201, 0.1241179, 0.7882353, 0, 1, 1,
0.7856349, 0.02296973, 0.05404252, 0.7921569, 0, 1, 1,
0.7868966, -1.041535, 2.64209, 0.8, 0, 1, 1,
0.787101, 0.06857873, 0.9784498, 0.8078431, 0, 1, 1,
0.7951619, -0.3354308, 1.243762, 0.8117647, 0, 1, 1,
0.8136223, 1.201161, 0.409898, 0.8196079, 0, 1, 1,
0.8144574, 1.800669, -0.04636921, 0.8235294, 0, 1, 1,
0.8170462, 0.1282553, 1.700603, 0.8313726, 0, 1, 1,
0.8180645, 0.8021195, 2.865056, 0.8352941, 0, 1, 1,
0.8209693, -0.2721095, 1.836984, 0.8431373, 0, 1, 1,
0.8285269, -0.2708233, 1.54968, 0.8470588, 0, 1, 1,
0.8304605, -1.453882, 2.432693, 0.854902, 0, 1, 1,
0.8361519, 1.189528, -1.276584, 0.8588235, 0, 1, 1,
0.836381, -0.6496146, 2.929778, 0.8666667, 0, 1, 1,
0.8368669, -1.114177, 3.407503, 0.8705882, 0, 1, 1,
0.8405434, 0.03371398, -0.1284465, 0.8784314, 0, 1, 1,
0.8443892, 0.1908543, 0.6826434, 0.8823529, 0, 1, 1,
0.8483071, -0.6020762, 3.436939, 0.8901961, 0, 1, 1,
0.8497314, 0.5592958, 0.4748484, 0.8941177, 0, 1, 1,
0.8519275, 0.3832312, 2.207087, 0.9019608, 0, 1, 1,
0.8526682, -0.1933629, 1.892646, 0.9098039, 0, 1, 1,
0.8526825, 1.11499, 2.013627, 0.9137255, 0, 1, 1,
0.8565606, 0.1736245, 0.03181975, 0.9215686, 0, 1, 1,
0.8585663, 0.7521505, 1.746363, 0.9254902, 0, 1, 1,
0.8625225, -1.364672, 2.140571, 0.9333333, 0, 1, 1,
0.8641418, -0.05885721, -1.747461, 0.9372549, 0, 1, 1,
0.8717242, 1.471224, 0.2555774, 0.945098, 0, 1, 1,
0.8725843, -0.2686586, 0.5388417, 0.9490196, 0, 1, 1,
0.8772721, 0.7911845, 0.8185309, 0.9568627, 0, 1, 1,
0.8774427, -2.254563, 2.86537, 0.9607843, 0, 1, 1,
0.8779779, 2.852226, -0.4701407, 0.9686275, 0, 1, 1,
0.887116, 1.090105, 1.029076, 0.972549, 0, 1, 1,
0.8889011, -1.790245, 2.563961, 0.9803922, 0, 1, 1,
0.8899608, 0.7644668, -0.4046831, 0.9843137, 0, 1, 1,
0.8913807, 0.9705128, 0.5803957, 0.9921569, 0, 1, 1,
0.8924383, 1.168905, 1.923945, 0.9960784, 0, 1, 1,
0.8949378, -0.4149756, 3.13222, 1, 0, 0.9960784, 1,
0.8975661, -2.262328, 2.022401, 1, 0, 0.9882353, 1,
0.8999691, 0.4802008, 0.7268234, 1, 0, 0.9843137, 1,
0.9087566, 0.7222424, 0.7407209, 1, 0, 0.9764706, 1,
0.9090732, -0.07720012, 0.790427, 1, 0, 0.972549, 1,
0.9153996, -0.6258042, 1.835415, 1, 0, 0.9647059, 1,
0.91618, -0.08628446, 1.029094, 1, 0, 0.9607843, 1,
0.922696, 0.6496708, 0.6143139, 1, 0, 0.9529412, 1,
0.9250585, 0.826421, 2.398185, 1, 0, 0.9490196, 1,
0.9341843, 2.037244, 1.375712, 1, 0, 0.9411765, 1,
0.9347228, -0.5086039, 3.666491, 1, 0, 0.9372549, 1,
0.9358947, 0.03386982, -0.4486111, 1, 0, 0.9294118, 1,
0.9376373, 0.143515, 0.7927161, 1, 0, 0.9254902, 1,
0.9483784, 0.7558645, 0.6380236, 1, 0, 0.9176471, 1,
0.9526724, 0.6207255, -0.9105132, 1, 0, 0.9137255, 1,
0.9596845, 0.7195255, 1.673915, 1, 0, 0.9058824, 1,
0.9617192, -1.74511, 2.809368, 1, 0, 0.9019608, 1,
0.9711223, -0.4279769, 2.893459, 1, 0, 0.8941177, 1,
0.9736495, -0.6054013, 1.420102, 1, 0, 0.8862745, 1,
0.97672, -1.261736, 3.246441, 1, 0, 0.8823529, 1,
0.9806453, -0.6346167, 0.6716023, 1, 0, 0.8745098, 1,
0.9855052, 0.3599902, 2.015881, 1, 0, 0.8705882, 1,
0.9884506, 0.142571, 0.6822065, 1, 0, 0.8627451, 1,
0.9886861, -0.7074495, 4.037854, 1, 0, 0.8588235, 1,
0.9888637, 1.361576, -0.1584891, 1, 0, 0.8509804, 1,
1.000295, 0.1094924, 0.4680282, 1, 0, 0.8470588, 1,
1.003216, -0.2162757, 0.9513317, 1, 0, 0.8392157, 1,
1.010158, 0.7357671, -0.1410722, 1, 0, 0.8352941, 1,
1.010271, -0.2027472, 2.317659, 1, 0, 0.827451, 1,
1.01137, 2.042673, 0.09251601, 1, 0, 0.8235294, 1,
1.014284, -1.292131, 1.569305, 1, 0, 0.8156863, 1,
1.020187, 0.4496995, 1.79927, 1, 0, 0.8117647, 1,
1.026498, 0.3860233, 2.170072, 1, 0, 0.8039216, 1,
1.03672, 0.6582383, 0.04468019, 1, 0, 0.7960784, 1,
1.046172, 0.112945, 0.8442639, 1, 0, 0.7921569, 1,
1.04634, -0.1722014, 3.343156, 1, 0, 0.7843137, 1,
1.052527, -0.5289617, 3.709614, 1, 0, 0.7803922, 1,
1.059595, 0.424993, 1.092472, 1, 0, 0.772549, 1,
1.063504, 1.407746, 0.0989155, 1, 0, 0.7686275, 1,
1.081617, -0.4923114, 2.615703, 1, 0, 0.7607843, 1,
1.085251, -0.6554301, 3.106738, 1, 0, 0.7568628, 1,
1.0858, -1.077698, 2.014588, 1, 0, 0.7490196, 1,
1.087363, 0.2014836, 0.8068687, 1, 0, 0.7450981, 1,
1.091075, 0.8515832, 0.9172125, 1, 0, 0.7372549, 1,
1.103597, 0.7445089, 1.022538, 1, 0, 0.7333333, 1,
1.104863, 0.4443129, 2.481332, 1, 0, 0.7254902, 1,
1.113654, -0.6076239, 2.553695, 1, 0, 0.7215686, 1,
1.114799, 0.5719869, 3.616807, 1, 0, 0.7137255, 1,
1.119429, 0.8219907, 1.123391, 1, 0, 0.7098039, 1,
1.122487, 0.9547882, 0.1539299, 1, 0, 0.7019608, 1,
1.124311, -0.4582072, 1.531318, 1, 0, 0.6941177, 1,
1.124911, -0.5086375, 4.967861, 1, 0, 0.6901961, 1,
1.12875, -0.9347222, 2.872926, 1, 0, 0.682353, 1,
1.138835, -1.402832, 3.314658, 1, 0, 0.6784314, 1,
1.145885, -1.830885, 1.582877, 1, 0, 0.6705883, 1,
1.148783, 0.1828971, 2.0594, 1, 0, 0.6666667, 1,
1.16007, -1.102915, 1.817382, 1, 0, 0.6588235, 1,
1.167516, -2.377594, 2.307101, 1, 0, 0.654902, 1,
1.173566, -0.6316945, 2.68246, 1, 0, 0.6470588, 1,
1.173856, 0.1322311, 3.280578, 1, 0, 0.6431373, 1,
1.183925, 0.3229195, 0.5364989, 1, 0, 0.6352941, 1,
1.187478, 0.7568808, 1.163018, 1, 0, 0.6313726, 1,
1.188674, 2.223067, 0.218945, 1, 0, 0.6235294, 1,
1.192764, 0.1303634, 0.4944041, 1, 0, 0.6196079, 1,
1.204416, -0.2454031, -0.3884008, 1, 0, 0.6117647, 1,
1.206854, -0.2414872, 2.457685, 1, 0, 0.6078432, 1,
1.208086, 1.420668, -0.5356815, 1, 0, 0.6, 1,
1.212377, -1.045039, 2.812741, 1, 0, 0.5921569, 1,
1.253023, 0.06727238, 1.444923, 1, 0, 0.5882353, 1,
1.257555, -1.089895, 1.206951, 1, 0, 0.5803922, 1,
1.263552, 1.057803, 1.037024, 1, 0, 0.5764706, 1,
1.273663, -0.8331723, 2.68437, 1, 0, 0.5686275, 1,
1.275964, 0.6376771, 2.354896, 1, 0, 0.5647059, 1,
1.280789, 0.7330706, 1.463209, 1, 0, 0.5568628, 1,
1.286774, 0.8202029, 1.939906, 1, 0, 0.5529412, 1,
1.288793, -0.1438118, 0.579523, 1, 0, 0.5450981, 1,
1.288837, -0.02682784, 0.5648343, 1, 0, 0.5411765, 1,
1.290147, 0.001634919, 3.184993, 1, 0, 0.5333334, 1,
1.292439, 0.3314944, 0.6185821, 1, 0, 0.5294118, 1,
1.301575, -1.042476, 2.441091, 1, 0, 0.5215687, 1,
1.302673, -0.06720541, 1.574307, 1, 0, 0.5176471, 1,
1.312468, 0.7103367, 2.976302, 1, 0, 0.509804, 1,
1.315956, -0.5032015, 1.418642, 1, 0, 0.5058824, 1,
1.319408, -0.2444653, 1.426298, 1, 0, 0.4980392, 1,
1.322519, 0.6014423, 0.7151385, 1, 0, 0.4901961, 1,
1.323224, 0.8487227, 1.983595, 1, 0, 0.4862745, 1,
1.339102, 1.952318, 1.213593, 1, 0, 0.4784314, 1,
1.350286, 0.4838106, 2.04174, 1, 0, 0.4745098, 1,
1.355338, 0.07117418, -0.8142251, 1, 0, 0.4666667, 1,
1.365447, 0.2302702, 1.657636, 1, 0, 0.4627451, 1,
1.38369, -1.005012, 3.530699, 1, 0, 0.454902, 1,
1.3935, 0.09026257, 1.751675, 1, 0, 0.4509804, 1,
1.396165, -1.006542, 1.898802, 1, 0, 0.4431373, 1,
1.399102, -0.4025925, 1.743182, 1, 0, 0.4392157, 1,
1.406163, -0.0391196, 1.764835, 1, 0, 0.4313726, 1,
1.408583, 1.065828, 0.5232716, 1, 0, 0.427451, 1,
1.41466, -0.4797139, 3.379781, 1, 0, 0.4196078, 1,
1.434629, 0.8750849, 0.402615, 1, 0, 0.4156863, 1,
1.452287, 0.1642583, 2.824207, 1, 0, 0.4078431, 1,
1.472842, -0.1664321, 3.073747, 1, 0, 0.4039216, 1,
1.475002, 1.294308, 1.31538, 1, 0, 0.3960784, 1,
1.490811, -0.2545837, 0.4321326, 1, 0, 0.3882353, 1,
1.491491, 0.08201816, 3.806599, 1, 0, 0.3843137, 1,
1.499214, -1.93466, 0.5963765, 1, 0, 0.3764706, 1,
1.503354, -0.1929261, 2.248776, 1, 0, 0.372549, 1,
1.508029, -0.1581012, 0.7553006, 1, 0, 0.3647059, 1,
1.50866, 1.339252, 0.3165169, 1, 0, 0.3607843, 1,
1.512137, -1.724892, 4.15, 1, 0, 0.3529412, 1,
1.530924, -0.2059499, 1.157931, 1, 0, 0.3490196, 1,
1.538183, -0.0955401, 0.2845998, 1, 0, 0.3411765, 1,
1.538218, -0.461244, 1.424268, 1, 0, 0.3372549, 1,
1.540911, 2.834803, 0.4222153, 1, 0, 0.3294118, 1,
1.544716, -0.7243922, 2.778145, 1, 0, 0.3254902, 1,
1.547783, -0.1026615, 3.310325, 1, 0, 0.3176471, 1,
1.549796, 0.9118378, -0.1363128, 1, 0, 0.3137255, 1,
1.558165, 0.2435764, 2.819726, 1, 0, 0.3058824, 1,
1.567663, 0.2105266, 2.54155, 1, 0, 0.2980392, 1,
1.583675, 0.03592945, 0.8554751, 1, 0, 0.2941177, 1,
1.592355, -0.201074, 1.823828, 1, 0, 0.2862745, 1,
1.617844, 1.665071, 0.479529, 1, 0, 0.282353, 1,
1.627172, 1.61212, 1.284288, 1, 0, 0.2745098, 1,
1.628182, -1.001627, 1.531171, 1, 0, 0.2705882, 1,
1.634013, 0.2964014, 0.9738131, 1, 0, 0.2627451, 1,
1.645572, -0.01699687, 0.8303466, 1, 0, 0.2588235, 1,
1.649683, 1.692317, -0.4441432, 1, 0, 0.2509804, 1,
1.650238, 0.3198053, 0.7610528, 1, 0, 0.2470588, 1,
1.717063, -0.7747281, 1.153843, 1, 0, 0.2392157, 1,
1.831217, 0.8059689, -0.2406133, 1, 0, 0.2352941, 1,
1.845089, -0.1656463, 1.307833, 1, 0, 0.227451, 1,
1.861564, -0.1713433, 2.810226, 1, 0, 0.2235294, 1,
1.889055, -0.1179637, 3.264856, 1, 0, 0.2156863, 1,
1.894135, 0.181205, 1.572987, 1, 0, 0.2117647, 1,
1.91033, -1.629685, 2.466131, 1, 0, 0.2039216, 1,
1.923181, 0.4339525, 0.8959078, 1, 0, 0.1960784, 1,
1.932598, 1.269859, -0.1786813, 1, 0, 0.1921569, 1,
1.966713, 0.963119, 2.267187, 1, 0, 0.1843137, 1,
1.976958, -1.21278, 2.421578, 1, 0, 0.1803922, 1,
1.97716, 0.7766351, 0.7058667, 1, 0, 0.172549, 1,
2.011321, -0.3576266, 2.181148, 1, 0, 0.1686275, 1,
2.012101, 0.7325328, 0.3305892, 1, 0, 0.1607843, 1,
2.028109, 0.7179608, 2.752633, 1, 0, 0.1568628, 1,
2.035122, 1.087034, 2.756315, 1, 0, 0.1490196, 1,
2.150875, -1.713583, 1.366887, 1, 0, 0.145098, 1,
2.16053, 0.407301, 1.239324, 1, 0, 0.1372549, 1,
2.168894, 0.5118347, 1.482923, 1, 0, 0.1333333, 1,
2.1868, 0.1527407, 2.45733, 1, 0, 0.1254902, 1,
2.198519, 0.5605251, 0.7208195, 1, 0, 0.1215686, 1,
2.241598, 0.2907991, 1.254032, 1, 0, 0.1137255, 1,
2.300598, 0.4919508, -1.18518, 1, 0, 0.1098039, 1,
2.309166, 0.9160968, 1.618103, 1, 0, 0.1019608, 1,
2.325014, 0.667482, 2.551474, 1, 0, 0.09411765, 1,
2.330118, 0.5429123, 0.9451388, 1, 0, 0.09019608, 1,
2.558346, -0.8183233, -0.1826313, 1, 0, 0.08235294, 1,
2.59891, -0.6909018, 1.594865, 1, 0, 0.07843138, 1,
2.619313, 0.4690215, 2.070657, 1, 0, 0.07058824, 1,
2.653641, -1.096178, 2.628213, 1, 0, 0.06666667, 1,
2.707489, 0.5912555, 0.6161852, 1, 0, 0.05882353, 1,
2.76558, 1.222372, 3.10486, 1, 0, 0.05490196, 1,
2.829251, -0.8235648, -0.3416854, 1, 0, 0.04705882, 1,
2.833356, 1.865071, 0.6985264, 1, 0, 0.04313726, 1,
2.935016, -1.349398, 1.326959, 1, 0, 0.03529412, 1,
3.009096, 0.004089828, 1.136077, 1, 0, 0.03137255, 1,
3.018988, 0.6020692, 0.9871953, 1, 0, 0.02352941, 1,
3.127616, -0.04110314, 3.070812, 1, 0, 0.01960784, 1,
3.496307, -1.619284, 2.335569, 1, 0, 0.01176471, 1,
3.946509, 1.065223, 3.735018, 1, 0, 0.007843138, 1
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
0.250447, -4.407041, -6.844995, 0, -0.5, 0.5, 0.5,
0.250447, -4.407041, -6.844995, 1, -0.5, 0.5, 0.5,
0.250447, -4.407041, -6.844995, 1, 1.5, 0.5, 0.5,
0.250447, -4.407041, -6.844995, 0, 1.5, 0.5, 0.5
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
-4.69858, 0.4390295, -6.844995, 0, -0.5, 0.5, 0.5,
-4.69858, 0.4390295, -6.844995, 1, -0.5, 0.5, 0.5,
-4.69858, 0.4390295, -6.844995, 1, 1.5, 0.5, 0.5,
-4.69858, 0.4390295, -6.844995, 0, 1.5, 0.5, 0.5
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
-4.69858, -4.407041, 0.4342723, 0, -0.5, 0.5, 0.5,
-4.69858, -4.407041, 0.4342723, 1, -0.5, 0.5, 0.5,
-4.69858, -4.407041, 0.4342723, 1, 1.5, 0.5, 0.5,
-4.69858, -4.407041, 0.4342723, 0, 1.5, 0.5, 0.5
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
-2, -3.288717, -5.165164,
2, -3.288717, -5.165164,
-2, -3.288717, -5.165164,
-2, -3.475104, -5.445137,
0, -3.288717, -5.165164,
0, -3.475104, -5.445137,
2, -3.288717, -5.165164,
2, -3.475104, -5.445137
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
-2, -3.847879, -6.00508, 0, -0.5, 0.5, 0.5,
-2, -3.847879, -6.00508, 1, -0.5, 0.5, 0.5,
-2, -3.847879, -6.00508, 1, 1.5, 0.5, 0.5,
-2, -3.847879, -6.00508, 0, 1.5, 0.5, 0.5,
0, -3.847879, -6.00508, 0, -0.5, 0.5, 0.5,
0, -3.847879, -6.00508, 1, -0.5, 0.5, 0.5,
0, -3.847879, -6.00508, 1, 1.5, 0.5, 0.5,
0, -3.847879, -6.00508, 0, 1.5, 0.5, 0.5,
2, -3.847879, -6.00508, 0, -0.5, 0.5, 0.5,
2, -3.847879, -6.00508, 1, -0.5, 0.5, 0.5,
2, -3.847879, -6.00508, 1, 1.5, 0.5, 0.5,
2, -3.847879, -6.00508, 0, 1.5, 0.5, 0.5
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
-3.556497, -2, -5.165164,
-3.556497, 4, -5.165164,
-3.556497, -2, -5.165164,
-3.746844, -2, -5.445137,
-3.556497, 0, -5.165164,
-3.746844, 0, -5.445137,
-3.556497, 2, -5.165164,
-3.746844, 2, -5.445137,
-3.556497, 4, -5.165164,
-3.746844, 4, -5.445137
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
-4.127538, -2, -6.00508, 0, -0.5, 0.5, 0.5,
-4.127538, -2, -6.00508, 1, -0.5, 0.5, 0.5,
-4.127538, -2, -6.00508, 1, 1.5, 0.5, 0.5,
-4.127538, -2, -6.00508, 0, 1.5, 0.5, 0.5,
-4.127538, 0, -6.00508, 0, -0.5, 0.5, 0.5,
-4.127538, 0, -6.00508, 1, -0.5, 0.5, 0.5,
-4.127538, 0, -6.00508, 1, 1.5, 0.5, 0.5,
-4.127538, 0, -6.00508, 0, 1.5, 0.5, 0.5,
-4.127538, 2, -6.00508, 0, -0.5, 0.5, 0.5,
-4.127538, 2, -6.00508, 1, -0.5, 0.5, 0.5,
-4.127538, 2, -6.00508, 1, 1.5, 0.5, 0.5,
-4.127538, 2, -6.00508, 0, 1.5, 0.5, 0.5,
-4.127538, 4, -6.00508, 0, -0.5, 0.5, 0.5,
-4.127538, 4, -6.00508, 1, -0.5, 0.5, 0.5,
-4.127538, 4, -6.00508, 1, 1.5, 0.5, 0.5,
-4.127538, 4, -6.00508, 0, 1.5, 0.5, 0.5
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
-3.556497, -3.288717, -4,
-3.556497, -3.288717, 4,
-3.556497, -3.288717, -4,
-3.746844, -3.475104, -4,
-3.556497, -3.288717, -2,
-3.746844, -3.475104, -2,
-3.556497, -3.288717, 0,
-3.746844, -3.475104, 0,
-3.556497, -3.288717, 2,
-3.746844, -3.475104, 2,
-3.556497, -3.288717, 4,
-3.746844, -3.475104, 4
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
-4.127538, -3.847879, -4, 0, -0.5, 0.5, 0.5,
-4.127538, -3.847879, -4, 1, -0.5, 0.5, 0.5,
-4.127538, -3.847879, -4, 1, 1.5, 0.5, 0.5,
-4.127538, -3.847879, -4, 0, 1.5, 0.5, 0.5,
-4.127538, -3.847879, -2, 0, -0.5, 0.5, 0.5,
-4.127538, -3.847879, -2, 1, -0.5, 0.5, 0.5,
-4.127538, -3.847879, -2, 1, 1.5, 0.5, 0.5,
-4.127538, -3.847879, -2, 0, 1.5, 0.5, 0.5,
-4.127538, -3.847879, 0, 0, -0.5, 0.5, 0.5,
-4.127538, -3.847879, 0, 1, -0.5, 0.5, 0.5,
-4.127538, -3.847879, 0, 1, 1.5, 0.5, 0.5,
-4.127538, -3.847879, 0, 0, 1.5, 0.5, 0.5,
-4.127538, -3.847879, 2, 0, -0.5, 0.5, 0.5,
-4.127538, -3.847879, 2, 1, -0.5, 0.5, 0.5,
-4.127538, -3.847879, 2, 1, 1.5, 0.5, 0.5,
-4.127538, -3.847879, 2, 0, 1.5, 0.5, 0.5,
-4.127538, -3.847879, 4, 0, -0.5, 0.5, 0.5,
-4.127538, -3.847879, 4, 1, -0.5, 0.5, 0.5,
-4.127538, -3.847879, 4, 1, 1.5, 0.5, 0.5,
-4.127538, -3.847879, 4, 0, 1.5, 0.5, 0.5
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
-3.556497, -3.288717, -5.165164,
-3.556497, 4.166776, -5.165164,
-3.556497, -3.288717, 6.033709,
-3.556497, 4.166776, 6.033709,
-3.556497, -3.288717, -5.165164,
-3.556497, -3.288717, 6.033709,
-3.556497, 4.166776, -5.165164,
-3.556497, 4.166776, 6.033709,
-3.556497, -3.288717, -5.165164,
4.057391, -3.288717, -5.165164,
-3.556497, -3.288717, 6.033709,
4.057391, -3.288717, 6.033709,
-3.556497, 4.166776, -5.165164,
4.057391, 4.166776, -5.165164,
-3.556497, 4.166776, 6.033709,
4.057391, 4.166776, 6.033709,
4.057391, -3.288717, -5.165164,
4.057391, 4.166776, -5.165164,
4.057391, -3.288717, 6.033709,
4.057391, 4.166776, 6.033709,
4.057391, -3.288717, -5.165164,
4.057391, -3.288717, 6.033709,
4.057391, 4.166776, -5.165164,
4.057391, 4.166776, 6.033709
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
var radius = 8.254629;
var distance = 36.72578;
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
mvMatrix.translate( -0.250447, -0.4390295, -0.4342723 );
mvMatrix.scale( 1.172209, 1.197113, 0.7969611 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.72578);
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
Glutarimide<-read.table("Glutarimide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Glutarimide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Glutarimide' not found
```

```r
y<-Glutarimide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Glutarimide' not found
```

```r
z<-Glutarimide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Glutarimide' not found
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
-3.445615, -0.369625, -1.579921, 0, 0, 1, 1, 1,
-3.006227, -0.4944153, -0.6499497, 1, 0, 0, 1, 1,
-2.871212, -0.1361867, -0.7855509, 1, 0, 0, 1, 1,
-2.742836, -0.4751418, -1.305911, 1, 0, 0, 1, 1,
-2.648219, 0.2304271, -2.277663, 1, 0, 0, 1, 1,
-2.528551, 0.3923724, -1.964926, 1, 0, 0, 1, 1,
-2.457158, -0.3494881, -1.282267, 0, 0, 0, 1, 1,
-2.398919, 1.16301, -1.12565, 0, 0, 0, 1, 1,
-2.276079, -0.2483921, -0.8629926, 0, 0, 0, 1, 1,
-2.255873, -0.7393478, -3.821513, 0, 0, 0, 1, 1,
-2.238378, -1.550318, -1.411038, 0, 0, 0, 1, 1,
-2.162269, 0.2443673, -1.65572, 0, 0, 0, 1, 1,
-2.160586, 1.282404, -0.9773816, 0, 0, 0, 1, 1,
-2.156899, -0.5169648, -1.672866, 1, 1, 1, 1, 1,
-2.147527, 0.1626427, -1.494627, 1, 1, 1, 1, 1,
-2.142207, -1.069862, -0.7929273, 1, 1, 1, 1, 1,
-2.14013, -0.3760549, -1.741686, 1, 1, 1, 1, 1,
-2.116671, 0.06708726, -1.186228, 1, 1, 1, 1, 1,
-2.061441, 1.783487, -1.307616, 1, 1, 1, 1, 1,
-2.007823, -0.1632477, -1.297664, 1, 1, 1, 1, 1,
-1.995337, -1.330694, -1.402497, 1, 1, 1, 1, 1,
-1.9912, 0.7562724, -1.211583, 1, 1, 1, 1, 1,
-1.972159, -2.353482, -2.05199, 1, 1, 1, 1, 1,
-1.964275, -0.6327195, -1.472073, 1, 1, 1, 1, 1,
-1.942672, -0.6552271, -1.86067, 1, 1, 1, 1, 1,
-1.931073, 0.6863042, -1.953952, 1, 1, 1, 1, 1,
-1.908826, 0.9775838, -1.359166, 1, 1, 1, 1, 1,
-1.883528, -1.258718, -1.090782, 1, 1, 1, 1, 1,
-1.868819, -0.5109788, -1.616166, 0, 0, 1, 1, 1,
-1.862561, 0.1587317, -2.667177, 1, 0, 0, 1, 1,
-1.857263, -0.6117563, -1.795185, 1, 0, 0, 1, 1,
-1.847124, 0.7613674, -2.430194, 1, 0, 0, 1, 1,
-1.814418, 1.178511, -0.07061356, 1, 0, 0, 1, 1,
-1.812706, 1.281046, 0.4409959, 1, 0, 0, 1, 1,
-1.762436, 0.4055505, -3.011023, 0, 0, 0, 1, 1,
-1.760748, 1.989758, -0.5041581, 0, 0, 0, 1, 1,
-1.755122, 0.01202181, -1.505828, 0, 0, 0, 1, 1,
-1.738814, -0.202915, 0.04996722, 0, 0, 0, 1, 1,
-1.731747, 0.7376696, -1.332623, 0, 0, 0, 1, 1,
-1.721187, -0.2506022, -2.469256, 0, 0, 0, 1, 1,
-1.712492, 0.915504, -1.076252, 0, 0, 0, 1, 1,
-1.706245, 0.05080581, -0.7603729, 1, 1, 1, 1, 1,
-1.701668, -0.688454, -3.788938, 1, 1, 1, 1, 1,
-1.6881, 0.5311434, -1.86923, 1, 1, 1, 1, 1,
-1.682203, 0.3484426, -0.268613, 1, 1, 1, 1, 1,
-1.674376, 0.6739173, -1.703219, 1, 1, 1, 1, 1,
-1.672878, 0.05593003, -2.075555, 1, 1, 1, 1, 1,
-1.669394, 0.2926717, -1.744585, 1, 1, 1, 1, 1,
-1.667729, -0.8996661, -1.952254, 1, 1, 1, 1, 1,
-1.665267, -0.1765413, 0.09870463, 1, 1, 1, 1, 1,
-1.655442, -0.2030428, -0.5474789, 1, 1, 1, 1, 1,
-1.650092, -0.04660753, -1.380559, 1, 1, 1, 1, 1,
-1.640027, 0.6277872, -0.366976, 1, 1, 1, 1, 1,
-1.635057, -0.7428454, -1.167442, 1, 1, 1, 1, 1,
-1.629261, 1.135605, -2.395986, 1, 1, 1, 1, 1,
-1.620144, -0.5809976, -4.023464, 1, 1, 1, 1, 1,
-1.615489, 0.2980967, -1.015948, 0, 0, 1, 1, 1,
-1.612529, -1.093235, -3.203242, 1, 0, 0, 1, 1,
-1.610092, 1.877944, -0.2582902, 1, 0, 0, 1, 1,
-1.604027, 0.02329457, -0.3176954, 1, 0, 0, 1, 1,
-1.5914, -0.7623833, -1.147483, 1, 0, 0, 1, 1,
-1.56434, 0.6565235, -1.200086, 1, 0, 0, 1, 1,
-1.558378, -0.6588959, -1.562279, 0, 0, 0, 1, 1,
-1.54634, 0.1903206, -2.619437, 0, 0, 0, 1, 1,
-1.52752, 1.154735, -1.473844, 0, 0, 0, 1, 1,
-1.522912, -1.36905, -3.321241, 0, 0, 0, 1, 1,
-1.51633, 0.8870728, -1.953374, 0, 0, 0, 1, 1,
-1.502171, -1.120471, -2.854264, 0, 0, 0, 1, 1,
-1.490792, 0.2635294, -0.4116006, 0, 0, 0, 1, 1,
-1.480935, 0.8276978, -1.175153, 1, 1, 1, 1, 1,
-1.475833, -0.7216582, -2.571976, 1, 1, 1, 1, 1,
-1.465828, 1.105278, 0.5444707, 1, 1, 1, 1, 1,
-1.460117, 1.708576, -0.7856492, 1, 1, 1, 1, 1,
-1.446429, 0.6151243, -1.95761, 1, 1, 1, 1, 1,
-1.438612, 1.106555, -1.267262, 1, 1, 1, 1, 1,
-1.436993, 0.4744657, -1.763704, 1, 1, 1, 1, 1,
-1.428474, 0.4362009, 0.1750882, 1, 1, 1, 1, 1,
-1.418152, -0.3707782, -0.7866623, 1, 1, 1, 1, 1,
-1.415265, 1.318517, -1.937222, 1, 1, 1, 1, 1,
-1.401297, 0.3378852, -2.640322, 1, 1, 1, 1, 1,
-1.399013, 0.9477752, 0.9148167, 1, 1, 1, 1, 1,
-1.397416, 1.087396, -2.223117, 1, 1, 1, 1, 1,
-1.393208, -1.58218, -3.242085, 1, 1, 1, 1, 1,
-1.382663, 0.2221422, -0.1332327, 1, 1, 1, 1, 1,
-1.380399, 0.5359645, -1.46478, 0, 0, 1, 1, 1,
-1.380339, 1.220448, -0.1941577, 1, 0, 0, 1, 1,
-1.374677, 0.53004, -0.5045803, 1, 0, 0, 1, 1,
-1.371468, 0.3466131, -2.694008, 1, 0, 0, 1, 1,
-1.363049, -1.598612, -3.831153, 1, 0, 0, 1, 1,
-1.358017, -1.012026, -1.951481, 1, 0, 0, 1, 1,
-1.353361, 1.826464, -0.2406002, 0, 0, 0, 1, 1,
-1.353016, 0.6199596, -3.562859, 0, 0, 0, 1, 1,
-1.336066, -0.4530276, -1.459899, 0, 0, 0, 1, 1,
-1.332104, 0.941142, -1.457163, 0, 0, 0, 1, 1,
-1.314041, -0.3409589, -1.085655, 0, 0, 0, 1, 1,
-1.311946, 0.18983, -0.9444269, 0, 0, 0, 1, 1,
-1.311322, -0.1714439, -1.797434, 0, 0, 0, 1, 1,
-1.31075, 0.08707434, -2.932465, 1, 1, 1, 1, 1,
-1.293224, -0.1611486, -0.7734514, 1, 1, 1, 1, 1,
-1.290076, 1.099713, -3.353982, 1, 1, 1, 1, 1,
-1.281262, -0.2331214, -3.940125, 1, 1, 1, 1, 1,
-1.279052, 0.4755099, -1.170439, 1, 1, 1, 1, 1,
-1.274183, 0.2469388, -3.30949, 1, 1, 1, 1, 1,
-1.272836, 0.5216563, -0.8305844, 1, 1, 1, 1, 1,
-1.265565, 0.3901273, 0.07965242, 1, 1, 1, 1, 1,
-1.263514, 1.394467, -1.466541, 1, 1, 1, 1, 1,
-1.254792, 0.7339729, -0.5105734, 1, 1, 1, 1, 1,
-1.250845, 0.9657907, -2.436355, 1, 1, 1, 1, 1,
-1.249809, 0.1646588, -1.138103, 1, 1, 1, 1, 1,
-1.249397, 0.8120223, -0.3926905, 1, 1, 1, 1, 1,
-1.245656, 0.08471023, -1.784185, 1, 1, 1, 1, 1,
-1.243664, 0.4965016, -1.515077, 1, 1, 1, 1, 1,
-1.235546, 0.3409753, -0.9385728, 0, 0, 1, 1, 1,
-1.229076, -1.336511, -0.9216416, 1, 0, 0, 1, 1,
-1.225257, -0.703186, -1.100723, 1, 0, 0, 1, 1,
-1.222262, 0.8069718, -0.3228027, 1, 0, 0, 1, 1,
-1.20833, -1.392307, -1.313522, 1, 0, 0, 1, 1,
-1.205001, 0.7271906, 0.4497613, 1, 0, 0, 1, 1,
-1.20087, -0.2110091, -1.142169, 0, 0, 0, 1, 1,
-1.192955, -2.007668, -4.038633, 0, 0, 0, 1, 1,
-1.190077, -0.04790697, -2.727928, 0, 0, 0, 1, 1,
-1.189585, 1.20854, -0.8982073, 0, 0, 0, 1, 1,
-1.182142, 1.351678, -2.582499, 0, 0, 0, 1, 1,
-1.172186, 0.5441008, -0.2005277, 0, 0, 0, 1, 1,
-1.170978, -0.527669, -1.920065, 0, 0, 0, 1, 1,
-1.160813, 0.9290759, -0.5486256, 1, 1, 1, 1, 1,
-1.156853, -1.505241, -1.446564, 1, 1, 1, 1, 1,
-1.155031, -0.8429495, -2.743486, 1, 1, 1, 1, 1,
-1.152961, -1.729208, -2.962746, 1, 1, 1, 1, 1,
-1.152493, 1.751149, -0.2809588, 1, 1, 1, 1, 1,
-1.144248, -0.09149544, -2.235989, 1, 1, 1, 1, 1,
-1.142125, 0.3067015, -1.996674, 1, 1, 1, 1, 1,
-1.140027, 0.366581, -1.021867, 1, 1, 1, 1, 1,
-1.127649, 1.652163, -1.713656, 1, 1, 1, 1, 1,
-1.127255, 1.846833, -0.3118322, 1, 1, 1, 1, 1,
-1.124552, 0.03518907, -2.787544, 1, 1, 1, 1, 1,
-1.120357, -0.3733581, -3.145194, 1, 1, 1, 1, 1,
-1.114705, 0.2371526, -3.397151, 1, 1, 1, 1, 1,
-1.110015, 0.3919131, -1.335787, 1, 1, 1, 1, 1,
-1.109387, -1.27638, -3.067091, 1, 1, 1, 1, 1,
-1.103963, -0.4096072, -0.05274522, 0, 0, 1, 1, 1,
-1.098927, 2.004677, -0.7215282, 1, 0, 0, 1, 1,
-1.095739, -1.3896, -2.665496, 1, 0, 0, 1, 1,
-1.092408, 0.1157495, -1.591456, 1, 0, 0, 1, 1,
-1.091418, -0.05854723, -1.220222, 1, 0, 0, 1, 1,
-1.089861, 0.0918039, -0.6228321, 1, 0, 0, 1, 1,
-1.088739, 0.4653701, -0.06823123, 0, 0, 0, 1, 1,
-1.086393, 1.408635, -1.473216, 0, 0, 0, 1, 1,
-1.074009, 0.1202973, -2.272698, 0, 0, 0, 1, 1,
-1.068362, 1.028085, 0.0729445, 0, 0, 0, 1, 1,
-1.067256, 0.5028132, -1.688077, 0, 0, 0, 1, 1,
-1.067011, -0.4190356, -2.732581, 0, 0, 0, 1, 1,
-1.058296, 0.8040823, -2.660082, 0, 0, 0, 1, 1,
-1.042485, -1.349838, -2.409262, 1, 1, 1, 1, 1,
-1.041444, 0.9351057, -1.128008, 1, 1, 1, 1, 1,
-1.041429, 1.048018, 0.1488466, 1, 1, 1, 1, 1,
-1.039447, -1.58664, -0.9283984, 1, 1, 1, 1, 1,
-1.029086, 1.252572, 0.363219, 1, 1, 1, 1, 1,
-1.028355, 1.29195, -2.036934, 1, 1, 1, 1, 1,
-1.028273, -2.272543, -0.2638118, 1, 1, 1, 1, 1,
-1.018352, -0.9539072, -0.1985468, 1, 1, 1, 1, 1,
-1.014249, -0.1543714, -0.4382585, 1, 1, 1, 1, 1,
-1.01407, -1.285544, -0.9958909, 1, 1, 1, 1, 1,
-1.007377, 0.3912893, -0.4932261, 1, 1, 1, 1, 1,
-1.00551, 1.166197, 0.5457671, 1, 1, 1, 1, 1,
-1.000516, 0.9341217, -1.245216, 1, 1, 1, 1, 1,
-0.9965009, 0.6245367, -1.106552, 1, 1, 1, 1, 1,
-0.9872835, -0.7159379, -1.072493, 1, 1, 1, 1, 1,
-0.9836618, -0.7423051, -2.901934, 0, 0, 1, 1, 1,
-0.9829651, 0.6825284, -2.025004, 1, 0, 0, 1, 1,
-0.9806575, 1.585185, 0.05282893, 1, 0, 0, 1, 1,
-0.9792559, 0.3153063, -0.2174366, 1, 0, 0, 1, 1,
-0.9775408, 0.2565587, 0.4777462, 1, 0, 0, 1, 1,
-0.9760427, -0.1619201, -2.167986, 1, 0, 0, 1, 1,
-0.9696189, -0.06063139, -0.7511144, 0, 0, 0, 1, 1,
-0.9692729, 0.4854902, -0.2071446, 0, 0, 0, 1, 1,
-0.9687742, -0.5778811, -2.964247, 0, 0, 0, 1, 1,
-0.960477, -0.6011985, -2.39445, 0, 0, 0, 1, 1,
-0.9583386, -0.1122394, -1.516418, 0, 0, 0, 1, 1,
-0.9548217, -2.876637, -3.686924, 0, 0, 0, 1, 1,
-0.9540823, 1.494132, -2.557669, 0, 0, 0, 1, 1,
-0.9514274, 0.4894778, -0.1827173, 1, 1, 1, 1, 1,
-0.9508587, -0.1970652, -2.165521, 1, 1, 1, 1, 1,
-0.947172, -0.4051267, -3.472604, 1, 1, 1, 1, 1,
-0.9464683, 0.0005527907, -2.273071, 1, 1, 1, 1, 1,
-0.9454848, -0.8692882, -0.8175623, 1, 1, 1, 1, 1,
-0.9450208, 1.118548, -1.29959, 1, 1, 1, 1, 1,
-0.9364195, -0.09725915, -2.960354, 1, 1, 1, 1, 1,
-0.9323629, 1.510625, -0.8605571, 1, 1, 1, 1, 1,
-0.9289095, 0.333174, -1.618636, 1, 1, 1, 1, 1,
-0.9272751, 1.702584, -1.084787, 1, 1, 1, 1, 1,
-0.9271908, 1.347805, -0.48963, 1, 1, 1, 1, 1,
-0.9259585, -0.3859101, -1.0224, 1, 1, 1, 1, 1,
-0.9259313, 0.03096831, -1.318739, 1, 1, 1, 1, 1,
-0.9225758, 0.2773448, -1.028365, 1, 1, 1, 1, 1,
-0.9173117, 0.9093392, -0.8291016, 1, 1, 1, 1, 1,
-0.9119321, -1.068022, -0.490135, 0, 0, 1, 1, 1,
-0.910419, 0.01913995, -1.772458, 1, 0, 0, 1, 1,
-0.9049476, -0.22439, -0.7225771, 1, 0, 0, 1, 1,
-0.9037653, 0.7161235, -2.099231, 1, 0, 0, 1, 1,
-0.9028655, 0.8405393, -1.593103, 1, 0, 0, 1, 1,
-0.8927293, 2.861397, -0.4220957, 1, 0, 0, 1, 1,
-0.8883414, -0.2685288, -1.624175, 0, 0, 0, 1, 1,
-0.8677869, -1.705085, -3.201938, 0, 0, 0, 1, 1,
-0.8630015, 1.004231, -1.56893, 0, 0, 0, 1, 1,
-0.8567586, 0.6355951, 0.7455845, 0, 0, 0, 1, 1,
-0.855545, 0.5896271, -1.263396, 0, 0, 0, 1, 1,
-0.8462593, 2.054963, -0.03391167, 0, 0, 0, 1, 1,
-0.8362613, 0.7200161, 0.09575896, 0, 0, 0, 1, 1,
-0.8330502, -0.3002675, -2.773896, 1, 1, 1, 1, 1,
-0.8239029, 1.119527, -0.09935483, 1, 1, 1, 1, 1,
-0.8189513, -1.225693, -0.07354121, 1, 1, 1, 1, 1,
-0.8168722, 0.428501, -1.740549, 1, 1, 1, 1, 1,
-0.8132718, -2.009524, -3.029478, 1, 1, 1, 1, 1,
-0.8071597, -0.7333741, -2.288811, 1, 1, 1, 1, 1,
-0.8065285, -0.3416231, -2.642766, 1, 1, 1, 1, 1,
-0.8057794, -2.463368, -3.256263, 1, 1, 1, 1, 1,
-0.7995856, -0.1920878, -0.6437334, 1, 1, 1, 1, 1,
-0.7979371, 1.138453, -1.318705, 1, 1, 1, 1, 1,
-0.7911443, -0.2461107, -2.078018, 1, 1, 1, 1, 1,
-0.7908944, -0.4836251, -2.928244, 1, 1, 1, 1, 1,
-0.7881197, 1.044604, -0.4457752, 1, 1, 1, 1, 1,
-0.7849007, 1.083002, -0.1903054, 1, 1, 1, 1, 1,
-0.7825961, 0.5819785, -0.8598975, 1, 1, 1, 1, 1,
-0.7807373, -0.123989, 0.3762125, 0, 0, 1, 1, 1,
-0.780268, -0.164554, -1.780708, 1, 0, 0, 1, 1,
-0.7786359, -2.483446, -1.449656, 1, 0, 0, 1, 1,
-0.7740039, -0.7610635, -5.002074, 1, 0, 0, 1, 1,
-0.7737518, -0.3440907, -2.725041, 1, 0, 0, 1, 1,
-0.769412, -1.908201, -2.591125, 1, 0, 0, 1, 1,
-0.764226, 1.504952, -0.2465536, 0, 0, 0, 1, 1,
-0.7610911, -0.924279, -1.904544, 0, 0, 0, 1, 1,
-0.7497175, 2.405525, -0.2454101, 0, 0, 0, 1, 1,
-0.7451435, -0.1320612, -1.112751, 0, 0, 0, 1, 1,
-0.7421664, -0.8505722, -3.476526, 0, 0, 0, 1, 1,
-0.7391391, -0.4557588, -4.609465, 0, 0, 0, 1, 1,
-0.7372068, 0.7003903, -2.285066, 0, 0, 0, 1, 1,
-0.7310305, -0.2632686, -1.891503, 1, 1, 1, 1, 1,
-0.7265258, 0.4072652, -1.482865, 1, 1, 1, 1, 1,
-0.7197034, -3.180142, -0.1433074, 1, 1, 1, 1, 1,
-0.7149571, 0.1430941, -0.03227717, 1, 1, 1, 1, 1,
-0.7148882, -1.031613, -4.826228, 1, 1, 1, 1, 1,
-0.7093971, 0.03247339, -2.120147, 1, 1, 1, 1, 1,
-0.7038055, -0.9739925, -3.133601, 1, 1, 1, 1, 1,
-0.7017045, -1.059362, -3.010889, 1, 1, 1, 1, 1,
-0.7010954, -1.259783, -3.18554, 1, 1, 1, 1, 1,
-0.7000077, -0.5730604, -3.475083, 1, 1, 1, 1, 1,
-0.6951934, 0.1677578, -0.4650485, 1, 1, 1, 1, 1,
-0.692839, -0.2565286, -1.467616, 1, 1, 1, 1, 1,
-0.6897628, 0.5443677, 0.6375043, 1, 1, 1, 1, 1,
-0.6881326, -0.3858524, -2.77562, 1, 1, 1, 1, 1,
-0.6803058, 0.4837422, 0.1400756, 1, 1, 1, 1, 1,
-0.6796941, 1.137265, -0.3594097, 0, 0, 1, 1, 1,
-0.678857, -1.896108, -3.25725, 1, 0, 0, 1, 1,
-0.6782526, -0.2626077, -2.78518, 1, 0, 0, 1, 1,
-0.677897, -1.456707, -3.49249, 1, 0, 0, 1, 1,
-0.6774786, -0.0123269, -2.716712, 1, 0, 0, 1, 1,
-0.6770296, 0.8805645, -0.9534717, 1, 0, 0, 1, 1,
-0.6766568, 0.595322, -1.069223, 0, 0, 0, 1, 1,
-0.6764018, 0.2207194, -2.430385, 0, 0, 0, 1, 1,
-0.6684341, 0.9131732, -1.904345, 0, 0, 0, 1, 1,
-0.667972, -2.02903, -3.369815, 0, 0, 0, 1, 1,
-0.6674036, 0.5456805, -1.414155, 0, 0, 0, 1, 1,
-0.6667534, -0.6926835, -1.732122, 0, 0, 0, 1, 1,
-0.6631379, 0.4080689, -2.336535, 0, 0, 0, 1, 1,
-0.6622158, 0.3767229, -2.326573, 1, 1, 1, 1, 1,
-0.6603578, 0.5323782, -0.4085168, 1, 1, 1, 1, 1,
-0.6602181, 0.9436919, -0.5057437, 1, 1, 1, 1, 1,
-0.6577738, -1.548609, -2.77786, 1, 1, 1, 1, 1,
-0.6569896, -0.4321832, -1.667528, 1, 1, 1, 1, 1,
-0.6544827, 0.432413, -2.791634, 1, 1, 1, 1, 1,
-0.654342, -0.3643728, -2.535283, 1, 1, 1, 1, 1,
-0.6505293, 0.1721347, -1.400409, 1, 1, 1, 1, 1,
-0.6472485, 0.294387, -1.681192, 1, 1, 1, 1, 1,
-0.6464691, -1.674952, -1.97067, 1, 1, 1, 1, 1,
-0.6415074, -0.1301202, -2.352773, 1, 1, 1, 1, 1,
-0.6405776, 0.4277112, -1.364627, 1, 1, 1, 1, 1,
-0.639407, -0.6225848, -2.851498, 1, 1, 1, 1, 1,
-0.6371624, -0.06028367, -0.3196887, 1, 1, 1, 1, 1,
-0.6325943, 0.1466723, -2.295612, 1, 1, 1, 1, 1,
-0.630209, -0.9459078, -2.04275, 0, 0, 1, 1, 1,
-0.6257547, 1.054027, -1.556564, 1, 0, 0, 1, 1,
-0.6243746, 0.07195938, -1.249396, 1, 0, 0, 1, 1,
-0.6209994, 1.106414, 0.6403888, 1, 0, 0, 1, 1,
-0.6188431, 1.812604, -0.5301701, 1, 0, 0, 1, 1,
-0.6165819, -0.338306, -3.675478, 1, 0, 0, 1, 1,
-0.6133753, -1.31012, -3.372293, 0, 0, 0, 1, 1,
-0.6105046, 1.737716, 1.498515, 0, 0, 0, 1, 1,
-0.6036994, -1.107568, -2.630148, 0, 0, 0, 1, 1,
-0.5987542, 0.1948648, -1.985338, 0, 0, 0, 1, 1,
-0.5977495, -0.0338724, -1.073635, 0, 0, 0, 1, 1,
-0.5970298, -0.07837834, -2.20406, 0, 0, 0, 1, 1,
-0.5945594, -2.826034, -1.835213, 0, 0, 0, 1, 1,
-0.5899914, -1.238097, -1.599186, 1, 1, 1, 1, 1,
-0.5846516, 1.533078, -2.840509, 1, 1, 1, 1, 1,
-0.5846374, 0.9368781, -0.04465941, 1, 1, 1, 1, 1,
-0.5817158, -1.539612, -3.250333, 1, 1, 1, 1, 1,
-0.5716243, 0.7043092, -2.797924, 1, 1, 1, 1, 1,
-0.5707675, 0.005616349, -2.466247, 1, 1, 1, 1, 1,
-0.569761, 0.2403522, -2.708522, 1, 1, 1, 1, 1,
-0.5676242, -0.556369, -4.462074, 1, 1, 1, 1, 1,
-0.5638301, 0.6067916, 1.476355, 1, 1, 1, 1, 1,
-0.5619077, 0.2622122, -1.176323, 1, 1, 1, 1, 1,
-0.559956, -0.9150402, -4.065649, 1, 1, 1, 1, 1,
-0.55989, -1.9591, -3.137918, 1, 1, 1, 1, 1,
-0.5588688, -0.004965721, -2.257626, 1, 1, 1, 1, 1,
-0.5552742, 0.723781, 1.183435, 1, 1, 1, 1, 1,
-0.5533153, -0.1941348, -2.222927, 1, 1, 1, 1, 1,
-0.5461169, 2.043181, 0.9861791, 0, 0, 1, 1, 1,
-0.5424652, 0.03529412, -0.6122685, 1, 0, 0, 1, 1,
-0.5383162, -0.5903721, -2.7568, 1, 0, 0, 1, 1,
-0.5380732, 0.2167841, -0.06619379, 1, 0, 0, 1, 1,
-0.5365359, -0.2814311, -1.65747, 1, 0, 0, 1, 1,
-0.5358635, -1.285118, -4.220209, 1, 0, 0, 1, 1,
-0.5330174, 1.18339, -0.6216868, 0, 0, 0, 1, 1,
-0.5314406, -0.2084524, -2.212704, 0, 0, 0, 1, 1,
-0.5295861, 2.229268, -2.1869, 0, 0, 0, 1, 1,
-0.5277436, -0.6386661, -1.731242, 0, 0, 0, 1, 1,
-0.525555, -0.07375386, -0.2072148, 0, 0, 0, 1, 1,
-0.5253693, -1.217891, -1.717834, 0, 0, 0, 1, 1,
-0.5229729, -1.182498, -0.8897789, 0, 0, 0, 1, 1,
-0.5202159, 0.7548504, -0.3630476, 1, 1, 1, 1, 1,
-0.5170377, -1.553493, -2.980392, 1, 1, 1, 1, 1,
-0.5156258, -1.686764, -4.876529, 1, 1, 1, 1, 1,
-0.5125158, -1.700814, -3.789955, 1, 1, 1, 1, 1,
-0.5086336, -0.1158403, -0.9826944, 1, 1, 1, 1, 1,
-0.5063186, -0.34835, -1.053479, 1, 1, 1, 1, 1,
-0.5050535, 1.200574, -0.796665, 1, 1, 1, 1, 1,
-0.5048815, -1.924286, -3.087373, 1, 1, 1, 1, 1,
-0.4980981, 0.09575446, -1.352666, 1, 1, 1, 1, 1,
-0.4971243, 1.491882, -0.9873765, 1, 1, 1, 1, 1,
-0.4914712, -0.06822178, -2.587994, 1, 1, 1, 1, 1,
-0.4795728, -0.2094694, -2.626615, 1, 1, 1, 1, 1,
-0.4778514, -0.03812348, -1.927279, 1, 1, 1, 1, 1,
-0.4773535, 0.988608, -0.311214, 1, 1, 1, 1, 1,
-0.4726633, -1.086283, -3.95893, 1, 1, 1, 1, 1,
-0.4675468, -0.6559468, -2.951875, 0, 0, 1, 1, 1,
-0.4658032, -0.5738227, -0.6592204, 1, 0, 0, 1, 1,
-0.4654274, -0.6152581, -4.232508, 1, 0, 0, 1, 1,
-0.4630728, 0.9465909, -1.799327, 1, 0, 0, 1, 1,
-0.4604486, -0.416825, -1.888626, 1, 0, 0, 1, 1,
-0.4474998, 1.610986, -1.793003, 1, 0, 0, 1, 1,
-0.4467314, 0.2446176, -0.5359524, 0, 0, 0, 1, 1,
-0.4446437, 0.7872317, -0.5959895, 0, 0, 0, 1, 1,
-0.4400374, 1.041348, 0.7519913, 0, 0, 0, 1, 1,
-0.4395008, -1.126426, -2.949065, 0, 0, 0, 1, 1,
-0.4370299, 1.045933, 1.125317, 0, 0, 0, 1, 1,
-0.435188, 1.402426, -1.799703, 0, 0, 0, 1, 1,
-0.4344806, -0.1985364, -3.412379, 0, 0, 0, 1, 1,
-0.4307573, -2.591997, -3.077302, 1, 1, 1, 1, 1,
-0.4254567, -0.3859691, -0.115658, 1, 1, 1, 1, 1,
-0.4212487, -0.2937441, -3.150098, 1, 1, 1, 1, 1,
-0.4198258, -0.7043163, -2.850983, 1, 1, 1, 1, 1,
-0.4196497, -1.747959, -3.782467, 1, 1, 1, 1, 1,
-0.415116, -0.5900502, -3.368983, 1, 1, 1, 1, 1,
-0.4086742, 0.1927725, -0.3090457, 1, 1, 1, 1, 1,
-0.4035196, -1.861132, -2.083357, 1, 1, 1, 1, 1,
-0.403001, 0.4681147, 0.4136673, 1, 1, 1, 1, 1,
-0.4024061, 0.03584922, -0.5443901, 1, 1, 1, 1, 1,
-0.4017948, 3.014512, -1.626246, 1, 1, 1, 1, 1,
-0.3981036, -0.7839735, -2.046259, 1, 1, 1, 1, 1,
-0.3954532, -0.4053969, -2.263237, 1, 1, 1, 1, 1,
-0.3953442, -0.9050519, -3.044204, 1, 1, 1, 1, 1,
-0.391988, -0.1349229, -2.926392, 1, 1, 1, 1, 1,
-0.3916005, 0.2344091, 0.0452286, 0, 0, 1, 1, 1,
-0.3816273, -0.1751955, -3.291424, 1, 0, 0, 1, 1,
-0.3806388, 1.635053, -1.039803, 1, 0, 0, 1, 1,
-0.3789288, 1.859916, -0.9746297, 1, 0, 0, 1, 1,
-0.3733253, -0.1903684, -2.947771, 1, 0, 0, 1, 1,
-0.3671077, -2.937622, -2.905721, 1, 0, 0, 1, 1,
-0.3647161, 0.7878246, -0.2346584, 0, 0, 0, 1, 1,
-0.3594525, 0.05347767, -1.034198, 0, 0, 0, 1, 1,
-0.3581885, 0.786413, -2.079602, 0, 0, 0, 1, 1,
-0.35789, 0.4019927, -0.2686961, 0, 0, 0, 1, 1,
-0.3562517, 0.3892776, -0.8240054, 0, 0, 0, 1, 1,
-0.3512028, 0.7057803, 2.857618, 0, 0, 0, 1, 1,
-0.3492434, 1.60666, 0.1473879, 0, 0, 0, 1, 1,
-0.3480182, -0.7031073, -3.123967, 1, 1, 1, 1, 1,
-0.3469067, 0.7311084, -0.8609203, 1, 1, 1, 1, 1,
-0.3441331, 1.660448, -0.4841181, 1, 1, 1, 1, 1,
-0.3401293, -2.198525, -2.994867, 1, 1, 1, 1, 1,
-0.3400697, -0.6416442, -0.5007031, 1, 1, 1, 1, 1,
-0.339708, -1.59118, -1.641802, 1, 1, 1, 1, 1,
-0.3349181, 1.359422, -0.02408297, 1, 1, 1, 1, 1,
-0.3331226, 0.4570819, -0.5771766, 1, 1, 1, 1, 1,
-0.3306556, -1.802553, -2.951088, 1, 1, 1, 1, 1,
-0.3299729, -2.378512, -2.788223, 1, 1, 1, 1, 1,
-0.3253613, -1.135354, -2.297035, 1, 1, 1, 1, 1,
-0.3238781, 0.7288288, 1.371079, 1, 1, 1, 1, 1,
-0.3214021, -0.03971422, -0.465924, 1, 1, 1, 1, 1,
-0.3205298, -0.670096, -3.10141, 1, 1, 1, 1, 1,
-0.3186953, -1.089613, -3.094227, 1, 1, 1, 1, 1,
-0.3134283, 0.2877109, -2.416897, 0, 0, 1, 1, 1,
-0.310751, -0.431439, -3.022082, 1, 0, 0, 1, 1,
-0.3101847, -0.184797, -1.332128, 1, 0, 0, 1, 1,
-0.3100688, -0.1564443, -1.960477, 1, 0, 0, 1, 1,
-0.3015122, 0.3699513, -0.9534324, 1, 0, 0, 1, 1,
-0.2985536, 0.4081056, -1.493907, 1, 0, 0, 1, 1,
-0.2981319, -0.4998464, -2.789433, 0, 0, 0, 1, 1,
-0.2975626, 2.259868, -2.582561, 0, 0, 0, 1, 1,
-0.2957728, -1.255945, -2.532089, 0, 0, 0, 1, 1,
-0.2938992, -0.2894154, -2.435705, 0, 0, 0, 1, 1,
-0.288585, 1.105445, -1.830307, 0, 0, 0, 1, 1,
-0.2864706, -1.708874, -3.205855, 0, 0, 0, 1, 1,
-0.2823044, -1.333846, -0.5042152, 0, 0, 0, 1, 1,
-0.282227, 1.121607, -0.9404169, 1, 1, 1, 1, 1,
-0.2819051, -0.1846213, -1.470961, 1, 1, 1, 1, 1,
-0.2793638, -1.075951, -3.614192, 1, 1, 1, 1, 1,
-0.2792716, 1.083203, -3.534024, 1, 1, 1, 1, 1,
-0.274337, 1.115069, 0.2082974, 1, 1, 1, 1, 1,
-0.2690658, 1.505703, 0.2660598, 1, 1, 1, 1, 1,
-0.267652, -0.5975537, -1.4624, 1, 1, 1, 1, 1,
-0.2664635, -0.9553542, -4.643411, 1, 1, 1, 1, 1,
-0.2644005, 0.0140311, -1.207826, 1, 1, 1, 1, 1,
-0.2643031, 0.6360436, -1.898407, 1, 1, 1, 1, 1,
-0.2641517, -1.095805, -3.26789, 1, 1, 1, 1, 1,
-0.2617996, -1.010831, -2.781515, 1, 1, 1, 1, 1,
-0.2617034, 0.2900107, -0.6270853, 1, 1, 1, 1, 1,
-0.2595397, -0.2715251, -3.859408, 1, 1, 1, 1, 1,
-0.2594104, -1.120835, -1.471423, 1, 1, 1, 1, 1,
-0.2574922, -0.5826377, -3.701833, 0, 0, 1, 1, 1,
-0.2549237, -0.3532905, -3.90444, 1, 0, 0, 1, 1,
-0.2510026, 0.6071547, -1.502728, 1, 0, 0, 1, 1,
-0.2508429, -0.4556088, -3.297829, 1, 0, 0, 1, 1,
-0.2498825, 0.2903225, 0.5828388, 1, 0, 0, 1, 1,
-0.2497154, 0.5725017, 0.5778011, 1, 0, 0, 1, 1,
-0.243549, 0.9720035, 2.035386, 0, 0, 0, 1, 1,
-0.2396744, -1.333577, -3.547754, 0, 0, 0, 1, 1,
-0.2373391, -0.9547033, -2.355994, 0, 0, 0, 1, 1,
-0.2366109, 0.4399164, 0.5524076, 0, 0, 0, 1, 1,
-0.2365612, 0.01430433, -0.6639124, 0, 0, 0, 1, 1,
-0.2365189, -0.13957, -2.032603, 0, 0, 0, 1, 1,
-0.2356747, -0.9926518, -3.579186, 0, 0, 0, 1, 1,
-0.2317525, -0.4860502, -1.917188, 1, 1, 1, 1, 1,
-0.2294881, -0.7499492, 0.1956856, 1, 1, 1, 1, 1,
-0.2285741, 0.6043117, 0.6961981, 1, 1, 1, 1, 1,
-0.2276501, 0.7971638, -0.6886432, 1, 1, 1, 1, 1,
-0.226068, 0.4983635, 0.2356835, 1, 1, 1, 1, 1,
-0.2211653, -0.2269794, -0.7713801, 1, 1, 1, 1, 1,
-0.2186855, -2.385693, -0.9305106, 1, 1, 1, 1, 1,
-0.2182408, -0.008533654, -0.9309506, 1, 1, 1, 1, 1,
-0.2132761, 0.6990377, -1.571743, 1, 1, 1, 1, 1,
-0.21305, -0.8997592, -3.911446, 1, 1, 1, 1, 1,
-0.2061672, 0.294472, -0.6226572, 1, 1, 1, 1, 1,
-0.2023972, -0.6617947, -2.939894, 1, 1, 1, 1, 1,
-0.1987391, 0.8843964, 0.2317157, 1, 1, 1, 1, 1,
-0.1969471, -2.109895, -4.499762, 1, 1, 1, 1, 1,
-0.1964525, 0.3614686, -0.2618676, 1, 1, 1, 1, 1,
-0.1961398, -1.647496, -1.455893, 0, 0, 1, 1, 1,
-0.1945148, -1.426591, -3.133307, 1, 0, 0, 1, 1,
-0.1925762, -0.3838004, -3.68252, 1, 0, 0, 1, 1,
-0.1904755, -0.700047, -2.865387, 1, 0, 0, 1, 1,
-0.1834697, 0.8436508, 0.6522132, 1, 0, 0, 1, 1,
-0.1806813, 0.8063383, 0.6095691, 1, 0, 0, 1, 1,
-0.1805523, 1.786657, 1.028218, 0, 0, 0, 1, 1,
-0.1797436, -0.6371247, -0.9626777, 0, 0, 0, 1, 1,
-0.1760106, -0.6233783, -2.556851, 0, 0, 0, 1, 1,
-0.1749489, 1.994032, 0.9039554, 0, 0, 0, 1, 1,
-0.1748936, -1.569719, -3.12127, 0, 0, 0, 1, 1,
-0.1686859, 0.01417274, -1.079223, 0, 0, 0, 1, 1,
-0.1676987, -0.7788513, -1.650778, 0, 0, 0, 1, 1,
-0.1660621, 2.8808, -1.61782, 1, 1, 1, 1, 1,
-0.1640425, 0.2964973, -0.8920679, 1, 1, 1, 1, 1,
-0.1622881, 0.5818056, 2.820565, 1, 1, 1, 1, 1,
-0.1581055, 0.4143847, -1.351616, 1, 1, 1, 1, 1,
-0.1577016, 1.710123, 1.098196, 1, 1, 1, 1, 1,
-0.1558318, -0.08231588, -2.363358, 1, 1, 1, 1, 1,
-0.1554428, -1.901513, -2.50193, 1, 1, 1, 1, 1,
-0.1537038, 0.8207867, 0.9882166, 1, 1, 1, 1, 1,
-0.1510027, 0.5006537, -0.8800728, 1, 1, 1, 1, 1,
-0.145034, 0.6468406, 0.06145337, 1, 1, 1, 1, 1,
-0.145025, -0.2204811, -1.472695, 1, 1, 1, 1, 1,
-0.1432153, -0.9429944, -3.980329, 1, 1, 1, 1, 1,
-0.1411255, -0.4547378, -2.530932, 1, 1, 1, 1, 1,
-0.1394805, 0.2641892, -0.7289696, 1, 1, 1, 1, 1,
-0.139456, -1.308189, -4.421619, 1, 1, 1, 1, 1,
-0.126908, -0.3922411, -4.055758, 0, 0, 1, 1, 1,
-0.1267865, -0.2682216, -3.804042, 1, 0, 0, 1, 1,
-0.1252073, -2.534312, -3.242228, 1, 0, 0, 1, 1,
-0.1191666, -0.3563261, -1.785934, 1, 0, 0, 1, 1,
-0.1190792, -0.3129574, -3.502246, 1, 0, 0, 1, 1,
-0.1176798, 0.2938841, -1.01076, 1, 0, 0, 1, 1,
-0.1166769, -1.064628, -1.776873, 0, 0, 0, 1, 1,
-0.1128211, 0.6303192, -2.15311, 0, 0, 0, 1, 1,
-0.1122063, 0.514138, -0.1060643, 0, 0, 0, 1, 1,
-0.1102537, 0.7981313, 0.6574824, 0, 0, 0, 1, 1,
-0.1085952, 2.187432, 0.6887806, 0, 0, 0, 1, 1,
-0.105798, 0.9804597, -0.01014978, 0, 0, 0, 1, 1,
-0.1050751, -0.4096659, -1.257975, 0, 0, 0, 1, 1,
-0.1032204, -2.6991, -2.954091, 1, 1, 1, 1, 1,
-0.1017838, 1.207984, 0.3483703, 1, 1, 1, 1, 1,
-0.09828317, -0.643287, -3.519028, 1, 1, 1, 1, 1,
-0.09312161, 0.5298101, 0.2860846, 1, 1, 1, 1, 1,
-0.09147915, -0.573584, -3.452006, 1, 1, 1, 1, 1,
-0.09056579, -1.849978, -2.999742, 1, 1, 1, 1, 1,
-0.08967982, -0.4631313, -1.858156, 1, 1, 1, 1, 1,
-0.08672196, -1.324068, -3.61212, 1, 1, 1, 1, 1,
-0.08601115, -0.5927607, -1.659937, 1, 1, 1, 1, 1,
-0.08403644, 1.359583, -1.436715, 1, 1, 1, 1, 1,
-0.08216897, 0.6402251, -1.282268, 1, 1, 1, 1, 1,
-0.07724322, -0.8387415, -3.917862, 1, 1, 1, 1, 1,
-0.07281809, 0.4850043, 0.5635797, 1, 1, 1, 1, 1,
-0.06932671, 0.1059639, -0.01388837, 1, 1, 1, 1, 1,
-0.06894296, 0.7212876, -2.045681, 1, 1, 1, 1, 1,
-0.06600281, 0.1182449, 0.6230009, 0, 0, 1, 1, 1,
-0.06599158, 2.236995, 1.0578, 1, 0, 0, 1, 1,
-0.06530302, 0.2045274, -0.8102921, 1, 0, 0, 1, 1,
-0.06342233, 0.4095067, 0.6760527, 1, 0, 0, 1, 1,
-0.06311394, -0.8115038, -2.239563, 1, 0, 0, 1, 1,
-0.05839591, -0.156863, -2.193555, 1, 0, 0, 1, 1,
-0.0570435, -1.219006, -3.960671, 0, 0, 0, 1, 1,
-0.05368388, -1.661391, -4.208723, 0, 0, 0, 1, 1,
-0.05173162, -0.3654768, -2.989869, 0, 0, 0, 1, 1,
-0.05159033, -1.464599, -2.094538, 0, 0, 0, 1, 1,
-0.04980586, 0.08253124, 0.1052847, 0, 0, 0, 1, 1,
-0.04928536, 2.190656, 1.374576, 0, 0, 0, 1, 1,
-0.04465292, -0.6921591, -2.226689, 0, 0, 0, 1, 1,
-0.04373886, -0.5076554, -2.380257, 1, 1, 1, 1, 1,
-0.04020891, 1.268906, -0.13456, 1, 1, 1, 1, 1,
-0.03353389, 0.4955128, -0.4341016, 1, 1, 1, 1, 1,
-0.0286385, -1.403998, -4.037376, 1, 1, 1, 1, 1,
-0.02811272, 1.270573, 0.3334163, 1, 1, 1, 1, 1,
-0.01882504, 0.1114011, 0.3449757, 1, 1, 1, 1, 1,
-0.01685721, -0.09952732, -4.420895, 1, 1, 1, 1, 1,
-0.01622774, -0.4130132, -3.684403, 1, 1, 1, 1, 1,
-0.01383988, -0.530838, -3.044946, 1, 1, 1, 1, 1,
-0.01227131, 0.922481, -1.805926, 1, 1, 1, 1, 1,
-0.01059699, -0.3583967, -1.371945, 1, 1, 1, 1, 1,
-0.006371537, -0.8827068, -2.502881, 1, 1, 1, 1, 1,
-0.003298362, 1.000972, -1.243521, 1, 1, 1, 1, 1,
-0.00246746, -0.7603009, -3.86184, 1, 1, 1, 1, 1,
-0.0006399759, 1.222268, 0.5837423, 1, 1, 1, 1, 1,
0.0005197033, 0.1117642, -0.8596679, 0, 0, 1, 1, 1,
0.006266788, -1.208877, 1.616228, 1, 0, 0, 1, 1,
0.008315154, -0.1480651, 1.806825, 1, 0, 0, 1, 1,
0.009284587, 1.976861, -0.6163671, 1, 0, 0, 1, 1,
0.009610959, 1.026067, 0.630859, 1, 0, 0, 1, 1,
0.01058396, 0.7230564, 0.432333, 1, 0, 0, 1, 1,
0.02065936, -1.958212, 2.136987, 0, 0, 0, 1, 1,
0.02175027, 1.274422, 0.8124079, 0, 0, 0, 1, 1,
0.02340856, 0.5146965, -1.811395, 0, 0, 0, 1, 1,
0.02378682, -0.5778141, 2.403056, 0, 0, 0, 1, 1,
0.03294897, -0.3205083, 5.057201, 0, 0, 0, 1, 1,
0.03312481, -0.2093771, 3.124165, 0, 0, 0, 1, 1,
0.03499033, -1.667235, 4.044569, 0, 0, 0, 1, 1,
0.0413134, 1.542814, -1.392931, 1, 1, 1, 1, 1,
0.04327125, -0.7604968, 3.16312, 1, 1, 1, 1, 1,
0.04415447, 1.058004, -0.6004333, 1, 1, 1, 1, 1,
0.0443915, 0.5158298, 0.70701, 1, 1, 1, 1, 1,
0.04451979, -0.06617431, 0.8003753, 1, 1, 1, 1, 1,
0.04629106, 1.470544, 1.587577, 1, 1, 1, 1, 1,
0.04870663, 0.5425535, -2.565212, 1, 1, 1, 1, 1,
0.0497636, 1.579148, -2.066192, 1, 1, 1, 1, 1,
0.05160603, 0.9223849, 0.4270205, 1, 1, 1, 1, 1,
0.05590972, -0.7999498, 1.379523, 1, 1, 1, 1, 1,
0.06333546, -1.214518, 3.767135, 1, 1, 1, 1, 1,
0.07191867, 2.699928, -1.590743, 1, 1, 1, 1, 1,
0.07470347, -1.152487, 1.124415, 1, 1, 1, 1, 1,
0.07491232, 0.004807594, 3.107699, 1, 1, 1, 1, 1,
0.0756933, -0.3015519, 2.577607, 1, 1, 1, 1, 1,
0.08010801, 1.150048, 0.3771217, 0, 0, 1, 1, 1,
0.08602116, 2.461205, -0.8238055, 1, 0, 0, 1, 1,
0.08802743, 0.486324, 0.9656869, 1, 0, 0, 1, 1,
0.09490883, -1.206767, 2.498071, 1, 0, 0, 1, 1,
0.09834998, 0.2735698, 1.245231, 1, 0, 0, 1, 1,
0.1010602, -0.2351659, 2.262285, 1, 0, 0, 1, 1,
0.1056068, -0.3100453, 2.386982, 0, 0, 0, 1, 1,
0.1105674, 0.1473387, 1.310319, 0, 0, 0, 1, 1,
0.1141598, 0.6784183, 0.5595737, 0, 0, 0, 1, 1,
0.1251553, -1.605812, 3.335377, 0, 0, 0, 1, 1,
0.1265134, -0.4633524, 3.310838, 0, 0, 0, 1, 1,
0.1265344, -0.7903036, 3.81508, 0, 0, 0, 1, 1,
0.1289607, 0.4534127, -0.1118891, 0, 0, 0, 1, 1,
0.1319269, -1.790476, 5.870619, 1, 1, 1, 1, 1,
0.1335063, 0.1422595, 3.061929, 1, 1, 1, 1, 1,
0.1337028, 0.8999181, 2.236048, 1, 1, 1, 1, 1,
0.140216, -0.1090077, 1.586863, 1, 1, 1, 1, 1,
0.1428587, 0.9905087, 0.4288367, 1, 1, 1, 1, 1,
0.1456298, 1.640902, 0.2041253, 1, 1, 1, 1, 1,
0.146779, -1.618543, 2.021045, 1, 1, 1, 1, 1,
0.1475787, -0.3815436, 2.830406, 1, 1, 1, 1, 1,
0.1492322, -0.9778354, 3.544575, 1, 1, 1, 1, 1,
0.1493138, -0.2037271, 1.958277, 1, 1, 1, 1, 1,
0.1495692, 0.2550281, 1.625292, 1, 1, 1, 1, 1,
0.1509163, -1.203887, 2.988604, 1, 1, 1, 1, 1,
0.1521066, -1.296382, 1.54292, 1, 1, 1, 1, 1,
0.1542385, 1.986259, -2.022713, 1, 1, 1, 1, 1,
0.1542784, 2.693549, 1.253172, 1, 1, 1, 1, 1,
0.1559954, 0.59945, -0.116537, 0, 0, 1, 1, 1,
0.1572444, -0.1160661, 1.291309, 1, 0, 0, 1, 1,
0.1595445, -1.442684, 2.222399, 1, 0, 0, 1, 1,
0.1638685, 1.023527, 0.786768, 1, 0, 0, 1, 1,
0.1659409, 0.2689188, 0.7894413, 1, 0, 0, 1, 1,
0.1664339, 0.06388646, 0.9682307, 1, 0, 0, 1, 1,
0.1665221, 0.3299169, 0.6625177, 0, 0, 0, 1, 1,
0.1686631, -1.58005, 4.464176, 0, 0, 0, 1, 1,
0.1731202, 1.417228, 1.188085, 0, 0, 0, 1, 1,
0.1772068, -0.5843444, 2.306542, 0, 0, 0, 1, 1,
0.1777949, -0.8804759, 1.936782, 0, 0, 0, 1, 1,
0.185401, -0.5801906, 4.767612, 0, 0, 0, 1, 1,
0.1869827, 0.1906131, 1.039458, 0, 0, 0, 1, 1,
0.1901918, 1.168395, 0.5998695, 1, 1, 1, 1, 1,
0.1994202, -0.7965861, 2.926312, 1, 1, 1, 1, 1,
0.2003884, 0.536499, -0.3545052, 1, 1, 1, 1, 1,
0.201821, -1.299814, 3.037121, 1, 1, 1, 1, 1,
0.20274, -0.4658509, 2.041843, 1, 1, 1, 1, 1,
0.2027768, 0.8660168, 1.54534, 1, 1, 1, 1, 1,
0.2028178, 0.4775905, 2.593817, 1, 1, 1, 1, 1,
0.2029172, 0.5053445, -0.1739302, 1, 1, 1, 1, 1,
0.2040959, -0.4798515, 3.505368, 1, 1, 1, 1, 1,
0.2068195, -0.4088442, 0.6854274, 1, 1, 1, 1, 1,
0.2078062, 1.493821, -0.0365284, 1, 1, 1, 1, 1,
0.2149157, 0.08699002, 0.6158991, 1, 1, 1, 1, 1,
0.2163967, 0.6375138, 0.1682497, 1, 1, 1, 1, 1,
0.2185673, -0.4168732, 3.705127, 1, 1, 1, 1, 1,
0.2186575, 0.01069134, 1.646745, 1, 1, 1, 1, 1,
0.2231291, 0.3938853, 0.01576984, 0, 0, 1, 1, 1,
0.2247405, -0.1519363, 1.877715, 1, 0, 0, 1, 1,
0.2249717, 0.6398535, 2.002467, 1, 0, 0, 1, 1,
0.2304024, 0.230624, 1.899101, 1, 0, 0, 1, 1,
0.2320344, -0.7513312, 3.726404, 1, 0, 0, 1, 1,
0.2329081, 0.9261524, -0.6160002, 1, 0, 0, 1, 1,
0.2350974, -1.046138, 2.561336, 0, 0, 0, 1, 1,
0.2367778, -0.6534528, 5.397868, 0, 0, 0, 1, 1,
0.2389323, -0.1452441, 2.2413, 0, 0, 0, 1, 1,
0.2406, 1.566191, -1.809532, 0, 0, 0, 1, 1,
0.2427801, 0.621012, -0.611504, 0, 0, 0, 1, 1,
0.2440323, 1.777909, -0.002014127, 0, 0, 0, 1, 1,
0.2441421, 0.6616278, 0.5817946, 0, 0, 0, 1, 1,
0.2487723, 2.161002, -0.2683851, 1, 1, 1, 1, 1,
0.254011, 1.500927, 1.388218, 1, 1, 1, 1, 1,
0.2569604, -1.88284, 2.980389, 1, 1, 1, 1, 1,
0.2594611, 0.7114239, 1.254254, 1, 1, 1, 1, 1,
0.2609265, 0.02182768, 0.4550934, 1, 1, 1, 1, 1,
0.265913, 0.7647979, 0.9186493, 1, 1, 1, 1, 1,
0.268479, 1.452525, 0.6152529, 1, 1, 1, 1, 1,
0.2695366, 0.310389, 1.442436, 1, 1, 1, 1, 1,
0.2719203, -0.9940248, 2.927838, 1, 1, 1, 1, 1,
0.2792675, 0.9386848, -0.1245219, 1, 1, 1, 1, 1,
0.2842027, -0.3499917, 1.964885, 1, 1, 1, 1, 1,
0.2846677, -0.8145873, 1.766642, 1, 1, 1, 1, 1,
0.2850427, -1.46796, 4.946995, 1, 1, 1, 1, 1,
0.2862518, 1.307203, -0.1809862, 1, 1, 1, 1, 1,
0.2958107, -0.07418321, 0.5961326, 1, 1, 1, 1, 1,
0.2987764, 0.7930167, 0.03517547, 0, 0, 1, 1, 1,
0.3008681, 1.689932, -0.4668423, 1, 0, 0, 1, 1,
0.3085085, 0.2512324, 2.54055, 1, 0, 0, 1, 1,
0.3113258, -1.277276, 2.456534, 1, 0, 0, 1, 1,
0.3118539, -1.595722, 1.883408, 1, 0, 0, 1, 1,
0.313383, -1.489552, 3.508471, 1, 0, 0, 1, 1,
0.3158541, 2.23395, 0.02246968, 0, 0, 0, 1, 1,
0.3195624, -1.353529, 1.441207, 0, 0, 0, 1, 1,
0.3202446, -0.8164232, 2.470458, 0, 0, 0, 1, 1,
0.323606, 0.2965734, 1.810829, 0, 0, 0, 1, 1,
0.3237749, 0.7517438, -0.0886057, 0, 0, 0, 1, 1,
0.326874, -0.002063279, 2.077397, 0, 0, 0, 1, 1,
0.3353848, 0.5138781, -0.4430811, 0, 0, 0, 1, 1,
0.335593, 0.8828464, -0.8433117, 1, 1, 1, 1, 1,
0.3359702, -0.9639322, 2.565707, 1, 1, 1, 1, 1,
0.3369255, -0.5733972, 5.406105, 1, 1, 1, 1, 1,
0.3417871, 0.6125729, 0.05968243, 1, 1, 1, 1, 1,
0.3427373, 0.2215413, -0.2776352, 1, 1, 1, 1, 1,
0.3472562, -0.3854539, 2.979622, 1, 1, 1, 1, 1,
0.3474985, 2.299675, -0.1474149, 1, 1, 1, 1, 1,
0.349856, -0.4751289, 2.963774, 1, 1, 1, 1, 1,
0.3498804, 0.39088, 0.8925657, 1, 1, 1, 1, 1,
0.3503675, 2.591165, -1.373401, 1, 1, 1, 1, 1,
0.3507232, -1.081255, 3.284204, 1, 1, 1, 1, 1,
0.3507845, -0.2874017, 0.1393534, 1, 1, 1, 1, 1,
0.3560562, -1.024702, 4.542645, 1, 1, 1, 1, 1,
0.3586202, -0.1006911, 0.6761221, 1, 1, 1, 1, 1,
0.3591429, 1.018541, 1.43634, 1, 1, 1, 1, 1,
0.3598084, 1.1872, -0.3639455, 0, 0, 1, 1, 1,
0.3628506, 0.4652691, -0.7996771, 1, 0, 0, 1, 1,
0.3656941, -0.3660528, 1.713321, 1, 0, 0, 1, 1,
0.3669713, 1.962171, 0.6904685, 1, 0, 0, 1, 1,
0.369736, -0.5504096, 2.23803, 1, 0, 0, 1, 1,
0.3709488, 0.3054948, 0.1994211, 1, 0, 0, 1, 1,
0.3730052, 0.7536448, 0.4691387, 0, 0, 0, 1, 1,
0.3760471, -0.04046349, 0.8500074, 0, 0, 0, 1, 1,
0.3775148, 0.5530988, -0.230635, 0, 0, 0, 1, 1,
0.3807987, -0.03003492, 1.379016, 0, 0, 0, 1, 1,
0.3820943, 1.408712, -0.8940306, 0, 0, 0, 1, 1,
0.3883543, 2.003918, -1.42809, 0, 0, 0, 1, 1,
0.3904946, -0.3196206, 0.5655934, 0, 0, 0, 1, 1,
0.3918978, -1.120685, 2.418005, 1, 1, 1, 1, 1,
0.3932982, -0.6624035, 2.044305, 1, 1, 1, 1, 1,
0.4012581, 1.301766, 1.382521, 1, 1, 1, 1, 1,
0.4032842, 1.585593, 1.248674, 1, 1, 1, 1, 1,
0.40518, 1.394611, 0.1436519, 1, 1, 1, 1, 1,
0.406514, -0.2116287, 2.390629, 1, 1, 1, 1, 1,
0.4098045, 1.373701, 1.493739, 1, 1, 1, 1, 1,
0.4114805, 0.7549118, 0.558929, 1, 1, 1, 1, 1,
0.4217626, -0.0233793, 0.976392, 1, 1, 1, 1, 1,
0.4265972, 1.056216, 0.5423834, 1, 1, 1, 1, 1,
0.4293035, -1.052779, 3.250316, 1, 1, 1, 1, 1,
0.430304, -0.1739793, 1.86519, 1, 1, 1, 1, 1,
0.4309949, 1.619084, -2.191404, 1, 1, 1, 1, 1,
0.43146, 1.076935, -0.4296619, 1, 1, 1, 1, 1,
0.4321966, -1.455833, 2.038271, 1, 1, 1, 1, 1,
0.4350858, -0.6190023, 2.700732, 0, 0, 1, 1, 1,
0.4352702, 0.919198, 0.6351718, 1, 0, 0, 1, 1,
0.4459325, 0.9927504, 0.08335006, 1, 0, 0, 1, 1,
0.4524196, -0.6199825, 0.2644269, 1, 0, 0, 1, 1,
0.4588047, 1.046662, -1.52855, 1, 0, 0, 1, 1,
0.4636489, 0.158131, -0.09255861, 1, 0, 0, 1, 1,
0.4641123, -0.3119776, 2.887851, 0, 0, 0, 1, 1,
0.4646794, -0.2281559, 1.464844, 0, 0, 0, 1, 1,
0.4648139, 1.272037, -0.3927032, 0, 0, 0, 1, 1,
0.4657271, -0.2339599, 2.458783, 0, 0, 0, 1, 1,
0.4671504, -0.8552068, 2.21164, 0, 0, 0, 1, 1,
0.4705783, 1.387316, 0.1774391, 0, 0, 0, 1, 1,
0.4752765, -0.546657, 2.400734, 0, 0, 0, 1, 1,
0.481307, -0.1145282, -0.3467244, 1, 1, 1, 1, 1,
0.488792, 0.2617476, 3.571533, 1, 1, 1, 1, 1,
0.4915265, -0.1996697, 0.7176448, 1, 1, 1, 1, 1,
0.4917788, -0.5575918, 3.339206, 1, 1, 1, 1, 1,
0.4925868, 0.243468, 0.8240706, 1, 1, 1, 1, 1,
0.501413, 0.4524451, -0.7829896, 1, 1, 1, 1, 1,
0.5016032, -0.822403, 2.836975, 1, 1, 1, 1, 1,
0.5043575, -0.9822453, 3.437869, 1, 1, 1, 1, 1,
0.5143389, -1.366311, 3.36603, 1, 1, 1, 1, 1,
0.5145267, -1.777078, 3.182717, 1, 1, 1, 1, 1,
0.5148746, -0.409613, 2.739649, 1, 1, 1, 1, 1,
0.5195905, -0.6498819, 2.391117, 1, 1, 1, 1, 1,
0.5206065, 2.020416, 1.141589, 1, 1, 1, 1, 1,
0.5234863, 0.5453031, 2.024498, 1, 1, 1, 1, 1,
0.5317187, 0.7080092, -0.3032148, 1, 1, 1, 1, 1,
0.5499375, -0.5767648, 3.224669, 0, 0, 1, 1, 1,
0.5552977, -1.776382, 3.836905, 1, 0, 0, 1, 1,
0.5579842, 0.2353425, 0.4405847, 1, 0, 0, 1, 1,
0.5593337, 0.06831393, 0.9632371, 1, 0, 0, 1, 1,
0.5603699, -1.234895, 3.274701, 1, 0, 0, 1, 1,
0.5605385, -1.302783, 2.711192, 1, 0, 0, 1, 1,
0.5662929, 0.473138, 0.9563583, 0, 0, 0, 1, 1,
0.5684093, -0.7323255, 1.407069, 0, 0, 0, 1, 1,
0.569042, 2.073292, -0.585832, 0, 0, 0, 1, 1,
0.5691817, -1.484227, 2.187504, 0, 0, 0, 1, 1,
0.5694522, 0.8512259, 1.894872, 0, 0, 0, 1, 1,
0.5704547, -0.2164787, 2.978733, 0, 0, 0, 1, 1,
0.5705588, 0.3562492, 2.315831, 0, 0, 0, 1, 1,
0.5757738, -0.8337085, 2.327909, 1, 1, 1, 1, 1,
0.5768887, 1.349539, 0.3413767, 1, 1, 1, 1, 1,
0.5791565, -1.644601, 3.839688, 1, 1, 1, 1, 1,
0.5822045, -1.233456, 3.97072, 1, 1, 1, 1, 1,
0.5859773, 0.3856452, 0.9467028, 1, 1, 1, 1, 1,
0.5877002, 1.295775, -0.05485531, 1, 1, 1, 1, 1,
0.5889248, -1.567003, 0.9535411, 1, 1, 1, 1, 1,
0.5898523, -0.4775794, 2.695167, 1, 1, 1, 1, 1,
0.592264, -0.1736905, 2.462769, 1, 1, 1, 1, 1,
0.5924987, 1.150479, 1.119253, 1, 1, 1, 1, 1,
0.5954847, -0.6552582, 0.06539507, 1, 1, 1, 1, 1,
0.5987101, -0.4685268, 4.037377, 1, 1, 1, 1, 1,
0.6026503, 0.3260314, 1.514585, 1, 1, 1, 1, 1,
0.6039847, -1.78464, 1.141303, 1, 1, 1, 1, 1,
0.6072322, -0.5173897, 1.492065, 1, 1, 1, 1, 1,
0.624783, 0.8161446, 1.282291, 0, 0, 1, 1, 1,
0.6258176, 0.8360392, 1.815227, 1, 0, 0, 1, 1,
0.6264051, 1.055246, -2.116608, 1, 0, 0, 1, 1,
0.6273059, -0.01211283, 0.8259085, 1, 0, 0, 1, 1,
0.632772, -0.4081611, 3.921299, 1, 0, 0, 1, 1,
0.6406194, 0.5145343, -0.2726912, 1, 0, 0, 1, 1,
0.6539283, 0.7652913, 0.329308, 0, 0, 0, 1, 1,
0.6542663, 0.193813, -0.4224939, 0, 0, 0, 1, 1,
0.6555722, 1.578059, 1.449852, 0, 0, 0, 1, 1,
0.6569536, 0.2861656, 0.5381423, 0, 0, 0, 1, 1,
0.6573543, 0.5502634, 0.8452732, 0, 0, 0, 1, 1,
0.6590405, -0.1873725, 1.247927, 0, 0, 0, 1, 1,
0.6608385, -0.8143326, 2.769763, 0, 0, 0, 1, 1,
0.6651346, 1.33052, -0.6297357, 1, 1, 1, 1, 1,
0.6659549, 0.2347838, 1.534094, 1, 1, 1, 1, 1,
0.6750358, -1.642544, 3.666909, 1, 1, 1, 1, 1,
0.6755102, 0.5921563, -0.01575839, 1, 1, 1, 1, 1,
0.679267, -0.923485, 2.444183, 1, 1, 1, 1, 1,
0.6808704, -0.03853303, 2.167613, 1, 1, 1, 1, 1,
0.6897647, 0.2903216, -0.5681248, 1, 1, 1, 1, 1,
0.6910937, 1.444512, 0.4900588, 1, 1, 1, 1, 1,
0.693172, 0.3234446, 1.052035, 1, 1, 1, 1, 1,
0.699712, -1.82408, 4.008914, 1, 1, 1, 1, 1,
0.7059485, 1.054369, -0.4059073, 1, 1, 1, 1, 1,
0.7094247, -1.36404, 2.131114, 1, 1, 1, 1, 1,
0.7128364, 1.359159, 2.855324, 1, 1, 1, 1, 1,
0.7181569, 1.310406, 0.8810661, 1, 1, 1, 1, 1,
0.7194219, -0.7985336, 1.912118, 1, 1, 1, 1, 1,
0.7225905, -0.1122602, 2.203026, 0, 0, 1, 1, 1,
0.7279806, 0.9277658, -0.1480291, 1, 0, 0, 1, 1,
0.7327147, 1.175843, 0.1977958, 1, 0, 0, 1, 1,
0.7383949, -0.2705728, 2.283522, 1, 0, 0, 1, 1,
0.7395571, -0.8227882, 2.705375, 1, 0, 0, 1, 1,
0.759062, -0.19001, 2.448024, 1, 0, 0, 1, 1,
0.7672773, 0.07813658, 1.07041, 0, 0, 0, 1, 1,
0.7682477, -0.4495646, 1.908255, 0, 0, 0, 1, 1,
0.770171, 0.5137924, 1.014118, 0, 0, 0, 1, 1,
0.7704446, 1.002778, -0.869785, 0, 0, 0, 1, 1,
0.771537, -0.265897, 1.660597, 0, 0, 0, 1, 1,
0.7726347, -0.0821471, 1.931534, 0, 0, 0, 1, 1,
0.7736057, -0.827894, 2.706351, 0, 0, 0, 1, 1,
0.7793407, 0.2645546, 0.2763906, 1, 1, 1, 1, 1,
0.7846975, 4.058201, 0.1241179, 1, 1, 1, 1, 1,
0.7856349, 0.02296973, 0.05404252, 1, 1, 1, 1, 1,
0.7868966, -1.041535, 2.64209, 1, 1, 1, 1, 1,
0.787101, 0.06857873, 0.9784498, 1, 1, 1, 1, 1,
0.7951619, -0.3354308, 1.243762, 1, 1, 1, 1, 1,
0.8136223, 1.201161, 0.409898, 1, 1, 1, 1, 1,
0.8144574, 1.800669, -0.04636921, 1, 1, 1, 1, 1,
0.8170462, 0.1282553, 1.700603, 1, 1, 1, 1, 1,
0.8180645, 0.8021195, 2.865056, 1, 1, 1, 1, 1,
0.8209693, -0.2721095, 1.836984, 1, 1, 1, 1, 1,
0.8285269, -0.2708233, 1.54968, 1, 1, 1, 1, 1,
0.8304605, -1.453882, 2.432693, 1, 1, 1, 1, 1,
0.8361519, 1.189528, -1.276584, 1, 1, 1, 1, 1,
0.836381, -0.6496146, 2.929778, 1, 1, 1, 1, 1,
0.8368669, -1.114177, 3.407503, 0, 0, 1, 1, 1,
0.8405434, 0.03371398, -0.1284465, 1, 0, 0, 1, 1,
0.8443892, 0.1908543, 0.6826434, 1, 0, 0, 1, 1,
0.8483071, -0.6020762, 3.436939, 1, 0, 0, 1, 1,
0.8497314, 0.5592958, 0.4748484, 1, 0, 0, 1, 1,
0.8519275, 0.3832312, 2.207087, 1, 0, 0, 1, 1,
0.8526682, -0.1933629, 1.892646, 0, 0, 0, 1, 1,
0.8526825, 1.11499, 2.013627, 0, 0, 0, 1, 1,
0.8565606, 0.1736245, 0.03181975, 0, 0, 0, 1, 1,
0.8585663, 0.7521505, 1.746363, 0, 0, 0, 1, 1,
0.8625225, -1.364672, 2.140571, 0, 0, 0, 1, 1,
0.8641418, -0.05885721, -1.747461, 0, 0, 0, 1, 1,
0.8717242, 1.471224, 0.2555774, 0, 0, 0, 1, 1,
0.8725843, -0.2686586, 0.5388417, 1, 1, 1, 1, 1,
0.8772721, 0.7911845, 0.8185309, 1, 1, 1, 1, 1,
0.8774427, -2.254563, 2.86537, 1, 1, 1, 1, 1,
0.8779779, 2.852226, -0.4701407, 1, 1, 1, 1, 1,
0.887116, 1.090105, 1.029076, 1, 1, 1, 1, 1,
0.8889011, -1.790245, 2.563961, 1, 1, 1, 1, 1,
0.8899608, 0.7644668, -0.4046831, 1, 1, 1, 1, 1,
0.8913807, 0.9705128, 0.5803957, 1, 1, 1, 1, 1,
0.8924383, 1.168905, 1.923945, 1, 1, 1, 1, 1,
0.8949378, -0.4149756, 3.13222, 1, 1, 1, 1, 1,
0.8975661, -2.262328, 2.022401, 1, 1, 1, 1, 1,
0.8999691, 0.4802008, 0.7268234, 1, 1, 1, 1, 1,
0.9087566, 0.7222424, 0.7407209, 1, 1, 1, 1, 1,
0.9090732, -0.07720012, 0.790427, 1, 1, 1, 1, 1,
0.9153996, -0.6258042, 1.835415, 1, 1, 1, 1, 1,
0.91618, -0.08628446, 1.029094, 0, 0, 1, 1, 1,
0.922696, 0.6496708, 0.6143139, 1, 0, 0, 1, 1,
0.9250585, 0.826421, 2.398185, 1, 0, 0, 1, 1,
0.9341843, 2.037244, 1.375712, 1, 0, 0, 1, 1,
0.9347228, -0.5086039, 3.666491, 1, 0, 0, 1, 1,
0.9358947, 0.03386982, -0.4486111, 1, 0, 0, 1, 1,
0.9376373, 0.143515, 0.7927161, 0, 0, 0, 1, 1,
0.9483784, 0.7558645, 0.6380236, 0, 0, 0, 1, 1,
0.9526724, 0.6207255, -0.9105132, 0, 0, 0, 1, 1,
0.9596845, 0.7195255, 1.673915, 0, 0, 0, 1, 1,
0.9617192, -1.74511, 2.809368, 0, 0, 0, 1, 1,
0.9711223, -0.4279769, 2.893459, 0, 0, 0, 1, 1,
0.9736495, -0.6054013, 1.420102, 0, 0, 0, 1, 1,
0.97672, -1.261736, 3.246441, 1, 1, 1, 1, 1,
0.9806453, -0.6346167, 0.6716023, 1, 1, 1, 1, 1,
0.9855052, 0.3599902, 2.015881, 1, 1, 1, 1, 1,
0.9884506, 0.142571, 0.6822065, 1, 1, 1, 1, 1,
0.9886861, -0.7074495, 4.037854, 1, 1, 1, 1, 1,
0.9888637, 1.361576, -0.1584891, 1, 1, 1, 1, 1,
1.000295, 0.1094924, 0.4680282, 1, 1, 1, 1, 1,
1.003216, -0.2162757, 0.9513317, 1, 1, 1, 1, 1,
1.010158, 0.7357671, -0.1410722, 1, 1, 1, 1, 1,
1.010271, -0.2027472, 2.317659, 1, 1, 1, 1, 1,
1.01137, 2.042673, 0.09251601, 1, 1, 1, 1, 1,
1.014284, -1.292131, 1.569305, 1, 1, 1, 1, 1,
1.020187, 0.4496995, 1.79927, 1, 1, 1, 1, 1,
1.026498, 0.3860233, 2.170072, 1, 1, 1, 1, 1,
1.03672, 0.6582383, 0.04468019, 1, 1, 1, 1, 1,
1.046172, 0.112945, 0.8442639, 0, 0, 1, 1, 1,
1.04634, -0.1722014, 3.343156, 1, 0, 0, 1, 1,
1.052527, -0.5289617, 3.709614, 1, 0, 0, 1, 1,
1.059595, 0.424993, 1.092472, 1, 0, 0, 1, 1,
1.063504, 1.407746, 0.0989155, 1, 0, 0, 1, 1,
1.081617, -0.4923114, 2.615703, 1, 0, 0, 1, 1,
1.085251, -0.6554301, 3.106738, 0, 0, 0, 1, 1,
1.0858, -1.077698, 2.014588, 0, 0, 0, 1, 1,
1.087363, 0.2014836, 0.8068687, 0, 0, 0, 1, 1,
1.091075, 0.8515832, 0.9172125, 0, 0, 0, 1, 1,
1.103597, 0.7445089, 1.022538, 0, 0, 0, 1, 1,
1.104863, 0.4443129, 2.481332, 0, 0, 0, 1, 1,
1.113654, -0.6076239, 2.553695, 0, 0, 0, 1, 1,
1.114799, 0.5719869, 3.616807, 1, 1, 1, 1, 1,
1.119429, 0.8219907, 1.123391, 1, 1, 1, 1, 1,
1.122487, 0.9547882, 0.1539299, 1, 1, 1, 1, 1,
1.124311, -0.4582072, 1.531318, 1, 1, 1, 1, 1,
1.124911, -0.5086375, 4.967861, 1, 1, 1, 1, 1,
1.12875, -0.9347222, 2.872926, 1, 1, 1, 1, 1,
1.138835, -1.402832, 3.314658, 1, 1, 1, 1, 1,
1.145885, -1.830885, 1.582877, 1, 1, 1, 1, 1,
1.148783, 0.1828971, 2.0594, 1, 1, 1, 1, 1,
1.16007, -1.102915, 1.817382, 1, 1, 1, 1, 1,
1.167516, -2.377594, 2.307101, 1, 1, 1, 1, 1,
1.173566, -0.6316945, 2.68246, 1, 1, 1, 1, 1,
1.173856, 0.1322311, 3.280578, 1, 1, 1, 1, 1,
1.183925, 0.3229195, 0.5364989, 1, 1, 1, 1, 1,
1.187478, 0.7568808, 1.163018, 1, 1, 1, 1, 1,
1.188674, 2.223067, 0.218945, 0, 0, 1, 1, 1,
1.192764, 0.1303634, 0.4944041, 1, 0, 0, 1, 1,
1.204416, -0.2454031, -0.3884008, 1, 0, 0, 1, 1,
1.206854, -0.2414872, 2.457685, 1, 0, 0, 1, 1,
1.208086, 1.420668, -0.5356815, 1, 0, 0, 1, 1,
1.212377, -1.045039, 2.812741, 1, 0, 0, 1, 1,
1.253023, 0.06727238, 1.444923, 0, 0, 0, 1, 1,
1.257555, -1.089895, 1.206951, 0, 0, 0, 1, 1,
1.263552, 1.057803, 1.037024, 0, 0, 0, 1, 1,
1.273663, -0.8331723, 2.68437, 0, 0, 0, 1, 1,
1.275964, 0.6376771, 2.354896, 0, 0, 0, 1, 1,
1.280789, 0.7330706, 1.463209, 0, 0, 0, 1, 1,
1.286774, 0.8202029, 1.939906, 0, 0, 0, 1, 1,
1.288793, -0.1438118, 0.579523, 1, 1, 1, 1, 1,
1.288837, -0.02682784, 0.5648343, 1, 1, 1, 1, 1,
1.290147, 0.001634919, 3.184993, 1, 1, 1, 1, 1,
1.292439, 0.3314944, 0.6185821, 1, 1, 1, 1, 1,
1.301575, -1.042476, 2.441091, 1, 1, 1, 1, 1,
1.302673, -0.06720541, 1.574307, 1, 1, 1, 1, 1,
1.312468, 0.7103367, 2.976302, 1, 1, 1, 1, 1,
1.315956, -0.5032015, 1.418642, 1, 1, 1, 1, 1,
1.319408, -0.2444653, 1.426298, 1, 1, 1, 1, 1,
1.322519, 0.6014423, 0.7151385, 1, 1, 1, 1, 1,
1.323224, 0.8487227, 1.983595, 1, 1, 1, 1, 1,
1.339102, 1.952318, 1.213593, 1, 1, 1, 1, 1,
1.350286, 0.4838106, 2.04174, 1, 1, 1, 1, 1,
1.355338, 0.07117418, -0.8142251, 1, 1, 1, 1, 1,
1.365447, 0.2302702, 1.657636, 1, 1, 1, 1, 1,
1.38369, -1.005012, 3.530699, 0, 0, 1, 1, 1,
1.3935, 0.09026257, 1.751675, 1, 0, 0, 1, 1,
1.396165, -1.006542, 1.898802, 1, 0, 0, 1, 1,
1.399102, -0.4025925, 1.743182, 1, 0, 0, 1, 1,
1.406163, -0.0391196, 1.764835, 1, 0, 0, 1, 1,
1.408583, 1.065828, 0.5232716, 1, 0, 0, 1, 1,
1.41466, -0.4797139, 3.379781, 0, 0, 0, 1, 1,
1.434629, 0.8750849, 0.402615, 0, 0, 0, 1, 1,
1.452287, 0.1642583, 2.824207, 0, 0, 0, 1, 1,
1.472842, -0.1664321, 3.073747, 0, 0, 0, 1, 1,
1.475002, 1.294308, 1.31538, 0, 0, 0, 1, 1,
1.490811, -0.2545837, 0.4321326, 0, 0, 0, 1, 1,
1.491491, 0.08201816, 3.806599, 0, 0, 0, 1, 1,
1.499214, -1.93466, 0.5963765, 1, 1, 1, 1, 1,
1.503354, -0.1929261, 2.248776, 1, 1, 1, 1, 1,
1.508029, -0.1581012, 0.7553006, 1, 1, 1, 1, 1,
1.50866, 1.339252, 0.3165169, 1, 1, 1, 1, 1,
1.512137, -1.724892, 4.15, 1, 1, 1, 1, 1,
1.530924, -0.2059499, 1.157931, 1, 1, 1, 1, 1,
1.538183, -0.0955401, 0.2845998, 1, 1, 1, 1, 1,
1.538218, -0.461244, 1.424268, 1, 1, 1, 1, 1,
1.540911, 2.834803, 0.4222153, 1, 1, 1, 1, 1,
1.544716, -0.7243922, 2.778145, 1, 1, 1, 1, 1,
1.547783, -0.1026615, 3.310325, 1, 1, 1, 1, 1,
1.549796, 0.9118378, -0.1363128, 1, 1, 1, 1, 1,
1.558165, 0.2435764, 2.819726, 1, 1, 1, 1, 1,
1.567663, 0.2105266, 2.54155, 1, 1, 1, 1, 1,
1.583675, 0.03592945, 0.8554751, 1, 1, 1, 1, 1,
1.592355, -0.201074, 1.823828, 0, 0, 1, 1, 1,
1.617844, 1.665071, 0.479529, 1, 0, 0, 1, 1,
1.627172, 1.61212, 1.284288, 1, 0, 0, 1, 1,
1.628182, -1.001627, 1.531171, 1, 0, 0, 1, 1,
1.634013, 0.2964014, 0.9738131, 1, 0, 0, 1, 1,
1.645572, -0.01699687, 0.8303466, 1, 0, 0, 1, 1,
1.649683, 1.692317, -0.4441432, 0, 0, 0, 1, 1,
1.650238, 0.3198053, 0.7610528, 0, 0, 0, 1, 1,
1.717063, -0.7747281, 1.153843, 0, 0, 0, 1, 1,
1.831217, 0.8059689, -0.2406133, 0, 0, 0, 1, 1,
1.845089, -0.1656463, 1.307833, 0, 0, 0, 1, 1,
1.861564, -0.1713433, 2.810226, 0, 0, 0, 1, 1,
1.889055, -0.1179637, 3.264856, 0, 0, 0, 1, 1,
1.894135, 0.181205, 1.572987, 1, 1, 1, 1, 1,
1.91033, -1.629685, 2.466131, 1, 1, 1, 1, 1,
1.923181, 0.4339525, 0.8959078, 1, 1, 1, 1, 1,
1.932598, 1.269859, -0.1786813, 1, 1, 1, 1, 1,
1.966713, 0.963119, 2.267187, 1, 1, 1, 1, 1,
1.976958, -1.21278, 2.421578, 1, 1, 1, 1, 1,
1.97716, 0.7766351, 0.7058667, 1, 1, 1, 1, 1,
2.011321, -0.3576266, 2.181148, 1, 1, 1, 1, 1,
2.012101, 0.7325328, 0.3305892, 1, 1, 1, 1, 1,
2.028109, 0.7179608, 2.752633, 1, 1, 1, 1, 1,
2.035122, 1.087034, 2.756315, 1, 1, 1, 1, 1,
2.150875, -1.713583, 1.366887, 1, 1, 1, 1, 1,
2.16053, 0.407301, 1.239324, 1, 1, 1, 1, 1,
2.168894, 0.5118347, 1.482923, 1, 1, 1, 1, 1,
2.1868, 0.1527407, 2.45733, 1, 1, 1, 1, 1,
2.198519, 0.5605251, 0.7208195, 0, 0, 1, 1, 1,
2.241598, 0.2907991, 1.254032, 1, 0, 0, 1, 1,
2.300598, 0.4919508, -1.18518, 1, 0, 0, 1, 1,
2.309166, 0.9160968, 1.618103, 1, 0, 0, 1, 1,
2.325014, 0.667482, 2.551474, 1, 0, 0, 1, 1,
2.330118, 0.5429123, 0.9451388, 1, 0, 0, 1, 1,
2.558346, -0.8183233, -0.1826313, 0, 0, 0, 1, 1,
2.59891, -0.6909018, 1.594865, 0, 0, 0, 1, 1,
2.619313, 0.4690215, 2.070657, 0, 0, 0, 1, 1,
2.653641, -1.096178, 2.628213, 0, 0, 0, 1, 1,
2.707489, 0.5912555, 0.6161852, 0, 0, 0, 1, 1,
2.76558, 1.222372, 3.10486, 0, 0, 0, 1, 1,
2.829251, -0.8235648, -0.3416854, 0, 0, 0, 1, 1,
2.833356, 1.865071, 0.6985264, 1, 1, 1, 1, 1,
2.935016, -1.349398, 1.326959, 1, 1, 1, 1, 1,
3.009096, 0.004089828, 1.136077, 1, 1, 1, 1, 1,
3.018988, 0.6020692, 0.9871953, 1, 1, 1, 1, 1,
3.127616, -0.04110314, 3.070812, 1, 1, 1, 1, 1,
3.496307, -1.619284, 2.335569, 1, 1, 1, 1, 1,
3.946509, 1.065223, 3.735018, 1, 1, 1, 1, 1
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
var radius = 10.13053;
var distance = 35.58307;
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
mvMatrix.translate( -0.250447, -0.4390295, -0.4342723 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.58307);
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
