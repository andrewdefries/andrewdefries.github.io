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
-2.842891, -0.2431514, -1.4201, 1, 0, 0, 1,
-2.703655, 0.4815907, -1.897895, 1, 0.007843138, 0, 1,
-2.670579, 1.261828, -0.411644, 1, 0.01176471, 0, 1,
-2.553632, -0.7518132, -2.345364, 1, 0.01960784, 0, 1,
-2.534007, -0.04670833, 0.6709426, 1, 0.02352941, 0, 1,
-2.492563, -1.178451, -1.875244, 1, 0.03137255, 0, 1,
-2.46489, 0.1332516, -1.280756, 1, 0.03529412, 0, 1,
-2.455325, 1.237522, -0.2699572, 1, 0.04313726, 0, 1,
-2.435368, 1.399019, 0.389073, 1, 0.04705882, 0, 1,
-2.339295, -0.6496829, -0.7516411, 1, 0.05490196, 0, 1,
-2.339255, 0.67937, -0.05774839, 1, 0.05882353, 0, 1,
-2.329253, 0.2578773, -1.696823, 1, 0.06666667, 0, 1,
-2.305914, -1.159522, -1.411714, 1, 0.07058824, 0, 1,
-2.268152, -0.7207344, -3.075985, 1, 0.07843138, 0, 1,
-2.24314, -1.673477, -1.51616, 1, 0.08235294, 0, 1,
-2.22741, -0.3797389, -1.290006, 1, 0.09019608, 0, 1,
-2.216228, -0.6976696, -2.431478, 1, 0.09411765, 0, 1,
-2.202611, 0.5667408, -2.792282, 1, 0.1019608, 0, 1,
-2.190442, -1.246907, 0.2140274, 1, 0.1098039, 0, 1,
-2.15901, 0.7344579, -0.5653751, 1, 0.1137255, 0, 1,
-2.113791, -1.305273, -3.562101, 1, 0.1215686, 0, 1,
-2.081607, -0.5831195, -1.397431, 1, 0.1254902, 0, 1,
-2.053538, -0.7904143, 0.04221173, 1, 0.1333333, 0, 1,
-1.991894, -0.3217881, -2.42398, 1, 0.1372549, 0, 1,
-1.974904, 1.45448, -0.127118, 1, 0.145098, 0, 1,
-1.969475, -0.3597655, -0.6749098, 1, 0.1490196, 0, 1,
-1.969376, 0.1739099, -1.782619, 1, 0.1568628, 0, 1,
-1.966797, -0.2290741, -1.270672, 1, 0.1607843, 0, 1,
-1.95092, 1.455827, -1.307031, 1, 0.1686275, 0, 1,
-1.935962, 0.5354599, -2.502039, 1, 0.172549, 0, 1,
-1.912001, -1.59692, -1.758423, 1, 0.1803922, 0, 1,
-1.908215, -1.66291, -2.076678, 1, 0.1843137, 0, 1,
-1.899686, -0.1249514, 0.08872598, 1, 0.1921569, 0, 1,
-1.895504, -0.8153216, -2.608353, 1, 0.1960784, 0, 1,
-1.893481, 2.55668, -1.910922, 1, 0.2039216, 0, 1,
-1.893376, 0.5695457, 0.2548217, 1, 0.2117647, 0, 1,
-1.874966, -2.768056, -3.889311, 1, 0.2156863, 0, 1,
-1.871535, 0.397373, -2.130615, 1, 0.2235294, 0, 1,
-1.82972, -0.1288469, -1.326303, 1, 0.227451, 0, 1,
-1.799093, 0.2320648, -2.384453, 1, 0.2352941, 0, 1,
-1.792398, -1.067351, -2.932647, 1, 0.2392157, 0, 1,
-1.779153, -0.8744156, -1.735585, 1, 0.2470588, 0, 1,
-1.769571, -0.07665719, -2.937498, 1, 0.2509804, 0, 1,
-1.748713, 0.9336622, -0.1575737, 1, 0.2588235, 0, 1,
-1.740367, -1.108058, -2.01293, 1, 0.2627451, 0, 1,
-1.730426, -0.2473035, -1.578966, 1, 0.2705882, 0, 1,
-1.729816, 0.1825709, -0.5799136, 1, 0.2745098, 0, 1,
-1.718864, 1.302106, -0.2424648, 1, 0.282353, 0, 1,
-1.695572, -0.5248446, -0.3919153, 1, 0.2862745, 0, 1,
-1.680198, -0.7408744, -3.313693, 1, 0.2941177, 0, 1,
-1.676394, 0.7281383, 0.3871895, 1, 0.3019608, 0, 1,
-1.674644, 0.08923625, -1.542937, 1, 0.3058824, 0, 1,
-1.670102, 0.7808931, -2.166566, 1, 0.3137255, 0, 1,
-1.668933, -1.533754, -1.421697, 1, 0.3176471, 0, 1,
-1.668577, 1.955395, 0.713984, 1, 0.3254902, 0, 1,
-1.619357, -0.664991, -2.676735, 1, 0.3294118, 0, 1,
-1.610218, -0.5145578, -2.751764, 1, 0.3372549, 0, 1,
-1.609868, -1.178027, -0.9328542, 1, 0.3411765, 0, 1,
-1.607054, 1.159809, 0.49716, 1, 0.3490196, 0, 1,
-1.599287, -0.6285724, -3.007786, 1, 0.3529412, 0, 1,
-1.596277, -0.5436417, -2.070386, 1, 0.3607843, 0, 1,
-1.595401, -0.5214233, -1.748457, 1, 0.3647059, 0, 1,
-1.592594, -0.8299917, -2.649589, 1, 0.372549, 0, 1,
-1.582767, 0.01032646, -2.271194, 1, 0.3764706, 0, 1,
-1.575817, 2.284859, -1.354564, 1, 0.3843137, 0, 1,
-1.565905, -0.2932595, -2.822558, 1, 0.3882353, 0, 1,
-1.554827, -0.1238369, -0.00937776, 1, 0.3960784, 0, 1,
-1.542028, -0.3648227, -1.833134, 1, 0.4039216, 0, 1,
-1.540549, 0.7966186, -1.964297, 1, 0.4078431, 0, 1,
-1.526434, 1.291106, 0.12164, 1, 0.4156863, 0, 1,
-1.514126, -0.7835429, -0.5269644, 1, 0.4196078, 0, 1,
-1.51059, -0.4886846, -3.460564, 1, 0.427451, 0, 1,
-1.493303, -0.4276878, -1.860381, 1, 0.4313726, 0, 1,
-1.493171, 0.04514819, 0.6474194, 1, 0.4392157, 0, 1,
-1.491142, 0.3594393, -2.661885, 1, 0.4431373, 0, 1,
-1.48128, -1.280033, -0.8459583, 1, 0.4509804, 0, 1,
-1.481143, 1.400142, 0.7039492, 1, 0.454902, 0, 1,
-1.475435, -3.06455, -5.593898, 1, 0.4627451, 0, 1,
-1.474373, -0.4718439, -0.7788619, 1, 0.4666667, 0, 1,
-1.471037, 0.4669459, 0.6095127, 1, 0.4745098, 0, 1,
-1.468953, -0.5734559, -1.598114, 1, 0.4784314, 0, 1,
-1.449434, 0.8596392, -0.2214182, 1, 0.4862745, 0, 1,
-1.449412, -0.6735952, -0.2908819, 1, 0.4901961, 0, 1,
-1.446076, 0.1021014, -1.276277, 1, 0.4980392, 0, 1,
-1.445512, -1.934384, -3.256201, 1, 0.5058824, 0, 1,
-1.44547, 1.107205, 0.8717145, 1, 0.509804, 0, 1,
-1.441805, -0.955942, -1.912615, 1, 0.5176471, 0, 1,
-1.431841, 0.3096017, -1.600201, 1, 0.5215687, 0, 1,
-1.422826, -0.4333467, -1.430415, 1, 0.5294118, 0, 1,
-1.418013, -0.07588376, -1.170535, 1, 0.5333334, 0, 1,
-1.416579, -1.351836, -2.272022, 1, 0.5411765, 0, 1,
-1.409146, -1.11314, -3.841465, 1, 0.5450981, 0, 1,
-1.39166, 0.7046972, -1.279673, 1, 0.5529412, 0, 1,
-1.373869, -0.2310298, -1.733329, 1, 0.5568628, 0, 1,
-1.36913, -0.5614659, -2.428657, 1, 0.5647059, 0, 1,
-1.368273, -0.3430745, -2.497192, 1, 0.5686275, 0, 1,
-1.358087, -1.585127, -2.466265, 1, 0.5764706, 0, 1,
-1.344829, -0.2353583, -1.219213, 1, 0.5803922, 0, 1,
-1.331546, -0.5118088, -2.514552, 1, 0.5882353, 0, 1,
-1.308951, 0.8516082, -0.6456861, 1, 0.5921569, 0, 1,
-1.306411, -1.109987, -2.413543, 1, 0.6, 0, 1,
-1.303115, 0.561701, -0.2654056, 1, 0.6078432, 0, 1,
-1.303104, 0.9592432, -1.369683, 1, 0.6117647, 0, 1,
-1.294116, 1.013718, -0.3550219, 1, 0.6196079, 0, 1,
-1.289877, -0.007060957, -1.423585, 1, 0.6235294, 0, 1,
-1.279688, 1.422809, -2.908265, 1, 0.6313726, 0, 1,
-1.269021, 0.1372058, -2.611104, 1, 0.6352941, 0, 1,
-1.268242, -0.869562, -2.485168, 1, 0.6431373, 0, 1,
-1.266242, 0.9414151, -1.89556, 1, 0.6470588, 0, 1,
-1.262181, 1.038838, -0.4217015, 1, 0.654902, 0, 1,
-1.258369, -0.06754377, -1.60051, 1, 0.6588235, 0, 1,
-1.257305, 0.8255646, -2.005674, 1, 0.6666667, 0, 1,
-1.251012, 0.2813587, -1.051383, 1, 0.6705883, 0, 1,
-1.243506, -0.989298, -1.299136, 1, 0.6784314, 0, 1,
-1.237113, 1.508876, 0.5969923, 1, 0.682353, 0, 1,
-1.230876, 0.1613957, -1.518997, 1, 0.6901961, 0, 1,
-1.226012, 0.1094471, -2.825093, 1, 0.6941177, 0, 1,
-1.22375, 1.051003, -0.3182932, 1, 0.7019608, 0, 1,
-1.223329, -1.414148, -2.647362, 1, 0.7098039, 0, 1,
-1.222654, 0.4345329, -1.327359, 1, 0.7137255, 0, 1,
-1.219991, -0.4365012, -1.134771, 1, 0.7215686, 0, 1,
-1.219418, 1.978552, -1.726865, 1, 0.7254902, 0, 1,
-1.21646, -0.03828182, -3.218057, 1, 0.7333333, 0, 1,
-1.203712, -0.5047123, -1.821372, 1, 0.7372549, 0, 1,
-1.202275, -0.1520033, -1.479495, 1, 0.7450981, 0, 1,
-1.190063, -0.7737437, -1.316633, 1, 0.7490196, 0, 1,
-1.189806, 0.153141, -1.332911, 1, 0.7568628, 0, 1,
-1.182695, -0.7166424, -2.178903, 1, 0.7607843, 0, 1,
-1.17897, 0.7911375, -0.2535781, 1, 0.7686275, 0, 1,
-1.177363, 1.900694, 0.8212303, 1, 0.772549, 0, 1,
-1.172819, -0.4376984, -1.374021, 1, 0.7803922, 0, 1,
-1.172404, 0.5916776, -1.803805, 1, 0.7843137, 0, 1,
-1.165224, -0.5115983, -1.50448, 1, 0.7921569, 0, 1,
-1.159907, -1.54606, -2.813969, 1, 0.7960784, 0, 1,
-1.157388, -0.3840778, -2.082948, 1, 0.8039216, 0, 1,
-1.151578, 0.6112754, 0.1164671, 1, 0.8117647, 0, 1,
-1.147012, -0.06160992, -0.8987461, 1, 0.8156863, 0, 1,
-1.145968, 0.392718, -0.3081122, 1, 0.8235294, 0, 1,
-1.143492, -0.4416535, -1.661162, 1, 0.827451, 0, 1,
-1.139759, -1.784394, -3.662932, 1, 0.8352941, 0, 1,
-1.136848, 0.5946249, -0.3751804, 1, 0.8392157, 0, 1,
-1.133591, 0.6855974, -1.565878, 1, 0.8470588, 0, 1,
-1.131405, 0.3335853, -1.608116, 1, 0.8509804, 0, 1,
-1.127549, -0.107229, -0.4038721, 1, 0.8588235, 0, 1,
-1.119951, 1.501434, -2.608539, 1, 0.8627451, 0, 1,
-1.114158, 0.2509103, -0.919269, 1, 0.8705882, 0, 1,
-1.108323, -0.1708226, -1.165444, 1, 0.8745098, 0, 1,
-1.087043, -1.582002, -1.148818, 1, 0.8823529, 0, 1,
-1.086413, 0.6839344, -0.2464009, 1, 0.8862745, 0, 1,
-1.074616, 1.107508, -1.282207, 1, 0.8941177, 0, 1,
-1.072572, -0.2340991, -1.246468, 1, 0.8980392, 0, 1,
-1.071903, -0.7178904, -2.053886, 1, 0.9058824, 0, 1,
-1.06726, 0.9226885, -0.1702156, 1, 0.9137255, 0, 1,
-1.060252, -0.2719817, -1.398092, 1, 0.9176471, 0, 1,
-1.057684, 0.9044226, -1.094917, 1, 0.9254902, 0, 1,
-1.051915, -1.483972, -2.181647, 1, 0.9294118, 0, 1,
-1.048364, 0.6594746, -1.211356, 1, 0.9372549, 0, 1,
-1.044202, 0.8770961, -0.7157059, 1, 0.9411765, 0, 1,
-1.036498, -0.48493, -1.323286, 1, 0.9490196, 0, 1,
-1.034367, 0.3098425, -1.509385, 1, 0.9529412, 0, 1,
-1.026286, 0.6619463, -0.3684877, 1, 0.9607843, 0, 1,
-1.026275, -3.421356, -1.758959, 1, 0.9647059, 0, 1,
-1.025017, 1.384714, -0.238146, 1, 0.972549, 0, 1,
-1.020576, 0.04920926, -1.538464, 1, 0.9764706, 0, 1,
-1.017019, -0.3476667, -1.335173, 1, 0.9843137, 0, 1,
-1.013163, 0.9716487, -1.948954, 1, 0.9882353, 0, 1,
-1.012069, 0.2936544, -2.780923, 1, 0.9960784, 0, 1,
-1.010215, 1.326699, -1.53849, 0.9960784, 1, 0, 1,
-1.007975, 1.071083, 0.3653311, 0.9921569, 1, 0, 1,
-1.000162, 0.3884644, -1.920313, 0.9843137, 1, 0, 1,
-0.9978645, -0.3059776, -2.842585, 0.9803922, 1, 0, 1,
-0.9948435, -0.1716106, -3.370978, 0.972549, 1, 0, 1,
-0.9825756, -2.195738, -2.401858, 0.9686275, 1, 0, 1,
-0.971068, 0.3988516, -3.364535, 0.9607843, 1, 0, 1,
-0.9694005, -0.8192345, -1.457382, 0.9568627, 1, 0, 1,
-0.9629166, -0.9546902, -0.8635412, 0.9490196, 1, 0, 1,
-0.9592078, -0.6041035, -0.6208206, 0.945098, 1, 0, 1,
-0.9585007, -0.3730076, -3.36783, 0.9372549, 1, 0, 1,
-0.9488834, -1.149948, -2.406601, 0.9333333, 1, 0, 1,
-0.9480171, 1.814071, 0.6023607, 0.9254902, 1, 0, 1,
-0.9461975, -0.2760051, -1.065802, 0.9215686, 1, 0, 1,
-0.9450349, 0.1920449, -0.8997061, 0.9137255, 1, 0, 1,
-0.9446522, -0.2814004, -0.06387998, 0.9098039, 1, 0, 1,
-0.9383839, 0.0217434, -1.869383, 0.9019608, 1, 0, 1,
-0.9347255, 0.254798, -1.202455, 0.8941177, 1, 0, 1,
-0.9336134, -0.8635651, -2.23329, 0.8901961, 1, 0, 1,
-0.9317595, -0.4868371, -1.551481, 0.8823529, 1, 0, 1,
-0.9274392, 0.6577241, 0.06693009, 0.8784314, 1, 0, 1,
-0.9251559, 0.2864905, -1.143294, 0.8705882, 1, 0, 1,
-0.9234281, 2.230361, 0.6718588, 0.8666667, 1, 0, 1,
-0.9210123, -0.2974908, -2.471244, 0.8588235, 1, 0, 1,
-0.9206305, -0.9182314, -2.029999, 0.854902, 1, 0, 1,
-0.9189448, -0.6263257, -1.265278, 0.8470588, 1, 0, 1,
-0.9170389, 1.249162, -0.9563496, 0.8431373, 1, 0, 1,
-0.9156123, 1.251949, -0.3723483, 0.8352941, 1, 0, 1,
-0.915091, 0.4946222, -0.9701452, 0.8313726, 1, 0, 1,
-0.9103003, 1.541074, 0.2979912, 0.8235294, 1, 0, 1,
-0.9096905, 1.058704, -0.1232686, 0.8196079, 1, 0, 1,
-0.9010088, -1.12074, -2.00864, 0.8117647, 1, 0, 1,
-0.8947024, -1.804609, -3.091329, 0.8078431, 1, 0, 1,
-0.8820488, -0.1425725, -0.5243157, 0.8, 1, 0, 1,
-0.8808652, 0.3689867, -1.582209, 0.7921569, 1, 0, 1,
-0.8804721, 1.243215, -1.499979, 0.7882353, 1, 0, 1,
-0.8794744, -1.019832, -2.448736, 0.7803922, 1, 0, 1,
-0.8786863, -1.580818, -4.070034, 0.7764706, 1, 0, 1,
-0.8771501, 1.387787, -1.697573, 0.7686275, 1, 0, 1,
-0.8734235, 0.208647, -0.4414835, 0.7647059, 1, 0, 1,
-0.8711204, 0.9393693, 0.1634751, 0.7568628, 1, 0, 1,
-0.8711095, -0.5121932, -1.822573, 0.7529412, 1, 0, 1,
-0.8666176, -0.6843151, -1.712839, 0.7450981, 1, 0, 1,
-0.8621653, -0.02123526, -0.5618763, 0.7411765, 1, 0, 1,
-0.8613106, -0.1757556, -2.11752, 0.7333333, 1, 0, 1,
-0.8538038, 0.4060191, 0.517938, 0.7294118, 1, 0, 1,
-0.8527541, 2.147174, -1.432563, 0.7215686, 1, 0, 1,
-0.8412979, 1.382007, 0.5477908, 0.7176471, 1, 0, 1,
-0.8340765, 0.04751899, -1.309664, 0.7098039, 1, 0, 1,
-0.8318359, -1.059027, -0.760675, 0.7058824, 1, 0, 1,
-0.8295584, 1.579822, 0.02631234, 0.6980392, 1, 0, 1,
-0.8251385, -0.7603476, -1.664766, 0.6901961, 1, 0, 1,
-0.8228849, 0.3780533, 0.1349927, 0.6862745, 1, 0, 1,
-0.8179147, 0.1524752, -1.790057, 0.6784314, 1, 0, 1,
-0.8139265, 1.669172, 0.4868736, 0.6745098, 1, 0, 1,
-0.8136628, -2.89888, -2.195399, 0.6666667, 1, 0, 1,
-0.8129701, 1.751354, 1.760328, 0.6627451, 1, 0, 1,
-0.8103916, 1.065161, 0.1957425, 0.654902, 1, 0, 1,
-0.8086738, -0.740707, -1.652144, 0.6509804, 1, 0, 1,
-0.8067264, 2.190053, -1.21036, 0.6431373, 1, 0, 1,
-0.8060905, 0.0002616268, -1.191781, 0.6392157, 1, 0, 1,
-0.8028285, -1.984678, -2.57577, 0.6313726, 1, 0, 1,
-0.7939873, 0.2503939, 0.1065013, 0.627451, 1, 0, 1,
-0.7923619, -1.722545, -2.720899, 0.6196079, 1, 0, 1,
-0.7805253, 0.8760945, 0.1140405, 0.6156863, 1, 0, 1,
-0.7795603, -1.236368, -4.526519, 0.6078432, 1, 0, 1,
-0.7748187, -1.267802, -3.497165, 0.6039216, 1, 0, 1,
-0.7695095, 1.130195, 1.089803, 0.5960785, 1, 0, 1,
-0.7693242, 0.9056685, -0.8344809, 0.5882353, 1, 0, 1,
-0.7650058, -0.5622883, -2.657465, 0.5843138, 1, 0, 1,
-0.7584373, -1.110397, -2.527091, 0.5764706, 1, 0, 1,
-0.7526522, 1.967452, 1.124651, 0.572549, 1, 0, 1,
-0.7441233, 1.389679, -0.8544796, 0.5647059, 1, 0, 1,
-0.7426823, -1.113628, -3.026805, 0.5607843, 1, 0, 1,
-0.7367435, 0.1142511, -0.7294385, 0.5529412, 1, 0, 1,
-0.7355866, 0.9385412, -0.03964102, 0.5490196, 1, 0, 1,
-0.7338663, -0.06426305, -2.811462, 0.5411765, 1, 0, 1,
-0.7250063, -2.009052, -0.5630845, 0.5372549, 1, 0, 1,
-0.723659, 1.178898, 0.06229575, 0.5294118, 1, 0, 1,
-0.7212186, 0.8887162, 0.5846925, 0.5254902, 1, 0, 1,
-0.7182667, 1.351597, 0.1786869, 0.5176471, 1, 0, 1,
-0.7164474, 0.7618634, -0.6461913, 0.5137255, 1, 0, 1,
-0.7095553, 0.2434597, -1.817863, 0.5058824, 1, 0, 1,
-0.7078525, -0.4339343, -1.333428, 0.5019608, 1, 0, 1,
-0.7060388, 1.1917, -0.1648531, 0.4941176, 1, 0, 1,
-0.7007521, -0.5853141, -3.009942, 0.4862745, 1, 0, 1,
-0.6803845, -0.4355635, -1.135291, 0.4823529, 1, 0, 1,
-0.6781494, -0.5658473, -2.438661, 0.4745098, 1, 0, 1,
-0.6750926, -2.027622, -2.567803, 0.4705882, 1, 0, 1,
-0.67468, 3.155406, -1.01255, 0.4627451, 1, 0, 1,
-0.6678252, -1.91729, -2.904981, 0.4588235, 1, 0, 1,
-0.6670815, -0.09956502, -1.24007, 0.4509804, 1, 0, 1,
-0.6660829, 1.786674, -0.8938028, 0.4470588, 1, 0, 1,
-0.6646594, -0.1648241, -3.425065, 0.4392157, 1, 0, 1,
-0.6645744, 0.3362601, -0.9065939, 0.4352941, 1, 0, 1,
-0.6642904, 0.5167738, -0.8710879, 0.427451, 1, 0, 1,
-0.6584843, 0.4051981, -0.8506867, 0.4235294, 1, 0, 1,
-0.6568869, -0.557166, -2.250814, 0.4156863, 1, 0, 1,
-0.6536448, -1.37356, -1.547264, 0.4117647, 1, 0, 1,
-0.6514793, -0.8497402, -3.241088, 0.4039216, 1, 0, 1,
-0.6503487, 0.3415706, -1.369718, 0.3960784, 1, 0, 1,
-0.6228932, -1.366691, -3.606987, 0.3921569, 1, 0, 1,
-0.6197962, 1.047438, -0.9767704, 0.3843137, 1, 0, 1,
-0.6179575, -0.5649585, -0.8245503, 0.3803922, 1, 0, 1,
-0.6038828, 1.37089, -0.1550705, 0.372549, 1, 0, 1,
-0.596454, 1.227406, -0.6114863, 0.3686275, 1, 0, 1,
-0.5846375, 0.6839225, 0.9380742, 0.3607843, 1, 0, 1,
-0.5838461, -1.972783, -2.741565, 0.3568628, 1, 0, 1,
-0.5814601, 0.8166203, -0.2346563, 0.3490196, 1, 0, 1,
-0.5801948, -0.8742466, -3.08905, 0.345098, 1, 0, 1,
-0.572037, -0.9363448, -2.310265, 0.3372549, 1, 0, 1,
-0.5703741, 0.7648645, -0.7370428, 0.3333333, 1, 0, 1,
-0.5645556, -0.5647524, -1.80354, 0.3254902, 1, 0, 1,
-0.5597595, 0.3183154, -0.5671448, 0.3215686, 1, 0, 1,
-0.557164, -0.5438687, -1.704064, 0.3137255, 1, 0, 1,
-0.5548774, -0.7159182, -0.2580376, 0.3098039, 1, 0, 1,
-0.5533047, 0.7010262, -1.022752, 0.3019608, 1, 0, 1,
-0.5481334, -0.3068146, -2.995474, 0.2941177, 1, 0, 1,
-0.547448, 1.939837, -0.8810676, 0.2901961, 1, 0, 1,
-0.5472084, 1.666219, 1.100811, 0.282353, 1, 0, 1,
-0.5466338, -1.444583, -1.275793, 0.2784314, 1, 0, 1,
-0.5436356, -1.95928, -3.178743, 0.2705882, 1, 0, 1,
-0.5429714, -0.8573399, -3.480772, 0.2666667, 1, 0, 1,
-0.5385784, -0.8449894, -0.262154, 0.2588235, 1, 0, 1,
-0.5377815, -0.1102707, -3.051717, 0.254902, 1, 0, 1,
-0.5320877, -1.674865, -3.4503, 0.2470588, 1, 0, 1,
-0.5259092, 1.819794, -0.1697629, 0.2431373, 1, 0, 1,
-0.5179959, -1.490644, -2.706511, 0.2352941, 1, 0, 1,
-0.5117297, 2.458993, -1.435674, 0.2313726, 1, 0, 1,
-0.5112602, 0.2174764, -1.672662, 0.2235294, 1, 0, 1,
-0.5102383, 1.756351, 0.3161697, 0.2196078, 1, 0, 1,
-0.5089478, -0.7997211, -1.774588, 0.2117647, 1, 0, 1,
-0.5065815, 0.4929571, -1.434339, 0.2078431, 1, 0, 1,
-0.5030927, 0.9430208, 0.04473121, 0.2, 1, 0, 1,
-0.4915413, -0.1448261, -2.652143, 0.1921569, 1, 0, 1,
-0.4908466, -0.04770786, -0.7424387, 0.1882353, 1, 0, 1,
-0.4876307, -1.049965, -2.815473, 0.1803922, 1, 0, 1,
-0.4804566, 0.2106849, -1.079996, 0.1764706, 1, 0, 1,
-0.4785365, 0.9852891, -0.07483943, 0.1686275, 1, 0, 1,
-0.4783459, -2.020124, -2.069675, 0.1647059, 1, 0, 1,
-0.4717294, -0.4881408, -2.22756, 0.1568628, 1, 0, 1,
-0.4678057, -0.4138521, -1.731622, 0.1529412, 1, 0, 1,
-0.4661654, 0.4441687, 0.4407101, 0.145098, 1, 0, 1,
-0.4620798, 0.7430699, -1.029823, 0.1411765, 1, 0, 1,
-0.4619728, 1.039385, 0.720287, 0.1333333, 1, 0, 1,
-0.4616713, 0.5126649, -1.191667, 0.1294118, 1, 0, 1,
-0.4597402, -0.3354627, -0.8634813, 0.1215686, 1, 0, 1,
-0.4593323, -0.2685867, -1.403245, 0.1176471, 1, 0, 1,
-0.4542443, 2.393678, -0.8566827, 0.1098039, 1, 0, 1,
-0.4491019, 0.06329495, -3.916118, 0.1058824, 1, 0, 1,
-0.4458711, -0.6813876, -2.118594, 0.09803922, 1, 0, 1,
-0.4453737, 1.3402, 1.352623, 0.09019608, 1, 0, 1,
-0.4337006, 0.1232931, -1.719744, 0.08627451, 1, 0, 1,
-0.4314173, -0.2020619, -2.215493, 0.07843138, 1, 0, 1,
-0.4223978, 0.1654934, 1.080492, 0.07450981, 1, 0, 1,
-0.4203961, -0.5389479, -2.244045, 0.06666667, 1, 0, 1,
-0.4176476, 0.2323971, -1.314445, 0.0627451, 1, 0, 1,
-0.4117188, -1.5213, -3.085474, 0.05490196, 1, 0, 1,
-0.4110174, 0.9177356, -0.9216343, 0.05098039, 1, 0, 1,
-0.4106283, -1.062532, -3.591052, 0.04313726, 1, 0, 1,
-0.4085937, 0.3366953, -2.14625, 0.03921569, 1, 0, 1,
-0.4027074, 0.09579732, -1.112762, 0.03137255, 1, 0, 1,
-0.4023139, 0.4097113, -1.132403, 0.02745098, 1, 0, 1,
-0.4014595, -0.7224055, -3.826197, 0.01960784, 1, 0, 1,
-0.3975435, -0.535267, -3.80842, 0.01568628, 1, 0, 1,
-0.39166, -0.04869248, -1.895526, 0.007843138, 1, 0, 1,
-0.3901071, 0.39057, -0.03818742, 0.003921569, 1, 0, 1,
-0.3835269, -0.07867026, -2.35723, 0, 1, 0.003921569, 1,
-0.3824632, -0.2086647, -1.762518, 0, 1, 0.01176471, 1,
-0.378984, 0.2806747, -1.99415, 0, 1, 0.01568628, 1,
-0.3753163, 0.9289297, -0.6408878, 0, 1, 0.02352941, 1,
-0.3724411, 0.9108137, -0.1074743, 0, 1, 0.02745098, 1,
-0.36136, -0.9001526, -2.067914, 0, 1, 0.03529412, 1,
-0.3611545, 0.3588379, -0.6362866, 0, 1, 0.03921569, 1,
-0.3587157, 0.4725327, -1.787176, 0, 1, 0.04705882, 1,
-0.3563023, 0.4901098, 2.797714, 0, 1, 0.05098039, 1,
-0.3555219, -0.1726148, -2.673325, 0, 1, 0.05882353, 1,
-0.3525767, 0.6178845, -1.689337, 0, 1, 0.0627451, 1,
-0.3513266, 0.5237715, -2.125788, 0, 1, 0.07058824, 1,
-0.3512842, -0.1948188, -1.881636, 0, 1, 0.07450981, 1,
-0.3510526, -1.037427, -3.711091, 0, 1, 0.08235294, 1,
-0.3497961, -0.9954008, -2.155028, 0, 1, 0.08627451, 1,
-0.3488829, 0.2554988, -1.358534, 0, 1, 0.09411765, 1,
-0.3472867, -1.835978, -0.9515235, 0, 1, 0.1019608, 1,
-0.345493, -1.1109, -1.714884, 0, 1, 0.1058824, 1,
-0.3415483, -0.7846819, -2.613693, 0, 1, 0.1137255, 1,
-0.3407204, 1.332424, -0.7366391, 0, 1, 0.1176471, 1,
-0.3405115, 0.04252814, -1.539586, 0, 1, 0.1254902, 1,
-0.3374947, -0.5192952, -1.479099, 0, 1, 0.1294118, 1,
-0.3361684, -1.658163, -2.114019, 0, 1, 0.1372549, 1,
-0.3349401, 1.109311, 0.145844, 0, 1, 0.1411765, 1,
-0.3299315, -1.497154, -3.672012, 0, 1, 0.1490196, 1,
-0.3295798, 0.953981, -0.5441419, 0, 1, 0.1529412, 1,
-0.3262386, 0.8697488, -1.272191, 0, 1, 0.1607843, 1,
-0.3209548, 0.2369822, -1.94003, 0, 1, 0.1647059, 1,
-0.3207915, 1.298987, -0.6697361, 0, 1, 0.172549, 1,
-0.3201673, 1.011996, -0.4189191, 0, 1, 0.1764706, 1,
-0.3139001, 0.9498721, 0.6959723, 0, 1, 0.1843137, 1,
-0.3105604, 1.143429, 1.326693, 0, 1, 0.1882353, 1,
-0.3078342, 0.25978, -0.2783915, 0, 1, 0.1960784, 1,
-0.3062647, 0.7245829, -0.9674795, 0, 1, 0.2039216, 1,
-0.3035265, -1.164096, -4.657952, 0, 1, 0.2078431, 1,
-0.3013397, -0.3579604, -0.9926758, 0, 1, 0.2156863, 1,
-0.3009967, -0.2749449, -2.707941, 0, 1, 0.2196078, 1,
-0.2981471, -1.857482, -4.394015, 0, 1, 0.227451, 1,
-0.2977348, -0.06428163, -1.54651, 0, 1, 0.2313726, 1,
-0.2940429, 1.771699, -0.02234297, 0, 1, 0.2392157, 1,
-0.2934307, 1.098985, 1.338799, 0, 1, 0.2431373, 1,
-0.2916169, 1.464986, -1.110549, 0, 1, 0.2509804, 1,
-0.2848845, -1.015359, -3.068879, 0, 1, 0.254902, 1,
-0.2847409, -0.9470363, -3.39684, 0, 1, 0.2627451, 1,
-0.2795171, 1.534268, -1.161348, 0, 1, 0.2666667, 1,
-0.2789696, -0.7373917, -1.634757, 0, 1, 0.2745098, 1,
-0.2760339, 1.57539, -0.2115023, 0, 1, 0.2784314, 1,
-0.2730012, -0.5978663, -2.830137, 0, 1, 0.2862745, 1,
-0.2729466, -0.7541093, -4.158363, 0, 1, 0.2901961, 1,
-0.2714705, 0.07675791, -1.280614, 0, 1, 0.2980392, 1,
-0.2712098, 0.5881976, 1.009805, 0, 1, 0.3058824, 1,
-0.2697629, -1.796086, -2.712046, 0, 1, 0.3098039, 1,
-0.2625352, 0.7658694, -0.5271084, 0, 1, 0.3176471, 1,
-0.2606435, -1.724202, -3.304494, 0, 1, 0.3215686, 1,
-0.2597593, -1.177526, -4.268162, 0, 1, 0.3294118, 1,
-0.2593169, -0.04357935, -1.373666, 0, 1, 0.3333333, 1,
-0.2557152, 1.136159, -0.8626187, 0, 1, 0.3411765, 1,
-0.2537718, -0.6024132, -3.770535, 0, 1, 0.345098, 1,
-0.2522506, 0.9938481, -0.8686333, 0, 1, 0.3529412, 1,
-0.2515481, -0.6131921, -2.625496, 0, 1, 0.3568628, 1,
-0.2512314, -0.0740797, 0.837896, 0, 1, 0.3647059, 1,
-0.2509083, -1.076673, -3.581167, 0, 1, 0.3686275, 1,
-0.2483707, 1.742966, -0.3026907, 0, 1, 0.3764706, 1,
-0.2458723, 1.012307, -0.3202785, 0, 1, 0.3803922, 1,
-0.2441239, 1.483756, -1.709638, 0, 1, 0.3882353, 1,
-0.238708, -0.03207428, -1.67932, 0, 1, 0.3921569, 1,
-0.2333821, -0.4745342, -4.009638, 0, 1, 0.4, 1,
-0.2308849, -0.1820946, -1.670898, 0, 1, 0.4078431, 1,
-0.230366, -0.520472, -1.140444, 0, 1, 0.4117647, 1,
-0.2295617, 0.2966343, -2.268984, 0, 1, 0.4196078, 1,
-0.2271461, -0.616058, -2.856414, 0, 1, 0.4235294, 1,
-0.2217811, 0.3798691, -1.070034, 0, 1, 0.4313726, 1,
-0.2165097, 1.19394, -0.6798868, 0, 1, 0.4352941, 1,
-0.2156041, 0.1614925, -0.7141389, 0, 1, 0.4431373, 1,
-0.2110116, 1.03029, -0.892897, 0, 1, 0.4470588, 1,
-0.2050339, -0.6695459, -3.948109, 0, 1, 0.454902, 1,
-0.2037423, -0.4839769, -1.508959, 0, 1, 0.4588235, 1,
-0.2032488, 0.6779627, 0.7314219, 0, 1, 0.4666667, 1,
-0.2020357, -0.6908288, -2.934648, 0, 1, 0.4705882, 1,
-0.1986699, 0.3112442, -0.9864274, 0, 1, 0.4784314, 1,
-0.194698, 0.3883312, 0.5104803, 0, 1, 0.4823529, 1,
-0.1911984, -0.5136669, -2.804507, 0, 1, 0.4901961, 1,
-0.1908007, 0.7205175, -1.184048, 0, 1, 0.4941176, 1,
-0.1851774, 0.2565058, -1.034683, 0, 1, 0.5019608, 1,
-0.1835736, -0.2051859, -3.371245, 0, 1, 0.509804, 1,
-0.1775067, -0.5271373, -1.87224, 0, 1, 0.5137255, 1,
-0.1760138, 0.3571172, 0.08205617, 0, 1, 0.5215687, 1,
-0.1759881, -0.6345941, -2.939053, 0, 1, 0.5254902, 1,
-0.1752287, 0.7860528, -0.9866954, 0, 1, 0.5333334, 1,
-0.1748651, 0.9563196, -0.9650785, 0, 1, 0.5372549, 1,
-0.1737728, 1.141937, 1.319603, 0, 1, 0.5450981, 1,
-0.1730252, -0.3465331, -2.854474, 0, 1, 0.5490196, 1,
-0.1727227, -0.7868057, -2.416179, 0, 1, 0.5568628, 1,
-0.1720669, 0.8157697, -0.3105231, 0, 1, 0.5607843, 1,
-0.1704507, 0.7580343, -1.670126, 0, 1, 0.5686275, 1,
-0.1680207, -0.2628529, -3.22673, 0, 1, 0.572549, 1,
-0.1658635, 0.4436287, -0.7950215, 0, 1, 0.5803922, 1,
-0.1642151, -0.8023522, -2.004964, 0, 1, 0.5843138, 1,
-0.1600836, 0.1325042, -0.0521959, 0, 1, 0.5921569, 1,
-0.1578848, -0.944997, -3.091689, 0, 1, 0.5960785, 1,
-0.1549052, -0.7025133, -3.381643, 0, 1, 0.6039216, 1,
-0.1517288, 0.7540236, -0.8925243, 0, 1, 0.6117647, 1,
-0.1507313, -1.770546, -3.531043, 0, 1, 0.6156863, 1,
-0.1437675, -0.6568874, -2.998116, 0, 1, 0.6235294, 1,
-0.142275, 0.2656154, -1.981264, 0, 1, 0.627451, 1,
-0.1382837, -0.2329663, -1.381067, 0, 1, 0.6352941, 1,
-0.1301331, 0.7863269, -1.491492, 0, 1, 0.6392157, 1,
-0.1221652, -0.2103913, -0.5982957, 0, 1, 0.6470588, 1,
-0.1130504, -1.106837, -1.892163, 0, 1, 0.6509804, 1,
-0.1124033, 0.4794518, 0.3149753, 0, 1, 0.6588235, 1,
-0.1119403, -0.1161409, -3.098117, 0, 1, 0.6627451, 1,
-0.1112034, 1.022053, 0.09414773, 0, 1, 0.6705883, 1,
-0.1099838, 1.757732, -0.7648854, 0, 1, 0.6745098, 1,
-0.1084987, 0.1924322, -0.1386902, 0, 1, 0.682353, 1,
-0.1067108, -1.25826, -2.419452, 0, 1, 0.6862745, 1,
-0.1059994, -1.774736, -3.400301, 0, 1, 0.6941177, 1,
-0.1044224, 1.053671, -2.315864, 0, 1, 0.7019608, 1,
-0.0984228, 0.1186412, 1.118403, 0, 1, 0.7058824, 1,
-0.09489325, -0.8102198, -1.364558, 0, 1, 0.7137255, 1,
-0.09115112, 1.148325, 0.4126887, 0, 1, 0.7176471, 1,
-0.08888457, -0.2482412, -2.622621, 0, 1, 0.7254902, 1,
-0.08877776, -1.192551, -1.388317, 0, 1, 0.7294118, 1,
-0.0878568, -1.621828, -2.167624, 0, 1, 0.7372549, 1,
-0.08372987, 2.277258, -0.6685814, 0, 1, 0.7411765, 1,
-0.08346317, 0.0170981, 0.7955983, 0, 1, 0.7490196, 1,
-0.08306465, 0.1819107, -0.4670437, 0, 1, 0.7529412, 1,
-0.0806141, -0.4188377, -2.721276, 0, 1, 0.7607843, 1,
-0.07698192, 0.1162147, -1.511427, 0, 1, 0.7647059, 1,
-0.07684445, 0.3649717, 1.967023, 0, 1, 0.772549, 1,
-0.07606181, 0.6374646, -0.1805698, 0, 1, 0.7764706, 1,
-0.07015876, -1.001241, -2.496834, 0, 1, 0.7843137, 1,
-0.07003304, -0.5370691, -2.19614, 0, 1, 0.7882353, 1,
-0.06928729, -1.686094, -3.308264, 0, 1, 0.7960784, 1,
-0.06917854, -0.7357951, -3.642092, 0, 1, 0.8039216, 1,
-0.06901239, 0.9525075, -0.2084072, 0, 1, 0.8078431, 1,
-0.06592958, 0.681106, -1.208683, 0, 1, 0.8156863, 1,
-0.06428605, -0.8276801, -4.015749, 0, 1, 0.8196079, 1,
-0.06315574, -0.1693048, -2.49548, 0, 1, 0.827451, 1,
-0.06296071, -0.2015861, -1.218011, 0, 1, 0.8313726, 1,
-0.06061843, -0.1833058, -2.800007, 0, 1, 0.8392157, 1,
-0.05442527, -1.170122, -3.380201, 0, 1, 0.8431373, 1,
-0.05336193, 0.5289198, -1.055339, 0, 1, 0.8509804, 1,
-0.05169992, 0.9349849, -0.1982895, 0, 1, 0.854902, 1,
-0.04962672, -0.01752562, -3.544217, 0, 1, 0.8627451, 1,
-0.04710475, 0.3278284, -1.055503, 0, 1, 0.8666667, 1,
-0.04674939, 0.4377973, -1.807506, 0, 1, 0.8745098, 1,
-0.04629696, -0.1256152, -1.42246, 0, 1, 0.8784314, 1,
-0.04349033, -0.9574695, -2.556634, 0, 1, 0.8862745, 1,
-0.04325113, 0.8352569, 0.474089, 0, 1, 0.8901961, 1,
-0.04143472, 0.8210775, -0.4643487, 0, 1, 0.8980392, 1,
-0.04080545, 0.5265031, -0.6018535, 0, 1, 0.9058824, 1,
-0.0288617, 1.818458, 0.06856954, 0, 1, 0.9098039, 1,
-0.02735575, -1.618139, -3.273705, 0, 1, 0.9176471, 1,
-0.02542774, 0.2408613, 0.03368342, 0, 1, 0.9215686, 1,
-0.02450083, 0.1857541, -1.514699, 0, 1, 0.9294118, 1,
-0.02382752, -0.9557767, -2.523266, 0, 1, 0.9333333, 1,
-0.02382087, 1.481798, 0.8396431, 0, 1, 0.9411765, 1,
-0.02305801, -1.266086, -3.184786, 0, 1, 0.945098, 1,
-0.01802221, 0.06500762, -0.0085131, 0, 1, 0.9529412, 1,
-0.01687921, 1.287231, -2.108313, 0, 1, 0.9568627, 1,
-0.008206794, 0.1240441, 0.02802586, 0, 1, 0.9647059, 1,
-0.006464231, -1.258076, -3.680641, 0, 1, 0.9686275, 1,
-0.005991449, -1.326527, -4.229824, 0, 1, 0.9764706, 1,
-0.001682739, -0.3029273, -3.100561, 0, 1, 0.9803922, 1,
-0.0005105219, -0.6356342, -1.518801, 0, 1, 0.9882353, 1,
0.002300761, 2.13931, -1.326341, 0, 1, 0.9921569, 1,
0.005989124, -1.163164, 2.248022, 0, 1, 1, 1,
0.006855992, 0.5552446, 0.06746233, 0, 0.9921569, 1, 1,
0.007111971, -0.8382711, 4.371816, 0, 0.9882353, 1, 1,
0.007483194, 0.1893117, 0.7563457, 0, 0.9803922, 1, 1,
0.01146826, 0.7623526, -0.8507035, 0, 0.9764706, 1, 1,
0.0116055, -2.032942, 3.298385, 0, 0.9686275, 1, 1,
0.01663013, 0.01279272, 0.8879327, 0, 0.9647059, 1, 1,
0.01917076, -1.261522, 2.191948, 0, 0.9568627, 1, 1,
0.02324379, 0.7807044, -0.2809334, 0, 0.9529412, 1, 1,
0.02512622, -0.1749966, 4.091644, 0, 0.945098, 1, 1,
0.0297698, 0.5830315, 1.624992, 0, 0.9411765, 1, 1,
0.03491284, -0.1397203, 3.092476, 0, 0.9333333, 1, 1,
0.03589845, -1.409263, 4.380866, 0, 0.9294118, 1, 1,
0.03704002, -0.3697785, 3.794599, 0, 0.9215686, 1, 1,
0.03710929, -2.152506, 4.432092, 0, 0.9176471, 1, 1,
0.04031456, -0.2666152, 1.62799, 0, 0.9098039, 1, 1,
0.04089732, 0.500358, -0.7776967, 0, 0.9058824, 1, 1,
0.04146995, -1.235588, 2.867192, 0, 0.8980392, 1, 1,
0.04154712, 1.003529, 1.360183, 0, 0.8901961, 1, 1,
0.04225252, 1.188045, 0.9786961, 0, 0.8862745, 1, 1,
0.04338168, -1.305056, 2.560826, 0, 0.8784314, 1, 1,
0.04354862, 0.8875946, -0.5179411, 0, 0.8745098, 1, 1,
0.04908422, 0.05540181, 1.229282, 0, 0.8666667, 1, 1,
0.04935021, 1.174535, -0.5637378, 0, 0.8627451, 1, 1,
0.05032474, 0.9085527, -0.1883716, 0, 0.854902, 1, 1,
0.05115005, -0.5636148, 2.457899, 0, 0.8509804, 1, 1,
0.0514048, 0.3907689, 0.1038341, 0, 0.8431373, 1, 1,
0.05397234, 0.1992777, 0.5378317, 0, 0.8392157, 1, 1,
0.0557579, -0.5188915, 3.623059, 0, 0.8313726, 1, 1,
0.06092519, -1.022063, 1.559809, 0, 0.827451, 1, 1,
0.06317089, 0.7287015, -0.9079046, 0, 0.8196079, 1, 1,
0.07273999, 0.9015349, 0.0589467, 0, 0.8156863, 1, 1,
0.07678305, 1.026703, 0.6328968, 0, 0.8078431, 1, 1,
0.08180156, -0.1550266, 3.332044, 0, 0.8039216, 1, 1,
0.08186065, 0.7182601, 0.6371094, 0, 0.7960784, 1, 1,
0.08797488, 1.465379, 1.163394, 0, 0.7882353, 1, 1,
0.0881329, -1.690928, 5.099097, 0, 0.7843137, 1, 1,
0.08945259, -0.8689596, 5.068249, 0, 0.7764706, 1, 1,
0.09088981, 0.1910956, 1.03897, 0, 0.772549, 1, 1,
0.09986514, -0.1525854, 3.219071, 0, 0.7647059, 1, 1,
0.1046589, 1.112864, 0.8354767, 0, 0.7607843, 1, 1,
0.1077739, 0.4929061, 0.5683312, 0, 0.7529412, 1, 1,
0.1087234, -0.01270375, 0.9776418, 0, 0.7490196, 1, 1,
0.1113401, 0.2252361, -0.004513962, 0, 0.7411765, 1, 1,
0.1139787, 0.7330648, 1.49342, 0, 0.7372549, 1, 1,
0.1161119, 0.6187926, -1.725067, 0, 0.7294118, 1, 1,
0.1164251, 0.6246069, 1.131537, 0, 0.7254902, 1, 1,
0.1214377, 0.3897338, 0.5194684, 0, 0.7176471, 1, 1,
0.1238806, -0.1873848, 1.172269, 0, 0.7137255, 1, 1,
0.136462, 1.494671, 1.459856, 0, 0.7058824, 1, 1,
0.1371701, -0.6842613, 3.293038, 0, 0.6980392, 1, 1,
0.1388275, 1.711342, -1.209375, 0, 0.6941177, 1, 1,
0.1398654, 0.2045837, 0.6358321, 0, 0.6862745, 1, 1,
0.1426386, -1.002785, 4.107963, 0, 0.682353, 1, 1,
0.1431145, -0.112947, 3.765449, 0, 0.6745098, 1, 1,
0.1525904, 1.118933, -0.3836581, 0, 0.6705883, 1, 1,
0.1528008, -0.3742739, 1.85354, 0, 0.6627451, 1, 1,
0.1573003, -1.746367, 2.760798, 0, 0.6588235, 1, 1,
0.1584448, 0.3561184, 0.285574, 0, 0.6509804, 1, 1,
0.1668878, 0.628746, 0.2822434, 0, 0.6470588, 1, 1,
0.1671981, -0.3689017, 2.264478, 0, 0.6392157, 1, 1,
0.1672106, 0.3149509, 1.173219, 0, 0.6352941, 1, 1,
0.1676048, 1.492051, -0.2471148, 0, 0.627451, 1, 1,
0.1700859, 1.661373, 0.601424, 0, 0.6235294, 1, 1,
0.1712274, 0.8142339, -0.2406258, 0, 0.6156863, 1, 1,
0.1729032, 1.306037, 0.09573116, 0, 0.6117647, 1, 1,
0.1805177, -0.2082325, 3.320412, 0, 0.6039216, 1, 1,
0.1810195, 0.6291289, -0.08909088, 0, 0.5960785, 1, 1,
0.1821185, 0.6393973, 0.6766501, 0, 0.5921569, 1, 1,
0.1829035, 1.447809, 0.7525734, 0, 0.5843138, 1, 1,
0.1895335, 1.086452, -0.9726375, 0, 0.5803922, 1, 1,
0.1923305, 0.2857294, 0.5828614, 0, 0.572549, 1, 1,
0.1978146, -0.2359251, 4.021161, 0, 0.5686275, 1, 1,
0.1999064, 1.726959, 1.492242, 0, 0.5607843, 1, 1,
0.2034681, 0.8981087, -0.9623738, 0, 0.5568628, 1, 1,
0.2073838, -1.395587, 0.5840859, 0, 0.5490196, 1, 1,
0.2096062, -1.274775, 2.981339, 0, 0.5450981, 1, 1,
0.2105519, -1.025552, 2.178212, 0, 0.5372549, 1, 1,
0.2109524, 0.6956047, 1.265889, 0, 0.5333334, 1, 1,
0.217739, -0.2012746, 0.8524946, 0, 0.5254902, 1, 1,
0.2180415, -0.08775518, 0.4392188, 0, 0.5215687, 1, 1,
0.2190979, 0.8007426, -0.4070216, 0, 0.5137255, 1, 1,
0.2245683, 1.005655, -0.9321828, 0, 0.509804, 1, 1,
0.2296475, -0.0784628, 1.581566, 0, 0.5019608, 1, 1,
0.232815, 0.7400015, 0.1456235, 0, 0.4941176, 1, 1,
0.2376601, -1.466967, 2.297389, 0, 0.4901961, 1, 1,
0.2418626, 1.129426, -0.4387912, 0, 0.4823529, 1, 1,
0.242031, -0.8255957, 1.558178, 0, 0.4784314, 1, 1,
0.2429972, 0.1297314, 0.937238, 0, 0.4705882, 1, 1,
0.2502095, 0.01603463, 1.477028, 0, 0.4666667, 1, 1,
0.2526609, -0.09112342, 1.884345, 0, 0.4588235, 1, 1,
0.2562735, 0.712913, 1.465805, 0, 0.454902, 1, 1,
0.2584401, -0.1763406, 2.491011, 0, 0.4470588, 1, 1,
0.2634017, -0.0537779, -0.06102986, 0, 0.4431373, 1, 1,
0.2650445, 1.107443, 0.4955985, 0, 0.4352941, 1, 1,
0.2671529, -0.7491066, 4.021826, 0, 0.4313726, 1, 1,
0.2672678, 0.2235328, 1.565317, 0, 0.4235294, 1, 1,
0.2701603, 1.365688, 0.4514637, 0, 0.4196078, 1, 1,
0.2703565, 1.130057, 0.9754392, 0, 0.4117647, 1, 1,
0.2724105, 0.3060343, -0.07474007, 0, 0.4078431, 1, 1,
0.2730054, -0.8427223, 4.012795, 0, 0.4, 1, 1,
0.2733623, 0.7504018, 0.940551, 0, 0.3921569, 1, 1,
0.2767636, -0.2863811, 0.8367134, 0, 0.3882353, 1, 1,
0.2783368, -0.7315695, 5.777711, 0, 0.3803922, 1, 1,
0.2789037, -0.559938, 2.179904, 0, 0.3764706, 1, 1,
0.2820601, -0.3157582, 2.705156, 0, 0.3686275, 1, 1,
0.2836699, 0.3950217, 0.01110323, 0, 0.3647059, 1, 1,
0.2875371, -0.9811617, 2.380251, 0, 0.3568628, 1, 1,
0.2926957, -1.503668, 3.515872, 0, 0.3529412, 1, 1,
0.2967732, -0.1098737, 2.178268, 0, 0.345098, 1, 1,
0.2971215, 0.2024281, 0.416492, 0, 0.3411765, 1, 1,
0.3036215, 0.5343855, -0.6564205, 0, 0.3333333, 1, 1,
0.3054894, 0.8745955, -0.7465597, 0, 0.3294118, 1, 1,
0.3061323, 0.9423422, 1.154396, 0, 0.3215686, 1, 1,
0.3084793, 0.8556998, -0.4007184, 0, 0.3176471, 1, 1,
0.3094394, -1.287921, 3.155425, 0, 0.3098039, 1, 1,
0.3126795, 0.6254557, 0.1932323, 0, 0.3058824, 1, 1,
0.3178514, -1.398088, 3.983282, 0, 0.2980392, 1, 1,
0.3179984, -0.8188227, 2.330421, 0, 0.2901961, 1, 1,
0.3192372, -0.4146596, 3.228274, 0, 0.2862745, 1, 1,
0.3216238, -0.8995693, 2.606383, 0, 0.2784314, 1, 1,
0.3217091, 0.215116, 0.1099383, 0, 0.2745098, 1, 1,
0.3241196, 0.6908242, 1.161983, 0, 0.2666667, 1, 1,
0.3316775, 0.2683911, 1.789279, 0, 0.2627451, 1, 1,
0.3338713, -1.128979, 3.450418, 0, 0.254902, 1, 1,
0.3341995, -2.111457, 3.79204, 0, 0.2509804, 1, 1,
0.3344463, 0.0563304, 1.403679, 0, 0.2431373, 1, 1,
0.3352936, 0.3365983, 0.1860876, 0, 0.2392157, 1, 1,
0.3390729, 0.754975, 0.1130027, 0, 0.2313726, 1, 1,
0.339924, 0.3690166, 0.3048854, 0, 0.227451, 1, 1,
0.3415034, -2.922963, 2.589872, 0, 0.2196078, 1, 1,
0.3444272, 1.745468, -1.224841, 0, 0.2156863, 1, 1,
0.3459195, -0.09049732, 1.530763, 0, 0.2078431, 1, 1,
0.3474548, 0.7764086, 1.190023, 0, 0.2039216, 1, 1,
0.3480635, -0.04565258, 0.4313397, 0, 0.1960784, 1, 1,
0.3483732, -0.4338709, 1.213875, 0, 0.1882353, 1, 1,
0.3486124, 0.5699522, 0.2553151, 0, 0.1843137, 1, 1,
0.3492514, 0.8164029, -1.345166, 0, 0.1764706, 1, 1,
0.3535482, -0.7062958, 3.096657, 0, 0.172549, 1, 1,
0.3552927, 1.155663, 1.055327, 0, 0.1647059, 1, 1,
0.3554564, -0.7486965, 3.070966, 0, 0.1607843, 1, 1,
0.3604316, -1.147724, 2.491052, 0, 0.1529412, 1, 1,
0.3631393, -0.06196867, 0.4423344, 0, 0.1490196, 1, 1,
0.3638549, 0.8419168, 1.081335, 0, 0.1411765, 1, 1,
0.3639074, -1.227049, 3.068028, 0, 0.1372549, 1, 1,
0.3678249, -0.2894084, 1.367315, 0, 0.1294118, 1, 1,
0.3686541, -0.04608428, 1.200257, 0, 0.1254902, 1, 1,
0.374114, 0.04549504, 2.292538, 0, 0.1176471, 1, 1,
0.3763056, -0.5338944, 1.901407, 0, 0.1137255, 1, 1,
0.3804013, -1.897813, 3.870409, 0, 0.1058824, 1, 1,
0.3852536, 0.2299779, 1.52273, 0, 0.09803922, 1, 1,
0.3865891, -0.03103271, 1.901093, 0, 0.09411765, 1, 1,
0.3900281, -1.26733, 2.513798, 0, 0.08627451, 1, 1,
0.3941289, 0.6940295, -0.09868492, 0, 0.08235294, 1, 1,
0.4016266, -1.210549, 2.45449, 0, 0.07450981, 1, 1,
0.4020287, 0.4151765, 1.135114, 0, 0.07058824, 1, 1,
0.4049336, 0.7777095, 0.1837283, 0, 0.0627451, 1, 1,
0.4097939, -0.5162146, 1.559929, 0, 0.05882353, 1, 1,
0.4128478, 0.4851216, 0.1237247, 0, 0.05098039, 1, 1,
0.4135962, -0.5949165, 1.220403, 0, 0.04705882, 1, 1,
0.4174519, -1.814263, 3.733116, 0, 0.03921569, 1, 1,
0.4262642, 0.7115458, 0.7778206, 0, 0.03529412, 1, 1,
0.4268229, -0.3865437, 2.537954, 0, 0.02745098, 1, 1,
0.4287249, 0.1749126, 1.418011, 0, 0.02352941, 1, 1,
0.4300907, 3.531361, 2.597811, 0, 0.01568628, 1, 1,
0.4305283, -0.3581521, 4.179018, 0, 0.01176471, 1, 1,
0.4316899, -1.014646, 2.581792, 0, 0.003921569, 1, 1,
0.4325284, 1.582059, -0.4891739, 0.003921569, 0, 1, 1,
0.4370333, 0.05878501, 1.517056, 0.007843138, 0, 1, 1,
0.4370716, 0.4399211, 0.503271, 0.01568628, 0, 1, 1,
0.4374481, 2.012367, -2.27098, 0.01960784, 0, 1, 1,
0.4408306, 1.121319, 2.235165, 0.02745098, 0, 1, 1,
0.4447477, -0.6426118, 4.21264, 0.03137255, 0, 1, 1,
0.4494534, -0.5352284, 2.407537, 0.03921569, 0, 1, 1,
0.4513025, 0.1951181, 1.64903, 0.04313726, 0, 1, 1,
0.4535288, -0.9889696, 3.02409, 0.05098039, 0, 1, 1,
0.4566847, 0.9429672, -1.191049, 0.05490196, 0, 1, 1,
0.4576269, 1.231175, -0.2586071, 0.0627451, 0, 1, 1,
0.4588189, 0.1088898, 0.7187949, 0.06666667, 0, 1, 1,
0.4590915, 0.5440541, 0.7112255, 0.07450981, 0, 1, 1,
0.4593256, -1.405867, 4.094389, 0.07843138, 0, 1, 1,
0.4597471, 0.6402657, 0.1987496, 0.08627451, 0, 1, 1,
0.4631742, -1.657144, 3.018703, 0.09019608, 0, 1, 1,
0.4692962, 0.2781827, 2.235997, 0.09803922, 0, 1, 1,
0.4706268, -1.755995, 2.078779, 0.1058824, 0, 1, 1,
0.471982, -0.8814452, 4.21723, 0.1098039, 0, 1, 1,
0.4762485, 0.8452533, 0.8385885, 0.1176471, 0, 1, 1,
0.4794255, 0.3646054, 1.292387, 0.1215686, 0, 1, 1,
0.4812097, -0.1069756, 1.439071, 0.1294118, 0, 1, 1,
0.4832258, -0.1393923, 2.786878, 0.1333333, 0, 1, 1,
0.4850309, -0.256956, 1.335656, 0.1411765, 0, 1, 1,
0.4865838, -0.03402818, 1.159687, 0.145098, 0, 1, 1,
0.4897917, 2.17663, -0.844032, 0.1529412, 0, 1, 1,
0.4923928, 0.3386641, 1.354771, 0.1568628, 0, 1, 1,
0.493148, 1.230909, -2.047735, 0.1647059, 0, 1, 1,
0.4948896, -0.2920192, 3.489907, 0.1686275, 0, 1, 1,
0.4964691, -1.758204, 1.594398, 0.1764706, 0, 1, 1,
0.4969455, 1.393461, -0.2188301, 0.1803922, 0, 1, 1,
0.5013916, -0.3127374, 2.13406, 0.1882353, 0, 1, 1,
0.5031118, -1.189622, 2.44192, 0.1921569, 0, 1, 1,
0.5246338, 1.637012, 0.7915214, 0.2, 0, 1, 1,
0.5287641, -1.286653, 2.795073, 0.2078431, 0, 1, 1,
0.5307693, 2.073259, 1.246249, 0.2117647, 0, 1, 1,
0.5340017, -0.101871, 1.240824, 0.2196078, 0, 1, 1,
0.5353721, 1.138303, 0.3309955, 0.2235294, 0, 1, 1,
0.5359659, -0.1974072, 3.100614, 0.2313726, 0, 1, 1,
0.5378027, 0.7824086, 3.021176, 0.2352941, 0, 1, 1,
0.5384352, -0.9809207, 1.711982, 0.2431373, 0, 1, 1,
0.5468158, -0.6162816, 1.436612, 0.2470588, 0, 1, 1,
0.5480093, 0.152619, 2.342771, 0.254902, 0, 1, 1,
0.5500832, -1.215547, 3.670604, 0.2588235, 0, 1, 1,
0.5502136, 0.3943995, 0.8315902, 0.2666667, 0, 1, 1,
0.5526774, 1.389529, -1.163329, 0.2705882, 0, 1, 1,
0.552981, 0.06446158, 2.459828, 0.2784314, 0, 1, 1,
0.5557037, -1.076413, 2.177059, 0.282353, 0, 1, 1,
0.5684381, -0.01675911, 2.80927, 0.2901961, 0, 1, 1,
0.5740878, 1.427773, -0.02225494, 0.2941177, 0, 1, 1,
0.5779788, 0.9386987, 1.066811, 0.3019608, 0, 1, 1,
0.5808051, 0.5247344, -0.1554707, 0.3098039, 0, 1, 1,
0.5918266, -1.359741, 5.231512, 0.3137255, 0, 1, 1,
0.5937914, 0.3595221, 0.6704955, 0.3215686, 0, 1, 1,
0.5973132, -1.339903, 1.831328, 0.3254902, 0, 1, 1,
0.5981252, 0.2255352, 3.23373, 0.3333333, 0, 1, 1,
0.6061918, -0.6883591, 2.047705, 0.3372549, 0, 1, 1,
0.6071782, -0.0341717, 1.256637, 0.345098, 0, 1, 1,
0.6072352, -0.09247842, 0.5898215, 0.3490196, 0, 1, 1,
0.6081215, 0.5691754, 0.6637956, 0.3568628, 0, 1, 1,
0.6091334, -0.9085006, 3.522012, 0.3607843, 0, 1, 1,
0.6129513, -0.4038567, 1.318064, 0.3686275, 0, 1, 1,
0.6174211, 2.595097, 0.5828081, 0.372549, 0, 1, 1,
0.6178961, -0.7618771, 2.958097, 0.3803922, 0, 1, 1,
0.6243783, -0.07231954, 2.556601, 0.3843137, 0, 1, 1,
0.6249056, 0.7774572, 2.75532, 0.3921569, 0, 1, 1,
0.6292102, 0.26903, 1.422651, 0.3960784, 0, 1, 1,
0.6303433, 1.027039, 0.4538399, 0.4039216, 0, 1, 1,
0.6346456, 0.3217266, 1.23534, 0.4117647, 0, 1, 1,
0.6354632, 0.5446692, 1.864191, 0.4156863, 0, 1, 1,
0.6418409, -1.449096, 2.934261, 0.4235294, 0, 1, 1,
0.6453015, -1.543553, 1.563119, 0.427451, 0, 1, 1,
0.6467268, 2.441861, 1.314202, 0.4352941, 0, 1, 1,
0.6476252, -0.1209478, 3.124202, 0.4392157, 0, 1, 1,
0.6504241, -0.2173276, 2.450553, 0.4470588, 0, 1, 1,
0.6518607, -1.958429, 1.878925, 0.4509804, 0, 1, 1,
0.6519956, -0.00255499, 1.556445, 0.4588235, 0, 1, 1,
0.6548406, 0.5953217, 4.440683, 0.4627451, 0, 1, 1,
0.6573605, 1.00029, 1.337319, 0.4705882, 0, 1, 1,
0.6575282, 1.456958, -1.399588, 0.4745098, 0, 1, 1,
0.6621404, -0.07779732, 2.674764, 0.4823529, 0, 1, 1,
0.6694918, -0.2128817, 3.590189, 0.4862745, 0, 1, 1,
0.6696395, -0.1048441, 0.298589, 0.4941176, 0, 1, 1,
0.6764756, 1.553542, -1.714855, 0.5019608, 0, 1, 1,
0.6942075, 1.826913, 1.001934, 0.5058824, 0, 1, 1,
0.6948823, -0.4105137, 0.6010064, 0.5137255, 0, 1, 1,
0.6982306, -1.344082, 3.696156, 0.5176471, 0, 1, 1,
0.698487, 0.4555867, -0.2526879, 0.5254902, 0, 1, 1,
0.7009228, -0.3848664, 1.472012, 0.5294118, 0, 1, 1,
0.7087705, -0.9769031, 1.914416, 0.5372549, 0, 1, 1,
0.7102877, -0.2316162, 2.024086, 0.5411765, 0, 1, 1,
0.7104747, 1.006529, -0.8921214, 0.5490196, 0, 1, 1,
0.7116946, -0.02361748, 0.4436284, 0.5529412, 0, 1, 1,
0.7133343, -0.3474006, 3.390671, 0.5607843, 0, 1, 1,
0.7134511, -2.787817, 2.666172, 0.5647059, 0, 1, 1,
0.7156247, -1.558947, 2.439414, 0.572549, 0, 1, 1,
0.7157162, -1.191857, 1.513534, 0.5764706, 0, 1, 1,
0.7201161, -0.1735703, 0.6178086, 0.5843138, 0, 1, 1,
0.7209851, 2.323768, 0.9925222, 0.5882353, 0, 1, 1,
0.7220085, -0.4732224, 1.185231, 0.5960785, 0, 1, 1,
0.7259005, 0.9405214, 0.6792585, 0.6039216, 0, 1, 1,
0.7276558, -1.463139, 2.47158, 0.6078432, 0, 1, 1,
0.7276672, -0.5657582, 1.855027, 0.6156863, 0, 1, 1,
0.7332529, 1.023746, 1.261588, 0.6196079, 0, 1, 1,
0.7339622, 0.009061584, 1.347619, 0.627451, 0, 1, 1,
0.7352566, 0.8485866, 0.08659002, 0.6313726, 0, 1, 1,
0.736033, -2.182476, 3.911839, 0.6392157, 0, 1, 1,
0.7409068, 0.2403614, 0.3698304, 0.6431373, 0, 1, 1,
0.7454744, 0.190978, 0.8558074, 0.6509804, 0, 1, 1,
0.7494977, -1.324664, 2.146136, 0.654902, 0, 1, 1,
0.7513965, 0.04449745, 1.934573, 0.6627451, 0, 1, 1,
0.7531929, -1.990717, 1.710033, 0.6666667, 0, 1, 1,
0.757785, -0.8969368, 1.204219, 0.6745098, 0, 1, 1,
0.761883, 2.581359, 0.7642908, 0.6784314, 0, 1, 1,
0.7622702, -0.3726463, 2.663736, 0.6862745, 0, 1, 1,
0.7640967, -0.5832298, 2.739526, 0.6901961, 0, 1, 1,
0.7655367, 0.2580401, 1.016111, 0.6980392, 0, 1, 1,
0.7685269, -0.2773952, 0.8966637, 0.7058824, 0, 1, 1,
0.7737399, -0.9092916, 4.164815, 0.7098039, 0, 1, 1,
0.7743452, 0.4976539, 1.227075, 0.7176471, 0, 1, 1,
0.7825266, 1.863384, -0.821191, 0.7215686, 0, 1, 1,
0.8035756, -1.337013, 2.655819, 0.7294118, 0, 1, 1,
0.807564, -1.27269, 2.291401, 0.7333333, 0, 1, 1,
0.8183016, -0.3927707, 1.860519, 0.7411765, 0, 1, 1,
0.8206246, 0.9335253, 1.410524, 0.7450981, 0, 1, 1,
0.8243034, -0.937761, 1.735863, 0.7529412, 0, 1, 1,
0.8249902, -0.2443746, 1.425356, 0.7568628, 0, 1, 1,
0.8273361, -0.3239402, 1.380731, 0.7647059, 0, 1, 1,
0.8290548, 0.267324, 2.136452, 0.7686275, 0, 1, 1,
0.829436, 0.4055292, 1.27395, 0.7764706, 0, 1, 1,
0.8315407, -1.123551, 3.588323, 0.7803922, 0, 1, 1,
0.833737, -1.969779, 3.286524, 0.7882353, 0, 1, 1,
0.8369197, 1.853157, 2.305436, 0.7921569, 0, 1, 1,
0.8390743, 0.2868694, 1.861838, 0.8, 0, 1, 1,
0.8437625, -1.915016, 3.40441, 0.8078431, 0, 1, 1,
0.8444281, 0.01018665, 0.952536, 0.8117647, 0, 1, 1,
0.845704, 1.361608, 1.972115, 0.8196079, 0, 1, 1,
0.8510009, 0.006663243, 0.3118103, 0.8235294, 0, 1, 1,
0.8532252, -1.723763, 0.7548233, 0.8313726, 0, 1, 1,
0.8536819, 0.3614575, 2.071343, 0.8352941, 0, 1, 1,
0.8601973, -1.034629, 1.826439, 0.8431373, 0, 1, 1,
0.8604714, -1.250218, 2.90052, 0.8470588, 0, 1, 1,
0.8622971, -1.242568, 4.123271, 0.854902, 0, 1, 1,
0.8645676, 1.451318, 1.045664, 0.8588235, 0, 1, 1,
0.8656973, 0.2587965, 1.673999, 0.8666667, 0, 1, 1,
0.8680526, 0.5278, -1.039863, 0.8705882, 0, 1, 1,
0.8693972, -0.964384, 2.861027, 0.8784314, 0, 1, 1,
0.8834271, -0.3189719, 1.748931, 0.8823529, 0, 1, 1,
0.8867536, -1.217547, 1.754683, 0.8901961, 0, 1, 1,
0.8875346, 1.891567, 0.4723238, 0.8941177, 0, 1, 1,
0.8928619, -1.522275, 2.465922, 0.9019608, 0, 1, 1,
0.8978108, 1.227998, 0.5812683, 0.9098039, 0, 1, 1,
0.9002042, -0.793285, 2.234312, 0.9137255, 0, 1, 1,
0.9060863, 0.6730938, 1.878861, 0.9215686, 0, 1, 1,
0.9187533, 0.8488507, 0.5672809, 0.9254902, 0, 1, 1,
0.9248984, 2.279763, -1.327711, 0.9333333, 0, 1, 1,
0.9249424, -0.4764827, 1.814044, 0.9372549, 0, 1, 1,
0.931327, 0.7273794, 1.913135, 0.945098, 0, 1, 1,
0.9334281, 0.5608293, 0.0578255, 0.9490196, 0, 1, 1,
0.9455208, -1.307125, 0.3248808, 0.9568627, 0, 1, 1,
0.9520757, -0.9296215, 2.924176, 0.9607843, 0, 1, 1,
0.9527227, -0.4161541, 2.439238, 0.9686275, 0, 1, 1,
0.9590972, 0.4597769, -0.09224436, 0.972549, 0, 1, 1,
0.9604995, -0.7974904, 2.193947, 0.9803922, 0, 1, 1,
0.9612162, 0.2426297, 1.060927, 0.9843137, 0, 1, 1,
0.965861, -1.109124, 0.8075199, 0.9921569, 0, 1, 1,
0.9706349, -0.07000792, 1.561455, 0.9960784, 0, 1, 1,
0.9769835, -0.9905941, 1.944066, 1, 0, 0.9960784, 1,
0.977196, 0.2636618, 2.722775, 1, 0, 0.9882353, 1,
0.978908, 0.7003121, 2.861721, 1, 0, 0.9843137, 1,
0.9820709, -0.3250702, 2.856761, 1, 0, 0.9764706, 1,
0.9865608, 0.2178571, 1.738746, 1, 0, 0.972549, 1,
0.9881358, 0.523997, 1.441128, 1, 0, 0.9647059, 1,
0.9885706, -0.4694939, 1.241394, 1, 0, 0.9607843, 1,
0.9972579, -1.2175, 1.899107, 1, 0, 0.9529412, 1,
0.9989397, -0.7788911, 2.819649, 1, 0, 0.9490196, 1,
1.003353, 1.256609, -0.6961228, 1, 0, 0.9411765, 1,
1.003657, -0.1381379, 3.157776, 1, 0, 0.9372549, 1,
1.0104, 0.2753511, 1.407051, 1, 0, 0.9294118, 1,
1.039267, -0.03678932, 2.285015, 1, 0, 0.9254902, 1,
1.042725, -0.2133158, 2.51287, 1, 0, 0.9176471, 1,
1.043846, -1.311626, 2.735152, 1, 0, 0.9137255, 1,
1.04705, 0.3525416, -0.8739947, 1, 0, 0.9058824, 1,
1.047755, 2.509783, -1.207953, 1, 0, 0.9019608, 1,
1.047893, -0.124753, 1.404205, 1, 0, 0.8941177, 1,
1.054132, -1.047666, 2.39585, 1, 0, 0.8862745, 1,
1.054636, 0.2655533, -0.6078544, 1, 0, 0.8823529, 1,
1.057748, -1.899687, 3.436245, 1, 0, 0.8745098, 1,
1.060263, -2.317582, 5.066108, 1, 0, 0.8705882, 1,
1.075365, 0.8732373, 1.245913, 1, 0, 0.8627451, 1,
1.075861, -0.01923252, 0.9111727, 1, 0, 0.8588235, 1,
1.078482, 0.1197402, -0.1131797, 1, 0, 0.8509804, 1,
1.083287, 0.9040408, 1.757654, 1, 0, 0.8470588, 1,
1.090247, -0.7078907, 2.562588, 1, 0, 0.8392157, 1,
1.096206, -1.385689, 1.279486, 1, 0, 0.8352941, 1,
1.100497, -0.579289, 0.4405484, 1, 0, 0.827451, 1,
1.103819, 0.7184075, 1.126209, 1, 0, 0.8235294, 1,
1.108583, -1.047327, 3.55677, 1, 0, 0.8156863, 1,
1.112447, 1.153786, -0.8503977, 1, 0, 0.8117647, 1,
1.118399, 0.6705019, 2.132085, 1, 0, 0.8039216, 1,
1.127944, -1.027964, 0.8484993, 1, 0, 0.7960784, 1,
1.128837, 0.7270138, 0.9326461, 1, 0, 0.7921569, 1,
1.137125, -0.5221378, 4.178192, 1, 0, 0.7843137, 1,
1.139779, 0.6892403, 0.1600326, 1, 0, 0.7803922, 1,
1.147838, 0.04225155, 0.2188251, 1, 0, 0.772549, 1,
1.156184, 0.5470359, -0.5041127, 1, 0, 0.7686275, 1,
1.156511, -0.8022275, 2.468598, 1, 0, 0.7607843, 1,
1.158242, 0.4922552, 0.568186, 1, 0, 0.7568628, 1,
1.158315, 2.326299, 0.9382943, 1, 0, 0.7490196, 1,
1.158339, -0.6869118, 1.077726, 1, 0, 0.7450981, 1,
1.161634, -1.244044, 2.715799, 1, 0, 0.7372549, 1,
1.161896, 0.7142006, 1.046292, 1, 0, 0.7333333, 1,
1.16399, -1.486257, 2.54928, 1, 0, 0.7254902, 1,
1.16936, -0.06943937, 1.09587, 1, 0, 0.7215686, 1,
1.173526, 1.112199, 0.7870006, 1, 0, 0.7137255, 1,
1.17946, -1.24277, 1.593296, 1, 0, 0.7098039, 1,
1.181578, -0.9539587, 2.383761, 1, 0, 0.7019608, 1,
1.188386, -1.287275, 2.936083, 1, 0, 0.6941177, 1,
1.195543, 1.220018, 2.528022, 1, 0, 0.6901961, 1,
1.210056, 1.370137, 1.790103, 1, 0, 0.682353, 1,
1.213521, -0.5556458, 3.335056, 1, 0, 0.6784314, 1,
1.224489, 0.1820892, -0.3623869, 1, 0, 0.6705883, 1,
1.227858, 1.37717, 0.165548, 1, 0, 0.6666667, 1,
1.229019, 0.03909068, 3.123613, 1, 0, 0.6588235, 1,
1.232921, 1.563252, 0.4805672, 1, 0, 0.654902, 1,
1.235456, -0.1434618, 0.7074136, 1, 0, 0.6470588, 1,
1.245504, -0.3167033, 2.812764, 1, 0, 0.6431373, 1,
1.247801, 0.08168691, 2.813458, 1, 0, 0.6352941, 1,
1.250396, 0.3990484, 1.63564, 1, 0, 0.6313726, 1,
1.251048, 1.515366, 0.4985043, 1, 0, 0.6235294, 1,
1.252044, 2.491943, -0.07099099, 1, 0, 0.6196079, 1,
1.252772, -1.172746, 3.032223, 1, 0, 0.6117647, 1,
1.256583, -1.235127, 2.589517, 1, 0, 0.6078432, 1,
1.257583, 1.439202, -1.067983, 1, 0, 0.6, 1,
1.260955, 0.415491, 1.781995, 1, 0, 0.5921569, 1,
1.268632, -0.9868791, 3.673237, 1, 0, 0.5882353, 1,
1.275262, -1.00607, -0.3569031, 1, 0, 0.5803922, 1,
1.27707, 0.4183795, 2.244583, 1, 0, 0.5764706, 1,
1.287081, 0.07170482, 1.463218, 1, 0, 0.5686275, 1,
1.294009, 1.266556, 0.7058222, 1, 0, 0.5647059, 1,
1.297285, 0.07271011, 2.587177, 1, 0, 0.5568628, 1,
1.298583, -0.199653, -0.5460009, 1, 0, 0.5529412, 1,
1.302151, 0.2550018, 1.506687, 1, 0, 0.5450981, 1,
1.308154, 1.001403, 1.267841, 1, 0, 0.5411765, 1,
1.319241, 0.2962511, 0.7247032, 1, 0, 0.5333334, 1,
1.326976, -2.159867, 1.409799, 1, 0, 0.5294118, 1,
1.32914, 0.8668256, 0.2449476, 1, 0, 0.5215687, 1,
1.33276, -0.5807478, 1.220692, 1, 0, 0.5176471, 1,
1.341049, 0.7021919, 1.502673, 1, 0, 0.509804, 1,
1.343776, 1.105116, 1.132747, 1, 0, 0.5058824, 1,
1.344838, 0.4640642, 0.7364896, 1, 0, 0.4980392, 1,
1.350105, -0.7378269, 1.368838, 1, 0, 0.4901961, 1,
1.355495, -0.5283926, 2.312987, 1, 0, 0.4862745, 1,
1.364164, -0.3732254, 2.892339, 1, 0, 0.4784314, 1,
1.367965, -0.6896678, 2.339017, 1, 0, 0.4745098, 1,
1.368739, 1.741082, 1.379539, 1, 0, 0.4666667, 1,
1.370588, 0.8491754, 1.441982, 1, 0, 0.4627451, 1,
1.372612, 0.5913187, 1.036755, 1, 0, 0.454902, 1,
1.373937, 1.698312, -0.2193122, 1, 0, 0.4509804, 1,
1.380274, 0.9935629, 1.059364, 1, 0, 0.4431373, 1,
1.389951, 0.1548995, -0.9496756, 1, 0, 0.4392157, 1,
1.401603, -0.2347605, 2.725799, 1, 0, 0.4313726, 1,
1.408758, 0.01275347, 1.4179, 1, 0, 0.427451, 1,
1.426432, 0.9752291, 1.33011, 1, 0, 0.4196078, 1,
1.43895, 0.6468198, 1.048435, 1, 0, 0.4156863, 1,
1.446614, -1.569039, 3.457367, 1, 0, 0.4078431, 1,
1.475742, 1.639364, -1.789258, 1, 0, 0.4039216, 1,
1.47794, 1.731279, 1.651328, 1, 0, 0.3960784, 1,
1.478963, 0.7813915, -0.1344518, 1, 0, 0.3882353, 1,
1.524177, -0.8573385, 3.335207, 1, 0, 0.3843137, 1,
1.525694, -1.077892, 2.945562, 1, 0, 0.3764706, 1,
1.527693, 0.0009836013, 1.762351, 1, 0, 0.372549, 1,
1.533931, -1.294769, 1.717218, 1, 0, 0.3647059, 1,
1.535924, -1.571207, 2.369215, 1, 0, 0.3607843, 1,
1.543093, -0.958501, 0.4192208, 1, 0, 0.3529412, 1,
1.55293, 2.223652, 1.521964, 1, 0, 0.3490196, 1,
1.553182, 0.7256821, 2.687882, 1, 0, 0.3411765, 1,
1.553657, 0.3547353, 1.451551, 1, 0, 0.3372549, 1,
1.56743, 1.900573, 0.4576156, 1, 0, 0.3294118, 1,
1.575348, -0.08435016, 0.6773537, 1, 0, 0.3254902, 1,
1.600123, -0.1918699, 1.754011, 1, 0, 0.3176471, 1,
1.612114, -0.5469946, 2.324906, 1, 0, 0.3137255, 1,
1.617972, -1.105586, 2.812827, 1, 0, 0.3058824, 1,
1.631518, 0.1128398, 1.209881, 1, 0, 0.2980392, 1,
1.637974, -0.8709502, 2.468524, 1, 0, 0.2941177, 1,
1.645113, -0.01730107, 1.565807, 1, 0, 0.2862745, 1,
1.64538, 2.402175, 0.5441428, 1, 0, 0.282353, 1,
1.655541, -0.7938069, 0.9282756, 1, 0, 0.2745098, 1,
1.667254, 0.9627382, 1.168941, 1, 0, 0.2705882, 1,
1.677008, 1.773348, 2.523612, 1, 0, 0.2627451, 1,
1.707116, 1.839191, 1.042774, 1, 0, 0.2588235, 1,
1.716306, 0.2128622, 2.278955, 1, 0, 0.2509804, 1,
1.720195, 2.081663, 0.1416074, 1, 0, 0.2470588, 1,
1.72117, 1.311064, -0.2326307, 1, 0, 0.2392157, 1,
1.732961, 0.5613151, -0.973908, 1, 0, 0.2352941, 1,
1.760784, -0.1129804, 0.3244454, 1, 0, 0.227451, 1,
1.767404, 0.5383241, 0.9212507, 1, 0, 0.2235294, 1,
1.76972, -0.6053645, 0.9234573, 1, 0, 0.2156863, 1,
1.785609, 1.156602, 1.840447, 1, 0, 0.2117647, 1,
1.788929, -0.0506386, 2.271883, 1, 0, 0.2039216, 1,
1.82467, 0.4249863, 3.479491, 1, 0, 0.1960784, 1,
1.849651, -0.007059081, 0.4633861, 1, 0, 0.1921569, 1,
1.857957, 1.644517, 2.055762, 1, 0, 0.1843137, 1,
1.869256, -2.556228, 2.022877, 1, 0, 0.1803922, 1,
1.902491, 1.56364, 1.390357, 1, 0, 0.172549, 1,
1.907705, 0.4772254, 1.151596, 1, 0, 0.1686275, 1,
1.925155, -0.4659225, 0.3259572, 1, 0, 0.1607843, 1,
1.936999, -0.98089, 3.123987, 1, 0, 0.1568628, 1,
1.962826, -0.06530438, 2.040022, 1, 0, 0.1490196, 1,
1.980201, 0.00214394, 1.055557, 1, 0, 0.145098, 1,
1.998561, -0.5359831, 2.612917, 1, 0, 0.1372549, 1,
2.010581, 0.6790429, 1.487561, 1, 0, 0.1333333, 1,
2.039367, 0.2972268, 0.3366752, 1, 0, 0.1254902, 1,
2.042361, 0.004955095, 3.815987, 1, 0, 0.1215686, 1,
2.079505, -1.349975, 2.33003, 1, 0, 0.1137255, 1,
2.185115, 0.5106081, 2.009643, 1, 0, 0.1098039, 1,
2.201404, 0.3186549, 0.03615797, 1, 0, 0.1019608, 1,
2.203681, -1.300121, 2.433336, 1, 0, 0.09411765, 1,
2.471192, 0.455117, 2.193436, 1, 0, 0.09019608, 1,
2.475192, -1.787833, 3.051857, 1, 0, 0.08235294, 1,
2.484788, -1.070035, 2.558119, 1, 0, 0.07843138, 1,
2.493549, -0.8594529, 1.605589, 1, 0, 0.07058824, 1,
2.497548, -1.299127, 2.699888, 1, 0, 0.06666667, 1,
2.551162, -0.1436049, 2.392927, 1, 0, 0.05882353, 1,
2.564629, 0.3332821, 1.677557, 1, 0, 0.05490196, 1,
2.600762, 0.7745522, 1.593918, 1, 0, 0.04705882, 1,
2.670105, 0.1828104, 2.955458, 1, 0, 0.04313726, 1,
2.690815, -1.402315, 3.102945, 1, 0, 0.03529412, 1,
2.743542, 0.8567105, 0.9969778, 1, 0, 0.03137255, 1,
2.7885, -0.5801227, 1.224275, 1, 0, 0.02352941, 1,
2.807795, 0.1275067, 1.193531, 1, 0, 0.01960784, 1,
3.25534, 0.3360934, 2.375246, 1, 0, 0.01176471, 1,
3.338938, 0.4178311, 0.235481, 1, 0, 0.007843138, 1
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
0.2480232, -4.599842, -7.521386, 0, -0.5, 0.5, 0.5,
0.2480232, -4.599842, -7.521386, 1, -0.5, 0.5, 0.5,
0.2480232, -4.599842, -7.521386, 1, 1.5, 0.5, 0.5,
0.2480232, -4.599842, -7.521386, 0, 1.5, 0.5, 0.5
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
-3.890712, 0.05500233, -7.521386, 0, -0.5, 0.5, 0.5,
-3.890712, 0.05500233, -7.521386, 1, -0.5, 0.5, 0.5,
-3.890712, 0.05500233, -7.521386, 1, 1.5, 0.5, 0.5,
-3.890712, 0.05500233, -7.521386, 0, 1.5, 0.5, 0.5
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
-3.890712, -4.599842, 0.09190679, 0, -0.5, 0.5, 0.5,
-3.890712, -4.599842, 0.09190679, 1, -0.5, 0.5, 0.5,
-3.890712, -4.599842, 0.09190679, 1, 1.5, 0.5, 0.5,
-3.890712, -4.599842, 0.09190679, 0, 1.5, 0.5, 0.5
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
-2, -3.525647, -5.764472,
3, -3.525647, -5.764472,
-2, -3.525647, -5.764472,
-2, -3.704679, -6.057291,
-1, -3.525647, -5.764472,
-1, -3.704679, -6.057291,
0, -3.525647, -5.764472,
0, -3.704679, -6.057291,
1, -3.525647, -5.764472,
1, -3.704679, -6.057291,
2, -3.525647, -5.764472,
2, -3.704679, -6.057291,
3, -3.525647, -5.764472,
3, -3.704679, -6.057291
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
-2, -4.062744, -6.642929, 0, -0.5, 0.5, 0.5,
-2, -4.062744, -6.642929, 1, -0.5, 0.5, 0.5,
-2, -4.062744, -6.642929, 1, 1.5, 0.5, 0.5,
-2, -4.062744, -6.642929, 0, 1.5, 0.5, 0.5,
-1, -4.062744, -6.642929, 0, -0.5, 0.5, 0.5,
-1, -4.062744, -6.642929, 1, -0.5, 0.5, 0.5,
-1, -4.062744, -6.642929, 1, 1.5, 0.5, 0.5,
-1, -4.062744, -6.642929, 0, 1.5, 0.5, 0.5,
0, -4.062744, -6.642929, 0, -0.5, 0.5, 0.5,
0, -4.062744, -6.642929, 1, -0.5, 0.5, 0.5,
0, -4.062744, -6.642929, 1, 1.5, 0.5, 0.5,
0, -4.062744, -6.642929, 0, 1.5, 0.5, 0.5,
1, -4.062744, -6.642929, 0, -0.5, 0.5, 0.5,
1, -4.062744, -6.642929, 1, -0.5, 0.5, 0.5,
1, -4.062744, -6.642929, 1, 1.5, 0.5, 0.5,
1, -4.062744, -6.642929, 0, 1.5, 0.5, 0.5,
2, -4.062744, -6.642929, 0, -0.5, 0.5, 0.5,
2, -4.062744, -6.642929, 1, -0.5, 0.5, 0.5,
2, -4.062744, -6.642929, 1, 1.5, 0.5, 0.5,
2, -4.062744, -6.642929, 0, 1.5, 0.5, 0.5,
3, -4.062744, -6.642929, 0, -0.5, 0.5, 0.5,
3, -4.062744, -6.642929, 1, -0.5, 0.5, 0.5,
3, -4.062744, -6.642929, 1, 1.5, 0.5, 0.5,
3, -4.062744, -6.642929, 0, 1.5, 0.5, 0.5
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
-2.935619, -3, -5.764472,
-2.935619, 3, -5.764472,
-2.935619, -3, -5.764472,
-3.094801, -3, -6.057291,
-2.935619, -2, -5.764472,
-3.094801, -2, -6.057291,
-2.935619, -1, -5.764472,
-3.094801, -1, -6.057291,
-2.935619, 0, -5.764472,
-3.094801, 0, -6.057291,
-2.935619, 1, -5.764472,
-3.094801, 1, -6.057291,
-2.935619, 2, -5.764472,
-3.094801, 2, -6.057291,
-2.935619, 3, -5.764472,
-3.094801, 3, -6.057291
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
-3.413165, -3, -6.642929, 0, -0.5, 0.5, 0.5,
-3.413165, -3, -6.642929, 1, -0.5, 0.5, 0.5,
-3.413165, -3, -6.642929, 1, 1.5, 0.5, 0.5,
-3.413165, -3, -6.642929, 0, 1.5, 0.5, 0.5,
-3.413165, -2, -6.642929, 0, -0.5, 0.5, 0.5,
-3.413165, -2, -6.642929, 1, -0.5, 0.5, 0.5,
-3.413165, -2, -6.642929, 1, 1.5, 0.5, 0.5,
-3.413165, -2, -6.642929, 0, 1.5, 0.5, 0.5,
-3.413165, -1, -6.642929, 0, -0.5, 0.5, 0.5,
-3.413165, -1, -6.642929, 1, -0.5, 0.5, 0.5,
-3.413165, -1, -6.642929, 1, 1.5, 0.5, 0.5,
-3.413165, -1, -6.642929, 0, 1.5, 0.5, 0.5,
-3.413165, 0, -6.642929, 0, -0.5, 0.5, 0.5,
-3.413165, 0, -6.642929, 1, -0.5, 0.5, 0.5,
-3.413165, 0, -6.642929, 1, 1.5, 0.5, 0.5,
-3.413165, 0, -6.642929, 0, 1.5, 0.5, 0.5,
-3.413165, 1, -6.642929, 0, -0.5, 0.5, 0.5,
-3.413165, 1, -6.642929, 1, -0.5, 0.5, 0.5,
-3.413165, 1, -6.642929, 1, 1.5, 0.5, 0.5,
-3.413165, 1, -6.642929, 0, 1.5, 0.5, 0.5,
-3.413165, 2, -6.642929, 0, -0.5, 0.5, 0.5,
-3.413165, 2, -6.642929, 1, -0.5, 0.5, 0.5,
-3.413165, 2, -6.642929, 1, 1.5, 0.5, 0.5,
-3.413165, 2, -6.642929, 0, 1.5, 0.5, 0.5,
-3.413165, 3, -6.642929, 0, -0.5, 0.5, 0.5,
-3.413165, 3, -6.642929, 1, -0.5, 0.5, 0.5,
-3.413165, 3, -6.642929, 1, 1.5, 0.5, 0.5,
-3.413165, 3, -6.642929, 0, 1.5, 0.5, 0.5
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
-2.935619, -3.525647, -4,
-2.935619, -3.525647, 4,
-2.935619, -3.525647, -4,
-3.094801, -3.704679, -4,
-2.935619, -3.525647, -2,
-3.094801, -3.704679, -2,
-2.935619, -3.525647, 0,
-3.094801, -3.704679, 0,
-2.935619, -3.525647, 2,
-3.094801, -3.704679, 2,
-2.935619, -3.525647, 4,
-3.094801, -3.704679, 4
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
-3.413165, -4.062744, -4, 0, -0.5, 0.5, 0.5,
-3.413165, -4.062744, -4, 1, -0.5, 0.5, 0.5,
-3.413165, -4.062744, -4, 1, 1.5, 0.5, 0.5,
-3.413165, -4.062744, -4, 0, 1.5, 0.5, 0.5,
-3.413165, -4.062744, -2, 0, -0.5, 0.5, 0.5,
-3.413165, -4.062744, -2, 1, -0.5, 0.5, 0.5,
-3.413165, -4.062744, -2, 1, 1.5, 0.5, 0.5,
-3.413165, -4.062744, -2, 0, 1.5, 0.5, 0.5,
-3.413165, -4.062744, 0, 0, -0.5, 0.5, 0.5,
-3.413165, -4.062744, 0, 1, -0.5, 0.5, 0.5,
-3.413165, -4.062744, 0, 1, 1.5, 0.5, 0.5,
-3.413165, -4.062744, 0, 0, 1.5, 0.5, 0.5,
-3.413165, -4.062744, 2, 0, -0.5, 0.5, 0.5,
-3.413165, -4.062744, 2, 1, -0.5, 0.5, 0.5,
-3.413165, -4.062744, 2, 1, 1.5, 0.5, 0.5,
-3.413165, -4.062744, 2, 0, 1.5, 0.5, 0.5,
-3.413165, -4.062744, 4, 0, -0.5, 0.5, 0.5,
-3.413165, -4.062744, 4, 1, -0.5, 0.5, 0.5,
-3.413165, -4.062744, 4, 1, 1.5, 0.5, 0.5,
-3.413165, -4.062744, 4, 0, 1.5, 0.5, 0.5
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
-2.935619, -3.525647, -5.764472,
-2.935619, 3.635652, -5.764472,
-2.935619, -3.525647, 5.948286,
-2.935619, 3.635652, 5.948286,
-2.935619, -3.525647, -5.764472,
-2.935619, -3.525647, 5.948286,
-2.935619, 3.635652, -5.764472,
-2.935619, 3.635652, 5.948286,
-2.935619, -3.525647, -5.764472,
3.431665, -3.525647, -5.764472,
-2.935619, -3.525647, 5.948286,
3.431665, -3.525647, 5.948286,
-2.935619, 3.635652, -5.764472,
3.431665, 3.635652, -5.764472,
-2.935619, 3.635652, 5.948286,
3.431665, 3.635652, 5.948286,
3.431665, -3.525647, -5.764472,
3.431665, 3.635652, -5.764472,
3.431665, -3.525647, 5.948286,
3.431665, 3.635652, 5.948286,
3.431665, -3.525647, -5.764472,
3.431665, -3.525647, 5.948286,
3.431665, 3.635652, -5.764472,
3.431665, 3.635652, 5.948286
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
var radius = 8.080861;
var distance = 35.95266;
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
mvMatrix.translate( -0.2480232, -0.05500233, -0.09190679 );
mvMatrix.scale( 1.3722, 1.220056, 0.7459546 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.95266);
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
Hepta<-read.table("Hepta.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Hepta$V2
```

```
## Error in eval(expr, envir, enclos): object 'Hepta' not found
```

```r
y<-Hepta$V3
```

```
## Error in eval(expr, envir, enclos): object 'Hepta' not found
```

```r
z<-Hepta$V4
```

```
## Error in eval(expr, envir, enclos): object 'Hepta' not found
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
-2.842891, -0.2431514, -1.4201, 0, 0, 1, 1, 1,
-2.703655, 0.4815907, -1.897895, 1, 0, 0, 1, 1,
-2.670579, 1.261828, -0.411644, 1, 0, 0, 1, 1,
-2.553632, -0.7518132, -2.345364, 1, 0, 0, 1, 1,
-2.534007, -0.04670833, 0.6709426, 1, 0, 0, 1, 1,
-2.492563, -1.178451, -1.875244, 1, 0, 0, 1, 1,
-2.46489, 0.1332516, -1.280756, 0, 0, 0, 1, 1,
-2.455325, 1.237522, -0.2699572, 0, 0, 0, 1, 1,
-2.435368, 1.399019, 0.389073, 0, 0, 0, 1, 1,
-2.339295, -0.6496829, -0.7516411, 0, 0, 0, 1, 1,
-2.339255, 0.67937, -0.05774839, 0, 0, 0, 1, 1,
-2.329253, 0.2578773, -1.696823, 0, 0, 0, 1, 1,
-2.305914, -1.159522, -1.411714, 0, 0, 0, 1, 1,
-2.268152, -0.7207344, -3.075985, 1, 1, 1, 1, 1,
-2.24314, -1.673477, -1.51616, 1, 1, 1, 1, 1,
-2.22741, -0.3797389, -1.290006, 1, 1, 1, 1, 1,
-2.216228, -0.6976696, -2.431478, 1, 1, 1, 1, 1,
-2.202611, 0.5667408, -2.792282, 1, 1, 1, 1, 1,
-2.190442, -1.246907, 0.2140274, 1, 1, 1, 1, 1,
-2.15901, 0.7344579, -0.5653751, 1, 1, 1, 1, 1,
-2.113791, -1.305273, -3.562101, 1, 1, 1, 1, 1,
-2.081607, -0.5831195, -1.397431, 1, 1, 1, 1, 1,
-2.053538, -0.7904143, 0.04221173, 1, 1, 1, 1, 1,
-1.991894, -0.3217881, -2.42398, 1, 1, 1, 1, 1,
-1.974904, 1.45448, -0.127118, 1, 1, 1, 1, 1,
-1.969475, -0.3597655, -0.6749098, 1, 1, 1, 1, 1,
-1.969376, 0.1739099, -1.782619, 1, 1, 1, 1, 1,
-1.966797, -0.2290741, -1.270672, 1, 1, 1, 1, 1,
-1.95092, 1.455827, -1.307031, 0, 0, 1, 1, 1,
-1.935962, 0.5354599, -2.502039, 1, 0, 0, 1, 1,
-1.912001, -1.59692, -1.758423, 1, 0, 0, 1, 1,
-1.908215, -1.66291, -2.076678, 1, 0, 0, 1, 1,
-1.899686, -0.1249514, 0.08872598, 1, 0, 0, 1, 1,
-1.895504, -0.8153216, -2.608353, 1, 0, 0, 1, 1,
-1.893481, 2.55668, -1.910922, 0, 0, 0, 1, 1,
-1.893376, 0.5695457, 0.2548217, 0, 0, 0, 1, 1,
-1.874966, -2.768056, -3.889311, 0, 0, 0, 1, 1,
-1.871535, 0.397373, -2.130615, 0, 0, 0, 1, 1,
-1.82972, -0.1288469, -1.326303, 0, 0, 0, 1, 1,
-1.799093, 0.2320648, -2.384453, 0, 0, 0, 1, 1,
-1.792398, -1.067351, -2.932647, 0, 0, 0, 1, 1,
-1.779153, -0.8744156, -1.735585, 1, 1, 1, 1, 1,
-1.769571, -0.07665719, -2.937498, 1, 1, 1, 1, 1,
-1.748713, 0.9336622, -0.1575737, 1, 1, 1, 1, 1,
-1.740367, -1.108058, -2.01293, 1, 1, 1, 1, 1,
-1.730426, -0.2473035, -1.578966, 1, 1, 1, 1, 1,
-1.729816, 0.1825709, -0.5799136, 1, 1, 1, 1, 1,
-1.718864, 1.302106, -0.2424648, 1, 1, 1, 1, 1,
-1.695572, -0.5248446, -0.3919153, 1, 1, 1, 1, 1,
-1.680198, -0.7408744, -3.313693, 1, 1, 1, 1, 1,
-1.676394, 0.7281383, 0.3871895, 1, 1, 1, 1, 1,
-1.674644, 0.08923625, -1.542937, 1, 1, 1, 1, 1,
-1.670102, 0.7808931, -2.166566, 1, 1, 1, 1, 1,
-1.668933, -1.533754, -1.421697, 1, 1, 1, 1, 1,
-1.668577, 1.955395, 0.713984, 1, 1, 1, 1, 1,
-1.619357, -0.664991, -2.676735, 1, 1, 1, 1, 1,
-1.610218, -0.5145578, -2.751764, 0, 0, 1, 1, 1,
-1.609868, -1.178027, -0.9328542, 1, 0, 0, 1, 1,
-1.607054, 1.159809, 0.49716, 1, 0, 0, 1, 1,
-1.599287, -0.6285724, -3.007786, 1, 0, 0, 1, 1,
-1.596277, -0.5436417, -2.070386, 1, 0, 0, 1, 1,
-1.595401, -0.5214233, -1.748457, 1, 0, 0, 1, 1,
-1.592594, -0.8299917, -2.649589, 0, 0, 0, 1, 1,
-1.582767, 0.01032646, -2.271194, 0, 0, 0, 1, 1,
-1.575817, 2.284859, -1.354564, 0, 0, 0, 1, 1,
-1.565905, -0.2932595, -2.822558, 0, 0, 0, 1, 1,
-1.554827, -0.1238369, -0.00937776, 0, 0, 0, 1, 1,
-1.542028, -0.3648227, -1.833134, 0, 0, 0, 1, 1,
-1.540549, 0.7966186, -1.964297, 0, 0, 0, 1, 1,
-1.526434, 1.291106, 0.12164, 1, 1, 1, 1, 1,
-1.514126, -0.7835429, -0.5269644, 1, 1, 1, 1, 1,
-1.51059, -0.4886846, -3.460564, 1, 1, 1, 1, 1,
-1.493303, -0.4276878, -1.860381, 1, 1, 1, 1, 1,
-1.493171, 0.04514819, 0.6474194, 1, 1, 1, 1, 1,
-1.491142, 0.3594393, -2.661885, 1, 1, 1, 1, 1,
-1.48128, -1.280033, -0.8459583, 1, 1, 1, 1, 1,
-1.481143, 1.400142, 0.7039492, 1, 1, 1, 1, 1,
-1.475435, -3.06455, -5.593898, 1, 1, 1, 1, 1,
-1.474373, -0.4718439, -0.7788619, 1, 1, 1, 1, 1,
-1.471037, 0.4669459, 0.6095127, 1, 1, 1, 1, 1,
-1.468953, -0.5734559, -1.598114, 1, 1, 1, 1, 1,
-1.449434, 0.8596392, -0.2214182, 1, 1, 1, 1, 1,
-1.449412, -0.6735952, -0.2908819, 1, 1, 1, 1, 1,
-1.446076, 0.1021014, -1.276277, 1, 1, 1, 1, 1,
-1.445512, -1.934384, -3.256201, 0, 0, 1, 1, 1,
-1.44547, 1.107205, 0.8717145, 1, 0, 0, 1, 1,
-1.441805, -0.955942, -1.912615, 1, 0, 0, 1, 1,
-1.431841, 0.3096017, -1.600201, 1, 0, 0, 1, 1,
-1.422826, -0.4333467, -1.430415, 1, 0, 0, 1, 1,
-1.418013, -0.07588376, -1.170535, 1, 0, 0, 1, 1,
-1.416579, -1.351836, -2.272022, 0, 0, 0, 1, 1,
-1.409146, -1.11314, -3.841465, 0, 0, 0, 1, 1,
-1.39166, 0.7046972, -1.279673, 0, 0, 0, 1, 1,
-1.373869, -0.2310298, -1.733329, 0, 0, 0, 1, 1,
-1.36913, -0.5614659, -2.428657, 0, 0, 0, 1, 1,
-1.368273, -0.3430745, -2.497192, 0, 0, 0, 1, 1,
-1.358087, -1.585127, -2.466265, 0, 0, 0, 1, 1,
-1.344829, -0.2353583, -1.219213, 1, 1, 1, 1, 1,
-1.331546, -0.5118088, -2.514552, 1, 1, 1, 1, 1,
-1.308951, 0.8516082, -0.6456861, 1, 1, 1, 1, 1,
-1.306411, -1.109987, -2.413543, 1, 1, 1, 1, 1,
-1.303115, 0.561701, -0.2654056, 1, 1, 1, 1, 1,
-1.303104, 0.9592432, -1.369683, 1, 1, 1, 1, 1,
-1.294116, 1.013718, -0.3550219, 1, 1, 1, 1, 1,
-1.289877, -0.007060957, -1.423585, 1, 1, 1, 1, 1,
-1.279688, 1.422809, -2.908265, 1, 1, 1, 1, 1,
-1.269021, 0.1372058, -2.611104, 1, 1, 1, 1, 1,
-1.268242, -0.869562, -2.485168, 1, 1, 1, 1, 1,
-1.266242, 0.9414151, -1.89556, 1, 1, 1, 1, 1,
-1.262181, 1.038838, -0.4217015, 1, 1, 1, 1, 1,
-1.258369, -0.06754377, -1.60051, 1, 1, 1, 1, 1,
-1.257305, 0.8255646, -2.005674, 1, 1, 1, 1, 1,
-1.251012, 0.2813587, -1.051383, 0, 0, 1, 1, 1,
-1.243506, -0.989298, -1.299136, 1, 0, 0, 1, 1,
-1.237113, 1.508876, 0.5969923, 1, 0, 0, 1, 1,
-1.230876, 0.1613957, -1.518997, 1, 0, 0, 1, 1,
-1.226012, 0.1094471, -2.825093, 1, 0, 0, 1, 1,
-1.22375, 1.051003, -0.3182932, 1, 0, 0, 1, 1,
-1.223329, -1.414148, -2.647362, 0, 0, 0, 1, 1,
-1.222654, 0.4345329, -1.327359, 0, 0, 0, 1, 1,
-1.219991, -0.4365012, -1.134771, 0, 0, 0, 1, 1,
-1.219418, 1.978552, -1.726865, 0, 0, 0, 1, 1,
-1.21646, -0.03828182, -3.218057, 0, 0, 0, 1, 1,
-1.203712, -0.5047123, -1.821372, 0, 0, 0, 1, 1,
-1.202275, -0.1520033, -1.479495, 0, 0, 0, 1, 1,
-1.190063, -0.7737437, -1.316633, 1, 1, 1, 1, 1,
-1.189806, 0.153141, -1.332911, 1, 1, 1, 1, 1,
-1.182695, -0.7166424, -2.178903, 1, 1, 1, 1, 1,
-1.17897, 0.7911375, -0.2535781, 1, 1, 1, 1, 1,
-1.177363, 1.900694, 0.8212303, 1, 1, 1, 1, 1,
-1.172819, -0.4376984, -1.374021, 1, 1, 1, 1, 1,
-1.172404, 0.5916776, -1.803805, 1, 1, 1, 1, 1,
-1.165224, -0.5115983, -1.50448, 1, 1, 1, 1, 1,
-1.159907, -1.54606, -2.813969, 1, 1, 1, 1, 1,
-1.157388, -0.3840778, -2.082948, 1, 1, 1, 1, 1,
-1.151578, 0.6112754, 0.1164671, 1, 1, 1, 1, 1,
-1.147012, -0.06160992, -0.8987461, 1, 1, 1, 1, 1,
-1.145968, 0.392718, -0.3081122, 1, 1, 1, 1, 1,
-1.143492, -0.4416535, -1.661162, 1, 1, 1, 1, 1,
-1.139759, -1.784394, -3.662932, 1, 1, 1, 1, 1,
-1.136848, 0.5946249, -0.3751804, 0, 0, 1, 1, 1,
-1.133591, 0.6855974, -1.565878, 1, 0, 0, 1, 1,
-1.131405, 0.3335853, -1.608116, 1, 0, 0, 1, 1,
-1.127549, -0.107229, -0.4038721, 1, 0, 0, 1, 1,
-1.119951, 1.501434, -2.608539, 1, 0, 0, 1, 1,
-1.114158, 0.2509103, -0.919269, 1, 0, 0, 1, 1,
-1.108323, -0.1708226, -1.165444, 0, 0, 0, 1, 1,
-1.087043, -1.582002, -1.148818, 0, 0, 0, 1, 1,
-1.086413, 0.6839344, -0.2464009, 0, 0, 0, 1, 1,
-1.074616, 1.107508, -1.282207, 0, 0, 0, 1, 1,
-1.072572, -0.2340991, -1.246468, 0, 0, 0, 1, 1,
-1.071903, -0.7178904, -2.053886, 0, 0, 0, 1, 1,
-1.06726, 0.9226885, -0.1702156, 0, 0, 0, 1, 1,
-1.060252, -0.2719817, -1.398092, 1, 1, 1, 1, 1,
-1.057684, 0.9044226, -1.094917, 1, 1, 1, 1, 1,
-1.051915, -1.483972, -2.181647, 1, 1, 1, 1, 1,
-1.048364, 0.6594746, -1.211356, 1, 1, 1, 1, 1,
-1.044202, 0.8770961, -0.7157059, 1, 1, 1, 1, 1,
-1.036498, -0.48493, -1.323286, 1, 1, 1, 1, 1,
-1.034367, 0.3098425, -1.509385, 1, 1, 1, 1, 1,
-1.026286, 0.6619463, -0.3684877, 1, 1, 1, 1, 1,
-1.026275, -3.421356, -1.758959, 1, 1, 1, 1, 1,
-1.025017, 1.384714, -0.238146, 1, 1, 1, 1, 1,
-1.020576, 0.04920926, -1.538464, 1, 1, 1, 1, 1,
-1.017019, -0.3476667, -1.335173, 1, 1, 1, 1, 1,
-1.013163, 0.9716487, -1.948954, 1, 1, 1, 1, 1,
-1.012069, 0.2936544, -2.780923, 1, 1, 1, 1, 1,
-1.010215, 1.326699, -1.53849, 1, 1, 1, 1, 1,
-1.007975, 1.071083, 0.3653311, 0, 0, 1, 1, 1,
-1.000162, 0.3884644, -1.920313, 1, 0, 0, 1, 1,
-0.9978645, -0.3059776, -2.842585, 1, 0, 0, 1, 1,
-0.9948435, -0.1716106, -3.370978, 1, 0, 0, 1, 1,
-0.9825756, -2.195738, -2.401858, 1, 0, 0, 1, 1,
-0.971068, 0.3988516, -3.364535, 1, 0, 0, 1, 1,
-0.9694005, -0.8192345, -1.457382, 0, 0, 0, 1, 1,
-0.9629166, -0.9546902, -0.8635412, 0, 0, 0, 1, 1,
-0.9592078, -0.6041035, -0.6208206, 0, 0, 0, 1, 1,
-0.9585007, -0.3730076, -3.36783, 0, 0, 0, 1, 1,
-0.9488834, -1.149948, -2.406601, 0, 0, 0, 1, 1,
-0.9480171, 1.814071, 0.6023607, 0, 0, 0, 1, 1,
-0.9461975, -0.2760051, -1.065802, 0, 0, 0, 1, 1,
-0.9450349, 0.1920449, -0.8997061, 1, 1, 1, 1, 1,
-0.9446522, -0.2814004, -0.06387998, 1, 1, 1, 1, 1,
-0.9383839, 0.0217434, -1.869383, 1, 1, 1, 1, 1,
-0.9347255, 0.254798, -1.202455, 1, 1, 1, 1, 1,
-0.9336134, -0.8635651, -2.23329, 1, 1, 1, 1, 1,
-0.9317595, -0.4868371, -1.551481, 1, 1, 1, 1, 1,
-0.9274392, 0.6577241, 0.06693009, 1, 1, 1, 1, 1,
-0.9251559, 0.2864905, -1.143294, 1, 1, 1, 1, 1,
-0.9234281, 2.230361, 0.6718588, 1, 1, 1, 1, 1,
-0.9210123, -0.2974908, -2.471244, 1, 1, 1, 1, 1,
-0.9206305, -0.9182314, -2.029999, 1, 1, 1, 1, 1,
-0.9189448, -0.6263257, -1.265278, 1, 1, 1, 1, 1,
-0.9170389, 1.249162, -0.9563496, 1, 1, 1, 1, 1,
-0.9156123, 1.251949, -0.3723483, 1, 1, 1, 1, 1,
-0.915091, 0.4946222, -0.9701452, 1, 1, 1, 1, 1,
-0.9103003, 1.541074, 0.2979912, 0, 0, 1, 1, 1,
-0.9096905, 1.058704, -0.1232686, 1, 0, 0, 1, 1,
-0.9010088, -1.12074, -2.00864, 1, 0, 0, 1, 1,
-0.8947024, -1.804609, -3.091329, 1, 0, 0, 1, 1,
-0.8820488, -0.1425725, -0.5243157, 1, 0, 0, 1, 1,
-0.8808652, 0.3689867, -1.582209, 1, 0, 0, 1, 1,
-0.8804721, 1.243215, -1.499979, 0, 0, 0, 1, 1,
-0.8794744, -1.019832, -2.448736, 0, 0, 0, 1, 1,
-0.8786863, -1.580818, -4.070034, 0, 0, 0, 1, 1,
-0.8771501, 1.387787, -1.697573, 0, 0, 0, 1, 1,
-0.8734235, 0.208647, -0.4414835, 0, 0, 0, 1, 1,
-0.8711204, 0.9393693, 0.1634751, 0, 0, 0, 1, 1,
-0.8711095, -0.5121932, -1.822573, 0, 0, 0, 1, 1,
-0.8666176, -0.6843151, -1.712839, 1, 1, 1, 1, 1,
-0.8621653, -0.02123526, -0.5618763, 1, 1, 1, 1, 1,
-0.8613106, -0.1757556, -2.11752, 1, 1, 1, 1, 1,
-0.8538038, 0.4060191, 0.517938, 1, 1, 1, 1, 1,
-0.8527541, 2.147174, -1.432563, 1, 1, 1, 1, 1,
-0.8412979, 1.382007, 0.5477908, 1, 1, 1, 1, 1,
-0.8340765, 0.04751899, -1.309664, 1, 1, 1, 1, 1,
-0.8318359, -1.059027, -0.760675, 1, 1, 1, 1, 1,
-0.8295584, 1.579822, 0.02631234, 1, 1, 1, 1, 1,
-0.8251385, -0.7603476, -1.664766, 1, 1, 1, 1, 1,
-0.8228849, 0.3780533, 0.1349927, 1, 1, 1, 1, 1,
-0.8179147, 0.1524752, -1.790057, 1, 1, 1, 1, 1,
-0.8139265, 1.669172, 0.4868736, 1, 1, 1, 1, 1,
-0.8136628, -2.89888, -2.195399, 1, 1, 1, 1, 1,
-0.8129701, 1.751354, 1.760328, 1, 1, 1, 1, 1,
-0.8103916, 1.065161, 0.1957425, 0, 0, 1, 1, 1,
-0.8086738, -0.740707, -1.652144, 1, 0, 0, 1, 1,
-0.8067264, 2.190053, -1.21036, 1, 0, 0, 1, 1,
-0.8060905, 0.0002616268, -1.191781, 1, 0, 0, 1, 1,
-0.8028285, -1.984678, -2.57577, 1, 0, 0, 1, 1,
-0.7939873, 0.2503939, 0.1065013, 1, 0, 0, 1, 1,
-0.7923619, -1.722545, -2.720899, 0, 0, 0, 1, 1,
-0.7805253, 0.8760945, 0.1140405, 0, 0, 0, 1, 1,
-0.7795603, -1.236368, -4.526519, 0, 0, 0, 1, 1,
-0.7748187, -1.267802, -3.497165, 0, 0, 0, 1, 1,
-0.7695095, 1.130195, 1.089803, 0, 0, 0, 1, 1,
-0.7693242, 0.9056685, -0.8344809, 0, 0, 0, 1, 1,
-0.7650058, -0.5622883, -2.657465, 0, 0, 0, 1, 1,
-0.7584373, -1.110397, -2.527091, 1, 1, 1, 1, 1,
-0.7526522, 1.967452, 1.124651, 1, 1, 1, 1, 1,
-0.7441233, 1.389679, -0.8544796, 1, 1, 1, 1, 1,
-0.7426823, -1.113628, -3.026805, 1, 1, 1, 1, 1,
-0.7367435, 0.1142511, -0.7294385, 1, 1, 1, 1, 1,
-0.7355866, 0.9385412, -0.03964102, 1, 1, 1, 1, 1,
-0.7338663, -0.06426305, -2.811462, 1, 1, 1, 1, 1,
-0.7250063, -2.009052, -0.5630845, 1, 1, 1, 1, 1,
-0.723659, 1.178898, 0.06229575, 1, 1, 1, 1, 1,
-0.7212186, 0.8887162, 0.5846925, 1, 1, 1, 1, 1,
-0.7182667, 1.351597, 0.1786869, 1, 1, 1, 1, 1,
-0.7164474, 0.7618634, -0.6461913, 1, 1, 1, 1, 1,
-0.7095553, 0.2434597, -1.817863, 1, 1, 1, 1, 1,
-0.7078525, -0.4339343, -1.333428, 1, 1, 1, 1, 1,
-0.7060388, 1.1917, -0.1648531, 1, 1, 1, 1, 1,
-0.7007521, -0.5853141, -3.009942, 0, 0, 1, 1, 1,
-0.6803845, -0.4355635, -1.135291, 1, 0, 0, 1, 1,
-0.6781494, -0.5658473, -2.438661, 1, 0, 0, 1, 1,
-0.6750926, -2.027622, -2.567803, 1, 0, 0, 1, 1,
-0.67468, 3.155406, -1.01255, 1, 0, 0, 1, 1,
-0.6678252, -1.91729, -2.904981, 1, 0, 0, 1, 1,
-0.6670815, -0.09956502, -1.24007, 0, 0, 0, 1, 1,
-0.6660829, 1.786674, -0.8938028, 0, 0, 0, 1, 1,
-0.6646594, -0.1648241, -3.425065, 0, 0, 0, 1, 1,
-0.6645744, 0.3362601, -0.9065939, 0, 0, 0, 1, 1,
-0.6642904, 0.5167738, -0.8710879, 0, 0, 0, 1, 1,
-0.6584843, 0.4051981, -0.8506867, 0, 0, 0, 1, 1,
-0.6568869, -0.557166, -2.250814, 0, 0, 0, 1, 1,
-0.6536448, -1.37356, -1.547264, 1, 1, 1, 1, 1,
-0.6514793, -0.8497402, -3.241088, 1, 1, 1, 1, 1,
-0.6503487, 0.3415706, -1.369718, 1, 1, 1, 1, 1,
-0.6228932, -1.366691, -3.606987, 1, 1, 1, 1, 1,
-0.6197962, 1.047438, -0.9767704, 1, 1, 1, 1, 1,
-0.6179575, -0.5649585, -0.8245503, 1, 1, 1, 1, 1,
-0.6038828, 1.37089, -0.1550705, 1, 1, 1, 1, 1,
-0.596454, 1.227406, -0.6114863, 1, 1, 1, 1, 1,
-0.5846375, 0.6839225, 0.9380742, 1, 1, 1, 1, 1,
-0.5838461, -1.972783, -2.741565, 1, 1, 1, 1, 1,
-0.5814601, 0.8166203, -0.2346563, 1, 1, 1, 1, 1,
-0.5801948, -0.8742466, -3.08905, 1, 1, 1, 1, 1,
-0.572037, -0.9363448, -2.310265, 1, 1, 1, 1, 1,
-0.5703741, 0.7648645, -0.7370428, 1, 1, 1, 1, 1,
-0.5645556, -0.5647524, -1.80354, 1, 1, 1, 1, 1,
-0.5597595, 0.3183154, -0.5671448, 0, 0, 1, 1, 1,
-0.557164, -0.5438687, -1.704064, 1, 0, 0, 1, 1,
-0.5548774, -0.7159182, -0.2580376, 1, 0, 0, 1, 1,
-0.5533047, 0.7010262, -1.022752, 1, 0, 0, 1, 1,
-0.5481334, -0.3068146, -2.995474, 1, 0, 0, 1, 1,
-0.547448, 1.939837, -0.8810676, 1, 0, 0, 1, 1,
-0.5472084, 1.666219, 1.100811, 0, 0, 0, 1, 1,
-0.5466338, -1.444583, -1.275793, 0, 0, 0, 1, 1,
-0.5436356, -1.95928, -3.178743, 0, 0, 0, 1, 1,
-0.5429714, -0.8573399, -3.480772, 0, 0, 0, 1, 1,
-0.5385784, -0.8449894, -0.262154, 0, 0, 0, 1, 1,
-0.5377815, -0.1102707, -3.051717, 0, 0, 0, 1, 1,
-0.5320877, -1.674865, -3.4503, 0, 0, 0, 1, 1,
-0.5259092, 1.819794, -0.1697629, 1, 1, 1, 1, 1,
-0.5179959, -1.490644, -2.706511, 1, 1, 1, 1, 1,
-0.5117297, 2.458993, -1.435674, 1, 1, 1, 1, 1,
-0.5112602, 0.2174764, -1.672662, 1, 1, 1, 1, 1,
-0.5102383, 1.756351, 0.3161697, 1, 1, 1, 1, 1,
-0.5089478, -0.7997211, -1.774588, 1, 1, 1, 1, 1,
-0.5065815, 0.4929571, -1.434339, 1, 1, 1, 1, 1,
-0.5030927, 0.9430208, 0.04473121, 1, 1, 1, 1, 1,
-0.4915413, -0.1448261, -2.652143, 1, 1, 1, 1, 1,
-0.4908466, -0.04770786, -0.7424387, 1, 1, 1, 1, 1,
-0.4876307, -1.049965, -2.815473, 1, 1, 1, 1, 1,
-0.4804566, 0.2106849, -1.079996, 1, 1, 1, 1, 1,
-0.4785365, 0.9852891, -0.07483943, 1, 1, 1, 1, 1,
-0.4783459, -2.020124, -2.069675, 1, 1, 1, 1, 1,
-0.4717294, -0.4881408, -2.22756, 1, 1, 1, 1, 1,
-0.4678057, -0.4138521, -1.731622, 0, 0, 1, 1, 1,
-0.4661654, 0.4441687, 0.4407101, 1, 0, 0, 1, 1,
-0.4620798, 0.7430699, -1.029823, 1, 0, 0, 1, 1,
-0.4619728, 1.039385, 0.720287, 1, 0, 0, 1, 1,
-0.4616713, 0.5126649, -1.191667, 1, 0, 0, 1, 1,
-0.4597402, -0.3354627, -0.8634813, 1, 0, 0, 1, 1,
-0.4593323, -0.2685867, -1.403245, 0, 0, 0, 1, 1,
-0.4542443, 2.393678, -0.8566827, 0, 0, 0, 1, 1,
-0.4491019, 0.06329495, -3.916118, 0, 0, 0, 1, 1,
-0.4458711, -0.6813876, -2.118594, 0, 0, 0, 1, 1,
-0.4453737, 1.3402, 1.352623, 0, 0, 0, 1, 1,
-0.4337006, 0.1232931, -1.719744, 0, 0, 0, 1, 1,
-0.4314173, -0.2020619, -2.215493, 0, 0, 0, 1, 1,
-0.4223978, 0.1654934, 1.080492, 1, 1, 1, 1, 1,
-0.4203961, -0.5389479, -2.244045, 1, 1, 1, 1, 1,
-0.4176476, 0.2323971, -1.314445, 1, 1, 1, 1, 1,
-0.4117188, -1.5213, -3.085474, 1, 1, 1, 1, 1,
-0.4110174, 0.9177356, -0.9216343, 1, 1, 1, 1, 1,
-0.4106283, -1.062532, -3.591052, 1, 1, 1, 1, 1,
-0.4085937, 0.3366953, -2.14625, 1, 1, 1, 1, 1,
-0.4027074, 0.09579732, -1.112762, 1, 1, 1, 1, 1,
-0.4023139, 0.4097113, -1.132403, 1, 1, 1, 1, 1,
-0.4014595, -0.7224055, -3.826197, 1, 1, 1, 1, 1,
-0.3975435, -0.535267, -3.80842, 1, 1, 1, 1, 1,
-0.39166, -0.04869248, -1.895526, 1, 1, 1, 1, 1,
-0.3901071, 0.39057, -0.03818742, 1, 1, 1, 1, 1,
-0.3835269, -0.07867026, -2.35723, 1, 1, 1, 1, 1,
-0.3824632, -0.2086647, -1.762518, 1, 1, 1, 1, 1,
-0.378984, 0.2806747, -1.99415, 0, 0, 1, 1, 1,
-0.3753163, 0.9289297, -0.6408878, 1, 0, 0, 1, 1,
-0.3724411, 0.9108137, -0.1074743, 1, 0, 0, 1, 1,
-0.36136, -0.9001526, -2.067914, 1, 0, 0, 1, 1,
-0.3611545, 0.3588379, -0.6362866, 1, 0, 0, 1, 1,
-0.3587157, 0.4725327, -1.787176, 1, 0, 0, 1, 1,
-0.3563023, 0.4901098, 2.797714, 0, 0, 0, 1, 1,
-0.3555219, -0.1726148, -2.673325, 0, 0, 0, 1, 1,
-0.3525767, 0.6178845, -1.689337, 0, 0, 0, 1, 1,
-0.3513266, 0.5237715, -2.125788, 0, 0, 0, 1, 1,
-0.3512842, -0.1948188, -1.881636, 0, 0, 0, 1, 1,
-0.3510526, -1.037427, -3.711091, 0, 0, 0, 1, 1,
-0.3497961, -0.9954008, -2.155028, 0, 0, 0, 1, 1,
-0.3488829, 0.2554988, -1.358534, 1, 1, 1, 1, 1,
-0.3472867, -1.835978, -0.9515235, 1, 1, 1, 1, 1,
-0.345493, -1.1109, -1.714884, 1, 1, 1, 1, 1,
-0.3415483, -0.7846819, -2.613693, 1, 1, 1, 1, 1,
-0.3407204, 1.332424, -0.7366391, 1, 1, 1, 1, 1,
-0.3405115, 0.04252814, -1.539586, 1, 1, 1, 1, 1,
-0.3374947, -0.5192952, -1.479099, 1, 1, 1, 1, 1,
-0.3361684, -1.658163, -2.114019, 1, 1, 1, 1, 1,
-0.3349401, 1.109311, 0.145844, 1, 1, 1, 1, 1,
-0.3299315, -1.497154, -3.672012, 1, 1, 1, 1, 1,
-0.3295798, 0.953981, -0.5441419, 1, 1, 1, 1, 1,
-0.3262386, 0.8697488, -1.272191, 1, 1, 1, 1, 1,
-0.3209548, 0.2369822, -1.94003, 1, 1, 1, 1, 1,
-0.3207915, 1.298987, -0.6697361, 1, 1, 1, 1, 1,
-0.3201673, 1.011996, -0.4189191, 1, 1, 1, 1, 1,
-0.3139001, 0.9498721, 0.6959723, 0, 0, 1, 1, 1,
-0.3105604, 1.143429, 1.326693, 1, 0, 0, 1, 1,
-0.3078342, 0.25978, -0.2783915, 1, 0, 0, 1, 1,
-0.3062647, 0.7245829, -0.9674795, 1, 0, 0, 1, 1,
-0.3035265, -1.164096, -4.657952, 1, 0, 0, 1, 1,
-0.3013397, -0.3579604, -0.9926758, 1, 0, 0, 1, 1,
-0.3009967, -0.2749449, -2.707941, 0, 0, 0, 1, 1,
-0.2981471, -1.857482, -4.394015, 0, 0, 0, 1, 1,
-0.2977348, -0.06428163, -1.54651, 0, 0, 0, 1, 1,
-0.2940429, 1.771699, -0.02234297, 0, 0, 0, 1, 1,
-0.2934307, 1.098985, 1.338799, 0, 0, 0, 1, 1,
-0.2916169, 1.464986, -1.110549, 0, 0, 0, 1, 1,
-0.2848845, -1.015359, -3.068879, 0, 0, 0, 1, 1,
-0.2847409, -0.9470363, -3.39684, 1, 1, 1, 1, 1,
-0.2795171, 1.534268, -1.161348, 1, 1, 1, 1, 1,
-0.2789696, -0.7373917, -1.634757, 1, 1, 1, 1, 1,
-0.2760339, 1.57539, -0.2115023, 1, 1, 1, 1, 1,
-0.2730012, -0.5978663, -2.830137, 1, 1, 1, 1, 1,
-0.2729466, -0.7541093, -4.158363, 1, 1, 1, 1, 1,
-0.2714705, 0.07675791, -1.280614, 1, 1, 1, 1, 1,
-0.2712098, 0.5881976, 1.009805, 1, 1, 1, 1, 1,
-0.2697629, -1.796086, -2.712046, 1, 1, 1, 1, 1,
-0.2625352, 0.7658694, -0.5271084, 1, 1, 1, 1, 1,
-0.2606435, -1.724202, -3.304494, 1, 1, 1, 1, 1,
-0.2597593, -1.177526, -4.268162, 1, 1, 1, 1, 1,
-0.2593169, -0.04357935, -1.373666, 1, 1, 1, 1, 1,
-0.2557152, 1.136159, -0.8626187, 1, 1, 1, 1, 1,
-0.2537718, -0.6024132, -3.770535, 1, 1, 1, 1, 1,
-0.2522506, 0.9938481, -0.8686333, 0, 0, 1, 1, 1,
-0.2515481, -0.6131921, -2.625496, 1, 0, 0, 1, 1,
-0.2512314, -0.0740797, 0.837896, 1, 0, 0, 1, 1,
-0.2509083, -1.076673, -3.581167, 1, 0, 0, 1, 1,
-0.2483707, 1.742966, -0.3026907, 1, 0, 0, 1, 1,
-0.2458723, 1.012307, -0.3202785, 1, 0, 0, 1, 1,
-0.2441239, 1.483756, -1.709638, 0, 0, 0, 1, 1,
-0.238708, -0.03207428, -1.67932, 0, 0, 0, 1, 1,
-0.2333821, -0.4745342, -4.009638, 0, 0, 0, 1, 1,
-0.2308849, -0.1820946, -1.670898, 0, 0, 0, 1, 1,
-0.230366, -0.520472, -1.140444, 0, 0, 0, 1, 1,
-0.2295617, 0.2966343, -2.268984, 0, 0, 0, 1, 1,
-0.2271461, -0.616058, -2.856414, 0, 0, 0, 1, 1,
-0.2217811, 0.3798691, -1.070034, 1, 1, 1, 1, 1,
-0.2165097, 1.19394, -0.6798868, 1, 1, 1, 1, 1,
-0.2156041, 0.1614925, -0.7141389, 1, 1, 1, 1, 1,
-0.2110116, 1.03029, -0.892897, 1, 1, 1, 1, 1,
-0.2050339, -0.6695459, -3.948109, 1, 1, 1, 1, 1,
-0.2037423, -0.4839769, -1.508959, 1, 1, 1, 1, 1,
-0.2032488, 0.6779627, 0.7314219, 1, 1, 1, 1, 1,
-0.2020357, -0.6908288, -2.934648, 1, 1, 1, 1, 1,
-0.1986699, 0.3112442, -0.9864274, 1, 1, 1, 1, 1,
-0.194698, 0.3883312, 0.5104803, 1, 1, 1, 1, 1,
-0.1911984, -0.5136669, -2.804507, 1, 1, 1, 1, 1,
-0.1908007, 0.7205175, -1.184048, 1, 1, 1, 1, 1,
-0.1851774, 0.2565058, -1.034683, 1, 1, 1, 1, 1,
-0.1835736, -0.2051859, -3.371245, 1, 1, 1, 1, 1,
-0.1775067, -0.5271373, -1.87224, 1, 1, 1, 1, 1,
-0.1760138, 0.3571172, 0.08205617, 0, 0, 1, 1, 1,
-0.1759881, -0.6345941, -2.939053, 1, 0, 0, 1, 1,
-0.1752287, 0.7860528, -0.9866954, 1, 0, 0, 1, 1,
-0.1748651, 0.9563196, -0.9650785, 1, 0, 0, 1, 1,
-0.1737728, 1.141937, 1.319603, 1, 0, 0, 1, 1,
-0.1730252, -0.3465331, -2.854474, 1, 0, 0, 1, 1,
-0.1727227, -0.7868057, -2.416179, 0, 0, 0, 1, 1,
-0.1720669, 0.8157697, -0.3105231, 0, 0, 0, 1, 1,
-0.1704507, 0.7580343, -1.670126, 0, 0, 0, 1, 1,
-0.1680207, -0.2628529, -3.22673, 0, 0, 0, 1, 1,
-0.1658635, 0.4436287, -0.7950215, 0, 0, 0, 1, 1,
-0.1642151, -0.8023522, -2.004964, 0, 0, 0, 1, 1,
-0.1600836, 0.1325042, -0.0521959, 0, 0, 0, 1, 1,
-0.1578848, -0.944997, -3.091689, 1, 1, 1, 1, 1,
-0.1549052, -0.7025133, -3.381643, 1, 1, 1, 1, 1,
-0.1517288, 0.7540236, -0.8925243, 1, 1, 1, 1, 1,
-0.1507313, -1.770546, -3.531043, 1, 1, 1, 1, 1,
-0.1437675, -0.6568874, -2.998116, 1, 1, 1, 1, 1,
-0.142275, 0.2656154, -1.981264, 1, 1, 1, 1, 1,
-0.1382837, -0.2329663, -1.381067, 1, 1, 1, 1, 1,
-0.1301331, 0.7863269, -1.491492, 1, 1, 1, 1, 1,
-0.1221652, -0.2103913, -0.5982957, 1, 1, 1, 1, 1,
-0.1130504, -1.106837, -1.892163, 1, 1, 1, 1, 1,
-0.1124033, 0.4794518, 0.3149753, 1, 1, 1, 1, 1,
-0.1119403, -0.1161409, -3.098117, 1, 1, 1, 1, 1,
-0.1112034, 1.022053, 0.09414773, 1, 1, 1, 1, 1,
-0.1099838, 1.757732, -0.7648854, 1, 1, 1, 1, 1,
-0.1084987, 0.1924322, -0.1386902, 1, 1, 1, 1, 1,
-0.1067108, -1.25826, -2.419452, 0, 0, 1, 1, 1,
-0.1059994, -1.774736, -3.400301, 1, 0, 0, 1, 1,
-0.1044224, 1.053671, -2.315864, 1, 0, 0, 1, 1,
-0.0984228, 0.1186412, 1.118403, 1, 0, 0, 1, 1,
-0.09489325, -0.8102198, -1.364558, 1, 0, 0, 1, 1,
-0.09115112, 1.148325, 0.4126887, 1, 0, 0, 1, 1,
-0.08888457, -0.2482412, -2.622621, 0, 0, 0, 1, 1,
-0.08877776, -1.192551, -1.388317, 0, 0, 0, 1, 1,
-0.0878568, -1.621828, -2.167624, 0, 0, 0, 1, 1,
-0.08372987, 2.277258, -0.6685814, 0, 0, 0, 1, 1,
-0.08346317, 0.0170981, 0.7955983, 0, 0, 0, 1, 1,
-0.08306465, 0.1819107, -0.4670437, 0, 0, 0, 1, 1,
-0.0806141, -0.4188377, -2.721276, 0, 0, 0, 1, 1,
-0.07698192, 0.1162147, -1.511427, 1, 1, 1, 1, 1,
-0.07684445, 0.3649717, 1.967023, 1, 1, 1, 1, 1,
-0.07606181, 0.6374646, -0.1805698, 1, 1, 1, 1, 1,
-0.07015876, -1.001241, -2.496834, 1, 1, 1, 1, 1,
-0.07003304, -0.5370691, -2.19614, 1, 1, 1, 1, 1,
-0.06928729, -1.686094, -3.308264, 1, 1, 1, 1, 1,
-0.06917854, -0.7357951, -3.642092, 1, 1, 1, 1, 1,
-0.06901239, 0.9525075, -0.2084072, 1, 1, 1, 1, 1,
-0.06592958, 0.681106, -1.208683, 1, 1, 1, 1, 1,
-0.06428605, -0.8276801, -4.015749, 1, 1, 1, 1, 1,
-0.06315574, -0.1693048, -2.49548, 1, 1, 1, 1, 1,
-0.06296071, -0.2015861, -1.218011, 1, 1, 1, 1, 1,
-0.06061843, -0.1833058, -2.800007, 1, 1, 1, 1, 1,
-0.05442527, -1.170122, -3.380201, 1, 1, 1, 1, 1,
-0.05336193, 0.5289198, -1.055339, 1, 1, 1, 1, 1,
-0.05169992, 0.9349849, -0.1982895, 0, 0, 1, 1, 1,
-0.04962672, -0.01752562, -3.544217, 1, 0, 0, 1, 1,
-0.04710475, 0.3278284, -1.055503, 1, 0, 0, 1, 1,
-0.04674939, 0.4377973, -1.807506, 1, 0, 0, 1, 1,
-0.04629696, -0.1256152, -1.42246, 1, 0, 0, 1, 1,
-0.04349033, -0.9574695, -2.556634, 1, 0, 0, 1, 1,
-0.04325113, 0.8352569, 0.474089, 0, 0, 0, 1, 1,
-0.04143472, 0.8210775, -0.4643487, 0, 0, 0, 1, 1,
-0.04080545, 0.5265031, -0.6018535, 0, 0, 0, 1, 1,
-0.0288617, 1.818458, 0.06856954, 0, 0, 0, 1, 1,
-0.02735575, -1.618139, -3.273705, 0, 0, 0, 1, 1,
-0.02542774, 0.2408613, 0.03368342, 0, 0, 0, 1, 1,
-0.02450083, 0.1857541, -1.514699, 0, 0, 0, 1, 1,
-0.02382752, -0.9557767, -2.523266, 1, 1, 1, 1, 1,
-0.02382087, 1.481798, 0.8396431, 1, 1, 1, 1, 1,
-0.02305801, -1.266086, -3.184786, 1, 1, 1, 1, 1,
-0.01802221, 0.06500762, -0.0085131, 1, 1, 1, 1, 1,
-0.01687921, 1.287231, -2.108313, 1, 1, 1, 1, 1,
-0.008206794, 0.1240441, 0.02802586, 1, 1, 1, 1, 1,
-0.006464231, -1.258076, -3.680641, 1, 1, 1, 1, 1,
-0.005991449, -1.326527, -4.229824, 1, 1, 1, 1, 1,
-0.001682739, -0.3029273, -3.100561, 1, 1, 1, 1, 1,
-0.0005105219, -0.6356342, -1.518801, 1, 1, 1, 1, 1,
0.002300761, 2.13931, -1.326341, 1, 1, 1, 1, 1,
0.005989124, -1.163164, 2.248022, 1, 1, 1, 1, 1,
0.006855992, 0.5552446, 0.06746233, 1, 1, 1, 1, 1,
0.007111971, -0.8382711, 4.371816, 1, 1, 1, 1, 1,
0.007483194, 0.1893117, 0.7563457, 1, 1, 1, 1, 1,
0.01146826, 0.7623526, -0.8507035, 0, 0, 1, 1, 1,
0.0116055, -2.032942, 3.298385, 1, 0, 0, 1, 1,
0.01663013, 0.01279272, 0.8879327, 1, 0, 0, 1, 1,
0.01917076, -1.261522, 2.191948, 1, 0, 0, 1, 1,
0.02324379, 0.7807044, -0.2809334, 1, 0, 0, 1, 1,
0.02512622, -0.1749966, 4.091644, 1, 0, 0, 1, 1,
0.0297698, 0.5830315, 1.624992, 0, 0, 0, 1, 1,
0.03491284, -0.1397203, 3.092476, 0, 0, 0, 1, 1,
0.03589845, -1.409263, 4.380866, 0, 0, 0, 1, 1,
0.03704002, -0.3697785, 3.794599, 0, 0, 0, 1, 1,
0.03710929, -2.152506, 4.432092, 0, 0, 0, 1, 1,
0.04031456, -0.2666152, 1.62799, 0, 0, 0, 1, 1,
0.04089732, 0.500358, -0.7776967, 0, 0, 0, 1, 1,
0.04146995, -1.235588, 2.867192, 1, 1, 1, 1, 1,
0.04154712, 1.003529, 1.360183, 1, 1, 1, 1, 1,
0.04225252, 1.188045, 0.9786961, 1, 1, 1, 1, 1,
0.04338168, -1.305056, 2.560826, 1, 1, 1, 1, 1,
0.04354862, 0.8875946, -0.5179411, 1, 1, 1, 1, 1,
0.04908422, 0.05540181, 1.229282, 1, 1, 1, 1, 1,
0.04935021, 1.174535, -0.5637378, 1, 1, 1, 1, 1,
0.05032474, 0.9085527, -0.1883716, 1, 1, 1, 1, 1,
0.05115005, -0.5636148, 2.457899, 1, 1, 1, 1, 1,
0.0514048, 0.3907689, 0.1038341, 1, 1, 1, 1, 1,
0.05397234, 0.1992777, 0.5378317, 1, 1, 1, 1, 1,
0.0557579, -0.5188915, 3.623059, 1, 1, 1, 1, 1,
0.06092519, -1.022063, 1.559809, 1, 1, 1, 1, 1,
0.06317089, 0.7287015, -0.9079046, 1, 1, 1, 1, 1,
0.07273999, 0.9015349, 0.0589467, 1, 1, 1, 1, 1,
0.07678305, 1.026703, 0.6328968, 0, 0, 1, 1, 1,
0.08180156, -0.1550266, 3.332044, 1, 0, 0, 1, 1,
0.08186065, 0.7182601, 0.6371094, 1, 0, 0, 1, 1,
0.08797488, 1.465379, 1.163394, 1, 0, 0, 1, 1,
0.0881329, -1.690928, 5.099097, 1, 0, 0, 1, 1,
0.08945259, -0.8689596, 5.068249, 1, 0, 0, 1, 1,
0.09088981, 0.1910956, 1.03897, 0, 0, 0, 1, 1,
0.09986514, -0.1525854, 3.219071, 0, 0, 0, 1, 1,
0.1046589, 1.112864, 0.8354767, 0, 0, 0, 1, 1,
0.1077739, 0.4929061, 0.5683312, 0, 0, 0, 1, 1,
0.1087234, -0.01270375, 0.9776418, 0, 0, 0, 1, 1,
0.1113401, 0.2252361, -0.004513962, 0, 0, 0, 1, 1,
0.1139787, 0.7330648, 1.49342, 0, 0, 0, 1, 1,
0.1161119, 0.6187926, -1.725067, 1, 1, 1, 1, 1,
0.1164251, 0.6246069, 1.131537, 1, 1, 1, 1, 1,
0.1214377, 0.3897338, 0.5194684, 1, 1, 1, 1, 1,
0.1238806, -0.1873848, 1.172269, 1, 1, 1, 1, 1,
0.136462, 1.494671, 1.459856, 1, 1, 1, 1, 1,
0.1371701, -0.6842613, 3.293038, 1, 1, 1, 1, 1,
0.1388275, 1.711342, -1.209375, 1, 1, 1, 1, 1,
0.1398654, 0.2045837, 0.6358321, 1, 1, 1, 1, 1,
0.1426386, -1.002785, 4.107963, 1, 1, 1, 1, 1,
0.1431145, -0.112947, 3.765449, 1, 1, 1, 1, 1,
0.1525904, 1.118933, -0.3836581, 1, 1, 1, 1, 1,
0.1528008, -0.3742739, 1.85354, 1, 1, 1, 1, 1,
0.1573003, -1.746367, 2.760798, 1, 1, 1, 1, 1,
0.1584448, 0.3561184, 0.285574, 1, 1, 1, 1, 1,
0.1668878, 0.628746, 0.2822434, 1, 1, 1, 1, 1,
0.1671981, -0.3689017, 2.264478, 0, 0, 1, 1, 1,
0.1672106, 0.3149509, 1.173219, 1, 0, 0, 1, 1,
0.1676048, 1.492051, -0.2471148, 1, 0, 0, 1, 1,
0.1700859, 1.661373, 0.601424, 1, 0, 0, 1, 1,
0.1712274, 0.8142339, -0.2406258, 1, 0, 0, 1, 1,
0.1729032, 1.306037, 0.09573116, 1, 0, 0, 1, 1,
0.1805177, -0.2082325, 3.320412, 0, 0, 0, 1, 1,
0.1810195, 0.6291289, -0.08909088, 0, 0, 0, 1, 1,
0.1821185, 0.6393973, 0.6766501, 0, 0, 0, 1, 1,
0.1829035, 1.447809, 0.7525734, 0, 0, 0, 1, 1,
0.1895335, 1.086452, -0.9726375, 0, 0, 0, 1, 1,
0.1923305, 0.2857294, 0.5828614, 0, 0, 0, 1, 1,
0.1978146, -0.2359251, 4.021161, 0, 0, 0, 1, 1,
0.1999064, 1.726959, 1.492242, 1, 1, 1, 1, 1,
0.2034681, 0.8981087, -0.9623738, 1, 1, 1, 1, 1,
0.2073838, -1.395587, 0.5840859, 1, 1, 1, 1, 1,
0.2096062, -1.274775, 2.981339, 1, 1, 1, 1, 1,
0.2105519, -1.025552, 2.178212, 1, 1, 1, 1, 1,
0.2109524, 0.6956047, 1.265889, 1, 1, 1, 1, 1,
0.217739, -0.2012746, 0.8524946, 1, 1, 1, 1, 1,
0.2180415, -0.08775518, 0.4392188, 1, 1, 1, 1, 1,
0.2190979, 0.8007426, -0.4070216, 1, 1, 1, 1, 1,
0.2245683, 1.005655, -0.9321828, 1, 1, 1, 1, 1,
0.2296475, -0.0784628, 1.581566, 1, 1, 1, 1, 1,
0.232815, 0.7400015, 0.1456235, 1, 1, 1, 1, 1,
0.2376601, -1.466967, 2.297389, 1, 1, 1, 1, 1,
0.2418626, 1.129426, -0.4387912, 1, 1, 1, 1, 1,
0.242031, -0.8255957, 1.558178, 1, 1, 1, 1, 1,
0.2429972, 0.1297314, 0.937238, 0, 0, 1, 1, 1,
0.2502095, 0.01603463, 1.477028, 1, 0, 0, 1, 1,
0.2526609, -0.09112342, 1.884345, 1, 0, 0, 1, 1,
0.2562735, 0.712913, 1.465805, 1, 0, 0, 1, 1,
0.2584401, -0.1763406, 2.491011, 1, 0, 0, 1, 1,
0.2634017, -0.0537779, -0.06102986, 1, 0, 0, 1, 1,
0.2650445, 1.107443, 0.4955985, 0, 0, 0, 1, 1,
0.2671529, -0.7491066, 4.021826, 0, 0, 0, 1, 1,
0.2672678, 0.2235328, 1.565317, 0, 0, 0, 1, 1,
0.2701603, 1.365688, 0.4514637, 0, 0, 0, 1, 1,
0.2703565, 1.130057, 0.9754392, 0, 0, 0, 1, 1,
0.2724105, 0.3060343, -0.07474007, 0, 0, 0, 1, 1,
0.2730054, -0.8427223, 4.012795, 0, 0, 0, 1, 1,
0.2733623, 0.7504018, 0.940551, 1, 1, 1, 1, 1,
0.2767636, -0.2863811, 0.8367134, 1, 1, 1, 1, 1,
0.2783368, -0.7315695, 5.777711, 1, 1, 1, 1, 1,
0.2789037, -0.559938, 2.179904, 1, 1, 1, 1, 1,
0.2820601, -0.3157582, 2.705156, 1, 1, 1, 1, 1,
0.2836699, 0.3950217, 0.01110323, 1, 1, 1, 1, 1,
0.2875371, -0.9811617, 2.380251, 1, 1, 1, 1, 1,
0.2926957, -1.503668, 3.515872, 1, 1, 1, 1, 1,
0.2967732, -0.1098737, 2.178268, 1, 1, 1, 1, 1,
0.2971215, 0.2024281, 0.416492, 1, 1, 1, 1, 1,
0.3036215, 0.5343855, -0.6564205, 1, 1, 1, 1, 1,
0.3054894, 0.8745955, -0.7465597, 1, 1, 1, 1, 1,
0.3061323, 0.9423422, 1.154396, 1, 1, 1, 1, 1,
0.3084793, 0.8556998, -0.4007184, 1, 1, 1, 1, 1,
0.3094394, -1.287921, 3.155425, 1, 1, 1, 1, 1,
0.3126795, 0.6254557, 0.1932323, 0, 0, 1, 1, 1,
0.3178514, -1.398088, 3.983282, 1, 0, 0, 1, 1,
0.3179984, -0.8188227, 2.330421, 1, 0, 0, 1, 1,
0.3192372, -0.4146596, 3.228274, 1, 0, 0, 1, 1,
0.3216238, -0.8995693, 2.606383, 1, 0, 0, 1, 1,
0.3217091, 0.215116, 0.1099383, 1, 0, 0, 1, 1,
0.3241196, 0.6908242, 1.161983, 0, 0, 0, 1, 1,
0.3316775, 0.2683911, 1.789279, 0, 0, 0, 1, 1,
0.3338713, -1.128979, 3.450418, 0, 0, 0, 1, 1,
0.3341995, -2.111457, 3.79204, 0, 0, 0, 1, 1,
0.3344463, 0.0563304, 1.403679, 0, 0, 0, 1, 1,
0.3352936, 0.3365983, 0.1860876, 0, 0, 0, 1, 1,
0.3390729, 0.754975, 0.1130027, 0, 0, 0, 1, 1,
0.339924, 0.3690166, 0.3048854, 1, 1, 1, 1, 1,
0.3415034, -2.922963, 2.589872, 1, 1, 1, 1, 1,
0.3444272, 1.745468, -1.224841, 1, 1, 1, 1, 1,
0.3459195, -0.09049732, 1.530763, 1, 1, 1, 1, 1,
0.3474548, 0.7764086, 1.190023, 1, 1, 1, 1, 1,
0.3480635, -0.04565258, 0.4313397, 1, 1, 1, 1, 1,
0.3483732, -0.4338709, 1.213875, 1, 1, 1, 1, 1,
0.3486124, 0.5699522, 0.2553151, 1, 1, 1, 1, 1,
0.3492514, 0.8164029, -1.345166, 1, 1, 1, 1, 1,
0.3535482, -0.7062958, 3.096657, 1, 1, 1, 1, 1,
0.3552927, 1.155663, 1.055327, 1, 1, 1, 1, 1,
0.3554564, -0.7486965, 3.070966, 1, 1, 1, 1, 1,
0.3604316, -1.147724, 2.491052, 1, 1, 1, 1, 1,
0.3631393, -0.06196867, 0.4423344, 1, 1, 1, 1, 1,
0.3638549, 0.8419168, 1.081335, 1, 1, 1, 1, 1,
0.3639074, -1.227049, 3.068028, 0, 0, 1, 1, 1,
0.3678249, -0.2894084, 1.367315, 1, 0, 0, 1, 1,
0.3686541, -0.04608428, 1.200257, 1, 0, 0, 1, 1,
0.374114, 0.04549504, 2.292538, 1, 0, 0, 1, 1,
0.3763056, -0.5338944, 1.901407, 1, 0, 0, 1, 1,
0.3804013, -1.897813, 3.870409, 1, 0, 0, 1, 1,
0.3852536, 0.2299779, 1.52273, 0, 0, 0, 1, 1,
0.3865891, -0.03103271, 1.901093, 0, 0, 0, 1, 1,
0.3900281, -1.26733, 2.513798, 0, 0, 0, 1, 1,
0.3941289, 0.6940295, -0.09868492, 0, 0, 0, 1, 1,
0.4016266, -1.210549, 2.45449, 0, 0, 0, 1, 1,
0.4020287, 0.4151765, 1.135114, 0, 0, 0, 1, 1,
0.4049336, 0.7777095, 0.1837283, 0, 0, 0, 1, 1,
0.4097939, -0.5162146, 1.559929, 1, 1, 1, 1, 1,
0.4128478, 0.4851216, 0.1237247, 1, 1, 1, 1, 1,
0.4135962, -0.5949165, 1.220403, 1, 1, 1, 1, 1,
0.4174519, -1.814263, 3.733116, 1, 1, 1, 1, 1,
0.4262642, 0.7115458, 0.7778206, 1, 1, 1, 1, 1,
0.4268229, -0.3865437, 2.537954, 1, 1, 1, 1, 1,
0.4287249, 0.1749126, 1.418011, 1, 1, 1, 1, 1,
0.4300907, 3.531361, 2.597811, 1, 1, 1, 1, 1,
0.4305283, -0.3581521, 4.179018, 1, 1, 1, 1, 1,
0.4316899, -1.014646, 2.581792, 1, 1, 1, 1, 1,
0.4325284, 1.582059, -0.4891739, 1, 1, 1, 1, 1,
0.4370333, 0.05878501, 1.517056, 1, 1, 1, 1, 1,
0.4370716, 0.4399211, 0.503271, 1, 1, 1, 1, 1,
0.4374481, 2.012367, -2.27098, 1, 1, 1, 1, 1,
0.4408306, 1.121319, 2.235165, 1, 1, 1, 1, 1,
0.4447477, -0.6426118, 4.21264, 0, 0, 1, 1, 1,
0.4494534, -0.5352284, 2.407537, 1, 0, 0, 1, 1,
0.4513025, 0.1951181, 1.64903, 1, 0, 0, 1, 1,
0.4535288, -0.9889696, 3.02409, 1, 0, 0, 1, 1,
0.4566847, 0.9429672, -1.191049, 1, 0, 0, 1, 1,
0.4576269, 1.231175, -0.2586071, 1, 0, 0, 1, 1,
0.4588189, 0.1088898, 0.7187949, 0, 0, 0, 1, 1,
0.4590915, 0.5440541, 0.7112255, 0, 0, 0, 1, 1,
0.4593256, -1.405867, 4.094389, 0, 0, 0, 1, 1,
0.4597471, 0.6402657, 0.1987496, 0, 0, 0, 1, 1,
0.4631742, -1.657144, 3.018703, 0, 0, 0, 1, 1,
0.4692962, 0.2781827, 2.235997, 0, 0, 0, 1, 1,
0.4706268, -1.755995, 2.078779, 0, 0, 0, 1, 1,
0.471982, -0.8814452, 4.21723, 1, 1, 1, 1, 1,
0.4762485, 0.8452533, 0.8385885, 1, 1, 1, 1, 1,
0.4794255, 0.3646054, 1.292387, 1, 1, 1, 1, 1,
0.4812097, -0.1069756, 1.439071, 1, 1, 1, 1, 1,
0.4832258, -0.1393923, 2.786878, 1, 1, 1, 1, 1,
0.4850309, -0.256956, 1.335656, 1, 1, 1, 1, 1,
0.4865838, -0.03402818, 1.159687, 1, 1, 1, 1, 1,
0.4897917, 2.17663, -0.844032, 1, 1, 1, 1, 1,
0.4923928, 0.3386641, 1.354771, 1, 1, 1, 1, 1,
0.493148, 1.230909, -2.047735, 1, 1, 1, 1, 1,
0.4948896, -0.2920192, 3.489907, 1, 1, 1, 1, 1,
0.4964691, -1.758204, 1.594398, 1, 1, 1, 1, 1,
0.4969455, 1.393461, -0.2188301, 1, 1, 1, 1, 1,
0.5013916, -0.3127374, 2.13406, 1, 1, 1, 1, 1,
0.5031118, -1.189622, 2.44192, 1, 1, 1, 1, 1,
0.5246338, 1.637012, 0.7915214, 0, 0, 1, 1, 1,
0.5287641, -1.286653, 2.795073, 1, 0, 0, 1, 1,
0.5307693, 2.073259, 1.246249, 1, 0, 0, 1, 1,
0.5340017, -0.101871, 1.240824, 1, 0, 0, 1, 1,
0.5353721, 1.138303, 0.3309955, 1, 0, 0, 1, 1,
0.5359659, -0.1974072, 3.100614, 1, 0, 0, 1, 1,
0.5378027, 0.7824086, 3.021176, 0, 0, 0, 1, 1,
0.5384352, -0.9809207, 1.711982, 0, 0, 0, 1, 1,
0.5468158, -0.6162816, 1.436612, 0, 0, 0, 1, 1,
0.5480093, 0.152619, 2.342771, 0, 0, 0, 1, 1,
0.5500832, -1.215547, 3.670604, 0, 0, 0, 1, 1,
0.5502136, 0.3943995, 0.8315902, 0, 0, 0, 1, 1,
0.5526774, 1.389529, -1.163329, 0, 0, 0, 1, 1,
0.552981, 0.06446158, 2.459828, 1, 1, 1, 1, 1,
0.5557037, -1.076413, 2.177059, 1, 1, 1, 1, 1,
0.5684381, -0.01675911, 2.80927, 1, 1, 1, 1, 1,
0.5740878, 1.427773, -0.02225494, 1, 1, 1, 1, 1,
0.5779788, 0.9386987, 1.066811, 1, 1, 1, 1, 1,
0.5808051, 0.5247344, -0.1554707, 1, 1, 1, 1, 1,
0.5918266, -1.359741, 5.231512, 1, 1, 1, 1, 1,
0.5937914, 0.3595221, 0.6704955, 1, 1, 1, 1, 1,
0.5973132, -1.339903, 1.831328, 1, 1, 1, 1, 1,
0.5981252, 0.2255352, 3.23373, 1, 1, 1, 1, 1,
0.6061918, -0.6883591, 2.047705, 1, 1, 1, 1, 1,
0.6071782, -0.0341717, 1.256637, 1, 1, 1, 1, 1,
0.6072352, -0.09247842, 0.5898215, 1, 1, 1, 1, 1,
0.6081215, 0.5691754, 0.6637956, 1, 1, 1, 1, 1,
0.6091334, -0.9085006, 3.522012, 1, 1, 1, 1, 1,
0.6129513, -0.4038567, 1.318064, 0, 0, 1, 1, 1,
0.6174211, 2.595097, 0.5828081, 1, 0, 0, 1, 1,
0.6178961, -0.7618771, 2.958097, 1, 0, 0, 1, 1,
0.6243783, -0.07231954, 2.556601, 1, 0, 0, 1, 1,
0.6249056, 0.7774572, 2.75532, 1, 0, 0, 1, 1,
0.6292102, 0.26903, 1.422651, 1, 0, 0, 1, 1,
0.6303433, 1.027039, 0.4538399, 0, 0, 0, 1, 1,
0.6346456, 0.3217266, 1.23534, 0, 0, 0, 1, 1,
0.6354632, 0.5446692, 1.864191, 0, 0, 0, 1, 1,
0.6418409, -1.449096, 2.934261, 0, 0, 0, 1, 1,
0.6453015, -1.543553, 1.563119, 0, 0, 0, 1, 1,
0.6467268, 2.441861, 1.314202, 0, 0, 0, 1, 1,
0.6476252, -0.1209478, 3.124202, 0, 0, 0, 1, 1,
0.6504241, -0.2173276, 2.450553, 1, 1, 1, 1, 1,
0.6518607, -1.958429, 1.878925, 1, 1, 1, 1, 1,
0.6519956, -0.00255499, 1.556445, 1, 1, 1, 1, 1,
0.6548406, 0.5953217, 4.440683, 1, 1, 1, 1, 1,
0.6573605, 1.00029, 1.337319, 1, 1, 1, 1, 1,
0.6575282, 1.456958, -1.399588, 1, 1, 1, 1, 1,
0.6621404, -0.07779732, 2.674764, 1, 1, 1, 1, 1,
0.6694918, -0.2128817, 3.590189, 1, 1, 1, 1, 1,
0.6696395, -0.1048441, 0.298589, 1, 1, 1, 1, 1,
0.6764756, 1.553542, -1.714855, 1, 1, 1, 1, 1,
0.6942075, 1.826913, 1.001934, 1, 1, 1, 1, 1,
0.6948823, -0.4105137, 0.6010064, 1, 1, 1, 1, 1,
0.6982306, -1.344082, 3.696156, 1, 1, 1, 1, 1,
0.698487, 0.4555867, -0.2526879, 1, 1, 1, 1, 1,
0.7009228, -0.3848664, 1.472012, 1, 1, 1, 1, 1,
0.7087705, -0.9769031, 1.914416, 0, 0, 1, 1, 1,
0.7102877, -0.2316162, 2.024086, 1, 0, 0, 1, 1,
0.7104747, 1.006529, -0.8921214, 1, 0, 0, 1, 1,
0.7116946, -0.02361748, 0.4436284, 1, 0, 0, 1, 1,
0.7133343, -0.3474006, 3.390671, 1, 0, 0, 1, 1,
0.7134511, -2.787817, 2.666172, 1, 0, 0, 1, 1,
0.7156247, -1.558947, 2.439414, 0, 0, 0, 1, 1,
0.7157162, -1.191857, 1.513534, 0, 0, 0, 1, 1,
0.7201161, -0.1735703, 0.6178086, 0, 0, 0, 1, 1,
0.7209851, 2.323768, 0.9925222, 0, 0, 0, 1, 1,
0.7220085, -0.4732224, 1.185231, 0, 0, 0, 1, 1,
0.7259005, 0.9405214, 0.6792585, 0, 0, 0, 1, 1,
0.7276558, -1.463139, 2.47158, 0, 0, 0, 1, 1,
0.7276672, -0.5657582, 1.855027, 1, 1, 1, 1, 1,
0.7332529, 1.023746, 1.261588, 1, 1, 1, 1, 1,
0.7339622, 0.009061584, 1.347619, 1, 1, 1, 1, 1,
0.7352566, 0.8485866, 0.08659002, 1, 1, 1, 1, 1,
0.736033, -2.182476, 3.911839, 1, 1, 1, 1, 1,
0.7409068, 0.2403614, 0.3698304, 1, 1, 1, 1, 1,
0.7454744, 0.190978, 0.8558074, 1, 1, 1, 1, 1,
0.7494977, -1.324664, 2.146136, 1, 1, 1, 1, 1,
0.7513965, 0.04449745, 1.934573, 1, 1, 1, 1, 1,
0.7531929, -1.990717, 1.710033, 1, 1, 1, 1, 1,
0.757785, -0.8969368, 1.204219, 1, 1, 1, 1, 1,
0.761883, 2.581359, 0.7642908, 1, 1, 1, 1, 1,
0.7622702, -0.3726463, 2.663736, 1, 1, 1, 1, 1,
0.7640967, -0.5832298, 2.739526, 1, 1, 1, 1, 1,
0.7655367, 0.2580401, 1.016111, 1, 1, 1, 1, 1,
0.7685269, -0.2773952, 0.8966637, 0, 0, 1, 1, 1,
0.7737399, -0.9092916, 4.164815, 1, 0, 0, 1, 1,
0.7743452, 0.4976539, 1.227075, 1, 0, 0, 1, 1,
0.7825266, 1.863384, -0.821191, 1, 0, 0, 1, 1,
0.8035756, -1.337013, 2.655819, 1, 0, 0, 1, 1,
0.807564, -1.27269, 2.291401, 1, 0, 0, 1, 1,
0.8183016, -0.3927707, 1.860519, 0, 0, 0, 1, 1,
0.8206246, 0.9335253, 1.410524, 0, 0, 0, 1, 1,
0.8243034, -0.937761, 1.735863, 0, 0, 0, 1, 1,
0.8249902, -0.2443746, 1.425356, 0, 0, 0, 1, 1,
0.8273361, -0.3239402, 1.380731, 0, 0, 0, 1, 1,
0.8290548, 0.267324, 2.136452, 0, 0, 0, 1, 1,
0.829436, 0.4055292, 1.27395, 0, 0, 0, 1, 1,
0.8315407, -1.123551, 3.588323, 1, 1, 1, 1, 1,
0.833737, -1.969779, 3.286524, 1, 1, 1, 1, 1,
0.8369197, 1.853157, 2.305436, 1, 1, 1, 1, 1,
0.8390743, 0.2868694, 1.861838, 1, 1, 1, 1, 1,
0.8437625, -1.915016, 3.40441, 1, 1, 1, 1, 1,
0.8444281, 0.01018665, 0.952536, 1, 1, 1, 1, 1,
0.845704, 1.361608, 1.972115, 1, 1, 1, 1, 1,
0.8510009, 0.006663243, 0.3118103, 1, 1, 1, 1, 1,
0.8532252, -1.723763, 0.7548233, 1, 1, 1, 1, 1,
0.8536819, 0.3614575, 2.071343, 1, 1, 1, 1, 1,
0.8601973, -1.034629, 1.826439, 1, 1, 1, 1, 1,
0.8604714, -1.250218, 2.90052, 1, 1, 1, 1, 1,
0.8622971, -1.242568, 4.123271, 1, 1, 1, 1, 1,
0.8645676, 1.451318, 1.045664, 1, 1, 1, 1, 1,
0.8656973, 0.2587965, 1.673999, 1, 1, 1, 1, 1,
0.8680526, 0.5278, -1.039863, 0, 0, 1, 1, 1,
0.8693972, -0.964384, 2.861027, 1, 0, 0, 1, 1,
0.8834271, -0.3189719, 1.748931, 1, 0, 0, 1, 1,
0.8867536, -1.217547, 1.754683, 1, 0, 0, 1, 1,
0.8875346, 1.891567, 0.4723238, 1, 0, 0, 1, 1,
0.8928619, -1.522275, 2.465922, 1, 0, 0, 1, 1,
0.8978108, 1.227998, 0.5812683, 0, 0, 0, 1, 1,
0.9002042, -0.793285, 2.234312, 0, 0, 0, 1, 1,
0.9060863, 0.6730938, 1.878861, 0, 0, 0, 1, 1,
0.9187533, 0.8488507, 0.5672809, 0, 0, 0, 1, 1,
0.9248984, 2.279763, -1.327711, 0, 0, 0, 1, 1,
0.9249424, -0.4764827, 1.814044, 0, 0, 0, 1, 1,
0.931327, 0.7273794, 1.913135, 0, 0, 0, 1, 1,
0.9334281, 0.5608293, 0.0578255, 1, 1, 1, 1, 1,
0.9455208, -1.307125, 0.3248808, 1, 1, 1, 1, 1,
0.9520757, -0.9296215, 2.924176, 1, 1, 1, 1, 1,
0.9527227, -0.4161541, 2.439238, 1, 1, 1, 1, 1,
0.9590972, 0.4597769, -0.09224436, 1, 1, 1, 1, 1,
0.9604995, -0.7974904, 2.193947, 1, 1, 1, 1, 1,
0.9612162, 0.2426297, 1.060927, 1, 1, 1, 1, 1,
0.965861, -1.109124, 0.8075199, 1, 1, 1, 1, 1,
0.9706349, -0.07000792, 1.561455, 1, 1, 1, 1, 1,
0.9769835, -0.9905941, 1.944066, 1, 1, 1, 1, 1,
0.977196, 0.2636618, 2.722775, 1, 1, 1, 1, 1,
0.978908, 0.7003121, 2.861721, 1, 1, 1, 1, 1,
0.9820709, -0.3250702, 2.856761, 1, 1, 1, 1, 1,
0.9865608, 0.2178571, 1.738746, 1, 1, 1, 1, 1,
0.9881358, 0.523997, 1.441128, 1, 1, 1, 1, 1,
0.9885706, -0.4694939, 1.241394, 0, 0, 1, 1, 1,
0.9972579, -1.2175, 1.899107, 1, 0, 0, 1, 1,
0.9989397, -0.7788911, 2.819649, 1, 0, 0, 1, 1,
1.003353, 1.256609, -0.6961228, 1, 0, 0, 1, 1,
1.003657, -0.1381379, 3.157776, 1, 0, 0, 1, 1,
1.0104, 0.2753511, 1.407051, 1, 0, 0, 1, 1,
1.039267, -0.03678932, 2.285015, 0, 0, 0, 1, 1,
1.042725, -0.2133158, 2.51287, 0, 0, 0, 1, 1,
1.043846, -1.311626, 2.735152, 0, 0, 0, 1, 1,
1.04705, 0.3525416, -0.8739947, 0, 0, 0, 1, 1,
1.047755, 2.509783, -1.207953, 0, 0, 0, 1, 1,
1.047893, -0.124753, 1.404205, 0, 0, 0, 1, 1,
1.054132, -1.047666, 2.39585, 0, 0, 0, 1, 1,
1.054636, 0.2655533, -0.6078544, 1, 1, 1, 1, 1,
1.057748, -1.899687, 3.436245, 1, 1, 1, 1, 1,
1.060263, -2.317582, 5.066108, 1, 1, 1, 1, 1,
1.075365, 0.8732373, 1.245913, 1, 1, 1, 1, 1,
1.075861, -0.01923252, 0.9111727, 1, 1, 1, 1, 1,
1.078482, 0.1197402, -0.1131797, 1, 1, 1, 1, 1,
1.083287, 0.9040408, 1.757654, 1, 1, 1, 1, 1,
1.090247, -0.7078907, 2.562588, 1, 1, 1, 1, 1,
1.096206, -1.385689, 1.279486, 1, 1, 1, 1, 1,
1.100497, -0.579289, 0.4405484, 1, 1, 1, 1, 1,
1.103819, 0.7184075, 1.126209, 1, 1, 1, 1, 1,
1.108583, -1.047327, 3.55677, 1, 1, 1, 1, 1,
1.112447, 1.153786, -0.8503977, 1, 1, 1, 1, 1,
1.118399, 0.6705019, 2.132085, 1, 1, 1, 1, 1,
1.127944, -1.027964, 0.8484993, 1, 1, 1, 1, 1,
1.128837, 0.7270138, 0.9326461, 0, 0, 1, 1, 1,
1.137125, -0.5221378, 4.178192, 1, 0, 0, 1, 1,
1.139779, 0.6892403, 0.1600326, 1, 0, 0, 1, 1,
1.147838, 0.04225155, 0.2188251, 1, 0, 0, 1, 1,
1.156184, 0.5470359, -0.5041127, 1, 0, 0, 1, 1,
1.156511, -0.8022275, 2.468598, 1, 0, 0, 1, 1,
1.158242, 0.4922552, 0.568186, 0, 0, 0, 1, 1,
1.158315, 2.326299, 0.9382943, 0, 0, 0, 1, 1,
1.158339, -0.6869118, 1.077726, 0, 0, 0, 1, 1,
1.161634, -1.244044, 2.715799, 0, 0, 0, 1, 1,
1.161896, 0.7142006, 1.046292, 0, 0, 0, 1, 1,
1.16399, -1.486257, 2.54928, 0, 0, 0, 1, 1,
1.16936, -0.06943937, 1.09587, 0, 0, 0, 1, 1,
1.173526, 1.112199, 0.7870006, 1, 1, 1, 1, 1,
1.17946, -1.24277, 1.593296, 1, 1, 1, 1, 1,
1.181578, -0.9539587, 2.383761, 1, 1, 1, 1, 1,
1.188386, -1.287275, 2.936083, 1, 1, 1, 1, 1,
1.195543, 1.220018, 2.528022, 1, 1, 1, 1, 1,
1.210056, 1.370137, 1.790103, 1, 1, 1, 1, 1,
1.213521, -0.5556458, 3.335056, 1, 1, 1, 1, 1,
1.224489, 0.1820892, -0.3623869, 1, 1, 1, 1, 1,
1.227858, 1.37717, 0.165548, 1, 1, 1, 1, 1,
1.229019, 0.03909068, 3.123613, 1, 1, 1, 1, 1,
1.232921, 1.563252, 0.4805672, 1, 1, 1, 1, 1,
1.235456, -0.1434618, 0.7074136, 1, 1, 1, 1, 1,
1.245504, -0.3167033, 2.812764, 1, 1, 1, 1, 1,
1.247801, 0.08168691, 2.813458, 1, 1, 1, 1, 1,
1.250396, 0.3990484, 1.63564, 1, 1, 1, 1, 1,
1.251048, 1.515366, 0.4985043, 0, 0, 1, 1, 1,
1.252044, 2.491943, -0.07099099, 1, 0, 0, 1, 1,
1.252772, -1.172746, 3.032223, 1, 0, 0, 1, 1,
1.256583, -1.235127, 2.589517, 1, 0, 0, 1, 1,
1.257583, 1.439202, -1.067983, 1, 0, 0, 1, 1,
1.260955, 0.415491, 1.781995, 1, 0, 0, 1, 1,
1.268632, -0.9868791, 3.673237, 0, 0, 0, 1, 1,
1.275262, -1.00607, -0.3569031, 0, 0, 0, 1, 1,
1.27707, 0.4183795, 2.244583, 0, 0, 0, 1, 1,
1.287081, 0.07170482, 1.463218, 0, 0, 0, 1, 1,
1.294009, 1.266556, 0.7058222, 0, 0, 0, 1, 1,
1.297285, 0.07271011, 2.587177, 0, 0, 0, 1, 1,
1.298583, -0.199653, -0.5460009, 0, 0, 0, 1, 1,
1.302151, 0.2550018, 1.506687, 1, 1, 1, 1, 1,
1.308154, 1.001403, 1.267841, 1, 1, 1, 1, 1,
1.319241, 0.2962511, 0.7247032, 1, 1, 1, 1, 1,
1.326976, -2.159867, 1.409799, 1, 1, 1, 1, 1,
1.32914, 0.8668256, 0.2449476, 1, 1, 1, 1, 1,
1.33276, -0.5807478, 1.220692, 1, 1, 1, 1, 1,
1.341049, 0.7021919, 1.502673, 1, 1, 1, 1, 1,
1.343776, 1.105116, 1.132747, 1, 1, 1, 1, 1,
1.344838, 0.4640642, 0.7364896, 1, 1, 1, 1, 1,
1.350105, -0.7378269, 1.368838, 1, 1, 1, 1, 1,
1.355495, -0.5283926, 2.312987, 1, 1, 1, 1, 1,
1.364164, -0.3732254, 2.892339, 1, 1, 1, 1, 1,
1.367965, -0.6896678, 2.339017, 1, 1, 1, 1, 1,
1.368739, 1.741082, 1.379539, 1, 1, 1, 1, 1,
1.370588, 0.8491754, 1.441982, 1, 1, 1, 1, 1,
1.372612, 0.5913187, 1.036755, 0, 0, 1, 1, 1,
1.373937, 1.698312, -0.2193122, 1, 0, 0, 1, 1,
1.380274, 0.9935629, 1.059364, 1, 0, 0, 1, 1,
1.389951, 0.1548995, -0.9496756, 1, 0, 0, 1, 1,
1.401603, -0.2347605, 2.725799, 1, 0, 0, 1, 1,
1.408758, 0.01275347, 1.4179, 1, 0, 0, 1, 1,
1.426432, 0.9752291, 1.33011, 0, 0, 0, 1, 1,
1.43895, 0.6468198, 1.048435, 0, 0, 0, 1, 1,
1.446614, -1.569039, 3.457367, 0, 0, 0, 1, 1,
1.475742, 1.639364, -1.789258, 0, 0, 0, 1, 1,
1.47794, 1.731279, 1.651328, 0, 0, 0, 1, 1,
1.478963, 0.7813915, -0.1344518, 0, 0, 0, 1, 1,
1.524177, -0.8573385, 3.335207, 0, 0, 0, 1, 1,
1.525694, -1.077892, 2.945562, 1, 1, 1, 1, 1,
1.527693, 0.0009836013, 1.762351, 1, 1, 1, 1, 1,
1.533931, -1.294769, 1.717218, 1, 1, 1, 1, 1,
1.535924, -1.571207, 2.369215, 1, 1, 1, 1, 1,
1.543093, -0.958501, 0.4192208, 1, 1, 1, 1, 1,
1.55293, 2.223652, 1.521964, 1, 1, 1, 1, 1,
1.553182, 0.7256821, 2.687882, 1, 1, 1, 1, 1,
1.553657, 0.3547353, 1.451551, 1, 1, 1, 1, 1,
1.56743, 1.900573, 0.4576156, 1, 1, 1, 1, 1,
1.575348, -0.08435016, 0.6773537, 1, 1, 1, 1, 1,
1.600123, -0.1918699, 1.754011, 1, 1, 1, 1, 1,
1.612114, -0.5469946, 2.324906, 1, 1, 1, 1, 1,
1.617972, -1.105586, 2.812827, 1, 1, 1, 1, 1,
1.631518, 0.1128398, 1.209881, 1, 1, 1, 1, 1,
1.637974, -0.8709502, 2.468524, 1, 1, 1, 1, 1,
1.645113, -0.01730107, 1.565807, 0, 0, 1, 1, 1,
1.64538, 2.402175, 0.5441428, 1, 0, 0, 1, 1,
1.655541, -0.7938069, 0.9282756, 1, 0, 0, 1, 1,
1.667254, 0.9627382, 1.168941, 1, 0, 0, 1, 1,
1.677008, 1.773348, 2.523612, 1, 0, 0, 1, 1,
1.707116, 1.839191, 1.042774, 1, 0, 0, 1, 1,
1.716306, 0.2128622, 2.278955, 0, 0, 0, 1, 1,
1.720195, 2.081663, 0.1416074, 0, 0, 0, 1, 1,
1.72117, 1.311064, -0.2326307, 0, 0, 0, 1, 1,
1.732961, 0.5613151, -0.973908, 0, 0, 0, 1, 1,
1.760784, -0.1129804, 0.3244454, 0, 0, 0, 1, 1,
1.767404, 0.5383241, 0.9212507, 0, 0, 0, 1, 1,
1.76972, -0.6053645, 0.9234573, 0, 0, 0, 1, 1,
1.785609, 1.156602, 1.840447, 1, 1, 1, 1, 1,
1.788929, -0.0506386, 2.271883, 1, 1, 1, 1, 1,
1.82467, 0.4249863, 3.479491, 1, 1, 1, 1, 1,
1.849651, -0.007059081, 0.4633861, 1, 1, 1, 1, 1,
1.857957, 1.644517, 2.055762, 1, 1, 1, 1, 1,
1.869256, -2.556228, 2.022877, 1, 1, 1, 1, 1,
1.902491, 1.56364, 1.390357, 1, 1, 1, 1, 1,
1.907705, 0.4772254, 1.151596, 1, 1, 1, 1, 1,
1.925155, -0.4659225, 0.3259572, 1, 1, 1, 1, 1,
1.936999, -0.98089, 3.123987, 1, 1, 1, 1, 1,
1.962826, -0.06530438, 2.040022, 1, 1, 1, 1, 1,
1.980201, 0.00214394, 1.055557, 1, 1, 1, 1, 1,
1.998561, -0.5359831, 2.612917, 1, 1, 1, 1, 1,
2.010581, 0.6790429, 1.487561, 1, 1, 1, 1, 1,
2.039367, 0.2972268, 0.3366752, 1, 1, 1, 1, 1,
2.042361, 0.004955095, 3.815987, 0, 0, 1, 1, 1,
2.079505, -1.349975, 2.33003, 1, 0, 0, 1, 1,
2.185115, 0.5106081, 2.009643, 1, 0, 0, 1, 1,
2.201404, 0.3186549, 0.03615797, 1, 0, 0, 1, 1,
2.203681, -1.300121, 2.433336, 1, 0, 0, 1, 1,
2.471192, 0.455117, 2.193436, 1, 0, 0, 1, 1,
2.475192, -1.787833, 3.051857, 0, 0, 0, 1, 1,
2.484788, -1.070035, 2.558119, 0, 0, 0, 1, 1,
2.493549, -0.8594529, 1.605589, 0, 0, 0, 1, 1,
2.497548, -1.299127, 2.699888, 0, 0, 0, 1, 1,
2.551162, -0.1436049, 2.392927, 0, 0, 0, 1, 1,
2.564629, 0.3332821, 1.677557, 0, 0, 0, 1, 1,
2.600762, 0.7745522, 1.593918, 0, 0, 0, 1, 1,
2.670105, 0.1828104, 2.955458, 1, 1, 1, 1, 1,
2.690815, -1.402315, 3.102945, 1, 1, 1, 1, 1,
2.743542, 0.8567105, 0.9969778, 1, 1, 1, 1, 1,
2.7885, -0.5801227, 1.224275, 1, 1, 1, 1, 1,
2.807795, 0.1275067, 1.193531, 1, 1, 1, 1, 1,
3.25534, 0.3360934, 2.375246, 1, 1, 1, 1, 1,
3.338938, 0.4178311, 0.235481, 1, 1, 1, 1, 1
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
var radius = 9.928885;
var distance = 34.87479;
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
mvMatrix.translate( -0.2480232, -0.05500221, -0.09190679 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.87479);
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
