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
-2.867206, 1.555876, -1.62817, 1, 0, 0, 1,
-2.777679, -0.937182, -0.232205, 1, 0.007843138, 0, 1,
-2.720376, 0.8209153, -1.305928, 1, 0.01176471, 0, 1,
-2.705933, -1.24091, -2.750391, 1, 0.01960784, 0, 1,
-2.616881, -0.7202716, -2.83235, 1, 0.02352941, 0, 1,
-2.594697, 0.1823199, -1.077102, 1, 0.03137255, 0, 1,
-2.512395, -0.9938357, -0.3415587, 1, 0.03529412, 0, 1,
-2.468758, 0.6618341, -2.627426, 1, 0.04313726, 0, 1,
-2.448187, -1.145008, -2.578444, 1, 0.04705882, 0, 1,
-2.447323, -1.534565, -1.258339, 1, 0.05490196, 0, 1,
-2.389984, 0.1976071, -1.395601, 1, 0.05882353, 0, 1,
-2.332016, 0.3568113, -1.281821, 1, 0.06666667, 0, 1,
-2.311004, -0.6932421, -3.161183, 1, 0.07058824, 0, 1,
-2.299037, 1.189462, -0.272537, 1, 0.07843138, 0, 1,
-2.267154, 0.7749675, -1.294518, 1, 0.08235294, 0, 1,
-2.239091, -0.5785607, -2.646367, 1, 0.09019608, 0, 1,
-2.208467, -1.854104, -1.698499, 1, 0.09411765, 0, 1,
-2.205923, -0.2906718, -2.515297, 1, 0.1019608, 0, 1,
-2.168063, 0.3813303, -1.433529, 1, 0.1098039, 0, 1,
-2.137488, -1.014158, -2.805955, 1, 0.1137255, 0, 1,
-2.112206, 1.329155, -1.711855, 1, 0.1215686, 0, 1,
-2.074142, 0.206459, -2.975114, 1, 0.1254902, 0, 1,
-2.068225, 1.040356, -1.514234, 1, 0.1333333, 0, 1,
-2.063492, 0.1153599, -0.9000644, 1, 0.1372549, 0, 1,
-2.042073, -0.3064579, -0.8445695, 1, 0.145098, 0, 1,
-2.024049, 0.7818961, -1.206263, 1, 0.1490196, 0, 1,
-2.022797, -0.2754987, -1.137471, 1, 0.1568628, 0, 1,
-2.012157, 0.4773428, -2.278098, 1, 0.1607843, 0, 1,
-1.986271, -0.1766728, -0.6886535, 1, 0.1686275, 0, 1,
-1.983604, 0.2399385, -0.2815532, 1, 0.172549, 0, 1,
-1.981056, -0.5625783, -2.941647, 1, 0.1803922, 0, 1,
-1.967479, -0.2460642, -2.857395, 1, 0.1843137, 0, 1,
-1.947947, 0.1302349, -0.6183183, 1, 0.1921569, 0, 1,
-1.928048, 1.348574, 1.034636, 1, 0.1960784, 0, 1,
-1.919253, 0.9492397, 0.2625186, 1, 0.2039216, 0, 1,
-1.918842, -1.227637, -4.613115, 1, 0.2117647, 0, 1,
-1.912475, 0.02181709, -1.649449, 1, 0.2156863, 0, 1,
-1.889661, -1.359641, -2.185056, 1, 0.2235294, 0, 1,
-1.880317, -0.6343623, -1.980033, 1, 0.227451, 0, 1,
-1.878885, -0.07094432, -2.798505, 1, 0.2352941, 0, 1,
-1.826435, 0.1871931, -2.881098, 1, 0.2392157, 0, 1,
-1.820352, -0.3607531, -2.813169, 1, 0.2470588, 0, 1,
-1.806214, -0.7002535, -0.9156532, 1, 0.2509804, 0, 1,
-1.78802, 0.5696964, -3.613411, 1, 0.2588235, 0, 1,
-1.779231, 0.4757379, -2.463089, 1, 0.2627451, 0, 1,
-1.773786, 0.6170622, 0.6013374, 1, 0.2705882, 0, 1,
-1.756253, -0.8426872, -1.461052, 1, 0.2745098, 0, 1,
-1.72973, -0.8353561, -3.425697, 1, 0.282353, 0, 1,
-1.72777, 1.776267, -2.298864, 1, 0.2862745, 0, 1,
-1.723193, -2.457624, -2.260386, 1, 0.2941177, 0, 1,
-1.65437, 1.245781, -0.1888301, 1, 0.3019608, 0, 1,
-1.647243, -0.9696146, -3.459974, 1, 0.3058824, 0, 1,
-1.646801, -0.6548027, -1.611292, 1, 0.3137255, 0, 1,
-1.62115, -0.8084315, -2.728642, 1, 0.3176471, 0, 1,
-1.614208, 0.3008547, -0.7587278, 1, 0.3254902, 0, 1,
-1.592195, -0.4853653, -2.695525, 1, 0.3294118, 0, 1,
-1.585741, 0.8120542, -2.014215, 1, 0.3372549, 0, 1,
-1.585372, 0.548216, -0.157131, 1, 0.3411765, 0, 1,
-1.585358, -0.2925081, -2.24717, 1, 0.3490196, 0, 1,
-1.581509, -1.746205, -0.3283309, 1, 0.3529412, 0, 1,
-1.58109, -0.1563448, -3.155222, 1, 0.3607843, 0, 1,
-1.575966, -0.6912407, -2.249475, 1, 0.3647059, 0, 1,
-1.568862, 0.2988444, -1.252931, 1, 0.372549, 0, 1,
-1.552046, 0.8915583, -0.6059964, 1, 0.3764706, 0, 1,
-1.551648, -0.1329737, -2.385652, 1, 0.3843137, 0, 1,
-1.548226, 0.09536733, -1.291127, 1, 0.3882353, 0, 1,
-1.520615, 0.7763034, 0.1204601, 1, 0.3960784, 0, 1,
-1.510774, 0.08011258, -3.13743, 1, 0.4039216, 0, 1,
-1.491334, -0.4247028, -0.969685, 1, 0.4078431, 0, 1,
-1.467048, -1.753199, -2.537867, 1, 0.4156863, 0, 1,
-1.459546, -1.690796, -2.678776, 1, 0.4196078, 0, 1,
-1.457142, -1.203242, -2.875519, 1, 0.427451, 0, 1,
-1.445979, -0.8549696, -2.267867, 1, 0.4313726, 0, 1,
-1.442146, 0.2732883, -1.230939, 1, 0.4392157, 0, 1,
-1.440477, -1.558954, -2.188652, 1, 0.4431373, 0, 1,
-1.424029, 0.150736, -2.872637, 1, 0.4509804, 0, 1,
-1.40933, 0.2855179, -1.520567, 1, 0.454902, 0, 1,
-1.40763, 0.2501187, -2.77549, 1, 0.4627451, 0, 1,
-1.386879, 0.2590955, -3.519796, 1, 0.4666667, 0, 1,
-1.383626, 1.705789, -2.036565, 1, 0.4745098, 0, 1,
-1.3827, -0.2325308, -2.621585, 1, 0.4784314, 0, 1,
-1.371181, -1.167813, -1.751371, 1, 0.4862745, 0, 1,
-1.37081, 2.463037, -0.964716, 1, 0.4901961, 0, 1,
-1.367388, 0.08141088, -0.605946, 1, 0.4980392, 0, 1,
-1.359078, -2.345884, -3.281245, 1, 0.5058824, 0, 1,
-1.356984, 0.2434834, -1.810326, 1, 0.509804, 0, 1,
-1.346952, -1.361055, -1.674185, 1, 0.5176471, 0, 1,
-1.343405, 0.9053637, -1.147109, 1, 0.5215687, 0, 1,
-1.335839, -1.044676, -0.2558393, 1, 0.5294118, 0, 1,
-1.333286, -0.4345946, -1.080079, 1, 0.5333334, 0, 1,
-1.330715, 1.222207, -1.32522, 1, 0.5411765, 0, 1,
-1.325679, -0.4429576, -1.778812, 1, 0.5450981, 0, 1,
-1.320307, -0.001399073, -1.240257, 1, 0.5529412, 0, 1,
-1.319308, 0.8721848, -3.103718, 1, 0.5568628, 0, 1,
-1.318694, -0.3785105, -2.052339, 1, 0.5647059, 0, 1,
-1.31594, 0.9830607, 0.1859748, 1, 0.5686275, 0, 1,
-1.315441, -1.621719, -1.06568, 1, 0.5764706, 0, 1,
-1.300471, 1.133843, 0.2319754, 1, 0.5803922, 0, 1,
-1.297762, 1.538945, -1.558378, 1, 0.5882353, 0, 1,
-1.297608, 0.682757, 0.2998893, 1, 0.5921569, 0, 1,
-1.289904, 1.481932, -0.4708784, 1, 0.6, 0, 1,
-1.283296, 0.4733765, -1.28281, 1, 0.6078432, 0, 1,
-1.277279, 1.723597, -0.02820865, 1, 0.6117647, 0, 1,
-1.259436, 2.57204, -0.2903063, 1, 0.6196079, 0, 1,
-1.254466, 0.3797055, -0.6088156, 1, 0.6235294, 0, 1,
-1.251861, 0.5198302, -1.313176, 1, 0.6313726, 0, 1,
-1.246277, 0.09220044, -1.199334, 1, 0.6352941, 0, 1,
-1.238744, 0.1684003, 0.6528904, 1, 0.6431373, 0, 1,
-1.220904, 1.679882, -1.731791, 1, 0.6470588, 0, 1,
-1.220244, -0.7080099, -0.7043541, 1, 0.654902, 0, 1,
-1.215372, -1.59811, -2.843693, 1, 0.6588235, 0, 1,
-1.213878, 1.060493, 0.5892729, 1, 0.6666667, 0, 1,
-1.208999, 0.8287752, -0.2031607, 1, 0.6705883, 0, 1,
-1.191956, -0.4465177, -2.909082, 1, 0.6784314, 0, 1,
-1.187224, -2.098949, -1.596172, 1, 0.682353, 0, 1,
-1.184994, 0.2001194, -1.214544, 1, 0.6901961, 0, 1,
-1.183867, -0.1704677, -2.356422, 1, 0.6941177, 0, 1,
-1.182872, 0.3144208, -0.1714125, 1, 0.7019608, 0, 1,
-1.17854, 1.110306, 1.345764, 1, 0.7098039, 0, 1,
-1.168838, 1.757247, -0.9075188, 1, 0.7137255, 0, 1,
-1.150067, 1.716315, -1.77136, 1, 0.7215686, 0, 1,
-1.149601, -0.09846579, -2.680503, 1, 0.7254902, 0, 1,
-1.148729, -0.1137198, -2.473652, 1, 0.7333333, 0, 1,
-1.147619, 0.8206998, 0.1959101, 1, 0.7372549, 0, 1,
-1.14166, 0.4901895, -1.09016, 1, 0.7450981, 0, 1,
-1.12667, -1.242564, -0.08572511, 1, 0.7490196, 0, 1,
-1.125991, 0.5907644, -0.8210917, 1, 0.7568628, 0, 1,
-1.123319, -0.7700266, -1.542472, 1, 0.7607843, 0, 1,
-1.120734, 0.7102956, -1.431369, 1, 0.7686275, 0, 1,
-1.120624, 2.400111, 0.07806772, 1, 0.772549, 0, 1,
-1.112752, -0.4606812, -2.695824, 1, 0.7803922, 0, 1,
-1.111718, -0.1891206, -1.28942, 1, 0.7843137, 0, 1,
-1.100088, -0.4782134, -3.634299, 1, 0.7921569, 0, 1,
-1.098427, 0.2747639, -2.111853, 1, 0.7960784, 0, 1,
-1.096698, 0.6764013, -0.452216, 1, 0.8039216, 0, 1,
-1.086218, -0.5008875, -3.388213, 1, 0.8117647, 0, 1,
-1.086148, 0.88469, -1.807323, 1, 0.8156863, 0, 1,
-1.084525, -1.331055, -3.666508, 1, 0.8235294, 0, 1,
-1.082171, 2.01596, 0.3462647, 1, 0.827451, 0, 1,
-1.080487, 0.6786804, -3.651001, 1, 0.8352941, 0, 1,
-1.076166, -0.5081645, -1.156929, 1, 0.8392157, 0, 1,
-1.075995, -0.935605, -2.472169, 1, 0.8470588, 0, 1,
-1.069887, 0.1075811, -0.7569066, 1, 0.8509804, 0, 1,
-1.061204, -0.6973827, -2.227867, 1, 0.8588235, 0, 1,
-1.060202, 0.3881731, -0.8899765, 1, 0.8627451, 0, 1,
-1.05426, -0.1411988, -0.300984, 1, 0.8705882, 0, 1,
-1.052763, -0.6786292, -1.583577, 1, 0.8745098, 0, 1,
-1.050296, -0.903523, -2.717831, 1, 0.8823529, 0, 1,
-1.049765, 1.456909, -0.2534589, 1, 0.8862745, 0, 1,
-1.036771, 0.818229, 0.4309752, 1, 0.8941177, 0, 1,
-1.033488, -1.573991, -2.192161, 1, 0.8980392, 0, 1,
-1.030006, 0.2015994, -1.527278, 1, 0.9058824, 0, 1,
-1.028667, 0.2657742, -3.196607, 1, 0.9137255, 0, 1,
-1.019729, 1.668993, -0.3639235, 1, 0.9176471, 0, 1,
-1.013243, -0.6284783, -1.711724, 1, 0.9254902, 0, 1,
-1.012956, 1.494343, -1.40417, 1, 0.9294118, 0, 1,
-1.010673, -2.977011, -1.420392, 1, 0.9372549, 0, 1,
-1.010023, -0.9049169, -2.683048, 1, 0.9411765, 0, 1,
-1.007965, 0.05444183, -2.635163, 1, 0.9490196, 0, 1,
-1.005395, 0.005825073, -3.381312, 1, 0.9529412, 0, 1,
-1.003474, -1.266545, -1.388222, 1, 0.9607843, 0, 1,
-0.9994454, 0.5687862, -0.09230545, 1, 0.9647059, 0, 1,
-0.9992234, -1.417217, -2.189327, 1, 0.972549, 0, 1,
-0.9912375, 1.162504, -2.239712, 1, 0.9764706, 0, 1,
-0.9871507, 1.276302, -0.6946107, 1, 0.9843137, 0, 1,
-0.9800772, -0.9143878, -2.718415, 1, 0.9882353, 0, 1,
-0.9770284, 0.7740206, -0.1385634, 1, 0.9960784, 0, 1,
-0.9765723, -1.066319, -1.829566, 0.9960784, 1, 0, 1,
-0.9755532, 1.47642, -0.548649, 0.9921569, 1, 0, 1,
-0.9739474, -2.794329, -2.577114, 0.9843137, 1, 0, 1,
-0.9721823, 1.103096, 0.3576454, 0.9803922, 1, 0, 1,
-0.9710322, 1.011299, 0.159464, 0.972549, 1, 0, 1,
-0.9683186, -0.2955012, -0.7006989, 0.9686275, 1, 0, 1,
-0.9659322, -0.4184029, -2.810345, 0.9607843, 1, 0, 1,
-0.9542241, 2.083612, -0.9020811, 0.9568627, 1, 0, 1,
-0.9539172, 1.363606, -0.6322086, 0.9490196, 1, 0, 1,
-0.9518905, 0.7660988, -0.4225718, 0.945098, 1, 0, 1,
-0.938687, -1.697843, -3.581511, 0.9372549, 1, 0, 1,
-0.9354952, -1.397723, -4.204762, 0.9333333, 1, 0, 1,
-0.934579, -0.5451981, -2.983755, 0.9254902, 1, 0, 1,
-0.9325678, 0.9486692, -1.571748, 0.9215686, 1, 0, 1,
-0.9307408, 0.126214, -2.253943, 0.9137255, 1, 0, 1,
-0.9267355, 0.6212291, -0.3246881, 0.9098039, 1, 0, 1,
-0.9261743, -1.27468, -1.814409, 0.9019608, 1, 0, 1,
-0.9248335, 1.473444, -1.377123, 0.8941177, 1, 0, 1,
-0.9235106, 0.3053007, -1.446424, 0.8901961, 1, 0, 1,
-0.9218513, 0.0420907, -1.807043, 0.8823529, 1, 0, 1,
-0.9142044, -0.09022111, -1.044312, 0.8784314, 1, 0, 1,
-0.9000111, 1.790818, -1.450936, 0.8705882, 1, 0, 1,
-0.8990861, 0.6859897, -1.205835, 0.8666667, 1, 0, 1,
-0.8975305, 0.05241403, 0.2074135, 0.8588235, 1, 0, 1,
-0.8975211, -0.3892282, -2.723341, 0.854902, 1, 0, 1,
-0.8805526, -0.199852, -1.490968, 0.8470588, 1, 0, 1,
-0.8797162, 1.855874, 1.251337, 0.8431373, 1, 0, 1,
-0.873193, -0.5328507, -0.09930066, 0.8352941, 1, 0, 1,
-0.8721846, 0.210077, -1.592969, 0.8313726, 1, 0, 1,
-0.8712357, -0.005400918, -1.391931, 0.8235294, 1, 0, 1,
-0.8659895, 0.5477141, 0.1671483, 0.8196079, 1, 0, 1,
-0.8652011, 0.1625415, -2.885029, 0.8117647, 1, 0, 1,
-0.863132, 0.3129848, -1.812495, 0.8078431, 1, 0, 1,
-0.860381, 0.256586, -1.321772, 0.8, 1, 0, 1,
-0.8590313, -2.088724, -2.817724, 0.7921569, 1, 0, 1,
-0.8585428, 2.08231, -0.7545152, 0.7882353, 1, 0, 1,
-0.8562061, 0.5960561, -0.9065108, 0.7803922, 1, 0, 1,
-0.8497045, -0.2258528, -0.8456399, 0.7764706, 1, 0, 1,
-0.8381243, 0.8869124, -0.3025784, 0.7686275, 1, 0, 1,
-0.8334502, 0.4327902, -0.7046027, 0.7647059, 1, 0, 1,
-0.8269324, 1.233016, -1.378049, 0.7568628, 1, 0, 1,
-0.8264729, -0.3829949, -2.602529, 0.7529412, 1, 0, 1,
-0.821465, -0.4216946, -0.6086721, 0.7450981, 1, 0, 1,
-0.8187024, -0.205225, -2.808431, 0.7411765, 1, 0, 1,
-0.8178974, -1.296416, -1.871561, 0.7333333, 1, 0, 1,
-0.8148398, 0.1023285, -2.285545, 0.7294118, 1, 0, 1,
-0.813874, -1.503577, -4.026384, 0.7215686, 1, 0, 1,
-0.8127384, 1.042809, -0.8199037, 0.7176471, 1, 0, 1,
-0.7965015, -0.1305137, -1.212716, 0.7098039, 1, 0, 1,
-0.7957524, 0.08951452, -0.9504687, 0.7058824, 1, 0, 1,
-0.7951884, -0.7265219, -2.41817, 0.6980392, 1, 0, 1,
-0.7951877, -0.1139504, -2.613931, 0.6901961, 1, 0, 1,
-0.792249, -0.06667911, -0.1795382, 0.6862745, 1, 0, 1,
-0.7913982, 1.942882, 0.8146815, 0.6784314, 1, 0, 1,
-0.7910751, 0.4384297, -0.3422563, 0.6745098, 1, 0, 1,
-0.7891652, 0.2204813, -0.2939206, 0.6666667, 1, 0, 1,
-0.7842581, -1.265918, -1.980115, 0.6627451, 1, 0, 1,
-0.7835724, 0.6604602, -1.469723, 0.654902, 1, 0, 1,
-0.7832661, 0.886173, 0.3708997, 0.6509804, 1, 0, 1,
-0.7823058, 0.5185816, -0.2801342, 0.6431373, 1, 0, 1,
-0.7709631, 1.025798, -2.031507, 0.6392157, 1, 0, 1,
-0.7654604, 1.074892, -1.489901, 0.6313726, 1, 0, 1,
-0.764315, -0.1636437, -1.75553, 0.627451, 1, 0, 1,
-0.7628387, -0.472864, -1.313108, 0.6196079, 1, 0, 1,
-0.7580627, 0.04609441, -0.4098315, 0.6156863, 1, 0, 1,
-0.755546, 0.03947939, -2.26489, 0.6078432, 1, 0, 1,
-0.7498321, 0.1088006, -1.60778, 0.6039216, 1, 0, 1,
-0.7367916, -0.6317484, -2.076153, 0.5960785, 1, 0, 1,
-0.7359055, 1.120952, -1.204924, 0.5882353, 1, 0, 1,
-0.7345991, -1.518118, -2.064661, 0.5843138, 1, 0, 1,
-0.7328005, 0.06924176, -1.353809, 0.5764706, 1, 0, 1,
-0.7261103, -1.084388, -2.453567, 0.572549, 1, 0, 1,
-0.7195053, 0.2807712, -1.365918, 0.5647059, 1, 0, 1,
-0.7183249, 1.136341, -1.703711, 0.5607843, 1, 0, 1,
-0.7017434, 0.8855293, -0.8035398, 0.5529412, 1, 0, 1,
-0.6995078, -0.9865413, -3.595128, 0.5490196, 1, 0, 1,
-0.6961485, 1.217002, 0.7760551, 0.5411765, 1, 0, 1,
-0.6924751, 0.04225609, -2.144069, 0.5372549, 1, 0, 1,
-0.6896766, -1.400518, -1.799951, 0.5294118, 1, 0, 1,
-0.6862115, 0.4490932, 0.08523158, 0.5254902, 1, 0, 1,
-0.6861197, -0.4297624, -1.627786, 0.5176471, 1, 0, 1,
-0.6819708, 2.364217, -0.6875345, 0.5137255, 1, 0, 1,
-0.6799443, 0.5358234, -0.3884843, 0.5058824, 1, 0, 1,
-0.6781019, 0.7148451, 1.883892, 0.5019608, 1, 0, 1,
-0.6771032, 0.6764184, -1.416742, 0.4941176, 1, 0, 1,
-0.6760564, 0.8775675, -0.1868525, 0.4862745, 1, 0, 1,
-0.6688207, -1.717315, -4.427565, 0.4823529, 1, 0, 1,
-0.6681877, 1.516749, -0.7020817, 0.4745098, 1, 0, 1,
-0.6677886, 0.246869, -2.042244, 0.4705882, 1, 0, 1,
-0.6638077, -0.8805948, -3.320005, 0.4627451, 1, 0, 1,
-0.6626653, -0.3267503, -2.154306, 0.4588235, 1, 0, 1,
-0.6620656, 0.5930005, -0.8883087, 0.4509804, 1, 0, 1,
-0.6592464, 0.278843, -1.070682, 0.4470588, 1, 0, 1,
-0.6551172, -0.4826348, -2.044527, 0.4392157, 1, 0, 1,
-0.6535046, -0.5318993, -2.4195, 0.4352941, 1, 0, 1,
-0.6482093, 0.7986203, -0.9596949, 0.427451, 1, 0, 1,
-0.6362524, -1.406201, -1.485896, 0.4235294, 1, 0, 1,
-0.636086, -0.5531977, -1.805356, 0.4156863, 1, 0, 1,
-0.6356461, 1.675458, -0.1008848, 0.4117647, 1, 0, 1,
-0.6314557, -1.018845, -3.172767, 0.4039216, 1, 0, 1,
-0.6296696, -1.227251, -1.951892, 0.3960784, 1, 0, 1,
-0.6266671, 0.2064986, 0.3346668, 0.3921569, 1, 0, 1,
-0.6247253, 0.3454423, -0.4209603, 0.3843137, 1, 0, 1,
-0.6243253, -0.1140184, -1.833445, 0.3803922, 1, 0, 1,
-0.6135514, 1.138054, -2.293794, 0.372549, 1, 0, 1,
-0.6127292, 1.475157, 0.8081641, 0.3686275, 1, 0, 1,
-0.6119061, -0.21197, -1.537667, 0.3607843, 1, 0, 1,
-0.6068382, 1.160001, 0.5537766, 0.3568628, 1, 0, 1,
-0.5995212, 1.275747, -0.150756, 0.3490196, 1, 0, 1,
-0.5991526, 0.4663679, -0.7266026, 0.345098, 1, 0, 1,
-0.59723, -1.124649, -3.973157, 0.3372549, 1, 0, 1,
-0.5959019, -0.2324531, -1.917307, 0.3333333, 1, 0, 1,
-0.591231, 1.128047, -0.916012, 0.3254902, 1, 0, 1,
-0.5883355, 1.417691, -0.6342583, 0.3215686, 1, 0, 1,
-0.587072, -1.873425, -3.633711, 0.3137255, 1, 0, 1,
-0.5838692, 0.2999047, -2.414777, 0.3098039, 1, 0, 1,
-0.5807372, -0.2555305, -1.127618, 0.3019608, 1, 0, 1,
-0.5796095, 0.6694925, -1.363564, 0.2941177, 1, 0, 1,
-0.5744147, 0.5056246, -0.03172712, 0.2901961, 1, 0, 1,
-0.5716919, 0.7743395, 0.9506245, 0.282353, 1, 0, 1,
-0.570769, 0.2372153, -1.455101, 0.2784314, 1, 0, 1,
-0.5705518, 0.4273133, -0.8743448, 0.2705882, 1, 0, 1,
-0.5641575, -0.01489908, -1.263006, 0.2666667, 1, 0, 1,
-0.5590584, -1.538312, -3.682293, 0.2588235, 1, 0, 1,
-0.5582188, 0.7926999, 0.3727532, 0.254902, 1, 0, 1,
-0.5477288, 0.1334048, -2.135217, 0.2470588, 1, 0, 1,
-0.5433223, -0.238248, -2.335162, 0.2431373, 1, 0, 1,
-0.5405657, -0.3759345, -2.520227, 0.2352941, 1, 0, 1,
-0.5401149, -0.6940689, -1.856057, 0.2313726, 1, 0, 1,
-0.5382962, -1.07689, -3.433413, 0.2235294, 1, 0, 1,
-0.5358779, -0.223284, -3.131093, 0.2196078, 1, 0, 1,
-0.5336718, 1.418426, 0.8265473, 0.2117647, 1, 0, 1,
-0.5299029, -0.06590098, -2.067881, 0.2078431, 1, 0, 1,
-0.5228899, 1.159951, 0.276526, 0.2, 1, 0, 1,
-0.5224692, -1.678924, -3.071115, 0.1921569, 1, 0, 1,
-0.5178992, -0.2391296, -0.9941625, 0.1882353, 1, 0, 1,
-0.5102854, -1.451221, -3.92013, 0.1803922, 1, 0, 1,
-0.5098358, -0.7173114, -3.423566, 0.1764706, 1, 0, 1,
-0.5096463, -0.3296396, -0.9099793, 0.1686275, 1, 0, 1,
-0.5087913, -0.5713036, -2.192928, 0.1647059, 1, 0, 1,
-0.5056282, -1.299607, -2.004959, 0.1568628, 1, 0, 1,
-0.5016754, -0.4687948, -1.23959, 0.1529412, 1, 0, 1,
-0.5012739, -0.4938661, -2.074966, 0.145098, 1, 0, 1,
-0.4992566, -0.1231084, -2.744279, 0.1411765, 1, 0, 1,
-0.4962213, 0.4159328, -0.0752652, 0.1333333, 1, 0, 1,
-0.4913763, -1.154051, -2.044162, 0.1294118, 1, 0, 1,
-0.490671, 1.391891, 0.06136969, 0.1215686, 1, 0, 1,
-0.4815261, -0.8051463, -3.623041, 0.1176471, 1, 0, 1,
-0.4777168, 0.3117947, 0.8513154, 0.1098039, 1, 0, 1,
-0.4773036, 0.3276297, -0.1074804, 0.1058824, 1, 0, 1,
-0.4734589, -1.984222, -4.339018, 0.09803922, 1, 0, 1,
-0.47177, 0.4742208, -0.6409022, 0.09019608, 1, 0, 1,
-0.4611265, -0.5356477, -0.2144267, 0.08627451, 1, 0, 1,
-0.459265, -1.270892, -3.380367, 0.07843138, 1, 0, 1,
-0.4453683, 0.3070104, -2.699248, 0.07450981, 1, 0, 1,
-0.4452039, 0.5044053, -2.81469, 0.06666667, 1, 0, 1,
-0.4407806, -0.4659835, -2.308121, 0.0627451, 1, 0, 1,
-0.4379771, -0.7039294, -3.982668, 0.05490196, 1, 0, 1,
-0.4345659, -0.5336909, -2.115191, 0.05098039, 1, 0, 1,
-0.4286841, 0.3708157, 0.7993378, 0.04313726, 1, 0, 1,
-0.427531, 0.1430026, -0.5701022, 0.03921569, 1, 0, 1,
-0.4258832, 1.417821, -0.006201481, 0.03137255, 1, 0, 1,
-0.4249801, 1.307376, -0.6041197, 0.02745098, 1, 0, 1,
-0.4245952, 1.457769, -0.5636827, 0.01960784, 1, 0, 1,
-0.4245649, 2.079204, -0.0848434, 0.01568628, 1, 0, 1,
-0.4183125, -0.6747305, -3.368353, 0.007843138, 1, 0, 1,
-0.4173009, 1.505824, -1.17047, 0.003921569, 1, 0, 1,
-0.4167914, -0.4176112, -0.4660192, 0, 1, 0.003921569, 1,
-0.4111283, 1.532611, -1.007454, 0, 1, 0.01176471, 1,
-0.4065744, 0.9244609, -0.6995003, 0, 1, 0.01568628, 1,
-0.4012773, -0.7371889, -1.731014, 0, 1, 0.02352941, 1,
-0.4006259, -0.04766633, -4.233177, 0, 1, 0.02745098, 1,
-0.3962171, -0.323578, -3.278787, 0, 1, 0.03529412, 1,
-0.3913336, -0.7603531, -3.928146, 0, 1, 0.03921569, 1,
-0.3891285, 0.4499254, -0.1398696, 0, 1, 0.04705882, 1,
-0.3883269, -0.9161155, -2.911719, 0, 1, 0.05098039, 1,
-0.387502, 1.38803, 0.4604524, 0, 1, 0.05882353, 1,
-0.3867401, -0.7444497, -2.754983, 0, 1, 0.0627451, 1,
-0.3859597, -1.2419, -3.149551, 0, 1, 0.07058824, 1,
-0.3855051, 0.148736, -0.6545037, 0, 1, 0.07450981, 1,
-0.3852077, -1.686503, -4.807837, 0, 1, 0.08235294, 1,
-0.3824421, -0.2020482, -2.354952, 0, 1, 0.08627451, 1,
-0.3821816, 1.10509, -0.404606, 0, 1, 0.09411765, 1,
-0.3805554, 0.7187683, -0.2410629, 0, 1, 0.1019608, 1,
-0.3749835, 1.002941, 1.164879, 0, 1, 0.1058824, 1,
-0.3725102, 0.9059089, 1.150496, 0, 1, 0.1137255, 1,
-0.3714767, -0.6783036, -2.351907, 0, 1, 0.1176471, 1,
-0.3702202, 2.04406, 0.000681608, 0, 1, 0.1254902, 1,
-0.3689719, -0.1333669, -1.399375, 0, 1, 0.1294118, 1,
-0.3686537, 0.3833887, -2.475856, 0, 1, 0.1372549, 1,
-0.354332, -0.7159293, -3.070228, 0, 1, 0.1411765, 1,
-0.3479638, 0.6219308, -0.5632985, 0, 1, 0.1490196, 1,
-0.346903, 2.022491, 1.400623, 0, 1, 0.1529412, 1,
-0.3383633, 0.3782549, 0.2113902, 0, 1, 0.1607843, 1,
-0.3382609, -0.6149617, -4.936778, 0, 1, 0.1647059, 1,
-0.3370105, 0.5659686, -1.802214, 0, 1, 0.172549, 1,
-0.3367132, 0.3083242, -1.173023, 0, 1, 0.1764706, 1,
-0.3331856, -0.1139002, -2.053278, 0, 1, 0.1843137, 1,
-0.3318298, -0.2217245, -2.74946, 0, 1, 0.1882353, 1,
-0.3250839, 0.1174209, -0.4426651, 0, 1, 0.1960784, 1,
-0.3239681, 1.478519, -0.7209386, 0, 1, 0.2039216, 1,
-0.3204493, 0.3874257, -1.514432, 0, 1, 0.2078431, 1,
-0.3192206, -0.574691, -3.560937, 0, 1, 0.2156863, 1,
-0.3172682, 2.79748, 0.08021419, 0, 1, 0.2196078, 1,
-0.3170221, 1.463893, -0.296575, 0, 1, 0.227451, 1,
-0.3150018, 0.2304455, -0.9656119, 0, 1, 0.2313726, 1,
-0.3127126, 1.906226, -0.348913, 0, 1, 0.2392157, 1,
-0.3124073, -1.587571, -2.736162, 0, 1, 0.2431373, 1,
-0.3100049, -0.4769247, -3.670125, 0, 1, 0.2509804, 1,
-0.3082236, -1.207183, -2.659943, 0, 1, 0.254902, 1,
-0.3073665, -0.9338925, -2.200744, 0, 1, 0.2627451, 1,
-0.3022304, -0.4223039, -2.108841, 0, 1, 0.2666667, 1,
-0.3017004, -0.405916, -3.345985, 0, 1, 0.2745098, 1,
-0.3002968, -1.462966, -3.031294, 0, 1, 0.2784314, 1,
-0.3002789, -0.02349901, -2.372238, 0, 1, 0.2862745, 1,
-0.3000197, -0.0880923, -1.573095, 0, 1, 0.2901961, 1,
-0.2947468, 1.182103, -2.153679, 0, 1, 0.2980392, 1,
-0.2943914, 0.8446725, -0.7378215, 0, 1, 0.3058824, 1,
-0.2933283, -0.3207704, -2.044741, 0, 1, 0.3098039, 1,
-0.287576, -0.04038262, -1.487407, 0, 1, 0.3176471, 1,
-0.287538, 1.834488, -0.4624589, 0, 1, 0.3215686, 1,
-0.2839013, -0.5073963, -2.020161, 0, 1, 0.3294118, 1,
-0.2774139, 1.202287, 0.5306801, 0, 1, 0.3333333, 1,
-0.275916, -0.9677485, -3.316189, 0, 1, 0.3411765, 1,
-0.2721097, 0.453185, -0.3163789, 0, 1, 0.345098, 1,
-0.2705071, 0.905488, -0.5013421, 0, 1, 0.3529412, 1,
-0.2661957, -0.1982828, -0.4444247, 0, 1, 0.3568628, 1,
-0.2550578, -1.850309, -3.003846, 0, 1, 0.3647059, 1,
-0.2547461, 0.4534405, -2.674037, 0, 1, 0.3686275, 1,
-0.2529614, 1.941979, -0.2333811, 0, 1, 0.3764706, 1,
-0.2416966, 1.083744, 0.07091223, 0, 1, 0.3803922, 1,
-0.2390052, 1.758598, -2.493087, 0, 1, 0.3882353, 1,
-0.235634, 0.3567985, 0.06213016, 0, 1, 0.3921569, 1,
-0.2337554, 1.415629, -1.10252, 0, 1, 0.4, 1,
-0.2331488, 1.299555, -0.3743636, 0, 1, 0.4078431, 1,
-0.2309301, -0.4712595, -3.504505, 0, 1, 0.4117647, 1,
-0.229593, -1.702056, -3.305619, 0, 1, 0.4196078, 1,
-0.2277531, -1.051293, -1.520752, 0, 1, 0.4235294, 1,
-0.2241868, 0.8707237, -0.4593846, 0, 1, 0.4313726, 1,
-0.2206263, 0.7748318, -0.8428703, 0, 1, 0.4352941, 1,
-0.216655, -0.6778469, -2.548706, 0, 1, 0.4431373, 1,
-0.216003, 0.5751115, 0.6698583, 0, 1, 0.4470588, 1,
-0.2148114, -2.49604, -4.938296, 0, 1, 0.454902, 1,
-0.2131569, -0.5605302, -6.885048, 0, 1, 0.4588235, 1,
-0.2126041, -1.075903, -3.251783, 0, 1, 0.4666667, 1,
-0.2095265, 0.01656079, -1.767237, 0, 1, 0.4705882, 1,
-0.2059864, 1.350587, -0.1907319, 0, 1, 0.4784314, 1,
-0.2055067, -0.06355646, -2.470039, 0, 1, 0.4823529, 1,
-0.2047432, 0.6739874, 1.18084, 0, 1, 0.4901961, 1,
-0.2037775, 0.8454928, 1.305854, 0, 1, 0.4941176, 1,
-0.2027556, 1.320148, 0.3369548, 0, 1, 0.5019608, 1,
-0.1999012, -1.056552, -1.978845, 0, 1, 0.509804, 1,
-0.1975229, 0.1451919, 0.02441506, 0, 1, 0.5137255, 1,
-0.1908533, 0.4377981, -0.7408596, 0, 1, 0.5215687, 1,
-0.1904714, 1.856129, 0.6823794, 0, 1, 0.5254902, 1,
-0.1886432, -1.083739, -4.762913, 0, 1, 0.5333334, 1,
-0.1878238, 1.004956, -0.329006, 0, 1, 0.5372549, 1,
-0.1862733, 0.2624004, -0.9514763, 0, 1, 0.5450981, 1,
-0.1826234, 0.8645175, -0.2446388, 0, 1, 0.5490196, 1,
-0.1802333, 0.1061518, -0.3550784, 0, 1, 0.5568628, 1,
-0.1786959, 0.3525628, -0.1428929, 0, 1, 0.5607843, 1,
-0.161414, -1.084878, -3.668667, 0, 1, 0.5686275, 1,
-0.1580069, 2.001069, -0.3666294, 0, 1, 0.572549, 1,
-0.1556096, -0.1018718, -3.112527, 0, 1, 0.5803922, 1,
-0.1534467, -0.4833967, -3.941378, 0, 1, 0.5843138, 1,
-0.1517631, -0.3658136, -2.685323, 0, 1, 0.5921569, 1,
-0.1517425, 1.874466, -2.917809, 0, 1, 0.5960785, 1,
-0.1506423, -0.8144948, -3.205284, 0, 1, 0.6039216, 1,
-0.1480975, 0.1536485, -0.6724564, 0, 1, 0.6117647, 1,
-0.143389, 0.1441711, 0.4979281, 0, 1, 0.6156863, 1,
-0.1404492, 0.8594976, -0.3129765, 0, 1, 0.6235294, 1,
-0.1385039, 0.9934417, 0.497348, 0, 1, 0.627451, 1,
-0.1343728, -0.2861632, -2.478424, 0, 1, 0.6352941, 1,
-0.1327571, 1.117667, 0.4603807, 0, 1, 0.6392157, 1,
-0.1312037, 2.177895, 0.3339949, 0, 1, 0.6470588, 1,
-0.1298931, -0.06864514, -2.149673, 0, 1, 0.6509804, 1,
-0.1225415, 1.322205, -0.7983286, 0, 1, 0.6588235, 1,
-0.1220118, -0.5695929, -2.303286, 0, 1, 0.6627451, 1,
-0.1211793, -0.1597458, -2.462944, 0, 1, 0.6705883, 1,
-0.1181745, 1.645391, -0.3049388, 0, 1, 0.6745098, 1,
-0.116591, 2.638159, 0.2581076, 0, 1, 0.682353, 1,
-0.1142376, 0.7954649, -0.7252639, 0, 1, 0.6862745, 1,
-0.1135601, 1.043154, -1.771417, 0, 1, 0.6941177, 1,
-0.1114186, -1.614323, -4.647213, 0, 1, 0.7019608, 1,
-0.1088602, -1.101322, -4.745905, 0, 1, 0.7058824, 1,
-0.106668, -2.127742, -2.791179, 0, 1, 0.7137255, 1,
-0.09793063, -0.003086368, -2.131006, 0, 1, 0.7176471, 1,
-0.09716119, 0.6713213, -1.051157, 0, 1, 0.7254902, 1,
-0.09451022, 1.115274, -0.5033872, 0, 1, 0.7294118, 1,
-0.09410936, -1.268717, -3.072133, 0, 1, 0.7372549, 1,
-0.08723947, 0.550186, -0.1461246, 0, 1, 0.7411765, 1,
-0.08718129, 2.551316, 1.005665, 0, 1, 0.7490196, 1,
-0.08016536, -0.9714138, -4.860703, 0, 1, 0.7529412, 1,
-0.07849765, 1.672906, -0.157282, 0, 1, 0.7607843, 1,
-0.07328365, 2.010084, 1.712137, 0, 1, 0.7647059, 1,
-0.07047092, -0.6344886, -2.02219, 0, 1, 0.772549, 1,
-0.06991798, -0.6723937, -3.954243, 0, 1, 0.7764706, 1,
-0.06855914, -0.1692328, -3.799223, 0, 1, 0.7843137, 1,
-0.06682824, -0.6157002, -2.23712, 0, 1, 0.7882353, 1,
-0.06613237, -0.2055171, -3.666175, 0, 1, 0.7960784, 1,
-0.06134259, -1.687723, -2.449857, 0, 1, 0.8039216, 1,
-0.05986263, 0.5762619, -1.454412, 0, 1, 0.8078431, 1,
-0.05532297, -0.4884062, -1.842956, 0, 1, 0.8156863, 1,
-0.054849, -0.3428999, -4.09339, 0, 1, 0.8196079, 1,
-0.05310356, 0.07689388, -0.185281, 0, 1, 0.827451, 1,
-0.04871907, 0.2345491, -2.205328, 0, 1, 0.8313726, 1,
-0.04496114, -1.433832, -2.5995, 0, 1, 0.8392157, 1,
-0.0406427, -0.08396673, -1.942612, 0, 1, 0.8431373, 1,
-0.03666279, -0.8891556, -2.467729, 0, 1, 0.8509804, 1,
-0.0334349, -0.2452875, -1.760235, 0, 1, 0.854902, 1,
-0.03247403, 0.8287488, -0.8116246, 0, 1, 0.8627451, 1,
-0.03244734, -1.005379, -3.62779, 0, 1, 0.8666667, 1,
-0.03046168, -1.381469, -1.033271, 0, 1, 0.8745098, 1,
-0.02940037, -1.085977, -3.252385, 0, 1, 0.8784314, 1,
-0.02601187, 1.542269, 0.2625515, 0, 1, 0.8862745, 1,
-0.02230642, 0.3207541, -0.08465774, 0, 1, 0.8901961, 1,
-0.02102793, -1.185521, -1.434018, 0, 1, 0.8980392, 1,
-0.02030725, -0.9092283, -4.499578, 0, 1, 0.9058824, 1,
-0.01883841, -0.3770904, -4.505234, 0, 1, 0.9098039, 1,
-0.01592173, 0.2351213, -1.874368, 0, 1, 0.9176471, 1,
-0.007707794, -0.4889953, -2.231957, 0, 1, 0.9215686, 1,
-0.003764762, 1.015051, 0.1577236, 0, 1, 0.9294118, 1,
-0.003490444, -0.07137366, -3.06935, 0, 1, 0.9333333, 1,
0.007660049, -0.312815, 3.38051, 0, 1, 0.9411765, 1,
0.01249981, 2.103143, 0.9310267, 0, 1, 0.945098, 1,
0.01446539, -0.1401774, 3.397523, 0, 1, 0.9529412, 1,
0.01626706, 0.07712314, 1.204344, 0, 1, 0.9568627, 1,
0.02321835, 0.1836982, 0.7109463, 0, 1, 0.9647059, 1,
0.02441637, 0.2321798, 2.108394, 0, 1, 0.9686275, 1,
0.02537727, 0.4381913, 1.101581, 0, 1, 0.9764706, 1,
0.03136617, -0.1964826, 4.060483, 0, 1, 0.9803922, 1,
0.03410553, -0.9189068, 4.085485, 0, 1, 0.9882353, 1,
0.03523353, -1.256499, 3.539511, 0, 1, 0.9921569, 1,
0.0410131, 1.197075, -0.286847, 0, 1, 1, 1,
0.04325635, -0.8973638, 1.586015, 0, 0.9921569, 1, 1,
0.04334094, 0.5575981, 0.8361495, 0, 0.9882353, 1, 1,
0.05245908, 1.304987, -0.738225, 0, 0.9803922, 1, 1,
0.06008159, 0.7015262, 0.6349633, 0, 0.9764706, 1, 1,
0.06097318, -0.3654866, 3.270628, 0, 0.9686275, 1, 1,
0.0616431, 0.2345812, -0.4701088, 0, 0.9647059, 1, 1,
0.06372821, -1.227928, 2.620185, 0, 0.9568627, 1, 1,
0.06767167, -0.06297205, 1.559554, 0, 0.9529412, 1, 1,
0.06986013, -1.172109, 3.430243, 0, 0.945098, 1, 1,
0.07166555, -1.050406, 2.654691, 0, 0.9411765, 1, 1,
0.07696802, -1.187883, 3.385311, 0, 0.9333333, 1, 1,
0.07723992, 1.20542, 0.04213272, 0, 0.9294118, 1, 1,
0.08207475, -0.8318626, 3.451874, 0, 0.9215686, 1, 1,
0.09368095, 0.4137956, -1.058692, 0, 0.9176471, 1, 1,
0.09452912, -0.2704034, 3.59053, 0, 0.9098039, 1, 1,
0.09638637, 0.8278279, 2.132807, 0, 0.9058824, 1, 1,
0.0984984, 0.1972578, 2.599638, 0, 0.8980392, 1, 1,
0.09939737, 1.070387, -1.578653, 0, 0.8901961, 1, 1,
0.1021689, -0.4488307, 3.950371, 0, 0.8862745, 1, 1,
0.1035324, 0.1742299, 0.122532, 0, 0.8784314, 1, 1,
0.1041711, 3.011519, 0.3289495, 0, 0.8745098, 1, 1,
0.1044506, -0.4379569, 4.369415, 0, 0.8666667, 1, 1,
0.1160526, 1.109275, 1.178993, 0, 0.8627451, 1, 1,
0.1162756, -1.533944, 2.123416, 0, 0.854902, 1, 1,
0.1207787, 0.6712847, 0.7856312, 0, 0.8509804, 1, 1,
0.1210765, -1.099515, 4.403446, 0, 0.8431373, 1, 1,
0.12206, -0.07298952, 3.665436, 0, 0.8392157, 1, 1,
0.1239183, -0.9208055, 3.643963, 0, 0.8313726, 1, 1,
0.1241361, -0.7116128, 3.244296, 0, 0.827451, 1, 1,
0.1325496, 0.926001, -0.7632303, 0, 0.8196079, 1, 1,
0.1426314, 0.06716266, 1.576818, 0, 0.8156863, 1, 1,
0.1433996, -0.7542803, 2.521379, 0, 0.8078431, 1, 1,
0.1467647, 1.690651, 1.170866, 0, 0.8039216, 1, 1,
0.1492108, -2.439015, 4.947584, 0, 0.7960784, 1, 1,
0.150461, -0.08123861, 1.830796, 0, 0.7882353, 1, 1,
0.1517898, 0.1893354, 0.1884684, 0, 0.7843137, 1, 1,
0.1550495, 2.318139, 0.1685838, 0, 0.7764706, 1, 1,
0.1556475, -0.8621978, 3.623523, 0, 0.772549, 1, 1,
0.159354, -2.387668, 3.052397, 0, 0.7647059, 1, 1,
0.1602952, -0.4323571, 1.683791, 0, 0.7607843, 1, 1,
0.1607256, -1.109046, 4.388113, 0, 0.7529412, 1, 1,
0.1624894, 0.9182137, 1.147871, 0, 0.7490196, 1, 1,
0.1643567, -1.660875, 3.359917, 0, 0.7411765, 1, 1,
0.1662204, -0.2490784, 1.933997, 0, 0.7372549, 1, 1,
0.1668684, 0.2248282, 1.55725, 0, 0.7294118, 1, 1,
0.1678117, -0.7376493, 2.752232, 0, 0.7254902, 1, 1,
0.1682941, 0.5529174, 0.04493582, 0, 0.7176471, 1, 1,
0.1690915, 0.6423623, -0.6294255, 0, 0.7137255, 1, 1,
0.1751529, 1.034456, 0.5904787, 0, 0.7058824, 1, 1,
0.17626, -2.698838, 3.139421, 0, 0.6980392, 1, 1,
0.1791482, 2.488019, -0.799017, 0, 0.6941177, 1, 1,
0.1799658, -0.3534849, 2.548804, 0, 0.6862745, 1, 1,
0.1850771, 1.153532, -0.2179037, 0, 0.682353, 1, 1,
0.1851465, -1.049863, 2.917766, 0, 0.6745098, 1, 1,
0.1872112, 1.317694, 1.191237, 0, 0.6705883, 1, 1,
0.1895087, 0.7435223, -0.7566416, 0, 0.6627451, 1, 1,
0.189822, -0.07070686, 2.644892, 0, 0.6588235, 1, 1,
0.1900835, -0.4767223, 2.882994, 0, 0.6509804, 1, 1,
0.1904869, -0.06731852, 2.804711, 0, 0.6470588, 1, 1,
0.1956319, 1.133215, -1.054894, 0, 0.6392157, 1, 1,
0.2060811, -0.6226889, 1.551223, 0, 0.6352941, 1, 1,
0.2065098, -0.3442353, 2.944498, 0, 0.627451, 1, 1,
0.2070153, 0.7656361, -0.9095672, 0, 0.6235294, 1, 1,
0.2087468, -0.08425204, 1.541313, 0, 0.6156863, 1, 1,
0.2089287, 0.8877888, 0.9288315, 0, 0.6117647, 1, 1,
0.2105002, 0.3734478, 0.2937776, 0, 0.6039216, 1, 1,
0.211766, -1.074911, 2.462287, 0, 0.5960785, 1, 1,
0.2133433, -0.2689072, 1.639352, 0, 0.5921569, 1, 1,
0.2172501, 1.633685, -0.7089514, 0, 0.5843138, 1, 1,
0.222134, 1.198967, 2.027324, 0, 0.5803922, 1, 1,
0.224338, 1.508687, 2.277379, 0, 0.572549, 1, 1,
0.2254542, -0.5290112, 1.705597, 0, 0.5686275, 1, 1,
0.2277591, 0.03711075, 1.606624, 0, 0.5607843, 1, 1,
0.2284379, -0.306545, 3.466593, 0, 0.5568628, 1, 1,
0.2292646, 1.294235, 2.138396, 0, 0.5490196, 1, 1,
0.2306289, -1.953531, 2.691679, 0, 0.5450981, 1, 1,
0.2339153, 0.1603416, 1.035639, 0, 0.5372549, 1, 1,
0.2369847, 0.9571441, 0.587715, 0, 0.5333334, 1, 1,
0.2385229, -0.6511388, 2.729895, 0, 0.5254902, 1, 1,
0.2396412, -1.102705, 2.252776, 0, 0.5215687, 1, 1,
0.2403222, -0.4964389, 2.767777, 0, 0.5137255, 1, 1,
0.241553, 1.950371, 2.335597, 0, 0.509804, 1, 1,
0.2450952, -0.9364082, 3.445253, 0, 0.5019608, 1, 1,
0.252093, 1.432267, 0.6985041, 0, 0.4941176, 1, 1,
0.2532049, -0.8495505, 1.664121, 0, 0.4901961, 1, 1,
0.2564808, 0.2210026, 1.84565, 0, 0.4823529, 1, 1,
0.2581873, 1.116408, 0.5887548, 0, 0.4784314, 1, 1,
0.2627585, -0.3644378, 2.397871, 0, 0.4705882, 1, 1,
0.264061, -0.0925488, 0.4457798, 0, 0.4666667, 1, 1,
0.2642151, 1.678906, 0.8497386, 0, 0.4588235, 1, 1,
0.2678939, -0.5444165, 2.43546, 0, 0.454902, 1, 1,
0.2733575, -0.8108636, 3.435046, 0, 0.4470588, 1, 1,
0.2744502, -0.7607219, 2.361373, 0, 0.4431373, 1, 1,
0.2766196, 0.5314565, -1.988179, 0, 0.4352941, 1, 1,
0.2857706, -0.2350929, 3.048632, 0, 0.4313726, 1, 1,
0.2924833, 0.2480165, 2.771622, 0, 0.4235294, 1, 1,
0.2927774, 0.6067879, -0.0493261, 0, 0.4196078, 1, 1,
0.298498, 0.3805878, 1.038182, 0, 0.4117647, 1, 1,
0.3005894, -1.468868, 2.962322, 0, 0.4078431, 1, 1,
0.3025569, 0.6273558, 1.238679, 0, 0.4, 1, 1,
0.3044638, 0.2706294, 0.7746206, 0, 0.3921569, 1, 1,
0.315587, 0.1901709, 0.3912939, 0, 0.3882353, 1, 1,
0.3178967, 0.5384146, 0.7164283, 0, 0.3803922, 1, 1,
0.3187596, -0.1892648, 2.585696, 0, 0.3764706, 1, 1,
0.322933, 0.8293893, -0.1546057, 0, 0.3686275, 1, 1,
0.3244814, 0.152115, 1.152414, 0, 0.3647059, 1, 1,
0.3267764, -0.8326757, 3.032814, 0, 0.3568628, 1, 1,
0.3271655, 0.8278496, 1.011784, 0, 0.3529412, 1, 1,
0.3302247, 0.394705, 1.696993, 0, 0.345098, 1, 1,
0.337726, 0.9679552, 2.255021, 0, 0.3411765, 1, 1,
0.3379719, 0.3753301, 1.48822, 0, 0.3333333, 1, 1,
0.3394201, -0.7990355, 2.062091, 0, 0.3294118, 1, 1,
0.340304, -0.7781395, 1.293909, 0, 0.3215686, 1, 1,
0.3407769, 0.5702196, 0.8541172, 0, 0.3176471, 1, 1,
0.3444723, 1.059305, 0.1820299, 0, 0.3098039, 1, 1,
0.3455774, 1.175118, 1.07343, 0, 0.3058824, 1, 1,
0.3529303, -0.9747664, 2.661163, 0, 0.2980392, 1, 1,
0.356171, 0.9636075, -0.1794295, 0, 0.2901961, 1, 1,
0.3602431, 1.870355, 0.3480234, 0, 0.2862745, 1, 1,
0.3611374, 1.095458, 0.6009414, 0, 0.2784314, 1, 1,
0.363703, 0.03585231, 0.01030737, 0, 0.2745098, 1, 1,
0.3690907, 0.6328343, 0.7823567, 0, 0.2666667, 1, 1,
0.3699066, -0.7803914, 1.548369, 0, 0.2627451, 1, 1,
0.3706867, 1.203976, 2.523886, 0, 0.254902, 1, 1,
0.370765, 0.1913412, 2.245454, 0, 0.2509804, 1, 1,
0.3723392, -1.182735, 2.741032, 0, 0.2431373, 1, 1,
0.3725431, 0.5814038, 0.90038, 0, 0.2392157, 1, 1,
0.3727342, 0.06595316, 1.93656, 0, 0.2313726, 1, 1,
0.3733886, -1.072706, 2.746427, 0, 0.227451, 1, 1,
0.3739262, 0.5455651, 0.4565665, 0, 0.2196078, 1, 1,
0.3830244, 0.2613944, 1.106636, 0, 0.2156863, 1, 1,
0.3835379, -0.7809232, 3.15282, 0, 0.2078431, 1, 1,
0.3922458, -0.6668254, 3.556329, 0, 0.2039216, 1, 1,
0.3953753, -0.1805384, 4.258203, 0, 0.1960784, 1, 1,
0.3969128, 0.4981582, 1.205731, 0, 0.1882353, 1, 1,
0.4026493, -0.2547572, 0.9666681, 0, 0.1843137, 1, 1,
0.4177781, 0.05932545, 1.841857, 0, 0.1764706, 1, 1,
0.4183036, -0.4792422, 1.816841, 0, 0.172549, 1, 1,
0.4242258, -2.109069, 4.120748, 0, 0.1647059, 1, 1,
0.4295623, -1.01026, 4.631157, 0, 0.1607843, 1, 1,
0.4299916, 1.281629, -0.7948504, 0, 0.1529412, 1, 1,
0.4374871, 0.7270014, -0.9991145, 0, 0.1490196, 1, 1,
0.443583, 0.03372819, 1.425243, 0, 0.1411765, 1, 1,
0.4445441, 1.368528, -0.1604286, 0, 0.1372549, 1, 1,
0.4470467, 0.5035757, 1.244878, 0, 0.1294118, 1, 1,
0.4507058, -1.477505, 1.882487, 0, 0.1254902, 1, 1,
0.4512421, -0.3532713, 2.24099, 0, 0.1176471, 1, 1,
0.452929, 0.31555, 1.122746, 0, 0.1137255, 1, 1,
0.4587972, -1.15737, 4.664021, 0, 0.1058824, 1, 1,
0.4600015, 1.107702, 1.079182, 0, 0.09803922, 1, 1,
0.4604195, 0.04960846, 1.451915, 0, 0.09411765, 1, 1,
0.4628514, -0.7382535, 2.231311, 0, 0.08627451, 1, 1,
0.4648534, -0.2862083, 1.072096, 0, 0.08235294, 1, 1,
0.4682599, -0.263021, 2.183158, 0, 0.07450981, 1, 1,
0.47242, -0.441142, 1.75966, 0, 0.07058824, 1, 1,
0.4727657, -2.444349, 4.102718, 0, 0.0627451, 1, 1,
0.4729544, -0.4994633, 2.903122, 0, 0.05882353, 1, 1,
0.4745073, -0.1595397, 1.353516, 0, 0.05098039, 1, 1,
0.4747697, 0.6885899, -0.3183536, 0, 0.04705882, 1, 1,
0.4866756, 0.1998778, 0.2197324, 0, 0.03921569, 1, 1,
0.4917137, 0.5929952, 1.656712, 0, 0.03529412, 1, 1,
0.4957652, -0.6229429, 2.779611, 0, 0.02745098, 1, 1,
0.5022915, 0.7371472, -0.6009289, 0, 0.02352941, 1, 1,
0.5086992, -1.493863, 2.57673, 0, 0.01568628, 1, 1,
0.5104256, 0.1559201, 1.089079, 0, 0.01176471, 1, 1,
0.5132737, -0.3678871, 1.573895, 0, 0.003921569, 1, 1,
0.5157653, -2.207729, 1.493768, 0.003921569, 0, 1, 1,
0.5160212, 0.1681227, 0.8877067, 0.007843138, 0, 1, 1,
0.5225484, 0.1667546, 2.333225, 0.01568628, 0, 1, 1,
0.5271263, 1.197745, -0.1548258, 0.01960784, 0, 1, 1,
0.5275335, -0.09595485, 1.119122, 0.02745098, 0, 1, 1,
0.5280458, -1.052083, 2.476804, 0.03137255, 0, 1, 1,
0.5302852, 0.09163978, 1.367003, 0.03921569, 0, 1, 1,
0.5325044, 0.7297777, 0.7048716, 0.04313726, 0, 1, 1,
0.5341161, -0.4617977, 2.421174, 0.05098039, 0, 1, 1,
0.5372451, -0.09205401, 1.863755, 0.05490196, 0, 1, 1,
0.5439117, -1.064906, 0.8874402, 0.0627451, 0, 1, 1,
0.5507203, 1.579615, 1.196567, 0.06666667, 0, 1, 1,
0.5548041, -0.9645091, 3.971295, 0.07450981, 0, 1, 1,
0.5570941, 0.09504397, 1.334623, 0.07843138, 0, 1, 1,
0.5572327, 1.223761, -1.279727, 0.08627451, 0, 1, 1,
0.5596104, -0.5096515, 2.03104, 0.09019608, 0, 1, 1,
0.5626674, 1.419619, 0.6501684, 0.09803922, 0, 1, 1,
0.5667375, -1.147547, 1.76463, 0.1058824, 0, 1, 1,
0.5717844, 0.9484577, 1.11412, 0.1098039, 0, 1, 1,
0.5746001, 0.9441615, 0.2265745, 0.1176471, 0, 1, 1,
0.5764129, 1.154929, 0.3812703, 0.1215686, 0, 1, 1,
0.5781385, 0.1834753, 1.135558, 0.1294118, 0, 1, 1,
0.5792844, 0.6066034, 0.0537534, 0.1333333, 0, 1, 1,
0.5830821, -0.275815, 0.7347353, 0.1411765, 0, 1, 1,
0.585171, 0.2092374, 2.12624, 0.145098, 0, 1, 1,
0.5893176, 0.8561947, 1.61213, 0.1529412, 0, 1, 1,
0.5896842, 0.1254771, 0.5785707, 0.1568628, 0, 1, 1,
0.5938981, 1.177696, 1.297979, 0.1647059, 0, 1, 1,
0.5958688, -0.1478495, 1.567335, 0.1686275, 0, 1, 1,
0.6010585, 0.01855099, 1.900844, 0.1764706, 0, 1, 1,
0.6056792, -0.2045205, 1.865649, 0.1803922, 0, 1, 1,
0.6056867, -1.564957, 3.294634, 0.1882353, 0, 1, 1,
0.6080175, -0.4993182, 1.763698, 0.1921569, 0, 1, 1,
0.6092048, 0.3498581, -0.8828858, 0.2, 0, 1, 1,
0.6104378, -2.457617, 3.127768, 0.2078431, 0, 1, 1,
0.6115418, -0.02309534, 2.750448, 0.2117647, 0, 1, 1,
0.6157634, -0.9172261, 2.820499, 0.2196078, 0, 1, 1,
0.6288463, 1.22757, 1.103328, 0.2235294, 0, 1, 1,
0.6303539, -1.059164, 3.672665, 0.2313726, 0, 1, 1,
0.6329167, -1.53599, 4.578295, 0.2352941, 0, 1, 1,
0.6341497, 1.490058, 1.333787, 0.2431373, 0, 1, 1,
0.6370482, -1.085613, 2.521383, 0.2470588, 0, 1, 1,
0.6391463, -0.9914237, 0.8827811, 0.254902, 0, 1, 1,
0.6400457, 0.7543541, 0.6668167, 0.2588235, 0, 1, 1,
0.6403171, -0.8189492, 2.243057, 0.2666667, 0, 1, 1,
0.6420004, -0.6427187, 2.375626, 0.2705882, 0, 1, 1,
0.6463721, 0.6057834, 0.4694155, 0.2784314, 0, 1, 1,
0.6494455, 0.2887769, -0.3068811, 0.282353, 0, 1, 1,
0.6520829, 0.6450675, 2.043574, 0.2901961, 0, 1, 1,
0.6523788, -0.7279313, 0.8935444, 0.2941177, 0, 1, 1,
0.653524, -0.7367964, 1.290773, 0.3019608, 0, 1, 1,
0.6579236, 0.2238085, 2.567025, 0.3098039, 0, 1, 1,
0.6692957, -1.205744, 1.944679, 0.3137255, 0, 1, 1,
0.6707926, -0.2790969, 1.690218, 0.3215686, 0, 1, 1,
0.6735507, 0.1020344, -0.2220504, 0.3254902, 0, 1, 1,
0.6744931, -1.38754, 3.342423, 0.3333333, 0, 1, 1,
0.6756565, 0.9485191, 1.825657, 0.3372549, 0, 1, 1,
0.6761264, 0.4635704, 1.848151, 0.345098, 0, 1, 1,
0.6789315, 1.252473, 2.333463, 0.3490196, 0, 1, 1,
0.6791914, 0.7434617, 0.9165125, 0.3568628, 0, 1, 1,
0.683151, 1.6655, 1.118962, 0.3607843, 0, 1, 1,
0.6847315, -1.004436, 1.690802, 0.3686275, 0, 1, 1,
0.6866562, -1.44411, 3.380425, 0.372549, 0, 1, 1,
0.6876044, -0.04431217, 1.20222, 0.3803922, 0, 1, 1,
0.688797, 1.219005, 0.818169, 0.3843137, 0, 1, 1,
0.6901935, -0.09864188, 2.225644, 0.3921569, 0, 1, 1,
0.6933217, -0.402252, 2.056571, 0.3960784, 0, 1, 1,
0.6936384, 0.1986464, 3.125978, 0.4039216, 0, 1, 1,
0.6965478, -1.563108, 2.278971, 0.4117647, 0, 1, 1,
0.6973276, -0.2724839, 1.137343, 0.4156863, 0, 1, 1,
0.7011089, -0.4811703, 1.694215, 0.4235294, 0, 1, 1,
0.7060491, 0.4351083, 2.180089, 0.427451, 0, 1, 1,
0.707533, 1.277095, 1.515123, 0.4352941, 0, 1, 1,
0.7096819, -0.05076151, -0.332968, 0.4392157, 0, 1, 1,
0.7100613, -1.048555, 2.626386, 0.4470588, 0, 1, 1,
0.7115688, 0.4405004, 0.2540329, 0.4509804, 0, 1, 1,
0.7157506, -0.9986813, 0.4341918, 0.4588235, 0, 1, 1,
0.7162074, -1.411344, 4.097642, 0.4627451, 0, 1, 1,
0.7170654, 1.860098, 1.200546, 0.4705882, 0, 1, 1,
0.7202668, -1.509422, 1.444888, 0.4745098, 0, 1, 1,
0.7214037, -1.368949, 3.383438, 0.4823529, 0, 1, 1,
0.7231529, -0.8841791, 2.491601, 0.4862745, 0, 1, 1,
0.7286381, -0.1132829, 2.08674, 0.4941176, 0, 1, 1,
0.7310874, 0.4378996, 0.6151021, 0.5019608, 0, 1, 1,
0.7337024, -0.4206868, 4.098504, 0.5058824, 0, 1, 1,
0.7337815, 1.998936, 0.7204462, 0.5137255, 0, 1, 1,
0.7382323, 0.9642523, 1.492804, 0.5176471, 0, 1, 1,
0.7396194, -1.331274, 1.755997, 0.5254902, 0, 1, 1,
0.7415382, 1.806114, 0.8237692, 0.5294118, 0, 1, 1,
0.7422941, 0.6431156, 0.5078692, 0.5372549, 0, 1, 1,
0.7427023, -0.4070818, 3.697155, 0.5411765, 0, 1, 1,
0.7613898, -0.0462813, 1.637964, 0.5490196, 0, 1, 1,
0.7624317, 0.1045687, 1.286678, 0.5529412, 0, 1, 1,
0.7624552, 0.5431058, 0.4359209, 0.5607843, 0, 1, 1,
0.7700083, -0.1878192, 2.081104, 0.5647059, 0, 1, 1,
0.7713692, -1.23971, 5.273709, 0.572549, 0, 1, 1,
0.7720556, -0.2832738, 1.643625, 0.5764706, 0, 1, 1,
0.7721811, 0.7637144, 1.215202, 0.5843138, 0, 1, 1,
0.7786477, -0.7949014, 3.27037, 0.5882353, 0, 1, 1,
0.7788742, 0.1931748, 2.706586, 0.5960785, 0, 1, 1,
0.7823235, 1.531006, 0.5019574, 0.6039216, 0, 1, 1,
0.7831281, 0.2530661, 2.574848, 0.6078432, 0, 1, 1,
0.7858885, 0.6037965, 1.244187, 0.6156863, 0, 1, 1,
0.788372, 1.925372, 1.603985, 0.6196079, 0, 1, 1,
0.78855, 0.6711396, -0.3754713, 0.627451, 0, 1, 1,
0.7946862, 1.430772, 0.9440714, 0.6313726, 0, 1, 1,
0.7948436, 0.4458857, 1.179788, 0.6392157, 0, 1, 1,
0.7993738, 0.599666, 1.005484, 0.6431373, 0, 1, 1,
0.8209381, -0.7649572, -1.184473, 0.6509804, 0, 1, 1,
0.8233009, -1.370644, 2.636055, 0.654902, 0, 1, 1,
0.8283579, -0.3790603, 1.779448, 0.6627451, 0, 1, 1,
0.8330163, 0.7966601, 0.2094974, 0.6666667, 0, 1, 1,
0.8393211, -1.88434, 4.545553, 0.6745098, 0, 1, 1,
0.8399979, 1.261479, -0.8910695, 0.6784314, 0, 1, 1,
0.8471751, -1.203279, 1.691786, 0.6862745, 0, 1, 1,
0.8483185, 0.9441122, -0.01757378, 0.6901961, 0, 1, 1,
0.8487227, 1.449943, 1.06757, 0.6980392, 0, 1, 1,
0.8517498, 0.4326513, 0.6939759, 0.7058824, 0, 1, 1,
0.8540018, 0.395053, 2.661938, 0.7098039, 0, 1, 1,
0.8591511, 0.9058142, 0.8585114, 0.7176471, 0, 1, 1,
0.8697481, -0.7048, 2.866289, 0.7215686, 0, 1, 1,
0.8825842, -1.218825, 2.064355, 0.7294118, 0, 1, 1,
0.8852199, -0.01288184, -0.7091098, 0.7333333, 0, 1, 1,
0.8866601, -0.1153407, 3.683858, 0.7411765, 0, 1, 1,
0.8954647, 1.157153, 2.638814, 0.7450981, 0, 1, 1,
0.8975435, -0.1114859, 2.968617, 0.7529412, 0, 1, 1,
0.9034456, 0.6392215, -0.0612813, 0.7568628, 0, 1, 1,
0.9075478, -0.3252321, 1.295512, 0.7647059, 0, 1, 1,
0.9092181, -1.204614, 3.019894, 0.7686275, 0, 1, 1,
0.9109895, -0.08939905, 3.027128, 0.7764706, 0, 1, 1,
0.9146696, -0.4324895, 1.901344, 0.7803922, 0, 1, 1,
0.9155592, 1.131169, 1.218434, 0.7882353, 0, 1, 1,
0.9224674, -0.3364698, 3.757135, 0.7921569, 0, 1, 1,
0.9228503, -0.0103064, 2.798251, 0.8, 0, 1, 1,
0.927801, -0.9763694, 2.318263, 0.8078431, 0, 1, 1,
0.9284472, 0.8789239, 1.718672, 0.8117647, 0, 1, 1,
0.9312736, 1.071266, 1.528273, 0.8196079, 0, 1, 1,
0.9379094, -0.1625534, 1.231046, 0.8235294, 0, 1, 1,
0.9471402, 0.07334646, 2.469329, 0.8313726, 0, 1, 1,
0.952538, 0.3922388, 0.5442148, 0.8352941, 0, 1, 1,
0.9576054, 0.05290923, 3.268684, 0.8431373, 0, 1, 1,
0.959079, -1.415118, 1.956829, 0.8470588, 0, 1, 1,
0.9641428, 0.7701558, 0.8485635, 0.854902, 0, 1, 1,
0.9690093, 0.08921266, 2.986313, 0.8588235, 0, 1, 1,
0.9696395, -0.9416201, 2.976444, 0.8666667, 0, 1, 1,
0.9760258, -0.9492022, 2.893822, 0.8705882, 0, 1, 1,
0.9776212, 0.03925478, 1.45246, 0.8784314, 0, 1, 1,
0.9871718, -0.6238145, 0.6914747, 0.8823529, 0, 1, 1,
0.9913774, 0.2829372, 0.6408943, 0.8901961, 0, 1, 1,
0.9950606, 0.2919182, 2.425078, 0.8941177, 0, 1, 1,
0.9978103, 1.626288, 0.2116566, 0.9019608, 0, 1, 1,
1.005162, 1.166861, 3.118863, 0.9098039, 0, 1, 1,
1.005777, -0.06115083, 1.258277, 0.9137255, 0, 1, 1,
1.011049, 0.8462871, 1.898637, 0.9215686, 0, 1, 1,
1.011677, 1.784831, 1.692402, 0.9254902, 0, 1, 1,
1.015913, 0.7027606, 2.044626, 0.9333333, 0, 1, 1,
1.016143, -1.158446, 2.730244, 0.9372549, 0, 1, 1,
1.01727, 0.06157225, 2.13663, 0.945098, 0, 1, 1,
1.017274, -1.377366, 1.972743, 0.9490196, 0, 1, 1,
1.01789, 0.1068341, 0.1257754, 0.9568627, 0, 1, 1,
1.020676, -0.2373086, -0.9518853, 0.9607843, 0, 1, 1,
1.022974, 0.1294424, -0.5315818, 0.9686275, 0, 1, 1,
1.027016, 0.8204577, 1.264772, 0.972549, 0, 1, 1,
1.027073, 0.7377496, 2.641398, 0.9803922, 0, 1, 1,
1.032517, -1.473942, 2.678845, 0.9843137, 0, 1, 1,
1.033023, 1.104444, 0.9991795, 0.9921569, 0, 1, 1,
1.038931, -0.9159117, 3.702458, 0.9960784, 0, 1, 1,
1.042133, 0.0264345, 3.091568, 1, 0, 0.9960784, 1,
1.050097, -0.3674794, 0.4938301, 1, 0, 0.9882353, 1,
1.052003, -0.5935085, 1.444977, 1, 0, 0.9843137, 1,
1.052485, 0.3284606, 2.019544, 1, 0, 0.9764706, 1,
1.056902, -0.9568274, 2.188562, 1, 0, 0.972549, 1,
1.059315, 0.1062373, 1.775444, 1, 0, 0.9647059, 1,
1.065934, 0.133436, 1.365479, 1, 0, 0.9607843, 1,
1.066624, 0.3475371, 0.2349712, 1, 0, 0.9529412, 1,
1.072221, -1.489173, 1.567733, 1, 0, 0.9490196, 1,
1.083376, 1.060581, 0.2031247, 1, 0, 0.9411765, 1,
1.094755, -0.2386428, 3.592314, 1, 0, 0.9372549, 1,
1.107128, -0.1414765, 1.557128, 1, 0, 0.9294118, 1,
1.108669, 1.203392, 1.066579, 1, 0, 0.9254902, 1,
1.110719, -0.5477507, 2.2487, 1, 0, 0.9176471, 1,
1.120689, 1.214432, -0.2172258, 1, 0, 0.9137255, 1,
1.124875, 0.9481286, -0.6764252, 1, 0, 0.9058824, 1,
1.125209, 2.158833, 0.1736576, 1, 0, 0.9019608, 1,
1.133489, 0.07800613, 1.161037, 1, 0, 0.8941177, 1,
1.135708, 0.2805722, 0.9314562, 1, 0, 0.8862745, 1,
1.153064, 0.3408905, 1.814128, 1, 0, 0.8823529, 1,
1.155321, -0.267064, 2.000119, 1, 0, 0.8745098, 1,
1.158561, -0.06201106, 1.200123, 1, 0, 0.8705882, 1,
1.166209, 1.04653, 0.9326439, 1, 0, 0.8627451, 1,
1.172461, -0.06577586, 0.8670927, 1, 0, 0.8588235, 1,
1.17408, -0.4226818, 2.767534, 1, 0, 0.8509804, 1,
1.176232, -1.00651, 0.5477388, 1, 0, 0.8470588, 1,
1.17712, 0.7027227, 2.079994, 1, 0, 0.8392157, 1,
1.17733, 1.072187, 3.182164, 1, 0, 0.8352941, 1,
1.189611, 0.3115321, 1.375149, 1, 0, 0.827451, 1,
1.191172, -0.7232754, 3.320386, 1, 0, 0.8235294, 1,
1.191528, -0.9190003, 2.861074, 1, 0, 0.8156863, 1,
1.200846, 0.5478128, 1.386018, 1, 0, 0.8117647, 1,
1.207561, 1.151299, -0.52176, 1, 0, 0.8039216, 1,
1.209566, 0.7259307, 1.533794, 1, 0, 0.7960784, 1,
1.212313, 0.3420684, 2.917269, 1, 0, 0.7921569, 1,
1.214734, -0.6543666, 1.251236, 1, 0, 0.7843137, 1,
1.217669, 1.09113, 1.494726, 1, 0, 0.7803922, 1,
1.220263, -0.7886907, 2.054065, 1, 0, 0.772549, 1,
1.230335, 1.24329, 1.246714, 1, 0, 0.7686275, 1,
1.243346, 1.035131, 0.6047129, 1, 0, 0.7607843, 1,
1.251686, -0.5458726, 1.585188, 1, 0, 0.7568628, 1,
1.251904, -0.7028867, 1.658856, 1, 0, 0.7490196, 1,
1.269275, -0.6443796, 2.583782, 1, 0, 0.7450981, 1,
1.28485, 1.14203, 0.8576161, 1, 0, 0.7372549, 1,
1.296605, 1.104441, 2.228472, 1, 0, 0.7333333, 1,
1.297536, 0.7774987, 1.461704, 1, 0, 0.7254902, 1,
1.299827, 0.8383486, 0.4622941, 1, 0, 0.7215686, 1,
1.305099, -3.265109, 2.94862, 1, 0, 0.7137255, 1,
1.306018, -1.342252, 1.369658, 1, 0, 0.7098039, 1,
1.308618, -1.285183, 1.12854, 1, 0, 0.7019608, 1,
1.320071, 0.09368415, 0.6757791, 1, 0, 0.6941177, 1,
1.320222, -0.4836319, 1.889856, 1, 0, 0.6901961, 1,
1.320904, -0.5551573, 1.189011, 1, 0, 0.682353, 1,
1.323218, 1.256765, -0.8656685, 1, 0, 0.6784314, 1,
1.323413, 1.475241, 1.284523, 1, 0, 0.6705883, 1,
1.325745, -0.4049566, 1.600685, 1, 0, 0.6666667, 1,
1.340374, 1.705275, -0.1977785, 1, 0, 0.6588235, 1,
1.345125, 0.5140874, 0.1333483, 1, 0, 0.654902, 1,
1.35398, 0.04875093, -0.7500241, 1, 0, 0.6470588, 1,
1.35598, -0.8851989, 2.62811, 1, 0, 0.6431373, 1,
1.360488, -1.460375, 1.313623, 1, 0, 0.6352941, 1,
1.36173, -0.5310531, 1.159107, 1, 0, 0.6313726, 1,
1.362106, -0.1397402, 0.4557084, 1, 0, 0.6235294, 1,
1.363177, 0.2628436, 1.067264, 1, 0, 0.6196079, 1,
1.388603, -0.6409413, 1.93419, 1, 0, 0.6117647, 1,
1.395599, 0.9647368, 0.1293082, 1, 0, 0.6078432, 1,
1.398021, 0.2525806, -1.166196, 1, 0, 0.6, 1,
1.408608, -0.808985, 0.9209127, 1, 0, 0.5921569, 1,
1.410967, -0.09227034, 0.7320011, 1, 0, 0.5882353, 1,
1.412817, -0.5222287, 2.387552, 1, 0, 0.5803922, 1,
1.414468, -1.67481, 3.36964, 1, 0, 0.5764706, 1,
1.415299, 0.229945, 2.460215, 1, 0, 0.5686275, 1,
1.422181, -1.537922, 1.186897, 1, 0, 0.5647059, 1,
1.425062, 1.732693, 2.040342, 1, 0, 0.5568628, 1,
1.432898, 1.83865, 1.957289, 1, 0, 0.5529412, 1,
1.447963, -0.1410815, 1.524887, 1, 0, 0.5450981, 1,
1.459723, -0.117403, 1.619208, 1, 0, 0.5411765, 1,
1.475427, -0.5809163, 1.503354, 1, 0, 0.5333334, 1,
1.476998, -0.2955122, 1.502518, 1, 0, 0.5294118, 1,
1.479525, -2.423281, 1.787939, 1, 0, 0.5215687, 1,
1.484438, 1.342706, 1.950439, 1, 0, 0.5176471, 1,
1.486818, -1.163258, 2.688678, 1, 0, 0.509804, 1,
1.490309, -0.4912885, 1.872333, 1, 0, 0.5058824, 1,
1.497076, 1.027889, 1.91916, 1, 0, 0.4980392, 1,
1.502191, -0.04218076, 2.585924, 1, 0, 0.4901961, 1,
1.508355, 0.7165359, -0.9117204, 1, 0, 0.4862745, 1,
1.508938, -2.060441, 2.56342, 1, 0, 0.4784314, 1,
1.51129, 1.129865, -0.01621336, 1, 0, 0.4745098, 1,
1.52419, -0.4271363, 1.132021, 1, 0, 0.4666667, 1,
1.527351, -0.8838382, 2.402579, 1, 0, 0.4627451, 1,
1.548913, -0.3089789, 1.070113, 1, 0, 0.454902, 1,
1.553031, 1.722682, 0.04801336, 1, 0, 0.4509804, 1,
1.55307, 1.612913, 0.07221119, 1, 0, 0.4431373, 1,
1.567066, 0.4756297, -1.79421, 1, 0, 0.4392157, 1,
1.58283, 0.2101021, -0.1078744, 1, 0, 0.4313726, 1,
1.584648, 1.127131, 2.813776, 1, 0, 0.427451, 1,
1.587928, 0.4788947, 2.214911, 1, 0, 0.4196078, 1,
1.589612, 0.1319681, 2.365741, 1, 0, 0.4156863, 1,
1.610667, 0.9491368, 2.155238, 1, 0, 0.4078431, 1,
1.615781, -0.5797332, 1.778387, 1, 0, 0.4039216, 1,
1.620778, 1.115518, 1.636565, 1, 0, 0.3960784, 1,
1.630102, 1.083009, 1.648748, 1, 0, 0.3882353, 1,
1.632962, -1.454086, 2.731539, 1, 0, 0.3843137, 1,
1.659879, -0.3423976, 1.865407, 1, 0, 0.3764706, 1,
1.662017, -1.334228, 2.371221, 1, 0, 0.372549, 1,
1.673969, -1.555736, 3.383709, 1, 0, 0.3647059, 1,
1.675539, 1.216004, 0.2374616, 1, 0, 0.3607843, 1,
1.676662, -1.366877, 0.9156162, 1, 0, 0.3529412, 1,
1.682353, -0.2658604, 1.007377, 1, 0, 0.3490196, 1,
1.703461, -1.918141, 3.705493, 1, 0, 0.3411765, 1,
1.718782, 0.5643677, -0.2958425, 1, 0, 0.3372549, 1,
1.726052, -0.7275919, 0.6646821, 1, 0, 0.3294118, 1,
1.740115, -0.225539, 2.299151, 1, 0, 0.3254902, 1,
1.742003, 0.8146257, 1.512397, 1, 0, 0.3176471, 1,
1.768787, -1.280574, 0.9198466, 1, 0, 0.3137255, 1,
1.771462, 1.183014, 0.9083298, 1, 0, 0.3058824, 1,
1.772346, 0.9201521, 0.8601382, 1, 0, 0.2980392, 1,
1.789832, -0.7224253, 0.2100083, 1, 0, 0.2941177, 1,
1.795121, -1.66183, 3.628891, 1, 0, 0.2862745, 1,
1.80678, -0.9152808, 1.803914, 1, 0, 0.282353, 1,
1.816427, -0.1838502, 2.760085, 1, 0, 0.2745098, 1,
1.819101, 0.3412924, 0.4426168, 1, 0, 0.2705882, 1,
1.834773, 0.5700806, 1.405824, 1, 0, 0.2627451, 1,
1.839063, 0.779507, 0.6563271, 1, 0, 0.2588235, 1,
1.851934, 1.9425, 1.256017, 1, 0, 0.2509804, 1,
1.864972, -0.1319499, 2.334317, 1, 0, 0.2470588, 1,
1.876137, -0.2648568, 2.433348, 1, 0, 0.2392157, 1,
1.889047, 1.84848, 1.593251, 1, 0, 0.2352941, 1,
1.89096, -0.455909, 0.6701148, 1, 0, 0.227451, 1,
1.893407, 0.4522684, 0.9348432, 1, 0, 0.2235294, 1,
1.893977, -1.325677, 3.403675, 1, 0, 0.2156863, 1,
1.904419, 1.168484, -0.6811818, 1, 0, 0.2117647, 1,
1.914904, 0.102663, 2.188679, 1, 0, 0.2039216, 1,
1.917531, -1.373716, 2.844229, 1, 0, 0.1960784, 1,
1.941147, 0.3576997, 1.488865, 1, 0, 0.1921569, 1,
1.970673, 0.3473272, 0.8863757, 1, 0, 0.1843137, 1,
2.023668, -0.8458794, 3.540968, 1, 0, 0.1803922, 1,
2.030658, -1.718048, 2.621519, 1, 0, 0.172549, 1,
2.032044, 0.1718532, 3.184707, 1, 0, 0.1686275, 1,
2.033726, -1.455107, 2.175447, 1, 0, 0.1607843, 1,
2.059387, 1.403317, 1.617414, 1, 0, 0.1568628, 1,
2.06583, -0.02805381, 1.659781, 1, 0, 0.1490196, 1,
2.083982, -0.1848718, 2.499332, 1, 0, 0.145098, 1,
2.112314, 0.7446298, 2.199339, 1, 0, 0.1372549, 1,
2.120103, 0.5761446, 1.556256, 1, 0, 0.1333333, 1,
2.137543, -1.299222, 0.9526832, 1, 0, 0.1254902, 1,
2.140512, 0.03130209, 1.486526, 1, 0, 0.1215686, 1,
2.168869, -0.544498, 2.602589, 1, 0, 0.1137255, 1,
2.175641, 0.2768005, 0.6079636, 1, 0, 0.1098039, 1,
2.212231, 0.7839494, 1.382541, 1, 0, 0.1019608, 1,
2.227089, -0.3787985, 0.200693, 1, 0, 0.09411765, 1,
2.295433, 0.3291081, 0.5452296, 1, 0, 0.09019608, 1,
2.31928, 0.411875, 3.888306, 1, 0, 0.08235294, 1,
2.354943, -0.008675523, 1.705379, 1, 0, 0.07843138, 1,
2.385624, 1.343465, 1.016943, 1, 0, 0.07058824, 1,
2.462614, 1.154422, 0.713491, 1, 0, 0.06666667, 1,
2.530187, 0.9281618, 2.427083, 1, 0, 0.05882353, 1,
2.606813, -1.541959, 1.626851, 1, 0, 0.05490196, 1,
2.607403, 1.34266, 2.417642, 1, 0, 0.04705882, 1,
2.614459, 0.6968354, 0.01817976, 1, 0, 0.04313726, 1,
2.807383, 0.6810702, 3.570649, 1, 0, 0.03529412, 1,
2.863292, 0.3933393, 2.53287, 1, 0, 0.03137255, 1,
3.164366, 1.084701, 0.6060171, 1, 0, 0.02352941, 1,
3.276307, 0.5735727, -1.03721, 1, 0, 0.01960784, 1,
3.565484, 2.329055, 1.847315, 1, 0, 0.01176471, 1,
3.569932, 0.3118106, 1.079623, 1, 0, 0.007843138, 1
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
0.3513633, -4.328998, -8.945957, 0, -0.5, 0.5, 0.5,
0.3513633, -4.328998, -8.945957, 1, -0.5, 0.5, 0.5,
0.3513633, -4.328998, -8.945957, 1, 1.5, 0.5, 0.5,
0.3513633, -4.328998, -8.945957, 0, 1.5, 0.5, 0.5
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
-3.958301, -0.1267949, -8.945957, 0, -0.5, 0.5, 0.5,
-3.958301, -0.1267949, -8.945957, 1, -0.5, 0.5, 0.5,
-3.958301, -0.1267949, -8.945957, 1, 1.5, 0.5, 0.5,
-3.958301, -0.1267949, -8.945957, 0, 1.5, 0.5, 0.5
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
-3.958301, -4.328998, -0.8056693, 0, -0.5, 0.5, 0.5,
-3.958301, -4.328998, -0.8056693, 1, -0.5, 0.5, 0.5,
-3.958301, -4.328998, -0.8056693, 1, 1.5, 0.5, 0.5,
-3.958301, -4.328998, -0.8056693, 0, 1.5, 0.5, 0.5
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
-2, -3.359258, -7.067429,
3, -3.359258, -7.067429,
-2, -3.359258, -7.067429,
-2, -3.520882, -7.380517,
-1, -3.359258, -7.067429,
-1, -3.520882, -7.380517,
0, -3.359258, -7.067429,
0, -3.520882, -7.380517,
1, -3.359258, -7.067429,
1, -3.520882, -7.380517,
2, -3.359258, -7.067429,
2, -3.520882, -7.380517,
3, -3.359258, -7.067429,
3, -3.520882, -7.380517
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
-2, -3.844128, -8.006693, 0, -0.5, 0.5, 0.5,
-2, -3.844128, -8.006693, 1, -0.5, 0.5, 0.5,
-2, -3.844128, -8.006693, 1, 1.5, 0.5, 0.5,
-2, -3.844128, -8.006693, 0, 1.5, 0.5, 0.5,
-1, -3.844128, -8.006693, 0, -0.5, 0.5, 0.5,
-1, -3.844128, -8.006693, 1, -0.5, 0.5, 0.5,
-1, -3.844128, -8.006693, 1, 1.5, 0.5, 0.5,
-1, -3.844128, -8.006693, 0, 1.5, 0.5, 0.5,
0, -3.844128, -8.006693, 0, -0.5, 0.5, 0.5,
0, -3.844128, -8.006693, 1, -0.5, 0.5, 0.5,
0, -3.844128, -8.006693, 1, 1.5, 0.5, 0.5,
0, -3.844128, -8.006693, 0, 1.5, 0.5, 0.5,
1, -3.844128, -8.006693, 0, -0.5, 0.5, 0.5,
1, -3.844128, -8.006693, 1, -0.5, 0.5, 0.5,
1, -3.844128, -8.006693, 1, 1.5, 0.5, 0.5,
1, -3.844128, -8.006693, 0, 1.5, 0.5, 0.5,
2, -3.844128, -8.006693, 0, -0.5, 0.5, 0.5,
2, -3.844128, -8.006693, 1, -0.5, 0.5, 0.5,
2, -3.844128, -8.006693, 1, 1.5, 0.5, 0.5,
2, -3.844128, -8.006693, 0, 1.5, 0.5, 0.5,
3, -3.844128, -8.006693, 0, -0.5, 0.5, 0.5,
3, -3.844128, -8.006693, 1, -0.5, 0.5, 0.5,
3, -3.844128, -8.006693, 1, 1.5, 0.5, 0.5,
3, -3.844128, -8.006693, 0, 1.5, 0.5, 0.5
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
-2.963763, -3, -7.067429,
-2.963763, 3, -7.067429,
-2.963763, -3, -7.067429,
-3.129519, -3, -7.380517,
-2.963763, -2, -7.067429,
-3.129519, -2, -7.380517,
-2.963763, -1, -7.067429,
-3.129519, -1, -7.380517,
-2.963763, 0, -7.067429,
-3.129519, 0, -7.380517,
-2.963763, 1, -7.067429,
-3.129519, 1, -7.380517,
-2.963763, 2, -7.067429,
-3.129519, 2, -7.380517,
-2.963763, 3, -7.067429,
-3.129519, 3, -7.380517
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
-3.461032, -3, -8.006693, 0, -0.5, 0.5, 0.5,
-3.461032, -3, -8.006693, 1, -0.5, 0.5, 0.5,
-3.461032, -3, -8.006693, 1, 1.5, 0.5, 0.5,
-3.461032, -3, -8.006693, 0, 1.5, 0.5, 0.5,
-3.461032, -2, -8.006693, 0, -0.5, 0.5, 0.5,
-3.461032, -2, -8.006693, 1, -0.5, 0.5, 0.5,
-3.461032, -2, -8.006693, 1, 1.5, 0.5, 0.5,
-3.461032, -2, -8.006693, 0, 1.5, 0.5, 0.5,
-3.461032, -1, -8.006693, 0, -0.5, 0.5, 0.5,
-3.461032, -1, -8.006693, 1, -0.5, 0.5, 0.5,
-3.461032, -1, -8.006693, 1, 1.5, 0.5, 0.5,
-3.461032, -1, -8.006693, 0, 1.5, 0.5, 0.5,
-3.461032, 0, -8.006693, 0, -0.5, 0.5, 0.5,
-3.461032, 0, -8.006693, 1, -0.5, 0.5, 0.5,
-3.461032, 0, -8.006693, 1, 1.5, 0.5, 0.5,
-3.461032, 0, -8.006693, 0, 1.5, 0.5, 0.5,
-3.461032, 1, -8.006693, 0, -0.5, 0.5, 0.5,
-3.461032, 1, -8.006693, 1, -0.5, 0.5, 0.5,
-3.461032, 1, -8.006693, 1, 1.5, 0.5, 0.5,
-3.461032, 1, -8.006693, 0, 1.5, 0.5, 0.5,
-3.461032, 2, -8.006693, 0, -0.5, 0.5, 0.5,
-3.461032, 2, -8.006693, 1, -0.5, 0.5, 0.5,
-3.461032, 2, -8.006693, 1, 1.5, 0.5, 0.5,
-3.461032, 2, -8.006693, 0, 1.5, 0.5, 0.5,
-3.461032, 3, -8.006693, 0, -0.5, 0.5, 0.5,
-3.461032, 3, -8.006693, 1, -0.5, 0.5, 0.5,
-3.461032, 3, -8.006693, 1, 1.5, 0.5, 0.5,
-3.461032, 3, -8.006693, 0, 1.5, 0.5, 0.5
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
-2.963763, -3.359258, -6,
-2.963763, -3.359258, 4,
-2.963763, -3.359258, -6,
-3.129519, -3.520882, -6,
-2.963763, -3.359258, -4,
-3.129519, -3.520882, -4,
-2.963763, -3.359258, -2,
-3.129519, -3.520882, -2,
-2.963763, -3.359258, 0,
-3.129519, -3.520882, 0,
-2.963763, -3.359258, 2,
-3.129519, -3.520882, 2,
-2.963763, -3.359258, 4,
-3.129519, -3.520882, 4
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
-3.461032, -3.844128, -6, 0, -0.5, 0.5, 0.5,
-3.461032, -3.844128, -6, 1, -0.5, 0.5, 0.5,
-3.461032, -3.844128, -6, 1, 1.5, 0.5, 0.5,
-3.461032, -3.844128, -6, 0, 1.5, 0.5, 0.5,
-3.461032, -3.844128, -4, 0, -0.5, 0.5, 0.5,
-3.461032, -3.844128, -4, 1, -0.5, 0.5, 0.5,
-3.461032, -3.844128, -4, 1, 1.5, 0.5, 0.5,
-3.461032, -3.844128, -4, 0, 1.5, 0.5, 0.5,
-3.461032, -3.844128, -2, 0, -0.5, 0.5, 0.5,
-3.461032, -3.844128, -2, 1, -0.5, 0.5, 0.5,
-3.461032, -3.844128, -2, 1, 1.5, 0.5, 0.5,
-3.461032, -3.844128, -2, 0, 1.5, 0.5, 0.5,
-3.461032, -3.844128, 0, 0, -0.5, 0.5, 0.5,
-3.461032, -3.844128, 0, 1, -0.5, 0.5, 0.5,
-3.461032, -3.844128, 0, 1, 1.5, 0.5, 0.5,
-3.461032, -3.844128, 0, 0, 1.5, 0.5, 0.5,
-3.461032, -3.844128, 2, 0, -0.5, 0.5, 0.5,
-3.461032, -3.844128, 2, 1, -0.5, 0.5, 0.5,
-3.461032, -3.844128, 2, 1, 1.5, 0.5, 0.5,
-3.461032, -3.844128, 2, 0, 1.5, 0.5, 0.5,
-3.461032, -3.844128, 4, 0, -0.5, 0.5, 0.5,
-3.461032, -3.844128, 4, 1, -0.5, 0.5, 0.5,
-3.461032, -3.844128, 4, 1, 1.5, 0.5, 0.5,
-3.461032, -3.844128, 4, 0, 1.5, 0.5, 0.5
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
-2.963763, -3.359258, -7.067429,
-2.963763, 3.105669, -7.067429,
-2.963763, -3.359258, 5.45609,
-2.963763, 3.105669, 5.45609,
-2.963763, -3.359258, -7.067429,
-2.963763, -3.359258, 5.45609,
-2.963763, 3.105669, -7.067429,
-2.963763, 3.105669, 5.45609,
-2.963763, -3.359258, -7.067429,
3.666489, -3.359258, -7.067429,
-2.963763, -3.359258, 5.45609,
3.666489, -3.359258, 5.45609,
-2.963763, 3.105669, -7.067429,
3.666489, 3.105669, -7.067429,
-2.963763, 3.105669, 5.45609,
3.666489, 3.105669, 5.45609,
3.666489, -3.359258, -7.067429,
3.666489, 3.105669, -7.067429,
3.666489, -3.359258, 5.45609,
3.666489, 3.105669, 5.45609,
3.666489, -3.359258, -7.067429,
3.666489, -3.359258, 5.45609,
3.666489, 3.105669, -7.067429,
3.666489, 3.105669, 5.45609
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
var radius = 8.316978;
var distance = 37.00317;
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
mvMatrix.translate( -0.3513633, 0.1267949, 0.8056693 );
mvMatrix.scale( 1.35628, 1.390964, 0.7180473 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.00317);
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
Glutarimide<-read.table("Glutarimide.xyz")
```

```
## Error in read.table("Glutarimide.xyz"): no lines available in input
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
-2.867206, 1.555876, -1.62817, 0, 0, 1, 1, 1,
-2.777679, -0.937182, -0.232205, 1, 0, 0, 1, 1,
-2.720376, 0.8209153, -1.305928, 1, 0, 0, 1, 1,
-2.705933, -1.24091, -2.750391, 1, 0, 0, 1, 1,
-2.616881, -0.7202716, -2.83235, 1, 0, 0, 1, 1,
-2.594697, 0.1823199, -1.077102, 1, 0, 0, 1, 1,
-2.512395, -0.9938357, -0.3415587, 0, 0, 0, 1, 1,
-2.468758, 0.6618341, -2.627426, 0, 0, 0, 1, 1,
-2.448187, -1.145008, -2.578444, 0, 0, 0, 1, 1,
-2.447323, -1.534565, -1.258339, 0, 0, 0, 1, 1,
-2.389984, 0.1976071, -1.395601, 0, 0, 0, 1, 1,
-2.332016, 0.3568113, -1.281821, 0, 0, 0, 1, 1,
-2.311004, -0.6932421, -3.161183, 0, 0, 0, 1, 1,
-2.299037, 1.189462, -0.272537, 1, 1, 1, 1, 1,
-2.267154, 0.7749675, -1.294518, 1, 1, 1, 1, 1,
-2.239091, -0.5785607, -2.646367, 1, 1, 1, 1, 1,
-2.208467, -1.854104, -1.698499, 1, 1, 1, 1, 1,
-2.205923, -0.2906718, -2.515297, 1, 1, 1, 1, 1,
-2.168063, 0.3813303, -1.433529, 1, 1, 1, 1, 1,
-2.137488, -1.014158, -2.805955, 1, 1, 1, 1, 1,
-2.112206, 1.329155, -1.711855, 1, 1, 1, 1, 1,
-2.074142, 0.206459, -2.975114, 1, 1, 1, 1, 1,
-2.068225, 1.040356, -1.514234, 1, 1, 1, 1, 1,
-2.063492, 0.1153599, -0.9000644, 1, 1, 1, 1, 1,
-2.042073, -0.3064579, -0.8445695, 1, 1, 1, 1, 1,
-2.024049, 0.7818961, -1.206263, 1, 1, 1, 1, 1,
-2.022797, -0.2754987, -1.137471, 1, 1, 1, 1, 1,
-2.012157, 0.4773428, -2.278098, 1, 1, 1, 1, 1,
-1.986271, -0.1766728, -0.6886535, 0, 0, 1, 1, 1,
-1.983604, 0.2399385, -0.2815532, 1, 0, 0, 1, 1,
-1.981056, -0.5625783, -2.941647, 1, 0, 0, 1, 1,
-1.967479, -0.2460642, -2.857395, 1, 0, 0, 1, 1,
-1.947947, 0.1302349, -0.6183183, 1, 0, 0, 1, 1,
-1.928048, 1.348574, 1.034636, 1, 0, 0, 1, 1,
-1.919253, 0.9492397, 0.2625186, 0, 0, 0, 1, 1,
-1.918842, -1.227637, -4.613115, 0, 0, 0, 1, 1,
-1.912475, 0.02181709, -1.649449, 0, 0, 0, 1, 1,
-1.889661, -1.359641, -2.185056, 0, 0, 0, 1, 1,
-1.880317, -0.6343623, -1.980033, 0, 0, 0, 1, 1,
-1.878885, -0.07094432, -2.798505, 0, 0, 0, 1, 1,
-1.826435, 0.1871931, -2.881098, 0, 0, 0, 1, 1,
-1.820352, -0.3607531, -2.813169, 1, 1, 1, 1, 1,
-1.806214, -0.7002535, -0.9156532, 1, 1, 1, 1, 1,
-1.78802, 0.5696964, -3.613411, 1, 1, 1, 1, 1,
-1.779231, 0.4757379, -2.463089, 1, 1, 1, 1, 1,
-1.773786, 0.6170622, 0.6013374, 1, 1, 1, 1, 1,
-1.756253, -0.8426872, -1.461052, 1, 1, 1, 1, 1,
-1.72973, -0.8353561, -3.425697, 1, 1, 1, 1, 1,
-1.72777, 1.776267, -2.298864, 1, 1, 1, 1, 1,
-1.723193, -2.457624, -2.260386, 1, 1, 1, 1, 1,
-1.65437, 1.245781, -0.1888301, 1, 1, 1, 1, 1,
-1.647243, -0.9696146, -3.459974, 1, 1, 1, 1, 1,
-1.646801, -0.6548027, -1.611292, 1, 1, 1, 1, 1,
-1.62115, -0.8084315, -2.728642, 1, 1, 1, 1, 1,
-1.614208, 0.3008547, -0.7587278, 1, 1, 1, 1, 1,
-1.592195, -0.4853653, -2.695525, 1, 1, 1, 1, 1,
-1.585741, 0.8120542, -2.014215, 0, 0, 1, 1, 1,
-1.585372, 0.548216, -0.157131, 1, 0, 0, 1, 1,
-1.585358, -0.2925081, -2.24717, 1, 0, 0, 1, 1,
-1.581509, -1.746205, -0.3283309, 1, 0, 0, 1, 1,
-1.58109, -0.1563448, -3.155222, 1, 0, 0, 1, 1,
-1.575966, -0.6912407, -2.249475, 1, 0, 0, 1, 1,
-1.568862, 0.2988444, -1.252931, 0, 0, 0, 1, 1,
-1.552046, 0.8915583, -0.6059964, 0, 0, 0, 1, 1,
-1.551648, -0.1329737, -2.385652, 0, 0, 0, 1, 1,
-1.548226, 0.09536733, -1.291127, 0, 0, 0, 1, 1,
-1.520615, 0.7763034, 0.1204601, 0, 0, 0, 1, 1,
-1.510774, 0.08011258, -3.13743, 0, 0, 0, 1, 1,
-1.491334, -0.4247028, -0.969685, 0, 0, 0, 1, 1,
-1.467048, -1.753199, -2.537867, 1, 1, 1, 1, 1,
-1.459546, -1.690796, -2.678776, 1, 1, 1, 1, 1,
-1.457142, -1.203242, -2.875519, 1, 1, 1, 1, 1,
-1.445979, -0.8549696, -2.267867, 1, 1, 1, 1, 1,
-1.442146, 0.2732883, -1.230939, 1, 1, 1, 1, 1,
-1.440477, -1.558954, -2.188652, 1, 1, 1, 1, 1,
-1.424029, 0.150736, -2.872637, 1, 1, 1, 1, 1,
-1.40933, 0.2855179, -1.520567, 1, 1, 1, 1, 1,
-1.40763, 0.2501187, -2.77549, 1, 1, 1, 1, 1,
-1.386879, 0.2590955, -3.519796, 1, 1, 1, 1, 1,
-1.383626, 1.705789, -2.036565, 1, 1, 1, 1, 1,
-1.3827, -0.2325308, -2.621585, 1, 1, 1, 1, 1,
-1.371181, -1.167813, -1.751371, 1, 1, 1, 1, 1,
-1.37081, 2.463037, -0.964716, 1, 1, 1, 1, 1,
-1.367388, 0.08141088, -0.605946, 1, 1, 1, 1, 1,
-1.359078, -2.345884, -3.281245, 0, 0, 1, 1, 1,
-1.356984, 0.2434834, -1.810326, 1, 0, 0, 1, 1,
-1.346952, -1.361055, -1.674185, 1, 0, 0, 1, 1,
-1.343405, 0.9053637, -1.147109, 1, 0, 0, 1, 1,
-1.335839, -1.044676, -0.2558393, 1, 0, 0, 1, 1,
-1.333286, -0.4345946, -1.080079, 1, 0, 0, 1, 1,
-1.330715, 1.222207, -1.32522, 0, 0, 0, 1, 1,
-1.325679, -0.4429576, -1.778812, 0, 0, 0, 1, 1,
-1.320307, -0.001399073, -1.240257, 0, 0, 0, 1, 1,
-1.319308, 0.8721848, -3.103718, 0, 0, 0, 1, 1,
-1.318694, -0.3785105, -2.052339, 0, 0, 0, 1, 1,
-1.31594, 0.9830607, 0.1859748, 0, 0, 0, 1, 1,
-1.315441, -1.621719, -1.06568, 0, 0, 0, 1, 1,
-1.300471, 1.133843, 0.2319754, 1, 1, 1, 1, 1,
-1.297762, 1.538945, -1.558378, 1, 1, 1, 1, 1,
-1.297608, 0.682757, 0.2998893, 1, 1, 1, 1, 1,
-1.289904, 1.481932, -0.4708784, 1, 1, 1, 1, 1,
-1.283296, 0.4733765, -1.28281, 1, 1, 1, 1, 1,
-1.277279, 1.723597, -0.02820865, 1, 1, 1, 1, 1,
-1.259436, 2.57204, -0.2903063, 1, 1, 1, 1, 1,
-1.254466, 0.3797055, -0.6088156, 1, 1, 1, 1, 1,
-1.251861, 0.5198302, -1.313176, 1, 1, 1, 1, 1,
-1.246277, 0.09220044, -1.199334, 1, 1, 1, 1, 1,
-1.238744, 0.1684003, 0.6528904, 1, 1, 1, 1, 1,
-1.220904, 1.679882, -1.731791, 1, 1, 1, 1, 1,
-1.220244, -0.7080099, -0.7043541, 1, 1, 1, 1, 1,
-1.215372, -1.59811, -2.843693, 1, 1, 1, 1, 1,
-1.213878, 1.060493, 0.5892729, 1, 1, 1, 1, 1,
-1.208999, 0.8287752, -0.2031607, 0, 0, 1, 1, 1,
-1.191956, -0.4465177, -2.909082, 1, 0, 0, 1, 1,
-1.187224, -2.098949, -1.596172, 1, 0, 0, 1, 1,
-1.184994, 0.2001194, -1.214544, 1, 0, 0, 1, 1,
-1.183867, -0.1704677, -2.356422, 1, 0, 0, 1, 1,
-1.182872, 0.3144208, -0.1714125, 1, 0, 0, 1, 1,
-1.17854, 1.110306, 1.345764, 0, 0, 0, 1, 1,
-1.168838, 1.757247, -0.9075188, 0, 0, 0, 1, 1,
-1.150067, 1.716315, -1.77136, 0, 0, 0, 1, 1,
-1.149601, -0.09846579, -2.680503, 0, 0, 0, 1, 1,
-1.148729, -0.1137198, -2.473652, 0, 0, 0, 1, 1,
-1.147619, 0.8206998, 0.1959101, 0, 0, 0, 1, 1,
-1.14166, 0.4901895, -1.09016, 0, 0, 0, 1, 1,
-1.12667, -1.242564, -0.08572511, 1, 1, 1, 1, 1,
-1.125991, 0.5907644, -0.8210917, 1, 1, 1, 1, 1,
-1.123319, -0.7700266, -1.542472, 1, 1, 1, 1, 1,
-1.120734, 0.7102956, -1.431369, 1, 1, 1, 1, 1,
-1.120624, 2.400111, 0.07806772, 1, 1, 1, 1, 1,
-1.112752, -0.4606812, -2.695824, 1, 1, 1, 1, 1,
-1.111718, -0.1891206, -1.28942, 1, 1, 1, 1, 1,
-1.100088, -0.4782134, -3.634299, 1, 1, 1, 1, 1,
-1.098427, 0.2747639, -2.111853, 1, 1, 1, 1, 1,
-1.096698, 0.6764013, -0.452216, 1, 1, 1, 1, 1,
-1.086218, -0.5008875, -3.388213, 1, 1, 1, 1, 1,
-1.086148, 0.88469, -1.807323, 1, 1, 1, 1, 1,
-1.084525, -1.331055, -3.666508, 1, 1, 1, 1, 1,
-1.082171, 2.01596, 0.3462647, 1, 1, 1, 1, 1,
-1.080487, 0.6786804, -3.651001, 1, 1, 1, 1, 1,
-1.076166, -0.5081645, -1.156929, 0, 0, 1, 1, 1,
-1.075995, -0.935605, -2.472169, 1, 0, 0, 1, 1,
-1.069887, 0.1075811, -0.7569066, 1, 0, 0, 1, 1,
-1.061204, -0.6973827, -2.227867, 1, 0, 0, 1, 1,
-1.060202, 0.3881731, -0.8899765, 1, 0, 0, 1, 1,
-1.05426, -0.1411988, -0.300984, 1, 0, 0, 1, 1,
-1.052763, -0.6786292, -1.583577, 0, 0, 0, 1, 1,
-1.050296, -0.903523, -2.717831, 0, 0, 0, 1, 1,
-1.049765, 1.456909, -0.2534589, 0, 0, 0, 1, 1,
-1.036771, 0.818229, 0.4309752, 0, 0, 0, 1, 1,
-1.033488, -1.573991, -2.192161, 0, 0, 0, 1, 1,
-1.030006, 0.2015994, -1.527278, 0, 0, 0, 1, 1,
-1.028667, 0.2657742, -3.196607, 0, 0, 0, 1, 1,
-1.019729, 1.668993, -0.3639235, 1, 1, 1, 1, 1,
-1.013243, -0.6284783, -1.711724, 1, 1, 1, 1, 1,
-1.012956, 1.494343, -1.40417, 1, 1, 1, 1, 1,
-1.010673, -2.977011, -1.420392, 1, 1, 1, 1, 1,
-1.010023, -0.9049169, -2.683048, 1, 1, 1, 1, 1,
-1.007965, 0.05444183, -2.635163, 1, 1, 1, 1, 1,
-1.005395, 0.005825073, -3.381312, 1, 1, 1, 1, 1,
-1.003474, -1.266545, -1.388222, 1, 1, 1, 1, 1,
-0.9994454, 0.5687862, -0.09230545, 1, 1, 1, 1, 1,
-0.9992234, -1.417217, -2.189327, 1, 1, 1, 1, 1,
-0.9912375, 1.162504, -2.239712, 1, 1, 1, 1, 1,
-0.9871507, 1.276302, -0.6946107, 1, 1, 1, 1, 1,
-0.9800772, -0.9143878, -2.718415, 1, 1, 1, 1, 1,
-0.9770284, 0.7740206, -0.1385634, 1, 1, 1, 1, 1,
-0.9765723, -1.066319, -1.829566, 1, 1, 1, 1, 1,
-0.9755532, 1.47642, -0.548649, 0, 0, 1, 1, 1,
-0.9739474, -2.794329, -2.577114, 1, 0, 0, 1, 1,
-0.9721823, 1.103096, 0.3576454, 1, 0, 0, 1, 1,
-0.9710322, 1.011299, 0.159464, 1, 0, 0, 1, 1,
-0.9683186, -0.2955012, -0.7006989, 1, 0, 0, 1, 1,
-0.9659322, -0.4184029, -2.810345, 1, 0, 0, 1, 1,
-0.9542241, 2.083612, -0.9020811, 0, 0, 0, 1, 1,
-0.9539172, 1.363606, -0.6322086, 0, 0, 0, 1, 1,
-0.9518905, 0.7660988, -0.4225718, 0, 0, 0, 1, 1,
-0.938687, -1.697843, -3.581511, 0, 0, 0, 1, 1,
-0.9354952, -1.397723, -4.204762, 0, 0, 0, 1, 1,
-0.934579, -0.5451981, -2.983755, 0, 0, 0, 1, 1,
-0.9325678, 0.9486692, -1.571748, 0, 0, 0, 1, 1,
-0.9307408, 0.126214, -2.253943, 1, 1, 1, 1, 1,
-0.9267355, 0.6212291, -0.3246881, 1, 1, 1, 1, 1,
-0.9261743, -1.27468, -1.814409, 1, 1, 1, 1, 1,
-0.9248335, 1.473444, -1.377123, 1, 1, 1, 1, 1,
-0.9235106, 0.3053007, -1.446424, 1, 1, 1, 1, 1,
-0.9218513, 0.0420907, -1.807043, 1, 1, 1, 1, 1,
-0.9142044, -0.09022111, -1.044312, 1, 1, 1, 1, 1,
-0.9000111, 1.790818, -1.450936, 1, 1, 1, 1, 1,
-0.8990861, 0.6859897, -1.205835, 1, 1, 1, 1, 1,
-0.8975305, 0.05241403, 0.2074135, 1, 1, 1, 1, 1,
-0.8975211, -0.3892282, -2.723341, 1, 1, 1, 1, 1,
-0.8805526, -0.199852, -1.490968, 1, 1, 1, 1, 1,
-0.8797162, 1.855874, 1.251337, 1, 1, 1, 1, 1,
-0.873193, -0.5328507, -0.09930066, 1, 1, 1, 1, 1,
-0.8721846, 0.210077, -1.592969, 1, 1, 1, 1, 1,
-0.8712357, -0.005400918, -1.391931, 0, 0, 1, 1, 1,
-0.8659895, 0.5477141, 0.1671483, 1, 0, 0, 1, 1,
-0.8652011, 0.1625415, -2.885029, 1, 0, 0, 1, 1,
-0.863132, 0.3129848, -1.812495, 1, 0, 0, 1, 1,
-0.860381, 0.256586, -1.321772, 1, 0, 0, 1, 1,
-0.8590313, -2.088724, -2.817724, 1, 0, 0, 1, 1,
-0.8585428, 2.08231, -0.7545152, 0, 0, 0, 1, 1,
-0.8562061, 0.5960561, -0.9065108, 0, 0, 0, 1, 1,
-0.8497045, -0.2258528, -0.8456399, 0, 0, 0, 1, 1,
-0.8381243, 0.8869124, -0.3025784, 0, 0, 0, 1, 1,
-0.8334502, 0.4327902, -0.7046027, 0, 0, 0, 1, 1,
-0.8269324, 1.233016, -1.378049, 0, 0, 0, 1, 1,
-0.8264729, -0.3829949, -2.602529, 0, 0, 0, 1, 1,
-0.821465, -0.4216946, -0.6086721, 1, 1, 1, 1, 1,
-0.8187024, -0.205225, -2.808431, 1, 1, 1, 1, 1,
-0.8178974, -1.296416, -1.871561, 1, 1, 1, 1, 1,
-0.8148398, 0.1023285, -2.285545, 1, 1, 1, 1, 1,
-0.813874, -1.503577, -4.026384, 1, 1, 1, 1, 1,
-0.8127384, 1.042809, -0.8199037, 1, 1, 1, 1, 1,
-0.7965015, -0.1305137, -1.212716, 1, 1, 1, 1, 1,
-0.7957524, 0.08951452, -0.9504687, 1, 1, 1, 1, 1,
-0.7951884, -0.7265219, -2.41817, 1, 1, 1, 1, 1,
-0.7951877, -0.1139504, -2.613931, 1, 1, 1, 1, 1,
-0.792249, -0.06667911, -0.1795382, 1, 1, 1, 1, 1,
-0.7913982, 1.942882, 0.8146815, 1, 1, 1, 1, 1,
-0.7910751, 0.4384297, -0.3422563, 1, 1, 1, 1, 1,
-0.7891652, 0.2204813, -0.2939206, 1, 1, 1, 1, 1,
-0.7842581, -1.265918, -1.980115, 1, 1, 1, 1, 1,
-0.7835724, 0.6604602, -1.469723, 0, 0, 1, 1, 1,
-0.7832661, 0.886173, 0.3708997, 1, 0, 0, 1, 1,
-0.7823058, 0.5185816, -0.2801342, 1, 0, 0, 1, 1,
-0.7709631, 1.025798, -2.031507, 1, 0, 0, 1, 1,
-0.7654604, 1.074892, -1.489901, 1, 0, 0, 1, 1,
-0.764315, -0.1636437, -1.75553, 1, 0, 0, 1, 1,
-0.7628387, -0.472864, -1.313108, 0, 0, 0, 1, 1,
-0.7580627, 0.04609441, -0.4098315, 0, 0, 0, 1, 1,
-0.755546, 0.03947939, -2.26489, 0, 0, 0, 1, 1,
-0.7498321, 0.1088006, -1.60778, 0, 0, 0, 1, 1,
-0.7367916, -0.6317484, -2.076153, 0, 0, 0, 1, 1,
-0.7359055, 1.120952, -1.204924, 0, 0, 0, 1, 1,
-0.7345991, -1.518118, -2.064661, 0, 0, 0, 1, 1,
-0.7328005, 0.06924176, -1.353809, 1, 1, 1, 1, 1,
-0.7261103, -1.084388, -2.453567, 1, 1, 1, 1, 1,
-0.7195053, 0.2807712, -1.365918, 1, 1, 1, 1, 1,
-0.7183249, 1.136341, -1.703711, 1, 1, 1, 1, 1,
-0.7017434, 0.8855293, -0.8035398, 1, 1, 1, 1, 1,
-0.6995078, -0.9865413, -3.595128, 1, 1, 1, 1, 1,
-0.6961485, 1.217002, 0.7760551, 1, 1, 1, 1, 1,
-0.6924751, 0.04225609, -2.144069, 1, 1, 1, 1, 1,
-0.6896766, -1.400518, -1.799951, 1, 1, 1, 1, 1,
-0.6862115, 0.4490932, 0.08523158, 1, 1, 1, 1, 1,
-0.6861197, -0.4297624, -1.627786, 1, 1, 1, 1, 1,
-0.6819708, 2.364217, -0.6875345, 1, 1, 1, 1, 1,
-0.6799443, 0.5358234, -0.3884843, 1, 1, 1, 1, 1,
-0.6781019, 0.7148451, 1.883892, 1, 1, 1, 1, 1,
-0.6771032, 0.6764184, -1.416742, 1, 1, 1, 1, 1,
-0.6760564, 0.8775675, -0.1868525, 0, 0, 1, 1, 1,
-0.6688207, -1.717315, -4.427565, 1, 0, 0, 1, 1,
-0.6681877, 1.516749, -0.7020817, 1, 0, 0, 1, 1,
-0.6677886, 0.246869, -2.042244, 1, 0, 0, 1, 1,
-0.6638077, -0.8805948, -3.320005, 1, 0, 0, 1, 1,
-0.6626653, -0.3267503, -2.154306, 1, 0, 0, 1, 1,
-0.6620656, 0.5930005, -0.8883087, 0, 0, 0, 1, 1,
-0.6592464, 0.278843, -1.070682, 0, 0, 0, 1, 1,
-0.6551172, -0.4826348, -2.044527, 0, 0, 0, 1, 1,
-0.6535046, -0.5318993, -2.4195, 0, 0, 0, 1, 1,
-0.6482093, 0.7986203, -0.9596949, 0, 0, 0, 1, 1,
-0.6362524, -1.406201, -1.485896, 0, 0, 0, 1, 1,
-0.636086, -0.5531977, -1.805356, 0, 0, 0, 1, 1,
-0.6356461, 1.675458, -0.1008848, 1, 1, 1, 1, 1,
-0.6314557, -1.018845, -3.172767, 1, 1, 1, 1, 1,
-0.6296696, -1.227251, -1.951892, 1, 1, 1, 1, 1,
-0.6266671, 0.2064986, 0.3346668, 1, 1, 1, 1, 1,
-0.6247253, 0.3454423, -0.4209603, 1, 1, 1, 1, 1,
-0.6243253, -0.1140184, -1.833445, 1, 1, 1, 1, 1,
-0.6135514, 1.138054, -2.293794, 1, 1, 1, 1, 1,
-0.6127292, 1.475157, 0.8081641, 1, 1, 1, 1, 1,
-0.6119061, -0.21197, -1.537667, 1, 1, 1, 1, 1,
-0.6068382, 1.160001, 0.5537766, 1, 1, 1, 1, 1,
-0.5995212, 1.275747, -0.150756, 1, 1, 1, 1, 1,
-0.5991526, 0.4663679, -0.7266026, 1, 1, 1, 1, 1,
-0.59723, -1.124649, -3.973157, 1, 1, 1, 1, 1,
-0.5959019, -0.2324531, -1.917307, 1, 1, 1, 1, 1,
-0.591231, 1.128047, -0.916012, 1, 1, 1, 1, 1,
-0.5883355, 1.417691, -0.6342583, 0, 0, 1, 1, 1,
-0.587072, -1.873425, -3.633711, 1, 0, 0, 1, 1,
-0.5838692, 0.2999047, -2.414777, 1, 0, 0, 1, 1,
-0.5807372, -0.2555305, -1.127618, 1, 0, 0, 1, 1,
-0.5796095, 0.6694925, -1.363564, 1, 0, 0, 1, 1,
-0.5744147, 0.5056246, -0.03172712, 1, 0, 0, 1, 1,
-0.5716919, 0.7743395, 0.9506245, 0, 0, 0, 1, 1,
-0.570769, 0.2372153, -1.455101, 0, 0, 0, 1, 1,
-0.5705518, 0.4273133, -0.8743448, 0, 0, 0, 1, 1,
-0.5641575, -0.01489908, -1.263006, 0, 0, 0, 1, 1,
-0.5590584, -1.538312, -3.682293, 0, 0, 0, 1, 1,
-0.5582188, 0.7926999, 0.3727532, 0, 0, 0, 1, 1,
-0.5477288, 0.1334048, -2.135217, 0, 0, 0, 1, 1,
-0.5433223, -0.238248, -2.335162, 1, 1, 1, 1, 1,
-0.5405657, -0.3759345, -2.520227, 1, 1, 1, 1, 1,
-0.5401149, -0.6940689, -1.856057, 1, 1, 1, 1, 1,
-0.5382962, -1.07689, -3.433413, 1, 1, 1, 1, 1,
-0.5358779, -0.223284, -3.131093, 1, 1, 1, 1, 1,
-0.5336718, 1.418426, 0.8265473, 1, 1, 1, 1, 1,
-0.5299029, -0.06590098, -2.067881, 1, 1, 1, 1, 1,
-0.5228899, 1.159951, 0.276526, 1, 1, 1, 1, 1,
-0.5224692, -1.678924, -3.071115, 1, 1, 1, 1, 1,
-0.5178992, -0.2391296, -0.9941625, 1, 1, 1, 1, 1,
-0.5102854, -1.451221, -3.92013, 1, 1, 1, 1, 1,
-0.5098358, -0.7173114, -3.423566, 1, 1, 1, 1, 1,
-0.5096463, -0.3296396, -0.9099793, 1, 1, 1, 1, 1,
-0.5087913, -0.5713036, -2.192928, 1, 1, 1, 1, 1,
-0.5056282, -1.299607, -2.004959, 1, 1, 1, 1, 1,
-0.5016754, -0.4687948, -1.23959, 0, 0, 1, 1, 1,
-0.5012739, -0.4938661, -2.074966, 1, 0, 0, 1, 1,
-0.4992566, -0.1231084, -2.744279, 1, 0, 0, 1, 1,
-0.4962213, 0.4159328, -0.0752652, 1, 0, 0, 1, 1,
-0.4913763, -1.154051, -2.044162, 1, 0, 0, 1, 1,
-0.490671, 1.391891, 0.06136969, 1, 0, 0, 1, 1,
-0.4815261, -0.8051463, -3.623041, 0, 0, 0, 1, 1,
-0.4777168, 0.3117947, 0.8513154, 0, 0, 0, 1, 1,
-0.4773036, 0.3276297, -0.1074804, 0, 0, 0, 1, 1,
-0.4734589, -1.984222, -4.339018, 0, 0, 0, 1, 1,
-0.47177, 0.4742208, -0.6409022, 0, 0, 0, 1, 1,
-0.4611265, -0.5356477, -0.2144267, 0, 0, 0, 1, 1,
-0.459265, -1.270892, -3.380367, 0, 0, 0, 1, 1,
-0.4453683, 0.3070104, -2.699248, 1, 1, 1, 1, 1,
-0.4452039, 0.5044053, -2.81469, 1, 1, 1, 1, 1,
-0.4407806, -0.4659835, -2.308121, 1, 1, 1, 1, 1,
-0.4379771, -0.7039294, -3.982668, 1, 1, 1, 1, 1,
-0.4345659, -0.5336909, -2.115191, 1, 1, 1, 1, 1,
-0.4286841, 0.3708157, 0.7993378, 1, 1, 1, 1, 1,
-0.427531, 0.1430026, -0.5701022, 1, 1, 1, 1, 1,
-0.4258832, 1.417821, -0.006201481, 1, 1, 1, 1, 1,
-0.4249801, 1.307376, -0.6041197, 1, 1, 1, 1, 1,
-0.4245952, 1.457769, -0.5636827, 1, 1, 1, 1, 1,
-0.4245649, 2.079204, -0.0848434, 1, 1, 1, 1, 1,
-0.4183125, -0.6747305, -3.368353, 1, 1, 1, 1, 1,
-0.4173009, 1.505824, -1.17047, 1, 1, 1, 1, 1,
-0.4167914, -0.4176112, -0.4660192, 1, 1, 1, 1, 1,
-0.4111283, 1.532611, -1.007454, 1, 1, 1, 1, 1,
-0.4065744, 0.9244609, -0.6995003, 0, 0, 1, 1, 1,
-0.4012773, -0.7371889, -1.731014, 1, 0, 0, 1, 1,
-0.4006259, -0.04766633, -4.233177, 1, 0, 0, 1, 1,
-0.3962171, -0.323578, -3.278787, 1, 0, 0, 1, 1,
-0.3913336, -0.7603531, -3.928146, 1, 0, 0, 1, 1,
-0.3891285, 0.4499254, -0.1398696, 1, 0, 0, 1, 1,
-0.3883269, -0.9161155, -2.911719, 0, 0, 0, 1, 1,
-0.387502, 1.38803, 0.4604524, 0, 0, 0, 1, 1,
-0.3867401, -0.7444497, -2.754983, 0, 0, 0, 1, 1,
-0.3859597, -1.2419, -3.149551, 0, 0, 0, 1, 1,
-0.3855051, 0.148736, -0.6545037, 0, 0, 0, 1, 1,
-0.3852077, -1.686503, -4.807837, 0, 0, 0, 1, 1,
-0.3824421, -0.2020482, -2.354952, 0, 0, 0, 1, 1,
-0.3821816, 1.10509, -0.404606, 1, 1, 1, 1, 1,
-0.3805554, 0.7187683, -0.2410629, 1, 1, 1, 1, 1,
-0.3749835, 1.002941, 1.164879, 1, 1, 1, 1, 1,
-0.3725102, 0.9059089, 1.150496, 1, 1, 1, 1, 1,
-0.3714767, -0.6783036, -2.351907, 1, 1, 1, 1, 1,
-0.3702202, 2.04406, 0.000681608, 1, 1, 1, 1, 1,
-0.3689719, -0.1333669, -1.399375, 1, 1, 1, 1, 1,
-0.3686537, 0.3833887, -2.475856, 1, 1, 1, 1, 1,
-0.354332, -0.7159293, -3.070228, 1, 1, 1, 1, 1,
-0.3479638, 0.6219308, -0.5632985, 1, 1, 1, 1, 1,
-0.346903, 2.022491, 1.400623, 1, 1, 1, 1, 1,
-0.3383633, 0.3782549, 0.2113902, 1, 1, 1, 1, 1,
-0.3382609, -0.6149617, -4.936778, 1, 1, 1, 1, 1,
-0.3370105, 0.5659686, -1.802214, 1, 1, 1, 1, 1,
-0.3367132, 0.3083242, -1.173023, 1, 1, 1, 1, 1,
-0.3331856, -0.1139002, -2.053278, 0, 0, 1, 1, 1,
-0.3318298, -0.2217245, -2.74946, 1, 0, 0, 1, 1,
-0.3250839, 0.1174209, -0.4426651, 1, 0, 0, 1, 1,
-0.3239681, 1.478519, -0.7209386, 1, 0, 0, 1, 1,
-0.3204493, 0.3874257, -1.514432, 1, 0, 0, 1, 1,
-0.3192206, -0.574691, -3.560937, 1, 0, 0, 1, 1,
-0.3172682, 2.79748, 0.08021419, 0, 0, 0, 1, 1,
-0.3170221, 1.463893, -0.296575, 0, 0, 0, 1, 1,
-0.3150018, 0.2304455, -0.9656119, 0, 0, 0, 1, 1,
-0.3127126, 1.906226, -0.348913, 0, 0, 0, 1, 1,
-0.3124073, -1.587571, -2.736162, 0, 0, 0, 1, 1,
-0.3100049, -0.4769247, -3.670125, 0, 0, 0, 1, 1,
-0.3082236, -1.207183, -2.659943, 0, 0, 0, 1, 1,
-0.3073665, -0.9338925, -2.200744, 1, 1, 1, 1, 1,
-0.3022304, -0.4223039, -2.108841, 1, 1, 1, 1, 1,
-0.3017004, -0.405916, -3.345985, 1, 1, 1, 1, 1,
-0.3002968, -1.462966, -3.031294, 1, 1, 1, 1, 1,
-0.3002789, -0.02349901, -2.372238, 1, 1, 1, 1, 1,
-0.3000197, -0.0880923, -1.573095, 1, 1, 1, 1, 1,
-0.2947468, 1.182103, -2.153679, 1, 1, 1, 1, 1,
-0.2943914, 0.8446725, -0.7378215, 1, 1, 1, 1, 1,
-0.2933283, -0.3207704, -2.044741, 1, 1, 1, 1, 1,
-0.287576, -0.04038262, -1.487407, 1, 1, 1, 1, 1,
-0.287538, 1.834488, -0.4624589, 1, 1, 1, 1, 1,
-0.2839013, -0.5073963, -2.020161, 1, 1, 1, 1, 1,
-0.2774139, 1.202287, 0.5306801, 1, 1, 1, 1, 1,
-0.275916, -0.9677485, -3.316189, 1, 1, 1, 1, 1,
-0.2721097, 0.453185, -0.3163789, 1, 1, 1, 1, 1,
-0.2705071, 0.905488, -0.5013421, 0, 0, 1, 1, 1,
-0.2661957, -0.1982828, -0.4444247, 1, 0, 0, 1, 1,
-0.2550578, -1.850309, -3.003846, 1, 0, 0, 1, 1,
-0.2547461, 0.4534405, -2.674037, 1, 0, 0, 1, 1,
-0.2529614, 1.941979, -0.2333811, 1, 0, 0, 1, 1,
-0.2416966, 1.083744, 0.07091223, 1, 0, 0, 1, 1,
-0.2390052, 1.758598, -2.493087, 0, 0, 0, 1, 1,
-0.235634, 0.3567985, 0.06213016, 0, 0, 0, 1, 1,
-0.2337554, 1.415629, -1.10252, 0, 0, 0, 1, 1,
-0.2331488, 1.299555, -0.3743636, 0, 0, 0, 1, 1,
-0.2309301, -0.4712595, -3.504505, 0, 0, 0, 1, 1,
-0.229593, -1.702056, -3.305619, 0, 0, 0, 1, 1,
-0.2277531, -1.051293, -1.520752, 0, 0, 0, 1, 1,
-0.2241868, 0.8707237, -0.4593846, 1, 1, 1, 1, 1,
-0.2206263, 0.7748318, -0.8428703, 1, 1, 1, 1, 1,
-0.216655, -0.6778469, -2.548706, 1, 1, 1, 1, 1,
-0.216003, 0.5751115, 0.6698583, 1, 1, 1, 1, 1,
-0.2148114, -2.49604, -4.938296, 1, 1, 1, 1, 1,
-0.2131569, -0.5605302, -6.885048, 1, 1, 1, 1, 1,
-0.2126041, -1.075903, -3.251783, 1, 1, 1, 1, 1,
-0.2095265, 0.01656079, -1.767237, 1, 1, 1, 1, 1,
-0.2059864, 1.350587, -0.1907319, 1, 1, 1, 1, 1,
-0.2055067, -0.06355646, -2.470039, 1, 1, 1, 1, 1,
-0.2047432, 0.6739874, 1.18084, 1, 1, 1, 1, 1,
-0.2037775, 0.8454928, 1.305854, 1, 1, 1, 1, 1,
-0.2027556, 1.320148, 0.3369548, 1, 1, 1, 1, 1,
-0.1999012, -1.056552, -1.978845, 1, 1, 1, 1, 1,
-0.1975229, 0.1451919, 0.02441506, 1, 1, 1, 1, 1,
-0.1908533, 0.4377981, -0.7408596, 0, 0, 1, 1, 1,
-0.1904714, 1.856129, 0.6823794, 1, 0, 0, 1, 1,
-0.1886432, -1.083739, -4.762913, 1, 0, 0, 1, 1,
-0.1878238, 1.004956, -0.329006, 1, 0, 0, 1, 1,
-0.1862733, 0.2624004, -0.9514763, 1, 0, 0, 1, 1,
-0.1826234, 0.8645175, -0.2446388, 1, 0, 0, 1, 1,
-0.1802333, 0.1061518, -0.3550784, 0, 0, 0, 1, 1,
-0.1786959, 0.3525628, -0.1428929, 0, 0, 0, 1, 1,
-0.161414, -1.084878, -3.668667, 0, 0, 0, 1, 1,
-0.1580069, 2.001069, -0.3666294, 0, 0, 0, 1, 1,
-0.1556096, -0.1018718, -3.112527, 0, 0, 0, 1, 1,
-0.1534467, -0.4833967, -3.941378, 0, 0, 0, 1, 1,
-0.1517631, -0.3658136, -2.685323, 0, 0, 0, 1, 1,
-0.1517425, 1.874466, -2.917809, 1, 1, 1, 1, 1,
-0.1506423, -0.8144948, -3.205284, 1, 1, 1, 1, 1,
-0.1480975, 0.1536485, -0.6724564, 1, 1, 1, 1, 1,
-0.143389, 0.1441711, 0.4979281, 1, 1, 1, 1, 1,
-0.1404492, 0.8594976, -0.3129765, 1, 1, 1, 1, 1,
-0.1385039, 0.9934417, 0.497348, 1, 1, 1, 1, 1,
-0.1343728, -0.2861632, -2.478424, 1, 1, 1, 1, 1,
-0.1327571, 1.117667, 0.4603807, 1, 1, 1, 1, 1,
-0.1312037, 2.177895, 0.3339949, 1, 1, 1, 1, 1,
-0.1298931, -0.06864514, -2.149673, 1, 1, 1, 1, 1,
-0.1225415, 1.322205, -0.7983286, 1, 1, 1, 1, 1,
-0.1220118, -0.5695929, -2.303286, 1, 1, 1, 1, 1,
-0.1211793, -0.1597458, -2.462944, 1, 1, 1, 1, 1,
-0.1181745, 1.645391, -0.3049388, 1, 1, 1, 1, 1,
-0.116591, 2.638159, 0.2581076, 1, 1, 1, 1, 1,
-0.1142376, 0.7954649, -0.7252639, 0, 0, 1, 1, 1,
-0.1135601, 1.043154, -1.771417, 1, 0, 0, 1, 1,
-0.1114186, -1.614323, -4.647213, 1, 0, 0, 1, 1,
-0.1088602, -1.101322, -4.745905, 1, 0, 0, 1, 1,
-0.106668, -2.127742, -2.791179, 1, 0, 0, 1, 1,
-0.09793063, -0.003086368, -2.131006, 1, 0, 0, 1, 1,
-0.09716119, 0.6713213, -1.051157, 0, 0, 0, 1, 1,
-0.09451022, 1.115274, -0.5033872, 0, 0, 0, 1, 1,
-0.09410936, -1.268717, -3.072133, 0, 0, 0, 1, 1,
-0.08723947, 0.550186, -0.1461246, 0, 0, 0, 1, 1,
-0.08718129, 2.551316, 1.005665, 0, 0, 0, 1, 1,
-0.08016536, -0.9714138, -4.860703, 0, 0, 0, 1, 1,
-0.07849765, 1.672906, -0.157282, 0, 0, 0, 1, 1,
-0.07328365, 2.010084, 1.712137, 1, 1, 1, 1, 1,
-0.07047092, -0.6344886, -2.02219, 1, 1, 1, 1, 1,
-0.06991798, -0.6723937, -3.954243, 1, 1, 1, 1, 1,
-0.06855914, -0.1692328, -3.799223, 1, 1, 1, 1, 1,
-0.06682824, -0.6157002, -2.23712, 1, 1, 1, 1, 1,
-0.06613237, -0.2055171, -3.666175, 1, 1, 1, 1, 1,
-0.06134259, -1.687723, -2.449857, 1, 1, 1, 1, 1,
-0.05986263, 0.5762619, -1.454412, 1, 1, 1, 1, 1,
-0.05532297, -0.4884062, -1.842956, 1, 1, 1, 1, 1,
-0.054849, -0.3428999, -4.09339, 1, 1, 1, 1, 1,
-0.05310356, 0.07689388, -0.185281, 1, 1, 1, 1, 1,
-0.04871907, 0.2345491, -2.205328, 1, 1, 1, 1, 1,
-0.04496114, -1.433832, -2.5995, 1, 1, 1, 1, 1,
-0.0406427, -0.08396673, -1.942612, 1, 1, 1, 1, 1,
-0.03666279, -0.8891556, -2.467729, 1, 1, 1, 1, 1,
-0.0334349, -0.2452875, -1.760235, 0, 0, 1, 1, 1,
-0.03247403, 0.8287488, -0.8116246, 1, 0, 0, 1, 1,
-0.03244734, -1.005379, -3.62779, 1, 0, 0, 1, 1,
-0.03046168, -1.381469, -1.033271, 1, 0, 0, 1, 1,
-0.02940037, -1.085977, -3.252385, 1, 0, 0, 1, 1,
-0.02601187, 1.542269, 0.2625515, 1, 0, 0, 1, 1,
-0.02230642, 0.3207541, -0.08465774, 0, 0, 0, 1, 1,
-0.02102793, -1.185521, -1.434018, 0, 0, 0, 1, 1,
-0.02030725, -0.9092283, -4.499578, 0, 0, 0, 1, 1,
-0.01883841, -0.3770904, -4.505234, 0, 0, 0, 1, 1,
-0.01592173, 0.2351213, -1.874368, 0, 0, 0, 1, 1,
-0.007707794, -0.4889953, -2.231957, 0, 0, 0, 1, 1,
-0.003764762, 1.015051, 0.1577236, 0, 0, 0, 1, 1,
-0.003490444, -0.07137366, -3.06935, 1, 1, 1, 1, 1,
0.007660049, -0.312815, 3.38051, 1, 1, 1, 1, 1,
0.01249981, 2.103143, 0.9310267, 1, 1, 1, 1, 1,
0.01446539, -0.1401774, 3.397523, 1, 1, 1, 1, 1,
0.01626706, 0.07712314, 1.204344, 1, 1, 1, 1, 1,
0.02321835, 0.1836982, 0.7109463, 1, 1, 1, 1, 1,
0.02441637, 0.2321798, 2.108394, 1, 1, 1, 1, 1,
0.02537727, 0.4381913, 1.101581, 1, 1, 1, 1, 1,
0.03136617, -0.1964826, 4.060483, 1, 1, 1, 1, 1,
0.03410553, -0.9189068, 4.085485, 1, 1, 1, 1, 1,
0.03523353, -1.256499, 3.539511, 1, 1, 1, 1, 1,
0.0410131, 1.197075, -0.286847, 1, 1, 1, 1, 1,
0.04325635, -0.8973638, 1.586015, 1, 1, 1, 1, 1,
0.04334094, 0.5575981, 0.8361495, 1, 1, 1, 1, 1,
0.05245908, 1.304987, -0.738225, 1, 1, 1, 1, 1,
0.06008159, 0.7015262, 0.6349633, 0, 0, 1, 1, 1,
0.06097318, -0.3654866, 3.270628, 1, 0, 0, 1, 1,
0.0616431, 0.2345812, -0.4701088, 1, 0, 0, 1, 1,
0.06372821, -1.227928, 2.620185, 1, 0, 0, 1, 1,
0.06767167, -0.06297205, 1.559554, 1, 0, 0, 1, 1,
0.06986013, -1.172109, 3.430243, 1, 0, 0, 1, 1,
0.07166555, -1.050406, 2.654691, 0, 0, 0, 1, 1,
0.07696802, -1.187883, 3.385311, 0, 0, 0, 1, 1,
0.07723992, 1.20542, 0.04213272, 0, 0, 0, 1, 1,
0.08207475, -0.8318626, 3.451874, 0, 0, 0, 1, 1,
0.09368095, 0.4137956, -1.058692, 0, 0, 0, 1, 1,
0.09452912, -0.2704034, 3.59053, 0, 0, 0, 1, 1,
0.09638637, 0.8278279, 2.132807, 0, 0, 0, 1, 1,
0.0984984, 0.1972578, 2.599638, 1, 1, 1, 1, 1,
0.09939737, 1.070387, -1.578653, 1, 1, 1, 1, 1,
0.1021689, -0.4488307, 3.950371, 1, 1, 1, 1, 1,
0.1035324, 0.1742299, 0.122532, 1, 1, 1, 1, 1,
0.1041711, 3.011519, 0.3289495, 1, 1, 1, 1, 1,
0.1044506, -0.4379569, 4.369415, 1, 1, 1, 1, 1,
0.1160526, 1.109275, 1.178993, 1, 1, 1, 1, 1,
0.1162756, -1.533944, 2.123416, 1, 1, 1, 1, 1,
0.1207787, 0.6712847, 0.7856312, 1, 1, 1, 1, 1,
0.1210765, -1.099515, 4.403446, 1, 1, 1, 1, 1,
0.12206, -0.07298952, 3.665436, 1, 1, 1, 1, 1,
0.1239183, -0.9208055, 3.643963, 1, 1, 1, 1, 1,
0.1241361, -0.7116128, 3.244296, 1, 1, 1, 1, 1,
0.1325496, 0.926001, -0.7632303, 1, 1, 1, 1, 1,
0.1426314, 0.06716266, 1.576818, 1, 1, 1, 1, 1,
0.1433996, -0.7542803, 2.521379, 0, 0, 1, 1, 1,
0.1467647, 1.690651, 1.170866, 1, 0, 0, 1, 1,
0.1492108, -2.439015, 4.947584, 1, 0, 0, 1, 1,
0.150461, -0.08123861, 1.830796, 1, 0, 0, 1, 1,
0.1517898, 0.1893354, 0.1884684, 1, 0, 0, 1, 1,
0.1550495, 2.318139, 0.1685838, 1, 0, 0, 1, 1,
0.1556475, -0.8621978, 3.623523, 0, 0, 0, 1, 1,
0.159354, -2.387668, 3.052397, 0, 0, 0, 1, 1,
0.1602952, -0.4323571, 1.683791, 0, 0, 0, 1, 1,
0.1607256, -1.109046, 4.388113, 0, 0, 0, 1, 1,
0.1624894, 0.9182137, 1.147871, 0, 0, 0, 1, 1,
0.1643567, -1.660875, 3.359917, 0, 0, 0, 1, 1,
0.1662204, -0.2490784, 1.933997, 0, 0, 0, 1, 1,
0.1668684, 0.2248282, 1.55725, 1, 1, 1, 1, 1,
0.1678117, -0.7376493, 2.752232, 1, 1, 1, 1, 1,
0.1682941, 0.5529174, 0.04493582, 1, 1, 1, 1, 1,
0.1690915, 0.6423623, -0.6294255, 1, 1, 1, 1, 1,
0.1751529, 1.034456, 0.5904787, 1, 1, 1, 1, 1,
0.17626, -2.698838, 3.139421, 1, 1, 1, 1, 1,
0.1791482, 2.488019, -0.799017, 1, 1, 1, 1, 1,
0.1799658, -0.3534849, 2.548804, 1, 1, 1, 1, 1,
0.1850771, 1.153532, -0.2179037, 1, 1, 1, 1, 1,
0.1851465, -1.049863, 2.917766, 1, 1, 1, 1, 1,
0.1872112, 1.317694, 1.191237, 1, 1, 1, 1, 1,
0.1895087, 0.7435223, -0.7566416, 1, 1, 1, 1, 1,
0.189822, -0.07070686, 2.644892, 1, 1, 1, 1, 1,
0.1900835, -0.4767223, 2.882994, 1, 1, 1, 1, 1,
0.1904869, -0.06731852, 2.804711, 1, 1, 1, 1, 1,
0.1956319, 1.133215, -1.054894, 0, 0, 1, 1, 1,
0.2060811, -0.6226889, 1.551223, 1, 0, 0, 1, 1,
0.2065098, -0.3442353, 2.944498, 1, 0, 0, 1, 1,
0.2070153, 0.7656361, -0.9095672, 1, 0, 0, 1, 1,
0.2087468, -0.08425204, 1.541313, 1, 0, 0, 1, 1,
0.2089287, 0.8877888, 0.9288315, 1, 0, 0, 1, 1,
0.2105002, 0.3734478, 0.2937776, 0, 0, 0, 1, 1,
0.211766, -1.074911, 2.462287, 0, 0, 0, 1, 1,
0.2133433, -0.2689072, 1.639352, 0, 0, 0, 1, 1,
0.2172501, 1.633685, -0.7089514, 0, 0, 0, 1, 1,
0.222134, 1.198967, 2.027324, 0, 0, 0, 1, 1,
0.224338, 1.508687, 2.277379, 0, 0, 0, 1, 1,
0.2254542, -0.5290112, 1.705597, 0, 0, 0, 1, 1,
0.2277591, 0.03711075, 1.606624, 1, 1, 1, 1, 1,
0.2284379, -0.306545, 3.466593, 1, 1, 1, 1, 1,
0.2292646, 1.294235, 2.138396, 1, 1, 1, 1, 1,
0.2306289, -1.953531, 2.691679, 1, 1, 1, 1, 1,
0.2339153, 0.1603416, 1.035639, 1, 1, 1, 1, 1,
0.2369847, 0.9571441, 0.587715, 1, 1, 1, 1, 1,
0.2385229, -0.6511388, 2.729895, 1, 1, 1, 1, 1,
0.2396412, -1.102705, 2.252776, 1, 1, 1, 1, 1,
0.2403222, -0.4964389, 2.767777, 1, 1, 1, 1, 1,
0.241553, 1.950371, 2.335597, 1, 1, 1, 1, 1,
0.2450952, -0.9364082, 3.445253, 1, 1, 1, 1, 1,
0.252093, 1.432267, 0.6985041, 1, 1, 1, 1, 1,
0.2532049, -0.8495505, 1.664121, 1, 1, 1, 1, 1,
0.2564808, 0.2210026, 1.84565, 1, 1, 1, 1, 1,
0.2581873, 1.116408, 0.5887548, 1, 1, 1, 1, 1,
0.2627585, -0.3644378, 2.397871, 0, 0, 1, 1, 1,
0.264061, -0.0925488, 0.4457798, 1, 0, 0, 1, 1,
0.2642151, 1.678906, 0.8497386, 1, 0, 0, 1, 1,
0.2678939, -0.5444165, 2.43546, 1, 0, 0, 1, 1,
0.2733575, -0.8108636, 3.435046, 1, 0, 0, 1, 1,
0.2744502, -0.7607219, 2.361373, 1, 0, 0, 1, 1,
0.2766196, 0.5314565, -1.988179, 0, 0, 0, 1, 1,
0.2857706, -0.2350929, 3.048632, 0, 0, 0, 1, 1,
0.2924833, 0.2480165, 2.771622, 0, 0, 0, 1, 1,
0.2927774, 0.6067879, -0.0493261, 0, 0, 0, 1, 1,
0.298498, 0.3805878, 1.038182, 0, 0, 0, 1, 1,
0.3005894, -1.468868, 2.962322, 0, 0, 0, 1, 1,
0.3025569, 0.6273558, 1.238679, 0, 0, 0, 1, 1,
0.3044638, 0.2706294, 0.7746206, 1, 1, 1, 1, 1,
0.315587, 0.1901709, 0.3912939, 1, 1, 1, 1, 1,
0.3178967, 0.5384146, 0.7164283, 1, 1, 1, 1, 1,
0.3187596, -0.1892648, 2.585696, 1, 1, 1, 1, 1,
0.322933, 0.8293893, -0.1546057, 1, 1, 1, 1, 1,
0.3244814, 0.152115, 1.152414, 1, 1, 1, 1, 1,
0.3267764, -0.8326757, 3.032814, 1, 1, 1, 1, 1,
0.3271655, 0.8278496, 1.011784, 1, 1, 1, 1, 1,
0.3302247, 0.394705, 1.696993, 1, 1, 1, 1, 1,
0.337726, 0.9679552, 2.255021, 1, 1, 1, 1, 1,
0.3379719, 0.3753301, 1.48822, 1, 1, 1, 1, 1,
0.3394201, -0.7990355, 2.062091, 1, 1, 1, 1, 1,
0.340304, -0.7781395, 1.293909, 1, 1, 1, 1, 1,
0.3407769, 0.5702196, 0.8541172, 1, 1, 1, 1, 1,
0.3444723, 1.059305, 0.1820299, 1, 1, 1, 1, 1,
0.3455774, 1.175118, 1.07343, 0, 0, 1, 1, 1,
0.3529303, -0.9747664, 2.661163, 1, 0, 0, 1, 1,
0.356171, 0.9636075, -0.1794295, 1, 0, 0, 1, 1,
0.3602431, 1.870355, 0.3480234, 1, 0, 0, 1, 1,
0.3611374, 1.095458, 0.6009414, 1, 0, 0, 1, 1,
0.363703, 0.03585231, 0.01030737, 1, 0, 0, 1, 1,
0.3690907, 0.6328343, 0.7823567, 0, 0, 0, 1, 1,
0.3699066, -0.7803914, 1.548369, 0, 0, 0, 1, 1,
0.3706867, 1.203976, 2.523886, 0, 0, 0, 1, 1,
0.370765, 0.1913412, 2.245454, 0, 0, 0, 1, 1,
0.3723392, -1.182735, 2.741032, 0, 0, 0, 1, 1,
0.3725431, 0.5814038, 0.90038, 0, 0, 0, 1, 1,
0.3727342, 0.06595316, 1.93656, 0, 0, 0, 1, 1,
0.3733886, -1.072706, 2.746427, 1, 1, 1, 1, 1,
0.3739262, 0.5455651, 0.4565665, 1, 1, 1, 1, 1,
0.3830244, 0.2613944, 1.106636, 1, 1, 1, 1, 1,
0.3835379, -0.7809232, 3.15282, 1, 1, 1, 1, 1,
0.3922458, -0.6668254, 3.556329, 1, 1, 1, 1, 1,
0.3953753, -0.1805384, 4.258203, 1, 1, 1, 1, 1,
0.3969128, 0.4981582, 1.205731, 1, 1, 1, 1, 1,
0.4026493, -0.2547572, 0.9666681, 1, 1, 1, 1, 1,
0.4177781, 0.05932545, 1.841857, 1, 1, 1, 1, 1,
0.4183036, -0.4792422, 1.816841, 1, 1, 1, 1, 1,
0.4242258, -2.109069, 4.120748, 1, 1, 1, 1, 1,
0.4295623, -1.01026, 4.631157, 1, 1, 1, 1, 1,
0.4299916, 1.281629, -0.7948504, 1, 1, 1, 1, 1,
0.4374871, 0.7270014, -0.9991145, 1, 1, 1, 1, 1,
0.443583, 0.03372819, 1.425243, 1, 1, 1, 1, 1,
0.4445441, 1.368528, -0.1604286, 0, 0, 1, 1, 1,
0.4470467, 0.5035757, 1.244878, 1, 0, 0, 1, 1,
0.4507058, -1.477505, 1.882487, 1, 0, 0, 1, 1,
0.4512421, -0.3532713, 2.24099, 1, 0, 0, 1, 1,
0.452929, 0.31555, 1.122746, 1, 0, 0, 1, 1,
0.4587972, -1.15737, 4.664021, 1, 0, 0, 1, 1,
0.4600015, 1.107702, 1.079182, 0, 0, 0, 1, 1,
0.4604195, 0.04960846, 1.451915, 0, 0, 0, 1, 1,
0.4628514, -0.7382535, 2.231311, 0, 0, 0, 1, 1,
0.4648534, -0.2862083, 1.072096, 0, 0, 0, 1, 1,
0.4682599, -0.263021, 2.183158, 0, 0, 0, 1, 1,
0.47242, -0.441142, 1.75966, 0, 0, 0, 1, 1,
0.4727657, -2.444349, 4.102718, 0, 0, 0, 1, 1,
0.4729544, -0.4994633, 2.903122, 1, 1, 1, 1, 1,
0.4745073, -0.1595397, 1.353516, 1, 1, 1, 1, 1,
0.4747697, 0.6885899, -0.3183536, 1, 1, 1, 1, 1,
0.4866756, 0.1998778, 0.2197324, 1, 1, 1, 1, 1,
0.4917137, 0.5929952, 1.656712, 1, 1, 1, 1, 1,
0.4957652, -0.6229429, 2.779611, 1, 1, 1, 1, 1,
0.5022915, 0.7371472, -0.6009289, 1, 1, 1, 1, 1,
0.5086992, -1.493863, 2.57673, 1, 1, 1, 1, 1,
0.5104256, 0.1559201, 1.089079, 1, 1, 1, 1, 1,
0.5132737, -0.3678871, 1.573895, 1, 1, 1, 1, 1,
0.5157653, -2.207729, 1.493768, 1, 1, 1, 1, 1,
0.5160212, 0.1681227, 0.8877067, 1, 1, 1, 1, 1,
0.5225484, 0.1667546, 2.333225, 1, 1, 1, 1, 1,
0.5271263, 1.197745, -0.1548258, 1, 1, 1, 1, 1,
0.5275335, -0.09595485, 1.119122, 1, 1, 1, 1, 1,
0.5280458, -1.052083, 2.476804, 0, 0, 1, 1, 1,
0.5302852, 0.09163978, 1.367003, 1, 0, 0, 1, 1,
0.5325044, 0.7297777, 0.7048716, 1, 0, 0, 1, 1,
0.5341161, -0.4617977, 2.421174, 1, 0, 0, 1, 1,
0.5372451, -0.09205401, 1.863755, 1, 0, 0, 1, 1,
0.5439117, -1.064906, 0.8874402, 1, 0, 0, 1, 1,
0.5507203, 1.579615, 1.196567, 0, 0, 0, 1, 1,
0.5548041, -0.9645091, 3.971295, 0, 0, 0, 1, 1,
0.5570941, 0.09504397, 1.334623, 0, 0, 0, 1, 1,
0.5572327, 1.223761, -1.279727, 0, 0, 0, 1, 1,
0.5596104, -0.5096515, 2.03104, 0, 0, 0, 1, 1,
0.5626674, 1.419619, 0.6501684, 0, 0, 0, 1, 1,
0.5667375, -1.147547, 1.76463, 0, 0, 0, 1, 1,
0.5717844, 0.9484577, 1.11412, 1, 1, 1, 1, 1,
0.5746001, 0.9441615, 0.2265745, 1, 1, 1, 1, 1,
0.5764129, 1.154929, 0.3812703, 1, 1, 1, 1, 1,
0.5781385, 0.1834753, 1.135558, 1, 1, 1, 1, 1,
0.5792844, 0.6066034, 0.0537534, 1, 1, 1, 1, 1,
0.5830821, -0.275815, 0.7347353, 1, 1, 1, 1, 1,
0.585171, 0.2092374, 2.12624, 1, 1, 1, 1, 1,
0.5893176, 0.8561947, 1.61213, 1, 1, 1, 1, 1,
0.5896842, 0.1254771, 0.5785707, 1, 1, 1, 1, 1,
0.5938981, 1.177696, 1.297979, 1, 1, 1, 1, 1,
0.5958688, -0.1478495, 1.567335, 1, 1, 1, 1, 1,
0.6010585, 0.01855099, 1.900844, 1, 1, 1, 1, 1,
0.6056792, -0.2045205, 1.865649, 1, 1, 1, 1, 1,
0.6056867, -1.564957, 3.294634, 1, 1, 1, 1, 1,
0.6080175, -0.4993182, 1.763698, 1, 1, 1, 1, 1,
0.6092048, 0.3498581, -0.8828858, 0, 0, 1, 1, 1,
0.6104378, -2.457617, 3.127768, 1, 0, 0, 1, 1,
0.6115418, -0.02309534, 2.750448, 1, 0, 0, 1, 1,
0.6157634, -0.9172261, 2.820499, 1, 0, 0, 1, 1,
0.6288463, 1.22757, 1.103328, 1, 0, 0, 1, 1,
0.6303539, -1.059164, 3.672665, 1, 0, 0, 1, 1,
0.6329167, -1.53599, 4.578295, 0, 0, 0, 1, 1,
0.6341497, 1.490058, 1.333787, 0, 0, 0, 1, 1,
0.6370482, -1.085613, 2.521383, 0, 0, 0, 1, 1,
0.6391463, -0.9914237, 0.8827811, 0, 0, 0, 1, 1,
0.6400457, 0.7543541, 0.6668167, 0, 0, 0, 1, 1,
0.6403171, -0.8189492, 2.243057, 0, 0, 0, 1, 1,
0.6420004, -0.6427187, 2.375626, 0, 0, 0, 1, 1,
0.6463721, 0.6057834, 0.4694155, 1, 1, 1, 1, 1,
0.6494455, 0.2887769, -0.3068811, 1, 1, 1, 1, 1,
0.6520829, 0.6450675, 2.043574, 1, 1, 1, 1, 1,
0.6523788, -0.7279313, 0.8935444, 1, 1, 1, 1, 1,
0.653524, -0.7367964, 1.290773, 1, 1, 1, 1, 1,
0.6579236, 0.2238085, 2.567025, 1, 1, 1, 1, 1,
0.6692957, -1.205744, 1.944679, 1, 1, 1, 1, 1,
0.6707926, -0.2790969, 1.690218, 1, 1, 1, 1, 1,
0.6735507, 0.1020344, -0.2220504, 1, 1, 1, 1, 1,
0.6744931, -1.38754, 3.342423, 1, 1, 1, 1, 1,
0.6756565, 0.9485191, 1.825657, 1, 1, 1, 1, 1,
0.6761264, 0.4635704, 1.848151, 1, 1, 1, 1, 1,
0.6789315, 1.252473, 2.333463, 1, 1, 1, 1, 1,
0.6791914, 0.7434617, 0.9165125, 1, 1, 1, 1, 1,
0.683151, 1.6655, 1.118962, 1, 1, 1, 1, 1,
0.6847315, -1.004436, 1.690802, 0, 0, 1, 1, 1,
0.6866562, -1.44411, 3.380425, 1, 0, 0, 1, 1,
0.6876044, -0.04431217, 1.20222, 1, 0, 0, 1, 1,
0.688797, 1.219005, 0.818169, 1, 0, 0, 1, 1,
0.6901935, -0.09864188, 2.225644, 1, 0, 0, 1, 1,
0.6933217, -0.402252, 2.056571, 1, 0, 0, 1, 1,
0.6936384, 0.1986464, 3.125978, 0, 0, 0, 1, 1,
0.6965478, -1.563108, 2.278971, 0, 0, 0, 1, 1,
0.6973276, -0.2724839, 1.137343, 0, 0, 0, 1, 1,
0.7011089, -0.4811703, 1.694215, 0, 0, 0, 1, 1,
0.7060491, 0.4351083, 2.180089, 0, 0, 0, 1, 1,
0.707533, 1.277095, 1.515123, 0, 0, 0, 1, 1,
0.7096819, -0.05076151, -0.332968, 0, 0, 0, 1, 1,
0.7100613, -1.048555, 2.626386, 1, 1, 1, 1, 1,
0.7115688, 0.4405004, 0.2540329, 1, 1, 1, 1, 1,
0.7157506, -0.9986813, 0.4341918, 1, 1, 1, 1, 1,
0.7162074, -1.411344, 4.097642, 1, 1, 1, 1, 1,
0.7170654, 1.860098, 1.200546, 1, 1, 1, 1, 1,
0.7202668, -1.509422, 1.444888, 1, 1, 1, 1, 1,
0.7214037, -1.368949, 3.383438, 1, 1, 1, 1, 1,
0.7231529, -0.8841791, 2.491601, 1, 1, 1, 1, 1,
0.7286381, -0.1132829, 2.08674, 1, 1, 1, 1, 1,
0.7310874, 0.4378996, 0.6151021, 1, 1, 1, 1, 1,
0.7337024, -0.4206868, 4.098504, 1, 1, 1, 1, 1,
0.7337815, 1.998936, 0.7204462, 1, 1, 1, 1, 1,
0.7382323, 0.9642523, 1.492804, 1, 1, 1, 1, 1,
0.7396194, -1.331274, 1.755997, 1, 1, 1, 1, 1,
0.7415382, 1.806114, 0.8237692, 1, 1, 1, 1, 1,
0.7422941, 0.6431156, 0.5078692, 0, 0, 1, 1, 1,
0.7427023, -0.4070818, 3.697155, 1, 0, 0, 1, 1,
0.7613898, -0.0462813, 1.637964, 1, 0, 0, 1, 1,
0.7624317, 0.1045687, 1.286678, 1, 0, 0, 1, 1,
0.7624552, 0.5431058, 0.4359209, 1, 0, 0, 1, 1,
0.7700083, -0.1878192, 2.081104, 1, 0, 0, 1, 1,
0.7713692, -1.23971, 5.273709, 0, 0, 0, 1, 1,
0.7720556, -0.2832738, 1.643625, 0, 0, 0, 1, 1,
0.7721811, 0.7637144, 1.215202, 0, 0, 0, 1, 1,
0.7786477, -0.7949014, 3.27037, 0, 0, 0, 1, 1,
0.7788742, 0.1931748, 2.706586, 0, 0, 0, 1, 1,
0.7823235, 1.531006, 0.5019574, 0, 0, 0, 1, 1,
0.7831281, 0.2530661, 2.574848, 0, 0, 0, 1, 1,
0.7858885, 0.6037965, 1.244187, 1, 1, 1, 1, 1,
0.788372, 1.925372, 1.603985, 1, 1, 1, 1, 1,
0.78855, 0.6711396, -0.3754713, 1, 1, 1, 1, 1,
0.7946862, 1.430772, 0.9440714, 1, 1, 1, 1, 1,
0.7948436, 0.4458857, 1.179788, 1, 1, 1, 1, 1,
0.7993738, 0.599666, 1.005484, 1, 1, 1, 1, 1,
0.8209381, -0.7649572, -1.184473, 1, 1, 1, 1, 1,
0.8233009, -1.370644, 2.636055, 1, 1, 1, 1, 1,
0.8283579, -0.3790603, 1.779448, 1, 1, 1, 1, 1,
0.8330163, 0.7966601, 0.2094974, 1, 1, 1, 1, 1,
0.8393211, -1.88434, 4.545553, 1, 1, 1, 1, 1,
0.8399979, 1.261479, -0.8910695, 1, 1, 1, 1, 1,
0.8471751, -1.203279, 1.691786, 1, 1, 1, 1, 1,
0.8483185, 0.9441122, -0.01757378, 1, 1, 1, 1, 1,
0.8487227, 1.449943, 1.06757, 1, 1, 1, 1, 1,
0.8517498, 0.4326513, 0.6939759, 0, 0, 1, 1, 1,
0.8540018, 0.395053, 2.661938, 1, 0, 0, 1, 1,
0.8591511, 0.9058142, 0.8585114, 1, 0, 0, 1, 1,
0.8697481, -0.7048, 2.866289, 1, 0, 0, 1, 1,
0.8825842, -1.218825, 2.064355, 1, 0, 0, 1, 1,
0.8852199, -0.01288184, -0.7091098, 1, 0, 0, 1, 1,
0.8866601, -0.1153407, 3.683858, 0, 0, 0, 1, 1,
0.8954647, 1.157153, 2.638814, 0, 0, 0, 1, 1,
0.8975435, -0.1114859, 2.968617, 0, 0, 0, 1, 1,
0.9034456, 0.6392215, -0.0612813, 0, 0, 0, 1, 1,
0.9075478, -0.3252321, 1.295512, 0, 0, 0, 1, 1,
0.9092181, -1.204614, 3.019894, 0, 0, 0, 1, 1,
0.9109895, -0.08939905, 3.027128, 0, 0, 0, 1, 1,
0.9146696, -0.4324895, 1.901344, 1, 1, 1, 1, 1,
0.9155592, 1.131169, 1.218434, 1, 1, 1, 1, 1,
0.9224674, -0.3364698, 3.757135, 1, 1, 1, 1, 1,
0.9228503, -0.0103064, 2.798251, 1, 1, 1, 1, 1,
0.927801, -0.9763694, 2.318263, 1, 1, 1, 1, 1,
0.9284472, 0.8789239, 1.718672, 1, 1, 1, 1, 1,
0.9312736, 1.071266, 1.528273, 1, 1, 1, 1, 1,
0.9379094, -0.1625534, 1.231046, 1, 1, 1, 1, 1,
0.9471402, 0.07334646, 2.469329, 1, 1, 1, 1, 1,
0.952538, 0.3922388, 0.5442148, 1, 1, 1, 1, 1,
0.9576054, 0.05290923, 3.268684, 1, 1, 1, 1, 1,
0.959079, -1.415118, 1.956829, 1, 1, 1, 1, 1,
0.9641428, 0.7701558, 0.8485635, 1, 1, 1, 1, 1,
0.9690093, 0.08921266, 2.986313, 1, 1, 1, 1, 1,
0.9696395, -0.9416201, 2.976444, 1, 1, 1, 1, 1,
0.9760258, -0.9492022, 2.893822, 0, 0, 1, 1, 1,
0.9776212, 0.03925478, 1.45246, 1, 0, 0, 1, 1,
0.9871718, -0.6238145, 0.6914747, 1, 0, 0, 1, 1,
0.9913774, 0.2829372, 0.6408943, 1, 0, 0, 1, 1,
0.9950606, 0.2919182, 2.425078, 1, 0, 0, 1, 1,
0.9978103, 1.626288, 0.2116566, 1, 0, 0, 1, 1,
1.005162, 1.166861, 3.118863, 0, 0, 0, 1, 1,
1.005777, -0.06115083, 1.258277, 0, 0, 0, 1, 1,
1.011049, 0.8462871, 1.898637, 0, 0, 0, 1, 1,
1.011677, 1.784831, 1.692402, 0, 0, 0, 1, 1,
1.015913, 0.7027606, 2.044626, 0, 0, 0, 1, 1,
1.016143, -1.158446, 2.730244, 0, 0, 0, 1, 1,
1.01727, 0.06157225, 2.13663, 0, 0, 0, 1, 1,
1.017274, -1.377366, 1.972743, 1, 1, 1, 1, 1,
1.01789, 0.1068341, 0.1257754, 1, 1, 1, 1, 1,
1.020676, -0.2373086, -0.9518853, 1, 1, 1, 1, 1,
1.022974, 0.1294424, -0.5315818, 1, 1, 1, 1, 1,
1.027016, 0.8204577, 1.264772, 1, 1, 1, 1, 1,
1.027073, 0.7377496, 2.641398, 1, 1, 1, 1, 1,
1.032517, -1.473942, 2.678845, 1, 1, 1, 1, 1,
1.033023, 1.104444, 0.9991795, 1, 1, 1, 1, 1,
1.038931, -0.9159117, 3.702458, 1, 1, 1, 1, 1,
1.042133, 0.0264345, 3.091568, 1, 1, 1, 1, 1,
1.050097, -0.3674794, 0.4938301, 1, 1, 1, 1, 1,
1.052003, -0.5935085, 1.444977, 1, 1, 1, 1, 1,
1.052485, 0.3284606, 2.019544, 1, 1, 1, 1, 1,
1.056902, -0.9568274, 2.188562, 1, 1, 1, 1, 1,
1.059315, 0.1062373, 1.775444, 1, 1, 1, 1, 1,
1.065934, 0.133436, 1.365479, 0, 0, 1, 1, 1,
1.066624, 0.3475371, 0.2349712, 1, 0, 0, 1, 1,
1.072221, -1.489173, 1.567733, 1, 0, 0, 1, 1,
1.083376, 1.060581, 0.2031247, 1, 0, 0, 1, 1,
1.094755, -0.2386428, 3.592314, 1, 0, 0, 1, 1,
1.107128, -0.1414765, 1.557128, 1, 0, 0, 1, 1,
1.108669, 1.203392, 1.066579, 0, 0, 0, 1, 1,
1.110719, -0.5477507, 2.2487, 0, 0, 0, 1, 1,
1.120689, 1.214432, -0.2172258, 0, 0, 0, 1, 1,
1.124875, 0.9481286, -0.6764252, 0, 0, 0, 1, 1,
1.125209, 2.158833, 0.1736576, 0, 0, 0, 1, 1,
1.133489, 0.07800613, 1.161037, 0, 0, 0, 1, 1,
1.135708, 0.2805722, 0.9314562, 0, 0, 0, 1, 1,
1.153064, 0.3408905, 1.814128, 1, 1, 1, 1, 1,
1.155321, -0.267064, 2.000119, 1, 1, 1, 1, 1,
1.158561, -0.06201106, 1.200123, 1, 1, 1, 1, 1,
1.166209, 1.04653, 0.9326439, 1, 1, 1, 1, 1,
1.172461, -0.06577586, 0.8670927, 1, 1, 1, 1, 1,
1.17408, -0.4226818, 2.767534, 1, 1, 1, 1, 1,
1.176232, -1.00651, 0.5477388, 1, 1, 1, 1, 1,
1.17712, 0.7027227, 2.079994, 1, 1, 1, 1, 1,
1.17733, 1.072187, 3.182164, 1, 1, 1, 1, 1,
1.189611, 0.3115321, 1.375149, 1, 1, 1, 1, 1,
1.191172, -0.7232754, 3.320386, 1, 1, 1, 1, 1,
1.191528, -0.9190003, 2.861074, 1, 1, 1, 1, 1,
1.200846, 0.5478128, 1.386018, 1, 1, 1, 1, 1,
1.207561, 1.151299, -0.52176, 1, 1, 1, 1, 1,
1.209566, 0.7259307, 1.533794, 1, 1, 1, 1, 1,
1.212313, 0.3420684, 2.917269, 0, 0, 1, 1, 1,
1.214734, -0.6543666, 1.251236, 1, 0, 0, 1, 1,
1.217669, 1.09113, 1.494726, 1, 0, 0, 1, 1,
1.220263, -0.7886907, 2.054065, 1, 0, 0, 1, 1,
1.230335, 1.24329, 1.246714, 1, 0, 0, 1, 1,
1.243346, 1.035131, 0.6047129, 1, 0, 0, 1, 1,
1.251686, -0.5458726, 1.585188, 0, 0, 0, 1, 1,
1.251904, -0.7028867, 1.658856, 0, 0, 0, 1, 1,
1.269275, -0.6443796, 2.583782, 0, 0, 0, 1, 1,
1.28485, 1.14203, 0.8576161, 0, 0, 0, 1, 1,
1.296605, 1.104441, 2.228472, 0, 0, 0, 1, 1,
1.297536, 0.7774987, 1.461704, 0, 0, 0, 1, 1,
1.299827, 0.8383486, 0.4622941, 0, 0, 0, 1, 1,
1.305099, -3.265109, 2.94862, 1, 1, 1, 1, 1,
1.306018, -1.342252, 1.369658, 1, 1, 1, 1, 1,
1.308618, -1.285183, 1.12854, 1, 1, 1, 1, 1,
1.320071, 0.09368415, 0.6757791, 1, 1, 1, 1, 1,
1.320222, -0.4836319, 1.889856, 1, 1, 1, 1, 1,
1.320904, -0.5551573, 1.189011, 1, 1, 1, 1, 1,
1.323218, 1.256765, -0.8656685, 1, 1, 1, 1, 1,
1.323413, 1.475241, 1.284523, 1, 1, 1, 1, 1,
1.325745, -0.4049566, 1.600685, 1, 1, 1, 1, 1,
1.340374, 1.705275, -0.1977785, 1, 1, 1, 1, 1,
1.345125, 0.5140874, 0.1333483, 1, 1, 1, 1, 1,
1.35398, 0.04875093, -0.7500241, 1, 1, 1, 1, 1,
1.35598, -0.8851989, 2.62811, 1, 1, 1, 1, 1,
1.360488, -1.460375, 1.313623, 1, 1, 1, 1, 1,
1.36173, -0.5310531, 1.159107, 1, 1, 1, 1, 1,
1.362106, -0.1397402, 0.4557084, 0, 0, 1, 1, 1,
1.363177, 0.2628436, 1.067264, 1, 0, 0, 1, 1,
1.388603, -0.6409413, 1.93419, 1, 0, 0, 1, 1,
1.395599, 0.9647368, 0.1293082, 1, 0, 0, 1, 1,
1.398021, 0.2525806, -1.166196, 1, 0, 0, 1, 1,
1.408608, -0.808985, 0.9209127, 1, 0, 0, 1, 1,
1.410967, -0.09227034, 0.7320011, 0, 0, 0, 1, 1,
1.412817, -0.5222287, 2.387552, 0, 0, 0, 1, 1,
1.414468, -1.67481, 3.36964, 0, 0, 0, 1, 1,
1.415299, 0.229945, 2.460215, 0, 0, 0, 1, 1,
1.422181, -1.537922, 1.186897, 0, 0, 0, 1, 1,
1.425062, 1.732693, 2.040342, 0, 0, 0, 1, 1,
1.432898, 1.83865, 1.957289, 0, 0, 0, 1, 1,
1.447963, -0.1410815, 1.524887, 1, 1, 1, 1, 1,
1.459723, -0.117403, 1.619208, 1, 1, 1, 1, 1,
1.475427, -0.5809163, 1.503354, 1, 1, 1, 1, 1,
1.476998, -0.2955122, 1.502518, 1, 1, 1, 1, 1,
1.479525, -2.423281, 1.787939, 1, 1, 1, 1, 1,
1.484438, 1.342706, 1.950439, 1, 1, 1, 1, 1,
1.486818, -1.163258, 2.688678, 1, 1, 1, 1, 1,
1.490309, -0.4912885, 1.872333, 1, 1, 1, 1, 1,
1.497076, 1.027889, 1.91916, 1, 1, 1, 1, 1,
1.502191, -0.04218076, 2.585924, 1, 1, 1, 1, 1,
1.508355, 0.7165359, -0.9117204, 1, 1, 1, 1, 1,
1.508938, -2.060441, 2.56342, 1, 1, 1, 1, 1,
1.51129, 1.129865, -0.01621336, 1, 1, 1, 1, 1,
1.52419, -0.4271363, 1.132021, 1, 1, 1, 1, 1,
1.527351, -0.8838382, 2.402579, 1, 1, 1, 1, 1,
1.548913, -0.3089789, 1.070113, 0, 0, 1, 1, 1,
1.553031, 1.722682, 0.04801336, 1, 0, 0, 1, 1,
1.55307, 1.612913, 0.07221119, 1, 0, 0, 1, 1,
1.567066, 0.4756297, -1.79421, 1, 0, 0, 1, 1,
1.58283, 0.2101021, -0.1078744, 1, 0, 0, 1, 1,
1.584648, 1.127131, 2.813776, 1, 0, 0, 1, 1,
1.587928, 0.4788947, 2.214911, 0, 0, 0, 1, 1,
1.589612, 0.1319681, 2.365741, 0, 0, 0, 1, 1,
1.610667, 0.9491368, 2.155238, 0, 0, 0, 1, 1,
1.615781, -0.5797332, 1.778387, 0, 0, 0, 1, 1,
1.620778, 1.115518, 1.636565, 0, 0, 0, 1, 1,
1.630102, 1.083009, 1.648748, 0, 0, 0, 1, 1,
1.632962, -1.454086, 2.731539, 0, 0, 0, 1, 1,
1.659879, -0.3423976, 1.865407, 1, 1, 1, 1, 1,
1.662017, -1.334228, 2.371221, 1, 1, 1, 1, 1,
1.673969, -1.555736, 3.383709, 1, 1, 1, 1, 1,
1.675539, 1.216004, 0.2374616, 1, 1, 1, 1, 1,
1.676662, -1.366877, 0.9156162, 1, 1, 1, 1, 1,
1.682353, -0.2658604, 1.007377, 1, 1, 1, 1, 1,
1.703461, -1.918141, 3.705493, 1, 1, 1, 1, 1,
1.718782, 0.5643677, -0.2958425, 1, 1, 1, 1, 1,
1.726052, -0.7275919, 0.6646821, 1, 1, 1, 1, 1,
1.740115, -0.225539, 2.299151, 1, 1, 1, 1, 1,
1.742003, 0.8146257, 1.512397, 1, 1, 1, 1, 1,
1.768787, -1.280574, 0.9198466, 1, 1, 1, 1, 1,
1.771462, 1.183014, 0.9083298, 1, 1, 1, 1, 1,
1.772346, 0.9201521, 0.8601382, 1, 1, 1, 1, 1,
1.789832, -0.7224253, 0.2100083, 1, 1, 1, 1, 1,
1.795121, -1.66183, 3.628891, 0, 0, 1, 1, 1,
1.80678, -0.9152808, 1.803914, 1, 0, 0, 1, 1,
1.816427, -0.1838502, 2.760085, 1, 0, 0, 1, 1,
1.819101, 0.3412924, 0.4426168, 1, 0, 0, 1, 1,
1.834773, 0.5700806, 1.405824, 1, 0, 0, 1, 1,
1.839063, 0.779507, 0.6563271, 1, 0, 0, 1, 1,
1.851934, 1.9425, 1.256017, 0, 0, 0, 1, 1,
1.864972, -0.1319499, 2.334317, 0, 0, 0, 1, 1,
1.876137, -0.2648568, 2.433348, 0, 0, 0, 1, 1,
1.889047, 1.84848, 1.593251, 0, 0, 0, 1, 1,
1.89096, -0.455909, 0.6701148, 0, 0, 0, 1, 1,
1.893407, 0.4522684, 0.9348432, 0, 0, 0, 1, 1,
1.893977, -1.325677, 3.403675, 0, 0, 0, 1, 1,
1.904419, 1.168484, -0.6811818, 1, 1, 1, 1, 1,
1.914904, 0.102663, 2.188679, 1, 1, 1, 1, 1,
1.917531, -1.373716, 2.844229, 1, 1, 1, 1, 1,
1.941147, 0.3576997, 1.488865, 1, 1, 1, 1, 1,
1.970673, 0.3473272, 0.8863757, 1, 1, 1, 1, 1,
2.023668, -0.8458794, 3.540968, 1, 1, 1, 1, 1,
2.030658, -1.718048, 2.621519, 1, 1, 1, 1, 1,
2.032044, 0.1718532, 3.184707, 1, 1, 1, 1, 1,
2.033726, -1.455107, 2.175447, 1, 1, 1, 1, 1,
2.059387, 1.403317, 1.617414, 1, 1, 1, 1, 1,
2.06583, -0.02805381, 1.659781, 1, 1, 1, 1, 1,
2.083982, -0.1848718, 2.499332, 1, 1, 1, 1, 1,
2.112314, 0.7446298, 2.199339, 1, 1, 1, 1, 1,
2.120103, 0.5761446, 1.556256, 1, 1, 1, 1, 1,
2.137543, -1.299222, 0.9526832, 1, 1, 1, 1, 1,
2.140512, 0.03130209, 1.486526, 0, 0, 1, 1, 1,
2.168869, -0.544498, 2.602589, 1, 0, 0, 1, 1,
2.175641, 0.2768005, 0.6079636, 1, 0, 0, 1, 1,
2.212231, 0.7839494, 1.382541, 1, 0, 0, 1, 1,
2.227089, -0.3787985, 0.200693, 1, 0, 0, 1, 1,
2.295433, 0.3291081, 0.5452296, 1, 0, 0, 1, 1,
2.31928, 0.411875, 3.888306, 0, 0, 0, 1, 1,
2.354943, -0.008675523, 1.705379, 0, 0, 0, 1, 1,
2.385624, 1.343465, 1.016943, 0, 0, 0, 1, 1,
2.462614, 1.154422, 0.713491, 0, 0, 0, 1, 1,
2.530187, 0.9281618, 2.427083, 0, 0, 0, 1, 1,
2.606813, -1.541959, 1.626851, 0, 0, 0, 1, 1,
2.607403, 1.34266, 2.417642, 0, 0, 0, 1, 1,
2.614459, 0.6968354, 0.01817976, 1, 1, 1, 1, 1,
2.807383, 0.6810702, 3.570649, 1, 1, 1, 1, 1,
2.863292, 0.3933393, 2.53287, 1, 1, 1, 1, 1,
3.164366, 1.084701, 0.6060171, 1, 1, 1, 1, 1,
3.276307, 0.5735727, -1.03721, 1, 1, 1, 1, 1,
3.565484, 2.329055, 1.847315, 1, 1, 1, 1, 1,
3.569932, 0.3118106, 1.079623, 1, 1, 1, 1, 1
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
var radius = 10.14386;
var distance = 35.62988;
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
mvMatrix.translate( -0.3513632, 0.1267948, 0.8056693 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.62988);
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
