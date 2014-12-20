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
-3.347972, 0.138939, -1.78777, 1, 0, 0, 1,
-3.269683, 0.0416652, -0.3445774, 1, 0.007843138, 0, 1,
-2.991832, 1.035871, -0.6324745, 1, 0.01176471, 0, 1,
-2.931148, -1.212753, -2.590086, 1, 0.01960784, 0, 1,
-2.918777, 0.9071302, -1.269828, 1, 0.02352941, 0, 1,
-2.905649, 0.6192944, -1.55827, 1, 0.03137255, 0, 1,
-2.770723, -1.237196, -2.518486, 1, 0.03529412, 0, 1,
-2.742558, -0.5430561, -2.066511, 1, 0.04313726, 0, 1,
-2.601926, -1.518154, -1.105311, 1, 0.04705882, 0, 1,
-2.599252, -1.232206, -2.81421, 1, 0.05490196, 0, 1,
-2.504544, -0.3745342, -2.331949, 1, 0.05882353, 0, 1,
-2.459909, -0.1793195, -1.472035, 1, 0.06666667, 0, 1,
-2.390234, 0.7736446, -1.053558, 1, 0.07058824, 0, 1,
-2.360336, -0.3716667, -2.165334, 1, 0.07843138, 0, 1,
-2.313902, 0.5624591, -0.8758588, 1, 0.08235294, 0, 1,
-2.264053, -1.758934, -0.3898716, 1, 0.09019608, 0, 1,
-2.262054, 1.287974, -1.008563, 1, 0.09411765, 0, 1,
-2.258371, -0.6090435, -1.702953, 1, 0.1019608, 0, 1,
-2.235607, -1.421042, -0.9829994, 1, 0.1098039, 0, 1,
-2.220128, -0.4667316, -2.963472, 1, 0.1137255, 0, 1,
-2.213174, -0.3397844, -2.594356, 1, 0.1215686, 0, 1,
-2.16575, -0.04014988, -0.9083905, 1, 0.1254902, 0, 1,
-2.165183, -0.8579966, -1.265765, 1, 0.1333333, 0, 1,
-2.141361, -0.6405472, -1.433932, 1, 0.1372549, 0, 1,
-2.082989, 0.003192933, -2.056831, 1, 0.145098, 0, 1,
-2.066495, -0.9841061, -2.110415, 1, 0.1490196, 0, 1,
-2.063324, 1.58666, -1.399198, 1, 0.1568628, 0, 1,
-2.056726, -0.289215, -0.4238542, 1, 0.1607843, 0, 1,
-2.02898, -1.233213, -4.048302, 1, 0.1686275, 0, 1,
-2.021104, 1.703318, -0.5056375, 1, 0.172549, 0, 1,
-2.016986, -0.6794227, -1.661311, 1, 0.1803922, 0, 1,
-2.00808, -0.6307575, -1.447351, 1, 0.1843137, 0, 1,
-1.998137, 0.5102113, -1.032309, 1, 0.1921569, 0, 1,
-1.93924, 1.26142, -0.6020749, 1, 0.1960784, 0, 1,
-1.931195, 0.1927132, -0.3157765, 1, 0.2039216, 0, 1,
-1.923592, -1.244101, 0.6859508, 1, 0.2117647, 0, 1,
-1.910399, 0.7041315, -0.6818057, 1, 0.2156863, 0, 1,
-1.904177, -0.6543912, -1.863072, 1, 0.2235294, 0, 1,
-1.899439, 0.6998599, -1.836647, 1, 0.227451, 0, 1,
-1.866188, -0.07246488, -0.4816709, 1, 0.2352941, 0, 1,
-1.844311, 0.3516548, -1.225365, 1, 0.2392157, 0, 1,
-1.825959, -1.548221, -2.030735, 1, 0.2470588, 0, 1,
-1.818619, -1.110826, -1.316629, 1, 0.2509804, 0, 1,
-1.818565, -0.5619882, -1.467755, 1, 0.2588235, 0, 1,
-1.816309, 0.6091985, -2.383339, 1, 0.2627451, 0, 1,
-1.811373, 0.7402771, -1.755967, 1, 0.2705882, 0, 1,
-1.786509, 0.008397796, -1.943845, 1, 0.2745098, 0, 1,
-1.767789, 0.08344427, -2.581273, 1, 0.282353, 0, 1,
-1.763284, -0.3716259, -3.997705, 1, 0.2862745, 0, 1,
-1.753292, 0.2967649, -1.698492, 1, 0.2941177, 0, 1,
-1.741309, 0.04186017, -2.231556, 1, 0.3019608, 0, 1,
-1.737919, 1.334262, -1.341088, 1, 0.3058824, 0, 1,
-1.733964, 1.145415, -0.5628672, 1, 0.3137255, 0, 1,
-1.726927, -1.72705, -1.659605, 1, 0.3176471, 0, 1,
-1.726142, 1.433163, 0.3114787, 1, 0.3254902, 0, 1,
-1.723757, 1.342317, -0.9772384, 1, 0.3294118, 0, 1,
-1.721921, 1.364468, 1.512327, 1, 0.3372549, 0, 1,
-1.703642, 0.6697055, -0.6444921, 1, 0.3411765, 0, 1,
-1.703032, 0.9227449, -1.682436, 1, 0.3490196, 0, 1,
-1.69409, -0.07454833, -0.4109311, 1, 0.3529412, 0, 1,
-1.672747, -1.504989, -2.880718, 1, 0.3607843, 0, 1,
-1.642175, 0.1159988, -1.615707, 1, 0.3647059, 0, 1,
-1.621155, 0.1286461, -2.491653, 1, 0.372549, 0, 1,
-1.617298, -1.551129, -3.901426, 1, 0.3764706, 0, 1,
-1.580955, 0.001791282, 0.6279357, 1, 0.3843137, 0, 1,
-1.577821, -1.370637, -2.753122, 1, 0.3882353, 0, 1,
-1.573313, 1.242905, -0.05802203, 1, 0.3960784, 0, 1,
-1.560717, -0.2015916, -1.224066, 1, 0.4039216, 0, 1,
-1.55009, 0.5186825, 0.08580472, 1, 0.4078431, 0, 1,
-1.549748, 0.09976738, -1.776209, 1, 0.4156863, 0, 1,
-1.545043, -1.364871, -1.103786, 1, 0.4196078, 0, 1,
-1.542323, 1.55321, -0.515821, 1, 0.427451, 0, 1,
-1.533267, -2.431175, -2.424039, 1, 0.4313726, 0, 1,
-1.533251, 0.988196, -2.589656, 1, 0.4392157, 0, 1,
-1.531137, 0.08150176, -2.221184, 1, 0.4431373, 0, 1,
-1.525555, -0.0366813, -1.217584, 1, 0.4509804, 0, 1,
-1.521193, -0.02211784, -2.673683, 1, 0.454902, 0, 1,
-1.516552, -0.4812202, -3.248833, 1, 0.4627451, 0, 1,
-1.503516, -0.9256759, -1.689223, 1, 0.4666667, 0, 1,
-1.489695, 0.2858588, -2.57433, 1, 0.4745098, 0, 1,
-1.485551, 0.3359782, -0.5057805, 1, 0.4784314, 0, 1,
-1.484416, 0.06118957, -1.032345, 1, 0.4862745, 0, 1,
-1.48258, -0.6043697, -2.050224, 1, 0.4901961, 0, 1,
-1.476298, -0.9665936, -0.507261, 1, 0.4980392, 0, 1,
-1.475689, -0.0333626, -1.640328, 1, 0.5058824, 0, 1,
-1.460023, -1.49573, -2.425978, 1, 0.509804, 0, 1,
-1.446544, 0.4776354, 0.5231428, 1, 0.5176471, 0, 1,
-1.446351, 0.4198721, -1.152779, 1, 0.5215687, 0, 1,
-1.445728, 1.712781, -1.151807, 1, 0.5294118, 0, 1,
-1.443555, 1.429739, 0.6636299, 1, 0.5333334, 0, 1,
-1.437837, -1.052454, -2.156016, 1, 0.5411765, 0, 1,
-1.435335, -1.068766, -0.886178, 1, 0.5450981, 0, 1,
-1.433519, 1.059375, -0.3941033, 1, 0.5529412, 0, 1,
-1.419556, -0.2317295, -0.1172296, 1, 0.5568628, 0, 1,
-1.419197, 0.3301527, 1.154449, 1, 0.5647059, 0, 1,
-1.408578, -1.633668, -2.147676, 1, 0.5686275, 0, 1,
-1.405793, 1.032528, -1.986087, 1, 0.5764706, 0, 1,
-1.404825, 0.1988968, -0.8382688, 1, 0.5803922, 0, 1,
-1.397103, 0.7124956, -1.798755, 1, 0.5882353, 0, 1,
-1.381073, -2.185999, -1.595703, 1, 0.5921569, 0, 1,
-1.357864, -1.503163, -2.825226, 1, 0.6, 0, 1,
-1.356332, 0.1303625, -1.19705, 1, 0.6078432, 0, 1,
-1.35206, 2.680712, -2.831234, 1, 0.6117647, 0, 1,
-1.349889, -0.04808396, -2.117898, 1, 0.6196079, 0, 1,
-1.326467, 1.0568, -1.446372, 1, 0.6235294, 0, 1,
-1.318283, -0.8432384, -2.508298, 1, 0.6313726, 0, 1,
-1.31662, -0.5067214, -3.113739, 1, 0.6352941, 0, 1,
-1.306792, 0.4501316, -1.308067, 1, 0.6431373, 0, 1,
-1.300162, -0.9903641, -2.327451, 1, 0.6470588, 0, 1,
-1.281682, 0.3400382, -2.238945, 1, 0.654902, 0, 1,
-1.279116, 0.3847374, -2.140022, 1, 0.6588235, 0, 1,
-1.276235, -1.529974, -3.054926, 1, 0.6666667, 0, 1,
-1.275978, 0.3518988, 0.05925129, 1, 0.6705883, 0, 1,
-1.274862, -0.2346067, -1.738328, 1, 0.6784314, 0, 1,
-1.269936, 0.56403, -2.007747, 1, 0.682353, 0, 1,
-1.268361, -1.60355, -2.182921, 1, 0.6901961, 0, 1,
-1.252731, 1.507222, -2.049956, 1, 0.6941177, 0, 1,
-1.244888, -0.3170263, -4.180865, 1, 0.7019608, 0, 1,
-1.244259, 1.361215, -2.158647, 1, 0.7098039, 0, 1,
-1.235467, 0.5309618, -0.8123645, 1, 0.7137255, 0, 1,
-1.231765, -2.305278, -2.129933, 1, 0.7215686, 0, 1,
-1.227101, -1.450471, -1.867518, 1, 0.7254902, 0, 1,
-1.22616, 1.084242, -0.5077493, 1, 0.7333333, 0, 1,
-1.224478, 0.6868227, -0.4019329, 1, 0.7372549, 0, 1,
-1.219652, 2.643409, -2.325965, 1, 0.7450981, 0, 1,
-1.219435, 1.163466, -0.3023867, 1, 0.7490196, 0, 1,
-1.201098, -0.5053518, -1.800735, 1, 0.7568628, 0, 1,
-1.199308, 0.7211509, -2.616467, 1, 0.7607843, 0, 1,
-1.196734, -0.2905886, -1.573803, 1, 0.7686275, 0, 1,
-1.19374, 0.9406157, -0.760219, 1, 0.772549, 0, 1,
-1.190493, -0.2874933, -1.115663, 1, 0.7803922, 0, 1,
-1.190292, -1.190433, -4.083632, 1, 0.7843137, 0, 1,
-1.180855, -0.8872019, -1.431674, 1, 0.7921569, 0, 1,
-1.176119, 0.06416333, -0.1239646, 1, 0.7960784, 0, 1,
-1.173346, 0.6609976, -1.023972, 1, 0.8039216, 0, 1,
-1.169309, 0.4596718, 0.2125432, 1, 0.8117647, 0, 1,
-1.166938, 1.514183, 0.0922544, 1, 0.8156863, 0, 1,
-1.155088, -1.257727, -2.533753, 1, 0.8235294, 0, 1,
-1.151978, -1.221421, -2.96069, 1, 0.827451, 0, 1,
-1.149274, -1.479426, -3.254592, 1, 0.8352941, 0, 1,
-1.146534, 1.717272, -1.084759, 1, 0.8392157, 0, 1,
-1.144762, 0.2644309, -0.9917288, 1, 0.8470588, 0, 1,
-1.141828, 0.4543111, -1.319601, 1, 0.8509804, 0, 1,
-1.139254, -2.021779, -1.264355, 1, 0.8588235, 0, 1,
-1.137133, -0.4202647, -1.400994, 1, 0.8627451, 0, 1,
-1.135912, 0.628881, 0.3769512, 1, 0.8705882, 0, 1,
-1.1334, 0.2620095, -0.4868583, 1, 0.8745098, 0, 1,
-1.131851, 0.03108856, -0.9980447, 1, 0.8823529, 0, 1,
-1.129765, -0.9826205, -3.188276, 1, 0.8862745, 0, 1,
-1.125765, -0.1316199, 0.2853712, 1, 0.8941177, 0, 1,
-1.125629, -1.440554, -0.7481747, 1, 0.8980392, 0, 1,
-1.121524, 0.07686675, -3.542468, 1, 0.9058824, 0, 1,
-1.121305, -0.2988122, -1.921968, 1, 0.9137255, 0, 1,
-1.114309, 0.9267747, -1.492239, 1, 0.9176471, 0, 1,
-1.113221, 0.3074097, -2.007239, 1, 0.9254902, 0, 1,
-1.105637, 0.245844, -1.660392, 1, 0.9294118, 0, 1,
-1.101244, 0.8840671, 1.179979, 1, 0.9372549, 0, 1,
-1.100513, 0.7032427, -0.1374606, 1, 0.9411765, 0, 1,
-1.0865, -0.7904263, -1.25704, 1, 0.9490196, 0, 1,
-1.084001, -0.5762537, -1.974504, 1, 0.9529412, 0, 1,
-1.077968, 1.092077, -1.013829, 1, 0.9607843, 0, 1,
-1.074787, -0.4501809, -2.140895, 1, 0.9647059, 0, 1,
-1.071875, -0.3729986, -2.42589, 1, 0.972549, 0, 1,
-1.068683, -0.2906315, -2.574777, 1, 0.9764706, 0, 1,
-1.06568, -0.2684445, -1.350181, 1, 0.9843137, 0, 1,
-1.061249, 2.398658, -0.7925949, 1, 0.9882353, 0, 1,
-1.056573, -0.3137774, -2.726456, 1, 0.9960784, 0, 1,
-1.053497, 1.000588, 0.3725232, 0.9960784, 1, 0, 1,
-1.050589, -1.461945, -2.088555, 0.9921569, 1, 0, 1,
-1.050334, 1.110157, -0.06455624, 0.9843137, 1, 0, 1,
-1.047628, 0.2076748, 0.3914243, 0.9803922, 1, 0, 1,
-1.039526, 0.6651459, 0.3386669, 0.972549, 1, 0, 1,
-1.024733, -0.9076895, -0.6369758, 0.9686275, 1, 0, 1,
-1.024042, -0.2934058, -1.133761, 0.9607843, 1, 0, 1,
-1.020368, -0.2098172, -2.687379, 0.9568627, 1, 0, 1,
-1.019481, 0.3460327, -1.219102, 0.9490196, 1, 0, 1,
-1.01946, -0.557491, -0.1085783, 0.945098, 1, 0, 1,
-1.018499, 0.9862821, 0.6105715, 0.9372549, 1, 0, 1,
-1.011856, -1.135504, 0.2182202, 0.9333333, 1, 0, 1,
-0.9940174, -0.7818176, -1.569417, 0.9254902, 1, 0, 1,
-0.9921167, 0.8608551, -0.9000159, 0.9215686, 1, 0, 1,
-0.9879826, -1.211465, -2.52541, 0.9137255, 1, 0, 1,
-0.9866835, -0.2935117, -2.655254, 0.9098039, 1, 0, 1,
-0.9827594, -0.456632, -3.273607, 0.9019608, 1, 0, 1,
-0.9711339, 1.909711, 0.1533694, 0.8941177, 1, 0, 1,
-0.9706704, 2.098187, 0.2421654, 0.8901961, 1, 0, 1,
-0.9695411, -0.06248482, 0.1166375, 0.8823529, 1, 0, 1,
-0.9618118, -0.4520691, -2.16386, 0.8784314, 1, 0, 1,
-0.9611678, -1.65079, -1.946086, 0.8705882, 1, 0, 1,
-0.9596269, -0.4410761, -3.501828, 0.8666667, 1, 0, 1,
-0.9509736, 0.2616445, -1.864992, 0.8588235, 1, 0, 1,
-0.9408467, 1.483846, 0.6210126, 0.854902, 1, 0, 1,
-0.9339518, 0.3314529, -0.2232886, 0.8470588, 1, 0, 1,
-0.9320588, -0.5150462, -2.703295, 0.8431373, 1, 0, 1,
-0.9284442, -1.583617, -4.390254, 0.8352941, 1, 0, 1,
-0.9124398, -1.244002, -4.106771, 0.8313726, 1, 0, 1,
-0.9022519, 0.07185376, -1.007776, 0.8235294, 1, 0, 1,
-0.9007568, -0.3647225, -3.857996, 0.8196079, 1, 0, 1,
-0.8897834, 0.7779008, -0.5073708, 0.8117647, 1, 0, 1,
-0.8876775, -0.1574074, -1.920284, 0.8078431, 1, 0, 1,
-0.8869697, 0.1400377, -2.047862, 0.8, 1, 0, 1,
-0.8851578, 0.9710167, -2.068843, 0.7921569, 1, 0, 1,
-0.87655, -0.2749017, -2.183099, 0.7882353, 1, 0, 1,
-0.8760207, -0.3640836, -1.194509, 0.7803922, 1, 0, 1,
-0.8753961, 0.52134, 0.4450769, 0.7764706, 1, 0, 1,
-0.8655961, -0.6049812, -3.956846, 0.7686275, 1, 0, 1,
-0.8562264, 0.4103848, -1.540549, 0.7647059, 1, 0, 1,
-0.8540397, 0.1460702, -1.693889, 0.7568628, 1, 0, 1,
-0.8466649, 0.1439348, -1.707309, 0.7529412, 1, 0, 1,
-0.846513, -0.1226915, -2.757976, 0.7450981, 1, 0, 1,
-0.8428262, -0.2477216, -2.674447, 0.7411765, 1, 0, 1,
-0.8375204, 0.3165958, -1.448976, 0.7333333, 1, 0, 1,
-0.8374327, -0.8722889, -2.152849, 0.7294118, 1, 0, 1,
-0.8360341, 0.1815249, -1.564136, 0.7215686, 1, 0, 1,
-0.8342099, 1.871929, -0.1301437, 0.7176471, 1, 0, 1,
-0.8265223, 0.1390403, -1.883135, 0.7098039, 1, 0, 1,
-0.8232427, -1.389226, -3.373907, 0.7058824, 1, 0, 1,
-0.821776, -1.019897, -3.173142, 0.6980392, 1, 0, 1,
-0.8160307, -0.8054897, -2.979739, 0.6901961, 1, 0, 1,
-0.8096834, -0.9258739, -3.352976, 0.6862745, 1, 0, 1,
-0.8061238, -0.6744936, -1.263696, 0.6784314, 1, 0, 1,
-0.8029862, 0.9140348, -0.003473245, 0.6745098, 1, 0, 1,
-0.8018841, -0.8527925, -2.125787, 0.6666667, 1, 0, 1,
-0.7962873, 1.543109, -0.7311869, 0.6627451, 1, 0, 1,
-0.7896835, 0.8001618, -1.313556, 0.654902, 1, 0, 1,
-0.7896743, 0.4874509, 1.166453, 0.6509804, 1, 0, 1,
-0.7888738, 1.241704, -0.2929119, 0.6431373, 1, 0, 1,
-0.7884126, 0.8353698, -0.4621938, 0.6392157, 1, 0, 1,
-0.7880589, -1.830729, -3.722758, 0.6313726, 1, 0, 1,
-0.7839838, -0.3216734, -1.426047, 0.627451, 1, 0, 1,
-0.7825692, -0.9072402, -3.040982, 0.6196079, 1, 0, 1,
-0.7769837, 0.5698227, 0.1228583, 0.6156863, 1, 0, 1,
-0.7755288, -1.058699, -2.987773, 0.6078432, 1, 0, 1,
-0.7752734, -0.1632476, -0.542084, 0.6039216, 1, 0, 1,
-0.7728346, 0.5396577, -1.071213, 0.5960785, 1, 0, 1,
-0.7584989, -0.9076925, -3.319262, 0.5882353, 1, 0, 1,
-0.757341, -1.052831, -4.402766, 0.5843138, 1, 0, 1,
-0.7560961, 0.5548753, -0.9994882, 0.5764706, 1, 0, 1,
-0.7557746, -0.8940284, -2.132486, 0.572549, 1, 0, 1,
-0.7525797, -1.054064, -2.439739, 0.5647059, 1, 0, 1,
-0.7478959, -0.02299089, -0.7107628, 0.5607843, 1, 0, 1,
-0.745925, -1.408351, -2.87414, 0.5529412, 1, 0, 1,
-0.7424451, -0.1500458, -0.2150644, 0.5490196, 1, 0, 1,
-0.7406243, -1.181491, -1.110994, 0.5411765, 1, 0, 1,
-0.7400512, -0.9302876, -2.347163, 0.5372549, 1, 0, 1,
-0.7329417, -0.9053576, -0.7422877, 0.5294118, 1, 0, 1,
-0.7327076, -0.7788022, -1.731718, 0.5254902, 1, 0, 1,
-0.7224855, 0.3317552, -1.599264, 0.5176471, 1, 0, 1,
-0.7222461, -2.445557, -3.333664, 0.5137255, 1, 0, 1,
-0.7175476, -0.8781621, 0.4841624, 0.5058824, 1, 0, 1,
-0.7169147, -1.326047, -2.660794, 0.5019608, 1, 0, 1,
-0.7163426, -0.7796558, -3.535133, 0.4941176, 1, 0, 1,
-0.7157894, 1.118161, -0.8878869, 0.4862745, 1, 0, 1,
-0.7120173, 0.3903957, -0.3944712, 0.4823529, 1, 0, 1,
-0.707498, 1.523475, 0.5440236, 0.4745098, 1, 0, 1,
-0.7061211, 1.621763, -0.05975701, 0.4705882, 1, 0, 1,
-0.7052764, 0.04176104, -1.381685, 0.4627451, 1, 0, 1,
-0.7032878, -1.390621, -2.735013, 0.4588235, 1, 0, 1,
-0.7025805, 0.4763132, -1.800098, 0.4509804, 1, 0, 1,
-0.7004059, -0.2526419, -2.695484, 0.4470588, 1, 0, 1,
-0.7003335, 0.6394306, -1.240173, 0.4392157, 1, 0, 1,
-0.6997851, 0.2945731, -1.289214, 0.4352941, 1, 0, 1,
-0.6968188, -0.5533919, -3.399268, 0.427451, 1, 0, 1,
-0.6949569, 0.3488461, -1.196931, 0.4235294, 1, 0, 1,
-0.6924618, 1.120051, -1.098997, 0.4156863, 1, 0, 1,
-0.6898785, -0.3191611, -1.916358, 0.4117647, 1, 0, 1,
-0.6898751, 0.3501621, -1.607122, 0.4039216, 1, 0, 1,
-0.6866149, -0.2085817, -2.080341, 0.3960784, 1, 0, 1,
-0.681744, 0.1866592, -1.90903, 0.3921569, 1, 0, 1,
-0.6790349, -0.4090059, -2.373805, 0.3843137, 1, 0, 1,
-0.6755718, 0.7460315, -0.7434538, 0.3803922, 1, 0, 1,
-0.6735905, -0.7617012, -1.618752, 0.372549, 1, 0, 1,
-0.6719171, -2.377538, -2.83557, 0.3686275, 1, 0, 1,
-0.6717355, -0.5537749, -1.950506, 0.3607843, 1, 0, 1,
-0.6693999, 0.4932868, -0.05749288, 0.3568628, 1, 0, 1,
-0.6689831, 1.655909, -0.7838685, 0.3490196, 1, 0, 1,
-0.6660261, -0.9585734, -2.056884, 0.345098, 1, 0, 1,
-0.6633859, 0.4647245, 0.7055912, 0.3372549, 1, 0, 1,
-0.6617139, -0.6374037, -2.180398, 0.3333333, 1, 0, 1,
-0.6562757, 0.5908937, -1.101757, 0.3254902, 1, 0, 1,
-0.6535594, -0.5436031, -1.317058, 0.3215686, 1, 0, 1,
-0.6529132, 0.9921658, -1.381692, 0.3137255, 1, 0, 1,
-0.6445424, -0.3547198, -2.075149, 0.3098039, 1, 0, 1,
-0.64377, 1.089839, -0.3396669, 0.3019608, 1, 0, 1,
-0.6418923, 0.1375817, -0.184326, 0.2941177, 1, 0, 1,
-0.6412164, 0.9429011, -2.008843, 0.2901961, 1, 0, 1,
-0.6408452, 1.157889, -0.9276597, 0.282353, 1, 0, 1,
-0.6406618, 0.3756369, -3.367007, 0.2784314, 1, 0, 1,
-0.6388406, 0.5953028, -1.195577, 0.2705882, 1, 0, 1,
-0.6301984, -1.503278, -2.961214, 0.2666667, 1, 0, 1,
-0.6250582, 0.4086058, 1.877519, 0.2588235, 1, 0, 1,
-0.6232059, -0.4304855, 0.1639807, 0.254902, 1, 0, 1,
-0.6213714, 1.26602, -0.2608988, 0.2470588, 1, 0, 1,
-0.6097997, 0.3988304, -0.5281187, 0.2431373, 1, 0, 1,
-0.6071959, -0.7530093, -2.368617, 0.2352941, 1, 0, 1,
-0.6062351, 0.4119404, -0.3554169, 0.2313726, 1, 0, 1,
-0.6040049, -1.148394, -2.452699, 0.2235294, 1, 0, 1,
-0.6016776, 0.218406, -2.519951, 0.2196078, 1, 0, 1,
-0.595138, -1.572668, -2.095446, 0.2117647, 1, 0, 1,
-0.5874808, 0.4623665, -0.698911, 0.2078431, 1, 0, 1,
-0.5869883, 0.8187348, -0.8667623, 0.2, 1, 0, 1,
-0.5852153, 0.3990822, -2.889782, 0.1921569, 1, 0, 1,
-0.5825274, 0.2402827, -1.542328, 0.1882353, 1, 0, 1,
-0.5809662, -0.9074556, -0.5385128, 0.1803922, 1, 0, 1,
-0.5789728, 0.6099638, -1.402296, 0.1764706, 1, 0, 1,
-0.5776627, 1.29748, 0.448689, 0.1686275, 1, 0, 1,
-0.5775753, 0.9908089, 0.4315568, 0.1647059, 1, 0, 1,
-0.5770884, 0.3081398, -1.349581, 0.1568628, 1, 0, 1,
-0.5750123, -1.161467, -1.438539, 0.1529412, 1, 0, 1,
-0.5717822, -1.330042, -2.839301, 0.145098, 1, 0, 1,
-0.5706831, -0.7273654, -0.1492507, 0.1411765, 1, 0, 1,
-0.5674049, 0.9762406, -0.8747286, 0.1333333, 1, 0, 1,
-0.5645176, -0.353508, -2.357213, 0.1294118, 1, 0, 1,
-0.5588679, -0.4154385, -2.251259, 0.1215686, 1, 0, 1,
-0.5503681, -0.2052136, -2.794532, 0.1176471, 1, 0, 1,
-0.5480693, 2.055313, 1.141305, 0.1098039, 1, 0, 1,
-0.5461279, 0.7584993, -1.116639, 0.1058824, 1, 0, 1,
-0.5458295, -0.3416497, -3.737761, 0.09803922, 1, 0, 1,
-0.5449297, 0.9049066, -2.491229, 0.09019608, 1, 0, 1,
-0.5432131, -1.309691, -2.555324, 0.08627451, 1, 0, 1,
-0.5428139, 0.7677645, -1.668822, 0.07843138, 1, 0, 1,
-0.5423911, -0.3456509, -3.197327, 0.07450981, 1, 0, 1,
-0.5381027, 0.90681, 0.04198321, 0.06666667, 1, 0, 1,
-0.5368824, -2.676272, -2.78015, 0.0627451, 1, 0, 1,
-0.531223, 0.7714864, 1.365737, 0.05490196, 1, 0, 1,
-0.5273398, 0.0660516, -2.379606, 0.05098039, 1, 0, 1,
-0.5248893, -1.466574, -3.356974, 0.04313726, 1, 0, 1,
-0.5245039, 0.6997517, -2.512393, 0.03921569, 1, 0, 1,
-0.5225794, -1.10079, -3.324528, 0.03137255, 1, 0, 1,
-0.5166253, -0.9798526, -5.028951, 0.02745098, 1, 0, 1,
-0.5164959, 0.2983015, 0.12318, 0.01960784, 1, 0, 1,
-0.5160862, 0.8133135, -2.136199, 0.01568628, 1, 0, 1,
-0.5153081, -1.365596, -3.735169, 0.007843138, 1, 0, 1,
-0.5125023, 1.288163, 0.2859019, 0.003921569, 1, 0, 1,
-0.5117502, 1.178978, 0.2156692, 0, 1, 0.003921569, 1,
-0.5106321, 2.663435, -0.7770022, 0, 1, 0.01176471, 1,
-0.503689, -0.7177189, -4.67982, 0, 1, 0.01568628, 1,
-0.5009291, 0.5209156, -0.7774546, 0, 1, 0.02352941, 1,
-0.4995345, 1.820427, 0.08657566, 0, 1, 0.02745098, 1,
-0.4990159, 0.5060195, 1.188909, 0, 1, 0.03529412, 1,
-0.497948, 0.1668586, -1.275951, 0, 1, 0.03921569, 1,
-0.4967897, 1.752219, -0.6080772, 0, 1, 0.04705882, 1,
-0.4965751, -0.5765204, -1.893024, 0, 1, 0.05098039, 1,
-0.4907335, 1.283115, -0.165203, 0, 1, 0.05882353, 1,
-0.4808078, 0.02777418, -2.118337, 0, 1, 0.0627451, 1,
-0.4700929, 0.6373632, -1.544817, 0, 1, 0.07058824, 1,
-0.4688985, -0.8401867, -3.067992, 0, 1, 0.07450981, 1,
-0.467636, -1.575029, -1.864335, 0, 1, 0.08235294, 1,
-0.4667756, 1.270392, 0.1661754, 0, 1, 0.08627451, 1,
-0.4663355, 1.346433, -0.2820204, 0, 1, 0.09411765, 1,
-0.4638907, 1.238884, 0.01525427, 0, 1, 0.1019608, 1,
-0.4630134, 1.036788, 0.2426433, 0, 1, 0.1058824, 1,
-0.4621695, 2.397241, -0.384277, 0, 1, 0.1137255, 1,
-0.4557338, 0.004562972, -2.878089, 0, 1, 0.1176471, 1,
-0.448078, 0.5889202, -0.4838741, 0, 1, 0.1254902, 1,
-0.4480487, 0.1166987, -3.182499, 0, 1, 0.1294118, 1,
-0.4477279, -1.037835, -2.558276, 0, 1, 0.1372549, 1,
-0.4281046, -0.9666053, -3.171232, 0, 1, 0.1411765, 1,
-0.4275495, -1.841919, -3.278313, 0, 1, 0.1490196, 1,
-0.4264924, 1.330008, -1.623317, 0, 1, 0.1529412, 1,
-0.4254369, -3.36151, -3.637799, 0, 1, 0.1607843, 1,
-0.4236689, -1.697103, -2.579513, 0, 1, 0.1647059, 1,
-0.4201184, -0.1356118, -2.333204, 0, 1, 0.172549, 1,
-0.4183422, 0.7120406, -1.21872, 0, 1, 0.1764706, 1,
-0.4163882, 0.396004, -3.046439, 0, 1, 0.1843137, 1,
-0.4093842, -1.144916, -3.797375, 0, 1, 0.1882353, 1,
-0.4058887, -0.4892731, -2.438711, 0, 1, 0.1960784, 1,
-0.4049428, 1.433861, -1.824998, 0, 1, 0.2039216, 1,
-0.4037879, -0.84644, -3.109196, 0, 1, 0.2078431, 1,
-0.4027523, 0.3704366, -2.134687, 0, 1, 0.2156863, 1,
-0.4004166, 0.4084802, -1.628365, 0, 1, 0.2196078, 1,
-0.3929047, -1.32939, -0.7433328, 0, 1, 0.227451, 1,
-0.3884676, -0.4048993, -2.878702, 0, 1, 0.2313726, 1,
-0.3882833, -1.071837, -2.553434, 0, 1, 0.2392157, 1,
-0.3769649, 0.5762488, -1.146003, 0, 1, 0.2431373, 1,
-0.3769206, -0.2645236, -2.286346, 0, 1, 0.2509804, 1,
-0.3727408, 1.301338, -0.8451653, 0, 1, 0.254902, 1,
-0.3714943, -0.9340339, -1.64614, 0, 1, 0.2627451, 1,
-0.3699053, -0.6222519, -2.200858, 0, 1, 0.2666667, 1,
-0.3693972, -0.6695585, -3.404669, 0, 1, 0.2745098, 1,
-0.3652045, 1.919104, 0.1768373, 0, 1, 0.2784314, 1,
-0.3651178, 0.6486218, -0.4883855, 0, 1, 0.2862745, 1,
-0.3636046, 0.7581554, -0.8616715, 0, 1, 0.2901961, 1,
-0.3632328, 0.8832395, -1.522805, 0, 1, 0.2980392, 1,
-0.3624926, -0.9600677, -2.817235, 0, 1, 0.3058824, 1,
-0.3605301, 0.1416028, -2.616623, 0, 1, 0.3098039, 1,
-0.3605188, -1.272848, -3.776793, 0, 1, 0.3176471, 1,
-0.3605179, -0.9430523, -3.248602, 0, 1, 0.3215686, 1,
-0.3562924, -1.588519, -3.204756, 0, 1, 0.3294118, 1,
-0.3550732, -2.280241, -2.740677, 0, 1, 0.3333333, 1,
-0.3539706, -0.5401577, -1.921482, 0, 1, 0.3411765, 1,
-0.3512803, 0.08785573, -3.199674, 0, 1, 0.345098, 1,
-0.3501621, -0.479759, -2.356551, 0, 1, 0.3529412, 1,
-0.348479, 0.9329549, -1.154418, 0, 1, 0.3568628, 1,
-0.3480322, -1.669036, -2.155821, 0, 1, 0.3647059, 1,
-0.3453196, 1.608375, -0.2629537, 0, 1, 0.3686275, 1,
-0.3427894, -0.1499589, -0.5806056, 0, 1, 0.3764706, 1,
-0.3416034, -0.7485051, -2.576419, 0, 1, 0.3803922, 1,
-0.3379507, -0.2591608, -1.796924, 0, 1, 0.3882353, 1,
-0.3347452, -0.08214372, -3.709802, 0, 1, 0.3921569, 1,
-0.3345376, -0.03829813, -2.533589, 0, 1, 0.4, 1,
-0.3306422, -0.9989259, -2.401745, 0, 1, 0.4078431, 1,
-0.3281584, -1.080719, -2.752744, 0, 1, 0.4117647, 1,
-0.3280782, -1.483976, -2.281455, 0, 1, 0.4196078, 1,
-0.3230911, -0.005819659, -2.698286, 0, 1, 0.4235294, 1,
-0.3223755, -0.529808, -2.799007, 0, 1, 0.4313726, 1,
-0.3193805, -1.018916, -2.650044, 0, 1, 0.4352941, 1,
-0.3164476, 2.221405, 1.910026, 0, 1, 0.4431373, 1,
-0.3131796, 1.056179, 1.146133, 0, 1, 0.4470588, 1,
-0.3119228, -0.5469817, -1.448064, 0, 1, 0.454902, 1,
-0.311728, -0.5684595, -2.490916, 0, 1, 0.4588235, 1,
-0.3105862, 0.3880688, 0.1462681, 0, 1, 0.4666667, 1,
-0.3094054, 0.1000349, -1.54588, 0, 1, 0.4705882, 1,
-0.3085936, 0.1121362, 0.2715096, 0, 1, 0.4784314, 1,
-0.3034719, -1.580114, -3.5869, 0, 1, 0.4823529, 1,
-0.3014476, 0.1636345, -1.031959, 0, 1, 0.4901961, 1,
-0.2895368, -0.2697201, -2.215889, 0, 1, 0.4941176, 1,
-0.2880637, 0.8281876, 0.6528839, 0, 1, 0.5019608, 1,
-0.2863411, -1.431061, -3.873911, 0, 1, 0.509804, 1,
-0.2858283, -1.977681, -1.799424, 0, 1, 0.5137255, 1,
-0.2835641, -0.2461696, -1.356099, 0, 1, 0.5215687, 1,
-0.281934, 0.4003973, -0.9236835, 0, 1, 0.5254902, 1,
-0.2801173, -0.3180463, -2.476215, 0, 1, 0.5333334, 1,
-0.2792165, 0.1543054, -0.3513145, 0, 1, 0.5372549, 1,
-0.27538, 0.7057955, -1.67525, 0, 1, 0.5450981, 1,
-0.2666867, 1.931926, -0.8721216, 0, 1, 0.5490196, 1,
-0.2648208, 2.023247, -0.5379172, 0, 1, 0.5568628, 1,
-0.2645503, -0.6262303, -2.250911, 0, 1, 0.5607843, 1,
-0.2585476, -0.8345436, -3.957519, 0, 1, 0.5686275, 1,
-0.2568309, -0.5354492, -1.900286, 0, 1, 0.572549, 1,
-0.254299, -1.909671, -3.743301, 0, 1, 0.5803922, 1,
-0.2541418, -0.5850269, -4.992634, 0, 1, 0.5843138, 1,
-0.2491592, -0.6974797, -2.616195, 0, 1, 0.5921569, 1,
-0.2488607, 0.9835264, -1.913992, 0, 1, 0.5960785, 1,
-0.24214, -2.323796, -4.292842, 0, 1, 0.6039216, 1,
-0.2409239, -0.5418378, -2.416836, 0, 1, 0.6117647, 1,
-0.2385852, -0.3412089, -1.140285, 0, 1, 0.6156863, 1,
-0.2372528, 1.405204, 0.6107768, 0, 1, 0.6235294, 1,
-0.2349025, -1.907393, -4.206062, 0, 1, 0.627451, 1,
-0.2332935, 1.078297, -0.9228005, 0, 1, 0.6352941, 1,
-0.2285352, -1.622939, -2.508679, 0, 1, 0.6392157, 1,
-0.2283679, 0.05131601, -1.495026, 0, 1, 0.6470588, 1,
-0.2270027, -0.1970579, -1.222835, 0, 1, 0.6509804, 1,
-0.2251025, -0.7881305, -3.365035, 0, 1, 0.6588235, 1,
-0.2212265, 1.978052, -0.07882316, 0, 1, 0.6627451, 1,
-0.2199872, 0.9169479, -2.718191, 0, 1, 0.6705883, 1,
-0.2167584, 1.195349, -0.3640174, 0, 1, 0.6745098, 1,
-0.2099695, -0.1917129, -0.8730993, 0, 1, 0.682353, 1,
-0.2074555, -0.8061492, -2.690136, 0, 1, 0.6862745, 1,
-0.2064366, 1.322699, -0.4805431, 0, 1, 0.6941177, 1,
-0.2047005, -1.018335, -2.020581, 0, 1, 0.7019608, 1,
-0.2046698, -2.18033, -2.72729, 0, 1, 0.7058824, 1,
-0.2030003, 0.7126762, 1.621434, 0, 1, 0.7137255, 1,
-0.2026028, -1.020032, -1.971606, 0, 1, 0.7176471, 1,
-0.2017452, -1.932832, -3.588194, 0, 1, 0.7254902, 1,
-0.2014664, 0.1603741, 2.411949, 0, 1, 0.7294118, 1,
-0.2011567, 0.9125572, -0.46505, 0, 1, 0.7372549, 1,
-0.2008786, 0.03846833, -1.302654, 0, 1, 0.7411765, 1,
-0.2007224, -0.1805654, -1.048898, 0, 1, 0.7490196, 1,
-0.1980402, 1.064858, 0.04899588, 0, 1, 0.7529412, 1,
-0.1961162, -1.272452, -3.752623, 0, 1, 0.7607843, 1,
-0.1901274, 0.5083963, 0.1470867, 0, 1, 0.7647059, 1,
-0.1876696, 0.09565548, -0.3162376, 0, 1, 0.772549, 1,
-0.1863857, 1.614258, -1.157579, 0, 1, 0.7764706, 1,
-0.1850743, 0.5866734, 1.465003, 0, 1, 0.7843137, 1,
-0.1830651, 1.090044, -0.6629198, 0, 1, 0.7882353, 1,
-0.1800719, -3.04483, -4.829007, 0, 1, 0.7960784, 1,
-0.1795622, 0.1852529, -0.1248815, 0, 1, 0.8039216, 1,
-0.174138, -0.1637017, -3.269854, 0, 1, 0.8078431, 1,
-0.1700875, -0.6575348, -4.852649, 0, 1, 0.8156863, 1,
-0.1683708, -0.8006609, -1.912697, 0, 1, 0.8196079, 1,
-0.1682214, -0.2793756, -2.463979, 0, 1, 0.827451, 1,
-0.1673028, -0.1682047, -2.432673, 0, 1, 0.8313726, 1,
-0.1635897, -0.201068, -1.164687, 0, 1, 0.8392157, 1,
-0.1621303, -1.013991, -5.627584, 0, 1, 0.8431373, 1,
-0.1596205, -0.241051, -4.818168, 0, 1, 0.8509804, 1,
-0.1594718, 0.08654915, 0.1012582, 0, 1, 0.854902, 1,
-0.1592449, 1.821684, 0.7438489, 0, 1, 0.8627451, 1,
-0.1573075, 1.555174, 0.332321, 0, 1, 0.8666667, 1,
-0.1514434, -0.2068884, -1.135, 0, 1, 0.8745098, 1,
-0.149662, -0.3756735, -3.010189, 0, 1, 0.8784314, 1,
-0.1495675, -0.8681775, -3.059943, 0, 1, 0.8862745, 1,
-0.1490385, 0.418043, 0.83507, 0, 1, 0.8901961, 1,
-0.1480909, -0.4520045, -1.462987, 0, 1, 0.8980392, 1,
-0.1456768, -0.6841765, -4.732306, 0, 1, 0.9058824, 1,
-0.1448674, -0.1973319, -0.8702059, 0, 1, 0.9098039, 1,
-0.1424515, -1.635664, -2.121321, 0, 1, 0.9176471, 1,
-0.1421457, -1.153482, -3.599499, 0, 1, 0.9215686, 1,
-0.140896, -2.332405, -4.094897, 0, 1, 0.9294118, 1,
-0.1408202, -2.280105, -3.226715, 0, 1, 0.9333333, 1,
-0.1370331, -0.1227995, -2.526955, 0, 1, 0.9411765, 1,
-0.123207, 0.5512301, 0.05988561, 0, 1, 0.945098, 1,
-0.1219357, -0.3639558, -3.566173, 0, 1, 0.9529412, 1,
-0.1197997, -1.053623, -2.151375, 0, 1, 0.9568627, 1,
-0.1125088, -0.07405822, -3.309972, 0, 1, 0.9647059, 1,
-0.1116916, 0.04807943, -0.4671235, 0, 1, 0.9686275, 1,
-0.1057873, 0.1293853, -0.7559956, 0, 1, 0.9764706, 1,
-0.1054674, 0.4734476, 0.3111117, 0, 1, 0.9803922, 1,
-0.1044532, 0.2188634, 0.02695086, 0, 1, 0.9882353, 1,
-0.1019175, -1.549974, -3.647667, 0, 1, 0.9921569, 1,
-0.09986553, 0.5278758, 0.002804833, 0, 1, 1, 1,
-0.09931456, -0.7193714, -3.635541, 0, 0.9921569, 1, 1,
-0.09391355, -1.691373, -1.86409, 0, 0.9882353, 1, 1,
-0.09177371, -1.887035, -4.130617, 0, 0.9803922, 1, 1,
-0.08951987, 0.6842799, 0.3471895, 0, 0.9764706, 1, 1,
-0.08935357, 0.2403469, 0.02615276, 0, 0.9686275, 1, 1,
-0.08872731, 0.3914598, -1.164925, 0, 0.9647059, 1, 1,
-0.08649537, 0.6867851, -0.4101117, 0, 0.9568627, 1, 1,
-0.08255208, -0.1545347, -2.926686, 0, 0.9529412, 1, 1,
-0.08134588, 1.744294, -0.2184429, 0, 0.945098, 1, 1,
-0.07992364, -0.7230438, -4.141517, 0, 0.9411765, 1, 1,
-0.07974266, 0.09081201, -1.617893, 0, 0.9333333, 1, 1,
-0.07950807, -0.5104721, -2.791128, 0, 0.9294118, 1, 1,
-0.07794537, -0.6251606, -3.387366, 0, 0.9215686, 1, 1,
-0.07571147, 0.6407527, -0.08073811, 0, 0.9176471, 1, 1,
-0.07161982, 0.5573897, 0.3570653, 0, 0.9098039, 1, 1,
-0.07154644, 1.62587, -1.588814, 0, 0.9058824, 1, 1,
-0.06495365, -0.3561453, -2.982789, 0, 0.8980392, 1, 1,
-0.06486719, -0.4881935, -1.574441, 0, 0.8901961, 1, 1,
-0.05853426, 0.5899511, -0.6848558, 0, 0.8862745, 1, 1,
-0.05763207, -1.37946, -3.152581, 0, 0.8784314, 1, 1,
-0.05527271, 1.782234, 1.305365, 0, 0.8745098, 1, 1,
-0.04954895, -1.203085, -3.302022, 0, 0.8666667, 1, 1,
-0.04741881, -0.4911588, -3.082514, 0, 0.8627451, 1, 1,
-0.04695847, 0.1707361, -0.05892646, 0, 0.854902, 1, 1,
-0.04377832, 0.2096757, -0.203382, 0, 0.8509804, 1, 1,
-0.04269553, -0.6627516, -3.918729, 0, 0.8431373, 1, 1,
-0.04253204, 0.2766298, 0.5128402, 0, 0.8392157, 1, 1,
-0.04232192, 2.177224, -1.128536, 0, 0.8313726, 1, 1,
-0.04161726, 1.164147, 1.723015, 0, 0.827451, 1, 1,
-0.03133857, 1.570823, 1.069683, 0, 0.8196079, 1, 1,
-0.02176451, 1.321411, -1.523012, 0, 0.8156863, 1, 1,
-0.02058345, 1.333567, 1.545732, 0, 0.8078431, 1, 1,
-0.02033817, 0.7425051, -0.7400474, 0, 0.8039216, 1, 1,
-0.01946848, 0.3612929, -0.6279839, 0, 0.7960784, 1, 1,
-0.01389959, 0.03897512, 0.1455113, 0, 0.7882353, 1, 1,
-0.01180791, 1.752156, 0.7897224, 0, 0.7843137, 1, 1,
-0.01117925, 1.358133, 1.582319, 0, 0.7764706, 1, 1,
-0.01082068, -1.641333, -3.809597, 0, 0.772549, 1, 1,
-0.00545782, -0.5553536, -3.486096, 0, 0.7647059, 1, 1,
-0.001926572, -3.659073, -3.773145, 0, 0.7607843, 1, 1,
0.0008927717, 0.1782736, -0.07872475, 0, 0.7529412, 1, 1,
0.001688368, -0.4297422, 2.37542, 0, 0.7490196, 1, 1,
0.005333407, 2.840592, -1.251745, 0, 0.7411765, 1, 1,
0.007087279, -0.275176, 3.743292, 0, 0.7372549, 1, 1,
0.007487328, -0.9044967, 2.498478, 0, 0.7294118, 1, 1,
0.008466966, -1.335942, 1.471643, 0, 0.7254902, 1, 1,
0.009723458, 0.1131292, -0.001706482, 0, 0.7176471, 1, 1,
0.0111914, 0.7836202, -0.3896296, 0, 0.7137255, 1, 1,
0.01464012, -0.6881587, 2.092929, 0, 0.7058824, 1, 1,
0.01617092, 1.099844, -1.998192, 0, 0.6980392, 1, 1,
0.0187911, 0.657539, 0.1634838, 0, 0.6941177, 1, 1,
0.02196643, -0.1684276, 2.907417, 0, 0.6862745, 1, 1,
0.02238968, -0.788568, 1.881999, 0, 0.682353, 1, 1,
0.02244232, 0.892849, 2.52625, 0, 0.6745098, 1, 1,
0.02249798, -1.512714, 0.8826886, 0, 0.6705883, 1, 1,
0.02304382, 0.2117864, -0.8392124, 0, 0.6627451, 1, 1,
0.02636227, -1.101864, 2.145032, 0, 0.6588235, 1, 1,
0.02687121, 0.0240573, 0.1864281, 0, 0.6509804, 1, 1,
0.02986549, 1.722962, -0.02224735, 0, 0.6470588, 1, 1,
0.03612003, -1.079092, 3.316662, 0, 0.6392157, 1, 1,
0.03763258, -0.5722915, 2.180252, 0, 0.6352941, 1, 1,
0.04189827, -0.1264267, 3.200238, 0, 0.627451, 1, 1,
0.04366437, 0.4262086, -1.610084, 0, 0.6235294, 1, 1,
0.04700621, -0.5169428, 2.186169, 0, 0.6156863, 1, 1,
0.04892338, 0.8268196, -0.3337585, 0, 0.6117647, 1, 1,
0.05517735, -0.2299442, 4.060028, 0, 0.6039216, 1, 1,
0.0594075, -0.9788817, 2.01742, 0, 0.5960785, 1, 1,
0.05994598, 0.5608984, -0.3766551, 0, 0.5921569, 1, 1,
0.06897131, 0.3876975, 2.188402, 0, 0.5843138, 1, 1,
0.07119514, -2.492251, 1.166636, 0, 0.5803922, 1, 1,
0.07190668, -0.05166657, 2.033897, 0, 0.572549, 1, 1,
0.07521817, 0.1766099, -0.4482007, 0, 0.5686275, 1, 1,
0.07707583, -0.6011876, 3.40415, 0, 0.5607843, 1, 1,
0.08075076, -0.07725682, 3.301058, 0, 0.5568628, 1, 1,
0.08280435, 0.06104545, 2.007791, 0, 0.5490196, 1, 1,
0.08476747, -1.096895, 3.718915, 0, 0.5450981, 1, 1,
0.08517287, -0.8822019, 3.637892, 0, 0.5372549, 1, 1,
0.08608233, -1.256621, 3.215277, 0, 0.5333334, 1, 1,
0.09428449, -0.9566743, 2.412191, 0, 0.5254902, 1, 1,
0.0945004, 0.3790306, -0.5303364, 0, 0.5215687, 1, 1,
0.09908706, -0.1935815, 2.948368, 0, 0.5137255, 1, 1,
0.1021983, 0.009101862, 3.094276, 0, 0.509804, 1, 1,
0.1038079, -1.016356, 1.917315, 0, 0.5019608, 1, 1,
0.1058846, -1.056207, 2.503738, 0, 0.4941176, 1, 1,
0.1069677, 0.1443847, 2.197613, 0, 0.4901961, 1, 1,
0.1077641, -0.04045482, 0.5954269, 0, 0.4823529, 1, 1,
0.1094692, 0.3573085, -0.01943093, 0, 0.4784314, 1, 1,
0.1112184, 0.7769225, 0.7881685, 0, 0.4705882, 1, 1,
0.1120892, -0.3131636, 2.134744, 0, 0.4666667, 1, 1,
0.1123412, -0.4277742, 3.416711, 0, 0.4588235, 1, 1,
0.1160808, -1.081543, 4.246756, 0, 0.454902, 1, 1,
0.1180367, -1.268075, 2.993089, 0, 0.4470588, 1, 1,
0.1223523, -0.1713786, 3.532413, 0, 0.4431373, 1, 1,
0.1247962, 0.4020091, -0.1150123, 0, 0.4352941, 1, 1,
0.1266316, -0.4284833, 3.814327, 0, 0.4313726, 1, 1,
0.1274933, -1.012657, 2.287665, 0, 0.4235294, 1, 1,
0.1278406, 0.1602442, -0.5948189, 0, 0.4196078, 1, 1,
0.132954, -1.150459, 1.866414, 0, 0.4117647, 1, 1,
0.1358916, 0.2645242, 0.8399364, 0, 0.4078431, 1, 1,
0.1375559, 0.4590395, 1.541052, 0, 0.4, 1, 1,
0.1401862, 1.366136, -1.694778, 0, 0.3921569, 1, 1,
0.1413392, -0.3955326, 1.7361, 0, 0.3882353, 1, 1,
0.1432649, -0.7273603, 2.552549, 0, 0.3803922, 1, 1,
0.1483712, -0.6922433, 3.55337, 0, 0.3764706, 1, 1,
0.1520494, 0.2061001, 0.4218812, 0, 0.3686275, 1, 1,
0.1528571, -0.5908893, 2.925563, 0, 0.3647059, 1, 1,
0.1581475, 0.6865453, -0.4027987, 0, 0.3568628, 1, 1,
0.1632483, 1.569787, 0.7546112, 0, 0.3529412, 1, 1,
0.1687605, -0.8102806, 1.516918, 0, 0.345098, 1, 1,
0.1709885, -0.09529363, 2.533389, 0, 0.3411765, 1, 1,
0.1711331, -1.205081, 3.632738, 0, 0.3333333, 1, 1,
0.1756041, 1.840688, 1.137824, 0, 0.3294118, 1, 1,
0.1802181, 1.741971, 1.79272, 0, 0.3215686, 1, 1,
0.1842757, -1.365246, 2.532637, 0, 0.3176471, 1, 1,
0.1868458, -0.8025728, 2.399988, 0, 0.3098039, 1, 1,
0.1957438, -1.132204, 3.7813, 0, 0.3058824, 1, 1,
0.1975241, -0.5216255, 2.223469, 0, 0.2980392, 1, 1,
0.198898, 0.6705543, 0.6204529, 0, 0.2901961, 1, 1,
0.2006586, 1.771914, 0.5909607, 0, 0.2862745, 1, 1,
0.2061521, 2.009474, 0.2264033, 0, 0.2784314, 1, 1,
0.2116238, -1.504569, 3.401028, 0, 0.2745098, 1, 1,
0.2167176, 0.4555414, 0.2876508, 0, 0.2666667, 1, 1,
0.2174834, 0.8905088, 0.9690152, 0, 0.2627451, 1, 1,
0.2177938, -0.6367649, 2.871977, 0, 0.254902, 1, 1,
0.222644, 0.6684816, 0.01594456, 0, 0.2509804, 1, 1,
0.2262452, 0.2626927, -1.095355, 0, 0.2431373, 1, 1,
0.2274675, -0.3292952, 2.668817, 0, 0.2392157, 1, 1,
0.2279576, -1.585136, 5.030691, 0, 0.2313726, 1, 1,
0.2319262, -1.78981, 4.947796, 0, 0.227451, 1, 1,
0.2324204, 0.3529432, 1.958714, 0, 0.2196078, 1, 1,
0.2325297, -1.573664, 2.151396, 0, 0.2156863, 1, 1,
0.2344171, 0.9078589, 1.070839, 0, 0.2078431, 1, 1,
0.2356521, -0.2702649, 3.489017, 0, 0.2039216, 1, 1,
0.2412625, 0.5667525, -0.5684989, 0, 0.1960784, 1, 1,
0.2469119, -0.1095313, 2.094481, 0, 0.1882353, 1, 1,
0.2517513, -1.574048, 1.687317, 0, 0.1843137, 1, 1,
0.2548831, 1.423375, -0.4234601, 0, 0.1764706, 1, 1,
0.2567281, -0.1480362, 1.970695, 0, 0.172549, 1, 1,
0.2573729, -0.5039057, 3.540296, 0, 0.1647059, 1, 1,
0.2585635, -0.09442688, 1.685812, 0, 0.1607843, 1, 1,
0.2608669, -0.2967069, 2.7805, 0, 0.1529412, 1, 1,
0.2621026, -0.7670453, 3.868743, 0, 0.1490196, 1, 1,
0.2625529, -0.02955272, 1.831644, 0, 0.1411765, 1, 1,
0.2631334, 0.2730143, -0.6513314, 0, 0.1372549, 1, 1,
0.2692582, 0.4577938, 1.282064, 0, 0.1294118, 1, 1,
0.2694119, 0.2495819, 0.04300367, 0, 0.1254902, 1, 1,
0.2707013, 2.902556, -0.1885458, 0, 0.1176471, 1, 1,
0.2734334, -0.06019991, 0.9629893, 0, 0.1137255, 1, 1,
0.2757951, 0.2451642, 1.338704, 0, 0.1058824, 1, 1,
0.2801734, -0.9580219, 2.769048, 0, 0.09803922, 1, 1,
0.2894063, -0.02362566, 2.368258, 0, 0.09411765, 1, 1,
0.2900448, 0.19757, 2.84192, 0, 0.08627451, 1, 1,
0.2903867, 0.3135908, 1.858899, 0, 0.08235294, 1, 1,
0.2906123, -0.5852724, 5.090908, 0, 0.07450981, 1, 1,
0.2931581, 0.654336, 1.521886, 0, 0.07058824, 1, 1,
0.2955494, 0.6845726, -0.5719982, 0, 0.0627451, 1, 1,
0.2982301, 0.08625971, 1.837468, 0, 0.05882353, 1, 1,
0.3062309, 0.7936846, 1.151567, 0, 0.05098039, 1, 1,
0.3082369, 0.4909472, 1.564345, 0, 0.04705882, 1, 1,
0.3090607, -0.5430581, 2.327639, 0, 0.03921569, 1, 1,
0.3147129, 1.240242, 1.660949, 0, 0.03529412, 1, 1,
0.3156952, -0.1522662, 0.6723652, 0, 0.02745098, 1, 1,
0.316764, -0.005939672, 0.9641474, 0, 0.02352941, 1, 1,
0.3184275, 1.338721, -0.9178578, 0, 0.01568628, 1, 1,
0.3205818, -0.7812782, 1.503591, 0, 0.01176471, 1, 1,
0.3213508, 1.839675, 0.9808291, 0, 0.003921569, 1, 1,
0.3214846, 1.185284, 0.5211052, 0.003921569, 0, 1, 1,
0.3252321, 0.9718112, 0.5024616, 0.007843138, 0, 1, 1,
0.3265297, -1.373244, 1.994207, 0.01568628, 0, 1, 1,
0.3300987, -1.653937, 3.123798, 0.01960784, 0, 1, 1,
0.3325568, -0.790668, 4.700188, 0.02745098, 0, 1, 1,
0.3362667, 0.6622378, -1.023157, 0.03137255, 0, 1, 1,
0.3363695, -0.6038893, 3.042111, 0.03921569, 0, 1, 1,
0.3399189, 0.6868836, 2.227423, 0.04313726, 0, 1, 1,
0.3465562, -0.5040709, 1.950117, 0.05098039, 0, 1, 1,
0.3497989, -0.02222956, 1.518957, 0.05490196, 0, 1, 1,
0.3504463, -0.9921376, 3.578962, 0.0627451, 0, 1, 1,
0.3507575, 0.05309549, 2.950279, 0.06666667, 0, 1, 1,
0.3531725, -0.5256076, 3.455911, 0.07450981, 0, 1, 1,
0.3547334, 2.560303, -0.02485902, 0.07843138, 0, 1, 1,
0.3573649, 0.182951, -0.6771421, 0.08627451, 0, 1, 1,
0.3665767, 0.7206365, -2.041136, 0.09019608, 0, 1, 1,
0.3673153, -0.515874, 2.142557, 0.09803922, 0, 1, 1,
0.3692957, -0.2649165, 1.334623, 0.1058824, 0, 1, 1,
0.3739565, 0.1244109, -0.8970636, 0.1098039, 0, 1, 1,
0.3753654, 1.40193, -0.5604992, 0.1176471, 0, 1, 1,
0.3768708, 1.043672, -0.8934314, 0.1215686, 0, 1, 1,
0.3773427, 2.264479, -1.234085, 0.1294118, 0, 1, 1,
0.3853325, -0.7059159, 2.85115, 0.1333333, 0, 1, 1,
0.3893068, 1.160511, 0.4439601, 0.1411765, 0, 1, 1,
0.3909284, -0.8477606, 3.683775, 0.145098, 0, 1, 1,
0.3910071, 0.2468657, 0.5327763, 0.1529412, 0, 1, 1,
0.3917812, -1.077469, 3.840662, 0.1568628, 0, 1, 1,
0.3942817, -0.8470162, 1.423832, 0.1647059, 0, 1, 1,
0.3986155, 0.09800322, 1.868585, 0.1686275, 0, 1, 1,
0.4016571, 0.770244, 1.20601, 0.1764706, 0, 1, 1,
0.4054084, -0.651574, 2.980163, 0.1803922, 0, 1, 1,
0.41568, 1.205396, 1.742178, 0.1882353, 0, 1, 1,
0.4186405, 0.6409245, 0.6781723, 0.1921569, 0, 1, 1,
0.4194981, 0.4513473, 1.229907, 0.2, 0, 1, 1,
0.421343, -0.608488, 2.392161, 0.2078431, 0, 1, 1,
0.4217618, -0.8818496, 2.363324, 0.2117647, 0, 1, 1,
0.4289148, -1.56939, 3.194755, 0.2196078, 0, 1, 1,
0.4300729, -0.1128872, 0.5259547, 0.2235294, 0, 1, 1,
0.4332827, 1.092919, -0.6930149, 0.2313726, 0, 1, 1,
0.4371511, 0.4155079, 0.7807754, 0.2352941, 0, 1, 1,
0.4403277, -2.735537, 3.343902, 0.2431373, 0, 1, 1,
0.4424458, 0.200551, 2.753527, 0.2470588, 0, 1, 1,
0.4452004, -0.8784863, 2.82918, 0.254902, 0, 1, 1,
0.4464224, 0.1350357, 1.76298, 0.2588235, 0, 1, 1,
0.4547156, -1.032885, 3.602837, 0.2666667, 0, 1, 1,
0.4570306, -0.8996419, 1.156631, 0.2705882, 0, 1, 1,
0.4575646, 1.535628, 0.419887, 0.2784314, 0, 1, 1,
0.4592212, 0.2828942, 1.445006, 0.282353, 0, 1, 1,
0.4633509, -1.682804, 1.289665, 0.2901961, 0, 1, 1,
0.4646221, -0.1474885, 1.452924, 0.2941177, 0, 1, 1,
0.470353, 0.4956921, -1.353246, 0.3019608, 0, 1, 1,
0.4709617, -0.6118857, 0.5586447, 0.3098039, 0, 1, 1,
0.4755396, -1.250679, 3.308918, 0.3137255, 0, 1, 1,
0.4759519, -0.5462053, 2.062917, 0.3215686, 0, 1, 1,
0.4809055, 1.285042, 1.148932, 0.3254902, 0, 1, 1,
0.4835548, 1.598093, -0.1042495, 0.3333333, 0, 1, 1,
0.4869301, -2.223637, 4.206192, 0.3372549, 0, 1, 1,
0.487913, 0.8286189, 1.429572, 0.345098, 0, 1, 1,
0.488728, -0.1105135, 3.072634, 0.3490196, 0, 1, 1,
0.4933451, 0.1750002, 1.47754, 0.3568628, 0, 1, 1,
0.4968671, -1.313187, 2.745144, 0.3607843, 0, 1, 1,
0.4977523, 0.7572663, 0.3687534, 0.3686275, 0, 1, 1,
0.4983702, 0.5737394, -0.00121327, 0.372549, 0, 1, 1,
0.5156371, 0.7942278, 1.618906, 0.3803922, 0, 1, 1,
0.5174204, 1.519507, 0.1625884, 0.3843137, 0, 1, 1,
0.5191761, -0.5420644, 2.818463, 0.3921569, 0, 1, 1,
0.5202494, 1.079421, 1.451741, 0.3960784, 0, 1, 1,
0.5265633, 1.779108, -0.3682389, 0.4039216, 0, 1, 1,
0.5284297, -0.3599566, 4.341887, 0.4117647, 0, 1, 1,
0.5326052, 1.267937, -0.1044725, 0.4156863, 0, 1, 1,
0.5349652, -1.258578, 3.102062, 0.4235294, 0, 1, 1,
0.5357527, 0.108392, 3.149994, 0.427451, 0, 1, 1,
0.5400511, -0.9304016, -0.5979545, 0.4352941, 0, 1, 1,
0.5417347, 0.7092376, 0.3581536, 0.4392157, 0, 1, 1,
0.5472021, 0.9353209, 1.074686, 0.4470588, 0, 1, 1,
0.5498313, 0.6350135, 0.6095394, 0.4509804, 0, 1, 1,
0.5509864, 1.012767, 0.5946055, 0.4588235, 0, 1, 1,
0.5547151, -0.3088819, 2.85372, 0.4627451, 0, 1, 1,
0.5607032, 1.756938, 1.80813, 0.4705882, 0, 1, 1,
0.5615655, -0.5202164, 2.094923, 0.4745098, 0, 1, 1,
0.5626136, -0.1748523, 1.264317, 0.4823529, 0, 1, 1,
0.5633088, -0.1081444, 1.410231, 0.4862745, 0, 1, 1,
0.5666859, 0.5345724, -0.527729, 0.4941176, 0, 1, 1,
0.5667984, -0.908881, 1.358898, 0.5019608, 0, 1, 1,
0.5697243, 0.9244794, -0.1182868, 0.5058824, 0, 1, 1,
0.5716239, -0.1064979, 2.047557, 0.5137255, 0, 1, 1,
0.5721715, -0.7909639, 2.527574, 0.5176471, 0, 1, 1,
0.5739402, -1.536727, 2.262157, 0.5254902, 0, 1, 1,
0.575446, -0.4401206, 4.559486, 0.5294118, 0, 1, 1,
0.5786078, 1.49732, 0.6405842, 0.5372549, 0, 1, 1,
0.580373, -0.9903727, 2.376536, 0.5411765, 0, 1, 1,
0.5807602, -0.8457481, 1.951491, 0.5490196, 0, 1, 1,
0.5840759, 0.8371485, -0.7541324, 0.5529412, 0, 1, 1,
0.5904289, -0.3921954, 3.574828, 0.5607843, 0, 1, 1,
0.5904951, -0.2095633, 3.128003, 0.5647059, 0, 1, 1,
0.5924613, -1.115764, 3.456058, 0.572549, 0, 1, 1,
0.5946424, -0.8977984, 1.977918, 0.5764706, 0, 1, 1,
0.5956201, 0.1427467, 1.709157, 0.5843138, 0, 1, 1,
0.5965697, 0.135842, 1.537229, 0.5882353, 0, 1, 1,
0.596616, -1.735434, 1.553319, 0.5960785, 0, 1, 1,
0.5989619, 1.136157, 0.4047503, 0.6039216, 0, 1, 1,
0.6000175, -0.2351296, -0.7557129, 0.6078432, 0, 1, 1,
0.6027288, -0.5266998, 1.326502, 0.6156863, 0, 1, 1,
0.6029638, 1.599361, -0.03795699, 0.6196079, 0, 1, 1,
0.6049424, -0.4472224, 2.634257, 0.627451, 0, 1, 1,
0.6049756, -0.3885444, 2.751738, 0.6313726, 0, 1, 1,
0.6056933, 0.4895498, 1.045464, 0.6392157, 0, 1, 1,
0.606263, 2.496322, 2.380471, 0.6431373, 0, 1, 1,
0.6066352, -0.1248161, 2.09629, 0.6509804, 0, 1, 1,
0.6111999, -1.255283, 1.618696, 0.654902, 0, 1, 1,
0.6129308, 2.419962, 2.458185, 0.6627451, 0, 1, 1,
0.6147587, 1.081453, -1.250113, 0.6666667, 0, 1, 1,
0.6164399, 0.6119879, 1.684107, 0.6745098, 0, 1, 1,
0.620182, 0.5575523, 1.339207, 0.6784314, 0, 1, 1,
0.6220579, 0.2346447, 2.217184, 0.6862745, 0, 1, 1,
0.6221707, 0.07529087, 0.7901027, 0.6901961, 0, 1, 1,
0.6245204, 1.603264, -0.2847355, 0.6980392, 0, 1, 1,
0.6253406, 0.5834213, 0.6924006, 0.7058824, 0, 1, 1,
0.6261826, -0.5370936, 1.994528, 0.7098039, 0, 1, 1,
0.6271533, 0.434541, 1.483697, 0.7176471, 0, 1, 1,
0.6276657, 2.556106, -0.6377048, 0.7215686, 0, 1, 1,
0.6331434, 0.3207164, 3.210469, 0.7294118, 0, 1, 1,
0.635228, -1.047342, 3.279426, 0.7333333, 0, 1, 1,
0.6368701, 0.02127063, 1.959788, 0.7411765, 0, 1, 1,
0.6376191, -0.7205198, 2.853058, 0.7450981, 0, 1, 1,
0.6446955, -0.7806464, 1.930821, 0.7529412, 0, 1, 1,
0.6477504, 0.4329419, 1.445281, 0.7568628, 0, 1, 1,
0.6546739, 1.017137, 1.713676, 0.7647059, 0, 1, 1,
0.6581644, -1.079996, 3.35562, 0.7686275, 0, 1, 1,
0.6619515, -0.1079731, 2.269096, 0.7764706, 0, 1, 1,
0.66305, 1.057943, 1.030098, 0.7803922, 0, 1, 1,
0.6648349, 0.6882387, 1.062076, 0.7882353, 0, 1, 1,
0.6652836, -0.4362168, 2.654504, 0.7921569, 0, 1, 1,
0.6671041, 0.7597082, 2.849644, 0.8, 0, 1, 1,
0.6673887, 2.211515, 1.356361, 0.8078431, 0, 1, 1,
0.6750758, 2.326697, 0.6186661, 0.8117647, 0, 1, 1,
0.6751795, -0.1197427, 3.007851, 0.8196079, 0, 1, 1,
0.6780131, 0.6914693, -0.2189652, 0.8235294, 0, 1, 1,
0.6823324, 1.203098, 0.7688763, 0.8313726, 0, 1, 1,
0.6850886, -0.82456, 1.698128, 0.8352941, 0, 1, 1,
0.6857939, 2.067424, -1.200301, 0.8431373, 0, 1, 1,
0.6872128, -0.05599791, 0.4723773, 0.8470588, 0, 1, 1,
0.6874748, -0.4104628, 2.285383, 0.854902, 0, 1, 1,
0.6964188, -0.4729677, 1.657703, 0.8588235, 0, 1, 1,
0.7012993, 1.221777, 0.8889828, 0.8666667, 0, 1, 1,
0.7053552, -1.691527, 2.58647, 0.8705882, 0, 1, 1,
0.7070878, 1.590005, 0.5670306, 0.8784314, 0, 1, 1,
0.7151411, 0.177555, 1.033, 0.8823529, 0, 1, 1,
0.7199382, 0.95311, 0.3818966, 0.8901961, 0, 1, 1,
0.7213841, 0.3370359, 1.410055, 0.8941177, 0, 1, 1,
0.7479038, -2.206748, 2.038702, 0.9019608, 0, 1, 1,
0.7508666, -0.2089053, 1.544339, 0.9098039, 0, 1, 1,
0.7533803, 0.5016217, -0.2282543, 0.9137255, 0, 1, 1,
0.7539781, 0.03481924, 2.861405, 0.9215686, 0, 1, 1,
0.7561444, -0.5660448, 0.8778308, 0.9254902, 0, 1, 1,
0.7569464, 0.1393212, 1.859453, 0.9333333, 0, 1, 1,
0.7594646, -0.2577045, 1.720849, 0.9372549, 0, 1, 1,
0.7669973, 1.837316, -0.107763, 0.945098, 0, 1, 1,
0.7705728, -0.0584635, 1.152676, 0.9490196, 0, 1, 1,
0.7758706, 0.03937511, 3.497263, 0.9568627, 0, 1, 1,
0.7813684, 0.1287398, 1.655628, 0.9607843, 0, 1, 1,
0.7821004, -0.3904043, 1.518633, 0.9686275, 0, 1, 1,
0.7827992, 0.1939604, 1.239034, 0.972549, 0, 1, 1,
0.783237, 0.1905107, 2.080183, 0.9803922, 0, 1, 1,
0.7860123, -1.004486, 0.5321451, 0.9843137, 0, 1, 1,
0.8019593, 0.1548567, -0.5147918, 0.9921569, 0, 1, 1,
0.8030637, -0.6451496, -0.2730452, 0.9960784, 0, 1, 1,
0.8040909, -0.9697574, 2.38513, 1, 0, 0.9960784, 1,
0.8046499, 0.3486966, 0.1175095, 1, 0, 0.9882353, 1,
0.8068924, 0.9483179, 1.556346, 1, 0, 0.9843137, 1,
0.8125002, -0.3858159, 1.967212, 1, 0, 0.9764706, 1,
0.8206515, -0.03924114, 1.970263, 1, 0, 0.972549, 1,
0.8235665, 1.604513, 0.2339101, 1, 0, 0.9647059, 1,
0.8278413, -1.103667, 1.694966, 1, 0, 0.9607843, 1,
0.83171, 0.3758049, 1.770506, 1, 0, 0.9529412, 1,
0.83881, 0.1705695, -0.5927097, 1, 0, 0.9490196, 1,
0.8397186, -1.602988, 2.637666, 1, 0, 0.9411765, 1,
0.8401735, -0.7189736, 2.987535, 1, 0, 0.9372549, 1,
0.8477029, -0.005468183, 2.882161, 1, 0, 0.9294118, 1,
0.8521938, 0.5735038, -0.0414632, 1, 0, 0.9254902, 1,
0.8535228, 1.644511, 1.963897, 1, 0, 0.9176471, 1,
0.8561758, 1.761963, 0.8660008, 1, 0, 0.9137255, 1,
0.8595817, 0.277959, 0.3826928, 1, 0, 0.9058824, 1,
0.8607424, 0.2744225, 1.167824, 1, 0, 0.9019608, 1,
0.8635359, 0.5416403, 1.051438, 1, 0, 0.8941177, 1,
0.8690137, 0.6427223, -0.4943609, 1, 0, 0.8862745, 1,
0.8776888, 0.09265472, 2.280176, 1, 0, 0.8823529, 1,
0.8875975, 1.541725, -0.4495704, 1, 0, 0.8745098, 1,
0.8938831, -0.5302643, 1.3341, 1, 0, 0.8705882, 1,
0.8942388, 0.7460271, 0.5417575, 1, 0, 0.8627451, 1,
0.8945611, 0.5971702, 2.220557, 1, 0, 0.8588235, 1,
0.9018227, 0.2321713, 2.305014, 1, 0, 0.8509804, 1,
0.902418, -1.082628, 2.622924, 1, 0, 0.8470588, 1,
0.9033514, -0.4168675, 3.546272, 1, 0, 0.8392157, 1,
0.9073769, -0.6503959, 2.821317, 1, 0, 0.8352941, 1,
0.9075404, -0.5873584, 0.585878, 1, 0, 0.827451, 1,
0.9106336, -1.185112, 2.201678, 1, 0, 0.8235294, 1,
0.911555, 0.3867966, 2.633535, 1, 0, 0.8156863, 1,
0.9126485, 1.822075, 1.091451, 1, 0, 0.8117647, 1,
0.9172776, 0.4054726, 0.4981474, 1, 0, 0.8039216, 1,
0.9182062, -1.110786, 3.358191, 1, 0, 0.7960784, 1,
0.9341555, 0.3147912, 1.090094, 1, 0, 0.7921569, 1,
0.9425035, -0.09715822, 2.524878, 1, 0, 0.7843137, 1,
0.9426132, 1.894685, 0.1950473, 1, 0, 0.7803922, 1,
0.9431216, 2.088231, -1.650366, 1, 0, 0.772549, 1,
0.9467331, 0.05808695, 1.423726, 1, 0, 0.7686275, 1,
0.9527552, 1.495382, 1.134617, 1, 0, 0.7607843, 1,
0.9559641, -0.1863602, 2.98817, 1, 0, 0.7568628, 1,
0.9576644, 0.5447326, 1.690752, 1, 0, 0.7490196, 1,
0.9670916, 0.8183947, 0.7544891, 1, 0, 0.7450981, 1,
0.9773172, -0.7364749, 1.532509, 1, 0, 0.7372549, 1,
0.979068, -1.473773, 2.375101, 1, 0, 0.7333333, 1,
0.9992639, 1.437229, -0.2874598, 1, 0, 0.7254902, 1,
1.000489, -0.7800719, 1.738251, 1, 0, 0.7215686, 1,
1.01391, -1.126096, 4.099647, 1, 0, 0.7137255, 1,
1.016268, -0.9200398, 2.242811, 1, 0, 0.7098039, 1,
1.018758, 0.8650321, 1.243894, 1, 0, 0.7019608, 1,
1.019542, -2.01645, 3.803056, 1, 0, 0.6941177, 1,
1.027315, 0.3692419, 2.264874, 1, 0, 0.6901961, 1,
1.031713, 1.46103, 1.526444, 1, 0, 0.682353, 1,
1.031845, -0.4255712, 0.440612, 1, 0, 0.6784314, 1,
1.037045, -1.025252, 2.383521, 1, 0, 0.6705883, 1,
1.040654, -0.9160135, 1.80272, 1, 0, 0.6666667, 1,
1.043295, -1.70826, 3.113725, 1, 0, 0.6588235, 1,
1.045243, 0.1681263, 3.044447, 1, 0, 0.654902, 1,
1.058826, -0.8455689, 1.027919, 1, 0, 0.6470588, 1,
1.061313, 0.881986, -0.5021266, 1, 0, 0.6431373, 1,
1.064721, 0.653157, 0.4459389, 1, 0, 0.6352941, 1,
1.072564, 0.3022073, 3.017868, 1, 0, 0.6313726, 1,
1.081181, 1.208444, -1.103033, 1, 0, 0.6235294, 1,
1.092497, -1.306753, 1.706375, 1, 0, 0.6196079, 1,
1.109413, -0.1541184, 2.107921, 1, 0, 0.6117647, 1,
1.112112, -0.8901471, 1.638016, 1, 0, 0.6078432, 1,
1.126527, 0.7644105, 0.6329473, 1, 0, 0.6, 1,
1.127562, 1.140522, 0.4829716, 1, 0, 0.5921569, 1,
1.132632, -1.163747, 1.795155, 1, 0, 0.5882353, 1,
1.133309, 1.647709, 1.216017, 1, 0, 0.5803922, 1,
1.135785, 1.429823, 0.6572415, 1, 0, 0.5764706, 1,
1.138399, -0.607972, 2.573208, 1, 0, 0.5686275, 1,
1.138669, 0.09928777, 0.8654407, 1, 0, 0.5647059, 1,
1.142575, -0.7243595, 1.619561, 1, 0, 0.5568628, 1,
1.149678, 0.3660199, 0.7116631, 1, 0, 0.5529412, 1,
1.154646, 0.9152567, 2.725177, 1, 0, 0.5450981, 1,
1.15775, -2.292432, 2.113175, 1, 0, 0.5411765, 1,
1.161, -2.242632, 1.510586, 1, 0, 0.5333334, 1,
1.162875, 0.4546241, 1.255941, 1, 0, 0.5294118, 1,
1.166239, 0.3813075, 0.7169006, 1, 0, 0.5215687, 1,
1.170032, 1.531308, 0.1255725, 1, 0, 0.5176471, 1,
1.181706, -0.01337897, 1.067451, 1, 0, 0.509804, 1,
1.182624, 0.7696474, 2.922683, 1, 0, 0.5058824, 1,
1.199785, -1.855138, 2.002017, 1, 0, 0.4980392, 1,
1.205716, 0.4106402, 2.047987, 1, 0, 0.4901961, 1,
1.218294, -0.1490323, -0.04871053, 1, 0, 0.4862745, 1,
1.224874, -0.5325755, 1.439191, 1, 0, 0.4784314, 1,
1.229285, 0.5021867, 0.6852845, 1, 0, 0.4745098, 1,
1.233561, -0.901607, 2.929316, 1, 0, 0.4666667, 1,
1.251177, 0.07230471, 2.507046, 1, 0, 0.4627451, 1,
1.251458, 1.336557, 0.2879699, 1, 0, 0.454902, 1,
1.274697, 0.5992739, 0.8488435, 1, 0, 0.4509804, 1,
1.277339, 0.2805372, 2.983337, 1, 0, 0.4431373, 1,
1.278853, -0.675828, 1.139336, 1, 0, 0.4392157, 1,
1.280537, -1.301025, 1.88316, 1, 0, 0.4313726, 1,
1.284192, -0.3530354, 1.358948, 1, 0, 0.427451, 1,
1.287483, -0.8538967, 1.014596, 1, 0, 0.4196078, 1,
1.300083, 0.5713701, 1.665595, 1, 0, 0.4156863, 1,
1.303179, -0.06146996, 1.0241, 1, 0, 0.4078431, 1,
1.31542, -0.6719554, 3.581618, 1, 0, 0.4039216, 1,
1.344199, 0.1262848, 1.32034, 1, 0, 0.3960784, 1,
1.34618, 1.795903, 1.248286, 1, 0, 0.3882353, 1,
1.358844, -0.8202838, 2.808532, 1, 0, 0.3843137, 1,
1.359099, 0.7664091, 0.7923009, 1, 0, 0.3764706, 1,
1.363659, -2.124055, 3.129691, 1, 0, 0.372549, 1,
1.40563, -1.15892, 3.120655, 1, 0, 0.3647059, 1,
1.406151, -1.413706, 2.993999, 1, 0, 0.3607843, 1,
1.413996, 0.1130891, 2.129419, 1, 0, 0.3529412, 1,
1.415328, 0.2378787, 1.282562, 1, 0, 0.3490196, 1,
1.42285, 1.716654, -0.3357486, 1, 0, 0.3411765, 1,
1.435572, 1.047089, 0.7301512, 1, 0, 0.3372549, 1,
1.43644, -0.6657407, 0.8773248, 1, 0, 0.3294118, 1,
1.444543, 1.38337, 2.064454, 1, 0, 0.3254902, 1,
1.455638, 1.36491, 0.4548552, 1, 0, 0.3176471, 1,
1.457272, -1.334742, 2.580036, 1, 0, 0.3137255, 1,
1.465357, -1.80506, 5.011698, 1, 0, 0.3058824, 1,
1.477457, -1.010404, 1.752025, 1, 0, 0.2980392, 1,
1.483486, -0.5540074, 2.153677, 1, 0, 0.2941177, 1,
1.506173, -0.3642147, 1.110273, 1, 0, 0.2862745, 1,
1.526932, -0.08148561, 0.1998697, 1, 0, 0.282353, 1,
1.543256, 1.162305, 1.907642, 1, 0, 0.2745098, 1,
1.551324, -0.2158645, 1.003275, 1, 0, 0.2705882, 1,
1.555679, -0.1672262, 0.843941, 1, 0, 0.2627451, 1,
1.562574, 1.136812, 0.6380395, 1, 0, 0.2588235, 1,
1.576116, 0.7141513, 1.253667, 1, 0, 0.2509804, 1,
1.590501, 1.322045, 0.9761432, 1, 0, 0.2470588, 1,
1.620193, 1.760485, 1.080453, 1, 0, 0.2392157, 1,
1.622618, 0.6667812, 0.05321979, 1, 0, 0.2352941, 1,
1.627798, -0.6779305, 1.750926, 1, 0, 0.227451, 1,
1.641994, 0.7014339, 0.4826531, 1, 0, 0.2235294, 1,
1.644802, -0.8870537, 2.497563, 1, 0, 0.2156863, 1,
1.654626, 0.7515905, 1.635017, 1, 0, 0.2117647, 1,
1.660043, -1.964226, 1.833338, 1, 0, 0.2039216, 1,
1.660749, -0.2535738, 1.975391, 1, 0, 0.1960784, 1,
1.667509, -0.7779526, 4.218061, 1, 0, 0.1921569, 1,
1.671346, 0.5941339, 1.593501, 1, 0, 0.1843137, 1,
1.680355, -0.1091644, 2.321155, 1, 0, 0.1803922, 1,
1.700838, -1.917655, 2.891233, 1, 0, 0.172549, 1,
1.730419, 0.3454911, 0.9681077, 1, 0, 0.1686275, 1,
1.741354, 0.5978296, 1.295531, 1, 0, 0.1607843, 1,
1.752127, 0.1196405, 2.445092, 1, 0, 0.1568628, 1,
1.808252, 1.426235, 2.662583, 1, 0, 0.1490196, 1,
1.835886, -0.4631229, 1.70244, 1, 0, 0.145098, 1,
1.836611, 0.6350346, 1.583028, 1, 0, 0.1372549, 1,
1.849383, 1.696597, 1.924252, 1, 0, 0.1333333, 1,
1.897272, -0.6070755, 3.402524, 1, 0, 0.1254902, 1,
1.940634, 1.074203, 1.288241, 1, 0, 0.1215686, 1,
1.943722, -0.3739094, 2.505421, 1, 0, 0.1137255, 1,
1.949751, 0.2483792, 3.035781, 1, 0, 0.1098039, 1,
1.964831, -1.272224, 1.89795, 1, 0, 0.1019608, 1,
2.000337, -0.5722395, 2.120726, 1, 0, 0.09411765, 1,
2.008124, -0.2880791, 2.012844, 1, 0, 0.09019608, 1,
2.055336, 0.7687307, 1.390285, 1, 0, 0.08235294, 1,
2.252222, -0.1268862, 1.004546, 1, 0, 0.07843138, 1,
2.295299, 0.1627539, 1.900239, 1, 0, 0.07058824, 1,
2.315193, 0.756695, -0.322073, 1, 0, 0.06666667, 1,
2.336764, 0.6109298, 0.21283, 1, 0, 0.05882353, 1,
2.39894, 0.8129205, 0.1651727, 1, 0, 0.05490196, 1,
2.415685, -1.523868, 2.080059, 1, 0, 0.04705882, 1,
2.43043, -0.9015977, 1.935775, 1, 0, 0.04313726, 1,
2.504249, 1.41703, -0.6981642, 1, 0, 0.03529412, 1,
2.574666, 0.2150944, -0.8587199, 1, 0, 0.03137255, 1,
2.655864, 0.3792569, 1.114543, 1, 0, 0.02352941, 1,
2.667492, 0.8599099, 1.752273, 1, 0, 0.01960784, 1,
2.678134, -1.797149, 1.167196, 1, 0, 0.01176471, 1,
2.709152, 1.697514, 1.024243, 1, 0, 0.007843138, 1
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
-0.3194102, -4.77127, -7.444369, 0, -0.5, 0.5, 0.5,
-0.3194102, -4.77127, -7.444369, 1, -0.5, 0.5, 0.5,
-0.3194102, -4.77127, -7.444369, 1, 1.5, 0.5, 0.5,
-0.3194102, -4.77127, -7.444369, 0, 1.5, 0.5, 0.5
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
-4.374654, -0.3782585, -7.444369, 0, -0.5, 0.5, 0.5,
-4.374654, -0.3782585, -7.444369, 1, -0.5, 0.5, 0.5,
-4.374654, -0.3782585, -7.444369, 1, 1.5, 0.5, 0.5,
-4.374654, -0.3782585, -7.444369, 0, 1.5, 0.5, 0.5
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
-4.374654, -4.77127, -0.2683384, 0, -0.5, 0.5, 0.5,
-4.374654, -4.77127, -0.2683384, 1, -0.5, 0.5, 0.5,
-4.374654, -4.77127, -0.2683384, 1, 1.5, 0.5, 0.5,
-4.374654, -4.77127, -0.2683384, 0, 1.5, 0.5, 0.5
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
-3, -3.757498, -5.788362,
2, -3.757498, -5.788362,
-3, -3.757498, -5.788362,
-3, -3.92646, -6.064363,
-2, -3.757498, -5.788362,
-2, -3.92646, -6.064363,
-1, -3.757498, -5.788362,
-1, -3.92646, -6.064363,
0, -3.757498, -5.788362,
0, -3.92646, -6.064363,
1, -3.757498, -5.788362,
1, -3.92646, -6.064363,
2, -3.757498, -5.788362,
2, -3.92646, -6.064363
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
-3, -4.264384, -6.616365, 0, -0.5, 0.5, 0.5,
-3, -4.264384, -6.616365, 1, -0.5, 0.5, 0.5,
-3, -4.264384, -6.616365, 1, 1.5, 0.5, 0.5,
-3, -4.264384, -6.616365, 0, 1.5, 0.5, 0.5,
-2, -4.264384, -6.616365, 0, -0.5, 0.5, 0.5,
-2, -4.264384, -6.616365, 1, -0.5, 0.5, 0.5,
-2, -4.264384, -6.616365, 1, 1.5, 0.5, 0.5,
-2, -4.264384, -6.616365, 0, 1.5, 0.5, 0.5,
-1, -4.264384, -6.616365, 0, -0.5, 0.5, 0.5,
-1, -4.264384, -6.616365, 1, -0.5, 0.5, 0.5,
-1, -4.264384, -6.616365, 1, 1.5, 0.5, 0.5,
-1, -4.264384, -6.616365, 0, 1.5, 0.5, 0.5,
0, -4.264384, -6.616365, 0, -0.5, 0.5, 0.5,
0, -4.264384, -6.616365, 1, -0.5, 0.5, 0.5,
0, -4.264384, -6.616365, 1, 1.5, 0.5, 0.5,
0, -4.264384, -6.616365, 0, 1.5, 0.5, 0.5,
1, -4.264384, -6.616365, 0, -0.5, 0.5, 0.5,
1, -4.264384, -6.616365, 1, -0.5, 0.5, 0.5,
1, -4.264384, -6.616365, 1, 1.5, 0.5, 0.5,
1, -4.264384, -6.616365, 0, 1.5, 0.5, 0.5,
2, -4.264384, -6.616365, 0, -0.5, 0.5, 0.5,
2, -4.264384, -6.616365, 1, -0.5, 0.5, 0.5,
2, -4.264384, -6.616365, 1, 1.5, 0.5, 0.5,
2, -4.264384, -6.616365, 0, 1.5, 0.5, 0.5
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
-3.438829, -3, -5.788362,
-3.438829, 2, -5.788362,
-3.438829, -3, -5.788362,
-3.5948, -3, -6.064363,
-3.438829, -2, -5.788362,
-3.5948, -2, -6.064363,
-3.438829, -1, -5.788362,
-3.5948, -1, -6.064363,
-3.438829, 0, -5.788362,
-3.5948, 0, -6.064363,
-3.438829, 1, -5.788362,
-3.5948, 1, -6.064363,
-3.438829, 2, -5.788362,
-3.5948, 2, -6.064363
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
-3.906742, -3, -6.616365, 0, -0.5, 0.5, 0.5,
-3.906742, -3, -6.616365, 1, -0.5, 0.5, 0.5,
-3.906742, -3, -6.616365, 1, 1.5, 0.5, 0.5,
-3.906742, -3, -6.616365, 0, 1.5, 0.5, 0.5,
-3.906742, -2, -6.616365, 0, -0.5, 0.5, 0.5,
-3.906742, -2, -6.616365, 1, -0.5, 0.5, 0.5,
-3.906742, -2, -6.616365, 1, 1.5, 0.5, 0.5,
-3.906742, -2, -6.616365, 0, 1.5, 0.5, 0.5,
-3.906742, -1, -6.616365, 0, -0.5, 0.5, 0.5,
-3.906742, -1, -6.616365, 1, -0.5, 0.5, 0.5,
-3.906742, -1, -6.616365, 1, 1.5, 0.5, 0.5,
-3.906742, -1, -6.616365, 0, 1.5, 0.5, 0.5,
-3.906742, 0, -6.616365, 0, -0.5, 0.5, 0.5,
-3.906742, 0, -6.616365, 1, -0.5, 0.5, 0.5,
-3.906742, 0, -6.616365, 1, 1.5, 0.5, 0.5,
-3.906742, 0, -6.616365, 0, 1.5, 0.5, 0.5,
-3.906742, 1, -6.616365, 0, -0.5, 0.5, 0.5,
-3.906742, 1, -6.616365, 1, -0.5, 0.5, 0.5,
-3.906742, 1, -6.616365, 1, 1.5, 0.5, 0.5,
-3.906742, 1, -6.616365, 0, 1.5, 0.5, 0.5,
-3.906742, 2, -6.616365, 0, -0.5, 0.5, 0.5,
-3.906742, 2, -6.616365, 1, -0.5, 0.5, 0.5,
-3.906742, 2, -6.616365, 1, 1.5, 0.5, 0.5,
-3.906742, 2, -6.616365, 0, 1.5, 0.5, 0.5
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
-3.438829, -3.757498, -4,
-3.438829, -3.757498, 4,
-3.438829, -3.757498, -4,
-3.5948, -3.92646, -4,
-3.438829, -3.757498, -2,
-3.5948, -3.92646, -2,
-3.438829, -3.757498, 0,
-3.5948, -3.92646, 0,
-3.438829, -3.757498, 2,
-3.5948, -3.92646, 2,
-3.438829, -3.757498, 4,
-3.5948, -3.92646, 4
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
-3.906742, -4.264384, -4, 0, -0.5, 0.5, 0.5,
-3.906742, -4.264384, -4, 1, -0.5, 0.5, 0.5,
-3.906742, -4.264384, -4, 1, 1.5, 0.5, 0.5,
-3.906742, -4.264384, -4, 0, 1.5, 0.5, 0.5,
-3.906742, -4.264384, -2, 0, -0.5, 0.5, 0.5,
-3.906742, -4.264384, -2, 1, -0.5, 0.5, 0.5,
-3.906742, -4.264384, -2, 1, 1.5, 0.5, 0.5,
-3.906742, -4.264384, -2, 0, 1.5, 0.5, 0.5,
-3.906742, -4.264384, 0, 0, -0.5, 0.5, 0.5,
-3.906742, -4.264384, 0, 1, -0.5, 0.5, 0.5,
-3.906742, -4.264384, 0, 1, 1.5, 0.5, 0.5,
-3.906742, -4.264384, 0, 0, 1.5, 0.5, 0.5,
-3.906742, -4.264384, 2, 0, -0.5, 0.5, 0.5,
-3.906742, -4.264384, 2, 1, -0.5, 0.5, 0.5,
-3.906742, -4.264384, 2, 1, 1.5, 0.5, 0.5,
-3.906742, -4.264384, 2, 0, 1.5, 0.5, 0.5,
-3.906742, -4.264384, 4, 0, -0.5, 0.5, 0.5,
-3.906742, -4.264384, 4, 1, -0.5, 0.5, 0.5,
-3.906742, -4.264384, 4, 1, 1.5, 0.5, 0.5,
-3.906742, -4.264384, 4, 0, 1.5, 0.5, 0.5
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
-3.438829, -3.757498, -5.788362,
-3.438829, 3.000981, -5.788362,
-3.438829, -3.757498, 5.251685,
-3.438829, 3.000981, 5.251685,
-3.438829, -3.757498, -5.788362,
-3.438829, -3.757498, 5.251685,
-3.438829, 3.000981, -5.788362,
-3.438829, 3.000981, 5.251685,
-3.438829, -3.757498, -5.788362,
2.800008, -3.757498, -5.788362,
-3.438829, -3.757498, 5.251685,
2.800008, -3.757498, 5.251685,
-3.438829, 3.000981, -5.788362,
2.800008, 3.000981, -5.788362,
-3.438829, 3.000981, 5.251685,
2.800008, 3.000981, 5.251685,
2.800008, -3.757498, -5.788362,
2.800008, 3.000981, -5.788362,
2.800008, -3.757498, 5.251685,
2.800008, 3.000981, 5.251685,
2.800008, -3.757498, -5.788362,
2.800008, -3.757498, 5.251685,
2.800008, 3.000981, -5.788362,
2.800008, 3.000981, 5.251685
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
var radius = 7.673038;
var distance = 34.13821;
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
mvMatrix.translate( 0.3194102, 0.3782585, 0.2683384 );
mvMatrix.scale( 1.329773, 1.227531, 0.7514678 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.13821);
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
Hepta<-read.table("Hepta.xyz", skip=1)
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
-3.347972, 0.138939, -1.78777, 0, 0, 1, 1, 1,
-3.269683, 0.0416652, -0.3445774, 1, 0, 0, 1, 1,
-2.991832, 1.035871, -0.6324745, 1, 0, 0, 1, 1,
-2.931148, -1.212753, -2.590086, 1, 0, 0, 1, 1,
-2.918777, 0.9071302, -1.269828, 1, 0, 0, 1, 1,
-2.905649, 0.6192944, -1.55827, 1, 0, 0, 1, 1,
-2.770723, -1.237196, -2.518486, 0, 0, 0, 1, 1,
-2.742558, -0.5430561, -2.066511, 0, 0, 0, 1, 1,
-2.601926, -1.518154, -1.105311, 0, 0, 0, 1, 1,
-2.599252, -1.232206, -2.81421, 0, 0, 0, 1, 1,
-2.504544, -0.3745342, -2.331949, 0, 0, 0, 1, 1,
-2.459909, -0.1793195, -1.472035, 0, 0, 0, 1, 1,
-2.390234, 0.7736446, -1.053558, 0, 0, 0, 1, 1,
-2.360336, -0.3716667, -2.165334, 1, 1, 1, 1, 1,
-2.313902, 0.5624591, -0.8758588, 1, 1, 1, 1, 1,
-2.264053, -1.758934, -0.3898716, 1, 1, 1, 1, 1,
-2.262054, 1.287974, -1.008563, 1, 1, 1, 1, 1,
-2.258371, -0.6090435, -1.702953, 1, 1, 1, 1, 1,
-2.235607, -1.421042, -0.9829994, 1, 1, 1, 1, 1,
-2.220128, -0.4667316, -2.963472, 1, 1, 1, 1, 1,
-2.213174, -0.3397844, -2.594356, 1, 1, 1, 1, 1,
-2.16575, -0.04014988, -0.9083905, 1, 1, 1, 1, 1,
-2.165183, -0.8579966, -1.265765, 1, 1, 1, 1, 1,
-2.141361, -0.6405472, -1.433932, 1, 1, 1, 1, 1,
-2.082989, 0.003192933, -2.056831, 1, 1, 1, 1, 1,
-2.066495, -0.9841061, -2.110415, 1, 1, 1, 1, 1,
-2.063324, 1.58666, -1.399198, 1, 1, 1, 1, 1,
-2.056726, -0.289215, -0.4238542, 1, 1, 1, 1, 1,
-2.02898, -1.233213, -4.048302, 0, 0, 1, 1, 1,
-2.021104, 1.703318, -0.5056375, 1, 0, 0, 1, 1,
-2.016986, -0.6794227, -1.661311, 1, 0, 0, 1, 1,
-2.00808, -0.6307575, -1.447351, 1, 0, 0, 1, 1,
-1.998137, 0.5102113, -1.032309, 1, 0, 0, 1, 1,
-1.93924, 1.26142, -0.6020749, 1, 0, 0, 1, 1,
-1.931195, 0.1927132, -0.3157765, 0, 0, 0, 1, 1,
-1.923592, -1.244101, 0.6859508, 0, 0, 0, 1, 1,
-1.910399, 0.7041315, -0.6818057, 0, 0, 0, 1, 1,
-1.904177, -0.6543912, -1.863072, 0, 0, 0, 1, 1,
-1.899439, 0.6998599, -1.836647, 0, 0, 0, 1, 1,
-1.866188, -0.07246488, -0.4816709, 0, 0, 0, 1, 1,
-1.844311, 0.3516548, -1.225365, 0, 0, 0, 1, 1,
-1.825959, -1.548221, -2.030735, 1, 1, 1, 1, 1,
-1.818619, -1.110826, -1.316629, 1, 1, 1, 1, 1,
-1.818565, -0.5619882, -1.467755, 1, 1, 1, 1, 1,
-1.816309, 0.6091985, -2.383339, 1, 1, 1, 1, 1,
-1.811373, 0.7402771, -1.755967, 1, 1, 1, 1, 1,
-1.786509, 0.008397796, -1.943845, 1, 1, 1, 1, 1,
-1.767789, 0.08344427, -2.581273, 1, 1, 1, 1, 1,
-1.763284, -0.3716259, -3.997705, 1, 1, 1, 1, 1,
-1.753292, 0.2967649, -1.698492, 1, 1, 1, 1, 1,
-1.741309, 0.04186017, -2.231556, 1, 1, 1, 1, 1,
-1.737919, 1.334262, -1.341088, 1, 1, 1, 1, 1,
-1.733964, 1.145415, -0.5628672, 1, 1, 1, 1, 1,
-1.726927, -1.72705, -1.659605, 1, 1, 1, 1, 1,
-1.726142, 1.433163, 0.3114787, 1, 1, 1, 1, 1,
-1.723757, 1.342317, -0.9772384, 1, 1, 1, 1, 1,
-1.721921, 1.364468, 1.512327, 0, 0, 1, 1, 1,
-1.703642, 0.6697055, -0.6444921, 1, 0, 0, 1, 1,
-1.703032, 0.9227449, -1.682436, 1, 0, 0, 1, 1,
-1.69409, -0.07454833, -0.4109311, 1, 0, 0, 1, 1,
-1.672747, -1.504989, -2.880718, 1, 0, 0, 1, 1,
-1.642175, 0.1159988, -1.615707, 1, 0, 0, 1, 1,
-1.621155, 0.1286461, -2.491653, 0, 0, 0, 1, 1,
-1.617298, -1.551129, -3.901426, 0, 0, 0, 1, 1,
-1.580955, 0.001791282, 0.6279357, 0, 0, 0, 1, 1,
-1.577821, -1.370637, -2.753122, 0, 0, 0, 1, 1,
-1.573313, 1.242905, -0.05802203, 0, 0, 0, 1, 1,
-1.560717, -0.2015916, -1.224066, 0, 0, 0, 1, 1,
-1.55009, 0.5186825, 0.08580472, 0, 0, 0, 1, 1,
-1.549748, 0.09976738, -1.776209, 1, 1, 1, 1, 1,
-1.545043, -1.364871, -1.103786, 1, 1, 1, 1, 1,
-1.542323, 1.55321, -0.515821, 1, 1, 1, 1, 1,
-1.533267, -2.431175, -2.424039, 1, 1, 1, 1, 1,
-1.533251, 0.988196, -2.589656, 1, 1, 1, 1, 1,
-1.531137, 0.08150176, -2.221184, 1, 1, 1, 1, 1,
-1.525555, -0.0366813, -1.217584, 1, 1, 1, 1, 1,
-1.521193, -0.02211784, -2.673683, 1, 1, 1, 1, 1,
-1.516552, -0.4812202, -3.248833, 1, 1, 1, 1, 1,
-1.503516, -0.9256759, -1.689223, 1, 1, 1, 1, 1,
-1.489695, 0.2858588, -2.57433, 1, 1, 1, 1, 1,
-1.485551, 0.3359782, -0.5057805, 1, 1, 1, 1, 1,
-1.484416, 0.06118957, -1.032345, 1, 1, 1, 1, 1,
-1.48258, -0.6043697, -2.050224, 1, 1, 1, 1, 1,
-1.476298, -0.9665936, -0.507261, 1, 1, 1, 1, 1,
-1.475689, -0.0333626, -1.640328, 0, 0, 1, 1, 1,
-1.460023, -1.49573, -2.425978, 1, 0, 0, 1, 1,
-1.446544, 0.4776354, 0.5231428, 1, 0, 0, 1, 1,
-1.446351, 0.4198721, -1.152779, 1, 0, 0, 1, 1,
-1.445728, 1.712781, -1.151807, 1, 0, 0, 1, 1,
-1.443555, 1.429739, 0.6636299, 1, 0, 0, 1, 1,
-1.437837, -1.052454, -2.156016, 0, 0, 0, 1, 1,
-1.435335, -1.068766, -0.886178, 0, 0, 0, 1, 1,
-1.433519, 1.059375, -0.3941033, 0, 0, 0, 1, 1,
-1.419556, -0.2317295, -0.1172296, 0, 0, 0, 1, 1,
-1.419197, 0.3301527, 1.154449, 0, 0, 0, 1, 1,
-1.408578, -1.633668, -2.147676, 0, 0, 0, 1, 1,
-1.405793, 1.032528, -1.986087, 0, 0, 0, 1, 1,
-1.404825, 0.1988968, -0.8382688, 1, 1, 1, 1, 1,
-1.397103, 0.7124956, -1.798755, 1, 1, 1, 1, 1,
-1.381073, -2.185999, -1.595703, 1, 1, 1, 1, 1,
-1.357864, -1.503163, -2.825226, 1, 1, 1, 1, 1,
-1.356332, 0.1303625, -1.19705, 1, 1, 1, 1, 1,
-1.35206, 2.680712, -2.831234, 1, 1, 1, 1, 1,
-1.349889, -0.04808396, -2.117898, 1, 1, 1, 1, 1,
-1.326467, 1.0568, -1.446372, 1, 1, 1, 1, 1,
-1.318283, -0.8432384, -2.508298, 1, 1, 1, 1, 1,
-1.31662, -0.5067214, -3.113739, 1, 1, 1, 1, 1,
-1.306792, 0.4501316, -1.308067, 1, 1, 1, 1, 1,
-1.300162, -0.9903641, -2.327451, 1, 1, 1, 1, 1,
-1.281682, 0.3400382, -2.238945, 1, 1, 1, 1, 1,
-1.279116, 0.3847374, -2.140022, 1, 1, 1, 1, 1,
-1.276235, -1.529974, -3.054926, 1, 1, 1, 1, 1,
-1.275978, 0.3518988, 0.05925129, 0, 0, 1, 1, 1,
-1.274862, -0.2346067, -1.738328, 1, 0, 0, 1, 1,
-1.269936, 0.56403, -2.007747, 1, 0, 0, 1, 1,
-1.268361, -1.60355, -2.182921, 1, 0, 0, 1, 1,
-1.252731, 1.507222, -2.049956, 1, 0, 0, 1, 1,
-1.244888, -0.3170263, -4.180865, 1, 0, 0, 1, 1,
-1.244259, 1.361215, -2.158647, 0, 0, 0, 1, 1,
-1.235467, 0.5309618, -0.8123645, 0, 0, 0, 1, 1,
-1.231765, -2.305278, -2.129933, 0, 0, 0, 1, 1,
-1.227101, -1.450471, -1.867518, 0, 0, 0, 1, 1,
-1.22616, 1.084242, -0.5077493, 0, 0, 0, 1, 1,
-1.224478, 0.6868227, -0.4019329, 0, 0, 0, 1, 1,
-1.219652, 2.643409, -2.325965, 0, 0, 0, 1, 1,
-1.219435, 1.163466, -0.3023867, 1, 1, 1, 1, 1,
-1.201098, -0.5053518, -1.800735, 1, 1, 1, 1, 1,
-1.199308, 0.7211509, -2.616467, 1, 1, 1, 1, 1,
-1.196734, -0.2905886, -1.573803, 1, 1, 1, 1, 1,
-1.19374, 0.9406157, -0.760219, 1, 1, 1, 1, 1,
-1.190493, -0.2874933, -1.115663, 1, 1, 1, 1, 1,
-1.190292, -1.190433, -4.083632, 1, 1, 1, 1, 1,
-1.180855, -0.8872019, -1.431674, 1, 1, 1, 1, 1,
-1.176119, 0.06416333, -0.1239646, 1, 1, 1, 1, 1,
-1.173346, 0.6609976, -1.023972, 1, 1, 1, 1, 1,
-1.169309, 0.4596718, 0.2125432, 1, 1, 1, 1, 1,
-1.166938, 1.514183, 0.0922544, 1, 1, 1, 1, 1,
-1.155088, -1.257727, -2.533753, 1, 1, 1, 1, 1,
-1.151978, -1.221421, -2.96069, 1, 1, 1, 1, 1,
-1.149274, -1.479426, -3.254592, 1, 1, 1, 1, 1,
-1.146534, 1.717272, -1.084759, 0, 0, 1, 1, 1,
-1.144762, 0.2644309, -0.9917288, 1, 0, 0, 1, 1,
-1.141828, 0.4543111, -1.319601, 1, 0, 0, 1, 1,
-1.139254, -2.021779, -1.264355, 1, 0, 0, 1, 1,
-1.137133, -0.4202647, -1.400994, 1, 0, 0, 1, 1,
-1.135912, 0.628881, 0.3769512, 1, 0, 0, 1, 1,
-1.1334, 0.2620095, -0.4868583, 0, 0, 0, 1, 1,
-1.131851, 0.03108856, -0.9980447, 0, 0, 0, 1, 1,
-1.129765, -0.9826205, -3.188276, 0, 0, 0, 1, 1,
-1.125765, -0.1316199, 0.2853712, 0, 0, 0, 1, 1,
-1.125629, -1.440554, -0.7481747, 0, 0, 0, 1, 1,
-1.121524, 0.07686675, -3.542468, 0, 0, 0, 1, 1,
-1.121305, -0.2988122, -1.921968, 0, 0, 0, 1, 1,
-1.114309, 0.9267747, -1.492239, 1, 1, 1, 1, 1,
-1.113221, 0.3074097, -2.007239, 1, 1, 1, 1, 1,
-1.105637, 0.245844, -1.660392, 1, 1, 1, 1, 1,
-1.101244, 0.8840671, 1.179979, 1, 1, 1, 1, 1,
-1.100513, 0.7032427, -0.1374606, 1, 1, 1, 1, 1,
-1.0865, -0.7904263, -1.25704, 1, 1, 1, 1, 1,
-1.084001, -0.5762537, -1.974504, 1, 1, 1, 1, 1,
-1.077968, 1.092077, -1.013829, 1, 1, 1, 1, 1,
-1.074787, -0.4501809, -2.140895, 1, 1, 1, 1, 1,
-1.071875, -0.3729986, -2.42589, 1, 1, 1, 1, 1,
-1.068683, -0.2906315, -2.574777, 1, 1, 1, 1, 1,
-1.06568, -0.2684445, -1.350181, 1, 1, 1, 1, 1,
-1.061249, 2.398658, -0.7925949, 1, 1, 1, 1, 1,
-1.056573, -0.3137774, -2.726456, 1, 1, 1, 1, 1,
-1.053497, 1.000588, 0.3725232, 1, 1, 1, 1, 1,
-1.050589, -1.461945, -2.088555, 0, 0, 1, 1, 1,
-1.050334, 1.110157, -0.06455624, 1, 0, 0, 1, 1,
-1.047628, 0.2076748, 0.3914243, 1, 0, 0, 1, 1,
-1.039526, 0.6651459, 0.3386669, 1, 0, 0, 1, 1,
-1.024733, -0.9076895, -0.6369758, 1, 0, 0, 1, 1,
-1.024042, -0.2934058, -1.133761, 1, 0, 0, 1, 1,
-1.020368, -0.2098172, -2.687379, 0, 0, 0, 1, 1,
-1.019481, 0.3460327, -1.219102, 0, 0, 0, 1, 1,
-1.01946, -0.557491, -0.1085783, 0, 0, 0, 1, 1,
-1.018499, 0.9862821, 0.6105715, 0, 0, 0, 1, 1,
-1.011856, -1.135504, 0.2182202, 0, 0, 0, 1, 1,
-0.9940174, -0.7818176, -1.569417, 0, 0, 0, 1, 1,
-0.9921167, 0.8608551, -0.9000159, 0, 0, 0, 1, 1,
-0.9879826, -1.211465, -2.52541, 1, 1, 1, 1, 1,
-0.9866835, -0.2935117, -2.655254, 1, 1, 1, 1, 1,
-0.9827594, -0.456632, -3.273607, 1, 1, 1, 1, 1,
-0.9711339, 1.909711, 0.1533694, 1, 1, 1, 1, 1,
-0.9706704, 2.098187, 0.2421654, 1, 1, 1, 1, 1,
-0.9695411, -0.06248482, 0.1166375, 1, 1, 1, 1, 1,
-0.9618118, -0.4520691, -2.16386, 1, 1, 1, 1, 1,
-0.9611678, -1.65079, -1.946086, 1, 1, 1, 1, 1,
-0.9596269, -0.4410761, -3.501828, 1, 1, 1, 1, 1,
-0.9509736, 0.2616445, -1.864992, 1, 1, 1, 1, 1,
-0.9408467, 1.483846, 0.6210126, 1, 1, 1, 1, 1,
-0.9339518, 0.3314529, -0.2232886, 1, 1, 1, 1, 1,
-0.9320588, -0.5150462, -2.703295, 1, 1, 1, 1, 1,
-0.9284442, -1.583617, -4.390254, 1, 1, 1, 1, 1,
-0.9124398, -1.244002, -4.106771, 1, 1, 1, 1, 1,
-0.9022519, 0.07185376, -1.007776, 0, 0, 1, 1, 1,
-0.9007568, -0.3647225, -3.857996, 1, 0, 0, 1, 1,
-0.8897834, 0.7779008, -0.5073708, 1, 0, 0, 1, 1,
-0.8876775, -0.1574074, -1.920284, 1, 0, 0, 1, 1,
-0.8869697, 0.1400377, -2.047862, 1, 0, 0, 1, 1,
-0.8851578, 0.9710167, -2.068843, 1, 0, 0, 1, 1,
-0.87655, -0.2749017, -2.183099, 0, 0, 0, 1, 1,
-0.8760207, -0.3640836, -1.194509, 0, 0, 0, 1, 1,
-0.8753961, 0.52134, 0.4450769, 0, 0, 0, 1, 1,
-0.8655961, -0.6049812, -3.956846, 0, 0, 0, 1, 1,
-0.8562264, 0.4103848, -1.540549, 0, 0, 0, 1, 1,
-0.8540397, 0.1460702, -1.693889, 0, 0, 0, 1, 1,
-0.8466649, 0.1439348, -1.707309, 0, 0, 0, 1, 1,
-0.846513, -0.1226915, -2.757976, 1, 1, 1, 1, 1,
-0.8428262, -0.2477216, -2.674447, 1, 1, 1, 1, 1,
-0.8375204, 0.3165958, -1.448976, 1, 1, 1, 1, 1,
-0.8374327, -0.8722889, -2.152849, 1, 1, 1, 1, 1,
-0.8360341, 0.1815249, -1.564136, 1, 1, 1, 1, 1,
-0.8342099, 1.871929, -0.1301437, 1, 1, 1, 1, 1,
-0.8265223, 0.1390403, -1.883135, 1, 1, 1, 1, 1,
-0.8232427, -1.389226, -3.373907, 1, 1, 1, 1, 1,
-0.821776, -1.019897, -3.173142, 1, 1, 1, 1, 1,
-0.8160307, -0.8054897, -2.979739, 1, 1, 1, 1, 1,
-0.8096834, -0.9258739, -3.352976, 1, 1, 1, 1, 1,
-0.8061238, -0.6744936, -1.263696, 1, 1, 1, 1, 1,
-0.8029862, 0.9140348, -0.003473245, 1, 1, 1, 1, 1,
-0.8018841, -0.8527925, -2.125787, 1, 1, 1, 1, 1,
-0.7962873, 1.543109, -0.7311869, 1, 1, 1, 1, 1,
-0.7896835, 0.8001618, -1.313556, 0, 0, 1, 1, 1,
-0.7896743, 0.4874509, 1.166453, 1, 0, 0, 1, 1,
-0.7888738, 1.241704, -0.2929119, 1, 0, 0, 1, 1,
-0.7884126, 0.8353698, -0.4621938, 1, 0, 0, 1, 1,
-0.7880589, -1.830729, -3.722758, 1, 0, 0, 1, 1,
-0.7839838, -0.3216734, -1.426047, 1, 0, 0, 1, 1,
-0.7825692, -0.9072402, -3.040982, 0, 0, 0, 1, 1,
-0.7769837, 0.5698227, 0.1228583, 0, 0, 0, 1, 1,
-0.7755288, -1.058699, -2.987773, 0, 0, 0, 1, 1,
-0.7752734, -0.1632476, -0.542084, 0, 0, 0, 1, 1,
-0.7728346, 0.5396577, -1.071213, 0, 0, 0, 1, 1,
-0.7584989, -0.9076925, -3.319262, 0, 0, 0, 1, 1,
-0.757341, -1.052831, -4.402766, 0, 0, 0, 1, 1,
-0.7560961, 0.5548753, -0.9994882, 1, 1, 1, 1, 1,
-0.7557746, -0.8940284, -2.132486, 1, 1, 1, 1, 1,
-0.7525797, -1.054064, -2.439739, 1, 1, 1, 1, 1,
-0.7478959, -0.02299089, -0.7107628, 1, 1, 1, 1, 1,
-0.745925, -1.408351, -2.87414, 1, 1, 1, 1, 1,
-0.7424451, -0.1500458, -0.2150644, 1, 1, 1, 1, 1,
-0.7406243, -1.181491, -1.110994, 1, 1, 1, 1, 1,
-0.7400512, -0.9302876, -2.347163, 1, 1, 1, 1, 1,
-0.7329417, -0.9053576, -0.7422877, 1, 1, 1, 1, 1,
-0.7327076, -0.7788022, -1.731718, 1, 1, 1, 1, 1,
-0.7224855, 0.3317552, -1.599264, 1, 1, 1, 1, 1,
-0.7222461, -2.445557, -3.333664, 1, 1, 1, 1, 1,
-0.7175476, -0.8781621, 0.4841624, 1, 1, 1, 1, 1,
-0.7169147, -1.326047, -2.660794, 1, 1, 1, 1, 1,
-0.7163426, -0.7796558, -3.535133, 1, 1, 1, 1, 1,
-0.7157894, 1.118161, -0.8878869, 0, 0, 1, 1, 1,
-0.7120173, 0.3903957, -0.3944712, 1, 0, 0, 1, 1,
-0.707498, 1.523475, 0.5440236, 1, 0, 0, 1, 1,
-0.7061211, 1.621763, -0.05975701, 1, 0, 0, 1, 1,
-0.7052764, 0.04176104, -1.381685, 1, 0, 0, 1, 1,
-0.7032878, -1.390621, -2.735013, 1, 0, 0, 1, 1,
-0.7025805, 0.4763132, -1.800098, 0, 0, 0, 1, 1,
-0.7004059, -0.2526419, -2.695484, 0, 0, 0, 1, 1,
-0.7003335, 0.6394306, -1.240173, 0, 0, 0, 1, 1,
-0.6997851, 0.2945731, -1.289214, 0, 0, 0, 1, 1,
-0.6968188, -0.5533919, -3.399268, 0, 0, 0, 1, 1,
-0.6949569, 0.3488461, -1.196931, 0, 0, 0, 1, 1,
-0.6924618, 1.120051, -1.098997, 0, 0, 0, 1, 1,
-0.6898785, -0.3191611, -1.916358, 1, 1, 1, 1, 1,
-0.6898751, 0.3501621, -1.607122, 1, 1, 1, 1, 1,
-0.6866149, -0.2085817, -2.080341, 1, 1, 1, 1, 1,
-0.681744, 0.1866592, -1.90903, 1, 1, 1, 1, 1,
-0.6790349, -0.4090059, -2.373805, 1, 1, 1, 1, 1,
-0.6755718, 0.7460315, -0.7434538, 1, 1, 1, 1, 1,
-0.6735905, -0.7617012, -1.618752, 1, 1, 1, 1, 1,
-0.6719171, -2.377538, -2.83557, 1, 1, 1, 1, 1,
-0.6717355, -0.5537749, -1.950506, 1, 1, 1, 1, 1,
-0.6693999, 0.4932868, -0.05749288, 1, 1, 1, 1, 1,
-0.6689831, 1.655909, -0.7838685, 1, 1, 1, 1, 1,
-0.6660261, -0.9585734, -2.056884, 1, 1, 1, 1, 1,
-0.6633859, 0.4647245, 0.7055912, 1, 1, 1, 1, 1,
-0.6617139, -0.6374037, -2.180398, 1, 1, 1, 1, 1,
-0.6562757, 0.5908937, -1.101757, 1, 1, 1, 1, 1,
-0.6535594, -0.5436031, -1.317058, 0, 0, 1, 1, 1,
-0.6529132, 0.9921658, -1.381692, 1, 0, 0, 1, 1,
-0.6445424, -0.3547198, -2.075149, 1, 0, 0, 1, 1,
-0.64377, 1.089839, -0.3396669, 1, 0, 0, 1, 1,
-0.6418923, 0.1375817, -0.184326, 1, 0, 0, 1, 1,
-0.6412164, 0.9429011, -2.008843, 1, 0, 0, 1, 1,
-0.6408452, 1.157889, -0.9276597, 0, 0, 0, 1, 1,
-0.6406618, 0.3756369, -3.367007, 0, 0, 0, 1, 1,
-0.6388406, 0.5953028, -1.195577, 0, 0, 0, 1, 1,
-0.6301984, -1.503278, -2.961214, 0, 0, 0, 1, 1,
-0.6250582, 0.4086058, 1.877519, 0, 0, 0, 1, 1,
-0.6232059, -0.4304855, 0.1639807, 0, 0, 0, 1, 1,
-0.6213714, 1.26602, -0.2608988, 0, 0, 0, 1, 1,
-0.6097997, 0.3988304, -0.5281187, 1, 1, 1, 1, 1,
-0.6071959, -0.7530093, -2.368617, 1, 1, 1, 1, 1,
-0.6062351, 0.4119404, -0.3554169, 1, 1, 1, 1, 1,
-0.6040049, -1.148394, -2.452699, 1, 1, 1, 1, 1,
-0.6016776, 0.218406, -2.519951, 1, 1, 1, 1, 1,
-0.595138, -1.572668, -2.095446, 1, 1, 1, 1, 1,
-0.5874808, 0.4623665, -0.698911, 1, 1, 1, 1, 1,
-0.5869883, 0.8187348, -0.8667623, 1, 1, 1, 1, 1,
-0.5852153, 0.3990822, -2.889782, 1, 1, 1, 1, 1,
-0.5825274, 0.2402827, -1.542328, 1, 1, 1, 1, 1,
-0.5809662, -0.9074556, -0.5385128, 1, 1, 1, 1, 1,
-0.5789728, 0.6099638, -1.402296, 1, 1, 1, 1, 1,
-0.5776627, 1.29748, 0.448689, 1, 1, 1, 1, 1,
-0.5775753, 0.9908089, 0.4315568, 1, 1, 1, 1, 1,
-0.5770884, 0.3081398, -1.349581, 1, 1, 1, 1, 1,
-0.5750123, -1.161467, -1.438539, 0, 0, 1, 1, 1,
-0.5717822, -1.330042, -2.839301, 1, 0, 0, 1, 1,
-0.5706831, -0.7273654, -0.1492507, 1, 0, 0, 1, 1,
-0.5674049, 0.9762406, -0.8747286, 1, 0, 0, 1, 1,
-0.5645176, -0.353508, -2.357213, 1, 0, 0, 1, 1,
-0.5588679, -0.4154385, -2.251259, 1, 0, 0, 1, 1,
-0.5503681, -0.2052136, -2.794532, 0, 0, 0, 1, 1,
-0.5480693, 2.055313, 1.141305, 0, 0, 0, 1, 1,
-0.5461279, 0.7584993, -1.116639, 0, 0, 0, 1, 1,
-0.5458295, -0.3416497, -3.737761, 0, 0, 0, 1, 1,
-0.5449297, 0.9049066, -2.491229, 0, 0, 0, 1, 1,
-0.5432131, -1.309691, -2.555324, 0, 0, 0, 1, 1,
-0.5428139, 0.7677645, -1.668822, 0, 0, 0, 1, 1,
-0.5423911, -0.3456509, -3.197327, 1, 1, 1, 1, 1,
-0.5381027, 0.90681, 0.04198321, 1, 1, 1, 1, 1,
-0.5368824, -2.676272, -2.78015, 1, 1, 1, 1, 1,
-0.531223, 0.7714864, 1.365737, 1, 1, 1, 1, 1,
-0.5273398, 0.0660516, -2.379606, 1, 1, 1, 1, 1,
-0.5248893, -1.466574, -3.356974, 1, 1, 1, 1, 1,
-0.5245039, 0.6997517, -2.512393, 1, 1, 1, 1, 1,
-0.5225794, -1.10079, -3.324528, 1, 1, 1, 1, 1,
-0.5166253, -0.9798526, -5.028951, 1, 1, 1, 1, 1,
-0.5164959, 0.2983015, 0.12318, 1, 1, 1, 1, 1,
-0.5160862, 0.8133135, -2.136199, 1, 1, 1, 1, 1,
-0.5153081, -1.365596, -3.735169, 1, 1, 1, 1, 1,
-0.5125023, 1.288163, 0.2859019, 1, 1, 1, 1, 1,
-0.5117502, 1.178978, 0.2156692, 1, 1, 1, 1, 1,
-0.5106321, 2.663435, -0.7770022, 1, 1, 1, 1, 1,
-0.503689, -0.7177189, -4.67982, 0, 0, 1, 1, 1,
-0.5009291, 0.5209156, -0.7774546, 1, 0, 0, 1, 1,
-0.4995345, 1.820427, 0.08657566, 1, 0, 0, 1, 1,
-0.4990159, 0.5060195, 1.188909, 1, 0, 0, 1, 1,
-0.497948, 0.1668586, -1.275951, 1, 0, 0, 1, 1,
-0.4967897, 1.752219, -0.6080772, 1, 0, 0, 1, 1,
-0.4965751, -0.5765204, -1.893024, 0, 0, 0, 1, 1,
-0.4907335, 1.283115, -0.165203, 0, 0, 0, 1, 1,
-0.4808078, 0.02777418, -2.118337, 0, 0, 0, 1, 1,
-0.4700929, 0.6373632, -1.544817, 0, 0, 0, 1, 1,
-0.4688985, -0.8401867, -3.067992, 0, 0, 0, 1, 1,
-0.467636, -1.575029, -1.864335, 0, 0, 0, 1, 1,
-0.4667756, 1.270392, 0.1661754, 0, 0, 0, 1, 1,
-0.4663355, 1.346433, -0.2820204, 1, 1, 1, 1, 1,
-0.4638907, 1.238884, 0.01525427, 1, 1, 1, 1, 1,
-0.4630134, 1.036788, 0.2426433, 1, 1, 1, 1, 1,
-0.4621695, 2.397241, -0.384277, 1, 1, 1, 1, 1,
-0.4557338, 0.004562972, -2.878089, 1, 1, 1, 1, 1,
-0.448078, 0.5889202, -0.4838741, 1, 1, 1, 1, 1,
-0.4480487, 0.1166987, -3.182499, 1, 1, 1, 1, 1,
-0.4477279, -1.037835, -2.558276, 1, 1, 1, 1, 1,
-0.4281046, -0.9666053, -3.171232, 1, 1, 1, 1, 1,
-0.4275495, -1.841919, -3.278313, 1, 1, 1, 1, 1,
-0.4264924, 1.330008, -1.623317, 1, 1, 1, 1, 1,
-0.4254369, -3.36151, -3.637799, 1, 1, 1, 1, 1,
-0.4236689, -1.697103, -2.579513, 1, 1, 1, 1, 1,
-0.4201184, -0.1356118, -2.333204, 1, 1, 1, 1, 1,
-0.4183422, 0.7120406, -1.21872, 1, 1, 1, 1, 1,
-0.4163882, 0.396004, -3.046439, 0, 0, 1, 1, 1,
-0.4093842, -1.144916, -3.797375, 1, 0, 0, 1, 1,
-0.4058887, -0.4892731, -2.438711, 1, 0, 0, 1, 1,
-0.4049428, 1.433861, -1.824998, 1, 0, 0, 1, 1,
-0.4037879, -0.84644, -3.109196, 1, 0, 0, 1, 1,
-0.4027523, 0.3704366, -2.134687, 1, 0, 0, 1, 1,
-0.4004166, 0.4084802, -1.628365, 0, 0, 0, 1, 1,
-0.3929047, -1.32939, -0.7433328, 0, 0, 0, 1, 1,
-0.3884676, -0.4048993, -2.878702, 0, 0, 0, 1, 1,
-0.3882833, -1.071837, -2.553434, 0, 0, 0, 1, 1,
-0.3769649, 0.5762488, -1.146003, 0, 0, 0, 1, 1,
-0.3769206, -0.2645236, -2.286346, 0, 0, 0, 1, 1,
-0.3727408, 1.301338, -0.8451653, 0, 0, 0, 1, 1,
-0.3714943, -0.9340339, -1.64614, 1, 1, 1, 1, 1,
-0.3699053, -0.6222519, -2.200858, 1, 1, 1, 1, 1,
-0.3693972, -0.6695585, -3.404669, 1, 1, 1, 1, 1,
-0.3652045, 1.919104, 0.1768373, 1, 1, 1, 1, 1,
-0.3651178, 0.6486218, -0.4883855, 1, 1, 1, 1, 1,
-0.3636046, 0.7581554, -0.8616715, 1, 1, 1, 1, 1,
-0.3632328, 0.8832395, -1.522805, 1, 1, 1, 1, 1,
-0.3624926, -0.9600677, -2.817235, 1, 1, 1, 1, 1,
-0.3605301, 0.1416028, -2.616623, 1, 1, 1, 1, 1,
-0.3605188, -1.272848, -3.776793, 1, 1, 1, 1, 1,
-0.3605179, -0.9430523, -3.248602, 1, 1, 1, 1, 1,
-0.3562924, -1.588519, -3.204756, 1, 1, 1, 1, 1,
-0.3550732, -2.280241, -2.740677, 1, 1, 1, 1, 1,
-0.3539706, -0.5401577, -1.921482, 1, 1, 1, 1, 1,
-0.3512803, 0.08785573, -3.199674, 1, 1, 1, 1, 1,
-0.3501621, -0.479759, -2.356551, 0, 0, 1, 1, 1,
-0.348479, 0.9329549, -1.154418, 1, 0, 0, 1, 1,
-0.3480322, -1.669036, -2.155821, 1, 0, 0, 1, 1,
-0.3453196, 1.608375, -0.2629537, 1, 0, 0, 1, 1,
-0.3427894, -0.1499589, -0.5806056, 1, 0, 0, 1, 1,
-0.3416034, -0.7485051, -2.576419, 1, 0, 0, 1, 1,
-0.3379507, -0.2591608, -1.796924, 0, 0, 0, 1, 1,
-0.3347452, -0.08214372, -3.709802, 0, 0, 0, 1, 1,
-0.3345376, -0.03829813, -2.533589, 0, 0, 0, 1, 1,
-0.3306422, -0.9989259, -2.401745, 0, 0, 0, 1, 1,
-0.3281584, -1.080719, -2.752744, 0, 0, 0, 1, 1,
-0.3280782, -1.483976, -2.281455, 0, 0, 0, 1, 1,
-0.3230911, -0.005819659, -2.698286, 0, 0, 0, 1, 1,
-0.3223755, -0.529808, -2.799007, 1, 1, 1, 1, 1,
-0.3193805, -1.018916, -2.650044, 1, 1, 1, 1, 1,
-0.3164476, 2.221405, 1.910026, 1, 1, 1, 1, 1,
-0.3131796, 1.056179, 1.146133, 1, 1, 1, 1, 1,
-0.3119228, -0.5469817, -1.448064, 1, 1, 1, 1, 1,
-0.311728, -0.5684595, -2.490916, 1, 1, 1, 1, 1,
-0.3105862, 0.3880688, 0.1462681, 1, 1, 1, 1, 1,
-0.3094054, 0.1000349, -1.54588, 1, 1, 1, 1, 1,
-0.3085936, 0.1121362, 0.2715096, 1, 1, 1, 1, 1,
-0.3034719, -1.580114, -3.5869, 1, 1, 1, 1, 1,
-0.3014476, 0.1636345, -1.031959, 1, 1, 1, 1, 1,
-0.2895368, -0.2697201, -2.215889, 1, 1, 1, 1, 1,
-0.2880637, 0.8281876, 0.6528839, 1, 1, 1, 1, 1,
-0.2863411, -1.431061, -3.873911, 1, 1, 1, 1, 1,
-0.2858283, -1.977681, -1.799424, 1, 1, 1, 1, 1,
-0.2835641, -0.2461696, -1.356099, 0, 0, 1, 1, 1,
-0.281934, 0.4003973, -0.9236835, 1, 0, 0, 1, 1,
-0.2801173, -0.3180463, -2.476215, 1, 0, 0, 1, 1,
-0.2792165, 0.1543054, -0.3513145, 1, 0, 0, 1, 1,
-0.27538, 0.7057955, -1.67525, 1, 0, 0, 1, 1,
-0.2666867, 1.931926, -0.8721216, 1, 0, 0, 1, 1,
-0.2648208, 2.023247, -0.5379172, 0, 0, 0, 1, 1,
-0.2645503, -0.6262303, -2.250911, 0, 0, 0, 1, 1,
-0.2585476, -0.8345436, -3.957519, 0, 0, 0, 1, 1,
-0.2568309, -0.5354492, -1.900286, 0, 0, 0, 1, 1,
-0.254299, -1.909671, -3.743301, 0, 0, 0, 1, 1,
-0.2541418, -0.5850269, -4.992634, 0, 0, 0, 1, 1,
-0.2491592, -0.6974797, -2.616195, 0, 0, 0, 1, 1,
-0.2488607, 0.9835264, -1.913992, 1, 1, 1, 1, 1,
-0.24214, -2.323796, -4.292842, 1, 1, 1, 1, 1,
-0.2409239, -0.5418378, -2.416836, 1, 1, 1, 1, 1,
-0.2385852, -0.3412089, -1.140285, 1, 1, 1, 1, 1,
-0.2372528, 1.405204, 0.6107768, 1, 1, 1, 1, 1,
-0.2349025, -1.907393, -4.206062, 1, 1, 1, 1, 1,
-0.2332935, 1.078297, -0.9228005, 1, 1, 1, 1, 1,
-0.2285352, -1.622939, -2.508679, 1, 1, 1, 1, 1,
-0.2283679, 0.05131601, -1.495026, 1, 1, 1, 1, 1,
-0.2270027, -0.1970579, -1.222835, 1, 1, 1, 1, 1,
-0.2251025, -0.7881305, -3.365035, 1, 1, 1, 1, 1,
-0.2212265, 1.978052, -0.07882316, 1, 1, 1, 1, 1,
-0.2199872, 0.9169479, -2.718191, 1, 1, 1, 1, 1,
-0.2167584, 1.195349, -0.3640174, 1, 1, 1, 1, 1,
-0.2099695, -0.1917129, -0.8730993, 1, 1, 1, 1, 1,
-0.2074555, -0.8061492, -2.690136, 0, 0, 1, 1, 1,
-0.2064366, 1.322699, -0.4805431, 1, 0, 0, 1, 1,
-0.2047005, -1.018335, -2.020581, 1, 0, 0, 1, 1,
-0.2046698, -2.18033, -2.72729, 1, 0, 0, 1, 1,
-0.2030003, 0.7126762, 1.621434, 1, 0, 0, 1, 1,
-0.2026028, -1.020032, -1.971606, 1, 0, 0, 1, 1,
-0.2017452, -1.932832, -3.588194, 0, 0, 0, 1, 1,
-0.2014664, 0.1603741, 2.411949, 0, 0, 0, 1, 1,
-0.2011567, 0.9125572, -0.46505, 0, 0, 0, 1, 1,
-0.2008786, 0.03846833, -1.302654, 0, 0, 0, 1, 1,
-0.2007224, -0.1805654, -1.048898, 0, 0, 0, 1, 1,
-0.1980402, 1.064858, 0.04899588, 0, 0, 0, 1, 1,
-0.1961162, -1.272452, -3.752623, 0, 0, 0, 1, 1,
-0.1901274, 0.5083963, 0.1470867, 1, 1, 1, 1, 1,
-0.1876696, 0.09565548, -0.3162376, 1, 1, 1, 1, 1,
-0.1863857, 1.614258, -1.157579, 1, 1, 1, 1, 1,
-0.1850743, 0.5866734, 1.465003, 1, 1, 1, 1, 1,
-0.1830651, 1.090044, -0.6629198, 1, 1, 1, 1, 1,
-0.1800719, -3.04483, -4.829007, 1, 1, 1, 1, 1,
-0.1795622, 0.1852529, -0.1248815, 1, 1, 1, 1, 1,
-0.174138, -0.1637017, -3.269854, 1, 1, 1, 1, 1,
-0.1700875, -0.6575348, -4.852649, 1, 1, 1, 1, 1,
-0.1683708, -0.8006609, -1.912697, 1, 1, 1, 1, 1,
-0.1682214, -0.2793756, -2.463979, 1, 1, 1, 1, 1,
-0.1673028, -0.1682047, -2.432673, 1, 1, 1, 1, 1,
-0.1635897, -0.201068, -1.164687, 1, 1, 1, 1, 1,
-0.1621303, -1.013991, -5.627584, 1, 1, 1, 1, 1,
-0.1596205, -0.241051, -4.818168, 1, 1, 1, 1, 1,
-0.1594718, 0.08654915, 0.1012582, 0, 0, 1, 1, 1,
-0.1592449, 1.821684, 0.7438489, 1, 0, 0, 1, 1,
-0.1573075, 1.555174, 0.332321, 1, 0, 0, 1, 1,
-0.1514434, -0.2068884, -1.135, 1, 0, 0, 1, 1,
-0.149662, -0.3756735, -3.010189, 1, 0, 0, 1, 1,
-0.1495675, -0.8681775, -3.059943, 1, 0, 0, 1, 1,
-0.1490385, 0.418043, 0.83507, 0, 0, 0, 1, 1,
-0.1480909, -0.4520045, -1.462987, 0, 0, 0, 1, 1,
-0.1456768, -0.6841765, -4.732306, 0, 0, 0, 1, 1,
-0.1448674, -0.1973319, -0.8702059, 0, 0, 0, 1, 1,
-0.1424515, -1.635664, -2.121321, 0, 0, 0, 1, 1,
-0.1421457, -1.153482, -3.599499, 0, 0, 0, 1, 1,
-0.140896, -2.332405, -4.094897, 0, 0, 0, 1, 1,
-0.1408202, -2.280105, -3.226715, 1, 1, 1, 1, 1,
-0.1370331, -0.1227995, -2.526955, 1, 1, 1, 1, 1,
-0.123207, 0.5512301, 0.05988561, 1, 1, 1, 1, 1,
-0.1219357, -0.3639558, -3.566173, 1, 1, 1, 1, 1,
-0.1197997, -1.053623, -2.151375, 1, 1, 1, 1, 1,
-0.1125088, -0.07405822, -3.309972, 1, 1, 1, 1, 1,
-0.1116916, 0.04807943, -0.4671235, 1, 1, 1, 1, 1,
-0.1057873, 0.1293853, -0.7559956, 1, 1, 1, 1, 1,
-0.1054674, 0.4734476, 0.3111117, 1, 1, 1, 1, 1,
-0.1044532, 0.2188634, 0.02695086, 1, 1, 1, 1, 1,
-0.1019175, -1.549974, -3.647667, 1, 1, 1, 1, 1,
-0.09986553, 0.5278758, 0.002804833, 1, 1, 1, 1, 1,
-0.09931456, -0.7193714, -3.635541, 1, 1, 1, 1, 1,
-0.09391355, -1.691373, -1.86409, 1, 1, 1, 1, 1,
-0.09177371, -1.887035, -4.130617, 1, 1, 1, 1, 1,
-0.08951987, 0.6842799, 0.3471895, 0, 0, 1, 1, 1,
-0.08935357, 0.2403469, 0.02615276, 1, 0, 0, 1, 1,
-0.08872731, 0.3914598, -1.164925, 1, 0, 0, 1, 1,
-0.08649537, 0.6867851, -0.4101117, 1, 0, 0, 1, 1,
-0.08255208, -0.1545347, -2.926686, 1, 0, 0, 1, 1,
-0.08134588, 1.744294, -0.2184429, 1, 0, 0, 1, 1,
-0.07992364, -0.7230438, -4.141517, 0, 0, 0, 1, 1,
-0.07974266, 0.09081201, -1.617893, 0, 0, 0, 1, 1,
-0.07950807, -0.5104721, -2.791128, 0, 0, 0, 1, 1,
-0.07794537, -0.6251606, -3.387366, 0, 0, 0, 1, 1,
-0.07571147, 0.6407527, -0.08073811, 0, 0, 0, 1, 1,
-0.07161982, 0.5573897, 0.3570653, 0, 0, 0, 1, 1,
-0.07154644, 1.62587, -1.588814, 0, 0, 0, 1, 1,
-0.06495365, -0.3561453, -2.982789, 1, 1, 1, 1, 1,
-0.06486719, -0.4881935, -1.574441, 1, 1, 1, 1, 1,
-0.05853426, 0.5899511, -0.6848558, 1, 1, 1, 1, 1,
-0.05763207, -1.37946, -3.152581, 1, 1, 1, 1, 1,
-0.05527271, 1.782234, 1.305365, 1, 1, 1, 1, 1,
-0.04954895, -1.203085, -3.302022, 1, 1, 1, 1, 1,
-0.04741881, -0.4911588, -3.082514, 1, 1, 1, 1, 1,
-0.04695847, 0.1707361, -0.05892646, 1, 1, 1, 1, 1,
-0.04377832, 0.2096757, -0.203382, 1, 1, 1, 1, 1,
-0.04269553, -0.6627516, -3.918729, 1, 1, 1, 1, 1,
-0.04253204, 0.2766298, 0.5128402, 1, 1, 1, 1, 1,
-0.04232192, 2.177224, -1.128536, 1, 1, 1, 1, 1,
-0.04161726, 1.164147, 1.723015, 1, 1, 1, 1, 1,
-0.03133857, 1.570823, 1.069683, 1, 1, 1, 1, 1,
-0.02176451, 1.321411, -1.523012, 1, 1, 1, 1, 1,
-0.02058345, 1.333567, 1.545732, 0, 0, 1, 1, 1,
-0.02033817, 0.7425051, -0.7400474, 1, 0, 0, 1, 1,
-0.01946848, 0.3612929, -0.6279839, 1, 0, 0, 1, 1,
-0.01389959, 0.03897512, 0.1455113, 1, 0, 0, 1, 1,
-0.01180791, 1.752156, 0.7897224, 1, 0, 0, 1, 1,
-0.01117925, 1.358133, 1.582319, 1, 0, 0, 1, 1,
-0.01082068, -1.641333, -3.809597, 0, 0, 0, 1, 1,
-0.00545782, -0.5553536, -3.486096, 0, 0, 0, 1, 1,
-0.001926572, -3.659073, -3.773145, 0, 0, 0, 1, 1,
0.0008927717, 0.1782736, -0.07872475, 0, 0, 0, 1, 1,
0.001688368, -0.4297422, 2.37542, 0, 0, 0, 1, 1,
0.005333407, 2.840592, -1.251745, 0, 0, 0, 1, 1,
0.007087279, -0.275176, 3.743292, 0, 0, 0, 1, 1,
0.007487328, -0.9044967, 2.498478, 1, 1, 1, 1, 1,
0.008466966, -1.335942, 1.471643, 1, 1, 1, 1, 1,
0.009723458, 0.1131292, -0.001706482, 1, 1, 1, 1, 1,
0.0111914, 0.7836202, -0.3896296, 1, 1, 1, 1, 1,
0.01464012, -0.6881587, 2.092929, 1, 1, 1, 1, 1,
0.01617092, 1.099844, -1.998192, 1, 1, 1, 1, 1,
0.0187911, 0.657539, 0.1634838, 1, 1, 1, 1, 1,
0.02196643, -0.1684276, 2.907417, 1, 1, 1, 1, 1,
0.02238968, -0.788568, 1.881999, 1, 1, 1, 1, 1,
0.02244232, 0.892849, 2.52625, 1, 1, 1, 1, 1,
0.02249798, -1.512714, 0.8826886, 1, 1, 1, 1, 1,
0.02304382, 0.2117864, -0.8392124, 1, 1, 1, 1, 1,
0.02636227, -1.101864, 2.145032, 1, 1, 1, 1, 1,
0.02687121, 0.0240573, 0.1864281, 1, 1, 1, 1, 1,
0.02986549, 1.722962, -0.02224735, 1, 1, 1, 1, 1,
0.03612003, -1.079092, 3.316662, 0, 0, 1, 1, 1,
0.03763258, -0.5722915, 2.180252, 1, 0, 0, 1, 1,
0.04189827, -0.1264267, 3.200238, 1, 0, 0, 1, 1,
0.04366437, 0.4262086, -1.610084, 1, 0, 0, 1, 1,
0.04700621, -0.5169428, 2.186169, 1, 0, 0, 1, 1,
0.04892338, 0.8268196, -0.3337585, 1, 0, 0, 1, 1,
0.05517735, -0.2299442, 4.060028, 0, 0, 0, 1, 1,
0.0594075, -0.9788817, 2.01742, 0, 0, 0, 1, 1,
0.05994598, 0.5608984, -0.3766551, 0, 0, 0, 1, 1,
0.06897131, 0.3876975, 2.188402, 0, 0, 0, 1, 1,
0.07119514, -2.492251, 1.166636, 0, 0, 0, 1, 1,
0.07190668, -0.05166657, 2.033897, 0, 0, 0, 1, 1,
0.07521817, 0.1766099, -0.4482007, 0, 0, 0, 1, 1,
0.07707583, -0.6011876, 3.40415, 1, 1, 1, 1, 1,
0.08075076, -0.07725682, 3.301058, 1, 1, 1, 1, 1,
0.08280435, 0.06104545, 2.007791, 1, 1, 1, 1, 1,
0.08476747, -1.096895, 3.718915, 1, 1, 1, 1, 1,
0.08517287, -0.8822019, 3.637892, 1, 1, 1, 1, 1,
0.08608233, -1.256621, 3.215277, 1, 1, 1, 1, 1,
0.09428449, -0.9566743, 2.412191, 1, 1, 1, 1, 1,
0.0945004, 0.3790306, -0.5303364, 1, 1, 1, 1, 1,
0.09908706, -0.1935815, 2.948368, 1, 1, 1, 1, 1,
0.1021983, 0.009101862, 3.094276, 1, 1, 1, 1, 1,
0.1038079, -1.016356, 1.917315, 1, 1, 1, 1, 1,
0.1058846, -1.056207, 2.503738, 1, 1, 1, 1, 1,
0.1069677, 0.1443847, 2.197613, 1, 1, 1, 1, 1,
0.1077641, -0.04045482, 0.5954269, 1, 1, 1, 1, 1,
0.1094692, 0.3573085, -0.01943093, 1, 1, 1, 1, 1,
0.1112184, 0.7769225, 0.7881685, 0, 0, 1, 1, 1,
0.1120892, -0.3131636, 2.134744, 1, 0, 0, 1, 1,
0.1123412, -0.4277742, 3.416711, 1, 0, 0, 1, 1,
0.1160808, -1.081543, 4.246756, 1, 0, 0, 1, 1,
0.1180367, -1.268075, 2.993089, 1, 0, 0, 1, 1,
0.1223523, -0.1713786, 3.532413, 1, 0, 0, 1, 1,
0.1247962, 0.4020091, -0.1150123, 0, 0, 0, 1, 1,
0.1266316, -0.4284833, 3.814327, 0, 0, 0, 1, 1,
0.1274933, -1.012657, 2.287665, 0, 0, 0, 1, 1,
0.1278406, 0.1602442, -0.5948189, 0, 0, 0, 1, 1,
0.132954, -1.150459, 1.866414, 0, 0, 0, 1, 1,
0.1358916, 0.2645242, 0.8399364, 0, 0, 0, 1, 1,
0.1375559, 0.4590395, 1.541052, 0, 0, 0, 1, 1,
0.1401862, 1.366136, -1.694778, 1, 1, 1, 1, 1,
0.1413392, -0.3955326, 1.7361, 1, 1, 1, 1, 1,
0.1432649, -0.7273603, 2.552549, 1, 1, 1, 1, 1,
0.1483712, -0.6922433, 3.55337, 1, 1, 1, 1, 1,
0.1520494, 0.2061001, 0.4218812, 1, 1, 1, 1, 1,
0.1528571, -0.5908893, 2.925563, 1, 1, 1, 1, 1,
0.1581475, 0.6865453, -0.4027987, 1, 1, 1, 1, 1,
0.1632483, 1.569787, 0.7546112, 1, 1, 1, 1, 1,
0.1687605, -0.8102806, 1.516918, 1, 1, 1, 1, 1,
0.1709885, -0.09529363, 2.533389, 1, 1, 1, 1, 1,
0.1711331, -1.205081, 3.632738, 1, 1, 1, 1, 1,
0.1756041, 1.840688, 1.137824, 1, 1, 1, 1, 1,
0.1802181, 1.741971, 1.79272, 1, 1, 1, 1, 1,
0.1842757, -1.365246, 2.532637, 1, 1, 1, 1, 1,
0.1868458, -0.8025728, 2.399988, 1, 1, 1, 1, 1,
0.1957438, -1.132204, 3.7813, 0, 0, 1, 1, 1,
0.1975241, -0.5216255, 2.223469, 1, 0, 0, 1, 1,
0.198898, 0.6705543, 0.6204529, 1, 0, 0, 1, 1,
0.2006586, 1.771914, 0.5909607, 1, 0, 0, 1, 1,
0.2061521, 2.009474, 0.2264033, 1, 0, 0, 1, 1,
0.2116238, -1.504569, 3.401028, 1, 0, 0, 1, 1,
0.2167176, 0.4555414, 0.2876508, 0, 0, 0, 1, 1,
0.2174834, 0.8905088, 0.9690152, 0, 0, 0, 1, 1,
0.2177938, -0.6367649, 2.871977, 0, 0, 0, 1, 1,
0.222644, 0.6684816, 0.01594456, 0, 0, 0, 1, 1,
0.2262452, 0.2626927, -1.095355, 0, 0, 0, 1, 1,
0.2274675, -0.3292952, 2.668817, 0, 0, 0, 1, 1,
0.2279576, -1.585136, 5.030691, 0, 0, 0, 1, 1,
0.2319262, -1.78981, 4.947796, 1, 1, 1, 1, 1,
0.2324204, 0.3529432, 1.958714, 1, 1, 1, 1, 1,
0.2325297, -1.573664, 2.151396, 1, 1, 1, 1, 1,
0.2344171, 0.9078589, 1.070839, 1, 1, 1, 1, 1,
0.2356521, -0.2702649, 3.489017, 1, 1, 1, 1, 1,
0.2412625, 0.5667525, -0.5684989, 1, 1, 1, 1, 1,
0.2469119, -0.1095313, 2.094481, 1, 1, 1, 1, 1,
0.2517513, -1.574048, 1.687317, 1, 1, 1, 1, 1,
0.2548831, 1.423375, -0.4234601, 1, 1, 1, 1, 1,
0.2567281, -0.1480362, 1.970695, 1, 1, 1, 1, 1,
0.2573729, -0.5039057, 3.540296, 1, 1, 1, 1, 1,
0.2585635, -0.09442688, 1.685812, 1, 1, 1, 1, 1,
0.2608669, -0.2967069, 2.7805, 1, 1, 1, 1, 1,
0.2621026, -0.7670453, 3.868743, 1, 1, 1, 1, 1,
0.2625529, -0.02955272, 1.831644, 1, 1, 1, 1, 1,
0.2631334, 0.2730143, -0.6513314, 0, 0, 1, 1, 1,
0.2692582, 0.4577938, 1.282064, 1, 0, 0, 1, 1,
0.2694119, 0.2495819, 0.04300367, 1, 0, 0, 1, 1,
0.2707013, 2.902556, -0.1885458, 1, 0, 0, 1, 1,
0.2734334, -0.06019991, 0.9629893, 1, 0, 0, 1, 1,
0.2757951, 0.2451642, 1.338704, 1, 0, 0, 1, 1,
0.2801734, -0.9580219, 2.769048, 0, 0, 0, 1, 1,
0.2894063, -0.02362566, 2.368258, 0, 0, 0, 1, 1,
0.2900448, 0.19757, 2.84192, 0, 0, 0, 1, 1,
0.2903867, 0.3135908, 1.858899, 0, 0, 0, 1, 1,
0.2906123, -0.5852724, 5.090908, 0, 0, 0, 1, 1,
0.2931581, 0.654336, 1.521886, 0, 0, 0, 1, 1,
0.2955494, 0.6845726, -0.5719982, 0, 0, 0, 1, 1,
0.2982301, 0.08625971, 1.837468, 1, 1, 1, 1, 1,
0.3062309, 0.7936846, 1.151567, 1, 1, 1, 1, 1,
0.3082369, 0.4909472, 1.564345, 1, 1, 1, 1, 1,
0.3090607, -0.5430581, 2.327639, 1, 1, 1, 1, 1,
0.3147129, 1.240242, 1.660949, 1, 1, 1, 1, 1,
0.3156952, -0.1522662, 0.6723652, 1, 1, 1, 1, 1,
0.316764, -0.005939672, 0.9641474, 1, 1, 1, 1, 1,
0.3184275, 1.338721, -0.9178578, 1, 1, 1, 1, 1,
0.3205818, -0.7812782, 1.503591, 1, 1, 1, 1, 1,
0.3213508, 1.839675, 0.9808291, 1, 1, 1, 1, 1,
0.3214846, 1.185284, 0.5211052, 1, 1, 1, 1, 1,
0.3252321, 0.9718112, 0.5024616, 1, 1, 1, 1, 1,
0.3265297, -1.373244, 1.994207, 1, 1, 1, 1, 1,
0.3300987, -1.653937, 3.123798, 1, 1, 1, 1, 1,
0.3325568, -0.790668, 4.700188, 1, 1, 1, 1, 1,
0.3362667, 0.6622378, -1.023157, 0, 0, 1, 1, 1,
0.3363695, -0.6038893, 3.042111, 1, 0, 0, 1, 1,
0.3399189, 0.6868836, 2.227423, 1, 0, 0, 1, 1,
0.3465562, -0.5040709, 1.950117, 1, 0, 0, 1, 1,
0.3497989, -0.02222956, 1.518957, 1, 0, 0, 1, 1,
0.3504463, -0.9921376, 3.578962, 1, 0, 0, 1, 1,
0.3507575, 0.05309549, 2.950279, 0, 0, 0, 1, 1,
0.3531725, -0.5256076, 3.455911, 0, 0, 0, 1, 1,
0.3547334, 2.560303, -0.02485902, 0, 0, 0, 1, 1,
0.3573649, 0.182951, -0.6771421, 0, 0, 0, 1, 1,
0.3665767, 0.7206365, -2.041136, 0, 0, 0, 1, 1,
0.3673153, -0.515874, 2.142557, 0, 0, 0, 1, 1,
0.3692957, -0.2649165, 1.334623, 0, 0, 0, 1, 1,
0.3739565, 0.1244109, -0.8970636, 1, 1, 1, 1, 1,
0.3753654, 1.40193, -0.5604992, 1, 1, 1, 1, 1,
0.3768708, 1.043672, -0.8934314, 1, 1, 1, 1, 1,
0.3773427, 2.264479, -1.234085, 1, 1, 1, 1, 1,
0.3853325, -0.7059159, 2.85115, 1, 1, 1, 1, 1,
0.3893068, 1.160511, 0.4439601, 1, 1, 1, 1, 1,
0.3909284, -0.8477606, 3.683775, 1, 1, 1, 1, 1,
0.3910071, 0.2468657, 0.5327763, 1, 1, 1, 1, 1,
0.3917812, -1.077469, 3.840662, 1, 1, 1, 1, 1,
0.3942817, -0.8470162, 1.423832, 1, 1, 1, 1, 1,
0.3986155, 0.09800322, 1.868585, 1, 1, 1, 1, 1,
0.4016571, 0.770244, 1.20601, 1, 1, 1, 1, 1,
0.4054084, -0.651574, 2.980163, 1, 1, 1, 1, 1,
0.41568, 1.205396, 1.742178, 1, 1, 1, 1, 1,
0.4186405, 0.6409245, 0.6781723, 1, 1, 1, 1, 1,
0.4194981, 0.4513473, 1.229907, 0, 0, 1, 1, 1,
0.421343, -0.608488, 2.392161, 1, 0, 0, 1, 1,
0.4217618, -0.8818496, 2.363324, 1, 0, 0, 1, 1,
0.4289148, -1.56939, 3.194755, 1, 0, 0, 1, 1,
0.4300729, -0.1128872, 0.5259547, 1, 0, 0, 1, 1,
0.4332827, 1.092919, -0.6930149, 1, 0, 0, 1, 1,
0.4371511, 0.4155079, 0.7807754, 0, 0, 0, 1, 1,
0.4403277, -2.735537, 3.343902, 0, 0, 0, 1, 1,
0.4424458, 0.200551, 2.753527, 0, 0, 0, 1, 1,
0.4452004, -0.8784863, 2.82918, 0, 0, 0, 1, 1,
0.4464224, 0.1350357, 1.76298, 0, 0, 0, 1, 1,
0.4547156, -1.032885, 3.602837, 0, 0, 0, 1, 1,
0.4570306, -0.8996419, 1.156631, 0, 0, 0, 1, 1,
0.4575646, 1.535628, 0.419887, 1, 1, 1, 1, 1,
0.4592212, 0.2828942, 1.445006, 1, 1, 1, 1, 1,
0.4633509, -1.682804, 1.289665, 1, 1, 1, 1, 1,
0.4646221, -0.1474885, 1.452924, 1, 1, 1, 1, 1,
0.470353, 0.4956921, -1.353246, 1, 1, 1, 1, 1,
0.4709617, -0.6118857, 0.5586447, 1, 1, 1, 1, 1,
0.4755396, -1.250679, 3.308918, 1, 1, 1, 1, 1,
0.4759519, -0.5462053, 2.062917, 1, 1, 1, 1, 1,
0.4809055, 1.285042, 1.148932, 1, 1, 1, 1, 1,
0.4835548, 1.598093, -0.1042495, 1, 1, 1, 1, 1,
0.4869301, -2.223637, 4.206192, 1, 1, 1, 1, 1,
0.487913, 0.8286189, 1.429572, 1, 1, 1, 1, 1,
0.488728, -0.1105135, 3.072634, 1, 1, 1, 1, 1,
0.4933451, 0.1750002, 1.47754, 1, 1, 1, 1, 1,
0.4968671, -1.313187, 2.745144, 1, 1, 1, 1, 1,
0.4977523, 0.7572663, 0.3687534, 0, 0, 1, 1, 1,
0.4983702, 0.5737394, -0.00121327, 1, 0, 0, 1, 1,
0.5156371, 0.7942278, 1.618906, 1, 0, 0, 1, 1,
0.5174204, 1.519507, 0.1625884, 1, 0, 0, 1, 1,
0.5191761, -0.5420644, 2.818463, 1, 0, 0, 1, 1,
0.5202494, 1.079421, 1.451741, 1, 0, 0, 1, 1,
0.5265633, 1.779108, -0.3682389, 0, 0, 0, 1, 1,
0.5284297, -0.3599566, 4.341887, 0, 0, 0, 1, 1,
0.5326052, 1.267937, -0.1044725, 0, 0, 0, 1, 1,
0.5349652, -1.258578, 3.102062, 0, 0, 0, 1, 1,
0.5357527, 0.108392, 3.149994, 0, 0, 0, 1, 1,
0.5400511, -0.9304016, -0.5979545, 0, 0, 0, 1, 1,
0.5417347, 0.7092376, 0.3581536, 0, 0, 0, 1, 1,
0.5472021, 0.9353209, 1.074686, 1, 1, 1, 1, 1,
0.5498313, 0.6350135, 0.6095394, 1, 1, 1, 1, 1,
0.5509864, 1.012767, 0.5946055, 1, 1, 1, 1, 1,
0.5547151, -0.3088819, 2.85372, 1, 1, 1, 1, 1,
0.5607032, 1.756938, 1.80813, 1, 1, 1, 1, 1,
0.5615655, -0.5202164, 2.094923, 1, 1, 1, 1, 1,
0.5626136, -0.1748523, 1.264317, 1, 1, 1, 1, 1,
0.5633088, -0.1081444, 1.410231, 1, 1, 1, 1, 1,
0.5666859, 0.5345724, -0.527729, 1, 1, 1, 1, 1,
0.5667984, -0.908881, 1.358898, 1, 1, 1, 1, 1,
0.5697243, 0.9244794, -0.1182868, 1, 1, 1, 1, 1,
0.5716239, -0.1064979, 2.047557, 1, 1, 1, 1, 1,
0.5721715, -0.7909639, 2.527574, 1, 1, 1, 1, 1,
0.5739402, -1.536727, 2.262157, 1, 1, 1, 1, 1,
0.575446, -0.4401206, 4.559486, 1, 1, 1, 1, 1,
0.5786078, 1.49732, 0.6405842, 0, 0, 1, 1, 1,
0.580373, -0.9903727, 2.376536, 1, 0, 0, 1, 1,
0.5807602, -0.8457481, 1.951491, 1, 0, 0, 1, 1,
0.5840759, 0.8371485, -0.7541324, 1, 0, 0, 1, 1,
0.5904289, -0.3921954, 3.574828, 1, 0, 0, 1, 1,
0.5904951, -0.2095633, 3.128003, 1, 0, 0, 1, 1,
0.5924613, -1.115764, 3.456058, 0, 0, 0, 1, 1,
0.5946424, -0.8977984, 1.977918, 0, 0, 0, 1, 1,
0.5956201, 0.1427467, 1.709157, 0, 0, 0, 1, 1,
0.5965697, 0.135842, 1.537229, 0, 0, 0, 1, 1,
0.596616, -1.735434, 1.553319, 0, 0, 0, 1, 1,
0.5989619, 1.136157, 0.4047503, 0, 0, 0, 1, 1,
0.6000175, -0.2351296, -0.7557129, 0, 0, 0, 1, 1,
0.6027288, -0.5266998, 1.326502, 1, 1, 1, 1, 1,
0.6029638, 1.599361, -0.03795699, 1, 1, 1, 1, 1,
0.6049424, -0.4472224, 2.634257, 1, 1, 1, 1, 1,
0.6049756, -0.3885444, 2.751738, 1, 1, 1, 1, 1,
0.6056933, 0.4895498, 1.045464, 1, 1, 1, 1, 1,
0.606263, 2.496322, 2.380471, 1, 1, 1, 1, 1,
0.6066352, -0.1248161, 2.09629, 1, 1, 1, 1, 1,
0.6111999, -1.255283, 1.618696, 1, 1, 1, 1, 1,
0.6129308, 2.419962, 2.458185, 1, 1, 1, 1, 1,
0.6147587, 1.081453, -1.250113, 1, 1, 1, 1, 1,
0.6164399, 0.6119879, 1.684107, 1, 1, 1, 1, 1,
0.620182, 0.5575523, 1.339207, 1, 1, 1, 1, 1,
0.6220579, 0.2346447, 2.217184, 1, 1, 1, 1, 1,
0.6221707, 0.07529087, 0.7901027, 1, 1, 1, 1, 1,
0.6245204, 1.603264, -0.2847355, 1, 1, 1, 1, 1,
0.6253406, 0.5834213, 0.6924006, 0, 0, 1, 1, 1,
0.6261826, -0.5370936, 1.994528, 1, 0, 0, 1, 1,
0.6271533, 0.434541, 1.483697, 1, 0, 0, 1, 1,
0.6276657, 2.556106, -0.6377048, 1, 0, 0, 1, 1,
0.6331434, 0.3207164, 3.210469, 1, 0, 0, 1, 1,
0.635228, -1.047342, 3.279426, 1, 0, 0, 1, 1,
0.6368701, 0.02127063, 1.959788, 0, 0, 0, 1, 1,
0.6376191, -0.7205198, 2.853058, 0, 0, 0, 1, 1,
0.6446955, -0.7806464, 1.930821, 0, 0, 0, 1, 1,
0.6477504, 0.4329419, 1.445281, 0, 0, 0, 1, 1,
0.6546739, 1.017137, 1.713676, 0, 0, 0, 1, 1,
0.6581644, -1.079996, 3.35562, 0, 0, 0, 1, 1,
0.6619515, -0.1079731, 2.269096, 0, 0, 0, 1, 1,
0.66305, 1.057943, 1.030098, 1, 1, 1, 1, 1,
0.6648349, 0.6882387, 1.062076, 1, 1, 1, 1, 1,
0.6652836, -0.4362168, 2.654504, 1, 1, 1, 1, 1,
0.6671041, 0.7597082, 2.849644, 1, 1, 1, 1, 1,
0.6673887, 2.211515, 1.356361, 1, 1, 1, 1, 1,
0.6750758, 2.326697, 0.6186661, 1, 1, 1, 1, 1,
0.6751795, -0.1197427, 3.007851, 1, 1, 1, 1, 1,
0.6780131, 0.6914693, -0.2189652, 1, 1, 1, 1, 1,
0.6823324, 1.203098, 0.7688763, 1, 1, 1, 1, 1,
0.6850886, -0.82456, 1.698128, 1, 1, 1, 1, 1,
0.6857939, 2.067424, -1.200301, 1, 1, 1, 1, 1,
0.6872128, -0.05599791, 0.4723773, 1, 1, 1, 1, 1,
0.6874748, -0.4104628, 2.285383, 1, 1, 1, 1, 1,
0.6964188, -0.4729677, 1.657703, 1, 1, 1, 1, 1,
0.7012993, 1.221777, 0.8889828, 1, 1, 1, 1, 1,
0.7053552, -1.691527, 2.58647, 0, 0, 1, 1, 1,
0.7070878, 1.590005, 0.5670306, 1, 0, 0, 1, 1,
0.7151411, 0.177555, 1.033, 1, 0, 0, 1, 1,
0.7199382, 0.95311, 0.3818966, 1, 0, 0, 1, 1,
0.7213841, 0.3370359, 1.410055, 1, 0, 0, 1, 1,
0.7479038, -2.206748, 2.038702, 1, 0, 0, 1, 1,
0.7508666, -0.2089053, 1.544339, 0, 0, 0, 1, 1,
0.7533803, 0.5016217, -0.2282543, 0, 0, 0, 1, 1,
0.7539781, 0.03481924, 2.861405, 0, 0, 0, 1, 1,
0.7561444, -0.5660448, 0.8778308, 0, 0, 0, 1, 1,
0.7569464, 0.1393212, 1.859453, 0, 0, 0, 1, 1,
0.7594646, -0.2577045, 1.720849, 0, 0, 0, 1, 1,
0.7669973, 1.837316, -0.107763, 0, 0, 0, 1, 1,
0.7705728, -0.0584635, 1.152676, 1, 1, 1, 1, 1,
0.7758706, 0.03937511, 3.497263, 1, 1, 1, 1, 1,
0.7813684, 0.1287398, 1.655628, 1, 1, 1, 1, 1,
0.7821004, -0.3904043, 1.518633, 1, 1, 1, 1, 1,
0.7827992, 0.1939604, 1.239034, 1, 1, 1, 1, 1,
0.783237, 0.1905107, 2.080183, 1, 1, 1, 1, 1,
0.7860123, -1.004486, 0.5321451, 1, 1, 1, 1, 1,
0.8019593, 0.1548567, -0.5147918, 1, 1, 1, 1, 1,
0.8030637, -0.6451496, -0.2730452, 1, 1, 1, 1, 1,
0.8040909, -0.9697574, 2.38513, 1, 1, 1, 1, 1,
0.8046499, 0.3486966, 0.1175095, 1, 1, 1, 1, 1,
0.8068924, 0.9483179, 1.556346, 1, 1, 1, 1, 1,
0.8125002, -0.3858159, 1.967212, 1, 1, 1, 1, 1,
0.8206515, -0.03924114, 1.970263, 1, 1, 1, 1, 1,
0.8235665, 1.604513, 0.2339101, 1, 1, 1, 1, 1,
0.8278413, -1.103667, 1.694966, 0, 0, 1, 1, 1,
0.83171, 0.3758049, 1.770506, 1, 0, 0, 1, 1,
0.83881, 0.1705695, -0.5927097, 1, 0, 0, 1, 1,
0.8397186, -1.602988, 2.637666, 1, 0, 0, 1, 1,
0.8401735, -0.7189736, 2.987535, 1, 0, 0, 1, 1,
0.8477029, -0.005468183, 2.882161, 1, 0, 0, 1, 1,
0.8521938, 0.5735038, -0.0414632, 0, 0, 0, 1, 1,
0.8535228, 1.644511, 1.963897, 0, 0, 0, 1, 1,
0.8561758, 1.761963, 0.8660008, 0, 0, 0, 1, 1,
0.8595817, 0.277959, 0.3826928, 0, 0, 0, 1, 1,
0.8607424, 0.2744225, 1.167824, 0, 0, 0, 1, 1,
0.8635359, 0.5416403, 1.051438, 0, 0, 0, 1, 1,
0.8690137, 0.6427223, -0.4943609, 0, 0, 0, 1, 1,
0.8776888, 0.09265472, 2.280176, 1, 1, 1, 1, 1,
0.8875975, 1.541725, -0.4495704, 1, 1, 1, 1, 1,
0.8938831, -0.5302643, 1.3341, 1, 1, 1, 1, 1,
0.8942388, 0.7460271, 0.5417575, 1, 1, 1, 1, 1,
0.8945611, 0.5971702, 2.220557, 1, 1, 1, 1, 1,
0.9018227, 0.2321713, 2.305014, 1, 1, 1, 1, 1,
0.902418, -1.082628, 2.622924, 1, 1, 1, 1, 1,
0.9033514, -0.4168675, 3.546272, 1, 1, 1, 1, 1,
0.9073769, -0.6503959, 2.821317, 1, 1, 1, 1, 1,
0.9075404, -0.5873584, 0.585878, 1, 1, 1, 1, 1,
0.9106336, -1.185112, 2.201678, 1, 1, 1, 1, 1,
0.911555, 0.3867966, 2.633535, 1, 1, 1, 1, 1,
0.9126485, 1.822075, 1.091451, 1, 1, 1, 1, 1,
0.9172776, 0.4054726, 0.4981474, 1, 1, 1, 1, 1,
0.9182062, -1.110786, 3.358191, 1, 1, 1, 1, 1,
0.9341555, 0.3147912, 1.090094, 0, 0, 1, 1, 1,
0.9425035, -0.09715822, 2.524878, 1, 0, 0, 1, 1,
0.9426132, 1.894685, 0.1950473, 1, 0, 0, 1, 1,
0.9431216, 2.088231, -1.650366, 1, 0, 0, 1, 1,
0.9467331, 0.05808695, 1.423726, 1, 0, 0, 1, 1,
0.9527552, 1.495382, 1.134617, 1, 0, 0, 1, 1,
0.9559641, -0.1863602, 2.98817, 0, 0, 0, 1, 1,
0.9576644, 0.5447326, 1.690752, 0, 0, 0, 1, 1,
0.9670916, 0.8183947, 0.7544891, 0, 0, 0, 1, 1,
0.9773172, -0.7364749, 1.532509, 0, 0, 0, 1, 1,
0.979068, -1.473773, 2.375101, 0, 0, 0, 1, 1,
0.9992639, 1.437229, -0.2874598, 0, 0, 0, 1, 1,
1.000489, -0.7800719, 1.738251, 0, 0, 0, 1, 1,
1.01391, -1.126096, 4.099647, 1, 1, 1, 1, 1,
1.016268, -0.9200398, 2.242811, 1, 1, 1, 1, 1,
1.018758, 0.8650321, 1.243894, 1, 1, 1, 1, 1,
1.019542, -2.01645, 3.803056, 1, 1, 1, 1, 1,
1.027315, 0.3692419, 2.264874, 1, 1, 1, 1, 1,
1.031713, 1.46103, 1.526444, 1, 1, 1, 1, 1,
1.031845, -0.4255712, 0.440612, 1, 1, 1, 1, 1,
1.037045, -1.025252, 2.383521, 1, 1, 1, 1, 1,
1.040654, -0.9160135, 1.80272, 1, 1, 1, 1, 1,
1.043295, -1.70826, 3.113725, 1, 1, 1, 1, 1,
1.045243, 0.1681263, 3.044447, 1, 1, 1, 1, 1,
1.058826, -0.8455689, 1.027919, 1, 1, 1, 1, 1,
1.061313, 0.881986, -0.5021266, 1, 1, 1, 1, 1,
1.064721, 0.653157, 0.4459389, 1, 1, 1, 1, 1,
1.072564, 0.3022073, 3.017868, 1, 1, 1, 1, 1,
1.081181, 1.208444, -1.103033, 0, 0, 1, 1, 1,
1.092497, -1.306753, 1.706375, 1, 0, 0, 1, 1,
1.109413, -0.1541184, 2.107921, 1, 0, 0, 1, 1,
1.112112, -0.8901471, 1.638016, 1, 0, 0, 1, 1,
1.126527, 0.7644105, 0.6329473, 1, 0, 0, 1, 1,
1.127562, 1.140522, 0.4829716, 1, 0, 0, 1, 1,
1.132632, -1.163747, 1.795155, 0, 0, 0, 1, 1,
1.133309, 1.647709, 1.216017, 0, 0, 0, 1, 1,
1.135785, 1.429823, 0.6572415, 0, 0, 0, 1, 1,
1.138399, -0.607972, 2.573208, 0, 0, 0, 1, 1,
1.138669, 0.09928777, 0.8654407, 0, 0, 0, 1, 1,
1.142575, -0.7243595, 1.619561, 0, 0, 0, 1, 1,
1.149678, 0.3660199, 0.7116631, 0, 0, 0, 1, 1,
1.154646, 0.9152567, 2.725177, 1, 1, 1, 1, 1,
1.15775, -2.292432, 2.113175, 1, 1, 1, 1, 1,
1.161, -2.242632, 1.510586, 1, 1, 1, 1, 1,
1.162875, 0.4546241, 1.255941, 1, 1, 1, 1, 1,
1.166239, 0.3813075, 0.7169006, 1, 1, 1, 1, 1,
1.170032, 1.531308, 0.1255725, 1, 1, 1, 1, 1,
1.181706, -0.01337897, 1.067451, 1, 1, 1, 1, 1,
1.182624, 0.7696474, 2.922683, 1, 1, 1, 1, 1,
1.199785, -1.855138, 2.002017, 1, 1, 1, 1, 1,
1.205716, 0.4106402, 2.047987, 1, 1, 1, 1, 1,
1.218294, -0.1490323, -0.04871053, 1, 1, 1, 1, 1,
1.224874, -0.5325755, 1.439191, 1, 1, 1, 1, 1,
1.229285, 0.5021867, 0.6852845, 1, 1, 1, 1, 1,
1.233561, -0.901607, 2.929316, 1, 1, 1, 1, 1,
1.251177, 0.07230471, 2.507046, 1, 1, 1, 1, 1,
1.251458, 1.336557, 0.2879699, 0, 0, 1, 1, 1,
1.274697, 0.5992739, 0.8488435, 1, 0, 0, 1, 1,
1.277339, 0.2805372, 2.983337, 1, 0, 0, 1, 1,
1.278853, -0.675828, 1.139336, 1, 0, 0, 1, 1,
1.280537, -1.301025, 1.88316, 1, 0, 0, 1, 1,
1.284192, -0.3530354, 1.358948, 1, 0, 0, 1, 1,
1.287483, -0.8538967, 1.014596, 0, 0, 0, 1, 1,
1.300083, 0.5713701, 1.665595, 0, 0, 0, 1, 1,
1.303179, -0.06146996, 1.0241, 0, 0, 0, 1, 1,
1.31542, -0.6719554, 3.581618, 0, 0, 0, 1, 1,
1.344199, 0.1262848, 1.32034, 0, 0, 0, 1, 1,
1.34618, 1.795903, 1.248286, 0, 0, 0, 1, 1,
1.358844, -0.8202838, 2.808532, 0, 0, 0, 1, 1,
1.359099, 0.7664091, 0.7923009, 1, 1, 1, 1, 1,
1.363659, -2.124055, 3.129691, 1, 1, 1, 1, 1,
1.40563, -1.15892, 3.120655, 1, 1, 1, 1, 1,
1.406151, -1.413706, 2.993999, 1, 1, 1, 1, 1,
1.413996, 0.1130891, 2.129419, 1, 1, 1, 1, 1,
1.415328, 0.2378787, 1.282562, 1, 1, 1, 1, 1,
1.42285, 1.716654, -0.3357486, 1, 1, 1, 1, 1,
1.435572, 1.047089, 0.7301512, 1, 1, 1, 1, 1,
1.43644, -0.6657407, 0.8773248, 1, 1, 1, 1, 1,
1.444543, 1.38337, 2.064454, 1, 1, 1, 1, 1,
1.455638, 1.36491, 0.4548552, 1, 1, 1, 1, 1,
1.457272, -1.334742, 2.580036, 1, 1, 1, 1, 1,
1.465357, -1.80506, 5.011698, 1, 1, 1, 1, 1,
1.477457, -1.010404, 1.752025, 1, 1, 1, 1, 1,
1.483486, -0.5540074, 2.153677, 1, 1, 1, 1, 1,
1.506173, -0.3642147, 1.110273, 0, 0, 1, 1, 1,
1.526932, -0.08148561, 0.1998697, 1, 0, 0, 1, 1,
1.543256, 1.162305, 1.907642, 1, 0, 0, 1, 1,
1.551324, -0.2158645, 1.003275, 1, 0, 0, 1, 1,
1.555679, -0.1672262, 0.843941, 1, 0, 0, 1, 1,
1.562574, 1.136812, 0.6380395, 1, 0, 0, 1, 1,
1.576116, 0.7141513, 1.253667, 0, 0, 0, 1, 1,
1.590501, 1.322045, 0.9761432, 0, 0, 0, 1, 1,
1.620193, 1.760485, 1.080453, 0, 0, 0, 1, 1,
1.622618, 0.6667812, 0.05321979, 0, 0, 0, 1, 1,
1.627798, -0.6779305, 1.750926, 0, 0, 0, 1, 1,
1.641994, 0.7014339, 0.4826531, 0, 0, 0, 1, 1,
1.644802, -0.8870537, 2.497563, 0, 0, 0, 1, 1,
1.654626, 0.7515905, 1.635017, 1, 1, 1, 1, 1,
1.660043, -1.964226, 1.833338, 1, 1, 1, 1, 1,
1.660749, -0.2535738, 1.975391, 1, 1, 1, 1, 1,
1.667509, -0.7779526, 4.218061, 1, 1, 1, 1, 1,
1.671346, 0.5941339, 1.593501, 1, 1, 1, 1, 1,
1.680355, -0.1091644, 2.321155, 1, 1, 1, 1, 1,
1.700838, -1.917655, 2.891233, 1, 1, 1, 1, 1,
1.730419, 0.3454911, 0.9681077, 1, 1, 1, 1, 1,
1.741354, 0.5978296, 1.295531, 1, 1, 1, 1, 1,
1.752127, 0.1196405, 2.445092, 1, 1, 1, 1, 1,
1.808252, 1.426235, 2.662583, 1, 1, 1, 1, 1,
1.835886, -0.4631229, 1.70244, 1, 1, 1, 1, 1,
1.836611, 0.6350346, 1.583028, 1, 1, 1, 1, 1,
1.849383, 1.696597, 1.924252, 1, 1, 1, 1, 1,
1.897272, -0.6070755, 3.402524, 1, 1, 1, 1, 1,
1.940634, 1.074203, 1.288241, 0, 0, 1, 1, 1,
1.943722, -0.3739094, 2.505421, 1, 0, 0, 1, 1,
1.949751, 0.2483792, 3.035781, 1, 0, 0, 1, 1,
1.964831, -1.272224, 1.89795, 1, 0, 0, 1, 1,
2.000337, -0.5722395, 2.120726, 1, 0, 0, 1, 1,
2.008124, -0.2880791, 2.012844, 1, 0, 0, 1, 1,
2.055336, 0.7687307, 1.390285, 0, 0, 0, 1, 1,
2.252222, -0.1268862, 1.004546, 0, 0, 0, 1, 1,
2.295299, 0.1627539, 1.900239, 0, 0, 0, 1, 1,
2.315193, 0.756695, -0.322073, 0, 0, 0, 1, 1,
2.336764, 0.6109298, 0.21283, 0, 0, 0, 1, 1,
2.39894, 0.8129205, 0.1651727, 0, 0, 0, 1, 1,
2.415685, -1.523868, 2.080059, 0, 0, 0, 1, 1,
2.43043, -0.9015977, 1.935775, 1, 1, 1, 1, 1,
2.504249, 1.41703, -0.6981642, 1, 1, 1, 1, 1,
2.574666, 0.2150944, -0.8587199, 1, 1, 1, 1, 1,
2.655864, 0.3792569, 1.114543, 1, 1, 1, 1, 1,
2.667492, 0.8599099, 1.752273, 1, 1, 1, 1, 1,
2.678134, -1.797149, 1.167196, 1, 1, 1, 1, 1,
2.709152, 1.697514, 1.024243, 1, 1, 1, 1, 1
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
var radius = 9.525943;
var distance = 33.45947;
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
mvMatrix.translate( 0.3194102, 0.3782585, 0.2683384 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.45947);
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
