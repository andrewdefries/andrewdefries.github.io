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
-3.410928, -0.8378745, -1.365549, 1, 0, 0, 1,
-2.941262, 0.2952261, -1.07492, 1, 0.007843138, 0, 1,
-2.815057, 1.005654, -0.8903525, 1, 0.01176471, 0, 1,
-2.798022, -0.2707616, -1.462699, 1, 0.01960784, 0, 1,
-2.409821, -0.3179546, -1.94932, 1, 0.02352941, 0, 1,
-2.394283, -0.2782522, 0.1228194, 1, 0.03137255, 0, 1,
-2.318556, -0.4819695, -1.188926, 1, 0.03529412, 0, 1,
-2.304644, 1.359295, -0.8315561, 1, 0.04313726, 0, 1,
-2.260219, -0.9900442, -1.697438, 1, 0.04705882, 0, 1,
-2.2141, 0.3466809, -2.382909, 1, 0.05490196, 0, 1,
-2.205118, -0.2999615, -1.185279, 1, 0.05882353, 0, 1,
-2.123407, -0.3576185, -1.655391, 1, 0.06666667, 0, 1,
-2.11958, 0.07973654, -1.328668, 1, 0.07058824, 0, 1,
-2.075151, 0.2652933, -0.3410259, 1, 0.07843138, 0, 1,
-2.060786, 2.338024, 0.3019404, 1, 0.08235294, 0, 1,
-2.046208, -0.4044665, -2.471414, 1, 0.09019608, 0, 1,
-2.02774, 1.147703, -0.5489461, 1, 0.09411765, 0, 1,
-2.016102, -0.9864663, -1.843832, 1, 0.1019608, 0, 1,
-2.009969, -0.2058557, -0.365799, 1, 0.1098039, 0, 1,
-1.969857, -0.7401989, -0.8235279, 1, 0.1137255, 0, 1,
-1.940548, 0.3835553, -1.827393, 1, 0.1215686, 0, 1,
-1.903703, 0.9497723, -0.5801454, 1, 0.1254902, 0, 1,
-1.90276, -0.1704908, -2.380162, 1, 0.1333333, 0, 1,
-1.898235, 0.1180171, -2.178111, 1, 0.1372549, 0, 1,
-1.892423, 0.7299399, -0.7976353, 1, 0.145098, 0, 1,
-1.889648, 1.406342, -1.833092, 1, 0.1490196, 0, 1,
-1.879558, 1.223004, -0.3954522, 1, 0.1568628, 0, 1,
-1.857586, 0.8254887, -1.219174, 1, 0.1607843, 0, 1,
-1.825945, 0.5885646, 0.06369601, 1, 0.1686275, 0, 1,
-1.817255, -0.803604, -1.873033, 1, 0.172549, 0, 1,
-1.809417, 0.7891778, -2.564089, 1, 0.1803922, 0, 1,
-1.805134, -0.8661159, -1.306404, 1, 0.1843137, 0, 1,
-1.803298, -0.01439529, -1.962436, 1, 0.1921569, 0, 1,
-1.800779, 2.34587, -0.5592444, 1, 0.1960784, 0, 1,
-1.800691, 0.2998752, -1.534022, 1, 0.2039216, 0, 1,
-1.791323, -1.031333, -0.09999793, 1, 0.2117647, 0, 1,
-1.779631, -0.8228698, -0.7864631, 1, 0.2156863, 0, 1,
-1.710674, 0.5414587, -1.325936, 1, 0.2235294, 0, 1,
-1.706348, -0.9350181, -1.990463, 1, 0.227451, 0, 1,
-1.68006, 2.053329, -1.197942, 1, 0.2352941, 0, 1,
-1.65271, 1.530416, -2.286216, 1, 0.2392157, 0, 1,
-1.64594, 0.7111862, -0.2567869, 1, 0.2470588, 0, 1,
-1.645296, 1.20735, -2.48404, 1, 0.2509804, 0, 1,
-1.638661, -0.2284454, -1.789031, 1, 0.2588235, 0, 1,
-1.619193, 1.67318, -0.3268273, 1, 0.2627451, 0, 1,
-1.612283, 0.3136704, -1.497376, 1, 0.2705882, 0, 1,
-1.590196, -0.5467988, -2.305314, 1, 0.2745098, 0, 1,
-1.577848, 0.4037327, -0.8634371, 1, 0.282353, 0, 1,
-1.576284, 1.03982, -2.726917, 1, 0.2862745, 0, 1,
-1.575807, -0.4829108, -3.072976, 1, 0.2941177, 0, 1,
-1.573505, -1.438475, -3.716751, 1, 0.3019608, 0, 1,
-1.572461, -2.638237, -3.808628, 1, 0.3058824, 0, 1,
-1.571497, 0.7283609, 0.5781744, 1, 0.3137255, 0, 1,
-1.562652, -1.070567, -1.860871, 1, 0.3176471, 0, 1,
-1.562365, -0.6268576, -2.607613, 1, 0.3254902, 0, 1,
-1.559864, -1.178467, -3.350802, 1, 0.3294118, 0, 1,
-1.556062, -2.114895, -2.402503, 1, 0.3372549, 0, 1,
-1.550107, -0.8641943, -1.670198, 1, 0.3411765, 0, 1,
-1.530779, -0.1877185, -1.59757, 1, 0.3490196, 0, 1,
-1.51782, -0.3762209, 0.1906611, 1, 0.3529412, 0, 1,
-1.517475, 1.505726, -1.688377, 1, 0.3607843, 0, 1,
-1.508355, 0.3001154, -1.584958, 1, 0.3647059, 0, 1,
-1.502156, 0.06753331, -1.118837, 1, 0.372549, 0, 1,
-1.497403, -0.6253297, -1.172425, 1, 0.3764706, 0, 1,
-1.492104, -1.066986, -1.604305, 1, 0.3843137, 0, 1,
-1.490733, 0.06006854, -1.337747, 1, 0.3882353, 0, 1,
-1.484262, -0.9553665, -0.9291131, 1, 0.3960784, 0, 1,
-1.483191, -1.224132, -0.9624534, 1, 0.4039216, 0, 1,
-1.47586, -2.47406, -2.618809, 1, 0.4078431, 0, 1,
-1.464922, 0.3529656, -1.817933, 1, 0.4156863, 0, 1,
-1.45841, -0.3095958, -1.619046, 1, 0.4196078, 0, 1,
-1.451362, -0.4180132, -1.147235, 1, 0.427451, 0, 1,
-1.450012, 0.2340488, -1.052922, 1, 0.4313726, 0, 1,
-1.43809, -0.01828186, -2.81536, 1, 0.4392157, 0, 1,
-1.435063, -0.4310398, -3.317627, 1, 0.4431373, 0, 1,
-1.430913, 0.2203993, -3.040499, 1, 0.4509804, 0, 1,
-1.425159, -0.5051792, -1.035299, 1, 0.454902, 0, 1,
-1.421393, -0.03590539, -2.404128, 1, 0.4627451, 0, 1,
-1.420859, -0.4142309, -3.088115, 1, 0.4666667, 0, 1,
-1.405029, -0.6829641, -2.366438, 1, 0.4745098, 0, 1,
-1.403787, 1.622397, -0.2036872, 1, 0.4784314, 0, 1,
-1.395575, -0.3675688, -3.365431, 1, 0.4862745, 0, 1,
-1.390218, -1.716191, -1.267681, 1, 0.4901961, 0, 1,
-1.388085, -0.2934828, -2.348211, 1, 0.4980392, 0, 1,
-1.384831, -0.6784011, -2.154495, 1, 0.5058824, 0, 1,
-1.383983, -1.504294, -2.650768, 1, 0.509804, 0, 1,
-1.371669, 0.5157158, 0.2089869, 1, 0.5176471, 0, 1,
-1.354901, -0.5814952, -2.209378, 1, 0.5215687, 0, 1,
-1.350768, -0.5180199, -1.694889, 1, 0.5294118, 0, 1,
-1.348168, 0.515997, -0.391346, 1, 0.5333334, 0, 1,
-1.340115, 0.8254858, -2.362241, 1, 0.5411765, 0, 1,
-1.337399, -0.5570616, -2.268523, 1, 0.5450981, 0, 1,
-1.333968, 0.5090236, -4.382452, 1, 0.5529412, 0, 1,
-1.332098, -0.2243858, -1.662184, 1, 0.5568628, 0, 1,
-1.331509, 1.536309, 1.663753, 1, 0.5647059, 0, 1,
-1.32827, 0.3146784, -2.068163, 1, 0.5686275, 0, 1,
-1.322113, -0.4468203, -4.190041, 1, 0.5764706, 0, 1,
-1.321037, -0.5738705, -2.037237, 1, 0.5803922, 0, 1,
-1.30961, 0.4610207, -1.78863, 1, 0.5882353, 0, 1,
-1.291331, 0.08496224, -0.8266353, 1, 0.5921569, 0, 1,
-1.285328, -0.2940785, -0.9914024, 1, 0.6, 0, 1,
-1.280282, 0.1997171, -2.137999, 1, 0.6078432, 0, 1,
-1.274115, 0.6728073, -2.348623, 1, 0.6117647, 0, 1,
-1.265946, -0.5777947, -1.551957, 1, 0.6196079, 0, 1,
-1.261812, -0.1872233, -1.441761, 1, 0.6235294, 0, 1,
-1.260163, -0.005148555, -2.827873, 1, 0.6313726, 0, 1,
-1.258888, -0.6676405, -0.900004, 1, 0.6352941, 0, 1,
-1.258082, 0.6913588, -1.232201, 1, 0.6431373, 0, 1,
-1.250026, 1.485289, -1.463524, 1, 0.6470588, 0, 1,
-1.241546, -0.3240895, -0.9939463, 1, 0.654902, 0, 1,
-1.239934, -1.048932, -1.021078, 1, 0.6588235, 0, 1,
-1.218368, 0.4563741, -1.646494, 1, 0.6666667, 0, 1,
-1.217035, 1.310414, 0.3477755, 1, 0.6705883, 0, 1,
-1.20635, 0.2276993, -2.126735, 1, 0.6784314, 0, 1,
-1.201527, -0.8843631, -2.339604, 1, 0.682353, 0, 1,
-1.198713, -0.1869497, -1.290363, 1, 0.6901961, 0, 1,
-1.196791, -0.7703701, -2.549644, 1, 0.6941177, 0, 1,
-1.182649, -1.237263, -2.344593, 1, 0.7019608, 0, 1,
-1.177024, 0.8495262, -0.8260912, 1, 0.7098039, 0, 1,
-1.171461, 1.084719, -1.691527, 1, 0.7137255, 0, 1,
-1.161612, 0.7481506, -1.370319, 1, 0.7215686, 0, 1,
-1.156799, 1.092434, -0.6990919, 1, 0.7254902, 0, 1,
-1.150859, -1.714566, -2.408476, 1, 0.7333333, 0, 1,
-1.143461, -1.020444, -1.810305, 1, 0.7372549, 0, 1,
-1.136427, -0.4609599, -2.219769, 1, 0.7450981, 0, 1,
-1.119351, -0.5202621, -0.7595593, 1, 0.7490196, 0, 1,
-1.114895, 0.9051273, 0.8207765, 1, 0.7568628, 0, 1,
-1.109384, 0.7789825, -1.401683, 1, 0.7607843, 0, 1,
-1.099888, 0.366618, 0.1783635, 1, 0.7686275, 0, 1,
-1.080341, -0.9689522, -1.697589, 1, 0.772549, 0, 1,
-1.078086, -1.13863, -2.771786, 1, 0.7803922, 0, 1,
-1.074435, 1.938695, -0.4304895, 1, 0.7843137, 0, 1,
-1.073292, 1.243109, -0.6379001, 1, 0.7921569, 0, 1,
-1.068928, -0.9289319, -1.067472, 1, 0.7960784, 0, 1,
-1.06725, -0.08630706, -2.476635, 1, 0.8039216, 0, 1,
-1.062898, -0.02920301, -2.323339, 1, 0.8117647, 0, 1,
-1.026049, -0.5994003, -2.882113, 1, 0.8156863, 0, 1,
-1.025805, 0.8441132, 0.627462, 1, 0.8235294, 0, 1,
-1.02289, -0.14842, -3.185758, 1, 0.827451, 0, 1,
-1.018817, -1.086154, -1.931862, 1, 0.8352941, 0, 1,
-1.012343, -0.1217681, -1.222501, 1, 0.8392157, 0, 1,
-1.008083, 1.120606, 0.7449227, 1, 0.8470588, 0, 1,
-1.001313, 0.1615147, -0.3828457, 1, 0.8509804, 0, 1,
-0.9993215, -1.545953, -2.637853, 1, 0.8588235, 0, 1,
-0.9964855, 0.4163887, 0.6274335, 1, 0.8627451, 0, 1,
-0.9922339, 1.971149, -0.8664, 1, 0.8705882, 0, 1,
-0.9912325, -1.230983, -3.761273, 1, 0.8745098, 0, 1,
-0.988238, -1.355046, -3.114699, 1, 0.8823529, 0, 1,
-0.9810817, 0.3880332, -2.299519, 1, 0.8862745, 0, 1,
-0.9744602, -0.455853, -2.235598, 1, 0.8941177, 0, 1,
-0.9695152, 0.7100388, -0.9263561, 1, 0.8980392, 0, 1,
-0.9682059, 1.709254, -0.5625719, 1, 0.9058824, 0, 1,
-0.9645765, 0.4299553, -1.28721, 1, 0.9137255, 0, 1,
-0.9585582, -0.5339834, -2.248092, 1, 0.9176471, 0, 1,
-0.955574, -1.448169, -2.007364, 1, 0.9254902, 0, 1,
-0.9553024, 0.5463824, -1.907573, 1, 0.9294118, 0, 1,
-0.9515815, 0.9693136, -1.274791, 1, 0.9372549, 0, 1,
-0.9514558, -1.60984, -2.99793, 1, 0.9411765, 0, 1,
-0.948299, -1.490719, -4.458646, 1, 0.9490196, 0, 1,
-0.9459231, -1.174617, -2.508416, 1, 0.9529412, 0, 1,
-0.933903, -1.100624, -1.910271, 1, 0.9607843, 0, 1,
-0.9262754, -1.387028, -3.231524, 1, 0.9647059, 0, 1,
-0.9192986, -0.5647488, -2.062255, 1, 0.972549, 0, 1,
-0.9188752, 0.6163777, 1.284914, 1, 0.9764706, 0, 1,
-0.9164405, -0.2520664, -1.289159, 1, 0.9843137, 0, 1,
-0.9159534, -0.3960614, -1.1338, 1, 0.9882353, 0, 1,
-0.9016741, 0.2784434, -2.544225, 1, 0.9960784, 0, 1,
-0.901338, -0.9628381, -3.386503, 0.9960784, 1, 0, 1,
-0.8987457, 0.4130965, -2.015074, 0.9921569, 1, 0, 1,
-0.8970486, 0.08817164, -1.293788, 0.9843137, 1, 0, 1,
-0.8795926, -1.302793, -2.491198, 0.9803922, 1, 0, 1,
-0.879476, 0.6905159, -2.420731, 0.972549, 1, 0, 1,
-0.8787002, 0.9700254, -0.3938493, 0.9686275, 1, 0, 1,
-0.8754986, 0.6322254, -1.314731, 0.9607843, 1, 0, 1,
-0.8743622, 0.8361326, -0.6668554, 0.9568627, 1, 0, 1,
-0.871381, 0.5224172, -0.5997133, 0.9490196, 1, 0, 1,
-0.8658651, -2.153923, -3.273561, 0.945098, 1, 0, 1,
-0.8588766, 0.9174078, -1.417237, 0.9372549, 1, 0, 1,
-0.8547739, 0.7450555, -0.4113045, 0.9333333, 1, 0, 1,
-0.8546771, -0.1361994, -1.728008, 0.9254902, 1, 0, 1,
-0.8544798, 2.720382, -1.311683, 0.9215686, 1, 0, 1,
-0.8543026, 0.293245, -1.222011, 0.9137255, 1, 0, 1,
-0.8537892, 2.404343, -0.6541411, 0.9098039, 1, 0, 1,
-0.8445542, 0.2698653, -0.8895798, 0.9019608, 1, 0, 1,
-0.8440378, -0.9413913, -1.976581, 0.8941177, 1, 0, 1,
-0.8425952, -0.4413892, -2.348022, 0.8901961, 1, 0, 1,
-0.8410501, 0.5029232, -2.017217, 0.8823529, 1, 0, 1,
-0.8397683, 0.4516166, -0.9533338, 0.8784314, 1, 0, 1,
-0.838634, -0.02367089, -4.234541, 0.8705882, 1, 0, 1,
-0.8368442, -0.08109743, -1.117866, 0.8666667, 1, 0, 1,
-0.8284486, 0.6765116, -0.7170901, 0.8588235, 1, 0, 1,
-0.8262702, -0.5392057, -1.102503, 0.854902, 1, 0, 1,
-0.8227124, -0.6150111, -2.059566, 0.8470588, 1, 0, 1,
-0.8191435, 0.21423, 0.4540044, 0.8431373, 1, 0, 1,
-0.8149127, 0.4585692, 0.5522634, 0.8352941, 1, 0, 1,
-0.7994174, 1.569222, -1.268681, 0.8313726, 1, 0, 1,
-0.7978626, -0.8184827, -0.7050667, 0.8235294, 1, 0, 1,
-0.796838, -0.434067, -1.113806, 0.8196079, 1, 0, 1,
-0.7964444, -2.097478, -3.393775, 0.8117647, 1, 0, 1,
-0.7924675, -0.221101, -1.925673, 0.8078431, 1, 0, 1,
-0.7867405, -1.922035, -4.111786, 0.8, 1, 0, 1,
-0.7814043, -2.195371, -2.996614, 0.7921569, 1, 0, 1,
-0.7805817, 1.616924, -0.5346008, 0.7882353, 1, 0, 1,
-0.7804533, 0.4976001, -0.7192529, 0.7803922, 1, 0, 1,
-0.7795691, -0.6498501, -2.161103, 0.7764706, 1, 0, 1,
-0.7702157, 0.7995427, -0.1808162, 0.7686275, 1, 0, 1,
-0.769667, -1.029482, -1.653328, 0.7647059, 1, 0, 1,
-0.7683536, 2.037535, -0.314919, 0.7568628, 1, 0, 1,
-0.7677982, 0.700698, -1.299937, 0.7529412, 1, 0, 1,
-0.7661366, 1.082428, -0.893781, 0.7450981, 1, 0, 1,
-0.7587929, -1.221811, -3.046517, 0.7411765, 1, 0, 1,
-0.7562767, 0.02176473, -0.3525753, 0.7333333, 1, 0, 1,
-0.7538655, -0.5255836, -3.047914, 0.7294118, 1, 0, 1,
-0.7528768, -0.2280791, -2.96998, 0.7215686, 1, 0, 1,
-0.7475116, -0.02813349, -1.278486, 0.7176471, 1, 0, 1,
-0.7442154, -0.7257019, 2.029553, 0.7098039, 1, 0, 1,
-0.7441421, 0.9835005, -0.3690991, 0.7058824, 1, 0, 1,
-0.7427992, -0.3455597, -2.90286, 0.6980392, 1, 0, 1,
-0.7412545, -0.5985361, -2.479075, 0.6901961, 1, 0, 1,
-0.7233974, 0.4449537, -1.472015, 0.6862745, 1, 0, 1,
-0.7229097, 0.1816892, -0.8052788, 0.6784314, 1, 0, 1,
-0.7216802, -0.9130445, -2.030701, 0.6745098, 1, 0, 1,
-0.7211501, 0.9404104, -1.438238, 0.6666667, 1, 0, 1,
-0.7119003, 0.6589877, -0.729404, 0.6627451, 1, 0, 1,
-0.7116676, 1.298708, 0.2341126, 0.654902, 1, 0, 1,
-0.7073315, 0.979513, 0.8248059, 0.6509804, 1, 0, 1,
-0.7052934, -0.8706036, -1.546523, 0.6431373, 1, 0, 1,
-0.7040408, -1.653175, -1.887205, 0.6392157, 1, 0, 1,
-0.70364, -0.3431936, -2.788448, 0.6313726, 1, 0, 1,
-0.6942512, -0.4693222, -3.801209, 0.627451, 1, 0, 1,
-0.6936811, -0.9661655, -1.353979, 0.6196079, 1, 0, 1,
-0.6910709, -1.319364, -2.733663, 0.6156863, 1, 0, 1,
-0.68636, 0.6713588, -1.786027, 0.6078432, 1, 0, 1,
-0.6854972, 0.7629191, -0.8127453, 0.6039216, 1, 0, 1,
-0.68323, -1.56254, -1.229309, 0.5960785, 1, 0, 1,
-0.6826081, -0.4104522, -1.3671, 0.5882353, 1, 0, 1,
-0.6808753, 1.424052, 0.5925864, 0.5843138, 1, 0, 1,
-0.6787131, -0.09945577, -3.772626, 0.5764706, 1, 0, 1,
-0.6783437, -0.2005025, -4.921452, 0.572549, 1, 0, 1,
-0.6751983, -0.2011883, -2.570267, 0.5647059, 1, 0, 1,
-0.6733791, 0.8030061, -0.4884642, 0.5607843, 1, 0, 1,
-0.672773, -0.1113188, 0.1794115, 0.5529412, 1, 0, 1,
-0.6714643, 0.9935594, -1.820984, 0.5490196, 1, 0, 1,
-0.6664485, 0.6557906, -0.5583022, 0.5411765, 1, 0, 1,
-0.659649, 1.122155, -2.60765, 0.5372549, 1, 0, 1,
-0.6588709, 0.5285996, 0.6410003, 0.5294118, 1, 0, 1,
-0.649202, 0.853724, 0.1523014, 0.5254902, 1, 0, 1,
-0.6472051, 2.224889, -1.295034, 0.5176471, 1, 0, 1,
-0.6465029, 0.3097692, -1.031794, 0.5137255, 1, 0, 1,
-0.6366462, 0.05056285, -2.750358, 0.5058824, 1, 0, 1,
-0.6355062, 0.5907176, -0.8221459, 0.5019608, 1, 0, 1,
-0.6343971, 0.7393196, -0.2381517, 0.4941176, 1, 0, 1,
-0.6286235, 1.027385, -0.2893352, 0.4862745, 1, 0, 1,
-0.6284194, 0.04591769, -1.696929, 0.4823529, 1, 0, 1,
-0.62627, -0.5437546, -1.811777, 0.4745098, 1, 0, 1,
-0.6247746, -0.9304304, -4.006114, 0.4705882, 1, 0, 1,
-0.6230325, -1.61737, -2.447485, 0.4627451, 1, 0, 1,
-0.619965, -0.8493022, -4.580588, 0.4588235, 1, 0, 1,
-0.6168321, -0.07817379, -2.2845, 0.4509804, 1, 0, 1,
-0.6063924, -0.5448542, -2.607777, 0.4470588, 1, 0, 1,
-0.5950015, -1.077304, -2.061503, 0.4392157, 1, 0, 1,
-0.5914555, 0.8282321, 0.7929799, 0.4352941, 1, 0, 1,
-0.5913627, 0.1175383, -2.140612, 0.427451, 1, 0, 1,
-0.5896266, -1.112527, -2.842822, 0.4235294, 1, 0, 1,
-0.5888571, -0.5202198, -3.906587, 0.4156863, 1, 0, 1,
-0.5880533, 1.721042, -0.7305967, 0.4117647, 1, 0, 1,
-0.5762627, -0.795377, -0.5545128, 0.4039216, 1, 0, 1,
-0.5759299, -0.5552777, -2.75903, 0.3960784, 1, 0, 1,
-0.5753608, 0.5865762, -1.149881, 0.3921569, 1, 0, 1,
-0.5729697, -1.035122, -1.945382, 0.3843137, 1, 0, 1,
-0.5728691, 1.574224, 0.5173718, 0.3803922, 1, 0, 1,
-0.5686359, 0.3643304, 0.416545, 0.372549, 1, 0, 1,
-0.5676132, 0.5004528, 0.3174252, 0.3686275, 1, 0, 1,
-0.5669262, 0.9681652, -0.9041405, 0.3607843, 1, 0, 1,
-0.5618202, 2.244115, -0.3565036, 0.3568628, 1, 0, 1,
-0.5612403, 0.09770025, -1.326786, 0.3490196, 1, 0, 1,
-0.5603149, 0.5064946, -1.341647, 0.345098, 1, 0, 1,
-0.5579759, 1.562456, -2.838518, 0.3372549, 1, 0, 1,
-0.5569389, -0.1774044, -1.531251, 0.3333333, 1, 0, 1,
-0.5480213, 0.3166904, -0.7533486, 0.3254902, 1, 0, 1,
-0.5452364, 0.5783937, -1.82099, 0.3215686, 1, 0, 1,
-0.5398876, 0.6283776, -1.240296, 0.3137255, 1, 0, 1,
-0.5390183, 2.096828, 0.9704626, 0.3098039, 1, 0, 1,
-0.5347142, -0.316606, -1.357263, 0.3019608, 1, 0, 1,
-0.5281526, 0.4036708, -0.1746841, 0.2941177, 1, 0, 1,
-0.5264338, 1.615432, -0.8949907, 0.2901961, 1, 0, 1,
-0.5224859, 0.6025538, -0.7700959, 0.282353, 1, 0, 1,
-0.5182258, -0.1901623, -1.060199, 0.2784314, 1, 0, 1,
-0.516691, -0.7690718, -2.017946, 0.2705882, 1, 0, 1,
-0.5125614, -0.4220006, -1.797851, 0.2666667, 1, 0, 1,
-0.5123655, 0.05017273, -2.016851, 0.2588235, 1, 0, 1,
-0.5122547, 0.0825188, -2.389319, 0.254902, 1, 0, 1,
-0.5067385, 1.109561, -0.3729202, 0.2470588, 1, 0, 1,
-0.505318, -1.496728, -3.357457, 0.2431373, 1, 0, 1,
-0.5042135, -1.080723, -2.777366, 0.2352941, 1, 0, 1,
-0.5027801, 0.7011089, -1.145235, 0.2313726, 1, 0, 1,
-0.500119, 2.555153, 0.4944268, 0.2235294, 1, 0, 1,
-0.4998143, -0.8282219, -2.962708, 0.2196078, 1, 0, 1,
-0.4983979, 1.300751, -1.043892, 0.2117647, 1, 0, 1,
-0.4981655, 1.446822, 1.084225, 0.2078431, 1, 0, 1,
-0.4799474, -0.1528505, -2.815753, 0.2, 1, 0, 1,
-0.4786226, 0.05133122, 0.5772815, 0.1921569, 1, 0, 1,
-0.473623, 1.063327, -0.09858494, 0.1882353, 1, 0, 1,
-0.4734629, 0.2495751, 1.133142, 0.1803922, 1, 0, 1,
-0.4730173, -1.294004, -1.919795, 0.1764706, 1, 0, 1,
-0.4729967, 0.4273524, -2.257794, 0.1686275, 1, 0, 1,
-0.4721913, 0.6663997, -2.53408, 0.1647059, 1, 0, 1,
-0.4707758, 0.4418528, 0.148724, 0.1568628, 1, 0, 1,
-0.4677865, -0.4550029, -3.964158, 0.1529412, 1, 0, 1,
-0.4669691, 0.4329472, -0.7463127, 0.145098, 1, 0, 1,
-0.4631008, -1.758084, -0.5470563, 0.1411765, 1, 0, 1,
-0.4586696, 1.991514, 1.633687, 0.1333333, 1, 0, 1,
-0.455722, 1.530652, 0.0598314, 0.1294118, 1, 0, 1,
-0.4525619, 1.413871, 1.259172, 0.1215686, 1, 0, 1,
-0.4516433, 0.4812975, -0.8970004, 0.1176471, 1, 0, 1,
-0.4507216, -3.383842, -3.133109, 0.1098039, 1, 0, 1,
-0.4497651, 0.8898134, -1.002525, 0.1058824, 1, 0, 1,
-0.4472611, -0.7679574, -0.6777514, 0.09803922, 1, 0, 1,
-0.4398994, -1.632635, -3.588634, 0.09019608, 1, 0, 1,
-0.4372851, -0.6617696, -2.20571, 0.08627451, 1, 0, 1,
-0.4343888, 1.874105, -1.93141, 0.07843138, 1, 0, 1,
-0.4311319, 0.8242903, -1.569559, 0.07450981, 1, 0, 1,
-0.4308397, 1.023956, -0.5917848, 0.06666667, 1, 0, 1,
-0.4276537, 0.5463942, -1.515419, 0.0627451, 1, 0, 1,
-0.4255245, 1.246551, -1.339513, 0.05490196, 1, 0, 1,
-0.4240145, -0.8559709, -3.424835, 0.05098039, 1, 0, 1,
-0.4165116, 0.5649416, -1.545871, 0.04313726, 1, 0, 1,
-0.4120613, -0.7837265, -3.335887, 0.03921569, 1, 0, 1,
-0.4111671, 1.528253, 1.228824, 0.03137255, 1, 0, 1,
-0.4096005, 0.9216447, -0.8388684, 0.02745098, 1, 0, 1,
-0.4081166, -1.841457, -2.749605, 0.01960784, 1, 0, 1,
-0.4052362, 0.5914022, -1.875877, 0.01568628, 1, 0, 1,
-0.4041374, -1.276807, -3.792672, 0.007843138, 1, 0, 1,
-0.4003644, 0.4822887, -0.5109422, 0.003921569, 1, 0, 1,
-0.399933, 0.04800189, -1.494956, 0, 1, 0.003921569, 1,
-0.3967821, -0.6491919, -1.521264, 0, 1, 0.01176471, 1,
-0.395834, -1.73561, -3.360101, 0, 1, 0.01568628, 1,
-0.3958004, -0.08501977, -2.609406, 0, 1, 0.02352941, 1,
-0.3938049, -2.088577, -3.08541, 0, 1, 0.02745098, 1,
-0.3920462, 2.181281, 0.9468794, 0, 1, 0.03529412, 1,
-0.3919167, -1.883354, -3.564412, 0, 1, 0.03921569, 1,
-0.384913, 1.207055, -1.1011, 0, 1, 0.04705882, 1,
-0.3846177, 0.5466281, -2.342217, 0, 1, 0.05098039, 1,
-0.3846118, -0.1196992, -3.10846, 0, 1, 0.05882353, 1,
-0.3790005, -0.9122153, -2.232659, 0, 1, 0.0627451, 1,
-0.3789878, 0.4095633, -1.152625, 0, 1, 0.07058824, 1,
-0.3737642, -0.5997164, -2.782039, 0, 1, 0.07450981, 1,
-0.3727937, -1.093695, -2.940084, 0, 1, 0.08235294, 1,
-0.3727751, 0.807587, 0.7011037, 0, 1, 0.08627451, 1,
-0.3722519, 0.2945859, -0.1477557, 0, 1, 0.09411765, 1,
-0.3693863, -0.2571596, -1.929176, 0, 1, 0.1019608, 1,
-0.3669981, 1.185425, -2.162832, 0, 1, 0.1058824, 1,
-0.3652018, 2.18766, -0.3880216, 0, 1, 0.1137255, 1,
-0.3609887, -0.4101209, -1.192266, 0, 1, 0.1176471, 1,
-0.359017, 0.4553418, -0.522433, 0, 1, 0.1254902, 1,
-0.3556752, -1.276155, -3.107038, 0, 1, 0.1294118, 1,
-0.3481075, 0.9252127, -0.05206646, 0, 1, 0.1372549, 1,
-0.3476391, 1.051481, -0.09682009, 0, 1, 0.1411765, 1,
-0.3454192, -0.8755878, 0.146473, 0, 1, 0.1490196, 1,
-0.3448665, 1.460599, 1.121643, 0, 1, 0.1529412, 1,
-0.3421597, 0.1805222, -2.348019, 0, 1, 0.1607843, 1,
-0.3420062, -1.81521, -3.026707, 0, 1, 0.1647059, 1,
-0.3403238, 0.8670667, 0.3899987, 0, 1, 0.172549, 1,
-0.338535, 0.1884024, -0.9959227, 0, 1, 0.1764706, 1,
-0.3376619, -0.2112152, -1.806664, 0, 1, 0.1843137, 1,
-0.3285303, 0.1763973, -0.6585579, 0, 1, 0.1882353, 1,
-0.3280278, -0.3646004, -1.313108, 0, 1, 0.1960784, 1,
-0.319185, -0.6719197, -3.333306, 0, 1, 0.2039216, 1,
-0.3187232, -2.169693, -3.339283, 0, 1, 0.2078431, 1,
-0.3160697, -0.7918809, -2.226058, 0, 1, 0.2156863, 1,
-0.3151974, -1.783335, -3.427117, 0, 1, 0.2196078, 1,
-0.3135514, -0.6336166, -1.503742, 0, 1, 0.227451, 1,
-0.3112849, -1.613853, -3.052685, 0, 1, 0.2313726, 1,
-0.3098685, 0.2914479, -0.4541595, 0, 1, 0.2392157, 1,
-0.3073534, 0.7215734, -0.9087784, 0, 1, 0.2431373, 1,
-0.3042623, 1.68183, 0.8177193, 0, 1, 0.2509804, 1,
-0.3022244, -0.0521098, -1.443602, 0, 1, 0.254902, 1,
-0.3020089, -1.519835, -4.488705, 0, 1, 0.2627451, 1,
-0.301351, 0.3563963, -1.038543, 0, 1, 0.2666667, 1,
-0.3002533, 0.2645013, -1.728273, 0, 1, 0.2745098, 1,
-0.2975478, -0.2550783, -1.937644, 0, 1, 0.2784314, 1,
-0.2940503, 0.9775069, 1.517573, 0, 1, 0.2862745, 1,
-0.2929516, 0.02103622, -1.210153, 0, 1, 0.2901961, 1,
-0.2883076, -0.396815, -1.339741, 0, 1, 0.2980392, 1,
-0.2875304, -0.2022756, -2.720477, 0, 1, 0.3058824, 1,
-0.2830078, 0.5268441, 0.1453521, 0, 1, 0.3098039, 1,
-0.2799856, -1.512383, -1.109611, 0, 1, 0.3176471, 1,
-0.2772506, 0.3700799, -0.61725, 0, 1, 0.3215686, 1,
-0.2759789, 0.06935439, -0.8660713, 0, 1, 0.3294118, 1,
-0.2748432, -0.592753, -2.669478, 0, 1, 0.3333333, 1,
-0.273764, -1.415164, -1.801135, 0, 1, 0.3411765, 1,
-0.271331, 0.04343751, -2.696511, 0, 1, 0.345098, 1,
-0.2638077, 0.1945376, -0.1312193, 0, 1, 0.3529412, 1,
-0.2625734, -0.5331702, -3.428879, 0, 1, 0.3568628, 1,
-0.2575128, -0.8958635, -3.794154, 0, 1, 0.3647059, 1,
-0.2570757, 1.708742, 0.9822363, 0, 1, 0.3686275, 1,
-0.2552235, 0.558299, -0.3482801, 0, 1, 0.3764706, 1,
-0.2529549, -2.039352, -4.308439, 0, 1, 0.3803922, 1,
-0.2486938, -0.7014367, -4.943022, 0, 1, 0.3882353, 1,
-0.2445767, -1.457284, -4.890127, 0, 1, 0.3921569, 1,
-0.2385072, 1.252996, -0.5976109, 0, 1, 0.4, 1,
-0.2380449, -0.00684674, -0.1854316, 0, 1, 0.4078431, 1,
-0.2368145, -1.14223, -3.654177, 0, 1, 0.4117647, 1,
-0.2315268, 1.203675, -1.031015, 0, 1, 0.4196078, 1,
-0.2293979, 1.447751, -0.2634766, 0, 1, 0.4235294, 1,
-0.2285179, -1.152284, -2.988651, 0, 1, 0.4313726, 1,
-0.2277385, -1.352355, -3.679029, 0, 1, 0.4352941, 1,
-0.2218501, 0.594559, -1.701757, 0, 1, 0.4431373, 1,
-0.2211737, 1.751322, -0.138011, 0, 1, 0.4470588, 1,
-0.2207374, -0.5868288, -0.8273763, 0, 1, 0.454902, 1,
-0.2154428, 0.6321403, -0.3009728, 0, 1, 0.4588235, 1,
-0.2130976, 0.4369465, 1.737532, 0, 1, 0.4666667, 1,
-0.2130093, 0.937082, -1.485974, 0, 1, 0.4705882, 1,
-0.208593, 1.031449, -0.5079748, 0, 1, 0.4784314, 1,
-0.2075085, -0.2641516, -0.6350317, 0, 1, 0.4823529, 1,
-0.2054505, 0.9605141, 1.436075, 0, 1, 0.4901961, 1,
-0.1987144, -0.382909, -3.012679, 0, 1, 0.4941176, 1,
-0.1927671, -0.7886374, -4.078433, 0, 1, 0.5019608, 1,
-0.1895545, -0.3370057, -3.684837, 0, 1, 0.509804, 1,
-0.1887468, 0.4374381, -0.02618118, 0, 1, 0.5137255, 1,
-0.1849233, -0.6061296, -5.015789, 0, 1, 0.5215687, 1,
-0.1845858, -0.77364, -1.66055, 0, 1, 0.5254902, 1,
-0.1819624, 0.2702088, -1.595434, 0, 1, 0.5333334, 1,
-0.180747, -2.002377, -3.756057, 0, 1, 0.5372549, 1,
-0.1799684, 0.9819251, 0.8914117, 0, 1, 0.5450981, 1,
-0.1739896, -1.253527, -3.295055, 0, 1, 0.5490196, 1,
-0.1668613, -0.2980152, -2.712707, 0, 1, 0.5568628, 1,
-0.1644619, 1.143768, 0.2782488, 0, 1, 0.5607843, 1,
-0.1635988, -1.093328, -3.529885, 0, 1, 0.5686275, 1,
-0.1559411, -0.9741135, -3.804382, 0, 1, 0.572549, 1,
-0.1557638, 0.03846338, -0.8263608, 0, 1, 0.5803922, 1,
-0.1556914, 0.09420197, -0.8949211, 0, 1, 0.5843138, 1,
-0.1550884, -1.404092, -3.076527, 0, 1, 0.5921569, 1,
-0.1521308, 2.178651, 1.06489, 0, 1, 0.5960785, 1,
-0.1510769, 0.7665183, -1.252141, 0, 1, 0.6039216, 1,
-0.150906, 1.738883, 0.6364394, 0, 1, 0.6117647, 1,
-0.150858, 1.458845, -0.8582743, 0, 1, 0.6156863, 1,
-0.1454807, -1.605275, -3.308506, 0, 1, 0.6235294, 1,
-0.1448156, 0.01792843, -2.88741, 0, 1, 0.627451, 1,
-0.142707, 0.8795061, 1.019929, 0, 1, 0.6352941, 1,
-0.1417519, -0.9180005, -2.804058, 0, 1, 0.6392157, 1,
-0.1404038, 0.3952651, -0.5799049, 0, 1, 0.6470588, 1,
-0.1399361, 0.2166725, 0.6541305, 0, 1, 0.6509804, 1,
-0.1379012, -0.9829664, -2.11627, 0, 1, 0.6588235, 1,
-0.1374466, 1.090485, 1.154648, 0, 1, 0.6627451, 1,
-0.1356798, -0.05771308, -1.514607, 0, 1, 0.6705883, 1,
-0.1350024, 0.793171, 1.354044, 0, 1, 0.6745098, 1,
-0.133048, 0.5885308, 1.835946, 0, 1, 0.682353, 1,
-0.1317933, 2.272595, 0.5244473, 0, 1, 0.6862745, 1,
-0.1299996, 0.7874035, 0.2082471, 0, 1, 0.6941177, 1,
-0.1259448, 0.994418, -0.2612861, 0, 1, 0.7019608, 1,
-0.1240111, 2.573611, -1.257378, 0, 1, 0.7058824, 1,
-0.1193033, 1.242405, -1.261253, 0, 1, 0.7137255, 1,
-0.1184349, 0.8403171, 0.4977655, 0, 1, 0.7176471, 1,
-0.1166473, -1.782518, -2.490267, 0, 1, 0.7254902, 1,
-0.1160174, 0.02945154, -1.317186, 0, 1, 0.7294118, 1,
-0.1159056, 0.3413768, -0.06297066, 0, 1, 0.7372549, 1,
-0.1133692, 0.5832824, 0.696094, 0, 1, 0.7411765, 1,
-0.1095267, 2.165484, -0.9872003, 0, 1, 0.7490196, 1,
-0.1094066, -1.341368, -3.735578, 0, 1, 0.7529412, 1,
-0.1065716, 0.2584985, -0.7175463, 0, 1, 0.7607843, 1,
-0.1034613, -0.00997424, -1.710853, 0, 1, 0.7647059, 1,
-0.1002596, 0.05550943, -2.862994, 0, 1, 0.772549, 1,
-0.0973722, 0.5190114, -0.9502423, 0, 1, 0.7764706, 1,
-0.09549167, -0.2078522, -3.055029, 0, 1, 0.7843137, 1,
-0.09353574, 0.4196694, 0.7187884, 0, 1, 0.7882353, 1,
-0.09343977, -1.213571, -1.54166, 0, 1, 0.7960784, 1,
-0.09174194, 1.810102, -1.232244, 0, 1, 0.8039216, 1,
-0.091255, -0.2279633, -1.803517, 0, 1, 0.8078431, 1,
-0.08667456, 0.6155038, -0.4315123, 0, 1, 0.8156863, 1,
-0.08100679, 0.5762908, -1.095954, 0, 1, 0.8196079, 1,
-0.07832292, 1.333926, -0.395644, 0, 1, 0.827451, 1,
-0.07768787, -0.8421221, -1.608633, 0, 1, 0.8313726, 1,
-0.07623516, 0.5447922, 0.06758905, 0, 1, 0.8392157, 1,
-0.07412332, 0.1117207, -0.5882846, 0, 1, 0.8431373, 1,
-0.07282092, -0.9847264, -3.70059, 0, 1, 0.8509804, 1,
-0.07059795, 0.3079991, 0.5428884, 0, 1, 0.854902, 1,
-0.06597663, -0.6077486, -4.84202, 0, 1, 0.8627451, 1,
-0.06392317, -0.5923078, -3.436609, 0, 1, 0.8666667, 1,
-0.06219226, 0.1046651, -0.6671738, 0, 1, 0.8745098, 1,
-0.06211274, 0.3427915, -1.145308, 0, 1, 0.8784314, 1,
-0.05804221, -1.161777, -3.633547, 0, 1, 0.8862745, 1,
-0.05641332, 1.360487, 0.5228667, 0, 1, 0.8901961, 1,
-0.05363128, 1.115279, -0.06489262, 0, 1, 0.8980392, 1,
-0.05072786, -1.111929, -2.119395, 0, 1, 0.9058824, 1,
-0.04768459, -0.1471121, -4.632152, 0, 1, 0.9098039, 1,
-0.04696634, 1.049527, 0.08531881, 0, 1, 0.9176471, 1,
-0.04451133, 0.7468285, 0.5432709, 0, 1, 0.9215686, 1,
-0.04227706, 0.9458553, -1.116658, 0, 1, 0.9294118, 1,
-0.03365623, 0.929702, 1.320775, 0, 1, 0.9333333, 1,
-0.03007575, 0.2023412, -0.5447795, 0, 1, 0.9411765, 1,
-0.02758688, -0.468119, -4.741305, 0, 1, 0.945098, 1,
-0.02243744, 0.6633201, -1.226964, 0, 1, 0.9529412, 1,
-0.02207379, -0.9985925, -4.249289, 0, 1, 0.9568627, 1,
-0.01974791, -1.980731, -3.6283, 0, 1, 0.9647059, 1,
-0.01827489, -0.7565859, -2.862742, 0, 1, 0.9686275, 1,
-0.01708796, 0.3105217, 0.7375797, 0, 1, 0.9764706, 1,
-0.01476655, 0.5685397, 1.810431, 0, 1, 0.9803922, 1,
-0.01475136, 1.152985, -1.208454, 0, 1, 0.9882353, 1,
-0.005157383, -1.287488, -3.433462, 0, 1, 0.9921569, 1,
-0.00138294, 0.6344177, 0.3184827, 0, 1, 1, 1,
-0.0002968369, -1.118336, -3.73994, 0, 0.9921569, 1, 1,
0.0009886958, 0.2091108, -0.8281115, 0, 0.9882353, 1, 1,
0.01178283, -1.395741, 1.818105, 0, 0.9803922, 1, 1,
0.01382485, -2.054175, 1.345796, 0, 0.9764706, 1, 1,
0.01612268, 0.1360448, 0.1679847, 0, 0.9686275, 1, 1,
0.01707482, -0.5162129, 4.659058, 0, 0.9647059, 1, 1,
0.01725239, -2.090856, 2.274781, 0, 0.9568627, 1, 1,
0.01762626, 0.2145784, 0.862045, 0, 0.9529412, 1, 1,
0.02016025, -0.5873257, 5.528651, 0, 0.945098, 1, 1,
0.02403404, 0.3492671, 0.1447519, 0, 0.9411765, 1, 1,
0.03074738, -0.5188663, 3.901356, 0, 0.9333333, 1, 1,
0.03597231, 0.3313831, -0.81686, 0, 0.9294118, 1, 1,
0.03786536, -0.2094945, 3.723209, 0, 0.9215686, 1, 1,
0.03846823, 0.4138023, 0.9417744, 0, 0.9176471, 1, 1,
0.03885239, 0.3119036, -0.4039573, 0, 0.9098039, 1, 1,
0.04303414, 0.3634772, 1.018525, 0, 0.9058824, 1, 1,
0.04539736, -0.6305479, 1.661878, 0, 0.8980392, 1, 1,
0.04689337, 0.01672877, 2.627479, 0, 0.8901961, 1, 1,
0.04795808, 0.2096895, 1.216942, 0, 0.8862745, 1, 1,
0.05006383, -1.047366, 3.399297, 0, 0.8784314, 1, 1,
0.05063019, 0.6391997, -0.658072, 0, 0.8745098, 1, 1,
0.05218716, -0.6932289, 1.785399, 0, 0.8666667, 1, 1,
0.05276753, -2.469132, 2.652467, 0, 0.8627451, 1, 1,
0.05627171, -0.8064023, 2.651566, 0, 0.854902, 1, 1,
0.0563641, 1.996966, -1.480798, 0, 0.8509804, 1, 1,
0.05794816, -1.344449, 2.9708, 0, 0.8431373, 1, 1,
0.05934368, 0.9019083, -0.7612095, 0, 0.8392157, 1, 1,
0.06118649, -0.2445524, 3.406404, 0, 0.8313726, 1, 1,
0.06275167, -0.8255088, 2.881153, 0, 0.827451, 1, 1,
0.06627614, 0.9642617, 0.643252, 0, 0.8196079, 1, 1,
0.06630811, 2.097214, 0.03377867, 0, 0.8156863, 1, 1,
0.0700257, -1.484363, 2.842135, 0, 0.8078431, 1, 1,
0.07379965, -0.4898617, 1.880317, 0, 0.8039216, 1, 1,
0.07501439, -0.2455012, 2.118217, 0, 0.7960784, 1, 1,
0.07629983, -0.4501749, 1.708973, 0, 0.7882353, 1, 1,
0.08062042, -0.2681424, 2.347209, 0, 0.7843137, 1, 1,
0.08096407, 0.5816148, -0.6726281, 0, 0.7764706, 1, 1,
0.08615616, 0.2117676, -0.1335378, 0, 0.772549, 1, 1,
0.08646558, 0.5805154, 0.2777658, 0, 0.7647059, 1, 1,
0.09450158, -0.1308534, 2.49844, 0, 0.7607843, 1, 1,
0.0977181, 0.1464543, 0.2654467, 0, 0.7529412, 1, 1,
0.09958542, -0.5303604, 2.433669, 0, 0.7490196, 1, 1,
0.1010416, -0.748288, 2.70034, 0, 0.7411765, 1, 1,
0.1053766, -0.7050074, 1.45038, 0, 0.7372549, 1, 1,
0.1156183, -2.405971, 2.446774, 0, 0.7294118, 1, 1,
0.1226549, -0.6170982, 3.748937, 0, 0.7254902, 1, 1,
0.1288597, 0.6899421, 0.1445355, 0, 0.7176471, 1, 1,
0.1389274, 0.2488973, 0.9709993, 0, 0.7137255, 1, 1,
0.1414715, -0.3204446, 2.871507, 0, 0.7058824, 1, 1,
0.1424005, 0.4591363, -1.165011, 0, 0.6980392, 1, 1,
0.1428039, 1.528795, 0.0416352, 0, 0.6941177, 1, 1,
0.1450065, -0.1351761, 2.499566, 0, 0.6862745, 1, 1,
0.1485565, -0.6507958, 2.635019, 0, 0.682353, 1, 1,
0.1486675, 0.1244311, 1.563747, 0, 0.6745098, 1, 1,
0.1498565, -0.2191015, 3.860017, 0, 0.6705883, 1, 1,
0.150517, -1.761351, 3.494051, 0, 0.6627451, 1, 1,
0.1510932, -1.120307, 2.650399, 0, 0.6588235, 1, 1,
0.1554229, -0.2232998, 1.235636, 0, 0.6509804, 1, 1,
0.1583017, 0.1286421, 1.526019, 0, 0.6470588, 1, 1,
0.1595876, -0.5533814, 2.987433, 0, 0.6392157, 1, 1,
0.1618682, 0.4412164, 0.6143658, 0, 0.6352941, 1, 1,
0.162204, 1.811681, -0.5795993, 0, 0.627451, 1, 1,
0.1623029, -0.1597149, 1.936968, 0, 0.6235294, 1, 1,
0.1626292, -2.458185, 2.997719, 0, 0.6156863, 1, 1,
0.1628487, -0.3830209, 4.495423, 0, 0.6117647, 1, 1,
0.1681173, -0.1972378, 1.325605, 0, 0.6039216, 1, 1,
0.173398, 0.1466899, 1.08434, 0, 0.5960785, 1, 1,
0.1739646, -0.1138241, 2.343889, 0, 0.5921569, 1, 1,
0.1817632, 0.4759834, 1.123499, 0, 0.5843138, 1, 1,
0.182519, -1.108055, 2.762723, 0, 0.5803922, 1, 1,
0.1835263, -0.6260532, 2.578327, 0, 0.572549, 1, 1,
0.1868218, -1.00664, 2.791831, 0, 0.5686275, 1, 1,
0.1926868, 1.591921, -1.686601, 0, 0.5607843, 1, 1,
0.1959824, 1.661965, 1.035047, 0, 0.5568628, 1, 1,
0.1984797, 1.013859, 1.786884, 0, 0.5490196, 1, 1,
0.1988456, 1.839615, 0.7243827, 0, 0.5450981, 1, 1,
0.1993775, -0.4273213, 3.892268, 0, 0.5372549, 1, 1,
0.1995691, 0.107651, 1.087758, 0, 0.5333334, 1, 1,
0.2048263, -1.23917, 2.586846, 0, 0.5254902, 1, 1,
0.2063371, 0.2410756, -0.3684836, 0, 0.5215687, 1, 1,
0.2099904, -1.059588, 4.163741, 0, 0.5137255, 1, 1,
0.2122639, -0.1781351, 4.347224, 0, 0.509804, 1, 1,
0.2126664, 0.4274749, 0.4249087, 0, 0.5019608, 1, 1,
0.2226524, -0.2563759, 3.095096, 0, 0.4941176, 1, 1,
0.2226844, -1.686742, 2.663299, 0, 0.4901961, 1, 1,
0.2240195, 1.520348, -1.161784, 0, 0.4823529, 1, 1,
0.224781, 1.259733, 0.5247785, 0, 0.4784314, 1, 1,
0.2252877, -0.8682208, 5.335599, 0, 0.4705882, 1, 1,
0.2284779, 1.037317, 0.1379705, 0, 0.4666667, 1, 1,
0.2311512, -0.313468, 1.373583, 0, 0.4588235, 1, 1,
0.2315223, 1.195551, 0.5270177, 0, 0.454902, 1, 1,
0.2318611, 0.3886394, 0.5586743, 0, 0.4470588, 1, 1,
0.2338293, 0.6167689, 0.9911956, 0, 0.4431373, 1, 1,
0.2343931, -1.767815, 3.060729, 0, 0.4352941, 1, 1,
0.2460638, 0.950831, 0.7383743, 0, 0.4313726, 1, 1,
0.2470283, -0.6674877, 2.188285, 0, 0.4235294, 1, 1,
0.2506652, 1.493622, -0.1572143, 0, 0.4196078, 1, 1,
0.2520519, -0.895606, 2.317202, 0, 0.4117647, 1, 1,
0.2555979, -1.293869, 3.088371, 0, 0.4078431, 1, 1,
0.2567564, -1.537857, 2.953224, 0, 0.4, 1, 1,
0.2571742, 0.9303306, 1.588595, 0, 0.3921569, 1, 1,
0.2577864, -1.16203, 3.892293, 0, 0.3882353, 1, 1,
0.2595221, 0.6165004, 0.5363028, 0, 0.3803922, 1, 1,
0.2619134, 0.5234388, -0.5027534, 0, 0.3764706, 1, 1,
0.2625453, -0.6492695, 2.80018, 0, 0.3686275, 1, 1,
0.266382, -0.7758948, 3.68063, 0, 0.3647059, 1, 1,
0.2664061, 1.206109, 0.2939547, 0, 0.3568628, 1, 1,
0.2672561, -0.4667574, 1.562948, 0, 0.3529412, 1, 1,
0.2742872, -0.4816706, 2.808887, 0, 0.345098, 1, 1,
0.2804941, -0.9513356, 2.974028, 0, 0.3411765, 1, 1,
0.2810003, 1.192593, 1.26601, 0, 0.3333333, 1, 1,
0.2811321, -0.7295195, 2.598348, 0, 0.3294118, 1, 1,
0.2837024, -0.3106366, 1.802807, 0, 0.3215686, 1, 1,
0.2930029, 0.0008195291, 2.541951, 0, 0.3176471, 1, 1,
0.2956634, 0.5992403, 0.9461703, 0, 0.3098039, 1, 1,
0.2960717, 0.1921559, 1.034031, 0, 0.3058824, 1, 1,
0.2973202, -0.4613422, 2.697118, 0, 0.2980392, 1, 1,
0.2983659, -1.279211, 2.035015, 0, 0.2901961, 1, 1,
0.2985692, 0.1123435, 1.924727, 0, 0.2862745, 1, 1,
0.2987213, 0.931823, 0.004552109, 0, 0.2784314, 1, 1,
0.2989651, -1.356081, 1.089445, 0, 0.2745098, 1, 1,
0.3038746, -1.294567, 3.089496, 0, 0.2666667, 1, 1,
0.3067954, 1.637856, 0.04001091, 0, 0.2627451, 1, 1,
0.3081533, 0.812806, 1.141215, 0, 0.254902, 1, 1,
0.3100857, 1.30476, -0.4738625, 0, 0.2509804, 1, 1,
0.3137106, -0.9707447, 4.237637, 0, 0.2431373, 1, 1,
0.3146349, 0.9305829, -0.3782072, 0, 0.2392157, 1, 1,
0.3200952, -0.4165456, 2.244799, 0, 0.2313726, 1, 1,
0.3216519, -0.5058721, 1.899284, 0, 0.227451, 1, 1,
0.3248256, 0.1787082, 1.334693, 0, 0.2196078, 1, 1,
0.3272268, -0.881723, 3.209781, 0, 0.2156863, 1, 1,
0.3275513, -0.284838, 3.943285, 0, 0.2078431, 1, 1,
0.3298744, -0.7970954, 1.736652, 0, 0.2039216, 1, 1,
0.3315758, 0.6437221, 0.04725081, 0, 0.1960784, 1, 1,
0.3348338, -0.2071631, 3.619932, 0, 0.1882353, 1, 1,
0.3369546, 0.106952, 0.9038237, 0, 0.1843137, 1, 1,
0.3381485, 0.1787328, 1.357054, 0, 0.1764706, 1, 1,
0.3382913, -0.09275106, 3.934709, 0, 0.172549, 1, 1,
0.3419821, -0.05507001, 1.37448, 0, 0.1647059, 1, 1,
0.3425254, 0.831432, 1.507007, 0, 0.1607843, 1, 1,
0.3434606, -0.04191187, 0.3967531, 0, 0.1529412, 1, 1,
0.3439757, 0.05012042, 0.5094883, 0, 0.1490196, 1, 1,
0.3455216, 0.509385, -1.032752, 0, 0.1411765, 1, 1,
0.3469306, 1.279918, 1.439496, 0, 0.1372549, 1, 1,
0.3497183, 0.3914402, 0.04753467, 0, 0.1294118, 1, 1,
0.3516478, -1.418668, 2.973877, 0, 0.1254902, 1, 1,
0.353038, -0.6692467, 2.789905, 0, 0.1176471, 1, 1,
0.353306, 1.109342, -0.1223263, 0, 0.1137255, 1, 1,
0.3546184, -0.4760133, 0.4004022, 0, 0.1058824, 1, 1,
0.3599885, 0.4404814, 0.3813513, 0, 0.09803922, 1, 1,
0.3602035, 1.073738, 0.8496267, 0, 0.09411765, 1, 1,
0.3642865, 0.3041652, 0.04852517, 0, 0.08627451, 1, 1,
0.3645694, -0.4892107, 1.376957, 0, 0.08235294, 1, 1,
0.3661623, 0.2273294, 1.286915, 0, 0.07450981, 1, 1,
0.3679579, 1.224728, 0.9343644, 0, 0.07058824, 1, 1,
0.3681592, 0.9976926, -0.5938675, 0, 0.0627451, 1, 1,
0.3731054, -0.9702229, 2.571802, 0, 0.05882353, 1, 1,
0.3759362, -1.963576, 3.624717, 0, 0.05098039, 1, 1,
0.3766162, -1.377147, 4.936559, 0, 0.04705882, 1, 1,
0.3798338, 0.04126358, 2.404136, 0, 0.03921569, 1, 1,
0.3893217, 0.02127865, 2.839982, 0, 0.03529412, 1, 1,
0.3903863, 0.2160509, -0.1973849, 0, 0.02745098, 1, 1,
0.3904008, 0.4384747, 0.8619301, 0, 0.02352941, 1, 1,
0.4008383, 0.2166346, 1.558274, 0, 0.01568628, 1, 1,
0.4009331, 0.5566394, -0.1175166, 0, 0.01176471, 1, 1,
0.4025578, 0.6629345, 0.1294884, 0, 0.003921569, 1, 1,
0.4073345, -0.6003996, 2.565433, 0.003921569, 0, 1, 1,
0.4092067, -0.3438876, 2.375951, 0.007843138, 0, 1, 1,
0.4152583, 1.556998, -0.1465623, 0.01568628, 0, 1, 1,
0.4164495, 0.01978006, 1.61609, 0.01960784, 0, 1, 1,
0.4216586, -1.785483, 4.058601, 0.02745098, 0, 1, 1,
0.4243016, 0.5652255, -0.1016833, 0.03137255, 0, 1, 1,
0.4252919, 1.064843, 1.357328, 0.03921569, 0, 1, 1,
0.4255709, -0.8102652, 1.998732, 0.04313726, 0, 1, 1,
0.4270472, -1.22094, 2.147874, 0.05098039, 0, 1, 1,
0.4274667, -0.01299091, 2.981252, 0.05490196, 0, 1, 1,
0.4284596, 0.2352645, 0.3301844, 0.0627451, 0, 1, 1,
0.428788, -0.4707328, 3.599851, 0.06666667, 0, 1, 1,
0.4314136, 2.255055, 1.279093, 0.07450981, 0, 1, 1,
0.4364243, 1.00914, 0.7471984, 0.07843138, 0, 1, 1,
0.4365092, 1.682966, -0.5868378, 0.08627451, 0, 1, 1,
0.4371832, -0.900219, 1.907336, 0.09019608, 0, 1, 1,
0.4387004, 1.184629, -1.548737, 0.09803922, 0, 1, 1,
0.4389147, 0.3762218, 1.587017, 0.1058824, 0, 1, 1,
0.4461933, -1.494884, 3.084102, 0.1098039, 0, 1, 1,
0.446621, -1.509368, 2.756635, 0.1176471, 0, 1, 1,
0.4482296, 0.3534366, 0.9977599, 0.1215686, 0, 1, 1,
0.4550185, 0.8916156, 0.1067652, 0.1294118, 0, 1, 1,
0.4593082, 0.1170894, 1.723587, 0.1333333, 0, 1, 1,
0.467079, 0.4524615, 0.4587897, 0.1411765, 0, 1, 1,
0.4680919, -0.2399391, 2.049882, 0.145098, 0, 1, 1,
0.4713474, 0.5322556, 3.240355, 0.1529412, 0, 1, 1,
0.4761926, -2.649126, 2.284715, 0.1568628, 0, 1, 1,
0.4773335, -0.3852335, 0.8205839, 0.1647059, 0, 1, 1,
0.4780577, 1.552366, -1.073876, 0.1686275, 0, 1, 1,
0.4824439, 1.127794, 0.6704364, 0.1764706, 0, 1, 1,
0.4883753, 0.6527108, 2.21544, 0.1803922, 0, 1, 1,
0.4953921, -0.2166151, 2.14053, 0.1882353, 0, 1, 1,
0.4963245, 0.1433406, -0.2357636, 0.1921569, 0, 1, 1,
0.5104196, -0.4037244, 1.449167, 0.2, 0, 1, 1,
0.5120942, -1.139119, 3.023513, 0.2078431, 0, 1, 1,
0.5146399, -0.03893182, 2.765329, 0.2117647, 0, 1, 1,
0.5184292, 0.7222198, 1.766922, 0.2196078, 0, 1, 1,
0.5197417, -0.2699462, 0.2598591, 0.2235294, 0, 1, 1,
0.5210346, -0.56576, 1.535875, 0.2313726, 0, 1, 1,
0.5274286, 0.5856708, -1.60091, 0.2352941, 0, 1, 1,
0.5293422, -0.7748409, 2.150208, 0.2431373, 0, 1, 1,
0.5359313, 0.6549808, 0.8832633, 0.2470588, 0, 1, 1,
0.5423983, 0.09067068, 0.5259954, 0.254902, 0, 1, 1,
0.5443917, 0.5139092, 0.3356771, 0.2588235, 0, 1, 1,
0.5470127, 0.3911057, -1.708856, 0.2666667, 0, 1, 1,
0.5476128, 0.5090458, -1.438268, 0.2705882, 0, 1, 1,
0.5537171, -0.21188, 1.995642, 0.2784314, 0, 1, 1,
0.5555375, -1.561765, 2.34834, 0.282353, 0, 1, 1,
0.5571345, -0.2903269, 2.205043, 0.2901961, 0, 1, 1,
0.5578831, 0.04151851, 2.839566, 0.2941177, 0, 1, 1,
0.5611085, 0.6192262, -0.3357863, 0.3019608, 0, 1, 1,
0.5619847, -0.708957, 4.22473, 0.3098039, 0, 1, 1,
0.5662289, -0.4787295, 2.743837, 0.3137255, 0, 1, 1,
0.5681131, 0.09881897, 1.794529, 0.3215686, 0, 1, 1,
0.569678, -1.061335, 3.078346, 0.3254902, 0, 1, 1,
0.5698094, -0.8339866, 2.342019, 0.3333333, 0, 1, 1,
0.5703084, 0.2819623, 1.291854, 0.3372549, 0, 1, 1,
0.5713347, 0.003225954, -0.25712, 0.345098, 0, 1, 1,
0.5746118, -0.523228, 2.607547, 0.3490196, 0, 1, 1,
0.5786599, -1.667253, 2.431461, 0.3568628, 0, 1, 1,
0.5821409, 0.2575848, 2.048325, 0.3607843, 0, 1, 1,
0.5853642, -0.8024049, 2.330601, 0.3686275, 0, 1, 1,
0.5904366, -0.6247069, 1.911377, 0.372549, 0, 1, 1,
0.5907777, -0.783385, 2.033018, 0.3803922, 0, 1, 1,
0.591997, 0.3658767, 1.203694, 0.3843137, 0, 1, 1,
0.5950651, 0.5153662, 1.703274, 0.3921569, 0, 1, 1,
0.5951508, 1.177724, 0.2960083, 0.3960784, 0, 1, 1,
0.5957296, 0.2044827, -0.4336659, 0.4039216, 0, 1, 1,
0.6030282, -1.403461, 2.875045, 0.4117647, 0, 1, 1,
0.6058284, 0.6511639, 2.017027, 0.4156863, 0, 1, 1,
0.6093532, 0.600953, 1.324107, 0.4235294, 0, 1, 1,
0.6109825, 0.7893094, 0.8864631, 0.427451, 0, 1, 1,
0.6154668, 0.1197747, 2.302032, 0.4352941, 0, 1, 1,
0.6156805, -0.02896009, 2.710275, 0.4392157, 0, 1, 1,
0.6175247, -0.3723038, 3.190382, 0.4470588, 0, 1, 1,
0.6238911, -0.1522531, 3.016062, 0.4509804, 0, 1, 1,
0.6276296, -0.3967788, 3.162494, 0.4588235, 0, 1, 1,
0.6395417, 0.4569111, -0.9438168, 0.4627451, 0, 1, 1,
0.6489451, 0.3691629, 0.7302252, 0.4705882, 0, 1, 1,
0.6572871, 0.4780856, 1.911494, 0.4745098, 0, 1, 1,
0.6590143, -1.110892, 3.45424, 0.4823529, 0, 1, 1,
0.6601486, 1.011534, -0.3842919, 0.4862745, 0, 1, 1,
0.6739739, 0.05313852, 1.132539, 0.4941176, 0, 1, 1,
0.6784868, 1.57821, 1.483053, 0.5019608, 0, 1, 1,
0.6838986, 0.6189007, 1.058315, 0.5058824, 0, 1, 1,
0.6932871, -1.678043, 3.256041, 0.5137255, 0, 1, 1,
0.6982126, 0.8414757, 1.305852, 0.5176471, 0, 1, 1,
0.7059993, -2.918923, 1.191153, 0.5254902, 0, 1, 1,
0.7099706, 0.913923, 0.8677295, 0.5294118, 0, 1, 1,
0.7102869, -0.6244038, 1.844443, 0.5372549, 0, 1, 1,
0.7158766, 1.979577, 0.3764623, 0.5411765, 0, 1, 1,
0.7186981, -0.03706412, 1.121929, 0.5490196, 0, 1, 1,
0.7347839, -1.320868, 1.757457, 0.5529412, 0, 1, 1,
0.7354332, 1.17171, -1.899808, 0.5607843, 0, 1, 1,
0.7369775, 0.643053, 2.652072, 0.5647059, 0, 1, 1,
0.7377865, -0.2003315, 2.046183, 0.572549, 0, 1, 1,
0.738713, -0.4337617, 3.216946, 0.5764706, 0, 1, 1,
0.739727, 1.452005, 0.2394895, 0.5843138, 0, 1, 1,
0.7400522, 1.245419, 2.723842, 0.5882353, 0, 1, 1,
0.7411319, -0.5393758, 2.256007, 0.5960785, 0, 1, 1,
0.7431131, 0.1501353, 1.550714, 0.6039216, 0, 1, 1,
0.7464058, 0.5284669, 1.085433, 0.6078432, 0, 1, 1,
0.7498271, -1.007797, 3.921609, 0.6156863, 0, 1, 1,
0.7535795, -0.8292051, 3.076524, 0.6196079, 0, 1, 1,
0.7569074, -0.158577, 2.940938, 0.627451, 0, 1, 1,
0.7594558, 1.531867, -1.310648, 0.6313726, 0, 1, 1,
0.760628, -1.353631, 4.284324, 0.6392157, 0, 1, 1,
0.7641342, -1.675508, 3.645295, 0.6431373, 0, 1, 1,
0.7729202, -2.697068, 3.041528, 0.6509804, 0, 1, 1,
0.7877231, 0.5751334, 2.432112, 0.654902, 0, 1, 1,
0.7948, 1.999729, 1.931212, 0.6627451, 0, 1, 1,
0.7956662, -1.669421, 3.548736, 0.6666667, 0, 1, 1,
0.7988871, -0.4227051, 1.563015, 0.6745098, 0, 1, 1,
0.8006749, -0.04284626, 2.831866, 0.6784314, 0, 1, 1,
0.806769, -2.045181, 4.019373, 0.6862745, 0, 1, 1,
0.8103819, -0.662899, 1.540637, 0.6901961, 0, 1, 1,
0.8122708, -0.7668637, 2.108159, 0.6980392, 0, 1, 1,
0.8174542, -0.1141025, 1.64325, 0.7058824, 0, 1, 1,
0.8214183, -0.2536514, 0.2117393, 0.7098039, 0, 1, 1,
0.821473, 1.223735, -0.8447613, 0.7176471, 0, 1, 1,
0.8224088, -1.87994, 1.68474, 0.7215686, 0, 1, 1,
0.8240841, 0.8002242, 0.3655714, 0.7294118, 0, 1, 1,
0.8244702, -0.1359304, 1.269471, 0.7333333, 0, 1, 1,
0.8252859, -1.585517, 2.658162, 0.7411765, 0, 1, 1,
0.8353145, -0.382354, 2.622562, 0.7450981, 0, 1, 1,
0.8404113, -0.8212093, 1.107789, 0.7529412, 0, 1, 1,
0.8460132, -1.634038, 2.143993, 0.7568628, 0, 1, 1,
0.847593, -0.7453405, 0.8463541, 0.7647059, 0, 1, 1,
0.850897, -0.4872764, 0.5681655, 0.7686275, 0, 1, 1,
0.8527713, -2.169331, 3.812105, 0.7764706, 0, 1, 1,
0.8545839, -0.7856338, 1.922973, 0.7803922, 0, 1, 1,
0.8552781, -0.4372006, 2.205654, 0.7882353, 0, 1, 1,
0.8584376, -0.4801301, 1.021134, 0.7921569, 0, 1, 1,
0.8596932, -0.1930731, 1.597455, 0.8, 0, 1, 1,
0.8599772, -1.030153, 3.372311, 0.8078431, 0, 1, 1,
0.8635475, 1.125651, 0.1827716, 0.8117647, 0, 1, 1,
0.8766189, -1.217109, 1.11611, 0.8196079, 0, 1, 1,
0.8779868, 2.543556, 0.3225372, 0.8235294, 0, 1, 1,
0.8828707, -0.008271343, 0.802142, 0.8313726, 0, 1, 1,
0.8858408, 0.3259785, 1.636827, 0.8352941, 0, 1, 1,
0.8871111, -1.078712, 2.390398, 0.8431373, 0, 1, 1,
0.8877697, 1.079163, 1.845422, 0.8470588, 0, 1, 1,
0.8888449, 0.6034022, 0.4365759, 0.854902, 0, 1, 1,
0.8944749, 0.8835393, 1.275913, 0.8588235, 0, 1, 1,
0.8988227, 0.2618562, 1.544801, 0.8666667, 0, 1, 1,
0.9010515, 0.007103049, 1.467749, 0.8705882, 0, 1, 1,
0.9051594, 0.3726474, -0.2319733, 0.8784314, 0, 1, 1,
0.907989, -0.2339234, 3.016371, 0.8823529, 0, 1, 1,
0.912392, -0.000644964, 1.042393, 0.8901961, 0, 1, 1,
0.9183437, -0.6759136, 3.056141, 0.8941177, 0, 1, 1,
0.9209939, 0.2191689, 2.410031, 0.9019608, 0, 1, 1,
0.9323066, 0.1900197, 0.01251744, 0.9098039, 0, 1, 1,
0.933451, -1.852275, 4.17616, 0.9137255, 0, 1, 1,
0.9348499, 0.6600502, 2.072991, 0.9215686, 0, 1, 1,
0.9353029, 0.6406842, 2.143528, 0.9254902, 0, 1, 1,
0.9390382, -1.622906, 4.521169, 0.9333333, 0, 1, 1,
0.9553756, 0.4641528, 1.887477, 0.9372549, 0, 1, 1,
0.9560121, 0.6805717, 2.019978, 0.945098, 0, 1, 1,
0.9616867, 0.4885904, 1.571543, 0.9490196, 0, 1, 1,
0.9674885, 2.545959, 0.3439904, 0.9568627, 0, 1, 1,
0.9846556, 1.001415, 2.632113, 0.9607843, 0, 1, 1,
0.9907155, 0.03211668, -0.04188106, 0.9686275, 0, 1, 1,
0.9929808, -0.864766, 1.416794, 0.972549, 0, 1, 1,
1.006452, 0.5033402, 1.219107, 0.9803922, 0, 1, 1,
1.009936, 0.5789573, 1.267692, 0.9843137, 0, 1, 1,
1.010676, 0.09488248, 3.384525, 0.9921569, 0, 1, 1,
1.012932, 0.197013, -0.2309314, 0.9960784, 0, 1, 1,
1.01565, 0.4952897, -0.6665886, 1, 0, 0.9960784, 1,
1.017034, -0.5535837, 0.387809, 1, 0, 0.9882353, 1,
1.018901, -0.5995547, 2.860675, 1, 0, 0.9843137, 1,
1.020254, -1.250199, 2.01622, 1, 0, 0.9764706, 1,
1.037504, -1.456339, 1.835824, 1, 0, 0.972549, 1,
1.038246, -0.3001669, 2.869091, 1, 0, 0.9647059, 1,
1.041392, -0.6795737, 0.2680199, 1, 0, 0.9607843, 1,
1.046841, 0.7899837, 2.222401, 1, 0, 0.9529412, 1,
1.050584, -1.367404, 2.185516, 1, 0, 0.9490196, 1,
1.054465, 0.2200244, 1.160312, 1, 0, 0.9411765, 1,
1.059091, 0.2740556, -0.004889377, 1, 0, 0.9372549, 1,
1.061269, 0.468158, 1.285723, 1, 0, 0.9294118, 1,
1.061965, -0.8836144, 2.700118, 1, 0, 0.9254902, 1,
1.063641, 2.317221, 0.07743194, 1, 0, 0.9176471, 1,
1.065204, 0.3281364, 1.957859, 1, 0, 0.9137255, 1,
1.068182, 0.2071702, 2.738455, 1, 0, 0.9058824, 1,
1.07992, 1.306777, -0.1770183, 1, 0, 0.9019608, 1,
1.084928, 0.1471906, 0.7814724, 1, 0, 0.8941177, 1,
1.085924, 1.307543, -0.009829906, 1, 0, 0.8862745, 1,
1.087903, 0.5187273, 0.20715, 1, 0, 0.8823529, 1,
1.087998, 1.550885, 0.8529706, 1, 0, 0.8745098, 1,
1.089319, 1.14154, 1.906477, 1, 0, 0.8705882, 1,
1.097835, -1.769282, 3.72245, 1, 0, 0.8627451, 1,
1.100642, 0.157542, 3.556038, 1, 0, 0.8588235, 1,
1.101263, -1.698919, 2.220092, 1, 0, 0.8509804, 1,
1.106761, -0.4534787, 2.823246, 1, 0, 0.8470588, 1,
1.116259, 0.6171751, 2.960084, 1, 0, 0.8392157, 1,
1.116431, 0.2144089, 3.0887, 1, 0, 0.8352941, 1,
1.11937, 0.9145266, 1.245461, 1, 0, 0.827451, 1,
1.12149, 1.236857, -0.8908643, 1, 0, 0.8235294, 1,
1.123679, -0.1746072, 0.6333914, 1, 0, 0.8156863, 1,
1.132715, -0.8598893, 1.465512, 1, 0, 0.8117647, 1,
1.133212, -0.6555039, 1.113502, 1, 0, 0.8039216, 1,
1.134397, 0.1960862, 1.204313, 1, 0, 0.7960784, 1,
1.135859, 1.720465, 0.200062, 1, 0, 0.7921569, 1,
1.141614, -0.8499413, 1.43537, 1, 0, 0.7843137, 1,
1.148102, 1.41394, 1.026444, 1, 0, 0.7803922, 1,
1.158134, -1.965666, 2.341951, 1, 0, 0.772549, 1,
1.162883, -0.2306202, -0.5378687, 1, 0, 0.7686275, 1,
1.16582, -2.149659, 1.776848, 1, 0, 0.7607843, 1,
1.168654, 1.179778, -0.5199741, 1, 0, 0.7568628, 1,
1.169902, -1.106879, 1.872057, 1, 0, 0.7490196, 1,
1.171432, 1.401161, 0.9086692, 1, 0, 0.7450981, 1,
1.172669, -1.325969, 1.797776, 1, 0, 0.7372549, 1,
1.17369, -1.137749, 0.8731238, 1, 0, 0.7333333, 1,
1.181173, -0.2941998, 2.077965, 1, 0, 0.7254902, 1,
1.188462, 1.306134, 0.3321992, 1, 0, 0.7215686, 1,
1.195352, 0.133997, 1.475855, 1, 0, 0.7137255, 1,
1.198238, -1.313472, 2.139014, 1, 0, 0.7098039, 1,
1.200194, -0.9113808, 2.096243, 1, 0, 0.7019608, 1,
1.20708, -0.5648791, 2.062192, 1, 0, 0.6941177, 1,
1.210945, 0.8055382, 2.093479, 1, 0, 0.6901961, 1,
1.211107, 0.4888295, 1.708779, 1, 0, 0.682353, 1,
1.211131, 0.5458252, 2.27138, 1, 0, 0.6784314, 1,
1.213817, 0.207911, 1.084409, 1, 0, 0.6705883, 1,
1.216095, 0.4742848, 0.9220068, 1, 0, 0.6666667, 1,
1.21803, 1.326824, 0.2829369, 1, 0, 0.6588235, 1,
1.219536, -0.2097479, 0.254177, 1, 0, 0.654902, 1,
1.219554, -0.5201559, 3.177643, 1, 0, 0.6470588, 1,
1.234194, 0.4973495, 2.341534, 1, 0, 0.6431373, 1,
1.242567, -0.7949354, 4.166059, 1, 0, 0.6352941, 1,
1.246573, 0.668287, 1.948401, 1, 0, 0.6313726, 1,
1.247638, -1.302498, 3.443666, 1, 0, 0.6235294, 1,
1.248344, -0.1667265, 0.6342718, 1, 0, 0.6196079, 1,
1.280751, 0.6346354, 4.03213, 1, 0, 0.6117647, 1,
1.281861, 1.428833, 0.6188065, 1, 0, 0.6078432, 1,
1.285137, 0.5518787, 2.366083, 1, 0, 0.6, 1,
1.286469, 0.893046, 1.162668, 1, 0, 0.5921569, 1,
1.292428, -0.6087257, 0.2873195, 1, 0, 0.5882353, 1,
1.308083, -2.032399, 1.10007, 1, 0, 0.5803922, 1,
1.315379, -0.02194077, 1.281585, 1, 0, 0.5764706, 1,
1.315401, -0.534414, 1.569351, 1, 0, 0.5686275, 1,
1.316764, -0.1510751, 1.492753, 1, 0, 0.5647059, 1,
1.319148, 0.6570617, 3.57853, 1, 0, 0.5568628, 1,
1.326103, -0.6145343, -0.1831872, 1, 0, 0.5529412, 1,
1.331375, -0.3126109, 1.43167, 1, 0, 0.5450981, 1,
1.341182, 2.121939, -0.9885055, 1, 0, 0.5411765, 1,
1.344949, 1.288072, 1.529437, 1, 0, 0.5333334, 1,
1.347559, -0.06750397, 2.544442, 1, 0, 0.5294118, 1,
1.367546, -0.3921911, 1.047927, 1, 0, 0.5215687, 1,
1.378736, -0.2030504, 2.519677, 1, 0, 0.5176471, 1,
1.379653, -1.042914, 3.463083, 1, 0, 0.509804, 1,
1.382486, 0.4173758, 2.854998, 1, 0, 0.5058824, 1,
1.387578, -1.142683, 1.55747, 1, 0, 0.4980392, 1,
1.392087, -1.613535, 2.728599, 1, 0, 0.4901961, 1,
1.408918, -0.7288522, 0.5763313, 1, 0, 0.4862745, 1,
1.412349, -0.009528421, 0.910605, 1, 0, 0.4784314, 1,
1.418762, 0.08723701, 0.6896095, 1, 0, 0.4745098, 1,
1.437592, 0.3229591, 1.115941, 1, 0, 0.4666667, 1,
1.455544, -0.4313851, 2.096604, 1, 0, 0.4627451, 1,
1.457924, 0.5225507, 0.3876081, 1, 0, 0.454902, 1,
1.45943, -1.054118, 1.565676, 1, 0, 0.4509804, 1,
1.46134, -0.6003193, 2.014139, 1, 0, 0.4431373, 1,
1.462073, 0.2778154, 1.102093, 1, 0, 0.4392157, 1,
1.472305, -0.08291255, 1.156592, 1, 0, 0.4313726, 1,
1.494873, -0.89299, 1.121398, 1, 0, 0.427451, 1,
1.512032, 1.249286, -0.0283706, 1, 0, 0.4196078, 1,
1.521579, -0.6514644, 1.377124, 1, 0, 0.4156863, 1,
1.533786, 2.370468, 2.855731, 1, 0, 0.4078431, 1,
1.539334, 0.004044176, 1.278559, 1, 0, 0.4039216, 1,
1.548057, -1.060253, 2.348139, 1, 0, 0.3960784, 1,
1.548135, 0.3436177, 1.853294, 1, 0, 0.3882353, 1,
1.551634, 1.422779, -0.1859683, 1, 0, 0.3843137, 1,
1.577839, 0.1302734, 2.262651, 1, 0, 0.3764706, 1,
1.578106, 0.6876777, 0.2870905, 1, 0, 0.372549, 1,
1.583871, 0.9657611, 2.170544, 1, 0, 0.3647059, 1,
1.588885, -0.6778495, 1.83723, 1, 0, 0.3607843, 1,
1.59409, -0.9656653, 2.748071, 1, 0, 0.3529412, 1,
1.604199, -1.451244, 2.406465, 1, 0, 0.3490196, 1,
1.632335, -0.7929443, 4.346972, 1, 0, 0.3411765, 1,
1.633806, -1.679584, 0.7982429, 1, 0, 0.3372549, 1,
1.64123, -0.6287084, 2.527236, 1, 0, 0.3294118, 1,
1.642549, 0.9308423, 1.331176, 1, 0, 0.3254902, 1,
1.644967, -0.9086981, 0.7052937, 1, 0, 0.3176471, 1,
1.655682, -1.106523, 1.93352, 1, 0, 0.3137255, 1,
1.65623, -1.719025, 3.549021, 1, 0, 0.3058824, 1,
1.691314, 0.2910894, 1.538366, 1, 0, 0.2980392, 1,
1.694288, 0.1374564, 1.557729, 1, 0, 0.2941177, 1,
1.730156, -0.568612, 0.9304683, 1, 0, 0.2862745, 1,
1.752368, 0.7839298, -0.2596845, 1, 0, 0.282353, 1,
1.754319, 0.8495343, 1.432265, 1, 0, 0.2745098, 1,
1.764406, 1.103611, 1.173169, 1, 0, 0.2705882, 1,
1.777796, -0.5004507, 3.563117, 1, 0, 0.2627451, 1,
1.78381, -0.8227311, 2.897021, 1, 0, 0.2588235, 1,
1.799339, 0.3869932, 1.035004, 1, 0, 0.2509804, 1,
1.8064, -0.5681255, 2.550941, 1, 0, 0.2470588, 1,
1.806849, 0.1044036, 0.7850671, 1, 0, 0.2392157, 1,
1.807236, 1.833957, 1.890753, 1, 0, 0.2352941, 1,
1.809298, 0.1781794, 2.003998, 1, 0, 0.227451, 1,
1.825029, 1.957989, 1.622763, 1, 0, 0.2235294, 1,
1.826675, 0.4631825, 1.487455, 1, 0, 0.2156863, 1,
1.835932, 2.045682, 0.7151015, 1, 0, 0.2117647, 1,
1.841701, 0.518879, 0.5749362, 1, 0, 0.2039216, 1,
1.855043, 0.2468381, 2.304166, 1, 0, 0.1960784, 1,
1.870775, 0.3048963, -0.3962154, 1, 0, 0.1921569, 1,
1.898162, -0.1899536, 2.349742, 1, 0, 0.1843137, 1,
1.904395, -0.7735134, 3.622652, 1, 0, 0.1803922, 1,
1.919673, -0.4408392, 2.846042, 1, 0, 0.172549, 1,
1.953076, -0.031337, 2.338462, 1, 0, 0.1686275, 1,
1.954132, -0.1962593, 2.705684, 1, 0, 0.1607843, 1,
1.955269, -0.3559867, 2.570192, 1, 0, 0.1568628, 1,
1.957124, -1.33066, 1.73585, 1, 0, 0.1490196, 1,
1.965356, -0.7749935, 0.5845329, 1, 0, 0.145098, 1,
1.969039, 0.6586416, 1.835805, 1, 0, 0.1372549, 1,
2.01256, -0.493665, 0.8544955, 1, 0, 0.1333333, 1,
2.030028, -2.05073, 1.385686, 1, 0, 0.1254902, 1,
2.06397, -0.124141, 0.7982722, 1, 0, 0.1215686, 1,
2.065362, -0.6436335, 2.514354, 1, 0, 0.1137255, 1,
2.071838, -0.1653504, 1.381042, 1, 0, 0.1098039, 1,
2.096531, 1.230906, 1.571967, 1, 0, 0.1019608, 1,
2.104798, 1.544943, -1.118321, 1, 0, 0.09411765, 1,
2.173155, 0.1039147, 2.745586, 1, 0, 0.09019608, 1,
2.177802, -2.105827, 0.4998475, 1, 0, 0.08235294, 1,
2.212315, 0.8968005, 3.262157, 1, 0, 0.07843138, 1,
2.300395, 0.1609885, 1.62165, 1, 0, 0.07058824, 1,
2.304408, -0.4416882, 1.078478, 1, 0, 0.06666667, 1,
2.364126, 0.1736667, 0.2980909, 1, 0, 0.05882353, 1,
2.393952, 1.383722, 0.4968771, 1, 0, 0.05490196, 1,
2.437492, -1.07677, 2.820918, 1, 0, 0.04705882, 1,
2.498328, -0.5648535, 2.165898, 1, 0, 0.04313726, 1,
2.498994, 0.5941466, 0.418794, 1, 0, 0.03529412, 1,
2.620297, -2.005141, 4.755254, 1, 0, 0.03137255, 1,
2.623996, 0.1584577, 1.27712, 1, 0, 0.02352941, 1,
3.064411, -0.948293, 0.290379, 1, 0, 0.01960784, 1,
3.230356, 1.5525, 0.941898, 1, 0, 0.01176471, 1,
3.712279, -0.5537285, 1.67886, 1, 0, 0.007843138, 1
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
0.1506755, -4.418508, -6.803071, 0, -0.5, 0.5, 0.5,
0.1506755, -4.418508, -6.803071, 1, -0.5, 0.5, 0.5,
0.1506755, -4.418508, -6.803071, 1, 1.5, 0.5, 0.5,
0.1506755, -4.418508, -6.803071, 0, 1.5, 0.5, 0.5
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
-4.618311, -0.3317299, -6.803071, 0, -0.5, 0.5, 0.5,
-4.618311, -0.3317299, -6.803071, 1, -0.5, 0.5, 0.5,
-4.618311, -0.3317299, -6.803071, 1, 1.5, 0.5, 0.5,
-4.618311, -0.3317299, -6.803071, 0, 1.5, 0.5, 0.5
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
-4.618311, -4.418508, 0.2564313, 0, -0.5, 0.5, 0.5,
-4.618311, -4.418508, 0.2564313, 1, -0.5, 0.5, 0.5,
-4.618311, -4.418508, 0.2564313, 1, 1.5, 0.5, 0.5,
-4.618311, -4.418508, 0.2564313, 0, 1.5, 0.5, 0.5
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
-2, -3.475405, -5.173955,
2, -3.475405, -5.173955,
-2, -3.475405, -5.173955,
-2, -3.632589, -5.445475,
0, -3.475405, -5.173955,
0, -3.632589, -5.445475,
2, -3.475405, -5.173955,
2, -3.632589, -5.445475
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
-2, -3.946956, -5.988513, 0, -0.5, 0.5, 0.5,
-2, -3.946956, -5.988513, 1, -0.5, 0.5, 0.5,
-2, -3.946956, -5.988513, 1, 1.5, 0.5, 0.5,
-2, -3.946956, -5.988513, 0, 1.5, 0.5, 0.5,
0, -3.946956, -5.988513, 0, -0.5, 0.5, 0.5,
0, -3.946956, -5.988513, 1, -0.5, 0.5, 0.5,
0, -3.946956, -5.988513, 1, 1.5, 0.5, 0.5,
0, -3.946956, -5.988513, 0, 1.5, 0.5, 0.5,
2, -3.946956, -5.988513, 0, -0.5, 0.5, 0.5,
2, -3.946956, -5.988513, 1, -0.5, 0.5, 0.5,
2, -3.946956, -5.988513, 1, 1.5, 0.5, 0.5,
2, -3.946956, -5.988513, 0, 1.5, 0.5, 0.5
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
-3.517776, -3, -5.173955,
-3.517776, 2, -5.173955,
-3.517776, -3, -5.173955,
-3.701198, -3, -5.445475,
-3.517776, -2, -5.173955,
-3.701198, -2, -5.445475,
-3.517776, -1, -5.173955,
-3.701198, -1, -5.445475,
-3.517776, 0, -5.173955,
-3.701198, 0, -5.445475,
-3.517776, 1, -5.173955,
-3.701198, 1, -5.445475,
-3.517776, 2, -5.173955,
-3.701198, 2, -5.445475
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
-4.068044, -3, -5.988513, 0, -0.5, 0.5, 0.5,
-4.068044, -3, -5.988513, 1, -0.5, 0.5, 0.5,
-4.068044, -3, -5.988513, 1, 1.5, 0.5, 0.5,
-4.068044, -3, -5.988513, 0, 1.5, 0.5, 0.5,
-4.068044, -2, -5.988513, 0, -0.5, 0.5, 0.5,
-4.068044, -2, -5.988513, 1, -0.5, 0.5, 0.5,
-4.068044, -2, -5.988513, 1, 1.5, 0.5, 0.5,
-4.068044, -2, -5.988513, 0, 1.5, 0.5, 0.5,
-4.068044, -1, -5.988513, 0, -0.5, 0.5, 0.5,
-4.068044, -1, -5.988513, 1, -0.5, 0.5, 0.5,
-4.068044, -1, -5.988513, 1, 1.5, 0.5, 0.5,
-4.068044, -1, -5.988513, 0, 1.5, 0.5, 0.5,
-4.068044, 0, -5.988513, 0, -0.5, 0.5, 0.5,
-4.068044, 0, -5.988513, 1, -0.5, 0.5, 0.5,
-4.068044, 0, -5.988513, 1, 1.5, 0.5, 0.5,
-4.068044, 0, -5.988513, 0, 1.5, 0.5, 0.5,
-4.068044, 1, -5.988513, 0, -0.5, 0.5, 0.5,
-4.068044, 1, -5.988513, 1, -0.5, 0.5, 0.5,
-4.068044, 1, -5.988513, 1, 1.5, 0.5, 0.5,
-4.068044, 1, -5.988513, 0, 1.5, 0.5, 0.5,
-4.068044, 2, -5.988513, 0, -0.5, 0.5, 0.5,
-4.068044, 2, -5.988513, 1, -0.5, 0.5, 0.5,
-4.068044, 2, -5.988513, 1, 1.5, 0.5, 0.5,
-4.068044, 2, -5.988513, 0, 1.5, 0.5, 0.5
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
-3.517776, -3.475405, -4,
-3.517776, -3.475405, 4,
-3.517776, -3.475405, -4,
-3.701198, -3.632589, -4,
-3.517776, -3.475405, -2,
-3.701198, -3.632589, -2,
-3.517776, -3.475405, 0,
-3.701198, -3.632589, 0,
-3.517776, -3.475405, 2,
-3.701198, -3.632589, 2,
-3.517776, -3.475405, 4,
-3.701198, -3.632589, 4
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
-4.068044, -3.946956, -4, 0, -0.5, 0.5, 0.5,
-4.068044, -3.946956, -4, 1, -0.5, 0.5, 0.5,
-4.068044, -3.946956, -4, 1, 1.5, 0.5, 0.5,
-4.068044, -3.946956, -4, 0, 1.5, 0.5, 0.5,
-4.068044, -3.946956, -2, 0, -0.5, 0.5, 0.5,
-4.068044, -3.946956, -2, 1, -0.5, 0.5, 0.5,
-4.068044, -3.946956, -2, 1, 1.5, 0.5, 0.5,
-4.068044, -3.946956, -2, 0, 1.5, 0.5, 0.5,
-4.068044, -3.946956, 0, 0, -0.5, 0.5, 0.5,
-4.068044, -3.946956, 0, 1, -0.5, 0.5, 0.5,
-4.068044, -3.946956, 0, 1, 1.5, 0.5, 0.5,
-4.068044, -3.946956, 0, 0, 1.5, 0.5, 0.5,
-4.068044, -3.946956, 2, 0, -0.5, 0.5, 0.5,
-4.068044, -3.946956, 2, 1, -0.5, 0.5, 0.5,
-4.068044, -3.946956, 2, 1, 1.5, 0.5, 0.5,
-4.068044, -3.946956, 2, 0, 1.5, 0.5, 0.5,
-4.068044, -3.946956, 4, 0, -0.5, 0.5, 0.5,
-4.068044, -3.946956, 4, 1, -0.5, 0.5, 0.5,
-4.068044, -3.946956, 4, 1, 1.5, 0.5, 0.5,
-4.068044, -3.946956, 4, 0, 1.5, 0.5, 0.5
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
-3.517776, -3.475405, -5.173955,
-3.517776, 2.811945, -5.173955,
-3.517776, -3.475405, 5.686818,
-3.517776, 2.811945, 5.686818,
-3.517776, -3.475405, -5.173955,
-3.517776, -3.475405, 5.686818,
-3.517776, 2.811945, -5.173955,
-3.517776, 2.811945, 5.686818,
-3.517776, -3.475405, -5.173955,
3.819127, -3.475405, -5.173955,
-3.517776, -3.475405, 5.686818,
3.819127, -3.475405, 5.686818,
-3.517776, 2.811945, -5.173955,
3.819127, 2.811945, -5.173955,
-3.517776, 2.811945, 5.686818,
3.819127, 2.811945, 5.686818,
3.819127, -3.475405, -5.173955,
3.819127, 2.811945, -5.173955,
3.819127, -3.475405, 5.686818,
3.819127, 2.811945, 5.686818,
3.819127, -3.475405, -5.173955,
3.819127, -3.475405, 5.686818,
3.819127, 2.811945, -5.173955,
3.819127, 2.811945, 5.686818
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
var radius = 7.762346;
var distance = 34.53555;
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
mvMatrix.translate( -0.1506755, 0.3317299, -0.2564313 );
mvMatrix.scale( 1.143916, 1.334871, 0.7727627 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.53555);
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
HOCN<-read.table("HOCN.xyz")
```

```
## Error in read.table("HOCN.xyz"): no lines available in input
```

```r
x<-HOCN$V2
```

```
## Error in eval(expr, envir, enclos): object 'HOCN' not found
```

```r
y<-HOCN$V3
```

```
## Error in eval(expr, envir, enclos): object 'HOCN' not found
```

```r
z<-HOCN$V4
```

```
## Error in eval(expr, envir, enclos): object 'HOCN' not found
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
-3.410928, -0.8378745, -1.365549, 0, 0, 1, 1, 1,
-2.941262, 0.2952261, -1.07492, 1, 0, 0, 1, 1,
-2.815057, 1.005654, -0.8903525, 1, 0, 0, 1, 1,
-2.798022, -0.2707616, -1.462699, 1, 0, 0, 1, 1,
-2.409821, -0.3179546, -1.94932, 1, 0, 0, 1, 1,
-2.394283, -0.2782522, 0.1228194, 1, 0, 0, 1, 1,
-2.318556, -0.4819695, -1.188926, 0, 0, 0, 1, 1,
-2.304644, 1.359295, -0.8315561, 0, 0, 0, 1, 1,
-2.260219, -0.9900442, -1.697438, 0, 0, 0, 1, 1,
-2.2141, 0.3466809, -2.382909, 0, 0, 0, 1, 1,
-2.205118, -0.2999615, -1.185279, 0, 0, 0, 1, 1,
-2.123407, -0.3576185, -1.655391, 0, 0, 0, 1, 1,
-2.11958, 0.07973654, -1.328668, 0, 0, 0, 1, 1,
-2.075151, 0.2652933, -0.3410259, 1, 1, 1, 1, 1,
-2.060786, 2.338024, 0.3019404, 1, 1, 1, 1, 1,
-2.046208, -0.4044665, -2.471414, 1, 1, 1, 1, 1,
-2.02774, 1.147703, -0.5489461, 1, 1, 1, 1, 1,
-2.016102, -0.9864663, -1.843832, 1, 1, 1, 1, 1,
-2.009969, -0.2058557, -0.365799, 1, 1, 1, 1, 1,
-1.969857, -0.7401989, -0.8235279, 1, 1, 1, 1, 1,
-1.940548, 0.3835553, -1.827393, 1, 1, 1, 1, 1,
-1.903703, 0.9497723, -0.5801454, 1, 1, 1, 1, 1,
-1.90276, -0.1704908, -2.380162, 1, 1, 1, 1, 1,
-1.898235, 0.1180171, -2.178111, 1, 1, 1, 1, 1,
-1.892423, 0.7299399, -0.7976353, 1, 1, 1, 1, 1,
-1.889648, 1.406342, -1.833092, 1, 1, 1, 1, 1,
-1.879558, 1.223004, -0.3954522, 1, 1, 1, 1, 1,
-1.857586, 0.8254887, -1.219174, 1, 1, 1, 1, 1,
-1.825945, 0.5885646, 0.06369601, 0, 0, 1, 1, 1,
-1.817255, -0.803604, -1.873033, 1, 0, 0, 1, 1,
-1.809417, 0.7891778, -2.564089, 1, 0, 0, 1, 1,
-1.805134, -0.8661159, -1.306404, 1, 0, 0, 1, 1,
-1.803298, -0.01439529, -1.962436, 1, 0, 0, 1, 1,
-1.800779, 2.34587, -0.5592444, 1, 0, 0, 1, 1,
-1.800691, 0.2998752, -1.534022, 0, 0, 0, 1, 1,
-1.791323, -1.031333, -0.09999793, 0, 0, 0, 1, 1,
-1.779631, -0.8228698, -0.7864631, 0, 0, 0, 1, 1,
-1.710674, 0.5414587, -1.325936, 0, 0, 0, 1, 1,
-1.706348, -0.9350181, -1.990463, 0, 0, 0, 1, 1,
-1.68006, 2.053329, -1.197942, 0, 0, 0, 1, 1,
-1.65271, 1.530416, -2.286216, 0, 0, 0, 1, 1,
-1.64594, 0.7111862, -0.2567869, 1, 1, 1, 1, 1,
-1.645296, 1.20735, -2.48404, 1, 1, 1, 1, 1,
-1.638661, -0.2284454, -1.789031, 1, 1, 1, 1, 1,
-1.619193, 1.67318, -0.3268273, 1, 1, 1, 1, 1,
-1.612283, 0.3136704, -1.497376, 1, 1, 1, 1, 1,
-1.590196, -0.5467988, -2.305314, 1, 1, 1, 1, 1,
-1.577848, 0.4037327, -0.8634371, 1, 1, 1, 1, 1,
-1.576284, 1.03982, -2.726917, 1, 1, 1, 1, 1,
-1.575807, -0.4829108, -3.072976, 1, 1, 1, 1, 1,
-1.573505, -1.438475, -3.716751, 1, 1, 1, 1, 1,
-1.572461, -2.638237, -3.808628, 1, 1, 1, 1, 1,
-1.571497, 0.7283609, 0.5781744, 1, 1, 1, 1, 1,
-1.562652, -1.070567, -1.860871, 1, 1, 1, 1, 1,
-1.562365, -0.6268576, -2.607613, 1, 1, 1, 1, 1,
-1.559864, -1.178467, -3.350802, 1, 1, 1, 1, 1,
-1.556062, -2.114895, -2.402503, 0, 0, 1, 1, 1,
-1.550107, -0.8641943, -1.670198, 1, 0, 0, 1, 1,
-1.530779, -0.1877185, -1.59757, 1, 0, 0, 1, 1,
-1.51782, -0.3762209, 0.1906611, 1, 0, 0, 1, 1,
-1.517475, 1.505726, -1.688377, 1, 0, 0, 1, 1,
-1.508355, 0.3001154, -1.584958, 1, 0, 0, 1, 1,
-1.502156, 0.06753331, -1.118837, 0, 0, 0, 1, 1,
-1.497403, -0.6253297, -1.172425, 0, 0, 0, 1, 1,
-1.492104, -1.066986, -1.604305, 0, 0, 0, 1, 1,
-1.490733, 0.06006854, -1.337747, 0, 0, 0, 1, 1,
-1.484262, -0.9553665, -0.9291131, 0, 0, 0, 1, 1,
-1.483191, -1.224132, -0.9624534, 0, 0, 0, 1, 1,
-1.47586, -2.47406, -2.618809, 0, 0, 0, 1, 1,
-1.464922, 0.3529656, -1.817933, 1, 1, 1, 1, 1,
-1.45841, -0.3095958, -1.619046, 1, 1, 1, 1, 1,
-1.451362, -0.4180132, -1.147235, 1, 1, 1, 1, 1,
-1.450012, 0.2340488, -1.052922, 1, 1, 1, 1, 1,
-1.43809, -0.01828186, -2.81536, 1, 1, 1, 1, 1,
-1.435063, -0.4310398, -3.317627, 1, 1, 1, 1, 1,
-1.430913, 0.2203993, -3.040499, 1, 1, 1, 1, 1,
-1.425159, -0.5051792, -1.035299, 1, 1, 1, 1, 1,
-1.421393, -0.03590539, -2.404128, 1, 1, 1, 1, 1,
-1.420859, -0.4142309, -3.088115, 1, 1, 1, 1, 1,
-1.405029, -0.6829641, -2.366438, 1, 1, 1, 1, 1,
-1.403787, 1.622397, -0.2036872, 1, 1, 1, 1, 1,
-1.395575, -0.3675688, -3.365431, 1, 1, 1, 1, 1,
-1.390218, -1.716191, -1.267681, 1, 1, 1, 1, 1,
-1.388085, -0.2934828, -2.348211, 1, 1, 1, 1, 1,
-1.384831, -0.6784011, -2.154495, 0, 0, 1, 1, 1,
-1.383983, -1.504294, -2.650768, 1, 0, 0, 1, 1,
-1.371669, 0.5157158, 0.2089869, 1, 0, 0, 1, 1,
-1.354901, -0.5814952, -2.209378, 1, 0, 0, 1, 1,
-1.350768, -0.5180199, -1.694889, 1, 0, 0, 1, 1,
-1.348168, 0.515997, -0.391346, 1, 0, 0, 1, 1,
-1.340115, 0.8254858, -2.362241, 0, 0, 0, 1, 1,
-1.337399, -0.5570616, -2.268523, 0, 0, 0, 1, 1,
-1.333968, 0.5090236, -4.382452, 0, 0, 0, 1, 1,
-1.332098, -0.2243858, -1.662184, 0, 0, 0, 1, 1,
-1.331509, 1.536309, 1.663753, 0, 0, 0, 1, 1,
-1.32827, 0.3146784, -2.068163, 0, 0, 0, 1, 1,
-1.322113, -0.4468203, -4.190041, 0, 0, 0, 1, 1,
-1.321037, -0.5738705, -2.037237, 1, 1, 1, 1, 1,
-1.30961, 0.4610207, -1.78863, 1, 1, 1, 1, 1,
-1.291331, 0.08496224, -0.8266353, 1, 1, 1, 1, 1,
-1.285328, -0.2940785, -0.9914024, 1, 1, 1, 1, 1,
-1.280282, 0.1997171, -2.137999, 1, 1, 1, 1, 1,
-1.274115, 0.6728073, -2.348623, 1, 1, 1, 1, 1,
-1.265946, -0.5777947, -1.551957, 1, 1, 1, 1, 1,
-1.261812, -0.1872233, -1.441761, 1, 1, 1, 1, 1,
-1.260163, -0.005148555, -2.827873, 1, 1, 1, 1, 1,
-1.258888, -0.6676405, -0.900004, 1, 1, 1, 1, 1,
-1.258082, 0.6913588, -1.232201, 1, 1, 1, 1, 1,
-1.250026, 1.485289, -1.463524, 1, 1, 1, 1, 1,
-1.241546, -0.3240895, -0.9939463, 1, 1, 1, 1, 1,
-1.239934, -1.048932, -1.021078, 1, 1, 1, 1, 1,
-1.218368, 0.4563741, -1.646494, 1, 1, 1, 1, 1,
-1.217035, 1.310414, 0.3477755, 0, 0, 1, 1, 1,
-1.20635, 0.2276993, -2.126735, 1, 0, 0, 1, 1,
-1.201527, -0.8843631, -2.339604, 1, 0, 0, 1, 1,
-1.198713, -0.1869497, -1.290363, 1, 0, 0, 1, 1,
-1.196791, -0.7703701, -2.549644, 1, 0, 0, 1, 1,
-1.182649, -1.237263, -2.344593, 1, 0, 0, 1, 1,
-1.177024, 0.8495262, -0.8260912, 0, 0, 0, 1, 1,
-1.171461, 1.084719, -1.691527, 0, 0, 0, 1, 1,
-1.161612, 0.7481506, -1.370319, 0, 0, 0, 1, 1,
-1.156799, 1.092434, -0.6990919, 0, 0, 0, 1, 1,
-1.150859, -1.714566, -2.408476, 0, 0, 0, 1, 1,
-1.143461, -1.020444, -1.810305, 0, 0, 0, 1, 1,
-1.136427, -0.4609599, -2.219769, 0, 0, 0, 1, 1,
-1.119351, -0.5202621, -0.7595593, 1, 1, 1, 1, 1,
-1.114895, 0.9051273, 0.8207765, 1, 1, 1, 1, 1,
-1.109384, 0.7789825, -1.401683, 1, 1, 1, 1, 1,
-1.099888, 0.366618, 0.1783635, 1, 1, 1, 1, 1,
-1.080341, -0.9689522, -1.697589, 1, 1, 1, 1, 1,
-1.078086, -1.13863, -2.771786, 1, 1, 1, 1, 1,
-1.074435, 1.938695, -0.4304895, 1, 1, 1, 1, 1,
-1.073292, 1.243109, -0.6379001, 1, 1, 1, 1, 1,
-1.068928, -0.9289319, -1.067472, 1, 1, 1, 1, 1,
-1.06725, -0.08630706, -2.476635, 1, 1, 1, 1, 1,
-1.062898, -0.02920301, -2.323339, 1, 1, 1, 1, 1,
-1.026049, -0.5994003, -2.882113, 1, 1, 1, 1, 1,
-1.025805, 0.8441132, 0.627462, 1, 1, 1, 1, 1,
-1.02289, -0.14842, -3.185758, 1, 1, 1, 1, 1,
-1.018817, -1.086154, -1.931862, 1, 1, 1, 1, 1,
-1.012343, -0.1217681, -1.222501, 0, 0, 1, 1, 1,
-1.008083, 1.120606, 0.7449227, 1, 0, 0, 1, 1,
-1.001313, 0.1615147, -0.3828457, 1, 0, 0, 1, 1,
-0.9993215, -1.545953, -2.637853, 1, 0, 0, 1, 1,
-0.9964855, 0.4163887, 0.6274335, 1, 0, 0, 1, 1,
-0.9922339, 1.971149, -0.8664, 1, 0, 0, 1, 1,
-0.9912325, -1.230983, -3.761273, 0, 0, 0, 1, 1,
-0.988238, -1.355046, -3.114699, 0, 0, 0, 1, 1,
-0.9810817, 0.3880332, -2.299519, 0, 0, 0, 1, 1,
-0.9744602, -0.455853, -2.235598, 0, 0, 0, 1, 1,
-0.9695152, 0.7100388, -0.9263561, 0, 0, 0, 1, 1,
-0.9682059, 1.709254, -0.5625719, 0, 0, 0, 1, 1,
-0.9645765, 0.4299553, -1.28721, 0, 0, 0, 1, 1,
-0.9585582, -0.5339834, -2.248092, 1, 1, 1, 1, 1,
-0.955574, -1.448169, -2.007364, 1, 1, 1, 1, 1,
-0.9553024, 0.5463824, -1.907573, 1, 1, 1, 1, 1,
-0.9515815, 0.9693136, -1.274791, 1, 1, 1, 1, 1,
-0.9514558, -1.60984, -2.99793, 1, 1, 1, 1, 1,
-0.948299, -1.490719, -4.458646, 1, 1, 1, 1, 1,
-0.9459231, -1.174617, -2.508416, 1, 1, 1, 1, 1,
-0.933903, -1.100624, -1.910271, 1, 1, 1, 1, 1,
-0.9262754, -1.387028, -3.231524, 1, 1, 1, 1, 1,
-0.9192986, -0.5647488, -2.062255, 1, 1, 1, 1, 1,
-0.9188752, 0.6163777, 1.284914, 1, 1, 1, 1, 1,
-0.9164405, -0.2520664, -1.289159, 1, 1, 1, 1, 1,
-0.9159534, -0.3960614, -1.1338, 1, 1, 1, 1, 1,
-0.9016741, 0.2784434, -2.544225, 1, 1, 1, 1, 1,
-0.901338, -0.9628381, -3.386503, 1, 1, 1, 1, 1,
-0.8987457, 0.4130965, -2.015074, 0, 0, 1, 1, 1,
-0.8970486, 0.08817164, -1.293788, 1, 0, 0, 1, 1,
-0.8795926, -1.302793, -2.491198, 1, 0, 0, 1, 1,
-0.879476, 0.6905159, -2.420731, 1, 0, 0, 1, 1,
-0.8787002, 0.9700254, -0.3938493, 1, 0, 0, 1, 1,
-0.8754986, 0.6322254, -1.314731, 1, 0, 0, 1, 1,
-0.8743622, 0.8361326, -0.6668554, 0, 0, 0, 1, 1,
-0.871381, 0.5224172, -0.5997133, 0, 0, 0, 1, 1,
-0.8658651, -2.153923, -3.273561, 0, 0, 0, 1, 1,
-0.8588766, 0.9174078, -1.417237, 0, 0, 0, 1, 1,
-0.8547739, 0.7450555, -0.4113045, 0, 0, 0, 1, 1,
-0.8546771, -0.1361994, -1.728008, 0, 0, 0, 1, 1,
-0.8544798, 2.720382, -1.311683, 0, 0, 0, 1, 1,
-0.8543026, 0.293245, -1.222011, 1, 1, 1, 1, 1,
-0.8537892, 2.404343, -0.6541411, 1, 1, 1, 1, 1,
-0.8445542, 0.2698653, -0.8895798, 1, 1, 1, 1, 1,
-0.8440378, -0.9413913, -1.976581, 1, 1, 1, 1, 1,
-0.8425952, -0.4413892, -2.348022, 1, 1, 1, 1, 1,
-0.8410501, 0.5029232, -2.017217, 1, 1, 1, 1, 1,
-0.8397683, 0.4516166, -0.9533338, 1, 1, 1, 1, 1,
-0.838634, -0.02367089, -4.234541, 1, 1, 1, 1, 1,
-0.8368442, -0.08109743, -1.117866, 1, 1, 1, 1, 1,
-0.8284486, 0.6765116, -0.7170901, 1, 1, 1, 1, 1,
-0.8262702, -0.5392057, -1.102503, 1, 1, 1, 1, 1,
-0.8227124, -0.6150111, -2.059566, 1, 1, 1, 1, 1,
-0.8191435, 0.21423, 0.4540044, 1, 1, 1, 1, 1,
-0.8149127, 0.4585692, 0.5522634, 1, 1, 1, 1, 1,
-0.7994174, 1.569222, -1.268681, 1, 1, 1, 1, 1,
-0.7978626, -0.8184827, -0.7050667, 0, 0, 1, 1, 1,
-0.796838, -0.434067, -1.113806, 1, 0, 0, 1, 1,
-0.7964444, -2.097478, -3.393775, 1, 0, 0, 1, 1,
-0.7924675, -0.221101, -1.925673, 1, 0, 0, 1, 1,
-0.7867405, -1.922035, -4.111786, 1, 0, 0, 1, 1,
-0.7814043, -2.195371, -2.996614, 1, 0, 0, 1, 1,
-0.7805817, 1.616924, -0.5346008, 0, 0, 0, 1, 1,
-0.7804533, 0.4976001, -0.7192529, 0, 0, 0, 1, 1,
-0.7795691, -0.6498501, -2.161103, 0, 0, 0, 1, 1,
-0.7702157, 0.7995427, -0.1808162, 0, 0, 0, 1, 1,
-0.769667, -1.029482, -1.653328, 0, 0, 0, 1, 1,
-0.7683536, 2.037535, -0.314919, 0, 0, 0, 1, 1,
-0.7677982, 0.700698, -1.299937, 0, 0, 0, 1, 1,
-0.7661366, 1.082428, -0.893781, 1, 1, 1, 1, 1,
-0.7587929, -1.221811, -3.046517, 1, 1, 1, 1, 1,
-0.7562767, 0.02176473, -0.3525753, 1, 1, 1, 1, 1,
-0.7538655, -0.5255836, -3.047914, 1, 1, 1, 1, 1,
-0.7528768, -0.2280791, -2.96998, 1, 1, 1, 1, 1,
-0.7475116, -0.02813349, -1.278486, 1, 1, 1, 1, 1,
-0.7442154, -0.7257019, 2.029553, 1, 1, 1, 1, 1,
-0.7441421, 0.9835005, -0.3690991, 1, 1, 1, 1, 1,
-0.7427992, -0.3455597, -2.90286, 1, 1, 1, 1, 1,
-0.7412545, -0.5985361, -2.479075, 1, 1, 1, 1, 1,
-0.7233974, 0.4449537, -1.472015, 1, 1, 1, 1, 1,
-0.7229097, 0.1816892, -0.8052788, 1, 1, 1, 1, 1,
-0.7216802, -0.9130445, -2.030701, 1, 1, 1, 1, 1,
-0.7211501, 0.9404104, -1.438238, 1, 1, 1, 1, 1,
-0.7119003, 0.6589877, -0.729404, 1, 1, 1, 1, 1,
-0.7116676, 1.298708, 0.2341126, 0, 0, 1, 1, 1,
-0.7073315, 0.979513, 0.8248059, 1, 0, 0, 1, 1,
-0.7052934, -0.8706036, -1.546523, 1, 0, 0, 1, 1,
-0.7040408, -1.653175, -1.887205, 1, 0, 0, 1, 1,
-0.70364, -0.3431936, -2.788448, 1, 0, 0, 1, 1,
-0.6942512, -0.4693222, -3.801209, 1, 0, 0, 1, 1,
-0.6936811, -0.9661655, -1.353979, 0, 0, 0, 1, 1,
-0.6910709, -1.319364, -2.733663, 0, 0, 0, 1, 1,
-0.68636, 0.6713588, -1.786027, 0, 0, 0, 1, 1,
-0.6854972, 0.7629191, -0.8127453, 0, 0, 0, 1, 1,
-0.68323, -1.56254, -1.229309, 0, 0, 0, 1, 1,
-0.6826081, -0.4104522, -1.3671, 0, 0, 0, 1, 1,
-0.6808753, 1.424052, 0.5925864, 0, 0, 0, 1, 1,
-0.6787131, -0.09945577, -3.772626, 1, 1, 1, 1, 1,
-0.6783437, -0.2005025, -4.921452, 1, 1, 1, 1, 1,
-0.6751983, -0.2011883, -2.570267, 1, 1, 1, 1, 1,
-0.6733791, 0.8030061, -0.4884642, 1, 1, 1, 1, 1,
-0.672773, -0.1113188, 0.1794115, 1, 1, 1, 1, 1,
-0.6714643, 0.9935594, -1.820984, 1, 1, 1, 1, 1,
-0.6664485, 0.6557906, -0.5583022, 1, 1, 1, 1, 1,
-0.659649, 1.122155, -2.60765, 1, 1, 1, 1, 1,
-0.6588709, 0.5285996, 0.6410003, 1, 1, 1, 1, 1,
-0.649202, 0.853724, 0.1523014, 1, 1, 1, 1, 1,
-0.6472051, 2.224889, -1.295034, 1, 1, 1, 1, 1,
-0.6465029, 0.3097692, -1.031794, 1, 1, 1, 1, 1,
-0.6366462, 0.05056285, -2.750358, 1, 1, 1, 1, 1,
-0.6355062, 0.5907176, -0.8221459, 1, 1, 1, 1, 1,
-0.6343971, 0.7393196, -0.2381517, 1, 1, 1, 1, 1,
-0.6286235, 1.027385, -0.2893352, 0, 0, 1, 1, 1,
-0.6284194, 0.04591769, -1.696929, 1, 0, 0, 1, 1,
-0.62627, -0.5437546, -1.811777, 1, 0, 0, 1, 1,
-0.6247746, -0.9304304, -4.006114, 1, 0, 0, 1, 1,
-0.6230325, -1.61737, -2.447485, 1, 0, 0, 1, 1,
-0.619965, -0.8493022, -4.580588, 1, 0, 0, 1, 1,
-0.6168321, -0.07817379, -2.2845, 0, 0, 0, 1, 1,
-0.6063924, -0.5448542, -2.607777, 0, 0, 0, 1, 1,
-0.5950015, -1.077304, -2.061503, 0, 0, 0, 1, 1,
-0.5914555, 0.8282321, 0.7929799, 0, 0, 0, 1, 1,
-0.5913627, 0.1175383, -2.140612, 0, 0, 0, 1, 1,
-0.5896266, -1.112527, -2.842822, 0, 0, 0, 1, 1,
-0.5888571, -0.5202198, -3.906587, 0, 0, 0, 1, 1,
-0.5880533, 1.721042, -0.7305967, 1, 1, 1, 1, 1,
-0.5762627, -0.795377, -0.5545128, 1, 1, 1, 1, 1,
-0.5759299, -0.5552777, -2.75903, 1, 1, 1, 1, 1,
-0.5753608, 0.5865762, -1.149881, 1, 1, 1, 1, 1,
-0.5729697, -1.035122, -1.945382, 1, 1, 1, 1, 1,
-0.5728691, 1.574224, 0.5173718, 1, 1, 1, 1, 1,
-0.5686359, 0.3643304, 0.416545, 1, 1, 1, 1, 1,
-0.5676132, 0.5004528, 0.3174252, 1, 1, 1, 1, 1,
-0.5669262, 0.9681652, -0.9041405, 1, 1, 1, 1, 1,
-0.5618202, 2.244115, -0.3565036, 1, 1, 1, 1, 1,
-0.5612403, 0.09770025, -1.326786, 1, 1, 1, 1, 1,
-0.5603149, 0.5064946, -1.341647, 1, 1, 1, 1, 1,
-0.5579759, 1.562456, -2.838518, 1, 1, 1, 1, 1,
-0.5569389, -0.1774044, -1.531251, 1, 1, 1, 1, 1,
-0.5480213, 0.3166904, -0.7533486, 1, 1, 1, 1, 1,
-0.5452364, 0.5783937, -1.82099, 0, 0, 1, 1, 1,
-0.5398876, 0.6283776, -1.240296, 1, 0, 0, 1, 1,
-0.5390183, 2.096828, 0.9704626, 1, 0, 0, 1, 1,
-0.5347142, -0.316606, -1.357263, 1, 0, 0, 1, 1,
-0.5281526, 0.4036708, -0.1746841, 1, 0, 0, 1, 1,
-0.5264338, 1.615432, -0.8949907, 1, 0, 0, 1, 1,
-0.5224859, 0.6025538, -0.7700959, 0, 0, 0, 1, 1,
-0.5182258, -0.1901623, -1.060199, 0, 0, 0, 1, 1,
-0.516691, -0.7690718, -2.017946, 0, 0, 0, 1, 1,
-0.5125614, -0.4220006, -1.797851, 0, 0, 0, 1, 1,
-0.5123655, 0.05017273, -2.016851, 0, 0, 0, 1, 1,
-0.5122547, 0.0825188, -2.389319, 0, 0, 0, 1, 1,
-0.5067385, 1.109561, -0.3729202, 0, 0, 0, 1, 1,
-0.505318, -1.496728, -3.357457, 1, 1, 1, 1, 1,
-0.5042135, -1.080723, -2.777366, 1, 1, 1, 1, 1,
-0.5027801, 0.7011089, -1.145235, 1, 1, 1, 1, 1,
-0.500119, 2.555153, 0.4944268, 1, 1, 1, 1, 1,
-0.4998143, -0.8282219, -2.962708, 1, 1, 1, 1, 1,
-0.4983979, 1.300751, -1.043892, 1, 1, 1, 1, 1,
-0.4981655, 1.446822, 1.084225, 1, 1, 1, 1, 1,
-0.4799474, -0.1528505, -2.815753, 1, 1, 1, 1, 1,
-0.4786226, 0.05133122, 0.5772815, 1, 1, 1, 1, 1,
-0.473623, 1.063327, -0.09858494, 1, 1, 1, 1, 1,
-0.4734629, 0.2495751, 1.133142, 1, 1, 1, 1, 1,
-0.4730173, -1.294004, -1.919795, 1, 1, 1, 1, 1,
-0.4729967, 0.4273524, -2.257794, 1, 1, 1, 1, 1,
-0.4721913, 0.6663997, -2.53408, 1, 1, 1, 1, 1,
-0.4707758, 0.4418528, 0.148724, 1, 1, 1, 1, 1,
-0.4677865, -0.4550029, -3.964158, 0, 0, 1, 1, 1,
-0.4669691, 0.4329472, -0.7463127, 1, 0, 0, 1, 1,
-0.4631008, -1.758084, -0.5470563, 1, 0, 0, 1, 1,
-0.4586696, 1.991514, 1.633687, 1, 0, 0, 1, 1,
-0.455722, 1.530652, 0.0598314, 1, 0, 0, 1, 1,
-0.4525619, 1.413871, 1.259172, 1, 0, 0, 1, 1,
-0.4516433, 0.4812975, -0.8970004, 0, 0, 0, 1, 1,
-0.4507216, -3.383842, -3.133109, 0, 0, 0, 1, 1,
-0.4497651, 0.8898134, -1.002525, 0, 0, 0, 1, 1,
-0.4472611, -0.7679574, -0.6777514, 0, 0, 0, 1, 1,
-0.4398994, -1.632635, -3.588634, 0, 0, 0, 1, 1,
-0.4372851, -0.6617696, -2.20571, 0, 0, 0, 1, 1,
-0.4343888, 1.874105, -1.93141, 0, 0, 0, 1, 1,
-0.4311319, 0.8242903, -1.569559, 1, 1, 1, 1, 1,
-0.4308397, 1.023956, -0.5917848, 1, 1, 1, 1, 1,
-0.4276537, 0.5463942, -1.515419, 1, 1, 1, 1, 1,
-0.4255245, 1.246551, -1.339513, 1, 1, 1, 1, 1,
-0.4240145, -0.8559709, -3.424835, 1, 1, 1, 1, 1,
-0.4165116, 0.5649416, -1.545871, 1, 1, 1, 1, 1,
-0.4120613, -0.7837265, -3.335887, 1, 1, 1, 1, 1,
-0.4111671, 1.528253, 1.228824, 1, 1, 1, 1, 1,
-0.4096005, 0.9216447, -0.8388684, 1, 1, 1, 1, 1,
-0.4081166, -1.841457, -2.749605, 1, 1, 1, 1, 1,
-0.4052362, 0.5914022, -1.875877, 1, 1, 1, 1, 1,
-0.4041374, -1.276807, -3.792672, 1, 1, 1, 1, 1,
-0.4003644, 0.4822887, -0.5109422, 1, 1, 1, 1, 1,
-0.399933, 0.04800189, -1.494956, 1, 1, 1, 1, 1,
-0.3967821, -0.6491919, -1.521264, 1, 1, 1, 1, 1,
-0.395834, -1.73561, -3.360101, 0, 0, 1, 1, 1,
-0.3958004, -0.08501977, -2.609406, 1, 0, 0, 1, 1,
-0.3938049, -2.088577, -3.08541, 1, 0, 0, 1, 1,
-0.3920462, 2.181281, 0.9468794, 1, 0, 0, 1, 1,
-0.3919167, -1.883354, -3.564412, 1, 0, 0, 1, 1,
-0.384913, 1.207055, -1.1011, 1, 0, 0, 1, 1,
-0.3846177, 0.5466281, -2.342217, 0, 0, 0, 1, 1,
-0.3846118, -0.1196992, -3.10846, 0, 0, 0, 1, 1,
-0.3790005, -0.9122153, -2.232659, 0, 0, 0, 1, 1,
-0.3789878, 0.4095633, -1.152625, 0, 0, 0, 1, 1,
-0.3737642, -0.5997164, -2.782039, 0, 0, 0, 1, 1,
-0.3727937, -1.093695, -2.940084, 0, 0, 0, 1, 1,
-0.3727751, 0.807587, 0.7011037, 0, 0, 0, 1, 1,
-0.3722519, 0.2945859, -0.1477557, 1, 1, 1, 1, 1,
-0.3693863, -0.2571596, -1.929176, 1, 1, 1, 1, 1,
-0.3669981, 1.185425, -2.162832, 1, 1, 1, 1, 1,
-0.3652018, 2.18766, -0.3880216, 1, 1, 1, 1, 1,
-0.3609887, -0.4101209, -1.192266, 1, 1, 1, 1, 1,
-0.359017, 0.4553418, -0.522433, 1, 1, 1, 1, 1,
-0.3556752, -1.276155, -3.107038, 1, 1, 1, 1, 1,
-0.3481075, 0.9252127, -0.05206646, 1, 1, 1, 1, 1,
-0.3476391, 1.051481, -0.09682009, 1, 1, 1, 1, 1,
-0.3454192, -0.8755878, 0.146473, 1, 1, 1, 1, 1,
-0.3448665, 1.460599, 1.121643, 1, 1, 1, 1, 1,
-0.3421597, 0.1805222, -2.348019, 1, 1, 1, 1, 1,
-0.3420062, -1.81521, -3.026707, 1, 1, 1, 1, 1,
-0.3403238, 0.8670667, 0.3899987, 1, 1, 1, 1, 1,
-0.338535, 0.1884024, -0.9959227, 1, 1, 1, 1, 1,
-0.3376619, -0.2112152, -1.806664, 0, 0, 1, 1, 1,
-0.3285303, 0.1763973, -0.6585579, 1, 0, 0, 1, 1,
-0.3280278, -0.3646004, -1.313108, 1, 0, 0, 1, 1,
-0.319185, -0.6719197, -3.333306, 1, 0, 0, 1, 1,
-0.3187232, -2.169693, -3.339283, 1, 0, 0, 1, 1,
-0.3160697, -0.7918809, -2.226058, 1, 0, 0, 1, 1,
-0.3151974, -1.783335, -3.427117, 0, 0, 0, 1, 1,
-0.3135514, -0.6336166, -1.503742, 0, 0, 0, 1, 1,
-0.3112849, -1.613853, -3.052685, 0, 0, 0, 1, 1,
-0.3098685, 0.2914479, -0.4541595, 0, 0, 0, 1, 1,
-0.3073534, 0.7215734, -0.9087784, 0, 0, 0, 1, 1,
-0.3042623, 1.68183, 0.8177193, 0, 0, 0, 1, 1,
-0.3022244, -0.0521098, -1.443602, 0, 0, 0, 1, 1,
-0.3020089, -1.519835, -4.488705, 1, 1, 1, 1, 1,
-0.301351, 0.3563963, -1.038543, 1, 1, 1, 1, 1,
-0.3002533, 0.2645013, -1.728273, 1, 1, 1, 1, 1,
-0.2975478, -0.2550783, -1.937644, 1, 1, 1, 1, 1,
-0.2940503, 0.9775069, 1.517573, 1, 1, 1, 1, 1,
-0.2929516, 0.02103622, -1.210153, 1, 1, 1, 1, 1,
-0.2883076, -0.396815, -1.339741, 1, 1, 1, 1, 1,
-0.2875304, -0.2022756, -2.720477, 1, 1, 1, 1, 1,
-0.2830078, 0.5268441, 0.1453521, 1, 1, 1, 1, 1,
-0.2799856, -1.512383, -1.109611, 1, 1, 1, 1, 1,
-0.2772506, 0.3700799, -0.61725, 1, 1, 1, 1, 1,
-0.2759789, 0.06935439, -0.8660713, 1, 1, 1, 1, 1,
-0.2748432, -0.592753, -2.669478, 1, 1, 1, 1, 1,
-0.273764, -1.415164, -1.801135, 1, 1, 1, 1, 1,
-0.271331, 0.04343751, -2.696511, 1, 1, 1, 1, 1,
-0.2638077, 0.1945376, -0.1312193, 0, 0, 1, 1, 1,
-0.2625734, -0.5331702, -3.428879, 1, 0, 0, 1, 1,
-0.2575128, -0.8958635, -3.794154, 1, 0, 0, 1, 1,
-0.2570757, 1.708742, 0.9822363, 1, 0, 0, 1, 1,
-0.2552235, 0.558299, -0.3482801, 1, 0, 0, 1, 1,
-0.2529549, -2.039352, -4.308439, 1, 0, 0, 1, 1,
-0.2486938, -0.7014367, -4.943022, 0, 0, 0, 1, 1,
-0.2445767, -1.457284, -4.890127, 0, 0, 0, 1, 1,
-0.2385072, 1.252996, -0.5976109, 0, 0, 0, 1, 1,
-0.2380449, -0.00684674, -0.1854316, 0, 0, 0, 1, 1,
-0.2368145, -1.14223, -3.654177, 0, 0, 0, 1, 1,
-0.2315268, 1.203675, -1.031015, 0, 0, 0, 1, 1,
-0.2293979, 1.447751, -0.2634766, 0, 0, 0, 1, 1,
-0.2285179, -1.152284, -2.988651, 1, 1, 1, 1, 1,
-0.2277385, -1.352355, -3.679029, 1, 1, 1, 1, 1,
-0.2218501, 0.594559, -1.701757, 1, 1, 1, 1, 1,
-0.2211737, 1.751322, -0.138011, 1, 1, 1, 1, 1,
-0.2207374, -0.5868288, -0.8273763, 1, 1, 1, 1, 1,
-0.2154428, 0.6321403, -0.3009728, 1, 1, 1, 1, 1,
-0.2130976, 0.4369465, 1.737532, 1, 1, 1, 1, 1,
-0.2130093, 0.937082, -1.485974, 1, 1, 1, 1, 1,
-0.208593, 1.031449, -0.5079748, 1, 1, 1, 1, 1,
-0.2075085, -0.2641516, -0.6350317, 1, 1, 1, 1, 1,
-0.2054505, 0.9605141, 1.436075, 1, 1, 1, 1, 1,
-0.1987144, -0.382909, -3.012679, 1, 1, 1, 1, 1,
-0.1927671, -0.7886374, -4.078433, 1, 1, 1, 1, 1,
-0.1895545, -0.3370057, -3.684837, 1, 1, 1, 1, 1,
-0.1887468, 0.4374381, -0.02618118, 1, 1, 1, 1, 1,
-0.1849233, -0.6061296, -5.015789, 0, 0, 1, 1, 1,
-0.1845858, -0.77364, -1.66055, 1, 0, 0, 1, 1,
-0.1819624, 0.2702088, -1.595434, 1, 0, 0, 1, 1,
-0.180747, -2.002377, -3.756057, 1, 0, 0, 1, 1,
-0.1799684, 0.9819251, 0.8914117, 1, 0, 0, 1, 1,
-0.1739896, -1.253527, -3.295055, 1, 0, 0, 1, 1,
-0.1668613, -0.2980152, -2.712707, 0, 0, 0, 1, 1,
-0.1644619, 1.143768, 0.2782488, 0, 0, 0, 1, 1,
-0.1635988, -1.093328, -3.529885, 0, 0, 0, 1, 1,
-0.1559411, -0.9741135, -3.804382, 0, 0, 0, 1, 1,
-0.1557638, 0.03846338, -0.8263608, 0, 0, 0, 1, 1,
-0.1556914, 0.09420197, -0.8949211, 0, 0, 0, 1, 1,
-0.1550884, -1.404092, -3.076527, 0, 0, 0, 1, 1,
-0.1521308, 2.178651, 1.06489, 1, 1, 1, 1, 1,
-0.1510769, 0.7665183, -1.252141, 1, 1, 1, 1, 1,
-0.150906, 1.738883, 0.6364394, 1, 1, 1, 1, 1,
-0.150858, 1.458845, -0.8582743, 1, 1, 1, 1, 1,
-0.1454807, -1.605275, -3.308506, 1, 1, 1, 1, 1,
-0.1448156, 0.01792843, -2.88741, 1, 1, 1, 1, 1,
-0.142707, 0.8795061, 1.019929, 1, 1, 1, 1, 1,
-0.1417519, -0.9180005, -2.804058, 1, 1, 1, 1, 1,
-0.1404038, 0.3952651, -0.5799049, 1, 1, 1, 1, 1,
-0.1399361, 0.2166725, 0.6541305, 1, 1, 1, 1, 1,
-0.1379012, -0.9829664, -2.11627, 1, 1, 1, 1, 1,
-0.1374466, 1.090485, 1.154648, 1, 1, 1, 1, 1,
-0.1356798, -0.05771308, -1.514607, 1, 1, 1, 1, 1,
-0.1350024, 0.793171, 1.354044, 1, 1, 1, 1, 1,
-0.133048, 0.5885308, 1.835946, 1, 1, 1, 1, 1,
-0.1317933, 2.272595, 0.5244473, 0, 0, 1, 1, 1,
-0.1299996, 0.7874035, 0.2082471, 1, 0, 0, 1, 1,
-0.1259448, 0.994418, -0.2612861, 1, 0, 0, 1, 1,
-0.1240111, 2.573611, -1.257378, 1, 0, 0, 1, 1,
-0.1193033, 1.242405, -1.261253, 1, 0, 0, 1, 1,
-0.1184349, 0.8403171, 0.4977655, 1, 0, 0, 1, 1,
-0.1166473, -1.782518, -2.490267, 0, 0, 0, 1, 1,
-0.1160174, 0.02945154, -1.317186, 0, 0, 0, 1, 1,
-0.1159056, 0.3413768, -0.06297066, 0, 0, 0, 1, 1,
-0.1133692, 0.5832824, 0.696094, 0, 0, 0, 1, 1,
-0.1095267, 2.165484, -0.9872003, 0, 0, 0, 1, 1,
-0.1094066, -1.341368, -3.735578, 0, 0, 0, 1, 1,
-0.1065716, 0.2584985, -0.7175463, 0, 0, 0, 1, 1,
-0.1034613, -0.00997424, -1.710853, 1, 1, 1, 1, 1,
-0.1002596, 0.05550943, -2.862994, 1, 1, 1, 1, 1,
-0.0973722, 0.5190114, -0.9502423, 1, 1, 1, 1, 1,
-0.09549167, -0.2078522, -3.055029, 1, 1, 1, 1, 1,
-0.09353574, 0.4196694, 0.7187884, 1, 1, 1, 1, 1,
-0.09343977, -1.213571, -1.54166, 1, 1, 1, 1, 1,
-0.09174194, 1.810102, -1.232244, 1, 1, 1, 1, 1,
-0.091255, -0.2279633, -1.803517, 1, 1, 1, 1, 1,
-0.08667456, 0.6155038, -0.4315123, 1, 1, 1, 1, 1,
-0.08100679, 0.5762908, -1.095954, 1, 1, 1, 1, 1,
-0.07832292, 1.333926, -0.395644, 1, 1, 1, 1, 1,
-0.07768787, -0.8421221, -1.608633, 1, 1, 1, 1, 1,
-0.07623516, 0.5447922, 0.06758905, 1, 1, 1, 1, 1,
-0.07412332, 0.1117207, -0.5882846, 1, 1, 1, 1, 1,
-0.07282092, -0.9847264, -3.70059, 1, 1, 1, 1, 1,
-0.07059795, 0.3079991, 0.5428884, 0, 0, 1, 1, 1,
-0.06597663, -0.6077486, -4.84202, 1, 0, 0, 1, 1,
-0.06392317, -0.5923078, -3.436609, 1, 0, 0, 1, 1,
-0.06219226, 0.1046651, -0.6671738, 1, 0, 0, 1, 1,
-0.06211274, 0.3427915, -1.145308, 1, 0, 0, 1, 1,
-0.05804221, -1.161777, -3.633547, 1, 0, 0, 1, 1,
-0.05641332, 1.360487, 0.5228667, 0, 0, 0, 1, 1,
-0.05363128, 1.115279, -0.06489262, 0, 0, 0, 1, 1,
-0.05072786, -1.111929, -2.119395, 0, 0, 0, 1, 1,
-0.04768459, -0.1471121, -4.632152, 0, 0, 0, 1, 1,
-0.04696634, 1.049527, 0.08531881, 0, 0, 0, 1, 1,
-0.04451133, 0.7468285, 0.5432709, 0, 0, 0, 1, 1,
-0.04227706, 0.9458553, -1.116658, 0, 0, 0, 1, 1,
-0.03365623, 0.929702, 1.320775, 1, 1, 1, 1, 1,
-0.03007575, 0.2023412, -0.5447795, 1, 1, 1, 1, 1,
-0.02758688, -0.468119, -4.741305, 1, 1, 1, 1, 1,
-0.02243744, 0.6633201, -1.226964, 1, 1, 1, 1, 1,
-0.02207379, -0.9985925, -4.249289, 1, 1, 1, 1, 1,
-0.01974791, -1.980731, -3.6283, 1, 1, 1, 1, 1,
-0.01827489, -0.7565859, -2.862742, 1, 1, 1, 1, 1,
-0.01708796, 0.3105217, 0.7375797, 1, 1, 1, 1, 1,
-0.01476655, 0.5685397, 1.810431, 1, 1, 1, 1, 1,
-0.01475136, 1.152985, -1.208454, 1, 1, 1, 1, 1,
-0.005157383, -1.287488, -3.433462, 1, 1, 1, 1, 1,
-0.00138294, 0.6344177, 0.3184827, 1, 1, 1, 1, 1,
-0.0002968369, -1.118336, -3.73994, 1, 1, 1, 1, 1,
0.0009886958, 0.2091108, -0.8281115, 1, 1, 1, 1, 1,
0.01178283, -1.395741, 1.818105, 1, 1, 1, 1, 1,
0.01382485, -2.054175, 1.345796, 0, 0, 1, 1, 1,
0.01612268, 0.1360448, 0.1679847, 1, 0, 0, 1, 1,
0.01707482, -0.5162129, 4.659058, 1, 0, 0, 1, 1,
0.01725239, -2.090856, 2.274781, 1, 0, 0, 1, 1,
0.01762626, 0.2145784, 0.862045, 1, 0, 0, 1, 1,
0.02016025, -0.5873257, 5.528651, 1, 0, 0, 1, 1,
0.02403404, 0.3492671, 0.1447519, 0, 0, 0, 1, 1,
0.03074738, -0.5188663, 3.901356, 0, 0, 0, 1, 1,
0.03597231, 0.3313831, -0.81686, 0, 0, 0, 1, 1,
0.03786536, -0.2094945, 3.723209, 0, 0, 0, 1, 1,
0.03846823, 0.4138023, 0.9417744, 0, 0, 0, 1, 1,
0.03885239, 0.3119036, -0.4039573, 0, 0, 0, 1, 1,
0.04303414, 0.3634772, 1.018525, 0, 0, 0, 1, 1,
0.04539736, -0.6305479, 1.661878, 1, 1, 1, 1, 1,
0.04689337, 0.01672877, 2.627479, 1, 1, 1, 1, 1,
0.04795808, 0.2096895, 1.216942, 1, 1, 1, 1, 1,
0.05006383, -1.047366, 3.399297, 1, 1, 1, 1, 1,
0.05063019, 0.6391997, -0.658072, 1, 1, 1, 1, 1,
0.05218716, -0.6932289, 1.785399, 1, 1, 1, 1, 1,
0.05276753, -2.469132, 2.652467, 1, 1, 1, 1, 1,
0.05627171, -0.8064023, 2.651566, 1, 1, 1, 1, 1,
0.0563641, 1.996966, -1.480798, 1, 1, 1, 1, 1,
0.05794816, -1.344449, 2.9708, 1, 1, 1, 1, 1,
0.05934368, 0.9019083, -0.7612095, 1, 1, 1, 1, 1,
0.06118649, -0.2445524, 3.406404, 1, 1, 1, 1, 1,
0.06275167, -0.8255088, 2.881153, 1, 1, 1, 1, 1,
0.06627614, 0.9642617, 0.643252, 1, 1, 1, 1, 1,
0.06630811, 2.097214, 0.03377867, 1, 1, 1, 1, 1,
0.0700257, -1.484363, 2.842135, 0, 0, 1, 1, 1,
0.07379965, -0.4898617, 1.880317, 1, 0, 0, 1, 1,
0.07501439, -0.2455012, 2.118217, 1, 0, 0, 1, 1,
0.07629983, -0.4501749, 1.708973, 1, 0, 0, 1, 1,
0.08062042, -0.2681424, 2.347209, 1, 0, 0, 1, 1,
0.08096407, 0.5816148, -0.6726281, 1, 0, 0, 1, 1,
0.08615616, 0.2117676, -0.1335378, 0, 0, 0, 1, 1,
0.08646558, 0.5805154, 0.2777658, 0, 0, 0, 1, 1,
0.09450158, -0.1308534, 2.49844, 0, 0, 0, 1, 1,
0.0977181, 0.1464543, 0.2654467, 0, 0, 0, 1, 1,
0.09958542, -0.5303604, 2.433669, 0, 0, 0, 1, 1,
0.1010416, -0.748288, 2.70034, 0, 0, 0, 1, 1,
0.1053766, -0.7050074, 1.45038, 0, 0, 0, 1, 1,
0.1156183, -2.405971, 2.446774, 1, 1, 1, 1, 1,
0.1226549, -0.6170982, 3.748937, 1, 1, 1, 1, 1,
0.1288597, 0.6899421, 0.1445355, 1, 1, 1, 1, 1,
0.1389274, 0.2488973, 0.9709993, 1, 1, 1, 1, 1,
0.1414715, -0.3204446, 2.871507, 1, 1, 1, 1, 1,
0.1424005, 0.4591363, -1.165011, 1, 1, 1, 1, 1,
0.1428039, 1.528795, 0.0416352, 1, 1, 1, 1, 1,
0.1450065, -0.1351761, 2.499566, 1, 1, 1, 1, 1,
0.1485565, -0.6507958, 2.635019, 1, 1, 1, 1, 1,
0.1486675, 0.1244311, 1.563747, 1, 1, 1, 1, 1,
0.1498565, -0.2191015, 3.860017, 1, 1, 1, 1, 1,
0.150517, -1.761351, 3.494051, 1, 1, 1, 1, 1,
0.1510932, -1.120307, 2.650399, 1, 1, 1, 1, 1,
0.1554229, -0.2232998, 1.235636, 1, 1, 1, 1, 1,
0.1583017, 0.1286421, 1.526019, 1, 1, 1, 1, 1,
0.1595876, -0.5533814, 2.987433, 0, 0, 1, 1, 1,
0.1618682, 0.4412164, 0.6143658, 1, 0, 0, 1, 1,
0.162204, 1.811681, -0.5795993, 1, 0, 0, 1, 1,
0.1623029, -0.1597149, 1.936968, 1, 0, 0, 1, 1,
0.1626292, -2.458185, 2.997719, 1, 0, 0, 1, 1,
0.1628487, -0.3830209, 4.495423, 1, 0, 0, 1, 1,
0.1681173, -0.1972378, 1.325605, 0, 0, 0, 1, 1,
0.173398, 0.1466899, 1.08434, 0, 0, 0, 1, 1,
0.1739646, -0.1138241, 2.343889, 0, 0, 0, 1, 1,
0.1817632, 0.4759834, 1.123499, 0, 0, 0, 1, 1,
0.182519, -1.108055, 2.762723, 0, 0, 0, 1, 1,
0.1835263, -0.6260532, 2.578327, 0, 0, 0, 1, 1,
0.1868218, -1.00664, 2.791831, 0, 0, 0, 1, 1,
0.1926868, 1.591921, -1.686601, 1, 1, 1, 1, 1,
0.1959824, 1.661965, 1.035047, 1, 1, 1, 1, 1,
0.1984797, 1.013859, 1.786884, 1, 1, 1, 1, 1,
0.1988456, 1.839615, 0.7243827, 1, 1, 1, 1, 1,
0.1993775, -0.4273213, 3.892268, 1, 1, 1, 1, 1,
0.1995691, 0.107651, 1.087758, 1, 1, 1, 1, 1,
0.2048263, -1.23917, 2.586846, 1, 1, 1, 1, 1,
0.2063371, 0.2410756, -0.3684836, 1, 1, 1, 1, 1,
0.2099904, -1.059588, 4.163741, 1, 1, 1, 1, 1,
0.2122639, -0.1781351, 4.347224, 1, 1, 1, 1, 1,
0.2126664, 0.4274749, 0.4249087, 1, 1, 1, 1, 1,
0.2226524, -0.2563759, 3.095096, 1, 1, 1, 1, 1,
0.2226844, -1.686742, 2.663299, 1, 1, 1, 1, 1,
0.2240195, 1.520348, -1.161784, 1, 1, 1, 1, 1,
0.224781, 1.259733, 0.5247785, 1, 1, 1, 1, 1,
0.2252877, -0.8682208, 5.335599, 0, 0, 1, 1, 1,
0.2284779, 1.037317, 0.1379705, 1, 0, 0, 1, 1,
0.2311512, -0.313468, 1.373583, 1, 0, 0, 1, 1,
0.2315223, 1.195551, 0.5270177, 1, 0, 0, 1, 1,
0.2318611, 0.3886394, 0.5586743, 1, 0, 0, 1, 1,
0.2338293, 0.6167689, 0.9911956, 1, 0, 0, 1, 1,
0.2343931, -1.767815, 3.060729, 0, 0, 0, 1, 1,
0.2460638, 0.950831, 0.7383743, 0, 0, 0, 1, 1,
0.2470283, -0.6674877, 2.188285, 0, 0, 0, 1, 1,
0.2506652, 1.493622, -0.1572143, 0, 0, 0, 1, 1,
0.2520519, -0.895606, 2.317202, 0, 0, 0, 1, 1,
0.2555979, -1.293869, 3.088371, 0, 0, 0, 1, 1,
0.2567564, -1.537857, 2.953224, 0, 0, 0, 1, 1,
0.2571742, 0.9303306, 1.588595, 1, 1, 1, 1, 1,
0.2577864, -1.16203, 3.892293, 1, 1, 1, 1, 1,
0.2595221, 0.6165004, 0.5363028, 1, 1, 1, 1, 1,
0.2619134, 0.5234388, -0.5027534, 1, 1, 1, 1, 1,
0.2625453, -0.6492695, 2.80018, 1, 1, 1, 1, 1,
0.266382, -0.7758948, 3.68063, 1, 1, 1, 1, 1,
0.2664061, 1.206109, 0.2939547, 1, 1, 1, 1, 1,
0.2672561, -0.4667574, 1.562948, 1, 1, 1, 1, 1,
0.2742872, -0.4816706, 2.808887, 1, 1, 1, 1, 1,
0.2804941, -0.9513356, 2.974028, 1, 1, 1, 1, 1,
0.2810003, 1.192593, 1.26601, 1, 1, 1, 1, 1,
0.2811321, -0.7295195, 2.598348, 1, 1, 1, 1, 1,
0.2837024, -0.3106366, 1.802807, 1, 1, 1, 1, 1,
0.2930029, 0.0008195291, 2.541951, 1, 1, 1, 1, 1,
0.2956634, 0.5992403, 0.9461703, 1, 1, 1, 1, 1,
0.2960717, 0.1921559, 1.034031, 0, 0, 1, 1, 1,
0.2973202, -0.4613422, 2.697118, 1, 0, 0, 1, 1,
0.2983659, -1.279211, 2.035015, 1, 0, 0, 1, 1,
0.2985692, 0.1123435, 1.924727, 1, 0, 0, 1, 1,
0.2987213, 0.931823, 0.004552109, 1, 0, 0, 1, 1,
0.2989651, -1.356081, 1.089445, 1, 0, 0, 1, 1,
0.3038746, -1.294567, 3.089496, 0, 0, 0, 1, 1,
0.3067954, 1.637856, 0.04001091, 0, 0, 0, 1, 1,
0.3081533, 0.812806, 1.141215, 0, 0, 0, 1, 1,
0.3100857, 1.30476, -0.4738625, 0, 0, 0, 1, 1,
0.3137106, -0.9707447, 4.237637, 0, 0, 0, 1, 1,
0.3146349, 0.9305829, -0.3782072, 0, 0, 0, 1, 1,
0.3200952, -0.4165456, 2.244799, 0, 0, 0, 1, 1,
0.3216519, -0.5058721, 1.899284, 1, 1, 1, 1, 1,
0.3248256, 0.1787082, 1.334693, 1, 1, 1, 1, 1,
0.3272268, -0.881723, 3.209781, 1, 1, 1, 1, 1,
0.3275513, -0.284838, 3.943285, 1, 1, 1, 1, 1,
0.3298744, -0.7970954, 1.736652, 1, 1, 1, 1, 1,
0.3315758, 0.6437221, 0.04725081, 1, 1, 1, 1, 1,
0.3348338, -0.2071631, 3.619932, 1, 1, 1, 1, 1,
0.3369546, 0.106952, 0.9038237, 1, 1, 1, 1, 1,
0.3381485, 0.1787328, 1.357054, 1, 1, 1, 1, 1,
0.3382913, -0.09275106, 3.934709, 1, 1, 1, 1, 1,
0.3419821, -0.05507001, 1.37448, 1, 1, 1, 1, 1,
0.3425254, 0.831432, 1.507007, 1, 1, 1, 1, 1,
0.3434606, -0.04191187, 0.3967531, 1, 1, 1, 1, 1,
0.3439757, 0.05012042, 0.5094883, 1, 1, 1, 1, 1,
0.3455216, 0.509385, -1.032752, 1, 1, 1, 1, 1,
0.3469306, 1.279918, 1.439496, 0, 0, 1, 1, 1,
0.3497183, 0.3914402, 0.04753467, 1, 0, 0, 1, 1,
0.3516478, -1.418668, 2.973877, 1, 0, 0, 1, 1,
0.353038, -0.6692467, 2.789905, 1, 0, 0, 1, 1,
0.353306, 1.109342, -0.1223263, 1, 0, 0, 1, 1,
0.3546184, -0.4760133, 0.4004022, 1, 0, 0, 1, 1,
0.3599885, 0.4404814, 0.3813513, 0, 0, 0, 1, 1,
0.3602035, 1.073738, 0.8496267, 0, 0, 0, 1, 1,
0.3642865, 0.3041652, 0.04852517, 0, 0, 0, 1, 1,
0.3645694, -0.4892107, 1.376957, 0, 0, 0, 1, 1,
0.3661623, 0.2273294, 1.286915, 0, 0, 0, 1, 1,
0.3679579, 1.224728, 0.9343644, 0, 0, 0, 1, 1,
0.3681592, 0.9976926, -0.5938675, 0, 0, 0, 1, 1,
0.3731054, -0.9702229, 2.571802, 1, 1, 1, 1, 1,
0.3759362, -1.963576, 3.624717, 1, 1, 1, 1, 1,
0.3766162, -1.377147, 4.936559, 1, 1, 1, 1, 1,
0.3798338, 0.04126358, 2.404136, 1, 1, 1, 1, 1,
0.3893217, 0.02127865, 2.839982, 1, 1, 1, 1, 1,
0.3903863, 0.2160509, -0.1973849, 1, 1, 1, 1, 1,
0.3904008, 0.4384747, 0.8619301, 1, 1, 1, 1, 1,
0.4008383, 0.2166346, 1.558274, 1, 1, 1, 1, 1,
0.4009331, 0.5566394, -0.1175166, 1, 1, 1, 1, 1,
0.4025578, 0.6629345, 0.1294884, 1, 1, 1, 1, 1,
0.4073345, -0.6003996, 2.565433, 1, 1, 1, 1, 1,
0.4092067, -0.3438876, 2.375951, 1, 1, 1, 1, 1,
0.4152583, 1.556998, -0.1465623, 1, 1, 1, 1, 1,
0.4164495, 0.01978006, 1.61609, 1, 1, 1, 1, 1,
0.4216586, -1.785483, 4.058601, 1, 1, 1, 1, 1,
0.4243016, 0.5652255, -0.1016833, 0, 0, 1, 1, 1,
0.4252919, 1.064843, 1.357328, 1, 0, 0, 1, 1,
0.4255709, -0.8102652, 1.998732, 1, 0, 0, 1, 1,
0.4270472, -1.22094, 2.147874, 1, 0, 0, 1, 1,
0.4274667, -0.01299091, 2.981252, 1, 0, 0, 1, 1,
0.4284596, 0.2352645, 0.3301844, 1, 0, 0, 1, 1,
0.428788, -0.4707328, 3.599851, 0, 0, 0, 1, 1,
0.4314136, 2.255055, 1.279093, 0, 0, 0, 1, 1,
0.4364243, 1.00914, 0.7471984, 0, 0, 0, 1, 1,
0.4365092, 1.682966, -0.5868378, 0, 0, 0, 1, 1,
0.4371832, -0.900219, 1.907336, 0, 0, 0, 1, 1,
0.4387004, 1.184629, -1.548737, 0, 0, 0, 1, 1,
0.4389147, 0.3762218, 1.587017, 0, 0, 0, 1, 1,
0.4461933, -1.494884, 3.084102, 1, 1, 1, 1, 1,
0.446621, -1.509368, 2.756635, 1, 1, 1, 1, 1,
0.4482296, 0.3534366, 0.9977599, 1, 1, 1, 1, 1,
0.4550185, 0.8916156, 0.1067652, 1, 1, 1, 1, 1,
0.4593082, 0.1170894, 1.723587, 1, 1, 1, 1, 1,
0.467079, 0.4524615, 0.4587897, 1, 1, 1, 1, 1,
0.4680919, -0.2399391, 2.049882, 1, 1, 1, 1, 1,
0.4713474, 0.5322556, 3.240355, 1, 1, 1, 1, 1,
0.4761926, -2.649126, 2.284715, 1, 1, 1, 1, 1,
0.4773335, -0.3852335, 0.8205839, 1, 1, 1, 1, 1,
0.4780577, 1.552366, -1.073876, 1, 1, 1, 1, 1,
0.4824439, 1.127794, 0.6704364, 1, 1, 1, 1, 1,
0.4883753, 0.6527108, 2.21544, 1, 1, 1, 1, 1,
0.4953921, -0.2166151, 2.14053, 1, 1, 1, 1, 1,
0.4963245, 0.1433406, -0.2357636, 1, 1, 1, 1, 1,
0.5104196, -0.4037244, 1.449167, 0, 0, 1, 1, 1,
0.5120942, -1.139119, 3.023513, 1, 0, 0, 1, 1,
0.5146399, -0.03893182, 2.765329, 1, 0, 0, 1, 1,
0.5184292, 0.7222198, 1.766922, 1, 0, 0, 1, 1,
0.5197417, -0.2699462, 0.2598591, 1, 0, 0, 1, 1,
0.5210346, -0.56576, 1.535875, 1, 0, 0, 1, 1,
0.5274286, 0.5856708, -1.60091, 0, 0, 0, 1, 1,
0.5293422, -0.7748409, 2.150208, 0, 0, 0, 1, 1,
0.5359313, 0.6549808, 0.8832633, 0, 0, 0, 1, 1,
0.5423983, 0.09067068, 0.5259954, 0, 0, 0, 1, 1,
0.5443917, 0.5139092, 0.3356771, 0, 0, 0, 1, 1,
0.5470127, 0.3911057, -1.708856, 0, 0, 0, 1, 1,
0.5476128, 0.5090458, -1.438268, 0, 0, 0, 1, 1,
0.5537171, -0.21188, 1.995642, 1, 1, 1, 1, 1,
0.5555375, -1.561765, 2.34834, 1, 1, 1, 1, 1,
0.5571345, -0.2903269, 2.205043, 1, 1, 1, 1, 1,
0.5578831, 0.04151851, 2.839566, 1, 1, 1, 1, 1,
0.5611085, 0.6192262, -0.3357863, 1, 1, 1, 1, 1,
0.5619847, -0.708957, 4.22473, 1, 1, 1, 1, 1,
0.5662289, -0.4787295, 2.743837, 1, 1, 1, 1, 1,
0.5681131, 0.09881897, 1.794529, 1, 1, 1, 1, 1,
0.569678, -1.061335, 3.078346, 1, 1, 1, 1, 1,
0.5698094, -0.8339866, 2.342019, 1, 1, 1, 1, 1,
0.5703084, 0.2819623, 1.291854, 1, 1, 1, 1, 1,
0.5713347, 0.003225954, -0.25712, 1, 1, 1, 1, 1,
0.5746118, -0.523228, 2.607547, 1, 1, 1, 1, 1,
0.5786599, -1.667253, 2.431461, 1, 1, 1, 1, 1,
0.5821409, 0.2575848, 2.048325, 1, 1, 1, 1, 1,
0.5853642, -0.8024049, 2.330601, 0, 0, 1, 1, 1,
0.5904366, -0.6247069, 1.911377, 1, 0, 0, 1, 1,
0.5907777, -0.783385, 2.033018, 1, 0, 0, 1, 1,
0.591997, 0.3658767, 1.203694, 1, 0, 0, 1, 1,
0.5950651, 0.5153662, 1.703274, 1, 0, 0, 1, 1,
0.5951508, 1.177724, 0.2960083, 1, 0, 0, 1, 1,
0.5957296, 0.2044827, -0.4336659, 0, 0, 0, 1, 1,
0.6030282, -1.403461, 2.875045, 0, 0, 0, 1, 1,
0.6058284, 0.6511639, 2.017027, 0, 0, 0, 1, 1,
0.6093532, 0.600953, 1.324107, 0, 0, 0, 1, 1,
0.6109825, 0.7893094, 0.8864631, 0, 0, 0, 1, 1,
0.6154668, 0.1197747, 2.302032, 0, 0, 0, 1, 1,
0.6156805, -0.02896009, 2.710275, 0, 0, 0, 1, 1,
0.6175247, -0.3723038, 3.190382, 1, 1, 1, 1, 1,
0.6238911, -0.1522531, 3.016062, 1, 1, 1, 1, 1,
0.6276296, -0.3967788, 3.162494, 1, 1, 1, 1, 1,
0.6395417, 0.4569111, -0.9438168, 1, 1, 1, 1, 1,
0.6489451, 0.3691629, 0.7302252, 1, 1, 1, 1, 1,
0.6572871, 0.4780856, 1.911494, 1, 1, 1, 1, 1,
0.6590143, -1.110892, 3.45424, 1, 1, 1, 1, 1,
0.6601486, 1.011534, -0.3842919, 1, 1, 1, 1, 1,
0.6739739, 0.05313852, 1.132539, 1, 1, 1, 1, 1,
0.6784868, 1.57821, 1.483053, 1, 1, 1, 1, 1,
0.6838986, 0.6189007, 1.058315, 1, 1, 1, 1, 1,
0.6932871, -1.678043, 3.256041, 1, 1, 1, 1, 1,
0.6982126, 0.8414757, 1.305852, 1, 1, 1, 1, 1,
0.7059993, -2.918923, 1.191153, 1, 1, 1, 1, 1,
0.7099706, 0.913923, 0.8677295, 1, 1, 1, 1, 1,
0.7102869, -0.6244038, 1.844443, 0, 0, 1, 1, 1,
0.7158766, 1.979577, 0.3764623, 1, 0, 0, 1, 1,
0.7186981, -0.03706412, 1.121929, 1, 0, 0, 1, 1,
0.7347839, -1.320868, 1.757457, 1, 0, 0, 1, 1,
0.7354332, 1.17171, -1.899808, 1, 0, 0, 1, 1,
0.7369775, 0.643053, 2.652072, 1, 0, 0, 1, 1,
0.7377865, -0.2003315, 2.046183, 0, 0, 0, 1, 1,
0.738713, -0.4337617, 3.216946, 0, 0, 0, 1, 1,
0.739727, 1.452005, 0.2394895, 0, 0, 0, 1, 1,
0.7400522, 1.245419, 2.723842, 0, 0, 0, 1, 1,
0.7411319, -0.5393758, 2.256007, 0, 0, 0, 1, 1,
0.7431131, 0.1501353, 1.550714, 0, 0, 0, 1, 1,
0.7464058, 0.5284669, 1.085433, 0, 0, 0, 1, 1,
0.7498271, -1.007797, 3.921609, 1, 1, 1, 1, 1,
0.7535795, -0.8292051, 3.076524, 1, 1, 1, 1, 1,
0.7569074, -0.158577, 2.940938, 1, 1, 1, 1, 1,
0.7594558, 1.531867, -1.310648, 1, 1, 1, 1, 1,
0.760628, -1.353631, 4.284324, 1, 1, 1, 1, 1,
0.7641342, -1.675508, 3.645295, 1, 1, 1, 1, 1,
0.7729202, -2.697068, 3.041528, 1, 1, 1, 1, 1,
0.7877231, 0.5751334, 2.432112, 1, 1, 1, 1, 1,
0.7948, 1.999729, 1.931212, 1, 1, 1, 1, 1,
0.7956662, -1.669421, 3.548736, 1, 1, 1, 1, 1,
0.7988871, -0.4227051, 1.563015, 1, 1, 1, 1, 1,
0.8006749, -0.04284626, 2.831866, 1, 1, 1, 1, 1,
0.806769, -2.045181, 4.019373, 1, 1, 1, 1, 1,
0.8103819, -0.662899, 1.540637, 1, 1, 1, 1, 1,
0.8122708, -0.7668637, 2.108159, 1, 1, 1, 1, 1,
0.8174542, -0.1141025, 1.64325, 0, 0, 1, 1, 1,
0.8214183, -0.2536514, 0.2117393, 1, 0, 0, 1, 1,
0.821473, 1.223735, -0.8447613, 1, 0, 0, 1, 1,
0.8224088, -1.87994, 1.68474, 1, 0, 0, 1, 1,
0.8240841, 0.8002242, 0.3655714, 1, 0, 0, 1, 1,
0.8244702, -0.1359304, 1.269471, 1, 0, 0, 1, 1,
0.8252859, -1.585517, 2.658162, 0, 0, 0, 1, 1,
0.8353145, -0.382354, 2.622562, 0, 0, 0, 1, 1,
0.8404113, -0.8212093, 1.107789, 0, 0, 0, 1, 1,
0.8460132, -1.634038, 2.143993, 0, 0, 0, 1, 1,
0.847593, -0.7453405, 0.8463541, 0, 0, 0, 1, 1,
0.850897, -0.4872764, 0.5681655, 0, 0, 0, 1, 1,
0.8527713, -2.169331, 3.812105, 0, 0, 0, 1, 1,
0.8545839, -0.7856338, 1.922973, 1, 1, 1, 1, 1,
0.8552781, -0.4372006, 2.205654, 1, 1, 1, 1, 1,
0.8584376, -0.4801301, 1.021134, 1, 1, 1, 1, 1,
0.8596932, -0.1930731, 1.597455, 1, 1, 1, 1, 1,
0.8599772, -1.030153, 3.372311, 1, 1, 1, 1, 1,
0.8635475, 1.125651, 0.1827716, 1, 1, 1, 1, 1,
0.8766189, -1.217109, 1.11611, 1, 1, 1, 1, 1,
0.8779868, 2.543556, 0.3225372, 1, 1, 1, 1, 1,
0.8828707, -0.008271343, 0.802142, 1, 1, 1, 1, 1,
0.8858408, 0.3259785, 1.636827, 1, 1, 1, 1, 1,
0.8871111, -1.078712, 2.390398, 1, 1, 1, 1, 1,
0.8877697, 1.079163, 1.845422, 1, 1, 1, 1, 1,
0.8888449, 0.6034022, 0.4365759, 1, 1, 1, 1, 1,
0.8944749, 0.8835393, 1.275913, 1, 1, 1, 1, 1,
0.8988227, 0.2618562, 1.544801, 1, 1, 1, 1, 1,
0.9010515, 0.007103049, 1.467749, 0, 0, 1, 1, 1,
0.9051594, 0.3726474, -0.2319733, 1, 0, 0, 1, 1,
0.907989, -0.2339234, 3.016371, 1, 0, 0, 1, 1,
0.912392, -0.000644964, 1.042393, 1, 0, 0, 1, 1,
0.9183437, -0.6759136, 3.056141, 1, 0, 0, 1, 1,
0.9209939, 0.2191689, 2.410031, 1, 0, 0, 1, 1,
0.9323066, 0.1900197, 0.01251744, 0, 0, 0, 1, 1,
0.933451, -1.852275, 4.17616, 0, 0, 0, 1, 1,
0.9348499, 0.6600502, 2.072991, 0, 0, 0, 1, 1,
0.9353029, 0.6406842, 2.143528, 0, 0, 0, 1, 1,
0.9390382, -1.622906, 4.521169, 0, 0, 0, 1, 1,
0.9553756, 0.4641528, 1.887477, 0, 0, 0, 1, 1,
0.9560121, 0.6805717, 2.019978, 0, 0, 0, 1, 1,
0.9616867, 0.4885904, 1.571543, 1, 1, 1, 1, 1,
0.9674885, 2.545959, 0.3439904, 1, 1, 1, 1, 1,
0.9846556, 1.001415, 2.632113, 1, 1, 1, 1, 1,
0.9907155, 0.03211668, -0.04188106, 1, 1, 1, 1, 1,
0.9929808, -0.864766, 1.416794, 1, 1, 1, 1, 1,
1.006452, 0.5033402, 1.219107, 1, 1, 1, 1, 1,
1.009936, 0.5789573, 1.267692, 1, 1, 1, 1, 1,
1.010676, 0.09488248, 3.384525, 1, 1, 1, 1, 1,
1.012932, 0.197013, -0.2309314, 1, 1, 1, 1, 1,
1.01565, 0.4952897, -0.6665886, 1, 1, 1, 1, 1,
1.017034, -0.5535837, 0.387809, 1, 1, 1, 1, 1,
1.018901, -0.5995547, 2.860675, 1, 1, 1, 1, 1,
1.020254, -1.250199, 2.01622, 1, 1, 1, 1, 1,
1.037504, -1.456339, 1.835824, 1, 1, 1, 1, 1,
1.038246, -0.3001669, 2.869091, 1, 1, 1, 1, 1,
1.041392, -0.6795737, 0.2680199, 0, 0, 1, 1, 1,
1.046841, 0.7899837, 2.222401, 1, 0, 0, 1, 1,
1.050584, -1.367404, 2.185516, 1, 0, 0, 1, 1,
1.054465, 0.2200244, 1.160312, 1, 0, 0, 1, 1,
1.059091, 0.2740556, -0.004889377, 1, 0, 0, 1, 1,
1.061269, 0.468158, 1.285723, 1, 0, 0, 1, 1,
1.061965, -0.8836144, 2.700118, 0, 0, 0, 1, 1,
1.063641, 2.317221, 0.07743194, 0, 0, 0, 1, 1,
1.065204, 0.3281364, 1.957859, 0, 0, 0, 1, 1,
1.068182, 0.2071702, 2.738455, 0, 0, 0, 1, 1,
1.07992, 1.306777, -0.1770183, 0, 0, 0, 1, 1,
1.084928, 0.1471906, 0.7814724, 0, 0, 0, 1, 1,
1.085924, 1.307543, -0.009829906, 0, 0, 0, 1, 1,
1.087903, 0.5187273, 0.20715, 1, 1, 1, 1, 1,
1.087998, 1.550885, 0.8529706, 1, 1, 1, 1, 1,
1.089319, 1.14154, 1.906477, 1, 1, 1, 1, 1,
1.097835, -1.769282, 3.72245, 1, 1, 1, 1, 1,
1.100642, 0.157542, 3.556038, 1, 1, 1, 1, 1,
1.101263, -1.698919, 2.220092, 1, 1, 1, 1, 1,
1.106761, -0.4534787, 2.823246, 1, 1, 1, 1, 1,
1.116259, 0.6171751, 2.960084, 1, 1, 1, 1, 1,
1.116431, 0.2144089, 3.0887, 1, 1, 1, 1, 1,
1.11937, 0.9145266, 1.245461, 1, 1, 1, 1, 1,
1.12149, 1.236857, -0.8908643, 1, 1, 1, 1, 1,
1.123679, -0.1746072, 0.6333914, 1, 1, 1, 1, 1,
1.132715, -0.8598893, 1.465512, 1, 1, 1, 1, 1,
1.133212, -0.6555039, 1.113502, 1, 1, 1, 1, 1,
1.134397, 0.1960862, 1.204313, 1, 1, 1, 1, 1,
1.135859, 1.720465, 0.200062, 0, 0, 1, 1, 1,
1.141614, -0.8499413, 1.43537, 1, 0, 0, 1, 1,
1.148102, 1.41394, 1.026444, 1, 0, 0, 1, 1,
1.158134, -1.965666, 2.341951, 1, 0, 0, 1, 1,
1.162883, -0.2306202, -0.5378687, 1, 0, 0, 1, 1,
1.16582, -2.149659, 1.776848, 1, 0, 0, 1, 1,
1.168654, 1.179778, -0.5199741, 0, 0, 0, 1, 1,
1.169902, -1.106879, 1.872057, 0, 0, 0, 1, 1,
1.171432, 1.401161, 0.9086692, 0, 0, 0, 1, 1,
1.172669, -1.325969, 1.797776, 0, 0, 0, 1, 1,
1.17369, -1.137749, 0.8731238, 0, 0, 0, 1, 1,
1.181173, -0.2941998, 2.077965, 0, 0, 0, 1, 1,
1.188462, 1.306134, 0.3321992, 0, 0, 0, 1, 1,
1.195352, 0.133997, 1.475855, 1, 1, 1, 1, 1,
1.198238, -1.313472, 2.139014, 1, 1, 1, 1, 1,
1.200194, -0.9113808, 2.096243, 1, 1, 1, 1, 1,
1.20708, -0.5648791, 2.062192, 1, 1, 1, 1, 1,
1.210945, 0.8055382, 2.093479, 1, 1, 1, 1, 1,
1.211107, 0.4888295, 1.708779, 1, 1, 1, 1, 1,
1.211131, 0.5458252, 2.27138, 1, 1, 1, 1, 1,
1.213817, 0.207911, 1.084409, 1, 1, 1, 1, 1,
1.216095, 0.4742848, 0.9220068, 1, 1, 1, 1, 1,
1.21803, 1.326824, 0.2829369, 1, 1, 1, 1, 1,
1.219536, -0.2097479, 0.254177, 1, 1, 1, 1, 1,
1.219554, -0.5201559, 3.177643, 1, 1, 1, 1, 1,
1.234194, 0.4973495, 2.341534, 1, 1, 1, 1, 1,
1.242567, -0.7949354, 4.166059, 1, 1, 1, 1, 1,
1.246573, 0.668287, 1.948401, 1, 1, 1, 1, 1,
1.247638, -1.302498, 3.443666, 0, 0, 1, 1, 1,
1.248344, -0.1667265, 0.6342718, 1, 0, 0, 1, 1,
1.280751, 0.6346354, 4.03213, 1, 0, 0, 1, 1,
1.281861, 1.428833, 0.6188065, 1, 0, 0, 1, 1,
1.285137, 0.5518787, 2.366083, 1, 0, 0, 1, 1,
1.286469, 0.893046, 1.162668, 1, 0, 0, 1, 1,
1.292428, -0.6087257, 0.2873195, 0, 0, 0, 1, 1,
1.308083, -2.032399, 1.10007, 0, 0, 0, 1, 1,
1.315379, -0.02194077, 1.281585, 0, 0, 0, 1, 1,
1.315401, -0.534414, 1.569351, 0, 0, 0, 1, 1,
1.316764, -0.1510751, 1.492753, 0, 0, 0, 1, 1,
1.319148, 0.6570617, 3.57853, 0, 0, 0, 1, 1,
1.326103, -0.6145343, -0.1831872, 0, 0, 0, 1, 1,
1.331375, -0.3126109, 1.43167, 1, 1, 1, 1, 1,
1.341182, 2.121939, -0.9885055, 1, 1, 1, 1, 1,
1.344949, 1.288072, 1.529437, 1, 1, 1, 1, 1,
1.347559, -0.06750397, 2.544442, 1, 1, 1, 1, 1,
1.367546, -0.3921911, 1.047927, 1, 1, 1, 1, 1,
1.378736, -0.2030504, 2.519677, 1, 1, 1, 1, 1,
1.379653, -1.042914, 3.463083, 1, 1, 1, 1, 1,
1.382486, 0.4173758, 2.854998, 1, 1, 1, 1, 1,
1.387578, -1.142683, 1.55747, 1, 1, 1, 1, 1,
1.392087, -1.613535, 2.728599, 1, 1, 1, 1, 1,
1.408918, -0.7288522, 0.5763313, 1, 1, 1, 1, 1,
1.412349, -0.009528421, 0.910605, 1, 1, 1, 1, 1,
1.418762, 0.08723701, 0.6896095, 1, 1, 1, 1, 1,
1.437592, 0.3229591, 1.115941, 1, 1, 1, 1, 1,
1.455544, -0.4313851, 2.096604, 1, 1, 1, 1, 1,
1.457924, 0.5225507, 0.3876081, 0, 0, 1, 1, 1,
1.45943, -1.054118, 1.565676, 1, 0, 0, 1, 1,
1.46134, -0.6003193, 2.014139, 1, 0, 0, 1, 1,
1.462073, 0.2778154, 1.102093, 1, 0, 0, 1, 1,
1.472305, -0.08291255, 1.156592, 1, 0, 0, 1, 1,
1.494873, -0.89299, 1.121398, 1, 0, 0, 1, 1,
1.512032, 1.249286, -0.0283706, 0, 0, 0, 1, 1,
1.521579, -0.6514644, 1.377124, 0, 0, 0, 1, 1,
1.533786, 2.370468, 2.855731, 0, 0, 0, 1, 1,
1.539334, 0.004044176, 1.278559, 0, 0, 0, 1, 1,
1.548057, -1.060253, 2.348139, 0, 0, 0, 1, 1,
1.548135, 0.3436177, 1.853294, 0, 0, 0, 1, 1,
1.551634, 1.422779, -0.1859683, 0, 0, 0, 1, 1,
1.577839, 0.1302734, 2.262651, 1, 1, 1, 1, 1,
1.578106, 0.6876777, 0.2870905, 1, 1, 1, 1, 1,
1.583871, 0.9657611, 2.170544, 1, 1, 1, 1, 1,
1.588885, -0.6778495, 1.83723, 1, 1, 1, 1, 1,
1.59409, -0.9656653, 2.748071, 1, 1, 1, 1, 1,
1.604199, -1.451244, 2.406465, 1, 1, 1, 1, 1,
1.632335, -0.7929443, 4.346972, 1, 1, 1, 1, 1,
1.633806, -1.679584, 0.7982429, 1, 1, 1, 1, 1,
1.64123, -0.6287084, 2.527236, 1, 1, 1, 1, 1,
1.642549, 0.9308423, 1.331176, 1, 1, 1, 1, 1,
1.644967, -0.9086981, 0.7052937, 1, 1, 1, 1, 1,
1.655682, -1.106523, 1.93352, 1, 1, 1, 1, 1,
1.65623, -1.719025, 3.549021, 1, 1, 1, 1, 1,
1.691314, 0.2910894, 1.538366, 1, 1, 1, 1, 1,
1.694288, 0.1374564, 1.557729, 1, 1, 1, 1, 1,
1.730156, -0.568612, 0.9304683, 0, 0, 1, 1, 1,
1.752368, 0.7839298, -0.2596845, 1, 0, 0, 1, 1,
1.754319, 0.8495343, 1.432265, 1, 0, 0, 1, 1,
1.764406, 1.103611, 1.173169, 1, 0, 0, 1, 1,
1.777796, -0.5004507, 3.563117, 1, 0, 0, 1, 1,
1.78381, -0.8227311, 2.897021, 1, 0, 0, 1, 1,
1.799339, 0.3869932, 1.035004, 0, 0, 0, 1, 1,
1.8064, -0.5681255, 2.550941, 0, 0, 0, 1, 1,
1.806849, 0.1044036, 0.7850671, 0, 0, 0, 1, 1,
1.807236, 1.833957, 1.890753, 0, 0, 0, 1, 1,
1.809298, 0.1781794, 2.003998, 0, 0, 0, 1, 1,
1.825029, 1.957989, 1.622763, 0, 0, 0, 1, 1,
1.826675, 0.4631825, 1.487455, 0, 0, 0, 1, 1,
1.835932, 2.045682, 0.7151015, 1, 1, 1, 1, 1,
1.841701, 0.518879, 0.5749362, 1, 1, 1, 1, 1,
1.855043, 0.2468381, 2.304166, 1, 1, 1, 1, 1,
1.870775, 0.3048963, -0.3962154, 1, 1, 1, 1, 1,
1.898162, -0.1899536, 2.349742, 1, 1, 1, 1, 1,
1.904395, -0.7735134, 3.622652, 1, 1, 1, 1, 1,
1.919673, -0.4408392, 2.846042, 1, 1, 1, 1, 1,
1.953076, -0.031337, 2.338462, 1, 1, 1, 1, 1,
1.954132, -0.1962593, 2.705684, 1, 1, 1, 1, 1,
1.955269, -0.3559867, 2.570192, 1, 1, 1, 1, 1,
1.957124, -1.33066, 1.73585, 1, 1, 1, 1, 1,
1.965356, -0.7749935, 0.5845329, 1, 1, 1, 1, 1,
1.969039, 0.6586416, 1.835805, 1, 1, 1, 1, 1,
2.01256, -0.493665, 0.8544955, 1, 1, 1, 1, 1,
2.030028, -2.05073, 1.385686, 1, 1, 1, 1, 1,
2.06397, -0.124141, 0.7982722, 0, 0, 1, 1, 1,
2.065362, -0.6436335, 2.514354, 1, 0, 0, 1, 1,
2.071838, -0.1653504, 1.381042, 1, 0, 0, 1, 1,
2.096531, 1.230906, 1.571967, 1, 0, 0, 1, 1,
2.104798, 1.544943, -1.118321, 1, 0, 0, 1, 1,
2.173155, 0.1039147, 2.745586, 1, 0, 0, 1, 1,
2.177802, -2.105827, 0.4998475, 0, 0, 0, 1, 1,
2.212315, 0.8968005, 3.262157, 0, 0, 0, 1, 1,
2.300395, 0.1609885, 1.62165, 0, 0, 0, 1, 1,
2.304408, -0.4416882, 1.078478, 0, 0, 0, 1, 1,
2.364126, 0.1736667, 0.2980909, 0, 0, 0, 1, 1,
2.393952, 1.383722, 0.4968771, 0, 0, 0, 1, 1,
2.437492, -1.07677, 2.820918, 0, 0, 0, 1, 1,
2.498328, -0.5648535, 2.165898, 1, 1, 1, 1, 1,
2.498994, 0.5941466, 0.418794, 1, 1, 1, 1, 1,
2.620297, -2.005141, 4.755254, 1, 1, 1, 1, 1,
2.623996, 0.1584577, 1.27712, 1, 1, 1, 1, 1,
3.064411, -0.948293, 0.290379, 1, 1, 1, 1, 1,
3.230356, 1.5525, 0.941898, 1, 1, 1, 1, 1,
3.712279, -0.5537285, 1.67886, 1, 1, 1, 1, 1
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
var radius = 9.625382;
var distance = 33.80875;
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
mvMatrix.translate( -0.1506755, 0.3317298, -0.2564313 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.80875);
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
