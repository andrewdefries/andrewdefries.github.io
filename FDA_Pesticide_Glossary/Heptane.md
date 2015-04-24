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
-2.966481, -0.2144528, -1.879245, 1, 0, 0, 1,
-2.750087, -0.04863665, -0.963196, 1, 0.007843138, 0, 1,
-2.663311, -0.05841948, -0.3806209, 1, 0.01176471, 0, 1,
-2.660897, 0.5469797, -1.534024, 1, 0.01960784, 0, 1,
-2.408989, 0.7255938, -1.149698, 1, 0.02352941, 0, 1,
-2.394449, -0.1430378, -2.662811, 1, 0.03137255, 0, 1,
-2.380023, 0.05321687, -2.859051, 1, 0.03529412, 0, 1,
-2.356704, 1.621215, -2.01356, 1, 0.04313726, 0, 1,
-2.345434, -0.880994, -0.1695055, 1, 0.04705882, 0, 1,
-2.329753, -0.7601381, -2.933119, 1, 0.05490196, 0, 1,
-2.289422, -1.219705, -0.4349583, 1, 0.05882353, 0, 1,
-2.246178, -1.473755, -3.034423, 1, 0.06666667, 0, 1,
-2.209761, 0.9461297, -0.5403242, 1, 0.07058824, 0, 1,
-2.176575, 1.150505, 0.1460616, 1, 0.07843138, 0, 1,
-2.131484, 1.286697, -2.639749, 1, 0.08235294, 0, 1,
-2.119423, 0.7903093, 0.4211547, 1, 0.09019608, 0, 1,
-2.107852, -1.549016, -1.69909, 1, 0.09411765, 0, 1,
-2.107189, 0.877893, -0.2029031, 1, 0.1019608, 0, 1,
-2.091224, -0.4945234, 0.2893676, 1, 0.1098039, 0, 1,
-2.087519, -0.2402721, -2.033542, 1, 0.1137255, 0, 1,
-2.062873, 0.1116691, -1.861137, 1, 0.1215686, 0, 1,
-2.058487, -2.732677, -2.569953, 1, 0.1254902, 0, 1,
-2.022272, 0.2810295, -2.955817, 1, 0.1333333, 0, 1,
-2.002919, 0.09357868, -1.058363, 1, 0.1372549, 0, 1,
-1.986457, 0.1566256, -0.6637626, 1, 0.145098, 0, 1,
-1.982836, -0.9333807, -1.060627, 1, 0.1490196, 0, 1,
-1.927085, 0.9835656, -2.507534, 1, 0.1568628, 0, 1,
-1.869879, -0.2106278, -1.844948, 1, 0.1607843, 0, 1,
-1.868064, -0.4976913, -2.773351, 1, 0.1686275, 0, 1,
-1.862785, 0.8595388, -1.365042, 1, 0.172549, 0, 1,
-1.858273, 0.6063254, 0.5108426, 1, 0.1803922, 0, 1,
-1.85189, -0.5062047, -1.525805, 1, 0.1843137, 0, 1,
-1.850841, -0.1458672, -2.405596, 1, 0.1921569, 0, 1,
-1.842653, -3.076959, -2.800396, 1, 0.1960784, 0, 1,
-1.83769, -0.7029638, -3.550401, 1, 0.2039216, 0, 1,
-1.829216, -1.139704, -0.2359156, 1, 0.2117647, 0, 1,
-1.821552, 0.697154, 0.4635848, 1, 0.2156863, 0, 1,
-1.804577, 0.3778701, -1.062295, 1, 0.2235294, 0, 1,
-1.776368, -0.3453735, -1.090415, 1, 0.227451, 0, 1,
-1.772908, 0.6566901, -2.302719, 1, 0.2352941, 0, 1,
-1.75931, -0.09716284, -1.961124, 1, 0.2392157, 0, 1,
-1.75452, -0.2132217, -1.086517, 1, 0.2470588, 0, 1,
-1.751945, 0.5066926, -0.7733536, 1, 0.2509804, 0, 1,
-1.729886, -0.3040755, -0.4259121, 1, 0.2588235, 0, 1,
-1.72811, 0.5459201, -1.768838, 1, 0.2627451, 0, 1,
-1.721754, -1.106054, -2.712652, 1, 0.2705882, 0, 1,
-1.716491, -0.05254353, -1.082448, 1, 0.2745098, 0, 1,
-1.713036, -1.21578, -3.052704, 1, 0.282353, 0, 1,
-1.71255, 0.001986479, -0.3522315, 1, 0.2862745, 0, 1,
-1.707536, 0.2792498, -1.062757, 1, 0.2941177, 0, 1,
-1.693461, 1.083387, -0.4826483, 1, 0.3019608, 0, 1,
-1.674514, -0.6437614, -1.413477, 1, 0.3058824, 0, 1,
-1.668643, -0.6458773, -0.8959668, 1, 0.3137255, 0, 1,
-1.632471, -0.5137744, -0.922259, 1, 0.3176471, 0, 1,
-1.622484, -0.09558487, -2.722781, 1, 0.3254902, 0, 1,
-1.610289, -1.03541, -1.604675, 1, 0.3294118, 0, 1,
-1.610131, 0.7984742, -1.968921, 1, 0.3372549, 0, 1,
-1.610066, -0.5085661, -3.754919, 1, 0.3411765, 0, 1,
-1.602377, -2.094749, -3.544552, 1, 0.3490196, 0, 1,
-1.558586, -0.3660341, -3.201319, 1, 0.3529412, 0, 1,
-1.557083, 0.7897077, -2.487328, 1, 0.3607843, 0, 1,
-1.556612, -1.873137, -5.052474, 1, 0.3647059, 0, 1,
-1.554546, 0.5195408, -1.409041, 1, 0.372549, 0, 1,
-1.543767, -0.6467424, -1.869087, 1, 0.3764706, 0, 1,
-1.543368, 0.9786355, 1.450008, 1, 0.3843137, 0, 1,
-1.538583, -1.183586, -0.8719474, 1, 0.3882353, 0, 1,
-1.524659, 0.2806502, -0.8364773, 1, 0.3960784, 0, 1,
-1.524006, 0.8883606, -0.00502546, 1, 0.4039216, 0, 1,
-1.492496, -0.3414586, -0.9225208, 1, 0.4078431, 0, 1,
-1.469518, 1.091071, -1.677673, 1, 0.4156863, 0, 1,
-1.462908, -0.4202378, -1.19854, 1, 0.4196078, 0, 1,
-1.461306, 0.5649309, -0.9611902, 1, 0.427451, 0, 1,
-1.458215, -0.893114, -3.039528, 1, 0.4313726, 0, 1,
-1.455831, 0.0368624, -0.8740509, 1, 0.4392157, 0, 1,
-1.444196, 0.2038019, -3.685133, 1, 0.4431373, 0, 1,
-1.433783, -1.253683, -2.779712, 1, 0.4509804, 0, 1,
-1.42515, 1.246453, 0.6237472, 1, 0.454902, 0, 1,
-1.419431, 1.504916, -1.513876, 1, 0.4627451, 0, 1,
-1.417853, 0.2598647, -1.475952, 1, 0.4666667, 0, 1,
-1.394066, -0.9008433, -2.003322, 1, 0.4745098, 0, 1,
-1.385293, -0.7447413, -3.246574, 1, 0.4784314, 0, 1,
-1.382516, -0.1101747, -2.518676, 1, 0.4862745, 0, 1,
-1.37999, 0.2848146, -1.57113, 1, 0.4901961, 0, 1,
-1.374774, -2.544189, -1.948474, 1, 0.4980392, 0, 1,
-1.368026, -0.3125771, -0.3842707, 1, 0.5058824, 0, 1,
-1.355136, -0.1665, -2.290411, 1, 0.509804, 0, 1,
-1.343884, 0.1934879, -2.123134, 1, 0.5176471, 0, 1,
-1.336891, 1.01535, -1.556904, 1, 0.5215687, 0, 1,
-1.335618, -0.5330634, -2.261764, 1, 0.5294118, 0, 1,
-1.333269, 1.128277, -0.5944331, 1, 0.5333334, 0, 1,
-1.316872, 0.9475715, 1.671352, 1, 0.5411765, 0, 1,
-1.316238, 1.758096, -1.396557, 1, 0.5450981, 0, 1,
-1.311587, -1.426929, -1.324622, 1, 0.5529412, 0, 1,
-1.310029, 0.06721372, 0.2554399, 1, 0.5568628, 0, 1,
-1.306013, -0.007162145, 0.8783855, 1, 0.5647059, 0, 1,
-1.302946, 0.05604327, -1.493285, 1, 0.5686275, 0, 1,
-1.280224, 0.4738437, -0.7582858, 1, 0.5764706, 0, 1,
-1.280126, 2.020143, 1.635199, 1, 0.5803922, 0, 1,
-1.263158, 0.01931829, -0.07542925, 1, 0.5882353, 0, 1,
-1.260349, 2.043267, 0.2736368, 1, 0.5921569, 0, 1,
-1.245803, 0.7302434, -2.347555, 1, 0.6, 0, 1,
-1.244249, -0.8457401, -3.893138, 1, 0.6078432, 0, 1,
-1.242867, -0.6807153, -2.221581, 1, 0.6117647, 0, 1,
-1.236212, -0.9925516, -2.900422, 1, 0.6196079, 0, 1,
-1.232791, -0.7401713, -1.190619, 1, 0.6235294, 0, 1,
-1.23234, -1.799287, -2.698326, 1, 0.6313726, 0, 1,
-1.230322, 1.071844, -1.464028, 1, 0.6352941, 0, 1,
-1.215282, -1.154013, -3.820263, 1, 0.6431373, 0, 1,
-1.215174, -0.6900564, -2.049229, 1, 0.6470588, 0, 1,
-1.21328, 1.179687, -1.151241, 1, 0.654902, 0, 1,
-1.198578, -0.7580308, -2.279195, 1, 0.6588235, 0, 1,
-1.193622, -0.1721844, -1.021043, 1, 0.6666667, 0, 1,
-1.189689, -1.852153, -2.963102, 1, 0.6705883, 0, 1,
-1.184358, 0.2714127, -1.208133, 1, 0.6784314, 0, 1,
-1.170969, -0.4302387, -2.091147, 1, 0.682353, 0, 1,
-1.164854, -0.8916391, -1.436339, 1, 0.6901961, 0, 1,
-1.158467, -0.6620645, -0.8332311, 1, 0.6941177, 0, 1,
-1.151096, 1.293786, -0.09232853, 1, 0.7019608, 0, 1,
-1.149092, 1.857629, 0.636255, 1, 0.7098039, 0, 1,
-1.148255, 0.1235559, -2.242335, 1, 0.7137255, 0, 1,
-1.12904, -1.138802, -2.802216, 1, 0.7215686, 0, 1,
-1.124559, -1.651094, -1.528395, 1, 0.7254902, 0, 1,
-1.122268, -0.6956546, -0.7456591, 1, 0.7333333, 0, 1,
-1.111694, -0.4492224, -3.619606, 1, 0.7372549, 0, 1,
-1.106305, 1.343429, -0.9320771, 1, 0.7450981, 0, 1,
-1.099269, 0.4116591, -0.4999878, 1, 0.7490196, 0, 1,
-1.096494, -1.201409, -3.292094, 1, 0.7568628, 0, 1,
-1.092457, 0.1224187, -2.124859, 1, 0.7607843, 0, 1,
-1.085247, 2.27749, -0.1453411, 1, 0.7686275, 0, 1,
-1.081992, 1.460801, -1.267641, 1, 0.772549, 0, 1,
-1.07675, 1.158152, 0.8876575, 1, 0.7803922, 0, 1,
-1.07608, -0.7346966, -2.80388, 1, 0.7843137, 0, 1,
-1.061349, 0.8658614, -1.213906, 1, 0.7921569, 0, 1,
-1.055768, -1.601606, -2.938842, 1, 0.7960784, 0, 1,
-1.04833, -0.01870688, -2.861076, 1, 0.8039216, 0, 1,
-1.047589, -0.7600074, -4.481482, 1, 0.8117647, 0, 1,
-1.047541, -0.8979622, -0.657474, 1, 0.8156863, 0, 1,
-1.046714, -0.05841547, -1.300953, 1, 0.8235294, 0, 1,
-1.045368, -1.472329, -2.105783, 1, 0.827451, 0, 1,
-1.044, -0.02607453, -1.391351, 1, 0.8352941, 0, 1,
-1.040607, -1.300913, -0.9818283, 1, 0.8392157, 0, 1,
-1.030865, 0.4655201, -2.005688, 1, 0.8470588, 0, 1,
-1.028896, 0.5440589, -0.1046534, 1, 0.8509804, 0, 1,
-1.02694, -0.07883922, -1.47749, 1, 0.8588235, 0, 1,
-1.02004, -0.6079718, -2.249024, 1, 0.8627451, 0, 1,
-1.019027, 1.551527, 2.412923, 1, 0.8705882, 0, 1,
-1.017879, 1.238125, -1.527289, 1, 0.8745098, 0, 1,
-1.01608, -0.9883014, -2.564058, 1, 0.8823529, 0, 1,
-1.011196, -1.632375, -2.286583, 1, 0.8862745, 0, 1,
-1.001432, -0.028859, -1.155518, 1, 0.8941177, 0, 1,
-0.9988418, -0.7035604, -2.515932, 1, 0.8980392, 0, 1,
-0.9966681, 0.9699739, -0.776285, 1, 0.9058824, 0, 1,
-0.9955686, -1.927095, -1.935046, 1, 0.9137255, 0, 1,
-0.9875249, 0.2086689, -1.502646, 1, 0.9176471, 0, 1,
-0.9868976, -0.1893691, -1.212661, 1, 0.9254902, 0, 1,
-0.9823191, -0.6429563, -0.6428277, 1, 0.9294118, 0, 1,
-0.9821786, -2.125314, -1.954128, 1, 0.9372549, 0, 1,
-0.9784731, -0.5730474, -3.474839, 1, 0.9411765, 0, 1,
-0.978173, 0.3000326, -1.001083, 1, 0.9490196, 0, 1,
-0.9757838, -1.527113, -2.865912, 1, 0.9529412, 0, 1,
-0.9726765, 0.07333375, -0.8616628, 1, 0.9607843, 0, 1,
-0.9684027, -0.853534, -2.36145, 1, 0.9647059, 0, 1,
-0.9618492, 0.3908082, -1.442163, 1, 0.972549, 0, 1,
-0.9578698, -2.047417, -3.035718, 1, 0.9764706, 0, 1,
-0.9547086, -0.2642936, -1.816783, 1, 0.9843137, 0, 1,
-0.9498495, 0.9021601, -0.4094369, 1, 0.9882353, 0, 1,
-0.9456325, 0.1967146, -4.02888, 1, 0.9960784, 0, 1,
-0.9455907, 1.178901, -2.187634, 0.9960784, 1, 0, 1,
-0.9424112, -1.332077, -0.8424345, 0.9921569, 1, 0, 1,
-0.9420654, -0.1836577, -3.496393, 0.9843137, 1, 0, 1,
-0.941202, 1.63257, 0.8007021, 0.9803922, 1, 0, 1,
-0.9409007, 0.2643017, -0.6427341, 0.972549, 1, 0, 1,
-0.9381366, -0.7760295, -3.756665, 0.9686275, 1, 0, 1,
-0.9311733, 0.9580969, 1.194284, 0.9607843, 1, 0, 1,
-0.9178588, -1.087219, -2.13368, 0.9568627, 1, 0, 1,
-0.9158504, -0.0960955, -1.92961, 0.9490196, 1, 0, 1,
-0.8995838, 1.912343, -1.193293, 0.945098, 1, 0, 1,
-0.8939595, -1.549181, -3.687931, 0.9372549, 1, 0, 1,
-0.8930505, -1.711206, -2.763209, 0.9333333, 1, 0, 1,
-0.8839343, 2.031359, -2.123332, 0.9254902, 1, 0, 1,
-0.8788525, 0.4488858, -1.531207, 0.9215686, 1, 0, 1,
-0.877764, -0.7105513, -2.802114, 0.9137255, 1, 0, 1,
-0.8773921, -0.5465505, -2.191379, 0.9098039, 1, 0, 1,
-0.8696854, 1.01651, 0.4065033, 0.9019608, 1, 0, 1,
-0.8661534, 2.3743, 0.193274, 0.8941177, 1, 0, 1,
-0.8659517, -0.6505121, -3.077558, 0.8901961, 1, 0, 1,
-0.8629583, -0.2140947, 0.8752721, 0.8823529, 1, 0, 1,
-0.8623801, -0.1825301, -1.043658, 0.8784314, 1, 0, 1,
-0.8558167, 2.074789, -2.054088, 0.8705882, 1, 0, 1,
-0.8552113, 0.1246699, -2.522548, 0.8666667, 1, 0, 1,
-0.8534769, 0.8284429, -1.149858, 0.8588235, 1, 0, 1,
-0.8473858, -0.2032083, -0.9181424, 0.854902, 1, 0, 1,
-0.8464791, -0.01240389, -0.981171, 0.8470588, 1, 0, 1,
-0.8393602, -0.8304425, -2.092693, 0.8431373, 1, 0, 1,
-0.8306534, 0.7899002, -0.2550714, 0.8352941, 1, 0, 1,
-0.8306181, -0.456823, -2.688689, 0.8313726, 1, 0, 1,
-0.8249105, 0.9058152, -0.670579, 0.8235294, 1, 0, 1,
-0.811619, 1.655544, -0.7781712, 0.8196079, 1, 0, 1,
-0.8078214, 0.2574602, -1.930473, 0.8117647, 1, 0, 1,
-0.8069878, 1.247169, -0.6977174, 0.8078431, 1, 0, 1,
-0.8056816, 0.9548169, -0.4004966, 0.8, 1, 0, 1,
-0.8041247, 0.1598204, -3.039005, 0.7921569, 1, 0, 1,
-0.8013387, -0.6507816, -2.680644, 0.7882353, 1, 0, 1,
-0.8004763, 0.8477495, -1.129105, 0.7803922, 1, 0, 1,
-0.7934363, 1.20812, -0.2609658, 0.7764706, 1, 0, 1,
-0.7928836, 0.5116706, -2.896482, 0.7686275, 1, 0, 1,
-0.7908748, -1.055731, -1.713345, 0.7647059, 1, 0, 1,
-0.7899753, -0.4563858, -2.951845, 0.7568628, 1, 0, 1,
-0.7895368, -2.402949, -2.509672, 0.7529412, 1, 0, 1,
-0.7840499, 0.2938854, -1.787322, 0.7450981, 1, 0, 1,
-0.7834998, -0.2977349, -2.085172, 0.7411765, 1, 0, 1,
-0.774767, -0.7581972, -1.31238, 0.7333333, 1, 0, 1,
-0.7709092, 0.4708211, -1.182221, 0.7294118, 1, 0, 1,
-0.7646174, -1.213763, -1.604454, 0.7215686, 1, 0, 1,
-0.7631376, -1.079614, -1.346067, 0.7176471, 1, 0, 1,
-0.7597739, 0.2626784, -1.970712, 0.7098039, 1, 0, 1,
-0.7576704, -0.5289502, -1.715095, 0.7058824, 1, 0, 1,
-0.7576364, -2.234976, -3.410592, 0.6980392, 1, 0, 1,
-0.7549551, -0.8101354, -3.437024, 0.6901961, 1, 0, 1,
-0.7519931, -0.6556322, -2.365863, 0.6862745, 1, 0, 1,
-0.7514997, 0.4943201, -1.231457, 0.6784314, 1, 0, 1,
-0.7381282, 1.396067, -2.294044, 0.6745098, 1, 0, 1,
-0.7287797, -0.1095869, -1.183049, 0.6666667, 1, 0, 1,
-0.723317, 0.5278634, -2.135139, 0.6627451, 1, 0, 1,
-0.7156566, 1.147096, -1.305246, 0.654902, 1, 0, 1,
-0.7031655, -0.644958, -4.350113, 0.6509804, 1, 0, 1,
-0.7030994, -1.465592, -2.842378, 0.6431373, 1, 0, 1,
-0.6998147, 0.9549401, -1.442987, 0.6392157, 1, 0, 1,
-0.69772, -0.5658256, -0.8084199, 0.6313726, 1, 0, 1,
-0.6976285, -1.419789, -2.914575, 0.627451, 1, 0, 1,
-0.6968997, 0.2003797, -1.17805, 0.6196079, 1, 0, 1,
-0.6965777, -0.04384141, -1.602622, 0.6156863, 1, 0, 1,
-0.6953319, 0.3635418, 0.356319, 0.6078432, 1, 0, 1,
-0.6846683, -0.3166415, -1.414814, 0.6039216, 1, 0, 1,
-0.6802171, -0.1662642, -1.165269, 0.5960785, 1, 0, 1,
-0.679545, -1.289331, -3.387589, 0.5882353, 1, 0, 1,
-0.6749976, -0.04489023, -1.633515, 0.5843138, 1, 0, 1,
-0.6686653, -2.005733, -3.831584, 0.5764706, 1, 0, 1,
-0.6685079, 1.360913, -0.2298443, 0.572549, 1, 0, 1,
-0.6597885, 0.138973, -0.4680794, 0.5647059, 1, 0, 1,
-0.6596237, 0.2604516, -0.4694878, 0.5607843, 1, 0, 1,
-0.6554309, -1.140801, -3.136699, 0.5529412, 1, 0, 1,
-0.6553525, 1.33011, 0.7864749, 0.5490196, 1, 0, 1,
-0.6528515, -0.07672711, -0.4843815, 0.5411765, 1, 0, 1,
-0.6522489, -0.3638588, -1.661805, 0.5372549, 1, 0, 1,
-0.6485174, 0.2534625, -2.284901, 0.5294118, 1, 0, 1,
-0.646562, -0.2681617, -1.449834, 0.5254902, 1, 0, 1,
-0.6440015, -1.305506, -1.543501, 0.5176471, 1, 0, 1,
-0.6319382, 0.2364535, -0.8144961, 0.5137255, 1, 0, 1,
-0.6249746, 0.5787582, -0.9113961, 0.5058824, 1, 0, 1,
-0.6232627, -0.06566599, -2.125462, 0.5019608, 1, 0, 1,
-0.6193428, -0.7380664, -3.294275, 0.4941176, 1, 0, 1,
-0.6187552, -0.4691488, -2.60179, 0.4862745, 1, 0, 1,
-0.6149822, -0.7230951, -2.197573, 0.4823529, 1, 0, 1,
-0.61435, -1.32191, -1.129348, 0.4745098, 1, 0, 1,
-0.6111207, -1.0508, -3.830981, 0.4705882, 1, 0, 1,
-0.6092999, -1.181825, -0.8899401, 0.4627451, 1, 0, 1,
-0.6079001, 0.8111038, -1.098638, 0.4588235, 1, 0, 1,
-0.6051081, 1.111171, -0.8329617, 0.4509804, 1, 0, 1,
-0.6024172, 0.2320221, -1.147493, 0.4470588, 1, 0, 1,
-0.5980872, 1.22559, 0.2671676, 0.4392157, 1, 0, 1,
-0.5973475, 0.05021983, -0.3120352, 0.4352941, 1, 0, 1,
-0.5955285, 0.2161014, -2.01458, 0.427451, 1, 0, 1,
-0.5901449, 0.3628464, -0.9980395, 0.4235294, 1, 0, 1,
-0.586885, -0.0128209, -1.734781, 0.4156863, 1, 0, 1,
-0.5820052, -1.763944, -3.485269, 0.4117647, 1, 0, 1,
-0.5797011, 0.4172033, -0.1864278, 0.4039216, 1, 0, 1,
-0.5788447, 0.2679159, -0.4057797, 0.3960784, 1, 0, 1,
-0.5762028, 0.4383335, -1.579297, 0.3921569, 1, 0, 1,
-0.5759134, -0.0557479, -2.475018, 0.3843137, 1, 0, 1,
-0.5748269, 0.2838569, -2.120261, 0.3803922, 1, 0, 1,
-0.5729632, -1.582137, -1.948949, 0.372549, 1, 0, 1,
-0.5725398, -0.1778688, -1.510138, 0.3686275, 1, 0, 1,
-0.5686141, 1.408727, -0.1025307, 0.3607843, 1, 0, 1,
-0.5662284, -0.1056511, -2.672323, 0.3568628, 1, 0, 1,
-0.5660317, 0.5256901, -0.5446121, 0.3490196, 1, 0, 1,
-0.5643654, -1.321884, -3.922201, 0.345098, 1, 0, 1,
-0.5637979, 0.6539569, 0.578082, 0.3372549, 1, 0, 1,
-0.5613375, 1.118875, -0.1265461, 0.3333333, 1, 0, 1,
-0.560425, -1.224695, -2.861878, 0.3254902, 1, 0, 1,
-0.5591717, -0.7536348, -3.257977, 0.3215686, 1, 0, 1,
-0.5551302, 0.02489265, -0.6341445, 0.3137255, 1, 0, 1,
-0.5516819, 0.5246608, -0.6521457, 0.3098039, 1, 0, 1,
-0.5439835, -0.02641029, -1.355104, 0.3019608, 1, 0, 1,
-0.5405293, -0.2176278, -1.328891, 0.2941177, 1, 0, 1,
-0.538101, 0.2436615, -2.553898, 0.2901961, 1, 0, 1,
-0.5361032, -0.4891188, -2.205003, 0.282353, 1, 0, 1,
-0.5354946, -1.017822, -2.253037, 0.2784314, 1, 0, 1,
-0.5329261, -0.2440248, -2.642816, 0.2705882, 1, 0, 1,
-0.5325407, 0.4730716, -0.859206, 0.2666667, 1, 0, 1,
-0.5319673, 0.307276, -0.5089497, 0.2588235, 1, 0, 1,
-0.5251237, -1.636869, -3.506187, 0.254902, 1, 0, 1,
-0.5232376, -1.979399, -1.615344, 0.2470588, 1, 0, 1,
-0.5203418, -0.9387087, -3.110863, 0.2431373, 1, 0, 1,
-0.5202088, 1.452196, -1.598466, 0.2352941, 1, 0, 1,
-0.5200987, 0.4788902, 0.7751125, 0.2313726, 1, 0, 1,
-0.5197975, -0.1122174, -1.553799, 0.2235294, 1, 0, 1,
-0.5175699, 0.2226294, -1.896852, 0.2196078, 1, 0, 1,
-0.5125123, -0.9423075, -2.744904, 0.2117647, 1, 0, 1,
-0.5110869, 1.510054, -1.529898, 0.2078431, 1, 0, 1,
-0.5108226, -0.321458, -2.110015, 0.2, 1, 0, 1,
-0.5068833, 1.319443, -0.669602, 0.1921569, 1, 0, 1,
-0.5054895, -0.4688624, -2.385921, 0.1882353, 1, 0, 1,
-0.5036958, -1.02828, -2.947782, 0.1803922, 1, 0, 1,
-0.5029554, -3.422612, -1.832215, 0.1764706, 1, 0, 1,
-0.4966303, 0.2715439, -1.554936, 0.1686275, 1, 0, 1,
-0.4899328, -0.1731078, -2.045805, 0.1647059, 1, 0, 1,
-0.4867574, 0.678781, 0.3669139, 0.1568628, 1, 0, 1,
-0.4853792, 0.5646623, 0.4219848, 0.1529412, 1, 0, 1,
-0.4851268, 0.6114583, -2.103863, 0.145098, 1, 0, 1,
-0.4849893, 0.1583828, 1.251721, 0.1411765, 1, 0, 1,
-0.4843995, 1.22539, 0.2332827, 0.1333333, 1, 0, 1,
-0.483305, -0.9206749, -2.790643, 0.1294118, 1, 0, 1,
-0.4808448, 0.1490508, -1.172216, 0.1215686, 1, 0, 1,
-0.4803629, 0.8373633, 1.268479, 0.1176471, 1, 0, 1,
-0.4791011, 1.446433, -0.4020041, 0.1098039, 1, 0, 1,
-0.4782244, -0.3593405, -3.426831, 0.1058824, 1, 0, 1,
-0.4745924, -1.528927, -2.942223, 0.09803922, 1, 0, 1,
-0.470858, 0.06718943, -1.193242, 0.09019608, 1, 0, 1,
-0.4637917, -0.9568981, -2.802839, 0.08627451, 1, 0, 1,
-0.4556476, 0.3748948, -1.76879, 0.07843138, 1, 0, 1,
-0.4538936, -0.509743, -2.124671, 0.07450981, 1, 0, 1,
-0.452298, -0.3654871, -1.903717, 0.06666667, 1, 0, 1,
-0.4461213, 0.1804773, -0.2803213, 0.0627451, 1, 0, 1,
-0.4446771, -0.5452494, -1.731954, 0.05490196, 1, 0, 1,
-0.4437849, 1.043686, 0.1431606, 0.05098039, 1, 0, 1,
-0.4412354, 0.6081291, 0.2461918, 0.04313726, 1, 0, 1,
-0.4355538, 0.4705455, -1.843889, 0.03921569, 1, 0, 1,
-0.4333378, -1.016378, -5.486015, 0.03137255, 1, 0, 1,
-0.4304068, 0.1075257, -1.549944, 0.02745098, 1, 0, 1,
-0.4296564, 0.7766633, 0.982006, 0.01960784, 1, 0, 1,
-0.4274893, 0.4593894, -2.614957, 0.01568628, 1, 0, 1,
-0.4265452, 0.8028598, -0.8427246, 0.007843138, 1, 0, 1,
-0.4232708, 1.669529, 1.142782, 0.003921569, 1, 0, 1,
-0.4221506, -0.1495572, -2.998039, 0, 1, 0.003921569, 1,
-0.4218405, -0.4802416, -0.8346164, 0, 1, 0.01176471, 1,
-0.4188023, -0.8962969, -1.757881, 0, 1, 0.01568628, 1,
-0.4157328, -0.5355153, -0.1311187, 0, 1, 0.02352941, 1,
-0.4117109, -0.7753769, -2.870331, 0, 1, 0.02745098, 1,
-0.3991894, 0.4200253, -0.56722, 0, 1, 0.03529412, 1,
-0.3976611, 0.03804132, -1.773311, 0, 1, 0.03921569, 1,
-0.395953, -0.3640814, -2.615975, 0, 1, 0.04705882, 1,
-0.3945237, -0.2091366, -0.04046312, 0, 1, 0.05098039, 1,
-0.3941318, 0.8872874, -0.1044074, 0, 1, 0.05882353, 1,
-0.3909461, -1.482581, -2.00476, 0, 1, 0.0627451, 1,
-0.3875005, 0.03771819, -1.296639, 0, 1, 0.07058824, 1,
-0.3843144, 1.157009, 0.7448173, 0, 1, 0.07450981, 1,
-0.3842711, 0.1262439, -1.523501, 0, 1, 0.08235294, 1,
-0.3832172, -0.4023495, -3.299914, 0, 1, 0.08627451, 1,
-0.3829546, 2.793966, 0.3491602, 0, 1, 0.09411765, 1,
-0.3797997, 0.03480072, -0.6627094, 0, 1, 0.1019608, 1,
-0.3785403, -0.6311461, -3.689755, 0, 1, 0.1058824, 1,
-0.376499, 0.4205416, -2.813969, 0, 1, 0.1137255, 1,
-0.3764841, 0.6609944, 0.9597095, 0, 1, 0.1176471, 1,
-0.3738465, 0.01254328, -1.975039, 0, 1, 0.1254902, 1,
-0.3727902, 1.771149, 0.5097175, 0, 1, 0.1294118, 1,
-0.3700067, 0.6607686, 1.58193, 0, 1, 0.1372549, 1,
-0.3648371, 0.934377, 0.1721509, 0, 1, 0.1411765, 1,
-0.3640823, -1.869384, -2.945882, 0, 1, 0.1490196, 1,
-0.362404, -0.01780601, -3.021272, 0, 1, 0.1529412, 1,
-0.3621359, -0.9676873, -4.747931, 0, 1, 0.1607843, 1,
-0.359812, 3.201943, 0.08501705, 0, 1, 0.1647059, 1,
-0.3597583, -0.5310002, -1.798239, 0, 1, 0.172549, 1,
-0.3561505, 0.4109288, -1.563756, 0, 1, 0.1764706, 1,
-0.3556091, 0.4950279, 0.2133574, 0, 1, 0.1843137, 1,
-0.3543383, -1.284032, -4.110312, 0, 1, 0.1882353, 1,
-0.353116, -1.83849, -3.728571, 0, 1, 0.1960784, 1,
-0.3528333, 0.6713179, -1.771872, 0, 1, 0.2039216, 1,
-0.3506576, 0.9793061, 0.1448717, 0, 1, 0.2078431, 1,
-0.3500055, 0.09523794, -1.247976, 0, 1, 0.2156863, 1,
-0.3478308, 0.6080338, -1.506856, 0, 1, 0.2196078, 1,
-0.3475857, -0.4136466, -1.805688, 0, 1, 0.227451, 1,
-0.3472253, -0.5804992, -2.607691, 0, 1, 0.2313726, 1,
-0.3384722, -0.2214839, -1.330759, 0, 1, 0.2392157, 1,
-0.3372171, 0.2872508, -0.3455001, 0, 1, 0.2431373, 1,
-0.3368753, -1.297791, -4.586859, 0, 1, 0.2509804, 1,
-0.3366899, 1.251038, 0.2912539, 0, 1, 0.254902, 1,
-0.3363715, 1.191252, -0.3448853, 0, 1, 0.2627451, 1,
-0.3359503, 0.5500634, -1.279654, 0, 1, 0.2666667, 1,
-0.3341779, 1.85106, 0.5303442, 0, 1, 0.2745098, 1,
-0.3310627, 1.824212, 0.8069157, 0, 1, 0.2784314, 1,
-0.3301861, 1.873606, 1.922589, 0, 1, 0.2862745, 1,
-0.3269737, 1.046999, -1.422125, 0, 1, 0.2901961, 1,
-0.3240895, 0.2904542, -0.5819867, 0, 1, 0.2980392, 1,
-0.3195798, -1.31824, -1.534516, 0, 1, 0.3058824, 1,
-0.3195017, -0.3845105, -2.300297, 0, 1, 0.3098039, 1,
-0.318367, -1.504207, -2.09705, 0, 1, 0.3176471, 1,
-0.3170826, -1.715043, -3.56992, 0, 1, 0.3215686, 1,
-0.3161528, 0.05414801, -1.757367, 0, 1, 0.3294118, 1,
-0.3159607, 2.470229, -0.5298966, 0, 1, 0.3333333, 1,
-0.3139279, -0.9704698, -1.340018, 0, 1, 0.3411765, 1,
-0.313173, -0.8662289, -4.02651, 0, 1, 0.345098, 1,
-0.309, 0.5804546, -1.267694, 0, 1, 0.3529412, 1,
-0.308918, 0.5997798, -0.0691975, 0, 1, 0.3568628, 1,
-0.3042539, 1.623087, 0.1746909, 0, 1, 0.3647059, 1,
-0.3011528, 0.06388786, -0.4238971, 0, 1, 0.3686275, 1,
-0.2953609, -0.2415436, -2.122898, 0, 1, 0.3764706, 1,
-0.2905525, -0.6932389, -3.159756, 0, 1, 0.3803922, 1,
-0.2881598, 1.261024, 0.7576679, 0, 1, 0.3882353, 1,
-0.2881334, 2.365636, 0.0812967, 0, 1, 0.3921569, 1,
-0.2840095, -1.26737, -4.597138, 0, 1, 0.4, 1,
-0.2831321, 1.750876, 0.07142767, 0, 1, 0.4078431, 1,
-0.2672787, 1.13214, -0.06096675, 0, 1, 0.4117647, 1,
-0.2569699, 0.6341803, -0.006111831, 0, 1, 0.4196078, 1,
-0.2508241, 0.9859175, -0.2337688, 0, 1, 0.4235294, 1,
-0.2478249, -0.09503863, -1.68647, 0, 1, 0.4313726, 1,
-0.2470925, 0.1785013, 0.6463861, 0, 1, 0.4352941, 1,
-0.244195, 2.141358, -0.4229367, 0, 1, 0.4431373, 1,
-0.2351841, 0.4856171, -2.288314, 0, 1, 0.4470588, 1,
-0.2320354, 0.03350968, -3.505282, 0, 1, 0.454902, 1,
-0.2317918, 0.8463188, 1.223206, 0, 1, 0.4588235, 1,
-0.2314774, -0.2699053, -3.171983, 0, 1, 0.4666667, 1,
-0.2301071, -0.3611052, -1.869795, 0, 1, 0.4705882, 1,
-0.2292109, -0.06867804, 0.2365028, 0, 1, 0.4784314, 1,
-0.2278899, 1.606797, -1.615108, 0, 1, 0.4823529, 1,
-0.2243325, -1.908542, -2.565838, 0, 1, 0.4901961, 1,
-0.2240826, 2.23967, 0.7191607, 0, 1, 0.4941176, 1,
-0.2223322, -0.9182327, -3.087059, 0, 1, 0.5019608, 1,
-0.2202878, -0.4992379, -3.565713, 0, 1, 0.509804, 1,
-0.2200584, -1.254117, -2.287399, 0, 1, 0.5137255, 1,
-0.2167057, 0.7877243, -0.4179931, 0, 1, 0.5215687, 1,
-0.2094337, -1.607775, -2.020047, 0, 1, 0.5254902, 1,
-0.2057998, 1.230473, 0.1050019, 0, 1, 0.5333334, 1,
-0.2024814, 1.33621, 0.1457847, 0, 1, 0.5372549, 1,
-0.202136, 0.1024264, -0.8687623, 0, 1, 0.5450981, 1,
-0.2004595, -0.809038, -1.536916, 0, 1, 0.5490196, 1,
-0.1998871, 1.836225, 0.08252197, 0, 1, 0.5568628, 1,
-0.1916751, -1.49899, -3.593817, 0, 1, 0.5607843, 1,
-0.1907276, 0.3759137, -2.05055, 0, 1, 0.5686275, 1,
-0.1893594, 1.097375, -1.437314, 0, 1, 0.572549, 1,
-0.1880275, -0.9078717, -3.306024, 0, 1, 0.5803922, 1,
-0.1863278, 1.657223, 0.4695992, 0, 1, 0.5843138, 1,
-0.1810847, -1.455712, -1.351399, 0, 1, 0.5921569, 1,
-0.1800109, 1.11824, -0.2442895, 0, 1, 0.5960785, 1,
-0.1775184, -1.524803, -4.991137, 0, 1, 0.6039216, 1,
-0.1758922, 2.261335, 0.05695171, 0, 1, 0.6117647, 1,
-0.1684843, 0.6043361, 1.028314, 0, 1, 0.6156863, 1,
-0.1618205, -0.1278744, -0.2621993, 0, 1, 0.6235294, 1,
-0.1608986, -0.1498182, -2.442551, 0, 1, 0.627451, 1,
-0.1545199, 0.1429208, -0.9227532, 0, 1, 0.6352941, 1,
-0.153463, -0.7616904, -2.636457, 0, 1, 0.6392157, 1,
-0.1530146, -0.6107128, -3.448126, 0, 1, 0.6470588, 1,
-0.1516921, -0.0214762, -2.985178, 0, 1, 0.6509804, 1,
-0.1513592, 0.1899673, -3.143046, 0, 1, 0.6588235, 1,
-0.1505634, -0.08353911, -4.217021, 0, 1, 0.6627451, 1,
-0.1500584, 0.7941347, 1.035678, 0, 1, 0.6705883, 1,
-0.1482643, 0.02651702, -0.9044288, 0, 1, 0.6745098, 1,
-0.1370591, -0.2550109, -3.230451, 0, 1, 0.682353, 1,
-0.1353106, 0.04455393, -0.5671654, 0, 1, 0.6862745, 1,
-0.1294702, 0.01995798, -0.9843349, 0, 1, 0.6941177, 1,
-0.1283597, 0.03453847, -0.8369236, 0, 1, 0.7019608, 1,
-0.1251455, 0.2492031, -1.029134, 0, 1, 0.7058824, 1,
-0.1220943, 0.6888019, 0.7684669, 0, 1, 0.7137255, 1,
-0.1204304, 0.9755847, -0.5469039, 0, 1, 0.7176471, 1,
-0.1176625, 0.3996514, -0.06229842, 0, 1, 0.7254902, 1,
-0.1147077, 1.894675, -0.2950393, 0, 1, 0.7294118, 1,
-0.1117066, 0.7193949, -0.1604035, 0, 1, 0.7372549, 1,
-0.1090559, 1.432214, 1.627272, 0, 1, 0.7411765, 1,
-0.1087285, 2.600389, 0.4940162, 0, 1, 0.7490196, 1,
-0.09996804, -1.468602, -3.092815, 0, 1, 0.7529412, 1,
-0.09970237, 0.4823538, -1.081089, 0, 1, 0.7607843, 1,
-0.09967551, 0.098835, -0.6018174, 0, 1, 0.7647059, 1,
-0.09641016, -0.3001029, -3.221485, 0, 1, 0.772549, 1,
-0.09641001, -0.366639, -3.745612, 0, 1, 0.7764706, 1,
-0.09366338, 1.833301, -0.9481926, 0, 1, 0.7843137, 1,
-0.09314629, -0.6662234, -3.696142, 0, 1, 0.7882353, 1,
-0.09236894, -0.07389322, -3.677196, 0, 1, 0.7960784, 1,
-0.09041878, -0.2127651, -2.07728, 0, 1, 0.8039216, 1,
-0.08841044, -0.1930322, -4.4642, 0, 1, 0.8078431, 1,
-0.08580469, 0.2193816, -0.2621602, 0, 1, 0.8156863, 1,
-0.08345523, 0.1956637, 0.4063131, 0, 1, 0.8196079, 1,
-0.07494382, 0.9177166, -2.068882, 0, 1, 0.827451, 1,
-0.07209143, 0.07603185, -1.794239, 0, 1, 0.8313726, 1,
-0.07113385, 0.3915214, 0.3747657, 0, 1, 0.8392157, 1,
-0.07073155, 1.167858, 0.3136832, 0, 1, 0.8431373, 1,
-0.06760383, -0.2456214, -4.125607, 0, 1, 0.8509804, 1,
-0.06257039, -0.4966255, -2.719511, 0, 1, 0.854902, 1,
-0.06161224, -1.043958, -3.415583, 0, 1, 0.8627451, 1,
-0.05802362, 0.6772851, 0.03462001, 0, 1, 0.8666667, 1,
-0.0492466, -0.4408232, -2.756132, 0, 1, 0.8745098, 1,
-0.048049, -0.8240342, -2.846201, 0, 1, 0.8784314, 1,
-0.04556352, 0.8108236, -0.51608, 0, 1, 0.8862745, 1,
-0.04297132, -0.08240207, -1.759024, 0, 1, 0.8901961, 1,
-0.0426346, 0.9778458, -0.1997467, 0, 1, 0.8980392, 1,
-0.04007919, 0.881564, -1.045454, 0, 1, 0.9058824, 1,
-0.03968022, 0.8529663, -0.1364829, 0, 1, 0.9098039, 1,
-0.03014757, -1.649496, -2.784852, 0, 1, 0.9176471, 1,
-0.02797137, -0.6862559, -4.072664, 0, 1, 0.9215686, 1,
-0.02245632, -2.482274, -3.418421, 0, 1, 0.9294118, 1,
-0.02095814, 0.2044338, 0.7236386, 0, 1, 0.9333333, 1,
-0.0191567, 0.9243364, 1.149758, 0, 1, 0.9411765, 1,
-0.01668177, -0.5463355, -2.637724, 0, 1, 0.945098, 1,
-0.01616738, -0.577283, -2.41306, 0, 1, 0.9529412, 1,
-0.01436776, -0.4741887, -1.895301, 0, 1, 0.9568627, 1,
-0.01396695, 0.03345882, 1.922338, 0, 1, 0.9647059, 1,
-0.01385926, -1.114772, -3.430138, 0, 1, 0.9686275, 1,
-0.006100443, 0.5851644, 1.309874, 0, 1, 0.9764706, 1,
-0.003861455, -0.6866872, -4.089624, 0, 1, 0.9803922, 1,
-0.003727951, -0.1689416, -4.67272, 0, 1, 0.9882353, 1,
-0.003390071, 0.3332663, 0.3997003, 0, 1, 0.9921569, 1,
-0.002562956, -1.347465, -2.601873, 0, 1, 1, 1,
0.0004140551, 0.5653901, -0.7142166, 0, 0.9921569, 1, 1,
0.002969487, 0.3176269, -0.0294026, 0, 0.9882353, 1, 1,
0.005229981, 0.4869336, -0.8354834, 0, 0.9803922, 1, 1,
0.00676459, 0.663893, 0.5275166, 0, 0.9764706, 1, 1,
0.0100875, 1.39926, 0.9669452, 0, 0.9686275, 1, 1,
0.01366604, 0.1100511, -0.7293563, 0, 0.9647059, 1, 1,
0.01445786, 0.9546666, 0.5004068, 0, 0.9568627, 1, 1,
0.02005704, -0.4523764, 3.60393, 0, 0.9529412, 1, 1,
0.02306749, -0.268826, 3.44938, 0, 0.945098, 1, 1,
0.02855582, -0.08465476, 3.528192, 0, 0.9411765, 1, 1,
0.03203022, -0.7557517, 3.512296, 0, 0.9333333, 1, 1,
0.04399429, -1.016334, 3.496423, 0, 0.9294118, 1, 1,
0.04875639, -1.238388, 3.47671, 0, 0.9215686, 1, 1,
0.05369019, 0.9241845, -0.3157105, 0, 0.9176471, 1, 1,
0.05380053, -0.2103434, 2.945313, 0, 0.9098039, 1, 1,
0.05750565, 0.9941285, 0.07744315, 0, 0.9058824, 1, 1,
0.06280662, 1.179779, -0.2944402, 0, 0.8980392, 1, 1,
0.06629647, 0.8793578, -0.04915101, 0, 0.8901961, 1, 1,
0.06636392, -0.2339772, 2.287574, 0, 0.8862745, 1, 1,
0.06666376, 1.807693, -0.9544778, 0, 0.8784314, 1, 1,
0.06841587, 0.9575985, 0.4488444, 0, 0.8745098, 1, 1,
0.06959569, 1.451064, 0.6245191, 0, 0.8666667, 1, 1,
0.07933298, 0.127524, 0.4377588, 0, 0.8627451, 1, 1,
0.08119831, -1.067745, 2.814979, 0, 0.854902, 1, 1,
0.08154903, 0.5278073, -0.1201596, 0, 0.8509804, 1, 1,
0.08194302, 0.6789128, -0.3397869, 0, 0.8431373, 1, 1,
0.08789648, -0.4853377, 3.559264, 0, 0.8392157, 1, 1,
0.08805886, 1.17072, 0.3931223, 0, 0.8313726, 1, 1,
0.08969611, 0.3658358, 0.5915738, 0, 0.827451, 1, 1,
0.09784996, -0.3052002, 1.815173, 0, 0.8196079, 1, 1,
0.1009772, -1.30049, 3.199647, 0, 0.8156863, 1, 1,
0.1018409, 2.309463, 1.541257, 0, 0.8078431, 1, 1,
0.1030459, 0.5583049, -0.06188411, 0, 0.8039216, 1, 1,
0.1056569, -0.4185715, 4.216122, 0, 0.7960784, 1, 1,
0.1077563, 0.3822831, -0.6338671, 0, 0.7882353, 1, 1,
0.1089567, -1.39664, 1.054561, 0, 0.7843137, 1, 1,
0.1093998, -0.1088924, 4.540066, 0, 0.7764706, 1, 1,
0.1120373, 0.03932003, 2.335764, 0, 0.772549, 1, 1,
0.1158172, 0.743281, -1.117668, 0, 0.7647059, 1, 1,
0.1239142, -1.036761, 2.419781, 0, 0.7607843, 1, 1,
0.1271747, -0.3774094, 2.754512, 0, 0.7529412, 1, 1,
0.1351692, 0.7925544, 0.4122423, 0, 0.7490196, 1, 1,
0.1357303, 2.331597, 0.609347, 0, 0.7411765, 1, 1,
0.1359128, 0.8020243, 1.678103, 0, 0.7372549, 1, 1,
0.1365857, 0.2373734, 0.3412979, 0, 0.7294118, 1, 1,
0.1371116, -0.5665179, 3.914852, 0, 0.7254902, 1, 1,
0.1405609, 0.3069142, 0.6528169, 0, 0.7176471, 1, 1,
0.140564, -0.006815459, 0.177826, 0, 0.7137255, 1, 1,
0.1440089, -1.663365, 2.712384, 0, 0.7058824, 1, 1,
0.1452514, 0.5765358, 0.1381129, 0, 0.6980392, 1, 1,
0.1458551, 0.01228443, 3.190912, 0, 0.6941177, 1, 1,
0.1465897, 0.008822229, 2.363212, 0, 0.6862745, 1, 1,
0.1480419, 1.139614, 0.293629, 0, 0.682353, 1, 1,
0.1487561, 0.5881146, -0.6164983, 0, 0.6745098, 1, 1,
0.1501373, -1.034438, 4.076035, 0, 0.6705883, 1, 1,
0.1513715, 0.6363694, 1.404069, 0, 0.6627451, 1, 1,
0.1606008, 0.6055337, -1.776709, 0, 0.6588235, 1, 1,
0.162699, 0.7014412, 0.9318509, 0, 0.6509804, 1, 1,
0.1735286, 1.446283, 1.103951, 0, 0.6470588, 1, 1,
0.1758414, 1.543201, 0.2337343, 0, 0.6392157, 1, 1,
0.1764265, -0.3538958, 1.313036, 0, 0.6352941, 1, 1,
0.1778417, -0.7966714, 5.219667, 0, 0.627451, 1, 1,
0.18027, 0.3916219, 0.1067339, 0, 0.6235294, 1, 1,
0.1812839, 0.50844, 0.2162189, 0, 0.6156863, 1, 1,
0.1832896, -0.5246519, 1.121816, 0, 0.6117647, 1, 1,
0.1836433, -1.887052, 2.948359, 0, 0.6039216, 1, 1,
0.1854128, -0.453274, 3.300984, 0, 0.5960785, 1, 1,
0.1908717, -0.9909088, 4.8994, 0, 0.5921569, 1, 1,
0.1910446, -0.913913, 1.717953, 0, 0.5843138, 1, 1,
0.1913161, -0.7454953, 4.918073, 0, 0.5803922, 1, 1,
0.1994425, 1.094881, 0.5981938, 0, 0.572549, 1, 1,
0.1995066, 1.612527, -0.4544744, 0, 0.5686275, 1, 1,
0.2042608, 0.604423, 1.253591, 0, 0.5607843, 1, 1,
0.2066031, -0.4341323, 2.85833, 0, 0.5568628, 1, 1,
0.2067432, -2.228967, 4.250325, 0, 0.5490196, 1, 1,
0.2097876, 0.1943228, 2.331207, 0, 0.5450981, 1, 1,
0.2100727, -1.692442, 2.647863, 0, 0.5372549, 1, 1,
0.2110602, -0.0994072, 2.233231, 0, 0.5333334, 1, 1,
0.2125483, -0.4932637, 3.458101, 0, 0.5254902, 1, 1,
0.2213567, -1.018877, 3.89532, 0, 0.5215687, 1, 1,
0.2221677, 0.7712186, 0.07058293, 0, 0.5137255, 1, 1,
0.2233452, -0.03420276, 1.911265, 0, 0.509804, 1, 1,
0.2243748, 0.4454406, 0.7695277, 0, 0.5019608, 1, 1,
0.2287482, -0.2343959, 1.985565, 0, 0.4941176, 1, 1,
0.2298653, 0.5003741, 0.439113, 0, 0.4901961, 1, 1,
0.2311116, -0.8513318, 3.194264, 0, 0.4823529, 1, 1,
0.2339428, -1.344738, 2.9034, 0, 0.4784314, 1, 1,
0.2368557, -0.82986, 3.330232, 0, 0.4705882, 1, 1,
0.2381522, -1.100841, 3.895199, 0, 0.4666667, 1, 1,
0.2401763, -0.2724851, 0.6706992, 0, 0.4588235, 1, 1,
0.241168, -0.7180237, 3.267111, 0, 0.454902, 1, 1,
0.2433892, 0.6124046, 0.284964, 0, 0.4470588, 1, 1,
0.2439851, -1.35959, 4.455711, 0, 0.4431373, 1, 1,
0.2460923, -0.5328272, 1.10052, 0, 0.4352941, 1, 1,
0.2479187, 0.8598386, -1.700398, 0, 0.4313726, 1, 1,
0.2503202, 0.1239832, 1.31364, 0, 0.4235294, 1, 1,
0.2519251, -2.166272, 4.157184, 0, 0.4196078, 1, 1,
0.2551247, -0.9974982, 2.67553, 0, 0.4117647, 1, 1,
0.2558578, 0.06245046, 2.246576, 0, 0.4078431, 1, 1,
0.2585219, -0.4922582, 4.243655, 0, 0.4, 1, 1,
0.2666121, 1.25435, -1.713869, 0, 0.3921569, 1, 1,
0.2680107, 0.2187357, 1.631916, 0, 0.3882353, 1, 1,
0.2709473, 1.360206, -1.4418, 0, 0.3803922, 1, 1,
0.2778938, 0.5958595, -0.5947219, 0, 0.3764706, 1, 1,
0.285105, 1.213328, 1.19368, 0, 0.3686275, 1, 1,
0.2862024, -1.20803, 2.227156, 0, 0.3647059, 1, 1,
0.286458, 1.340248, 1.862686, 0, 0.3568628, 1, 1,
0.2864934, 0.2954792, 1.112079, 0, 0.3529412, 1, 1,
0.2880588, -0.8633749, 3.845888, 0, 0.345098, 1, 1,
0.2914201, 0.1453028, 0.1180347, 0, 0.3411765, 1, 1,
0.298347, 0.4790365, -0.4212684, 0, 0.3333333, 1, 1,
0.2986622, -0.3182534, 2.473871, 0, 0.3294118, 1, 1,
0.3035684, 0.04857837, 0.1364337, 0, 0.3215686, 1, 1,
0.306961, 1.055607, 1.110385, 0, 0.3176471, 1, 1,
0.3121125, -1.077504, 3.116509, 0, 0.3098039, 1, 1,
0.3195227, -2.585378, 2.841546, 0, 0.3058824, 1, 1,
0.3195652, -0.4865932, 4.15887, 0, 0.2980392, 1, 1,
0.3212042, -0.5328457, 2.343852, 0, 0.2901961, 1, 1,
0.322412, 1.904974, 0.1184819, 0, 0.2862745, 1, 1,
0.323853, -0.1757464, 0.5994771, 0, 0.2784314, 1, 1,
0.326362, 1.829136, 0.2567993, 0, 0.2745098, 1, 1,
0.3266596, 0.5496575, 0.5725995, 0, 0.2666667, 1, 1,
0.3267558, 0.5112922, 0.903733, 0, 0.2627451, 1, 1,
0.3280406, -0.02142204, 1.334948, 0, 0.254902, 1, 1,
0.3316994, -0.1822803, 1.151606, 0, 0.2509804, 1, 1,
0.3318917, -2.344002, 2.275039, 0, 0.2431373, 1, 1,
0.336035, 0.6904086, -1.672609, 0, 0.2392157, 1, 1,
0.3364541, 1.123043, -0.2367556, 0, 0.2313726, 1, 1,
0.3412799, 0.2141996, 2.06902, 0, 0.227451, 1, 1,
0.342668, -0.8408418, 2.809297, 0, 0.2196078, 1, 1,
0.3495286, -0.8826129, 5.56002, 0, 0.2156863, 1, 1,
0.3526917, 0.2372474, 1.561229, 0, 0.2078431, 1, 1,
0.356678, -1.044726, 3.033826, 0, 0.2039216, 1, 1,
0.3609468, -1.079149, 2.674632, 0, 0.1960784, 1, 1,
0.3635035, -1.686027, 4.528971, 0, 0.1882353, 1, 1,
0.3651671, 2.565504, 0.521284, 0, 0.1843137, 1, 1,
0.3701331, -0.207185, 2.297474, 0, 0.1764706, 1, 1,
0.3753811, -0.7198951, 1.722686, 0, 0.172549, 1, 1,
0.3814054, 0.8786262, 1.449209, 0, 0.1647059, 1, 1,
0.3851207, 0.005163369, 1.155333, 0, 0.1607843, 1, 1,
0.3874022, -1.053428, 2.614491, 0, 0.1529412, 1, 1,
0.3900861, -0.1556002, 2.868181, 0, 0.1490196, 1, 1,
0.3905167, 0.3427564, 1.563347, 0, 0.1411765, 1, 1,
0.3925824, 0.4601892, 0.6557966, 0, 0.1372549, 1, 1,
0.3933756, -0.6657631, 2.86192, 0, 0.1294118, 1, 1,
0.4031941, -0.9225286, 2.174169, 0, 0.1254902, 1, 1,
0.4033796, 2.234706, 1.083004, 0, 0.1176471, 1, 1,
0.4050003, -0.07624792, 1.550746, 0, 0.1137255, 1, 1,
0.4061372, 0.7505166, -0.7369684, 0, 0.1058824, 1, 1,
0.409785, 1.55924, 1.451951, 0, 0.09803922, 1, 1,
0.4116715, 1.719853, -0.2510183, 0, 0.09411765, 1, 1,
0.4135831, -0.8412012, 1.333153, 0, 0.08627451, 1, 1,
0.4209875, -0.248626, 3.003719, 0, 0.08235294, 1, 1,
0.4343866, 0.3372722, 2.067907, 0, 0.07450981, 1, 1,
0.4346318, -0.1451531, 0.9828264, 0, 0.07058824, 1, 1,
0.4353319, -0.1236085, 2.786788, 0, 0.0627451, 1, 1,
0.4365404, 1.65475, -0.6731712, 0, 0.05882353, 1, 1,
0.443507, 0.7888594, 1.794995, 0, 0.05098039, 1, 1,
0.4459158, 0.7257818, 0.259007, 0, 0.04705882, 1, 1,
0.4477208, -1.434192, 2.913498, 0, 0.03921569, 1, 1,
0.458048, 0.02234766, -0.3456673, 0, 0.03529412, 1, 1,
0.4583987, 0.0391073, -0.1837843, 0, 0.02745098, 1, 1,
0.4588268, 1.026349, 0.6731042, 0, 0.02352941, 1, 1,
0.4627682, -1.868986, 2.457335, 0, 0.01568628, 1, 1,
0.4635756, 0.3887492, -0.933349, 0, 0.01176471, 1, 1,
0.4638835, -0.257099, 0.7947772, 0, 0.003921569, 1, 1,
0.46725, -0.7935744, 3.403301, 0.003921569, 0, 1, 1,
0.4782916, -0.6546617, 2.613604, 0.007843138, 0, 1, 1,
0.478929, 1.513335, 1.266319, 0.01568628, 0, 1, 1,
0.4797626, -0.2570468, 1.626324, 0.01960784, 0, 1, 1,
0.4862535, 0.7064549, 2.080508, 0.02745098, 0, 1, 1,
0.4872045, -0.01491593, 1.027061, 0.03137255, 0, 1, 1,
0.4935715, -0.8531941, 3.021204, 0.03921569, 0, 1, 1,
0.4947815, 0.8019736, 1.958137, 0.04313726, 0, 1, 1,
0.4960047, 0.9683234, -0.4361496, 0.05098039, 0, 1, 1,
0.500973, 1.959731, -0.07320776, 0.05490196, 0, 1, 1,
0.5140295, -0.2448952, 2.654262, 0.0627451, 0, 1, 1,
0.5140502, -0.04005095, 1.459411, 0.06666667, 0, 1, 1,
0.5159842, 1.430677, 0.1554604, 0.07450981, 0, 1, 1,
0.523324, -0.9657651, 2.850381, 0.07843138, 0, 1, 1,
0.5233836, 2.331687, 1.855367, 0.08627451, 0, 1, 1,
0.5281576, 0.6929294, 1.081717, 0.09019608, 0, 1, 1,
0.5382266, -0.0166646, 2.808546, 0.09803922, 0, 1, 1,
0.5418398, -0.8552736, 1.415939, 0.1058824, 0, 1, 1,
0.5425002, -0.1685513, 2.723451, 0.1098039, 0, 1, 1,
0.5462691, -0.356854, 3.188637, 0.1176471, 0, 1, 1,
0.548683, -0.01584434, 2.04616, 0.1215686, 0, 1, 1,
0.5492672, 0.4651349, -0.9200372, 0.1294118, 0, 1, 1,
0.5506193, -0.5648099, 2.590796, 0.1333333, 0, 1, 1,
0.556388, -0.6415895, 2.623184, 0.1411765, 0, 1, 1,
0.5568125, 0.687824, 2.018191, 0.145098, 0, 1, 1,
0.557228, 0.2262495, 0.4482495, 0.1529412, 0, 1, 1,
0.5595771, -0.3801742, 1.530051, 0.1568628, 0, 1, 1,
0.5616386, 1.046353, 1.246024, 0.1647059, 0, 1, 1,
0.5627598, 1.719436, -0.5132144, 0.1686275, 0, 1, 1,
0.5657636, 0.3496785, 3.506656, 0.1764706, 0, 1, 1,
0.5659375, 0.2090615, 2.007575, 0.1803922, 0, 1, 1,
0.5717961, -0.1464301, 2.838813, 0.1882353, 0, 1, 1,
0.5742557, 2.638172, 1.037605, 0.1921569, 0, 1, 1,
0.5745314, -0.4840831, 1.885477, 0.2, 0, 1, 1,
0.5755965, -0.08046784, 1.369033, 0.2078431, 0, 1, 1,
0.5768501, 0.1156777, 0.06070269, 0.2117647, 0, 1, 1,
0.5785456, -1.434193, 1.583464, 0.2196078, 0, 1, 1,
0.5827534, 0.1382067, 1.514865, 0.2235294, 0, 1, 1,
0.5841635, 0.3831493, -0.7693414, 0.2313726, 0, 1, 1,
0.5937603, -1.509658, 0.05923624, 0.2352941, 0, 1, 1,
0.5944157, 0.8672972, 1.510302, 0.2431373, 0, 1, 1,
0.6052665, -0.8899153, 3.275275, 0.2470588, 0, 1, 1,
0.6066871, -0.1633147, 2.329319, 0.254902, 0, 1, 1,
0.6091048, 1.655045, -0.5047559, 0.2588235, 0, 1, 1,
0.6092451, -1.367972, 2.797963, 0.2666667, 0, 1, 1,
0.6129245, -0.7520732, 3.02248, 0.2705882, 0, 1, 1,
0.6165389, 0.7729726, 0.6014301, 0.2784314, 0, 1, 1,
0.6179426, 0.7183782, 2.535486, 0.282353, 0, 1, 1,
0.6187265, 1.046919, -0.1368087, 0.2901961, 0, 1, 1,
0.6214068, -0.6369801, 2.109231, 0.2941177, 0, 1, 1,
0.6224339, 0.02675226, 2.045292, 0.3019608, 0, 1, 1,
0.6235946, 0.3591856, 2.21377, 0.3098039, 0, 1, 1,
0.6259319, 0.3341835, 1.169592, 0.3137255, 0, 1, 1,
0.6329262, -1.13357, 0.5081466, 0.3215686, 0, 1, 1,
0.6376731, -0.05674675, 0.9964317, 0.3254902, 0, 1, 1,
0.6391183, -0.24505, 1.620844, 0.3333333, 0, 1, 1,
0.642446, -2.252892, 1.453356, 0.3372549, 0, 1, 1,
0.6450002, -1.662015, 2.714242, 0.345098, 0, 1, 1,
0.6484522, 1.66112, 0.5332552, 0.3490196, 0, 1, 1,
0.652544, 0.4335927, 3.260139, 0.3568628, 0, 1, 1,
0.6544602, 1.198049, -0.05234079, 0.3607843, 0, 1, 1,
0.6549335, -1.483236, 3.695867, 0.3686275, 0, 1, 1,
0.6562057, 0.7133806, -0.03982479, 0.372549, 0, 1, 1,
0.6572676, 1.013649, -0.4019333, 0.3803922, 0, 1, 1,
0.6608843, 1.364906, 1.292341, 0.3843137, 0, 1, 1,
0.6683306, 1.135888, 0.5533502, 0.3921569, 0, 1, 1,
0.6702881, 0.01316385, 1.568996, 0.3960784, 0, 1, 1,
0.6737742, -1.485492, 3.252736, 0.4039216, 0, 1, 1,
0.6759618, -1.164097, 3.000532, 0.4117647, 0, 1, 1,
0.6770288, -1.33596, 0.9475659, 0.4156863, 0, 1, 1,
0.6775898, 1.386276, 1.443852, 0.4235294, 0, 1, 1,
0.6799845, 0.2385563, 0.3796604, 0.427451, 0, 1, 1,
0.6814935, 0.8067099, 0.3066426, 0.4352941, 0, 1, 1,
0.6892106, -0.7240915, 1.853017, 0.4392157, 0, 1, 1,
0.6901492, 1.477372, 0.379632, 0.4470588, 0, 1, 1,
0.6923799, -0.8326722, 2.971481, 0.4509804, 0, 1, 1,
0.6926609, 0.06835617, 2.971198, 0.4588235, 0, 1, 1,
0.6939089, 0.3863819, 0.3845712, 0.4627451, 0, 1, 1,
0.6940807, -0.01049908, 2.045636, 0.4705882, 0, 1, 1,
0.6947526, 1.112583, 0.9457998, 0.4745098, 0, 1, 1,
0.6951088, -0.798041, 2.843196, 0.4823529, 0, 1, 1,
0.7006965, -0.1801199, 3.331918, 0.4862745, 0, 1, 1,
0.7043562, -0.713712, 4.037944, 0.4941176, 0, 1, 1,
0.7144753, -0.8063297, 2.281699, 0.5019608, 0, 1, 1,
0.71747, -0.7497137, 3.036711, 0.5058824, 0, 1, 1,
0.7187489, 1.612143, 0.1624361, 0.5137255, 0, 1, 1,
0.7207591, -0.5068122, 3.46733, 0.5176471, 0, 1, 1,
0.7224804, 0.1232231, 1.512489, 0.5254902, 0, 1, 1,
0.7242134, 1.662642, -1.165934, 0.5294118, 0, 1, 1,
0.725444, -1.837337, 1.90713, 0.5372549, 0, 1, 1,
0.7257633, 1.364229, 0.03236172, 0.5411765, 0, 1, 1,
0.7271225, 0.4891226, -0.1809785, 0.5490196, 0, 1, 1,
0.7296606, -0.2806333, 1.237923, 0.5529412, 0, 1, 1,
0.7333176, -1.119932, 0.8828421, 0.5607843, 0, 1, 1,
0.7365751, -1.870447, 0.7827908, 0.5647059, 0, 1, 1,
0.7367666, -0.9376737, 1.274604, 0.572549, 0, 1, 1,
0.7418573, -0.9173782, 2.651481, 0.5764706, 0, 1, 1,
0.7471672, -0.9333445, 2.063852, 0.5843138, 0, 1, 1,
0.7476504, 0.3088754, 1.591015, 0.5882353, 0, 1, 1,
0.7520551, -0.1480685, 0.6283254, 0.5960785, 0, 1, 1,
0.7576827, 0.5311921, -1.577449, 0.6039216, 0, 1, 1,
0.7664635, 0.7905403, -0.5855173, 0.6078432, 0, 1, 1,
0.7778466, -0.4036582, 1.425664, 0.6156863, 0, 1, 1,
0.7780105, 0.2028955, 0.08221653, 0.6196079, 0, 1, 1,
0.782811, 0.7192611, 0.705, 0.627451, 0, 1, 1,
0.7885756, 0.9379816, -0.03051252, 0.6313726, 0, 1, 1,
0.7924612, 0.4384339, 0.2671296, 0.6392157, 0, 1, 1,
0.7930464, -0.6601337, 2.807796, 0.6431373, 0, 1, 1,
0.8044687, -2.466755, 1.469525, 0.6509804, 0, 1, 1,
0.804711, 0.1064877, 1.1417, 0.654902, 0, 1, 1,
0.8086904, 0.5173188, 1.072681, 0.6627451, 0, 1, 1,
0.8138925, 1.184257, 1.030508, 0.6666667, 0, 1, 1,
0.8199169, -0.01843723, 3.246745, 0.6745098, 0, 1, 1,
0.8243379, 1.028634, -0.141754, 0.6784314, 0, 1, 1,
0.8279294, -2.158601, 1.275754, 0.6862745, 0, 1, 1,
0.8281775, 0.7945019, 0.811175, 0.6901961, 0, 1, 1,
0.8294533, 1.911857, 0.2823354, 0.6980392, 0, 1, 1,
0.8302417, 0.305348, 1.149402, 0.7058824, 0, 1, 1,
0.8312745, 0.9518913, 1.598988, 0.7098039, 0, 1, 1,
0.8382894, 0.6806414, -0.01168795, 0.7176471, 0, 1, 1,
0.8526222, -0.09700666, 2.158071, 0.7215686, 0, 1, 1,
0.8526556, 1.192314, -0.1017773, 0.7294118, 0, 1, 1,
0.8563794, -0.2414152, 1.269215, 0.7333333, 0, 1, 1,
0.859272, -0.05794477, 2.582619, 0.7411765, 0, 1, 1,
0.8650171, 0.4892536, 0.5190703, 0.7450981, 0, 1, 1,
0.8659302, 2.746628, 1.556126, 0.7529412, 0, 1, 1,
0.8706285, -0.704612, 2.666441, 0.7568628, 0, 1, 1,
0.8721098, 0.1666674, 0.9916553, 0.7647059, 0, 1, 1,
0.8728197, -0.1263976, 0.6276068, 0.7686275, 0, 1, 1,
0.8739671, -1.500378, 3.698305, 0.7764706, 0, 1, 1,
0.8829917, -0.5159347, 2.373477, 0.7803922, 0, 1, 1,
0.8942492, -0.7161552, 3.385592, 0.7882353, 0, 1, 1,
0.8952635, -1.41335, 1.832957, 0.7921569, 0, 1, 1,
0.9005728, 0.01338923, 1.885465, 0.8, 0, 1, 1,
0.9047626, -0.3319941, 1.674062, 0.8078431, 0, 1, 1,
0.9120517, 0.7757472, 0.4161761, 0.8117647, 0, 1, 1,
0.912744, 0.2429298, 1.766634, 0.8196079, 0, 1, 1,
0.9146638, -0.7116661, 2.789421, 0.8235294, 0, 1, 1,
0.9162333, 1.892293, 0.4701951, 0.8313726, 0, 1, 1,
0.9172018, -0.3764879, 2.580335, 0.8352941, 0, 1, 1,
0.917511, 0.6649292, 2.296277, 0.8431373, 0, 1, 1,
0.9191913, -0.5064033, 2.62577, 0.8470588, 0, 1, 1,
0.9211753, 0.4459061, 0.7637837, 0.854902, 0, 1, 1,
0.9249384, 1.067973, 1.318803, 0.8588235, 0, 1, 1,
0.9286302, 0.8180526, 1.349927, 0.8666667, 0, 1, 1,
0.9307436, 0.197189, 0.8096061, 0.8705882, 0, 1, 1,
0.935679, -0.1373523, -0.2459886, 0.8784314, 0, 1, 1,
0.9363604, -0.02828032, 3.658014, 0.8823529, 0, 1, 1,
0.9418173, 1.069048, -0.6118873, 0.8901961, 0, 1, 1,
0.9457409, 0.7303692, -0.15089, 0.8941177, 0, 1, 1,
0.9461628, 0.2595657, 0.6743972, 0.9019608, 0, 1, 1,
0.9528122, -1.999062, 4.265654, 0.9098039, 0, 1, 1,
0.9531768, 0.8981459, 1.382099, 0.9137255, 0, 1, 1,
0.9563931, -0.6928543, 1.963919, 0.9215686, 0, 1, 1,
0.9602067, 0.421209, -0.1457595, 0.9254902, 0, 1, 1,
0.9602937, -1.084318, 1.656764, 0.9333333, 0, 1, 1,
0.9662898, 0.4018969, -0.3043143, 0.9372549, 0, 1, 1,
0.968363, -1.11667, 2.81896, 0.945098, 0, 1, 1,
0.978399, 1.689699, 0.1211744, 0.9490196, 0, 1, 1,
0.9857202, 0.04156147, 2.030342, 0.9568627, 0, 1, 1,
0.9924842, -0.7346589, 0.824572, 0.9607843, 0, 1, 1,
0.9942507, -0.560376, 2.506735, 0.9686275, 0, 1, 1,
1.002703, -0.8289073, 0.8927037, 0.972549, 0, 1, 1,
1.01005, -0.1742124, 1.384572, 0.9803922, 0, 1, 1,
1.011495, -2.618841, 3.289112, 0.9843137, 0, 1, 1,
1.015523, 0.5036361, 1.590587, 0.9921569, 0, 1, 1,
1.016512, 0.2696391, 2.384291, 0.9960784, 0, 1, 1,
1.027992, -0.4953463, 2.000928, 1, 0, 0.9960784, 1,
1.031525, 0.5387075, 2.128892, 1, 0, 0.9882353, 1,
1.032255, -0.3383091, 1.081164, 1, 0, 0.9843137, 1,
1.036884, -2.021274, 2.404737, 1, 0, 0.9764706, 1,
1.045154, -0.2314471, 0.5744573, 1, 0, 0.972549, 1,
1.060837, -0.3892617, 3.120375, 1, 0, 0.9647059, 1,
1.06715, -2.074817, 2.030628, 1, 0, 0.9607843, 1,
1.07145, 1.120625, -0.6186761, 1, 0, 0.9529412, 1,
1.07357, 1.708157, 0.2119353, 1, 0, 0.9490196, 1,
1.07467, 1.210456, -1.412177, 1, 0, 0.9411765, 1,
1.07661, -0.987878, 1.184719, 1, 0, 0.9372549, 1,
1.077381, 0.06383526, 3.163912, 1, 0, 0.9294118, 1,
1.080045, 0.3648408, 0.766174, 1, 0, 0.9254902, 1,
1.080354, -0.2969667, 0.3084553, 1, 0, 0.9176471, 1,
1.081421, 0.850743, 0.974766, 1, 0, 0.9137255, 1,
1.08731, 0.892644, 2.317352, 1, 0, 0.9058824, 1,
1.088693, -0.1050123, 2.261428, 1, 0, 0.9019608, 1,
1.094923, -0.2881052, 1.309688, 1, 0, 0.8941177, 1,
1.09538, 0.7376462, 0.8419161, 1, 0, 0.8862745, 1,
1.097487, 1.269699, 0.706006, 1, 0, 0.8823529, 1,
1.104501, -0.921281, 2.420686, 1, 0, 0.8745098, 1,
1.10598, -0.4652027, 1.675414, 1, 0, 0.8705882, 1,
1.107502, -1.259257, 2.557469, 1, 0, 0.8627451, 1,
1.108865, 0.3938812, 2.518916, 1, 0, 0.8588235, 1,
1.11856, -0.65372, 1.832139, 1, 0, 0.8509804, 1,
1.12028, -0.1773354, 1.341699, 1, 0, 0.8470588, 1,
1.121249, 0.405701, 1.981576, 1, 0, 0.8392157, 1,
1.129238, 0.8446425, 0.7256507, 1, 0, 0.8352941, 1,
1.144329, 1.170717, -0.5622324, 1, 0, 0.827451, 1,
1.146467, 0.3174509, 0.2497268, 1, 0, 0.8235294, 1,
1.14864, -1.574996, 3.322639, 1, 0, 0.8156863, 1,
1.151064, -0.8433248, 2.573015, 1, 0, 0.8117647, 1,
1.158165, 1.138263, 1.904775, 1, 0, 0.8039216, 1,
1.166012, 0.4690876, 1.472173, 1, 0, 0.7960784, 1,
1.166873, -1.403805, 1.919181, 1, 0, 0.7921569, 1,
1.168913, -1.651409, 1.539755, 1, 0, 0.7843137, 1,
1.169331, 1.401826, 2.712705, 1, 0, 0.7803922, 1,
1.180276, 1.244749, -0.9721971, 1, 0, 0.772549, 1,
1.181281, -0.1889555, 1.146412, 1, 0, 0.7686275, 1,
1.182418, 0.2803175, -0.2303591, 1, 0, 0.7607843, 1,
1.183233, -0.8825089, 2.364481, 1, 0, 0.7568628, 1,
1.183921, -1.341589, 2.291107, 1, 0, 0.7490196, 1,
1.186901, -1.285793, 2.163606, 1, 0, 0.7450981, 1,
1.188296, 0.8912277, 1.902873, 1, 0, 0.7372549, 1,
1.191821, -0.9577838, 1.44801, 1, 0, 0.7333333, 1,
1.19895, 0.139194, 0.7963876, 1, 0, 0.7254902, 1,
1.20468, 0.1229443, 3.124274, 1, 0, 0.7215686, 1,
1.206982, -1.149443, 1.432599, 1, 0, 0.7137255, 1,
1.20922, -0.0350437, 1.284984, 1, 0, 0.7098039, 1,
1.209866, -0.5497789, 2.388137, 1, 0, 0.7019608, 1,
1.214176, 0.8434743, 2.602818, 1, 0, 0.6941177, 1,
1.217287, -0.6427134, 1.94408, 1, 0, 0.6901961, 1,
1.219511, 1.928758, -0.2825683, 1, 0, 0.682353, 1,
1.221938, 1.795929, 0.9706748, 1, 0, 0.6784314, 1,
1.230807, -0.4205726, 0.2790947, 1, 0, 0.6705883, 1,
1.249117, -1.222489, 1.070517, 1, 0, 0.6666667, 1,
1.254457, 2.480723, 0.2516924, 1, 0, 0.6588235, 1,
1.25671, 2.282916, -0.4569071, 1, 0, 0.654902, 1,
1.261552, 1.714118, -0.3293614, 1, 0, 0.6470588, 1,
1.276076, -0.4353467, 2.754896, 1, 0, 0.6431373, 1,
1.277669, 0.7919898, 0.3355224, 1, 0, 0.6352941, 1,
1.280851, -0.7475608, 2.716372, 1, 0, 0.6313726, 1,
1.281457, 0.5246642, 0.1891685, 1, 0, 0.6235294, 1,
1.319254, -0.450828, 1.775831, 1, 0, 0.6196079, 1,
1.325405, -0.5209441, 3.628946, 1, 0, 0.6117647, 1,
1.3392, -0.6737631, 1.537255, 1, 0, 0.6078432, 1,
1.340613, 0.5710787, 1.164164, 1, 0, 0.6, 1,
1.342052, 2.182652, -0.7055789, 1, 0, 0.5921569, 1,
1.343686, 1.059154, 2.007423, 1, 0, 0.5882353, 1,
1.343987, 1.442205, 0.7339081, 1, 0, 0.5803922, 1,
1.344046, -0.06221525, 1.149474, 1, 0, 0.5764706, 1,
1.346637, 0.7880464, 0.1433092, 1, 0, 0.5686275, 1,
1.351955, 0.5318917, 0.4195133, 1, 0, 0.5647059, 1,
1.369804, -0.5001771, 0.7404834, 1, 0, 0.5568628, 1,
1.374884, 0.5200486, 0.8631905, 1, 0, 0.5529412, 1,
1.384586, -0.06836715, 2.47212, 1, 0, 0.5450981, 1,
1.389001, -0.03359805, 1.500141, 1, 0, 0.5411765, 1,
1.394621, -1.535662, 3.10844, 1, 0, 0.5333334, 1,
1.397461, 0.1241982, 2.346747, 1, 0, 0.5294118, 1,
1.402049, 0.4471756, 1.507522, 1, 0, 0.5215687, 1,
1.405573, 0.1694289, 1.173562, 1, 0, 0.5176471, 1,
1.413139, -0.7077751, 0.9547928, 1, 0, 0.509804, 1,
1.414879, 3.315663, 0.7556159, 1, 0, 0.5058824, 1,
1.425386, -0.7687322, 1.632964, 1, 0, 0.4980392, 1,
1.426725, 0.03825643, 1.023903, 1, 0, 0.4901961, 1,
1.439512, 2.669596, 2.946603, 1, 0, 0.4862745, 1,
1.460548, -1.180289, 0.1299526, 1, 0, 0.4784314, 1,
1.461921, -1.269462, 1.91884, 1, 0, 0.4745098, 1,
1.468946, -1.15919, 1.101701, 1, 0, 0.4666667, 1,
1.470453, -0.8693168, 2.006838, 1, 0, 0.4627451, 1,
1.474598, 2.642072, -0.7857354, 1, 0, 0.454902, 1,
1.479241, 2.119575, 1.682884, 1, 0, 0.4509804, 1,
1.482124, 1.027706, 2.183973, 1, 0, 0.4431373, 1,
1.488526, -1.270393, 1.857424, 1, 0, 0.4392157, 1,
1.494785, 0.2661417, 1.763171, 1, 0, 0.4313726, 1,
1.501257, 0.7841539, 0.9608091, 1, 0, 0.427451, 1,
1.502769, -0.2397114, 2.778294, 1, 0, 0.4196078, 1,
1.505276, -1.042091, 1.865386, 1, 0, 0.4156863, 1,
1.515402, -0.1752123, 2.241832, 1, 0, 0.4078431, 1,
1.521473, 0.8031313, 1.558128, 1, 0, 0.4039216, 1,
1.522617, 1.743307, 0.2804891, 1, 0, 0.3960784, 1,
1.530545, -1.212574, 3.126476, 1, 0, 0.3882353, 1,
1.539612, 2.77317, -0.08858421, 1, 0, 0.3843137, 1,
1.541345, -1.076161, 1.408549, 1, 0, 0.3764706, 1,
1.543562, 1.914029, 0.7872002, 1, 0, 0.372549, 1,
1.556923, 1.295481, 0.5523496, 1, 0, 0.3647059, 1,
1.582942, -1.460165, 2.010401, 1, 0, 0.3607843, 1,
1.587196, 0.2747022, 1.885134, 1, 0, 0.3529412, 1,
1.614238, 0.6988471, 0.1617439, 1, 0, 0.3490196, 1,
1.62172, -1.667345, 4.396643, 1, 0, 0.3411765, 1,
1.627443, 1.041529, 1.902482, 1, 0, 0.3372549, 1,
1.639471, 0.5622045, 1.657363, 1, 0, 0.3294118, 1,
1.639613, 2.346348, -0.09584981, 1, 0, 0.3254902, 1,
1.64941, -0.3451208, 2.956943, 1, 0, 0.3176471, 1,
1.655517, -0.177182, 2.196646, 1, 0, 0.3137255, 1,
1.665112, -1.275475, 3.639145, 1, 0, 0.3058824, 1,
1.667497, -1.323328, 2.629192, 1, 0, 0.2980392, 1,
1.671196, -0.4495192, 1.713171, 1, 0, 0.2941177, 1,
1.686333, 0.08341441, 1.702991, 1, 0, 0.2862745, 1,
1.686659, -0.1692437, 2.615505, 1, 0, 0.282353, 1,
1.698067, -0.09654307, 1.990692, 1, 0, 0.2745098, 1,
1.705302, -0.4528998, 0.9333532, 1, 0, 0.2705882, 1,
1.712587, 0.2416205, 1.581689, 1, 0, 0.2627451, 1,
1.717162, -0.3222651, 2.178185, 1, 0, 0.2588235, 1,
1.730282, -2.039222, 2.683444, 1, 0, 0.2509804, 1,
1.731173, -0.4227536, 2.490319, 1, 0, 0.2470588, 1,
1.73904, -1.321635, 1.497143, 1, 0, 0.2392157, 1,
1.741931, 2.734278, 0.7017898, 1, 0, 0.2352941, 1,
1.743883, -0.4624398, 1.373488, 1, 0, 0.227451, 1,
1.749992, -1.288183, 3.26223, 1, 0, 0.2235294, 1,
1.755872, -0.3953657, 2.129504, 1, 0, 0.2156863, 1,
1.756138, 0.5083209, 0.7090017, 1, 0, 0.2117647, 1,
1.807622, 0.6459985, 0.691085, 1, 0, 0.2039216, 1,
1.814906, 0.6521011, 2.131377, 1, 0, 0.1960784, 1,
1.816747, 0.03885937, 2.369846, 1, 0, 0.1921569, 1,
1.820219, 1.672494, 0.7496896, 1, 0, 0.1843137, 1,
1.82272, -0.9027552, 1.963696, 1, 0, 0.1803922, 1,
1.828135, 2.811797, 0.5464479, 1, 0, 0.172549, 1,
1.853503, 0.4972828, 2.148453, 1, 0, 0.1686275, 1,
1.857808, 0.3170407, 1.188598, 1, 0, 0.1607843, 1,
1.886062, -0.6994998, 1.871303, 1, 0, 0.1568628, 1,
1.917489, 0.07423864, -1.126452, 1, 0, 0.1490196, 1,
1.923921, -2.287487, 1.725003, 1, 0, 0.145098, 1,
1.963005, -1.404527, 2.095275, 1, 0, 0.1372549, 1,
2.000167, 1.24379, 0.5159644, 1, 0, 0.1333333, 1,
2.035866, -0.1520904, 1.522509, 1, 0, 0.1254902, 1,
2.051512, -0.9025813, 0.4671012, 1, 0, 0.1215686, 1,
2.082093, 0.01684684, 1.030917, 1, 0, 0.1137255, 1,
2.102796, 0.1474241, -0.717025, 1, 0, 0.1098039, 1,
2.122834, -0.136501, 1.569736, 1, 0, 0.1019608, 1,
2.146762, 0.6749052, 2.400284, 1, 0, 0.09411765, 1,
2.185381, -1.017417, 0.2950571, 1, 0, 0.09019608, 1,
2.217036, -0.5777177, 1.261025, 1, 0, 0.08235294, 1,
2.297001, -1.627762, 3.084503, 1, 0, 0.07843138, 1,
2.323555, 0.3063611, 1.053215, 1, 0, 0.07058824, 1,
2.346551, -0.5916678, 0.8532934, 1, 0, 0.06666667, 1,
2.3932, -1.073655, 2.592912, 1, 0, 0.05882353, 1,
2.441581, 1.656136, -0.3666006, 1, 0, 0.05490196, 1,
2.442747, 1.274095, 1.797961, 1, 0, 0.04705882, 1,
2.49481, -1.190804, 1.177726, 1, 0, 0.04313726, 1,
2.591484, -0.1811481, 0.03725692, 1, 0, 0.03529412, 1,
2.682903, -1.784499, 0.6533741, 1, 0, 0.03137255, 1,
2.698139, 1.420307, 3.209302, 1, 0, 0.02352941, 1,
2.812255, 1.286512, 0.9173193, 1, 0, 0.01960784, 1,
2.895827, 0.1412615, 1.781381, 1, 0, 0.01176471, 1,
3.094815, 1.908691, 1.362166, 1, 0, 0.007843138, 1
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
0.0641669, -4.56475, -7.358318, 0, -0.5, 0.5, 0.5,
0.0641669, -4.56475, -7.358318, 1, -0.5, 0.5, 0.5,
0.0641669, -4.56475, -7.358318, 1, 1.5, 0.5, 0.5,
0.0641669, -4.56475, -7.358318, 0, 1.5, 0.5, 0.5
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
-3.993871, -0.05347478, -7.358318, 0, -0.5, 0.5, 0.5,
-3.993871, -0.05347478, -7.358318, 1, -0.5, 0.5, 0.5,
-3.993871, -0.05347478, -7.358318, 1, 1.5, 0.5, 0.5,
-3.993871, -0.05347478, -7.358318, 0, 1.5, 0.5, 0.5
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
-3.993871, -4.56475, 0.03700233, 0, -0.5, 0.5, 0.5,
-3.993871, -4.56475, 0.03700233, 1, -0.5, 0.5, 0.5,
-3.993871, -4.56475, 0.03700233, 1, 1.5, 0.5, 0.5,
-3.993871, -4.56475, 0.03700233, 0, 1.5, 0.5, 0.5
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
-2, -3.523687, -5.651706,
3, -3.523687, -5.651706,
-2, -3.523687, -5.651706,
-2, -3.697197, -5.936141,
-1, -3.523687, -5.651706,
-1, -3.697197, -5.936141,
0, -3.523687, -5.651706,
0, -3.697197, -5.936141,
1, -3.523687, -5.651706,
1, -3.697197, -5.936141,
2, -3.523687, -5.651706,
2, -3.697197, -5.936141,
3, -3.523687, -5.651706,
3, -3.697197, -5.936141
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
-2, -4.044219, -6.505012, 0, -0.5, 0.5, 0.5,
-2, -4.044219, -6.505012, 1, -0.5, 0.5, 0.5,
-2, -4.044219, -6.505012, 1, 1.5, 0.5, 0.5,
-2, -4.044219, -6.505012, 0, 1.5, 0.5, 0.5,
-1, -4.044219, -6.505012, 0, -0.5, 0.5, 0.5,
-1, -4.044219, -6.505012, 1, -0.5, 0.5, 0.5,
-1, -4.044219, -6.505012, 1, 1.5, 0.5, 0.5,
-1, -4.044219, -6.505012, 0, 1.5, 0.5, 0.5,
0, -4.044219, -6.505012, 0, -0.5, 0.5, 0.5,
0, -4.044219, -6.505012, 1, -0.5, 0.5, 0.5,
0, -4.044219, -6.505012, 1, 1.5, 0.5, 0.5,
0, -4.044219, -6.505012, 0, 1.5, 0.5, 0.5,
1, -4.044219, -6.505012, 0, -0.5, 0.5, 0.5,
1, -4.044219, -6.505012, 1, -0.5, 0.5, 0.5,
1, -4.044219, -6.505012, 1, 1.5, 0.5, 0.5,
1, -4.044219, -6.505012, 0, 1.5, 0.5, 0.5,
2, -4.044219, -6.505012, 0, -0.5, 0.5, 0.5,
2, -4.044219, -6.505012, 1, -0.5, 0.5, 0.5,
2, -4.044219, -6.505012, 1, 1.5, 0.5, 0.5,
2, -4.044219, -6.505012, 0, 1.5, 0.5, 0.5,
3, -4.044219, -6.505012, 0, -0.5, 0.5, 0.5,
3, -4.044219, -6.505012, 1, -0.5, 0.5, 0.5,
3, -4.044219, -6.505012, 1, 1.5, 0.5, 0.5,
3, -4.044219, -6.505012, 0, 1.5, 0.5, 0.5
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
-3.057401, -3, -5.651706,
-3.057401, 3, -5.651706,
-3.057401, -3, -5.651706,
-3.213479, -3, -5.936141,
-3.057401, -2, -5.651706,
-3.213479, -2, -5.936141,
-3.057401, -1, -5.651706,
-3.213479, -1, -5.936141,
-3.057401, 0, -5.651706,
-3.213479, 0, -5.936141,
-3.057401, 1, -5.651706,
-3.213479, 1, -5.936141,
-3.057401, 2, -5.651706,
-3.213479, 2, -5.936141,
-3.057401, 3, -5.651706,
-3.213479, 3, -5.936141
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
-3.525636, -3, -6.505012, 0, -0.5, 0.5, 0.5,
-3.525636, -3, -6.505012, 1, -0.5, 0.5, 0.5,
-3.525636, -3, -6.505012, 1, 1.5, 0.5, 0.5,
-3.525636, -3, -6.505012, 0, 1.5, 0.5, 0.5,
-3.525636, -2, -6.505012, 0, -0.5, 0.5, 0.5,
-3.525636, -2, -6.505012, 1, -0.5, 0.5, 0.5,
-3.525636, -2, -6.505012, 1, 1.5, 0.5, 0.5,
-3.525636, -2, -6.505012, 0, 1.5, 0.5, 0.5,
-3.525636, -1, -6.505012, 0, -0.5, 0.5, 0.5,
-3.525636, -1, -6.505012, 1, -0.5, 0.5, 0.5,
-3.525636, -1, -6.505012, 1, 1.5, 0.5, 0.5,
-3.525636, -1, -6.505012, 0, 1.5, 0.5, 0.5,
-3.525636, 0, -6.505012, 0, -0.5, 0.5, 0.5,
-3.525636, 0, -6.505012, 1, -0.5, 0.5, 0.5,
-3.525636, 0, -6.505012, 1, 1.5, 0.5, 0.5,
-3.525636, 0, -6.505012, 0, 1.5, 0.5, 0.5,
-3.525636, 1, -6.505012, 0, -0.5, 0.5, 0.5,
-3.525636, 1, -6.505012, 1, -0.5, 0.5, 0.5,
-3.525636, 1, -6.505012, 1, 1.5, 0.5, 0.5,
-3.525636, 1, -6.505012, 0, 1.5, 0.5, 0.5,
-3.525636, 2, -6.505012, 0, -0.5, 0.5, 0.5,
-3.525636, 2, -6.505012, 1, -0.5, 0.5, 0.5,
-3.525636, 2, -6.505012, 1, 1.5, 0.5, 0.5,
-3.525636, 2, -6.505012, 0, 1.5, 0.5, 0.5,
-3.525636, 3, -6.505012, 0, -0.5, 0.5, 0.5,
-3.525636, 3, -6.505012, 1, -0.5, 0.5, 0.5,
-3.525636, 3, -6.505012, 1, 1.5, 0.5, 0.5,
-3.525636, 3, -6.505012, 0, 1.5, 0.5, 0.5
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
-3.057401, -3.523687, -4,
-3.057401, -3.523687, 4,
-3.057401, -3.523687, -4,
-3.213479, -3.697197, -4,
-3.057401, -3.523687, -2,
-3.213479, -3.697197, -2,
-3.057401, -3.523687, 0,
-3.213479, -3.697197, 0,
-3.057401, -3.523687, 2,
-3.213479, -3.697197, 2,
-3.057401, -3.523687, 4,
-3.213479, -3.697197, 4
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
-3.525636, -4.044219, -4, 0, -0.5, 0.5, 0.5,
-3.525636, -4.044219, -4, 1, -0.5, 0.5, 0.5,
-3.525636, -4.044219, -4, 1, 1.5, 0.5, 0.5,
-3.525636, -4.044219, -4, 0, 1.5, 0.5, 0.5,
-3.525636, -4.044219, -2, 0, -0.5, 0.5, 0.5,
-3.525636, -4.044219, -2, 1, -0.5, 0.5, 0.5,
-3.525636, -4.044219, -2, 1, 1.5, 0.5, 0.5,
-3.525636, -4.044219, -2, 0, 1.5, 0.5, 0.5,
-3.525636, -4.044219, 0, 0, -0.5, 0.5, 0.5,
-3.525636, -4.044219, 0, 1, -0.5, 0.5, 0.5,
-3.525636, -4.044219, 0, 1, 1.5, 0.5, 0.5,
-3.525636, -4.044219, 0, 0, 1.5, 0.5, 0.5,
-3.525636, -4.044219, 2, 0, -0.5, 0.5, 0.5,
-3.525636, -4.044219, 2, 1, -0.5, 0.5, 0.5,
-3.525636, -4.044219, 2, 1, 1.5, 0.5, 0.5,
-3.525636, -4.044219, 2, 0, 1.5, 0.5, 0.5,
-3.525636, -4.044219, 4, 0, -0.5, 0.5, 0.5,
-3.525636, -4.044219, 4, 1, -0.5, 0.5, 0.5,
-3.525636, -4.044219, 4, 1, 1.5, 0.5, 0.5,
-3.525636, -4.044219, 4, 0, 1.5, 0.5, 0.5
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
-3.057401, -3.523687, -5.651706,
-3.057401, 3.416737, -5.651706,
-3.057401, -3.523687, 5.72571,
-3.057401, 3.416737, 5.72571,
-3.057401, -3.523687, -5.651706,
-3.057401, -3.523687, 5.72571,
-3.057401, 3.416737, -5.651706,
-3.057401, 3.416737, 5.72571,
-3.057401, -3.523687, -5.651706,
3.185735, -3.523687, -5.651706,
-3.057401, -3.523687, 5.72571,
3.185735, -3.523687, 5.72571,
-3.057401, 3.416737, -5.651706,
3.185735, 3.416737, -5.651706,
-3.057401, 3.416737, 5.72571,
3.185735, 3.416737, 5.72571,
3.185735, -3.523687, -5.651706,
3.185735, 3.416737, -5.651706,
3.185735, -3.523687, 5.72571,
3.185735, 3.416737, 5.72571,
3.185735, -3.523687, -5.651706,
3.185735, -3.523687, 5.72571,
3.185735, 3.416737, -5.651706,
3.185735, 3.416737, 5.72571
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
var radius = 7.858624;
var distance = 34.9639;
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
mvMatrix.translate( -0.0641669, 0.05347478, -0.03700233 );
mvMatrix.scale( 1.360999, 1.224262, 0.7468214 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.9639);
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
Heptane<-read.table("Heptane.xyz", skip=1)
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
-2.966481, -0.2144528, -1.879245, 0, 0, 1, 1, 1,
-2.750087, -0.04863665, -0.963196, 1, 0, 0, 1, 1,
-2.663311, -0.05841948, -0.3806209, 1, 0, 0, 1, 1,
-2.660897, 0.5469797, -1.534024, 1, 0, 0, 1, 1,
-2.408989, 0.7255938, -1.149698, 1, 0, 0, 1, 1,
-2.394449, -0.1430378, -2.662811, 1, 0, 0, 1, 1,
-2.380023, 0.05321687, -2.859051, 0, 0, 0, 1, 1,
-2.356704, 1.621215, -2.01356, 0, 0, 0, 1, 1,
-2.345434, -0.880994, -0.1695055, 0, 0, 0, 1, 1,
-2.329753, -0.7601381, -2.933119, 0, 0, 0, 1, 1,
-2.289422, -1.219705, -0.4349583, 0, 0, 0, 1, 1,
-2.246178, -1.473755, -3.034423, 0, 0, 0, 1, 1,
-2.209761, 0.9461297, -0.5403242, 0, 0, 0, 1, 1,
-2.176575, 1.150505, 0.1460616, 1, 1, 1, 1, 1,
-2.131484, 1.286697, -2.639749, 1, 1, 1, 1, 1,
-2.119423, 0.7903093, 0.4211547, 1, 1, 1, 1, 1,
-2.107852, -1.549016, -1.69909, 1, 1, 1, 1, 1,
-2.107189, 0.877893, -0.2029031, 1, 1, 1, 1, 1,
-2.091224, -0.4945234, 0.2893676, 1, 1, 1, 1, 1,
-2.087519, -0.2402721, -2.033542, 1, 1, 1, 1, 1,
-2.062873, 0.1116691, -1.861137, 1, 1, 1, 1, 1,
-2.058487, -2.732677, -2.569953, 1, 1, 1, 1, 1,
-2.022272, 0.2810295, -2.955817, 1, 1, 1, 1, 1,
-2.002919, 0.09357868, -1.058363, 1, 1, 1, 1, 1,
-1.986457, 0.1566256, -0.6637626, 1, 1, 1, 1, 1,
-1.982836, -0.9333807, -1.060627, 1, 1, 1, 1, 1,
-1.927085, 0.9835656, -2.507534, 1, 1, 1, 1, 1,
-1.869879, -0.2106278, -1.844948, 1, 1, 1, 1, 1,
-1.868064, -0.4976913, -2.773351, 0, 0, 1, 1, 1,
-1.862785, 0.8595388, -1.365042, 1, 0, 0, 1, 1,
-1.858273, 0.6063254, 0.5108426, 1, 0, 0, 1, 1,
-1.85189, -0.5062047, -1.525805, 1, 0, 0, 1, 1,
-1.850841, -0.1458672, -2.405596, 1, 0, 0, 1, 1,
-1.842653, -3.076959, -2.800396, 1, 0, 0, 1, 1,
-1.83769, -0.7029638, -3.550401, 0, 0, 0, 1, 1,
-1.829216, -1.139704, -0.2359156, 0, 0, 0, 1, 1,
-1.821552, 0.697154, 0.4635848, 0, 0, 0, 1, 1,
-1.804577, 0.3778701, -1.062295, 0, 0, 0, 1, 1,
-1.776368, -0.3453735, -1.090415, 0, 0, 0, 1, 1,
-1.772908, 0.6566901, -2.302719, 0, 0, 0, 1, 1,
-1.75931, -0.09716284, -1.961124, 0, 0, 0, 1, 1,
-1.75452, -0.2132217, -1.086517, 1, 1, 1, 1, 1,
-1.751945, 0.5066926, -0.7733536, 1, 1, 1, 1, 1,
-1.729886, -0.3040755, -0.4259121, 1, 1, 1, 1, 1,
-1.72811, 0.5459201, -1.768838, 1, 1, 1, 1, 1,
-1.721754, -1.106054, -2.712652, 1, 1, 1, 1, 1,
-1.716491, -0.05254353, -1.082448, 1, 1, 1, 1, 1,
-1.713036, -1.21578, -3.052704, 1, 1, 1, 1, 1,
-1.71255, 0.001986479, -0.3522315, 1, 1, 1, 1, 1,
-1.707536, 0.2792498, -1.062757, 1, 1, 1, 1, 1,
-1.693461, 1.083387, -0.4826483, 1, 1, 1, 1, 1,
-1.674514, -0.6437614, -1.413477, 1, 1, 1, 1, 1,
-1.668643, -0.6458773, -0.8959668, 1, 1, 1, 1, 1,
-1.632471, -0.5137744, -0.922259, 1, 1, 1, 1, 1,
-1.622484, -0.09558487, -2.722781, 1, 1, 1, 1, 1,
-1.610289, -1.03541, -1.604675, 1, 1, 1, 1, 1,
-1.610131, 0.7984742, -1.968921, 0, 0, 1, 1, 1,
-1.610066, -0.5085661, -3.754919, 1, 0, 0, 1, 1,
-1.602377, -2.094749, -3.544552, 1, 0, 0, 1, 1,
-1.558586, -0.3660341, -3.201319, 1, 0, 0, 1, 1,
-1.557083, 0.7897077, -2.487328, 1, 0, 0, 1, 1,
-1.556612, -1.873137, -5.052474, 1, 0, 0, 1, 1,
-1.554546, 0.5195408, -1.409041, 0, 0, 0, 1, 1,
-1.543767, -0.6467424, -1.869087, 0, 0, 0, 1, 1,
-1.543368, 0.9786355, 1.450008, 0, 0, 0, 1, 1,
-1.538583, -1.183586, -0.8719474, 0, 0, 0, 1, 1,
-1.524659, 0.2806502, -0.8364773, 0, 0, 0, 1, 1,
-1.524006, 0.8883606, -0.00502546, 0, 0, 0, 1, 1,
-1.492496, -0.3414586, -0.9225208, 0, 0, 0, 1, 1,
-1.469518, 1.091071, -1.677673, 1, 1, 1, 1, 1,
-1.462908, -0.4202378, -1.19854, 1, 1, 1, 1, 1,
-1.461306, 0.5649309, -0.9611902, 1, 1, 1, 1, 1,
-1.458215, -0.893114, -3.039528, 1, 1, 1, 1, 1,
-1.455831, 0.0368624, -0.8740509, 1, 1, 1, 1, 1,
-1.444196, 0.2038019, -3.685133, 1, 1, 1, 1, 1,
-1.433783, -1.253683, -2.779712, 1, 1, 1, 1, 1,
-1.42515, 1.246453, 0.6237472, 1, 1, 1, 1, 1,
-1.419431, 1.504916, -1.513876, 1, 1, 1, 1, 1,
-1.417853, 0.2598647, -1.475952, 1, 1, 1, 1, 1,
-1.394066, -0.9008433, -2.003322, 1, 1, 1, 1, 1,
-1.385293, -0.7447413, -3.246574, 1, 1, 1, 1, 1,
-1.382516, -0.1101747, -2.518676, 1, 1, 1, 1, 1,
-1.37999, 0.2848146, -1.57113, 1, 1, 1, 1, 1,
-1.374774, -2.544189, -1.948474, 1, 1, 1, 1, 1,
-1.368026, -0.3125771, -0.3842707, 0, 0, 1, 1, 1,
-1.355136, -0.1665, -2.290411, 1, 0, 0, 1, 1,
-1.343884, 0.1934879, -2.123134, 1, 0, 0, 1, 1,
-1.336891, 1.01535, -1.556904, 1, 0, 0, 1, 1,
-1.335618, -0.5330634, -2.261764, 1, 0, 0, 1, 1,
-1.333269, 1.128277, -0.5944331, 1, 0, 0, 1, 1,
-1.316872, 0.9475715, 1.671352, 0, 0, 0, 1, 1,
-1.316238, 1.758096, -1.396557, 0, 0, 0, 1, 1,
-1.311587, -1.426929, -1.324622, 0, 0, 0, 1, 1,
-1.310029, 0.06721372, 0.2554399, 0, 0, 0, 1, 1,
-1.306013, -0.007162145, 0.8783855, 0, 0, 0, 1, 1,
-1.302946, 0.05604327, -1.493285, 0, 0, 0, 1, 1,
-1.280224, 0.4738437, -0.7582858, 0, 0, 0, 1, 1,
-1.280126, 2.020143, 1.635199, 1, 1, 1, 1, 1,
-1.263158, 0.01931829, -0.07542925, 1, 1, 1, 1, 1,
-1.260349, 2.043267, 0.2736368, 1, 1, 1, 1, 1,
-1.245803, 0.7302434, -2.347555, 1, 1, 1, 1, 1,
-1.244249, -0.8457401, -3.893138, 1, 1, 1, 1, 1,
-1.242867, -0.6807153, -2.221581, 1, 1, 1, 1, 1,
-1.236212, -0.9925516, -2.900422, 1, 1, 1, 1, 1,
-1.232791, -0.7401713, -1.190619, 1, 1, 1, 1, 1,
-1.23234, -1.799287, -2.698326, 1, 1, 1, 1, 1,
-1.230322, 1.071844, -1.464028, 1, 1, 1, 1, 1,
-1.215282, -1.154013, -3.820263, 1, 1, 1, 1, 1,
-1.215174, -0.6900564, -2.049229, 1, 1, 1, 1, 1,
-1.21328, 1.179687, -1.151241, 1, 1, 1, 1, 1,
-1.198578, -0.7580308, -2.279195, 1, 1, 1, 1, 1,
-1.193622, -0.1721844, -1.021043, 1, 1, 1, 1, 1,
-1.189689, -1.852153, -2.963102, 0, 0, 1, 1, 1,
-1.184358, 0.2714127, -1.208133, 1, 0, 0, 1, 1,
-1.170969, -0.4302387, -2.091147, 1, 0, 0, 1, 1,
-1.164854, -0.8916391, -1.436339, 1, 0, 0, 1, 1,
-1.158467, -0.6620645, -0.8332311, 1, 0, 0, 1, 1,
-1.151096, 1.293786, -0.09232853, 1, 0, 0, 1, 1,
-1.149092, 1.857629, 0.636255, 0, 0, 0, 1, 1,
-1.148255, 0.1235559, -2.242335, 0, 0, 0, 1, 1,
-1.12904, -1.138802, -2.802216, 0, 0, 0, 1, 1,
-1.124559, -1.651094, -1.528395, 0, 0, 0, 1, 1,
-1.122268, -0.6956546, -0.7456591, 0, 0, 0, 1, 1,
-1.111694, -0.4492224, -3.619606, 0, 0, 0, 1, 1,
-1.106305, 1.343429, -0.9320771, 0, 0, 0, 1, 1,
-1.099269, 0.4116591, -0.4999878, 1, 1, 1, 1, 1,
-1.096494, -1.201409, -3.292094, 1, 1, 1, 1, 1,
-1.092457, 0.1224187, -2.124859, 1, 1, 1, 1, 1,
-1.085247, 2.27749, -0.1453411, 1, 1, 1, 1, 1,
-1.081992, 1.460801, -1.267641, 1, 1, 1, 1, 1,
-1.07675, 1.158152, 0.8876575, 1, 1, 1, 1, 1,
-1.07608, -0.7346966, -2.80388, 1, 1, 1, 1, 1,
-1.061349, 0.8658614, -1.213906, 1, 1, 1, 1, 1,
-1.055768, -1.601606, -2.938842, 1, 1, 1, 1, 1,
-1.04833, -0.01870688, -2.861076, 1, 1, 1, 1, 1,
-1.047589, -0.7600074, -4.481482, 1, 1, 1, 1, 1,
-1.047541, -0.8979622, -0.657474, 1, 1, 1, 1, 1,
-1.046714, -0.05841547, -1.300953, 1, 1, 1, 1, 1,
-1.045368, -1.472329, -2.105783, 1, 1, 1, 1, 1,
-1.044, -0.02607453, -1.391351, 1, 1, 1, 1, 1,
-1.040607, -1.300913, -0.9818283, 0, 0, 1, 1, 1,
-1.030865, 0.4655201, -2.005688, 1, 0, 0, 1, 1,
-1.028896, 0.5440589, -0.1046534, 1, 0, 0, 1, 1,
-1.02694, -0.07883922, -1.47749, 1, 0, 0, 1, 1,
-1.02004, -0.6079718, -2.249024, 1, 0, 0, 1, 1,
-1.019027, 1.551527, 2.412923, 1, 0, 0, 1, 1,
-1.017879, 1.238125, -1.527289, 0, 0, 0, 1, 1,
-1.01608, -0.9883014, -2.564058, 0, 0, 0, 1, 1,
-1.011196, -1.632375, -2.286583, 0, 0, 0, 1, 1,
-1.001432, -0.028859, -1.155518, 0, 0, 0, 1, 1,
-0.9988418, -0.7035604, -2.515932, 0, 0, 0, 1, 1,
-0.9966681, 0.9699739, -0.776285, 0, 0, 0, 1, 1,
-0.9955686, -1.927095, -1.935046, 0, 0, 0, 1, 1,
-0.9875249, 0.2086689, -1.502646, 1, 1, 1, 1, 1,
-0.9868976, -0.1893691, -1.212661, 1, 1, 1, 1, 1,
-0.9823191, -0.6429563, -0.6428277, 1, 1, 1, 1, 1,
-0.9821786, -2.125314, -1.954128, 1, 1, 1, 1, 1,
-0.9784731, -0.5730474, -3.474839, 1, 1, 1, 1, 1,
-0.978173, 0.3000326, -1.001083, 1, 1, 1, 1, 1,
-0.9757838, -1.527113, -2.865912, 1, 1, 1, 1, 1,
-0.9726765, 0.07333375, -0.8616628, 1, 1, 1, 1, 1,
-0.9684027, -0.853534, -2.36145, 1, 1, 1, 1, 1,
-0.9618492, 0.3908082, -1.442163, 1, 1, 1, 1, 1,
-0.9578698, -2.047417, -3.035718, 1, 1, 1, 1, 1,
-0.9547086, -0.2642936, -1.816783, 1, 1, 1, 1, 1,
-0.9498495, 0.9021601, -0.4094369, 1, 1, 1, 1, 1,
-0.9456325, 0.1967146, -4.02888, 1, 1, 1, 1, 1,
-0.9455907, 1.178901, -2.187634, 1, 1, 1, 1, 1,
-0.9424112, -1.332077, -0.8424345, 0, 0, 1, 1, 1,
-0.9420654, -0.1836577, -3.496393, 1, 0, 0, 1, 1,
-0.941202, 1.63257, 0.8007021, 1, 0, 0, 1, 1,
-0.9409007, 0.2643017, -0.6427341, 1, 0, 0, 1, 1,
-0.9381366, -0.7760295, -3.756665, 1, 0, 0, 1, 1,
-0.9311733, 0.9580969, 1.194284, 1, 0, 0, 1, 1,
-0.9178588, -1.087219, -2.13368, 0, 0, 0, 1, 1,
-0.9158504, -0.0960955, -1.92961, 0, 0, 0, 1, 1,
-0.8995838, 1.912343, -1.193293, 0, 0, 0, 1, 1,
-0.8939595, -1.549181, -3.687931, 0, 0, 0, 1, 1,
-0.8930505, -1.711206, -2.763209, 0, 0, 0, 1, 1,
-0.8839343, 2.031359, -2.123332, 0, 0, 0, 1, 1,
-0.8788525, 0.4488858, -1.531207, 0, 0, 0, 1, 1,
-0.877764, -0.7105513, -2.802114, 1, 1, 1, 1, 1,
-0.8773921, -0.5465505, -2.191379, 1, 1, 1, 1, 1,
-0.8696854, 1.01651, 0.4065033, 1, 1, 1, 1, 1,
-0.8661534, 2.3743, 0.193274, 1, 1, 1, 1, 1,
-0.8659517, -0.6505121, -3.077558, 1, 1, 1, 1, 1,
-0.8629583, -0.2140947, 0.8752721, 1, 1, 1, 1, 1,
-0.8623801, -0.1825301, -1.043658, 1, 1, 1, 1, 1,
-0.8558167, 2.074789, -2.054088, 1, 1, 1, 1, 1,
-0.8552113, 0.1246699, -2.522548, 1, 1, 1, 1, 1,
-0.8534769, 0.8284429, -1.149858, 1, 1, 1, 1, 1,
-0.8473858, -0.2032083, -0.9181424, 1, 1, 1, 1, 1,
-0.8464791, -0.01240389, -0.981171, 1, 1, 1, 1, 1,
-0.8393602, -0.8304425, -2.092693, 1, 1, 1, 1, 1,
-0.8306534, 0.7899002, -0.2550714, 1, 1, 1, 1, 1,
-0.8306181, -0.456823, -2.688689, 1, 1, 1, 1, 1,
-0.8249105, 0.9058152, -0.670579, 0, 0, 1, 1, 1,
-0.811619, 1.655544, -0.7781712, 1, 0, 0, 1, 1,
-0.8078214, 0.2574602, -1.930473, 1, 0, 0, 1, 1,
-0.8069878, 1.247169, -0.6977174, 1, 0, 0, 1, 1,
-0.8056816, 0.9548169, -0.4004966, 1, 0, 0, 1, 1,
-0.8041247, 0.1598204, -3.039005, 1, 0, 0, 1, 1,
-0.8013387, -0.6507816, -2.680644, 0, 0, 0, 1, 1,
-0.8004763, 0.8477495, -1.129105, 0, 0, 0, 1, 1,
-0.7934363, 1.20812, -0.2609658, 0, 0, 0, 1, 1,
-0.7928836, 0.5116706, -2.896482, 0, 0, 0, 1, 1,
-0.7908748, -1.055731, -1.713345, 0, 0, 0, 1, 1,
-0.7899753, -0.4563858, -2.951845, 0, 0, 0, 1, 1,
-0.7895368, -2.402949, -2.509672, 0, 0, 0, 1, 1,
-0.7840499, 0.2938854, -1.787322, 1, 1, 1, 1, 1,
-0.7834998, -0.2977349, -2.085172, 1, 1, 1, 1, 1,
-0.774767, -0.7581972, -1.31238, 1, 1, 1, 1, 1,
-0.7709092, 0.4708211, -1.182221, 1, 1, 1, 1, 1,
-0.7646174, -1.213763, -1.604454, 1, 1, 1, 1, 1,
-0.7631376, -1.079614, -1.346067, 1, 1, 1, 1, 1,
-0.7597739, 0.2626784, -1.970712, 1, 1, 1, 1, 1,
-0.7576704, -0.5289502, -1.715095, 1, 1, 1, 1, 1,
-0.7576364, -2.234976, -3.410592, 1, 1, 1, 1, 1,
-0.7549551, -0.8101354, -3.437024, 1, 1, 1, 1, 1,
-0.7519931, -0.6556322, -2.365863, 1, 1, 1, 1, 1,
-0.7514997, 0.4943201, -1.231457, 1, 1, 1, 1, 1,
-0.7381282, 1.396067, -2.294044, 1, 1, 1, 1, 1,
-0.7287797, -0.1095869, -1.183049, 1, 1, 1, 1, 1,
-0.723317, 0.5278634, -2.135139, 1, 1, 1, 1, 1,
-0.7156566, 1.147096, -1.305246, 0, 0, 1, 1, 1,
-0.7031655, -0.644958, -4.350113, 1, 0, 0, 1, 1,
-0.7030994, -1.465592, -2.842378, 1, 0, 0, 1, 1,
-0.6998147, 0.9549401, -1.442987, 1, 0, 0, 1, 1,
-0.69772, -0.5658256, -0.8084199, 1, 0, 0, 1, 1,
-0.6976285, -1.419789, -2.914575, 1, 0, 0, 1, 1,
-0.6968997, 0.2003797, -1.17805, 0, 0, 0, 1, 1,
-0.6965777, -0.04384141, -1.602622, 0, 0, 0, 1, 1,
-0.6953319, 0.3635418, 0.356319, 0, 0, 0, 1, 1,
-0.6846683, -0.3166415, -1.414814, 0, 0, 0, 1, 1,
-0.6802171, -0.1662642, -1.165269, 0, 0, 0, 1, 1,
-0.679545, -1.289331, -3.387589, 0, 0, 0, 1, 1,
-0.6749976, -0.04489023, -1.633515, 0, 0, 0, 1, 1,
-0.6686653, -2.005733, -3.831584, 1, 1, 1, 1, 1,
-0.6685079, 1.360913, -0.2298443, 1, 1, 1, 1, 1,
-0.6597885, 0.138973, -0.4680794, 1, 1, 1, 1, 1,
-0.6596237, 0.2604516, -0.4694878, 1, 1, 1, 1, 1,
-0.6554309, -1.140801, -3.136699, 1, 1, 1, 1, 1,
-0.6553525, 1.33011, 0.7864749, 1, 1, 1, 1, 1,
-0.6528515, -0.07672711, -0.4843815, 1, 1, 1, 1, 1,
-0.6522489, -0.3638588, -1.661805, 1, 1, 1, 1, 1,
-0.6485174, 0.2534625, -2.284901, 1, 1, 1, 1, 1,
-0.646562, -0.2681617, -1.449834, 1, 1, 1, 1, 1,
-0.6440015, -1.305506, -1.543501, 1, 1, 1, 1, 1,
-0.6319382, 0.2364535, -0.8144961, 1, 1, 1, 1, 1,
-0.6249746, 0.5787582, -0.9113961, 1, 1, 1, 1, 1,
-0.6232627, -0.06566599, -2.125462, 1, 1, 1, 1, 1,
-0.6193428, -0.7380664, -3.294275, 1, 1, 1, 1, 1,
-0.6187552, -0.4691488, -2.60179, 0, 0, 1, 1, 1,
-0.6149822, -0.7230951, -2.197573, 1, 0, 0, 1, 1,
-0.61435, -1.32191, -1.129348, 1, 0, 0, 1, 1,
-0.6111207, -1.0508, -3.830981, 1, 0, 0, 1, 1,
-0.6092999, -1.181825, -0.8899401, 1, 0, 0, 1, 1,
-0.6079001, 0.8111038, -1.098638, 1, 0, 0, 1, 1,
-0.6051081, 1.111171, -0.8329617, 0, 0, 0, 1, 1,
-0.6024172, 0.2320221, -1.147493, 0, 0, 0, 1, 1,
-0.5980872, 1.22559, 0.2671676, 0, 0, 0, 1, 1,
-0.5973475, 0.05021983, -0.3120352, 0, 0, 0, 1, 1,
-0.5955285, 0.2161014, -2.01458, 0, 0, 0, 1, 1,
-0.5901449, 0.3628464, -0.9980395, 0, 0, 0, 1, 1,
-0.586885, -0.0128209, -1.734781, 0, 0, 0, 1, 1,
-0.5820052, -1.763944, -3.485269, 1, 1, 1, 1, 1,
-0.5797011, 0.4172033, -0.1864278, 1, 1, 1, 1, 1,
-0.5788447, 0.2679159, -0.4057797, 1, 1, 1, 1, 1,
-0.5762028, 0.4383335, -1.579297, 1, 1, 1, 1, 1,
-0.5759134, -0.0557479, -2.475018, 1, 1, 1, 1, 1,
-0.5748269, 0.2838569, -2.120261, 1, 1, 1, 1, 1,
-0.5729632, -1.582137, -1.948949, 1, 1, 1, 1, 1,
-0.5725398, -0.1778688, -1.510138, 1, 1, 1, 1, 1,
-0.5686141, 1.408727, -0.1025307, 1, 1, 1, 1, 1,
-0.5662284, -0.1056511, -2.672323, 1, 1, 1, 1, 1,
-0.5660317, 0.5256901, -0.5446121, 1, 1, 1, 1, 1,
-0.5643654, -1.321884, -3.922201, 1, 1, 1, 1, 1,
-0.5637979, 0.6539569, 0.578082, 1, 1, 1, 1, 1,
-0.5613375, 1.118875, -0.1265461, 1, 1, 1, 1, 1,
-0.560425, -1.224695, -2.861878, 1, 1, 1, 1, 1,
-0.5591717, -0.7536348, -3.257977, 0, 0, 1, 1, 1,
-0.5551302, 0.02489265, -0.6341445, 1, 0, 0, 1, 1,
-0.5516819, 0.5246608, -0.6521457, 1, 0, 0, 1, 1,
-0.5439835, -0.02641029, -1.355104, 1, 0, 0, 1, 1,
-0.5405293, -0.2176278, -1.328891, 1, 0, 0, 1, 1,
-0.538101, 0.2436615, -2.553898, 1, 0, 0, 1, 1,
-0.5361032, -0.4891188, -2.205003, 0, 0, 0, 1, 1,
-0.5354946, -1.017822, -2.253037, 0, 0, 0, 1, 1,
-0.5329261, -0.2440248, -2.642816, 0, 0, 0, 1, 1,
-0.5325407, 0.4730716, -0.859206, 0, 0, 0, 1, 1,
-0.5319673, 0.307276, -0.5089497, 0, 0, 0, 1, 1,
-0.5251237, -1.636869, -3.506187, 0, 0, 0, 1, 1,
-0.5232376, -1.979399, -1.615344, 0, 0, 0, 1, 1,
-0.5203418, -0.9387087, -3.110863, 1, 1, 1, 1, 1,
-0.5202088, 1.452196, -1.598466, 1, 1, 1, 1, 1,
-0.5200987, 0.4788902, 0.7751125, 1, 1, 1, 1, 1,
-0.5197975, -0.1122174, -1.553799, 1, 1, 1, 1, 1,
-0.5175699, 0.2226294, -1.896852, 1, 1, 1, 1, 1,
-0.5125123, -0.9423075, -2.744904, 1, 1, 1, 1, 1,
-0.5110869, 1.510054, -1.529898, 1, 1, 1, 1, 1,
-0.5108226, -0.321458, -2.110015, 1, 1, 1, 1, 1,
-0.5068833, 1.319443, -0.669602, 1, 1, 1, 1, 1,
-0.5054895, -0.4688624, -2.385921, 1, 1, 1, 1, 1,
-0.5036958, -1.02828, -2.947782, 1, 1, 1, 1, 1,
-0.5029554, -3.422612, -1.832215, 1, 1, 1, 1, 1,
-0.4966303, 0.2715439, -1.554936, 1, 1, 1, 1, 1,
-0.4899328, -0.1731078, -2.045805, 1, 1, 1, 1, 1,
-0.4867574, 0.678781, 0.3669139, 1, 1, 1, 1, 1,
-0.4853792, 0.5646623, 0.4219848, 0, 0, 1, 1, 1,
-0.4851268, 0.6114583, -2.103863, 1, 0, 0, 1, 1,
-0.4849893, 0.1583828, 1.251721, 1, 0, 0, 1, 1,
-0.4843995, 1.22539, 0.2332827, 1, 0, 0, 1, 1,
-0.483305, -0.9206749, -2.790643, 1, 0, 0, 1, 1,
-0.4808448, 0.1490508, -1.172216, 1, 0, 0, 1, 1,
-0.4803629, 0.8373633, 1.268479, 0, 0, 0, 1, 1,
-0.4791011, 1.446433, -0.4020041, 0, 0, 0, 1, 1,
-0.4782244, -0.3593405, -3.426831, 0, 0, 0, 1, 1,
-0.4745924, -1.528927, -2.942223, 0, 0, 0, 1, 1,
-0.470858, 0.06718943, -1.193242, 0, 0, 0, 1, 1,
-0.4637917, -0.9568981, -2.802839, 0, 0, 0, 1, 1,
-0.4556476, 0.3748948, -1.76879, 0, 0, 0, 1, 1,
-0.4538936, -0.509743, -2.124671, 1, 1, 1, 1, 1,
-0.452298, -0.3654871, -1.903717, 1, 1, 1, 1, 1,
-0.4461213, 0.1804773, -0.2803213, 1, 1, 1, 1, 1,
-0.4446771, -0.5452494, -1.731954, 1, 1, 1, 1, 1,
-0.4437849, 1.043686, 0.1431606, 1, 1, 1, 1, 1,
-0.4412354, 0.6081291, 0.2461918, 1, 1, 1, 1, 1,
-0.4355538, 0.4705455, -1.843889, 1, 1, 1, 1, 1,
-0.4333378, -1.016378, -5.486015, 1, 1, 1, 1, 1,
-0.4304068, 0.1075257, -1.549944, 1, 1, 1, 1, 1,
-0.4296564, 0.7766633, 0.982006, 1, 1, 1, 1, 1,
-0.4274893, 0.4593894, -2.614957, 1, 1, 1, 1, 1,
-0.4265452, 0.8028598, -0.8427246, 1, 1, 1, 1, 1,
-0.4232708, 1.669529, 1.142782, 1, 1, 1, 1, 1,
-0.4221506, -0.1495572, -2.998039, 1, 1, 1, 1, 1,
-0.4218405, -0.4802416, -0.8346164, 1, 1, 1, 1, 1,
-0.4188023, -0.8962969, -1.757881, 0, 0, 1, 1, 1,
-0.4157328, -0.5355153, -0.1311187, 1, 0, 0, 1, 1,
-0.4117109, -0.7753769, -2.870331, 1, 0, 0, 1, 1,
-0.3991894, 0.4200253, -0.56722, 1, 0, 0, 1, 1,
-0.3976611, 0.03804132, -1.773311, 1, 0, 0, 1, 1,
-0.395953, -0.3640814, -2.615975, 1, 0, 0, 1, 1,
-0.3945237, -0.2091366, -0.04046312, 0, 0, 0, 1, 1,
-0.3941318, 0.8872874, -0.1044074, 0, 0, 0, 1, 1,
-0.3909461, -1.482581, -2.00476, 0, 0, 0, 1, 1,
-0.3875005, 0.03771819, -1.296639, 0, 0, 0, 1, 1,
-0.3843144, 1.157009, 0.7448173, 0, 0, 0, 1, 1,
-0.3842711, 0.1262439, -1.523501, 0, 0, 0, 1, 1,
-0.3832172, -0.4023495, -3.299914, 0, 0, 0, 1, 1,
-0.3829546, 2.793966, 0.3491602, 1, 1, 1, 1, 1,
-0.3797997, 0.03480072, -0.6627094, 1, 1, 1, 1, 1,
-0.3785403, -0.6311461, -3.689755, 1, 1, 1, 1, 1,
-0.376499, 0.4205416, -2.813969, 1, 1, 1, 1, 1,
-0.3764841, 0.6609944, 0.9597095, 1, 1, 1, 1, 1,
-0.3738465, 0.01254328, -1.975039, 1, 1, 1, 1, 1,
-0.3727902, 1.771149, 0.5097175, 1, 1, 1, 1, 1,
-0.3700067, 0.6607686, 1.58193, 1, 1, 1, 1, 1,
-0.3648371, 0.934377, 0.1721509, 1, 1, 1, 1, 1,
-0.3640823, -1.869384, -2.945882, 1, 1, 1, 1, 1,
-0.362404, -0.01780601, -3.021272, 1, 1, 1, 1, 1,
-0.3621359, -0.9676873, -4.747931, 1, 1, 1, 1, 1,
-0.359812, 3.201943, 0.08501705, 1, 1, 1, 1, 1,
-0.3597583, -0.5310002, -1.798239, 1, 1, 1, 1, 1,
-0.3561505, 0.4109288, -1.563756, 1, 1, 1, 1, 1,
-0.3556091, 0.4950279, 0.2133574, 0, 0, 1, 1, 1,
-0.3543383, -1.284032, -4.110312, 1, 0, 0, 1, 1,
-0.353116, -1.83849, -3.728571, 1, 0, 0, 1, 1,
-0.3528333, 0.6713179, -1.771872, 1, 0, 0, 1, 1,
-0.3506576, 0.9793061, 0.1448717, 1, 0, 0, 1, 1,
-0.3500055, 0.09523794, -1.247976, 1, 0, 0, 1, 1,
-0.3478308, 0.6080338, -1.506856, 0, 0, 0, 1, 1,
-0.3475857, -0.4136466, -1.805688, 0, 0, 0, 1, 1,
-0.3472253, -0.5804992, -2.607691, 0, 0, 0, 1, 1,
-0.3384722, -0.2214839, -1.330759, 0, 0, 0, 1, 1,
-0.3372171, 0.2872508, -0.3455001, 0, 0, 0, 1, 1,
-0.3368753, -1.297791, -4.586859, 0, 0, 0, 1, 1,
-0.3366899, 1.251038, 0.2912539, 0, 0, 0, 1, 1,
-0.3363715, 1.191252, -0.3448853, 1, 1, 1, 1, 1,
-0.3359503, 0.5500634, -1.279654, 1, 1, 1, 1, 1,
-0.3341779, 1.85106, 0.5303442, 1, 1, 1, 1, 1,
-0.3310627, 1.824212, 0.8069157, 1, 1, 1, 1, 1,
-0.3301861, 1.873606, 1.922589, 1, 1, 1, 1, 1,
-0.3269737, 1.046999, -1.422125, 1, 1, 1, 1, 1,
-0.3240895, 0.2904542, -0.5819867, 1, 1, 1, 1, 1,
-0.3195798, -1.31824, -1.534516, 1, 1, 1, 1, 1,
-0.3195017, -0.3845105, -2.300297, 1, 1, 1, 1, 1,
-0.318367, -1.504207, -2.09705, 1, 1, 1, 1, 1,
-0.3170826, -1.715043, -3.56992, 1, 1, 1, 1, 1,
-0.3161528, 0.05414801, -1.757367, 1, 1, 1, 1, 1,
-0.3159607, 2.470229, -0.5298966, 1, 1, 1, 1, 1,
-0.3139279, -0.9704698, -1.340018, 1, 1, 1, 1, 1,
-0.313173, -0.8662289, -4.02651, 1, 1, 1, 1, 1,
-0.309, 0.5804546, -1.267694, 0, 0, 1, 1, 1,
-0.308918, 0.5997798, -0.0691975, 1, 0, 0, 1, 1,
-0.3042539, 1.623087, 0.1746909, 1, 0, 0, 1, 1,
-0.3011528, 0.06388786, -0.4238971, 1, 0, 0, 1, 1,
-0.2953609, -0.2415436, -2.122898, 1, 0, 0, 1, 1,
-0.2905525, -0.6932389, -3.159756, 1, 0, 0, 1, 1,
-0.2881598, 1.261024, 0.7576679, 0, 0, 0, 1, 1,
-0.2881334, 2.365636, 0.0812967, 0, 0, 0, 1, 1,
-0.2840095, -1.26737, -4.597138, 0, 0, 0, 1, 1,
-0.2831321, 1.750876, 0.07142767, 0, 0, 0, 1, 1,
-0.2672787, 1.13214, -0.06096675, 0, 0, 0, 1, 1,
-0.2569699, 0.6341803, -0.006111831, 0, 0, 0, 1, 1,
-0.2508241, 0.9859175, -0.2337688, 0, 0, 0, 1, 1,
-0.2478249, -0.09503863, -1.68647, 1, 1, 1, 1, 1,
-0.2470925, 0.1785013, 0.6463861, 1, 1, 1, 1, 1,
-0.244195, 2.141358, -0.4229367, 1, 1, 1, 1, 1,
-0.2351841, 0.4856171, -2.288314, 1, 1, 1, 1, 1,
-0.2320354, 0.03350968, -3.505282, 1, 1, 1, 1, 1,
-0.2317918, 0.8463188, 1.223206, 1, 1, 1, 1, 1,
-0.2314774, -0.2699053, -3.171983, 1, 1, 1, 1, 1,
-0.2301071, -0.3611052, -1.869795, 1, 1, 1, 1, 1,
-0.2292109, -0.06867804, 0.2365028, 1, 1, 1, 1, 1,
-0.2278899, 1.606797, -1.615108, 1, 1, 1, 1, 1,
-0.2243325, -1.908542, -2.565838, 1, 1, 1, 1, 1,
-0.2240826, 2.23967, 0.7191607, 1, 1, 1, 1, 1,
-0.2223322, -0.9182327, -3.087059, 1, 1, 1, 1, 1,
-0.2202878, -0.4992379, -3.565713, 1, 1, 1, 1, 1,
-0.2200584, -1.254117, -2.287399, 1, 1, 1, 1, 1,
-0.2167057, 0.7877243, -0.4179931, 0, 0, 1, 1, 1,
-0.2094337, -1.607775, -2.020047, 1, 0, 0, 1, 1,
-0.2057998, 1.230473, 0.1050019, 1, 0, 0, 1, 1,
-0.2024814, 1.33621, 0.1457847, 1, 0, 0, 1, 1,
-0.202136, 0.1024264, -0.8687623, 1, 0, 0, 1, 1,
-0.2004595, -0.809038, -1.536916, 1, 0, 0, 1, 1,
-0.1998871, 1.836225, 0.08252197, 0, 0, 0, 1, 1,
-0.1916751, -1.49899, -3.593817, 0, 0, 0, 1, 1,
-0.1907276, 0.3759137, -2.05055, 0, 0, 0, 1, 1,
-0.1893594, 1.097375, -1.437314, 0, 0, 0, 1, 1,
-0.1880275, -0.9078717, -3.306024, 0, 0, 0, 1, 1,
-0.1863278, 1.657223, 0.4695992, 0, 0, 0, 1, 1,
-0.1810847, -1.455712, -1.351399, 0, 0, 0, 1, 1,
-0.1800109, 1.11824, -0.2442895, 1, 1, 1, 1, 1,
-0.1775184, -1.524803, -4.991137, 1, 1, 1, 1, 1,
-0.1758922, 2.261335, 0.05695171, 1, 1, 1, 1, 1,
-0.1684843, 0.6043361, 1.028314, 1, 1, 1, 1, 1,
-0.1618205, -0.1278744, -0.2621993, 1, 1, 1, 1, 1,
-0.1608986, -0.1498182, -2.442551, 1, 1, 1, 1, 1,
-0.1545199, 0.1429208, -0.9227532, 1, 1, 1, 1, 1,
-0.153463, -0.7616904, -2.636457, 1, 1, 1, 1, 1,
-0.1530146, -0.6107128, -3.448126, 1, 1, 1, 1, 1,
-0.1516921, -0.0214762, -2.985178, 1, 1, 1, 1, 1,
-0.1513592, 0.1899673, -3.143046, 1, 1, 1, 1, 1,
-0.1505634, -0.08353911, -4.217021, 1, 1, 1, 1, 1,
-0.1500584, 0.7941347, 1.035678, 1, 1, 1, 1, 1,
-0.1482643, 0.02651702, -0.9044288, 1, 1, 1, 1, 1,
-0.1370591, -0.2550109, -3.230451, 1, 1, 1, 1, 1,
-0.1353106, 0.04455393, -0.5671654, 0, 0, 1, 1, 1,
-0.1294702, 0.01995798, -0.9843349, 1, 0, 0, 1, 1,
-0.1283597, 0.03453847, -0.8369236, 1, 0, 0, 1, 1,
-0.1251455, 0.2492031, -1.029134, 1, 0, 0, 1, 1,
-0.1220943, 0.6888019, 0.7684669, 1, 0, 0, 1, 1,
-0.1204304, 0.9755847, -0.5469039, 1, 0, 0, 1, 1,
-0.1176625, 0.3996514, -0.06229842, 0, 0, 0, 1, 1,
-0.1147077, 1.894675, -0.2950393, 0, 0, 0, 1, 1,
-0.1117066, 0.7193949, -0.1604035, 0, 0, 0, 1, 1,
-0.1090559, 1.432214, 1.627272, 0, 0, 0, 1, 1,
-0.1087285, 2.600389, 0.4940162, 0, 0, 0, 1, 1,
-0.09996804, -1.468602, -3.092815, 0, 0, 0, 1, 1,
-0.09970237, 0.4823538, -1.081089, 0, 0, 0, 1, 1,
-0.09967551, 0.098835, -0.6018174, 1, 1, 1, 1, 1,
-0.09641016, -0.3001029, -3.221485, 1, 1, 1, 1, 1,
-0.09641001, -0.366639, -3.745612, 1, 1, 1, 1, 1,
-0.09366338, 1.833301, -0.9481926, 1, 1, 1, 1, 1,
-0.09314629, -0.6662234, -3.696142, 1, 1, 1, 1, 1,
-0.09236894, -0.07389322, -3.677196, 1, 1, 1, 1, 1,
-0.09041878, -0.2127651, -2.07728, 1, 1, 1, 1, 1,
-0.08841044, -0.1930322, -4.4642, 1, 1, 1, 1, 1,
-0.08580469, 0.2193816, -0.2621602, 1, 1, 1, 1, 1,
-0.08345523, 0.1956637, 0.4063131, 1, 1, 1, 1, 1,
-0.07494382, 0.9177166, -2.068882, 1, 1, 1, 1, 1,
-0.07209143, 0.07603185, -1.794239, 1, 1, 1, 1, 1,
-0.07113385, 0.3915214, 0.3747657, 1, 1, 1, 1, 1,
-0.07073155, 1.167858, 0.3136832, 1, 1, 1, 1, 1,
-0.06760383, -0.2456214, -4.125607, 1, 1, 1, 1, 1,
-0.06257039, -0.4966255, -2.719511, 0, 0, 1, 1, 1,
-0.06161224, -1.043958, -3.415583, 1, 0, 0, 1, 1,
-0.05802362, 0.6772851, 0.03462001, 1, 0, 0, 1, 1,
-0.0492466, -0.4408232, -2.756132, 1, 0, 0, 1, 1,
-0.048049, -0.8240342, -2.846201, 1, 0, 0, 1, 1,
-0.04556352, 0.8108236, -0.51608, 1, 0, 0, 1, 1,
-0.04297132, -0.08240207, -1.759024, 0, 0, 0, 1, 1,
-0.0426346, 0.9778458, -0.1997467, 0, 0, 0, 1, 1,
-0.04007919, 0.881564, -1.045454, 0, 0, 0, 1, 1,
-0.03968022, 0.8529663, -0.1364829, 0, 0, 0, 1, 1,
-0.03014757, -1.649496, -2.784852, 0, 0, 0, 1, 1,
-0.02797137, -0.6862559, -4.072664, 0, 0, 0, 1, 1,
-0.02245632, -2.482274, -3.418421, 0, 0, 0, 1, 1,
-0.02095814, 0.2044338, 0.7236386, 1, 1, 1, 1, 1,
-0.0191567, 0.9243364, 1.149758, 1, 1, 1, 1, 1,
-0.01668177, -0.5463355, -2.637724, 1, 1, 1, 1, 1,
-0.01616738, -0.577283, -2.41306, 1, 1, 1, 1, 1,
-0.01436776, -0.4741887, -1.895301, 1, 1, 1, 1, 1,
-0.01396695, 0.03345882, 1.922338, 1, 1, 1, 1, 1,
-0.01385926, -1.114772, -3.430138, 1, 1, 1, 1, 1,
-0.006100443, 0.5851644, 1.309874, 1, 1, 1, 1, 1,
-0.003861455, -0.6866872, -4.089624, 1, 1, 1, 1, 1,
-0.003727951, -0.1689416, -4.67272, 1, 1, 1, 1, 1,
-0.003390071, 0.3332663, 0.3997003, 1, 1, 1, 1, 1,
-0.002562956, -1.347465, -2.601873, 1, 1, 1, 1, 1,
0.0004140551, 0.5653901, -0.7142166, 1, 1, 1, 1, 1,
0.002969487, 0.3176269, -0.0294026, 1, 1, 1, 1, 1,
0.005229981, 0.4869336, -0.8354834, 1, 1, 1, 1, 1,
0.00676459, 0.663893, 0.5275166, 0, 0, 1, 1, 1,
0.0100875, 1.39926, 0.9669452, 1, 0, 0, 1, 1,
0.01366604, 0.1100511, -0.7293563, 1, 0, 0, 1, 1,
0.01445786, 0.9546666, 0.5004068, 1, 0, 0, 1, 1,
0.02005704, -0.4523764, 3.60393, 1, 0, 0, 1, 1,
0.02306749, -0.268826, 3.44938, 1, 0, 0, 1, 1,
0.02855582, -0.08465476, 3.528192, 0, 0, 0, 1, 1,
0.03203022, -0.7557517, 3.512296, 0, 0, 0, 1, 1,
0.04399429, -1.016334, 3.496423, 0, 0, 0, 1, 1,
0.04875639, -1.238388, 3.47671, 0, 0, 0, 1, 1,
0.05369019, 0.9241845, -0.3157105, 0, 0, 0, 1, 1,
0.05380053, -0.2103434, 2.945313, 0, 0, 0, 1, 1,
0.05750565, 0.9941285, 0.07744315, 0, 0, 0, 1, 1,
0.06280662, 1.179779, -0.2944402, 1, 1, 1, 1, 1,
0.06629647, 0.8793578, -0.04915101, 1, 1, 1, 1, 1,
0.06636392, -0.2339772, 2.287574, 1, 1, 1, 1, 1,
0.06666376, 1.807693, -0.9544778, 1, 1, 1, 1, 1,
0.06841587, 0.9575985, 0.4488444, 1, 1, 1, 1, 1,
0.06959569, 1.451064, 0.6245191, 1, 1, 1, 1, 1,
0.07933298, 0.127524, 0.4377588, 1, 1, 1, 1, 1,
0.08119831, -1.067745, 2.814979, 1, 1, 1, 1, 1,
0.08154903, 0.5278073, -0.1201596, 1, 1, 1, 1, 1,
0.08194302, 0.6789128, -0.3397869, 1, 1, 1, 1, 1,
0.08789648, -0.4853377, 3.559264, 1, 1, 1, 1, 1,
0.08805886, 1.17072, 0.3931223, 1, 1, 1, 1, 1,
0.08969611, 0.3658358, 0.5915738, 1, 1, 1, 1, 1,
0.09784996, -0.3052002, 1.815173, 1, 1, 1, 1, 1,
0.1009772, -1.30049, 3.199647, 1, 1, 1, 1, 1,
0.1018409, 2.309463, 1.541257, 0, 0, 1, 1, 1,
0.1030459, 0.5583049, -0.06188411, 1, 0, 0, 1, 1,
0.1056569, -0.4185715, 4.216122, 1, 0, 0, 1, 1,
0.1077563, 0.3822831, -0.6338671, 1, 0, 0, 1, 1,
0.1089567, -1.39664, 1.054561, 1, 0, 0, 1, 1,
0.1093998, -0.1088924, 4.540066, 1, 0, 0, 1, 1,
0.1120373, 0.03932003, 2.335764, 0, 0, 0, 1, 1,
0.1158172, 0.743281, -1.117668, 0, 0, 0, 1, 1,
0.1239142, -1.036761, 2.419781, 0, 0, 0, 1, 1,
0.1271747, -0.3774094, 2.754512, 0, 0, 0, 1, 1,
0.1351692, 0.7925544, 0.4122423, 0, 0, 0, 1, 1,
0.1357303, 2.331597, 0.609347, 0, 0, 0, 1, 1,
0.1359128, 0.8020243, 1.678103, 0, 0, 0, 1, 1,
0.1365857, 0.2373734, 0.3412979, 1, 1, 1, 1, 1,
0.1371116, -0.5665179, 3.914852, 1, 1, 1, 1, 1,
0.1405609, 0.3069142, 0.6528169, 1, 1, 1, 1, 1,
0.140564, -0.006815459, 0.177826, 1, 1, 1, 1, 1,
0.1440089, -1.663365, 2.712384, 1, 1, 1, 1, 1,
0.1452514, 0.5765358, 0.1381129, 1, 1, 1, 1, 1,
0.1458551, 0.01228443, 3.190912, 1, 1, 1, 1, 1,
0.1465897, 0.008822229, 2.363212, 1, 1, 1, 1, 1,
0.1480419, 1.139614, 0.293629, 1, 1, 1, 1, 1,
0.1487561, 0.5881146, -0.6164983, 1, 1, 1, 1, 1,
0.1501373, -1.034438, 4.076035, 1, 1, 1, 1, 1,
0.1513715, 0.6363694, 1.404069, 1, 1, 1, 1, 1,
0.1606008, 0.6055337, -1.776709, 1, 1, 1, 1, 1,
0.162699, 0.7014412, 0.9318509, 1, 1, 1, 1, 1,
0.1735286, 1.446283, 1.103951, 1, 1, 1, 1, 1,
0.1758414, 1.543201, 0.2337343, 0, 0, 1, 1, 1,
0.1764265, -0.3538958, 1.313036, 1, 0, 0, 1, 1,
0.1778417, -0.7966714, 5.219667, 1, 0, 0, 1, 1,
0.18027, 0.3916219, 0.1067339, 1, 0, 0, 1, 1,
0.1812839, 0.50844, 0.2162189, 1, 0, 0, 1, 1,
0.1832896, -0.5246519, 1.121816, 1, 0, 0, 1, 1,
0.1836433, -1.887052, 2.948359, 0, 0, 0, 1, 1,
0.1854128, -0.453274, 3.300984, 0, 0, 0, 1, 1,
0.1908717, -0.9909088, 4.8994, 0, 0, 0, 1, 1,
0.1910446, -0.913913, 1.717953, 0, 0, 0, 1, 1,
0.1913161, -0.7454953, 4.918073, 0, 0, 0, 1, 1,
0.1994425, 1.094881, 0.5981938, 0, 0, 0, 1, 1,
0.1995066, 1.612527, -0.4544744, 0, 0, 0, 1, 1,
0.2042608, 0.604423, 1.253591, 1, 1, 1, 1, 1,
0.2066031, -0.4341323, 2.85833, 1, 1, 1, 1, 1,
0.2067432, -2.228967, 4.250325, 1, 1, 1, 1, 1,
0.2097876, 0.1943228, 2.331207, 1, 1, 1, 1, 1,
0.2100727, -1.692442, 2.647863, 1, 1, 1, 1, 1,
0.2110602, -0.0994072, 2.233231, 1, 1, 1, 1, 1,
0.2125483, -0.4932637, 3.458101, 1, 1, 1, 1, 1,
0.2213567, -1.018877, 3.89532, 1, 1, 1, 1, 1,
0.2221677, 0.7712186, 0.07058293, 1, 1, 1, 1, 1,
0.2233452, -0.03420276, 1.911265, 1, 1, 1, 1, 1,
0.2243748, 0.4454406, 0.7695277, 1, 1, 1, 1, 1,
0.2287482, -0.2343959, 1.985565, 1, 1, 1, 1, 1,
0.2298653, 0.5003741, 0.439113, 1, 1, 1, 1, 1,
0.2311116, -0.8513318, 3.194264, 1, 1, 1, 1, 1,
0.2339428, -1.344738, 2.9034, 1, 1, 1, 1, 1,
0.2368557, -0.82986, 3.330232, 0, 0, 1, 1, 1,
0.2381522, -1.100841, 3.895199, 1, 0, 0, 1, 1,
0.2401763, -0.2724851, 0.6706992, 1, 0, 0, 1, 1,
0.241168, -0.7180237, 3.267111, 1, 0, 0, 1, 1,
0.2433892, 0.6124046, 0.284964, 1, 0, 0, 1, 1,
0.2439851, -1.35959, 4.455711, 1, 0, 0, 1, 1,
0.2460923, -0.5328272, 1.10052, 0, 0, 0, 1, 1,
0.2479187, 0.8598386, -1.700398, 0, 0, 0, 1, 1,
0.2503202, 0.1239832, 1.31364, 0, 0, 0, 1, 1,
0.2519251, -2.166272, 4.157184, 0, 0, 0, 1, 1,
0.2551247, -0.9974982, 2.67553, 0, 0, 0, 1, 1,
0.2558578, 0.06245046, 2.246576, 0, 0, 0, 1, 1,
0.2585219, -0.4922582, 4.243655, 0, 0, 0, 1, 1,
0.2666121, 1.25435, -1.713869, 1, 1, 1, 1, 1,
0.2680107, 0.2187357, 1.631916, 1, 1, 1, 1, 1,
0.2709473, 1.360206, -1.4418, 1, 1, 1, 1, 1,
0.2778938, 0.5958595, -0.5947219, 1, 1, 1, 1, 1,
0.285105, 1.213328, 1.19368, 1, 1, 1, 1, 1,
0.2862024, -1.20803, 2.227156, 1, 1, 1, 1, 1,
0.286458, 1.340248, 1.862686, 1, 1, 1, 1, 1,
0.2864934, 0.2954792, 1.112079, 1, 1, 1, 1, 1,
0.2880588, -0.8633749, 3.845888, 1, 1, 1, 1, 1,
0.2914201, 0.1453028, 0.1180347, 1, 1, 1, 1, 1,
0.298347, 0.4790365, -0.4212684, 1, 1, 1, 1, 1,
0.2986622, -0.3182534, 2.473871, 1, 1, 1, 1, 1,
0.3035684, 0.04857837, 0.1364337, 1, 1, 1, 1, 1,
0.306961, 1.055607, 1.110385, 1, 1, 1, 1, 1,
0.3121125, -1.077504, 3.116509, 1, 1, 1, 1, 1,
0.3195227, -2.585378, 2.841546, 0, 0, 1, 1, 1,
0.3195652, -0.4865932, 4.15887, 1, 0, 0, 1, 1,
0.3212042, -0.5328457, 2.343852, 1, 0, 0, 1, 1,
0.322412, 1.904974, 0.1184819, 1, 0, 0, 1, 1,
0.323853, -0.1757464, 0.5994771, 1, 0, 0, 1, 1,
0.326362, 1.829136, 0.2567993, 1, 0, 0, 1, 1,
0.3266596, 0.5496575, 0.5725995, 0, 0, 0, 1, 1,
0.3267558, 0.5112922, 0.903733, 0, 0, 0, 1, 1,
0.3280406, -0.02142204, 1.334948, 0, 0, 0, 1, 1,
0.3316994, -0.1822803, 1.151606, 0, 0, 0, 1, 1,
0.3318917, -2.344002, 2.275039, 0, 0, 0, 1, 1,
0.336035, 0.6904086, -1.672609, 0, 0, 0, 1, 1,
0.3364541, 1.123043, -0.2367556, 0, 0, 0, 1, 1,
0.3412799, 0.2141996, 2.06902, 1, 1, 1, 1, 1,
0.342668, -0.8408418, 2.809297, 1, 1, 1, 1, 1,
0.3495286, -0.8826129, 5.56002, 1, 1, 1, 1, 1,
0.3526917, 0.2372474, 1.561229, 1, 1, 1, 1, 1,
0.356678, -1.044726, 3.033826, 1, 1, 1, 1, 1,
0.3609468, -1.079149, 2.674632, 1, 1, 1, 1, 1,
0.3635035, -1.686027, 4.528971, 1, 1, 1, 1, 1,
0.3651671, 2.565504, 0.521284, 1, 1, 1, 1, 1,
0.3701331, -0.207185, 2.297474, 1, 1, 1, 1, 1,
0.3753811, -0.7198951, 1.722686, 1, 1, 1, 1, 1,
0.3814054, 0.8786262, 1.449209, 1, 1, 1, 1, 1,
0.3851207, 0.005163369, 1.155333, 1, 1, 1, 1, 1,
0.3874022, -1.053428, 2.614491, 1, 1, 1, 1, 1,
0.3900861, -0.1556002, 2.868181, 1, 1, 1, 1, 1,
0.3905167, 0.3427564, 1.563347, 1, 1, 1, 1, 1,
0.3925824, 0.4601892, 0.6557966, 0, 0, 1, 1, 1,
0.3933756, -0.6657631, 2.86192, 1, 0, 0, 1, 1,
0.4031941, -0.9225286, 2.174169, 1, 0, 0, 1, 1,
0.4033796, 2.234706, 1.083004, 1, 0, 0, 1, 1,
0.4050003, -0.07624792, 1.550746, 1, 0, 0, 1, 1,
0.4061372, 0.7505166, -0.7369684, 1, 0, 0, 1, 1,
0.409785, 1.55924, 1.451951, 0, 0, 0, 1, 1,
0.4116715, 1.719853, -0.2510183, 0, 0, 0, 1, 1,
0.4135831, -0.8412012, 1.333153, 0, 0, 0, 1, 1,
0.4209875, -0.248626, 3.003719, 0, 0, 0, 1, 1,
0.4343866, 0.3372722, 2.067907, 0, 0, 0, 1, 1,
0.4346318, -0.1451531, 0.9828264, 0, 0, 0, 1, 1,
0.4353319, -0.1236085, 2.786788, 0, 0, 0, 1, 1,
0.4365404, 1.65475, -0.6731712, 1, 1, 1, 1, 1,
0.443507, 0.7888594, 1.794995, 1, 1, 1, 1, 1,
0.4459158, 0.7257818, 0.259007, 1, 1, 1, 1, 1,
0.4477208, -1.434192, 2.913498, 1, 1, 1, 1, 1,
0.458048, 0.02234766, -0.3456673, 1, 1, 1, 1, 1,
0.4583987, 0.0391073, -0.1837843, 1, 1, 1, 1, 1,
0.4588268, 1.026349, 0.6731042, 1, 1, 1, 1, 1,
0.4627682, -1.868986, 2.457335, 1, 1, 1, 1, 1,
0.4635756, 0.3887492, -0.933349, 1, 1, 1, 1, 1,
0.4638835, -0.257099, 0.7947772, 1, 1, 1, 1, 1,
0.46725, -0.7935744, 3.403301, 1, 1, 1, 1, 1,
0.4782916, -0.6546617, 2.613604, 1, 1, 1, 1, 1,
0.478929, 1.513335, 1.266319, 1, 1, 1, 1, 1,
0.4797626, -0.2570468, 1.626324, 1, 1, 1, 1, 1,
0.4862535, 0.7064549, 2.080508, 1, 1, 1, 1, 1,
0.4872045, -0.01491593, 1.027061, 0, 0, 1, 1, 1,
0.4935715, -0.8531941, 3.021204, 1, 0, 0, 1, 1,
0.4947815, 0.8019736, 1.958137, 1, 0, 0, 1, 1,
0.4960047, 0.9683234, -0.4361496, 1, 0, 0, 1, 1,
0.500973, 1.959731, -0.07320776, 1, 0, 0, 1, 1,
0.5140295, -0.2448952, 2.654262, 1, 0, 0, 1, 1,
0.5140502, -0.04005095, 1.459411, 0, 0, 0, 1, 1,
0.5159842, 1.430677, 0.1554604, 0, 0, 0, 1, 1,
0.523324, -0.9657651, 2.850381, 0, 0, 0, 1, 1,
0.5233836, 2.331687, 1.855367, 0, 0, 0, 1, 1,
0.5281576, 0.6929294, 1.081717, 0, 0, 0, 1, 1,
0.5382266, -0.0166646, 2.808546, 0, 0, 0, 1, 1,
0.5418398, -0.8552736, 1.415939, 0, 0, 0, 1, 1,
0.5425002, -0.1685513, 2.723451, 1, 1, 1, 1, 1,
0.5462691, -0.356854, 3.188637, 1, 1, 1, 1, 1,
0.548683, -0.01584434, 2.04616, 1, 1, 1, 1, 1,
0.5492672, 0.4651349, -0.9200372, 1, 1, 1, 1, 1,
0.5506193, -0.5648099, 2.590796, 1, 1, 1, 1, 1,
0.556388, -0.6415895, 2.623184, 1, 1, 1, 1, 1,
0.5568125, 0.687824, 2.018191, 1, 1, 1, 1, 1,
0.557228, 0.2262495, 0.4482495, 1, 1, 1, 1, 1,
0.5595771, -0.3801742, 1.530051, 1, 1, 1, 1, 1,
0.5616386, 1.046353, 1.246024, 1, 1, 1, 1, 1,
0.5627598, 1.719436, -0.5132144, 1, 1, 1, 1, 1,
0.5657636, 0.3496785, 3.506656, 1, 1, 1, 1, 1,
0.5659375, 0.2090615, 2.007575, 1, 1, 1, 1, 1,
0.5717961, -0.1464301, 2.838813, 1, 1, 1, 1, 1,
0.5742557, 2.638172, 1.037605, 1, 1, 1, 1, 1,
0.5745314, -0.4840831, 1.885477, 0, 0, 1, 1, 1,
0.5755965, -0.08046784, 1.369033, 1, 0, 0, 1, 1,
0.5768501, 0.1156777, 0.06070269, 1, 0, 0, 1, 1,
0.5785456, -1.434193, 1.583464, 1, 0, 0, 1, 1,
0.5827534, 0.1382067, 1.514865, 1, 0, 0, 1, 1,
0.5841635, 0.3831493, -0.7693414, 1, 0, 0, 1, 1,
0.5937603, -1.509658, 0.05923624, 0, 0, 0, 1, 1,
0.5944157, 0.8672972, 1.510302, 0, 0, 0, 1, 1,
0.6052665, -0.8899153, 3.275275, 0, 0, 0, 1, 1,
0.6066871, -0.1633147, 2.329319, 0, 0, 0, 1, 1,
0.6091048, 1.655045, -0.5047559, 0, 0, 0, 1, 1,
0.6092451, -1.367972, 2.797963, 0, 0, 0, 1, 1,
0.6129245, -0.7520732, 3.02248, 0, 0, 0, 1, 1,
0.6165389, 0.7729726, 0.6014301, 1, 1, 1, 1, 1,
0.6179426, 0.7183782, 2.535486, 1, 1, 1, 1, 1,
0.6187265, 1.046919, -0.1368087, 1, 1, 1, 1, 1,
0.6214068, -0.6369801, 2.109231, 1, 1, 1, 1, 1,
0.6224339, 0.02675226, 2.045292, 1, 1, 1, 1, 1,
0.6235946, 0.3591856, 2.21377, 1, 1, 1, 1, 1,
0.6259319, 0.3341835, 1.169592, 1, 1, 1, 1, 1,
0.6329262, -1.13357, 0.5081466, 1, 1, 1, 1, 1,
0.6376731, -0.05674675, 0.9964317, 1, 1, 1, 1, 1,
0.6391183, -0.24505, 1.620844, 1, 1, 1, 1, 1,
0.642446, -2.252892, 1.453356, 1, 1, 1, 1, 1,
0.6450002, -1.662015, 2.714242, 1, 1, 1, 1, 1,
0.6484522, 1.66112, 0.5332552, 1, 1, 1, 1, 1,
0.652544, 0.4335927, 3.260139, 1, 1, 1, 1, 1,
0.6544602, 1.198049, -0.05234079, 1, 1, 1, 1, 1,
0.6549335, -1.483236, 3.695867, 0, 0, 1, 1, 1,
0.6562057, 0.7133806, -0.03982479, 1, 0, 0, 1, 1,
0.6572676, 1.013649, -0.4019333, 1, 0, 0, 1, 1,
0.6608843, 1.364906, 1.292341, 1, 0, 0, 1, 1,
0.6683306, 1.135888, 0.5533502, 1, 0, 0, 1, 1,
0.6702881, 0.01316385, 1.568996, 1, 0, 0, 1, 1,
0.6737742, -1.485492, 3.252736, 0, 0, 0, 1, 1,
0.6759618, -1.164097, 3.000532, 0, 0, 0, 1, 1,
0.6770288, -1.33596, 0.9475659, 0, 0, 0, 1, 1,
0.6775898, 1.386276, 1.443852, 0, 0, 0, 1, 1,
0.6799845, 0.2385563, 0.3796604, 0, 0, 0, 1, 1,
0.6814935, 0.8067099, 0.3066426, 0, 0, 0, 1, 1,
0.6892106, -0.7240915, 1.853017, 0, 0, 0, 1, 1,
0.6901492, 1.477372, 0.379632, 1, 1, 1, 1, 1,
0.6923799, -0.8326722, 2.971481, 1, 1, 1, 1, 1,
0.6926609, 0.06835617, 2.971198, 1, 1, 1, 1, 1,
0.6939089, 0.3863819, 0.3845712, 1, 1, 1, 1, 1,
0.6940807, -0.01049908, 2.045636, 1, 1, 1, 1, 1,
0.6947526, 1.112583, 0.9457998, 1, 1, 1, 1, 1,
0.6951088, -0.798041, 2.843196, 1, 1, 1, 1, 1,
0.7006965, -0.1801199, 3.331918, 1, 1, 1, 1, 1,
0.7043562, -0.713712, 4.037944, 1, 1, 1, 1, 1,
0.7144753, -0.8063297, 2.281699, 1, 1, 1, 1, 1,
0.71747, -0.7497137, 3.036711, 1, 1, 1, 1, 1,
0.7187489, 1.612143, 0.1624361, 1, 1, 1, 1, 1,
0.7207591, -0.5068122, 3.46733, 1, 1, 1, 1, 1,
0.7224804, 0.1232231, 1.512489, 1, 1, 1, 1, 1,
0.7242134, 1.662642, -1.165934, 1, 1, 1, 1, 1,
0.725444, -1.837337, 1.90713, 0, 0, 1, 1, 1,
0.7257633, 1.364229, 0.03236172, 1, 0, 0, 1, 1,
0.7271225, 0.4891226, -0.1809785, 1, 0, 0, 1, 1,
0.7296606, -0.2806333, 1.237923, 1, 0, 0, 1, 1,
0.7333176, -1.119932, 0.8828421, 1, 0, 0, 1, 1,
0.7365751, -1.870447, 0.7827908, 1, 0, 0, 1, 1,
0.7367666, -0.9376737, 1.274604, 0, 0, 0, 1, 1,
0.7418573, -0.9173782, 2.651481, 0, 0, 0, 1, 1,
0.7471672, -0.9333445, 2.063852, 0, 0, 0, 1, 1,
0.7476504, 0.3088754, 1.591015, 0, 0, 0, 1, 1,
0.7520551, -0.1480685, 0.6283254, 0, 0, 0, 1, 1,
0.7576827, 0.5311921, -1.577449, 0, 0, 0, 1, 1,
0.7664635, 0.7905403, -0.5855173, 0, 0, 0, 1, 1,
0.7778466, -0.4036582, 1.425664, 1, 1, 1, 1, 1,
0.7780105, 0.2028955, 0.08221653, 1, 1, 1, 1, 1,
0.782811, 0.7192611, 0.705, 1, 1, 1, 1, 1,
0.7885756, 0.9379816, -0.03051252, 1, 1, 1, 1, 1,
0.7924612, 0.4384339, 0.2671296, 1, 1, 1, 1, 1,
0.7930464, -0.6601337, 2.807796, 1, 1, 1, 1, 1,
0.8044687, -2.466755, 1.469525, 1, 1, 1, 1, 1,
0.804711, 0.1064877, 1.1417, 1, 1, 1, 1, 1,
0.8086904, 0.5173188, 1.072681, 1, 1, 1, 1, 1,
0.8138925, 1.184257, 1.030508, 1, 1, 1, 1, 1,
0.8199169, -0.01843723, 3.246745, 1, 1, 1, 1, 1,
0.8243379, 1.028634, -0.141754, 1, 1, 1, 1, 1,
0.8279294, -2.158601, 1.275754, 1, 1, 1, 1, 1,
0.8281775, 0.7945019, 0.811175, 1, 1, 1, 1, 1,
0.8294533, 1.911857, 0.2823354, 1, 1, 1, 1, 1,
0.8302417, 0.305348, 1.149402, 0, 0, 1, 1, 1,
0.8312745, 0.9518913, 1.598988, 1, 0, 0, 1, 1,
0.8382894, 0.6806414, -0.01168795, 1, 0, 0, 1, 1,
0.8526222, -0.09700666, 2.158071, 1, 0, 0, 1, 1,
0.8526556, 1.192314, -0.1017773, 1, 0, 0, 1, 1,
0.8563794, -0.2414152, 1.269215, 1, 0, 0, 1, 1,
0.859272, -0.05794477, 2.582619, 0, 0, 0, 1, 1,
0.8650171, 0.4892536, 0.5190703, 0, 0, 0, 1, 1,
0.8659302, 2.746628, 1.556126, 0, 0, 0, 1, 1,
0.8706285, -0.704612, 2.666441, 0, 0, 0, 1, 1,
0.8721098, 0.1666674, 0.9916553, 0, 0, 0, 1, 1,
0.8728197, -0.1263976, 0.6276068, 0, 0, 0, 1, 1,
0.8739671, -1.500378, 3.698305, 0, 0, 0, 1, 1,
0.8829917, -0.5159347, 2.373477, 1, 1, 1, 1, 1,
0.8942492, -0.7161552, 3.385592, 1, 1, 1, 1, 1,
0.8952635, -1.41335, 1.832957, 1, 1, 1, 1, 1,
0.9005728, 0.01338923, 1.885465, 1, 1, 1, 1, 1,
0.9047626, -0.3319941, 1.674062, 1, 1, 1, 1, 1,
0.9120517, 0.7757472, 0.4161761, 1, 1, 1, 1, 1,
0.912744, 0.2429298, 1.766634, 1, 1, 1, 1, 1,
0.9146638, -0.7116661, 2.789421, 1, 1, 1, 1, 1,
0.9162333, 1.892293, 0.4701951, 1, 1, 1, 1, 1,
0.9172018, -0.3764879, 2.580335, 1, 1, 1, 1, 1,
0.917511, 0.6649292, 2.296277, 1, 1, 1, 1, 1,
0.9191913, -0.5064033, 2.62577, 1, 1, 1, 1, 1,
0.9211753, 0.4459061, 0.7637837, 1, 1, 1, 1, 1,
0.9249384, 1.067973, 1.318803, 1, 1, 1, 1, 1,
0.9286302, 0.8180526, 1.349927, 1, 1, 1, 1, 1,
0.9307436, 0.197189, 0.8096061, 0, 0, 1, 1, 1,
0.935679, -0.1373523, -0.2459886, 1, 0, 0, 1, 1,
0.9363604, -0.02828032, 3.658014, 1, 0, 0, 1, 1,
0.9418173, 1.069048, -0.6118873, 1, 0, 0, 1, 1,
0.9457409, 0.7303692, -0.15089, 1, 0, 0, 1, 1,
0.9461628, 0.2595657, 0.6743972, 1, 0, 0, 1, 1,
0.9528122, -1.999062, 4.265654, 0, 0, 0, 1, 1,
0.9531768, 0.8981459, 1.382099, 0, 0, 0, 1, 1,
0.9563931, -0.6928543, 1.963919, 0, 0, 0, 1, 1,
0.9602067, 0.421209, -0.1457595, 0, 0, 0, 1, 1,
0.9602937, -1.084318, 1.656764, 0, 0, 0, 1, 1,
0.9662898, 0.4018969, -0.3043143, 0, 0, 0, 1, 1,
0.968363, -1.11667, 2.81896, 0, 0, 0, 1, 1,
0.978399, 1.689699, 0.1211744, 1, 1, 1, 1, 1,
0.9857202, 0.04156147, 2.030342, 1, 1, 1, 1, 1,
0.9924842, -0.7346589, 0.824572, 1, 1, 1, 1, 1,
0.9942507, -0.560376, 2.506735, 1, 1, 1, 1, 1,
1.002703, -0.8289073, 0.8927037, 1, 1, 1, 1, 1,
1.01005, -0.1742124, 1.384572, 1, 1, 1, 1, 1,
1.011495, -2.618841, 3.289112, 1, 1, 1, 1, 1,
1.015523, 0.5036361, 1.590587, 1, 1, 1, 1, 1,
1.016512, 0.2696391, 2.384291, 1, 1, 1, 1, 1,
1.027992, -0.4953463, 2.000928, 1, 1, 1, 1, 1,
1.031525, 0.5387075, 2.128892, 1, 1, 1, 1, 1,
1.032255, -0.3383091, 1.081164, 1, 1, 1, 1, 1,
1.036884, -2.021274, 2.404737, 1, 1, 1, 1, 1,
1.045154, -0.2314471, 0.5744573, 1, 1, 1, 1, 1,
1.060837, -0.3892617, 3.120375, 1, 1, 1, 1, 1,
1.06715, -2.074817, 2.030628, 0, 0, 1, 1, 1,
1.07145, 1.120625, -0.6186761, 1, 0, 0, 1, 1,
1.07357, 1.708157, 0.2119353, 1, 0, 0, 1, 1,
1.07467, 1.210456, -1.412177, 1, 0, 0, 1, 1,
1.07661, -0.987878, 1.184719, 1, 0, 0, 1, 1,
1.077381, 0.06383526, 3.163912, 1, 0, 0, 1, 1,
1.080045, 0.3648408, 0.766174, 0, 0, 0, 1, 1,
1.080354, -0.2969667, 0.3084553, 0, 0, 0, 1, 1,
1.081421, 0.850743, 0.974766, 0, 0, 0, 1, 1,
1.08731, 0.892644, 2.317352, 0, 0, 0, 1, 1,
1.088693, -0.1050123, 2.261428, 0, 0, 0, 1, 1,
1.094923, -0.2881052, 1.309688, 0, 0, 0, 1, 1,
1.09538, 0.7376462, 0.8419161, 0, 0, 0, 1, 1,
1.097487, 1.269699, 0.706006, 1, 1, 1, 1, 1,
1.104501, -0.921281, 2.420686, 1, 1, 1, 1, 1,
1.10598, -0.4652027, 1.675414, 1, 1, 1, 1, 1,
1.107502, -1.259257, 2.557469, 1, 1, 1, 1, 1,
1.108865, 0.3938812, 2.518916, 1, 1, 1, 1, 1,
1.11856, -0.65372, 1.832139, 1, 1, 1, 1, 1,
1.12028, -0.1773354, 1.341699, 1, 1, 1, 1, 1,
1.121249, 0.405701, 1.981576, 1, 1, 1, 1, 1,
1.129238, 0.8446425, 0.7256507, 1, 1, 1, 1, 1,
1.144329, 1.170717, -0.5622324, 1, 1, 1, 1, 1,
1.146467, 0.3174509, 0.2497268, 1, 1, 1, 1, 1,
1.14864, -1.574996, 3.322639, 1, 1, 1, 1, 1,
1.151064, -0.8433248, 2.573015, 1, 1, 1, 1, 1,
1.158165, 1.138263, 1.904775, 1, 1, 1, 1, 1,
1.166012, 0.4690876, 1.472173, 1, 1, 1, 1, 1,
1.166873, -1.403805, 1.919181, 0, 0, 1, 1, 1,
1.168913, -1.651409, 1.539755, 1, 0, 0, 1, 1,
1.169331, 1.401826, 2.712705, 1, 0, 0, 1, 1,
1.180276, 1.244749, -0.9721971, 1, 0, 0, 1, 1,
1.181281, -0.1889555, 1.146412, 1, 0, 0, 1, 1,
1.182418, 0.2803175, -0.2303591, 1, 0, 0, 1, 1,
1.183233, -0.8825089, 2.364481, 0, 0, 0, 1, 1,
1.183921, -1.341589, 2.291107, 0, 0, 0, 1, 1,
1.186901, -1.285793, 2.163606, 0, 0, 0, 1, 1,
1.188296, 0.8912277, 1.902873, 0, 0, 0, 1, 1,
1.191821, -0.9577838, 1.44801, 0, 0, 0, 1, 1,
1.19895, 0.139194, 0.7963876, 0, 0, 0, 1, 1,
1.20468, 0.1229443, 3.124274, 0, 0, 0, 1, 1,
1.206982, -1.149443, 1.432599, 1, 1, 1, 1, 1,
1.20922, -0.0350437, 1.284984, 1, 1, 1, 1, 1,
1.209866, -0.5497789, 2.388137, 1, 1, 1, 1, 1,
1.214176, 0.8434743, 2.602818, 1, 1, 1, 1, 1,
1.217287, -0.6427134, 1.94408, 1, 1, 1, 1, 1,
1.219511, 1.928758, -0.2825683, 1, 1, 1, 1, 1,
1.221938, 1.795929, 0.9706748, 1, 1, 1, 1, 1,
1.230807, -0.4205726, 0.2790947, 1, 1, 1, 1, 1,
1.249117, -1.222489, 1.070517, 1, 1, 1, 1, 1,
1.254457, 2.480723, 0.2516924, 1, 1, 1, 1, 1,
1.25671, 2.282916, -0.4569071, 1, 1, 1, 1, 1,
1.261552, 1.714118, -0.3293614, 1, 1, 1, 1, 1,
1.276076, -0.4353467, 2.754896, 1, 1, 1, 1, 1,
1.277669, 0.7919898, 0.3355224, 1, 1, 1, 1, 1,
1.280851, -0.7475608, 2.716372, 1, 1, 1, 1, 1,
1.281457, 0.5246642, 0.1891685, 0, 0, 1, 1, 1,
1.319254, -0.450828, 1.775831, 1, 0, 0, 1, 1,
1.325405, -0.5209441, 3.628946, 1, 0, 0, 1, 1,
1.3392, -0.6737631, 1.537255, 1, 0, 0, 1, 1,
1.340613, 0.5710787, 1.164164, 1, 0, 0, 1, 1,
1.342052, 2.182652, -0.7055789, 1, 0, 0, 1, 1,
1.343686, 1.059154, 2.007423, 0, 0, 0, 1, 1,
1.343987, 1.442205, 0.7339081, 0, 0, 0, 1, 1,
1.344046, -0.06221525, 1.149474, 0, 0, 0, 1, 1,
1.346637, 0.7880464, 0.1433092, 0, 0, 0, 1, 1,
1.351955, 0.5318917, 0.4195133, 0, 0, 0, 1, 1,
1.369804, -0.5001771, 0.7404834, 0, 0, 0, 1, 1,
1.374884, 0.5200486, 0.8631905, 0, 0, 0, 1, 1,
1.384586, -0.06836715, 2.47212, 1, 1, 1, 1, 1,
1.389001, -0.03359805, 1.500141, 1, 1, 1, 1, 1,
1.394621, -1.535662, 3.10844, 1, 1, 1, 1, 1,
1.397461, 0.1241982, 2.346747, 1, 1, 1, 1, 1,
1.402049, 0.4471756, 1.507522, 1, 1, 1, 1, 1,
1.405573, 0.1694289, 1.173562, 1, 1, 1, 1, 1,
1.413139, -0.7077751, 0.9547928, 1, 1, 1, 1, 1,
1.414879, 3.315663, 0.7556159, 1, 1, 1, 1, 1,
1.425386, -0.7687322, 1.632964, 1, 1, 1, 1, 1,
1.426725, 0.03825643, 1.023903, 1, 1, 1, 1, 1,
1.439512, 2.669596, 2.946603, 1, 1, 1, 1, 1,
1.460548, -1.180289, 0.1299526, 1, 1, 1, 1, 1,
1.461921, -1.269462, 1.91884, 1, 1, 1, 1, 1,
1.468946, -1.15919, 1.101701, 1, 1, 1, 1, 1,
1.470453, -0.8693168, 2.006838, 1, 1, 1, 1, 1,
1.474598, 2.642072, -0.7857354, 0, 0, 1, 1, 1,
1.479241, 2.119575, 1.682884, 1, 0, 0, 1, 1,
1.482124, 1.027706, 2.183973, 1, 0, 0, 1, 1,
1.488526, -1.270393, 1.857424, 1, 0, 0, 1, 1,
1.494785, 0.2661417, 1.763171, 1, 0, 0, 1, 1,
1.501257, 0.7841539, 0.9608091, 1, 0, 0, 1, 1,
1.502769, -0.2397114, 2.778294, 0, 0, 0, 1, 1,
1.505276, -1.042091, 1.865386, 0, 0, 0, 1, 1,
1.515402, -0.1752123, 2.241832, 0, 0, 0, 1, 1,
1.521473, 0.8031313, 1.558128, 0, 0, 0, 1, 1,
1.522617, 1.743307, 0.2804891, 0, 0, 0, 1, 1,
1.530545, -1.212574, 3.126476, 0, 0, 0, 1, 1,
1.539612, 2.77317, -0.08858421, 0, 0, 0, 1, 1,
1.541345, -1.076161, 1.408549, 1, 1, 1, 1, 1,
1.543562, 1.914029, 0.7872002, 1, 1, 1, 1, 1,
1.556923, 1.295481, 0.5523496, 1, 1, 1, 1, 1,
1.582942, -1.460165, 2.010401, 1, 1, 1, 1, 1,
1.587196, 0.2747022, 1.885134, 1, 1, 1, 1, 1,
1.614238, 0.6988471, 0.1617439, 1, 1, 1, 1, 1,
1.62172, -1.667345, 4.396643, 1, 1, 1, 1, 1,
1.627443, 1.041529, 1.902482, 1, 1, 1, 1, 1,
1.639471, 0.5622045, 1.657363, 1, 1, 1, 1, 1,
1.639613, 2.346348, -0.09584981, 1, 1, 1, 1, 1,
1.64941, -0.3451208, 2.956943, 1, 1, 1, 1, 1,
1.655517, -0.177182, 2.196646, 1, 1, 1, 1, 1,
1.665112, -1.275475, 3.639145, 1, 1, 1, 1, 1,
1.667497, -1.323328, 2.629192, 1, 1, 1, 1, 1,
1.671196, -0.4495192, 1.713171, 1, 1, 1, 1, 1,
1.686333, 0.08341441, 1.702991, 0, 0, 1, 1, 1,
1.686659, -0.1692437, 2.615505, 1, 0, 0, 1, 1,
1.698067, -0.09654307, 1.990692, 1, 0, 0, 1, 1,
1.705302, -0.4528998, 0.9333532, 1, 0, 0, 1, 1,
1.712587, 0.2416205, 1.581689, 1, 0, 0, 1, 1,
1.717162, -0.3222651, 2.178185, 1, 0, 0, 1, 1,
1.730282, -2.039222, 2.683444, 0, 0, 0, 1, 1,
1.731173, -0.4227536, 2.490319, 0, 0, 0, 1, 1,
1.73904, -1.321635, 1.497143, 0, 0, 0, 1, 1,
1.741931, 2.734278, 0.7017898, 0, 0, 0, 1, 1,
1.743883, -0.4624398, 1.373488, 0, 0, 0, 1, 1,
1.749992, -1.288183, 3.26223, 0, 0, 0, 1, 1,
1.755872, -0.3953657, 2.129504, 0, 0, 0, 1, 1,
1.756138, 0.5083209, 0.7090017, 1, 1, 1, 1, 1,
1.807622, 0.6459985, 0.691085, 1, 1, 1, 1, 1,
1.814906, 0.6521011, 2.131377, 1, 1, 1, 1, 1,
1.816747, 0.03885937, 2.369846, 1, 1, 1, 1, 1,
1.820219, 1.672494, 0.7496896, 1, 1, 1, 1, 1,
1.82272, -0.9027552, 1.963696, 1, 1, 1, 1, 1,
1.828135, 2.811797, 0.5464479, 1, 1, 1, 1, 1,
1.853503, 0.4972828, 2.148453, 1, 1, 1, 1, 1,
1.857808, 0.3170407, 1.188598, 1, 1, 1, 1, 1,
1.886062, -0.6994998, 1.871303, 1, 1, 1, 1, 1,
1.917489, 0.07423864, -1.126452, 1, 1, 1, 1, 1,
1.923921, -2.287487, 1.725003, 1, 1, 1, 1, 1,
1.963005, -1.404527, 2.095275, 1, 1, 1, 1, 1,
2.000167, 1.24379, 0.5159644, 1, 1, 1, 1, 1,
2.035866, -0.1520904, 1.522509, 1, 1, 1, 1, 1,
2.051512, -0.9025813, 0.4671012, 0, 0, 1, 1, 1,
2.082093, 0.01684684, 1.030917, 1, 0, 0, 1, 1,
2.102796, 0.1474241, -0.717025, 1, 0, 0, 1, 1,
2.122834, -0.136501, 1.569736, 1, 0, 0, 1, 1,
2.146762, 0.6749052, 2.400284, 1, 0, 0, 1, 1,
2.185381, -1.017417, 0.2950571, 1, 0, 0, 1, 1,
2.217036, -0.5777177, 1.261025, 0, 0, 0, 1, 1,
2.297001, -1.627762, 3.084503, 0, 0, 0, 1, 1,
2.323555, 0.3063611, 1.053215, 0, 0, 0, 1, 1,
2.346551, -0.5916678, 0.8532934, 0, 0, 0, 1, 1,
2.3932, -1.073655, 2.592912, 0, 0, 0, 1, 1,
2.441581, 1.656136, -0.3666006, 0, 0, 0, 1, 1,
2.442747, 1.274095, 1.797961, 0, 0, 0, 1, 1,
2.49481, -1.190804, 1.177726, 1, 1, 1, 1, 1,
2.591484, -0.1811481, 0.03725692, 1, 1, 1, 1, 1,
2.682903, -1.784499, 0.6533741, 1, 1, 1, 1, 1,
2.698139, 1.420307, 3.209302, 1, 1, 1, 1, 1,
2.812255, 1.286512, 0.9173193, 1, 1, 1, 1, 1,
2.895827, 0.1412615, 1.781381, 1, 1, 1, 1, 1,
3.094815, 1.908691, 1.362166, 1, 1, 1, 1, 1
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
var radius = 9.707788;
var distance = 34.09819;
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
mvMatrix.translate( -0.0641669, 0.05347466, -0.03700233 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.09819);
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