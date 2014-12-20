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
-3.149337, 1.714098, -0.3533158, 1, 0, 0, 1,
-3.102106, 0.3875404, -0.05611841, 1, 0.007843138, 0, 1,
-3.062896, 0.3482838, -2.338595, 1, 0.01176471, 0, 1,
-2.754089, 0.9050459, -1.486389, 1, 0.01960784, 0, 1,
-2.665865, -0.3865799, -3.085492, 1, 0.02352941, 0, 1,
-2.644101, 0.8180187, -2.950268, 1, 0.03137255, 0, 1,
-2.6009, -0.3720658, -2.749227, 1, 0.03529412, 0, 1,
-2.587668, -1.657701, -1.377963, 1, 0.04313726, 0, 1,
-2.579047, 1.98881, -2.193684, 1, 0.04705882, 0, 1,
-2.56068, -0.06088711, -2.568851, 1, 0.05490196, 0, 1,
-2.531538, -0.5826244, -2.492949, 1, 0.05882353, 0, 1,
-2.295481, -1.797094, -1.978445, 1, 0.06666667, 0, 1,
-2.201149, 0.9361249, -0.6669971, 1, 0.07058824, 0, 1,
-2.184613, -0.1991975, -2.663311, 1, 0.07843138, 0, 1,
-2.168249, 1.456329, -0.3017624, 1, 0.08235294, 0, 1,
-2.157281, 0.1913189, -1.315166, 1, 0.09019608, 0, 1,
-2.139713, -0.3552929, -2.100842, 1, 0.09411765, 0, 1,
-2.130641, -0.5665938, -2.808847, 1, 0.1019608, 0, 1,
-2.108609, 0.1115431, -0.7395625, 1, 0.1098039, 0, 1,
-2.098723, 1.067697, -1.563026, 1, 0.1137255, 0, 1,
-2.098519, 0.6863409, -0.6226634, 1, 0.1215686, 0, 1,
-2.078627, 1.121063, 0.1747276, 1, 0.1254902, 0, 1,
-2.059898, -0.08515392, -2.417359, 1, 0.1333333, 0, 1,
-2.043051, -2.084496, -2.760725, 1, 0.1372549, 0, 1,
-2.030061, -0.8079155, -1.854443, 1, 0.145098, 0, 1,
-2.000758, 0.7478693, -2.173099, 1, 0.1490196, 0, 1,
-1.975577, 0.6350369, -2.364688, 1, 0.1568628, 0, 1,
-1.96823, 0.262559, -1.061517, 1, 0.1607843, 0, 1,
-1.954593, 0.06691911, -1.031607, 1, 0.1686275, 0, 1,
-1.927407, -0.6270715, -0.9589602, 1, 0.172549, 0, 1,
-1.911453, -0.2554491, -1.28617, 1, 0.1803922, 0, 1,
-1.901192, -1.602821, -2.775384, 1, 0.1843137, 0, 1,
-1.895939, -0.4365609, -2.530773, 1, 0.1921569, 0, 1,
-1.872283, 1.942894, -2.50497, 1, 0.1960784, 0, 1,
-1.864389, 0.8817329, 0.7814875, 1, 0.2039216, 0, 1,
-1.85188, -1.097091, -0.6343608, 1, 0.2117647, 0, 1,
-1.837963, -0.4391677, -2.162388, 1, 0.2156863, 0, 1,
-1.833435, -0.9428325, -0.8451111, 1, 0.2235294, 0, 1,
-1.824448, 1.182402, -1.100297, 1, 0.227451, 0, 1,
-1.808764, -1.480858, -3.121458, 1, 0.2352941, 0, 1,
-1.692191, 0.5350803, -2.402042, 1, 0.2392157, 0, 1,
-1.687297, 0.377578, 0.6066517, 1, 0.2470588, 0, 1,
-1.682842, -0.774487, -1.304437, 1, 0.2509804, 0, 1,
-1.659562, -1.07186, -1.708502, 1, 0.2588235, 0, 1,
-1.655579, -0.65816, -2.392304, 1, 0.2627451, 0, 1,
-1.650278, 0.6293899, 0.7102157, 1, 0.2705882, 0, 1,
-1.627516, -0.9502409, -2.24646, 1, 0.2745098, 0, 1,
-1.626898, 0.1488448, -1.962804, 1, 0.282353, 0, 1,
-1.625708, 0.2139745, -0.07233332, 1, 0.2862745, 0, 1,
-1.624, -1.30009, -2.757077, 1, 0.2941177, 0, 1,
-1.610151, 0.7120036, -3.429251, 1, 0.3019608, 0, 1,
-1.60347, 1.179571, 0.05404193, 1, 0.3058824, 0, 1,
-1.602343, 2.067955, 0.567522, 1, 0.3137255, 0, 1,
-1.595433, -0.6552117, -2.173202, 1, 0.3176471, 0, 1,
-1.58959, 2.256249, -0.2479126, 1, 0.3254902, 0, 1,
-1.586378, 1.153609, -1.061616, 1, 0.3294118, 0, 1,
-1.584228, 0.1756042, -1.567184, 1, 0.3372549, 0, 1,
-1.572768, -1.61559, -2.199001, 1, 0.3411765, 0, 1,
-1.57038, 1.306502, -0.9581252, 1, 0.3490196, 0, 1,
-1.566708, -1.130131, -2.099256, 1, 0.3529412, 0, 1,
-1.555521, 1.052091, -0.8933471, 1, 0.3607843, 0, 1,
-1.544585, -0.804338, -2.793961, 1, 0.3647059, 0, 1,
-1.537135, -0.1643116, -3.589379, 1, 0.372549, 0, 1,
-1.520506, -0.04650676, -2.114935, 1, 0.3764706, 0, 1,
-1.508493, -0.8634093, -0.5511069, 1, 0.3843137, 0, 1,
-1.499707, 1.002415, -0.7132585, 1, 0.3882353, 0, 1,
-1.498423, 1.737882, -2.839674, 1, 0.3960784, 0, 1,
-1.479741, 0.3596168, 0.9163504, 1, 0.4039216, 0, 1,
-1.45591, -1.999354, -3.514971, 1, 0.4078431, 0, 1,
-1.440856, 0.3432138, -1.820552, 1, 0.4156863, 0, 1,
-1.434662, 0.05399055, -1.922288, 1, 0.4196078, 0, 1,
-1.426451, 1.035574, -2.290595, 1, 0.427451, 0, 1,
-1.419335, -0.2859503, -0.2646478, 1, 0.4313726, 0, 1,
-1.41884, 0.256579, -0.735105, 1, 0.4392157, 0, 1,
-1.410952, 0.1525842, -0.7966599, 1, 0.4431373, 0, 1,
-1.407681, 0.3146957, -0.3049647, 1, 0.4509804, 0, 1,
-1.405534, -1.150919, -2.642389, 1, 0.454902, 0, 1,
-1.403396, -1.324987, -0.7961571, 1, 0.4627451, 0, 1,
-1.400536, -0.7697864, -0.944403, 1, 0.4666667, 0, 1,
-1.400124, 0.1254959, -1.15321, 1, 0.4745098, 0, 1,
-1.398813, -1.816227, -1.671301, 1, 0.4784314, 0, 1,
-1.386766, -0.2030163, -3.365973, 1, 0.4862745, 0, 1,
-1.384455, 0.7088763, 0.9736347, 1, 0.4901961, 0, 1,
-1.374089, -0.7423137, -3.199786, 1, 0.4980392, 0, 1,
-1.362907, 0.7493729, -1.156601, 1, 0.5058824, 0, 1,
-1.361417, 0.08142035, -1.300347, 1, 0.509804, 0, 1,
-1.353889, -0.6166224, -1.20672, 1, 0.5176471, 0, 1,
-1.347876, 0.5506635, -2.954483, 1, 0.5215687, 0, 1,
-1.339469, 0.2685741, -1.255654, 1, 0.5294118, 0, 1,
-1.334696, -0.6454254, -0.4115249, 1, 0.5333334, 0, 1,
-1.333877, -1.343116, -2.512018, 1, 0.5411765, 0, 1,
-1.333836, -0.5790682, -1.777854, 1, 0.5450981, 0, 1,
-1.328735, 0.2624117, -1.643262, 1, 0.5529412, 0, 1,
-1.325995, -0.7102225, -0.9204105, 1, 0.5568628, 0, 1,
-1.322542, 0.5371168, 0.666256, 1, 0.5647059, 0, 1,
-1.315671, 1.19501, -2.073548, 1, 0.5686275, 0, 1,
-1.313255, 2.251411, 0.8271013, 1, 0.5764706, 0, 1,
-1.311844, 1.235044, 0.445347, 1, 0.5803922, 0, 1,
-1.293567, -0.005927062, -1.422936, 1, 0.5882353, 0, 1,
-1.275461, -1.277113, -4.440529, 1, 0.5921569, 0, 1,
-1.275184, -0.01768226, -5.318547, 1, 0.6, 0, 1,
-1.261437, 0.5356803, -2.727856, 1, 0.6078432, 0, 1,
-1.258984, 1.571869, -0.8275897, 1, 0.6117647, 0, 1,
-1.256149, -0.7056308, -1.484134, 1, 0.6196079, 0, 1,
-1.255949, -0.3111636, -1.068959, 1, 0.6235294, 0, 1,
-1.248935, 0.6611716, -1.096662, 1, 0.6313726, 0, 1,
-1.246813, -0.4609047, -1.47303, 1, 0.6352941, 0, 1,
-1.24678, -0.1074024, -1.357448, 1, 0.6431373, 0, 1,
-1.240405, -1.090036, -1.701642, 1, 0.6470588, 0, 1,
-1.233819, 0.698849, -1.264632, 1, 0.654902, 0, 1,
-1.232307, 0.5436081, -0.4676341, 1, 0.6588235, 0, 1,
-1.229649, 1.071369, -0.3216571, 1, 0.6666667, 0, 1,
-1.228096, 1.066133, -0.6904602, 1, 0.6705883, 0, 1,
-1.227981, -0.5939122, -2.624365, 1, 0.6784314, 0, 1,
-1.225171, 1.632326, 0.7208595, 1, 0.682353, 0, 1,
-1.223198, 0.8237352, -2.937365, 1, 0.6901961, 0, 1,
-1.222323, 1.082744, -0.2571612, 1, 0.6941177, 0, 1,
-1.212284, 0.831666, -2.836087, 1, 0.7019608, 0, 1,
-1.194857, -0.5143639, -1.545401, 1, 0.7098039, 0, 1,
-1.190053, 1.143228, -1.064173, 1, 0.7137255, 0, 1,
-1.189204, 1.095618, -1.911624, 1, 0.7215686, 0, 1,
-1.187094, 0.8738328, -0.5470147, 1, 0.7254902, 0, 1,
-1.18008, 1.538581, -2.362681, 1, 0.7333333, 0, 1,
-1.175025, -1.170647, -0.1820451, 1, 0.7372549, 0, 1,
-1.170129, 0.8720602, -1.093383, 1, 0.7450981, 0, 1,
-1.169894, 0.5463217, -1.657316, 1, 0.7490196, 0, 1,
-1.169685, 1.804686, 1.158123, 1, 0.7568628, 0, 1,
-1.162461, 0.4469188, -1.79087, 1, 0.7607843, 0, 1,
-1.162093, -2.126167, -3.019775, 1, 0.7686275, 0, 1,
-1.157618, -0.08986657, -0.9441618, 1, 0.772549, 0, 1,
-1.141499, -1.399172, -2.818525, 1, 0.7803922, 0, 1,
-1.125568, 1.182346, -0.4273953, 1, 0.7843137, 0, 1,
-1.117311, -0.5451335, -2.721854, 1, 0.7921569, 0, 1,
-1.115703, 0.8555904, 0.3215962, 1, 0.7960784, 0, 1,
-1.104662, 0.2851307, -2.813429, 1, 0.8039216, 0, 1,
-1.103441, -0.1426059, -1.428929, 1, 0.8117647, 0, 1,
-1.100755, 1.282093, -0.9326189, 1, 0.8156863, 0, 1,
-1.096035, -0.05452143, -2.309016, 1, 0.8235294, 0, 1,
-1.092459, -0.01161102, -2.998457, 1, 0.827451, 0, 1,
-1.091466, -0.7447827, -1.330467, 1, 0.8352941, 0, 1,
-1.090046, 0.4578884, -1.450235, 1, 0.8392157, 0, 1,
-1.084442, 1.026342, -1.24968, 1, 0.8470588, 0, 1,
-1.082104, 0.2090474, -1.941625, 1, 0.8509804, 0, 1,
-1.081148, 1.309321, -0.4513464, 1, 0.8588235, 0, 1,
-1.081027, -0.6173151, -0.5496712, 1, 0.8627451, 0, 1,
-1.07787, -0.1058961, -3.039768, 1, 0.8705882, 0, 1,
-1.07699, -0.3102105, -2.286344, 1, 0.8745098, 0, 1,
-1.076344, -1.338856, -1.963412, 1, 0.8823529, 0, 1,
-1.07544, 0.2498418, -1.893762, 1, 0.8862745, 0, 1,
-1.074062, -0.4921422, -3.382122, 1, 0.8941177, 0, 1,
-1.073005, 0.5837594, -1.223284, 1, 0.8980392, 0, 1,
-1.071175, -0.7887472, -2.319632, 1, 0.9058824, 0, 1,
-1.067586, 1.115074, -0.207638, 1, 0.9137255, 0, 1,
-1.063568, 0.7033817, 0.8951095, 1, 0.9176471, 0, 1,
-1.060829, -0.4434123, -1.936896, 1, 0.9254902, 0, 1,
-1.055518, -0.7966283, -2.584684, 1, 0.9294118, 0, 1,
-1.048958, 0.7584639, -0.5973713, 1, 0.9372549, 0, 1,
-1.047282, -0.4430567, -1.387703, 1, 0.9411765, 0, 1,
-1.037927, -0.2266826, -2.422351, 1, 0.9490196, 0, 1,
-1.031943, -0.2186327, -0.07997883, 1, 0.9529412, 0, 1,
-1.029415, -1.087384, -1.074566, 1, 0.9607843, 0, 1,
-1.028989, -1.149408, -3.071006, 1, 0.9647059, 0, 1,
-1.024008, 1.746222, 2.15741, 1, 0.972549, 0, 1,
-1.018316, -0.1278866, -2.791152, 1, 0.9764706, 0, 1,
-0.9965738, -0.04297875, -2.712533, 1, 0.9843137, 0, 1,
-0.9831021, -0.2709829, -1.93653, 1, 0.9882353, 0, 1,
-0.9814613, 0.1599552, 0.1466845, 1, 0.9960784, 0, 1,
-0.9803535, -0.6088401, -2.301598, 0.9960784, 1, 0, 1,
-0.9794916, -0.006249192, -3.562864, 0.9921569, 1, 0, 1,
-0.9700869, -1.190467, -2.870139, 0.9843137, 1, 0, 1,
-0.9689895, 0.1413498, 0.4996166, 0.9803922, 1, 0, 1,
-0.9613863, -0.005125186, -0.8957823, 0.972549, 1, 0, 1,
-0.9566645, 1.283399, -2.049613, 0.9686275, 1, 0, 1,
-0.9454208, 0.4595316, -0.925284, 0.9607843, 1, 0, 1,
-0.9410256, -0.9043165, -0.2898889, 0.9568627, 1, 0, 1,
-0.9364682, 0.4484915, -2.122265, 0.9490196, 1, 0, 1,
-0.9351264, -0.6405853, -3.179013, 0.945098, 1, 0, 1,
-0.9346213, 0.2911216, -1.877576, 0.9372549, 1, 0, 1,
-0.9312087, 0.3801662, -1.723471, 0.9333333, 1, 0, 1,
-0.9244794, -0.9344568, -1.661319, 0.9254902, 1, 0, 1,
-0.9211248, -1.593084, -3.462937, 0.9215686, 1, 0, 1,
-0.9205478, -0.8776346, -2.331127, 0.9137255, 1, 0, 1,
-0.9162192, 0.5013355, -0.5120631, 0.9098039, 1, 0, 1,
-0.912084, -0.9244501, -2.001781, 0.9019608, 1, 0, 1,
-0.9080322, 0.1995529, -1.169036, 0.8941177, 1, 0, 1,
-0.9012088, 0.9418051, 1.415928, 0.8901961, 1, 0, 1,
-0.8868071, -0.01056071, -2.327059, 0.8823529, 1, 0, 1,
-0.8867618, -0.1793819, -0.6248713, 0.8784314, 1, 0, 1,
-0.8859112, 0.8356881, -2.188412, 0.8705882, 1, 0, 1,
-0.8851776, 0.3881487, -0.8647394, 0.8666667, 1, 0, 1,
-0.879941, 0.06377883, -2.319942, 0.8588235, 1, 0, 1,
-0.8679627, 0.4614969, 1.394416, 0.854902, 1, 0, 1,
-0.8678103, -1.153612, -4.192065, 0.8470588, 1, 0, 1,
-0.8622446, 0.4002495, -1.626708, 0.8431373, 1, 0, 1,
-0.8622349, 1.783846, 0.5669437, 0.8352941, 1, 0, 1,
-0.851766, -1.270446, -4.043962, 0.8313726, 1, 0, 1,
-0.8507434, 0.5246181, -1.899363, 0.8235294, 1, 0, 1,
-0.8412195, -0.6205547, -1.740242, 0.8196079, 1, 0, 1,
-0.8392072, -0.8249275, -1.652811, 0.8117647, 1, 0, 1,
-0.8385139, -0.9414623, -2.467966, 0.8078431, 1, 0, 1,
-0.8351312, -1.542687, -2.835986, 0.8, 1, 0, 1,
-0.8335392, 0.4480799, -1.413079, 0.7921569, 1, 0, 1,
-0.8309163, 0.09360017, -0.1945061, 0.7882353, 1, 0, 1,
-0.830153, 1.706587, 0.7389584, 0.7803922, 1, 0, 1,
-0.8259846, 0.2842156, -1.442666, 0.7764706, 1, 0, 1,
-0.8205591, -0.06615311, -1.474125, 0.7686275, 1, 0, 1,
-0.8130598, 0.7033892, -0.3253935, 0.7647059, 1, 0, 1,
-0.8120409, -0.6866117, -0.2828482, 0.7568628, 1, 0, 1,
-0.8043779, 0.5404658, -0.3950527, 0.7529412, 1, 0, 1,
-0.8036921, -2.733476, -1.867392, 0.7450981, 1, 0, 1,
-0.8034199, 0.8776309, 0.1041506, 0.7411765, 1, 0, 1,
-0.8025627, 1.467225, -1.035621, 0.7333333, 1, 0, 1,
-0.799929, -0.2350031, -1.593797, 0.7294118, 1, 0, 1,
-0.7961354, 1.551237, -0.5996929, 0.7215686, 1, 0, 1,
-0.7950053, 0.3365726, -2.337726, 0.7176471, 1, 0, 1,
-0.7937742, 1.736431, 0.6512097, 0.7098039, 1, 0, 1,
-0.7902433, -0.4370278, -3.403484, 0.7058824, 1, 0, 1,
-0.7893634, -0.05468911, -1.275273, 0.6980392, 1, 0, 1,
-0.7888055, 0.2365014, -0.4730294, 0.6901961, 1, 0, 1,
-0.7866988, -1.251081, -3.495631, 0.6862745, 1, 0, 1,
-0.7826018, 0.1493848, -1.491141, 0.6784314, 1, 0, 1,
-0.7811492, -1.654867, -1.820842, 0.6745098, 1, 0, 1,
-0.772518, 0.5570821, -1.050093, 0.6666667, 1, 0, 1,
-0.7695271, -0.8041695, -0.5260944, 0.6627451, 1, 0, 1,
-0.7683061, -0.4474431, -2.200114, 0.654902, 1, 0, 1,
-0.7674615, 0.2847283, -0.9511352, 0.6509804, 1, 0, 1,
-0.7637811, -1.136931, -4.524773, 0.6431373, 1, 0, 1,
-0.7601789, 0.06584847, -2.005432, 0.6392157, 1, 0, 1,
-0.7542756, -1.670753, -0.8851828, 0.6313726, 1, 0, 1,
-0.7486553, 0.7318361, -1.134076, 0.627451, 1, 0, 1,
-0.7481869, -0.5223144, -3.35603, 0.6196079, 1, 0, 1,
-0.7463076, -2.63245, -2.437479, 0.6156863, 1, 0, 1,
-0.7445453, -3.412389, -3.210972, 0.6078432, 1, 0, 1,
-0.733088, 1.082806, -1.087807, 0.6039216, 1, 0, 1,
-0.7287287, 1.970342, 0.2891671, 0.5960785, 1, 0, 1,
-0.7274244, 0.2602099, -1.960132, 0.5882353, 1, 0, 1,
-0.7246003, -0.8687692, -2.025702, 0.5843138, 1, 0, 1,
-0.7199882, -0.2865863, -1.737637, 0.5764706, 1, 0, 1,
-0.7176773, 0.8349243, -0.02236878, 0.572549, 1, 0, 1,
-0.7166408, 0.9972195, -1.633997, 0.5647059, 1, 0, 1,
-0.7124152, -1.751392, -2.907621, 0.5607843, 1, 0, 1,
-0.7104054, 0.01820122, -2.038532, 0.5529412, 1, 0, 1,
-0.7101784, -0.6447433, -0.8018019, 0.5490196, 1, 0, 1,
-0.7093512, 0.9543806, -0.224829, 0.5411765, 1, 0, 1,
-0.709206, -2.11575, -2.172858, 0.5372549, 1, 0, 1,
-0.7007092, 0.01786925, -1.4263, 0.5294118, 1, 0, 1,
-0.6859353, 0.8309897, -0.5774559, 0.5254902, 1, 0, 1,
-0.6839511, -0.033473, 0.5011742, 0.5176471, 1, 0, 1,
-0.683018, 0.2217811, -0.8931285, 0.5137255, 1, 0, 1,
-0.6827131, 1.106063, -0.1447628, 0.5058824, 1, 0, 1,
-0.6819512, 0.1653624, -1.467086, 0.5019608, 1, 0, 1,
-0.681888, -1.651572, -2.470457, 0.4941176, 1, 0, 1,
-0.6801489, -1.684635, -2.101057, 0.4862745, 1, 0, 1,
-0.6766462, 0.4655252, -1.699539, 0.4823529, 1, 0, 1,
-0.673942, 0.1366535, -2.287803, 0.4745098, 1, 0, 1,
-0.6638529, 0.9000725, -1.368423, 0.4705882, 1, 0, 1,
-0.6562502, 1.796271, -0.7208977, 0.4627451, 1, 0, 1,
-0.6553061, -0.5009221, -5.425211, 0.4588235, 1, 0, 1,
-0.6534541, -0.6715603, -3.012104, 0.4509804, 1, 0, 1,
-0.6498794, -0.1334382, -1.51772, 0.4470588, 1, 0, 1,
-0.6441349, 0.8877904, 0.3808511, 0.4392157, 1, 0, 1,
-0.6430743, 0.6511009, -1.125763, 0.4352941, 1, 0, 1,
-0.6394067, 0.4505293, -1.262165, 0.427451, 1, 0, 1,
-0.6373757, 2.794535, 0.2701445, 0.4235294, 1, 0, 1,
-0.6305786, -0.4950396, -2.791548, 0.4156863, 1, 0, 1,
-0.6291792, 1.415405, 0.415592, 0.4117647, 1, 0, 1,
-0.6249801, -0.8468203, -2.373952, 0.4039216, 1, 0, 1,
-0.622467, 0.02802718, -0.5804334, 0.3960784, 1, 0, 1,
-0.620465, 0.01352278, -1.380178, 0.3921569, 1, 0, 1,
-0.6198564, -1.324896, -3.309657, 0.3843137, 1, 0, 1,
-0.6176788, 0.4509968, -0.6721669, 0.3803922, 1, 0, 1,
-0.6161597, -0.07895328, -1.73124, 0.372549, 1, 0, 1,
-0.6114262, 0.2940657, 0.06231546, 0.3686275, 1, 0, 1,
-0.6043767, 0.0105952, -1.639824, 0.3607843, 1, 0, 1,
-0.6042291, -0.3589773, -2.625773, 0.3568628, 1, 0, 1,
-0.6022567, -0.5786793, -4.124115, 0.3490196, 1, 0, 1,
-0.5997555, 1.527001, -0.3195451, 0.345098, 1, 0, 1,
-0.593156, 0.7194973, -0.5421396, 0.3372549, 1, 0, 1,
-0.5873392, 1.685352, -0.9241094, 0.3333333, 1, 0, 1,
-0.5795825, -0.7785441, -3.321386, 0.3254902, 1, 0, 1,
-0.5787644, 0.310851, -1.380587, 0.3215686, 1, 0, 1,
-0.5784589, 1.151163, -1.201764, 0.3137255, 1, 0, 1,
-0.5780987, 0.7608265, -2.094687, 0.3098039, 1, 0, 1,
-0.5745881, 0.6854849, -1.868184, 0.3019608, 1, 0, 1,
-0.5685928, 1.604547, -0.5637713, 0.2941177, 1, 0, 1,
-0.5682734, 0.1076711, -0.4970805, 0.2901961, 1, 0, 1,
-0.5677311, 0.0189344, -1.627258, 0.282353, 1, 0, 1,
-0.5668337, 0.3974997, -2.511951, 0.2784314, 1, 0, 1,
-0.5623627, -0.6319286, 0.0944951, 0.2705882, 1, 0, 1,
-0.561121, 0.3415764, -2.67839, 0.2666667, 1, 0, 1,
-0.5605938, -0.7082222, -3.44054, 0.2588235, 1, 0, 1,
-0.5588016, -0.8923293, -2.361311, 0.254902, 1, 0, 1,
-0.5583231, 0.4359764, -0.7231803, 0.2470588, 1, 0, 1,
-0.5543041, -0.7728977, -0.2876077, 0.2431373, 1, 0, 1,
-0.5493145, -0.4915983, -2.650451, 0.2352941, 1, 0, 1,
-0.5455923, 0.7049221, -0.9515788, 0.2313726, 1, 0, 1,
-0.5396799, -1.089435, -2.605445, 0.2235294, 1, 0, 1,
-0.5390621, 1.100568, -1.755033, 0.2196078, 1, 0, 1,
-0.5376521, 1.075239, -0.01544789, 0.2117647, 1, 0, 1,
-0.5343556, -0.07080899, -2.74053, 0.2078431, 1, 0, 1,
-0.5329365, -0.6702014, -2.253839, 0.2, 1, 0, 1,
-0.5240181, 2.374373, 0.6529886, 0.1921569, 1, 0, 1,
-0.5225877, -0.8740044, 0.3251679, 0.1882353, 1, 0, 1,
-0.5107542, 1.549354, -0.6664799, 0.1803922, 1, 0, 1,
-0.5083397, -1.379635, -0.5399939, 0.1764706, 1, 0, 1,
-0.5056886, -1.936088, -2.639343, 0.1686275, 1, 0, 1,
-0.4962835, -0.251754, -1.382553, 0.1647059, 1, 0, 1,
-0.4959903, 0.6538383, -0.6726184, 0.1568628, 1, 0, 1,
-0.4944838, -0.3557707, -3.156859, 0.1529412, 1, 0, 1,
-0.493598, -0.4522812, -3.04953, 0.145098, 1, 0, 1,
-0.4923431, 0.9847988, 0.821167, 0.1411765, 1, 0, 1,
-0.4911034, 0.05858821, -1.295695, 0.1333333, 1, 0, 1,
-0.4839335, 0.1524606, -1.118876, 0.1294118, 1, 0, 1,
-0.4833265, -0.07623838, -0.4223619, 0.1215686, 1, 0, 1,
-0.4821233, 0.05380706, -1.194681, 0.1176471, 1, 0, 1,
-0.4757489, -0.1747447, -1.799652, 0.1098039, 1, 0, 1,
-0.4740983, -0.1564794, -1.410441, 0.1058824, 1, 0, 1,
-0.471816, -1.520657, -3.728979, 0.09803922, 1, 0, 1,
-0.4706218, -0.7919568, -3.690372, 0.09019608, 1, 0, 1,
-0.4694481, -0.1817445, -0.6570354, 0.08627451, 1, 0, 1,
-0.468076, -1.218428, -3.97796, 0.07843138, 1, 0, 1,
-0.4674777, 0.1701493, -3.092465, 0.07450981, 1, 0, 1,
-0.4633861, 0.01432881, -1.255567, 0.06666667, 1, 0, 1,
-0.4573992, -0.1273394, -0.831225, 0.0627451, 1, 0, 1,
-0.4562263, -0.6328751, -3.233761, 0.05490196, 1, 0, 1,
-0.4522868, 0.3105419, -0.3447, 0.05098039, 1, 0, 1,
-0.4409218, -0.4297042, -2.158432, 0.04313726, 1, 0, 1,
-0.4367519, -0.8294373, -4.183767, 0.03921569, 1, 0, 1,
-0.4362641, 0.4733347, 0.2813653, 0.03137255, 1, 0, 1,
-0.4347207, 0.8666176, -0.07461096, 0.02745098, 1, 0, 1,
-0.434541, -0.005380581, -1.094793, 0.01960784, 1, 0, 1,
-0.4306332, 0.1209612, 0.8811862, 0.01568628, 1, 0, 1,
-0.4263541, 0.01455846, -0.2787152, 0.007843138, 1, 0, 1,
-0.4248536, -0.1021851, -0.1755613, 0.003921569, 1, 0, 1,
-0.4211244, -0.9830791, -3.735788, 0, 1, 0.003921569, 1,
-0.4207289, -0.7981967, -2.553315, 0, 1, 0.01176471, 1,
-0.4187951, -0.4307205, -1.934289, 0, 1, 0.01568628, 1,
-0.4133502, -0.02563808, -1.938188, 0, 1, 0.02352941, 1,
-0.3958572, 0.6869857, -1.783285, 0, 1, 0.02745098, 1,
-0.3946685, 0.3677107, 0.2037584, 0, 1, 0.03529412, 1,
-0.3940659, 0.5120221, -0.8287179, 0, 1, 0.03921569, 1,
-0.392461, 0.1582962, -1.415628, 0, 1, 0.04705882, 1,
-0.3921826, -0.9397871, -3.102242, 0, 1, 0.05098039, 1,
-0.3918343, -0.2397067, -1.652527, 0, 1, 0.05882353, 1,
-0.3910545, 0.4322124, -0.1539805, 0, 1, 0.0627451, 1,
-0.3777394, -0.9062985, -3.846503, 0, 1, 0.07058824, 1,
-0.3773041, -0.2034178, -2.133918, 0, 1, 0.07450981, 1,
-0.3684591, -0.1221028, -0.9015185, 0, 1, 0.08235294, 1,
-0.3657188, -0.4125268, -3.837233, 0, 1, 0.08627451, 1,
-0.3644715, -0.6057952, -4.455523, 0, 1, 0.09411765, 1,
-0.3621209, -0.6019164, -3.767917, 0, 1, 0.1019608, 1,
-0.3609776, 0.3281502, -0.2550376, 0, 1, 0.1058824, 1,
-0.3573794, 0.1825338, -0.6383809, 0, 1, 0.1137255, 1,
-0.355664, -0.5629972, -2.178278, 0, 1, 0.1176471, 1,
-0.3532359, 1.797858, -1.322318, 0, 1, 0.1254902, 1,
-0.3529922, -1.108164, -4.389971, 0, 1, 0.1294118, 1,
-0.3504798, -0.1493351, -0.387044, 0, 1, 0.1372549, 1,
-0.3477075, 0.2919527, -3.247241, 0, 1, 0.1411765, 1,
-0.3474018, 1.732093, -0.3431187, 0, 1, 0.1490196, 1,
-0.3460405, -1.355677, -3.476799, 0, 1, 0.1529412, 1,
-0.3442512, -0.4150775, -1.624857, 0, 1, 0.1607843, 1,
-0.3410769, 0.7021601, -1.697141, 0, 1, 0.1647059, 1,
-0.3406833, -0.04259835, -0.05521706, 0, 1, 0.172549, 1,
-0.3403777, 0.6092684, 0.5279734, 0, 1, 0.1764706, 1,
-0.3395958, -1.092759, -2.231859, 0, 1, 0.1843137, 1,
-0.3365134, -0.8884234, -2.128466, 0, 1, 0.1882353, 1,
-0.3333554, 0.06386798, -1.526983, 0, 1, 0.1960784, 1,
-0.3273365, -2.432703, -3.062571, 0, 1, 0.2039216, 1,
-0.3235369, -0.5560895, -4.487983, 0, 1, 0.2078431, 1,
-0.3234592, -0.7860041, -2.103998, 0, 1, 0.2156863, 1,
-0.3177451, -1.478245, -3.268282, 0, 1, 0.2196078, 1,
-0.3167976, 0.8787785, 0.1637499, 0, 1, 0.227451, 1,
-0.3148302, 1.294426, 0.2804602, 0, 1, 0.2313726, 1,
-0.3120529, 0.5249051, 0.7809606, 0, 1, 0.2392157, 1,
-0.3093471, 0.7193804, -1.474783, 0, 1, 0.2431373, 1,
-0.3089335, 0.4588113, -0.04483755, 0, 1, 0.2509804, 1,
-0.2942398, -0.8607119, -1.23904, 0, 1, 0.254902, 1,
-0.2936106, -0.5148643, -4.110772, 0, 1, 0.2627451, 1,
-0.2907086, -0.7261344, -2.512211, 0, 1, 0.2666667, 1,
-0.286719, 0.5408716, 0.6588351, 0, 1, 0.2745098, 1,
-0.2850896, 0.254734, -1.748452, 0, 1, 0.2784314, 1,
-0.2825744, 0.9444589, -0.3226406, 0, 1, 0.2862745, 1,
-0.2815565, -1.224038, -2.174936, 0, 1, 0.2901961, 1,
-0.2800759, -1.850624, -4.642353, 0, 1, 0.2980392, 1,
-0.2798038, 1.440518, 0.2028616, 0, 1, 0.3058824, 1,
-0.2790976, 0.4380051, -0.6537831, 0, 1, 0.3098039, 1,
-0.2757335, -1.197575, -3.501622, 0, 1, 0.3176471, 1,
-0.2750122, 2.419184, 0.532005, 0, 1, 0.3215686, 1,
-0.2718115, -1.506031, -3.640437, 0, 1, 0.3294118, 1,
-0.2680363, 1.388239, -1.385047, 0, 1, 0.3333333, 1,
-0.2642592, -1.038212, -2.731041, 0, 1, 0.3411765, 1,
-0.2622553, -0.8976204, -3.024376, 0, 1, 0.345098, 1,
-0.258962, 1.173206, 0.5110787, 0, 1, 0.3529412, 1,
-0.2579979, 1.1666, 0.7788621, 0, 1, 0.3568628, 1,
-0.2574309, -0.7011054, -2.047899, 0, 1, 0.3647059, 1,
-0.2565754, 0.5854567, -0.4118596, 0, 1, 0.3686275, 1,
-0.2509534, -0.8182588, -3.392604, 0, 1, 0.3764706, 1,
-0.2498078, -0.2254682, -3.454757, 0, 1, 0.3803922, 1,
-0.2480979, -0.6737371, -1.508391, 0, 1, 0.3882353, 1,
-0.2480028, 1.068202, -0.5272886, 0, 1, 0.3921569, 1,
-0.2474224, 0.6121091, -0.4776237, 0, 1, 0.4, 1,
-0.2460846, -0.4503787, -3.3356, 0, 1, 0.4078431, 1,
-0.2436281, -0.8143091, -3.633132, 0, 1, 0.4117647, 1,
-0.2427468, -0.368928, -3.362151, 0, 1, 0.4196078, 1,
-0.2387609, -1.121565, -2.892852, 0, 1, 0.4235294, 1,
-0.2327254, 1.536916, -0.2467744, 0, 1, 0.4313726, 1,
-0.2320712, 0.5080602, -1.033446, 0, 1, 0.4352941, 1,
-0.2310096, 0.153255, -1.875772, 0, 1, 0.4431373, 1,
-0.2263259, -1.073385, -3.458835, 0, 1, 0.4470588, 1,
-0.2244887, 1.295325, -0.1361632, 0, 1, 0.454902, 1,
-0.2145211, 0.7577909, -1.351873, 0, 1, 0.4588235, 1,
-0.2140135, -0.8749131, -3.251204, 0, 1, 0.4666667, 1,
-0.2130227, -0.9042277, -3.244879, 0, 1, 0.4705882, 1,
-0.212895, -1.812816, -1.353331, 0, 1, 0.4784314, 1,
-0.2127739, -1.259316, -2.761936, 0, 1, 0.4823529, 1,
-0.2094546, -0.7178926, -4.206781, 0, 1, 0.4901961, 1,
-0.2075738, -2.291842, -3.913464, 0, 1, 0.4941176, 1,
-0.2052576, 2.028676, -0.03093239, 0, 1, 0.5019608, 1,
-0.2050239, 1.225534, 0.1732497, 0, 1, 0.509804, 1,
-0.2050219, 2.289853, 1.155305, 0, 1, 0.5137255, 1,
-0.2033392, -1.13714, -2.613651, 0, 1, 0.5215687, 1,
-0.2023099, 0.6151186, -1.290466, 0, 1, 0.5254902, 1,
-0.2000349, 0.3729744, 2.437207, 0, 1, 0.5333334, 1,
-0.1913659, -0.1779133, -3.166442, 0, 1, 0.5372549, 1,
-0.1904186, 0.3651859, -2.171793, 0, 1, 0.5450981, 1,
-0.190347, 0.4263062, -1.089896, 0, 1, 0.5490196, 1,
-0.1893405, -0.4445246, -0.9417868, 0, 1, 0.5568628, 1,
-0.1891745, -0.2470679, -0.625473, 0, 1, 0.5607843, 1,
-0.1867993, -0.0143646, -1.391298, 0, 1, 0.5686275, 1,
-0.1852656, 0.02604392, -0.736748, 0, 1, 0.572549, 1,
-0.1829988, 1.237058, -2.319105, 0, 1, 0.5803922, 1,
-0.1828642, 1.814638, -1.287576, 0, 1, 0.5843138, 1,
-0.1794188, -0.07523407, -2.907034, 0, 1, 0.5921569, 1,
-0.171422, -2.288346, -3.733525, 0, 1, 0.5960785, 1,
-0.1655691, 0.8995239, -0.1800568, 0, 1, 0.6039216, 1,
-0.165078, -0.4039649, -0.7602577, 0, 1, 0.6117647, 1,
-0.16353, 0.227418, -0.4492225, 0, 1, 0.6156863, 1,
-0.1621176, 0.0764934, 0.8212907, 0, 1, 0.6235294, 1,
-0.1613999, -0.7363432, -3.455986, 0, 1, 0.627451, 1,
-0.1606014, -1.366779, -3.159854, 0, 1, 0.6352941, 1,
-0.1569269, 1.868046, -1.144082, 0, 1, 0.6392157, 1,
-0.154976, 1.96325, 0.6264093, 0, 1, 0.6470588, 1,
-0.1502545, 0.3979691, 0.04952905, 0, 1, 0.6509804, 1,
-0.1502183, -1.379644, -6.146964, 0, 1, 0.6588235, 1,
-0.1484983, 0.6133019, 0.511832, 0, 1, 0.6627451, 1,
-0.1449126, -1.352281, -4.167793, 0, 1, 0.6705883, 1,
-0.1434134, -0.6125246, -2.368178, 0, 1, 0.6745098, 1,
-0.1379913, -0.2355816, -3.168167, 0, 1, 0.682353, 1,
-0.1343479, 0.5217022, 2.015718, 0, 1, 0.6862745, 1,
-0.132147, -0.217742, -2.213537, 0, 1, 0.6941177, 1,
-0.1278695, 1.460918, 1.321291, 0, 1, 0.7019608, 1,
-0.1227173, -1.823296, -3.575253, 0, 1, 0.7058824, 1,
-0.122273, 0.1058398, -0.2657982, 0, 1, 0.7137255, 1,
-0.1204994, -0.1028744, -3.004397, 0, 1, 0.7176471, 1,
-0.119321, -0.6516715, -2.542895, 0, 1, 0.7254902, 1,
-0.1138344, -1.232465, -5.167236, 0, 1, 0.7294118, 1,
-0.1128877, -0.8712372, -2.25309, 0, 1, 0.7372549, 1,
-0.110302, -0.2557487, -2.670653, 0, 1, 0.7411765, 1,
-0.1070096, 0.4696337, -0.01017117, 0, 1, 0.7490196, 1,
-0.1036746, -1.6689, -2.868473, 0, 1, 0.7529412, 1,
-0.1025393, 1.127209, 0.3756168, 0, 1, 0.7607843, 1,
-0.1016683, -0.7877064, -4.232509, 0, 1, 0.7647059, 1,
-0.09380028, -1.487488, -1.480366, 0, 1, 0.772549, 1,
-0.09379176, 0.7794569, -0.4812536, 0, 1, 0.7764706, 1,
-0.09207651, -0.9753498, -2.384389, 0, 1, 0.7843137, 1,
-0.08608542, -1.730221, -3.173929, 0, 1, 0.7882353, 1,
-0.0824725, -1.831991, -3.875507, 0, 1, 0.7960784, 1,
-0.08225576, 0.8028788, 0.3344041, 0, 1, 0.8039216, 1,
-0.07833324, -0.5314965, -4.50005, 0, 1, 0.8078431, 1,
-0.0764959, -0.8558517, -4.310583, 0, 1, 0.8156863, 1,
-0.07452286, -1.599203, -2.039754, 0, 1, 0.8196079, 1,
-0.07374854, -0.3517594, -3.114424, 0, 1, 0.827451, 1,
-0.06604943, -1.011784, -3.026308, 0, 1, 0.8313726, 1,
-0.05707958, -2.499788, -2.908864, 0, 1, 0.8392157, 1,
-0.05585446, 0.1982693, -1.728602, 0, 1, 0.8431373, 1,
-0.05234049, 0.968457, -1.522173, 0, 1, 0.8509804, 1,
-0.05211975, 0.6543003, 0.1383889, 0, 1, 0.854902, 1,
-0.05117192, -0.09280418, -2.31478, 0, 1, 0.8627451, 1,
-0.04918123, -1.221942, -2.138446, 0, 1, 0.8666667, 1,
-0.04801698, -0.4514435, -3.166829, 0, 1, 0.8745098, 1,
-0.04656548, -1.227008, -3.281235, 0, 1, 0.8784314, 1,
-0.04634091, -2.082447, -4.119429, 0, 1, 0.8862745, 1,
-0.04501329, -1.087984, -2.043706, 0, 1, 0.8901961, 1,
-0.04252149, -0.4632997, -2.715566, 0, 1, 0.8980392, 1,
-0.03667969, 1.353885, 1.208813, 0, 1, 0.9058824, 1,
-0.03228157, 0.2887683, 0.9115594, 0, 1, 0.9098039, 1,
-0.03200259, 0.3594414, 1.081782, 0, 1, 0.9176471, 1,
-0.0313273, -0.5860122, -3.04192, 0, 1, 0.9215686, 1,
-0.02798156, 0.1245465, 1.447061, 0, 1, 0.9294118, 1,
-0.02789138, 0.1738811, -1.109701, 0, 1, 0.9333333, 1,
-0.02532066, -0.517886, -4.093928, 0, 1, 0.9411765, 1,
-0.02340128, 0.1652539, -0.005167258, 0, 1, 0.945098, 1,
-0.02230529, -0.2053004, -1.365492, 0, 1, 0.9529412, 1,
-0.02159314, -0.551823, -3.570864, 0, 1, 0.9568627, 1,
-0.02076274, -0.9810595, -2.586221, 0, 1, 0.9647059, 1,
-0.01969554, 0.2717122, 0.5425829, 0, 1, 0.9686275, 1,
-0.01251279, 0.2741055, -0.1033785, 0, 1, 0.9764706, 1,
-0.01052711, 1.422405, 1.017406, 0, 1, 0.9803922, 1,
-0.004365687, 0.56073, 1.585379, 0, 1, 0.9882353, 1,
-9.17936e-05, 0.03822051, -0.5191088, 0, 1, 0.9921569, 1,
0.001680932, -1.093757, 3.484852, 0, 1, 1, 1,
0.003951589, -0.5018635, 2.733207, 0, 0.9921569, 1, 1,
0.00427762, 0.8418854, -0.1223779, 0, 0.9882353, 1, 1,
0.005399497, 1.78223, 0.8136209, 0, 0.9803922, 1, 1,
0.005711361, 0.836233, 0.591311, 0, 0.9764706, 1, 1,
0.007902098, -0.3589401, 2.012846, 0, 0.9686275, 1, 1,
0.009349227, -0.003670257, 3.206656, 0, 0.9647059, 1, 1,
0.01335502, -0.3301778, 2.83385, 0, 0.9568627, 1, 1,
0.01613761, 0.05340674, 1.969717, 0, 0.9529412, 1, 1,
0.01904707, -1.201429, 4.255142, 0, 0.945098, 1, 1,
0.02067031, -0.2775573, 2.570946, 0, 0.9411765, 1, 1,
0.02428341, 1.764552, 1.317333, 0, 0.9333333, 1, 1,
0.02661297, -0.7223135, 4.677205, 0, 0.9294118, 1, 1,
0.02955071, -0.7308356, 2.855405, 0, 0.9215686, 1, 1,
0.03155795, -1.392992, 3.265356, 0, 0.9176471, 1, 1,
0.03187584, 1.240703, 0.4055475, 0, 0.9098039, 1, 1,
0.03675653, 0.5016214, 1.382171, 0, 0.9058824, 1, 1,
0.03719242, 0.5209675, -1.031191, 0, 0.8980392, 1, 1,
0.03983472, -0.2774423, 4.770308, 0, 0.8901961, 1, 1,
0.04079916, 0.6772026, -0.7927959, 0, 0.8862745, 1, 1,
0.04362078, -0.8587475, 2.678987, 0, 0.8784314, 1, 1,
0.04488733, 1.76882, -1.377217, 0, 0.8745098, 1, 1,
0.04948077, -1.035228, 2.436614, 0, 0.8666667, 1, 1,
0.04954066, -1.344693, 3.658724, 0, 0.8627451, 1, 1,
0.05145068, -0.2704614, 3.484465, 0, 0.854902, 1, 1,
0.05445827, -0.8875741, 3.883091, 0, 0.8509804, 1, 1,
0.05529479, 0.5088381, 1.175128, 0, 0.8431373, 1, 1,
0.05970675, -1.417223, 2.687708, 0, 0.8392157, 1, 1,
0.06153394, 1.92618, 0.7943487, 0, 0.8313726, 1, 1,
0.0648189, 0.3639915, -0.3532629, 0, 0.827451, 1, 1,
0.07044963, -0.2705472, 2.990721, 0, 0.8196079, 1, 1,
0.07525754, 0.5268214, 0.07299995, 0, 0.8156863, 1, 1,
0.07646152, 1.180973, -0.5288972, 0, 0.8078431, 1, 1,
0.07725941, -0.2856341, 2.255569, 0, 0.8039216, 1, 1,
0.0854119, 1.617337, -0.8820898, 0, 0.7960784, 1, 1,
0.08643623, 1.34196, -0.129736, 0, 0.7882353, 1, 1,
0.08658899, 0.8674543, 0.04402176, 0, 0.7843137, 1, 1,
0.08895895, -1.799992, 3.299691, 0, 0.7764706, 1, 1,
0.09121946, -1.339683, 3.271887, 0, 0.772549, 1, 1,
0.09215669, -1.50366, 3.956145, 0, 0.7647059, 1, 1,
0.09273612, 0.2046337, 0.5137897, 0, 0.7607843, 1, 1,
0.09948584, -1.465439, 4.051823, 0, 0.7529412, 1, 1,
0.10322, -1.323614, 4.518815, 0, 0.7490196, 1, 1,
0.107246, 1.743001, 0.7793716, 0, 0.7411765, 1, 1,
0.1089916, 0.1758898, 2.267179, 0, 0.7372549, 1, 1,
0.1105179, 1.236971, -0.1201416, 0, 0.7294118, 1, 1,
0.1118339, 0.1421741, 1.54218, 0, 0.7254902, 1, 1,
0.1194521, -0.787499, 2.782972, 0, 0.7176471, 1, 1,
0.1202652, -0.6990154, 2.523415, 0, 0.7137255, 1, 1,
0.1276384, 1.054034, 0.09404387, 0, 0.7058824, 1, 1,
0.1305303, -1.87154, 3.511027, 0, 0.6980392, 1, 1,
0.1328559, -0.0654216, 3.548112, 0, 0.6941177, 1, 1,
0.1349327, 0.1039301, 2.308637, 0, 0.6862745, 1, 1,
0.1369032, 0.8744943, 0.479132, 0, 0.682353, 1, 1,
0.1372401, 1.005083, 0.9054034, 0, 0.6745098, 1, 1,
0.1389358, -1.819885, 3.68125, 0, 0.6705883, 1, 1,
0.1401101, -1.587685, 4.14379, 0, 0.6627451, 1, 1,
0.1439091, -0.3409314, 1.898005, 0, 0.6588235, 1, 1,
0.1446179, 1.416443, -0.3463366, 0, 0.6509804, 1, 1,
0.1505961, -0.266497, 2.262054, 0, 0.6470588, 1, 1,
0.1515371, 1.143163, -0.5701652, 0, 0.6392157, 1, 1,
0.1518444, -0.1904206, 3.414721, 0, 0.6352941, 1, 1,
0.1538113, 1.286463, 0.435029, 0, 0.627451, 1, 1,
0.1574014, 0.710044, -0.6489355, 0, 0.6235294, 1, 1,
0.1637826, -0.0583978, 0.001707255, 0, 0.6156863, 1, 1,
0.1719025, 0.05190905, 2.520442, 0, 0.6117647, 1, 1,
0.1725814, -0.3262878, 2.26169, 0, 0.6039216, 1, 1,
0.1734748, 0.07275382, 1.674448, 0, 0.5960785, 1, 1,
0.1785212, 0.220915, 0.9856786, 0, 0.5921569, 1, 1,
0.1859857, 0.9061501, 1.517865, 0, 0.5843138, 1, 1,
0.1924298, 0.8900112, -1.629447, 0, 0.5803922, 1, 1,
0.1925352, 0.1956691, 2.002915, 0, 0.572549, 1, 1,
0.1961017, 0.5953853, 1.456354, 0, 0.5686275, 1, 1,
0.1979677, 1.835903, -3.275038, 0, 0.5607843, 1, 1,
0.2027718, 0.6836662, 1.416253, 0, 0.5568628, 1, 1,
0.2040163, -0.5405877, 2.195889, 0, 0.5490196, 1, 1,
0.2048422, -0.1145043, 0.5070817, 0, 0.5450981, 1, 1,
0.2123801, 0.01123426, 4.684031, 0, 0.5372549, 1, 1,
0.2125029, 0.00699205, 1.566952, 0, 0.5333334, 1, 1,
0.2163114, -0.4489385, 2.586869, 0, 0.5254902, 1, 1,
0.2168318, -1.265921, 2.332705, 0, 0.5215687, 1, 1,
0.2176247, -1.027552, 3.21479, 0, 0.5137255, 1, 1,
0.218419, -1.138442, 2.620037, 0, 0.509804, 1, 1,
0.2203419, -1.858058, 3.841239, 0, 0.5019608, 1, 1,
0.2240294, -0.823503, 4.093304, 0, 0.4941176, 1, 1,
0.2244179, -0.05780055, 1.865038, 0, 0.4901961, 1, 1,
0.2346537, -2.396163, 0.5707071, 0, 0.4823529, 1, 1,
0.2349829, -0.7915573, 3.143666, 0, 0.4784314, 1, 1,
0.2357084, 1.187887, -0.2949992, 0, 0.4705882, 1, 1,
0.2379318, -0.9446524, 2.730089, 0, 0.4666667, 1, 1,
0.2395966, 1.038148, -0.4782866, 0, 0.4588235, 1, 1,
0.2410154, 1.80645, 1.578497, 0, 0.454902, 1, 1,
0.253012, -1.343777, 2.592895, 0, 0.4470588, 1, 1,
0.2583588, 1.879919, -1.279168, 0, 0.4431373, 1, 1,
0.2584667, 0.9831011, -0.1915717, 0, 0.4352941, 1, 1,
0.2608784, -0.3990859, 2.349043, 0, 0.4313726, 1, 1,
0.2631291, -0.5159622, 4.85516, 0, 0.4235294, 1, 1,
0.2782808, 1.079159, 0.1238328, 0, 0.4196078, 1, 1,
0.2854116, -1.842209, 4.219453, 0, 0.4117647, 1, 1,
0.2856154, 0.1715821, 0.7942674, 0, 0.4078431, 1, 1,
0.2862595, 0.927724, 0.8010685, 0, 0.4, 1, 1,
0.2873217, 0.09495655, -0.7268627, 0, 0.3921569, 1, 1,
0.2882094, 0.1289115, 1.588046, 0, 0.3882353, 1, 1,
0.2891879, -0.5834041, 1.34858, 0, 0.3803922, 1, 1,
0.2893852, -0.7429347, 2.218015, 0, 0.3764706, 1, 1,
0.290489, -0.4568769, 3.454286, 0, 0.3686275, 1, 1,
0.3003508, -0.5934868, 2.984974, 0, 0.3647059, 1, 1,
0.3054278, 0.1253269, 2.354236, 0, 0.3568628, 1, 1,
0.3108377, -1.761373, 1.628107, 0, 0.3529412, 1, 1,
0.3115344, -0.3245652, 3.003449, 0, 0.345098, 1, 1,
0.3176046, 0.3386356, 1.94047, 0, 0.3411765, 1, 1,
0.3256785, -1.030539, 2.888212, 0, 0.3333333, 1, 1,
0.3288086, 0.6098028, 1.163404, 0, 0.3294118, 1, 1,
0.3294176, -0.3670931, 4.404961, 0, 0.3215686, 1, 1,
0.3297325, -1.734766, 2.239429, 0, 0.3176471, 1, 1,
0.335492, -1.190519, 4.081727, 0, 0.3098039, 1, 1,
0.3384786, -1.134465, 2.430676, 0, 0.3058824, 1, 1,
0.3406542, 0.2805063, -0.210365, 0, 0.2980392, 1, 1,
0.3416598, -0.4157582, 3.450125, 0, 0.2901961, 1, 1,
0.3455051, -0.987443, 3.363609, 0, 0.2862745, 1, 1,
0.3457944, 0.3684766, 1.121073, 0, 0.2784314, 1, 1,
0.3458245, -0.4441999, 1.886574, 0, 0.2745098, 1, 1,
0.3473426, 1.387565, -0.7309865, 0, 0.2666667, 1, 1,
0.3503954, 1.538057, -0.5979088, 0, 0.2627451, 1, 1,
0.3582449, 0.4498965, 0.745638, 0, 0.254902, 1, 1,
0.3599271, -1.203897, 3.885784, 0, 0.2509804, 1, 1,
0.3599596, -0.112486, 1.453971, 0, 0.2431373, 1, 1,
0.3687295, 1.323395, 0.05637379, 0, 0.2392157, 1, 1,
0.3714089, 0.543399, 0.4839761, 0, 0.2313726, 1, 1,
0.375017, 0.1530126, 2.40756, 0, 0.227451, 1, 1,
0.377588, 1.636199, -0.3768082, 0, 0.2196078, 1, 1,
0.3794519, 0.4197091, 1.738423, 0, 0.2156863, 1, 1,
0.3803857, -0.1473627, 1.981554, 0, 0.2078431, 1, 1,
0.3819703, 0.8480753, 0.6464798, 0, 0.2039216, 1, 1,
0.3833067, -0.9021739, 1.36702, 0, 0.1960784, 1, 1,
0.3836111, 0.09447727, 0.2553039, 0, 0.1882353, 1, 1,
0.394887, -0.8430449, 2.890847, 0, 0.1843137, 1, 1,
0.3962937, 2.060224, -0.504366, 0, 0.1764706, 1, 1,
0.3963205, -0.8819246, 2.59004, 0, 0.172549, 1, 1,
0.3979715, 0.4854228, 2.199677, 0, 0.1647059, 1, 1,
0.4005361, 0.4749807, 0.2648325, 0, 0.1607843, 1, 1,
0.401682, 1.265049, 0.4234688, 0, 0.1529412, 1, 1,
0.4045855, 0.5175974, 1.156185, 0, 0.1490196, 1, 1,
0.4098806, -0.5828685, 3.900194, 0, 0.1411765, 1, 1,
0.4103829, 0.7256046, 1.315354, 0, 0.1372549, 1, 1,
0.4205356, 0.6221071, 0.4931286, 0, 0.1294118, 1, 1,
0.4254493, -1.419459, 1.458518, 0, 0.1254902, 1, 1,
0.4257106, 1.142598, -1.079723, 0, 0.1176471, 1, 1,
0.4271557, -0.9488364, 2.974819, 0, 0.1137255, 1, 1,
0.4287551, -0.13105, 2.597745, 0, 0.1058824, 1, 1,
0.429384, -0.3416964, 2.511736, 0, 0.09803922, 1, 1,
0.4312067, 1.406121, -0.1924964, 0, 0.09411765, 1, 1,
0.4317964, -0.6833616, 3.687065, 0, 0.08627451, 1, 1,
0.4359164, 2.320296, 1.732624, 0, 0.08235294, 1, 1,
0.4368182, -0.3839993, 3.924134, 0, 0.07450981, 1, 1,
0.4381605, 0.725648, 0.5345277, 0, 0.07058824, 1, 1,
0.4389013, -0.8204201, 2.207596, 0, 0.0627451, 1, 1,
0.4402978, 1.453489, -0.01255256, 0, 0.05882353, 1, 1,
0.4441665, -0.513949, 2.857034, 0, 0.05098039, 1, 1,
0.4471651, -0.2246516, 2.611231, 0, 0.04705882, 1, 1,
0.4487301, 0.5395517, 1.093103, 0, 0.03921569, 1, 1,
0.4517445, -1.362342, 1.720325, 0, 0.03529412, 1, 1,
0.4529373, -0.2743078, 4.25026, 0, 0.02745098, 1, 1,
0.4565361, 1.659219, 0.4362968, 0, 0.02352941, 1, 1,
0.456808, -0.8002934, 2.611261, 0, 0.01568628, 1, 1,
0.4570552, 0.6219556, 1.457862, 0, 0.01176471, 1, 1,
0.4586778, 1.410788, -0.3188156, 0, 0.003921569, 1, 1,
0.4657557, 1.662173, 0.3632498, 0.003921569, 0, 1, 1,
0.4664168, 0.5538996, 0.5283182, 0.007843138, 0, 1, 1,
0.4692805, -0.5349401, 1.822477, 0.01568628, 0, 1, 1,
0.4697287, -0.6730098, 2.013348, 0.01960784, 0, 1, 1,
0.4698558, 0.613373, 1.880902, 0.02745098, 0, 1, 1,
0.4727086, 0.8499081, 0.5012844, 0.03137255, 0, 1, 1,
0.4741017, 1.225337, -0.2849039, 0.03921569, 0, 1, 1,
0.4819008, 1.58829, 0.7121807, 0.04313726, 0, 1, 1,
0.4826773, -0.2812617, 2.352972, 0.05098039, 0, 1, 1,
0.4833007, -0.2726213, 3.899451, 0.05490196, 0, 1, 1,
0.4839952, 0.407972, 0.7184459, 0.0627451, 0, 1, 1,
0.4848384, -0.4384532, 1.191227, 0.06666667, 0, 1, 1,
0.48758, -0.2256518, 2.674767, 0.07450981, 0, 1, 1,
0.4893071, 0.3554189, -0.04479196, 0.07843138, 0, 1, 1,
0.4894366, 0.4959259, 1.067012, 0.08627451, 0, 1, 1,
0.4899534, -2.178591, 2.288565, 0.09019608, 0, 1, 1,
0.4948183, 1.34571, 0.4469665, 0.09803922, 0, 1, 1,
0.4950477, 2.027893, -0.951168, 0.1058824, 0, 1, 1,
0.5023758, -0.73948, 3.412077, 0.1098039, 0, 1, 1,
0.5048569, -1.059154, 1.871766, 0.1176471, 0, 1, 1,
0.5068212, 0.7989814, -0.3456468, 0.1215686, 0, 1, 1,
0.5071667, -0.3803209, 1.872716, 0.1294118, 0, 1, 1,
0.5088781, 0.0535259, 0.3529339, 0.1333333, 0, 1, 1,
0.5138038, -0.06433681, 1.861349, 0.1411765, 0, 1, 1,
0.5164714, -0.7128248, 2.801799, 0.145098, 0, 1, 1,
0.518244, 0.6016806, 1.913, 0.1529412, 0, 1, 1,
0.5198822, 0.968728, -0.8652726, 0.1568628, 0, 1, 1,
0.5211424, -1.49806, 2.267082, 0.1647059, 0, 1, 1,
0.5218672, 0.5993456, 0.3349988, 0.1686275, 0, 1, 1,
0.5310324, 1.944078, 0.9951318, 0.1764706, 0, 1, 1,
0.5371888, 0.4004587, 0.7864335, 0.1803922, 0, 1, 1,
0.5377097, -0.03658028, 1.054637, 0.1882353, 0, 1, 1,
0.5378001, -0.4989937, 1.410231, 0.1921569, 0, 1, 1,
0.53819, 0.4700446, -0.2490884, 0.2, 0, 1, 1,
0.5393797, -0.1875529, 1.497973, 0.2078431, 0, 1, 1,
0.5396306, -0.934177, 3.044447, 0.2117647, 0, 1, 1,
0.5411532, 0.02382153, 3.009122, 0.2196078, 0, 1, 1,
0.5422013, -0.2169794, 1.695586, 0.2235294, 0, 1, 1,
0.547438, -1.214302, 2.034833, 0.2313726, 0, 1, 1,
0.5483389, 0.1944967, 1.549708, 0.2352941, 0, 1, 1,
0.5485202, 0.4055491, 0.8709825, 0.2431373, 0, 1, 1,
0.5505156, -0.170263, 1.071375, 0.2470588, 0, 1, 1,
0.551972, 1.381071, -0.3187512, 0.254902, 0, 1, 1,
0.554262, -0.05909283, 0.1005559, 0.2588235, 0, 1, 1,
0.556302, -0.09847748, 3.112158, 0.2666667, 0, 1, 1,
0.5621791, -0.7990429, 1.596247, 0.2705882, 0, 1, 1,
0.5623604, -0.5979719, 0.5252302, 0.2784314, 0, 1, 1,
0.5627504, 1.41964, 0.2368037, 0.282353, 0, 1, 1,
0.567898, -0.317567, 3.42245, 0.2901961, 0, 1, 1,
0.5705436, -0.4950203, 2.583131, 0.2941177, 0, 1, 1,
0.578339, 0.6479779, -0.9546108, 0.3019608, 0, 1, 1,
0.580074, -0.04128126, 2.664434, 0.3098039, 0, 1, 1,
0.5969082, -0.1677376, 1.753716, 0.3137255, 0, 1, 1,
0.5981491, 0.3733047, 4.052938, 0.3215686, 0, 1, 1,
0.5995459, 1.062176, 2.932132, 0.3254902, 0, 1, 1,
0.6070451, 0.7624388, 1.688944, 0.3333333, 0, 1, 1,
0.6088897, 0.4421798, 1.344246, 0.3372549, 0, 1, 1,
0.614222, -0.7806906, 4.062614, 0.345098, 0, 1, 1,
0.6190693, -0.4592764, 3.368364, 0.3490196, 0, 1, 1,
0.6228961, 1.603219, -0.4091993, 0.3568628, 0, 1, 1,
0.6278253, -0.264645, 3.608369, 0.3607843, 0, 1, 1,
0.6287118, -0.7673662, 2.92296, 0.3686275, 0, 1, 1,
0.6340448, 0.08807824, 0.7084199, 0.372549, 0, 1, 1,
0.6374708, -1.134487, 1.709509, 0.3803922, 0, 1, 1,
0.6408504, -1.904998, 3.673968, 0.3843137, 0, 1, 1,
0.6433154, -0.6333089, 2.695603, 0.3921569, 0, 1, 1,
0.6467866, -0.231434, 1.147602, 0.3960784, 0, 1, 1,
0.653126, 0.8916959, 2.938187, 0.4039216, 0, 1, 1,
0.656234, 2.344684, -0.08370872, 0.4117647, 0, 1, 1,
0.6564974, 0.9277678, 0.5600917, 0.4156863, 0, 1, 1,
0.6609802, 0.498163, -0.03285683, 0.4235294, 0, 1, 1,
0.6621345, -0.9967901, 1.997026, 0.427451, 0, 1, 1,
0.6644658, -0.5923532, 2.925053, 0.4352941, 0, 1, 1,
0.6661711, -0.5940257, 3.078599, 0.4392157, 0, 1, 1,
0.6679758, -0.9364965, 4.230324, 0.4470588, 0, 1, 1,
0.6762791, -2.235076, 2.385783, 0.4509804, 0, 1, 1,
0.6896897, 0.4690681, 1.167373, 0.4588235, 0, 1, 1,
0.6902195, 1.458292, 0.2133788, 0.4627451, 0, 1, 1,
0.6927134, -0.339088, 2.987597, 0.4705882, 0, 1, 1,
0.6934958, -1.342366, 2.288207, 0.4745098, 0, 1, 1,
0.6978414, -1.05235, 3.129971, 0.4823529, 0, 1, 1,
0.7007712, 0.04478223, 0.5074283, 0.4862745, 0, 1, 1,
0.7045651, 1.235101, 0.9731094, 0.4941176, 0, 1, 1,
0.7075508, -0.7918203, 2.001361, 0.5019608, 0, 1, 1,
0.7140129, 0.5346115, 0.261511, 0.5058824, 0, 1, 1,
0.716607, -0.09863865, 1.577829, 0.5137255, 0, 1, 1,
0.7224099, -0.2134188, 2.186941, 0.5176471, 0, 1, 1,
0.7309819, -0.5412518, -1.340984, 0.5254902, 0, 1, 1,
0.7417806, -0.4568416, 2.638838, 0.5294118, 0, 1, 1,
0.7424722, -0.6522059, 2.796769, 0.5372549, 0, 1, 1,
0.7441149, 0.6643123, 0.8244829, 0.5411765, 0, 1, 1,
0.7464108, 0.2869864, 3.498185, 0.5490196, 0, 1, 1,
0.7469584, 1.589643, 0.2177193, 0.5529412, 0, 1, 1,
0.750338, -0.2201169, 2.684491, 0.5607843, 0, 1, 1,
0.7521558, -0.4570122, -0.03056099, 0.5647059, 0, 1, 1,
0.7524474, 0.9021585, 0.8477119, 0.572549, 0, 1, 1,
0.7562923, -0.03961953, 1.749623, 0.5764706, 0, 1, 1,
0.7571194, 0.3841847, 1.328408, 0.5843138, 0, 1, 1,
0.7630363, -1.574771, 3.19517, 0.5882353, 0, 1, 1,
0.7643721, -0.4222151, 1.856729, 0.5960785, 0, 1, 1,
0.7681409, 0.6358942, -0.8786139, 0.6039216, 0, 1, 1,
0.7697713, 0.6251844, 3.223418, 0.6078432, 0, 1, 1,
0.7727252, -1.325282, 3.075931, 0.6156863, 0, 1, 1,
0.7774306, -0.5927573, 2.710631, 0.6196079, 0, 1, 1,
0.7835895, -0.2650763, 0.412618, 0.627451, 0, 1, 1,
0.7852097, 1.956902, -0.5322569, 0.6313726, 0, 1, 1,
0.7865686, -0.222111, 2.294036, 0.6392157, 0, 1, 1,
0.7879689, 0.07457246, -0.5638846, 0.6431373, 0, 1, 1,
0.7925251, -0.5276544, 2.207904, 0.6509804, 0, 1, 1,
0.7958121, -1.11195, 2.281, 0.654902, 0, 1, 1,
0.8011493, -0.492558, 2.725406, 0.6627451, 0, 1, 1,
0.8066263, 0.229556, 0.8698288, 0.6666667, 0, 1, 1,
0.8080291, 0.1115577, 1.374107, 0.6745098, 0, 1, 1,
0.8101763, 0.6198667, 0.3120421, 0.6784314, 0, 1, 1,
0.817865, 0.9434568, 0.1316208, 0.6862745, 0, 1, 1,
0.8179994, 0.4949751, 3.258904, 0.6901961, 0, 1, 1,
0.8288192, -0.2419189, 2.745399, 0.6980392, 0, 1, 1,
0.8356286, 0.319831, 0.9754232, 0.7058824, 0, 1, 1,
0.836192, 0.4358283, 0.6471776, 0.7098039, 0, 1, 1,
0.8405442, -0.1547823, 2.326866, 0.7176471, 0, 1, 1,
0.842712, -0.4198171, 0.2649765, 0.7215686, 0, 1, 1,
0.8433432, -2.138012, 3.748282, 0.7294118, 0, 1, 1,
0.8470947, 1.113957, -1.146066, 0.7333333, 0, 1, 1,
0.8503776, -0.67024, 1.631359, 0.7411765, 0, 1, 1,
0.8550783, -1.167363, 3.048506, 0.7450981, 0, 1, 1,
0.8563188, 0.1662166, 1.82023, 0.7529412, 0, 1, 1,
0.8576827, -0.01907122, 1.340188, 0.7568628, 0, 1, 1,
0.8602171, 0.02021518, 0.5860046, 0.7647059, 0, 1, 1,
0.8605573, 0.01816978, 1.239749, 0.7686275, 0, 1, 1,
0.8626757, -0.3797623, 1.361003, 0.7764706, 0, 1, 1,
0.8644888, -0.2416964, -0.4932358, 0.7803922, 0, 1, 1,
0.8714476, 0.066613, 1.147959, 0.7882353, 0, 1, 1,
0.8734847, 1.990398, 1.863448, 0.7921569, 0, 1, 1,
0.8909912, -0.0554352, 0.7882876, 0.8, 0, 1, 1,
0.8952831, 0.5116538, -0.6911005, 0.8078431, 0, 1, 1,
0.9081007, -0.1668889, 2.695572, 0.8117647, 0, 1, 1,
0.9114903, -0.3034671, 3.027627, 0.8196079, 0, 1, 1,
0.9158555, 0.03628246, 1.526855, 0.8235294, 0, 1, 1,
0.9203676, 2.567735, 0.6011486, 0.8313726, 0, 1, 1,
0.923816, 0.2128844, 1.803867, 0.8352941, 0, 1, 1,
0.9241358, 1.244471, 1.254248, 0.8431373, 0, 1, 1,
0.9272549, -0.05429766, 3.67984, 0.8470588, 0, 1, 1,
0.9287194, 0.580599, 0.09388459, 0.854902, 0, 1, 1,
0.9312262, 0.03381275, 2.264029, 0.8588235, 0, 1, 1,
0.9327152, -1.505856, 2.298251, 0.8666667, 0, 1, 1,
0.9338462, 2.553506, 1.85313, 0.8705882, 0, 1, 1,
0.9380174, -0.301966, 1.169961, 0.8784314, 0, 1, 1,
0.9450938, 0.9668012, 0.5553647, 0.8823529, 0, 1, 1,
0.9453247, -0.1702805, 0.8144918, 0.8901961, 0, 1, 1,
0.951821, -0.6201431, 2.559782, 0.8941177, 0, 1, 1,
0.95712, 0.1681644, 3.175569, 0.9019608, 0, 1, 1,
0.957619, -0.8758311, 0.7332938, 0.9098039, 0, 1, 1,
0.963199, -1.29498, 2.554005, 0.9137255, 0, 1, 1,
0.9742908, -1.280194, 3.875928, 0.9215686, 0, 1, 1,
0.9754947, 0.7011674, 2.239925, 0.9254902, 0, 1, 1,
0.9911007, 0.1222075, -0.02306621, 0.9333333, 0, 1, 1,
0.9936434, 0.745227, 1.556273, 0.9372549, 0, 1, 1,
0.994452, 0.1171016, 1.712088, 0.945098, 0, 1, 1,
1.000139, 1.777027, 0.267098, 0.9490196, 0, 1, 1,
1.004608, 1.074542, 2.067487, 0.9568627, 0, 1, 1,
1.006169, -0.0606466, 1.915076, 0.9607843, 0, 1, 1,
1.010048, -1.338463, 1.580317, 0.9686275, 0, 1, 1,
1.020518, 0.942789, 0.8603378, 0.972549, 0, 1, 1,
1.02081, -0.7612551, 0.2840873, 0.9803922, 0, 1, 1,
1.027201, 0.1056972, 0.6732511, 0.9843137, 0, 1, 1,
1.039144, 0.01476381, -0.7395521, 0.9921569, 0, 1, 1,
1.046011, 1.88776, -0.3191087, 0.9960784, 0, 1, 1,
1.051611, -0.3170872, 2.545889, 1, 0, 0.9960784, 1,
1.069569, -0.317018, 2.338392, 1, 0, 0.9882353, 1,
1.073864, 1.792716, 0.5236475, 1, 0, 0.9843137, 1,
1.0808, 0.4925338, 0.5471061, 1, 0, 0.9764706, 1,
1.081114, 2.323286, 0.8873543, 1, 0, 0.972549, 1,
1.081322, -2.244329, 1.329236, 1, 0, 0.9647059, 1,
1.081672, -1.507888, 2.778463, 1, 0, 0.9607843, 1,
1.087561, 1.362244, -0.07619464, 1, 0, 0.9529412, 1,
1.090662, -0.7353521, 3.464379, 1, 0, 0.9490196, 1,
1.10018, 0.1932744, 1.665421, 1, 0, 0.9411765, 1,
1.101386, 1.202947, 1.23476, 1, 0, 0.9372549, 1,
1.110928, -0.2149643, 1.986236, 1, 0, 0.9294118, 1,
1.117122, 1.977032, -0.0008521853, 1, 0, 0.9254902, 1,
1.119499, -0.225088, 0.2815812, 1, 0, 0.9176471, 1,
1.120201, 1.47354, 0.8201904, 1, 0, 0.9137255, 1,
1.120325, 1.239382, 0.6572577, 1, 0, 0.9058824, 1,
1.123717, -0.4214201, 0.5434898, 1, 0, 0.9019608, 1,
1.129417, -0.3119388, 1.511215, 1, 0, 0.8941177, 1,
1.136836, 1.424957, 1.406335, 1, 0, 0.8862745, 1,
1.145925, 1.16816, -0.5513991, 1, 0, 0.8823529, 1,
1.151003, -0.1110382, 1.677099, 1, 0, 0.8745098, 1,
1.152078, 0.4813314, 2.555918, 1, 0, 0.8705882, 1,
1.155684, -0.2521669, 1.792631, 1, 0, 0.8627451, 1,
1.156837, -1.235434, 1.448669, 1, 0, 0.8588235, 1,
1.160538, -0.6143659, 0.9627774, 1, 0, 0.8509804, 1,
1.161131, 0.4121105, 2.505275, 1, 0, 0.8470588, 1,
1.161455, 0.7557988, 1.502859, 1, 0, 0.8392157, 1,
1.161533, 0.688661, 0.2183181, 1, 0, 0.8352941, 1,
1.161657, -0.0919695, 1.15507, 1, 0, 0.827451, 1,
1.162425, 0.3149066, -0.7725879, 1, 0, 0.8235294, 1,
1.162633, -1.085877, 1.888496, 1, 0, 0.8156863, 1,
1.16552, -0.1916655, 1.763699, 1, 0, 0.8117647, 1,
1.167359, -1.584145, 1.593781, 1, 0, 0.8039216, 1,
1.17174, -0.8934768, 2.160926, 1, 0, 0.7960784, 1,
1.176384, -0.9644195, 3.108363, 1, 0, 0.7921569, 1,
1.177558, 0.8977875, 0.4686574, 1, 0, 0.7843137, 1,
1.178091, 0.2604312, 1.684607, 1, 0, 0.7803922, 1,
1.180615, 1.176609, 1.288391, 1, 0, 0.772549, 1,
1.184242, 2.185164, 0.100286, 1, 0, 0.7686275, 1,
1.18504, -1.076071, 1.400077, 1, 0, 0.7607843, 1,
1.189853, 0.9586936, 2.624269, 1, 0, 0.7568628, 1,
1.193227, 1.158499, 0.4894147, 1, 0, 0.7490196, 1,
1.202974, 0.9258019, 1.783162, 1, 0, 0.7450981, 1,
1.204329, 0.7597983, 0.9961182, 1, 0, 0.7372549, 1,
1.209029, 0.2488198, 1.424702, 1, 0, 0.7333333, 1,
1.211665, 0.7977585, 1.022713, 1, 0, 0.7254902, 1,
1.213512, -0.4077794, 1.58454, 1, 0, 0.7215686, 1,
1.218448, -0.4544944, 0.4925247, 1, 0, 0.7137255, 1,
1.220815, 0.3385497, 1.670943, 1, 0, 0.7098039, 1,
1.221343, 0.6894317, 0.3195961, 1, 0, 0.7019608, 1,
1.224125, 0.1287612, 0.8373756, 1, 0, 0.6941177, 1,
1.225895, -1.428765, 1.983522, 1, 0, 0.6901961, 1,
1.235891, 1.221847, -0.02397429, 1, 0, 0.682353, 1,
1.237441, -0.399717, 2.981303, 1, 0, 0.6784314, 1,
1.249748, -0.829373, 1.783179, 1, 0, 0.6705883, 1,
1.252397, -0.4216971, 1.839311, 1, 0, 0.6666667, 1,
1.257293, 0.3665066, 0.6995294, 1, 0, 0.6588235, 1,
1.271802, 0.01921223, 0.9615858, 1, 0, 0.654902, 1,
1.273911, 0.690999, 1.588546, 1, 0, 0.6470588, 1,
1.274498, 0.184536, 1.162303, 1, 0, 0.6431373, 1,
1.282742, -0.8413864, 1.794999, 1, 0, 0.6352941, 1,
1.286438, 0.7896048, 0.7254677, 1, 0, 0.6313726, 1,
1.293019, 0.91497, 0.1889133, 1, 0, 0.6235294, 1,
1.304573, 1.760122, 0.5976222, 1, 0, 0.6196079, 1,
1.306762, 0.7208146, 0.9633375, 1, 0, 0.6117647, 1,
1.309678, -2.353809, 3.156558, 1, 0, 0.6078432, 1,
1.320475, 0.9043499, 1.169029, 1, 0, 0.6, 1,
1.324139, 0.480872, 1.824231, 1, 0, 0.5921569, 1,
1.331882, -1.102028, 2.879784, 1, 0, 0.5882353, 1,
1.337957, 0.5036218, 1.616765, 1, 0, 0.5803922, 1,
1.340647, 0.3393695, 2.116771, 1, 0, 0.5764706, 1,
1.342112, 0.8259705, 1.47216, 1, 0, 0.5686275, 1,
1.347026, -0.3572105, 2.567286, 1, 0, 0.5647059, 1,
1.350898, -0.09200563, 1.308436, 1, 0, 0.5568628, 1,
1.362634, 0.1522662, 0.702808, 1, 0, 0.5529412, 1,
1.36593, -0.5591658, 1.450255, 1, 0, 0.5450981, 1,
1.366248, -0.4607259, 4.457191, 1, 0, 0.5411765, 1,
1.367675, -0.125562, 1.104721, 1, 0, 0.5333334, 1,
1.368209, -0.311192, 1.65696, 1, 0, 0.5294118, 1,
1.381239, -0.2389242, 2.445437, 1, 0, 0.5215687, 1,
1.386729, -1.250166, 1.745913, 1, 0, 0.5176471, 1,
1.393254, -0.6160614, 1.839639, 1, 0, 0.509804, 1,
1.400302, -0.1586292, 1.727403, 1, 0, 0.5058824, 1,
1.400927, 1.15444, 1.269081, 1, 0, 0.4980392, 1,
1.401616, -1.924687, 2.666866, 1, 0, 0.4901961, 1,
1.402757, -0.05789614, 0.1140965, 1, 0, 0.4862745, 1,
1.407709, 0.1358879, 1.075331, 1, 0, 0.4784314, 1,
1.407903, 1.157758, -1.088131, 1, 0, 0.4745098, 1,
1.410442, -1.537898, 3.445241, 1, 0, 0.4666667, 1,
1.417783, -0.3181207, 1.437408, 1, 0, 0.4627451, 1,
1.419714, -1.960573, 2.599822, 1, 0, 0.454902, 1,
1.432033, -0.2313695, 1.644363, 1, 0, 0.4509804, 1,
1.435163, -0.4673228, 2.278213, 1, 0, 0.4431373, 1,
1.437512, -1.432649, 2.91271, 1, 0, 0.4392157, 1,
1.438634, 1.619669, 1.783415, 1, 0, 0.4313726, 1,
1.440029, -1.635844, 1.821789, 1, 0, 0.427451, 1,
1.444938, 0.6972774, 0.5443304, 1, 0, 0.4196078, 1,
1.448744, -1.373423, 2.423264, 1, 0, 0.4156863, 1,
1.456653, -1.095731, 1.298548, 1, 0, 0.4078431, 1,
1.45877, 0.3047494, 0.3782122, 1, 0, 0.4039216, 1,
1.459705, 0.7398591, 0.9887729, 1, 0, 0.3960784, 1,
1.468554, 1.202204, 1.023084, 1, 0, 0.3882353, 1,
1.468615, -2.084704, 3.713002, 1, 0, 0.3843137, 1,
1.474788, -0.4930193, 1.598289, 1, 0, 0.3764706, 1,
1.493931, -0.4448905, 2.526488, 1, 0, 0.372549, 1,
1.500283, 0.4874797, 0.7446039, 1, 0, 0.3647059, 1,
1.510203, 0.6254377, 2.121257, 1, 0, 0.3607843, 1,
1.52152, 0.9691632, 2.359716, 1, 0, 0.3529412, 1,
1.53617, 0.01604668, 1.183985, 1, 0, 0.3490196, 1,
1.570253, -0.1022382, -0.3083459, 1, 0, 0.3411765, 1,
1.573492, 0.5127726, 2.281398, 1, 0, 0.3372549, 1,
1.574162, -0.4833247, 3.111427, 1, 0, 0.3294118, 1,
1.574793, 0.3637908, 1.370436, 1, 0, 0.3254902, 1,
1.580059, 1.240537, 0.9218426, 1, 0, 0.3176471, 1,
1.593457, -1.895893, 2.501705, 1, 0, 0.3137255, 1,
1.623832, -0.01792735, 3.923294, 1, 0, 0.3058824, 1,
1.627274, -1.052548, 0.7003008, 1, 0, 0.2980392, 1,
1.631329, 0.8551549, -1.593534, 1, 0, 0.2941177, 1,
1.633915, -0.3673324, 2.750984, 1, 0, 0.2862745, 1,
1.640808, 0.885293, 2.301744, 1, 0, 0.282353, 1,
1.645227, 0.3344677, 0.8626972, 1, 0, 0.2745098, 1,
1.646718, 1.937109, 2.781793, 1, 0, 0.2705882, 1,
1.656823, 1.010503, 1.303196, 1, 0, 0.2627451, 1,
1.664004, -1.792131, 2.552154, 1, 0, 0.2588235, 1,
1.695318, -0.7609889, 2.832021, 1, 0, 0.2509804, 1,
1.698807, 1.312584, 1.3853, 1, 0, 0.2470588, 1,
1.724951, 1.932861, 2.198741, 1, 0, 0.2392157, 1,
1.727073, 0.5402697, 1.578755, 1, 0, 0.2352941, 1,
1.73793, -0.2980256, 1.942044, 1, 0, 0.227451, 1,
1.776795, 0.004925591, -0.2703294, 1, 0, 0.2235294, 1,
1.777239, 0.9362991, 0.6942063, 1, 0, 0.2156863, 1,
1.779631, -1.152573, 2.139304, 1, 0, 0.2117647, 1,
1.780714, -0.2621658, 2.402976, 1, 0, 0.2039216, 1,
1.805159, 0.7979076, 2.405499, 1, 0, 0.1960784, 1,
1.827839, -1.165275, 1.212662, 1, 0, 0.1921569, 1,
1.8345, 1.742896, -0.3760002, 1, 0, 0.1843137, 1,
1.847883, -0.4293003, 1.183578, 1, 0, 0.1803922, 1,
1.848359, 0.4868349, 2.145009, 1, 0, 0.172549, 1,
1.86327, 0.9774652, 1.092437, 1, 0, 0.1686275, 1,
1.872431, 0.1071498, 2.697217, 1, 0, 0.1607843, 1,
1.875602, -1.935382, -0.4617713, 1, 0, 0.1568628, 1,
1.884259, -0.08260748, 1.860295, 1, 0, 0.1490196, 1,
1.884333, 0.2172296, 2.481628, 1, 0, 0.145098, 1,
1.909594, -0.7522362, 1.070722, 1, 0, 0.1372549, 1,
1.913029, 1.050656, 0.04420276, 1, 0, 0.1333333, 1,
1.917067, -0.4621867, 0.6639363, 1, 0, 0.1254902, 1,
1.919816, 0.1015049, 1.4769, 1, 0, 0.1215686, 1,
1.955971, -1.911185, 2.350275, 1, 0, 0.1137255, 1,
1.987152, 0.4572907, 0.9221484, 1, 0, 0.1098039, 1,
1.994114, -0.9537793, 2.961632, 1, 0, 0.1019608, 1,
1.998769, 0.6669296, 0.985269, 1, 0, 0.09411765, 1,
2.011842, -0.6947914, 2.68677, 1, 0, 0.09019608, 1,
2.110778, -1.082367, 1.061384, 1, 0, 0.08235294, 1,
2.132243, 0.3352091, 2.775407, 1, 0, 0.07843138, 1,
2.148358, -0.6233788, 1.628561, 1, 0, 0.07058824, 1,
2.189937, 2.005359, -0.2256556, 1, 0, 0.06666667, 1,
2.289996, 0.7138764, 1.437473, 1, 0, 0.05882353, 1,
2.311526, 0.6317337, 0.6755453, 1, 0, 0.05490196, 1,
2.347243, 0.3735115, 1.103742, 1, 0, 0.04705882, 1,
2.41776, 1.440157, 1.029317, 1, 0, 0.04313726, 1,
2.449922, -0.5638399, 1.60922, 1, 0, 0.03529412, 1,
2.649899, -0.2184974, 1.516654, 1, 0, 0.03137255, 1,
2.719342, -0.7569939, 2.749434, 1, 0, 0.02352941, 1,
2.873328, 0.4793673, 2.133006, 1, 0, 0.01960784, 1,
3.458341, 0.6304961, 1.778821, 1, 0, 0.01176471, 1,
3.661789, -0.1876975, 1.424451, 1, 0, 0.007843138, 1
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
0.2562262, -4.464462, -8.011825, 0, -0.5, 0.5, 0.5,
0.2562262, -4.464462, -8.011825, 1, -0.5, 0.5, 0.5,
0.2562262, -4.464462, -8.011825, 1, 1.5, 0.5, 0.5,
0.2562262, -4.464462, -8.011825, 0, 1.5, 0.5, 0.5
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
-4.303823, -0.3089268, -8.011825, 0, -0.5, 0.5, 0.5,
-4.303823, -0.3089268, -8.011825, 1, -0.5, 0.5, 0.5,
-4.303823, -0.3089268, -8.011825, 1, 1.5, 0.5, 0.5,
-4.303823, -0.3089268, -8.011825, 0, 1.5, 0.5, 0.5
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
-4.303823, -4.464462, -0.6459019, 0, -0.5, 0.5, 0.5,
-4.303823, -4.464462, -0.6459019, 1, -0.5, 0.5, 0.5,
-4.303823, -4.464462, -0.6459019, 1, 1.5, 0.5, 0.5,
-4.303823, -4.464462, -0.6459019, 0, 1.5, 0.5, 0.5
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
-3, -3.505492, -6.311996,
3, -3.505492, -6.311996,
-3, -3.505492, -6.311996,
-3, -3.665321, -6.595301,
-2, -3.505492, -6.311996,
-2, -3.665321, -6.595301,
-1, -3.505492, -6.311996,
-1, -3.665321, -6.595301,
0, -3.505492, -6.311996,
0, -3.665321, -6.595301,
1, -3.505492, -6.311996,
1, -3.665321, -6.595301,
2, -3.505492, -6.311996,
2, -3.665321, -6.595301,
3, -3.505492, -6.311996,
3, -3.665321, -6.595301
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
-3, -3.984977, -7.16191, 0, -0.5, 0.5, 0.5,
-3, -3.984977, -7.16191, 1, -0.5, 0.5, 0.5,
-3, -3.984977, -7.16191, 1, 1.5, 0.5, 0.5,
-3, -3.984977, -7.16191, 0, 1.5, 0.5, 0.5,
-2, -3.984977, -7.16191, 0, -0.5, 0.5, 0.5,
-2, -3.984977, -7.16191, 1, -0.5, 0.5, 0.5,
-2, -3.984977, -7.16191, 1, 1.5, 0.5, 0.5,
-2, -3.984977, -7.16191, 0, 1.5, 0.5, 0.5,
-1, -3.984977, -7.16191, 0, -0.5, 0.5, 0.5,
-1, -3.984977, -7.16191, 1, -0.5, 0.5, 0.5,
-1, -3.984977, -7.16191, 1, 1.5, 0.5, 0.5,
-1, -3.984977, -7.16191, 0, 1.5, 0.5, 0.5,
0, -3.984977, -7.16191, 0, -0.5, 0.5, 0.5,
0, -3.984977, -7.16191, 1, -0.5, 0.5, 0.5,
0, -3.984977, -7.16191, 1, 1.5, 0.5, 0.5,
0, -3.984977, -7.16191, 0, 1.5, 0.5, 0.5,
1, -3.984977, -7.16191, 0, -0.5, 0.5, 0.5,
1, -3.984977, -7.16191, 1, -0.5, 0.5, 0.5,
1, -3.984977, -7.16191, 1, 1.5, 0.5, 0.5,
1, -3.984977, -7.16191, 0, 1.5, 0.5, 0.5,
2, -3.984977, -7.16191, 0, -0.5, 0.5, 0.5,
2, -3.984977, -7.16191, 1, -0.5, 0.5, 0.5,
2, -3.984977, -7.16191, 1, 1.5, 0.5, 0.5,
2, -3.984977, -7.16191, 0, 1.5, 0.5, 0.5,
3, -3.984977, -7.16191, 0, -0.5, 0.5, 0.5,
3, -3.984977, -7.16191, 1, -0.5, 0.5, 0.5,
3, -3.984977, -7.16191, 1, 1.5, 0.5, 0.5,
3, -3.984977, -7.16191, 0, 1.5, 0.5, 0.5
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
-3.251504, -3, -6.311996,
-3.251504, 2, -6.311996,
-3.251504, -3, -6.311996,
-3.42689, -3, -6.595301,
-3.251504, -2, -6.311996,
-3.42689, -2, -6.595301,
-3.251504, -1, -6.311996,
-3.42689, -1, -6.595301,
-3.251504, 0, -6.311996,
-3.42689, 0, -6.595301,
-3.251504, 1, -6.311996,
-3.42689, 1, -6.595301,
-3.251504, 2, -6.311996,
-3.42689, 2, -6.595301
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
-3.777663, -3, -7.16191, 0, -0.5, 0.5, 0.5,
-3.777663, -3, -7.16191, 1, -0.5, 0.5, 0.5,
-3.777663, -3, -7.16191, 1, 1.5, 0.5, 0.5,
-3.777663, -3, -7.16191, 0, 1.5, 0.5, 0.5,
-3.777663, -2, -7.16191, 0, -0.5, 0.5, 0.5,
-3.777663, -2, -7.16191, 1, -0.5, 0.5, 0.5,
-3.777663, -2, -7.16191, 1, 1.5, 0.5, 0.5,
-3.777663, -2, -7.16191, 0, 1.5, 0.5, 0.5,
-3.777663, -1, -7.16191, 0, -0.5, 0.5, 0.5,
-3.777663, -1, -7.16191, 1, -0.5, 0.5, 0.5,
-3.777663, -1, -7.16191, 1, 1.5, 0.5, 0.5,
-3.777663, -1, -7.16191, 0, 1.5, 0.5, 0.5,
-3.777663, 0, -7.16191, 0, -0.5, 0.5, 0.5,
-3.777663, 0, -7.16191, 1, -0.5, 0.5, 0.5,
-3.777663, 0, -7.16191, 1, 1.5, 0.5, 0.5,
-3.777663, 0, -7.16191, 0, 1.5, 0.5, 0.5,
-3.777663, 1, -7.16191, 0, -0.5, 0.5, 0.5,
-3.777663, 1, -7.16191, 1, -0.5, 0.5, 0.5,
-3.777663, 1, -7.16191, 1, 1.5, 0.5, 0.5,
-3.777663, 1, -7.16191, 0, 1.5, 0.5, 0.5,
-3.777663, 2, -7.16191, 0, -0.5, 0.5, 0.5,
-3.777663, 2, -7.16191, 1, -0.5, 0.5, 0.5,
-3.777663, 2, -7.16191, 1, 1.5, 0.5, 0.5,
-3.777663, 2, -7.16191, 0, 1.5, 0.5, 0.5
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
-3.251504, -3.505492, -6,
-3.251504, -3.505492, 4,
-3.251504, -3.505492, -6,
-3.42689, -3.665321, -6,
-3.251504, -3.505492, -4,
-3.42689, -3.665321, -4,
-3.251504, -3.505492, -2,
-3.42689, -3.665321, -2,
-3.251504, -3.505492, 0,
-3.42689, -3.665321, 0,
-3.251504, -3.505492, 2,
-3.42689, -3.665321, 2,
-3.251504, -3.505492, 4,
-3.42689, -3.665321, 4
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
-3.777663, -3.984977, -6, 0, -0.5, 0.5, 0.5,
-3.777663, -3.984977, -6, 1, -0.5, 0.5, 0.5,
-3.777663, -3.984977, -6, 1, 1.5, 0.5, 0.5,
-3.777663, -3.984977, -6, 0, 1.5, 0.5, 0.5,
-3.777663, -3.984977, -4, 0, -0.5, 0.5, 0.5,
-3.777663, -3.984977, -4, 1, -0.5, 0.5, 0.5,
-3.777663, -3.984977, -4, 1, 1.5, 0.5, 0.5,
-3.777663, -3.984977, -4, 0, 1.5, 0.5, 0.5,
-3.777663, -3.984977, -2, 0, -0.5, 0.5, 0.5,
-3.777663, -3.984977, -2, 1, -0.5, 0.5, 0.5,
-3.777663, -3.984977, -2, 1, 1.5, 0.5, 0.5,
-3.777663, -3.984977, -2, 0, 1.5, 0.5, 0.5,
-3.777663, -3.984977, 0, 0, -0.5, 0.5, 0.5,
-3.777663, -3.984977, 0, 1, -0.5, 0.5, 0.5,
-3.777663, -3.984977, 0, 1, 1.5, 0.5, 0.5,
-3.777663, -3.984977, 0, 0, 1.5, 0.5, 0.5,
-3.777663, -3.984977, 2, 0, -0.5, 0.5, 0.5,
-3.777663, -3.984977, 2, 1, -0.5, 0.5, 0.5,
-3.777663, -3.984977, 2, 1, 1.5, 0.5, 0.5,
-3.777663, -3.984977, 2, 0, 1.5, 0.5, 0.5,
-3.777663, -3.984977, 4, 0, -0.5, 0.5, 0.5,
-3.777663, -3.984977, 4, 1, -0.5, 0.5, 0.5,
-3.777663, -3.984977, 4, 1, 1.5, 0.5, 0.5,
-3.777663, -3.984977, 4, 0, 1.5, 0.5, 0.5
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
-3.251504, -3.505492, -6.311996,
-3.251504, 2.887639, -6.311996,
-3.251504, -3.505492, 5.020192,
-3.251504, 2.887639, 5.020192,
-3.251504, -3.505492, -6.311996,
-3.251504, -3.505492, 5.020192,
-3.251504, 2.887639, -6.311996,
-3.251504, 2.887639, 5.020192,
-3.251504, -3.505492, -6.311996,
3.763956, -3.505492, -6.311996,
-3.251504, -3.505492, 5.020192,
3.763956, -3.505492, 5.020192,
-3.251504, 2.887639, -6.311996,
3.763956, 2.887639, -6.311996,
-3.251504, 2.887639, 5.020192,
3.763956, 2.887639, 5.020192,
3.763956, -3.505492, -6.311996,
3.763956, 2.887639, -6.311996,
3.763956, -3.505492, 5.020192,
3.763956, 2.887639, 5.020192,
3.763956, -3.505492, -6.311996,
3.763956, -3.505492, 5.020192,
3.763956, 2.887639, -6.311996,
3.763956, 2.887639, 5.020192
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
var radius = 7.893297;
var distance = 35.11817;
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
mvMatrix.translate( -0.2562262, 0.3089268, 0.6459019 );
mvMatrix.scale( 1.216511, 1.334931, 0.7531102 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.11817);
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
HHDN<-read.table("HHDN.xyz")
```

```
## Error in read.table("HHDN.xyz"): no lines available in input
```

```r
x<-HHDN$V2
```

```
## Error in eval(expr, envir, enclos): object 'HHDN' not found
```

```r
y<-HHDN$V3
```

```
## Error in eval(expr, envir, enclos): object 'HHDN' not found
```

```r
z<-HHDN$V4
```

```
## Error in eval(expr, envir, enclos): object 'HHDN' not found
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
-3.149337, 1.714098, -0.3533158, 0, 0, 1, 1, 1,
-3.102106, 0.3875404, -0.05611841, 1, 0, 0, 1, 1,
-3.062896, 0.3482838, -2.338595, 1, 0, 0, 1, 1,
-2.754089, 0.9050459, -1.486389, 1, 0, 0, 1, 1,
-2.665865, -0.3865799, -3.085492, 1, 0, 0, 1, 1,
-2.644101, 0.8180187, -2.950268, 1, 0, 0, 1, 1,
-2.6009, -0.3720658, -2.749227, 0, 0, 0, 1, 1,
-2.587668, -1.657701, -1.377963, 0, 0, 0, 1, 1,
-2.579047, 1.98881, -2.193684, 0, 0, 0, 1, 1,
-2.56068, -0.06088711, -2.568851, 0, 0, 0, 1, 1,
-2.531538, -0.5826244, -2.492949, 0, 0, 0, 1, 1,
-2.295481, -1.797094, -1.978445, 0, 0, 0, 1, 1,
-2.201149, 0.9361249, -0.6669971, 0, 0, 0, 1, 1,
-2.184613, -0.1991975, -2.663311, 1, 1, 1, 1, 1,
-2.168249, 1.456329, -0.3017624, 1, 1, 1, 1, 1,
-2.157281, 0.1913189, -1.315166, 1, 1, 1, 1, 1,
-2.139713, -0.3552929, -2.100842, 1, 1, 1, 1, 1,
-2.130641, -0.5665938, -2.808847, 1, 1, 1, 1, 1,
-2.108609, 0.1115431, -0.7395625, 1, 1, 1, 1, 1,
-2.098723, 1.067697, -1.563026, 1, 1, 1, 1, 1,
-2.098519, 0.6863409, -0.6226634, 1, 1, 1, 1, 1,
-2.078627, 1.121063, 0.1747276, 1, 1, 1, 1, 1,
-2.059898, -0.08515392, -2.417359, 1, 1, 1, 1, 1,
-2.043051, -2.084496, -2.760725, 1, 1, 1, 1, 1,
-2.030061, -0.8079155, -1.854443, 1, 1, 1, 1, 1,
-2.000758, 0.7478693, -2.173099, 1, 1, 1, 1, 1,
-1.975577, 0.6350369, -2.364688, 1, 1, 1, 1, 1,
-1.96823, 0.262559, -1.061517, 1, 1, 1, 1, 1,
-1.954593, 0.06691911, -1.031607, 0, 0, 1, 1, 1,
-1.927407, -0.6270715, -0.9589602, 1, 0, 0, 1, 1,
-1.911453, -0.2554491, -1.28617, 1, 0, 0, 1, 1,
-1.901192, -1.602821, -2.775384, 1, 0, 0, 1, 1,
-1.895939, -0.4365609, -2.530773, 1, 0, 0, 1, 1,
-1.872283, 1.942894, -2.50497, 1, 0, 0, 1, 1,
-1.864389, 0.8817329, 0.7814875, 0, 0, 0, 1, 1,
-1.85188, -1.097091, -0.6343608, 0, 0, 0, 1, 1,
-1.837963, -0.4391677, -2.162388, 0, 0, 0, 1, 1,
-1.833435, -0.9428325, -0.8451111, 0, 0, 0, 1, 1,
-1.824448, 1.182402, -1.100297, 0, 0, 0, 1, 1,
-1.808764, -1.480858, -3.121458, 0, 0, 0, 1, 1,
-1.692191, 0.5350803, -2.402042, 0, 0, 0, 1, 1,
-1.687297, 0.377578, 0.6066517, 1, 1, 1, 1, 1,
-1.682842, -0.774487, -1.304437, 1, 1, 1, 1, 1,
-1.659562, -1.07186, -1.708502, 1, 1, 1, 1, 1,
-1.655579, -0.65816, -2.392304, 1, 1, 1, 1, 1,
-1.650278, 0.6293899, 0.7102157, 1, 1, 1, 1, 1,
-1.627516, -0.9502409, -2.24646, 1, 1, 1, 1, 1,
-1.626898, 0.1488448, -1.962804, 1, 1, 1, 1, 1,
-1.625708, 0.2139745, -0.07233332, 1, 1, 1, 1, 1,
-1.624, -1.30009, -2.757077, 1, 1, 1, 1, 1,
-1.610151, 0.7120036, -3.429251, 1, 1, 1, 1, 1,
-1.60347, 1.179571, 0.05404193, 1, 1, 1, 1, 1,
-1.602343, 2.067955, 0.567522, 1, 1, 1, 1, 1,
-1.595433, -0.6552117, -2.173202, 1, 1, 1, 1, 1,
-1.58959, 2.256249, -0.2479126, 1, 1, 1, 1, 1,
-1.586378, 1.153609, -1.061616, 1, 1, 1, 1, 1,
-1.584228, 0.1756042, -1.567184, 0, 0, 1, 1, 1,
-1.572768, -1.61559, -2.199001, 1, 0, 0, 1, 1,
-1.57038, 1.306502, -0.9581252, 1, 0, 0, 1, 1,
-1.566708, -1.130131, -2.099256, 1, 0, 0, 1, 1,
-1.555521, 1.052091, -0.8933471, 1, 0, 0, 1, 1,
-1.544585, -0.804338, -2.793961, 1, 0, 0, 1, 1,
-1.537135, -0.1643116, -3.589379, 0, 0, 0, 1, 1,
-1.520506, -0.04650676, -2.114935, 0, 0, 0, 1, 1,
-1.508493, -0.8634093, -0.5511069, 0, 0, 0, 1, 1,
-1.499707, 1.002415, -0.7132585, 0, 0, 0, 1, 1,
-1.498423, 1.737882, -2.839674, 0, 0, 0, 1, 1,
-1.479741, 0.3596168, 0.9163504, 0, 0, 0, 1, 1,
-1.45591, -1.999354, -3.514971, 0, 0, 0, 1, 1,
-1.440856, 0.3432138, -1.820552, 1, 1, 1, 1, 1,
-1.434662, 0.05399055, -1.922288, 1, 1, 1, 1, 1,
-1.426451, 1.035574, -2.290595, 1, 1, 1, 1, 1,
-1.419335, -0.2859503, -0.2646478, 1, 1, 1, 1, 1,
-1.41884, 0.256579, -0.735105, 1, 1, 1, 1, 1,
-1.410952, 0.1525842, -0.7966599, 1, 1, 1, 1, 1,
-1.407681, 0.3146957, -0.3049647, 1, 1, 1, 1, 1,
-1.405534, -1.150919, -2.642389, 1, 1, 1, 1, 1,
-1.403396, -1.324987, -0.7961571, 1, 1, 1, 1, 1,
-1.400536, -0.7697864, -0.944403, 1, 1, 1, 1, 1,
-1.400124, 0.1254959, -1.15321, 1, 1, 1, 1, 1,
-1.398813, -1.816227, -1.671301, 1, 1, 1, 1, 1,
-1.386766, -0.2030163, -3.365973, 1, 1, 1, 1, 1,
-1.384455, 0.7088763, 0.9736347, 1, 1, 1, 1, 1,
-1.374089, -0.7423137, -3.199786, 1, 1, 1, 1, 1,
-1.362907, 0.7493729, -1.156601, 0, 0, 1, 1, 1,
-1.361417, 0.08142035, -1.300347, 1, 0, 0, 1, 1,
-1.353889, -0.6166224, -1.20672, 1, 0, 0, 1, 1,
-1.347876, 0.5506635, -2.954483, 1, 0, 0, 1, 1,
-1.339469, 0.2685741, -1.255654, 1, 0, 0, 1, 1,
-1.334696, -0.6454254, -0.4115249, 1, 0, 0, 1, 1,
-1.333877, -1.343116, -2.512018, 0, 0, 0, 1, 1,
-1.333836, -0.5790682, -1.777854, 0, 0, 0, 1, 1,
-1.328735, 0.2624117, -1.643262, 0, 0, 0, 1, 1,
-1.325995, -0.7102225, -0.9204105, 0, 0, 0, 1, 1,
-1.322542, 0.5371168, 0.666256, 0, 0, 0, 1, 1,
-1.315671, 1.19501, -2.073548, 0, 0, 0, 1, 1,
-1.313255, 2.251411, 0.8271013, 0, 0, 0, 1, 1,
-1.311844, 1.235044, 0.445347, 1, 1, 1, 1, 1,
-1.293567, -0.005927062, -1.422936, 1, 1, 1, 1, 1,
-1.275461, -1.277113, -4.440529, 1, 1, 1, 1, 1,
-1.275184, -0.01768226, -5.318547, 1, 1, 1, 1, 1,
-1.261437, 0.5356803, -2.727856, 1, 1, 1, 1, 1,
-1.258984, 1.571869, -0.8275897, 1, 1, 1, 1, 1,
-1.256149, -0.7056308, -1.484134, 1, 1, 1, 1, 1,
-1.255949, -0.3111636, -1.068959, 1, 1, 1, 1, 1,
-1.248935, 0.6611716, -1.096662, 1, 1, 1, 1, 1,
-1.246813, -0.4609047, -1.47303, 1, 1, 1, 1, 1,
-1.24678, -0.1074024, -1.357448, 1, 1, 1, 1, 1,
-1.240405, -1.090036, -1.701642, 1, 1, 1, 1, 1,
-1.233819, 0.698849, -1.264632, 1, 1, 1, 1, 1,
-1.232307, 0.5436081, -0.4676341, 1, 1, 1, 1, 1,
-1.229649, 1.071369, -0.3216571, 1, 1, 1, 1, 1,
-1.228096, 1.066133, -0.6904602, 0, 0, 1, 1, 1,
-1.227981, -0.5939122, -2.624365, 1, 0, 0, 1, 1,
-1.225171, 1.632326, 0.7208595, 1, 0, 0, 1, 1,
-1.223198, 0.8237352, -2.937365, 1, 0, 0, 1, 1,
-1.222323, 1.082744, -0.2571612, 1, 0, 0, 1, 1,
-1.212284, 0.831666, -2.836087, 1, 0, 0, 1, 1,
-1.194857, -0.5143639, -1.545401, 0, 0, 0, 1, 1,
-1.190053, 1.143228, -1.064173, 0, 0, 0, 1, 1,
-1.189204, 1.095618, -1.911624, 0, 0, 0, 1, 1,
-1.187094, 0.8738328, -0.5470147, 0, 0, 0, 1, 1,
-1.18008, 1.538581, -2.362681, 0, 0, 0, 1, 1,
-1.175025, -1.170647, -0.1820451, 0, 0, 0, 1, 1,
-1.170129, 0.8720602, -1.093383, 0, 0, 0, 1, 1,
-1.169894, 0.5463217, -1.657316, 1, 1, 1, 1, 1,
-1.169685, 1.804686, 1.158123, 1, 1, 1, 1, 1,
-1.162461, 0.4469188, -1.79087, 1, 1, 1, 1, 1,
-1.162093, -2.126167, -3.019775, 1, 1, 1, 1, 1,
-1.157618, -0.08986657, -0.9441618, 1, 1, 1, 1, 1,
-1.141499, -1.399172, -2.818525, 1, 1, 1, 1, 1,
-1.125568, 1.182346, -0.4273953, 1, 1, 1, 1, 1,
-1.117311, -0.5451335, -2.721854, 1, 1, 1, 1, 1,
-1.115703, 0.8555904, 0.3215962, 1, 1, 1, 1, 1,
-1.104662, 0.2851307, -2.813429, 1, 1, 1, 1, 1,
-1.103441, -0.1426059, -1.428929, 1, 1, 1, 1, 1,
-1.100755, 1.282093, -0.9326189, 1, 1, 1, 1, 1,
-1.096035, -0.05452143, -2.309016, 1, 1, 1, 1, 1,
-1.092459, -0.01161102, -2.998457, 1, 1, 1, 1, 1,
-1.091466, -0.7447827, -1.330467, 1, 1, 1, 1, 1,
-1.090046, 0.4578884, -1.450235, 0, 0, 1, 1, 1,
-1.084442, 1.026342, -1.24968, 1, 0, 0, 1, 1,
-1.082104, 0.2090474, -1.941625, 1, 0, 0, 1, 1,
-1.081148, 1.309321, -0.4513464, 1, 0, 0, 1, 1,
-1.081027, -0.6173151, -0.5496712, 1, 0, 0, 1, 1,
-1.07787, -0.1058961, -3.039768, 1, 0, 0, 1, 1,
-1.07699, -0.3102105, -2.286344, 0, 0, 0, 1, 1,
-1.076344, -1.338856, -1.963412, 0, 0, 0, 1, 1,
-1.07544, 0.2498418, -1.893762, 0, 0, 0, 1, 1,
-1.074062, -0.4921422, -3.382122, 0, 0, 0, 1, 1,
-1.073005, 0.5837594, -1.223284, 0, 0, 0, 1, 1,
-1.071175, -0.7887472, -2.319632, 0, 0, 0, 1, 1,
-1.067586, 1.115074, -0.207638, 0, 0, 0, 1, 1,
-1.063568, 0.7033817, 0.8951095, 1, 1, 1, 1, 1,
-1.060829, -0.4434123, -1.936896, 1, 1, 1, 1, 1,
-1.055518, -0.7966283, -2.584684, 1, 1, 1, 1, 1,
-1.048958, 0.7584639, -0.5973713, 1, 1, 1, 1, 1,
-1.047282, -0.4430567, -1.387703, 1, 1, 1, 1, 1,
-1.037927, -0.2266826, -2.422351, 1, 1, 1, 1, 1,
-1.031943, -0.2186327, -0.07997883, 1, 1, 1, 1, 1,
-1.029415, -1.087384, -1.074566, 1, 1, 1, 1, 1,
-1.028989, -1.149408, -3.071006, 1, 1, 1, 1, 1,
-1.024008, 1.746222, 2.15741, 1, 1, 1, 1, 1,
-1.018316, -0.1278866, -2.791152, 1, 1, 1, 1, 1,
-0.9965738, -0.04297875, -2.712533, 1, 1, 1, 1, 1,
-0.9831021, -0.2709829, -1.93653, 1, 1, 1, 1, 1,
-0.9814613, 0.1599552, 0.1466845, 1, 1, 1, 1, 1,
-0.9803535, -0.6088401, -2.301598, 1, 1, 1, 1, 1,
-0.9794916, -0.006249192, -3.562864, 0, 0, 1, 1, 1,
-0.9700869, -1.190467, -2.870139, 1, 0, 0, 1, 1,
-0.9689895, 0.1413498, 0.4996166, 1, 0, 0, 1, 1,
-0.9613863, -0.005125186, -0.8957823, 1, 0, 0, 1, 1,
-0.9566645, 1.283399, -2.049613, 1, 0, 0, 1, 1,
-0.9454208, 0.4595316, -0.925284, 1, 0, 0, 1, 1,
-0.9410256, -0.9043165, -0.2898889, 0, 0, 0, 1, 1,
-0.9364682, 0.4484915, -2.122265, 0, 0, 0, 1, 1,
-0.9351264, -0.6405853, -3.179013, 0, 0, 0, 1, 1,
-0.9346213, 0.2911216, -1.877576, 0, 0, 0, 1, 1,
-0.9312087, 0.3801662, -1.723471, 0, 0, 0, 1, 1,
-0.9244794, -0.9344568, -1.661319, 0, 0, 0, 1, 1,
-0.9211248, -1.593084, -3.462937, 0, 0, 0, 1, 1,
-0.9205478, -0.8776346, -2.331127, 1, 1, 1, 1, 1,
-0.9162192, 0.5013355, -0.5120631, 1, 1, 1, 1, 1,
-0.912084, -0.9244501, -2.001781, 1, 1, 1, 1, 1,
-0.9080322, 0.1995529, -1.169036, 1, 1, 1, 1, 1,
-0.9012088, 0.9418051, 1.415928, 1, 1, 1, 1, 1,
-0.8868071, -0.01056071, -2.327059, 1, 1, 1, 1, 1,
-0.8867618, -0.1793819, -0.6248713, 1, 1, 1, 1, 1,
-0.8859112, 0.8356881, -2.188412, 1, 1, 1, 1, 1,
-0.8851776, 0.3881487, -0.8647394, 1, 1, 1, 1, 1,
-0.879941, 0.06377883, -2.319942, 1, 1, 1, 1, 1,
-0.8679627, 0.4614969, 1.394416, 1, 1, 1, 1, 1,
-0.8678103, -1.153612, -4.192065, 1, 1, 1, 1, 1,
-0.8622446, 0.4002495, -1.626708, 1, 1, 1, 1, 1,
-0.8622349, 1.783846, 0.5669437, 1, 1, 1, 1, 1,
-0.851766, -1.270446, -4.043962, 1, 1, 1, 1, 1,
-0.8507434, 0.5246181, -1.899363, 0, 0, 1, 1, 1,
-0.8412195, -0.6205547, -1.740242, 1, 0, 0, 1, 1,
-0.8392072, -0.8249275, -1.652811, 1, 0, 0, 1, 1,
-0.8385139, -0.9414623, -2.467966, 1, 0, 0, 1, 1,
-0.8351312, -1.542687, -2.835986, 1, 0, 0, 1, 1,
-0.8335392, 0.4480799, -1.413079, 1, 0, 0, 1, 1,
-0.8309163, 0.09360017, -0.1945061, 0, 0, 0, 1, 1,
-0.830153, 1.706587, 0.7389584, 0, 0, 0, 1, 1,
-0.8259846, 0.2842156, -1.442666, 0, 0, 0, 1, 1,
-0.8205591, -0.06615311, -1.474125, 0, 0, 0, 1, 1,
-0.8130598, 0.7033892, -0.3253935, 0, 0, 0, 1, 1,
-0.8120409, -0.6866117, -0.2828482, 0, 0, 0, 1, 1,
-0.8043779, 0.5404658, -0.3950527, 0, 0, 0, 1, 1,
-0.8036921, -2.733476, -1.867392, 1, 1, 1, 1, 1,
-0.8034199, 0.8776309, 0.1041506, 1, 1, 1, 1, 1,
-0.8025627, 1.467225, -1.035621, 1, 1, 1, 1, 1,
-0.799929, -0.2350031, -1.593797, 1, 1, 1, 1, 1,
-0.7961354, 1.551237, -0.5996929, 1, 1, 1, 1, 1,
-0.7950053, 0.3365726, -2.337726, 1, 1, 1, 1, 1,
-0.7937742, 1.736431, 0.6512097, 1, 1, 1, 1, 1,
-0.7902433, -0.4370278, -3.403484, 1, 1, 1, 1, 1,
-0.7893634, -0.05468911, -1.275273, 1, 1, 1, 1, 1,
-0.7888055, 0.2365014, -0.4730294, 1, 1, 1, 1, 1,
-0.7866988, -1.251081, -3.495631, 1, 1, 1, 1, 1,
-0.7826018, 0.1493848, -1.491141, 1, 1, 1, 1, 1,
-0.7811492, -1.654867, -1.820842, 1, 1, 1, 1, 1,
-0.772518, 0.5570821, -1.050093, 1, 1, 1, 1, 1,
-0.7695271, -0.8041695, -0.5260944, 1, 1, 1, 1, 1,
-0.7683061, -0.4474431, -2.200114, 0, 0, 1, 1, 1,
-0.7674615, 0.2847283, -0.9511352, 1, 0, 0, 1, 1,
-0.7637811, -1.136931, -4.524773, 1, 0, 0, 1, 1,
-0.7601789, 0.06584847, -2.005432, 1, 0, 0, 1, 1,
-0.7542756, -1.670753, -0.8851828, 1, 0, 0, 1, 1,
-0.7486553, 0.7318361, -1.134076, 1, 0, 0, 1, 1,
-0.7481869, -0.5223144, -3.35603, 0, 0, 0, 1, 1,
-0.7463076, -2.63245, -2.437479, 0, 0, 0, 1, 1,
-0.7445453, -3.412389, -3.210972, 0, 0, 0, 1, 1,
-0.733088, 1.082806, -1.087807, 0, 0, 0, 1, 1,
-0.7287287, 1.970342, 0.2891671, 0, 0, 0, 1, 1,
-0.7274244, 0.2602099, -1.960132, 0, 0, 0, 1, 1,
-0.7246003, -0.8687692, -2.025702, 0, 0, 0, 1, 1,
-0.7199882, -0.2865863, -1.737637, 1, 1, 1, 1, 1,
-0.7176773, 0.8349243, -0.02236878, 1, 1, 1, 1, 1,
-0.7166408, 0.9972195, -1.633997, 1, 1, 1, 1, 1,
-0.7124152, -1.751392, -2.907621, 1, 1, 1, 1, 1,
-0.7104054, 0.01820122, -2.038532, 1, 1, 1, 1, 1,
-0.7101784, -0.6447433, -0.8018019, 1, 1, 1, 1, 1,
-0.7093512, 0.9543806, -0.224829, 1, 1, 1, 1, 1,
-0.709206, -2.11575, -2.172858, 1, 1, 1, 1, 1,
-0.7007092, 0.01786925, -1.4263, 1, 1, 1, 1, 1,
-0.6859353, 0.8309897, -0.5774559, 1, 1, 1, 1, 1,
-0.6839511, -0.033473, 0.5011742, 1, 1, 1, 1, 1,
-0.683018, 0.2217811, -0.8931285, 1, 1, 1, 1, 1,
-0.6827131, 1.106063, -0.1447628, 1, 1, 1, 1, 1,
-0.6819512, 0.1653624, -1.467086, 1, 1, 1, 1, 1,
-0.681888, -1.651572, -2.470457, 1, 1, 1, 1, 1,
-0.6801489, -1.684635, -2.101057, 0, 0, 1, 1, 1,
-0.6766462, 0.4655252, -1.699539, 1, 0, 0, 1, 1,
-0.673942, 0.1366535, -2.287803, 1, 0, 0, 1, 1,
-0.6638529, 0.9000725, -1.368423, 1, 0, 0, 1, 1,
-0.6562502, 1.796271, -0.7208977, 1, 0, 0, 1, 1,
-0.6553061, -0.5009221, -5.425211, 1, 0, 0, 1, 1,
-0.6534541, -0.6715603, -3.012104, 0, 0, 0, 1, 1,
-0.6498794, -0.1334382, -1.51772, 0, 0, 0, 1, 1,
-0.6441349, 0.8877904, 0.3808511, 0, 0, 0, 1, 1,
-0.6430743, 0.6511009, -1.125763, 0, 0, 0, 1, 1,
-0.6394067, 0.4505293, -1.262165, 0, 0, 0, 1, 1,
-0.6373757, 2.794535, 0.2701445, 0, 0, 0, 1, 1,
-0.6305786, -0.4950396, -2.791548, 0, 0, 0, 1, 1,
-0.6291792, 1.415405, 0.415592, 1, 1, 1, 1, 1,
-0.6249801, -0.8468203, -2.373952, 1, 1, 1, 1, 1,
-0.622467, 0.02802718, -0.5804334, 1, 1, 1, 1, 1,
-0.620465, 0.01352278, -1.380178, 1, 1, 1, 1, 1,
-0.6198564, -1.324896, -3.309657, 1, 1, 1, 1, 1,
-0.6176788, 0.4509968, -0.6721669, 1, 1, 1, 1, 1,
-0.6161597, -0.07895328, -1.73124, 1, 1, 1, 1, 1,
-0.6114262, 0.2940657, 0.06231546, 1, 1, 1, 1, 1,
-0.6043767, 0.0105952, -1.639824, 1, 1, 1, 1, 1,
-0.6042291, -0.3589773, -2.625773, 1, 1, 1, 1, 1,
-0.6022567, -0.5786793, -4.124115, 1, 1, 1, 1, 1,
-0.5997555, 1.527001, -0.3195451, 1, 1, 1, 1, 1,
-0.593156, 0.7194973, -0.5421396, 1, 1, 1, 1, 1,
-0.5873392, 1.685352, -0.9241094, 1, 1, 1, 1, 1,
-0.5795825, -0.7785441, -3.321386, 1, 1, 1, 1, 1,
-0.5787644, 0.310851, -1.380587, 0, 0, 1, 1, 1,
-0.5784589, 1.151163, -1.201764, 1, 0, 0, 1, 1,
-0.5780987, 0.7608265, -2.094687, 1, 0, 0, 1, 1,
-0.5745881, 0.6854849, -1.868184, 1, 0, 0, 1, 1,
-0.5685928, 1.604547, -0.5637713, 1, 0, 0, 1, 1,
-0.5682734, 0.1076711, -0.4970805, 1, 0, 0, 1, 1,
-0.5677311, 0.0189344, -1.627258, 0, 0, 0, 1, 1,
-0.5668337, 0.3974997, -2.511951, 0, 0, 0, 1, 1,
-0.5623627, -0.6319286, 0.0944951, 0, 0, 0, 1, 1,
-0.561121, 0.3415764, -2.67839, 0, 0, 0, 1, 1,
-0.5605938, -0.7082222, -3.44054, 0, 0, 0, 1, 1,
-0.5588016, -0.8923293, -2.361311, 0, 0, 0, 1, 1,
-0.5583231, 0.4359764, -0.7231803, 0, 0, 0, 1, 1,
-0.5543041, -0.7728977, -0.2876077, 1, 1, 1, 1, 1,
-0.5493145, -0.4915983, -2.650451, 1, 1, 1, 1, 1,
-0.5455923, 0.7049221, -0.9515788, 1, 1, 1, 1, 1,
-0.5396799, -1.089435, -2.605445, 1, 1, 1, 1, 1,
-0.5390621, 1.100568, -1.755033, 1, 1, 1, 1, 1,
-0.5376521, 1.075239, -0.01544789, 1, 1, 1, 1, 1,
-0.5343556, -0.07080899, -2.74053, 1, 1, 1, 1, 1,
-0.5329365, -0.6702014, -2.253839, 1, 1, 1, 1, 1,
-0.5240181, 2.374373, 0.6529886, 1, 1, 1, 1, 1,
-0.5225877, -0.8740044, 0.3251679, 1, 1, 1, 1, 1,
-0.5107542, 1.549354, -0.6664799, 1, 1, 1, 1, 1,
-0.5083397, -1.379635, -0.5399939, 1, 1, 1, 1, 1,
-0.5056886, -1.936088, -2.639343, 1, 1, 1, 1, 1,
-0.4962835, -0.251754, -1.382553, 1, 1, 1, 1, 1,
-0.4959903, 0.6538383, -0.6726184, 1, 1, 1, 1, 1,
-0.4944838, -0.3557707, -3.156859, 0, 0, 1, 1, 1,
-0.493598, -0.4522812, -3.04953, 1, 0, 0, 1, 1,
-0.4923431, 0.9847988, 0.821167, 1, 0, 0, 1, 1,
-0.4911034, 0.05858821, -1.295695, 1, 0, 0, 1, 1,
-0.4839335, 0.1524606, -1.118876, 1, 0, 0, 1, 1,
-0.4833265, -0.07623838, -0.4223619, 1, 0, 0, 1, 1,
-0.4821233, 0.05380706, -1.194681, 0, 0, 0, 1, 1,
-0.4757489, -0.1747447, -1.799652, 0, 0, 0, 1, 1,
-0.4740983, -0.1564794, -1.410441, 0, 0, 0, 1, 1,
-0.471816, -1.520657, -3.728979, 0, 0, 0, 1, 1,
-0.4706218, -0.7919568, -3.690372, 0, 0, 0, 1, 1,
-0.4694481, -0.1817445, -0.6570354, 0, 0, 0, 1, 1,
-0.468076, -1.218428, -3.97796, 0, 0, 0, 1, 1,
-0.4674777, 0.1701493, -3.092465, 1, 1, 1, 1, 1,
-0.4633861, 0.01432881, -1.255567, 1, 1, 1, 1, 1,
-0.4573992, -0.1273394, -0.831225, 1, 1, 1, 1, 1,
-0.4562263, -0.6328751, -3.233761, 1, 1, 1, 1, 1,
-0.4522868, 0.3105419, -0.3447, 1, 1, 1, 1, 1,
-0.4409218, -0.4297042, -2.158432, 1, 1, 1, 1, 1,
-0.4367519, -0.8294373, -4.183767, 1, 1, 1, 1, 1,
-0.4362641, 0.4733347, 0.2813653, 1, 1, 1, 1, 1,
-0.4347207, 0.8666176, -0.07461096, 1, 1, 1, 1, 1,
-0.434541, -0.005380581, -1.094793, 1, 1, 1, 1, 1,
-0.4306332, 0.1209612, 0.8811862, 1, 1, 1, 1, 1,
-0.4263541, 0.01455846, -0.2787152, 1, 1, 1, 1, 1,
-0.4248536, -0.1021851, -0.1755613, 1, 1, 1, 1, 1,
-0.4211244, -0.9830791, -3.735788, 1, 1, 1, 1, 1,
-0.4207289, -0.7981967, -2.553315, 1, 1, 1, 1, 1,
-0.4187951, -0.4307205, -1.934289, 0, 0, 1, 1, 1,
-0.4133502, -0.02563808, -1.938188, 1, 0, 0, 1, 1,
-0.3958572, 0.6869857, -1.783285, 1, 0, 0, 1, 1,
-0.3946685, 0.3677107, 0.2037584, 1, 0, 0, 1, 1,
-0.3940659, 0.5120221, -0.8287179, 1, 0, 0, 1, 1,
-0.392461, 0.1582962, -1.415628, 1, 0, 0, 1, 1,
-0.3921826, -0.9397871, -3.102242, 0, 0, 0, 1, 1,
-0.3918343, -0.2397067, -1.652527, 0, 0, 0, 1, 1,
-0.3910545, 0.4322124, -0.1539805, 0, 0, 0, 1, 1,
-0.3777394, -0.9062985, -3.846503, 0, 0, 0, 1, 1,
-0.3773041, -0.2034178, -2.133918, 0, 0, 0, 1, 1,
-0.3684591, -0.1221028, -0.9015185, 0, 0, 0, 1, 1,
-0.3657188, -0.4125268, -3.837233, 0, 0, 0, 1, 1,
-0.3644715, -0.6057952, -4.455523, 1, 1, 1, 1, 1,
-0.3621209, -0.6019164, -3.767917, 1, 1, 1, 1, 1,
-0.3609776, 0.3281502, -0.2550376, 1, 1, 1, 1, 1,
-0.3573794, 0.1825338, -0.6383809, 1, 1, 1, 1, 1,
-0.355664, -0.5629972, -2.178278, 1, 1, 1, 1, 1,
-0.3532359, 1.797858, -1.322318, 1, 1, 1, 1, 1,
-0.3529922, -1.108164, -4.389971, 1, 1, 1, 1, 1,
-0.3504798, -0.1493351, -0.387044, 1, 1, 1, 1, 1,
-0.3477075, 0.2919527, -3.247241, 1, 1, 1, 1, 1,
-0.3474018, 1.732093, -0.3431187, 1, 1, 1, 1, 1,
-0.3460405, -1.355677, -3.476799, 1, 1, 1, 1, 1,
-0.3442512, -0.4150775, -1.624857, 1, 1, 1, 1, 1,
-0.3410769, 0.7021601, -1.697141, 1, 1, 1, 1, 1,
-0.3406833, -0.04259835, -0.05521706, 1, 1, 1, 1, 1,
-0.3403777, 0.6092684, 0.5279734, 1, 1, 1, 1, 1,
-0.3395958, -1.092759, -2.231859, 0, 0, 1, 1, 1,
-0.3365134, -0.8884234, -2.128466, 1, 0, 0, 1, 1,
-0.3333554, 0.06386798, -1.526983, 1, 0, 0, 1, 1,
-0.3273365, -2.432703, -3.062571, 1, 0, 0, 1, 1,
-0.3235369, -0.5560895, -4.487983, 1, 0, 0, 1, 1,
-0.3234592, -0.7860041, -2.103998, 1, 0, 0, 1, 1,
-0.3177451, -1.478245, -3.268282, 0, 0, 0, 1, 1,
-0.3167976, 0.8787785, 0.1637499, 0, 0, 0, 1, 1,
-0.3148302, 1.294426, 0.2804602, 0, 0, 0, 1, 1,
-0.3120529, 0.5249051, 0.7809606, 0, 0, 0, 1, 1,
-0.3093471, 0.7193804, -1.474783, 0, 0, 0, 1, 1,
-0.3089335, 0.4588113, -0.04483755, 0, 0, 0, 1, 1,
-0.2942398, -0.8607119, -1.23904, 0, 0, 0, 1, 1,
-0.2936106, -0.5148643, -4.110772, 1, 1, 1, 1, 1,
-0.2907086, -0.7261344, -2.512211, 1, 1, 1, 1, 1,
-0.286719, 0.5408716, 0.6588351, 1, 1, 1, 1, 1,
-0.2850896, 0.254734, -1.748452, 1, 1, 1, 1, 1,
-0.2825744, 0.9444589, -0.3226406, 1, 1, 1, 1, 1,
-0.2815565, -1.224038, -2.174936, 1, 1, 1, 1, 1,
-0.2800759, -1.850624, -4.642353, 1, 1, 1, 1, 1,
-0.2798038, 1.440518, 0.2028616, 1, 1, 1, 1, 1,
-0.2790976, 0.4380051, -0.6537831, 1, 1, 1, 1, 1,
-0.2757335, -1.197575, -3.501622, 1, 1, 1, 1, 1,
-0.2750122, 2.419184, 0.532005, 1, 1, 1, 1, 1,
-0.2718115, -1.506031, -3.640437, 1, 1, 1, 1, 1,
-0.2680363, 1.388239, -1.385047, 1, 1, 1, 1, 1,
-0.2642592, -1.038212, -2.731041, 1, 1, 1, 1, 1,
-0.2622553, -0.8976204, -3.024376, 1, 1, 1, 1, 1,
-0.258962, 1.173206, 0.5110787, 0, 0, 1, 1, 1,
-0.2579979, 1.1666, 0.7788621, 1, 0, 0, 1, 1,
-0.2574309, -0.7011054, -2.047899, 1, 0, 0, 1, 1,
-0.2565754, 0.5854567, -0.4118596, 1, 0, 0, 1, 1,
-0.2509534, -0.8182588, -3.392604, 1, 0, 0, 1, 1,
-0.2498078, -0.2254682, -3.454757, 1, 0, 0, 1, 1,
-0.2480979, -0.6737371, -1.508391, 0, 0, 0, 1, 1,
-0.2480028, 1.068202, -0.5272886, 0, 0, 0, 1, 1,
-0.2474224, 0.6121091, -0.4776237, 0, 0, 0, 1, 1,
-0.2460846, -0.4503787, -3.3356, 0, 0, 0, 1, 1,
-0.2436281, -0.8143091, -3.633132, 0, 0, 0, 1, 1,
-0.2427468, -0.368928, -3.362151, 0, 0, 0, 1, 1,
-0.2387609, -1.121565, -2.892852, 0, 0, 0, 1, 1,
-0.2327254, 1.536916, -0.2467744, 1, 1, 1, 1, 1,
-0.2320712, 0.5080602, -1.033446, 1, 1, 1, 1, 1,
-0.2310096, 0.153255, -1.875772, 1, 1, 1, 1, 1,
-0.2263259, -1.073385, -3.458835, 1, 1, 1, 1, 1,
-0.2244887, 1.295325, -0.1361632, 1, 1, 1, 1, 1,
-0.2145211, 0.7577909, -1.351873, 1, 1, 1, 1, 1,
-0.2140135, -0.8749131, -3.251204, 1, 1, 1, 1, 1,
-0.2130227, -0.9042277, -3.244879, 1, 1, 1, 1, 1,
-0.212895, -1.812816, -1.353331, 1, 1, 1, 1, 1,
-0.2127739, -1.259316, -2.761936, 1, 1, 1, 1, 1,
-0.2094546, -0.7178926, -4.206781, 1, 1, 1, 1, 1,
-0.2075738, -2.291842, -3.913464, 1, 1, 1, 1, 1,
-0.2052576, 2.028676, -0.03093239, 1, 1, 1, 1, 1,
-0.2050239, 1.225534, 0.1732497, 1, 1, 1, 1, 1,
-0.2050219, 2.289853, 1.155305, 1, 1, 1, 1, 1,
-0.2033392, -1.13714, -2.613651, 0, 0, 1, 1, 1,
-0.2023099, 0.6151186, -1.290466, 1, 0, 0, 1, 1,
-0.2000349, 0.3729744, 2.437207, 1, 0, 0, 1, 1,
-0.1913659, -0.1779133, -3.166442, 1, 0, 0, 1, 1,
-0.1904186, 0.3651859, -2.171793, 1, 0, 0, 1, 1,
-0.190347, 0.4263062, -1.089896, 1, 0, 0, 1, 1,
-0.1893405, -0.4445246, -0.9417868, 0, 0, 0, 1, 1,
-0.1891745, -0.2470679, -0.625473, 0, 0, 0, 1, 1,
-0.1867993, -0.0143646, -1.391298, 0, 0, 0, 1, 1,
-0.1852656, 0.02604392, -0.736748, 0, 0, 0, 1, 1,
-0.1829988, 1.237058, -2.319105, 0, 0, 0, 1, 1,
-0.1828642, 1.814638, -1.287576, 0, 0, 0, 1, 1,
-0.1794188, -0.07523407, -2.907034, 0, 0, 0, 1, 1,
-0.171422, -2.288346, -3.733525, 1, 1, 1, 1, 1,
-0.1655691, 0.8995239, -0.1800568, 1, 1, 1, 1, 1,
-0.165078, -0.4039649, -0.7602577, 1, 1, 1, 1, 1,
-0.16353, 0.227418, -0.4492225, 1, 1, 1, 1, 1,
-0.1621176, 0.0764934, 0.8212907, 1, 1, 1, 1, 1,
-0.1613999, -0.7363432, -3.455986, 1, 1, 1, 1, 1,
-0.1606014, -1.366779, -3.159854, 1, 1, 1, 1, 1,
-0.1569269, 1.868046, -1.144082, 1, 1, 1, 1, 1,
-0.154976, 1.96325, 0.6264093, 1, 1, 1, 1, 1,
-0.1502545, 0.3979691, 0.04952905, 1, 1, 1, 1, 1,
-0.1502183, -1.379644, -6.146964, 1, 1, 1, 1, 1,
-0.1484983, 0.6133019, 0.511832, 1, 1, 1, 1, 1,
-0.1449126, -1.352281, -4.167793, 1, 1, 1, 1, 1,
-0.1434134, -0.6125246, -2.368178, 1, 1, 1, 1, 1,
-0.1379913, -0.2355816, -3.168167, 1, 1, 1, 1, 1,
-0.1343479, 0.5217022, 2.015718, 0, 0, 1, 1, 1,
-0.132147, -0.217742, -2.213537, 1, 0, 0, 1, 1,
-0.1278695, 1.460918, 1.321291, 1, 0, 0, 1, 1,
-0.1227173, -1.823296, -3.575253, 1, 0, 0, 1, 1,
-0.122273, 0.1058398, -0.2657982, 1, 0, 0, 1, 1,
-0.1204994, -0.1028744, -3.004397, 1, 0, 0, 1, 1,
-0.119321, -0.6516715, -2.542895, 0, 0, 0, 1, 1,
-0.1138344, -1.232465, -5.167236, 0, 0, 0, 1, 1,
-0.1128877, -0.8712372, -2.25309, 0, 0, 0, 1, 1,
-0.110302, -0.2557487, -2.670653, 0, 0, 0, 1, 1,
-0.1070096, 0.4696337, -0.01017117, 0, 0, 0, 1, 1,
-0.1036746, -1.6689, -2.868473, 0, 0, 0, 1, 1,
-0.1025393, 1.127209, 0.3756168, 0, 0, 0, 1, 1,
-0.1016683, -0.7877064, -4.232509, 1, 1, 1, 1, 1,
-0.09380028, -1.487488, -1.480366, 1, 1, 1, 1, 1,
-0.09379176, 0.7794569, -0.4812536, 1, 1, 1, 1, 1,
-0.09207651, -0.9753498, -2.384389, 1, 1, 1, 1, 1,
-0.08608542, -1.730221, -3.173929, 1, 1, 1, 1, 1,
-0.0824725, -1.831991, -3.875507, 1, 1, 1, 1, 1,
-0.08225576, 0.8028788, 0.3344041, 1, 1, 1, 1, 1,
-0.07833324, -0.5314965, -4.50005, 1, 1, 1, 1, 1,
-0.0764959, -0.8558517, -4.310583, 1, 1, 1, 1, 1,
-0.07452286, -1.599203, -2.039754, 1, 1, 1, 1, 1,
-0.07374854, -0.3517594, -3.114424, 1, 1, 1, 1, 1,
-0.06604943, -1.011784, -3.026308, 1, 1, 1, 1, 1,
-0.05707958, -2.499788, -2.908864, 1, 1, 1, 1, 1,
-0.05585446, 0.1982693, -1.728602, 1, 1, 1, 1, 1,
-0.05234049, 0.968457, -1.522173, 1, 1, 1, 1, 1,
-0.05211975, 0.6543003, 0.1383889, 0, 0, 1, 1, 1,
-0.05117192, -0.09280418, -2.31478, 1, 0, 0, 1, 1,
-0.04918123, -1.221942, -2.138446, 1, 0, 0, 1, 1,
-0.04801698, -0.4514435, -3.166829, 1, 0, 0, 1, 1,
-0.04656548, -1.227008, -3.281235, 1, 0, 0, 1, 1,
-0.04634091, -2.082447, -4.119429, 1, 0, 0, 1, 1,
-0.04501329, -1.087984, -2.043706, 0, 0, 0, 1, 1,
-0.04252149, -0.4632997, -2.715566, 0, 0, 0, 1, 1,
-0.03667969, 1.353885, 1.208813, 0, 0, 0, 1, 1,
-0.03228157, 0.2887683, 0.9115594, 0, 0, 0, 1, 1,
-0.03200259, 0.3594414, 1.081782, 0, 0, 0, 1, 1,
-0.0313273, -0.5860122, -3.04192, 0, 0, 0, 1, 1,
-0.02798156, 0.1245465, 1.447061, 0, 0, 0, 1, 1,
-0.02789138, 0.1738811, -1.109701, 1, 1, 1, 1, 1,
-0.02532066, -0.517886, -4.093928, 1, 1, 1, 1, 1,
-0.02340128, 0.1652539, -0.005167258, 1, 1, 1, 1, 1,
-0.02230529, -0.2053004, -1.365492, 1, 1, 1, 1, 1,
-0.02159314, -0.551823, -3.570864, 1, 1, 1, 1, 1,
-0.02076274, -0.9810595, -2.586221, 1, 1, 1, 1, 1,
-0.01969554, 0.2717122, 0.5425829, 1, 1, 1, 1, 1,
-0.01251279, 0.2741055, -0.1033785, 1, 1, 1, 1, 1,
-0.01052711, 1.422405, 1.017406, 1, 1, 1, 1, 1,
-0.004365687, 0.56073, 1.585379, 1, 1, 1, 1, 1,
-9.17936e-05, 0.03822051, -0.5191088, 1, 1, 1, 1, 1,
0.001680932, -1.093757, 3.484852, 1, 1, 1, 1, 1,
0.003951589, -0.5018635, 2.733207, 1, 1, 1, 1, 1,
0.00427762, 0.8418854, -0.1223779, 1, 1, 1, 1, 1,
0.005399497, 1.78223, 0.8136209, 1, 1, 1, 1, 1,
0.005711361, 0.836233, 0.591311, 0, 0, 1, 1, 1,
0.007902098, -0.3589401, 2.012846, 1, 0, 0, 1, 1,
0.009349227, -0.003670257, 3.206656, 1, 0, 0, 1, 1,
0.01335502, -0.3301778, 2.83385, 1, 0, 0, 1, 1,
0.01613761, 0.05340674, 1.969717, 1, 0, 0, 1, 1,
0.01904707, -1.201429, 4.255142, 1, 0, 0, 1, 1,
0.02067031, -0.2775573, 2.570946, 0, 0, 0, 1, 1,
0.02428341, 1.764552, 1.317333, 0, 0, 0, 1, 1,
0.02661297, -0.7223135, 4.677205, 0, 0, 0, 1, 1,
0.02955071, -0.7308356, 2.855405, 0, 0, 0, 1, 1,
0.03155795, -1.392992, 3.265356, 0, 0, 0, 1, 1,
0.03187584, 1.240703, 0.4055475, 0, 0, 0, 1, 1,
0.03675653, 0.5016214, 1.382171, 0, 0, 0, 1, 1,
0.03719242, 0.5209675, -1.031191, 1, 1, 1, 1, 1,
0.03983472, -0.2774423, 4.770308, 1, 1, 1, 1, 1,
0.04079916, 0.6772026, -0.7927959, 1, 1, 1, 1, 1,
0.04362078, -0.8587475, 2.678987, 1, 1, 1, 1, 1,
0.04488733, 1.76882, -1.377217, 1, 1, 1, 1, 1,
0.04948077, -1.035228, 2.436614, 1, 1, 1, 1, 1,
0.04954066, -1.344693, 3.658724, 1, 1, 1, 1, 1,
0.05145068, -0.2704614, 3.484465, 1, 1, 1, 1, 1,
0.05445827, -0.8875741, 3.883091, 1, 1, 1, 1, 1,
0.05529479, 0.5088381, 1.175128, 1, 1, 1, 1, 1,
0.05970675, -1.417223, 2.687708, 1, 1, 1, 1, 1,
0.06153394, 1.92618, 0.7943487, 1, 1, 1, 1, 1,
0.0648189, 0.3639915, -0.3532629, 1, 1, 1, 1, 1,
0.07044963, -0.2705472, 2.990721, 1, 1, 1, 1, 1,
0.07525754, 0.5268214, 0.07299995, 1, 1, 1, 1, 1,
0.07646152, 1.180973, -0.5288972, 0, 0, 1, 1, 1,
0.07725941, -0.2856341, 2.255569, 1, 0, 0, 1, 1,
0.0854119, 1.617337, -0.8820898, 1, 0, 0, 1, 1,
0.08643623, 1.34196, -0.129736, 1, 0, 0, 1, 1,
0.08658899, 0.8674543, 0.04402176, 1, 0, 0, 1, 1,
0.08895895, -1.799992, 3.299691, 1, 0, 0, 1, 1,
0.09121946, -1.339683, 3.271887, 0, 0, 0, 1, 1,
0.09215669, -1.50366, 3.956145, 0, 0, 0, 1, 1,
0.09273612, 0.2046337, 0.5137897, 0, 0, 0, 1, 1,
0.09948584, -1.465439, 4.051823, 0, 0, 0, 1, 1,
0.10322, -1.323614, 4.518815, 0, 0, 0, 1, 1,
0.107246, 1.743001, 0.7793716, 0, 0, 0, 1, 1,
0.1089916, 0.1758898, 2.267179, 0, 0, 0, 1, 1,
0.1105179, 1.236971, -0.1201416, 1, 1, 1, 1, 1,
0.1118339, 0.1421741, 1.54218, 1, 1, 1, 1, 1,
0.1194521, -0.787499, 2.782972, 1, 1, 1, 1, 1,
0.1202652, -0.6990154, 2.523415, 1, 1, 1, 1, 1,
0.1276384, 1.054034, 0.09404387, 1, 1, 1, 1, 1,
0.1305303, -1.87154, 3.511027, 1, 1, 1, 1, 1,
0.1328559, -0.0654216, 3.548112, 1, 1, 1, 1, 1,
0.1349327, 0.1039301, 2.308637, 1, 1, 1, 1, 1,
0.1369032, 0.8744943, 0.479132, 1, 1, 1, 1, 1,
0.1372401, 1.005083, 0.9054034, 1, 1, 1, 1, 1,
0.1389358, -1.819885, 3.68125, 1, 1, 1, 1, 1,
0.1401101, -1.587685, 4.14379, 1, 1, 1, 1, 1,
0.1439091, -0.3409314, 1.898005, 1, 1, 1, 1, 1,
0.1446179, 1.416443, -0.3463366, 1, 1, 1, 1, 1,
0.1505961, -0.266497, 2.262054, 1, 1, 1, 1, 1,
0.1515371, 1.143163, -0.5701652, 0, 0, 1, 1, 1,
0.1518444, -0.1904206, 3.414721, 1, 0, 0, 1, 1,
0.1538113, 1.286463, 0.435029, 1, 0, 0, 1, 1,
0.1574014, 0.710044, -0.6489355, 1, 0, 0, 1, 1,
0.1637826, -0.0583978, 0.001707255, 1, 0, 0, 1, 1,
0.1719025, 0.05190905, 2.520442, 1, 0, 0, 1, 1,
0.1725814, -0.3262878, 2.26169, 0, 0, 0, 1, 1,
0.1734748, 0.07275382, 1.674448, 0, 0, 0, 1, 1,
0.1785212, 0.220915, 0.9856786, 0, 0, 0, 1, 1,
0.1859857, 0.9061501, 1.517865, 0, 0, 0, 1, 1,
0.1924298, 0.8900112, -1.629447, 0, 0, 0, 1, 1,
0.1925352, 0.1956691, 2.002915, 0, 0, 0, 1, 1,
0.1961017, 0.5953853, 1.456354, 0, 0, 0, 1, 1,
0.1979677, 1.835903, -3.275038, 1, 1, 1, 1, 1,
0.2027718, 0.6836662, 1.416253, 1, 1, 1, 1, 1,
0.2040163, -0.5405877, 2.195889, 1, 1, 1, 1, 1,
0.2048422, -0.1145043, 0.5070817, 1, 1, 1, 1, 1,
0.2123801, 0.01123426, 4.684031, 1, 1, 1, 1, 1,
0.2125029, 0.00699205, 1.566952, 1, 1, 1, 1, 1,
0.2163114, -0.4489385, 2.586869, 1, 1, 1, 1, 1,
0.2168318, -1.265921, 2.332705, 1, 1, 1, 1, 1,
0.2176247, -1.027552, 3.21479, 1, 1, 1, 1, 1,
0.218419, -1.138442, 2.620037, 1, 1, 1, 1, 1,
0.2203419, -1.858058, 3.841239, 1, 1, 1, 1, 1,
0.2240294, -0.823503, 4.093304, 1, 1, 1, 1, 1,
0.2244179, -0.05780055, 1.865038, 1, 1, 1, 1, 1,
0.2346537, -2.396163, 0.5707071, 1, 1, 1, 1, 1,
0.2349829, -0.7915573, 3.143666, 1, 1, 1, 1, 1,
0.2357084, 1.187887, -0.2949992, 0, 0, 1, 1, 1,
0.2379318, -0.9446524, 2.730089, 1, 0, 0, 1, 1,
0.2395966, 1.038148, -0.4782866, 1, 0, 0, 1, 1,
0.2410154, 1.80645, 1.578497, 1, 0, 0, 1, 1,
0.253012, -1.343777, 2.592895, 1, 0, 0, 1, 1,
0.2583588, 1.879919, -1.279168, 1, 0, 0, 1, 1,
0.2584667, 0.9831011, -0.1915717, 0, 0, 0, 1, 1,
0.2608784, -0.3990859, 2.349043, 0, 0, 0, 1, 1,
0.2631291, -0.5159622, 4.85516, 0, 0, 0, 1, 1,
0.2782808, 1.079159, 0.1238328, 0, 0, 0, 1, 1,
0.2854116, -1.842209, 4.219453, 0, 0, 0, 1, 1,
0.2856154, 0.1715821, 0.7942674, 0, 0, 0, 1, 1,
0.2862595, 0.927724, 0.8010685, 0, 0, 0, 1, 1,
0.2873217, 0.09495655, -0.7268627, 1, 1, 1, 1, 1,
0.2882094, 0.1289115, 1.588046, 1, 1, 1, 1, 1,
0.2891879, -0.5834041, 1.34858, 1, 1, 1, 1, 1,
0.2893852, -0.7429347, 2.218015, 1, 1, 1, 1, 1,
0.290489, -0.4568769, 3.454286, 1, 1, 1, 1, 1,
0.3003508, -0.5934868, 2.984974, 1, 1, 1, 1, 1,
0.3054278, 0.1253269, 2.354236, 1, 1, 1, 1, 1,
0.3108377, -1.761373, 1.628107, 1, 1, 1, 1, 1,
0.3115344, -0.3245652, 3.003449, 1, 1, 1, 1, 1,
0.3176046, 0.3386356, 1.94047, 1, 1, 1, 1, 1,
0.3256785, -1.030539, 2.888212, 1, 1, 1, 1, 1,
0.3288086, 0.6098028, 1.163404, 1, 1, 1, 1, 1,
0.3294176, -0.3670931, 4.404961, 1, 1, 1, 1, 1,
0.3297325, -1.734766, 2.239429, 1, 1, 1, 1, 1,
0.335492, -1.190519, 4.081727, 1, 1, 1, 1, 1,
0.3384786, -1.134465, 2.430676, 0, 0, 1, 1, 1,
0.3406542, 0.2805063, -0.210365, 1, 0, 0, 1, 1,
0.3416598, -0.4157582, 3.450125, 1, 0, 0, 1, 1,
0.3455051, -0.987443, 3.363609, 1, 0, 0, 1, 1,
0.3457944, 0.3684766, 1.121073, 1, 0, 0, 1, 1,
0.3458245, -0.4441999, 1.886574, 1, 0, 0, 1, 1,
0.3473426, 1.387565, -0.7309865, 0, 0, 0, 1, 1,
0.3503954, 1.538057, -0.5979088, 0, 0, 0, 1, 1,
0.3582449, 0.4498965, 0.745638, 0, 0, 0, 1, 1,
0.3599271, -1.203897, 3.885784, 0, 0, 0, 1, 1,
0.3599596, -0.112486, 1.453971, 0, 0, 0, 1, 1,
0.3687295, 1.323395, 0.05637379, 0, 0, 0, 1, 1,
0.3714089, 0.543399, 0.4839761, 0, 0, 0, 1, 1,
0.375017, 0.1530126, 2.40756, 1, 1, 1, 1, 1,
0.377588, 1.636199, -0.3768082, 1, 1, 1, 1, 1,
0.3794519, 0.4197091, 1.738423, 1, 1, 1, 1, 1,
0.3803857, -0.1473627, 1.981554, 1, 1, 1, 1, 1,
0.3819703, 0.8480753, 0.6464798, 1, 1, 1, 1, 1,
0.3833067, -0.9021739, 1.36702, 1, 1, 1, 1, 1,
0.3836111, 0.09447727, 0.2553039, 1, 1, 1, 1, 1,
0.394887, -0.8430449, 2.890847, 1, 1, 1, 1, 1,
0.3962937, 2.060224, -0.504366, 1, 1, 1, 1, 1,
0.3963205, -0.8819246, 2.59004, 1, 1, 1, 1, 1,
0.3979715, 0.4854228, 2.199677, 1, 1, 1, 1, 1,
0.4005361, 0.4749807, 0.2648325, 1, 1, 1, 1, 1,
0.401682, 1.265049, 0.4234688, 1, 1, 1, 1, 1,
0.4045855, 0.5175974, 1.156185, 1, 1, 1, 1, 1,
0.4098806, -0.5828685, 3.900194, 1, 1, 1, 1, 1,
0.4103829, 0.7256046, 1.315354, 0, 0, 1, 1, 1,
0.4205356, 0.6221071, 0.4931286, 1, 0, 0, 1, 1,
0.4254493, -1.419459, 1.458518, 1, 0, 0, 1, 1,
0.4257106, 1.142598, -1.079723, 1, 0, 0, 1, 1,
0.4271557, -0.9488364, 2.974819, 1, 0, 0, 1, 1,
0.4287551, -0.13105, 2.597745, 1, 0, 0, 1, 1,
0.429384, -0.3416964, 2.511736, 0, 0, 0, 1, 1,
0.4312067, 1.406121, -0.1924964, 0, 0, 0, 1, 1,
0.4317964, -0.6833616, 3.687065, 0, 0, 0, 1, 1,
0.4359164, 2.320296, 1.732624, 0, 0, 0, 1, 1,
0.4368182, -0.3839993, 3.924134, 0, 0, 0, 1, 1,
0.4381605, 0.725648, 0.5345277, 0, 0, 0, 1, 1,
0.4389013, -0.8204201, 2.207596, 0, 0, 0, 1, 1,
0.4402978, 1.453489, -0.01255256, 1, 1, 1, 1, 1,
0.4441665, -0.513949, 2.857034, 1, 1, 1, 1, 1,
0.4471651, -0.2246516, 2.611231, 1, 1, 1, 1, 1,
0.4487301, 0.5395517, 1.093103, 1, 1, 1, 1, 1,
0.4517445, -1.362342, 1.720325, 1, 1, 1, 1, 1,
0.4529373, -0.2743078, 4.25026, 1, 1, 1, 1, 1,
0.4565361, 1.659219, 0.4362968, 1, 1, 1, 1, 1,
0.456808, -0.8002934, 2.611261, 1, 1, 1, 1, 1,
0.4570552, 0.6219556, 1.457862, 1, 1, 1, 1, 1,
0.4586778, 1.410788, -0.3188156, 1, 1, 1, 1, 1,
0.4657557, 1.662173, 0.3632498, 1, 1, 1, 1, 1,
0.4664168, 0.5538996, 0.5283182, 1, 1, 1, 1, 1,
0.4692805, -0.5349401, 1.822477, 1, 1, 1, 1, 1,
0.4697287, -0.6730098, 2.013348, 1, 1, 1, 1, 1,
0.4698558, 0.613373, 1.880902, 1, 1, 1, 1, 1,
0.4727086, 0.8499081, 0.5012844, 0, 0, 1, 1, 1,
0.4741017, 1.225337, -0.2849039, 1, 0, 0, 1, 1,
0.4819008, 1.58829, 0.7121807, 1, 0, 0, 1, 1,
0.4826773, -0.2812617, 2.352972, 1, 0, 0, 1, 1,
0.4833007, -0.2726213, 3.899451, 1, 0, 0, 1, 1,
0.4839952, 0.407972, 0.7184459, 1, 0, 0, 1, 1,
0.4848384, -0.4384532, 1.191227, 0, 0, 0, 1, 1,
0.48758, -0.2256518, 2.674767, 0, 0, 0, 1, 1,
0.4893071, 0.3554189, -0.04479196, 0, 0, 0, 1, 1,
0.4894366, 0.4959259, 1.067012, 0, 0, 0, 1, 1,
0.4899534, -2.178591, 2.288565, 0, 0, 0, 1, 1,
0.4948183, 1.34571, 0.4469665, 0, 0, 0, 1, 1,
0.4950477, 2.027893, -0.951168, 0, 0, 0, 1, 1,
0.5023758, -0.73948, 3.412077, 1, 1, 1, 1, 1,
0.5048569, -1.059154, 1.871766, 1, 1, 1, 1, 1,
0.5068212, 0.7989814, -0.3456468, 1, 1, 1, 1, 1,
0.5071667, -0.3803209, 1.872716, 1, 1, 1, 1, 1,
0.5088781, 0.0535259, 0.3529339, 1, 1, 1, 1, 1,
0.5138038, -0.06433681, 1.861349, 1, 1, 1, 1, 1,
0.5164714, -0.7128248, 2.801799, 1, 1, 1, 1, 1,
0.518244, 0.6016806, 1.913, 1, 1, 1, 1, 1,
0.5198822, 0.968728, -0.8652726, 1, 1, 1, 1, 1,
0.5211424, -1.49806, 2.267082, 1, 1, 1, 1, 1,
0.5218672, 0.5993456, 0.3349988, 1, 1, 1, 1, 1,
0.5310324, 1.944078, 0.9951318, 1, 1, 1, 1, 1,
0.5371888, 0.4004587, 0.7864335, 1, 1, 1, 1, 1,
0.5377097, -0.03658028, 1.054637, 1, 1, 1, 1, 1,
0.5378001, -0.4989937, 1.410231, 1, 1, 1, 1, 1,
0.53819, 0.4700446, -0.2490884, 0, 0, 1, 1, 1,
0.5393797, -0.1875529, 1.497973, 1, 0, 0, 1, 1,
0.5396306, -0.934177, 3.044447, 1, 0, 0, 1, 1,
0.5411532, 0.02382153, 3.009122, 1, 0, 0, 1, 1,
0.5422013, -0.2169794, 1.695586, 1, 0, 0, 1, 1,
0.547438, -1.214302, 2.034833, 1, 0, 0, 1, 1,
0.5483389, 0.1944967, 1.549708, 0, 0, 0, 1, 1,
0.5485202, 0.4055491, 0.8709825, 0, 0, 0, 1, 1,
0.5505156, -0.170263, 1.071375, 0, 0, 0, 1, 1,
0.551972, 1.381071, -0.3187512, 0, 0, 0, 1, 1,
0.554262, -0.05909283, 0.1005559, 0, 0, 0, 1, 1,
0.556302, -0.09847748, 3.112158, 0, 0, 0, 1, 1,
0.5621791, -0.7990429, 1.596247, 0, 0, 0, 1, 1,
0.5623604, -0.5979719, 0.5252302, 1, 1, 1, 1, 1,
0.5627504, 1.41964, 0.2368037, 1, 1, 1, 1, 1,
0.567898, -0.317567, 3.42245, 1, 1, 1, 1, 1,
0.5705436, -0.4950203, 2.583131, 1, 1, 1, 1, 1,
0.578339, 0.6479779, -0.9546108, 1, 1, 1, 1, 1,
0.580074, -0.04128126, 2.664434, 1, 1, 1, 1, 1,
0.5969082, -0.1677376, 1.753716, 1, 1, 1, 1, 1,
0.5981491, 0.3733047, 4.052938, 1, 1, 1, 1, 1,
0.5995459, 1.062176, 2.932132, 1, 1, 1, 1, 1,
0.6070451, 0.7624388, 1.688944, 1, 1, 1, 1, 1,
0.6088897, 0.4421798, 1.344246, 1, 1, 1, 1, 1,
0.614222, -0.7806906, 4.062614, 1, 1, 1, 1, 1,
0.6190693, -0.4592764, 3.368364, 1, 1, 1, 1, 1,
0.6228961, 1.603219, -0.4091993, 1, 1, 1, 1, 1,
0.6278253, -0.264645, 3.608369, 1, 1, 1, 1, 1,
0.6287118, -0.7673662, 2.92296, 0, 0, 1, 1, 1,
0.6340448, 0.08807824, 0.7084199, 1, 0, 0, 1, 1,
0.6374708, -1.134487, 1.709509, 1, 0, 0, 1, 1,
0.6408504, -1.904998, 3.673968, 1, 0, 0, 1, 1,
0.6433154, -0.6333089, 2.695603, 1, 0, 0, 1, 1,
0.6467866, -0.231434, 1.147602, 1, 0, 0, 1, 1,
0.653126, 0.8916959, 2.938187, 0, 0, 0, 1, 1,
0.656234, 2.344684, -0.08370872, 0, 0, 0, 1, 1,
0.6564974, 0.9277678, 0.5600917, 0, 0, 0, 1, 1,
0.6609802, 0.498163, -0.03285683, 0, 0, 0, 1, 1,
0.6621345, -0.9967901, 1.997026, 0, 0, 0, 1, 1,
0.6644658, -0.5923532, 2.925053, 0, 0, 0, 1, 1,
0.6661711, -0.5940257, 3.078599, 0, 0, 0, 1, 1,
0.6679758, -0.9364965, 4.230324, 1, 1, 1, 1, 1,
0.6762791, -2.235076, 2.385783, 1, 1, 1, 1, 1,
0.6896897, 0.4690681, 1.167373, 1, 1, 1, 1, 1,
0.6902195, 1.458292, 0.2133788, 1, 1, 1, 1, 1,
0.6927134, -0.339088, 2.987597, 1, 1, 1, 1, 1,
0.6934958, -1.342366, 2.288207, 1, 1, 1, 1, 1,
0.6978414, -1.05235, 3.129971, 1, 1, 1, 1, 1,
0.7007712, 0.04478223, 0.5074283, 1, 1, 1, 1, 1,
0.7045651, 1.235101, 0.9731094, 1, 1, 1, 1, 1,
0.7075508, -0.7918203, 2.001361, 1, 1, 1, 1, 1,
0.7140129, 0.5346115, 0.261511, 1, 1, 1, 1, 1,
0.716607, -0.09863865, 1.577829, 1, 1, 1, 1, 1,
0.7224099, -0.2134188, 2.186941, 1, 1, 1, 1, 1,
0.7309819, -0.5412518, -1.340984, 1, 1, 1, 1, 1,
0.7417806, -0.4568416, 2.638838, 1, 1, 1, 1, 1,
0.7424722, -0.6522059, 2.796769, 0, 0, 1, 1, 1,
0.7441149, 0.6643123, 0.8244829, 1, 0, 0, 1, 1,
0.7464108, 0.2869864, 3.498185, 1, 0, 0, 1, 1,
0.7469584, 1.589643, 0.2177193, 1, 0, 0, 1, 1,
0.750338, -0.2201169, 2.684491, 1, 0, 0, 1, 1,
0.7521558, -0.4570122, -0.03056099, 1, 0, 0, 1, 1,
0.7524474, 0.9021585, 0.8477119, 0, 0, 0, 1, 1,
0.7562923, -0.03961953, 1.749623, 0, 0, 0, 1, 1,
0.7571194, 0.3841847, 1.328408, 0, 0, 0, 1, 1,
0.7630363, -1.574771, 3.19517, 0, 0, 0, 1, 1,
0.7643721, -0.4222151, 1.856729, 0, 0, 0, 1, 1,
0.7681409, 0.6358942, -0.8786139, 0, 0, 0, 1, 1,
0.7697713, 0.6251844, 3.223418, 0, 0, 0, 1, 1,
0.7727252, -1.325282, 3.075931, 1, 1, 1, 1, 1,
0.7774306, -0.5927573, 2.710631, 1, 1, 1, 1, 1,
0.7835895, -0.2650763, 0.412618, 1, 1, 1, 1, 1,
0.7852097, 1.956902, -0.5322569, 1, 1, 1, 1, 1,
0.7865686, -0.222111, 2.294036, 1, 1, 1, 1, 1,
0.7879689, 0.07457246, -0.5638846, 1, 1, 1, 1, 1,
0.7925251, -0.5276544, 2.207904, 1, 1, 1, 1, 1,
0.7958121, -1.11195, 2.281, 1, 1, 1, 1, 1,
0.8011493, -0.492558, 2.725406, 1, 1, 1, 1, 1,
0.8066263, 0.229556, 0.8698288, 1, 1, 1, 1, 1,
0.8080291, 0.1115577, 1.374107, 1, 1, 1, 1, 1,
0.8101763, 0.6198667, 0.3120421, 1, 1, 1, 1, 1,
0.817865, 0.9434568, 0.1316208, 1, 1, 1, 1, 1,
0.8179994, 0.4949751, 3.258904, 1, 1, 1, 1, 1,
0.8288192, -0.2419189, 2.745399, 1, 1, 1, 1, 1,
0.8356286, 0.319831, 0.9754232, 0, 0, 1, 1, 1,
0.836192, 0.4358283, 0.6471776, 1, 0, 0, 1, 1,
0.8405442, -0.1547823, 2.326866, 1, 0, 0, 1, 1,
0.842712, -0.4198171, 0.2649765, 1, 0, 0, 1, 1,
0.8433432, -2.138012, 3.748282, 1, 0, 0, 1, 1,
0.8470947, 1.113957, -1.146066, 1, 0, 0, 1, 1,
0.8503776, -0.67024, 1.631359, 0, 0, 0, 1, 1,
0.8550783, -1.167363, 3.048506, 0, 0, 0, 1, 1,
0.8563188, 0.1662166, 1.82023, 0, 0, 0, 1, 1,
0.8576827, -0.01907122, 1.340188, 0, 0, 0, 1, 1,
0.8602171, 0.02021518, 0.5860046, 0, 0, 0, 1, 1,
0.8605573, 0.01816978, 1.239749, 0, 0, 0, 1, 1,
0.8626757, -0.3797623, 1.361003, 0, 0, 0, 1, 1,
0.8644888, -0.2416964, -0.4932358, 1, 1, 1, 1, 1,
0.8714476, 0.066613, 1.147959, 1, 1, 1, 1, 1,
0.8734847, 1.990398, 1.863448, 1, 1, 1, 1, 1,
0.8909912, -0.0554352, 0.7882876, 1, 1, 1, 1, 1,
0.8952831, 0.5116538, -0.6911005, 1, 1, 1, 1, 1,
0.9081007, -0.1668889, 2.695572, 1, 1, 1, 1, 1,
0.9114903, -0.3034671, 3.027627, 1, 1, 1, 1, 1,
0.9158555, 0.03628246, 1.526855, 1, 1, 1, 1, 1,
0.9203676, 2.567735, 0.6011486, 1, 1, 1, 1, 1,
0.923816, 0.2128844, 1.803867, 1, 1, 1, 1, 1,
0.9241358, 1.244471, 1.254248, 1, 1, 1, 1, 1,
0.9272549, -0.05429766, 3.67984, 1, 1, 1, 1, 1,
0.9287194, 0.580599, 0.09388459, 1, 1, 1, 1, 1,
0.9312262, 0.03381275, 2.264029, 1, 1, 1, 1, 1,
0.9327152, -1.505856, 2.298251, 1, 1, 1, 1, 1,
0.9338462, 2.553506, 1.85313, 0, 0, 1, 1, 1,
0.9380174, -0.301966, 1.169961, 1, 0, 0, 1, 1,
0.9450938, 0.9668012, 0.5553647, 1, 0, 0, 1, 1,
0.9453247, -0.1702805, 0.8144918, 1, 0, 0, 1, 1,
0.951821, -0.6201431, 2.559782, 1, 0, 0, 1, 1,
0.95712, 0.1681644, 3.175569, 1, 0, 0, 1, 1,
0.957619, -0.8758311, 0.7332938, 0, 0, 0, 1, 1,
0.963199, -1.29498, 2.554005, 0, 0, 0, 1, 1,
0.9742908, -1.280194, 3.875928, 0, 0, 0, 1, 1,
0.9754947, 0.7011674, 2.239925, 0, 0, 0, 1, 1,
0.9911007, 0.1222075, -0.02306621, 0, 0, 0, 1, 1,
0.9936434, 0.745227, 1.556273, 0, 0, 0, 1, 1,
0.994452, 0.1171016, 1.712088, 0, 0, 0, 1, 1,
1.000139, 1.777027, 0.267098, 1, 1, 1, 1, 1,
1.004608, 1.074542, 2.067487, 1, 1, 1, 1, 1,
1.006169, -0.0606466, 1.915076, 1, 1, 1, 1, 1,
1.010048, -1.338463, 1.580317, 1, 1, 1, 1, 1,
1.020518, 0.942789, 0.8603378, 1, 1, 1, 1, 1,
1.02081, -0.7612551, 0.2840873, 1, 1, 1, 1, 1,
1.027201, 0.1056972, 0.6732511, 1, 1, 1, 1, 1,
1.039144, 0.01476381, -0.7395521, 1, 1, 1, 1, 1,
1.046011, 1.88776, -0.3191087, 1, 1, 1, 1, 1,
1.051611, -0.3170872, 2.545889, 1, 1, 1, 1, 1,
1.069569, -0.317018, 2.338392, 1, 1, 1, 1, 1,
1.073864, 1.792716, 0.5236475, 1, 1, 1, 1, 1,
1.0808, 0.4925338, 0.5471061, 1, 1, 1, 1, 1,
1.081114, 2.323286, 0.8873543, 1, 1, 1, 1, 1,
1.081322, -2.244329, 1.329236, 1, 1, 1, 1, 1,
1.081672, -1.507888, 2.778463, 0, 0, 1, 1, 1,
1.087561, 1.362244, -0.07619464, 1, 0, 0, 1, 1,
1.090662, -0.7353521, 3.464379, 1, 0, 0, 1, 1,
1.10018, 0.1932744, 1.665421, 1, 0, 0, 1, 1,
1.101386, 1.202947, 1.23476, 1, 0, 0, 1, 1,
1.110928, -0.2149643, 1.986236, 1, 0, 0, 1, 1,
1.117122, 1.977032, -0.0008521853, 0, 0, 0, 1, 1,
1.119499, -0.225088, 0.2815812, 0, 0, 0, 1, 1,
1.120201, 1.47354, 0.8201904, 0, 0, 0, 1, 1,
1.120325, 1.239382, 0.6572577, 0, 0, 0, 1, 1,
1.123717, -0.4214201, 0.5434898, 0, 0, 0, 1, 1,
1.129417, -0.3119388, 1.511215, 0, 0, 0, 1, 1,
1.136836, 1.424957, 1.406335, 0, 0, 0, 1, 1,
1.145925, 1.16816, -0.5513991, 1, 1, 1, 1, 1,
1.151003, -0.1110382, 1.677099, 1, 1, 1, 1, 1,
1.152078, 0.4813314, 2.555918, 1, 1, 1, 1, 1,
1.155684, -0.2521669, 1.792631, 1, 1, 1, 1, 1,
1.156837, -1.235434, 1.448669, 1, 1, 1, 1, 1,
1.160538, -0.6143659, 0.9627774, 1, 1, 1, 1, 1,
1.161131, 0.4121105, 2.505275, 1, 1, 1, 1, 1,
1.161455, 0.7557988, 1.502859, 1, 1, 1, 1, 1,
1.161533, 0.688661, 0.2183181, 1, 1, 1, 1, 1,
1.161657, -0.0919695, 1.15507, 1, 1, 1, 1, 1,
1.162425, 0.3149066, -0.7725879, 1, 1, 1, 1, 1,
1.162633, -1.085877, 1.888496, 1, 1, 1, 1, 1,
1.16552, -0.1916655, 1.763699, 1, 1, 1, 1, 1,
1.167359, -1.584145, 1.593781, 1, 1, 1, 1, 1,
1.17174, -0.8934768, 2.160926, 1, 1, 1, 1, 1,
1.176384, -0.9644195, 3.108363, 0, 0, 1, 1, 1,
1.177558, 0.8977875, 0.4686574, 1, 0, 0, 1, 1,
1.178091, 0.2604312, 1.684607, 1, 0, 0, 1, 1,
1.180615, 1.176609, 1.288391, 1, 0, 0, 1, 1,
1.184242, 2.185164, 0.100286, 1, 0, 0, 1, 1,
1.18504, -1.076071, 1.400077, 1, 0, 0, 1, 1,
1.189853, 0.9586936, 2.624269, 0, 0, 0, 1, 1,
1.193227, 1.158499, 0.4894147, 0, 0, 0, 1, 1,
1.202974, 0.9258019, 1.783162, 0, 0, 0, 1, 1,
1.204329, 0.7597983, 0.9961182, 0, 0, 0, 1, 1,
1.209029, 0.2488198, 1.424702, 0, 0, 0, 1, 1,
1.211665, 0.7977585, 1.022713, 0, 0, 0, 1, 1,
1.213512, -0.4077794, 1.58454, 0, 0, 0, 1, 1,
1.218448, -0.4544944, 0.4925247, 1, 1, 1, 1, 1,
1.220815, 0.3385497, 1.670943, 1, 1, 1, 1, 1,
1.221343, 0.6894317, 0.3195961, 1, 1, 1, 1, 1,
1.224125, 0.1287612, 0.8373756, 1, 1, 1, 1, 1,
1.225895, -1.428765, 1.983522, 1, 1, 1, 1, 1,
1.235891, 1.221847, -0.02397429, 1, 1, 1, 1, 1,
1.237441, -0.399717, 2.981303, 1, 1, 1, 1, 1,
1.249748, -0.829373, 1.783179, 1, 1, 1, 1, 1,
1.252397, -0.4216971, 1.839311, 1, 1, 1, 1, 1,
1.257293, 0.3665066, 0.6995294, 1, 1, 1, 1, 1,
1.271802, 0.01921223, 0.9615858, 1, 1, 1, 1, 1,
1.273911, 0.690999, 1.588546, 1, 1, 1, 1, 1,
1.274498, 0.184536, 1.162303, 1, 1, 1, 1, 1,
1.282742, -0.8413864, 1.794999, 1, 1, 1, 1, 1,
1.286438, 0.7896048, 0.7254677, 1, 1, 1, 1, 1,
1.293019, 0.91497, 0.1889133, 0, 0, 1, 1, 1,
1.304573, 1.760122, 0.5976222, 1, 0, 0, 1, 1,
1.306762, 0.7208146, 0.9633375, 1, 0, 0, 1, 1,
1.309678, -2.353809, 3.156558, 1, 0, 0, 1, 1,
1.320475, 0.9043499, 1.169029, 1, 0, 0, 1, 1,
1.324139, 0.480872, 1.824231, 1, 0, 0, 1, 1,
1.331882, -1.102028, 2.879784, 0, 0, 0, 1, 1,
1.337957, 0.5036218, 1.616765, 0, 0, 0, 1, 1,
1.340647, 0.3393695, 2.116771, 0, 0, 0, 1, 1,
1.342112, 0.8259705, 1.47216, 0, 0, 0, 1, 1,
1.347026, -0.3572105, 2.567286, 0, 0, 0, 1, 1,
1.350898, -0.09200563, 1.308436, 0, 0, 0, 1, 1,
1.362634, 0.1522662, 0.702808, 0, 0, 0, 1, 1,
1.36593, -0.5591658, 1.450255, 1, 1, 1, 1, 1,
1.366248, -0.4607259, 4.457191, 1, 1, 1, 1, 1,
1.367675, -0.125562, 1.104721, 1, 1, 1, 1, 1,
1.368209, -0.311192, 1.65696, 1, 1, 1, 1, 1,
1.381239, -0.2389242, 2.445437, 1, 1, 1, 1, 1,
1.386729, -1.250166, 1.745913, 1, 1, 1, 1, 1,
1.393254, -0.6160614, 1.839639, 1, 1, 1, 1, 1,
1.400302, -0.1586292, 1.727403, 1, 1, 1, 1, 1,
1.400927, 1.15444, 1.269081, 1, 1, 1, 1, 1,
1.401616, -1.924687, 2.666866, 1, 1, 1, 1, 1,
1.402757, -0.05789614, 0.1140965, 1, 1, 1, 1, 1,
1.407709, 0.1358879, 1.075331, 1, 1, 1, 1, 1,
1.407903, 1.157758, -1.088131, 1, 1, 1, 1, 1,
1.410442, -1.537898, 3.445241, 1, 1, 1, 1, 1,
1.417783, -0.3181207, 1.437408, 1, 1, 1, 1, 1,
1.419714, -1.960573, 2.599822, 0, 0, 1, 1, 1,
1.432033, -0.2313695, 1.644363, 1, 0, 0, 1, 1,
1.435163, -0.4673228, 2.278213, 1, 0, 0, 1, 1,
1.437512, -1.432649, 2.91271, 1, 0, 0, 1, 1,
1.438634, 1.619669, 1.783415, 1, 0, 0, 1, 1,
1.440029, -1.635844, 1.821789, 1, 0, 0, 1, 1,
1.444938, 0.6972774, 0.5443304, 0, 0, 0, 1, 1,
1.448744, -1.373423, 2.423264, 0, 0, 0, 1, 1,
1.456653, -1.095731, 1.298548, 0, 0, 0, 1, 1,
1.45877, 0.3047494, 0.3782122, 0, 0, 0, 1, 1,
1.459705, 0.7398591, 0.9887729, 0, 0, 0, 1, 1,
1.468554, 1.202204, 1.023084, 0, 0, 0, 1, 1,
1.468615, -2.084704, 3.713002, 0, 0, 0, 1, 1,
1.474788, -0.4930193, 1.598289, 1, 1, 1, 1, 1,
1.493931, -0.4448905, 2.526488, 1, 1, 1, 1, 1,
1.500283, 0.4874797, 0.7446039, 1, 1, 1, 1, 1,
1.510203, 0.6254377, 2.121257, 1, 1, 1, 1, 1,
1.52152, 0.9691632, 2.359716, 1, 1, 1, 1, 1,
1.53617, 0.01604668, 1.183985, 1, 1, 1, 1, 1,
1.570253, -0.1022382, -0.3083459, 1, 1, 1, 1, 1,
1.573492, 0.5127726, 2.281398, 1, 1, 1, 1, 1,
1.574162, -0.4833247, 3.111427, 1, 1, 1, 1, 1,
1.574793, 0.3637908, 1.370436, 1, 1, 1, 1, 1,
1.580059, 1.240537, 0.9218426, 1, 1, 1, 1, 1,
1.593457, -1.895893, 2.501705, 1, 1, 1, 1, 1,
1.623832, -0.01792735, 3.923294, 1, 1, 1, 1, 1,
1.627274, -1.052548, 0.7003008, 1, 1, 1, 1, 1,
1.631329, 0.8551549, -1.593534, 1, 1, 1, 1, 1,
1.633915, -0.3673324, 2.750984, 0, 0, 1, 1, 1,
1.640808, 0.885293, 2.301744, 1, 0, 0, 1, 1,
1.645227, 0.3344677, 0.8626972, 1, 0, 0, 1, 1,
1.646718, 1.937109, 2.781793, 1, 0, 0, 1, 1,
1.656823, 1.010503, 1.303196, 1, 0, 0, 1, 1,
1.664004, -1.792131, 2.552154, 1, 0, 0, 1, 1,
1.695318, -0.7609889, 2.832021, 0, 0, 0, 1, 1,
1.698807, 1.312584, 1.3853, 0, 0, 0, 1, 1,
1.724951, 1.932861, 2.198741, 0, 0, 0, 1, 1,
1.727073, 0.5402697, 1.578755, 0, 0, 0, 1, 1,
1.73793, -0.2980256, 1.942044, 0, 0, 0, 1, 1,
1.776795, 0.004925591, -0.2703294, 0, 0, 0, 1, 1,
1.777239, 0.9362991, 0.6942063, 0, 0, 0, 1, 1,
1.779631, -1.152573, 2.139304, 1, 1, 1, 1, 1,
1.780714, -0.2621658, 2.402976, 1, 1, 1, 1, 1,
1.805159, 0.7979076, 2.405499, 1, 1, 1, 1, 1,
1.827839, -1.165275, 1.212662, 1, 1, 1, 1, 1,
1.8345, 1.742896, -0.3760002, 1, 1, 1, 1, 1,
1.847883, -0.4293003, 1.183578, 1, 1, 1, 1, 1,
1.848359, 0.4868349, 2.145009, 1, 1, 1, 1, 1,
1.86327, 0.9774652, 1.092437, 1, 1, 1, 1, 1,
1.872431, 0.1071498, 2.697217, 1, 1, 1, 1, 1,
1.875602, -1.935382, -0.4617713, 1, 1, 1, 1, 1,
1.884259, -0.08260748, 1.860295, 1, 1, 1, 1, 1,
1.884333, 0.2172296, 2.481628, 1, 1, 1, 1, 1,
1.909594, -0.7522362, 1.070722, 1, 1, 1, 1, 1,
1.913029, 1.050656, 0.04420276, 1, 1, 1, 1, 1,
1.917067, -0.4621867, 0.6639363, 1, 1, 1, 1, 1,
1.919816, 0.1015049, 1.4769, 0, 0, 1, 1, 1,
1.955971, -1.911185, 2.350275, 1, 0, 0, 1, 1,
1.987152, 0.4572907, 0.9221484, 1, 0, 0, 1, 1,
1.994114, -0.9537793, 2.961632, 1, 0, 0, 1, 1,
1.998769, 0.6669296, 0.985269, 1, 0, 0, 1, 1,
2.011842, -0.6947914, 2.68677, 1, 0, 0, 1, 1,
2.110778, -1.082367, 1.061384, 0, 0, 0, 1, 1,
2.132243, 0.3352091, 2.775407, 0, 0, 0, 1, 1,
2.148358, -0.6233788, 1.628561, 0, 0, 0, 1, 1,
2.189937, 2.005359, -0.2256556, 0, 0, 0, 1, 1,
2.289996, 0.7138764, 1.437473, 0, 0, 0, 1, 1,
2.311526, 0.6317337, 0.6755453, 0, 0, 0, 1, 1,
2.347243, 0.3735115, 1.103742, 0, 0, 0, 1, 1,
2.41776, 1.440157, 1.029317, 1, 1, 1, 1, 1,
2.449922, -0.5638399, 1.60922, 1, 1, 1, 1, 1,
2.649899, -0.2184974, 1.516654, 1, 1, 1, 1, 1,
2.719342, -0.7569939, 2.749434, 1, 1, 1, 1, 1,
2.873328, 0.4793673, 2.133006, 1, 1, 1, 1, 1,
3.458341, 0.6304961, 1.778821, 1, 1, 1, 1, 1,
3.661789, -0.1876975, 1.424451, 1, 1, 1, 1, 1
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
var radius = 9.74672;
var distance = 34.23494;
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
mvMatrix.translate( -0.2562261, 0.3089269, 0.6459019 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.23494);
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
