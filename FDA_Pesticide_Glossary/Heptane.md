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
-3.090793, -0.222846, -2.081007, 1, 0, 0, 1,
-2.753437, 0.4863868, -1.478414, 1, 0.007843138, 0, 1,
-2.712227, 0.4760338, -0.9057609, 1, 0.01176471, 0, 1,
-2.667507, 3.122658, -0.3651828, 1, 0.01960784, 0, 1,
-2.528699, 0.6178144, -1.580305, 1, 0.02352941, 0, 1,
-2.477654, 0.07210059, -2.664623, 1, 0.03137255, 0, 1,
-2.452255, 1.244568, -0.3030008, 1, 0.03529412, 0, 1,
-2.401573, -0.2807216, -2.56737, 1, 0.04313726, 0, 1,
-2.387696, 2.855586, -0.5784703, 1, 0.04705882, 0, 1,
-2.362543, -0.6572299, -3.331441, 1, 0.05490196, 0, 1,
-2.319366, -0.462452, -0.8218508, 1, 0.05882353, 0, 1,
-2.279045, -0.2593819, -0.9601174, 1, 0.06666667, 0, 1,
-2.255511, 0.09832671, -1.66566, 1, 0.07058824, 0, 1,
-2.198132, 0.1847215, -1.304035, 1, 0.07843138, 0, 1,
-2.187119, -0.103839, -1.97269, 1, 0.08235294, 0, 1,
-2.175943, 1.514873, 1.070272, 1, 0.09019608, 0, 1,
-2.137048, 1.056813, -1.279053, 1, 0.09411765, 0, 1,
-2.120476, -1.239464, -1.7349, 1, 0.1019608, 0, 1,
-2.090389, 0.6871871, 0.3618953, 1, 0.1098039, 0, 1,
-2.065188, 0.1533994, -2.256402, 1, 0.1137255, 0, 1,
-2.041666, -1.400081, -1.758214, 1, 0.1215686, 0, 1,
-2.030404, -0.3189158, -1.690035, 1, 0.1254902, 0, 1,
-1.998151, -0.5597807, -2.952489, 1, 0.1333333, 0, 1,
-1.969447, -1.037083, -3.712886, 1, 0.1372549, 0, 1,
-1.962796, 0.2503066, -3.269271, 1, 0.145098, 0, 1,
-1.946696, 0.132637, -0.0729065, 1, 0.1490196, 0, 1,
-1.906697, -0.8274339, -3.166767, 1, 0.1568628, 0, 1,
-1.880988, -0.6576059, -2.458741, 1, 0.1607843, 0, 1,
-1.87735, -0.2906795, -1.029538, 1, 0.1686275, 0, 1,
-1.855461, 0.5967048, -2.512606, 1, 0.172549, 0, 1,
-1.852318, -0.6929002, -2.556238, 1, 0.1803922, 0, 1,
-1.834543, -0.03944055, -2.349917, 1, 0.1843137, 0, 1,
-1.833025, -1.038922, -1.766133, 1, 0.1921569, 0, 1,
-1.83166, 0.6162891, -1.451578, 1, 0.1960784, 0, 1,
-1.828667, 0.5360821, -0.5832673, 1, 0.2039216, 0, 1,
-1.824944, -2.828828, -3.108656, 1, 0.2117647, 0, 1,
-1.817707, -0.5961769, -1.676329, 1, 0.2156863, 0, 1,
-1.812916, -0.466271, -1.638551, 1, 0.2235294, 0, 1,
-1.780902, -0.6717691, -0.8122247, 1, 0.227451, 0, 1,
-1.774337, -0.6247134, -2.49442, 1, 0.2352941, 0, 1,
-1.748198, -0.8185615, -2.016647, 1, 0.2392157, 0, 1,
-1.747987, 0.9517496, -0.7866927, 1, 0.2470588, 0, 1,
-1.727222, 0.2498036, -2.04803, 1, 0.2509804, 0, 1,
-1.698815, -0.3277589, -2.300607, 1, 0.2588235, 0, 1,
-1.694432, -0.879288, -1.945626, 1, 0.2627451, 0, 1,
-1.673124, 0.01224107, -4.212895, 1, 0.2705882, 0, 1,
-1.66981, 0.360246, -2.198083, 1, 0.2745098, 0, 1,
-1.660709, -1.268853, -2.69106, 1, 0.282353, 0, 1,
-1.637233, 2.429646, 0.8069181, 1, 0.2862745, 0, 1,
-1.623862, 0.2927215, 0.3520936, 1, 0.2941177, 0, 1,
-1.623643, 0.8035363, -2.199724, 1, 0.3019608, 0, 1,
-1.617941, 1.074124, -1.934744, 1, 0.3058824, 0, 1,
-1.59377, 0.6081205, -0.9186055, 1, 0.3137255, 0, 1,
-1.554949, -0.3281693, -3.85937, 1, 0.3176471, 0, 1,
-1.554831, -0.9380866, -2.659915, 1, 0.3254902, 0, 1,
-1.5525, 0.07286648, -2.456823, 1, 0.3294118, 0, 1,
-1.552434, 0.5835304, -1.838865, 1, 0.3372549, 0, 1,
-1.550317, 1.16875, -0.7474396, 1, 0.3411765, 0, 1,
-1.538804, -0.4050529, -2.292484, 1, 0.3490196, 0, 1,
-1.536622, 0.5120052, -0.6567399, 1, 0.3529412, 0, 1,
-1.515265, 0.1840948, -0.0006728872, 1, 0.3607843, 0, 1,
-1.503961, 0.3429554, -0.008438704, 1, 0.3647059, 0, 1,
-1.503663, 1.516483, -1.561691, 1, 0.372549, 0, 1,
-1.502256, -2.292643, -4.454679, 1, 0.3764706, 0, 1,
-1.496613, 0.1543631, -1.496954, 1, 0.3843137, 0, 1,
-1.495303, -0.8187484, -1.645394, 1, 0.3882353, 0, 1,
-1.492405, -0.3516107, -0.7531174, 1, 0.3960784, 0, 1,
-1.484571, 0.4965571, -0.4828774, 1, 0.4039216, 0, 1,
-1.481763, -2.379397, -3.922916, 1, 0.4078431, 0, 1,
-1.468483, -0.6914504, -2.319398, 1, 0.4156863, 0, 1,
-1.452985, -1.295173, -5.193792, 1, 0.4196078, 0, 1,
-1.451507, -1.090296, -2.626338, 1, 0.427451, 0, 1,
-1.448741, 1.048854, -1.154343, 1, 0.4313726, 0, 1,
-1.44364, 0.2521634, -1.340015, 1, 0.4392157, 0, 1,
-1.440539, -0.183888, -2.165076, 1, 0.4431373, 0, 1,
-1.433923, 0.1030686, -2.528616, 1, 0.4509804, 0, 1,
-1.42402, 1.098878, 0.1173847, 1, 0.454902, 0, 1,
-1.423316, -0.3030376, -0.3755213, 1, 0.4627451, 0, 1,
-1.420908, 1.065868, 1.191712, 1, 0.4666667, 0, 1,
-1.417017, 0.7793972, -1.40291, 1, 0.4745098, 0, 1,
-1.408115, 0.3169939, -1.201868, 1, 0.4784314, 0, 1,
-1.406417, -0.5435711, -2.161976, 1, 0.4862745, 0, 1,
-1.405863, -0.07647746, -2.021669, 1, 0.4901961, 0, 1,
-1.404539, -0.1238808, 0.5136744, 1, 0.4980392, 0, 1,
-1.403725, -0.08828921, -2.25774, 1, 0.5058824, 0, 1,
-1.394192, -0.4937172, -1.109714, 1, 0.509804, 0, 1,
-1.371985, 0.4355073, -0.6171274, 1, 0.5176471, 0, 1,
-1.368908, 0.6025844, -0.7415155, 1, 0.5215687, 0, 1,
-1.362246, -1.026715, -3.091926, 1, 0.5294118, 0, 1,
-1.361821, 1.182079, -0.5692592, 1, 0.5333334, 0, 1,
-1.361581, -1.672817, -0.3800648, 1, 0.5411765, 0, 1,
-1.347799, 1.931013, -0.8883212, 1, 0.5450981, 0, 1,
-1.346251, 0.01350802, -1.227808, 1, 0.5529412, 0, 1,
-1.345539, 0.6254385, -0.1618456, 1, 0.5568628, 0, 1,
-1.337459, 1.654622, 0.3743516, 1, 0.5647059, 0, 1,
-1.33424, 0.3270385, -0.3506481, 1, 0.5686275, 0, 1,
-1.332952, -0.8556311, -0.9695187, 1, 0.5764706, 0, 1,
-1.328616, -0.3779523, -0.8183595, 1, 0.5803922, 0, 1,
-1.326407, 0.6073182, -1.787092, 1, 0.5882353, 0, 1,
-1.320657, 0.7739071, 0.2352748, 1, 0.5921569, 0, 1,
-1.318874, 0.5020964, -2.330563, 1, 0.6, 0, 1,
-1.310353, 2.159441, -1.821115, 1, 0.6078432, 0, 1,
-1.302545, 0.5534936, -0.7088647, 1, 0.6117647, 0, 1,
-1.294258, -1.374238, -2.153424, 1, 0.6196079, 0, 1,
-1.285037, -0.2905644, -1.311465, 1, 0.6235294, 0, 1,
-1.278372, -0.1819639, -3.036302, 1, 0.6313726, 0, 1,
-1.272255, 0.5329413, -1.41846, 1, 0.6352941, 0, 1,
-1.258459, -0.7958685, -1.595211, 1, 0.6431373, 0, 1,
-1.256632, 0.5435712, -2.002024, 1, 0.6470588, 0, 1,
-1.241174, -0.1496811, -1.654913, 1, 0.654902, 0, 1,
-1.241093, -0.1452618, -1.499245, 1, 0.6588235, 0, 1,
-1.218196, -2.07443, -2.81958, 1, 0.6666667, 0, 1,
-1.216344, -2.832687, -2.86677, 1, 0.6705883, 0, 1,
-1.21522, -1.15519, -2.253015, 1, 0.6784314, 0, 1,
-1.200143, 2.233649, 1.056742, 1, 0.682353, 0, 1,
-1.195398, 0.6790873, 0.04032041, 1, 0.6901961, 0, 1,
-1.191373, -1.584288, -2.491242, 1, 0.6941177, 0, 1,
-1.19039, 0.2825434, -2.415547, 1, 0.7019608, 0, 1,
-1.187298, -0.7690855, -2.514591, 1, 0.7098039, 0, 1,
-1.178381, -0.3367381, -2.61919, 1, 0.7137255, 0, 1,
-1.176705, -1.010817, -1.041682, 1, 0.7215686, 0, 1,
-1.175287, -0.9480695, -3.028136, 1, 0.7254902, 0, 1,
-1.175211, -0.629279, -3.397031, 1, 0.7333333, 0, 1,
-1.172471, 0.4429579, -1.571788, 1, 0.7372549, 0, 1,
-1.172224, 1.93762, -1.896639, 1, 0.7450981, 0, 1,
-1.172164, -0.5652691, -2.762872, 1, 0.7490196, 0, 1,
-1.160937, 1.474259, -0.9303403, 1, 0.7568628, 0, 1,
-1.150352, 1.125137, -1.046054, 1, 0.7607843, 0, 1,
-1.149723, -0.7108596, -2.270851, 1, 0.7686275, 0, 1,
-1.139905, -0.720309, -0.2530515, 1, 0.772549, 0, 1,
-1.136841, 0.49343, -1.528218, 1, 0.7803922, 0, 1,
-1.126546, 1.348459, -1.323738, 1, 0.7843137, 0, 1,
-1.120898, -0.5151848, -1.220422, 1, 0.7921569, 0, 1,
-1.119533, 1.648032, -0.5868766, 1, 0.7960784, 0, 1,
-1.117125, 0.8832626, -0.3114087, 1, 0.8039216, 0, 1,
-1.115132, -0.093491, -0.5542822, 1, 0.8117647, 0, 1,
-1.114526, -1.054215, -1.611036, 1, 0.8156863, 0, 1,
-1.11426, 0.9954311, -1.617646, 1, 0.8235294, 0, 1,
-1.112582, -1.074346, -3.410695, 1, 0.827451, 0, 1,
-1.108103, 0.07956728, -0.8214565, 1, 0.8352941, 0, 1,
-1.098589, 1.155695, -1.648256, 1, 0.8392157, 0, 1,
-1.097927, 0.4711362, -1.704479, 1, 0.8470588, 0, 1,
-1.096096, -1.399782, -1.302116, 1, 0.8509804, 0, 1,
-1.088618, 1.703299, 0.1284468, 1, 0.8588235, 0, 1,
-1.088275, -0.9179815, -0.8089141, 1, 0.8627451, 0, 1,
-1.087844, -1.229112, -1.522708, 1, 0.8705882, 0, 1,
-1.087827, 0.4184497, -2.054373, 1, 0.8745098, 0, 1,
-1.076636, 0.7565004, -1.23051, 1, 0.8823529, 0, 1,
-1.071065, -0.9111814, -0.8809851, 1, 0.8862745, 0, 1,
-1.065757, 0.6730061, -2.049982, 1, 0.8941177, 0, 1,
-1.062804, -0.04724639, -2.89694, 1, 0.8980392, 0, 1,
-1.061039, -1.136485, -2.185747, 1, 0.9058824, 0, 1,
-1.059134, -1.667315, -2.315947, 1, 0.9137255, 0, 1,
-1.058909, 0.8046567, -1.878533, 1, 0.9176471, 0, 1,
-1.044207, -1.046748, -3.048001, 1, 0.9254902, 0, 1,
-1.036403, -0.05927226, -1.842729, 1, 0.9294118, 0, 1,
-1.033405, -0.2455999, -2.56907, 1, 0.9372549, 0, 1,
-1.03145, -0.151407, -0.8867396, 1, 0.9411765, 0, 1,
-1.02619, -2.445484, -3.072832, 1, 0.9490196, 0, 1,
-1.021718, 1.68665, -4.552891, 1, 0.9529412, 0, 1,
-1.019697, 0.6350741, -2.199887, 1, 0.9607843, 0, 1,
-1.018211, 0.698867, -1.150143, 1, 0.9647059, 0, 1,
-1.014059, -0.7927498, -2.145052, 1, 0.972549, 0, 1,
-1.013452, -0.3621057, -1.894137, 1, 0.9764706, 0, 1,
-1.004585, 0.6651478, -1.481511, 1, 0.9843137, 0, 1,
-1.002063, -0.6076133, 0.8877987, 1, 0.9882353, 0, 1,
-1.000767, -0.5835341, -0.8869362, 1, 0.9960784, 0, 1,
-0.9924607, 1.292084, -0.2032722, 0.9960784, 1, 0, 1,
-0.9912609, -1.57646, -2.940744, 0.9921569, 1, 0, 1,
-0.9656039, -0.02191518, -1.102944, 0.9843137, 1, 0, 1,
-0.9632264, -1.923565, -3.325027, 0.9803922, 1, 0, 1,
-0.9491434, -0.8323199, -2.279816, 0.972549, 1, 0, 1,
-0.9486953, -1.00565, -2.184696, 0.9686275, 1, 0, 1,
-0.9402594, 0.7534809, 0.1108161, 0.9607843, 1, 0, 1,
-0.9351716, 0.9486417, 0.2918204, 0.9568627, 1, 0, 1,
-0.9305956, 0.04459978, -1.957671, 0.9490196, 1, 0, 1,
-0.9260648, 1.369579, 0.4147289, 0.945098, 1, 0, 1,
-0.9240245, -0.2269186, -0.280209, 0.9372549, 1, 0, 1,
-0.9238315, -0.05015621, -0.09986337, 0.9333333, 1, 0, 1,
-0.9184071, 0.928883, -0.305523, 0.9254902, 1, 0, 1,
-0.9111774, -0.1500606, -3.576575, 0.9215686, 1, 0, 1,
-0.9103651, -0.5559422, -3.501243, 0.9137255, 1, 0, 1,
-0.9077748, 0.839417, -0.08731505, 0.9098039, 1, 0, 1,
-0.9068677, 0.8574632, 0.268358, 0.9019608, 1, 0, 1,
-0.906356, 0.3770745, 1.483188, 0.8941177, 1, 0, 1,
-0.905358, 0.09302871, -1.965277, 0.8901961, 1, 0, 1,
-0.9023254, 1.488334, 0.4774043, 0.8823529, 1, 0, 1,
-0.8982384, -0.5285496, -2.949489, 0.8784314, 1, 0, 1,
-0.8965819, -2.322726, -3.257367, 0.8705882, 1, 0, 1,
-0.8932827, -1.038412, -1.145989, 0.8666667, 1, 0, 1,
-0.887243, 1.150744, -1.234795, 0.8588235, 1, 0, 1,
-0.8868412, -0.8793329, -4.335131, 0.854902, 1, 0, 1,
-0.8865726, 0.3562079, -1.736189, 0.8470588, 1, 0, 1,
-0.8797809, 1.638575, -0.2033763, 0.8431373, 1, 0, 1,
-0.8772455, 1.209429, 0.5893888, 0.8352941, 1, 0, 1,
-0.876817, -0.1337776, -0.9308537, 0.8313726, 1, 0, 1,
-0.8690277, -0.1250041, -2.660145, 0.8235294, 1, 0, 1,
-0.8659238, -0.4451595, -0.9611881, 0.8196079, 1, 0, 1,
-0.8655687, 0.9637207, -1.02165, 0.8117647, 1, 0, 1,
-0.8651639, 1.166005, 1.672053, 0.8078431, 1, 0, 1,
-0.8458126, -0.1688311, -2.038916, 0.8, 1, 0, 1,
-0.8439056, 1.382557, -1.040993, 0.7921569, 1, 0, 1,
-0.84005, 1.09845, 0.2034468, 0.7882353, 1, 0, 1,
-0.8312516, 0.8400995, -0.1090726, 0.7803922, 1, 0, 1,
-0.8310041, 0.2761909, -2.4978, 0.7764706, 1, 0, 1,
-0.827362, 0.5889391, -1.56054, 0.7686275, 1, 0, 1,
-0.8185663, -0.1070348, -3.988058, 0.7647059, 1, 0, 1,
-0.8162773, 0.1246385, -2.31385, 0.7568628, 1, 0, 1,
-0.8155076, 0.0124056, -0.9156713, 0.7529412, 1, 0, 1,
-0.8092867, 0.8493205, -1.206388, 0.7450981, 1, 0, 1,
-0.8080195, -0.7534766, -3.301888, 0.7411765, 1, 0, 1,
-0.8066758, 0.01579409, -0.5573457, 0.7333333, 1, 0, 1,
-0.8063019, 0.04915239, -3.119886, 0.7294118, 1, 0, 1,
-0.8060439, 1.332023, 2.065673, 0.7215686, 1, 0, 1,
-0.8055802, -0.7909127, -0.5102986, 0.7176471, 1, 0, 1,
-0.7871867, 1.235305, 1.500807, 0.7098039, 1, 0, 1,
-0.7715704, 0.4455102, -0.939427, 0.7058824, 1, 0, 1,
-0.7677025, 0.08161645, -2.848934, 0.6980392, 1, 0, 1,
-0.7657222, 0.9739788, 0.6855531, 0.6901961, 1, 0, 1,
-0.7590616, -2.365143, -2.618415, 0.6862745, 1, 0, 1,
-0.7550932, 1.98202, 0.4512332, 0.6784314, 1, 0, 1,
-0.753944, -1.244914, -2.473434, 0.6745098, 1, 0, 1,
-0.7493374, 0.1615274, -0.2707671, 0.6666667, 1, 0, 1,
-0.7492271, -1.48147, -4.517941, 0.6627451, 1, 0, 1,
-0.745013, -1.185094, -1.674924, 0.654902, 1, 0, 1,
-0.7429613, -0.2887431, -0.6438428, 0.6509804, 1, 0, 1,
-0.7428125, 0.6550122, 0.9409919, 0.6431373, 1, 0, 1,
-0.7412132, -0.7414806, -1.664508, 0.6392157, 1, 0, 1,
-0.7355255, 1.260457, -0.8916742, 0.6313726, 1, 0, 1,
-0.7342451, 0.3614337, -0.26426, 0.627451, 1, 0, 1,
-0.7284954, 1.341349, -1.021135, 0.6196079, 1, 0, 1,
-0.7283335, 0.661597, 0.3876849, 0.6156863, 1, 0, 1,
-0.7259725, 0.8773206, -0.3648194, 0.6078432, 1, 0, 1,
-0.7225652, 0.5153869, -1.122808, 0.6039216, 1, 0, 1,
-0.7183944, -0.169529, -1.91701, 0.5960785, 1, 0, 1,
-0.7172377, -0.4085685, -1.70121, 0.5882353, 1, 0, 1,
-0.7109562, 1.178109, 1.201499, 0.5843138, 1, 0, 1,
-0.7098629, -0.4787324, -2.373752, 0.5764706, 1, 0, 1,
-0.7098535, -2.378083, -2.100811, 0.572549, 1, 0, 1,
-0.7055969, 1.47599, 0.9144527, 0.5647059, 1, 0, 1,
-0.704311, -0.5816643, -2.171615, 0.5607843, 1, 0, 1,
-0.7016312, 1.043472, -0.2982273, 0.5529412, 1, 0, 1,
-0.694609, -0.06357823, -1.984369, 0.5490196, 1, 0, 1,
-0.6937828, -0.1984802, -2.610464, 0.5411765, 1, 0, 1,
-0.6937318, 1.181505, -1.349691, 0.5372549, 1, 0, 1,
-0.6907955, -0.2454878, -1.43462, 0.5294118, 1, 0, 1,
-0.6859739, 1.521093, -0.9354187, 0.5254902, 1, 0, 1,
-0.6843409, -0.6610427, -0.8145089, 0.5176471, 1, 0, 1,
-0.6837571, 0.5780308, -1.004461, 0.5137255, 1, 0, 1,
-0.6832825, -0.5390037, -1.941959, 0.5058824, 1, 0, 1,
-0.6805837, -2.609174, -2.598709, 0.5019608, 1, 0, 1,
-0.6667712, -0.02312806, -2.093652, 0.4941176, 1, 0, 1,
-0.6660344, 1.197139, 1.152536, 0.4862745, 1, 0, 1,
-0.664946, 0.4229621, -1.202277, 0.4823529, 1, 0, 1,
-0.6638661, 0.1557358, 0.3625967, 0.4745098, 1, 0, 1,
-0.6598462, -0.4795122, -1.571414, 0.4705882, 1, 0, 1,
-0.6581955, -0.2398018, -2.214015, 0.4627451, 1, 0, 1,
-0.6529408, -1.407463, -3.03515, 0.4588235, 1, 0, 1,
-0.6493886, 0.5419195, -0.927098, 0.4509804, 1, 0, 1,
-0.6488191, -0.6074979, -2.870162, 0.4470588, 1, 0, 1,
-0.6472371, 1.014842, -1.470697, 0.4392157, 1, 0, 1,
-0.6472208, 0.1202517, -0.5561886, 0.4352941, 1, 0, 1,
-0.6425319, 0.08184015, -1.811267, 0.427451, 1, 0, 1,
-0.6420045, 0.1601347, -2.181687, 0.4235294, 1, 0, 1,
-0.6415073, 1.197226, -1.231035, 0.4156863, 1, 0, 1,
-0.6413815, 0.01072225, -1.985096, 0.4117647, 1, 0, 1,
-0.6390846, 0.1336462, -0.7322001, 0.4039216, 1, 0, 1,
-0.6389773, -0.09510407, -0.8782158, 0.3960784, 1, 0, 1,
-0.633751, 0.1979458, -1.305265, 0.3921569, 1, 0, 1,
-0.632379, -0.4325027, -1.053183, 0.3843137, 1, 0, 1,
-0.6310406, 0.1286533, 1.947431, 0.3803922, 1, 0, 1,
-0.6284287, 1.323502, -0.8425154, 0.372549, 1, 0, 1,
-0.6277217, 1.185622, -3.242354, 0.3686275, 1, 0, 1,
-0.6258159, -0.133146, -0.8466749, 0.3607843, 1, 0, 1,
-0.6254848, 1.249636, -0.5535636, 0.3568628, 1, 0, 1,
-0.6215029, 0.2585817, 0.08711076, 0.3490196, 1, 0, 1,
-0.6194803, -1.624558, -2.92641, 0.345098, 1, 0, 1,
-0.6181509, -0.7934548, -3.50436, 0.3372549, 1, 0, 1,
-0.618084, -1.320512, -2.553088, 0.3333333, 1, 0, 1,
-0.6102307, -0.5452452, -2.245866, 0.3254902, 1, 0, 1,
-0.6078187, -1.088997, -3.658362, 0.3215686, 1, 0, 1,
-0.6065559, 0.4496127, -0.5530318, 0.3137255, 1, 0, 1,
-0.5894707, 0.009513875, -2.717803, 0.3098039, 1, 0, 1,
-0.5892021, 0.3100912, 0.6861844, 0.3019608, 1, 0, 1,
-0.5842777, 0.7671554, 0.6625913, 0.2941177, 1, 0, 1,
-0.582457, -0.150315, -1.979927, 0.2901961, 1, 0, 1,
-0.5813493, -2.281178, -3.352199, 0.282353, 1, 0, 1,
-0.5763926, -1.777479, -3.259809, 0.2784314, 1, 0, 1,
-0.5660592, -1.194662, -4.409296, 0.2705882, 1, 0, 1,
-0.5655659, 1.103362, 0.3045671, 0.2666667, 1, 0, 1,
-0.563346, 0.362841, -1.519324, 0.2588235, 1, 0, 1,
-0.5622237, 1.051016, -1.087948, 0.254902, 1, 0, 1,
-0.5616971, -0.7213401, -2.490249, 0.2470588, 1, 0, 1,
-0.561684, -0.004651795, -0.1888089, 0.2431373, 1, 0, 1,
-0.561215, -1.238852, -3.963719, 0.2352941, 1, 0, 1,
-0.5576279, 0.3613178, -0.7118339, 0.2313726, 1, 0, 1,
-0.55392, -1.487911, -2.981268, 0.2235294, 1, 0, 1,
-0.5376243, 0.7219794, -1.379921, 0.2196078, 1, 0, 1,
-0.5362557, -1.026627, -3.816153, 0.2117647, 1, 0, 1,
-0.5300322, 1.231741, -0.4900755, 0.2078431, 1, 0, 1,
-0.5279265, 0.1020405, -2.950251, 0.2, 1, 0, 1,
-0.5225931, 0.5523395, -2.284463, 0.1921569, 1, 0, 1,
-0.5218136, 0.4649479, -2.858391, 0.1882353, 1, 0, 1,
-0.5172217, 0.64117, 0.1997962, 0.1803922, 1, 0, 1,
-0.5142397, -1.047352, -2.068564, 0.1764706, 1, 0, 1,
-0.5126406, 0.456868, -1.308389, 0.1686275, 1, 0, 1,
-0.5108847, -2.12514, -4.043122, 0.1647059, 1, 0, 1,
-0.5074929, -0.9648361, -1.530875, 0.1568628, 1, 0, 1,
-0.5027344, 0.22369, -0.07950975, 0.1529412, 1, 0, 1,
-0.4978981, -0.03387006, -1.78822, 0.145098, 1, 0, 1,
-0.495356, 1.82241, -0.4389441, 0.1411765, 1, 0, 1,
-0.4882969, -0.6718282, -1.96613, 0.1333333, 1, 0, 1,
-0.4861357, 0.9281837, -0.4022331, 0.1294118, 1, 0, 1,
-0.4816933, 1.052777, 0.01284321, 0.1215686, 1, 0, 1,
-0.4815294, -0.9204845, -1.622603, 0.1176471, 1, 0, 1,
-0.4811085, 0.5262311, -1.390113, 0.1098039, 1, 0, 1,
-0.4799968, 1.218819, -1.498762, 0.1058824, 1, 0, 1,
-0.4775828, -0.07962085, -1.350857, 0.09803922, 1, 0, 1,
-0.4709015, 0.3962485, -0.3387477, 0.09019608, 1, 0, 1,
-0.4703656, 2.07662, -1.635491, 0.08627451, 1, 0, 1,
-0.4654094, -0.8839606, -3.370743, 0.07843138, 1, 0, 1,
-0.46491, -0.645732, -1.921417, 0.07450981, 1, 0, 1,
-0.4627261, -0.4338159, -1.591116, 0.06666667, 1, 0, 1,
-0.460303, -0.08216378, -2.504995, 0.0627451, 1, 0, 1,
-0.4601991, 0.4487552, -1.758022, 0.05490196, 1, 0, 1,
-0.4588956, 0.3293741, -0.8155919, 0.05098039, 1, 0, 1,
-0.4578293, 1.094275, -0.59666, 0.04313726, 1, 0, 1,
-0.4538833, 0.2579513, -1.785491, 0.03921569, 1, 0, 1,
-0.447311, -0.5941889, -1.223091, 0.03137255, 1, 0, 1,
-0.4467595, 0.889765, 0.6737672, 0.02745098, 1, 0, 1,
-0.4455087, 0.8307102, 0.4002177, 0.01960784, 1, 0, 1,
-0.4425657, -0.5241175, -2.000005, 0.01568628, 1, 0, 1,
-0.4421494, -0.2080442, -1.698808, 0.007843138, 1, 0, 1,
-0.4413378, 0.9274957, 0.2907917, 0.003921569, 1, 0, 1,
-0.4351202, 0.6720896, -0.7205657, 0, 1, 0.003921569, 1,
-0.4315478, 1.459161, -0.07085054, 0, 1, 0.01176471, 1,
-0.4312164, 0.08185796, -0.8076911, 0, 1, 0.01568628, 1,
-0.4310831, -0.3767518, 0.1824999, 0, 1, 0.02352941, 1,
-0.4297062, 1.163123, 1.589531, 0, 1, 0.02745098, 1,
-0.4294209, 0.04496108, -0.6429667, 0, 1, 0.03529412, 1,
-0.4293045, 0.3991109, -0.2351592, 0, 1, 0.03921569, 1,
-0.4222912, 0.6307901, -0.1662608, 0, 1, 0.04705882, 1,
-0.4163072, 0.9153752, -1.419983, 0, 1, 0.05098039, 1,
-0.4145402, -0.4009949, -3.503078, 0, 1, 0.05882353, 1,
-0.4121652, -0.03635678, 0.4215808, 0, 1, 0.0627451, 1,
-0.4115857, 1.096405, -1.24652, 0, 1, 0.07058824, 1,
-0.4114224, 0.1464483, -2.136105, 0, 1, 0.07450981, 1,
-0.40905, -0.2955194, -1.540932, 0, 1, 0.08235294, 1,
-0.4050827, 0.1393964, -2.430971, 0, 1, 0.08627451, 1,
-0.4036826, -0.0372554, -2.450143, 0, 1, 0.09411765, 1,
-0.4036062, 0.5229543, -1.098944, 0, 1, 0.1019608, 1,
-0.4033246, 0.02125541, -1.74778, 0, 1, 0.1058824, 1,
-0.4028167, 0.3783655, -0.6940023, 0, 1, 0.1137255, 1,
-0.4024152, -1.623061, -1.302193, 0, 1, 0.1176471, 1,
-0.4000529, 0.9610237, -0.9477462, 0, 1, 0.1254902, 1,
-0.3973628, -1.694014, -1.800688, 0, 1, 0.1294118, 1,
-0.3966103, 0.589599, -1.736185, 0, 1, 0.1372549, 1,
-0.3958125, -1.10802, -1.879066, 0, 1, 0.1411765, 1,
-0.3938758, -0.6195104, -3.869585, 0, 1, 0.1490196, 1,
-0.3933095, -0.8477575, -3.068419, 0, 1, 0.1529412, 1,
-0.3907687, 1.172942, 0.5524291, 0, 1, 0.1607843, 1,
-0.3880041, 0.8397871, -0.5956942, 0, 1, 0.1647059, 1,
-0.3812928, -0.6100949, -2.213777, 0, 1, 0.172549, 1,
-0.3801822, -0.7583664, -2.184931, 0, 1, 0.1764706, 1,
-0.3796859, 0.3122141, -0.8647786, 0, 1, 0.1843137, 1,
-0.3786134, 0.7683086, -0.5821797, 0, 1, 0.1882353, 1,
-0.3782418, -0.8717746, -2.284331, 0, 1, 0.1960784, 1,
-0.3771076, -1.801302, -3.823061, 0, 1, 0.2039216, 1,
-0.372534, 0.3777901, -1.505297, 0, 1, 0.2078431, 1,
-0.3697766, 0.1305535, -0.6685231, 0, 1, 0.2156863, 1,
-0.3697656, -1.128903, -2.4983, 0, 1, 0.2196078, 1,
-0.3626643, -0.7142857, -2.846714, 0, 1, 0.227451, 1,
-0.3606036, 2.739069, 0.4553206, 0, 1, 0.2313726, 1,
-0.3595124, 0.1006409, 0.5388183, 0, 1, 0.2392157, 1,
-0.3581121, 0.3975705, -0.2596993, 0, 1, 0.2431373, 1,
-0.3580086, 1.340651, -1.212505, 0, 1, 0.2509804, 1,
-0.3563247, 1.986583, -1.673474, 0, 1, 0.254902, 1,
-0.3558973, -1.02392, -0.150381, 0, 1, 0.2627451, 1,
-0.3479064, 1.646914, 0.3764779, 0, 1, 0.2666667, 1,
-0.3467582, 0.2087382, -2.18191, 0, 1, 0.2745098, 1,
-0.3437782, 1.644345, -0.5237839, 0, 1, 0.2784314, 1,
-0.3436005, -0.8329508, -2.747857, 0, 1, 0.2862745, 1,
-0.3420047, -1.435529, -1.357165, 0, 1, 0.2901961, 1,
-0.3395042, 0.1768284, 0.5566387, 0, 1, 0.2980392, 1,
-0.3350309, 0.659156, -0.08948755, 0, 1, 0.3058824, 1,
-0.3336245, 0.436694, 0.4708488, 0, 1, 0.3098039, 1,
-0.3290817, -0.6387972, -0.8802883, 0, 1, 0.3176471, 1,
-0.3288303, -1.777907, -1.828013, 0, 1, 0.3215686, 1,
-0.3233092, -0.204463, -2.407309, 0, 1, 0.3294118, 1,
-0.3189538, 0.4793503, -0.6147689, 0, 1, 0.3333333, 1,
-0.3187947, 0.8942819, -0.194693, 0, 1, 0.3411765, 1,
-0.3177198, 0.3930421, 1.529908, 0, 1, 0.345098, 1,
-0.3146383, 0.4091829, -0.814845, 0, 1, 0.3529412, 1,
-0.314284, -0.4237143, -3.458819, 0, 1, 0.3568628, 1,
-0.312576, -0.7578541, -1.420046, 0, 1, 0.3647059, 1,
-0.3118571, 0.05383426, -3.463613, 0, 1, 0.3686275, 1,
-0.3099241, -0.8158489, -3.33322, 0, 1, 0.3764706, 1,
-0.3035326, -0.9284655, -3.147598, 0, 1, 0.3803922, 1,
-0.2977374, -0.4236038, -2.652461, 0, 1, 0.3882353, 1,
-0.2976402, -0.42373, -2.493954, 0, 1, 0.3921569, 1,
-0.2974423, 0.1567139, 0.3595459, 0, 1, 0.4, 1,
-0.2944244, -0.7525126, -2.633809, 0, 1, 0.4078431, 1,
-0.292932, -0.1034925, -2.730775, 0, 1, 0.4117647, 1,
-0.287368, 1.729704, -0.1067597, 0, 1, 0.4196078, 1,
-0.2847261, -0.5416149, -0.7358652, 0, 1, 0.4235294, 1,
-0.2825001, 0.7286277, -0.7215605, 0, 1, 0.4313726, 1,
-0.2814765, -0.8115295, -3.862937, 0, 1, 0.4352941, 1,
-0.2807737, -0.280667, -3.409529, 0, 1, 0.4431373, 1,
-0.2781562, -0.360332, -2.41716, 0, 1, 0.4470588, 1,
-0.2762421, -1.774042, -1.843941, 0, 1, 0.454902, 1,
-0.2682879, -0.002147607, -2.671517, 0, 1, 0.4588235, 1,
-0.265879, 0.938998, -1.502646, 0, 1, 0.4666667, 1,
-0.2630399, 0.1363719, -1.83373, 0, 1, 0.4705882, 1,
-0.2610606, -1.059906, -3.610651, 0, 1, 0.4784314, 1,
-0.2573378, 0.5169519, -1.735276, 0, 1, 0.4823529, 1,
-0.2568123, -0.5001081, -4.395617, 0, 1, 0.4901961, 1,
-0.2542981, 1.171985, -0.758759, 0, 1, 0.4941176, 1,
-0.2521454, 0.7415059, 0.4747342, 0, 1, 0.5019608, 1,
-0.2511878, -0.6348763, -3.646445, 0, 1, 0.509804, 1,
-0.2502845, -0.7502214, -3.462445, 0, 1, 0.5137255, 1,
-0.2499038, 1.422369, -0.2817686, 0, 1, 0.5215687, 1,
-0.2466489, -0.6635768, -0.7558964, 0, 1, 0.5254902, 1,
-0.2466084, 0.5773768, -0.02235733, 0, 1, 0.5333334, 1,
-0.246153, -1.421679, -3.402083, 0, 1, 0.5372549, 1,
-0.2367766, 0.986988, -1.364759, 0, 1, 0.5450981, 1,
-0.2360713, -1.763543, -3.992763, 0, 1, 0.5490196, 1,
-0.232303, -0.4016748, -2.874072, 0, 1, 0.5568628, 1,
-0.2316674, -1.080555, -2.290691, 0, 1, 0.5607843, 1,
-0.2305297, 0.6352272, 0.02566141, 0, 1, 0.5686275, 1,
-0.2254906, 0.4640228, 0.9615629, 0, 1, 0.572549, 1,
-0.2231485, -0.6721533, -2.166744, 0, 1, 0.5803922, 1,
-0.2140617, -0.9336135, -2.047741, 0, 1, 0.5843138, 1,
-0.2125253, -1.264484, -3.466058, 0, 1, 0.5921569, 1,
-0.2111562, -0.2638266, -3.103615, 0, 1, 0.5960785, 1,
-0.2075698, 0.648966, 0.3476886, 0, 1, 0.6039216, 1,
-0.2018725, -1.296683, -1.693514, 0, 1, 0.6117647, 1,
-0.1982307, 0.3291811, 0.8055362, 0, 1, 0.6156863, 1,
-0.195561, -0.6726921, 0.06844705, 0, 1, 0.6235294, 1,
-0.1944968, 0.2073944, -1.153028, 0, 1, 0.627451, 1,
-0.1933112, -0.6966588, -2.921273, 0, 1, 0.6352941, 1,
-0.1914353, -0.7753301, -2.373749, 0, 1, 0.6392157, 1,
-0.1880772, -0.5621302, -2.917395, 0, 1, 0.6470588, 1,
-0.1865509, -0.9154011, -2.284129, 0, 1, 0.6509804, 1,
-0.1856703, 0.8351145, -0.2498716, 0, 1, 0.6588235, 1,
-0.185492, 0.002470441, -1.954353, 0, 1, 0.6627451, 1,
-0.1828417, 0.002880085, -0.6044558, 0, 1, 0.6705883, 1,
-0.1810659, 1.441319, 1.051727, 0, 1, 0.6745098, 1,
-0.174637, -0.8683696, -3.112604, 0, 1, 0.682353, 1,
-0.1692377, -0.7256812, -2.848218, 0, 1, 0.6862745, 1,
-0.1653582, 1.623332, 0.9655537, 0, 1, 0.6941177, 1,
-0.1625815, -1.658125, -2.082387, 0, 1, 0.7019608, 1,
-0.151349, 0.407524, -0.8392141, 0, 1, 0.7058824, 1,
-0.1459026, 0.4353116, 0.3271717, 0, 1, 0.7137255, 1,
-0.1435328, -1.351322, -3.918831, 0, 1, 0.7176471, 1,
-0.1427211, 0.2940211, 0.4303439, 0, 1, 0.7254902, 1,
-0.1376092, -0.02570619, -1.906741, 0, 1, 0.7294118, 1,
-0.1363606, -0.5865375, -0.9945578, 0, 1, 0.7372549, 1,
-0.1353472, 0.7042466, 0.8410376, 0, 1, 0.7411765, 1,
-0.1340865, -0.342388, -3.42643, 0, 1, 0.7490196, 1,
-0.1338467, 1.916964, -0.5532188, 0, 1, 0.7529412, 1,
-0.1334421, 0.9984658, -0.9193779, 0, 1, 0.7607843, 1,
-0.1309424, -2.12165, -2.948075, 0, 1, 0.7647059, 1,
-0.129518, 0.3139748, -0.1879241, 0, 1, 0.772549, 1,
-0.1291086, 1.884177, -0.3985793, 0, 1, 0.7764706, 1,
-0.1289844, 1.1825, -1.367257, 0, 1, 0.7843137, 1,
-0.1258267, -0.09336594, -1.982891, 0, 1, 0.7882353, 1,
-0.1208663, -1.762196, -2.874212, 0, 1, 0.7960784, 1,
-0.1107777, 1.391067, 0.5482783, 0, 1, 0.8039216, 1,
-0.1078868, -0.6669332, -3.661048, 0, 1, 0.8078431, 1,
-0.10538, -1.030673, -4.215339, 0, 1, 0.8156863, 1,
-0.1030248, -0.1397336, -2.395034, 0, 1, 0.8196079, 1,
-0.1022238, 0.09085356, -2.615591, 0, 1, 0.827451, 1,
-0.1009197, -0.5690799, -3.170573, 0, 1, 0.8313726, 1,
-0.1000165, -0.4015253, -4.057237, 0, 1, 0.8392157, 1,
-0.09659689, 0.1699421, -0.4873351, 0, 1, 0.8431373, 1,
-0.0902328, 1.886571, 0.4546245, 0, 1, 0.8509804, 1,
-0.08969883, 0.6806908, 0.08788124, 0, 1, 0.854902, 1,
-0.08891575, -0.1221822, -2.645378, 0, 1, 0.8627451, 1,
-0.08731253, -0.4408254, -1.009774, 0, 1, 0.8666667, 1,
-0.08617174, -0.4327871, -2.513037, 0, 1, 0.8745098, 1,
-0.07924855, -0.1339664, -1.879203, 0, 1, 0.8784314, 1,
-0.07617048, 0.5275651, -0.8597165, 0, 1, 0.8862745, 1,
-0.07560774, -0.9657152, -3.547392, 0, 1, 0.8901961, 1,
-0.07527886, 0.02459954, -1.869513, 0, 1, 0.8980392, 1,
-0.06796066, 0.9399249, -1.466483, 0, 1, 0.9058824, 1,
-0.06639645, -0.3223701, -4.053311, 0, 1, 0.9098039, 1,
-0.06553014, -1.41551, -3.780415, 0, 1, 0.9176471, 1,
-0.06463236, 0.07833503, -1.108885, 0, 1, 0.9215686, 1,
-0.06271636, -0.1390797, -2.357911, 0, 1, 0.9294118, 1,
-0.06246056, 0.1775712, -0.5451347, 0, 1, 0.9333333, 1,
-0.06102986, 0.08506904, -1.884575, 0, 1, 0.9411765, 1,
-0.05883393, -0.2290979, -2.703832, 0, 1, 0.945098, 1,
-0.05857867, 1.299683, 1.423616, 0, 1, 0.9529412, 1,
-0.05766228, -1.359181, -1.372263, 0, 1, 0.9568627, 1,
-0.05526827, 1.227598, -1.088927, 0, 1, 0.9647059, 1,
-0.05476684, 1.811339, 1.15657, 0, 1, 0.9686275, 1,
-0.0547508, 0.7230064, 0.5466067, 0, 1, 0.9764706, 1,
-0.05285435, 0.2569044, 1.042984, 0, 1, 0.9803922, 1,
-0.04823482, -0.7295539, -3.141966, 0, 1, 0.9882353, 1,
-0.04690481, -0.9024475, -1.737543, 0, 1, 0.9921569, 1,
-0.04214616, 0.6219272, -1.014012, 0, 1, 1, 1,
-0.04175229, -1.110313, -3.472687, 0, 0.9921569, 1, 1,
-0.04149431, 0.4392971, -0.1568273, 0, 0.9882353, 1, 1,
-0.03856784, 0.1458186, -1.859273, 0, 0.9803922, 1, 1,
-0.03807941, -0.1702953, -1.214341, 0, 0.9764706, 1, 1,
-0.0346976, 1.427641, -0.3445874, 0, 0.9686275, 1, 1,
-0.0258953, 0.2211894, -1.597602, 0, 0.9647059, 1, 1,
-0.02493095, 0.6980403, 0.9723456, 0, 0.9568627, 1, 1,
-0.01963852, -0.7068537, -3.639598, 0, 0.9529412, 1, 1,
-0.01836723, -2.138544, -3.350648, 0, 0.945098, 1, 1,
-0.01823555, -0.910606, -2.889024, 0, 0.9411765, 1, 1,
-0.01644387, 0.3044092, -0.4501919, 0, 0.9333333, 1, 1,
-0.01568177, 0.6890782, 0.5062464, 0, 0.9294118, 1, 1,
-0.01413216, 1.654295, 0.2152426, 0, 0.9215686, 1, 1,
-0.004774224, 1.060635, 0.7552719, 0, 0.9176471, 1, 1,
-0.004421435, 1.122344, -1.641247, 0, 0.9098039, 1, 1,
-0.002232254, 0.5868145, -1.044863, 0, 0.9058824, 1, 1,
-0.0008732963, -0.9553986, -0.09194114, 0, 0.8980392, 1, 1,
-0.0002381579, 0.64492, -0.06826895, 0, 0.8901961, 1, 1,
-0.0001002034, -0.04656048, -4.713609, 0, 0.8862745, 1, 1,
0.002803122, 0.5674973, -0.06628335, 0, 0.8784314, 1, 1,
0.007150525, 0.8017752, 1.692789, 0, 0.8745098, 1, 1,
0.009062894, 0.1628695, 0.5115362, 0, 0.8666667, 1, 1,
0.01057715, 1.117367, 0.1608995, 0, 0.8627451, 1, 1,
0.01195241, 0.8761445, 0.4562524, 0, 0.854902, 1, 1,
0.01229342, -0.3647324, 2.690243, 0, 0.8509804, 1, 1,
0.01246811, 0.7671031, 1.651605, 0, 0.8431373, 1, 1,
0.01262178, 0.4687824, 0.05328042, 0, 0.8392157, 1, 1,
0.01294962, -0.3471761, 2.808247, 0, 0.8313726, 1, 1,
0.01692238, 0.08092525, 0.1012984, 0, 0.827451, 1, 1,
0.02451416, -0.5394977, 4.007052, 0, 0.8196079, 1, 1,
0.02528234, 0.7159845, 0.7948061, 0, 0.8156863, 1, 1,
0.03101884, 0.3838753, 0.6065037, 0, 0.8078431, 1, 1,
0.03109934, 0.5444905, 2.577396, 0, 0.8039216, 1, 1,
0.03178208, 1.575748, 0.4684127, 0, 0.7960784, 1, 1,
0.03592907, -0.1682279, 3.872968, 0, 0.7882353, 1, 1,
0.03795645, -1.93355, 2.867806, 0, 0.7843137, 1, 1,
0.04129094, -0.2733475, 3.892508, 0, 0.7764706, 1, 1,
0.04130686, -0.3037213, 3.045938, 0, 0.772549, 1, 1,
0.04155906, -0.1040889, 2.450742, 0, 0.7647059, 1, 1,
0.04179957, -1.354168, 4.573858, 0, 0.7607843, 1, 1,
0.04230481, 0.5209842, 0.5359938, 0, 0.7529412, 1, 1,
0.0454268, 0.5009321, 0.1894041, 0, 0.7490196, 1, 1,
0.04589154, 0.2286877, -0.7124147, 0, 0.7411765, 1, 1,
0.04753419, -2.142144, 1.777798, 0, 0.7372549, 1, 1,
0.04841018, 2.241708, 0.7450563, 0, 0.7294118, 1, 1,
0.05350849, -2.030937, 2.046328, 0, 0.7254902, 1, 1,
0.05478209, -0.981729, 1.708445, 0, 0.7176471, 1, 1,
0.05751126, -1.050048, 2.619625, 0, 0.7137255, 1, 1,
0.05943545, -0.2849431, 4.800283, 0, 0.7058824, 1, 1,
0.06421641, -0.7511644, 4.237899, 0, 0.6980392, 1, 1,
0.06621099, 0.6273363, -0.06338889, 0, 0.6941177, 1, 1,
0.06632792, 1.757108, 0.08375511, 0, 0.6862745, 1, 1,
0.07253654, 1.561121, -0.1809212, 0, 0.682353, 1, 1,
0.08374622, -2.35096, 3.995306, 0, 0.6745098, 1, 1,
0.08531471, 1.397912, -2.106469, 0, 0.6705883, 1, 1,
0.08744913, 0.6772915, 0.1250038, 0, 0.6627451, 1, 1,
0.08917189, -2.655385, 3.399785, 0, 0.6588235, 1, 1,
0.09088165, 0.350042, 0.8780083, 0, 0.6509804, 1, 1,
0.09108859, -0.8751245, 1.597035, 0, 0.6470588, 1, 1,
0.09143099, -0.1400102, 2.960696, 0, 0.6392157, 1, 1,
0.093438, -0.5357872, 2.141997, 0, 0.6352941, 1, 1,
0.0980873, -1.115307, 2.622509, 0, 0.627451, 1, 1,
0.09876245, -0.3635959, 3.301396, 0, 0.6235294, 1, 1,
0.09986071, 0.1976465, 0.205506, 0, 0.6156863, 1, 1,
0.1056475, 0.5554549, -1.009383, 0, 0.6117647, 1, 1,
0.1113218, -0.3821077, 3.814117, 0, 0.6039216, 1, 1,
0.112427, -0.9417319, 3.836077, 0, 0.5960785, 1, 1,
0.1147655, 0.3390166, 1.14542, 0, 0.5921569, 1, 1,
0.1151594, 0.5567079, 0.9864041, 0, 0.5843138, 1, 1,
0.1169851, -0.7322629, 3.56774, 0, 0.5803922, 1, 1,
0.1180867, -0.2489944, 2.698457, 0, 0.572549, 1, 1,
0.1278111, 0.2266751, 2.195148, 0, 0.5686275, 1, 1,
0.131371, -1.1581, 1.928247, 0, 0.5607843, 1, 1,
0.1347764, -0.5513162, 2.920149, 0, 0.5568628, 1, 1,
0.1365744, 2.125591, -1.541823, 0, 0.5490196, 1, 1,
0.1423281, 1.172708, 2.293943, 0, 0.5450981, 1, 1,
0.1442216, 0.2706854, -0.2557777, 0, 0.5372549, 1, 1,
0.1451776, 0.0370381, 0.8762575, 0, 0.5333334, 1, 1,
0.149207, -1.205361, 3.023719, 0, 0.5254902, 1, 1,
0.1508414, -1.023555, 3.253588, 0, 0.5215687, 1, 1,
0.1537306, 2.143929, 1.209859, 0, 0.5137255, 1, 1,
0.1557553, 0.7889127, -0.1963206, 0, 0.509804, 1, 1,
0.1563471, -0.6669633, 3.055115, 0, 0.5019608, 1, 1,
0.1565908, 0.1409335, 1.263641, 0, 0.4941176, 1, 1,
0.1592058, 1.245535, -1.202864, 0, 0.4901961, 1, 1,
0.1617881, 1.010941, 0.6783531, 0, 0.4823529, 1, 1,
0.1645856, -0.9435248, 3.77062, 0, 0.4784314, 1, 1,
0.1665471, -1.152528, 3.929228, 0, 0.4705882, 1, 1,
0.1678646, 0.8143184, 0.6286824, 0, 0.4666667, 1, 1,
0.1680149, 0.8154542, 0.329275, 0, 0.4588235, 1, 1,
0.1715768, -0.8928975, 4.695502, 0, 0.454902, 1, 1,
0.1716878, -0.5237722, 1.641284, 0, 0.4470588, 1, 1,
0.1731613, -1.510141, 4.832697, 0, 0.4431373, 1, 1,
0.1768911, -0.9109862, 3.849995, 0, 0.4352941, 1, 1,
0.1772408, 0.6168368, -0.3984369, 0, 0.4313726, 1, 1,
0.1805814, -0.08195586, 3.850314, 0, 0.4235294, 1, 1,
0.1807137, -0.1191328, 2.147811, 0, 0.4196078, 1, 1,
0.1824448, 0.5823141, 1.347291, 0, 0.4117647, 1, 1,
0.1834777, 1.696685, 0.09874868, 0, 0.4078431, 1, 1,
0.1885939, -0.3198062, 1.840963, 0, 0.4, 1, 1,
0.194687, 0.4543679, -0.01063618, 0, 0.3921569, 1, 1,
0.1975031, 0.9348152, -0.1528758, 0, 0.3882353, 1, 1,
0.2057337, -1.742524, 3.964817, 0, 0.3803922, 1, 1,
0.2064078, 0.200582, -0.5372354, 0, 0.3764706, 1, 1,
0.2117221, -0.6343177, 4.121458, 0, 0.3686275, 1, 1,
0.2124918, 0.5664077, -0.4123103, 0, 0.3647059, 1, 1,
0.2130518, 1.851652, -0.4353724, 0, 0.3568628, 1, 1,
0.2135544, 0.2097695, -0.1411012, 0, 0.3529412, 1, 1,
0.2198528, 0.6044713, 0.7754391, 0, 0.345098, 1, 1,
0.2239771, -1.285032, 2.767602, 0, 0.3411765, 1, 1,
0.2311747, 0.6907753, -1.159226, 0, 0.3333333, 1, 1,
0.2334191, -1.825963, 5.16653, 0, 0.3294118, 1, 1,
0.2353621, 0.0212104, 1.861701, 0, 0.3215686, 1, 1,
0.2369536, 0.02842617, 1.120593, 0, 0.3176471, 1, 1,
0.2454693, 0.5692748, 2.126992, 0, 0.3098039, 1, 1,
0.2481143, -0.07782082, 2.006731, 0, 0.3058824, 1, 1,
0.2495013, 0.1424642, -0.04312004, 0, 0.2980392, 1, 1,
0.2496992, 2.44132, -0.9208282, 0, 0.2901961, 1, 1,
0.2504161, -0.3003084, 2.124114, 0, 0.2862745, 1, 1,
0.2525472, 0.4719199, -0.013153, 0, 0.2784314, 1, 1,
0.2526416, 0.1864639, 0.9945151, 0, 0.2745098, 1, 1,
0.2530845, -2.248755, 1.771421, 0, 0.2666667, 1, 1,
0.2620023, -1.66257, 3.390398, 0, 0.2627451, 1, 1,
0.2626214, 0.01809289, 2.292619, 0, 0.254902, 1, 1,
0.2672273, -1.299274, 4.683255, 0, 0.2509804, 1, 1,
0.2684667, 0.6919999, -1.700056, 0, 0.2431373, 1, 1,
0.2741587, -1.512082, 0.6516412, 0, 0.2392157, 1, 1,
0.2753692, -1.663166, 3.409295, 0, 0.2313726, 1, 1,
0.2788404, 1.170304, -0.0646606, 0, 0.227451, 1, 1,
0.2818927, 0.9790076, 1.772617, 0, 0.2196078, 1, 1,
0.2827539, -0.864868, 1.355607, 0, 0.2156863, 1, 1,
0.2892341, 0.6670161, 1.303021, 0, 0.2078431, 1, 1,
0.2951136, 1.157646, 0.9570541, 0, 0.2039216, 1, 1,
0.2967746, 0.02254794, 3.430829, 0, 0.1960784, 1, 1,
0.296784, 0.6348123, 2.355852, 0, 0.1882353, 1, 1,
0.3034682, 0.2221456, 0.1446874, 0, 0.1843137, 1, 1,
0.3110006, -1.497627, 3.71223, 0, 0.1764706, 1, 1,
0.3123297, 0.875878, 0.2265938, 0, 0.172549, 1, 1,
0.3125456, -0.1581945, 0.4478225, 0, 0.1647059, 1, 1,
0.3131098, 0.5890448, 1.497787, 0, 0.1607843, 1, 1,
0.315036, 1.117253, -0.9446469, 0, 0.1529412, 1, 1,
0.319108, -1.895092, 2.434824, 0, 0.1490196, 1, 1,
0.3229291, 0.06054528, 1.269939, 0, 0.1411765, 1, 1,
0.3240401, 0.305933, 0.43294, 0, 0.1372549, 1, 1,
0.3267656, -0.9823686, 4.305429, 0, 0.1294118, 1, 1,
0.3277379, 1.166909, 0.3028025, 0, 0.1254902, 1, 1,
0.3306163, 0.4573225, 2.338244, 0, 0.1176471, 1, 1,
0.3314416, 0.497471, -0.9170329, 0, 0.1137255, 1, 1,
0.331729, -0.565411, 2.684715, 0, 0.1058824, 1, 1,
0.3370775, -0.9991395, 2.443323, 0, 0.09803922, 1, 1,
0.3417574, -0.8653052, 1.13747, 0, 0.09411765, 1, 1,
0.3446535, -0.2549505, 2.441143, 0, 0.08627451, 1, 1,
0.3460602, 0.01849409, 2.065075, 0, 0.08235294, 1, 1,
0.3490324, 4.216112, 1.15916, 0, 0.07450981, 1, 1,
0.354023, -0.2683728, 1.364024, 0, 0.07058824, 1, 1,
0.3541806, 1.050466, 1.567, 0, 0.0627451, 1, 1,
0.3560404, -1.787552, 3.72245, 0, 0.05882353, 1, 1,
0.3618515, 0.1270924, 0.9926664, 0, 0.05098039, 1, 1,
0.3622563, -0.9370471, 3.612553, 0, 0.04705882, 1, 1,
0.3754853, 0.7832646, 0.1221833, 0, 0.03921569, 1, 1,
0.3782591, 0.7610962, 1.621217, 0, 0.03529412, 1, 1,
0.3796354, -0.3506091, 0.3377563, 0, 0.02745098, 1, 1,
0.3801457, -0.5050194, 2.945921, 0, 0.02352941, 1, 1,
0.3834323, -0.3462371, 3.624521, 0, 0.01568628, 1, 1,
0.3944149, -0.8178357, 3.279507, 0, 0.01176471, 1, 1,
0.3945047, -2.029639, 4.831579, 0, 0.003921569, 1, 1,
0.3964057, -1.675108, 1.867871, 0.003921569, 0, 1, 1,
0.3972444, -1.734274, 3.08823, 0.007843138, 0, 1, 1,
0.3972773, 1.218476, -1.398567, 0.01568628, 0, 1, 1,
0.4022442, -1.6574, 1.806152, 0.01960784, 0, 1, 1,
0.4026022, -0.2154423, 1.230234, 0.02745098, 0, 1, 1,
0.4027364, -1.707658, 1.815707, 0.03137255, 0, 1, 1,
0.4068851, 0.4336968, 0.07898477, 0.03921569, 0, 1, 1,
0.4093324, -0.5210065, 1.18775, 0.04313726, 0, 1, 1,
0.4102425, 0.2061696, 0.7380036, 0.05098039, 0, 1, 1,
0.4108323, -0.0364703, 3.287374, 0.05490196, 0, 1, 1,
0.4130547, 2.155374, -0.6557631, 0.0627451, 0, 1, 1,
0.4202183, 0.03465445, 0.4068618, 0.06666667, 0, 1, 1,
0.4206998, 1.208356, 1.027485, 0.07450981, 0, 1, 1,
0.4242242, -1.320754, 0.1465587, 0.07843138, 0, 1, 1,
0.4291927, -1.147926, 2.538746, 0.08627451, 0, 1, 1,
0.4386522, 0.7768741, 0.393082, 0.09019608, 0, 1, 1,
0.4389572, 3.389395, 0.2971676, 0.09803922, 0, 1, 1,
0.4473821, 1.234746, -1.198559, 0.1058824, 0, 1, 1,
0.4481696, -1.389808, 2.321444, 0.1098039, 0, 1, 1,
0.4496254, 1.52401, -0.6239368, 0.1176471, 0, 1, 1,
0.4539866, -0.1775153, 2.979985, 0.1215686, 0, 1, 1,
0.4542399, 1.388081, 1.158707, 0.1294118, 0, 1, 1,
0.4572721, -0.7788494, 1.496699, 0.1333333, 0, 1, 1,
0.4589406, -0.8475546, 2.052717, 0.1411765, 0, 1, 1,
0.4656675, -0.3988279, 1.643812, 0.145098, 0, 1, 1,
0.4707552, 1.724957, -0.7370826, 0.1529412, 0, 1, 1,
0.4715598, 1.63349, 1.028732, 0.1568628, 0, 1, 1,
0.4724685, -0.07873004, 1.682041, 0.1647059, 0, 1, 1,
0.4724953, 0.03050342, 0.8876099, 0.1686275, 0, 1, 1,
0.476513, 0.322232, -0.2666572, 0.1764706, 0, 1, 1,
0.4767516, 2.26768, -0.3052391, 0.1803922, 0, 1, 1,
0.4812281, 0.5759642, 0.5553944, 0.1882353, 0, 1, 1,
0.4833897, 0.4245132, 1.676304, 0.1921569, 0, 1, 1,
0.4845709, -0.4767075, 3.091922, 0.2, 0, 1, 1,
0.4863381, 0.5856916, 0.6068332, 0.2078431, 0, 1, 1,
0.4871513, 0.8158582, 1.314226, 0.2117647, 0, 1, 1,
0.4892217, -0.9099318, 1.965584, 0.2196078, 0, 1, 1,
0.4898365, 0.990518, 1.107282, 0.2235294, 0, 1, 1,
0.4923206, 0.0823298, 2.086043, 0.2313726, 0, 1, 1,
0.4925091, 0.09070259, 1.140233, 0.2352941, 0, 1, 1,
0.4942764, -0.1984987, 2.016787, 0.2431373, 0, 1, 1,
0.4993423, 1.790659, 0.9769591, 0.2470588, 0, 1, 1,
0.502966, 2.150483, 1.031024, 0.254902, 0, 1, 1,
0.5038901, -0.006872682, 1.733023, 0.2588235, 0, 1, 1,
0.5049872, -2.763715, 4.586944, 0.2666667, 0, 1, 1,
0.5050756, 0.9783079, -1.585425, 0.2705882, 0, 1, 1,
0.5092355, -0.5909811, 1.771176, 0.2784314, 0, 1, 1,
0.5118461, -1.276044, 2.517616, 0.282353, 0, 1, 1,
0.5259793, 0.3544661, 0.5720539, 0.2901961, 0, 1, 1,
0.5264545, -0.4197569, 4.399028, 0.2941177, 0, 1, 1,
0.5267394, 0.1567716, -0.4265288, 0.3019608, 0, 1, 1,
0.5296717, -1.868533, 4.117414, 0.3098039, 0, 1, 1,
0.5316975, -0.7980185, 2.211308, 0.3137255, 0, 1, 1,
0.533268, 1.352412, 0.7181515, 0.3215686, 0, 1, 1,
0.5367651, 2.141846, 2.722779, 0.3254902, 0, 1, 1,
0.5382339, 0.5766176, -0.8955806, 0.3333333, 0, 1, 1,
0.5399705, -1.032863, 2.47505, 0.3372549, 0, 1, 1,
0.5401031, 0.3007278, -0.02509517, 0.345098, 0, 1, 1,
0.5468027, 0.08602041, 0.1724434, 0.3490196, 0, 1, 1,
0.5538698, -0.4219505, 1.840806, 0.3568628, 0, 1, 1,
0.5846519, 0.2139011, -0.7067654, 0.3607843, 0, 1, 1,
0.5861246, -0.7566063, 2.455702, 0.3686275, 0, 1, 1,
0.5889406, 0.1424831, 0.4101458, 0.372549, 0, 1, 1,
0.589019, 1.578015, 0.01919431, 0.3803922, 0, 1, 1,
0.5896536, 0.1791155, 1.417229, 0.3843137, 0, 1, 1,
0.5946916, 1.530697, 1.285966, 0.3921569, 0, 1, 1,
0.5999129, -0.01176994, 1.648848, 0.3960784, 0, 1, 1,
0.6002968, 0.446273, 1.425485, 0.4039216, 0, 1, 1,
0.6041126, -1.865894, 3.07919, 0.4117647, 0, 1, 1,
0.6049749, 1.346423, 1.053842, 0.4156863, 0, 1, 1,
0.6090434, -0.6544831, 3.814542, 0.4235294, 0, 1, 1,
0.6093847, 0.005497974, 1.547915, 0.427451, 0, 1, 1,
0.6110328, 0.09039445, 0.3505517, 0.4352941, 0, 1, 1,
0.6157086, -1.216723, 1.961858, 0.4392157, 0, 1, 1,
0.6195914, -0.3814272, 2.673991, 0.4470588, 0, 1, 1,
0.6277058, -0.5971014, 2.03246, 0.4509804, 0, 1, 1,
0.6307152, 0.6009814, 0.5448859, 0.4588235, 0, 1, 1,
0.6639439, -0.7610776, 3.998565, 0.4627451, 0, 1, 1,
0.6662213, 1.137652, -0.3368464, 0.4705882, 0, 1, 1,
0.6727098, 1.40549, 0.3939695, 0.4745098, 0, 1, 1,
0.6749987, -0.2810668, 1.391352, 0.4823529, 0, 1, 1,
0.6750661, -0.3427354, 2.258951, 0.4862745, 0, 1, 1,
0.6761665, -0.1154349, 3.177701, 0.4941176, 0, 1, 1,
0.6772919, -2.148532, 3.622089, 0.5019608, 0, 1, 1,
0.6783197, -0.6477835, 1.725396, 0.5058824, 0, 1, 1,
0.6799536, -1.156193, 4.106134, 0.5137255, 0, 1, 1,
0.6804785, -0.01685542, 2.174776, 0.5176471, 0, 1, 1,
0.6848409, -1.284156, 3.154978, 0.5254902, 0, 1, 1,
0.687847, 0.1250089, 1.432067, 0.5294118, 0, 1, 1,
0.6919392, -2.199765, 2.528923, 0.5372549, 0, 1, 1,
0.6934021, 0.01650708, 2.779908, 0.5411765, 0, 1, 1,
0.6934865, 0.9643599, 0.9977073, 0.5490196, 0, 1, 1,
0.694414, 0.226765, 2.521788, 0.5529412, 0, 1, 1,
0.6959981, -1.415469, 2.960065, 0.5607843, 0, 1, 1,
0.6997787, 1.442899, 0.5263671, 0.5647059, 0, 1, 1,
0.7044783, -1.333367, 2.846802, 0.572549, 0, 1, 1,
0.7056035, 0.2726423, 1.420914, 0.5764706, 0, 1, 1,
0.7089871, 1.171303, 0.5662401, 0.5843138, 0, 1, 1,
0.7097251, 0.5835607, 0.3252652, 0.5882353, 0, 1, 1,
0.7098126, -1.10294, 2.750104, 0.5960785, 0, 1, 1,
0.7122627, 0.6182014, 0.7855747, 0.6039216, 0, 1, 1,
0.7124575, -0.3843616, 2.242532, 0.6078432, 0, 1, 1,
0.7151039, -1.713627, 1.837417, 0.6156863, 0, 1, 1,
0.7161062, -0.8619971, 0.2443926, 0.6196079, 0, 1, 1,
0.7161709, 0.4178519, 2.036147, 0.627451, 0, 1, 1,
0.7168429, 0.404366, 0.5157236, 0.6313726, 0, 1, 1,
0.7176866, -0.05834145, 1.775114, 0.6392157, 0, 1, 1,
0.720847, -0.5278309, 1.698756, 0.6431373, 0, 1, 1,
0.7212176, -1.056164, 0.7816038, 0.6509804, 0, 1, 1,
0.7233274, 0.8579358, -0.854035, 0.654902, 0, 1, 1,
0.7268911, 2.126899, -0.8335243, 0.6627451, 0, 1, 1,
0.7283841, -1.409412, 2.198904, 0.6666667, 0, 1, 1,
0.7378634, 0.1966265, 1.081423, 0.6745098, 0, 1, 1,
0.7399769, -0.1727656, 0.916753, 0.6784314, 0, 1, 1,
0.7422024, 0.268608, 1.831714, 0.6862745, 0, 1, 1,
0.7438702, 1.599914, -0.5525935, 0.6901961, 0, 1, 1,
0.7504503, 0.5961381, 1.977916, 0.6980392, 0, 1, 1,
0.7530654, 0.3000778, 1.343415, 0.7058824, 0, 1, 1,
0.7538847, -0.3325763, 0.1555913, 0.7098039, 0, 1, 1,
0.7618877, -1.088667, 2.839076, 0.7176471, 0, 1, 1,
0.7758209, 0.9000374, 1.546945, 0.7215686, 0, 1, 1,
0.779573, -0.9574338, 4.49191, 0.7294118, 0, 1, 1,
0.7822049, 0.4485645, 0.4634936, 0.7333333, 0, 1, 1,
0.7997572, 0.4471291, 0.07467531, 0.7411765, 0, 1, 1,
0.802946, -0.7558497, 2.071149, 0.7450981, 0, 1, 1,
0.8037832, -0.3825107, 1.36314, 0.7529412, 0, 1, 1,
0.8118503, 2.836751, 0.8092343, 0.7568628, 0, 1, 1,
0.8146129, 0.02633733, 1.038195, 0.7647059, 0, 1, 1,
0.8161432, -2.349185, 2.979318, 0.7686275, 0, 1, 1,
0.8184919, -0.546389, 0.5753438, 0.7764706, 0, 1, 1,
0.8273045, 0.4923533, -0.01246199, 0.7803922, 0, 1, 1,
0.8280342, 0.4833627, 0.621914, 0.7882353, 0, 1, 1,
0.8311779, -1.201881, -0.4114183, 0.7921569, 0, 1, 1,
0.831868, -0.5441297, 2.727808, 0.8, 0, 1, 1,
0.8321556, 0.7379656, 1.031455, 0.8078431, 0, 1, 1,
0.8346846, -1.27636, 2.558831, 0.8117647, 0, 1, 1,
0.8351001, 0.1257697, 0.7343125, 0.8196079, 0, 1, 1,
0.8428515, -1.098304, 2.539675, 0.8235294, 0, 1, 1,
0.8429956, 0.1423299, 1.456661, 0.8313726, 0, 1, 1,
0.8452301, -2.228819, 4.157099, 0.8352941, 0, 1, 1,
0.8466693, 0.2217192, 3.42206, 0.8431373, 0, 1, 1,
0.8524205, -0.1316301, -1.219643, 0.8470588, 0, 1, 1,
0.8583483, -2.044773, 1.661347, 0.854902, 0, 1, 1,
0.8617901, 0.2791553, 0.7507225, 0.8588235, 0, 1, 1,
0.8641209, -0.4610535, 1.946874, 0.8666667, 0, 1, 1,
0.8697118, -0.5130497, 2.049696, 0.8705882, 0, 1, 1,
0.8720261, -0.887727, 2.374207, 0.8784314, 0, 1, 1,
0.8741107, -0.2931395, 2.276607, 0.8823529, 0, 1, 1,
0.8756697, 0.8910199, 0.5613945, 0.8901961, 0, 1, 1,
0.8765897, 0.8788384, 0.05056782, 0.8941177, 0, 1, 1,
0.8793137, -0.1025752, 2.59146, 0.9019608, 0, 1, 1,
0.88833, 1.814989, 0.8046125, 0.9098039, 0, 1, 1,
0.8889755, -1.828445, 2.289216, 0.9137255, 0, 1, 1,
0.8900125, -0.3945391, 0.856892, 0.9215686, 0, 1, 1,
0.8907006, 0.3946989, 2.620688, 0.9254902, 0, 1, 1,
0.8919849, 0.8192524, 2.642091, 0.9333333, 0, 1, 1,
0.8951502, -0.1992023, 1.837951, 0.9372549, 0, 1, 1,
0.9002032, -1.309623, 2.015912, 0.945098, 0, 1, 1,
0.9044372, 0.02192691, 1.241789, 0.9490196, 0, 1, 1,
0.9193984, 1.484279, 0.7236905, 0.9568627, 0, 1, 1,
0.9215417, 0.3456446, 1.008705, 0.9607843, 0, 1, 1,
0.9280573, 1.557718, 1.397038, 0.9686275, 0, 1, 1,
0.931502, -0.6588647, 0.9849823, 0.972549, 0, 1, 1,
0.9327956, 0.4808484, 0.9526373, 0.9803922, 0, 1, 1,
0.9337067, -0.7148047, 1.204148, 0.9843137, 0, 1, 1,
0.9382972, -0.443475, 3.353605, 0.9921569, 0, 1, 1,
0.9517344, 0.2701893, 0.724616, 0.9960784, 0, 1, 1,
0.958359, -0.1860729, 2.831479, 1, 0, 0.9960784, 1,
0.9678069, 0.0421552, 2.352355, 1, 0, 0.9882353, 1,
0.9685974, -0.3130232, 0.009115603, 1, 0, 0.9843137, 1,
0.9713303, -0.5526255, 3.20209, 1, 0, 0.9764706, 1,
0.9714546, -1.542829, 1.999745, 1, 0, 0.972549, 1,
0.9742649, 0.6934887, -0.6626075, 1, 0, 0.9647059, 1,
0.9765689, -1.349703, 2.080625, 1, 0, 0.9607843, 1,
0.977776, -0.9999358, 2.999487, 1, 0, 0.9529412, 1,
0.9855274, -0.48862, 3.805196, 1, 0, 0.9490196, 1,
0.9877895, 1.207063, -0.4159577, 1, 0, 0.9411765, 1,
0.9983877, -0.617704, 4.728363, 1, 0, 0.9372549, 1,
1.002609, 1.07755, 1.208702, 1, 0, 0.9294118, 1,
1.003172, -1.24568, 1.618552, 1, 0, 0.9254902, 1,
1.004499, 0.3316503, 2.053366, 1, 0, 0.9176471, 1,
1.006093, 0.2156025, 1.412365, 1, 0, 0.9137255, 1,
1.006154, -0.04365322, 1.752318, 1, 0, 0.9058824, 1,
1.016075, 0.6911052, 1.982781, 1, 0, 0.9019608, 1,
1.023419, -0.5576682, 2.392725, 1, 0, 0.8941177, 1,
1.024733, -1.274167, 1.682267, 1, 0, 0.8862745, 1,
1.028385, -0.5805871, 2.494445, 1, 0, 0.8823529, 1,
1.035142, 0.5125843, 1.738856, 1, 0, 0.8745098, 1,
1.039268, -0.5780079, 1.646055, 1, 0, 0.8705882, 1,
1.044818, 0.7898868, 1.190731, 1, 0, 0.8627451, 1,
1.048735, 0.4774556, 2.439569, 1, 0, 0.8588235, 1,
1.051303, 2.102027, 1.234213, 1, 0, 0.8509804, 1,
1.058929, -1.236363, 2.622159, 1, 0, 0.8470588, 1,
1.059506, -1.090068, 1.514999, 1, 0, 0.8392157, 1,
1.060031, -0.5073695, 0.1358922, 1, 0, 0.8352941, 1,
1.060482, 0.24501, 1.409788, 1, 0, 0.827451, 1,
1.070383, -0.08186011, 1.183324, 1, 0, 0.8235294, 1,
1.073555, -0.7978629, 2.862561, 1, 0, 0.8156863, 1,
1.085171, 0.1415526, 1.127864, 1, 0, 0.8117647, 1,
1.092127, -0.2621863, 1.837307, 1, 0, 0.8039216, 1,
1.096064, -0.1513777, 1.18164, 1, 0, 0.7960784, 1,
1.101902, 0.2795936, 1.645008, 1, 0, 0.7921569, 1,
1.103432, 0.2892755, -1.011213, 1, 0, 0.7843137, 1,
1.107044, -1.624518, 1.34413, 1, 0, 0.7803922, 1,
1.108604, 0.5494258, 0.4779872, 1, 0, 0.772549, 1,
1.115459, 0.04912548, 1.244819, 1, 0, 0.7686275, 1,
1.152627, 0.5853529, 1.809236, 1, 0, 0.7607843, 1,
1.153135, -0.235202, 3.490691, 1, 0, 0.7568628, 1,
1.153422, -0.9119104, 2.404732, 1, 0, 0.7490196, 1,
1.158031, -0.8806009, 1.98068, 1, 0, 0.7450981, 1,
1.162999, -0.2554046, 2.089921, 1, 0, 0.7372549, 1,
1.167764, -1.455065, 1.657789, 1, 0, 0.7333333, 1,
1.170864, -0.7558788, -0.1290327, 1, 0, 0.7254902, 1,
1.177778, -0.5405995, 2.504141, 1, 0, 0.7215686, 1,
1.180516, -0.8448973, 3.260912, 1, 0, 0.7137255, 1,
1.187613, -0.3671832, 3.731466, 1, 0, 0.7098039, 1,
1.190778, -0.2970133, 1.29303, 1, 0, 0.7019608, 1,
1.201653, -1.328564, 0.7686056, 1, 0, 0.6941177, 1,
1.220757, -0.7896843, 2.790074, 1, 0, 0.6901961, 1,
1.223646, 0.05734753, -0.4901315, 1, 0, 0.682353, 1,
1.230328, -0.1362765, 1.386928, 1, 0, 0.6784314, 1,
1.232663, -2.043789, 2.328042, 1, 0, 0.6705883, 1,
1.233115, -0.6088673, 3.25731, 1, 0, 0.6666667, 1,
1.234705, 1.35019, 1.845344, 1, 0, 0.6588235, 1,
1.236395, -2.20411, 4.564469, 1, 0, 0.654902, 1,
1.23856, 1.144736, 1.219604, 1, 0, 0.6470588, 1,
1.23902, -2.463648, 3.975893, 1, 0, 0.6431373, 1,
1.243386, -1.11079, 1.458281, 1, 0, 0.6352941, 1,
1.249907, -0.1146734, 1.791511, 1, 0, 0.6313726, 1,
1.255046, 0.5002644, 3.066417, 1, 0, 0.6235294, 1,
1.270009, -0.4481083, 0.6125736, 1, 0, 0.6196079, 1,
1.274049, -1.286268, 2.263803, 1, 0, 0.6117647, 1,
1.276586, 0.6349565, 1.399974, 1, 0, 0.6078432, 1,
1.289227, -0.07301773, 2.652497, 1, 0, 0.6, 1,
1.289515, 0.08040313, -0.1107344, 1, 0, 0.5921569, 1,
1.291497, -1.610328, 0.6480494, 1, 0, 0.5882353, 1,
1.294135, -0.3473766, 3.408992, 1, 0, 0.5803922, 1,
1.300465, -1.717352, 1.28837, 1, 0, 0.5764706, 1,
1.323344, -0.3760985, -0.4182114, 1, 0, 0.5686275, 1,
1.330254, -0.287107, 1.898638, 1, 0, 0.5647059, 1,
1.338313, 0.8268323, 2.186449, 1, 0, 0.5568628, 1,
1.39082, 0.6187741, 3.960861, 1, 0, 0.5529412, 1,
1.40621, -0.6351775, 2.112286, 1, 0, 0.5450981, 1,
1.413867, 0.2179945, 0.4786953, 1, 0, 0.5411765, 1,
1.415093, 0.4821648, 1.597383, 1, 0, 0.5333334, 1,
1.424488, 0.1068262, 1.910084, 1, 0, 0.5294118, 1,
1.42797, 0.39626, 3.0052, 1, 0, 0.5215687, 1,
1.428046, -0.06379725, 2.068039, 1, 0, 0.5176471, 1,
1.436686, -0.2897654, 1.5106, 1, 0, 0.509804, 1,
1.444259, -1.768798, 1.752196, 1, 0, 0.5058824, 1,
1.445317, 0.5238941, 1.058865, 1, 0, 0.4980392, 1,
1.452884, 1.118015, -0.3223149, 1, 0, 0.4901961, 1,
1.45908, -1.965989, 4.02525, 1, 0, 0.4862745, 1,
1.465651, -0.2297959, 1.402586, 1, 0, 0.4784314, 1,
1.486783, 0.8441193, 0.9826966, 1, 0, 0.4745098, 1,
1.497347, -0.5124209, 2.354542, 1, 0, 0.4666667, 1,
1.500859, 0.6880062, 0.5499038, 1, 0, 0.4627451, 1,
1.505022, -1.89081, 2.687923, 1, 0, 0.454902, 1,
1.514202, 0.3643372, 0.9508636, 1, 0, 0.4509804, 1,
1.515212, -0.1554309, 0.8983829, 1, 0, 0.4431373, 1,
1.520364, -1.271179, 3.387754, 1, 0, 0.4392157, 1,
1.521596, 1.878943, -0.2240324, 1, 0, 0.4313726, 1,
1.530542, 1.05415, 2.07988, 1, 0, 0.427451, 1,
1.531639, -0.9674784, 2.387663, 1, 0, 0.4196078, 1,
1.53897, -1.486734, 1.902455, 1, 0, 0.4156863, 1,
1.54155, -1.02567, 1.230125, 1, 0, 0.4078431, 1,
1.541701, -0.4773443, 0.2059517, 1, 0, 0.4039216, 1,
1.547023, 0.1764112, 0.2661078, 1, 0, 0.3960784, 1,
1.547066, 0.6131886, 1.414036, 1, 0, 0.3882353, 1,
1.554324, -2.021295, 2.691326, 1, 0, 0.3843137, 1,
1.554605, -0.7233837, 1.517807, 1, 0, 0.3764706, 1,
1.559956, -1.15993, 1.975499, 1, 0, 0.372549, 1,
1.570986, -0.1716581, 2.296019, 1, 0, 0.3647059, 1,
1.577343, 1.904238, 0.7768199, 1, 0, 0.3607843, 1,
1.599569, -0.6800717, 2.578012, 1, 0, 0.3529412, 1,
1.602496, 1.101794, 1.840572, 1, 0, 0.3490196, 1,
1.607018, 1.434689, 1.040783, 1, 0, 0.3411765, 1,
1.615202, 0.4218685, 2.342106, 1, 0, 0.3372549, 1,
1.629171, 0.03573847, 1.704923, 1, 0, 0.3294118, 1,
1.63503, 1.236993, 1.084345, 1, 0, 0.3254902, 1,
1.655973, -0.65938, 1.606015, 1, 0, 0.3176471, 1,
1.668525, -0.3656299, 1.622082, 1, 0, 0.3137255, 1,
1.670772, -0.4445311, 0.9568263, 1, 0, 0.3058824, 1,
1.67088, 0.1524682, 0.4014684, 1, 0, 0.2980392, 1,
1.681871, 0.5234495, 1.827345, 1, 0, 0.2941177, 1,
1.698943, 0.4695946, -0.2688285, 1, 0, 0.2862745, 1,
1.701797, 0.1001486, 1.353739, 1, 0, 0.282353, 1,
1.704194, -1.687918, 2.99255, 1, 0, 0.2745098, 1,
1.728237, -0.915038, 0.8262318, 1, 0, 0.2705882, 1,
1.734837, -1.777063, 2.498883, 1, 0, 0.2627451, 1,
1.773507, -1.072331, 2.120557, 1, 0, 0.2588235, 1,
1.79677, -2.511479, 3.48587, 1, 0, 0.2509804, 1,
1.826248, 1.725345, 2.25665, 1, 0, 0.2470588, 1,
1.827674, -0.4184366, 3.402289, 1, 0, 0.2392157, 1,
1.836818, -0.2713896, 0.432454, 1, 0, 0.2352941, 1,
1.838357, 0.1667423, 1.447972, 1, 0, 0.227451, 1,
1.853843, 1.645025, 0.6794424, 1, 0, 0.2235294, 1,
1.859715, -0.3086633, 1.489626, 1, 0, 0.2156863, 1,
1.864802, 2.961896, -0.2619578, 1, 0, 0.2117647, 1,
1.894879, 1.112672, 1.445101, 1, 0, 0.2039216, 1,
1.918547, 0.7077391, 1.47981, 1, 0, 0.1960784, 1,
1.91883, 0.7405704, 0.5525029, 1, 0, 0.1921569, 1,
1.942575, 0.08507043, 3.349112, 1, 0, 0.1843137, 1,
1.943297, -1.005167, 3.075119, 1, 0, 0.1803922, 1,
1.962629, -1.216533, 2.970105, 1, 0, 0.172549, 1,
2.005505, -0.121986, 0.9369639, 1, 0, 0.1686275, 1,
2.021276, -1.338243, 1.950322, 1, 0, 0.1607843, 1,
2.058609, 1.46865, 2.028673, 1, 0, 0.1568628, 1,
2.088074, 1.91994, 0.2535216, 1, 0, 0.1490196, 1,
2.100309, -0.6217296, 1.57426, 1, 0, 0.145098, 1,
2.127971, -0.3159419, 0.9055753, 1, 0, 0.1372549, 1,
2.130144, -1.980298, 1.812385, 1, 0, 0.1333333, 1,
2.15709, 0.6218224, 0.5332702, 1, 0, 0.1254902, 1,
2.253467, 0.2025023, 1.283304, 1, 0, 0.1215686, 1,
2.287062, -1.028034, 1.987402, 1, 0, 0.1137255, 1,
2.326136, 1.035261, 0.4703288, 1, 0, 0.1098039, 1,
2.327187, -0.1528854, 0.2229213, 1, 0, 0.1019608, 1,
2.331731, -1.310397, 1.099735, 1, 0, 0.09411765, 1,
2.361219, 0.03071225, 0.2423973, 1, 0, 0.09019608, 1,
2.420505, 0.6258545, 3.854006, 1, 0, 0.08235294, 1,
2.426499, 1.010002, 1.372027, 1, 0, 0.07843138, 1,
2.436476, 0.2398387, 1.052607, 1, 0, 0.07058824, 1,
2.443658, 2.275488, 0.5597566, 1, 0, 0.06666667, 1,
2.514045, -0.9718666, 1.790642, 1, 0, 0.05882353, 1,
2.585886, -1.883425, 1.1829, 1, 0, 0.05490196, 1,
2.586499, -2.122002, 1.263423, 1, 0, 0.04705882, 1,
2.604919, -0.9838709, 1.362316, 1, 0, 0.04313726, 1,
2.661402, 0.3431664, 1.630418, 1, 0, 0.03529412, 1,
2.677119, 0.9087731, 0.9559778, 1, 0, 0.03137255, 1,
2.690959, 1.03038, 1.535376, 1, 0, 0.02352941, 1,
2.72229, -1.503332, 2.862553, 1, 0, 0.01960784, 1,
2.908684, 1.109099, 1.640175, 1, 0, 0.01176471, 1,
3.076321, -0.5839831, 1.206885, 1, 0, 0.007843138, 1
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
-0.007235885, -4.027458, -6.949867, 0, -0.5, 0.5, 0.5,
-0.007235885, -4.027458, -6.949867, 1, -0.5, 0.5, 0.5,
-0.007235885, -4.027458, -6.949867, 1, 1.5, 0.5, 0.5,
-0.007235885, -4.027458, -6.949867, 0, 1.5, 0.5, 0.5
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
-4.136119, 0.6917127, -6.949867, 0, -0.5, 0.5, 0.5,
-4.136119, 0.6917127, -6.949867, 1, -0.5, 0.5, 0.5,
-4.136119, 0.6917127, -6.949867, 1, 1.5, 0.5, 0.5,
-4.136119, 0.6917127, -6.949867, 0, 1.5, 0.5, 0.5
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
-4.136119, -4.027458, -0.01363111, 0, -0.5, 0.5, 0.5,
-4.136119, -4.027458, -0.01363111, 1, -0.5, 0.5, 0.5,
-4.136119, -4.027458, -0.01363111, 1, 1.5, 0.5, 0.5,
-4.136119, -4.027458, -0.01363111, 0, 1.5, 0.5, 0.5
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
-3, -2.938419, -5.349197,
3, -2.938419, -5.349197,
-3, -2.938419, -5.349197,
-3, -3.119925, -5.615975,
-2, -2.938419, -5.349197,
-2, -3.119925, -5.615975,
-1, -2.938419, -5.349197,
-1, -3.119925, -5.615975,
0, -2.938419, -5.349197,
0, -3.119925, -5.615975,
1, -2.938419, -5.349197,
1, -3.119925, -5.615975,
2, -2.938419, -5.349197,
2, -3.119925, -5.615975,
3, -2.938419, -5.349197,
3, -3.119925, -5.615975
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
-3, -3.482938, -6.149532, 0, -0.5, 0.5, 0.5,
-3, -3.482938, -6.149532, 1, -0.5, 0.5, 0.5,
-3, -3.482938, -6.149532, 1, 1.5, 0.5, 0.5,
-3, -3.482938, -6.149532, 0, 1.5, 0.5, 0.5,
-2, -3.482938, -6.149532, 0, -0.5, 0.5, 0.5,
-2, -3.482938, -6.149532, 1, -0.5, 0.5, 0.5,
-2, -3.482938, -6.149532, 1, 1.5, 0.5, 0.5,
-2, -3.482938, -6.149532, 0, 1.5, 0.5, 0.5,
-1, -3.482938, -6.149532, 0, -0.5, 0.5, 0.5,
-1, -3.482938, -6.149532, 1, -0.5, 0.5, 0.5,
-1, -3.482938, -6.149532, 1, 1.5, 0.5, 0.5,
-1, -3.482938, -6.149532, 0, 1.5, 0.5, 0.5,
0, -3.482938, -6.149532, 0, -0.5, 0.5, 0.5,
0, -3.482938, -6.149532, 1, -0.5, 0.5, 0.5,
0, -3.482938, -6.149532, 1, 1.5, 0.5, 0.5,
0, -3.482938, -6.149532, 0, 1.5, 0.5, 0.5,
1, -3.482938, -6.149532, 0, -0.5, 0.5, 0.5,
1, -3.482938, -6.149532, 1, -0.5, 0.5, 0.5,
1, -3.482938, -6.149532, 1, 1.5, 0.5, 0.5,
1, -3.482938, -6.149532, 0, 1.5, 0.5, 0.5,
2, -3.482938, -6.149532, 0, -0.5, 0.5, 0.5,
2, -3.482938, -6.149532, 1, -0.5, 0.5, 0.5,
2, -3.482938, -6.149532, 1, 1.5, 0.5, 0.5,
2, -3.482938, -6.149532, 0, 1.5, 0.5, 0.5,
3, -3.482938, -6.149532, 0, -0.5, 0.5, 0.5,
3, -3.482938, -6.149532, 1, -0.5, 0.5, 0.5,
3, -3.482938, -6.149532, 1, 1.5, 0.5, 0.5,
3, -3.482938, -6.149532, 0, 1.5, 0.5, 0.5
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
-3.1833, -2, -5.349197,
-3.1833, 4, -5.349197,
-3.1833, -2, -5.349197,
-3.342103, -2, -5.615975,
-3.1833, 0, -5.349197,
-3.342103, 0, -5.615975,
-3.1833, 2, -5.349197,
-3.342103, 2, -5.615975,
-3.1833, 4, -5.349197,
-3.342103, 4, -5.615975
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
"0",
"2",
"4"
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
-3.659709, -2, -6.149532, 0, -0.5, 0.5, 0.5,
-3.659709, -2, -6.149532, 1, -0.5, 0.5, 0.5,
-3.659709, -2, -6.149532, 1, 1.5, 0.5, 0.5,
-3.659709, -2, -6.149532, 0, 1.5, 0.5, 0.5,
-3.659709, 0, -6.149532, 0, -0.5, 0.5, 0.5,
-3.659709, 0, -6.149532, 1, -0.5, 0.5, 0.5,
-3.659709, 0, -6.149532, 1, 1.5, 0.5, 0.5,
-3.659709, 0, -6.149532, 0, 1.5, 0.5, 0.5,
-3.659709, 2, -6.149532, 0, -0.5, 0.5, 0.5,
-3.659709, 2, -6.149532, 1, -0.5, 0.5, 0.5,
-3.659709, 2, -6.149532, 1, 1.5, 0.5, 0.5,
-3.659709, 2, -6.149532, 0, 1.5, 0.5, 0.5,
-3.659709, 4, -6.149532, 0, -0.5, 0.5, 0.5,
-3.659709, 4, -6.149532, 1, -0.5, 0.5, 0.5,
-3.659709, 4, -6.149532, 1, 1.5, 0.5, 0.5,
-3.659709, 4, -6.149532, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.1833, -2.938419, -4,
-3.1833, -2.938419, 4,
-3.1833, -2.938419, -4,
-3.342103, -3.119925, -4,
-3.1833, -2.938419, -2,
-3.342103, -3.119925, -2,
-3.1833, -2.938419, 0,
-3.342103, -3.119925, 0,
-3.1833, -2.938419, 2,
-3.342103, -3.119925, 2,
-3.1833, -2.938419, 4,
-3.342103, -3.119925, 4
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
-3.659709, -3.482938, -4, 0, -0.5, 0.5, 0.5,
-3.659709, -3.482938, -4, 1, -0.5, 0.5, 0.5,
-3.659709, -3.482938, -4, 1, 1.5, 0.5, 0.5,
-3.659709, -3.482938, -4, 0, 1.5, 0.5, 0.5,
-3.659709, -3.482938, -2, 0, -0.5, 0.5, 0.5,
-3.659709, -3.482938, -2, 1, -0.5, 0.5, 0.5,
-3.659709, -3.482938, -2, 1, 1.5, 0.5, 0.5,
-3.659709, -3.482938, -2, 0, 1.5, 0.5, 0.5,
-3.659709, -3.482938, 0, 0, -0.5, 0.5, 0.5,
-3.659709, -3.482938, 0, 1, -0.5, 0.5, 0.5,
-3.659709, -3.482938, 0, 1, 1.5, 0.5, 0.5,
-3.659709, -3.482938, 0, 0, 1.5, 0.5, 0.5,
-3.659709, -3.482938, 2, 0, -0.5, 0.5, 0.5,
-3.659709, -3.482938, 2, 1, -0.5, 0.5, 0.5,
-3.659709, -3.482938, 2, 1, 1.5, 0.5, 0.5,
-3.659709, -3.482938, 2, 0, 1.5, 0.5, 0.5,
-3.659709, -3.482938, 4, 0, -0.5, 0.5, 0.5,
-3.659709, -3.482938, 4, 1, -0.5, 0.5, 0.5,
-3.659709, -3.482938, 4, 1, 1.5, 0.5, 0.5,
-3.659709, -3.482938, 4, 0, 1.5, 0.5, 0.5
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
-3.1833, -2.938419, -5.349197,
-3.1833, 4.321844, -5.349197,
-3.1833, -2.938419, 5.321935,
-3.1833, 4.321844, 5.321935,
-3.1833, -2.938419, -5.349197,
-3.1833, -2.938419, 5.321935,
-3.1833, 4.321844, -5.349197,
-3.1833, 4.321844, 5.321935,
-3.1833, -2.938419, -5.349197,
3.168828, -2.938419, -5.349197,
-3.1833, -2.938419, 5.321935,
3.168828, -2.938419, 5.321935,
-3.1833, 4.321844, -5.349197,
3.168828, 4.321844, -5.349197,
-3.1833, 4.321844, 5.321935,
3.168828, 4.321844, 5.321935,
3.168828, -2.938419, -5.349197,
3.168828, 4.321844, -5.349197,
3.168828, -2.938419, 5.321935,
3.168828, 4.321844, 5.321935,
3.168828, -2.938419, -5.349197,
3.168828, -2.938419, 5.321935,
3.168828, 4.321844, -5.349197,
3.168828, 4.321844, 5.321935
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
var radius = 7.681418;
var distance = 34.1755;
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
mvMatrix.translate( 0.007235885, -0.6917127, 0.01363111 );
mvMatrix.scale( 1.307483, 1.143939, 0.778296 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.1755);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.090793, -0.222846, -2.081007, 0, 0, 1, 1, 1,
-2.753437, 0.4863868, -1.478414, 1, 0, 0, 1, 1,
-2.712227, 0.4760338, -0.9057609, 1, 0, 0, 1, 1,
-2.667507, 3.122658, -0.3651828, 1, 0, 0, 1, 1,
-2.528699, 0.6178144, -1.580305, 1, 0, 0, 1, 1,
-2.477654, 0.07210059, -2.664623, 1, 0, 0, 1, 1,
-2.452255, 1.244568, -0.3030008, 0, 0, 0, 1, 1,
-2.401573, -0.2807216, -2.56737, 0, 0, 0, 1, 1,
-2.387696, 2.855586, -0.5784703, 0, 0, 0, 1, 1,
-2.362543, -0.6572299, -3.331441, 0, 0, 0, 1, 1,
-2.319366, -0.462452, -0.8218508, 0, 0, 0, 1, 1,
-2.279045, -0.2593819, -0.9601174, 0, 0, 0, 1, 1,
-2.255511, 0.09832671, -1.66566, 0, 0, 0, 1, 1,
-2.198132, 0.1847215, -1.304035, 1, 1, 1, 1, 1,
-2.187119, -0.103839, -1.97269, 1, 1, 1, 1, 1,
-2.175943, 1.514873, 1.070272, 1, 1, 1, 1, 1,
-2.137048, 1.056813, -1.279053, 1, 1, 1, 1, 1,
-2.120476, -1.239464, -1.7349, 1, 1, 1, 1, 1,
-2.090389, 0.6871871, 0.3618953, 1, 1, 1, 1, 1,
-2.065188, 0.1533994, -2.256402, 1, 1, 1, 1, 1,
-2.041666, -1.400081, -1.758214, 1, 1, 1, 1, 1,
-2.030404, -0.3189158, -1.690035, 1, 1, 1, 1, 1,
-1.998151, -0.5597807, -2.952489, 1, 1, 1, 1, 1,
-1.969447, -1.037083, -3.712886, 1, 1, 1, 1, 1,
-1.962796, 0.2503066, -3.269271, 1, 1, 1, 1, 1,
-1.946696, 0.132637, -0.0729065, 1, 1, 1, 1, 1,
-1.906697, -0.8274339, -3.166767, 1, 1, 1, 1, 1,
-1.880988, -0.6576059, -2.458741, 1, 1, 1, 1, 1,
-1.87735, -0.2906795, -1.029538, 0, 0, 1, 1, 1,
-1.855461, 0.5967048, -2.512606, 1, 0, 0, 1, 1,
-1.852318, -0.6929002, -2.556238, 1, 0, 0, 1, 1,
-1.834543, -0.03944055, -2.349917, 1, 0, 0, 1, 1,
-1.833025, -1.038922, -1.766133, 1, 0, 0, 1, 1,
-1.83166, 0.6162891, -1.451578, 1, 0, 0, 1, 1,
-1.828667, 0.5360821, -0.5832673, 0, 0, 0, 1, 1,
-1.824944, -2.828828, -3.108656, 0, 0, 0, 1, 1,
-1.817707, -0.5961769, -1.676329, 0, 0, 0, 1, 1,
-1.812916, -0.466271, -1.638551, 0, 0, 0, 1, 1,
-1.780902, -0.6717691, -0.8122247, 0, 0, 0, 1, 1,
-1.774337, -0.6247134, -2.49442, 0, 0, 0, 1, 1,
-1.748198, -0.8185615, -2.016647, 0, 0, 0, 1, 1,
-1.747987, 0.9517496, -0.7866927, 1, 1, 1, 1, 1,
-1.727222, 0.2498036, -2.04803, 1, 1, 1, 1, 1,
-1.698815, -0.3277589, -2.300607, 1, 1, 1, 1, 1,
-1.694432, -0.879288, -1.945626, 1, 1, 1, 1, 1,
-1.673124, 0.01224107, -4.212895, 1, 1, 1, 1, 1,
-1.66981, 0.360246, -2.198083, 1, 1, 1, 1, 1,
-1.660709, -1.268853, -2.69106, 1, 1, 1, 1, 1,
-1.637233, 2.429646, 0.8069181, 1, 1, 1, 1, 1,
-1.623862, 0.2927215, 0.3520936, 1, 1, 1, 1, 1,
-1.623643, 0.8035363, -2.199724, 1, 1, 1, 1, 1,
-1.617941, 1.074124, -1.934744, 1, 1, 1, 1, 1,
-1.59377, 0.6081205, -0.9186055, 1, 1, 1, 1, 1,
-1.554949, -0.3281693, -3.85937, 1, 1, 1, 1, 1,
-1.554831, -0.9380866, -2.659915, 1, 1, 1, 1, 1,
-1.5525, 0.07286648, -2.456823, 1, 1, 1, 1, 1,
-1.552434, 0.5835304, -1.838865, 0, 0, 1, 1, 1,
-1.550317, 1.16875, -0.7474396, 1, 0, 0, 1, 1,
-1.538804, -0.4050529, -2.292484, 1, 0, 0, 1, 1,
-1.536622, 0.5120052, -0.6567399, 1, 0, 0, 1, 1,
-1.515265, 0.1840948, -0.0006728872, 1, 0, 0, 1, 1,
-1.503961, 0.3429554, -0.008438704, 1, 0, 0, 1, 1,
-1.503663, 1.516483, -1.561691, 0, 0, 0, 1, 1,
-1.502256, -2.292643, -4.454679, 0, 0, 0, 1, 1,
-1.496613, 0.1543631, -1.496954, 0, 0, 0, 1, 1,
-1.495303, -0.8187484, -1.645394, 0, 0, 0, 1, 1,
-1.492405, -0.3516107, -0.7531174, 0, 0, 0, 1, 1,
-1.484571, 0.4965571, -0.4828774, 0, 0, 0, 1, 1,
-1.481763, -2.379397, -3.922916, 0, 0, 0, 1, 1,
-1.468483, -0.6914504, -2.319398, 1, 1, 1, 1, 1,
-1.452985, -1.295173, -5.193792, 1, 1, 1, 1, 1,
-1.451507, -1.090296, -2.626338, 1, 1, 1, 1, 1,
-1.448741, 1.048854, -1.154343, 1, 1, 1, 1, 1,
-1.44364, 0.2521634, -1.340015, 1, 1, 1, 1, 1,
-1.440539, -0.183888, -2.165076, 1, 1, 1, 1, 1,
-1.433923, 0.1030686, -2.528616, 1, 1, 1, 1, 1,
-1.42402, 1.098878, 0.1173847, 1, 1, 1, 1, 1,
-1.423316, -0.3030376, -0.3755213, 1, 1, 1, 1, 1,
-1.420908, 1.065868, 1.191712, 1, 1, 1, 1, 1,
-1.417017, 0.7793972, -1.40291, 1, 1, 1, 1, 1,
-1.408115, 0.3169939, -1.201868, 1, 1, 1, 1, 1,
-1.406417, -0.5435711, -2.161976, 1, 1, 1, 1, 1,
-1.405863, -0.07647746, -2.021669, 1, 1, 1, 1, 1,
-1.404539, -0.1238808, 0.5136744, 1, 1, 1, 1, 1,
-1.403725, -0.08828921, -2.25774, 0, 0, 1, 1, 1,
-1.394192, -0.4937172, -1.109714, 1, 0, 0, 1, 1,
-1.371985, 0.4355073, -0.6171274, 1, 0, 0, 1, 1,
-1.368908, 0.6025844, -0.7415155, 1, 0, 0, 1, 1,
-1.362246, -1.026715, -3.091926, 1, 0, 0, 1, 1,
-1.361821, 1.182079, -0.5692592, 1, 0, 0, 1, 1,
-1.361581, -1.672817, -0.3800648, 0, 0, 0, 1, 1,
-1.347799, 1.931013, -0.8883212, 0, 0, 0, 1, 1,
-1.346251, 0.01350802, -1.227808, 0, 0, 0, 1, 1,
-1.345539, 0.6254385, -0.1618456, 0, 0, 0, 1, 1,
-1.337459, 1.654622, 0.3743516, 0, 0, 0, 1, 1,
-1.33424, 0.3270385, -0.3506481, 0, 0, 0, 1, 1,
-1.332952, -0.8556311, -0.9695187, 0, 0, 0, 1, 1,
-1.328616, -0.3779523, -0.8183595, 1, 1, 1, 1, 1,
-1.326407, 0.6073182, -1.787092, 1, 1, 1, 1, 1,
-1.320657, 0.7739071, 0.2352748, 1, 1, 1, 1, 1,
-1.318874, 0.5020964, -2.330563, 1, 1, 1, 1, 1,
-1.310353, 2.159441, -1.821115, 1, 1, 1, 1, 1,
-1.302545, 0.5534936, -0.7088647, 1, 1, 1, 1, 1,
-1.294258, -1.374238, -2.153424, 1, 1, 1, 1, 1,
-1.285037, -0.2905644, -1.311465, 1, 1, 1, 1, 1,
-1.278372, -0.1819639, -3.036302, 1, 1, 1, 1, 1,
-1.272255, 0.5329413, -1.41846, 1, 1, 1, 1, 1,
-1.258459, -0.7958685, -1.595211, 1, 1, 1, 1, 1,
-1.256632, 0.5435712, -2.002024, 1, 1, 1, 1, 1,
-1.241174, -0.1496811, -1.654913, 1, 1, 1, 1, 1,
-1.241093, -0.1452618, -1.499245, 1, 1, 1, 1, 1,
-1.218196, -2.07443, -2.81958, 1, 1, 1, 1, 1,
-1.216344, -2.832687, -2.86677, 0, 0, 1, 1, 1,
-1.21522, -1.15519, -2.253015, 1, 0, 0, 1, 1,
-1.200143, 2.233649, 1.056742, 1, 0, 0, 1, 1,
-1.195398, 0.6790873, 0.04032041, 1, 0, 0, 1, 1,
-1.191373, -1.584288, -2.491242, 1, 0, 0, 1, 1,
-1.19039, 0.2825434, -2.415547, 1, 0, 0, 1, 1,
-1.187298, -0.7690855, -2.514591, 0, 0, 0, 1, 1,
-1.178381, -0.3367381, -2.61919, 0, 0, 0, 1, 1,
-1.176705, -1.010817, -1.041682, 0, 0, 0, 1, 1,
-1.175287, -0.9480695, -3.028136, 0, 0, 0, 1, 1,
-1.175211, -0.629279, -3.397031, 0, 0, 0, 1, 1,
-1.172471, 0.4429579, -1.571788, 0, 0, 0, 1, 1,
-1.172224, 1.93762, -1.896639, 0, 0, 0, 1, 1,
-1.172164, -0.5652691, -2.762872, 1, 1, 1, 1, 1,
-1.160937, 1.474259, -0.9303403, 1, 1, 1, 1, 1,
-1.150352, 1.125137, -1.046054, 1, 1, 1, 1, 1,
-1.149723, -0.7108596, -2.270851, 1, 1, 1, 1, 1,
-1.139905, -0.720309, -0.2530515, 1, 1, 1, 1, 1,
-1.136841, 0.49343, -1.528218, 1, 1, 1, 1, 1,
-1.126546, 1.348459, -1.323738, 1, 1, 1, 1, 1,
-1.120898, -0.5151848, -1.220422, 1, 1, 1, 1, 1,
-1.119533, 1.648032, -0.5868766, 1, 1, 1, 1, 1,
-1.117125, 0.8832626, -0.3114087, 1, 1, 1, 1, 1,
-1.115132, -0.093491, -0.5542822, 1, 1, 1, 1, 1,
-1.114526, -1.054215, -1.611036, 1, 1, 1, 1, 1,
-1.11426, 0.9954311, -1.617646, 1, 1, 1, 1, 1,
-1.112582, -1.074346, -3.410695, 1, 1, 1, 1, 1,
-1.108103, 0.07956728, -0.8214565, 1, 1, 1, 1, 1,
-1.098589, 1.155695, -1.648256, 0, 0, 1, 1, 1,
-1.097927, 0.4711362, -1.704479, 1, 0, 0, 1, 1,
-1.096096, -1.399782, -1.302116, 1, 0, 0, 1, 1,
-1.088618, 1.703299, 0.1284468, 1, 0, 0, 1, 1,
-1.088275, -0.9179815, -0.8089141, 1, 0, 0, 1, 1,
-1.087844, -1.229112, -1.522708, 1, 0, 0, 1, 1,
-1.087827, 0.4184497, -2.054373, 0, 0, 0, 1, 1,
-1.076636, 0.7565004, -1.23051, 0, 0, 0, 1, 1,
-1.071065, -0.9111814, -0.8809851, 0, 0, 0, 1, 1,
-1.065757, 0.6730061, -2.049982, 0, 0, 0, 1, 1,
-1.062804, -0.04724639, -2.89694, 0, 0, 0, 1, 1,
-1.061039, -1.136485, -2.185747, 0, 0, 0, 1, 1,
-1.059134, -1.667315, -2.315947, 0, 0, 0, 1, 1,
-1.058909, 0.8046567, -1.878533, 1, 1, 1, 1, 1,
-1.044207, -1.046748, -3.048001, 1, 1, 1, 1, 1,
-1.036403, -0.05927226, -1.842729, 1, 1, 1, 1, 1,
-1.033405, -0.2455999, -2.56907, 1, 1, 1, 1, 1,
-1.03145, -0.151407, -0.8867396, 1, 1, 1, 1, 1,
-1.02619, -2.445484, -3.072832, 1, 1, 1, 1, 1,
-1.021718, 1.68665, -4.552891, 1, 1, 1, 1, 1,
-1.019697, 0.6350741, -2.199887, 1, 1, 1, 1, 1,
-1.018211, 0.698867, -1.150143, 1, 1, 1, 1, 1,
-1.014059, -0.7927498, -2.145052, 1, 1, 1, 1, 1,
-1.013452, -0.3621057, -1.894137, 1, 1, 1, 1, 1,
-1.004585, 0.6651478, -1.481511, 1, 1, 1, 1, 1,
-1.002063, -0.6076133, 0.8877987, 1, 1, 1, 1, 1,
-1.000767, -0.5835341, -0.8869362, 1, 1, 1, 1, 1,
-0.9924607, 1.292084, -0.2032722, 1, 1, 1, 1, 1,
-0.9912609, -1.57646, -2.940744, 0, 0, 1, 1, 1,
-0.9656039, -0.02191518, -1.102944, 1, 0, 0, 1, 1,
-0.9632264, -1.923565, -3.325027, 1, 0, 0, 1, 1,
-0.9491434, -0.8323199, -2.279816, 1, 0, 0, 1, 1,
-0.9486953, -1.00565, -2.184696, 1, 0, 0, 1, 1,
-0.9402594, 0.7534809, 0.1108161, 1, 0, 0, 1, 1,
-0.9351716, 0.9486417, 0.2918204, 0, 0, 0, 1, 1,
-0.9305956, 0.04459978, -1.957671, 0, 0, 0, 1, 1,
-0.9260648, 1.369579, 0.4147289, 0, 0, 0, 1, 1,
-0.9240245, -0.2269186, -0.280209, 0, 0, 0, 1, 1,
-0.9238315, -0.05015621, -0.09986337, 0, 0, 0, 1, 1,
-0.9184071, 0.928883, -0.305523, 0, 0, 0, 1, 1,
-0.9111774, -0.1500606, -3.576575, 0, 0, 0, 1, 1,
-0.9103651, -0.5559422, -3.501243, 1, 1, 1, 1, 1,
-0.9077748, 0.839417, -0.08731505, 1, 1, 1, 1, 1,
-0.9068677, 0.8574632, 0.268358, 1, 1, 1, 1, 1,
-0.906356, 0.3770745, 1.483188, 1, 1, 1, 1, 1,
-0.905358, 0.09302871, -1.965277, 1, 1, 1, 1, 1,
-0.9023254, 1.488334, 0.4774043, 1, 1, 1, 1, 1,
-0.8982384, -0.5285496, -2.949489, 1, 1, 1, 1, 1,
-0.8965819, -2.322726, -3.257367, 1, 1, 1, 1, 1,
-0.8932827, -1.038412, -1.145989, 1, 1, 1, 1, 1,
-0.887243, 1.150744, -1.234795, 1, 1, 1, 1, 1,
-0.8868412, -0.8793329, -4.335131, 1, 1, 1, 1, 1,
-0.8865726, 0.3562079, -1.736189, 1, 1, 1, 1, 1,
-0.8797809, 1.638575, -0.2033763, 1, 1, 1, 1, 1,
-0.8772455, 1.209429, 0.5893888, 1, 1, 1, 1, 1,
-0.876817, -0.1337776, -0.9308537, 1, 1, 1, 1, 1,
-0.8690277, -0.1250041, -2.660145, 0, 0, 1, 1, 1,
-0.8659238, -0.4451595, -0.9611881, 1, 0, 0, 1, 1,
-0.8655687, 0.9637207, -1.02165, 1, 0, 0, 1, 1,
-0.8651639, 1.166005, 1.672053, 1, 0, 0, 1, 1,
-0.8458126, -0.1688311, -2.038916, 1, 0, 0, 1, 1,
-0.8439056, 1.382557, -1.040993, 1, 0, 0, 1, 1,
-0.84005, 1.09845, 0.2034468, 0, 0, 0, 1, 1,
-0.8312516, 0.8400995, -0.1090726, 0, 0, 0, 1, 1,
-0.8310041, 0.2761909, -2.4978, 0, 0, 0, 1, 1,
-0.827362, 0.5889391, -1.56054, 0, 0, 0, 1, 1,
-0.8185663, -0.1070348, -3.988058, 0, 0, 0, 1, 1,
-0.8162773, 0.1246385, -2.31385, 0, 0, 0, 1, 1,
-0.8155076, 0.0124056, -0.9156713, 0, 0, 0, 1, 1,
-0.8092867, 0.8493205, -1.206388, 1, 1, 1, 1, 1,
-0.8080195, -0.7534766, -3.301888, 1, 1, 1, 1, 1,
-0.8066758, 0.01579409, -0.5573457, 1, 1, 1, 1, 1,
-0.8063019, 0.04915239, -3.119886, 1, 1, 1, 1, 1,
-0.8060439, 1.332023, 2.065673, 1, 1, 1, 1, 1,
-0.8055802, -0.7909127, -0.5102986, 1, 1, 1, 1, 1,
-0.7871867, 1.235305, 1.500807, 1, 1, 1, 1, 1,
-0.7715704, 0.4455102, -0.939427, 1, 1, 1, 1, 1,
-0.7677025, 0.08161645, -2.848934, 1, 1, 1, 1, 1,
-0.7657222, 0.9739788, 0.6855531, 1, 1, 1, 1, 1,
-0.7590616, -2.365143, -2.618415, 1, 1, 1, 1, 1,
-0.7550932, 1.98202, 0.4512332, 1, 1, 1, 1, 1,
-0.753944, -1.244914, -2.473434, 1, 1, 1, 1, 1,
-0.7493374, 0.1615274, -0.2707671, 1, 1, 1, 1, 1,
-0.7492271, -1.48147, -4.517941, 1, 1, 1, 1, 1,
-0.745013, -1.185094, -1.674924, 0, 0, 1, 1, 1,
-0.7429613, -0.2887431, -0.6438428, 1, 0, 0, 1, 1,
-0.7428125, 0.6550122, 0.9409919, 1, 0, 0, 1, 1,
-0.7412132, -0.7414806, -1.664508, 1, 0, 0, 1, 1,
-0.7355255, 1.260457, -0.8916742, 1, 0, 0, 1, 1,
-0.7342451, 0.3614337, -0.26426, 1, 0, 0, 1, 1,
-0.7284954, 1.341349, -1.021135, 0, 0, 0, 1, 1,
-0.7283335, 0.661597, 0.3876849, 0, 0, 0, 1, 1,
-0.7259725, 0.8773206, -0.3648194, 0, 0, 0, 1, 1,
-0.7225652, 0.5153869, -1.122808, 0, 0, 0, 1, 1,
-0.7183944, -0.169529, -1.91701, 0, 0, 0, 1, 1,
-0.7172377, -0.4085685, -1.70121, 0, 0, 0, 1, 1,
-0.7109562, 1.178109, 1.201499, 0, 0, 0, 1, 1,
-0.7098629, -0.4787324, -2.373752, 1, 1, 1, 1, 1,
-0.7098535, -2.378083, -2.100811, 1, 1, 1, 1, 1,
-0.7055969, 1.47599, 0.9144527, 1, 1, 1, 1, 1,
-0.704311, -0.5816643, -2.171615, 1, 1, 1, 1, 1,
-0.7016312, 1.043472, -0.2982273, 1, 1, 1, 1, 1,
-0.694609, -0.06357823, -1.984369, 1, 1, 1, 1, 1,
-0.6937828, -0.1984802, -2.610464, 1, 1, 1, 1, 1,
-0.6937318, 1.181505, -1.349691, 1, 1, 1, 1, 1,
-0.6907955, -0.2454878, -1.43462, 1, 1, 1, 1, 1,
-0.6859739, 1.521093, -0.9354187, 1, 1, 1, 1, 1,
-0.6843409, -0.6610427, -0.8145089, 1, 1, 1, 1, 1,
-0.6837571, 0.5780308, -1.004461, 1, 1, 1, 1, 1,
-0.6832825, -0.5390037, -1.941959, 1, 1, 1, 1, 1,
-0.6805837, -2.609174, -2.598709, 1, 1, 1, 1, 1,
-0.6667712, -0.02312806, -2.093652, 1, 1, 1, 1, 1,
-0.6660344, 1.197139, 1.152536, 0, 0, 1, 1, 1,
-0.664946, 0.4229621, -1.202277, 1, 0, 0, 1, 1,
-0.6638661, 0.1557358, 0.3625967, 1, 0, 0, 1, 1,
-0.6598462, -0.4795122, -1.571414, 1, 0, 0, 1, 1,
-0.6581955, -0.2398018, -2.214015, 1, 0, 0, 1, 1,
-0.6529408, -1.407463, -3.03515, 1, 0, 0, 1, 1,
-0.6493886, 0.5419195, -0.927098, 0, 0, 0, 1, 1,
-0.6488191, -0.6074979, -2.870162, 0, 0, 0, 1, 1,
-0.6472371, 1.014842, -1.470697, 0, 0, 0, 1, 1,
-0.6472208, 0.1202517, -0.5561886, 0, 0, 0, 1, 1,
-0.6425319, 0.08184015, -1.811267, 0, 0, 0, 1, 1,
-0.6420045, 0.1601347, -2.181687, 0, 0, 0, 1, 1,
-0.6415073, 1.197226, -1.231035, 0, 0, 0, 1, 1,
-0.6413815, 0.01072225, -1.985096, 1, 1, 1, 1, 1,
-0.6390846, 0.1336462, -0.7322001, 1, 1, 1, 1, 1,
-0.6389773, -0.09510407, -0.8782158, 1, 1, 1, 1, 1,
-0.633751, 0.1979458, -1.305265, 1, 1, 1, 1, 1,
-0.632379, -0.4325027, -1.053183, 1, 1, 1, 1, 1,
-0.6310406, 0.1286533, 1.947431, 1, 1, 1, 1, 1,
-0.6284287, 1.323502, -0.8425154, 1, 1, 1, 1, 1,
-0.6277217, 1.185622, -3.242354, 1, 1, 1, 1, 1,
-0.6258159, -0.133146, -0.8466749, 1, 1, 1, 1, 1,
-0.6254848, 1.249636, -0.5535636, 1, 1, 1, 1, 1,
-0.6215029, 0.2585817, 0.08711076, 1, 1, 1, 1, 1,
-0.6194803, -1.624558, -2.92641, 1, 1, 1, 1, 1,
-0.6181509, -0.7934548, -3.50436, 1, 1, 1, 1, 1,
-0.618084, -1.320512, -2.553088, 1, 1, 1, 1, 1,
-0.6102307, -0.5452452, -2.245866, 1, 1, 1, 1, 1,
-0.6078187, -1.088997, -3.658362, 0, 0, 1, 1, 1,
-0.6065559, 0.4496127, -0.5530318, 1, 0, 0, 1, 1,
-0.5894707, 0.009513875, -2.717803, 1, 0, 0, 1, 1,
-0.5892021, 0.3100912, 0.6861844, 1, 0, 0, 1, 1,
-0.5842777, 0.7671554, 0.6625913, 1, 0, 0, 1, 1,
-0.582457, -0.150315, -1.979927, 1, 0, 0, 1, 1,
-0.5813493, -2.281178, -3.352199, 0, 0, 0, 1, 1,
-0.5763926, -1.777479, -3.259809, 0, 0, 0, 1, 1,
-0.5660592, -1.194662, -4.409296, 0, 0, 0, 1, 1,
-0.5655659, 1.103362, 0.3045671, 0, 0, 0, 1, 1,
-0.563346, 0.362841, -1.519324, 0, 0, 0, 1, 1,
-0.5622237, 1.051016, -1.087948, 0, 0, 0, 1, 1,
-0.5616971, -0.7213401, -2.490249, 0, 0, 0, 1, 1,
-0.561684, -0.004651795, -0.1888089, 1, 1, 1, 1, 1,
-0.561215, -1.238852, -3.963719, 1, 1, 1, 1, 1,
-0.5576279, 0.3613178, -0.7118339, 1, 1, 1, 1, 1,
-0.55392, -1.487911, -2.981268, 1, 1, 1, 1, 1,
-0.5376243, 0.7219794, -1.379921, 1, 1, 1, 1, 1,
-0.5362557, -1.026627, -3.816153, 1, 1, 1, 1, 1,
-0.5300322, 1.231741, -0.4900755, 1, 1, 1, 1, 1,
-0.5279265, 0.1020405, -2.950251, 1, 1, 1, 1, 1,
-0.5225931, 0.5523395, -2.284463, 1, 1, 1, 1, 1,
-0.5218136, 0.4649479, -2.858391, 1, 1, 1, 1, 1,
-0.5172217, 0.64117, 0.1997962, 1, 1, 1, 1, 1,
-0.5142397, -1.047352, -2.068564, 1, 1, 1, 1, 1,
-0.5126406, 0.456868, -1.308389, 1, 1, 1, 1, 1,
-0.5108847, -2.12514, -4.043122, 1, 1, 1, 1, 1,
-0.5074929, -0.9648361, -1.530875, 1, 1, 1, 1, 1,
-0.5027344, 0.22369, -0.07950975, 0, 0, 1, 1, 1,
-0.4978981, -0.03387006, -1.78822, 1, 0, 0, 1, 1,
-0.495356, 1.82241, -0.4389441, 1, 0, 0, 1, 1,
-0.4882969, -0.6718282, -1.96613, 1, 0, 0, 1, 1,
-0.4861357, 0.9281837, -0.4022331, 1, 0, 0, 1, 1,
-0.4816933, 1.052777, 0.01284321, 1, 0, 0, 1, 1,
-0.4815294, -0.9204845, -1.622603, 0, 0, 0, 1, 1,
-0.4811085, 0.5262311, -1.390113, 0, 0, 0, 1, 1,
-0.4799968, 1.218819, -1.498762, 0, 0, 0, 1, 1,
-0.4775828, -0.07962085, -1.350857, 0, 0, 0, 1, 1,
-0.4709015, 0.3962485, -0.3387477, 0, 0, 0, 1, 1,
-0.4703656, 2.07662, -1.635491, 0, 0, 0, 1, 1,
-0.4654094, -0.8839606, -3.370743, 0, 0, 0, 1, 1,
-0.46491, -0.645732, -1.921417, 1, 1, 1, 1, 1,
-0.4627261, -0.4338159, -1.591116, 1, 1, 1, 1, 1,
-0.460303, -0.08216378, -2.504995, 1, 1, 1, 1, 1,
-0.4601991, 0.4487552, -1.758022, 1, 1, 1, 1, 1,
-0.4588956, 0.3293741, -0.8155919, 1, 1, 1, 1, 1,
-0.4578293, 1.094275, -0.59666, 1, 1, 1, 1, 1,
-0.4538833, 0.2579513, -1.785491, 1, 1, 1, 1, 1,
-0.447311, -0.5941889, -1.223091, 1, 1, 1, 1, 1,
-0.4467595, 0.889765, 0.6737672, 1, 1, 1, 1, 1,
-0.4455087, 0.8307102, 0.4002177, 1, 1, 1, 1, 1,
-0.4425657, -0.5241175, -2.000005, 1, 1, 1, 1, 1,
-0.4421494, -0.2080442, -1.698808, 1, 1, 1, 1, 1,
-0.4413378, 0.9274957, 0.2907917, 1, 1, 1, 1, 1,
-0.4351202, 0.6720896, -0.7205657, 1, 1, 1, 1, 1,
-0.4315478, 1.459161, -0.07085054, 1, 1, 1, 1, 1,
-0.4312164, 0.08185796, -0.8076911, 0, 0, 1, 1, 1,
-0.4310831, -0.3767518, 0.1824999, 1, 0, 0, 1, 1,
-0.4297062, 1.163123, 1.589531, 1, 0, 0, 1, 1,
-0.4294209, 0.04496108, -0.6429667, 1, 0, 0, 1, 1,
-0.4293045, 0.3991109, -0.2351592, 1, 0, 0, 1, 1,
-0.4222912, 0.6307901, -0.1662608, 1, 0, 0, 1, 1,
-0.4163072, 0.9153752, -1.419983, 0, 0, 0, 1, 1,
-0.4145402, -0.4009949, -3.503078, 0, 0, 0, 1, 1,
-0.4121652, -0.03635678, 0.4215808, 0, 0, 0, 1, 1,
-0.4115857, 1.096405, -1.24652, 0, 0, 0, 1, 1,
-0.4114224, 0.1464483, -2.136105, 0, 0, 0, 1, 1,
-0.40905, -0.2955194, -1.540932, 0, 0, 0, 1, 1,
-0.4050827, 0.1393964, -2.430971, 0, 0, 0, 1, 1,
-0.4036826, -0.0372554, -2.450143, 1, 1, 1, 1, 1,
-0.4036062, 0.5229543, -1.098944, 1, 1, 1, 1, 1,
-0.4033246, 0.02125541, -1.74778, 1, 1, 1, 1, 1,
-0.4028167, 0.3783655, -0.6940023, 1, 1, 1, 1, 1,
-0.4024152, -1.623061, -1.302193, 1, 1, 1, 1, 1,
-0.4000529, 0.9610237, -0.9477462, 1, 1, 1, 1, 1,
-0.3973628, -1.694014, -1.800688, 1, 1, 1, 1, 1,
-0.3966103, 0.589599, -1.736185, 1, 1, 1, 1, 1,
-0.3958125, -1.10802, -1.879066, 1, 1, 1, 1, 1,
-0.3938758, -0.6195104, -3.869585, 1, 1, 1, 1, 1,
-0.3933095, -0.8477575, -3.068419, 1, 1, 1, 1, 1,
-0.3907687, 1.172942, 0.5524291, 1, 1, 1, 1, 1,
-0.3880041, 0.8397871, -0.5956942, 1, 1, 1, 1, 1,
-0.3812928, -0.6100949, -2.213777, 1, 1, 1, 1, 1,
-0.3801822, -0.7583664, -2.184931, 1, 1, 1, 1, 1,
-0.3796859, 0.3122141, -0.8647786, 0, 0, 1, 1, 1,
-0.3786134, 0.7683086, -0.5821797, 1, 0, 0, 1, 1,
-0.3782418, -0.8717746, -2.284331, 1, 0, 0, 1, 1,
-0.3771076, -1.801302, -3.823061, 1, 0, 0, 1, 1,
-0.372534, 0.3777901, -1.505297, 1, 0, 0, 1, 1,
-0.3697766, 0.1305535, -0.6685231, 1, 0, 0, 1, 1,
-0.3697656, -1.128903, -2.4983, 0, 0, 0, 1, 1,
-0.3626643, -0.7142857, -2.846714, 0, 0, 0, 1, 1,
-0.3606036, 2.739069, 0.4553206, 0, 0, 0, 1, 1,
-0.3595124, 0.1006409, 0.5388183, 0, 0, 0, 1, 1,
-0.3581121, 0.3975705, -0.2596993, 0, 0, 0, 1, 1,
-0.3580086, 1.340651, -1.212505, 0, 0, 0, 1, 1,
-0.3563247, 1.986583, -1.673474, 0, 0, 0, 1, 1,
-0.3558973, -1.02392, -0.150381, 1, 1, 1, 1, 1,
-0.3479064, 1.646914, 0.3764779, 1, 1, 1, 1, 1,
-0.3467582, 0.2087382, -2.18191, 1, 1, 1, 1, 1,
-0.3437782, 1.644345, -0.5237839, 1, 1, 1, 1, 1,
-0.3436005, -0.8329508, -2.747857, 1, 1, 1, 1, 1,
-0.3420047, -1.435529, -1.357165, 1, 1, 1, 1, 1,
-0.3395042, 0.1768284, 0.5566387, 1, 1, 1, 1, 1,
-0.3350309, 0.659156, -0.08948755, 1, 1, 1, 1, 1,
-0.3336245, 0.436694, 0.4708488, 1, 1, 1, 1, 1,
-0.3290817, -0.6387972, -0.8802883, 1, 1, 1, 1, 1,
-0.3288303, -1.777907, -1.828013, 1, 1, 1, 1, 1,
-0.3233092, -0.204463, -2.407309, 1, 1, 1, 1, 1,
-0.3189538, 0.4793503, -0.6147689, 1, 1, 1, 1, 1,
-0.3187947, 0.8942819, -0.194693, 1, 1, 1, 1, 1,
-0.3177198, 0.3930421, 1.529908, 1, 1, 1, 1, 1,
-0.3146383, 0.4091829, -0.814845, 0, 0, 1, 1, 1,
-0.314284, -0.4237143, -3.458819, 1, 0, 0, 1, 1,
-0.312576, -0.7578541, -1.420046, 1, 0, 0, 1, 1,
-0.3118571, 0.05383426, -3.463613, 1, 0, 0, 1, 1,
-0.3099241, -0.8158489, -3.33322, 1, 0, 0, 1, 1,
-0.3035326, -0.9284655, -3.147598, 1, 0, 0, 1, 1,
-0.2977374, -0.4236038, -2.652461, 0, 0, 0, 1, 1,
-0.2976402, -0.42373, -2.493954, 0, 0, 0, 1, 1,
-0.2974423, 0.1567139, 0.3595459, 0, 0, 0, 1, 1,
-0.2944244, -0.7525126, -2.633809, 0, 0, 0, 1, 1,
-0.292932, -0.1034925, -2.730775, 0, 0, 0, 1, 1,
-0.287368, 1.729704, -0.1067597, 0, 0, 0, 1, 1,
-0.2847261, -0.5416149, -0.7358652, 0, 0, 0, 1, 1,
-0.2825001, 0.7286277, -0.7215605, 1, 1, 1, 1, 1,
-0.2814765, -0.8115295, -3.862937, 1, 1, 1, 1, 1,
-0.2807737, -0.280667, -3.409529, 1, 1, 1, 1, 1,
-0.2781562, -0.360332, -2.41716, 1, 1, 1, 1, 1,
-0.2762421, -1.774042, -1.843941, 1, 1, 1, 1, 1,
-0.2682879, -0.002147607, -2.671517, 1, 1, 1, 1, 1,
-0.265879, 0.938998, -1.502646, 1, 1, 1, 1, 1,
-0.2630399, 0.1363719, -1.83373, 1, 1, 1, 1, 1,
-0.2610606, -1.059906, -3.610651, 1, 1, 1, 1, 1,
-0.2573378, 0.5169519, -1.735276, 1, 1, 1, 1, 1,
-0.2568123, -0.5001081, -4.395617, 1, 1, 1, 1, 1,
-0.2542981, 1.171985, -0.758759, 1, 1, 1, 1, 1,
-0.2521454, 0.7415059, 0.4747342, 1, 1, 1, 1, 1,
-0.2511878, -0.6348763, -3.646445, 1, 1, 1, 1, 1,
-0.2502845, -0.7502214, -3.462445, 1, 1, 1, 1, 1,
-0.2499038, 1.422369, -0.2817686, 0, 0, 1, 1, 1,
-0.2466489, -0.6635768, -0.7558964, 1, 0, 0, 1, 1,
-0.2466084, 0.5773768, -0.02235733, 1, 0, 0, 1, 1,
-0.246153, -1.421679, -3.402083, 1, 0, 0, 1, 1,
-0.2367766, 0.986988, -1.364759, 1, 0, 0, 1, 1,
-0.2360713, -1.763543, -3.992763, 1, 0, 0, 1, 1,
-0.232303, -0.4016748, -2.874072, 0, 0, 0, 1, 1,
-0.2316674, -1.080555, -2.290691, 0, 0, 0, 1, 1,
-0.2305297, 0.6352272, 0.02566141, 0, 0, 0, 1, 1,
-0.2254906, 0.4640228, 0.9615629, 0, 0, 0, 1, 1,
-0.2231485, -0.6721533, -2.166744, 0, 0, 0, 1, 1,
-0.2140617, -0.9336135, -2.047741, 0, 0, 0, 1, 1,
-0.2125253, -1.264484, -3.466058, 0, 0, 0, 1, 1,
-0.2111562, -0.2638266, -3.103615, 1, 1, 1, 1, 1,
-0.2075698, 0.648966, 0.3476886, 1, 1, 1, 1, 1,
-0.2018725, -1.296683, -1.693514, 1, 1, 1, 1, 1,
-0.1982307, 0.3291811, 0.8055362, 1, 1, 1, 1, 1,
-0.195561, -0.6726921, 0.06844705, 1, 1, 1, 1, 1,
-0.1944968, 0.2073944, -1.153028, 1, 1, 1, 1, 1,
-0.1933112, -0.6966588, -2.921273, 1, 1, 1, 1, 1,
-0.1914353, -0.7753301, -2.373749, 1, 1, 1, 1, 1,
-0.1880772, -0.5621302, -2.917395, 1, 1, 1, 1, 1,
-0.1865509, -0.9154011, -2.284129, 1, 1, 1, 1, 1,
-0.1856703, 0.8351145, -0.2498716, 1, 1, 1, 1, 1,
-0.185492, 0.002470441, -1.954353, 1, 1, 1, 1, 1,
-0.1828417, 0.002880085, -0.6044558, 1, 1, 1, 1, 1,
-0.1810659, 1.441319, 1.051727, 1, 1, 1, 1, 1,
-0.174637, -0.8683696, -3.112604, 1, 1, 1, 1, 1,
-0.1692377, -0.7256812, -2.848218, 0, 0, 1, 1, 1,
-0.1653582, 1.623332, 0.9655537, 1, 0, 0, 1, 1,
-0.1625815, -1.658125, -2.082387, 1, 0, 0, 1, 1,
-0.151349, 0.407524, -0.8392141, 1, 0, 0, 1, 1,
-0.1459026, 0.4353116, 0.3271717, 1, 0, 0, 1, 1,
-0.1435328, -1.351322, -3.918831, 1, 0, 0, 1, 1,
-0.1427211, 0.2940211, 0.4303439, 0, 0, 0, 1, 1,
-0.1376092, -0.02570619, -1.906741, 0, 0, 0, 1, 1,
-0.1363606, -0.5865375, -0.9945578, 0, 0, 0, 1, 1,
-0.1353472, 0.7042466, 0.8410376, 0, 0, 0, 1, 1,
-0.1340865, -0.342388, -3.42643, 0, 0, 0, 1, 1,
-0.1338467, 1.916964, -0.5532188, 0, 0, 0, 1, 1,
-0.1334421, 0.9984658, -0.9193779, 0, 0, 0, 1, 1,
-0.1309424, -2.12165, -2.948075, 1, 1, 1, 1, 1,
-0.129518, 0.3139748, -0.1879241, 1, 1, 1, 1, 1,
-0.1291086, 1.884177, -0.3985793, 1, 1, 1, 1, 1,
-0.1289844, 1.1825, -1.367257, 1, 1, 1, 1, 1,
-0.1258267, -0.09336594, -1.982891, 1, 1, 1, 1, 1,
-0.1208663, -1.762196, -2.874212, 1, 1, 1, 1, 1,
-0.1107777, 1.391067, 0.5482783, 1, 1, 1, 1, 1,
-0.1078868, -0.6669332, -3.661048, 1, 1, 1, 1, 1,
-0.10538, -1.030673, -4.215339, 1, 1, 1, 1, 1,
-0.1030248, -0.1397336, -2.395034, 1, 1, 1, 1, 1,
-0.1022238, 0.09085356, -2.615591, 1, 1, 1, 1, 1,
-0.1009197, -0.5690799, -3.170573, 1, 1, 1, 1, 1,
-0.1000165, -0.4015253, -4.057237, 1, 1, 1, 1, 1,
-0.09659689, 0.1699421, -0.4873351, 1, 1, 1, 1, 1,
-0.0902328, 1.886571, 0.4546245, 1, 1, 1, 1, 1,
-0.08969883, 0.6806908, 0.08788124, 0, 0, 1, 1, 1,
-0.08891575, -0.1221822, -2.645378, 1, 0, 0, 1, 1,
-0.08731253, -0.4408254, -1.009774, 1, 0, 0, 1, 1,
-0.08617174, -0.4327871, -2.513037, 1, 0, 0, 1, 1,
-0.07924855, -0.1339664, -1.879203, 1, 0, 0, 1, 1,
-0.07617048, 0.5275651, -0.8597165, 1, 0, 0, 1, 1,
-0.07560774, -0.9657152, -3.547392, 0, 0, 0, 1, 1,
-0.07527886, 0.02459954, -1.869513, 0, 0, 0, 1, 1,
-0.06796066, 0.9399249, -1.466483, 0, 0, 0, 1, 1,
-0.06639645, -0.3223701, -4.053311, 0, 0, 0, 1, 1,
-0.06553014, -1.41551, -3.780415, 0, 0, 0, 1, 1,
-0.06463236, 0.07833503, -1.108885, 0, 0, 0, 1, 1,
-0.06271636, -0.1390797, -2.357911, 0, 0, 0, 1, 1,
-0.06246056, 0.1775712, -0.5451347, 1, 1, 1, 1, 1,
-0.06102986, 0.08506904, -1.884575, 1, 1, 1, 1, 1,
-0.05883393, -0.2290979, -2.703832, 1, 1, 1, 1, 1,
-0.05857867, 1.299683, 1.423616, 1, 1, 1, 1, 1,
-0.05766228, -1.359181, -1.372263, 1, 1, 1, 1, 1,
-0.05526827, 1.227598, -1.088927, 1, 1, 1, 1, 1,
-0.05476684, 1.811339, 1.15657, 1, 1, 1, 1, 1,
-0.0547508, 0.7230064, 0.5466067, 1, 1, 1, 1, 1,
-0.05285435, 0.2569044, 1.042984, 1, 1, 1, 1, 1,
-0.04823482, -0.7295539, -3.141966, 1, 1, 1, 1, 1,
-0.04690481, -0.9024475, -1.737543, 1, 1, 1, 1, 1,
-0.04214616, 0.6219272, -1.014012, 1, 1, 1, 1, 1,
-0.04175229, -1.110313, -3.472687, 1, 1, 1, 1, 1,
-0.04149431, 0.4392971, -0.1568273, 1, 1, 1, 1, 1,
-0.03856784, 0.1458186, -1.859273, 1, 1, 1, 1, 1,
-0.03807941, -0.1702953, -1.214341, 0, 0, 1, 1, 1,
-0.0346976, 1.427641, -0.3445874, 1, 0, 0, 1, 1,
-0.0258953, 0.2211894, -1.597602, 1, 0, 0, 1, 1,
-0.02493095, 0.6980403, 0.9723456, 1, 0, 0, 1, 1,
-0.01963852, -0.7068537, -3.639598, 1, 0, 0, 1, 1,
-0.01836723, -2.138544, -3.350648, 1, 0, 0, 1, 1,
-0.01823555, -0.910606, -2.889024, 0, 0, 0, 1, 1,
-0.01644387, 0.3044092, -0.4501919, 0, 0, 0, 1, 1,
-0.01568177, 0.6890782, 0.5062464, 0, 0, 0, 1, 1,
-0.01413216, 1.654295, 0.2152426, 0, 0, 0, 1, 1,
-0.004774224, 1.060635, 0.7552719, 0, 0, 0, 1, 1,
-0.004421435, 1.122344, -1.641247, 0, 0, 0, 1, 1,
-0.002232254, 0.5868145, -1.044863, 0, 0, 0, 1, 1,
-0.0008732963, -0.9553986, -0.09194114, 1, 1, 1, 1, 1,
-0.0002381579, 0.64492, -0.06826895, 1, 1, 1, 1, 1,
-0.0001002034, -0.04656048, -4.713609, 1, 1, 1, 1, 1,
0.002803122, 0.5674973, -0.06628335, 1, 1, 1, 1, 1,
0.007150525, 0.8017752, 1.692789, 1, 1, 1, 1, 1,
0.009062894, 0.1628695, 0.5115362, 1, 1, 1, 1, 1,
0.01057715, 1.117367, 0.1608995, 1, 1, 1, 1, 1,
0.01195241, 0.8761445, 0.4562524, 1, 1, 1, 1, 1,
0.01229342, -0.3647324, 2.690243, 1, 1, 1, 1, 1,
0.01246811, 0.7671031, 1.651605, 1, 1, 1, 1, 1,
0.01262178, 0.4687824, 0.05328042, 1, 1, 1, 1, 1,
0.01294962, -0.3471761, 2.808247, 1, 1, 1, 1, 1,
0.01692238, 0.08092525, 0.1012984, 1, 1, 1, 1, 1,
0.02451416, -0.5394977, 4.007052, 1, 1, 1, 1, 1,
0.02528234, 0.7159845, 0.7948061, 1, 1, 1, 1, 1,
0.03101884, 0.3838753, 0.6065037, 0, 0, 1, 1, 1,
0.03109934, 0.5444905, 2.577396, 1, 0, 0, 1, 1,
0.03178208, 1.575748, 0.4684127, 1, 0, 0, 1, 1,
0.03592907, -0.1682279, 3.872968, 1, 0, 0, 1, 1,
0.03795645, -1.93355, 2.867806, 1, 0, 0, 1, 1,
0.04129094, -0.2733475, 3.892508, 1, 0, 0, 1, 1,
0.04130686, -0.3037213, 3.045938, 0, 0, 0, 1, 1,
0.04155906, -0.1040889, 2.450742, 0, 0, 0, 1, 1,
0.04179957, -1.354168, 4.573858, 0, 0, 0, 1, 1,
0.04230481, 0.5209842, 0.5359938, 0, 0, 0, 1, 1,
0.0454268, 0.5009321, 0.1894041, 0, 0, 0, 1, 1,
0.04589154, 0.2286877, -0.7124147, 0, 0, 0, 1, 1,
0.04753419, -2.142144, 1.777798, 0, 0, 0, 1, 1,
0.04841018, 2.241708, 0.7450563, 1, 1, 1, 1, 1,
0.05350849, -2.030937, 2.046328, 1, 1, 1, 1, 1,
0.05478209, -0.981729, 1.708445, 1, 1, 1, 1, 1,
0.05751126, -1.050048, 2.619625, 1, 1, 1, 1, 1,
0.05943545, -0.2849431, 4.800283, 1, 1, 1, 1, 1,
0.06421641, -0.7511644, 4.237899, 1, 1, 1, 1, 1,
0.06621099, 0.6273363, -0.06338889, 1, 1, 1, 1, 1,
0.06632792, 1.757108, 0.08375511, 1, 1, 1, 1, 1,
0.07253654, 1.561121, -0.1809212, 1, 1, 1, 1, 1,
0.08374622, -2.35096, 3.995306, 1, 1, 1, 1, 1,
0.08531471, 1.397912, -2.106469, 1, 1, 1, 1, 1,
0.08744913, 0.6772915, 0.1250038, 1, 1, 1, 1, 1,
0.08917189, -2.655385, 3.399785, 1, 1, 1, 1, 1,
0.09088165, 0.350042, 0.8780083, 1, 1, 1, 1, 1,
0.09108859, -0.8751245, 1.597035, 1, 1, 1, 1, 1,
0.09143099, -0.1400102, 2.960696, 0, 0, 1, 1, 1,
0.093438, -0.5357872, 2.141997, 1, 0, 0, 1, 1,
0.0980873, -1.115307, 2.622509, 1, 0, 0, 1, 1,
0.09876245, -0.3635959, 3.301396, 1, 0, 0, 1, 1,
0.09986071, 0.1976465, 0.205506, 1, 0, 0, 1, 1,
0.1056475, 0.5554549, -1.009383, 1, 0, 0, 1, 1,
0.1113218, -0.3821077, 3.814117, 0, 0, 0, 1, 1,
0.112427, -0.9417319, 3.836077, 0, 0, 0, 1, 1,
0.1147655, 0.3390166, 1.14542, 0, 0, 0, 1, 1,
0.1151594, 0.5567079, 0.9864041, 0, 0, 0, 1, 1,
0.1169851, -0.7322629, 3.56774, 0, 0, 0, 1, 1,
0.1180867, -0.2489944, 2.698457, 0, 0, 0, 1, 1,
0.1278111, 0.2266751, 2.195148, 0, 0, 0, 1, 1,
0.131371, -1.1581, 1.928247, 1, 1, 1, 1, 1,
0.1347764, -0.5513162, 2.920149, 1, 1, 1, 1, 1,
0.1365744, 2.125591, -1.541823, 1, 1, 1, 1, 1,
0.1423281, 1.172708, 2.293943, 1, 1, 1, 1, 1,
0.1442216, 0.2706854, -0.2557777, 1, 1, 1, 1, 1,
0.1451776, 0.0370381, 0.8762575, 1, 1, 1, 1, 1,
0.149207, -1.205361, 3.023719, 1, 1, 1, 1, 1,
0.1508414, -1.023555, 3.253588, 1, 1, 1, 1, 1,
0.1537306, 2.143929, 1.209859, 1, 1, 1, 1, 1,
0.1557553, 0.7889127, -0.1963206, 1, 1, 1, 1, 1,
0.1563471, -0.6669633, 3.055115, 1, 1, 1, 1, 1,
0.1565908, 0.1409335, 1.263641, 1, 1, 1, 1, 1,
0.1592058, 1.245535, -1.202864, 1, 1, 1, 1, 1,
0.1617881, 1.010941, 0.6783531, 1, 1, 1, 1, 1,
0.1645856, -0.9435248, 3.77062, 1, 1, 1, 1, 1,
0.1665471, -1.152528, 3.929228, 0, 0, 1, 1, 1,
0.1678646, 0.8143184, 0.6286824, 1, 0, 0, 1, 1,
0.1680149, 0.8154542, 0.329275, 1, 0, 0, 1, 1,
0.1715768, -0.8928975, 4.695502, 1, 0, 0, 1, 1,
0.1716878, -0.5237722, 1.641284, 1, 0, 0, 1, 1,
0.1731613, -1.510141, 4.832697, 1, 0, 0, 1, 1,
0.1768911, -0.9109862, 3.849995, 0, 0, 0, 1, 1,
0.1772408, 0.6168368, -0.3984369, 0, 0, 0, 1, 1,
0.1805814, -0.08195586, 3.850314, 0, 0, 0, 1, 1,
0.1807137, -0.1191328, 2.147811, 0, 0, 0, 1, 1,
0.1824448, 0.5823141, 1.347291, 0, 0, 0, 1, 1,
0.1834777, 1.696685, 0.09874868, 0, 0, 0, 1, 1,
0.1885939, -0.3198062, 1.840963, 0, 0, 0, 1, 1,
0.194687, 0.4543679, -0.01063618, 1, 1, 1, 1, 1,
0.1975031, 0.9348152, -0.1528758, 1, 1, 1, 1, 1,
0.2057337, -1.742524, 3.964817, 1, 1, 1, 1, 1,
0.2064078, 0.200582, -0.5372354, 1, 1, 1, 1, 1,
0.2117221, -0.6343177, 4.121458, 1, 1, 1, 1, 1,
0.2124918, 0.5664077, -0.4123103, 1, 1, 1, 1, 1,
0.2130518, 1.851652, -0.4353724, 1, 1, 1, 1, 1,
0.2135544, 0.2097695, -0.1411012, 1, 1, 1, 1, 1,
0.2198528, 0.6044713, 0.7754391, 1, 1, 1, 1, 1,
0.2239771, -1.285032, 2.767602, 1, 1, 1, 1, 1,
0.2311747, 0.6907753, -1.159226, 1, 1, 1, 1, 1,
0.2334191, -1.825963, 5.16653, 1, 1, 1, 1, 1,
0.2353621, 0.0212104, 1.861701, 1, 1, 1, 1, 1,
0.2369536, 0.02842617, 1.120593, 1, 1, 1, 1, 1,
0.2454693, 0.5692748, 2.126992, 1, 1, 1, 1, 1,
0.2481143, -0.07782082, 2.006731, 0, 0, 1, 1, 1,
0.2495013, 0.1424642, -0.04312004, 1, 0, 0, 1, 1,
0.2496992, 2.44132, -0.9208282, 1, 0, 0, 1, 1,
0.2504161, -0.3003084, 2.124114, 1, 0, 0, 1, 1,
0.2525472, 0.4719199, -0.013153, 1, 0, 0, 1, 1,
0.2526416, 0.1864639, 0.9945151, 1, 0, 0, 1, 1,
0.2530845, -2.248755, 1.771421, 0, 0, 0, 1, 1,
0.2620023, -1.66257, 3.390398, 0, 0, 0, 1, 1,
0.2626214, 0.01809289, 2.292619, 0, 0, 0, 1, 1,
0.2672273, -1.299274, 4.683255, 0, 0, 0, 1, 1,
0.2684667, 0.6919999, -1.700056, 0, 0, 0, 1, 1,
0.2741587, -1.512082, 0.6516412, 0, 0, 0, 1, 1,
0.2753692, -1.663166, 3.409295, 0, 0, 0, 1, 1,
0.2788404, 1.170304, -0.0646606, 1, 1, 1, 1, 1,
0.2818927, 0.9790076, 1.772617, 1, 1, 1, 1, 1,
0.2827539, -0.864868, 1.355607, 1, 1, 1, 1, 1,
0.2892341, 0.6670161, 1.303021, 1, 1, 1, 1, 1,
0.2951136, 1.157646, 0.9570541, 1, 1, 1, 1, 1,
0.2967746, 0.02254794, 3.430829, 1, 1, 1, 1, 1,
0.296784, 0.6348123, 2.355852, 1, 1, 1, 1, 1,
0.3034682, 0.2221456, 0.1446874, 1, 1, 1, 1, 1,
0.3110006, -1.497627, 3.71223, 1, 1, 1, 1, 1,
0.3123297, 0.875878, 0.2265938, 1, 1, 1, 1, 1,
0.3125456, -0.1581945, 0.4478225, 1, 1, 1, 1, 1,
0.3131098, 0.5890448, 1.497787, 1, 1, 1, 1, 1,
0.315036, 1.117253, -0.9446469, 1, 1, 1, 1, 1,
0.319108, -1.895092, 2.434824, 1, 1, 1, 1, 1,
0.3229291, 0.06054528, 1.269939, 1, 1, 1, 1, 1,
0.3240401, 0.305933, 0.43294, 0, 0, 1, 1, 1,
0.3267656, -0.9823686, 4.305429, 1, 0, 0, 1, 1,
0.3277379, 1.166909, 0.3028025, 1, 0, 0, 1, 1,
0.3306163, 0.4573225, 2.338244, 1, 0, 0, 1, 1,
0.3314416, 0.497471, -0.9170329, 1, 0, 0, 1, 1,
0.331729, -0.565411, 2.684715, 1, 0, 0, 1, 1,
0.3370775, -0.9991395, 2.443323, 0, 0, 0, 1, 1,
0.3417574, -0.8653052, 1.13747, 0, 0, 0, 1, 1,
0.3446535, -0.2549505, 2.441143, 0, 0, 0, 1, 1,
0.3460602, 0.01849409, 2.065075, 0, 0, 0, 1, 1,
0.3490324, 4.216112, 1.15916, 0, 0, 0, 1, 1,
0.354023, -0.2683728, 1.364024, 0, 0, 0, 1, 1,
0.3541806, 1.050466, 1.567, 0, 0, 0, 1, 1,
0.3560404, -1.787552, 3.72245, 1, 1, 1, 1, 1,
0.3618515, 0.1270924, 0.9926664, 1, 1, 1, 1, 1,
0.3622563, -0.9370471, 3.612553, 1, 1, 1, 1, 1,
0.3754853, 0.7832646, 0.1221833, 1, 1, 1, 1, 1,
0.3782591, 0.7610962, 1.621217, 1, 1, 1, 1, 1,
0.3796354, -0.3506091, 0.3377563, 1, 1, 1, 1, 1,
0.3801457, -0.5050194, 2.945921, 1, 1, 1, 1, 1,
0.3834323, -0.3462371, 3.624521, 1, 1, 1, 1, 1,
0.3944149, -0.8178357, 3.279507, 1, 1, 1, 1, 1,
0.3945047, -2.029639, 4.831579, 1, 1, 1, 1, 1,
0.3964057, -1.675108, 1.867871, 1, 1, 1, 1, 1,
0.3972444, -1.734274, 3.08823, 1, 1, 1, 1, 1,
0.3972773, 1.218476, -1.398567, 1, 1, 1, 1, 1,
0.4022442, -1.6574, 1.806152, 1, 1, 1, 1, 1,
0.4026022, -0.2154423, 1.230234, 1, 1, 1, 1, 1,
0.4027364, -1.707658, 1.815707, 0, 0, 1, 1, 1,
0.4068851, 0.4336968, 0.07898477, 1, 0, 0, 1, 1,
0.4093324, -0.5210065, 1.18775, 1, 0, 0, 1, 1,
0.4102425, 0.2061696, 0.7380036, 1, 0, 0, 1, 1,
0.4108323, -0.0364703, 3.287374, 1, 0, 0, 1, 1,
0.4130547, 2.155374, -0.6557631, 1, 0, 0, 1, 1,
0.4202183, 0.03465445, 0.4068618, 0, 0, 0, 1, 1,
0.4206998, 1.208356, 1.027485, 0, 0, 0, 1, 1,
0.4242242, -1.320754, 0.1465587, 0, 0, 0, 1, 1,
0.4291927, -1.147926, 2.538746, 0, 0, 0, 1, 1,
0.4386522, 0.7768741, 0.393082, 0, 0, 0, 1, 1,
0.4389572, 3.389395, 0.2971676, 0, 0, 0, 1, 1,
0.4473821, 1.234746, -1.198559, 0, 0, 0, 1, 1,
0.4481696, -1.389808, 2.321444, 1, 1, 1, 1, 1,
0.4496254, 1.52401, -0.6239368, 1, 1, 1, 1, 1,
0.4539866, -0.1775153, 2.979985, 1, 1, 1, 1, 1,
0.4542399, 1.388081, 1.158707, 1, 1, 1, 1, 1,
0.4572721, -0.7788494, 1.496699, 1, 1, 1, 1, 1,
0.4589406, -0.8475546, 2.052717, 1, 1, 1, 1, 1,
0.4656675, -0.3988279, 1.643812, 1, 1, 1, 1, 1,
0.4707552, 1.724957, -0.7370826, 1, 1, 1, 1, 1,
0.4715598, 1.63349, 1.028732, 1, 1, 1, 1, 1,
0.4724685, -0.07873004, 1.682041, 1, 1, 1, 1, 1,
0.4724953, 0.03050342, 0.8876099, 1, 1, 1, 1, 1,
0.476513, 0.322232, -0.2666572, 1, 1, 1, 1, 1,
0.4767516, 2.26768, -0.3052391, 1, 1, 1, 1, 1,
0.4812281, 0.5759642, 0.5553944, 1, 1, 1, 1, 1,
0.4833897, 0.4245132, 1.676304, 1, 1, 1, 1, 1,
0.4845709, -0.4767075, 3.091922, 0, 0, 1, 1, 1,
0.4863381, 0.5856916, 0.6068332, 1, 0, 0, 1, 1,
0.4871513, 0.8158582, 1.314226, 1, 0, 0, 1, 1,
0.4892217, -0.9099318, 1.965584, 1, 0, 0, 1, 1,
0.4898365, 0.990518, 1.107282, 1, 0, 0, 1, 1,
0.4923206, 0.0823298, 2.086043, 1, 0, 0, 1, 1,
0.4925091, 0.09070259, 1.140233, 0, 0, 0, 1, 1,
0.4942764, -0.1984987, 2.016787, 0, 0, 0, 1, 1,
0.4993423, 1.790659, 0.9769591, 0, 0, 0, 1, 1,
0.502966, 2.150483, 1.031024, 0, 0, 0, 1, 1,
0.5038901, -0.006872682, 1.733023, 0, 0, 0, 1, 1,
0.5049872, -2.763715, 4.586944, 0, 0, 0, 1, 1,
0.5050756, 0.9783079, -1.585425, 0, 0, 0, 1, 1,
0.5092355, -0.5909811, 1.771176, 1, 1, 1, 1, 1,
0.5118461, -1.276044, 2.517616, 1, 1, 1, 1, 1,
0.5259793, 0.3544661, 0.5720539, 1, 1, 1, 1, 1,
0.5264545, -0.4197569, 4.399028, 1, 1, 1, 1, 1,
0.5267394, 0.1567716, -0.4265288, 1, 1, 1, 1, 1,
0.5296717, -1.868533, 4.117414, 1, 1, 1, 1, 1,
0.5316975, -0.7980185, 2.211308, 1, 1, 1, 1, 1,
0.533268, 1.352412, 0.7181515, 1, 1, 1, 1, 1,
0.5367651, 2.141846, 2.722779, 1, 1, 1, 1, 1,
0.5382339, 0.5766176, -0.8955806, 1, 1, 1, 1, 1,
0.5399705, -1.032863, 2.47505, 1, 1, 1, 1, 1,
0.5401031, 0.3007278, -0.02509517, 1, 1, 1, 1, 1,
0.5468027, 0.08602041, 0.1724434, 1, 1, 1, 1, 1,
0.5538698, -0.4219505, 1.840806, 1, 1, 1, 1, 1,
0.5846519, 0.2139011, -0.7067654, 1, 1, 1, 1, 1,
0.5861246, -0.7566063, 2.455702, 0, 0, 1, 1, 1,
0.5889406, 0.1424831, 0.4101458, 1, 0, 0, 1, 1,
0.589019, 1.578015, 0.01919431, 1, 0, 0, 1, 1,
0.5896536, 0.1791155, 1.417229, 1, 0, 0, 1, 1,
0.5946916, 1.530697, 1.285966, 1, 0, 0, 1, 1,
0.5999129, -0.01176994, 1.648848, 1, 0, 0, 1, 1,
0.6002968, 0.446273, 1.425485, 0, 0, 0, 1, 1,
0.6041126, -1.865894, 3.07919, 0, 0, 0, 1, 1,
0.6049749, 1.346423, 1.053842, 0, 0, 0, 1, 1,
0.6090434, -0.6544831, 3.814542, 0, 0, 0, 1, 1,
0.6093847, 0.005497974, 1.547915, 0, 0, 0, 1, 1,
0.6110328, 0.09039445, 0.3505517, 0, 0, 0, 1, 1,
0.6157086, -1.216723, 1.961858, 0, 0, 0, 1, 1,
0.6195914, -0.3814272, 2.673991, 1, 1, 1, 1, 1,
0.6277058, -0.5971014, 2.03246, 1, 1, 1, 1, 1,
0.6307152, 0.6009814, 0.5448859, 1, 1, 1, 1, 1,
0.6639439, -0.7610776, 3.998565, 1, 1, 1, 1, 1,
0.6662213, 1.137652, -0.3368464, 1, 1, 1, 1, 1,
0.6727098, 1.40549, 0.3939695, 1, 1, 1, 1, 1,
0.6749987, -0.2810668, 1.391352, 1, 1, 1, 1, 1,
0.6750661, -0.3427354, 2.258951, 1, 1, 1, 1, 1,
0.6761665, -0.1154349, 3.177701, 1, 1, 1, 1, 1,
0.6772919, -2.148532, 3.622089, 1, 1, 1, 1, 1,
0.6783197, -0.6477835, 1.725396, 1, 1, 1, 1, 1,
0.6799536, -1.156193, 4.106134, 1, 1, 1, 1, 1,
0.6804785, -0.01685542, 2.174776, 1, 1, 1, 1, 1,
0.6848409, -1.284156, 3.154978, 1, 1, 1, 1, 1,
0.687847, 0.1250089, 1.432067, 1, 1, 1, 1, 1,
0.6919392, -2.199765, 2.528923, 0, 0, 1, 1, 1,
0.6934021, 0.01650708, 2.779908, 1, 0, 0, 1, 1,
0.6934865, 0.9643599, 0.9977073, 1, 0, 0, 1, 1,
0.694414, 0.226765, 2.521788, 1, 0, 0, 1, 1,
0.6959981, -1.415469, 2.960065, 1, 0, 0, 1, 1,
0.6997787, 1.442899, 0.5263671, 1, 0, 0, 1, 1,
0.7044783, -1.333367, 2.846802, 0, 0, 0, 1, 1,
0.7056035, 0.2726423, 1.420914, 0, 0, 0, 1, 1,
0.7089871, 1.171303, 0.5662401, 0, 0, 0, 1, 1,
0.7097251, 0.5835607, 0.3252652, 0, 0, 0, 1, 1,
0.7098126, -1.10294, 2.750104, 0, 0, 0, 1, 1,
0.7122627, 0.6182014, 0.7855747, 0, 0, 0, 1, 1,
0.7124575, -0.3843616, 2.242532, 0, 0, 0, 1, 1,
0.7151039, -1.713627, 1.837417, 1, 1, 1, 1, 1,
0.7161062, -0.8619971, 0.2443926, 1, 1, 1, 1, 1,
0.7161709, 0.4178519, 2.036147, 1, 1, 1, 1, 1,
0.7168429, 0.404366, 0.5157236, 1, 1, 1, 1, 1,
0.7176866, -0.05834145, 1.775114, 1, 1, 1, 1, 1,
0.720847, -0.5278309, 1.698756, 1, 1, 1, 1, 1,
0.7212176, -1.056164, 0.7816038, 1, 1, 1, 1, 1,
0.7233274, 0.8579358, -0.854035, 1, 1, 1, 1, 1,
0.7268911, 2.126899, -0.8335243, 1, 1, 1, 1, 1,
0.7283841, -1.409412, 2.198904, 1, 1, 1, 1, 1,
0.7378634, 0.1966265, 1.081423, 1, 1, 1, 1, 1,
0.7399769, -0.1727656, 0.916753, 1, 1, 1, 1, 1,
0.7422024, 0.268608, 1.831714, 1, 1, 1, 1, 1,
0.7438702, 1.599914, -0.5525935, 1, 1, 1, 1, 1,
0.7504503, 0.5961381, 1.977916, 1, 1, 1, 1, 1,
0.7530654, 0.3000778, 1.343415, 0, 0, 1, 1, 1,
0.7538847, -0.3325763, 0.1555913, 1, 0, 0, 1, 1,
0.7618877, -1.088667, 2.839076, 1, 0, 0, 1, 1,
0.7758209, 0.9000374, 1.546945, 1, 0, 0, 1, 1,
0.779573, -0.9574338, 4.49191, 1, 0, 0, 1, 1,
0.7822049, 0.4485645, 0.4634936, 1, 0, 0, 1, 1,
0.7997572, 0.4471291, 0.07467531, 0, 0, 0, 1, 1,
0.802946, -0.7558497, 2.071149, 0, 0, 0, 1, 1,
0.8037832, -0.3825107, 1.36314, 0, 0, 0, 1, 1,
0.8118503, 2.836751, 0.8092343, 0, 0, 0, 1, 1,
0.8146129, 0.02633733, 1.038195, 0, 0, 0, 1, 1,
0.8161432, -2.349185, 2.979318, 0, 0, 0, 1, 1,
0.8184919, -0.546389, 0.5753438, 0, 0, 0, 1, 1,
0.8273045, 0.4923533, -0.01246199, 1, 1, 1, 1, 1,
0.8280342, 0.4833627, 0.621914, 1, 1, 1, 1, 1,
0.8311779, -1.201881, -0.4114183, 1, 1, 1, 1, 1,
0.831868, -0.5441297, 2.727808, 1, 1, 1, 1, 1,
0.8321556, 0.7379656, 1.031455, 1, 1, 1, 1, 1,
0.8346846, -1.27636, 2.558831, 1, 1, 1, 1, 1,
0.8351001, 0.1257697, 0.7343125, 1, 1, 1, 1, 1,
0.8428515, -1.098304, 2.539675, 1, 1, 1, 1, 1,
0.8429956, 0.1423299, 1.456661, 1, 1, 1, 1, 1,
0.8452301, -2.228819, 4.157099, 1, 1, 1, 1, 1,
0.8466693, 0.2217192, 3.42206, 1, 1, 1, 1, 1,
0.8524205, -0.1316301, -1.219643, 1, 1, 1, 1, 1,
0.8583483, -2.044773, 1.661347, 1, 1, 1, 1, 1,
0.8617901, 0.2791553, 0.7507225, 1, 1, 1, 1, 1,
0.8641209, -0.4610535, 1.946874, 1, 1, 1, 1, 1,
0.8697118, -0.5130497, 2.049696, 0, 0, 1, 1, 1,
0.8720261, -0.887727, 2.374207, 1, 0, 0, 1, 1,
0.8741107, -0.2931395, 2.276607, 1, 0, 0, 1, 1,
0.8756697, 0.8910199, 0.5613945, 1, 0, 0, 1, 1,
0.8765897, 0.8788384, 0.05056782, 1, 0, 0, 1, 1,
0.8793137, -0.1025752, 2.59146, 1, 0, 0, 1, 1,
0.88833, 1.814989, 0.8046125, 0, 0, 0, 1, 1,
0.8889755, -1.828445, 2.289216, 0, 0, 0, 1, 1,
0.8900125, -0.3945391, 0.856892, 0, 0, 0, 1, 1,
0.8907006, 0.3946989, 2.620688, 0, 0, 0, 1, 1,
0.8919849, 0.8192524, 2.642091, 0, 0, 0, 1, 1,
0.8951502, -0.1992023, 1.837951, 0, 0, 0, 1, 1,
0.9002032, -1.309623, 2.015912, 0, 0, 0, 1, 1,
0.9044372, 0.02192691, 1.241789, 1, 1, 1, 1, 1,
0.9193984, 1.484279, 0.7236905, 1, 1, 1, 1, 1,
0.9215417, 0.3456446, 1.008705, 1, 1, 1, 1, 1,
0.9280573, 1.557718, 1.397038, 1, 1, 1, 1, 1,
0.931502, -0.6588647, 0.9849823, 1, 1, 1, 1, 1,
0.9327956, 0.4808484, 0.9526373, 1, 1, 1, 1, 1,
0.9337067, -0.7148047, 1.204148, 1, 1, 1, 1, 1,
0.9382972, -0.443475, 3.353605, 1, 1, 1, 1, 1,
0.9517344, 0.2701893, 0.724616, 1, 1, 1, 1, 1,
0.958359, -0.1860729, 2.831479, 1, 1, 1, 1, 1,
0.9678069, 0.0421552, 2.352355, 1, 1, 1, 1, 1,
0.9685974, -0.3130232, 0.009115603, 1, 1, 1, 1, 1,
0.9713303, -0.5526255, 3.20209, 1, 1, 1, 1, 1,
0.9714546, -1.542829, 1.999745, 1, 1, 1, 1, 1,
0.9742649, 0.6934887, -0.6626075, 1, 1, 1, 1, 1,
0.9765689, -1.349703, 2.080625, 0, 0, 1, 1, 1,
0.977776, -0.9999358, 2.999487, 1, 0, 0, 1, 1,
0.9855274, -0.48862, 3.805196, 1, 0, 0, 1, 1,
0.9877895, 1.207063, -0.4159577, 1, 0, 0, 1, 1,
0.9983877, -0.617704, 4.728363, 1, 0, 0, 1, 1,
1.002609, 1.07755, 1.208702, 1, 0, 0, 1, 1,
1.003172, -1.24568, 1.618552, 0, 0, 0, 1, 1,
1.004499, 0.3316503, 2.053366, 0, 0, 0, 1, 1,
1.006093, 0.2156025, 1.412365, 0, 0, 0, 1, 1,
1.006154, -0.04365322, 1.752318, 0, 0, 0, 1, 1,
1.016075, 0.6911052, 1.982781, 0, 0, 0, 1, 1,
1.023419, -0.5576682, 2.392725, 0, 0, 0, 1, 1,
1.024733, -1.274167, 1.682267, 0, 0, 0, 1, 1,
1.028385, -0.5805871, 2.494445, 1, 1, 1, 1, 1,
1.035142, 0.5125843, 1.738856, 1, 1, 1, 1, 1,
1.039268, -0.5780079, 1.646055, 1, 1, 1, 1, 1,
1.044818, 0.7898868, 1.190731, 1, 1, 1, 1, 1,
1.048735, 0.4774556, 2.439569, 1, 1, 1, 1, 1,
1.051303, 2.102027, 1.234213, 1, 1, 1, 1, 1,
1.058929, -1.236363, 2.622159, 1, 1, 1, 1, 1,
1.059506, -1.090068, 1.514999, 1, 1, 1, 1, 1,
1.060031, -0.5073695, 0.1358922, 1, 1, 1, 1, 1,
1.060482, 0.24501, 1.409788, 1, 1, 1, 1, 1,
1.070383, -0.08186011, 1.183324, 1, 1, 1, 1, 1,
1.073555, -0.7978629, 2.862561, 1, 1, 1, 1, 1,
1.085171, 0.1415526, 1.127864, 1, 1, 1, 1, 1,
1.092127, -0.2621863, 1.837307, 1, 1, 1, 1, 1,
1.096064, -0.1513777, 1.18164, 1, 1, 1, 1, 1,
1.101902, 0.2795936, 1.645008, 0, 0, 1, 1, 1,
1.103432, 0.2892755, -1.011213, 1, 0, 0, 1, 1,
1.107044, -1.624518, 1.34413, 1, 0, 0, 1, 1,
1.108604, 0.5494258, 0.4779872, 1, 0, 0, 1, 1,
1.115459, 0.04912548, 1.244819, 1, 0, 0, 1, 1,
1.152627, 0.5853529, 1.809236, 1, 0, 0, 1, 1,
1.153135, -0.235202, 3.490691, 0, 0, 0, 1, 1,
1.153422, -0.9119104, 2.404732, 0, 0, 0, 1, 1,
1.158031, -0.8806009, 1.98068, 0, 0, 0, 1, 1,
1.162999, -0.2554046, 2.089921, 0, 0, 0, 1, 1,
1.167764, -1.455065, 1.657789, 0, 0, 0, 1, 1,
1.170864, -0.7558788, -0.1290327, 0, 0, 0, 1, 1,
1.177778, -0.5405995, 2.504141, 0, 0, 0, 1, 1,
1.180516, -0.8448973, 3.260912, 1, 1, 1, 1, 1,
1.187613, -0.3671832, 3.731466, 1, 1, 1, 1, 1,
1.190778, -0.2970133, 1.29303, 1, 1, 1, 1, 1,
1.201653, -1.328564, 0.7686056, 1, 1, 1, 1, 1,
1.220757, -0.7896843, 2.790074, 1, 1, 1, 1, 1,
1.223646, 0.05734753, -0.4901315, 1, 1, 1, 1, 1,
1.230328, -0.1362765, 1.386928, 1, 1, 1, 1, 1,
1.232663, -2.043789, 2.328042, 1, 1, 1, 1, 1,
1.233115, -0.6088673, 3.25731, 1, 1, 1, 1, 1,
1.234705, 1.35019, 1.845344, 1, 1, 1, 1, 1,
1.236395, -2.20411, 4.564469, 1, 1, 1, 1, 1,
1.23856, 1.144736, 1.219604, 1, 1, 1, 1, 1,
1.23902, -2.463648, 3.975893, 1, 1, 1, 1, 1,
1.243386, -1.11079, 1.458281, 1, 1, 1, 1, 1,
1.249907, -0.1146734, 1.791511, 1, 1, 1, 1, 1,
1.255046, 0.5002644, 3.066417, 0, 0, 1, 1, 1,
1.270009, -0.4481083, 0.6125736, 1, 0, 0, 1, 1,
1.274049, -1.286268, 2.263803, 1, 0, 0, 1, 1,
1.276586, 0.6349565, 1.399974, 1, 0, 0, 1, 1,
1.289227, -0.07301773, 2.652497, 1, 0, 0, 1, 1,
1.289515, 0.08040313, -0.1107344, 1, 0, 0, 1, 1,
1.291497, -1.610328, 0.6480494, 0, 0, 0, 1, 1,
1.294135, -0.3473766, 3.408992, 0, 0, 0, 1, 1,
1.300465, -1.717352, 1.28837, 0, 0, 0, 1, 1,
1.323344, -0.3760985, -0.4182114, 0, 0, 0, 1, 1,
1.330254, -0.287107, 1.898638, 0, 0, 0, 1, 1,
1.338313, 0.8268323, 2.186449, 0, 0, 0, 1, 1,
1.39082, 0.6187741, 3.960861, 0, 0, 0, 1, 1,
1.40621, -0.6351775, 2.112286, 1, 1, 1, 1, 1,
1.413867, 0.2179945, 0.4786953, 1, 1, 1, 1, 1,
1.415093, 0.4821648, 1.597383, 1, 1, 1, 1, 1,
1.424488, 0.1068262, 1.910084, 1, 1, 1, 1, 1,
1.42797, 0.39626, 3.0052, 1, 1, 1, 1, 1,
1.428046, -0.06379725, 2.068039, 1, 1, 1, 1, 1,
1.436686, -0.2897654, 1.5106, 1, 1, 1, 1, 1,
1.444259, -1.768798, 1.752196, 1, 1, 1, 1, 1,
1.445317, 0.5238941, 1.058865, 1, 1, 1, 1, 1,
1.452884, 1.118015, -0.3223149, 1, 1, 1, 1, 1,
1.45908, -1.965989, 4.02525, 1, 1, 1, 1, 1,
1.465651, -0.2297959, 1.402586, 1, 1, 1, 1, 1,
1.486783, 0.8441193, 0.9826966, 1, 1, 1, 1, 1,
1.497347, -0.5124209, 2.354542, 1, 1, 1, 1, 1,
1.500859, 0.6880062, 0.5499038, 1, 1, 1, 1, 1,
1.505022, -1.89081, 2.687923, 0, 0, 1, 1, 1,
1.514202, 0.3643372, 0.9508636, 1, 0, 0, 1, 1,
1.515212, -0.1554309, 0.8983829, 1, 0, 0, 1, 1,
1.520364, -1.271179, 3.387754, 1, 0, 0, 1, 1,
1.521596, 1.878943, -0.2240324, 1, 0, 0, 1, 1,
1.530542, 1.05415, 2.07988, 1, 0, 0, 1, 1,
1.531639, -0.9674784, 2.387663, 0, 0, 0, 1, 1,
1.53897, -1.486734, 1.902455, 0, 0, 0, 1, 1,
1.54155, -1.02567, 1.230125, 0, 0, 0, 1, 1,
1.541701, -0.4773443, 0.2059517, 0, 0, 0, 1, 1,
1.547023, 0.1764112, 0.2661078, 0, 0, 0, 1, 1,
1.547066, 0.6131886, 1.414036, 0, 0, 0, 1, 1,
1.554324, -2.021295, 2.691326, 0, 0, 0, 1, 1,
1.554605, -0.7233837, 1.517807, 1, 1, 1, 1, 1,
1.559956, -1.15993, 1.975499, 1, 1, 1, 1, 1,
1.570986, -0.1716581, 2.296019, 1, 1, 1, 1, 1,
1.577343, 1.904238, 0.7768199, 1, 1, 1, 1, 1,
1.599569, -0.6800717, 2.578012, 1, 1, 1, 1, 1,
1.602496, 1.101794, 1.840572, 1, 1, 1, 1, 1,
1.607018, 1.434689, 1.040783, 1, 1, 1, 1, 1,
1.615202, 0.4218685, 2.342106, 1, 1, 1, 1, 1,
1.629171, 0.03573847, 1.704923, 1, 1, 1, 1, 1,
1.63503, 1.236993, 1.084345, 1, 1, 1, 1, 1,
1.655973, -0.65938, 1.606015, 1, 1, 1, 1, 1,
1.668525, -0.3656299, 1.622082, 1, 1, 1, 1, 1,
1.670772, -0.4445311, 0.9568263, 1, 1, 1, 1, 1,
1.67088, 0.1524682, 0.4014684, 1, 1, 1, 1, 1,
1.681871, 0.5234495, 1.827345, 1, 1, 1, 1, 1,
1.698943, 0.4695946, -0.2688285, 0, 0, 1, 1, 1,
1.701797, 0.1001486, 1.353739, 1, 0, 0, 1, 1,
1.704194, -1.687918, 2.99255, 1, 0, 0, 1, 1,
1.728237, -0.915038, 0.8262318, 1, 0, 0, 1, 1,
1.734837, -1.777063, 2.498883, 1, 0, 0, 1, 1,
1.773507, -1.072331, 2.120557, 1, 0, 0, 1, 1,
1.79677, -2.511479, 3.48587, 0, 0, 0, 1, 1,
1.826248, 1.725345, 2.25665, 0, 0, 0, 1, 1,
1.827674, -0.4184366, 3.402289, 0, 0, 0, 1, 1,
1.836818, -0.2713896, 0.432454, 0, 0, 0, 1, 1,
1.838357, 0.1667423, 1.447972, 0, 0, 0, 1, 1,
1.853843, 1.645025, 0.6794424, 0, 0, 0, 1, 1,
1.859715, -0.3086633, 1.489626, 0, 0, 0, 1, 1,
1.864802, 2.961896, -0.2619578, 1, 1, 1, 1, 1,
1.894879, 1.112672, 1.445101, 1, 1, 1, 1, 1,
1.918547, 0.7077391, 1.47981, 1, 1, 1, 1, 1,
1.91883, 0.7405704, 0.5525029, 1, 1, 1, 1, 1,
1.942575, 0.08507043, 3.349112, 1, 1, 1, 1, 1,
1.943297, -1.005167, 3.075119, 1, 1, 1, 1, 1,
1.962629, -1.216533, 2.970105, 1, 1, 1, 1, 1,
2.005505, -0.121986, 0.9369639, 1, 1, 1, 1, 1,
2.021276, -1.338243, 1.950322, 1, 1, 1, 1, 1,
2.058609, 1.46865, 2.028673, 1, 1, 1, 1, 1,
2.088074, 1.91994, 0.2535216, 1, 1, 1, 1, 1,
2.100309, -0.6217296, 1.57426, 1, 1, 1, 1, 1,
2.127971, -0.3159419, 0.9055753, 1, 1, 1, 1, 1,
2.130144, -1.980298, 1.812385, 1, 1, 1, 1, 1,
2.15709, 0.6218224, 0.5332702, 1, 1, 1, 1, 1,
2.253467, 0.2025023, 1.283304, 0, 0, 1, 1, 1,
2.287062, -1.028034, 1.987402, 1, 0, 0, 1, 1,
2.326136, 1.035261, 0.4703288, 1, 0, 0, 1, 1,
2.327187, -0.1528854, 0.2229213, 1, 0, 0, 1, 1,
2.331731, -1.310397, 1.099735, 1, 0, 0, 1, 1,
2.361219, 0.03071225, 0.2423973, 1, 0, 0, 1, 1,
2.420505, 0.6258545, 3.854006, 0, 0, 0, 1, 1,
2.426499, 1.010002, 1.372027, 0, 0, 0, 1, 1,
2.436476, 0.2398387, 1.052607, 0, 0, 0, 1, 1,
2.443658, 2.275488, 0.5597566, 0, 0, 0, 1, 1,
2.514045, -0.9718666, 1.790642, 0, 0, 0, 1, 1,
2.585886, -1.883425, 1.1829, 0, 0, 0, 1, 1,
2.586499, -2.122002, 1.263423, 0, 0, 0, 1, 1,
2.604919, -0.9838709, 1.362316, 1, 1, 1, 1, 1,
2.661402, 0.3431664, 1.630418, 1, 1, 1, 1, 1,
2.677119, 0.9087731, 0.9559778, 1, 1, 1, 1, 1,
2.690959, 1.03038, 1.535376, 1, 1, 1, 1, 1,
2.72229, -1.503332, 2.862553, 1, 1, 1, 1, 1,
2.908684, 1.109099, 1.640175, 1, 1, 1, 1, 1,
3.076321, -0.5839831, 1.206885, 1, 1, 1, 1, 1
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
var radius = 9.547849;
var distance = 33.53642;
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
mvMatrix.translate( 0.007235765, -0.6917127, 0.01363111 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.53642);
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
