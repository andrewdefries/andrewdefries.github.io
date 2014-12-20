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
-2.931255, -0.008102553, -0.830435, 1, 0, 0, 1,
-2.836374, 0.7264293, -2.16847, 1, 0.007843138, 0, 1,
-2.707102, -0.2191612, -0.5104865, 1, 0.01176471, 0, 1,
-2.680659, 0.1778467, -0.39448, 1, 0.01960784, 0, 1,
-2.655477, -0.4674278, -2.436845, 1, 0.02352941, 0, 1,
-2.545692, -0.4751668, -2.757166, 1, 0.03137255, 0, 1,
-2.544252, -0.2838275, -2.849024, 1, 0.03529412, 0, 1,
-2.466966, -0.9788974, -1.060529, 1, 0.04313726, 0, 1,
-2.40331, 1.400251, -2.440465, 1, 0.04705882, 0, 1,
-2.364367, -0.8686481, -0.6032185, 1, 0.05490196, 0, 1,
-2.272287, 0.06191741, -0.6880372, 1, 0.05882353, 0, 1,
-2.246611, 1.613308, -1.57979, 1, 0.06666667, 0, 1,
-2.194061, 0.8751585, 0.2347941, 1, 0.07058824, 0, 1,
-2.183453, 0.4093666, -2.905168, 1, 0.07843138, 0, 1,
-2.170157, -0.2022317, -2.07476, 1, 0.08235294, 0, 1,
-2.166314, 0.801555, 0.05126158, 1, 0.09019608, 0, 1,
-2.156432, -0.03878778, -0.6120188, 1, 0.09411765, 0, 1,
-2.146675, -0.5600127, -2.494562, 1, 0.1019608, 0, 1,
-2.119312, 0.5218938, -2.408159, 1, 0.1098039, 0, 1,
-2.116186, 0.5574526, -0.3617078, 1, 0.1137255, 0, 1,
-2.093186, 2.242134, -1.93747, 1, 0.1215686, 0, 1,
-2.063057, -1.56376, -2.608929, 1, 0.1254902, 0, 1,
-2.050108, -1.172805, -3.2208, 1, 0.1333333, 0, 1,
-1.975161, -1.370155, -2.466902, 1, 0.1372549, 0, 1,
-1.938648, -0.259528, -1.330335, 1, 0.145098, 0, 1,
-1.925839, 1.190083, 0.2543931, 1, 0.1490196, 0, 1,
-1.918953, -1.14443, -2.678299, 1, 0.1568628, 0, 1,
-1.903432, -0.2565348, -2.349722, 1, 0.1607843, 0, 1,
-1.887849, 0.02353651, -2.693624, 1, 0.1686275, 0, 1,
-1.87833, -0.5534709, -0.4435391, 1, 0.172549, 0, 1,
-1.862737, 0.3411809, -0.6226021, 1, 0.1803922, 0, 1,
-1.850074, 0.4044587, -2.98474, 1, 0.1843137, 0, 1,
-1.845846, 0.3774609, 0.5903281, 1, 0.1921569, 0, 1,
-1.827074, 0.2245313, -2.005294, 1, 0.1960784, 0, 1,
-1.815463, 0.665267, -2.635106, 1, 0.2039216, 0, 1,
-1.804969, 0.7366052, -1.231236, 1, 0.2117647, 0, 1,
-1.803575, 0.09738459, -2.110715, 1, 0.2156863, 0, 1,
-1.802707, -0.3359818, -0.5471479, 1, 0.2235294, 0, 1,
-1.794696, -0.05986542, -2.452037, 1, 0.227451, 0, 1,
-1.785065, -0.0006671475, -1.500301, 1, 0.2352941, 0, 1,
-1.732723, 1.278849, -2.791374, 1, 0.2392157, 0, 1,
-1.730056, -1.011015, -2.880442, 1, 0.2470588, 0, 1,
-1.727434, -0.8408671, -4.709432, 1, 0.2509804, 0, 1,
-1.708824, -0.8452822, -1.009354, 1, 0.2588235, 0, 1,
-1.708233, 0.3519543, -0.6235167, 1, 0.2627451, 0, 1,
-1.698285, -0.3090986, -1.054421, 1, 0.2705882, 0, 1,
-1.694735, -0.5915018, -1.793236, 1, 0.2745098, 0, 1,
-1.687919, 0.4757782, -4.121702, 1, 0.282353, 0, 1,
-1.65679, 0.2700612, -2.201059, 1, 0.2862745, 0, 1,
-1.644501, 0.3706633, -0.5823773, 1, 0.2941177, 0, 1,
-1.635753, 1.192452, 0.1330976, 1, 0.3019608, 0, 1,
-1.633939, 0.3317631, -2.616198, 1, 0.3058824, 0, 1,
-1.63281, -0.1152405, -0.9973842, 1, 0.3137255, 0, 1,
-1.62592, -0.2309173, -1.868326, 1, 0.3176471, 0, 1,
-1.622138, 0.2131554, -1.555644, 1, 0.3254902, 0, 1,
-1.617938, 2.226161, -1.225706, 1, 0.3294118, 0, 1,
-1.616044, -1.270085, -2.174994, 1, 0.3372549, 0, 1,
-1.605346, -0.2857826, -1.649125, 1, 0.3411765, 0, 1,
-1.594239, 1.094944, 0.6449078, 1, 0.3490196, 0, 1,
-1.590659, -1.213324, -3.587682, 1, 0.3529412, 0, 1,
-1.569292, 0.2385708, -0.8250448, 1, 0.3607843, 0, 1,
-1.549053, 0.5295765, -2.296055, 1, 0.3647059, 0, 1,
-1.528431, -1.713796, -2.56269, 1, 0.372549, 0, 1,
-1.527634, 0.2901303, -2.612101, 1, 0.3764706, 0, 1,
-1.513491, 1.984723, 0.2605434, 1, 0.3843137, 0, 1,
-1.508446, 0.09789107, -0.8834222, 1, 0.3882353, 0, 1,
-1.493842, -0.8003449, -1.990629, 1, 0.3960784, 0, 1,
-1.482311, 0.7183123, -1.262087, 1, 0.4039216, 0, 1,
-1.48191, 0.293913, -1.581164, 1, 0.4078431, 0, 1,
-1.454027, 0.3904436, 0.0833844, 1, 0.4156863, 0, 1,
-1.452346, 0.06452789, -1.865773, 1, 0.4196078, 0, 1,
-1.440623, 1.616205, -0.6977534, 1, 0.427451, 0, 1,
-1.430131, -0.8893965, -2.818826, 1, 0.4313726, 0, 1,
-1.425927, -0.02768333, -3.614253, 1, 0.4392157, 0, 1,
-1.425261, 0.1299097, 0.2397835, 1, 0.4431373, 0, 1,
-1.422368, -0.7962774, -2.572774, 1, 0.4509804, 0, 1,
-1.420042, 0.8367568, 0.9935836, 1, 0.454902, 0, 1,
-1.418577, 0.2265721, -0.7961597, 1, 0.4627451, 0, 1,
-1.41848, -2.082909, -2.084751, 1, 0.4666667, 0, 1,
-1.402844, 1.058699, 0.6894941, 1, 0.4745098, 0, 1,
-1.399654, 0.7314223, -2.085382, 1, 0.4784314, 0, 1,
-1.395772, -1.010649, -1.620568, 1, 0.4862745, 0, 1,
-1.394064, 0.03914316, -0.2622465, 1, 0.4901961, 0, 1,
-1.393048, 0.492305, -0.4172932, 1, 0.4980392, 0, 1,
-1.38911, 0.2642909, -2.378656, 1, 0.5058824, 0, 1,
-1.363127, 1.602787, -1.517137, 1, 0.509804, 0, 1,
-1.357615, 0.1399139, -2.168254, 1, 0.5176471, 0, 1,
-1.347459, 0.2200339, -1.344246, 1, 0.5215687, 0, 1,
-1.329396, -1.704773, -2.251598, 1, 0.5294118, 0, 1,
-1.326443, 1.383759, 0.07544357, 1, 0.5333334, 0, 1,
-1.326276, -0.3431286, -2.534772, 1, 0.5411765, 0, 1,
-1.324025, -1.612748, -1.941061, 1, 0.5450981, 0, 1,
-1.313064, -0.669009, -2.593358, 1, 0.5529412, 0, 1,
-1.310051, -0.8665686, -3.62491, 1, 0.5568628, 0, 1,
-1.303892, -0.7128845, -2.554002, 1, 0.5647059, 0, 1,
-1.301028, -0.5900832, -0.9757265, 1, 0.5686275, 0, 1,
-1.297111, -0.5009981, -3.130251, 1, 0.5764706, 0, 1,
-1.296474, -1.282008, -1.814082, 1, 0.5803922, 0, 1,
-1.292274, 2.485362, 0.5255687, 1, 0.5882353, 0, 1,
-1.286258, -0.5423409, -1.211854, 1, 0.5921569, 0, 1,
-1.284557, 2.077316, 0.9943189, 1, 0.6, 0, 1,
-1.279965, 0.5652305, -2.106566, 1, 0.6078432, 0, 1,
-1.263471, 0.5417499, -1.305308, 1, 0.6117647, 0, 1,
-1.252552, -1.249957, -2.328638, 1, 0.6196079, 0, 1,
-1.23999, 0.133751, -1.831402, 1, 0.6235294, 0, 1,
-1.239803, 0.006538151, -0.1777598, 1, 0.6313726, 0, 1,
-1.236564, -1.336527, -2.016128, 1, 0.6352941, 0, 1,
-1.234937, -0.7250777, -1.670732, 1, 0.6431373, 0, 1,
-1.228175, 0.8561438, -0.8183131, 1, 0.6470588, 0, 1,
-1.221097, 0.6328602, -1.203466, 1, 0.654902, 0, 1,
-1.218629, 2.147869, -0.9812075, 1, 0.6588235, 0, 1,
-1.205548, -1.042139, -1.96727, 1, 0.6666667, 0, 1,
-1.198715, -0.2991216, -0.6469939, 1, 0.6705883, 0, 1,
-1.196271, 0.15232, -0.9330007, 1, 0.6784314, 0, 1,
-1.194594, -1.580034, -3.233219, 1, 0.682353, 0, 1,
-1.194436, 0.07363979, -0.475612, 1, 0.6901961, 0, 1,
-1.192716, 1.488727, -0.08557196, 1, 0.6941177, 0, 1,
-1.192529, 1.458013, -0.9896583, 1, 0.7019608, 0, 1,
-1.189343, -0.1659163, -2.256662, 1, 0.7098039, 0, 1,
-1.180452, 0.03980063, -0.1793318, 1, 0.7137255, 0, 1,
-1.170949, -0.8903257, -2.991694, 1, 0.7215686, 0, 1,
-1.166409, -0.4035663, -1.265768, 1, 0.7254902, 0, 1,
-1.160606, -0.3629087, -0.9337654, 1, 0.7333333, 0, 1,
-1.152841, 1.973167, -1.517073, 1, 0.7372549, 0, 1,
-1.152338, 0.1738156, -0.3484671, 1, 0.7450981, 0, 1,
-1.152272, -0.1224068, -0.4964824, 1, 0.7490196, 0, 1,
-1.150738, -0.8251228, -1.435409, 1, 0.7568628, 0, 1,
-1.14928, -1.153999, -0.9641246, 1, 0.7607843, 0, 1,
-1.138501, 0.09659586, -0.4219879, 1, 0.7686275, 0, 1,
-1.132887, 0.4090126, -0.4332545, 1, 0.772549, 0, 1,
-1.128933, 1.004553, -0.4809021, 1, 0.7803922, 0, 1,
-1.126392, -1.568855, -1.731915, 1, 0.7843137, 0, 1,
-1.125089, 0.09748746, -1.873458, 1, 0.7921569, 0, 1,
-1.123038, 0.7187092, 0.05198871, 1, 0.7960784, 0, 1,
-1.113345, 2.062353, -0.706883, 1, 0.8039216, 0, 1,
-1.11163, 0.5787932, -0.9090676, 1, 0.8117647, 0, 1,
-1.110112, 0.588821, -0.6424935, 1, 0.8156863, 0, 1,
-1.108104, -1.575879, -2.789144, 1, 0.8235294, 0, 1,
-1.100738, 0.3413615, -1.786377, 1, 0.827451, 0, 1,
-1.097918, 1.060649, -0.2726748, 1, 0.8352941, 0, 1,
-1.09493, 1.293335, -0.9356029, 1, 0.8392157, 0, 1,
-1.086683, -0.84072, -2.603303, 1, 0.8470588, 0, 1,
-1.085933, -0.4458841, -1.096944, 1, 0.8509804, 0, 1,
-1.080132, -0.8452206, -3.571961, 1, 0.8588235, 0, 1,
-1.078256, 0.5026559, -1.538402, 1, 0.8627451, 0, 1,
-1.075348, 1.545572, -0.5208765, 1, 0.8705882, 0, 1,
-1.075335, -0.256065, -2.84549, 1, 0.8745098, 0, 1,
-1.062732, -0.06588498, -1.348953, 1, 0.8823529, 0, 1,
-1.060212, 1.409607, -1.655378, 1, 0.8862745, 0, 1,
-1.056584, 0.7378943, -1.779407, 1, 0.8941177, 0, 1,
-1.036506, -0.3325572, -1.620188, 1, 0.8980392, 0, 1,
-1.034486, -0.1274554, -1.351514, 1, 0.9058824, 0, 1,
-1.034418, -0.8330563, -3.001399, 1, 0.9137255, 0, 1,
-1.033557, 1.22156, -2.124989, 1, 0.9176471, 0, 1,
-1.030835, 0.8488274, -1.034437, 1, 0.9254902, 0, 1,
-1.028264, -0.2384966, -0.3760186, 1, 0.9294118, 0, 1,
-1.024828, -0.370071, -2.929147, 1, 0.9372549, 0, 1,
-1.023604, 0.1101832, -0.9993278, 1, 0.9411765, 0, 1,
-1.023289, 0.7715601, -1.566928, 1, 0.9490196, 0, 1,
-1.017621, 1.603276, -0.5137335, 1, 0.9529412, 0, 1,
-1.015967, 0.03616858, -0.8896548, 1, 0.9607843, 0, 1,
-1.007637, -1.109374, -2.534511, 1, 0.9647059, 0, 1,
-1.007472, 1.898319, -1.323965, 1, 0.972549, 0, 1,
-1.00503, -1.363349, -2.720178, 1, 0.9764706, 0, 1,
-0.9915599, -0.1631658, -2.153658, 1, 0.9843137, 0, 1,
-0.9891636, 0.5539743, -0.9027146, 1, 0.9882353, 0, 1,
-0.9868123, 0.6711583, -1.55756, 1, 0.9960784, 0, 1,
-0.9817231, -1.449239, -3.158931, 0.9960784, 1, 0, 1,
-0.977421, 0.4544005, -1.554678, 0.9921569, 1, 0, 1,
-0.9699525, -1.398811, -3.130922, 0.9843137, 1, 0, 1,
-0.9613864, -0.02701572, -1.473695, 0.9803922, 1, 0, 1,
-0.955196, 1.091663, -0.1081999, 0.972549, 1, 0, 1,
-0.943857, -0.8174093, -0.8044077, 0.9686275, 1, 0, 1,
-0.9424043, -1.090776, -3.313033, 0.9607843, 1, 0, 1,
-0.9402286, 1.089364, 0.9949215, 0.9568627, 1, 0, 1,
-0.9387485, 2.887581, 0.9098133, 0.9490196, 1, 0, 1,
-0.9387011, 0.1172311, -2.15826, 0.945098, 1, 0, 1,
-0.9360077, -0.2166597, -1.284907, 0.9372549, 1, 0, 1,
-0.9306443, 2.127966, -0.9117113, 0.9333333, 1, 0, 1,
-0.921979, -0.9492206, -2.881341, 0.9254902, 1, 0, 1,
-0.9093026, 0.2016197, -0.2224566, 0.9215686, 1, 0, 1,
-0.9054937, -0.05803421, -1.779495, 0.9137255, 1, 0, 1,
-0.9050368, 0.1324043, -1.019332, 0.9098039, 1, 0, 1,
-0.903379, -0.6307164, -3.011856, 0.9019608, 1, 0, 1,
-0.9033465, -0.1359853, 0.1428498, 0.8941177, 1, 0, 1,
-0.9023002, -1.485026, -3.697957, 0.8901961, 1, 0, 1,
-0.8976399, 0.9656691, -2.443158, 0.8823529, 1, 0, 1,
-0.8905181, 0.03896407, -1.231151, 0.8784314, 1, 0, 1,
-0.8894994, 0.7231967, -0.820324, 0.8705882, 1, 0, 1,
-0.8887634, -0.4626657, -2.523168, 0.8666667, 1, 0, 1,
-0.8882965, -0.8886952, -0.8075308, 0.8588235, 1, 0, 1,
-0.8859993, 0.8579322, 0.5409125, 0.854902, 1, 0, 1,
-0.8854904, 1.519551, -1.18961, 0.8470588, 1, 0, 1,
-0.8825987, -1.077813, -2.013102, 0.8431373, 1, 0, 1,
-0.8807952, 1.718014, 0.2604223, 0.8352941, 1, 0, 1,
-0.8773883, 0.5043558, -2.887555, 0.8313726, 1, 0, 1,
-0.876377, -0.374757, -3.016932, 0.8235294, 1, 0, 1,
-0.8740803, -0.3457973, -3.123121, 0.8196079, 1, 0, 1,
-0.8726239, -0.1868152, -2.152907, 0.8117647, 1, 0, 1,
-0.8713947, 0.2832622, -1.97695, 0.8078431, 1, 0, 1,
-0.8627145, -0.175134, -1.056351, 0.8, 1, 0, 1,
-0.8589125, 0.9611854, -1.49756, 0.7921569, 1, 0, 1,
-0.8463425, 1.404695, 0.8028982, 0.7882353, 1, 0, 1,
-0.8386232, -0.7667864, -2.382027, 0.7803922, 1, 0, 1,
-0.8360992, 1.099108, 0.3380024, 0.7764706, 1, 0, 1,
-0.8332084, -0.5644016, -1.665824, 0.7686275, 1, 0, 1,
-0.8300642, 1.501499, -1.304828, 0.7647059, 1, 0, 1,
-0.8294142, -0.08421429, -1.678592, 0.7568628, 1, 0, 1,
-0.8287733, -0.6446183, -0.1074624, 0.7529412, 1, 0, 1,
-0.8238117, 1.156843, -0.403117, 0.7450981, 1, 0, 1,
-0.8214036, -0.1908645, -1.902147, 0.7411765, 1, 0, 1,
-0.8137078, 0.4310118, -1.102261, 0.7333333, 1, 0, 1,
-0.8136207, -0.2688121, -1.639369, 0.7294118, 1, 0, 1,
-0.8121232, -2.163472, -2.279618, 0.7215686, 1, 0, 1,
-0.8013266, -0.2154283, -1.169117, 0.7176471, 1, 0, 1,
-0.7971205, -0.7863501, -3.7423, 0.7098039, 1, 0, 1,
-0.796168, -1.174646, -1.659289, 0.7058824, 1, 0, 1,
-0.7959761, 1.692119, -0.03291231, 0.6980392, 1, 0, 1,
-0.7953633, 0.4648842, -0.6035416, 0.6901961, 1, 0, 1,
-0.7947237, -0.1037664, -1.678131, 0.6862745, 1, 0, 1,
-0.7945408, -0.8481858, -2.648648, 0.6784314, 1, 0, 1,
-0.7912959, 0.6684585, -3.378279, 0.6745098, 1, 0, 1,
-0.7886149, 1.50261, -1.410468, 0.6666667, 1, 0, 1,
-0.7850501, -0.7305931, -2.12222, 0.6627451, 1, 0, 1,
-0.7784104, 0.9294035, -0.4876651, 0.654902, 1, 0, 1,
-0.7760472, 0.1175827, 0.2403031, 0.6509804, 1, 0, 1,
-0.7716821, 0.2511139, -1.373888, 0.6431373, 1, 0, 1,
-0.7695535, -2.28084, -2.309469, 0.6392157, 1, 0, 1,
-0.7680271, 0.7448111, -1.440579, 0.6313726, 1, 0, 1,
-0.7662099, -0.03633361, -3.219182, 0.627451, 1, 0, 1,
-0.7637718, -0.3639477, -0.711737, 0.6196079, 1, 0, 1,
-0.7604113, -1.790623, -2.745602, 0.6156863, 1, 0, 1,
-0.7597776, -0.5956778, -1.511043, 0.6078432, 1, 0, 1,
-0.7547368, 1.368888, -0.2154003, 0.6039216, 1, 0, 1,
-0.7545656, -2.10396, -4.508747, 0.5960785, 1, 0, 1,
-0.7541605, -0.5964435, -0.6200017, 0.5882353, 1, 0, 1,
-0.7482374, 1.237386, -0.1113336, 0.5843138, 1, 0, 1,
-0.7475405, -0.06756724, -4.847351, 0.5764706, 1, 0, 1,
-0.7370146, -0.6751494, -3.196681, 0.572549, 1, 0, 1,
-0.7316523, 0.7496653, -3.098171, 0.5647059, 1, 0, 1,
-0.7302374, 0.378561, -2.363025, 0.5607843, 1, 0, 1,
-0.7299944, -0.8016317, -0.9941519, 0.5529412, 1, 0, 1,
-0.7284452, 1.238044, -0.6558396, 0.5490196, 1, 0, 1,
-0.723448, 0.3660947, -2.506906, 0.5411765, 1, 0, 1,
-0.7191314, 0.5042826, -1.629267, 0.5372549, 1, 0, 1,
-0.7179359, 1.205429, -1.571946, 0.5294118, 1, 0, 1,
-0.7166174, 0.3542149, -1.907922, 0.5254902, 1, 0, 1,
-0.7114162, 0.5981188, 2.073834, 0.5176471, 1, 0, 1,
-0.7093355, 0.2197162, -2.465161, 0.5137255, 1, 0, 1,
-0.7069387, -0.1914197, -2.405838, 0.5058824, 1, 0, 1,
-0.7022999, 1.652431, -1.307223, 0.5019608, 1, 0, 1,
-0.6990066, -0.167445, 0.6076456, 0.4941176, 1, 0, 1,
-0.6981764, 0.0654059, -2.541892, 0.4862745, 1, 0, 1,
-0.692426, -0.2696866, -1.94139, 0.4823529, 1, 0, 1,
-0.688641, -0.8725253, -1.642737, 0.4745098, 1, 0, 1,
-0.6877987, -0.9572458, -2.560006, 0.4705882, 1, 0, 1,
-0.6877653, 1.097402, -0.03684411, 0.4627451, 1, 0, 1,
-0.685688, 0.0871821, -1.977817, 0.4588235, 1, 0, 1,
-0.6850703, 1.107742, -3.622059, 0.4509804, 1, 0, 1,
-0.6739355, -0.3318219, -2.981948, 0.4470588, 1, 0, 1,
-0.6736056, 0.5474557, -1.905444, 0.4392157, 1, 0, 1,
-0.671838, -1.310006, -2.259414, 0.4352941, 1, 0, 1,
-0.6699933, -0.140364, -1.113214, 0.427451, 1, 0, 1,
-0.6677748, -0.03648656, -1.545212, 0.4235294, 1, 0, 1,
-0.6676922, 0.3374445, -0.6793756, 0.4156863, 1, 0, 1,
-0.6655246, -0.3347502, -2.152151, 0.4117647, 1, 0, 1,
-0.6621655, 0.281226, -2.820464, 0.4039216, 1, 0, 1,
-0.6554375, -1.871261, -3.7272, 0.3960784, 1, 0, 1,
-0.6542733, 1.86463, -0.1848048, 0.3921569, 1, 0, 1,
-0.6521314, -0.1514447, -2.683026, 0.3843137, 1, 0, 1,
-0.6519765, -0.4171271, -2.168004, 0.3803922, 1, 0, 1,
-0.6515436, -1.406761, -2.994104, 0.372549, 1, 0, 1,
-0.6485778, 0.2766725, -1.579616, 0.3686275, 1, 0, 1,
-0.6412337, 0.1833411, -1.120445, 0.3607843, 1, 0, 1,
-0.6340162, 0.5497947, -0.129547, 0.3568628, 1, 0, 1,
-0.6339092, -0.7803911, -2.349766, 0.3490196, 1, 0, 1,
-0.6318342, -0.8271621, -1.415457, 0.345098, 1, 0, 1,
-0.6312827, 1.366068, 0.8241712, 0.3372549, 1, 0, 1,
-0.628665, 0.1535641, -1.924817, 0.3333333, 1, 0, 1,
-0.6286206, 0.5322084, -0.5487136, 0.3254902, 1, 0, 1,
-0.6241087, -0.4364507, -1.296136, 0.3215686, 1, 0, 1,
-0.6236609, 1.7891, -0.8808737, 0.3137255, 1, 0, 1,
-0.6146731, -0.1846712, -1.734894, 0.3098039, 1, 0, 1,
-0.6117662, -1.035719, -3.437119, 0.3019608, 1, 0, 1,
-0.6115505, -0.4879074, -2.005218, 0.2941177, 1, 0, 1,
-0.6066467, 0.2420842, -0.8307403, 0.2901961, 1, 0, 1,
-0.6049321, -0.831289, -2.925394, 0.282353, 1, 0, 1,
-0.6004164, -1.57255, -2.543177, 0.2784314, 1, 0, 1,
-0.5955877, -0.07656568, -2.729755, 0.2705882, 1, 0, 1,
-0.5950828, -0.1242605, -3.37721, 0.2666667, 1, 0, 1,
-0.5927713, -0.1511927, -1.872396, 0.2588235, 1, 0, 1,
-0.5919143, 0.7843552, 0.8455585, 0.254902, 1, 0, 1,
-0.591446, -0.8562825, -1.211136, 0.2470588, 1, 0, 1,
-0.5890307, -1.054005, -2.444397, 0.2431373, 1, 0, 1,
-0.5862331, -2.281148, -4.484278, 0.2352941, 1, 0, 1,
-0.5854952, -0.6090782, -4.51907, 0.2313726, 1, 0, 1,
-0.5791619, 0.9339398, 0.6758816, 0.2235294, 1, 0, 1,
-0.5766672, -0.3284444, -2.456569, 0.2196078, 1, 0, 1,
-0.565613, -0.6674606, -0.7659956, 0.2117647, 1, 0, 1,
-0.5652683, -1.037098, -2.781154, 0.2078431, 1, 0, 1,
-0.5649502, 1.149957, -0.8621433, 0.2, 1, 0, 1,
-0.5586454, 0.6529936, 1.357999, 0.1921569, 1, 0, 1,
-0.5585724, -0.2087473, -1.323291, 0.1882353, 1, 0, 1,
-0.5536577, -0.8310214, -2.251959, 0.1803922, 1, 0, 1,
-0.5501879, -0.1746589, -0.9585394, 0.1764706, 1, 0, 1,
-0.5484183, 0.4374818, -0.641178, 0.1686275, 1, 0, 1,
-0.546517, -0.5789075, -4.383707, 0.1647059, 1, 0, 1,
-0.5445426, 0.2908072, -0.005837637, 0.1568628, 1, 0, 1,
-0.5342949, -0.409182, -2.521788, 0.1529412, 1, 0, 1,
-0.5301537, 2.105453, -0.856891, 0.145098, 1, 0, 1,
-0.5231522, 0.3664903, -0.02847724, 0.1411765, 1, 0, 1,
-0.5206639, -1.150225, -3.228333, 0.1333333, 1, 0, 1,
-0.5183323, -0.4335783, -2.45007, 0.1294118, 1, 0, 1,
-0.5131822, 1.255399, 0.7680745, 0.1215686, 1, 0, 1,
-0.5119511, 0.9754118, -0.0137808, 0.1176471, 1, 0, 1,
-0.5118723, -0.2901177, -2.756727, 0.1098039, 1, 0, 1,
-0.509757, 2.047806, 1.154122, 0.1058824, 1, 0, 1,
-0.5091576, -0.6157792, -3.203324, 0.09803922, 1, 0, 1,
-0.5089885, -0.3925865, -5.4743, 0.09019608, 1, 0, 1,
-0.5066349, 0.3153858, -2.574149, 0.08627451, 1, 0, 1,
-0.5053689, -2.269375, -2.807663, 0.07843138, 1, 0, 1,
-0.5050763, -2.074696, -2.1164, 0.07450981, 1, 0, 1,
-0.5016814, -0.04678088, -2.545801, 0.06666667, 1, 0, 1,
-0.5010786, -0.4614099, -1.353499, 0.0627451, 1, 0, 1,
-0.4972793, 0.4398548, -0.9802678, 0.05490196, 1, 0, 1,
-0.497041, -0.4167932, -0.8255437, 0.05098039, 1, 0, 1,
-0.4964365, -0.5058365, -2.365398, 0.04313726, 1, 0, 1,
-0.4923437, 0.5823966, 0.437692, 0.03921569, 1, 0, 1,
-0.4918448, 0.03940374, 1.24737, 0.03137255, 1, 0, 1,
-0.4897582, -0.5446202, -1.529398, 0.02745098, 1, 0, 1,
-0.4888491, -1.003367, -2.745718, 0.01960784, 1, 0, 1,
-0.4862718, -0.2201928, -0.9906647, 0.01568628, 1, 0, 1,
-0.4834713, 0.7645084, -1.659029, 0.007843138, 1, 0, 1,
-0.4821952, -0.158802, -3.010776, 0.003921569, 1, 0, 1,
-0.4792083, 0.4233983, 0.404975, 0, 1, 0.003921569, 1,
-0.4774502, -0.6403188, -2.362207, 0, 1, 0.01176471, 1,
-0.4746429, -1.292968, -2.197344, 0, 1, 0.01568628, 1,
-0.4694171, 0.2650574, 1.035986, 0, 1, 0.02352941, 1,
-0.4691852, 0.01851899, -2.973906, 0, 1, 0.02745098, 1,
-0.4686099, -1.134222, -2.789886, 0, 1, 0.03529412, 1,
-0.4672781, 0.5102586, -0.1839402, 0, 1, 0.03921569, 1,
-0.4664496, 1.328391, 0.4233953, 0, 1, 0.04705882, 1,
-0.464953, 0.2822863, -2.110074, 0, 1, 0.05098039, 1,
-0.4633107, -1.310348, -2.743797, 0, 1, 0.05882353, 1,
-0.4608094, 0.6554091, -0.8547955, 0, 1, 0.0627451, 1,
-0.4601704, -1.565747, -3.895254, 0, 1, 0.07058824, 1,
-0.4578695, 0.5321714, -2.17883, 0, 1, 0.07450981, 1,
-0.4573906, -2.014273, -2.857536, 0, 1, 0.08235294, 1,
-0.4535309, 0.2083731, -1.872464, 0, 1, 0.08627451, 1,
-0.4474324, -1.860431, -3.391909, 0, 1, 0.09411765, 1,
-0.4446657, -0.5958028, -2.731967, 0, 1, 0.1019608, 1,
-0.444312, -0.9463521, -1.873553, 0, 1, 0.1058824, 1,
-0.4433751, -0.535359, -3.32319, 0, 1, 0.1137255, 1,
-0.4401848, 0.827706, 0.3879724, 0, 1, 0.1176471, 1,
-0.4392342, 1.949475, 0.04137682, 0, 1, 0.1254902, 1,
-0.4379562, 0.3739373, -1.4128, 0, 1, 0.1294118, 1,
-0.4325113, 0.8438208, -0.6278728, 0, 1, 0.1372549, 1,
-0.4310764, -1.148818, -2.586954, 0, 1, 0.1411765, 1,
-0.4270746, -0.3230048, -3.093125, 0, 1, 0.1490196, 1,
-0.4225806, -1.567158, -3.855242, 0, 1, 0.1529412, 1,
-0.4219417, 2.005512, 0.7036044, 0, 1, 0.1607843, 1,
-0.4216119, 1.528554, 0.5375687, 0, 1, 0.1647059, 1,
-0.4191888, -0.1734601, -1.751451, 0, 1, 0.172549, 1,
-0.416185, -0.6956102, -3.628862, 0, 1, 0.1764706, 1,
-0.4143209, 0.2326331, -1.442911, 0, 1, 0.1843137, 1,
-0.4134065, -0.3194291, -2.279739, 0, 1, 0.1882353, 1,
-0.4133088, 0.6707627, -0.5837523, 0, 1, 0.1960784, 1,
-0.4100312, -1.671662, -1.636116, 0, 1, 0.2039216, 1,
-0.408439, -2.235562, -3.476048, 0, 1, 0.2078431, 1,
-0.4072203, -0.7467665, -2.957667, 0, 1, 0.2156863, 1,
-0.3998615, -1.846224, -5.000501, 0, 1, 0.2196078, 1,
-0.3990621, -1.295222, -2.841033, 0, 1, 0.227451, 1,
-0.3973065, 0.7617076, 0.6929203, 0, 1, 0.2313726, 1,
-0.3958717, 0.5858739, 0.3681737, 0, 1, 0.2392157, 1,
-0.3954428, 0.9991683, 0.9004459, 0, 1, 0.2431373, 1,
-0.3944514, -1.771142, -3.655235, 0, 1, 0.2509804, 1,
-0.3877782, 0.3083892, -0.822966, 0, 1, 0.254902, 1,
-0.3825677, -0.122812, -2.024742, 0, 1, 0.2627451, 1,
-0.3799799, 0.07922144, -2.413845, 0, 1, 0.2666667, 1,
-0.3786031, 0.7325075, 0.9652672, 0, 1, 0.2745098, 1,
-0.3722362, -0.5817796, -1.273169, 0, 1, 0.2784314, 1,
-0.365855, 0.7893645, -1.987279, 0, 1, 0.2862745, 1,
-0.3610454, -0.02966457, -1.495608, 0, 1, 0.2901961, 1,
-0.3600013, 0.2077488, -0.755926, 0, 1, 0.2980392, 1,
-0.3561576, -0.006589476, -1.046059, 0, 1, 0.3058824, 1,
-0.3546084, -2.040364, -5.035129, 0, 1, 0.3098039, 1,
-0.3541119, -1.298322, -2.215682, 0, 1, 0.3176471, 1,
-0.3511896, 1.483685, -0.6441516, 0, 1, 0.3215686, 1,
-0.3500803, -0.4167215, -2.941547, 0, 1, 0.3294118, 1,
-0.3496218, 1.015166, 0.8918934, 0, 1, 0.3333333, 1,
-0.347073, -0.6244, -3.052438, 0, 1, 0.3411765, 1,
-0.3459795, -0.9185898, -3.55742, 0, 1, 0.345098, 1,
-0.3448404, -0.1855769, -1.941913, 0, 1, 0.3529412, 1,
-0.3412519, 0.9477545, -1.654458, 0, 1, 0.3568628, 1,
-0.3370001, -0.08286616, -1.579295, 0, 1, 0.3647059, 1,
-0.3362427, 0.4391185, 0.2977808, 0, 1, 0.3686275, 1,
-0.3352377, -0.5204582, -2.259099, 0, 1, 0.3764706, 1,
-0.3303228, 0.3520109, -1.032729, 0, 1, 0.3803922, 1,
-0.3302095, -1.103182, -1.250439, 0, 1, 0.3882353, 1,
-0.3243257, -0.1963159, -0.4838103, 0, 1, 0.3921569, 1,
-0.320987, 0.9952298, -1.25144, 0, 1, 0.4, 1,
-0.3198796, -2.159632, -3.389627, 0, 1, 0.4078431, 1,
-0.3185317, 0.7333054, -0.9658662, 0, 1, 0.4117647, 1,
-0.3129878, -0.485099, -3.335434, 0, 1, 0.4196078, 1,
-0.2992375, -0.09405753, -2.861475, 0, 1, 0.4235294, 1,
-0.2980359, 0.2497517, -1.725404, 0, 1, 0.4313726, 1,
-0.2977203, -0.6078511, -4.282353, 0, 1, 0.4352941, 1,
-0.2927748, -0.2415335, -0.5623823, 0, 1, 0.4431373, 1,
-0.2885143, -1.064234, -2.811945, 0, 1, 0.4470588, 1,
-0.2867132, -0.5686108, -3.017878, 0, 1, 0.454902, 1,
-0.2862664, 0.9541931, 0.08992158, 0, 1, 0.4588235, 1,
-0.2850282, -0.2944099, -3.141736, 0, 1, 0.4666667, 1,
-0.2840495, -1.453967, -3.152498, 0, 1, 0.4705882, 1,
-0.2733578, -0.06908446, -2.169746, 0, 1, 0.4784314, 1,
-0.2703895, -1.736979, -2.511473, 0, 1, 0.4823529, 1,
-0.2696015, 0.3928016, -2.501087, 0, 1, 0.4901961, 1,
-0.2691028, -0.3453398, -1.942458, 0, 1, 0.4941176, 1,
-0.2689532, -1.952588, -3.955013, 0, 1, 0.5019608, 1,
-0.2687728, -0.188717, -1.314769, 0, 1, 0.509804, 1,
-0.2643915, -0.09240155, -2.072394, 0, 1, 0.5137255, 1,
-0.2641686, 3.006084, -0.0279784, 0, 1, 0.5215687, 1,
-0.2640106, 0.8878012, -0.2291904, 0, 1, 0.5254902, 1,
-0.2608068, -0.3239237, -1.455745, 0, 1, 0.5333334, 1,
-0.2596579, 0.3958052, 0.03187227, 0, 1, 0.5372549, 1,
-0.2574034, -0.5499342, -0.4237807, 0, 1, 0.5450981, 1,
-0.2526502, 0.2206396, 2.061427, 0, 1, 0.5490196, 1,
-0.2496541, 0.473404, -0.2052021, 0, 1, 0.5568628, 1,
-0.2485222, -0.6252335, -3.023993, 0, 1, 0.5607843, 1,
-0.2449446, 0.9369331, 0.8055776, 0, 1, 0.5686275, 1,
-0.2435045, 0.6227344, -1.343219, 0, 1, 0.572549, 1,
-0.2428234, -0.632517, -5.522029, 0, 1, 0.5803922, 1,
-0.2415865, 1.186185, 0.007351194, 0, 1, 0.5843138, 1,
-0.2396048, 1.855604, 0.01577584, 0, 1, 0.5921569, 1,
-0.2363498, 0.3657506, -0.9986088, 0, 1, 0.5960785, 1,
-0.236341, -0.5884996, -1.539489, 0, 1, 0.6039216, 1,
-0.234586, 0.01776442, -0.7433216, 0, 1, 0.6117647, 1,
-0.2344102, -0.6051224, -2.022939, 0, 1, 0.6156863, 1,
-0.2189743, -0.57213, -3.390446, 0, 1, 0.6235294, 1,
-0.2187876, 0.1210566, 1.043215, 0, 1, 0.627451, 1,
-0.2171664, -0.3408879, -4.535741, 0, 1, 0.6352941, 1,
-0.2148877, -0.8980981, -3.066789, 0, 1, 0.6392157, 1,
-0.2141965, -1.168716, -4.395112, 0, 1, 0.6470588, 1,
-0.2141867, 0.6729654, -0.839849, 0, 1, 0.6509804, 1,
-0.2129425, -1.103558, -3.359478, 0, 1, 0.6588235, 1,
-0.2123204, -0.8114252, -1.947002, 0, 1, 0.6627451, 1,
-0.2114213, 0.1014053, -1.681488, 0, 1, 0.6705883, 1,
-0.2076512, -0.5051648, -2.411164, 0, 1, 0.6745098, 1,
-0.1988321, 1.346666, 0.4622132, 0, 1, 0.682353, 1,
-0.1971042, 1.138146, -2.312471, 0, 1, 0.6862745, 1,
-0.196081, -0.2757775, -4.068175, 0, 1, 0.6941177, 1,
-0.1912081, -1.718065, -3.390779, 0, 1, 0.7019608, 1,
-0.187736, -1.7001, -3.287867, 0, 1, 0.7058824, 1,
-0.1853925, -1.379924, -5.240644, 0, 1, 0.7137255, 1,
-0.1827852, -1.304676, -2.989405, 0, 1, 0.7176471, 1,
-0.1820826, -1.009601, -3.182117, 0, 1, 0.7254902, 1,
-0.1819237, 0.101152, -2.019013, 0, 1, 0.7294118, 1,
-0.1748291, -0.2447849, -2.841085, 0, 1, 0.7372549, 1,
-0.1725496, 0.8854617, -2.427943, 0, 1, 0.7411765, 1,
-0.1723885, 0.5729646, 0.2324134, 0, 1, 0.7490196, 1,
-0.1686116, -2.382171, -3.319081, 0, 1, 0.7529412, 1,
-0.164662, 0.974102, 1.154399, 0, 1, 0.7607843, 1,
-0.1631492, -0.3321687, -2.27148, 0, 1, 0.7647059, 1,
-0.1589587, 0.6982168, -0.3808869, 0, 1, 0.772549, 1,
-0.1567433, 0.387746, -0.1121286, 0, 1, 0.7764706, 1,
-0.1515767, -1.228481, -3.566072, 0, 1, 0.7843137, 1,
-0.1492492, -1.105613, -5.155999, 0, 1, 0.7882353, 1,
-0.1488079, 0.4793099, 0.297281, 0, 1, 0.7960784, 1,
-0.1484909, 1.421117, 1.158852, 0, 1, 0.8039216, 1,
-0.1477645, -0.611056, -3.052488, 0, 1, 0.8078431, 1,
-0.1475752, -0.7783212, -3.449507, 0, 1, 0.8156863, 1,
-0.1470816, 0.8696125, -0.8765793, 0, 1, 0.8196079, 1,
-0.1449022, 0.5844809, -0.4398845, 0, 1, 0.827451, 1,
-0.1445743, 0.9327754, 0.3839828, 0, 1, 0.8313726, 1,
-0.1386269, 0.05424066, -1.368935, 0, 1, 0.8392157, 1,
-0.1385244, 0.473982, -0.1251366, 0, 1, 0.8431373, 1,
-0.135216, 1.412633, 0.08860863, 0, 1, 0.8509804, 1,
-0.1316567, -0.4981319, -2.36964, 0, 1, 0.854902, 1,
-0.1265676, 0.1900335, -0.5453267, 0, 1, 0.8627451, 1,
-0.1214667, 0.9517027, -0.2565148, 0, 1, 0.8666667, 1,
-0.1197459, -0.8945634, -3.737144, 0, 1, 0.8745098, 1,
-0.1171935, -0.81489, -2.521056, 0, 1, 0.8784314, 1,
-0.1139352, 0.8495076, -0.3217204, 0, 1, 0.8862745, 1,
-0.1117668, -0.5634705, -2.878854, 0, 1, 0.8901961, 1,
-0.1113537, 0.6219547, 0.8170222, 0, 1, 0.8980392, 1,
-0.1099746, -1.115941, -2.384974, 0, 1, 0.9058824, 1,
-0.1024127, 1.693305, -0.004251688, 0, 1, 0.9098039, 1,
-0.1014736, -0.1463237, -2.260562, 0, 1, 0.9176471, 1,
-0.1008406, 1.477161, -0.07521804, 0, 1, 0.9215686, 1,
-0.0975955, -0.2713438, -3.99255, 0, 1, 0.9294118, 1,
-0.09284873, -0.8710042, -4.768134, 0, 1, 0.9333333, 1,
-0.0924807, -1.930053, -3.14115, 0, 1, 0.9411765, 1,
-0.09197085, -0.2756248, -2.893787, 0, 1, 0.945098, 1,
-0.08767275, 1.548038, -0.8895773, 0, 1, 0.9529412, 1,
-0.08607922, -0.1777288, -2.960046, 0, 1, 0.9568627, 1,
-0.08426219, 1.54602, 0.66171, 0, 1, 0.9647059, 1,
-0.08218917, -1.042298, -1.683442, 0, 1, 0.9686275, 1,
-0.08059226, -0.00565603, -0.1304878, 0, 1, 0.9764706, 1,
-0.07386751, -1.19024, -2.859226, 0, 1, 0.9803922, 1,
-0.07185141, -0.4215025, -2.964478, 0, 1, 0.9882353, 1,
-0.07026339, -0.4405586, -3.455707, 0, 1, 0.9921569, 1,
-0.06629506, -0.7339315, -4.066318, 0, 1, 1, 1,
-0.06590173, 0.295856, -0.8100242, 0, 0.9921569, 1, 1,
-0.0645884, -0.3128795, -3.080719, 0, 0.9882353, 1, 1,
-0.06269614, -1.829801, -1.967939, 0, 0.9803922, 1, 1,
-0.05413702, 1.578734, -1.30093, 0, 0.9764706, 1, 1,
-0.05253421, -1.08826, -2.122108, 0, 0.9686275, 1, 1,
-0.05178291, -1.182635, -4.966133, 0, 0.9647059, 1, 1,
-0.0474999, -0.9902967, -2.451159, 0, 0.9568627, 1, 1,
-0.04049121, -0.4751146, -2.496538, 0, 0.9529412, 1, 1,
-0.03601896, 0.6734173, -2.158354, 0, 0.945098, 1, 1,
-0.03439639, 0.1525863, -0.4030252, 0, 0.9411765, 1, 1,
-0.02191923, 0.2131756, 1.084134, 0, 0.9333333, 1, 1,
-0.0205078, 0.7315478, 0.7266318, 0, 0.9294118, 1, 1,
-0.01974851, -0.9127172, -4.520939, 0, 0.9215686, 1, 1,
-0.01805493, -0.4090452, -1.624991, 0, 0.9176471, 1, 1,
-0.01575514, -0.5707284, -1.882307, 0, 0.9098039, 1, 1,
-0.01438281, -0.9582292, -3.527122, 0, 0.9058824, 1, 1,
-0.0113922, -0.02054286, -2.392879, 0, 0.8980392, 1, 1,
-0.008521794, -1.781419, -4.377395, 0, 0.8901961, 1, 1,
-0.007983281, 0.5499831, 1.28233, 0, 0.8862745, 1, 1,
-0.006848693, 1.871969, -0.3478459, 0, 0.8784314, 1, 1,
-0.001166492, -0.2799962, -2.516021, 0, 0.8745098, 1, 1,
0.002454992, -1.749512, 3.059835, 0, 0.8666667, 1, 1,
0.002667367, -1.089938, 3.144695, 0, 0.8627451, 1, 1,
0.00273467, -0.2349899, 3.375211, 0, 0.854902, 1, 1,
0.003964997, 0.7650458, -1.164508, 0, 0.8509804, 1, 1,
0.006568117, 0.8589473, -0.2370542, 0, 0.8431373, 1, 1,
0.00853583, 0.7670819, 0.03489719, 0, 0.8392157, 1, 1,
0.008546066, -0.1283246, 3.407753, 0, 0.8313726, 1, 1,
0.01041968, 0.9196591, 0.7451965, 0, 0.827451, 1, 1,
0.01215572, 0.3699982, -0.03033973, 0, 0.8196079, 1, 1,
0.01544675, 0.8409709, 1.157087, 0, 0.8156863, 1, 1,
0.02395824, 0.4899181, -0.5700892, 0, 0.8078431, 1, 1,
0.02706911, 0.6584471, 0.9070171, 0, 0.8039216, 1, 1,
0.02877033, -0.3688545, 4.359268, 0, 0.7960784, 1, 1,
0.0298895, -0.04172996, 2.391331, 0, 0.7882353, 1, 1,
0.03083083, -0.6594981, 2.957231, 0, 0.7843137, 1, 1,
0.03583169, -0.4150205, 1.874263, 0, 0.7764706, 1, 1,
0.037948, 0.9123209, 1.583586, 0, 0.772549, 1, 1,
0.03849706, -0.6016737, 3.354248, 0, 0.7647059, 1, 1,
0.04220267, 0.4941833, -1.632921, 0, 0.7607843, 1, 1,
0.04324727, 0.9192706, -0.4970543, 0, 0.7529412, 1, 1,
0.04386714, -0.651603, 2.446595, 0, 0.7490196, 1, 1,
0.04431358, -0.19198, 2.735823, 0, 0.7411765, 1, 1,
0.04480287, 1.494372, -1.227642, 0, 0.7372549, 1, 1,
0.05021967, 0.618435, 0.6431719, 0, 0.7294118, 1, 1,
0.05061794, 0.212442, 1.110542, 0, 0.7254902, 1, 1,
0.05132666, 1.309391, 0.2000749, 0, 0.7176471, 1, 1,
0.05607902, 0.2445893, -0.7438716, 0, 0.7137255, 1, 1,
0.0572865, -0.3687835, 3.331592, 0, 0.7058824, 1, 1,
0.05845784, -0.1398087, 2.576501, 0, 0.6980392, 1, 1,
0.06317826, 3.006199, -0.8255697, 0, 0.6941177, 1, 1,
0.06574146, 0.5605584, -0.4878692, 0, 0.6862745, 1, 1,
0.06617711, 0.534569, -0.3836361, 0, 0.682353, 1, 1,
0.07057414, -1.167203, 3.077921, 0, 0.6745098, 1, 1,
0.07231899, -0.5136991, 4.339912, 0, 0.6705883, 1, 1,
0.07935361, 1.584943, -0.5559885, 0, 0.6627451, 1, 1,
0.08198348, 0.731997, -0.1811848, 0, 0.6588235, 1, 1,
0.08275602, 0.1482046, 1.055568, 0, 0.6509804, 1, 1,
0.08430129, -0.08881323, 3.457534, 0, 0.6470588, 1, 1,
0.08821656, -0.05448373, 2.992404, 0, 0.6392157, 1, 1,
0.09791478, 0.5832315, 0.3790818, 0, 0.6352941, 1, 1,
0.1007082, -1.81348, 3.776524, 0, 0.627451, 1, 1,
0.1017547, -1.281291, 2.550578, 0, 0.6235294, 1, 1,
0.1036722, -1.2812, 2.730611, 0, 0.6156863, 1, 1,
0.1068475, 0.358981, 0.4574698, 0, 0.6117647, 1, 1,
0.1076336, 0.1240481, 1.745575, 0, 0.6039216, 1, 1,
0.1128391, -0.01669154, 1.828508, 0, 0.5960785, 1, 1,
0.1172629, 1.675048, 0.01362025, 0, 0.5921569, 1, 1,
0.1191944, 0.4666447, 0.6005121, 0, 0.5843138, 1, 1,
0.1203003, -0.223801, 1.47821, 0, 0.5803922, 1, 1,
0.1237214, 0.4718305, 0.8239352, 0, 0.572549, 1, 1,
0.1282926, 0.907813, -1.011355, 0, 0.5686275, 1, 1,
0.1297592, -1.3651, 2.503506, 0, 0.5607843, 1, 1,
0.1306235, -0.3810715, 2.112329, 0, 0.5568628, 1, 1,
0.131486, -0.6848487, 3.761649, 0, 0.5490196, 1, 1,
0.1323897, 0.2078922, 1.638114, 0, 0.5450981, 1, 1,
0.1350179, -0.7894674, 3.295289, 0, 0.5372549, 1, 1,
0.1412293, 0.1520589, 1.549145, 0, 0.5333334, 1, 1,
0.1436197, 0.7959042, 1.894, 0, 0.5254902, 1, 1,
0.1440064, -0.7450634, 3.142702, 0, 0.5215687, 1, 1,
0.1500201, 0.4921632, 0.608142, 0, 0.5137255, 1, 1,
0.1534654, 1.290029, -1.399433, 0, 0.509804, 1, 1,
0.1561289, -0.6725583, 4.21561, 0, 0.5019608, 1, 1,
0.1597949, -0.5076625, 4.272579, 0, 0.4941176, 1, 1,
0.1632002, 0.2007758, -0.7128052, 0, 0.4901961, 1, 1,
0.1642593, 1.196353, 0.2706584, 0, 0.4823529, 1, 1,
0.1666889, 0.3876683, 2.025061, 0, 0.4784314, 1, 1,
0.1667794, -1.019569, 3.751859, 0, 0.4705882, 1, 1,
0.1678372, -0.2078087, 2.706574, 0, 0.4666667, 1, 1,
0.1703413, 1.876977, 1.672145, 0, 0.4588235, 1, 1,
0.1726551, -0.3175656, 1.481912, 0, 0.454902, 1, 1,
0.1739362, -0.7183977, 4.536243, 0, 0.4470588, 1, 1,
0.1763128, 1.825875, -0.5398333, 0, 0.4431373, 1, 1,
0.1779444, -1.065979, 2.829673, 0, 0.4352941, 1, 1,
0.1792792, -0.7547746, 2.04736, 0, 0.4313726, 1, 1,
0.1840046, -0.5057171, 1.309792, 0, 0.4235294, 1, 1,
0.1881206, -0.4216354, 2.447592, 0, 0.4196078, 1, 1,
0.1883955, 0.08899195, 2.401182, 0, 0.4117647, 1, 1,
0.1890952, 0.1949301, 2.959031, 0, 0.4078431, 1, 1,
0.1911503, 1.332394, 1.45895, 0, 0.4, 1, 1,
0.1920408, 1.403455, 1.057847, 0, 0.3921569, 1, 1,
0.1938837, -0.4479466, 2.007536, 0, 0.3882353, 1, 1,
0.1941958, -0.5556875, 2.689412, 0, 0.3803922, 1, 1,
0.1995336, -2.525967, 2.986633, 0, 0.3764706, 1, 1,
0.2019531, 0.2403039, 0.5698376, 0, 0.3686275, 1, 1,
0.2061534, -1.802257, 3.868613, 0, 0.3647059, 1, 1,
0.2101075, -1.740449, 3.271909, 0, 0.3568628, 1, 1,
0.2110442, 0.3953386, -1.238224, 0, 0.3529412, 1, 1,
0.2156083, -1.126573, 3.525361, 0, 0.345098, 1, 1,
0.2165991, -0.2645377, 0.323935, 0, 0.3411765, 1, 1,
0.21707, 1.300725, -0.5619403, 0, 0.3333333, 1, 1,
0.2208832, -1.328387, 3.136967, 0, 0.3294118, 1, 1,
0.2216499, 0.1451798, -0.2398746, 0, 0.3215686, 1, 1,
0.2235027, -0.2280785, 2.241796, 0, 0.3176471, 1, 1,
0.2255368, 2.437522, 0.6397492, 0, 0.3098039, 1, 1,
0.2270798, -0.3306606, 3.606887, 0, 0.3058824, 1, 1,
0.231729, 1.647987, -0.3625024, 0, 0.2980392, 1, 1,
0.2319281, -0.8230091, 2.488972, 0, 0.2901961, 1, 1,
0.2368316, -0.946824, 3.777514, 0, 0.2862745, 1, 1,
0.2377956, -0.03209485, 1.227119, 0, 0.2784314, 1, 1,
0.237802, -0.5264861, 3.164891, 0, 0.2745098, 1, 1,
0.2378064, -0.06124724, 2.434253, 0, 0.2666667, 1, 1,
0.2463554, 0.299316, 0.5927587, 0, 0.2627451, 1, 1,
0.2485196, -0.2291978, 1.203367, 0, 0.254902, 1, 1,
0.2553901, -0.4497632, 4.145254, 0, 0.2509804, 1, 1,
0.2566616, 2.489555, 0.6035047, 0, 0.2431373, 1, 1,
0.2582228, 0.0670662, 2.605265, 0, 0.2392157, 1, 1,
0.2602689, 0.02440748, 2.386588, 0, 0.2313726, 1, 1,
0.2611577, -1.210044, 2.885486, 0, 0.227451, 1, 1,
0.2664001, 2.414141, -0.8416319, 0, 0.2196078, 1, 1,
0.2674201, -1.139024, 4.405187, 0, 0.2156863, 1, 1,
0.2724344, -0.9294348, 4.870134, 0, 0.2078431, 1, 1,
0.2743977, 1.322573, -0.7606261, 0, 0.2039216, 1, 1,
0.2756354, 0.999889, 0.2914965, 0, 0.1960784, 1, 1,
0.2771765, 0.3044899, 0.6507512, 0, 0.1882353, 1, 1,
0.2785795, 2.003284, 0.8841371, 0, 0.1843137, 1, 1,
0.2787028, 2.115621, 0.6094555, 0, 0.1764706, 1, 1,
0.2791939, 1.208173, 1.213389, 0, 0.172549, 1, 1,
0.2887385, 1.361069, 0.5669119, 0, 0.1647059, 1, 1,
0.2925772, -1.763937, 0.605601, 0, 0.1607843, 1, 1,
0.2946771, 0.2584689, 0.7699935, 0, 0.1529412, 1, 1,
0.3082711, 0.5782194, 0.4461689, 0, 0.1490196, 1, 1,
0.3097726, 0.003008289, 3.151851, 0, 0.1411765, 1, 1,
0.313456, 0.8871284, 0.9484076, 0, 0.1372549, 1, 1,
0.3135528, 2.03948, 0.679284, 0, 0.1294118, 1, 1,
0.3176095, -0.9011326, 3.186498, 0, 0.1254902, 1, 1,
0.3188129, -2.14112, 3.563301, 0, 0.1176471, 1, 1,
0.3287403, -0.4782837, 2.329685, 0, 0.1137255, 1, 1,
0.3305917, -1.073557, 1.706906, 0, 0.1058824, 1, 1,
0.3322398, -1.947835, 3.475757, 0, 0.09803922, 1, 1,
0.3329951, -0.7761049, 2.863219, 0, 0.09411765, 1, 1,
0.3330075, -1.901989, 4.088114, 0, 0.08627451, 1, 1,
0.3336897, -0.1182712, 0.4851215, 0, 0.08235294, 1, 1,
0.3339927, 1.414138, -1.336332, 0, 0.07450981, 1, 1,
0.3376158, 0.8683544, -0.7249182, 0, 0.07058824, 1, 1,
0.3412571, 1.271183, 1.30747, 0, 0.0627451, 1, 1,
0.3417419, -0.02088031, 1.228575, 0, 0.05882353, 1, 1,
0.3472679, 0.1156828, 2.33083, 0, 0.05098039, 1, 1,
0.3499371, -1.372966, 3.840369, 0, 0.04705882, 1, 1,
0.3617171, -1.276214, 4.893733, 0, 0.03921569, 1, 1,
0.3617425, -0.221237, 2.113697, 0, 0.03529412, 1, 1,
0.3618934, 1.93649, -1.331757, 0, 0.02745098, 1, 1,
0.3621057, -0.4783467, 0.9049594, 0, 0.02352941, 1, 1,
0.3643613, -0.5433045, 2.739462, 0, 0.01568628, 1, 1,
0.3652893, -0.4508283, 0.9076288, 0, 0.01176471, 1, 1,
0.3676795, 1.870249, 1.1947, 0, 0.003921569, 1, 1,
0.3713835, 0.3196934, 1.173201, 0.003921569, 0, 1, 1,
0.3736689, -1.257557, 3.774505, 0.007843138, 0, 1, 1,
0.3788548, 0.8535212, -0.7281479, 0.01568628, 0, 1, 1,
0.3837267, 0.5981287, 0.190301, 0.01960784, 0, 1, 1,
0.3840757, -0.876056, 1.754075, 0.02745098, 0, 1, 1,
0.3870197, 0.4924331, 0.3874536, 0.03137255, 0, 1, 1,
0.3897769, -0.7719312, 4.155793, 0.03921569, 0, 1, 1,
0.3902622, 1.065066, 1.192417, 0.04313726, 0, 1, 1,
0.3908456, 1.317765, 0.9430306, 0.05098039, 0, 1, 1,
0.3943073, 0.03337579, 0.9212305, 0.05490196, 0, 1, 1,
0.3962299, -1.182143, 3.345002, 0.0627451, 0, 1, 1,
0.3965332, -0.007568252, 2.044551, 0.06666667, 0, 1, 1,
0.399392, 0.1633487, 0.376381, 0.07450981, 0, 1, 1,
0.399485, -1.193894, 3.759403, 0.07843138, 0, 1, 1,
0.400578, -0.6447047, 2.969007, 0.08627451, 0, 1, 1,
0.4032756, 0.7248917, 1.80817, 0.09019608, 0, 1, 1,
0.4065802, 0.2689114, 0.3682128, 0.09803922, 0, 1, 1,
0.4095328, -1.793171, 3.278594, 0.1058824, 0, 1, 1,
0.409632, 1.591101, 0.6388242, 0.1098039, 0, 1, 1,
0.4121387, 0.7935596, 0.002767293, 0.1176471, 0, 1, 1,
0.4124028, 0.7128686, 0.3336637, 0.1215686, 0, 1, 1,
0.4180091, 0.6156241, 0.04212776, 0.1294118, 0, 1, 1,
0.4187426, 1.151912, 1.131346, 0.1333333, 0, 1, 1,
0.4203513, -0.06542046, 2.779817, 0.1411765, 0, 1, 1,
0.4203653, -0.09544403, 3.141824, 0.145098, 0, 1, 1,
0.420366, 0.4329782, 2.361186, 0.1529412, 0, 1, 1,
0.4235106, -2.361236, 3.006918, 0.1568628, 0, 1, 1,
0.4297371, 0.8856665, 0.5291653, 0.1647059, 0, 1, 1,
0.4359918, 0.5555183, -0.9396423, 0.1686275, 0, 1, 1,
0.4374568, -0.9845604, 2.184859, 0.1764706, 0, 1, 1,
0.4457537, -0.3491804, 1.764291, 0.1803922, 0, 1, 1,
0.448173, 0.5894052, 2.361447, 0.1882353, 0, 1, 1,
0.4538832, -1.302829, 2.612315, 0.1921569, 0, 1, 1,
0.4663998, 0.1773055, 0.2281575, 0.2, 0, 1, 1,
0.4734714, 1.039867, 0.8925752, 0.2078431, 0, 1, 1,
0.4775141, 0.2715284, 0.7022883, 0.2117647, 0, 1, 1,
0.4779199, 2.834678, -0.4991561, 0.2196078, 0, 1, 1,
0.4939175, -0.2485991, 1.923963, 0.2235294, 0, 1, 1,
0.4992514, -0.2706108, 1.6034, 0.2313726, 0, 1, 1,
0.5008213, -0.6398298, 2.608896, 0.2352941, 0, 1, 1,
0.5100728, -1.243774, 3.770784, 0.2431373, 0, 1, 1,
0.5148417, 0.6597611, -0.9376156, 0.2470588, 0, 1, 1,
0.5163347, -2.070133, 1.28661, 0.254902, 0, 1, 1,
0.5208721, 0.06081299, 1.221108, 0.2588235, 0, 1, 1,
0.5216042, 0.9872107, 0.6493549, 0.2666667, 0, 1, 1,
0.5242882, 0.5120932, 2.462524, 0.2705882, 0, 1, 1,
0.5281169, 0.7611007, 0.6890715, 0.2784314, 0, 1, 1,
0.5299783, -0.4967605, 3.804433, 0.282353, 0, 1, 1,
0.5308446, -3.387853, 3.204378, 0.2901961, 0, 1, 1,
0.5319533, -0.4110635, 2.338191, 0.2941177, 0, 1, 1,
0.5326609, -0.2912922, 2.752929, 0.3019608, 0, 1, 1,
0.5339171, -0.2130321, 1.212254, 0.3098039, 0, 1, 1,
0.5367193, -1.644365, 3.087628, 0.3137255, 0, 1, 1,
0.5375334, 0.5397589, 1.141925, 0.3215686, 0, 1, 1,
0.5387018, 0.6822248, 0.8649127, 0.3254902, 0, 1, 1,
0.5411335, -0.3633681, 2.594219, 0.3333333, 0, 1, 1,
0.5438297, 1.764009, 0.4403408, 0.3372549, 0, 1, 1,
0.5461656, 0.03422361, 1.346965, 0.345098, 0, 1, 1,
0.5467433, -0.4368265, 2.178391, 0.3490196, 0, 1, 1,
0.5467978, 0.5920785, 0.4783344, 0.3568628, 0, 1, 1,
0.5479992, -0.4020162, 2.370573, 0.3607843, 0, 1, 1,
0.5524288, -1.021258, 3.286218, 0.3686275, 0, 1, 1,
0.553131, 0.3825713, 0.06161657, 0.372549, 0, 1, 1,
0.5585585, -0.08503595, 1.530555, 0.3803922, 0, 1, 1,
0.5668558, -0.2765281, 2.087744, 0.3843137, 0, 1, 1,
0.5774156, -0.7066746, 1.939912, 0.3921569, 0, 1, 1,
0.5775022, 0.8310961, 1.270424, 0.3960784, 0, 1, 1,
0.5783184, -0.5775787, 1.65101, 0.4039216, 0, 1, 1,
0.5812263, -1.293197, 2.101016, 0.4117647, 0, 1, 1,
0.5874438, 0.5812342, -0.8681126, 0.4156863, 0, 1, 1,
0.5969306, -0.7727739, 2.459578, 0.4235294, 0, 1, 1,
0.6038694, -1.463901, 1.478592, 0.427451, 0, 1, 1,
0.6038944, 0.2687977, 2.301733, 0.4352941, 0, 1, 1,
0.6043323, -1.079662, 3.064578, 0.4392157, 0, 1, 1,
0.6082962, 0.09632712, 0.4686072, 0.4470588, 0, 1, 1,
0.6134625, -0.4570058, 2.191171, 0.4509804, 0, 1, 1,
0.6165046, -2.038669, 3.261729, 0.4588235, 0, 1, 1,
0.6257095, -0.3072828, 3.028147, 0.4627451, 0, 1, 1,
0.6335225, -0.6901729, 2.749083, 0.4705882, 0, 1, 1,
0.6349232, -0.7311951, 2.368692, 0.4745098, 0, 1, 1,
0.6353298, 0.5259549, -0.4037746, 0.4823529, 0, 1, 1,
0.6353538, -0.9159665, 1.842264, 0.4862745, 0, 1, 1,
0.6356216, 0.5534457, 1.216051, 0.4941176, 0, 1, 1,
0.639316, 0.09759777, 0.6591483, 0.5019608, 0, 1, 1,
0.6438203, 0.6347654, 0.4873926, 0.5058824, 0, 1, 1,
0.6465958, -0.1563025, 2.364494, 0.5137255, 0, 1, 1,
0.646677, -2.028567, 2.251797, 0.5176471, 0, 1, 1,
0.6495194, 1.023777, -0.4649784, 0.5254902, 0, 1, 1,
0.6535111, -0.8177603, 0.04728511, 0.5294118, 0, 1, 1,
0.6553998, 1.961963, -1.352889, 0.5372549, 0, 1, 1,
0.6577612, -0.1751736, 2.77084, 0.5411765, 0, 1, 1,
0.65794, -2.31649, 2.011279, 0.5490196, 0, 1, 1,
0.6608455, 0.4352266, 1.039191, 0.5529412, 0, 1, 1,
0.6643269, 0.7687207, 1.962017, 0.5607843, 0, 1, 1,
0.6663945, 0.9883829, 2.662546, 0.5647059, 0, 1, 1,
0.6700965, 1.150636, 0.2680898, 0.572549, 0, 1, 1,
0.6767704, -1.117576, 2.275766, 0.5764706, 0, 1, 1,
0.6786133, 0.4093627, -1.129929, 0.5843138, 0, 1, 1,
0.6950477, 1.922708, -0.9837125, 0.5882353, 0, 1, 1,
0.695958, -0.6437303, 3.002494, 0.5960785, 0, 1, 1,
0.700665, 0.04076383, 2.094425, 0.6039216, 0, 1, 1,
0.7014893, -0.3492584, 2.354864, 0.6078432, 0, 1, 1,
0.7025435, -1.511441, 0.4127993, 0.6156863, 0, 1, 1,
0.7103499, 1.147098, 1.655774, 0.6196079, 0, 1, 1,
0.7136307, 0.08625243, 1.760493, 0.627451, 0, 1, 1,
0.7226141, -0.486873, 1.380131, 0.6313726, 0, 1, 1,
0.7260593, 0.7685602, 0.6598716, 0.6392157, 0, 1, 1,
0.7271313, 0.1342255, 2.871974, 0.6431373, 0, 1, 1,
0.7282324, 0.5459697, 1.462945, 0.6509804, 0, 1, 1,
0.7324027, -0.7992197, 1.351835, 0.654902, 0, 1, 1,
0.7328229, 0.356429, 1.36717, 0.6627451, 0, 1, 1,
0.7371508, 1.533068, 0.7747446, 0.6666667, 0, 1, 1,
0.7442826, 0.9495549, 0.9130185, 0.6745098, 0, 1, 1,
0.7500914, -0.8503818, 1.082872, 0.6784314, 0, 1, 1,
0.7548038, 3.245318, 0.125155, 0.6862745, 0, 1, 1,
0.7606865, 0.8932683, 1.583089, 0.6901961, 0, 1, 1,
0.769951, 1.024325, 0.9590668, 0.6980392, 0, 1, 1,
0.7713043, 1.628467, 0.1630933, 0.7058824, 0, 1, 1,
0.7727024, -0.2528316, 2.530081, 0.7098039, 0, 1, 1,
0.7733831, -1.460698, 3.595046, 0.7176471, 0, 1, 1,
0.7781869, -1.57791, 3.110994, 0.7215686, 0, 1, 1,
0.7806596, -0.3718034, 2.267772, 0.7294118, 0, 1, 1,
0.7823542, 0.3944598, 0.9507429, 0.7333333, 0, 1, 1,
0.7839854, 1.380693, 0.7590498, 0.7411765, 0, 1, 1,
0.7868986, -2.096884, 1.826244, 0.7450981, 0, 1, 1,
0.7945791, -0.2636186, 4.070701, 0.7529412, 0, 1, 1,
0.7950793, -1.352621, 3.946939, 0.7568628, 0, 1, 1,
0.7965959, 0.722152, 0.720373, 0.7647059, 0, 1, 1,
0.8047936, -0.3933481, 2.814358, 0.7686275, 0, 1, 1,
0.8060271, -0.235699, 3.082746, 0.7764706, 0, 1, 1,
0.8061217, 3.2805, 0.3493744, 0.7803922, 0, 1, 1,
0.8078108, 1.342873, -0.7987339, 0.7882353, 0, 1, 1,
0.809669, -0.4464024, 2.349374, 0.7921569, 0, 1, 1,
0.8111774, 0.3466083, 1.003539, 0.8, 0, 1, 1,
0.8139837, -0.3828573, 4.165079, 0.8078431, 0, 1, 1,
0.8207767, 1.723352, -0.1088195, 0.8117647, 0, 1, 1,
0.8233233, 0.2702959, 2.033611, 0.8196079, 0, 1, 1,
0.8241441, 0.6085442, 0.9724868, 0.8235294, 0, 1, 1,
0.8282841, 0.2799426, 1.441571, 0.8313726, 0, 1, 1,
0.8331813, 0.6095193, 0.2728758, 0.8352941, 0, 1, 1,
0.8371226, -0.3156538, 2.404716, 0.8431373, 0, 1, 1,
0.8378087, -0.9781579, 1.356853, 0.8470588, 0, 1, 1,
0.8387687, -0.7357157, 1.684601, 0.854902, 0, 1, 1,
0.8396732, 0.4662545, 1.878838, 0.8588235, 0, 1, 1,
0.8399501, 1.132081, 0.07675736, 0.8666667, 0, 1, 1,
0.8446791, 0.843491, 2.058286, 0.8705882, 0, 1, 1,
0.8461575, -0.7477078, 2.592092, 0.8784314, 0, 1, 1,
0.8480203, -2.058033, 1.637542, 0.8823529, 0, 1, 1,
0.8496537, -0.038934, 2.304205, 0.8901961, 0, 1, 1,
0.8501413, -2.264216, 4.721112, 0.8941177, 0, 1, 1,
0.850772, -0.4974114, 0.9925181, 0.9019608, 0, 1, 1,
0.8515396, 0.1555409, 1.56685, 0.9098039, 0, 1, 1,
0.851921, 0.7423967, 1.172964, 0.9137255, 0, 1, 1,
0.8638038, -2.157596, 1.035985, 0.9215686, 0, 1, 1,
0.8660522, -0.4079406, 2.554085, 0.9254902, 0, 1, 1,
0.8725609, 0.2539499, 1.362553, 0.9333333, 0, 1, 1,
0.8817468, 1.229184, -0.3718521, 0.9372549, 0, 1, 1,
0.8825648, 0.3987463, 1.665879, 0.945098, 0, 1, 1,
0.8845264, 0.825471, 2.247507, 0.9490196, 0, 1, 1,
0.8864112, -0.3886957, 1.557375, 0.9568627, 0, 1, 1,
0.8873439, 0.02502036, 1.856963, 0.9607843, 0, 1, 1,
0.8883082, -0.3679808, 1.021987, 0.9686275, 0, 1, 1,
0.8894125, 2.06966, 1.195588, 0.972549, 0, 1, 1,
0.8948181, 0.6409103, 2.103421, 0.9803922, 0, 1, 1,
0.8958821, -0.8657076, 2.140051, 0.9843137, 0, 1, 1,
0.8979954, -0.5676267, 1.488885, 0.9921569, 0, 1, 1,
0.905951, 0.8876725, 0.7874038, 0.9960784, 0, 1, 1,
0.9094753, -0.2376516, 2.338329, 1, 0, 0.9960784, 1,
0.9128656, 1.114487, 1.224029, 1, 0, 0.9882353, 1,
0.9155612, 1.090056, -0.3961926, 1, 0, 0.9843137, 1,
0.9157792, -3.028377, 1.135763, 1, 0, 0.9764706, 1,
0.9176787, 1.906335, 0.3033504, 1, 0, 0.972549, 1,
0.9274617, -1.20241, 2.633128, 1, 0, 0.9647059, 1,
0.930923, 0.9419239, -0.01936407, 1, 0, 0.9607843, 1,
0.9370657, 0.6122127, -0.6567418, 1, 0, 0.9529412, 1,
0.9402504, 1.665989, 0.9294352, 1, 0, 0.9490196, 1,
0.9404734, -2.078045, 1.183078, 1, 0, 0.9411765, 1,
0.9456946, -1.784612, 1.013122, 1, 0, 0.9372549, 1,
0.9521844, -0.9031799, 0.4862052, 1, 0, 0.9294118, 1,
0.952824, 0.9930722, 0.9772766, 1, 0, 0.9254902, 1,
0.953613, 1.873625, 1.953071, 1, 0, 0.9176471, 1,
0.9543776, -2.153184, 3.497295, 1, 0, 0.9137255, 1,
0.9591528, 0.5653835, -1.195218, 1, 0, 0.9058824, 1,
0.9666733, -1.246617, 4.294657, 1, 0, 0.9019608, 1,
0.9765214, 0.4374703, 1.005302, 1, 0, 0.8941177, 1,
0.9772063, 1.787188, -0.7944025, 1, 0, 0.8862745, 1,
0.9868811, -0.02466351, -0.4055852, 1, 0, 0.8823529, 1,
0.9902194, -0.7480044, 1.029958, 1, 0, 0.8745098, 1,
0.9902199, -2.595143, 1.796305, 1, 0, 0.8705882, 1,
0.9909289, -1.463069, 2.462573, 1, 0, 0.8627451, 1,
0.9936308, 0.4048185, 1.881668, 1, 0, 0.8588235, 1,
0.994828, 0.353432, 1.585418, 1, 0, 0.8509804, 1,
1.004594, 1.085967, 1.230111, 1, 0, 0.8470588, 1,
1.004863, 0.5147634, 2.421573, 1, 0, 0.8392157, 1,
1.008304, -0.7111453, 3.280392, 1, 0, 0.8352941, 1,
1.01002, 1.628371, 0.2665521, 1, 0, 0.827451, 1,
1.016478, 0.4452216, 2.769326, 1, 0, 0.8235294, 1,
1.017079, -1.617947, 2.039203, 1, 0, 0.8156863, 1,
1.023435, 0.3748915, 0.8120554, 1, 0, 0.8117647, 1,
1.027715, -1.205359, 1.887688, 1, 0, 0.8039216, 1,
1.029396, -0.4715437, 1.247813, 1, 0, 0.7960784, 1,
1.031078, 0.5248356, 1.42631, 1, 0, 0.7921569, 1,
1.033794, 0.7130694, -1.446323, 1, 0, 0.7843137, 1,
1.036321, -0.9087397, 3.16634, 1, 0, 0.7803922, 1,
1.04354, 1.756504, 2.03929, 1, 0, 0.772549, 1,
1.044685, -1.664662, 3.585346, 1, 0, 0.7686275, 1,
1.049886, -0.1948076, 1.913867, 1, 0, 0.7607843, 1,
1.051622, 1.001206, 1.520203, 1, 0, 0.7568628, 1,
1.053039, 2.026402, 1.429342, 1, 0, 0.7490196, 1,
1.063512, 1.583618, 0.6664779, 1, 0, 0.7450981, 1,
1.07018, 0.9681928, -0.04918959, 1, 0, 0.7372549, 1,
1.073819, 1.64427, -0.3553533, 1, 0, 0.7333333, 1,
1.075593, 0.2095414, 2.185373, 1, 0, 0.7254902, 1,
1.076576, 0.1415694, 2.211751, 1, 0, 0.7215686, 1,
1.08122, 0.4526012, 0.6941112, 1, 0, 0.7137255, 1,
1.089591, 1.150507, 0.9182152, 1, 0, 0.7098039, 1,
1.09264, -0.07452136, 2.396879, 1, 0, 0.7019608, 1,
1.096424, -1.620451, 3.802698, 1, 0, 0.6941177, 1,
1.096981, 0.7173535, 1.385306, 1, 0, 0.6901961, 1,
1.100188, 0.5721547, 1.547438, 1, 0, 0.682353, 1,
1.106555, -0.9930735, 1.60232, 1, 0, 0.6784314, 1,
1.107992, -0.3956779, 2.902179, 1, 0, 0.6705883, 1,
1.117258, 1.340231, -0.2717204, 1, 0, 0.6666667, 1,
1.124085, 1.002915, 1.572524, 1, 0, 0.6588235, 1,
1.124659, 0.9626155, 0.6826963, 1, 0, 0.654902, 1,
1.128527, -0.6107687, 1.018349, 1, 0, 0.6470588, 1,
1.134398, -2.32081, 0.3480659, 1, 0, 0.6431373, 1,
1.141508, 0.5613188, -0.5131043, 1, 0, 0.6352941, 1,
1.151762, 1.919353, -0.09763293, 1, 0, 0.6313726, 1,
1.161278, -0.2681201, 1.725966, 1, 0, 0.6235294, 1,
1.165237, 0.4817136, 1.699659, 1, 0, 0.6196079, 1,
1.166104, -0.3756902, 2.430071, 1, 0, 0.6117647, 1,
1.181039, -0.9267652, 1.035986, 1, 0, 0.6078432, 1,
1.192197, 1.898891, 1.160099, 1, 0, 0.6, 1,
1.192247, -1.067161, 3.302533, 1, 0, 0.5921569, 1,
1.194384, -1.836493, 1.396666, 1, 0, 0.5882353, 1,
1.196033, 0.1309, 2.119322, 1, 0, 0.5803922, 1,
1.197709, 2.28822, 1.92975, 1, 0, 0.5764706, 1,
1.206304, 0.7134094, 0.5574952, 1, 0, 0.5686275, 1,
1.220896, 0.609325, 1.761269, 1, 0, 0.5647059, 1,
1.22861, 1.474205, 0.5192261, 1, 0, 0.5568628, 1,
1.23585, 1.048136, 1.120987, 1, 0, 0.5529412, 1,
1.239007, 0.1629649, 1.055318, 1, 0, 0.5450981, 1,
1.242398, -0.4102837, 1.028506, 1, 0, 0.5411765, 1,
1.248347, -0.3692343, 1.146903, 1, 0, 0.5333334, 1,
1.261112, -0.01026598, 2.98976, 1, 0, 0.5294118, 1,
1.261964, 0.008944474, 3.629242, 1, 0, 0.5215687, 1,
1.262917, -0.4497949, 1.135309, 1, 0, 0.5176471, 1,
1.273961, -2.155437, 1.75004, 1, 0, 0.509804, 1,
1.277217, 0.4609797, 1.087031, 1, 0, 0.5058824, 1,
1.28869, -0.4732476, 3.045357, 1, 0, 0.4980392, 1,
1.293454, 0.5026231, 2.149231, 1, 0, 0.4901961, 1,
1.304146, -0.5444885, 2.401349, 1, 0, 0.4862745, 1,
1.337202, -1.111261, 1.403709, 1, 0, 0.4784314, 1,
1.338722, 0.7707796, 1.783347, 1, 0, 0.4745098, 1,
1.340104, -1.362154, 2.028348, 1, 0, 0.4666667, 1,
1.367515, -0.0703787, 1.893821, 1, 0, 0.4627451, 1,
1.382047, 0.3948246, 1.41098, 1, 0, 0.454902, 1,
1.402798, 0.05755948, 1.371096, 1, 0, 0.4509804, 1,
1.413793, 0.7872582, 1.059558, 1, 0, 0.4431373, 1,
1.423227, -0.8992325, 3.373478, 1, 0, 0.4392157, 1,
1.442944, -0.2201189, 1.438188, 1, 0, 0.4313726, 1,
1.445301, 0.07891676, 2.192939, 1, 0, 0.427451, 1,
1.449234, -1.871508, 1.728896, 1, 0, 0.4196078, 1,
1.4565, -0.4753301, 2.887013, 1, 0, 0.4156863, 1,
1.464583, 0.1531322, 3.428796, 1, 0, 0.4078431, 1,
1.471073, 1.307545, -0.2856297, 1, 0, 0.4039216, 1,
1.481454, -0.02889755, 2.265962, 1, 0, 0.3960784, 1,
1.493281, 0.3586593, 2.187677, 1, 0, 0.3882353, 1,
1.506791, -0.53455, 2.446488, 1, 0, 0.3843137, 1,
1.5075, -0.4007508, 1.373118, 1, 0, 0.3764706, 1,
1.515003, 1.897818, -0.1590149, 1, 0, 0.372549, 1,
1.536126, -0.4744676, 2.625863, 1, 0, 0.3647059, 1,
1.541043, 0.6821108, 1.551286, 1, 0, 0.3607843, 1,
1.544538, -0.2626815, 1.765545, 1, 0, 0.3529412, 1,
1.545256, 0.06081265, 0.887209, 1, 0, 0.3490196, 1,
1.582522, 0.1800677, 1.50713, 1, 0, 0.3411765, 1,
1.585466, -0.3829736, 1.688709, 1, 0, 0.3372549, 1,
1.587585, -1.518083, 3.02556, 1, 0, 0.3294118, 1,
1.589293, 0.3134604, 1.444468, 1, 0, 0.3254902, 1,
1.590122, -0.4564972, 4.388328, 1, 0, 0.3176471, 1,
1.623578, -0.9985368, 2.823255, 1, 0, 0.3137255, 1,
1.6352, -2.162779, 1.81103, 1, 0, 0.3058824, 1,
1.651137, 1.022759, 0.9151692, 1, 0, 0.2980392, 1,
1.651417, 0.8709771, 2.113989, 1, 0, 0.2941177, 1,
1.654354, 1.187031, 0.1369435, 1, 0, 0.2862745, 1,
1.656935, 0.3112832, 0.8663307, 1, 0, 0.282353, 1,
1.676024, 0.1287547, 1.736587, 1, 0, 0.2745098, 1,
1.684737, -0.2400773, 3.118281, 1, 0, 0.2705882, 1,
1.696758, 0.04476146, 0.8722513, 1, 0, 0.2627451, 1,
1.696802, -0.408622, 3.036786, 1, 0, 0.2588235, 1,
1.700852, -0.3490806, 2.026945, 1, 0, 0.2509804, 1,
1.703863, 0.4588593, 3.728716, 1, 0, 0.2470588, 1,
1.707297, -1.40185, 2.492932, 1, 0, 0.2392157, 1,
1.726143, -0.6116531, 1.601938, 1, 0, 0.2352941, 1,
1.728836, 0.108058, 3.812839, 1, 0, 0.227451, 1,
1.729685, -0.4257877, 3.895316, 1, 0, 0.2235294, 1,
1.734347, 1.451991, 1.505943, 1, 0, 0.2156863, 1,
1.752844, 0.7436691, 2.641268, 1, 0, 0.2117647, 1,
1.771824, 1.30056, 1.980516, 1, 0, 0.2039216, 1,
1.780492, 0.6955198, 0.7708192, 1, 0, 0.1960784, 1,
1.780898, -0.3747002, 1.502586, 1, 0, 0.1921569, 1,
1.806921, 0.2308394, 0.7771661, 1, 0, 0.1843137, 1,
1.822333, 0.3644877, 1.099704, 1, 0, 0.1803922, 1,
1.824004, 1.503927, -0.3125174, 1, 0, 0.172549, 1,
1.833109, -0.1952124, 1.270733, 1, 0, 0.1686275, 1,
1.838081, 0.3291633, 1.829467, 1, 0, 0.1607843, 1,
1.85188, 0.3459132, 3.460583, 1, 0, 0.1568628, 1,
1.85323, -0.1487657, -1.095077, 1, 0, 0.1490196, 1,
1.871984, -0.2262643, 1.274421, 1, 0, 0.145098, 1,
1.882511, -0.6561955, 0.8975007, 1, 0, 0.1372549, 1,
1.897419, -0.3496663, 1.162123, 1, 0, 0.1333333, 1,
1.899253, 0.3648153, 1.418491, 1, 0, 0.1254902, 1,
1.968387, 0.7846501, 1.767072, 1, 0, 0.1215686, 1,
1.97207, -0.6694828, 1.320588, 1, 0, 0.1137255, 1,
1.995801, -0.2593183, 1.956825, 1, 0, 0.1098039, 1,
2.055657, -0.9244978, 3.060757, 1, 0, 0.1019608, 1,
2.069137, 0.06928255, 1.459967, 1, 0, 0.09411765, 1,
2.074467, -0.8554512, 2.374921, 1, 0, 0.09019608, 1,
2.085231, -0.2372841, 1.008782, 1, 0, 0.08235294, 1,
2.123699, -0.1115676, 3.971534, 1, 0, 0.07843138, 1,
2.142762, 1.006796, 1.073237, 1, 0, 0.07058824, 1,
2.264044, 0.4040881, 1.689548, 1, 0, 0.06666667, 1,
2.32839, -0.9004874, 3.399288, 1, 0, 0.05882353, 1,
2.378237, -2.108825, 3.313043, 1, 0, 0.05490196, 1,
2.385848, 0.4115493, 0.7545413, 1, 0, 0.04705882, 1,
2.476144, -1.718164, 1.54956, 1, 0, 0.04313726, 1,
2.476198, 1.381, 2.492306, 1, 0, 0.03529412, 1,
2.482994, -1.42182, 2.04386, 1, 0, 0.03137255, 1,
2.636213, -0.3424916, 2.586869, 1, 0, 0.02352941, 1,
2.694881, 0.1759947, 2.574469, 1, 0, 0.01960784, 1,
2.807013, 0.9421442, 0.5443766, 1, 0, 0.01176471, 1,
2.881366, -0.2760976, 1.512626, 1, 0, 0.007843138, 1
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
-0.02494478, -4.518139, -7.2875, 0, -0.5, 0.5, 0.5,
-0.02494478, -4.518139, -7.2875, 1, -0.5, 0.5, 0.5,
-0.02494478, -4.518139, -7.2875, 1, 1.5, 0.5, 0.5,
-0.02494478, -4.518139, -7.2875, 0, 1.5, 0.5, 0.5
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
-3.916495, -0.05367661, -7.2875, 0, -0.5, 0.5, 0.5,
-3.916495, -0.05367661, -7.2875, 1, -0.5, 0.5, 0.5,
-3.916495, -0.05367661, -7.2875, 1, 1.5, 0.5, 0.5,
-3.916495, -0.05367661, -7.2875, 0, 1.5, 0.5, 0.5
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
-3.916495, -4.518139, -0.3141479, 0, -0.5, 0.5, 0.5,
-3.916495, -4.518139, -0.3141479, 1, -0.5, 0.5, 0.5,
-3.916495, -4.518139, -0.3141479, 1, 1.5, 0.5, 0.5,
-3.916495, -4.518139, -0.3141479, 0, 1.5, 0.5, 0.5
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
-2, -3.487879, -5.678266,
2, -3.487879, -5.678266,
-2, -3.487879, -5.678266,
-2, -3.659589, -5.946471,
-1, -3.487879, -5.678266,
-1, -3.659589, -5.946471,
0, -3.487879, -5.678266,
0, -3.659589, -5.946471,
1, -3.487879, -5.678266,
1, -3.659589, -5.946471,
2, -3.487879, -5.678266,
2, -3.659589, -5.946471
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
-2, -4.003009, -6.482883, 0, -0.5, 0.5, 0.5,
-2, -4.003009, -6.482883, 1, -0.5, 0.5, 0.5,
-2, -4.003009, -6.482883, 1, 1.5, 0.5, 0.5,
-2, -4.003009, -6.482883, 0, 1.5, 0.5, 0.5,
-1, -4.003009, -6.482883, 0, -0.5, 0.5, 0.5,
-1, -4.003009, -6.482883, 1, -0.5, 0.5, 0.5,
-1, -4.003009, -6.482883, 1, 1.5, 0.5, 0.5,
-1, -4.003009, -6.482883, 0, 1.5, 0.5, 0.5,
0, -4.003009, -6.482883, 0, -0.5, 0.5, 0.5,
0, -4.003009, -6.482883, 1, -0.5, 0.5, 0.5,
0, -4.003009, -6.482883, 1, 1.5, 0.5, 0.5,
0, -4.003009, -6.482883, 0, 1.5, 0.5, 0.5,
1, -4.003009, -6.482883, 0, -0.5, 0.5, 0.5,
1, -4.003009, -6.482883, 1, -0.5, 0.5, 0.5,
1, -4.003009, -6.482883, 1, 1.5, 0.5, 0.5,
1, -4.003009, -6.482883, 0, 1.5, 0.5, 0.5,
2, -4.003009, -6.482883, 0, -0.5, 0.5, 0.5,
2, -4.003009, -6.482883, 1, -0.5, 0.5, 0.5,
2, -4.003009, -6.482883, 1, 1.5, 0.5, 0.5,
2, -4.003009, -6.482883, 0, 1.5, 0.5, 0.5
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
-3.018445, -3, -5.678266,
-3.018445, 3, -5.678266,
-3.018445, -3, -5.678266,
-3.16812, -3, -5.946471,
-3.018445, -2, -5.678266,
-3.16812, -2, -5.946471,
-3.018445, -1, -5.678266,
-3.16812, -1, -5.946471,
-3.018445, 0, -5.678266,
-3.16812, 0, -5.946471,
-3.018445, 1, -5.678266,
-3.16812, 1, -5.946471,
-3.018445, 2, -5.678266,
-3.16812, 2, -5.946471,
-3.018445, 3, -5.678266,
-3.16812, 3, -5.946471
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
-3.46747, -3, -6.482883, 0, -0.5, 0.5, 0.5,
-3.46747, -3, -6.482883, 1, -0.5, 0.5, 0.5,
-3.46747, -3, -6.482883, 1, 1.5, 0.5, 0.5,
-3.46747, -3, -6.482883, 0, 1.5, 0.5, 0.5,
-3.46747, -2, -6.482883, 0, -0.5, 0.5, 0.5,
-3.46747, -2, -6.482883, 1, -0.5, 0.5, 0.5,
-3.46747, -2, -6.482883, 1, 1.5, 0.5, 0.5,
-3.46747, -2, -6.482883, 0, 1.5, 0.5, 0.5,
-3.46747, -1, -6.482883, 0, -0.5, 0.5, 0.5,
-3.46747, -1, -6.482883, 1, -0.5, 0.5, 0.5,
-3.46747, -1, -6.482883, 1, 1.5, 0.5, 0.5,
-3.46747, -1, -6.482883, 0, 1.5, 0.5, 0.5,
-3.46747, 0, -6.482883, 0, -0.5, 0.5, 0.5,
-3.46747, 0, -6.482883, 1, -0.5, 0.5, 0.5,
-3.46747, 0, -6.482883, 1, 1.5, 0.5, 0.5,
-3.46747, 0, -6.482883, 0, 1.5, 0.5, 0.5,
-3.46747, 1, -6.482883, 0, -0.5, 0.5, 0.5,
-3.46747, 1, -6.482883, 1, -0.5, 0.5, 0.5,
-3.46747, 1, -6.482883, 1, 1.5, 0.5, 0.5,
-3.46747, 1, -6.482883, 0, 1.5, 0.5, 0.5,
-3.46747, 2, -6.482883, 0, -0.5, 0.5, 0.5,
-3.46747, 2, -6.482883, 1, -0.5, 0.5, 0.5,
-3.46747, 2, -6.482883, 1, 1.5, 0.5, 0.5,
-3.46747, 2, -6.482883, 0, 1.5, 0.5, 0.5,
-3.46747, 3, -6.482883, 0, -0.5, 0.5, 0.5,
-3.46747, 3, -6.482883, 1, -0.5, 0.5, 0.5,
-3.46747, 3, -6.482883, 1, 1.5, 0.5, 0.5,
-3.46747, 3, -6.482883, 0, 1.5, 0.5, 0.5
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
-3.018445, -3.487879, -4,
-3.018445, -3.487879, 4,
-3.018445, -3.487879, -4,
-3.16812, -3.659589, -4,
-3.018445, -3.487879, -2,
-3.16812, -3.659589, -2,
-3.018445, -3.487879, 0,
-3.16812, -3.659589, 0,
-3.018445, -3.487879, 2,
-3.16812, -3.659589, 2,
-3.018445, -3.487879, 4,
-3.16812, -3.659589, 4
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
-3.46747, -4.003009, -4, 0, -0.5, 0.5, 0.5,
-3.46747, -4.003009, -4, 1, -0.5, 0.5, 0.5,
-3.46747, -4.003009, -4, 1, 1.5, 0.5, 0.5,
-3.46747, -4.003009, -4, 0, 1.5, 0.5, 0.5,
-3.46747, -4.003009, -2, 0, -0.5, 0.5, 0.5,
-3.46747, -4.003009, -2, 1, -0.5, 0.5, 0.5,
-3.46747, -4.003009, -2, 1, 1.5, 0.5, 0.5,
-3.46747, -4.003009, -2, 0, 1.5, 0.5, 0.5,
-3.46747, -4.003009, 0, 0, -0.5, 0.5, 0.5,
-3.46747, -4.003009, 0, 1, -0.5, 0.5, 0.5,
-3.46747, -4.003009, 0, 1, 1.5, 0.5, 0.5,
-3.46747, -4.003009, 0, 0, 1.5, 0.5, 0.5,
-3.46747, -4.003009, 2, 0, -0.5, 0.5, 0.5,
-3.46747, -4.003009, 2, 1, -0.5, 0.5, 0.5,
-3.46747, -4.003009, 2, 1, 1.5, 0.5, 0.5,
-3.46747, -4.003009, 2, 0, 1.5, 0.5, 0.5,
-3.46747, -4.003009, 4, 0, -0.5, 0.5, 0.5,
-3.46747, -4.003009, 4, 1, -0.5, 0.5, 0.5,
-3.46747, -4.003009, 4, 1, 1.5, 0.5, 0.5,
-3.46747, -4.003009, 4, 0, 1.5, 0.5, 0.5
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
-3.018445, -3.487879, -5.678266,
-3.018445, 3.380526, -5.678266,
-3.018445, -3.487879, 5.04997,
-3.018445, 3.380526, 5.04997,
-3.018445, -3.487879, -5.678266,
-3.018445, -3.487879, 5.04997,
-3.018445, 3.380526, -5.678266,
-3.018445, 3.380526, 5.04997,
-3.018445, -3.487879, -5.678266,
2.968555, -3.487879, -5.678266,
-3.018445, -3.487879, 5.04997,
2.968555, -3.487879, 5.04997,
-3.018445, 3.380526, -5.678266,
2.968555, 3.380526, -5.678266,
-3.018445, 3.380526, 5.04997,
2.968555, 3.380526, 5.04997,
2.968555, -3.487879, -5.678266,
2.968555, 3.380526, -5.678266,
2.968555, -3.487879, 5.04997,
2.968555, 3.380526, 5.04997,
2.968555, -3.487879, -5.678266,
2.968555, -3.487879, 5.04997,
2.968555, 3.380526, -5.678266,
2.968555, 3.380526, 5.04997
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
var radius = 7.515938;
var distance = 33.43926;
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
mvMatrix.translate( 0.02494478, 0.05367661, 0.3141479 );
mvMatrix.scale( 1.357338, 1.183154, 0.757476 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.43926);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
H2N<-read.table("H2N.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-H2N$V2
```

```
## Error in eval(expr, envir, enclos): object 'H2N' not found
```

```r
y<-H2N$V3
```

```
## Error in eval(expr, envir, enclos): object 'H2N' not found
```

```r
z<-H2N$V4
```

```
## Error in eval(expr, envir, enclos): object 'H2N' not found
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
-2.931255, -0.008102553, -0.830435, 0, 0, 1, 1, 1,
-2.836374, 0.7264293, -2.16847, 1, 0, 0, 1, 1,
-2.707102, -0.2191612, -0.5104865, 1, 0, 0, 1, 1,
-2.680659, 0.1778467, -0.39448, 1, 0, 0, 1, 1,
-2.655477, -0.4674278, -2.436845, 1, 0, 0, 1, 1,
-2.545692, -0.4751668, -2.757166, 1, 0, 0, 1, 1,
-2.544252, -0.2838275, -2.849024, 0, 0, 0, 1, 1,
-2.466966, -0.9788974, -1.060529, 0, 0, 0, 1, 1,
-2.40331, 1.400251, -2.440465, 0, 0, 0, 1, 1,
-2.364367, -0.8686481, -0.6032185, 0, 0, 0, 1, 1,
-2.272287, 0.06191741, -0.6880372, 0, 0, 0, 1, 1,
-2.246611, 1.613308, -1.57979, 0, 0, 0, 1, 1,
-2.194061, 0.8751585, 0.2347941, 0, 0, 0, 1, 1,
-2.183453, 0.4093666, -2.905168, 1, 1, 1, 1, 1,
-2.170157, -0.2022317, -2.07476, 1, 1, 1, 1, 1,
-2.166314, 0.801555, 0.05126158, 1, 1, 1, 1, 1,
-2.156432, -0.03878778, -0.6120188, 1, 1, 1, 1, 1,
-2.146675, -0.5600127, -2.494562, 1, 1, 1, 1, 1,
-2.119312, 0.5218938, -2.408159, 1, 1, 1, 1, 1,
-2.116186, 0.5574526, -0.3617078, 1, 1, 1, 1, 1,
-2.093186, 2.242134, -1.93747, 1, 1, 1, 1, 1,
-2.063057, -1.56376, -2.608929, 1, 1, 1, 1, 1,
-2.050108, -1.172805, -3.2208, 1, 1, 1, 1, 1,
-1.975161, -1.370155, -2.466902, 1, 1, 1, 1, 1,
-1.938648, -0.259528, -1.330335, 1, 1, 1, 1, 1,
-1.925839, 1.190083, 0.2543931, 1, 1, 1, 1, 1,
-1.918953, -1.14443, -2.678299, 1, 1, 1, 1, 1,
-1.903432, -0.2565348, -2.349722, 1, 1, 1, 1, 1,
-1.887849, 0.02353651, -2.693624, 0, 0, 1, 1, 1,
-1.87833, -0.5534709, -0.4435391, 1, 0, 0, 1, 1,
-1.862737, 0.3411809, -0.6226021, 1, 0, 0, 1, 1,
-1.850074, 0.4044587, -2.98474, 1, 0, 0, 1, 1,
-1.845846, 0.3774609, 0.5903281, 1, 0, 0, 1, 1,
-1.827074, 0.2245313, -2.005294, 1, 0, 0, 1, 1,
-1.815463, 0.665267, -2.635106, 0, 0, 0, 1, 1,
-1.804969, 0.7366052, -1.231236, 0, 0, 0, 1, 1,
-1.803575, 0.09738459, -2.110715, 0, 0, 0, 1, 1,
-1.802707, -0.3359818, -0.5471479, 0, 0, 0, 1, 1,
-1.794696, -0.05986542, -2.452037, 0, 0, 0, 1, 1,
-1.785065, -0.0006671475, -1.500301, 0, 0, 0, 1, 1,
-1.732723, 1.278849, -2.791374, 0, 0, 0, 1, 1,
-1.730056, -1.011015, -2.880442, 1, 1, 1, 1, 1,
-1.727434, -0.8408671, -4.709432, 1, 1, 1, 1, 1,
-1.708824, -0.8452822, -1.009354, 1, 1, 1, 1, 1,
-1.708233, 0.3519543, -0.6235167, 1, 1, 1, 1, 1,
-1.698285, -0.3090986, -1.054421, 1, 1, 1, 1, 1,
-1.694735, -0.5915018, -1.793236, 1, 1, 1, 1, 1,
-1.687919, 0.4757782, -4.121702, 1, 1, 1, 1, 1,
-1.65679, 0.2700612, -2.201059, 1, 1, 1, 1, 1,
-1.644501, 0.3706633, -0.5823773, 1, 1, 1, 1, 1,
-1.635753, 1.192452, 0.1330976, 1, 1, 1, 1, 1,
-1.633939, 0.3317631, -2.616198, 1, 1, 1, 1, 1,
-1.63281, -0.1152405, -0.9973842, 1, 1, 1, 1, 1,
-1.62592, -0.2309173, -1.868326, 1, 1, 1, 1, 1,
-1.622138, 0.2131554, -1.555644, 1, 1, 1, 1, 1,
-1.617938, 2.226161, -1.225706, 1, 1, 1, 1, 1,
-1.616044, -1.270085, -2.174994, 0, 0, 1, 1, 1,
-1.605346, -0.2857826, -1.649125, 1, 0, 0, 1, 1,
-1.594239, 1.094944, 0.6449078, 1, 0, 0, 1, 1,
-1.590659, -1.213324, -3.587682, 1, 0, 0, 1, 1,
-1.569292, 0.2385708, -0.8250448, 1, 0, 0, 1, 1,
-1.549053, 0.5295765, -2.296055, 1, 0, 0, 1, 1,
-1.528431, -1.713796, -2.56269, 0, 0, 0, 1, 1,
-1.527634, 0.2901303, -2.612101, 0, 0, 0, 1, 1,
-1.513491, 1.984723, 0.2605434, 0, 0, 0, 1, 1,
-1.508446, 0.09789107, -0.8834222, 0, 0, 0, 1, 1,
-1.493842, -0.8003449, -1.990629, 0, 0, 0, 1, 1,
-1.482311, 0.7183123, -1.262087, 0, 0, 0, 1, 1,
-1.48191, 0.293913, -1.581164, 0, 0, 0, 1, 1,
-1.454027, 0.3904436, 0.0833844, 1, 1, 1, 1, 1,
-1.452346, 0.06452789, -1.865773, 1, 1, 1, 1, 1,
-1.440623, 1.616205, -0.6977534, 1, 1, 1, 1, 1,
-1.430131, -0.8893965, -2.818826, 1, 1, 1, 1, 1,
-1.425927, -0.02768333, -3.614253, 1, 1, 1, 1, 1,
-1.425261, 0.1299097, 0.2397835, 1, 1, 1, 1, 1,
-1.422368, -0.7962774, -2.572774, 1, 1, 1, 1, 1,
-1.420042, 0.8367568, 0.9935836, 1, 1, 1, 1, 1,
-1.418577, 0.2265721, -0.7961597, 1, 1, 1, 1, 1,
-1.41848, -2.082909, -2.084751, 1, 1, 1, 1, 1,
-1.402844, 1.058699, 0.6894941, 1, 1, 1, 1, 1,
-1.399654, 0.7314223, -2.085382, 1, 1, 1, 1, 1,
-1.395772, -1.010649, -1.620568, 1, 1, 1, 1, 1,
-1.394064, 0.03914316, -0.2622465, 1, 1, 1, 1, 1,
-1.393048, 0.492305, -0.4172932, 1, 1, 1, 1, 1,
-1.38911, 0.2642909, -2.378656, 0, 0, 1, 1, 1,
-1.363127, 1.602787, -1.517137, 1, 0, 0, 1, 1,
-1.357615, 0.1399139, -2.168254, 1, 0, 0, 1, 1,
-1.347459, 0.2200339, -1.344246, 1, 0, 0, 1, 1,
-1.329396, -1.704773, -2.251598, 1, 0, 0, 1, 1,
-1.326443, 1.383759, 0.07544357, 1, 0, 0, 1, 1,
-1.326276, -0.3431286, -2.534772, 0, 0, 0, 1, 1,
-1.324025, -1.612748, -1.941061, 0, 0, 0, 1, 1,
-1.313064, -0.669009, -2.593358, 0, 0, 0, 1, 1,
-1.310051, -0.8665686, -3.62491, 0, 0, 0, 1, 1,
-1.303892, -0.7128845, -2.554002, 0, 0, 0, 1, 1,
-1.301028, -0.5900832, -0.9757265, 0, 0, 0, 1, 1,
-1.297111, -0.5009981, -3.130251, 0, 0, 0, 1, 1,
-1.296474, -1.282008, -1.814082, 1, 1, 1, 1, 1,
-1.292274, 2.485362, 0.5255687, 1, 1, 1, 1, 1,
-1.286258, -0.5423409, -1.211854, 1, 1, 1, 1, 1,
-1.284557, 2.077316, 0.9943189, 1, 1, 1, 1, 1,
-1.279965, 0.5652305, -2.106566, 1, 1, 1, 1, 1,
-1.263471, 0.5417499, -1.305308, 1, 1, 1, 1, 1,
-1.252552, -1.249957, -2.328638, 1, 1, 1, 1, 1,
-1.23999, 0.133751, -1.831402, 1, 1, 1, 1, 1,
-1.239803, 0.006538151, -0.1777598, 1, 1, 1, 1, 1,
-1.236564, -1.336527, -2.016128, 1, 1, 1, 1, 1,
-1.234937, -0.7250777, -1.670732, 1, 1, 1, 1, 1,
-1.228175, 0.8561438, -0.8183131, 1, 1, 1, 1, 1,
-1.221097, 0.6328602, -1.203466, 1, 1, 1, 1, 1,
-1.218629, 2.147869, -0.9812075, 1, 1, 1, 1, 1,
-1.205548, -1.042139, -1.96727, 1, 1, 1, 1, 1,
-1.198715, -0.2991216, -0.6469939, 0, 0, 1, 1, 1,
-1.196271, 0.15232, -0.9330007, 1, 0, 0, 1, 1,
-1.194594, -1.580034, -3.233219, 1, 0, 0, 1, 1,
-1.194436, 0.07363979, -0.475612, 1, 0, 0, 1, 1,
-1.192716, 1.488727, -0.08557196, 1, 0, 0, 1, 1,
-1.192529, 1.458013, -0.9896583, 1, 0, 0, 1, 1,
-1.189343, -0.1659163, -2.256662, 0, 0, 0, 1, 1,
-1.180452, 0.03980063, -0.1793318, 0, 0, 0, 1, 1,
-1.170949, -0.8903257, -2.991694, 0, 0, 0, 1, 1,
-1.166409, -0.4035663, -1.265768, 0, 0, 0, 1, 1,
-1.160606, -0.3629087, -0.9337654, 0, 0, 0, 1, 1,
-1.152841, 1.973167, -1.517073, 0, 0, 0, 1, 1,
-1.152338, 0.1738156, -0.3484671, 0, 0, 0, 1, 1,
-1.152272, -0.1224068, -0.4964824, 1, 1, 1, 1, 1,
-1.150738, -0.8251228, -1.435409, 1, 1, 1, 1, 1,
-1.14928, -1.153999, -0.9641246, 1, 1, 1, 1, 1,
-1.138501, 0.09659586, -0.4219879, 1, 1, 1, 1, 1,
-1.132887, 0.4090126, -0.4332545, 1, 1, 1, 1, 1,
-1.128933, 1.004553, -0.4809021, 1, 1, 1, 1, 1,
-1.126392, -1.568855, -1.731915, 1, 1, 1, 1, 1,
-1.125089, 0.09748746, -1.873458, 1, 1, 1, 1, 1,
-1.123038, 0.7187092, 0.05198871, 1, 1, 1, 1, 1,
-1.113345, 2.062353, -0.706883, 1, 1, 1, 1, 1,
-1.11163, 0.5787932, -0.9090676, 1, 1, 1, 1, 1,
-1.110112, 0.588821, -0.6424935, 1, 1, 1, 1, 1,
-1.108104, -1.575879, -2.789144, 1, 1, 1, 1, 1,
-1.100738, 0.3413615, -1.786377, 1, 1, 1, 1, 1,
-1.097918, 1.060649, -0.2726748, 1, 1, 1, 1, 1,
-1.09493, 1.293335, -0.9356029, 0, 0, 1, 1, 1,
-1.086683, -0.84072, -2.603303, 1, 0, 0, 1, 1,
-1.085933, -0.4458841, -1.096944, 1, 0, 0, 1, 1,
-1.080132, -0.8452206, -3.571961, 1, 0, 0, 1, 1,
-1.078256, 0.5026559, -1.538402, 1, 0, 0, 1, 1,
-1.075348, 1.545572, -0.5208765, 1, 0, 0, 1, 1,
-1.075335, -0.256065, -2.84549, 0, 0, 0, 1, 1,
-1.062732, -0.06588498, -1.348953, 0, 0, 0, 1, 1,
-1.060212, 1.409607, -1.655378, 0, 0, 0, 1, 1,
-1.056584, 0.7378943, -1.779407, 0, 0, 0, 1, 1,
-1.036506, -0.3325572, -1.620188, 0, 0, 0, 1, 1,
-1.034486, -0.1274554, -1.351514, 0, 0, 0, 1, 1,
-1.034418, -0.8330563, -3.001399, 0, 0, 0, 1, 1,
-1.033557, 1.22156, -2.124989, 1, 1, 1, 1, 1,
-1.030835, 0.8488274, -1.034437, 1, 1, 1, 1, 1,
-1.028264, -0.2384966, -0.3760186, 1, 1, 1, 1, 1,
-1.024828, -0.370071, -2.929147, 1, 1, 1, 1, 1,
-1.023604, 0.1101832, -0.9993278, 1, 1, 1, 1, 1,
-1.023289, 0.7715601, -1.566928, 1, 1, 1, 1, 1,
-1.017621, 1.603276, -0.5137335, 1, 1, 1, 1, 1,
-1.015967, 0.03616858, -0.8896548, 1, 1, 1, 1, 1,
-1.007637, -1.109374, -2.534511, 1, 1, 1, 1, 1,
-1.007472, 1.898319, -1.323965, 1, 1, 1, 1, 1,
-1.00503, -1.363349, -2.720178, 1, 1, 1, 1, 1,
-0.9915599, -0.1631658, -2.153658, 1, 1, 1, 1, 1,
-0.9891636, 0.5539743, -0.9027146, 1, 1, 1, 1, 1,
-0.9868123, 0.6711583, -1.55756, 1, 1, 1, 1, 1,
-0.9817231, -1.449239, -3.158931, 1, 1, 1, 1, 1,
-0.977421, 0.4544005, -1.554678, 0, 0, 1, 1, 1,
-0.9699525, -1.398811, -3.130922, 1, 0, 0, 1, 1,
-0.9613864, -0.02701572, -1.473695, 1, 0, 0, 1, 1,
-0.955196, 1.091663, -0.1081999, 1, 0, 0, 1, 1,
-0.943857, -0.8174093, -0.8044077, 1, 0, 0, 1, 1,
-0.9424043, -1.090776, -3.313033, 1, 0, 0, 1, 1,
-0.9402286, 1.089364, 0.9949215, 0, 0, 0, 1, 1,
-0.9387485, 2.887581, 0.9098133, 0, 0, 0, 1, 1,
-0.9387011, 0.1172311, -2.15826, 0, 0, 0, 1, 1,
-0.9360077, -0.2166597, -1.284907, 0, 0, 0, 1, 1,
-0.9306443, 2.127966, -0.9117113, 0, 0, 0, 1, 1,
-0.921979, -0.9492206, -2.881341, 0, 0, 0, 1, 1,
-0.9093026, 0.2016197, -0.2224566, 0, 0, 0, 1, 1,
-0.9054937, -0.05803421, -1.779495, 1, 1, 1, 1, 1,
-0.9050368, 0.1324043, -1.019332, 1, 1, 1, 1, 1,
-0.903379, -0.6307164, -3.011856, 1, 1, 1, 1, 1,
-0.9033465, -0.1359853, 0.1428498, 1, 1, 1, 1, 1,
-0.9023002, -1.485026, -3.697957, 1, 1, 1, 1, 1,
-0.8976399, 0.9656691, -2.443158, 1, 1, 1, 1, 1,
-0.8905181, 0.03896407, -1.231151, 1, 1, 1, 1, 1,
-0.8894994, 0.7231967, -0.820324, 1, 1, 1, 1, 1,
-0.8887634, -0.4626657, -2.523168, 1, 1, 1, 1, 1,
-0.8882965, -0.8886952, -0.8075308, 1, 1, 1, 1, 1,
-0.8859993, 0.8579322, 0.5409125, 1, 1, 1, 1, 1,
-0.8854904, 1.519551, -1.18961, 1, 1, 1, 1, 1,
-0.8825987, -1.077813, -2.013102, 1, 1, 1, 1, 1,
-0.8807952, 1.718014, 0.2604223, 1, 1, 1, 1, 1,
-0.8773883, 0.5043558, -2.887555, 1, 1, 1, 1, 1,
-0.876377, -0.374757, -3.016932, 0, 0, 1, 1, 1,
-0.8740803, -0.3457973, -3.123121, 1, 0, 0, 1, 1,
-0.8726239, -0.1868152, -2.152907, 1, 0, 0, 1, 1,
-0.8713947, 0.2832622, -1.97695, 1, 0, 0, 1, 1,
-0.8627145, -0.175134, -1.056351, 1, 0, 0, 1, 1,
-0.8589125, 0.9611854, -1.49756, 1, 0, 0, 1, 1,
-0.8463425, 1.404695, 0.8028982, 0, 0, 0, 1, 1,
-0.8386232, -0.7667864, -2.382027, 0, 0, 0, 1, 1,
-0.8360992, 1.099108, 0.3380024, 0, 0, 0, 1, 1,
-0.8332084, -0.5644016, -1.665824, 0, 0, 0, 1, 1,
-0.8300642, 1.501499, -1.304828, 0, 0, 0, 1, 1,
-0.8294142, -0.08421429, -1.678592, 0, 0, 0, 1, 1,
-0.8287733, -0.6446183, -0.1074624, 0, 0, 0, 1, 1,
-0.8238117, 1.156843, -0.403117, 1, 1, 1, 1, 1,
-0.8214036, -0.1908645, -1.902147, 1, 1, 1, 1, 1,
-0.8137078, 0.4310118, -1.102261, 1, 1, 1, 1, 1,
-0.8136207, -0.2688121, -1.639369, 1, 1, 1, 1, 1,
-0.8121232, -2.163472, -2.279618, 1, 1, 1, 1, 1,
-0.8013266, -0.2154283, -1.169117, 1, 1, 1, 1, 1,
-0.7971205, -0.7863501, -3.7423, 1, 1, 1, 1, 1,
-0.796168, -1.174646, -1.659289, 1, 1, 1, 1, 1,
-0.7959761, 1.692119, -0.03291231, 1, 1, 1, 1, 1,
-0.7953633, 0.4648842, -0.6035416, 1, 1, 1, 1, 1,
-0.7947237, -0.1037664, -1.678131, 1, 1, 1, 1, 1,
-0.7945408, -0.8481858, -2.648648, 1, 1, 1, 1, 1,
-0.7912959, 0.6684585, -3.378279, 1, 1, 1, 1, 1,
-0.7886149, 1.50261, -1.410468, 1, 1, 1, 1, 1,
-0.7850501, -0.7305931, -2.12222, 1, 1, 1, 1, 1,
-0.7784104, 0.9294035, -0.4876651, 0, 0, 1, 1, 1,
-0.7760472, 0.1175827, 0.2403031, 1, 0, 0, 1, 1,
-0.7716821, 0.2511139, -1.373888, 1, 0, 0, 1, 1,
-0.7695535, -2.28084, -2.309469, 1, 0, 0, 1, 1,
-0.7680271, 0.7448111, -1.440579, 1, 0, 0, 1, 1,
-0.7662099, -0.03633361, -3.219182, 1, 0, 0, 1, 1,
-0.7637718, -0.3639477, -0.711737, 0, 0, 0, 1, 1,
-0.7604113, -1.790623, -2.745602, 0, 0, 0, 1, 1,
-0.7597776, -0.5956778, -1.511043, 0, 0, 0, 1, 1,
-0.7547368, 1.368888, -0.2154003, 0, 0, 0, 1, 1,
-0.7545656, -2.10396, -4.508747, 0, 0, 0, 1, 1,
-0.7541605, -0.5964435, -0.6200017, 0, 0, 0, 1, 1,
-0.7482374, 1.237386, -0.1113336, 0, 0, 0, 1, 1,
-0.7475405, -0.06756724, -4.847351, 1, 1, 1, 1, 1,
-0.7370146, -0.6751494, -3.196681, 1, 1, 1, 1, 1,
-0.7316523, 0.7496653, -3.098171, 1, 1, 1, 1, 1,
-0.7302374, 0.378561, -2.363025, 1, 1, 1, 1, 1,
-0.7299944, -0.8016317, -0.9941519, 1, 1, 1, 1, 1,
-0.7284452, 1.238044, -0.6558396, 1, 1, 1, 1, 1,
-0.723448, 0.3660947, -2.506906, 1, 1, 1, 1, 1,
-0.7191314, 0.5042826, -1.629267, 1, 1, 1, 1, 1,
-0.7179359, 1.205429, -1.571946, 1, 1, 1, 1, 1,
-0.7166174, 0.3542149, -1.907922, 1, 1, 1, 1, 1,
-0.7114162, 0.5981188, 2.073834, 1, 1, 1, 1, 1,
-0.7093355, 0.2197162, -2.465161, 1, 1, 1, 1, 1,
-0.7069387, -0.1914197, -2.405838, 1, 1, 1, 1, 1,
-0.7022999, 1.652431, -1.307223, 1, 1, 1, 1, 1,
-0.6990066, -0.167445, 0.6076456, 1, 1, 1, 1, 1,
-0.6981764, 0.0654059, -2.541892, 0, 0, 1, 1, 1,
-0.692426, -0.2696866, -1.94139, 1, 0, 0, 1, 1,
-0.688641, -0.8725253, -1.642737, 1, 0, 0, 1, 1,
-0.6877987, -0.9572458, -2.560006, 1, 0, 0, 1, 1,
-0.6877653, 1.097402, -0.03684411, 1, 0, 0, 1, 1,
-0.685688, 0.0871821, -1.977817, 1, 0, 0, 1, 1,
-0.6850703, 1.107742, -3.622059, 0, 0, 0, 1, 1,
-0.6739355, -0.3318219, -2.981948, 0, 0, 0, 1, 1,
-0.6736056, 0.5474557, -1.905444, 0, 0, 0, 1, 1,
-0.671838, -1.310006, -2.259414, 0, 0, 0, 1, 1,
-0.6699933, -0.140364, -1.113214, 0, 0, 0, 1, 1,
-0.6677748, -0.03648656, -1.545212, 0, 0, 0, 1, 1,
-0.6676922, 0.3374445, -0.6793756, 0, 0, 0, 1, 1,
-0.6655246, -0.3347502, -2.152151, 1, 1, 1, 1, 1,
-0.6621655, 0.281226, -2.820464, 1, 1, 1, 1, 1,
-0.6554375, -1.871261, -3.7272, 1, 1, 1, 1, 1,
-0.6542733, 1.86463, -0.1848048, 1, 1, 1, 1, 1,
-0.6521314, -0.1514447, -2.683026, 1, 1, 1, 1, 1,
-0.6519765, -0.4171271, -2.168004, 1, 1, 1, 1, 1,
-0.6515436, -1.406761, -2.994104, 1, 1, 1, 1, 1,
-0.6485778, 0.2766725, -1.579616, 1, 1, 1, 1, 1,
-0.6412337, 0.1833411, -1.120445, 1, 1, 1, 1, 1,
-0.6340162, 0.5497947, -0.129547, 1, 1, 1, 1, 1,
-0.6339092, -0.7803911, -2.349766, 1, 1, 1, 1, 1,
-0.6318342, -0.8271621, -1.415457, 1, 1, 1, 1, 1,
-0.6312827, 1.366068, 0.8241712, 1, 1, 1, 1, 1,
-0.628665, 0.1535641, -1.924817, 1, 1, 1, 1, 1,
-0.6286206, 0.5322084, -0.5487136, 1, 1, 1, 1, 1,
-0.6241087, -0.4364507, -1.296136, 0, 0, 1, 1, 1,
-0.6236609, 1.7891, -0.8808737, 1, 0, 0, 1, 1,
-0.6146731, -0.1846712, -1.734894, 1, 0, 0, 1, 1,
-0.6117662, -1.035719, -3.437119, 1, 0, 0, 1, 1,
-0.6115505, -0.4879074, -2.005218, 1, 0, 0, 1, 1,
-0.6066467, 0.2420842, -0.8307403, 1, 0, 0, 1, 1,
-0.6049321, -0.831289, -2.925394, 0, 0, 0, 1, 1,
-0.6004164, -1.57255, -2.543177, 0, 0, 0, 1, 1,
-0.5955877, -0.07656568, -2.729755, 0, 0, 0, 1, 1,
-0.5950828, -0.1242605, -3.37721, 0, 0, 0, 1, 1,
-0.5927713, -0.1511927, -1.872396, 0, 0, 0, 1, 1,
-0.5919143, 0.7843552, 0.8455585, 0, 0, 0, 1, 1,
-0.591446, -0.8562825, -1.211136, 0, 0, 0, 1, 1,
-0.5890307, -1.054005, -2.444397, 1, 1, 1, 1, 1,
-0.5862331, -2.281148, -4.484278, 1, 1, 1, 1, 1,
-0.5854952, -0.6090782, -4.51907, 1, 1, 1, 1, 1,
-0.5791619, 0.9339398, 0.6758816, 1, 1, 1, 1, 1,
-0.5766672, -0.3284444, -2.456569, 1, 1, 1, 1, 1,
-0.565613, -0.6674606, -0.7659956, 1, 1, 1, 1, 1,
-0.5652683, -1.037098, -2.781154, 1, 1, 1, 1, 1,
-0.5649502, 1.149957, -0.8621433, 1, 1, 1, 1, 1,
-0.5586454, 0.6529936, 1.357999, 1, 1, 1, 1, 1,
-0.5585724, -0.2087473, -1.323291, 1, 1, 1, 1, 1,
-0.5536577, -0.8310214, -2.251959, 1, 1, 1, 1, 1,
-0.5501879, -0.1746589, -0.9585394, 1, 1, 1, 1, 1,
-0.5484183, 0.4374818, -0.641178, 1, 1, 1, 1, 1,
-0.546517, -0.5789075, -4.383707, 1, 1, 1, 1, 1,
-0.5445426, 0.2908072, -0.005837637, 1, 1, 1, 1, 1,
-0.5342949, -0.409182, -2.521788, 0, 0, 1, 1, 1,
-0.5301537, 2.105453, -0.856891, 1, 0, 0, 1, 1,
-0.5231522, 0.3664903, -0.02847724, 1, 0, 0, 1, 1,
-0.5206639, -1.150225, -3.228333, 1, 0, 0, 1, 1,
-0.5183323, -0.4335783, -2.45007, 1, 0, 0, 1, 1,
-0.5131822, 1.255399, 0.7680745, 1, 0, 0, 1, 1,
-0.5119511, 0.9754118, -0.0137808, 0, 0, 0, 1, 1,
-0.5118723, -0.2901177, -2.756727, 0, 0, 0, 1, 1,
-0.509757, 2.047806, 1.154122, 0, 0, 0, 1, 1,
-0.5091576, -0.6157792, -3.203324, 0, 0, 0, 1, 1,
-0.5089885, -0.3925865, -5.4743, 0, 0, 0, 1, 1,
-0.5066349, 0.3153858, -2.574149, 0, 0, 0, 1, 1,
-0.5053689, -2.269375, -2.807663, 0, 0, 0, 1, 1,
-0.5050763, -2.074696, -2.1164, 1, 1, 1, 1, 1,
-0.5016814, -0.04678088, -2.545801, 1, 1, 1, 1, 1,
-0.5010786, -0.4614099, -1.353499, 1, 1, 1, 1, 1,
-0.4972793, 0.4398548, -0.9802678, 1, 1, 1, 1, 1,
-0.497041, -0.4167932, -0.8255437, 1, 1, 1, 1, 1,
-0.4964365, -0.5058365, -2.365398, 1, 1, 1, 1, 1,
-0.4923437, 0.5823966, 0.437692, 1, 1, 1, 1, 1,
-0.4918448, 0.03940374, 1.24737, 1, 1, 1, 1, 1,
-0.4897582, -0.5446202, -1.529398, 1, 1, 1, 1, 1,
-0.4888491, -1.003367, -2.745718, 1, 1, 1, 1, 1,
-0.4862718, -0.2201928, -0.9906647, 1, 1, 1, 1, 1,
-0.4834713, 0.7645084, -1.659029, 1, 1, 1, 1, 1,
-0.4821952, -0.158802, -3.010776, 1, 1, 1, 1, 1,
-0.4792083, 0.4233983, 0.404975, 1, 1, 1, 1, 1,
-0.4774502, -0.6403188, -2.362207, 1, 1, 1, 1, 1,
-0.4746429, -1.292968, -2.197344, 0, 0, 1, 1, 1,
-0.4694171, 0.2650574, 1.035986, 1, 0, 0, 1, 1,
-0.4691852, 0.01851899, -2.973906, 1, 0, 0, 1, 1,
-0.4686099, -1.134222, -2.789886, 1, 0, 0, 1, 1,
-0.4672781, 0.5102586, -0.1839402, 1, 0, 0, 1, 1,
-0.4664496, 1.328391, 0.4233953, 1, 0, 0, 1, 1,
-0.464953, 0.2822863, -2.110074, 0, 0, 0, 1, 1,
-0.4633107, -1.310348, -2.743797, 0, 0, 0, 1, 1,
-0.4608094, 0.6554091, -0.8547955, 0, 0, 0, 1, 1,
-0.4601704, -1.565747, -3.895254, 0, 0, 0, 1, 1,
-0.4578695, 0.5321714, -2.17883, 0, 0, 0, 1, 1,
-0.4573906, -2.014273, -2.857536, 0, 0, 0, 1, 1,
-0.4535309, 0.2083731, -1.872464, 0, 0, 0, 1, 1,
-0.4474324, -1.860431, -3.391909, 1, 1, 1, 1, 1,
-0.4446657, -0.5958028, -2.731967, 1, 1, 1, 1, 1,
-0.444312, -0.9463521, -1.873553, 1, 1, 1, 1, 1,
-0.4433751, -0.535359, -3.32319, 1, 1, 1, 1, 1,
-0.4401848, 0.827706, 0.3879724, 1, 1, 1, 1, 1,
-0.4392342, 1.949475, 0.04137682, 1, 1, 1, 1, 1,
-0.4379562, 0.3739373, -1.4128, 1, 1, 1, 1, 1,
-0.4325113, 0.8438208, -0.6278728, 1, 1, 1, 1, 1,
-0.4310764, -1.148818, -2.586954, 1, 1, 1, 1, 1,
-0.4270746, -0.3230048, -3.093125, 1, 1, 1, 1, 1,
-0.4225806, -1.567158, -3.855242, 1, 1, 1, 1, 1,
-0.4219417, 2.005512, 0.7036044, 1, 1, 1, 1, 1,
-0.4216119, 1.528554, 0.5375687, 1, 1, 1, 1, 1,
-0.4191888, -0.1734601, -1.751451, 1, 1, 1, 1, 1,
-0.416185, -0.6956102, -3.628862, 1, 1, 1, 1, 1,
-0.4143209, 0.2326331, -1.442911, 0, 0, 1, 1, 1,
-0.4134065, -0.3194291, -2.279739, 1, 0, 0, 1, 1,
-0.4133088, 0.6707627, -0.5837523, 1, 0, 0, 1, 1,
-0.4100312, -1.671662, -1.636116, 1, 0, 0, 1, 1,
-0.408439, -2.235562, -3.476048, 1, 0, 0, 1, 1,
-0.4072203, -0.7467665, -2.957667, 1, 0, 0, 1, 1,
-0.3998615, -1.846224, -5.000501, 0, 0, 0, 1, 1,
-0.3990621, -1.295222, -2.841033, 0, 0, 0, 1, 1,
-0.3973065, 0.7617076, 0.6929203, 0, 0, 0, 1, 1,
-0.3958717, 0.5858739, 0.3681737, 0, 0, 0, 1, 1,
-0.3954428, 0.9991683, 0.9004459, 0, 0, 0, 1, 1,
-0.3944514, -1.771142, -3.655235, 0, 0, 0, 1, 1,
-0.3877782, 0.3083892, -0.822966, 0, 0, 0, 1, 1,
-0.3825677, -0.122812, -2.024742, 1, 1, 1, 1, 1,
-0.3799799, 0.07922144, -2.413845, 1, 1, 1, 1, 1,
-0.3786031, 0.7325075, 0.9652672, 1, 1, 1, 1, 1,
-0.3722362, -0.5817796, -1.273169, 1, 1, 1, 1, 1,
-0.365855, 0.7893645, -1.987279, 1, 1, 1, 1, 1,
-0.3610454, -0.02966457, -1.495608, 1, 1, 1, 1, 1,
-0.3600013, 0.2077488, -0.755926, 1, 1, 1, 1, 1,
-0.3561576, -0.006589476, -1.046059, 1, 1, 1, 1, 1,
-0.3546084, -2.040364, -5.035129, 1, 1, 1, 1, 1,
-0.3541119, -1.298322, -2.215682, 1, 1, 1, 1, 1,
-0.3511896, 1.483685, -0.6441516, 1, 1, 1, 1, 1,
-0.3500803, -0.4167215, -2.941547, 1, 1, 1, 1, 1,
-0.3496218, 1.015166, 0.8918934, 1, 1, 1, 1, 1,
-0.347073, -0.6244, -3.052438, 1, 1, 1, 1, 1,
-0.3459795, -0.9185898, -3.55742, 1, 1, 1, 1, 1,
-0.3448404, -0.1855769, -1.941913, 0, 0, 1, 1, 1,
-0.3412519, 0.9477545, -1.654458, 1, 0, 0, 1, 1,
-0.3370001, -0.08286616, -1.579295, 1, 0, 0, 1, 1,
-0.3362427, 0.4391185, 0.2977808, 1, 0, 0, 1, 1,
-0.3352377, -0.5204582, -2.259099, 1, 0, 0, 1, 1,
-0.3303228, 0.3520109, -1.032729, 1, 0, 0, 1, 1,
-0.3302095, -1.103182, -1.250439, 0, 0, 0, 1, 1,
-0.3243257, -0.1963159, -0.4838103, 0, 0, 0, 1, 1,
-0.320987, 0.9952298, -1.25144, 0, 0, 0, 1, 1,
-0.3198796, -2.159632, -3.389627, 0, 0, 0, 1, 1,
-0.3185317, 0.7333054, -0.9658662, 0, 0, 0, 1, 1,
-0.3129878, -0.485099, -3.335434, 0, 0, 0, 1, 1,
-0.2992375, -0.09405753, -2.861475, 0, 0, 0, 1, 1,
-0.2980359, 0.2497517, -1.725404, 1, 1, 1, 1, 1,
-0.2977203, -0.6078511, -4.282353, 1, 1, 1, 1, 1,
-0.2927748, -0.2415335, -0.5623823, 1, 1, 1, 1, 1,
-0.2885143, -1.064234, -2.811945, 1, 1, 1, 1, 1,
-0.2867132, -0.5686108, -3.017878, 1, 1, 1, 1, 1,
-0.2862664, 0.9541931, 0.08992158, 1, 1, 1, 1, 1,
-0.2850282, -0.2944099, -3.141736, 1, 1, 1, 1, 1,
-0.2840495, -1.453967, -3.152498, 1, 1, 1, 1, 1,
-0.2733578, -0.06908446, -2.169746, 1, 1, 1, 1, 1,
-0.2703895, -1.736979, -2.511473, 1, 1, 1, 1, 1,
-0.2696015, 0.3928016, -2.501087, 1, 1, 1, 1, 1,
-0.2691028, -0.3453398, -1.942458, 1, 1, 1, 1, 1,
-0.2689532, -1.952588, -3.955013, 1, 1, 1, 1, 1,
-0.2687728, -0.188717, -1.314769, 1, 1, 1, 1, 1,
-0.2643915, -0.09240155, -2.072394, 1, 1, 1, 1, 1,
-0.2641686, 3.006084, -0.0279784, 0, 0, 1, 1, 1,
-0.2640106, 0.8878012, -0.2291904, 1, 0, 0, 1, 1,
-0.2608068, -0.3239237, -1.455745, 1, 0, 0, 1, 1,
-0.2596579, 0.3958052, 0.03187227, 1, 0, 0, 1, 1,
-0.2574034, -0.5499342, -0.4237807, 1, 0, 0, 1, 1,
-0.2526502, 0.2206396, 2.061427, 1, 0, 0, 1, 1,
-0.2496541, 0.473404, -0.2052021, 0, 0, 0, 1, 1,
-0.2485222, -0.6252335, -3.023993, 0, 0, 0, 1, 1,
-0.2449446, 0.9369331, 0.8055776, 0, 0, 0, 1, 1,
-0.2435045, 0.6227344, -1.343219, 0, 0, 0, 1, 1,
-0.2428234, -0.632517, -5.522029, 0, 0, 0, 1, 1,
-0.2415865, 1.186185, 0.007351194, 0, 0, 0, 1, 1,
-0.2396048, 1.855604, 0.01577584, 0, 0, 0, 1, 1,
-0.2363498, 0.3657506, -0.9986088, 1, 1, 1, 1, 1,
-0.236341, -0.5884996, -1.539489, 1, 1, 1, 1, 1,
-0.234586, 0.01776442, -0.7433216, 1, 1, 1, 1, 1,
-0.2344102, -0.6051224, -2.022939, 1, 1, 1, 1, 1,
-0.2189743, -0.57213, -3.390446, 1, 1, 1, 1, 1,
-0.2187876, 0.1210566, 1.043215, 1, 1, 1, 1, 1,
-0.2171664, -0.3408879, -4.535741, 1, 1, 1, 1, 1,
-0.2148877, -0.8980981, -3.066789, 1, 1, 1, 1, 1,
-0.2141965, -1.168716, -4.395112, 1, 1, 1, 1, 1,
-0.2141867, 0.6729654, -0.839849, 1, 1, 1, 1, 1,
-0.2129425, -1.103558, -3.359478, 1, 1, 1, 1, 1,
-0.2123204, -0.8114252, -1.947002, 1, 1, 1, 1, 1,
-0.2114213, 0.1014053, -1.681488, 1, 1, 1, 1, 1,
-0.2076512, -0.5051648, -2.411164, 1, 1, 1, 1, 1,
-0.1988321, 1.346666, 0.4622132, 1, 1, 1, 1, 1,
-0.1971042, 1.138146, -2.312471, 0, 0, 1, 1, 1,
-0.196081, -0.2757775, -4.068175, 1, 0, 0, 1, 1,
-0.1912081, -1.718065, -3.390779, 1, 0, 0, 1, 1,
-0.187736, -1.7001, -3.287867, 1, 0, 0, 1, 1,
-0.1853925, -1.379924, -5.240644, 1, 0, 0, 1, 1,
-0.1827852, -1.304676, -2.989405, 1, 0, 0, 1, 1,
-0.1820826, -1.009601, -3.182117, 0, 0, 0, 1, 1,
-0.1819237, 0.101152, -2.019013, 0, 0, 0, 1, 1,
-0.1748291, -0.2447849, -2.841085, 0, 0, 0, 1, 1,
-0.1725496, 0.8854617, -2.427943, 0, 0, 0, 1, 1,
-0.1723885, 0.5729646, 0.2324134, 0, 0, 0, 1, 1,
-0.1686116, -2.382171, -3.319081, 0, 0, 0, 1, 1,
-0.164662, 0.974102, 1.154399, 0, 0, 0, 1, 1,
-0.1631492, -0.3321687, -2.27148, 1, 1, 1, 1, 1,
-0.1589587, 0.6982168, -0.3808869, 1, 1, 1, 1, 1,
-0.1567433, 0.387746, -0.1121286, 1, 1, 1, 1, 1,
-0.1515767, -1.228481, -3.566072, 1, 1, 1, 1, 1,
-0.1492492, -1.105613, -5.155999, 1, 1, 1, 1, 1,
-0.1488079, 0.4793099, 0.297281, 1, 1, 1, 1, 1,
-0.1484909, 1.421117, 1.158852, 1, 1, 1, 1, 1,
-0.1477645, -0.611056, -3.052488, 1, 1, 1, 1, 1,
-0.1475752, -0.7783212, -3.449507, 1, 1, 1, 1, 1,
-0.1470816, 0.8696125, -0.8765793, 1, 1, 1, 1, 1,
-0.1449022, 0.5844809, -0.4398845, 1, 1, 1, 1, 1,
-0.1445743, 0.9327754, 0.3839828, 1, 1, 1, 1, 1,
-0.1386269, 0.05424066, -1.368935, 1, 1, 1, 1, 1,
-0.1385244, 0.473982, -0.1251366, 1, 1, 1, 1, 1,
-0.135216, 1.412633, 0.08860863, 1, 1, 1, 1, 1,
-0.1316567, -0.4981319, -2.36964, 0, 0, 1, 1, 1,
-0.1265676, 0.1900335, -0.5453267, 1, 0, 0, 1, 1,
-0.1214667, 0.9517027, -0.2565148, 1, 0, 0, 1, 1,
-0.1197459, -0.8945634, -3.737144, 1, 0, 0, 1, 1,
-0.1171935, -0.81489, -2.521056, 1, 0, 0, 1, 1,
-0.1139352, 0.8495076, -0.3217204, 1, 0, 0, 1, 1,
-0.1117668, -0.5634705, -2.878854, 0, 0, 0, 1, 1,
-0.1113537, 0.6219547, 0.8170222, 0, 0, 0, 1, 1,
-0.1099746, -1.115941, -2.384974, 0, 0, 0, 1, 1,
-0.1024127, 1.693305, -0.004251688, 0, 0, 0, 1, 1,
-0.1014736, -0.1463237, -2.260562, 0, 0, 0, 1, 1,
-0.1008406, 1.477161, -0.07521804, 0, 0, 0, 1, 1,
-0.0975955, -0.2713438, -3.99255, 0, 0, 0, 1, 1,
-0.09284873, -0.8710042, -4.768134, 1, 1, 1, 1, 1,
-0.0924807, -1.930053, -3.14115, 1, 1, 1, 1, 1,
-0.09197085, -0.2756248, -2.893787, 1, 1, 1, 1, 1,
-0.08767275, 1.548038, -0.8895773, 1, 1, 1, 1, 1,
-0.08607922, -0.1777288, -2.960046, 1, 1, 1, 1, 1,
-0.08426219, 1.54602, 0.66171, 1, 1, 1, 1, 1,
-0.08218917, -1.042298, -1.683442, 1, 1, 1, 1, 1,
-0.08059226, -0.00565603, -0.1304878, 1, 1, 1, 1, 1,
-0.07386751, -1.19024, -2.859226, 1, 1, 1, 1, 1,
-0.07185141, -0.4215025, -2.964478, 1, 1, 1, 1, 1,
-0.07026339, -0.4405586, -3.455707, 1, 1, 1, 1, 1,
-0.06629506, -0.7339315, -4.066318, 1, 1, 1, 1, 1,
-0.06590173, 0.295856, -0.8100242, 1, 1, 1, 1, 1,
-0.0645884, -0.3128795, -3.080719, 1, 1, 1, 1, 1,
-0.06269614, -1.829801, -1.967939, 1, 1, 1, 1, 1,
-0.05413702, 1.578734, -1.30093, 0, 0, 1, 1, 1,
-0.05253421, -1.08826, -2.122108, 1, 0, 0, 1, 1,
-0.05178291, -1.182635, -4.966133, 1, 0, 0, 1, 1,
-0.0474999, -0.9902967, -2.451159, 1, 0, 0, 1, 1,
-0.04049121, -0.4751146, -2.496538, 1, 0, 0, 1, 1,
-0.03601896, 0.6734173, -2.158354, 1, 0, 0, 1, 1,
-0.03439639, 0.1525863, -0.4030252, 0, 0, 0, 1, 1,
-0.02191923, 0.2131756, 1.084134, 0, 0, 0, 1, 1,
-0.0205078, 0.7315478, 0.7266318, 0, 0, 0, 1, 1,
-0.01974851, -0.9127172, -4.520939, 0, 0, 0, 1, 1,
-0.01805493, -0.4090452, -1.624991, 0, 0, 0, 1, 1,
-0.01575514, -0.5707284, -1.882307, 0, 0, 0, 1, 1,
-0.01438281, -0.9582292, -3.527122, 0, 0, 0, 1, 1,
-0.0113922, -0.02054286, -2.392879, 1, 1, 1, 1, 1,
-0.008521794, -1.781419, -4.377395, 1, 1, 1, 1, 1,
-0.007983281, 0.5499831, 1.28233, 1, 1, 1, 1, 1,
-0.006848693, 1.871969, -0.3478459, 1, 1, 1, 1, 1,
-0.001166492, -0.2799962, -2.516021, 1, 1, 1, 1, 1,
0.002454992, -1.749512, 3.059835, 1, 1, 1, 1, 1,
0.002667367, -1.089938, 3.144695, 1, 1, 1, 1, 1,
0.00273467, -0.2349899, 3.375211, 1, 1, 1, 1, 1,
0.003964997, 0.7650458, -1.164508, 1, 1, 1, 1, 1,
0.006568117, 0.8589473, -0.2370542, 1, 1, 1, 1, 1,
0.00853583, 0.7670819, 0.03489719, 1, 1, 1, 1, 1,
0.008546066, -0.1283246, 3.407753, 1, 1, 1, 1, 1,
0.01041968, 0.9196591, 0.7451965, 1, 1, 1, 1, 1,
0.01215572, 0.3699982, -0.03033973, 1, 1, 1, 1, 1,
0.01544675, 0.8409709, 1.157087, 1, 1, 1, 1, 1,
0.02395824, 0.4899181, -0.5700892, 0, 0, 1, 1, 1,
0.02706911, 0.6584471, 0.9070171, 1, 0, 0, 1, 1,
0.02877033, -0.3688545, 4.359268, 1, 0, 0, 1, 1,
0.0298895, -0.04172996, 2.391331, 1, 0, 0, 1, 1,
0.03083083, -0.6594981, 2.957231, 1, 0, 0, 1, 1,
0.03583169, -0.4150205, 1.874263, 1, 0, 0, 1, 1,
0.037948, 0.9123209, 1.583586, 0, 0, 0, 1, 1,
0.03849706, -0.6016737, 3.354248, 0, 0, 0, 1, 1,
0.04220267, 0.4941833, -1.632921, 0, 0, 0, 1, 1,
0.04324727, 0.9192706, -0.4970543, 0, 0, 0, 1, 1,
0.04386714, -0.651603, 2.446595, 0, 0, 0, 1, 1,
0.04431358, -0.19198, 2.735823, 0, 0, 0, 1, 1,
0.04480287, 1.494372, -1.227642, 0, 0, 0, 1, 1,
0.05021967, 0.618435, 0.6431719, 1, 1, 1, 1, 1,
0.05061794, 0.212442, 1.110542, 1, 1, 1, 1, 1,
0.05132666, 1.309391, 0.2000749, 1, 1, 1, 1, 1,
0.05607902, 0.2445893, -0.7438716, 1, 1, 1, 1, 1,
0.0572865, -0.3687835, 3.331592, 1, 1, 1, 1, 1,
0.05845784, -0.1398087, 2.576501, 1, 1, 1, 1, 1,
0.06317826, 3.006199, -0.8255697, 1, 1, 1, 1, 1,
0.06574146, 0.5605584, -0.4878692, 1, 1, 1, 1, 1,
0.06617711, 0.534569, -0.3836361, 1, 1, 1, 1, 1,
0.07057414, -1.167203, 3.077921, 1, 1, 1, 1, 1,
0.07231899, -0.5136991, 4.339912, 1, 1, 1, 1, 1,
0.07935361, 1.584943, -0.5559885, 1, 1, 1, 1, 1,
0.08198348, 0.731997, -0.1811848, 1, 1, 1, 1, 1,
0.08275602, 0.1482046, 1.055568, 1, 1, 1, 1, 1,
0.08430129, -0.08881323, 3.457534, 1, 1, 1, 1, 1,
0.08821656, -0.05448373, 2.992404, 0, 0, 1, 1, 1,
0.09791478, 0.5832315, 0.3790818, 1, 0, 0, 1, 1,
0.1007082, -1.81348, 3.776524, 1, 0, 0, 1, 1,
0.1017547, -1.281291, 2.550578, 1, 0, 0, 1, 1,
0.1036722, -1.2812, 2.730611, 1, 0, 0, 1, 1,
0.1068475, 0.358981, 0.4574698, 1, 0, 0, 1, 1,
0.1076336, 0.1240481, 1.745575, 0, 0, 0, 1, 1,
0.1128391, -0.01669154, 1.828508, 0, 0, 0, 1, 1,
0.1172629, 1.675048, 0.01362025, 0, 0, 0, 1, 1,
0.1191944, 0.4666447, 0.6005121, 0, 0, 0, 1, 1,
0.1203003, -0.223801, 1.47821, 0, 0, 0, 1, 1,
0.1237214, 0.4718305, 0.8239352, 0, 0, 0, 1, 1,
0.1282926, 0.907813, -1.011355, 0, 0, 0, 1, 1,
0.1297592, -1.3651, 2.503506, 1, 1, 1, 1, 1,
0.1306235, -0.3810715, 2.112329, 1, 1, 1, 1, 1,
0.131486, -0.6848487, 3.761649, 1, 1, 1, 1, 1,
0.1323897, 0.2078922, 1.638114, 1, 1, 1, 1, 1,
0.1350179, -0.7894674, 3.295289, 1, 1, 1, 1, 1,
0.1412293, 0.1520589, 1.549145, 1, 1, 1, 1, 1,
0.1436197, 0.7959042, 1.894, 1, 1, 1, 1, 1,
0.1440064, -0.7450634, 3.142702, 1, 1, 1, 1, 1,
0.1500201, 0.4921632, 0.608142, 1, 1, 1, 1, 1,
0.1534654, 1.290029, -1.399433, 1, 1, 1, 1, 1,
0.1561289, -0.6725583, 4.21561, 1, 1, 1, 1, 1,
0.1597949, -0.5076625, 4.272579, 1, 1, 1, 1, 1,
0.1632002, 0.2007758, -0.7128052, 1, 1, 1, 1, 1,
0.1642593, 1.196353, 0.2706584, 1, 1, 1, 1, 1,
0.1666889, 0.3876683, 2.025061, 1, 1, 1, 1, 1,
0.1667794, -1.019569, 3.751859, 0, 0, 1, 1, 1,
0.1678372, -0.2078087, 2.706574, 1, 0, 0, 1, 1,
0.1703413, 1.876977, 1.672145, 1, 0, 0, 1, 1,
0.1726551, -0.3175656, 1.481912, 1, 0, 0, 1, 1,
0.1739362, -0.7183977, 4.536243, 1, 0, 0, 1, 1,
0.1763128, 1.825875, -0.5398333, 1, 0, 0, 1, 1,
0.1779444, -1.065979, 2.829673, 0, 0, 0, 1, 1,
0.1792792, -0.7547746, 2.04736, 0, 0, 0, 1, 1,
0.1840046, -0.5057171, 1.309792, 0, 0, 0, 1, 1,
0.1881206, -0.4216354, 2.447592, 0, 0, 0, 1, 1,
0.1883955, 0.08899195, 2.401182, 0, 0, 0, 1, 1,
0.1890952, 0.1949301, 2.959031, 0, 0, 0, 1, 1,
0.1911503, 1.332394, 1.45895, 0, 0, 0, 1, 1,
0.1920408, 1.403455, 1.057847, 1, 1, 1, 1, 1,
0.1938837, -0.4479466, 2.007536, 1, 1, 1, 1, 1,
0.1941958, -0.5556875, 2.689412, 1, 1, 1, 1, 1,
0.1995336, -2.525967, 2.986633, 1, 1, 1, 1, 1,
0.2019531, 0.2403039, 0.5698376, 1, 1, 1, 1, 1,
0.2061534, -1.802257, 3.868613, 1, 1, 1, 1, 1,
0.2101075, -1.740449, 3.271909, 1, 1, 1, 1, 1,
0.2110442, 0.3953386, -1.238224, 1, 1, 1, 1, 1,
0.2156083, -1.126573, 3.525361, 1, 1, 1, 1, 1,
0.2165991, -0.2645377, 0.323935, 1, 1, 1, 1, 1,
0.21707, 1.300725, -0.5619403, 1, 1, 1, 1, 1,
0.2208832, -1.328387, 3.136967, 1, 1, 1, 1, 1,
0.2216499, 0.1451798, -0.2398746, 1, 1, 1, 1, 1,
0.2235027, -0.2280785, 2.241796, 1, 1, 1, 1, 1,
0.2255368, 2.437522, 0.6397492, 1, 1, 1, 1, 1,
0.2270798, -0.3306606, 3.606887, 0, 0, 1, 1, 1,
0.231729, 1.647987, -0.3625024, 1, 0, 0, 1, 1,
0.2319281, -0.8230091, 2.488972, 1, 0, 0, 1, 1,
0.2368316, -0.946824, 3.777514, 1, 0, 0, 1, 1,
0.2377956, -0.03209485, 1.227119, 1, 0, 0, 1, 1,
0.237802, -0.5264861, 3.164891, 1, 0, 0, 1, 1,
0.2378064, -0.06124724, 2.434253, 0, 0, 0, 1, 1,
0.2463554, 0.299316, 0.5927587, 0, 0, 0, 1, 1,
0.2485196, -0.2291978, 1.203367, 0, 0, 0, 1, 1,
0.2553901, -0.4497632, 4.145254, 0, 0, 0, 1, 1,
0.2566616, 2.489555, 0.6035047, 0, 0, 0, 1, 1,
0.2582228, 0.0670662, 2.605265, 0, 0, 0, 1, 1,
0.2602689, 0.02440748, 2.386588, 0, 0, 0, 1, 1,
0.2611577, -1.210044, 2.885486, 1, 1, 1, 1, 1,
0.2664001, 2.414141, -0.8416319, 1, 1, 1, 1, 1,
0.2674201, -1.139024, 4.405187, 1, 1, 1, 1, 1,
0.2724344, -0.9294348, 4.870134, 1, 1, 1, 1, 1,
0.2743977, 1.322573, -0.7606261, 1, 1, 1, 1, 1,
0.2756354, 0.999889, 0.2914965, 1, 1, 1, 1, 1,
0.2771765, 0.3044899, 0.6507512, 1, 1, 1, 1, 1,
0.2785795, 2.003284, 0.8841371, 1, 1, 1, 1, 1,
0.2787028, 2.115621, 0.6094555, 1, 1, 1, 1, 1,
0.2791939, 1.208173, 1.213389, 1, 1, 1, 1, 1,
0.2887385, 1.361069, 0.5669119, 1, 1, 1, 1, 1,
0.2925772, -1.763937, 0.605601, 1, 1, 1, 1, 1,
0.2946771, 0.2584689, 0.7699935, 1, 1, 1, 1, 1,
0.3082711, 0.5782194, 0.4461689, 1, 1, 1, 1, 1,
0.3097726, 0.003008289, 3.151851, 1, 1, 1, 1, 1,
0.313456, 0.8871284, 0.9484076, 0, 0, 1, 1, 1,
0.3135528, 2.03948, 0.679284, 1, 0, 0, 1, 1,
0.3176095, -0.9011326, 3.186498, 1, 0, 0, 1, 1,
0.3188129, -2.14112, 3.563301, 1, 0, 0, 1, 1,
0.3287403, -0.4782837, 2.329685, 1, 0, 0, 1, 1,
0.3305917, -1.073557, 1.706906, 1, 0, 0, 1, 1,
0.3322398, -1.947835, 3.475757, 0, 0, 0, 1, 1,
0.3329951, -0.7761049, 2.863219, 0, 0, 0, 1, 1,
0.3330075, -1.901989, 4.088114, 0, 0, 0, 1, 1,
0.3336897, -0.1182712, 0.4851215, 0, 0, 0, 1, 1,
0.3339927, 1.414138, -1.336332, 0, 0, 0, 1, 1,
0.3376158, 0.8683544, -0.7249182, 0, 0, 0, 1, 1,
0.3412571, 1.271183, 1.30747, 0, 0, 0, 1, 1,
0.3417419, -0.02088031, 1.228575, 1, 1, 1, 1, 1,
0.3472679, 0.1156828, 2.33083, 1, 1, 1, 1, 1,
0.3499371, -1.372966, 3.840369, 1, 1, 1, 1, 1,
0.3617171, -1.276214, 4.893733, 1, 1, 1, 1, 1,
0.3617425, -0.221237, 2.113697, 1, 1, 1, 1, 1,
0.3618934, 1.93649, -1.331757, 1, 1, 1, 1, 1,
0.3621057, -0.4783467, 0.9049594, 1, 1, 1, 1, 1,
0.3643613, -0.5433045, 2.739462, 1, 1, 1, 1, 1,
0.3652893, -0.4508283, 0.9076288, 1, 1, 1, 1, 1,
0.3676795, 1.870249, 1.1947, 1, 1, 1, 1, 1,
0.3713835, 0.3196934, 1.173201, 1, 1, 1, 1, 1,
0.3736689, -1.257557, 3.774505, 1, 1, 1, 1, 1,
0.3788548, 0.8535212, -0.7281479, 1, 1, 1, 1, 1,
0.3837267, 0.5981287, 0.190301, 1, 1, 1, 1, 1,
0.3840757, -0.876056, 1.754075, 1, 1, 1, 1, 1,
0.3870197, 0.4924331, 0.3874536, 0, 0, 1, 1, 1,
0.3897769, -0.7719312, 4.155793, 1, 0, 0, 1, 1,
0.3902622, 1.065066, 1.192417, 1, 0, 0, 1, 1,
0.3908456, 1.317765, 0.9430306, 1, 0, 0, 1, 1,
0.3943073, 0.03337579, 0.9212305, 1, 0, 0, 1, 1,
0.3962299, -1.182143, 3.345002, 1, 0, 0, 1, 1,
0.3965332, -0.007568252, 2.044551, 0, 0, 0, 1, 1,
0.399392, 0.1633487, 0.376381, 0, 0, 0, 1, 1,
0.399485, -1.193894, 3.759403, 0, 0, 0, 1, 1,
0.400578, -0.6447047, 2.969007, 0, 0, 0, 1, 1,
0.4032756, 0.7248917, 1.80817, 0, 0, 0, 1, 1,
0.4065802, 0.2689114, 0.3682128, 0, 0, 0, 1, 1,
0.4095328, -1.793171, 3.278594, 0, 0, 0, 1, 1,
0.409632, 1.591101, 0.6388242, 1, 1, 1, 1, 1,
0.4121387, 0.7935596, 0.002767293, 1, 1, 1, 1, 1,
0.4124028, 0.7128686, 0.3336637, 1, 1, 1, 1, 1,
0.4180091, 0.6156241, 0.04212776, 1, 1, 1, 1, 1,
0.4187426, 1.151912, 1.131346, 1, 1, 1, 1, 1,
0.4203513, -0.06542046, 2.779817, 1, 1, 1, 1, 1,
0.4203653, -0.09544403, 3.141824, 1, 1, 1, 1, 1,
0.420366, 0.4329782, 2.361186, 1, 1, 1, 1, 1,
0.4235106, -2.361236, 3.006918, 1, 1, 1, 1, 1,
0.4297371, 0.8856665, 0.5291653, 1, 1, 1, 1, 1,
0.4359918, 0.5555183, -0.9396423, 1, 1, 1, 1, 1,
0.4374568, -0.9845604, 2.184859, 1, 1, 1, 1, 1,
0.4457537, -0.3491804, 1.764291, 1, 1, 1, 1, 1,
0.448173, 0.5894052, 2.361447, 1, 1, 1, 1, 1,
0.4538832, -1.302829, 2.612315, 1, 1, 1, 1, 1,
0.4663998, 0.1773055, 0.2281575, 0, 0, 1, 1, 1,
0.4734714, 1.039867, 0.8925752, 1, 0, 0, 1, 1,
0.4775141, 0.2715284, 0.7022883, 1, 0, 0, 1, 1,
0.4779199, 2.834678, -0.4991561, 1, 0, 0, 1, 1,
0.4939175, -0.2485991, 1.923963, 1, 0, 0, 1, 1,
0.4992514, -0.2706108, 1.6034, 1, 0, 0, 1, 1,
0.5008213, -0.6398298, 2.608896, 0, 0, 0, 1, 1,
0.5100728, -1.243774, 3.770784, 0, 0, 0, 1, 1,
0.5148417, 0.6597611, -0.9376156, 0, 0, 0, 1, 1,
0.5163347, -2.070133, 1.28661, 0, 0, 0, 1, 1,
0.5208721, 0.06081299, 1.221108, 0, 0, 0, 1, 1,
0.5216042, 0.9872107, 0.6493549, 0, 0, 0, 1, 1,
0.5242882, 0.5120932, 2.462524, 0, 0, 0, 1, 1,
0.5281169, 0.7611007, 0.6890715, 1, 1, 1, 1, 1,
0.5299783, -0.4967605, 3.804433, 1, 1, 1, 1, 1,
0.5308446, -3.387853, 3.204378, 1, 1, 1, 1, 1,
0.5319533, -0.4110635, 2.338191, 1, 1, 1, 1, 1,
0.5326609, -0.2912922, 2.752929, 1, 1, 1, 1, 1,
0.5339171, -0.2130321, 1.212254, 1, 1, 1, 1, 1,
0.5367193, -1.644365, 3.087628, 1, 1, 1, 1, 1,
0.5375334, 0.5397589, 1.141925, 1, 1, 1, 1, 1,
0.5387018, 0.6822248, 0.8649127, 1, 1, 1, 1, 1,
0.5411335, -0.3633681, 2.594219, 1, 1, 1, 1, 1,
0.5438297, 1.764009, 0.4403408, 1, 1, 1, 1, 1,
0.5461656, 0.03422361, 1.346965, 1, 1, 1, 1, 1,
0.5467433, -0.4368265, 2.178391, 1, 1, 1, 1, 1,
0.5467978, 0.5920785, 0.4783344, 1, 1, 1, 1, 1,
0.5479992, -0.4020162, 2.370573, 1, 1, 1, 1, 1,
0.5524288, -1.021258, 3.286218, 0, 0, 1, 1, 1,
0.553131, 0.3825713, 0.06161657, 1, 0, 0, 1, 1,
0.5585585, -0.08503595, 1.530555, 1, 0, 0, 1, 1,
0.5668558, -0.2765281, 2.087744, 1, 0, 0, 1, 1,
0.5774156, -0.7066746, 1.939912, 1, 0, 0, 1, 1,
0.5775022, 0.8310961, 1.270424, 1, 0, 0, 1, 1,
0.5783184, -0.5775787, 1.65101, 0, 0, 0, 1, 1,
0.5812263, -1.293197, 2.101016, 0, 0, 0, 1, 1,
0.5874438, 0.5812342, -0.8681126, 0, 0, 0, 1, 1,
0.5969306, -0.7727739, 2.459578, 0, 0, 0, 1, 1,
0.6038694, -1.463901, 1.478592, 0, 0, 0, 1, 1,
0.6038944, 0.2687977, 2.301733, 0, 0, 0, 1, 1,
0.6043323, -1.079662, 3.064578, 0, 0, 0, 1, 1,
0.6082962, 0.09632712, 0.4686072, 1, 1, 1, 1, 1,
0.6134625, -0.4570058, 2.191171, 1, 1, 1, 1, 1,
0.6165046, -2.038669, 3.261729, 1, 1, 1, 1, 1,
0.6257095, -0.3072828, 3.028147, 1, 1, 1, 1, 1,
0.6335225, -0.6901729, 2.749083, 1, 1, 1, 1, 1,
0.6349232, -0.7311951, 2.368692, 1, 1, 1, 1, 1,
0.6353298, 0.5259549, -0.4037746, 1, 1, 1, 1, 1,
0.6353538, -0.9159665, 1.842264, 1, 1, 1, 1, 1,
0.6356216, 0.5534457, 1.216051, 1, 1, 1, 1, 1,
0.639316, 0.09759777, 0.6591483, 1, 1, 1, 1, 1,
0.6438203, 0.6347654, 0.4873926, 1, 1, 1, 1, 1,
0.6465958, -0.1563025, 2.364494, 1, 1, 1, 1, 1,
0.646677, -2.028567, 2.251797, 1, 1, 1, 1, 1,
0.6495194, 1.023777, -0.4649784, 1, 1, 1, 1, 1,
0.6535111, -0.8177603, 0.04728511, 1, 1, 1, 1, 1,
0.6553998, 1.961963, -1.352889, 0, 0, 1, 1, 1,
0.6577612, -0.1751736, 2.77084, 1, 0, 0, 1, 1,
0.65794, -2.31649, 2.011279, 1, 0, 0, 1, 1,
0.6608455, 0.4352266, 1.039191, 1, 0, 0, 1, 1,
0.6643269, 0.7687207, 1.962017, 1, 0, 0, 1, 1,
0.6663945, 0.9883829, 2.662546, 1, 0, 0, 1, 1,
0.6700965, 1.150636, 0.2680898, 0, 0, 0, 1, 1,
0.6767704, -1.117576, 2.275766, 0, 0, 0, 1, 1,
0.6786133, 0.4093627, -1.129929, 0, 0, 0, 1, 1,
0.6950477, 1.922708, -0.9837125, 0, 0, 0, 1, 1,
0.695958, -0.6437303, 3.002494, 0, 0, 0, 1, 1,
0.700665, 0.04076383, 2.094425, 0, 0, 0, 1, 1,
0.7014893, -0.3492584, 2.354864, 0, 0, 0, 1, 1,
0.7025435, -1.511441, 0.4127993, 1, 1, 1, 1, 1,
0.7103499, 1.147098, 1.655774, 1, 1, 1, 1, 1,
0.7136307, 0.08625243, 1.760493, 1, 1, 1, 1, 1,
0.7226141, -0.486873, 1.380131, 1, 1, 1, 1, 1,
0.7260593, 0.7685602, 0.6598716, 1, 1, 1, 1, 1,
0.7271313, 0.1342255, 2.871974, 1, 1, 1, 1, 1,
0.7282324, 0.5459697, 1.462945, 1, 1, 1, 1, 1,
0.7324027, -0.7992197, 1.351835, 1, 1, 1, 1, 1,
0.7328229, 0.356429, 1.36717, 1, 1, 1, 1, 1,
0.7371508, 1.533068, 0.7747446, 1, 1, 1, 1, 1,
0.7442826, 0.9495549, 0.9130185, 1, 1, 1, 1, 1,
0.7500914, -0.8503818, 1.082872, 1, 1, 1, 1, 1,
0.7548038, 3.245318, 0.125155, 1, 1, 1, 1, 1,
0.7606865, 0.8932683, 1.583089, 1, 1, 1, 1, 1,
0.769951, 1.024325, 0.9590668, 1, 1, 1, 1, 1,
0.7713043, 1.628467, 0.1630933, 0, 0, 1, 1, 1,
0.7727024, -0.2528316, 2.530081, 1, 0, 0, 1, 1,
0.7733831, -1.460698, 3.595046, 1, 0, 0, 1, 1,
0.7781869, -1.57791, 3.110994, 1, 0, 0, 1, 1,
0.7806596, -0.3718034, 2.267772, 1, 0, 0, 1, 1,
0.7823542, 0.3944598, 0.9507429, 1, 0, 0, 1, 1,
0.7839854, 1.380693, 0.7590498, 0, 0, 0, 1, 1,
0.7868986, -2.096884, 1.826244, 0, 0, 0, 1, 1,
0.7945791, -0.2636186, 4.070701, 0, 0, 0, 1, 1,
0.7950793, -1.352621, 3.946939, 0, 0, 0, 1, 1,
0.7965959, 0.722152, 0.720373, 0, 0, 0, 1, 1,
0.8047936, -0.3933481, 2.814358, 0, 0, 0, 1, 1,
0.8060271, -0.235699, 3.082746, 0, 0, 0, 1, 1,
0.8061217, 3.2805, 0.3493744, 1, 1, 1, 1, 1,
0.8078108, 1.342873, -0.7987339, 1, 1, 1, 1, 1,
0.809669, -0.4464024, 2.349374, 1, 1, 1, 1, 1,
0.8111774, 0.3466083, 1.003539, 1, 1, 1, 1, 1,
0.8139837, -0.3828573, 4.165079, 1, 1, 1, 1, 1,
0.8207767, 1.723352, -0.1088195, 1, 1, 1, 1, 1,
0.8233233, 0.2702959, 2.033611, 1, 1, 1, 1, 1,
0.8241441, 0.6085442, 0.9724868, 1, 1, 1, 1, 1,
0.8282841, 0.2799426, 1.441571, 1, 1, 1, 1, 1,
0.8331813, 0.6095193, 0.2728758, 1, 1, 1, 1, 1,
0.8371226, -0.3156538, 2.404716, 1, 1, 1, 1, 1,
0.8378087, -0.9781579, 1.356853, 1, 1, 1, 1, 1,
0.8387687, -0.7357157, 1.684601, 1, 1, 1, 1, 1,
0.8396732, 0.4662545, 1.878838, 1, 1, 1, 1, 1,
0.8399501, 1.132081, 0.07675736, 1, 1, 1, 1, 1,
0.8446791, 0.843491, 2.058286, 0, 0, 1, 1, 1,
0.8461575, -0.7477078, 2.592092, 1, 0, 0, 1, 1,
0.8480203, -2.058033, 1.637542, 1, 0, 0, 1, 1,
0.8496537, -0.038934, 2.304205, 1, 0, 0, 1, 1,
0.8501413, -2.264216, 4.721112, 1, 0, 0, 1, 1,
0.850772, -0.4974114, 0.9925181, 1, 0, 0, 1, 1,
0.8515396, 0.1555409, 1.56685, 0, 0, 0, 1, 1,
0.851921, 0.7423967, 1.172964, 0, 0, 0, 1, 1,
0.8638038, -2.157596, 1.035985, 0, 0, 0, 1, 1,
0.8660522, -0.4079406, 2.554085, 0, 0, 0, 1, 1,
0.8725609, 0.2539499, 1.362553, 0, 0, 0, 1, 1,
0.8817468, 1.229184, -0.3718521, 0, 0, 0, 1, 1,
0.8825648, 0.3987463, 1.665879, 0, 0, 0, 1, 1,
0.8845264, 0.825471, 2.247507, 1, 1, 1, 1, 1,
0.8864112, -0.3886957, 1.557375, 1, 1, 1, 1, 1,
0.8873439, 0.02502036, 1.856963, 1, 1, 1, 1, 1,
0.8883082, -0.3679808, 1.021987, 1, 1, 1, 1, 1,
0.8894125, 2.06966, 1.195588, 1, 1, 1, 1, 1,
0.8948181, 0.6409103, 2.103421, 1, 1, 1, 1, 1,
0.8958821, -0.8657076, 2.140051, 1, 1, 1, 1, 1,
0.8979954, -0.5676267, 1.488885, 1, 1, 1, 1, 1,
0.905951, 0.8876725, 0.7874038, 1, 1, 1, 1, 1,
0.9094753, -0.2376516, 2.338329, 1, 1, 1, 1, 1,
0.9128656, 1.114487, 1.224029, 1, 1, 1, 1, 1,
0.9155612, 1.090056, -0.3961926, 1, 1, 1, 1, 1,
0.9157792, -3.028377, 1.135763, 1, 1, 1, 1, 1,
0.9176787, 1.906335, 0.3033504, 1, 1, 1, 1, 1,
0.9274617, -1.20241, 2.633128, 1, 1, 1, 1, 1,
0.930923, 0.9419239, -0.01936407, 0, 0, 1, 1, 1,
0.9370657, 0.6122127, -0.6567418, 1, 0, 0, 1, 1,
0.9402504, 1.665989, 0.9294352, 1, 0, 0, 1, 1,
0.9404734, -2.078045, 1.183078, 1, 0, 0, 1, 1,
0.9456946, -1.784612, 1.013122, 1, 0, 0, 1, 1,
0.9521844, -0.9031799, 0.4862052, 1, 0, 0, 1, 1,
0.952824, 0.9930722, 0.9772766, 0, 0, 0, 1, 1,
0.953613, 1.873625, 1.953071, 0, 0, 0, 1, 1,
0.9543776, -2.153184, 3.497295, 0, 0, 0, 1, 1,
0.9591528, 0.5653835, -1.195218, 0, 0, 0, 1, 1,
0.9666733, -1.246617, 4.294657, 0, 0, 0, 1, 1,
0.9765214, 0.4374703, 1.005302, 0, 0, 0, 1, 1,
0.9772063, 1.787188, -0.7944025, 0, 0, 0, 1, 1,
0.9868811, -0.02466351, -0.4055852, 1, 1, 1, 1, 1,
0.9902194, -0.7480044, 1.029958, 1, 1, 1, 1, 1,
0.9902199, -2.595143, 1.796305, 1, 1, 1, 1, 1,
0.9909289, -1.463069, 2.462573, 1, 1, 1, 1, 1,
0.9936308, 0.4048185, 1.881668, 1, 1, 1, 1, 1,
0.994828, 0.353432, 1.585418, 1, 1, 1, 1, 1,
1.004594, 1.085967, 1.230111, 1, 1, 1, 1, 1,
1.004863, 0.5147634, 2.421573, 1, 1, 1, 1, 1,
1.008304, -0.7111453, 3.280392, 1, 1, 1, 1, 1,
1.01002, 1.628371, 0.2665521, 1, 1, 1, 1, 1,
1.016478, 0.4452216, 2.769326, 1, 1, 1, 1, 1,
1.017079, -1.617947, 2.039203, 1, 1, 1, 1, 1,
1.023435, 0.3748915, 0.8120554, 1, 1, 1, 1, 1,
1.027715, -1.205359, 1.887688, 1, 1, 1, 1, 1,
1.029396, -0.4715437, 1.247813, 1, 1, 1, 1, 1,
1.031078, 0.5248356, 1.42631, 0, 0, 1, 1, 1,
1.033794, 0.7130694, -1.446323, 1, 0, 0, 1, 1,
1.036321, -0.9087397, 3.16634, 1, 0, 0, 1, 1,
1.04354, 1.756504, 2.03929, 1, 0, 0, 1, 1,
1.044685, -1.664662, 3.585346, 1, 0, 0, 1, 1,
1.049886, -0.1948076, 1.913867, 1, 0, 0, 1, 1,
1.051622, 1.001206, 1.520203, 0, 0, 0, 1, 1,
1.053039, 2.026402, 1.429342, 0, 0, 0, 1, 1,
1.063512, 1.583618, 0.6664779, 0, 0, 0, 1, 1,
1.07018, 0.9681928, -0.04918959, 0, 0, 0, 1, 1,
1.073819, 1.64427, -0.3553533, 0, 0, 0, 1, 1,
1.075593, 0.2095414, 2.185373, 0, 0, 0, 1, 1,
1.076576, 0.1415694, 2.211751, 0, 0, 0, 1, 1,
1.08122, 0.4526012, 0.6941112, 1, 1, 1, 1, 1,
1.089591, 1.150507, 0.9182152, 1, 1, 1, 1, 1,
1.09264, -0.07452136, 2.396879, 1, 1, 1, 1, 1,
1.096424, -1.620451, 3.802698, 1, 1, 1, 1, 1,
1.096981, 0.7173535, 1.385306, 1, 1, 1, 1, 1,
1.100188, 0.5721547, 1.547438, 1, 1, 1, 1, 1,
1.106555, -0.9930735, 1.60232, 1, 1, 1, 1, 1,
1.107992, -0.3956779, 2.902179, 1, 1, 1, 1, 1,
1.117258, 1.340231, -0.2717204, 1, 1, 1, 1, 1,
1.124085, 1.002915, 1.572524, 1, 1, 1, 1, 1,
1.124659, 0.9626155, 0.6826963, 1, 1, 1, 1, 1,
1.128527, -0.6107687, 1.018349, 1, 1, 1, 1, 1,
1.134398, -2.32081, 0.3480659, 1, 1, 1, 1, 1,
1.141508, 0.5613188, -0.5131043, 1, 1, 1, 1, 1,
1.151762, 1.919353, -0.09763293, 1, 1, 1, 1, 1,
1.161278, -0.2681201, 1.725966, 0, 0, 1, 1, 1,
1.165237, 0.4817136, 1.699659, 1, 0, 0, 1, 1,
1.166104, -0.3756902, 2.430071, 1, 0, 0, 1, 1,
1.181039, -0.9267652, 1.035986, 1, 0, 0, 1, 1,
1.192197, 1.898891, 1.160099, 1, 0, 0, 1, 1,
1.192247, -1.067161, 3.302533, 1, 0, 0, 1, 1,
1.194384, -1.836493, 1.396666, 0, 0, 0, 1, 1,
1.196033, 0.1309, 2.119322, 0, 0, 0, 1, 1,
1.197709, 2.28822, 1.92975, 0, 0, 0, 1, 1,
1.206304, 0.7134094, 0.5574952, 0, 0, 0, 1, 1,
1.220896, 0.609325, 1.761269, 0, 0, 0, 1, 1,
1.22861, 1.474205, 0.5192261, 0, 0, 0, 1, 1,
1.23585, 1.048136, 1.120987, 0, 0, 0, 1, 1,
1.239007, 0.1629649, 1.055318, 1, 1, 1, 1, 1,
1.242398, -0.4102837, 1.028506, 1, 1, 1, 1, 1,
1.248347, -0.3692343, 1.146903, 1, 1, 1, 1, 1,
1.261112, -0.01026598, 2.98976, 1, 1, 1, 1, 1,
1.261964, 0.008944474, 3.629242, 1, 1, 1, 1, 1,
1.262917, -0.4497949, 1.135309, 1, 1, 1, 1, 1,
1.273961, -2.155437, 1.75004, 1, 1, 1, 1, 1,
1.277217, 0.4609797, 1.087031, 1, 1, 1, 1, 1,
1.28869, -0.4732476, 3.045357, 1, 1, 1, 1, 1,
1.293454, 0.5026231, 2.149231, 1, 1, 1, 1, 1,
1.304146, -0.5444885, 2.401349, 1, 1, 1, 1, 1,
1.337202, -1.111261, 1.403709, 1, 1, 1, 1, 1,
1.338722, 0.7707796, 1.783347, 1, 1, 1, 1, 1,
1.340104, -1.362154, 2.028348, 1, 1, 1, 1, 1,
1.367515, -0.0703787, 1.893821, 1, 1, 1, 1, 1,
1.382047, 0.3948246, 1.41098, 0, 0, 1, 1, 1,
1.402798, 0.05755948, 1.371096, 1, 0, 0, 1, 1,
1.413793, 0.7872582, 1.059558, 1, 0, 0, 1, 1,
1.423227, -0.8992325, 3.373478, 1, 0, 0, 1, 1,
1.442944, -0.2201189, 1.438188, 1, 0, 0, 1, 1,
1.445301, 0.07891676, 2.192939, 1, 0, 0, 1, 1,
1.449234, -1.871508, 1.728896, 0, 0, 0, 1, 1,
1.4565, -0.4753301, 2.887013, 0, 0, 0, 1, 1,
1.464583, 0.1531322, 3.428796, 0, 0, 0, 1, 1,
1.471073, 1.307545, -0.2856297, 0, 0, 0, 1, 1,
1.481454, -0.02889755, 2.265962, 0, 0, 0, 1, 1,
1.493281, 0.3586593, 2.187677, 0, 0, 0, 1, 1,
1.506791, -0.53455, 2.446488, 0, 0, 0, 1, 1,
1.5075, -0.4007508, 1.373118, 1, 1, 1, 1, 1,
1.515003, 1.897818, -0.1590149, 1, 1, 1, 1, 1,
1.536126, -0.4744676, 2.625863, 1, 1, 1, 1, 1,
1.541043, 0.6821108, 1.551286, 1, 1, 1, 1, 1,
1.544538, -0.2626815, 1.765545, 1, 1, 1, 1, 1,
1.545256, 0.06081265, 0.887209, 1, 1, 1, 1, 1,
1.582522, 0.1800677, 1.50713, 1, 1, 1, 1, 1,
1.585466, -0.3829736, 1.688709, 1, 1, 1, 1, 1,
1.587585, -1.518083, 3.02556, 1, 1, 1, 1, 1,
1.589293, 0.3134604, 1.444468, 1, 1, 1, 1, 1,
1.590122, -0.4564972, 4.388328, 1, 1, 1, 1, 1,
1.623578, -0.9985368, 2.823255, 1, 1, 1, 1, 1,
1.6352, -2.162779, 1.81103, 1, 1, 1, 1, 1,
1.651137, 1.022759, 0.9151692, 1, 1, 1, 1, 1,
1.651417, 0.8709771, 2.113989, 1, 1, 1, 1, 1,
1.654354, 1.187031, 0.1369435, 0, 0, 1, 1, 1,
1.656935, 0.3112832, 0.8663307, 1, 0, 0, 1, 1,
1.676024, 0.1287547, 1.736587, 1, 0, 0, 1, 1,
1.684737, -0.2400773, 3.118281, 1, 0, 0, 1, 1,
1.696758, 0.04476146, 0.8722513, 1, 0, 0, 1, 1,
1.696802, -0.408622, 3.036786, 1, 0, 0, 1, 1,
1.700852, -0.3490806, 2.026945, 0, 0, 0, 1, 1,
1.703863, 0.4588593, 3.728716, 0, 0, 0, 1, 1,
1.707297, -1.40185, 2.492932, 0, 0, 0, 1, 1,
1.726143, -0.6116531, 1.601938, 0, 0, 0, 1, 1,
1.728836, 0.108058, 3.812839, 0, 0, 0, 1, 1,
1.729685, -0.4257877, 3.895316, 0, 0, 0, 1, 1,
1.734347, 1.451991, 1.505943, 0, 0, 0, 1, 1,
1.752844, 0.7436691, 2.641268, 1, 1, 1, 1, 1,
1.771824, 1.30056, 1.980516, 1, 1, 1, 1, 1,
1.780492, 0.6955198, 0.7708192, 1, 1, 1, 1, 1,
1.780898, -0.3747002, 1.502586, 1, 1, 1, 1, 1,
1.806921, 0.2308394, 0.7771661, 1, 1, 1, 1, 1,
1.822333, 0.3644877, 1.099704, 1, 1, 1, 1, 1,
1.824004, 1.503927, -0.3125174, 1, 1, 1, 1, 1,
1.833109, -0.1952124, 1.270733, 1, 1, 1, 1, 1,
1.838081, 0.3291633, 1.829467, 1, 1, 1, 1, 1,
1.85188, 0.3459132, 3.460583, 1, 1, 1, 1, 1,
1.85323, -0.1487657, -1.095077, 1, 1, 1, 1, 1,
1.871984, -0.2262643, 1.274421, 1, 1, 1, 1, 1,
1.882511, -0.6561955, 0.8975007, 1, 1, 1, 1, 1,
1.897419, -0.3496663, 1.162123, 1, 1, 1, 1, 1,
1.899253, 0.3648153, 1.418491, 1, 1, 1, 1, 1,
1.968387, 0.7846501, 1.767072, 0, 0, 1, 1, 1,
1.97207, -0.6694828, 1.320588, 1, 0, 0, 1, 1,
1.995801, -0.2593183, 1.956825, 1, 0, 0, 1, 1,
2.055657, -0.9244978, 3.060757, 1, 0, 0, 1, 1,
2.069137, 0.06928255, 1.459967, 1, 0, 0, 1, 1,
2.074467, -0.8554512, 2.374921, 1, 0, 0, 1, 1,
2.085231, -0.2372841, 1.008782, 0, 0, 0, 1, 1,
2.123699, -0.1115676, 3.971534, 0, 0, 0, 1, 1,
2.142762, 1.006796, 1.073237, 0, 0, 0, 1, 1,
2.264044, 0.4040881, 1.689548, 0, 0, 0, 1, 1,
2.32839, -0.9004874, 3.399288, 0, 0, 0, 1, 1,
2.378237, -2.108825, 3.313043, 0, 0, 0, 1, 1,
2.385848, 0.4115493, 0.7545413, 0, 0, 0, 1, 1,
2.476144, -1.718164, 1.54956, 1, 1, 1, 1, 1,
2.476198, 1.381, 2.492306, 1, 1, 1, 1, 1,
2.482994, -1.42182, 2.04386, 1, 1, 1, 1, 1,
2.636213, -0.3424916, 2.586869, 1, 1, 1, 1, 1,
2.694881, 0.1759947, 2.574469, 1, 1, 1, 1, 1,
2.807013, 0.9421442, 0.5443766, 1, 1, 1, 1, 1,
2.881366, -0.2760976, 1.512626, 1, 1, 1, 1, 1
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
var radius = 9.371467;
var distance = 32.91688;
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
mvMatrix.translate( 0.02494478, 0.05367661, 0.3141479 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.91688);
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
