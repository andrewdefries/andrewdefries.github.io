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
-3.171061, -0.9552104, -1.909362, 1, 0, 0, 1,
-3.117664, 0.4235291, -2.98359, 1, 0.007843138, 0, 1,
-2.678447, 0.3266883, -1.648761, 1, 0.01176471, 0, 1,
-2.518061, -0.5917735, -1.752088, 1, 0.01960784, 0, 1,
-2.506526, 0.8193418, 0.5325936, 1, 0.02352941, 0, 1,
-2.490241, 1.955796, -1.376533, 1, 0.03137255, 0, 1,
-2.47342, 1.665123, -1.271417, 1, 0.03529412, 0, 1,
-2.399341, -1.765974, -2.606831, 1, 0.04313726, 0, 1,
-2.345822, -0.3679785, -1.299531, 1, 0.04705882, 0, 1,
-2.329509, 0.04885505, -0.6949829, 1, 0.05490196, 0, 1,
-2.305091, 0.4189174, -0.7024395, 1, 0.05882353, 0, 1,
-2.292039, -0.6837181, -1.206983, 1, 0.06666667, 0, 1,
-2.272243, -0.5158613, -0.3482452, 1, 0.07058824, 0, 1,
-2.16552, -0.5365862, -0.7792903, 1, 0.07843138, 0, 1,
-2.16055, 0.8665497, -1.710827, 1, 0.08235294, 0, 1,
-2.147694, -0.2877043, -1.419425, 1, 0.09019608, 0, 1,
-2.12815, -1.729026, -2.573734, 1, 0.09411765, 0, 1,
-2.127301, 1.243303, -0.929875, 1, 0.1019608, 0, 1,
-2.098237, -1.494221, -3.223372, 1, 0.1098039, 0, 1,
-1.987851, 0.8431236, -1.370741, 1, 0.1137255, 0, 1,
-1.947392, -0.7580067, -1.371963, 1, 0.1215686, 0, 1,
-1.938612, -0.3690404, -2.877798, 1, 0.1254902, 0, 1,
-1.935976, 0.2479035, -0.4268351, 1, 0.1333333, 0, 1,
-1.914647, -0.1848145, -0.5228786, 1, 0.1372549, 0, 1,
-1.890686, -0.1561653, -1.915876, 1, 0.145098, 0, 1,
-1.884172, 0.7287779, -1.275134, 1, 0.1490196, 0, 1,
-1.86935, 0.2053615, -0.990048, 1, 0.1568628, 0, 1,
-1.868567, 0.08008082, -2.870452, 1, 0.1607843, 0, 1,
-1.85964, -0.4130544, -1.869646, 1, 0.1686275, 0, 1,
-1.850743, -0.2437855, -1.171026, 1, 0.172549, 0, 1,
-1.823459, 0.3548591, -1.407718, 1, 0.1803922, 0, 1,
-1.815662, 1.012297, -0.6446658, 1, 0.1843137, 0, 1,
-1.790243, 0.6690288, -0.480617, 1, 0.1921569, 0, 1,
-1.782206, -0.7938678, -1.89888, 1, 0.1960784, 0, 1,
-1.776061, 1.329443, -1.835154, 1, 0.2039216, 0, 1,
-1.775899, -2.454355, -2.727734, 1, 0.2117647, 0, 1,
-1.75942, -1.052475, -1.449311, 1, 0.2156863, 0, 1,
-1.745159, -0.3791023, -0.975936, 1, 0.2235294, 0, 1,
-1.712121, -1.137371, -2.631767, 1, 0.227451, 0, 1,
-1.702622, -0.9446298, -2.626497, 1, 0.2352941, 0, 1,
-1.701287, -0.3360316, -2.103384, 1, 0.2392157, 0, 1,
-1.689464, -1.267607, -2.463538, 1, 0.2470588, 0, 1,
-1.682692, 0.1627055, -2.74466, 1, 0.2509804, 0, 1,
-1.680465, 0.6839805, 0.1256315, 1, 0.2588235, 0, 1,
-1.665177, 0.2687044, -4.415555, 1, 0.2627451, 0, 1,
-1.66376, 0.248534, -1.391887, 1, 0.2705882, 0, 1,
-1.652673, 0.6899522, -0.777201, 1, 0.2745098, 0, 1,
-1.645219, 0.4101685, -0.3622951, 1, 0.282353, 0, 1,
-1.625878, -1.237164, -3.257071, 1, 0.2862745, 0, 1,
-1.623851, 2.607801, -0.2706192, 1, 0.2941177, 0, 1,
-1.6166, -0.4827293, -0.647958, 1, 0.3019608, 0, 1,
-1.60939, -0.9200185, -1.867922, 1, 0.3058824, 0, 1,
-1.609061, 0.1545891, -0.4731481, 1, 0.3137255, 0, 1,
-1.608983, -0.9501806, -2.76905, 1, 0.3176471, 0, 1,
-1.607567, 0.325957, -1.153783, 1, 0.3254902, 0, 1,
-1.596794, -2.414898, -5.175808, 1, 0.3294118, 0, 1,
-1.588783, 2.730948, 0.05624272, 1, 0.3372549, 0, 1,
-1.583094, -1.174565, -0.144552, 1, 0.3411765, 0, 1,
-1.58295, -1.0111, -1.487338, 1, 0.3490196, 0, 1,
-1.579878, 1.645283, -0.5249071, 1, 0.3529412, 0, 1,
-1.566633, -0.6484886, 0.109165, 1, 0.3607843, 0, 1,
-1.558376, -0.8429188, -2.562932, 1, 0.3647059, 0, 1,
-1.553463, -1.683122, -3.078836, 1, 0.372549, 0, 1,
-1.551494, -0.8369518, -1.481156, 1, 0.3764706, 0, 1,
-1.550329, 0.272224, -0.571408, 1, 0.3843137, 0, 1,
-1.543669, -0.1384529, -0.05631273, 1, 0.3882353, 0, 1,
-1.535197, 0.6139857, -0.5670692, 1, 0.3960784, 0, 1,
-1.508032, 0.8400884, -1.140453, 1, 0.4039216, 0, 1,
-1.496749, -0.01057758, -0.8070887, 1, 0.4078431, 0, 1,
-1.474906, 0.5925277, -2.163443, 1, 0.4156863, 0, 1,
-1.471191, -0.7735154, -0.2475335, 1, 0.4196078, 0, 1,
-1.469241, 1.804531, -1.388863, 1, 0.427451, 0, 1,
-1.464954, 0.06261025, -0.4999948, 1, 0.4313726, 0, 1,
-1.4612, -0.544034, -3.991698, 1, 0.4392157, 0, 1,
-1.458872, -0.2846732, -2.733377, 1, 0.4431373, 0, 1,
-1.456855, 0.1675295, -1.119159, 1, 0.4509804, 0, 1,
-1.454912, 0.4759966, -2.13548, 1, 0.454902, 0, 1,
-1.452851, -0.4213935, -3.835414, 1, 0.4627451, 0, 1,
-1.440709, 1.249139, -0.4176781, 1, 0.4666667, 0, 1,
-1.434838, 0.6640759, -0.2452493, 1, 0.4745098, 0, 1,
-1.42965, 2.447202, -1.012311, 1, 0.4784314, 0, 1,
-1.411842, -0.8948092, -0.7910205, 1, 0.4862745, 0, 1,
-1.411008, 0.6260859, -0.278198, 1, 0.4901961, 0, 1,
-1.407776, -0.5247869, -1.148272, 1, 0.4980392, 0, 1,
-1.399202, 0.01108813, -1.83991, 1, 0.5058824, 0, 1,
-1.39386, 0.1374497, -1.611614, 1, 0.509804, 0, 1,
-1.390055, -1.069814, -2.49871, 1, 0.5176471, 0, 1,
-1.387706, 1.388203, -0.6112182, 1, 0.5215687, 0, 1,
-1.382029, -0.7898114, -2.409383, 1, 0.5294118, 0, 1,
-1.364963, -0.2391336, -2.13783, 1, 0.5333334, 0, 1,
-1.364889, 0.955161, 0.6623598, 1, 0.5411765, 0, 1,
-1.362788, 0.6111345, -1.279525, 1, 0.5450981, 0, 1,
-1.356239, -1.139411, -2.452244, 1, 0.5529412, 0, 1,
-1.344879, -0.2120071, -1.546816, 1, 0.5568628, 0, 1,
-1.343466, -1.334827, -2.467955, 1, 0.5647059, 0, 1,
-1.339386, 0.4821323, -1.408788, 1, 0.5686275, 0, 1,
-1.320034, -0.1552577, -1.583882, 1, 0.5764706, 0, 1,
-1.319952, 0.007667262, -1.616529, 1, 0.5803922, 0, 1,
-1.319257, 0.5226796, -0.8432794, 1, 0.5882353, 0, 1,
-1.317813, 0.7163116, -0.6491438, 1, 0.5921569, 0, 1,
-1.306935, 0.2144499, -0.5201228, 1, 0.6, 0, 1,
-1.306035, 0.7496091, -1.172186, 1, 0.6078432, 0, 1,
-1.305647, 0.1703874, -1.799561, 1, 0.6117647, 0, 1,
-1.298437, 0.3613826, -1.53748, 1, 0.6196079, 0, 1,
-1.286606, -0.3542394, -1.891096, 1, 0.6235294, 0, 1,
-1.286526, -0.4793675, -3.538831, 1, 0.6313726, 0, 1,
-1.263839, -0.6594616, -1.774079, 1, 0.6352941, 0, 1,
-1.261307, 3.616441, -1.062752, 1, 0.6431373, 0, 1,
-1.249423, 0.02643731, -2.602389, 1, 0.6470588, 0, 1,
-1.249143, -0.131916, -0.2397105, 1, 0.654902, 0, 1,
-1.245562, -0.249637, -1.287467, 1, 0.6588235, 0, 1,
-1.24261, -0.8368323, -0.6508765, 1, 0.6666667, 0, 1,
-1.237082, -0.9595122, -3.468104, 1, 0.6705883, 0, 1,
-1.212436, 0.312335, -1.073155, 1, 0.6784314, 0, 1,
-1.21203, 1.247086, -0.01143385, 1, 0.682353, 0, 1,
-1.20462, -0.4392422, -3.454849, 1, 0.6901961, 0, 1,
-1.201469, -0.7283568, -2.518955, 1, 0.6941177, 0, 1,
-1.190492, 1.250183, -0.6521596, 1, 0.7019608, 0, 1,
-1.188102, -1.640205, -2.476162, 1, 0.7098039, 0, 1,
-1.178522, 0.7760226, -1.248648, 1, 0.7137255, 0, 1,
-1.177519, -0.3889717, -1.493191, 1, 0.7215686, 0, 1,
-1.17593, -1.080778, -0.8067458, 1, 0.7254902, 0, 1,
-1.175165, 0.1373496, -1.625547, 1, 0.7333333, 0, 1,
-1.163497, 0.2443386, -3.064884, 1, 0.7372549, 0, 1,
-1.161847, 0.3011214, 0.6068579, 1, 0.7450981, 0, 1,
-1.154494, 0.7428533, -0.4540446, 1, 0.7490196, 0, 1,
-1.147134, 0.2634368, -3.155032, 1, 0.7568628, 0, 1,
-1.141965, 1.985777, -0.5557432, 1, 0.7607843, 0, 1,
-1.14019, 2.429635, 0.7507306, 1, 0.7686275, 0, 1,
-1.140084, -0.01322816, -0.7433712, 1, 0.772549, 0, 1,
-1.136598, -0.04854144, -1.067549, 1, 0.7803922, 0, 1,
-1.132032, -1.963431, -1.669614, 1, 0.7843137, 0, 1,
-1.119728, -0.5901749, -1.978682, 1, 0.7921569, 0, 1,
-1.115898, 0.08321099, -0.07094822, 1, 0.7960784, 0, 1,
-1.112797, 1.560411, -0.3234595, 1, 0.8039216, 0, 1,
-1.111169, 0.04442037, -1.394785, 1, 0.8117647, 0, 1,
-1.111161, -0.1244847, -0.9500635, 1, 0.8156863, 0, 1,
-1.102553, -0.4413053, -2.45058, 1, 0.8235294, 0, 1,
-1.098972, 1.199558, -1.776657, 1, 0.827451, 0, 1,
-1.097138, -1.591442, -1.141617, 1, 0.8352941, 0, 1,
-1.095232, -1.077423, -1.073597, 1, 0.8392157, 0, 1,
-1.093572, 0.685654, -1.281811, 1, 0.8470588, 0, 1,
-1.092387, 0.916465, -1.087302, 1, 0.8509804, 0, 1,
-1.082748, 0.3947207, -0.3026246, 1, 0.8588235, 0, 1,
-1.081372, -0.7665686, -2.216903, 1, 0.8627451, 0, 1,
-1.078537, -0.4408375, -1.514116, 1, 0.8705882, 0, 1,
-1.071492, -0.1702565, -0.6479589, 1, 0.8745098, 0, 1,
-1.070723, -0.1109555, -0.6462339, 1, 0.8823529, 0, 1,
-1.069372, -0.4831081, -1.469565, 1, 0.8862745, 0, 1,
-1.067849, -1.150018, -2.22805, 1, 0.8941177, 0, 1,
-1.067503, -0.9204426, -0.1905322, 1, 0.8980392, 0, 1,
-1.056248, -0.5885663, -1.996739, 1, 0.9058824, 0, 1,
-1.055541, 0.5960245, -0.6701211, 1, 0.9137255, 0, 1,
-1.044318, 0.9674367, -0.7404746, 1, 0.9176471, 0, 1,
-1.04214, 0.1994624, -2.212498, 1, 0.9254902, 0, 1,
-1.034936, -1.472407, -1.662396, 1, 0.9294118, 0, 1,
-1.030123, 0.6694003, 0.0857511, 1, 0.9372549, 0, 1,
-1.028579, 1.990813, -1.03395, 1, 0.9411765, 0, 1,
-1.014188, 0.05225144, -1.438375, 1, 0.9490196, 0, 1,
-1.012213, -0.1623012, -2.411945, 1, 0.9529412, 0, 1,
-1.01154, 0.5025961, -1.636441, 1, 0.9607843, 0, 1,
-1.005386, -1.881991, -0.05019869, 1, 0.9647059, 0, 1,
-1.003608, -0.906655, -1.999512, 1, 0.972549, 0, 1,
-1.000702, 2.658848, 0.2563721, 1, 0.9764706, 0, 1,
-1.00047, 0.4283375, -0.2097352, 1, 0.9843137, 0, 1,
-0.9973739, 1.081111, -0.1341954, 1, 0.9882353, 0, 1,
-0.9963914, -0.3700543, -2.018075, 1, 0.9960784, 0, 1,
-0.9760064, -1.507756, -2.68272, 0.9960784, 1, 0, 1,
-0.9747381, 1.502705, -0.1174527, 0.9921569, 1, 0, 1,
-0.9626469, -0.4843157, -2.662306, 0.9843137, 1, 0, 1,
-0.9610733, -0.01105111, -2.585138, 0.9803922, 1, 0, 1,
-0.9599055, -1.065399, -2.299354, 0.972549, 1, 0, 1,
-0.9582614, 0.1024669, -0.2809703, 0.9686275, 1, 0, 1,
-0.9581555, -0.352519, -1.14156, 0.9607843, 1, 0, 1,
-0.9560155, 1.25042, -0.02636124, 0.9568627, 1, 0, 1,
-0.9511818, -1.708975, -0.4635501, 0.9490196, 1, 0, 1,
-0.9485111, -1.572413, -2.790022, 0.945098, 1, 0, 1,
-0.9471329, -0.4763597, -1.889557, 0.9372549, 1, 0, 1,
-0.9458529, -2.099229, -3.67978, 0.9333333, 1, 0, 1,
-0.9452638, 1.073936, 0.1314181, 0.9254902, 1, 0, 1,
-0.940259, -1.585358, -1.094232, 0.9215686, 1, 0, 1,
-0.9349686, 0.2289643, -0.3301114, 0.9137255, 1, 0, 1,
-0.9321271, 0.1768954, -2.952821, 0.9098039, 1, 0, 1,
-0.9285615, 0.04752493, -1.069172, 0.9019608, 1, 0, 1,
-0.9274998, 0.3186975, -2.278763, 0.8941177, 1, 0, 1,
-0.9269769, -0.2345511, -2.942555, 0.8901961, 1, 0, 1,
-0.924606, -0.4990723, -1.803736, 0.8823529, 1, 0, 1,
-0.9226512, 0.3806835, -0.9255687, 0.8784314, 1, 0, 1,
-0.9222525, -1.547421, -1.586787, 0.8705882, 1, 0, 1,
-0.9217702, 0.02255826, -2.244209, 0.8666667, 1, 0, 1,
-0.91581, 0.4271517, -0.5337658, 0.8588235, 1, 0, 1,
-0.8995929, 0.9180546, -1.143353, 0.854902, 1, 0, 1,
-0.8907554, 0.3739925, -0.04597104, 0.8470588, 1, 0, 1,
-0.8895119, -0.3927501, -3.214778, 0.8431373, 1, 0, 1,
-0.8868529, 0.9191081, 1.445298, 0.8352941, 1, 0, 1,
-0.8860986, 0.5075234, -2.605794, 0.8313726, 1, 0, 1,
-0.8852205, 0.7035325, -0.6067036, 0.8235294, 1, 0, 1,
-0.8837348, -0.2783049, -1.467073, 0.8196079, 1, 0, 1,
-0.8802819, -0.7185496, -1.301647, 0.8117647, 1, 0, 1,
-0.8723208, -1.046967, -2.262891, 0.8078431, 1, 0, 1,
-0.8679412, -0.1988308, -3.814196, 0.8, 1, 0, 1,
-0.8665469, 0.07162318, -1.568774, 0.7921569, 1, 0, 1,
-0.8621961, -0.3200312, -3.154583, 0.7882353, 1, 0, 1,
-0.8577029, -1.333327, -0.2577592, 0.7803922, 1, 0, 1,
-0.8510866, 0.5262387, -0.8909488, 0.7764706, 1, 0, 1,
-0.8455774, -1.582861, -2.995507, 0.7686275, 1, 0, 1,
-0.8418893, -0.09536928, -2.107228, 0.7647059, 1, 0, 1,
-0.8411212, -0.4808527, -1.580858, 0.7568628, 1, 0, 1,
-0.836168, -2.035677, -1.983706, 0.7529412, 1, 0, 1,
-0.8348783, 1.688523, -2.122171, 0.7450981, 1, 0, 1,
-0.8286226, -0.6020465, -1.154423, 0.7411765, 1, 0, 1,
-0.8195915, -0.205162, -0.1429615, 0.7333333, 1, 0, 1,
-0.8178176, -0.5327817, -3.226332, 0.7294118, 1, 0, 1,
-0.8121175, 0.937506, 0.9572157, 0.7215686, 1, 0, 1,
-0.8053046, 0.09347836, 0.06456275, 0.7176471, 1, 0, 1,
-0.7968869, 0.3563767, -1.396005, 0.7098039, 1, 0, 1,
-0.7954534, -0.1563354, -0.8977633, 0.7058824, 1, 0, 1,
-0.7949848, 0.07661645, -1.477493, 0.6980392, 1, 0, 1,
-0.7923927, 1.361019, 0.5799236, 0.6901961, 1, 0, 1,
-0.7897005, 0.7946399, 0.6731527, 0.6862745, 1, 0, 1,
-0.7883842, 1.200255, -1.037768, 0.6784314, 1, 0, 1,
-0.7863292, -0.5302644, -0.06793538, 0.6745098, 1, 0, 1,
-0.7813233, -1.081517, -2.806974, 0.6666667, 1, 0, 1,
-0.7780106, 0.06770969, -2.94031, 0.6627451, 1, 0, 1,
-0.7719423, -0.5060902, -2.590421, 0.654902, 1, 0, 1,
-0.7687371, 0.2517291, -2.608185, 0.6509804, 1, 0, 1,
-0.7612867, -0.4583662, -2.731804, 0.6431373, 1, 0, 1,
-0.7569676, 0.2169473, -0.7141362, 0.6392157, 1, 0, 1,
-0.7551224, -2.212431, -2.78382, 0.6313726, 1, 0, 1,
-0.7486423, -0.1795976, -0.09482255, 0.627451, 1, 0, 1,
-0.7484992, 0.9618977, -2.145529, 0.6196079, 1, 0, 1,
-0.7482155, 1.501875, 0.3954555, 0.6156863, 1, 0, 1,
-0.7435511, 0.2578107, -2.912378, 0.6078432, 1, 0, 1,
-0.7435462, 0.05085142, -0.06091312, 0.6039216, 1, 0, 1,
-0.741899, 1.380939, -0.8568154, 0.5960785, 1, 0, 1,
-0.7407805, -0.704039, -2.764542, 0.5882353, 1, 0, 1,
-0.7303728, -1.27365, -3.84037, 0.5843138, 1, 0, 1,
-0.7297009, -1.520036, -1.72869, 0.5764706, 1, 0, 1,
-0.7285646, 0.7666307, -1.130619, 0.572549, 1, 0, 1,
-0.7268499, 1.970951, -0.6017598, 0.5647059, 1, 0, 1,
-0.7258892, -0.3211871, -1.395306, 0.5607843, 1, 0, 1,
-0.725593, 1.40747, 0.3096128, 0.5529412, 1, 0, 1,
-0.7247373, -0.7647225, -1.738065, 0.5490196, 1, 0, 1,
-0.7205463, 0.5189227, -2.765182, 0.5411765, 1, 0, 1,
-0.7203518, -2.722862, -2.055405, 0.5372549, 1, 0, 1,
-0.7195733, -0.1149661, -3.076585, 0.5294118, 1, 0, 1,
-0.71359, -1.568078, -0.534509, 0.5254902, 1, 0, 1,
-0.6994302, -1.164975, -2.506738, 0.5176471, 1, 0, 1,
-0.6992989, -0.1240461, -0.006686365, 0.5137255, 1, 0, 1,
-0.6954755, 1.245351, -0.9632348, 0.5058824, 1, 0, 1,
-0.6922058, -0.8977808, -3.216871, 0.5019608, 1, 0, 1,
-0.692038, 1.197802, 0.5210434, 0.4941176, 1, 0, 1,
-0.6912797, 0.8419213, -0.2152348, 0.4862745, 1, 0, 1,
-0.6771787, -1.021146, -1.431713, 0.4823529, 1, 0, 1,
-0.6695091, -0.01125572, -0.9330025, 0.4745098, 1, 0, 1,
-0.6687719, 0.7297895, 0.03977541, 0.4705882, 1, 0, 1,
-0.6641667, -1.147998, -1.204123, 0.4627451, 1, 0, 1,
-0.6609431, -0.6338034, -2.604156, 0.4588235, 1, 0, 1,
-0.6596509, -0.9520493, -3.106897, 0.4509804, 1, 0, 1,
-0.6590313, -0.5742998, -3.669898, 0.4470588, 1, 0, 1,
-0.6579516, -0.6704606, -0.6941711, 0.4392157, 1, 0, 1,
-0.6559223, 0.06798796, -2.619149, 0.4352941, 1, 0, 1,
-0.6558153, -0.9820237, -3.353938, 0.427451, 1, 0, 1,
-0.6550276, 1.610885, 1.256643, 0.4235294, 1, 0, 1,
-0.6515772, -0.3396376, 0.4703573, 0.4156863, 1, 0, 1,
-0.6507694, -0.07032891, -2.265761, 0.4117647, 1, 0, 1,
-0.6402853, 1.018644, -2.307696, 0.4039216, 1, 0, 1,
-0.6399881, -0.5694031, -2.089536, 0.3960784, 1, 0, 1,
-0.6390898, 0.2014036, -1.85775, 0.3921569, 1, 0, 1,
-0.6338159, 0.4260913, -0.2758988, 0.3843137, 1, 0, 1,
-0.6313707, 1.175061, 0.6486589, 0.3803922, 1, 0, 1,
-0.6308286, -0.003160444, -1.896325, 0.372549, 1, 0, 1,
-0.6256086, -2.017073, -1.532545, 0.3686275, 1, 0, 1,
-0.624199, -0.5261739, -0.9383606, 0.3607843, 1, 0, 1,
-0.6231452, -0.1728142, -1.118744, 0.3568628, 1, 0, 1,
-0.6229383, -0.7395983, -2.987845, 0.3490196, 1, 0, 1,
-0.6122512, 1.295092, 0.09569556, 0.345098, 1, 0, 1,
-0.612195, 0.5708583, -1.718569, 0.3372549, 1, 0, 1,
-0.6073847, -0.4198733, -1.641194, 0.3333333, 1, 0, 1,
-0.6066856, -0.5162899, -2.415761, 0.3254902, 1, 0, 1,
-0.6065754, -0.5929276, -1.068692, 0.3215686, 1, 0, 1,
-0.6063405, 0.1345079, -2.341029, 0.3137255, 1, 0, 1,
-0.6031071, -0.7806513, -1.686936, 0.3098039, 1, 0, 1,
-0.6027697, -0.127674, -0.4425508, 0.3019608, 1, 0, 1,
-0.5968515, 2.040746, -0.7229684, 0.2941177, 1, 0, 1,
-0.5961834, -0.4119888, -2.199384, 0.2901961, 1, 0, 1,
-0.5901022, 0.9790466, -0.0867442, 0.282353, 1, 0, 1,
-0.5892524, 0.332771, -1.491448, 0.2784314, 1, 0, 1,
-0.5812608, 0.8313357, -0.6267518, 0.2705882, 1, 0, 1,
-0.5782124, 0.7265437, -0.5857238, 0.2666667, 1, 0, 1,
-0.5737259, 0.8944471, -0.8266396, 0.2588235, 1, 0, 1,
-0.5679482, -0.5323456, -1.839859, 0.254902, 1, 0, 1,
-0.5648043, -1.233496, -3.103759, 0.2470588, 1, 0, 1,
-0.5603797, 0.04395673, -2.640646, 0.2431373, 1, 0, 1,
-0.5515044, -0.4822235, -2.96035, 0.2352941, 1, 0, 1,
-0.5490791, 0.2357997, -0.1143812, 0.2313726, 1, 0, 1,
-0.5454096, 1.174744, -1.249682, 0.2235294, 1, 0, 1,
-0.5408083, 1.434154, -0.1982948, 0.2196078, 1, 0, 1,
-0.53584, 0.6185014, -0.1688551, 0.2117647, 1, 0, 1,
-0.5336908, 0.6945307, -0.3114239, 0.2078431, 1, 0, 1,
-0.5312543, -1.251994, -2.085385, 0.2, 1, 0, 1,
-0.5275433, 1.415591, -0.7275132, 0.1921569, 1, 0, 1,
-0.5274721, 1.402187, -2.438043, 0.1882353, 1, 0, 1,
-0.5253305, 1.465421, 1.19052, 0.1803922, 1, 0, 1,
-0.5239429, -0.684155, -3.705262, 0.1764706, 1, 0, 1,
-0.5228752, -0.6949059, -3.328285, 0.1686275, 1, 0, 1,
-0.5224165, -2.398108, -1.872258, 0.1647059, 1, 0, 1,
-0.5208774, -0.3781862, -1.732869, 0.1568628, 1, 0, 1,
-0.5194398, 1.89445, 0.1617687, 0.1529412, 1, 0, 1,
-0.5178227, 0.2429927, -0.8238387, 0.145098, 1, 0, 1,
-0.5162905, -0.09447977, -2.268529, 0.1411765, 1, 0, 1,
-0.5127045, 1.376775, 0.7171472, 0.1333333, 1, 0, 1,
-0.5121918, 0.7029948, -1.716865, 0.1294118, 1, 0, 1,
-0.5102547, 0.2021372, -1.930974, 0.1215686, 1, 0, 1,
-0.5003741, 0.1504957, -2.42476, 0.1176471, 1, 0, 1,
-0.499671, -0.1830424, -3.000004, 0.1098039, 1, 0, 1,
-0.4981083, -0.2857997, -1.170671, 0.1058824, 1, 0, 1,
-0.4966067, -0.6425382, -2.73961, 0.09803922, 1, 0, 1,
-0.4924219, 0.02627278, -0.1822759, 0.09019608, 1, 0, 1,
-0.4905319, -0.4168954, -3.100283, 0.08627451, 1, 0, 1,
-0.4854131, -0.1053846, -2.53108, 0.07843138, 1, 0, 1,
-0.4806854, -1.752019, -2.673748, 0.07450981, 1, 0, 1,
-0.476126, -0.271529, -1.922608, 0.06666667, 1, 0, 1,
-0.47547, -0.5644958, -1.58652, 0.0627451, 1, 0, 1,
-0.4703792, 0.8676429, -2.662992, 0.05490196, 1, 0, 1,
-0.4702254, 1.285225, -1.88069, 0.05098039, 1, 0, 1,
-0.4695628, -0.7722903, -1.772419, 0.04313726, 1, 0, 1,
-0.4658058, -0.8347003, -1.434905, 0.03921569, 1, 0, 1,
-0.4625522, -0.4689969, -2.681575, 0.03137255, 1, 0, 1,
-0.4617438, 0.5410218, 1.125957, 0.02745098, 1, 0, 1,
-0.459357, 1.436088, -0.5034131, 0.01960784, 1, 0, 1,
-0.4591154, -0.2570373, -2.304278, 0.01568628, 1, 0, 1,
-0.4576818, 0.3199501, -1.690715, 0.007843138, 1, 0, 1,
-0.4550146, -1.159673, -3.856496, 0.003921569, 1, 0, 1,
-0.4468938, -0.3074795, -2.421112, 0, 1, 0.003921569, 1,
-0.4428571, -0.6320769, -1.748982, 0, 1, 0.01176471, 1,
-0.4408929, -0.8423586, -2.514823, 0, 1, 0.01568628, 1,
-0.4386844, -0.8664665, -3.219195, 0, 1, 0.02352941, 1,
-0.436745, 0.002479576, -1.572482, 0, 1, 0.02745098, 1,
-0.435371, -0.6747252, -2.51876, 0, 1, 0.03529412, 1,
-0.4337124, -0.3349678, -2.571669, 0, 1, 0.03921569, 1,
-0.4335253, -0.03793579, -3.054697, 0, 1, 0.04705882, 1,
-0.4279504, -0.03417997, -1.801234, 0, 1, 0.05098039, 1,
-0.4263233, -0.2274985, -1.083808, 0, 1, 0.05882353, 1,
-0.4200983, -0.3192815, -2.172388, 0, 1, 0.0627451, 1,
-0.4156557, 0.7371718, 1.40141, 0, 1, 0.07058824, 1,
-0.414589, -0.5685298, -1.951255, 0, 1, 0.07450981, 1,
-0.4123253, 1.154437, -0.1860863, 0, 1, 0.08235294, 1,
-0.4119742, -0.3141276, -1.857794, 0, 1, 0.08627451, 1,
-0.4108088, -2.311436, -2.790912, 0, 1, 0.09411765, 1,
-0.4107336, -1.569624, -3.163333, 0, 1, 0.1019608, 1,
-0.410162, -0.13098, -1.438415, 0, 1, 0.1058824, 1,
-0.409078, 2.612598, -0.07258932, 0, 1, 0.1137255, 1,
-0.4041145, 1.686542, -0.4983947, 0, 1, 0.1176471, 1,
-0.4032677, 2.084799, 0.6602134, 0, 1, 0.1254902, 1,
-0.3979108, -0.4309587, -1.808572, 0, 1, 0.1294118, 1,
-0.3918634, 0.9418217, -2.129018, 0, 1, 0.1372549, 1,
-0.3870749, 1.693727, -2.432043, 0, 1, 0.1411765, 1,
-0.3856459, -0.2635743, -1.669563, 0, 1, 0.1490196, 1,
-0.3792716, -1.300905, -2.51933, 0, 1, 0.1529412, 1,
-0.371758, 0.530194, 1.403659, 0, 1, 0.1607843, 1,
-0.368365, -0.5146541, -1.679702, 0, 1, 0.1647059, 1,
-0.3679057, 0.1374545, -0.4997011, 0, 1, 0.172549, 1,
-0.3678764, 2.062225, -1.116867, 0, 1, 0.1764706, 1,
-0.3676658, -1.015341, -3.684352, 0, 1, 0.1843137, 1,
-0.3658619, -0.5576665, -2.243688, 0, 1, 0.1882353, 1,
-0.3652765, 0.729517, -0.2123678, 0, 1, 0.1960784, 1,
-0.3589369, 0.2593673, -1.163208, 0, 1, 0.2039216, 1,
-0.3560115, 1.281915, -1.23241, 0, 1, 0.2078431, 1,
-0.354563, -0.4744079, -3.125457, 0, 1, 0.2156863, 1,
-0.3517535, -0.8208218, -0.5964038, 0, 1, 0.2196078, 1,
-0.3509507, 0.2455258, 1.174322, 0, 1, 0.227451, 1,
-0.3490612, 0.6034241, 0.9786134, 0, 1, 0.2313726, 1,
-0.3489511, 0.8148904, -0.3406399, 0, 1, 0.2392157, 1,
-0.3486529, -1.024565, -0.9155879, 0, 1, 0.2431373, 1,
-0.3392966, -0.7590171, -2.893176, 0, 1, 0.2509804, 1,
-0.3368032, 0.09961934, -0.7039216, 0, 1, 0.254902, 1,
-0.3340971, 0.3987601, 0.619374, 0, 1, 0.2627451, 1,
-0.3332818, -1.700693, -3.731412, 0, 1, 0.2666667, 1,
-0.3328179, 1.357346, -0.4729745, 0, 1, 0.2745098, 1,
-0.3326381, 0.3494347, -1.360543, 0, 1, 0.2784314, 1,
-0.3272949, 0.535069, -1.432163, 0, 1, 0.2862745, 1,
-0.3257552, -0.6448337, -0.9843332, 0, 1, 0.2901961, 1,
-0.3218948, -0.1095773, -2.242532, 0, 1, 0.2980392, 1,
-0.3199479, -1.099925, -3.573412, 0, 1, 0.3058824, 1,
-0.3138451, -1.694501, -3.347819, 0, 1, 0.3098039, 1,
-0.3078634, 0.4736827, -1.180334, 0, 1, 0.3176471, 1,
-0.3071065, 0.6524085, -0.8746178, 0, 1, 0.3215686, 1,
-0.3000794, -0.9568033, -3.745944, 0, 1, 0.3294118, 1,
-0.2991711, -1.344109, -4.458713, 0, 1, 0.3333333, 1,
-0.2981479, 0.2350309, 0.7410724, 0, 1, 0.3411765, 1,
-0.2963179, 0.5186785, -1.331361, 0, 1, 0.345098, 1,
-0.292692, 0.9385454, 0.722236, 0, 1, 0.3529412, 1,
-0.283756, -0.8798026, -2.974955, 0, 1, 0.3568628, 1,
-0.2831582, 2.105119, -0.5427875, 0, 1, 0.3647059, 1,
-0.2830746, -2.016201, -4.62482, 0, 1, 0.3686275, 1,
-0.2778517, 0.6054249, -1.155773, 0, 1, 0.3764706, 1,
-0.2744696, 1.167352, -2.602881, 0, 1, 0.3803922, 1,
-0.2721263, -2.040828, -1.715012, 0, 1, 0.3882353, 1,
-0.2718991, -0.0470608, -1.245051, 0, 1, 0.3921569, 1,
-0.2712382, -0.7235446, -1.497042, 0, 1, 0.4, 1,
-0.2689843, 0.319315, -0.5396859, 0, 1, 0.4078431, 1,
-0.2663887, 1.090802, -1.162942, 0, 1, 0.4117647, 1,
-0.2650872, -0.5773197, -3.401176, 0, 1, 0.4196078, 1,
-0.2600582, -1.401888, -4.265466, 0, 1, 0.4235294, 1,
-0.2597701, -2.868948, -3.782995, 0, 1, 0.4313726, 1,
-0.2568318, -0.2383892, -2.848974, 0, 1, 0.4352941, 1,
-0.2553192, 0.6099443, -0.3842928, 0, 1, 0.4431373, 1,
-0.2550439, 0.8625213, -0.1195735, 0, 1, 0.4470588, 1,
-0.2510318, -0.05849924, -2.243592, 0, 1, 0.454902, 1,
-0.2502944, -0.7616606, -2.244887, 0, 1, 0.4588235, 1,
-0.2502759, -1.0398, -2.473745, 0, 1, 0.4666667, 1,
-0.2492273, -0.09105767, -1.202798, 0, 1, 0.4705882, 1,
-0.2491052, -0.01547236, -0.8770107, 0, 1, 0.4784314, 1,
-0.2411374, -0.5278361, -1.696962, 0, 1, 0.4823529, 1,
-0.2381381, 1.169765, -0.3089798, 0, 1, 0.4901961, 1,
-0.2361711, -0.6283168, -3.777033, 0, 1, 0.4941176, 1,
-0.2360151, 0.7026647, 0.7180973, 0, 1, 0.5019608, 1,
-0.234334, -0.4139611, -2.819275, 0, 1, 0.509804, 1,
-0.2331164, 2.290459, 0.01679755, 0, 1, 0.5137255, 1,
-0.2316148, -0.3642494, -2.223918, 0, 1, 0.5215687, 1,
-0.2305816, 0.6758783, 1.43286, 0, 1, 0.5254902, 1,
-0.2261068, -0.2791875, -3.062884, 0, 1, 0.5333334, 1,
-0.2248855, -0.3515504, -2.22052, 0, 1, 0.5372549, 1,
-0.2247241, -0.3583535, -1.935895, 0, 1, 0.5450981, 1,
-0.2232174, -0.3770732, -2.589509, 0, 1, 0.5490196, 1,
-0.2204085, 0.1801133, -1.035566, 0, 1, 0.5568628, 1,
-0.218407, -1.665107, -2.768452, 0, 1, 0.5607843, 1,
-0.2050493, -0.5317079, -3.819566, 0, 1, 0.5686275, 1,
-0.1992538, 0.5000784, 0.1058086, 0, 1, 0.572549, 1,
-0.198598, -0.155015, -3.655239, 0, 1, 0.5803922, 1,
-0.1962603, -0.5395266, -1.90671, 0, 1, 0.5843138, 1,
-0.1937566, -1.604908, -3.842761, 0, 1, 0.5921569, 1,
-0.1930149, -0.2495064, -2.211091, 0, 1, 0.5960785, 1,
-0.1889594, -1.360031, -2.279532, 0, 1, 0.6039216, 1,
-0.1836232, -0.7103785, -0.2512713, 0, 1, 0.6117647, 1,
-0.1826665, 0.7345712, -2.098515, 0, 1, 0.6156863, 1,
-0.1818563, 0.8087405, -0.1868164, 0, 1, 0.6235294, 1,
-0.1773574, -0.0484278, -1.963681, 0, 1, 0.627451, 1,
-0.1745006, -1.005041, -0.4291554, 0, 1, 0.6352941, 1,
-0.1649685, 1.093287, 0.7098927, 0, 1, 0.6392157, 1,
-0.1591995, -2.004701, -3.684435, 0, 1, 0.6470588, 1,
-0.1531655, 0.6174834, -0.9674718, 0, 1, 0.6509804, 1,
-0.1526143, -1.264894, -4.987946, 0, 1, 0.6588235, 1,
-0.151649, 0.03275861, 0.1303412, 0, 1, 0.6627451, 1,
-0.1474472, 0.3498546, -0.7301236, 0, 1, 0.6705883, 1,
-0.1438218, -0.4925845, -4.384655, 0, 1, 0.6745098, 1,
-0.1430512, 1.995313, 1.069093, 0, 1, 0.682353, 1,
-0.1397638, -0.156254, -3.267937, 0, 1, 0.6862745, 1,
-0.1394619, 1.036294, -0.3671564, 0, 1, 0.6941177, 1,
-0.1388435, -0.3756269, -1.928756, 0, 1, 0.7019608, 1,
-0.131869, 1.036288, 0.9428691, 0, 1, 0.7058824, 1,
-0.1257893, -1.137719, -3.823149, 0, 1, 0.7137255, 1,
-0.1251933, 0.7383319, 0.09818528, 0, 1, 0.7176471, 1,
-0.1240633, 0.5998528, -0.5335737, 0, 1, 0.7254902, 1,
-0.1187696, 0.7740978, -0.6832917, 0, 1, 0.7294118, 1,
-0.1148663, -0.145642, -1.891421, 0, 1, 0.7372549, 1,
-0.1086942, -0.7676144, -4.288637, 0, 1, 0.7411765, 1,
-0.107886, 0.6253154, -1.402086, 0, 1, 0.7490196, 1,
-0.1073364, -1.044256, -3.901964, 0, 1, 0.7529412, 1,
-0.1063274, -0.6123127, -1.496862, 0, 1, 0.7607843, 1,
-0.1048234, -0.6769196, -2.882653, 0, 1, 0.7647059, 1,
-0.1017502, -0.1134093, -4.288089, 0, 1, 0.772549, 1,
-0.1016963, 0.8204151, 0.8728065, 0, 1, 0.7764706, 1,
-0.09730746, 0.3640298, 1.182591, 0, 1, 0.7843137, 1,
-0.09446913, -0.04638291, -3.326262, 0, 1, 0.7882353, 1,
-0.09411737, 0.1647239, 0.2425436, 0, 1, 0.7960784, 1,
-0.09411593, -1.719219, -2.118952, 0, 1, 0.8039216, 1,
-0.08934042, -0.6352872, -3.532565, 0, 1, 0.8078431, 1,
-0.08548516, -1.098761, -2.629188, 0, 1, 0.8156863, 1,
-0.08055599, -0.0601126, -1.674976, 0, 1, 0.8196079, 1,
-0.07801165, 0.203698, -1.849085, 0, 1, 0.827451, 1,
-0.07617956, -0.8615215, -3.191156, 0, 1, 0.8313726, 1,
-0.07566475, 0.7221971, 1.30855, 0, 1, 0.8392157, 1,
-0.07535438, -2.469012, -3.106887, 0, 1, 0.8431373, 1,
-0.07032052, -0.009474878, -1.600612, 0, 1, 0.8509804, 1,
-0.06905133, -0.6472661, -4.361619, 0, 1, 0.854902, 1,
-0.06783134, -1.004238, -2.121077, 0, 1, 0.8627451, 1,
-0.06657466, -1.957563, -3.619231, 0, 1, 0.8666667, 1,
-0.06615826, 0.1647674, 0.1590689, 0, 1, 0.8745098, 1,
-0.05580925, -0.6161983, -3.036623, 0, 1, 0.8784314, 1,
-0.05580746, 0.6598464, -0.7184345, 0, 1, 0.8862745, 1,
-0.05154293, -0.7636507, -4.519536, 0, 1, 0.8901961, 1,
-0.05063963, 0.5925809, -0.5975673, 0, 1, 0.8980392, 1,
-0.04923437, -0.4436123, -2.205247, 0, 1, 0.9058824, 1,
-0.04884286, 0.1098847, -0.5472818, 0, 1, 0.9098039, 1,
-0.04864409, 1.75044, 0.2802764, 0, 1, 0.9176471, 1,
-0.0461179, 1.109654, 2.160644, 0, 1, 0.9215686, 1,
-0.04378014, 0.5953199, -0.9072546, 0, 1, 0.9294118, 1,
-0.04359814, -2.240409, -3.622021, 0, 1, 0.9333333, 1,
-0.03891478, 0.5307645, 1.049549, 0, 1, 0.9411765, 1,
-0.03218734, -1.078084, -4.027892, 0, 1, 0.945098, 1,
-0.0315264, 1.486831, 0.2437953, 0, 1, 0.9529412, 1,
-0.03050269, 0.4487245, -0.1303229, 0, 1, 0.9568627, 1,
-0.02808595, -0.4068815, -3.460175, 0, 1, 0.9647059, 1,
-0.02542411, -0.7545217, -2.975221, 0, 1, 0.9686275, 1,
-0.0253752, -0.2079908, -3.026362, 0, 1, 0.9764706, 1,
-0.02502795, 0.3953311, -1.141262, 0, 1, 0.9803922, 1,
-0.02336168, 0.5833061, -1.40213, 0, 1, 0.9882353, 1,
-0.01281688, -0.5274689, -2.274192, 0, 1, 0.9921569, 1,
-0.008194863, 0.2625129, 1.081421, 0, 1, 1, 1,
-0.008184401, 0.5703838, -1.656271, 0, 0.9921569, 1, 1,
-0.008168432, -0.4061474, -3.372826, 0, 0.9882353, 1, 1,
-0.007918024, 0.6866022, 0.003572306, 0, 0.9803922, 1, 1,
-0.00630306, -0.7325089, -3.513286, 0, 0.9764706, 1, 1,
0.004749608, 1.240215, 0.4976928, 0, 0.9686275, 1, 1,
0.005540634, 0.3307208, -0.4172618, 0, 0.9647059, 1, 1,
0.007502283, -1.225782, 2.495821, 0, 0.9568627, 1, 1,
0.009733903, 0.00173046, -0.2118686, 0, 0.9529412, 1, 1,
0.01509885, -2.741001, 3.333117, 0, 0.945098, 1, 1,
0.01548849, -0.09904069, 3.35134, 0, 0.9411765, 1, 1,
0.01813698, -0.80959, 3.24503, 0, 0.9333333, 1, 1,
0.01971143, -1.340596, 2.969127, 0, 0.9294118, 1, 1,
0.02043987, -0.7723475, 4.050228, 0, 0.9215686, 1, 1,
0.02147402, -0.1181388, 2.841486, 0, 0.9176471, 1, 1,
0.02465262, 0.6013553, -0.5555497, 0, 0.9098039, 1, 1,
0.02694343, -0.9093975, 2.29729, 0, 0.9058824, 1, 1,
0.02738224, 0.3124079, -0.2592264, 0, 0.8980392, 1, 1,
0.03052269, 0.107669, 0.4197391, 0, 0.8901961, 1, 1,
0.03214094, 1.232544, 0.644477, 0, 0.8862745, 1, 1,
0.0334974, 0.1890552, -0.5618867, 0, 0.8784314, 1, 1,
0.03792229, 1.668839, -0.4450105, 0, 0.8745098, 1, 1,
0.03817455, -0.5091977, 2.962847, 0, 0.8666667, 1, 1,
0.03918099, 0.828792, 0.3668471, 0, 0.8627451, 1, 1,
0.04084188, 0.5787469, 0.6110209, 0, 0.854902, 1, 1,
0.04124995, -2.50913, 2.697654, 0, 0.8509804, 1, 1,
0.04403432, 1.203492, -0.9460238, 0, 0.8431373, 1, 1,
0.04640028, 0.2808051, -1.518302, 0, 0.8392157, 1, 1,
0.04863677, 1.216953, -1.237553, 0, 0.8313726, 1, 1,
0.05286549, -0.9951831, 5.47787, 0, 0.827451, 1, 1,
0.05338859, 0.2478223, 0.5981258, 0, 0.8196079, 1, 1,
0.05431454, 0.4617294, 0.4584351, 0, 0.8156863, 1, 1,
0.05897138, -0.05811293, 2.837033, 0, 0.8078431, 1, 1,
0.06130256, -0.3051939, 2.0911, 0, 0.8039216, 1, 1,
0.06248684, -1.127288, 3.21334, 0, 0.7960784, 1, 1,
0.0635417, 0.39147, -0.9421033, 0, 0.7882353, 1, 1,
0.06541003, 0.7510862, 1.38846, 0, 0.7843137, 1, 1,
0.07109102, 1.50442, -1.441462, 0, 0.7764706, 1, 1,
0.07235143, -0.9283338, 1.510438, 0, 0.772549, 1, 1,
0.07355542, -1.436487, 4.111115, 0, 0.7647059, 1, 1,
0.09057471, -2.874501, 2.152421, 0, 0.7607843, 1, 1,
0.09164469, -0.5191683, 2.834051, 0, 0.7529412, 1, 1,
0.09213855, -1.273239, 4.177358, 0, 0.7490196, 1, 1,
0.09563407, 0.7756753, -0.782167, 0, 0.7411765, 1, 1,
0.09620523, 1.81602, 0.4761529, 0, 0.7372549, 1, 1,
0.09772863, 0.1926222, 2.448678, 0, 0.7294118, 1, 1,
0.09963778, 0.7838496, 1.042606, 0, 0.7254902, 1, 1,
0.1019231, 0.5931141, 0.5018281, 0, 0.7176471, 1, 1,
0.1065411, -1.75314, 2.602188, 0, 0.7137255, 1, 1,
0.1119391, 0.1891604, 1.345237, 0, 0.7058824, 1, 1,
0.116287, -0.575955, 3.176701, 0, 0.6980392, 1, 1,
0.1175259, -0.6987552, 2.366141, 0, 0.6941177, 1, 1,
0.1215388, 0.1845142, 0.5750384, 0, 0.6862745, 1, 1,
0.1252548, 0.7315592, 0.1351087, 0, 0.682353, 1, 1,
0.126003, -1.664962, 3.91127, 0, 0.6745098, 1, 1,
0.1286023, 0.7072639, 0.3508551, 0, 0.6705883, 1, 1,
0.1288518, -0.770302, 1.96806, 0, 0.6627451, 1, 1,
0.1330304, -0.5754333, 4.33732, 0, 0.6588235, 1, 1,
0.1373864, -0.4190468, 2.603458, 0, 0.6509804, 1, 1,
0.1473064, 0.3663521, -1.821876, 0, 0.6470588, 1, 1,
0.1473657, 0.9798019, -0.5020326, 0, 0.6392157, 1, 1,
0.14854, -0.1404418, 2.143819, 0, 0.6352941, 1, 1,
0.1494661, 0.6813846, 1.885936, 0, 0.627451, 1, 1,
0.1516589, 0.4542767, -1.42273, 0, 0.6235294, 1, 1,
0.1550059, 1.252712, -0.7580768, 0, 0.6156863, 1, 1,
0.1561143, -0.8504785, 3.425748, 0, 0.6117647, 1, 1,
0.1571029, -0.5687069, 1.60544, 0, 0.6039216, 1, 1,
0.1593364, -0.606535, 2.993852, 0, 0.5960785, 1, 1,
0.1618717, -1.953192, 2.654349, 0, 0.5921569, 1, 1,
0.1639419, 1.092145, 0.3181723, 0, 0.5843138, 1, 1,
0.1641392, -0.3544615, 2.526715, 0, 0.5803922, 1, 1,
0.1686121, 0.3929471, 0.1759808, 0, 0.572549, 1, 1,
0.1712601, -0.1070993, 1.578541, 0, 0.5686275, 1, 1,
0.1725795, 0.6578353, 0.4031159, 0, 0.5607843, 1, 1,
0.1734561, -0.8296707, 0.7725841, 0, 0.5568628, 1, 1,
0.1749311, 0.7128007, -2.428987, 0, 0.5490196, 1, 1,
0.1781118, 0.6319716, -0.01694632, 0, 0.5450981, 1, 1,
0.179931, 2.256103, 0.7260985, 0, 0.5372549, 1, 1,
0.1886975, 0.7515253, 1.809015, 0, 0.5333334, 1, 1,
0.1922469, 0.6870266, 0.2588051, 0, 0.5254902, 1, 1,
0.192924, 0.117094, 2.395396, 0, 0.5215687, 1, 1,
0.1930393, -1.030368, 2.688733, 0, 0.5137255, 1, 1,
0.1981536, 0.2591372, -0.7285706, 0, 0.509804, 1, 1,
0.2006651, 0.01867134, 0.2013656, 0, 0.5019608, 1, 1,
0.2008552, -1.922477, 4.290869, 0, 0.4941176, 1, 1,
0.2140968, -0.8650335, 0.9317158, 0, 0.4901961, 1, 1,
0.2187712, -2.332507, 2.194431, 0, 0.4823529, 1, 1,
0.2188849, -1.617379, 2.928573, 0, 0.4784314, 1, 1,
0.2204313, -1.450655, 1.245146, 0, 0.4705882, 1, 1,
0.2221398, -1.334448, 3.640646, 0, 0.4666667, 1, 1,
0.2222171, -2.015769, 2.599734, 0, 0.4588235, 1, 1,
0.224581, -0.6617685, 2.197712, 0, 0.454902, 1, 1,
0.2253682, -2.015187, 2.097469, 0, 0.4470588, 1, 1,
0.2273891, 0.4496756, 1.356139, 0, 0.4431373, 1, 1,
0.2275316, 0.05082474, 0.8513345, 0, 0.4352941, 1, 1,
0.227792, 0.4657268, 0.5259421, 0, 0.4313726, 1, 1,
0.229723, -0.5659431, 2.664624, 0, 0.4235294, 1, 1,
0.2325941, 1.184273, -0.6438183, 0, 0.4196078, 1, 1,
0.2354086, -1.686623, 1.41941, 0, 0.4117647, 1, 1,
0.2357058, -0.7435503, 3.319192, 0, 0.4078431, 1, 1,
0.2362031, 0.234743, 0.3706288, 0, 0.4, 1, 1,
0.2369413, 0.500123, 1.299299, 0, 0.3921569, 1, 1,
0.2380484, 0.9525913, 0.7566423, 0, 0.3882353, 1, 1,
0.2438475, -1.299709, 1.298268, 0, 0.3803922, 1, 1,
0.252925, -1.201805, 2.156666, 0, 0.3764706, 1, 1,
0.25519, -0.8459361, 3.215657, 0, 0.3686275, 1, 1,
0.257577, -1.652533, 3.637987, 0, 0.3647059, 1, 1,
0.2592118, 0.04945227, 1.865235, 0, 0.3568628, 1, 1,
0.2611322, 1.134287, 0.6633447, 0, 0.3529412, 1, 1,
0.2612005, -1.633291, 2.458483, 0, 0.345098, 1, 1,
0.2619606, -0.8621317, 3.251381, 0, 0.3411765, 1, 1,
0.2661858, -0.2372732, 3.211154, 0, 0.3333333, 1, 1,
0.26663, 0.614081, 0.1440043, 0, 0.3294118, 1, 1,
0.273086, -0.3089092, 4.175684, 0, 0.3215686, 1, 1,
0.2768483, -0.0414, 1.411014, 0, 0.3176471, 1, 1,
0.2826206, -0.8844292, 3.214023, 0, 0.3098039, 1, 1,
0.283371, 2.493035, -0.3474242, 0, 0.3058824, 1, 1,
0.2835848, 1.119617, -0.8198683, 0, 0.2980392, 1, 1,
0.2844552, 1.765017, 1.077571, 0, 0.2901961, 1, 1,
0.2922961, 0.394005, 0.6941857, 0, 0.2862745, 1, 1,
0.3007045, -1.001311, 2.619704, 0, 0.2784314, 1, 1,
0.302473, 0.1767849, 0.0460364, 0, 0.2745098, 1, 1,
0.3122791, 0.6979992, 0.2020619, 0, 0.2666667, 1, 1,
0.3129107, -0.7357109, 5.087015, 0, 0.2627451, 1, 1,
0.3157293, -0.9368006, 1.431894, 0, 0.254902, 1, 1,
0.3199533, -0.7724769, 4.501142, 0, 0.2509804, 1, 1,
0.3216501, 0.3620422, 0.1315563, 0, 0.2431373, 1, 1,
0.3224235, 0.2443451, 0.01434546, 0, 0.2392157, 1, 1,
0.3232442, 0.6650717, -0.1671873, 0, 0.2313726, 1, 1,
0.3321956, -0.1821822, 2.136405, 0, 0.227451, 1, 1,
0.3332184, -0.7596984, 2.117147, 0, 0.2196078, 1, 1,
0.3364641, 1.474713, 1.320155, 0, 0.2156863, 1, 1,
0.3384382, 1.31623, 0.9603007, 0, 0.2078431, 1, 1,
0.3435073, -1.726806, 3.412392, 0, 0.2039216, 1, 1,
0.3472068, 0.9113631, 0.2453671, 0, 0.1960784, 1, 1,
0.3472567, 0.9502925, 1.20653, 0, 0.1882353, 1, 1,
0.3480604, 1.46372, 0.3332546, 0, 0.1843137, 1, 1,
0.3566883, -0.7574497, 1.619072, 0, 0.1764706, 1, 1,
0.3567652, -0.3566688, 3.104089, 0, 0.172549, 1, 1,
0.359194, -1.17105, 1.232424, 0, 0.1647059, 1, 1,
0.3603888, 0.7409671, 1.852366, 0, 0.1607843, 1, 1,
0.3633034, -0.3957498, 1.382005, 0, 0.1529412, 1, 1,
0.3658785, 0.2302261, -2.885993, 0, 0.1490196, 1, 1,
0.3765911, -1.36216, 3.979857, 0, 0.1411765, 1, 1,
0.3770778, -0.7405939, 2.146155, 0, 0.1372549, 1, 1,
0.3829349, -1.506788, 3.332559, 0, 0.1294118, 1, 1,
0.3861848, 0.2813632, 0.4723799, 0, 0.1254902, 1, 1,
0.3864115, -1.102328, 3.495455, 0, 0.1176471, 1, 1,
0.388097, 1.635189, -0.9562117, 0, 0.1137255, 1, 1,
0.3915587, -0.9877419, 2.674335, 0, 0.1058824, 1, 1,
0.3918237, -1.975422, 4.097757, 0, 0.09803922, 1, 1,
0.3928883, 0.6459109, 1.198962, 0, 0.09411765, 1, 1,
0.3962913, -2.020395, 3.469963, 0, 0.08627451, 1, 1,
0.3972545, -0.7746678, 2.475037, 0, 0.08235294, 1, 1,
0.4045058, 0.7211302, 0.2773738, 0, 0.07450981, 1, 1,
0.4106979, -0.840445, 2.326063, 0, 0.07058824, 1, 1,
0.4109719, 1.95631, 0.5250378, 0, 0.0627451, 1, 1,
0.414237, -1.42343, 2.287267, 0, 0.05882353, 1, 1,
0.4174712, 1.184263, 1.786463, 0, 0.05098039, 1, 1,
0.417986, 0.5196322, 3.243928, 0, 0.04705882, 1, 1,
0.4200254, -1.125916, 3.95719, 0, 0.03921569, 1, 1,
0.4206195, -1.857849, 2.494944, 0, 0.03529412, 1, 1,
0.4239489, -0.534552, 1.624314, 0, 0.02745098, 1, 1,
0.4265973, 0.578322, 1.308716, 0, 0.02352941, 1, 1,
0.428569, 0.4755529, 2.240617, 0, 0.01568628, 1, 1,
0.428861, 0.6012228, -0.9438507, 0, 0.01176471, 1, 1,
0.4367056, 1.143547, 0.404633, 0, 0.003921569, 1, 1,
0.436996, 1.258758, 0.1846826, 0.003921569, 0, 1, 1,
0.4411078, -0.7794178, 1.14914, 0.007843138, 0, 1, 1,
0.4426868, -0.4356823, 1.12844, 0.01568628, 0, 1, 1,
0.4465519, 0.1607933, 1.102852, 0.01960784, 0, 1, 1,
0.451759, -0.1990465, 2.845851, 0.02745098, 0, 1, 1,
0.458295, -0.3061713, 1.922126, 0.03137255, 0, 1, 1,
0.458402, 1.04342, -0.338415, 0.03921569, 0, 1, 1,
0.4598362, -0.3125317, 1.51773, 0.04313726, 0, 1, 1,
0.4716739, -0.1670672, 0.9501488, 0.05098039, 0, 1, 1,
0.4722012, -0.3665323, 2.72902, 0.05490196, 0, 1, 1,
0.4796302, 1.09223, 0.08764172, 0.0627451, 0, 1, 1,
0.4803087, -0.1559505, 1.211223, 0.06666667, 0, 1, 1,
0.4864944, 1.930949, -0.785719, 0.07450981, 0, 1, 1,
0.4869757, -0.3809517, 1.684702, 0.07843138, 0, 1, 1,
0.4886755, 0.3446124, 0.8108418, 0.08627451, 0, 1, 1,
0.4969424, 0.564857, -0.3982, 0.09019608, 0, 1, 1,
0.5011454, -0.2840324, 3.234046, 0.09803922, 0, 1, 1,
0.5020778, -2.060027, 0.7786688, 0.1058824, 0, 1, 1,
0.5020878, -0.8935691, 4.404828, 0.1098039, 0, 1, 1,
0.5037813, 0.4713268, 0.7050121, 0.1176471, 0, 1, 1,
0.5068069, 0.7106693, -0.003335291, 0.1215686, 0, 1, 1,
0.5113751, 0.002734232, 1.959373, 0.1294118, 0, 1, 1,
0.5116252, -1.68773, 0.8342317, 0.1333333, 0, 1, 1,
0.5118042, 0.03173907, 1.316786, 0.1411765, 0, 1, 1,
0.5139983, 1.155384, 0.9324056, 0.145098, 0, 1, 1,
0.5207665, 0.826309, 0.4749173, 0.1529412, 0, 1, 1,
0.5226253, -1.678369, 2.952641, 0.1568628, 0, 1, 1,
0.5233266, 0.3820006, 1.144856, 0.1647059, 0, 1, 1,
0.5248132, -1.122446, 3.367552, 0.1686275, 0, 1, 1,
0.524853, -1.307326, 3.290287, 0.1764706, 0, 1, 1,
0.5292002, 0.03909316, 1.34333, 0.1803922, 0, 1, 1,
0.5325276, -1.505313, 2.577184, 0.1882353, 0, 1, 1,
0.5330913, -0.5052062, 2.087292, 0.1921569, 0, 1, 1,
0.533161, -0.0464133, 1.919682, 0.2, 0, 1, 1,
0.5337862, 0.12481, 1.477612, 0.2078431, 0, 1, 1,
0.5367194, 1.150325, -1.096295, 0.2117647, 0, 1, 1,
0.5515367, -0.9037062, 2.184928, 0.2196078, 0, 1, 1,
0.5594972, 1.058766, -0.254292, 0.2235294, 0, 1, 1,
0.5612547, 0.1365806, 1.934103, 0.2313726, 0, 1, 1,
0.5675094, -0.5100619, 4.692183, 0.2352941, 0, 1, 1,
0.5678059, -1.283144, 2.128956, 0.2431373, 0, 1, 1,
0.5691307, 0.555568, 0.05185692, 0.2470588, 0, 1, 1,
0.5718676, -1.438515, 1.985583, 0.254902, 0, 1, 1,
0.5794703, 0.6273115, -0.9810677, 0.2588235, 0, 1, 1,
0.5800954, 0.27942, 0.8973072, 0.2666667, 0, 1, 1,
0.5841036, 1.185651, 2.185283, 0.2705882, 0, 1, 1,
0.5890186, 1.362047, 0.1387989, 0.2784314, 0, 1, 1,
0.5898643, 0.3906517, 1.460064, 0.282353, 0, 1, 1,
0.5922889, 0.3291758, 0.7762913, 0.2901961, 0, 1, 1,
0.594258, -1.556322, 2.601926, 0.2941177, 0, 1, 1,
0.5954028, -1.232596, 2.491444, 0.3019608, 0, 1, 1,
0.5959103, 0.3436472, 1.624215, 0.3098039, 0, 1, 1,
0.5963426, 0.1940428, 0.2648043, 0.3137255, 0, 1, 1,
0.5966002, -0.1348448, 2.558166, 0.3215686, 0, 1, 1,
0.5978999, -0.3877421, 2.655702, 0.3254902, 0, 1, 1,
0.5979221, -0.2604384, 1.466065, 0.3333333, 0, 1, 1,
0.5981908, -2.323251, 2.219751, 0.3372549, 0, 1, 1,
0.5994766, -0.1005493, 0.6129438, 0.345098, 0, 1, 1,
0.6026247, -0.03934761, 0.1704207, 0.3490196, 0, 1, 1,
0.6028167, 0.07735322, 0.6590345, 0.3568628, 0, 1, 1,
0.6082963, -0.05626901, 0.8373259, 0.3607843, 0, 1, 1,
0.6139928, 1.116325, 2.509615, 0.3686275, 0, 1, 1,
0.6178609, 0.9264437, -1.271887, 0.372549, 0, 1, 1,
0.6184308, 0.06290188, 3.19028, 0.3803922, 0, 1, 1,
0.6227686, 0.6245771, -0.4017146, 0.3843137, 0, 1, 1,
0.6251556, 0.7092384, 1.125794, 0.3921569, 0, 1, 1,
0.6254219, -0.4494369, 3.280704, 0.3960784, 0, 1, 1,
0.6261309, 0.9501135, -0.2321318, 0.4039216, 0, 1, 1,
0.6298697, 1.402839, 1.22291, 0.4117647, 0, 1, 1,
0.630772, 3.220309, -0.9392489, 0.4156863, 0, 1, 1,
0.631027, 1.020357, 1.40711, 0.4235294, 0, 1, 1,
0.6318637, 0.3958131, 0.7877795, 0.427451, 0, 1, 1,
0.6340339, -0.5190448, 4.360471, 0.4352941, 0, 1, 1,
0.6400993, -1.39665, 3.402612, 0.4392157, 0, 1, 1,
0.6407105, 1.364166, 0.3158137, 0.4470588, 0, 1, 1,
0.6407508, -0.04858267, 2.365939, 0.4509804, 0, 1, 1,
0.651117, -1.713443, 2.8608, 0.4588235, 0, 1, 1,
0.6524978, -2.373266, 2.456603, 0.4627451, 0, 1, 1,
0.6552149, -0.9944562, 2.912107, 0.4705882, 0, 1, 1,
0.6657059, 0.6154903, 0.9259171, 0.4745098, 0, 1, 1,
0.6704665, 0.06602827, 2.919742, 0.4823529, 0, 1, 1,
0.6791539, -0.9908985, 2.180961, 0.4862745, 0, 1, 1,
0.682296, 0.6876141, 1.27487, 0.4941176, 0, 1, 1,
0.6858457, 1.287804, -0.4486146, 0.5019608, 0, 1, 1,
0.6921794, -0.39988, 0.9791721, 0.5058824, 0, 1, 1,
0.6938992, 0.6026195, -0.2634957, 0.5137255, 0, 1, 1,
0.696149, -0.2784922, 2.039824, 0.5176471, 0, 1, 1,
0.7096545, -0.8608288, 3.098673, 0.5254902, 0, 1, 1,
0.7116313, 0.1557606, 1.113722, 0.5294118, 0, 1, 1,
0.7153834, 0.07878912, 1.467215, 0.5372549, 0, 1, 1,
0.7157197, 2.004864, 1.316732, 0.5411765, 0, 1, 1,
0.7204246, -1.025211, 4.331202, 0.5490196, 0, 1, 1,
0.7226084, -0.1328581, 1.374092, 0.5529412, 0, 1, 1,
0.7265677, -0.8216525, 3.574646, 0.5607843, 0, 1, 1,
0.7310169, 0.1259758, -0.1663757, 0.5647059, 0, 1, 1,
0.7332804, -0.02674641, 1.686596, 0.572549, 0, 1, 1,
0.741223, -1.344679, 2.294694, 0.5764706, 0, 1, 1,
0.7464329, -0.09241939, 1.486569, 0.5843138, 0, 1, 1,
0.7551816, 0.1762078, 0.243001, 0.5882353, 0, 1, 1,
0.7557988, 1.005282, 0.9305202, 0.5960785, 0, 1, 1,
0.75747, 0.562898, 0.02206314, 0.6039216, 0, 1, 1,
0.7584607, -0.1731484, 1.600567, 0.6078432, 0, 1, 1,
0.7605209, 1.26966, -0.8736148, 0.6156863, 0, 1, 1,
0.7669318, -0.2889011, 0.7667964, 0.6196079, 0, 1, 1,
0.767808, -0.3613043, 3.24984, 0.627451, 0, 1, 1,
0.768856, -0.0585814, 2.248237, 0.6313726, 0, 1, 1,
0.771006, 0.3737602, 3.224922, 0.6392157, 0, 1, 1,
0.7731583, 0.9628612, 0.04664009, 0.6431373, 0, 1, 1,
0.7856618, 1.243792, 1.151274, 0.6509804, 0, 1, 1,
0.7948053, -0.2678423, 2.8626, 0.654902, 0, 1, 1,
0.8018504, 0.1513142, 1.355899, 0.6627451, 0, 1, 1,
0.8020399, -0.708062, 1.994038, 0.6666667, 0, 1, 1,
0.8024662, 0.3144176, 2.440995, 0.6745098, 0, 1, 1,
0.8080929, -0.4755014, -0.2831719, 0.6784314, 0, 1, 1,
0.8115447, -1.915731, 4.368153, 0.6862745, 0, 1, 1,
0.8127676, -1.256318, 2.418243, 0.6901961, 0, 1, 1,
0.8127836, -0.9175543, 2.620816, 0.6980392, 0, 1, 1,
0.8157942, -0.3229791, 2.335417, 0.7058824, 0, 1, 1,
0.8162763, 0.5687202, 1.031218, 0.7098039, 0, 1, 1,
0.8171111, -0.3502004, 2.52458, 0.7176471, 0, 1, 1,
0.8346395, 2.733446, -0.9573578, 0.7215686, 0, 1, 1,
0.8374069, 0.5215079, 1.72624, 0.7294118, 0, 1, 1,
0.8376218, 0.2457708, 3.243573, 0.7333333, 0, 1, 1,
0.8392123, 0.01373614, 0.1748176, 0.7411765, 0, 1, 1,
0.8436221, 0.5915652, 1.452152, 0.7450981, 0, 1, 1,
0.8479195, 0.382177, 2.6738, 0.7529412, 0, 1, 1,
0.8543481, -0.2863902, 3.724729, 0.7568628, 0, 1, 1,
0.8562168, -0.5427215, 1.422889, 0.7647059, 0, 1, 1,
0.8625019, 1.387635, -0.249433, 0.7686275, 0, 1, 1,
0.8630125, -0.4088629, 1.868939, 0.7764706, 0, 1, 1,
0.8647739, 0.01475209, 1.40626, 0.7803922, 0, 1, 1,
0.8649496, 0.7696756, 1.348288, 0.7882353, 0, 1, 1,
0.8691958, -0.420986, 3.496735, 0.7921569, 0, 1, 1,
0.8708945, 0.5812146, 1.792372, 0.8, 0, 1, 1,
0.8778709, -0.8057772, 1.826858, 0.8078431, 0, 1, 1,
0.8790292, 0.3350853, 2.085152, 0.8117647, 0, 1, 1,
0.8790618, -0.6289366, 3.206365, 0.8196079, 0, 1, 1,
0.8830574, 0.9832314, 0.5582335, 0.8235294, 0, 1, 1,
0.8886487, -0.111714, 2.229338, 0.8313726, 0, 1, 1,
0.8897702, -0.2709372, -0.6638057, 0.8352941, 0, 1, 1,
0.8969274, 0.5310938, 0.7082958, 0.8431373, 0, 1, 1,
0.8981694, -0.2856488, 1.908261, 0.8470588, 0, 1, 1,
0.8998417, -0.6684268, 2.403486, 0.854902, 0, 1, 1,
0.9006724, -0.8784553, 2.279419, 0.8588235, 0, 1, 1,
0.9159327, 0.9657999, 0.4173616, 0.8666667, 0, 1, 1,
0.9218306, -1.830169, 1.91897, 0.8705882, 0, 1, 1,
0.9241629, 0.435776, 0.8576307, 0.8784314, 0, 1, 1,
0.9270393, -0.534411, 2.473265, 0.8823529, 0, 1, 1,
0.9276114, -0.6718681, 2.881742, 0.8901961, 0, 1, 1,
0.9277006, 0.4177558, 0.5436516, 0.8941177, 0, 1, 1,
0.9415291, -0.6028316, 1.654446, 0.9019608, 0, 1, 1,
0.9549477, 1.071697, 0.9934858, 0.9098039, 0, 1, 1,
0.9615795, 0.6477921, -1.142038, 0.9137255, 0, 1, 1,
0.9711674, -1.952738, 1.847197, 0.9215686, 0, 1, 1,
0.974619, 1.150586, 0.2074681, 0.9254902, 0, 1, 1,
0.9754052, 1.022196, -0.3751363, 0.9333333, 0, 1, 1,
0.9787499, 0.4151169, 3.089144, 0.9372549, 0, 1, 1,
0.9818241, -0.9804075, 1.794725, 0.945098, 0, 1, 1,
0.9828537, 1.925765, -0.9375156, 0.9490196, 0, 1, 1,
0.9864152, -1.720879, 2.198676, 0.9568627, 0, 1, 1,
0.9899606, 0.9402723, 0.1969538, 0.9607843, 0, 1, 1,
0.9939047, -0.1508455, 2.163969, 0.9686275, 0, 1, 1,
1.003306, 0.6474978, -0.563504, 0.972549, 0, 1, 1,
1.004313, 0.349267, 0.609281, 0.9803922, 0, 1, 1,
1.004808, -0.5579538, 2.614166, 0.9843137, 0, 1, 1,
1.009268, -0.1117145, 3.320236, 0.9921569, 0, 1, 1,
1.011657, 0.08159436, 1.739953, 0.9960784, 0, 1, 1,
1.012198, -0.5372908, 1.11485, 1, 0, 0.9960784, 1,
1.018432, -0.1583801, 1.924751, 1, 0, 0.9882353, 1,
1.020552, 0.2775349, 2.420245, 1, 0, 0.9843137, 1,
1.027653, 0.3047715, -1.098727, 1, 0, 0.9764706, 1,
1.032215, -0.8949491, 2.461149, 1, 0, 0.972549, 1,
1.033695, 1.997635, 1.70303, 1, 0, 0.9647059, 1,
1.037742, 0.4467775, 1.402073, 1, 0, 0.9607843, 1,
1.062427, 0.4595608, 0.5034311, 1, 0, 0.9529412, 1,
1.06481, 0.930275, -0.115052, 1, 0, 0.9490196, 1,
1.065698, 0.8146119, 2.119003, 1, 0, 0.9411765, 1,
1.075644, -0.2773868, 1.041372, 1, 0, 0.9372549, 1,
1.07642, -1.287831, 1.416954, 1, 0, 0.9294118, 1,
1.080742, -0.930721, 3.756399, 1, 0, 0.9254902, 1,
1.086348, 0.6986558, 0.6923307, 1, 0, 0.9176471, 1,
1.088164, -0.8104532, 1.796031, 1, 0, 0.9137255, 1,
1.093176, -0.8488104, 3.665349, 1, 0, 0.9058824, 1,
1.097521, 0.6665575, 0.3025043, 1, 0, 0.9019608, 1,
1.099668, 0.8192748, 0.7909093, 1, 0, 0.8941177, 1,
1.099828, 0.1003584, 1.518558, 1, 0, 0.8862745, 1,
1.102603, 1.034415, -0.3045446, 1, 0, 0.8823529, 1,
1.104102, 0.534735, 1.707271, 1, 0, 0.8745098, 1,
1.105496, -0.4907493, 2.06801, 1, 0, 0.8705882, 1,
1.107076, 0.7316248, 1.036806, 1, 0, 0.8627451, 1,
1.107792, 0.5509544, 1.34873, 1, 0, 0.8588235, 1,
1.117259, -0.03803165, -0.7013269, 1, 0, 0.8509804, 1,
1.118852, 0.7586229, 2.783393, 1, 0, 0.8470588, 1,
1.119116, -0.7761839, 3.370472, 1, 0, 0.8392157, 1,
1.120808, 0.07923417, -0.411708, 1, 0, 0.8352941, 1,
1.124303, 0.7031249, 0.3553821, 1, 0, 0.827451, 1,
1.126816, 0.5471953, 0.9476966, 1, 0, 0.8235294, 1,
1.128373, -1.496872, 1.816551, 1, 0, 0.8156863, 1,
1.139848, 1.701396, 0.8994306, 1, 0, 0.8117647, 1,
1.148446, 0.8372334, 1.195133, 1, 0, 0.8039216, 1,
1.151615, -0.05789908, 0.5971841, 1, 0, 0.7960784, 1,
1.15862, -0.6320753, 2.945385, 1, 0, 0.7921569, 1,
1.161808, -0.1847915, 2.12543, 1, 0, 0.7843137, 1,
1.165831, -0.9571968, 2.209163, 1, 0, 0.7803922, 1,
1.167914, -1.045762, 1.322925, 1, 0, 0.772549, 1,
1.170216, 0.03512184, 2.692632, 1, 0, 0.7686275, 1,
1.171034, 0.2283237, 0.3187822, 1, 0, 0.7607843, 1,
1.178079, -1.597896, 2.972404, 1, 0, 0.7568628, 1,
1.179652, -0.4825625, 1.649141, 1, 0, 0.7490196, 1,
1.179731, -2.20437, 2.569322, 1, 0, 0.7450981, 1,
1.180669, -0.302237, 2.715993, 1, 0, 0.7372549, 1,
1.183047, 0.7982866, 1.324713, 1, 0, 0.7333333, 1,
1.186341, -1.106995, 1.852301, 1, 0, 0.7254902, 1,
1.197759, 2.119819, 0.7619181, 1, 0, 0.7215686, 1,
1.206008, -2.013993, 2.301399, 1, 0, 0.7137255, 1,
1.209734, 0.1135648, 2.16792, 1, 0, 0.7098039, 1,
1.223262, -0.3571131, 2.575241, 1, 0, 0.7019608, 1,
1.227694, 0.5961094, 1.312506, 1, 0, 0.6941177, 1,
1.240701, -2.055926, 1.835613, 1, 0, 0.6901961, 1,
1.245339, 0.2142295, 1.89896, 1, 0, 0.682353, 1,
1.245904, 0.2246461, 1.345007, 1, 0, 0.6784314, 1,
1.246171, -0.02073057, 0.9606306, 1, 0, 0.6705883, 1,
1.255791, -1.118479, 4.739766, 1, 0, 0.6666667, 1,
1.260869, -0.2823218, -0.4024665, 1, 0, 0.6588235, 1,
1.265556, 0.72582, 0.4783284, 1, 0, 0.654902, 1,
1.269943, 2.21839, 0.510811, 1, 0, 0.6470588, 1,
1.277992, -1.377316, 0.367348, 1, 0, 0.6431373, 1,
1.287566, -1.176896, 3.143214, 1, 0, 0.6352941, 1,
1.287681, -0.3788461, 1.488443, 1, 0, 0.6313726, 1,
1.290386, -0.9542398, 3.288155, 1, 0, 0.6235294, 1,
1.295045, -0.6709615, 2.496339, 1, 0, 0.6196079, 1,
1.297825, 1.070346, 1.266629, 1, 0, 0.6117647, 1,
1.319941, -0.5800127, 1.804855, 1, 0, 0.6078432, 1,
1.336023, 1.849993, 3.248832, 1, 0, 0.6, 1,
1.336698, 0.08828536, 2.710559, 1, 0, 0.5921569, 1,
1.344486, 0.9127536, 0.9256688, 1, 0, 0.5882353, 1,
1.346352, 0.9913534, 0.2666529, 1, 0, 0.5803922, 1,
1.348192, -0.1702887, 2.245955, 1, 0, 0.5764706, 1,
1.348788, 1.383254, -0.1285111, 1, 0, 0.5686275, 1,
1.348934, 2.51119, 0.1957016, 1, 0, 0.5647059, 1,
1.362355, 1.717903, 0.1993365, 1, 0, 0.5568628, 1,
1.373502, 0.670978, 1.004722, 1, 0, 0.5529412, 1,
1.38175, -0.5844163, 2.746749, 1, 0, 0.5450981, 1,
1.384511, -0.7532032, 3.071353, 1, 0, 0.5411765, 1,
1.392455, 0.4904608, -0.7169901, 1, 0, 0.5333334, 1,
1.393885, -0.4386972, 2.608847, 1, 0, 0.5294118, 1,
1.394706, 0.8925306, 0.9760122, 1, 0, 0.5215687, 1,
1.409613, 0.6636645, 1.529731, 1, 0, 0.5176471, 1,
1.416036, -2.308163, 2.254608, 1, 0, 0.509804, 1,
1.419617, -0.3919482, 2.691973, 1, 0, 0.5058824, 1,
1.424753, -1.039802, 2.396811, 1, 0, 0.4980392, 1,
1.450154, -1.286877, 3.369428, 1, 0, 0.4901961, 1,
1.452191, 1.316568, 0.6309049, 1, 0, 0.4862745, 1,
1.457899, 1.200799, 1.051499, 1, 0, 0.4784314, 1,
1.460041, -1.335285, 2.429522, 1, 0, 0.4745098, 1,
1.491262, -0.7934252, 2.752295, 1, 0, 0.4666667, 1,
1.498769, 1.272912, 2.784864, 1, 0, 0.4627451, 1,
1.501847, -0.292818, 1.514768, 1, 0, 0.454902, 1,
1.50579, -2.591937, 2.436261, 1, 0, 0.4509804, 1,
1.507875, -2.612604, 4.395936, 1, 0, 0.4431373, 1,
1.5254, -0.391753, 1.964321, 1, 0, 0.4392157, 1,
1.531424, -0.2194418, 0.5128966, 1, 0, 0.4313726, 1,
1.53695, 0.966665, 2.258149, 1, 0, 0.427451, 1,
1.551143, 0.8195118, 1.629212, 1, 0, 0.4196078, 1,
1.559945, -0.118883, 0.1737904, 1, 0, 0.4156863, 1,
1.564148, 0.01086635, 3.115111, 1, 0, 0.4078431, 1,
1.576515, -1.738765, 3.540707, 1, 0, 0.4039216, 1,
1.577632, 0.2480662, 1.941628, 1, 0, 0.3960784, 1,
1.580227, -0.8885015, 1.077956, 1, 0, 0.3882353, 1,
1.581517, 1.024656, 1.354348, 1, 0, 0.3843137, 1,
1.582017, 1.701766, -0.2036143, 1, 0, 0.3764706, 1,
1.590674, 0.2073924, -0.09308825, 1, 0, 0.372549, 1,
1.594622, -0.3540778, 2.629145, 1, 0, 0.3647059, 1,
1.597404, 0.9206316, 1.503251, 1, 0, 0.3607843, 1,
1.603058, -0.3242507, 0.2570082, 1, 0, 0.3529412, 1,
1.611404, -0.3041295, 2.770771, 1, 0, 0.3490196, 1,
1.613605, 0.2440358, 3.4668, 1, 0, 0.3411765, 1,
1.625445, 0.6422299, 3.360211, 1, 0, 0.3372549, 1,
1.642253, 0.01061172, 2.313462, 1, 0, 0.3294118, 1,
1.643888, 2.561989, -0.02623759, 1, 0, 0.3254902, 1,
1.654001, 0.3360582, -0.4112261, 1, 0, 0.3176471, 1,
1.687598, 2.250682, 1.184021, 1, 0, 0.3137255, 1,
1.689569, -0.2148838, 1.445499, 1, 0, 0.3058824, 1,
1.713828, -0.4801856, 1.557262, 1, 0, 0.2980392, 1,
1.716182, 0.7954327, 0.09316987, 1, 0, 0.2941177, 1,
1.72617, 0.4134995, 0.8331224, 1, 0, 0.2862745, 1,
1.73398, -0.4606862, 2.047023, 1, 0, 0.282353, 1,
1.744472, -1.607613, 2.880591, 1, 0, 0.2745098, 1,
1.752693, 0.4580688, 0.6623414, 1, 0, 0.2705882, 1,
1.761194, 0.8525676, 0.04329212, 1, 0, 0.2627451, 1,
1.766897, 0.5642161, 1.926269, 1, 0, 0.2588235, 1,
1.786812, 2.297421, 1.994612, 1, 0, 0.2509804, 1,
1.794428, 0.2764834, 1.29646, 1, 0, 0.2470588, 1,
1.811211, -0.6346118, 0.9955146, 1, 0, 0.2392157, 1,
1.820135, 0.791489, 2.408145, 1, 0, 0.2352941, 1,
1.823061, 0.5185211, 1.934285, 1, 0, 0.227451, 1,
1.846989, 0.3748218, 2.292379, 1, 0, 0.2235294, 1,
1.861092, 0.2469279, 1.305788, 1, 0, 0.2156863, 1,
1.86341, 0.7149452, 0.3734688, 1, 0, 0.2117647, 1,
1.87254, 0.3735079, 3.487588, 1, 0, 0.2039216, 1,
1.875253, -0.4989321, 2.707179, 1, 0, 0.1960784, 1,
1.880427, 0.5459754, 0.8638265, 1, 0, 0.1921569, 1,
1.909563, 2.402871, -0.5540259, 1, 0, 0.1843137, 1,
1.915585, 0.7434601, 1.149364, 1, 0, 0.1803922, 1,
1.915937, 0.08460661, -0.01853458, 1, 0, 0.172549, 1,
1.92204, -0.5719442, 2.058356, 1, 0, 0.1686275, 1,
1.922526, 0.2596678, 1.956879, 1, 0, 0.1607843, 1,
1.923701, 0.5535424, -0.373091, 1, 0, 0.1568628, 1,
1.958189, 0.3173033, 2.644557, 1, 0, 0.1490196, 1,
1.95846, -0.6066528, 1.054231, 1, 0, 0.145098, 1,
1.980233, -2.198772, 1.024682, 1, 0, 0.1372549, 1,
1.983974, 0.3425122, 1.271021, 1, 0, 0.1333333, 1,
1.998197, -0.6562843, 1.544535, 1, 0, 0.1254902, 1,
2.001744, 1.236806, -0.6477976, 1, 0, 0.1215686, 1,
2.006297, -0.1492862, 1.851898, 1, 0, 0.1137255, 1,
2.009607, 2.416382, 0.1386429, 1, 0, 0.1098039, 1,
2.067858, -0.5765604, 2.955407, 1, 0, 0.1019608, 1,
2.079026, 0.6024103, 2.332495, 1, 0, 0.09411765, 1,
2.097677, 0.6537245, 0.6687287, 1, 0, 0.09019608, 1,
2.100588, 1.047144, 1.896983, 1, 0, 0.08235294, 1,
2.120713, 0.01812195, 1.790759, 1, 0, 0.07843138, 1,
2.154985, -1.388254, 2.416196, 1, 0, 0.07058824, 1,
2.224574, 0.01426607, 1.627248, 1, 0, 0.06666667, 1,
2.241633, 0.3381923, 2.541064, 1, 0, 0.05882353, 1,
2.262883, 1.873795, -0.2349892, 1, 0, 0.05490196, 1,
2.282913, -0.6978239, 3.654421, 1, 0, 0.04705882, 1,
2.295566, 0.9002267, 1.0057, 1, 0, 0.04313726, 1,
2.317305, 0.9408234, 0.5761067, 1, 0, 0.03529412, 1,
2.465165, -0.3367598, 3.060561, 1, 0, 0.03137255, 1,
2.467803, 0.7384288, 3.352895, 1, 0, 0.02352941, 1,
2.481279, 0.5033954, 2.248559, 1, 0, 0.01960784, 1,
2.827519, -0.8080106, 1.022237, 1, 0, 0.01176471, 1,
2.929255, -0.7365755, 2.44471, 1, 0, 0.007843138, 1
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
-0.1209031, -3.974716, -6.981607, 0, -0.5, 0.5, 0.5,
-0.1209031, -3.974716, -6.981607, 1, -0.5, 0.5, 0.5,
-0.1209031, -3.974716, -6.981607, 1, 1.5, 0.5, 0.5,
-0.1209031, -3.974716, -6.981607, 0, 1.5, 0.5, 0.5
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
-4.205065, 0.37097, -6.981607, 0, -0.5, 0.5, 0.5,
-4.205065, 0.37097, -6.981607, 1, -0.5, 0.5, 0.5,
-4.205065, 0.37097, -6.981607, 1, 1.5, 0.5, 0.5,
-4.205065, 0.37097, -6.981607, 0, 1.5, 0.5, 0.5
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
-4.205065, -3.974716, 0.1510305, 0, -0.5, 0.5, 0.5,
-4.205065, -3.974716, 0.1510305, 1, -0.5, 0.5, 0.5,
-4.205065, -3.974716, 0.1510305, 1, 1.5, 0.5, 0.5,
-4.205065, -3.974716, 0.1510305, 0, 1.5, 0.5, 0.5
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
-3, -2.971865, -5.335614,
2, -2.971865, -5.335614,
-3, -2.971865, -5.335614,
-3, -3.139007, -5.609946,
-2, -2.971865, -5.335614,
-2, -3.139007, -5.609946,
-1, -2.971865, -5.335614,
-1, -3.139007, -5.609946,
0, -2.971865, -5.335614,
0, -3.139007, -5.609946,
1, -2.971865, -5.335614,
1, -3.139007, -5.609946,
2, -2.971865, -5.335614,
2, -3.139007, -5.609946
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
-3, -3.473291, -6.15861, 0, -0.5, 0.5, 0.5,
-3, -3.473291, -6.15861, 1, -0.5, 0.5, 0.5,
-3, -3.473291, -6.15861, 1, 1.5, 0.5, 0.5,
-3, -3.473291, -6.15861, 0, 1.5, 0.5, 0.5,
-2, -3.473291, -6.15861, 0, -0.5, 0.5, 0.5,
-2, -3.473291, -6.15861, 1, -0.5, 0.5, 0.5,
-2, -3.473291, -6.15861, 1, 1.5, 0.5, 0.5,
-2, -3.473291, -6.15861, 0, 1.5, 0.5, 0.5,
-1, -3.473291, -6.15861, 0, -0.5, 0.5, 0.5,
-1, -3.473291, -6.15861, 1, -0.5, 0.5, 0.5,
-1, -3.473291, -6.15861, 1, 1.5, 0.5, 0.5,
-1, -3.473291, -6.15861, 0, 1.5, 0.5, 0.5,
0, -3.473291, -6.15861, 0, -0.5, 0.5, 0.5,
0, -3.473291, -6.15861, 1, -0.5, 0.5, 0.5,
0, -3.473291, -6.15861, 1, 1.5, 0.5, 0.5,
0, -3.473291, -6.15861, 0, 1.5, 0.5, 0.5,
1, -3.473291, -6.15861, 0, -0.5, 0.5, 0.5,
1, -3.473291, -6.15861, 1, -0.5, 0.5, 0.5,
1, -3.473291, -6.15861, 1, 1.5, 0.5, 0.5,
1, -3.473291, -6.15861, 0, 1.5, 0.5, 0.5,
2, -3.473291, -6.15861, 0, -0.5, 0.5, 0.5,
2, -3.473291, -6.15861, 1, -0.5, 0.5, 0.5,
2, -3.473291, -6.15861, 1, 1.5, 0.5, 0.5,
2, -3.473291, -6.15861, 0, 1.5, 0.5, 0.5
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
-3.262566, -2, -5.335614,
-3.262566, 3, -5.335614,
-3.262566, -2, -5.335614,
-3.419649, -2, -5.609946,
-3.262566, -1, -5.335614,
-3.419649, -1, -5.609946,
-3.262566, 0, -5.335614,
-3.419649, 0, -5.609946,
-3.262566, 1, -5.335614,
-3.419649, 1, -5.609946,
-3.262566, 2, -5.335614,
-3.419649, 2, -5.609946,
-3.262566, 3, -5.335614,
-3.419649, 3, -5.609946
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
-3.733815, -2, -6.15861, 0, -0.5, 0.5, 0.5,
-3.733815, -2, -6.15861, 1, -0.5, 0.5, 0.5,
-3.733815, -2, -6.15861, 1, 1.5, 0.5, 0.5,
-3.733815, -2, -6.15861, 0, 1.5, 0.5, 0.5,
-3.733815, -1, -6.15861, 0, -0.5, 0.5, 0.5,
-3.733815, -1, -6.15861, 1, -0.5, 0.5, 0.5,
-3.733815, -1, -6.15861, 1, 1.5, 0.5, 0.5,
-3.733815, -1, -6.15861, 0, 1.5, 0.5, 0.5,
-3.733815, 0, -6.15861, 0, -0.5, 0.5, 0.5,
-3.733815, 0, -6.15861, 1, -0.5, 0.5, 0.5,
-3.733815, 0, -6.15861, 1, 1.5, 0.5, 0.5,
-3.733815, 0, -6.15861, 0, 1.5, 0.5, 0.5,
-3.733815, 1, -6.15861, 0, -0.5, 0.5, 0.5,
-3.733815, 1, -6.15861, 1, -0.5, 0.5, 0.5,
-3.733815, 1, -6.15861, 1, 1.5, 0.5, 0.5,
-3.733815, 1, -6.15861, 0, 1.5, 0.5, 0.5,
-3.733815, 2, -6.15861, 0, -0.5, 0.5, 0.5,
-3.733815, 2, -6.15861, 1, -0.5, 0.5, 0.5,
-3.733815, 2, -6.15861, 1, 1.5, 0.5, 0.5,
-3.733815, 2, -6.15861, 0, 1.5, 0.5, 0.5,
-3.733815, 3, -6.15861, 0, -0.5, 0.5, 0.5,
-3.733815, 3, -6.15861, 1, -0.5, 0.5, 0.5,
-3.733815, 3, -6.15861, 1, 1.5, 0.5, 0.5,
-3.733815, 3, -6.15861, 0, 1.5, 0.5, 0.5
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
-3.262566, -2.971865, -4,
-3.262566, -2.971865, 4,
-3.262566, -2.971865, -4,
-3.419649, -3.139007, -4,
-3.262566, -2.971865, -2,
-3.419649, -3.139007, -2,
-3.262566, -2.971865, 0,
-3.419649, -3.139007, 0,
-3.262566, -2.971865, 2,
-3.419649, -3.139007, 2,
-3.262566, -2.971865, 4,
-3.419649, -3.139007, 4
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
-3.733815, -3.473291, -4, 0, -0.5, 0.5, 0.5,
-3.733815, -3.473291, -4, 1, -0.5, 0.5, 0.5,
-3.733815, -3.473291, -4, 1, 1.5, 0.5, 0.5,
-3.733815, -3.473291, -4, 0, 1.5, 0.5, 0.5,
-3.733815, -3.473291, -2, 0, -0.5, 0.5, 0.5,
-3.733815, -3.473291, -2, 1, -0.5, 0.5, 0.5,
-3.733815, -3.473291, -2, 1, 1.5, 0.5, 0.5,
-3.733815, -3.473291, -2, 0, 1.5, 0.5, 0.5,
-3.733815, -3.473291, 0, 0, -0.5, 0.5, 0.5,
-3.733815, -3.473291, 0, 1, -0.5, 0.5, 0.5,
-3.733815, -3.473291, 0, 1, 1.5, 0.5, 0.5,
-3.733815, -3.473291, 0, 0, 1.5, 0.5, 0.5,
-3.733815, -3.473291, 2, 0, -0.5, 0.5, 0.5,
-3.733815, -3.473291, 2, 1, -0.5, 0.5, 0.5,
-3.733815, -3.473291, 2, 1, 1.5, 0.5, 0.5,
-3.733815, -3.473291, 2, 0, 1.5, 0.5, 0.5,
-3.733815, -3.473291, 4, 0, -0.5, 0.5, 0.5,
-3.733815, -3.473291, 4, 1, -0.5, 0.5, 0.5,
-3.733815, -3.473291, 4, 1, 1.5, 0.5, 0.5,
-3.733815, -3.473291, 4, 0, 1.5, 0.5, 0.5
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
-3.262566, -2.971865, -5.335614,
-3.262566, 3.713805, -5.335614,
-3.262566, -2.971865, 5.637675,
-3.262566, 3.713805, 5.637675,
-3.262566, -2.971865, -5.335614,
-3.262566, -2.971865, 5.637675,
-3.262566, 3.713805, -5.335614,
-3.262566, 3.713805, 5.637675,
-3.262566, -2.971865, -5.335614,
3.02076, -2.971865, -5.335614,
-3.262566, -2.971865, 5.637675,
3.02076, -2.971865, 5.637675,
-3.262566, 3.713805, -5.335614,
3.02076, 3.713805, -5.335614,
-3.262566, 3.713805, 5.637675,
3.02076, 3.713805, 5.637675,
3.02076, -2.971865, -5.335614,
3.02076, 3.713805, -5.335614,
3.02076, -2.971865, 5.637675,
3.02076, 3.713805, 5.637675,
3.02076, -2.971865, -5.335614,
3.02076, -2.971865, 5.637675,
3.02076, 3.713805, -5.335614,
3.02076, 3.713805, 5.637675
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
var radius = 7.637816;
var distance = 33.9815;
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
mvMatrix.translate( 0.1209031, -0.37097, -0.1510305 );
mvMatrix.scale( 1.314297, 1.235202, 0.752569 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.9815);
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
Hepta<-read.table("Hepta.xyz")
```

```
## Error in read.table("Hepta.xyz"): no lines available in input
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
-3.171061, -0.9552104, -1.909362, 0, 0, 1, 1, 1,
-3.117664, 0.4235291, -2.98359, 1, 0, 0, 1, 1,
-2.678447, 0.3266883, -1.648761, 1, 0, 0, 1, 1,
-2.518061, -0.5917735, -1.752088, 1, 0, 0, 1, 1,
-2.506526, 0.8193418, 0.5325936, 1, 0, 0, 1, 1,
-2.490241, 1.955796, -1.376533, 1, 0, 0, 1, 1,
-2.47342, 1.665123, -1.271417, 0, 0, 0, 1, 1,
-2.399341, -1.765974, -2.606831, 0, 0, 0, 1, 1,
-2.345822, -0.3679785, -1.299531, 0, 0, 0, 1, 1,
-2.329509, 0.04885505, -0.6949829, 0, 0, 0, 1, 1,
-2.305091, 0.4189174, -0.7024395, 0, 0, 0, 1, 1,
-2.292039, -0.6837181, -1.206983, 0, 0, 0, 1, 1,
-2.272243, -0.5158613, -0.3482452, 0, 0, 0, 1, 1,
-2.16552, -0.5365862, -0.7792903, 1, 1, 1, 1, 1,
-2.16055, 0.8665497, -1.710827, 1, 1, 1, 1, 1,
-2.147694, -0.2877043, -1.419425, 1, 1, 1, 1, 1,
-2.12815, -1.729026, -2.573734, 1, 1, 1, 1, 1,
-2.127301, 1.243303, -0.929875, 1, 1, 1, 1, 1,
-2.098237, -1.494221, -3.223372, 1, 1, 1, 1, 1,
-1.987851, 0.8431236, -1.370741, 1, 1, 1, 1, 1,
-1.947392, -0.7580067, -1.371963, 1, 1, 1, 1, 1,
-1.938612, -0.3690404, -2.877798, 1, 1, 1, 1, 1,
-1.935976, 0.2479035, -0.4268351, 1, 1, 1, 1, 1,
-1.914647, -0.1848145, -0.5228786, 1, 1, 1, 1, 1,
-1.890686, -0.1561653, -1.915876, 1, 1, 1, 1, 1,
-1.884172, 0.7287779, -1.275134, 1, 1, 1, 1, 1,
-1.86935, 0.2053615, -0.990048, 1, 1, 1, 1, 1,
-1.868567, 0.08008082, -2.870452, 1, 1, 1, 1, 1,
-1.85964, -0.4130544, -1.869646, 0, 0, 1, 1, 1,
-1.850743, -0.2437855, -1.171026, 1, 0, 0, 1, 1,
-1.823459, 0.3548591, -1.407718, 1, 0, 0, 1, 1,
-1.815662, 1.012297, -0.6446658, 1, 0, 0, 1, 1,
-1.790243, 0.6690288, -0.480617, 1, 0, 0, 1, 1,
-1.782206, -0.7938678, -1.89888, 1, 0, 0, 1, 1,
-1.776061, 1.329443, -1.835154, 0, 0, 0, 1, 1,
-1.775899, -2.454355, -2.727734, 0, 0, 0, 1, 1,
-1.75942, -1.052475, -1.449311, 0, 0, 0, 1, 1,
-1.745159, -0.3791023, -0.975936, 0, 0, 0, 1, 1,
-1.712121, -1.137371, -2.631767, 0, 0, 0, 1, 1,
-1.702622, -0.9446298, -2.626497, 0, 0, 0, 1, 1,
-1.701287, -0.3360316, -2.103384, 0, 0, 0, 1, 1,
-1.689464, -1.267607, -2.463538, 1, 1, 1, 1, 1,
-1.682692, 0.1627055, -2.74466, 1, 1, 1, 1, 1,
-1.680465, 0.6839805, 0.1256315, 1, 1, 1, 1, 1,
-1.665177, 0.2687044, -4.415555, 1, 1, 1, 1, 1,
-1.66376, 0.248534, -1.391887, 1, 1, 1, 1, 1,
-1.652673, 0.6899522, -0.777201, 1, 1, 1, 1, 1,
-1.645219, 0.4101685, -0.3622951, 1, 1, 1, 1, 1,
-1.625878, -1.237164, -3.257071, 1, 1, 1, 1, 1,
-1.623851, 2.607801, -0.2706192, 1, 1, 1, 1, 1,
-1.6166, -0.4827293, -0.647958, 1, 1, 1, 1, 1,
-1.60939, -0.9200185, -1.867922, 1, 1, 1, 1, 1,
-1.609061, 0.1545891, -0.4731481, 1, 1, 1, 1, 1,
-1.608983, -0.9501806, -2.76905, 1, 1, 1, 1, 1,
-1.607567, 0.325957, -1.153783, 1, 1, 1, 1, 1,
-1.596794, -2.414898, -5.175808, 1, 1, 1, 1, 1,
-1.588783, 2.730948, 0.05624272, 0, 0, 1, 1, 1,
-1.583094, -1.174565, -0.144552, 1, 0, 0, 1, 1,
-1.58295, -1.0111, -1.487338, 1, 0, 0, 1, 1,
-1.579878, 1.645283, -0.5249071, 1, 0, 0, 1, 1,
-1.566633, -0.6484886, 0.109165, 1, 0, 0, 1, 1,
-1.558376, -0.8429188, -2.562932, 1, 0, 0, 1, 1,
-1.553463, -1.683122, -3.078836, 0, 0, 0, 1, 1,
-1.551494, -0.8369518, -1.481156, 0, 0, 0, 1, 1,
-1.550329, 0.272224, -0.571408, 0, 0, 0, 1, 1,
-1.543669, -0.1384529, -0.05631273, 0, 0, 0, 1, 1,
-1.535197, 0.6139857, -0.5670692, 0, 0, 0, 1, 1,
-1.508032, 0.8400884, -1.140453, 0, 0, 0, 1, 1,
-1.496749, -0.01057758, -0.8070887, 0, 0, 0, 1, 1,
-1.474906, 0.5925277, -2.163443, 1, 1, 1, 1, 1,
-1.471191, -0.7735154, -0.2475335, 1, 1, 1, 1, 1,
-1.469241, 1.804531, -1.388863, 1, 1, 1, 1, 1,
-1.464954, 0.06261025, -0.4999948, 1, 1, 1, 1, 1,
-1.4612, -0.544034, -3.991698, 1, 1, 1, 1, 1,
-1.458872, -0.2846732, -2.733377, 1, 1, 1, 1, 1,
-1.456855, 0.1675295, -1.119159, 1, 1, 1, 1, 1,
-1.454912, 0.4759966, -2.13548, 1, 1, 1, 1, 1,
-1.452851, -0.4213935, -3.835414, 1, 1, 1, 1, 1,
-1.440709, 1.249139, -0.4176781, 1, 1, 1, 1, 1,
-1.434838, 0.6640759, -0.2452493, 1, 1, 1, 1, 1,
-1.42965, 2.447202, -1.012311, 1, 1, 1, 1, 1,
-1.411842, -0.8948092, -0.7910205, 1, 1, 1, 1, 1,
-1.411008, 0.6260859, -0.278198, 1, 1, 1, 1, 1,
-1.407776, -0.5247869, -1.148272, 1, 1, 1, 1, 1,
-1.399202, 0.01108813, -1.83991, 0, 0, 1, 1, 1,
-1.39386, 0.1374497, -1.611614, 1, 0, 0, 1, 1,
-1.390055, -1.069814, -2.49871, 1, 0, 0, 1, 1,
-1.387706, 1.388203, -0.6112182, 1, 0, 0, 1, 1,
-1.382029, -0.7898114, -2.409383, 1, 0, 0, 1, 1,
-1.364963, -0.2391336, -2.13783, 1, 0, 0, 1, 1,
-1.364889, 0.955161, 0.6623598, 0, 0, 0, 1, 1,
-1.362788, 0.6111345, -1.279525, 0, 0, 0, 1, 1,
-1.356239, -1.139411, -2.452244, 0, 0, 0, 1, 1,
-1.344879, -0.2120071, -1.546816, 0, 0, 0, 1, 1,
-1.343466, -1.334827, -2.467955, 0, 0, 0, 1, 1,
-1.339386, 0.4821323, -1.408788, 0, 0, 0, 1, 1,
-1.320034, -0.1552577, -1.583882, 0, 0, 0, 1, 1,
-1.319952, 0.007667262, -1.616529, 1, 1, 1, 1, 1,
-1.319257, 0.5226796, -0.8432794, 1, 1, 1, 1, 1,
-1.317813, 0.7163116, -0.6491438, 1, 1, 1, 1, 1,
-1.306935, 0.2144499, -0.5201228, 1, 1, 1, 1, 1,
-1.306035, 0.7496091, -1.172186, 1, 1, 1, 1, 1,
-1.305647, 0.1703874, -1.799561, 1, 1, 1, 1, 1,
-1.298437, 0.3613826, -1.53748, 1, 1, 1, 1, 1,
-1.286606, -0.3542394, -1.891096, 1, 1, 1, 1, 1,
-1.286526, -0.4793675, -3.538831, 1, 1, 1, 1, 1,
-1.263839, -0.6594616, -1.774079, 1, 1, 1, 1, 1,
-1.261307, 3.616441, -1.062752, 1, 1, 1, 1, 1,
-1.249423, 0.02643731, -2.602389, 1, 1, 1, 1, 1,
-1.249143, -0.131916, -0.2397105, 1, 1, 1, 1, 1,
-1.245562, -0.249637, -1.287467, 1, 1, 1, 1, 1,
-1.24261, -0.8368323, -0.6508765, 1, 1, 1, 1, 1,
-1.237082, -0.9595122, -3.468104, 0, 0, 1, 1, 1,
-1.212436, 0.312335, -1.073155, 1, 0, 0, 1, 1,
-1.21203, 1.247086, -0.01143385, 1, 0, 0, 1, 1,
-1.20462, -0.4392422, -3.454849, 1, 0, 0, 1, 1,
-1.201469, -0.7283568, -2.518955, 1, 0, 0, 1, 1,
-1.190492, 1.250183, -0.6521596, 1, 0, 0, 1, 1,
-1.188102, -1.640205, -2.476162, 0, 0, 0, 1, 1,
-1.178522, 0.7760226, -1.248648, 0, 0, 0, 1, 1,
-1.177519, -0.3889717, -1.493191, 0, 0, 0, 1, 1,
-1.17593, -1.080778, -0.8067458, 0, 0, 0, 1, 1,
-1.175165, 0.1373496, -1.625547, 0, 0, 0, 1, 1,
-1.163497, 0.2443386, -3.064884, 0, 0, 0, 1, 1,
-1.161847, 0.3011214, 0.6068579, 0, 0, 0, 1, 1,
-1.154494, 0.7428533, -0.4540446, 1, 1, 1, 1, 1,
-1.147134, 0.2634368, -3.155032, 1, 1, 1, 1, 1,
-1.141965, 1.985777, -0.5557432, 1, 1, 1, 1, 1,
-1.14019, 2.429635, 0.7507306, 1, 1, 1, 1, 1,
-1.140084, -0.01322816, -0.7433712, 1, 1, 1, 1, 1,
-1.136598, -0.04854144, -1.067549, 1, 1, 1, 1, 1,
-1.132032, -1.963431, -1.669614, 1, 1, 1, 1, 1,
-1.119728, -0.5901749, -1.978682, 1, 1, 1, 1, 1,
-1.115898, 0.08321099, -0.07094822, 1, 1, 1, 1, 1,
-1.112797, 1.560411, -0.3234595, 1, 1, 1, 1, 1,
-1.111169, 0.04442037, -1.394785, 1, 1, 1, 1, 1,
-1.111161, -0.1244847, -0.9500635, 1, 1, 1, 1, 1,
-1.102553, -0.4413053, -2.45058, 1, 1, 1, 1, 1,
-1.098972, 1.199558, -1.776657, 1, 1, 1, 1, 1,
-1.097138, -1.591442, -1.141617, 1, 1, 1, 1, 1,
-1.095232, -1.077423, -1.073597, 0, 0, 1, 1, 1,
-1.093572, 0.685654, -1.281811, 1, 0, 0, 1, 1,
-1.092387, 0.916465, -1.087302, 1, 0, 0, 1, 1,
-1.082748, 0.3947207, -0.3026246, 1, 0, 0, 1, 1,
-1.081372, -0.7665686, -2.216903, 1, 0, 0, 1, 1,
-1.078537, -0.4408375, -1.514116, 1, 0, 0, 1, 1,
-1.071492, -0.1702565, -0.6479589, 0, 0, 0, 1, 1,
-1.070723, -0.1109555, -0.6462339, 0, 0, 0, 1, 1,
-1.069372, -0.4831081, -1.469565, 0, 0, 0, 1, 1,
-1.067849, -1.150018, -2.22805, 0, 0, 0, 1, 1,
-1.067503, -0.9204426, -0.1905322, 0, 0, 0, 1, 1,
-1.056248, -0.5885663, -1.996739, 0, 0, 0, 1, 1,
-1.055541, 0.5960245, -0.6701211, 0, 0, 0, 1, 1,
-1.044318, 0.9674367, -0.7404746, 1, 1, 1, 1, 1,
-1.04214, 0.1994624, -2.212498, 1, 1, 1, 1, 1,
-1.034936, -1.472407, -1.662396, 1, 1, 1, 1, 1,
-1.030123, 0.6694003, 0.0857511, 1, 1, 1, 1, 1,
-1.028579, 1.990813, -1.03395, 1, 1, 1, 1, 1,
-1.014188, 0.05225144, -1.438375, 1, 1, 1, 1, 1,
-1.012213, -0.1623012, -2.411945, 1, 1, 1, 1, 1,
-1.01154, 0.5025961, -1.636441, 1, 1, 1, 1, 1,
-1.005386, -1.881991, -0.05019869, 1, 1, 1, 1, 1,
-1.003608, -0.906655, -1.999512, 1, 1, 1, 1, 1,
-1.000702, 2.658848, 0.2563721, 1, 1, 1, 1, 1,
-1.00047, 0.4283375, -0.2097352, 1, 1, 1, 1, 1,
-0.9973739, 1.081111, -0.1341954, 1, 1, 1, 1, 1,
-0.9963914, -0.3700543, -2.018075, 1, 1, 1, 1, 1,
-0.9760064, -1.507756, -2.68272, 1, 1, 1, 1, 1,
-0.9747381, 1.502705, -0.1174527, 0, 0, 1, 1, 1,
-0.9626469, -0.4843157, -2.662306, 1, 0, 0, 1, 1,
-0.9610733, -0.01105111, -2.585138, 1, 0, 0, 1, 1,
-0.9599055, -1.065399, -2.299354, 1, 0, 0, 1, 1,
-0.9582614, 0.1024669, -0.2809703, 1, 0, 0, 1, 1,
-0.9581555, -0.352519, -1.14156, 1, 0, 0, 1, 1,
-0.9560155, 1.25042, -0.02636124, 0, 0, 0, 1, 1,
-0.9511818, -1.708975, -0.4635501, 0, 0, 0, 1, 1,
-0.9485111, -1.572413, -2.790022, 0, 0, 0, 1, 1,
-0.9471329, -0.4763597, -1.889557, 0, 0, 0, 1, 1,
-0.9458529, -2.099229, -3.67978, 0, 0, 0, 1, 1,
-0.9452638, 1.073936, 0.1314181, 0, 0, 0, 1, 1,
-0.940259, -1.585358, -1.094232, 0, 0, 0, 1, 1,
-0.9349686, 0.2289643, -0.3301114, 1, 1, 1, 1, 1,
-0.9321271, 0.1768954, -2.952821, 1, 1, 1, 1, 1,
-0.9285615, 0.04752493, -1.069172, 1, 1, 1, 1, 1,
-0.9274998, 0.3186975, -2.278763, 1, 1, 1, 1, 1,
-0.9269769, -0.2345511, -2.942555, 1, 1, 1, 1, 1,
-0.924606, -0.4990723, -1.803736, 1, 1, 1, 1, 1,
-0.9226512, 0.3806835, -0.9255687, 1, 1, 1, 1, 1,
-0.9222525, -1.547421, -1.586787, 1, 1, 1, 1, 1,
-0.9217702, 0.02255826, -2.244209, 1, 1, 1, 1, 1,
-0.91581, 0.4271517, -0.5337658, 1, 1, 1, 1, 1,
-0.8995929, 0.9180546, -1.143353, 1, 1, 1, 1, 1,
-0.8907554, 0.3739925, -0.04597104, 1, 1, 1, 1, 1,
-0.8895119, -0.3927501, -3.214778, 1, 1, 1, 1, 1,
-0.8868529, 0.9191081, 1.445298, 1, 1, 1, 1, 1,
-0.8860986, 0.5075234, -2.605794, 1, 1, 1, 1, 1,
-0.8852205, 0.7035325, -0.6067036, 0, 0, 1, 1, 1,
-0.8837348, -0.2783049, -1.467073, 1, 0, 0, 1, 1,
-0.8802819, -0.7185496, -1.301647, 1, 0, 0, 1, 1,
-0.8723208, -1.046967, -2.262891, 1, 0, 0, 1, 1,
-0.8679412, -0.1988308, -3.814196, 1, 0, 0, 1, 1,
-0.8665469, 0.07162318, -1.568774, 1, 0, 0, 1, 1,
-0.8621961, -0.3200312, -3.154583, 0, 0, 0, 1, 1,
-0.8577029, -1.333327, -0.2577592, 0, 0, 0, 1, 1,
-0.8510866, 0.5262387, -0.8909488, 0, 0, 0, 1, 1,
-0.8455774, -1.582861, -2.995507, 0, 0, 0, 1, 1,
-0.8418893, -0.09536928, -2.107228, 0, 0, 0, 1, 1,
-0.8411212, -0.4808527, -1.580858, 0, 0, 0, 1, 1,
-0.836168, -2.035677, -1.983706, 0, 0, 0, 1, 1,
-0.8348783, 1.688523, -2.122171, 1, 1, 1, 1, 1,
-0.8286226, -0.6020465, -1.154423, 1, 1, 1, 1, 1,
-0.8195915, -0.205162, -0.1429615, 1, 1, 1, 1, 1,
-0.8178176, -0.5327817, -3.226332, 1, 1, 1, 1, 1,
-0.8121175, 0.937506, 0.9572157, 1, 1, 1, 1, 1,
-0.8053046, 0.09347836, 0.06456275, 1, 1, 1, 1, 1,
-0.7968869, 0.3563767, -1.396005, 1, 1, 1, 1, 1,
-0.7954534, -0.1563354, -0.8977633, 1, 1, 1, 1, 1,
-0.7949848, 0.07661645, -1.477493, 1, 1, 1, 1, 1,
-0.7923927, 1.361019, 0.5799236, 1, 1, 1, 1, 1,
-0.7897005, 0.7946399, 0.6731527, 1, 1, 1, 1, 1,
-0.7883842, 1.200255, -1.037768, 1, 1, 1, 1, 1,
-0.7863292, -0.5302644, -0.06793538, 1, 1, 1, 1, 1,
-0.7813233, -1.081517, -2.806974, 1, 1, 1, 1, 1,
-0.7780106, 0.06770969, -2.94031, 1, 1, 1, 1, 1,
-0.7719423, -0.5060902, -2.590421, 0, 0, 1, 1, 1,
-0.7687371, 0.2517291, -2.608185, 1, 0, 0, 1, 1,
-0.7612867, -0.4583662, -2.731804, 1, 0, 0, 1, 1,
-0.7569676, 0.2169473, -0.7141362, 1, 0, 0, 1, 1,
-0.7551224, -2.212431, -2.78382, 1, 0, 0, 1, 1,
-0.7486423, -0.1795976, -0.09482255, 1, 0, 0, 1, 1,
-0.7484992, 0.9618977, -2.145529, 0, 0, 0, 1, 1,
-0.7482155, 1.501875, 0.3954555, 0, 0, 0, 1, 1,
-0.7435511, 0.2578107, -2.912378, 0, 0, 0, 1, 1,
-0.7435462, 0.05085142, -0.06091312, 0, 0, 0, 1, 1,
-0.741899, 1.380939, -0.8568154, 0, 0, 0, 1, 1,
-0.7407805, -0.704039, -2.764542, 0, 0, 0, 1, 1,
-0.7303728, -1.27365, -3.84037, 0, 0, 0, 1, 1,
-0.7297009, -1.520036, -1.72869, 1, 1, 1, 1, 1,
-0.7285646, 0.7666307, -1.130619, 1, 1, 1, 1, 1,
-0.7268499, 1.970951, -0.6017598, 1, 1, 1, 1, 1,
-0.7258892, -0.3211871, -1.395306, 1, 1, 1, 1, 1,
-0.725593, 1.40747, 0.3096128, 1, 1, 1, 1, 1,
-0.7247373, -0.7647225, -1.738065, 1, 1, 1, 1, 1,
-0.7205463, 0.5189227, -2.765182, 1, 1, 1, 1, 1,
-0.7203518, -2.722862, -2.055405, 1, 1, 1, 1, 1,
-0.7195733, -0.1149661, -3.076585, 1, 1, 1, 1, 1,
-0.71359, -1.568078, -0.534509, 1, 1, 1, 1, 1,
-0.6994302, -1.164975, -2.506738, 1, 1, 1, 1, 1,
-0.6992989, -0.1240461, -0.006686365, 1, 1, 1, 1, 1,
-0.6954755, 1.245351, -0.9632348, 1, 1, 1, 1, 1,
-0.6922058, -0.8977808, -3.216871, 1, 1, 1, 1, 1,
-0.692038, 1.197802, 0.5210434, 1, 1, 1, 1, 1,
-0.6912797, 0.8419213, -0.2152348, 0, 0, 1, 1, 1,
-0.6771787, -1.021146, -1.431713, 1, 0, 0, 1, 1,
-0.6695091, -0.01125572, -0.9330025, 1, 0, 0, 1, 1,
-0.6687719, 0.7297895, 0.03977541, 1, 0, 0, 1, 1,
-0.6641667, -1.147998, -1.204123, 1, 0, 0, 1, 1,
-0.6609431, -0.6338034, -2.604156, 1, 0, 0, 1, 1,
-0.6596509, -0.9520493, -3.106897, 0, 0, 0, 1, 1,
-0.6590313, -0.5742998, -3.669898, 0, 0, 0, 1, 1,
-0.6579516, -0.6704606, -0.6941711, 0, 0, 0, 1, 1,
-0.6559223, 0.06798796, -2.619149, 0, 0, 0, 1, 1,
-0.6558153, -0.9820237, -3.353938, 0, 0, 0, 1, 1,
-0.6550276, 1.610885, 1.256643, 0, 0, 0, 1, 1,
-0.6515772, -0.3396376, 0.4703573, 0, 0, 0, 1, 1,
-0.6507694, -0.07032891, -2.265761, 1, 1, 1, 1, 1,
-0.6402853, 1.018644, -2.307696, 1, 1, 1, 1, 1,
-0.6399881, -0.5694031, -2.089536, 1, 1, 1, 1, 1,
-0.6390898, 0.2014036, -1.85775, 1, 1, 1, 1, 1,
-0.6338159, 0.4260913, -0.2758988, 1, 1, 1, 1, 1,
-0.6313707, 1.175061, 0.6486589, 1, 1, 1, 1, 1,
-0.6308286, -0.003160444, -1.896325, 1, 1, 1, 1, 1,
-0.6256086, -2.017073, -1.532545, 1, 1, 1, 1, 1,
-0.624199, -0.5261739, -0.9383606, 1, 1, 1, 1, 1,
-0.6231452, -0.1728142, -1.118744, 1, 1, 1, 1, 1,
-0.6229383, -0.7395983, -2.987845, 1, 1, 1, 1, 1,
-0.6122512, 1.295092, 0.09569556, 1, 1, 1, 1, 1,
-0.612195, 0.5708583, -1.718569, 1, 1, 1, 1, 1,
-0.6073847, -0.4198733, -1.641194, 1, 1, 1, 1, 1,
-0.6066856, -0.5162899, -2.415761, 1, 1, 1, 1, 1,
-0.6065754, -0.5929276, -1.068692, 0, 0, 1, 1, 1,
-0.6063405, 0.1345079, -2.341029, 1, 0, 0, 1, 1,
-0.6031071, -0.7806513, -1.686936, 1, 0, 0, 1, 1,
-0.6027697, -0.127674, -0.4425508, 1, 0, 0, 1, 1,
-0.5968515, 2.040746, -0.7229684, 1, 0, 0, 1, 1,
-0.5961834, -0.4119888, -2.199384, 1, 0, 0, 1, 1,
-0.5901022, 0.9790466, -0.0867442, 0, 0, 0, 1, 1,
-0.5892524, 0.332771, -1.491448, 0, 0, 0, 1, 1,
-0.5812608, 0.8313357, -0.6267518, 0, 0, 0, 1, 1,
-0.5782124, 0.7265437, -0.5857238, 0, 0, 0, 1, 1,
-0.5737259, 0.8944471, -0.8266396, 0, 0, 0, 1, 1,
-0.5679482, -0.5323456, -1.839859, 0, 0, 0, 1, 1,
-0.5648043, -1.233496, -3.103759, 0, 0, 0, 1, 1,
-0.5603797, 0.04395673, -2.640646, 1, 1, 1, 1, 1,
-0.5515044, -0.4822235, -2.96035, 1, 1, 1, 1, 1,
-0.5490791, 0.2357997, -0.1143812, 1, 1, 1, 1, 1,
-0.5454096, 1.174744, -1.249682, 1, 1, 1, 1, 1,
-0.5408083, 1.434154, -0.1982948, 1, 1, 1, 1, 1,
-0.53584, 0.6185014, -0.1688551, 1, 1, 1, 1, 1,
-0.5336908, 0.6945307, -0.3114239, 1, 1, 1, 1, 1,
-0.5312543, -1.251994, -2.085385, 1, 1, 1, 1, 1,
-0.5275433, 1.415591, -0.7275132, 1, 1, 1, 1, 1,
-0.5274721, 1.402187, -2.438043, 1, 1, 1, 1, 1,
-0.5253305, 1.465421, 1.19052, 1, 1, 1, 1, 1,
-0.5239429, -0.684155, -3.705262, 1, 1, 1, 1, 1,
-0.5228752, -0.6949059, -3.328285, 1, 1, 1, 1, 1,
-0.5224165, -2.398108, -1.872258, 1, 1, 1, 1, 1,
-0.5208774, -0.3781862, -1.732869, 1, 1, 1, 1, 1,
-0.5194398, 1.89445, 0.1617687, 0, 0, 1, 1, 1,
-0.5178227, 0.2429927, -0.8238387, 1, 0, 0, 1, 1,
-0.5162905, -0.09447977, -2.268529, 1, 0, 0, 1, 1,
-0.5127045, 1.376775, 0.7171472, 1, 0, 0, 1, 1,
-0.5121918, 0.7029948, -1.716865, 1, 0, 0, 1, 1,
-0.5102547, 0.2021372, -1.930974, 1, 0, 0, 1, 1,
-0.5003741, 0.1504957, -2.42476, 0, 0, 0, 1, 1,
-0.499671, -0.1830424, -3.000004, 0, 0, 0, 1, 1,
-0.4981083, -0.2857997, -1.170671, 0, 0, 0, 1, 1,
-0.4966067, -0.6425382, -2.73961, 0, 0, 0, 1, 1,
-0.4924219, 0.02627278, -0.1822759, 0, 0, 0, 1, 1,
-0.4905319, -0.4168954, -3.100283, 0, 0, 0, 1, 1,
-0.4854131, -0.1053846, -2.53108, 0, 0, 0, 1, 1,
-0.4806854, -1.752019, -2.673748, 1, 1, 1, 1, 1,
-0.476126, -0.271529, -1.922608, 1, 1, 1, 1, 1,
-0.47547, -0.5644958, -1.58652, 1, 1, 1, 1, 1,
-0.4703792, 0.8676429, -2.662992, 1, 1, 1, 1, 1,
-0.4702254, 1.285225, -1.88069, 1, 1, 1, 1, 1,
-0.4695628, -0.7722903, -1.772419, 1, 1, 1, 1, 1,
-0.4658058, -0.8347003, -1.434905, 1, 1, 1, 1, 1,
-0.4625522, -0.4689969, -2.681575, 1, 1, 1, 1, 1,
-0.4617438, 0.5410218, 1.125957, 1, 1, 1, 1, 1,
-0.459357, 1.436088, -0.5034131, 1, 1, 1, 1, 1,
-0.4591154, -0.2570373, -2.304278, 1, 1, 1, 1, 1,
-0.4576818, 0.3199501, -1.690715, 1, 1, 1, 1, 1,
-0.4550146, -1.159673, -3.856496, 1, 1, 1, 1, 1,
-0.4468938, -0.3074795, -2.421112, 1, 1, 1, 1, 1,
-0.4428571, -0.6320769, -1.748982, 1, 1, 1, 1, 1,
-0.4408929, -0.8423586, -2.514823, 0, 0, 1, 1, 1,
-0.4386844, -0.8664665, -3.219195, 1, 0, 0, 1, 1,
-0.436745, 0.002479576, -1.572482, 1, 0, 0, 1, 1,
-0.435371, -0.6747252, -2.51876, 1, 0, 0, 1, 1,
-0.4337124, -0.3349678, -2.571669, 1, 0, 0, 1, 1,
-0.4335253, -0.03793579, -3.054697, 1, 0, 0, 1, 1,
-0.4279504, -0.03417997, -1.801234, 0, 0, 0, 1, 1,
-0.4263233, -0.2274985, -1.083808, 0, 0, 0, 1, 1,
-0.4200983, -0.3192815, -2.172388, 0, 0, 0, 1, 1,
-0.4156557, 0.7371718, 1.40141, 0, 0, 0, 1, 1,
-0.414589, -0.5685298, -1.951255, 0, 0, 0, 1, 1,
-0.4123253, 1.154437, -0.1860863, 0, 0, 0, 1, 1,
-0.4119742, -0.3141276, -1.857794, 0, 0, 0, 1, 1,
-0.4108088, -2.311436, -2.790912, 1, 1, 1, 1, 1,
-0.4107336, -1.569624, -3.163333, 1, 1, 1, 1, 1,
-0.410162, -0.13098, -1.438415, 1, 1, 1, 1, 1,
-0.409078, 2.612598, -0.07258932, 1, 1, 1, 1, 1,
-0.4041145, 1.686542, -0.4983947, 1, 1, 1, 1, 1,
-0.4032677, 2.084799, 0.6602134, 1, 1, 1, 1, 1,
-0.3979108, -0.4309587, -1.808572, 1, 1, 1, 1, 1,
-0.3918634, 0.9418217, -2.129018, 1, 1, 1, 1, 1,
-0.3870749, 1.693727, -2.432043, 1, 1, 1, 1, 1,
-0.3856459, -0.2635743, -1.669563, 1, 1, 1, 1, 1,
-0.3792716, -1.300905, -2.51933, 1, 1, 1, 1, 1,
-0.371758, 0.530194, 1.403659, 1, 1, 1, 1, 1,
-0.368365, -0.5146541, -1.679702, 1, 1, 1, 1, 1,
-0.3679057, 0.1374545, -0.4997011, 1, 1, 1, 1, 1,
-0.3678764, 2.062225, -1.116867, 1, 1, 1, 1, 1,
-0.3676658, -1.015341, -3.684352, 0, 0, 1, 1, 1,
-0.3658619, -0.5576665, -2.243688, 1, 0, 0, 1, 1,
-0.3652765, 0.729517, -0.2123678, 1, 0, 0, 1, 1,
-0.3589369, 0.2593673, -1.163208, 1, 0, 0, 1, 1,
-0.3560115, 1.281915, -1.23241, 1, 0, 0, 1, 1,
-0.354563, -0.4744079, -3.125457, 1, 0, 0, 1, 1,
-0.3517535, -0.8208218, -0.5964038, 0, 0, 0, 1, 1,
-0.3509507, 0.2455258, 1.174322, 0, 0, 0, 1, 1,
-0.3490612, 0.6034241, 0.9786134, 0, 0, 0, 1, 1,
-0.3489511, 0.8148904, -0.3406399, 0, 0, 0, 1, 1,
-0.3486529, -1.024565, -0.9155879, 0, 0, 0, 1, 1,
-0.3392966, -0.7590171, -2.893176, 0, 0, 0, 1, 1,
-0.3368032, 0.09961934, -0.7039216, 0, 0, 0, 1, 1,
-0.3340971, 0.3987601, 0.619374, 1, 1, 1, 1, 1,
-0.3332818, -1.700693, -3.731412, 1, 1, 1, 1, 1,
-0.3328179, 1.357346, -0.4729745, 1, 1, 1, 1, 1,
-0.3326381, 0.3494347, -1.360543, 1, 1, 1, 1, 1,
-0.3272949, 0.535069, -1.432163, 1, 1, 1, 1, 1,
-0.3257552, -0.6448337, -0.9843332, 1, 1, 1, 1, 1,
-0.3218948, -0.1095773, -2.242532, 1, 1, 1, 1, 1,
-0.3199479, -1.099925, -3.573412, 1, 1, 1, 1, 1,
-0.3138451, -1.694501, -3.347819, 1, 1, 1, 1, 1,
-0.3078634, 0.4736827, -1.180334, 1, 1, 1, 1, 1,
-0.3071065, 0.6524085, -0.8746178, 1, 1, 1, 1, 1,
-0.3000794, -0.9568033, -3.745944, 1, 1, 1, 1, 1,
-0.2991711, -1.344109, -4.458713, 1, 1, 1, 1, 1,
-0.2981479, 0.2350309, 0.7410724, 1, 1, 1, 1, 1,
-0.2963179, 0.5186785, -1.331361, 1, 1, 1, 1, 1,
-0.292692, 0.9385454, 0.722236, 0, 0, 1, 1, 1,
-0.283756, -0.8798026, -2.974955, 1, 0, 0, 1, 1,
-0.2831582, 2.105119, -0.5427875, 1, 0, 0, 1, 1,
-0.2830746, -2.016201, -4.62482, 1, 0, 0, 1, 1,
-0.2778517, 0.6054249, -1.155773, 1, 0, 0, 1, 1,
-0.2744696, 1.167352, -2.602881, 1, 0, 0, 1, 1,
-0.2721263, -2.040828, -1.715012, 0, 0, 0, 1, 1,
-0.2718991, -0.0470608, -1.245051, 0, 0, 0, 1, 1,
-0.2712382, -0.7235446, -1.497042, 0, 0, 0, 1, 1,
-0.2689843, 0.319315, -0.5396859, 0, 0, 0, 1, 1,
-0.2663887, 1.090802, -1.162942, 0, 0, 0, 1, 1,
-0.2650872, -0.5773197, -3.401176, 0, 0, 0, 1, 1,
-0.2600582, -1.401888, -4.265466, 0, 0, 0, 1, 1,
-0.2597701, -2.868948, -3.782995, 1, 1, 1, 1, 1,
-0.2568318, -0.2383892, -2.848974, 1, 1, 1, 1, 1,
-0.2553192, 0.6099443, -0.3842928, 1, 1, 1, 1, 1,
-0.2550439, 0.8625213, -0.1195735, 1, 1, 1, 1, 1,
-0.2510318, -0.05849924, -2.243592, 1, 1, 1, 1, 1,
-0.2502944, -0.7616606, -2.244887, 1, 1, 1, 1, 1,
-0.2502759, -1.0398, -2.473745, 1, 1, 1, 1, 1,
-0.2492273, -0.09105767, -1.202798, 1, 1, 1, 1, 1,
-0.2491052, -0.01547236, -0.8770107, 1, 1, 1, 1, 1,
-0.2411374, -0.5278361, -1.696962, 1, 1, 1, 1, 1,
-0.2381381, 1.169765, -0.3089798, 1, 1, 1, 1, 1,
-0.2361711, -0.6283168, -3.777033, 1, 1, 1, 1, 1,
-0.2360151, 0.7026647, 0.7180973, 1, 1, 1, 1, 1,
-0.234334, -0.4139611, -2.819275, 1, 1, 1, 1, 1,
-0.2331164, 2.290459, 0.01679755, 1, 1, 1, 1, 1,
-0.2316148, -0.3642494, -2.223918, 0, 0, 1, 1, 1,
-0.2305816, 0.6758783, 1.43286, 1, 0, 0, 1, 1,
-0.2261068, -0.2791875, -3.062884, 1, 0, 0, 1, 1,
-0.2248855, -0.3515504, -2.22052, 1, 0, 0, 1, 1,
-0.2247241, -0.3583535, -1.935895, 1, 0, 0, 1, 1,
-0.2232174, -0.3770732, -2.589509, 1, 0, 0, 1, 1,
-0.2204085, 0.1801133, -1.035566, 0, 0, 0, 1, 1,
-0.218407, -1.665107, -2.768452, 0, 0, 0, 1, 1,
-0.2050493, -0.5317079, -3.819566, 0, 0, 0, 1, 1,
-0.1992538, 0.5000784, 0.1058086, 0, 0, 0, 1, 1,
-0.198598, -0.155015, -3.655239, 0, 0, 0, 1, 1,
-0.1962603, -0.5395266, -1.90671, 0, 0, 0, 1, 1,
-0.1937566, -1.604908, -3.842761, 0, 0, 0, 1, 1,
-0.1930149, -0.2495064, -2.211091, 1, 1, 1, 1, 1,
-0.1889594, -1.360031, -2.279532, 1, 1, 1, 1, 1,
-0.1836232, -0.7103785, -0.2512713, 1, 1, 1, 1, 1,
-0.1826665, 0.7345712, -2.098515, 1, 1, 1, 1, 1,
-0.1818563, 0.8087405, -0.1868164, 1, 1, 1, 1, 1,
-0.1773574, -0.0484278, -1.963681, 1, 1, 1, 1, 1,
-0.1745006, -1.005041, -0.4291554, 1, 1, 1, 1, 1,
-0.1649685, 1.093287, 0.7098927, 1, 1, 1, 1, 1,
-0.1591995, -2.004701, -3.684435, 1, 1, 1, 1, 1,
-0.1531655, 0.6174834, -0.9674718, 1, 1, 1, 1, 1,
-0.1526143, -1.264894, -4.987946, 1, 1, 1, 1, 1,
-0.151649, 0.03275861, 0.1303412, 1, 1, 1, 1, 1,
-0.1474472, 0.3498546, -0.7301236, 1, 1, 1, 1, 1,
-0.1438218, -0.4925845, -4.384655, 1, 1, 1, 1, 1,
-0.1430512, 1.995313, 1.069093, 1, 1, 1, 1, 1,
-0.1397638, -0.156254, -3.267937, 0, 0, 1, 1, 1,
-0.1394619, 1.036294, -0.3671564, 1, 0, 0, 1, 1,
-0.1388435, -0.3756269, -1.928756, 1, 0, 0, 1, 1,
-0.131869, 1.036288, 0.9428691, 1, 0, 0, 1, 1,
-0.1257893, -1.137719, -3.823149, 1, 0, 0, 1, 1,
-0.1251933, 0.7383319, 0.09818528, 1, 0, 0, 1, 1,
-0.1240633, 0.5998528, -0.5335737, 0, 0, 0, 1, 1,
-0.1187696, 0.7740978, -0.6832917, 0, 0, 0, 1, 1,
-0.1148663, -0.145642, -1.891421, 0, 0, 0, 1, 1,
-0.1086942, -0.7676144, -4.288637, 0, 0, 0, 1, 1,
-0.107886, 0.6253154, -1.402086, 0, 0, 0, 1, 1,
-0.1073364, -1.044256, -3.901964, 0, 0, 0, 1, 1,
-0.1063274, -0.6123127, -1.496862, 0, 0, 0, 1, 1,
-0.1048234, -0.6769196, -2.882653, 1, 1, 1, 1, 1,
-0.1017502, -0.1134093, -4.288089, 1, 1, 1, 1, 1,
-0.1016963, 0.8204151, 0.8728065, 1, 1, 1, 1, 1,
-0.09730746, 0.3640298, 1.182591, 1, 1, 1, 1, 1,
-0.09446913, -0.04638291, -3.326262, 1, 1, 1, 1, 1,
-0.09411737, 0.1647239, 0.2425436, 1, 1, 1, 1, 1,
-0.09411593, -1.719219, -2.118952, 1, 1, 1, 1, 1,
-0.08934042, -0.6352872, -3.532565, 1, 1, 1, 1, 1,
-0.08548516, -1.098761, -2.629188, 1, 1, 1, 1, 1,
-0.08055599, -0.0601126, -1.674976, 1, 1, 1, 1, 1,
-0.07801165, 0.203698, -1.849085, 1, 1, 1, 1, 1,
-0.07617956, -0.8615215, -3.191156, 1, 1, 1, 1, 1,
-0.07566475, 0.7221971, 1.30855, 1, 1, 1, 1, 1,
-0.07535438, -2.469012, -3.106887, 1, 1, 1, 1, 1,
-0.07032052, -0.009474878, -1.600612, 1, 1, 1, 1, 1,
-0.06905133, -0.6472661, -4.361619, 0, 0, 1, 1, 1,
-0.06783134, -1.004238, -2.121077, 1, 0, 0, 1, 1,
-0.06657466, -1.957563, -3.619231, 1, 0, 0, 1, 1,
-0.06615826, 0.1647674, 0.1590689, 1, 0, 0, 1, 1,
-0.05580925, -0.6161983, -3.036623, 1, 0, 0, 1, 1,
-0.05580746, 0.6598464, -0.7184345, 1, 0, 0, 1, 1,
-0.05154293, -0.7636507, -4.519536, 0, 0, 0, 1, 1,
-0.05063963, 0.5925809, -0.5975673, 0, 0, 0, 1, 1,
-0.04923437, -0.4436123, -2.205247, 0, 0, 0, 1, 1,
-0.04884286, 0.1098847, -0.5472818, 0, 0, 0, 1, 1,
-0.04864409, 1.75044, 0.2802764, 0, 0, 0, 1, 1,
-0.0461179, 1.109654, 2.160644, 0, 0, 0, 1, 1,
-0.04378014, 0.5953199, -0.9072546, 0, 0, 0, 1, 1,
-0.04359814, -2.240409, -3.622021, 1, 1, 1, 1, 1,
-0.03891478, 0.5307645, 1.049549, 1, 1, 1, 1, 1,
-0.03218734, -1.078084, -4.027892, 1, 1, 1, 1, 1,
-0.0315264, 1.486831, 0.2437953, 1, 1, 1, 1, 1,
-0.03050269, 0.4487245, -0.1303229, 1, 1, 1, 1, 1,
-0.02808595, -0.4068815, -3.460175, 1, 1, 1, 1, 1,
-0.02542411, -0.7545217, -2.975221, 1, 1, 1, 1, 1,
-0.0253752, -0.2079908, -3.026362, 1, 1, 1, 1, 1,
-0.02502795, 0.3953311, -1.141262, 1, 1, 1, 1, 1,
-0.02336168, 0.5833061, -1.40213, 1, 1, 1, 1, 1,
-0.01281688, -0.5274689, -2.274192, 1, 1, 1, 1, 1,
-0.008194863, 0.2625129, 1.081421, 1, 1, 1, 1, 1,
-0.008184401, 0.5703838, -1.656271, 1, 1, 1, 1, 1,
-0.008168432, -0.4061474, -3.372826, 1, 1, 1, 1, 1,
-0.007918024, 0.6866022, 0.003572306, 1, 1, 1, 1, 1,
-0.00630306, -0.7325089, -3.513286, 0, 0, 1, 1, 1,
0.004749608, 1.240215, 0.4976928, 1, 0, 0, 1, 1,
0.005540634, 0.3307208, -0.4172618, 1, 0, 0, 1, 1,
0.007502283, -1.225782, 2.495821, 1, 0, 0, 1, 1,
0.009733903, 0.00173046, -0.2118686, 1, 0, 0, 1, 1,
0.01509885, -2.741001, 3.333117, 1, 0, 0, 1, 1,
0.01548849, -0.09904069, 3.35134, 0, 0, 0, 1, 1,
0.01813698, -0.80959, 3.24503, 0, 0, 0, 1, 1,
0.01971143, -1.340596, 2.969127, 0, 0, 0, 1, 1,
0.02043987, -0.7723475, 4.050228, 0, 0, 0, 1, 1,
0.02147402, -0.1181388, 2.841486, 0, 0, 0, 1, 1,
0.02465262, 0.6013553, -0.5555497, 0, 0, 0, 1, 1,
0.02694343, -0.9093975, 2.29729, 0, 0, 0, 1, 1,
0.02738224, 0.3124079, -0.2592264, 1, 1, 1, 1, 1,
0.03052269, 0.107669, 0.4197391, 1, 1, 1, 1, 1,
0.03214094, 1.232544, 0.644477, 1, 1, 1, 1, 1,
0.0334974, 0.1890552, -0.5618867, 1, 1, 1, 1, 1,
0.03792229, 1.668839, -0.4450105, 1, 1, 1, 1, 1,
0.03817455, -0.5091977, 2.962847, 1, 1, 1, 1, 1,
0.03918099, 0.828792, 0.3668471, 1, 1, 1, 1, 1,
0.04084188, 0.5787469, 0.6110209, 1, 1, 1, 1, 1,
0.04124995, -2.50913, 2.697654, 1, 1, 1, 1, 1,
0.04403432, 1.203492, -0.9460238, 1, 1, 1, 1, 1,
0.04640028, 0.2808051, -1.518302, 1, 1, 1, 1, 1,
0.04863677, 1.216953, -1.237553, 1, 1, 1, 1, 1,
0.05286549, -0.9951831, 5.47787, 1, 1, 1, 1, 1,
0.05338859, 0.2478223, 0.5981258, 1, 1, 1, 1, 1,
0.05431454, 0.4617294, 0.4584351, 1, 1, 1, 1, 1,
0.05897138, -0.05811293, 2.837033, 0, 0, 1, 1, 1,
0.06130256, -0.3051939, 2.0911, 1, 0, 0, 1, 1,
0.06248684, -1.127288, 3.21334, 1, 0, 0, 1, 1,
0.0635417, 0.39147, -0.9421033, 1, 0, 0, 1, 1,
0.06541003, 0.7510862, 1.38846, 1, 0, 0, 1, 1,
0.07109102, 1.50442, -1.441462, 1, 0, 0, 1, 1,
0.07235143, -0.9283338, 1.510438, 0, 0, 0, 1, 1,
0.07355542, -1.436487, 4.111115, 0, 0, 0, 1, 1,
0.09057471, -2.874501, 2.152421, 0, 0, 0, 1, 1,
0.09164469, -0.5191683, 2.834051, 0, 0, 0, 1, 1,
0.09213855, -1.273239, 4.177358, 0, 0, 0, 1, 1,
0.09563407, 0.7756753, -0.782167, 0, 0, 0, 1, 1,
0.09620523, 1.81602, 0.4761529, 0, 0, 0, 1, 1,
0.09772863, 0.1926222, 2.448678, 1, 1, 1, 1, 1,
0.09963778, 0.7838496, 1.042606, 1, 1, 1, 1, 1,
0.1019231, 0.5931141, 0.5018281, 1, 1, 1, 1, 1,
0.1065411, -1.75314, 2.602188, 1, 1, 1, 1, 1,
0.1119391, 0.1891604, 1.345237, 1, 1, 1, 1, 1,
0.116287, -0.575955, 3.176701, 1, 1, 1, 1, 1,
0.1175259, -0.6987552, 2.366141, 1, 1, 1, 1, 1,
0.1215388, 0.1845142, 0.5750384, 1, 1, 1, 1, 1,
0.1252548, 0.7315592, 0.1351087, 1, 1, 1, 1, 1,
0.126003, -1.664962, 3.91127, 1, 1, 1, 1, 1,
0.1286023, 0.7072639, 0.3508551, 1, 1, 1, 1, 1,
0.1288518, -0.770302, 1.96806, 1, 1, 1, 1, 1,
0.1330304, -0.5754333, 4.33732, 1, 1, 1, 1, 1,
0.1373864, -0.4190468, 2.603458, 1, 1, 1, 1, 1,
0.1473064, 0.3663521, -1.821876, 1, 1, 1, 1, 1,
0.1473657, 0.9798019, -0.5020326, 0, 0, 1, 1, 1,
0.14854, -0.1404418, 2.143819, 1, 0, 0, 1, 1,
0.1494661, 0.6813846, 1.885936, 1, 0, 0, 1, 1,
0.1516589, 0.4542767, -1.42273, 1, 0, 0, 1, 1,
0.1550059, 1.252712, -0.7580768, 1, 0, 0, 1, 1,
0.1561143, -0.8504785, 3.425748, 1, 0, 0, 1, 1,
0.1571029, -0.5687069, 1.60544, 0, 0, 0, 1, 1,
0.1593364, -0.606535, 2.993852, 0, 0, 0, 1, 1,
0.1618717, -1.953192, 2.654349, 0, 0, 0, 1, 1,
0.1639419, 1.092145, 0.3181723, 0, 0, 0, 1, 1,
0.1641392, -0.3544615, 2.526715, 0, 0, 0, 1, 1,
0.1686121, 0.3929471, 0.1759808, 0, 0, 0, 1, 1,
0.1712601, -0.1070993, 1.578541, 0, 0, 0, 1, 1,
0.1725795, 0.6578353, 0.4031159, 1, 1, 1, 1, 1,
0.1734561, -0.8296707, 0.7725841, 1, 1, 1, 1, 1,
0.1749311, 0.7128007, -2.428987, 1, 1, 1, 1, 1,
0.1781118, 0.6319716, -0.01694632, 1, 1, 1, 1, 1,
0.179931, 2.256103, 0.7260985, 1, 1, 1, 1, 1,
0.1886975, 0.7515253, 1.809015, 1, 1, 1, 1, 1,
0.1922469, 0.6870266, 0.2588051, 1, 1, 1, 1, 1,
0.192924, 0.117094, 2.395396, 1, 1, 1, 1, 1,
0.1930393, -1.030368, 2.688733, 1, 1, 1, 1, 1,
0.1981536, 0.2591372, -0.7285706, 1, 1, 1, 1, 1,
0.2006651, 0.01867134, 0.2013656, 1, 1, 1, 1, 1,
0.2008552, -1.922477, 4.290869, 1, 1, 1, 1, 1,
0.2140968, -0.8650335, 0.9317158, 1, 1, 1, 1, 1,
0.2187712, -2.332507, 2.194431, 1, 1, 1, 1, 1,
0.2188849, -1.617379, 2.928573, 1, 1, 1, 1, 1,
0.2204313, -1.450655, 1.245146, 0, 0, 1, 1, 1,
0.2221398, -1.334448, 3.640646, 1, 0, 0, 1, 1,
0.2222171, -2.015769, 2.599734, 1, 0, 0, 1, 1,
0.224581, -0.6617685, 2.197712, 1, 0, 0, 1, 1,
0.2253682, -2.015187, 2.097469, 1, 0, 0, 1, 1,
0.2273891, 0.4496756, 1.356139, 1, 0, 0, 1, 1,
0.2275316, 0.05082474, 0.8513345, 0, 0, 0, 1, 1,
0.227792, 0.4657268, 0.5259421, 0, 0, 0, 1, 1,
0.229723, -0.5659431, 2.664624, 0, 0, 0, 1, 1,
0.2325941, 1.184273, -0.6438183, 0, 0, 0, 1, 1,
0.2354086, -1.686623, 1.41941, 0, 0, 0, 1, 1,
0.2357058, -0.7435503, 3.319192, 0, 0, 0, 1, 1,
0.2362031, 0.234743, 0.3706288, 0, 0, 0, 1, 1,
0.2369413, 0.500123, 1.299299, 1, 1, 1, 1, 1,
0.2380484, 0.9525913, 0.7566423, 1, 1, 1, 1, 1,
0.2438475, -1.299709, 1.298268, 1, 1, 1, 1, 1,
0.252925, -1.201805, 2.156666, 1, 1, 1, 1, 1,
0.25519, -0.8459361, 3.215657, 1, 1, 1, 1, 1,
0.257577, -1.652533, 3.637987, 1, 1, 1, 1, 1,
0.2592118, 0.04945227, 1.865235, 1, 1, 1, 1, 1,
0.2611322, 1.134287, 0.6633447, 1, 1, 1, 1, 1,
0.2612005, -1.633291, 2.458483, 1, 1, 1, 1, 1,
0.2619606, -0.8621317, 3.251381, 1, 1, 1, 1, 1,
0.2661858, -0.2372732, 3.211154, 1, 1, 1, 1, 1,
0.26663, 0.614081, 0.1440043, 1, 1, 1, 1, 1,
0.273086, -0.3089092, 4.175684, 1, 1, 1, 1, 1,
0.2768483, -0.0414, 1.411014, 1, 1, 1, 1, 1,
0.2826206, -0.8844292, 3.214023, 1, 1, 1, 1, 1,
0.283371, 2.493035, -0.3474242, 0, 0, 1, 1, 1,
0.2835848, 1.119617, -0.8198683, 1, 0, 0, 1, 1,
0.2844552, 1.765017, 1.077571, 1, 0, 0, 1, 1,
0.2922961, 0.394005, 0.6941857, 1, 0, 0, 1, 1,
0.3007045, -1.001311, 2.619704, 1, 0, 0, 1, 1,
0.302473, 0.1767849, 0.0460364, 1, 0, 0, 1, 1,
0.3122791, 0.6979992, 0.2020619, 0, 0, 0, 1, 1,
0.3129107, -0.7357109, 5.087015, 0, 0, 0, 1, 1,
0.3157293, -0.9368006, 1.431894, 0, 0, 0, 1, 1,
0.3199533, -0.7724769, 4.501142, 0, 0, 0, 1, 1,
0.3216501, 0.3620422, 0.1315563, 0, 0, 0, 1, 1,
0.3224235, 0.2443451, 0.01434546, 0, 0, 0, 1, 1,
0.3232442, 0.6650717, -0.1671873, 0, 0, 0, 1, 1,
0.3321956, -0.1821822, 2.136405, 1, 1, 1, 1, 1,
0.3332184, -0.7596984, 2.117147, 1, 1, 1, 1, 1,
0.3364641, 1.474713, 1.320155, 1, 1, 1, 1, 1,
0.3384382, 1.31623, 0.9603007, 1, 1, 1, 1, 1,
0.3435073, -1.726806, 3.412392, 1, 1, 1, 1, 1,
0.3472068, 0.9113631, 0.2453671, 1, 1, 1, 1, 1,
0.3472567, 0.9502925, 1.20653, 1, 1, 1, 1, 1,
0.3480604, 1.46372, 0.3332546, 1, 1, 1, 1, 1,
0.3566883, -0.7574497, 1.619072, 1, 1, 1, 1, 1,
0.3567652, -0.3566688, 3.104089, 1, 1, 1, 1, 1,
0.359194, -1.17105, 1.232424, 1, 1, 1, 1, 1,
0.3603888, 0.7409671, 1.852366, 1, 1, 1, 1, 1,
0.3633034, -0.3957498, 1.382005, 1, 1, 1, 1, 1,
0.3658785, 0.2302261, -2.885993, 1, 1, 1, 1, 1,
0.3765911, -1.36216, 3.979857, 1, 1, 1, 1, 1,
0.3770778, -0.7405939, 2.146155, 0, 0, 1, 1, 1,
0.3829349, -1.506788, 3.332559, 1, 0, 0, 1, 1,
0.3861848, 0.2813632, 0.4723799, 1, 0, 0, 1, 1,
0.3864115, -1.102328, 3.495455, 1, 0, 0, 1, 1,
0.388097, 1.635189, -0.9562117, 1, 0, 0, 1, 1,
0.3915587, -0.9877419, 2.674335, 1, 0, 0, 1, 1,
0.3918237, -1.975422, 4.097757, 0, 0, 0, 1, 1,
0.3928883, 0.6459109, 1.198962, 0, 0, 0, 1, 1,
0.3962913, -2.020395, 3.469963, 0, 0, 0, 1, 1,
0.3972545, -0.7746678, 2.475037, 0, 0, 0, 1, 1,
0.4045058, 0.7211302, 0.2773738, 0, 0, 0, 1, 1,
0.4106979, -0.840445, 2.326063, 0, 0, 0, 1, 1,
0.4109719, 1.95631, 0.5250378, 0, 0, 0, 1, 1,
0.414237, -1.42343, 2.287267, 1, 1, 1, 1, 1,
0.4174712, 1.184263, 1.786463, 1, 1, 1, 1, 1,
0.417986, 0.5196322, 3.243928, 1, 1, 1, 1, 1,
0.4200254, -1.125916, 3.95719, 1, 1, 1, 1, 1,
0.4206195, -1.857849, 2.494944, 1, 1, 1, 1, 1,
0.4239489, -0.534552, 1.624314, 1, 1, 1, 1, 1,
0.4265973, 0.578322, 1.308716, 1, 1, 1, 1, 1,
0.428569, 0.4755529, 2.240617, 1, 1, 1, 1, 1,
0.428861, 0.6012228, -0.9438507, 1, 1, 1, 1, 1,
0.4367056, 1.143547, 0.404633, 1, 1, 1, 1, 1,
0.436996, 1.258758, 0.1846826, 1, 1, 1, 1, 1,
0.4411078, -0.7794178, 1.14914, 1, 1, 1, 1, 1,
0.4426868, -0.4356823, 1.12844, 1, 1, 1, 1, 1,
0.4465519, 0.1607933, 1.102852, 1, 1, 1, 1, 1,
0.451759, -0.1990465, 2.845851, 1, 1, 1, 1, 1,
0.458295, -0.3061713, 1.922126, 0, 0, 1, 1, 1,
0.458402, 1.04342, -0.338415, 1, 0, 0, 1, 1,
0.4598362, -0.3125317, 1.51773, 1, 0, 0, 1, 1,
0.4716739, -0.1670672, 0.9501488, 1, 0, 0, 1, 1,
0.4722012, -0.3665323, 2.72902, 1, 0, 0, 1, 1,
0.4796302, 1.09223, 0.08764172, 1, 0, 0, 1, 1,
0.4803087, -0.1559505, 1.211223, 0, 0, 0, 1, 1,
0.4864944, 1.930949, -0.785719, 0, 0, 0, 1, 1,
0.4869757, -0.3809517, 1.684702, 0, 0, 0, 1, 1,
0.4886755, 0.3446124, 0.8108418, 0, 0, 0, 1, 1,
0.4969424, 0.564857, -0.3982, 0, 0, 0, 1, 1,
0.5011454, -0.2840324, 3.234046, 0, 0, 0, 1, 1,
0.5020778, -2.060027, 0.7786688, 0, 0, 0, 1, 1,
0.5020878, -0.8935691, 4.404828, 1, 1, 1, 1, 1,
0.5037813, 0.4713268, 0.7050121, 1, 1, 1, 1, 1,
0.5068069, 0.7106693, -0.003335291, 1, 1, 1, 1, 1,
0.5113751, 0.002734232, 1.959373, 1, 1, 1, 1, 1,
0.5116252, -1.68773, 0.8342317, 1, 1, 1, 1, 1,
0.5118042, 0.03173907, 1.316786, 1, 1, 1, 1, 1,
0.5139983, 1.155384, 0.9324056, 1, 1, 1, 1, 1,
0.5207665, 0.826309, 0.4749173, 1, 1, 1, 1, 1,
0.5226253, -1.678369, 2.952641, 1, 1, 1, 1, 1,
0.5233266, 0.3820006, 1.144856, 1, 1, 1, 1, 1,
0.5248132, -1.122446, 3.367552, 1, 1, 1, 1, 1,
0.524853, -1.307326, 3.290287, 1, 1, 1, 1, 1,
0.5292002, 0.03909316, 1.34333, 1, 1, 1, 1, 1,
0.5325276, -1.505313, 2.577184, 1, 1, 1, 1, 1,
0.5330913, -0.5052062, 2.087292, 1, 1, 1, 1, 1,
0.533161, -0.0464133, 1.919682, 0, 0, 1, 1, 1,
0.5337862, 0.12481, 1.477612, 1, 0, 0, 1, 1,
0.5367194, 1.150325, -1.096295, 1, 0, 0, 1, 1,
0.5515367, -0.9037062, 2.184928, 1, 0, 0, 1, 1,
0.5594972, 1.058766, -0.254292, 1, 0, 0, 1, 1,
0.5612547, 0.1365806, 1.934103, 1, 0, 0, 1, 1,
0.5675094, -0.5100619, 4.692183, 0, 0, 0, 1, 1,
0.5678059, -1.283144, 2.128956, 0, 0, 0, 1, 1,
0.5691307, 0.555568, 0.05185692, 0, 0, 0, 1, 1,
0.5718676, -1.438515, 1.985583, 0, 0, 0, 1, 1,
0.5794703, 0.6273115, -0.9810677, 0, 0, 0, 1, 1,
0.5800954, 0.27942, 0.8973072, 0, 0, 0, 1, 1,
0.5841036, 1.185651, 2.185283, 0, 0, 0, 1, 1,
0.5890186, 1.362047, 0.1387989, 1, 1, 1, 1, 1,
0.5898643, 0.3906517, 1.460064, 1, 1, 1, 1, 1,
0.5922889, 0.3291758, 0.7762913, 1, 1, 1, 1, 1,
0.594258, -1.556322, 2.601926, 1, 1, 1, 1, 1,
0.5954028, -1.232596, 2.491444, 1, 1, 1, 1, 1,
0.5959103, 0.3436472, 1.624215, 1, 1, 1, 1, 1,
0.5963426, 0.1940428, 0.2648043, 1, 1, 1, 1, 1,
0.5966002, -0.1348448, 2.558166, 1, 1, 1, 1, 1,
0.5978999, -0.3877421, 2.655702, 1, 1, 1, 1, 1,
0.5979221, -0.2604384, 1.466065, 1, 1, 1, 1, 1,
0.5981908, -2.323251, 2.219751, 1, 1, 1, 1, 1,
0.5994766, -0.1005493, 0.6129438, 1, 1, 1, 1, 1,
0.6026247, -0.03934761, 0.1704207, 1, 1, 1, 1, 1,
0.6028167, 0.07735322, 0.6590345, 1, 1, 1, 1, 1,
0.6082963, -0.05626901, 0.8373259, 1, 1, 1, 1, 1,
0.6139928, 1.116325, 2.509615, 0, 0, 1, 1, 1,
0.6178609, 0.9264437, -1.271887, 1, 0, 0, 1, 1,
0.6184308, 0.06290188, 3.19028, 1, 0, 0, 1, 1,
0.6227686, 0.6245771, -0.4017146, 1, 0, 0, 1, 1,
0.6251556, 0.7092384, 1.125794, 1, 0, 0, 1, 1,
0.6254219, -0.4494369, 3.280704, 1, 0, 0, 1, 1,
0.6261309, 0.9501135, -0.2321318, 0, 0, 0, 1, 1,
0.6298697, 1.402839, 1.22291, 0, 0, 0, 1, 1,
0.630772, 3.220309, -0.9392489, 0, 0, 0, 1, 1,
0.631027, 1.020357, 1.40711, 0, 0, 0, 1, 1,
0.6318637, 0.3958131, 0.7877795, 0, 0, 0, 1, 1,
0.6340339, -0.5190448, 4.360471, 0, 0, 0, 1, 1,
0.6400993, -1.39665, 3.402612, 0, 0, 0, 1, 1,
0.6407105, 1.364166, 0.3158137, 1, 1, 1, 1, 1,
0.6407508, -0.04858267, 2.365939, 1, 1, 1, 1, 1,
0.651117, -1.713443, 2.8608, 1, 1, 1, 1, 1,
0.6524978, -2.373266, 2.456603, 1, 1, 1, 1, 1,
0.6552149, -0.9944562, 2.912107, 1, 1, 1, 1, 1,
0.6657059, 0.6154903, 0.9259171, 1, 1, 1, 1, 1,
0.6704665, 0.06602827, 2.919742, 1, 1, 1, 1, 1,
0.6791539, -0.9908985, 2.180961, 1, 1, 1, 1, 1,
0.682296, 0.6876141, 1.27487, 1, 1, 1, 1, 1,
0.6858457, 1.287804, -0.4486146, 1, 1, 1, 1, 1,
0.6921794, -0.39988, 0.9791721, 1, 1, 1, 1, 1,
0.6938992, 0.6026195, -0.2634957, 1, 1, 1, 1, 1,
0.696149, -0.2784922, 2.039824, 1, 1, 1, 1, 1,
0.7096545, -0.8608288, 3.098673, 1, 1, 1, 1, 1,
0.7116313, 0.1557606, 1.113722, 1, 1, 1, 1, 1,
0.7153834, 0.07878912, 1.467215, 0, 0, 1, 1, 1,
0.7157197, 2.004864, 1.316732, 1, 0, 0, 1, 1,
0.7204246, -1.025211, 4.331202, 1, 0, 0, 1, 1,
0.7226084, -0.1328581, 1.374092, 1, 0, 0, 1, 1,
0.7265677, -0.8216525, 3.574646, 1, 0, 0, 1, 1,
0.7310169, 0.1259758, -0.1663757, 1, 0, 0, 1, 1,
0.7332804, -0.02674641, 1.686596, 0, 0, 0, 1, 1,
0.741223, -1.344679, 2.294694, 0, 0, 0, 1, 1,
0.7464329, -0.09241939, 1.486569, 0, 0, 0, 1, 1,
0.7551816, 0.1762078, 0.243001, 0, 0, 0, 1, 1,
0.7557988, 1.005282, 0.9305202, 0, 0, 0, 1, 1,
0.75747, 0.562898, 0.02206314, 0, 0, 0, 1, 1,
0.7584607, -0.1731484, 1.600567, 0, 0, 0, 1, 1,
0.7605209, 1.26966, -0.8736148, 1, 1, 1, 1, 1,
0.7669318, -0.2889011, 0.7667964, 1, 1, 1, 1, 1,
0.767808, -0.3613043, 3.24984, 1, 1, 1, 1, 1,
0.768856, -0.0585814, 2.248237, 1, 1, 1, 1, 1,
0.771006, 0.3737602, 3.224922, 1, 1, 1, 1, 1,
0.7731583, 0.9628612, 0.04664009, 1, 1, 1, 1, 1,
0.7856618, 1.243792, 1.151274, 1, 1, 1, 1, 1,
0.7948053, -0.2678423, 2.8626, 1, 1, 1, 1, 1,
0.8018504, 0.1513142, 1.355899, 1, 1, 1, 1, 1,
0.8020399, -0.708062, 1.994038, 1, 1, 1, 1, 1,
0.8024662, 0.3144176, 2.440995, 1, 1, 1, 1, 1,
0.8080929, -0.4755014, -0.2831719, 1, 1, 1, 1, 1,
0.8115447, -1.915731, 4.368153, 1, 1, 1, 1, 1,
0.8127676, -1.256318, 2.418243, 1, 1, 1, 1, 1,
0.8127836, -0.9175543, 2.620816, 1, 1, 1, 1, 1,
0.8157942, -0.3229791, 2.335417, 0, 0, 1, 1, 1,
0.8162763, 0.5687202, 1.031218, 1, 0, 0, 1, 1,
0.8171111, -0.3502004, 2.52458, 1, 0, 0, 1, 1,
0.8346395, 2.733446, -0.9573578, 1, 0, 0, 1, 1,
0.8374069, 0.5215079, 1.72624, 1, 0, 0, 1, 1,
0.8376218, 0.2457708, 3.243573, 1, 0, 0, 1, 1,
0.8392123, 0.01373614, 0.1748176, 0, 0, 0, 1, 1,
0.8436221, 0.5915652, 1.452152, 0, 0, 0, 1, 1,
0.8479195, 0.382177, 2.6738, 0, 0, 0, 1, 1,
0.8543481, -0.2863902, 3.724729, 0, 0, 0, 1, 1,
0.8562168, -0.5427215, 1.422889, 0, 0, 0, 1, 1,
0.8625019, 1.387635, -0.249433, 0, 0, 0, 1, 1,
0.8630125, -0.4088629, 1.868939, 0, 0, 0, 1, 1,
0.8647739, 0.01475209, 1.40626, 1, 1, 1, 1, 1,
0.8649496, 0.7696756, 1.348288, 1, 1, 1, 1, 1,
0.8691958, -0.420986, 3.496735, 1, 1, 1, 1, 1,
0.8708945, 0.5812146, 1.792372, 1, 1, 1, 1, 1,
0.8778709, -0.8057772, 1.826858, 1, 1, 1, 1, 1,
0.8790292, 0.3350853, 2.085152, 1, 1, 1, 1, 1,
0.8790618, -0.6289366, 3.206365, 1, 1, 1, 1, 1,
0.8830574, 0.9832314, 0.5582335, 1, 1, 1, 1, 1,
0.8886487, -0.111714, 2.229338, 1, 1, 1, 1, 1,
0.8897702, -0.2709372, -0.6638057, 1, 1, 1, 1, 1,
0.8969274, 0.5310938, 0.7082958, 1, 1, 1, 1, 1,
0.8981694, -0.2856488, 1.908261, 1, 1, 1, 1, 1,
0.8998417, -0.6684268, 2.403486, 1, 1, 1, 1, 1,
0.9006724, -0.8784553, 2.279419, 1, 1, 1, 1, 1,
0.9159327, 0.9657999, 0.4173616, 1, 1, 1, 1, 1,
0.9218306, -1.830169, 1.91897, 0, 0, 1, 1, 1,
0.9241629, 0.435776, 0.8576307, 1, 0, 0, 1, 1,
0.9270393, -0.534411, 2.473265, 1, 0, 0, 1, 1,
0.9276114, -0.6718681, 2.881742, 1, 0, 0, 1, 1,
0.9277006, 0.4177558, 0.5436516, 1, 0, 0, 1, 1,
0.9415291, -0.6028316, 1.654446, 1, 0, 0, 1, 1,
0.9549477, 1.071697, 0.9934858, 0, 0, 0, 1, 1,
0.9615795, 0.6477921, -1.142038, 0, 0, 0, 1, 1,
0.9711674, -1.952738, 1.847197, 0, 0, 0, 1, 1,
0.974619, 1.150586, 0.2074681, 0, 0, 0, 1, 1,
0.9754052, 1.022196, -0.3751363, 0, 0, 0, 1, 1,
0.9787499, 0.4151169, 3.089144, 0, 0, 0, 1, 1,
0.9818241, -0.9804075, 1.794725, 0, 0, 0, 1, 1,
0.9828537, 1.925765, -0.9375156, 1, 1, 1, 1, 1,
0.9864152, -1.720879, 2.198676, 1, 1, 1, 1, 1,
0.9899606, 0.9402723, 0.1969538, 1, 1, 1, 1, 1,
0.9939047, -0.1508455, 2.163969, 1, 1, 1, 1, 1,
1.003306, 0.6474978, -0.563504, 1, 1, 1, 1, 1,
1.004313, 0.349267, 0.609281, 1, 1, 1, 1, 1,
1.004808, -0.5579538, 2.614166, 1, 1, 1, 1, 1,
1.009268, -0.1117145, 3.320236, 1, 1, 1, 1, 1,
1.011657, 0.08159436, 1.739953, 1, 1, 1, 1, 1,
1.012198, -0.5372908, 1.11485, 1, 1, 1, 1, 1,
1.018432, -0.1583801, 1.924751, 1, 1, 1, 1, 1,
1.020552, 0.2775349, 2.420245, 1, 1, 1, 1, 1,
1.027653, 0.3047715, -1.098727, 1, 1, 1, 1, 1,
1.032215, -0.8949491, 2.461149, 1, 1, 1, 1, 1,
1.033695, 1.997635, 1.70303, 1, 1, 1, 1, 1,
1.037742, 0.4467775, 1.402073, 0, 0, 1, 1, 1,
1.062427, 0.4595608, 0.5034311, 1, 0, 0, 1, 1,
1.06481, 0.930275, -0.115052, 1, 0, 0, 1, 1,
1.065698, 0.8146119, 2.119003, 1, 0, 0, 1, 1,
1.075644, -0.2773868, 1.041372, 1, 0, 0, 1, 1,
1.07642, -1.287831, 1.416954, 1, 0, 0, 1, 1,
1.080742, -0.930721, 3.756399, 0, 0, 0, 1, 1,
1.086348, 0.6986558, 0.6923307, 0, 0, 0, 1, 1,
1.088164, -0.8104532, 1.796031, 0, 0, 0, 1, 1,
1.093176, -0.8488104, 3.665349, 0, 0, 0, 1, 1,
1.097521, 0.6665575, 0.3025043, 0, 0, 0, 1, 1,
1.099668, 0.8192748, 0.7909093, 0, 0, 0, 1, 1,
1.099828, 0.1003584, 1.518558, 0, 0, 0, 1, 1,
1.102603, 1.034415, -0.3045446, 1, 1, 1, 1, 1,
1.104102, 0.534735, 1.707271, 1, 1, 1, 1, 1,
1.105496, -0.4907493, 2.06801, 1, 1, 1, 1, 1,
1.107076, 0.7316248, 1.036806, 1, 1, 1, 1, 1,
1.107792, 0.5509544, 1.34873, 1, 1, 1, 1, 1,
1.117259, -0.03803165, -0.7013269, 1, 1, 1, 1, 1,
1.118852, 0.7586229, 2.783393, 1, 1, 1, 1, 1,
1.119116, -0.7761839, 3.370472, 1, 1, 1, 1, 1,
1.120808, 0.07923417, -0.411708, 1, 1, 1, 1, 1,
1.124303, 0.7031249, 0.3553821, 1, 1, 1, 1, 1,
1.126816, 0.5471953, 0.9476966, 1, 1, 1, 1, 1,
1.128373, -1.496872, 1.816551, 1, 1, 1, 1, 1,
1.139848, 1.701396, 0.8994306, 1, 1, 1, 1, 1,
1.148446, 0.8372334, 1.195133, 1, 1, 1, 1, 1,
1.151615, -0.05789908, 0.5971841, 1, 1, 1, 1, 1,
1.15862, -0.6320753, 2.945385, 0, 0, 1, 1, 1,
1.161808, -0.1847915, 2.12543, 1, 0, 0, 1, 1,
1.165831, -0.9571968, 2.209163, 1, 0, 0, 1, 1,
1.167914, -1.045762, 1.322925, 1, 0, 0, 1, 1,
1.170216, 0.03512184, 2.692632, 1, 0, 0, 1, 1,
1.171034, 0.2283237, 0.3187822, 1, 0, 0, 1, 1,
1.178079, -1.597896, 2.972404, 0, 0, 0, 1, 1,
1.179652, -0.4825625, 1.649141, 0, 0, 0, 1, 1,
1.179731, -2.20437, 2.569322, 0, 0, 0, 1, 1,
1.180669, -0.302237, 2.715993, 0, 0, 0, 1, 1,
1.183047, 0.7982866, 1.324713, 0, 0, 0, 1, 1,
1.186341, -1.106995, 1.852301, 0, 0, 0, 1, 1,
1.197759, 2.119819, 0.7619181, 0, 0, 0, 1, 1,
1.206008, -2.013993, 2.301399, 1, 1, 1, 1, 1,
1.209734, 0.1135648, 2.16792, 1, 1, 1, 1, 1,
1.223262, -0.3571131, 2.575241, 1, 1, 1, 1, 1,
1.227694, 0.5961094, 1.312506, 1, 1, 1, 1, 1,
1.240701, -2.055926, 1.835613, 1, 1, 1, 1, 1,
1.245339, 0.2142295, 1.89896, 1, 1, 1, 1, 1,
1.245904, 0.2246461, 1.345007, 1, 1, 1, 1, 1,
1.246171, -0.02073057, 0.9606306, 1, 1, 1, 1, 1,
1.255791, -1.118479, 4.739766, 1, 1, 1, 1, 1,
1.260869, -0.2823218, -0.4024665, 1, 1, 1, 1, 1,
1.265556, 0.72582, 0.4783284, 1, 1, 1, 1, 1,
1.269943, 2.21839, 0.510811, 1, 1, 1, 1, 1,
1.277992, -1.377316, 0.367348, 1, 1, 1, 1, 1,
1.287566, -1.176896, 3.143214, 1, 1, 1, 1, 1,
1.287681, -0.3788461, 1.488443, 1, 1, 1, 1, 1,
1.290386, -0.9542398, 3.288155, 0, 0, 1, 1, 1,
1.295045, -0.6709615, 2.496339, 1, 0, 0, 1, 1,
1.297825, 1.070346, 1.266629, 1, 0, 0, 1, 1,
1.319941, -0.5800127, 1.804855, 1, 0, 0, 1, 1,
1.336023, 1.849993, 3.248832, 1, 0, 0, 1, 1,
1.336698, 0.08828536, 2.710559, 1, 0, 0, 1, 1,
1.344486, 0.9127536, 0.9256688, 0, 0, 0, 1, 1,
1.346352, 0.9913534, 0.2666529, 0, 0, 0, 1, 1,
1.348192, -0.1702887, 2.245955, 0, 0, 0, 1, 1,
1.348788, 1.383254, -0.1285111, 0, 0, 0, 1, 1,
1.348934, 2.51119, 0.1957016, 0, 0, 0, 1, 1,
1.362355, 1.717903, 0.1993365, 0, 0, 0, 1, 1,
1.373502, 0.670978, 1.004722, 0, 0, 0, 1, 1,
1.38175, -0.5844163, 2.746749, 1, 1, 1, 1, 1,
1.384511, -0.7532032, 3.071353, 1, 1, 1, 1, 1,
1.392455, 0.4904608, -0.7169901, 1, 1, 1, 1, 1,
1.393885, -0.4386972, 2.608847, 1, 1, 1, 1, 1,
1.394706, 0.8925306, 0.9760122, 1, 1, 1, 1, 1,
1.409613, 0.6636645, 1.529731, 1, 1, 1, 1, 1,
1.416036, -2.308163, 2.254608, 1, 1, 1, 1, 1,
1.419617, -0.3919482, 2.691973, 1, 1, 1, 1, 1,
1.424753, -1.039802, 2.396811, 1, 1, 1, 1, 1,
1.450154, -1.286877, 3.369428, 1, 1, 1, 1, 1,
1.452191, 1.316568, 0.6309049, 1, 1, 1, 1, 1,
1.457899, 1.200799, 1.051499, 1, 1, 1, 1, 1,
1.460041, -1.335285, 2.429522, 1, 1, 1, 1, 1,
1.491262, -0.7934252, 2.752295, 1, 1, 1, 1, 1,
1.498769, 1.272912, 2.784864, 1, 1, 1, 1, 1,
1.501847, -0.292818, 1.514768, 0, 0, 1, 1, 1,
1.50579, -2.591937, 2.436261, 1, 0, 0, 1, 1,
1.507875, -2.612604, 4.395936, 1, 0, 0, 1, 1,
1.5254, -0.391753, 1.964321, 1, 0, 0, 1, 1,
1.531424, -0.2194418, 0.5128966, 1, 0, 0, 1, 1,
1.53695, 0.966665, 2.258149, 1, 0, 0, 1, 1,
1.551143, 0.8195118, 1.629212, 0, 0, 0, 1, 1,
1.559945, -0.118883, 0.1737904, 0, 0, 0, 1, 1,
1.564148, 0.01086635, 3.115111, 0, 0, 0, 1, 1,
1.576515, -1.738765, 3.540707, 0, 0, 0, 1, 1,
1.577632, 0.2480662, 1.941628, 0, 0, 0, 1, 1,
1.580227, -0.8885015, 1.077956, 0, 0, 0, 1, 1,
1.581517, 1.024656, 1.354348, 0, 0, 0, 1, 1,
1.582017, 1.701766, -0.2036143, 1, 1, 1, 1, 1,
1.590674, 0.2073924, -0.09308825, 1, 1, 1, 1, 1,
1.594622, -0.3540778, 2.629145, 1, 1, 1, 1, 1,
1.597404, 0.9206316, 1.503251, 1, 1, 1, 1, 1,
1.603058, -0.3242507, 0.2570082, 1, 1, 1, 1, 1,
1.611404, -0.3041295, 2.770771, 1, 1, 1, 1, 1,
1.613605, 0.2440358, 3.4668, 1, 1, 1, 1, 1,
1.625445, 0.6422299, 3.360211, 1, 1, 1, 1, 1,
1.642253, 0.01061172, 2.313462, 1, 1, 1, 1, 1,
1.643888, 2.561989, -0.02623759, 1, 1, 1, 1, 1,
1.654001, 0.3360582, -0.4112261, 1, 1, 1, 1, 1,
1.687598, 2.250682, 1.184021, 1, 1, 1, 1, 1,
1.689569, -0.2148838, 1.445499, 1, 1, 1, 1, 1,
1.713828, -0.4801856, 1.557262, 1, 1, 1, 1, 1,
1.716182, 0.7954327, 0.09316987, 1, 1, 1, 1, 1,
1.72617, 0.4134995, 0.8331224, 0, 0, 1, 1, 1,
1.73398, -0.4606862, 2.047023, 1, 0, 0, 1, 1,
1.744472, -1.607613, 2.880591, 1, 0, 0, 1, 1,
1.752693, 0.4580688, 0.6623414, 1, 0, 0, 1, 1,
1.761194, 0.8525676, 0.04329212, 1, 0, 0, 1, 1,
1.766897, 0.5642161, 1.926269, 1, 0, 0, 1, 1,
1.786812, 2.297421, 1.994612, 0, 0, 0, 1, 1,
1.794428, 0.2764834, 1.29646, 0, 0, 0, 1, 1,
1.811211, -0.6346118, 0.9955146, 0, 0, 0, 1, 1,
1.820135, 0.791489, 2.408145, 0, 0, 0, 1, 1,
1.823061, 0.5185211, 1.934285, 0, 0, 0, 1, 1,
1.846989, 0.3748218, 2.292379, 0, 0, 0, 1, 1,
1.861092, 0.2469279, 1.305788, 0, 0, 0, 1, 1,
1.86341, 0.7149452, 0.3734688, 1, 1, 1, 1, 1,
1.87254, 0.3735079, 3.487588, 1, 1, 1, 1, 1,
1.875253, -0.4989321, 2.707179, 1, 1, 1, 1, 1,
1.880427, 0.5459754, 0.8638265, 1, 1, 1, 1, 1,
1.909563, 2.402871, -0.5540259, 1, 1, 1, 1, 1,
1.915585, 0.7434601, 1.149364, 1, 1, 1, 1, 1,
1.915937, 0.08460661, -0.01853458, 1, 1, 1, 1, 1,
1.92204, -0.5719442, 2.058356, 1, 1, 1, 1, 1,
1.922526, 0.2596678, 1.956879, 1, 1, 1, 1, 1,
1.923701, 0.5535424, -0.373091, 1, 1, 1, 1, 1,
1.958189, 0.3173033, 2.644557, 1, 1, 1, 1, 1,
1.95846, -0.6066528, 1.054231, 1, 1, 1, 1, 1,
1.980233, -2.198772, 1.024682, 1, 1, 1, 1, 1,
1.983974, 0.3425122, 1.271021, 1, 1, 1, 1, 1,
1.998197, -0.6562843, 1.544535, 1, 1, 1, 1, 1,
2.001744, 1.236806, -0.6477976, 0, 0, 1, 1, 1,
2.006297, -0.1492862, 1.851898, 1, 0, 0, 1, 1,
2.009607, 2.416382, 0.1386429, 1, 0, 0, 1, 1,
2.067858, -0.5765604, 2.955407, 1, 0, 0, 1, 1,
2.079026, 0.6024103, 2.332495, 1, 0, 0, 1, 1,
2.097677, 0.6537245, 0.6687287, 1, 0, 0, 1, 1,
2.100588, 1.047144, 1.896983, 0, 0, 0, 1, 1,
2.120713, 0.01812195, 1.790759, 0, 0, 0, 1, 1,
2.154985, -1.388254, 2.416196, 0, 0, 0, 1, 1,
2.224574, 0.01426607, 1.627248, 0, 0, 0, 1, 1,
2.241633, 0.3381923, 2.541064, 0, 0, 0, 1, 1,
2.262883, 1.873795, -0.2349892, 0, 0, 0, 1, 1,
2.282913, -0.6978239, 3.654421, 0, 0, 0, 1, 1,
2.295566, 0.9002267, 1.0057, 1, 1, 1, 1, 1,
2.317305, 0.9408234, 0.5761067, 1, 1, 1, 1, 1,
2.465165, -0.3367598, 3.060561, 1, 1, 1, 1, 1,
2.467803, 0.7384288, 3.352895, 1, 1, 1, 1, 1,
2.481279, 0.5033954, 2.248559, 1, 1, 1, 1, 1,
2.827519, -0.8080106, 1.022237, 1, 1, 1, 1, 1,
2.929255, -0.7365755, 2.44471, 1, 1, 1, 1, 1
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
var radius = 9.491713;
var distance = 33.33924;
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
mvMatrix.translate( 0.1209033, -0.37097, -0.1510305 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.33924);
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
