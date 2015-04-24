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
-2.714147, 0.218454, -2.868245, 1, 0, 0, 1,
-2.647065, 0.6129268, -0.02101821, 1, 0.007843138, 0, 1,
-2.630352, 0.5775049, -1.714866, 1, 0.01176471, 0, 1,
-2.616935, -1.372932, -1.252174, 1, 0.01960784, 0, 1,
-2.44427, -0.2544386, -1.045618, 1, 0.02352941, 0, 1,
-2.368088, -1.082781, -1.091853, 1, 0.03137255, 0, 1,
-2.343571, -0.2204786, -1.199455, 1, 0.03529412, 0, 1,
-2.307504, 0.07883434, -1.137505, 1, 0.04313726, 0, 1,
-2.178247, 0.4215488, -0.6138682, 1, 0.04705882, 0, 1,
-2.163435, -0.1244596, -3.475674, 1, 0.05490196, 0, 1,
-2.157623, -1.846222, -2.525611, 1, 0.05882353, 0, 1,
-2.143305, -1.227618, -3.317959, 1, 0.06666667, 0, 1,
-2.135689, -0.2496338, -0.3395134, 1, 0.07058824, 0, 1,
-2.097745, -0.7656955, -1.748169, 1, 0.07843138, 0, 1,
-2.062839, 0.8975095, -1.953379, 1, 0.08235294, 0, 1,
-2.048055, -0.1907447, -1.365376, 1, 0.09019608, 0, 1,
-2.021627, 0.7498714, 1.288007, 1, 0.09411765, 0, 1,
-2.009709, -0.09812146, 0.3102193, 1, 0.1019608, 0, 1,
-2.006071, 1.291756, -1.649527, 1, 0.1098039, 0, 1,
-2.001848, 0.9743698, -0.6942663, 1, 0.1137255, 0, 1,
-1.950821, -0.3422961, -0.4935778, 1, 0.1215686, 0, 1,
-1.937293, -0.7028444, -1.053551, 1, 0.1254902, 0, 1,
-1.925618, 0.01326297, -2.452279, 1, 0.1333333, 0, 1,
-1.914159, 0.1183829, -2.415551, 1, 0.1372549, 0, 1,
-1.912606, 0.5490495, -1.053992, 1, 0.145098, 0, 1,
-1.899864, 2.399513, 0.2261045, 1, 0.1490196, 0, 1,
-1.856443, -1.646631, -1.873908, 1, 0.1568628, 0, 1,
-1.841179, -0.6383231, -2.350685, 1, 0.1607843, 0, 1,
-1.821454, -0.4558459, -3.163914, 1, 0.1686275, 0, 1,
-1.813126, 1.267788, -1.191404, 1, 0.172549, 0, 1,
-1.801004, 0.3714779, -2.689876, 1, 0.1803922, 0, 1,
-1.798815, -0.4066622, -2.98559, 1, 0.1843137, 0, 1,
-1.765103, -0.6449353, -0.7220756, 1, 0.1921569, 0, 1,
-1.731867, -0.3649633, -1.161811, 1, 0.1960784, 0, 1,
-1.714454, 0.847734, -2.110108, 1, 0.2039216, 0, 1,
-1.711216, 0.6499738, 1.299219, 1, 0.2117647, 0, 1,
-1.679024, -2.209168, -1.772698, 1, 0.2156863, 0, 1,
-1.678144, 1.243514, -2.511255, 1, 0.2235294, 0, 1,
-1.66039, -1.24907, -3.317064, 1, 0.227451, 0, 1,
-1.65589, 0.4409456, -2.427727, 1, 0.2352941, 0, 1,
-1.652795, 2.048266, -1.87365, 1, 0.2392157, 0, 1,
-1.644029, 0.187008, 0.1719665, 1, 0.2470588, 0, 1,
-1.634439, 0.2200924, -2.747929, 1, 0.2509804, 0, 1,
-1.632486, 1.901144, -0.2276112, 1, 0.2588235, 0, 1,
-1.627681, 0.9089156, -0.5562301, 1, 0.2627451, 0, 1,
-1.614743, -0.6483563, -0.7709782, 1, 0.2705882, 0, 1,
-1.612753, -0.1749655, -2.277049, 1, 0.2745098, 0, 1,
-1.603759, 1.592103, -0.5611625, 1, 0.282353, 0, 1,
-1.596864, 0.3262874, -1.044608, 1, 0.2862745, 0, 1,
-1.57755, 1.408943, -0.3662652, 1, 0.2941177, 0, 1,
-1.551741, -1.26404, -1.912325, 1, 0.3019608, 0, 1,
-1.548459, -0.5788826, -2.331426, 1, 0.3058824, 0, 1,
-1.528673, -0.0437607, -2.734382, 1, 0.3137255, 0, 1,
-1.525422, 0.6931055, -0.3267033, 1, 0.3176471, 0, 1,
-1.508006, 0.1904007, -1.834103, 1, 0.3254902, 0, 1,
-1.488961, 0.1533732, -0.5334362, 1, 0.3294118, 0, 1,
-1.486802, -0.7726409, -1.343711, 1, 0.3372549, 0, 1,
-1.48463, 2.384437, -2.559995, 1, 0.3411765, 0, 1,
-1.465732, 1.45866, -1.466207, 1, 0.3490196, 0, 1,
-1.461234, -0.3433565, -1.347059, 1, 0.3529412, 0, 1,
-1.460023, 0.1887364, -0.5234038, 1, 0.3607843, 0, 1,
-1.455316, -0.409559, -1.776044, 1, 0.3647059, 0, 1,
-1.427421, -0.4235182, -2.057047, 1, 0.372549, 0, 1,
-1.393024, -0.6903497, -2.999418, 1, 0.3764706, 0, 1,
-1.373581, -0.3998539, -0.9452006, 1, 0.3843137, 0, 1,
-1.365375, -0.4030301, -0.1371762, 1, 0.3882353, 0, 1,
-1.362991, 0.3274245, -2.280115, 1, 0.3960784, 0, 1,
-1.357489, 0.4145866, -1.560467, 1, 0.4039216, 0, 1,
-1.339566, -1.35508, -2.641998, 1, 0.4078431, 0, 1,
-1.331981, -0.5750718, -3.186645, 1, 0.4156863, 0, 1,
-1.323225, 0.7836757, -1.496179, 1, 0.4196078, 0, 1,
-1.311489, 0.8488736, -2.42493, 1, 0.427451, 0, 1,
-1.301471, -2.129702, -3.280069, 1, 0.4313726, 0, 1,
-1.280573, -1.118146, -3.096103, 1, 0.4392157, 0, 1,
-1.274638, -2.201401, -1.012501, 1, 0.4431373, 0, 1,
-1.271382, -1.677659, -2.050196, 1, 0.4509804, 0, 1,
-1.266185, -2.224992, -0.6461736, 1, 0.454902, 0, 1,
-1.260509, -0.3415944, -2.134592, 1, 0.4627451, 0, 1,
-1.258337, 0.6215125, -2.136714, 1, 0.4666667, 0, 1,
-1.24798, -1.227879, -1.933162, 1, 0.4745098, 0, 1,
-1.242012, -1.141308, -2.702572, 1, 0.4784314, 0, 1,
-1.236366, -1.378784, -3.087701, 1, 0.4862745, 0, 1,
-1.226851, 0.0655091, -2.437521, 1, 0.4901961, 0, 1,
-1.220052, 0.746751, -1.24675, 1, 0.4980392, 0, 1,
-1.21381, 0.2388002, 0.1928855, 1, 0.5058824, 0, 1,
-1.21201, -0.2167401, -0.9616294, 1, 0.509804, 0, 1,
-1.206267, -0.7544092, -3.512775, 1, 0.5176471, 0, 1,
-1.195951, 0.9583259, -1.09121, 1, 0.5215687, 0, 1,
-1.191361, -1.046124, -1.582056, 1, 0.5294118, 0, 1,
-1.184003, -0.3396989, -1.829116, 1, 0.5333334, 0, 1,
-1.183793, 0.1937059, -0.1799697, 1, 0.5411765, 0, 1,
-1.181567, -0.1665823, -0.6643289, 1, 0.5450981, 0, 1,
-1.172132, -1.193501, -3.287302, 1, 0.5529412, 0, 1,
-1.169194, 0.4370362, -1.543084, 1, 0.5568628, 0, 1,
-1.166894, 0.6877427, -1.549474, 1, 0.5647059, 0, 1,
-1.162021, -0.9044065, -3.1223, 1, 0.5686275, 0, 1,
-1.161411, -2.3012, -3.91133, 1, 0.5764706, 0, 1,
-1.157986, -1.242956, -2.848141, 1, 0.5803922, 0, 1,
-1.150379, -0.5505601, -1.755599, 1, 0.5882353, 0, 1,
-1.148539, -0.7549503, -0.3955804, 1, 0.5921569, 0, 1,
-1.144801, 0.3229105, -1.117073, 1, 0.6, 0, 1,
-1.142023, -0.2146367, -1.443457, 1, 0.6078432, 0, 1,
-1.140044, -0.1886354, -2.869983, 1, 0.6117647, 0, 1,
-1.134793, 0.02091382, -2.07481, 1, 0.6196079, 0, 1,
-1.128825, -0.5067642, -2.724106, 1, 0.6235294, 0, 1,
-1.126477, -0.6525903, -2.885454, 1, 0.6313726, 0, 1,
-1.119426, -0.04795041, -2.986721, 1, 0.6352941, 0, 1,
-1.116747, 0.2609951, -1.446076, 1, 0.6431373, 0, 1,
-1.109742, 0.6805012, -1.954791, 1, 0.6470588, 0, 1,
-1.105135, 0.1372678, 1.265045, 1, 0.654902, 0, 1,
-1.104963, 1.089194, 0.04292898, 1, 0.6588235, 0, 1,
-1.097518, 0.1131546, -0.2692203, 1, 0.6666667, 0, 1,
-1.096388, 0.7986386, -1.525466, 1, 0.6705883, 0, 1,
-1.095199, 0.2371292, -1.037973, 1, 0.6784314, 0, 1,
-1.091519, -0.9656863, -2.058149, 1, 0.682353, 0, 1,
-1.088536, 0.4253605, 0.3045846, 1, 0.6901961, 0, 1,
-1.086176, 0.5528095, -2.05933, 1, 0.6941177, 0, 1,
-1.081879, -0.8676742, -2.772637, 1, 0.7019608, 0, 1,
-1.079229, -0.1794528, -3.7371, 1, 0.7098039, 0, 1,
-1.078041, -0.2439384, -1.17066, 1, 0.7137255, 0, 1,
-1.077233, 0.02029523, -1.619276, 1, 0.7215686, 0, 1,
-1.075148, -0.0004051049, -0.8739017, 1, 0.7254902, 0, 1,
-1.073034, -1.394658, -2.392058, 1, 0.7333333, 0, 1,
-1.070161, -1.153867, -3.219039, 1, 0.7372549, 0, 1,
-1.069587, -0.07518306, -1.055719, 1, 0.7450981, 0, 1,
-1.050581, 0.7345414, -1.462043, 1, 0.7490196, 0, 1,
-1.039587, -1.476767, -0.5912212, 1, 0.7568628, 0, 1,
-1.037405, 0.3957346, -1.247395, 1, 0.7607843, 0, 1,
-1.028143, 1.620213, -2.169906, 1, 0.7686275, 0, 1,
-1.022277, 0.3151077, -1.61852, 1, 0.772549, 0, 1,
-1.020302, 1.428808, -2.618633, 1, 0.7803922, 0, 1,
-1.01991, -1.811154, -4.657312, 1, 0.7843137, 0, 1,
-1.014178, 0.1811476, -1.12245, 1, 0.7921569, 0, 1,
-1.013238, 1.148203, -1.171301, 1, 0.7960784, 0, 1,
-1.011306, 0.7785126, -0.2239559, 1, 0.8039216, 0, 1,
-1.00927, -0.214633, -2.407317, 1, 0.8117647, 0, 1,
-1.006934, -0.5071647, -2.783054, 1, 0.8156863, 0, 1,
-1.002791, 0.4975056, -0.723246, 1, 0.8235294, 0, 1,
-0.9973035, 0.1629936, -1.471711, 1, 0.827451, 0, 1,
-0.9849958, 1.269171, 0.5481764, 1, 0.8352941, 0, 1,
-0.9846745, 1.054942, 0.6498363, 1, 0.8392157, 0, 1,
-0.9843883, 0.768372, -0.944607, 1, 0.8470588, 0, 1,
-0.9841698, -0.4318322, -1.638568, 1, 0.8509804, 0, 1,
-0.9833716, -0.1917984, -2.532133, 1, 0.8588235, 0, 1,
-0.9762617, -1.247534, -4.078341, 1, 0.8627451, 0, 1,
-0.9750261, -2.526286, -1.398744, 1, 0.8705882, 0, 1,
-0.9740418, 0.2620863, -2.145605, 1, 0.8745098, 0, 1,
-0.9654612, -2.401594, -3.426473, 1, 0.8823529, 0, 1,
-0.9610204, -1.391523, -2.440956, 1, 0.8862745, 0, 1,
-0.9591839, 0.1723584, -0.3216145, 1, 0.8941177, 0, 1,
-0.9578834, 1.840103, -0.7792183, 1, 0.8980392, 0, 1,
-0.9542881, -0.6677549, -1.864745, 1, 0.9058824, 0, 1,
-0.9541546, 0.1334123, -1.134179, 1, 0.9137255, 0, 1,
-0.9500868, 1.396519, 1.463171, 1, 0.9176471, 0, 1,
-0.9438645, 0.100182, -2.347738, 1, 0.9254902, 0, 1,
-0.9437711, -1.429873, -1.595815, 1, 0.9294118, 0, 1,
-0.9419895, -0.9440458, -1.484031, 1, 0.9372549, 0, 1,
-0.9353231, 0.7570276, -1.007971, 1, 0.9411765, 0, 1,
-0.9338101, 0.8428722, -1.085115, 1, 0.9490196, 0, 1,
-0.9336559, 1.169525, 0.3472351, 1, 0.9529412, 0, 1,
-0.9314757, 0.1737288, -1.683321, 1, 0.9607843, 0, 1,
-0.9314294, -0.6321881, -4.034364, 1, 0.9647059, 0, 1,
-0.9273781, -1.83261, -3.320884, 1, 0.972549, 0, 1,
-0.9270579, -0.5745224, -3.363945, 1, 0.9764706, 0, 1,
-0.9252419, -2.216334, -0.8943048, 1, 0.9843137, 0, 1,
-0.9178069, 0.6485855, -0.2696157, 1, 0.9882353, 0, 1,
-0.9149342, -0.5651156, -3.038504, 1, 0.9960784, 0, 1,
-0.9125525, -1.51543, -2.773441, 0.9960784, 1, 0, 1,
-0.9094403, 2.867455, 0.6648291, 0.9921569, 1, 0, 1,
-0.9077628, -0.3627345, -2.849174, 0.9843137, 1, 0, 1,
-0.9046633, -0.2802781, -1.528202, 0.9803922, 1, 0, 1,
-0.8985898, 0.9056114, -0.1517166, 0.972549, 1, 0, 1,
-0.8805266, -0.4736733, -1.666295, 0.9686275, 1, 0, 1,
-0.8786297, -0.713824, -2.781178, 0.9607843, 1, 0, 1,
-0.8783682, 1.613052, -0.3143732, 0.9568627, 1, 0, 1,
-0.8726265, -0.4037549, -0.8301544, 0.9490196, 1, 0, 1,
-0.8667942, 1.274605, 1.359804, 0.945098, 1, 0, 1,
-0.8629527, 0.5657259, -0.3117354, 0.9372549, 1, 0, 1,
-0.8606883, -1.085834, -3.32461, 0.9333333, 1, 0, 1,
-0.8583385, 0.4651236, -0.4482238, 0.9254902, 1, 0, 1,
-0.8571511, -0.4890785, -0.853979, 0.9215686, 1, 0, 1,
-0.8519714, 1.496809, -1.114611, 0.9137255, 1, 0, 1,
-0.8518645, -1.631115, -0.1290975, 0.9098039, 1, 0, 1,
-0.8453164, 1.105029, -0.9435245, 0.9019608, 1, 0, 1,
-0.8408896, -0.105216, -0.9952679, 0.8941177, 1, 0, 1,
-0.8381203, 0.7024863, -0.9259565, 0.8901961, 1, 0, 1,
-0.8359154, -1.285898, -3.394808, 0.8823529, 1, 0, 1,
-0.8343706, 0.2031109, -2.067066, 0.8784314, 1, 0, 1,
-0.8338286, -0.4475161, -1.121482, 0.8705882, 1, 0, 1,
-0.8320683, -2.193742, -2.790403, 0.8666667, 1, 0, 1,
-0.8265099, 0.7065834, 0.7847419, 0.8588235, 1, 0, 1,
-0.82322, 2.153136, -0.7545477, 0.854902, 1, 0, 1,
-0.8176591, -1.066688, -3.386701, 0.8470588, 1, 0, 1,
-0.8102274, 2.114552, 0.2331323, 0.8431373, 1, 0, 1,
-0.8071526, 0.840099, 1.175111, 0.8352941, 1, 0, 1,
-0.8004264, 0.3365681, -1.555367, 0.8313726, 1, 0, 1,
-0.7963701, 0.1121323, -1.524297, 0.8235294, 1, 0, 1,
-0.7962681, -0.2852763, -2.874396, 0.8196079, 1, 0, 1,
-0.7951048, -1.204044, -1.147666, 0.8117647, 1, 0, 1,
-0.7925963, -0.4996662, -2.359498, 0.8078431, 1, 0, 1,
-0.7914899, -1.202584, -3.051097, 0.8, 1, 0, 1,
-0.7874973, -0.7515013, -2.07271, 0.7921569, 1, 0, 1,
-0.7871284, 0.5219274, -0.6386685, 0.7882353, 1, 0, 1,
-0.7814461, -0.01865637, -0.7877267, 0.7803922, 1, 0, 1,
-0.779402, -0.936256, -4.220443, 0.7764706, 1, 0, 1,
-0.7782444, 1.286786, -0.4602975, 0.7686275, 1, 0, 1,
-0.7775606, -0.9983405, -1.175458, 0.7647059, 1, 0, 1,
-0.7745609, 1.933861, 0.6328678, 0.7568628, 1, 0, 1,
-0.7679943, 1.384007, -3.006631, 0.7529412, 1, 0, 1,
-0.7663475, -1.025493, -3.242265, 0.7450981, 1, 0, 1,
-0.7632434, 0.3987631, 0.3979012, 0.7411765, 1, 0, 1,
-0.7610943, 0.0149358, -1.13218, 0.7333333, 1, 0, 1,
-0.7577764, 0.557915, 0.4140715, 0.7294118, 1, 0, 1,
-0.7526148, -0.6818096, -4.222685, 0.7215686, 1, 0, 1,
-0.7524514, 0.2423982, -1.738884, 0.7176471, 1, 0, 1,
-0.7518457, 0.652533, 0.2603184, 0.7098039, 1, 0, 1,
-0.7472904, -0.9217697, -2.279793, 0.7058824, 1, 0, 1,
-0.7465968, 1.802018, 1.111981, 0.6980392, 1, 0, 1,
-0.7428862, -0.002035736, -1.483939, 0.6901961, 1, 0, 1,
-0.7388966, 0.6771976, -1.750284, 0.6862745, 1, 0, 1,
-0.7325031, 0.4698319, 0.6908616, 0.6784314, 1, 0, 1,
-0.7322177, 0.3895544, -0.02794026, 0.6745098, 1, 0, 1,
-0.7308206, 0.4387406, -1.836804, 0.6666667, 1, 0, 1,
-0.7307456, -0.7017948, -0.9604467, 0.6627451, 1, 0, 1,
-0.729146, 0.007772455, -2.434803, 0.654902, 1, 0, 1,
-0.7209054, -0.5174342, 0.01517116, 0.6509804, 1, 0, 1,
-0.7196659, -0.9853634, -2.452573, 0.6431373, 1, 0, 1,
-0.7186878, 0.8852662, -0.3317031, 0.6392157, 1, 0, 1,
-0.7120132, -1.511938, -2.773645, 0.6313726, 1, 0, 1,
-0.7113441, -0.4166476, -4.064908, 0.627451, 1, 0, 1,
-0.7094536, -1.211408, -3.37238, 0.6196079, 1, 0, 1,
-0.709214, 1.564016, -0.1887949, 0.6156863, 1, 0, 1,
-0.7076395, -0.6706384, -2.127835, 0.6078432, 1, 0, 1,
-0.7074047, -0.7344833, -2.127969, 0.6039216, 1, 0, 1,
-0.705632, -0.4232535, -2.214712, 0.5960785, 1, 0, 1,
-0.6998182, 0.002619568, -0.7978053, 0.5882353, 1, 0, 1,
-0.687252, -0.9376741, -3.187658, 0.5843138, 1, 0, 1,
-0.6832485, 1.718733, -0.9604874, 0.5764706, 1, 0, 1,
-0.6774714, 0.3631647, -1.538404, 0.572549, 1, 0, 1,
-0.6760683, 0.6645547, -0.8530697, 0.5647059, 1, 0, 1,
-0.6757686, -0.5989586, -0.3116783, 0.5607843, 1, 0, 1,
-0.6753067, 1.371279, 1.65678, 0.5529412, 1, 0, 1,
-0.6708711, -0.5119263, -1.355619, 0.5490196, 1, 0, 1,
-0.6682374, -0.4586048, -3.087038, 0.5411765, 1, 0, 1,
-0.6675171, 1.082505, -0.2216153, 0.5372549, 1, 0, 1,
-0.6666836, -0.02785708, -1.227953, 0.5294118, 1, 0, 1,
-0.665103, -0.6436727, -1.588256, 0.5254902, 1, 0, 1,
-0.6637779, 0.3489346, -0.4430125, 0.5176471, 1, 0, 1,
-0.6633942, 0.8664781, -2.665606, 0.5137255, 1, 0, 1,
-0.6630575, 0.7974694, -1.123701, 0.5058824, 1, 0, 1,
-0.6621355, -2.103968, -2.387598, 0.5019608, 1, 0, 1,
-0.6593834, -0.6864821, -2.52316, 0.4941176, 1, 0, 1,
-0.6573868, -0.8026223, -4.162694, 0.4862745, 1, 0, 1,
-0.6563056, 0.7478713, -1.453179, 0.4823529, 1, 0, 1,
-0.6523494, 0.1360324, -3.019011, 0.4745098, 1, 0, 1,
-0.6494274, -0.3694128, -1.209107, 0.4705882, 1, 0, 1,
-0.6456626, 0.762482, -1.054346, 0.4627451, 1, 0, 1,
-0.6429299, -1.133455, -2.897372, 0.4588235, 1, 0, 1,
-0.6369978, -0.3091562, -2.100875, 0.4509804, 1, 0, 1,
-0.6355463, 0.3031107, 0.3806807, 0.4470588, 1, 0, 1,
-0.631147, -0.8334017, -2.861464, 0.4392157, 1, 0, 1,
-0.6297089, -0.9566239, -2.442171, 0.4352941, 1, 0, 1,
-0.6276621, -2.471615, -1.560029, 0.427451, 1, 0, 1,
-0.6210334, -1.008143, -1.68651, 0.4235294, 1, 0, 1,
-0.620065, -1.382935, -1.304841, 0.4156863, 1, 0, 1,
-0.619167, -2.718281, -3.556136, 0.4117647, 1, 0, 1,
-0.6154428, -0.4688377, -2.962126, 0.4039216, 1, 0, 1,
-0.6079816, 1.166755, -0.244033, 0.3960784, 1, 0, 1,
-0.6079754, 3.089274, -0.4543529, 0.3921569, 1, 0, 1,
-0.6071029, -0.0152668, -2.647281, 0.3843137, 1, 0, 1,
-0.6038827, -0.3847104, -3.69157, 0.3803922, 1, 0, 1,
-0.6021396, -0.7945024, -3.103074, 0.372549, 1, 0, 1,
-0.6020347, 0.3842813, -1.415118, 0.3686275, 1, 0, 1,
-0.6014037, -0.939678, -1.9624, 0.3607843, 1, 0, 1,
-0.6002656, -0.2355292, -3.647561, 0.3568628, 1, 0, 1,
-0.5986965, 1.585942, -0.9490038, 0.3490196, 1, 0, 1,
-0.5966385, 0.8821437, -0.03555243, 0.345098, 1, 0, 1,
-0.5955454, -0.265393, -2.639504, 0.3372549, 1, 0, 1,
-0.5915769, -0.5423047, -1.741349, 0.3333333, 1, 0, 1,
-0.5881028, 1.42889, -1.180481, 0.3254902, 1, 0, 1,
-0.5805086, -1.223551, -3.116681, 0.3215686, 1, 0, 1,
-0.5747589, 0.09234463, -0.4283066, 0.3137255, 1, 0, 1,
-0.5741061, -1.611068, -3.181835, 0.3098039, 1, 0, 1,
-0.5732039, 1.169666, -1.692843, 0.3019608, 1, 0, 1,
-0.563359, -2.836724, -2.805782, 0.2941177, 1, 0, 1,
-0.5601009, -1.765753, -3.865553, 0.2901961, 1, 0, 1,
-0.5567403, -0.6675678, -4.861389, 0.282353, 1, 0, 1,
-0.5517529, 2.4613, -2.082346, 0.2784314, 1, 0, 1,
-0.5516955, 0.0259554, -0.3959784, 0.2705882, 1, 0, 1,
-0.5474334, 0.1011722, -0.81374, 0.2666667, 1, 0, 1,
-0.5472301, 0.1727902, -2.709421, 0.2588235, 1, 0, 1,
-0.5466868, -1.47554, -1.497355, 0.254902, 1, 0, 1,
-0.5458274, -1.249666, -3.06257, 0.2470588, 1, 0, 1,
-0.5450826, 0.4794297, -0.173969, 0.2431373, 1, 0, 1,
-0.5413855, -0.3166478, -2.757063, 0.2352941, 1, 0, 1,
-0.5401034, -1.343957, -1.94218, 0.2313726, 1, 0, 1,
-0.5395067, 0.001474816, -0.6747428, 0.2235294, 1, 0, 1,
-0.5391855, -0.004608214, -1.441251, 0.2196078, 1, 0, 1,
-0.5363066, 0.572314, -1.507042, 0.2117647, 1, 0, 1,
-0.534385, 1.950001, -0.4475762, 0.2078431, 1, 0, 1,
-0.5296, -0.6776666, -2.489289, 0.2, 1, 0, 1,
-0.5294326, 0.2129748, -3.033297, 0.1921569, 1, 0, 1,
-0.5286596, -0.1354089, -2.736971, 0.1882353, 1, 0, 1,
-0.5263004, -0.9387414, -2.603656, 0.1803922, 1, 0, 1,
-0.5247642, -1.146989, -2.938418, 0.1764706, 1, 0, 1,
-0.5223501, -1.016879, -4.10055, 0.1686275, 1, 0, 1,
-0.5219428, 0.2777032, -1.881627, 0.1647059, 1, 0, 1,
-0.5167639, 0.5214396, -1.121431, 0.1568628, 1, 0, 1,
-0.5161026, 0.7604613, -0.9963902, 0.1529412, 1, 0, 1,
-0.5153854, -1.402248, -1.501119, 0.145098, 1, 0, 1,
-0.5107291, -0.8186116, -3.996672, 0.1411765, 1, 0, 1,
-0.5106763, 2.193473, -0.2055651, 0.1333333, 1, 0, 1,
-0.5105025, 0.7753009, -2.106401, 0.1294118, 1, 0, 1,
-0.5061974, 0.5323977, -1.018954, 0.1215686, 1, 0, 1,
-0.5048513, 1.50906, 0.5976869, 0.1176471, 1, 0, 1,
-0.5024073, -0.7444577, -4.612293, 0.1098039, 1, 0, 1,
-0.5016485, 1.615636, 0.3620169, 0.1058824, 1, 0, 1,
-0.5004911, -0.4549357, -2.90377, 0.09803922, 1, 0, 1,
-0.4980412, -0.6061174, -2.401891, 0.09019608, 1, 0, 1,
-0.4961747, -0.7127522, -2.807445, 0.08627451, 1, 0, 1,
-0.495594, -0.2081071, -1.840506, 0.07843138, 1, 0, 1,
-0.4933894, 0.233837, 0.2381573, 0.07450981, 1, 0, 1,
-0.4827903, -1.684551, -1.9221, 0.06666667, 1, 0, 1,
-0.4821292, -0.7355573, -3.386682, 0.0627451, 1, 0, 1,
-0.4809447, -0.6935067, -3.469789, 0.05490196, 1, 0, 1,
-0.4754693, 0.5823485, -0.2533752, 0.05098039, 1, 0, 1,
-0.4754317, 0.03197835, -2.50888, 0.04313726, 1, 0, 1,
-0.4749625, -0.4454706, -2.446409, 0.03921569, 1, 0, 1,
-0.4743948, -1.574122, -2.079856, 0.03137255, 1, 0, 1,
-0.4730691, 0.4589743, -1.25126, 0.02745098, 1, 0, 1,
-0.4727435, -0.2839438, -0.9902107, 0.01960784, 1, 0, 1,
-0.4639102, -0.979351, -2.743327, 0.01568628, 1, 0, 1,
-0.4580183, 2.000279, 1.100473, 0.007843138, 1, 0, 1,
-0.4572175, -0.297989, -3.238735, 0.003921569, 1, 0, 1,
-0.456381, 0.6608696, -0.07325807, 0, 1, 0.003921569, 1,
-0.4541936, -0.1166124, -1.654797, 0, 1, 0.01176471, 1,
-0.4539147, -0.2122799, -3.185989, 0, 1, 0.01568628, 1,
-0.4482013, -1.540725, -1.805245, 0, 1, 0.02352941, 1,
-0.4447146, 0.64958, -1.262767, 0, 1, 0.02745098, 1,
-0.4418021, 1.114631, -1.283322, 0, 1, 0.03529412, 1,
-0.4363339, 1.563957, 0.5168504, 0, 1, 0.03921569, 1,
-0.4361935, 0.2263442, -1.568303, 0, 1, 0.04705882, 1,
-0.4338908, 1.601728, -0.007902712, 0, 1, 0.05098039, 1,
-0.428486, 1.389851, -0.3424794, 0, 1, 0.05882353, 1,
-0.4231001, -0.4854116, -2.859594, 0, 1, 0.0627451, 1,
-0.4190241, 0.6444762, -1.826046, 0, 1, 0.07058824, 1,
-0.4141787, 1.153846, -2.935502, 0, 1, 0.07450981, 1,
-0.4099753, 2.000568, -1.151554, 0, 1, 0.08235294, 1,
-0.4098801, -0.07193671, 0.7916411, 0, 1, 0.08627451, 1,
-0.4091645, -1.111561, -0.2171972, 0, 1, 0.09411765, 1,
-0.4022742, -0.2447257, -2.190808, 0, 1, 0.1019608, 1,
-0.4006746, -0.6903707, -3.019186, 0, 1, 0.1058824, 1,
-0.3987863, 0.9174398, -0.4144505, 0, 1, 0.1137255, 1,
-0.3978245, 1.750235, 1.460187, 0, 1, 0.1176471, 1,
-0.3864784, -0.4518327, -2.167866, 0, 1, 0.1254902, 1,
-0.3858657, -0.2675891, -0.1927804, 0, 1, 0.1294118, 1,
-0.3841321, -0.1669508, -1.675183, 0, 1, 0.1372549, 1,
-0.3838784, -1.048093, -1.380293, 0, 1, 0.1411765, 1,
-0.3837036, -1.033542, -1.036601, 0, 1, 0.1490196, 1,
-0.3807399, 0.5007116, -0.4240587, 0, 1, 0.1529412, 1,
-0.378117, -1.0481, -1.496304, 0, 1, 0.1607843, 1,
-0.375322, 0.0234449, -1.161225, 0, 1, 0.1647059, 1,
-0.3722911, 0.08560271, -2.652507, 0, 1, 0.172549, 1,
-0.371246, -0.7578987, -2.122198, 0, 1, 0.1764706, 1,
-0.36733, 0.1547322, -0.4347418, 0, 1, 0.1843137, 1,
-0.3647177, -0.7798707, -2.972018, 0, 1, 0.1882353, 1,
-0.3646345, 1.145543, -2.044879, 0, 1, 0.1960784, 1,
-0.3536812, 0.4602088, -0.2151154, 0, 1, 0.2039216, 1,
-0.3423984, 0.3373228, -0.5504383, 0, 1, 0.2078431, 1,
-0.3414313, 0.6129469, -0.7462156, 0, 1, 0.2156863, 1,
-0.3302709, 1.171879, -0.5861461, 0, 1, 0.2196078, 1,
-0.3282709, -0.7068313, -1.018911, 0, 1, 0.227451, 1,
-0.3254891, -0.9762613, -4.120051, 0, 1, 0.2313726, 1,
-0.3223094, 0.2873285, -1.216416, 0, 1, 0.2392157, 1,
-0.3213679, 0.2658418, 1.179327, 0, 1, 0.2431373, 1,
-0.3163041, -0.7775846, -4.446243, 0, 1, 0.2509804, 1,
-0.3125015, -1.225042, -2.403413, 0, 1, 0.254902, 1,
-0.3115019, 0.4864537, -0.1659646, 0, 1, 0.2627451, 1,
-0.3103109, 1.119199, 0.1705338, 0, 1, 0.2666667, 1,
-0.3081677, 2.05302, 0.672878, 0, 1, 0.2745098, 1,
-0.3052965, 1.183137, 0.2328313, 0, 1, 0.2784314, 1,
-0.3022184, -0.0210926, -0.886695, 0, 1, 0.2862745, 1,
-0.299494, 0.1864929, -1.459291, 0, 1, 0.2901961, 1,
-0.2978977, 1.517884, 0.3353964, 0, 1, 0.2980392, 1,
-0.2963531, 0.5747943, -0.4000807, 0, 1, 0.3058824, 1,
-0.2959054, -0.8936748, -3.224841, 0, 1, 0.3098039, 1,
-0.2941281, -0.5686178, -1.290208, 0, 1, 0.3176471, 1,
-0.2921826, -0.139432, -1.367, 0, 1, 0.3215686, 1,
-0.2914128, -0.01471684, -0.9068249, 0, 1, 0.3294118, 1,
-0.291215, -0.6952624, -1.36201, 0, 1, 0.3333333, 1,
-0.2880787, 0.8380903, 1.630697, 0, 1, 0.3411765, 1,
-0.287624, 0.5012285, -1.500139, 0, 1, 0.345098, 1,
-0.2870591, 0.2230735, -0.3039857, 0, 1, 0.3529412, 1,
-0.2862566, -0.7247012, -3.461785, 0, 1, 0.3568628, 1,
-0.2859524, 0.8640359, -1.401208, 0, 1, 0.3647059, 1,
-0.28499, -1.607541, -1.611154, 0, 1, 0.3686275, 1,
-0.2822054, 0.3106082, 0.5231618, 0, 1, 0.3764706, 1,
-0.2811584, -0.0887681, -3.059965, 0, 1, 0.3803922, 1,
-0.280593, 0.294319, -2.019493, 0, 1, 0.3882353, 1,
-0.2764921, -0.3495203, -2.617702, 0, 1, 0.3921569, 1,
-0.2761012, 1.498013, -1.168381, 0, 1, 0.4, 1,
-0.2757351, 0.06296832, -2.026657, 0, 1, 0.4078431, 1,
-0.2734917, -0.5751407, -3.390875, 0, 1, 0.4117647, 1,
-0.2723198, -1.761883, -1.592789, 0, 1, 0.4196078, 1,
-0.268505, 0.240247, -1.272023, 0, 1, 0.4235294, 1,
-0.2672974, -0.5586097, -4.455817, 0, 1, 0.4313726, 1,
-0.2669861, -0.5070136, -2.945895, 0, 1, 0.4352941, 1,
-0.2628932, -0.3474589, -1.553139, 0, 1, 0.4431373, 1,
-0.2616296, -0.14457, -1.144504, 0, 1, 0.4470588, 1,
-0.261255, 0.8845177, 0.9265409, 0, 1, 0.454902, 1,
-0.2552972, -1.421101, -3.554886, 0, 1, 0.4588235, 1,
-0.2497082, -1.399467, -2.062781, 0, 1, 0.4666667, 1,
-0.2471036, 1.240778, 0.1835856, 0, 1, 0.4705882, 1,
-0.2396669, 0.2137669, -1.150146, 0, 1, 0.4784314, 1,
-0.2394705, 0.0475244, -1.60062, 0, 1, 0.4823529, 1,
-0.2376988, -0.2316428, -4.465061, 0, 1, 0.4901961, 1,
-0.2361342, 1.240124, -1.089194, 0, 1, 0.4941176, 1,
-0.2303338, -0.6266852, -1.331255, 0, 1, 0.5019608, 1,
-0.2285169, -1.071137, -4.162196, 0, 1, 0.509804, 1,
-0.2250279, 2.06198, -1.38747, 0, 1, 0.5137255, 1,
-0.2241429, -0.8897262, -3.341257, 0, 1, 0.5215687, 1,
-0.2236901, -0.4149959, -4.060684, 0, 1, 0.5254902, 1,
-0.2228325, -1.753862, -3.395769, 0, 1, 0.5333334, 1,
-0.2223475, -1.645064, -4.504839, 0, 1, 0.5372549, 1,
-0.2202695, -0.8763839, -2.339937, 0, 1, 0.5450981, 1,
-0.219353, 0.3505318, -1.70228, 0, 1, 0.5490196, 1,
-0.2176889, 0.5672231, -1.915393, 0, 1, 0.5568628, 1,
-0.2150621, 0.08828442, -2.5586, 0, 1, 0.5607843, 1,
-0.2130012, -1.46663, -3.945729, 0, 1, 0.5686275, 1,
-0.2112981, -0.1758689, -1.963544, 0, 1, 0.572549, 1,
-0.2100305, -0.2845524, -0.9876363, 0, 1, 0.5803922, 1,
-0.209665, -0.7648987, -2.727741, 0, 1, 0.5843138, 1,
-0.2075421, -1.544303, -2.498968, 0, 1, 0.5921569, 1,
-0.2057201, 0.4122927, -0.5706147, 0, 1, 0.5960785, 1,
-0.205481, -0.2433703, -3.892575, 0, 1, 0.6039216, 1,
-0.2004794, -0.5279791, -3.670569, 0, 1, 0.6117647, 1,
-0.1996916, 0.902563, -0.9002839, 0, 1, 0.6156863, 1,
-0.1991255, 1.232648, -0.06108032, 0, 1, 0.6235294, 1,
-0.1949134, 1.833889, 0.3751673, 0, 1, 0.627451, 1,
-0.1942743, 0.4872684, 1.113516, 0, 1, 0.6352941, 1,
-0.1921726, 0.2961699, -0.7778386, 0, 1, 0.6392157, 1,
-0.187221, 1.359313, 0.977425, 0, 1, 0.6470588, 1,
-0.1870855, -0.1129439, -2.313711, 0, 1, 0.6509804, 1,
-0.1869912, 0.9010903, -0.8048308, 0, 1, 0.6588235, 1,
-0.1790375, -0.2100151, -2.948658, 0, 1, 0.6627451, 1,
-0.1782356, -0.2565199, -3.824667, 0, 1, 0.6705883, 1,
-0.1756525, -0.04211668, -0.8766763, 0, 1, 0.6745098, 1,
-0.1754743, 0.7781718, 0.02696512, 0, 1, 0.682353, 1,
-0.173667, -0.2074356, -3.83827, 0, 1, 0.6862745, 1,
-0.1718785, -0.2450331, -2.9668, 0, 1, 0.6941177, 1,
-0.1679534, 0.3401187, -2.441777, 0, 1, 0.7019608, 1,
-0.1679161, -1.464659, -2.55139, 0, 1, 0.7058824, 1,
-0.1656244, -0.5980163, -1.740375, 0, 1, 0.7137255, 1,
-0.1643677, 0.9030848, 1.309507, 0, 1, 0.7176471, 1,
-0.1530358, 0.0301073, -3.637064, 0, 1, 0.7254902, 1,
-0.1523573, 0.6461503, 0.7086189, 0, 1, 0.7294118, 1,
-0.1490472, -1.213259, -2.119592, 0, 1, 0.7372549, 1,
-0.135764, -1.493894, -4.56406, 0, 1, 0.7411765, 1,
-0.1356527, -1.090878, -2.339889, 0, 1, 0.7490196, 1,
-0.1348434, 1.058075, 0.2934929, 0, 1, 0.7529412, 1,
-0.1340143, -0.5815499, -1.751609, 0, 1, 0.7607843, 1,
-0.1323859, -0.2616102, -4.539587, 0, 1, 0.7647059, 1,
-0.126549, -0.3330715, -2.254483, 0, 1, 0.772549, 1,
-0.1245931, -0.5994362, -1.602275, 0, 1, 0.7764706, 1,
-0.1230334, -0.03009384, -2.041887, 0, 1, 0.7843137, 1,
-0.1190952, -0.1145645, -2.205587, 0, 1, 0.7882353, 1,
-0.1187602, -0.6382357, -3.480213, 0, 1, 0.7960784, 1,
-0.1146588, 0.7093562, -0.3714137, 0, 1, 0.8039216, 1,
-0.1143839, -0.2734148, -3.962351, 0, 1, 0.8078431, 1,
-0.1124332, -0.7832366, -2.410718, 0, 1, 0.8156863, 1,
-0.1102819, 1.725825, -0.2062846, 0, 1, 0.8196079, 1,
-0.1082469, 0.5893355, -0.4022521, 0, 1, 0.827451, 1,
-0.1016409, 0.00659487, -1.626638, 0, 1, 0.8313726, 1,
-0.09780167, 0.084222, 1.198667, 0, 1, 0.8392157, 1,
-0.09402633, -0.1984057, -3.607188, 0, 1, 0.8431373, 1,
-0.09260083, -1.029647, -3.329387, 0, 1, 0.8509804, 1,
-0.0920258, 1.248449, 1.33015, 0, 1, 0.854902, 1,
-0.09123641, -0.5124178, -3.320872, 0, 1, 0.8627451, 1,
-0.09008525, -1.297709, -2.678478, 0, 1, 0.8666667, 1,
-0.08988089, 1.142349, 1.162725, 0, 1, 0.8745098, 1,
-0.08752335, -1.120478, -4.045417, 0, 1, 0.8784314, 1,
-0.08422723, -0.1454091, -2.104528, 0, 1, 0.8862745, 1,
-0.08334344, 1.4657, 1.190614, 0, 1, 0.8901961, 1,
-0.08148125, 1.851889, -0.8551555, 0, 1, 0.8980392, 1,
-0.07789595, 0.6145601, -0.8017773, 0, 1, 0.9058824, 1,
-0.07198692, 0.06655638, -2.047946, 0, 1, 0.9098039, 1,
-0.06728446, -1.19973, -3.088933, 0, 1, 0.9176471, 1,
-0.06666764, 0.09986811, 0.2972012, 0, 1, 0.9215686, 1,
-0.06415214, 0.4662062, 2.001587, 0, 1, 0.9294118, 1,
-0.0584971, -0.0571233, -3.139852, 0, 1, 0.9333333, 1,
-0.05103665, 1.544608, 0.5445641, 0, 1, 0.9411765, 1,
-0.04725553, -0.4932363, -3.509057, 0, 1, 0.945098, 1,
-0.04330407, -0.4557503, -2.484345, 0, 1, 0.9529412, 1,
-0.0425521, -1.626631, -3.963175, 0, 1, 0.9568627, 1,
-0.03981483, 1.676818, 2.028048, 0, 1, 0.9647059, 1,
-0.03775595, 0.3459513, -0.4687357, 0, 1, 0.9686275, 1,
-0.02409125, 0.1360529, -0.6172369, 0, 1, 0.9764706, 1,
-0.023977, 0.2769976, -0.7399397, 0, 1, 0.9803922, 1,
-0.02311519, 0.3555664, -1.416243, 0, 1, 0.9882353, 1,
-0.02152788, -1.459276, -3.402464, 0, 1, 0.9921569, 1,
-0.02070339, -0.9541789, -3.759043, 0, 1, 1, 1,
-0.01947555, 0.1940828, 1.500046, 0, 0.9921569, 1, 1,
-0.01703361, -1.38741, -1.898609, 0, 0.9882353, 1, 1,
-0.01174514, -0.4666145, -3.590805, 0, 0.9803922, 1, 1,
-0.01054199, -0.6736466, -3.502889, 0, 0.9764706, 1, 1,
-0.01027936, 1.117006, 0.4324921, 0, 0.9686275, 1, 1,
-0.005538602, 0.5288185, -0.6516761, 0, 0.9647059, 1, 1,
-0.002023609, 0.7465291, -1.874294, 0, 0.9568627, 1, 1,
0.00160165, -0.3319762, 3.29152, 0, 0.9529412, 1, 1,
0.006164807, -0.2701762, 2.231751, 0, 0.945098, 1, 1,
0.008609478, -0.2426046, 4.495689, 0, 0.9411765, 1, 1,
0.01208447, 0.4890993, -1.295501, 0, 0.9333333, 1, 1,
0.01538502, -1.949712, 3.021317, 0, 0.9294118, 1, 1,
0.01947303, -0.08402201, 2.95897, 0, 0.9215686, 1, 1,
0.02375082, 1.121285, 0.5731907, 0, 0.9176471, 1, 1,
0.02904977, -0.4592336, 3.443974, 0, 0.9098039, 1, 1,
0.03009191, 1.126193, 0.6758171, 0, 0.9058824, 1, 1,
0.03184737, -0.5120884, 3.564786, 0, 0.8980392, 1, 1,
0.0336888, -0.02296546, 1.644944, 0, 0.8901961, 1, 1,
0.04293202, -2.121239, 3.617478, 0, 0.8862745, 1, 1,
0.04553144, -0.3784279, 3.581916, 0, 0.8784314, 1, 1,
0.04995894, 0.4285289, -0.3092391, 0, 0.8745098, 1, 1,
0.05119766, 0.6324134, 1.164407, 0, 0.8666667, 1, 1,
0.05212223, -1.320222, 3.554773, 0, 0.8627451, 1, 1,
0.05883775, -0.0739234, 2.316447, 0, 0.854902, 1, 1,
0.0594497, -0.1215614, 2.542812, 0, 0.8509804, 1, 1,
0.06235478, -0.4148013, 5.372635, 0, 0.8431373, 1, 1,
0.0650823, 0.3961615, -1.442079, 0, 0.8392157, 1, 1,
0.06686279, 0.1427811, -0.3711546, 0, 0.8313726, 1, 1,
0.07066388, 1.069551, 1.375433, 0, 0.827451, 1, 1,
0.07712525, 2.40282, -0.4922349, 0, 0.8196079, 1, 1,
0.08149675, 2.179358, -2.572481, 0, 0.8156863, 1, 1,
0.08354863, -0.4647113, 2.840715, 0, 0.8078431, 1, 1,
0.08679466, -0.9670371, 2.537583, 0, 0.8039216, 1, 1,
0.08876205, 0.009331371, 1.19545, 0, 0.7960784, 1, 1,
0.08971936, -0.8677648, 2.17758, 0, 0.7882353, 1, 1,
0.0908258, -0.4719311, 2.379709, 0, 0.7843137, 1, 1,
0.09522507, -1.508709, 2.725913, 0, 0.7764706, 1, 1,
0.1078389, -1.854275, 2.67523, 0, 0.772549, 1, 1,
0.1104952, 1.596839, -0.4966278, 0, 0.7647059, 1, 1,
0.1111522, -1.209587, 3.091568, 0, 0.7607843, 1, 1,
0.1140234, -0.04355186, 3.981735, 0, 0.7529412, 1, 1,
0.1142856, 1.418132, 0.2318762, 0, 0.7490196, 1, 1,
0.117161, 0.2446398, 2.911692, 0, 0.7411765, 1, 1,
0.1222481, 0.7410061, 0.06239301, 0, 0.7372549, 1, 1,
0.1250159, -1.044973, 4.354427, 0, 0.7294118, 1, 1,
0.1269958, -0.8011243, 3.138969, 0, 0.7254902, 1, 1,
0.1272272, 0.2820461, 1.54525, 0, 0.7176471, 1, 1,
0.1286833, -1.772151, 2.153182, 0, 0.7137255, 1, 1,
0.1292975, 0.7801616, -2.29638, 0, 0.7058824, 1, 1,
0.1303017, 1.321111, -0.02577683, 0, 0.6980392, 1, 1,
0.1327294, 0.3436011, -0.3072652, 0, 0.6941177, 1, 1,
0.1371787, 0.7184441, 0.1055977, 0, 0.6862745, 1, 1,
0.1428332, -0.3276692, 2.74865, 0, 0.682353, 1, 1,
0.1474251, -1.927352, 4.534124, 0, 0.6745098, 1, 1,
0.1492345, -0.8077595, 3.861747, 0, 0.6705883, 1, 1,
0.1496533, 0.3702372, 0.2660862, 0, 0.6627451, 1, 1,
0.1529437, -1.673288, 3.251336, 0, 0.6588235, 1, 1,
0.1531877, -0.08601272, 2.342075, 0, 0.6509804, 1, 1,
0.1568792, -0.9987457, 1.900956, 0, 0.6470588, 1, 1,
0.1585157, -0.9219179, 2.823917, 0, 0.6392157, 1, 1,
0.1615909, -0.1250412, 0.6180425, 0, 0.6352941, 1, 1,
0.1649553, 0.6962422, 1.274617, 0, 0.627451, 1, 1,
0.1723374, -1.931416, 1.99506, 0, 0.6235294, 1, 1,
0.1730709, 0.9980929, 1.176998, 0, 0.6156863, 1, 1,
0.1814056, -0.6464667, 3.793447, 0, 0.6117647, 1, 1,
0.1817904, -2.552211, 1.46357, 0, 0.6039216, 1, 1,
0.18182, -0.4490676, 0.8041648, 0, 0.5960785, 1, 1,
0.1841108, -1.406007, 3.721246, 0, 0.5921569, 1, 1,
0.184372, -1.080392, 2.241197, 0, 0.5843138, 1, 1,
0.188946, -1.876231, 3.242779, 0, 0.5803922, 1, 1,
0.1909069, -1.174289, 3.79682, 0, 0.572549, 1, 1,
0.1920763, -0.5391209, 1.558, 0, 0.5686275, 1, 1,
0.2005417, 0.2513126, -0.1724377, 0, 0.5607843, 1, 1,
0.2026963, -1.455577, 1.485835, 0, 0.5568628, 1, 1,
0.2083917, -0.6839782, 2.913002, 0, 0.5490196, 1, 1,
0.2090169, 0.7750279, 0.3457468, 0, 0.5450981, 1, 1,
0.2090456, -1.65175, 3.020726, 0, 0.5372549, 1, 1,
0.2118002, -0.433067, 2.476215, 0, 0.5333334, 1, 1,
0.2174635, 0.3345571, 0.8963103, 0, 0.5254902, 1, 1,
0.2177878, 1.453792, -1.27253, 0, 0.5215687, 1, 1,
0.2202155, -0.6353499, 1.587548, 0, 0.5137255, 1, 1,
0.2220404, 1.311906, 0.2774375, 0, 0.509804, 1, 1,
0.2230793, -1.659846, 2.013618, 0, 0.5019608, 1, 1,
0.2236881, 0.544389, 0.6045743, 0, 0.4941176, 1, 1,
0.2237878, 1.107262, 0.9835266, 0, 0.4901961, 1, 1,
0.2246294, -0.453133, 4.298582, 0, 0.4823529, 1, 1,
0.2299498, -1.179654, 3.144033, 0, 0.4784314, 1, 1,
0.2313658, -0.9404132, 2.264398, 0, 0.4705882, 1, 1,
0.2337709, -0.8786485, 1.860507, 0, 0.4666667, 1, 1,
0.2339502, -0.1023387, 0.7045269, 0, 0.4588235, 1, 1,
0.2380933, 0.2800417, 0.1189524, 0, 0.454902, 1, 1,
0.2426413, 0.3417073, 0.4844404, 0, 0.4470588, 1, 1,
0.2438339, 0.6278423, -0.2209898, 0, 0.4431373, 1, 1,
0.2447147, 0.07385451, 0.4181322, 0, 0.4352941, 1, 1,
0.2485392, -0.09048925, 2.169845, 0, 0.4313726, 1, 1,
0.2542884, -0.8266435, 3.074745, 0, 0.4235294, 1, 1,
0.2574738, 0.1507427, 2.714003, 0, 0.4196078, 1, 1,
0.2601778, -1.405554, 3.606781, 0, 0.4117647, 1, 1,
0.2606065, 1.151549, 0.05900049, 0, 0.4078431, 1, 1,
0.2628542, -0.007960089, 1.447877, 0, 0.4, 1, 1,
0.2640261, 1.451617, -0.1692391, 0, 0.3921569, 1, 1,
0.2707636, -0.366112, 3.89743, 0, 0.3882353, 1, 1,
0.2764723, 1.817054, 1.599741, 0, 0.3803922, 1, 1,
0.2789506, 0.04811757, 1.678831, 0, 0.3764706, 1, 1,
0.2828064, -0.5701756, 1.502265, 0, 0.3686275, 1, 1,
0.2844666, 1.200385, 0.7506273, 0, 0.3647059, 1, 1,
0.2849112, 1.570829, 0.1075889, 0, 0.3568628, 1, 1,
0.2863773, -1.089217, 4.174449, 0, 0.3529412, 1, 1,
0.2891292, -0.873586, 3.292878, 0, 0.345098, 1, 1,
0.2891759, -1.173022, 2.433258, 0, 0.3411765, 1, 1,
0.29187, 0.4521561, -0.06143677, 0, 0.3333333, 1, 1,
0.2950967, 1.098253, -1.110001, 0, 0.3294118, 1, 1,
0.2954205, 0.2890931, 1.486496, 0, 0.3215686, 1, 1,
0.2988828, -0.09189894, -1.236248, 0, 0.3176471, 1, 1,
0.300496, 1.246546, 0.2091873, 0, 0.3098039, 1, 1,
0.3012137, -2.803363, 3.236153, 0, 0.3058824, 1, 1,
0.3055716, -0.5700857, 2.59033, 0, 0.2980392, 1, 1,
0.3095624, 0.2517743, -0.4907296, 0, 0.2901961, 1, 1,
0.3135234, -0.3064965, 1.502969, 0, 0.2862745, 1, 1,
0.3146375, 0.6206841, 1.498991, 0, 0.2784314, 1, 1,
0.3149826, 0.1454761, 1.61448, 0, 0.2745098, 1, 1,
0.3150774, 0.8324772, -0.2407743, 0, 0.2666667, 1, 1,
0.3193162, 1.521391, 0.6402035, 0, 0.2627451, 1, 1,
0.326292, -0.1336302, 1.173774, 0, 0.254902, 1, 1,
0.3264098, -0.437754, 3.125765, 0, 0.2509804, 1, 1,
0.3304676, -0.7257386, 3.581713, 0, 0.2431373, 1, 1,
0.3328249, 1.807272, -0.9359508, 0, 0.2392157, 1, 1,
0.3376363, 2.444647, 0.4508356, 0, 0.2313726, 1, 1,
0.3421456, 2.135487, -1.550583, 0, 0.227451, 1, 1,
0.3440942, -0.1509643, 2.62768, 0, 0.2196078, 1, 1,
0.3460769, 0.2669306, 1.648181, 0, 0.2156863, 1, 1,
0.3541005, 0.1148921, 1.290947, 0, 0.2078431, 1, 1,
0.354847, 1.008217, 1.656199, 0, 0.2039216, 1, 1,
0.3605096, 0.4058479, 1.905405, 0, 0.1960784, 1, 1,
0.3611226, -0.09374908, 3.676506, 0, 0.1882353, 1, 1,
0.3641062, 1.612386, -1.244961, 0, 0.1843137, 1, 1,
0.3650571, 0.8982683, -0.5384256, 0, 0.1764706, 1, 1,
0.3652647, 1.038624, 1.151319, 0, 0.172549, 1, 1,
0.3656015, 0.6515489, 0.7459506, 0, 0.1647059, 1, 1,
0.3693063, -0.4438454, 1.669926, 0, 0.1607843, 1, 1,
0.3701345, 0.7946799, 0.2543154, 0, 0.1529412, 1, 1,
0.3713706, 1.737665, 0.5712134, 0, 0.1490196, 1, 1,
0.3739258, -0.7334318, 4.456535, 0, 0.1411765, 1, 1,
0.3753537, -0.448809, 2.282239, 0, 0.1372549, 1, 1,
0.3769726, -0.6775608, 2.771628, 0, 0.1294118, 1, 1,
0.378219, -0.8945979, 3.69396, 0, 0.1254902, 1, 1,
0.3792809, 0.8396985, 0.8251082, 0, 0.1176471, 1, 1,
0.3809986, -1.69065, 4.354064, 0, 0.1137255, 1, 1,
0.3811756, -0.1181675, 1.366989, 0, 0.1058824, 1, 1,
0.3815957, -0.6186973, 2.363949, 0, 0.09803922, 1, 1,
0.3818423, -0.008308682, 2.283896, 0, 0.09411765, 1, 1,
0.3864256, -2.45498, 4.464299, 0, 0.08627451, 1, 1,
0.3884115, -0.1587543, 1.248956, 0, 0.08235294, 1, 1,
0.3891969, -1.229272, 3.441353, 0, 0.07450981, 1, 1,
0.3914065, -1.35769, 2.989218, 0, 0.07058824, 1, 1,
0.3934428, 0.2662852, 2.698181, 0, 0.0627451, 1, 1,
0.3939954, -0.938539, 4.072013, 0, 0.05882353, 1, 1,
0.3954806, -2.21206, 1.649185, 0, 0.05098039, 1, 1,
0.3987471, 1.87917, -0.2095441, 0, 0.04705882, 1, 1,
0.4008339, 0.1805593, 0.8354676, 0, 0.03921569, 1, 1,
0.4045649, -1.466081, 1.844406, 0, 0.03529412, 1, 1,
0.4055422, 0.1338092, -0.1065779, 0, 0.02745098, 1, 1,
0.4107572, -0.3402425, 1.900739, 0, 0.02352941, 1, 1,
0.4114462, 0.5690767, 0.4589756, 0, 0.01568628, 1, 1,
0.4156583, -0.7742818, 2.010793, 0, 0.01176471, 1, 1,
0.4179471, -0.524525, 0.9170457, 0, 0.003921569, 1, 1,
0.4195741, -0.3400494, 1.635871, 0.003921569, 0, 1, 1,
0.4232976, 0.4461786, 3.502983, 0.007843138, 0, 1, 1,
0.4247805, -1.606075, 2.377475, 0.01568628, 0, 1, 1,
0.425629, 0.3563781, 2.168496, 0.01960784, 0, 1, 1,
0.4286169, -0.3928293, 2.173784, 0.02745098, 0, 1, 1,
0.4296066, 1.588307, -0.7428641, 0.03137255, 0, 1, 1,
0.4311928, 1.49065, -0.6110427, 0.03921569, 0, 1, 1,
0.4345517, 0.02272674, 1.424907, 0.04313726, 0, 1, 1,
0.4377123, -1.11614, 3.605662, 0.05098039, 0, 1, 1,
0.438963, 0.009712177, -0.03091504, 0.05490196, 0, 1, 1,
0.4404365, 0.2740615, 1.015567, 0.0627451, 0, 1, 1,
0.4433973, 1.19215, -0.6161135, 0.06666667, 0, 1, 1,
0.4435776, 1.15499, -0.04206685, 0.07450981, 0, 1, 1,
0.4445764, 0.032305, 0.3222356, 0.07843138, 0, 1, 1,
0.4452798, 0.1626369, 2.093978, 0.08627451, 0, 1, 1,
0.4465192, 2.709553, -1.233344, 0.09019608, 0, 1, 1,
0.4485541, -3.17262, 3.69818, 0.09803922, 0, 1, 1,
0.4513174, -0.3943514, 2.478745, 0.1058824, 0, 1, 1,
0.4517309, 0.4253694, 1.263734, 0.1098039, 0, 1, 1,
0.4534916, -2.652677, 4.631706, 0.1176471, 0, 1, 1,
0.4548518, 0.8231226, 1.237616, 0.1215686, 0, 1, 1,
0.4593285, -1.796246, 3.227949, 0.1294118, 0, 1, 1,
0.4600646, 0.3725685, -0.7500008, 0.1333333, 0, 1, 1,
0.4606716, 0.1729302, 1.027464, 0.1411765, 0, 1, 1,
0.4705804, -1.385513, 3.900696, 0.145098, 0, 1, 1,
0.4713654, -0.7563854, 3.399265, 0.1529412, 0, 1, 1,
0.472117, -0.5162525, 1.587511, 0.1568628, 0, 1, 1,
0.4796121, -0.6358578, 2.406327, 0.1647059, 0, 1, 1,
0.4812017, 1.112703, 1.046293, 0.1686275, 0, 1, 1,
0.482359, -2.06297, 4.501729, 0.1764706, 0, 1, 1,
0.4827336, 0.1691693, -0.9840041, 0.1803922, 0, 1, 1,
0.4842469, 1.801212, 0.6491423, 0.1882353, 0, 1, 1,
0.4852775, -1.752051, 3.955154, 0.1921569, 0, 1, 1,
0.4887867, 0.4634706, -0.05044311, 0.2, 0, 1, 1,
0.4887868, -1.582965, 1.753326, 0.2078431, 0, 1, 1,
0.4922962, -0.75231, 1.813663, 0.2117647, 0, 1, 1,
0.4971241, -0.3110181, 2.440761, 0.2196078, 0, 1, 1,
0.4971894, -1.414217, 2.888278, 0.2235294, 0, 1, 1,
0.4990581, 0.6089613, 0.1374054, 0.2313726, 0, 1, 1,
0.5038257, -0.8864045, 2.243828, 0.2352941, 0, 1, 1,
0.5064335, -1.193616, 2.683818, 0.2431373, 0, 1, 1,
0.5072743, 1.01166, 0.5851642, 0.2470588, 0, 1, 1,
0.5074255, 0.1969825, 0.3288338, 0.254902, 0, 1, 1,
0.5074292, 1.414208, -1.398871, 0.2588235, 0, 1, 1,
0.5088676, -0.3307874, 2.726642, 0.2666667, 0, 1, 1,
0.5155529, -0.4139154, 2.838677, 0.2705882, 0, 1, 1,
0.5199867, -0.711928, 2.190708, 0.2784314, 0, 1, 1,
0.5245313, 0.2223982, 0.8284582, 0.282353, 0, 1, 1,
0.5289949, 0.736107, 1.703891, 0.2901961, 0, 1, 1,
0.5317059, -1.204277, 2.605499, 0.2941177, 0, 1, 1,
0.534043, 0.4254151, 1.384553, 0.3019608, 0, 1, 1,
0.5369524, 1.565868, -0.6980874, 0.3098039, 0, 1, 1,
0.5401469, 0.4580703, 0.7830141, 0.3137255, 0, 1, 1,
0.5405079, -0.8710927, 3.906886, 0.3215686, 0, 1, 1,
0.5508153, 0.06133492, 1.262599, 0.3254902, 0, 1, 1,
0.5522432, -0.4144118, 3.01765, 0.3333333, 0, 1, 1,
0.557598, -0.8083678, 0.9864407, 0.3372549, 0, 1, 1,
0.5595996, 0.3523814, 2.658642, 0.345098, 0, 1, 1,
0.5598469, 2.032184, -0.7909516, 0.3490196, 0, 1, 1,
0.563044, 1.906619, -0.8199298, 0.3568628, 0, 1, 1,
0.5657067, 0.4343294, 1.368113, 0.3607843, 0, 1, 1,
0.5659567, -0.7762793, 1.07748, 0.3686275, 0, 1, 1,
0.5662587, 1.378993, 0.7080842, 0.372549, 0, 1, 1,
0.5663437, 1.750871, 0.0309318, 0.3803922, 0, 1, 1,
0.5705118, -0.098307, 0.7512742, 0.3843137, 0, 1, 1,
0.5715489, -0.8336182, 0.3258758, 0.3921569, 0, 1, 1,
0.5731224, -0.1181259, 2.185776, 0.3960784, 0, 1, 1,
0.5732748, -1.058369, 3.114729, 0.4039216, 0, 1, 1,
0.5951595, -0.5666068, 3.300265, 0.4117647, 0, 1, 1,
0.6022635, -0.3137754, 1.601657, 0.4156863, 0, 1, 1,
0.6034747, -0.1506919, 2.616027, 0.4235294, 0, 1, 1,
0.6034845, -0.9107722, 2.369572, 0.427451, 0, 1, 1,
0.6063923, 1.148464, 0.8991263, 0.4352941, 0, 1, 1,
0.6077916, -1.379543, 2.398175, 0.4392157, 0, 1, 1,
0.6078916, -3.32056, 3.07429, 0.4470588, 0, 1, 1,
0.6094252, -1.090412, 1.48816, 0.4509804, 0, 1, 1,
0.6100979, 0.207559, 1.1872, 0.4588235, 0, 1, 1,
0.6128342, 1.309537, 0.9538868, 0.4627451, 0, 1, 1,
0.6245836, 0.2664964, 0.4004148, 0.4705882, 0, 1, 1,
0.6249942, -0.1084525, 0.9286978, 0.4745098, 0, 1, 1,
0.6274804, 2.348931, -0.3280603, 0.4823529, 0, 1, 1,
0.6303144, -1.068469, 3.27743, 0.4862745, 0, 1, 1,
0.6332774, -0.9403816, 2.091176, 0.4941176, 0, 1, 1,
0.6413417, 0.6263461, -0.05950335, 0.5019608, 0, 1, 1,
0.6428097, 0.4851224, 2.128177, 0.5058824, 0, 1, 1,
0.6437836, 1.784208, -1.168959, 0.5137255, 0, 1, 1,
0.6471027, 1.155928, 1.520582, 0.5176471, 0, 1, 1,
0.6586287, 0.4301851, 1.47823, 0.5254902, 0, 1, 1,
0.659117, -0.7868397, 1.57899, 0.5294118, 0, 1, 1,
0.6594898, -1.438275, 2.778122, 0.5372549, 0, 1, 1,
0.6602145, -0.4809658, 0.882142, 0.5411765, 0, 1, 1,
0.6605875, 0.2949017, -0.5152791, 0.5490196, 0, 1, 1,
0.6638334, -1.032941, 2.866974, 0.5529412, 0, 1, 1,
0.6639388, -0.9931001, 3.778181, 0.5607843, 0, 1, 1,
0.6684061, -0.0034363, 1.156958, 0.5647059, 0, 1, 1,
0.6801887, 0.4149753, 1.038023, 0.572549, 0, 1, 1,
0.6820383, 0.8230014, 1.189689, 0.5764706, 0, 1, 1,
0.6833018, -1.157261, 3.078043, 0.5843138, 0, 1, 1,
0.6854306, -0.01419833, 2.182868, 0.5882353, 0, 1, 1,
0.689608, -0.5798126, 2.873484, 0.5960785, 0, 1, 1,
0.6912626, 1.444373, -0.2858523, 0.6039216, 0, 1, 1,
0.6916173, 1.239364, 1.505142, 0.6078432, 0, 1, 1,
0.6988798, -0.4506616, 2.258737, 0.6156863, 0, 1, 1,
0.7001106, -1.081872, 0.505717, 0.6196079, 0, 1, 1,
0.704427, -1.657339, 1.855343, 0.627451, 0, 1, 1,
0.7046012, -1.284314, 5.072231, 0.6313726, 0, 1, 1,
0.7068248, -0.944189, 3.164473, 0.6392157, 0, 1, 1,
0.7086998, -0.3982383, 2.080965, 0.6431373, 0, 1, 1,
0.7093141, 0.8360814, 0.5055529, 0.6509804, 0, 1, 1,
0.7093166, 0.9060113, 4.09068, 0.654902, 0, 1, 1,
0.7098671, 0.8786608, 1.35614, 0.6627451, 0, 1, 1,
0.7170413, 0.005089947, 3.426906, 0.6666667, 0, 1, 1,
0.7185211, -0.0007656369, 1.134985, 0.6745098, 0, 1, 1,
0.7188268, 0.990086, 0.6280646, 0.6784314, 0, 1, 1,
0.7235436, -0.6994689, 1.663897, 0.6862745, 0, 1, 1,
0.7244748, -1.333392, 1.774418, 0.6901961, 0, 1, 1,
0.7276587, 0.1129045, 1.295996, 0.6980392, 0, 1, 1,
0.7315525, -0.2301222, 2.461833, 0.7058824, 0, 1, 1,
0.7415845, 0.2401321, 0.5837297, 0.7098039, 0, 1, 1,
0.7464278, 0.7649395, -0.6936104, 0.7176471, 0, 1, 1,
0.7475789, -1.474028, 2.849096, 0.7215686, 0, 1, 1,
0.75781, -2.047121, 2.257834, 0.7294118, 0, 1, 1,
0.7578254, -0.5907032, 2.920067, 0.7333333, 0, 1, 1,
0.7628569, 1.052602, 2.316087, 0.7411765, 0, 1, 1,
0.7734484, -1.673768, 0.9811887, 0.7450981, 0, 1, 1,
0.7776479, 0.5393898, 0.9904738, 0.7529412, 0, 1, 1,
0.7824818, 0.3579813, 0.7033125, 0.7568628, 0, 1, 1,
0.7871085, -1.687295, 2.77329, 0.7647059, 0, 1, 1,
0.7885959, 0.6955312, 0.6433271, 0.7686275, 0, 1, 1,
0.7887886, 0.4904855, 2.801418, 0.7764706, 0, 1, 1,
0.7913765, 1.297558, -0.5241473, 0.7803922, 0, 1, 1,
0.7926914, 2.499221, -0.08423902, 0.7882353, 0, 1, 1,
0.7990678, 2.338828, 0.1863957, 0.7921569, 0, 1, 1,
0.7991785, 0.4045367, -0.6668614, 0.8, 0, 1, 1,
0.8002064, 0.925121, 0.06229404, 0.8078431, 0, 1, 1,
0.8071684, 0.214344, 1.01091, 0.8117647, 0, 1, 1,
0.8153262, 0.5946912, 4.587469, 0.8196079, 0, 1, 1,
0.8167188, -2.03501, 3.070585, 0.8235294, 0, 1, 1,
0.8205625, -0.4617156, 2.218001, 0.8313726, 0, 1, 1,
0.8255821, -0.8689769, 1.955236, 0.8352941, 0, 1, 1,
0.8274575, -0.1161985, 1.077738, 0.8431373, 0, 1, 1,
0.830049, 0.2370193, 0.3292816, 0.8470588, 0, 1, 1,
0.8352424, -1.685674, 2.955979, 0.854902, 0, 1, 1,
0.8378589, 0.758212, 1.399802, 0.8588235, 0, 1, 1,
0.8394119, -0.6914158, 2.196956, 0.8666667, 0, 1, 1,
0.8421744, -0.4401249, 3.70735, 0.8705882, 0, 1, 1,
0.8462211, -0.4262023, 2.027526, 0.8784314, 0, 1, 1,
0.8473647, 0.1666288, 0.7599983, 0.8823529, 0, 1, 1,
0.8477589, -0.0174349, 1.607894, 0.8901961, 0, 1, 1,
0.8480532, 0.6706742, 2.109301, 0.8941177, 0, 1, 1,
0.8481908, -1.03313, 1.760224, 0.9019608, 0, 1, 1,
0.848568, -0.3405874, 2.518997, 0.9098039, 0, 1, 1,
0.8519213, 2.016275, -0.3537606, 0.9137255, 0, 1, 1,
0.8519553, -0.4638181, 1.137715, 0.9215686, 0, 1, 1,
0.8538275, -0.1926074, 0.9957446, 0.9254902, 0, 1, 1,
0.8545755, -0.8793821, 2.163391, 0.9333333, 0, 1, 1,
0.8560594, -1.5022, 2.573987, 0.9372549, 0, 1, 1,
0.8571391, 0.4429535, 2.286554, 0.945098, 0, 1, 1,
0.8618064, -0.8873676, 3.16951, 0.9490196, 0, 1, 1,
0.8622086, -1.101489, 2.047672, 0.9568627, 0, 1, 1,
0.8622791, 0.2836779, 0.7118021, 0.9607843, 0, 1, 1,
0.8643143, -0.9540913, 0.9159517, 0.9686275, 0, 1, 1,
0.8716553, 0.5509769, -0.1082167, 0.972549, 0, 1, 1,
0.873562, 0.1902942, 1.203465, 0.9803922, 0, 1, 1,
0.8749769, 1.109693, 0.6562908, 0.9843137, 0, 1, 1,
0.8754036, -0.4002196, 2.709963, 0.9921569, 0, 1, 1,
0.8824148, -1.46336, 1.264281, 0.9960784, 0, 1, 1,
0.8918535, -1.279947, 2.851364, 1, 0, 0.9960784, 1,
0.8921283, 0.4730381, 0.1970351, 1, 0, 0.9882353, 1,
0.8922078, 1.575327, 1.980232, 1, 0, 0.9843137, 1,
0.8946343, 0.2364017, 1.678347, 1, 0, 0.9764706, 1,
0.8987659, 0.2662451, 1.069415, 1, 0, 0.972549, 1,
0.9010537, -0.03219811, 1.258574, 1, 0, 0.9647059, 1,
0.9074714, -0.2778934, 2.733925, 1, 0, 0.9607843, 1,
0.9087445, 1.415727, 1.413415, 1, 0, 0.9529412, 1,
0.9104379, -1.315317, 1.233072, 1, 0, 0.9490196, 1,
0.9186441, -0.3272754, 2.350827, 1, 0, 0.9411765, 1,
0.9211222, -1.310516, 0.8996359, 1, 0, 0.9372549, 1,
0.9244026, -1.255921, 2.378889, 1, 0, 0.9294118, 1,
0.9255713, -0.09849591, 2.852977, 1, 0, 0.9254902, 1,
0.9299125, 1.256251, 0.9180678, 1, 0, 0.9176471, 1,
0.9409725, -0.4659047, 2.03538, 1, 0, 0.9137255, 1,
0.9489829, 0.7392849, 2.440542, 1, 0, 0.9058824, 1,
0.9579197, 0.5591676, 1.891344, 1, 0, 0.9019608, 1,
0.9581918, -0.4500877, 1.35362, 1, 0, 0.8941177, 1,
0.9585412, -1.403391, 2.841851, 1, 0, 0.8862745, 1,
0.9709211, 0.2961161, 2.319083, 1, 0, 0.8823529, 1,
0.9750862, -0.4446937, 2.759917, 1, 0, 0.8745098, 1,
0.9810339, -0.02808513, 1.608776, 1, 0, 0.8705882, 1,
0.9827942, -0.4918945, 3.684165, 1, 0, 0.8627451, 1,
0.9876705, 1.43114, -1.079618, 1, 0, 0.8588235, 1,
0.9903592, 0.3588521, 1.743045, 1, 0, 0.8509804, 1,
0.9956399, -0.3624632, 2.13991, 1, 0, 0.8470588, 1,
0.9959027, -0.3175952, 1.213475, 1, 0, 0.8392157, 1,
1.006622, -2.400985, 3.922687, 1, 0, 0.8352941, 1,
1.007823, -0.5609058, 1.165956, 1, 0, 0.827451, 1,
1.018733, 1.526304, 0.2361935, 1, 0, 0.8235294, 1,
1.022323, -0.3128267, 3.209687, 1, 0, 0.8156863, 1,
1.023761, -1.547423, 2.409021, 1, 0, 0.8117647, 1,
1.027319, 0.01602954, 1.320357, 1, 0, 0.8039216, 1,
1.028757, 0.9306867, -0.01325597, 1, 0, 0.7960784, 1,
1.032524, -0.339111, 0.5069872, 1, 0, 0.7921569, 1,
1.035151, 0.5660164, 1.527142, 1, 0, 0.7843137, 1,
1.041508, -0.1408595, 1.333852, 1, 0, 0.7803922, 1,
1.042379, 0.9490946, 0.2047828, 1, 0, 0.772549, 1,
1.050946, -1.690415, 0.8018742, 1, 0, 0.7686275, 1,
1.058502, -1.257088, 2.41236, 1, 0, 0.7607843, 1,
1.059319, 0.7154653, -0.06973317, 1, 0, 0.7568628, 1,
1.07127, -0.4627165, 1.834917, 1, 0, 0.7490196, 1,
1.084837, -0.9069735, 2.890928, 1, 0, 0.7450981, 1,
1.094451, 0.664077, 1.902967, 1, 0, 0.7372549, 1,
1.103977, -1.106825, 2.411316, 1, 0, 0.7333333, 1,
1.115251, -1.040375, 2.183605, 1, 0, 0.7254902, 1,
1.124135, -0.4223464, 2.161117, 1, 0, 0.7215686, 1,
1.130996, 1.381785, 1.628509, 1, 0, 0.7137255, 1,
1.133191, -0.6477669, 2.685239, 1, 0, 0.7098039, 1,
1.142168, -0.5073441, 3.71041, 1, 0, 0.7019608, 1,
1.143313, 1.551954, 0.009741209, 1, 0, 0.6941177, 1,
1.151764, 1.456942, 0.460615, 1, 0, 0.6901961, 1,
1.152241, 0.06289767, 1.979597, 1, 0, 0.682353, 1,
1.155055, -0.5398049, 2.091447, 1, 0, 0.6784314, 1,
1.172863, 0.8948539, 1.019112, 1, 0, 0.6705883, 1,
1.192616, 0.5342689, 2.86018, 1, 0, 0.6666667, 1,
1.201718, -0.8755535, 2.831786, 1, 0, 0.6588235, 1,
1.213123, -0.9029495, 1.838313, 1, 0, 0.654902, 1,
1.218815, -0.2163033, 2.2048, 1, 0, 0.6470588, 1,
1.231709, 0.751119, 0.9724385, 1, 0, 0.6431373, 1,
1.234007, 0.5762421, 0.06192728, 1, 0, 0.6352941, 1,
1.239824, 0.6956016, 2.778095, 1, 0, 0.6313726, 1,
1.244072, 2.006978, 1.196486, 1, 0, 0.6235294, 1,
1.251066, 0.09363269, 2.1891, 1, 0, 0.6196079, 1,
1.253619, -0.1556441, 2.307363, 1, 0, 0.6117647, 1,
1.261253, -0.8319371, 1.200533, 1, 0, 0.6078432, 1,
1.26433, 0.7238783, 1.874404, 1, 0, 0.6, 1,
1.266955, 0.1413291, 1.197534, 1, 0, 0.5921569, 1,
1.278604, -0.1165129, 0.03675849, 1, 0, 0.5882353, 1,
1.279628, -0.7051125, 4.482364, 1, 0, 0.5803922, 1,
1.287934, -0.2692039, 1.017859, 1, 0, 0.5764706, 1,
1.32147, 0.2379634, 0.1087325, 1, 0, 0.5686275, 1,
1.330755, 0.2351904, 0.8159711, 1, 0, 0.5647059, 1,
1.341494, -0.1002507, 1.12889, 1, 0, 0.5568628, 1,
1.349432, -2.260896, 2.361601, 1, 0, 0.5529412, 1,
1.368461, 1.173346, 0.6309354, 1, 0, 0.5450981, 1,
1.370192, -1.004694, 2.702719, 1, 0, 0.5411765, 1,
1.371687, -1.823638, 2.187454, 1, 0, 0.5333334, 1,
1.375373, 2.132756, 0.7665377, 1, 0, 0.5294118, 1,
1.389331, -1.444461, 1.595398, 1, 0, 0.5215687, 1,
1.39841, 0.09767614, 3.118771, 1, 0, 0.5176471, 1,
1.398837, 1.590176, 0.03001183, 1, 0, 0.509804, 1,
1.403681, 0.06768084, 3.177457, 1, 0, 0.5058824, 1,
1.413198, 0.6839154, 2.351277, 1, 0, 0.4980392, 1,
1.418987, 1.152289, 1.648567, 1, 0, 0.4901961, 1,
1.424778, -0.5797358, 1.464012, 1, 0, 0.4862745, 1,
1.428158, 0.01973984, 0.2244151, 1, 0, 0.4784314, 1,
1.43153, -0.6413864, 1.831198, 1, 0, 0.4745098, 1,
1.441057, -1.15212, 3.499819, 1, 0, 0.4666667, 1,
1.44392, -0.27148, 1.740055, 1, 0, 0.4627451, 1,
1.445999, 2.975751, -0.7029906, 1, 0, 0.454902, 1,
1.47254, 0.7310058, 1.049202, 1, 0, 0.4509804, 1,
1.474029, 1.206543, -1.165714, 1, 0, 0.4431373, 1,
1.476931, -0.01897413, 1.636747, 1, 0, 0.4392157, 1,
1.493937, 0.2569466, -0.7225435, 1, 0, 0.4313726, 1,
1.501017, 0.2022801, 0.2295347, 1, 0, 0.427451, 1,
1.513882, -1.532802, 2.395804, 1, 0, 0.4196078, 1,
1.516092, 0.1700917, 3.715765, 1, 0, 0.4156863, 1,
1.536488, 0.6805148, 0.01181553, 1, 0, 0.4078431, 1,
1.541855, -1.16458, 2.341973, 1, 0, 0.4039216, 1,
1.545929, 0.7876564, 0.5996582, 1, 0, 0.3960784, 1,
1.54858, -1.950412, 3.651804, 1, 0, 0.3882353, 1,
1.553917, -0.2672949, 2.731932, 1, 0, 0.3843137, 1,
1.57136, 0.9483011, -0.201709, 1, 0, 0.3764706, 1,
1.585962, -1.379353, 1.974229, 1, 0, 0.372549, 1,
1.599949, -0.2715707, 3.148869, 1, 0, 0.3647059, 1,
1.603099, 0.0348253, 0.5489287, 1, 0, 0.3607843, 1,
1.608368, -0.2277642, 2.554576, 1, 0, 0.3529412, 1,
1.616055, 0.9383188, 0.5715694, 1, 0, 0.3490196, 1,
1.62145, -0.3862436, 4.254699, 1, 0, 0.3411765, 1,
1.637471, -1.408556, 2.27201, 1, 0, 0.3372549, 1,
1.643132, -0.8807678, 1.960256, 1, 0, 0.3294118, 1,
1.644279, 0.6622823, 0.9975433, 1, 0, 0.3254902, 1,
1.644664, 1.21981, 2.246878, 1, 0, 0.3176471, 1,
1.648348, 0.4041318, 0.9201173, 1, 0, 0.3137255, 1,
1.64922, -0.4171828, 3.136421, 1, 0, 0.3058824, 1,
1.654544, 2.047689, 0.6283974, 1, 0, 0.2980392, 1,
1.66461, 0.008787698, 0.7067704, 1, 0, 0.2941177, 1,
1.680266, -0.6850747, 2.142972, 1, 0, 0.2862745, 1,
1.72752, 0.456663, 2.056913, 1, 0, 0.282353, 1,
1.735227, 0.4136368, 1.992429, 1, 0, 0.2745098, 1,
1.740525, -0.6812248, 2.54671, 1, 0, 0.2705882, 1,
1.749896, 1.488115, 2.615027, 1, 0, 0.2627451, 1,
1.760824, -1.389527, 0.5718413, 1, 0, 0.2588235, 1,
1.766398, 1.144464, 0.1451856, 1, 0, 0.2509804, 1,
1.779773, -1.583313, 2.262087, 1, 0, 0.2470588, 1,
1.794092, 1.009019, 0.4406535, 1, 0, 0.2392157, 1,
1.805006, -1.436895, 1.751054, 1, 0, 0.2352941, 1,
1.816132, 0.5477225, 0.8187284, 1, 0, 0.227451, 1,
1.816335, -0.849193, 1.628385, 1, 0, 0.2235294, 1,
1.818952, 0.1884324, 0.8263921, 1, 0, 0.2156863, 1,
1.820039, 0.1663536, 2.140736, 1, 0, 0.2117647, 1,
1.83062, -1.032614, -0.6519704, 1, 0, 0.2039216, 1,
1.863169, -0.4385798, 2.593764, 1, 0, 0.1960784, 1,
1.918228, -2.206232, 2.558347, 1, 0, 0.1921569, 1,
1.940589, -0.510434, 4.9614, 1, 0, 0.1843137, 1,
1.941286, 0.2783039, -0.4361084, 1, 0, 0.1803922, 1,
1.961399, 0.583955, 1.055367, 1, 0, 0.172549, 1,
1.974505, 0.1531649, 1.627665, 1, 0, 0.1686275, 1,
1.995631, -0.8386149, -0.02761488, 1, 0, 0.1607843, 1,
1.999637, -0.1257562, 1.868574, 1, 0, 0.1568628, 1,
2.02024, 0.01484768, 1.511696, 1, 0, 0.1490196, 1,
2.021409, -0.9004364, 1.785196, 1, 0, 0.145098, 1,
2.023336, 0.8016014, 0.2944156, 1, 0, 0.1372549, 1,
2.042952, 0.5054554, 1.258272, 1, 0, 0.1333333, 1,
2.060081, -0.439097, 3.129321, 1, 0, 0.1254902, 1,
2.060665, -0.2372533, 0.4525619, 1, 0, 0.1215686, 1,
2.06233, -0.231934, -0.733704, 1, 0, 0.1137255, 1,
2.095075, -1.055606, 2.804387, 1, 0, 0.1098039, 1,
2.102042, -1.149588, 3.254614, 1, 0, 0.1019608, 1,
2.124679, -1.087139, 1.501736, 1, 0, 0.09411765, 1,
2.151908, 0.1047806, 1.735692, 1, 0, 0.09019608, 1,
2.15569, -0.2008957, 0.9025804, 1, 0, 0.08235294, 1,
2.17541, 0.08579227, 2.537808, 1, 0, 0.07843138, 1,
2.189821, -0.781319, 2.297241, 1, 0, 0.07058824, 1,
2.213221, -0.1898969, 3.070446, 1, 0, 0.06666667, 1,
2.2614, -0.7387515, -0.2316893, 1, 0, 0.05882353, 1,
2.261568, -1.728093, 1.088298, 1, 0, 0.05490196, 1,
2.261815, 1.804603, 2.377903, 1, 0, 0.04705882, 1,
2.287897, 0.7749556, -0.2263547, 1, 0, 0.04313726, 1,
2.328437, 0.354551, 1.533485, 1, 0, 0.03529412, 1,
2.530692, 1.304305, 0.9437966, 1, 0, 0.03137255, 1,
2.550012, 0.1439953, 1.437886, 1, 0, 0.02352941, 1,
2.839381, 0.03483395, 2.557434, 1, 0, 0.01960784, 1,
2.86595, -0.5955442, 2.391516, 1, 0, 0.01176471, 1,
3.085352, -2.649145, 3.319708, 1, 0, 0.007843138, 1
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
0.1856028, -4.407027, -6.596056, 0, -0.5, 0.5, 0.5,
0.1856028, -4.407027, -6.596056, 1, -0.5, 0.5, 0.5,
0.1856028, -4.407027, -6.596056, 1, 1.5, 0.5, 0.5,
0.1856028, -4.407027, -6.596056, 0, 1.5, 0.5, 0.5
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
-3.697162, -0.115643, -6.596056, 0, -0.5, 0.5, 0.5,
-3.697162, -0.115643, -6.596056, 1, -0.5, 0.5, 0.5,
-3.697162, -0.115643, -6.596056, 1, 1.5, 0.5, 0.5,
-3.697162, -0.115643, -6.596056, 0, 1.5, 0.5, 0.5
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
-3.697162, -4.407027, 0.2556233, 0, -0.5, 0.5, 0.5,
-3.697162, -4.407027, 0.2556233, 1, -0.5, 0.5, 0.5,
-3.697162, -4.407027, 0.2556233, 1, 1.5, 0.5, 0.5,
-3.697162, -4.407027, 0.2556233, 0, 1.5, 0.5, 0.5
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
-2, -3.416708, -5.014899,
3, -3.416708, -5.014899,
-2, -3.416708, -5.014899,
-2, -3.581761, -5.278425,
-1, -3.416708, -5.014899,
-1, -3.581761, -5.278425,
0, -3.416708, -5.014899,
0, -3.581761, -5.278425,
1, -3.416708, -5.014899,
1, -3.581761, -5.278425,
2, -3.416708, -5.014899,
2, -3.581761, -5.278425,
3, -3.416708, -5.014899,
3, -3.581761, -5.278425
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
-2, -3.911868, -5.805478, 0, -0.5, 0.5, 0.5,
-2, -3.911868, -5.805478, 1, -0.5, 0.5, 0.5,
-2, -3.911868, -5.805478, 1, 1.5, 0.5, 0.5,
-2, -3.911868, -5.805478, 0, 1.5, 0.5, 0.5,
-1, -3.911868, -5.805478, 0, -0.5, 0.5, 0.5,
-1, -3.911868, -5.805478, 1, -0.5, 0.5, 0.5,
-1, -3.911868, -5.805478, 1, 1.5, 0.5, 0.5,
-1, -3.911868, -5.805478, 0, 1.5, 0.5, 0.5,
0, -3.911868, -5.805478, 0, -0.5, 0.5, 0.5,
0, -3.911868, -5.805478, 1, -0.5, 0.5, 0.5,
0, -3.911868, -5.805478, 1, 1.5, 0.5, 0.5,
0, -3.911868, -5.805478, 0, 1.5, 0.5, 0.5,
1, -3.911868, -5.805478, 0, -0.5, 0.5, 0.5,
1, -3.911868, -5.805478, 1, -0.5, 0.5, 0.5,
1, -3.911868, -5.805478, 1, 1.5, 0.5, 0.5,
1, -3.911868, -5.805478, 0, 1.5, 0.5, 0.5,
2, -3.911868, -5.805478, 0, -0.5, 0.5, 0.5,
2, -3.911868, -5.805478, 1, -0.5, 0.5, 0.5,
2, -3.911868, -5.805478, 1, 1.5, 0.5, 0.5,
2, -3.911868, -5.805478, 0, 1.5, 0.5, 0.5,
3, -3.911868, -5.805478, 0, -0.5, 0.5, 0.5,
3, -3.911868, -5.805478, 1, -0.5, 0.5, 0.5,
3, -3.911868, -5.805478, 1, 1.5, 0.5, 0.5,
3, -3.911868, -5.805478, 0, 1.5, 0.5, 0.5
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
-2.801139, -3, -5.014899,
-2.801139, 3, -5.014899,
-2.801139, -3, -5.014899,
-2.950476, -3, -5.278425,
-2.801139, -2, -5.014899,
-2.950476, -2, -5.278425,
-2.801139, -1, -5.014899,
-2.950476, -1, -5.278425,
-2.801139, 0, -5.014899,
-2.950476, 0, -5.278425,
-2.801139, 1, -5.014899,
-2.950476, 1, -5.278425,
-2.801139, 2, -5.014899,
-2.950476, 2, -5.278425,
-2.801139, 3, -5.014899,
-2.950476, 3, -5.278425
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
-3.24915, -3, -5.805478, 0, -0.5, 0.5, 0.5,
-3.24915, -3, -5.805478, 1, -0.5, 0.5, 0.5,
-3.24915, -3, -5.805478, 1, 1.5, 0.5, 0.5,
-3.24915, -3, -5.805478, 0, 1.5, 0.5, 0.5,
-3.24915, -2, -5.805478, 0, -0.5, 0.5, 0.5,
-3.24915, -2, -5.805478, 1, -0.5, 0.5, 0.5,
-3.24915, -2, -5.805478, 1, 1.5, 0.5, 0.5,
-3.24915, -2, -5.805478, 0, 1.5, 0.5, 0.5,
-3.24915, -1, -5.805478, 0, -0.5, 0.5, 0.5,
-3.24915, -1, -5.805478, 1, -0.5, 0.5, 0.5,
-3.24915, -1, -5.805478, 1, 1.5, 0.5, 0.5,
-3.24915, -1, -5.805478, 0, 1.5, 0.5, 0.5,
-3.24915, 0, -5.805478, 0, -0.5, 0.5, 0.5,
-3.24915, 0, -5.805478, 1, -0.5, 0.5, 0.5,
-3.24915, 0, -5.805478, 1, 1.5, 0.5, 0.5,
-3.24915, 0, -5.805478, 0, 1.5, 0.5, 0.5,
-3.24915, 1, -5.805478, 0, -0.5, 0.5, 0.5,
-3.24915, 1, -5.805478, 1, -0.5, 0.5, 0.5,
-3.24915, 1, -5.805478, 1, 1.5, 0.5, 0.5,
-3.24915, 1, -5.805478, 0, 1.5, 0.5, 0.5,
-3.24915, 2, -5.805478, 0, -0.5, 0.5, 0.5,
-3.24915, 2, -5.805478, 1, -0.5, 0.5, 0.5,
-3.24915, 2, -5.805478, 1, 1.5, 0.5, 0.5,
-3.24915, 2, -5.805478, 0, 1.5, 0.5, 0.5,
-3.24915, 3, -5.805478, 0, -0.5, 0.5, 0.5,
-3.24915, 3, -5.805478, 1, -0.5, 0.5, 0.5,
-3.24915, 3, -5.805478, 1, 1.5, 0.5, 0.5,
-3.24915, 3, -5.805478, 0, 1.5, 0.5, 0.5
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
-2.801139, -3.416708, -4,
-2.801139, -3.416708, 4,
-2.801139, -3.416708, -4,
-2.950476, -3.581761, -4,
-2.801139, -3.416708, -2,
-2.950476, -3.581761, -2,
-2.801139, -3.416708, 0,
-2.950476, -3.581761, 0,
-2.801139, -3.416708, 2,
-2.950476, -3.581761, 2,
-2.801139, -3.416708, 4,
-2.950476, -3.581761, 4
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
-3.24915, -3.911868, -4, 0, -0.5, 0.5, 0.5,
-3.24915, -3.911868, -4, 1, -0.5, 0.5, 0.5,
-3.24915, -3.911868, -4, 1, 1.5, 0.5, 0.5,
-3.24915, -3.911868, -4, 0, 1.5, 0.5, 0.5,
-3.24915, -3.911868, -2, 0, -0.5, 0.5, 0.5,
-3.24915, -3.911868, -2, 1, -0.5, 0.5, 0.5,
-3.24915, -3.911868, -2, 1, 1.5, 0.5, 0.5,
-3.24915, -3.911868, -2, 0, 1.5, 0.5, 0.5,
-3.24915, -3.911868, 0, 0, -0.5, 0.5, 0.5,
-3.24915, -3.911868, 0, 1, -0.5, 0.5, 0.5,
-3.24915, -3.911868, 0, 1, 1.5, 0.5, 0.5,
-3.24915, -3.911868, 0, 0, 1.5, 0.5, 0.5,
-3.24915, -3.911868, 2, 0, -0.5, 0.5, 0.5,
-3.24915, -3.911868, 2, 1, -0.5, 0.5, 0.5,
-3.24915, -3.911868, 2, 1, 1.5, 0.5, 0.5,
-3.24915, -3.911868, 2, 0, 1.5, 0.5, 0.5,
-3.24915, -3.911868, 4, 0, -0.5, 0.5, 0.5,
-3.24915, -3.911868, 4, 1, -0.5, 0.5, 0.5,
-3.24915, -3.911868, 4, 1, 1.5, 0.5, 0.5,
-3.24915, -3.911868, 4, 0, 1.5, 0.5, 0.5
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
-2.801139, -3.416708, -5.014899,
-2.801139, 3.185422, -5.014899,
-2.801139, -3.416708, 5.526146,
-2.801139, 3.185422, 5.526146,
-2.801139, -3.416708, -5.014899,
-2.801139, -3.416708, 5.526146,
-2.801139, 3.185422, -5.014899,
-2.801139, 3.185422, 5.526146,
-2.801139, -3.416708, -5.014899,
3.172345, -3.416708, -5.014899,
-2.801139, -3.416708, 5.526146,
3.172345, -3.416708, 5.526146,
-2.801139, 3.185422, -5.014899,
3.172345, 3.185422, -5.014899,
-2.801139, 3.185422, 5.526146,
3.172345, 3.185422, 5.526146,
3.172345, -3.416708, -5.014899,
3.172345, 3.185422, -5.014899,
3.172345, -3.416708, 5.526146,
3.172345, 3.185422, 5.526146,
3.172345, -3.416708, -5.014899,
3.172345, -3.416708, 5.526146,
3.172345, 3.185422, -5.014899,
3.172345, 3.185422, 5.526146
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
var radius = 7.367853;
var distance = 32.78041;
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
mvMatrix.translate( -0.1856028, 0.115643, -0.2556233 );
mvMatrix.scale( 1.333605, 1.206621, 0.755738 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.78041);
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
HOCN<-read.table("HOCN.xyz", skip=1)
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
-2.714147, 0.218454, -2.868245, 0, 0, 1, 1, 1,
-2.647065, 0.6129268, -0.02101821, 1, 0, 0, 1, 1,
-2.630352, 0.5775049, -1.714866, 1, 0, 0, 1, 1,
-2.616935, -1.372932, -1.252174, 1, 0, 0, 1, 1,
-2.44427, -0.2544386, -1.045618, 1, 0, 0, 1, 1,
-2.368088, -1.082781, -1.091853, 1, 0, 0, 1, 1,
-2.343571, -0.2204786, -1.199455, 0, 0, 0, 1, 1,
-2.307504, 0.07883434, -1.137505, 0, 0, 0, 1, 1,
-2.178247, 0.4215488, -0.6138682, 0, 0, 0, 1, 1,
-2.163435, -0.1244596, -3.475674, 0, 0, 0, 1, 1,
-2.157623, -1.846222, -2.525611, 0, 0, 0, 1, 1,
-2.143305, -1.227618, -3.317959, 0, 0, 0, 1, 1,
-2.135689, -0.2496338, -0.3395134, 0, 0, 0, 1, 1,
-2.097745, -0.7656955, -1.748169, 1, 1, 1, 1, 1,
-2.062839, 0.8975095, -1.953379, 1, 1, 1, 1, 1,
-2.048055, -0.1907447, -1.365376, 1, 1, 1, 1, 1,
-2.021627, 0.7498714, 1.288007, 1, 1, 1, 1, 1,
-2.009709, -0.09812146, 0.3102193, 1, 1, 1, 1, 1,
-2.006071, 1.291756, -1.649527, 1, 1, 1, 1, 1,
-2.001848, 0.9743698, -0.6942663, 1, 1, 1, 1, 1,
-1.950821, -0.3422961, -0.4935778, 1, 1, 1, 1, 1,
-1.937293, -0.7028444, -1.053551, 1, 1, 1, 1, 1,
-1.925618, 0.01326297, -2.452279, 1, 1, 1, 1, 1,
-1.914159, 0.1183829, -2.415551, 1, 1, 1, 1, 1,
-1.912606, 0.5490495, -1.053992, 1, 1, 1, 1, 1,
-1.899864, 2.399513, 0.2261045, 1, 1, 1, 1, 1,
-1.856443, -1.646631, -1.873908, 1, 1, 1, 1, 1,
-1.841179, -0.6383231, -2.350685, 1, 1, 1, 1, 1,
-1.821454, -0.4558459, -3.163914, 0, 0, 1, 1, 1,
-1.813126, 1.267788, -1.191404, 1, 0, 0, 1, 1,
-1.801004, 0.3714779, -2.689876, 1, 0, 0, 1, 1,
-1.798815, -0.4066622, -2.98559, 1, 0, 0, 1, 1,
-1.765103, -0.6449353, -0.7220756, 1, 0, 0, 1, 1,
-1.731867, -0.3649633, -1.161811, 1, 0, 0, 1, 1,
-1.714454, 0.847734, -2.110108, 0, 0, 0, 1, 1,
-1.711216, 0.6499738, 1.299219, 0, 0, 0, 1, 1,
-1.679024, -2.209168, -1.772698, 0, 0, 0, 1, 1,
-1.678144, 1.243514, -2.511255, 0, 0, 0, 1, 1,
-1.66039, -1.24907, -3.317064, 0, 0, 0, 1, 1,
-1.65589, 0.4409456, -2.427727, 0, 0, 0, 1, 1,
-1.652795, 2.048266, -1.87365, 0, 0, 0, 1, 1,
-1.644029, 0.187008, 0.1719665, 1, 1, 1, 1, 1,
-1.634439, 0.2200924, -2.747929, 1, 1, 1, 1, 1,
-1.632486, 1.901144, -0.2276112, 1, 1, 1, 1, 1,
-1.627681, 0.9089156, -0.5562301, 1, 1, 1, 1, 1,
-1.614743, -0.6483563, -0.7709782, 1, 1, 1, 1, 1,
-1.612753, -0.1749655, -2.277049, 1, 1, 1, 1, 1,
-1.603759, 1.592103, -0.5611625, 1, 1, 1, 1, 1,
-1.596864, 0.3262874, -1.044608, 1, 1, 1, 1, 1,
-1.57755, 1.408943, -0.3662652, 1, 1, 1, 1, 1,
-1.551741, -1.26404, -1.912325, 1, 1, 1, 1, 1,
-1.548459, -0.5788826, -2.331426, 1, 1, 1, 1, 1,
-1.528673, -0.0437607, -2.734382, 1, 1, 1, 1, 1,
-1.525422, 0.6931055, -0.3267033, 1, 1, 1, 1, 1,
-1.508006, 0.1904007, -1.834103, 1, 1, 1, 1, 1,
-1.488961, 0.1533732, -0.5334362, 1, 1, 1, 1, 1,
-1.486802, -0.7726409, -1.343711, 0, 0, 1, 1, 1,
-1.48463, 2.384437, -2.559995, 1, 0, 0, 1, 1,
-1.465732, 1.45866, -1.466207, 1, 0, 0, 1, 1,
-1.461234, -0.3433565, -1.347059, 1, 0, 0, 1, 1,
-1.460023, 0.1887364, -0.5234038, 1, 0, 0, 1, 1,
-1.455316, -0.409559, -1.776044, 1, 0, 0, 1, 1,
-1.427421, -0.4235182, -2.057047, 0, 0, 0, 1, 1,
-1.393024, -0.6903497, -2.999418, 0, 0, 0, 1, 1,
-1.373581, -0.3998539, -0.9452006, 0, 0, 0, 1, 1,
-1.365375, -0.4030301, -0.1371762, 0, 0, 0, 1, 1,
-1.362991, 0.3274245, -2.280115, 0, 0, 0, 1, 1,
-1.357489, 0.4145866, -1.560467, 0, 0, 0, 1, 1,
-1.339566, -1.35508, -2.641998, 0, 0, 0, 1, 1,
-1.331981, -0.5750718, -3.186645, 1, 1, 1, 1, 1,
-1.323225, 0.7836757, -1.496179, 1, 1, 1, 1, 1,
-1.311489, 0.8488736, -2.42493, 1, 1, 1, 1, 1,
-1.301471, -2.129702, -3.280069, 1, 1, 1, 1, 1,
-1.280573, -1.118146, -3.096103, 1, 1, 1, 1, 1,
-1.274638, -2.201401, -1.012501, 1, 1, 1, 1, 1,
-1.271382, -1.677659, -2.050196, 1, 1, 1, 1, 1,
-1.266185, -2.224992, -0.6461736, 1, 1, 1, 1, 1,
-1.260509, -0.3415944, -2.134592, 1, 1, 1, 1, 1,
-1.258337, 0.6215125, -2.136714, 1, 1, 1, 1, 1,
-1.24798, -1.227879, -1.933162, 1, 1, 1, 1, 1,
-1.242012, -1.141308, -2.702572, 1, 1, 1, 1, 1,
-1.236366, -1.378784, -3.087701, 1, 1, 1, 1, 1,
-1.226851, 0.0655091, -2.437521, 1, 1, 1, 1, 1,
-1.220052, 0.746751, -1.24675, 1, 1, 1, 1, 1,
-1.21381, 0.2388002, 0.1928855, 0, 0, 1, 1, 1,
-1.21201, -0.2167401, -0.9616294, 1, 0, 0, 1, 1,
-1.206267, -0.7544092, -3.512775, 1, 0, 0, 1, 1,
-1.195951, 0.9583259, -1.09121, 1, 0, 0, 1, 1,
-1.191361, -1.046124, -1.582056, 1, 0, 0, 1, 1,
-1.184003, -0.3396989, -1.829116, 1, 0, 0, 1, 1,
-1.183793, 0.1937059, -0.1799697, 0, 0, 0, 1, 1,
-1.181567, -0.1665823, -0.6643289, 0, 0, 0, 1, 1,
-1.172132, -1.193501, -3.287302, 0, 0, 0, 1, 1,
-1.169194, 0.4370362, -1.543084, 0, 0, 0, 1, 1,
-1.166894, 0.6877427, -1.549474, 0, 0, 0, 1, 1,
-1.162021, -0.9044065, -3.1223, 0, 0, 0, 1, 1,
-1.161411, -2.3012, -3.91133, 0, 0, 0, 1, 1,
-1.157986, -1.242956, -2.848141, 1, 1, 1, 1, 1,
-1.150379, -0.5505601, -1.755599, 1, 1, 1, 1, 1,
-1.148539, -0.7549503, -0.3955804, 1, 1, 1, 1, 1,
-1.144801, 0.3229105, -1.117073, 1, 1, 1, 1, 1,
-1.142023, -0.2146367, -1.443457, 1, 1, 1, 1, 1,
-1.140044, -0.1886354, -2.869983, 1, 1, 1, 1, 1,
-1.134793, 0.02091382, -2.07481, 1, 1, 1, 1, 1,
-1.128825, -0.5067642, -2.724106, 1, 1, 1, 1, 1,
-1.126477, -0.6525903, -2.885454, 1, 1, 1, 1, 1,
-1.119426, -0.04795041, -2.986721, 1, 1, 1, 1, 1,
-1.116747, 0.2609951, -1.446076, 1, 1, 1, 1, 1,
-1.109742, 0.6805012, -1.954791, 1, 1, 1, 1, 1,
-1.105135, 0.1372678, 1.265045, 1, 1, 1, 1, 1,
-1.104963, 1.089194, 0.04292898, 1, 1, 1, 1, 1,
-1.097518, 0.1131546, -0.2692203, 1, 1, 1, 1, 1,
-1.096388, 0.7986386, -1.525466, 0, 0, 1, 1, 1,
-1.095199, 0.2371292, -1.037973, 1, 0, 0, 1, 1,
-1.091519, -0.9656863, -2.058149, 1, 0, 0, 1, 1,
-1.088536, 0.4253605, 0.3045846, 1, 0, 0, 1, 1,
-1.086176, 0.5528095, -2.05933, 1, 0, 0, 1, 1,
-1.081879, -0.8676742, -2.772637, 1, 0, 0, 1, 1,
-1.079229, -0.1794528, -3.7371, 0, 0, 0, 1, 1,
-1.078041, -0.2439384, -1.17066, 0, 0, 0, 1, 1,
-1.077233, 0.02029523, -1.619276, 0, 0, 0, 1, 1,
-1.075148, -0.0004051049, -0.8739017, 0, 0, 0, 1, 1,
-1.073034, -1.394658, -2.392058, 0, 0, 0, 1, 1,
-1.070161, -1.153867, -3.219039, 0, 0, 0, 1, 1,
-1.069587, -0.07518306, -1.055719, 0, 0, 0, 1, 1,
-1.050581, 0.7345414, -1.462043, 1, 1, 1, 1, 1,
-1.039587, -1.476767, -0.5912212, 1, 1, 1, 1, 1,
-1.037405, 0.3957346, -1.247395, 1, 1, 1, 1, 1,
-1.028143, 1.620213, -2.169906, 1, 1, 1, 1, 1,
-1.022277, 0.3151077, -1.61852, 1, 1, 1, 1, 1,
-1.020302, 1.428808, -2.618633, 1, 1, 1, 1, 1,
-1.01991, -1.811154, -4.657312, 1, 1, 1, 1, 1,
-1.014178, 0.1811476, -1.12245, 1, 1, 1, 1, 1,
-1.013238, 1.148203, -1.171301, 1, 1, 1, 1, 1,
-1.011306, 0.7785126, -0.2239559, 1, 1, 1, 1, 1,
-1.00927, -0.214633, -2.407317, 1, 1, 1, 1, 1,
-1.006934, -0.5071647, -2.783054, 1, 1, 1, 1, 1,
-1.002791, 0.4975056, -0.723246, 1, 1, 1, 1, 1,
-0.9973035, 0.1629936, -1.471711, 1, 1, 1, 1, 1,
-0.9849958, 1.269171, 0.5481764, 1, 1, 1, 1, 1,
-0.9846745, 1.054942, 0.6498363, 0, 0, 1, 1, 1,
-0.9843883, 0.768372, -0.944607, 1, 0, 0, 1, 1,
-0.9841698, -0.4318322, -1.638568, 1, 0, 0, 1, 1,
-0.9833716, -0.1917984, -2.532133, 1, 0, 0, 1, 1,
-0.9762617, -1.247534, -4.078341, 1, 0, 0, 1, 1,
-0.9750261, -2.526286, -1.398744, 1, 0, 0, 1, 1,
-0.9740418, 0.2620863, -2.145605, 0, 0, 0, 1, 1,
-0.9654612, -2.401594, -3.426473, 0, 0, 0, 1, 1,
-0.9610204, -1.391523, -2.440956, 0, 0, 0, 1, 1,
-0.9591839, 0.1723584, -0.3216145, 0, 0, 0, 1, 1,
-0.9578834, 1.840103, -0.7792183, 0, 0, 0, 1, 1,
-0.9542881, -0.6677549, -1.864745, 0, 0, 0, 1, 1,
-0.9541546, 0.1334123, -1.134179, 0, 0, 0, 1, 1,
-0.9500868, 1.396519, 1.463171, 1, 1, 1, 1, 1,
-0.9438645, 0.100182, -2.347738, 1, 1, 1, 1, 1,
-0.9437711, -1.429873, -1.595815, 1, 1, 1, 1, 1,
-0.9419895, -0.9440458, -1.484031, 1, 1, 1, 1, 1,
-0.9353231, 0.7570276, -1.007971, 1, 1, 1, 1, 1,
-0.9338101, 0.8428722, -1.085115, 1, 1, 1, 1, 1,
-0.9336559, 1.169525, 0.3472351, 1, 1, 1, 1, 1,
-0.9314757, 0.1737288, -1.683321, 1, 1, 1, 1, 1,
-0.9314294, -0.6321881, -4.034364, 1, 1, 1, 1, 1,
-0.9273781, -1.83261, -3.320884, 1, 1, 1, 1, 1,
-0.9270579, -0.5745224, -3.363945, 1, 1, 1, 1, 1,
-0.9252419, -2.216334, -0.8943048, 1, 1, 1, 1, 1,
-0.9178069, 0.6485855, -0.2696157, 1, 1, 1, 1, 1,
-0.9149342, -0.5651156, -3.038504, 1, 1, 1, 1, 1,
-0.9125525, -1.51543, -2.773441, 1, 1, 1, 1, 1,
-0.9094403, 2.867455, 0.6648291, 0, 0, 1, 1, 1,
-0.9077628, -0.3627345, -2.849174, 1, 0, 0, 1, 1,
-0.9046633, -0.2802781, -1.528202, 1, 0, 0, 1, 1,
-0.8985898, 0.9056114, -0.1517166, 1, 0, 0, 1, 1,
-0.8805266, -0.4736733, -1.666295, 1, 0, 0, 1, 1,
-0.8786297, -0.713824, -2.781178, 1, 0, 0, 1, 1,
-0.8783682, 1.613052, -0.3143732, 0, 0, 0, 1, 1,
-0.8726265, -0.4037549, -0.8301544, 0, 0, 0, 1, 1,
-0.8667942, 1.274605, 1.359804, 0, 0, 0, 1, 1,
-0.8629527, 0.5657259, -0.3117354, 0, 0, 0, 1, 1,
-0.8606883, -1.085834, -3.32461, 0, 0, 0, 1, 1,
-0.8583385, 0.4651236, -0.4482238, 0, 0, 0, 1, 1,
-0.8571511, -0.4890785, -0.853979, 0, 0, 0, 1, 1,
-0.8519714, 1.496809, -1.114611, 1, 1, 1, 1, 1,
-0.8518645, -1.631115, -0.1290975, 1, 1, 1, 1, 1,
-0.8453164, 1.105029, -0.9435245, 1, 1, 1, 1, 1,
-0.8408896, -0.105216, -0.9952679, 1, 1, 1, 1, 1,
-0.8381203, 0.7024863, -0.9259565, 1, 1, 1, 1, 1,
-0.8359154, -1.285898, -3.394808, 1, 1, 1, 1, 1,
-0.8343706, 0.2031109, -2.067066, 1, 1, 1, 1, 1,
-0.8338286, -0.4475161, -1.121482, 1, 1, 1, 1, 1,
-0.8320683, -2.193742, -2.790403, 1, 1, 1, 1, 1,
-0.8265099, 0.7065834, 0.7847419, 1, 1, 1, 1, 1,
-0.82322, 2.153136, -0.7545477, 1, 1, 1, 1, 1,
-0.8176591, -1.066688, -3.386701, 1, 1, 1, 1, 1,
-0.8102274, 2.114552, 0.2331323, 1, 1, 1, 1, 1,
-0.8071526, 0.840099, 1.175111, 1, 1, 1, 1, 1,
-0.8004264, 0.3365681, -1.555367, 1, 1, 1, 1, 1,
-0.7963701, 0.1121323, -1.524297, 0, 0, 1, 1, 1,
-0.7962681, -0.2852763, -2.874396, 1, 0, 0, 1, 1,
-0.7951048, -1.204044, -1.147666, 1, 0, 0, 1, 1,
-0.7925963, -0.4996662, -2.359498, 1, 0, 0, 1, 1,
-0.7914899, -1.202584, -3.051097, 1, 0, 0, 1, 1,
-0.7874973, -0.7515013, -2.07271, 1, 0, 0, 1, 1,
-0.7871284, 0.5219274, -0.6386685, 0, 0, 0, 1, 1,
-0.7814461, -0.01865637, -0.7877267, 0, 0, 0, 1, 1,
-0.779402, -0.936256, -4.220443, 0, 0, 0, 1, 1,
-0.7782444, 1.286786, -0.4602975, 0, 0, 0, 1, 1,
-0.7775606, -0.9983405, -1.175458, 0, 0, 0, 1, 1,
-0.7745609, 1.933861, 0.6328678, 0, 0, 0, 1, 1,
-0.7679943, 1.384007, -3.006631, 0, 0, 0, 1, 1,
-0.7663475, -1.025493, -3.242265, 1, 1, 1, 1, 1,
-0.7632434, 0.3987631, 0.3979012, 1, 1, 1, 1, 1,
-0.7610943, 0.0149358, -1.13218, 1, 1, 1, 1, 1,
-0.7577764, 0.557915, 0.4140715, 1, 1, 1, 1, 1,
-0.7526148, -0.6818096, -4.222685, 1, 1, 1, 1, 1,
-0.7524514, 0.2423982, -1.738884, 1, 1, 1, 1, 1,
-0.7518457, 0.652533, 0.2603184, 1, 1, 1, 1, 1,
-0.7472904, -0.9217697, -2.279793, 1, 1, 1, 1, 1,
-0.7465968, 1.802018, 1.111981, 1, 1, 1, 1, 1,
-0.7428862, -0.002035736, -1.483939, 1, 1, 1, 1, 1,
-0.7388966, 0.6771976, -1.750284, 1, 1, 1, 1, 1,
-0.7325031, 0.4698319, 0.6908616, 1, 1, 1, 1, 1,
-0.7322177, 0.3895544, -0.02794026, 1, 1, 1, 1, 1,
-0.7308206, 0.4387406, -1.836804, 1, 1, 1, 1, 1,
-0.7307456, -0.7017948, -0.9604467, 1, 1, 1, 1, 1,
-0.729146, 0.007772455, -2.434803, 0, 0, 1, 1, 1,
-0.7209054, -0.5174342, 0.01517116, 1, 0, 0, 1, 1,
-0.7196659, -0.9853634, -2.452573, 1, 0, 0, 1, 1,
-0.7186878, 0.8852662, -0.3317031, 1, 0, 0, 1, 1,
-0.7120132, -1.511938, -2.773645, 1, 0, 0, 1, 1,
-0.7113441, -0.4166476, -4.064908, 1, 0, 0, 1, 1,
-0.7094536, -1.211408, -3.37238, 0, 0, 0, 1, 1,
-0.709214, 1.564016, -0.1887949, 0, 0, 0, 1, 1,
-0.7076395, -0.6706384, -2.127835, 0, 0, 0, 1, 1,
-0.7074047, -0.7344833, -2.127969, 0, 0, 0, 1, 1,
-0.705632, -0.4232535, -2.214712, 0, 0, 0, 1, 1,
-0.6998182, 0.002619568, -0.7978053, 0, 0, 0, 1, 1,
-0.687252, -0.9376741, -3.187658, 0, 0, 0, 1, 1,
-0.6832485, 1.718733, -0.9604874, 1, 1, 1, 1, 1,
-0.6774714, 0.3631647, -1.538404, 1, 1, 1, 1, 1,
-0.6760683, 0.6645547, -0.8530697, 1, 1, 1, 1, 1,
-0.6757686, -0.5989586, -0.3116783, 1, 1, 1, 1, 1,
-0.6753067, 1.371279, 1.65678, 1, 1, 1, 1, 1,
-0.6708711, -0.5119263, -1.355619, 1, 1, 1, 1, 1,
-0.6682374, -0.4586048, -3.087038, 1, 1, 1, 1, 1,
-0.6675171, 1.082505, -0.2216153, 1, 1, 1, 1, 1,
-0.6666836, -0.02785708, -1.227953, 1, 1, 1, 1, 1,
-0.665103, -0.6436727, -1.588256, 1, 1, 1, 1, 1,
-0.6637779, 0.3489346, -0.4430125, 1, 1, 1, 1, 1,
-0.6633942, 0.8664781, -2.665606, 1, 1, 1, 1, 1,
-0.6630575, 0.7974694, -1.123701, 1, 1, 1, 1, 1,
-0.6621355, -2.103968, -2.387598, 1, 1, 1, 1, 1,
-0.6593834, -0.6864821, -2.52316, 1, 1, 1, 1, 1,
-0.6573868, -0.8026223, -4.162694, 0, 0, 1, 1, 1,
-0.6563056, 0.7478713, -1.453179, 1, 0, 0, 1, 1,
-0.6523494, 0.1360324, -3.019011, 1, 0, 0, 1, 1,
-0.6494274, -0.3694128, -1.209107, 1, 0, 0, 1, 1,
-0.6456626, 0.762482, -1.054346, 1, 0, 0, 1, 1,
-0.6429299, -1.133455, -2.897372, 1, 0, 0, 1, 1,
-0.6369978, -0.3091562, -2.100875, 0, 0, 0, 1, 1,
-0.6355463, 0.3031107, 0.3806807, 0, 0, 0, 1, 1,
-0.631147, -0.8334017, -2.861464, 0, 0, 0, 1, 1,
-0.6297089, -0.9566239, -2.442171, 0, 0, 0, 1, 1,
-0.6276621, -2.471615, -1.560029, 0, 0, 0, 1, 1,
-0.6210334, -1.008143, -1.68651, 0, 0, 0, 1, 1,
-0.620065, -1.382935, -1.304841, 0, 0, 0, 1, 1,
-0.619167, -2.718281, -3.556136, 1, 1, 1, 1, 1,
-0.6154428, -0.4688377, -2.962126, 1, 1, 1, 1, 1,
-0.6079816, 1.166755, -0.244033, 1, 1, 1, 1, 1,
-0.6079754, 3.089274, -0.4543529, 1, 1, 1, 1, 1,
-0.6071029, -0.0152668, -2.647281, 1, 1, 1, 1, 1,
-0.6038827, -0.3847104, -3.69157, 1, 1, 1, 1, 1,
-0.6021396, -0.7945024, -3.103074, 1, 1, 1, 1, 1,
-0.6020347, 0.3842813, -1.415118, 1, 1, 1, 1, 1,
-0.6014037, -0.939678, -1.9624, 1, 1, 1, 1, 1,
-0.6002656, -0.2355292, -3.647561, 1, 1, 1, 1, 1,
-0.5986965, 1.585942, -0.9490038, 1, 1, 1, 1, 1,
-0.5966385, 0.8821437, -0.03555243, 1, 1, 1, 1, 1,
-0.5955454, -0.265393, -2.639504, 1, 1, 1, 1, 1,
-0.5915769, -0.5423047, -1.741349, 1, 1, 1, 1, 1,
-0.5881028, 1.42889, -1.180481, 1, 1, 1, 1, 1,
-0.5805086, -1.223551, -3.116681, 0, 0, 1, 1, 1,
-0.5747589, 0.09234463, -0.4283066, 1, 0, 0, 1, 1,
-0.5741061, -1.611068, -3.181835, 1, 0, 0, 1, 1,
-0.5732039, 1.169666, -1.692843, 1, 0, 0, 1, 1,
-0.563359, -2.836724, -2.805782, 1, 0, 0, 1, 1,
-0.5601009, -1.765753, -3.865553, 1, 0, 0, 1, 1,
-0.5567403, -0.6675678, -4.861389, 0, 0, 0, 1, 1,
-0.5517529, 2.4613, -2.082346, 0, 0, 0, 1, 1,
-0.5516955, 0.0259554, -0.3959784, 0, 0, 0, 1, 1,
-0.5474334, 0.1011722, -0.81374, 0, 0, 0, 1, 1,
-0.5472301, 0.1727902, -2.709421, 0, 0, 0, 1, 1,
-0.5466868, -1.47554, -1.497355, 0, 0, 0, 1, 1,
-0.5458274, -1.249666, -3.06257, 0, 0, 0, 1, 1,
-0.5450826, 0.4794297, -0.173969, 1, 1, 1, 1, 1,
-0.5413855, -0.3166478, -2.757063, 1, 1, 1, 1, 1,
-0.5401034, -1.343957, -1.94218, 1, 1, 1, 1, 1,
-0.5395067, 0.001474816, -0.6747428, 1, 1, 1, 1, 1,
-0.5391855, -0.004608214, -1.441251, 1, 1, 1, 1, 1,
-0.5363066, 0.572314, -1.507042, 1, 1, 1, 1, 1,
-0.534385, 1.950001, -0.4475762, 1, 1, 1, 1, 1,
-0.5296, -0.6776666, -2.489289, 1, 1, 1, 1, 1,
-0.5294326, 0.2129748, -3.033297, 1, 1, 1, 1, 1,
-0.5286596, -0.1354089, -2.736971, 1, 1, 1, 1, 1,
-0.5263004, -0.9387414, -2.603656, 1, 1, 1, 1, 1,
-0.5247642, -1.146989, -2.938418, 1, 1, 1, 1, 1,
-0.5223501, -1.016879, -4.10055, 1, 1, 1, 1, 1,
-0.5219428, 0.2777032, -1.881627, 1, 1, 1, 1, 1,
-0.5167639, 0.5214396, -1.121431, 1, 1, 1, 1, 1,
-0.5161026, 0.7604613, -0.9963902, 0, 0, 1, 1, 1,
-0.5153854, -1.402248, -1.501119, 1, 0, 0, 1, 1,
-0.5107291, -0.8186116, -3.996672, 1, 0, 0, 1, 1,
-0.5106763, 2.193473, -0.2055651, 1, 0, 0, 1, 1,
-0.5105025, 0.7753009, -2.106401, 1, 0, 0, 1, 1,
-0.5061974, 0.5323977, -1.018954, 1, 0, 0, 1, 1,
-0.5048513, 1.50906, 0.5976869, 0, 0, 0, 1, 1,
-0.5024073, -0.7444577, -4.612293, 0, 0, 0, 1, 1,
-0.5016485, 1.615636, 0.3620169, 0, 0, 0, 1, 1,
-0.5004911, -0.4549357, -2.90377, 0, 0, 0, 1, 1,
-0.4980412, -0.6061174, -2.401891, 0, 0, 0, 1, 1,
-0.4961747, -0.7127522, -2.807445, 0, 0, 0, 1, 1,
-0.495594, -0.2081071, -1.840506, 0, 0, 0, 1, 1,
-0.4933894, 0.233837, 0.2381573, 1, 1, 1, 1, 1,
-0.4827903, -1.684551, -1.9221, 1, 1, 1, 1, 1,
-0.4821292, -0.7355573, -3.386682, 1, 1, 1, 1, 1,
-0.4809447, -0.6935067, -3.469789, 1, 1, 1, 1, 1,
-0.4754693, 0.5823485, -0.2533752, 1, 1, 1, 1, 1,
-0.4754317, 0.03197835, -2.50888, 1, 1, 1, 1, 1,
-0.4749625, -0.4454706, -2.446409, 1, 1, 1, 1, 1,
-0.4743948, -1.574122, -2.079856, 1, 1, 1, 1, 1,
-0.4730691, 0.4589743, -1.25126, 1, 1, 1, 1, 1,
-0.4727435, -0.2839438, -0.9902107, 1, 1, 1, 1, 1,
-0.4639102, -0.979351, -2.743327, 1, 1, 1, 1, 1,
-0.4580183, 2.000279, 1.100473, 1, 1, 1, 1, 1,
-0.4572175, -0.297989, -3.238735, 1, 1, 1, 1, 1,
-0.456381, 0.6608696, -0.07325807, 1, 1, 1, 1, 1,
-0.4541936, -0.1166124, -1.654797, 1, 1, 1, 1, 1,
-0.4539147, -0.2122799, -3.185989, 0, 0, 1, 1, 1,
-0.4482013, -1.540725, -1.805245, 1, 0, 0, 1, 1,
-0.4447146, 0.64958, -1.262767, 1, 0, 0, 1, 1,
-0.4418021, 1.114631, -1.283322, 1, 0, 0, 1, 1,
-0.4363339, 1.563957, 0.5168504, 1, 0, 0, 1, 1,
-0.4361935, 0.2263442, -1.568303, 1, 0, 0, 1, 1,
-0.4338908, 1.601728, -0.007902712, 0, 0, 0, 1, 1,
-0.428486, 1.389851, -0.3424794, 0, 0, 0, 1, 1,
-0.4231001, -0.4854116, -2.859594, 0, 0, 0, 1, 1,
-0.4190241, 0.6444762, -1.826046, 0, 0, 0, 1, 1,
-0.4141787, 1.153846, -2.935502, 0, 0, 0, 1, 1,
-0.4099753, 2.000568, -1.151554, 0, 0, 0, 1, 1,
-0.4098801, -0.07193671, 0.7916411, 0, 0, 0, 1, 1,
-0.4091645, -1.111561, -0.2171972, 1, 1, 1, 1, 1,
-0.4022742, -0.2447257, -2.190808, 1, 1, 1, 1, 1,
-0.4006746, -0.6903707, -3.019186, 1, 1, 1, 1, 1,
-0.3987863, 0.9174398, -0.4144505, 1, 1, 1, 1, 1,
-0.3978245, 1.750235, 1.460187, 1, 1, 1, 1, 1,
-0.3864784, -0.4518327, -2.167866, 1, 1, 1, 1, 1,
-0.3858657, -0.2675891, -0.1927804, 1, 1, 1, 1, 1,
-0.3841321, -0.1669508, -1.675183, 1, 1, 1, 1, 1,
-0.3838784, -1.048093, -1.380293, 1, 1, 1, 1, 1,
-0.3837036, -1.033542, -1.036601, 1, 1, 1, 1, 1,
-0.3807399, 0.5007116, -0.4240587, 1, 1, 1, 1, 1,
-0.378117, -1.0481, -1.496304, 1, 1, 1, 1, 1,
-0.375322, 0.0234449, -1.161225, 1, 1, 1, 1, 1,
-0.3722911, 0.08560271, -2.652507, 1, 1, 1, 1, 1,
-0.371246, -0.7578987, -2.122198, 1, 1, 1, 1, 1,
-0.36733, 0.1547322, -0.4347418, 0, 0, 1, 1, 1,
-0.3647177, -0.7798707, -2.972018, 1, 0, 0, 1, 1,
-0.3646345, 1.145543, -2.044879, 1, 0, 0, 1, 1,
-0.3536812, 0.4602088, -0.2151154, 1, 0, 0, 1, 1,
-0.3423984, 0.3373228, -0.5504383, 1, 0, 0, 1, 1,
-0.3414313, 0.6129469, -0.7462156, 1, 0, 0, 1, 1,
-0.3302709, 1.171879, -0.5861461, 0, 0, 0, 1, 1,
-0.3282709, -0.7068313, -1.018911, 0, 0, 0, 1, 1,
-0.3254891, -0.9762613, -4.120051, 0, 0, 0, 1, 1,
-0.3223094, 0.2873285, -1.216416, 0, 0, 0, 1, 1,
-0.3213679, 0.2658418, 1.179327, 0, 0, 0, 1, 1,
-0.3163041, -0.7775846, -4.446243, 0, 0, 0, 1, 1,
-0.3125015, -1.225042, -2.403413, 0, 0, 0, 1, 1,
-0.3115019, 0.4864537, -0.1659646, 1, 1, 1, 1, 1,
-0.3103109, 1.119199, 0.1705338, 1, 1, 1, 1, 1,
-0.3081677, 2.05302, 0.672878, 1, 1, 1, 1, 1,
-0.3052965, 1.183137, 0.2328313, 1, 1, 1, 1, 1,
-0.3022184, -0.0210926, -0.886695, 1, 1, 1, 1, 1,
-0.299494, 0.1864929, -1.459291, 1, 1, 1, 1, 1,
-0.2978977, 1.517884, 0.3353964, 1, 1, 1, 1, 1,
-0.2963531, 0.5747943, -0.4000807, 1, 1, 1, 1, 1,
-0.2959054, -0.8936748, -3.224841, 1, 1, 1, 1, 1,
-0.2941281, -0.5686178, -1.290208, 1, 1, 1, 1, 1,
-0.2921826, -0.139432, -1.367, 1, 1, 1, 1, 1,
-0.2914128, -0.01471684, -0.9068249, 1, 1, 1, 1, 1,
-0.291215, -0.6952624, -1.36201, 1, 1, 1, 1, 1,
-0.2880787, 0.8380903, 1.630697, 1, 1, 1, 1, 1,
-0.287624, 0.5012285, -1.500139, 1, 1, 1, 1, 1,
-0.2870591, 0.2230735, -0.3039857, 0, 0, 1, 1, 1,
-0.2862566, -0.7247012, -3.461785, 1, 0, 0, 1, 1,
-0.2859524, 0.8640359, -1.401208, 1, 0, 0, 1, 1,
-0.28499, -1.607541, -1.611154, 1, 0, 0, 1, 1,
-0.2822054, 0.3106082, 0.5231618, 1, 0, 0, 1, 1,
-0.2811584, -0.0887681, -3.059965, 1, 0, 0, 1, 1,
-0.280593, 0.294319, -2.019493, 0, 0, 0, 1, 1,
-0.2764921, -0.3495203, -2.617702, 0, 0, 0, 1, 1,
-0.2761012, 1.498013, -1.168381, 0, 0, 0, 1, 1,
-0.2757351, 0.06296832, -2.026657, 0, 0, 0, 1, 1,
-0.2734917, -0.5751407, -3.390875, 0, 0, 0, 1, 1,
-0.2723198, -1.761883, -1.592789, 0, 0, 0, 1, 1,
-0.268505, 0.240247, -1.272023, 0, 0, 0, 1, 1,
-0.2672974, -0.5586097, -4.455817, 1, 1, 1, 1, 1,
-0.2669861, -0.5070136, -2.945895, 1, 1, 1, 1, 1,
-0.2628932, -0.3474589, -1.553139, 1, 1, 1, 1, 1,
-0.2616296, -0.14457, -1.144504, 1, 1, 1, 1, 1,
-0.261255, 0.8845177, 0.9265409, 1, 1, 1, 1, 1,
-0.2552972, -1.421101, -3.554886, 1, 1, 1, 1, 1,
-0.2497082, -1.399467, -2.062781, 1, 1, 1, 1, 1,
-0.2471036, 1.240778, 0.1835856, 1, 1, 1, 1, 1,
-0.2396669, 0.2137669, -1.150146, 1, 1, 1, 1, 1,
-0.2394705, 0.0475244, -1.60062, 1, 1, 1, 1, 1,
-0.2376988, -0.2316428, -4.465061, 1, 1, 1, 1, 1,
-0.2361342, 1.240124, -1.089194, 1, 1, 1, 1, 1,
-0.2303338, -0.6266852, -1.331255, 1, 1, 1, 1, 1,
-0.2285169, -1.071137, -4.162196, 1, 1, 1, 1, 1,
-0.2250279, 2.06198, -1.38747, 1, 1, 1, 1, 1,
-0.2241429, -0.8897262, -3.341257, 0, 0, 1, 1, 1,
-0.2236901, -0.4149959, -4.060684, 1, 0, 0, 1, 1,
-0.2228325, -1.753862, -3.395769, 1, 0, 0, 1, 1,
-0.2223475, -1.645064, -4.504839, 1, 0, 0, 1, 1,
-0.2202695, -0.8763839, -2.339937, 1, 0, 0, 1, 1,
-0.219353, 0.3505318, -1.70228, 1, 0, 0, 1, 1,
-0.2176889, 0.5672231, -1.915393, 0, 0, 0, 1, 1,
-0.2150621, 0.08828442, -2.5586, 0, 0, 0, 1, 1,
-0.2130012, -1.46663, -3.945729, 0, 0, 0, 1, 1,
-0.2112981, -0.1758689, -1.963544, 0, 0, 0, 1, 1,
-0.2100305, -0.2845524, -0.9876363, 0, 0, 0, 1, 1,
-0.209665, -0.7648987, -2.727741, 0, 0, 0, 1, 1,
-0.2075421, -1.544303, -2.498968, 0, 0, 0, 1, 1,
-0.2057201, 0.4122927, -0.5706147, 1, 1, 1, 1, 1,
-0.205481, -0.2433703, -3.892575, 1, 1, 1, 1, 1,
-0.2004794, -0.5279791, -3.670569, 1, 1, 1, 1, 1,
-0.1996916, 0.902563, -0.9002839, 1, 1, 1, 1, 1,
-0.1991255, 1.232648, -0.06108032, 1, 1, 1, 1, 1,
-0.1949134, 1.833889, 0.3751673, 1, 1, 1, 1, 1,
-0.1942743, 0.4872684, 1.113516, 1, 1, 1, 1, 1,
-0.1921726, 0.2961699, -0.7778386, 1, 1, 1, 1, 1,
-0.187221, 1.359313, 0.977425, 1, 1, 1, 1, 1,
-0.1870855, -0.1129439, -2.313711, 1, 1, 1, 1, 1,
-0.1869912, 0.9010903, -0.8048308, 1, 1, 1, 1, 1,
-0.1790375, -0.2100151, -2.948658, 1, 1, 1, 1, 1,
-0.1782356, -0.2565199, -3.824667, 1, 1, 1, 1, 1,
-0.1756525, -0.04211668, -0.8766763, 1, 1, 1, 1, 1,
-0.1754743, 0.7781718, 0.02696512, 1, 1, 1, 1, 1,
-0.173667, -0.2074356, -3.83827, 0, 0, 1, 1, 1,
-0.1718785, -0.2450331, -2.9668, 1, 0, 0, 1, 1,
-0.1679534, 0.3401187, -2.441777, 1, 0, 0, 1, 1,
-0.1679161, -1.464659, -2.55139, 1, 0, 0, 1, 1,
-0.1656244, -0.5980163, -1.740375, 1, 0, 0, 1, 1,
-0.1643677, 0.9030848, 1.309507, 1, 0, 0, 1, 1,
-0.1530358, 0.0301073, -3.637064, 0, 0, 0, 1, 1,
-0.1523573, 0.6461503, 0.7086189, 0, 0, 0, 1, 1,
-0.1490472, -1.213259, -2.119592, 0, 0, 0, 1, 1,
-0.135764, -1.493894, -4.56406, 0, 0, 0, 1, 1,
-0.1356527, -1.090878, -2.339889, 0, 0, 0, 1, 1,
-0.1348434, 1.058075, 0.2934929, 0, 0, 0, 1, 1,
-0.1340143, -0.5815499, -1.751609, 0, 0, 0, 1, 1,
-0.1323859, -0.2616102, -4.539587, 1, 1, 1, 1, 1,
-0.126549, -0.3330715, -2.254483, 1, 1, 1, 1, 1,
-0.1245931, -0.5994362, -1.602275, 1, 1, 1, 1, 1,
-0.1230334, -0.03009384, -2.041887, 1, 1, 1, 1, 1,
-0.1190952, -0.1145645, -2.205587, 1, 1, 1, 1, 1,
-0.1187602, -0.6382357, -3.480213, 1, 1, 1, 1, 1,
-0.1146588, 0.7093562, -0.3714137, 1, 1, 1, 1, 1,
-0.1143839, -0.2734148, -3.962351, 1, 1, 1, 1, 1,
-0.1124332, -0.7832366, -2.410718, 1, 1, 1, 1, 1,
-0.1102819, 1.725825, -0.2062846, 1, 1, 1, 1, 1,
-0.1082469, 0.5893355, -0.4022521, 1, 1, 1, 1, 1,
-0.1016409, 0.00659487, -1.626638, 1, 1, 1, 1, 1,
-0.09780167, 0.084222, 1.198667, 1, 1, 1, 1, 1,
-0.09402633, -0.1984057, -3.607188, 1, 1, 1, 1, 1,
-0.09260083, -1.029647, -3.329387, 1, 1, 1, 1, 1,
-0.0920258, 1.248449, 1.33015, 0, 0, 1, 1, 1,
-0.09123641, -0.5124178, -3.320872, 1, 0, 0, 1, 1,
-0.09008525, -1.297709, -2.678478, 1, 0, 0, 1, 1,
-0.08988089, 1.142349, 1.162725, 1, 0, 0, 1, 1,
-0.08752335, -1.120478, -4.045417, 1, 0, 0, 1, 1,
-0.08422723, -0.1454091, -2.104528, 1, 0, 0, 1, 1,
-0.08334344, 1.4657, 1.190614, 0, 0, 0, 1, 1,
-0.08148125, 1.851889, -0.8551555, 0, 0, 0, 1, 1,
-0.07789595, 0.6145601, -0.8017773, 0, 0, 0, 1, 1,
-0.07198692, 0.06655638, -2.047946, 0, 0, 0, 1, 1,
-0.06728446, -1.19973, -3.088933, 0, 0, 0, 1, 1,
-0.06666764, 0.09986811, 0.2972012, 0, 0, 0, 1, 1,
-0.06415214, 0.4662062, 2.001587, 0, 0, 0, 1, 1,
-0.0584971, -0.0571233, -3.139852, 1, 1, 1, 1, 1,
-0.05103665, 1.544608, 0.5445641, 1, 1, 1, 1, 1,
-0.04725553, -0.4932363, -3.509057, 1, 1, 1, 1, 1,
-0.04330407, -0.4557503, -2.484345, 1, 1, 1, 1, 1,
-0.0425521, -1.626631, -3.963175, 1, 1, 1, 1, 1,
-0.03981483, 1.676818, 2.028048, 1, 1, 1, 1, 1,
-0.03775595, 0.3459513, -0.4687357, 1, 1, 1, 1, 1,
-0.02409125, 0.1360529, -0.6172369, 1, 1, 1, 1, 1,
-0.023977, 0.2769976, -0.7399397, 1, 1, 1, 1, 1,
-0.02311519, 0.3555664, -1.416243, 1, 1, 1, 1, 1,
-0.02152788, -1.459276, -3.402464, 1, 1, 1, 1, 1,
-0.02070339, -0.9541789, -3.759043, 1, 1, 1, 1, 1,
-0.01947555, 0.1940828, 1.500046, 1, 1, 1, 1, 1,
-0.01703361, -1.38741, -1.898609, 1, 1, 1, 1, 1,
-0.01174514, -0.4666145, -3.590805, 1, 1, 1, 1, 1,
-0.01054199, -0.6736466, -3.502889, 0, 0, 1, 1, 1,
-0.01027936, 1.117006, 0.4324921, 1, 0, 0, 1, 1,
-0.005538602, 0.5288185, -0.6516761, 1, 0, 0, 1, 1,
-0.002023609, 0.7465291, -1.874294, 1, 0, 0, 1, 1,
0.00160165, -0.3319762, 3.29152, 1, 0, 0, 1, 1,
0.006164807, -0.2701762, 2.231751, 1, 0, 0, 1, 1,
0.008609478, -0.2426046, 4.495689, 0, 0, 0, 1, 1,
0.01208447, 0.4890993, -1.295501, 0, 0, 0, 1, 1,
0.01538502, -1.949712, 3.021317, 0, 0, 0, 1, 1,
0.01947303, -0.08402201, 2.95897, 0, 0, 0, 1, 1,
0.02375082, 1.121285, 0.5731907, 0, 0, 0, 1, 1,
0.02904977, -0.4592336, 3.443974, 0, 0, 0, 1, 1,
0.03009191, 1.126193, 0.6758171, 0, 0, 0, 1, 1,
0.03184737, -0.5120884, 3.564786, 1, 1, 1, 1, 1,
0.0336888, -0.02296546, 1.644944, 1, 1, 1, 1, 1,
0.04293202, -2.121239, 3.617478, 1, 1, 1, 1, 1,
0.04553144, -0.3784279, 3.581916, 1, 1, 1, 1, 1,
0.04995894, 0.4285289, -0.3092391, 1, 1, 1, 1, 1,
0.05119766, 0.6324134, 1.164407, 1, 1, 1, 1, 1,
0.05212223, -1.320222, 3.554773, 1, 1, 1, 1, 1,
0.05883775, -0.0739234, 2.316447, 1, 1, 1, 1, 1,
0.0594497, -0.1215614, 2.542812, 1, 1, 1, 1, 1,
0.06235478, -0.4148013, 5.372635, 1, 1, 1, 1, 1,
0.0650823, 0.3961615, -1.442079, 1, 1, 1, 1, 1,
0.06686279, 0.1427811, -0.3711546, 1, 1, 1, 1, 1,
0.07066388, 1.069551, 1.375433, 1, 1, 1, 1, 1,
0.07712525, 2.40282, -0.4922349, 1, 1, 1, 1, 1,
0.08149675, 2.179358, -2.572481, 1, 1, 1, 1, 1,
0.08354863, -0.4647113, 2.840715, 0, 0, 1, 1, 1,
0.08679466, -0.9670371, 2.537583, 1, 0, 0, 1, 1,
0.08876205, 0.009331371, 1.19545, 1, 0, 0, 1, 1,
0.08971936, -0.8677648, 2.17758, 1, 0, 0, 1, 1,
0.0908258, -0.4719311, 2.379709, 1, 0, 0, 1, 1,
0.09522507, -1.508709, 2.725913, 1, 0, 0, 1, 1,
0.1078389, -1.854275, 2.67523, 0, 0, 0, 1, 1,
0.1104952, 1.596839, -0.4966278, 0, 0, 0, 1, 1,
0.1111522, -1.209587, 3.091568, 0, 0, 0, 1, 1,
0.1140234, -0.04355186, 3.981735, 0, 0, 0, 1, 1,
0.1142856, 1.418132, 0.2318762, 0, 0, 0, 1, 1,
0.117161, 0.2446398, 2.911692, 0, 0, 0, 1, 1,
0.1222481, 0.7410061, 0.06239301, 0, 0, 0, 1, 1,
0.1250159, -1.044973, 4.354427, 1, 1, 1, 1, 1,
0.1269958, -0.8011243, 3.138969, 1, 1, 1, 1, 1,
0.1272272, 0.2820461, 1.54525, 1, 1, 1, 1, 1,
0.1286833, -1.772151, 2.153182, 1, 1, 1, 1, 1,
0.1292975, 0.7801616, -2.29638, 1, 1, 1, 1, 1,
0.1303017, 1.321111, -0.02577683, 1, 1, 1, 1, 1,
0.1327294, 0.3436011, -0.3072652, 1, 1, 1, 1, 1,
0.1371787, 0.7184441, 0.1055977, 1, 1, 1, 1, 1,
0.1428332, -0.3276692, 2.74865, 1, 1, 1, 1, 1,
0.1474251, -1.927352, 4.534124, 1, 1, 1, 1, 1,
0.1492345, -0.8077595, 3.861747, 1, 1, 1, 1, 1,
0.1496533, 0.3702372, 0.2660862, 1, 1, 1, 1, 1,
0.1529437, -1.673288, 3.251336, 1, 1, 1, 1, 1,
0.1531877, -0.08601272, 2.342075, 1, 1, 1, 1, 1,
0.1568792, -0.9987457, 1.900956, 1, 1, 1, 1, 1,
0.1585157, -0.9219179, 2.823917, 0, 0, 1, 1, 1,
0.1615909, -0.1250412, 0.6180425, 1, 0, 0, 1, 1,
0.1649553, 0.6962422, 1.274617, 1, 0, 0, 1, 1,
0.1723374, -1.931416, 1.99506, 1, 0, 0, 1, 1,
0.1730709, 0.9980929, 1.176998, 1, 0, 0, 1, 1,
0.1814056, -0.6464667, 3.793447, 1, 0, 0, 1, 1,
0.1817904, -2.552211, 1.46357, 0, 0, 0, 1, 1,
0.18182, -0.4490676, 0.8041648, 0, 0, 0, 1, 1,
0.1841108, -1.406007, 3.721246, 0, 0, 0, 1, 1,
0.184372, -1.080392, 2.241197, 0, 0, 0, 1, 1,
0.188946, -1.876231, 3.242779, 0, 0, 0, 1, 1,
0.1909069, -1.174289, 3.79682, 0, 0, 0, 1, 1,
0.1920763, -0.5391209, 1.558, 0, 0, 0, 1, 1,
0.2005417, 0.2513126, -0.1724377, 1, 1, 1, 1, 1,
0.2026963, -1.455577, 1.485835, 1, 1, 1, 1, 1,
0.2083917, -0.6839782, 2.913002, 1, 1, 1, 1, 1,
0.2090169, 0.7750279, 0.3457468, 1, 1, 1, 1, 1,
0.2090456, -1.65175, 3.020726, 1, 1, 1, 1, 1,
0.2118002, -0.433067, 2.476215, 1, 1, 1, 1, 1,
0.2174635, 0.3345571, 0.8963103, 1, 1, 1, 1, 1,
0.2177878, 1.453792, -1.27253, 1, 1, 1, 1, 1,
0.2202155, -0.6353499, 1.587548, 1, 1, 1, 1, 1,
0.2220404, 1.311906, 0.2774375, 1, 1, 1, 1, 1,
0.2230793, -1.659846, 2.013618, 1, 1, 1, 1, 1,
0.2236881, 0.544389, 0.6045743, 1, 1, 1, 1, 1,
0.2237878, 1.107262, 0.9835266, 1, 1, 1, 1, 1,
0.2246294, -0.453133, 4.298582, 1, 1, 1, 1, 1,
0.2299498, -1.179654, 3.144033, 1, 1, 1, 1, 1,
0.2313658, -0.9404132, 2.264398, 0, 0, 1, 1, 1,
0.2337709, -0.8786485, 1.860507, 1, 0, 0, 1, 1,
0.2339502, -0.1023387, 0.7045269, 1, 0, 0, 1, 1,
0.2380933, 0.2800417, 0.1189524, 1, 0, 0, 1, 1,
0.2426413, 0.3417073, 0.4844404, 1, 0, 0, 1, 1,
0.2438339, 0.6278423, -0.2209898, 1, 0, 0, 1, 1,
0.2447147, 0.07385451, 0.4181322, 0, 0, 0, 1, 1,
0.2485392, -0.09048925, 2.169845, 0, 0, 0, 1, 1,
0.2542884, -0.8266435, 3.074745, 0, 0, 0, 1, 1,
0.2574738, 0.1507427, 2.714003, 0, 0, 0, 1, 1,
0.2601778, -1.405554, 3.606781, 0, 0, 0, 1, 1,
0.2606065, 1.151549, 0.05900049, 0, 0, 0, 1, 1,
0.2628542, -0.007960089, 1.447877, 0, 0, 0, 1, 1,
0.2640261, 1.451617, -0.1692391, 1, 1, 1, 1, 1,
0.2707636, -0.366112, 3.89743, 1, 1, 1, 1, 1,
0.2764723, 1.817054, 1.599741, 1, 1, 1, 1, 1,
0.2789506, 0.04811757, 1.678831, 1, 1, 1, 1, 1,
0.2828064, -0.5701756, 1.502265, 1, 1, 1, 1, 1,
0.2844666, 1.200385, 0.7506273, 1, 1, 1, 1, 1,
0.2849112, 1.570829, 0.1075889, 1, 1, 1, 1, 1,
0.2863773, -1.089217, 4.174449, 1, 1, 1, 1, 1,
0.2891292, -0.873586, 3.292878, 1, 1, 1, 1, 1,
0.2891759, -1.173022, 2.433258, 1, 1, 1, 1, 1,
0.29187, 0.4521561, -0.06143677, 1, 1, 1, 1, 1,
0.2950967, 1.098253, -1.110001, 1, 1, 1, 1, 1,
0.2954205, 0.2890931, 1.486496, 1, 1, 1, 1, 1,
0.2988828, -0.09189894, -1.236248, 1, 1, 1, 1, 1,
0.300496, 1.246546, 0.2091873, 1, 1, 1, 1, 1,
0.3012137, -2.803363, 3.236153, 0, 0, 1, 1, 1,
0.3055716, -0.5700857, 2.59033, 1, 0, 0, 1, 1,
0.3095624, 0.2517743, -0.4907296, 1, 0, 0, 1, 1,
0.3135234, -0.3064965, 1.502969, 1, 0, 0, 1, 1,
0.3146375, 0.6206841, 1.498991, 1, 0, 0, 1, 1,
0.3149826, 0.1454761, 1.61448, 1, 0, 0, 1, 1,
0.3150774, 0.8324772, -0.2407743, 0, 0, 0, 1, 1,
0.3193162, 1.521391, 0.6402035, 0, 0, 0, 1, 1,
0.326292, -0.1336302, 1.173774, 0, 0, 0, 1, 1,
0.3264098, -0.437754, 3.125765, 0, 0, 0, 1, 1,
0.3304676, -0.7257386, 3.581713, 0, 0, 0, 1, 1,
0.3328249, 1.807272, -0.9359508, 0, 0, 0, 1, 1,
0.3376363, 2.444647, 0.4508356, 0, 0, 0, 1, 1,
0.3421456, 2.135487, -1.550583, 1, 1, 1, 1, 1,
0.3440942, -0.1509643, 2.62768, 1, 1, 1, 1, 1,
0.3460769, 0.2669306, 1.648181, 1, 1, 1, 1, 1,
0.3541005, 0.1148921, 1.290947, 1, 1, 1, 1, 1,
0.354847, 1.008217, 1.656199, 1, 1, 1, 1, 1,
0.3605096, 0.4058479, 1.905405, 1, 1, 1, 1, 1,
0.3611226, -0.09374908, 3.676506, 1, 1, 1, 1, 1,
0.3641062, 1.612386, -1.244961, 1, 1, 1, 1, 1,
0.3650571, 0.8982683, -0.5384256, 1, 1, 1, 1, 1,
0.3652647, 1.038624, 1.151319, 1, 1, 1, 1, 1,
0.3656015, 0.6515489, 0.7459506, 1, 1, 1, 1, 1,
0.3693063, -0.4438454, 1.669926, 1, 1, 1, 1, 1,
0.3701345, 0.7946799, 0.2543154, 1, 1, 1, 1, 1,
0.3713706, 1.737665, 0.5712134, 1, 1, 1, 1, 1,
0.3739258, -0.7334318, 4.456535, 1, 1, 1, 1, 1,
0.3753537, -0.448809, 2.282239, 0, 0, 1, 1, 1,
0.3769726, -0.6775608, 2.771628, 1, 0, 0, 1, 1,
0.378219, -0.8945979, 3.69396, 1, 0, 0, 1, 1,
0.3792809, 0.8396985, 0.8251082, 1, 0, 0, 1, 1,
0.3809986, -1.69065, 4.354064, 1, 0, 0, 1, 1,
0.3811756, -0.1181675, 1.366989, 1, 0, 0, 1, 1,
0.3815957, -0.6186973, 2.363949, 0, 0, 0, 1, 1,
0.3818423, -0.008308682, 2.283896, 0, 0, 0, 1, 1,
0.3864256, -2.45498, 4.464299, 0, 0, 0, 1, 1,
0.3884115, -0.1587543, 1.248956, 0, 0, 0, 1, 1,
0.3891969, -1.229272, 3.441353, 0, 0, 0, 1, 1,
0.3914065, -1.35769, 2.989218, 0, 0, 0, 1, 1,
0.3934428, 0.2662852, 2.698181, 0, 0, 0, 1, 1,
0.3939954, -0.938539, 4.072013, 1, 1, 1, 1, 1,
0.3954806, -2.21206, 1.649185, 1, 1, 1, 1, 1,
0.3987471, 1.87917, -0.2095441, 1, 1, 1, 1, 1,
0.4008339, 0.1805593, 0.8354676, 1, 1, 1, 1, 1,
0.4045649, -1.466081, 1.844406, 1, 1, 1, 1, 1,
0.4055422, 0.1338092, -0.1065779, 1, 1, 1, 1, 1,
0.4107572, -0.3402425, 1.900739, 1, 1, 1, 1, 1,
0.4114462, 0.5690767, 0.4589756, 1, 1, 1, 1, 1,
0.4156583, -0.7742818, 2.010793, 1, 1, 1, 1, 1,
0.4179471, -0.524525, 0.9170457, 1, 1, 1, 1, 1,
0.4195741, -0.3400494, 1.635871, 1, 1, 1, 1, 1,
0.4232976, 0.4461786, 3.502983, 1, 1, 1, 1, 1,
0.4247805, -1.606075, 2.377475, 1, 1, 1, 1, 1,
0.425629, 0.3563781, 2.168496, 1, 1, 1, 1, 1,
0.4286169, -0.3928293, 2.173784, 1, 1, 1, 1, 1,
0.4296066, 1.588307, -0.7428641, 0, 0, 1, 1, 1,
0.4311928, 1.49065, -0.6110427, 1, 0, 0, 1, 1,
0.4345517, 0.02272674, 1.424907, 1, 0, 0, 1, 1,
0.4377123, -1.11614, 3.605662, 1, 0, 0, 1, 1,
0.438963, 0.009712177, -0.03091504, 1, 0, 0, 1, 1,
0.4404365, 0.2740615, 1.015567, 1, 0, 0, 1, 1,
0.4433973, 1.19215, -0.6161135, 0, 0, 0, 1, 1,
0.4435776, 1.15499, -0.04206685, 0, 0, 0, 1, 1,
0.4445764, 0.032305, 0.3222356, 0, 0, 0, 1, 1,
0.4452798, 0.1626369, 2.093978, 0, 0, 0, 1, 1,
0.4465192, 2.709553, -1.233344, 0, 0, 0, 1, 1,
0.4485541, -3.17262, 3.69818, 0, 0, 0, 1, 1,
0.4513174, -0.3943514, 2.478745, 0, 0, 0, 1, 1,
0.4517309, 0.4253694, 1.263734, 1, 1, 1, 1, 1,
0.4534916, -2.652677, 4.631706, 1, 1, 1, 1, 1,
0.4548518, 0.8231226, 1.237616, 1, 1, 1, 1, 1,
0.4593285, -1.796246, 3.227949, 1, 1, 1, 1, 1,
0.4600646, 0.3725685, -0.7500008, 1, 1, 1, 1, 1,
0.4606716, 0.1729302, 1.027464, 1, 1, 1, 1, 1,
0.4705804, -1.385513, 3.900696, 1, 1, 1, 1, 1,
0.4713654, -0.7563854, 3.399265, 1, 1, 1, 1, 1,
0.472117, -0.5162525, 1.587511, 1, 1, 1, 1, 1,
0.4796121, -0.6358578, 2.406327, 1, 1, 1, 1, 1,
0.4812017, 1.112703, 1.046293, 1, 1, 1, 1, 1,
0.482359, -2.06297, 4.501729, 1, 1, 1, 1, 1,
0.4827336, 0.1691693, -0.9840041, 1, 1, 1, 1, 1,
0.4842469, 1.801212, 0.6491423, 1, 1, 1, 1, 1,
0.4852775, -1.752051, 3.955154, 1, 1, 1, 1, 1,
0.4887867, 0.4634706, -0.05044311, 0, 0, 1, 1, 1,
0.4887868, -1.582965, 1.753326, 1, 0, 0, 1, 1,
0.4922962, -0.75231, 1.813663, 1, 0, 0, 1, 1,
0.4971241, -0.3110181, 2.440761, 1, 0, 0, 1, 1,
0.4971894, -1.414217, 2.888278, 1, 0, 0, 1, 1,
0.4990581, 0.6089613, 0.1374054, 1, 0, 0, 1, 1,
0.5038257, -0.8864045, 2.243828, 0, 0, 0, 1, 1,
0.5064335, -1.193616, 2.683818, 0, 0, 0, 1, 1,
0.5072743, 1.01166, 0.5851642, 0, 0, 0, 1, 1,
0.5074255, 0.1969825, 0.3288338, 0, 0, 0, 1, 1,
0.5074292, 1.414208, -1.398871, 0, 0, 0, 1, 1,
0.5088676, -0.3307874, 2.726642, 0, 0, 0, 1, 1,
0.5155529, -0.4139154, 2.838677, 0, 0, 0, 1, 1,
0.5199867, -0.711928, 2.190708, 1, 1, 1, 1, 1,
0.5245313, 0.2223982, 0.8284582, 1, 1, 1, 1, 1,
0.5289949, 0.736107, 1.703891, 1, 1, 1, 1, 1,
0.5317059, -1.204277, 2.605499, 1, 1, 1, 1, 1,
0.534043, 0.4254151, 1.384553, 1, 1, 1, 1, 1,
0.5369524, 1.565868, -0.6980874, 1, 1, 1, 1, 1,
0.5401469, 0.4580703, 0.7830141, 1, 1, 1, 1, 1,
0.5405079, -0.8710927, 3.906886, 1, 1, 1, 1, 1,
0.5508153, 0.06133492, 1.262599, 1, 1, 1, 1, 1,
0.5522432, -0.4144118, 3.01765, 1, 1, 1, 1, 1,
0.557598, -0.8083678, 0.9864407, 1, 1, 1, 1, 1,
0.5595996, 0.3523814, 2.658642, 1, 1, 1, 1, 1,
0.5598469, 2.032184, -0.7909516, 1, 1, 1, 1, 1,
0.563044, 1.906619, -0.8199298, 1, 1, 1, 1, 1,
0.5657067, 0.4343294, 1.368113, 1, 1, 1, 1, 1,
0.5659567, -0.7762793, 1.07748, 0, 0, 1, 1, 1,
0.5662587, 1.378993, 0.7080842, 1, 0, 0, 1, 1,
0.5663437, 1.750871, 0.0309318, 1, 0, 0, 1, 1,
0.5705118, -0.098307, 0.7512742, 1, 0, 0, 1, 1,
0.5715489, -0.8336182, 0.3258758, 1, 0, 0, 1, 1,
0.5731224, -0.1181259, 2.185776, 1, 0, 0, 1, 1,
0.5732748, -1.058369, 3.114729, 0, 0, 0, 1, 1,
0.5951595, -0.5666068, 3.300265, 0, 0, 0, 1, 1,
0.6022635, -0.3137754, 1.601657, 0, 0, 0, 1, 1,
0.6034747, -0.1506919, 2.616027, 0, 0, 0, 1, 1,
0.6034845, -0.9107722, 2.369572, 0, 0, 0, 1, 1,
0.6063923, 1.148464, 0.8991263, 0, 0, 0, 1, 1,
0.6077916, -1.379543, 2.398175, 0, 0, 0, 1, 1,
0.6078916, -3.32056, 3.07429, 1, 1, 1, 1, 1,
0.6094252, -1.090412, 1.48816, 1, 1, 1, 1, 1,
0.6100979, 0.207559, 1.1872, 1, 1, 1, 1, 1,
0.6128342, 1.309537, 0.9538868, 1, 1, 1, 1, 1,
0.6245836, 0.2664964, 0.4004148, 1, 1, 1, 1, 1,
0.6249942, -0.1084525, 0.9286978, 1, 1, 1, 1, 1,
0.6274804, 2.348931, -0.3280603, 1, 1, 1, 1, 1,
0.6303144, -1.068469, 3.27743, 1, 1, 1, 1, 1,
0.6332774, -0.9403816, 2.091176, 1, 1, 1, 1, 1,
0.6413417, 0.6263461, -0.05950335, 1, 1, 1, 1, 1,
0.6428097, 0.4851224, 2.128177, 1, 1, 1, 1, 1,
0.6437836, 1.784208, -1.168959, 1, 1, 1, 1, 1,
0.6471027, 1.155928, 1.520582, 1, 1, 1, 1, 1,
0.6586287, 0.4301851, 1.47823, 1, 1, 1, 1, 1,
0.659117, -0.7868397, 1.57899, 1, 1, 1, 1, 1,
0.6594898, -1.438275, 2.778122, 0, 0, 1, 1, 1,
0.6602145, -0.4809658, 0.882142, 1, 0, 0, 1, 1,
0.6605875, 0.2949017, -0.5152791, 1, 0, 0, 1, 1,
0.6638334, -1.032941, 2.866974, 1, 0, 0, 1, 1,
0.6639388, -0.9931001, 3.778181, 1, 0, 0, 1, 1,
0.6684061, -0.0034363, 1.156958, 1, 0, 0, 1, 1,
0.6801887, 0.4149753, 1.038023, 0, 0, 0, 1, 1,
0.6820383, 0.8230014, 1.189689, 0, 0, 0, 1, 1,
0.6833018, -1.157261, 3.078043, 0, 0, 0, 1, 1,
0.6854306, -0.01419833, 2.182868, 0, 0, 0, 1, 1,
0.689608, -0.5798126, 2.873484, 0, 0, 0, 1, 1,
0.6912626, 1.444373, -0.2858523, 0, 0, 0, 1, 1,
0.6916173, 1.239364, 1.505142, 0, 0, 0, 1, 1,
0.6988798, -0.4506616, 2.258737, 1, 1, 1, 1, 1,
0.7001106, -1.081872, 0.505717, 1, 1, 1, 1, 1,
0.704427, -1.657339, 1.855343, 1, 1, 1, 1, 1,
0.7046012, -1.284314, 5.072231, 1, 1, 1, 1, 1,
0.7068248, -0.944189, 3.164473, 1, 1, 1, 1, 1,
0.7086998, -0.3982383, 2.080965, 1, 1, 1, 1, 1,
0.7093141, 0.8360814, 0.5055529, 1, 1, 1, 1, 1,
0.7093166, 0.9060113, 4.09068, 1, 1, 1, 1, 1,
0.7098671, 0.8786608, 1.35614, 1, 1, 1, 1, 1,
0.7170413, 0.005089947, 3.426906, 1, 1, 1, 1, 1,
0.7185211, -0.0007656369, 1.134985, 1, 1, 1, 1, 1,
0.7188268, 0.990086, 0.6280646, 1, 1, 1, 1, 1,
0.7235436, -0.6994689, 1.663897, 1, 1, 1, 1, 1,
0.7244748, -1.333392, 1.774418, 1, 1, 1, 1, 1,
0.7276587, 0.1129045, 1.295996, 1, 1, 1, 1, 1,
0.7315525, -0.2301222, 2.461833, 0, 0, 1, 1, 1,
0.7415845, 0.2401321, 0.5837297, 1, 0, 0, 1, 1,
0.7464278, 0.7649395, -0.6936104, 1, 0, 0, 1, 1,
0.7475789, -1.474028, 2.849096, 1, 0, 0, 1, 1,
0.75781, -2.047121, 2.257834, 1, 0, 0, 1, 1,
0.7578254, -0.5907032, 2.920067, 1, 0, 0, 1, 1,
0.7628569, 1.052602, 2.316087, 0, 0, 0, 1, 1,
0.7734484, -1.673768, 0.9811887, 0, 0, 0, 1, 1,
0.7776479, 0.5393898, 0.9904738, 0, 0, 0, 1, 1,
0.7824818, 0.3579813, 0.7033125, 0, 0, 0, 1, 1,
0.7871085, -1.687295, 2.77329, 0, 0, 0, 1, 1,
0.7885959, 0.6955312, 0.6433271, 0, 0, 0, 1, 1,
0.7887886, 0.4904855, 2.801418, 0, 0, 0, 1, 1,
0.7913765, 1.297558, -0.5241473, 1, 1, 1, 1, 1,
0.7926914, 2.499221, -0.08423902, 1, 1, 1, 1, 1,
0.7990678, 2.338828, 0.1863957, 1, 1, 1, 1, 1,
0.7991785, 0.4045367, -0.6668614, 1, 1, 1, 1, 1,
0.8002064, 0.925121, 0.06229404, 1, 1, 1, 1, 1,
0.8071684, 0.214344, 1.01091, 1, 1, 1, 1, 1,
0.8153262, 0.5946912, 4.587469, 1, 1, 1, 1, 1,
0.8167188, -2.03501, 3.070585, 1, 1, 1, 1, 1,
0.8205625, -0.4617156, 2.218001, 1, 1, 1, 1, 1,
0.8255821, -0.8689769, 1.955236, 1, 1, 1, 1, 1,
0.8274575, -0.1161985, 1.077738, 1, 1, 1, 1, 1,
0.830049, 0.2370193, 0.3292816, 1, 1, 1, 1, 1,
0.8352424, -1.685674, 2.955979, 1, 1, 1, 1, 1,
0.8378589, 0.758212, 1.399802, 1, 1, 1, 1, 1,
0.8394119, -0.6914158, 2.196956, 1, 1, 1, 1, 1,
0.8421744, -0.4401249, 3.70735, 0, 0, 1, 1, 1,
0.8462211, -0.4262023, 2.027526, 1, 0, 0, 1, 1,
0.8473647, 0.1666288, 0.7599983, 1, 0, 0, 1, 1,
0.8477589, -0.0174349, 1.607894, 1, 0, 0, 1, 1,
0.8480532, 0.6706742, 2.109301, 1, 0, 0, 1, 1,
0.8481908, -1.03313, 1.760224, 1, 0, 0, 1, 1,
0.848568, -0.3405874, 2.518997, 0, 0, 0, 1, 1,
0.8519213, 2.016275, -0.3537606, 0, 0, 0, 1, 1,
0.8519553, -0.4638181, 1.137715, 0, 0, 0, 1, 1,
0.8538275, -0.1926074, 0.9957446, 0, 0, 0, 1, 1,
0.8545755, -0.8793821, 2.163391, 0, 0, 0, 1, 1,
0.8560594, -1.5022, 2.573987, 0, 0, 0, 1, 1,
0.8571391, 0.4429535, 2.286554, 0, 0, 0, 1, 1,
0.8618064, -0.8873676, 3.16951, 1, 1, 1, 1, 1,
0.8622086, -1.101489, 2.047672, 1, 1, 1, 1, 1,
0.8622791, 0.2836779, 0.7118021, 1, 1, 1, 1, 1,
0.8643143, -0.9540913, 0.9159517, 1, 1, 1, 1, 1,
0.8716553, 0.5509769, -0.1082167, 1, 1, 1, 1, 1,
0.873562, 0.1902942, 1.203465, 1, 1, 1, 1, 1,
0.8749769, 1.109693, 0.6562908, 1, 1, 1, 1, 1,
0.8754036, -0.4002196, 2.709963, 1, 1, 1, 1, 1,
0.8824148, -1.46336, 1.264281, 1, 1, 1, 1, 1,
0.8918535, -1.279947, 2.851364, 1, 1, 1, 1, 1,
0.8921283, 0.4730381, 0.1970351, 1, 1, 1, 1, 1,
0.8922078, 1.575327, 1.980232, 1, 1, 1, 1, 1,
0.8946343, 0.2364017, 1.678347, 1, 1, 1, 1, 1,
0.8987659, 0.2662451, 1.069415, 1, 1, 1, 1, 1,
0.9010537, -0.03219811, 1.258574, 1, 1, 1, 1, 1,
0.9074714, -0.2778934, 2.733925, 0, 0, 1, 1, 1,
0.9087445, 1.415727, 1.413415, 1, 0, 0, 1, 1,
0.9104379, -1.315317, 1.233072, 1, 0, 0, 1, 1,
0.9186441, -0.3272754, 2.350827, 1, 0, 0, 1, 1,
0.9211222, -1.310516, 0.8996359, 1, 0, 0, 1, 1,
0.9244026, -1.255921, 2.378889, 1, 0, 0, 1, 1,
0.9255713, -0.09849591, 2.852977, 0, 0, 0, 1, 1,
0.9299125, 1.256251, 0.9180678, 0, 0, 0, 1, 1,
0.9409725, -0.4659047, 2.03538, 0, 0, 0, 1, 1,
0.9489829, 0.7392849, 2.440542, 0, 0, 0, 1, 1,
0.9579197, 0.5591676, 1.891344, 0, 0, 0, 1, 1,
0.9581918, -0.4500877, 1.35362, 0, 0, 0, 1, 1,
0.9585412, -1.403391, 2.841851, 0, 0, 0, 1, 1,
0.9709211, 0.2961161, 2.319083, 1, 1, 1, 1, 1,
0.9750862, -0.4446937, 2.759917, 1, 1, 1, 1, 1,
0.9810339, -0.02808513, 1.608776, 1, 1, 1, 1, 1,
0.9827942, -0.4918945, 3.684165, 1, 1, 1, 1, 1,
0.9876705, 1.43114, -1.079618, 1, 1, 1, 1, 1,
0.9903592, 0.3588521, 1.743045, 1, 1, 1, 1, 1,
0.9956399, -0.3624632, 2.13991, 1, 1, 1, 1, 1,
0.9959027, -0.3175952, 1.213475, 1, 1, 1, 1, 1,
1.006622, -2.400985, 3.922687, 1, 1, 1, 1, 1,
1.007823, -0.5609058, 1.165956, 1, 1, 1, 1, 1,
1.018733, 1.526304, 0.2361935, 1, 1, 1, 1, 1,
1.022323, -0.3128267, 3.209687, 1, 1, 1, 1, 1,
1.023761, -1.547423, 2.409021, 1, 1, 1, 1, 1,
1.027319, 0.01602954, 1.320357, 1, 1, 1, 1, 1,
1.028757, 0.9306867, -0.01325597, 1, 1, 1, 1, 1,
1.032524, -0.339111, 0.5069872, 0, 0, 1, 1, 1,
1.035151, 0.5660164, 1.527142, 1, 0, 0, 1, 1,
1.041508, -0.1408595, 1.333852, 1, 0, 0, 1, 1,
1.042379, 0.9490946, 0.2047828, 1, 0, 0, 1, 1,
1.050946, -1.690415, 0.8018742, 1, 0, 0, 1, 1,
1.058502, -1.257088, 2.41236, 1, 0, 0, 1, 1,
1.059319, 0.7154653, -0.06973317, 0, 0, 0, 1, 1,
1.07127, -0.4627165, 1.834917, 0, 0, 0, 1, 1,
1.084837, -0.9069735, 2.890928, 0, 0, 0, 1, 1,
1.094451, 0.664077, 1.902967, 0, 0, 0, 1, 1,
1.103977, -1.106825, 2.411316, 0, 0, 0, 1, 1,
1.115251, -1.040375, 2.183605, 0, 0, 0, 1, 1,
1.124135, -0.4223464, 2.161117, 0, 0, 0, 1, 1,
1.130996, 1.381785, 1.628509, 1, 1, 1, 1, 1,
1.133191, -0.6477669, 2.685239, 1, 1, 1, 1, 1,
1.142168, -0.5073441, 3.71041, 1, 1, 1, 1, 1,
1.143313, 1.551954, 0.009741209, 1, 1, 1, 1, 1,
1.151764, 1.456942, 0.460615, 1, 1, 1, 1, 1,
1.152241, 0.06289767, 1.979597, 1, 1, 1, 1, 1,
1.155055, -0.5398049, 2.091447, 1, 1, 1, 1, 1,
1.172863, 0.8948539, 1.019112, 1, 1, 1, 1, 1,
1.192616, 0.5342689, 2.86018, 1, 1, 1, 1, 1,
1.201718, -0.8755535, 2.831786, 1, 1, 1, 1, 1,
1.213123, -0.9029495, 1.838313, 1, 1, 1, 1, 1,
1.218815, -0.2163033, 2.2048, 1, 1, 1, 1, 1,
1.231709, 0.751119, 0.9724385, 1, 1, 1, 1, 1,
1.234007, 0.5762421, 0.06192728, 1, 1, 1, 1, 1,
1.239824, 0.6956016, 2.778095, 1, 1, 1, 1, 1,
1.244072, 2.006978, 1.196486, 0, 0, 1, 1, 1,
1.251066, 0.09363269, 2.1891, 1, 0, 0, 1, 1,
1.253619, -0.1556441, 2.307363, 1, 0, 0, 1, 1,
1.261253, -0.8319371, 1.200533, 1, 0, 0, 1, 1,
1.26433, 0.7238783, 1.874404, 1, 0, 0, 1, 1,
1.266955, 0.1413291, 1.197534, 1, 0, 0, 1, 1,
1.278604, -0.1165129, 0.03675849, 0, 0, 0, 1, 1,
1.279628, -0.7051125, 4.482364, 0, 0, 0, 1, 1,
1.287934, -0.2692039, 1.017859, 0, 0, 0, 1, 1,
1.32147, 0.2379634, 0.1087325, 0, 0, 0, 1, 1,
1.330755, 0.2351904, 0.8159711, 0, 0, 0, 1, 1,
1.341494, -0.1002507, 1.12889, 0, 0, 0, 1, 1,
1.349432, -2.260896, 2.361601, 0, 0, 0, 1, 1,
1.368461, 1.173346, 0.6309354, 1, 1, 1, 1, 1,
1.370192, -1.004694, 2.702719, 1, 1, 1, 1, 1,
1.371687, -1.823638, 2.187454, 1, 1, 1, 1, 1,
1.375373, 2.132756, 0.7665377, 1, 1, 1, 1, 1,
1.389331, -1.444461, 1.595398, 1, 1, 1, 1, 1,
1.39841, 0.09767614, 3.118771, 1, 1, 1, 1, 1,
1.398837, 1.590176, 0.03001183, 1, 1, 1, 1, 1,
1.403681, 0.06768084, 3.177457, 1, 1, 1, 1, 1,
1.413198, 0.6839154, 2.351277, 1, 1, 1, 1, 1,
1.418987, 1.152289, 1.648567, 1, 1, 1, 1, 1,
1.424778, -0.5797358, 1.464012, 1, 1, 1, 1, 1,
1.428158, 0.01973984, 0.2244151, 1, 1, 1, 1, 1,
1.43153, -0.6413864, 1.831198, 1, 1, 1, 1, 1,
1.441057, -1.15212, 3.499819, 1, 1, 1, 1, 1,
1.44392, -0.27148, 1.740055, 1, 1, 1, 1, 1,
1.445999, 2.975751, -0.7029906, 0, 0, 1, 1, 1,
1.47254, 0.7310058, 1.049202, 1, 0, 0, 1, 1,
1.474029, 1.206543, -1.165714, 1, 0, 0, 1, 1,
1.476931, -0.01897413, 1.636747, 1, 0, 0, 1, 1,
1.493937, 0.2569466, -0.7225435, 1, 0, 0, 1, 1,
1.501017, 0.2022801, 0.2295347, 1, 0, 0, 1, 1,
1.513882, -1.532802, 2.395804, 0, 0, 0, 1, 1,
1.516092, 0.1700917, 3.715765, 0, 0, 0, 1, 1,
1.536488, 0.6805148, 0.01181553, 0, 0, 0, 1, 1,
1.541855, -1.16458, 2.341973, 0, 0, 0, 1, 1,
1.545929, 0.7876564, 0.5996582, 0, 0, 0, 1, 1,
1.54858, -1.950412, 3.651804, 0, 0, 0, 1, 1,
1.553917, -0.2672949, 2.731932, 0, 0, 0, 1, 1,
1.57136, 0.9483011, -0.201709, 1, 1, 1, 1, 1,
1.585962, -1.379353, 1.974229, 1, 1, 1, 1, 1,
1.599949, -0.2715707, 3.148869, 1, 1, 1, 1, 1,
1.603099, 0.0348253, 0.5489287, 1, 1, 1, 1, 1,
1.608368, -0.2277642, 2.554576, 1, 1, 1, 1, 1,
1.616055, 0.9383188, 0.5715694, 1, 1, 1, 1, 1,
1.62145, -0.3862436, 4.254699, 1, 1, 1, 1, 1,
1.637471, -1.408556, 2.27201, 1, 1, 1, 1, 1,
1.643132, -0.8807678, 1.960256, 1, 1, 1, 1, 1,
1.644279, 0.6622823, 0.9975433, 1, 1, 1, 1, 1,
1.644664, 1.21981, 2.246878, 1, 1, 1, 1, 1,
1.648348, 0.4041318, 0.9201173, 1, 1, 1, 1, 1,
1.64922, -0.4171828, 3.136421, 1, 1, 1, 1, 1,
1.654544, 2.047689, 0.6283974, 1, 1, 1, 1, 1,
1.66461, 0.008787698, 0.7067704, 1, 1, 1, 1, 1,
1.680266, -0.6850747, 2.142972, 0, 0, 1, 1, 1,
1.72752, 0.456663, 2.056913, 1, 0, 0, 1, 1,
1.735227, 0.4136368, 1.992429, 1, 0, 0, 1, 1,
1.740525, -0.6812248, 2.54671, 1, 0, 0, 1, 1,
1.749896, 1.488115, 2.615027, 1, 0, 0, 1, 1,
1.760824, -1.389527, 0.5718413, 1, 0, 0, 1, 1,
1.766398, 1.144464, 0.1451856, 0, 0, 0, 1, 1,
1.779773, -1.583313, 2.262087, 0, 0, 0, 1, 1,
1.794092, 1.009019, 0.4406535, 0, 0, 0, 1, 1,
1.805006, -1.436895, 1.751054, 0, 0, 0, 1, 1,
1.816132, 0.5477225, 0.8187284, 0, 0, 0, 1, 1,
1.816335, -0.849193, 1.628385, 0, 0, 0, 1, 1,
1.818952, 0.1884324, 0.8263921, 0, 0, 0, 1, 1,
1.820039, 0.1663536, 2.140736, 1, 1, 1, 1, 1,
1.83062, -1.032614, -0.6519704, 1, 1, 1, 1, 1,
1.863169, -0.4385798, 2.593764, 1, 1, 1, 1, 1,
1.918228, -2.206232, 2.558347, 1, 1, 1, 1, 1,
1.940589, -0.510434, 4.9614, 1, 1, 1, 1, 1,
1.941286, 0.2783039, -0.4361084, 1, 1, 1, 1, 1,
1.961399, 0.583955, 1.055367, 1, 1, 1, 1, 1,
1.974505, 0.1531649, 1.627665, 1, 1, 1, 1, 1,
1.995631, -0.8386149, -0.02761488, 1, 1, 1, 1, 1,
1.999637, -0.1257562, 1.868574, 1, 1, 1, 1, 1,
2.02024, 0.01484768, 1.511696, 1, 1, 1, 1, 1,
2.021409, -0.9004364, 1.785196, 1, 1, 1, 1, 1,
2.023336, 0.8016014, 0.2944156, 1, 1, 1, 1, 1,
2.042952, 0.5054554, 1.258272, 1, 1, 1, 1, 1,
2.060081, -0.439097, 3.129321, 1, 1, 1, 1, 1,
2.060665, -0.2372533, 0.4525619, 0, 0, 1, 1, 1,
2.06233, -0.231934, -0.733704, 1, 0, 0, 1, 1,
2.095075, -1.055606, 2.804387, 1, 0, 0, 1, 1,
2.102042, -1.149588, 3.254614, 1, 0, 0, 1, 1,
2.124679, -1.087139, 1.501736, 1, 0, 0, 1, 1,
2.151908, 0.1047806, 1.735692, 1, 0, 0, 1, 1,
2.15569, -0.2008957, 0.9025804, 0, 0, 0, 1, 1,
2.17541, 0.08579227, 2.537808, 0, 0, 0, 1, 1,
2.189821, -0.781319, 2.297241, 0, 0, 0, 1, 1,
2.213221, -0.1898969, 3.070446, 0, 0, 0, 1, 1,
2.2614, -0.7387515, -0.2316893, 0, 0, 0, 1, 1,
2.261568, -1.728093, 1.088298, 0, 0, 0, 1, 1,
2.261815, 1.804603, 2.377903, 0, 0, 0, 1, 1,
2.287897, 0.7749556, -0.2263547, 1, 1, 1, 1, 1,
2.328437, 0.354551, 1.533485, 1, 1, 1, 1, 1,
2.530692, 1.304305, 0.9437966, 1, 1, 1, 1, 1,
2.550012, 0.1439953, 1.437886, 1, 1, 1, 1, 1,
2.839381, 0.03483395, 2.557434, 1, 1, 1, 1, 1,
2.86595, -0.5955442, 2.391516, 1, 1, 1, 1, 1,
3.085352, -2.649145, 3.319708, 1, 1, 1, 1, 1
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
var radius = 9.223433;
var distance = 32.39692;
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
mvMatrix.translate( -0.1856027, 0.115643, -0.2556233 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.39692);
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