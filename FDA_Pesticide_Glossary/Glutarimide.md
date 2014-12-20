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
-3.309332, 0.7951819, -2.335746, 1, 0, 0, 1,
-3.181066, 1.044028, -2.262623, 1, 0.007843138, 0, 1,
-2.909036, -1.967645, -0.2650561, 1, 0.01176471, 0, 1,
-2.698445, -0.04997461, -2.039901, 1, 0.01960784, 0, 1,
-2.636737, 0.464224, -2.018094, 1, 0.02352941, 0, 1,
-2.436435, -2.251735, -2.692349, 1, 0.03137255, 0, 1,
-2.426663, 1.013888, -0.308822, 1, 0.03529412, 0, 1,
-2.317594, -2.505865, -1.861555, 1, 0.04313726, 0, 1,
-2.25022, 0.5520997, 0.4779653, 1, 0.04705882, 0, 1,
-2.134496, -1.242694, -2.12674, 1, 0.05490196, 0, 1,
-2.104488, -2.043673, -1.652225, 1, 0.05882353, 0, 1,
-2.09086, -0.3775887, -1.41868, 1, 0.06666667, 0, 1,
-2.090242, -0.4666596, -1.680624, 1, 0.07058824, 0, 1,
-2.088197, -1.439929, -0.4344808, 1, 0.07843138, 0, 1,
-2.054132, 1.330988, -2.228853, 1, 0.08235294, 0, 1,
-2.042382, 1.176273, -1.525274, 1, 0.09019608, 0, 1,
-2.011997, -0.3876076, -3.18656, 1, 0.09411765, 0, 1,
-1.984914, -0.8460217, -1.9871, 1, 0.1019608, 0, 1,
-1.978912, -0.7524407, 0.3978128, 1, 0.1098039, 0, 1,
-1.931556, 0.1436855, -1.949874, 1, 0.1137255, 0, 1,
-1.913704, -0.7327484, -1.104361, 1, 0.1215686, 0, 1,
-1.912695, -1.502956, -4.181273, 1, 0.1254902, 0, 1,
-1.885262, 0.7587307, 0.4299355, 1, 0.1333333, 0, 1,
-1.838428, -1.146021, -2.378623, 1, 0.1372549, 0, 1,
-1.817574, 0.1157432, -2.662908, 1, 0.145098, 0, 1,
-1.793392, 0.6489085, -0.3523834, 1, 0.1490196, 0, 1,
-1.781296, 0.08934267, -3.065177, 1, 0.1568628, 0, 1,
-1.772339, -1.479041, -1.453264, 1, 0.1607843, 0, 1,
-1.744297, 1.304938, -0.6627365, 1, 0.1686275, 0, 1,
-1.741996, -1.712755, -2.584301, 1, 0.172549, 0, 1,
-1.712939, -1.971485, -3.006732, 1, 0.1803922, 0, 1,
-1.708187, 0.09188835, -1.006187, 1, 0.1843137, 0, 1,
-1.699993, 0.4473415, -2.440794, 1, 0.1921569, 0, 1,
-1.699124, -0.147799, -2.26438, 1, 0.1960784, 0, 1,
-1.691471, 2.314148, 0.5561702, 1, 0.2039216, 0, 1,
-1.66811, 0.8356321, -0.8636316, 1, 0.2117647, 0, 1,
-1.665301, -0.4870636, -1.457188, 1, 0.2156863, 0, 1,
-1.660799, -0.4316178, -1.383947, 1, 0.2235294, 0, 1,
-1.659355, -1.392816, -2.128373, 1, 0.227451, 0, 1,
-1.659203, -1.120277, -1.62869, 1, 0.2352941, 0, 1,
-1.656234, -0.4669631, -1.224883, 1, 0.2392157, 0, 1,
-1.645046, 0.5731469, -1.92664, 1, 0.2470588, 0, 1,
-1.623027, -1.052419, -3.057014, 1, 0.2509804, 0, 1,
-1.620332, -0.2708504, -1.73509, 1, 0.2588235, 0, 1,
-1.613697, 0.5804955, 0.8258663, 1, 0.2627451, 0, 1,
-1.610465, 0.489131, -2.841854, 1, 0.2705882, 0, 1,
-1.603079, -0.5515978, -1.731387, 1, 0.2745098, 0, 1,
-1.596497, -1.558453, -2.663562, 1, 0.282353, 0, 1,
-1.59401, -0.8315252, -2.25332, 1, 0.2862745, 0, 1,
-1.585176, 0.7067943, -1.79087, 1, 0.2941177, 0, 1,
-1.540265, 0.9576818, -2.283143, 1, 0.3019608, 0, 1,
-1.53583, 0.2095684, -1.887009, 1, 0.3058824, 0, 1,
-1.501164, -0.9284335, -1.628647, 1, 0.3137255, 0, 1,
-1.498065, 0.1777598, 0.5485718, 1, 0.3176471, 0, 1,
-1.485662, 0.4900149, -0.3302711, 1, 0.3254902, 0, 1,
-1.468589, -0.1877474, -1.13321, 1, 0.3294118, 0, 1,
-1.468454, -0.7096341, -1.290455, 1, 0.3372549, 0, 1,
-1.462025, 0.4461174, -1.581173, 1, 0.3411765, 0, 1,
-1.45687, 0.852647, -1.313909, 1, 0.3490196, 0, 1,
-1.455615, 1.02736, -1.152951, 1, 0.3529412, 0, 1,
-1.455191, -0.622234, 0.8283041, 1, 0.3607843, 0, 1,
-1.455146, -0.006664379, -2.310579, 1, 0.3647059, 0, 1,
-1.434284, 1.122378, -1.13597, 1, 0.372549, 0, 1,
-1.426811, -0.5684106, 0.04751277, 1, 0.3764706, 0, 1,
-1.42068, 0.3450045, -2.000973, 1, 0.3843137, 0, 1,
-1.420067, 0.5138826, -3.206574, 1, 0.3882353, 0, 1,
-1.418707, -0.59705, -1.747452, 1, 0.3960784, 0, 1,
-1.418662, 0.5181334, -0.4760031, 1, 0.4039216, 0, 1,
-1.414632, 1.670109, 0.06211064, 1, 0.4078431, 0, 1,
-1.40931, -0.3808076, -3.098098, 1, 0.4156863, 0, 1,
-1.405682, -1.755251, -0.7996961, 1, 0.4196078, 0, 1,
-1.404699, -1.176635, -2.867492, 1, 0.427451, 0, 1,
-1.395524, 2.142483, 0.1321081, 1, 0.4313726, 0, 1,
-1.394577, 0.2709249, -1.626158, 1, 0.4392157, 0, 1,
-1.378971, -0.172043, -0.3486379, 1, 0.4431373, 0, 1,
-1.371759, -0.5522442, -2.031808, 1, 0.4509804, 0, 1,
-1.360472, -0.05882772, -1.651669, 1, 0.454902, 0, 1,
-1.345418, 1.42556, -1.848288, 1, 0.4627451, 0, 1,
-1.343661, 0.4151928, -1.32899, 1, 0.4666667, 0, 1,
-1.341481, 1.317549, 1.488274, 1, 0.4745098, 0, 1,
-1.329409, -0.5158005, -2.042398, 1, 0.4784314, 0, 1,
-1.329262, -1.192912, -1.571441, 1, 0.4862745, 0, 1,
-1.320424, -0.4804901, -2.390828, 1, 0.4901961, 0, 1,
-1.320137, -1.800471, -2.547138, 1, 0.4980392, 0, 1,
-1.31169, -2.160267, -2.526988, 1, 0.5058824, 0, 1,
-1.296869, -0.8426121, -2.525127, 1, 0.509804, 0, 1,
-1.28787, -1.360104, -3.019154, 1, 0.5176471, 0, 1,
-1.28354, -0.4889513, -0.3008612, 1, 0.5215687, 0, 1,
-1.283258, 0.6649944, -1.272956, 1, 0.5294118, 0, 1,
-1.27235, 1.975584, -1.664112, 1, 0.5333334, 0, 1,
-1.270742, 2.813796, 0.955247, 1, 0.5411765, 0, 1,
-1.252643, 1.195951, -0.397882, 1, 0.5450981, 0, 1,
-1.226027, 1.475184, -1.167294, 1, 0.5529412, 0, 1,
-1.214429, 0.7903375, -0.1612842, 1, 0.5568628, 0, 1,
-1.202052, 0.3278039, -1.698362, 1, 0.5647059, 0, 1,
-1.199424, 2.535074, -0.652047, 1, 0.5686275, 0, 1,
-1.189813, -0.3429995, -3.041563, 1, 0.5764706, 0, 1,
-1.184934, 0.454162, -0.1071605, 1, 0.5803922, 0, 1,
-1.184575, -0.4554638, -2.77225, 1, 0.5882353, 0, 1,
-1.181112, 2.015175, -2.80301, 1, 0.5921569, 0, 1,
-1.181085, 0.245577, -2.399234, 1, 0.6, 0, 1,
-1.167464, -0.08423082, -1.415023, 1, 0.6078432, 0, 1,
-1.16523, -0.629896, -2.63258, 1, 0.6117647, 0, 1,
-1.162566, -0.09228187, -2.246221, 1, 0.6196079, 0, 1,
-1.161412, 0.3142276, -1.663476, 1, 0.6235294, 0, 1,
-1.158896, -0.1758692, -1.775037, 1, 0.6313726, 0, 1,
-1.15762, 0.3909333, -0.7134601, 1, 0.6352941, 0, 1,
-1.143423, -0.6189858, -1.063743, 1, 0.6431373, 0, 1,
-1.134881, -0.4325489, -2.635979, 1, 0.6470588, 0, 1,
-1.134728, 0.9181045, -2.936293, 1, 0.654902, 0, 1,
-1.128724, 0.8425588, -0.5401455, 1, 0.6588235, 0, 1,
-1.128101, 0.7762395, -2.314296, 1, 0.6666667, 0, 1,
-1.125486, 1.234205, -2.597764, 1, 0.6705883, 0, 1,
-1.12243, 0.1334712, -2.65131, 1, 0.6784314, 0, 1,
-1.121452, -0.7955024, -1.768571, 1, 0.682353, 0, 1,
-1.120686, 0.02319983, -1.635061, 1, 0.6901961, 0, 1,
-1.115769, -0.06714634, -1.952217, 1, 0.6941177, 0, 1,
-1.114634, -0.3895604, -2.104123, 1, 0.7019608, 0, 1,
-1.112018, 1.088599, -0.02943953, 1, 0.7098039, 0, 1,
-1.111001, 1.0898, -1.388468, 1, 0.7137255, 0, 1,
-1.103791, 0.8616505, -0.06885772, 1, 0.7215686, 0, 1,
-1.102123, -1.988106, -1.191655, 1, 0.7254902, 0, 1,
-1.09318, 0.4098814, -0.7266964, 1, 0.7333333, 0, 1,
-1.091468, -0.08470692, -1.817056, 1, 0.7372549, 0, 1,
-1.087002, -0.9938771, -1.776999, 1, 0.7450981, 0, 1,
-1.082828, 0.8657835, -0.6084459, 1, 0.7490196, 0, 1,
-1.081678, -1.862081, -2.117192, 1, 0.7568628, 0, 1,
-1.078328, 0.5637926, 0.3963133, 1, 0.7607843, 0, 1,
-1.077645, 1.173338, 1.290596, 1, 0.7686275, 0, 1,
-1.075505, -0.1820646, -3.062313, 1, 0.772549, 0, 1,
-1.069189, -0.0981365, -0.9762226, 1, 0.7803922, 0, 1,
-1.0656, 2.539019, -0.2407941, 1, 0.7843137, 0, 1,
-1.063313, 2.631065, -0.7475944, 1, 0.7921569, 0, 1,
-1.058799, 1.050672, 0.09553169, 1, 0.7960784, 0, 1,
-1.058038, -1.377833, -1.791335, 1, 0.8039216, 0, 1,
-1.047796, -0.4560471, -2.252833, 1, 0.8117647, 0, 1,
-1.045691, 1.037279, -0.8642162, 1, 0.8156863, 0, 1,
-1.043071, -0.3565938, -0.8546115, 1, 0.8235294, 0, 1,
-1.042917, -1.278801, -3.08461, 1, 0.827451, 0, 1,
-1.039183, 0.3069847, -0.6334491, 1, 0.8352941, 0, 1,
-1.032716, 0.9157708, 0.06517287, 1, 0.8392157, 0, 1,
-1.023584, -0.2313625, -0.6641867, 1, 0.8470588, 0, 1,
-1.021957, 1.242619, -0.2541496, 1, 0.8509804, 0, 1,
-1.017344, -1.389756, -2.308087, 1, 0.8588235, 0, 1,
-1.014073, 1.550871, -1.456, 1, 0.8627451, 0, 1,
-1.014063, 0.1300557, -1.42242, 1, 0.8705882, 0, 1,
-1.013846, -1.360104, -0.4367563, 1, 0.8745098, 0, 1,
-1.000967, -3.002063, -4.066641, 1, 0.8823529, 0, 1,
-0.9968749, 0.6796849, 0.1799541, 1, 0.8862745, 0, 1,
-0.9815907, -1.279573, -4.029018, 1, 0.8941177, 0, 1,
-0.9717825, -0.9613198, -3.657373, 1, 0.8980392, 0, 1,
-0.9712837, 0.5831861, -3.176736, 1, 0.9058824, 0, 1,
-0.9641156, -0.8310497, -1.729932, 1, 0.9137255, 0, 1,
-0.9592735, 0.7510036, -0.5493498, 1, 0.9176471, 0, 1,
-0.9590986, -0.959148, -1.678489, 1, 0.9254902, 0, 1,
-0.9552707, -0.2219012, -0.9755681, 1, 0.9294118, 0, 1,
-0.9520483, -0.3959177, -3.267287, 1, 0.9372549, 0, 1,
-0.9503313, 0.5286584, -0.3448714, 1, 0.9411765, 0, 1,
-0.9496011, -0.6647682, -2.335473, 1, 0.9490196, 0, 1,
-0.9452645, 0.5772357, 0.1911654, 1, 0.9529412, 0, 1,
-0.9445366, -2.045904, -2.240648, 1, 0.9607843, 0, 1,
-0.9438105, -0.1560398, -1.442952, 1, 0.9647059, 0, 1,
-0.9433826, -0.4813074, -1.59068, 1, 0.972549, 0, 1,
-0.9341676, 0.09005978, -2.074922, 1, 0.9764706, 0, 1,
-0.9337311, -0.6107854, -1.71836, 1, 0.9843137, 0, 1,
-0.9319689, 0.3654394, -3.763453, 1, 0.9882353, 0, 1,
-0.9317183, -0.7391478, -1.322886, 1, 0.9960784, 0, 1,
-0.9303579, -0.899082, -2.976727, 0.9960784, 1, 0, 1,
-0.9272893, 0.3070895, -1.06004, 0.9921569, 1, 0, 1,
-0.9196433, -1.091716, -0.5925251, 0.9843137, 1, 0, 1,
-0.9175211, 0.2309959, -2.704754, 0.9803922, 1, 0, 1,
-0.9105281, -0.429287, -2.750602, 0.972549, 1, 0, 1,
-0.9091871, -1.141492, -3.634161, 0.9686275, 1, 0, 1,
-0.9033118, -0.8336613, -1.518921, 0.9607843, 1, 0, 1,
-0.9017454, -1.247065, -3.058359, 0.9568627, 1, 0, 1,
-0.899834, 0.6009238, -1.956058, 0.9490196, 1, 0, 1,
-0.8988413, -1.750696, -3.420888, 0.945098, 1, 0, 1,
-0.8975885, 0.4199749, -0.6358554, 0.9372549, 1, 0, 1,
-0.8969946, -1.71367, -1.920676, 0.9333333, 1, 0, 1,
-0.8772665, -0.3911379, -2.828508, 0.9254902, 1, 0, 1,
-0.8739596, -0.6282603, -0.7983698, 0.9215686, 1, 0, 1,
-0.8646582, -0.5083257, -1.908579, 0.9137255, 1, 0, 1,
-0.8579288, -0.5797745, 0.06517528, 0.9098039, 1, 0, 1,
-0.8525056, -0.5474862, -1.306005, 0.9019608, 1, 0, 1,
-0.8516149, 1.32773, -0.9961411, 0.8941177, 1, 0, 1,
-0.8509467, 0.9013675, 1.48415, 0.8901961, 1, 0, 1,
-0.8503121, -1.275391, -2.898101, 0.8823529, 1, 0, 1,
-0.8454818, -0.7466547, 0.08303063, 0.8784314, 1, 0, 1,
-0.8435374, 1.04117, -0.7083008, 0.8705882, 1, 0, 1,
-0.8430968, 0.6319922, -2.085184, 0.8666667, 1, 0, 1,
-0.8389185, 1.469461, -1.003028, 0.8588235, 1, 0, 1,
-0.8331213, 0.6493388, -2.942003, 0.854902, 1, 0, 1,
-0.8296555, -0.676291, -2.690945, 0.8470588, 1, 0, 1,
-0.8238378, -0.4853415, -3.034691, 0.8431373, 1, 0, 1,
-0.8233024, -1.182313, -1.516482, 0.8352941, 1, 0, 1,
-0.8175157, 1.078737, -0.741488, 0.8313726, 1, 0, 1,
-0.8134696, 0.6867778, -0.7682814, 0.8235294, 1, 0, 1,
-0.8128669, 0.8531488, -0.133147, 0.8196079, 1, 0, 1,
-0.812726, -1.440065, -2.745282, 0.8117647, 1, 0, 1,
-0.8105538, 0.3342383, 0.7201159, 0.8078431, 1, 0, 1,
-0.8090534, -0.5350047, -2.886905, 0.8, 1, 0, 1,
-0.80519, -0.1287147, -0.7255601, 0.7921569, 1, 0, 1,
-0.8016642, 0.3093696, -3.2153, 0.7882353, 1, 0, 1,
-0.7979219, 0.3972421, -0.7046545, 0.7803922, 1, 0, 1,
-0.7977673, -0.2749628, -1.208846, 0.7764706, 1, 0, 1,
-0.7954157, 0.5984614, -0.8509964, 0.7686275, 1, 0, 1,
-0.790201, 0.462254, -1.300535, 0.7647059, 1, 0, 1,
-0.7839008, 0.3755288, -2.205034, 0.7568628, 1, 0, 1,
-0.7810348, 1.941661, -0.7474573, 0.7529412, 1, 0, 1,
-0.7773061, -0.6918837, -2.134235, 0.7450981, 1, 0, 1,
-0.775288, -0.08917033, -1.619476, 0.7411765, 1, 0, 1,
-0.7738258, 0.2464427, -0.1888034, 0.7333333, 1, 0, 1,
-0.7708275, 0.3323793, -1.126833, 0.7294118, 1, 0, 1,
-0.7578313, -1.366325, -1.139859, 0.7215686, 1, 0, 1,
-0.7564345, -0.8697668, -2.118687, 0.7176471, 1, 0, 1,
-0.7528992, 1.218767, -0.5802394, 0.7098039, 1, 0, 1,
-0.7489565, 0.4378824, -1.657054, 0.7058824, 1, 0, 1,
-0.7460338, -0.09365379, 0.09083251, 0.6980392, 1, 0, 1,
-0.7449638, 0.8101822, -1.250061, 0.6901961, 1, 0, 1,
-0.7405673, -0.5425736, -3.027818, 0.6862745, 1, 0, 1,
-0.7366613, 0.672025, -1.058325, 0.6784314, 1, 0, 1,
-0.7363526, 2.005824, 0.1942411, 0.6745098, 1, 0, 1,
-0.7350407, 1.298885, -0.6889722, 0.6666667, 1, 0, 1,
-0.7346693, -0.3361859, -1.913784, 0.6627451, 1, 0, 1,
-0.7319432, 0.8732132, -1.515319, 0.654902, 1, 0, 1,
-0.7230821, -0.8161135, -1.356608, 0.6509804, 1, 0, 1,
-0.7222484, -1.612609, -2.384293, 0.6431373, 1, 0, 1,
-0.7184727, 0.2740631, -1.753211, 0.6392157, 1, 0, 1,
-0.7130644, 1.346829, 0.3230065, 0.6313726, 1, 0, 1,
-0.7096493, -1.058329, -0.8710487, 0.627451, 1, 0, 1,
-0.7077, -0.5407209, -2.496374, 0.6196079, 1, 0, 1,
-0.7073342, -0.3821963, -2.360457, 0.6156863, 1, 0, 1,
-0.7004037, 0.7524413, -1.410019, 0.6078432, 1, 0, 1,
-0.7002155, 1.152663, 0.005632503, 0.6039216, 1, 0, 1,
-0.6984634, -1.430165, -3.641881, 0.5960785, 1, 0, 1,
-0.690428, -0.5269181, -2.514416, 0.5882353, 1, 0, 1,
-0.6900645, -0.2704015, -2.894845, 0.5843138, 1, 0, 1,
-0.6878642, -0.693307, -2.184985, 0.5764706, 1, 0, 1,
-0.6874362, -0.8792025, -1.883445, 0.572549, 1, 0, 1,
-0.6864017, 0.8976334, -0.8498074, 0.5647059, 1, 0, 1,
-0.6835918, -0.4183772, -2.747926, 0.5607843, 1, 0, 1,
-0.6835712, -0.7348221, -1.109185, 0.5529412, 1, 0, 1,
-0.6711802, -0.1075415, -2.39321, 0.5490196, 1, 0, 1,
-0.6655153, 0.3845579, 1.933004, 0.5411765, 1, 0, 1,
-0.6564597, 1.284232, 1.405065, 0.5372549, 1, 0, 1,
-0.6522433, -0.1161453, -2.813946, 0.5294118, 1, 0, 1,
-0.6501728, 0.7922927, -1.99782, 0.5254902, 1, 0, 1,
-0.6485354, 0.4795563, -2.619146, 0.5176471, 1, 0, 1,
-0.6461818, 0.9332819, -0.5923979, 0.5137255, 1, 0, 1,
-0.6382948, 1.541977, -0.2935052, 0.5058824, 1, 0, 1,
-0.6373703, -1.210644, -3.573795, 0.5019608, 1, 0, 1,
-0.6257237, 1.505863, 0.2832728, 0.4941176, 1, 0, 1,
-0.6230332, 0.5750406, 0.3267717, 0.4862745, 1, 0, 1,
-0.6190385, 1.713156, -0.5631136, 0.4823529, 1, 0, 1,
-0.6188945, -0.4433283, -2.290692, 0.4745098, 1, 0, 1,
-0.6162826, 1.027636, -1.202987, 0.4705882, 1, 0, 1,
-0.6122919, -1.061042, -2.831284, 0.4627451, 1, 0, 1,
-0.6114021, -0.2023844, -1.872722, 0.4588235, 1, 0, 1,
-0.6108824, 0.1904581, -0.6617236, 0.4509804, 1, 0, 1,
-0.5971233, -1.499439, -1.687309, 0.4470588, 1, 0, 1,
-0.5960476, -1.279011, -2.556648, 0.4392157, 1, 0, 1,
-0.5911574, 0.4885231, 0.8264132, 0.4352941, 1, 0, 1,
-0.5873767, 0.7415708, -0.1683491, 0.427451, 1, 0, 1,
-0.5820647, 1.035458, -0.1037355, 0.4235294, 1, 0, 1,
-0.5809238, -0.4141465, -2.626367, 0.4156863, 1, 0, 1,
-0.5774912, -1.144411, -1.970364, 0.4117647, 1, 0, 1,
-0.5772572, 1.262939, -0.4543057, 0.4039216, 1, 0, 1,
-0.5751926, 2.067376, -1.169131, 0.3960784, 1, 0, 1,
-0.574894, -0.5449912, -2.650008, 0.3921569, 1, 0, 1,
-0.5738123, -0.2143992, -0.9873838, 0.3843137, 1, 0, 1,
-0.5691311, -1.55765, -2.25435, 0.3803922, 1, 0, 1,
-0.5690245, -0.1546515, -3.363396, 0.372549, 1, 0, 1,
-0.5688469, 1.335411, -1.441326, 0.3686275, 1, 0, 1,
-0.5686166, 1.198438, -1.378312, 0.3607843, 1, 0, 1,
-0.5683497, 1.209659, -0.05835922, 0.3568628, 1, 0, 1,
-0.5640392, 0.06501194, -1.183812, 0.3490196, 1, 0, 1,
-0.5610016, 1.040454, -1.494165, 0.345098, 1, 0, 1,
-0.5604001, 0.17775, -1.228346, 0.3372549, 1, 0, 1,
-0.5531892, -1.136271, -2.472175, 0.3333333, 1, 0, 1,
-0.550923, -0.2900766, -0.485079, 0.3254902, 1, 0, 1,
-0.5465169, -0.8519014, -4.367106, 0.3215686, 1, 0, 1,
-0.5460138, -0.1753531, -2.540294, 0.3137255, 1, 0, 1,
-0.5443241, 2.551659, -0.9209079, 0.3098039, 1, 0, 1,
-0.5435861, 0.6212431, -1.271946, 0.3019608, 1, 0, 1,
-0.5427036, -1.28773, -1.872154, 0.2941177, 1, 0, 1,
-0.5409755, 0.6189435, -1.944154, 0.2901961, 1, 0, 1,
-0.5407878, -0.7833046, -1.678753, 0.282353, 1, 0, 1,
-0.540011, 0.8990478, -0.4827742, 0.2784314, 1, 0, 1,
-0.5352192, -2.313329, -4.073874, 0.2705882, 1, 0, 1,
-0.5288389, 0.1273721, -1.511261, 0.2666667, 1, 0, 1,
-0.5283241, -0.1323792, -2.501525, 0.2588235, 1, 0, 1,
-0.5228794, -0.1527746, -1.754966, 0.254902, 1, 0, 1,
-0.5168167, 0.9614364, -1.203536, 0.2470588, 1, 0, 1,
-0.515642, -0.5115901, -0.8320385, 0.2431373, 1, 0, 1,
-0.511916, 0.7791911, 0.04036483, 0.2352941, 1, 0, 1,
-0.5086286, -1.484509, -4.302836, 0.2313726, 1, 0, 1,
-0.507606, 0.4129361, -0.7921456, 0.2235294, 1, 0, 1,
-0.5048606, 0.4626516, 0.1824242, 0.2196078, 1, 0, 1,
-0.5022947, -0.9266943, -3.228498, 0.2117647, 1, 0, 1,
-0.4987212, -0.9763128, -2.039785, 0.2078431, 1, 0, 1,
-0.4956611, 0.1069869, -3.156789, 0.2, 1, 0, 1,
-0.4948505, -0.02822053, -2.779807, 0.1921569, 1, 0, 1,
-0.4940344, 1.520525, 0.1106982, 0.1882353, 1, 0, 1,
-0.487437, -0.3744994, -1.205512, 0.1803922, 1, 0, 1,
-0.4860516, -1.200246, -0.228477, 0.1764706, 1, 0, 1,
-0.4858714, 0.4989918, -1.377927, 0.1686275, 1, 0, 1,
-0.4817546, -0.4924942, -3.533732, 0.1647059, 1, 0, 1,
-0.4793974, -1.723117, -2.360172, 0.1568628, 1, 0, 1,
-0.4757022, -0.6120719, -3.566028, 0.1529412, 1, 0, 1,
-0.4735826, 0.6052199, 0.9711502, 0.145098, 1, 0, 1,
-0.4585054, -1.084191, -3.0908, 0.1411765, 1, 0, 1,
-0.4576287, 0.09892187, -1.84391, 0.1333333, 1, 0, 1,
-0.4530947, 1.08897, -0.0686949, 0.1294118, 1, 0, 1,
-0.4516351, 0.3506258, -1.769629, 0.1215686, 1, 0, 1,
-0.4512885, -2.049911, -2.296943, 0.1176471, 1, 0, 1,
-0.451021, -1.380663, -2.378284, 0.1098039, 1, 0, 1,
-0.4488093, 1.050233, -1.34965, 0.1058824, 1, 0, 1,
-0.4466171, -1.226914, -1.989867, 0.09803922, 1, 0, 1,
-0.4426067, -0.7805284, -4.043088, 0.09019608, 1, 0, 1,
-0.4413877, 0.1438811, -0.08380739, 0.08627451, 1, 0, 1,
-0.4408784, -1.246939, -3.53505, 0.07843138, 1, 0, 1,
-0.4373558, 0.2036533, -0.9484112, 0.07450981, 1, 0, 1,
-0.4357552, -0.683965, -0.8621489, 0.06666667, 1, 0, 1,
-0.4344683, 0.250042, 0.1360811, 0.0627451, 1, 0, 1,
-0.4250606, 0.6750971, 0.1938885, 0.05490196, 1, 0, 1,
-0.4238817, 0.1825601, -3.602635, 0.05098039, 1, 0, 1,
-0.4136751, 1.247423, -0.7557194, 0.04313726, 1, 0, 1,
-0.4116424, 0.2353031, -1.419936, 0.03921569, 1, 0, 1,
-0.4098525, 0.541132, -0.09273225, 0.03137255, 1, 0, 1,
-0.4087591, 1.209467, -2.041569, 0.02745098, 1, 0, 1,
-0.4073844, 0.1657717, -0.01342585, 0.01960784, 1, 0, 1,
-0.4070257, -0.6225576, -3.787444, 0.01568628, 1, 0, 1,
-0.4061857, 0.4440443, -1.435295, 0.007843138, 1, 0, 1,
-0.4007645, -0.2983421, -2.104119, 0.003921569, 1, 0, 1,
-0.3987206, -1.016023, -2.807521, 0, 1, 0.003921569, 1,
-0.3984274, 0.8192309, 1.067825, 0, 1, 0.01176471, 1,
-0.3972363, 0.07569841, -1.948556, 0, 1, 0.01568628, 1,
-0.3943669, 0.5727847, -1.867319, 0, 1, 0.02352941, 1,
-0.3919206, 0.2705075, 0.6795698, 0, 1, 0.02745098, 1,
-0.3897506, 1.75359, 0.7709336, 0, 1, 0.03529412, 1,
-0.385248, -0.3637507, -2.647137, 0, 1, 0.03921569, 1,
-0.3842324, -0.8626291, -1.512403, 0, 1, 0.04705882, 1,
-0.379617, -2.10705, -4.450154, 0, 1, 0.05098039, 1,
-0.3777154, -2.549423, -4.186135, 0, 1, 0.05882353, 1,
-0.3734528, -1.121916, -1.522527, 0, 1, 0.0627451, 1,
-0.3727886, 0.3819667, -2.426888, 0, 1, 0.07058824, 1,
-0.371235, 0.1663733, -0.4010047, 0, 1, 0.07450981, 1,
-0.3696885, 0.1044604, -1.970955, 0, 1, 0.08235294, 1,
-0.3674456, -1.162634, -1.621551, 0, 1, 0.08627451, 1,
-0.366892, -2.286466, -3.541185, 0, 1, 0.09411765, 1,
-0.3612871, -1.921058, -4.994453, 0, 1, 0.1019608, 1,
-0.3603317, -2.257769, -3.332572, 0, 1, 0.1058824, 1,
-0.3593016, -0.5811138, -3.55256, 0, 1, 0.1137255, 1,
-0.3578574, -1.6393, -1.632801, 0, 1, 0.1176471, 1,
-0.3561704, 1.318969, -0.2944348, 0, 1, 0.1254902, 1,
-0.3560904, -0.4266112, -1.719934, 0, 1, 0.1294118, 1,
-0.3544197, 0.2251551, -0.5719681, 0, 1, 0.1372549, 1,
-0.3528939, -0.7681819, -2.405194, 0, 1, 0.1411765, 1,
-0.3479755, 1.124336, 0.1856535, 0, 1, 0.1490196, 1,
-0.3476802, 0.3021766, -0.1473373, 0, 1, 0.1529412, 1,
-0.3450466, 1.051246, 0.3782408, 0, 1, 0.1607843, 1,
-0.3358161, 0.400614, -0.8271931, 0, 1, 0.1647059, 1,
-0.3348998, 0.7257405, 1.311979, 0, 1, 0.172549, 1,
-0.3333654, -0.150694, -3.231143, 0, 1, 0.1764706, 1,
-0.3288758, -1.175445, -2.579506, 0, 1, 0.1843137, 1,
-0.3246422, -0.100794, -2.637827, 0, 1, 0.1882353, 1,
-0.324264, -1.812898, -2.444566, 0, 1, 0.1960784, 1,
-0.323868, -0.6630312, -2.715844, 0, 1, 0.2039216, 1,
-0.3206038, -0.7986989, -2.398812, 0, 1, 0.2078431, 1,
-0.3198168, 0.108176, -4.34985, 0, 1, 0.2156863, 1,
-0.3195679, -1.009724, -2.491956, 0, 1, 0.2196078, 1,
-0.3082142, 0.5454876, -1.84201, 0, 1, 0.227451, 1,
-0.3071516, -2.004384, -3.659009, 0, 1, 0.2313726, 1,
-0.3067339, 1.134638, 0.2486803, 0, 1, 0.2392157, 1,
-0.3046204, -1.900895, -5.373477, 0, 1, 0.2431373, 1,
-0.304137, 1.626894, -1.076792, 0, 1, 0.2509804, 1,
-0.2980332, -0.8495164, -3.163169, 0, 1, 0.254902, 1,
-0.2972335, -0.7636186, -4.504613, 0, 1, 0.2627451, 1,
-0.296682, -2.451145, -2.305269, 0, 1, 0.2666667, 1,
-0.2950395, 0.1759741, -0.2475295, 0, 1, 0.2745098, 1,
-0.2930832, -0.3058096, -2.598292, 0, 1, 0.2784314, 1,
-0.2897855, 0.0141371, -1.222512, 0, 1, 0.2862745, 1,
-0.2890271, -0.5637135, -1.668301, 0, 1, 0.2901961, 1,
-0.2871559, -1.948343, -3.87145, 0, 1, 0.2980392, 1,
-0.2867976, 0.627483, -1.405572, 0, 1, 0.3058824, 1,
-0.2854735, 0.37489, -0.9376348, 0, 1, 0.3098039, 1,
-0.283172, 0.6397823, -1.237772, 0, 1, 0.3176471, 1,
-0.2807358, 0.4809271, 0.3572933, 0, 1, 0.3215686, 1,
-0.2793314, 0.6448292, -3.275311, 0, 1, 0.3294118, 1,
-0.2779116, 0.7347608, 1.389849, 0, 1, 0.3333333, 1,
-0.2769211, -0.3928834, -0.5418678, 0, 1, 0.3411765, 1,
-0.2741171, 1.124243, -0.679274, 0, 1, 0.345098, 1,
-0.2702882, 1.219608, -0.4993529, 0, 1, 0.3529412, 1,
-0.2674122, 0.1315559, -1.218449, 0, 1, 0.3568628, 1,
-0.2668959, -1.845736, -3.128435, 0, 1, 0.3647059, 1,
-0.2662459, -0.6748673, -3.2722, 0, 1, 0.3686275, 1,
-0.2620915, 0.1159574, -2.750771, 0, 1, 0.3764706, 1,
-0.2596508, -1.604787, -6.751009, 0, 1, 0.3803922, 1,
-0.2595497, 0.4867925, -1.680898, 0, 1, 0.3882353, 1,
-0.2585265, 2.005434, 0.3509674, 0, 1, 0.3921569, 1,
-0.254969, 0.07334936, -0.2349058, 0, 1, 0.4, 1,
-0.2520251, -1.149672, -2.293788, 0, 1, 0.4078431, 1,
-0.2492647, -0.5727005, -3.374465, 0, 1, 0.4117647, 1,
-0.2482222, 0.4547354, 1.151674, 0, 1, 0.4196078, 1,
-0.2402994, 0.5251614, 1.286171, 0, 1, 0.4235294, 1,
-0.2368715, -0.4199297, -2.86506, 0, 1, 0.4313726, 1,
-0.2356041, 1.531807, 0.6599011, 0, 1, 0.4352941, 1,
-0.2340584, 1.342081, -0.9914619, 0, 1, 0.4431373, 1,
-0.2331136, -1.499556, -2.331702, 0, 1, 0.4470588, 1,
-0.2324176, 2.060436, -0.05129178, 0, 1, 0.454902, 1,
-0.2319046, -0.1249048, -0.3641836, 0, 1, 0.4588235, 1,
-0.2305265, -0.8554, -0.9334264, 0, 1, 0.4666667, 1,
-0.2285848, -0.3483786, -3.086713, 0, 1, 0.4705882, 1,
-0.2285514, 0.8698998, -0.2200469, 0, 1, 0.4784314, 1,
-0.2283901, -2.312307, -5.100252, 0, 1, 0.4823529, 1,
-0.2277101, -0.1240555, -2.707738, 0, 1, 0.4901961, 1,
-0.2245073, -0.9252959, -4.182143, 0, 1, 0.4941176, 1,
-0.2218102, -0.1188037, -0.8351325, 0, 1, 0.5019608, 1,
-0.2166972, -2.171039, -2.60831, 0, 1, 0.509804, 1,
-0.2148398, -0.7455503, -1.600843, 0, 1, 0.5137255, 1,
-0.2122291, -0.1140781, -3.890699, 0, 1, 0.5215687, 1,
-0.212225, -0.04898196, -1.773007, 0, 1, 0.5254902, 1,
-0.2120588, 0.3367178, -1.250968, 0, 1, 0.5333334, 1,
-0.2112873, -0.160077, -1.403886, 0, 1, 0.5372549, 1,
-0.2035666, 0.2713074, -1.159163, 0, 1, 0.5450981, 1,
-0.1987544, -0.7738923, -4.693866, 0, 1, 0.5490196, 1,
-0.1977071, 1.625914, 0.5629074, 0, 1, 0.5568628, 1,
-0.193758, 0.05527193, -0.0995135, 0, 1, 0.5607843, 1,
-0.1930182, 1.086043, 0.2854825, 0, 1, 0.5686275, 1,
-0.1915265, 0.006565277, -0.2836345, 0, 1, 0.572549, 1,
-0.1899123, 0.02722796, -1.75033, 0, 1, 0.5803922, 1,
-0.1844517, -0.755263, -1.757174, 0, 1, 0.5843138, 1,
-0.1825226, -0.1125249, -1.846847, 0, 1, 0.5921569, 1,
-0.1823106, 0.06049917, -0.8173464, 0, 1, 0.5960785, 1,
-0.1672812, 0.4013596, -0.03583795, 0, 1, 0.6039216, 1,
-0.162763, -0.3360633, -1.729376, 0, 1, 0.6117647, 1,
-0.1599195, -1.491468, -1.985443, 0, 1, 0.6156863, 1,
-0.1575317, 1.545399, 0.3796228, 0, 1, 0.6235294, 1,
-0.1571243, 0.174938, -0.4435431, 0, 1, 0.627451, 1,
-0.1552028, -0.1122564, -1.433564, 0, 1, 0.6352941, 1,
-0.1528818, -0.6253259, -2.114991, 0, 1, 0.6392157, 1,
-0.1492635, -0.3242649, -2.465729, 0, 1, 0.6470588, 1,
-0.1442692, -0.7227057, -3.389407, 0, 1, 0.6509804, 1,
-0.1424717, 0.6482207, -1.153713, 0, 1, 0.6588235, 1,
-0.1385258, -0.5654547, -2.120416, 0, 1, 0.6627451, 1,
-0.1358436, -0.6280037, -2.654721, 0, 1, 0.6705883, 1,
-0.1310673, 0.210061, -0.07588328, 0, 1, 0.6745098, 1,
-0.1294836, -0.6879266, -1.950986, 0, 1, 0.682353, 1,
-0.1269727, -0.0482359, -2.577048, 0, 1, 0.6862745, 1,
-0.1267, 0.8537807, -2.068323, 0, 1, 0.6941177, 1,
-0.1248239, -0.04885966, -1.210422, 0, 1, 0.7019608, 1,
-0.1247129, 0.3274365, -1.022433, 0, 1, 0.7058824, 1,
-0.1245342, -0.3717908, -2.957719, 0, 1, 0.7137255, 1,
-0.1220514, -1.123759, -2.926282, 0, 1, 0.7176471, 1,
-0.1204249, -0.6791667, -0.1347377, 0, 1, 0.7254902, 1,
-0.1169155, -1.924416, -2.434656, 0, 1, 0.7294118, 1,
-0.1146886, 0.8997038, 0.06991938, 0, 1, 0.7372549, 1,
-0.1138958, -0.6059809, -1.881091, 0, 1, 0.7411765, 1,
-0.1124539, 1.343788, 0.6413589, 0, 1, 0.7490196, 1,
-0.1068985, -1.042889, -3.970242, 0, 1, 0.7529412, 1,
-0.1036394, -1.277254, -4.397323, 0, 1, 0.7607843, 1,
-0.09638402, 1.189478, 0.1315398, 0, 1, 0.7647059, 1,
-0.09530224, 0.9833893, -0.01211465, 0, 1, 0.772549, 1,
-0.09506984, 0.6310835, 0.455972, 0, 1, 0.7764706, 1,
-0.09246765, -0.3529664, -3.487976, 0, 1, 0.7843137, 1,
-0.09189633, -0.5229465, -2.393001, 0, 1, 0.7882353, 1,
-0.09101216, 1.201563, 0.6368806, 0, 1, 0.7960784, 1,
-0.09041238, -1.101076, -4.766866, 0, 1, 0.8039216, 1,
-0.0883825, 1.217052, -1.088229, 0, 1, 0.8078431, 1,
-0.08796994, -1.918786, -3.990925, 0, 1, 0.8156863, 1,
-0.08443657, 2.675049, 0.9200591, 0, 1, 0.8196079, 1,
-0.08356995, 0.8157584, 0.8113562, 0, 1, 0.827451, 1,
-0.0817664, 0.2241047, -1.185319, 0, 1, 0.8313726, 1,
-0.0805811, 1.197371, -0.04187158, 0, 1, 0.8392157, 1,
-0.0791797, -0.6452848, -2.94126, 0, 1, 0.8431373, 1,
-0.07368292, -0.1690807, -3.070968, 0, 1, 0.8509804, 1,
-0.06088771, 1.325189, 1.047122, 0, 1, 0.854902, 1,
-0.06080835, 0.1548035, -0.954961, 0, 1, 0.8627451, 1,
-0.06019762, 0.5537574, -0.7071782, 0, 1, 0.8666667, 1,
-0.05141011, -0.5732998, -1.590666, 0, 1, 0.8745098, 1,
-0.04808323, -0.5860355, -4.435624, 0, 1, 0.8784314, 1,
-0.04520245, 1.288581, 0.5220599, 0, 1, 0.8862745, 1,
-0.03803965, 0.8302889, 0.8054585, 0, 1, 0.8901961, 1,
-0.03005154, 0.2748038, 1.611149, 0, 1, 0.8980392, 1,
-0.02251587, -1.045966, -3.007825, 0, 1, 0.9058824, 1,
-0.01626296, -0.6662382, -3.847203, 0, 1, 0.9098039, 1,
-0.01577261, -2.001051, -2.087579, 0, 1, 0.9176471, 1,
-0.01512498, 1.375138, -0.03618145, 0, 1, 0.9215686, 1,
-0.01488347, -0.09182268, -4.635602, 0, 1, 0.9294118, 1,
-0.01378324, -0.4796824, -2.592188, 0, 1, 0.9333333, 1,
-0.01223593, -0.2767544, -3.581522, 0, 1, 0.9411765, 1,
-0.01182971, -1.240889, -3.753498, 0, 1, 0.945098, 1,
-0.005402538, -1.582949, -2.97941, 0, 1, 0.9529412, 1,
-0.00309103, -0.5873014, -4.876241, 0, 1, 0.9568627, 1,
0.006315566, 0.5595862, 0.04000436, 0, 1, 0.9647059, 1,
0.008391992, 0.01106499, 0.3036491, 0, 1, 0.9686275, 1,
0.0102887, -0.3893894, 5.932929, 0, 1, 0.9764706, 1,
0.01114133, 0.5507519, 0.9877394, 0, 1, 0.9803922, 1,
0.01847456, 0.416821, 0.2995899, 0, 1, 0.9882353, 1,
0.02263698, -0.4359803, 2.803447, 0, 1, 0.9921569, 1,
0.02301571, -1.156429, 3.33978, 0, 1, 1, 1,
0.02365142, -1.28493, 3.16511, 0, 0.9921569, 1, 1,
0.0263994, 0.7723286, 2.358478, 0, 0.9882353, 1, 1,
0.02759084, 0.9051102, 0.6784166, 0, 0.9803922, 1, 1,
0.03305753, 0.6553594, -1.08875, 0, 0.9764706, 1, 1,
0.03368736, -2.228578, 2.211095, 0, 0.9686275, 1, 1,
0.03371752, 0.8354535, -0.998523, 0, 0.9647059, 1, 1,
0.04247788, 1.972653, -0.8234994, 0, 0.9568627, 1, 1,
0.04329337, 0.2610851, -0.3932827, 0, 0.9529412, 1, 1,
0.04913565, 0.2176232, -0.2508364, 0, 0.945098, 1, 1,
0.0502561, -0.09962991, 2.512364, 0, 0.9411765, 1, 1,
0.05280754, -0.3675869, 2.212457, 0, 0.9333333, 1, 1,
0.05381971, -1.24649, 2.377784, 0, 0.9294118, 1, 1,
0.05534654, 0.705815, -0.335605, 0, 0.9215686, 1, 1,
0.05667973, 0.2299381, 0.3212253, 0, 0.9176471, 1, 1,
0.06432048, -0.372582, 2.903666, 0, 0.9098039, 1, 1,
0.06488584, 1.617948, -1.390753, 0, 0.9058824, 1, 1,
0.06524911, -0.6274672, 4.028782, 0, 0.8980392, 1, 1,
0.06951997, -0.7301549, 3.696421, 0, 0.8901961, 1, 1,
0.07586483, -0.08625402, 2.086871, 0, 0.8862745, 1, 1,
0.07777958, -1.206655, 4.077531, 0, 0.8784314, 1, 1,
0.08793737, -0.7783313, 3.350919, 0, 0.8745098, 1, 1,
0.0986117, 0.8819318, -1.029245, 0, 0.8666667, 1, 1,
0.1018913, 0.5936856, 0.2593873, 0, 0.8627451, 1, 1,
0.1044164, 0.8844376, 0.7911775, 0, 0.854902, 1, 1,
0.1078071, 0.8415098, -0.7608696, 0, 0.8509804, 1, 1,
0.1078098, 0.5360947, -0.2976127, 0, 0.8431373, 1, 1,
0.1080375, -1.920437, 4.011974, 0, 0.8392157, 1, 1,
0.1100031, -1.603794, 4.203071, 0, 0.8313726, 1, 1,
0.1104558, -2.018249, 4.064096, 0, 0.827451, 1, 1,
0.1124576, 0.6427251, 0.8328497, 0, 0.8196079, 1, 1,
0.1139884, 0.6484123, 0.4108212, 0, 0.8156863, 1, 1,
0.1169163, 0.1349339, 2.163552, 0, 0.8078431, 1, 1,
0.1184215, 1.03953, -0.6382659, 0, 0.8039216, 1, 1,
0.1186648, 1.796778, 1.393406, 0, 0.7960784, 1, 1,
0.1186726, 2.429494, 0.373363, 0, 0.7882353, 1, 1,
0.119571, -1.785296, 2.856108, 0, 0.7843137, 1, 1,
0.1221061, 0.5385745, 0.7780296, 0, 0.7764706, 1, 1,
0.1250854, -1.418575, 2.972286, 0, 0.772549, 1, 1,
0.1260411, -0.121376, 1.966007, 0, 0.7647059, 1, 1,
0.1295583, -0.5338351, 1.869082, 0, 0.7607843, 1, 1,
0.1356104, -0.3177188, 1.882802, 0, 0.7529412, 1, 1,
0.1356316, 0.356291, 0.2636925, 0, 0.7490196, 1, 1,
0.1371061, -1.090147, 1.059254, 0, 0.7411765, 1, 1,
0.139387, 1.367856, -1.645737, 0, 0.7372549, 1, 1,
0.1417972, 0.2362071, -0.2171691, 0, 0.7294118, 1, 1,
0.1420423, -0.3380859, 1.756557, 0, 0.7254902, 1, 1,
0.1422035, 1.268731, 0.9352127, 0, 0.7176471, 1, 1,
0.1453366, -1.420406, 4.150524, 0, 0.7137255, 1, 1,
0.1476764, 0.251822, 1.095861, 0, 0.7058824, 1, 1,
0.1529274, 1.085176, 1.042895, 0, 0.6980392, 1, 1,
0.1536149, -0.5003347, 2.32865, 0, 0.6941177, 1, 1,
0.1574098, 0.9754084, -0.9589767, 0, 0.6862745, 1, 1,
0.1589563, 0.2288906, 1.393329, 0, 0.682353, 1, 1,
0.1603323, 0.7895851, 1.682335, 0, 0.6745098, 1, 1,
0.1612479, 2.453652, 0.04154247, 0, 0.6705883, 1, 1,
0.1658626, 0.7220364, -1.957793, 0, 0.6627451, 1, 1,
0.1689198, -0.09046859, 1.593952, 0, 0.6588235, 1, 1,
0.1763235, 2.094512, -1.090149, 0, 0.6509804, 1, 1,
0.1773032, -2.388354, 4.213525, 0, 0.6470588, 1, 1,
0.1813078, -0.2209728, 0.1048837, 0, 0.6392157, 1, 1,
0.1825764, -0.5039801, 2.263667, 0, 0.6352941, 1, 1,
0.1843969, 1.125875, -1.535396, 0, 0.627451, 1, 1,
0.1859815, 0.1736606, 0.9874907, 0, 0.6235294, 1, 1,
0.1872699, 0.7419807, -0.3141062, 0, 0.6156863, 1, 1,
0.2041656, -1.065803, 2.131175, 0, 0.6117647, 1, 1,
0.205125, -0.5767199, 1.134878, 0, 0.6039216, 1, 1,
0.2093333, 0.1183695, 1.28038, 0, 0.5960785, 1, 1,
0.2099959, 1.161419, 1.349542, 0, 0.5921569, 1, 1,
0.2177731, -0.3291419, 1.469257, 0, 0.5843138, 1, 1,
0.2188198, 0.7932073, 0.07690281, 0, 0.5803922, 1, 1,
0.2210469, -0.4584686, 2.505582, 0, 0.572549, 1, 1,
0.2214114, 1.958059, 0.002419776, 0, 0.5686275, 1, 1,
0.2231513, -0.8267745, 3.010485, 0, 0.5607843, 1, 1,
0.2277053, 0.2362411, 0.262821, 0, 0.5568628, 1, 1,
0.2295149, -0.513467, 3.312185, 0, 0.5490196, 1, 1,
0.2328675, -1.111729, 2.056468, 0, 0.5450981, 1, 1,
0.2356056, -0.8326539, 2.728802, 0, 0.5372549, 1, 1,
0.2359686, 0.5750393, -0.2936374, 0, 0.5333334, 1, 1,
0.2395647, -0.1079482, 3.661809, 0, 0.5254902, 1, 1,
0.2437925, 0.7734458, 1.453077, 0, 0.5215687, 1, 1,
0.2443338, -1.512314, 4.666624, 0, 0.5137255, 1, 1,
0.2454915, -0.1904721, 1.717008, 0, 0.509804, 1, 1,
0.2481863, 1.849375, 0.9169669, 0, 0.5019608, 1, 1,
0.2498858, -1.041753, 1.995503, 0, 0.4941176, 1, 1,
0.2520871, 0.989483, 1.119676, 0, 0.4901961, 1, 1,
0.2532204, 0.8417093, -0.1244494, 0, 0.4823529, 1, 1,
0.2545783, -0.5354458, 1.56953, 0, 0.4784314, 1, 1,
0.2589666, -0.09700643, 1.089767, 0, 0.4705882, 1, 1,
0.2591873, 0.1982338, 0.4655801, 0, 0.4666667, 1, 1,
0.2597321, 0.5034906, 1.178756, 0, 0.4588235, 1, 1,
0.2624853, 0.8981776, 0.6182573, 0, 0.454902, 1, 1,
0.2634844, 0.485806, 0.2276991, 0, 0.4470588, 1, 1,
0.266834, 0.001961919, 2.325788, 0, 0.4431373, 1, 1,
0.2685027, -1.843579, 2.280185, 0, 0.4352941, 1, 1,
0.2726648, -0.4567627, 2.053822, 0, 0.4313726, 1, 1,
0.2777659, -0.3353248, 1.718336, 0, 0.4235294, 1, 1,
0.2787412, 0.7111347, 0.4332695, 0, 0.4196078, 1, 1,
0.2796116, 1.236198, 0.536154, 0, 0.4117647, 1, 1,
0.2816127, 1.463126, -1.011102, 0, 0.4078431, 1, 1,
0.2822483, 1.732816, 0.3075404, 0, 0.4, 1, 1,
0.2872562, -0.5961946, 2.041063, 0, 0.3921569, 1, 1,
0.2888611, 0.3437381, 0.3725073, 0, 0.3882353, 1, 1,
0.2902182, 0.8253039, 1.512712, 0, 0.3803922, 1, 1,
0.2923086, 0.1074135, 0.2923744, 0, 0.3764706, 1, 1,
0.2962203, -0.6365237, 2.685228, 0, 0.3686275, 1, 1,
0.2976234, -0.3200215, 2.663799, 0, 0.3647059, 1, 1,
0.3005818, 0.007194295, 0.9886064, 0, 0.3568628, 1, 1,
0.3045436, 0.5035417, -0.9413775, 0, 0.3529412, 1, 1,
0.3051095, -0.08341895, 1.767641, 0, 0.345098, 1, 1,
0.3052481, 1.083352, 0.305457, 0, 0.3411765, 1, 1,
0.3067634, -2.395735, 2.850947, 0, 0.3333333, 1, 1,
0.313156, 1.115833, -0.0784464, 0, 0.3294118, 1, 1,
0.3171587, 0.663587, -0.2253528, 0, 0.3215686, 1, 1,
0.3224955, -0.6756536, 1.407743, 0, 0.3176471, 1, 1,
0.3238145, 0.1867603, 1.4189, 0, 0.3098039, 1, 1,
0.3238321, 1.204684, 1.054223, 0, 0.3058824, 1, 1,
0.3254996, 3.23038, -0.02365424, 0, 0.2980392, 1, 1,
0.3269122, -0.9352078, 3.970444, 0, 0.2901961, 1, 1,
0.3327373, 0.5658033, -0.6028559, 0, 0.2862745, 1, 1,
0.338609, -1.373384, 3.547773, 0, 0.2784314, 1, 1,
0.3392269, -2.36985, 1.777231, 0, 0.2745098, 1, 1,
0.3399348, 1.189296, -0.3999635, 0, 0.2666667, 1, 1,
0.3399564, 1.433321, -0.0494027, 0, 0.2627451, 1, 1,
0.3401146, -0.8602869, 3.406758, 0, 0.254902, 1, 1,
0.3410839, -0.1674334, 0.3746734, 0, 0.2509804, 1, 1,
0.3421868, 1.184838, -0.381498, 0, 0.2431373, 1, 1,
0.3422813, -0.8387282, 1.917449, 0, 0.2392157, 1, 1,
0.3435669, -1.068178, 1.85383, 0, 0.2313726, 1, 1,
0.3460363, -2.044543, 1.468061, 0, 0.227451, 1, 1,
0.3470049, -0.08864143, 5.075464, 0, 0.2196078, 1, 1,
0.3506701, 0.3675018, -0.5701197, 0, 0.2156863, 1, 1,
0.3588439, -0.06968606, 2.154797, 0, 0.2078431, 1, 1,
0.3605773, -0.9680144, 2.738239, 0, 0.2039216, 1, 1,
0.3642279, -1.318664, 2.818891, 0, 0.1960784, 1, 1,
0.3726934, 2.043404, -0.1842648, 0, 0.1882353, 1, 1,
0.3732031, 1.287464, -0.4505183, 0, 0.1843137, 1, 1,
0.3736742, -0.9856324, 4.12774, 0, 0.1764706, 1, 1,
0.3761263, 1.350308, 0.7931093, 0, 0.172549, 1, 1,
0.3775412, -0.8035948, 2.073042, 0, 0.1647059, 1, 1,
0.382665, 0.4706389, -0.6091629, 0, 0.1607843, 1, 1,
0.3830195, -0.4602312, 1.944501, 0, 0.1529412, 1, 1,
0.3838134, -0.7707789, 2.988021, 0, 0.1490196, 1, 1,
0.3938538, -0.3693055, 0.8023606, 0, 0.1411765, 1, 1,
0.3969515, -2.541712, 1.851401, 0, 0.1372549, 1, 1,
0.3995904, 1.395984, 0.1066667, 0, 0.1294118, 1, 1,
0.4008477, -0.4899896, 2.203045, 0, 0.1254902, 1, 1,
0.4017126, 0.985023, 0.9931777, 0, 0.1176471, 1, 1,
0.406233, -0.9544439, 3.901675, 0, 0.1137255, 1, 1,
0.4067267, -0.2943775, 3.748511, 0, 0.1058824, 1, 1,
0.4087418, -1.378278, 4.674247, 0, 0.09803922, 1, 1,
0.4104846, 0.06082665, 1.340398, 0, 0.09411765, 1, 1,
0.4109329, 1.372353, 2.387313, 0, 0.08627451, 1, 1,
0.4131106, 1.305809, 0.2233635, 0, 0.08235294, 1, 1,
0.4145155, 0.278945, 0.6205741, 0, 0.07450981, 1, 1,
0.4149648, -0.6732991, 3.340776, 0, 0.07058824, 1, 1,
0.4153727, 0.533161, -0.6104252, 0, 0.0627451, 1, 1,
0.4167298, 1.41449, 0.1902633, 0, 0.05882353, 1, 1,
0.4195307, -0.1162786, 0.4248612, 0, 0.05098039, 1, 1,
0.4198558, 0.2171415, 2.146135, 0, 0.04705882, 1, 1,
0.421569, -1.374333, 2.44907, 0, 0.03921569, 1, 1,
0.4218793, -1.696636, 2.826711, 0, 0.03529412, 1, 1,
0.4291363, -0.7034871, 2.077532, 0, 0.02745098, 1, 1,
0.4298046, -0.4543941, 1.981623, 0, 0.02352941, 1, 1,
0.4314393, -0.5754988, 2.874824, 0, 0.01568628, 1, 1,
0.4348399, -0.6161317, 2.359199, 0, 0.01176471, 1, 1,
0.4358167, 0.7131168, -0.4157997, 0, 0.003921569, 1, 1,
0.4367962, -1.158589, 2.760183, 0.003921569, 0, 1, 1,
0.4396029, 0.5483173, 1.159912, 0.007843138, 0, 1, 1,
0.4411062, -1.030716, 3.406534, 0.01568628, 0, 1, 1,
0.4423546, 0.207384, 1.20007, 0.01960784, 0, 1, 1,
0.4426987, 0.3696439, 1.678348, 0.02745098, 0, 1, 1,
0.4458188, 0.6045235, 1.184493, 0.03137255, 0, 1, 1,
0.4458515, -2.080449, 3.968346, 0.03921569, 0, 1, 1,
0.4473816, 0.7302857, 1.274553, 0.04313726, 0, 1, 1,
0.4558558, -0.05452638, 1.480034, 0.05098039, 0, 1, 1,
0.4565358, 0.4783761, 0.2908944, 0.05490196, 0, 1, 1,
0.4587258, -0.614209, 2.001737, 0.0627451, 0, 1, 1,
0.4634135, -0.1934296, 2.680843, 0.06666667, 0, 1, 1,
0.480619, -0.865378, 2.584987, 0.07450981, 0, 1, 1,
0.481904, -0.4551526, 1.297833, 0.07843138, 0, 1, 1,
0.4822344, -1.368711, 3.058673, 0.08627451, 0, 1, 1,
0.4835779, 1.834086, 0.5050417, 0.09019608, 0, 1, 1,
0.4837416, -1.234662, 2.642087, 0.09803922, 0, 1, 1,
0.4850179, 0.2100652, 2.308788, 0.1058824, 0, 1, 1,
0.4890886, -1.724554, 3.436726, 0.1098039, 0, 1, 1,
0.4930236, -1.158644, 1.828166, 0.1176471, 0, 1, 1,
0.4935454, 0.6573201, -0.2322738, 0.1215686, 0, 1, 1,
0.4938818, 0.851959, 2.032125, 0.1294118, 0, 1, 1,
0.4980051, 1.670073, -0.9751093, 0.1333333, 0, 1, 1,
0.5003731, 0.06521851, 0.4104693, 0.1411765, 0, 1, 1,
0.5006984, 0.5801563, 0.1183385, 0.145098, 0, 1, 1,
0.5024889, 0.9674053, -0.2906814, 0.1529412, 0, 1, 1,
0.5078056, 0.1908077, 1.77133, 0.1568628, 0, 1, 1,
0.5088291, -0.8580362, -0.3327556, 0.1647059, 0, 1, 1,
0.5132928, 1.512222, 0.7949244, 0.1686275, 0, 1, 1,
0.5162727, 1.110736, 1.017262, 0.1764706, 0, 1, 1,
0.516619, -0.6330895, 5.267375, 0.1803922, 0, 1, 1,
0.5208964, -1.455742, 0.2945364, 0.1882353, 0, 1, 1,
0.520971, -1.386937, 1.791302, 0.1921569, 0, 1, 1,
0.5210295, -0.3665503, 1.713319, 0.2, 0, 1, 1,
0.5224275, 2.142962, 0.1463851, 0.2078431, 0, 1, 1,
0.5227909, -0.7063966, 1.572092, 0.2117647, 0, 1, 1,
0.5363553, 0.5864417, 0.1854865, 0.2196078, 0, 1, 1,
0.5379354, -0.2876272, 0.5302309, 0.2235294, 0, 1, 1,
0.5423204, -0.5266142, 2.243434, 0.2313726, 0, 1, 1,
0.5458125, 1.940925, 1.601772, 0.2352941, 0, 1, 1,
0.5500859, -0.2861754, 1.572049, 0.2431373, 0, 1, 1,
0.5579029, -0.9410865, 2.749486, 0.2470588, 0, 1, 1,
0.5666304, -0.4734903, 3.157821, 0.254902, 0, 1, 1,
0.5733011, 1.745683, -0.1980311, 0.2588235, 0, 1, 1,
0.5800302, -1.326758, 3.040413, 0.2666667, 0, 1, 1,
0.5811221, -1.269674, -0.2091434, 0.2705882, 0, 1, 1,
0.5814085, 0.8434675, 1.006652, 0.2784314, 0, 1, 1,
0.5826265, 0.598767, 2.206129, 0.282353, 0, 1, 1,
0.5827068, -1.961902, 3.789446, 0.2901961, 0, 1, 1,
0.5829499, -0.2920659, 2.376674, 0.2941177, 0, 1, 1,
0.5841314, 0.2348005, 2.220597, 0.3019608, 0, 1, 1,
0.5842152, 0.7002484, 2.113614, 0.3098039, 0, 1, 1,
0.5857453, 3.16587, 1.450639, 0.3137255, 0, 1, 1,
0.5878764, 1.382644, -1.799334, 0.3215686, 0, 1, 1,
0.5995591, -0.1449283, 1.286323, 0.3254902, 0, 1, 1,
0.6001333, 0.6759611, 2.330459, 0.3333333, 0, 1, 1,
0.6013684, 1.986659, 0.4662518, 0.3372549, 0, 1, 1,
0.602814, 1.323913, 0.4870795, 0.345098, 0, 1, 1,
0.6072615, -0.7444805, 1.483939, 0.3490196, 0, 1, 1,
0.608138, -0.9708586, 3.345658, 0.3568628, 0, 1, 1,
0.610224, 1.014697, 1.438846, 0.3607843, 0, 1, 1,
0.6118706, 0.8462566, 0.1995426, 0.3686275, 0, 1, 1,
0.6135966, -0.3242688, 1.262493, 0.372549, 0, 1, 1,
0.6226636, 0.1634169, 0.8663595, 0.3803922, 0, 1, 1,
0.6233421, -0.0788402, 0.714123, 0.3843137, 0, 1, 1,
0.6239295, 0.8635333, 0.007756587, 0.3921569, 0, 1, 1,
0.6245263, 0.8563018, 1.201622, 0.3960784, 0, 1, 1,
0.6250635, 1.164425, -0.06992548, 0.4039216, 0, 1, 1,
0.6254075, -0.2539269, 2.129121, 0.4117647, 0, 1, 1,
0.6294206, 0.2324417, 0.3687165, 0.4156863, 0, 1, 1,
0.6299807, -0.2159798, 3.619091, 0.4235294, 0, 1, 1,
0.6328183, 0.5475333, 1.244551, 0.427451, 0, 1, 1,
0.6336721, -1.334112, 0.9824406, 0.4352941, 0, 1, 1,
0.6362929, -1.78583, 0.6637843, 0.4392157, 0, 1, 1,
0.636409, -0.3397028, 1.598989, 0.4470588, 0, 1, 1,
0.637427, -0.7369449, 3.040092, 0.4509804, 0, 1, 1,
0.638295, -0.8903134, 1.784697, 0.4588235, 0, 1, 1,
0.6432508, 1.199644, 0.3640109, 0.4627451, 0, 1, 1,
0.6464112, -0.2454323, 3.058459, 0.4705882, 0, 1, 1,
0.6499121, 1.707897, 0.8910227, 0.4745098, 0, 1, 1,
0.6499309, -1.35335, 3.256994, 0.4823529, 0, 1, 1,
0.6524139, 0.1178704, 1.472797, 0.4862745, 0, 1, 1,
0.6537822, -1.405729, 2.439686, 0.4941176, 0, 1, 1,
0.6665488, -1.051192, 1.883821, 0.5019608, 0, 1, 1,
0.667455, -1.650907, 3.210593, 0.5058824, 0, 1, 1,
0.6707429, -1.995769, 3.210203, 0.5137255, 0, 1, 1,
0.6806079, 1.45805, 1.082291, 0.5176471, 0, 1, 1,
0.6815985, 0.1266246, 2.00394, 0.5254902, 0, 1, 1,
0.6870415, -0.4432872, 0.8161885, 0.5294118, 0, 1, 1,
0.699008, 0.5823594, 0.7959348, 0.5372549, 0, 1, 1,
0.699945, -1.777914, 2.084405, 0.5411765, 0, 1, 1,
0.7011055, -0.9495393, 3.812986, 0.5490196, 0, 1, 1,
0.7097906, 0.5932735, 1.067271, 0.5529412, 0, 1, 1,
0.7128621, 1.704197, -0.1202868, 0.5607843, 0, 1, 1,
0.713842, 0.006104102, 1.017602, 0.5647059, 0, 1, 1,
0.7139472, -0.4846085, 2.552645, 0.572549, 0, 1, 1,
0.7142884, -0.1409382, 1.911744, 0.5764706, 0, 1, 1,
0.7202324, 0.7657044, 0.2936749, 0.5843138, 0, 1, 1,
0.7223327, -0.4323356, 1.982897, 0.5882353, 0, 1, 1,
0.7264142, -0.7607032, 3.364631, 0.5960785, 0, 1, 1,
0.7281108, -1.028815, 2.829242, 0.6039216, 0, 1, 1,
0.7314324, 0.8641096, 1.670277, 0.6078432, 0, 1, 1,
0.7331417, -0.1394322, 2.094082, 0.6156863, 0, 1, 1,
0.7480503, -1.493897, 1.747826, 0.6196079, 0, 1, 1,
0.7481513, 0.3642822, 2.22943, 0.627451, 0, 1, 1,
0.750748, 1.332576, 0.6608508, 0.6313726, 0, 1, 1,
0.7531385, 0.9103778, 0.8905873, 0.6392157, 0, 1, 1,
0.7565137, 1.119707, -0.1085068, 0.6431373, 0, 1, 1,
0.7598513, -0.9310257, 3.845788, 0.6509804, 0, 1, 1,
0.7599148, -0.1337602, 0.9833111, 0.654902, 0, 1, 1,
0.7646882, 1.162591, 0.8800374, 0.6627451, 0, 1, 1,
0.7656934, -1.134911, 3.247166, 0.6666667, 0, 1, 1,
0.7661594, -1.56086, 1.834077, 0.6745098, 0, 1, 1,
0.7713802, -0.1803884, 0.0369912, 0.6784314, 0, 1, 1,
0.7733667, -0.1986995, 1.278962, 0.6862745, 0, 1, 1,
0.7771484, 0.2893986, 2.206387, 0.6901961, 0, 1, 1,
0.7789809, 0.6258886, 1.055042, 0.6980392, 0, 1, 1,
0.7839634, 0.9217907, 1.168138, 0.7058824, 0, 1, 1,
0.7842161, -2.750891, 4.453819, 0.7098039, 0, 1, 1,
0.7894199, 0.4218582, 1.793426, 0.7176471, 0, 1, 1,
0.791328, 0.6242678, 1.781384, 0.7215686, 0, 1, 1,
0.7944264, -1.662138, 3.380557, 0.7294118, 0, 1, 1,
0.796972, 0.1165713, 2.55245, 0.7333333, 0, 1, 1,
0.7995331, -1.790717, 2.289304, 0.7411765, 0, 1, 1,
0.8069451, -0.37707, 2.065449, 0.7450981, 0, 1, 1,
0.8072189, -0.2945436, 3.020795, 0.7529412, 0, 1, 1,
0.8086704, -1.26847, 2.26935, 0.7568628, 0, 1, 1,
0.8129966, 0.9370019, -0.009914713, 0.7647059, 0, 1, 1,
0.819754, -0.487063, 2.605742, 0.7686275, 0, 1, 1,
0.8216311, 1.65406, -0.6180278, 0.7764706, 0, 1, 1,
0.8313407, 0.2690953, 1.487608, 0.7803922, 0, 1, 1,
0.8481553, 0.4910884, 1.281256, 0.7882353, 0, 1, 1,
0.8489006, 1.023362, 1.02339, 0.7921569, 0, 1, 1,
0.851754, 1.196614, 1.446372, 0.8, 0, 1, 1,
0.85594, -0.1726168, 2.658939, 0.8078431, 0, 1, 1,
0.8570136, -2.134341, 4.603933, 0.8117647, 0, 1, 1,
0.8573309, 1.214181, 0.8222471, 0.8196079, 0, 1, 1,
0.857838, 0.1168202, 2.262335, 0.8235294, 0, 1, 1,
0.8591585, 0.611049, 0.6090894, 0.8313726, 0, 1, 1,
0.8606467, 0.6297758, 0.6425272, 0.8352941, 0, 1, 1,
0.8607243, 0.04162492, 1.700945, 0.8431373, 0, 1, 1,
0.8649631, 0.6668749, -0.2310758, 0.8470588, 0, 1, 1,
0.8650083, -2.015942, 2.541731, 0.854902, 0, 1, 1,
0.8674011, -1.541968, 3.487119, 0.8588235, 0, 1, 1,
0.8712302, 1.113485, 0.1827314, 0.8666667, 0, 1, 1,
0.873831, 0.5755171, 2.138285, 0.8705882, 0, 1, 1,
0.8743326, 0.0739859, 2.107506, 0.8784314, 0, 1, 1,
0.8812294, -0.7038453, 3.700199, 0.8823529, 0, 1, 1,
0.8818863, 0.1625394, 2.03784, 0.8901961, 0, 1, 1,
0.882538, -1.453182, 3.506835, 0.8941177, 0, 1, 1,
0.8883858, -0.01573203, 2.257758, 0.9019608, 0, 1, 1,
0.8899848, -0.8246053, 4.052667, 0.9098039, 0, 1, 1,
0.8913552, 0.486855, 0.1888976, 0.9137255, 0, 1, 1,
0.8914428, -0.4993878, 2.264534, 0.9215686, 0, 1, 1,
0.8928066, -1.364705, 1.948997, 0.9254902, 0, 1, 1,
0.8963766, -1.023246, 3.733617, 0.9333333, 0, 1, 1,
0.8986134, 0.5289367, -1.229462, 0.9372549, 0, 1, 1,
0.903972, -0.9862589, 2.103734, 0.945098, 0, 1, 1,
0.9085185, 0.9129916, -0.06150899, 0.9490196, 0, 1, 1,
0.9099776, -0.6711997, 2.683924, 0.9568627, 0, 1, 1,
0.9116364, -1.355697, 3.286989, 0.9607843, 0, 1, 1,
0.9136561, 1.143457, 0.7643404, 0.9686275, 0, 1, 1,
0.9157185, -0.01322469, 1.616139, 0.972549, 0, 1, 1,
0.9173634, 0.7547736, 1.325363, 0.9803922, 0, 1, 1,
0.9300696, 0.6119302, -0.01327633, 0.9843137, 0, 1, 1,
0.9310949, -0.8748069, 1.752036, 0.9921569, 0, 1, 1,
0.9375009, -0.5188245, 2.186913, 0.9960784, 0, 1, 1,
0.938772, 1.514801, 0.9862632, 1, 0, 0.9960784, 1,
0.9437209, -1.137801, 3.035665, 1, 0, 0.9882353, 1,
0.9458452, 0.3322034, 1.025184, 1, 0, 0.9843137, 1,
0.9491545, -1.405968, 3.179336, 1, 0, 0.9764706, 1,
0.9499157, -1.461318, 3.255808, 1, 0, 0.972549, 1,
0.9604517, -0.7722628, 1.254923, 1, 0, 0.9647059, 1,
0.9650678, 0.811701, 2.008546, 1, 0, 0.9607843, 1,
0.9659999, 0.5756376, 0.4734281, 1, 0, 0.9529412, 1,
0.9662666, -0.08948943, 1.448345, 1, 0, 0.9490196, 1,
0.9768642, 0.5971981, 2.660691, 1, 0, 0.9411765, 1,
0.9806272, -0.2869555, 1.143373, 1, 0, 0.9372549, 1,
0.9847079, 0.4873658, 1.714197, 1, 0, 0.9294118, 1,
0.9938275, 1.140945, 0.9445086, 1, 0, 0.9254902, 1,
1.000009, 0.1463839, 3.16974, 1, 0, 0.9176471, 1,
1.004607, -0.3097981, 0.8915118, 1, 0, 0.9137255, 1,
1.006942, 1.420132, 0.298442, 1, 0, 0.9058824, 1,
1.010051, 0.3187927, 0.877198, 1, 0, 0.9019608, 1,
1.013719, 0.2737802, 0.752807, 1, 0, 0.8941177, 1,
1.021662, -1.314947, 3.137969, 1, 0, 0.8862745, 1,
1.035508, -0.0939856, 1.960632, 1, 0, 0.8823529, 1,
1.055407, -0.05046924, 1.617402, 1, 0, 0.8745098, 1,
1.062864, -0.2013519, 2.699889, 1, 0, 0.8705882, 1,
1.063305, 1.443555, -0.7041731, 1, 0, 0.8627451, 1,
1.0642, 0.5560006, 0.3300532, 1, 0, 0.8588235, 1,
1.065374, 0.2107262, 1.411796, 1, 0, 0.8509804, 1,
1.074169, 0.4045673, 1.44785, 1, 0, 0.8470588, 1,
1.074686, -1.843442, 3.307379, 1, 0, 0.8392157, 1,
1.080604, 1.083967, 1.031653, 1, 0, 0.8352941, 1,
1.08132, 0.08508354, 2.40457, 1, 0, 0.827451, 1,
1.086206, 0.5877558, 0.148084, 1, 0, 0.8235294, 1,
1.091615, 0.1713231, 1.664668, 1, 0, 0.8156863, 1,
1.096044, 0.8187111, 1.101475, 1, 0, 0.8117647, 1,
1.101548, -0.9321162, 2.27307, 1, 0, 0.8039216, 1,
1.101866, 0.03629596, 3.336784, 1, 0, 0.7960784, 1,
1.114868, -1.108302, 1.92126, 1, 0, 0.7921569, 1,
1.123366, -0.8276299, 4.34757, 1, 0, 0.7843137, 1,
1.127629, 1.2718, 1.388655, 1, 0, 0.7803922, 1,
1.128941, 1.741027, 0.7027618, 1, 0, 0.772549, 1,
1.135825, -0.1711302, 2.156479, 1, 0, 0.7686275, 1,
1.137041, -1.557311, 3.394013, 1, 0, 0.7607843, 1,
1.13733, 0.4115196, 1.933282, 1, 0, 0.7568628, 1,
1.141974, 0.2312702, 1.470766, 1, 0, 0.7490196, 1,
1.145482, -0.4217856, 1.363232, 1, 0, 0.7450981, 1,
1.149581, 0.1287912, -0.2336892, 1, 0, 0.7372549, 1,
1.153506, -0.2344947, 2.068034, 1, 0, 0.7333333, 1,
1.155836, 1.583143, 0.1766808, 1, 0, 0.7254902, 1,
1.15806, 2.6905, 0.7006195, 1, 0, 0.7215686, 1,
1.160393, 0.147314, 1.764163, 1, 0, 0.7137255, 1,
1.181308, -0.357355, 0.8142911, 1, 0, 0.7098039, 1,
1.182362, 1.405793, -0.3699543, 1, 0, 0.7019608, 1,
1.186346, -0.5214117, 2.7526, 1, 0, 0.6941177, 1,
1.192626, 0.04665811, 2.225849, 1, 0, 0.6901961, 1,
1.200266, -0.2110537, 3.082835, 1, 0, 0.682353, 1,
1.203878, 0.001404037, 2.403331, 1, 0, 0.6784314, 1,
1.204894, 0.5388858, 1.8515, 1, 0, 0.6705883, 1,
1.20879, 0.4512095, -0.1908211, 1, 0, 0.6666667, 1,
1.209458, 1.155076, 2.380379, 1, 0, 0.6588235, 1,
1.213275, -0.3498042, -0.8252409, 1, 0, 0.654902, 1,
1.22007, -0.6141442, 1.077995, 1, 0, 0.6470588, 1,
1.221683, 2.129784, -0.6771374, 1, 0, 0.6431373, 1,
1.223222, -0.2004471, 2.765602, 1, 0, 0.6352941, 1,
1.224423, -0.332081, 2.43519, 1, 0, 0.6313726, 1,
1.232478, -1.167345, 3.092118, 1, 0, 0.6235294, 1,
1.23508, -0.9233421, 3.317235, 1, 0, 0.6196079, 1,
1.245709, -1.165609, 1.896607, 1, 0, 0.6117647, 1,
1.254357, 0.7320109, 1.554495, 1, 0, 0.6078432, 1,
1.256996, 1.380478, -0.01256954, 1, 0, 0.6, 1,
1.273181, 0.5932056, -1.410656, 1, 0, 0.5921569, 1,
1.276296, 0.2836598, 0.09355582, 1, 0, 0.5882353, 1,
1.290343, -0.187719, 1.838064, 1, 0, 0.5803922, 1,
1.293701, -0.421097, -0.001588353, 1, 0, 0.5764706, 1,
1.30716, -0.3989926, 2.276837, 1, 0, 0.5686275, 1,
1.314189, 0.5485904, 1.944574, 1, 0, 0.5647059, 1,
1.31671, -1.215862, 2.020956, 1, 0, 0.5568628, 1,
1.319564, 0.05582552, 1.562885, 1, 0, 0.5529412, 1,
1.321017, -1.874089, 1.461855, 1, 0, 0.5450981, 1,
1.324294, -0.404081, 2.70544, 1, 0, 0.5411765, 1,
1.325581, -0.7810227, 1.461582, 1, 0, 0.5333334, 1,
1.328332, -0.4002424, 2.311034, 1, 0, 0.5294118, 1,
1.33618, 0.6100608, 1.26933, 1, 0, 0.5215687, 1,
1.345119, -0.09344359, 4.1936, 1, 0, 0.5176471, 1,
1.352506, -0.8714386, 2.08005, 1, 0, 0.509804, 1,
1.355834, 2.157338, 0.9352393, 1, 0, 0.5058824, 1,
1.359125, -0.265738, 2.607886, 1, 0, 0.4980392, 1,
1.36619, -1.270466, 2.195416, 1, 0, 0.4901961, 1,
1.378212, -0.4010927, 2.847797, 1, 0, 0.4862745, 1,
1.387156, 1.589586, 1.615574, 1, 0, 0.4784314, 1,
1.394033, 0.7271198, 3.893196, 1, 0, 0.4745098, 1,
1.394836, 1.673091, 0.5783879, 1, 0, 0.4666667, 1,
1.405791, -0.6200467, 3.283948, 1, 0, 0.4627451, 1,
1.412694, -0.3034599, 0.1614191, 1, 0, 0.454902, 1,
1.412968, -0.9668512, 1.723481, 1, 0, 0.4509804, 1,
1.431018, -0.6748062, 1.070685, 1, 0, 0.4431373, 1,
1.431044, -0.0971192, 1.65441, 1, 0, 0.4392157, 1,
1.445248, -0.9128736, 0.4004437, 1, 0, 0.4313726, 1,
1.474746, 0.8486777, -0.02646865, 1, 0, 0.427451, 1,
1.480887, 0.805176, 3.391078, 1, 0, 0.4196078, 1,
1.484643, 1.653044, 1.180685, 1, 0, 0.4156863, 1,
1.484839, 0.05348078, -0.01427155, 1, 0, 0.4078431, 1,
1.498368, -0.6393304, 2.532613, 1, 0, 0.4039216, 1,
1.498928, 0.2214613, 1.570316, 1, 0, 0.3960784, 1,
1.504249, 0.4717481, 0.9629145, 1, 0, 0.3882353, 1,
1.504367, 0.1607923, -0.2403155, 1, 0, 0.3843137, 1,
1.519596, 0.8934719, 0.7802799, 1, 0, 0.3764706, 1,
1.53044, 1.064164, 0.8346397, 1, 0, 0.372549, 1,
1.533822, -1.309259, 1.256085, 1, 0, 0.3647059, 1,
1.543393, 1.453623, 1.636952, 1, 0, 0.3607843, 1,
1.559792, 1.112288, 1.610178, 1, 0, 0.3529412, 1,
1.562422, -0.680383, 3.503261, 1, 0, 0.3490196, 1,
1.576818, -0.4593036, 2.975905, 1, 0, 0.3411765, 1,
1.597468, 0.7683197, 0.5173542, 1, 0, 0.3372549, 1,
1.598975, -1.30675, 2.92558, 1, 0, 0.3294118, 1,
1.600345, -0.5808352, 3.709162, 1, 0, 0.3254902, 1,
1.618996, 0.4465167, 1.464525, 1, 0, 0.3176471, 1,
1.620596, 0.7981008, 3.307672, 1, 0, 0.3137255, 1,
1.623048, 0.8047514, 1.100729, 1, 0, 0.3058824, 1,
1.63026, 1.575464, 1.054724, 1, 0, 0.2980392, 1,
1.633833, -0.7925511, 1.890214, 1, 0, 0.2941177, 1,
1.640881, 0.1168835, 3.12673, 1, 0, 0.2862745, 1,
1.646153, 0.2840079, 1.565373, 1, 0, 0.282353, 1,
1.655765, 0.8501613, 0.9181394, 1, 0, 0.2745098, 1,
1.663062, 0.9058077, 1.154115, 1, 0, 0.2705882, 1,
1.665985, 0.7275682, 1.335248, 1, 0, 0.2627451, 1,
1.701162, -0.9059051, 1.589063, 1, 0, 0.2588235, 1,
1.722442, -0.2828784, 2.927289, 1, 0, 0.2509804, 1,
1.735608, 0.5737054, 1.452602, 1, 0, 0.2470588, 1,
1.738222, -0.04751795, 1.533346, 1, 0, 0.2392157, 1,
1.742765, -1.030737, 2.061495, 1, 0, 0.2352941, 1,
1.785409, -1.594258, 2.785336, 1, 0, 0.227451, 1,
1.788893, 0.6271791, 1.256782, 1, 0, 0.2235294, 1,
1.795351, -0.8482035, 1.928766, 1, 0, 0.2156863, 1,
1.797823, 1.408985, 2.18758, 1, 0, 0.2117647, 1,
1.800923, -1.4022, 0.424392, 1, 0, 0.2039216, 1,
1.814184, 1.026737, 1.547925, 1, 0, 0.1960784, 1,
1.825463, 0.06934266, 1.913081, 1, 0, 0.1921569, 1,
1.860623, -0.5454523, 1.411884, 1, 0, 0.1843137, 1,
1.868408, -1.514579, 3.223967, 1, 0, 0.1803922, 1,
1.91243, 0.8601754, -0.4582459, 1, 0, 0.172549, 1,
1.912578, 0.4204341, 1.049353, 1, 0, 0.1686275, 1,
1.913792, 0.4839713, 1.908681, 1, 0, 0.1607843, 1,
1.928428, -0.5737076, 2.999689, 1, 0, 0.1568628, 1,
1.951193, 0.09611241, 0.6014327, 1, 0, 0.1490196, 1,
2.012119, -0.2702337, 0.06559484, 1, 0, 0.145098, 1,
2.02931, 0.8122334, 1.200326, 1, 0, 0.1372549, 1,
2.031272, 0.1169724, 1.239676, 1, 0, 0.1333333, 1,
2.051922, -0.3710282, 2.175933, 1, 0, 0.1254902, 1,
2.079449, 0.9034147, 2.140836, 1, 0, 0.1215686, 1,
2.086299, -1.154434, 2.756221, 1, 0, 0.1137255, 1,
2.094311, -0.5087448, 2.43076, 1, 0, 0.1098039, 1,
2.09777, 0.2019473, 2.57092, 1, 0, 0.1019608, 1,
2.101636, 2.34967, 0.06614734, 1, 0, 0.09411765, 1,
2.133312, -0.5780474, 1.016394, 1, 0, 0.09019608, 1,
2.140177, -0.3033624, 1.57813, 1, 0, 0.08235294, 1,
2.167407, -1.446133, 2.364954, 1, 0, 0.07843138, 1,
2.226196, 2.328294, 1.19271, 1, 0, 0.07058824, 1,
2.294868, -1.624786, 2.76656, 1, 0, 0.06666667, 1,
2.31929, 0.1075702, -0.3764902, 1, 0, 0.05882353, 1,
2.350137, -2.716236, 2.067051, 1, 0, 0.05490196, 1,
2.447932, 0.6678362, 0.7971712, 1, 0, 0.04705882, 1,
2.472943, 0.5475064, 1.92219, 1, 0, 0.04313726, 1,
2.637275, -0.2534685, 0.6631588, 1, 0, 0.03529412, 1,
2.64013, -1.007848, 0.4233032, 1, 0, 0.03137255, 1,
2.676157, -1.072195, 2.97166, 1, 0, 0.02352941, 1,
2.744901, 0.2785139, 1.814937, 1, 0, 0.01960784, 1,
2.774719, 0.6098212, 1.460655, 1, 0, 0.01176471, 1,
2.877048, -1.211594, 2.99878, 1, 0, 0.007843138, 1
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
-0.2161423, -4.058462, -8.900936, 0, -0.5, 0.5, 0.5,
-0.2161423, -4.058462, -8.900936, 1, -0.5, 0.5, 0.5,
-0.2161423, -4.058462, -8.900936, 1, 1.5, 0.5, 0.5,
-0.2161423, -4.058462, -8.900936, 0, 1.5, 0.5, 0.5
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
-4.357924, 0.1141584, -8.900936, 0, -0.5, 0.5, 0.5,
-4.357924, 0.1141584, -8.900936, 1, -0.5, 0.5, 0.5,
-4.357924, 0.1141584, -8.900936, 1, 1.5, 0.5, 0.5,
-4.357924, 0.1141584, -8.900936, 0, 1.5, 0.5, 0.5
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
-4.357924, -4.058462, -0.40904, 0, -0.5, 0.5, 0.5,
-4.357924, -4.058462, -0.40904, 1, -0.5, 0.5, 0.5,
-4.357924, -4.058462, -0.40904, 1, 1.5, 0.5, 0.5,
-4.357924, -4.058462, -0.40904, 0, 1.5, 0.5, 0.5
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
-3, -3.095549, -6.941267,
2, -3.095549, -6.941267,
-3, -3.095549, -6.941267,
-3, -3.256035, -7.267879,
-2, -3.095549, -6.941267,
-2, -3.256035, -7.267879,
-1, -3.095549, -6.941267,
-1, -3.256035, -7.267879,
0, -3.095549, -6.941267,
0, -3.256035, -7.267879,
1, -3.095549, -6.941267,
1, -3.256035, -7.267879,
2, -3.095549, -6.941267,
2, -3.256035, -7.267879
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
-3, -3.577006, -7.921102, 0, -0.5, 0.5, 0.5,
-3, -3.577006, -7.921102, 1, -0.5, 0.5, 0.5,
-3, -3.577006, -7.921102, 1, 1.5, 0.5, 0.5,
-3, -3.577006, -7.921102, 0, 1.5, 0.5, 0.5,
-2, -3.577006, -7.921102, 0, -0.5, 0.5, 0.5,
-2, -3.577006, -7.921102, 1, -0.5, 0.5, 0.5,
-2, -3.577006, -7.921102, 1, 1.5, 0.5, 0.5,
-2, -3.577006, -7.921102, 0, 1.5, 0.5, 0.5,
-1, -3.577006, -7.921102, 0, -0.5, 0.5, 0.5,
-1, -3.577006, -7.921102, 1, -0.5, 0.5, 0.5,
-1, -3.577006, -7.921102, 1, 1.5, 0.5, 0.5,
-1, -3.577006, -7.921102, 0, 1.5, 0.5, 0.5,
0, -3.577006, -7.921102, 0, -0.5, 0.5, 0.5,
0, -3.577006, -7.921102, 1, -0.5, 0.5, 0.5,
0, -3.577006, -7.921102, 1, 1.5, 0.5, 0.5,
0, -3.577006, -7.921102, 0, 1.5, 0.5, 0.5,
1, -3.577006, -7.921102, 0, -0.5, 0.5, 0.5,
1, -3.577006, -7.921102, 1, -0.5, 0.5, 0.5,
1, -3.577006, -7.921102, 1, 1.5, 0.5, 0.5,
1, -3.577006, -7.921102, 0, 1.5, 0.5, 0.5,
2, -3.577006, -7.921102, 0, -0.5, 0.5, 0.5,
2, -3.577006, -7.921102, 1, -0.5, 0.5, 0.5,
2, -3.577006, -7.921102, 1, 1.5, 0.5, 0.5,
2, -3.577006, -7.921102, 0, 1.5, 0.5, 0.5
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
-3.402128, -3, -6.941267,
-3.402128, 3, -6.941267,
-3.402128, -3, -6.941267,
-3.561427, -3, -7.267879,
-3.402128, -2, -6.941267,
-3.561427, -2, -7.267879,
-3.402128, -1, -6.941267,
-3.561427, -1, -7.267879,
-3.402128, 0, -6.941267,
-3.561427, 0, -7.267879,
-3.402128, 1, -6.941267,
-3.561427, 1, -7.267879,
-3.402128, 2, -6.941267,
-3.561427, 2, -7.267879,
-3.402128, 3, -6.941267,
-3.561427, 3, -7.267879
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
-3.880026, -3, -7.921102, 0, -0.5, 0.5, 0.5,
-3.880026, -3, -7.921102, 1, -0.5, 0.5, 0.5,
-3.880026, -3, -7.921102, 1, 1.5, 0.5, 0.5,
-3.880026, -3, -7.921102, 0, 1.5, 0.5, 0.5,
-3.880026, -2, -7.921102, 0, -0.5, 0.5, 0.5,
-3.880026, -2, -7.921102, 1, -0.5, 0.5, 0.5,
-3.880026, -2, -7.921102, 1, 1.5, 0.5, 0.5,
-3.880026, -2, -7.921102, 0, 1.5, 0.5, 0.5,
-3.880026, -1, -7.921102, 0, -0.5, 0.5, 0.5,
-3.880026, -1, -7.921102, 1, -0.5, 0.5, 0.5,
-3.880026, -1, -7.921102, 1, 1.5, 0.5, 0.5,
-3.880026, -1, -7.921102, 0, 1.5, 0.5, 0.5,
-3.880026, 0, -7.921102, 0, -0.5, 0.5, 0.5,
-3.880026, 0, -7.921102, 1, -0.5, 0.5, 0.5,
-3.880026, 0, -7.921102, 1, 1.5, 0.5, 0.5,
-3.880026, 0, -7.921102, 0, 1.5, 0.5, 0.5,
-3.880026, 1, -7.921102, 0, -0.5, 0.5, 0.5,
-3.880026, 1, -7.921102, 1, -0.5, 0.5, 0.5,
-3.880026, 1, -7.921102, 1, 1.5, 0.5, 0.5,
-3.880026, 1, -7.921102, 0, 1.5, 0.5, 0.5,
-3.880026, 2, -7.921102, 0, -0.5, 0.5, 0.5,
-3.880026, 2, -7.921102, 1, -0.5, 0.5, 0.5,
-3.880026, 2, -7.921102, 1, 1.5, 0.5, 0.5,
-3.880026, 2, -7.921102, 0, 1.5, 0.5, 0.5,
-3.880026, 3, -7.921102, 0, -0.5, 0.5, 0.5,
-3.880026, 3, -7.921102, 1, -0.5, 0.5, 0.5,
-3.880026, 3, -7.921102, 1, 1.5, 0.5, 0.5,
-3.880026, 3, -7.921102, 0, 1.5, 0.5, 0.5
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
-3.402128, -3.095549, -6,
-3.402128, -3.095549, 4,
-3.402128, -3.095549, -6,
-3.561427, -3.256035, -6,
-3.402128, -3.095549, -4,
-3.561427, -3.256035, -4,
-3.402128, -3.095549, -2,
-3.561427, -3.256035, -2,
-3.402128, -3.095549, 0,
-3.561427, -3.256035, 0,
-3.402128, -3.095549, 2,
-3.561427, -3.256035, 2,
-3.402128, -3.095549, 4,
-3.561427, -3.256035, 4
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
-3.880026, -3.577006, -6, 0, -0.5, 0.5, 0.5,
-3.880026, -3.577006, -6, 1, -0.5, 0.5, 0.5,
-3.880026, -3.577006, -6, 1, 1.5, 0.5, 0.5,
-3.880026, -3.577006, -6, 0, 1.5, 0.5, 0.5,
-3.880026, -3.577006, -4, 0, -0.5, 0.5, 0.5,
-3.880026, -3.577006, -4, 1, -0.5, 0.5, 0.5,
-3.880026, -3.577006, -4, 1, 1.5, 0.5, 0.5,
-3.880026, -3.577006, -4, 0, 1.5, 0.5, 0.5,
-3.880026, -3.577006, -2, 0, -0.5, 0.5, 0.5,
-3.880026, -3.577006, -2, 1, -0.5, 0.5, 0.5,
-3.880026, -3.577006, -2, 1, 1.5, 0.5, 0.5,
-3.880026, -3.577006, -2, 0, 1.5, 0.5, 0.5,
-3.880026, -3.577006, 0, 0, -0.5, 0.5, 0.5,
-3.880026, -3.577006, 0, 1, -0.5, 0.5, 0.5,
-3.880026, -3.577006, 0, 1, 1.5, 0.5, 0.5,
-3.880026, -3.577006, 0, 0, 1.5, 0.5, 0.5,
-3.880026, -3.577006, 2, 0, -0.5, 0.5, 0.5,
-3.880026, -3.577006, 2, 1, -0.5, 0.5, 0.5,
-3.880026, -3.577006, 2, 1, 1.5, 0.5, 0.5,
-3.880026, -3.577006, 2, 0, 1.5, 0.5, 0.5,
-3.880026, -3.577006, 4, 0, -0.5, 0.5, 0.5,
-3.880026, -3.577006, 4, 1, -0.5, 0.5, 0.5,
-3.880026, -3.577006, 4, 1, 1.5, 0.5, 0.5,
-3.880026, -3.577006, 4, 0, 1.5, 0.5, 0.5
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
-3.402128, -3.095549, -6.941267,
-3.402128, 3.323866, -6.941267,
-3.402128, -3.095549, 6.123188,
-3.402128, 3.323866, 6.123188,
-3.402128, -3.095549, -6.941267,
-3.402128, -3.095549, 6.123188,
-3.402128, 3.323866, -6.941267,
-3.402128, 3.323866, 6.123188,
-3.402128, -3.095549, -6.941267,
2.969843, -3.095549, -6.941267,
-3.402128, -3.095549, 6.123188,
2.969843, -3.095549, 6.123188,
-3.402128, 3.323866, -6.941267,
2.969843, 3.323866, -6.941267,
-3.402128, 3.323866, 6.123188,
2.969843, 3.323866, 6.123188,
2.969843, -3.095549, -6.941267,
2.969843, 3.323866, -6.941267,
2.969843, -3.095549, 6.123188,
2.969843, 3.323866, 6.123188,
2.969843, -3.095549, -6.941267,
2.969843, -3.095549, 6.123188,
2.969843, 3.323866, -6.941267,
2.969843, 3.323866, 6.123188
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
var radius = 8.484931;
var distance = 37.75042;
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
mvMatrix.translate( 0.2161423, -0.1141584, 0.40904 );
mvMatrix.scale( 1.439754, 1.429114, 0.7022163 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.75042);
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
-3.309332, 0.7951819, -2.335746, 0, 0, 1, 1, 1,
-3.181066, 1.044028, -2.262623, 1, 0, 0, 1, 1,
-2.909036, -1.967645, -0.2650561, 1, 0, 0, 1, 1,
-2.698445, -0.04997461, -2.039901, 1, 0, 0, 1, 1,
-2.636737, 0.464224, -2.018094, 1, 0, 0, 1, 1,
-2.436435, -2.251735, -2.692349, 1, 0, 0, 1, 1,
-2.426663, 1.013888, -0.308822, 0, 0, 0, 1, 1,
-2.317594, -2.505865, -1.861555, 0, 0, 0, 1, 1,
-2.25022, 0.5520997, 0.4779653, 0, 0, 0, 1, 1,
-2.134496, -1.242694, -2.12674, 0, 0, 0, 1, 1,
-2.104488, -2.043673, -1.652225, 0, 0, 0, 1, 1,
-2.09086, -0.3775887, -1.41868, 0, 0, 0, 1, 1,
-2.090242, -0.4666596, -1.680624, 0, 0, 0, 1, 1,
-2.088197, -1.439929, -0.4344808, 1, 1, 1, 1, 1,
-2.054132, 1.330988, -2.228853, 1, 1, 1, 1, 1,
-2.042382, 1.176273, -1.525274, 1, 1, 1, 1, 1,
-2.011997, -0.3876076, -3.18656, 1, 1, 1, 1, 1,
-1.984914, -0.8460217, -1.9871, 1, 1, 1, 1, 1,
-1.978912, -0.7524407, 0.3978128, 1, 1, 1, 1, 1,
-1.931556, 0.1436855, -1.949874, 1, 1, 1, 1, 1,
-1.913704, -0.7327484, -1.104361, 1, 1, 1, 1, 1,
-1.912695, -1.502956, -4.181273, 1, 1, 1, 1, 1,
-1.885262, 0.7587307, 0.4299355, 1, 1, 1, 1, 1,
-1.838428, -1.146021, -2.378623, 1, 1, 1, 1, 1,
-1.817574, 0.1157432, -2.662908, 1, 1, 1, 1, 1,
-1.793392, 0.6489085, -0.3523834, 1, 1, 1, 1, 1,
-1.781296, 0.08934267, -3.065177, 1, 1, 1, 1, 1,
-1.772339, -1.479041, -1.453264, 1, 1, 1, 1, 1,
-1.744297, 1.304938, -0.6627365, 0, 0, 1, 1, 1,
-1.741996, -1.712755, -2.584301, 1, 0, 0, 1, 1,
-1.712939, -1.971485, -3.006732, 1, 0, 0, 1, 1,
-1.708187, 0.09188835, -1.006187, 1, 0, 0, 1, 1,
-1.699993, 0.4473415, -2.440794, 1, 0, 0, 1, 1,
-1.699124, -0.147799, -2.26438, 1, 0, 0, 1, 1,
-1.691471, 2.314148, 0.5561702, 0, 0, 0, 1, 1,
-1.66811, 0.8356321, -0.8636316, 0, 0, 0, 1, 1,
-1.665301, -0.4870636, -1.457188, 0, 0, 0, 1, 1,
-1.660799, -0.4316178, -1.383947, 0, 0, 0, 1, 1,
-1.659355, -1.392816, -2.128373, 0, 0, 0, 1, 1,
-1.659203, -1.120277, -1.62869, 0, 0, 0, 1, 1,
-1.656234, -0.4669631, -1.224883, 0, 0, 0, 1, 1,
-1.645046, 0.5731469, -1.92664, 1, 1, 1, 1, 1,
-1.623027, -1.052419, -3.057014, 1, 1, 1, 1, 1,
-1.620332, -0.2708504, -1.73509, 1, 1, 1, 1, 1,
-1.613697, 0.5804955, 0.8258663, 1, 1, 1, 1, 1,
-1.610465, 0.489131, -2.841854, 1, 1, 1, 1, 1,
-1.603079, -0.5515978, -1.731387, 1, 1, 1, 1, 1,
-1.596497, -1.558453, -2.663562, 1, 1, 1, 1, 1,
-1.59401, -0.8315252, -2.25332, 1, 1, 1, 1, 1,
-1.585176, 0.7067943, -1.79087, 1, 1, 1, 1, 1,
-1.540265, 0.9576818, -2.283143, 1, 1, 1, 1, 1,
-1.53583, 0.2095684, -1.887009, 1, 1, 1, 1, 1,
-1.501164, -0.9284335, -1.628647, 1, 1, 1, 1, 1,
-1.498065, 0.1777598, 0.5485718, 1, 1, 1, 1, 1,
-1.485662, 0.4900149, -0.3302711, 1, 1, 1, 1, 1,
-1.468589, -0.1877474, -1.13321, 1, 1, 1, 1, 1,
-1.468454, -0.7096341, -1.290455, 0, 0, 1, 1, 1,
-1.462025, 0.4461174, -1.581173, 1, 0, 0, 1, 1,
-1.45687, 0.852647, -1.313909, 1, 0, 0, 1, 1,
-1.455615, 1.02736, -1.152951, 1, 0, 0, 1, 1,
-1.455191, -0.622234, 0.8283041, 1, 0, 0, 1, 1,
-1.455146, -0.006664379, -2.310579, 1, 0, 0, 1, 1,
-1.434284, 1.122378, -1.13597, 0, 0, 0, 1, 1,
-1.426811, -0.5684106, 0.04751277, 0, 0, 0, 1, 1,
-1.42068, 0.3450045, -2.000973, 0, 0, 0, 1, 1,
-1.420067, 0.5138826, -3.206574, 0, 0, 0, 1, 1,
-1.418707, -0.59705, -1.747452, 0, 0, 0, 1, 1,
-1.418662, 0.5181334, -0.4760031, 0, 0, 0, 1, 1,
-1.414632, 1.670109, 0.06211064, 0, 0, 0, 1, 1,
-1.40931, -0.3808076, -3.098098, 1, 1, 1, 1, 1,
-1.405682, -1.755251, -0.7996961, 1, 1, 1, 1, 1,
-1.404699, -1.176635, -2.867492, 1, 1, 1, 1, 1,
-1.395524, 2.142483, 0.1321081, 1, 1, 1, 1, 1,
-1.394577, 0.2709249, -1.626158, 1, 1, 1, 1, 1,
-1.378971, -0.172043, -0.3486379, 1, 1, 1, 1, 1,
-1.371759, -0.5522442, -2.031808, 1, 1, 1, 1, 1,
-1.360472, -0.05882772, -1.651669, 1, 1, 1, 1, 1,
-1.345418, 1.42556, -1.848288, 1, 1, 1, 1, 1,
-1.343661, 0.4151928, -1.32899, 1, 1, 1, 1, 1,
-1.341481, 1.317549, 1.488274, 1, 1, 1, 1, 1,
-1.329409, -0.5158005, -2.042398, 1, 1, 1, 1, 1,
-1.329262, -1.192912, -1.571441, 1, 1, 1, 1, 1,
-1.320424, -0.4804901, -2.390828, 1, 1, 1, 1, 1,
-1.320137, -1.800471, -2.547138, 1, 1, 1, 1, 1,
-1.31169, -2.160267, -2.526988, 0, 0, 1, 1, 1,
-1.296869, -0.8426121, -2.525127, 1, 0, 0, 1, 1,
-1.28787, -1.360104, -3.019154, 1, 0, 0, 1, 1,
-1.28354, -0.4889513, -0.3008612, 1, 0, 0, 1, 1,
-1.283258, 0.6649944, -1.272956, 1, 0, 0, 1, 1,
-1.27235, 1.975584, -1.664112, 1, 0, 0, 1, 1,
-1.270742, 2.813796, 0.955247, 0, 0, 0, 1, 1,
-1.252643, 1.195951, -0.397882, 0, 0, 0, 1, 1,
-1.226027, 1.475184, -1.167294, 0, 0, 0, 1, 1,
-1.214429, 0.7903375, -0.1612842, 0, 0, 0, 1, 1,
-1.202052, 0.3278039, -1.698362, 0, 0, 0, 1, 1,
-1.199424, 2.535074, -0.652047, 0, 0, 0, 1, 1,
-1.189813, -0.3429995, -3.041563, 0, 0, 0, 1, 1,
-1.184934, 0.454162, -0.1071605, 1, 1, 1, 1, 1,
-1.184575, -0.4554638, -2.77225, 1, 1, 1, 1, 1,
-1.181112, 2.015175, -2.80301, 1, 1, 1, 1, 1,
-1.181085, 0.245577, -2.399234, 1, 1, 1, 1, 1,
-1.167464, -0.08423082, -1.415023, 1, 1, 1, 1, 1,
-1.16523, -0.629896, -2.63258, 1, 1, 1, 1, 1,
-1.162566, -0.09228187, -2.246221, 1, 1, 1, 1, 1,
-1.161412, 0.3142276, -1.663476, 1, 1, 1, 1, 1,
-1.158896, -0.1758692, -1.775037, 1, 1, 1, 1, 1,
-1.15762, 0.3909333, -0.7134601, 1, 1, 1, 1, 1,
-1.143423, -0.6189858, -1.063743, 1, 1, 1, 1, 1,
-1.134881, -0.4325489, -2.635979, 1, 1, 1, 1, 1,
-1.134728, 0.9181045, -2.936293, 1, 1, 1, 1, 1,
-1.128724, 0.8425588, -0.5401455, 1, 1, 1, 1, 1,
-1.128101, 0.7762395, -2.314296, 1, 1, 1, 1, 1,
-1.125486, 1.234205, -2.597764, 0, 0, 1, 1, 1,
-1.12243, 0.1334712, -2.65131, 1, 0, 0, 1, 1,
-1.121452, -0.7955024, -1.768571, 1, 0, 0, 1, 1,
-1.120686, 0.02319983, -1.635061, 1, 0, 0, 1, 1,
-1.115769, -0.06714634, -1.952217, 1, 0, 0, 1, 1,
-1.114634, -0.3895604, -2.104123, 1, 0, 0, 1, 1,
-1.112018, 1.088599, -0.02943953, 0, 0, 0, 1, 1,
-1.111001, 1.0898, -1.388468, 0, 0, 0, 1, 1,
-1.103791, 0.8616505, -0.06885772, 0, 0, 0, 1, 1,
-1.102123, -1.988106, -1.191655, 0, 0, 0, 1, 1,
-1.09318, 0.4098814, -0.7266964, 0, 0, 0, 1, 1,
-1.091468, -0.08470692, -1.817056, 0, 0, 0, 1, 1,
-1.087002, -0.9938771, -1.776999, 0, 0, 0, 1, 1,
-1.082828, 0.8657835, -0.6084459, 1, 1, 1, 1, 1,
-1.081678, -1.862081, -2.117192, 1, 1, 1, 1, 1,
-1.078328, 0.5637926, 0.3963133, 1, 1, 1, 1, 1,
-1.077645, 1.173338, 1.290596, 1, 1, 1, 1, 1,
-1.075505, -0.1820646, -3.062313, 1, 1, 1, 1, 1,
-1.069189, -0.0981365, -0.9762226, 1, 1, 1, 1, 1,
-1.0656, 2.539019, -0.2407941, 1, 1, 1, 1, 1,
-1.063313, 2.631065, -0.7475944, 1, 1, 1, 1, 1,
-1.058799, 1.050672, 0.09553169, 1, 1, 1, 1, 1,
-1.058038, -1.377833, -1.791335, 1, 1, 1, 1, 1,
-1.047796, -0.4560471, -2.252833, 1, 1, 1, 1, 1,
-1.045691, 1.037279, -0.8642162, 1, 1, 1, 1, 1,
-1.043071, -0.3565938, -0.8546115, 1, 1, 1, 1, 1,
-1.042917, -1.278801, -3.08461, 1, 1, 1, 1, 1,
-1.039183, 0.3069847, -0.6334491, 1, 1, 1, 1, 1,
-1.032716, 0.9157708, 0.06517287, 0, 0, 1, 1, 1,
-1.023584, -0.2313625, -0.6641867, 1, 0, 0, 1, 1,
-1.021957, 1.242619, -0.2541496, 1, 0, 0, 1, 1,
-1.017344, -1.389756, -2.308087, 1, 0, 0, 1, 1,
-1.014073, 1.550871, -1.456, 1, 0, 0, 1, 1,
-1.014063, 0.1300557, -1.42242, 1, 0, 0, 1, 1,
-1.013846, -1.360104, -0.4367563, 0, 0, 0, 1, 1,
-1.000967, -3.002063, -4.066641, 0, 0, 0, 1, 1,
-0.9968749, 0.6796849, 0.1799541, 0, 0, 0, 1, 1,
-0.9815907, -1.279573, -4.029018, 0, 0, 0, 1, 1,
-0.9717825, -0.9613198, -3.657373, 0, 0, 0, 1, 1,
-0.9712837, 0.5831861, -3.176736, 0, 0, 0, 1, 1,
-0.9641156, -0.8310497, -1.729932, 0, 0, 0, 1, 1,
-0.9592735, 0.7510036, -0.5493498, 1, 1, 1, 1, 1,
-0.9590986, -0.959148, -1.678489, 1, 1, 1, 1, 1,
-0.9552707, -0.2219012, -0.9755681, 1, 1, 1, 1, 1,
-0.9520483, -0.3959177, -3.267287, 1, 1, 1, 1, 1,
-0.9503313, 0.5286584, -0.3448714, 1, 1, 1, 1, 1,
-0.9496011, -0.6647682, -2.335473, 1, 1, 1, 1, 1,
-0.9452645, 0.5772357, 0.1911654, 1, 1, 1, 1, 1,
-0.9445366, -2.045904, -2.240648, 1, 1, 1, 1, 1,
-0.9438105, -0.1560398, -1.442952, 1, 1, 1, 1, 1,
-0.9433826, -0.4813074, -1.59068, 1, 1, 1, 1, 1,
-0.9341676, 0.09005978, -2.074922, 1, 1, 1, 1, 1,
-0.9337311, -0.6107854, -1.71836, 1, 1, 1, 1, 1,
-0.9319689, 0.3654394, -3.763453, 1, 1, 1, 1, 1,
-0.9317183, -0.7391478, -1.322886, 1, 1, 1, 1, 1,
-0.9303579, -0.899082, -2.976727, 1, 1, 1, 1, 1,
-0.9272893, 0.3070895, -1.06004, 0, 0, 1, 1, 1,
-0.9196433, -1.091716, -0.5925251, 1, 0, 0, 1, 1,
-0.9175211, 0.2309959, -2.704754, 1, 0, 0, 1, 1,
-0.9105281, -0.429287, -2.750602, 1, 0, 0, 1, 1,
-0.9091871, -1.141492, -3.634161, 1, 0, 0, 1, 1,
-0.9033118, -0.8336613, -1.518921, 1, 0, 0, 1, 1,
-0.9017454, -1.247065, -3.058359, 0, 0, 0, 1, 1,
-0.899834, 0.6009238, -1.956058, 0, 0, 0, 1, 1,
-0.8988413, -1.750696, -3.420888, 0, 0, 0, 1, 1,
-0.8975885, 0.4199749, -0.6358554, 0, 0, 0, 1, 1,
-0.8969946, -1.71367, -1.920676, 0, 0, 0, 1, 1,
-0.8772665, -0.3911379, -2.828508, 0, 0, 0, 1, 1,
-0.8739596, -0.6282603, -0.7983698, 0, 0, 0, 1, 1,
-0.8646582, -0.5083257, -1.908579, 1, 1, 1, 1, 1,
-0.8579288, -0.5797745, 0.06517528, 1, 1, 1, 1, 1,
-0.8525056, -0.5474862, -1.306005, 1, 1, 1, 1, 1,
-0.8516149, 1.32773, -0.9961411, 1, 1, 1, 1, 1,
-0.8509467, 0.9013675, 1.48415, 1, 1, 1, 1, 1,
-0.8503121, -1.275391, -2.898101, 1, 1, 1, 1, 1,
-0.8454818, -0.7466547, 0.08303063, 1, 1, 1, 1, 1,
-0.8435374, 1.04117, -0.7083008, 1, 1, 1, 1, 1,
-0.8430968, 0.6319922, -2.085184, 1, 1, 1, 1, 1,
-0.8389185, 1.469461, -1.003028, 1, 1, 1, 1, 1,
-0.8331213, 0.6493388, -2.942003, 1, 1, 1, 1, 1,
-0.8296555, -0.676291, -2.690945, 1, 1, 1, 1, 1,
-0.8238378, -0.4853415, -3.034691, 1, 1, 1, 1, 1,
-0.8233024, -1.182313, -1.516482, 1, 1, 1, 1, 1,
-0.8175157, 1.078737, -0.741488, 1, 1, 1, 1, 1,
-0.8134696, 0.6867778, -0.7682814, 0, 0, 1, 1, 1,
-0.8128669, 0.8531488, -0.133147, 1, 0, 0, 1, 1,
-0.812726, -1.440065, -2.745282, 1, 0, 0, 1, 1,
-0.8105538, 0.3342383, 0.7201159, 1, 0, 0, 1, 1,
-0.8090534, -0.5350047, -2.886905, 1, 0, 0, 1, 1,
-0.80519, -0.1287147, -0.7255601, 1, 0, 0, 1, 1,
-0.8016642, 0.3093696, -3.2153, 0, 0, 0, 1, 1,
-0.7979219, 0.3972421, -0.7046545, 0, 0, 0, 1, 1,
-0.7977673, -0.2749628, -1.208846, 0, 0, 0, 1, 1,
-0.7954157, 0.5984614, -0.8509964, 0, 0, 0, 1, 1,
-0.790201, 0.462254, -1.300535, 0, 0, 0, 1, 1,
-0.7839008, 0.3755288, -2.205034, 0, 0, 0, 1, 1,
-0.7810348, 1.941661, -0.7474573, 0, 0, 0, 1, 1,
-0.7773061, -0.6918837, -2.134235, 1, 1, 1, 1, 1,
-0.775288, -0.08917033, -1.619476, 1, 1, 1, 1, 1,
-0.7738258, 0.2464427, -0.1888034, 1, 1, 1, 1, 1,
-0.7708275, 0.3323793, -1.126833, 1, 1, 1, 1, 1,
-0.7578313, -1.366325, -1.139859, 1, 1, 1, 1, 1,
-0.7564345, -0.8697668, -2.118687, 1, 1, 1, 1, 1,
-0.7528992, 1.218767, -0.5802394, 1, 1, 1, 1, 1,
-0.7489565, 0.4378824, -1.657054, 1, 1, 1, 1, 1,
-0.7460338, -0.09365379, 0.09083251, 1, 1, 1, 1, 1,
-0.7449638, 0.8101822, -1.250061, 1, 1, 1, 1, 1,
-0.7405673, -0.5425736, -3.027818, 1, 1, 1, 1, 1,
-0.7366613, 0.672025, -1.058325, 1, 1, 1, 1, 1,
-0.7363526, 2.005824, 0.1942411, 1, 1, 1, 1, 1,
-0.7350407, 1.298885, -0.6889722, 1, 1, 1, 1, 1,
-0.7346693, -0.3361859, -1.913784, 1, 1, 1, 1, 1,
-0.7319432, 0.8732132, -1.515319, 0, 0, 1, 1, 1,
-0.7230821, -0.8161135, -1.356608, 1, 0, 0, 1, 1,
-0.7222484, -1.612609, -2.384293, 1, 0, 0, 1, 1,
-0.7184727, 0.2740631, -1.753211, 1, 0, 0, 1, 1,
-0.7130644, 1.346829, 0.3230065, 1, 0, 0, 1, 1,
-0.7096493, -1.058329, -0.8710487, 1, 0, 0, 1, 1,
-0.7077, -0.5407209, -2.496374, 0, 0, 0, 1, 1,
-0.7073342, -0.3821963, -2.360457, 0, 0, 0, 1, 1,
-0.7004037, 0.7524413, -1.410019, 0, 0, 0, 1, 1,
-0.7002155, 1.152663, 0.005632503, 0, 0, 0, 1, 1,
-0.6984634, -1.430165, -3.641881, 0, 0, 0, 1, 1,
-0.690428, -0.5269181, -2.514416, 0, 0, 0, 1, 1,
-0.6900645, -0.2704015, -2.894845, 0, 0, 0, 1, 1,
-0.6878642, -0.693307, -2.184985, 1, 1, 1, 1, 1,
-0.6874362, -0.8792025, -1.883445, 1, 1, 1, 1, 1,
-0.6864017, 0.8976334, -0.8498074, 1, 1, 1, 1, 1,
-0.6835918, -0.4183772, -2.747926, 1, 1, 1, 1, 1,
-0.6835712, -0.7348221, -1.109185, 1, 1, 1, 1, 1,
-0.6711802, -0.1075415, -2.39321, 1, 1, 1, 1, 1,
-0.6655153, 0.3845579, 1.933004, 1, 1, 1, 1, 1,
-0.6564597, 1.284232, 1.405065, 1, 1, 1, 1, 1,
-0.6522433, -0.1161453, -2.813946, 1, 1, 1, 1, 1,
-0.6501728, 0.7922927, -1.99782, 1, 1, 1, 1, 1,
-0.6485354, 0.4795563, -2.619146, 1, 1, 1, 1, 1,
-0.6461818, 0.9332819, -0.5923979, 1, 1, 1, 1, 1,
-0.6382948, 1.541977, -0.2935052, 1, 1, 1, 1, 1,
-0.6373703, -1.210644, -3.573795, 1, 1, 1, 1, 1,
-0.6257237, 1.505863, 0.2832728, 1, 1, 1, 1, 1,
-0.6230332, 0.5750406, 0.3267717, 0, 0, 1, 1, 1,
-0.6190385, 1.713156, -0.5631136, 1, 0, 0, 1, 1,
-0.6188945, -0.4433283, -2.290692, 1, 0, 0, 1, 1,
-0.6162826, 1.027636, -1.202987, 1, 0, 0, 1, 1,
-0.6122919, -1.061042, -2.831284, 1, 0, 0, 1, 1,
-0.6114021, -0.2023844, -1.872722, 1, 0, 0, 1, 1,
-0.6108824, 0.1904581, -0.6617236, 0, 0, 0, 1, 1,
-0.5971233, -1.499439, -1.687309, 0, 0, 0, 1, 1,
-0.5960476, -1.279011, -2.556648, 0, 0, 0, 1, 1,
-0.5911574, 0.4885231, 0.8264132, 0, 0, 0, 1, 1,
-0.5873767, 0.7415708, -0.1683491, 0, 0, 0, 1, 1,
-0.5820647, 1.035458, -0.1037355, 0, 0, 0, 1, 1,
-0.5809238, -0.4141465, -2.626367, 0, 0, 0, 1, 1,
-0.5774912, -1.144411, -1.970364, 1, 1, 1, 1, 1,
-0.5772572, 1.262939, -0.4543057, 1, 1, 1, 1, 1,
-0.5751926, 2.067376, -1.169131, 1, 1, 1, 1, 1,
-0.574894, -0.5449912, -2.650008, 1, 1, 1, 1, 1,
-0.5738123, -0.2143992, -0.9873838, 1, 1, 1, 1, 1,
-0.5691311, -1.55765, -2.25435, 1, 1, 1, 1, 1,
-0.5690245, -0.1546515, -3.363396, 1, 1, 1, 1, 1,
-0.5688469, 1.335411, -1.441326, 1, 1, 1, 1, 1,
-0.5686166, 1.198438, -1.378312, 1, 1, 1, 1, 1,
-0.5683497, 1.209659, -0.05835922, 1, 1, 1, 1, 1,
-0.5640392, 0.06501194, -1.183812, 1, 1, 1, 1, 1,
-0.5610016, 1.040454, -1.494165, 1, 1, 1, 1, 1,
-0.5604001, 0.17775, -1.228346, 1, 1, 1, 1, 1,
-0.5531892, -1.136271, -2.472175, 1, 1, 1, 1, 1,
-0.550923, -0.2900766, -0.485079, 1, 1, 1, 1, 1,
-0.5465169, -0.8519014, -4.367106, 0, 0, 1, 1, 1,
-0.5460138, -0.1753531, -2.540294, 1, 0, 0, 1, 1,
-0.5443241, 2.551659, -0.9209079, 1, 0, 0, 1, 1,
-0.5435861, 0.6212431, -1.271946, 1, 0, 0, 1, 1,
-0.5427036, -1.28773, -1.872154, 1, 0, 0, 1, 1,
-0.5409755, 0.6189435, -1.944154, 1, 0, 0, 1, 1,
-0.5407878, -0.7833046, -1.678753, 0, 0, 0, 1, 1,
-0.540011, 0.8990478, -0.4827742, 0, 0, 0, 1, 1,
-0.5352192, -2.313329, -4.073874, 0, 0, 0, 1, 1,
-0.5288389, 0.1273721, -1.511261, 0, 0, 0, 1, 1,
-0.5283241, -0.1323792, -2.501525, 0, 0, 0, 1, 1,
-0.5228794, -0.1527746, -1.754966, 0, 0, 0, 1, 1,
-0.5168167, 0.9614364, -1.203536, 0, 0, 0, 1, 1,
-0.515642, -0.5115901, -0.8320385, 1, 1, 1, 1, 1,
-0.511916, 0.7791911, 0.04036483, 1, 1, 1, 1, 1,
-0.5086286, -1.484509, -4.302836, 1, 1, 1, 1, 1,
-0.507606, 0.4129361, -0.7921456, 1, 1, 1, 1, 1,
-0.5048606, 0.4626516, 0.1824242, 1, 1, 1, 1, 1,
-0.5022947, -0.9266943, -3.228498, 1, 1, 1, 1, 1,
-0.4987212, -0.9763128, -2.039785, 1, 1, 1, 1, 1,
-0.4956611, 0.1069869, -3.156789, 1, 1, 1, 1, 1,
-0.4948505, -0.02822053, -2.779807, 1, 1, 1, 1, 1,
-0.4940344, 1.520525, 0.1106982, 1, 1, 1, 1, 1,
-0.487437, -0.3744994, -1.205512, 1, 1, 1, 1, 1,
-0.4860516, -1.200246, -0.228477, 1, 1, 1, 1, 1,
-0.4858714, 0.4989918, -1.377927, 1, 1, 1, 1, 1,
-0.4817546, -0.4924942, -3.533732, 1, 1, 1, 1, 1,
-0.4793974, -1.723117, -2.360172, 1, 1, 1, 1, 1,
-0.4757022, -0.6120719, -3.566028, 0, 0, 1, 1, 1,
-0.4735826, 0.6052199, 0.9711502, 1, 0, 0, 1, 1,
-0.4585054, -1.084191, -3.0908, 1, 0, 0, 1, 1,
-0.4576287, 0.09892187, -1.84391, 1, 0, 0, 1, 1,
-0.4530947, 1.08897, -0.0686949, 1, 0, 0, 1, 1,
-0.4516351, 0.3506258, -1.769629, 1, 0, 0, 1, 1,
-0.4512885, -2.049911, -2.296943, 0, 0, 0, 1, 1,
-0.451021, -1.380663, -2.378284, 0, 0, 0, 1, 1,
-0.4488093, 1.050233, -1.34965, 0, 0, 0, 1, 1,
-0.4466171, -1.226914, -1.989867, 0, 0, 0, 1, 1,
-0.4426067, -0.7805284, -4.043088, 0, 0, 0, 1, 1,
-0.4413877, 0.1438811, -0.08380739, 0, 0, 0, 1, 1,
-0.4408784, -1.246939, -3.53505, 0, 0, 0, 1, 1,
-0.4373558, 0.2036533, -0.9484112, 1, 1, 1, 1, 1,
-0.4357552, -0.683965, -0.8621489, 1, 1, 1, 1, 1,
-0.4344683, 0.250042, 0.1360811, 1, 1, 1, 1, 1,
-0.4250606, 0.6750971, 0.1938885, 1, 1, 1, 1, 1,
-0.4238817, 0.1825601, -3.602635, 1, 1, 1, 1, 1,
-0.4136751, 1.247423, -0.7557194, 1, 1, 1, 1, 1,
-0.4116424, 0.2353031, -1.419936, 1, 1, 1, 1, 1,
-0.4098525, 0.541132, -0.09273225, 1, 1, 1, 1, 1,
-0.4087591, 1.209467, -2.041569, 1, 1, 1, 1, 1,
-0.4073844, 0.1657717, -0.01342585, 1, 1, 1, 1, 1,
-0.4070257, -0.6225576, -3.787444, 1, 1, 1, 1, 1,
-0.4061857, 0.4440443, -1.435295, 1, 1, 1, 1, 1,
-0.4007645, -0.2983421, -2.104119, 1, 1, 1, 1, 1,
-0.3987206, -1.016023, -2.807521, 1, 1, 1, 1, 1,
-0.3984274, 0.8192309, 1.067825, 1, 1, 1, 1, 1,
-0.3972363, 0.07569841, -1.948556, 0, 0, 1, 1, 1,
-0.3943669, 0.5727847, -1.867319, 1, 0, 0, 1, 1,
-0.3919206, 0.2705075, 0.6795698, 1, 0, 0, 1, 1,
-0.3897506, 1.75359, 0.7709336, 1, 0, 0, 1, 1,
-0.385248, -0.3637507, -2.647137, 1, 0, 0, 1, 1,
-0.3842324, -0.8626291, -1.512403, 1, 0, 0, 1, 1,
-0.379617, -2.10705, -4.450154, 0, 0, 0, 1, 1,
-0.3777154, -2.549423, -4.186135, 0, 0, 0, 1, 1,
-0.3734528, -1.121916, -1.522527, 0, 0, 0, 1, 1,
-0.3727886, 0.3819667, -2.426888, 0, 0, 0, 1, 1,
-0.371235, 0.1663733, -0.4010047, 0, 0, 0, 1, 1,
-0.3696885, 0.1044604, -1.970955, 0, 0, 0, 1, 1,
-0.3674456, -1.162634, -1.621551, 0, 0, 0, 1, 1,
-0.366892, -2.286466, -3.541185, 1, 1, 1, 1, 1,
-0.3612871, -1.921058, -4.994453, 1, 1, 1, 1, 1,
-0.3603317, -2.257769, -3.332572, 1, 1, 1, 1, 1,
-0.3593016, -0.5811138, -3.55256, 1, 1, 1, 1, 1,
-0.3578574, -1.6393, -1.632801, 1, 1, 1, 1, 1,
-0.3561704, 1.318969, -0.2944348, 1, 1, 1, 1, 1,
-0.3560904, -0.4266112, -1.719934, 1, 1, 1, 1, 1,
-0.3544197, 0.2251551, -0.5719681, 1, 1, 1, 1, 1,
-0.3528939, -0.7681819, -2.405194, 1, 1, 1, 1, 1,
-0.3479755, 1.124336, 0.1856535, 1, 1, 1, 1, 1,
-0.3476802, 0.3021766, -0.1473373, 1, 1, 1, 1, 1,
-0.3450466, 1.051246, 0.3782408, 1, 1, 1, 1, 1,
-0.3358161, 0.400614, -0.8271931, 1, 1, 1, 1, 1,
-0.3348998, 0.7257405, 1.311979, 1, 1, 1, 1, 1,
-0.3333654, -0.150694, -3.231143, 1, 1, 1, 1, 1,
-0.3288758, -1.175445, -2.579506, 0, 0, 1, 1, 1,
-0.3246422, -0.100794, -2.637827, 1, 0, 0, 1, 1,
-0.324264, -1.812898, -2.444566, 1, 0, 0, 1, 1,
-0.323868, -0.6630312, -2.715844, 1, 0, 0, 1, 1,
-0.3206038, -0.7986989, -2.398812, 1, 0, 0, 1, 1,
-0.3198168, 0.108176, -4.34985, 1, 0, 0, 1, 1,
-0.3195679, -1.009724, -2.491956, 0, 0, 0, 1, 1,
-0.3082142, 0.5454876, -1.84201, 0, 0, 0, 1, 1,
-0.3071516, -2.004384, -3.659009, 0, 0, 0, 1, 1,
-0.3067339, 1.134638, 0.2486803, 0, 0, 0, 1, 1,
-0.3046204, -1.900895, -5.373477, 0, 0, 0, 1, 1,
-0.304137, 1.626894, -1.076792, 0, 0, 0, 1, 1,
-0.2980332, -0.8495164, -3.163169, 0, 0, 0, 1, 1,
-0.2972335, -0.7636186, -4.504613, 1, 1, 1, 1, 1,
-0.296682, -2.451145, -2.305269, 1, 1, 1, 1, 1,
-0.2950395, 0.1759741, -0.2475295, 1, 1, 1, 1, 1,
-0.2930832, -0.3058096, -2.598292, 1, 1, 1, 1, 1,
-0.2897855, 0.0141371, -1.222512, 1, 1, 1, 1, 1,
-0.2890271, -0.5637135, -1.668301, 1, 1, 1, 1, 1,
-0.2871559, -1.948343, -3.87145, 1, 1, 1, 1, 1,
-0.2867976, 0.627483, -1.405572, 1, 1, 1, 1, 1,
-0.2854735, 0.37489, -0.9376348, 1, 1, 1, 1, 1,
-0.283172, 0.6397823, -1.237772, 1, 1, 1, 1, 1,
-0.2807358, 0.4809271, 0.3572933, 1, 1, 1, 1, 1,
-0.2793314, 0.6448292, -3.275311, 1, 1, 1, 1, 1,
-0.2779116, 0.7347608, 1.389849, 1, 1, 1, 1, 1,
-0.2769211, -0.3928834, -0.5418678, 1, 1, 1, 1, 1,
-0.2741171, 1.124243, -0.679274, 1, 1, 1, 1, 1,
-0.2702882, 1.219608, -0.4993529, 0, 0, 1, 1, 1,
-0.2674122, 0.1315559, -1.218449, 1, 0, 0, 1, 1,
-0.2668959, -1.845736, -3.128435, 1, 0, 0, 1, 1,
-0.2662459, -0.6748673, -3.2722, 1, 0, 0, 1, 1,
-0.2620915, 0.1159574, -2.750771, 1, 0, 0, 1, 1,
-0.2596508, -1.604787, -6.751009, 1, 0, 0, 1, 1,
-0.2595497, 0.4867925, -1.680898, 0, 0, 0, 1, 1,
-0.2585265, 2.005434, 0.3509674, 0, 0, 0, 1, 1,
-0.254969, 0.07334936, -0.2349058, 0, 0, 0, 1, 1,
-0.2520251, -1.149672, -2.293788, 0, 0, 0, 1, 1,
-0.2492647, -0.5727005, -3.374465, 0, 0, 0, 1, 1,
-0.2482222, 0.4547354, 1.151674, 0, 0, 0, 1, 1,
-0.2402994, 0.5251614, 1.286171, 0, 0, 0, 1, 1,
-0.2368715, -0.4199297, -2.86506, 1, 1, 1, 1, 1,
-0.2356041, 1.531807, 0.6599011, 1, 1, 1, 1, 1,
-0.2340584, 1.342081, -0.9914619, 1, 1, 1, 1, 1,
-0.2331136, -1.499556, -2.331702, 1, 1, 1, 1, 1,
-0.2324176, 2.060436, -0.05129178, 1, 1, 1, 1, 1,
-0.2319046, -0.1249048, -0.3641836, 1, 1, 1, 1, 1,
-0.2305265, -0.8554, -0.9334264, 1, 1, 1, 1, 1,
-0.2285848, -0.3483786, -3.086713, 1, 1, 1, 1, 1,
-0.2285514, 0.8698998, -0.2200469, 1, 1, 1, 1, 1,
-0.2283901, -2.312307, -5.100252, 1, 1, 1, 1, 1,
-0.2277101, -0.1240555, -2.707738, 1, 1, 1, 1, 1,
-0.2245073, -0.9252959, -4.182143, 1, 1, 1, 1, 1,
-0.2218102, -0.1188037, -0.8351325, 1, 1, 1, 1, 1,
-0.2166972, -2.171039, -2.60831, 1, 1, 1, 1, 1,
-0.2148398, -0.7455503, -1.600843, 1, 1, 1, 1, 1,
-0.2122291, -0.1140781, -3.890699, 0, 0, 1, 1, 1,
-0.212225, -0.04898196, -1.773007, 1, 0, 0, 1, 1,
-0.2120588, 0.3367178, -1.250968, 1, 0, 0, 1, 1,
-0.2112873, -0.160077, -1.403886, 1, 0, 0, 1, 1,
-0.2035666, 0.2713074, -1.159163, 1, 0, 0, 1, 1,
-0.1987544, -0.7738923, -4.693866, 1, 0, 0, 1, 1,
-0.1977071, 1.625914, 0.5629074, 0, 0, 0, 1, 1,
-0.193758, 0.05527193, -0.0995135, 0, 0, 0, 1, 1,
-0.1930182, 1.086043, 0.2854825, 0, 0, 0, 1, 1,
-0.1915265, 0.006565277, -0.2836345, 0, 0, 0, 1, 1,
-0.1899123, 0.02722796, -1.75033, 0, 0, 0, 1, 1,
-0.1844517, -0.755263, -1.757174, 0, 0, 0, 1, 1,
-0.1825226, -0.1125249, -1.846847, 0, 0, 0, 1, 1,
-0.1823106, 0.06049917, -0.8173464, 1, 1, 1, 1, 1,
-0.1672812, 0.4013596, -0.03583795, 1, 1, 1, 1, 1,
-0.162763, -0.3360633, -1.729376, 1, 1, 1, 1, 1,
-0.1599195, -1.491468, -1.985443, 1, 1, 1, 1, 1,
-0.1575317, 1.545399, 0.3796228, 1, 1, 1, 1, 1,
-0.1571243, 0.174938, -0.4435431, 1, 1, 1, 1, 1,
-0.1552028, -0.1122564, -1.433564, 1, 1, 1, 1, 1,
-0.1528818, -0.6253259, -2.114991, 1, 1, 1, 1, 1,
-0.1492635, -0.3242649, -2.465729, 1, 1, 1, 1, 1,
-0.1442692, -0.7227057, -3.389407, 1, 1, 1, 1, 1,
-0.1424717, 0.6482207, -1.153713, 1, 1, 1, 1, 1,
-0.1385258, -0.5654547, -2.120416, 1, 1, 1, 1, 1,
-0.1358436, -0.6280037, -2.654721, 1, 1, 1, 1, 1,
-0.1310673, 0.210061, -0.07588328, 1, 1, 1, 1, 1,
-0.1294836, -0.6879266, -1.950986, 1, 1, 1, 1, 1,
-0.1269727, -0.0482359, -2.577048, 0, 0, 1, 1, 1,
-0.1267, 0.8537807, -2.068323, 1, 0, 0, 1, 1,
-0.1248239, -0.04885966, -1.210422, 1, 0, 0, 1, 1,
-0.1247129, 0.3274365, -1.022433, 1, 0, 0, 1, 1,
-0.1245342, -0.3717908, -2.957719, 1, 0, 0, 1, 1,
-0.1220514, -1.123759, -2.926282, 1, 0, 0, 1, 1,
-0.1204249, -0.6791667, -0.1347377, 0, 0, 0, 1, 1,
-0.1169155, -1.924416, -2.434656, 0, 0, 0, 1, 1,
-0.1146886, 0.8997038, 0.06991938, 0, 0, 0, 1, 1,
-0.1138958, -0.6059809, -1.881091, 0, 0, 0, 1, 1,
-0.1124539, 1.343788, 0.6413589, 0, 0, 0, 1, 1,
-0.1068985, -1.042889, -3.970242, 0, 0, 0, 1, 1,
-0.1036394, -1.277254, -4.397323, 0, 0, 0, 1, 1,
-0.09638402, 1.189478, 0.1315398, 1, 1, 1, 1, 1,
-0.09530224, 0.9833893, -0.01211465, 1, 1, 1, 1, 1,
-0.09506984, 0.6310835, 0.455972, 1, 1, 1, 1, 1,
-0.09246765, -0.3529664, -3.487976, 1, 1, 1, 1, 1,
-0.09189633, -0.5229465, -2.393001, 1, 1, 1, 1, 1,
-0.09101216, 1.201563, 0.6368806, 1, 1, 1, 1, 1,
-0.09041238, -1.101076, -4.766866, 1, 1, 1, 1, 1,
-0.0883825, 1.217052, -1.088229, 1, 1, 1, 1, 1,
-0.08796994, -1.918786, -3.990925, 1, 1, 1, 1, 1,
-0.08443657, 2.675049, 0.9200591, 1, 1, 1, 1, 1,
-0.08356995, 0.8157584, 0.8113562, 1, 1, 1, 1, 1,
-0.0817664, 0.2241047, -1.185319, 1, 1, 1, 1, 1,
-0.0805811, 1.197371, -0.04187158, 1, 1, 1, 1, 1,
-0.0791797, -0.6452848, -2.94126, 1, 1, 1, 1, 1,
-0.07368292, -0.1690807, -3.070968, 1, 1, 1, 1, 1,
-0.06088771, 1.325189, 1.047122, 0, 0, 1, 1, 1,
-0.06080835, 0.1548035, -0.954961, 1, 0, 0, 1, 1,
-0.06019762, 0.5537574, -0.7071782, 1, 0, 0, 1, 1,
-0.05141011, -0.5732998, -1.590666, 1, 0, 0, 1, 1,
-0.04808323, -0.5860355, -4.435624, 1, 0, 0, 1, 1,
-0.04520245, 1.288581, 0.5220599, 1, 0, 0, 1, 1,
-0.03803965, 0.8302889, 0.8054585, 0, 0, 0, 1, 1,
-0.03005154, 0.2748038, 1.611149, 0, 0, 0, 1, 1,
-0.02251587, -1.045966, -3.007825, 0, 0, 0, 1, 1,
-0.01626296, -0.6662382, -3.847203, 0, 0, 0, 1, 1,
-0.01577261, -2.001051, -2.087579, 0, 0, 0, 1, 1,
-0.01512498, 1.375138, -0.03618145, 0, 0, 0, 1, 1,
-0.01488347, -0.09182268, -4.635602, 0, 0, 0, 1, 1,
-0.01378324, -0.4796824, -2.592188, 1, 1, 1, 1, 1,
-0.01223593, -0.2767544, -3.581522, 1, 1, 1, 1, 1,
-0.01182971, -1.240889, -3.753498, 1, 1, 1, 1, 1,
-0.005402538, -1.582949, -2.97941, 1, 1, 1, 1, 1,
-0.00309103, -0.5873014, -4.876241, 1, 1, 1, 1, 1,
0.006315566, 0.5595862, 0.04000436, 1, 1, 1, 1, 1,
0.008391992, 0.01106499, 0.3036491, 1, 1, 1, 1, 1,
0.0102887, -0.3893894, 5.932929, 1, 1, 1, 1, 1,
0.01114133, 0.5507519, 0.9877394, 1, 1, 1, 1, 1,
0.01847456, 0.416821, 0.2995899, 1, 1, 1, 1, 1,
0.02263698, -0.4359803, 2.803447, 1, 1, 1, 1, 1,
0.02301571, -1.156429, 3.33978, 1, 1, 1, 1, 1,
0.02365142, -1.28493, 3.16511, 1, 1, 1, 1, 1,
0.0263994, 0.7723286, 2.358478, 1, 1, 1, 1, 1,
0.02759084, 0.9051102, 0.6784166, 1, 1, 1, 1, 1,
0.03305753, 0.6553594, -1.08875, 0, 0, 1, 1, 1,
0.03368736, -2.228578, 2.211095, 1, 0, 0, 1, 1,
0.03371752, 0.8354535, -0.998523, 1, 0, 0, 1, 1,
0.04247788, 1.972653, -0.8234994, 1, 0, 0, 1, 1,
0.04329337, 0.2610851, -0.3932827, 1, 0, 0, 1, 1,
0.04913565, 0.2176232, -0.2508364, 1, 0, 0, 1, 1,
0.0502561, -0.09962991, 2.512364, 0, 0, 0, 1, 1,
0.05280754, -0.3675869, 2.212457, 0, 0, 0, 1, 1,
0.05381971, -1.24649, 2.377784, 0, 0, 0, 1, 1,
0.05534654, 0.705815, -0.335605, 0, 0, 0, 1, 1,
0.05667973, 0.2299381, 0.3212253, 0, 0, 0, 1, 1,
0.06432048, -0.372582, 2.903666, 0, 0, 0, 1, 1,
0.06488584, 1.617948, -1.390753, 0, 0, 0, 1, 1,
0.06524911, -0.6274672, 4.028782, 1, 1, 1, 1, 1,
0.06951997, -0.7301549, 3.696421, 1, 1, 1, 1, 1,
0.07586483, -0.08625402, 2.086871, 1, 1, 1, 1, 1,
0.07777958, -1.206655, 4.077531, 1, 1, 1, 1, 1,
0.08793737, -0.7783313, 3.350919, 1, 1, 1, 1, 1,
0.0986117, 0.8819318, -1.029245, 1, 1, 1, 1, 1,
0.1018913, 0.5936856, 0.2593873, 1, 1, 1, 1, 1,
0.1044164, 0.8844376, 0.7911775, 1, 1, 1, 1, 1,
0.1078071, 0.8415098, -0.7608696, 1, 1, 1, 1, 1,
0.1078098, 0.5360947, -0.2976127, 1, 1, 1, 1, 1,
0.1080375, -1.920437, 4.011974, 1, 1, 1, 1, 1,
0.1100031, -1.603794, 4.203071, 1, 1, 1, 1, 1,
0.1104558, -2.018249, 4.064096, 1, 1, 1, 1, 1,
0.1124576, 0.6427251, 0.8328497, 1, 1, 1, 1, 1,
0.1139884, 0.6484123, 0.4108212, 1, 1, 1, 1, 1,
0.1169163, 0.1349339, 2.163552, 0, 0, 1, 1, 1,
0.1184215, 1.03953, -0.6382659, 1, 0, 0, 1, 1,
0.1186648, 1.796778, 1.393406, 1, 0, 0, 1, 1,
0.1186726, 2.429494, 0.373363, 1, 0, 0, 1, 1,
0.119571, -1.785296, 2.856108, 1, 0, 0, 1, 1,
0.1221061, 0.5385745, 0.7780296, 1, 0, 0, 1, 1,
0.1250854, -1.418575, 2.972286, 0, 0, 0, 1, 1,
0.1260411, -0.121376, 1.966007, 0, 0, 0, 1, 1,
0.1295583, -0.5338351, 1.869082, 0, 0, 0, 1, 1,
0.1356104, -0.3177188, 1.882802, 0, 0, 0, 1, 1,
0.1356316, 0.356291, 0.2636925, 0, 0, 0, 1, 1,
0.1371061, -1.090147, 1.059254, 0, 0, 0, 1, 1,
0.139387, 1.367856, -1.645737, 0, 0, 0, 1, 1,
0.1417972, 0.2362071, -0.2171691, 1, 1, 1, 1, 1,
0.1420423, -0.3380859, 1.756557, 1, 1, 1, 1, 1,
0.1422035, 1.268731, 0.9352127, 1, 1, 1, 1, 1,
0.1453366, -1.420406, 4.150524, 1, 1, 1, 1, 1,
0.1476764, 0.251822, 1.095861, 1, 1, 1, 1, 1,
0.1529274, 1.085176, 1.042895, 1, 1, 1, 1, 1,
0.1536149, -0.5003347, 2.32865, 1, 1, 1, 1, 1,
0.1574098, 0.9754084, -0.9589767, 1, 1, 1, 1, 1,
0.1589563, 0.2288906, 1.393329, 1, 1, 1, 1, 1,
0.1603323, 0.7895851, 1.682335, 1, 1, 1, 1, 1,
0.1612479, 2.453652, 0.04154247, 1, 1, 1, 1, 1,
0.1658626, 0.7220364, -1.957793, 1, 1, 1, 1, 1,
0.1689198, -0.09046859, 1.593952, 1, 1, 1, 1, 1,
0.1763235, 2.094512, -1.090149, 1, 1, 1, 1, 1,
0.1773032, -2.388354, 4.213525, 1, 1, 1, 1, 1,
0.1813078, -0.2209728, 0.1048837, 0, 0, 1, 1, 1,
0.1825764, -0.5039801, 2.263667, 1, 0, 0, 1, 1,
0.1843969, 1.125875, -1.535396, 1, 0, 0, 1, 1,
0.1859815, 0.1736606, 0.9874907, 1, 0, 0, 1, 1,
0.1872699, 0.7419807, -0.3141062, 1, 0, 0, 1, 1,
0.2041656, -1.065803, 2.131175, 1, 0, 0, 1, 1,
0.205125, -0.5767199, 1.134878, 0, 0, 0, 1, 1,
0.2093333, 0.1183695, 1.28038, 0, 0, 0, 1, 1,
0.2099959, 1.161419, 1.349542, 0, 0, 0, 1, 1,
0.2177731, -0.3291419, 1.469257, 0, 0, 0, 1, 1,
0.2188198, 0.7932073, 0.07690281, 0, 0, 0, 1, 1,
0.2210469, -0.4584686, 2.505582, 0, 0, 0, 1, 1,
0.2214114, 1.958059, 0.002419776, 0, 0, 0, 1, 1,
0.2231513, -0.8267745, 3.010485, 1, 1, 1, 1, 1,
0.2277053, 0.2362411, 0.262821, 1, 1, 1, 1, 1,
0.2295149, -0.513467, 3.312185, 1, 1, 1, 1, 1,
0.2328675, -1.111729, 2.056468, 1, 1, 1, 1, 1,
0.2356056, -0.8326539, 2.728802, 1, 1, 1, 1, 1,
0.2359686, 0.5750393, -0.2936374, 1, 1, 1, 1, 1,
0.2395647, -0.1079482, 3.661809, 1, 1, 1, 1, 1,
0.2437925, 0.7734458, 1.453077, 1, 1, 1, 1, 1,
0.2443338, -1.512314, 4.666624, 1, 1, 1, 1, 1,
0.2454915, -0.1904721, 1.717008, 1, 1, 1, 1, 1,
0.2481863, 1.849375, 0.9169669, 1, 1, 1, 1, 1,
0.2498858, -1.041753, 1.995503, 1, 1, 1, 1, 1,
0.2520871, 0.989483, 1.119676, 1, 1, 1, 1, 1,
0.2532204, 0.8417093, -0.1244494, 1, 1, 1, 1, 1,
0.2545783, -0.5354458, 1.56953, 1, 1, 1, 1, 1,
0.2589666, -0.09700643, 1.089767, 0, 0, 1, 1, 1,
0.2591873, 0.1982338, 0.4655801, 1, 0, 0, 1, 1,
0.2597321, 0.5034906, 1.178756, 1, 0, 0, 1, 1,
0.2624853, 0.8981776, 0.6182573, 1, 0, 0, 1, 1,
0.2634844, 0.485806, 0.2276991, 1, 0, 0, 1, 1,
0.266834, 0.001961919, 2.325788, 1, 0, 0, 1, 1,
0.2685027, -1.843579, 2.280185, 0, 0, 0, 1, 1,
0.2726648, -0.4567627, 2.053822, 0, 0, 0, 1, 1,
0.2777659, -0.3353248, 1.718336, 0, 0, 0, 1, 1,
0.2787412, 0.7111347, 0.4332695, 0, 0, 0, 1, 1,
0.2796116, 1.236198, 0.536154, 0, 0, 0, 1, 1,
0.2816127, 1.463126, -1.011102, 0, 0, 0, 1, 1,
0.2822483, 1.732816, 0.3075404, 0, 0, 0, 1, 1,
0.2872562, -0.5961946, 2.041063, 1, 1, 1, 1, 1,
0.2888611, 0.3437381, 0.3725073, 1, 1, 1, 1, 1,
0.2902182, 0.8253039, 1.512712, 1, 1, 1, 1, 1,
0.2923086, 0.1074135, 0.2923744, 1, 1, 1, 1, 1,
0.2962203, -0.6365237, 2.685228, 1, 1, 1, 1, 1,
0.2976234, -0.3200215, 2.663799, 1, 1, 1, 1, 1,
0.3005818, 0.007194295, 0.9886064, 1, 1, 1, 1, 1,
0.3045436, 0.5035417, -0.9413775, 1, 1, 1, 1, 1,
0.3051095, -0.08341895, 1.767641, 1, 1, 1, 1, 1,
0.3052481, 1.083352, 0.305457, 1, 1, 1, 1, 1,
0.3067634, -2.395735, 2.850947, 1, 1, 1, 1, 1,
0.313156, 1.115833, -0.0784464, 1, 1, 1, 1, 1,
0.3171587, 0.663587, -0.2253528, 1, 1, 1, 1, 1,
0.3224955, -0.6756536, 1.407743, 1, 1, 1, 1, 1,
0.3238145, 0.1867603, 1.4189, 1, 1, 1, 1, 1,
0.3238321, 1.204684, 1.054223, 0, 0, 1, 1, 1,
0.3254996, 3.23038, -0.02365424, 1, 0, 0, 1, 1,
0.3269122, -0.9352078, 3.970444, 1, 0, 0, 1, 1,
0.3327373, 0.5658033, -0.6028559, 1, 0, 0, 1, 1,
0.338609, -1.373384, 3.547773, 1, 0, 0, 1, 1,
0.3392269, -2.36985, 1.777231, 1, 0, 0, 1, 1,
0.3399348, 1.189296, -0.3999635, 0, 0, 0, 1, 1,
0.3399564, 1.433321, -0.0494027, 0, 0, 0, 1, 1,
0.3401146, -0.8602869, 3.406758, 0, 0, 0, 1, 1,
0.3410839, -0.1674334, 0.3746734, 0, 0, 0, 1, 1,
0.3421868, 1.184838, -0.381498, 0, 0, 0, 1, 1,
0.3422813, -0.8387282, 1.917449, 0, 0, 0, 1, 1,
0.3435669, -1.068178, 1.85383, 0, 0, 0, 1, 1,
0.3460363, -2.044543, 1.468061, 1, 1, 1, 1, 1,
0.3470049, -0.08864143, 5.075464, 1, 1, 1, 1, 1,
0.3506701, 0.3675018, -0.5701197, 1, 1, 1, 1, 1,
0.3588439, -0.06968606, 2.154797, 1, 1, 1, 1, 1,
0.3605773, -0.9680144, 2.738239, 1, 1, 1, 1, 1,
0.3642279, -1.318664, 2.818891, 1, 1, 1, 1, 1,
0.3726934, 2.043404, -0.1842648, 1, 1, 1, 1, 1,
0.3732031, 1.287464, -0.4505183, 1, 1, 1, 1, 1,
0.3736742, -0.9856324, 4.12774, 1, 1, 1, 1, 1,
0.3761263, 1.350308, 0.7931093, 1, 1, 1, 1, 1,
0.3775412, -0.8035948, 2.073042, 1, 1, 1, 1, 1,
0.382665, 0.4706389, -0.6091629, 1, 1, 1, 1, 1,
0.3830195, -0.4602312, 1.944501, 1, 1, 1, 1, 1,
0.3838134, -0.7707789, 2.988021, 1, 1, 1, 1, 1,
0.3938538, -0.3693055, 0.8023606, 1, 1, 1, 1, 1,
0.3969515, -2.541712, 1.851401, 0, 0, 1, 1, 1,
0.3995904, 1.395984, 0.1066667, 1, 0, 0, 1, 1,
0.4008477, -0.4899896, 2.203045, 1, 0, 0, 1, 1,
0.4017126, 0.985023, 0.9931777, 1, 0, 0, 1, 1,
0.406233, -0.9544439, 3.901675, 1, 0, 0, 1, 1,
0.4067267, -0.2943775, 3.748511, 1, 0, 0, 1, 1,
0.4087418, -1.378278, 4.674247, 0, 0, 0, 1, 1,
0.4104846, 0.06082665, 1.340398, 0, 0, 0, 1, 1,
0.4109329, 1.372353, 2.387313, 0, 0, 0, 1, 1,
0.4131106, 1.305809, 0.2233635, 0, 0, 0, 1, 1,
0.4145155, 0.278945, 0.6205741, 0, 0, 0, 1, 1,
0.4149648, -0.6732991, 3.340776, 0, 0, 0, 1, 1,
0.4153727, 0.533161, -0.6104252, 0, 0, 0, 1, 1,
0.4167298, 1.41449, 0.1902633, 1, 1, 1, 1, 1,
0.4195307, -0.1162786, 0.4248612, 1, 1, 1, 1, 1,
0.4198558, 0.2171415, 2.146135, 1, 1, 1, 1, 1,
0.421569, -1.374333, 2.44907, 1, 1, 1, 1, 1,
0.4218793, -1.696636, 2.826711, 1, 1, 1, 1, 1,
0.4291363, -0.7034871, 2.077532, 1, 1, 1, 1, 1,
0.4298046, -0.4543941, 1.981623, 1, 1, 1, 1, 1,
0.4314393, -0.5754988, 2.874824, 1, 1, 1, 1, 1,
0.4348399, -0.6161317, 2.359199, 1, 1, 1, 1, 1,
0.4358167, 0.7131168, -0.4157997, 1, 1, 1, 1, 1,
0.4367962, -1.158589, 2.760183, 1, 1, 1, 1, 1,
0.4396029, 0.5483173, 1.159912, 1, 1, 1, 1, 1,
0.4411062, -1.030716, 3.406534, 1, 1, 1, 1, 1,
0.4423546, 0.207384, 1.20007, 1, 1, 1, 1, 1,
0.4426987, 0.3696439, 1.678348, 1, 1, 1, 1, 1,
0.4458188, 0.6045235, 1.184493, 0, 0, 1, 1, 1,
0.4458515, -2.080449, 3.968346, 1, 0, 0, 1, 1,
0.4473816, 0.7302857, 1.274553, 1, 0, 0, 1, 1,
0.4558558, -0.05452638, 1.480034, 1, 0, 0, 1, 1,
0.4565358, 0.4783761, 0.2908944, 1, 0, 0, 1, 1,
0.4587258, -0.614209, 2.001737, 1, 0, 0, 1, 1,
0.4634135, -0.1934296, 2.680843, 0, 0, 0, 1, 1,
0.480619, -0.865378, 2.584987, 0, 0, 0, 1, 1,
0.481904, -0.4551526, 1.297833, 0, 0, 0, 1, 1,
0.4822344, -1.368711, 3.058673, 0, 0, 0, 1, 1,
0.4835779, 1.834086, 0.5050417, 0, 0, 0, 1, 1,
0.4837416, -1.234662, 2.642087, 0, 0, 0, 1, 1,
0.4850179, 0.2100652, 2.308788, 0, 0, 0, 1, 1,
0.4890886, -1.724554, 3.436726, 1, 1, 1, 1, 1,
0.4930236, -1.158644, 1.828166, 1, 1, 1, 1, 1,
0.4935454, 0.6573201, -0.2322738, 1, 1, 1, 1, 1,
0.4938818, 0.851959, 2.032125, 1, 1, 1, 1, 1,
0.4980051, 1.670073, -0.9751093, 1, 1, 1, 1, 1,
0.5003731, 0.06521851, 0.4104693, 1, 1, 1, 1, 1,
0.5006984, 0.5801563, 0.1183385, 1, 1, 1, 1, 1,
0.5024889, 0.9674053, -0.2906814, 1, 1, 1, 1, 1,
0.5078056, 0.1908077, 1.77133, 1, 1, 1, 1, 1,
0.5088291, -0.8580362, -0.3327556, 1, 1, 1, 1, 1,
0.5132928, 1.512222, 0.7949244, 1, 1, 1, 1, 1,
0.5162727, 1.110736, 1.017262, 1, 1, 1, 1, 1,
0.516619, -0.6330895, 5.267375, 1, 1, 1, 1, 1,
0.5208964, -1.455742, 0.2945364, 1, 1, 1, 1, 1,
0.520971, -1.386937, 1.791302, 1, 1, 1, 1, 1,
0.5210295, -0.3665503, 1.713319, 0, 0, 1, 1, 1,
0.5224275, 2.142962, 0.1463851, 1, 0, 0, 1, 1,
0.5227909, -0.7063966, 1.572092, 1, 0, 0, 1, 1,
0.5363553, 0.5864417, 0.1854865, 1, 0, 0, 1, 1,
0.5379354, -0.2876272, 0.5302309, 1, 0, 0, 1, 1,
0.5423204, -0.5266142, 2.243434, 1, 0, 0, 1, 1,
0.5458125, 1.940925, 1.601772, 0, 0, 0, 1, 1,
0.5500859, -0.2861754, 1.572049, 0, 0, 0, 1, 1,
0.5579029, -0.9410865, 2.749486, 0, 0, 0, 1, 1,
0.5666304, -0.4734903, 3.157821, 0, 0, 0, 1, 1,
0.5733011, 1.745683, -0.1980311, 0, 0, 0, 1, 1,
0.5800302, -1.326758, 3.040413, 0, 0, 0, 1, 1,
0.5811221, -1.269674, -0.2091434, 0, 0, 0, 1, 1,
0.5814085, 0.8434675, 1.006652, 1, 1, 1, 1, 1,
0.5826265, 0.598767, 2.206129, 1, 1, 1, 1, 1,
0.5827068, -1.961902, 3.789446, 1, 1, 1, 1, 1,
0.5829499, -0.2920659, 2.376674, 1, 1, 1, 1, 1,
0.5841314, 0.2348005, 2.220597, 1, 1, 1, 1, 1,
0.5842152, 0.7002484, 2.113614, 1, 1, 1, 1, 1,
0.5857453, 3.16587, 1.450639, 1, 1, 1, 1, 1,
0.5878764, 1.382644, -1.799334, 1, 1, 1, 1, 1,
0.5995591, -0.1449283, 1.286323, 1, 1, 1, 1, 1,
0.6001333, 0.6759611, 2.330459, 1, 1, 1, 1, 1,
0.6013684, 1.986659, 0.4662518, 1, 1, 1, 1, 1,
0.602814, 1.323913, 0.4870795, 1, 1, 1, 1, 1,
0.6072615, -0.7444805, 1.483939, 1, 1, 1, 1, 1,
0.608138, -0.9708586, 3.345658, 1, 1, 1, 1, 1,
0.610224, 1.014697, 1.438846, 1, 1, 1, 1, 1,
0.6118706, 0.8462566, 0.1995426, 0, 0, 1, 1, 1,
0.6135966, -0.3242688, 1.262493, 1, 0, 0, 1, 1,
0.6226636, 0.1634169, 0.8663595, 1, 0, 0, 1, 1,
0.6233421, -0.0788402, 0.714123, 1, 0, 0, 1, 1,
0.6239295, 0.8635333, 0.007756587, 1, 0, 0, 1, 1,
0.6245263, 0.8563018, 1.201622, 1, 0, 0, 1, 1,
0.6250635, 1.164425, -0.06992548, 0, 0, 0, 1, 1,
0.6254075, -0.2539269, 2.129121, 0, 0, 0, 1, 1,
0.6294206, 0.2324417, 0.3687165, 0, 0, 0, 1, 1,
0.6299807, -0.2159798, 3.619091, 0, 0, 0, 1, 1,
0.6328183, 0.5475333, 1.244551, 0, 0, 0, 1, 1,
0.6336721, -1.334112, 0.9824406, 0, 0, 0, 1, 1,
0.6362929, -1.78583, 0.6637843, 0, 0, 0, 1, 1,
0.636409, -0.3397028, 1.598989, 1, 1, 1, 1, 1,
0.637427, -0.7369449, 3.040092, 1, 1, 1, 1, 1,
0.638295, -0.8903134, 1.784697, 1, 1, 1, 1, 1,
0.6432508, 1.199644, 0.3640109, 1, 1, 1, 1, 1,
0.6464112, -0.2454323, 3.058459, 1, 1, 1, 1, 1,
0.6499121, 1.707897, 0.8910227, 1, 1, 1, 1, 1,
0.6499309, -1.35335, 3.256994, 1, 1, 1, 1, 1,
0.6524139, 0.1178704, 1.472797, 1, 1, 1, 1, 1,
0.6537822, -1.405729, 2.439686, 1, 1, 1, 1, 1,
0.6665488, -1.051192, 1.883821, 1, 1, 1, 1, 1,
0.667455, -1.650907, 3.210593, 1, 1, 1, 1, 1,
0.6707429, -1.995769, 3.210203, 1, 1, 1, 1, 1,
0.6806079, 1.45805, 1.082291, 1, 1, 1, 1, 1,
0.6815985, 0.1266246, 2.00394, 1, 1, 1, 1, 1,
0.6870415, -0.4432872, 0.8161885, 1, 1, 1, 1, 1,
0.699008, 0.5823594, 0.7959348, 0, 0, 1, 1, 1,
0.699945, -1.777914, 2.084405, 1, 0, 0, 1, 1,
0.7011055, -0.9495393, 3.812986, 1, 0, 0, 1, 1,
0.7097906, 0.5932735, 1.067271, 1, 0, 0, 1, 1,
0.7128621, 1.704197, -0.1202868, 1, 0, 0, 1, 1,
0.713842, 0.006104102, 1.017602, 1, 0, 0, 1, 1,
0.7139472, -0.4846085, 2.552645, 0, 0, 0, 1, 1,
0.7142884, -0.1409382, 1.911744, 0, 0, 0, 1, 1,
0.7202324, 0.7657044, 0.2936749, 0, 0, 0, 1, 1,
0.7223327, -0.4323356, 1.982897, 0, 0, 0, 1, 1,
0.7264142, -0.7607032, 3.364631, 0, 0, 0, 1, 1,
0.7281108, -1.028815, 2.829242, 0, 0, 0, 1, 1,
0.7314324, 0.8641096, 1.670277, 0, 0, 0, 1, 1,
0.7331417, -0.1394322, 2.094082, 1, 1, 1, 1, 1,
0.7480503, -1.493897, 1.747826, 1, 1, 1, 1, 1,
0.7481513, 0.3642822, 2.22943, 1, 1, 1, 1, 1,
0.750748, 1.332576, 0.6608508, 1, 1, 1, 1, 1,
0.7531385, 0.9103778, 0.8905873, 1, 1, 1, 1, 1,
0.7565137, 1.119707, -0.1085068, 1, 1, 1, 1, 1,
0.7598513, -0.9310257, 3.845788, 1, 1, 1, 1, 1,
0.7599148, -0.1337602, 0.9833111, 1, 1, 1, 1, 1,
0.7646882, 1.162591, 0.8800374, 1, 1, 1, 1, 1,
0.7656934, -1.134911, 3.247166, 1, 1, 1, 1, 1,
0.7661594, -1.56086, 1.834077, 1, 1, 1, 1, 1,
0.7713802, -0.1803884, 0.0369912, 1, 1, 1, 1, 1,
0.7733667, -0.1986995, 1.278962, 1, 1, 1, 1, 1,
0.7771484, 0.2893986, 2.206387, 1, 1, 1, 1, 1,
0.7789809, 0.6258886, 1.055042, 1, 1, 1, 1, 1,
0.7839634, 0.9217907, 1.168138, 0, 0, 1, 1, 1,
0.7842161, -2.750891, 4.453819, 1, 0, 0, 1, 1,
0.7894199, 0.4218582, 1.793426, 1, 0, 0, 1, 1,
0.791328, 0.6242678, 1.781384, 1, 0, 0, 1, 1,
0.7944264, -1.662138, 3.380557, 1, 0, 0, 1, 1,
0.796972, 0.1165713, 2.55245, 1, 0, 0, 1, 1,
0.7995331, -1.790717, 2.289304, 0, 0, 0, 1, 1,
0.8069451, -0.37707, 2.065449, 0, 0, 0, 1, 1,
0.8072189, -0.2945436, 3.020795, 0, 0, 0, 1, 1,
0.8086704, -1.26847, 2.26935, 0, 0, 0, 1, 1,
0.8129966, 0.9370019, -0.009914713, 0, 0, 0, 1, 1,
0.819754, -0.487063, 2.605742, 0, 0, 0, 1, 1,
0.8216311, 1.65406, -0.6180278, 0, 0, 0, 1, 1,
0.8313407, 0.2690953, 1.487608, 1, 1, 1, 1, 1,
0.8481553, 0.4910884, 1.281256, 1, 1, 1, 1, 1,
0.8489006, 1.023362, 1.02339, 1, 1, 1, 1, 1,
0.851754, 1.196614, 1.446372, 1, 1, 1, 1, 1,
0.85594, -0.1726168, 2.658939, 1, 1, 1, 1, 1,
0.8570136, -2.134341, 4.603933, 1, 1, 1, 1, 1,
0.8573309, 1.214181, 0.8222471, 1, 1, 1, 1, 1,
0.857838, 0.1168202, 2.262335, 1, 1, 1, 1, 1,
0.8591585, 0.611049, 0.6090894, 1, 1, 1, 1, 1,
0.8606467, 0.6297758, 0.6425272, 1, 1, 1, 1, 1,
0.8607243, 0.04162492, 1.700945, 1, 1, 1, 1, 1,
0.8649631, 0.6668749, -0.2310758, 1, 1, 1, 1, 1,
0.8650083, -2.015942, 2.541731, 1, 1, 1, 1, 1,
0.8674011, -1.541968, 3.487119, 1, 1, 1, 1, 1,
0.8712302, 1.113485, 0.1827314, 1, 1, 1, 1, 1,
0.873831, 0.5755171, 2.138285, 0, 0, 1, 1, 1,
0.8743326, 0.0739859, 2.107506, 1, 0, 0, 1, 1,
0.8812294, -0.7038453, 3.700199, 1, 0, 0, 1, 1,
0.8818863, 0.1625394, 2.03784, 1, 0, 0, 1, 1,
0.882538, -1.453182, 3.506835, 1, 0, 0, 1, 1,
0.8883858, -0.01573203, 2.257758, 1, 0, 0, 1, 1,
0.8899848, -0.8246053, 4.052667, 0, 0, 0, 1, 1,
0.8913552, 0.486855, 0.1888976, 0, 0, 0, 1, 1,
0.8914428, -0.4993878, 2.264534, 0, 0, 0, 1, 1,
0.8928066, -1.364705, 1.948997, 0, 0, 0, 1, 1,
0.8963766, -1.023246, 3.733617, 0, 0, 0, 1, 1,
0.8986134, 0.5289367, -1.229462, 0, 0, 0, 1, 1,
0.903972, -0.9862589, 2.103734, 0, 0, 0, 1, 1,
0.9085185, 0.9129916, -0.06150899, 1, 1, 1, 1, 1,
0.9099776, -0.6711997, 2.683924, 1, 1, 1, 1, 1,
0.9116364, -1.355697, 3.286989, 1, 1, 1, 1, 1,
0.9136561, 1.143457, 0.7643404, 1, 1, 1, 1, 1,
0.9157185, -0.01322469, 1.616139, 1, 1, 1, 1, 1,
0.9173634, 0.7547736, 1.325363, 1, 1, 1, 1, 1,
0.9300696, 0.6119302, -0.01327633, 1, 1, 1, 1, 1,
0.9310949, -0.8748069, 1.752036, 1, 1, 1, 1, 1,
0.9375009, -0.5188245, 2.186913, 1, 1, 1, 1, 1,
0.938772, 1.514801, 0.9862632, 1, 1, 1, 1, 1,
0.9437209, -1.137801, 3.035665, 1, 1, 1, 1, 1,
0.9458452, 0.3322034, 1.025184, 1, 1, 1, 1, 1,
0.9491545, -1.405968, 3.179336, 1, 1, 1, 1, 1,
0.9499157, -1.461318, 3.255808, 1, 1, 1, 1, 1,
0.9604517, -0.7722628, 1.254923, 1, 1, 1, 1, 1,
0.9650678, 0.811701, 2.008546, 0, 0, 1, 1, 1,
0.9659999, 0.5756376, 0.4734281, 1, 0, 0, 1, 1,
0.9662666, -0.08948943, 1.448345, 1, 0, 0, 1, 1,
0.9768642, 0.5971981, 2.660691, 1, 0, 0, 1, 1,
0.9806272, -0.2869555, 1.143373, 1, 0, 0, 1, 1,
0.9847079, 0.4873658, 1.714197, 1, 0, 0, 1, 1,
0.9938275, 1.140945, 0.9445086, 0, 0, 0, 1, 1,
1.000009, 0.1463839, 3.16974, 0, 0, 0, 1, 1,
1.004607, -0.3097981, 0.8915118, 0, 0, 0, 1, 1,
1.006942, 1.420132, 0.298442, 0, 0, 0, 1, 1,
1.010051, 0.3187927, 0.877198, 0, 0, 0, 1, 1,
1.013719, 0.2737802, 0.752807, 0, 0, 0, 1, 1,
1.021662, -1.314947, 3.137969, 0, 0, 0, 1, 1,
1.035508, -0.0939856, 1.960632, 1, 1, 1, 1, 1,
1.055407, -0.05046924, 1.617402, 1, 1, 1, 1, 1,
1.062864, -0.2013519, 2.699889, 1, 1, 1, 1, 1,
1.063305, 1.443555, -0.7041731, 1, 1, 1, 1, 1,
1.0642, 0.5560006, 0.3300532, 1, 1, 1, 1, 1,
1.065374, 0.2107262, 1.411796, 1, 1, 1, 1, 1,
1.074169, 0.4045673, 1.44785, 1, 1, 1, 1, 1,
1.074686, -1.843442, 3.307379, 1, 1, 1, 1, 1,
1.080604, 1.083967, 1.031653, 1, 1, 1, 1, 1,
1.08132, 0.08508354, 2.40457, 1, 1, 1, 1, 1,
1.086206, 0.5877558, 0.148084, 1, 1, 1, 1, 1,
1.091615, 0.1713231, 1.664668, 1, 1, 1, 1, 1,
1.096044, 0.8187111, 1.101475, 1, 1, 1, 1, 1,
1.101548, -0.9321162, 2.27307, 1, 1, 1, 1, 1,
1.101866, 0.03629596, 3.336784, 1, 1, 1, 1, 1,
1.114868, -1.108302, 1.92126, 0, 0, 1, 1, 1,
1.123366, -0.8276299, 4.34757, 1, 0, 0, 1, 1,
1.127629, 1.2718, 1.388655, 1, 0, 0, 1, 1,
1.128941, 1.741027, 0.7027618, 1, 0, 0, 1, 1,
1.135825, -0.1711302, 2.156479, 1, 0, 0, 1, 1,
1.137041, -1.557311, 3.394013, 1, 0, 0, 1, 1,
1.13733, 0.4115196, 1.933282, 0, 0, 0, 1, 1,
1.141974, 0.2312702, 1.470766, 0, 0, 0, 1, 1,
1.145482, -0.4217856, 1.363232, 0, 0, 0, 1, 1,
1.149581, 0.1287912, -0.2336892, 0, 0, 0, 1, 1,
1.153506, -0.2344947, 2.068034, 0, 0, 0, 1, 1,
1.155836, 1.583143, 0.1766808, 0, 0, 0, 1, 1,
1.15806, 2.6905, 0.7006195, 0, 0, 0, 1, 1,
1.160393, 0.147314, 1.764163, 1, 1, 1, 1, 1,
1.181308, -0.357355, 0.8142911, 1, 1, 1, 1, 1,
1.182362, 1.405793, -0.3699543, 1, 1, 1, 1, 1,
1.186346, -0.5214117, 2.7526, 1, 1, 1, 1, 1,
1.192626, 0.04665811, 2.225849, 1, 1, 1, 1, 1,
1.200266, -0.2110537, 3.082835, 1, 1, 1, 1, 1,
1.203878, 0.001404037, 2.403331, 1, 1, 1, 1, 1,
1.204894, 0.5388858, 1.8515, 1, 1, 1, 1, 1,
1.20879, 0.4512095, -0.1908211, 1, 1, 1, 1, 1,
1.209458, 1.155076, 2.380379, 1, 1, 1, 1, 1,
1.213275, -0.3498042, -0.8252409, 1, 1, 1, 1, 1,
1.22007, -0.6141442, 1.077995, 1, 1, 1, 1, 1,
1.221683, 2.129784, -0.6771374, 1, 1, 1, 1, 1,
1.223222, -0.2004471, 2.765602, 1, 1, 1, 1, 1,
1.224423, -0.332081, 2.43519, 1, 1, 1, 1, 1,
1.232478, -1.167345, 3.092118, 0, 0, 1, 1, 1,
1.23508, -0.9233421, 3.317235, 1, 0, 0, 1, 1,
1.245709, -1.165609, 1.896607, 1, 0, 0, 1, 1,
1.254357, 0.7320109, 1.554495, 1, 0, 0, 1, 1,
1.256996, 1.380478, -0.01256954, 1, 0, 0, 1, 1,
1.273181, 0.5932056, -1.410656, 1, 0, 0, 1, 1,
1.276296, 0.2836598, 0.09355582, 0, 0, 0, 1, 1,
1.290343, -0.187719, 1.838064, 0, 0, 0, 1, 1,
1.293701, -0.421097, -0.001588353, 0, 0, 0, 1, 1,
1.30716, -0.3989926, 2.276837, 0, 0, 0, 1, 1,
1.314189, 0.5485904, 1.944574, 0, 0, 0, 1, 1,
1.31671, -1.215862, 2.020956, 0, 0, 0, 1, 1,
1.319564, 0.05582552, 1.562885, 0, 0, 0, 1, 1,
1.321017, -1.874089, 1.461855, 1, 1, 1, 1, 1,
1.324294, -0.404081, 2.70544, 1, 1, 1, 1, 1,
1.325581, -0.7810227, 1.461582, 1, 1, 1, 1, 1,
1.328332, -0.4002424, 2.311034, 1, 1, 1, 1, 1,
1.33618, 0.6100608, 1.26933, 1, 1, 1, 1, 1,
1.345119, -0.09344359, 4.1936, 1, 1, 1, 1, 1,
1.352506, -0.8714386, 2.08005, 1, 1, 1, 1, 1,
1.355834, 2.157338, 0.9352393, 1, 1, 1, 1, 1,
1.359125, -0.265738, 2.607886, 1, 1, 1, 1, 1,
1.36619, -1.270466, 2.195416, 1, 1, 1, 1, 1,
1.378212, -0.4010927, 2.847797, 1, 1, 1, 1, 1,
1.387156, 1.589586, 1.615574, 1, 1, 1, 1, 1,
1.394033, 0.7271198, 3.893196, 1, 1, 1, 1, 1,
1.394836, 1.673091, 0.5783879, 1, 1, 1, 1, 1,
1.405791, -0.6200467, 3.283948, 1, 1, 1, 1, 1,
1.412694, -0.3034599, 0.1614191, 0, 0, 1, 1, 1,
1.412968, -0.9668512, 1.723481, 1, 0, 0, 1, 1,
1.431018, -0.6748062, 1.070685, 1, 0, 0, 1, 1,
1.431044, -0.0971192, 1.65441, 1, 0, 0, 1, 1,
1.445248, -0.9128736, 0.4004437, 1, 0, 0, 1, 1,
1.474746, 0.8486777, -0.02646865, 1, 0, 0, 1, 1,
1.480887, 0.805176, 3.391078, 0, 0, 0, 1, 1,
1.484643, 1.653044, 1.180685, 0, 0, 0, 1, 1,
1.484839, 0.05348078, -0.01427155, 0, 0, 0, 1, 1,
1.498368, -0.6393304, 2.532613, 0, 0, 0, 1, 1,
1.498928, 0.2214613, 1.570316, 0, 0, 0, 1, 1,
1.504249, 0.4717481, 0.9629145, 0, 0, 0, 1, 1,
1.504367, 0.1607923, -0.2403155, 0, 0, 0, 1, 1,
1.519596, 0.8934719, 0.7802799, 1, 1, 1, 1, 1,
1.53044, 1.064164, 0.8346397, 1, 1, 1, 1, 1,
1.533822, -1.309259, 1.256085, 1, 1, 1, 1, 1,
1.543393, 1.453623, 1.636952, 1, 1, 1, 1, 1,
1.559792, 1.112288, 1.610178, 1, 1, 1, 1, 1,
1.562422, -0.680383, 3.503261, 1, 1, 1, 1, 1,
1.576818, -0.4593036, 2.975905, 1, 1, 1, 1, 1,
1.597468, 0.7683197, 0.5173542, 1, 1, 1, 1, 1,
1.598975, -1.30675, 2.92558, 1, 1, 1, 1, 1,
1.600345, -0.5808352, 3.709162, 1, 1, 1, 1, 1,
1.618996, 0.4465167, 1.464525, 1, 1, 1, 1, 1,
1.620596, 0.7981008, 3.307672, 1, 1, 1, 1, 1,
1.623048, 0.8047514, 1.100729, 1, 1, 1, 1, 1,
1.63026, 1.575464, 1.054724, 1, 1, 1, 1, 1,
1.633833, -0.7925511, 1.890214, 1, 1, 1, 1, 1,
1.640881, 0.1168835, 3.12673, 0, 0, 1, 1, 1,
1.646153, 0.2840079, 1.565373, 1, 0, 0, 1, 1,
1.655765, 0.8501613, 0.9181394, 1, 0, 0, 1, 1,
1.663062, 0.9058077, 1.154115, 1, 0, 0, 1, 1,
1.665985, 0.7275682, 1.335248, 1, 0, 0, 1, 1,
1.701162, -0.9059051, 1.589063, 1, 0, 0, 1, 1,
1.722442, -0.2828784, 2.927289, 0, 0, 0, 1, 1,
1.735608, 0.5737054, 1.452602, 0, 0, 0, 1, 1,
1.738222, -0.04751795, 1.533346, 0, 0, 0, 1, 1,
1.742765, -1.030737, 2.061495, 0, 0, 0, 1, 1,
1.785409, -1.594258, 2.785336, 0, 0, 0, 1, 1,
1.788893, 0.6271791, 1.256782, 0, 0, 0, 1, 1,
1.795351, -0.8482035, 1.928766, 0, 0, 0, 1, 1,
1.797823, 1.408985, 2.18758, 1, 1, 1, 1, 1,
1.800923, -1.4022, 0.424392, 1, 1, 1, 1, 1,
1.814184, 1.026737, 1.547925, 1, 1, 1, 1, 1,
1.825463, 0.06934266, 1.913081, 1, 1, 1, 1, 1,
1.860623, -0.5454523, 1.411884, 1, 1, 1, 1, 1,
1.868408, -1.514579, 3.223967, 1, 1, 1, 1, 1,
1.91243, 0.8601754, -0.4582459, 1, 1, 1, 1, 1,
1.912578, 0.4204341, 1.049353, 1, 1, 1, 1, 1,
1.913792, 0.4839713, 1.908681, 1, 1, 1, 1, 1,
1.928428, -0.5737076, 2.999689, 1, 1, 1, 1, 1,
1.951193, 0.09611241, 0.6014327, 1, 1, 1, 1, 1,
2.012119, -0.2702337, 0.06559484, 1, 1, 1, 1, 1,
2.02931, 0.8122334, 1.200326, 1, 1, 1, 1, 1,
2.031272, 0.1169724, 1.239676, 1, 1, 1, 1, 1,
2.051922, -0.3710282, 2.175933, 1, 1, 1, 1, 1,
2.079449, 0.9034147, 2.140836, 0, 0, 1, 1, 1,
2.086299, -1.154434, 2.756221, 1, 0, 0, 1, 1,
2.094311, -0.5087448, 2.43076, 1, 0, 0, 1, 1,
2.09777, 0.2019473, 2.57092, 1, 0, 0, 1, 1,
2.101636, 2.34967, 0.06614734, 1, 0, 0, 1, 1,
2.133312, -0.5780474, 1.016394, 1, 0, 0, 1, 1,
2.140177, -0.3033624, 1.57813, 0, 0, 0, 1, 1,
2.167407, -1.446133, 2.364954, 0, 0, 0, 1, 1,
2.226196, 2.328294, 1.19271, 0, 0, 0, 1, 1,
2.294868, -1.624786, 2.76656, 0, 0, 0, 1, 1,
2.31929, 0.1075702, -0.3764902, 0, 0, 0, 1, 1,
2.350137, -2.716236, 2.067051, 0, 0, 0, 1, 1,
2.447932, 0.6678362, 0.7971712, 0, 0, 0, 1, 1,
2.472943, 0.5475064, 1.92219, 1, 1, 1, 1, 1,
2.637275, -0.2534685, 0.6631588, 1, 1, 1, 1, 1,
2.64013, -1.007848, 0.4233032, 1, 1, 1, 1, 1,
2.676157, -1.072195, 2.97166, 1, 1, 1, 1, 1,
2.744901, 0.2785139, 1.814937, 1, 1, 1, 1, 1,
2.774719, 0.6098212, 1.460655, 1, 1, 1, 1, 1,
2.877048, -1.211594, 2.99878, 1, 1, 1, 1, 1
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
var radius = 10.29555;
var distance = 36.16269;
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
mvMatrix.translate( 0.2161422, -0.1141584, 0.40904 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.16269);
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
