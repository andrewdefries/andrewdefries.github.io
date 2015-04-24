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
-3.441464, -2.062821, -1.625257, 1, 0, 0, 1,
-3.213115, -0.3440503, -1.455242, 1, 0.007843138, 0, 1,
-2.83013, 0.1557803, -1.125507, 1, 0.01176471, 0, 1,
-2.823956, 0.01672894, -1.54915, 1, 0.01960784, 0, 1,
-2.784165, -1.073419, -3.005388, 1, 0.02352941, 0, 1,
-2.78245, 0.6670588, -0.2958014, 1, 0.03137255, 0, 1,
-2.671142, -2.003663, -1.768547, 1, 0.03529412, 0, 1,
-2.548786, -0.2301025, -2.25772, 1, 0.04313726, 0, 1,
-2.456401, 1.863779, -0.2855196, 1, 0.04705882, 0, 1,
-2.431365, 0.5515174, -0.9954478, 1, 0.05490196, 0, 1,
-2.365006, -1.985944, -3.320957, 1, 0.05882353, 0, 1,
-2.27051, -0.4926204, -2.845025, 1, 0.06666667, 0, 1,
-2.263116, -1.58346, -2.907251, 1, 0.07058824, 0, 1,
-2.23244, 0.6403645, -1.769714, 1, 0.07843138, 0, 1,
-2.226343, 0.4211906, 0.01955588, 1, 0.08235294, 0, 1,
-2.164985, 0.9054968, -0.9810314, 1, 0.09019608, 0, 1,
-2.112154, 1.256959, -1.826319, 1, 0.09411765, 0, 1,
-2.061236, -0.4704869, -0.9396541, 1, 0.1019608, 0, 1,
-2.050075, 0.5530438, -1.989393, 1, 0.1098039, 0, 1,
-2.03991, 0.1665633, -1.53367, 1, 0.1137255, 0, 1,
-1.998804, 0.4792064, -0.3818975, 1, 0.1215686, 0, 1,
-1.981481, -0.8767698, -3.793204, 1, 0.1254902, 0, 1,
-1.942786, -2.299236, -3.482108, 1, 0.1333333, 0, 1,
-1.938512, -0.2385841, -1.106477, 1, 0.1372549, 0, 1,
-1.935796, 0.8732256, -0.9155062, 1, 0.145098, 0, 1,
-1.93049, 1.107202, -0.8378422, 1, 0.1490196, 0, 1,
-1.909701, -0.05846252, -2.122344, 1, 0.1568628, 0, 1,
-1.898394, 0.9834757, -0.5845845, 1, 0.1607843, 0, 1,
-1.886868, -0.6903113, -3.10841, 1, 0.1686275, 0, 1,
-1.886261, 0.9454808, -2.078481, 1, 0.172549, 0, 1,
-1.882127, 0.8568299, -0.8950419, 1, 0.1803922, 0, 1,
-1.804585, -0.8398608, -1.220906, 1, 0.1843137, 0, 1,
-1.797754, 0.2472038, -2.207652, 1, 0.1921569, 0, 1,
-1.781637, -2.092749, -1.802541, 1, 0.1960784, 0, 1,
-1.759936, -0.5876277, -3.352838, 1, 0.2039216, 0, 1,
-1.748152, 1.819332, 0.8729171, 1, 0.2117647, 0, 1,
-1.733773, -0.1962983, -3.327823, 1, 0.2156863, 0, 1,
-1.717544, -0.6118983, -1.583371, 1, 0.2235294, 0, 1,
-1.715679, -2.028727, -1.322794, 1, 0.227451, 0, 1,
-1.691864, -1.023635, -4.727548, 1, 0.2352941, 0, 1,
-1.678006, 0.7837597, -1.529533, 1, 0.2392157, 0, 1,
-1.669086, 1.705706, -1.670658, 1, 0.2470588, 0, 1,
-1.636527, -0.425263, -0.8662958, 1, 0.2509804, 0, 1,
-1.630908, 1.619973, -0.2808441, 1, 0.2588235, 0, 1,
-1.617512, -0.8811551, -1.307635, 1, 0.2627451, 0, 1,
-1.580992, -0.5175076, -1.230414, 1, 0.2705882, 0, 1,
-1.578383, -0.3436247, -1.756368, 1, 0.2745098, 0, 1,
-1.5732, -0.4104778, -1.326557, 1, 0.282353, 0, 1,
-1.572261, -2.144377, -2.905128, 1, 0.2862745, 0, 1,
-1.565487, -2.079329, -2.533971, 1, 0.2941177, 0, 1,
-1.560417, 1.446667, 0.06202184, 1, 0.3019608, 0, 1,
-1.547514, -1.120037, -2.883361, 1, 0.3058824, 0, 1,
-1.547245, -0.2372714, -1.814149, 1, 0.3137255, 0, 1,
-1.540658, -0.3006255, -1.047063, 1, 0.3176471, 0, 1,
-1.532797, -0.2321891, -2.126311, 1, 0.3254902, 0, 1,
-1.530511, -1.215916, -2.085871, 1, 0.3294118, 0, 1,
-1.527282, 1.104318, -1.548764, 1, 0.3372549, 0, 1,
-1.501938, 0.8751763, -1.518397, 1, 0.3411765, 0, 1,
-1.476993, -0.9582849, -1.500939, 1, 0.3490196, 0, 1,
-1.457469, 0.2029865, -0.6492194, 1, 0.3529412, 0, 1,
-1.456071, -1.315058, -2.015554, 1, 0.3607843, 0, 1,
-1.455073, -0.8827399, -3.558367, 1, 0.3647059, 0, 1,
-1.432786, -3.003403, -1.778775, 1, 0.372549, 0, 1,
-1.424949, 1.259374, -2.37345, 1, 0.3764706, 0, 1,
-1.420344, -0.7666968, -1.654942, 1, 0.3843137, 0, 1,
-1.418387, -0.6702575, -1.060216, 1, 0.3882353, 0, 1,
-1.416905, -0.6749899, -2.101413, 1, 0.3960784, 0, 1,
-1.412539, -0.5828358, -2.627788, 1, 0.4039216, 0, 1,
-1.394219, 1.532099, -2.409153, 1, 0.4078431, 0, 1,
-1.385092, -0.3323202, -1.89977, 1, 0.4156863, 0, 1,
-1.378961, 0.6914122, -2.311637, 1, 0.4196078, 0, 1,
-1.37267, -1.021209, -2.417908, 1, 0.427451, 0, 1,
-1.36717, -0.01385187, -2.275665, 1, 0.4313726, 0, 1,
-1.366179, 1.548931, 1.762712, 1, 0.4392157, 0, 1,
-1.334387, 1.796967, -0.3871814, 1, 0.4431373, 0, 1,
-1.333128, -0.06591419, -1.799023, 1, 0.4509804, 0, 1,
-1.332818, -0.6339605, -1.83564, 1, 0.454902, 0, 1,
-1.320738, -0.1697768, -0.2170349, 1, 0.4627451, 0, 1,
-1.314492, -0.6377261, -2.825831, 1, 0.4666667, 0, 1,
-1.303015, 0.3206117, -2.147137, 1, 0.4745098, 0, 1,
-1.300871, -1.776738, -0.7985275, 1, 0.4784314, 0, 1,
-1.289217, 1.478247, 0.01786865, 1, 0.4862745, 0, 1,
-1.288063, -0.9135919, -1.166304, 1, 0.4901961, 0, 1,
-1.283935, -0.9101958, -3.336412, 1, 0.4980392, 0, 1,
-1.2794, -1.140345, -2.042522, 1, 0.5058824, 0, 1,
-1.278213, 0.6978636, -1.190721, 1, 0.509804, 0, 1,
-1.264325, 0.009798689, -2.104021, 1, 0.5176471, 0, 1,
-1.259808, -0.7668864, -2.979742, 1, 0.5215687, 0, 1,
-1.2541, 1.152671, -0.3316791, 1, 0.5294118, 0, 1,
-1.253962, 0.3876335, 0.1105164, 1, 0.5333334, 0, 1,
-1.249951, -1.518464, -2.548134, 1, 0.5411765, 0, 1,
-1.244308, -0.1195501, -0.3529716, 1, 0.5450981, 0, 1,
-1.235559, -0.7063189, -0.1724213, 1, 0.5529412, 0, 1,
-1.230763, -0.7852693, -0.6639774, 1, 0.5568628, 0, 1,
-1.229031, -0.3994713, -2.420979, 1, 0.5647059, 0, 1,
-1.226161, -1.23986, -2.775203, 1, 0.5686275, 0, 1,
-1.224031, 2.01877, 0.1046313, 1, 0.5764706, 0, 1,
-1.210357, -0.02319514, -2.41848, 1, 0.5803922, 0, 1,
-1.203736, 1.159588, 0.4103288, 1, 0.5882353, 0, 1,
-1.201331, -0.8268037, -1.990936, 1, 0.5921569, 0, 1,
-1.198594, -0.7844782, -2.715919, 1, 0.6, 0, 1,
-1.196681, 1.058566, -0.7530769, 1, 0.6078432, 0, 1,
-1.194375, 0.4377694, -1.682371, 1, 0.6117647, 0, 1,
-1.182111, -0.496755, -1.616589, 1, 0.6196079, 0, 1,
-1.176861, -1.05421, -2.793252, 1, 0.6235294, 0, 1,
-1.1752, 1.114754, 0.1493185, 1, 0.6313726, 0, 1,
-1.173913, -0.8973509, -3.505951, 1, 0.6352941, 0, 1,
-1.172644, -0.5770297, -3.071139, 1, 0.6431373, 0, 1,
-1.169093, -1.256318, -2.623703, 1, 0.6470588, 0, 1,
-1.168934, -2.230656, -2.10521, 1, 0.654902, 0, 1,
-1.159926, -0.4516128, -0.2063744, 1, 0.6588235, 0, 1,
-1.157334, -0.1756231, -1.605702, 1, 0.6666667, 0, 1,
-1.156639, 0.8786184, 0.2989978, 1, 0.6705883, 0, 1,
-1.148484, -1.231423, -2.406575, 1, 0.6784314, 0, 1,
-1.140987, 0.2687098, -1.574076, 1, 0.682353, 0, 1,
-1.137431, -0.4814934, -2.213282, 1, 0.6901961, 0, 1,
-1.13154, -0.9758083, -4.559515, 1, 0.6941177, 0, 1,
-1.122026, 1.046217, -0.6656471, 1, 0.7019608, 0, 1,
-1.112342, 0.2508115, -0.1460632, 1, 0.7098039, 0, 1,
-1.111413, 1.104571, -2.112861, 1, 0.7137255, 0, 1,
-1.099992, -0.7459869, -2.777567, 1, 0.7215686, 0, 1,
-1.088971, 0.9004132, -2.295918, 1, 0.7254902, 0, 1,
-1.07951, 0.2565715, -0.5795968, 1, 0.7333333, 0, 1,
-1.077084, -0.3670792, -0.567867, 1, 0.7372549, 0, 1,
-1.063279, 0.4478592, -3.640965, 1, 0.7450981, 0, 1,
-1.05641, 1.024817, -0.9450285, 1, 0.7490196, 0, 1,
-1.052247, -2.107507, -4.091646, 1, 0.7568628, 0, 1,
-1.04893, -0.1014263, -1.269151, 1, 0.7607843, 0, 1,
-1.035864, -1.128204, -1.792925, 1, 0.7686275, 0, 1,
-1.035672, 0.7758533, -2.500476, 1, 0.772549, 0, 1,
-1.034997, -2.066991, -2.492955, 1, 0.7803922, 0, 1,
-1.031306, -0.07326525, -1.152291, 1, 0.7843137, 0, 1,
-1.026595, 0.001600106, -1.193981, 1, 0.7921569, 0, 1,
-1.023058, 2.190002, 1.086891, 1, 0.7960784, 0, 1,
-1.020675, -1.182803, -1.66652, 1, 0.8039216, 0, 1,
-1.020469, -0.9425645, -1.37693, 1, 0.8117647, 0, 1,
-1.016758, 0.5795852, -1.502959, 1, 0.8156863, 0, 1,
-1.011549, -0.5667916, -3.282456, 1, 0.8235294, 0, 1,
-1.011362, 0.781744, -2.039006, 1, 0.827451, 0, 1,
-1.00765, 0.08146401, -2.936396, 1, 0.8352941, 0, 1,
-1.002082, -0.1860552, 0.03945901, 1, 0.8392157, 0, 1,
-1.00155, 0.9914303, 0.3383811, 1, 0.8470588, 0, 1,
-0.9999017, -0.1474943, -0.9833491, 1, 0.8509804, 0, 1,
-0.9985892, -0.2755267, -0.4323217, 1, 0.8588235, 0, 1,
-0.9985457, -1.185212, -3.555277, 1, 0.8627451, 0, 1,
-0.9900323, 0.1046137, -0.8472294, 1, 0.8705882, 0, 1,
-0.9862942, 0.1400665, -1.701004, 1, 0.8745098, 0, 1,
-0.9850786, 0.8456445, -0.5668489, 1, 0.8823529, 0, 1,
-0.9817111, -0.359178, -2.723993, 1, 0.8862745, 0, 1,
-0.9802768, 1.21522, -1.17274, 1, 0.8941177, 0, 1,
-0.9781268, -1.125834, -2.058934, 1, 0.8980392, 0, 1,
-0.9752507, 0.3559967, 0.01882982, 1, 0.9058824, 0, 1,
-0.9701571, 1.380593, -1.065718, 1, 0.9137255, 0, 1,
-0.9621499, -1.271048, -2.335423, 1, 0.9176471, 0, 1,
-0.9615552, 0.4152129, -1.737104, 1, 0.9254902, 0, 1,
-0.9577665, -0.6490016, -1.275886, 1, 0.9294118, 0, 1,
-0.9571605, 0.7614188, -2.349158, 1, 0.9372549, 0, 1,
-0.9543566, 0.1719236, -0.1423946, 1, 0.9411765, 0, 1,
-0.9513604, -1.902264, -2.764036, 1, 0.9490196, 0, 1,
-0.9486412, 0.5637257, -0.4083281, 1, 0.9529412, 0, 1,
-0.9470334, -1.560659, -2.144995, 1, 0.9607843, 0, 1,
-0.946171, 0.5887954, -0.5405102, 1, 0.9647059, 0, 1,
-0.9439871, -0.3944304, -2.469425, 1, 0.972549, 0, 1,
-0.9410158, 0.1219153, -0.7858965, 1, 0.9764706, 0, 1,
-0.9404538, -0.928827, -2.052042, 1, 0.9843137, 0, 1,
-0.938802, -0.07314546, -3.097644, 1, 0.9882353, 0, 1,
-0.9298393, -0.9436729, -1.830799, 1, 0.9960784, 0, 1,
-0.9226699, -0.005638279, -2.042806, 0.9960784, 1, 0, 1,
-0.9225909, 0.7000248, -1.315824, 0.9921569, 1, 0, 1,
-0.9220816, -0.07529027, -2.441323, 0.9843137, 1, 0, 1,
-0.9217495, 0.8188834, 0.2128809, 0.9803922, 1, 0, 1,
-0.920673, 0.8402468, -0.9008809, 0.972549, 1, 0, 1,
-0.9202458, 0.4765099, -1.009564, 0.9686275, 1, 0, 1,
-0.906647, -0.1206047, -2.318463, 0.9607843, 1, 0, 1,
-0.9049675, 1.413679, -2.308798, 0.9568627, 1, 0, 1,
-0.896135, -1.206362, -2.886512, 0.9490196, 1, 0, 1,
-0.8949203, -0.5380667, -2.763747, 0.945098, 1, 0, 1,
-0.8926229, 2.097615, -0.5460262, 0.9372549, 1, 0, 1,
-0.8820279, 1.490777, 0.3179086, 0.9333333, 1, 0, 1,
-0.8765697, 1.123418, -1.932662, 0.9254902, 1, 0, 1,
-0.8728014, 0.2421065, -1.139078, 0.9215686, 1, 0, 1,
-0.8720237, -0.1511718, -2.298755, 0.9137255, 1, 0, 1,
-0.8714096, -0.06390569, -1.423524, 0.9098039, 1, 0, 1,
-0.8669756, 0.2394307, -4.351617, 0.9019608, 1, 0, 1,
-0.8577331, 0.9550539, -2.142166, 0.8941177, 1, 0, 1,
-0.8565439, 1.021717, -0.5558999, 0.8901961, 1, 0, 1,
-0.8550705, 0.2970576, -1.639002, 0.8823529, 1, 0, 1,
-0.8480203, -0.8169538, -2.506365, 0.8784314, 1, 0, 1,
-0.846418, 1.019163, -0.5742807, 0.8705882, 1, 0, 1,
-0.8441452, -0.6772694, -0.4794345, 0.8666667, 1, 0, 1,
-0.8425678, -0.3246989, -1.073174, 0.8588235, 1, 0, 1,
-0.8391383, 0.08414972, -0.2325015, 0.854902, 1, 0, 1,
-0.838933, -0.04464316, -1.48518, 0.8470588, 1, 0, 1,
-0.8358858, 0.4748628, -2.908025, 0.8431373, 1, 0, 1,
-0.8320484, 1.051733, -0.3537643, 0.8352941, 1, 0, 1,
-0.8223296, -1.464183, -3.620157, 0.8313726, 1, 0, 1,
-0.8204817, 1.136331, -1.957242, 0.8235294, 1, 0, 1,
-0.8188196, 0.03221362, -2.183344, 0.8196079, 1, 0, 1,
-0.8186803, 0.4714622, 0.7869236, 0.8117647, 1, 0, 1,
-0.8092684, 0.3773224, -1.767781, 0.8078431, 1, 0, 1,
-0.8061032, 1.690973, -0.4019693, 0.8, 1, 0, 1,
-0.8045498, -0.6165472, -1.484148, 0.7921569, 1, 0, 1,
-0.8043666, 0.011018, -1.897797, 0.7882353, 1, 0, 1,
-0.8000793, -0.6829905, -1.222841, 0.7803922, 1, 0, 1,
-0.7977631, -0.393389, -1.122429, 0.7764706, 1, 0, 1,
-0.7921781, -1.334414, -2.46322, 0.7686275, 1, 0, 1,
-0.7871957, -0.1192991, -1.871047, 0.7647059, 1, 0, 1,
-0.7851979, 1.3116, -0.01327831, 0.7568628, 1, 0, 1,
-0.7847354, 1.101878, -2.490582, 0.7529412, 1, 0, 1,
-0.7819855, -1.113334, -1.888724, 0.7450981, 1, 0, 1,
-0.7803059, -0.213846, -2.866594, 0.7411765, 1, 0, 1,
-0.779967, 1.753137, -4.239795, 0.7333333, 1, 0, 1,
-0.776149, 0.05697868, -1.367511, 0.7294118, 1, 0, 1,
-0.7736977, 0.151392, -1.6096, 0.7215686, 1, 0, 1,
-0.7719263, -0.5247183, -2.621557, 0.7176471, 1, 0, 1,
-0.7703347, 0.9318161, 1.492507, 0.7098039, 1, 0, 1,
-0.7656738, -1.346552, -3.475258, 0.7058824, 1, 0, 1,
-0.7551672, 0.446429, 0.2640692, 0.6980392, 1, 0, 1,
-0.7547155, -0.7554111, -1.819052, 0.6901961, 1, 0, 1,
-0.7446812, -0.06221871, -2.014176, 0.6862745, 1, 0, 1,
-0.741591, -1.129704, -3.053683, 0.6784314, 1, 0, 1,
-0.7364946, 0.9575419, -1.001099, 0.6745098, 1, 0, 1,
-0.7352689, 0.6561307, -0.7170459, 0.6666667, 1, 0, 1,
-0.7322919, -0.02281528, -2.294193, 0.6627451, 1, 0, 1,
-0.7291256, 0.4049987, -1.699601, 0.654902, 1, 0, 1,
-0.7259451, -1.652313, -2.813391, 0.6509804, 1, 0, 1,
-0.7235901, 0.02690724, -2.994088, 0.6431373, 1, 0, 1,
-0.7174144, 0.9076238, -2.557525, 0.6392157, 1, 0, 1,
-0.7161259, 0.5823259, -0.6096043, 0.6313726, 1, 0, 1,
-0.7126379, -0.8377705, -2.182358, 0.627451, 1, 0, 1,
-0.7125889, -0.7700686, -1.143148, 0.6196079, 1, 0, 1,
-0.7115276, -1.29505, -2.699599, 0.6156863, 1, 0, 1,
-0.6990347, -0.7548851, -3.826799, 0.6078432, 1, 0, 1,
-0.6986213, -1.382418, -2.80414, 0.6039216, 1, 0, 1,
-0.6966061, 0.9374196, -1.572242, 0.5960785, 1, 0, 1,
-0.6937822, -1.160617, -2.031878, 0.5882353, 1, 0, 1,
-0.6926628, 0.3510846, 1.478212, 0.5843138, 1, 0, 1,
-0.6874723, 0.3539169, -1.934942, 0.5764706, 1, 0, 1,
-0.6872167, 1.063646, -2.06407, 0.572549, 1, 0, 1,
-0.684401, 0.8080382, -0.9175953, 0.5647059, 1, 0, 1,
-0.6842605, -1.731416, -2.741046, 0.5607843, 1, 0, 1,
-0.683516, 0.2207532, -2.329706, 0.5529412, 1, 0, 1,
-0.6769033, 0.3359234, -1.597899, 0.5490196, 1, 0, 1,
-0.6726227, -1.376062, -1.530359, 0.5411765, 1, 0, 1,
-0.6682122, 0.4061941, -0.549597, 0.5372549, 1, 0, 1,
-0.6675314, 1.477106, -0.6847755, 0.5294118, 1, 0, 1,
-0.6651528, -0.6023192, -2.885754, 0.5254902, 1, 0, 1,
-0.6617309, 0.6997276, -0.2221024, 0.5176471, 1, 0, 1,
-0.6610934, -0.2923889, -1.024158, 0.5137255, 1, 0, 1,
-0.6595185, 0.374913, -2.89133, 0.5058824, 1, 0, 1,
-0.6593254, -1.987162, -1.958442, 0.5019608, 1, 0, 1,
-0.6586543, 0.7947553, -1.686168, 0.4941176, 1, 0, 1,
-0.6553869, 0.9302339, -2.008696, 0.4862745, 1, 0, 1,
-0.6498948, -1.512479, -4.135408, 0.4823529, 1, 0, 1,
-0.6400197, 0.6352883, 0.1274479, 0.4745098, 1, 0, 1,
-0.6353891, -0.7456399, -1.418389, 0.4705882, 1, 0, 1,
-0.6353603, -1.103305, -2.383264, 0.4627451, 1, 0, 1,
-0.6323271, -1.644148, -1.448692, 0.4588235, 1, 0, 1,
-0.6296141, -0.7434829, -2.709208, 0.4509804, 1, 0, 1,
-0.6240883, -0.006172708, -2.802079, 0.4470588, 1, 0, 1,
-0.6215813, -0.6400953, -2.921608, 0.4392157, 1, 0, 1,
-0.6200199, 0.3011686, -1.223624, 0.4352941, 1, 0, 1,
-0.6194827, -0.06902128, -0.4908518, 0.427451, 1, 0, 1,
-0.61218, -0.8938516, -2.431204, 0.4235294, 1, 0, 1,
-0.6107753, 0.09401558, -0.7053506, 0.4156863, 1, 0, 1,
-0.6063079, -0.1068875, -3.916484, 0.4117647, 1, 0, 1,
-0.6027235, -0.8995615, -1.908229, 0.4039216, 1, 0, 1,
-0.599861, 0.1884967, -1.697139, 0.3960784, 1, 0, 1,
-0.5975767, -0.8633258, -3.713854, 0.3921569, 1, 0, 1,
-0.5939636, 0.9907807, -1.815476, 0.3843137, 1, 0, 1,
-0.5907139, -0.7474393, -1.784183, 0.3803922, 1, 0, 1,
-0.5896815, -0.3916681, -0.5725415, 0.372549, 1, 0, 1,
-0.5895023, -0.8784546, -2.160346, 0.3686275, 1, 0, 1,
-0.5877655, -0.1646038, -1.785316, 0.3607843, 1, 0, 1,
-0.5807168, -1.434433, -3.087954, 0.3568628, 1, 0, 1,
-0.5803692, 0.03574919, -1.848041, 0.3490196, 1, 0, 1,
-0.576793, -1.520517, -1.176189, 0.345098, 1, 0, 1,
-0.5718473, 0.311815, -0.05025789, 0.3372549, 1, 0, 1,
-0.5674739, -0.5426076, -1.816658, 0.3333333, 1, 0, 1,
-0.5672664, 0.09018611, -1.594713, 0.3254902, 1, 0, 1,
-0.5643203, 1.684631, 0.221505, 0.3215686, 1, 0, 1,
-0.5638624, 0.6688589, 0.09860941, 0.3137255, 1, 0, 1,
-0.5600602, -0.9233648, -2.169045, 0.3098039, 1, 0, 1,
-0.5550746, -0.05730635, -1.156375, 0.3019608, 1, 0, 1,
-0.5544874, -0.6018732, -3.85006, 0.2941177, 1, 0, 1,
-0.5513838, -0.7888231, -1.697826, 0.2901961, 1, 0, 1,
-0.55005, 0.04126677, -2.362057, 0.282353, 1, 0, 1,
-0.53747, -0.4548716, 0.2346228, 0.2784314, 1, 0, 1,
-0.5352094, -0.938182, -3.432774, 0.2705882, 1, 0, 1,
-0.532557, 0.209046, -0.6272739, 0.2666667, 1, 0, 1,
-0.5316088, 1.036814, 1.381384, 0.2588235, 1, 0, 1,
-0.529857, -0.3071175, -1.43487, 0.254902, 1, 0, 1,
-0.5277821, 0.2891556, -1.391286, 0.2470588, 1, 0, 1,
-0.527572, -0.2453806, -2.744098, 0.2431373, 1, 0, 1,
-0.5251848, 0.3892289, 0.6698781, 0.2352941, 1, 0, 1,
-0.5153865, -1.487684, -2.814211, 0.2313726, 1, 0, 1,
-0.5150748, 0.8032683, 0.4472044, 0.2235294, 1, 0, 1,
-0.5115105, 0.1248627, -2.897811, 0.2196078, 1, 0, 1,
-0.5077597, 0.6700085, -1.791341, 0.2117647, 1, 0, 1,
-0.5072684, -1.086771, -2.739063, 0.2078431, 1, 0, 1,
-0.506285, -1.884269, -1.820094, 0.2, 1, 0, 1,
-0.503908, -1.103258, -0.553742, 0.1921569, 1, 0, 1,
-0.5015706, -1.87842, -3.94624, 0.1882353, 1, 0, 1,
-0.5008337, 0.5729412, -0.5712779, 0.1803922, 1, 0, 1,
-0.497711, 0.7820556, -0.8839819, 0.1764706, 1, 0, 1,
-0.493794, -0.06935118, -1.302897, 0.1686275, 1, 0, 1,
-0.4894278, 0.5534918, 0.4248685, 0.1647059, 1, 0, 1,
-0.4861564, -0.1575685, -0.7502176, 0.1568628, 1, 0, 1,
-0.4741103, 0.759721, -1.553396, 0.1529412, 1, 0, 1,
-0.4708856, 0.1700716, -0.6247975, 0.145098, 1, 0, 1,
-0.4700451, -0.2788024, -1.503848, 0.1411765, 1, 0, 1,
-0.4695654, 0.1780989, -1.241182, 0.1333333, 1, 0, 1,
-0.4632148, 2.67175, -0.06275029, 0.1294118, 1, 0, 1,
-0.4557411, 0.5775289, -0.9175594, 0.1215686, 1, 0, 1,
-0.4465238, 1.673355, -0.4319158, 0.1176471, 1, 0, 1,
-0.443678, 0.9210194, 0.557084, 0.1098039, 1, 0, 1,
-0.4434064, -0.1778095, -1.853316, 0.1058824, 1, 0, 1,
-0.4405989, -0.4080396, -3.149263, 0.09803922, 1, 0, 1,
-0.4389431, 1.484164, -1.239269, 0.09019608, 1, 0, 1,
-0.4368344, 1.514998, -1.22586, 0.08627451, 1, 0, 1,
-0.4338505, -0.1370322, -0.08309886, 0.07843138, 1, 0, 1,
-0.4321063, 1.054537, 0.608776, 0.07450981, 1, 0, 1,
-0.4316235, -0.04898874, -2.546045, 0.06666667, 1, 0, 1,
-0.4295801, 0.09822119, -2.075247, 0.0627451, 1, 0, 1,
-0.4217904, -1.215694, -2.503285, 0.05490196, 1, 0, 1,
-0.4188898, -0.4014563, -3.027375, 0.05098039, 1, 0, 1,
-0.417833, -2.268457, -2.70463, 0.04313726, 1, 0, 1,
-0.4170314, 1.023704, 1.822816, 0.03921569, 1, 0, 1,
-0.4137992, -0.4293857, -3.033124, 0.03137255, 1, 0, 1,
-0.4128495, -0.3958572, -0.7291118, 0.02745098, 1, 0, 1,
-0.4124009, 0.844435, 1.491132, 0.01960784, 1, 0, 1,
-0.4101225, -1.003275, -4.134455, 0.01568628, 1, 0, 1,
-0.405545, 0.669506, 0.31512, 0.007843138, 1, 0, 1,
-0.4049661, 0.7206116, -0.2921271, 0.003921569, 1, 0, 1,
-0.4042502, 1.052939, 0.653219, 0, 1, 0.003921569, 1,
-0.3975222, -0.1894828, -3.612697, 0, 1, 0.01176471, 1,
-0.3962, 1.087017, -1.440879, 0, 1, 0.01568628, 1,
-0.3933219, -0.5495926, -3.363148, 0, 1, 0.02352941, 1,
-0.3905838, -0.5801544, -3.974236, 0, 1, 0.02745098, 1,
-0.3853462, 0.05313161, -0.218202, 0, 1, 0.03529412, 1,
-0.3811263, 0.6069826, -1.720617, 0, 1, 0.03921569, 1,
-0.3793759, 0.006457302, -2.040672, 0, 1, 0.04705882, 1,
-0.3725547, -0.6744202, -2.477911, 0, 1, 0.05098039, 1,
-0.3708225, 0.1088561, -3.724112, 0, 1, 0.05882353, 1,
-0.3700959, -0.9358415, -1.919013, 0, 1, 0.0627451, 1,
-0.3693261, -0.7963412, -3.951593, 0, 1, 0.07058824, 1,
-0.369303, -0.9276524, -2.59008, 0, 1, 0.07450981, 1,
-0.3658113, 1.409778, -0.3098803, 0, 1, 0.08235294, 1,
-0.3583119, 0.829714, -1.854075, 0, 1, 0.08627451, 1,
-0.3560951, 0.6066646, -0.5900527, 0, 1, 0.09411765, 1,
-0.3470449, 0.7213303, 0.1266371, 0, 1, 0.1019608, 1,
-0.3449555, 1.275671, -0.5499059, 0, 1, 0.1058824, 1,
-0.3438592, -0.2868163, -3.958098, 0, 1, 0.1137255, 1,
-0.341621, 1.84642, 0.6007733, 0, 1, 0.1176471, 1,
-0.3414434, -0.9638837, -2.693561, 0, 1, 0.1254902, 1,
-0.3406247, 0.6329264, -0.2335281, 0, 1, 0.1294118, 1,
-0.3335903, -1.603648, -1.329258, 0, 1, 0.1372549, 1,
-0.3331363, -2.447187, -1.909734, 0, 1, 0.1411765, 1,
-0.3284133, -0.5509682, -2.929103, 0, 1, 0.1490196, 1,
-0.3271704, -0.4318109, -2.913801, 0, 1, 0.1529412, 1,
-0.3170873, 0.01991059, -0.9401928, 0, 1, 0.1607843, 1,
-0.3138258, 0.09256809, -1.401359, 0, 1, 0.1647059, 1,
-0.3128273, -1.355748, -2.069732, 0, 1, 0.172549, 1,
-0.3062407, -0.7145845, -2.692196, 0, 1, 0.1764706, 1,
-0.3055085, 0.439263, -0.8894328, 0, 1, 0.1843137, 1,
-0.3019985, 0.2719221, -0.5819188, 0, 1, 0.1882353, 1,
-0.3011414, -0.2457634, -1.434813, 0, 1, 0.1960784, 1,
-0.2970943, 0.2390259, -0.2718053, 0, 1, 0.2039216, 1,
-0.2911821, 0.9390837, -0.4192151, 0, 1, 0.2078431, 1,
-0.2891935, -0.8860341, -1.500023, 0, 1, 0.2156863, 1,
-0.2830696, -0.7454994, -4.545149, 0, 1, 0.2196078, 1,
-0.2827213, 0.01439335, -1.062086, 0, 1, 0.227451, 1,
-0.2817618, 0.4443394, 0.1903217, 0, 1, 0.2313726, 1,
-0.2792813, 0.5594299, 0.01220961, 0, 1, 0.2392157, 1,
-0.274477, -1.543299, -3.977536, 0, 1, 0.2431373, 1,
-0.2733752, 0.4725558, 0.6117998, 0, 1, 0.2509804, 1,
-0.269265, 0.4987103, -0.2388927, 0, 1, 0.254902, 1,
-0.2682998, -0.05775312, -2.044093, 0, 1, 0.2627451, 1,
-0.2678205, 0.3427867, -0.0001040356, 0, 1, 0.2666667, 1,
-0.2656578, 1.720146, -0.6097659, 0, 1, 0.2745098, 1,
-0.2613494, -1.403748, -4.365328, 0, 1, 0.2784314, 1,
-0.2592559, -0.0919887, -1.738621, 0, 1, 0.2862745, 1,
-0.2537006, 0.3421576, 0.2099086, 0, 1, 0.2901961, 1,
-0.2524263, -1.042175, -2.988125, 0, 1, 0.2980392, 1,
-0.2507859, -0.606447, -3.792494, 0, 1, 0.3058824, 1,
-0.2498207, 1.190456, 0.8792226, 0, 1, 0.3098039, 1,
-0.2492799, 1.693026, 1.642726, 0, 1, 0.3176471, 1,
-0.2490268, 1.639263, 1.739348, 0, 1, 0.3215686, 1,
-0.2410518, -1.624247, -2.240446, 0, 1, 0.3294118, 1,
-0.2366229, -0.435872, -3.035241, 0, 1, 0.3333333, 1,
-0.2352109, 1.056194, -0.4285519, 0, 1, 0.3411765, 1,
-0.2316422, -0.2496912, -1.742542, 0, 1, 0.345098, 1,
-0.2299758, -0.9229416, -1.78449, 0, 1, 0.3529412, 1,
-0.2291852, 0.9626243, -0.7178673, 0, 1, 0.3568628, 1,
-0.2288417, 1.69897, -0.1946422, 0, 1, 0.3647059, 1,
-0.2272485, -0.8514799, -3.993735, 0, 1, 0.3686275, 1,
-0.2260145, -0.4547971, -3.356083, 0, 1, 0.3764706, 1,
-0.2245912, 0.8711232, -0.6756778, 0, 1, 0.3803922, 1,
-0.2235174, 0.7094781, -2.075632, 0, 1, 0.3882353, 1,
-0.216593, -1.163064, -2.349953, 0, 1, 0.3921569, 1,
-0.2127041, -0.6142562, -4.2405, 0, 1, 0.4, 1,
-0.2000795, -0.9478456, -2.236994, 0, 1, 0.4078431, 1,
-0.1985829, -0.2006495, -4.520567, 0, 1, 0.4117647, 1,
-0.197765, -0.8037738, -3.89011, 0, 1, 0.4196078, 1,
-0.195636, 0.4048603, -0.278633, 0, 1, 0.4235294, 1,
-0.186936, -1.015485, -3.023115, 0, 1, 0.4313726, 1,
-0.1863456, 0.5929927, 0.04645799, 0, 1, 0.4352941, 1,
-0.185966, -0.06344766, -3.088005, 0, 1, 0.4431373, 1,
-0.1857142, 0.4546103, -1.050514, 0, 1, 0.4470588, 1,
-0.1849449, -0.6636467, -1.863221, 0, 1, 0.454902, 1,
-0.1812111, 1.331919, 0.2562382, 0, 1, 0.4588235, 1,
-0.1767031, 0.0538743, -0.8958377, 0, 1, 0.4666667, 1,
-0.1757144, 0.3340781, -0.01759884, 0, 1, 0.4705882, 1,
-0.1732951, -1.240406, -2.983253, 0, 1, 0.4784314, 1,
-0.1715231, 0.9322357, 1.877705, 0, 1, 0.4823529, 1,
-0.1715105, -0.4608995, -1.133856, 0, 1, 0.4901961, 1,
-0.1701394, -0.3344606, -1.424042, 0, 1, 0.4941176, 1,
-0.1691613, -0.2297523, -2.0314, 0, 1, 0.5019608, 1,
-0.1614465, 0.4986764, -0.8330109, 0, 1, 0.509804, 1,
-0.1588108, -0.1777082, -2.289273, 0, 1, 0.5137255, 1,
-0.1558933, -1.682084, -2.336854, 0, 1, 0.5215687, 1,
-0.1548196, 0.7415155, -0.822484, 0, 1, 0.5254902, 1,
-0.1496201, -0.9302167, -3.960418, 0, 1, 0.5333334, 1,
-0.1491923, 0.2915381, -2.666592, 0, 1, 0.5372549, 1,
-0.1467469, -0.9694295, -3.149434, 0, 1, 0.5450981, 1,
-0.1450361, 0.1752339, 1.1147, 0, 1, 0.5490196, 1,
-0.143704, -1.104895, -1.760074, 0, 1, 0.5568628, 1,
-0.14358, -0.687442, -3.091718, 0, 1, 0.5607843, 1,
-0.1357515, 0.9917744, -0.1330121, 0, 1, 0.5686275, 1,
-0.1335229, -2.034321, -5.280258, 0, 1, 0.572549, 1,
-0.1290402, -0.359136, -4.054596, 0, 1, 0.5803922, 1,
-0.1270646, -0.458418, -3.127167, 0, 1, 0.5843138, 1,
-0.12126, 0.7045862, 0.4307561, 0, 1, 0.5921569, 1,
-0.1212277, 0.04597323, -2.682573, 0, 1, 0.5960785, 1,
-0.1210143, -0.7982755, -2.674949, 0, 1, 0.6039216, 1,
-0.1205012, 0.3539718, -0.7161388, 0, 1, 0.6117647, 1,
-0.1204737, -0.640225, -3.871434, 0, 1, 0.6156863, 1,
-0.1200797, 0.5199421, 0.6603777, 0, 1, 0.6235294, 1,
-0.119753, -0.2576506, -3.042759, 0, 1, 0.627451, 1,
-0.1142749, 2.359441, -0.3195633, 0, 1, 0.6352941, 1,
-0.1134899, 0.3802419, 0.6317632, 0, 1, 0.6392157, 1,
-0.1102088, 1.875653, -0.4939764, 0, 1, 0.6470588, 1,
-0.1047412, -0.137198, -3.201218, 0, 1, 0.6509804, 1,
-0.1038222, 0.5582898, 1.686763, 0, 1, 0.6588235, 1,
-0.1021298, -0.4722163, -4.995422, 0, 1, 0.6627451, 1,
-0.09762654, -0.2827274, -4.004946, 0, 1, 0.6705883, 1,
-0.09562071, 0.1651343, -2.072106, 0, 1, 0.6745098, 1,
-0.09469926, -1.780681, -1.770215, 0, 1, 0.682353, 1,
-0.09393293, 0.8424738, -1.516472, 0, 1, 0.6862745, 1,
-0.09075634, -0.6093367, -2.237217, 0, 1, 0.6941177, 1,
-0.0898507, 0.7309753, 0.8887794, 0, 1, 0.7019608, 1,
-0.08969613, -0.7720215, -1.860649, 0, 1, 0.7058824, 1,
-0.08955099, -0.6544436, -3.673241, 0, 1, 0.7137255, 1,
-0.079603, 0.745535, 0.8804466, 0, 1, 0.7176471, 1,
-0.07644832, 1.116649, 0.5978578, 0, 1, 0.7254902, 1,
-0.07567255, -0.6908618, -4.685685, 0, 1, 0.7294118, 1,
-0.07553931, 0.1253496, -1.407242, 0, 1, 0.7372549, 1,
-0.07493813, 0.2028595, -1.270318, 0, 1, 0.7411765, 1,
-0.07468522, 1.26452, -0.2229061, 0, 1, 0.7490196, 1,
-0.07077283, 1.45986, 2.188787, 0, 1, 0.7529412, 1,
-0.0704423, -0.570129, -2.699941, 0, 1, 0.7607843, 1,
-0.06960981, 0.322056, 0.6247749, 0, 1, 0.7647059, 1,
-0.06795886, 0.3866808, -0.2295563, 0, 1, 0.772549, 1,
-0.06757735, -0.527912, -3.433243, 0, 1, 0.7764706, 1,
-0.06654234, -0.5301747, -2.281278, 0, 1, 0.7843137, 1,
-0.06628597, -0.8394615, -4.091127, 0, 1, 0.7882353, 1,
-0.06545904, 0.666463, -0.5063033, 0, 1, 0.7960784, 1,
-0.06409377, -0.9193968, -2.834891, 0, 1, 0.8039216, 1,
-0.05976304, 0.5540422, 0.5476882, 0, 1, 0.8078431, 1,
-0.05843446, 0.07301152, 1.292211, 0, 1, 0.8156863, 1,
-0.05833708, -0.2953359, -3.419493, 0, 1, 0.8196079, 1,
-0.05820984, -1.375534, -1.919964, 0, 1, 0.827451, 1,
-0.05732659, -0.250591, -0.07601233, 0, 1, 0.8313726, 1,
-0.05351232, 0.7149101, -0.6831726, 0, 1, 0.8392157, 1,
-0.05293682, -0.7962657, -2.222361, 0, 1, 0.8431373, 1,
-0.04157105, -0.4874703, -4.036309, 0, 1, 0.8509804, 1,
-0.03863478, 0.3670857, 0.111777, 0, 1, 0.854902, 1,
-0.03582526, 1.065211, 1.80277, 0, 1, 0.8627451, 1,
-0.02617271, 0.3828731, 0.2105844, 0, 1, 0.8666667, 1,
-0.02451505, -1.154267, -3.748084, 0, 1, 0.8745098, 1,
-0.0189235, 0.1893961, -0.2144293, 0, 1, 0.8784314, 1,
-0.01334301, 0.5488498, 2.173856, 0, 1, 0.8862745, 1,
-0.0105966, -0.7205089, -4.75561, 0, 1, 0.8901961, 1,
-0.005455167, 1.078316, -0.4102192, 0, 1, 0.8980392, 1,
-0.000916124, -0.8027018, -2.4593, 0, 1, 0.9058824, 1,
-0.0001078722, -0.2315917, -3.643241, 0, 1, 0.9098039, 1,
0.001930783, 0.03821201, 0.2815532, 0, 1, 0.9176471, 1,
0.00752582, -0.03389931, 4.407413, 0, 1, 0.9215686, 1,
0.01061682, 1.334312, -1.105474, 0, 1, 0.9294118, 1,
0.01266871, 0.1921048, -0.1088902, 0, 1, 0.9333333, 1,
0.01620867, -0.162679, 3.207032, 0, 1, 0.9411765, 1,
0.01755068, -2.636415, 2.804423, 0, 1, 0.945098, 1,
0.01884737, -0.3719754, 2.312521, 0, 1, 0.9529412, 1,
0.0197636, 0.06543436, 1.24673, 0, 1, 0.9568627, 1,
0.02158134, 2.079931, -0.4283236, 0, 1, 0.9647059, 1,
0.02507395, -0.03906506, 1.693096, 0, 1, 0.9686275, 1,
0.02675083, 0.9001384, 0.6663294, 0, 1, 0.9764706, 1,
0.03042802, -1.053202, 4.455945, 0, 1, 0.9803922, 1,
0.03103294, -2.012414, 1.709036, 0, 1, 0.9882353, 1,
0.03387637, 0.9849218, 0.690049, 0, 1, 0.9921569, 1,
0.03565113, 0.6703905, 1.149966, 0, 1, 1, 1,
0.03691908, -0.4268968, 3.74009, 0, 0.9921569, 1, 1,
0.0376415, -0.4786702, 2.484157, 0, 0.9882353, 1, 1,
0.03773544, 0.7446803, -1.2696, 0, 0.9803922, 1, 1,
0.03827596, -1.179868, 3.936928, 0, 0.9764706, 1, 1,
0.03918563, -0.3644069, 2.356858, 0, 0.9686275, 1, 1,
0.04286982, -0.8167927, 5.464203, 0, 0.9647059, 1, 1,
0.04407215, 0.5624357, -0.0119431, 0, 0.9568627, 1, 1,
0.04562423, 1.005943, -0.2054569, 0, 0.9529412, 1, 1,
0.04816006, -0.3987297, 1.699869, 0, 0.945098, 1, 1,
0.04905148, -1.223173, 4.491585, 0, 0.9411765, 1, 1,
0.05323666, -1.145079, 2.959502, 0, 0.9333333, 1, 1,
0.05460468, -0.4857894, 3.261782, 0, 0.9294118, 1, 1,
0.06586925, 1.173361, 0.3203236, 0, 0.9215686, 1, 1,
0.06631931, -2.182048, 2.964886, 0, 0.9176471, 1, 1,
0.06662741, -0.2990913, 1.066094, 0, 0.9098039, 1, 1,
0.06885228, 1.188509, 0.8132182, 0, 0.9058824, 1, 1,
0.06908493, 1.106804, -1.509916, 0, 0.8980392, 1, 1,
0.08025316, 1.266055, -1.033975, 0, 0.8901961, 1, 1,
0.08443557, -1.166515, 4.0681, 0, 0.8862745, 1, 1,
0.08455256, -0.6061059, 1.086715, 0, 0.8784314, 1, 1,
0.08457961, -1.346774, 2.422467, 0, 0.8745098, 1, 1,
0.08924302, -1.979708, 3.03101, 0, 0.8666667, 1, 1,
0.09460759, 1.631023, -0.1633897, 0, 0.8627451, 1, 1,
0.1020683, 0.647015, 0.8493603, 0, 0.854902, 1, 1,
0.1060125, -0.1614858, 3.531494, 0, 0.8509804, 1, 1,
0.1109374, -1.592576, 4.566929, 0, 0.8431373, 1, 1,
0.1134225, 1.29688, 1.442688, 0, 0.8392157, 1, 1,
0.1154228, -0.08390982, 1.861016, 0, 0.8313726, 1, 1,
0.1162222, -0.731402, 3.354718, 0, 0.827451, 1, 1,
0.1166619, 1.045288, 0.1023949, 0, 0.8196079, 1, 1,
0.1189017, 0.8302336, -0.9000896, 0, 0.8156863, 1, 1,
0.1193675, 0.02934778, -0.9421933, 0, 0.8078431, 1, 1,
0.1215532, -0.8764947, 4.208382, 0, 0.8039216, 1, 1,
0.1233334, 1.128363, 1.363379, 0, 0.7960784, 1, 1,
0.1242226, -0.6771482, 2.87293, 0, 0.7882353, 1, 1,
0.1269681, -0.6148708, 2.025359, 0, 0.7843137, 1, 1,
0.1271371, -1.677545, 1.306954, 0, 0.7764706, 1, 1,
0.1350787, 0.2480218, 0.70467, 0, 0.772549, 1, 1,
0.1375592, -1.201947, 4.294857, 0, 0.7647059, 1, 1,
0.1406932, 0.407476, -0.1569026, 0, 0.7607843, 1, 1,
0.1437869, -0.2529851, 2.278924, 0, 0.7529412, 1, 1,
0.1452662, -2.244538, 3.833493, 0, 0.7490196, 1, 1,
0.1494921, 0.7782705, 0.7216312, 0, 0.7411765, 1, 1,
0.1495099, -0.1031733, 0.4219592, 0, 0.7372549, 1, 1,
0.1550083, 0.812259, -0.2937221, 0, 0.7294118, 1, 1,
0.1584116, 0.1436535, 1.826713, 0, 0.7254902, 1, 1,
0.1621605, -1.053135, 4.621287, 0, 0.7176471, 1, 1,
0.1638656, 0.2803836, 1.696831, 0, 0.7137255, 1, 1,
0.1686747, 1.279626, 0.6237502, 0, 0.7058824, 1, 1,
0.1724432, -1.121486, 1.816702, 0, 0.6980392, 1, 1,
0.1782187, -0.0189014, 1.509577, 0, 0.6941177, 1, 1,
0.1804668, 1.565661, 1.015173, 0, 0.6862745, 1, 1,
0.1810368, 0.04517791, 2.373159, 0, 0.682353, 1, 1,
0.1821421, -2.142934, 3.955662, 0, 0.6745098, 1, 1,
0.1835674, -0.1805795, 2.288481, 0, 0.6705883, 1, 1,
0.1896696, -1.110027, 1.231235, 0, 0.6627451, 1, 1,
0.1912362, 0.3843213, -1.342014, 0, 0.6588235, 1, 1,
0.1919933, 0.3898368, 0.8931046, 0, 0.6509804, 1, 1,
0.1925179, 1.34915, 0.2879668, 0, 0.6470588, 1, 1,
0.1933246, -0.8349378, 2.799756, 0, 0.6392157, 1, 1,
0.1946583, 1.570882, 0.6277609, 0, 0.6352941, 1, 1,
0.2033545, 0.2956301, 0.7083118, 0, 0.627451, 1, 1,
0.2038982, 0.3886133, 1.991023, 0, 0.6235294, 1, 1,
0.2086594, 0.5252583, 0.3886387, 0, 0.6156863, 1, 1,
0.2111391, 0.3194308, 0.03139258, 0, 0.6117647, 1, 1,
0.2125435, 0.910178, 0.8551955, 0, 0.6039216, 1, 1,
0.212594, -0.9355377, 2.435704, 0, 0.5960785, 1, 1,
0.2163168, 1.121959, -0.3204083, 0, 0.5921569, 1, 1,
0.2181642, 0.6484947, -1.114181, 0, 0.5843138, 1, 1,
0.2246965, -0.3393996, 3.027946, 0, 0.5803922, 1, 1,
0.2259837, -0.3310862, 0.908964, 0, 0.572549, 1, 1,
0.229946, 0.1867868, 0.835586, 0, 0.5686275, 1, 1,
0.2319456, 1.838617, -0.4488127, 0, 0.5607843, 1, 1,
0.2321679, -1.197573, 2.862117, 0, 0.5568628, 1, 1,
0.2328172, -1.399578, 2.492667, 0, 0.5490196, 1, 1,
0.2369752, 0.8749287, 0.8751404, 0, 0.5450981, 1, 1,
0.2370082, 0.3232418, 1.586304, 0, 0.5372549, 1, 1,
0.2380199, 0.1119146, -1.858844, 0, 0.5333334, 1, 1,
0.2390299, 1.817883, 0.9815753, 0, 0.5254902, 1, 1,
0.2413358, 1.154852, -0.2498856, 0, 0.5215687, 1, 1,
0.2422144, -1.318945, 3.945523, 0, 0.5137255, 1, 1,
0.2433293, 1.230666, 0.6493928, 0, 0.509804, 1, 1,
0.2442798, -0.6333758, 4.167857, 0, 0.5019608, 1, 1,
0.2444109, -0.1000654, 3.006327, 0, 0.4941176, 1, 1,
0.2461405, -0.1618995, 0.4825748, 0, 0.4901961, 1, 1,
0.2468469, -0.08949296, 0.5442609, 0, 0.4823529, 1, 1,
0.2471214, -1.011204, 1.758709, 0, 0.4784314, 1, 1,
0.2517979, 0.517053, 0.3095388, 0, 0.4705882, 1, 1,
0.2620569, 1.158422, 0.6563904, 0, 0.4666667, 1, 1,
0.2677966, 0.6996107, 2.059467, 0, 0.4588235, 1, 1,
0.2680696, -0.6978911, 3.462636, 0, 0.454902, 1, 1,
0.2702582, 1.32505, -0.4452647, 0, 0.4470588, 1, 1,
0.2721128, 1.084057, 0.01380344, 0, 0.4431373, 1, 1,
0.2724335, 0.7642683, 0.01148497, 0, 0.4352941, 1, 1,
0.2814023, -0.2067422, 3.354469, 0, 0.4313726, 1, 1,
0.2857593, -1.068299, 2.909681, 0, 0.4235294, 1, 1,
0.2861839, -0.6487729, 3.934042, 0, 0.4196078, 1, 1,
0.286751, -0.2424261, 2.753102, 0, 0.4117647, 1, 1,
0.2877798, -0.8708057, 4.375904, 0, 0.4078431, 1, 1,
0.2932472, -0.7333972, 2.745941, 0, 0.4, 1, 1,
0.2948448, -0.2488392, 2.587887, 0, 0.3921569, 1, 1,
0.2951438, -0.3438364, 2.720891, 0, 0.3882353, 1, 1,
0.2984371, -0.5957327, 4.457493, 0, 0.3803922, 1, 1,
0.2985845, 0.3152589, -0.3004983, 0, 0.3764706, 1, 1,
0.3000857, 0.1509754, 2.008563, 0, 0.3686275, 1, 1,
0.3036214, -1.094073, 2.45363, 0, 0.3647059, 1, 1,
0.3091882, 1.892214, 0.3094553, 0, 0.3568628, 1, 1,
0.3094995, -1.544052, 3.288091, 0, 0.3529412, 1, 1,
0.3099473, -1.292911, 3.536049, 0, 0.345098, 1, 1,
0.3099869, 1.525162, 0.5489202, 0, 0.3411765, 1, 1,
0.312407, 0.2214739, 1.410636, 0, 0.3333333, 1, 1,
0.3134722, 0.9357163, 0.7544565, 0, 0.3294118, 1, 1,
0.3154057, 0.5222735, -1.598677, 0, 0.3215686, 1, 1,
0.3174586, 0.8469663, 0.1548298, 0, 0.3176471, 1, 1,
0.3209952, 0.6171222, 0.8307962, 0, 0.3098039, 1, 1,
0.3245932, 0.4959816, 0.836948, 0, 0.3058824, 1, 1,
0.3254325, -0.5310564, 1.800759, 0, 0.2980392, 1, 1,
0.325677, -0.9520529, 3.586892, 0, 0.2901961, 1, 1,
0.326126, -1.100587, 1.723947, 0, 0.2862745, 1, 1,
0.3276575, -0.706982, 4.967522, 0, 0.2784314, 1, 1,
0.3317267, 0.5309179, 0.3284073, 0, 0.2745098, 1, 1,
0.332754, -0.5984974, 2.265399, 0, 0.2666667, 1, 1,
0.3338999, -0.9217157, 2.939829, 0, 0.2627451, 1, 1,
0.3349771, 1.266287, -0.8726785, 0, 0.254902, 1, 1,
0.3367482, 0.0396433, -0.2183228, 0, 0.2509804, 1, 1,
0.3392087, 0.4946831, 0.2762008, 0, 0.2431373, 1, 1,
0.3402687, 0.02375533, 0.3354356, 0, 0.2392157, 1, 1,
0.3432531, -0.6285051, 2.948732, 0, 0.2313726, 1, 1,
0.3433593, -1.035026, 3.627081, 0, 0.227451, 1, 1,
0.3452857, 0.7265099, 0.5529765, 0, 0.2196078, 1, 1,
0.3459117, 0.4496039, 0.8728875, 0, 0.2156863, 1, 1,
0.3462481, -0.3559895, 2.187452, 0, 0.2078431, 1, 1,
0.3470302, -1.049485, 1.441049, 0, 0.2039216, 1, 1,
0.34861, -0.495275, 3.399128, 0, 0.1960784, 1, 1,
0.3509059, -1.422127, 3.815291, 0, 0.1882353, 1, 1,
0.3514452, 0.6356784, 1.564788, 0, 0.1843137, 1, 1,
0.3527909, -0.8713611, -0.1036683, 0, 0.1764706, 1, 1,
0.356077, 0.6579337, -0.08865073, 0, 0.172549, 1, 1,
0.3581699, 1.289731, -0.2525053, 0, 0.1647059, 1, 1,
0.3632385, 0.7166603, 1.149073, 0, 0.1607843, 1, 1,
0.3667462, 0.8716502, -0.9842613, 0, 0.1529412, 1, 1,
0.3673134, 0.3602764, 2.163192, 0, 0.1490196, 1, 1,
0.3692865, 0.4037327, 0.7511478, 0, 0.1411765, 1, 1,
0.3694286, -0.03037798, 0.4644243, 0, 0.1372549, 1, 1,
0.3698483, 0.3734733, -0.7164654, 0, 0.1294118, 1, 1,
0.3808779, 2.317015, 0.817375, 0, 0.1254902, 1, 1,
0.3853332, -0.2901591, 0.928332, 0, 0.1176471, 1, 1,
0.3902622, -2.053525, 4.645263, 0, 0.1137255, 1, 1,
0.3912543, -1.456848, 3.141378, 0, 0.1058824, 1, 1,
0.3916373, 0.7989899, -0.04611042, 0, 0.09803922, 1, 1,
0.3922304, 0.02850591, 1.29759, 0, 0.09411765, 1, 1,
0.3922389, 2.220519, -0.2654891, 0, 0.08627451, 1, 1,
0.3952959, -0.744648, 2.226211, 0, 0.08235294, 1, 1,
0.3966335, 0.703888, -0.2998774, 0, 0.07450981, 1, 1,
0.4030026, 1.208079, 0.825367, 0, 0.07058824, 1, 1,
0.4037819, -0.5836752, 3.400543, 0, 0.0627451, 1, 1,
0.40511, -0.1712214, 0.8686102, 0, 0.05882353, 1, 1,
0.4061882, -0.9893741, 2.798375, 0, 0.05098039, 1, 1,
0.4084946, -0.8858272, 1.973981, 0, 0.04705882, 1, 1,
0.4095944, -0.5362008, 3.030092, 0, 0.03921569, 1, 1,
0.4154971, 0.1680674, 1.773216, 0, 0.03529412, 1, 1,
0.4284772, -0.5879862, 2.152393, 0, 0.02745098, 1, 1,
0.4289036, 1.053952, -0.5972623, 0, 0.02352941, 1, 1,
0.4321981, 0.7610011, -0.4607057, 0, 0.01568628, 1, 1,
0.4330216, -0.2996984, 0.6751775, 0, 0.01176471, 1, 1,
0.4336921, -0.9041662, 2.045326, 0, 0.003921569, 1, 1,
0.4417083, -0.3336324, 0.9478982, 0.003921569, 0, 1, 1,
0.4436582, -1.564306, 3.01515, 0.007843138, 0, 1, 1,
0.4477116, 2.614499, 0.08977077, 0.01568628, 0, 1, 1,
0.4496032, -0.2767013, 2.782862, 0.01960784, 0, 1, 1,
0.4497525, 0.4408281, 1.066009, 0.02745098, 0, 1, 1,
0.4563904, 1.031706, 1.421283, 0.03137255, 0, 1, 1,
0.4577617, 2.289266, -0.4662482, 0.03921569, 0, 1, 1,
0.4602373, 0.05509861, -1.614445, 0.04313726, 0, 1, 1,
0.4668882, -1.226625, 4.32526, 0.05098039, 0, 1, 1,
0.4688659, 1.193264, 0.8564702, 0.05490196, 0, 1, 1,
0.470561, 1.884961, 1.582223, 0.0627451, 0, 1, 1,
0.4753276, 0.2160014, 0.387131, 0.06666667, 0, 1, 1,
0.4775202, -0.547585, 1.981043, 0.07450981, 0, 1, 1,
0.4778771, -0.1312726, 2.255588, 0.07843138, 0, 1, 1,
0.4793472, -0.1067109, 1.014222, 0.08627451, 0, 1, 1,
0.4830852, 0.373882, -0.4385923, 0.09019608, 0, 1, 1,
0.485309, 0.03635136, 2.380718, 0.09803922, 0, 1, 1,
0.487268, -0.3697719, 3.01547, 0.1058824, 0, 1, 1,
0.4884424, -0.5185901, 3.93789, 0.1098039, 0, 1, 1,
0.4885473, 0.1963206, 0.510174, 0.1176471, 0, 1, 1,
0.4901279, 0.4275562, 1.338274, 0.1215686, 0, 1, 1,
0.4938145, 0.04126437, 1.341154, 0.1294118, 0, 1, 1,
0.4945385, 0.03765567, 2.579054, 0.1333333, 0, 1, 1,
0.4979945, -2.173017, 3.709323, 0.1411765, 0, 1, 1,
0.5003425, -0.7541487, 3.254882, 0.145098, 0, 1, 1,
0.5042806, 0.8067825, -0.5824439, 0.1529412, 0, 1, 1,
0.508227, -1.764066, 1.115211, 0.1568628, 0, 1, 1,
0.5111126, 1.017428, 0.7822805, 0.1647059, 0, 1, 1,
0.511319, -0.1577031, 2.57248, 0.1686275, 0, 1, 1,
0.5149581, 0.8531163, 1.682208, 0.1764706, 0, 1, 1,
0.5226077, -0.08232343, 2.349019, 0.1803922, 0, 1, 1,
0.5272193, -0.525861, 1.699937, 0.1882353, 0, 1, 1,
0.5277525, 0.8386722, 1.50044, 0.1921569, 0, 1, 1,
0.5289559, 1.272819, 1.15606, 0.2, 0, 1, 1,
0.5324401, -1.25943, 3.386329, 0.2078431, 0, 1, 1,
0.5337318, -1.054876, 2.911337, 0.2117647, 0, 1, 1,
0.5338722, -2.062186, 3.42323, 0.2196078, 0, 1, 1,
0.5352976, -1.286958, 2.212173, 0.2235294, 0, 1, 1,
0.5363244, 0.6101053, 0.3760385, 0.2313726, 0, 1, 1,
0.5366684, -0.9415738, 3.313894, 0.2352941, 0, 1, 1,
0.5462769, -0.6711268, 3.221793, 0.2431373, 0, 1, 1,
0.5508624, -1.216688, 2.13302, 0.2470588, 0, 1, 1,
0.5560684, -0.5482643, 2.005677, 0.254902, 0, 1, 1,
0.5589691, 0.5944639, 0.4097099, 0.2588235, 0, 1, 1,
0.5595394, 0.09475218, 2.976996, 0.2666667, 0, 1, 1,
0.5612789, 0.6742593, 1.16364, 0.2705882, 0, 1, 1,
0.5684756, -0.9627642, 1.111446, 0.2784314, 0, 1, 1,
0.5699874, -0.1447183, -0.02122874, 0.282353, 0, 1, 1,
0.5747958, -0.4956274, 1.549731, 0.2901961, 0, 1, 1,
0.575943, 0.2911523, 0.02079664, 0.2941177, 0, 1, 1,
0.5763779, 2.279673, 0.1272182, 0.3019608, 0, 1, 1,
0.5853916, 0.6372786, 1.289211, 0.3098039, 0, 1, 1,
0.587075, 0.003486846, 1.390012, 0.3137255, 0, 1, 1,
0.5895771, -0.4303273, 1.536783, 0.3215686, 0, 1, 1,
0.5913689, 0.8117481, 0.1548173, 0.3254902, 0, 1, 1,
0.5920569, -0.254751, 2.648494, 0.3333333, 0, 1, 1,
0.6058187, 1.865497, 1.5748, 0.3372549, 0, 1, 1,
0.6148298, 0.5210251, 1.7833, 0.345098, 0, 1, 1,
0.6182775, -0.503417, 1.984483, 0.3490196, 0, 1, 1,
0.6194388, -0.6803805, 2.463717, 0.3568628, 0, 1, 1,
0.6228209, -1.182485, 3.078413, 0.3607843, 0, 1, 1,
0.6287546, -0.6352416, 0.8344264, 0.3686275, 0, 1, 1,
0.6288686, -0.4602464, 2.135403, 0.372549, 0, 1, 1,
0.6327924, -0.1425141, 1.229215, 0.3803922, 0, 1, 1,
0.6340865, 0.3722072, 2.733523, 0.3843137, 0, 1, 1,
0.6433801, 0.2532905, 0.4332709, 0.3921569, 0, 1, 1,
0.6464211, -0.4895384, 2.488854, 0.3960784, 0, 1, 1,
0.654667, -0.6846181, 0.5351321, 0.4039216, 0, 1, 1,
0.6581071, -0.1547725, 2.252639, 0.4117647, 0, 1, 1,
0.6649234, -0.1495086, 2.265151, 0.4156863, 0, 1, 1,
0.667002, -0.2000326, 2.989867, 0.4235294, 0, 1, 1,
0.6676754, 1.26559, 0.06222834, 0.427451, 0, 1, 1,
0.6688305, 0.6629908, 0.8394784, 0.4352941, 0, 1, 1,
0.6732543, -1.507954, 1.189837, 0.4392157, 0, 1, 1,
0.6743284, -1.191406, 3.475391, 0.4470588, 0, 1, 1,
0.6823546, 0.8110208, -0.1535247, 0.4509804, 0, 1, 1,
0.6833994, 0.7913195, 0.7214284, 0.4588235, 0, 1, 1,
0.685592, 0.05994092, 0.6004332, 0.4627451, 0, 1, 1,
0.6858464, 0.9504643, -1.242582, 0.4705882, 0, 1, 1,
0.6928747, 0.4537053, 0.8826342, 0.4745098, 0, 1, 1,
0.7034233, -1.063601, -0.4295838, 0.4823529, 0, 1, 1,
0.7034665, -1.397581, 3.368992, 0.4862745, 0, 1, 1,
0.7043216, 0.9916446, 0.1585798, 0.4941176, 0, 1, 1,
0.7087972, -0.2444783, 0.8114895, 0.5019608, 0, 1, 1,
0.7182299, -0.7898246, 3.13304, 0.5058824, 0, 1, 1,
0.7199823, 1.563606, 2.187805, 0.5137255, 0, 1, 1,
0.7241493, 0.2176649, -0.460485, 0.5176471, 0, 1, 1,
0.7279325, 0.89132, 0.4319668, 0.5254902, 0, 1, 1,
0.7312851, 1.23236, 0.1849113, 0.5294118, 0, 1, 1,
0.7329155, 0.4068365, -1.290974, 0.5372549, 0, 1, 1,
0.735613, 0.5432302, 0.6242579, 0.5411765, 0, 1, 1,
0.7356256, 0.4081622, -1.210495, 0.5490196, 0, 1, 1,
0.7398556, 0.9042819, 0.4949796, 0.5529412, 0, 1, 1,
0.7410591, -1.267175, 2.082606, 0.5607843, 0, 1, 1,
0.742182, 1.804286, 1.413179, 0.5647059, 0, 1, 1,
0.7470889, -0.0366275, 2.931684, 0.572549, 0, 1, 1,
0.7539995, 0.9113329, -1.260103, 0.5764706, 0, 1, 1,
0.7552116, 1.763826, 2.599871, 0.5843138, 0, 1, 1,
0.7557852, -0.6115828, 1.67427, 0.5882353, 0, 1, 1,
0.7564154, -0.9390746, 1.716068, 0.5960785, 0, 1, 1,
0.7566015, -0.04452167, 1.945644, 0.6039216, 0, 1, 1,
0.7567844, -1.448002, 2.573794, 0.6078432, 0, 1, 1,
0.7655185, 1.381481, 0.134968, 0.6156863, 0, 1, 1,
0.7695968, -0.7919225, 2.590916, 0.6196079, 0, 1, 1,
0.7728423, 0.82921, 1.144035, 0.627451, 0, 1, 1,
0.7784663, 0.3553413, 1.626021, 0.6313726, 0, 1, 1,
0.7802054, 1.999468, 0.5811252, 0.6392157, 0, 1, 1,
0.7802495, -0.6729743, 4.561605, 0.6431373, 0, 1, 1,
0.7807989, 0.3735032, 1.192075, 0.6509804, 0, 1, 1,
0.7840558, 0.07046077, 0.8545021, 0.654902, 0, 1, 1,
0.7963951, -0.805616, 2.175954, 0.6627451, 0, 1, 1,
0.7965703, -0.480077, 1.523699, 0.6666667, 0, 1, 1,
0.7995275, -0.1153274, 2.248091, 0.6745098, 0, 1, 1,
0.8034952, -0.1562837, 0.1837357, 0.6784314, 0, 1, 1,
0.8062884, -0.05951233, 1.810302, 0.6862745, 0, 1, 1,
0.8107011, -3.217409, 4.346073, 0.6901961, 0, 1, 1,
0.8147615, 1.264663, 1.147883, 0.6980392, 0, 1, 1,
0.818859, 0.524609, 0.001819693, 0.7058824, 0, 1, 1,
0.8196021, 0.4849449, 1.802062, 0.7098039, 0, 1, 1,
0.8197761, -0.9232847, 1.791074, 0.7176471, 0, 1, 1,
0.8210631, -0.0808901, 1.465908, 0.7215686, 0, 1, 1,
0.8259785, 0.1562201, 0.8405316, 0.7294118, 0, 1, 1,
0.8273097, 1.170569, 2.440547, 0.7333333, 0, 1, 1,
0.8372775, 0.754005, 3.00645, 0.7411765, 0, 1, 1,
0.8394207, -1.353064, 2.423086, 0.7450981, 0, 1, 1,
0.8446941, 1.184458, 1.102634, 0.7529412, 0, 1, 1,
0.8460933, -1.45574, 3.02083, 0.7568628, 0, 1, 1,
0.8499824, -0.2559155, 0.8767366, 0.7647059, 0, 1, 1,
0.8531595, -0.3821376, 2.687557, 0.7686275, 0, 1, 1,
0.8558648, 1.060916, 2.1833, 0.7764706, 0, 1, 1,
0.8628547, 1.399434, -0.1697866, 0.7803922, 0, 1, 1,
0.8641662, 0.05485073, 2.288583, 0.7882353, 0, 1, 1,
0.864838, 0.3064275, -0.2683825, 0.7921569, 0, 1, 1,
0.8653173, 1.330965, 1.1398, 0.8, 0, 1, 1,
0.8723992, 0.07084607, 1.698202, 0.8078431, 0, 1, 1,
0.8757839, 0.5316522, 2.324385, 0.8117647, 0, 1, 1,
0.8774579, 1.075534, -0.3930907, 0.8196079, 0, 1, 1,
0.8812996, 0.2247262, 1.862466, 0.8235294, 0, 1, 1,
0.8855484, -0.1574908, 2.968357, 0.8313726, 0, 1, 1,
0.8857588, -0.5801448, 1.851493, 0.8352941, 0, 1, 1,
0.8871648, -2.421587, 3.820945, 0.8431373, 0, 1, 1,
0.8877434, -0.7624438, 1.326827, 0.8470588, 0, 1, 1,
0.8922518, 0.7684598, -0.03541283, 0.854902, 0, 1, 1,
0.8941379, -0.9333386, 2.716526, 0.8588235, 0, 1, 1,
0.8960242, -1.592945, 2.42542, 0.8666667, 0, 1, 1,
0.9010774, 1.249464, 0.5120831, 0.8705882, 0, 1, 1,
0.908383, -0.7647943, 2.791452, 0.8784314, 0, 1, 1,
0.9084305, -0.661922, 2.049118, 0.8823529, 0, 1, 1,
0.9106852, -0.8207606, 2.703229, 0.8901961, 0, 1, 1,
0.9115233, -1.6184, 2.956755, 0.8941177, 0, 1, 1,
0.9121301, 0.00387483, 2.281114, 0.9019608, 0, 1, 1,
0.9142076, -0.8890942, 2.633444, 0.9098039, 0, 1, 1,
0.9186105, -0.5370318, 1.897606, 0.9137255, 0, 1, 1,
0.9208115, -0.78917, 1.273803, 0.9215686, 0, 1, 1,
0.9253176, 1.270312, -0.508277, 0.9254902, 0, 1, 1,
0.9277661, 0.9884484, -0.3910277, 0.9333333, 0, 1, 1,
0.9418172, -0.201516, 2.038952, 0.9372549, 0, 1, 1,
0.949095, -1.054336, 1.578916, 0.945098, 0, 1, 1,
0.9514559, -1.186047, 2.726495, 0.9490196, 0, 1, 1,
0.9528863, 0.3275036, 1.804369, 0.9568627, 0, 1, 1,
0.9540433, -0.4834758, 3.280279, 0.9607843, 0, 1, 1,
0.9593153, -1.612645, 2.84472, 0.9686275, 0, 1, 1,
0.9731756, 0.3062334, 2.707958, 0.972549, 0, 1, 1,
0.9744032, 1.407728, 2.761907, 0.9803922, 0, 1, 1,
0.977504, 0.6866561, 0.8393955, 0.9843137, 0, 1, 1,
0.9790424, 0.741452, -0.03940514, 0.9921569, 0, 1, 1,
0.9815193, 0.1581734, 0.8163098, 0.9960784, 0, 1, 1,
0.9916384, -0.02363462, 0.1196991, 1, 0, 0.9960784, 1,
0.9963643, 0.2096282, 2.841646, 1, 0, 0.9882353, 1,
1.004501, 0.1576925, 2.477195, 1, 0, 0.9843137, 1,
1.01019, -0.7922861, 1.534598, 1, 0, 0.9764706, 1,
1.015945, -1.388235, 1.460632, 1, 0, 0.972549, 1,
1.017742, -2.049841, 5.016243, 1, 0, 0.9647059, 1,
1.019482, 0.105917, 1.710178, 1, 0, 0.9607843, 1,
1.020802, 1.011283, 0.4003824, 1, 0, 0.9529412, 1,
1.02158, 0.8392509, -0.5104594, 1, 0, 0.9490196, 1,
1.032245, 0.003610955, 3.18134, 1, 0, 0.9411765, 1,
1.038001, 0.1996005, 1.157413, 1, 0, 0.9372549, 1,
1.040744, -1.87396, 3.263328, 1, 0, 0.9294118, 1,
1.041175, -1.103243, 2.111667, 1, 0, 0.9254902, 1,
1.047284, -1.278952, 1.153326, 1, 0, 0.9176471, 1,
1.053578, -0.3373418, 3.539674, 1, 0, 0.9137255, 1,
1.056705, -1.300682, 3.696668, 1, 0, 0.9058824, 1,
1.062753, 0.01318802, 0.987281, 1, 0, 0.9019608, 1,
1.078136, 0.2442461, 2.01573, 1, 0, 0.8941177, 1,
1.07829, -0.1055897, 1.148627, 1, 0, 0.8862745, 1,
1.078811, 1.938425, -0.6002606, 1, 0, 0.8823529, 1,
1.079423, 1.898419, 0.6582264, 1, 0, 0.8745098, 1,
1.099137, -0.5951923, 2.237369, 1, 0, 0.8705882, 1,
1.103373, 1.058428, 1.044708, 1, 0, 0.8627451, 1,
1.10764, -0.4733461, 2.221622, 1, 0, 0.8588235, 1,
1.112063, -0.4331473, 1.599807, 1, 0, 0.8509804, 1,
1.114029, -0.5031634, 2.47598, 1, 0, 0.8470588, 1,
1.115644, -0.5136967, 1.652716, 1, 0, 0.8392157, 1,
1.117628, 0.2871695, 2.16701, 1, 0, 0.8352941, 1,
1.121485, -0.5136214, 4.180122, 1, 0, 0.827451, 1,
1.125174, 1.296598, -0.05256161, 1, 0, 0.8235294, 1,
1.128573, -0.4067676, 0.818709, 1, 0, 0.8156863, 1,
1.130695, -0.715223, 3.359786, 1, 0, 0.8117647, 1,
1.131961, -0.2593177, 1.5018, 1, 0, 0.8039216, 1,
1.132936, 0.4209846, 1.356172, 1, 0, 0.7960784, 1,
1.14555, 0.5425956, 2.275361, 1, 0, 0.7921569, 1,
1.146882, 0.1535606, 0.3632265, 1, 0, 0.7843137, 1,
1.152186, 1.531973, -0.1146669, 1, 0, 0.7803922, 1,
1.158038, 0.1026581, 2.317177, 1, 0, 0.772549, 1,
1.163509, -1.863526, 1.980932, 1, 0, 0.7686275, 1,
1.164517, 1.073888, 2.401089, 1, 0, 0.7607843, 1,
1.175005, 0.2428937, 0.9591651, 1, 0, 0.7568628, 1,
1.175758, 0.2205174, 1.941611, 1, 0, 0.7490196, 1,
1.185061, 2.123538, 1.579095, 1, 0, 0.7450981, 1,
1.19128, -0.01955842, 0.9015799, 1, 0, 0.7372549, 1,
1.193011, 0.1524221, 1.089115, 1, 0, 0.7333333, 1,
1.2123, -0.5968103, 1.902594, 1, 0, 0.7254902, 1,
1.229019, 0.9778834, 0.5990993, 1, 0, 0.7215686, 1,
1.229404, -0.8889894, 2.450936, 1, 0, 0.7137255, 1,
1.233209, -1.396664, 2.154435, 1, 0, 0.7098039, 1,
1.236046, -1.809002, 3.533701, 1, 0, 0.7019608, 1,
1.243072, 0.05919021, 4.133838, 1, 0, 0.6941177, 1,
1.24342, -0.5739741, 1.658203, 1, 0, 0.6901961, 1,
1.251976, 0.5139066, 0.4494099, 1, 0, 0.682353, 1,
1.25643, 0.3834795, 0.3484209, 1, 0, 0.6784314, 1,
1.258895, 0.7753215, 1.146971, 1, 0, 0.6705883, 1,
1.261866, -0.8654542, 1.582108, 1, 0, 0.6666667, 1,
1.267025, -2.289284, 3.073295, 1, 0, 0.6588235, 1,
1.271957, 0.4985236, 0.08388744, 1, 0, 0.654902, 1,
1.274007, 1.11809, 0.05892039, 1, 0, 0.6470588, 1,
1.274485, 0.07061959, 1.891043, 1, 0, 0.6431373, 1,
1.279146, -0.7563154, 1.872175, 1, 0, 0.6352941, 1,
1.290072, -0.06195629, 2.520622, 1, 0, 0.6313726, 1,
1.294498, 0.1883235, 2.756675, 1, 0, 0.6235294, 1,
1.297157, 0.450652, 2.337258, 1, 0, 0.6196079, 1,
1.315441, 0.3422202, 1.214392, 1, 0, 0.6117647, 1,
1.317042, -0.5016325, 3.360627, 1, 0, 0.6078432, 1,
1.31783, 0.1746784, 2.558009, 1, 0, 0.6, 1,
1.330675, -1.706005, 2.179598, 1, 0, 0.5921569, 1,
1.358333, -2.3171, 2.834146, 1, 0, 0.5882353, 1,
1.362165, 0.4704389, 3.224664, 1, 0, 0.5803922, 1,
1.362679, -0.2480789, 1.474881, 1, 0, 0.5764706, 1,
1.362798, 1.445733, -0.8755597, 1, 0, 0.5686275, 1,
1.364866, -1.801551, 2.376313, 1, 0, 0.5647059, 1,
1.365479, 0.1946504, 1.715766, 1, 0, 0.5568628, 1,
1.367378, -1.202077, 3.108793, 1, 0, 0.5529412, 1,
1.368886, -0.7382483, 2.411018, 1, 0, 0.5450981, 1,
1.370263, -0.6954869, 4.747312, 1, 0, 0.5411765, 1,
1.372095, -0.2413649, 0.9042469, 1, 0, 0.5333334, 1,
1.374846, 0.7922838, -2.399181, 1, 0, 0.5294118, 1,
1.383294, 1.170413, -0.4636195, 1, 0, 0.5215687, 1,
1.385743, -0.2043576, 3.515806, 1, 0, 0.5176471, 1,
1.389332, 1.660964, 0.2551697, 1, 0, 0.509804, 1,
1.399658, 0.5423325, 1.744557, 1, 0, 0.5058824, 1,
1.40415, -0.4753924, 0.9905446, 1, 0, 0.4980392, 1,
1.404568, 0.8142588, 0.7629125, 1, 0, 0.4901961, 1,
1.406493, 0.6702913, 0.6097471, 1, 0, 0.4862745, 1,
1.417366, -0.03813013, 2.395069, 1, 0, 0.4784314, 1,
1.424183, 0.2844838, 2.199782, 1, 0, 0.4745098, 1,
1.425602, 0.2372284, 2.246881, 1, 0, 0.4666667, 1,
1.440906, 0.9800652, 3.557913, 1, 0, 0.4627451, 1,
1.44386, 2.459486, 0.8045128, 1, 0, 0.454902, 1,
1.445377, 0.5386345, 0.2593196, 1, 0, 0.4509804, 1,
1.469533, 0.6924803, 2.932038, 1, 0, 0.4431373, 1,
1.473168, 1.465599, 1.272695, 1, 0, 0.4392157, 1,
1.486539, -0.8072069, 1.913597, 1, 0, 0.4313726, 1,
1.496152, -0.05944572, 1.36467, 1, 0, 0.427451, 1,
1.518885, 0.1220087, 1.95335, 1, 0, 0.4196078, 1,
1.520106, 1.199423, 2.254439, 1, 0, 0.4156863, 1,
1.524831, 0.5866057, 2.579954, 1, 0, 0.4078431, 1,
1.535018, 1.012291, 1.832614, 1, 0, 0.4039216, 1,
1.547385, 0.4162908, 2.819761, 1, 0, 0.3960784, 1,
1.574065, -0.475949, 1.396811, 1, 0, 0.3882353, 1,
1.579443, -0.2282415, 3.096377, 1, 0, 0.3843137, 1,
1.582022, -0.1342961, 2.693347, 1, 0, 0.3764706, 1,
1.58368, 1.039565, 1.870061, 1, 0, 0.372549, 1,
1.603067, -0.01678528, 1.266495, 1, 0, 0.3647059, 1,
1.624631, -0.4142033, 1.679598, 1, 0, 0.3607843, 1,
1.6464, -0.3675366, 1.963995, 1, 0, 0.3529412, 1,
1.662625, 0.1498266, 1.062175, 1, 0, 0.3490196, 1,
1.66265, 0.9382994, 1.35581, 1, 0, 0.3411765, 1,
1.668221, 1.869165, 1.556358, 1, 0, 0.3372549, 1,
1.672145, -1.007955, 2.077015, 1, 0, 0.3294118, 1,
1.674289, 1.456531, 1.383752, 1, 0, 0.3254902, 1,
1.688051, -1.091544, 2.398476, 1, 0, 0.3176471, 1,
1.694464, -1.418926, 2.473153, 1, 0, 0.3137255, 1,
1.770213, 0.03343749, 2.014249, 1, 0, 0.3058824, 1,
1.773363, -1.089295, 1.479484, 1, 0, 0.2980392, 1,
1.775656, 0.664902, 1.553611, 1, 0, 0.2941177, 1,
1.784292, 0.5150338, 2.864058, 1, 0, 0.2862745, 1,
1.785196, -0.4533205, 1.67743, 1, 0, 0.282353, 1,
1.796564, -0.7003422, 3.157222, 1, 0, 0.2745098, 1,
1.81752, -0.4459403, 2.781082, 1, 0, 0.2705882, 1,
1.818967, 0.733872, 1.768477, 1, 0, 0.2627451, 1,
1.824575, -0.01590302, 2.478869, 1, 0, 0.2588235, 1,
1.837434, 2.167623, 1.577624, 1, 0, 0.2509804, 1,
1.841779, 0.4135859, 1.527488, 1, 0, 0.2470588, 1,
1.848591, -0.4964128, 1.790363, 1, 0, 0.2392157, 1,
1.859503, 0.7969382, 1.703765, 1, 0, 0.2352941, 1,
1.864879, 0.1248171, 1.584327, 1, 0, 0.227451, 1,
1.865825, 1.012324, 0.9292231, 1, 0, 0.2235294, 1,
1.893298, 0.3069146, 4.764316, 1, 0, 0.2156863, 1,
1.899252, 0.754068, 2.175431, 1, 0, 0.2117647, 1,
1.901689, 1.288775, 2.064713, 1, 0, 0.2039216, 1,
1.922748, -0.08316731, 1.898478, 1, 0, 0.1960784, 1,
1.926391, -1.662797, 0.4849667, 1, 0, 0.1921569, 1,
1.936395, -1.872622, 2.488855, 1, 0, 0.1843137, 1,
1.942335, -1.436339, 2.876169, 1, 0, 0.1803922, 1,
1.958414, 0.4862436, 0.7294693, 1, 0, 0.172549, 1,
1.963381, 0.7252155, 0.2157246, 1, 0, 0.1686275, 1,
2.009696, -1.916482, 4.139104, 1, 0, 0.1607843, 1,
2.027287, 0.4321105, 1.911903, 1, 0, 0.1568628, 1,
2.028629, 0.3400464, 0.06616154, 1, 0, 0.1490196, 1,
2.070544, -0.02857373, 0.9384943, 1, 0, 0.145098, 1,
2.075496, 0.4202285, 2.844696, 1, 0, 0.1372549, 1,
2.10703, -0.9374802, 3.8281, 1, 0, 0.1333333, 1,
2.122711, -1.13829, 3.31343, 1, 0, 0.1254902, 1,
2.14609, -0.01399086, 1.428761, 1, 0, 0.1215686, 1,
2.180503, -0.4757605, 0.4086153, 1, 0, 0.1137255, 1,
2.214638, 0.6975902, 0.09660625, 1, 0, 0.1098039, 1,
2.269867, -1.778777, 0.7304716, 1, 0, 0.1019608, 1,
2.309415, -0.2020347, 3.007025, 1, 0, 0.09411765, 1,
2.330503, 0.2414823, 0.858183, 1, 0, 0.09019608, 1,
2.344916, 0.07419186, -0.1399904, 1, 0, 0.08235294, 1,
2.404258, -0.6196973, 3.046487, 1, 0, 0.07843138, 1,
2.405671, -0.002990369, 1.010755, 1, 0, 0.07058824, 1,
2.411054, 0.0469597, 2.316096, 1, 0, 0.06666667, 1,
2.414232, -1.206726, 0.9667174, 1, 0, 0.05882353, 1,
2.417478, 0.1827113, 0.1423749, 1, 0, 0.05490196, 1,
2.421537, 0.745745, 2.269432, 1, 0, 0.04705882, 1,
2.474221, -1.32851, 1.791559, 1, 0, 0.04313726, 1,
2.51654, 2.934996, -2.03386, 1, 0, 0.03529412, 1,
2.571347, 0.1023445, 1.116142, 1, 0, 0.03137255, 1,
2.617119, 1.27771, 0.1587365, 1, 0, 0.02352941, 1,
2.643111, 0.1229905, 0.7899297, 1, 0, 0.01960784, 1,
2.671602, 0.4668142, 1.820262, 1, 0, 0.01176471, 1,
3.150671, 1.540884, 0.558654, 1, 0, 0.007843138, 1
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
-0.1453964, -4.260242, -7.101444, 0, -0.5, 0.5, 0.5,
-0.1453964, -4.260242, -7.101444, 1, -0.5, 0.5, 0.5,
-0.1453964, -4.260242, -7.101444, 1, 1.5, 0.5, 0.5,
-0.1453964, -4.260242, -7.101444, 0, 1.5, 0.5, 0.5
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
-4.558831, -0.1412065, -7.101444, 0, -0.5, 0.5, 0.5,
-4.558831, -0.1412065, -7.101444, 1, -0.5, 0.5, 0.5,
-4.558831, -0.1412065, -7.101444, 1, 1.5, 0.5, 0.5,
-4.558831, -0.1412065, -7.101444, 0, 1.5, 0.5, 0.5
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
-4.558831, -4.260242, 0.09197283, 0, -0.5, 0.5, 0.5,
-4.558831, -4.260242, 0.09197283, 1, -0.5, 0.5, 0.5,
-4.558831, -4.260242, 0.09197283, 1, 1.5, 0.5, 0.5,
-4.558831, -4.260242, 0.09197283, 0, 1.5, 0.5, 0.5
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
-3, -3.309695, -5.441425,
3, -3.309695, -5.441425,
-3, -3.309695, -5.441425,
-3, -3.46812, -5.718094,
-2, -3.309695, -5.441425,
-2, -3.46812, -5.718094,
-1, -3.309695, -5.441425,
-1, -3.46812, -5.718094,
0, -3.309695, -5.441425,
0, -3.46812, -5.718094,
1, -3.309695, -5.441425,
1, -3.46812, -5.718094,
2, -3.309695, -5.441425,
2, -3.46812, -5.718094,
3, -3.309695, -5.441425,
3, -3.46812, -5.718094
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
-3, -3.784969, -6.271434, 0, -0.5, 0.5, 0.5,
-3, -3.784969, -6.271434, 1, -0.5, 0.5, 0.5,
-3, -3.784969, -6.271434, 1, 1.5, 0.5, 0.5,
-3, -3.784969, -6.271434, 0, 1.5, 0.5, 0.5,
-2, -3.784969, -6.271434, 0, -0.5, 0.5, 0.5,
-2, -3.784969, -6.271434, 1, -0.5, 0.5, 0.5,
-2, -3.784969, -6.271434, 1, 1.5, 0.5, 0.5,
-2, -3.784969, -6.271434, 0, 1.5, 0.5, 0.5,
-1, -3.784969, -6.271434, 0, -0.5, 0.5, 0.5,
-1, -3.784969, -6.271434, 1, -0.5, 0.5, 0.5,
-1, -3.784969, -6.271434, 1, 1.5, 0.5, 0.5,
-1, -3.784969, -6.271434, 0, 1.5, 0.5, 0.5,
0, -3.784969, -6.271434, 0, -0.5, 0.5, 0.5,
0, -3.784969, -6.271434, 1, -0.5, 0.5, 0.5,
0, -3.784969, -6.271434, 1, 1.5, 0.5, 0.5,
0, -3.784969, -6.271434, 0, 1.5, 0.5, 0.5,
1, -3.784969, -6.271434, 0, -0.5, 0.5, 0.5,
1, -3.784969, -6.271434, 1, -0.5, 0.5, 0.5,
1, -3.784969, -6.271434, 1, 1.5, 0.5, 0.5,
1, -3.784969, -6.271434, 0, 1.5, 0.5, 0.5,
2, -3.784969, -6.271434, 0, -0.5, 0.5, 0.5,
2, -3.784969, -6.271434, 1, -0.5, 0.5, 0.5,
2, -3.784969, -6.271434, 1, 1.5, 0.5, 0.5,
2, -3.784969, -6.271434, 0, 1.5, 0.5, 0.5,
3, -3.784969, -6.271434, 0, -0.5, 0.5, 0.5,
3, -3.784969, -6.271434, 1, -0.5, 0.5, 0.5,
3, -3.784969, -6.271434, 1, 1.5, 0.5, 0.5,
3, -3.784969, -6.271434, 0, 1.5, 0.5, 0.5
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
-3.540346, -3, -5.441425,
-3.540346, 2, -5.441425,
-3.540346, -3, -5.441425,
-3.710093, -3, -5.718094,
-3.540346, -2, -5.441425,
-3.710093, -2, -5.718094,
-3.540346, -1, -5.441425,
-3.710093, -1, -5.718094,
-3.540346, 0, -5.441425,
-3.710093, 0, -5.718094,
-3.540346, 1, -5.441425,
-3.710093, 1, -5.718094,
-3.540346, 2, -5.441425,
-3.710093, 2, -5.718094
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
-4.049588, -3, -6.271434, 0, -0.5, 0.5, 0.5,
-4.049588, -3, -6.271434, 1, -0.5, 0.5, 0.5,
-4.049588, -3, -6.271434, 1, 1.5, 0.5, 0.5,
-4.049588, -3, -6.271434, 0, 1.5, 0.5, 0.5,
-4.049588, -2, -6.271434, 0, -0.5, 0.5, 0.5,
-4.049588, -2, -6.271434, 1, -0.5, 0.5, 0.5,
-4.049588, -2, -6.271434, 1, 1.5, 0.5, 0.5,
-4.049588, -2, -6.271434, 0, 1.5, 0.5, 0.5,
-4.049588, -1, -6.271434, 0, -0.5, 0.5, 0.5,
-4.049588, -1, -6.271434, 1, -0.5, 0.5, 0.5,
-4.049588, -1, -6.271434, 1, 1.5, 0.5, 0.5,
-4.049588, -1, -6.271434, 0, 1.5, 0.5, 0.5,
-4.049588, 0, -6.271434, 0, -0.5, 0.5, 0.5,
-4.049588, 0, -6.271434, 1, -0.5, 0.5, 0.5,
-4.049588, 0, -6.271434, 1, 1.5, 0.5, 0.5,
-4.049588, 0, -6.271434, 0, 1.5, 0.5, 0.5,
-4.049588, 1, -6.271434, 0, -0.5, 0.5, 0.5,
-4.049588, 1, -6.271434, 1, -0.5, 0.5, 0.5,
-4.049588, 1, -6.271434, 1, 1.5, 0.5, 0.5,
-4.049588, 1, -6.271434, 0, 1.5, 0.5, 0.5,
-4.049588, 2, -6.271434, 0, -0.5, 0.5, 0.5,
-4.049588, 2, -6.271434, 1, -0.5, 0.5, 0.5,
-4.049588, 2, -6.271434, 1, 1.5, 0.5, 0.5,
-4.049588, 2, -6.271434, 0, 1.5, 0.5, 0.5
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
-3.540346, -3.309695, -4,
-3.540346, -3.309695, 4,
-3.540346, -3.309695, -4,
-3.710093, -3.46812, -4,
-3.540346, -3.309695, -2,
-3.710093, -3.46812, -2,
-3.540346, -3.309695, 0,
-3.710093, -3.46812, 0,
-3.540346, -3.309695, 2,
-3.710093, -3.46812, 2,
-3.540346, -3.309695, 4,
-3.710093, -3.46812, 4
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
-4.049588, -3.784969, -4, 0, -0.5, 0.5, 0.5,
-4.049588, -3.784969, -4, 1, -0.5, 0.5, 0.5,
-4.049588, -3.784969, -4, 1, 1.5, 0.5, 0.5,
-4.049588, -3.784969, -4, 0, 1.5, 0.5, 0.5,
-4.049588, -3.784969, -2, 0, -0.5, 0.5, 0.5,
-4.049588, -3.784969, -2, 1, -0.5, 0.5, 0.5,
-4.049588, -3.784969, -2, 1, 1.5, 0.5, 0.5,
-4.049588, -3.784969, -2, 0, 1.5, 0.5, 0.5,
-4.049588, -3.784969, 0, 0, -0.5, 0.5, 0.5,
-4.049588, -3.784969, 0, 1, -0.5, 0.5, 0.5,
-4.049588, -3.784969, 0, 1, 1.5, 0.5, 0.5,
-4.049588, -3.784969, 0, 0, 1.5, 0.5, 0.5,
-4.049588, -3.784969, 2, 0, -0.5, 0.5, 0.5,
-4.049588, -3.784969, 2, 1, -0.5, 0.5, 0.5,
-4.049588, -3.784969, 2, 1, 1.5, 0.5, 0.5,
-4.049588, -3.784969, 2, 0, 1.5, 0.5, 0.5,
-4.049588, -3.784969, 4, 0, -0.5, 0.5, 0.5,
-4.049588, -3.784969, 4, 1, -0.5, 0.5, 0.5,
-4.049588, -3.784969, 4, 1, 1.5, 0.5, 0.5,
-4.049588, -3.784969, 4, 0, 1.5, 0.5, 0.5
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
-3.540346, -3.309695, -5.441425,
-3.540346, 3.027282, -5.441425,
-3.540346, -3.309695, 5.625371,
-3.540346, 3.027282, 5.625371,
-3.540346, -3.309695, -5.441425,
-3.540346, -3.309695, 5.625371,
-3.540346, 3.027282, -5.441425,
-3.540346, 3.027282, 5.625371,
-3.540346, -3.309695, -5.441425,
3.249553, -3.309695, -5.441425,
-3.540346, -3.309695, 5.625371,
3.249553, -3.309695, 5.625371,
-3.540346, 3.027282, -5.441425,
3.249553, 3.027282, -5.441425,
-3.540346, 3.027282, 5.625371,
3.249553, 3.027282, 5.625371,
3.249553, -3.309695, -5.441425,
3.249553, 3.027282, -5.441425,
3.249553, -3.309695, 5.625371,
3.249553, 3.027282, 5.625371,
3.249553, -3.309695, -5.441425,
3.249553, -3.309695, 5.625371,
3.249553, 3.027282, -5.441425,
3.249553, 3.027282, 5.625371
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
var radius = 7.714753;
var distance = 34.32381;
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
mvMatrix.translate( 0.1453964, 0.1412065, -0.09197283 );
mvMatrix.scale( 1.228493, 1.316297, 0.753727 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.32381);
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
HHDN<-read.table("HHDN.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.441464, -2.062821, -1.625257, 0, 0, 1, 1, 1,
-3.213115, -0.3440503, -1.455242, 1, 0, 0, 1, 1,
-2.83013, 0.1557803, -1.125507, 1, 0, 0, 1, 1,
-2.823956, 0.01672894, -1.54915, 1, 0, 0, 1, 1,
-2.784165, -1.073419, -3.005388, 1, 0, 0, 1, 1,
-2.78245, 0.6670588, -0.2958014, 1, 0, 0, 1, 1,
-2.671142, -2.003663, -1.768547, 0, 0, 0, 1, 1,
-2.548786, -0.2301025, -2.25772, 0, 0, 0, 1, 1,
-2.456401, 1.863779, -0.2855196, 0, 0, 0, 1, 1,
-2.431365, 0.5515174, -0.9954478, 0, 0, 0, 1, 1,
-2.365006, -1.985944, -3.320957, 0, 0, 0, 1, 1,
-2.27051, -0.4926204, -2.845025, 0, 0, 0, 1, 1,
-2.263116, -1.58346, -2.907251, 0, 0, 0, 1, 1,
-2.23244, 0.6403645, -1.769714, 1, 1, 1, 1, 1,
-2.226343, 0.4211906, 0.01955588, 1, 1, 1, 1, 1,
-2.164985, 0.9054968, -0.9810314, 1, 1, 1, 1, 1,
-2.112154, 1.256959, -1.826319, 1, 1, 1, 1, 1,
-2.061236, -0.4704869, -0.9396541, 1, 1, 1, 1, 1,
-2.050075, 0.5530438, -1.989393, 1, 1, 1, 1, 1,
-2.03991, 0.1665633, -1.53367, 1, 1, 1, 1, 1,
-1.998804, 0.4792064, -0.3818975, 1, 1, 1, 1, 1,
-1.981481, -0.8767698, -3.793204, 1, 1, 1, 1, 1,
-1.942786, -2.299236, -3.482108, 1, 1, 1, 1, 1,
-1.938512, -0.2385841, -1.106477, 1, 1, 1, 1, 1,
-1.935796, 0.8732256, -0.9155062, 1, 1, 1, 1, 1,
-1.93049, 1.107202, -0.8378422, 1, 1, 1, 1, 1,
-1.909701, -0.05846252, -2.122344, 1, 1, 1, 1, 1,
-1.898394, 0.9834757, -0.5845845, 1, 1, 1, 1, 1,
-1.886868, -0.6903113, -3.10841, 0, 0, 1, 1, 1,
-1.886261, 0.9454808, -2.078481, 1, 0, 0, 1, 1,
-1.882127, 0.8568299, -0.8950419, 1, 0, 0, 1, 1,
-1.804585, -0.8398608, -1.220906, 1, 0, 0, 1, 1,
-1.797754, 0.2472038, -2.207652, 1, 0, 0, 1, 1,
-1.781637, -2.092749, -1.802541, 1, 0, 0, 1, 1,
-1.759936, -0.5876277, -3.352838, 0, 0, 0, 1, 1,
-1.748152, 1.819332, 0.8729171, 0, 0, 0, 1, 1,
-1.733773, -0.1962983, -3.327823, 0, 0, 0, 1, 1,
-1.717544, -0.6118983, -1.583371, 0, 0, 0, 1, 1,
-1.715679, -2.028727, -1.322794, 0, 0, 0, 1, 1,
-1.691864, -1.023635, -4.727548, 0, 0, 0, 1, 1,
-1.678006, 0.7837597, -1.529533, 0, 0, 0, 1, 1,
-1.669086, 1.705706, -1.670658, 1, 1, 1, 1, 1,
-1.636527, -0.425263, -0.8662958, 1, 1, 1, 1, 1,
-1.630908, 1.619973, -0.2808441, 1, 1, 1, 1, 1,
-1.617512, -0.8811551, -1.307635, 1, 1, 1, 1, 1,
-1.580992, -0.5175076, -1.230414, 1, 1, 1, 1, 1,
-1.578383, -0.3436247, -1.756368, 1, 1, 1, 1, 1,
-1.5732, -0.4104778, -1.326557, 1, 1, 1, 1, 1,
-1.572261, -2.144377, -2.905128, 1, 1, 1, 1, 1,
-1.565487, -2.079329, -2.533971, 1, 1, 1, 1, 1,
-1.560417, 1.446667, 0.06202184, 1, 1, 1, 1, 1,
-1.547514, -1.120037, -2.883361, 1, 1, 1, 1, 1,
-1.547245, -0.2372714, -1.814149, 1, 1, 1, 1, 1,
-1.540658, -0.3006255, -1.047063, 1, 1, 1, 1, 1,
-1.532797, -0.2321891, -2.126311, 1, 1, 1, 1, 1,
-1.530511, -1.215916, -2.085871, 1, 1, 1, 1, 1,
-1.527282, 1.104318, -1.548764, 0, 0, 1, 1, 1,
-1.501938, 0.8751763, -1.518397, 1, 0, 0, 1, 1,
-1.476993, -0.9582849, -1.500939, 1, 0, 0, 1, 1,
-1.457469, 0.2029865, -0.6492194, 1, 0, 0, 1, 1,
-1.456071, -1.315058, -2.015554, 1, 0, 0, 1, 1,
-1.455073, -0.8827399, -3.558367, 1, 0, 0, 1, 1,
-1.432786, -3.003403, -1.778775, 0, 0, 0, 1, 1,
-1.424949, 1.259374, -2.37345, 0, 0, 0, 1, 1,
-1.420344, -0.7666968, -1.654942, 0, 0, 0, 1, 1,
-1.418387, -0.6702575, -1.060216, 0, 0, 0, 1, 1,
-1.416905, -0.6749899, -2.101413, 0, 0, 0, 1, 1,
-1.412539, -0.5828358, -2.627788, 0, 0, 0, 1, 1,
-1.394219, 1.532099, -2.409153, 0, 0, 0, 1, 1,
-1.385092, -0.3323202, -1.89977, 1, 1, 1, 1, 1,
-1.378961, 0.6914122, -2.311637, 1, 1, 1, 1, 1,
-1.37267, -1.021209, -2.417908, 1, 1, 1, 1, 1,
-1.36717, -0.01385187, -2.275665, 1, 1, 1, 1, 1,
-1.366179, 1.548931, 1.762712, 1, 1, 1, 1, 1,
-1.334387, 1.796967, -0.3871814, 1, 1, 1, 1, 1,
-1.333128, -0.06591419, -1.799023, 1, 1, 1, 1, 1,
-1.332818, -0.6339605, -1.83564, 1, 1, 1, 1, 1,
-1.320738, -0.1697768, -0.2170349, 1, 1, 1, 1, 1,
-1.314492, -0.6377261, -2.825831, 1, 1, 1, 1, 1,
-1.303015, 0.3206117, -2.147137, 1, 1, 1, 1, 1,
-1.300871, -1.776738, -0.7985275, 1, 1, 1, 1, 1,
-1.289217, 1.478247, 0.01786865, 1, 1, 1, 1, 1,
-1.288063, -0.9135919, -1.166304, 1, 1, 1, 1, 1,
-1.283935, -0.9101958, -3.336412, 1, 1, 1, 1, 1,
-1.2794, -1.140345, -2.042522, 0, 0, 1, 1, 1,
-1.278213, 0.6978636, -1.190721, 1, 0, 0, 1, 1,
-1.264325, 0.009798689, -2.104021, 1, 0, 0, 1, 1,
-1.259808, -0.7668864, -2.979742, 1, 0, 0, 1, 1,
-1.2541, 1.152671, -0.3316791, 1, 0, 0, 1, 1,
-1.253962, 0.3876335, 0.1105164, 1, 0, 0, 1, 1,
-1.249951, -1.518464, -2.548134, 0, 0, 0, 1, 1,
-1.244308, -0.1195501, -0.3529716, 0, 0, 0, 1, 1,
-1.235559, -0.7063189, -0.1724213, 0, 0, 0, 1, 1,
-1.230763, -0.7852693, -0.6639774, 0, 0, 0, 1, 1,
-1.229031, -0.3994713, -2.420979, 0, 0, 0, 1, 1,
-1.226161, -1.23986, -2.775203, 0, 0, 0, 1, 1,
-1.224031, 2.01877, 0.1046313, 0, 0, 0, 1, 1,
-1.210357, -0.02319514, -2.41848, 1, 1, 1, 1, 1,
-1.203736, 1.159588, 0.4103288, 1, 1, 1, 1, 1,
-1.201331, -0.8268037, -1.990936, 1, 1, 1, 1, 1,
-1.198594, -0.7844782, -2.715919, 1, 1, 1, 1, 1,
-1.196681, 1.058566, -0.7530769, 1, 1, 1, 1, 1,
-1.194375, 0.4377694, -1.682371, 1, 1, 1, 1, 1,
-1.182111, -0.496755, -1.616589, 1, 1, 1, 1, 1,
-1.176861, -1.05421, -2.793252, 1, 1, 1, 1, 1,
-1.1752, 1.114754, 0.1493185, 1, 1, 1, 1, 1,
-1.173913, -0.8973509, -3.505951, 1, 1, 1, 1, 1,
-1.172644, -0.5770297, -3.071139, 1, 1, 1, 1, 1,
-1.169093, -1.256318, -2.623703, 1, 1, 1, 1, 1,
-1.168934, -2.230656, -2.10521, 1, 1, 1, 1, 1,
-1.159926, -0.4516128, -0.2063744, 1, 1, 1, 1, 1,
-1.157334, -0.1756231, -1.605702, 1, 1, 1, 1, 1,
-1.156639, 0.8786184, 0.2989978, 0, 0, 1, 1, 1,
-1.148484, -1.231423, -2.406575, 1, 0, 0, 1, 1,
-1.140987, 0.2687098, -1.574076, 1, 0, 0, 1, 1,
-1.137431, -0.4814934, -2.213282, 1, 0, 0, 1, 1,
-1.13154, -0.9758083, -4.559515, 1, 0, 0, 1, 1,
-1.122026, 1.046217, -0.6656471, 1, 0, 0, 1, 1,
-1.112342, 0.2508115, -0.1460632, 0, 0, 0, 1, 1,
-1.111413, 1.104571, -2.112861, 0, 0, 0, 1, 1,
-1.099992, -0.7459869, -2.777567, 0, 0, 0, 1, 1,
-1.088971, 0.9004132, -2.295918, 0, 0, 0, 1, 1,
-1.07951, 0.2565715, -0.5795968, 0, 0, 0, 1, 1,
-1.077084, -0.3670792, -0.567867, 0, 0, 0, 1, 1,
-1.063279, 0.4478592, -3.640965, 0, 0, 0, 1, 1,
-1.05641, 1.024817, -0.9450285, 1, 1, 1, 1, 1,
-1.052247, -2.107507, -4.091646, 1, 1, 1, 1, 1,
-1.04893, -0.1014263, -1.269151, 1, 1, 1, 1, 1,
-1.035864, -1.128204, -1.792925, 1, 1, 1, 1, 1,
-1.035672, 0.7758533, -2.500476, 1, 1, 1, 1, 1,
-1.034997, -2.066991, -2.492955, 1, 1, 1, 1, 1,
-1.031306, -0.07326525, -1.152291, 1, 1, 1, 1, 1,
-1.026595, 0.001600106, -1.193981, 1, 1, 1, 1, 1,
-1.023058, 2.190002, 1.086891, 1, 1, 1, 1, 1,
-1.020675, -1.182803, -1.66652, 1, 1, 1, 1, 1,
-1.020469, -0.9425645, -1.37693, 1, 1, 1, 1, 1,
-1.016758, 0.5795852, -1.502959, 1, 1, 1, 1, 1,
-1.011549, -0.5667916, -3.282456, 1, 1, 1, 1, 1,
-1.011362, 0.781744, -2.039006, 1, 1, 1, 1, 1,
-1.00765, 0.08146401, -2.936396, 1, 1, 1, 1, 1,
-1.002082, -0.1860552, 0.03945901, 0, 0, 1, 1, 1,
-1.00155, 0.9914303, 0.3383811, 1, 0, 0, 1, 1,
-0.9999017, -0.1474943, -0.9833491, 1, 0, 0, 1, 1,
-0.9985892, -0.2755267, -0.4323217, 1, 0, 0, 1, 1,
-0.9985457, -1.185212, -3.555277, 1, 0, 0, 1, 1,
-0.9900323, 0.1046137, -0.8472294, 1, 0, 0, 1, 1,
-0.9862942, 0.1400665, -1.701004, 0, 0, 0, 1, 1,
-0.9850786, 0.8456445, -0.5668489, 0, 0, 0, 1, 1,
-0.9817111, -0.359178, -2.723993, 0, 0, 0, 1, 1,
-0.9802768, 1.21522, -1.17274, 0, 0, 0, 1, 1,
-0.9781268, -1.125834, -2.058934, 0, 0, 0, 1, 1,
-0.9752507, 0.3559967, 0.01882982, 0, 0, 0, 1, 1,
-0.9701571, 1.380593, -1.065718, 0, 0, 0, 1, 1,
-0.9621499, -1.271048, -2.335423, 1, 1, 1, 1, 1,
-0.9615552, 0.4152129, -1.737104, 1, 1, 1, 1, 1,
-0.9577665, -0.6490016, -1.275886, 1, 1, 1, 1, 1,
-0.9571605, 0.7614188, -2.349158, 1, 1, 1, 1, 1,
-0.9543566, 0.1719236, -0.1423946, 1, 1, 1, 1, 1,
-0.9513604, -1.902264, -2.764036, 1, 1, 1, 1, 1,
-0.9486412, 0.5637257, -0.4083281, 1, 1, 1, 1, 1,
-0.9470334, -1.560659, -2.144995, 1, 1, 1, 1, 1,
-0.946171, 0.5887954, -0.5405102, 1, 1, 1, 1, 1,
-0.9439871, -0.3944304, -2.469425, 1, 1, 1, 1, 1,
-0.9410158, 0.1219153, -0.7858965, 1, 1, 1, 1, 1,
-0.9404538, -0.928827, -2.052042, 1, 1, 1, 1, 1,
-0.938802, -0.07314546, -3.097644, 1, 1, 1, 1, 1,
-0.9298393, -0.9436729, -1.830799, 1, 1, 1, 1, 1,
-0.9226699, -0.005638279, -2.042806, 1, 1, 1, 1, 1,
-0.9225909, 0.7000248, -1.315824, 0, 0, 1, 1, 1,
-0.9220816, -0.07529027, -2.441323, 1, 0, 0, 1, 1,
-0.9217495, 0.8188834, 0.2128809, 1, 0, 0, 1, 1,
-0.920673, 0.8402468, -0.9008809, 1, 0, 0, 1, 1,
-0.9202458, 0.4765099, -1.009564, 1, 0, 0, 1, 1,
-0.906647, -0.1206047, -2.318463, 1, 0, 0, 1, 1,
-0.9049675, 1.413679, -2.308798, 0, 0, 0, 1, 1,
-0.896135, -1.206362, -2.886512, 0, 0, 0, 1, 1,
-0.8949203, -0.5380667, -2.763747, 0, 0, 0, 1, 1,
-0.8926229, 2.097615, -0.5460262, 0, 0, 0, 1, 1,
-0.8820279, 1.490777, 0.3179086, 0, 0, 0, 1, 1,
-0.8765697, 1.123418, -1.932662, 0, 0, 0, 1, 1,
-0.8728014, 0.2421065, -1.139078, 0, 0, 0, 1, 1,
-0.8720237, -0.1511718, -2.298755, 1, 1, 1, 1, 1,
-0.8714096, -0.06390569, -1.423524, 1, 1, 1, 1, 1,
-0.8669756, 0.2394307, -4.351617, 1, 1, 1, 1, 1,
-0.8577331, 0.9550539, -2.142166, 1, 1, 1, 1, 1,
-0.8565439, 1.021717, -0.5558999, 1, 1, 1, 1, 1,
-0.8550705, 0.2970576, -1.639002, 1, 1, 1, 1, 1,
-0.8480203, -0.8169538, -2.506365, 1, 1, 1, 1, 1,
-0.846418, 1.019163, -0.5742807, 1, 1, 1, 1, 1,
-0.8441452, -0.6772694, -0.4794345, 1, 1, 1, 1, 1,
-0.8425678, -0.3246989, -1.073174, 1, 1, 1, 1, 1,
-0.8391383, 0.08414972, -0.2325015, 1, 1, 1, 1, 1,
-0.838933, -0.04464316, -1.48518, 1, 1, 1, 1, 1,
-0.8358858, 0.4748628, -2.908025, 1, 1, 1, 1, 1,
-0.8320484, 1.051733, -0.3537643, 1, 1, 1, 1, 1,
-0.8223296, -1.464183, -3.620157, 1, 1, 1, 1, 1,
-0.8204817, 1.136331, -1.957242, 0, 0, 1, 1, 1,
-0.8188196, 0.03221362, -2.183344, 1, 0, 0, 1, 1,
-0.8186803, 0.4714622, 0.7869236, 1, 0, 0, 1, 1,
-0.8092684, 0.3773224, -1.767781, 1, 0, 0, 1, 1,
-0.8061032, 1.690973, -0.4019693, 1, 0, 0, 1, 1,
-0.8045498, -0.6165472, -1.484148, 1, 0, 0, 1, 1,
-0.8043666, 0.011018, -1.897797, 0, 0, 0, 1, 1,
-0.8000793, -0.6829905, -1.222841, 0, 0, 0, 1, 1,
-0.7977631, -0.393389, -1.122429, 0, 0, 0, 1, 1,
-0.7921781, -1.334414, -2.46322, 0, 0, 0, 1, 1,
-0.7871957, -0.1192991, -1.871047, 0, 0, 0, 1, 1,
-0.7851979, 1.3116, -0.01327831, 0, 0, 0, 1, 1,
-0.7847354, 1.101878, -2.490582, 0, 0, 0, 1, 1,
-0.7819855, -1.113334, -1.888724, 1, 1, 1, 1, 1,
-0.7803059, -0.213846, -2.866594, 1, 1, 1, 1, 1,
-0.779967, 1.753137, -4.239795, 1, 1, 1, 1, 1,
-0.776149, 0.05697868, -1.367511, 1, 1, 1, 1, 1,
-0.7736977, 0.151392, -1.6096, 1, 1, 1, 1, 1,
-0.7719263, -0.5247183, -2.621557, 1, 1, 1, 1, 1,
-0.7703347, 0.9318161, 1.492507, 1, 1, 1, 1, 1,
-0.7656738, -1.346552, -3.475258, 1, 1, 1, 1, 1,
-0.7551672, 0.446429, 0.2640692, 1, 1, 1, 1, 1,
-0.7547155, -0.7554111, -1.819052, 1, 1, 1, 1, 1,
-0.7446812, -0.06221871, -2.014176, 1, 1, 1, 1, 1,
-0.741591, -1.129704, -3.053683, 1, 1, 1, 1, 1,
-0.7364946, 0.9575419, -1.001099, 1, 1, 1, 1, 1,
-0.7352689, 0.6561307, -0.7170459, 1, 1, 1, 1, 1,
-0.7322919, -0.02281528, -2.294193, 1, 1, 1, 1, 1,
-0.7291256, 0.4049987, -1.699601, 0, 0, 1, 1, 1,
-0.7259451, -1.652313, -2.813391, 1, 0, 0, 1, 1,
-0.7235901, 0.02690724, -2.994088, 1, 0, 0, 1, 1,
-0.7174144, 0.9076238, -2.557525, 1, 0, 0, 1, 1,
-0.7161259, 0.5823259, -0.6096043, 1, 0, 0, 1, 1,
-0.7126379, -0.8377705, -2.182358, 1, 0, 0, 1, 1,
-0.7125889, -0.7700686, -1.143148, 0, 0, 0, 1, 1,
-0.7115276, -1.29505, -2.699599, 0, 0, 0, 1, 1,
-0.6990347, -0.7548851, -3.826799, 0, 0, 0, 1, 1,
-0.6986213, -1.382418, -2.80414, 0, 0, 0, 1, 1,
-0.6966061, 0.9374196, -1.572242, 0, 0, 0, 1, 1,
-0.6937822, -1.160617, -2.031878, 0, 0, 0, 1, 1,
-0.6926628, 0.3510846, 1.478212, 0, 0, 0, 1, 1,
-0.6874723, 0.3539169, -1.934942, 1, 1, 1, 1, 1,
-0.6872167, 1.063646, -2.06407, 1, 1, 1, 1, 1,
-0.684401, 0.8080382, -0.9175953, 1, 1, 1, 1, 1,
-0.6842605, -1.731416, -2.741046, 1, 1, 1, 1, 1,
-0.683516, 0.2207532, -2.329706, 1, 1, 1, 1, 1,
-0.6769033, 0.3359234, -1.597899, 1, 1, 1, 1, 1,
-0.6726227, -1.376062, -1.530359, 1, 1, 1, 1, 1,
-0.6682122, 0.4061941, -0.549597, 1, 1, 1, 1, 1,
-0.6675314, 1.477106, -0.6847755, 1, 1, 1, 1, 1,
-0.6651528, -0.6023192, -2.885754, 1, 1, 1, 1, 1,
-0.6617309, 0.6997276, -0.2221024, 1, 1, 1, 1, 1,
-0.6610934, -0.2923889, -1.024158, 1, 1, 1, 1, 1,
-0.6595185, 0.374913, -2.89133, 1, 1, 1, 1, 1,
-0.6593254, -1.987162, -1.958442, 1, 1, 1, 1, 1,
-0.6586543, 0.7947553, -1.686168, 1, 1, 1, 1, 1,
-0.6553869, 0.9302339, -2.008696, 0, 0, 1, 1, 1,
-0.6498948, -1.512479, -4.135408, 1, 0, 0, 1, 1,
-0.6400197, 0.6352883, 0.1274479, 1, 0, 0, 1, 1,
-0.6353891, -0.7456399, -1.418389, 1, 0, 0, 1, 1,
-0.6353603, -1.103305, -2.383264, 1, 0, 0, 1, 1,
-0.6323271, -1.644148, -1.448692, 1, 0, 0, 1, 1,
-0.6296141, -0.7434829, -2.709208, 0, 0, 0, 1, 1,
-0.6240883, -0.006172708, -2.802079, 0, 0, 0, 1, 1,
-0.6215813, -0.6400953, -2.921608, 0, 0, 0, 1, 1,
-0.6200199, 0.3011686, -1.223624, 0, 0, 0, 1, 1,
-0.6194827, -0.06902128, -0.4908518, 0, 0, 0, 1, 1,
-0.61218, -0.8938516, -2.431204, 0, 0, 0, 1, 1,
-0.6107753, 0.09401558, -0.7053506, 0, 0, 0, 1, 1,
-0.6063079, -0.1068875, -3.916484, 1, 1, 1, 1, 1,
-0.6027235, -0.8995615, -1.908229, 1, 1, 1, 1, 1,
-0.599861, 0.1884967, -1.697139, 1, 1, 1, 1, 1,
-0.5975767, -0.8633258, -3.713854, 1, 1, 1, 1, 1,
-0.5939636, 0.9907807, -1.815476, 1, 1, 1, 1, 1,
-0.5907139, -0.7474393, -1.784183, 1, 1, 1, 1, 1,
-0.5896815, -0.3916681, -0.5725415, 1, 1, 1, 1, 1,
-0.5895023, -0.8784546, -2.160346, 1, 1, 1, 1, 1,
-0.5877655, -0.1646038, -1.785316, 1, 1, 1, 1, 1,
-0.5807168, -1.434433, -3.087954, 1, 1, 1, 1, 1,
-0.5803692, 0.03574919, -1.848041, 1, 1, 1, 1, 1,
-0.576793, -1.520517, -1.176189, 1, 1, 1, 1, 1,
-0.5718473, 0.311815, -0.05025789, 1, 1, 1, 1, 1,
-0.5674739, -0.5426076, -1.816658, 1, 1, 1, 1, 1,
-0.5672664, 0.09018611, -1.594713, 1, 1, 1, 1, 1,
-0.5643203, 1.684631, 0.221505, 0, 0, 1, 1, 1,
-0.5638624, 0.6688589, 0.09860941, 1, 0, 0, 1, 1,
-0.5600602, -0.9233648, -2.169045, 1, 0, 0, 1, 1,
-0.5550746, -0.05730635, -1.156375, 1, 0, 0, 1, 1,
-0.5544874, -0.6018732, -3.85006, 1, 0, 0, 1, 1,
-0.5513838, -0.7888231, -1.697826, 1, 0, 0, 1, 1,
-0.55005, 0.04126677, -2.362057, 0, 0, 0, 1, 1,
-0.53747, -0.4548716, 0.2346228, 0, 0, 0, 1, 1,
-0.5352094, -0.938182, -3.432774, 0, 0, 0, 1, 1,
-0.532557, 0.209046, -0.6272739, 0, 0, 0, 1, 1,
-0.5316088, 1.036814, 1.381384, 0, 0, 0, 1, 1,
-0.529857, -0.3071175, -1.43487, 0, 0, 0, 1, 1,
-0.5277821, 0.2891556, -1.391286, 0, 0, 0, 1, 1,
-0.527572, -0.2453806, -2.744098, 1, 1, 1, 1, 1,
-0.5251848, 0.3892289, 0.6698781, 1, 1, 1, 1, 1,
-0.5153865, -1.487684, -2.814211, 1, 1, 1, 1, 1,
-0.5150748, 0.8032683, 0.4472044, 1, 1, 1, 1, 1,
-0.5115105, 0.1248627, -2.897811, 1, 1, 1, 1, 1,
-0.5077597, 0.6700085, -1.791341, 1, 1, 1, 1, 1,
-0.5072684, -1.086771, -2.739063, 1, 1, 1, 1, 1,
-0.506285, -1.884269, -1.820094, 1, 1, 1, 1, 1,
-0.503908, -1.103258, -0.553742, 1, 1, 1, 1, 1,
-0.5015706, -1.87842, -3.94624, 1, 1, 1, 1, 1,
-0.5008337, 0.5729412, -0.5712779, 1, 1, 1, 1, 1,
-0.497711, 0.7820556, -0.8839819, 1, 1, 1, 1, 1,
-0.493794, -0.06935118, -1.302897, 1, 1, 1, 1, 1,
-0.4894278, 0.5534918, 0.4248685, 1, 1, 1, 1, 1,
-0.4861564, -0.1575685, -0.7502176, 1, 1, 1, 1, 1,
-0.4741103, 0.759721, -1.553396, 0, 0, 1, 1, 1,
-0.4708856, 0.1700716, -0.6247975, 1, 0, 0, 1, 1,
-0.4700451, -0.2788024, -1.503848, 1, 0, 0, 1, 1,
-0.4695654, 0.1780989, -1.241182, 1, 0, 0, 1, 1,
-0.4632148, 2.67175, -0.06275029, 1, 0, 0, 1, 1,
-0.4557411, 0.5775289, -0.9175594, 1, 0, 0, 1, 1,
-0.4465238, 1.673355, -0.4319158, 0, 0, 0, 1, 1,
-0.443678, 0.9210194, 0.557084, 0, 0, 0, 1, 1,
-0.4434064, -0.1778095, -1.853316, 0, 0, 0, 1, 1,
-0.4405989, -0.4080396, -3.149263, 0, 0, 0, 1, 1,
-0.4389431, 1.484164, -1.239269, 0, 0, 0, 1, 1,
-0.4368344, 1.514998, -1.22586, 0, 0, 0, 1, 1,
-0.4338505, -0.1370322, -0.08309886, 0, 0, 0, 1, 1,
-0.4321063, 1.054537, 0.608776, 1, 1, 1, 1, 1,
-0.4316235, -0.04898874, -2.546045, 1, 1, 1, 1, 1,
-0.4295801, 0.09822119, -2.075247, 1, 1, 1, 1, 1,
-0.4217904, -1.215694, -2.503285, 1, 1, 1, 1, 1,
-0.4188898, -0.4014563, -3.027375, 1, 1, 1, 1, 1,
-0.417833, -2.268457, -2.70463, 1, 1, 1, 1, 1,
-0.4170314, 1.023704, 1.822816, 1, 1, 1, 1, 1,
-0.4137992, -0.4293857, -3.033124, 1, 1, 1, 1, 1,
-0.4128495, -0.3958572, -0.7291118, 1, 1, 1, 1, 1,
-0.4124009, 0.844435, 1.491132, 1, 1, 1, 1, 1,
-0.4101225, -1.003275, -4.134455, 1, 1, 1, 1, 1,
-0.405545, 0.669506, 0.31512, 1, 1, 1, 1, 1,
-0.4049661, 0.7206116, -0.2921271, 1, 1, 1, 1, 1,
-0.4042502, 1.052939, 0.653219, 1, 1, 1, 1, 1,
-0.3975222, -0.1894828, -3.612697, 1, 1, 1, 1, 1,
-0.3962, 1.087017, -1.440879, 0, 0, 1, 1, 1,
-0.3933219, -0.5495926, -3.363148, 1, 0, 0, 1, 1,
-0.3905838, -0.5801544, -3.974236, 1, 0, 0, 1, 1,
-0.3853462, 0.05313161, -0.218202, 1, 0, 0, 1, 1,
-0.3811263, 0.6069826, -1.720617, 1, 0, 0, 1, 1,
-0.3793759, 0.006457302, -2.040672, 1, 0, 0, 1, 1,
-0.3725547, -0.6744202, -2.477911, 0, 0, 0, 1, 1,
-0.3708225, 0.1088561, -3.724112, 0, 0, 0, 1, 1,
-0.3700959, -0.9358415, -1.919013, 0, 0, 0, 1, 1,
-0.3693261, -0.7963412, -3.951593, 0, 0, 0, 1, 1,
-0.369303, -0.9276524, -2.59008, 0, 0, 0, 1, 1,
-0.3658113, 1.409778, -0.3098803, 0, 0, 0, 1, 1,
-0.3583119, 0.829714, -1.854075, 0, 0, 0, 1, 1,
-0.3560951, 0.6066646, -0.5900527, 1, 1, 1, 1, 1,
-0.3470449, 0.7213303, 0.1266371, 1, 1, 1, 1, 1,
-0.3449555, 1.275671, -0.5499059, 1, 1, 1, 1, 1,
-0.3438592, -0.2868163, -3.958098, 1, 1, 1, 1, 1,
-0.341621, 1.84642, 0.6007733, 1, 1, 1, 1, 1,
-0.3414434, -0.9638837, -2.693561, 1, 1, 1, 1, 1,
-0.3406247, 0.6329264, -0.2335281, 1, 1, 1, 1, 1,
-0.3335903, -1.603648, -1.329258, 1, 1, 1, 1, 1,
-0.3331363, -2.447187, -1.909734, 1, 1, 1, 1, 1,
-0.3284133, -0.5509682, -2.929103, 1, 1, 1, 1, 1,
-0.3271704, -0.4318109, -2.913801, 1, 1, 1, 1, 1,
-0.3170873, 0.01991059, -0.9401928, 1, 1, 1, 1, 1,
-0.3138258, 0.09256809, -1.401359, 1, 1, 1, 1, 1,
-0.3128273, -1.355748, -2.069732, 1, 1, 1, 1, 1,
-0.3062407, -0.7145845, -2.692196, 1, 1, 1, 1, 1,
-0.3055085, 0.439263, -0.8894328, 0, 0, 1, 1, 1,
-0.3019985, 0.2719221, -0.5819188, 1, 0, 0, 1, 1,
-0.3011414, -0.2457634, -1.434813, 1, 0, 0, 1, 1,
-0.2970943, 0.2390259, -0.2718053, 1, 0, 0, 1, 1,
-0.2911821, 0.9390837, -0.4192151, 1, 0, 0, 1, 1,
-0.2891935, -0.8860341, -1.500023, 1, 0, 0, 1, 1,
-0.2830696, -0.7454994, -4.545149, 0, 0, 0, 1, 1,
-0.2827213, 0.01439335, -1.062086, 0, 0, 0, 1, 1,
-0.2817618, 0.4443394, 0.1903217, 0, 0, 0, 1, 1,
-0.2792813, 0.5594299, 0.01220961, 0, 0, 0, 1, 1,
-0.274477, -1.543299, -3.977536, 0, 0, 0, 1, 1,
-0.2733752, 0.4725558, 0.6117998, 0, 0, 0, 1, 1,
-0.269265, 0.4987103, -0.2388927, 0, 0, 0, 1, 1,
-0.2682998, -0.05775312, -2.044093, 1, 1, 1, 1, 1,
-0.2678205, 0.3427867, -0.0001040356, 1, 1, 1, 1, 1,
-0.2656578, 1.720146, -0.6097659, 1, 1, 1, 1, 1,
-0.2613494, -1.403748, -4.365328, 1, 1, 1, 1, 1,
-0.2592559, -0.0919887, -1.738621, 1, 1, 1, 1, 1,
-0.2537006, 0.3421576, 0.2099086, 1, 1, 1, 1, 1,
-0.2524263, -1.042175, -2.988125, 1, 1, 1, 1, 1,
-0.2507859, -0.606447, -3.792494, 1, 1, 1, 1, 1,
-0.2498207, 1.190456, 0.8792226, 1, 1, 1, 1, 1,
-0.2492799, 1.693026, 1.642726, 1, 1, 1, 1, 1,
-0.2490268, 1.639263, 1.739348, 1, 1, 1, 1, 1,
-0.2410518, -1.624247, -2.240446, 1, 1, 1, 1, 1,
-0.2366229, -0.435872, -3.035241, 1, 1, 1, 1, 1,
-0.2352109, 1.056194, -0.4285519, 1, 1, 1, 1, 1,
-0.2316422, -0.2496912, -1.742542, 1, 1, 1, 1, 1,
-0.2299758, -0.9229416, -1.78449, 0, 0, 1, 1, 1,
-0.2291852, 0.9626243, -0.7178673, 1, 0, 0, 1, 1,
-0.2288417, 1.69897, -0.1946422, 1, 0, 0, 1, 1,
-0.2272485, -0.8514799, -3.993735, 1, 0, 0, 1, 1,
-0.2260145, -0.4547971, -3.356083, 1, 0, 0, 1, 1,
-0.2245912, 0.8711232, -0.6756778, 1, 0, 0, 1, 1,
-0.2235174, 0.7094781, -2.075632, 0, 0, 0, 1, 1,
-0.216593, -1.163064, -2.349953, 0, 0, 0, 1, 1,
-0.2127041, -0.6142562, -4.2405, 0, 0, 0, 1, 1,
-0.2000795, -0.9478456, -2.236994, 0, 0, 0, 1, 1,
-0.1985829, -0.2006495, -4.520567, 0, 0, 0, 1, 1,
-0.197765, -0.8037738, -3.89011, 0, 0, 0, 1, 1,
-0.195636, 0.4048603, -0.278633, 0, 0, 0, 1, 1,
-0.186936, -1.015485, -3.023115, 1, 1, 1, 1, 1,
-0.1863456, 0.5929927, 0.04645799, 1, 1, 1, 1, 1,
-0.185966, -0.06344766, -3.088005, 1, 1, 1, 1, 1,
-0.1857142, 0.4546103, -1.050514, 1, 1, 1, 1, 1,
-0.1849449, -0.6636467, -1.863221, 1, 1, 1, 1, 1,
-0.1812111, 1.331919, 0.2562382, 1, 1, 1, 1, 1,
-0.1767031, 0.0538743, -0.8958377, 1, 1, 1, 1, 1,
-0.1757144, 0.3340781, -0.01759884, 1, 1, 1, 1, 1,
-0.1732951, -1.240406, -2.983253, 1, 1, 1, 1, 1,
-0.1715231, 0.9322357, 1.877705, 1, 1, 1, 1, 1,
-0.1715105, -0.4608995, -1.133856, 1, 1, 1, 1, 1,
-0.1701394, -0.3344606, -1.424042, 1, 1, 1, 1, 1,
-0.1691613, -0.2297523, -2.0314, 1, 1, 1, 1, 1,
-0.1614465, 0.4986764, -0.8330109, 1, 1, 1, 1, 1,
-0.1588108, -0.1777082, -2.289273, 1, 1, 1, 1, 1,
-0.1558933, -1.682084, -2.336854, 0, 0, 1, 1, 1,
-0.1548196, 0.7415155, -0.822484, 1, 0, 0, 1, 1,
-0.1496201, -0.9302167, -3.960418, 1, 0, 0, 1, 1,
-0.1491923, 0.2915381, -2.666592, 1, 0, 0, 1, 1,
-0.1467469, -0.9694295, -3.149434, 1, 0, 0, 1, 1,
-0.1450361, 0.1752339, 1.1147, 1, 0, 0, 1, 1,
-0.143704, -1.104895, -1.760074, 0, 0, 0, 1, 1,
-0.14358, -0.687442, -3.091718, 0, 0, 0, 1, 1,
-0.1357515, 0.9917744, -0.1330121, 0, 0, 0, 1, 1,
-0.1335229, -2.034321, -5.280258, 0, 0, 0, 1, 1,
-0.1290402, -0.359136, -4.054596, 0, 0, 0, 1, 1,
-0.1270646, -0.458418, -3.127167, 0, 0, 0, 1, 1,
-0.12126, 0.7045862, 0.4307561, 0, 0, 0, 1, 1,
-0.1212277, 0.04597323, -2.682573, 1, 1, 1, 1, 1,
-0.1210143, -0.7982755, -2.674949, 1, 1, 1, 1, 1,
-0.1205012, 0.3539718, -0.7161388, 1, 1, 1, 1, 1,
-0.1204737, -0.640225, -3.871434, 1, 1, 1, 1, 1,
-0.1200797, 0.5199421, 0.6603777, 1, 1, 1, 1, 1,
-0.119753, -0.2576506, -3.042759, 1, 1, 1, 1, 1,
-0.1142749, 2.359441, -0.3195633, 1, 1, 1, 1, 1,
-0.1134899, 0.3802419, 0.6317632, 1, 1, 1, 1, 1,
-0.1102088, 1.875653, -0.4939764, 1, 1, 1, 1, 1,
-0.1047412, -0.137198, -3.201218, 1, 1, 1, 1, 1,
-0.1038222, 0.5582898, 1.686763, 1, 1, 1, 1, 1,
-0.1021298, -0.4722163, -4.995422, 1, 1, 1, 1, 1,
-0.09762654, -0.2827274, -4.004946, 1, 1, 1, 1, 1,
-0.09562071, 0.1651343, -2.072106, 1, 1, 1, 1, 1,
-0.09469926, -1.780681, -1.770215, 1, 1, 1, 1, 1,
-0.09393293, 0.8424738, -1.516472, 0, 0, 1, 1, 1,
-0.09075634, -0.6093367, -2.237217, 1, 0, 0, 1, 1,
-0.0898507, 0.7309753, 0.8887794, 1, 0, 0, 1, 1,
-0.08969613, -0.7720215, -1.860649, 1, 0, 0, 1, 1,
-0.08955099, -0.6544436, -3.673241, 1, 0, 0, 1, 1,
-0.079603, 0.745535, 0.8804466, 1, 0, 0, 1, 1,
-0.07644832, 1.116649, 0.5978578, 0, 0, 0, 1, 1,
-0.07567255, -0.6908618, -4.685685, 0, 0, 0, 1, 1,
-0.07553931, 0.1253496, -1.407242, 0, 0, 0, 1, 1,
-0.07493813, 0.2028595, -1.270318, 0, 0, 0, 1, 1,
-0.07468522, 1.26452, -0.2229061, 0, 0, 0, 1, 1,
-0.07077283, 1.45986, 2.188787, 0, 0, 0, 1, 1,
-0.0704423, -0.570129, -2.699941, 0, 0, 0, 1, 1,
-0.06960981, 0.322056, 0.6247749, 1, 1, 1, 1, 1,
-0.06795886, 0.3866808, -0.2295563, 1, 1, 1, 1, 1,
-0.06757735, -0.527912, -3.433243, 1, 1, 1, 1, 1,
-0.06654234, -0.5301747, -2.281278, 1, 1, 1, 1, 1,
-0.06628597, -0.8394615, -4.091127, 1, 1, 1, 1, 1,
-0.06545904, 0.666463, -0.5063033, 1, 1, 1, 1, 1,
-0.06409377, -0.9193968, -2.834891, 1, 1, 1, 1, 1,
-0.05976304, 0.5540422, 0.5476882, 1, 1, 1, 1, 1,
-0.05843446, 0.07301152, 1.292211, 1, 1, 1, 1, 1,
-0.05833708, -0.2953359, -3.419493, 1, 1, 1, 1, 1,
-0.05820984, -1.375534, -1.919964, 1, 1, 1, 1, 1,
-0.05732659, -0.250591, -0.07601233, 1, 1, 1, 1, 1,
-0.05351232, 0.7149101, -0.6831726, 1, 1, 1, 1, 1,
-0.05293682, -0.7962657, -2.222361, 1, 1, 1, 1, 1,
-0.04157105, -0.4874703, -4.036309, 1, 1, 1, 1, 1,
-0.03863478, 0.3670857, 0.111777, 0, 0, 1, 1, 1,
-0.03582526, 1.065211, 1.80277, 1, 0, 0, 1, 1,
-0.02617271, 0.3828731, 0.2105844, 1, 0, 0, 1, 1,
-0.02451505, -1.154267, -3.748084, 1, 0, 0, 1, 1,
-0.0189235, 0.1893961, -0.2144293, 1, 0, 0, 1, 1,
-0.01334301, 0.5488498, 2.173856, 1, 0, 0, 1, 1,
-0.0105966, -0.7205089, -4.75561, 0, 0, 0, 1, 1,
-0.005455167, 1.078316, -0.4102192, 0, 0, 0, 1, 1,
-0.000916124, -0.8027018, -2.4593, 0, 0, 0, 1, 1,
-0.0001078722, -0.2315917, -3.643241, 0, 0, 0, 1, 1,
0.001930783, 0.03821201, 0.2815532, 0, 0, 0, 1, 1,
0.00752582, -0.03389931, 4.407413, 0, 0, 0, 1, 1,
0.01061682, 1.334312, -1.105474, 0, 0, 0, 1, 1,
0.01266871, 0.1921048, -0.1088902, 1, 1, 1, 1, 1,
0.01620867, -0.162679, 3.207032, 1, 1, 1, 1, 1,
0.01755068, -2.636415, 2.804423, 1, 1, 1, 1, 1,
0.01884737, -0.3719754, 2.312521, 1, 1, 1, 1, 1,
0.0197636, 0.06543436, 1.24673, 1, 1, 1, 1, 1,
0.02158134, 2.079931, -0.4283236, 1, 1, 1, 1, 1,
0.02507395, -0.03906506, 1.693096, 1, 1, 1, 1, 1,
0.02675083, 0.9001384, 0.6663294, 1, 1, 1, 1, 1,
0.03042802, -1.053202, 4.455945, 1, 1, 1, 1, 1,
0.03103294, -2.012414, 1.709036, 1, 1, 1, 1, 1,
0.03387637, 0.9849218, 0.690049, 1, 1, 1, 1, 1,
0.03565113, 0.6703905, 1.149966, 1, 1, 1, 1, 1,
0.03691908, -0.4268968, 3.74009, 1, 1, 1, 1, 1,
0.0376415, -0.4786702, 2.484157, 1, 1, 1, 1, 1,
0.03773544, 0.7446803, -1.2696, 1, 1, 1, 1, 1,
0.03827596, -1.179868, 3.936928, 0, 0, 1, 1, 1,
0.03918563, -0.3644069, 2.356858, 1, 0, 0, 1, 1,
0.04286982, -0.8167927, 5.464203, 1, 0, 0, 1, 1,
0.04407215, 0.5624357, -0.0119431, 1, 0, 0, 1, 1,
0.04562423, 1.005943, -0.2054569, 1, 0, 0, 1, 1,
0.04816006, -0.3987297, 1.699869, 1, 0, 0, 1, 1,
0.04905148, -1.223173, 4.491585, 0, 0, 0, 1, 1,
0.05323666, -1.145079, 2.959502, 0, 0, 0, 1, 1,
0.05460468, -0.4857894, 3.261782, 0, 0, 0, 1, 1,
0.06586925, 1.173361, 0.3203236, 0, 0, 0, 1, 1,
0.06631931, -2.182048, 2.964886, 0, 0, 0, 1, 1,
0.06662741, -0.2990913, 1.066094, 0, 0, 0, 1, 1,
0.06885228, 1.188509, 0.8132182, 0, 0, 0, 1, 1,
0.06908493, 1.106804, -1.509916, 1, 1, 1, 1, 1,
0.08025316, 1.266055, -1.033975, 1, 1, 1, 1, 1,
0.08443557, -1.166515, 4.0681, 1, 1, 1, 1, 1,
0.08455256, -0.6061059, 1.086715, 1, 1, 1, 1, 1,
0.08457961, -1.346774, 2.422467, 1, 1, 1, 1, 1,
0.08924302, -1.979708, 3.03101, 1, 1, 1, 1, 1,
0.09460759, 1.631023, -0.1633897, 1, 1, 1, 1, 1,
0.1020683, 0.647015, 0.8493603, 1, 1, 1, 1, 1,
0.1060125, -0.1614858, 3.531494, 1, 1, 1, 1, 1,
0.1109374, -1.592576, 4.566929, 1, 1, 1, 1, 1,
0.1134225, 1.29688, 1.442688, 1, 1, 1, 1, 1,
0.1154228, -0.08390982, 1.861016, 1, 1, 1, 1, 1,
0.1162222, -0.731402, 3.354718, 1, 1, 1, 1, 1,
0.1166619, 1.045288, 0.1023949, 1, 1, 1, 1, 1,
0.1189017, 0.8302336, -0.9000896, 1, 1, 1, 1, 1,
0.1193675, 0.02934778, -0.9421933, 0, 0, 1, 1, 1,
0.1215532, -0.8764947, 4.208382, 1, 0, 0, 1, 1,
0.1233334, 1.128363, 1.363379, 1, 0, 0, 1, 1,
0.1242226, -0.6771482, 2.87293, 1, 0, 0, 1, 1,
0.1269681, -0.6148708, 2.025359, 1, 0, 0, 1, 1,
0.1271371, -1.677545, 1.306954, 1, 0, 0, 1, 1,
0.1350787, 0.2480218, 0.70467, 0, 0, 0, 1, 1,
0.1375592, -1.201947, 4.294857, 0, 0, 0, 1, 1,
0.1406932, 0.407476, -0.1569026, 0, 0, 0, 1, 1,
0.1437869, -0.2529851, 2.278924, 0, 0, 0, 1, 1,
0.1452662, -2.244538, 3.833493, 0, 0, 0, 1, 1,
0.1494921, 0.7782705, 0.7216312, 0, 0, 0, 1, 1,
0.1495099, -0.1031733, 0.4219592, 0, 0, 0, 1, 1,
0.1550083, 0.812259, -0.2937221, 1, 1, 1, 1, 1,
0.1584116, 0.1436535, 1.826713, 1, 1, 1, 1, 1,
0.1621605, -1.053135, 4.621287, 1, 1, 1, 1, 1,
0.1638656, 0.2803836, 1.696831, 1, 1, 1, 1, 1,
0.1686747, 1.279626, 0.6237502, 1, 1, 1, 1, 1,
0.1724432, -1.121486, 1.816702, 1, 1, 1, 1, 1,
0.1782187, -0.0189014, 1.509577, 1, 1, 1, 1, 1,
0.1804668, 1.565661, 1.015173, 1, 1, 1, 1, 1,
0.1810368, 0.04517791, 2.373159, 1, 1, 1, 1, 1,
0.1821421, -2.142934, 3.955662, 1, 1, 1, 1, 1,
0.1835674, -0.1805795, 2.288481, 1, 1, 1, 1, 1,
0.1896696, -1.110027, 1.231235, 1, 1, 1, 1, 1,
0.1912362, 0.3843213, -1.342014, 1, 1, 1, 1, 1,
0.1919933, 0.3898368, 0.8931046, 1, 1, 1, 1, 1,
0.1925179, 1.34915, 0.2879668, 1, 1, 1, 1, 1,
0.1933246, -0.8349378, 2.799756, 0, 0, 1, 1, 1,
0.1946583, 1.570882, 0.6277609, 1, 0, 0, 1, 1,
0.2033545, 0.2956301, 0.7083118, 1, 0, 0, 1, 1,
0.2038982, 0.3886133, 1.991023, 1, 0, 0, 1, 1,
0.2086594, 0.5252583, 0.3886387, 1, 0, 0, 1, 1,
0.2111391, 0.3194308, 0.03139258, 1, 0, 0, 1, 1,
0.2125435, 0.910178, 0.8551955, 0, 0, 0, 1, 1,
0.212594, -0.9355377, 2.435704, 0, 0, 0, 1, 1,
0.2163168, 1.121959, -0.3204083, 0, 0, 0, 1, 1,
0.2181642, 0.6484947, -1.114181, 0, 0, 0, 1, 1,
0.2246965, -0.3393996, 3.027946, 0, 0, 0, 1, 1,
0.2259837, -0.3310862, 0.908964, 0, 0, 0, 1, 1,
0.229946, 0.1867868, 0.835586, 0, 0, 0, 1, 1,
0.2319456, 1.838617, -0.4488127, 1, 1, 1, 1, 1,
0.2321679, -1.197573, 2.862117, 1, 1, 1, 1, 1,
0.2328172, -1.399578, 2.492667, 1, 1, 1, 1, 1,
0.2369752, 0.8749287, 0.8751404, 1, 1, 1, 1, 1,
0.2370082, 0.3232418, 1.586304, 1, 1, 1, 1, 1,
0.2380199, 0.1119146, -1.858844, 1, 1, 1, 1, 1,
0.2390299, 1.817883, 0.9815753, 1, 1, 1, 1, 1,
0.2413358, 1.154852, -0.2498856, 1, 1, 1, 1, 1,
0.2422144, -1.318945, 3.945523, 1, 1, 1, 1, 1,
0.2433293, 1.230666, 0.6493928, 1, 1, 1, 1, 1,
0.2442798, -0.6333758, 4.167857, 1, 1, 1, 1, 1,
0.2444109, -0.1000654, 3.006327, 1, 1, 1, 1, 1,
0.2461405, -0.1618995, 0.4825748, 1, 1, 1, 1, 1,
0.2468469, -0.08949296, 0.5442609, 1, 1, 1, 1, 1,
0.2471214, -1.011204, 1.758709, 1, 1, 1, 1, 1,
0.2517979, 0.517053, 0.3095388, 0, 0, 1, 1, 1,
0.2620569, 1.158422, 0.6563904, 1, 0, 0, 1, 1,
0.2677966, 0.6996107, 2.059467, 1, 0, 0, 1, 1,
0.2680696, -0.6978911, 3.462636, 1, 0, 0, 1, 1,
0.2702582, 1.32505, -0.4452647, 1, 0, 0, 1, 1,
0.2721128, 1.084057, 0.01380344, 1, 0, 0, 1, 1,
0.2724335, 0.7642683, 0.01148497, 0, 0, 0, 1, 1,
0.2814023, -0.2067422, 3.354469, 0, 0, 0, 1, 1,
0.2857593, -1.068299, 2.909681, 0, 0, 0, 1, 1,
0.2861839, -0.6487729, 3.934042, 0, 0, 0, 1, 1,
0.286751, -0.2424261, 2.753102, 0, 0, 0, 1, 1,
0.2877798, -0.8708057, 4.375904, 0, 0, 0, 1, 1,
0.2932472, -0.7333972, 2.745941, 0, 0, 0, 1, 1,
0.2948448, -0.2488392, 2.587887, 1, 1, 1, 1, 1,
0.2951438, -0.3438364, 2.720891, 1, 1, 1, 1, 1,
0.2984371, -0.5957327, 4.457493, 1, 1, 1, 1, 1,
0.2985845, 0.3152589, -0.3004983, 1, 1, 1, 1, 1,
0.3000857, 0.1509754, 2.008563, 1, 1, 1, 1, 1,
0.3036214, -1.094073, 2.45363, 1, 1, 1, 1, 1,
0.3091882, 1.892214, 0.3094553, 1, 1, 1, 1, 1,
0.3094995, -1.544052, 3.288091, 1, 1, 1, 1, 1,
0.3099473, -1.292911, 3.536049, 1, 1, 1, 1, 1,
0.3099869, 1.525162, 0.5489202, 1, 1, 1, 1, 1,
0.312407, 0.2214739, 1.410636, 1, 1, 1, 1, 1,
0.3134722, 0.9357163, 0.7544565, 1, 1, 1, 1, 1,
0.3154057, 0.5222735, -1.598677, 1, 1, 1, 1, 1,
0.3174586, 0.8469663, 0.1548298, 1, 1, 1, 1, 1,
0.3209952, 0.6171222, 0.8307962, 1, 1, 1, 1, 1,
0.3245932, 0.4959816, 0.836948, 0, 0, 1, 1, 1,
0.3254325, -0.5310564, 1.800759, 1, 0, 0, 1, 1,
0.325677, -0.9520529, 3.586892, 1, 0, 0, 1, 1,
0.326126, -1.100587, 1.723947, 1, 0, 0, 1, 1,
0.3276575, -0.706982, 4.967522, 1, 0, 0, 1, 1,
0.3317267, 0.5309179, 0.3284073, 1, 0, 0, 1, 1,
0.332754, -0.5984974, 2.265399, 0, 0, 0, 1, 1,
0.3338999, -0.9217157, 2.939829, 0, 0, 0, 1, 1,
0.3349771, 1.266287, -0.8726785, 0, 0, 0, 1, 1,
0.3367482, 0.0396433, -0.2183228, 0, 0, 0, 1, 1,
0.3392087, 0.4946831, 0.2762008, 0, 0, 0, 1, 1,
0.3402687, 0.02375533, 0.3354356, 0, 0, 0, 1, 1,
0.3432531, -0.6285051, 2.948732, 0, 0, 0, 1, 1,
0.3433593, -1.035026, 3.627081, 1, 1, 1, 1, 1,
0.3452857, 0.7265099, 0.5529765, 1, 1, 1, 1, 1,
0.3459117, 0.4496039, 0.8728875, 1, 1, 1, 1, 1,
0.3462481, -0.3559895, 2.187452, 1, 1, 1, 1, 1,
0.3470302, -1.049485, 1.441049, 1, 1, 1, 1, 1,
0.34861, -0.495275, 3.399128, 1, 1, 1, 1, 1,
0.3509059, -1.422127, 3.815291, 1, 1, 1, 1, 1,
0.3514452, 0.6356784, 1.564788, 1, 1, 1, 1, 1,
0.3527909, -0.8713611, -0.1036683, 1, 1, 1, 1, 1,
0.356077, 0.6579337, -0.08865073, 1, 1, 1, 1, 1,
0.3581699, 1.289731, -0.2525053, 1, 1, 1, 1, 1,
0.3632385, 0.7166603, 1.149073, 1, 1, 1, 1, 1,
0.3667462, 0.8716502, -0.9842613, 1, 1, 1, 1, 1,
0.3673134, 0.3602764, 2.163192, 1, 1, 1, 1, 1,
0.3692865, 0.4037327, 0.7511478, 1, 1, 1, 1, 1,
0.3694286, -0.03037798, 0.4644243, 0, 0, 1, 1, 1,
0.3698483, 0.3734733, -0.7164654, 1, 0, 0, 1, 1,
0.3808779, 2.317015, 0.817375, 1, 0, 0, 1, 1,
0.3853332, -0.2901591, 0.928332, 1, 0, 0, 1, 1,
0.3902622, -2.053525, 4.645263, 1, 0, 0, 1, 1,
0.3912543, -1.456848, 3.141378, 1, 0, 0, 1, 1,
0.3916373, 0.7989899, -0.04611042, 0, 0, 0, 1, 1,
0.3922304, 0.02850591, 1.29759, 0, 0, 0, 1, 1,
0.3922389, 2.220519, -0.2654891, 0, 0, 0, 1, 1,
0.3952959, -0.744648, 2.226211, 0, 0, 0, 1, 1,
0.3966335, 0.703888, -0.2998774, 0, 0, 0, 1, 1,
0.4030026, 1.208079, 0.825367, 0, 0, 0, 1, 1,
0.4037819, -0.5836752, 3.400543, 0, 0, 0, 1, 1,
0.40511, -0.1712214, 0.8686102, 1, 1, 1, 1, 1,
0.4061882, -0.9893741, 2.798375, 1, 1, 1, 1, 1,
0.4084946, -0.8858272, 1.973981, 1, 1, 1, 1, 1,
0.4095944, -0.5362008, 3.030092, 1, 1, 1, 1, 1,
0.4154971, 0.1680674, 1.773216, 1, 1, 1, 1, 1,
0.4284772, -0.5879862, 2.152393, 1, 1, 1, 1, 1,
0.4289036, 1.053952, -0.5972623, 1, 1, 1, 1, 1,
0.4321981, 0.7610011, -0.4607057, 1, 1, 1, 1, 1,
0.4330216, -0.2996984, 0.6751775, 1, 1, 1, 1, 1,
0.4336921, -0.9041662, 2.045326, 1, 1, 1, 1, 1,
0.4417083, -0.3336324, 0.9478982, 1, 1, 1, 1, 1,
0.4436582, -1.564306, 3.01515, 1, 1, 1, 1, 1,
0.4477116, 2.614499, 0.08977077, 1, 1, 1, 1, 1,
0.4496032, -0.2767013, 2.782862, 1, 1, 1, 1, 1,
0.4497525, 0.4408281, 1.066009, 1, 1, 1, 1, 1,
0.4563904, 1.031706, 1.421283, 0, 0, 1, 1, 1,
0.4577617, 2.289266, -0.4662482, 1, 0, 0, 1, 1,
0.4602373, 0.05509861, -1.614445, 1, 0, 0, 1, 1,
0.4668882, -1.226625, 4.32526, 1, 0, 0, 1, 1,
0.4688659, 1.193264, 0.8564702, 1, 0, 0, 1, 1,
0.470561, 1.884961, 1.582223, 1, 0, 0, 1, 1,
0.4753276, 0.2160014, 0.387131, 0, 0, 0, 1, 1,
0.4775202, -0.547585, 1.981043, 0, 0, 0, 1, 1,
0.4778771, -0.1312726, 2.255588, 0, 0, 0, 1, 1,
0.4793472, -0.1067109, 1.014222, 0, 0, 0, 1, 1,
0.4830852, 0.373882, -0.4385923, 0, 0, 0, 1, 1,
0.485309, 0.03635136, 2.380718, 0, 0, 0, 1, 1,
0.487268, -0.3697719, 3.01547, 0, 0, 0, 1, 1,
0.4884424, -0.5185901, 3.93789, 1, 1, 1, 1, 1,
0.4885473, 0.1963206, 0.510174, 1, 1, 1, 1, 1,
0.4901279, 0.4275562, 1.338274, 1, 1, 1, 1, 1,
0.4938145, 0.04126437, 1.341154, 1, 1, 1, 1, 1,
0.4945385, 0.03765567, 2.579054, 1, 1, 1, 1, 1,
0.4979945, -2.173017, 3.709323, 1, 1, 1, 1, 1,
0.5003425, -0.7541487, 3.254882, 1, 1, 1, 1, 1,
0.5042806, 0.8067825, -0.5824439, 1, 1, 1, 1, 1,
0.508227, -1.764066, 1.115211, 1, 1, 1, 1, 1,
0.5111126, 1.017428, 0.7822805, 1, 1, 1, 1, 1,
0.511319, -0.1577031, 2.57248, 1, 1, 1, 1, 1,
0.5149581, 0.8531163, 1.682208, 1, 1, 1, 1, 1,
0.5226077, -0.08232343, 2.349019, 1, 1, 1, 1, 1,
0.5272193, -0.525861, 1.699937, 1, 1, 1, 1, 1,
0.5277525, 0.8386722, 1.50044, 1, 1, 1, 1, 1,
0.5289559, 1.272819, 1.15606, 0, 0, 1, 1, 1,
0.5324401, -1.25943, 3.386329, 1, 0, 0, 1, 1,
0.5337318, -1.054876, 2.911337, 1, 0, 0, 1, 1,
0.5338722, -2.062186, 3.42323, 1, 0, 0, 1, 1,
0.5352976, -1.286958, 2.212173, 1, 0, 0, 1, 1,
0.5363244, 0.6101053, 0.3760385, 1, 0, 0, 1, 1,
0.5366684, -0.9415738, 3.313894, 0, 0, 0, 1, 1,
0.5462769, -0.6711268, 3.221793, 0, 0, 0, 1, 1,
0.5508624, -1.216688, 2.13302, 0, 0, 0, 1, 1,
0.5560684, -0.5482643, 2.005677, 0, 0, 0, 1, 1,
0.5589691, 0.5944639, 0.4097099, 0, 0, 0, 1, 1,
0.5595394, 0.09475218, 2.976996, 0, 0, 0, 1, 1,
0.5612789, 0.6742593, 1.16364, 0, 0, 0, 1, 1,
0.5684756, -0.9627642, 1.111446, 1, 1, 1, 1, 1,
0.5699874, -0.1447183, -0.02122874, 1, 1, 1, 1, 1,
0.5747958, -0.4956274, 1.549731, 1, 1, 1, 1, 1,
0.575943, 0.2911523, 0.02079664, 1, 1, 1, 1, 1,
0.5763779, 2.279673, 0.1272182, 1, 1, 1, 1, 1,
0.5853916, 0.6372786, 1.289211, 1, 1, 1, 1, 1,
0.587075, 0.003486846, 1.390012, 1, 1, 1, 1, 1,
0.5895771, -0.4303273, 1.536783, 1, 1, 1, 1, 1,
0.5913689, 0.8117481, 0.1548173, 1, 1, 1, 1, 1,
0.5920569, -0.254751, 2.648494, 1, 1, 1, 1, 1,
0.6058187, 1.865497, 1.5748, 1, 1, 1, 1, 1,
0.6148298, 0.5210251, 1.7833, 1, 1, 1, 1, 1,
0.6182775, -0.503417, 1.984483, 1, 1, 1, 1, 1,
0.6194388, -0.6803805, 2.463717, 1, 1, 1, 1, 1,
0.6228209, -1.182485, 3.078413, 1, 1, 1, 1, 1,
0.6287546, -0.6352416, 0.8344264, 0, 0, 1, 1, 1,
0.6288686, -0.4602464, 2.135403, 1, 0, 0, 1, 1,
0.6327924, -0.1425141, 1.229215, 1, 0, 0, 1, 1,
0.6340865, 0.3722072, 2.733523, 1, 0, 0, 1, 1,
0.6433801, 0.2532905, 0.4332709, 1, 0, 0, 1, 1,
0.6464211, -0.4895384, 2.488854, 1, 0, 0, 1, 1,
0.654667, -0.6846181, 0.5351321, 0, 0, 0, 1, 1,
0.6581071, -0.1547725, 2.252639, 0, 0, 0, 1, 1,
0.6649234, -0.1495086, 2.265151, 0, 0, 0, 1, 1,
0.667002, -0.2000326, 2.989867, 0, 0, 0, 1, 1,
0.6676754, 1.26559, 0.06222834, 0, 0, 0, 1, 1,
0.6688305, 0.6629908, 0.8394784, 0, 0, 0, 1, 1,
0.6732543, -1.507954, 1.189837, 0, 0, 0, 1, 1,
0.6743284, -1.191406, 3.475391, 1, 1, 1, 1, 1,
0.6823546, 0.8110208, -0.1535247, 1, 1, 1, 1, 1,
0.6833994, 0.7913195, 0.7214284, 1, 1, 1, 1, 1,
0.685592, 0.05994092, 0.6004332, 1, 1, 1, 1, 1,
0.6858464, 0.9504643, -1.242582, 1, 1, 1, 1, 1,
0.6928747, 0.4537053, 0.8826342, 1, 1, 1, 1, 1,
0.7034233, -1.063601, -0.4295838, 1, 1, 1, 1, 1,
0.7034665, -1.397581, 3.368992, 1, 1, 1, 1, 1,
0.7043216, 0.9916446, 0.1585798, 1, 1, 1, 1, 1,
0.7087972, -0.2444783, 0.8114895, 1, 1, 1, 1, 1,
0.7182299, -0.7898246, 3.13304, 1, 1, 1, 1, 1,
0.7199823, 1.563606, 2.187805, 1, 1, 1, 1, 1,
0.7241493, 0.2176649, -0.460485, 1, 1, 1, 1, 1,
0.7279325, 0.89132, 0.4319668, 1, 1, 1, 1, 1,
0.7312851, 1.23236, 0.1849113, 1, 1, 1, 1, 1,
0.7329155, 0.4068365, -1.290974, 0, 0, 1, 1, 1,
0.735613, 0.5432302, 0.6242579, 1, 0, 0, 1, 1,
0.7356256, 0.4081622, -1.210495, 1, 0, 0, 1, 1,
0.7398556, 0.9042819, 0.4949796, 1, 0, 0, 1, 1,
0.7410591, -1.267175, 2.082606, 1, 0, 0, 1, 1,
0.742182, 1.804286, 1.413179, 1, 0, 0, 1, 1,
0.7470889, -0.0366275, 2.931684, 0, 0, 0, 1, 1,
0.7539995, 0.9113329, -1.260103, 0, 0, 0, 1, 1,
0.7552116, 1.763826, 2.599871, 0, 0, 0, 1, 1,
0.7557852, -0.6115828, 1.67427, 0, 0, 0, 1, 1,
0.7564154, -0.9390746, 1.716068, 0, 0, 0, 1, 1,
0.7566015, -0.04452167, 1.945644, 0, 0, 0, 1, 1,
0.7567844, -1.448002, 2.573794, 0, 0, 0, 1, 1,
0.7655185, 1.381481, 0.134968, 1, 1, 1, 1, 1,
0.7695968, -0.7919225, 2.590916, 1, 1, 1, 1, 1,
0.7728423, 0.82921, 1.144035, 1, 1, 1, 1, 1,
0.7784663, 0.3553413, 1.626021, 1, 1, 1, 1, 1,
0.7802054, 1.999468, 0.5811252, 1, 1, 1, 1, 1,
0.7802495, -0.6729743, 4.561605, 1, 1, 1, 1, 1,
0.7807989, 0.3735032, 1.192075, 1, 1, 1, 1, 1,
0.7840558, 0.07046077, 0.8545021, 1, 1, 1, 1, 1,
0.7963951, -0.805616, 2.175954, 1, 1, 1, 1, 1,
0.7965703, -0.480077, 1.523699, 1, 1, 1, 1, 1,
0.7995275, -0.1153274, 2.248091, 1, 1, 1, 1, 1,
0.8034952, -0.1562837, 0.1837357, 1, 1, 1, 1, 1,
0.8062884, -0.05951233, 1.810302, 1, 1, 1, 1, 1,
0.8107011, -3.217409, 4.346073, 1, 1, 1, 1, 1,
0.8147615, 1.264663, 1.147883, 1, 1, 1, 1, 1,
0.818859, 0.524609, 0.001819693, 0, 0, 1, 1, 1,
0.8196021, 0.4849449, 1.802062, 1, 0, 0, 1, 1,
0.8197761, -0.9232847, 1.791074, 1, 0, 0, 1, 1,
0.8210631, -0.0808901, 1.465908, 1, 0, 0, 1, 1,
0.8259785, 0.1562201, 0.8405316, 1, 0, 0, 1, 1,
0.8273097, 1.170569, 2.440547, 1, 0, 0, 1, 1,
0.8372775, 0.754005, 3.00645, 0, 0, 0, 1, 1,
0.8394207, -1.353064, 2.423086, 0, 0, 0, 1, 1,
0.8446941, 1.184458, 1.102634, 0, 0, 0, 1, 1,
0.8460933, -1.45574, 3.02083, 0, 0, 0, 1, 1,
0.8499824, -0.2559155, 0.8767366, 0, 0, 0, 1, 1,
0.8531595, -0.3821376, 2.687557, 0, 0, 0, 1, 1,
0.8558648, 1.060916, 2.1833, 0, 0, 0, 1, 1,
0.8628547, 1.399434, -0.1697866, 1, 1, 1, 1, 1,
0.8641662, 0.05485073, 2.288583, 1, 1, 1, 1, 1,
0.864838, 0.3064275, -0.2683825, 1, 1, 1, 1, 1,
0.8653173, 1.330965, 1.1398, 1, 1, 1, 1, 1,
0.8723992, 0.07084607, 1.698202, 1, 1, 1, 1, 1,
0.8757839, 0.5316522, 2.324385, 1, 1, 1, 1, 1,
0.8774579, 1.075534, -0.3930907, 1, 1, 1, 1, 1,
0.8812996, 0.2247262, 1.862466, 1, 1, 1, 1, 1,
0.8855484, -0.1574908, 2.968357, 1, 1, 1, 1, 1,
0.8857588, -0.5801448, 1.851493, 1, 1, 1, 1, 1,
0.8871648, -2.421587, 3.820945, 1, 1, 1, 1, 1,
0.8877434, -0.7624438, 1.326827, 1, 1, 1, 1, 1,
0.8922518, 0.7684598, -0.03541283, 1, 1, 1, 1, 1,
0.8941379, -0.9333386, 2.716526, 1, 1, 1, 1, 1,
0.8960242, -1.592945, 2.42542, 1, 1, 1, 1, 1,
0.9010774, 1.249464, 0.5120831, 0, 0, 1, 1, 1,
0.908383, -0.7647943, 2.791452, 1, 0, 0, 1, 1,
0.9084305, -0.661922, 2.049118, 1, 0, 0, 1, 1,
0.9106852, -0.8207606, 2.703229, 1, 0, 0, 1, 1,
0.9115233, -1.6184, 2.956755, 1, 0, 0, 1, 1,
0.9121301, 0.00387483, 2.281114, 1, 0, 0, 1, 1,
0.9142076, -0.8890942, 2.633444, 0, 0, 0, 1, 1,
0.9186105, -0.5370318, 1.897606, 0, 0, 0, 1, 1,
0.9208115, -0.78917, 1.273803, 0, 0, 0, 1, 1,
0.9253176, 1.270312, -0.508277, 0, 0, 0, 1, 1,
0.9277661, 0.9884484, -0.3910277, 0, 0, 0, 1, 1,
0.9418172, -0.201516, 2.038952, 0, 0, 0, 1, 1,
0.949095, -1.054336, 1.578916, 0, 0, 0, 1, 1,
0.9514559, -1.186047, 2.726495, 1, 1, 1, 1, 1,
0.9528863, 0.3275036, 1.804369, 1, 1, 1, 1, 1,
0.9540433, -0.4834758, 3.280279, 1, 1, 1, 1, 1,
0.9593153, -1.612645, 2.84472, 1, 1, 1, 1, 1,
0.9731756, 0.3062334, 2.707958, 1, 1, 1, 1, 1,
0.9744032, 1.407728, 2.761907, 1, 1, 1, 1, 1,
0.977504, 0.6866561, 0.8393955, 1, 1, 1, 1, 1,
0.9790424, 0.741452, -0.03940514, 1, 1, 1, 1, 1,
0.9815193, 0.1581734, 0.8163098, 1, 1, 1, 1, 1,
0.9916384, -0.02363462, 0.1196991, 1, 1, 1, 1, 1,
0.9963643, 0.2096282, 2.841646, 1, 1, 1, 1, 1,
1.004501, 0.1576925, 2.477195, 1, 1, 1, 1, 1,
1.01019, -0.7922861, 1.534598, 1, 1, 1, 1, 1,
1.015945, -1.388235, 1.460632, 1, 1, 1, 1, 1,
1.017742, -2.049841, 5.016243, 1, 1, 1, 1, 1,
1.019482, 0.105917, 1.710178, 0, 0, 1, 1, 1,
1.020802, 1.011283, 0.4003824, 1, 0, 0, 1, 1,
1.02158, 0.8392509, -0.5104594, 1, 0, 0, 1, 1,
1.032245, 0.003610955, 3.18134, 1, 0, 0, 1, 1,
1.038001, 0.1996005, 1.157413, 1, 0, 0, 1, 1,
1.040744, -1.87396, 3.263328, 1, 0, 0, 1, 1,
1.041175, -1.103243, 2.111667, 0, 0, 0, 1, 1,
1.047284, -1.278952, 1.153326, 0, 0, 0, 1, 1,
1.053578, -0.3373418, 3.539674, 0, 0, 0, 1, 1,
1.056705, -1.300682, 3.696668, 0, 0, 0, 1, 1,
1.062753, 0.01318802, 0.987281, 0, 0, 0, 1, 1,
1.078136, 0.2442461, 2.01573, 0, 0, 0, 1, 1,
1.07829, -0.1055897, 1.148627, 0, 0, 0, 1, 1,
1.078811, 1.938425, -0.6002606, 1, 1, 1, 1, 1,
1.079423, 1.898419, 0.6582264, 1, 1, 1, 1, 1,
1.099137, -0.5951923, 2.237369, 1, 1, 1, 1, 1,
1.103373, 1.058428, 1.044708, 1, 1, 1, 1, 1,
1.10764, -0.4733461, 2.221622, 1, 1, 1, 1, 1,
1.112063, -0.4331473, 1.599807, 1, 1, 1, 1, 1,
1.114029, -0.5031634, 2.47598, 1, 1, 1, 1, 1,
1.115644, -0.5136967, 1.652716, 1, 1, 1, 1, 1,
1.117628, 0.2871695, 2.16701, 1, 1, 1, 1, 1,
1.121485, -0.5136214, 4.180122, 1, 1, 1, 1, 1,
1.125174, 1.296598, -0.05256161, 1, 1, 1, 1, 1,
1.128573, -0.4067676, 0.818709, 1, 1, 1, 1, 1,
1.130695, -0.715223, 3.359786, 1, 1, 1, 1, 1,
1.131961, -0.2593177, 1.5018, 1, 1, 1, 1, 1,
1.132936, 0.4209846, 1.356172, 1, 1, 1, 1, 1,
1.14555, 0.5425956, 2.275361, 0, 0, 1, 1, 1,
1.146882, 0.1535606, 0.3632265, 1, 0, 0, 1, 1,
1.152186, 1.531973, -0.1146669, 1, 0, 0, 1, 1,
1.158038, 0.1026581, 2.317177, 1, 0, 0, 1, 1,
1.163509, -1.863526, 1.980932, 1, 0, 0, 1, 1,
1.164517, 1.073888, 2.401089, 1, 0, 0, 1, 1,
1.175005, 0.2428937, 0.9591651, 0, 0, 0, 1, 1,
1.175758, 0.2205174, 1.941611, 0, 0, 0, 1, 1,
1.185061, 2.123538, 1.579095, 0, 0, 0, 1, 1,
1.19128, -0.01955842, 0.9015799, 0, 0, 0, 1, 1,
1.193011, 0.1524221, 1.089115, 0, 0, 0, 1, 1,
1.2123, -0.5968103, 1.902594, 0, 0, 0, 1, 1,
1.229019, 0.9778834, 0.5990993, 0, 0, 0, 1, 1,
1.229404, -0.8889894, 2.450936, 1, 1, 1, 1, 1,
1.233209, -1.396664, 2.154435, 1, 1, 1, 1, 1,
1.236046, -1.809002, 3.533701, 1, 1, 1, 1, 1,
1.243072, 0.05919021, 4.133838, 1, 1, 1, 1, 1,
1.24342, -0.5739741, 1.658203, 1, 1, 1, 1, 1,
1.251976, 0.5139066, 0.4494099, 1, 1, 1, 1, 1,
1.25643, 0.3834795, 0.3484209, 1, 1, 1, 1, 1,
1.258895, 0.7753215, 1.146971, 1, 1, 1, 1, 1,
1.261866, -0.8654542, 1.582108, 1, 1, 1, 1, 1,
1.267025, -2.289284, 3.073295, 1, 1, 1, 1, 1,
1.271957, 0.4985236, 0.08388744, 1, 1, 1, 1, 1,
1.274007, 1.11809, 0.05892039, 1, 1, 1, 1, 1,
1.274485, 0.07061959, 1.891043, 1, 1, 1, 1, 1,
1.279146, -0.7563154, 1.872175, 1, 1, 1, 1, 1,
1.290072, -0.06195629, 2.520622, 1, 1, 1, 1, 1,
1.294498, 0.1883235, 2.756675, 0, 0, 1, 1, 1,
1.297157, 0.450652, 2.337258, 1, 0, 0, 1, 1,
1.315441, 0.3422202, 1.214392, 1, 0, 0, 1, 1,
1.317042, -0.5016325, 3.360627, 1, 0, 0, 1, 1,
1.31783, 0.1746784, 2.558009, 1, 0, 0, 1, 1,
1.330675, -1.706005, 2.179598, 1, 0, 0, 1, 1,
1.358333, -2.3171, 2.834146, 0, 0, 0, 1, 1,
1.362165, 0.4704389, 3.224664, 0, 0, 0, 1, 1,
1.362679, -0.2480789, 1.474881, 0, 0, 0, 1, 1,
1.362798, 1.445733, -0.8755597, 0, 0, 0, 1, 1,
1.364866, -1.801551, 2.376313, 0, 0, 0, 1, 1,
1.365479, 0.1946504, 1.715766, 0, 0, 0, 1, 1,
1.367378, -1.202077, 3.108793, 0, 0, 0, 1, 1,
1.368886, -0.7382483, 2.411018, 1, 1, 1, 1, 1,
1.370263, -0.6954869, 4.747312, 1, 1, 1, 1, 1,
1.372095, -0.2413649, 0.9042469, 1, 1, 1, 1, 1,
1.374846, 0.7922838, -2.399181, 1, 1, 1, 1, 1,
1.383294, 1.170413, -0.4636195, 1, 1, 1, 1, 1,
1.385743, -0.2043576, 3.515806, 1, 1, 1, 1, 1,
1.389332, 1.660964, 0.2551697, 1, 1, 1, 1, 1,
1.399658, 0.5423325, 1.744557, 1, 1, 1, 1, 1,
1.40415, -0.4753924, 0.9905446, 1, 1, 1, 1, 1,
1.404568, 0.8142588, 0.7629125, 1, 1, 1, 1, 1,
1.406493, 0.6702913, 0.6097471, 1, 1, 1, 1, 1,
1.417366, -0.03813013, 2.395069, 1, 1, 1, 1, 1,
1.424183, 0.2844838, 2.199782, 1, 1, 1, 1, 1,
1.425602, 0.2372284, 2.246881, 1, 1, 1, 1, 1,
1.440906, 0.9800652, 3.557913, 1, 1, 1, 1, 1,
1.44386, 2.459486, 0.8045128, 0, 0, 1, 1, 1,
1.445377, 0.5386345, 0.2593196, 1, 0, 0, 1, 1,
1.469533, 0.6924803, 2.932038, 1, 0, 0, 1, 1,
1.473168, 1.465599, 1.272695, 1, 0, 0, 1, 1,
1.486539, -0.8072069, 1.913597, 1, 0, 0, 1, 1,
1.496152, -0.05944572, 1.36467, 1, 0, 0, 1, 1,
1.518885, 0.1220087, 1.95335, 0, 0, 0, 1, 1,
1.520106, 1.199423, 2.254439, 0, 0, 0, 1, 1,
1.524831, 0.5866057, 2.579954, 0, 0, 0, 1, 1,
1.535018, 1.012291, 1.832614, 0, 0, 0, 1, 1,
1.547385, 0.4162908, 2.819761, 0, 0, 0, 1, 1,
1.574065, -0.475949, 1.396811, 0, 0, 0, 1, 1,
1.579443, -0.2282415, 3.096377, 0, 0, 0, 1, 1,
1.582022, -0.1342961, 2.693347, 1, 1, 1, 1, 1,
1.58368, 1.039565, 1.870061, 1, 1, 1, 1, 1,
1.603067, -0.01678528, 1.266495, 1, 1, 1, 1, 1,
1.624631, -0.4142033, 1.679598, 1, 1, 1, 1, 1,
1.6464, -0.3675366, 1.963995, 1, 1, 1, 1, 1,
1.662625, 0.1498266, 1.062175, 1, 1, 1, 1, 1,
1.66265, 0.9382994, 1.35581, 1, 1, 1, 1, 1,
1.668221, 1.869165, 1.556358, 1, 1, 1, 1, 1,
1.672145, -1.007955, 2.077015, 1, 1, 1, 1, 1,
1.674289, 1.456531, 1.383752, 1, 1, 1, 1, 1,
1.688051, -1.091544, 2.398476, 1, 1, 1, 1, 1,
1.694464, -1.418926, 2.473153, 1, 1, 1, 1, 1,
1.770213, 0.03343749, 2.014249, 1, 1, 1, 1, 1,
1.773363, -1.089295, 1.479484, 1, 1, 1, 1, 1,
1.775656, 0.664902, 1.553611, 1, 1, 1, 1, 1,
1.784292, 0.5150338, 2.864058, 0, 0, 1, 1, 1,
1.785196, -0.4533205, 1.67743, 1, 0, 0, 1, 1,
1.796564, -0.7003422, 3.157222, 1, 0, 0, 1, 1,
1.81752, -0.4459403, 2.781082, 1, 0, 0, 1, 1,
1.818967, 0.733872, 1.768477, 1, 0, 0, 1, 1,
1.824575, -0.01590302, 2.478869, 1, 0, 0, 1, 1,
1.837434, 2.167623, 1.577624, 0, 0, 0, 1, 1,
1.841779, 0.4135859, 1.527488, 0, 0, 0, 1, 1,
1.848591, -0.4964128, 1.790363, 0, 0, 0, 1, 1,
1.859503, 0.7969382, 1.703765, 0, 0, 0, 1, 1,
1.864879, 0.1248171, 1.584327, 0, 0, 0, 1, 1,
1.865825, 1.012324, 0.9292231, 0, 0, 0, 1, 1,
1.893298, 0.3069146, 4.764316, 0, 0, 0, 1, 1,
1.899252, 0.754068, 2.175431, 1, 1, 1, 1, 1,
1.901689, 1.288775, 2.064713, 1, 1, 1, 1, 1,
1.922748, -0.08316731, 1.898478, 1, 1, 1, 1, 1,
1.926391, -1.662797, 0.4849667, 1, 1, 1, 1, 1,
1.936395, -1.872622, 2.488855, 1, 1, 1, 1, 1,
1.942335, -1.436339, 2.876169, 1, 1, 1, 1, 1,
1.958414, 0.4862436, 0.7294693, 1, 1, 1, 1, 1,
1.963381, 0.7252155, 0.2157246, 1, 1, 1, 1, 1,
2.009696, -1.916482, 4.139104, 1, 1, 1, 1, 1,
2.027287, 0.4321105, 1.911903, 1, 1, 1, 1, 1,
2.028629, 0.3400464, 0.06616154, 1, 1, 1, 1, 1,
2.070544, -0.02857373, 0.9384943, 1, 1, 1, 1, 1,
2.075496, 0.4202285, 2.844696, 1, 1, 1, 1, 1,
2.10703, -0.9374802, 3.8281, 1, 1, 1, 1, 1,
2.122711, -1.13829, 3.31343, 1, 1, 1, 1, 1,
2.14609, -0.01399086, 1.428761, 0, 0, 1, 1, 1,
2.180503, -0.4757605, 0.4086153, 1, 0, 0, 1, 1,
2.214638, 0.6975902, 0.09660625, 1, 0, 0, 1, 1,
2.269867, -1.778777, 0.7304716, 1, 0, 0, 1, 1,
2.309415, -0.2020347, 3.007025, 1, 0, 0, 1, 1,
2.330503, 0.2414823, 0.858183, 1, 0, 0, 1, 1,
2.344916, 0.07419186, -0.1399904, 0, 0, 0, 1, 1,
2.404258, -0.6196973, 3.046487, 0, 0, 0, 1, 1,
2.405671, -0.002990369, 1.010755, 0, 0, 0, 1, 1,
2.411054, 0.0469597, 2.316096, 0, 0, 0, 1, 1,
2.414232, -1.206726, 0.9667174, 0, 0, 0, 1, 1,
2.417478, 0.1827113, 0.1423749, 0, 0, 0, 1, 1,
2.421537, 0.745745, 2.269432, 0, 0, 0, 1, 1,
2.474221, -1.32851, 1.791559, 1, 1, 1, 1, 1,
2.51654, 2.934996, -2.03386, 1, 1, 1, 1, 1,
2.571347, 0.1023445, 1.116142, 1, 1, 1, 1, 1,
2.617119, 1.27771, 0.1587365, 1, 1, 1, 1, 1,
2.643111, 0.1229905, 0.7899297, 1, 1, 1, 1, 1,
2.671602, 0.4668142, 1.820262, 1, 1, 1, 1, 1,
3.150671, 1.540884, 0.558654, 1, 1, 1, 1, 1
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
var radius = 9.569175;
var distance = 33.61132;
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
mvMatrix.translate( 0.1453965, 0.1412065, -0.09197283 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.61132);
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