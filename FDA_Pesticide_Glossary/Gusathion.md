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
-2.987751, 0.6250691, -0.7188287, 1, 0, 0, 1,
-2.912166, -1.448845, -0.753105, 1, 0.007843138, 0, 1,
-2.81006, 0.1938699, -2.288284, 1, 0.01176471, 0, 1,
-2.754265, 0.6366596, -2.138422, 1, 0.01960784, 0, 1,
-2.717084, -0.07280067, -0.004448308, 1, 0.02352941, 0, 1,
-2.675619, 1.523356, -1.756384, 1, 0.03137255, 0, 1,
-2.588292, 1.090056, -0.6598316, 1, 0.03529412, 0, 1,
-2.46789, 0.7962407, -1.093372, 1, 0.04313726, 0, 1,
-2.416033, -1.539828, -1.929728, 1, 0.04705882, 0, 1,
-2.381774, 1.143802, -2.434561, 1, 0.05490196, 0, 1,
-2.366398, -0.4235705, -0.9602041, 1, 0.05882353, 0, 1,
-2.30651, 1.818054, -1.413427, 1, 0.06666667, 0, 1,
-2.29271, -0.05270854, -0.6513055, 1, 0.07058824, 0, 1,
-2.288703, -1.470726, -2.744387, 1, 0.07843138, 0, 1,
-2.256538, 0.1676636, -1.638893, 1, 0.08235294, 0, 1,
-2.232819, 0.7506926, -1.300386, 1, 0.09019608, 0, 1,
-2.195411, -0.155654, -2.345436, 1, 0.09411765, 0, 1,
-2.188218, -2.722107, -1.720863, 1, 0.1019608, 0, 1,
-2.183899, 0.004831681, -1.619682, 1, 0.1098039, 0, 1,
-2.172255, -0.845615, -2.410289, 1, 0.1137255, 0, 1,
-2.17016, -0.5474997, -1.215911, 1, 0.1215686, 0, 1,
-2.149729, -0.8328177, -2.650537, 1, 0.1254902, 0, 1,
-2.13442, -1.339447, -1.904885, 1, 0.1333333, 0, 1,
-2.123915, -0.7813826, -1.522384, 1, 0.1372549, 0, 1,
-2.123767, -0.8145571, -3.484432, 1, 0.145098, 0, 1,
-2.080879, -1.439858, -1.330188, 1, 0.1490196, 0, 1,
-2.080839, 0.8993732, -0.0639196, 1, 0.1568628, 0, 1,
-2.071429, 0.7648253, 0.7871343, 1, 0.1607843, 0, 1,
-2.069253, -0.168735, -2.441166, 1, 0.1686275, 0, 1,
-2.036265, 2.071622, -1.379393, 1, 0.172549, 0, 1,
-2.016771, -1.427394, -2.663331, 1, 0.1803922, 0, 1,
-1.991335, 0.2950619, -2.437439, 1, 0.1843137, 0, 1,
-1.964927, 1.645883, -0.9251176, 1, 0.1921569, 0, 1,
-1.956573, 0.7947802, -1.747811, 1, 0.1960784, 0, 1,
-1.941473, 2.197963, 0.01256044, 1, 0.2039216, 0, 1,
-1.932989, 1.467726, -1.039929, 1, 0.2117647, 0, 1,
-1.917272, 2.094878, 0.6006365, 1, 0.2156863, 0, 1,
-1.909053, 0.8898287, -1.006558, 1, 0.2235294, 0, 1,
-1.908906, -0.1428059, -0.7726262, 1, 0.227451, 0, 1,
-1.892971, -0.7791584, -0.7094112, 1, 0.2352941, 0, 1,
-1.889126, -0.4276717, -2.825969, 1, 0.2392157, 0, 1,
-1.882899, 0.1797179, -1.616282, 1, 0.2470588, 0, 1,
-1.875415, 1.656135, -0.3101514, 1, 0.2509804, 0, 1,
-1.874192, -0.8068219, -1.31407, 1, 0.2588235, 0, 1,
-1.873796, -0.2057727, -0.6559197, 1, 0.2627451, 0, 1,
-1.866136, 1.516142, -0.7352974, 1, 0.2705882, 0, 1,
-1.856375, 0.03309383, -3.191698, 1, 0.2745098, 0, 1,
-1.837149, 0.9379169, -1.001499, 1, 0.282353, 0, 1,
-1.831218, 0.6482213, -1.198959, 1, 0.2862745, 0, 1,
-1.826887, -0.9917751, 1.101815, 1, 0.2941177, 0, 1,
-1.802955, 0.04017657, -0.5647162, 1, 0.3019608, 0, 1,
-1.796965, -0.787468, -2.938838, 1, 0.3058824, 0, 1,
-1.794357, -0.2944493, -1.588105, 1, 0.3137255, 0, 1,
-1.793936, -1.493837, -1.799464, 1, 0.3176471, 0, 1,
-1.790284, -0.5043218, 1.214494, 1, 0.3254902, 0, 1,
-1.787678, -1.091808, -1.043998, 1, 0.3294118, 0, 1,
-1.786976, 0.3427873, 0.08638849, 1, 0.3372549, 0, 1,
-1.766386, 0.4453967, -0.2318399, 1, 0.3411765, 0, 1,
-1.76292, 0.2348629, -2.80193, 1, 0.3490196, 0, 1,
-1.755527, -1.540996, -2.030105, 1, 0.3529412, 0, 1,
-1.749864, 0.2483279, -0.5740853, 1, 0.3607843, 0, 1,
-1.748516, -0.3801452, -1.14219, 1, 0.3647059, 0, 1,
-1.747206, 0.0793865, -1.09937, 1, 0.372549, 0, 1,
-1.74695, 0.1624469, -2.996162, 1, 0.3764706, 0, 1,
-1.738757, -0.1411617, -2.315776, 1, 0.3843137, 0, 1,
-1.726673, -0.157868, -1.213704, 1, 0.3882353, 0, 1,
-1.720923, 2.512602, 0.1874346, 1, 0.3960784, 0, 1,
-1.708704, -0.9288222, -2.198469, 1, 0.4039216, 0, 1,
-1.701673, 0.8951373, -0.5270204, 1, 0.4078431, 0, 1,
-1.690217, -0.9716276, -2.569852, 1, 0.4156863, 0, 1,
-1.685929, -0.8830992, -3.084692, 1, 0.4196078, 0, 1,
-1.678276, -1.16718, -2.340865, 1, 0.427451, 0, 1,
-1.669409, 0.01077587, -0.6023638, 1, 0.4313726, 0, 1,
-1.666293, 0.9710257, -0.8051418, 1, 0.4392157, 0, 1,
-1.666169, 0.8605915, -0.0938744, 1, 0.4431373, 0, 1,
-1.663527, 0.2762542, -0.3546904, 1, 0.4509804, 0, 1,
-1.65368, -1.209254, -0.9676195, 1, 0.454902, 0, 1,
-1.652093, 0.5243204, -0.4652179, 1, 0.4627451, 0, 1,
-1.651453, 0.1118176, -3.725633, 1, 0.4666667, 0, 1,
-1.651364, 1.166123, 0.02282986, 1, 0.4745098, 0, 1,
-1.650139, 0.1224636, -2.110219, 1, 0.4784314, 0, 1,
-1.647671, -0.4167874, -2.850262, 1, 0.4862745, 0, 1,
-1.635003, -0.09660099, 0.93576, 1, 0.4901961, 0, 1,
-1.615218, -2.733914, -3.231947, 1, 0.4980392, 0, 1,
-1.614947, -1.872767, -3.016737, 1, 0.5058824, 0, 1,
-1.589964, 0.03705151, -4.034566, 1, 0.509804, 0, 1,
-1.588875, -0.1680937, -1.612369, 1, 0.5176471, 0, 1,
-1.583997, 1.339283, 0.504099, 1, 0.5215687, 0, 1,
-1.583064, 0.3045806, -1.617612, 1, 0.5294118, 0, 1,
-1.568348, 1.325818, -0.3951709, 1, 0.5333334, 0, 1,
-1.551954, 1.742502, -1.301905, 1, 0.5411765, 0, 1,
-1.550048, -0.8641289, -0.4451101, 1, 0.5450981, 0, 1,
-1.535665, -0.292428, -2.116392, 1, 0.5529412, 0, 1,
-1.53001, -0.7423672, -0.9841155, 1, 0.5568628, 0, 1,
-1.508266, -2.236658, -1.784118, 1, 0.5647059, 0, 1,
-1.504013, -0.2446869, -0.873038, 1, 0.5686275, 0, 1,
-1.497791, 0.8210419, -0.3314265, 1, 0.5764706, 0, 1,
-1.495932, -1.352824, -2.182394, 1, 0.5803922, 0, 1,
-1.484478, -0.1143859, -0.8656116, 1, 0.5882353, 0, 1,
-1.465016, -0.5356337, -1.435462, 1, 0.5921569, 0, 1,
-1.460827, -1.388263, -2.361146, 1, 0.6, 0, 1,
-1.453271, -0.7224747, -2.033949, 1, 0.6078432, 0, 1,
-1.451092, -0.7894871, -2.777179, 1, 0.6117647, 0, 1,
-1.448906, -0.6510291, -1.212985, 1, 0.6196079, 0, 1,
-1.446025, 1.263069, -0.9550272, 1, 0.6235294, 0, 1,
-1.444132, 3.122534, -2.305393, 1, 0.6313726, 0, 1,
-1.431417, -1.224736, -1.9645, 1, 0.6352941, 0, 1,
-1.425947, -1.365251, -2.307177, 1, 0.6431373, 0, 1,
-1.416065, 1.796119, -1.064166, 1, 0.6470588, 0, 1,
-1.414872, -0.5871413, -1.537456, 1, 0.654902, 0, 1,
-1.383011, 0.3988049, -1.850761, 1, 0.6588235, 0, 1,
-1.382908, -0.9045299, -1.071609, 1, 0.6666667, 0, 1,
-1.378927, 0.3662004, -1.634794, 1, 0.6705883, 0, 1,
-1.375575, -1.061186, -3.270043, 1, 0.6784314, 0, 1,
-1.374207, 1.131196, -1.144492, 1, 0.682353, 0, 1,
-1.360699, 0.3711255, -0.9644727, 1, 0.6901961, 0, 1,
-1.359696, 0.4339918, -3.085236, 1, 0.6941177, 0, 1,
-1.350104, 0.5828242, -2.291271, 1, 0.7019608, 0, 1,
-1.349626, 0.4698267, -1.232603, 1, 0.7098039, 0, 1,
-1.317822, 1.892009, -1.526291, 1, 0.7137255, 0, 1,
-1.2936, 0.2452513, -0.4675691, 1, 0.7215686, 0, 1,
-1.290019, -0.12849, -0.1171837, 1, 0.7254902, 0, 1,
-1.28115, 2.301828, -2.432235, 1, 0.7333333, 0, 1,
-1.276761, 0.4106823, -1.701583, 1, 0.7372549, 0, 1,
-1.273799, 0.06296162, 2.173788, 1, 0.7450981, 0, 1,
-1.260542, 0.04062, -0.1966592, 1, 0.7490196, 0, 1,
-1.25254, 0.309257, -1.478955, 1, 0.7568628, 0, 1,
-1.24836, 0.4465524, -2.426783, 1, 0.7607843, 0, 1,
-1.247298, -0.529507, 0.7021596, 1, 0.7686275, 0, 1,
-1.242084, 0.8408495, -1.132942, 1, 0.772549, 0, 1,
-1.240121, -1.474702, -2.153184, 1, 0.7803922, 0, 1,
-1.238332, 1.917693, 0.9984666, 1, 0.7843137, 0, 1,
-1.231883, -0.3506629, -0.08902053, 1, 0.7921569, 0, 1,
-1.224733, -0.7773572, -2.08101, 1, 0.7960784, 0, 1,
-1.221438, 0.5127086, -0.9266007, 1, 0.8039216, 0, 1,
-1.217863, 1.109611, -2.164371, 1, 0.8117647, 0, 1,
-1.208627, 0.2637669, -0.7886969, 1, 0.8156863, 0, 1,
-1.199939, 0.9472476, -1.71082, 1, 0.8235294, 0, 1,
-1.191023, 0.1297426, -1.759358, 1, 0.827451, 0, 1,
-1.183913, 0.3921884, -2.205244, 1, 0.8352941, 0, 1,
-1.182187, 1.701597, -1.318049, 1, 0.8392157, 0, 1,
-1.175773, -0.09165665, -0.997018, 1, 0.8470588, 0, 1,
-1.171471, -1.857005, -3.701228, 1, 0.8509804, 0, 1,
-1.169401, -2.571081, -2.203869, 1, 0.8588235, 0, 1,
-1.168908, -1.397857, -4.194983, 1, 0.8627451, 0, 1,
-1.168371, -0.8045083, -1.42827, 1, 0.8705882, 0, 1,
-1.167235, -0.991398, -3.668001, 1, 0.8745098, 0, 1,
-1.166676, 1.416079, -1.194732, 1, 0.8823529, 0, 1,
-1.140172, 0.2460852, -1.390098, 1, 0.8862745, 0, 1,
-1.139582, -0.08646324, -2.216863, 1, 0.8941177, 0, 1,
-1.132536, 1.07258, -0.7376177, 1, 0.8980392, 0, 1,
-1.131736, 0.1088451, -0.5788537, 1, 0.9058824, 0, 1,
-1.128366, 0.8956835, -0.452417, 1, 0.9137255, 0, 1,
-1.118421, 1.033441, -0.1582085, 1, 0.9176471, 0, 1,
-1.117037, -0.9641868, -2.75461, 1, 0.9254902, 0, 1,
-1.116044, 0.3303904, -1.610352, 1, 0.9294118, 0, 1,
-1.115632, 1.817037, -1.287414, 1, 0.9372549, 0, 1,
-1.115089, -0.3272642, -2.669859, 1, 0.9411765, 0, 1,
-1.114794, -1.053558, -2.06661, 1, 0.9490196, 0, 1,
-1.114142, 1.536357, -0.3008569, 1, 0.9529412, 0, 1,
-1.11115, 0.6996292, -0.392528, 1, 0.9607843, 0, 1,
-1.110043, 1.331263, -0.1058967, 1, 0.9647059, 0, 1,
-1.103754, 1.653561, -0.09697829, 1, 0.972549, 0, 1,
-1.101496, -1.009334, -4.156485, 1, 0.9764706, 0, 1,
-1.092846, -0.172857, -2.133223, 1, 0.9843137, 0, 1,
-1.089656, -0.3471489, -3.167422, 1, 0.9882353, 0, 1,
-1.081447, 0.9653022, -0.1576943, 1, 0.9960784, 0, 1,
-1.076829, -0.5400245, -1.537987, 0.9960784, 1, 0, 1,
-1.076284, -1.440182, -4.119195, 0.9921569, 1, 0, 1,
-1.075283, 0.5606375, -1.216541, 0.9843137, 1, 0, 1,
-1.075196, -2.231648, -1.03729, 0.9803922, 1, 0, 1,
-1.071485, 0.09483867, -1.241144, 0.972549, 1, 0, 1,
-1.066468, 0.01053627, -1.257217, 0.9686275, 1, 0, 1,
-1.064049, -0.1146468, -1.786807, 0.9607843, 1, 0, 1,
-1.058894, -1.4737, -3.286772, 0.9568627, 1, 0, 1,
-1.058358, 0.4756064, -1.788678, 0.9490196, 1, 0, 1,
-1.055207, -0.1489193, -1.405681, 0.945098, 1, 0, 1,
-1.052711, -0.3792671, 0.01419945, 0.9372549, 1, 0, 1,
-1.048272, -1.251914, -4.051398, 0.9333333, 1, 0, 1,
-1.041592, -0.9476379, -1.867595, 0.9254902, 1, 0, 1,
-1.037256, 0.6817536, -1.838292, 0.9215686, 1, 0, 1,
-1.034736, 0.2028187, -1.83274, 0.9137255, 1, 0, 1,
-1.032138, 0.3900466, -0.2087033, 0.9098039, 1, 0, 1,
-1.03077, -0.09811331, -1.136835, 0.9019608, 1, 0, 1,
-1.025358, 0.5417127, -1.974556, 0.8941177, 1, 0, 1,
-1.023146, 0.7571355, 0.5670391, 0.8901961, 1, 0, 1,
-1.022782, -1.478545, -2.251656, 0.8823529, 1, 0, 1,
-1.0166, -1.02248, -2.902556, 0.8784314, 1, 0, 1,
-1.01517, -0.240589, -0.9120532, 0.8705882, 1, 0, 1,
-1.014677, 0.706589, -1.927317, 0.8666667, 1, 0, 1,
-0.99578, -1.003468, -1.534614, 0.8588235, 1, 0, 1,
-0.9886966, -0.9550884, -3.018349, 0.854902, 1, 0, 1,
-0.9851922, -0.8455176, -2.370657, 0.8470588, 1, 0, 1,
-0.9842658, -0.08747769, -1.82741, 0.8431373, 1, 0, 1,
-0.9824182, -0.1068972, -1.903301, 0.8352941, 1, 0, 1,
-0.9823064, 0.3650984, -0.3036692, 0.8313726, 1, 0, 1,
-0.9806255, -1.027403, -3.125637, 0.8235294, 1, 0, 1,
-0.9793896, 1.187018, 0.5953877, 0.8196079, 1, 0, 1,
-0.9790767, -0.6034735, -4.11088, 0.8117647, 1, 0, 1,
-0.9790734, 0.231436, -3.953604, 0.8078431, 1, 0, 1,
-0.9789376, -0.7504222, -3.523677, 0.8, 1, 0, 1,
-0.9776152, 1.077783, 1.426614, 0.7921569, 1, 0, 1,
-0.9774315, 0.04094274, 0.3862034, 0.7882353, 1, 0, 1,
-0.972303, -0.7791277, -3.14873, 0.7803922, 1, 0, 1,
-0.9618272, -1.053544, -3.529197, 0.7764706, 1, 0, 1,
-0.9613981, -1.129447, -2.990978, 0.7686275, 1, 0, 1,
-0.9599431, -0.08758968, -2.302511, 0.7647059, 1, 0, 1,
-0.9585264, 0.5198085, -3.008523, 0.7568628, 1, 0, 1,
-0.9566975, -0.6462939, -1.551706, 0.7529412, 1, 0, 1,
-0.9564077, -0.6041533, -2.302191, 0.7450981, 1, 0, 1,
-0.9553171, -0.3061512, -0.9512886, 0.7411765, 1, 0, 1,
-0.949784, 0.3209552, 0.4951373, 0.7333333, 1, 0, 1,
-0.9492027, 0.5924548, -0.943952, 0.7294118, 1, 0, 1,
-0.9418751, 1.010125, -1.761173, 0.7215686, 1, 0, 1,
-0.9330412, 0.74425, -1.088073, 0.7176471, 1, 0, 1,
-0.9313484, 0.9010744, 0.1445614, 0.7098039, 1, 0, 1,
-0.9251341, -1.533646, -3.053053, 0.7058824, 1, 0, 1,
-0.9250366, 1.445566, 0.8318126, 0.6980392, 1, 0, 1,
-0.9196017, -0.3829548, -2.888617, 0.6901961, 1, 0, 1,
-0.9173548, 0.7960618, -1.260702, 0.6862745, 1, 0, 1,
-0.9155501, 0.1820233, -1.741333, 0.6784314, 1, 0, 1,
-0.9154054, 0.7433294, -2.063196, 0.6745098, 1, 0, 1,
-0.9113504, -0.7108939, -2.471344, 0.6666667, 1, 0, 1,
-0.9099342, -0.3317341, -3.316079, 0.6627451, 1, 0, 1,
-0.9077384, -0.7874048, -2.791865, 0.654902, 1, 0, 1,
-0.9015925, -1.424405, -1.663333, 0.6509804, 1, 0, 1,
-0.9010273, -0.3427908, -0.7877977, 0.6431373, 1, 0, 1,
-0.8990838, -0.3913029, -2.758569, 0.6392157, 1, 0, 1,
-0.8913091, 1.160048, 0.2140433, 0.6313726, 1, 0, 1,
-0.8895808, -0.7517687, -3.623278, 0.627451, 1, 0, 1,
-0.8869111, 1.532226, -1.825596, 0.6196079, 1, 0, 1,
-0.8844873, 0.2976986, -1.867292, 0.6156863, 1, 0, 1,
-0.8784497, -0.885684, -2.197278, 0.6078432, 1, 0, 1,
-0.8777457, -0.7476246, -2.674776, 0.6039216, 1, 0, 1,
-0.874608, -0.2890854, -0.7169282, 0.5960785, 1, 0, 1,
-0.8674465, 0.4088232, -2.532321, 0.5882353, 1, 0, 1,
-0.8529332, 0.8017728, -1.124672, 0.5843138, 1, 0, 1,
-0.852402, -0.8152419, -0.859446, 0.5764706, 1, 0, 1,
-0.848117, -0.5957593, -3.147568, 0.572549, 1, 0, 1,
-0.8461393, 0.7981538, -1.851438, 0.5647059, 1, 0, 1,
-0.8439015, 0.6219783, 0.1346215, 0.5607843, 1, 0, 1,
-0.8311493, 0.2489859, -1.225293, 0.5529412, 1, 0, 1,
-0.8284439, -0.5764672, -1.211217, 0.5490196, 1, 0, 1,
-0.8274941, -0.09814656, -0.4841982, 0.5411765, 1, 0, 1,
-0.8273981, 0.5985755, -1.941244, 0.5372549, 1, 0, 1,
-0.8268605, -0.2074117, -2.194805, 0.5294118, 1, 0, 1,
-0.8240848, 1.6073, 0.2893384, 0.5254902, 1, 0, 1,
-0.7870483, 0.9183628, -1.333786, 0.5176471, 1, 0, 1,
-0.7838713, 0.286675, 0.7105678, 0.5137255, 1, 0, 1,
-0.7837223, 0.6595874, -1.539358, 0.5058824, 1, 0, 1,
-0.783674, -0.2296452, -3.721009, 0.5019608, 1, 0, 1,
-0.7778192, 0.4347734, -2.688479, 0.4941176, 1, 0, 1,
-0.7751872, -0.2593713, -0.3791966, 0.4862745, 1, 0, 1,
-0.7751663, -2.295795, -2.580183, 0.4823529, 1, 0, 1,
-0.7703778, -1.342337, -1.856136, 0.4745098, 1, 0, 1,
-0.769368, 0.8826487, -0.2380183, 0.4705882, 1, 0, 1,
-0.7683898, -0.712833, -1.227841, 0.4627451, 1, 0, 1,
-0.7640656, -0.07219351, -1.240393, 0.4588235, 1, 0, 1,
-0.7605013, 0.4331414, -1.262602, 0.4509804, 1, 0, 1,
-0.7571819, 0.3273555, -1.079893, 0.4470588, 1, 0, 1,
-0.7488486, 0.4480022, -2.108869, 0.4392157, 1, 0, 1,
-0.7462818, -0.5325803, -3.1108, 0.4352941, 1, 0, 1,
-0.7453517, 1.383536, -0.1993664, 0.427451, 1, 0, 1,
-0.7401644, 1.642925, -1.91315, 0.4235294, 1, 0, 1,
-0.7393826, 0.3804468, -3.021841, 0.4156863, 1, 0, 1,
-0.7378621, 0.9342, -0.6461591, 0.4117647, 1, 0, 1,
-0.7361882, -2.670886, -2.580331, 0.4039216, 1, 0, 1,
-0.7328693, -1.28764, -3.35626, 0.3960784, 1, 0, 1,
-0.7283159, -0.8062171, -2.191522, 0.3921569, 1, 0, 1,
-0.7168163, -0.4553025, -2.89629, 0.3843137, 1, 0, 1,
-0.7122612, -1.568452, -3.534638, 0.3803922, 1, 0, 1,
-0.7111212, 0.7649542, -1.672699, 0.372549, 1, 0, 1,
-0.7071228, 0.7898505, -0.1111715, 0.3686275, 1, 0, 1,
-0.7026932, -1.667563, -4.529194, 0.3607843, 1, 0, 1,
-0.6997511, 0.201558, -2.651279, 0.3568628, 1, 0, 1,
-0.6919352, -0.2217661, -2.391023, 0.3490196, 1, 0, 1,
-0.6899657, 0.8697771, -1.463, 0.345098, 1, 0, 1,
-0.6871698, -0.7336555, -2.100256, 0.3372549, 1, 0, 1,
-0.6842636, 1.077026, -0.621165, 0.3333333, 1, 0, 1,
-0.6830264, -1.403777, -3.539451, 0.3254902, 1, 0, 1,
-0.6819767, -0.08970621, -2.330222, 0.3215686, 1, 0, 1,
-0.6795354, -0.07485325, -1.644618, 0.3137255, 1, 0, 1,
-0.6793543, 2.772408, 0.6376554, 0.3098039, 1, 0, 1,
-0.6789646, 0.3864519, -1.92188, 0.3019608, 1, 0, 1,
-0.673457, -1.613532, -3.544106, 0.2941177, 1, 0, 1,
-0.6719441, 1.084874, -0.5356743, 0.2901961, 1, 0, 1,
-0.6618149, -1.582566, -2.619759, 0.282353, 1, 0, 1,
-0.6615171, 0.6537285, -0.4633474, 0.2784314, 1, 0, 1,
-0.6570187, 0.2573186, 0.767444, 0.2705882, 1, 0, 1,
-0.6563671, 1.483452, -1.084995, 0.2666667, 1, 0, 1,
-0.6561694, 0.0865792, -1.787662, 0.2588235, 1, 0, 1,
-0.6542735, 0.9688647, -0.5777395, 0.254902, 1, 0, 1,
-0.6485692, -0.03220505, -0.8418384, 0.2470588, 1, 0, 1,
-0.643745, 0.1999681, -2.083952, 0.2431373, 1, 0, 1,
-0.6412716, 0.543591, -0.1633759, 0.2352941, 1, 0, 1,
-0.6387709, 0.5996934, -0.1974302, 0.2313726, 1, 0, 1,
-0.6366206, -0.2052563, -2.166934, 0.2235294, 1, 0, 1,
-0.6325477, -2.226188, -3.248981, 0.2196078, 1, 0, 1,
-0.6297493, -0.4803401, -1.81864, 0.2117647, 1, 0, 1,
-0.6289814, 0.9286444, -0.2933655, 0.2078431, 1, 0, 1,
-0.6262142, -0.3048637, -0.9682627, 0.2, 1, 0, 1,
-0.6208239, 0.01060857, -1.388721, 0.1921569, 1, 0, 1,
-0.613551, 0.2696495, -0.7213646, 0.1882353, 1, 0, 1,
-0.6131071, 1.155237, 0.1735107, 0.1803922, 1, 0, 1,
-0.6116957, 0.2307326, -0.5525776, 0.1764706, 1, 0, 1,
-0.6073135, -0.2997395, -0.2379208, 0.1686275, 1, 0, 1,
-0.6060829, 0.1420667, -2.011675, 0.1647059, 1, 0, 1,
-0.6020517, -1.695998, -3.567559, 0.1568628, 1, 0, 1,
-0.5952577, -0.8160648, -0.3543397, 0.1529412, 1, 0, 1,
-0.5914834, 0.4166983, 1.033654, 0.145098, 1, 0, 1,
-0.5865502, -0.004216397, -1.300303, 0.1411765, 1, 0, 1,
-0.5863484, -0.467648, -1.925668, 0.1333333, 1, 0, 1,
-0.5862902, -0.1529246, -2.338045, 0.1294118, 1, 0, 1,
-0.586085, 0.127303, -0.7500386, 0.1215686, 1, 0, 1,
-0.5818989, -1.043036, -2.5826, 0.1176471, 1, 0, 1,
-0.5772153, 0.01526398, -0.3454476, 0.1098039, 1, 0, 1,
-0.5676256, -2.469029, -3.474304, 0.1058824, 1, 0, 1,
-0.5670418, 1.002097, -0.5541241, 0.09803922, 1, 0, 1,
-0.5663635, -0.7554144, -4.716907, 0.09019608, 1, 0, 1,
-0.5658635, 0.7556583, -1.242592, 0.08627451, 1, 0, 1,
-0.562262, 0.03938231, -2.728529, 0.07843138, 1, 0, 1,
-0.5539261, 0.7363892, 1.918909, 0.07450981, 1, 0, 1,
-0.5464011, -0.1650244, -1.995356, 0.06666667, 1, 0, 1,
-0.5419863, -0.7672114, -2.378816, 0.0627451, 1, 0, 1,
-0.5394567, -1.086372, -3.983653, 0.05490196, 1, 0, 1,
-0.539053, -0.4494368, -3.317109, 0.05098039, 1, 0, 1,
-0.5345605, 0.6788792, 0.4425504, 0.04313726, 1, 0, 1,
-0.5336563, 0.02576173, -0.08950282, 0.03921569, 1, 0, 1,
-0.5311402, -1.919057, -2.762048, 0.03137255, 1, 0, 1,
-0.5251679, -1.798403, -3.73421, 0.02745098, 1, 0, 1,
-0.524187, -0.8069199, -2.427954, 0.01960784, 1, 0, 1,
-0.5207904, 1.070859, -0.5797633, 0.01568628, 1, 0, 1,
-0.5168803, -0.3332674, -0.3185768, 0.007843138, 1, 0, 1,
-0.5136642, 0.03157829, 0.008304616, 0.003921569, 1, 0, 1,
-0.5103635, -1.438434, -2.484189, 0, 1, 0.003921569, 1,
-0.5078501, -0.6471106, -1.742534, 0, 1, 0.01176471, 1,
-0.506522, 0.3137197, -1.271747, 0, 1, 0.01568628, 1,
-0.5031759, 0.05117999, -2.017864, 0, 1, 0.02352941, 1,
-0.5028754, -0.619045, -1.81105, 0, 1, 0.02745098, 1,
-0.497467, 0.08468556, -2.233565, 0, 1, 0.03529412, 1,
-0.491226, 0.434533, -1.748576, 0, 1, 0.03921569, 1,
-0.4901886, 0.5341134, -1.67647, 0, 1, 0.04705882, 1,
-0.4848738, -0.3237238, -2.290398, 0, 1, 0.05098039, 1,
-0.4829787, 0.3569277, -1.876479, 0, 1, 0.05882353, 1,
-0.4777881, 1.057137, 0.2801103, 0, 1, 0.0627451, 1,
-0.468939, 0.9972779, -0.4134763, 0, 1, 0.07058824, 1,
-0.4675452, -1.056601, -2.631576, 0, 1, 0.07450981, 1,
-0.4646322, 0.4439528, -0.1424052, 0, 1, 0.08235294, 1,
-0.4625262, -0.1848735, 0.3286688, 0, 1, 0.08627451, 1,
-0.4618753, -1.861623, -3.046064, 0, 1, 0.09411765, 1,
-0.4613465, 0.3402475, 0.2484154, 0, 1, 0.1019608, 1,
-0.4584816, -1.525638, -2.665437, 0, 1, 0.1058824, 1,
-0.4554673, 0.1553461, -1.967649, 0, 1, 0.1137255, 1,
-0.4491481, 0.9501951, -1.827186, 0, 1, 0.1176471, 1,
-0.4490542, 0.9130033, -2.417291, 0, 1, 0.1254902, 1,
-0.4451406, -0.9511986, -2.872981, 0, 1, 0.1294118, 1,
-0.4424538, 1.447509, -0.1464156, 0, 1, 0.1372549, 1,
-0.4381559, 1.925712, 0.393115, 0, 1, 0.1411765, 1,
-0.4370866, -0.695693, -2.125567, 0, 1, 0.1490196, 1,
-0.4338369, -0.5809965, -1.162838, 0, 1, 0.1529412, 1,
-0.4325653, -0.6353197, -1.390553, 0, 1, 0.1607843, 1,
-0.432174, 0.1247668, -1.398095, 0, 1, 0.1647059, 1,
-0.4315208, -0.08960576, -1.672634, 0, 1, 0.172549, 1,
-0.4282866, -1.085785, -1.014234, 0, 1, 0.1764706, 1,
-0.4266328, 0.01183531, -1.881901, 0, 1, 0.1843137, 1,
-0.4230622, -0.7420766, -2.656037, 0, 1, 0.1882353, 1,
-0.4219911, 0.9845166, -2.09614, 0, 1, 0.1960784, 1,
-0.4208592, -0.9776778, -2.41231, 0, 1, 0.2039216, 1,
-0.418906, -0.04069896, -3.156475, 0, 1, 0.2078431, 1,
-0.4164999, -0.9594867, -1.854633, 0, 1, 0.2156863, 1,
-0.412793, 0.3827555, -1.65853, 0, 1, 0.2196078, 1,
-0.4125428, -1.136581, -3.840083, 0, 1, 0.227451, 1,
-0.4114939, -0.3078941, -3.526305, 0, 1, 0.2313726, 1,
-0.410368, 0.8066477, 0.2007743, 0, 1, 0.2392157, 1,
-0.4070458, -1.071682, -3.684215, 0, 1, 0.2431373, 1,
-0.4062167, 0.8425716, 1.112714, 0, 1, 0.2509804, 1,
-0.4055285, 0.9583625, 1.643327, 0, 1, 0.254902, 1,
-0.3962798, 0.733727, -1.171625, 0, 1, 0.2627451, 1,
-0.3958652, -0.7333757, -2.900072, 0, 1, 0.2666667, 1,
-0.3923588, 1.018403, -2.336218, 0, 1, 0.2745098, 1,
-0.3909921, -1.561024, -2.836034, 0, 1, 0.2784314, 1,
-0.3884031, -0.3496822, -2.004986, 0, 1, 0.2862745, 1,
-0.3876677, -0.05678643, -0.7752993, 0, 1, 0.2901961, 1,
-0.3870293, 0.364358, 0.506871, 0, 1, 0.2980392, 1,
-0.3782064, 1.428352, -1.399608, 0, 1, 0.3058824, 1,
-0.3733504, 0.428766, -1.411991, 0, 1, 0.3098039, 1,
-0.3599756, 0.7168657, -0.6886669, 0, 1, 0.3176471, 1,
-0.3548672, 0.3554052, -1.40404, 0, 1, 0.3215686, 1,
-0.353428, 0.2106317, -0.9049051, 0, 1, 0.3294118, 1,
-0.3524876, 0.7785349, -1.385599, 0, 1, 0.3333333, 1,
-0.3417759, 1.56125, -1.500387, 0, 1, 0.3411765, 1,
-0.3385718, 0.7182185, -0.4703731, 0, 1, 0.345098, 1,
-0.337294, -0.7432284, -2.943291, 0, 1, 0.3529412, 1,
-0.3354328, 1.426131, -1.622376, 0, 1, 0.3568628, 1,
-0.3310823, 1.347611, -0.8790519, 0, 1, 0.3647059, 1,
-0.3287853, 1.635984, 1.50037, 0, 1, 0.3686275, 1,
-0.3250553, -0.4020968, -1.85117, 0, 1, 0.3764706, 1,
-0.3232404, -0.9510943, -1.018767, 0, 1, 0.3803922, 1,
-0.3227385, -1.56076, -4.004453, 0, 1, 0.3882353, 1,
-0.3216972, 1.330496, -0.1580508, 0, 1, 0.3921569, 1,
-0.3193161, 0.9183878, -1.005552, 0, 1, 0.4, 1,
-0.3184801, -1.069481, -3.39751, 0, 1, 0.4078431, 1,
-0.3120535, 0.644985, -1.178637, 0, 1, 0.4117647, 1,
-0.3112915, 0.4952087, 1.124285, 0, 1, 0.4196078, 1,
-0.3106396, 0.03508999, -1.284786, 0, 1, 0.4235294, 1,
-0.3092785, -0.0213713, -1.48435, 0, 1, 0.4313726, 1,
-0.3084466, -0.3578025, -3.72122, 0, 1, 0.4352941, 1,
-0.307674, -0.07348161, -1.336125, 0, 1, 0.4431373, 1,
-0.3056489, -0.2143753, -3.106126, 0, 1, 0.4470588, 1,
-0.3022223, -0.002125766, -2.747172, 0, 1, 0.454902, 1,
-0.3014971, 0.2820478, 1.552195, 0, 1, 0.4588235, 1,
-0.2945823, 0.06627326, -1.122097, 0, 1, 0.4666667, 1,
-0.2944483, -0.8093842, -3.476707, 0, 1, 0.4705882, 1,
-0.2867751, 0.5927048, -0.6770962, 0, 1, 0.4784314, 1,
-0.2864408, -0.5387655, -2.717797, 0, 1, 0.4823529, 1,
-0.2851811, -0.4046293, -2.319623, 0, 1, 0.4901961, 1,
-0.2806004, -0.1868627, -2.381689, 0, 1, 0.4941176, 1,
-0.2768509, -2.277087, -3.501823, 0, 1, 0.5019608, 1,
-0.274497, 0.9676372, -0.6664397, 0, 1, 0.509804, 1,
-0.272112, -0.3587748, -2.512402, 0, 1, 0.5137255, 1,
-0.2698089, 0.4434066, -1.613489, 0, 1, 0.5215687, 1,
-0.2694941, 0.8571237, -0.235259, 0, 1, 0.5254902, 1,
-0.266993, 2.106497, 0.4395572, 0, 1, 0.5333334, 1,
-0.2634259, -0.8441685, -2.599494, 0, 1, 0.5372549, 1,
-0.2590084, -0.2631971, -1.853735, 0, 1, 0.5450981, 1,
-0.2559495, -0.3367155, -2.472929, 0, 1, 0.5490196, 1,
-0.2557062, 0.3359188, -0.8694675, 0, 1, 0.5568628, 1,
-0.2537408, -0.7438136, -3.19826, 0, 1, 0.5607843, 1,
-0.2513755, 0.5384442, -0.5349659, 0, 1, 0.5686275, 1,
-0.2492559, 0.1899441, 0.4442922, 0, 1, 0.572549, 1,
-0.24715, 1.027701, 1.13672, 0, 1, 0.5803922, 1,
-0.2398798, 1.636611, 0.6782154, 0, 1, 0.5843138, 1,
-0.2357522, -1.276375, -2.873652, 0, 1, 0.5921569, 1,
-0.2343038, 0.7457251, -1.528471, 0, 1, 0.5960785, 1,
-0.2340579, 0.8969432, -0.5356898, 0, 1, 0.6039216, 1,
-0.2291081, 0.3692909, 0.1298477, 0, 1, 0.6117647, 1,
-0.2269727, -0.5726786, -4.306547, 0, 1, 0.6156863, 1,
-0.2236843, -0.9723654, -2.360156, 0, 1, 0.6235294, 1,
-0.2216674, 0.5842042, -0.3541309, 0, 1, 0.627451, 1,
-0.220971, 0.2257461, 0.3562288, 0, 1, 0.6352941, 1,
-0.2189296, -0.8069882, -1.42441, 0, 1, 0.6392157, 1,
-0.2177409, 0.07802108, -0.7204506, 0, 1, 0.6470588, 1,
-0.2163692, 0.9110966, -0.4249993, 0, 1, 0.6509804, 1,
-0.2119733, 0.1466785, -0.1286339, 0, 1, 0.6588235, 1,
-0.204749, 0.9990994, -1.524404, 0, 1, 0.6627451, 1,
-0.2004934, -0.2418787, -3.215059, 0, 1, 0.6705883, 1,
-0.1954253, 1.229791, -2.755006, 0, 1, 0.6745098, 1,
-0.193943, -1.503409, -3.31308, 0, 1, 0.682353, 1,
-0.1918723, -0.7113605, -3.742015, 0, 1, 0.6862745, 1,
-0.1846806, 2.829089, -0.5292883, 0, 1, 0.6941177, 1,
-0.1837939, -1.034516, -3.838916, 0, 1, 0.7019608, 1,
-0.1817781, 0.4040695, 0.4398629, 0, 1, 0.7058824, 1,
-0.1805859, 0.4644885, -1.322694, 0, 1, 0.7137255, 1,
-0.1780528, -0.5363849, -1.608714, 0, 1, 0.7176471, 1,
-0.177753, 1.846466, 0.3993544, 0, 1, 0.7254902, 1,
-0.1748943, 0.9104155, -0.04654948, 0, 1, 0.7294118, 1,
-0.1745541, 1.096229, -0.6525667, 0, 1, 0.7372549, 1,
-0.1741277, -1.040894, -2.137057, 0, 1, 0.7411765, 1,
-0.1673007, 1.134381, 0.08418478, 0, 1, 0.7490196, 1,
-0.1652975, 0.7271678, -1.009876, 0, 1, 0.7529412, 1,
-0.1643388, -0.1685566, -3.950855, 0, 1, 0.7607843, 1,
-0.1641751, 0.4705957, -1.050083, 0, 1, 0.7647059, 1,
-0.1635014, 0.1040314, -1.158627, 0, 1, 0.772549, 1,
-0.1606685, -1.759451, -3.830637, 0, 1, 0.7764706, 1,
-0.1570753, 1.118297, 0.0297346, 0, 1, 0.7843137, 1,
-0.1555461, 0.601479, 1.120229, 0, 1, 0.7882353, 1,
-0.1492722, -0.07630567, -3.995808, 0, 1, 0.7960784, 1,
-0.1449351, -1.146917, -2.779939, 0, 1, 0.8039216, 1,
-0.1420898, -0.799122, -3.2613, 0, 1, 0.8078431, 1,
-0.1406189, 1.622572, -0.772549, 0, 1, 0.8156863, 1,
-0.1405541, -0.3648606, -4.871382, 0, 1, 0.8196079, 1,
-0.1362913, -0.01708017, -2.67564, 0, 1, 0.827451, 1,
-0.1344649, -0.1436925, -2.036391, 0, 1, 0.8313726, 1,
-0.1319001, 0.1985881, 2.057688, 0, 1, 0.8392157, 1,
-0.1254983, -1.137732, -2.44003, 0, 1, 0.8431373, 1,
-0.1162034, 0.09363613, -1.848926, 0, 1, 0.8509804, 1,
-0.1115472, -0.5616471, -4.070756, 0, 1, 0.854902, 1,
-0.1062323, -1.283054, -5.855376, 0, 1, 0.8627451, 1,
-0.1038437, 1.051699, -0.4128222, 0, 1, 0.8666667, 1,
-0.102492, -0.05802074, -2.80156, 0, 1, 0.8745098, 1,
-0.10014, 2.025038, 0.1717119, 0, 1, 0.8784314, 1,
-0.09711632, 0.3929015, 1.851334, 0, 1, 0.8862745, 1,
-0.09607469, -0.6461666, -3.900595, 0, 1, 0.8901961, 1,
-0.0945676, -1.370051, -2.103082, 0, 1, 0.8980392, 1,
-0.09359826, 0.6510134, -1.215424, 0, 1, 0.9058824, 1,
-0.09136568, 0.2141865, -0.335273, 0, 1, 0.9098039, 1,
-0.08226722, 0.8733194, 0.3230686, 0, 1, 0.9176471, 1,
-0.08156203, 0.5055042, 0.2697113, 0, 1, 0.9215686, 1,
-0.07961604, 0.248739, 0.6919302, 0, 1, 0.9294118, 1,
-0.07821037, -0.4749806, -3.646954, 0, 1, 0.9333333, 1,
-0.07768956, 0.9759033, -1.605169, 0, 1, 0.9411765, 1,
-0.07496281, 0.6322622, 0.9648076, 0, 1, 0.945098, 1,
-0.07434109, -1.704157, -5.054845, 0, 1, 0.9529412, 1,
-0.06773265, 0.3401214, 0.01864845, 0, 1, 0.9568627, 1,
-0.06760392, -0.3549629, -1.76472, 0, 1, 0.9647059, 1,
-0.06669021, -1.585631, -2.377799, 0, 1, 0.9686275, 1,
-0.06433937, 0.3257387, 1.462664, 0, 1, 0.9764706, 1,
-0.06059042, 0.3689435, 0.4004872, 0, 1, 0.9803922, 1,
-0.05921467, 1.786602, 1.381432, 0, 1, 0.9882353, 1,
-0.05575935, 0.4907309, 0.3883757, 0, 1, 0.9921569, 1,
-0.0548934, 0.8724615, -0.5832494, 0, 1, 1, 1,
-0.0495371, -0.2060876, -2.458108, 0, 0.9921569, 1, 1,
-0.04883574, 1.044058, -0.0003821969, 0, 0.9882353, 1, 1,
-0.0422129, 0.7453413, 0.07396907, 0, 0.9803922, 1, 1,
-0.03690348, 0.03891897, -1.469736, 0, 0.9764706, 1, 1,
-0.03314992, 1.667774, 0.535337, 0, 0.9686275, 1, 1,
-0.03079326, -1.625571, -4.33937, 0, 0.9647059, 1, 1,
-0.03043197, 1.317915, -0.576914, 0, 0.9568627, 1, 1,
-0.02967943, -0.09964594, -3.584905, 0, 0.9529412, 1, 1,
-0.02915116, -1.504838, -3.504463, 0, 0.945098, 1, 1,
-0.02650736, 1.581532, -2.167222, 0, 0.9411765, 1, 1,
-0.01925776, -0.3023167, -2.546201, 0, 0.9333333, 1, 1,
-0.01536272, 0.6209652, -1.185786, 0, 0.9294118, 1, 1,
-0.01223965, 1.057065, -0.3348745, 0, 0.9215686, 1, 1,
-0.01107644, 1.418036, -0.7020829, 0, 0.9176471, 1, 1,
-0.01097533, 0.5095562, 0.5139444, 0, 0.9098039, 1, 1,
-0.009909892, 1.639088, -0.1858669, 0, 0.9058824, 1, 1,
-0.006925608, 2.228298, 1.032882, 0, 0.8980392, 1, 1,
-0.00218949, -0.9687419, -3.875434, 0, 0.8901961, 1, 1,
0.002567254, 1.163902, 0.5245578, 0, 0.8862745, 1, 1,
0.005174031, 0.9021282, -0.5748062, 0, 0.8784314, 1, 1,
0.005612157, 0.9376041, 2.349915, 0, 0.8745098, 1, 1,
0.007159526, 1.034859, -0.627838, 0, 0.8666667, 1, 1,
0.007708898, 0.7781709, -0.7543176, 0, 0.8627451, 1, 1,
0.007795019, 0.4407529, -0.4188205, 0, 0.854902, 1, 1,
0.00823342, -0.4302936, 4.411846, 0, 0.8509804, 1, 1,
0.00869349, -0.8017355, 4.548873, 0, 0.8431373, 1, 1,
0.009765251, -0.3243386, 2.144797, 0, 0.8392157, 1, 1,
0.01159848, 0.293648, 0.6115092, 0, 0.8313726, 1, 1,
0.01781888, 2.133828, -0.2013102, 0, 0.827451, 1, 1,
0.01889248, -0.2890612, 2.980686, 0, 0.8196079, 1, 1,
0.01954792, 0.6162602, -0.5688491, 0, 0.8156863, 1, 1,
0.02090102, 0.297542, -0.9320382, 0, 0.8078431, 1, 1,
0.02260599, -0.7444233, 2.427069, 0, 0.8039216, 1, 1,
0.02481291, 1.047384, -0.6066445, 0, 0.7960784, 1, 1,
0.03250053, -0.8650532, 2.770513, 0, 0.7882353, 1, 1,
0.03269883, 1.760683, 1.754716, 0, 0.7843137, 1, 1,
0.03383957, 0.8813205, -1.164152, 0, 0.7764706, 1, 1,
0.03956574, -1.011402, 2.662636, 0, 0.772549, 1, 1,
0.04320271, 0.2114182, -1.655212, 0, 0.7647059, 1, 1,
0.04602096, -1.421211, 5.774723, 0, 0.7607843, 1, 1,
0.04624253, -2.105357, 1.610286, 0, 0.7529412, 1, 1,
0.04654799, 0.6471053, 0.6636803, 0, 0.7490196, 1, 1,
0.04802693, -0.411433, 2.367452, 0, 0.7411765, 1, 1,
0.05071412, 0.07194895, 0.8345601, 0, 0.7372549, 1, 1,
0.05688316, -0.6393463, 3.667314, 0, 0.7294118, 1, 1,
0.06030955, -0.4264881, 3.57814, 0, 0.7254902, 1, 1,
0.06392577, -0.6622889, 3.827984, 0, 0.7176471, 1, 1,
0.06775276, -0.3972792, 0.3722262, 0, 0.7137255, 1, 1,
0.06822211, 1.001595, 0.492943, 0, 0.7058824, 1, 1,
0.06921792, -1.345593, 2.290373, 0, 0.6980392, 1, 1,
0.07011712, -1.632781, 3.139117, 0, 0.6941177, 1, 1,
0.07387093, -1.380099, 4.860437, 0, 0.6862745, 1, 1,
0.0793962, 0.009449027, 1.124192, 0, 0.682353, 1, 1,
0.08037537, 0.8913863, -0.2923814, 0, 0.6745098, 1, 1,
0.08118295, 0.8814589, -0.1399012, 0, 0.6705883, 1, 1,
0.08588925, 0.156088, -1.196064, 0, 0.6627451, 1, 1,
0.08652243, 0.5805895, -0.9352369, 0, 0.6588235, 1, 1,
0.08757864, -0.2034562, 3.63535, 0, 0.6509804, 1, 1,
0.08767788, 1.256742, 0.9695004, 0, 0.6470588, 1, 1,
0.08963354, 0.1167392, -0.744294, 0, 0.6392157, 1, 1,
0.09172287, 0.5427416, -1.150615, 0, 0.6352941, 1, 1,
0.09230305, 1.781873, -0.4441939, 0, 0.627451, 1, 1,
0.09265788, 0.2848359, 0.5853376, 0, 0.6235294, 1, 1,
0.09514496, 1.344233, -0.04576302, 0, 0.6156863, 1, 1,
0.09592087, -1.681221, 2.593971, 0, 0.6117647, 1, 1,
0.09912358, -0.3455282, 2.945292, 0, 0.6039216, 1, 1,
0.1018772, 0.1719423, 0.02543483, 0, 0.5960785, 1, 1,
0.102117, -0.4505785, 0.7349447, 0, 0.5921569, 1, 1,
0.1021663, -1.291998, 3.939113, 0, 0.5843138, 1, 1,
0.1030214, -0.1607218, 1.596789, 0, 0.5803922, 1, 1,
0.1052828, 0.09527922, 0.6412191, 0, 0.572549, 1, 1,
0.1076864, -2.010221, 3.478563, 0, 0.5686275, 1, 1,
0.1105857, 1.580681, -0.4386364, 0, 0.5607843, 1, 1,
0.1126166, 0.3153035, 0.5479041, 0, 0.5568628, 1, 1,
0.1127982, 1.273255, -1.205483, 0, 0.5490196, 1, 1,
0.1172203, -0.2522512, 1.140994, 0, 0.5450981, 1, 1,
0.1199396, 0.6717196, -0.7982763, 0, 0.5372549, 1, 1,
0.1216596, 0.7753302, 1.906328, 0, 0.5333334, 1, 1,
0.123026, -0.06125977, 2.949462, 0, 0.5254902, 1, 1,
0.1264293, -0.1017673, 3.440172, 0, 0.5215687, 1, 1,
0.126983, 0.5461363, 0.09922809, 0, 0.5137255, 1, 1,
0.1283005, -0.4423522, 2.313174, 0, 0.509804, 1, 1,
0.1293084, -2.537369, 2.727045, 0, 0.5019608, 1, 1,
0.1313374, 0.2505741, -0.1578052, 0, 0.4941176, 1, 1,
0.1331912, -0.8244223, 3.807794, 0, 0.4901961, 1, 1,
0.1383703, 1.211074, -0.1725751, 0, 0.4823529, 1, 1,
0.1398229, 1.424892, 1.090503, 0, 0.4784314, 1, 1,
0.1432748, 0.48571, 0.9411706, 0, 0.4705882, 1, 1,
0.1477865, 1.004107, 0.1889606, 0, 0.4666667, 1, 1,
0.1494751, -0.4306507, 2.83775, 0, 0.4588235, 1, 1,
0.1512545, 0.5018212, 1.98578, 0, 0.454902, 1, 1,
0.1550386, -1.905704, 2.456159, 0, 0.4470588, 1, 1,
0.1564068, 1.178422, -0.9430062, 0, 0.4431373, 1, 1,
0.1643863, 1.86017, 0.9302633, 0, 0.4352941, 1, 1,
0.1660207, 1.619261, -2.242672, 0, 0.4313726, 1, 1,
0.1660879, -0.8066332, 1.993707, 0, 0.4235294, 1, 1,
0.1666005, 0.6659004, 1.622088, 0, 0.4196078, 1, 1,
0.1699362, 0.2855221, 0.3029948, 0, 0.4117647, 1, 1,
0.1765885, -0.4382648, 2.265828, 0, 0.4078431, 1, 1,
0.1777288, -0.2545144, 3.125392, 0, 0.4, 1, 1,
0.1782706, -0.7353894, 3.60176, 0, 0.3921569, 1, 1,
0.1829998, -2.752065, 3.097127, 0, 0.3882353, 1, 1,
0.1838298, 0.1829044, 1.878746, 0, 0.3803922, 1, 1,
0.1845236, 0.5683019, -0.8571489, 0, 0.3764706, 1, 1,
0.1885112, 0.4431585, 1.331811, 0, 0.3686275, 1, 1,
0.1909613, -0.8427547, 2.815992, 0, 0.3647059, 1, 1,
0.1925224, 0.4079387, -0.07440426, 0, 0.3568628, 1, 1,
0.1976241, -0.4951635, 2.375693, 0, 0.3529412, 1, 1,
0.2000346, 0.4765866, 0.398159, 0, 0.345098, 1, 1,
0.201498, 2.528224, 0.5912256, 0, 0.3411765, 1, 1,
0.2040469, -2.087418, 2.815224, 0, 0.3333333, 1, 1,
0.2157375, -0.8161767, 2.201413, 0, 0.3294118, 1, 1,
0.2163442, 0.2030177, 1.718623, 0, 0.3215686, 1, 1,
0.2199101, 0.3211641, 1.305885, 0, 0.3176471, 1, 1,
0.2234605, 0.9699094, -0.2426259, 0, 0.3098039, 1, 1,
0.2255749, -0.4824801, 2.864006, 0, 0.3058824, 1, 1,
0.2263938, 0.1993107, 1.048013, 0, 0.2980392, 1, 1,
0.2264699, 0.6806192, 0.04634954, 0, 0.2901961, 1, 1,
0.2276237, -0.2756647, 3.197016, 0, 0.2862745, 1, 1,
0.2343622, -0.2874001, 3.397758, 0, 0.2784314, 1, 1,
0.2348648, -1.104423, 1.516399, 0, 0.2745098, 1, 1,
0.2356969, -0.5571097, 2.870268, 0, 0.2666667, 1, 1,
0.2364957, 0.09383292, 2.548024, 0, 0.2627451, 1, 1,
0.237763, 1.353662, -0.6068307, 0, 0.254902, 1, 1,
0.237896, -1.523236, 3.121276, 0, 0.2509804, 1, 1,
0.2397124, -0.4676381, 2.66558, 0, 0.2431373, 1, 1,
0.240307, -0.08657474, 3.617365, 0, 0.2392157, 1, 1,
0.2556463, -0.6993112, 5.617926, 0, 0.2313726, 1, 1,
0.2556482, -0.4394827, 3.818553, 0, 0.227451, 1, 1,
0.2564605, -0.0960584, 2.010438, 0, 0.2196078, 1, 1,
0.2574639, 0.4895273, -0.004808194, 0, 0.2156863, 1, 1,
0.2585278, 0.7809879, 0.1076021, 0, 0.2078431, 1, 1,
0.2590215, -0.502972, 3.301232, 0, 0.2039216, 1, 1,
0.2614657, -1.11534, 4.613077, 0, 0.1960784, 1, 1,
0.2665029, 1.312539, 0.5552059, 0, 0.1882353, 1, 1,
0.2672822, 0.159503, 2.377608, 0, 0.1843137, 1, 1,
0.2691506, -0.9120421, 4.163918, 0, 0.1764706, 1, 1,
0.2695785, -0.111106, 2.516417, 0, 0.172549, 1, 1,
0.2698173, -0.05087234, 0.1479982, 0, 0.1647059, 1, 1,
0.270222, -1.171419, 2.465958, 0, 0.1607843, 1, 1,
0.2723626, 1.327377, 0.1799758, 0, 0.1529412, 1, 1,
0.2744166, -0.2294419, 2.198861, 0, 0.1490196, 1, 1,
0.279869, 0.574509, 0.08975561, 0, 0.1411765, 1, 1,
0.2804094, 0.3937455, 2.313802, 0, 0.1372549, 1, 1,
0.281823, -0.04528593, 1.377868, 0, 0.1294118, 1, 1,
0.282689, 0.02744691, 1.800146, 0, 0.1254902, 1, 1,
0.2830551, 0.4966575, 0.553312, 0, 0.1176471, 1, 1,
0.283817, 0.6487516, 0.8065626, 0, 0.1137255, 1, 1,
0.2978751, 0.4501259, 0.6151678, 0, 0.1058824, 1, 1,
0.3017548, -1.377237, 1.936816, 0, 0.09803922, 1, 1,
0.3055953, -1.673798, 4.061999, 0, 0.09411765, 1, 1,
0.3115577, 0.6121917, -0.2930564, 0, 0.08627451, 1, 1,
0.3155208, 0.3204351, -0.04564265, 0, 0.08235294, 1, 1,
0.3206456, -0.03573456, 1.927108, 0, 0.07450981, 1, 1,
0.3213922, 0.1737465, 1.048138, 0, 0.07058824, 1, 1,
0.324349, -0.05185349, 1.217038, 0, 0.0627451, 1, 1,
0.3262407, -1.015043, 4.113843, 0, 0.05882353, 1, 1,
0.3287411, 1.057906, -0.2381254, 0, 0.05098039, 1, 1,
0.3323956, -1.636847, 4.098135, 0, 0.04705882, 1, 1,
0.3324071, 2.934798, 0.8893134, 0, 0.03921569, 1, 1,
0.3367553, 1.1255, 0.4715486, 0, 0.03529412, 1, 1,
0.3384735, -1.125075, 3.928691, 0, 0.02745098, 1, 1,
0.3440531, 0.3845976, 0.2938443, 0, 0.02352941, 1, 1,
0.3442217, 1.735601, 0.14707, 0, 0.01568628, 1, 1,
0.3442498, -0.364184, 0.77698, 0, 0.01176471, 1, 1,
0.3449049, -0.135972, 2.583497, 0, 0.003921569, 1, 1,
0.352594, -0.09276053, 2.461938, 0.003921569, 0, 1, 1,
0.3546652, -1.094678, 2.842465, 0.007843138, 0, 1, 1,
0.3551193, -0.3308925, 1.446029, 0.01568628, 0, 1, 1,
0.3640641, -2.053392, 4.784425, 0.01960784, 0, 1, 1,
0.3661271, 0.7471917, 1.444994, 0.02745098, 0, 1, 1,
0.3716832, -1.41607, 3.122036, 0.03137255, 0, 1, 1,
0.3729337, 1.186335, 1.214656, 0.03921569, 0, 1, 1,
0.3787105, -0.1374006, 0.5898938, 0.04313726, 0, 1, 1,
0.3798577, 0.5367957, 0.07821041, 0.05098039, 0, 1, 1,
0.3798774, -1.178123, 2.850967, 0.05490196, 0, 1, 1,
0.3820414, 1.050645, 1.31504, 0.0627451, 0, 1, 1,
0.3886756, -1.359363, 3.064613, 0.06666667, 0, 1, 1,
0.3890604, 0.6982833, 1.44433, 0.07450981, 0, 1, 1,
0.3930188, 0.9389634, -0.2399595, 0.07843138, 0, 1, 1,
0.3971981, 1.161384, -0.545572, 0.08627451, 0, 1, 1,
0.3975725, -0.9730695, 1.679106, 0.09019608, 0, 1, 1,
0.3999797, -2.027459, 2.469294, 0.09803922, 0, 1, 1,
0.4020149, -0.6123904, 3.697337, 0.1058824, 0, 1, 1,
0.4066165, -0.1018611, 0.3135253, 0.1098039, 0, 1, 1,
0.4091702, 0.1644968, 0.8045467, 0.1176471, 0, 1, 1,
0.4140292, 0.8699896, 1.377455, 0.1215686, 0, 1, 1,
0.4145706, -1.049853, 3.158655, 0.1294118, 0, 1, 1,
0.4181514, 0.4547886, 0.425111, 0.1333333, 0, 1, 1,
0.4185961, -0.2713039, 1.58092, 0.1411765, 0, 1, 1,
0.4238925, 0.2676094, 1.36682, 0.145098, 0, 1, 1,
0.430527, -0.3761092, 4.198123, 0.1529412, 0, 1, 1,
0.4308037, -1.51462, 4.083101, 0.1568628, 0, 1, 1,
0.4324549, -0.7699026, 2.332484, 0.1647059, 0, 1, 1,
0.4329199, -0.5071357, 1.537402, 0.1686275, 0, 1, 1,
0.4356811, -0.4028218, 2.183201, 0.1764706, 0, 1, 1,
0.4408323, 0.3024679, 0.6557273, 0.1803922, 0, 1, 1,
0.4409533, 0.1035478, -0.5276317, 0.1882353, 0, 1, 1,
0.4477359, 1.184786, -1.920801, 0.1921569, 0, 1, 1,
0.448832, -0.09353355, 1.187231, 0.2, 0, 1, 1,
0.4518004, 1.246309, 1.361645, 0.2078431, 0, 1, 1,
0.4530603, -0.0297413, -0.209804, 0.2117647, 0, 1, 1,
0.4575662, -0.07096508, 0.7826167, 0.2196078, 0, 1, 1,
0.4695526, -0.9253331, 1.216395, 0.2235294, 0, 1, 1,
0.4696163, 1.158415, 0.3013372, 0.2313726, 0, 1, 1,
0.480371, -0.4192115, 3.779372, 0.2352941, 0, 1, 1,
0.480451, 0.2452403, 0.9050838, 0.2431373, 0, 1, 1,
0.4816298, 1.772359, 1.1897, 0.2470588, 0, 1, 1,
0.4842834, -1.083889, 2.709631, 0.254902, 0, 1, 1,
0.4853502, -0.005140098, 1.508839, 0.2588235, 0, 1, 1,
0.4868376, -0.7878622, 1.779149, 0.2666667, 0, 1, 1,
0.4917737, 0.01759043, 1.996979, 0.2705882, 0, 1, 1,
0.4918, 1.036006, 0.1109224, 0.2784314, 0, 1, 1,
0.4961101, 1.213173, 0.7770194, 0.282353, 0, 1, 1,
0.4968863, -0.217572, 2.531855, 0.2901961, 0, 1, 1,
0.4981707, -0.1450958, 2.835592, 0.2941177, 0, 1, 1,
0.4994729, 0.2254746, 1.125647, 0.3019608, 0, 1, 1,
0.4996672, 0.3040782, 0.4568947, 0.3098039, 0, 1, 1,
0.5009533, -0.2550221, 2.13535, 0.3137255, 0, 1, 1,
0.5016425, 0.5627243, 0.8994847, 0.3215686, 0, 1, 1,
0.5041826, 0.3287647, 0.08420067, 0.3254902, 0, 1, 1,
0.5079231, 1.209533, -0.1413286, 0.3333333, 0, 1, 1,
0.5118288, 0.9312564, 0.0984568, 0.3372549, 0, 1, 1,
0.5188274, -2.060119, 2.409508, 0.345098, 0, 1, 1,
0.5188529, -0.7212437, 1.913286, 0.3490196, 0, 1, 1,
0.5198231, -0.3710628, 1.794497, 0.3568628, 0, 1, 1,
0.5223538, 1.514784, 0.972832, 0.3607843, 0, 1, 1,
0.5252795, -0.6849157, 2.668691, 0.3686275, 0, 1, 1,
0.5281725, -1.382651, 3.013613, 0.372549, 0, 1, 1,
0.5368772, -1.36076, 2.760017, 0.3803922, 0, 1, 1,
0.5371218, -1.264836, 4.698517, 0.3843137, 0, 1, 1,
0.5399137, 2.248221, 0.1712021, 0.3921569, 0, 1, 1,
0.5406408, -0.7677587, 1.747906, 0.3960784, 0, 1, 1,
0.5436334, -0.7347973, 2.038272, 0.4039216, 0, 1, 1,
0.5436943, -0.9399252, 2.84214, 0.4117647, 0, 1, 1,
0.5538071, 0.6570517, 2.301488, 0.4156863, 0, 1, 1,
0.5666013, -0.5880472, 2.296162, 0.4235294, 0, 1, 1,
0.5692306, 1.667925, 0.9652038, 0.427451, 0, 1, 1,
0.5712806, -0.5574154, 1.919638, 0.4352941, 0, 1, 1,
0.5740944, -0.2704942, 2.974109, 0.4392157, 0, 1, 1,
0.5760542, -1.205009, 4.301058, 0.4470588, 0, 1, 1,
0.576993, -1.469373, 3.009953, 0.4509804, 0, 1, 1,
0.5775445, -0.1112581, 0.9596927, 0.4588235, 0, 1, 1,
0.578987, -1.656202, 2.603346, 0.4627451, 0, 1, 1,
0.5809957, 0.6342048, 0.01047282, 0.4705882, 0, 1, 1,
0.5812017, -0.1789014, 1.797816, 0.4745098, 0, 1, 1,
0.5894672, 1.423844, 2.548737, 0.4823529, 0, 1, 1,
0.5933222, -0.05038992, 1.245911, 0.4862745, 0, 1, 1,
0.6064573, 0.7433329, 1.239929, 0.4941176, 0, 1, 1,
0.6100851, -0.0428623, 2.153244, 0.5019608, 0, 1, 1,
0.6129102, -0.6404684, 1.822706, 0.5058824, 0, 1, 1,
0.6138744, -0.2169177, 1.592709, 0.5137255, 0, 1, 1,
0.6166665, -1.363934, 1.545257, 0.5176471, 0, 1, 1,
0.6179174, 0.720925, 0.5489229, 0.5254902, 0, 1, 1,
0.6227223, 2.57528, 0.7195682, 0.5294118, 0, 1, 1,
0.6255043, -1.186988, 2.734113, 0.5372549, 0, 1, 1,
0.6299501, 0.05466256, 0.3027816, 0.5411765, 0, 1, 1,
0.6320291, 0.06189505, 2.038344, 0.5490196, 0, 1, 1,
0.6396967, 0.2445504, 0.7548633, 0.5529412, 0, 1, 1,
0.6410019, 1.163085, 2.539875, 0.5607843, 0, 1, 1,
0.642974, 0.6418122, 1.380322, 0.5647059, 0, 1, 1,
0.6434676, -1.231964, 3.928287, 0.572549, 0, 1, 1,
0.6472289, 1.479105, -0.6749125, 0.5764706, 0, 1, 1,
0.6535069, 0.6988366, -0.7080351, 0.5843138, 0, 1, 1,
0.6595689, -0.3381272, 1.840889, 0.5882353, 0, 1, 1,
0.6619802, 0.1359086, 0.371318, 0.5960785, 0, 1, 1,
0.6620163, 0.9975129, -1.599455, 0.6039216, 0, 1, 1,
0.6652071, 0.4183084, 0.7835518, 0.6078432, 0, 1, 1,
0.6672432, 1.273325, -1.291721, 0.6156863, 0, 1, 1,
0.6743373, 0.8753592, -0.4899178, 0.6196079, 0, 1, 1,
0.6860213, 0.3258412, 0.9224007, 0.627451, 0, 1, 1,
0.6879506, -2.053446, 2.648994, 0.6313726, 0, 1, 1,
0.6909328, -1.350899, 3.55083, 0.6392157, 0, 1, 1,
0.692425, 0.1671761, -0.08256108, 0.6431373, 0, 1, 1,
0.6949624, 0.3030193, -0.2477429, 0.6509804, 0, 1, 1,
0.6965012, 0.5230454, 0.9536999, 0.654902, 0, 1, 1,
0.6972583, -0.4828545, 1.862969, 0.6627451, 0, 1, 1,
0.6977255, 0.2639647, 1.431508, 0.6666667, 0, 1, 1,
0.6977796, -0.2262226, 1.617005, 0.6745098, 0, 1, 1,
0.7059587, 0.3809588, 2.464721, 0.6784314, 0, 1, 1,
0.7077687, 0.4923204, 0.4791228, 0.6862745, 0, 1, 1,
0.7098737, 0.4559385, -0.2872835, 0.6901961, 0, 1, 1,
0.711558, -0.3690496, 2.434491, 0.6980392, 0, 1, 1,
0.7115692, -1.462123, 1.943659, 0.7058824, 0, 1, 1,
0.7115826, -0.8859761, 4.116323, 0.7098039, 0, 1, 1,
0.713818, 1.367658, 0.8380558, 0.7176471, 0, 1, 1,
0.7156036, 1.968426, -0.5136557, 0.7215686, 0, 1, 1,
0.7185339, -1.777778, 2.786677, 0.7294118, 0, 1, 1,
0.7224009, 0.3798345, 1.469779, 0.7333333, 0, 1, 1,
0.7230737, -0.6139703, 2.373255, 0.7411765, 0, 1, 1,
0.7245925, 1.791445, -2.164071, 0.7450981, 0, 1, 1,
0.7277405, 0.5233766, 1.627743, 0.7529412, 0, 1, 1,
0.7321205, -1.738474, 3.434226, 0.7568628, 0, 1, 1,
0.7352897, 0.5218729, 0.4931253, 0.7647059, 0, 1, 1,
0.735395, -0.7322933, 2.627293, 0.7686275, 0, 1, 1,
0.7421897, -1.240809, 3.406952, 0.7764706, 0, 1, 1,
0.7448582, -0.3850454, -1.075405, 0.7803922, 0, 1, 1,
0.7540708, 1.104478, 1.009929, 0.7882353, 0, 1, 1,
0.7598419, -0.888799, 3.328962, 0.7921569, 0, 1, 1,
0.7646614, 0.3030742, 0.4255268, 0.8, 0, 1, 1,
0.7646645, 0.6894349, 0.2866229, 0.8078431, 0, 1, 1,
0.7675952, 0.3857208, 1.270319, 0.8117647, 0, 1, 1,
0.7802298, 1.1357, -0.5033997, 0.8196079, 0, 1, 1,
0.7829173, 0.2726136, 1.868291, 0.8235294, 0, 1, 1,
0.7840137, -0.71496, 2.965658, 0.8313726, 0, 1, 1,
0.7874103, 0.2856019, 3.05836, 0.8352941, 0, 1, 1,
0.7972585, 1.905158, 0.6760802, 0.8431373, 0, 1, 1,
0.8002471, -1.704542, 2.39232, 0.8470588, 0, 1, 1,
0.8010338, -0.7395864, 0.9651479, 0.854902, 0, 1, 1,
0.8015171, -0.238996, 1.222203, 0.8588235, 0, 1, 1,
0.8043232, 0.4374823, 2.556887, 0.8666667, 0, 1, 1,
0.806389, 0.7451813, 0.1817985, 0.8705882, 0, 1, 1,
0.8093438, 1.241078, 1.829135, 0.8784314, 0, 1, 1,
0.8106369, 2.106185, 0.8836315, 0.8823529, 0, 1, 1,
0.8260853, 0.6083638, 1.004332, 0.8901961, 0, 1, 1,
0.8287787, -0.4686051, 2.443054, 0.8941177, 0, 1, 1,
0.8292098, -2.123961, 2.981936, 0.9019608, 0, 1, 1,
0.8296498, -0.5878876, 3.025656, 0.9098039, 0, 1, 1,
0.8308377, -1.835046, 2.10974, 0.9137255, 0, 1, 1,
0.8392642, -0.4736145, 1.836686, 0.9215686, 0, 1, 1,
0.8424979, -0.1501994, 1.563674, 0.9254902, 0, 1, 1,
0.8482766, 0.3802148, 2.124232, 0.9333333, 0, 1, 1,
0.8483599, -1.137973, 1.162095, 0.9372549, 0, 1, 1,
0.8525338, 1.753542, 1.493012, 0.945098, 0, 1, 1,
0.8611317, -1.148685, 3.582563, 0.9490196, 0, 1, 1,
0.86693, -0.955945, 4.363665, 0.9568627, 0, 1, 1,
0.8690838, 0.3009512, 2.653318, 0.9607843, 0, 1, 1,
0.870146, 0.07656308, 1.953605, 0.9686275, 0, 1, 1,
0.8729404, 0.3023273, 1.15256, 0.972549, 0, 1, 1,
0.8753483, -1.01574, 1.356575, 0.9803922, 0, 1, 1,
0.8835679, -0.232285, 1.513661, 0.9843137, 0, 1, 1,
0.8858376, -0.9115594, -0.5735861, 0.9921569, 0, 1, 1,
0.8907243, 0.5977758, 0.9859319, 0.9960784, 0, 1, 1,
0.8989926, 0.1698388, 2.500203, 1, 0, 0.9960784, 1,
0.9073561, -0.1774113, 1.28963, 1, 0, 0.9882353, 1,
0.9074056, -0.7743179, 1.793122, 1, 0, 0.9843137, 1,
0.9081774, -0.7349136, 0.7221419, 1, 0, 0.9764706, 1,
0.911557, -0.09597398, 3.487709, 1, 0, 0.972549, 1,
0.9247737, 1.204374, 1.152789, 1, 0, 0.9647059, 1,
0.9335871, -2.281112, 3.169769, 1, 0, 0.9607843, 1,
0.9342723, 0.06189335, 1.069217, 1, 0, 0.9529412, 1,
0.9365738, 0.5601695, 1.914546, 1, 0, 0.9490196, 1,
0.9435634, 0.5743928, 1.82093, 1, 0, 0.9411765, 1,
0.9462619, -0.4764991, 2.656463, 1, 0, 0.9372549, 1,
0.9468279, -0.8108637, 1.779235, 1, 0, 0.9294118, 1,
0.9495203, 0.9194328, 2.743287, 1, 0, 0.9254902, 1,
0.9603471, -1.120253, 2.568338, 1, 0, 0.9176471, 1,
0.9604425, -0.3692821, 2.911696, 1, 0, 0.9137255, 1,
0.9620929, 0.1229427, 1.380449, 1, 0, 0.9058824, 1,
0.9653031, 0.4407092, 0.8789163, 1, 0, 0.9019608, 1,
0.9709479, -0.6850133, 1.387793, 1, 0, 0.8941177, 1,
0.9768878, 1.013347, -0.1032898, 1, 0, 0.8862745, 1,
0.9774419, -0.8324232, 2.352946, 1, 0, 0.8823529, 1,
0.9783988, -1.02151, 3.689644, 1, 0, 0.8745098, 1,
0.9786444, -0.9710553, 2.528217, 1, 0, 0.8705882, 1,
0.9804605, -1.827816, 3.464706, 1, 0, 0.8627451, 1,
1.007867, -0.8065543, 3.196418, 1, 0, 0.8588235, 1,
1.010808, -0.9147822, 2.814571, 1, 0, 0.8509804, 1,
1.0158, 1.483819, 0.5923522, 1, 0, 0.8470588, 1,
1.020713, 0.1511586, 1.600086, 1, 0, 0.8392157, 1,
1.025014, 0.06751706, 0.6055374, 1, 0, 0.8352941, 1,
1.027125, -0.1685576, 0.8523741, 1, 0, 0.827451, 1,
1.032631, 1.775118, 0.6303024, 1, 0, 0.8235294, 1,
1.037072, 1.00178, 1.196974, 1, 0, 0.8156863, 1,
1.039005, -0.6420119, 4.232446, 1, 0, 0.8117647, 1,
1.042335, 0.7961928, 0.3576094, 1, 0, 0.8039216, 1,
1.048005, -0.9513497, 3.55317, 1, 0, 0.7960784, 1,
1.054349, -0.8269914, 1.058809, 1, 0, 0.7921569, 1,
1.057271, -0.3121373, 0.9622401, 1, 0, 0.7843137, 1,
1.060612, 1.263201, 1.532621, 1, 0, 0.7803922, 1,
1.061896, -0.3731178, 2.953395, 1, 0, 0.772549, 1,
1.063652, -0.8561528, 2.848518, 1, 0, 0.7686275, 1,
1.071288, -0.03527389, 1.439325, 1, 0, 0.7607843, 1,
1.071524, -0.4098013, 2.921871, 1, 0, 0.7568628, 1,
1.075287, -1.406643, 2.663613, 1, 0, 0.7490196, 1,
1.085279, -0.269484, 3.914711, 1, 0, 0.7450981, 1,
1.089155, 0.6692775, 3.545705, 1, 0, 0.7372549, 1,
1.093414, 2.494006, 0.4866069, 1, 0, 0.7333333, 1,
1.100047, 1.621275, 0.1781754, 1, 0, 0.7254902, 1,
1.101086, -0.1121411, 0.8771789, 1, 0, 0.7215686, 1,
1.106515, 1.120606, -0.5169647, 1, 0, 0.7137255, 1,
1.108168, -1.635511, 2.731246, 1, 0, 0.7098039, 1,
1.110229, -0.2462975, 0.9910509, 1, 0, 0.7019608, 1,
1.122369, 0.8485737, 0.3020812, 1, 0, 0.6941177, 1,
1.124027, 0.2343644, 2.210814, 1, 0, 0.6901961, 1,
1.127924, 0.3934074, 1.62226, 1, 0, 0.682353, 1,
1.131119, 0.09239626, 0.6753699, 1, 0, 0.6784314, 1,
1.137982, -0.02049392, 1.71426, 1, 0, 0.6705883, 1,
1.141042, 0.722921, 1.360981, 1, 0, 0.6666667, 1,
1.152609, -0.6251172, 1.654894, 1, 0, 0.6588235, 1,
1.155143, -0.07102446, 0.3744007, 1, 0, 0.654902, 1,
1.160504, -1.110278, 1.736787, 1, 0, 0.6470588, 1,
1.167756, -0.2147272, 2.213448, 1, 0, 0.6431373, 1,
1.169659, 0.3824544, -1.178338, 1, 0, 0.6352941, 1,
1.173464, -0.608059, 2.01581, 1, 0, 0.6313726, 1,
1.176872, -0.856023, 3.594558, 1, 0, 0.6235294, 1,
1.183262, 0.1956659, 3.08789, 1, 0, 0.6196079, 1,
1.190343, -0.6896506, 2.210092, 1, 0, 0.6117647, 1,
1.190868, 0.8290066, 1.350404, 1, 0, 0.6078432, 1,
1.196674, -1.381617, 1.942732, 1, 0, 0.6, 1,
1.205482, -0.6652846, 3.129218, 1, 0, 0.5921569, 1,
1.211185, 0.6388683, -0.008754953, 1, 0, 0.5882353, 1,
1.218958, -1.554477, 1.901525, 1, 0, 0.5803922, 1,
1.223436, -0.6659942, 3.987823, 1, 0, 0.5764706, 1,
1.223534, 0.03658255, 1.061113, 1, 0, 0.5686275, 1,
1.230307, 0.9181845, 1.510781, 1, 0, 0.5647059, 1,
1.235744, -0.3861061, 2.625171, 1, 0, 0.5568628, 1,
1.243087, 0.2574596, 1.030168, 1, 0, 0.5529412, 1,
1.24399, 0.8552399, 0.9337637, 1, 0, 0.5450981, 1,
1.250552, -0.3578413, 3.027672, 1, 0, 0.5411765, 1,
1.258063, -0.4708298, 1.433206, 1, 0, 0.5333334, 1,
1.258817, -0.5536337, 1.161893, 1, 0, 0.5294118, 1,
1.259434, -0.0108861, 2.024323, 1, 0, 0.5215687, 1,
1.264107, -0.5611853, 1.625977, 1, 0, 0.5176471, 1,
1.277791, -0.7651969, 1.677488, 1, 0, 0.509804, 1,
1.285226, -1.082844, 1.094426, 1, 0, 0.5058824, 1,
1.287479, -1.39211, 3.104077, 1, 0, 0.4980392, 1,
1.304569, -0.04782777, 1.624213, 1, 0, 0.4901961, 1,
1.305354, 2.820153, 0.6198213, 1, 0, 0.4862745, 1,
1.30708, -0.3903116, 0.5471208, 1, 0, 0.4784314, 1,
1.307397, 0.4988167, 0.5940293, 1, 0, 0.4745098, 1,
1.308057, 0.5709461, 1.214154, 1, 0, 0.4666667, 1,
1.32651, -2.64067, 3.209252, 1, 0, 0.4627451, 1,
1.328305, 0.1892982, 1.823042, 1, 0, 0.454902, 1,
1.333615, -0.4726828, 0.9497958, 1, 0, 0.4509804, 1,
1.376722, -0.1034775, 1.567829, 1, 0, 0.4431373, 1,
1.376927, 0.02934997, 0.694174, 1, 0, 0.4392157, 1,
1.377625, -1.060583, 2.378611, 1, 0, 0.4313726, 1,
1.384932, -1.074412, 0.6885445, 1, 0, 0.427451, 1,
1.385313, 0.3404469, 2.145871, 1, 0, 0.4196078, 1,
1.387027, 1.371814, -0.7351719, 1, 0, 0.4156863, 1,
1.418087, 0.906749, 0.3942417, 1, 0, 0.4078431, 1,
1.467375, 0.7131425, 0.6017104, 1, 0, 0.4039216, 1,
1.483487, -1.148998, 3.112797, 1, 0, 0.3960784, 1,
1.506846, 0.2037299, 0.6455539, 1, 0, 0.3882353, 1,
1.512492, -0.7473156, 1.235435, 1, 0, 0.3843137, 1,
1.523043, 0.5587215, 0.5788781, 1, 0, 0.3764706, 1,
1.525801, -0.3801533, 1.16092, 1, 0, 0.372549, 1,
1.540806, 1.638583, -0.2823728, 1, 0, 0.3647059, 1,
1.552102, -0.1847297, 2.57373, 1, 0, 0.3607843, 1,
1.55663, -0.2384572, 2.690156, 1, 0, 0.3529412, 1,
1.561682, 0.9354525, 0.7607005, 1, 0, 0.3490196, 1,
1.581321, 0.8186908, 0.3414962, 1, 0, 0.3411765, 1,
1.587428, -0.9875688, 1.696912, 1, 0, 0.3372549, 1,
1.651448, -0.7534356, 2.307103, 1, 0, 0.3294118, 1,
1.662918, -1.042459, 0.5403336, 1, 0, 0.3254902, 1,
1.665223, -0.8562394, 2.876221, 1, 0, 0.3176471, 1,
1.668147, -0.2373268, 1.971787, 1, 0, 0.3137255, 1,
1.702308, -1.643673, 2.457759, 1, 0, 0.3058824, 1,
1.703228, -0.09195549, 1.386378, 1, 0, 0.2980392, 1,
1.721417, -0.05799046, 1.503309, 1, 0, 0.2941177, 1,
1.739306, -0.1890601, 2.927185, 1, 0, 0.2862745, 1,
1.760518, -0.3845753, 1.781779, 1, 0, 0.282353, 1,
1.765979, -1.42868, 1.843114, 1, 0, 0.2745098, 1,
1.77461, -0.9775295, 1.941501, 1, 0, 0.2705882, 1,
1.789448, -0.8308837, 2.232822, 1, 0, 0.2627451, 1,
1.790008, -0.4835895, 2.397673, 1, 0, 0.2588235, 1,
1.854621, -0.1285808, 2.056542, 1, 0, 0.2509804, 1,
1.857146, 3.601195, 1.396438, 1, 0, 0.2470588, 1,
1.879914, -1.731286, 3.115285, 1, 0, 0.2392157, 1,
1.888062, -1.164899, 2.250538, 1, 0, 0.2352941, 1,
1.888807, -0.7537804, 1.41034, 1, 0, 0.227451, 1,
1.889418, -0.5189652, 1.151194, 1, 0, 0.2235294, 1,
1.906046, 1.101698, -0.1450236, 1, 0, 0.2156863, 1,
1.92319, 1.248717, 1.376868, 1, 0, 0.2117647, 1,
1.937901, -0.02968365, -0.3275985, 1, 0, 0.2039216, 1,
1.949945, -0.6956734, 0.8147958, 1, 0, 0.1960784, 1,
1.961678, -0.005441882, -0.5465665, 1, 0, 0.1921569, 1,
1.987473, -0.4981931, 0.4584044, 1, 0, 0.1843137, 1,
1.998283, 0.2241593, 1.782244, 1, 0, 0.1803922, 1,
2.017693, 0.8812013, 2.022033, 1, 0, 0.172549, 1,
2.05159, 0.5342054, 0.8582783, 1, 0, 0.1686275, 1,
2.057044, -0.2833994, 1.824419, 1, 0, 0.1607843, 1,
2.08325, -0.08540231, 3.79465, 1, 0, 0.1568628, 1,
2.105708, -0.5046239, 3.314007, 1, 0, 0.1490196, 1,
2.105777, -0.1190195, 1.152208, 1, 0, 0.145098, 1,
2.12274, -0.3576083, 3.407135, 1, 0, 0.1372549, 1,
2.15301, 0.03056429, 2.556522, 1, 0, 0.1333333, 1,
2.158803, 0.2964712, 1.356025, 1, 0, 0.1254902, 1,
2.196866, -1.252324, 4.39707, 1, 0, 0.1215686, 1,
2.20355, -0.9610427, 0.6523549, 1, 0, 0.1137255, 1,
2.205, 0.3525242, 2.059204, 1, 0, 0.1098039, 1,
2.218038, 0.998127, 2.393446, 1, 0, 0.1019608, 1,
2.260008, 0.8066105, 1.019491, 1, 0, 0.09411765, 1,
2.276494, 3.093293, 1.151692, 1, 0, 0.09019608, 1,
2.292063, 0.675887, 1.364641, 1, 0, 0.08235294, 1,
2.333718, 1.230313, 3.678503, 1, 0, 0.07843138, 1,
2.370481, 0.12811, 2.158952, 1, 0, 0.07058824, 1,
2.373721, 0.7334017, 1.03721, 1, 0, 0.06666667, 1,
2.466142, -1.24829, 2.118756, 1, 0, 0.05882353, 1,
2.516023, -1.890218, 2.615572, 1, 0, 0.05490196, 1,
2.622137, -1.231826, 2.369372, 1, 0, 0.04705882, 1,
2.631143, 1.574963, 1.438731, 1, 0, 0.04313726, 1,
2.795216, -1.133823, 1.706961, 1, 0, 0.03529412, 1,
2.939374, -1.856207, 0.9807982, 1, 0, 0.03137255, 1,
2.959772, 0.8161984, 2.291047, 1, 0, 0.02352941, 1,
3.053703, -0.8950152, 1.258082, 1, 0, 0.01960784, 1,
3.116373, 0.1464232, 1.967944, 1, 0, 0.01176471, 1,
3.302798, -0.1265498, 0.8264419, 1, 0, 0.007843138, 1
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
0.1575233, -3.828943, -7.826677, 0, -0.5, 0.5, 0.5,
0.1575233, -3.828943, -7.826677, 1, -0.5, 0.5, 0.5,
0.1575233, -3.828943, -7.826677, 1, 1.5, 0.5, 0.5,
0.1575233, -3.828943, -7.826677, 0, 1.5, 0.5, 0.5
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
-4.053999, 0.4245651, -7.826677, 0, -0.5, 0.5, 0.5,
-4.053999, 0.4245651, -7.826677, 1, -0.5, 0.5, 0.5,
-4.053999, 0.4245651, -7.826677, 1, 1.5, 0.5, 0.5,
-4.053999, 0.4245651, -7.826677, 0, 1.5, 0.5, 0.5
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
-4.053999, -3.828943, -0.0403266, 0, -0.5, 0.5, 0.5,
-4.053999, -3.828943, -0.0403266, 1, -0.5, 0.5, 0.5,
-4.053999, -3.828943, -0.0403266, 1, 1.5, 0.5, 0.5,
-4.053999, -3.828943, -0.0403266, 0, 1.5, 0.5, 0.5
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
-2, -2.847364, -6.029827,
3, -2.847364, -6.029827,
-2, -2.847364, -6.029827,
-2, -3.01096, -6.329302,
-1, -2.847364, -6.029827,
-1, -3.01096, -6.329302,
0, -2.847364, -6.029827,
0, -3.01096, -6.329302,
1, -2.847364, -6.029827,
1, -3.01096, -6.329302,
2, -2.847364, -6.029827,
2, -3.01096, -6.329302,
3, -2.847364, -6.029827,
3, -3.01096, -6.329302
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
-2, -3.338153, -6.928252, 0, -0.5, 0.5, 0.5,
-2, -3.338153, -6.928252, 1, -0.5, 0.5, 0.5,
-2, -3.338153, -6.928252, 1, 1.5, 0.5, 0.5,
-2, -3.338153, -6.928252, 0, 1.5, 0.5, 0.5,
-1, -3.338153, -6.928252, 0, -0.5, 0.5, 0.5,
-1, -3.338153, -6.928252, 1, -0.5, 0.5, 0.5,
-1, -3.338153, -6.928252, 1, 1.5, 0.5, 0.5,
-1, -3.338153, -6.928252, 0, 1.5, 0.5, 0.5,
0, -3.338153, -6.928252, 0, -0.5, 0.5, 0.5,
0, -3.338153, -6.928252, 1, -0.5, 0.5, 0.5,
0, -3.338153, -6.928252, 1, 1.5, 0.5, 0.5,
0, -3.338153, -6.928252, 0, 1.5, 0.5, 0.5,
1, -3.338153, -6.928252, 0, -0.5, 0.5, 0.5,
1, -3.338153, -6.928252, 1, -0.5, 0.5, 0.5,
1, -3.338153, -6.928252, 1, 1.5, 0.5, 0.5,
1, -3.338153, -6.928252, 0, 1.5, 0.5, 0.5,
2, -3.338153, -6.928252, 0, -0.5, 0.5, 0.5,
2, -3.338153, -6.928252, 1, -0.5, 0.5, 0.5,
2, -3.338153, -6.928252, 1, 1.5, 0.5, 0.5,
2, -3.338153, -6.928252, 0, 1.5, 0.5, 0.5,
3, -3.338153, -6.928252, 0, -0.5, 0.5, 0.5,
3, -3.338153, -6.928252, 1, -0.5, 0.5, 0.5,
3, -3.338153, -6.928252, 1, 1.5, 0.5, 0.5,
3, -3.338153, -6.928252, 0, 1.5, 0.5, 0.5
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
-3.08211, -2, -6.029827,
-3.08211, 3, -6.029827,
-3.08211, -2, -6.029827,
-3.244091, -2, -6.329302,
-3.08211, -1, -6.029827,
-3.244091, -1, -6.329302,
-3.08211, 0, -6.029827,
-3.244091, 0, -6.329302,
-3.08211, 1, -6.029827,
-3.244091, 1, -6.329302,
-3.08211, 2, -6.029827,
-3.244091, 2, -6.329302,
-3.08211, 3, -6.029827,
-3.244091, 3, -6.329302
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
-3.568055, -2, -6.928252, 0, -0.5, 0.5, 0.5,
-3.568055, -2, -6.928252, 1, -0.5, 0.5, 0.5,
-3.568055, -2, -6.928252, 1, 1.5, 0.5, 0.5,
-3.568055, -2, -6.928252, 0, 1.5, 0.5, 0.5,
-3.568055, -1, -6.928252, 0, -0.5, 0.5, 0.5,
-3.568055, -1, -6.928252, 1, -0.5, 0.5, 0.5,
-3.568055, -1, -6.928252, 1, 1.5, 0.5, 0.5,
-3.568055, -1, -6.928252, 0, 1.5, 0.5, 0.5,
-3.568055, 0, -6.928252, 0, -0.5, 0.5, 0.5,
-3.568055, 0, -6.928252, 1, -0.5, 0.5, 0.5,
-3.568055, 0, -6.928252, 1, 1.5, 0.5, 0.5,
-3.568055, 0, -6.928252, 0, 1.5, 0.5, 0.5,
-3.568055, 1, -6.928252, 0, -0.5, 0.5, 0.5,
-3.568055, 1, -6.928252, 1, -0.5, 0.5, 0.5,
-3.568055, 1, -6.928252, 1, 1.5, 0.5, 0.5,
-3.568055, 1, -6.928252, 0, 1.5, 0.5, 0.5,
-3.568055, 2, -6.928252, 0, -0.5, 0.5, 0.5,
-3.568055, 2, -6.928252, 1, -0.5, 0.5, 0.5,
-3.568055, 2, -6.928252, 1, 1.5, 0.5, 0.5,
-3.568055, 2, -6.928252, 0, 1.5, 0.5, 0.5,
-3.568055, 3, -6.928252, 0, -0.5, 0.5, 0.5,
-3.568055, 3, -6.928252, 1, -0.5, 0.5, 0.5,
-3.568055, 3, -6.928252, 1, 1.5, 0.5, 0.5,
-3.568055, 3, -6.928252, 0, 1.5, 0.5, 0.5
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
-3.08211, -2.847364, -4,
-3.08211, -2.847364, 4,
-3.08211, -2.847364, -4,
-3.244091, -3.01096, -4,
-3.08211, -2.847364, -2,
-3.244091, -3.01096, -2,
-3.08211, -2.847364, 0,
-3.244091, -3.01096, 0,
-3.08211, -2.847364, 2,
-3.244091, -3.01096, 2,
-3.08211, -2.847364, 4,
-3.244091, -3.01096, 4
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
-3.568055, -3.338153, -4, 0, -0.5, 0.5, 0.5,
-3.568055, -3.338153, -4, 1, -0.5, 0.5, 0.5,
-3.568055, -3.338153, -4, 1, 1.5, 0.5, 0.5,
-3.568055, -3.338153, -4, 0, 1.5, 0.5, 0.5,
-3.568055, -3.338153, -2, 0, -0.5, 0.5, 0.5,
-3.568055, -3.338153, -2, 1, -0.5, 0.5, 0.5,
-3.568055, -3.338153, -2, 1, 1.5, 0.5, 0.5,
-3.568055, -3.338153, -2, 0, 1.5, 0.5, 0.5,
-3.568055, -3.338153, 0, 0, -0.5, 0.5, 0.5,
-3.568055, -3.338153, 0, 1, -0.5, 0.5, 0.5,
-3.568055, -3.338153, 0, 1, 1.5, 0.5, 0.5,
-3.568055, -3.338153, 0, 0, 1.5, 0.5, 0.5,
-3.568055, -3.338153, 2, 0, -0.5, 0.5, 0.5,
-3.568055, -3.338153, 2, 1, -0.5, 0.5, 0.5,
-3.568055, -3.338153, 2, 1, 1.5, 0.5, 0.5,
-3.568055, -3.338153, 2, 0, 1.5, 0.5, 0.5,
-3.568055, -3.338153, 4, 0, -0.5, 0.5, 0.5,
-3.568055, -3.338153, 4, 1, -0.5, 0.5, 0.5,
-3.568055, -3.338153, 4, 1, 1.5, 0.5, 0.5,
-3.568055, -3.338153, 4, 0, 1.5, 0.5, 0.5
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
-3.08211, -2.847364, -6.029827,
-3.08211, 3.696494, -6.029827,
-3.08211, -2.847364, 5.949174,
-3.08211, 3.696494, 5.949174,
-3.08211, -2.847364, -6.029827,
-3.08211, -2.847364, 5.949174,
-3.08211, 3.696494, -6.029827,
-3.08211, 3.696494, 5.949174,
-3.08211, -2.847364, -6.029827,
3.397156, -2.847364, -6.029827,
-3.08211, -2.847364, 5.949174,
3.397156, -2.847364, 5.949174,
-3.08211, 3.696494, -6.029827,
3.397156, 3.696494, -6.029827,
-3.08211, 3.696494, 5.949174,
3.397156, 3.696494, 5.949174,
3.397156, -2.847364, -6.029827,
3.397156, 3.696494, -6.029827,
3.397156, -2.847364, 5.949174,
3.397156, 3.696494, 5.949174,
3.397156, -2.847364, -6.029827,
3.397156, -2.847364, 5.949174,
3.397156, 3.696494, -6.029827,
3.397156, 3.696494, 5.949174
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
var radius = 8.068223;
var distance = 35.89643;
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
mvMatrix.translate( -0.1575233, -0.4245651, 0.0403266 );
mvMatrix.scale( 1.346375, 1.333085, 0.7282344 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.89643);
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
Gusathion<-read.table("Gusathion.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Gusathion$V2
```

```
## Error in eval(expr, envir, enclos): object 'Gusathion' not found
```

```r
y<-Gusathion$V3
```

```
## Error in eval(expr, envir, enclos): object 'Gusathion' not found
```

```r
z<-Gusathion$V4
```

```
## Error in eval(expr, envir, enclos): object 'Gusathion' not found
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
-2.987751, 0.6250691, -0.7188287, 0, 0, 1, 1, 1,
-2.912166, -1.448845, -0.753105, 1, 0, 0, 1, 1,
-2.81006, 0.1938699, -2.288284, 1, 0, 0, 1, 1,
-2.754265, 0.6366596, -2.138422, 1, 0, 0, 1, 1,
-2.717084, -0.07280067, -0.004448308, 1, 0, 0, 1, 1,
-2.675619, 1.523356, -1.756384, 1, 0, 0, 1, 1,
-2.588292, 1.090056, -0.6598316, 0, 0, 0, 1, 1,
-2.46789, 0.7962407, -1.093372, 0, 0, 0, 1, 1,
-2.416033, -1.539828, -1.929728, 0, 0, 0, 1, 1,
-2.381774, 1.143802, -2.434561, 0, 0, 0, 1, 1,
-2.366398, -0.4235705, -0.9602041, 0, 0, 0, 1, 1,
-2.30651, 1.818054, -1.413427, 0, 0, 0, 1, 1,
-2.29271, -0.05270854, -0.6513055, 0, 0, 0, 1, 1,
-2.288703, -1.470726, -2.744387, 1, 1, 1, 1, 1,
-2.256538, 0.1676636, -1.638893, 1, 1, 1, 1, 1,
-2.232819, 0.7506926, -1.300386, 1, 1, 1, 1, 1,
-2.195411, -0.155654, -2.345436, 1, 1, 1, 1, 1,
-2.188218, -2.722107, -1.720863, 1, 1, 1, 1, 1,
-2.183899, 0.004831681, -1.619682, 1, 1, 1, 1, 1,
-2.172255, -0.845615, -2.410289, 1, 1, 1, 1, 1,
-2.17016, -0.5474997, -1.215911, 1, 1, 1, 1, 1,
-2.149729, -0.8328177, -2.650537, 1, 1, 1, 1, 1,
-2.13442, -1.339447, -1.904885, 1, 1, 1, 1, 1,
-2.123915, -0.7813826, -1.522384, 1, 1, 1, 1, 1,
-2.123767, -0.8145571, -3.484432, 1, 1, 1, 1, 1,
-2.080879, -1.439858, -1.330188, 1, 1, 1, 1, 1,
-2.080839, 0.8993732, -0.0639196, 1, 1, 1, 1, 1,
-2.071429, 0.7648253, 0.7871343, 1, 1, 1, 1, 1,
-2.069253, -0.168735, -2.441166, 0, 0, 1, 1, 1,
-2.036265, 2.071622, -1.379393, 1, 0, 0, 1, 1,
-2.016771, -1.427394, -2.663331, 1, 0, 0, 1, 1,
-1.991335, 0.2950619, -2.437439, 1, 0, 0, 1, 1,
-1.964927, 1.645883, -0.9251176, 1, 0, 0, 1, 1,
-1.956573, 0.7947802, -1.747811, 1, 0, 0, 1, 1,
-1.941473, 2.197963, 0.01256044, 0, 0, 0, 1, 1,
-1.932989, 1.467726, -1.039929, 0, 0, 0, 1, 1,
-1.917272, 2.094878, 0.6006365, 0, 0, 0, 1, 1,
-1.909053, 0.8898287, -1.006558, 0, 0, 0, 1, 1,
-1.908906, -0.1428059, -0.7726262, 0, 0, 0, 1, 1,
-1.892971, -0.7791584, -0.7094112, 0, 0, 0, 1, 1,
-1.889126, -0.4276717, -2.825969, 0, 0, 0, 1, 1,
-1.882899, 0.1797179, -1.616282, 1, 1, 1, 1, 1,
-1.875415, 1.656135, -0.3101514, 1, 1, 1, 1, 1,
-1.874192, -0.8068219, -1.31407, 1, 1, 1, 1, 1,
-1.873796, -0.2057727, -0.6559197, 1, 1, 1, 1, 1,
-1.866136, 1.516142, -0.7352974, 1, 1, 1, 1, 1,
-1.856375, 0.03309383, -3.191698, 1, 1, 1, 1, 1,
-1.837149, 0.9379169, -1.001499, 1, 1, 1, 1, 1,
-1.831218, 0.6482213, -1.198959, 1, 1, 1, 1, 1,
-1.826887, -0.9917751, 1.101815, 1, 1, 1, 1, 1,
-1.802955, 0.04017657, -0.5647162, 1, 1, 1, 1, 1,
-1.796965, -0.787468, -2.938838, 1, 1, 1, 1, 1,
-1.794357, -0.2944493, -1.588105, 1, 1, 1, 1, 1,
-1.793936, -1.493837, -1.799464, 1, 1, 1, 1, 1,
-1.790284, -0.5043218, 1.214494, 1, 1, 1, 1, 1,
-1.787678, -1.091808, -1.043998, 1, 1, 1, 1, 1,
-1.786976, 0.3427873, 0.08638849, 0, 0, 1, 1, 1,
-1.766386, 0.4453967, -0.2318399, 1, 0, 0, 1, 1,
-1.76292, 0.2348629, -2.80193, 1, 0, 0, 1, 1,
-1.755527, -1.540996, -2.030105, 1, 0, 0, 1, 1,
-1.749864, 0.2483279, -0.5740853, 1, 0, 0, 1, 1,
-1.748516, -0.3801452, -1.14219, 1, 0, 0, 1, 1,
-1.747206, 0.0793865, -1.09937, 0, 0, 0, 1, 1,
-1.74695, 0.1624469, -2.996162, 0, 0, 0, 1, 1,
-1.738757, -0.1411617, -2.315776, 0, 0, 0, 1, 1,
-1.726673, -0.157868, -1.213704, 0, 0, 0, 1, 1,
-1.720923, 2.512602, 0.1874346, 0, 0, 0, 1, 1,
-1.708704, -0.9288222, -2.198469, 0, 0, 0, 1, 1,
-1.701673, 0.8951373, -0.5270204, 0, 0, 0, 1, 1,
-1.690217, -0.9716276, -2.569852, 1, 1, 1, 1, 1,
-1.685929, -0.8830992, -3.084692, 1, 1, 1, 1, 1,
-1.678276, -1.16718, -2.340865, 1, 1, 1, 1, 1,
-1.669409, 0.01077587, -0.6023638, 1, 1, 1, 1, 1,
-1.666293, 0.9710257, -0.8051418, 1, 1, 1, 1, 1,
-1.666169, 0.8605915, -0.0938744, 1, 1, 1, 1, 1,
-1.663527, 0.2762542, -0.3546904, 1, 1, 1, 1, 1,
-1.65368, -1.209254, -0.9676195, 1, 1, 1, 1, 1,
-1.652093, 0.5243204, -0.4652179, 1, 1, 1, 1, 1,
-1.651453, 0.1118176, -3.725633, 1, 1, 1, 1, 1,
-1.651364, 1.166123, 0.02282986, 1, 1, 1, 1, 1,
-1.650139, 0.1224636, -2.110219, 1, 1, 1, 1, 1,
-1.647671, -0.4167874, -2.850262, 1, 1, 1, 1, 1,
-1.635003, -0.09660099, 0.93576, 1, 1, 1, 1, 1,
-1.615218, -2.733914, -3.231947, 1, 1, 1, 1, 1,
-1.614947, -1.872767, -3.016737, 0, 0, 1, 1, 1,
-1.589964, 0.03705151, -4.034566, 1, 0, 0, 1, 1,
-1.588875, -0.1680937, -1.612369, 1, 0, 0, 1, 1,
-1.583997, 1.339283, 0.504099, 1, 0, 0, 1, 1,
-1.583064, 0.3045806, -1.617612, 1, 0, 0, 1, 1,
-1.568348, 1.325818, -0.3951709, 1, 0, 0, 1, 1,
-1.551954, 1.742502, -1.301905, 0, 0, 0, 1, 1,
-1.550048, -0.8641289, -0.4451101, 0, 0, 0, 1, 1,
-1.535665, -0.292428, -2.116392, 0, 0, 0, 1, 1,
-1.53001, -0.7423672, -0.9841155, 0, 0, 0, 1, 1,
-1.508266, -2.236658, -1.784118, 0, 0, 0, 1, 1,
-1.504013, -0.2446869, -0.873038, 0, 0, 0, 1, 1,
-1.497791, 0.8210419, -0.3314265, 0, 0, 0, 1, 1,
-1.495932, -1.352824, -2.182394, 1, 1, 1, 1, 1,
-1.484478, -0.1143859, -0.8656116, 1, 1, 1, 1, 1,
-1.465016, -0.5356337, -1.435462, 1, 1, 1, 1, 1,
-1.460827, -1.388263, -2.361146, 1, 1, 1, 1, 1,
-1.453271, -0.7224747, -2.033949, 1, 1, 1, 1, 1,
-1.451092, -0.7894871, -2.777179, 1, 1, 1, 1, 1,
-1.448906, -0.6510291, -1.212985, 1, 1, 1, 1, 1,
-1.446025, 1.263069, -0.9550272, 1, 1, 1, 1, 1,
-1.444132, 3.122534, -2.305393, 1, 1, 1, 1, 1,
-1.431417, -1.224736, -1.9645, 1, 1, 1, 1, 1,
-1.425947, -1.365251, -2.307177, 1, 1, 1, 1, 1,
-1.416065, 1.796119, -1.064166, 1, 1, 1, 1, 1,
-1.414872, -0.5871413, -1.537456, 1, 1, 1, 1, 1,
-1.383011, 0.3988049, -1.850761, 1, 1, 1, 1, 1,
-1.382908, -0.9045299, -1.071609, 1, 1, 1, 1, 1,
-1.378927, 0.3662004, -1.634794, 0, 0, 1, 1, 1,
-1.375575, -1.061186, -3.270043, 1, 0, 0, 1, 1,
-1.374207, 1.131196, -1.144492, 1, 0, 0, 1, 1,
-1.360699, 0.3711255, -0.9644727, 1, 0, 0, 1, 1,
-1.359696, 0.4339918, -3.085236, 1, 0, 0, 1, 1,
-1.350104, 0.5828242, -2.291271, 1, 0, 0, 1, 1,
-1.349626, 0.4698267, -1.232603, 0, 0, 0, 1, 1,
-1.317822, 1.892009, -1.526291, 0, 0, 0, 1, 1,
-1.2936, 0.2452513, -0.4675691, 0, 0, 0, 1, 1,
-1.290019, -0.12849, -0.1171837, 0, 0, 0, 1, 1,
-1.28115, 2.301828, -2.432235, 0, 0, 0, 1, 1,
-1.276761, 0.4106823, -1.701583, 0, 0, 0, 1, 1,
-1.273799, 0.06296162, 2.173788, 0, 0, 0, 1, 1,
-1.260542, 0.04062, -0.1966592, 1, 1, 1, 1, 1,
-1.25254, 0.309257, -1.478955, 1, 1, 1, 1, 1,
-1.24836, 0.4465524, -2.426783, 1, 1, 1, 1, 1,
-1.247298, -0.529507, 0.7021596, 1, 1, 1, 1, 1,
-1.242084, 0.8408495, -1.132942, 1, 1, 1, 1, 1,
-1.240121, -1.474702, -2.153184, 1, 1, 1, 1, 1,
-1.238332, 1.917693, 0.9984666, 1, 1, 1, 1, 1,
-1.231883, -0.3506629, -0.08902053, 1, 1, 1, 1, 1,
-1.224733, -0.7773572, -2.08101, 1, 1, 1, 1, 1,
-1.221438, 0.5127086, -0.9266007, 1, 1, 1, 1, 1,
-1.217863, 1.109611, -2.164371, 1, 1, 1, 1, 1,
-1.208627, 0.2637669, -0.7886969, 1, 1, 1, 1, 1,
-1.199939, 0.9472476, -1.71082, 1, 1, 1, 1, 1,
-1.191023, 0.1297426, -1.759358, 1, 1, 1, 1, 1,
-1.183913, 0.3921884, -2.205244, 1, 1, 1, 1, 1,
-1.182187, 1.701597, -1.318049, 0, 0, 1, 1, 1,
-1.175773, -0.09165665, -0.997018, 1, 0, 0, 1, 1,
-1.171471, -1.857005, -3.701228, 1, 0, 0, 1, 1,
-1.169401, -2.571081, -2.203869, 1, 0, 0, 1, 1,
-1.168908, -1.397857, -4.194983, 1, 0, 0, 1, 1,
-1.168371, -0.8045083, -1.42827, 1, 0, 0, 1, 1,
-1.167235, -0.991398, -3.668001, 0, 0, 0, 1, 1,
-1.166676, 1.416079, -1.194732, 0, 0, 0, 1, 1,
-1.140172, 0.2460852, -1.390098, 0, 0, 0, 1, 1,
-1.139582, -0.08646324, -2.216863, 0, 0, 0, 1, 1,
-1.132536, 1.07258, -0.7376177, 0, 0, 0, 1, 1,
-1.131736, 0.1088451, -0.5788537, 0, 0, 0, 1, 1,
-1.128366, 0.8956835, -0.452417, 0, 0, 0, 1, 1,
-1.118421, 1.033441, -0.1582085, 1, 1, 1, 1, 1,
-1.117037, -0.9641868, -2.75461, 1, 1, 1, 1, 1,
-1.116044, 0.3303904, -1.610352, 1, 1, 1, 1, 1,
-1.115632, 1.817037, -1.287414, 1, 1, 1, 1, 1,
-1.115089, -0.3272642, -2.669859, 1, 1, 1, 1, 1,
-1.114794, -1.053558, -2.06661, 1, 1, 1, 1, 1,
-1.114142, 1.536357, -0.3008569, 1, 1, 1, 1, 1,
-1.11115, 0.6996292, -0.392528, 1, 1, 1, 1, 1,
-1.110043, 1.331263, -0.1058967, 1, 1, 1, 1, 1,
-1.103754, 1.653561, -0.09697829, 1, 1, 1, 1, 1,
-1.101496, -1.009334, -4.156485, 1, 1, 1, 1, 1,
-1.092846, -0.172857, -2.133223, 1, 1, 1, 1, 1,
-1.089656, -0.3471489, -3.167422, 1, 1, 1, 1, 1,
-1.081447, 0.9653022, -0.1576943, 1, 1, 1, 1, 1,
-1.076829, -0.5400245, -1.537987, 1, 1, 1, 1, 1,
-1.076284, -1.440182, -4.119195, 0, 0, 1, 1, 1,
-1.075283, 0.5606375, -1.216541, 1, 0, 0, 1, 1,
-1.075196, -2.231648, -1.03729, 1, 0, 0, 1, 1,
-1.071485, 0.09483867, -1.241144, 1, 0, 0, 1, 1,
-1.066468, 0.01053627, -1.257217, 1, 0, 0, 1, 1,
-1.064049, -0.1146468, -1.786807, 1, 0, 0, 1, 1,
-1.058894, -1.4737, -3.286772, 0, 0, 0, 1, 1,
-1.058358, 0.4756064, -1.788678, 0, 0, 0, 1, 1,
-1.055207, -0.1489193, -1.405681, 0, 0, 0, 1, 1,
-1.052711, -0.3792671, 0.01419945, 0, 0, 0, 1, 1,
-1.048272, -1.251914, -4.051398, 0, 0, 0, 1, 1,
-1.041592, -0.9476379, -1.867595, 0, 0, 0, 1, 1,
-1.037256, 0.6817536, -1.838292, 0, 0, 0, 1, 1,
-1.034736, 0.2028187, -1.83274, 1, 1, 1, 1, 1,
-1.032138, 0.3900466, -0.2087033, 1, 1, 1, 1, 1,
-1.03077, -0.09811331, -1.136835, 1, 1, 1, 1, 1,
-1.025358, 0.5417127, -1.974556, 1, 1, 1, 1, 1,
-1.023146, 0.7571355, 0.5670391, 1, 1, 1, 1, 1,
-1.022782, -1.478545, -2.251656, 1, 1, 1, 1, 1,
-1.0166, -1.02248, -2.902556, 1, 1, 1, 1, 1,
-1.01517, -0.240589, -0.9120532, 1, 1, 1, 1, 1,
-1.014677, 0.706589, -1.927317, 1, 1, 1, 1, 1,
-0.99578, -1.003468, -1.534614, 1, 1, 1, 1, 1,
-0.9886966, -0.9550884, -3.018349, 1, 1, 1, 1, 1,
-0.9851922, -0.8455176, -2.370657, 1, 1, 1, 1, 1,
-0.9842658, -0.08747769, -1.82741, 1, 1, 1, 1, 1,
-0.9824182, -0.1068972, -1.903301, 1, 1, 1, 1, 1,
-0.9823064, 0.3650984, -0.3036692, 1, 1, 1, 1, 1,
-0.9806255, -1.027403, -3.125637, 0, 0, 1, 1, 1,
-0.9793896, 1.187018, 0.5953877, 1, 0, 0, 1, 1,
-0.9790767, -0.6034735, -4.11088, 1, 0, 0, 1, 1,
-0.9790734, 0.231436, -3.953604, 1, 0, 0, 1, 1,
-0.9789376, -0.7504222, -3.523677, 1, 0, 0, 1, 1,
-0.9776152, 1.077783, 1.426614, 1, 0, 0, 1, 1,
-0.9774315, 0.04094274, 0.3862034, 0, 0, 0, 1, 1,
-0.972303, -0.7791277, -3.14873, 0, 0, 0, 1, 1,
-0.9618272, -1.053544, -3.529197, 0, 0, 0, 1, 1,
-0.9613981, -1.129447, -2.990978, 0, 0, 0, 1, 1,
-0.9599431, -0.08758968, -2.302511, 0, 0, 0, 1, 1,
-0.9585264, 0.5198085, -3.008523, 0, 0, 0, 1, 1,
-0.9566975, -0.6462939, -1.551706, 0, 0, 0, 1, 1,
-0.9564077, -0.6041533, -2.302191, 1, 1, 1, 1, 1,
-0.9553171, -0.3061512, -0.9512886, 1, 1, 1, 1, 1,
-0.949784, 0.3209552, 0.4951373, 1, 1, 1, 1, 1,
-0.9492027, 0.5924548, -0.943952, 1, 1, 1, 1, 1,
-0.9418751, 1.010125, -1.761173, 1, 1, 1, 1, 1,
-0.9330412, 0.74425, -1.088073, 1, 1, 1, 1, 1,
-0.9313484, 0.9010744, 0.1445614, 1, 1, 1, 1, 1,
-0.9251341, -1.533646, -3.053053, 1, 1, 1, 1, 1,
-0.9250366, 1.445566, 0.8318126, 1, 1, 1, 1, 1,
-0.9196017, -0.3829548, -2.888617, 1, 1, 1, 1, 1,
-0.9173548, 0.7960618, -1.260702, 1, 1, 1, 1, 1,
-0.9155501, 0.1820233, -1.741333, 1, 1, 1, 1, 1,
-0.9154054, 0.7433294, -2.063196, 1, 1, 1, 1, 1,
-0.9113504, -0.7108939, -2.471344, 1, 1, 1, 1, 1,
-0.9099342, -0.3317341, -3.316079, 1, 1, 1, 1, 1,
-0.9077384, -0.7874048, -2.791865, 0, 0, 1, 1, 1,
-0.9015925, -1.424405, -1.663333, 1, 0, 0, 1, 1,
-0.9010273, -0.3427908, -0.7877977, 1, 0, 0, 1, 1,
-0.8990838, -0.3913029, -2.758569, 1, 0, 0, 1, 1,
-0.8913091, 1.160048, 0.2140433, 1, 0, 0, 1, 1,
-0.8895808, -0.7517687, -3.623278, 1, 0, 0, 1, 1,
-0.8869111, 1.532226, -1.825596, 0, 0, 0, 1, 1,
-0.8844873, 0.2976986, -1.867292, 0, 0, 0, 1, 1,
-0.8784497, -0.885684, -2.197278, 0, 0, 0, 1, 1,
-0.8777457, -0.7476246, -2.674776, 0, 0, 0, 1, 1,
-0.874608, -0.2890854, -0.7169282, 0, 0, 0, 1, 1,
-0.8674465, 0.4088232, -2.532321, 0, 0, 0, 1, 1,
-0.8529332, 0.8017728, -1.124672, 0, 0, 0, 1, 1,
-0.852402, -0.8152419, -0.859446, 1, 1, 1, 1, 1,
-0.848117, -0.5957593, -3.147568, 1, 1, 1, 1, 1,
-0.8461393, 0.7981538, -1.851438, 1, 1, 1, 1, 1,
-0.8439015, 0.6219783, 0.1346215, 1, 1, 1, 1, 1,
-0.8311493, 0.2489859, -1.225293, 1, 1, 1, 1, 1,
-0.8284439, -0.5764672, -1.211217, 1, 1, 1, 1, 1,
-0.8274941, -0.09814656, -0.4841982, 1, 1, 1, 1, 1,
-0.8273981, 0.5985755, -1.941244, 1, 1, 1, 1, 1,
-0.8268605, -0.2074117, -2.194805, 1, 1, 1, 1, 1,
-0.8240848, 1.6073, 0.2893384, 1, 1, 1, 1, 1,
-0.7870483, 0.9183628, -1.333786, 1, 1, 1, 1, 1,
-0.7838713, 0.286675, 0.7105678, 1, 1, 1, 1, 1,
-0.7837223, 0.6595874, -1.539358, 1, 1, 1, 1, 1,
-0.783674, -0.2296452, -3.721009, 1, 1, 1, 1, 1,
-0.7778192, 0.4347734, -2.688479, 1, 1, 1, 1, 1,
-0.7751872, -0.2593713, -0.3791966, 0, 0, 1, 1, 1,
-0.7751663, -2.295795, -2.580183, 1, 0, 0, 1, 1,
-0.7703778, -1.342337, -1.856136, 1, 0, 0, 1, 1,
-0.769368, 0.8826487, -0.2380183, 1, 0, 0, 1, 1,
-0.7683898, -0.712833, -1.227841, 1, 0, 0, 1, 1,
-0.7640656, -0.07219351, -1.240393, 1, 0, 0, 1, 1,
-0.7605013, 0.4331414, -1.262602, 0, 0, 0, 1, 1,
-0.7571819, 0.3273555, -1.079893, 0, 0, 0, 1, 1,
-0.7488486, 0.4480022, -2.108869, 0, 0, 0, 1, 1,
-0.7462818, -0.5325803, -3.1108, 0, 0, 0, 1, 1,
-0.7453517, 1.383536, -0.1993664, 0, 0, 0, 1, 1,
-0.7401644, 1.642925, -1.91315, 0, 0, 0, 1, 1,
-0.7393826, 0.3804468, -3.021841, 0, 0, 0, 1, 1,
-0.7378621, 0.9342, -0.6461591, 1, 1, 1, 1, 1,
-0.7361882, -2.670886, -2.580331, 1, 1, 1, 1, 1,
-0.7328693, -1.28764, -3.35626, 1, 1, 1, 1, 1,
-0.7283159, -0.8062171, -2.191522, 1, 1, 1, 1, 1,
-0.7168163, -0.4553025, -2.89629, 1, 1, 1, 1, 1,
-0.7122612, -1.568452, -3.534638, 1, 1, 1, 1, 1,
-0.7111212, 0.7649542, -1.672699, 1, 1, 1, 1, 1,
-0.7071228, 0.7898505, -0.1111715, 1, 1, 1, 1, 1,
-0.7026932, -1.667563, -4.529194, 1, 1, 1, 1, 1,
-0.6997511, 0.201558, -2.651279, 1, 1, 1, 1, 1,
-0.6919352, -0.2217661, -2.391023, 1, 1, 1, 1, 1,
-0.6899657, 0.8697771, -1.463, 1, 1, 1, 1, 1,
-0.6871698, -0.7336555, -2.100256, 1, 1, 1, 1, 1,
-0.6842636, 1.077026, -0.621165, 1, 1, 1, 1, 1,
-0.6830264, -1.403777, -3.539451, 1, 1, 1, 1, 1,
-0.6819767, -0.08970621, -2.330222, 0, 0, 1, 1, 1,
-0.6795354, -0.07485325, -1.644618, 1, 0, 0, 1, 1,
-0.6793543, 2.772408, 0.6376554, 1, 0, 0, 1, 1,
-0.6789646, 0.3864519, -1.92188, 1, 0, 0, 1, 1,
-0.673457, -1.613532, -3.544106, 1, 0, 0, 1, 1,
-0.6719441, 1.084874, -0.5356743, 1, 0, 0, 1, 1,
-0.6618149, -1.582566, -2.619759, 0, 0, 0, 1, 1,
-0.6615171, 0.6537285, -0.4633474, 0, 0, 0, 1, 1,
-0.6570187, 0.2573186, 0.767444, 0, 0, 0, 1, 1,
-0.6563671, 1.483452, -1.084995, 0, 0, 0, 1, 1,
-0.6561694, 0.0865792, -1.787662, 0, 0, 0, 1, 1,
-0.6542735, 0.9688647, -0.5777395, 0, 0, 0, 1, 1,
-0.6485692, -0.03220505, -0.8418384, 0, 0, 0, 1, 1,
-0.643745, 0.1999681, -2.083952, 1, 1, 1, 1, 1,
-0.6412716, 0.543591, -0.1633759, 1, 1, 1, 1, 1,
-0.6387709, 0.5996934, -0.1974302, 1, 1, 1, 1, 1,
-0.6366206, -0.2052563, -2.166934, 1, 1, 1, 1, 1,
-0.6325477, -2.226188, -3.248981, 1, 1, 1, 1, 1,
-0.6297493, -0.4803401, -1.81864, 1, 1, 1, 1, 1,
-0.6289814, 0.9286444, -0.2933655, 1, 1, 1, 1, 1,
-0.6262142, -0.3048637, -0.9682627, 1, 1, 1, 1, 1,
-0.6208239, 0.01060857, -1.388721, 1, 1, 1, 1, 1,
-0.613551, 0.2696495, -0.7213646, 1, 1, 1, 1, 1,
-0.6131071, 1.155237, 0.1735107, 1, 1, 1, 1, 1,
-0.6116957, 0.2307326, -0.5525776, 1, 1, 1, 1, 1,
-0.6073135, -0.2997395, -0.2379208, 1, 1, 1, 1, 1,
-0.6060829, 0.1420667, -2.011675, 1, 1, 1, 1, 1,
-0.6020517, -1.695998, -3.567559, 1, 1, 1, 1, 1,
-0.5952577, -0.8160648, -0.3543397, 0, 0, 1, 1, 1,
-0.5914834, 0.4166983, 1.033654, 1, 0, 0, 1, 1,
-0.5865502, -0.004216397, -1.300303, 1, 0, 0, 1, 1,
-0.5863484, -0.467648, -1.925668, 1, 0, 0, 1, 1,
-0.5862902, -0.1529246, -2.338045, 1, 0, 0, 1, 1,
-0.586085, 0.127303, -0.7500386, 1, 0, 0, 1, 1,
-0.5818989, -1.043036, -2.5826, 0, 0, 0, 1, 1,
-0.5772153, 0.01526398, -0.3454476, 0, 0, 0, 1, 1,
-0.5676256, -2.469029, -3.474304, 0, 0, 0, 1, 1,
-0.5670418, 1.002097, -0.5541241, 0, 0, 0, 1, 1,
-0.5663635, -0.7554144, -4.716907, 0, 0, 0, 1, 1,
-0.5658635, 0.7556583, -1.242592, 0, 0, 0, 1, 1,
-0.562262, 0.03938231, -2.728529, 0, 0, 0, 1, 1,
-0.5539261, 0.7363892, 1.918909, 1, 1, 1, 1, 1,
-0.5464011, -0.1650244, -1.995356, 1, 1, 1, 1, 1,
-0.5419863, -0.7672114, -2.378816, 1, 1, 1, 1, 1,
-0.5394567, -1.086372, -3.983653, 1, 1, 1, 1, 1,
-0.539053, -0.4494368, -3.317109, 1, 1, 1, 1, 1,
-0.5345605, 0.6788792, 0.4425504, 1, 1, 1, 1, 1,
-0.5336563, 0.02576173, -0.08950282, 1, 1, 1, 1, 1,
-0.5311402, -1.919057, -2.762048, 1, 1, 1, 1, 1,
-0.5251679, -1.798403, -3.73421, 1, 1, 1, 1, 1,
-0.524187, -0.8069199, -2.427954, 1, 1, 1, 1, 1,
-0.5207904, 1.070859, -0.5797633, 1, 1, 1, 1, 1,
-0.5168803, -0.3332674, -0.3185768, 1, 1, 1, 1, 1,
-0.5136642, 0.03157829, 0.008304616, 1, 1, 1, 1, 1,
-0.5103635, -1.438434, -2.484189, 1, 1, 1, 1, 1,
-0.5078501, -0.6471106, -1.742534, 1, 1, 1, 1, 1,
-0.506522, 0.3137197, -1.271747, 0, 0, 1, 1, 1,
-0.5031759, 0.05117999, -2.017864, 1, 0, 0, 1, 1,
-0.5028754, -0.619045, -1.81105, 1, 0, 0, 1, 1,
-0.497467, 0.08468556, -2.233565, 1, 0, 0, 1, 1,
-0.491226, 0.434533, -1.748576, 1, 0, 0, 1, 1,
-0.4901886, 0.5341134, -1.67647, 1, 0, 0, 1, 1,
-0.4848738, -0.3237238, -2.290398, 0, 0, 0, 1, 1,
-0.4829787, 0.3569277, -1.876479, 0, 0, 0, 1, 1,
-0.4777881, 1.057137, 0.2801103, 0, 0, 0, 1, 1,
-0.468939, 0.9972779, -0.4134763, 0, 0, 0, 1, 1,
-0.4675452, -1.056601, -2.631576, 0, 0, 0, 1, 1,
-0.4646322, 0.4439528, -0.1424052, 0, 0, 0, 1, 1,
-0.4625262, -0.1848735, 0.3286688, 0, 0, 0, 1, 1,
-0.4618753, -1.861623, -3.046064, 1, 1, 1, 1, 1,
-0.4613465, 0.3402475, 0.2484154, 1, 1, 1, 1, 1,
-0.4584816, -1.525638, -2.665437, 1, 1, 1, 1, 1,
-0.4554673, 0.1553461, -1.967649, 1, 1, 1, 1, 1,
-0.4491481, 0.9501951, -1.827186, 1, 1, 1, 1, 1,
-0.4490542, 0.9130033, -2.417291, 1, 1, 1, 1, 1,
-0.4451406, -0.9511986, -2.872981, 1, 1, 1, 1, 1,
-0.4424538, 1.447509, -0.1464156, 1, 1, 1, 1, 1,
-0.4381559, 1.925712, 0.393115, 1, 1, 1, 1, 1,
-0.4370866, -0.695693, -2.125567, 1, 1, 1, 1, 1,
-0.4338369, -0.5809965, -1.162838, 1, 1, 1, 1, 1,
-0.4325653, -0.6353197, -1.390553, 1, 1, 1, 1, 1,
-0.432174, 0.1247668, -1.398095, 1, 1, 1, 1, 1,
-0.4315208, -0.08960576, -1.672634, 1, 1, 1, 1, 1,
-0.4282866, -1.085785, -1.014234, 1, 1, 1, 1, 1,
-0.4266328, 0.01183531, -1.881901, 0, 0, 1, 1, 1,
-0.4230622, -0.7420766, -2.656037, 1, 0, 0, 1, 1,
-0.4219911, 0.9845166, -2.09614, 1, 0, 0, 1, 1,
-0.4208592, -0.9776778, -2.41231, 1, 0, 0, 1, 1,
-0.418906, -0.04069896, -3.156475, 1, 0, 0, 1, 1,
-0.4164999, -0.9594867, -1.854633, 1, 0, 0, 1, 1,
-0.412793, 0.3827555, -1.65853, 0, 0, 0, 1, 1,
-0.4125428, -1.136581, -3.840083, 0, 0, 0, 1, 1,
-0.4114939, -0.3078941, -3.526305, 0, 0, 0, 1, 1,
-0.410368, 0.8066477, 0.2007743, 0, 0, 0, 1, 1,
-0.4070458, -1.071682, -3.684215, 0, 0, 0, 1, 1,
-0.4062167, 0.8425716, 1.112714, 0, 0, 0, 1, 1,
-0.4055285, 0.9583625, 1.643327, 0, 0, 0, 1, 1,
-0.3962798, 0.733727, -1.171625, 1, 1, 1, 1, 1,
-0.3958652, -0.7333757, -2.900072, 1, 1, 1, 1, 1,
-0.3923588, 1.018403, -2.336218, 1, 1, 1, 1, 1,
-0.3909921, -1.561024, -2.836034, 1, 1, 1, 1, 1,
-0.3884031, -0.3496822, -2.004986, 1, 1, 1, 1, 1,
-0.3876677, -0.05678643, -0.7752993, 1, 1, 1, 1, 1,
-0.3870293, 0.364358, 0.506871, 1, 1, 1, 1, 1,
-0.3782064, 1.428352, -1.399608, 1, 1, 1, 1, 1,
-0.3733504, 0.428766, -1.411991, 1, 1, 1, 1, 1,
-0.3599756, 0.7168657, -0.6886669, 1, 1, 1, 1, 1,
-0.3548672, 0.3554052, -1.40404, 1, 1, 1, 1, 1,
-0.353428, 0.2106317, -0.9049051, 1, 1, 1, 1, 1,
-0.3524876, 0.7785349, -1.385599, 1, 1, 1, 1, 1,
-0.3417759, 1.56125, -1.500387, 1, 1, 1, 1, 1,
-0.3385718, 0.7182185, -0.4703731, 1, 1, 1, 1, 1,
-0.337294, -0.7432284, -2.943291, 0, 0, 1, 1, 1,
-0.3354328, 1.426131, -1.622376, 1, 0, 0, 1, 1,
-0.3310823, 1.347611, -0.8790519, 1, 0, 0, 1, 1,
-0.3287853, 1.635984, 1.50037, 1, 0, 0, 1, 1,
-0.3250553, -0.4020968, -1.85117, 1, 0, 0, 1, 1,
-0.3232404, -0.9510943, -1.018767, 1, 0, 0, 1, 1,
-0.3227385, -1.56076, -4.004453, 0, 0, 0, 1, 1,
-0.3216972, 1.330496, -0.1580508, 0, 0, 0, 1, 1,
-0.3193161, 0.9183878, -1.005552, 0, 0, 0, 1, 1,
-0.3184801, -1.069481, -3.39751, 0, 0, 0, 1, 1,
-0.3120535, 0.644985, -1.178637, 0, 0, 0, 1, 1,
-0.3112915, 0.4952087, 1.124285, 0, 0, 0, 1, 1,
-0.3106396, 0.03508999, -1.284786, 0, 0, 0, 1, 1,
-0.3092785, -0.0213713, -1.48435, 1, 1, 1, 1, 1,
-0.3084466, -0.3578025, -3.72122, 1, 1, 1, 1, 1,
-0.307674, -0.07348161, -1.336125, 1, 1, 1, 1, 1,
-0.3056489, -0.2143753, -3.106126, 1, 1, 1, 1, 1,
-0.3022223, -0.002125766, -2.747172, 1, 1, 1, 1, 1,
-0.3014971, 0.2820478, 1.552195, 1, 1, 1, 1, 1,
-0.2945823, 0.06627326, -1.122097, 1, 1, 1, 1, 1,
-0.2944483, -0.8093842, -3.476707, 1, 1, 1, 1, 1,
-0.2867751, 0.5927048, -0.6770962, 1, 1, 1, 1, 1,
-0.2864408, -0.5387655, -2.717797, 1, 1, 1, 1, 1,
-0.2851811, -0.4046293, -2.319623, 1, 1, 1, 1, 1,
-0.2806004, -0.1868627, -2.381689, 1, 1, 1, 1, 1,
-0.2768509, -2.277087, -3.501823, 1, 1, 1, 1, 1,
-0.274497, 0.9676372, -0.6664397, 1, 1, 1, 1, 1,
-0.272112, -0.3587748, -2.512402, 1, 1, 1, 1, 1,
-0.2698089, 0.4434066, -1.613489, 0, 0, 1, 1, 1,
-0.2694941, 0.8571237, -0.235259, 1, 0, 0, 1, 1,
-0.266993, 2.106497, 0.4395572, 1, 0, 0, 1, 1,
-0.2634259, -0.8441685, -2.599494, 1, 0, 0, 1, 1,
-0.2590084, -0.2631971, -1.853735, 1, 0, 0, 1, 1,
-0.2559495, -0.3367155, -2.472929, 1, 0, 0, 1, 1,
-0.2557062, 0.3359188, -0.8694675, 0, 0, 0, 1, 1,
-0.2537408, -0.7438136, -3.19826, 0, 0, 0, 1, 1,
-0.2513755, 0.5384442, -0.5349659, 0, 0, 0, 1, 1,
-0.2492559, 0.1899441, 0.4442922, 0, 0, 0, 1, 1,
-0.24715, 1.027701, 1.13672, 0, 0, 0, 1, 1,
-0.2398798, 1.636611, 0.6782154, 0, 0, 0, 1, 1,
-0.2357522, -1.276375, -2.873652, 0, 0, 0, 1, 1,
-0.2343038, 0.7457251, -1.528471, 1, 1, 1, 1, 1,
-0.2340579, 0.8969432, -0.5356898, 1, 1, 1, 1, 1,
-0.2291081, 0.3692909, 0.1298477, 1, 1, 1, 1, 1,
-0.2269727, -0.5726786, -4.306547, 1, 1, 1, 1, 1,
-0.2236843, -0.9723654, -2.360156, 1, 1, 1, 1, 1,
-0.2216674, 0.5842042, -0.3541309, 1, 1, 1, 1, 1,
-0.220971, 0.2257461, 0.3562288, 1, 1, 1, 1, 1,
-0.2189296, -0.8069882, -1.42441, 1, 1, 1, 1, 1,
-0.2177409, 0.07802108, -0.7204506, 1, 1, 1, 1, 1,
-0.2163692, 0.9110966, -0.4249993, 1, 1, 1, 1, 1,
-0.2119733, 0.1466785, -0.1286339, 1, 1, 1, 1, 1,
-0.204749, 0.9990994, -1.524404, 1, 1, 1, 1, 1,
-0.2004934, -0.2418787, -3.215059, 1, 1, 1, 1, 1,
-0.1954253, 1.229791, -2.755006, 1, 1, 1, 1, 1,
-0.193943, -1.503409, -3.31308, 1, 1, 1, 1, 1,
-0.1918723, -0.7113605, -3.742015, 0, 0, 1, 1, 1,
-0.1846806, 2.829089, -0.5292883, 1, 0, 0, 1, 1,
-0.1837939, -1.034516, -3.838916, 1, 0, 0, 1, 1,
-0.1817781, 0.4040695, 0.4398629, 1, 0, 0, 1, 1,
-0.1805859, 0.4644885, -1.322694, 1, 0, 0, 1, 1,
-0.1780528, -0.5363849, -1.608714, 1, 0, 0, 1, 1,
-0.177753, 1.846466, 0.3993544, 0, 0, 0, 1, 1,
-0.1748943, 0.9104155, -0.04654948, 0, 0, 0, 1, 1,
-0.1745541, 1.096229, -0.6525667, 0, 0, 0, 1, 1,
-0.1741277, -1.040894, -2.137057, 0, 0, 0, 1, 1,
-0.1673007, 1.134381, 0.08418478, 0, 0, 0, 1, 1,
-0.1652975, 0.7271678, -1.009876, 0, 0, 0, 1, 1,
-0.1643388, -0.1685566, -3.950855, 0, 0, 0, 1, 1,
-0.1641751, 0.4705957, -1.050083, 1, 1, 1, 1, 1,
-0.1635014, 0.1040314, -1.158627, 1, 1, 1, 1, 1,
-0.1606685, -1.759451, -3.830637, 1, 1, 1, 1, 1,
-0.1570753, 1.118297, 0.0297346, 1, 1, 1, 1, 1,
-0.1555461, 0.601479, 1.120229, 1, 1, 1, 1, 1,
-0.1492722, -0.07630567, -3.995808, 1, 1, 1, 1, 1,
-0.1449351, -1.146917, -2.779939, 1, 1, 1, 1, 1,
-0.1420898, -0.799122, -3.2613, 1, 1, 1, 1, 1,
-0.1406189, 1.622572, -0.772549, 1, 1, 1, 1, 1,
-0.1405541, -0.3648606, -4.871382, 1, 1, 1, 1, 1,
-0.1362913, -0.01708017, -2.67564, 1, 1, 1, 1, 1,
-0.1344649, -0.1436925, -2.036391, 1, 1, 1, 1, 1,
-0.1319001, 0.1985881, 2.057688, 1, 1, 1, 1, 1,
-0.1254983, -1.137732, -2.44003, 1, 1, 1, 1, 1,
-0.1162034, 0.09363613, -1.848926, 1, 1, 1, 1, 1,
-0.1115472, -0.5616471, -4.070756, 0, 0, 1, 1, 1,
-0.1062323, -1.283054, -5.855376, 1, 0, 0, 1, 1,
-0.1038437, 1.051699, -0.4128222, 1, 0, 0, 1, 1,
-0.102492, -0.05802074, -2.80156, 1, 0, 0, 1, 1,
-0.10014, 2.025038, 0.1717119, 1, 0, 0, 1, 1,
-0.09711632, 0.3929015, 1.851334, 1, 0, 0, 1, 1,
-0.09607469, -0.6461666, -3.900595, 0, 0, 0, 1, 1,
-0.0945676, -1.370051, -2.103082, 0, 0, 0, 1, 1,
-0.09359826, 0.6510134, -1.215424, 0, 0, 0, 1, 1,
-0.09136568, 0.2141865, -0.335273, 0, 0, 0, 1, 1,
-0.08226722, 0.8733194, 0.3230686, 0, 0, 0, 1, 1,
-0.08156203, 0.5055042, 0.2697113, 0, 0, 0, 1, 1,
-0.07961604, 0.248739, 0.6919302, 0, 0, 0, 1, 1,
-0.07821037, -0.4749806, -3.646954, 1, 1, 1, 1, 1,
-0.07768956, 0.9759033, -1.605169, 1, 1, 1, 1, 1,
-0.07496281, 0.6322622, 0.9648076, 1, 1, 1, 1, 1,
-0.07434109, -1.704157, -5.054845, 1, 1, 1, 1, 1,
-0.06773265, 0.3401214, 0.01864845, 1, 1, 1, 1, 1,
-0.06760392, -0.3549629, -1.76472, 1, 1, 1, 1, 1,
-0.06669021, -1.585631, -2.377799, 1, 1, 1, 1, 1,
-0.06433937, 0.3257387, 1.462664, 1, 1, 1, 1, 1,
-0.06059042, 0.3689435, 0.4004872, 1, 1, 1, 1, 1,
-0.05921467, 1.786602, 1.381432, 1, 1, 1, 1, 1,
-0.05575935, 0.4907309, 0.3883757, 1, 1, 1, 1, 1,
-0.0548934, 0.8724615, -0.5832494, 1, 1, 1, 1, 1,
-0.0495371, -0.2060876, -2.458108, 1, 1, 1, 1, 1,
-0.04883574, 1.044058, -0.0003821969, 1, 1, 1, 1, 1,
-0.0422129, 0.7453413, 0.07396907, 1, 1, 1, 1, 1,
-0.03690348, 0.03891897, -1.469736, 0, 0, 1, 1, 1,
-0.03314992, 1.667774, 0.535337, 1, 0, 0, 1, 1,
-0.03079326, -1.625571, -4.33937, 1, 0, 0, 1, 1,
-0.03043197, 1.317915, -0.576914, 1, 0, 0, 1, 1,
-0.02967943, -0.09964594, -3.584905, 1, 0, 0, 1, 1,
-0.02915116, -1.504838, -3.504463, 1, 0, 0, 1, 1,
-0.02650736, 1.581532, -2.167222, 0, 0, 0, 1, 1,
-0.01925776, -0.3023167, -2.546201, 0, 0, 0, 1, 1,
-0.01536272, 0.6209652, -1.185786, 0, 0, 0, 1, 1,
-0.01223965, 1.057065, -0.3348745, 0, 0, 0, 1, 1,
-0.01107644, 1.418036, -0.7020829, 0, 0, 0, 1, 1,
-0.01097533, 0.5095562, 0.5139444, 0, 0, 0, 1, 1,
-0.009909892, 1.639088, -0.1858669, 0, 0, 0, 1, 1,
-0.006925608, 2.228298, 1.032882, 1, 1, 1, 1, 1,
-0.00218949, -0.9687419, -3.875434, 1, 1, 1, 1, 1,
0.002567254, 1.163902, 0.5245578, 1, 1, 1, 1, 1,
0.005174031, 0.9021282, -0.5748062, 1, 1, 1, 1, 1,
0.005612157, 0.9376041, 2.349915, 1, 1, 1, 1, 1,
0.007159526, 1.034859, -0.627838, 1, 1, 1, 1, 1,
0.007708898, 0.7781709, -0.7543176, 1, 1, 1, 1, 1,
0.007795019, 0.4407529, -0.4188205, 1, 1, 1, 1, 1,
0.00823342, -0.4302936, 4.411846, 1, 1, 1, 1, 1,
0.00869349, -0.8017355, 4.548873, 1, 1, 1, 1, 1,
0.009765251, -0.3243386, 2.144797, 1, 1, 1, 1, 1,
0.01159848, 0.293648, 0.6115092, 1, 1, 1, 1, 1,
0.01781888, 2.133828, -0.2013102, 1, 1, 1, 1, 1,
0.01889248, -0.2890612, 2.980686, 1, 1, 1, 1, 1,
0.01954792, 0.6162602, -0.5688491, 1, 1, 1, 1, 1,
0.02090102, 0.297542, -0.9320382, 0, 0, 1, 1, 1,
0.02260599, -0.7444233, 2.427069, 1, 0, 0, 1, 1,
0.02481291, 1.047384, -0.6066445, 1, 0, 0, 1, 1,
0.03250053, -0.8650532, 2.770513, 1, 0, 0, 1, 1,
0.03269883, 1.760683, 1.754716, 1, 0, 0, 1, 1,
0.03383957, 0.8813205, -1.164152, 1, 0, 0, 1, 1,
0.03956574, -1.011402, 2.662636, 0, 0, 0, 1, 1,
0.04320271, 0.2114182, -1.655212, 0, 0, 0, 1, 1,
0.04602096, -1.421211, 5.774723, 0, 0, 0, 1, 1,
0.04624253, -2.105357, 1.610286, 0, 0, 0, 1, 1,
0.04654799, 0.6471053, 0.6636803, 0, 0, 0, 1, 1,
0.04802693, -0.411433, 2.367452, 0, 0, 0, 1, 1,
0.05071412, 0.07194895, 0.8345601, 0, 0, 0, 1, 1,
0.05688316, -0.6393463, 3.667314, 1, 1, 1, 1, 1,
0.06030955, -0.4264881, 3.57814, 1, 1, 1, 1, 1,
0.06392577, -0.6622889, 3.827984, 1, 1, 1, 1, 1,
0.06775276, -0.3972792, 0.3722262, 1, 1, 1, 1, 1,
0.06822211, 1.001595, 0.492943, 1, 1, 1, 1, 1,
0.06921792, -1.345593, 2.290373, 1, 1, 1, 1, 1,
0.07011712, -1.632781, 3.139117, 1, 1, 1, 1, 1,
0.07387093, -1.380099, 4.860437, 1, 1, 1, 1, 1,
0.0793962, 0.009449027, 1.124192, 1, 1, 1, 1, 1,
0.08037537, 0.8913863, -0.2923814, 1, 1, 1, 1, 1,
0.08118295, 0.8814589, -0.1399012, 1, 1, 1, 1, 1,
0.08588925, 0.156088, -1.196064, 1, 1, 1, 1, 1,
0.08652243, 0.5805895, -0.9352369, 1, 1, 1, 1, 1,
0.08757864, -0.2034562, 3.63535, 1, 1, 1, 1, 1,
0.08767788, 1.256742, 0.9695004, 1, 1, 1, 1, 1,
0.08963354, 0.1167392, -0.744294, 0, 0, 1, 1, 1,
0.09172287, 0.5427416, -1.150615, 1, 0, 0, 1, 1,
0.09230305, 1.781873, -0.4441939, 1, 0, 0, 1, 1,
0.09265788, 0.2848359, 0.5853376, 1, 0, 0, 1, 1,
0.09514496, 1.344233, -0.04576302, 1, 0, 0, 1, 1,
0.09592087, -1.681221, 2.593971, 1, 0, 0, 1, 1,
0.09912358, -0.3455282, 2.945292, 0, 0, 0, 1, 1,
0.1018772, 0.1719423, 0.02543483, 0, 0, 0, 1, 1,
0.102117, -0.4505785, 0.7349447, 0, 0, 0, 1, 1,
0.1021663, -1.291998, 3.939113, 0, 0, 0, 1, 1,
0.1030214, -0.1607218, 1.596789, 0, 0, 0, 1, 1,
0.1052828, 0.09527922, 0.6412191, 0, 0, 0, 1, 1,
0.1076864, -2.010221, 3.478563, 0, 0, 0, 1, 1,
0.1105857, 1.580681, -0.4386364, 1, 1, 1, 1, 1,
0.1126166, 0.3153035, 0.5479041, 1, 1, 1, 1, 1,
0.1127982, 1.273255, -1.205483, 1, 1, 1, 1, 1,
0.1172203, -0.2522512, 1.140994, 1, 1, 1, 1, 1,
0.1199396, 0.6717196, -0.7982763, 1, 1, 1, 1, 1,
0.1216596, 0.7753302, 1.906328, 1, 1, 1, 1, 1,
0.123026, -0.06125977, 2.949462, 1, 1, 1, 1, 1,
0.1264293, -0.1017673, 3.440172, 1, 1, 1, 1, 1,
0.126983, 0.5461363, 0.09922809, 1, 1, 1, 1, 1,
0.1283005, -0.4423522, 2.313174, 1, 1, 1, 1, 1,
0.1293084, -2.537369, 2.727045, 1, 1, 1, 1, 1,
0.1313374, 0.2505741, -0.1578052, 1, 1, 1, 1, 1,
0.1331912, -0.8244223, 3.807794, 1, 1, 1, 1, 1,
0.1383703, 1.211074, -0.1725751, 1, 1, 1, 1, 1,
0.1398229, 1.424892, 1.090503, 1, 1, 1, 1, 1,
0.1432748, 0.48571, 0.9411706, 0, 0, 1, 1, 1,
0.1477865, 1.004107, 0.1889606, 1, 0, 0, 1, 1,
0.1494751, -0.4306507, 2.83775, 1, 0, 0, 1, 1,
0.1512545, 0.5018212, 1.98578, 1, 0, 0, 1, 1,
0.1550386, -1.905704, 2.456159, 1, 0, 0, 1, 1,
0.1564068, 1.178422, -0.9430062, 1, 0, 0, 1, 1,
0.1643863, 1.86017, 0.9302633, 0, 0, 0, 1, 1,
0.1660207, 1.619261, -2.242672, 0, 0, 0, 1, 1,
0.1660879, -0.8066332, 1.993707, 0, 0, 0, 1, 1,
0.1666005, 0.6659004, 1.622088, 0, 0, 0, 1, 1,
0.1699362, 0.2855221, 0.3029948, 0, 0, 0, 1, 1,
0.1765885, -0.4382648, 2.265828, 0, 0, 0, 1, 1,
0.1777288, -0.2545144, 3.125392, 0, 0, 0, 1, 1,
0.1782706, -0.7353894, 3.60176, 1, 1, 1, 1, 1,
0.1829998, -2.752065, 3.097127, 1, 1, 1, 1, 1,
0.1838298, 0.1829044, 1.878746, 1, 1, 1, 1, 1,
0.1845236, 0.5683019, -0.8571489, 1, 1, 1, 1, 1,
0.1885112, 0.4431585, 1.331811, 1, 1, 1, 1, 1,
0.1909613, -0.8427547, 2.815992, 1, 1, 1, 1, 1,
0.1925224, 0.4079387, -0.07440426, 1, 1, 1, 1, 1,
0.1976241, -0.4951635, 2.375693, 1, 1, 1, 1, 1,
0.2000346, 0.4765866, 0.398159, 1, 1, 1, 1, 1,
0.201498, 2.528224, 0.5912256, 1, 1, 1, 1, 1,
0.2040469, -2.087418, 2.815224, 1, 1, 1, 1, 1,
0.2157375, -0.8161767, 2.201413, 1, 1, 1, 1, 1,
0.2163442, 0.2030177, 1.718623, 1, 1, 1, 1, 1,
0.2199101, 0.3211641, 1.305885, 1, 1, 1, 1, 1,
0.2234605, 0.9699094, -0.2426259, 1, 1, 1, 1, 1,
0.2255749, -0.4824801, 2.864006, 0, 0, 1, 1, 1,
0.2263938, 0.1993107, 1.048013, 1, 0, 0, 1, 1,
0.2264699, 0.6806192, 0.04634954, 1, 0, 0, 1, 1,
0.2276237, -0.2756647, 3.197016, 1, 0, 0, 1, 1,
0.2343622, -0.2874001, 3.397758, 1, 0, 0, 1, 1,
0.2348648, -1.104423, 1.516399, 1, 0, 0, 1, 1,
0.2356969, -0.5571097, 2.870268, 0, 0, 0, 1, 1,
0.2364957, 0.09383292, 2.548024, 0, 0, 0, 1, 1,
0.237763, 1.353662, -0.6068307, 0, 0, 0, 1, 1,
0.237896, -1.523236, 3.121276, 0, 0, 0, 1, 1,
0.2397124, -0.4676381, 2.66558, 0, 0, 0, 1, 1,
0.240307, -0.08657474, 3.617365, 0, 0, 0, 1, 1,
0.2556463, -0.6993112, 5.617926, 0, 0, 0, 1, 1,
0.2556482, -0.4394827, 3.818553, 1, 1, 1, 1, 1,
0.2564605, -0.0960584, 2.010438, 1, 1, 1, 1, 1,
0.2574639, 0.4895273, -0.004808194, 1, 1, 1, 1, 1,
0.2585278, 0.7809879, 0.1076021, 1, 1, 1, 1, 1,
0.2590215, -0.502972, 3.301232, 1, 1, 1, 1, 1,
0.2614657, -1.11534, 4.613077, 1, 1, 1, 1, 1,
0.2665029, 1.312539, 0.5552059, 1, 1, 1, 1, 1,
0.2672822, 0.159503, 2.377608, 1, 1, 1, 1, 1,
0.2691506, -0.9120421, 4.163918, 1, 1, 1, 1, 1,
0.2695785, -0.111106, 2.516417, 1, 1, 1, 1, 1,
0.2698173, -0.05087234, 0.1479982, 1, 1, 1, 1, 1,
0.270222, -1.171419, 2.465958, 1, 1, 1, 1, 1,
0.2723626, 1.327377, 0.1799758, 1, 1, 1, 1, 1,
0.2744166, -0.2294419, 2.198861, 1, 1, 1, 1, 1,
0.279869, 0.574509, 0.08975561, 1, 1, 1, 1, 1,
0.2804094, 0.3937455, 2.313802, 0, 0, 1, 1, 1,
0.281823, -0.04528593, 1.377868, 1, 0, 0, 1, 1,
0.282689, 0.02744691, 1.800146, 1, 0, 0, 1, 1,
0.2830551, 0.4966575, 0.553312, 1, 0, 0, 1, 1,
0.283817, 0.6487516, 0.8065626, 1, 0, 0, 1, 1,
0.2978751, 0.4501259, 0.6151678, 1, 0, 0, 1, 1,
0.3017548, -1.377237, 1.936816, 0, 0, 0, 1, 1,
0.3055953, -1.673798, 4.061999, 0, 0, 0, 1, 1,
0.3115577, 0.6121917, -0.2930564, 0, 0, 0, 1, 1,
0.3155208, 0.3204351, -0.04564265, 0, 0, 0, 1, 1,
0.3206456, -0.03573456, 1.927108, 0, 0, 0, 1, 1,
0.3213922, 0.1737465, 1.048138, 0, 0, 0, 1, 1,
0.324349, -0.05185349, 1.217038, 0, 0, 0, 1, 1,
0.3262407, -1.015043, 4.113843, 1, 1, 1, 1, 1,
0.3287411, 1.057906, -0.2381254, 1, 1, 1, 1, 1,
0.3323956, -1.636847, 4.098135, 1, 1, 1, 1, 1,
0.3324071, 2.934798, 0.8893134, 1, 1, 1, 1, 1,
0.3367553, 1.1255, 0.4715486, 1, 1, 1, 1, 1,
0.3384735, -1.125075, 3.928691, 1, 1, 1, 1, 1,
0.3440531, 0.3845976, 0.2938443, 1, 1, 1, 1, 1,
0.3442217, 1.735601, 0.14707, 1, 1, 1, 1, 1,
0.3442498, -0.364184, 0.77698, 1, 1, 1, 1, 1,
0.3449049, -0.135972, 2.583497, 1, 1, 1, 1, 1,
0.352594, -0.09276053, 2.461938, 1, 1, 1, 1, 1,
0.3546652, -1.094678, 2.842465, 1, 1, 1, 1, 1,
0.3551193, -0.3308925, 1.446029, 1, 1, 1, 1, 1,
0.3640641, -2.053392, 4.784425, 1, 1, 1, 1, 1,
0.3661271, 0.7471917, 1.444994, 1, 1, 1, 1, 1,
0.3716832, -1.41607, 3.122036, 0, 0, 1, 1, 1,
0.3729337, 1.186335, 1.214656, 1, 0, 0, 1, 1,
0.3787105, -0.1374006, 0.5898938, 1, 0, 0, 1, 1,
0.3798577, 0.5367957, 0.07821041, 1, 0, 0, 1, 1,
0.3798774, -1.178123, 2.850967, 1, 0, 0, 1, 1,
0.3820414, 1.050645, 1.31504, 1, 0, 0, 1, 1,
0.3886756, -1.359363, 3.064613, 0, 0, 0, 1, 1,
0.3890604, 0.6982833, 1.44433, 0, 0, 0, 1, 1,
0.3930188, 0.9389634, -0.2399595, 0, 0, 0, 1, 1,
0.3971981, 1.161384, -0.545572, 0, 0, 0, 1, 1,
0.3975725, -0.9730695, 1.679106, 0, 0, 0, 1, 1,
0.3999797, -2.027459, 2.469294, 0, 0, 0, 1, 1,
0.4020149, -0.6123904, 3.697337, 0, 0, 0, 1, 1,
0.4066165, -0.1018611, 0.3135253, 1, 1, 1, 1, 1,
0.4091702, 0.1644968, 0.8045467, 1, 1, 1, 1, 1,
0.4140292, 0.8699896, 1.377455, 1, 1, 1, 1, 1,
0.4145706, -1.049853, 3.158655, 1, 1, 1, 1, 1,
0.4181514, 0.4547886, 0.425111, 1, 1, 1, 1, 1,
0.4185961, -0.2713039, 1.58092, 1, 1, 1, 1, 1,
0.4238925, 0.2676094, 1.36682, 1, 1, 1, 1, 1,
0.430527, -0.3761092, 4.198123, 1, 1, 1, 1, 1,
0.4308037, -1.51462, 4.083101, 1, 1, 1, 1, 1,
0.4324549, -0.7699026, 2.332484, 1, 1, 1, 1, 1,
0.4329199, -0.5071357, 1.537402, 1, 1, 1, 1, 1,
0.4356811, -0.4028218, 2.183201, 1, 1, 1, 1, 1,
0.4408323, 0.3024679, 0.6557273, 1, 1, 1, 1, 1,
0.4409533, 0.1035478, -0.5276317, 1, 1, 1, 1, 1,
0.4477359, 1.184786, -1.920801, 1, 1, 1, 1, 1,
0.448832, -0.09353355, 1.187231, 0, 0, 1, 1, 1,
0.4518004, 1.246309, 1.361645, 1, 0, 0, 1, 1,
0.4530603, -0.0297413, -0.209804, 1, 0, 0, 1, 1,
0.4575662, -0.07096508, 0.7826167, 1, 0, 0, 1, 1,
0.4695526, -0.9253331, 1.216395, 1, 0, 0, 1, 1,
0.4696163, 1.158415, 0.3013372, 1, 0, 0, 1, 1,
0.480371, -0.4192115, 3.779372, 0, 0, 0, 1, 1,
0.480451, 0.2452403, 0.9050838, 0, 0, 0, 1, 1,
0.4816298, 1.772359, 1.1897, 0, 0, 0, 1, 1,
0.4842834, -1.083889, 2.709631, 0, 0, 0, 1, 1,
0.4853502, -0.005140098, 1.508839, 0, 0, 0, 1, 1,
0.4868376, -0.7878622, 1.779149, 0, 0, 0, 1, 1,
0.4917737, 0.01759043, 1.996979, 0, 0, 0, 1, 1,
0.4918, 1.036006, 0.1109224, 1, 1, 1, 1, 1,
0.4961101, 1.213173, 0.7770194, 1, 1, 1, 1, 1,
0.4968863, -0.217572, 2.531855, 1, 1, 1, 1, 1,
0.4981707, -0.1450958, 2.835592, 1, 1, 1, 1, 1,
0.4994729, 0.2254746, 1.125647, 1, 1, 1, 1, 1,
0.4996672, 0.3040782, 0.4568947, 1, 1, 1, 1, 1,
0.5009533, -0.2550221, 2.13535, 1, 1, 1, 1, 1,
0.5016425, 0.5627243, 0.8994847, 1, 1, 1, 1, 1,
0.5041826, 0.3287647, 0.08420067, 1, 1, 1, 1, 1,
0.5079231, 1.209533, -0.1413286, 1, 1, 1, 1, 1,
0.5118288, 0.9312564, 0.0984568, 1, 1, 1, 1, 1,
0.5188274, -2.060119, 2.409508, 1, 1, 1, 1, 1,
0.5188529, -0.7212437, 1.913286, 1, 1, 1, 1, 1,
0.5198231, -0.3710628, 1.794497, 1, 1, 1, 1, 1,
0.5223538, 1.514784, 0.972832, 1, 1, 1, 1, 1,
0.5252795, -0.6849157, 2.668691, 0, 0, 1, 1, 1,
0.5281725, -1.382651, 3.013613, 1, 0, 0, 1, 1,
0.5368772, -1.36076, 2.760017, 1, 0, 0, 1, 1,
0.5371218, -1.264836, 4.698517, 1, 0, 0, 1, 1,
0.5399137, 2.248221, 0.1712021, 1, 0, 0, 1, 1,
0.5406408, -0.7677587, 1.747906, 1, 0, 0, 1, 1,
0.5436334, -0.7347973, 2.038272, 0, 0, 0, 1, 1,
0.5436943, -0.9399252, 2.84214, 0, 0, 0, 1, 1,
0.5538071, 0.6570517, 2.301488, 0, 0, 0, 1, 1,
0.5666013, -0.5880472, 2.296162, 0, 0, 0, 1, 1,
0.5692306, 1.667925, 0.9652038, 0, 0, 0, 1, 1,
0.5712806, -0.5574154, 1.919638, 0, 0, 0, 1, 1,
0.5740944, -0.2704942, 2.974109, 0, 0, 0, 1, 1,
0.5760542, -1.205009, 4.301058, 1, 1, 1, 1, 1,
0.576993, -1.469373, 3.009953, 1, 1, 1, 1, 1,
0.5775445, -0.1112581, 0.9596927, 1, 1, 1, 1, 1,
0.578987, -1.656202, 2.603346, 1, 1, 1, 1, 1,
0.5809957, 0.6342048, 0.01047282, 1, 1, 1, 1, 1,
0.5812017, -0.1789014, 1.797816, 1, 1, 1, 1, 1,
0.5894672, 1.423844, 2.548737, 1, 1, 1, 1, 1,
0.5933222, -0.05038992, 1.245911, 1, 1, 1, 1, 1,
0.6064573, 0.7433329, 1.239929, 1, 1, 1, 1, 1,
0.6100851, -0.0428623, 2.153244, 1, 1, 1, 1, 1,
0.6129102, -0.6404684, 1.822706, 1, 1, 1, 1, 1,
0.6138744, -0.2169177, 1.592709, 1, 1, 1, 1, 1,
0.6166665, -1.363934, 1.545257, 1, 1, 1, 1, 1,
0.6179174, 0.720925, 0.5489229, 1, 1, 1, 1, 1,
0.6227223, 2.57528, 0.7195682, 1, 1, 1, 1, 1,
0.6255043, -1.186988, 2.734113, 0, 0, 1, 1, 1,
0.6299501, 0.05466256, 0.3027816, 1, 0, 0, 1, 1,
0.6320291, 0.06189505, 2.038344, 1, 0, 0, 1, 1,
0.6396967, 0.2445504, 0.7548633, 1, 0, 0, 1, 1,
0.6410019, 1.163085, 2.539875, 1, 0, 0, 1, 1,
0.642974, 0.6418122, 1.380322, 1, 0, 0, 1, 1,
0.6434676, -1.231964, 3.928287, 0, 0, 0, 1, 1,
0.6472289, 1.479105, -0.6749125, 0, 0, 0, 1, 1,
0.6535069, 0.6988366, -0.7080351, 0, 0, 0, 1, 1,
0.6595689, -0.3381272, 1.840889, 0, 0, 0, 1, 1,
0.6619802, 0.1359086, 0.371318, 0, 0, 0, 1, 1,
0.6620163, 0.9975129, -1.599455, 0, 0, 0, 1, 1,
0.6652071, 0.4183084, 0.7835518, 0, 0, 0, 1, 1,
0.6672432, 1.273325, -1.291721, 1, 1, 1, 1, 1,
0.6743373, 0.8753592, -0.4899178, 1, 1, 1, 1, 1,
0.6860213, 0.3258412, 0.9224007, 1, 1, 1, 1, 1,
0.6879506, -2.053446, 2.648994, 1, 1, 1, 1, 1,
0.6909328, -1.350899, 3.55083, 1, 1, 1, 1, 1,
0.692425, 0.1671761, -0.08256108, 1, 1, 1, 1, 1,
0.6949624, 0.3030193, -0.2477429, 1, 1, 1, 1, 1,
0.6965012, 0.5230454, 0.9536999, 1, 1, 1, 1, 1,
0.6972583, -0.4828545, 1.862969, 1, 1, 1, 1, 1,
0.6977255, 0.2639647, 1.431508, 1, 1, 1, 1, 1,
0.6977796, -0.2262226, 1.617005, 1, 1, 1, 1, 1,
0.7059587, 0.3809588, 2.464721, 1, 1, 1, 1, 1,
0.7077687, 0.4923204, 0.4791228, 1, 1, 1, 1, 1,
0.7098737, 0.4559385, -0.2872835, 1, 1, 1, 1, 1,
0.711558, -0.3690496, 2.434491, 1, 1, 1, 1, 1,
0.7115692, -1.462123, 1.943659, 0, 0, 1, 1, 1,
0.7115826, -0.8859761, 4.116323, 1, 0, 0, 1, 1,
0.713818, 1.367658, 0.8380558, 1, 0, 0, 1, 1,
0.7156036, 1.968426, -0.5136557, 1, 0, 0, 1, 1,
0.7185339, -1.777778, 2.786677, 1, 0, 0, 1, 1,
0.7224009, 0.3798345, 1.469779, 1, 0, 0, 1, 1,
0.7230737, -0.6139703, 2.373255, 0, 0, 0, 1, 1,
0.7245925, 1.791445, -2.164071, 0, 0, 0, 1, 1,
0.7277405, 0.5233766, 1.627743, 0, 0, 0, 1, 1,
0.7321205, -1.738474, 3.434226, 0, 0, 0, 1, 1,
0.7352897, 0.5218729, 0.4931253, 0, 0, 0, 1, 1,
0.735395, -0.7322933, 2.627293, 0, 0, 0, 1, 1,
0.7421897, -1.240809, 3.406952, 0, 0, 0, 1, 1,
0.7448582, -0.3850454, -1.075405, 1, 1, 1, 1, 1,
0.7540708, 1.104478, 1.009929, 1, 1, 1, 1, 1,
0.7598419, -0.888799, 3.328962, 1, 1, 1, 1, 1,
0.7646614, 0.3030742, 0.4255268, 1, 1, 1, 1, 1,
0.7646645, 0.6894349, 0.2866229, 1, 1, 1, 1, 1,
0.7675952, 0.3857208, 1.270319, 1, 1, 1, 1, 1,
0.7802298, 1.1357, -0.5033997, 1, 1, 1, 1, 1,
0.7829173, 0.2726136, 1.868291, 1, 1, 1, 1, 1,
0.7840137, -0.71496, 2.965658, 1, 1, 1, 1, 1,
0.7874103, 0.2856019, 3.05836, 1, 1, 1, 1, 1,
0.7972585, 1.905158, 0.6760802, 1, 1, 1, 1, 1,
0.8002471, -1.704542, 2.39232, 1, 1, 1, 1, 1,
0.8010338, -0.7395864, 0.9651479, 1, 1, 1, 1, 1,
0.8015171, -0.238996, 1.222203, 1, 1, 1, 1, 1,
0.8043232, 0.4374823, 2.556887, 1, 1, 1, 1, 1,
0.806389, 0.7451813, 0.1817985, 0, 0, 1, 1, 1,
0.8093438, 1.241078, 1.829135, 1, 0, 0, 1, 1,
0.8106369, 2.106185, 0.8836315, 1, 0, 0, 1, 1,
0.8260853, 0.6083638, 1.004332, 1, 0, 0, 1, 1,
0.8287787, -0.4686051, 2.443054, 1, 0, 0, 1, 1,
0.8292098, -2.123961, 2.981936, 1, 0, 0, 1, 1,
0.8296498, -0.5878876, 3.025656, 0, 0, 0, 1, 1,
0.8308377, -1.835046, 2.10974, 0, 0, 0, 1, 1,
0.8392642, -0.4736145, 1.836686, 0, 0, 0, 1, 1,
0.8424979, -0.1501994, 1.563674, 0, 0, 0, 1, 1,
0.8482766, 0.3802148, 2.124232, 0, 0, 0, 1, 1,
0.8483599, -1.137973, 1.162095, 0, 0, 0, 1, 1,
0.8525338, 1.753542, 1.493012, 0, 0, 0, 1, 1,
0.8611317, -1.148685, 3.582563, 1, 1, 1, 1, 1,
0.86693, -0.955945, 4.363665, 1, 1, 1, 1, 1,
0.8690838, 0.3009512, 2.653318, 1, 1, 1, 1, 1,
0.870146, 0.07656308, 1.953605, 1, 1, 1, 1, 1,
0.8729404, 0.3023273, 1.15256, 1, 1, 1, 1, 1,
0.8753483, -1.01574, 1.356575, 1, 1, 1, 1, 1,
0.8835679, -0.232285, 1.513661, 1, 1, 1, 1, 1,
0.8858376, -0.9115594, -0.5735861, 1, 1, 1, 1, 1,
0.8907243, 0.5977758, 0.9859319, 1, 1, 1, 1, 1,
0.8989926, 0.1698388, 2.500203, 1, 1, 1, 1, 1,
0.9073561, -0.1774113, 1.28963, 1, 1, 1, 1, 1,
0.9074056, -0.7743179, 1.793122, 1, 1, 1, 1, 1,
0.9081774, -0.7349136, 0.7221419, 1, 1, 1, 1, 1,
0.911557, -0.09597398, 3.487709, 1, 1, 1, 1, 1,
0.9247737, 1.204374, 1.152789, 1, 1, 1, 1, 1,
0.9335871, -2.281112, 3.169769, 0, 0, 1, 1, 1,
0.9342723, 0.06189335, 1.069217, 1, 0, 0, 1, 1,
0.9365738, 0.5601695, 1.914546, 1, 0, 0, 1, 1,
0.9435634, 0.5743928, 1.82093, 1, 0, 0, 1, 1,
0.9462619, -0.4764991, 2.656463, 1, 0, 0, 1, 1,
0.9468279, -0.8108637, 1.779235, 1, 0, 0, 1, 1,
0.9495203, 0.9194328, 2.743287, 0, 0, 0, 1, 1,
0.9603471, -1.120253, 2.568338, 0, 0, 0, 1, 1,
0.9604425, -0.3692821, 2.911696, 0, 0, 0, 1, 1,
0.9620929, 0.1229427, 1.380449, 0, 0, 0, 1, 1,
0.9653031, 0.4407092, 0.8789163, 0, 0, 0, 1, 1,
0.9709479, -0.6850133, 1.387793, 0, 0, 0, 1, 1,
0.9768878, 1.013347, -0.1032898, 0, 0, 0, 1, 1,
0.9774419, -0.8324232, 2.352946, 1, 1, 1, 1, 1,
0.9783988, -1.02151, 3.689644, 1, 1, 1, 1, 1,
0.9786444, -0.9710553, 2.528217, 1, 1, 1, 1, 1,
0.9804605, -1.827816, 3.464706, 1, 1, 1, 1, 1,
1.007867, -0.8065543, 3.196418, 1, 1, 1, 1, 1,
1.010808, -0.9147822, 2.814571, 1, 1, 1, 1, 1,
1.0158, 1.483819, 0.5923522, 1, 1, 1, 1, 1,
1.020713, 0.1511586, 1.600086, 1, 1, 1, 1, 1,
1.025014, 0.06751706, 0.6055374, 1, 1, 1, 1, 1,
1.027125, -0.1685576, 0.8523741, 1, 1, 1, 1, 1,
1.032631, 1.775118, 0.6303024, 1, 1, 1, 1, 1,
1.037072, 1.00178, 1.196974, 1, 1, 1, 1, 1,
1.039005, -0.6420119, 4.232446, 1, 1, 1, 1, 1,
1.042335, 0.7961928, 0.3576094, 1, 1, 1, 1, 1,
1.048005, -0.9513497, 3.55317, 1, 1, 1, 1, 1,
1.054349, -0.8269914, 1.058809, 0, 0, 1, 1, 1,
1.057271, -0.3121373, 0.9622401, 1, 0, 0, 1, 1,
1.060612, 1.263201, 1.532621, 1, 0, 0, 1, 1,
1.061896, -0.3731178, 2.953395, 1, 0, 0, 1, 1,
1.063652, -0.8561528, 2.848518, 1, 0, 0, 1, 1,
1.071288, -0.03527389, 1.439325, 1, 0, 0, 1, 1,
1.071524, -0.4098013, 2.921871, 0, 0, 0, 1, 1,
1.075287, -1.406643, 2.663613, 0, 0, 0, 1, 1,
1.085279, -0.269484, 3.914711, 0, 0, 0, 1, 1,
1.089155, 0.6692775, 3.545705, 0, 0, 0, 1, 1,
1.093414, 2.494006, 0.4866069, 0, 0, 0, 1, 1,
1.100047, 1.621275, 0.1781754, 0, 0, 0, 1, 1,
1.101086, -0.1121411, 0.8771789, 0, 0, 0, 1, 1,
1.106515, 1.120606, -0.5169647, 1, 1, 1, 1, 1,
1.108168, -1.635511, 2.731246, 1, 1, 1, 1, 1,
1.110229, -0.2462975, 0.9910509, 1, 1, 1, 1, 1,
1.122369, 0.8485737, 0.3020812, 1, 1, 1, 1, 1,
1.124027, 0.2343644, 2.210814, 1, 1, 1, 1, 1,
1.127924, 0.3934074, 1.62226, 1, 1, 1, 1, 1,
1.131119, 0.09239626, 0.6753699, 1, 1, 1, 1, 1,
1.137982, -0.02049392, 1.71426, 1, 1, 1, 1, 1,
1.141042, 0.722921, 1.360981, 1, 1, 1, 1, 1,
1.152609, -0.6251172, 1.654894, 1, 1, 1, 1, 1,
1.155143, -0.07102446, 0.3744007, 1, 1, 1, 1, 1,
1.160504, -1.110278, 1.736787, 1, 1, 1, 1, 1,
1.167756, -0.2147272, 2.213448, 1, 1, 1, 1, 1,
1.169659, 0.3824544, -1.178338, 1, 1, 1, 1, 1,
1.173464, -0.608059, 2.01581, 1, 1, 1, 1, 1,
1.176872, -0.856023, 3.594558, 0, 0, 1, 1, 1,
1.183262, 0.1956659, 3.08789, 1, 0, 0, 1, 1,
1.190343, -0.6896506, 2.210092, 1, 0, 0, 1, 1,
1.190868, 0.8290066, 1.350404, 1, 0, 0, 1, 1,
1.196674, -1.381617, 1.942732, 1, 0, 0, 1, 1,
1.205482, -0.6652846, 3.129218, 1, 0, 0, 1, 1,
1.211185, 0.6388683, -0.008754953, 0, 0, 0, 1, 1,
1.218958, -1.554477, 1.901525, 0, 0, 0, 1, 1,
1.223436, -0.6659942, 3.987823, 0, 0, 0, 1, 1,
1.223534, 0.03658255, 1.061113, 0, 0, 0, 1, 1,
1.230307, 0.9181845, 1.510781, 0, 0, 0, 1, 1,
1.235744, -0.3861061, 2.625171, 0, 0, 0, 1, 1,
1.243087, 0.2574596, 1.030168, 0, 0, 0, 1, 1,
1.24399, 0.8552399, 0.9337637, 1, 1, 1, 1, 1,
1.250552, -0.3578413, 3.027672, 1, 1, 1, 1, 1,
1.258063, -0.4708298, 1.433206, 1, 1, 1, 1, 1,
1.258817, -0.5536337, 1.161893, 1, 1, 1, 1, 1,
1.259434, -0.0108861, 2.024323, 1, 1, 1, 1, 1,
1.264107, -0.5611853, 1.625977, 1, 1, 1, 1, 1,
1.277791, -0.7651969, 1.677488, 1, 1, 1, 1, 1,
1.285226, -1.082844, 1.094426, 1, 1, 1, 1, 1,
1.287479, -1.39211, 3.104077, 1, 1, 1, 1, 1,
1.304569, -0.04782777, 1.624213, 1, 1, 1, 1, 1,
1.305354, 2.820153, 0.6198213, 1, 1, 1, 1, 1,
1.30708, -0.3903116, 0.5471208, 1, 1, 1, 1, 1,
1.307397, 0.4988167, 0.5940293, 1, 1, 1, 1, 1,
1.308057, 0.5709461, 1.214154, 1, 1, 1, 1, 1,
1.32651, -2.64067, 3.209252, 1, 1, 1, 1, 1,
1.328305, 0.1892982, 1.823042, 0, 0, 1, 1, 1,
1.333615, -0.4726828, 0.9497958, 1, 0, 0, 1, 1,
1.376722, -0.1034775, 1.567829, 1, 0, 0, 1, 1,
1.376927, 0.02934997, 0.694174, 1, 0, 0, 1, 1,
1.377625, -1.060583, 2.378611, 1, 0, 0, 1, 1,
1.384932, -1.074412, 0.6885445, 1, 0, 0, 1, 1,
1.385313, 0.3404469, 2.145871, 0, 0, 0, 1, 1,
1.387027, 1.371814, -0.7351719, 0, 0, 0, 1, 1,
1.418087, 0.906749, 0.3942417, 0, 0, 0, 1, 1,
1.467375, 0.7131425, 0.6017104, 0, 0, 0, 1, 1,
1.483487, -1.148998, 3.112797, 0, 0, 0, 1, 1,
1.506846, 0.2037299, 0.6455539, 0, 0, 0, 1, 1,
1.512492, -0.7473156, 1.235435, 0, 0, 0, 1, 1,
1.523043, 0.5587215, 0.5788781, 1, 1, 1, 1, 1,
1.525801, -0.3801533, 1.16092, 1, 1, 1, 1, 1,
1.540806, 1.638583, -0.2823728, 1, 1, 1, 1, 1,
1.552102, -0.1847297, 2.57373, 1, 1, 1, 1, 1,
1.55663, -0.2384572, 2.690156, 1, 1, 1, 1, 1,
1.561682, 0.9354525, 0.7607005, 1, 1, 1, 1, 1,
1.581321, 0.8186908, 0.3414962, 1, 1, 1, 1, 1,
1.587428, -0.9875688, 1.696912, 1, 1, 1, 1, 1,
1.651448, -0.7534356, 2.307103, 1, 1, 1, 1, 1,
1.662918, -1.042459, 0.5403336, 1, 1, 1, 1, 1,
1.665223, -0.8562394, 2.876221, 1, 1, 1, 1, 1,
1.668147, -0.2373268, 1.971787, 1, 1, 1, 1, 1,
1.702308, -1.643673, 2.457759, 1, 1, 1, 1, 1,
1.703228, -0.09195549, 1.386378, 1, 1, 1, 1, 1,
1.721417, -0.05799046, 1.503309, 1, 1, 1, 1, 1,
1.739306, -0.1890601, 2.927185, 0, 0, 1, 1, 1,
1.760518, -0.3845753, 1.781779, 1, 0, 0, 1, 1,
1.765979, -1.42868, 1.843114, 1, 0, 0, 1, 1,
1.77461, -0.9775295, 1.941501, 1, 0, 0, 1, 1,
1.789448, -0.8308837, 2.232822, 1, 0, 0, 1, 1,
1.790008, -0.4835895, 2.397673, 1, 0, 0, 1, 1,
1.854621, -0.1285808, 2.056542, 0, 0, 0, 1, 1,
1.857146, 3.601195, 1.396438, 0, 0, 0, 1, 1,
1.879914, -1.731286, 3.115285, 0, 0, 0, 1, 1,
1.888062, -1.164899, 2.250538, 0, 0, 0, 1, 1,
1.888807, -0.7537804, 1.41034, 0, 0, 0, 1, 1,
1.889418, -0.5189652, 1.151194, 0, 0, 0, 1, 1,
1.906046, 1.101698, -0.1450236, 0, 0, 0, 1, 1,
1.92319, 1.248717, 1.376868, 1, 1, 1, 1, 1,
1.937901, -0.02968365, -0.3275985, 1, 1, 1, 1, 1,
1.949945, -0.6956734, 0.8147958, 1, 1, 1, 1, 1,
1.961678, -0.005441882, -0.5465665, 1, 1, 1, 1, 1,
1.987473, -0.4981931, 0.4584044, 1, 1, 1, 1, 1,
1.998283, 0.2241593, 1.782244, 1, 1, 1, 1, 1,
2.017693, 0.8812013, 2.022033, 1, 1, 1, 1, 1,
2.05159, 0.5342054, 0.8582783, 1, 1, 1, 1, 1,
2.057044, -0.2833994, 1.824419, 1, 1, 1, 1, 1,
2.08325, -0.08540231, 3.79465, 1, 1, 1, 1, 1,
2.105708, -0.5046239, 3.314007, 1, 1, 1, 1, 1,
2.105777, -0.1190195, 1.152208, 1, 1, 1, 1, 1,
2.12274, -0.3576083, 3.407135, 1, 1, 1, 1, 1,
2.15301, 0.03056429, 2.556522, 1, 1, 1, 1, 1,
2.158803, 0.2964712, 1.356025, 1, 1, 1, 1, 1,
2.196866, -1.252324, 4.39707, 0, 0, 1, 1, 1,
2.20355, -0.9610427, 0.6523549, 1, 0, 0, 1, 1,
2.205, 0.3525242, 2.059204, 1, 0, 0, 1, 1,
2.218038, 0.998127, 2.393446, 1, 0, 0, 1, 1,
2.260008, 0.8066105, 1.019491, 1, 0, 0, 1, 1,
2.276494, 3.093293, 1.151692, 1, 0, 0, 1, 1,
2.292063, 0.675887, 1.364641, 0, 0, 0, 1, 1,
2.333718, 1.230313, 3.678503, 0, 0, 0, 1, 1,
2.370481, 0.12811, 2.158952, 0, 0, 0, 1, 1,
2.373721, 0.7334017, 1.03721, 0, 0, 0, 1, 1,
2.466142, -1.24829, 2.118756, 0, 0, 0, 1, 1,
2.516023, -1.890218, 2.615572, 0, 0, 0, 1, 1,
2.622137, -1.231826, 2.369372, 0, 0, 0, 1, 1,
2.631143, 1.574963, 1.438731, 1, 1, 1, 1, 1,
2.795216, -1.133823, 1.706961, 1, 1, 1, 1, 1,
2.939374, -1.856207, 0.9807982, 1, 1, 1, 1, 1,
2.959772, 0.8161984, 2.291047, 1, 1, 1, 1, 1,
3.053703, -0.8950152, 1.258082, 1, 1, 1, 1, 1,
3.116373, 0.1464232, 1.967944, 1, 1, 1, 1, 1,
3.302798, -0.1265498, 0.8264419, 1, 1, 1, 1, 1
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
var radius = 9.904426;
var distance = 34.78888;
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
mvMatrix.translate( -0.1575234, -0.4245652, 0.0403266 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.78888);
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
