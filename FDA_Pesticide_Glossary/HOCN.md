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
-2.637076, 0.2673741, 0.5605387, 1, 0, 0, 1,
-2.402365, -1.708135, -2.540876, 1, 0.007843138, 0, 1,
-2.388703, -0.2695642, -1.325548, 1, 0.01176471, 0, 1,
-2.350597, -0.8968252, -0.3449663, 1, 0.01960784, 0, 1,
-2.340113, -0.3752856, -2.987965, 1, 0.02352941, 0, 1,
-2.313665, -0.7297967, -1.638931, 1, 0.03137255, 0, 1,
-2.292341, -1.418492, -2.946275, 1, 0.03529412, 0, 1,
-2.190182, -1.460232, -2.492739, 1, 0.04313726, 0, 1,
-2.158884, 0.8079515, -0.1391682, 1, 0.04705882, 0, 1,
-2.146925, 1.076677, -1.986485, 1, 0.05490196, 0, 1,
-2.141227, 0.1839421, 0.4282494, 1, 0.05882353, 0, 1,
-2.11242, 0.432548, -0.765807, 1, 0.06666667, 0, 1,
-2.079987, -0.2312357, -0.8644806, 1, 0.07058824, 0, 1,
-2.078188, 0.1543742, -3.488686, 1, 0.07843138, 0, 1,
-2.074991, -1.698513, -2.754421, 1, 0.08235294, 0, 1,
-2.066562, 0.1917377, -1.522355, 1, 0.09019608, 0, 1,
-2.011741, -0.68941, -0.3230008, 1, 0.09411765, 0, 1,
-1.998793, -0.2324618, -2.098893, 1, 0.1019608, 0, 1,
-1.960124, -0.8729076, -1.929009, 1, 0.1098039, 0, 1,
-1.945657, -0.7272726, 0.4268113, 1, 0.1137255, 0, 1,
-1.89731, 0.6624145, -1.088181, 1, 0.1215686, 0, 1,
-1.896406, 0.3760933, -1.922578, 1, 0.1254902, 0, 1,
-1.881995, 0.8708932, -1.168821, 1, 0.1333333, 0, 1,
-1.874831, 0.09401156, -0.3862126, 1, 0.1372549, 0, 1,
-1.856202, 0.8731359, -1.291421, 1, 0.145098, 0, 1,
-1.855599, 0.4124011, -1.20754, 1, 0.1490196, 0, 1,
-1.825497, -0.2788183, -0.73963, 1, 0.1568628, 0, 1,
-1.817857, -0.7407631, -0.391526, 1, 0.1607843, 0, 1,
-1.807703, 0.6532579, -0.07554035, 1, 0.1686275, 0, 1,
-1.791533, -0.4750681, -1.264544, 1, 0.172549, 0, 1,
-1.785794, 0.6303988, -1.625148, 1, 0.1803922, 0, 1,
-1.781829, -0.1325393, -2.415361, 1, 0.1843137, 0, 1,
-1.774598, 0.9817961, -0.6913757, 1, 0.1921569, 0, 1,
-1.771789, 0.4516468, -1.800653, 1, 0.1960784, 0, 1,
-1.765915, -1.07546, -1.920636, 1, 0.2039216, 0, 1,
-1.756454, -0.8465505, -1.08636, 1, 0.2117647, 0, 1,
-1.754056, 1.526451, -1.044564, 1, 0.2156863, 0, 1,
-1.748722, 1.219911, -2.619251, 1, 0.2235294, 0, 1,
-1.698771, -0.1396075, -1.870022, 1, 0.227451, 0, 1,
-1.692927, -0.5447311, -0.1093684, 1, 0.2352941, 0, 1,
-1.689165, 0.5852933, -1.996909, 1, 0.2392157, 0, 1,
-1.687422, -0.3068314, -2.633931, 1, 0.2470588, 0, 1,
-1.676449, 0.7302919, 0.1239352, 1, 0.2509804, 0, 1,
-1.660917, 1.224888, -1.986044, 1, 0.2588235, 0, 1,
-1.657361, -1.732675, -2.881231, 1, 0.2627451, 0, 1,
-1.634887, 0.3478593, -1.243411, 1, 0.2705882, 0, 1,
-1.629463, 2.121227, 0.05046439, 1, 0.2745098, 0, 1,
-1.618204, -0.2511662, -1.56485, 1, 0.282353, 0, 1,
-1.614715, 0.3210494, -1.304892, 1, 0.2862745, 0, 1,
-1.614358, -0.7093919, 0.1504829, 1, 0.2941177, 0, 1,
-1.60767, 0.6280346, -2.550104, 1, 0.3019608, 0, 1,
-1.605489, -0.1449645, -3.318237, 1, 0.3058824, 0, 1,
-1.592824, 0.9086361, -1.485126, 1, 0.3137255, 0, 1,
-1.589837, -0.5895323, -0.8544465, 1, 0.3176471, 0, 1,
-1.585516, -0.2013767, -2.522673, 1, 0.3254902, 0, 1,
-1.583005, -0.164584, -1.09365, 1, 0.3294118, 0, 1,
-1.577245, -0.5214258, -2.398535, 1, 0.3372549, 0, 1,
-1.576026, 0.7638114, 0.6016082, 1, 0.3411765, 0, 1,
-1.575181, -1.227091, -1.930701, 1, 0.3490196, 0, 1,
-1.571863, 0.4795418, -0.7526873, 1, 0.3529412, 0, 1,
-1.568697, -0.2658624, -1.754196, 1, 0.3607843, 0, 1,
-1.538467, 2.628784, -0.9660451, 1, 0.3647059, 0, 1,
-1.531184, 0.3725292, -3.080513, 1, 0.372549, 0, 1,
-1.52979, 0.4320882, -0.5983205, 1, 0.3764706, 0, 1,
-1.525796, -0.7379181, -1.006371, 1, 0.3843137, 0, 1,
-1.511146, 0.03389646, -2.263895, 1, 0.3882353, 0, 1,
-1.503193, 0.5984287, -0.9372466, 1, 0.3960784, 0, 1,
-1.500851, -0.389878, -1.580401, 1, 0.4039216, 0, 1,
-1.499444, -0.3209479, -2.108196, 1, 0.4078431, 0, 1,
-1.498048, 1.692416, -1.614979, 1, 0.4156863, 0, 1,
-1.492346, -0.7876054, -3.114094, 1, 0.4196078, 0, 1,
-1.489009, -2.138621, -1.109296, 1, 0.427451, 0, 1,
-1.479135, -0.6021541, -1.004499, 1, 0.4313726, 0, 1,
-1.468754, 1.486156, -0.1327597, 1, 0.4392157, 0, 1,
-1.460428, 1.995512, -1.095113, 1, 0.4431373, 0, 1,
-1.458777, 1.458164, -1.799312, 1, 0.4509804, 0, 1,
-1.451611, -1.257409, -0.5255147, 1, 0.454902, 0, 1,
-1.451089, 0.4363696, 0.05171815, 1, 0.4627451, 0, 1,
-1.448982, 0.9000698, -1.692868, 1, 0.4666667, 0, 1,
-1.447627, 0.5015223, -2.587788, 1, 0.4745098, 0, 1,
-1.440252, -1.077288, -2.533791, 1, 0.4784314, 0, 1,
-1.43048, 2.514075, 0.5666082, 1, 0.4862745, 0, 1,
-1.423626, -0.598848, -2.333581, 1, 0.4901961, 0, 1,
-1.415186, -0.4512527, -1.289201, 1, 0.4980392, 0, 1,
-1.411795, 0.2869144, -0.6075973, 1, 0.5058824, 0, 1,
-1.41136, 0.1679958, -1.243301, 1, 0.509804, 0, 1,
-1.408898, -0.6523811, -1.840382, 1, 0.5176471, 0, 1,
-1.391713, -0.1268984, -2.575452, 1, 0.5215687, 0, 1,
-1.391365, 0.2905425, -3.569052, 1, 0.5294118, 0, 1,
-1.363526, 0.1422641, -1.582728, 1, 0.5333334, 0, 1,
-1.361194, -0.5999253, -3.332182, 1, 0.5411765, 0, 1,
-1.350081, 0.06311131, -3.055712, 1, 0.5450981, 0, 1,
-1.346973, -0.2358491, -2.775315, 1, 0.5529412, 0, 1,
-1.342328, -1.702812, -3.788058, 1, 0.5568628, 0, 1,
-1.337271, -1.988527, -1.955965, 1, 0.5647059, 0, 1,
-1.335989, -1.542729, -1.640029, 1, 0.5686275, 0, 1,
-1.331171, 0.1054599, -1.377778, 1, 0.5764706, 0, 1,
-1.328174, 0.2354258, -2.676505, 1, 0.5803922, 0, 1,
-1.327666, 0.002183289, -0.4466771, 1, 0.5882353, 0, 1,
-1.323585, -0.1646954, -0.616492, 1, 0.5921569, 0, 1,
-1.322269, -0.672815, -1.313799, 1, 0.6, 0, 1,
-1.315552, 0.8285526, 0.2416254, 1, 0.6078432, 0, 1,
-1.314771, -0.613034, -1.48104, 1, 0.6117647, 0, 1,
-1.308377, -1.190298, -0.4236417, 1, 0.6196079, 0, 1,
-1.290355, -0.6808112, -2.584678, 1, 0.6235294, 0, 1,
-1.283469, -1.596774, -3.290519, 1, 0.6313726, 0, 1,
-1.275081, -0.2415183, -1.309622, 1, 0.6352941, 0, 1,
-1.273934, 1.033798, -1.306508, 1, 0.6431373, 0, 1,
-1.272561, -1.384066, -3.22551, 1, 0.6470588, 0, 1,
-1.270776, -0.8216347, -1.793185, 1, 0.654902, 0, 1,
-1.258588, 0.7940695, -0.2746821, 1, 0.6588235, 0, 1,
-1.255265, -0.8899558, -1.053882, 1, 0.6666667, 0, 1,
-1.236202, 0.1748899, -1.080587, 1, 0.6705883, 0, 1,
-1.234847, -0.1679491, 0.3897677, 1, 0.6784314, 0, 1,
-1.21126, -1.998466, -2.959937, 1, 0.682353, 0, 1,
-1.206358, -0.02897217, -1.152555, 1, 0.6901961, 0, 1,
-1.205793, 0.5618812, -0.8105962, 1, 0.6941177, 0, 1,
-1.20555, -0.7067251, -2.516151, 1, 0.7019608, 0, 1,
-1.202998, -0.2233106, -1.114156, 1, 0.7098039, 0, 1,
-1.185471, 0.1029447, -0.8260342, 1, 0.7137255, 0, 1,
-1.184244, 1.356194, -0.2669822, 1, 0.7215686, 0, 1,
-1.181825, -1.028274, -0.08753441, 1, 0.7254902, 0, 1,
-1.177026, 0.9323136, -0.07305589, 1, 0.7333333, 0, 1,
-1.174694, 1.043009, -0.8390133, 1, 0.7372549, 0, 1,
-1.173464, 0.3282178, -0.6280891, 1, 0.7450981, 0, 1,
-1.166354, -1.384429, -2.794047, 1, 0.7490196, 0, 1,
-1.161289, -1.755345, -2.922341, 1, 0.7568628, 0, 1,
-1.161126, 1.370527, -1.711048, 1, 0.7607843, 0, 1,
-1.158781, -0.5327007, -2.354721, 1, 0.7686275, 0, 1,
-1.158376, 1.147776, 1.522976, 1, 0.772549, 0, 1,
-1.158328, 0.1399781, -2.266289, 1, 0.7803922, 0, 1,
-1.150223, -0.0734763, -3.21805, 1, 0.7843137, 0, 1,
-1.149703, 0.4375393, -1.543683, 1, 0.7921569, 0, 1,
-1.147864, -1.197912, -2.870335, 1, 0.7960784, 0, 1,
-1.141993, 1.242535, -1.108386, 1, 0.8039216, 0, 1,
-1.139056, -0.5294816, -0.5980527, 1, 0.8117647, 0, 1,
-1.132784, 0.8155476, -2.450252, 1, 0.8156863, 0, 1,
-1.131292, 1.308074, 0.5717629, 1, 0.8235294, 0, 1,
-1.130241, 2.325449, -0.1385563, 1, 0.827451, 0, 1,
-1.115222, -0.2331192, -2.759149, 1, 0.8352941, 0, 1,
-1.110652, 1.482966, -0.6915398, 1, 0.8392157, 0, 1,
-1.098023, 0.1524648, 1.160865, 1, 0.8470588, 0, 1,
-1.095301, 0.2786681, -0.9126191, 1, 0.8509804, 0, 1,
-1.090447, 0.2180766, -1.354648, 1, 0.8588235, 0, 1,
-1.08446, 0.6100067, -1.661512, 1, 0.8627451, 0, 1,
-1.079751, 0.705057, -1.856269, 1, 0.8705882, 0, 1,
-1.078457, 0.4997175, -3.224284, 1, 0.8745098, 0, 1,
-1.069694, 0.1016581, -1.941851, 1, 0.8823529, 0, 1,
-1.055344, 1.034792, 0.4470633, 1, 0.8862745, 0, 1,
-1.052443, -0.8564872, -2.208603, 1, 0.8941177, 0, 1,
-1.049336, 0.9366006, 0.2752842, 1, 0.8980392, 0, 1,
-1.042321, 0.115098, 0.515941, 1, 0.9058824, 0, 1,
-1.041201, 0.4282988, -2.436741, 1, 0.9137255, 0, 1,
-1.037436, -0.9732655, -1.502711, 1, 0.9176471, 0, 1,
-1.03253, 2.165182, -0.9341052, 1, 0.9254902, 0, 1,
-1.028939, -0.2520661, -0.669318, 1, 0.9294118, 0, 1,
-1.028829, 0.6109198, 0.09144186, 1, 0.9372549, 0, 1,
-1.024269, 1.451561, -0.6729119, 1, 0.9411765, 0, 1,
-1.019399, 1.678665, -0.08035915, 1, 0.9490196, 0, 1,
-1.016949, 0.3470329, -1.738732, 1, 0.9529412, 0, 1,
-1.015462, 0.9303999, -0.1405846, 1, 0.9607843, 0, 1,
-1.013587, -0.6594993, -2.783064, 1, 0.9647059, 0, 1,
-1.007194, -1.429399, -2.718581, 1, 0.972549, 0, 1,
-1.007096, -2.389055, -1.437914, 1, 0.9764706, 0, 1,
-1.000442, -0.8528256, -1.412136, 1, 0.9843137, 0, 1,
-1.000358, -0.6280929, -2.881509, 1, 0.9882353, 0, 1,
-0.9995204, -0.6047437, -1.465907, 1, 0.9960784, 0, 1,
-0.9924719, -0.4746495, -0.9646272, 0.9960784, 1, 0, 1,
-0.9878187, -0.01390904, -0.5180385, 0.9921569, 1, 0, 1,
-0.9863034, 0.6710693, 1.055009, 0.9843137, 1, 0, 1,
-0.9814381, 1.790082, -0.262997, 0.9803922, 1, 0, 1,
-0.9796003, 2.345361, -2.019578, 0.972549, 1, 0, 1,
-0.9624215, 0.862953, -0.1114252, 0.9686275, 1, 0, 1,
-0.9612992, 0.5186747, 0.9113381, 0.9607843, 1, 0, 1,
-0.9610105, 1.035644, -2.144604, 0.9568627, 1, 0, 1,
-0.9597661, 1.85731, -0.5461531, 0.9490196, 1, 0, 1,
-0.955659, 0.1681035, -1.737243, 0.945098, 1, 0, 1,
-0.9556412, 1.436311, -2.014302, 0.9372549, 1, 0, 1,
-0.951136, -0.6493078, -2.30052, 0.9333333, 1, 0, 1,
-0.9411716, -0.2108029, -3.889728, 0.9254902, 1, 0, 1,
-0.9269721, 0.7903901, 0.598046, 0.9215686, 1, 0, 1,
-0.9249802, -0.4248396, -3.544582, 0.9137255, 1, 0, 1,
-0.9248735, -0.3027859, -1.576463, 0.9098039, 1, 0, 1,
-0.9145274, 0.4798316, 0.04986359, 0.9019608, 1, 0, 1,
-0.8907949, -0.8080628, -2.990392, 0.8941177, 1, 0, 1,
-0.8878149, -0.5542637, -2.18707, 0.8901961, 1, 0, 1,
-0.8870748, -0.7737639, -2.137396, 0.8823529, 1, 0, 1,
-0.8865773, -0.04327301, -3.944035, 0.8784314, 1, 0, 1,
-0.8838567, 0.03962959, -3.29086, 0.8705882, 1, 0, 1,
-0.872997, 0.517541, -2.217594, 0.8666667, 1, 0, 1,
-0.8711939, -0.8234646, -1.371506, 0.8588235, 1, 0, 1,
-0.8686825, -0.8860648, -1.449833, 0.854902, 1, 0, 1,
-0.8684849, -0.917131, -0.03346888, 0.8470588, 1, 0, 1,
-0.8645588, 0.4041528, -0.8952901, 0.8431373, 1, 0, 1,
-0.8630274, -1.01942, -2.594411, 0.8352941, 1, 0, 1,
-0.8614329, -1.445353, -1.944246, 0.8313726, 1, 0, 1,
-0.8603605, 1.03059, 0.9957507, 0.8235294, 1, 0, 1,
-0.8602428, -0.5634856, -2.933467, 0.8196079, 1, 0, 1,
-0.8524423, 0.831065, -2.378671, 0.8117647, 1, 0, 1,
-0.8523052, 0.5210596, -0.7574325, 0.8078431, 1, 0, 1,
-0.852176, -0.2977182, -3.882839, 0.8, 1, 0, 1,
-0.8468009, -0.8895546, -1.948129, 0.7921569, 1, 0, 1,
-0.8467588, -0.3417962, -1.005124, 0.7882353, 1, 0, 1,
-0.8453045, 1.507903, -0.9521425, 0.7803922, 1, 0, 1,
-0.8406086, -1.865035, -1.834385, 0.7764706, 1, 0, 1,
-0.8405887, -0.2252364, -1.853519, 0.7686275, 1, 0, 1,
-0.8380054, 1.110066, 0.8618262, 0.7647059, 1, 0, 1,
-0.8377366, 1.191759, -0.07817716, 0.7568628, 1, 0, 1,
-0.8351551, 0.9698836, 0.04926889, 0.7529412, 1, 0, 1,
-0.834923, -0.475017, -1.364967, 0.7450981, 1, 0, 1,
-0.8332777, -0.5253348, -0.2575672, 0.7411765, 1, 0, 1,
-0.8321593, -0.839599, -2.335854, 0.7333333, 1, 0, 1,
-0.829717, 0.09197646, -1.214542, 0.7294118, 1, 0, 1,
-0.8274089, -0.1065096, -1.242413, 0.7215686, 1, 0, 1,
-0.8270085, 0.900242, -1.268216, 0.7176471, 1, 0, 1,
-0.8151602, -0.9508501, -3.157913, 0.7098039, 1, 0, 1,
-0.8099151, -0.5761905, -3.618599, 0.7058824, 1, 0, 1,
-0.8074704, -1.129247, -3.559118, 0.6980392, 1, 0, 1,
-0.80375, 0.4591216, -0.2278391, 0.6901961, 1, 0, 1,
-0.7943321, 0.2400823, -3.00719, 0.6862745, 1, 0, 1,
-0.7884846, -0.4770637, -2.223374, 0.6784314, 1, 0, 1,
-0.7871827, -0.8013834, -2.786481, 0.6745098, 1, 0, 1,
-0.7837466, 0.8729636, -1.00415, 0.6666667, 1, 0, 1,
-0.7779825, 1.040337, 0.976807, 0.6627451, 1, 0, 1,
-0.7775602, 0.1778601, -2.176363, 0.654902, 1, 0, 1,
-0.7721788, 0.6317781, -0.7875227, 0.6509804, 1, 0, 1,
-0.762521, -0.1355866, -0.03134966, 0.6431373, 1, 0, 1,
-0.7598056, -0.6877094, -2.59005, 0.6392157, 1, 0, 1,
-0.7580183, 0.5980701, -1.354491, 0.6313726, 1, 0, 1,
-0.7549669, 1.512466, -2.100474, 0.627451, 1, 0, 1,
-0.7450699, -2.02265, -4.851623, 0.6196079, 1, 0, 1,
-0.7440777, -2.442224, -4.018147, 0.6156863, 1, 0, 1,
-0.7440153, -0.4777479, -2.732001, 0.6078432, 1, 0, 1,
-0.7435136, 0.7448701, 0.9717327, 0.6039216, 1, 0, 1,
-0.7392664, -0.07239881, -2.228271, 0.5960785, 1, 0, 1,
-0.7366061, 0.03395011, -2.534704, 0.5882353, 1, 0, 1,
-0.735875, 0.03754859, -1.129935, 0.5843138, 1, 0, 1,
-0.730319, -0.7978742, -1.467072, 0.5764706, 1, 0, 1,
-0.7197595, -0.3201602, -2.439048, 0.572549, 1, 0, 1,
-0.7137716, 0.5466141, -1.394331, 0.5647059, 1, 0, 1,
-0.713493, 2.153184, -0.7163521, 0.5607843, 1, 0, 1,
-0.7130044, 0.02471848, -0.4303397, 0.5529412, 1, 0, 1,
-0.7083779, 0.2871334, -0.4526256, 0.5490196, 1, 0, 1,
-0.7076958, -0.06934968, -1.709842, 0.5411765, 1, 0, 1,
-0.7037453, 0.9082707, -2.599457, 0.5372549, 1, 0, 1,
-0.7019796, 1.559611, -0.288963, 0.5294118, 1, 0, 1,
-0.6999318, 0.6605629, -2.020429, 0.5254902, 1, 0, 1,
-0.6991897, -0.1619649, -3.465648, 0.5176471, 1, 0, 1,
-0.6956598, 0.7331993, -2.892413, 0.5137255, 1, 0, 1,
-0.6948311, -1.090673, -2.989689, 0.5058824, 1, 0, 1,
-0.6939051, -1.339341, -3.972992, 0.5019608, 1, 0, 1,
-0.6891171, -0.967998, -3.059666, 0.4941176, 1, 0, 1,
-0.6862199, -0.946263, -3.478233, 0.4862745, 1, 0, 1,
-0.6836762, -0.7980087, -0.3886003, 0.4823529, 1, 0, 1,
-0.6814167, -0.5557724, -1.243321, 0.4745098, 1, 0, 1,
-0.6807142, -1.184725, -2.744544, 0.4705882, 1, 0, 1,
-0.6796556, 0.6449171, -0.4904973, 0.4627451, 1, 0, 1,
-0.6776409, 0.03341766, -0.2573687, 0.4588235, 1, 0, 1,
-0.6768349, -0.2267342, -2.357262, 0.4509804, 1, 0, 1,
-0.668179, -0.1672971, -2.272174, 0.4470588, 1, 0, 1,
-0.6620054, -0.004054576, -1.863696, 0.4392157, 1, 0, 1,
-0.6587479, 1.103477, -2.221364, 0.4352941, 1, 0, 1,
-0.6564151, -0.7768313, -2.615059, 0.427451, 1, 0, 1,
-0.655732, 0.3218943, -2.581399, 0.4235294, 1, 0, 1,
-0.6541986, -1.313782, -1.424209, 0.4156863, 1, 0, 1,
-0.6514022, 1.016642, -0.2060411, 0.4117647, 1, 0, 1,
-0.6510943, 1.410116, 1.579303, 0.4039216, 1, 0, 1,
-0.6477189, -1.031272, -2.90349, 0.3960784, 1, 0, 1,
-0.646807, 0.7847897, -1.938946, 0.3921569, 1, 0, 1,
-0.6440704, -1.696138, -2.042867, 0.3843137, 1, 0, 1,
-0.6440563, 0.3226432, -3.500512, 0.3803922, 1, 0, 1,
-0.6422594, -2.797727, -1.895681, 0.372549, 1, 0, 1,
-0.6375194, 0.6006916, 0.3069276, 0.3686275, 1, 0, 1,
-0.6357646, -0.6286737, -2.564466, 0.3607843, 1, 0, 1,
-0.6297888, 1.293124, -0.1922743, 0.3568628, 1, 0, 1,
-0.6279286, -0.6922715, -1.801556, 0.3490196, 1, 0, 1,
-0.615392, -1.097923, -1.651735, 0.345098, 1, 0, 1,
-0.614781, 0.987187, 0.06114695, 0.3372549, 1, 0, 1,
-0.6113309, 0.3677971, -0.1239212, 0.3333333, 1, 0, 1,
-0.6068935, 0.2728743, -0.1981243, 0.3254902, 1, 0, 1,
-0.606823, 1.816396, -0.2355714, 0.3215686, 1, 0, 1,
-0.605617, -2.20946, -4.181041, 0.3137255, 1, 0, 1,
-0.6039028, -0.0497558, -2.921277, 0.3098039, 1, 0, 1,
-0.6009269, -0.02054189, -1.112165, 0.3019608, 1, 0, 1,
-0.5967349, 1.273359, -1.830701, 0.2941177, 1, 0, 1,
-0.5950474, -1.091116, -2.457964, 0.2901961, 1, 0, 1,
-0.5879706, -1.412841, -3.34546, 0.282353, 1, 0, 1,
-0.5859154, 0.5440863, -1.90241, 0.2784314, 1, 0, 1,
-0.5852682, 0.6879515, -0.2264959, 0.2705882, 1, 0, 1,
-0.5848219, 0.1744688, -2.324908, 0.2666667, 1, 0, 1,
-0.5824881, -1.073516, -3.670871, 0.2588235, 1, 0, 1,
-0.5807955, 0.4799609, -1.02792, 0.254902, 1, 0, 1,
-0.5692191, -1.819392, -3.608973, 0.2470588, 1, 0, 1,
-0.5690844, 2.12891, -1.553524, 0.2431373, 1, 0, 1,
-0.5658916, -1.05153, -2.821467, 0.2352941, 1, 0, 1,
-0.5637954, 0.6868227, -1.925374, 0.2313726, 1, 0, 1,
-0.5631052, -1.853429, -2.770995, 0.2235294, 1, 0, 1,
-0.5581585, -0.6498776, -3.085155, 0.2196078, 1, 0, 1,
-0.5568475, 0.07450535, -0.7293714, 0.2117647, 1, 0, 1,
-0.5517897, 0.8001305, 0.4882156, 0.2078431, 1, 0, 1,
-0.5505987, 1.231117, 0.5473409, 0.2, 1, 0, 1,
-0.5504611, 0.9563982, -0.3884724, 0.1921569, 1, 0, 1,
-0.5427088, 0.4964987, -1.128556, 0.1882353, 1, 0, 1,
-0.542393, 0.4865144, 0.1079714, 0.1803922, 1, 0, 1,
-0.5378408, -0.3168592, -1.725651, 0.1764706, 1, 0, 1,
-0.531046, -0.2773661, -2.528997, 0.1686275, 1, 0, 1,
-0.5211354, -0.125641, -1.778441, 0.1647059, 1, 0, 1,
-0.5143576, -0.2770787, -3.821975, 0.1568628, 1, 0, 1,
-0.5128472, 0.3512901, -2.063519, 0.1529412, 1, 0, 1,
-0.506194, -1.139745, -1.930997, 0.145098, 1, 0, 1,
-0.5012593, 1.017715, -0.6389149, 0.1411765, 1, 0, 1,
-0.5002888, -0.09831714, -0.6702194, 0.1333333, 1, 0, 1,
-0.5002441, 0.08500419, -0.3638508, 0.1294118, 1, 0, 1,
-0.4985526, 0.1454092, -1.238452, 0.1215686, 1, 0, 1,
-0.4957969, -0.5962989, -3.961289, 0.1176471, 1, 0, 1,
-0.4927816, -0.195729, -3.020735, 0.1098039, 1, 0, 1,
-0.4899473, -0.1644668, -2.58988, 0.1058824, 1, 0, 1,
-0.4856292, -0.4829086, -2.079307, 0.09803922, 1, 0, 1,
-0.4787302, -1.231864, -3.848867, 0.09019608, 1, 0, 1,
-0.4769902, -0.4677268, -1.955056, 0.08627451, 1, 0, 1,
-0.4677975, 0.9684258, -1.32336, 0.07843138, 1, 0, 1,
-0.4665816, -0.7137855, -2.632685, 0.07450981, 1, 0, 1,
-0.4662099, -0.8796396, -2.6053, 0.06666667, 1, 0, 1,
-0.4630888, 0.5919764, -1.536972, 0.0627451, 1, 0, 1,
-0.4579864, 1.204464, 1.320214, 0.05490196, 1, 0, 1,
-0.4552104, 0.02489908, -2.138979, 0.05098039, 1, 0, 1,
-0.4537567, 0.02930776, -1.42633, 0.04313726, 1, 0, 1,
-0.4534342, 0.9083937, -1.648652, 0.03921569, 1, 0, 1,
-0.4459131, -0.07996002, -1.34483, 0.03137255, 1, 0, 1,
-0.4447179, 0.5022972, -1.617424, 0.02745098, 1, 0, 1,
-0.4413647, -1.685043, -2.832306, 0.01960784, 1, 0, 1,
-0.4326595, -0.4612162, -2.929159, 0.01568628, 1, 0, 1,
-0.4261414, 0.2162435, -1.598974, 0.007843138, 1, 0, 1,
-0.4244171, -1.430941, -2.345472, 0.003921569, 1, 0, 1,
-0.4243549, 0.8708598, -0.01407128, 0, 1, 0.003921569, 1,
-0.4202932, -0.5053044, -1.873869, 0, 1, 0.01176471, 1,
-0.4120579, 0.006852112, -1.261715, 0, 1, 0.01568628, 1,
-0.4101607, -0.3475073, -1.168532, 0, 1, 0.02352941, 1,
-0.3984744, 0.3348822, -1.02813, 0, 1, 0.02745098, 1,
-0.393526, -0.5806708, -0.01279617, 0, 1, 0.03529412, 1,
-0.3909941, 0.636427, -0.7397997, 0, 1, 0.03921569, 1,
-0.3891749, 0.4657767, -0.9916489, 0, 1, 0.04705882, 1,
-0.3870854, -0.693345, -3.524328, 0, 1, 0.05098039, 1,
-0.3856618, 0.04193506, -0.9476314, 0, 1, 0.05882353, 1,
-0.3852782, -1.815118, -2.995043, 0, 1, 0.0627451, 1,
-0.3778932, 2.214586, -0.8863855, 0, 1, 0.07058824, 1,
-0.377447, -1.276081, -0.7427533, 0, 1, 0.07450981, 1,
-0.376579, 1.84645, -0.3515361, 0, 1, 0.08235294, 1,
-0.3764032, 0.8090888, -0.421881, 0, 1, 0.08627451, 1,
-0.376064, -0.6885377, -2.865453, 0, 1, 0.09411765, 1,
-0.373879, 0.1901491, -1.861803, 0, 1, 0.1019608, 1,
-0.3708399, 0.6522255, 0.1839432, 0, 1, 0.1058824, 1,
-0.3697677, -0.3751998, -2.662887, 0, 1, 0.1137255, 1,
-0.3682753, 1.148478, -1.168077, 0, 1, 0.1176471, 1,
-0.3644779, 2.474313, 0.3859179, 0, 1, 0.1254902, 1,
-0.3596869, -0.2286403, -2.818692, 0, 1, 0.1294118, 1,
-0.3589109, 0.3779392, -2.885989, 0, 1, 0.1372549, 1,
-0.3547471, -1.234769, -4.399384, 0, 1, 0.1411765, 1,
-0.3524671, -1.729919, -3.986295, 0, 1, 0.1490196, 1,
-0.3450903, 1.043997, -0.1184051, 0, 1, 0.1529412, 1,
-0.3443445, -0.4327736, -1.980239, 0, 1, 0.1607843, 1,
-0.3435431, -1.383346, -3.34096, 0, 1, 0.1647059, 1,
-0.3344398, -1.376844, -2.213151, 0, 1, 0.172549, 1,
-0.3334544, -0.7695928, -2.73912, 0, 1, 0.1764706, 1,
-0.331537, 0.006823597, -2.900263, 0, 1, 0.1843137, 1,
-0.3305762, -1.098159, -2.652062, 0, 1, 0.1882353, 1,
-0.3268463, 0.1123098, -2.206349, 0, 1, 0.1960784, 1,
-0.319747, -0.2256887, -1.66671, 0, 1, 0.2039216, 1,
-0.31971, -0.7160699, -2.800329, 0, 1, 0.2078431, 1,
-0.3183357, -0.6984364, -0.9822884, 0, 1, 0.2156863, 1,
-0.3182377, -0.2957199, -2.330652, 0, 1, 0.2196078, 1,
-0.3139678, 0.09264866, -3.376045, 0, 1, 0.227451, 1,
-0.3130873, 0.1583649, 0.9180413, 0, 1, 0.2313726, 1,
-0.3123538, 1.596929, -0.2812486, 0, 1, 0.2392157, 1,
-0.3102266, -1.488548, -2.270862, 0, 1, 0.2431373, 1,
-0.3081044, -0.2627038, -2.801345, 0, 1, 0.2509804, 1,
-0.3076825, -1.591855, -2.654427, 0, 1, 0.254902, 1,
-0.3028274, -0.351692, -3.7265, 0, 1, 0.2627451, 1,
-0.2998908, 0.6178853, -1.173189, 0, 1, 0.2666667, 1,
-0.2971383, 1.647515, -1.966073, 0, 1, 0.2745098, 1,
-0.2963497, -0.5158713, -1.928773, 0, 1, 0.2784314, 1,
-0.2928776, 1.119967, 0.9224694, 0, 1, 0.2862745, 1,
-0.2892126, -1.521597, -3.489416, 0, 1, 0.2901961, 1,
-0.288379, 0.4353737, 1.601396, 0, 1, 0.2980392, 1,
-0.2862307, -0.7671078, -2.955775, 0, 1, 0.3058824, 1,
-0.2769136, 0.7494391, -0.7916597, 0, 1, 0.3098039, 1,
-0.2723755, -1.121031, -4.418493, 0, 1, 0.3176471, 1,
-0.2723229, -2.384577, -3.274529, 0, 1, 0.3215686, 1,
-0.2678478, -1.881424, -1.639681, 0, 1, 0.3294118, 1,
-0.2624855, -2.427809, -2.090812, 0, 1, 0.3333333, 1,
-0.2624122, 2.012896, -0.1815272, 0, 1, 0.3411765, 1,
-0.2589414, -2.414447, -3.908777, 0, 1, 0.345098, 1,
-0.2587542, 1.360247, 0.3553634, 0, 1, 0.3529412, 1,
-0.2571716, -0.9088968, -2.106632, 0, 1, 0.3568628, 1,
-0.2555445, 0.623652, 2.13769, 0, 1, 0.3647059, 1,
-0.2549282, -1.041191, -2.989536, 0, 1, 0.3686275, 1,
-0.2543067, -0.6822072, -2.454777, 0, 1, 0.3764706, 1,
-0.2541381, 0.1844353, -2.831749, 0, 1, 0.3803922, 1,
-0.2526852, -1.153556, -2.491302, 0, 1, 0.3882353, 1,
-0.2522761, -0.02218, -1.689333, 0, 1, 0.3921569, 1,
-0.2503531, -0.146081, -1.813093, 0, 1, 0.4, 1,
-0.2457738, 0.828193, -1.759242, 0, 1, 0.4078431, 1,
-0.2365669, -0.8483179, -2.509921, 0, 1, 0.4117647, 1,
-0.2361522, -0.7907165, -2.576041, 0, 1, 0.4196078, 1,
-0.2350692, 0.3030255, -0.9949134, 0, 1, 0.4235294, 1,
-0.2336917, -1.185267, -5.413009, 0, 1, 0.4313726, 1,
-0.2315851, 0.9148799, -0.931871, 0, 1, 0.4352941, 1,
-0.2259729, 1.033365, -0.2644476, 0, 1, 0.4431373, 1,
-0.2204398, -0.5058658, -3.62132, 0, 1, 0.4470588, 1,
-0.2169673, -0.07267428, -1.077669, 0, 1, 0.454902, 1,
-0.2114854, -0.9519317, -2.934138, 0, 1, 0.4588235, 1,
-0.2081488, -0.7040963, -2.987009, 0, 1, 0.4666667, 1,
-0.2044275, -0.8181984, -2.649288, 0, 1, 0.4705882, 1,
-0.2034893, 0.6021956, -0.3998928, 0, 1, 0.4784314, 1,
-0.2029187, 0.1579978, -0.9562041, 0, 1, 0.4823529, 1,
-0.2020839, -0.8995568, -3.869296, 0, 1, 0.4901961, 1,
-0.1994706, -2.720689, -2.577562, 0, 1, 0.4941176, 1,
-0.196971, 0.5117916, -0.0659686, 0, 1, 0.5019608, 1,
-0.1894905, -1.048483, -3.578915, 0, 1, 0.509804, 1,
-0.188946, 0.4711968, -2.167688, 0, 1, 0.5137255, 1,
-0.1882604, -1.831898, -3.524249, 0, 1, 0.5215687, 1,
-0.1790936, 1.066401, 0.06096259, 0, 1, 0.5254902, 1,
-0.178509, 0.2910425, -0.9684674, 0, 1, 0.5333334, 1,
-0.1777616, 0.9961854, 0.9490045, 0, 1, 0.5372549, 1,
-0.1692439, 0.8376064, 1.322932, 0, 1, 0.5450981, 1,
-0.1668791, 0.4466552, -0.2529391, 0, 1, 0.5490196, 1,
-0.1647519, 0.4981913, 0.5328491, 0, 1, 0.5568628, 1,
-0.1603539, -0.2246599, -1.331629, 0, 1, 0.5607843, 1,
-0.1586885, 0.6550202, 0.9609593, 0, 1, 0.5686275, 1,
-0.1562934, -0.3939475, -2.214772, 0, 1, 0.572549, 1,
-0.1524707, 1.175822, 0.02076196, 0, 1, 0.5803922, 1,
-0.1499357, 0.09726944, -0.7345132, 0, 1, 0.5843138, 1,
-0.1493467, 0.245074, 0.6888824, 0, 1, 0.5921569, 1,
-0.1479307, 0.7777627, 0.7653309, 0, 1, 0.5960785, 1,
-0.1473991, -1.403755, -2.439799, 0, 1, 0.6039216, 1,
-0.1384279, -0.8002099, -3.338619, 0, 1, 0.6117647, 1,
-0.1377642, 1.228963, 0.2621273, 0, 1, 0.6156863, 1,
-0.1313036, 1.137612, 0.4659955, 0, 1, 0.6235294, 1,
-0.1305517, -3.256215, -2.364038, 0, 1, 0.627451, 1,
-0.1236019, 0.8190758, 1.196129, 0, 1, 0.6352941, 1,
-0.1207042, -0.8763564, -2.501053, 0, 1, 0.6392157, 1,
-0.1195101, -0.4826619, -4.430742, 0, 1, 0.6470588, 1,
-0.1193111, 1.044646, -1.175724, 0, 1, 0.6509804, 1,
-0.115553, -0.4941905, -3.589321, 0, 1, 0.6588235, 1,
-0.1044435, -0.3097111, -2.734996, 0, 1, 0.6627451, 1,
-0.1021109, -0.4300724, -4.098348, 0, 1, 0.6705883, 1,
-0.1007339, -0.5107062, -3.647764, 0, 1, 0.6745098, 1,
-0.09524465, -0.01974144, -1.542561, 0, 1, 0.682353, 1,
-0.09339337, 0.3352761, 0.3008601, 0, 1, 0.6862745, 1,
-0.08988775, 0.9916629, -0.5184425, 0, 1, 0.6941177, 1,
-0.08859792, 0.4456606, 0.9819484, 0, 1, 0.7019608, 1,
-0.08608959, -1.566907, -4.163262, 0, 1, 0.7058824, 1,
-0.08511548, 0.511394, -0.2282341, 0, 1, 0.7137255, 1,
-0.08353689, -0.3997139, -4.278974, 0, 1, 0.7176471, 1,
-0.07720054, 0.9392939, 0.1571441, 0, 1, 0.7254902, 1,
-0.07508025, -0.4877755, -4.351062, 0, 1, 0.7294118, 1,
-0.07479745, 0.8255029, -0.0591599, 0, 1, 0.7372549, 1,
-0.07316049, 0.06324882, -1.529215, 0, 1, 0.7411765, 1,
-0.07237671, -0.5252807, -2.56051, 0, 1, 0.7490196, 1,
-0.07091143, -0.1424558, -3.830796, 0, 1, 0.7529412, 1,
-0.06927278, 0.4153476, 1.264413, 0, 1, 0.7607843, 1,
-0.06621694, -1.570237, -2.359535, 0, 1, 0.7647059, 1,
-0.06594408, -0.0977119, -1.33048, 0, 1, 0.772549, 1,
-0.06584379, -0.6500897, -2.951451, 0, 1, 0.7764706, 1,
-0.06550951, -0.7617111, -4.083905, 0, 1, 0.7843137, 1,
-0.06524677, -1.158424, -2.32264, 0, 1, 0.7882353, 1,
-0.06315313, -0.1322991, -2.694984, 0, 1, 0.7960784, 1,
-0.06070492, 1.550244, -0.02299183, 0, 1, 0.8039216, 1,
-0.06024102, 0.1329957, -2.037807, 0, 1, 0.8078431, 1,
-0.0598627, -0.187733, -4.399111, 0, 1, 0.8156863, 1,
-0.05406413, -0.07870501, -2.293083, 0, 1, 0.8196079, 1,
-0.05312584, -0.2453464, -4.790092, 0, 1, 0.827451, 1,
-0.05173271, -0.946078, -2.323813, 0, 1, 0.8313726, 1,
-0.04532394, -0.6753101, -2.257111, 0, 1, 0.8392157, 1,
-0.04392883, 0.6518865, 0.1998835, 0, 1, 0.8431373, 1,
-0.0432939, -0.1448468, -2.900592, 0, 1, 0.8509804, 1,
-0.04162233, 1.136794, 1.066728, 0, 1, 0.854902, 1,
-0.03714374, -0.4955879, -3.662353, 0, 1, 0.8627451, 1,
-0.03659062, -1.736623, -5.638912, 0, 1, 0.8666667, 1,
-0.03512, 0.4933494, 0.4928253, 0, 1, 0.8745098, 1,
-0.03131866, -0.5047317, -1.963345, 0, 1, 0.8784314, 1,
-0.03120674, 0.345078, -0.4343641, 0, 1, 0.8862745, 1,
-0.03029032, 0.3531154, -0.4022441, 0, 1, 0.8901961, 1,
-0.0246126, 1.819261, -0.3480466, 0, 1, 0.8980392, 1,
-0.02255064, -0.9965499, -1.667007, 0, 1, 0.9058824, 1,
-0.0190073, 0.550091, 0.9912276, 0, 1, 0.9098039, 1,
-0.01318559, -1.20602, -4.195583, 0, 1, 0.9176471, 1,
-0.01248075, -0.9588838, -4.632312, 0, 1, 0.9215686, 1,
-0.007918533, -1.602131, -3.175318, 0, 1, 0.9294118, 1,
-0.007386473, 0.1095835, -0.2067314, 0, 1, 0.9333333, 1,
-0.004892057, -0.4899669, -3.711187, 0, 1, 0.9411765, 1,
-0.003644843, -0.7433699, -2.71762, 0, 1, 0.945098, 1,
-0.001456705, 1.751485, -0.5019568, 0, 1, 0.9529412, 1,
-0.001398509, -0.505634, -2.683435, 0, 1, 0.9568627, 1,
-0.001059175, 1.412009, -1.206501, 0, 1, 0.9647059, 1,
0.0002336815, 0.09509225, 0.3639711, 0, 1, 0.9686275, 1,
0.0006146401, -0.06339902, 4.02738, 0, 1, 0.9764706, 1,
0.001556286, 0.01727257, -0.7124937, 0, 1, 0.9803922, 1,
0.002845482, 0.7589036, -1.387824, 0, 1, 0.9882353, 1,
0.006948677, 1.433758, 0.3497415, 0, 1, 0.9921569, 1,
0.007177531, 1.115352, -1.02993, 0, 1, 1, 1,
0.007600532, 0.1778688, -0.3251386, 0, 0.9921569, 1, 1,
0.009721089, -1.093683, 2.960491, 0, 0.9882353, 1, 1,
0.01088877, -0.2165804, 2.037436, 0, 0.9803922, 1, 1,
0.01169329, 1.034092, -0.2217466, 0, 0.9764706, 1, 1,
0.01457503, -0.7839897, 1.33553, 0, 0.9686275, 1, 1,
0.01490869, -0.07870679, 1.431713, 0, 0.9647059, 1, 1,
0.0242981, -0.7194902, 4.414046, 0, 0.9568627, 1, 1,
0.02492329, 0.4056139, -0.06711104, 0, 0.9529412, 1, 1,
0.02982194, -1.099419, 4.044593, 0, 0.945098, 1, 1,
0.03334333, 0.07744243, 1.240226, 0, 0.9411765, 1, 1,
0.03421434, -0.6112732, 2.364213, 0, 0.9333333, 1, 1,
0.03508846, -1.473755, 3.532326, 0, 0.9294118, 1, 1,
0.03716046, -0.7583802, 2.396818, 0, 0.9215686, 1, 1,
0.04070338, -0.06794462, 3.016127, 0, 0.9176471, 1, 1,
0.04080366, -1.034593, 2.936676, 0, 0.9098039, 1, 1,
0.04622699, 1.651296, 0.1912756, 0, 0.9058824, 1, 1,
0.05234764, -0.3134707, 3.643543, 0, 0.8980392, 1, 1,
0.05701354, -0.1080603, 1.878045, 0, 0.8901961, 1, 1,
0.05778388, -0.3315797, 2.577502, 0, 0.8862745, 1, 1,
0.0578828, 0.6879742, 1.00976, 0, 0.8784314, 1, 1,
0.06082611, -0.5586702, 3.163578, 0, 0.8745098, 1, 1,
0.06419749, 1.380418, 0.7611797, 0, 0.8666667, 1, 1,
0.06806969, 0.7675748, 0.5988839, 0, 0.8627451, 1, 1,
0.07016179, -2.172185, 3.240608, 0, 0.854902, 1, 1,
0.07772205, -0.8919535, 2.771906, 0, 0.8509804, 1, 1,
0.07883663, -1.16356, 2.291534, 0, 0.8431373, 1, 1,
0.0807668, -1.201122, 2.944772, 0, 0.8392157, 1, 1,
0.08151893, -0.3328114, 3.1767, 0, 0.8313726, 1, 1,
0.08277541, 0.7811629, -0.7091404, 0, 0.827451, 1, 1,
0.08507463, 0.002384463, 2.173405, 0, 0.8196079, 1, 1,
0.08733884, 1.191337, -1.227068, 0, 0.8156863, 1, 1,
0.0879738, 1.179792, -0.7855999, 0, 0.8078431, 1, 1,
0.09148812, -1.535185, 2.494372, 0, 0.8039216, 1, 1,
0.09205314, 1.049602, 1.13905, 0, 0.7960784, 1, 1,
0.09268945, 1.230098, 0.5738636, 0, 0.7882353, 1, 1,
0.09455736, -1.122381, 2.795274, 0, 0.7843137, 1, 1,
0.09577455, 0.02882709, 1.26605, 0, 0.7764706, 1, 1,
0.1004138, 0.453818, -0.0105103, 0, 0.772549, 1, 1,
0.1021437, 0.5580091, -1.393362, 0, 0.7647059, 1, 1,
0.1055591, 0.6307573, -1.935889, 0, 0.7607843, 1, 1,
0.1066199, 0.6765442, -0.4786941, 0, 0.7529412, 1, 1,
0.1089649, 0.6772276, -0.9705874, 0, 0.7490196, 1, 1,
0.1095979, -0.2913752, 4.66759, 0, 0.7411765, 1, 1,
0.1132476, 0.8042049, 0.3112612, 0, 0.7372549, 1, 1,
0.1140925, -0.7464552, 3.465084, 0, 0.7294118, 1, 1,
0.1172479, 1.048779, 1.640789, 0, 0.7254902, 1, 1,
0.1209225, -0.3667583, 2.528635, 0, 0.7176471, 1, 1,
0.1247784, -0.3989122, 4.289438, 0, 0.7137255, 1, 1,
0.1276663, -0.3633252, 3.661224, 0, 0.7058824, 1, 1,
0.1345981, 1.251676, -1.296065, 0, 0.6980392, 1, 1,
0.1373855, -1.030002, 3.398221, 0, 0.6941177, 1, 1,
0.1382192, 0.4762105, 0.1955078, 0, 0.6862745, 1, 1,
0.1386757, -1.827351, 4.630295, 0, 0.682353, 1, 1,
0.142787, -0.9419748, 3.640225, 0, 0.6745098, 1, 1,
0.1432158, -0.03911299, 2.89138, 0, 0.6705883, 1, 1,
0.1469519, 0.7651162, 0.233201, 0, 0.6627451, 1, 1,
0.1512716, 1.159566, -0.2852784, 0, 0.6588235, 1, 1,
0.1531102, 1.557045, 0.9100483, 0, 0.6509804, 1, 1,
0.1548225, -0.2767898, 2.976791, 0, 0.6470588, 1, 1,
0.1575858, -0.656337, 3.302727, 0, 0.6392157, 1, 1,
0.1626015, -0.2071113, 1.771809, 0, 0.6352941, 1, 1,
0.163428, -0.9361085, 4.578905, 0, 0.627451, 1, 1,
0.1642032, 1.26445, 0.9688253, 0, 0.6235294, 1, 1,
0.172152, -0.3418376, 1.499852, 0, 0.6156863, 1, 1,
0.1727092, 0.6959449, -0.9784505, 0, 0.6117647, 1, 1,
0.1746427, 1.142452, -0.1546337, 0, 0.6039216, 1, 1,
0.1750173, 0.8776222, 0.2225992, 0, 0.5960785, 1, 1,
0.1797206, 0.8601356, 0.4573283, 0, 0.5921569, 1, 1,
0.180822, -1.488276, 2.685287, 0, 0.5843138, 1, 1,
0.1812911, 0.3054046, -0.02047497, 0, 0.5803922, 1, 1,
0.1831174, -1.411072, 3.557799, 0, 0.572549, 1, 1,
0.1831793, 1.167038, 0.6727444, 0, 0.5686275, 1, 1,
0.1867492, -1.76839, 3.495114, 0, 0.5607843, 1, 1,
0.187909, -0.8954964, 3.529933, 0, 0.5568628, 1, 1,
0.1933003, 0.3905622, 0.2474604, 0, 0.5490196, 1, 1,
0.1936547, 0.2400461, -0.4950547, 0, 0.5450981, 1, 1,
0.1940497, -0.5100656, 2.158898, 0, 0.5372549, 1, 1,
0.1952299, -0.9217864, 4.410579, 0, 0.5333334, 1, 1,
0.1952483, 1.564621, 1.502755, 0, 0.5254902, 1, 1,
0.1955228, 0.4540192, -0.1894615, 0, 0.5215687, 1, 1,
0.1961763, 0.1746787, -0.6673076, 0, 0.5137255, 1, 1,
0.1970454, 0.04307094, 1.710756, 0, 0.509804, 1, 1,
0.1983434, 1.32522, 0.007232507, 0, 0.5019608, 1, 1,
0.2009212, 0.0538409, 0.7987916, 0, 0.4941176, 1, 1,
0.2072622, 0.1188511, 0.1583695, 0, 0.4901961, 1, 1,
0.2080651, -2.271497, 3.532215, 0, 0.4823529, 1, 1,
0.210077, -2.201543, 3.688006, 0, 0.4784314, 1, 1,
0.2106659, -0.3537483, 2.321558, 0, 0.4705882, 1, 1,
0.210909, -0.1427169, 3.371708, 0, 0.4666667, 1, 1,
0.2122667, 1.107014, -1.367268, 0, 0.4588235, 1, 1,
0.2139078, 1.230407, 1.717692, 0, 0.454902, 1, 1,
0.2192366, -0.6821312, 2.337708, 0, 0.4470588, 1, 1,
0.2197264, 0.1576301, 0.5862118, 0, 0.4431373, 1, 1,
0.2219635, 2.744005, -1.891675, 0, 0.4352941, 1, 1,
0.2298196, 1.694206, -0.1521885, 0, 0.4313726, 1, 1,
0.2314494, 0.7579829, -0.0518334, 0, 0.4235294, 1, 1,
0.2327297, 0.07654248, -0.2790287, 0, 0.4196078, 1, 1,
0.2350567, 1.400962, -1.387329, 0, 0.4117647, 1, 1,
0.2427596, 0.8971704, 1.744564, 0, 0.4078431, 1, 1,
0.2429186, 1.46077, 0.8874882, 0, 0.4, 1, 1,
0.2482628, -0.4516544, 1.980532, 0, 0.3921569, 1, 1,
0.2510345, -0.8879534, 0.6741657, 0, 0.3882353, 1, 1,
0.2510481, -1.100845, 2.319363, 0, 0.3803922, 1, 1,
0.2512273, 0.233245, 1.354838, 0, 0.3764706, 1, 1,
0.2512572, -0.05157962, 2.066211, 0, 0.3686275, 1, 1,
0.2598367, -1.651086, 3.804477, 0, 0.3647059, 1, 1,
0.2623591, 1.311011, 0.1839362, 0, 0.3568628, 1, 1,
0.2632379, -0.2948309, 3.344948, 0, 0.3529412, 1, 1,
0.2646866, 2.133289, 0.3504778, 0, 0.345098, 1, 1,
0.2657295, -0.6568878, 2.595614, 0, 0.3411765, 1, 1,
0.2674645, -1.595364, 3.039218, 0, 0.3333333, 1, 1,
0.2675661, -2.094888, 2.781915, 0, 0.3294118, 1, 1,
0.2680404, 0.2123156, 0.9593771, 0, 0.3215686, 1, 1,
0.2694586, -0.7937552, 2.015331, 0, 0.3176471, 1, 1,
0.2708683, 1.05872, 0.1193668, 0, 0.3098039, 1, 1,
0.2718195, 1.122555, -0.8166926, 0, 0.3058824, 1, 1,
0.2726274, 0.3190261, 0.9448509, 0, 0.2980392, 1, 1,
0.2727803, -0.5510266, 0.9624732, 0, 0.2901961, 1, 1,
0.2729229, -1.058117, 4.61024, 0, 0.2862745, 1, 1,
0.2752895, 0.2206249, 2.664618, 0, 0.2784314, 1, 1,
0.2754935, 0.3800455, 2.583114, 0, 0.2745098, 1, 1,
0.2758806, 0.9983356, 1.060354, 0, 0.2666667, 1, 1,
0.2784978, 0.7045068, -0.137738, 0, 0.2627451, 1, 1,
0.2809854, -0.6801068, 1.073831, 0, 0.254902, 1, 1,
0.2846598, -1.474328, 4.561344, 0, 0.2509804, 1, 1,
0.2850278, -1.025365, 2.775887, 0, 0.2431373, 1, 1,
0.2859864, -0.1150217, 1.556751, 0, 0.2392157, 1, 1,
0.2868673, 0.8842992, 1.659229, 0, 0.2313726, 1, 1,
0.2900307, -0.7146676, 2.872527, 0, 0.227451, 1, 1,
0.2909712, 1.220417, 1.486901, 0, 0.2196078, 1, 1,
0.2911468, 0.6633236, 2.151752, 0, 0.2156863, 1, 1,
0.2922151, 0.9037148, 2.450658, 0, 0.2078431, 1, 1,
0.2976821, -0.6729257, 1.150701, 0, 0.2039216, 1, 1,
0.2977357, 0.9978664, -0.4583039, 0, 0.1960784, 1, 1,
0.3062787, 0.3585138, -0.17899, 0, 0.1882353, 1, 1,
0.3088458, -1.162438, 1.305192, 0, 0.1843137, 1, 1,
0.3191108, -2.017136, 3.289082, 0, 0.1764706, 1, 1,
0.3194079, -0.4945315, 3.809759, 0, 0.172549, 1, 1,
0.3198131, -0.5388579, 1.37282, 0, 0.1647059, 1, 1,
0.3242539, 1.540952, 0.5156444, 0, 0.1607843, 1, 1,
0.32809, 0.6514211, -0.386487, 0, 0.1529412, 1, 1,
0.3293673, 0.5576451, -1.332824, 0, 0.1490196, 1, 1,
0.3298051, -0.1065112, 1.26639, 0, 0.1411765, 1, 1,
0.3307928, -0.9169602, 3.244067, 0, 0.1372549, 1, 1,
0.3342813, -0.4486195, 3.43658, 0, 0.1294118, 1, 1,
0.3350247, -1.782863, 3.977276, 0, 0.1254902, 1, 1,
0.3366329, 0.9551011, -0.8318589, 0, 0.1176471, 1, 1,
0.33854, -0.7446362, 3.859801, 0, 0.1137255, 1, 1,
0.3385639, -0.5951025, 2.202898, 0, 0.1058824, 1, 1,
0.3416027, -0.03916895, 3.551268, 0, 0.09803922, 1, 1,
0.3424883, -0.4302243, 3.737033, 0, 0.09411765, 1, 1,
0.3436224, -1.04768, 2.062756, 0, 0.08627451, 1, 1,
0.3446103, 0.7846272, 0.1534873, 0, 0.08235294, 1, 1,
0.34787, 2.158616, -0.7190366, 0, 0.07450981, 1, 1,
0.3512205, 0.6608382, 0.8283235, 0, 0.07058824, 1, 1,
0.3537937, -0.9514808, 2.945958, 0, 0.0627451, 1, 1,
0.3586279, 1.491388, 1.084874, 0, 0.05882353, 1, 1,
0.3634833, -1.078674, 4.42253, 0, 0.05098039, 1, 1,
0.3645064, 1.220767, 1.561947, 0, 0.04705882, 1, 1,
0.3686746, -0.8503975, 3.327348, 0, 0.03921569, 1, 1,
0.3695095, 0.2882587, 0.4607639, 0, 0.03529412, 1, 1,
0.3743483, -0.1980073, 2.236682, 0, 0.02745098, 1, 1,
0.3764289, 0.7860088, 0.1116785, 0, 0.02352941, 1, 1,
0.3782049, -1.364458, 2.661248, 0, 0.01568628, 1, 1,
0.3858496, 1.810811, -0.09347684, 0, 0.01176471, 1, 1,
0.3897015, 1.112473, 1.240984, 0, 0.003921569, 1, 1,
0.3924265, 1.508388, 0.3528673, 0.003921569, 0, 1, 1,
0.3933696, 1.018291, 1.159132, 0.007843138, 0, 1, 1,
0.3981048, 0.1314471, 0.06660748, 0.01568628, 0, 1, 1,
0.4013439, -0.6606942, 2.051023, 0.01960784, 0, 1, 1,
0.4032511, 0.01239199, 1.310628, 0.02745098, 0, 1, 1,
0.4067379, -0.5560683, 2.70839, 0.03137255, 0, 1, 1,
0.4076666, 0.9880165, 0.8296797, 0.03921569, 0, 1, 1,
0.4080279, -0.09340765, 2.097772, 0.04313726, 0, 1, 1,
0.4088854, -0.122924, 0.80068, 0.05098039, 0, 1, 1,
0.4119313, -0.3439118, 3.543527, 0.05490196, 0, 1, 1,
0.4147609, 1.629747, -0.2252079, 0.0627451, 0, 1, 1,
0.4188274, -0.2067185, 1.625368, 0.06666667, 0, 1, 1,
0.4281662, -0.8046496, 2.46333, 0.07450981, 0, 1, 1,
0.4335148, 0.6033422, -0.5909269, 0.07843138, 0, 1, 1,
0.438904, 1.228272, 0.5518163, 0.08627451, 0, 1, 1,
0.4433912, -0.2261567, 3.49191, 0.09019608, 0, 1, 1,
0.444085, -0.3057204, 1.418653, 0.09803922, 0, 1, 1,
0.4442314, -0.8390083, 3.764548, 0.1058824, 0, 1, 1,
0.4530796, -0.8586704, 3.498772, 0.1098039, 0, 1, 1,
0.4537078, 0.9157642, 0.6187958, 0.1176471, 0, 1, 1,
0.4539374, 1.069153, 0.1227864, 0.1215686, 0, 1, 1,
0.4543152, 0.5617967, -0.3243863, 0.1294118, 0, 1, 1,
0.4626193, -0.1391601, 1.806484, 0.1333333, 0, 1, 1,
0.4678479, 0.3607405, 0.6852216, 0.1411765, 0, 1, 1,
0.4687302, 0.9171796, 0.8659055, 0.145098, 0, 1, 1,
0.4705578, -0.2910106, 3.210858, 0.1529412, 0, 1, 1,
0.476338, 0.5597051, -0.2718267, 0.1568628, 0, 1, 1,
0.4789088, -0.9960425, 3.342318, 0.1647059, 0, 1, 1,
0.4809359, 0.9291432, -1.014932, 0.1686275, 0, 1, 1,
0.4825933, 0.01337709, 0.7416604, 0.1764706, 0, 1, 1,
0.4855671, 0.03325133, 0.04945484, 0.1803922, 0, 1, 1,
0.488418, -1.304533, 2.689049, 0.1882353, 0, 1, 1,
0.5014821, -0.7763715, 1.985, 0.1921569, 0, 1, 1,
0.5039611, -0.1579191, 2.795403, 0.2, 0, 1, 1,
0.5093892, -0.1154137, 3.469431, 0.2078431, 0, 1, 1,
0.5142905, -0.7706563, 3.912614, 0.2117647, 0, 1, 1,
0.5190819, 0.7298061, 0.5541884, 0.2196078, 0, 1, 1,
0.5225969, 0.224719, 1.489202, 0.2235294, 0, 1, 1,
0.5227495, 1.159278, 0.5252709, 0.2313726, 0, 1, 1,
0.5261008, -0.1700595, 1.219474, 0.2352941, 0, 1, 1,
0.5281972, -0.05205507, 1.598443, 0.2431373, 0, 1, 1,
0.5289782, -0.6007433, 2.197789, 0.2470588, 0, 1, 1,
0.5392579, -0.3587223, 3.168654, 0.254902, 0, 1, 1,
0.5395323, 0.9068435, -0.3201898, 0.2588235, 0, 1, 1,
0.5419252, -0.7963631, 2.183322, 0.2666667, 0, 1, 1,
0.5425097, 0.3249007, -0.1277066, 0.2705882, 0, 1, 1,
0.542703, -0.3452124, 1.016941, 0.2784314, 0, 1, 1,
0.5443523, 0.6603942, -0.4547614, 0.282353, 0, 1, 1,
0.5445102, -0.1779349, 3.008891, 0.2901961, 0, 1, 1,
0.5489281, 0.9409006, 1.332672, 0.2941177, 0, 1, 1,
0.5532937, 1.166194, 1.657509, 0.3019608, 0, 1, 1,
0.5533413, -0.1316119, 3.009622, 0.3098039, 0, 1, 1,
0.5570083, 0.3213698, 2.366777, 0.3137255, 0, 1, 1,
0.561496, -1.112118, 2.398113, 0.3215686, 0, 1, 1,
0.566282, 0.2930261, 1.331812, 0.3254902, 0, 1, 1,
0.5679777, 0.8399, -0.259786, 0.3333333, 0, 1, 1,
0.5781846, -1.173819, 2.073758, 0.3372549, 0, 1, 1,
0.5791853, 0.06739588, 0.01628705, 0.345098, 0, 1, 1,
0.5793291, -0.03831793, 1.179948, 0.3490196, 0, 1, 1,
0.5800522, -0.2632296, 2.694, 0.3568628, 0, 1, 1,
0.5817859, -0.5011289, 1.982866, 0.3607843, 0, 1, 1,
0.5828044, -0.2782301, 2.334872, 0.3686275, 0, 1, 1,
0.5849705, 0.6186355, -0.0378658, 0.372549, 0, 1, 1,
0.5855765, -0.1957252, -0.005507416, 0.3803922, 0, 1, 1,
0.5873021, -0.4165427, 2.304203, 0.3843137, 0, 1, 1,
0.5890319, -0.3339419, 3.267403, 0.3921569, 0, 1, 1,
0.5893404, 1.075573, -0.1073962, 0.3960784, 0, 1, 1,
0.5902165, 0.01371099, 1.202293, 0.4039216, 0, 1, 1,
0.5917408, 0.2687806, 0.2891619, 0.4117647, 0, 1, 1,
0.5970239, 0.1429999, 1.434138, 0.4156863, 0, 1, 1,
0.5981536, -0.9740007, 2.327299, 0.4235294, 0, 1, 1,
0.6076885, 0.7260871, 1.997052, 0.427451, 0, 1, 1,
0.6084991, 1.63001, 1.264705, 0.4352941, 0, 1, 1,
0.6214812, -1.016862, 1.711271, 0.4392157, 0, 1, 1,
0.6216676, -0.49647, 3.071347, 0.4470588, 0, 1, 1,
0.6234491, 1.353077, -0.2834477, 0.4509804, 0, 1, 1,
0.6266088, 0.6931587, 1.986918, 0.4588235, 0, 1, 1,
0.6286358, -1.432905, 3.157081, 0.4627451, 0, 1, 1,
0.6335126, -0.4551062, 2.098687, 0.4705882, 0, 1, 1,
0.6349486, 0.8385984, -0.5485119, 0.4745098, 0, 1, 1,
0.648231, 0.7778012, 1.434139, 0.4823529, 0, 1, 1,
0.648953, 0.4632047, -0.8637819, 0.4862745, 0, 1, 1,
0.6495181, 0.5988302, 2.319131, 0.4941176, 0, 1, 1,
0.6650173, 1.843996, 0.1587475, 0.5019608, 0, 1, 1,
0.666253, -0.971957, 0.08400473, 0.5058824, 0, 1, 1,
0.687147, 0.02931337, 3.16924, 0.5137255, 0, 1, 1,
0.6896619, -0.9889531, 3.519929, 0.5176471, 0, 1, 1,
0.6914687, -0.5336939, 1.149359, 0.5254902, 0, 1, 1,
0.6965781, 0.3304967, 1.611165, 0.5294118, 0, 1, 1,
0.6973432, -1.137813, 1.956931, 0.5372549, 0, 1, 1,
0.6978712, 0.6137471, 1.832325, 0.5411765, 0, 1, 1,
0.6990746, 0.3968025, -0.349545, 0.5490196, 0, 1, 1,
0.699994, -0.3908398, 1.095941, 0.5529412, 0, 1, 1,
0.7003022, 0.0008537784, -0.5264761, 0.5607843, 0, 1, 1,
0.7025539, 0.5210345, 1.887774, 0.5647059, 0, 1, 1,
0.7045396, 0.03495137, 1.435141, 0.572549, 0, 1, 1,
0.7046104, -2.328763, 2.21509, 0.5764706, 0, 1, 1,
0.7096037, -0.156234, 1.361137, 0.5843138, 0, 1, 1,
0.7104771, -0.6262605, 2.363431, 0.5882353, 0, 1, 1,
0.7121346, 2.190082, 0.2961482, 0.5960785, 0, 1, 1,
0.7151406, -0.6494855, 1.023915, 0.6039216, 0, 1, 1,
0.7170814, -0.8594385, 1.336921, 0.6078432, 0, 1, 1,
0.7222574, -0.8350127, 2.28062, 0.6156863, 0, 1, 1,
0.7243535, -0.6126304, 2.769711, 0.6196079, 0, 1, 1,
0.7258304, 0.8651428, -0.0403, 0.627451, 0, 1, 1,
0.7277269, -0.752217, 3.159764, 0.6313726, 0, 1, 1,
0.7313797, -0.3477015, 3.74974, 0.6392157, 0, 1, 1,
0.7319375, 0.4757189, 2.360518, 0.6431373, 0, 1, 1,
0.7340283, -0.08871926, 1.430304, 0.6509804, 0, 1, 1,
0.7359776, 0.2589488, 0.2668271, 0.654902, 0, 1, 1,
0.7374884, -0.03662344, 2.869911, 0.6627451, 0, 1, 1,
0.7382178, 0.4955116, 2.051973, 0.6666667, 0, 1, 1,
0.741827, 0.5455987, 0.1634377, 0.6745098, 0, 1, 1,
0.7434894, 0.1127287, 2.277047, 0.6784314, 0, 1, 1,
0.7436633, -1.002901, 2.023412, 0.6862745, 0, 1, 1,
0.7511662, 1.966125, 0.7614648, 0.6901961, 0, 1, 1,
0.7517101, -0.6748496, 2.961489, 0.6980392, 0, 1, 1,
0.7550003, -1.014527, 1.849155, 0.7058824, 0, 1, 1,
0.7598667, 0.4021147, 0.5118579, 0.7098039, 0, 1, 1,
0.7618444, -1.305819, 2.031626, 0.7176471, 0, 1, 1,
0.762264, -0.490428, 4.005289, 0.7215686, 0, 1, 1,
0.770713, -0.7277984, 0.1928677, 0.7294118, 0, 1, 1,
0.7733234, -0.3618989, 3.988272, 0.7333333, 0, 1, 1,
0.783384, 1.145705, 1.086179, 0.7411765, 0, 1, 1,
0.783636, 1.719245, 2.130679, 0.7450981, 0, 1, 1,
0.7891605, 0.2949209, -1.440404, 0.7529412, 0, 1, 1,
0.7892364, 0.9992616, 1.611395, 0.7568628, 0, 1, 1,
0.7956686, -1.689424, 3.101045, 0.7647059, 0, 1, 1,
0.8045895, 0.3082003, 1.283249, 0.7686275, 0, 1, 1,
0.8099811, 0.2606224, -1.43372, 0.7764706, 0, 1, 1,
0.816368, -0.03731379, 1.426329, 0.7803922, 0, 1, 1,
0.8174387, 0.4738074, 1.769997, 0.7882353, 0, 1, 1,
0.8253309, 0.8465043, -0.3146818, 0.7921569, 0, 1, 1,
0.8264608, 2.158836, 2.225912, 0.8, 0, 1, 1,
0.8282284, -0.4686952, 2.420178, 0.8078431, 0, 1, 1,
0.8297157, 1.432506, 1.128358, 0.8117647, 0, 1, 1,
0.8309431, 0.5503966, 1.0508, 0.8196079, 0, 1, 1,
0.8334288, 0.9058517, 2.08923, 0.8235294, 0, 1, 1,
0.8341966, -0.9007172, 2.910516, 0.8313726, 0, 1, 1,
0.8443854, 1.132862, -0.229764, 0.8352941, 0, 1, 1,
0.852201, 0.44799, 0.5732761, 0.8431373, 0, 1, 1,
0.8546606, -1.033616, 1.407007, 0.8470588, 0, 1, 1,
0.8555109, 0.9138638, 0.796638, 0.854902, 0, 1, 1,
0.863362, -1.042222, 0.4231576, 0.8588235, 0, 1, 1,
0.8659106, -1.595291, 3.464087, 0.8666667, 0, 1, 1,
0.8765292, 0.7769766, 1.172937, 0.8705882, 0, 1, 1,
0.8776448, -0.4473346, 0.5154321, 0.8784314, 0, 1, 1,
0.8792155, 0.3923636, 1.450443, 0.8823529, 0, 1, 1,
0.8807036, -0.4264075, 0.009501521, 0.8901961, 0, 1, 1,
0.886218, -0.0355543, 2.604097, 0.8941177, 0, 1, 1,
0.887053, -0.5905848, 1.649706, 0.9019608, 0, 1, 1,
0.8881671, -0.002720401, 1.540549, 0.9098039, 0, 1, 1,
0.8905542, -1.415501, 3.525351, 0.9137255, 0, 1, 1,
0.9029005, -0.6635788, 2.624101, 0.9215686, 0, 1, 1,
0.911085, -0.7583643, 3.215046, 0.9254902, 0, 1, 1,
0.9142648, -0.1588774, 2.114645, 0.9333333, 0, 1, 1,
0.9156026, -0.6630279, 2.243459, 0.9372549, 0, 1, 1,
0.9319806, 0.3490905, 1.128244, 0.945098, 0, 1, 1,
0.9372034, -0.8287486, 4.148331, 0.9490196, 0, 1, 1,
0.941914, 2.219451, 1.035678, 0.9568627, 0, 1, 1,
0.9433005, -0.2549756, -0.6392648, 0.9607843, 0, 1, 1,
0.9437698, 0.2093377, 1.53702, 0.9686275, 0, 1, 1,
0.9481416, -0.7974712, 2.210167, 0.972549, 0, 1, 1,
0.9510381, 1.231429, -0.02590522, 0.9803922, 0, 1, 1,
0.9514858, 0.7049097, 1.486909, 0.9843137, 0, 1, 1,
0.9516597, 0.8562695, 1.357619, 0.9921569, 0, 1, 1,
0.9572592, 0.1705868, 0.8593076, 0.9960784, 0, 1, 1,
0.9606816, -0.4735856, 3.397678, 1, 0, 0.9960784, 1,
0.9644744, -0.9271858, 2.451353, 1, 0, 0.9882353, 1,
0.9686741, 1.114602, -1.251963, 1, 0, 0.9843137, 1,
0.9703263, -0.3211234, 1.969735, 1, 0, 0.9764706, 1,
0.9704997, 0.7620313, 1.487216, 1, 0, 0.972549, 1,
0.9807391, -1.03229, 1.864753, 1, 0, 0.9647059, 1,
0.9815804, -0.6923167, 1.303836, 1, 0, 0.9607843, 1,
0.9818177, 1.528919, -0.7671245, 1, 0, 0.9529412, 1,
0.9849072, 0.02803757, 2.896037, 1, 0, 0.9490196, 1,
0.9904301, -0.01957401, 2.470385, 1, 0, 0.9411765, 1,
0.9953463, 0.5864133, 2.84589, 1, 0, 0.9372549, 1,
0.9957167, -0.2252184, 0.5374593, 1, 0, 0.9294118, 1,
0.9958174, 0.5375149, 1.55888, 1, 0, 0.9254902, 1,
0.9970621, 0.8820376, 0.4712851, 1, 0, 0.9176471, 1,
1.00659, -1.200846, 1.278038, 1, 0, 0.9137255, 1,
1.007675, -2.166817, 2.604055, 1, 0, 0.9058824, 1,
1.010718, -1.200834, 2.354921, 1, 0, 0.9019608, 1,
1.01323, 0.7973136, 0.4563886, 1, 0, 0.8941177, 1,
1.013971, -0.8999586, 1.074612, 1, 0, 0.8862745, 1,
1.019609, -0.4453768, 3.241382, 1, 0, 0.8823529, 1,
1.026104, -0.2992518, 3.495193, 1, 0, 0.8745098, 1,
1.027967, -1.421728, 3.667271, 1, 0, 0.8705882, 1,
1.029327, 0.6306914, 0.004428904, 1, 0, 0.8627451, 1,
1.031415, -0.634091, 3.322879, 1, 0, 0.8588235, 1,
1.035025, -0.9338287, 2.271734, 1, 0, 0.8509804, 1,
1.03655, 0.9155587, 1.87822, 1, 0, 0.8470588, 1,
1.04096, -1.007893, 2.724761, 1, 0, 0.8392157, 1,
1.049407, -0.1762725, 1.908851, 1, 0, 0.8352941, 1,
1.04981, 0.5084999, 2.032425, 1, 0, 0.827451, 1,
1.061107, 0.03138593, 2.509499, 1, 0, 0.8235294, 1,
1.070547, -0.4536107, 0.6027296, 1, 0, 0.8156863, 1,
1.074746, -0.04429906, 1.272652, 1, 0, 0.8117647, 1,
1.07665, -0.3230985, 2.864012, 1, 0, 0.8039216, 1,
1.079011, -0.4105939, 2.602462, 1, 0, 0.7960784, 1,
1.086337, 0.3756216, 0.7473706, 1, 0, 0.7921569, 1,
1.096557, 0.0513768, 3.74125, 1, 0, 0.7843137, 1,
1.097496, -0.6611688, 3.955936, 1, 0, 0.7803922, 1,
1.102326, -0.01148973, 1.787164, 1, 0, 0.772549, 1,
1.115117, 0.846656, 0.9112386, 1, 0, 0.7686275, 1,
1.115967, 0.3901244, 1.762451, 1, 0, 0.7607843, 1,
1.116067, -0.4950536, 2.463248, 1, 0, 0.7568628, 1,
1.120477, -1.750901, 0.7366953, 1, 0, 0.7490196, 1,
1.125449, 1.003884, 0.6638721, 1, 0, 0.7450981, 1,
1.128574, 1.102401, 0.4787434, 1, 0, 0.7372549, 1,
1.131851, 1.346711, 0.8681904, 1, 0, 0.7333333, 1,
1.134138, -1.267848, 2.813787, 1, 0, 0.7254902, 1,
1.134424, -0.3355902, 2.300163, 1, 0, 0.7215686, 1,
1.141837, 0.5226281, 2.084164, 1, 0, 0.7137255, 1,
1.14346, -0.2557033, 1.474883, 1, 0, 0.7098039, 1,
1.150699, 0.8859943, 0.3618358, 1, 0, 0.7019608, 1,
1.150866, 0.485579, 2.584596, 1, 0, 0.6941177, 1,
1.156225, 0.7413611, 2.821839, 1, 0, 0.6901961, 1,
1.159795, 0.06812088, 0.8020704, 1, 0, 0.682353, 1,
1.162471, -0.9632133, 2.055991, 1, 0, 0.6784314, 1,
1.163086, -0.1597599, -0.2067195, 1, 0, 0.6705883, 1,
1.164198, -0.5139695, 1.173952, 1, 0, 0.6666667, 1,
1.164535, 0.1353801, 1.611688, 1, 0, 0.6588235, 1,
1.168656, -1.590665, 1.272081, 1, 0, 0.654902, 1,
1.191188, -0.3852949, 1.672986, 1, 0, 0.6470588, 1,
1.194994, -0.6612847, 3.438381, 1, 0, 0.6431373, 1,
1.195834, -1.030621, 2.67375, 1, 0, 0.6352941, 1,
1.198114, 0.6195592, 1.996434, 1, 0, 0.6313726, 1,
1.201167, -0.06107121, 2.839874, 1, 0, 0.6235294, 1,
1.214863, -0.2194038, 1.829171, 1, 0, 0.6196079, 1,
1.235655, 0.5512481, 1.265151, 1, 0, 0.6117647, 1,
1.240704, -0.9980714, 3.13697, 1, 0, 0.6078432, 1,
1.243403, 0.2659868, 2.10163, 1, 0, 0.6, 1,
1.251369, 0.6602809, 0.268815, 1, 0, 0.5921569, 1,
1.269779, -0.7257441, 0.3755267, 1, 0, 0.5882353, 1,
1.274884, -0.6600365, 1.931907, 1, 0, 0.5803922, 1,
1.278655, 2.090855, 1.372412, 1, 0, 0.5764706, 1,
1.279859, -0.7639086, 1.936831, 1, 0, 0.5686275, 1,
1.296996, -0.9068095, 1.608701, 1, 0, 0.5647059, 1,
1.297015, 0.4898769, 0.2362566, 1, 0, 0.5568628, 1,
1.298774, 0.5386343, 1.101693, 1, 0, 0.5529412, 1,
1.299565, 0.4242867, 1.171421, 1, 0, 0.5450981, 1,
1.308187, 1.306026, 0.08826726, 1, 0, 0.5411765, 1,
1.312882, 0.1848398, 3.11991, 1, 0, 0.5333334, 1,
1.314729, -0.9461086, 2.857667, 1, 0, 0.5294118, 1,
1.31552, -0.5777656, 2.247298, 1, 0, 0.5215687, 1,
1.317983, -1.26581, 2.003801, 1, 0, 0.5176471, 1,
1.322738, -0.6851649, 2.086406, 1, 0, 0.509804, 1,
1.329162, -0.8304511, 1.049831, 1, 0, 0.5058824, 1,
1.33636, -0.2879831, 2.861549, 1, 0, 0.4980392, 1,
1.342264, 1.087606, 0.2652225, 1, 0, 0.4901961, 1,
1.356388, 0.8342535, 1.270388, 1, 0, 0.4862745, 1,
1.360579, 0.5007561, 1.941916, 1, 0, 0.4784314, 1,
1.361985, -0.01270509, 1.28176, 1, 0, 0.4745098, 1,
1.36474, 0.1632733, 0.2283497, 1, 0, 0.4666667, 1,
1.367397, -0.1361005, 1.573513, 1, 0, 0.4627451, 1,
1.369376, -0.4310708, 3.321799, 1, 0, 0.454902, 1,
1.379435, -1.640507, 2.681055, 1, 0, 0.4509804, 1,
1.385383, 0.8126101, 1.737242, 1, 0, 0.4431373, 1,
1.387767, 1.663715, -0.7240736, 1, 0, 0.4392157, 1,
1.389378, -0.2211624, 1.679936, 1, 0, 0.4313726, 1,
1.396142, 0.2694651, 1.452568, 1, 0, 0.427451, 1,
1.414194, 1.492905, 1.005388, 1, 0, 0.4196078, 1,
1.424773, 0.7165758, 0.5385823, 1, 0, 0.4156863, 1,
1.455047, -0.8811243, 2.079744, 1, 0, 0.4078431, 1,
1.470286, 0.236357, -0.1863049, 1, 0, 0.4039216, 1,
1.470585, -0.3589459, 2.235473, 1, 0, 0.3960784, 1,
1.478388, 1.805673, -0.1192554, 1, 0, 0.3882353, 1,
1.478495, 1.024702, 1.850919, 1, 0, 0.3843137, 1,
1.483407, -1.318486, 4.009099, 1, 0, 0.3764706, 1,
1.484637, -0.4050484, 3.937489, 1, 0, 0.372549, 1,
1.486611, -0.3948345, 2.368536, 1, 0, 0.3647059, 1,
1.487977, 0.6219046, 1.781774, 1, 0, 0.3607843, 1,
1.491361, -0.7330373, 1.394712, 1, 0, 0.3529412, 1,
1.49785, 0.6814833, 1.708206, 1, 0, 0.3490196, 1,
1.501598, -0.3535843, 3.34757, 1, 0, 0.3411765, 1,
1.507652, -2.569643, 3.050785, 1, 0, 0.3372549, 1,
1.509471, -1.160336, 0.7319297, 1, 0, 0.3294118, 1,
1.509522, -0.6670295, 5.22356, 1, 0, 0.3254902, 1,
1.511454, 0.5061249, 1.720525, 1, 0, 0.3176471, 1,
1.513951, -0.4605157, 3.363392, 1, 0, 0.3137255, 1,
1.516145, 0.4145102, 2.531797, 1, 0, 0.3058824, 1,
1.519306, 0.1071403, 0.5382292, 1, 0, 0.2980392, 1,
1.532719, 0.8481916, 2.851461, 1, 0, 0.2941177, 1,
1.546161, -0.3727142, 2.605646, 1, 0, 0.2862745, 1,
1.555385, -0.7925555, 4.440582, 1, 0, 0.282353, 1,
1.561631, -1.561764, 2.290003, 1, 0, 0.2745098, 1,
1.568816, -0.1330446, 1.060686, 1, 0, 0.2705882, 1,
1.569281, -0.1700619, 0.4264533, 1, 0, 0.2627451, 1,
1.570811, -1.237671, 3.654883, 1, 0, 0.2588235, 1,
1.578986, 1.040261, 0.480491, 1, 0, 0.2509804, 1,
1.592653, 0.4401233, 0.891946, 1, 0, 0.2470588, 1,
1.594415, 0.4833408, 2.331049, 1, 0, 0.2392157, 1,
1.661417, 0.3924536, 1.886957, 1, 0, 0.2352941, 1,
1.663754, -0.3773127, 0.6405793, 1, 0, 0.227451, 1,
1.672006, -0.6271351, 2.353144, 1, 0, 0.2235294, 1,
1.672436, 0.3819468, -0.4028662, 1, 0, 0.2156863, 1,
1.678523, 0.1028259, 1.092742, 1, 0, 0.2117647, 1,
1.68032, 2.808522, 0.3324979, 1, 0, 0.2039216, 1,
1.73172, 0.5204641, 1.738359, 1, 0, 0.1960784, 1,
1.732656, -0.2023719, 2.27546, 1, 0, 0.1921569, 1,
1.762716, 0.5199591, 0.8505175, 1, 0, 0.1843137, 1,
1.767421, -0.9035755, 0.9589477, 1, 0, 0.1803922, 1,
1.791693, 1.080266, 0.6009309, 1, 0, 0.172549, 1,
1.794253, 0.05322192, 0.4117375, 1, 0, 0.1686275, 1,
1.801355, 0.8808241, 0.05648142, 1, 0, 0.1607843, 1,
1.823035, -0.1046478, 1.788137, 1, 0, 0.1568628, 1,
1.842415, 1.537339, 0.2688124, 1, 0, 0.1490196, 1,
1.850894, 0.6918949, -0.3002068, 1, 0, 0.145098, 1,
1.875278, 1.32755, 0.0724057, 1, 0, 0.1372549, 1,
1.892076, -2.351495, 3.605796, 1, 0, 0.1333333, 1,
1.933244, -0.7199696, 1.856587, 1, 0, 0.1254902, 1,
1.954128, -1.442073, 1.966579, 1, 0, 0.1215686, 1,
1.955563, 0.1785416, 2.958342, 1, 0, 0.1137255, 1,
1.99986, 0.6394603, 1.264896, 1, 0, 0.1098039, 1,
2.006911, 1.676799, 0.5332011, 1, 0, 0.1019608, 1,
2.008538, 0.510016, 2.204352, 1, 0, 0.09411765, 1,
2.031839, 1.863255, 1.048637, 1, 0, 0.09019608, 1,
2.035424, 1.029299, 1.533232, 1, 0, 0.08235294, 1,
2.102077, 1.131581, -0.3692894, 1, 0, 0.07843138, 1,
2.120878, 1.082751, 1.886125, 1, 0, 0.07058824, 1,
2.132472, -1.226286, 1.028732, 1, 0, 0.06666667, 1,
2.147881, 0.2605407, 1.898587, 1, 0, 0.05882353, 1,
2.163437, 0.5055428, -0.974839, 1, 0, 0.05490196, 1,
2.176965, 0.5197001, 1.05232, 1, 0, 0.04705882, 1,
2.37357, -0.1940466, 2.394774, 1, 0, 0.04313726, 1,
2.386721, 1.24928, 1.239691, 1, 0, 0.03529412, 1,
2.406994, 0.3134408, 1.512628, 1, 0, 0.03137255, 1,
2.460628, -1.039142, 2.61398, 1, 0, 0.02352941, 1,
2.588367, 0.3946145, -0.01119574, 1, 0, 0.01960784, 1,
2.896112, -0.456346, 3.135354, 1, 0, 0.01176471, 1,
3.3505, 0.8688334, 0.6453288, 1, 0, 0.007843138, 1
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
0.3567117, -4.284187, -7.480101, 0, -0.5, 0.5, 0.5,
0.3567117, -4.284187, -7.480101, 1, -0.5, 0.5, 0.5,
0.3567117, -4.284187, -7.480101, 1, 1.5, 0.5, 0.5,
0.3567117, -4.284187, -7.480101, 0, 1.5, 0.5, 0.5
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
-3.65197, -0.2238464, -7.480101, 0, -0.5, 0.5, 0.5,
-3.65197, -0.2238464, -7.480101, 1, -0.5, 0.5, 0.5,
-3.65197, -0.2238464, -7.480101, 1, 1.5, 0.5, 0.5,
-3.65197, -0.2238464, -7.480101, 0, 1.5, 0.5, 0.5
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
-3.65197, -4.284187, -0.2076757, 0, -0.5, 0.5, 0.5,
-3.65197, -4.284187, -0.2076757, 1, -0.5, 0.5, 0.5,
-3.65197, -4.284187, -0.2076757, 1, 1.5, 0.5, 0.5,
-3.65197, -4.284187, -0.2076757, 0, 1.5, 0.5, 0.5
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
-2, -3.347186, -5.801849,
3, -3.347186, -5.801849,
-2, -3.347186, -5.801849,
-2, -3.503353, -6.081557,
-1, -3.347186, -5.801849,
-1, -3.503353, -6.081557,
0, -3.347186, -5.801849,
0, -3.503353, -6.081557,
1, -3.347186, -5.801849,
1, -3.503353, -6.081557,
2, -3.347186, -5.801849,
2, -3.503353, -6.081557,
3, -3.347186, -5.801849,
3, -3.503353, -6.081557
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
-2, -3.815686, -6.640975, 0, -0.5, 0.5, 0.5,
-2, -3.815686, -6.640975, 1, -0.5, 0.5, 0.5,
-2, -3.815686, -6.640975, 1, 1.5, 0.5, 0.5,
-2, -3.815686, -6.640975, 0, 1.5, 0.5, 0.5,
-1, -3.815686, -6.640975, 0, -0.5, 0.5, 0.5,
-1, -3.815686, -6.640975, 1, -0.5, 0.5, 0.5,
-1, -3.815686, -6.640975, 1, 1.5, 0.5, 0.5,
-1, -3.815686, -6.640975, 0, 1.5, 0.5, 0.5,
0, -3.815686, -6.640975, 0, -0.5, 0.5, 0.5,
0, -3.815686, -6.640975, 1, -0.5, 0.5, 0.5,
0, -3.815686, -6.640975, 1, 1.5, 0.5, 0.5,
0, -3.815686, -6.640975, 0, 1.5, 0.5, 0.5,
1, -3.815686, -6.640975, 0, -0.5, 0.5, 0.5,
1, -3.815686, -6.640975, 1, -0.5, 0.5, 0.5,
1, -3.815686, -6.640975, 1, 1.5, 0.5, 0.5,
1, -3.815686, -6.640975, 0, 1.5, 0.5, 0.5,
2, -3.815686, -6.640975, 0, -0.5, 0.5, 0.5,
2, -3.815686, -6.640975, 1, -0.5, 0.5, 0.5,
2, -3.815686, -6.640975, 1, 1.5, 0.5, 0.5,
2, -3.815686, -6.640975, 0, 1.5, 0.5, 0.5,
3, -3.815686, -6.640975, 0, -0.5, 0.5, 0.5,
3, -3.815686, -6.640975, 1, -0.5, 0.5, 0.5,
3, -3.815686, -6.640975, 1, 1.5, 0.5, 0.5,
3, -3.815686, -6.640975, 0, 1.5, 0.5, 0.5
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
-2.72689, -3, -5.801849,
-2.72689, 2, -5.801849,
-2.72689, -3, -5.801849,
-2.88107, -3, -6.081557,
-2.72689, -2, -5.801849,
-2.88107, -2, -6.081557,
-2.72689, -1, -5.801849,
-2.88107, -1, -6.081557,
-2.72689, 0, -5.801849,
-2.88107, 0, -6.081557,
-2.72689, 1, -5.801849,
-2.88107, 1, -6.081557,
-2.72689, 2, -5.801849,
-2.88107, 2, -6.081557
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
-3.18943, -3, -6.640975, 0, -0.5, 0.5, 0.5,
-3.18943, -3, -6.640975, 1, -0.5, 0.5, 0.5,
-3.18943, -3, -6.640975, 1, 1.5, 0.5, 0.5,
-3.18943, -3, -6.640975, 0, 1.5, 0.5, 0.5,
-3.18943, -2, -6.640975, 0, -0.5, 0.5, 0.5,
-3.18943, -2, -6.640975, 1, -0.5, 0.5, 0.5,
-3.18943, -2, -6.640975, 1, 1.5, 0.5, 0.5,
-3.18943, -2, -6.640975, 0, 1.5, 0.5, 0.5,
-3.18943, -1, -6.640975, 0, -0.5, 0.5, 0.5,
-3.18943, -1, -6.640975, 1, -0.5, 0.5, 0.5,
-3.18943, -1, -6.640975, 1, 1.5, 0.5, 0.5,
-3.18943, -1, -6.640975, 0, 1.5, 0.5, 0.5,
-3.18943, 0, -6.640975, 0, -0.5, 0.5, 0.5,
-3.18943, 0, -6.640975, 1, -0.5, 0.5, 0.5,
-3.18943, 0, -6.640975, 1, 1.5, 0.5, 0.5,
-3.18943, 0, -6.640975, 0, 1.5, 0.5, 0.5,
-3.18943, 1, -6.640975, 0, -0.5, 0.5, 0.5,
-3.18943, 1, -6.640975, 1, -0.5, 0.5, 0.5,
-3.18943, 1, -6.640975, 1, 1.5, 0.5, 0.5,
-3.18943, 1, -6.640975, 0, 1.5, 0.5, 0.5,
-3.18943, 2, -6.640975, 0, -0.5, 0.5, 0.5,
-3.18943, 2, -6.640975, 1, -0.5, 0.5, 0.5,
-3.18943, 2, -6.640975, 1, 1.5, 0.5, 0.5,
-3.18943, 2, -6.640975, 0, 1.5, 0.5, 0.5
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
-2.72689, -3.347186, -4,
-2.72689, -3.347186, 4,
-2.72689, -3.347186, -4,
-2.88107, -3.503353, -4,
-2.72689, -3.347186, -2,
-2.88107, -3.503353, -2,
-2.72689, -3.347186, 0,
-2.88107, -3.503353, 0,
-2.72689, -3.347186, 2,
-2.88107, -3.503353, 2,
-2.72689, -3.347186, 4,
-2.88107, -3.503353, 4
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
-3.18943, -3.815686, -4, 0, -0.5, 0.5, 0.5,
-3.18943, -3.815686, -4, 1, -0.5, 0.5, 0.5,
-3.18943, -3.815686, -4, 1, 1.5, 0.5, 0.5,
-3.18943, -3.815686, -4, 0, 1.5, 0.5, 0.5,
-3.18943, -3.815686, -2, 0, -0.5, 0.5, 0.5,
-3.18943, -3.815686, -2, 1, -0.5, 0.5, 0.5,
-3.18943, -3.815686, -2, 1, 1.5, 0.5, 0.5,
-3.18943, -3.815686, -2, 0, 1.5, 0.5, 0.5,
-3.18943, -3.815686, 0, 0, -0.5, 0.5, 0.5,
-3.18943, -3.815686, 0, 1, -0.5, 0.5, 0.5,
-3.18943, -3.815686, 0, 1, 1.5, 0.5, 0.5,
-3.18943, -3.815686, 0, 0, 1.5, 0.5, 0.5,
-3.18943, -3.815686, 2, 0, -0.5, 0.5, 0.5,
-3.18943, -3.815686, 2, 1, -0.5, 0.5, 0.5,
-3.18943, -3.815686, 2, 1, 1.5, 0.5, 0.5,
-3.18943, -3.815686, 2, 0, 1.5, 0.5, 0.5,
-3.18943, -3.815686, 4, 0, -0.5, 0.5, 0.5,
-3.18943, -3.815686, 4, 1, -0.5, 0.5, 0.5,
-3.18943, -3.815686, 4, 1, 1.5, 0.5, 0.5,
-3.18943, -3.815686, 4, 0, 1.5, 0.5, 0.5
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
-2.72689, -3.347186, -5.801849,
-2.72689, 2.899493, -5.801849,
-2.72689, -3.347186, 5.386497,
-2.72689, 2.899493, 5.386497,
-2.72689, -3.347186, -5.801849,
-2.72689, -3.347186, 5.386497,
-2.72689, 2.899493, -5.801849,
-2.72689, 2.899493, 5.386497,
-2.72689, -3.347186, -5.801849,
3.440313, -3.347186, -5.801849,
-2.72689, -3.347186, 5.386497,
3.440313, -3.347186, 5.386497,
-2.72689, 2.899493, -5.801849,
3.440313, 2.899493, -5.801849,
-2.72689, 2.899493, 5.386497,
3.440313, 2.899493, 5.386497,
3.440313, -3.347186, -5.801849,
3.440313, 2.899493, -5.801849,
3.440313, -3.347186, 5.386497,
3.440313, 2.899493, 5.386497,
3.440313, -3.347186, -5.801849,
3.440313, -3.347186, 5.386497,
3.440313, 2.899493, -5.801849,
3.440313, 2.899493, 5.386497
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
var radius = 7.593693;
var distance = 33.7852;
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
mvMatrix.translate( -0.3567117, 0.2238464, 0.2076757 );
mvMatrix.scale( 1.331309, 1.314371, 0.7338395 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.7852);
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
HOCN<-read.table("HOCN.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-2.637076, 0.2673741, 0.5605387, 0, 0, 1, 1, 1,
-2.402365, -1.708135, -2.540876, 1, 0, 0, 1, 1,
-2.388703, -0.2695642, -1.325548, 1, 0, 0, 1, 1,
-2.350597, -0.8968252, -0.3449663, 1, 0, 0, 1, 1,
-2.340113, -0.3752856, -2.987965, 1, 0, 0, 1, 1,
-2.313665, -0.7297967, -1.638931, 1, 0, 0, 1, 1,
-2.292341, -1.418492, -2.946275, 0, 0, 0, 1, 1,
-2.190182, -1.460232, -2.492739, 0, 0, 0, 1, 1,
-2.158884, 0.8079515, -0.1391682, 0, 0, 0, 1, 1,
-2.146925, 1.076677, -1.986485, 0, 0, 0, 1, 1,
-2.141227, 0.1839421, 0.4282494, 0, 0, 0, 1, 1,
-2.11242, 0.432548, -0.765807, 0, 0, 0, 1, 1,
-2.079987, -0.2312357, -0.8644806, 0, 0, 0, 1, 1,
-2.078188, 0.1543742, -3.488686, 1, 1, 1, 1, 1,
-2.074991, -1.698513, -2.754421, 1, 1, 1, 1, 1,
-2.066562, 0.1917377, -1.522355, 1, 1, 1, 1, 1,
-2.011741, -0.68941, -0.3230008, 1, 1, 1, 1, 1,
-1.998793, -0.2324618, -2.098893, 1, 1, 1, 1, 1,
-1.960124, -0.8729076, -1.929009, 1, 1, 1, 1, 1,
-1.945657, -0.7272726, 0.4268113, 1, 1, 1, 1, 1,
-1.89731, 0.6624145, -1.088181, 1, 1, 1, 1, 1,
-1.896406, 0.3760933, -1.922578, 1, 1, 1, 1, 1,
-1.881995, 0.8708932, -1.168821, 1, 1, 1, 1, 1,
-1.874831, 0.09401156, -0.3862126, 1, 1, 1, 1, 1,
-1.856202, 0.8731359, -1.291421, 1, 1, 1, 1, 1,
-1.855599, 0.4124011, -1.20754, 1, 1, 1, 1, 1,
-1.825497, -0.2788183, -0.73963, 1, 1, 1, 1, 1,
-1.817857, -0.7407631, -0.391526, 1, 1, 1, 1, 1,
-1.807703, 0.6532579, -0.07554035, 0, 0, 1, 1, 1,
-1.791533, -0.4750681, -1.264544, 1, 0, 0, 1, 1,
-1.785794, 0.6303988, -1.625148, 1, 0, 0, 1, 1,
-1.781829, -0.1325393, -2.415361, 1, 0, 0, 1, 1,
-1.774598, 0.9817961, -0.6913757, 1, 0, 0, 1, 1,
-1.771789, 0.4516468, -1.800653, 1, 0, 0, 1, 1,
-1.765915, -1.07546, -1.920636, 0, 0, 0, 1, 1,
-1.756454, -0.8465505, -1.08636, 0, 0, 0, 1, 1,
-1.754056, 1.526451, -1.044564, 0, 0, 0, 1, 1,
-1.748722, 1.219911, -2.619251, 0, 0, 0, 1, 1,
-1.698771, -0.1396075, -1.870022, 0, 0, 0, 1, 1,
-1.692927, -0.5447311, -0.1093684, 0, 0, 0, 1, 1,
-1.689165, 0.5852933, -1.996909, 0, 0, 0, 1, 1,
-1.687422, -0.3068314, -2.633931, 1, 1, 1, 1, 1,
-1.676449, 0.7302919, 0.1239352, 1, 1, 1, 1, 1,
-1.660917, 1.224888, -1.986044, 1, 1, 1, 1, 1,
-1.657361, -1.732675, -2.881231, 1, 1, 1, 1, 1,
-1.634887, 0.3478593, -1.243411, 1, 1, 1, 1, 1,
-1.629463, 2.121227, 0.05046439, 1, 1, 1, 1, 1,
-1.618204, -0.2511662, -1.56485, 1, 1, 1, 1, 1,
-1.614715, 0.3210494, -1.304892, 1, 1, 1, 1, 1,
-1.614358, -0.7093919, 0.1504829, 1, 1, 1, 1, 1,
-1.60767, 0.6280346, -2.550104, 1, 1, 1, 1, 1,
-1.605489, -0.1449645, -3.318237, 1, 1, 1, 1, 1,
-1.592824, 0.9086361, -1.485126, 1, 1, 1, 1, 1,
-1.589837, -0.5895323, -0.8544465, 1, 1, 1, 1, 1,
-1.585516, -0.2013767, -2.522673, 1, 1, 1, 1, 1,
-1.583005, -0.164584, -1.09365, 1, 1, 1, 1, 1,
-1.577245, -0.5214258, -2.398535, 0, 0, 1, 1, 1,
-1.576026, 0.7638114, 0.6016082, 1, 0, 0, 1, 1,
-1.575181, -1.227091, -1.930701, 1, 0, 0, 1, 1,
-1.571863, 0.4795418, -0.7526873, 1, 0, 0, 1, 1,
-1.568697, -0.2658624, -1.754196, 1, 0, 0, 1, 1,
-1.538467, 2.628784, -0.9660451, 1, 0, 0, 1, 1,
-1.531184, 0.3725292, -3.080513, 0, 0, 0, 1, 1,
-1.52979, 0.4320882, -0.5983205, 0, 0, 0, 1, 1,
-1.525796, -0.7379181, -1.006371, 0, 0, 0, 1, 1,
-1.511146, 0.03389646, -2.263895, 0, 0, 0, 1, 1,
-1.503193, 0.5984287, -0.9372466, 0, 0, 0, 1, 1,
-1.500851, -0.389878, -1.580401, 0, 0, 0, 1, 1,
-1.499444, -0.3209479, -2.108196, 0, 0, 0, 1, 1,
-1.498048, 1.692416, -1.614979, 1, 1, 1, 1, 1,
-1.492346, -0.7876054, -3.114094, 1, 1, 1, 1, 1,
-1.489009, -2.138621, -1.109296, 1, 1, 1, 1, 1,
-1.479135, -0.6021541, -1.004499, 1, 1, 1, 1, 1,
-1.468754, 1.486156, -0.1327597, 1, 1, 1, 1, 1,
-1.460428, 1.995512, -1.095113, 1, 1, 1, 1, 1,
-1.458777, 1.458164, -1.799312, 1, 1, 1, 1, 1,
-1.451611, -1.257409, -0.5255147, 1, 1, 1, 1, 1,
-1.451089, 0.4363696, 0.05171815, 1, 1, 1, 1, 1,
-1.448982, 0.9000698, -1.692868, 1, 1, 1, 1, 1,
-1.447627, 0.5015223, -2.587788, 1, 1, 1, 1, 1,
-1.440252, -1.077288, -2.533791, 1, 1, 1, 1, 1,
-1.43048, 2.514075, 0.5666082, 1, 1, 1, 1, 1,
-1.423626, -0.598848, -2.333581, 1, 1, 1, 1, 1,
-1.415186, -0.4512527, -1.289201, 1, 1, 1, 1, 1,
-1.411795, 0.2869144, -0.6075973, 0, 0, 1, 1, 1,
-1.41136, 0.1679958, -1.243301, 1, 0, 0, 1, 1,
-1.408898, -0.6523811, -1.840382, 1, 0, 0, 1, 1,
-1.391713, -0.1268984, -2.575452, 1, 0, 0, 1, 1,
-1.391365, 0.2905425, -3.569052, 1, 0, 0, 1, 1,
-1.363526, 0.1422641, -1.582728, 1, 0, 0, 1, 1,
-1.361194, -0.5999253, -3.332182, 0, 0, 0, 1, 1,
-1.350081, 0.06311131, -3.055712, 0, 0, 0, 1, 1,
-1.346973, -0.2358491, -2.775315, 0, 0, 0, 1, 1,
-1.342328, -1.702812, -3.788058, 0, 0, 0, 1, 1,
-1.337271, -1.988527, -1.955965, 0, 0, 0, 1, 1,
-1.335989, -1.542729, -1.640029, 0, 0, 0, 1, 1,
-1.331171, 0.1054599, -1.377778, 0, 0, 0, 1, 1,
-1.328174, 0.2354258, -2.676505, 1, 1, 1, 1, 1,
-1.327666, 0.002183289, -0.4466771, 1, 1, 1, 1, 1,
-1.323585, -0.1646954, -0.616492, 1, 1, 1, 1, 1,
-1.322269, -0.672815, -1.313799, 1, 1, 1, 1, 1,
-1.315552, 0.8285526, 0.2416254, 1, 1, 1, 1, 1,
-1.314771, -0.613034, -1.48104, 1, 1, 1, 1, 1,
-1.308377, -1.190298, -0.4236417, 1, 1, 1, 1, 1,
-1.290355, -0.6808112, -2.584678, 1, 1, 1, 1, 1,
-1.283469, -1.596774, -3.290519, 1, 1, 1, 1, 1,
-1.275081, -0.2415183, -1.309622, 1, 1, 1, 1, 1,
-1.273934, 1.033798, -1.306508, 1, 1, 1, 1, 1,
-1.272561, -1.384066, -3.22551, 1, 1, 1, 1, 1,
-1.270776, -0.8216347, -1.793185, 1, 1, 1, 1, 1,
-1.258588, 0.7940695, -0.2746821, 1, 1, 1, 1, 1,
-1.255265, -0.8899558, -1.053882, 1, 1, 1, 1, 1,
-1.236202, 0.1748899, -1.080587, 0, 0, 1, 1, 1,
-1.234847, -0.1679491, 0.3897677, 1, 0, 0, 1, 1,
-1.21126, -1.998466, -2.959937, 1, 0, 0, 1, 1,
-1.206358, -0.02897217, -1.152555, 1, 0, 0, 1, 1,
-1.205793, 0.5618812, -0.8105962, 1, 0, 0, 1, 1,
-1.20555, -0.7067251, -2.516151, 1, 0, 0, 1, 1,
-1.202998, -0.2233106, -1.114156, 0, 0, 0, 1, 1,
-1.185471, 0.1029447, -0.8260342, 0, 0, 0, 1, 1,
-1.184244, 1.356194, -0.2669822, 0, 0, 0, 1, 1,
-1.181825, -1.028274, -0.08753441, 0, 0, 0, 1, 1,
-1.177026, 0.9323136, -0.07305589, 0, 0, 0, 1, 1,
-1.174694, 1.043009, -0.8390133, 0, 0, 0, 1, 1,
-1.173464, 0.3282178, -0.6280891, 0, 0, 0, 1, 1,
-1.166354, -1.384429, -2.794047, 1, 1, 1, 1, 1,
-1.161289, -1.755345, -2.922341, 1, 1, 1, 1, 1,
-1.161126, 1.370527, -1.711048, 1, 1, 1, 1, 1,
-1.158781, -0.5327007, -2.354721, 1, 1, 1, 1, 1,
-1.158376, 1.147776, 1.522976, 1, 1, 1, 1, 1,
-1.158328, 0.1399781, -2.266289, 1, 1, 1, 1, 1,
-1.150223, -0.0734763, -3.21805, 1, 1, 1, 1, 1,
-1.149703, 0.4375393, -1.543683, 1, 1, 1, 1, 1,
-1.147864, -1.197912, -2.870335, 1, 1, 1, 1, 1,
-1.141993, 1.242535, -1.108386, 1, 1, 1, 1, 1,
-1.139056, -0.5294816, -0.5980527, 1, 1, 1, 1, 1,
-1.132784, 0.8155476, -2.450252, 1, 1, 1, 1, 1,
-1.131292, 1.308074, 0.5717629, 1, 1, 1, 1, 1,
-1.130241, 2.325449, -0.1385563, 1, 1, 1, 1, 1,
-1.115222, -0.2331192, -2.759149, 1, 1, 1, 1, 1,
-1.110652, 1.482966, -0.6915398, 0, 0, 1, 1, 1,
-1.098023, 0.1524648, 1.160865, 1, 0, 0, 1, 1,
-1.095301, 0.2786681, -0.9126191, 1, 0, 0, 1, 1,
-1.090447, 0.2180766, -1.354648, 1, 0, 0, 1, 1,
-1.08446, 0.6100067, -1.661512, 1, 0, 0, 1, 1,
-1.079751, 0.705057, -1.856269, 1, 0, 0, 1, 1,
-1.078457, 0.4997175, -3.224284, 0, 0, 0, 1, 1,
-1.069694, 0.1016581, -1.941851, 0, 0, 0, 1, 1,
-1.055344, 1.034792, 0.4470633, 0, 0, 0, 1, 1,
-1.052443, -0.8564872, -2.208603, 0, 0, 0, 1, 1,
-1.049336, 0.9366006, 0.2752842, 0, 0, 0, 1, 1,
-1.042321, 0.115098, 0.515941, 0, 0, 0, 1, 1,
-1.041201, 0.4282988, -2.436741, 0, 0, 0, 1, 1,
-1.037436, -0.9732655, -1.502711, 1, 1, 1, 1, 1,
-1.03253, 2.165182, -0.9341052, 1, 1, 1, 1, 1,
-1.028939, -0.2520661, -0.669318, 1, 1, 1, 1, 1,
-1.028829, 0.6109198, 0.09144186, 1, 1, 1, 1, 1,
-1.024269, 1.451561, -0.6729119, 1, 1, 1, 1, 1,
-1.019399, 1.678665, -0.08035915, 1, 1, 1, 1, 1,
-1.016949, 0.3470329, -1.738732, 1, 1, 1, 1, 1,
-1.015462, 0.9303999, -0.1405846, 1, 1, 1, 1, 1,
-1.013587, -0.6594993, -2.783064, 1, 1, 1, 1, 1,
-1.007194, -1.429399, -2.718581, 1, 1, 1, 1, 1,
-1.007096, -2.389055, -1.437914, 1, 1, 1, 1, 1,
-1.000442, -0.8528256, -1.412136, 1, 1, 1, 1, 1,
-1.000358, -0.6280929, -2.881509, 1, 1, 1, 1, 1,
-0.9995204, -0.6047437, -1.465907, 1, 1, 1, 1, 1,
-0.9924719, -0.4746495, -0.9646272, 1, 1, 1, 1, 1,
-0.9878187, -0.01390904, -0.5180385, 0, 0, 1, 1, 1,
-0.9863034, 0.6710693, 1.055009, 1, 0, 0, 1, 1,
-0.9814381, 1.790082, -0.262997, 1, 0, 0, 1, 1,
-0.9796003, 2.345361, -2.019578, 1, 0, 0, 1, 1,
-0.9624215, 0.862953, -0.1114252, 1, 0, 0, 1, 1,
-0.9612992, 0.5186747, 0.9113381, 1, 0, 0, 1, 1,
-0.9610105, 1.035644, -2.144604, 0, 0, 0, 1, 1,
-0.9597661, 1.85731, -0.5461531, 0, 0, 0, 1, 1,
-0.955659, 0.1681035, -1.737243, 0, 0, 0, 1, 1,
-0.9556412, 1.436311, -2.014302, 0, 0, 0, 1, 1,
-0.951136, -0.6493078, -2.30052, 0, 0, 0, 1, 1,
-0.9411716, -0.2108029, -3.889728, 0, 0, 0, 1, 1,
-0.9269721, 0.7903901, 0.598046, 0, 0, 0, 1, 1,
-0.9249802, -0.4248396, -3.544582, 1, 1, 1, 1, 1,
-0.9248735, -0.3027859, -1.576463, 1, 1, 1, 1, 1,
-0.9145274, 0.4798316, 0.04986359, 1, 1, 1, 1, 1,
-0.8907949, -0.8080628, -2.990392, 1, 1, 1, 1, 1,
-0.8878149, -0.5542637, -2.18707, 1, 1, 1, 1, 1,
-0.8870748, -0.7737639, -2.137396, 1, 1, 1, 1, 1,
-0.8865773, -0.04327301, -3.944035, 1, 1, 1, 1, 1,
-0.8838567, 0.03962959, -3.29086, 1, 1, 1, 1, 1,
-0.872997, 0.517541, -2.217594, 1, 1, 1, 1, 1,
-0.8711939, -0.8234646, -1.371506, 1, 1, 1, 1, 1,
-0.8686825, -0.8860648, -1.449833, 1, 1, 1, 1, 1,
-0.8684849, -0.917131, -0.03346888, 1, 1, 1, 1, 1,
-0.8645588, 0.4041528, -0.8952901, 1, 1, 1, 1, 1,
-0.8630274, -1.01942, -2.594411, 1, 1, 1, 1, 1,
-0.8614329, -1.445353, -1.944246, 1, 1, 1, 1, 1,
-0.8603605, 1.03059, 0.9957507, 0, 0, 1, 1, 1,
-0.8602428, -0.5634856, -2.933467, 1, 0, 0, 1, 1,
-0.8524423, 0.831065, -2.378671, 1, 0, 0, 1, 1,
-0.8523052, 0.5210596, -0.7574325, 1, 0, 0, 1, 1,
-0.852176, -0.2977182, -3.882839, 1, 0, 0, 1, 1,
-0.8468009, -0.8895546, -1.948129, 1, 0, 0, 1, 1,
-0.8467588, -0.3417962, -1.005124, 0, 0, 0, 1, 1,
-0.8453045, 1.507903, -0.9521425, 0, 0, 0, 1, 1,
-0.8406086, -1.865035, -1.834385, 0, 0, 0, 1, 1,
-0.8405887, -0.2252364, -1.853519, 0, 0, 0, 1, 1,
-0.8380054, 1.110066, 0.8618262, 0, 0, 0, 1, 1,
-0.8377366, 1.191759, -0.07817716, 0, 0, 0, 1, 1,
-0.8351551, 0.9698836, 0.04926889, 0, 0, 0, 1, 1,
-0.834923, -0.475017, -1.364967, 1, 1, 1, 1, 1,
-0.8332777, -0.5253348, -0.2575672, 1, 1, 1, 1, 1,
-0.8321593, -0.839599, -2.335854, 1, 1, 1, 1, 1,
-0.829717, 0.09197646, -1.214542, 1, 1, 1, 1, 1,
-0.8274089, -0.1065096, -1.242413, 1, 1, 1, 1, 1,
-0.8270085, 0.900242, -1.268216, 1, 1, 1, 1, 1,
-0.8151602, -0.9508501, -3.157913, 1, 1, 1, 1, 1,
-0.8099151, -0.5761905, -3.618599, 1, 1, 1, 1, 1,
-0.8074704, -1.129247, -3.559118, 1, 1, 1, 1, 1,
-0.80375, 0.4591216, -0.2278391, 1, 1, 1, 1, 1,
-0.7943321, 0.2400823, -3.00719, 1, 1, 1, 1, 1,
-0.7884846, -0.4770637, -2.223374, 1, 1, 1, 1, 1,
-0.7871827, -0.8013834, -2.786481, 1, 1, 1, 1, 1,
-0.7837466, 0.8729636, -1.00415, 1, 1, 1, 1, 1,
-0.7779825, 1.040337, 0.976807, 1, 1, 1, 1, 1,
-0.7775602, 0.1778601, -2.176363, 0, 0, 1, 1, 1,
-0.7721788, 0.6317781, -0.7875227, 1, 0, 0, 1, 1,
-0.762521, -0.1355866, -0.03134966, 1, 0, 0, 1, 1,
-0.7598056, -0.6877094, -2.59005, 1, 0, 0, 1, 1,
-0.7580183, 0.5980701, -1.354491, 1, 0, 0, 1, 1,
-0.7549669, 1.512466, -2.100474, 1, 0, 0, 1, 1,
-0.7450699, -2.02265, -4.851623, 0, 0, 0, 1, 1,
-0.7440777, -2.442224, -4.018147, 0, 0, 0, 1, 1,
-0.7440153, -0.4777479, -2.732001, 0, 0, 0, 1, 1,
-0.7435136, 0.7448701, 0.9717327, 0, 0, 0, 1, 1,
-0.7392664, -0.07239881, -2.228271, 0, 0, 0, 1, 1,
-0.7366061, 0.03395011, -2.534704, 0, 0, 0, 1, 1,
-0.735875, 0.03754859, -1.129935, 0, 0, 0, 1, 1,
-0.730319, -0.7978742, -1.467072, 1, 1, 1, 1, 1,
-0.7197595, -0.3201602, -2.439048, 1, 1, 1, 1, 1,
-0.7137716, 0.5466141, -1.394331, 1, 1, 1, 1, 1,
-0.713493, 2.153184, -0.7163521, 1, 1, 1, 1, 1,
-0.7130044, 0.02471848, -0.4303397, 1, 1, 1, 1, 1,
-0.7083779, 0.2871334, -0.4526256, 1, 1, 1, 1, 1,
-0.7076958, -0.06934968, -1.709842, 1, 1, 1, 1, 1,
-0.7037453, 0.9082707, -2.599457, 1, 1, 1, 1, 1,
-0.7019796, 1.559611, -0.288963, 1, 1, 1, 1, 1,
-0.6999318, 0.6605629, -2.020429, 1, 1, 1, 1, 1,
-0.6991897, -0.1619649, -3.465648, 1, 1, 1, 1, 1,
-0.6956598, 0.7331993, -2.892413, 1, 1, 1, 1, 1,
-0.6948311, -1.090673, -2.989689, 1, 1, 1, 1, 1,
-0.6939051, -1.339341, -3.972992, 1, 1, 1, 1, 1,
-0.6891171, -0.967998, -3.059666, 1, 1, 1, 1, 1,
-0.6862199, -0.946263, -3.478233, 0, 0, 1, 1, 1,
-0.6836762, -0.7980087, -0.3886003, 1, 0, 0, 1, 1,
-0.6814167, -0.5557724, -1.243321, 1, 0, 0, 1, 1,
-0.6807142, -1.184725, -2.744544, 1, 0, 0, 1, 1,
-0.6796556, 0.6449171, -0.4904973, 1, 0, 0, 1, 1,
-0.6776409, 0.03341766, -0.2573687, 1, 0, 0, 1, 1,
-0.6768349, -0.2267342, -2.357262, 0, 0, 0, 1, 1,
-0.668179, -0.1672971, -2.272174, 0, 0, 0, 1, 1,
-0.6620054, -0.004054576, -1.863696, 0, 0, 0, 1, 1,
-0.6587479, 1.103477, -2.221364, 0, 0, 0, 1, 1,
-0.6564151, -0.7768313, -2.615059, 0, 0, 0, 1, 1,
-0.655732, 0.3218943, -2.581399, 0, 0, 0, 1, 1,
-0.6541986, -1.313782, -1.424209, 0, 0, 0, 1, 1,
-0.6514022, 1.016642, -0.2060411, 1, 1, 1, 1, 1,
-0.6510943, 1.410116, 1.579303, 1, 1, 1, 1, 1,
-0.6477189, -1.031272, -2.90349, 1, 1, 1, 1, 1,
-0.646807, 0.7847897, -1.938946, 1, 1, 1, 1, 1,
-0.6440704, -1.696138, -2.042867, 1, 1, 1, 1, 1,
-0.6440563, 0.3226432, -3.500512, 1, 1, 1, 1, 1,
-0.6422594, -2.797727, -1.895681, 1, 1, 1, 1, 1,
-0.6375194, 0.6006916, 0.3069276, 1, 1, 1, 1, 1,
-0.6357646, -0.6286737, -2.564466, 1, 1, 1, 1, 1,
-0.6297888, 1.293124, -0.1922743, 1, 1, 1, 1, 1,
-0.6279286, -0.6922715, -1.801556, 1, 1, 1, 1, 1,
-0.615392, -1.097923, -1.651735, 1, 1, 1, 1, 1,
-0.614781, 0.987187, 0.06114695, 1, 1, 1, 1, 1,
-0.6113309, 0.3677971, -0.1239212, 1, 1, 1, 1, 1,
-0.6068935, 0.2728743, -0.1981243, 1, 1, 1, 1, 1,
-0.606823, 1.816396, -0.2355714, 0, 0, 1, 1, 1,
-0.605617, -2.20946, -4.181041, 1, 0, 0, 1, 1,
-0.6039028, -0.0497558, -2.921277, 1, 0, 0, 1, 1,
-0.6009269, -0.02054189, -1.112165, 1, 0, 0, 1, 1,
-0.5967349, 1.273359, -1.830701, 1, 0, 0, 1, 1,
-0.5950474, -1.091116, -2.457964, 1, 0, 0, 1, 1,
-0.5879706, -1.412841, -3.34546, 0, 0, 0, 1, 1,
-0.5859154, 0.5440863, -1.90241, 0, 0, 0, 1, 1,
-0.5852682, 0.6879515, -0.2264959, 0, 0, 0, 1, 1,
-0.5848219, 0.1744688, -2.324908, 0, 0, 0, 1, 1,
-0.5824881, -1.073516, -3.670871, 0, 0, 0, 1, 1,
-0.5807955, 0.4799609, -1.02792, 0, 0, 0, 1, 1,
-0.5692191, -1.819392, -3.608973, 0, 0, 0, 1, 1,
-0.5690844, 2.12891, -1.553524, 1, 1, 1, 1, 1,
-0.5658916, -1.05153, -2.821467, 1, 1, 1, 1, 1,
-0.5637954, 0.6868227, -1.925374, 1, 1, 1, 1, 1,
-0.5631052, -1.853429, -2.770995, 1, 1, 1, 1, 1,
-0.5581585, -0.6498776, -3.085155, 1, 1, 1, 1, 1,
-0.5568475, 0.07450535, -0.7293714, 1, 1, 1, 1, 1,
-0.5517897, 0.8001305, 0.4882156, 1, 1, 1, 1, 1,
-0.5505987, 1.231117, 0.5473409, 1, 1, 1, 1, 1,
-0.5504611, 0.9563982, -0.3884724, 1, 1, 1, 1, 1,
-0.5427088, 0.4964987, -1.128556, 1, 1, 1, 1, 1,
-0.542393, 0.4865144, 0.1079714, 1, 1, 1, 1, 1,
-0.5378408, -0.3168592, -1.725651, 1, 1, 1, 1, 1,
-0.531046, -0.2773661, -2.528997, 1, 1, 1, 1, 1,
-0.5211354, -0.125641, -1.778441, 1, 1, 1, 1, 1,
-0.5143576, -0.2770787, -3.821975, 1, 1, 1, 1, 1,
-0.5128472, 0.3512901, -2.063519, 0, 0, 1, 1, 1,
-0.506194, -1.139745, -1.930997, 1, 0, 0, 1, 1,
-0.5012593, 1.017715, -0.6389149, 1, 0, 0, 1, 1,
-0.5002888, -0.09831714, -0.6702194, 1, 0, 0, 1, 1,
-0.5002441, 0.08500419, -0.3638508, 1, 0, 0, 1, 1,
-0.4985526, 0.1454092, -1.238452, 1, 0, 0, 1, 1,
-0.4957969, -0.5962989, -3.961289, 0, 0, 0, 1, 1,
-0.4927816, -0.195729, -3.020735, 0, 0, 0, 1, 1,
-0.4899473, -0.1644668, -2.58988, 0, 0, 0, 1, 1,
-0.4856292, -0.4829086, -2.079307, 0, 0, 0, 1, 1,
-0.4787302, -1.231864, -3.848867, 0, 0, 0, 1, 1,
-0.4769902, -0.4677268, -1.955056, 0, 0, 0, 1, 1,
-0.4677975, 0.9684258, -1.32336, 0, 0, 0, 1, 1,
-0.4665816, -0.7137855, -2.632685, 1, 1, 1, 1, 1,
-0.4662099, -0.8796396, -2.6053, 1, 1, 1, 1, 1,
-0.4630888, 0.5919764, -1.536972, 1, 1, 1, 1, 1,
-0.4579864, 1.204464, 1.320214, 1, 1, 1, 1, 1,
-0.4552104, 0.02489908, -2.138979, 1, 1, 1, 1, 1,
-0.4537567, 0.02930776, -1.42633, 1, 1, 1, 1, 1,
-0.4534342, 0.9083937, -1.648652, 1, 1, 1, 1, 1,
-0.4459131, -0.07996002, -1.34483, 1, 1, 1, 1, 1,
-0.4447179, 0.5022972, -1.617424, 1, 1, 1, 1, 1,
-0.4413647, -1.685043, -2.832306, 1, 1, 1, 1, 1,
-0.4326595, -0.4612162, -2.929159, 1, 1, 1, 1, 1,
-0.4261414, 0.2162435, -1.598974, 1, 1, 1, 1, 1,
-0.4244171, -1.430941, -2.345472, 1, 1, 1, 1, 1,
-0.4243549, 0.8708598, -0.01407128, 1, 1, 1, 1, 1,
-0.4202932, -0.5053044, -1.873869, 1, 1, 1, 1, 1,
-0.4120579, 0.006852112, -1.261715, 0, 0, 1, 1, 1,
-0.4101607, -0.3475073, -1.168532, 1, 0, 0, 1, 1,
-0.3984744, 0.3348822, -1.02813, 1, 0, 0, 1, 1,
-0.393526, -0.5806708, -0.01279617, 1, 0, 0, 1, 1,
-0.3909941, 0.636427, -0.7397997, 1, 0, 0, 1, 1,
-0.3891749, 0.4657767, -0.9916489, 1, 0, 0, 1, 1,
-0.3870854, -0.693345, -3.524328, 0, 0, 0, 1, 1,
-0.3856618, 0.04193506, -0.9476314, 0, 0, 0, 1, 1,
-0.3852782, -1.815118, -2.995043, 0, 0, 0, 1, 1,
-0.3778932, 2.214586, -0.8863855, 0, 0, 0, 1, 1,
-0.377447, -1.276081, -0.7427533, 0, 0, 0, 1, 1,
-0.376579, 1.84645, -0.3515361, 0, 0, 0, 1, 1,
-0.3764032, 0.8090888, -0.421881, 0, 0, 0, 1, 1,
-0.376064, -0.6885377, -2.865453, 1, 1, 1, 1, 1,
-0.373879, 0.1901491, -1.861803, 1, 1, 1, 1, 1,
-0.3708399, 0.6522255, 0.1839432, 1, 1, 1, 1, 1,
-0.3697677, -0.3751998, -2.662887, 1, 1, 1, 1, 1,
-0.3682753, 1.148478, -1.168077, 1, 1, 1, 1, 1,
-0.3644779, 2.474313, 0.3859179, 1, 1, 1, 1, 1,
-0.3596869, -0.2286403, -2.818692, 1, 1, 1, 1, 1,
-0.3589109, 0.3779392, -2.885989, 1, 1, 1, 1, 1,
-0.3547471, -1.234769, -4.399384, 1, 1, 1, 1, 1,
-0.3524671, -1.729919, -3.986295, 1, 1, 1, 1, 1,
-0.3450903, 1.043997, -0.1184051, 1, 1, 1, 1, 1,
-0.3443445, -0.4327736, -1.980239, 1, 1, 1, 1, 1,
-0.3435431, -1.383346, -3.34096, 1, 1, 1, 1, 1,
-0.3344398, -1.376844, -2.213151, 1, 1, 1, 1, 1,
-0.3334544, -0.7695928, -2.73912, 1, 1, 1, 1, 1,
-0.331537, 0.006823597, -2.900263, 0, 0, 1, 1, 1,
-0.3305762, -1.098159, -2.652062, 1, 0, 0, 1, 1,
-0.3268463, 0.1123098, -2.206349, 1, 0, 0, 1, 1,
-0.319747, -0.2256887, -1.66671, 1, 0, 0, 1, 1,
-0.31971, -0.7160699, -2.800329, 1, 0, 0, 1, 1,
-0.3183357, -0.6984364, -0.9822884, 1, 0, 0, 1, 1,
-0.3182377, -0.2957199, -2.330652, 0, 0, 0, 1, 1,
-0.3139678, 0.09264866, -3.376045, 0, 0, 0, 1, 1,
-0.3130873, 0.1583649, 0.9180413, 0, 0, 0, 1, 1,
-0.3123538, 1.596929, -0.2812486, 0, 0, 0, 1, 1,
-0.3102266, -1.488548, -2.270862, 0, 0, 0, 1, 1,
-0.3081044, -0.2627038, -2.801345, 0, 0, 0, 1, 1,
-0.3076825, -1.591855, -2.654427, 0, 0, 0, 1, 1,
-0.3028274, -0.351692, -3.7265, 1, 1, 1, 1, 1,
-0.2998908, 0.6178853, -1.173189, 1, 1, 1, 1, 1,
-0.2971383, 1.647515, -1.966073, 1, 1, 1, 1, 1,
-0.2963497, -0.5158713, -1.928773, 1, 1, 1, 1, 1,
-0.2928776, 1.119967, 0.9224694, 1, 1, 1, 1, 1,
-0.2892126, -1.521597, -3.489416, 1, 1, 1, 1, 1,
-0.288379, 0.4353737, 1.601396, 1, 1, 1, 1, 1,
-0.2862307, -0.7671078, -2.955775, 1, 1, 1, 1, 1,
-0.2769136, 0.7494391, -0.7916597, 1, 1, 1, 1, 1,
-0.2723755, -1.121031, -4.418493, 1, 1, 1, 1, 1,
-0.2723229, -2.384577, -3.274529, 1, 1, 1, 1, 1,
-0.2678478, -1.881424, -1.639681, 1, 1, 1, 1, 1,
-0.2624855, -2.427809, -2.090812, 1, 1, 1, 1, 1,
-0.2624122, 2.012896, -0.1815272, 1, 1, 1, 1, 1,
-0.2589414, -2.414447, -3.908777, 1, 1, 1, 1, 1,
-0.2587542, 1.360247, 0.3553634, 0, 0, 1, 1, 1,
-0.2571716, -0.9088968, -2.106632, 1, 0, 0, 1, 1,
-0.2555445, 0.623652, 2.13769, 1, 0, 0, 1, 1,
-0.2549282, -1.041191, -2.989536, 1, 0, 0, 1, 1,
-0.2543067, -0.6822072, -2.454777, 1, 0, 0, 1, 1,
-0.2541381, 0.1844353, -2.831749, 1, 0, 0, 1, 1,
-0.2526852, -1.153556, -2.491302, 0, 0, 0, 1, 1,
-0.2522761, -0.02218, -1.689333, 0, 0, 0, 1, 1,
-0.2503531, -0.146081, -1.813093, 0, 0, 0, 1, 1,
-0.2457738, 0.828193, -1.759242, 0, 0, 0, 1, 1,
-0.2365669, -0.8483179, -2.509921, 0, 0, 0, 1, 1,
-0.2361522, -0.7907165, -2.576041, 0, 0, 0, 1, 1,
-0.2350692, 0.3030255, -0.9949134, 0, 0, 0, 1, 1,
-0.2336917, -1.185267, -5.413009, 1, 1, 1, 1, 1,
-0.2315851, 0.9148799, -0.931871, 1, 1, 1, 1, 1,
-0.2259729, 1.033365, -0.2644476, 1, 1, 1, 1, 1,
-0.2204398, -0.5058658, -3.62132, 1, 1, 1, 1, 1,
-0.2169673, -0.07267428, -1.077669, 1, 1, 1, 1, 1,
-0.2114854, -0.9519317, -2.934138, 1, 1, 1, 1, 1,
-0.2081488, -0.7040963, -2.987009, 1, 1, 1, 1, 1,
-0.2044275, -0.8181984, -2.649288, 1, 1, 1, 1, 1,
-0.2034893, 0.6021956, -0.3998928, 1, 1, 1, 1, 1,
-0.2029187, 0.1579978, -0.9562041, 1, 1, 1, 1, 1,
-0.2020839, -0.8995568, -3.869296, 1, 1, 1, 1, 1,
-0.1994706, -2.720689, -2.577562, 1, 1, 1, 1, 1,
-0.196971, 0.5117916, -0.0659686, 1, 1, 1, 1, 1,
-0.1894905, -1.048483, -3.578915, 1, 1, 1, 1, 1,
-0.188946, 0.4711968, -2.167688, 1, 1, 1, 1, 1,
-0.1882604, -1.831898, -3.524249, 0, 0, 1, 1, 1,
-0.1790936, 1.066401, 0.06096259, 1, 0, 0, 1, 1,
-0.178509, 0.2910425, -0.9684674, 1, 0, 0, 1, 1,
-0.1777616, 0.9961854, 0.9490045, 1, 0, 0, 1, 1,
-0.1692439, 0.8376064, 1.322932, 1, 0, 0, 1, 1,
-0.1668791, 0.4466552, -0.2529391, 1, 0, 0, 1, 1,
-0.1647519, 0.4981913, 0.5328491, 0, 0, 0, 1, 1,
-0.1603539, -0.2246599, -1.331629, 0, 0, 0, 1, 1,
-0.1586885, 0.6550202, 0.9609593, 0, 0, 0, 1, 1,
-0.1562934, -0.3939475, -2.214772, 0, 0, 0, 1, 1,
-0.1524707, 1.175822, 0.02076196, 0, 0, 0, 1, 1,
-0.1499357, 0.09726944, -0.7345132, 0, 0, 0, 1, 1,
-0.1493467, 0.245074, 0.6888824, 0, 0, 0, 1, 1,
-0.1479307, 0.7777627, 0.7653309, 1, 1, 1, 1, 1,
-0.1473991, -1.403755, -2.439799, 1, 1, 1, 1, 1,
-0.1384279, -0.8002099, -3.338619, 1, 1, 1, 1, 1,
-0.1377642, 1.228963, 0.2621273, 1, 1, 1, 1, 1,
-0.1313036, 1.137612, 0.4659955, 1, 1, 1, 1, 1,
-0.1305517, -3.256215, -2.364038, 1, 1, 1, 1, 1,
-0.1236019, 0.8190758, 1.196129, 1, 1, 1, 1, 1,
-0.1207042, -0.8763564, -2.501053, 1, 1, 1, 1, 1,
-0.1195101, -0.4826619, -4.430742, 1, 1, 1, 1, 1,
-0.1193111, 1.044646, -1.175724, 1, 1, 1, 1, 1,
-0.115553, -0.4941905, -3.589321, 1, 1, 1, 1, 1,
-0.1044435, -0.3097111, -2.734996, 1, 1, 1, 1, 1,
-0.1021109, -0.4300724, -4.098348, 1, 1, 1, 1, 1,
-0.1007339, -0.5107062, -3.647764, 1, 1, 1, 1, 1,
-0.09524465, -0.01974144, -1.542561, 1, 1, 1, 1, 1,
-0.09339337, 0.3352761, 0.3008601, 0, 0, 1, 1, 1,
-0.08988775, 0.9916629, -0.5184425, 1, 0, 0, 1, 1,
-0.08859792, 0.4456606, 0.9819484, 1, 0, 0, 1, 1,
-0.08608959, -1.566907, -4.163262, 1, 0, 0, 1, 1,
-0.08511548, 0.511394, -0.2282341, 1, 0, 0, 1, 1,
-0.08353689, -0.3997139, -4.278974, 1, 0, 0, 1, 1,
-0.07720054, 0.9392939, 0.1571441, 0, 0, 0, 1, 1,
-0.07508025, -0.4877755, -4.351062, 0, 0, 0, 1, 1,
-0.07479745, 0.8255029, -0.0591599, 0, 0, 0, 1, 1,
-0.07316049, 0.06324882, -1.529215, 0, 0, 0, 1, 1,
-0.07237671, -0.5252807, -2.56051, 0, 0, 0, 1, 1,
-0.07091143, -0.1424558, -3.830796, 0, 0, 0, 1, 1,
-0.06927278, 0.4153476, 1.264413, 0, 0, 0, 1, 1,
-0.06621694, -1.570237, -2.359535, 1, 1, 1, 1, 1,
-0.06594408, -0.0977119, -1.33048, 1, 1, 1, 1, 1,
-0.06584379, -0.6500897, -2.951451, 1, 1, 1, 1, 1,
-0.06550951, -0.7617111, -4.083905, 1, 1, 1, 1, 1,
-0.06524677, -1.158424, -2.32264, 1, 1, 1, 1, 1,
-0.06315313, -0.1322991, -2.694984, 1, 1, 1, 1, 1,
-0.06070492, 1.550244, -0.02299183, 1, 1, 1, 1, 1,
-0.06024102, 0.1329957, -2.037807, 1, 1, 1, 1, 1,
-0.0598627, -0.187733, -4.399111, 1, 1, 1, 1, 1,
-0.05406413, -0.07870501, -2.293083, 1, 1, 1, 1, 1,
-0.05312584, -0.2453464, -4.790092, 1, 1, 1, 1, 1,
-0.05173271, -0.946078, -2.323813, 1, 1, 1, 1, 1,
-0.04532394, -0.6753101, -2.257111, 1, 1, 1, 1, 1,
-0.04392883, 0.6518865, 0.1998835, 1, 1, 1, 1, 1,
-0.0432939, -0.1448468, -2.900592, 1, 1, 1, 1, 1,
-0.04162233, 1.136794, 1.066728, 0, 0, 1, 1, 1,
-0.03714374, -0.4955879, -3.662353, 1, 0, 0, 1, 1,
-0.03659062, -1.736623, -5.638912, 1, 0, 0, 1, 1,
-0.03512, 0.4933494, 0.4928253, 1, 0, 0, 1, 1,
-0.03131866, -0.5047317, -1.963345, 1, 0, 0, 1, 1,
-0.03120674, 0.345078, -0.4343641, 1, 0, 0, 1, 1,
-0.03029032, 0.3531154, -0.4022441, 0, 0, 0, 1, 1,
-0.0246126, 1.819261, -0.3480466, 0, 0, 0, 1, 1,
-0.02255064, -0.9965499, -1.667007, 0, 0, 0, 1, 1,
-0.0190073, 0.550091, 0.9912276, 0, 0, 0, 1, 1,
-0.01318559, -1.20602, -4.195583, 0, 0, 0, 1, 1,
-0.01248075, -0.9588838, -4.632312, 0, 0, 0, 1, 1,
-0.007918533, -1.602131, -3.175318, 0, 0, 0, 1, 1,
-0.007386473, 0.1095835, -0.2067314, 1, 1, 1, 1, 1,
-0.004892057, -0.4899669, -3.711187, 1, 1, 1, 1, 1,
-0.003644843, -0.7433699, -2.71762, 1, 1, 1, 1, 1,
-0.001456705, 1.751485, -0.5019568, 1, 1, 1, 1, 1,
-0.001398509, -0.505634, -2.683435, 1, 1, 1, 1, 1,
-0.001059175, 1.412009, -1.206501, 1, 1, 1, 1, 1,
0.0002336815, 0.09509225, 0.3639711, 1, 1, 1, 1, 1,
0.0006146401, -0.06339902, 4.02738, 1, 1, 1, 1, 1,
0.001556286, 0.01727257, -0.7124937, 1, 1, 1, 1, 1,
0.002845482, 0.7589036, -1.387824, 1, 1, 1, 1, 1,
0.006948677, 1.433758, 0.3497415, 1, 1, 1, 1, 1,
0.007177531, 1.115352, -1.02993, 1, 1, 1, 1, 1,
0.007600532, 0.1778688, -0.3251386, 1, 1, 1, 1, 1,
0.009721089, -1.093683, 2.960491, 1, 1, 1, 1, 1,
0.01088877, -0.2165804, 2.037436, 1, 1, 1, 1, 1,
0.01169329, 1.034092, -0.2217466, 0, 0, 1, 1, 1,
0.01457503, -0.7839897, 1.33553, 1, 0, 0, 1, 1,
0.01490869, -0.07870679, 1.431713, 1, 0, 0, 1, 1,
0.0242981, -0.7194902, 4.414046, 1, 0, 0, 1, 1,
0.02492329, 0.4056139, -0.06711104, 1, 0, 0, 1, 1,
0.02982194, -1.099419, 4.044593, 1, 0, 0, 1, 1,
0.03334333, 0.07744243, 1.240226, 0, 0, 0, 1, 1,
0.03421434, -0.6112732, 2.364213, 0, 0, 0, 1, 1,
0.03508846, -1.473755, 3.532326, 0, 0, 0, 1, 1,
0.03716046, -0.7583802, 2.396818, 0, 0, 0, 1, 1,
0.04070338, -0.06794462, 3.016127, 0, 0, 0, 1, 1,
0.04080366, -1.034593, 2.936676, 0, 0, 0, 1, 1,
0.04622699, 1.651296, 0.1912756, 0, 0, 0, 1, 1,
0.05234764, -0.3134707, 3.643543, 1, 1, 1, 1, 1,
0.05701354, -0.1080603, 1.878045, 1, 1, 1, 1, 1,
0.05778388, -0.3315797, 2.577502, 1, 1, 1, 1, 1,
0.0578828, 0.6879742, 1.00976, 1, 1, 1, 1, 1,
0.06082611, -0.5586702, 3.163578, 1, 1, 1, 1, 1,
0.06419749, 1.380418, 0.7611797, 1, 1, 1, 1, 1,
0.06806969, 0.7675748, 0.5988839, 1, 1, 1, 1, 1,
0.07016179, -2.172185, 3.240608, 1, 1, 1, 1, 1,
0.07772205, -0.8919535, 2.771906, 1, 1, 1, 1, 1,
0.07883663, -1.16356, 2.291534, 1, 1, 1, 1, 1,
0.0807668, -1.201122, 2.944772, 1, 1, 1, 1, 1,
0.08151893, -0.3328114, 3.1767, 1, 1, 1, 1, 1,
0.08277541, 0.7811629, -0.7091404, 1, 1, 1, 1, 1,
0.08507463, 0.002384463, 2.173405, 1, 1, 1, 1, 1,
0.08733884, 1.191337, -1.227068, 1, 1, 1, 1, 1,
0.0879738, 1.179792, -0.7855999, 0, 0, 1, 1, 1,
0.09148812, -1.535185, 2.494372, 1, 0, 0, 1, 1,
0.09205314, 1.049602, 1.13905, 1, 0, 0, 1, 1,
0.09268945, 1.230098, 0.5738636, 1, 0, 0, 1, 1,
0.09455736, -1.122381, 2.795274, 1, 0, 0, 1, 1,
0.09577455, 0.02882709, 1.26605, 1, 0, 0, 1, 1,
0.1004138, 0.453818, -0.0105103, 0, 0, 0, 1, 1,
0.1021437, 0.5580091, -1.393362, 0, 0, 0, 1, 1,
0.1055591, 0.6307573, -1.935889, 0, 0, 0, 1, 1,
0.1066199, 0.6765442, -0.4786941, 0, 0, 0, 1, 1,
0.1089649, 0.6772276, -0.9705874, 0, 0, 0, 1, 1,
0.1095979, -0.2913752, 4.66759, 0, 0, 0, 1, 1,
0.1132476, 0.8042049, 0.3112612, 0, 0, 0, 1, 1,
0.1140925, -0.7464552, 3.465084, 1, 1, 1, 1, 1,
0.1172479, 1.048779, 1.640789, 1, 1, 1, 1, 1,
0.1209225, -0.3667583, 2.528635, 1, 1, 1, 1, 1,
0.1247784, -0.3989122, 4.289438, 1, 1, 1, 1, 1,
0.1276663, -0.3633252, 3.661224, 1, 1, 1, 1, 1,
0.1345981, 1.251676, -1.296065, 1, 1, 1, 1, 1,
0.1373855, -1.030002, 3.398221, 1, 1, 1, 1, 1,
0.1382192, 0.4762105, 0.1955078, 1, 1, 1, 1, 1,
0.1386757, -1.827351, 4.630295, 1, 1, 1, 1, 1,
0.142787, -0.9419748, 3.640225, 1, 1, 1, 1, 1,
0.1432158, -0.03911299, 2.89138, 1, 1, 1, 1, 1,
0.1469519, 0.7651162, 0.233201, 1, 1, 1, 1, 1,
0.1512716, 1.159566, -0.2852784, 1, 1, 1, 1, 1,
0.1531102, 1.557045, 0.9100483, 1, 1, 1, 1, 1,
0.1548225, -0.2767898, 2.976791, 1, 1, 1, 1, 1,
0.1575858, -0.656337, 3.302727, 0, 0, 1, 1, 1,
0.1626015, -0.2071113, 1.771809, 1, 0, 0, 1, 1,
0.163428, -0.9361085, 4.578905, 1, 0, 0, 1, 1,
0.1642032, 1.26445, 0.9688253, 1, 0, 0, 1, 1,
0.172152, -0.3418376, 1.499852, 1, 0, 0, 1, 1,
0.1727092, 0.6959449, -0.9784505, 1, 0, 0, 1, 1,
0.1746427, 1.142452, -0.1546337, 0, 0, 0, 1, 1,
0.1750173, 0.8776222, 0.2225992, 0, 0, 0, 1, 1,
0.1797206, 0.8601356, 0.4573283, 0, 0, 0, 1, 1,
0.180822, -1.488276, 2.685287, 0, 0, 0, 1, 1,
0.1812911, 0.3054046, -0.02047497, 0, 0, 0, 1, 1,
0.1831174, -1.411072, 3.557799, 0, 0, 0, 1, 1,
0.1831793, 1.167038, 0.6727444, 0, 0, 0, 1, 1,
0.1867492, -1.76839, 3.495114, 1, 1, 1, 1, 1,
0.187909, -0.8954964, 3.529933, 1, 1, 1, 1, 1,
0.1933003, 0.3905622, 0.2474604, 1, 1, 1, 1, 1,
0.1936547, 0.2400461, -0.4950547, 1, 1, 1, 1, 1,
0.1940497, -0.5100656, 2.158898, 1, 1, 1, 1, 1,
0.1952299, -0.9217864, 4.410579, 1, 1, 1, 1, 1,
0.1952483, 1.564621, 1.502755, 1, 1, 1, 1, 1,
0.1955228, 0.4540192, -0.1894615, 1, 1, 1, 1, 1,
0.1961763, 0.1746787, -0.6673076, 1, 1, 1, 1, 1,
0.1970454, 0.04307094, 1.710756, 1, 1, 1, 1, 1,
0.1983434, 1.32522, 0.007232507, 1, 1, 1, 1, 1,
0.2009212, 0.0538409, 0.7987916, 1, 1, 1, 1, 1,
0.2072622, 0.1188511, 0.1583695, 1, 1, 1, 1, 1,
0.2080651, -2.271497, 3.532215, 1, 1, 1, 1, 1,
0.210077, -2.201543, 3.688006, 1, 1, 1, 1, 1,
0.2106659, -0.3537483, 2.321558, 0, 0, 1, 1, 1,
0.210909, -0.1427169, 3.371708, 1, 0, 0, 1, 1,
0.2122667, 1.107014, -1.367268, 1, 0, 0, 1, 1,
0.2139078, 1.230407, 1.717692, 1, 0, 0, 1, 1,
0.2192366, -0.6821312, 2.337708, 1, 0, 0, 1, 1,
0.2197264, 0.1576301, 0.5862118, 1, 0, 0, 1, 1,
0.2219635, 2.744005, -1.891675, 0, 0, 0, 1, 1,
0.2298196, 1.694206, -0.1521885, 0, 0, 0, 1, 1,
0.2314494, 0.7579829, -0.0518334, 0, 0, 0, 1, 1,
0.2327297, 0.07654248, -0.2790287, 0, 0, 0, 1, 1,
0.2350567, 1.400962, -1.387329, 0, 0, 0, 1, 1,
0.2427596, 0.8971704, 1.744564, 0, 0, 0, 1, 1,
0.2429186, 1.46077, 0.8874882, 0, 0, 0, 1, 1,
0.2482628, -0.4516544, 1.980532, 1, 1, 1, 1, 1,
0.2510345, -0.8879534, 0.6741657, 1, 1, 1, 1, 1,
0.2510481, -1.100845, 2.319363, 1, 1, 1, 1, 1,
0.2512273, 0.233245, 1.354838, 1, 1, 1, 1, 1,
0.2512572, -0.05157962, 2.066211, 1, 1, 1, 1, 1,
0.2598367, -1.651086, 3.804477, 1, 1, 1, 1, 1,
0.2623591, 1.311011, 0.1839362, 1, 1, 1, 1, 1,
0.2632379, -0.2948309, 3.344948, 1, 1, 1, 1, 1,
0.2646866, 2.133289, 0.3504778, 1, 1, 1, 1, 1,
0.2657295, -0.6568878, 2.595614, 1, 1, 1, 1, 1,
0.2674645, -1.595364, 3.039218, 1, 1, 1, 1, 1,
0.2675661, -2.094888, 2.781915, 1, 1, 1, 1, 1,
0.2680404, 0.2123156, 0.9593771, 1, 1, 1, 1, 1,
0.2694586, -0.7937552, 2.015331, 1, 1, 1, 1, 1,
0.2708683, 1.05872, 0.1193668, 1, 1, 1, 1, 1,
0.2718195, 1.122555, -0.8166926, 0, 0, 1, 1, 1,
0.2726274, 0.3190261, 0.9448509, 1, 0, 0, 1, 1,
0.2727803, -0.5510266, 0.9624732, 1, 0, 0, 1, 1,
0.2729229, -1.058117, 4.61024, 1, 0, 0, 1, 1,
0.2752895, 0.2206249, 2.664618, 1, 0, 0, 1, 1,
0.2754935, 0.3800455, 2.583114, 1, 0, 0, 1, 1,
0.2758806, 0.9983356, 1.060354, 0, 0, 0, 1, 1,
0.2784978, 0.7045068, -0.137738, 0, 0, 0, 1, 1,
0.2809854, -0.6801068, 1.073831, 0, 0, 0, 1, 1,
0.2846598, -1.474328, 4.561344, 0, 0, 0, 1, 1,
0.2850278, -1.025365, 2.775887, 0, 0, 0, 1, 1,
0.2859864, -0.1150217, 1.556751, 0, 0, 0, 1, 1,
0.2868673, 0.8842992, 1.659229, 0, 0, 0, 1, 1,
0.2900307, -0.7146676, 2.872527, 1, 1, 1, 1, 1,
0.2909712, 1.220417, 1.486901, 1, 1, 1, 1, 1,
0.2911468, 0.6633236, 2.151752, 1, 1, 1, 1, 1,
0.2922151, 0.9037148, 2.450658, 1, 1, 1, 1, 1,
0.2976821, -0.6729257, 1.150701, 1, 1, 1, 1, 1,
0.2977357, 0.9978664, -0.4583039, 1, 1, 1, 1, 1,
0.3062787, 0.3585138, -0.17899, 1, 1, 1, 1, 1,
0.3088458, -1.162438, 1.305192, 1, 1, 1, 1, 1,
0.3191108, -2.017136, 3.289082, 1, 1, 1, 1, 1,
0.3194079, -0.4945315, 3.809759, 1, 1, 1, 1, 1,
0.3198131, -0.5388579, 1.37282, 1, 1, 1, 1, 1,
0.3242539, 1.540952, 0.5156444, 1, 1, 1, 1, 1,
0.32809, 0.6514211, -0.386487, 1, 1, 1, 1, 1,
0.3293673, 0.5576451, -1.332824, 1, 1, 1, 1, 1,
0.3298051, -0.1065112, 1.26639, 1, 1, 1, 1, 1,
0.3307928, -0.9169602, 3.244067, 0, 0, 1, 1, 1,
0.3342813, -0.4486195, 3.43658, 1, 0, 0, 1, 1,
0.3350247, -1.782863, 3.977276, 1, 0, 0, 1, 1,
0.3366329, 0.9551011, -0.8318589, 1, 0, 0, 1, 1,
0.33854, -0.7446362, 3.859801, 1, 0, 0, 1, 1,
0.3385639, -0.5951025, 2.202898, 1, 0, 0, 1, 1,
0.3416027, -0.03916895, 3.551268, 0, 0, 0, 1, 1,
0.3424883, -0.4302243, 3.737033, 0, 0, 0, 1, 1,
0.3436224, -1.04768, 2.062756, 0, 0, 0, 1, 1,
0.3446103, 0.7846272, 0.1534873, 0, 0, 0, 1, 1,
0.34787, 2.158616, -0.7190366, 0, 0, 0, 1, 1,
0.3512205, 0.6608382, 0.8283235, 0, 0, 0, 1, 1,
0.3537937, -0.9514808, 2.945958, 0, 0, 0, 1, 1,
0.3586279, 1.491388, 1.084874, 1, 1, 1, 1, 1,
0.3634833, -1.078674, 4.42253, 1, 1, 1, 1, 1,
0.3645064, 1.220767, 1.561947, 1, 1, 1, 1, 1,
0.3686746, -0.8503975, 3.327348, 1, 1, 1, 1, 1,
0.3695095, 0.2882587, 0.4607639, 1, 1, 1, 1, 1,
0.3743483, -0.1980073, 2.236682, 1, 1, 1, 1, 1,
0.3764289, 0.7860088, 0.1116785, 1, 1, 1, 1, 1,
0.3782049, -1.364458, 2.661248, 1, 1, 1, 1, 1,
0.3858496, 1.810811, -0.09347684, 1, 1, 1, 1, 1,
0.3897015, 1.112473, 1.240984, 1, 1, 1, 1, 1,
0.3924265, 1.508388, 0.3528673, 1, 1, 1, 1, 1,
0.3933696, 1.018291, 1.159132, 1, 1, 1, 1, 1,
0.3981048, 0.1314471, 0.06660748, 1, 1, 1, 1, 1,
0.4013439, -0.6606942, 2.051023, 1, 1, 1, 1, 1,
0.4032511, 0.01239199, 1.310628, 1, 1, 1, 1, 1,
0.4067379, -0.5560683, 2.70839, 0, 0, 1, 1, 1,
0.4076666, 0.9880165, 0.8296797, 1, 0, 0, 1, 1,
0.4080279, -0.09340765, 2.097772, 1, 0, 0, 1, 1,
0.4088854, -0.122924, 0.80068, 1, 0, 0, 1, 1,
0.4119313, -0.3439118, 3.543527, 1, 0, 0, 1, 1,
0.4147609, 1.629747, -0.2252079, 1, 0, 0, 1, 1,
0.4188274, -0.2067185, 1.625368, 0, 0, 0, 1, 1,
0.4281662, -0.8046496, 2.46333, 0, 0, 0, 1, 1,
0.4335148, 0.6033422, -0.5909269, 0, 0, 0, 1, 1,
0.438904, 1.228272, 0.5518163, 0, 0, 0, 1, 1,
0.4433912, -0.2261567, 3.49191, 0, 0, 0, 1, 1,
0.444085, -0.3057204, 1.418653, 0, 0, 0, 1, 1,
0.4442314, -0.8390083, 3.764548, 0, 0, 0, 1, 1,
0.4530796, -0.8586704, 3.498772, 1, 1, 1, 1, 1,
0.4537078, 0.9157642, 0.6187958, 1, 1, 1, 1, 1,
0.4539374, 1.069153, 0.1227864, 1, 1, 1, 1, 1,
0.4543152, 0.5617967, -0.3243863, 1, 1, 1, 1, 1,
0.4626193, -0.1391601, 1.806484, 1, 1, 1, 1, 1,
0.4678479, 0.3607405, 0.6852216, 1, 1, 1, 1, 1,
0.4687302, 0.9171796, 0.8659055, 1, 1, 1, 1, 1,
0.4705578, -0.2910106, 3.210858, 1, 1, 1, 1, 1,
0.476338, 0.5597051, -0.2718267, 1, 1, 1, 1, 1,
0.4789088, -0.9960425, 3.342318, 1, 1, 1, 1, 1,
0.4809359, 0.9291432, -1.014932, 1, 1, 1, 1, 1,
0.4825933, 0.01337709, 0.7416604, 1, 1, 1, 1, 1,
0.4855671, 0.03325133, 0.04945484, 1, 1, 1, 1, 1,
0.488418, -1.304533, 2.689049, 1, 1, 1, 1, 1,
0.5014821, -0.7763715, 1.985, 1, 1, 1, 1, 1,
0.5039611, -0.1579191, 2.795403, 0, 0, 1, 1, 1,
0.5093892, -0.1154137, 3.469431, 1, 0, 0, 1, 1,
0.5142905, -0.7706563, 3.912614, 1, 0, 0, 1, 1,
0.5190819, 0.7298061, 0.5541884, 1, 0, 0, 1, 1,
0.5225969, 0.224719, 1.489202, 1, 0, 0, 1, 1,
0.5227495, 1.159278, 0.5252709, 1, 0, 0, 1, 1,
0.5261008, -0.1700595, 1.219474, 0, 0, 0, 1, 1,
0.5281972, -0.05205507, 1.598443, 0, 0, 0, 1, 1,
0.5289782, -0.6007433, 2.197789, 0, 0, 0, 1, 1,
0.5392579, -0.3587223, 3.168654, 0, 0, 0, 1, 1,
0.5395323, 0.9068435, -0.3201898, 0, 0, 0, 1, 1,
0.5419252, -0.7963631, 2.183322, 0, 0, 0, 1, 1,
0.5425097, 0.3249007, -0.1277066, 0, 0, 0, 1, 1,
0.542703, -0.3452124, 1.016941, 1, 1, 1, 1, 1,
0.5443523, 0.6603942, -0.4547614, 1, 1, 1, 1, 1,
0.5445102, -0.1779349, 3.008891, 1, 1, 1, 1, 1,
0.5489281, 0.9409006, 1.332672, 1, 1, 1, 1, 1,
0.5532937, 1.166194, 1.657509, 1, 1, 1, 1, 1,
0.5533413, -0.1316119, 3.009622, 1, 1, 1, 1, 1,
0.5570083, 0.3213698, 2.366777, 1, 1, 1, 1, 1,
0.561496, -1.112118, 2.398113, 1, 1, 1, 1, 1,
0.566282, 0.2930261, 1.331812, 1, 1, 1, 1, 1,
0.5679777, 0.8399, -0.259786, 1, 1, 1, 1, 1,
0.5781846, -1.173819, 2.073758, 1, 1, 1, 1, 1,
0.5791853, 0.06739588, 0.01628705, 1, 1, 1, 1, 1,
0.5793291, -0.03831793, 1.179948, 1, 1, 1, 1, 1,
0.5800522, -0.2632296, 2.694, 1, 1, 1, 1, 1,
0.5817859, -0.5011289, 1.982866, 1, 1, 1, 1, 1,
0.5828044, -0.2782301, 2.334872, 0, 0, 1, 1, 1,
0.5849705, 0.6186355, -0.0378658, 1, 0, 0, 1, 1,
0.5855765, -0.1957252, -0.005507416, 1, 0, 0, 1, 1,
0.5873021, -0.4165427, 2.304203, 1, 0, 0, 1, 1,
0.5890319, -0.3339419, 3.267403, 1, 0, 0, 1, 1,
0.5893404, 1.075573, -0.1073962, 1, 0, 0, 1, 1,
0.5902165, 0.01371099, 1.202293, 0, 0, 0, 1, 1,
0.5917408, 0.2687806, 0.2891619, 0, 0, 0, 1, 1,
0.5970239, 0.1429999, 1.434138, 0, 0, 0, 1, 1,
0.5981536, -0.9740007, 2.327299, 0, 0, 0, 1, 1,
0.6076885, 0.7260871, 1.997052, 0, 0, 0, 1, 1,
0.6084991, 1.63001, 1.264705, 0, 0, 0, 1, 1,
0.6214812, -1.016862, 1.711271, 0, 0, 0, 1, 1,
0.6216676, -0.49647, 3.071347, 1, 1, 1, 1, 1,
0.6234491, 1.353077, -0.2834477, 1, 1, 1, 1, 1,
0.6266088, 0.6931587, 1.986918, 1, 1, 1, 1, 1,
0.6286358, -1.432905, 3.157081, 1, 1, 1, 1, 1,
0.6335126, -0.4551062, 2.098687, 1, 1, 1, 1, 1,
0.6349486, 0.8385984, -0.5485119, 1, 1, 1, 1, 1,
0.648231, 0.7778012, 1.434139, 1, 1, 1, 1, 1,
0.648953, 0.4632047, -0.8637819, 1, 1, 1, 1, 1,
0.6495181, 0.5988302, 2.319131, 1, 1, 1, 1, 1,
0.6650173, 1.843996, 0.1587475, 1, 1, 1, 1, 1,
0.666253, -0.971957, 0.08400473, 1, 1, 1, 1, 1,
0.687147, 0.02931337, 3.16924, 1, 1, 1, 1, 1,
0.6896619, -0.9889531, 3.519929, 1, 1, 1, 1, 1,
0.6914687, -0.5336939, 1.149359, 1, 1, 1, 1, 1,
0.6965781, 0.3304967, 1.611165, 1, 1, 1, 1, 1,
0.6973432, -1.137813, 1.956931, 0, 0, 1, 1, 1,
0.6978712, 0.6137471, 1.832325, 1, 0, 0, 1, 1,
0.6990746, 0.3968025, -0.349545, 1, 0, 0, 1, 1,
0.699994, -0.3908398, 1.095941, 1, 0, 0, 1, 1,
0.7003022, 0.0008537784, -0.5264761, 1, 0, 0, 1, 1,
0.7025539, 0.5210345, 1.887774, 1, 0, 0, 1, 1,
0.7045396, 0.03495137, 1.435141, 0, 0, 0, 1, 1,
0.7046104, -2.328763, 2.21509, 0, 0, 0, 1, 1,
0.7096037, -0.156234, 1.361137, 0, 0, 0, 1, 1,
0.7104771, -0.6262605, 2.363431, 0, 0, 0, 1, 1,
0.7121346, 2.190082, 0.2961482, 0, 0, 0, 1, 1,
0.7151406, -0.6494855, 1.023915, 0, 0, 0, 1, 1,
0.7170814, -0.8594385, 1.336921, 0, 0, 0, 1, 1,
0.7222574, -0.8350127, 2.28062, 1, 1, 1, 1, 1,
0.7243535, -0.6126304, 2.769711, 1, 1, 1, 1, 1,
0.7258304, 0.8651428, -0.0403, 1, 1, 1, 1, 1,
0.7277269, -0.752217, 3.159764, 1, 1, 1, 1, 1,
0.7313797, -0.3477015, 3.74974, 1, 1, 1, 1, 1,
0.7319375, 0.4757189, 2.360518, 1, 1, 1, 1, 1,
0.7340283, -0.08871926, 1.430304, 1, 1, 1, 1, 1,
0.7359776, 0.2589488, 0.2668271, 1, 1, 1, 1, 1,
0.7374884, -0.03662344, 2.869911, 1, 1, 1, 1, 1,
0.7382178, 0.4955116, 2.051973, 1, 1, 1, 1, 1,
0.741827, 0.5455987, 0.1634377, 1, 1, 1, 1, 1,
0.7434894, 0.1127287, 2.277047, 1, 1, 1, 1, 1,
0.7436633, -1.002901, 2.023412, 1, 1, 1, 1, 1,
0.7511662, 1.966125, 0.7614648, 1, 1, 1, 1, 1,
0.7517101, -0.6748496, 2.961489, 1, 1, 1, 1, 1,
0.7550003, -1.014527, 1.849155, 0, 0, 1, 1, 1,
0.7598667, 0.4021147, 0.5118579, 1, 0, 0, 1, 1,
0.7618444, -1.305819, 2.031626, 1, 0, 0, 1, 1,
0.762264, -0.490428, 4.005289, 1, 0, 0, 1, 1,
0.770713, -0.7277984, 0.1928677, 1, 0, 0, 1, 1,
0.7733234, -0.3618989, 3.988272, 1, 0, 0, 1, 1,
0.783384, 1.145705, 1.086179, 0, 0, 0, 1, 1,
0.783636, 1.719245, 2.130679, 0, 0, 0, 1, 1,
0.7891605, 0.2949209, -1.440404, 0, 0, 0, 1, 1,
0.7892364, 0.9992616, 1.611395, 0, 0, 0, 1, 1,
0.7956686, -1.689424, 3.101045, 0, 0, 0, 1, 1,
0.8045895, 0.3082003, 1.283249, 0, 0, 0, 1, 1,
0.8099811, 0.2606224, -1.43372, 0, 0, 0, 1, 1,
0.816368, -0.03731379, 1.426329, 1, 1, 1, 1, 1,
0.8174387, 0.4738074, 1.769997, 1, 1, 1, 1, 1,
0.8253309, 0.8465043, -0.3146818, 1, 1, 1, 1, 1,
0.8264608, 2.158836, 2.225912, 1, 1, 1, 1, 1,
0.8282284, -0.4686952, 2.420178, 1, 1, 1, 1, 1,
0.8297157, 1.432506, 1.128358, 1, 1, 1, 1, 1,
0.8309431, 0.5503966, 1.0508, 1, 1, 1, 1, 1,
0.8334288, 0.9058517, 2.08923, 1, 1, 1, 1, 1,
0.8341966, -0.9007172, 2.910516, 1, 1, 1, 1, 1,
0.8443854, 1.132862, -0.229764, 1, 1, 1, 1, 1,
0.852201, 0.44799, 0.5732761, 1, 1, 1, 1, 1,
0.8546606, -1.033616, 1.407007, 1, 1, 1, 1, 1,
0.8555109, 0.9138638, 0.796638, 1, 1, 1, 1, 1,
0.863362, -1.042222, 0.4231576, 1, 1, 1, 1, 1,
0.8659106, -1.595291, 3.464087, 1, 1, 1, 1, 1,
0.8765292, 0.7769766, 1.172937, 0, 0, 1, 1, 1,
0.8776448, -0.4473346, 0.5154321, 1, 0, 0, 1, 1,
0.8792155, 0.3923636, 1.450443, 1, 0, 0, 1, 1,
0.8807036, -0.4264075, 0.009501521, 1, 0, 0, 1, 1,
0.886218, -0.0355543, 2.604097, 1, 0, 0, 1, 1,
0.887053, -0.5905848, 1.649706, 1, 0, 0, 1, 1,
0.8881671, -0.002720401, 1.540549, 0, 0, 0, 1, 1,
0.8905542, -1.415501, 3.525351, 0, 0, 0, 1, 1,
0.9029005, -0.6635788, 2.624101, 0, 0, 0, 1, 1,
0.911085, -0.7583643, 3.215046, 0, 0, 0, 1, 1,
0.9142648, -0.1588774, 2.114645, 0, 0, 0, 1, 1,
0.9156026, -0.6630279, 2.243459, 0, 0, 0, 1, 1,
0.9319806, 0.3490905, 1.128244, 0, 0, 0, 1, 1,
0.9372034, -0.8287486, 4.148331, 1, 1, 1, 1, 1,
0.941914, 2.219451, 1.035678, 1, 1, 1, 1, 1,
0.9433005, -0.2549756, -0.6392648, 1, 1, 1, 1, 1,
0.9437698, 0.2093377, 1.53702, 1, 1, 1, 1, 1,
0.9481416, -0.7974712, 2.210167, 1, 1, 1, 1, 1,
0.9510381, 1.231429, -0.02590522, 1, 1, 1, 1, 1,
0.9514858, 0.7049097, 1.486909, 1, 1, 1, 1, 1,
0.9516597, 0.8562695, 1.357619, 1, 1, 1, 1, 1,
0.9572592, 0.1705868, 0.8593076, 1, 1, 1, 1, 1,
0.9606816, -0.4735856, 3.397678, 1, 1, 1, 1, 1,
0.9644744, -0.9271858, 2.451353, 1, 1, 1, 1, 1,
0.9686741, 1.114602, -1.251963, 1, 1, 1, 1, 1,
0.9703263, -0.3211234, 1.969735, 1, 1, 1, 1, 1,
0.9704997, 0.7620313, 1.487216, 1, 1, 1, 1, 1,
0.9807391, -1.03229, 1.864753, 1, 1, 1, 1, 1,
0.9815804, -0.6923167, 1.303836, 0, 0, 1, 1, 1,
0.9818177, 1.528919, -0.7671245, 1, 0, 0, 1, 1,
0.9849072, 0.02803757, 2.896037, 1, 0, 0, 1, 1,
0.9904301, -0.01957401, 2.470385, 1, 0, 0, 1, 1,
0.9953463, 0.5864133, 2.84589, 1, 0, 0, 1, 1,
0.9957167, -0.2252184, 0.5374593, 1, 0, 0, 1, 1,
0.9958174, 0.5375149, 1.55888, 0, 0, 0, 1, 1,
0.9970621, 0.8820376, 0.4712851, 0, 0, 0, 1, 1,
1.00659, -1.200846, 1.278038, 0, 0, 0, 1, 1,
1.007675, -2.166817, 2.604055, 0, 0, 0, 1, 1,
1.010718, -1.200834, 2.354921, 0, 0, 0, 1, 1,
1.01323, 0.7973136, 0.4563886, 0, 0, 0, 1, 1,
1.013971, -0.8999586, 1.074612, 0, 0, 0, 1, 1,
1.019609, -0.4453768, 3.241382, 1, 1, 1, 1, 1,
1.026104, -0.2992518, 3.495193, 1, 1, 1, 1, 1,
1.027967, -1.421728, 3.667271, 1, 1, 1, 1, 1,
1.029327, 0.6306914, 0.004428904, 1, 1, 1, 1, 1,
1.031415, -0.634091, 3.322879, 1, 1, 1, 1, 1,
1.035025, -0.9338287, 2.271734, 1, 1, 1, 1, 1,
1.03655, 0.9155587, 1.87822, 1, 1, 1, 1, 1,
1.04096, -1.007893, 2.724761, 1, 1, 1, 1, 1,
1.049407, -0.1762725, 1.908851, 1, 1, 1, 1, 1,
1.04981, 0.5084999, 2.032425, 1, 1, 1, 1, 1,
1.061107, 0.03138593, 2.509499, 1, 1, 1, 1, 1,
1.070547, -0.4536107, 0.6027296, 1, 1, 1, 1, 1,
1.074746, -0.04429906, 1.272652, 1, 1, 1, 1, 1,
1.07665, -0.3230985, 2.864012, 1, 1, 1, 1, 1,
1.079011, -0.4105939, 2.602462, 1, 1, 1, 1, 1,
1.086337, 0.3756216, 0.7473706, 0, 0, 1, 1, 1,
1.096557, 0.0513768, 3.74125, 1, 0, 0, 1, 1,
1.097496, -0.6611688, 3.955936, 1, 0, 0, 1, 1,
1.102326, -0.01148973, 1.787164, 1, 0, 0, 1, 1,
1.115117, 0.846656, 0.9112386, 1, 0, 0, 1, 1,
1.115967, 0.3901244, 1.762451, 1, 0, 0, 1, 1,
1.116067, -0.4950536, 2.463248, 0, 0, 0, 1, 1,
1.120477, -1.750901, 0.7366953, 0, 0, 0, 1, 1,
1.125449, 1.003884, 0.6638721, 0, 0, 0, 1, 1,
1.128574, 1.102401, 0.4787434, 0, 0, 0, 1, 1,
1.131851, 1.346711, 0.8681904, 0, 0, 0, 1, 1,
1.134138, -1.267848, 2.813787, 0, 0, 0, 1, 1,
1.134424, -0.3355902, 2.300163, 0, 0, 0, 1, 1,
1.141837, 0.5226281, 2.084164, 1, 1, 1, 1, 1,
1.14346, -0.2557033, 1.474883, 1, 1, 1, 1, 1,
1.150699, 0.8859943, 0.3618358, 1, 1, 1, 1, 1,
1.150866, 0.485579, 2.584596, 1, 1, 1, 1, 1,
1.156225, 0.7413611, 2.821839, 1, 1, 1, 1, 1,
1.159795, 0.06812088, 0.8020704, 1, 1, 1, 1, 1,
1.162471, -0.9632133, 2.055991, 1, 1, 1, 1, 1,
1.163086, -0.1597599, -0.2067195, 1, 1, 1, 1, 1,
1.164198, -0.5139695, 1.173952, 1, 1, 1, 1, 1,
1.164535, 0.1353801, 1.611688, 1, 1, 1, 1, 1,
1.168656, -1.590665, 1.272081, 1, 1, 1, 1, 1,
1.191188, -0.3852949, 1.672986, 1, 1, 1, 1, 1,
1.194994, -0.6612847, 3.438381, 1, 1, 1, 1, 1,
1.195834, -1.030621, 2.67375, 1, 1, 1, 1, 1,
1.198114, 0.6195592, 1.996434, 1, 1, 1, 1, 1,
1.201167, -0.06107121, 2.839874, 0, 0, 1, 1, 1,
1.214863, -0.2194038, 1.829171, 1, 0, 0, 1, 1,
1.235655, 0.5512481, 1.265151, 1, 0, 0, 1, 1,
1.240704, -0.9980714, 3.13697, 1, 0, 0, 1, 1,
1.243403, 0.2659868, 2.10163, 1, 0, 0, 1, 1,
1.251369, 0.6602809, 0.268815, 1, 0, 0, 1, 1,
1.269779, -0.7257441, 0.3755267, 0, 0, 0, 1, 1,
1.274884, -0.6600365, 1.931907, 0, 0, 0, 1, 1,
1.278655, 2.090855, 1.372412, 0, 0, 0, 1, 1,
1.279859, -0.7639086, 1.936831, 0, 0, 0, 1, 1,
1.296996, -0.9068095, 1.608701, 0, 0, 0, 1, 1,
1.297015, 0.4898769, 0.2362566, 0, 0, 0, 1, 1,
1.298774, 0.5386343, 1.101693, 0, 0, 0, 1, 1,
1.299565, 0.4242867, 1.171421, 1, 1, 1, 1, 1,
1.308187, 1.306026, 0.08826726, 1, 1, 1, 1, 1,
1.312882, 0.1848398, 3.11991, 1, 1, 1, 1, 1,
1.314729, -0.9461086, 2.857667, 1, 1, 1, 1, 1,
1.31552, -0.5777656, 2.247298, 1, 1, 1, 1, 1,
1.317983, -1.26581, 2.003801, 1, 1, 1, 1, 1,
1.322738, -0.6851649, 2.086406, 1, 1, 1, 1, 1,
1.329162, -0.8304511, 1.049831, 1, 1, 1, 1, 1,
1.33636, -0.2879831, 2.861549, 1, 1, 1, 1, 1,
1.342264, 1.087606, 0.2652225, 1, 1, 1, 1, 1,
1.356388, 0.8342535, 1.270388, 1, 1, 1, 1, 1,
1.360579, 0.5007561, 1.941916, 1, 1, 1, 1, 1,
1.361985, -0.01270509, 1.28176, 1, 1, 1, 1, 1,
1.36474, 0.1632733, 0.2283497, 1, 1, 1, 1, 1,
1.367397, -0.1361005, 1.573513, 1, 1, 1, 1, 1,
1.369376, -0.4310708, 3.321799, 0, 0, 1, 1, 1,
1.379435, -1.640507, 2.681055, 1, 0, 0, 1, 1,
1.385383, 0.8126101, 1.737242, 1, 0, 0, 1, 1,
1.387767, 1.663715, -0.7240736, 1, 0, 0, 1, 1,
1.389378, -0.2211624, 1.679936, 1, 0, 0, 1, 1,
1.396142, 0.2694651, 1.452568, 1, 0, 0, 1, 1,
1.414194, 1.492905, 1.005388, 0, 0, 0, 1, 1,
1.424773, 0.7165758, 0.5385823, 0, 0, 0, 1, 1,
1.455047, -0.8811243, 2.079744, 0, 0, 0, 1, 1,
1.470286, 0.236357, -0.1863049, 0, 0, 0, 1, 1,
1.470585, -0.3589459, 2.235473, 0, 0, 0, 1, 1,
1.478388, 1.805673, -0.1192554, 0, 0, 0, 1, 1,
1.478495, 1.024702, 1.850919, 0, 0, 0, 1, 1,
1.483407, -1.318486, 4.009099, 1, 1, 1, 1, 1,
1.484637, -0.4050484, 3.937489, 1, 1, 1, 1, 1,
1.486611, -0.3948345, 2.368536, 1, 1, 1, 1, 1,
1.487977, 0.6219046, 1.781774, 1, 1, 1, 1, 1,
1.491361, -0.7330373, 1.394712, 1, 1, 1, 1, 1,
1.49785, 0.6814833, 1.708206, 1, 1, 1, 1, 1,
1.501598, -0.3535843, 3.34757, 1, 1, 1, 1, 1,
1.507652, -2.569643, 3.050785, 1, 1, 1, 1, 1,
1.509471, -1.160336, 0.7319297, 1, 1, 1, 1, 1,
1.509522, -0.6670295, 5.22356, 1, 1, 1, 1, 1,
1.511454, 0.5061249, 1.720525, 1, 1, 1, 1, 1,
1.513951, -0.4605157, 3.363392, 1, 1, 1, 1, 1,
1.516145, 0.4145102, 2.531797, 1, 1, 1, 1, 1,
1.519306, 0.1071403, 0.5382292, 1, 1, 1, 1, 1,
1.532719, 0.8481916, 2.851461, 1, 1, 1, 1, 1,
1.546161, -0.3727142, 2.605646, 0, 0, 1, 1, 1,
1.555385, -0.7925555, 4.440582, 1, 0, 0, 1, 1,
1.561631, -1.561764, 2.290003, 1, 0, 0, 1, 1,
1.568816, -0.1330446, 1.060686, 1, 0, 0, 1, 1,
1.569281, -0.1700619, 0.4264533, 1, 0, 0, 1, 1,
1.570811, -1.237671, 3.654883, 1, 0, 0, 1, 1,
1.578986, 1.040261, 0.480491, 0, 0, 0, 1, 1,
1.592653, 0.4401233, 0.891946, 0, 0, 0, 1, 1,
1.594415, 0.4833408, 2.331049, 0, 0, 0, 1, 1,
1.661417, 0.3924536, 1.886957, 0, 0, 0, 1, 1,
1.663754, -0.3773127, 0.6405793, 0, 0, 0, 1, 1,
1.672006, -0.6271351, 2.353144, 0, 0, 0, 1, 1,
1.672436, 0.3819468, -0.4028662, 0, 0, 0, 1, 1,
1.678523, 0.1028259, 1.092742, 1, 1, 1, 1, 1,
1.68032, 2.808522, 0.3324979, 1, 1, 1, 1, 1,
1.73172, 0.5204641, 1.738359, 1, 1, 1, 1, 1,
1.732656, -0.2023719, 2.27546, 1, 1, 1, 1, 1,
1.762716, 0.5199591, 0.8505175, 1, 1, 1, 1, 1,
1.767421, -0.9035755, 0.9589477, 1, 1, 1, 1, 1,
1.791693, 1.080266, 0.6009309, 1, 1, 1, 1, 1,
1.794253, 0.05322192, 0.4117375, 1, 1, 1, 1, 1,
1.801355, 0.8808241, 0.05648142, 1, 1, 1, 1, 1,
1.823035, -0.1046478, 1.788137, 1, 1, 1, 1, 1,
1.842415, 1.537339, 0.2688124, 1, 1, 1, 1, 1,
1.850894, 0.6918949, -0.3002068, 1, 1, 1, 1, 1,
1.875278, 1.32755, 0.0724057, 1, 1, 1, 1, 1,
1.892076, -2.351495, 3.605796, 1, 1, 1, 1, 1,
1.933244, -0.7199696, 1.856587, 1, 1, 1, 1, 1,
1.954128, -1.442073, 1.966579, 0, 0, 1, 1, 1,
1.955563, 0.1785416, 2.958342, 1, 0, 0, 1, 1,
1.99986, 0.6394603, 1.264896, 1, 0, 0, 1, 1,
2.006911, 1.676799, 0.5332011, 1, 0, 0, 1, 1,
2.008538, 0.510016, 2.204352, 1, 0, 0, 1, 1,
2.031839, 1.863255, 1.048637, 1, 0, 0, 1, 1,
2.035424, 1.029299, 1.533232, 0, 0, 0, 1, 1,
2.102077, 1.131581, -0.3692894, 0, 0, 0, 1, 1,
2.120878, 1.082751, 1.886125, 0, 0, 0, 1, 1,
2.132472, -1.226286, 1.028732, 0, 0, 0, 1, 1,
2.147881, 0.2605407, 1.898587, 0, 0, 0, 1, 1,
2.163437, 0.5055428, -0.974839, 0, 0, 0, 1, 1,
2.176965, 0.5197001, 1.05232, 0, 0, 0, 1, 1,
2.37357, -0.1940466, 2.394774, 1, 1, 1, 1, 1,
2.386721, 1.24928, 1.239691, 1, 1, 1, 1, 1,
2.406994, 0.3134408, 1.512628, 1, 1, 1, 1, 1,
2.460628, -1.039142, 2.61398, 1, 1, 1, 1, 1,
2.588367, 0.3946145, -0.01119574, 1, 1, 1, 1, 1,
2.896112, -0.456346, 3.135354, 1, 1, 1, 1, 1,
3.3505, 0.8688334, 0.6453288, 1, 1, 1, 1, 1
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
var radius = 9.435098;
var distance = 33.14038;
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
mvMatrix.translate( -0.3567117, 0.2238464, 0.2076757 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.14038);
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
