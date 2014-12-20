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
-2.936916, -0.1049059, -0.6917161, 1, 0, 0, 1,
-2.933335, -1.827347, -2.968876, 1, 0.007843138, 0, 1,
-2.695273, 0.5478339, -1.443474, 1, 0.01176471, 0, 1,
-2.497638, -2.510497, -1.173281, 1, 0.01960784, 0, 1,
-2.493899, 0.4119733, -1.592812, 1, 0.02352941, 0, 1,
-2.486653, 0.4927413, -2.78226, 1, 0.03137255, 0, 1,
-2.464545, 0.3602781, -2.34985, 1, 0.03529412, 0, 1,
-2.432899, 0.3487691, -1.363396, 1, 0.04313726, 0, 1,
-2.38519, -0.7507122, 0.3483311, 1, 0.04705882, 0, 1,
-2.350752, -0.9348502, -1.466184, 1, 0.05490196, 0, 1,
-2.336041, 1.242903, -0.958364, 1, 0.05882353, 0, 1,
-2.32464, 0.778715, -2.724542, 1, 0.06666667, 0, 1,
-2.290876, 0.1389206, -2.741016, 1, 0.07058824, 0, 1,
-2.251739, 1.040967, -0.5973959, 1, 0.07843138, 0, 1,
-2.239465, 1.886638, 1.507652, 1, 0.08235294, 0, 1,
-2.239291, -2.253417, -2.369032, 1, 0.09019608, 0, 1,
-2.227688, -0.2730051, -1.387362, 1, 0.09411765, 0, 1,
-2.225813, 1.144345, -0.6288718, 1, 0.1019608, 0, 1,
-2.22203, -1.820397, -2.983914, 1, 0.1098039, 0, 1,
-2.181959, -0.2832111, -1.141744, 1, 0.1137255, 0, 1,
-2.172707, -0.4137585, -2.489497, 1, 0.1215686, 0, 1,
-2.163407, 0.4396287, -2.248744, 1, 0.1254902, 0, 1,
-2.160618, 1.089794, 0.4799748, 1, 0.1333333, 0, 1,
-2.148893, 0.3927247, -0.1836849, 1, 0.1372549, 0, 1,
-2.142276, 0.1392704, -2.109524, 1, 0.145098, 0, 1,
-2.140438, -0.8057919, -2.479081, 1, 0.1490196, 0, 1,
-2.106376, -1.285032, -1.864616, 1, 0.1568628, 0, 1,
-2.03306, 0.03858104, -2.530793, 1, 0.1607843, 0, 1,
-2.027821, 1.223704, -1.637049, 1, 0.1686275, 0, 1,
-2.025844, 2.123356, -1.189346, 1, 0.172549, 0, 1,
-2.025267, -0.7061855, -1.939494, 1, 0.1803922, 0, 1,
-2.02401, 1.819234, -1.785246, 1, 0.1843137, 0, 1,
-2.019588, -0.9859012, -3.149074, 1, 0.1921569, 0, 1,
-1.971298, -0.4516059, -1.019832, 1, 0.1960784, 0, 1,
-1.970645, 0.1115322, 1.133552, 1, 0.2039216, 0, 1,
-1.959786, 1.013416, -0.07303762, 1, 0.2117647, 0, 1,
-1.931496, 0.2903122, 0.4892217, 1, 0.2156863, 0, 1,
-1.905315, -0.458508, -1.124222, 1, 0.2235294, 0, 1,
-1.890636, -2.47349, -2.375015, 1, 0.227451, 0, 1,
-1.887537, -0.06896604, -1.745906, 1, 0.2352941, 0, 1,
-1.88315, 1.17638, -0.03088149, 1, 0.2392157, 0, 1,
-1.864749, 0.2255346, -0.6756364, 1, 0.2470588, 0, 1,
-1.852363, -0.09119873, -0.7510839, 1, 0.2509804, 0, 1,
-1.808444, 1.459563, -0.3217271, 1, 0.2588235, 0, 1,
-1.804247, 0.1629557, -2.006958, 1, 0.2627451, 0, 1,
-1.765983, 1.250176, -1.039919, 1, 0.2705882, 0, 1,
-1.751051, -1.471442, -1.771423, 1, 0.2745098, 0, 1,
-1.737303, -0.5299273, -1.555889, 1, 0.282353, 0, 1,
-1.730942, 0.7674826, -0.4989457, 1, 0.2862745, 0, 1,
-1.72891, -2.125962, -3.407317, 1, 0.2941177, 0, 1,
-1.723304, 0.5591676, -0.4029535, 1, 0.3019608, 0, 1,
-1.704639, 0.2901895, -2.177742, 1, 0.3058824, 0, 1,
-1.670646, 0.1331887, -1.038243, 1, 0.3137255, 0, 1,
-1.658907, -0.2356684, -0.2930076, 1, 0.3176471, 0, 1,
-1.653745, 0.501961, 0.7894254, 1, 0.3254902, 0, 1,
-1.652639, -1.011718, -2.024605, 1, 0.3294118, 0, 1,
-1.647289, -2.124695, -3.070428, 1, 0.3372549, 0, 1,
-1.645084, -0.3475235, -3.682698, 1, 0.3411765, 0, 1,
-1.638826, -1.713439, -1.612473, 1, 0.3490196, 0, 1,
-1.618992, 0.430439, -1.580614, 1, 0.3529412, 0, 1,
-1.604709, 0.03468129, -2.95346, 1, 0.3607843, 0, 1,
-1.60355, 0.8658075, -1.346516, 1, 0.3647059, 0, 1,
-1.603414, 0.9869915, -0.1294906, 1, 0.372549, 0, 1,
-1.585483, -0.2518858, -3.675166, 1, 0.3764706, 0, 1,
-1.574347, 1.313823, -1.013808, 1, 0.3843137, 0, 1,
-1.560843, -1.314655, -1.586949, 1, 0.3882353, 0, 1,
-1.546339, -0.5418583, -0.963697, 1, 0.3960784, 0, 1,
-1.537624, -0.6108088, -0.6321581, 1, 0.4039216, 0, 1,
-1.537124, -0.1595078, -0.197276, 1, 0.4078431, 0, 1,
-1.536034, -0.7770453, -2.869687, 1, 0.4156863, 0, 1,
-1.519546, -1.097559, -2.040502, 1, 0.4196078, 0, 1,
-1.515978, -0.09562539, -1.655451, 1, 0.427451, 0, 1,
-1.500772, -0.6718321, -3.425722, 1, 0.4313726, 0, 1,
-1.495532, -1.48602, -2.219384, 1, 0.4392157, 0, 1,
-1.495212, 1.877756, -0.8723027, 1, 0.4431373, 0, 1,
-1.495002, -0.196644, -3.225389, 1, 0.4509804, 0, 1,
-1.489, 0.7917855, -0.4330119, 1, 0.454902, 0, 1,
-1.487066, -1.427202, -3.552463, 1, 0.4627451, 0, 1,
-1.478573, -1.781229, -1.443706, 1, 0.4666667, 0, 1,
-1.476998, 1.058786, -0.4587446, 1, 0.4745098, 0, 1,
-1.472489, -0.3638071, -1.464938, 1, 0.4784314, 0, 1,
-1.465425, 0.05596251, -2.232925, 1, 0.4862745, 0, 1,
-1.462273, 0.02429037, -1.201537, 1, 0.4901961, 0, 1,
-1.454414, -0.2350026, -1.041244, 1, 0.4980392, 0, 1,
-1.454394, -0.7776694, -1.631252, 1, 0.5058824, 0, 1,
-1.453302, -0.3571742, -1.796123, 1, 0.509804, 0, 1,
-1.448262, 0.5353593, -3.205386, 1, 0.5176471, 0, 1,
-1.446725, 0.1665477, -2.532053, 1, 0.5215687, 0, 1,
-1.443953, -1.141406, -1.332489, 1, 0.5294118, 0, 1,
-1.443113, 0.5018402, -2.473071, 1, 0.5333334, 0, 1,
-1.442639, 1.007263, 0.1486799, 1, 0.5411765, 0, 1,
-1.442028, 1.845943, 1.010514, 1, 0.5450981, 0, 1,
-1.437945, -1.303455, -3.223269, 1, 0.5529412, 0, 1,
-1.420748, -0.04936693, -2.981028, 1, 0.5568628, 0, 1,
-1.41879, -0.04760876, -1.96935, 1, 0.5647059, 0, 1,
-1.417527, -0.004561616, -1.699322, 1, 0.5686275, 0, 1,
-1.411482, -0.7119311, -0.4349368, 1, 0.5764706, 0, 1,
-1.410882, 0.2184747, -2.554835, 1, 0.5803922, 0, 1,
-1.4058, 1.707512, -0.4932534, 1, 0.5882353, 0, 1,
-1.403998, 0.9429427, -0.4409306, 1, 0.5921569, 0, 1,
-1.402999, 0.9815338, 1.267819, 1, 0.6, 0, 1,
-1.384908, 0.9641666, -0.7341111, 1, 0.6078432, 0, 1,
-1.384638, -0.906713, -2.415254, 1, 0.6117647, 0, 1,
-1.377273, -0.2586626, -1.242333, 1, 0.6196079, 0, 1,
-1.369383, -1.289889, -3.18694, 1, 0.6235294, 0, 1,
-1.361097, -0.5032797, -1.805771, 1, 0.6313726, 0, 1,
-1.360811, 0.3199165, -2.074819, 1, 0.6352941, 0, 1,
-1.351466, 1.15776, -1.890031, 1, 0.6431373, 0, 1,
-1.350366, -0.9347597, -2.219209, 1, 0.6470588, 0, 1,
-1.347316, -0.2043228, -3.246243, 1, 0.654902, 0, 1,
-1.324327, -2.059689, -2.249592, 1, 0.6588235, 0, 1,
-1.322551, -0.7265953, -1.618401, 1, 0.6666667, 0, 1,
-1.321152, -0.02974909, -1.887669, 1, 0.6705883, 0, 1,
-1.306642, -0.1730264, -0.6241494, 1, 0.6784314, 0, 1,
-1.304114, 0.5031872, -2.381067, 1, 0.682353, 0, 1,
-1.294127, -0.01470028, -1.77397, 1, 0.6901961, 0, 1,
-1.289264, 1.61547, -1.361059, 1, 0.6941177, 0, 1,
-1.282604, -1.275941, -1.315697, 1, 0.7019608, 0, 1,
-1.277819, -0.5733166, 0.00536356, 1, 0.7098039, 0, 1,
-1.27162, 0.3723768, -2.84386, 1, 0.7137255, 0, 1,
-1.261784, -1.419967, -2.476998, 1, 0.7215686, 0, 1,
-1.261341, 1.233369, 0.6510286, 1, 0.7254902, 0, 1,
-1.255548, 1.552443, -0.1399832, 1, 0.7333333, 0, 1,
-1.248915, -0.05981599, -3.431686, 1, 0.7372549, 0, 1,
-1.238214, -0.736957, -1.28448, 1, 0.7450981, 0, 1,
-1.234109, 0.689727, -2.21089, 1, 0.7490196, 0, 1,
-1.232914, 0.3415649, -0.9017181, 1, 0.7568628, 0, 1,
-1.228112, 0.5880843, -0.8419873, 1, 0.7607843, 0, 1,
-1.227726, 1.497772, -1.060395, 1, 0.7686275, 0, 1,
-1.219375, -1.571641, -1.187184, 1, 0.772549, 0, 1,
-1.217734, -0.5309375, -2.777051, 1, 0.7803922, 0, 1,
-1.215029, -1.086633, -2.184171, 1, 0.7843137, 0, 1,
-1.213339, -1.629149, -3.170849, 1, 0.7921569, 0, 1,
-1.201266, -0.0288469, -1.485552, 1, 0.7960784, 0, 1,
-1.195302, -0.8215813, -1.443093, 1, 0.8039216, 0, 1,
-1.193522, 1.511665, 0.5730488, 1, 0.8117647, 0, 1,
-1.19038, 0.3706094, -1.46672, 1, 0.8156863, 0, 1,
-1.182783, 0.6724347, -1.029657, 1, 0.8235294, 0, 1,
-1.175894, -0.2261086, -1.402516, 1, 0.827451, 0, 1,
-1.174889, -0.8207579, -1.879062, 1, 0.8352941, 0, 1,
-1.173866, -0.1984179, -2.313528, 1, 0.8392157, 0, 1,
-1.16782, -1.138462, -2.116111, 1, 0.8470588, 0, 1,
-1.160162, 0.1011254, -1.220325, 1, 0.8509804, 0, 1,
-1.159351, 1.726627, 0.8587574, 1, 0.8588235, 0, 1,
-1.157444, -0.003329912, -1.584936, 1, 0.8627451, 0, 1,
-1.157294, -1.146911, -3.077461, 1, 0.8705882, 0, 1,
-1.140396, -0.5863781, -1.515755, 1, 0.8745098, 0, 1,
-1.136532, -0.1350963, -1.73781, 1, 0.8823529, 0, 1,
-1.135755, -0.1416864, -0.986074, 1, 0.8862745, 0, 1,
-1.132112, 0.870416, -1.721502, 1, 0.8941177, 0, 1,
-1.129836, -0.486096, -2.717893, 1, 0.8980392, 0, 1,
-1.116605, -1.124378, -0.6434426, 1, 0.9058824, 0, 1,
-1.114569, -0.144647, -1.914001, 1, 0.9137255, 0, 1,
-1.101908, 0.3556198, -0.3208362, 1, 0.9176471, 0, 1,
-1.088326, 1.200178, -1.885016, 1, 0.9254902, 0, 1,
-1.087553, 0.6318082, 0.2499325, 1, 0.9294118, 0, 1,
-1.086535, -0.4914539, -1.544716, 1, 0.9372549, 0, 1,
-1.078743, 1.111915, -1.462758, 1, 0.9411765, 0, 1,
-1.078708, 1.587905, -0.5524597, 1, 0.9490196, 0, 1,
-1.07758, 2.74295, 0.2411741, 1, 0.9529412, 0, 1,
-1.072899, 0.8599813, -2.14353, 1, 0.9607843, 0, 1,
-1.07022, 0.9467782, 0.4139428, 1, 0.9647059, 0, 1,
-1.04755, 0.1690324, -1.409477, 1, 0.972549, 0, 1,
-1.043755, -1.171259, -0.5138552, 1, 0.9764706, 0, 1,
-1.042233, 0.2491501, -0.7870134, 1, 0.9843137, 0, 1,
-1.033856, 1.135451, 0.08647101, 1, 0.9882353, 0, 1,
-1.031911, 0.8334854, -0.1605263, 1, 0.9960784, 0, 1,
-1.031095, 0.5212206, 1.086361, 0.9960784, 1, 0, 1,
-1.027774, 0.5100436, -1.333066, 0.9921569, 1, 0, 1,
-1.01708, -0.09137721, -1.704287, 0.9843137, 1, 0, 1,
-1.00857, 0.5241777, -2.883527, 0.9803922, 1, 0, 1,
-1.004286, -1.132044, -2.933048, 0.972549, 1, 0, 1,
-0.9967262, -0.9172859, -0.8458013, 0.9686275, 1, 0, 1,
-0.9945159, 0.01924687, -0.2283763, 0.9607843, 1, 0, 1,
-0.9902565, -0.8667363, -3.923827, 0.9568627, 1, 0, 1,
-0.9870046, 0.8338827, -0.4453842, 0.9490196, 1, 0, 1,
-0.9844937, -0.8954462, -1.771009, 0.945098, 1, 0, 1,
-0.9731539, -3.584538, -4.506985, 0.9372549, 1, 0, 1,
-0.9673864, 0.5851727, -2.529558, 0.9333333, 1, 0, 1,
-0.9649999, 0.3363841, 0.2569726, 0.9254902, 1, 0, 1,
-0.9649255, -0.1595719, -2.884235, 0.9215686, 1, 0, 1,
-0.9550427, -0.9038687, -4.424372, 0.9137255, 1, 0, 1,
-0.9538276, -0.9404787, -1.312905, 0.9098039, 1, 0, 1,
-0.9476658, 2.678112, -0.04505839, 0.9019608, 1, 0, 1,
-0.9384539, 0.7560868, -0.04993911, 0.8941177, 1, 0, 1,
-0.937535, 0.09816554, -1.532519, 0.8901961, 1, 0, 1,
-0.9344506, 1.892682, -1.859407, 0.8823529, 1, 0, 1,
-0.9323761, -1.711996, -3.394703, 0.8784314, 1, 0, 1,
-0.9302816, -1.157067, -2.564642, 0.8705882, 1, 0, 1,
-0.9248809, -0.8138196, -0.7513655, 0.8666667, 1, 0, 1,
-0.9137208, -0.2864536, -2.144539, 0.8588235, 1, 0, 1,
-0.903054, 1.675701, -1.572196, 0.854902, 1, 0, 1,
-0.9024619, 0.8202479, -0.7860737, 0.8470588, 1, 0, 1,
-0.9016066, 0.2522215, -1.465, 0.8431373, 1, 0, 1,
-0.8972198, -0.3438077, -0.9514704, 0.8352941, 1, 0, 1,
-0.8971924, 0.7816532, -1.710105, 0.8313726, 1, 0, 1,
-0.892451, 0.6265435, -2.682813, 0.8235294, 1, 0, 1,
-0.8866872, -1.322884, -4.354092, 0.8196079, 1, 0, 1,
-0.8801365, 0.9666146, 0.3035891, 0.8117647, 1, 0, 1,
-0.8789976, 1.575865, -0.01698648, 0.8078431, 1, 0, 1,
-0.8760989, 1.333035, -1.290439, 0.8, 1, 0, 1,
-0.8719458, -0.6233563, -2.117061, 0.7921569, 1, 0, 1,
-0.8658789, -1.417838, -3.186734, 0.7882353, 1, 0, 1,
-0.8645759, 0.2215697, -1.892973, 0.7803922, 1, 0, 1,
-0.8616549, 1.004571, 0.4260788, 0.7764706, 1, 0, 1,
-0.8596141, -1.110213, -2.104829, 0.7686275, 1, 0, 1,
-0.8507162, -0.8820104, -2.811101, 0.7647059, 1, 0, 1,
-0.85046, -0.734646, -2.332998, 0.7568628, 1, 0, 1,
-0.8426569, -0.06243384, -2.344263, 0.7529412, 1, 0, 1,
-0.8174272, -0.7166309, -3.449986, 0.7450981, 1, 0, 1,
-0.8145623, -0.5144201, -2.65641, 0.7411765, 1, 0, 1,
-0.8144559, 0.6541013, 1.015402, 0.7333333, 1, 0, 1,
-0.8129413, -0.7709838, -2.603377, 0.7294118, 1, 0, 1,
-0.8082859, -0.2758283, -2.995531, 0.7215686, 1, 0, 1,
-0.8059658, 0.6264426, -1.310809, 0.7176471, 1, 0, 1,
-0.8056976, -0.02874176, 0.1341439, 0.7098039, 1, 0, 1,
-0.8036941, -1.1346, -2.030923, 0.7058824, 1, 0, 1,
-0.8027138, -0.8452687, -1.411731, 0.6980392, 1, 0, 1,
-0.7997421, -0.1908379, -1.541559, 0.6901961, 1, 0, 1,
-0.7972406, 0.5091636, -1.164004, 0.6862745, 1, 0, 1,
-0.7945026, -0.1900589, -2.232693, 0.6784314, 1, 0, 1,
-0.7940974, -0.5270327, -0.9062093, 0.6745098, 1, 0, 1,
-0.7922728, -0.3528951, -3.606073, 0.6666667, 1, 0, 1,
-0.7905275, 0.2683373, -0.5607439, 0.6627451, 1, 0, 1,
-0.7852502, 0.06498428, -1.214073, 0.654902, 1, 0, 1,
-0.7816328, 0.1571199, -1.699282, 0.6509804, 1, 0, 1,
-0.7813786, 0.5615304, -0.0520751, 0.6431373, 1, 0, 1,
-0.7789704, 0.3051791, -1.37062, 0.6392157, 1, 0, 1,
-0.7766438, -1.343346, -2.732197, 0.6313726, 1, 0, 1,
-0.7708964, -1.08567, -1.968605, 0.627451, 1, 0, 1,
-0.7684064, -0.5027743, -1.990962, 0.6196079, 1, 0, 1,
-0.7660464, 1.034775, -0.9105245, 0.6156863, 1, 0, 1,
-0.7643191, -0.5175946, -3.981599, 0.6078432, 1, 0, 1,
-0.7587851, 0.5899609, -0.6582836, 0.6039216, 1, 0, 1,
-0.7572341, 0.2050573, -1.836511, 0.5960785, 1, 0, 1,
-0.7488726, 1.047925, -1.532392, 0.5882353, 1, 0, 1,
-0.7390869, 0.4455084, -1.235855, 0.5843138, 1, 0, 1,
-0.7358138, -0.6039563, -4.144881, 0.5764706, 1, 0, 1,
-0.7287378, -0.5576424, -1.758114, 0.572549, 1, 0, 1,
-0.7251556, 0.6587563, -0.5398467, 0.5647059, 1, 0, 1,
-0.7209873, 0.8221524, -1.49754, 0.5607843, 1, 0, 1,
-0.7189417, -1.077386, -2.098218, 0.5529412, 1, 0, 1,
-0.7188085, -1.667543, -3.490534, 0.5490196, 1, 0, 1,
-0.7108259, -0.5150803, -0.708903, 0.5411765, 1, 0, 1,
-0.7092809, 1.146558, -0.9021253, 0.5372549, 1, 0, 1,
-0.7073397, 0.6631795, 0.8306565, 0.5294118, 1, 0, 1,
-0.7057387, -0.0144526, -0.1478358, 0.5254902, 1, 0, 1,
-0.7045146, 0.1634736, -0.4947627, 0.5176471, 1, 0, 1,
-0.7005414, -0.4599942, -3.047592, 0.5137255, 1, 0, 1,
-0.6998734, 2.246625, -0.1135032, 0.5058824, 1, 0, 1,
-0.6983464, 0.2110622, -1.260705, 0.5019608, 1, 0, 1,
-0.6892132, -2.038888, -1.312402, 0.4941176, 1, 0, 1,
-0.68893, 0.07887969, -1.126367, 0.4862745, 1, 0, 1,
-0.6862738, 0.8419498, -0.8060828, 0.4823529, 1, 0, 1,
-0.6820679, -1.09912, -2.638728, 0.4745098, 1, 0, 1,
-0.6791491, -1.639084, -2.517219, 0.4705882, 1, 0, 1,
-0.6700595, 1.089764, -0.820015, 0.4627451, 1, 0, 1,
-0.668747, 0.3947897, -1.8978, 0.4588235, 1, 0, 1,
-0.6635144, -1.2063, -1.512468, 0.4509804, 1, 0, 1,
-0.660987, -0.9970764, -2.263085, 0.4470588, 1, 0, 1,
-0.6586788, -1.278253, -2.694343, 0.4392157, 1, 0, 1,
-0.6583937, 0.1151312, -1.04984, 0.4352941, 1, 0, 1,
-0.6573554, 0.03479808, -2.333572, 0.427451, 1, 0, 1,
-0.6534528, 0.119377, 0.5005414, 0.4235294, 1, 0, 1,
-0.6483691, 0.07401959, -1.02993, 0.4156863, 1, 0, 1,
-0.6472732, 0.6684316, 0.1171596, 0.4117647, 1, 0, 1,
-0.638454, -1.897654, -2.379441, 0.4039216, 1, 0, 1,
-0.6321196, -1.089566, -2.764866, 0.3960784, 1, 0, 1,
-0.6306457, -0.1352565, -1.599157, 0.3921569, 1, 0, 1,
-0.6203166, 0.04735582, -1.915844, 0.3843137, 1, 0, 1,
-0.6145877, 1.398981, -1.649451, 0.3803922, 1, 0, 1,
-0.6124382, -0.67469, -3.296468, 0.372549, 1, 0, 1,
-0.6085687, 0.1154206, -1.239553, 0.3686275, 1, 0, 1,
-0.5991222, -1.573696, -0.5642015, 0.3607843, 1, 0, 1,
-0.5966287, 0.208545, -0.5247881, 0.3568628, 1, 0, 1,
-0.596236, 0.4435369, -0.8952249, 0.3490196, 1, 0, 1,
-0.5855442, -0.5895936, -1.195213, 0.345098, 1, 0, 1,
-0.5758719, -1.498441, -1.873644, 0.3372549, 1, 0, 1,
-0.573582, -0.5980395, -3.005093, 0.3333333, 1, 0, 1,
-0.5713091, 1.578982, 0.5086656, 0.3254902, 1, 0, 1,
-0.5708541, 0.0780139, -0.6093771, 0.3215686, 1, 0, 1,
-0.5695603, -0.07724938, -2.955116, 0.3137255, 1, 0, 1,
-0.5689471, -0.7977589, -2.115541, 0.3098039, 1, 0, 1,
-0.5685526, -0.843887, -1.404023, 0.3019608, 1, 0, 1,
-0.5670658, -1.314906, -2.94695, 0.2941177, 1, 0, 1,
-0.5608525, 0.3705286, 0.528909, 0.2901961, 1, 0, 1,
-0.5565091, 1.64493, 0.2114695, 0.282353, 1, 0, 1,
-0.5538632, -1.781149, -3.052768, 0.2784314, 1, 0, 1,
-0.5530265, 0.3328592, -2.886431, 0.2705882, 1, 0, 1,
-0.5506442, 1.197586, 0.2002014, 0.2666667, 1, 0, 1,
-0.5499203, 0.2970706, -2.29207, 0.2588235, 1, 0, 1,
-0.5328622, -0.35306, -1.21956, 0.254902, 1, 0, 1,
-0.5327334, -0.5465313, -1.960917, 0.2470588, 1, 0, 1,
-0.5248153, 0.290255, 0.3313782, 0.2431373, 1, 0, 1,
-0.5239093, 0.8006383, -1.733617, 0.2352941, 1, 0, 1,
-0.5153783, -1.600025, -2.885574, 0.2313726, 1, 0, 1,
-0.5137472, 0.2175056, -0.8910252, 0.2235294, 1, 0, 1,
-0.5122185, -0.8983954, -3.745878, 0.2196078, 1, 0, 1,
-0.5101399, 0.9583762, -1.515582, 0.2117647, 1, 0, 1,
-0.5082357, 1.424249, 1.341119, 0.2078431, 1, 0, 1,
-0.5080249, -0.198407, -1.428939, 0.2, 1, 0, 1,
-0.5046026, -0.9732834, -2.981768, 0.1921569, 1, 0, 1,
-0.5033919, 0.511548, -1.503811, 0.1882353, 1, 0, 1,
-0.499345, -0.8344722, -3.230563, 0.1803922, 1, 0, 1,
-0.4976113, -0.02711861, -0.21339, 0.1764706, 1, 0, 1,
-0.496288, 1.369225, -0.8177717, 0.1686275, 1, 0, 1,
-0.4945866, 2.391027, -1.763411, 0.1647059, 1, 0, 1,
-0.489108, -0.1583811, -2.846553, 0.1568628, 1, 0, 1,
-0.4888748, 1.43593, 0.8911353, 0.1529412, 1, 0, 1,
-0.4872637, -0.4503701, -1.172766, 0.145098, 1, 0, 1,
-0.4866539, -0.9716278, -1.181825, 0.1411765, 1, 0, 1,
-0.485073, 1.41838, -0.6991854, 0.1333333, 1, 0, 1,
-0.4811438, 1.660238, 0.4721048, 0.1294118, 1, 0, 1,
-0.4788894, 1.334313, -2.324589, 0.1215686, 1, 0, 1,
-0.4756052, -0.09178474, -2.634856, 0.1176471, 1, 0, 1,
-0.4734452, -0.6920614, -2.960986, 0.1098039, 1, 0, 1,
-0.4716022, -0.3690927, -1.053093, 0.1058824, 1, 0, 1,
-0.4705692, -0.7147195, -2.726269, 0.09803922, 1, 0, 1,
-0.469175, -1.148888, -2.370692, 0.09019608, 1, 0, 1,
-0.4688179, 1.191981, -0.05374935, 0.08627451, 1, 0, 1,
-0.4673367, 0.09903561, -1.86262, 0.07843138, 1, 0, 1,
-0.4649741, 0.6450062, -3.28198, 0.07450981, 1, 0, 1,
-0.4586236, -0.3770859, -1.395166, 0.06666667, 1, 0, 1,
-0.4582042, 0.4253612, -0.09782601, 0.0627451, 1, 0, 1,
-0.4573914, -1.04699, -4.959295, 0.05490196, 1, 0, 1,
-0.4544924, 0.1374687, -4.104628, 0.05098039, 1, 0, 1,
-0.4528059, 0.1765404, -2.822535, 0.04313726, 1, 0, 1,
-0.4515975, 0.2317855, -2.311297, 0.03921569, 1, 0, 1,
-0.448844, 0.137563, -0.9686807, 0.03137255, 1, 0, 1,
-0.444953, -0.7070512, -1.839381, 0.02745098, 1, 0, 1,
-0.4435449, -0.6257899, -4.267271, 0.01960784, 1, 0, 1,
-0.4435122, 1.082159, -1.505642, 0.01568628, 1, 0, 1,
-0.4387352, -0.6199834, -3.389705, 0.007843138, 1, 0, 1,
-0.4359264, 2.064463, -0.5095397, 0.003921569, 1, 0, 1,
-0.4351049, -0.5115127, -3.212444, 0, 1, 0.003921569, 1,
-0.4332637, 0.4800238, -1.544876, 0, 1, 0.01176471, 1,
-0.4303441, -0.378181, -0.6869999, 0, 1, 0.01568628, 1,
-0.4216661, -0.2302255, -1.738002, 0, 1, 0.02352941, 1,
-0.4185022, 0.06920459, -0.6294155, 0, 1, 0.02745098, 1,
-0.4115434, -0.5007454, -3.941702, 0, 1, 0.03529412, 1,
-0.4112881, 1.853011, -1.32119, 0, 1, 0.03921569, 1,
-0.4109329, -0.2598527, -2.072931, 0, 1, 0.04705882, 1,
-0.4077066, -0.1610279, -3.089062, 0, 1, 0.05098039, 1,
-0.4070753, 1.088343, 0.888481, 0, 1, 0.05882353, 1,
-0.4030446, -1.335771, -2.259241, 0, 1, 0.0627451, 1,
-0.4009072, -0.4388016, -1.340073, 0, 1, 0.07058824, 1,
-0.4008167, -1.693107, -3.113346, 0, 1, 0.07450981, 1,
-0.3956889, 0.2481062, -2.288558, 0, 1, 0.08235294, 1,
-0.3941627, -0.3349972, -3.141676, 0, 1, 0.08627451, 1,
-0.3921808, 0.5589337, -2.005332, 0, 1, 0.09411765, 1,
-0.3884318, -1.137134, -1.890174, 0, 1, 0.1019608, 1,
-0.3856341, 1.25878, -1.003534, 0, 1, 0.1058824, 1,
-0.3818675, 1.494197, -1.303005, 0, 1, 0.1137255, 1,
-0.3793803, -0.6318749, -3.435248, 0, 1, 0.1176471, 1,
-0.3719983, -0.8633005, -3.411539, 0, 1, 0.1254902, 1,
-0.3704856, -0.5226544, -1.222661, 0, 1, 0.1294118, 1,
-0.3696768, -0.06668182, -1.781351, 0, 1, 0.1372549, 1,
-0.3620629, -1.980328, -4.258641, 0, 1, 0.1411765, 1,
-0.3616151, 1.818517, 0.7576811, 0, 1, 0.1490196, 1,
-0.3594249, -1.245456, -2.498482, 0, 1, 0.1529412, 1,
-0.3582065, -1.126539, -4.532522, 0, 1, 0.1607843, 1,
-0.3533362, 0.03415837, -1.822137, 0, 1, 0.1647059, 1,
-0.3510669, -0.1770156, -3.181071, 0, 1, 0.172549, 1,
-0.3500637, 0.5587827, 0.3031248, 0, 1, 0.1764706, 1,
-0.3494015, 0.3199977, -2.228067, 0, 1, 0.1843137, 1,
-0.3480216, -0.3466269, -1.769234, 0, 1, 0.1882353, 1,
-0.3455884, 0.7565962, 1.133222, 0, 1, 0.1960784, 1,
-0.3406648, -0.3472568, -2.684934, 0, 1, 0.2039216, 1,
-0.3359986, -1.037575, -2.470484, 0, 1, 0.2078431, 1,
-0.3330216, -0.2950181, -1.522213, 0, 1, 0.2156863, 1,
-0.3321256, 0.8199754, 0.04812243, 0, 1, 0.2196078, 1,
-0.3307712, -0.2601604, -3.07181, 0, 1, 0.227451, 1,
-0.3275709, 0.6329062, -1.327931, 0, 1, 0.2313726, 1,
-0.3230881, -0.3779327, -2.590408, 0, 1, 0.2392157, 1,
-0.3101063, -0.5051848, -2.529352, 0, 1, 0.2431373, 1,
-0.3041941, 0.3295794, 1.212141, 0, 1, 0.2509804, 1,
-0.3015103, -0.2385712, -1.29047, 0, 1, 0.254902, 1,
-0.2948338, 0.5428373, 0.3611478, 0, 1, 0.2627451, 1,
-0.2917561, 0.6561296, 0.225731, 0, 1, 0.2666667, 1,
-0.2917458, -0.9089466, -4.24487, 0, 1, 0.2745098, 1,
-0.2903968, -0.09636835, -0.6598207, 0, 1, 0.2784314, 1,
-0.28913, 0.5434025, 1.002798, 0, 1, 0.2862745, 1,
-0.2839207, 1.217315, 0.02583448, 0, 1, 0.2901961, 1,
-0.2823949, -0.1796678, -3.323874, 0, 1, 0.2980392, 1,
-0.2807766, -0.3021054, -3.905112, 0, 1, 0.3058824, 1,
-0.2803779, 0.05122692, -0.3899582, 0, 1, 0.3098039, 1,
-0.2783329, -1.290385, -3.579513, 0, 1, 0.3176471, 1,
-0.2762794, 0.1836311, -1.668506, 0, 1, 0.3215686, 1,
-0.2725958, -1.159617, -2.238456, 0, 1, 0.3294118, 1,
-0.2668866, -1.147415, -3.052502, 0, 1, 0.3333333, 1,
-0.2663338, 0.8256756, -0.06481767, 0, 1, 0.3411765, 1,
-0.2656492, 1.899091, 0.05920868, 0, 1, 0.345098, 1,
-0.2638183, 1.030992, 0.2803521, 0, 1, 0.3529412, 1,
-0.2636202, 0.8588333, 0.5360087, 0, 1, 0.3568628, 1,
-0.262796, -1.457752, -1.03787, 0, 1, 0.3647059, 1,
-0.2626362, 1.996872, -0.9360801, 0, 1, 0.3686275, 1,
-0.2613539, 0.3052208, -1.158331, 0, 1, 0.3764706, 1,
-0.2594877, -0.06182755, -2.469539, 0, 1, 0.3803922, 1,
-0.2521411, 0.8145246, 0.9084197, 0, 1, 0.3882353, 1,
-0.2468869, -1.039878, -3.434552, 0, 1, 0.3921569, 1,
-0.2468451, 0.1140888, -1.192358, 0, 1, 0.4, 1,
-0.2367894, -0.195577, -1.271157, 0, 1, 0.4078431, 1,
-0.234716, 0.8507594, 0.0865384, 0, 1, 0.4117647, 1,
-0.234445, 0.3917988, 0.8720973, 0, 1, 0.4196078, 1,
-0.2321048, 0.7794987, -2.448075, 0, 1, 0.4235294, 1,
-0.2300097, 1.688004, 0.9912618, 0, 1, 0.4313726, 1,
-0.2276333, -0.5411618, -2.483856, 0, 1, 0.4352941, 1,
-0.2231345, 0.3481157, 0.4270812, 0, 1, 0.4431373, 1,
-0.2194696, -0.4437399, -0.2280467, 0, 1, 0.4470588, 1,
-0.216063, 2.498797, -0.1479434, 0, 1, 0.454902, 1,
-0.2112301, 0.8122022, -0.5358288, 0, 1, 0.4588235, 1,
-0.2051793, 0.0816782, -0.03277779, 0, 1, 0.4666667, 1,
-0.2029172, 0.9488683, -0.771181, 0, 1, 0.4705882, 1,
-0.2020784, -0.1506592, -1.997697, 0, 1, 0.4784314, 1,
-0.2013532, -1.011997, -3.817877, 0, 1, 0.4823529, 1,
-0.2012272, 0.4462493, -0.7048559, 0, 1, 0.4901961, 1,
-0.1997907, 1.576818, -0.3173856, 0, 1, 0.4941176, 1,
-0.1996954, -0.6166362, -4.022744, 0, 1, 0.5019608, 1,
-0.1995671, -0.1339613, -1.8611, 0, 1, 0.509804, 1,
-0.1977143, 1.859491, 2.032603, 0, 1, 0.5137255, 1,
-0.1961786, 0.1647944, -0.05913759, 0, 1, 0.5215687, 1,
-0.1952557, -0.1001988, -1.204597, 0, 1, 0.5254902, 1,
-0.191298, 0.6529564, 0.3539506, 0, 1, 0.5333334, 1,
-0.1902894, 0.3510664, -1.752357, 0, 1, 0.5372549, 1,
-0.1896838, -1.49104, -2.911329, 0, 1, 0.5450981, 1,
-0.1886656, 0.2668261, -3.17085, 0, 1, 0.5490196, 1,
-0.1876891, 0.8362878, 2.041072, 0, 1, 0.5568628, 1,
-0.1870753, -0.4272014, -1.775069, 0, 1, 0.5607843, 1,
-0.1868273, 0.581479, -2.847575, 0, 1, 0.5686275, 1,
-0.1838797, 0.5668753, 0.09857877, 0, 1, 0.572549, 1,
-0.1799556, 0.1455476, -1.205921, 0, 1, 0.5803922, 1,
-0.1790516, 0.03726474, -2.611715, 0, 1, 0.5843138, 1,
-0.1782535, -0.3254171, -3.079476, 0, 1, 0.5921569, 1,
-0.1759895, 1.851319, -1.271156, 0, 1, 0.5960785, 1,
-0.1729743, -1.301775, -3.546124, 0, 1, 0.6039216, 1,
-0.1716699, -1.08563, -4.429778, 0, 1, 0.6117647, 1,
-0.1641915, -0.5612323, -5.60442, 0, 1, 0.6156863, 1,
-0.1605805, -0.1294235, -3.140981, 0, 1, 0.6235294, 1,
-0.1594574, 1.300849, 0.7918242, 0, 1, 0.627451, 1,
-0.1572383, 0.7180615, 0.2425796, 0, 1, 0.6352941, 1,
-0.1565787, 0.4751214, -0.2199696, 0, 1, 0.6392157, 1,
-0.1540531, -1.981752, -3.001449, 0, 1, 0.6470588, 1,
-0.1526796, 0.3143116, -0.6788784, 0, 1, 0.6509804, 1,
-0.1498318, 1.146283, -1.302623, 0, 1, 0.6588235, 1,
-0.1495428, -0.09497442, -1.676041, 0, 1, 0.6627451, 1,
-0.1489958, 0.1502887, -0.7265242, 0, 1, 0.6705883, 1,
-0.1480734, -0.8858504, -2.809811, 0, 1, 0.6745098, 1,
-0.1476243, 0.002813216, -1.771814, 0, 1, 0.682353, 1,
-0.1470361, -0.06977608, -2.506058, 0, 1, 0.6862745, 1,
-0.1418806, -0.3100193, -1.628971, 0, 1, 0.6941177, 1,
-0.1416731, -0.2611517, -2.469486, 0, 1, 0.7019608, 1,
-0.1396518, 1.371901, -0.6310137, 0, 1, 0.7058824, 1,
-0.1388027, -0.6723426, -2.777883, 0, 1, 0.7137255, 1,
-0.137049, -1.134969, -1.641196, 0, 1, 0.7176471, 1,
-0.1336601, 0.2804224, 0.6329533, 0, 1, 0.7254902, 1,
-0.1327366, 1.839798, 1.07509, 0, 1, 0.7294118, 1,
-0.1316403, -0.7234172, -3.991364, 0, 1, 0.7372549, 1,
-0.1294043, 0.8710917, 2.474223, 0, 1, 0.7411765, 1,
-0.1252909, -0.8463749, -2.944587, 0, 1, 0.7490196, 1,
-0.124438, 0.7084433, 0.7782013, 0, 1, 0.7529412, 1,
-0.1223978, -0.9472458, -3.414198, 0, 1, 0.7607843, 1,
-0.1204375, 0.6937941, -0.8989243, 0, 1, 0.7647059, 1,
-0.1186449, -2.160334, -2.912564, 0, 1, 0.772549, 1,
-0.1180615, 0.6402971, -1.094588, 0, 1, 0.7764706, 1,
-0.1154433, 0.3054581, -0.3814578, 0, 1, 0.7843137, 1,
-0.1130892, -1.68334, -2.24351, 0, 1, 0.7882353, 1,
-0.1076215, -0.3858072, -3.313351, 0, 1, 0.7960784, 1,
-0.1050451, 1.356723, -1.260407, 0, 1, 0.8039216, 1,
-0.1049362, -1.376821, -3.539811, 0, 1, 0.8078431, 1,
-0.1000824, -0.6957192, -1.485088, 0, 1, 0.8156863, 1,
-0.09710737, 0.4399306, 0.3265571, 0, 1, 0.8196079, 1,
-0.09699868, -0.7503125, -1.886297, 0, 1, 0.827451, 1,
-0.09630764, -0.3372881, -4.002866, 0, 1, 0.8313726, 1,
-0.09589212, -0.4636395, -2.444439, 0, 1, 0.8392157, 1,
-0.08679754, 0.2079008, -2.822743, 0, 1, 0.8431373, 1,
-0.08566488, 1.124537, 1.081885, 0, 1, 0.8509804, 1,
-0.08444761, 2.03706, 0.5632975, 0, 1, 0.854902, 1,
-0.08086687, -3.123847, -3.565019, 0, 1, 0.8627451, 1,
-0.07544522, -1.219843, -2.248049, 0, 1, 0.8666667, 1,
-0.06466711, -0.8073958, -2.177414, 0, 1, 0.8745098, 1,
-0.06403902, -1.778456, -4.355115, 0, 1, 0.8784314, 1,
-0.06378986, 0.08704524, -0.08426975, 0, 1, 0.8862745, 1,
-0.05828645, 0.2374309, -0.4254331, 0, 1, 0.8901961, 1,
-0.05523447, -0.7525142, -3.714172, 0, 1, 0.8980392, 1,
-0.05399569, -0.8348312, -1.971091, 0, 1, 0.9058824, 1,
-0.04133523, 1.696428, 0.2139859, 0, 1, 0.9098039, 1,
-0.03761251, 0.05970763, -2.375369, 0, 1, 0.9176471, 1,
-0.03371319, -2.556553, -4.019704, 0, 1, 0.9215686, 1,
-0.03340793, 0.1833511, -1.491184, 0, 1, 0.9294118, 1,
-0.03204803, -0.2758121, -3.197088, 0, 1, 0.9333333, 1,
-0.03198065, -1.076393, -3.383443, 0, 1, 0.9411765, 1,
-0.02619972, 1.632157, 1.815174, 0, 1, 0.945098, 1,
-0.02571955, -1.360221, -4.054383, 0, 1, 0.9529412, 1,
-0.0163799, 0.3663807, 0.9446944, 0, 1, 0.9568627, 1,
-0.007829361, -0.5867871, -0.7241921, 0, 1, 0.9647059, 1,
-0.005792124, -1.146179, -4.997968, 0, 1, 0.9686275, 1,
-0.0006279624, 0.0590323, -1.877549, 0, 1, 0.9764706, 1,
0.002408821, 0.1518157, 0.9508829, 0, 1, 0.9803922, 1,
0.005970632, -1.797863, 3.517891, 0, 1, 0.9882353, 1,
0.008975516, -0.9133599, 3.182035, 0, 1, 0.9921569, 1,
0.01308063, -1.259705, 3.024816, 0, 1, 1, 1,
0.01922667, 1.403775, 0.4801668, 0, 0.9921569, 1, 1,
0.01970342, -2.159019, 3.362641, 0, 0.9882353, 1, 1,
0.02105907, -1.127221, 2.154109, 0, 0.9803922, 1, 1,
0.02281741, -1.605367, 1.525382, 0, 0.9764706, 1, 1,
0.0323735, -2.568207, 1.777742, 0, 0.9686275, 1, 1,
0.03539949, -0.7962327, 2.79718, 0, 0.9647059, 1, 1,
0.04376761, -0.7444423, 3.685771, 0, 0.9568627, 1, 1,
0.04492944, 0.8094848, 0.7725102, 0, 0.9529412, 1, 1,
0.04631567, -0.6373476, 2.793364, 0, 0.945098, 1, 1,
0.04806669, 0.928727, 0.038846, 0, 0.9411765, 1, 1,
0.04820097, -0.2526886, 2.539919, 0, 0.9333333, 1, 1,
0.04886863, 0.7746496, 0.990301, 0, 0.9294118, 1, 1,
0.04919317, 0.8212299, -1.622872, 0, 0.9215686, 1, 1,
0.0499675, 1.547137, -0.6001483, 0, 0.9176471, 1, 1,
0.05121046, 1.189341, 1.087967, 0, 0.9098039, 1, 1,
0.0535114, -0.601248, 4.090586, 0, 0.9058824, 1, 1,
0.05361535, 0.8392304, -1.036066, 0, 0.8980392, 1, 1,
0.0557386, 0.3923979, -0.6702278, 0, 0.8901961, 1, 1,
0.06142518, 1.099225, -0.1363323, 0, 0.8862745, 1, 1,
0.06602792, 0.5822852, 0.5044889, 0, 0.8784314, 1, 1,
0.0720033, 0.5323678, 0.4593518, 0, 0.8745098, 1, 1,
0.07635701, 0.9444774, 1.767758, 0, 0.8666667, 1, 1,
0.07850474, -2.556687, 2.268183, 0, 0.8627451, 1, 1,
0.08376896, 0.3152862, 0.1442636, 0, 0.854902, 1, 1,
0.08601297, -0.1092005, 2.304489, 0, 0.8509804, 1, 1,
0.09426317, 0.7382128, 1.05412, 0, 0.8431373, 1, 1,
0.09457573, 1.007735, -0.05935881, 0, 0.8392157, 1, 1,
0.09546105, -1.436074, 2.368913, 0, 0.8313726, 1, 1,
0.09871344, -0.2537643, 1.657419, 0, 0.827451, 1, 1,
0.09963229, 0.50903, 0.0988327, 0, 0.8196079, 1, 1,
0.1001252, -1.157475, 2.256664, 0, 0.8156863, 1, 1,
0.1062199, 1.748768, -0.6379877, 0, 0.8078431, 1, 1,
0.1065836, -1.977122, 3.150464, 0, 0.8039216, 1, 1,
0.1069285, -0.7254919, 5.061341, 0, 0.7960784, 1, 1,
0.1081123, 0.8423183, 0.3542157, 0, 0.7882353, 1, 1,
0.1085102, 1.021939, -0.05552332, 0, 0.7843137, 1, 1,
0.1094823, -0.8571793, 4.137878, 0, 0.7764706, 1, 1,
0.1141905, 1.133923, 0.4042275, 0, 0.772549, 1, 1,
0.1219103, 0.7270536, -0.579197, 0, 0.7647059, 1, 1,
0.1232833, 0.722106, -0.5517681, 0, 0.7607843, 1, 1,
0.1236507, -0.2960678, 2.003034, 0, 0.7529412, 1, 1,
0.1238002, 0.5014448, 0.2943339, 0, 0.7490196, 1, 1,
0.1256488, -1.262489, 2.559012, 0, 0.7411765, 1, 1,
0.1313404, 0.6788564, 0.2372749, 0, 0.7372549, 1, 1,
0.1366606, 0.08331738, 0.8058693, 0, 0.7294118, 1, 1,
0.1367573, 1.653935, 1.189862, 0, 0.7254902, 1, 1,
0.1409966, -0.2488744, 2.828917, 0, 0.7176471, 1, 1,
0.1410301, 1.917063, 0.4744264, 0, 0.7137255, 1, 1,
0.1420293, 0.9896346, -0.1093765, 0, 0.7058824, 1, 1,
0.1421109, 1.382276, 0.8470939, 0, 0.6980392, 1, 1,
0.1426233, -1.941427, 3.541258, 0, 0.6941177, 1, 1,
0.1453631, -0.313916, 0.9549586, 0, 0.6862745, 1, 1,
0.1454798, -0.9158091, 3.962559, 0, 0.682353, 1, 1,
0.1461095, -0.2211638, 1.847902, 0, 0.6745098, 1, 1,
0.148676, -0.5823458, 3.554893, 0, 0.6705883, 1, 1,
0.1496558, 1.315253, -1.138654, 0, 0.6627451, 1, 1,
0.1499923, 0.5721675, -0.9479532, 0, 0.6588235, 1, 1,
0.1545161, 2.563667, -1.240148, 0, 0.6509804, 1, 1,
0.1573904, -1.587865, 4.167114, 0, 0.6470588, 1, 1,
0.1590036, 0.5223697, 0.6460661, 0, 0.6392157, 1, 1,
0.1592922, -0.6431596, 3.16851, 0, 0.6352941, 1, 1,
0.1598717, 0.6810291, 0.3055452, 0, 0.627451, 1, 1,
0.1613541, -0.1897012, 2.370323, 0, 0.6235294, 1, 1,
0.1613926, 0.07507405, 0.4908299, 0, 0.6156863, 1, 1,
0.1613938, -0.2142846, 2.331399, 0, 0.6117647, 1, 1,
0.1620672, -1.218275, 1.122548, 0, 0.6039216, 1, 1,
0.1728089, 1.002576, -2.680252, 0, 0.5960785, 1, 1,
0.1731879, 2.316213, 0.8991427, 0, 0.5921569, 1, 1,
0.1777542, 1.52242, -0.5216766, 0, 0.5843138, 1, 1,
0.1787236, 0.6637653, -0.1198865, 0, 0.5803922, 1, 1,
0.1790864, 0.3895675, 2.948524, 0, 0.572549, 1, 1,
0.1842789, -0.6201786, 4.343449, 0, 0.5686275, 1, 1,
0.1889755, 2.183445, 0.5007608, 0, 0.5607843, 1, 1,
0.1910018, 0.907284, -0.2108397, 0, 0.5568628, 1, 1,
0.1917211, 0.8941392, 0.6458718, 0, 0.5490196, 1, 1,
0.1951075, -0.1222749, 1.883803, 0, 0.5450981, 1, 1,
0.1985919, -0.3264825, 2.656606, 0, 0.5372549, 1, 1,
0.1988188, -0.6274723, 2.978696, 0, 0.5333334, 1, 1,
0.1991944, 2.105012, -3.234359, 0, 0.5254902, 1, 1,
0.1994495, -0.2433682, 2.779438, 0, 0.5215687, 1, 1,
0.2020619, -1.176754, 1.384832, 0, 0.5137255, 1, 1,
0.2051871, 0.447265, -0.4050455, 0, 0.509804, 1, 1,
0.2086852, 0.9479416, -1.470061, 0, 0.5019608, 1, 1,
0.2110221, -1.272303, 3.176364, 0, 0.4941176, 1, 1,
0.2143148, 1.1746, -0.6841141, 0, 0.4901961, 1, 1,
0.2210756, 0.001825455, 1.484074, 0, 0.4823529, 1, 1,
0.2245966, 0.4541442, 1.833087, 0, 0.4784314, 1, 1,
0.229662, 1.743625, 1.399734, 0, 0.4705882, 1, 1,
0.2390523, 1.499457, -2.721346, 0, 0.4666667, 1, 1,
0.2440069, 0.6949081, 0.5194219, 0, 0.4588235, 1, 1,
0.2493636, -0.09517383, 0.6978352, 0, 0.454902, 1, 1,
0.2524001, -0.5971317, 4.623003, 0, 0.4470588, 1, 1,
0.2574365, 0.3730329, 0.2752036, 0, 0.4431373, 1, 1,
0.2576559, 0.6514173, 3.338667, 0, 0.4352941, 1, 1,
0.2583042, 0.6210928, 0.3236634, 0, 0.4313726, 1, 1,
0.2603707, -0.5556377, 1.484963, 0, 0.4235294, 1, 1,
0.2620587, -0.4864024, 4.319096, 0, 0.4196078, 1, 1,
0.262199, 1.183769, 0.5436968, 0, 0.4117647, 1, 1,
0.2626984, -0.03131501, 1.787015, 0, 0.4078431, 1, 1,
0.2630768, 0.7834083, -0.03827049, 0, 0.4, 1, 1,
0.2641457, 1.003746, 0.4395944, 0, 0.3921569, 1, 1,
0.2676626, 0.6147019, 0.1664394, 0, 0.3882353, 1, 1,
0.2696877, -0.3457174, 3.652228, 0, 0.3803922, 1, 1,
0.2697272, 1.788609, 0.4689179, 0, 0.3764706, 1, 1,
0.2708607, 2.426857, -0.2224067, 0, 0.3686275, 1, 1,
0.2763574, 0.8394852, 0.1429235, 0, 0.3647059, 1, 1,
0.2784615, 0.8632436, 1.377896, 0, 0.3568628, 1, 1,
0.2803815, -0.213135, 3.771445, 0, 0.3529412, 1, 1,
0.2811473, 1.466357, 0.1496887, 0, 0.345098, 1, 1,
0.2814742, 1.234928, 1.799194, 0, 0.3411765, 1, 1,
0.2821596, -0.7883677, 1.793672, 0, 0.3333333, 1, 1,
0.2843491, 0.1373905, 1.684504, 0, 0.3294118, 1, 1,
0.2882179, 0.7594522, 1.118249, 0, 0.3215686, 1, 1,
0.2943794, -0.02043181, 1.823331, 0, 0.3176471, 1, 1,
0.2948138, -0.8588488, 0.6609694, 0, 0.3098039, 1, 1,
0.2952628, 0.5246719, 0.05115854, 0, 0.3058824, 1, 1,
0.3000849, 1.829474, 0.7918856, 0, 0.2980392, 1, 1,
0.3021296, -0.6068904, 3.368611, 0, 0.2901961, 1, 1,
0.3046207, -1.561265, 3.197662, 0, 0.2862745, 1, 1,
0.3054682, -0.3178961, 2.301919, 0, 0.2784314, 1, 1,
0.3068115, 1.003089, -0.7066478, 0, 0.2745098, 1, 1,
0.3081975, 0.8835371, -1.704924, 0, 0.2666667, 1, 1,
0.3090197, -0.5414659, 1.82992, 0, 0.2627451, 1, 1,
0.3124216, 0.1922598, -1.611443, 0, 0.254902, 1, 1,
0.3141609, 0.03256743, 2.28702, 0, 0.2509804, 1, 1,
0.315747, -0.415921, 1.162898, 0, 0.2431373, 1, 1,
0.3161206, 0.7653812, 0.1421412, 0, 0.2392157, 1, 1,
0.3179364, -0.1687103, 2.638694, 0, 0.2313726, 1, 1,
0.3185154, 0.2414823, 1.743149, 0, 0.227451, 1, 1,
0.3214971, 0.4646688, 1.080326, 0, 0.2196078, 1, 1,
0.3215487, -0.5039042, 1.907338, 0, 0.2156863, 1, 1,
0.3224796, -0.0510902, 1.995519, 0, 0.2078431, 1, 1,
0.3269652, -0.5076892, 3.504779, 0, 0.2039216, 1, 1,
0.3287634, -0.8764757, 2.521363, 0, 0.1960784, 1, 1,
0.3375103, -0.2955155, 3.769419, 0, 0.1882353, 1, 1,
0.3378869, -0.07290856, 1.642014, 0, 0.1843137, 1, 1,
0.3393291, -0.09422864, 2.536031, 0, 0.1764706, 1, 1,
0.3394017, 1.261817, 0.06662768, 0, 0.172549, 1, 1,
0.3398432, -0.5554655, 2.648918, 0, 0.1647059, 1, 1,
0.3405063, 1.09512, -1.078082, 0, 0.1607843, 1, 1,
0.3474691, -1.830127, 1.192836, 0, 0.1529412, 1, 1,
0.3495086, -1.324541, 2.017525, 0, 0.1490196, 1, 1,
0.3513986, -0.08311743, 2.050946, 0, 0.1411765, 1, 1,
0.357046, 0.9831294, 0.7189314, 0, 0.1372549, 1, 1,
0.361456, -0.7711312, 2.466873, 0, 0.1294118, 1, 1,
0.3614707, 1.377611, 0.5409091, 0, 0.1254902, 1, 1,
0.3623536, -0.6822817, 3.200078, 0, 0.1176471, 1, 1,
0.3629647, -1.237022, 3.74329, 0, 0.1137255, 1, 1,
0.3633487, 0.02011808, 1.05824, 0, 0.1058824, 1, 1,
0.3658963, -0.9709982, 3.436649, 0, 0.09803922, 1, 1,
0.3688237, -0.4453783, 2.531613, 0, 0.09411765, 1, 1,
0.3702116, 0.08803182, -1.003186, 0, 0.08627451, 1, 1,
0.3832507, -0.3396208, 1.633251, 0, 0.08235294, 1, 1,
0.385761, 0.4849995, 2.200631, 0, 0.07450981, 1, 1,
0.3886628, -0.8381971, 1.783606, 0, 0.07058824, 1, 1,
0.3929935, -0.04963233, 0.9444279, 0, 0.0627451, 1, 1,
0.3958325, 0.04128493, 2.817045, 0, 0.05882353, 1, 1,
0.3977406, -0.9604921, 2.571277, 0, 0.05098039, 1, 1,
0.4034282, -0.2110812, 3.156559, 0, 0.04705882, 1, 1,
0.4065363, -0.03092929, 1.620005, 0, 0.03921569, 1, 1,
0.4086103, 0.8077446, 1.101558, 0, 0.03529412, 1, 1,
0.4097582, -2.167282, 3.98168, 0, 0.02745098, 1, 1,
0.4106064, -0.3267609, 3.376586, 0, 0.02352941, 1, 1,
0.4117665, 0.1691746, 1.660591, 0, 0.01568628, 1, 1,
0.4140514, -0.549763, 3.821298, 0, 0.01176471, 1, 1,
0.4161252, 0.5461864, 2.472232, 0, 0.003921569, 1, 1,
0.4198114, -0.4398881, 1.951299, 0.003921569, 0, 1, 1,
0.4220133, 0.3710795, 0.7997369, 0.007843138, 0, 1, 1,
0.4223836, -0.05664873, 1.368266, 0.01568628, 0, 1, 1,
0.43178, 0.4724329, 2.024312, 0.01960784, 0, 1, 1,
0.4406587, 0.9756851, 2.373732, 0.02745098, 0, 1, 1,
0.4415826, -2.131984, 2.739707, 0.03137255, 0, 1, 1,
0.4487781, -0.3386033, 1.952612, 0.03921569, 0, 1, 1,
0.4500919, -0.01477194, 3.888316, 0.04313726, 0, 1, 1,
0.4620371, 1.381974, -0.5789647, 0.05098039, 0, 1, 1,
0.462272, 1.487255, 1.128813, 0.05490196, 0, 1, 1,
0.4649832, 0.00699523, 0.5228302, 0.0627451, 0, 1, 1,
0.4653462, 0.2757096, 0.2212382, 0.06666667, 0, 1, 1,
0.4724092, -0.11731, 2.800926, 0.07450981, 0, 1, 1,
0.4727187, 0.8954133, 1.430523, 0.07843138, 0, 1, 1,
0.4729148, 0.7511928, 0.922702, 0.08627451, 0, 1, 1,
0.4742351, -1.494, 4.443799, 0.09019608, 0, 1, 1,
0.4759605, -0.8600062, 3.381666, 0.09803922, 0, 1, 1,
0.4760369, 1.795237, -0.4104024, 0.1058824, 0, 1, 1,
0.4809101, -2.772069, 1.362062, 0.1098039, 0, 1, 1,
0.4853842, 1.450573, -1.189122, 0.1176471, 0, 1, 1,
0.487377, -0.6755829, 2.062812, 0.1215686, 0, 1, 1,
0.4898271, -0.2297058, 0.9088079, 0.1294118, 0, 1, 1,
0.4899001, 0.5919288, -0.7246012, 0.1333333, 0, 1, 1,
0.491504, 0.06605642, 0.4863112, 0.1411765, 0, 1, 1,
0.4969752, -0.5838008, 1.591221, 0.145098, 0, 1, 1,
0.4978281, -0.2754762, 3.084438, 0.1529412, 0, 1, 1,
0.4999858, -0.7078245, 1.104947, 0.1568628, 0, 1, 1,
0.5018235, -1.104812, 1.924594, 0.1647059, 0, 1, 1,
0.5073448, 0.7998307, 0.711441, 0.1686275, 0, 1, 1,
0.5080354, -2.015752, 3.486678, 0.1764706, 0, 1, 1,
0.5093476, 0.6037498, 1.613573, 0.1803922, 0, 1, 1,
0.5142676, -0.7831932, 2.647499, 0.1882353, 0, 1, 1,
0.5169821, 1.25759, -0.0239986, 0.1921569, 0, 1, 1,
0.5197582, -2.244056, 1.927491, 0.2, 0, 1, 1,
0.5216417, -1.827401, 2.823636, 0.2078431, 0, 1, 1,
0.5305734, -2.091447, 2.807298, 0.2117647, 0, 1, 1,
0.5308225, 1.788495, 0.06689755, 0.2196078, 0, 1, 1,
0.531965, -2.664517, 2.210264, 0.2235294, 0, 1, 1,
0.5340358, 0.5138797, 0.8434544, 0.2313726, 0, 1, 1,
0.5352923, 0.2365494, 0.6957561, 0.2352941, 0, 1, 1,
0.5359241, 0.3656001, 1.087845, 0.2431373, 0, 1, 1,
0.5369366, -0.146405, -0.124167, 0.2470588, 0, 1, 1,
0.5379993, 0.1900685, 1.787622, 0.254902, 0, 1, 1,
0.5439883, 0.3814965, 1.806655, 0.2588235, 0, 1, 1,
0.5446031, 1.187887, 0.1435312, 0.2666667, 0, 1, 1,
0.5479191, 2.06644, -0.2592572, 0.2705882, 0, 1, 1,
0.5604788, -0.2516108, 1.72218, 0.2784314, 0, 1, 1,
0.5606145, 0.3183815, 0.636053, 0.282353, 0, 1, 1,
0.5710241, 0.3859768, 0.09907158, 0.2901961, 0, 1, 1,
0.5764515, 0.3534577, 1.235427, 0.2941177, 0, 1, 1,
0.5773389, -1.202335, 1.512382, 0.3019608, 0, 1, 1,
0.5788135, 0.3880875, 0.9018232, 0.3098039, 0, 1, 1,
0.6034557, 1.46974, 1.397253, 0.3137255, 0, 1, 1,
0.6151959, 0.9466931, -0.06859535, 0.3215686, 0, 1, 1,
0.6179999, -1.184934, 2.496266, 0.3254902, 0, 1, 1,
0.6188456, -1.819846, 1.650751, 0.3333333, 0, 1, 1,
0.6199178, 0.08663439, 1.452569, 0.3372549, 0, 1, 1,
0.6199989, 0.04345885, 2.296194, 0.345098, 0, 1, 1,
0.6210762, 1.720923, 0.8482241, 0.3490196, 0, 1, 1,
0.6238124, -0.8805603, 4.644344, 0.3568628, 0, 1, 1,
0.6240822, -2.152134, 3.07257, 0.3607843, 0, 1, 1,
0.6279993, 0.07475997, 1.378672, 0.3686275, 0, 1, 1,
0.6342164, 0.8890799, 1.207871, 0.372549, 0, 1, 1,
0.6373407, 0.4636492, 1.560893, 0.3803922, 0, 1, 1,
0.6382163, 1.969068, 0.2054827, 0.3843137, 0, 1, 1,
0.6390964, -0.2692406, 3.092236, 0.3921569, 0, 1, 1,
0.6430087, -0.8322032, 3.03196, 0.3960784, 0, 1, 1,
0.6461929, -0.1330861, 0.50831, 0.4039216, 0, 1, 1,
0.6495295, 0.4506884, 2.533662, 0.4117647, 0, 1, 1,
0.6509053, 2.285783, 0.7610335, 0.4156863, 0, 1, 1,
0.6614407, -0.9600529, -0.09891485, 0.4235294, 0, 1, 1,
0.6647573, 0.2770645, 1.877428, 0.427451, 0, 1, 1,
0.667145, -0.4691518, 2.758822, 0.4352941, 0, 1, 1,
0.6684523, 0.875779, 2.190106, 0.4392157, 0, 1, 1,
0.6708729, 0.3184665, 1.604915, 0.4470588, 0, 1, 1,
0.6734526, -3.146525, 3.026252, 0.4509804, 0, 1, 1,
0.6762493, 1.50804, 1.183241, 0.4588235, 0, 1, 1,
0.6767562, 0.2687688, 0.154709, 0.4627451, 0, 1, 1,
0.6788397, -0.5116461, 3.108559, 0.4705882, 0, 1, 1,
0.6835302, -0.6342718, 2.173139, 0.4745098, 0, 1, 1,
0.6846431, 0.9644915, 0.06016421, 0.4823529, 0, 1, 1,
0.6910433, -0.7181754, 2.366807, 0.4862745, 0, 1, 1,
0.6918707, -2.094867, 2.926189, 0.4941176, 0, 1, 1,
0.6924694, 0.7640074, 1.251419, 0.5019608, 0, 1, 1,
0.6938925, -0.8369036, 1.693442, 0.5058824, 0, 1, 1,
0.6948039, -0.3978361, 1.509705, 0.5137255, 0, 1, 1,
0.7003325, 0.60446, -0.7301602, 0.5176471, 0, 1, 1,
0.7040729, -0.9823039, 2.67233, 0.5254902, 0, 1, 1,
0.7117007, 0.1945339, 2.960742, 0.5294118, 0, 1, 1,
0.7136651, -0.2521586, 1.022416, 0.5372549, 0, 1, 1,
0.7189156, 0.5306883, 2.352959, 0.5411765, 0, 1, 1,
0.7222649, -0.876177, 2.827258, 0.5490196, 0, 1, 1,
0.7225366, 0.1052963, 1.130628, 0.5529412, 0, 1, 1,
0.7307845, -1.722158, 2.12336, 0.5607843, 0, 1, 1,
0.7339873, -2.189329, 1.931033, 0.5647059, 0, 1, 1,
0.7348741, -0.3600619, 2.968862, 0.572549, 0, 1, 1,
0.7395681, -0.8137327, 2.960106, 0.5764706, 0, 1, 1,
0.7416752, 1.046722, 1.165203, 0.5843138, 0, 1, 1,
0.744732, -0.7083156, 2.97867, 0.5882353, 0, 1, 1,
0.7473555, -1.286698, 3.549626, 0.5960785, 0, 1, 1,
0.7473919, -1.134992, 2.185678, 0.6039216, 0, 1, 1,
0.7487825, 0.3394564, 0.3242089, 0.6078432, 0, 1, 1,
0.750918, -0.5210633, 1.499469, 0.6156863, 0, 1, 1,
0.7532238, -0.9770553, 2.317127, 0.6196079, 0, 1, 1,
0.7544556, -1.812942, 1.452915, 0.627451, 0, 1, 1,
0.7603091, -0.6499227, 1.063877, 0.6313726, 0, 1, 1,
0.7631832, 1.772977, 1.449601, 0.6392157, 0, 1, 1,
0.764177, 0.1357238, 0.76948, 0.6431373, 0, 1, 1,
0.7658246, 0.3789159, 0.7383227, 0.6509804, 0, 1, 1,
0.7676032, -0.3083344, 1.660087, 0.654902, 0, 1, 1,
0.770233, -1.055205, 1.30136, 0.6627451, 0, 1, 1,
0.773854, 0.01221275, 2.274702, 0.6666667, 0, 1, 1,
0.7740508, -0.568936, 2.196273, 0.6745098, 0, 1, 1,
0.7823489, 0.5585652, 0.2155363, 0.6784314, 0, 1, 1,
0.786714, 0.1378956, 2.276174, 0.6862745, 0, 1, 1,
0.7965095, -0.6243665, 2.541677, 0.6901961, 0, 1, 1,
0.7975988, -0.8133523, 2.621611, 0.6980392, 0, 1, 1,
0.7991839, 1.681543, 1.067075, 0.7058824, 0, 1, 1,
0.8000555, -0.9776981, 3.347545, 0.7098039, 0, 1, 1,
0.8002843, 0.9194745, 1.023908, 0.7176471, 0, 1, 1,
0.8025818, -1.16473, 2.490468, 0.7215686, 0, 1, 1,
0.8027164, 0.5430796, 0.2478938, 0.7294118, 0, 1, 1,
0.8048792, -0.2656311, 1.609536, 0.7333333, 0, 1, 1,
0.8061845, 0.2398413, 1.918786, 0.7411765, 0, 1, 1,
0.8129246, -1.139456, 2.304253, 0.7450981, 0, 1, 1,
0.8203574, 0.7618419, -0.06510689, 0.7529412, 0, 1, 1,
0.821048, -1.000121, 1.150681, 0.7568628, 0, 1, 1,
0.821279, 0.2805082, -0.7634501, 0.7647059, 0, 1, 1,
0.8255267, -0.6293887, 3.464112, 0.7686275, 0, 1, 1,
0.8259063, -0.4880359, 0.8824412, 0.7764706, 0, 1, 1,
0.8269209, -1.076038, 1.712945, 0.7803922, 0, 1, 1,
0.8269792, 0.485759, 0.4527279, 0.7882353, 0, 1, 1,
0.8404447, 0.9116636, 2.667811, 0.7921569, 0, 1, 1,
0.8455055, -0.8663854, 2.110721, 0.8, 0, 1, 1,
0.8489502, 0.5117306, 1.698346, 0.8078431, 0, 1, 1,
0.8519355, 0.5752373, 1.080927, 0.8117647, 0, 1, 1,
0.852616, -0.5821447, 3.286168, 0.8196079, 0, 1, 1,
0.8541958, -0.7804943, 2.539598, 0.8235294, 0, 1, 1,
0.8553119, -0.1920399, 1.170865, 0.8313726, 0, 1, 1,
0.8567761, 1.024832, 0.5378938, 0.8352941, 0, 1, 1,
0.8573812, -0.5256253, 2.871639, 0.8431373, 0, 1, 1,
0.8618326, -0.1630265, 2.668939, 0.8470588, 0, 1, 1,
0.8665598, -0.3634697, 1.340448, 0.854902, 0, 1, 1,
0.8679214, -0.03880478, 1.60255, 0.8588235, 0, 1, 1,
0.8719221, -0.08481606, 0.7542935, 0.8666667, 0, 1, 1,
0.8766186, -1.402074, 0.4188038, 0.8705882, 0, 1, 1,
0.8781993, -0.793564, 1.746491, 0.8784314, 0, 1, 1,
0.8788444, 0.3521678, 0.1326367, 0.8823529, 0, 1, 1,
0.8795372, 0.2714215, 0.4766379, 0.8901961, 0, 1, 1,
0.8828254, -0.4373523, 3.170047, 0.8941177, 0, 1, 1,
0.8829422, -1.575466, 4.281958, 0.9019608, 0, 1, 1,
0.8911486, 1.876766, -0.588405, 0.9098039, 0, 1, 1,
0.8913869, 1.315977, -0.2311306, 0.9137255, 0, 1, 1,
0.8914834, 0.770867, 0.4086097, 0.9215686, 0, 1, 1,
0.8933236, -0.2852131, 1.774747, 0.9254902, 0, 1, 1,
0.9004565, 0.4521319, 0.9794536, 0.9333333, 0, 1, 1,
0.9052685, -2.092045, 2.958378, 0.9372549, 0, 1, 1,
0.9087112, 0.2116418, 2.661516, 0.945098, 0, 1, 1,
0.9099255, 2.814777, 0.2125207, 0.9490196, 0, 1, 1,
0.9116529, 0.3166753, 1.372545, 0.9568627, 0, 1, 1,
0.9160844, 0.9676449, 0.6093878, 0.9607843, 0, 1, 1,
0.9161699, 0.581311, 1.358582, 0.9686275, 0, 1, 1,
0.9171001, 0.2284227, 2.170322, 0.972549, 0, 1, 1,
0.9213, 0.08672661, 0.2237395, 0.9803922, 0, 1, 1,
0.9231288, -0.3629094, 0.6837474, 0.9843137, 0, 1, 1,
0.9242565, -1.866986, 1.317863, 0.9921569, 0, 1, 1,
0.9298649, 1.203787, 0.2577749, 0.9960784, 0, 1, 1,
0.9324242, 0.2005107, -0.09318999, 1, 0, 0.9960784, 1,
0.9339392, -1.119351, 4.763768, 1, 0, 0.9882353, 1,
0.9384947, 0.2987765, 1.145621, 1, 0, 0.9843137, 1,
0.940419, 1.895252, 1.385676, 1, 0, 0.9764706, 1,
0.9631034, 0.9863586, 0.9943234, 1, 0, 0.972549, 1,
0.9633121, 0.03402958, 0.3223907, 1, 0, 0.9647059, 1,
0.9658642, -0.9338618, 1.585585, 1, 0, 0.9607843, 1,
0.9669767, -0.1114184, 2.763816, 1, 0, 0.9529412, 1,
0.9679033, 1.150176, 1.795427, 1, 0, 0.9490196, 1,
0.9688246, -1.976664, 4.973702, 1, 0, 0.9411765, 1,
0.9741527, -1.034547, 3.064303, 1, 0, 0.9372549, 1,
0.9806199, 0.6877221, 1.262411, 1, 0, 0.9294118, 1,
0.9818991, 1.930337, 0.354883, 1, 0, 0.9254902, 1,
0.9819711, 0.5005842, 0.8033705, 1, 0, 0.9176471, 1,
0.9833468, -0.9936135, 2.723883, 1, 0, 0.9137255, 1,
0.9868122, -0.1650048, 1.866349, 1, 0, 0.9058824, 1,
0.9876208, -0.3614021, 1.855612, 1, 0, 0.9019608, 1,
0.9896408, -1.24844, 1.191994, 1, 0, 0.8941177, 1,
0.9901684, -0.794573, 1.600759, 1, 0, 0.8862745, 1,
0.9967614, -0.5316646, 2.273333, 1, 0, 0.8823529, 1,
0.998823, -0.6003081, 1.155857, 1, 0, 0.8745098, 1,
1.008394, 1.803751, 1.048865, 1, 0, 0.8705882, 1,
1.015119, -0.6995208, 1.404349, 1, 0, 0.8627451, 1,
1.015368, -0.4496113, 1.948646, 1, 0, 0.8588235, 1,
1.016028, 1.392817, -0.09215166, 1, 0, 0.8509804, 1,
1.021782, -1.079058, 1.878865, 1, 0, 0.8470588, 1,
1.022341, -0.1268389, 1.871659, 1, 0, 0.8392157, 1,
1.024689, -0.03033271, 0.2006648, 1, 0, 0.8352941, 1,
1.031628, -0.6015198, 2.445125, 1, 0, 0.827451, 1,
1.032408, -0.4524111, 3.88196, 1, 0, 0.8235294, 1,
1.035529, -0.4335808, 1.157732, 1, 0, 0.8156863, 1,
1.035743, -1.471861, 2.625632, 1, 0, 0.8117647, 1,
1.043708, -0.8313122, 2.003172, 1, 0, 0.8039216, 1,
1.057952, -0.2682411, 2.123785, 1, 0, 0.7960784, 1,
1.060819, -2.171064, 2.146569, 1, 0, 0.7921569, 1,
1.07448, -0.6727161, 2.100271, 1, 0, 0.7843137, 1,
1.076607, 0.04184867, 1.169288, 1, 0, 0.7803922, 1,
1.077205, 0.1056699, 2.298244, 1, 0, 0.772549, 1,
1.087889, -0.414203, 0.08451339, 1, 0, 0.7686275, 1,
1.089296, 1.209902, 1.749868, 1, 0, 0.7607843, 1,
1.090588, -0.1636418, 2.954007, 1, 0, 0.7568628, 1,
1.090851, 0.2727172, 1.206618, 1, 0, 0.7490196, 1,
1.092183, -0.7940895, 1.967705, 1, 0, 0.7450981, 1,
1.100052, -0.5488836, 1.786034, 1, 0, 0.7372549, 1,
1.102241, 0.4564053, 1.220376, 1, 0, 0.7333333, 1,
1.106924, 0.8718538, -1.187753, 1, 0, 0.7254902, 1,
1.109425, 1.291515, 1.576364, 1, 0, 0.7215686, 1,
1.114877, 0.3535499, 1.136103, 1, 0, 0.7137255, 1,
1.124179, -0.4404125, 3.765013, 1, 0, 0.7098039, 1,
1.124357, 0.109595, -0.1913244, 1, 0, 0.7019608, 1,
1.127424, 1.105026, -0.6093529, 1, 0, 0.6941177, 1,
1.151995, 0.8013968, 0.7499913, 1, 0, 0.6901961, 1,
1.159768, -0.4948297, 1.139913, 1, 0, 0.682353, 1,
1.160759, -0.9193124, 1.98754, 1, 0, 0.6784314, 1,
1.167252, -1.134921, 2.928196, 1, 0, 0.6705883, 1,
1.17083, 0.6866478, 1.548673, 1, 0, 0.6666667, 1,
1.170857, 0.8570194, 1.704749, 1, 0, 0.6588235, 1,
1.17407, -1.013964, 4.124195, 1, 0, 0.654902, 1,
1.180276, -1.937492, 4.130632, 1, 0, 0.6470588, 1,
1.187144, -0.4646913, 2.652548, 1, 0, 0.6431373, 1,
1.188069, 0.9819294, 0.7125928, 1, 0, 0.6352941, 1,
1.191896, -0.2954704, 2.83294, 1, 0, 0.6313726, 1,
1.192526, 1.397857, 1.666307, 1, 0, 0.6235294, 1,
1.193322, 0.5529642, -0.980622, 1, 0, 0.6196079, 1,
1.1942, -2.052562, 3.412512, 1, 0, 0.6117647, 1,
1.196517, 0.7691883, 0.1510958, 1, 0, 0.6078432, 1,
1.205093, -0.5154476, 3.969654, 1, 0, 0.6, 1,
1.213208, 0.2662056, 1.911766, 1, 0, 0.5921569, 1,
1.214568, 1.07948, 1.11839, 1, 0, 0.5882353, 1,
1.215739, -1.564213, 2.398297, 1, 0, 0.5803922, 1,
1.218498, 1.555425, -0.1840578, 1, 0, 0.5764706, 1,
1.222337, 0.1012746, 2.09507, 1, 0, 0.5686275, 1,
1.222423, -0.4398433, 1.174973, 1, 0, 0.5647059, 1,
1.230314, -0.6158282, 3.322276, 1, 0, 0.5568628, 1,
1.237245, 0.1860359, 1.050382, 1, 0, 0.5529412, 1,
1.244278, -1.582807, 2.99239, 1, 0, 0.5450981, 1,
1.250608, -2.457239, 3.474166, 1, 0, 0.5411765, 1,
1.260801, -0.1398683, 1.354483, 1, 0, 0.5333334, 1,
1.260867, 0.7345701, 2.716621, 1, 0, 0.5294118, 1,
1.289339, 1.673174, -0.4644587, 1, 0, 0.5215687, 1,
1.290694, -0.2617075, 2.11247, 1, 0, 0.5176471, 1,
1.301689, 0.5424748, 2.20141, 1, 0, 0.509804, 1,
1.344942, 0.5522981, 3.006017, 1, 0, 0.5058824, 1,
1.347926, -0.6069367, 3.203532, 1, 0, 0.4980392, 1,
1.370569, -0.2354054, 0.9950722, 1, 0, 0.4901961, 1,
1.376681, -0.75324, 3.828802, 1, 0, 0.4862745, 1,
1.380471, 1.627791, 0.6028734, 1, 0, 0.4784314, 1,
1.385285, 0.2842624, 0.488336, 1, 0, 0.4745098, 1,
1.392128, 0.5874946, 1.76321, 1, 0, 0.4666667, 1,
1.400287, -1.207472, 3.270086, 1, 0, 0.4627451, 1,
1.413286, 1.007028, 0.3808917, 1, 0, 0.454902, 1,
1.417429, -1.534313, 3.79712, 1, 0, 0.4509804, 1,
1.423303, 0.09245931, 1.959003, 1, 0, 0.4431373, 1,
1.43012, -0.9403154, 1.511187, 1, 0, 0.4392157, 1,
1.435389, 0.8948296, 1.577602, 1, 0, 0.4313726, 1,
1.442404, 1.715366, 0.6897953, 1, 0, 0.427451, 1,
1.442639, 0.16111, -0.702969, 1, 0, 0.4196078, 1,
1.443623, 0.4903188, 1.376432, 1, 0, 0.4156863, 1,
1.467026, 0.4916917, 1.004793, 1, 0, 0.4078431, 1,
1.489831, -2.015207, 1.744532, 1, 0, 0.4039216, 1,
1.497441, 0.3739009, 2.168969, 1, 0, 0.3960784, 1,
1.51706, -0.7700667, 2.863805, 1, 0, 0.3882353, 1,
1.519189, -0.04394857, 0.6233673, 1, 0, 0.3843137, 1,
1.538727, 1.605396, 2.73746, 1, 0, 0.3764706, 1,
1.540294, -0.7420348, 2.30585, 1, 0, 0.372549, 1,
1.545665, 1.308363, 0.5192203, 1, 0, 0.3647059, 1,
1.553865, 1.46102, 0.2259273, 1, 0, 0.3607843, 1,
1.560777, -0.441612, 1.740458, 1, 0, 0.3529412, 1,
1.579779, -0.2837978, 2.731656, 1, 0, 0.3490196, 1,
1.596618, -0.6817468, 2.684794, 1, 0, 0.3411765, 1,
1.602564, -0.1818073, 1.292238, 1, 0, 0.3372549, 1,
1.605956, -0.6343663, 1.719092, 1, 0, 0.3294118, 1,
1.608696, -0.4643032, 1.982251, 1, 0, 0.3254902, 1,
1.617617, 0.1358099, 0.5006156, 1, 0, 0.3176471, 1,
1.632576, 0.322563, 0.6692051, 1, 0, 0.3137255, 1,
1.636687, 0.6669469, 1.986831, 1, 0, 0.3058824, 1,
1.665809, 0.8111952, 0.5322738, 1, 0, 0.2980392, 1,
1.666495, 0.2076366, 2.401041, 1, 0, 0.2941177, 1,
1.669477, 0.02346081, 0.4182676, 1, 0, 0.2862745, 1,
1.677348, -0.5205147, 2.364558, 1, 0, 0.282353, 1,
1.682512, -1.740275, 2.256891, 1, 0, 0.2745098, 1,
1.684499, 2.010015, 0.4922011, 1, 0, 0.2705882, 1,
1.724676, 1.330178, -0.5549707, 1, 0, 0.2627451, 1,
1.726042, 0.5681383, 2.438143, 1, 0, 0.2588235, 1,
1.734538, 1.074165, 0.2882341, 1, 0, 0.2509804, 1,
1.745603, 1.261213, 0.6280215, 1, 0, 0.2470588, 1,
1.759849, 1.088708, 1.676311, 1, 0, 0.2392157, 1,
1.790704, -0.7881844, 2.395311, 1, 0, 0.2352941, 1,
1.791134, -0.4184042, 2.467287, 1, 0, 0.227451, 1,
1.791309, -1.723427, 3.10093, 1, 0, 0.2235294, 1,
1.807675, -0.07911637, 1.694394, 1, 0, 0.2156863, 1,
1.815395, 0.6425905, 0.5721937, 1, 0, 0.2117647, 1,
1.82391, 0.7362531, 1.901766, 1, 0, 0.2039216, 1,
1.836198, 0.9687077, 1.18758, 1, 0, 0.1960784, 1,
1.85945, -1.786469, 2.356236, 1, 0, 0.1921569, 1,
1.867568, 0.4913463, 1.941515, 1, 0, 0.1843137, 1,
1.870156, -1.847286, 2.972724, 1, 0, 0.1803922, 1,
1.927842, -1.217624, 3.093452, 1, 0, 0.172549, 1,
1.943354, 1.809147, 1.724004, 1, 0, 0.1686275, 1,
1.952231, 1.538733, -1.212862, 1, 0, 0.1607843, 1,
1.953643, 1.777085, 0.2762347, 1, 0, 0.1568628, 1,
2.020022, -0.8639141, 1.656948, 1, 0, 0.1490196, 1,
2.024946, -0.2568908, 2.922019, 1, 0, 0.145098, 1,
2.02755, -0.4938685, 2.563224, 1, 0, 0.1372549, 1,
2.097062, 0.9641775, -0.2475153, 1, 0, 0.1333333, 1,
2.154248, 0.2233816, 0.9645022, 1, 0, 0.1254902, 1,
2.154659, -0.05344687, 2.009527, 1, 0, 0.1215686, 1,
2.15883, -0.7983038, 2.490816, 1, 0, 0.1137255, 1,
2.197303, -0.4874185, 1.576361, 1, 0, 0.1098039, 1,
2.204884, -0.6134427, 1.452951, 1, 0, 0.1019608, 1,
2.210542, 1.254093, 0.1530231, 1, 0, 0.09411765, 1,
2.216935, 0.03056088, 0.01686354, 1, 0, 0.09019608, 1,
2.244761, 0.4784352, 1.672397, 1, 0, 0.08235294, 1,
2.247859, 1.02169, -0.02891902, 1, 0, 0.07843138, 1,
2.316154, 1.290424, 0.489223, 1, 0, 0.07058824, 1,
2.317116, 0.3150877, 1.652918, 1, 0, 0.06666667, 1,
2.445066, -0.1121002, 1.417857, 1, 0, 0.05882353, 1,
2.498523, -0.1968382, 3.980369, 1, 0, 0.05490196, 1,
2.591836, -2.278274, 2.304015, 1, 0, 0.04705882, 1,
2.669504, 1.502482, 1.383052, 1, 0, 0.04313726, 1,
2.677462, 1.349298, 1.033346, 1, 0, 0.03529412, 1,
2.751181, 1.237223, 1.724793, 1, 0, 0.03137255, 1,
2.810359, -0.2775156, 3.269368, 1, 0, 0.02352941, 1,
3.118726, -0.7069542, 3.551152, 1, 0, 0.01960784, 1,
3.252277, -1.137196, 2.037958, 1, 0, 0.01176471, 1,
3.288486, 1.200565, 1.138563, 1, 0, 0.007843138, 1
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
0.1757852, -4.669222, -7.412267, 0, -0.5, 0.5, 0.5,
0.1757852, -4.669222, -7.412267, 1, -0.5, 0.5, 0.5,
0.1757852, -4.669222, -7.412267, 1, 1.5, 0.5, 0.5,
0.1757852, -4.669222, -7.412267, 0, 1.5, 0.5, 0.5
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
-3.992122, -0.3848802, -7.412267, 0, -0.5, 0.5, 0.5,
-3.992122, -0.3848802, -7.412267, 1, -0.5, 0.5, 0.5,
-3.992122, -0.3848802, -7.412267, 1, 1.5, 0.5, 0.5,
-3.992122, -0.3848802, -7.412267, 0, 1.5, 0.5, 0.5
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
-3.992122, -4.669222, -0.2715394, 0, -0.5, 0.5, 0.5,
-3.992122, -4.669222, -0.2715394, 1, -0.5, 0.5, 0.5,
-3.992122, -4.669222, -0.2715394, 1, 1.5, 0.5, 0.5,
-3.992122, -4.669222, -0.2715394, 0, 1.5, 0.5, 0.5
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
-2, -3.680527, -5.764407,
3, -3.680527, -5.764407,
-2, -3.680527, -5.764407,
-2, -3.84531, -6.03905,
-1, -3.680527, -5.764407,
-1, -3.84531, -6.03905,
0, -3.680527, -5.764407,
0, -3.84531, -6.03905,
1, -3.680527, -5.764407,
1, -3.84531, -6.03905,
2, -3.680527, -5.764407,
2, -3.84531, -6.03905,
3, -3.680527, -5.764407,
3, -3.84531, -6.03905
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
-2, -4.174875, -6.588336, 0, -0.5, 0.5, 0.5,
-2, -4.174875, -6.588336, 1, -0.5, 0.5, 0.5,
-2, -4.174875, -6.588336, 1, 1.5, 0.5, 0.5,
-2, -4.174875, -6.588336, 0, 1.5, 0.5, 0.5,
-1, -4.174875, -6.588336, 0, -0.5, 0.5, 0.5,
-1, -4.174875, -6.588336, 1, -0.5, 0.5, 0.5,
-1, -4.174875, -6.588336, 1, 1.5, 0.5, 0.5,
-1, -4.174875, -6.588336, 0, 1.5, 0.5, 0.5,
0, -4.174875, -6.588336, 0, -0.5, 0.5, 0.5,
0, -4.174875, -6.588336, 1, -0.5, 0.5, 0.5,
0, -4.174875, -6.588336, 1, 1.5, 0.5, 0.5,
0, -4.174875, -6.588336, 0, 1.5, 0.5, 0.5,
1, -4.174875, -6.588336, 0, -0.5, 0.5, 0.5,
1, -4.174875, -6.588336, 1, -0.5, 0.5, 0.5,
1, -4.174875, -6.588336, 1, 1.5, 0.5, 0.5,
1, -4.174875, -6.588336, 0, 1.5, 0.5, 0.5,
2, -4.174875, -6.588336, 0, -0.5, 0.5, 0.5,
2, -4.174875, -6.588336, 1, -0.5, 0.5, 0.5,
2, -4.174875, -6.588336, 1, 1.5, 0.5, 0.5,
2, -4.174875, -6.588336, 0, 1.5, 0.5, 0.5,
3, -4.174875, -6.588336, 0, -0.5, 0.5, 0.5,
3, -4.174875, -6.588336, 1, -0.5, 0.5, 0.5,
3, -4.174875, -6.588336, 1, 1.5, 0.5, 0.5,
3, -4.174875, -6.588336, 0, 1.5, 0.5, 0.5
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
-3.030297, -3, -5.764407,
-3.030297, 2, -5.764407,
-3.030297, -3, -5.764407,
-3.190601, -3, -6.03905,
-3.030297, -2, -5.764407,
-3.190601, -2, -6.03905,
-3.030297, -1, -5.764407,
-3.190601, -1, -6.03905,
-3.030297, 0, -5.764407,
-3.190601, 0, -6.03905,
-3.030297, 1, -5.764407,
-3.190601, 1, -6.03905,
-3.030297, 2, -5.764407,
-3.190601, 2, -6.03905
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
-3.511209, -3, -6.588336, 0, -0.5, 0.5, 0.5,
-3.511209, -3, -6.588336, 1, -0.5, 0.5, 0.5,
-3.511209, -3, -6.588336, 1, 1.5, 0.5, 0.5,
-3.511209, -3, -6.588336, 0, 1.5, 0.5, 0.5,
-3.511209, -2, -6.588336, 0, -0.5, 0.5, 0.5,
-3.511209, -2, -6.588336, 1, -0.5, 0.5, 0.5,
-3.511209, -2, -6.588336, 1, 1.5, 0.5, 0.5,
-3.511209, -2, -6.588336, 0, 1.5, 0.5, 0.5,
-3.511209, -1, -6.588336, 0, -0.5, 0.5, 0.5,
-3.511209, -1, -6.588336, 1, -0.5, 0.5, 0.5,
-3.511209, -1, -6.588336, 1, 1.5, 0.5, 0.5,
-3.511209, -1, -6.588336, 0, 1.5, 0.5, 0.5,
-3.511209, 0, -6.588336, 0, -0.5, 0.5, 0.5,
-3.511209, 0, -6.588336, 1, -0.5, 0.5, 0.5,
-3.511209, 0, -6.588336, 1, 1.5, 0.5, 0.5,
-3.511209, 0, -6.588336, 0, 1.5, 0.5, 0.5,
-3.511209, 1, -6.588336, 0, -0.5, 0.5, 0.5,
-3.511209, 1, -6.588336, 1, -0.5, 0.5, 0.5,
-3.511209, 1, -6.588336, 1, 1.5, 0.5, 0.5,
-3.511209, 1, -6.588336, 0, 1.5, 0.5, 0.5,
-3.511209, 2, -6.588336, 0, -0.5, 0.5, 0.5,
-3.511209, 2, -6.588336, 1, -0.5, 0.5, 0.5,
-3.511209, 2, -6.588336, 1, 1.5, 0.5, 0.5,
-3.511209, 2, -6.588336, 0, 1.5, 0.5, 0.5
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
-3.030297, -3.680527, -4,
-3.030297, -3.680527, 4,
-3.030297, -3.680527, -4,
-3.190601, -3.84531, -4,
-3.030297, -3.680527, -2,
-3.190601, -3.84531, -2,
-3.030297, -3.680527, 0,
-3.190601, -3.84531, 0,
-3.030297, -3.680527, 2,
-3.190601, -3.84531, 2,
-3.030297, -3.680527, 4,
-3.190601, -3.84531, 4
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
-3.511209, -4.174875, -4, 0, -0.5, 0.5, 0.5,
-3.511209, -4.174875, -4, 1, -0.5, 0.5, 0.5,
-3.511209, -4.174875, -4, 1, 1.5, 0.5, 0.5,
-3.511209, -4.174875, -4, 0, 1.5, 0.5, 0.5,
-3.511209, -4.174875, -2, 0, -0.5, 0.5, 0.5,
-3.511209, -4.174875, -2, 1, -0.5, 0.5, 0.5,
-3.511209, -4.174875, -2, 1, 1.5, 0.5, 0.5,
-3.511209, -4.174875, -2, 0, 1.5, 0.5, 0.5,
-3.511209, -4.174875, 0, 0, -0.5, 0.5, 0.5,
-3.511209, -4.174875, 0, 1, -0.5, 0.5, 0.5,
-3.511209, -4.174875, 0, 1, 1.5, 0.5, 0.5,
-3.511209, -4.174875, 0, 0, 1.5, 0.5, 0.5,
-3.511209, -4.174875, 2, 0, -0.5, 0.5, 0.5,
-3.511209, -4.174875, 2, 1, -0.5, 0.5, 0.5,
-3.511209, -4.174875, 2, 1, 1.5, 0.5, 0.5,
-3.511209, -4.174875, 2, 0, 1.5, 0.5, 0.5,
-3.511209, -4.174875, 4, 0, -0.5, 0.5, 0.5,
-3.511209, -4.174875, 4, 1, -0.5, 0.5, 0.5,
-3.511209, -4.174875, 4, 1, 1.5, 0.5, 0.5,
-3.511209, -4.174875, 4, 0, 1.5, 0.5, 0.5
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
-3.030297, -3.680527, -5.764407,
-3.030297, 2.910767, -5.764407,
-3.030297, -3.680527, 5.221328,
-3.030297, 2.910767, 5.221328,
-3.030297, -3.680527, -5.764407,
-3.030297, -3.680527, 5.221328,
-3.030297, 2.910767, -5.764407,
-3.030297, 2.910767, 5.221328,
-3.030297, -3.680527, -5.764407,
3.381867, -3.680527, -5.764407,
-3.030297, -3.680527, 5.221328,
3.381867, -3.680527, 5.221328,
-3.030297, 2.910767, -5.764407,
3.381867, 2.910767, -5.764407,
-3.030297, 2.910767, 5.221328,
3.381867, 2.910767, 5.221328,
3.381867, -3.680527, -5.764407,
3.381867, 2.910767, -5.764407,
3.381867, -3.680527, 5.221328,
3.381867, 2.910767, 5.221328,
3.381867, -3.680527, -5.764407,
3.381867, -3.680527, 5.221328,
3.381867, 2.910767, -5.764407,
3.381867, 2.910767, 5.221328
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
var radius = 7.65005;
var distance = 34.03594;
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
mvMatrix.translate( -0.1757852, 0.3848802, 0.2715394 );
mvMatrix.scale( 1.289952, 1.254895, 0.7529204 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.03594);
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
Heptane<-read.table("Heptane.xyz")
```

```
## Error in read.table("Heptane.xyz"): no lines available in input
```

```r
x<-Heptane$V2
```

```
## Error in eval(expr, envir, enclos): object 'Heptane' not found
```

```r
y<-Heptane$V3
```

```
## Error in eval(expr, envir, enclos): object 'Heptane' not found
```

```r
z<-Heptane$V4
```

```
## Error in eval(expr, envir, enclos): object 'Heptane' not found
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
-2.936916, -0.1049059, -0.6917161, 0, 0, 1, 1, 1,
-2.933335, -1.827347, -2.968876, 1, 0, 0, 1, 1,
-2.695273, 0.5478339, -1.443474, 1, 0, 0, 1, 1,
-2.497638, -2.510497, -1.173281, 1, 0, 0, 1, 1,
-2.493899, 0.4119733, -1.592812, 1, 0, 0, 1, 1,
-2.486653, 0.4927413, -2.78226, 1, 0, 0, 1, 1,
-2.464545, 0.3602781, -2.34985, 0, 0, 0, 1, 1,
-2.432899, 0.3487691, -1.363396, 0, 0, 0, 1, 1,
-2.38519, -0.7507122, 0.3483311, 0, 0, 0, 1, 1,
-2.350752, -0.9348502, -1.466184, 0, 0, 0, 1, 1,
-2.336041, 1.242903, -0.958364, 0, 0, 0, 1, 1,
-2.32464, 0.778715, -2.724542, 0, 0, 0, 1, 1,
-2.290876, 0.1389206, -2.741016, 0, 0, 0, 1, 1,
-2.251739, 1.040967, -0.5973959, 1, 1, 1, 1, 1,
-2.239465, 1.886638, 1.507652, 1, 1, 1, 1, 1,
-2.239291, -2.253417, -2.369032, 1, 1, 1, 1, 1,
-2.227688, -0.2730051, -1.387362, 1, 1, 1, 1, 1,
-2.225813, 1.144345, -0.6288718, 1, 1, 1, 1, 1,
-2.22203, -1.820397, -2.983914, 1, 1, 1, 1, 1,
-2.181959, -0.2832111, -1.141744, 1, 1, 1, 1, 1,
-2.172707, -0.4137585, -2.489497, 1, 1, 1, 1, 1,
-2.163407, 0.4396287, -2.248744, 1, 1, 1, 1, 1,
-2.160618, 1.089794, 0.4799748, 1, 1, 1, 1, 1,
-2.148893, 0.3927247, -0.1836849, 1, 1, 1, 1, 1,
-2.142276, 0.1392704, -2.109524, 1, 1, 1, 1, 1,
-2.140438, -0.8057919, -2.479081, 1, 1, 1, 1, 1,
-2.106376, -1.285032, -1.864616, 1, 1, 1, 1, 1,
-2.03306, 0.03858104, -2.530793, 1, 1, 1, 1, 1,
-2.027821, 1.223704, -1.637049, 0, 0, 1, 1, 1,
-2.025844, 2.123356, -1.189346, 1, 0, 0, 1, 1,
-2.025267, -0.7061855, -1.939494, 1, 0, 0, 1, 1,
-2.02401, 1.819234, -1.785246, 1, 0, 0, 1, 1,
-2.019588, -0.9859012, -3.149074, 1, 0, 0, 1, 1,
-1.971298, -0.4516059, -1.019832, 1, 0, 0, 1, 1,
-1.970645, 0.1115322, 1.133552, 0, 0, 0, 1, 1,
-1.959786, 1.013416, -0.07303762, 0, 0, 0, 1, 1,
-1.931496, 0.2903122, 0.4892217, 0, 0, 0, 1, 1,
-1.905315, -0.458508, -1.124222, 0, 0, 0, 1, 1,
-1.890636, -2.47349, -2.375015, 0, 0, 0, 1, 1,
-1.887537, -0.06896604, -1.745906, 0, 0, 0, 1, 1,
-1.88315, 1.17638, -0.03088149, 0, 0, 0, 1, 1,
-1.864749, 0.2255346, -0.6756364, 1, 1, 1, 1, 1,
-1.852363, -0.09119873, -0.7510839, 1, 1, 1, 1, 1,
-1.808444, 1.459563, -0.3217271, 1, 1, 1, 1, 1,
-1.804247, 0.1629557, -2.006958, 1, 1, 1, 1, 1,
-1.765983, 1.250176, -1.039919, 1, 1, 1, 1, 1,
-1.751051, -1.471442, -1.771423, 1, 1, 1, 1, 1,
-1.737303, -0.5299273, -1.555889, 1, 1, 1, 1, 1,
-1.730942, 0.7674826, -0.4989457, 1, 1, 1, 1, 1,
-1.72891, -2.125962, -3.407317, 1, 1, 1, 1, 1,
-1.723304, 0.5591676, -0.4029535, 1, 1, 1, 1, 1,
-1.704639, 0.2901895, -2.177742, 1, 1, 1, 1, 1,
-1.670646, 0.1331887, -1.038243, 1, 1, 1, 1, 1,
-1.658907, -0.2356684, -0.2930076, 1, 1, 1, 1, 1,
-1.653745, 0.501961, 0.7894254, 1, 1, 1, 1, 1,
-1.652639, -1.011718, -2.024605, 1, 1, 1, 1, 1,
-1.647289, -2.124695, -3.070428, 0, 0, 1, 1, 1,
-1.645084, -0.3475235, -3.682698, 1, 0, 0, 1, 1,
-1.638826, -1.713439, -1.612473, 1, 0, 0, 1, 1,
-1.618992, 0.430439, -1.580614, 1, 0, 0, 1, 1,
-1.604709, 0.03468129, -2.95346, 1, 0, 0, 1, 1,
-1.60355, 0.8658075, -1.346516, 1, 0, 0, 1, 1,
-1.603414, 0.9869915, -0.1294906, 0, 0, 0, 1, 1,
-1.585483, -0.2518858, -3.675166, 0, 0, 0, 1, 1,
-1.574347, 1.313823, -1.013808, 0, 0, 0, 1, 1,
-1.560843, -1.314655, -1.586949, 0, 0, 0, 1, 1,
-1.546339, -0.5418583, -0.963697, 0, 0, 0, 1, 1,
-1.537624, -0.6108088, -0.6321581, 0, 0, 0, 1, 1,
-1.537124, -0.1595078, -0.197276, 0, 0, 0, 1, 1,
-1.536034, -0.7770453, -2.869687, 1, 1, 1, 1, 1,
-1.519546, -1.097559, -2.040502, 1, 1, 1, 1, 1,
-1.515978, -0.09562539, -1.655451, 1, 1, 1, 1, 1,
-1.500772, -0.6718321, -3.425722, 1, 1, 1, 1, 1,
-1.495532, -1.48602, -2.219384, 1, 1, 1, 1, 1,
-1.495212, 1.877756, -0.8723027, 1, 1, 1, 1, 1,
-1.495002, -0.196644, -3.225389, 1, 1, 1, 1, 1,
-1.489, 0.7917855, -0.4330119, 1, 1, 1, 1, 1,
-1.487066, -1.427202, -3.552463, 1, 1, 1, 1, 1,
-1.478573, -1.781229, -1.443706, 1, 1, 1, 1, 1,
-1.476998, 1.058786, -0.4587446, 1, 1, 1, 1, 1,
-1.472489, -0.3638071, -1.464938, 1, 1, 1, 1, 1,
-1.465425, 0.05596251, -2.232925, 1, 1, 1, 1, 1,
-1.462273, 0.02429037, -1.201537, 1, 1, 1, 1, 1,
-1.454414, -0.2350026, -1.041244, 1, 1, 1, 1, 1,
-1.454394, -0.7776694, -1.631252, 0, 0, 1, 1, 1,
-1.453302, -0.3571742, -1.796123, 1, 0, 0, 1, 1,
-1.448262, 0.5353593, -3.205386, 1, 0, 0, 1, 1,
-1.446725, 0.1665477, -2.532053, 1, 0, 0, 1, 1,
-1.443953, -1.141406, -1.332489, 1, 0, 0, 1, 1,
-1.443113, 0.5018402, -2.473071, 1, 0, 0, 1, 1,
-1.442639, 1.007263, 0.1486799, 0, 0, 0, 1, 1,
-1.442028, 1.845943, 1.010514, 0, 0, 0, 1, 1,
-1.437945, -1.303455, -3.223269, 0, 0, 0, 1, 1,
-1.420748, -0.04936693, -2.981028, 0, 0, 0, 1, 1,
-1.41879, -0.04760876, -1.96935, 0, 0, 0, 1, 1,
-1.417527, -0.004561616, -1.699322, 0, 0, 0, 1, 1,
-1.411482, -0.7119311, -0.4349368, 0, 0, 0, 1, 1,
-1.410882, 0.2184747, -2.554835, 1, 1, 1, 1, 1,
-1.4058, 1.707512, -0.4932534, 1, 1, 1, 1, 1,
-1.403998, 0.9429427, -0.4409306, 1, 1, 1, 1, 1,
-1.402999, 0.9815338, 1.267819, 1, 1, 1, 1, 1,
-1.384908, 0.9641666, -0.7341111, 1, 1, 1, 1, 1,
-1.384638, -0.906713, -2.415254, 1, 1, 1, 1, 1,
-1.377273, -0.2586626, -1.242333, 1, 1, 1, 1, 1,
-1.369383, -1.289889, -3.18694, 1, 1, 1, 1, 1,
-1.361097, -0.5032797, -1.805771, 1, 1, 1, 1, 1,
-1.360811, 0.3199165, -2.074819, 1, 1, 1, 1, 1,
-1.351466, 1.15776, -1.890031, 1, 1, 1, 1, 1,
-1.350366, -0.9347597, -2.219209, 1, 1, 1, 1, 1,
-1.347316, -0.2043228, -3.246243, 1, 1, 1, 1, 1,
-1.324327, -2.059689, -2.249592, 1, 1, 1, 1, 1,
-1.322551, -0.7265953, -1.618401, 1, 1, 1, 1, 1,
-1.321152, -0.02974909, -1.887669, 0, 0, 1, 1, 1,
-1.306642, -0.1730264, -0.6241494, 1, 0, 0, 1, 1,
-1.304114, 0.5031872, -2.381067, 1, 0, 0, 1, 1,
-1.294127, -0.01470028, -1.77397, 1, 0, 0, 1, 1,
-1.289264, 1.61547, -1.361059, 1, 0, 0, 1, 1,
-1.282604, -1.275941, -1.315697, 1, 0, 0, 1, 1,
-1.277819, -0.5733166, 0.00536356, 0, 0, 0, 1, 1,
-1.27162, 0.3723768, -2.84386, 0, 0, 0, 1, 1,
-1.261784, -1.419967, -2.476998, 0, 0, 0, 1, 1,
-1.261341, 1.233369, 0.6510286, 0, 0, 0, 1, 1,
-1.255548, 1.552443, -0.1399832, 0, 0, 0, 1, 1,
-1.248915, -0.05981599, -3.431686, 0, 0, 0, 1, 1,
-1.238214, -0.736957, -1.28448, 0, 0, 0, 1, 1,
-1.234109, 0.689727, -2.21089, 1, 1, 1, 1, 1,
-1.232914, 0.3415649, -0.9017181, 1, 1, 1, 1, 1,
-1.228112, 0.5880843, -0.8419873, 1, 1, 1, 1, 1,
-1.227726, 1.497772, -1.060395, 1, 1, 1, 1, 1,
-1.219375, -1.571641, -1.187184, 1, 1, 1, 1, 1,
-1.217734, -0.5309375, -2.777051, 1, 1, 1, 1, 1,
-1.215029, -1.086633, -2.184171, 1, 1, 1, 1, 1,
-1.213339, -1.629149, -3.170849, 1, 1, 1, 1, 1,
-1.201266, -0.0288469, -1.485552, 1, 1, 1, 1, 1,
-1.195302, -0.8215813, -1.443093, 1, 1, 1, 1, 1,
-1.193522, 1.511665, 0.5730488, 1, 1, 1, 1, 1,
-1.19038, 0.3706094, -1.46672, 1, 1, 1, 1, 1,
-1.182783, 0.6724347, -1.029657, 1, 1, 1, 1, 1,
-1.175894, -0.2261086, -1.402516, 1, 1, 1, 1, 1,
-1.174889, -0.8207579, -1.879062, 1, 1, 1, 1, 1,
-1.173866, -0.1984179, -2.313528, 0, 0, 1, 1, 1,
-1.16782, -1.138462, -2.116111, 1, 0, 0, 1, 1,
-1.160162, 0.1011254, -1.220325, 1, 0, 0, 1, 1,
-1.159351, 1.726627, 0.8587574, 1, 0, 0, 1, 1,
-1.157444, -0.003329912, -1.584936, 1, 0, 0, 1, 1,
-1.157294, -1.146911, -3.077461, 1, 0, 0, 1, 1,
-1.140396, -0.5863781, -1.515755, 0, 0, 0, 1, 1,
-1.136532, -0.1350963, -1.73781, 0, 0, 0, 1, 1,
-1.135755, -0.1416864, -0.986074, 0, 0, 0, 1, 1,
-1.132112, 0.870416, -1.721502, 0, 0, 0, 1, 1,
-1.129836, -0.486096, -2.717893, 0, 0, 0, 1, 1,
-1.116605, -1.124378, -0.6434426, 0, 0, 0, 1, 1,
-1.114569, -0.144647, -1.914001, 0, 0, 0, 1, 1,
-1.101908, 0.3556198, -0.3208362, 1, 1, 1, 1, 1,
-1.088326, 1.200178, -1.885016, 1, 1, 1, 1, 1,
-1.087553, 0.6318082, 0.2499325, 1, 1, 1, 1, 1,
-1.086535, -0.4914539, -1.544716, 1, 1, 1, 1, 1,
-1.078743, 1.111915, -1.462758, 1, 1, 1, 1, 1,
-1.078708, 1.587905, -0.5524597, 1, 1, 1, 1, 1,
-1.07758, 2.74295, 0.2411741, 1, 1, 1, 1, 1,
-1.072899, 0.8599813, -2.14353, 1, 1, 1, 1, 1,
-1.07022, 0.9467782, 0.4139428, 1, 1, 1, 1, 1,
-1.04755, 0.1690324, -1.409477, 1, 1, 1, 1, 1,
-1.043755, -1.171259, -0.5138552, 1, 1, 1, 1, 1,
-1.042233, 0.2491501, -0.7870134, 1, 1, 1, 1, 1,
-1.033856, 1.135451, 0.08647101, 1, 1, 1, 1, 1,
-1.031911, 0.8334854, -0.1605263, 1, 1, 1, 1, 1,
-1.031095, 0.5212206, 1.086361, 1, 1, 1, 1, 1,
-1.027774, 0.5100436, -1.333066, 0, 0, 1, 1, 1,
-1.01708, -0.09137721, -1.704287, 1, 0, 0, 1, 1,
-1.00857, 0.5241777, -2.883527, 1, 0, 0, 1, 1,
-1.004286, -1.132044, -2.933048, 1, 0, 0, 1, 1,
-0.9967262, -0.9172859, -0.8458013, 1, 0, 0, 1, 1,
-0.9945159, 0.01924687, -0.2283763, 1, 0, 0, 1, 1,
-0.9902565, -0.8667363, -3.923827, 0, 0, 0, 1, 1,
-0.9870046, 0.8338827, -0.4453842, 0, 0, 0, 1, 1,
-0.9844937, -0.8954462, -1.771009, 0, 0, 0, 1, 1,
-0.9731539, -3.584538, -4.506985, 0, 0, 0, 1, 1,
-0.9673864, 0.5851727, -2.529558, 0, 0, 0, 1, 1,
-0.9649999, 0.3363841, 0.2569726, 0, 0, 0, 1, 1,
-0.9649255, -0.1595719, -2.884235, 0, 0, 0, 1, 1,
-0.9550427, -0.9038687, -4.424372, 1, 1, 1, 1, 1,
-0.9538276, -0.9404787, -1.312905, 1, 1, 1, 1, 1,
-0.9476658, 2.678112, -0.04505839, 1, 1, 1, 1, 1,
-0.9384539, 0.7560868, -0.04993911, 1, 1, 1, 1, 1,
-0.937535, 0.09816554, -1.532519, 1, 1, 1, 1, 1,
-0.9344506, 1.892682, -1.859407, 1, 1, 1, 1, 1,
-0.9323761, -1.711996, -3.394703, 1, 1, 1, 1, 1,
-0.9302816, -1.157067, -2.564642, 1, 1, 1, 1, 1,
-0.9248809, -0.8138196, -0.7513655, 1, 1, 1, 1, 1,
-0.9137208, -0.2864536, -2.144539, 1, 1, 1, 1, 1,
-0.903054, 1.675701, -1.572196, 1, 1, 1, 1, 1,
-0.9024619, 0.8202479, -0.7860737, 1, 1, 1, 1, 1,
-0.9016066, 0.2522215, -1.465, 1, 1, 1, 1, 1,
-0.8972198, -0.3438077, -0.9514704, 1, 1, 1, 1, 1,
-0.8971924, 0.7816532, -1.710105, 1, 1, 1, 1, 1,
-0.892451, 0.6265435, -2.682813, 0, 0, 1, 1, 1,
-0.8866872, -1.322884, -4.354092, 1, 0, 0, 1, 1,
-0.8801365, 0.9666146, 0.3035891, 1, 0, 0, 1, 1,
-0.8789976, 1.575865, -0.01698648, 1, 0, 0, 1, 1,
-0.8760989, 1.333035, -1.290439, 1, 0, 0, 1, 1,
-0.8719458, -0.6233563, -2.117061, 1, 0, 0, 1, 1,
-0.8658789, -1.417838, -3.186734, 0, 0, 0, 1, 1,
-0.8645759, 0.2215697, -1.892973, 0, 0, 0, 1, 1,
-0.8616549, 1.004571, 0.4260788, 0, 0, 0, 1, 1,
-0.8596141, -1.110213, -2.104829, 0, 0, 0, 1, 1,
-0.8507162, -0.8820104, -2.811101, 0, 0, 0, 1, 1,
-0.85046, -0.734646, -2.332998, 0, 0, 0, 1, 1,
-0.8426569, -0.06243384, -2.344263, 0, 0, 0, 1, 1,
-0.8174272, -0.7166309, -3.449986, 1, 1, 1, 1, 1,
-0.8145623, -0.5144201, -2.65641, 1, 1, 1, 1, 1,
-0.8144559, 0.6541013, 1.015402, 1, 1, 1, 1, 1,
-0.8129413, -0.7709838, -2.603377, 1, 1, 1, 1, 1,
-0.8082859, -0.2758283, -2.995531, 1, 1, 1, 1, 1,
-0.8059658, 0.6264426, -1.310809, 1, 1, 1, 1, 1,
-0.8056976, -0.02874176, 0.1341439, 1, 1, 1, 1, 1,
-0.8036941, -1.1346, -2.030923, 1, 1, 1, 1, 1,
-0.8027138, -0.8452687, -1.411731, 1, 1, 1, 1, 1,
-0.7997421, -0.1908379, -1.541559, 1, 1, 1, 1, 1,
-0.7972406, 0.5091636, -1.164004, 1, 1, 1, 1, 1,
-0.7945026, -0.1900589, -2.232693, 1, 1, 1, 1, 1,
-0.7940974, -0.5270327, -0.9062093, 1, 1, 1, 1, 1,
-0.7922728, -0.3528951, -3.606073, 1, 1, 1, 1, 1,
-0.7905275, 0.2683373, -0.5607439, 1, 1, 1, 1, 1,
-0.7852502, 0.06498428, -1.214073, 0, 0, 1, 1, 1,
-0.7816328, 0.1571199, -1.699282, 1, 0, 0, 1, 1,
-0.7813786, 0.5615304, -0.0520751, 1, 0, 0, 1, 1,
-0.7789704, 0.3051791, -1.37062, 1, 0, 0, 1, 1,
-0.7766438, -1.343346, -2.732197, 1, 0, 0, 1, 1,
-0.7708964, -1.08567, -1.968605, 1, 0, 0, 1, 1,
-0.7684064, -0.5027743, -1.990962, 0, 0, 0, 1, 1,
-0.7660464, 1.034775, -0.9105245, 0, 0, 0, 1, 1,
-0.7643191, -0.5175946, -3.981599, 0, 0, 0, 1, 1,
-0.7587851, 0.5899609, -0.6582836, 0, 0, 0, 1, 1,
-0.7572341, 0.2050573, -1.836511, 0, 0, 0, 1, 1,
-0.7488726, 1.047925, -1.532392, 0, 0, 0, 1, 1,
-0.7390869, 0.4455084, -1.235855, 0, 0, 0, 1, 1,
-0.7358138, -0.6039563, -4.144881, 1, 1, 1, 1, 1,
-0.7287378, -0.5576424, -1.758114, 1, 1, 1, 1, 1,
-0.7251556, 0.6587563, -0.5398467, 1, 1, 1, 1, 1,
-0.7209873, 0.8221524, -1.49754, 1, 1, 1, 1, 1,
-0.7189417, -1.077386, -2.098218, 1, 1, 1, 1, 1,
-0.7188085, -1.667543, -3.490534, 1, 1, 1, 1, 1,
-0.7108259, -0.5150803, -0.708903, 1, 1, 1, 1, 1,
-0.7092809, 1.146558, -0.9021253, 1, 1, 1, 1, 1,
-0.7073397, 0.6631795, 0.8306565, 1, 1, 1, 1, 1,
-0.7057387, -0.0144526, -0.1478358, 1, 1, 1, 1, 1,
-0.7045146, 0.1634736, -0.4947627, 1, 1, 1, 1, 1,
-0.7005414, -0.4599942, -3.047592, 1, 1, 1, 1, 1,
-0.6998734, 2.246625, -0.1135032, 1, 1, 1, 1, 1,
-0.6983464, 0.2110622, -1.260705, 1, 1, 1, 1, 1,
-0.6892132, -2.038888, -1.312402, 1, 1, 1, 1, 1,
-0.68893, 0.07887969, -1.126367, 0, 0, 1, 1, 1,
-0.6862738, 0.8419498, -0.8060828, 1, 0, 0, 1, 1,
-0.6820679, -1.09912, -2.638728, 1, 0, 0, 1, 1,
-0.6791491, -1.639084, -2.517219, 1, 0, 0, 1, 1,
-0.6700595, 1.089764, -0.820015, 1, 0, 0, 1, 1,
-0.668747, 0.3947897, -1.8978, 1, 0, 0, 1, 1,
-0.6635144, -1.2063, -1.512468, 0, 0, 0, 1, 1,
-0.660987, -0.9970764, -2.263085, 0, 0, 0, 1, 1,
-0.6586788, -1.278253, -2.694343, 0, 0, 0, 1, 1,
-0.6583937, 0.1151312, -1.04984, 0, 0, 0, 1, 1,
-0.6573554, 0.03479808, -2.333572, 0, 0, 0, 1, 1,
-0.6534528, 0.119377, 0.5005414, 0, 0, 0, 1, 1,
-0.6483691, 0.07401959, -1.02993, 0, 0, 0, 1, 1,
-0.6472732, 0.6684316, 0.1171596, 1, 1, 1, 1, 1,
-0.638454, -1.897654, -2.379441, 1, 1, 1, 1, 1,
-0.6321196, -1.089566, -2.764866, 1, 1, 1, 1, 1,
-0.6306457, -0.1352565, -1.599157, 1, 1, 1, 1, 1,
-0.6203166, 0.04735582, -1.915844, 1, 1, 1, 1, 1,
-0.6145877, 1.398981, -1.649451, 1, 1, 1, 1, 1,
-0.6124382, -0.67469, -3.296468, 1, 1, 1, 1, 1,
-0.6085687, 0.1154206, -1.239553, 1, 1, 1, 1, 1,
-0.5991222, -1.573696, -0.5642015, 1, 1, 1, 1, 1,
-0.5966287, 0.208545, -0.5247881, 1, 1, 1, 1, 1,
-0.596236, 0.4435369, -0.8952249, 1, 1, 1, 1, 1,
-0.5855442, -0.5895936, -1.195213, 1, 1, 1, 1, 1,
-0.5758719, -1.498441, -1.873644, 1, 1, 1, 1, 1,
-0.573582, -0.5980395, -3.005093, 1, 1, 1, 1, 1,
-0.5713091, 1.578982, 0.5086656, 1, 1, 1, 1, 1,
-0.5708541, 0.0780139, -0.6093771, 0, 0, 1, 1, 1,
-0.5695603, -0.07724938, -2.955116, 1, 0, 0, 1, 1,
-0.5689471, -0.7977589, -2.115541, 1, 0, 0, 1, 1,
-0.5685526, -0.843887, -1.404023, 1, 0, 0, 1, 1,
-0.5670658, -1.314906, -2.94695, 1, 0, 0, 1, 1,
-0.5608525, 0.3705286, 0.528909, 1, 0, 0, 1, 1,
-0.5565091, 1.64493, 0.2114695, 0, 0, 0, 1, 1,
-0.5538632, -1.781149, -3.052768, 0, 0, 0, 1, 1,
-0.5530265, 0.3328592, -2.886431, 0, 0, 0, 1, 1,
-0.5506442, 1.197586, 0.2002014, 0, 0, 0, 1, 1,
-0.5499203, 0.2970706, -2.29207, 0, 0, 0, 1, 1,
-0.5328622, -0.35306, -1.21956, 0, 0, 0, 1, 1,
-0.5327334, -0.5465313, -1.960917, 0, 0, 0, 1, 1,
-0.5248153, 0.290255, 0.3313782, 1, 1, 1, 1, 1,
-0.5239093, 0.8006383, -1.733617, 1, 1, 1, 1, 1,
-0.5153783, -1.600025, -2.885574, 1, 1, 1, 1, 1,
-0.5137472, 0.2175056, -0.8910252, 1, 1, 1, 1, 1,
-0.5122185, -0.8983954, -3.745878, 1, 1, 1, 1, 1,
-0.5101399, 0.9583762, -1.515582, 1, 1, 1, 1, 1,
-0.5082357, 1.424249, 1.341119, 1, 1, 1, 1, 1,
-0.5080249, -0.198407, -1.428939, 1, 1, 1, 1, 1,
-0.5046026, -0.9732834, -2.981768, 1, 1, 1, 1, 1,
-0.5033919, 0.511548, -1.503811, 1, 1, 1, 1, 1,
-0.499345, -0.8344722, -3.230563, 1, 1, 1, 1, 1,
-0.4976113, -0.02711861, -0.21339, 1, 1, 1, 1, 1,
-0.496288, 1.369225, -0.8177717, 1, 1, 1, 1, 1,
-0.4945866, 2.391027, -1.763411, 1, 1, 1, 1, 1,
-0.489108, -0.1583811, -2.846553, 1, 1, 1, 1, 1,
-0.4888748, 1.43593, 0.8911353, 0, 0, 1, 1, 1,
-0.4872637, -0.4503701, -1.172766, 1, 0, 0, 1, 1,
-0.4866539, -0.9716278, -1.181825, 1, 0, 0, 1, 1,
-0.485073, 1.41838, -0.6991854, 1, 0, 0, 1, 1,
-0.4811438, 1.660238, 0.4721048, 1, 0, 0, 1, 1,
-0.4788894, 1.334313, -2.324589, 1, 0, 0, 1, 1,
-0.4756052, -0.09178474, -2.634856, 0, 0, 0, 1, 1,
-0.4734452, -0.6920614, -2.960986, 0, 0, 0, 1, 1,
-0.4716022, -0.3690927, -1.053093, 0, 0, 0, 1, 1,
-0.4705692, -0.7147195, -2.726269, 0, 0, 0, 1, 1,
-0.469175, -1.148888, -2.370692, 0, 0, 0, 1, 1,
-0.4688179, 1.191981, -0.05374935, 0, 0, 0, 1, 1,
-0.4673367, 0.09903561, -1.86262, 0, 0, 0, 1, 1,
-0.4649741, 0.6450062, -3.28198, 1, 1, 1, 1, 1,
-0.4586236, -0.3770859, -1.395166, 1, 1, 1, 1, 1,
-0.4582042, 0.4253612, -0.09782601, 1, 1, 1, 1, 1,
-0.4573914, -1.04699, -4.959295, 1, 1, 1, 1, 1,
-0.4544924, 0.1374687, -4.104628, 1, 1, 1, 1, 1,
-0.4528059, 0.1765404, -2.822535, 1, 1, 1, 1, 1,
-0.4515975, 0.2317855, -2.311297, 1, 1, 1, 1, 1,
-0.448844, 0.137563, -0.9686807, 1, 1, 1, 1, 1,
-0.444953, -0.7070512, -1.839381, 1, 1, 1, 1, 1,
-0.4435449, -0.6257899, -4.267271, 1, 1, 1, 1, 1,
-0.4435122, 1.082159, -1.505642, 1, 1, 1, 1, 1,
-0.4387352, -0.6199834, -3.389705, 1, 1, 1, 1, 1,
-0.4359264, 2.064463, -0.5095397, 1, 1, 1, 1, 1,
-0.4351049, -0.5115127, -3.212444, 1, 1, 1, 1, 1,
-0.4332637, 0.4800238, -1.544876, 1, 1, 1, 1, 1,
-0.4303441, -0.378181, -0.6869999, 0, 0, 1, 1, 1,
-0.4216661, -0.2302255, -1.738002, 1, 0, 0, 1, 1,
-0.4185022, 0.06920459, -0.6294155, 1, 0, 0, 1, 1,
-0.4115434, -0.5007454, -3.941702, 1, 0, 0, 1, 1,
-0.4112881, 1.853011, -1.32119, 1, 0, 0, 1, 1,
-0.4109329, -0.2598527, -2.072931, 1, 0, 0, 1, 1,
-0.4077066, -0.1610279, -3.089062, 0, 0, 0, 1, 1,
-0.4070753, 1.088343, 0.888481, 0, 0, 0, 1, 1,
-0.4030446, -1.335771, -2.259241, 0, 0, 0, 1, 1,
-0.4009072, -0.4388016, -1.340073, 0, 0, 0, 1, 1,
-0.4008167, -1.693107, -3.113346, 0, 0, 0, 1, 1,
-0.3956889, 0.2481062, -2.288558, 0, 0, 0, 1, 1,
-0.3941627, -0.3349972, -3.141676, 0, 0, 0, 1, 1,
-0.3921808, 0.5589337, -2.005332, 1, 1, 1, 1, 1,
-0.3884318, -1.137134, -1.890174, 1, 1, 1, 1, 1,
-0.3856341, 1.25878, -1.003534, 1, 1, 1, 1, 1,
-0.3818675, 1.494197, -1.303005, 1, 1, 1, 1, 1,
-0.3793803, -0.6318749, -3.435248, 1, 1, 1, 1, 1,
-0.3719983, -0.8633005, -3.411539, 1, 1, 1, 1, 1,
-0.3704856, -0.5226544, -1.222661, 1, 1, 1, 1, 1,
-0.3696768, -0.06668182, -1.781351, 1, 1, 1, 1, 1,
-0.3620629, -1.980328, -4.258641, 1, 1, 1, 1, 1,
-0.3616151, 1.818517, 0.7576811, 1, 1, 1, 1, 1,
-0.3594249, -1.245456, -2.498482, 1, 1, 1, 1, 1,
-0.3582065, -1.126539, -4.532522, 1, 1, 1, 1, 1,
-0.3533362, 0.03415837, -1.822137, 1, 1, 1, 1, 1,
-0.3510669, -0.1770156, -3.181071, 1, 1, 1, 1, 1,
-0.3500637, 0.5587827, 0.3031248, 1, 1, 1, 1, 1,
-0.3494015, 0.3199977, -2.228067, 0, 0, 1, 1, 1,
-0.3480216, -0.3466269, -1.769234, 1, 0, 0, 1, 1,
-0.3455884, 0.7565962, 1.133222, 1, 0, 0, 1, 1,
-0.3406648, -0.3472568, -2.684934, 1, 0, 0, 1, 1,
-0.3359986, -1.037575, -2.470484, 1, 0, 0, 1, 1,
-0.3330216, -0.2950181, -1.522213, 1, 0, 0, 1, 1,
-0.3321256, 0.8199754, 0.04812243, 0, 0, 0, 1, 1,
-0.3307712, -0.2601604, -3.07181, 0, 0, 0, 1, 1,
-0.3275709, 0.6329062, -1.327931, 0, 0, 0, 1, 1,
-0.3230881, -0.3779327, -2.590408, 0, 0, 0, 1, 1,
-0.3101063, -0.5051848, -2.529352, 0, 0, 0, 1, 1,
-0.3041941, 0.3295794, 1.212141, 0, 0, 0, 1, 1,
-0.3015103, -0.2385712, -1.29047, 0, 0, 0, 1, 1,
-0.2948338, 0.5428373, 0.3611478, 1, 1, 1, 1, 1,
-0.2917561, 0.6561296, 0.225731, 1, 1, 1, 1, 1,
-0.2917458, -0.9089466, -4.24487, 1, 1, 1, 1, 1,
-0.2903968, -0.09636835, -0.6598207, 1, 1, 1, 1, 1,
-0.28913, 0.5434025, 1.002798, 1, 1, 1, 1, 1,
-0.2839207, 1.217315, 0.02583448, 1, 1, 1, 1, 1,
-0.2823949, -0.1796678, -3.323874, 1, 1, 1, 1, 1,
-0.2807766, -0.3021054, -3.905112, 1, 1, 1, 1, 1,
-0.2803779, 0.05122692, -0.3899582, 1, 1, 1, 1, 1,
-0.2783329, -1.290385, -3.579513, 1, 1, 1, 1, 1,
-0.2762794, 0.1836311, -1.668506, 1, 1, 1, 1, 1,
-0.2725958, -1.159617, -2.238456, 1, 1, 1, 1, 1,
-0.2668866, -1.147415, -3.052502, 1, 1, 1, 1, 1,
-0.2663338, 0.8256756, -0.06481767, 1, 1, 1, 1, 1,
-0.2656492, 1.899091, 0.05920868, 1, 1, 1, 1, 1,
-0.2638183, 1.030992, 0.2803521, 0, 0, 1, 1, 1,
-0.2636202, 0.8588333, 0.5360087, 1, 0, 0, 1, 1,
-0.262796, -1.457752, -1.03787, 1, 0, 0, 1, 1,
-0.2626362, 1.996872, -0.9360801, 1, 0, 0, 1, 1,
-0.2613539, 0.3052208, -1.158331, 1, 0, 0, 1, 1,
-0.2594877, -0.06182755, -2.469539, 1, 0, 0, 1, 1,
-0.2521411, 0.8145246, 0.9084197, 0, 0, 0, 1, 1,
-0.2468869, -1.039878, -3.434552, 0, 0, 0, 1, 1,
-0.2468451, 0.1140888, -1.192358, 0, 0, 0, 1, 1,
-0.2367894, -0.195577, -1.271157, 0, 0, 0, 1, 1,
-0.234716, 0.8507594, 0.0865384, 0, 0, 0, 1, 1,
-0.234445, 0.3917988, 0.8720973, 0, 0, 0, 1, 1,
-0.2321048, 0.7794987, -2.448075, 0, 0, 0, 1, 1,
-0.2300097, 1.688004, 0.9912618, 1, 1, 1, 1, 1,
-0.2276333, -0.5411618, -2.483856, 1, 1, 1, 1, 1,
-0.2231345, 0.3481157, 0.4270812, 1, 1, 1, 1, 1,
-0.2194696, -0.4437399, -0.2280467, 1, 1, 1, 1, 1,
-0.216063, 2.498797, -0.1479434, 1, 1, 1, 1, 1,
-0.2112301, 0.8122022, -0.5358288, 1, 1, 1, 1, 1,
-0.2051793, 0.0816782, -0.03277779, 1, 1, 1, 1, 1,
-0.2029172, 0.9488683, -0.771181, 1, 1, 1, 1, 1,
-0.2020784, -0.1506592, -1.997697, 1, 1, 1, 1, 1,
-0.2013532, -1.011997, -3.817877, 1, 1, 1, 1, 1,
-0.2012272, 0.4462493, -0.7048559, 1, 1, 1, 1, 1,
-0.1997907, 1.576818, -0.3173856, 1, 1, 1, 1, 1,
-0.1996954, -0.6166362, -4.022744, 1, 1, 1, 1, 1,
-0.1995671, -0.1339613, -1.8611, 1, 1, 1, 1, 1,
-0.1977143, 1.859491, 2.032603, 1, 1, 1, 1, 1,
-0.1961786, 0.1647944, -0.05913759, 0, 0, 1, 1, 1,
-0.1952557, -0.1001988, -1.204597, 1, 0, 0, 1, 1,
-0.191298, 0.6529564, 0.3539506, 1, 0, 0, 1, 1,
-0.1902894, 0.3510664, -1.752357, 1, 0, 0, 1, 1,
-0.1896838, -1.49104, -2.911329, 1, 0, 0, 1, 1,
-0.1886656, 0.2668261, -3.17085, 1, 0, 0, 1, 1,
-0.1876891, 0.8362878, 2.041072, 0, 0, 0, 1, 1,
-0.1870753, -0.4272014, -1.775069, 0, 0, 0, 1, 1,
-0.1868273, 0.581479, -2.847575, 0, 0, 0, 1, 1,
-0.1838797, 0.5668753, 0.09857877, 0, 0, 0, 1, 1,
-0.1799556, 0.1455476, -1.205921, 0, 0, 0, 1, 1,
-0.1790516, 0.03726474, -2.611715, 0, 0, 0, 1, 1,
-0.1782535, -0.3254171, -3.079476, 0, 0, 0, 1, 1,
-0.1759895, 1.851319, -1.271156, 1, 1, 1, 1, 1,
-0.1729743, -1.301775, -3.546124, 1, 1, 1, 1, 1,
-0.1716699, -1.08563, -4.429778, 1, 1, 1, 1, 1,
-0.1641915, -0.5612323, -5.60442, 1, 1, 1, 1, 1,
-0.1605805, -0.1294235, -3.140981, 1, 1, 1, 1, 1,
-0.1594574, 1.300849, 0.7918242, 1, 1, 1, 1, 1,
-0.1572383, 0.7180615, 0.2425796, 1, 1, 1, 1, 1,
-0.1565787, 0.4751214, -0.2199696, 1, 1, 1, 1, 1,
-0.1540531, -1.981752, -3.001449, 1, 1, 1, 1, 1,
-0.1526796, 0.3143116, -0.6788784, 1, 1, 1, 1, 1,
-0.1498318, 1.146283, -1.302623, 1, 1, 1, 1, 1,
-0.1495428, -0.09497442, -1.676041, 1, 1, 1, 1, 1,
-0.1489958, 0.1502887, -0.7265242, 1, 1, 1, 1, 1,
-0.1480734, -0.8858504, -2.809811, 1, 1, 1, 1, 1,
-0.1476243, 0.002813216, -1.771814, 1, 1, 1, 1, 1,
-0.1470361, -0.06977608, -2.506058, 0, 0, 1, 1, 1,
-0.1418806, -0.3100193, -1.628971, 1, 0, 0, 1, 1,
-0.1416731, -0.2611517, -2.469486, 1, 0, 0, 1, 1,
-0.1396518, 1.371901, -0.6310137, 1, 0, 0, 1, 1,
-0.1388027, -0.6723426, -2.777883, 1, 0, 0, 1, 1,
-0.137049, -1.134969, -1.641196, 1, 0, 0, 1, 1,
-0.1336601, 0.2804224, 0.6329533, 0, 0, 0, 1, 1,
-0.1327366, 1.839798, 1.07509, 0, 0, 0, 1, 1,
-0.1316403, -0.7234172, -3.991364, 0, 0, 0, 1, 1,
-0.1294043, 0.8710917, 2.474223, 0, 0, 0, 1, 1,
-0.1252909, -0.8463749, -2.944587, 0, 0, 0, 1, 1,
-0.124438, 0.7084433, 0.7782013, 0, 0, 0, 1, 1,
-0.1223978, -0.9472458, -3.414198, 0, 0, 0, 1, 1,
-0.1204375, 0.6937941, -0.8989243, 1, 1, 1, 1, 1,
-0.1186449, -2.160334, -2.912564, 1, 1, 1, 1, 1,
-0.1180615, 0.6402971, -1.094588, 1, 1, 1, 1, 1,
-0.1154433, 0.3054581, -0.3814578, 1, 1, 1, 1, 1,
-0.1130892, -1.68334, -2.24351, 1, 1, 1, 1, 1,
-0.1076215, -0.3858072, -3.313351, 1, 1, 1, 1, 1,
-0.1050451, 1.356723, -1.260407, 1, 1, 1, 1, 1,
-0.1049362, -1.376821, -3.539811, 1, 1, 1, 1, 1,
-0.1000824, -0.6957192, -1.485088, 1, 1, 1, 1, 1,
-0.09710737, 0.4399306, 0.3265571, 1, 1, 1, 1, 1,
-0.09699868, -0.7503125, -1.886297, 1, 1, 1, 1, 1,
-0.09630764, -0.3372881, -4.002866, 1, 1, 1, 1, 1,
-0.09589212, -0.4636395, -2.444439, 1, 1, 1, 1, 1,
-0.08679754, 0.2079008, -2.822743, 1, 1, 1, 1, 1,
-0.08566488, 1.124537, 1.081885, 1, 1, 1, 1, 1,
-0.08444761, 2.03706, 0.5632975, 0, 0, 1, 1, 1,
-0.08086687, -3.123847, -3.565019, 1, 0, 0, 1, 1,
-0.07544522, -1.219843, -2.248049, 1, 0, 0, 1, 1,
-0.06466711, -0.8073958, -2.177414, 1, 0, 0, 1, 1,
-0.06403902, -1.778456, -4.355115, 1, 0, 0, 1, 1,
-0.06378986, 0.08704524, -0.08426975, 1, 0, 0, 1, 1,
-0.05828645, 0.2374309, -0.4254331, 0, 0, 0, 1, 1,
-0.05523447, -0.7525142, -3.714172, 0, 0, 0, 1, 1,
-0.05399569, -0.8348312, -1.971091, 0, 0, 0, 1, 1,
-0.04133523, 1.696428, 0.2139859, 0, 0, 0, 1, 1,
-0.03761251, 0.05970763, -2.375369, 0, 0, 0, 1, 1,
-0.03371319, -2.556553, -4.019704, 0, 0, 0, 1, 1,
-0.03340793, 0.1833511, -1.491184, 0, 0, 0, 1, 1,
-0.03204803, -0.2758121, -3.197088, 1, 1, 1, 1, 1,
-0.03198065, -1.076393, -3.383443, 1, 1, 1, 1, 1,
-0.02619972, 1.632157, 1.815174, 1, 1, 1, 1, 1,
-0.02571955, -1.360221, -4.054383, 1, 1, 1, 1, 1,
-0.0163799, 0.3663807, 0.9446944, 1, 1, 1, 1, 1,
-0.007829361, -0.5867871, -0.7241921, 1, 1, 1, 1, 1,
-0.005792124, -1.146179, -4.997968, 1, 1, 1, 1, 1,
-0.0006279624, 0.0590323, -1.877549, 1, 1, 1, 1, 1,
0.002408821, 0.1518157, 0.9508829, 1, 1, 1, 1, 1,
0.005970632, -1.797863, 3.517891, 1, 1, 1, 1, 1,
0.008975516, -0.9133599, 3.182035, 1, 1, 1, 1, 1,
0.01308063, -1.259705, 3.024816, 1, 1, 1, 1, 1,
0.01922667, 1.403775, 0.4801668, 1, 1, 1, 1, 1,
0.01970342, -2.159019, 3.362641, 1, 1, 1, 1, 1,
0.02105907, -1.127221, 2.154109, 1, 1, 1, 1, 1,
0.02281741, -1.605367, 1.525382, 0, 0, 1, 1, 1,
0.0323735, -2.568207, 1.777742, 1, 0, 0, 1, 1,
0.03539949, -0.7962327, 2.79718, 1, 0, 0, 1, 1,
0.04376761, -0.7444423, 3.685771, 1, 0, 0, 1, 1,
0.04492944, 0.8094848, 0.7725102, 1, 0, 0, 1, 1,
0.04631567, -0.6373476, 2.793364, 1, 0, 0, 1, 1,
0.04806669, 0.928727, 0.038846, 0, 0, 0, 1, 1,
0.04820097, -0.2526886, 2.539919, 0, 0, 0, 1, 1,
0.04886863, 0.7746496, 0.990301, 0, 0, 0, 1, 1,
0.04919317, 0.8212299, -1.622872, 0, 0, 0, 1, 1,
0.0499675, 1.547137, -0.6001483, 0, 0, 0, 1, 1,
0.05121046, 1.189341, 1.087967, 0, 0, 0, 1, 1,
0.0535114, -0.601248, 4.090586, 0, 0, 0, 1, 1,
0.05361535, 0.8392304, -1.036066, 1, 1, 1, 1, 1,
0.0557386, 0.3923979, -0.6702278, 1, 1, 1, 1, 1,
0.06142518, 1.099225, -0.1363323, 1, 1, 1, 1, 1,
0.06602792, 0.5822852, 0.5044889, 1, 1, 1, 1, 1,
0.0720033, 0.5323678, 0.4593518, 1, 1, 1, 1, 1,
0.07635701, 0.9444774, 1.767758, 1, 1, 1, 1, 1,
0.07850474, -2.556687, 2.268183, 1, 1, 1, 1, 1,
0.08376896, 0.3152862, 0.1442636, 1, 1, 1, 1, 1,
0.08601297, -0.1092005, 2.304489, 1, 1, 1, 1, 1,
0.09426317, 0.7382128, 1.05412, 1, 1, 1, 1, 1,
0.09457573, 1.007735, -0.05935881, 1, 1, 1, 1, 1,
0.09546105, -1.436074, 2.368913, 1, 1, 1, 1, 1,
0.09871344, -0.2537643, 1.657419, 1, 1, 1, 1, 1,
0.09963229, 0.50903, 0.0988327, 1, 1, 1, 1, 1,
0.1001252, -1.157475, 2.256664, 1, 1, 1, 1, 1,
0.1062199, 1.748768, -0.6379877, 0, 0, 1, 1, 1,
0.1065836, -1.977122, 3.150464, 1, 0, 0, 1, 1,
0.1069285, -0.7254919, 5.061341, 1, 0, 0, 1, 1,
0.1081123, 0.8423183, 0.3542157, 1, 0, 0, 1, 1,
0.1085102, 1.021939, -0.05552332, 1, 0, 0, 1, 1,
0.1094823, -0.8571793, 4.137878, 1, 0, 0, 1, 1,
0.1141905, 1.133923, 0.4042275, 0, 0, 0, 1, 1,
0.1219103, 0.7270536, -0.579197, 0, 0, 0, 1, 1,
0.1232833, 0.722106, -0.5517681, 0, 0, 0, 1, 1,
0.1236507, -0.2960678, 2.003034, 0, 0, 0, 1, 1,
0.1238002, 0.5014448, 0.2943339, 0, 0, 0, 1, 1,
0.1256488, -1.262489, 2.559012, 0, 0, 0, 1, 1,
0.1313404, 0.6788564, 0.2372749, 0, 0, 0, 1, 1,
0.1366606, 0.08331738, 0.8058693, 1, 1, 1, 1, 1,
0.1367573, 1.653935, 1.189862, 1, 1, 1, 1, 1,
0.1409966, -0.2488744, 2.828917, 1, 1, 1, 1, 1,
0.1410301, 1.917063, 0.4744264, 1, 1, 1, 1, 1,
0.1420293, 0.9896346, -0.1093765, 1, 1, 1, 1, 1,
0.1421109, 1.382276, 0.8470939, 1, 1, 1, 1, 1,
0.1426233, -1.941427, 3.541258, 1, 1, 1, 1, 1,
0.1453631, -0.313916, 0.9549586, 1, 1, 1, 1, 1,
0.1454798, -0.9158091, 3.962559, 1, 1, 1, 1, 1,
0.1461095, -0.2211638, 1.847902, 1, 1, 1, 1, 1,
0.148676, -0.5823458, 3.554893, 1, 1, 1, 1, 1,
0.1496558, 1.315253, -1.138654, 1, 1, 1, 1, 1,
0.1499923, 0.5721675, -0.9479532, 1, 1, 1, 1, 1,
0.1545161, 2.563667, -1.240148, 1, 1, 1, 1, 1,
0.1573904, -1.587865, 4.167114, 1, 1, 1, 1, 1,
0.1590036, 0.5223697, 0.6460661, 0, 0, 1, 1, 1,
0.1592922, -0.6431596, 3.16851, 1, 0, 0, 1, 1,
0.1598717, 0.6810291, 0.3055452, 1, 0, 0, 1, 1,
0.1613541, -0.1897012, 2.370323, 1, 0, 0, 1, 1,
0.1613926, 0.07507405, 0.4908299, 1, 0, 0, 1, 1,
0.1613938, -0.2142846, 2.331399, 1, 0, 0, 1, 1,
0.1620672, -1.218275, 1.122548, 0, 0, 0, 1, 1,
0.1728089, 1.002576, -2.680252, 0, 0, 0, 1, 1,
0.1731879, 2.316213, 0.8991427, 0, 0, 0, 1, 1,
0.1777542, 1.52242, -0.5216766, 0, 0, 0, 1, 1,
0.1787236, 0.6637653, -0.1198865, 0, 0, 0, 1, 1,
0.1790864, 0.3895675, 2.948524, 0, 0, 0, 1, 1,
0.1842789, -0.6201786, 4.343449, 0, 0, 0, 1, 1,
0.1889755, 2.183445, 0.5007608, 1, 1, 1, 1, 1,
0.1910018, 0.907284, -0.2108397, 1, 1, 1, 1, 1,
0.1917211, 0.8941392, 0.6458718, 1, 1, 1, 1, 1,
0.1951075, -0.1222749, 1.883803, 1, 1, 1, 1, 1,
0.1985919, -0.3264825, 2.656606, 1, 1, 1, 1, 1,
0.1988188, -0.6274723, 2.978696, 1, 1, 1, 1, 1,
0.1991944, 2.105012, -3.234359, 1, 1, 1, 1, 1,
0.1994495, -0.2433682, 2.779438, 1, 1, 1, 1, 1,
0.2020619, -1.176754, 1.384832, 1, 1, 1, 1, 1,
0.2051871, 0.447265, -0.4050455, 1, 1, 1, 1, 1,
0.2086852, 0.9479416, -1.470061, 1, 1, 1, 1, 1,
0.2110221, -1.272303, 3.176364, 1, 1, 1, 1, 1,
0.2143148, 1.1746, -0.6841141, 1, 1, 1, 1, 1,
0.2210756, 0.001825455, 1.484074, 1, 1, 1, 1, 1,
0.2245966, 0.4541442, 1.833087, 1, 1, 1, 1, 1,
0.229662, 1.743625, 1.399734, 0, 0, 1, 1, 1,
0.2390523, 1.499457, -2.721346, 1, 0, 0, 1, 1,
0.2440069, 0.6949081, 0.5194219, 1, 0, 0, 1, 1,
0.2493636, -0.09517383, 0.6978352, 1, 0, 0, 1, 1,
0.2524001, -0.5971317, 4.623003, 1, 0, 0, 1, 1,
0.2574365, 0.3730329, 0.2752036, 1, 0, 0, 1, 1,
0.2576559, 0.6514173, 3.338667, 0, 0, 0, 1, 1,
0.2583042, 0.6210928, 0.3236634, 0, 0, 0, 1, 1,
0.2603707, -0.5556377, 1.484963, 0, 0, 0, 1, 1,
0.2620587, -0.4864024, 4.319096, 0, 0, 0, 1, 1,
0.262199, 1.183769, 0.5436968, 0, 0, 0, 1, 1,
0.2626984, -0.03131501, 1.787015, 0, 0, 0, 1, 1,
0.2630768, 0.7834083, -0.03827049, 0, 0, 0, 1, 1,
0.2641457, 1.003746, 0.4395944, 1, 1, 1, 1, 1,
0.2676626, 0.6147019, 0.1664394, 1, 1, 1, 1, 1,
0.2696877, -0.3457174, 3.652228, 1, 1, 1, 1, 1,
0.2697272, 1.788609, 0.4689179, 1, 1, 1, 1, 1,
0.2708607, 2.426857, -0.2224067, 1, 1, 1, 1, 1,
0.2763574, 0.8394852, 0.1429235, 1, 1, 1, 1, 1,
0.2784615, 0.8632436, 1.377896, 1, 1, 1, 1, 1,
0.2803815, -0.213135, 3.771445, 1, 1, 1, 1, 1,
0.2811473, 1.466357, 0.1496887, 1, 1, 1, 1, 1,
0.2814742, 1.234928, 1.799194, 1, 1, 1, 1, 1,
0.2821596, -0.7883677, 1.793672, 1, 1, 1, 1, 1,
0.2843491, 0.1373905, 1.684504, 1, 1, 1, 1, 1,
0.2882179, 0.7594522, 1.118249, 1, 1, 1, 1, 1,
0.2943794, -0.02043181, 1.823331, 1, 1, 1, 1, 1,
0.2948138, -0.8588488, 0.6609694, 1, 1, 1, 1, 1,
0.2952628, 0.5246719, 0.05115854, 0, 0, 1, 1, 1,
0.3000849, 1.829474, 0.7918856, 1, 0, 0, 1, 1,
0.3021296, -0.6068904, 3.368611, 1, 0, 0, 1, 1,
0.3046207, -1.561265, 3.197662, 1, 0, 0, 1, 1,
0.3054682, -0.3178961, 2.301919, 1, 0, 0, 1, 1,
0.3068115, 1.003089, -0.7066478, 1, 0, 0, 1, 1,
0.3081975, 0.8835371, -1.704924, 0, 0, 0, 1, 1,
0.3090197, -0.5414659, 1.82992, 0, 0, 0, 1, 1,
0.3124216, 0.1922598, -1.611443, 0, 0, 0, 1, 1,
0.3141609, 0.03256743, 2.28702, 0, 0, 0, 1, 1,
0.315747, -0.415921, 1.162898, 0, 0, 0, 1, 1,
0.3161206, 0.7653812, 0.1421412, 0, 0, 0, 1, 1,
0.3179364, -0.1687103, 2.638694, 0, 0, 0, 1, 1,
0.3185154, 0.2414823, 1.743149, 1, 1, 1, 1, 1,
0.3214971, 0.4646688, 1.080326, 1, 1, 1, 1, 1,
0.3215487, -0.5039042, 1.907338, 1, 1, 1, 1, 1,
0.3224796, -0.0510902, 1.995519, 1, 1, 1, 1, 1,
0.3269652, -0.5076892, 3.504779, 1, 1, 1, 1, 1,
0.3287634, -0.8764757, 2.521363, 1, 1, 1, 1, 1,
0.3375103, -0.2955155, 3.769419, 1, 1, 1, 1, 1,
0.3378869, -0.07290856, 1.642014, 1, 1, 1, 1, 1,
0.3393291, -0.09422864, 2.536031, 1, 1, 1, 1, 1,
0.3394017, 1.261817, 0.06662768, 1, 1, 1, 1, 1,
0.3398432, -0.5554655, 2.648918, 1, 1, 1, 1, 1,
0.3405063, 1.09512, -1.078082, 1, 1, 1, 1, 1,
0.3474691, -1.830127, 1.192836, 1, 1, 1, 1, 1,
0.3495086, -1.324541, 2.017525, 1, 1, 1, 1, 1,
0.3513986, -0.08311743, 2.050946, 1, 1, 1, 1, 1,
0.357046, 0.9831294, 0.7189314, 0, 0, 1, 1, 1,
0.361456, -0.7711312, 2.466873, 1, 0, 0, 1, 1,
0.3614707, 1.377611, 0.5409091, 1, 0, 0, 1, 1,
0.3623536, -0.6822817, 3.200078, 1, 0, 0, 1, 1,
0.3629647, -1.237022, 3.74329, 1, 0, 0, 1, 1,
0.3633487, 0.02011808, 1.05824, 1, 0, 0, 1, 1,
0.3658963, -0.9709982, 3.436649, 0, 0, 0, 1, 1,
0.3688237, -0.4453783, 2.531613, 0, 0, 0, 1, 1,
0.3702116, 0.08803182, -1.003186, 0, 0, 0, 1, 1,
0.3832507, -0.3396208, 1.633251, 0, 0, 0, 1, 1,
0.385761, 0.4849995, 2.200631, 0, 0, 0, 1, 1,
0.3886628, -0.8381971, 1.783606, 0, 0, 0, 1, 1,
0.3929935, -0.04963233, 0.9444279, 0, 0, 0, 1, 1,
0.3958325, 0.04128493, 2.817045, 1, 1, 1, 1, 1,
0.3977406, -0.9604921, 2.571277, 1, 1, 1, 1, 1,
0.4034282, -0.2110812, 3.156559, 1, 1, 1, 1, 1,
0.4065363, -0.03092929, 1.620005, 1, 1, 1, 1, 1,
0.4086103, 0.8077446, 1.101558, 1, 1, 1, 1, 1,
0.4097582, -2.167282, 3.98168, 1, 1, 1, 1, 1,
0.4106064, -0.3267609, 3.376586, 1, 1, 1, 1, 1,
0.4117665, 0.1691746, 1.660591, 1, 1, 1, 1, 1,
0.4140514, -0.549763, 3.821298, 1, 1, 1, 1, 1,
0.4161252, 0.5461864, 2.472232, 1, 1, 1, 1, 1,
0.4198114, -0.4398881, 1.951299, 1, 1, 1, 1, 1,
0.4220133, 0.3710795, 0.7997369, 1, 1, 1, 1, 1,
0.4223836, -0.05664873, 1.368266, 1, 1, 1, 1, 1,
0.43178, 0.4724329, 2.024312, 1, 1, 1, 1, 1,
0.4406587, 0.9756851, 2.373732, 1, 1, 1, 1, 1,
0.4415826, -2.131984, 2.739707, 0, 0, 1, 1, 1,
0.4487781, -0.3386033, 1.952612, 1, 0, 0, 1, 1,
0.4500919, -0.01477194, 3.888316, 1, 0, 0, 1, 1,
0.4620371, 1.381974, -0.5789647, 1, 0, 0, 1, 1,
0.462272, 1.487255, 1.128813, 1, 0, 0, 1, 1,
0.4649832, 0.00699523, 0.5228302, 1, 0, 0, 1, 1,
0.4653462, 0.2757096, 0.2212382, 0, 0, 0, 1, 1,
0.4724092, -0.11731, 2.800926, 0, 0, 0, 1, 1,
0.4727187, 0.8954133, 1.430523, 0, 0, 0, 1, 1,
0.4729148, 0.7511928, 0.922702, 0, 0, 0, 1, 1,
0.4742351, -1.494, 4.443799, 0, 0, 0, 1, 1,
0.4759605, -0.8600062, 3.381666, 0, 0, 0, 1, 1,
0.4760369, 1.795237, -0.4104024, 0, 0, 0, 1, 1,
0.4809101, -2.772069, 1.362062, 1, 1, 1, 1, 1,
0.4853842, 1.450573, -1.189122, 1, 1, 1, 1, 1,
0.487377, -0.6755829, 2.062812, 1, 1, 1, 1, 1,
0.4898271, -0.2297058, 0.9088079, 1, 1, 1, 1, 1,
0.4899001, 0.5919288, -0.7246012, 1, 1, 1, 1, 1,
0.491504, 0.06605642, 0.4863112, 1, 1, 1, 1, 1,
0.4969752, -0.5838008, 1.591221, 1, 1, 1, 1, 1,
0.4978281, -0.2754762, 3.084438, 1, 1, 1, 1, 1,
0.4999858, -0.7078245, 1.104947, 1, 1, 1, 1, 1,
0.5018235, -1.104812, 1.924594, 1, 1, 1, 1, 1,
0.5073448, 0.7998307, 0.711441, 1, 1, 1, 1, 1,
0.5080354, -2.015752, 3.486678, 1, 1, 1, 1, 1,
0.5093476, 0.6037498, 1.613573, 1, 1, 1, 1, 1,
0.5142676, -0.7831932, 2.647499, 1, 1, 1, 1, 1,
0.5169821, 1.25759, -0.0239986, 1, 1, 1, 1, 1,
0.5197582, -2.244056, 1.927491, 0, 0, 1, 1, 1,
0.5216417, -1.827401, 2.823636, 1, 0, 0, 1, 1,
0.5305734, -2.091447, 2.807298, 1, 0, 0, 1, 1,
0.5308225, 1.788495, 0.06689755, 1, 0, 0, 1, 1,
0.531965, -2.664517, 2.210264, 1, 0, 0, 1, 1,
0.5340358, 0.5138797, 0.8434544, 1, 0, 0, 1, 1,
0.5352923, 0.2365494, 0.6957561, 0, 0, 0, 1, 1,
0.5359241, 0.3656001, 1.087845, 0, 0, 0, 1, 1,
0.5369366, -0.146405, -0.124167, 0, 0, 0, 1, 1,
0.5379993, 0.1900685, 1.787622, 0, 0, 0, 1, 1,
0.5439883, 0.3814965, 1.806655, 0, 0, 0, 1, 1,
0.5446031, 1.187887, 0.1435312, 0, 0, 0, 1, 1,
0.5479191, 2.06644, -0.2592572, 0, 0, 0, 1, 1,
0.5604788, -0.2516108, 1.72218, 1, 1, 1, 1, 1,
0.5606145, 0.3183815, 0.636053, 1, 1, 1, 1, 1,
0.5710241, 0.3859768, 0.09907158, 1, 1, 1, 1, 1,
0.5764515, 0.3534577, 1.235427, 1, 1, 1, 1, 1,
0.5773389, -1.202335, 1.512382, 1, 1, 1, 1, 1,
0.5788135, 0.3880875, 0.9018232, 1, 1, 1, 1, 1,
0.6034557, 1.46974, 1.397253, 1, 1, 1, 1, 1,
0.6151959, 0.9466931, -0.06859535, 1, 1, 1, 1, 1,
0.6179999, -1.184934, 2.496266, 1, 1, 1, 1, 1,
0.6188456, -1.819846, 1.650751, 1, 1, 1, 1, 1,
0.6199178, 0.08663439, 1.452569, 1, 1, 1, 1, 1,
0.6199989, 0.04345885, 2.296194, 1, 1, 1, 1, 1,
0.6210762, 1.720923, 0.8482241, 1, 1, 1, 1, 1,
0.6238124, -0.8805603, 4.644344, 1, 1, 1, 1, 1,
0.6240822, -2.152134, 3.07257, 1, 1, 1, 1, 1,
0.6279993, 0.07475997, 1.378672, 0, 0, 1, 1, 1,
0.6342164, 0.8890799, 1.207871, 1, 0, 0, 1, 1,
0.6373407, 0.4636492, 1.560893, 1, 0, 0, 1, 1,
0.6382163, 1.969068, 0.2054827, 1, 0, 0, 1, 1,
0.6390964, -0.2692406, 3.092236, 1, 0, 0, 1, 1,
0.6430087, -0.8322032, 3.03196, 1, 0, 0, 1, 1,
0.6461929, -0.1330861, 0.50831, 0, 0, 0, 1, 1,
0.6495295, 0.4506884, 2.533662, 0, 0, 0, 1, 1,
0.6509053, 2.285783, 0.7610335, 0, 0, 0, 1, 1,
0.6614407, -0.9600529, -0.09891485, 0, 0, 0, 1, 1,
0.6647573, 0.2770645, 1.877428, 0, 0, 0, 1, 1,
0.667145, -0.4691518, 2.758822, 0, 0, 0, 1, 1,
0.6684523, 0.875779, 2.190106, 0, 0, 0, 1, 1,
0.6708729, 0.3184665, 1.604915, 1, 1, 1, 1, 1,
0.6734526, -3.146525, 3.026252, 1, 1, 1, 1, 1,
0.6762493, 1.50804, 1.183241, 1, 1, 1, 1, 1,
0.6767562, 0.2687688, 0.154709, 1, 1, 1, 1, 1,
0.6788397, -0.5116461, 3.108559, 1, 1, 1, 1, 1,
0.6835302, -0.6342718, 2.173139, 1, 1, 1, 1, 1,
0.6846431, 0.9644915, 0.06016421, 1, 1, 1, 1, 1,
0.6910433, -0.7181754, 2.366807, 1, 1, 1, 1, 1,
0.6918707, -2.094867, 2.926189, 1, 1, 1, 1, 1,
0.6924694, 0.7640074, 1.251419, 1, 1, 1, 1, 1,
0.6938925, -0.8369036, 1.693442, 1, 1, 1, 1, 1,
0.6948039, -0.3978361, 1.509705, 1, 1, 1, 1, 1,
0.7003325, 0.60446, -0.7301602, 1, 1, 1, 1, 1,
0.7040729, -0.9823039, 2.67233, 1, 1, 1, 1, 1,
0.7117007, 0.1945339, 2.960742, 1, 1, 1, 1, 1,
0.7136651, -0.2521586, 1.022416, 0, 0, 1, 1, 1,
0.7189156, 0.5306883, 2.352959, 1, 0, 0, 1, 1,
0.7222649, -0.876177, 2.827258, 1, 0, 0, 1, 1,
0.7225366, 0.1052963, 1.130628, 1, 0, 0, 1, 1,
0.7307845, -1.722158, 2.12336, 1, 0, 0, 1, 1,
0.7339873, -2.189329, 1.931033, 1, 0, 0, 1, 1,
0.7348741, -0.3600619, 2.968862, 0, 0, 0, 1, 1,
0.7395681, -0.8137327, 2.960106, 0, 0, 0, 1, 1,
0.7416752, 1.046722, 1.165203, 0, 0, 0, 1, 1,
0.744732, -0.7083156, 2.97867, 0, 0, 0, 1, 1,
0.7473555, -1.286698, 3.549626, 0, 0, 0, 1, 1,
0.7473919, -1.134992, 2.185678, 0, 0, 0, 1, 1,
0.7487825, 0.3394564, 0.3242089, 0, 0, 0, 1, 1,
0.750918, -0.5210633, 1.499469, 1, 1, 1, 1, 1,
0.7532238, -0.9770553, 2.317127, 1, 1, 1, 1, 1,
0.7544556, -1.812942, 1.452915, 1, 1, 1, 1, 1,
0.7603091, -0.6499227, 1.063877, 1, 1, 1, 1, 1,
0.7631832, 1.772977, 1.449601, 1, 1, 1, 1, 1,
0.764177, 0.1357238, 0.76948, 1, 1, 1, 1, 1,
0.7658246, 0.3789159, 0.7383227, 1, 1, 1, 1, 1,
0.7676032, -0.3083344, 1.660087, 1, 1, 1, 1, 1,
0.770233, -1.055205, 1.30136, 1, 1, 1, 1, 1,
0.773854, 0.01221275, 2.274702, 1, 1, 1, 1, 1,
0.7740508, -0.568936, 2.196273, 1, 1, 1, 1, 1,
0.7823489, 0.5585652, 0.2155363, 1, 1, 1, 1, 1,
0.786714, 0.1378956, 2.276174, 1, 1, 1, 1, 1,
0.7965095, -0.6243665, 2.541677, 1, 1, 1, 1, 1,
0.7975988, -0.8133523, 2.621611, 1, 1, 1, 1, 1,
0.7991839, 1.681543, 1.067075, 0, 0, 1, 1, 1,
0.8000555, -0.9776981, 3.347545, 1, 0, 0, 1, 1,
0.8002843, 0.9194745, 1.023908, 1, 0, 0, 1, 1,
0.8025818, -1.16473, 2.490468, 1, 0, 0, 1, 1,
0.8027164, 0.5430796, 0.2478938, 1, 0, 0, 1, 1,
0.8048792, -0.2656311, 1.609536, 1, 0, 0, 1, 1,
0.8061845, 0.2398413, 1.918786, 0, 0, 0, 1, 1,
0.8129246, -1.139456, 2.304253, 0, 0, 0, 1, 1,
0.8203574, 0.7618419, -0.06510689, 0, 0, 0, 1, 1,
0.821048, -1.000121, 1.150681, 0, 0, 0, 1, 1,
0.821279, 0.2805082, -0.7634501, 0, 0, 0, 1, 1,
0.8255267, -0.6293887, 3.464112, 0, 0, 0, 1, 1,
0.8259063, -0.4880359, 0.8824412, 0, 0, 0, 1, 1,
0.8269209, -1.076038, 1.712945, 1, 1, 1, 1, 1,
0.8269792, 0.485759, 0.4527279, 1, 1, 1, 1, 1,
0.8404447, 0.9116636, 2.667811, 1, 1, 1, 1, 1,
0.8455055, -0.8663854, 2.110721, 1, 1, 1, 1, 1,
0.8489502, 0.5117306, 1.698346, 1, 1, 1, 1, 1,
0.8519355, 0.5752373, 1.080927, 1, 1, 1, 1, 1,
0.852616, -0.5821447, 3.286168, 1, 1, 1, 1, 1,
0.8541958, -0.7804943, 2.539598, 1, 1, 1, 1, 1,
0.8553119, -0.1920399, 1.170865, 1, 1, 1, 1, 1,
0.8567761, 1.024832, 0.5378938, 1, 1, 1, 1, 1,
0.8573812, -0.5256253, 2.871639, 1, 1, 1, 1, 1,
0.8618326, -0.1630265, 2.668939, 1, 1, 1, 1, 1,
0.8665598, -0.3634697, 1.340448, 1, 1, 1, 1, 1,
0.8679214, -0.03880478, 1.60255, 1, 1, 1, 1, 1,
0.8719221, -0.08481606, 0.7542935, 1, 1, 1, 1, 1,
0.8766186, -1.402074, 0.4188038, 0, 0, 1, 1, 1,
0.8781993, -0.793564, 1.746491, 1, 0, 0, 1, 1,
0.8788444, 0.3521678, 0.1326367, 1, 0, 0, 1, 1,
0.8795372, 0.2714215, 0.4766379, 1, 0, 0, 1, 1,
0.8828254, -0.4373523, 3.170047, 1, 0, 0, 1, 1,
0.8829422, -1.575466, 4.281958, 1, 0, 0, 1, 1,
0.8911486, 1.876766, -0.588405, 0, 0, 0, 1, 1,
0.8913869, 1.315977, -0.2311306, 0, 0, 0, 1, 1,
0.8914834, 0.770867, 0.4086097, 0, 0, 0, 1, 1,
0.8933236, -0.2852131, 1.774747, 0, 0, 0, 1, 1,
0.9004565, 0.4521319, 0.9794536, 0, 0, 0, 1, 1,
0.9052685, -2.092045, 2.958378, 0, 0, 0, 1, 1,
0.9087112, 0.2116418, 2.661516, 0, 0, 0, 1, 1,
0.9099255, 2.814777, 0.2125207, 1, 1, 1, 1, 1,
0.9116529, 0.3166753, 1.372545, 1, 1, 1, 1, 1,
0.9160844, 0.9676449, 0.6093878, 1, 1, 1, 1, 1,
0.9161699, 0.581311, 1.358582, 1, 1, 1, 1, 1,
0.9171001, 0.2284227, 2.170322, 1, 1, 1, 1, 1,
0.9213, 0.08672661, 0.2237395, 1, 1, 1, 1, 1,
0.9231288, -0.3629094, 0.6837474, 1, 1, 1, 1, 1,
0.9242565, -1.866986, 1.317863, 1, 1, 1, 1, 1,
0.9298649, 1.203787, 0.2577749, 1, 1, 1, 1, 1,
0.9324242, 0.2005107, -0.09318999, 1, 1, 1, 1, 1,
0.9339392, -1.119351, 4.763768, 1, 1, 1, 1, 1,
0.9384947, 0.2987765, 1.145621, 1, 1, 1, 1, 1,
0.940419, 1.895252, 1.385676, 1, 1, 1, 1, 1,
0.9631034, 0.9863586, 0.9943234, 1, 1, 1, 1, 1,
0.9633121, 0.03402958, 0.3223907, 1, 1, 1, 1, 1,
0.9658642, -0.9338618, 1.585585, 0, 0, 1, 1, 1,
0.9669767, -0.1114184, 2.763816, 1, 0, 0, 1, 1,
0.9679033, 1.150176, 1.795427, 1, 0, 0, 1, 1,
0.9688246, -1.976664, 4.973702, 1, 0, 0, 1, 1,
0.9741527, -1.034547, 3.064303, 1, 0, 0, 1, 1,
0.9806199, 0.6877221, 1.262411, 1, 0, 0, 1, 1,
0.9818991, 1.930337, 0.354883, 0, 0, 0, 1, 1,
0.9819711, 0.5005842, 0.8033705, 0, 0, 0, 1, 1,
0.9833468, -0.9936135, 2.723883, 0, 0, 0, 1, 1,
0.9868122, -0.1650048, 1.866349, 0, 0, 0, 1, 1,
0.9876208, -0.3614021, 1.855612, 0, 0, 0, 1, 1,
0.9896408, -1.24844, 1.191994, 0, 0, 0, 1, 1,
0.9901684, -0.794573, 1.600759, 0, 0, 0, 1, 1,
0.9967614, -0.5316646, 2.273333, 1, 1, 1, 1, 1,
0.998823, -0.6003081, 1.155857, 1, 1, 1, 1, 1,
1.008394, 1.803751, 1.048865, 1, 1, 1, 1, 1,
1.015119, -0.6995208, 1.404349, 1, 1, 1, 1, 1,
1.015368, -0.4496113, 1.948646, 1, 1, 1, 1, 1,
1.016028, 1.392817, -0.09215166, 1, 1, 1, 1, 1,
1.021782, -1.079058, 1.878865, 1, 1, 1, 1, 1,
1.022341, -0.1268389, 1.871659, 1, 1, 1, 1, 1,
1.024689, -0.03033271, 0.2006648, 1, 1, 1, 1, 1,
1.031628, -0.6015198, 2.445125, 1, 1, 1, 1, 1,
1.032408, -0.4524111, 3.88196, 1, 1, 1, 1, 1,
1.035529, -0.4335808, 1.157732, 1, 1, 1, 1, 1,
1.035743, -1.471861, 2.625632, 1, 1, 1, 1, 1,
1.043708, -0.8313122, 2.003172, 1, 1, 1, 1, 1,
1.057952, -0.2682411, 2.123785, 1, 1, 1, 1, 1,
1.060819, -2.171064, 2.146569, 0, 0, 1, 1, 1,
1.07448, -0.6727161, 2.100271, 1, 0, 0, 1, 1,
1.076607, 0.04184867, 1.169288, 1, 0, 0, 1, 1,
1.077205, 0.1056699, 2.298244, 1, 0, 0, 1, 1,
1.087889, -0.414203, 0.08451339, 1, 0, 0, 1, 1,
1.089296, 1.209902, 1.749868, 1, 0, 0, 1, 1,
1.090588, -0.1636418, 2.954007, 0, 0, 0, 1, 1,
1.090851, 0.2727172, 1.206618, 0, 0, 0, 1, 1,
1.092183, -0.7940895, 1.967705, 0, 0, 0, 1, 1,
1.100052, -0.5488836, 1.786034, 0, 0, 0, 1, 1,
1.102241, 0.4564053, 1.220376, 0, 0, 0, 1, 1,
1.106924, 0.8718538, -1.187753, 0, 0, 0, 1, 1,
1.109425, 1.291515, 1.576364, 0, 0, 0, 1, 1,
1.114877, 0.3535499, 1.136103, 1, 1, 1, 1, 1,
1.124179, -0.4404125, 3.765013, 1, 1, 1, 1, 1,
1.124357, 0.109595, -0.1913244, 1, 1, 1, 1, 1,
1.127424, 1.105026, -0.6093529, 1, 1, 1, 1, 1,
1.151995, 0.8013968, 0.7499913, 1, 1, 1, 1, 1,
1.159768, -0.4948297, 1.139913, 1, 1, 1, 1, 1,
1.160759, -0.9193124, 1.98754, 1, 1, 1, 1, 1,
1.167252, -1.134921, 2.928196, 1, 1, 1, 1, 1,
1.17083, 0.6866478, 1.548673, 1, 1, 1, 1, 1,
1.170857, 0.8570194, 1.704749, 1, 1, 1, 1, 1,
1.17407, -1.013964, 4.124195, 1, 1, 1, 1, 1,
1.180276, -1.937492, 4.130632, 1, 1, 1, 1, 1,
1.187144, -0.4646913, 2.652548, 1, 1, 1, 1, 1,
1.188069, 0.9819294, 0.7125928, 1, 1, 1, 1, 1,
1.191896, -0.2954704, 2.83294, 1, 1, 1, 1, 1,
1.192526, 1.397857, 1.666307, 0, 0, 1, 1, 1,
1.193322, 0.5529642, -0.980622, 1, 0, 0, 1, 1,
1.1942, -2.052562, 3.412512, 1, 0, 0, 1, 1,
1.196517, 0.7691883, 0.1510958, 1, 0, 0, 1, 1,
1.205093, -0.5154476, 3.969654, 1, 0, 0, 1, 1,
1.213208, 0.2662056, 1.911766, 1, 0, 0, 1, 1,
1.214568, 1.07948, 1.11839, 0, 0, 0, 1, 1,
1.215739, -1.564213, 2.398297, 0, 0, 0, 1, 1,
1.218498, 1.555425, -0.1840578, 0, 0, 0, 1, 1,
1.222337, 0.1012746, 2.09507, 0, 0, 0, 1, 1,
1.222423, -0.4398433, 1.174973, 0, 0, 0, 1, 1,
1.230314, -0.6158282, 3.322276, 0, 0, 0, 1, 1,
1.237245, 0.1860359, 1.050382, 0, 0, 0, 1, 1,
1.244278, -1.582807, 2.99239, 1, 1, 1, 1, 1,
1.250608, -2.457239, 3.474166, 1, 1, 1, 1, 1,
1.260801, -0.1398683, 1.354483, 1, 1, 1, 1, 1,
1.260867, 0.7345701, 2.716621, 1, 1, 1, 1, 1,
1.289339, 1.673174, -0.4644587, 1, 1, 1, 1, 1,
1.290694, -0.2617075, 2.11247, 1, 1, 1, 1, 1,
1.301689, 0.5424748, 2.20141, 1, 1, 1, 1, 1,
1.344942, 0.5522981, 3.006017, 1, 1, 1, 1, 1,
1.347926, -0.6069367, 3.203532, 1, 1, 1, 1, 1,
1.370569, -0.2354054, 0.9950722, 1, 1, 1, 1, 1,
1.376681, -0.75324, 3.828802, 1, 1, 1, 1, 1,
1.380471, 1.627791, 0.6028734, 1, 1, 1, 1, 1,
1.385285, 0.2842624, 0.488336, 1, 1, 1, 1, 1,
1.392128, 0.5874946, 1.76321, 1, 1, 1, 1, 1,
1.400287, -1.207472, 3.270086, 1, 1, 1, 1, 1,
1.413286, 1.007028, 0.3808917, 0, 0, 1, 1, 1,
1.417429, -1.534313, 3.79712, 1, 0, 0, 1, 1,
1.423303, 0.09245931, 1.959003, 1, 0, 0, 1, 1,
1.43012, -0.9403154, 1.511187, 1, 0, 0, 1, 1,
1.435389, 0.8948296, 1.577602, 1, 0, 0, 1, 1,
1.442404, 1.715366, 0.6897953, 1, 0, 0, 1, 1,
1.442639, 0.16111, -0.702969, 0, 0, 0, 1, 1,
1.443623, 0.4903188, 1.376432, 0, 0, 0, 1, 1,
1.467026, 0.4916917, 1.004793, 0, 0, 0, 1, 1,
1.489831, -2.015207, 1.744532, 0, 0, 0, 1, 1,
1.497441, 0.3739009, 2.168969, 0, 0, 0, 1, 1,
1.51706, -0.7700667, 2.863805, 0, 0, 0, 1, 1,
1.519189, -0.04394857, 0.6233673, 0, 0, 0, 1, 1,
1.538727, 1.605396, 2.73746, 1, 1, 1, 1, 1,
1.540294, -0.7420348, 2.30585, 1, 1, 1, 1, 1,
1.545665, 1.308363, 0.5192203, 1, 1, 1, 1, 1,
1.553865, 1.46102, 0.2259273, 1, 1, 1, 1, 1,
1.560777, -0.441612, 1.740458, 1, 1, 1, 1, 1,
1.579779, -0.2837978, 2.731656, 1, 1, 1, 1, 1,
1.596618, -0.6817468, 2.684794, 1, 1, 1, 1, 1,
1.602564, -0.1818073, 1.292238, 1, 1, 1, 1, 1,
1.605956, -0.6343663, 1.719092, 1, 1, 1, 1, 1,
1.608696, -0.4643032, 1.982251, 1, 1, 1, 1, 1,
1.617617, 0.1358099, 0.5006156, 1, 1, 1, 1, 1,
1.632576, 0.322563, 0.6692051, 1, 1, 1, 1, 1,
1.636687, 0.6669469, 1.986831, 1, 1, 1, 1, 1,
1.665809, 0.8111952, 0.5322738, 1, 1, 1, 1, 1,
1.666495, 0.2076366, 2.401041, 1, 1, 1, 1, 1,
1.669477, 0.02346081, 0.4182676, 0, 0, 1, 1, 1,
1.677348, -0.5205147, 2.364558, 1, 0, 0, 1, 1,
1.682512, -1.740275, 2.256891, 1, 0, 0, 1, 1,
1.684499, 2.010015, 0.4922011, 1, 0, 0, 1, 1,
1.724676, 1.330178, -0.5549707, 1, 0, 0, 1, 1,
1.726042, 0.5681383, 2.438143, 1, 0, 0, 1, 1,
1.734538, 1.074165, 0.2882341, 0, 0, 0, 1, 1,
1.745603, 1.261213, 0.6280215, 0, 0, 0, 1, 1,
1.759849, 1.088708, 1.676311, 0, 0, 0, 1, 1,
1.790704, -0.7881844, 2.395311, 0, 0, 0, 1, 1,
1.791134, -0.4184042, 2.467287, 0, 0, 0, 1, 1,
1.791309, -1.723427, 3.10093, 0, 0, 0, 1, 1,
1.807675, -0.07911637, 1.694394, 0, 0, 0, 1, 1,
1.815395, 0.6425905, 0.5721937, 1, 1, 1, 1, 1,
1.82391, 0.7362531, 1.901766, 1, 1, 1, 1, 1,
1.836198, 0.9687077, 1.18758, 1, 1, 1, 1, 1,
1.85945, -1.786469, 2.356236, 1, 1, 1, 1, 1,
1.867568, 0.4913463, 1.941515, 1, 1, 1, 1, 1,
1.870156, -1.847286, 2.972724, 1, 1, 1, 1, 1,
1.927842, -1.217624, 3.093452, 1, 1, 1, 1, 1,
1.943354, 1.809147, 1.724004, 1, 1, 1, 1, 1,
1.952231, 1.538733, -1.212862, 1, 1, 1, 1, 1,
1.953643, 1.777085, 0.2762347, 1, 1, 1, 1, 1,
2.020022, -0.8639141, 1.656948, 1, 1, 1, 1, 1,
2.024946, -0.2568908, 2.922019, 1, 1, 1, 1, 1,
2.02755, -0.4938685, 2.563224, 1, 1, 1, 1, 1,
2.097062, 0.9641775, -0.2475153, 1, 1, 1, 1, 1,
2.154248, 0.2233816, 0.9645022, 1, 1, 1, 1, 1,
2.154659, -0.05344687, 2.009527, 0, 0, 1, 1, 1,
2.15883, -0.7983038, 2.490816, 1, 0, 0, 1, 1,
2.197303, -0.4874185, 1.576361, 1, 0, 0, 1, 1,
2.204884, -0.6134427, 1.452951, 1, 0, 0, 1, 1,
2.210542, 1.254093, 0.1530231, 1, 0, 0, 1, 1,
2.216935, 0.03056088, 0.01686354, 1, 0, 0, 1, 1,
2.244761, 0.4784352, 1.672397, 0, 0, 0, 1, 1,
2.247859, 1.02169, -0.02891902, 0, 0, 0, 1, 1,
2.316154, 1.290424, 0.489223, 0, 0, 0, 1, 1,
2.317116, 0.3150877, 1.652918, 0, 0, 0, 1, 1,
2.445066, -0.1121002, 1.417857, 0, 0, 0, 1, 1,
2.498523, -0.1968382, 3.980369, 0, 0, 0, 1, 1,
2.591836, -2.278274, 2.304015, 0, 0, 0, 1, 1,
2.669504, 1.502482, 1.383052, 1, 1, 1, 1, 1,
2.677462, 1.349298, 1.033346, 1, 1, 1, 1, 1,
2.751181, 1.237223, 1.724793, 1, 1, 1, 1, 1,
2.810359, -0.2775156, 3.269368, 1, 1, 1, 1, 1,
3.118726, -0.7069542, 3.551152, 1, 1, 1, 1, 1,
3.252277, -1.137196, 2.037958, 1, 1, 1, 1, 1,
3.288486, 1.200565, 1.138563, 1, 1, 1, 1, 1
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
var radius = 9.504459;
var distance = 33.38401;
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
mvMatrix.translate( -0.1757852, 0.3848801, 0.2715394 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.38401);
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
